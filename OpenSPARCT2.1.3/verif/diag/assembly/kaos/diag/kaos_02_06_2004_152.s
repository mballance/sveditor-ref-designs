/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_02_06_2004_152.s
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
#define T0_KAOS_SEED          d2b3e3aa2091
#define T0_KAOS_ICOUNT        4000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    960
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     4002

#define T0_KAOS_BOOT_VA                  0x30e54000
#define T0_KAOS_BOOT_PA                  0x0000000000818000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x26d14000
#define T0_KAOS_STARTUP_PA               0x00000000023c2000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x68262000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000055c8000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x21d10000
#define T0_KAOS_DONE_PA                  0x0000000007ef2000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x695a2000
#define T0_KAOS_KTBL_PA                  0x000000000836e000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x69596000
#define T0_KAOS_SUBR0_PA                 0x000000000a4be000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x69636000
#define T0_KAOS_SUBR1_PA                 0x000000000d818000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x697e6000
#define T0_KAOS_SUBR2_PA                 0x000000000fbe4000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x04646000
#define T0_KAOS_SUBR3_PA                 0x0000000010640000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x1320c000
#define T0_KAOS_EXP_REGS_PA              0x0000000012c7c000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x58c24000
#define T0_KAOS_RUN_REGS_PA              0x0000000014744000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x03e48000
#define T0_KAOS_EXP_STACK_PA             0x0000000016a1e000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x16586000
#define T0_KAOS_RUN_STACK_PA             0x000000001813c000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x2ce82000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a53e000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x1ff46000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c218000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x6e042000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000e24000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x6b4d0000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000014a6000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x22ca5256
#define T0_KAOS_RANVAL_01     0x4881649c
#define T0_KAOS_RANVAL_02     0x9ee386c1
#define T0_KAOS_RANVAL_03     0x9647684f
#define T0_KAOS_RANVAL_04     0x6d68b2a5
#define T0_KAOS_RANVAL_05     0x40678a85
#define T0_KAOS_RANVAL_06     0x50c34b10
#define T0_KAOS_RANVAL_07     0x4450e107
#define T0_KAOS_RANVAL_08     0x467584d9
#define T0_KAOS_RANVAL_09     0x74ee28a1
#define T0_KAOS_RANVAL_0a     0x027da380
#define T0_KAOS_RANVAL_0b     0xef29374e
#define T0_KAOS_RANVAL_0c     0x96b2145f
#define T0_KAOS_RANVAL_0d     0xebe69932
#define T0_KAOS_RANVAL_0e     0x9c045768
#define T0_KAOS_RANVAL_0f     0xf95693fe
#define T0_KAOS_RANVAL_10     0x83560c05
#define T0_KAOS_RANVAL_11     0xcaad98b2
#define T0_KAOS_RANVAL_12     0xc587efdd
#define T0_KAOS_RANVAL_13     0xb7f871de
#define T0_KAOS_RANVAL_14     0x9fa00687
#define T0_KAOS_RANVAL_15     0xf30dcccf
#define T0_KAOS_RANVAL_16     0x28e8cc6a
#define T0_KAOS_RANVAL_17     0x16772647
#define T0_KAOS_RANVAL_18     0x82861468
#define T0_KAOS_RANVAL_19     0x8f1537b6
#define T0_KAOS_RANVAL_1a     0xfbd84f00
#define T0_KAOS_RANVAL_1b     0x5110d00a
#define T0_KAOS_RANVAL_1c     0xc5884b06
#define T0_KAOS_RANVAL_1d     0xfbb81b94
#define T0_KAOS_RANVAL_1e     0x754c532b
#define T0_KAOS_RANVAL_1f     0xb00bd091
#define T0_KAOS_RANVAL_20     0xf734b0e8
#define T0_KAOS_RANVAL_21     0x46c01259
#define T0_KAOS_RANVAL_22     0x1c566486
#define T0_KAOS_RANVAL_23     0x3f353343
#define T0_KAOS_RANVAL_24     0x550d1b5a
#define T0_KAOS_RANVAL_25     0x772e5dbe
#define T0_KAOS_RANVAL_26     0x29936871
#define T0_KAOS_RANVAL_27     0x26d3a72d
#define T0_KAOS_RANVAL_28     0x5274d13c
#define T0_KAOS_RANVAL_29     0x7424b389
#define T0_KAOS_RANVAL_2a     0x467faf00
#define T0_KAOS_RANVAL_2b     0xe29deede
#define T0_KAOS_RANVAL_2c     0x46550715
#define T0_KAOS_RANVAL_2d     0x75d80a0f
#define T0_KAOS_RANVAL_2e     0xca469f36
#define T0_KAOS_RANVAL_2f     0x92cdea91
#define T0_KAOS_RANVAL_30     0x9c84886e
#define T0_KAOS_RANVAL_31     0x224528fa
#define T0_KAOS_RANVAL_32     0x99647272
#define T0_KAOS_RANVAL_33     0xe957a091
#define T0_KAOS_RANVAL_34     0xbbf0225d
#define T0_KAOS_RANVAL_35     0x7497024c
#define T0_KAOS_RANVAL_36     0x27e3b329
#define T0_KAOS_RANVAL_37     0x43dde7d9
#define T0_KAOS_RANVAL_38     0x6c46a35f
#define T0_KAOS_RANVAL_39     0x3eab17a3
#define T0_KAOS_RANVAL_3a     0xe46772d5
#define T0_KAOS_RANVAL_3b     0xc07498fa
#define T0_KAOS_RANVAL_3c     0xeec4846b
#define T0_KAOS_RANVAL_3d     0xe8206fbe
#define T0_KAOS_RANVAL_3e     0xcfce6b2c
#define T0_KAOS_RANVAL_3f     0x11da6941
#define T0_KAOS_RANVAL_40     0x92e88f43
#define T0_KAOS_RANVAL_41     0x3a21e03f
#define T0_KAOS_RANVAL_42     0xf94a7e95
#define T0_KAOS_RANVAL_43     0x75d2d418
#define T0_KAOS_RANVAL_44     0x429c160c
#define T0_KAOS_RANVAL_45     0xc2e4afb2
#define T0_KAOS_RANVAL_46     0x748b4bd7
#define T0_KAOS_RANVAL_47     0x07eab6ac
#define T0_KAOS_RANVAL_48     0x16ee9021
#define T0_KAOS_RANVAL_49     0x23e0d3cd
#define T0_KAOS_RANVAL_4a     0x8e51c913
#define T0_KAOS_RANVAL_4b     0x327881d0
#define T0_KAOS_RANVAL_4c     0x582db023
#define T0_KAOS_RANVAL_4d     0x72584ff9
#define T0_KAOS_RANVAL_4e     0x1eae19f4
#define T0_KAOS_RANVAL_4f     0xd1532620
#define T0_KAOS_RANVAL_50     0x87204754
#define T0_KAOS_RANVAL_51     0x77177811
#define T0_KAOS_RANVAL_52     0xee881524
#define T0_KAOS_RANVAL_53     0xb3c91e69
#define T0_KAOS_RANVAL_54     0xf2bb8a25
#define T0_KAOS_RANVAL_55     0xd8b01b68
#define T0_KAOS_RANVAL_56     0xfb262d01
#define T0_KAOS_RANVAL_57     0x30133c48
#define T0_KAOS_RANVAL_58     0x830f8a0c
#define T0_KAOS_RANVAL_59     0x1f0ddc10
#define T0_KAOS_RANVAL_5a     0xad6daf90
#define T0_KAOS_RANVAL_5b     0xf0151b10
#define T0_KAOS_RANVAL_5c     0x70a0f89b
#define T0_KAOS_RANVAL_5d     0x98623659
#define T0_KAOS_RANVAL_5e     0xc6d291b1
#define T0_KAOS_RANVAL_5f     0xaff75cf1
#define T0_KAOS_RANVAL_60     0x943387ce
#define T0_KAOS_RANVAL_61     0xca4afc98
#define T0_KAOS_RANVAL_62     0x329c3994
#define T0_KAOS_RANVAL_63     0x61461655
#define T0_KAOS_RANVAL_64     0x67697ba4
#define T0_KAOS_RANVAL_65     0x9efe4b29
#define T0_KAOS_RANVAL_66     0x2a87fc6b
#define T0_KAOS_RANVAL_67     0xbb000b8d
#define T0_KAOS_RANVAL_68     0x17d240f0
#define T0_KAOS_RANVAL_69     0x817338b6
#define T0_KAOS_RANVAL_6a     0x39294360
#define T0_KAOS_RANVAL_6b     0x46a9a4ac
#define T0_KAOS_RANVAL_6c     0xad4b1d70
#define T0_KAOS_RANVAL_6d     0x3d2ec6b8
#define T0_KAOS_RANVAL_6e     0xd5f28bc9
#define T0_KAOS_RANVAL_6f     0x2e40bbb3
#define T0_KAOS_RANVAL_70     0x07324d1e
#define T0_KAOS_RANVAL_71     0x9ad0d63d
#define T0_KAOS_RANVAL_72     0x4dd1b69a
#define T0_KAOS_RANVAL_73     0x8d1ca8ee
#define T0_KAOS_RANVAL_74     0xbb1e20c6
#define T0_KAOS_RANVAL_75     0x41f524ec
#define T0_KAOS_RANVAL_76     0xcafd5b1b
#define T0_KAOS_RANVAL_77     0x9098319c
#define T0_KAOS_RANVAL_78     0xe0cef1d8
#define T0_KAOS_RANVAL_79     0x8fb89646
#define T0_KAOS_RANVAL_7a     0xee3810da
#define T0_KAOS_RANVAL_7b     0xf3193cd5
#define T0_KAOS_RANVAL_7c     0xdb2bff7f
#define T0_KAOS_RANVAL_7d     0x7f734d2e
#define T0_KAOS_RANVAL_7e     0x16a9e4e2
#define T0_KAOS_RANVAL_7f     0x16e472a8
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
!    areaoffset     960
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      4002
!    code           695a2000
!    entry          695a2000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2b3e3aa2091
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

KTEXT_MODULE(t0_module_ktbl, 0x695a2000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xaad2fc0c	! t0_kref+0x0:   	umulcc	%o3, -0x3f4, %l5
	.word	0xa7400000	! t0_kref+0x4:   	mov	%y, %l3
	.word	0xa9b78e58	! t0_kref+0x8:   	fxnor	%f30, %f24, %f20
	.word	0x9fa00539	! t0_kref+0xc:   	fsqrts	%f25, %f15
	.word	0xe1be1856	! t0_kref+0x10:   	stda	%f16, [%i0 + %l6]0xc2
	.word	0xadb3844e	! t0_kref+0x14:   	fcmpne16	%f14, %f14, %l6
	.word	0xa3b54175	! t0_kref+0x18:   	edge32ln	%l5, %l5, %l1
	.word	0x2f480002	! t0_kref+0x1c:   	fbu,a,pt	%fcc0, _kref+0x24
	.word	0xabb540ab	! t0_kref+0x20:   	edge16n	%l5, %o3, %l5
	.word	0xa6d5000d	! t0_kref+0x24:   	umulcc	%l4, %o5, %l3
	.word	0xb5a00538	! t0_kref+0x28:   	fsqrts	%f24, %f26
	.word	0xada0193f	! t0_kref+0x2c:   	fstod	%f31, %f22
	.word	0xafa788b6	! t0_kref+0x30:   	fsubs	%f30, %f22, %f23
	.word	0xa1702ea0	! t0_kref+0x34:   	popc	0xea0, %l0
	.word	0xa2f5c009	! t0_kref+0x38:   	udivcc	%l7, %o1, %l1
	.word	0x38480003	! t0_kref+0x3c:   	bgu,a,pt	%icc, _kref+0x48
	.word	0xc568a084	! t0_kref+0x40:   	prefetch	%g2 + 0x84, 2
	.word	0xa1a709b3	! t0_kref+0x44:   	fdivs	%f28, %f19, %f16
	.word	0xaa2b4009	! t0_kref+0x48:   	andn	%o5, %o1, %l5
	.word	0xa20a001c	! t0_kref+0x4c:   	and	%o0, %i4, %l1
	.word	0x81828000	! t0_kref+0x50:   	wr	%o2, %g0, %y
	.word	0x9bb58dff	! t0_kref+0x54:   	fnands	%f22, %f31, %f13
	.word	0xaba01a30	! t0_kref+0x58:   	fstoi	%f16, %f21
	.word	0x94702465	! t0_kref+0x5c:   	udiv	%g0, 0x465, %o2
	.word	0x001fffff	! t0_kref+0x60:   	illtrap	0x1fffff
	.word	0x8585e495	! t0_kref+0x64:   	wr	%l7, 0x495, %ccr
	.word	0xa1b30d40	! t0_kref+0x68:   	fnot1	%f12, %f16
	.word	0x36800001	! t0_kref+0x6c:   	bge,a	_kref+0x70
	.word	0xb1b48ece	! t0_kref+0x70:   	fornot2	%f18, %f14, %f24
	.word	0x903f0017	! t0_kref+0x74:   	xnor	%i4, %l7, %o0
	.word	0x20480001	! t0_kref+0x78:   	bn,a,pt	%icc, _kref+0x7c
	.word	0x91b28130	! t0_kref+0x7c:   	edge32n	%o2, %l0, %o0
	.word	0x9ba0053f	! t0_kref+0x80:   	fsqrts	%f31, %f13
	.word	0xbda60d2e	! t0_kref+0x84:   	fsmuld	%f24, %f14, %f30
	.word	0xa5b24030	! t0_kref+0x88:   	edge8n	%o1, %l0, %l2
	.word	0x92134017	! t0_kref+0x8c:   	or	%o5, %l7, %o1
	.word	0x36800002	! t0_kref+0x90:   	bge,a	_kref+0x98
	.word	0xbda0193b	! t0_kref+0x94:   	fstod	%f27, %f30
	.word	0xa1a64838	! t0_kref+0x98:   	fadds	%f25, %f24, %f16
	.word	0xbfa4083c	! t0_kref+0x9c:   	fadds	%f16, %f28, %f31
	.word	0xe9be1811	! t0_kref+0xa0:   	stda	%f20, [%i0 + %l1]0xc0
	.word	0xf920a02c	! t0_kref+0xa4:   	st	%f28, [%g2 + 0x2c]
	.word	0x39480001	! t0_kref+0xa8:   	fbuge,a,pt	%fcc0, _kref+0xac
	.word	0xec3e4000	! t0_kref+0xac:   	std	%l6, [%i1]
	.word	0xd6367fe8	! t0_kref+0xb0:   	sth	%o3, [%i1 - 0x18]
	.word	0xc807bfe4	! t0_kref+0xb4:   	ld	[%fp - 0x1c], %g4
	.word	0x3d480008	! t0_kref+0xb8:   	fbule,a,pt	%fcc0, _kref+0xd8
	.word	0xa4f70011	! t0_kref+0xbc:   	udivcc	%i4, %l1, %l2
	.word	0x94ddc00a	! t0_kref+0xc0:   	smulcc	%l7, %o2, %o2
	.word	0xabb6cdf5	! t0_kref+0xc4:   	fnands	%f27, %f21, %f21
	.word	0xda6e8019	! t0_kref+0xc8:   	ldstub	[%i2 + %i1], %o5
	.word	0xac02c016	! t0_kref+0xcc:   	add	%o3, %l6, %l6
	.word	0x38800007	! t0_kref+0xd0:   	bgu,a	_kref+0xec
	.word	0xb5b48a9a	! t0_kref+0xd4:   	fpsub16	%f18, %f26, %f26
	.word	0xb5b00cce	! t0_kref+0xd8:   	fnot2	%f14, %f26
	.word	0x8143c000	! t0_kref+0xdc:   	stbar
	call	SYM(t0_subr1)
	.word	0xb9a00536	! t0_kref+0xe4:   	fsqrts	%f22, %f28
	.word	0xbda0111e	! t0_kref+0xe8:   	fxtod	%f30, %f30
	.word	0x2d800004	! t0_kref+0xec:   	fbg,a	_kref+0xfc
	.word	0xaad8000b	! t0_kref+0xf0:   	smulcc	%g0, %o3, %l5
	.word	0xa4a48009	! t0_kref+0xf4:   	subcc	%l2, %o1, %l2
	.word	0x38800005	! t0_kref+0xf8:   	bgu,a	_kref+0x10c
	.word	0xa3b4849e	! t0_kref+0xfc:   	fcmple32	%f18, %f30, %l1
	.word	0x35800008	! t0_kref+0x100:   	fbue,a	_kref+0x120
	.word	0xd2067fec	! t0_kref+0x104:   	ld	[%i1 - 0x14], %o1
	.word	0x90f2c01c	! t0_kref+0x108:   	udivcc	%o3, %i4, %o0
	.word	0xbfa00137	! t0_kref+0x10c:   	fabss	%f23, %f31
	.word	0xb1a01932	! t0_kref+0x110:   	fstod	%f18, %f24
	.word	0xe4580019	! t0_kref+0x114:   	ldx	[%g0 + %i1], %l2
	.word	0x2c480002	! t0_kref+0x118:   	bneg,a,pt	%icc, _kref+0x120
	.word	0xec4e7ffb	! t0_kref+0x11c:   	ldsb	[%i1 - 5], %l6
	.word	0xefee101d	! t0_kref+0x120:   	prefetcha	%i0 + %i5, 23
	.word	0x86102003	! t0_kref+0x124:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x128:   	bne,a	_kref+0x128
	.word	0x86a0e001	! t0_kref+0x12c:   	subcc	%g3, 1, %g3
	.word	0x949cc00d	! t0_kref+0x130:   	xorcc	%l3, %o5, %o2
	.word	0xadb28334	! t0_kref+0x134:   	bmask	%o2, %l4, %l6
	.word	0xbda4482e	! t0_kref+0x138:   	fadds	%f17, %f14, %f30
	.word	0xd286101c	! t0_kref+0x13c:   	lda	[%i0 + %i4]0x80, %o1
	.word	0x81868000	! t0_kref+0x140:   	wr	%i2, %g0, %y
	.word	0xb9b68c5c	! t0_kref+0x144:   	fnor	%f26, %f28, %f28
	.word	0xa9a01939	! t0_kref+0x148:   	fstod	%f25, %f20
	.word	0xa1a000d8	! t0_kref+0x14c:   	fnegd	%f24, %f16
	call	SYM(t0_subr3)
	.word	0xd40e3ff3	! t0_kref+0x154:   	ldub	[%i0 - 0xd], %o2
	.word	0x8143c000	! t0_kref+0x158:   	stbar
	.word	0xa0e48013	! t0_kref+0x15c:   	subccc	%l2, %l3, %l0
	.word	0x8143c000	! t0_kref+0x160:   	stbar
	.word	0x32480007	! t0_kref+0x164:   	bne,a,pt	%icc, _kref+0x180
	.word	0xeef81019	! t0_kref+0x168:   	swapa	[%g0 + %i1]0x80, %l7
	.word	0xe4ee9018	! t0_kref+0x16c:   	ldstuba	[%i2 + %i0]0x80, %l2
	.word	0xee68001a	! t0_kref+0x170:   	ldstub	[%g0 + %i2], %l7
	.word	0xae124013	! t0_kref+0x174:   	or	%o1, %l3, %l7
	.word	0xed180018	! t0_kref+0x178:   	ldd	[%g0 + %i0], %f22
	.word	0x36480008	! t0_kref+0x17c:   	bge,a,pt	%icc, _kref+0x19c
	.word	0xea16200a	! t0_kref+0x180:   	lduh	[%i0 + 0xa], %l5
	.word	0xa5a589dc	! t0_kref+0x184:   	fdivd	%f22, %f28, %f18
	.word	0xe65e0000	! t0_kref+0x188:   	ldx	[%i0], %l3
	.word	0xa8524017	! t0_kref+0x18c:   	umul	%o1, %l7, %l4
	.word	0xe87e6010	! t0_kref+0x190:   	swap	[%i1 + 0x10], %l4
	.word	0x27480001	! t0_kref+0x194:   	fbul,a,pt	%fcc0, _kref+0x198
	.word	0xd6680019	! t0_kref+0x198:   	ldstub	[%g0 + %i1], %o3
	.word	0xa21ac00d	! t0_kref+0x19c:   	xor	%o3, %o5, %l1
	.word	0xa272c010	! t0_kref+0x1a0:   	udiv	%o3, %l0, %l1
	.word	0xa927291a	! t0_kref+0x1a4:   	mulscc	%i4, 0x91a, %l4
	.word	0xea0e7fe5	! t0_kref+0x1a8:   	ldub	[%i1 - 0x1b], %l5
	.word	0xd2162000	! t0_kref+0x1ac:   	lduh	[%i0], %o1
	.word	0xfb6e001c	! t0_kref+0x1b0:   	prefetch	%i0 + %i4, 29
	.word	0xd4480018	! t0_kref+0x1b4:   	ldsb	[%g0 + %i0], %o2
	.word	0xe51e7fe8	! t0_kref+0x1b8:   	ldd	[%i1 - 0x18], %f18
	.word	0xb9b68a31	! t0_kref+0x1bc:   	fpadd16s	%f26, %f17, %f28
	.word	0x8584c00c	! t0_kref+0x1c0:   	wr	%l3, %o4, %ccr
	.word	0x3e800005	! t0_kref+0x1c4:   	bvc,a	_kref+0x1d8
	.word	0xac0cc000	! t0_kref+0x1c8:   	and	%l3, %g0, %l6
	.word	0xa9a01898	! t0_kref+0x1cc:   	fitos	%f24, %f20
	.word	0xa3b4059a	! t0_kref+0x1d0:   	fcmpgt32	%f16, %f26, %l1
	.word	0xa815e05d	! t0_kref+0x1d4:   	or	%l7, 0x5d, %l4
	.word	0x8143e040	! t0_kref+0x1d8:   	membar	0x40
	.word	0xacf2e7c0	! t0_kref+0x1dc:   	udivcc	%o3, 0x7c0, %l6
	.word	0x9405b94e	! t0_kref+0x1e0:   	add	%l6, -0x6b2, %o2
	.word	0xea6e001a	! t0_kref+0x1e4:   	ldstub	[%i0 + %i2], %l5
	.word	0x2a480003	! t0_kref+0x1e8:   	bcs,a,pt	%icc, _kref+0x1f4
	.word	0xa1a7c8b6	! t0_kref+0x1ec:   	fsubs	%f31, %f22, %f16
	.word	0xe726201c	! t0_kref+0x1f0:   	st	%f19, [%i0 + 0x1c]
	.word	0xfb063fe0	! t0_kref+0x1f4:   	ld	[%i0 - 0x20], %f29
	.word	0x95070016	! t0_kref+0x1f8:   	taddcc	%i4, %l6, %o2
	.word	0xa9b40ed6	! t0_kref+0x1fc:   	fornot2	%f16, %f22, %f20
	.word	0x8610200f	! t0_kref+0x200:   	mov	0xf, %g3
	.word	0x86a0e001	! t0_kref+0x204:   	subcc	%g3, 1, %g3
	.word	0x22800020	! t0_kref+0x208:   	be,a	_kref+0x288
	.word	0xb5a5c8b9	! t0_kref+0x20c:   	fsubs	%f23, %f25, %f26
	.word	0xc1082f54	! t0_kref+0x210:   	ld	[%g0 + 0xf54], %fsr
	.word	0x930a801b	! t0_kref+0x214:   	tsubcc	%o2, %i3, %o1
	.word	0x9fa00535	! t0_kref+0x218:   	fsqrts	%f21, %f15
	.word	0xa5a0055c	! t0_kref+0x21c:   	fsqrtd	%f28, %f18
	.word	0xb5a00554	! t0_kref+0x220:   	fsqrtd	%f20, %f26
	.word	0xd8280019	! t0_kref+0x224:   	stb	%o4, [%g0 + %i1]
	.word	0xa1a0055a	! t0_kref+0x228:   	fsqrtd	%f26, %f16
	.word	0xd93e0000	! t0_kref+0x22c:   	std	%f12, [%i0]
	.word	0x9fa5483a	! t0_kref+0x230:   	fadds	%f21, %f26, %f15
	call	SYM(t0_subr0)
	.word	0xa1b50a1c	! t0_kref+0x238:   	fpadd16	%f20, %f28, %f16
	.word	0xf9be584b	! t0_kref+0x23c:   	stda	%f28, [%i1 + %o3]0xc2
	.word	0xa875a6aa	! t0_kref+0x240:   	udiv	%l6, 0x6aa, %l4
	.word	0x9db50dd8	! t0_kref+0x244:   	fnand	%f20, %f24, %f14
	.word	0xafa01a56	! t0_kref+0x248:   	fdtoi	%f22, %f23
	.word	0xaef33cde	! t0_kref+0x24c:   	udivcc	%o4, -0x322, %l7
	.word	0xda367ff4	! t0_kref+0x250:   	sth	%o5, [%i1 - 0xc]
	.word	0xb9a00130	! t0_kref+0x254:   	fabss	%f16, %f28
	.word	0x81ac8a50	! t0_kref+0x258:   	fcmpd	%fcc0, %f18, %f16
	.word	0x244fffea	! t0_kref+0x25c:   	ble,a,pt	%icc, _kref+0x204
	.word	0x9054c008	! t0_kref+0x260:   	umul	%l3, %o0, %o0
	.word	0xfd1fbde0	! t0_kref+0x264:   	ldd	[%fp - 0x220], %f30
	.word	0xd4780018	! t0_kref+0x268:   	swap	[%g0 + %i0], %o2
	.word	0x909b4010	! t0_kref+0x26c:   	xorcc	%o5, %l0, %o0
	.word	0xf16e6008	! t0_kref+0x270:   	prefetch	%i1 + 8, 24
	.word	0x35800001	! t0_kref+0x274:   	fbue,a	_kref+0x278
	.word	0x9fb007bc	! t0_kref+0x278:   	fpackfix	%f28, %f15
	.word	0xf19f1a58	! t0_kref+0x27c:   	ldda	[%i4 + %i0]0xd2, %f24
	.word	0xa9a50954	! t0_kref+0x280:   	fmuld	%f20, %f20, %f20
	.word	0xa7844013	! t0_kref+0x284:   	wr	%l1, %l3, %gsr
	.word	0xaba508b6	! t0_kref+0x288:   	fsubs	%f20, %f22, %f21
	.word	0xa5b70d40	! t0_kref+0x28c:   	fnot1	%f28, %f18
	.word	0x25800005	! t0_kref+0x290:   	fblg,a	_kref+0x2a4
	.word	0xa01ec008	! t0_kref+0x294:   	xor	%i3, %o0, %l0
	.word	0x2e480008	! t0_kref+0x298:   	bvs,a,pt	%icc, _kref+0x2b8
	.word	0xaa758000	! t0_kref+0x29c:   	udiv	%l6, %g0, %l5
	.word	0x81d86926	! t0_kref+0x2a0:   	flush	%g1 + 0x926
	.word	0xae5cb771	! t0_kref+0x2a4:   	smul	%l2, -0x88f, %l7
	.word	0xac0f000c	! t0_kref+0x2a8:   	and	%i4, %o4, %l6
	.word	0xa5b68dce	! t0_kref+0x2ac:   	fnand	%f26, %f14, %f18
	.word	0xa60b6403	! t0_kref+0x2b0:   	and	%o5, 0x403, %l3
	.word	0xaaf571b4	! t0_kref+0x2b4:   	udivcc	%l5, -0xe4c, %l5
	.word	0xaf400000	! t0_kref+0x2b8:   	mov	%y, %l7
	.word	0x9de3bfa0	! t0_kref+0x2bc:   	save	%sp, -0x60, %sp
	.word	0xba66001b	! t0_kref+0x2c0:   	subc	%i0, %i3, %i5
	.word	0x93ef4018	! t0_kref+0x2c4:   	restore	%i5, %i0, %o1
	.word	0xae747ae3	! t0_kref+0x2c8:   	udiv	%l1, -0x51d, %l7
	.word	0x35480002	! t0_kref+0x2cc:   	fbue,a,pt	%fcc0, _kref+0x2d4
	.word	0xa1b40e18	! t0_kref+0x2d0:   	fand	%f16, %f24, %f16
	.word	0xb1a788de	! t0_kref+0x2d4:   	fsubd	%f30, %f30, %f24
	.word	0xb5a0013e	! t0_kref+0x2d8:   	fabss	%f30, %f26
	.word	0x81830000	! t0_kref+0x2dc:   	wr	%o4, %g0, %y
	.word	0x37800004	! t0_kref+0x2e0:   	fbge,a	_kref+0x2f0
	.word	0xa7a708be	! t0_kref+0x2e4:   	fsubs	%f28, %f30, %f19
	.word	0xaebb001c	! t0_kref+0x2e8:   	xnorcc	%o4, %i4, %l7
	.word	0x95400000	! t0_kref+0x2ec:   	mov	%y, %o2
	.word	0x81ac4a3e	! t0_kref+0x2f0:   	fcmps	%fcc0, %f17, %f30
	.word	0x3d480007	! t0_kref+0x2f4:   	fbule,a,pt	%fcc0, _kref+0x310
	.word	0xa1b38edc	! t0_kref+0x2f8:   	fornot2	%f14, %f28, %f16
	.word	0xb5a7083e	! t0_kref+0x2fc:   	fadds	%f28, %f30, %f26
	.word	0xab400000	! t0_kref+0x300:   	mov	%y, %l5
	.word	0xfd1e4000	! t0_kref+0x304:   	ldd	[%i1], %f30
	.word	0xa3b2400b	! t0_kref+0x308:   	edge8	%o1, %o3, %l1
	.word	0x11060660	! t0_kref+0x30c:   	sethi	%hi(0x18198000), %o0
	.word	0x2e480005	! t0_kref+0x310:   	bvs,a,pt	%icc, _kref+0x324
	.word	0x001fffff	! t0_kref+0x314:   	illtrap	0x1fffff
	.word	0xdb000018	! t0_kref+0x318:   	ld	[%g0 + %i0], %f13
	.word	0xa5a0191d	! t0_kref+0x31c:   	fitod	%f29, %f18
	.word	0xd028a01f	! t0_kref+0x320:   	stb	%o0, [%g2 + 0x1f]
	.word	0x34480005	! t0_kref+0x324:   	bg,a,pt	%icc, _kref+0x338
	.word	0x81800000	! t0_kref+0x328:   	mov	%g0, %y
	.word	0xf43e2000	! t0_kref+0x32c:   	std	%i2, [%i0]
	.word	0xaa5c800a	! t0_kref+0x330:   	smul	%l2, %o2, %l5
	.word	0xd07e4000	! t0_kref+0x334:   	swap	[%i1], %o0
	.word	0xd420a034	! t0_kref+0x338:   	st	%o2, [%g2 + 0x34]
	.word	0xbdb68d14	! t0_kref+0x33c:   	fandnot1	%f26, %f20, %f30
	.word	0x81870000	! t0_kref+0x340:   	wr	%i4, %g0, %y
	.word	0xa6d48014	! t0_kref+0x344:   	umulcc	%l2, %l4, %l3
	.word	0x9e0061d0	! t0_kref+0x348:   	add	%g1, 0x1d0, %o7
!	.word	0x2b4fd72d	! t0_kref+0x34c:   	fbug,a,pt	%fcc0, SYM(t0_subr0)
	   	fbug,a,pt	%fcc0, SYM(t0_subr0)
	.word	0xd2580019	! t0_kref+0x350:   	ldx	[%g0 + %i1], %o1
	.word	0xa69dc00c	! t0_kref+0x354:   	xorcc	%l7, %o4, %l3
	.word	0xf9ee501d	! t0_kref+0x358:   	prefetcha	%i1 + %i5, 28
	.word	0xc1e6500b	! t0_kref+0x35c:   	casa	[%i1]0x80, %o3, %g0
	.word	0x86102001	! t0_kref+0x360:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x364:   	bne,a	_kref+0x364
	.word	0x86a0e001	! t0_kref+0x368:   	subcc	%g3, 1, %g3
	.word	0xbda34837	! t0_kref+0x36c:   	fadds	%f13, %f23, %f30
	.word	0xa27e800c	! t0_kref+0x370:   	sdiv	%i2, %o4, %l1
	.word	0x3b800002	! t0_kref+0x374:   	fble,a	_kref+0x37c
	.word	0x9570000b	! t0_kref+0x378:   	popc	%o3, %o2
	.word	0xa5a60950	! t0_kref+0x37c:   	fmuld	%f24, %f16, %f18
	.word	0x33480004	! t0_kref+0x380:   	fbe,a,pt	%fcc0, _kref+0x390
	.word	0x151412d8	! t0_kref+0x384:   	sethi	%hi(0x504b6000), %o2
	.word	0x2e800006	! t0_kref+0x388:   	bvs,a	_kref+0x3a0
	.word	0xeb6e401a	! t0_kref+0x38c:   	prefetch	%i1 + %i2, 21
	.word	0xed68a008	! t0_kref+0x390:   	prefetch	%g2 + 8, 22
	.word	0xa22ec009	! t0_kref+0x394:   	andn	%i3, %o1, %l1
	.word	0xa5a68956	! t0_kref+0x398:   	fmuld	%f26, %f22, %f18
	.word	0xd86e4000	! t0_kref+0x39c:   	ldstub	[%i1], %o4
	.word	0xfd1e7ff8	! t0_kref+0x3a0:   	ldd	[%i1 - 8], %f30
	.word	0x947ced69	! t0_kref+0x3a4:   	sdiv	%l3, 0xd69, %o2
	.word	0x8143c000	! t0_kref+0x3a8:   	stbar
	.word	0xec4e7fe5	! t0_kref+0x3ac:   	ldsb	[%i1 - 0x1b], %l6
	.word	0xf1be1814	! t0_kref+0x3b0:   	stda	%f24, [%i0 + %l4]0xc0
	.word	0xe04e3fe7	! t0_kref+0x3b4:   	ldsb	[%i0 - 0x19], %l0
	.word	0xa7227e2f	! t0_kref+0x3b8:   	mulscc	%o1, -0x1d1, %l3
	.word	0xadb50512	! t0_kref+0x3bc:   	fcmpgt16	%f20, %f18, %l6
	.word	0x95b40240	! t0_kref+0x3c0:   	array16	%l0, %g0, %o2
	.word	0xabb00ced	! t0_kref+0x3c4:   	fnot2s	%f13, %f21
	.word	0xf436401b	! t0_kref+0x3c8:   	sth	%i2, [%i1 + %i3]
	.word	0xb6103fec	! t0_kref+0x3cc:   	mov	0xffffffec, %i3
	.word	0xd62e8018	! t0_kref+0x3d0:   	stb	%o3, [%i2 + %i0]
	.word	0x8143c000	! t0_kref+0x3d4:   	stbar
	.word	0xb9a409da	! t0_kref+0x3d8:   	fdivd	%f16, %f26, %f28
	.word	0xa81d7253	! t0_kref+0x3dc:   	xor	%l5, -0xdad, %l4
	.word	0xa3a388bc	! t0_kref+0x3e0:   	fsubs	%f14, %f28, %f17
	.word	0xb9a00532	! t0_kref+0x3e4:   	fsqrts	%f18, %f28
	.word	0x25800008	! t0_kref+0x3e8:   	fblg,a	_kref+0x408
	.word	0xac7a0000	! t0_kref+0x3ec:   	sdiv	%o0, %g0, %l6
	.word	0x31800008	! t0_kref+0x3f0:   	fba,a	_kref+0x410
	.word	0xfdee501b	! t0_kref+0x3f4:   	prefetcha	%i1 + %i3, 30
	.word	0xd06e4000	! t0_kref+0x3f8:   	ldstub	[%i1], %o0
	.word	0xd91e2008	! t0_kref+0x3fc:   	ldd	[%i0 + 8], %f12
	.word	0x85824014	! t0_kref+0x400:   	wr	%o1, %l4, %ccr
	.word	0x81848000	! t0_kref+0x404:   	wr	%l2, %g0, %y
	.word	0x33800004	! t0_kref+0x408:   	fbe,a	_kref+0x418
	.word	0xb1a0013b	! t0_kref+0x40c:   	fabss	%f27, %f24
	.word	0xa1b68d40	! t0_kref+0x410:   	fnot1	%f26, %f16
	.word	0xaee4400a	! t0_kref+0x414:   	subccc	%l1, %o2, %l7
	.word	0xb1a00130	! t0_kref+0x418:   	fabss	%f16, %f24
	.word	0xb1a000b2	! t0_kref+0x41c:   	fnegs	%f18, %f24
	.word	0xbba0189a	! t0_kref+0x420:   	fitos	%f26, %f29
	.word	0x94daefd5	! t0_kref+0x424:   	smulcc	%o3, 0xfd5, %o2
	.word	0xb5a0190d	! t0_kref+0x428:   	fitod	%f13, %f26
	.word	0x9082c00b	! t0_kref+0x42c:   	addcc	%o3, %o3, %o0
	.word	0x83414000	! t0_kref+0x430:   	mov	%pc, %g1
	.word	0x3a480003	! t0_kref+0x434:   	bcc,a,pt	%icc, _kref+0x440
	.word	0xaba0003f	! t0_kref+0x438:   	fmovs	%f31, %f21
	.word	0xdd1f4018	! t0_kref+0x43c:   	ldd	[%i5 + %i0], %f14
	.word	0x9ba000b8	! t0_kref+0x440:   	fnegs	%f24, %f13
	.word	0xafa01a4c	! t0_kref+0x444:   	fdtoi	%f12, %f23
	.word	0x91b24280	! t0_kref+0x448:   	array32	%o1, %g0, %o0
!	.word	0x2f8256eb	! t0_kref+0x44c:   	fbu,a	SYM(t0_subr1)
	   	fbu,a	SYM(t0_subr1)
	.word	0x9e00601c	! t0_kref+0x450:   	add	%g1, 0x1c, %o7
	.word	0x81844000	! t0_kref+0x454:   	wr	%l1, %g0, %y
	.word	0x3f800008	! t0_kref+0x458:   	fbo,a	_kref+0x478
	.word	0xa2742bbb	! t0_kref+0x45c:   	udiv	%l0, 0xbbb, %l1
	.word	0xd00e2004	! t0_kref+0x460:   	ldub	[%i0 + 4], %o0
	.word	0x37800001	! t0_kref+0x464:   	fbge,a	_kref+0x468
	.word	0xada01a36	! t0_kref+0x468:   	fstoi	%f22, %f22
	.word	0x2528dfb0	! t0_kref+0x46c:   	sethi	%hi(0xa37ec000), %l2
	call	SYM(t0_subr3)
	.word	0xe826001c	! t0_kref+0x474:   	st	%l4, [%i0 + %i4]
	.word	0xa9043aec	! t0_kref+0x478:   	taddcc	%l0, -0x514, %l4
	.word	0x28480001	! t0_kref+0x47c:   	bleu,a,pt	%icc, _kref+0x480
	.word	0x902ac016	! t0_kref+0x480:   	andn	%o3, %l6, %o0
	.word	0xd0100018	! t0_kref+0x484:   	lduh	[%g0 + %i0], %o0
	.word	0x9284c00d	! t0_kref+0x488:   	addcc	%l3, %o5, %o1
	.word	0xa91a4009	! t0_kref+0x48c:   	tsubcctv	%o1, %o1, %l4
	.word	0x95b70594	! t0_kref+0x490:   	fcmpgt32	%f28, %f20, %o2
	.word	0x2d20fb78	! t0_kref+0x494:   	sethi	%hi(0x83ede000), %l6
	.word	0xa3a00531	! t0_kref+0x498:   	fsqrts	%f17, %f17
	.word	0xdb062018	! t0_kref+0x49c:   	ld	[%i0 + 0x18], %f13
	.word	0xd7e65013	! t0_kref+0x4a0:   	casa	[%i1]0x80, %l3, %o3
	.word	0xa3b7858c	! t0_kref+0x4a4:   	fcmpgt32	%f30, %f12, %l1
	.word	0xb3b78f7e	! t0_kref+0x4a8:   	fornot1s	%f30, %f30, %f25
	.word	0xf426001c	! t0_kref+0x4ac:   	st	%i2, [%i0 + %i4]
	.word	0xa3a708ba	! t0_kref+0x4b0:   	fsubs	%f28, %f26, %f17
	.word	0xecc71018	! t0_kref+0x4b4:   	ldswa	[%i4 + %i0]0x80, %l6
	.word	0xb5a388ad	! t0_kref+0x4b8:   	fsubs	%f14, %f13, %f26
	.word	0xbfa01a2d	! t0_kref+0x4bc:   	fstoi	%f13, %f31
	.word	0x8143c000	! t0_kref+0x4c0:   	stbar
	.word	0xa12ae00b	! t0_kref+0x4c4:   	sll	%o3, 0xb, %l0
	.word	0xa7b40240	! t0_kref+0x4c8:   	array16	%l0, %g0, %l3
	.word	0xbda38d31	! t0_kref+0x4cc:   	fsmuld	%f14, %f17, %f30
	.word	0xab3e8015	! t0_kref+0x4d0:   	sra	%i2, %l5, %l5
	.word	0xaa843712	! t0_kref+0x4d4:   	addcc	%l0, -0x8ee, %l5
	.word	0xeb68a041	! t0_kref+0x4d8:   	prefetch	%g2 + 0x41, 21
	.word	0xd2780018	! t0_kref+0x4dc:   	swap	[%g0 + %i0], %o1
	.word	0x34800008	! t0_kref+0x4e0:   	bg,a	_kref+0x500
	.word	0xb9a0055e	! t0_kref+0x4e4:   	fsqrtd	%f30, %f28
	.word	0xe6200019	! t0_kref+0x4e8:   	st	%l3, [%g0 + %i1]
	.word	0xd4700018	! t0_kref+0x4ec:   	stx	%o2, [%g0 + %i0]
	.word	0xbda0189d	! t0_kref+0x4f0:   	fitos	%f29, %f30
	.word	0xb9b40c8e	! t0_kref+0x4f4:   	fandnot2	%f16, %f14, %f28
	.word	0xaa853b0d	! t0_kref+0x4f8:   	addcc	%l4, -0x4f3, %l5
	.word	0xed68a00d	! t0_kref+0x4fc:   	prefetch	%g2 + 0xd, 22
	.word	0xabb00776	! t0_kref+0x500:   	fpack16	%f22, %f21
	.word	0x81af4a3b	! t0_kref+0x504:   	fcmps	%fcc0, %f29, %f27
	.word	0xadb5ca36	! t0_kref+0x508:   	fpadd16s	%f23, %f22, %f22
	.word	0xbdb00c20	! t0_kref+0x50c:   	fzeros	%f30
	.word	0xb1b7ca37	! t0_kref+0x510:   	fpadd16s	%f31, %f23, %f24
	.word	0xeaae1000	! t0_kref+0x514:   	stba	%l5, [%i0]0x80
	.word	0xa3a01895	! t0_kref+0x518:   	fitos	%f21, %f17
	.word	0xe44e201c	! t0_kref+0x51c:   	ldsb	[%i0 + 0x1c], %l2
	.word	0x9de3bfa0	! t0_kref+0x520:   	save	%sp, -0x60, %sp
	.word	0x91ef401d	! t0_kref+0x524:   	restore	%i5, %i5, %o0
	.word	0xaba01a3f	! t0_kref+0x528:   	fstoi	%f31, %f21
	.word	0x27286371	! t0_kref+0x52c:   	sethi	%hi(0xa18dc400), %l3
	.word	0xda6e8018	! t0_kref+0x530:   	ldstub	[%i2 + %i0], %o5
	.word	0xa3b30011	! t0_kref+0x534:   	edge8	%o4, %l1, %l1
	.word	0xa2adc017	! t0_kref+0x538:   	andncc	%l7, %l7, %l1
	.word	0xec6e3fed	! t0_kref+0x53c:   	ldstub	[%i0 - 0x13], %l6
	.word	0x9fc00004	! t0_kref+0x540:   	call	%g0 + %g4
	.word	0x81db0004	! t0_kref+0x544:   	flush	%o4 + %g4
	.word	0x86102002	! t0_kref+0x548:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x54c:   	bne,a	_kref+0x54c
	.word	0x86a0e001	! t0_kref+0x550:   	subcc	%g3, 1, %g3
	.word	0xbdb78ace	! t0_kref+0x554:   	fpsub32	%f30, %f14, %f30
	.word	0xa2f28008	! t0_kref+0x558:   	udivcc	%o2, %o0, %l1
	.word	0xa7a00533	! t0_kref+0x55c:   	fsqrts	%f19, %f19
	.word	0xf62e601a	! t0_kref+0x560:   	stb	%i3, [%i1 + 0x1a]
	.word	0xa5400000	! t0_kref+0x564:   	mov	%y, %l2
	.word	0xa33a6014	! t0_kref+0x568:   	sra	%o1, 0x14, %l1
	.word	0x28480005	! t0_kref+0x56c:   	bleu,a,pt	%icc, _kref+0x580
	.word	0xa528000c	! t0_kref+0x570:   	sll	%g0, %o4, %l2
	.word	0xa205eb9c	! t0_kref+0x574:   	add	%l7, 0xb9c, %l1
	.word	0x38480002	! t0_kref+0x578:   	bgu,a,pt	%icc, _kref+0x580
	.word	0xb9b50e7a	! t0_kref+0x57c:   	fxnors	%f20, %f26, %f28
	.word	0xb9b60d90	! t0_kref+0x580:   	fxor	%f24, %f16, %f28
	.word	0xac8eee80	! t0_kref+0x584:   	andcc	%i3, 0xe80, %l6
	.word	0xa5b50036	! t0_kref+0x588:   	edge8n	%l4, %l6, %l2
	.word	0xa0deb968	! t0_kref+0x58c:   	smulcc	%i2, -0x698, %l0
	.word	0xafa388b9	! t0_kref+0x590:   	fsubs	%f14, %f25, %f23
	.word	0x99b38f90	! t0_kref+0x594:   	for	%f14, %f16, %f12
	.word	0xa5a44d32	! t0_kref+0x598:   	fsmuld	%f17, %f18, %f18
	.word	0xee0e2017	! t0_kref+0x59c:   	ldub	[%i0 + 0x17], %l7
	.word	0x9da0193d	! t0_kref+0x5a0:   	fstod	%f29, %f14
	.word	0xada00130	! t0_kref+0x5a4:   	fabss	%f16, %f22
	.word	0xbfb74f7f	! t0_kref+0x5a8:   	fornot1s	%f29, %f31, %f31
	.word	0xb1a01935	! t0_kref+0x5ac:   	fstod	%f21, %f24
	.word	0xbdb30f5e	! t0_kref+0x5b0:   	fornot1	%f12, %f30, %f30
	.word	0xb1a0193b	! t0_kref+0x5b4:   	fstod	%f27, %f24
	.word	0xeac81018	! t0_kref+0x5b8:   	ldsba	[%g0 + %i0]0x80, %l5
	.word	0x3d480007	! t0_kref+0x5bc:   	fbule,a,pt	%fcc0, _kref+0x5d8
	.word	0xa72c2016	! t0_kref+0x5c0:   	sll	%l0, 0x16, %l3
	.word	0xb3a00138	! t0_kref+0x5c4:   	fabss	%f24, %f25
	.word	0xa3a0053f	! t0_kref+0x5c8:   	fsqrts	%f31, %f17
	.word	0xa1a0193b	! t0_kref+0x5cc:   	fstod	%f27, %f16
	.word	0xbdb48d1a	! t0_kref+0x5d0:   	fandnot1	%f18, %f26, %f30
	.word	0x9da01110	! t0_kref+0x5d4:   	fxtod	%f16, %f14
	.word	0x31480004	! t0_kref+0x5d8:   	fba,a,pt	%fcc0, _kref+0x5e8
	.word	0x8582c000	! t0_kref+0x5dc:   	wr	%o3, %g0, %ccr
	.word	0x81840000	! t0_kref+0x5e0:   	wr	%l0, %g0, %y
	.word	0x1310a769	! t0_kref+0x5e4:   	sethi	%hi(0x429da400), %o1
	.word	0xe2070018	! t0_kref+0x5e8:   	ld	[%i4 + %i0], %l1
	.word	0xbda000ad	! t0_kref+0x5ec:   	fnegs	%f13, %f30
	.word	0x81ae8a54	! t0_kref+0x5f0:   	fcmpd	%fcc0, %f26, %f20
	.word	0xe1be5896	! t0_kref+0x5f4:   	stda	%f16, [%i1 + %l6]0xc4
	.word	0x81ac4a31	! t0_kref+0x5f8:   	fcmps	%fcc0, %f17, %f17
	.word	0xa7b2c32b	! t0_kref+0x5fc:   	bmask	%o3, %o3, %l3
	.word	0x99b58acc	! t0_kref+0x600:   	fpsub32	%f22, %f12, %f12
	.word	0xdb263fec	! t0_kref+0x604:   	st	%f13, [%i0 - 0x14]
	.word	0x3b800004	! t0_kref+0x608:   	fble,a	_kref+0x618
	.word	0x23302426	! t0_kref+0x60c:   	sethi	%hi(0xc0909800), %l1
	.word	0xb7b3cdbf	! t0_kref+0x610:   	fxors	%f15, %f31, %f27
	.word	0x9fc00004	! t0_kref+0x614:   	call	%g0 + %g4
	.word	0x9003401c	! t0_kref+0x618:   	add	%o5, %i4, %o0
	.word	0x81af0aad	! t0_kref+0x61c:   	fcmpes	%fcc0, %f28, %f13
	.word	0x20480001	! t0_kref+0x620:   	bn,a,pt	%icc, _kref+0x624
	.word	0xad400000	! t0_kref+0x624:   	mov	%y, %l6
	.word	0xf83e001d	! t0_kref+0x628:   	std	%i4, [%i0 + %i5]
	.word	0xbda40952	! t0_kref+0x62c:   	fmuld	%f16, %f18, %f30
	.word	0xe07f0019	! t0_kref+0x630:   	swap	[%i4 + %i1], %l0
	.word	0xadb68a16	! t0_kref+0x634:   	fpadd16	%f26, %f22, %f22
	.word	0x93b3006d	! t0_kref+0x638:   	edge8ln	%o4, %o5, %o1
	.word	0xadb3407b	! t0_kref+0x63c:   	edge8ln	%o5, %i3, %l6
	.word	0xec5e7ff0	! t0_kref+0x640:   	ldx	[%i1 - 0x10], %l6
	.word	0x8143c000	! t0_kref+0x644:   	stbar
	.word	0xbba488b0	! t0_kref+0x648:   	fsubs	%f18, %f16, %f29
	.word	0xb7b68d60	! t0_kref+0x64c:   	fnot1s	%f26, %f27
	.word	0xe416200a	! t0_kref+0x650:   	lduh	[%i0 + 0xa], %l2
	.word	0xb5b30c9e	! t0_kref+0x654:   	fandnot2	%f12, %f30, %f26
	.word	0x27800002	! t0_kref+0x658:   	fbul,a	_kref+0x660
	.word	0xa655692b	! t0_kref+0x65c:   	umul	%l5, 0x92b, %l3
	.word	0xafb3cc73	! t0_kref+0x660:   	fnors	%f15, %f19, %f23
	.word	0x81848000	! t0_kref+0x664:   	wr	%l2, %g0, %y
	.word	0x928020d7	! t0_kref+0x668:   	addcc	%g0, 0xd7, %o1
	.word	0xbdb44e71	! t0_kref+0x66c:   	fxnors	%f17, %f17, %f30
	.word	0xaa547900	! t0_kref+0x670:   	umul	%l1, -0x700, %l5
	.word	0xe47e001c	! t0_kref+0x674:   	swap	[%i0 + %i4], %l2
	.word	0xbda01930	! t0_kref+0x678:   	fstod	%f16, %f30
	.word	0xe2567ff4	! t0_kref+0x67c:   	ldsh	[%i1 - 0xc], %l1
	.word	0x37480007	! t0_kref+0x680:   	fbge,a,pt	%fcc0, _kref+0x69c
	.word	0xa2a6b087	! t0_kref+0x684:   	subcc	%i2, -0xf79, %l1
	.word	0xb3a00538	! t0_kref+0x688:   	fsqrts	%f24, %f25
	.word	0x9076801b	! t0_kref+0x68c:   	udiv	%i2, %i3, %o0
	.word	0x35800005	! t0_kref+0x690:   	fbue,a	_kref+0x6a4
	.word	0xe96e001d	! t0_kref+0x694:   	prefetch	%i0 + %i5, 20
	.word	0xace00012	! t0_kref+0x698:   	subccc	%g0, %l2, %l6
	.word	0x32480003	! t0_kref+0x69c:   	bne,a,pt	%icc, _kref+0x6a8
	.word	0x8143c000	! t0_kref+0x6a0:   	stbar
	.word	0xb7b00f3a	! t0_kref+0x6a4:   	fsrc2s	%f26, %f27
	.word	0x94256e84	! t0_kref+0x6a8:   	sub	%l5, 0xe84, %o2
	.word	0xa086efb7	! t0_kref+0x6ac:   	addcc	%i3, 0xfb7, %l0
	.word	0xadb60492	! t0_kref+0x6b0:   	fcmple32	%f24, %f18, %l6
	.word	0xb1b30a18	! t0_kref+0x6b4:   	fpadd16	%f12, %f24, %f24
	.word	0xa5b48598	! t0_kref+0x6b8:   	fcmpgt32	%f18, %f24, %l2
	.word	0x9db30dce	! t0_kref+0x6bc:   	fnand	%f12, %f14, %f14
	.word	0x81ae0aad	! t0_kref+0x6c0:   	fcmpes	%fcc0, %f24, %f13
	.word	0x8143c000	! t0_kref+0x6c4:   	stbar
	.word	0xec3e7ff8	! t0_kref+0x6c8:   	std	%l6, [%i1 - 8]
	.word	0x81def804	! t0_kref+0x6cc:   	flush	%i3 - 0x7fc
	.word	0xa9b6c280	! t0_kref+0x6d0:   	array32	%i3, %g0, %l4
	.word	0x30800002	! t0_kref+0x6d4:   	ba,a	_kref+0x6dc
	.word	0xe7ee501b	! t0_kref+0x6d8:   	prefetcha	%i1 + %i3, 19
	.word	0xaedb400c	! t0_kref+0x6dc:   	smulcc	%o5, %o4, %l7
	.word	0xe3066008	! t0_kref+0x6e0:   	ld	[%i1 + 8], %f17
	.word	0xb5a00158	! t0_kref+0x6e4:   	fabsd	%f24, %f26
	.word	0xa5b24200	! t0_kref+0x6e8:   	array8	%o1, %g0, %l2
	.word	0xb5a01a52	! t0_kref+0x6ec:   	fdtoi	%f18, %f26
	.word	0xd0780018	! t0_kref+0x6f0:   	swap	[%g0 + %i0], %o0
	.word	0xaa3aefe7	! t0_kref+0x6f4:   	xnor	%o3, 0xfe7, %l5
	.word	0x81ac8a32	! t0_kref+0x6f8:   	fcmps	%fcc0, %f18, %f18
	.word	0xa83a0010	! t0_kref+0x6fc:   	xnor	%o0, %l0, %l4
	.word	0xa6282c73	! t0_kref+0x700:   	andn	%g0, 0xc73, %l3
	.word	0xa40d8010	! t0_kref+0x704:   	and	%l6, %l0, %l2
	call	SYM(t0_subr3)
	.word	0xa8a7001b	! t0_kref+0x70c:   	subcc	%i4, %i3, %l4
	.word	0xa203401c	! t0_kref+0x710:   	add	%o5, %i4, %l1
	.word	0xa49d4008	! t0_kref+0x714:   	xorcc	%l5, %o0, %l2
	.word	0xd62e4000	! t0_kref+0x718:   	stb	%o3, [%i1]
	.word	0x29480001	! t0_kref+0x71c:   	fbl,a,pt	%fcc0, _kref+0x720
	.word	0xb9a00136	! t0_kref+0x720:   	fabss	%f22, %f28
	.word	0xaef6c017	! t0_kref+0x724:   	udivcc	%i3, %l7, %l7
	.word	0xbba0188f	! t0_kref+0x728:   	fitos	%f15, %f29
	.word	0xa7a01897	! t0_kref+0x72c:   	fitos	%f23, %f19
	.word	0xa69d000d	! t0_kref+0x730:   	xorcc	%l4, %o5, %l3
	.word	0xb1a70954	! t0_kref+0x734:   	fmuld	%f28, %f20, %f24
	.word	0xda6e2009	! t0_kref+0x738:   	ldstub	[%i0 + 9], %o5
	.word	0xafb4845a	! t0_kref+0x73c:   	fcmpne16	%f18, %f26, %l7
	.word	0xd3e65016	! t0_kref+0x740:   	casa	[%i1]0x80, %l6, %o1
	.word	0xa5a01931	! t0_kref+0x744:   	fstod	%f17, %f18
	.word	0xd44e3fe5	! t0_kref+0x748:   	ldsb	[%i0 - 0x1b], %o2
	.word	0xa9b60ada	! t0_kref+0x74c:   	fpsub32	%f24, %f26, %f20
	.word	0x2d0b3857	! t0_kref+0x750:   	sethi	%hi(0x2ce15c00), %l6
	.word	0x35800005	! t0_kref+0x754:   	fbue,a	_kref+0x768
	.word	0xb9a000b2	! t0_kref+0x758:   	fnegs	%f18, %f28
	.word	0x81ad8a4c	! t0_kref+0x75c:   	fcmpd	%fcc0, %f22, %f12
	.word	0x95b000b0	! t0_kref+0x760:   	edge16n	%g0, %l0, %o2
	.word	0xb9a0012f	! t0_kref+0x764:   	fabss	%f15, %f28
	.word	0xa7b60a30	! t0_kref+0x768:   	fpadd16s	%f24, %f16, %f19
	.word	0xd42e7fe3	! t0_kref+0x76c:   	stb	%o2, [%i1 - 0x1d]
	.word	0x9005c00b	! t0_kref+0x770:   	add	%l7, %o3, %o0
	.word	0x932d6004	! t0_kref+0x774:   	sll	%l5, 0x4, %o1
	.word	0x81ac0ab1	! t0_kref+0x778:   	fcmpes	%fcc0, %f16, %f17
	.word	0x9064c011	! t0_kref+0x77c:   	subc	%l3, %l1, %o0
	.word	0xe416201c	! t0_kref+0x780:   	lduh	[%i0 + 0x1c], %l2
	.word	0x35480001	! t0_kref+0x784:   	fbue,a,pt	%fcc0, _kref+0x788
	.word	0xbda01894	! t0_kref+0x788:   	fitos	%f20, %f30
	.word	0xa5a5895a	! t0_kref+0x78c:   	fmuld	%f22, %f26, %f18
	.word	0xf99e7fec	! t0_kref+0x790:   	ldda	[%i1 - 0x14]%asi, %f28
	.word	0xb1b58971	! t0_kref+0x794:   	fpmerge	%f22, %f17, %f24
	.word	0x9de3bfa0	! t0_kref+0x798:   	save	%sp, -0x60, %sp
	.word	0xa3eeadfc	! t0_kref+0x79c:   	restore	%i2, 0xdfc, %l1
	.word	0xac042465	! t0_kref+0x7a0:   	add	%l0, 0x465, %l6
	.word	0xd6e81018	! t0_kref+0x7a4:   	ldstuba	[%g0 + %i0]0x80, %o3
	.word	0xb7a01a31	! t0_kref+0x7a8:   	fstoi	%f17, %f27
	.word	0x8610200b	! t0_kref+0x7ac:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x7b0:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x7b4:   	be,a	_kref+0x7d8
	.word	0xaef2ad86	! t0_kref+0x7b8:   	udivcc	%o2, 0xd86, %l7
	.word	0x31480004	! t0_kref+0x7bc:   	fba,a,pt	%fcc0, _kref+0x7cc
	.word	0xb1a74d39	! t0_kref+0x7c0:   	fsmuld	%f29, %f25, %f24
	.word	0xadb68990	! t0_kref+0x7c4:   	bshuffle	%f26, %f16, %f22
	.word	0xb9a01938	! t0_kref+0x7c8:   	fstod	%f24, %f28
	.word	0x9004801c	! t0_kref+0x7cc:   	add	%l2, %i4, %o0
	.word	0xbfb00c20	! t0_kref+0x7d0:   	fzeros	%f31
	.word	0xf586501c	! t0_kref+0x7d4:   	lda	[%i1 + %i4]0x80, %f26
	.word	0xa3b4859a	! t0_kref+0x7d8:   	fcmpgt32	%f18, %f26, %l1
	.word	0x2f800007	! t0_kref+0x7dc:   	fbu,a	_kref+0x7f8
	.word	0x95b34200	! t0_kref+0x7e0:   	array8	%o5, %g0, %o2
	.word	0xe41e001d	! t0_kref+0x7e4:   	ldd	[%i0 + %i5], %l2
	.word	0x81afcabe	! t0_kref+0x7e8:   	fcmpes	%fcc0, %f31, %f30
	.word	0xada0003a	! t0_kref+0x7ec:   	fmovs	%f26, %f22
	.word	0x99a00552	! t0_kref+0x7f0:   	fsqrtd	%f18, %f12
	.word	0x94748013	! t0_kref+0x7f4:   	udiv	%l2, %l3, %o2
	.word	0xaa12c011	! t0_kref+0x7f8:   	or	%o3, %l1, %l5
	.word	0x95230008	! t0_kref+0x7fc:   	mulscc	%o4, %o0, %o2
	.word	0x90754010	! t0_kref+0x800:   	udiv	%l5, %l0, %o0
	.word	0x94736e1b	! t0_kref+0x804:   	udiv	%o5, 0xe1b, %o2
	.word	0xa1a0055e	! t0_kref+0x808:   	fsqrtd	%f30, %f16
	.word	0xad65c00b	! t0_kref+0x80c:   	movvs	%icc, %o3, %l6
	.word	0x90830016	! t0_kref+0x810:   	addcc	%o4, %l6, %o0
	.word	0x8143e040	! t0_kref+0x814:   	membar	0x40
	.word	0xd8b6101b	! t0_kref+0x818:   	stha	%o4, [%i0 + %i3]0x80
	.word	0xbda4482d	! t0_kref+0x81c:   	fadds	%f17, %f13, %f30
	.word	0xa4350015	! t0_kref+0x820:   	orn	%l4, %l5, %l2
	.word	0x9fc10000	! t0_kref+0x824:   	call	%g4
	.word	0xf4be501d	! t0_kref+0x828:   	stda	%i2, [%i1 + %i5]0x80
	.word	0xa0853955	! t0_kref+0x82c:   	addcc	%l4, -0x6ab, %l0
	.word	0xed68a041	! t0_kref+0x830:   	prefetch	%g2 + 0x41, 22
	.word	0xbba7883c	! t0_kref+0x834:   	fadds	%f30, %f28, %f29
	.word	0xa6f6b14b	! t0_kref+0x838:   	udivcc	%i2, -0xeb5, %l3
	.word	0xb5b3cab8	! t0_kref+0x83c:   	fpsub16s	%f15, %f24, %f26
	.word	0xa63eb41b	! t0_kref+0x840:   	xnor	%i2, -0xbe5, %l3
	.word	0x94c024c2	! t0_kref+0x844:   	addccc	%g0, 0x4c2, %o2
	.word	0xc368a007	! t0_kref+0x848:   	prefetch	%g2 + 7, 1
	.word	0xa7a01a52	! t0_kref+0x84c:   	fdtoi	%f18, %f19
	.word	0x81ad0abe	! t0_kref+0x850:   	fcmpes	%fcc0, %f20, %f30
	.word	0xac7c216a	! t0_kref+0x854:   	sdiv	%l0, 0x16a, %l6
	.word	0xafa0012f	! t0_kref+0x858:   	fabss	%f15, %f23
	.word	0xa016c008	! t0_kref+0x85c:   	or	%i3, %o0, %l0
	.word	0xae7a8016	! t0_kref+0x860:   	sdiv	%o2, %l6, %l7
	.word	0xb5a48d3a	! t0_kref+0x864:   	fsmuld	%f18, %f26, %f26
	.word	0x2d800006	! t0_kref+0x868:   	fbg,a	_kref+0x880
	.word	0xa3b5c0b3	! t0_kref+0x86c:   	edge16n	%l7, %l3, %l1
	.word	0x9db487d8	! t0_kref+0x870:   	pdist	%f18, %f24, %f14
	.word	0xa2dcc014	! t0_kref+0x874:   	smulcc	%l3, %l4, %l1
	.word	0x99a01056	! t0_kref+0x878:   	fdtox	%f22, %f12
	.word	0xa9a38850	! t0_kref+0x87c:   	faddd	%f14, %f16, %f20
	.word	0xaba00536	! t0_kref+0x880:   	fsqrts	%f22, %f21
	.word	0xaa744008	! t0_kref+0x884:   	udiv	%l1, %o0, %l5
	.word	0x8143c000	! t0_kref+0x888:   	stbar
	.word	0xab64a3b4	! t0_kref+0x88c:   	movle	%icc, 0x3b4, %l5
	.word	0xac154000	! t0_kref+0x890:   	or	%l5, %g0, %l6
	.word	0xb7a6c8bc	! t0_kref+0x894:   	fsubs	%f27, %f28, %f27
	.word	0xaba68830	! t0_kref+0x898:   	fadds	%f26, %f16, %f21
	.word	0xa9b60dde	! t0_kref+0x89c:   	fnand	%f24, %f30, %f20
	.word	0x9da00539	! t0_kref+0x8a0:   	fsqrts	%f25, %f14
	.word	0x925cc00d	! t0_kref+0x8a4:   	smul	%l3, %o5, %o1
	.word	0xa7a6c830	! t0_kref+0x8a8:   	fadds	%f27, %f16, %f19
	.word	0xa4533d53	! t0_kref+0x8ac:   	umul	%o4, -0x2ad, %l2
	.word	0xa28ee94c	! t0_kref+0x8b0:   	andcc	%i3, 0x94c, %l1
	.word	0x9da7885a	! t0_kref+0x8b4:   	faddd	%f30, %f26, %f14
	.word	0xab222541	! t0_kref+0x8b8:   	mulscc	%o0, 0x541, %l5
	.word	0xf82e7ffa	! t0_kref+0x8bc:   	stb	%i4, [%i1 - 6]
	.word	0x8143c000	! t0_kref+0x8c0:   	stbar
	.word	0x9da508ba	! t0_kref+0x8c4:   	fsubs	%f20, %f26, %f14
	.word	0xf51e4000	! t0_kref+0x8c8:   	ldd	[%i1], %f26
	.word	0x905d0009	! t0_kref+0x8cc:   	smul	%l4, %o1, %o0
	.word	0xafa0053e	! t0_kref+0x8d0:   	fsqrts	%f30, %f23
	.word	0x8610200b	! t0_kref+0x8d4:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x8d8:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x8dc:   	be,a	_kref+0x930
	.word	0xad44c000	! t0_kref+0x8e0:   	mov	%gsr, %l6
	.word	0xb5b68ddc	! t0_kref+0x8e4:   	fnand	%f26, %f28, %f26
	.word	0x254ffffc	! t0_kref+0x8e8:   	fblg,a,pt	%fcc0, _kref+0x8d8
	.word	0xda7e6004	! t0_kref+0x8ec:   	swap	[%i1 + 4], %o5
	.word	0xac9f22a7	! t0_kref+0x8f0:   	xorcc	%i4, 0x2a7, %l6
	.word	0x90f22f02	! t0_kref+0x8f4:   	udivcc	%o0, 0xf02, %o0
	.word	0xa5b58028	! t0_kref+0x8f8:   	edge8n	%l6, %o0, %l2
	.word	0xe24e3fe8	! t0_kref+0x8fc:   	ldsb	[%i0 - 0x18], %l1
	.word	0xaa1d800b	! t0_kref+0x900:   	xor	%l6, %o3, %l5
	.word	0xa206e704	! t0_kref+0x904:   	add	%i3, 0x704, %l1
	.word	0xae982334	! t0_kref+0x908:   	xorcc	%g0, 0x334, %l7
	.word	0xaf400000	! t0_kref+0x90c:   	mov	%y, %l7
	.word	0xafa60832	! t0_kref+0x910:   	fadds	%f24, %f18, %f23
	.word	0xa2568015	! t0_kref+0x914:   	umul	%i2, %l5, %l1
	.word	0x81ae0ad6	! t0_kref+0x918:   	fcmped	%fcc0, %f24, %f22
	.word	0xd03e3fe8	! t0_kref+0x91c:   	std	%o0, [%i0 - 0x18]
	.word	0xbda488ce	! t0_kref+0x920:   	fsubd	%f18, %f14, %f30
	.word	0xa0d739a8	! t0_kref+0x924:   	umulcc	%i4, -0x658, %l0
	.word	0x26480004	! t0_kref+0x928:   	bl,a,pt	%icc, _kref+0x938
	.word	0xed1e0000	! t0_kref+0x92c:   	ldd	[%i0], %f22
	.word	0x3c480002	! t0_kref+0x930:   	bpos,a,pt	%icc, _kref+0x938
	.word	0xb9a00552	! t0_kref+0x934:   	fsqrtd	%f18, %f28
	.word	0x86102004	! t0_kref+0x938:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x93c:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x940:   	be,a	_kref+0x960
	.word	0xbda01a3c	! t0_kref+0x944:   	fstoi	%f28, %f30
	.word	0xaca5401b	! t0_kref+0x948:   	subcc	%l5, %i3, %l6
	.word	0x9da00538	! t0_kref+0x94c:   	fsqrts	%f24, %f14
	.word	0xe4e81018	! t0_kref+0x950:   	ldstuba	[%g0 + %i0]0x80, %l2
	.word	0xe19f5a58	! t0_kref+0x954:   	ldda	[%i5 + %i0]0xd2, %f16
	.word	0xe85e2018	! t0_kref+0x958:   	ldx	[%i0 + 0x18], %l4
	.word	0x81800000	! t0_kref+0x95c:   	mov	%g0, %y
	.word	0x81ac0ab0	! t0_kref+0x960:   	fcmpes	%fcc0, %f16, %f16
	.word	0xeb063fe4	! t0_kref+0x964:   	ld	[%i0 - 0x1c], %f21
	.word	0xf320a01c	! t0_kref+0x968:   	st	%f25, [%g2 + 0x1c]
	.word	0x22800008	! t0_kref+0x96c:   	be,a	_kref+0x98c
	.word	0xc36e6018	! t0_kref+0x970:   	prefetch	%i1 + 0x18, 1
	.word	0xa7b20329	! t0_kref+0x974:   	bmask	%o0, %o1, %l3
	.word	0xae1560ea	! t0_kref+0x978:   	or	%l5, 0xea, %l7
	.word	0xa07caef4	! t0_kref+0x97c:   	sdiv	%l2, 0xef4, %l0
	.word	0xa1a01933	! t0_kref+0x980:   	fstod	%f19, %f16
	.word	0xd406401c	! t0_kref+0x984:   	ld	[%i1 + %i4], %o2
	.word	0x9215401c	! t0_kref+0x988:   	or	%l5, %i4, %o1
	.word	0xe56e401c	! t0_kref+0x98c:   	prefetch	%i1 + %i4, 18
	.word	0xe91e401d	! t0_kref+0x990:   	ldd	[%i1 + %i5], %f20
	.word	0xe1be5852	! t0_kref+0x994:   	stda	%f16, [%i1 + %l2]0xc2
	.word	0x86102015	! t0_kref+0x998:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x99c:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x9a0:   	be,a	_kref+0x9d0
	.word	0x81dda7fc	! t0_kref+0x9a4:   	flush	%l6 + 0x7fc
	.word	0x2cbffffd	! t0_kref+0x9a8:   	bneg,a	_kref+0x99c
	.word	0xd6263ff8	! t0_kref+0x9ac:   	st	%o3, [%i0 - 8]
	.word	0xb9a588dc	! t0_kref+0x9b0:   	fsubd	%f22, %f28, %f28
	.word	0xbda000be	! t0_kref+0x9b4:   	fnegs	%f30, %f30
	.word	0x2b0a9b7f	! t0_kref+0x9b8:   	sethi	%hi(0x2a6dfc00), %l5
	.word	0xc12e401c	! t0_kref+0x9bc:   	st	%fsr, [%i1 + %i4]
	.word	0xb3a0013b	! t0_kref+0x9c0:   	fabss	%f27, %f25
	.word	0xaf702465	! t0_kref+0x9c4:   	popc	0x465, %l7
	.word	0xa23e801c	! t0_kref+0x9c8:   	xnor	%i2, %i4, %l1
	.word	0xbda48956	! t0_kref+0x9cc:   	fmuld	%f18, %f22, %f30
	.word	0x902225e4	! t0_kref+0x9d0:   	sub	%o0, 0x5e4, %o0
	.word	0xaa048017	! t0_kref+0x9d4:   	add	%l2, %l7, %l5
	.word	0xf426200c	! t0_kref+0x9d8:   	st	%i2, [%i0 + 0xc]
	call	SYM(t0_subr1)
	.word	0xaa8dc01c	! t0_kref+0x9e0:   	andcc	%l7, %i4, %l5
	.word	0x81820000	! t0_kref+0x9e4:   	wr	%o0, %g0, %y
	.word	0xed1e2010	! t0_kref+0x9e8:   	ldd	[%i0 + 0x10], %f22
	.word	0xfd180018	! t0_kref+0x9ec:   	ldd	[%g0 + %i0], %f30
	.word	0xaed4801b	! t0_kref+0x9f0:   	umulcc	%l2, %i3, %l7
	.word	0xa49d4017	! t0_kref+0x9f4:   	xorcc	%l5, %l7, %l2
	.word	0xe616600e	! t0_kref+0x9f8:   	lduh	[%i1 + 0xe], %l3
	.word	0x81ad0a58	! t0_kref+0x9fc:   	fcmpd	%fcc0, %f20, %f24
	.word	0xe44e401a	! t0_kref+0xa00:   	ldsb	[%i1 + %i2], %l2
	.word	0xe20e8019	! t0_kref+0xa04:   	ldub	[%i2 + %i1], %l1
	.word	0xa4bf0010	! t0_kref+0xa08:   	xnorcc	%i4, %l0, %l2
	.word	0xaaf4000b	! t0_kref+0xa0c:   	udivcc	%l0, %o3, %l5
	.word	0xb1a000b2	! t0_kref+0xa10:   	fnegs	%f18, %f24
	.word	0x9de3bfa0	! t0_kref+0xa14:   	save	%sp, -0x60, %sp
	.word	0x93eeb9b5	! t0_kref+0xa18:   	restore	%i2, -0x64b, %o1
	.word	0xb5b486f0	! t0_kref+0xa1c:   	fmul8ulx16	%f18, %f16, %f26
	.word	0x24800004	! t0_kref+0xa20:   	ble,a	_kref+0xa30
	.word	0x923dfb58	! t0_kref+0xa24:   	xnor	%l7, -0x4a8, %o1
	.word	0x24480001	! t0_kref+0xa28:   	ble,a,pt	%icc, _kref+0xa2c
	.word	0xe09e101d	! t0_kref+0xa2c:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0xb9b5098c	! t0_kref+0xa30:   	bshuffle	%f20, %f12, %f28
	.word	0x9da01032	! t0_kref+0xa34:   	fstox	%f18, %f14
	.word	0xb1b00cd0	! t0_kref+0xa38:   	fnot2	%f16, %f24
	.word	0xd00e0000	! t0_kref+0xa3c:   	ldub	[%i0], %o0
	.word	0xa9a44d32	! t0_kref+0xa40:   	fsmuld	%f17, %f18, %f20
	.word	0xa3a0013b	! t0_kref+0xa44:   	fabss	%f27, %f17
	.word	0x81ad8ab5	! t0_kref+0xa48:   	fcmpes	%fcc0, %f22, %f21
	.word	0xa05e801b	! t0_kref+0xa4c:   	smul	%i2, %i3, %l0
	.word	0xa5a01910	! t0_kref+0xa50:   	fitod	%f16, %f18
	.word	0xb9a38d3c	! t0_kref+0xa54:   	fsmuld	%f14, %f28, %f28
	.word	0x9ba0013d	! t0_kref+0xa58:   	fabss	%f29, %f13
	.word	0x24800002	! t0_kref+0xa5c:   	ble,a	_kref+0xa64
	.word	0xc06e3feb	! t0_kref+0xa60:   	ldstub	[%i0 - 0x15], %g0
	.word	0xb5b5cd60	! t0_kref+0xa64:   	fnot1s	%f23, %f26
	.word	0xe91e3fe0	! t0_kref+0xa68:   	ldd	[%i0 - 0x20], %f20
	.word	0xdb865000	! t0_kref+0xa6c:   	lda	[%i1]0x80, %f13
	.word	0xee266008	! t0_kref+0xa70:   	st	%l7, [%i1 + 8]
	.word	0x925ae618	! t0_kref+0xa74:   	smul	%o3, 0x618, %o1
	.word	0xc0280019	! t0_kref+0xa78:   	clrb	[%g0 + %i1]
	.word	0xa5700016	! t0_kref+0xa7c:   	popc	%l6, %l2
	.word	0xea067fec	! t0_kref+0xa80:   	ld	[%i1 - 0x14], %l5
	.word	0xb5a0013a	! t0_kref+0xa84:   	fabss	%f26, %f26
	.word	0xdf86101c	! t0_kref+0xa88:   	lda	[%i0 + %i4]0x80, %f15
	.word	0xe6366012	! t0_kref+0xa8c:   	sth	%l3, [%i1 + 0x12]
	.word	0xa5a3cd32	! t0_kref+0xa90:   	fsmuld	%f15, %f18, %f18
	.word	0xe62e001a	! t0_kref+0xa94:   	stb	%l3, [%i0 + %i2]
	.word	0xa7828011	! t0_kref+0xa98:   	wr	%o2, %l1, %gsr
	.word	0xa8e4401a	! t0_kref+0xa9c:   	subccc	%l1, %i2, %l4
	.word	0xa4fa4009	! t0_kref+0xaa0:   	sdivcc	%o1, %o1, %l2
	.word	0x81844000	! t0_kref+0xaa4:   	wr	%l1, %g0, %y
	.word	0xd228a020	! t0_kref+0xaa8:   	stb	%o1, [%g2 + 0x20]
	.word	0x91b40596	! t0_kref+0xaac:   	fcmpgt32	%f16, %f22, %o0
	.word	0x81af0a4e	! t0_kref+0xab0:   	fcmpd	%fcc0, %f28, %f14
	.word	0xe1ee501d	! t0_kref+0xab4:   	prefetcha	%i1 + %i5, 16
	.word	0xe1067ff8	! t0_kref+0xab8:   	ld	[%i1 - 8], %f16
	.word	0xbda388dc	! t0_kref+0xabc:   	fsubd	%f14, %f28, %f30
	.word	0xa9b34d60	! t0_kref+0xac0:   	fnot1s	%f13, %f20
	.word	0xa1b4044c	! t0_kref+0xac4:   	fcmpne16	%f16, %f12, %l0
	.word	0xe0c61000	! t0_kref+0xac8:   	ldswa	[%i0]0x80, %l0
	.word	0x9da48958	! t0_kref+0xacc:   	fmuld	%f18, %f24, %f14
	.word	0xa9b3ca38	! t0_kref+0xad0:   	fpadd16s	%f15, %f24, %f20
	.word	0x9ba708ba	! t0_kref+0xad4:   	fsubs	%f28, %f26, %f13
	.word	0x81ac4ab5	! t0_kref+0xad8:   	fcmpes	%fcc0, %f17, %f21
	.word	0xa9b68973	! t0_kref+0xadc:   	fpmerge	%f26, %f19, %f20
	.word	0x9fa01a50	! t0_kref+0xae0:   	fdtoi	%f16, %f15
	.word	0x24480006	! t0_kref+0xae4:   	ble,a,pt	%icc, _kref+0xafc
	.word	0xa5400000	! t0_kref+0xae8:   	mov	%y, %l2
	.word	0x20800004	! t0_kref+0xaec:   	bn,a	_kref+0xafc
	.word	0x91b3859a	! t0_kref+0xaf0:   	fcmpgt32	%f14, %f26, %o0
	.word	0xe1be5895	! t0_kref+0xaf4:   	stda	%f16, [%i1 + %l5]0xc4
	.word	0xbdb48ddc	! t0_kref+0xaf8:   	fnand	%f18, %f28, %f30
	.word	0x9407001b	! t0_kref+0xafc:   	add	%i4, %i3, %o2
	.word	0xeefe501c	! t0_kref+0xb00:   	swapa	[%i1 + %i4]0x80, %l7
	.word	0x86102003	! t0_kref+0xb04:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xb08:   	bne,a	_kref+0xb08
	.word	0x86a0e001	! t0_kref+0xb0c:   	subcc	%g3, 1, %g3
	.word	0x2c800006	! t0_kref+0xb10:   	bneg,a	_kref+0xb28
	.word	0x81834000	! t0_kref+0xb14:   	wr	%o5, %g0, %y
	.word	0x91073420	! t0_kref+0xb18:   	taddcc	%i4, -0xbe0, %o0
	.word	0x91b3859a	! t0_kref+0xb1c:   	fcmpgt32	%f14, %f26, %o0
	call	SYM(t0_subr3)
	.word	0xa5b60c94	! t0_kref+0xb24:   	fandnot2	%f24, %f20, %f18
	.word	0xa4fd7915	! t0_kref+0xb28:   	sdivcc	%l5, -0x6eb, %l2
	call	SYM(t0_subr1)
	.word	0xe120a020	! t0_kref+0xb30:   	st	%f16, [%g2 + 0x20]
	.word	0xe0680019	! t0_kref+0xb34:   	ldstub	[%g0 + %i1], %l0
	.word	0xb1a48d34	! t0_kref+0xb38:   	fsmuld	%f18, %f20, %f24
	.word	0xac05ea6d	! t0_kref+0xb3c:   	add	%l7, 0xa6d, %l6
	.word	0xa0dce299	! t0_kref+0xb40:   	smulcc	%l3, 0x299, %l0
	.word	0x3c480003	! t0_kref+0xb44:   	bpos,a,pt	%icc, _kref+0xb50
	.word	0xbbb00770	! t0_kref+0xb48:   	fpack16	%f16, %f29
	.word	0x27480007	! t0_kref+0xb4c:   	fbul,a,pt	%fcc0, _kref+0xb68
	.word	0xeac71018	! t0_kref+0xb50:   	ldswa	[%i4 + %i0]0x80, %l5
	.word	0x3e480001	! t0_kref+0xb54:   	bvc,a,pt	%icc, _kref+0xb58
	.word	0xe4267ff4	! t0_kref+0xb58:   	st	%l2, [%i1 - 0xc]
	.word	0xd03f4018	! t0_kref+0xb5c:   	std	%o0, [%i5 + %i0]
	.word	0xac56801c	! t0_kref+0xb60:   	umul	%i2, %i4, %l6
	.word	0xa8aa2a81	! t0_kref+0xb64:   	andncc	%o0, 0xa81, %l4
	.word	0x81854000	! t0_kref+0xb68:   	wr	%l5, %g0, %y
	.word	0x99b30910	! t0_kref+0xb6c:   	faligndata	%f12, %f16, %f12
	.word	0xa5a548b4	! t0_kref+0xb70:   	fsubs	%f21, %f20, %f18
	.word	0x3e480003	! t0_kref+0xb74:   	bvc,a,pt	%icc, _kref+0xb80
	.word	0xeb067fe4	! t0_kref+0xb78:   	ld	[%i1 - 0x1c], %f21
	.word	0x901d73d8	! t0_kref+0xb7c:   	xor	%l5, -0xc28, %o0
	.word	0x81ad8ade	! t0_kref+0xb80:   	fcmped	%fcc0, %f22, %f30
	.word	0xbba4c8ba	! t0_kref+0xb84:   	fsubs	%f19, %f26, %f29
	.word	0xdb067ffc	! t0_kref+0xb88:   	ld	[%i1 - 4], %f13
	.word	0xa5b68ada	! t0_kref+0xb8c:   	fpsub32	%f26, %f26, %f18
	.word	0x21800005	! t0_kref+0xb90:   	fbn,a	_kref+0xba4
	.word	0xa1a00552	! t0_kref+0xb94:   	fsqrtd	%f18, %f16
	.word	0xbbb64ea0	! t0_kref+0xb98:   	fsrc1s	%f25, %f29
	.word	0x29800003	! t0_kref+0xb9c:   	fbl,a	_kref+0xba8
	.word	0xb1a6882e	! t0_kref+0xba0:   	fadds	%f26, %f14, %f24
	.word	0xabb68a3b	! t0_kref+0xba4:   	fpadd16s	%f26, %f27, %f21
	.word	0xaa637e43	! t0_kref+0xba8:   	subc	%o5, -0x1bd, %l5
	.word	0xa07ea822	! t0_kref+0xbac:   	sdiv	%i2, 0x822, %l0
	.word	0xa6dcc015	! t0_kref+0xbb0:   	smulcc	%l3, %l5, %l3
	.word	0x8185c000	! t0_kref+0xbb4:   	wr	%l7, %g0, %y
	.word	0xda28a022	! t0_kref+0xbb8:   	stb	%o5, [%g2 + 0x22]
	.word	0xba103fe0	! t0_kref+0xbbc:   	mov	0xffffffe0, %i5
	.word	0x81820000	! t0_kref+0xbc0:   	wr	%o0, %g0, %y
	.word	0xb9a5094c	! t0_kref+0xbc4:   	fmuld	%f20, %f12, %f28
	.word	0xb5b00cd6	! t0_kref+0xbc8:   	fnot2	%f22, %f26
	.word	0x2a800008	! t0_kref+0xbcc:   	bcs,a	_kref+0xbec
	.word	0xb5a6094e	! t0_kref+0xbd0:   	fmuld	%f24, %f14, %f26
	.word	0x99b48c58	! t0_kref+0xbd4:   	fnor	%f18, %f24, %f12
	.word	0x9da74834	! t0_kref+0xbd8:   	fadds	%f29, %f20, %f14
	.word	0xdd1e0000	! t0_kref+0xbdc:   	ldd	[%i0], %f14
	.word	0xb5a01a39	! t0_kref+0xbe0:   	fstoi	%f25, %f26
	.word	0xa52a6005	! t0_kref+0xbe4:   	sll	%o1, 0x5, %l2
	.word	0xb5b58ad2	! t0_kref+0xbe8:   	fpsub32	%f22, %f18, %f26
	.word	0x9326b0eb	! t0_kref+0xbec:   	mulscc	%i2, -0xf15, %o1
	.word	0x9fc00004	! t0_kref+0xbf0:   	call	%g0 + %g4
	.word	0xe4267fe4	! t0_kref+0xbf4:   	st	%l2, [%i1 - 0x1c]
	.word	0xb6103ff2	! t0_kref+0xbf8:   	mov	0xfffffff2, %i3
	.word	0xe5b81019	! t0_kref+0xbfc:   	stda	%f18, [%g0 + %i1]0x80
	call	SYM(t0_subr1)
	.word	0x929df135	! t0_kref+0xc04:   	xorcc	%l7, -0xecb, %o1
	.word	0xbda50954	! t0_kref+0xc08:   	fmuld	%f20, %f20, %f30
	.word	0xa5a50952	! t0_kref+0xc0c:   	fmuld	%f20, %f18, %f18
	.word	0xd99e1a1a	! t0_kref+0xc10:   	ldda	[%i0 + %i2]0xd0, %f12
	.word	0xa5a01a33	! t0_kref+0xc14:   	fstoi	%f19, %f18
	.word	0xed200019	! t0_kref+0xc18:   	st	%f22, [%g0 + %i1]
	.word	0xe0063ff0	! t0_kref+0xc1c:   	ld	[%i0 - 0x10], %l0
	.word	0xa3a348bf	! t0_kref+0xc20:   	fsubs	%f13, %f31, %f17
	.word	0x907daafb	! t0_kref+0xc24:   	sdiv	%l6, 0xafb, %o0
	.word	0x2e800006	! t0_kref+0xc28:   	bvs,a	_kref+0xc40
	.word	0xafb340ad	! t0_kref+0xc2c:   	edge16n	%o5, %o5, %l7
	.word	0xa3a00534	! t0_kref+0xc30:   	fsqrts	%f20, %f17
	.word	0xe48e9019	! t0_kref+0xc34:   	lduba	[%i2 + %i1]0x80, %l2
	.word	0x91400000	! t0_kref+0xc38:   	mov	%y, %o0
	.word	0x9db686d2	! t0_kref+0xc3c:   	fmul8sux16	%f26, %f18, %f14
	.word	0xee0e6010	! t0_kref+0xc40:   	ldub	[%i1 + 0x10], %l7
	.word	0xf186101c	! t0_kref+0xc44:   	lda	[%i0 + %i4]0x80, %f24
	.word	0xafa01897	! t0_kref+0xc48:   	fitos	%f23, %f23
	.word	0x22480008	! t0_kref+0xc4c:   	be,a,pt	%icc, _kref+0xc6c
	.word	0xb5a0055c	! t0_kref+0xc50:   	fsqrtd	%f28, %f26
	.word	0xf83e3fe8	! t0_kref+0xc54:   	std	%i4, [%i0 - 0x18]
	.word	0xa4a4c013	! t0_kref+0xc58:   	subcc	%l3, %l3, %l2
	.word	0xaa86c01c	! t0_kref+0xc5c:   	addcc	%i3, %i4, %l5
	.word	0xecd81018	! t0_kref+0xc60:   	ldxa	[%g0 + %i0]0x80, %l6
	.word	0xec364000	! t0_kref+0xc64:   	sth	%l6, [%i1]
	.word	0xb5b7ca39	! t0_kref+0xc68:   	fpadd16s	%f31, %f25, %f26
	.word	0x8143e040	! t0_kref+0xc6c:   	membar	0x40
	.word	0xb1b78f9a	! t0_kref+0xc70:   	for	%f30, %f26, %f24
	.word	0x920c74cd	! t0_kref+0xc74:   	and	%l1, -0xb33, %o1
	.word	0xf9be188c	! t0_kref+0xc78:   	stda	%f28, [%i0 + %o4]0xc4
	call	SYM(t0_subr0)
	.word	0xa5a58d38	! t0_kref+0xc80:   	fsmuld	%f22, %f24, %f18
	.word	0x86102003	! t0_kref+0xc84:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0xc88:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t0_kref+0xc8c:   	be,a	_kref+0xce8
	.word	0xa9a00039	! t0_kref+0xc90:   	fmovs	%f25, %f20
	.word	0xa1b50e7c	! t0_kref+0xc94:   	fxnors	%f20, %f28, %f16
	.word	0xe19e7ff6	! t0_kref+0xc98:   	ldda	[%i1 - 0xa]%asi, %f16
	.word	0xa676800c	! t0_kref+0xc9c:   	udiv	%i2, %o4, %l3
	.word	0x394ffffa	! t0_kref+0xca0:   	fbuge,a,pt	%fcc0, _kref+0xc88
	.word	0xa785adc9	! t0_kref+0xca4:   	wr	%l6, 0xdc9, %gsr
	.word	0xa1400000	! t0_kref+0xca8:   	mov	%y, %l0
	.word	0x20bffff7	! t0_kref+0xcac:   	bn,a	_kref+0xc88
	.word	0xaa127686	! t0_kref+0xcb0:   	or	%o1, -0x97a, %l5
	.word	0xada00554	! t0_kref+0xcb4:   	fsqrtd	%f20, %f22
	.word	0x8143c000	! t0_kref+0xcb8:   	stbar
	.word	0x2abffff3	! t0_kref+0xcbc:   	bcs,a	_kref+0xc88
	.word	0xe7e61015	! t0_kref+0xcc0:   	casa	[%i0]0x80, %l5, %l3
	.word	0xa8058016	! t0_kref+0xcc4:   	add	%l6, %l6, %l4
	.word	0xb9b78e1a	! t0_kref+0xcc8:   	fand	%f30, %f26, %f28
	.word	0xaa8b2744	! t0_kref+0xccc:   	andcc	%o4, 0x744, %l5
	.word	0xb5a60950	! t0_kref+0xcd0:   	fmuld	%f24, %f16, %f26
	.word	0xea4e6004	! t0_kref+0xcd4:   	ldsb	[%i1 + 4], %l5
	.word	0x81d82b3b	! t0_kref+0xcd8:   	flush	%g0 + 0xb3b
	.word	0xbdb60f9a	! t0_kref+0xcdc:   	for	%f24, %f26, %f30
	.word	0x91b785d6	! t0_kref+0xce0:   	fcmpeq32	%f30, %f22, %o0
	.word	0xc07e7fec	! t0_kref+0xce4:   	swap	[%i1 - 0x14], %g0
	.word	0xbda01938	! t0_kref+0xce8:   	fstod	%f24, %f30
	.word	0xee2e3ffc	! t0_kref+0xcec:   	stb	%l7, [%i0 - 4]
	.word	0xaaa223bd	! t0_kref+0xcf0:   	subcc	%o0, 0x3bd, %l5
	.word	0x33480004	! t0_kref+0xcf4:   	fbe,a,pt	%fcc0, _kref+0xd04
	.word	0xbdb30d16	! t0_kref+0xcf8:   	fandnot1	%f12, %f22, %f30
	.word	0xe11e6010	! t0_kref+0xcfc:   	ldd	[%i1 + 0x10], %f16
	.word	0xe6100018	! t0_kref+0xd00:   	lduh	[%g0 + %i0], %l3
	.word	0x29232070	! t0_kref+0xd04:   	sethi	%hi(0x8c81c000), %l4
	.word	0xac040011	! t0_kref+0xd08:   	add	%l0, %l1, %l6
	.word	0xa1b7891a	! t0_kref+0xd0c:   	faligndata	%f30, %f26, %f16
	.word	0xd86e7fe1	! t0_kref+0xd10:   	ldstub	[%i1 - 0x1f], %o4
	.word	0xd216001b	! t0_kref+0xd14:   	lduh	[%i0 + %i3], %o1
	.word	0xaa7cc01c	! t0_kref+0xd18:   	sdiv	%l3, %i4, %l5
	.word	0x35480004	! t0_kref+0xd1c:   	fbue,a,pt	%fcc0, _kref+0xd2c
	.word	0xb9ab8030	! t0_kref+0xd20:   	fmovsule	%fcc0, %f16, %f28
	.word	0xb7b6cf7c	! t0_kref+0xd24:   	fornot1s	%f27, %f28, %f27
	.word	0xf9266004	! t0_kref+0xd28:   	st	%f28, [%i1 + 4]
	.word	0xa60a637c	! t0_kref+0xd2c:   	and	%o1, 0x37c, %l3
	call	SYM(t0_subr1)
	.word	0xa21c4009	! t0_kref+0xd34:   	xor	%l1, %o1, %l1
	.word	0xe26e600e	! t0_kref+0xd38:   	ldstub	[%i1 + 0xe], %l1
	.word	0xec3e6010	! t0_kref+0xd3c:   	std	%l6, [%i1 + 0x10]
	.word	0x9de3bfa0	! t0_kref+0xd40:   	save	%sp, -0x60, %sp
	.word	0xafef0019	! t0_kref+0xd44:   	restore	%i4, %i1, %l7
	.word	0xabb38c71	! t0_kref+0xd48:   	fnors	%f14, %f17, %f21
	.word	0xeb68a004	! t0_kref+0xd4c:   	prefetch	%g2 + 4, 21
	.word	0xa9a4483c	! t0_kref+0xd50:   	fadds	%f17, %f28, %f20
	.word	0xab25801b	! t0_kref+0xd54:   	mulscc	%l6, %i3, %l5
	.word	0xbbb00f3f	! t0_kref+0xd58:   	fsrc2s	%f31, %f29
	.word	0xae75c008	! t0_kref+0xd5c:   	udiv	%l7, %o0, %l7
	.word	0xb1a01a5a	! t0_kref+0xd60:   	fdtoi	%f26, %f24
	.word	0x99a0055e	! t0_kref+0xd64:   	fsqrtd	%f30, %f12
	.word	0x9de3bfa0	! t0_kref+0xd68:   	save	%sp, -0x60, %sp
	.word	0xadef001a	! t0_kref+0xd6c:   	restore	%i4, %i2, %l6
	.word	0xb5a00558	! t0_kref+0xd70:   	fsqrtd	%f24, %f26
	.word	0x210310b0	! t0_kref+0xd74:   	sethi	%hi(0xc42c000), %l0
	.word	0xa6f5001a	! t0_kref+0xd78:   	udivcc	%l4, %i2, %l3
	.word	0x92a6c009	! t0_kref+0xd7c:   	subcc	%i3, %o1, %o1
	.word	0xee6e3fee	! t0_kref+0xd80:   	ldstub	[%i0 - 0x12], %l7
	.word	0xd27e601c	! t0_kref+0xd84:   	swap	[%i1 + 0x1c], %o1
	.word	0x2c480001	! t0_kref+0xd88:   	bneg,a,pt	%icc, _kref+0xd8c
	.word	0xf19e1a1b	! t0_kref+0xd8c:   	ldda	[%i0 + %i3]0xd0, %f24
	.word	0xe4167ff4	! t0_kref+0xd90:   	lduh	[%i1 - 0xc], %l2
	.word	0xe60e401a	! t0_kref+0xd94:   	ldub	[%i1 + %i2], %l3
	.word	0xbda0103a	! t0_kref+0xd98:   	fstox	%f26, %f30
	.word	0x151a7aeb	! t0_kref+0xd9c:   	sethi	%hi(0x69ebac00), %o2
	.word	0xd4100019	! t0_kref+0xda0:   	lduh	[%g0 + %i1], %o2
	.word	0xa3b7054c	! t0_kref+0xda4:   	fcmpeq16	%f28, %f12, %l1
	.word	0x31800001	! t0_kref+0xda8:   	fba,a	_kref+0xdac
	.word	0xae5ac008	! t0_kref+0xdac:   	smul	%o3, %o0, %l7
	.word	0xe3062010	! t0_kref+0xdb0:   	ld	[%i0 + 0x10], %f17
	.word	0xa3a01a33	! t0_kref+0xdb4:   	fstoi	%f19, %f17
	.word	0xa49a6e2b	! t0_kref+0xdb8:   	xorcc	%o1, 0xe2b, %l2
	.word	0xabb60ded	! t0_kref+0xdbc:   	fnands	%f24, %f13, %f21
	.word	0xe06e7fe7	! t0_kref+0xdc0:   	ldstub	[%i1 - 0x19], %l0
	.word	0xb7a000b0	! t0_kref+0xdc4:   	fnegs	%f16, %f27
	.word	0xa1b506fa	! t0_kref+0xdc8:   	fmul8ulx16	%f20, %f26, %f16
	.word	0xc807bfe4	! t0_kref+0xdcc:   	ld	[%fp - 0x1c], %g4
	.word	0xaad5f82c	! t0_kref+0xdd0:   	umulcc	%l7, -0x7d4, %l5
	.word	0xdf062004	! t0_kref+0xdd4:   	ld	[%i0 + 4], %f15
	.word	0xada5cd3e	! t0_kref+0xdd8:   	fsmuld	%f23, %f30, %f22
	.word	0xda30a024	! t0_kref+0xddc:   	sth	%o5, [%g2 + 0x24]
	.word	0xb1a00536	! t0_kref+0xde0:   	fsqrts	%f22, %f24
	.word	0xbbb7ca35	! t0_kref+0xde4:   	fpadd16s	%f31, %f21, %f29
	.word	0xa4254015	! t0_kref+0xde8:   	sub	%l5, %l5, %l2
	.word	0xbfa74837	! t0_kref+0xdec:   	fadds	%f29, %f23, %f31
	.word	0xdf871018	! t0_kref+0xdf0:   	lda	[%i4 + %i0]0x80, %f15
	.word	0xec3f4018	! t0_kref+0xdf4:   	std	%l6, [%i5 + %i0]
	.word	0xe3066000	! t0_kref+0xdf8:   	ld	[%i1], %f17
	.word	0x9fb70fbf	! t0_kref+0xdfc:   	fors	%f28, %f31, %f15
	.word	0x3d800004	! t0_kref+0xe00:   	fbule,a	_kref+0xe10
	.word	0xd0062000	! t0_kref+0xe04:   	ld	[%i0], %o0
	.word	0xb1a5094c	! t0_kref+0xe08:   	fmuld	%f20, %f12, %f24
	.word	0x3b480006	! t0_kref+0xe0c:   	fble,a,pt	%fcc0, _kref+0xe24
	.word	0x81da0008	! t0_kref+0xe10:   	flush	%o0 + %o0
	.word	0x3a480002	! t0_kref+0xe14:   	bcc,a,pt	%icc, _kref+0xe1c
	.word	0xda6e0000	! t0_kref+0xe18:   	ldstub	[%i0], %o5
	.word	0xb5b68ade	! t0_kref+0xe1c:   	fpsub32	%f26, %f30, %f26
	.word	0xa1b4404d	! t0_kref+0xe20:   	edge8l	%l1, %o5, %l0
	.word	0xa1a7095e	! t0_kref+0xe24:   	fmuld	%f28, %f30, %f16
	.word	0xa6d43b2c	! t0_kref+0xe28:   	umulcc	%l0, -0x4d4, %l3
	.word	0xc06e3fef	! t0_kref+0xe2c:   	ldstub	[%i0 - 0x11], %g0
	.word	0x92f6afeb	! t0_kref+0xe30:   	udivcc	%i2, 0xfeb, %o1
	.word	0xd48e1000	! t0_kref+0xe34:   	lduba	[%i0]0x80, %o2
	.word	0xa217362d	! t0_kref+0xe38:   	or	%i4, -0x9d3, %l1
	.word	0xea267ff0	! t0_kref+0xe3c:   	st	%l5, [%i1 - 0x10]
	.word	0xadb78f58	! t0_kref+0xe40:   	fornot1	%f30, %f24, %f22
	.word	0x81d80012	! t0_kref+0xe44:   	flush	%g0 + %l2
	.word	0x232b9760	! t0_kref+0xe48:   	sethi	%hi(0xae5d8000), %l1
	.word	0x36800005	! t0_kref+0xe4c:   	bge,a	_kref+0xe60
	.word	0xa52d6007	! t0_kref+0xe50:   	sll	%l5, 0x7, %l2
	.word	0x8143c000	! t0_kref+0xe54:   	stbar
	.word	0xb9a01a37	! t0_kref+0xe58:   	fstoi	%f23, %f28
	.word	0x81830000	! t0_kref+0xe5c:   	wr	%o4, %g0, %y
	.word	0x34480001	! t0_kref+0xe60:   	bg,a,pt	%icc, _kref+0xe64
	.word	0xa9b68efa	! t0_kref+0xe64:   	fornot2s	%f26, %f26, %f20
	.word	0xa5a30956	! t0_kref+0xe68:   	fmuld	%f12, %f22, %f18
	.word	0xbba0053c	! t0_kref+0xe6c:   	fsqrts	%f28, %f29
	.word	0xb5b68d60	! t0_kref+0xe70:   	fnot1s	%f26, %f26
	.word	0xdf063ff4	! t0_kref+0xe74:   	ld	[%i0 - 0xc], %f15
	.word	0xf820a000	! t0_kref+0xe78:   	st	%i4, [%g2]
	.word	0x908b0011	! t0_kref+0xe7c:   	andcc	%o4, %l1, %o0
	.word	0xa5b00cef	! t0_kref+0xe80:   	fnot2s	%f15, %f18
	.word	0x90dd250c	! t0_kref+0xe84:   	smulcc	%l4, 0x50c, %o0
	.word	0xa5a60852	! t0_kref+0xe88:   	faddd	%f24, %f18, %f18
	.word	0xa7a00131	! t0_kref+0xe8c:   	fabss	%f17, %f19
	.word	0x9db74731	! t0_kref+0xe90:   	fmuld8ulx16	%f29, %f17, %f14
	.word	0xb5a01937	! t0_kref+0xe94:   	fstod	%f23, %f26
	.word	0xf42e001a	! t0_kref+0xe98:   	stb	%i2, [%i0 + %i2]
	.word	0xa9a588d6	! t0_kref+0xe9c:   	fsubd	%f22, %f22, %f20
	.word	0x22480007	! t0_kref+0xea0:   	be,a,pt	%icc, _kref+0xebc
	.word	0xa784000d	! t0_kref+0xea4:   	wr	%l0, %o5, %gsr
	.word	0x81af0abf	! t0_kref+0xea8:   	fcmpes	%fcc0, %f28, %f31
	.word	0xf19e1000	! t0_kref+0xeac:   	ldda	[%i0]0x80, %f24
	.word	0xe02e001a	! t0_kref+0xeb0:   	stb	%l0, [%i0 + %i2]
	.word	0xb3b00cf0	! t0_kref+0xeb4:   	fnot2s	%f16, %f25
	.word	0xa5a00558	! t0_kref+0xeb8:   	fsqrtd	%f24, %f18
	.word	0xc3ee100a	! t0_kref+0xebc:   	prefetcha	%i0 + %o2, 1
	.word	0x8585401c	! t0_kref+0xec0:   	wr	%l5, %i4, %ccr
	.word	0xea366000	! t0_kref+0xec4:   	sth	%l5, [%i1]
	.word	0x9da58956	! t0_kref+0xec8:   	fmuld	%f22, %f22, %f14
	.word	0xafa348b0	! t0_kref+0xecc:   	fsubs	%f13, %f16, %f23
	.word	0xbfa00537	! t0_kref+0xed0:   	fsqrts	%f23, %f31
	.word	0x8185c000	! t0_kref+0xed4:   	wr	%l7, %g0, %y
	.word	0xe1000018	! t0_kref+0xed8:   	ld	[%g0 + %i0], %f16
	.word	0xa4a6c000	! t0_kref+0xedc:   	subcc	%i3, %g0, %l2
	.word	0xb1a648bc	! t0_kref+0xee0:   	fsubs	%f25, %f28, %f24
	.word	0xa6f836e9	! t0_kref+0xee4:   	sdivcc	%g0, -0x917, %l3
	.word	0xa5a40852	! t0_kref+0xee8:   	faddd	%f16, %f18, %f18
	.word	0xabb00f3b	! t0_kref+0xeec:   	fsrc2s	%f27, %f21
	.word	0x9db60c9e	! t0_kref+0xef0:   	fandnot2	%f24, %f30, %f14
	.word	0xaba0052e	! t0_kref+0xef4:   	fsqrts	%f14, %f21
	.word	0xab240015	! t0_kref+0xef8:   	mulscc	%l0, %l5, %l5
	.word	0x90202bb3	! t0_kref+0xefc:   	sub	%g0, 0xbb3, %o0
	.word	0x2f480007	! t0_kref+0xf00:   	fbu,a,pt	%fcc0, _kref+0xf1c
	.word	0xf99e3ff0	! t0_kref+0xf04:   	ldda	[%i0 - 0x10]%asi, %f28
	.word	0x81abcaba	! t0_kref+0xf08:   	fcmpes	%fcc0, %f15, %f26
	.word	0x34800007	! t0_kref+0xf0c:   	bg,a	_kref+0xf28
	.word	0xa25a615e	! t0_kref+0xf10:   	smul	%o1, 0x15e, %l1
	.word	0x3d480002	! t0_kref+0xf14:   	fbule,a,pt	%fcc0, _kref+0xf1c
	.word	0xee463ff0	! t0_kref+0xf18:   	ldsw	[%i0 - 0x10], %l7
	.word	0xda20a038	! t0_kref+0xf1c:   	st	%o5, [%g2 + 0x38]
	.word	0xa7a0189c	! t0_kref+0xf20:   	fitos	%f28, %f19
	.word	0x9da00138	! t0_kref+0xf24:   	fabss	%f24, %f14
	call	SYM(t0_subr3)
	.word	0x9422400a	! t0_kref+0xf2c:   	sub	%o1, %o2, %o2
	.word	0xa1a6095e	! t0_kref+0xf30:   	fmuld	%f24, %f30, %f16
	.word	0x29238f31	! t0_kref+0xf34:   	sethi	%hi(0x8e3cc400), %l4
	.word	0x22480006	! t0_kref+0xf38:   	be,a,pt	%icc, _kref+0xf50
	.word	0xe7060000	! t0_kref+0xf3c:   	ld	[%i0], %f19
	.word	0x8143c000	! t0_kref+0xf40:   	stbar
	.word	0x24480004	! t0_kref+0xf44:   	ble,a,pt	%icc, _kref+0xf54
	.word	0xe000a008	! t0_kref+0xf48:   	ld	[%g2 + 8], %l0
	.word	0x3f480006	! t0_kref+0xf4c:   	fbo,a,pt	%fcc0, _kref+0xf64
	.word	0xa6847b8d	! t0_kref+0xf50:   	addcc	%l1, -0x473, %l3
	.word	0xbbb58e7e	! t0_kref+0xf54:   	fxnors	%f22, %f30, %f29
	.word	0xee8e5000	! t0_kref+0xf58:   	lduba	[%i1]0x80, %l7
	.word	0x2524dc9f	! t0_kref+0xf5c:   	sethi	%hi(0x93727c00), %l2
	.word	0xa2c6c015	! t0_kref+0xf60:   	addccc	%i3, %l5, %l1
	.word	0xafb44d60	! t0_kref+0xf64:   	fnot1s	%f17, %f23
	.word	0x290606bf	! t0_kref+0xf68:   	sethi	%hi(0x181afc00), %l4
	.word	0xc168a049	! t0_kref+0xf6c:   	prefetch	%g2 + 0x49, 0
	.word	0xed3e7ff0	! t0_kref+0xf70:   	std	%f22, [%i1 - 0x10]
	.word	0xe99e1a5c	! t0_kref+0xf74:   	ldda	[%i0 + %i4]0xd2, %f20
	.word	0x81848000	! t0_kref+0xf78:   	wr	%l2, %g0, %y
	.word	0x858369e6	! t0_kref+0xf7c:   	wr	%o5, 0x9e6, %ccr
	.word	0xeb060000	! t0_kref+0xf80:   	ld	[%i0], %f21
	.word	0x86102002	! t0_kref+0xf84:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xf88:   	bne,a	_kref+0xf88
	.word	0x86a0e001	! t0_kref+0xf8c:   	subcc	%g3, 1, %g3
	.word	0xa02ac017	! t0_kref+0xf90:   	andn	%o3, %l7, %l0
	.word	0x9de3bfa0	! t0_kref+0xf94:   	save	%sp, -0x60, %sp
	.word	0xa7e83921	! t0_kref+0xf98:   	restore	%g0, -0x6df, %l3
	.word	0xadb4412b	! t0_kref+0xf9c:   	edge32n	%l1, %o3, %l6
	.word	0x86102001	! t0_kref+0xfa0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xfa4:   	bne,a	_kref+0xfa4
	.word	0x86a0e001	! t0_kref+0xfa8:   	subcc	%g3, 1, %g3
	.word	0x81820000	! t0_kref+0xfac:   	wr	%o0, %g0, %y
	.word	0x94fc0013	! t0_kref+0xfb0:   	sdivcc	%l0, %l3, %o2
	.word	0xa2ba69af	! t0_kref+0xfb4:   	xnorcc	%o1, 0x9af, %l1
	.word	0xbda348bd	! t0_kref+0xfb8:   	fsubs	%f13, %f29, %f30
	.word	0xa8568010	! t0_kref+0xfbc:   	umul	%i2, %l0, %l4
	.word	0xa5b6c0d7	! t0_kref+0xfc0:   	edge16l	%i3, %l7, %l2
	.word	0xa6f27a1f	! t0_kref+0xfc4:   	udivcc	%o1, -0x5e1, %l3
	.word	0xa6754017	! t0_kref+0xfc8:   	udiv	%l5, %l7, %l3
	.word	0xa32c0015	! t0_kref+0xfcc:   	sll	%l0, %l5, %l1
	.word	0xa9a34832	! t0_kref+0xfd0:   	fadds	%f13, %f18, %f20
	.word	0xbfa00537	! t0_kref+0xfd4:   	fsqrts	%f23, %f31
	.word	0xa6143e7d	! t0_kref+0xfd8:   	or	%l0, -0x183, %l3
	.word	0x2a800007	! t0_kref+0xfdc:   	bcs,a	_kref+0xff8
	.word	0xa6dd0010	! t0_kref+0xfe0:   	smulcc	%l4, %l0, %l3
	.word	0xe84e001a	! t0_kref+0xfe4:   	ldsb	[%i0 + %i2], %l4
	.word	0xa5b64d60	! t0_kref+0xfe8:   	fnot1s	%f25, %f18
	.word	0xd20e201f	! t0_kref+0xfec:   	ldub	[%i0 + 0x1f], %o1
	.word	0xb5a58950	! t0_kref+0xff0:   	fmuld	%f22, %f16, %f26
	.word	0xfd1e7fe8	! t0_kref+0xff4:   	ldd	[%i1 - 0x18], %f30
	.word	0xa5a01a52	! t0_kref+0xff8:   	fdtoi	%f18, %f18
	.word	0x2d23a76c	! t0_kref+0xffc:   	sethi	%hi(0x8e9db000), %l6
	.word	0x9de3bfa0	! t0_kref+0x1000:   	save	%sp, -0x60, %sp
	.word	0x80360019	! t0_kref+0x1004:   	orn	%i0, %i1, %g0
	.word	0xa5ee752a	! t0_kref+0x1008:   	restore	%i1, -0xad6, %l2
	.word	0xef68a088	! t0_kref+0x100c:   	prefetch	%g2 + 0x88, 23
	.word	0x28480007	! t0_kref+0x1010:   	bleu,a,pt	%icc, _kref+0x102c
	.word	0xaba00035	! t0_kref+0x1014:   	fmovs	%f21, %f21
	.word	0xe9be1896	! t0_kref+0x1018:   	stda	%f20, [%i0 + %l6]0xc4
	.word	0x9fa608bb	! t0_kref+0x101c:   	fsubs	%f24, %f27, %f15
	.word	0xb5a60930	! t0_kref+0x1020:   	fmuls	%f24, %f16, %f26
	.word	0xa13a8008	! t0_kref+0x1024:   	sra	%o2, %o0, %l0
	.word	0xa49d4009	! t0_kref+0x1028:   	xorcc	%l5, %o1, %l2
	.word	0x920b4010	! t0_kref+0x102c:   	and	%o5, %l0, %o1
	.word	0xe11e6008	! t0_kref+0x1030:   	ldd	[%i1 + 8], %f16
	.word	0xfb070019	! t0_kref+0x1034:   	ld	[%i4 + %i1], %f29
	.word	0x230ebedc	! t0_kref+0x1038:   	sethi	%hi(0x3afb7000), %l1
	.word	0xa0fdf8c7	! t0_kref+0x103c:   	sdivcc	%l7, -0x739, %l0
	.word	0xa27a8011	! t0_kref+0x1040:   	sdiv	%o2, %l1, %l1
	.word	0x81af4ab3	! t0_kref+0x1044:   	fcmpes	%fcc0, %f29, %f19
	.word	0xb5a0110c	! t0_kref+0x1048:   	fxtod	%f12, %f26
	.word	0x9da000bb	! t0_kref+0x104c:   	fnegs	%f27, %f14
	.word	0x903d4000	! t0_kref+0x1050:   	not	%l5, %o0
	call	SYM(t0_subr0)
	.word	0xbda388b2	! t0_kref+0x1058:   	fsubs	%f14, %f18, %f30
	.word	0xa1b4c120	! t0_kref+0x105c:   	edge32n	%l3, %g0, %l0
	.word	0xb7a01890	! t0_kref+0x1060:   	fitos	%f16, %f27
	.word	0xe4070019	! t0_kref+0x1064:   	ld	[%i4 + %i1], %l2
	.word	0xb1a4883d	! t0_kref+0x1068:   	fadds	%f18, %f29, %f24
	.word	0xa1322016	! t0_kref+0x106c:   	srl	%o0, 0x16, %l0
	.word	0xbfa588b0	! t0_kref+0x1070:   	fsubs	%f22, %f16, %f31
	.word	0xf99e9a18	! t0_kref+0x1074:   	ldda	[%i2 + %i0]0xd0, %f28
	.word	0xaefd6373	! t0_kref+0x1078:   	sdivcc	%l5, 0x373, %l7
	.word	0x940dc011	! t0_kref+0x107c:   	and	%l7, %l1, %o2
	.word	0xabb6c330	! t0_kref+0x1080:   	bmask	%i3, %l0, %l5
	.word	0x25480007	! t0_kref+0x1084:   	fblg,a,pt	%fcc0, _kref+0x10a0
	.word	0x953da002	! t0_kref+0x1088:   	sra	%l6, 0x2, %o2
	.word	0x9f414000	! t0_kref+0x108c:   	mov	%pc, %o7
	.word	0xad1d7fc7	! t0_kref+0x1090:   	tsubcctv	%l5, -0x39, %l6
	.word	0xd9e65017	! t0_kref+0x1094:   	casa	[%i1]0x80, %l7, %o4
	.word	0xb9a4c8ba	! t0_kref+0x1098:   	fsubs	%f19, %f26, %f28
	.word	0xa5a0053f	! t0_kref+0x109c:   	fsqrts	%f31, %f18
	.word	0xfd060000	! t0_kref+0x10a0:   	ld	[%i0], %f30
	.word	0x932ac00b	! t0_kref+0x10a4:   	sll	%o3, %o3, %o1
	.word	0xbfa01a52	! t0_kref+0x10a8:   	fdtoi	%f18, %f31
	.word	0x2f480004	! t0_kref+0x10ac:   	fbu,a,pt	%fcc0, _kref+0x10bc
	.word	0xa2146c2f	! t0_kref+0x10b0:   	or	%l1, 0xc2f, %l1
	.word	0x90de801a	! t0_kref+0x10b4:   	smulcc	%i2, %i2, %o0
	.word	0xf36e7ff8	! t0_kref+0x10b8:   	prefetch	%i1 - 8, 25
	.word	0xf8763ff0	! t0_kref+0x10bc:   	stx	%i4, [%i0 - 0x10]
	.word	0xa7400000	! t0_kref+0x10c0:   	mov	%y, %l3
	.word	0xbba01a37	! t0_kref+0x10c4:   	fstoi	%f23, %f29
	.word	0xd6262008	! t0_kref+0x10c8:   	st	%o3, [%i0 + 8]
	.word	0xb9a40958	! t0_kref+0x10cc:   	fmuld	%f16, %f24, %f28
	.word	0x940a377c	! t0_kref+0x10d0:   	and	%o0, -0x884, %o2
	.word	0xbfa748b1	! t0_kref+0x10d4:   	fsubs	%f29, %f17, %f31
	.word	0xd46e401a	! t0_kref+0x10d8:   	ldstub	[%i1 + %i2], %o2
	.word	0x95b58074	! t0_kref+0x10dc:   	edge8ln	%l6, %l4, %o2
	.word	0xb5a01a31	! t0_kref+0x10e0:   	fstoi	%f17, %f26
	.word	0xb3a0053e	! t0_kref+0x10e4:   	fsqrts	%f30, %f25
	.word	0xaaf5b119	! t0_kref+0x10e8:   	udivcc	%l6, -0xee7, %l5
	.word	0xf96e2000	! t0_kref+0x10ec:   	prefetch	%i0, 28
	.word	0x81580000	! t0_kref+0x10f0:   	flushw
	.word	0x81580000	! t0_kref+0x10f4:   	flushw
	.word	0x37480004	! t0_kref+0x10f8:   	fbge,a,pt	%fcc0, _kref+0x1108
	.word	0x8143c000	! t0_kref+0x10fc:   	stbar
	.word	0x81ac0ade	! t0_kref+0x1100:   	fcmped	%fcc0, %f16, %f30
	.word	0x3a800006	! t0_kref+0x1104:   	bcc,a	_kref+0x111c
	.word	0xada6cd3f	! t0_kref+0x1108:   	fsmuld	%f27, %f31, %f22
	.word	0x22800001	! t0_kref+0x110c:   	be,a	_kref+0x1110
	.word	0xe2e81018	! t0_kref+0x1110:   	ldstuba	[%g0 + %i0]0x80, %l1
	.word	0xa2ff0011	! t0_kref+0x1114:   	sdivcc	%i4, %l1, %l1
	.word	0xaa2f2886	! t0_kref+0x1118:   	andn	%i4, 0x886, %l5
	.word	0xadb60a16	! t0_kref+0x111c:   	fpadd16	%f24, %f22, %f22
	.word	0x30480007	! t0_kref+0x1120:   	ba,a,pt	%icc, _kref+0x113c
	.word	0xe006600c	! t0_kref+0x1124:   	ld	[%i1 + 0xc], %l0
	.word	0xec6e001a	! t0_kref+0x1128:   	ldstub	[%i0 + %i2], %l6
	.word	0x25356d55	! t0_kref+0x112c:   	sethi	%hi(0xd5b55400), %l2
	.word	0xb9b48f90	! t0_kref+0x1130:   	for	%f18, %f16, %f28
	.word	0xa1b78ed6	! t0_kref+0x1134:   	fornot2	%f30, %f22, %f16
	.word	0x3b800007	! t0_kref+0x1138:   	fble,a	_kref+0x1154
	.word	0xb5a01930	! t0_kref+0x113c:   	fstod	%f16, %f26
!	.word	0x3bbfd3b0	! t0_kref+0x1140:   	fble,a	SYM(t0_subr0)
	   	fble,a	SYM(t0_subr0)
	.word	0x9f414000	! t0_kref+0x1144:   	mov	%pc, %o7
	.word	0xae020011	! t0_kref+0x1148:   	add	%o0, %l1, %l7
	.word	0xd2067fe0	! t0_kref+0x114c:   	ld	[%i1 - 0x20], %o1
	.word	0xed067fe8	! t0_kref+0x1150:   	ld	[%i1 - 0x18], %f22
	.word	0x94d6a0bd	! t0_kref+0x1154:   	umulcc	%i2, 0xbd, %o2
	.word	0xa5a0055e	! t0_kref+0x1158:   	fsqrtd	%f30, %f18
	.word	0x81ad4a39	! t0_kref+0x115c:   	fcmps	%fcc0, %f21, %f25
	.word	0xe08e101a	! t0_kref+0x1160:   	lduba	[%i0 + %i2]0x80, %l0
	.word	0xa678000d	! t0_kref+0x1164:   	sdiv	%g0, %o5, %l3
	.word	0xae054009	! t0_kref+0x1168:   	add	%l5, %o1, %l7
	.word	0xea270019	! t0_kref+0x116c:   	st	%l5, [%i4 + %i1]
	call	SYM(t0_subr0)
	.word	0xb5b009af	! t0_kref+0x1174:   	fexpand	%f15, %f26
	.word	0x2d29a306	! t0_kref+0x1178:   	sethi	%hi(0xa68c1800), %l6
	.word	0xa4157971	! t0_kref+0x117c:   	or	%l5, -0x68f, %l2
	.word	0xa4e40015	! t0_kref+0x1180:   	subccc	%l0, %l5, %l2
	.word	0x9de3bfa0	! t0_kref+0x1184:   	save	%sp, -0x60, %sp
	.word	0xb616f8a7	! t0_kref+0x1188:   	or	%i3, -0x759, %i3
	.word	0xa7e8362c	! t0_kref+0x118c:   	restore	%g0, -0x9d4, %l3
	.word	0x2c800001	! t0_kref+0x1190:   	bneg,a	_kref+0x1194
	.word	0x92600013	! t0_kref+0x1194:   	subc	%g0, %l3, %o1
	.word	0xbda0055e	! t0_kref+0x1198:   	fsqrtd	%f30, %f30
	.word	0xa0f5770b	! t0_kref+0x119c:   	udivcc	%l5, -0x8f5, %l0
	call	SYM(t0_subr1)
	.word	0xd26e0000	! t0_kref+0x11a4:   	ldstub	[%i0], %o1
	.word	0xa9b5008c	! t0_kref+0x11a8:   	edge16	%l4, %o4, %l4
	.word	0xf9ee101b	! t0_kref+0x11ac:   	prefetcha	%i0 + %i3, 28
	.word	0x9bb50a3a	! t0_kref+0x11b0:   	fpadd16s	%f20, %f26, %f13
	.word	0xe60e8018	! t0_kref+0x11b4:   	ldub	[%i2 + %i0], %l3
	.word	0xa1b48dd6	! t0_kref+0x11b8:   	fnand	%f18, %f22, %f16
	.word	0xaba0052d	! t0_kref+0x11bc:   	fsqrts	%f13, %f21
	.word	0x9073000b	! t0_kref+0x11c0:   	udiv	%o4, %o3, %o0
	.word	0xe80e6006	! t0_kref+0x11c4:   	ldub	[%i1 + 6], %l4
	call	SYM(t0_subr0)
	.word	0xa9b00ccc	! t0_kref+0x11cc:   	fnot2	%f12, %f20
	.word	0xf5180019	! t0_kref+0x11d0:   	ldd	[%g0 + %i1], %f26
	.word	0xf7ee101a	! t0_kref+0x11d4:   	prefetcha	%i0 + %i2, 27
	.word	0xa88c0017	! t0_kref+0x11d8:   	andcc	%l0, %l7, %l4
	.word	0xadb5032d	! t0_kref+0x11dc:   	bmask	%l4, %o5, %l6
	.word	0x9de3bfa0	! t0_kref+0x11e0:   	save	%sp, -0x60, %sp
	.word	0xa5ee801a	! t0_kref+0x11e4:   	restore	%i2, %i2, %l2
	.word	0xbfb58df2	! t0_kref+0x11e8:   	fnands	%f22, %f18, %f31
	.word	0x90826eb9	! t0_kref+0x11ec:   	addcc	%o1, 0xeb9, %o0
	.word	0xa47de570	! t0_kref+0x11f0:   	sdiv	%l7, 0x570, %l2
	.word	0x9db7cab3	! t0_kref+0x11f4:   	fpsub16s	%f31, %f19, %f14
	.word	0xada00558	! t0_kref+0x11f8:   	fsqrtd	%f24, %f22
	.word	0xbba0013b	! t0_kref+0x11fc:   	fabss	%f27, %f29
	.word	0x81db801f	! t0_kref+0x1200:   	flush	%sp + %i7
	.word	0xa3408000	! t0_kref+0x1204:   	mov	%ccr, %l1
	.word	0xb5b606f4	! t0_kref+0x1208:   	fmul8ulx16	%f24, %f20, %f26
	.word	0xc368a00f	! t0_kref+0x120c:   	prefetch	%g2 + 0xf, 1
	.word	0xa6a0323b	! t0_kref+0x1210:   	subcc	%g0, -0xdc5, %l3
	.word	0xe106001c	! t0_kref+0x1214:   	ld	[%i0 + %i4], %f16
	.word	0x909d36bc	! t0_kref+0x1218:   	xorcc	%l4, -0x944, %o0
	.word	0x3f480003	! t0_kref+0x121c:   	fbo,a,pt	%fcc0, _kref+0x1228
	.word	0x99a0015e	! t0_kref+0x1220:   	fabsd	%f30, %f12
	.word	0x33480007	! t0_kref+0x1224:   	fbe,a,pt	%fcc0, _kref+0x1240
	.word	0x8143c000	! t0_kref+0x1228:   	stbar
	.word	0xe1062018	! t0_kref+0x122c:   	ld	[%i0 + 0x18], %f16
	.word	0x2e800003	! t0_kref+0x1230:   	bvs,a	_kref+0x123c
	.word	0xae544010	! t0_kref+0x1234:   	umul	%l1, %l0, %l7
	.word	0xd91e4000	! t0_kref+0x1238:   	ldd	[%i1], %f12
	.word	0xa1b40d60	! t0_kref+0x123c:   	fnot1s	%f16, %f16
	.word	0x8143e040	! t0_kref+0x1240:   	membar	0x40
	.word	0xafb68134	! t0_kref+0x1244:   	edge32n	%i2, %l4, %l7
	.word	0x9276febc	! t0_kref+0x1248:   	udiv	%i3, -0x144, %o1
	.word	0x2f480003	! t0_kref+0x124c:   	fbu,a,pt	%fcc0, _kref+0x1258
	.word	0x9db40dd4	! t0_kref+0x1250:   	fnand	%f16, %f20, %f14
	.word	0x81ac8a33	! t0_kref+0x1254:   	fcmps	%fcc0, %f18, %f19
	.word	0x3e800001	! t0_kref+0x1258:   	bvc,a	_kref+0x125c
	.word	0xa7b58590	! t0_kref+0x125c:   	fcmpgt32	%f22, %f16, %l3
	.word	0x81dae166	! t0_kref+0x1260:   	flush	%o3 + 0x166
	.word	0xa1b7849e	! t0_kref+0x1264:   	fcmple32	%f30, %f30, %l0
	.word	0xada5c832	! t0_kref+0x1268:   	fadds	%f23, %f18, %f22
	.word	0x81ad8a3d	! t0_kref+0x126c:   	fcmps	%fcc0, %f22, %f29
	.word	0xa102a1d3	! t0_kref+0x1270:   	taddcc	%o2, 0x1d3, %l0
	.word	0xe7062018	! t0_kref+0x1274:   	ld	[%i0 + 0x18], %f19
	.word	0x921a000a	! t0_kref+0x1278:   	xor	%o0, %o2, %o1
	.word	0x92e5273d	! t0_kref+0x127c:   	subccc	%l4, 0x73d, %o1
	.word	0x9da01038	! t0_kref+0x1280:   	fstox	%f24, %f14
	.word	0x81ae0ab1	! t0_kref+0x1284:   	fcmpes	%fcc0, %f24, %f17
	.word	0xabb58494	! t0_kref+0x1288:   	fcmple32	%f22, %f20, %l5
	.word	0xebee501d	! t0_kref+0x128c:   	prefetcha	%i1 + %i5, 21
	.word	0x2c480001	! t0_kref+0x1290:   	bneg,a,pt	%icc, _kref+0x1294
	.word	0xa87dafa7	! t0_kref+0x1294:   	sdiv	%l6, 0xfa7, %l4
	.word	0xda36401b	! t0_kref+0x1298:   	sth	%o5, [%i1 + %i3]
	.word	0x9de3bfa0	! t0_kref+0x129c:   	save	%sp, -0x60, %sp
	.word	0xb2577205	! t0_kref+0x12a0:   	umul	%i5, -0xdfb, %i1
	.word	0xadef001b	! t0_kref+0x12a4:   	restore	%i4, %i3, %l6
	.word	0xb9a0190e	! t0_kref+0x12a8:   	fitod	%f14, %f28
	.word	0xf51e2010	! t0_kref+0x12ac:   	ldd	[%i0 + 0x10], %f26
	.word	0x9fa00532	! t0_kref+0x12b0:   	fsqrts	%f18, %f15
	.word	0xe8c81019	! t0_kref+0x12b4:   	ldsba	[%g0 + %i1]0x80, %l4
	.word	0xa9a68956	! t0_kref+0x12b8:   	fmuld	%f26, %f22, %f20
	.word	0x878020e0	! t0_kref+0x12bc:   	mov	0xe0, %asi
	call	SYM(t0_subr3)
	.word	0x99a60954	! t0_kref+0x12c4:   	fmuld	%f24, %f20, %f12
	.word	0xa32a0015	! t0_kref+0x12c8:   	sll	%o0, %l5, %l1
	.word	0x99a0193f	! t0_kref+0x12cc:   	fstod	%f31, %f12
	.word	0xa614e178	! t0_kref+0x12d0:   	or	%l3, 0x178, %l3
	.word	0x81aecaba	! t0_kref+0x12d4:   	fcmpes	%fcc0, %f27, %f26
	.word	0xdd063fec	! t0_kref+0x12d8:   	ld	[%i0 - 0x14], %f14
	.word	0xbba01895	! t0_kref+0x12dc:   	fitos	%f21, %f29
	.word	0xdb801018	! t0_kref+0x12e0:   	lda	[%g0 + %i0]0x80, %f13
	.word	0xd2263fe0	! t0_kref+0x12e4:   	st	%o1, [%i0 - 0x20]
	.word	0xee5f4018	! t0_kref+0x12e8:   	ldx	[%i5 + %i0], %l7
	.word	0x81ae0ada	! t0_kref+0x12ec:   	fcmped	%fcc0, %f24, %f26
	.word	0x81834000	! t0_kref+0x12f0:   	wr	%o5, %g0, %y
	.word	0xfd070019	! t0_kref+0x12f4:   	ld	[%i4 + %i1], %f30
	.word	0x21480003	! t0_kref+0x12f8:   	fbn,a,pt	%fcc0, _kref+0x1304
	.word	0xada01938	! t0_kref+0x12fc:   	fstod	%f24, %f22
	.word	0xb5a01037	! t0_kref+0x1300:   	fstox	%f23, %f26
	.word	0xaed5c014	! t0_kref+0x1304:   	umulcc	%l7, %l4, %l7
	.word	0x151ff08f	! t0_kref+0x1308:   	sethi	%hi(0x7fc23c00), %o2
	.word	0xac380017	! t0_kref+0x130c:   	xnor	%g0, %l7, %l6
	.word	0x35480003	! t0_kref+0x1310:   	fbue,a,pt	%fcc0, _kref+0x131c
	.word	0xc0267ff4	! t0_kref+0x1314:   	clr	[%i1 - 0xc]
	.word	0xabb0077e	! t0_kref+0x1318:   	fpack16	%f30, %f21
	.word	0xac5cfe95	! t0_kref+0x131c:   	smul	%l3, -0x16b, %l6
	.word	0xe19e5a1c	! t0_kref+0x1320:   	ldda	[%i1 + %i4]0xd0, %f16
	.word	0xa81ef4bc	! t0_kref+0x1324:   	xor	%i3, -0xb44, %l4
	.word	0x9fb44d60	! t0_kref+0x1328:   	fnot1s	%f17, %f15
	.word	0x37800002	! t0_kref+0x132c:   	fbge,a	_kref+0x1334
	.word	0x8143c000	! t0_kref+0x1330:   	stbar
	.word	0xa80eb0be	! t0_kref+0x1334:   	and	%i2, -0xf42, %l4
	.word	0xf9ee101c	! t0_kref+0x1338:   	prefetcha	%i0 + %i4, 28
	.word	0xa5a000b7	! t0_kref+0x133c:   	fnegs	%f23, %f18
	.word	0xf8766000	! t0_kref+0x1340:   	stx	%i4, [%i1]
	.word	0x9216c01a	! t0_kref+0x1344:   	or	%i3, %i2, %o1
	.word	0xa89aa0e5	! t0_kref+0x1348:   	xorcc	%o2, 0xe5, %l4
	.word	0x36480002	! t0_kref+0x134c:   	bge,a,pt	%icc, _kref+0x1354
	.word	0xb7a00138	! t0_kref+0x1350:   	fabss	%f24, %f27
	.word	0xafa01a2d	! t0_kref+0x1354:   	fstoi	%f13, %f23
	.word	0xada01899	! t0_kref+0x1358:   	fitos	%f25, %f22
	.word	0x95b440eb	! t0_kref+0x135c:   	edge16ln	%l1, %o3, %o2
	.word	0xafa00538	! t0_kref+0x1360:   	fsqrts	%f24, %f23
	.word	0xbfa6083b	! t0_kref+0x1364:   	fadds	%f24, %f27, %f31
	.word	0xe3b8a040	! t0_kref+0x1368:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xac2c292f	! t0_kref+0x136c:   	andn	%l0, 0x92f, %l6
	.word	0xd8760000	! t0_kref+0x1370:   	stx	%o4, [%i0]
	.word	0x901b0008	! t0_kref+0x1374:   	xor	%o4, %o0, %o0
	.word	0xb3a5c93f	! t0_kref+0x1378:   	fmuls	%f23, %f31, %f25
	.word	0x90a5000a	! t0_kref+0x137c:   	subcc	%l4, %o2, %o0
	.word	0xd9be5892	! t0_kref+0x1380:   	stda	%f12, [%i1 + %l2]0xc4
	.word	0xe99e1000	! t0_kref+0x1384:   	ldda	[%i0]0x80, %f20
	.word	0x13057352	! t0_kref+0x1388:   	sethi	%hi(0x15cd4800), %o1
	.word	0x9202800a	! t0_kref+0x138c:   	add	%o2, %o2, %o1
	.word	0xf51fbe48	! t0_kref+0x1390:   	ldd	[%fp - 0x1b8], %f26
	.word	0xa1b5099c	! t0_kref+0x1394:   	bshuffle	%f20, %f28, %f16
	.word	0xe91e2000	! t0_kref+0x1398:   	ldd	[%i0], %f20
	.word	0x34480001	! t0_kref+0x139c:   	bg,a,pt	%icc, _kref+0x13a0
	.word	0xa494e563	! t0_kref+0x13a0:   	orcc	%l3, 0x563, %l2
	.word	0xbda01a3b	! t0_kref+0x13a4:   	fstoi	%f27, %f30
	.word	0x81ab8a4e	! t0_kref+0x13a8:   	fcmpd	%fcc0, %f14, %f14
	.word	0xbdb40d60	! t0_kref+0x13ac:   	fnot1s	%f16, %f30
	.word	0xd43e401d	! t0_kref+0x13b0:   	std	%o2, [%i1 + %i5]
	.word	0xa056e393	! t0_kref+0x13b4:   	umul	%i3, 0x393, %l0
	.word	0xac12b061	! t0_kref+0x13b8:   	or	%o2, -0xf9f, %l6
	.word	0xf76e6010	! t0_kref+0x13bc:   	prefetch	%i1 + 0x10, 27
	.word	0xa8d5395d	! t0_kref+0x13c0:   	umulcc	%l4, -0x6a3, %l4
	.word	0xa0f40015	! t0_kref+0x13c4:   	udivcc	%l0, %l5, %l0
	.word	0xafa00137	! t0_kref+0x13c8:   	fabss	%f23, %f23
	.word	0xd20e2011	! t0_kref+0x13cc:   	ldub	[%i0 + 0x11], %o1
	.word	0xa01d0008	! t0_kref+0x13d0:   	xor	%l4, %o0, %l0
	.word	0x27800004	! t0_kref+0x13d4:   	fbul,a	_kref+0x13e4
	.word	0xa85cc01a	! t0_kref+0x13d8:   	smul	%l3, %i2, %l4
	.word	0x2c800003	! t0_kref+0x13dc:   	bneg,a	_kref+0x13e8
	.word	0xa8da0011	! t0_kref+0x13e0:   	smulcc	%o0, %l1, %l4
	.word	0xe48e1000	! t0_kref+0x13e4:   	lduba	[%i0]0x80, %l2
	.word	0x901c0010	! t0_kref+0x13e8:   	xor	%l0, %l0, %o0
	.word	0xef6e401b	! t0_kref+0x13ec:   	prefetch	%i1 + %i3, 23
	.word	0xed1e401d	! t0_kref+0x13f0:   	ldd	[%i1 + %i5], %f22
	.word	0xa682a83f	! t0_kref+0x13f4:   	addcc	%o2, 0x83f, %l3
	.word	0x29800003	! t0_kref+0x13f8:   	fbl,a	_kref+0x1404
	.word	0xae83001a	! t0_kref+0x13fc:   	addcc	%o4, %i2, %l7
	.word	0xafb680b1	! t0_kref+0x1400:   	edge16n	%i2, %l1, %l7
	.word	0xf9be5855	! t0_kref+0x1404:   	stda	%f28, [%i1 + %l5]0xc2
	.word	0xe696d019	! t0_kref+0x1408:   	lduha	[%i3 + %i1]0x80, %l3
	.word	0xa88afb74	! t0_kref+0x140c:   	andcc	%o3, -0x48c, %l4
	.word	0xaaa5c014	! t0_kref+0x1410:   	subcc	%l7, %l4, %l5
	.word	0xaeb83a82	! t0_kref+0x1414:   	xnorcc	%g0, -0x57e, %l7
	.word	0x9f414000	! t0_kref+0x1418:   	mov	%pc, %o7
	.word	0xe4680018	! t0_kref+0x141c:   	ldstub	[%g0 + %i0], %l2
	.word	0xd87e401c	! t0_kref+0x1420:   	swap	[%i1 + %i4], %o4
	.word	0xe19e9a18	! t0_kref+0x1424:   	ldda	[%i2 + %i0]0xd0, %f16
	.word	0xa4f023e0	! t0_kref+0x1428:   	udivcc	%g0, 0x3e0, %l2
	.word	0xff200018	! t0_kref+0x142c:   	st	%f31, [%g0 + %i0]
	.word	0x39480005	! t0_kref+0x1430:   	fbuge,a,pt	%fcc0, _kref+0x1444
	.word	0xbba7083e	! t0_kref+0x1434:   	fadds	%f28, %f30, %f29
	.word	0xa3b38514	! t0_kref+0x1438:   	fcmpgt16	%f14, %f20, %l1
	.word	0xa9b58030	! t0_kref+0x143c:   	edge8n	%l6, %l0, %l4
	.word	0xa9a01a35	! t0_kref+0x1440:   	fstoi	%f21, %f20
	.word	0xe91e3fe8	! t0_kref+0x1444:   	ldd	[%i0 - 0x18], %f20
	.word	0xe89e101d	! t0_kref+0x1448:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0x20480008	! t0_kref+0x144c:   	bn,a,pt	%icc, _kref+0x146c
	.word	0xab23000d	! t0_kref+0x1450:   	mulscc	%o4, %o5, %l5
	.word	0xa1a01035	! t0_kref+0x1454:   	fstox	%f21, %f16
	.word	0xa1a0055a	! t0_kref+0x1458:   	fsqrtd	%f26, %f16
	.word	0x81af0ad0	! t0_kref+0x145c:   	fcmped	%fcc0, %f28, %f16
	.word	0x93400000	! t0_kref+0x1460:   	mov	%y, %o1
	.word	0xd0266010	! t0_kref+0x1464:   	st	%o0, [%i1 + 0x10]
	.word	0xee780019	! t0_kref+0x1468:   	swap	[%g0 + %i1], %l7
	.word	0xe9be180a	! t0_kref+0x146c:   	stda	%f20, [%i0 + %o2]0xc0
	.word	0xd9be585b	! t0_kref+0x1470:   	stda	%f12, [%i1 + %i3]0xc2
	.word	0xa2f4401c	! t0_kref+0x1474:   	udivcc	%l1, %i4, %l1
	.word	0x8143c000	! t0_kref+0x1478:   	stbar
	.word	0xe81e2010	! t0_kref+0x147c:   	ldd	[%i0 + 0x10], %l4
	.word	0xa7a6c834	! t0_kref+0x1480:   	fadds	%f27, %f20, %f19
	.word	0x9db68a16	! t0_kref+0x1484:   	fpadd16	%f26, %f22, %f14
	.word	0xa6f2e5c3	! t0_kref+0x1488:   	udivcc	%o3, 0x5c3, %l3
	.word	0xabb38dee	! t0_kref+0x148c:   	fnands	%f14, %f14, %f21
	.word	0x81858000	! t0_kref+0x1490:   	wr	%l6, %g0, %y
	.word	0xa7024014	! t0_kref+0x1494:   	taddcc	%o1, %l4, %l3
	.word	0xb7a01a4e	! t0_kref+0x1498:   	fdtoi	%f14, %f27
	.word	0xc16e4014	! t0_kref+0x149c:   	prefetch	%i1 + %l4, 0
	.word	0xd02e001a	! t0_kref+0x14a0:   	stb	%o0, [%i0 + %i2]
	.word	0xac3ebc25	! t0_kref+0x14a4:   	xnor	%i2, -0x3db, %l6
	.word	0xac9ca84f	! t0_kref+0x14a8:   	xorcc	%l2, 0x84f, %l6
	.word	0xb9a00554	! t0_kref+0x14ac:   	fsqrtd	%f20, %f28
	.word	0x9da3c8ae	! t0_kref+0x14b0:   	fsubs	%f15, %f14, %f14
	.word	0x9de3bfa0	! t0_kref+0x14b4:   	save	%sp, -0x60, %sp
	.word	0xbaaf7c10	! t0_kref+0x14b8:   	andncc	%i5, -0x3f0, %i5
	.word	0xadee4000	! t0_kref+0x14bc:   	restore	%i1, %g0, %l6
	.word	0xb9a00552	! t0_kref+0x14c0:   	fsqrtd	%f18, %f28
	.word	0x81afcabf	! t0_kref+0x14c4:   	fcmpes	%fcc0, %f31, %f31
	.word	0xd7e6100d	! t0_kref+0x14c8:   	casa	[%i0]0x80, %o5, %o3
	.word	0x99a01916	! t0_kref+0x14cc:   	fitod	%f22, %f12
	.word	0x94f2401a	! t0_kref+0x14d0:   	udivcc	%o1, %i2, %o2
	.word	0xd6780018	! t0_kref+0x14d4:   	swap	[%g0 + %i0], %o3
	.word	0xa1b68a54	! t0_kref+0x14d8:   	fpadd32	%f26, %f20, %f16
	.word	0xd0067fe8	! t0_kref+0x14dc:   	ld	[%i1 - 0x18], %o0
	.word	0xdf263ff0	! t0_kref+0x14e0:   	st	%f15, [%i0 - 0x10]
	.word	0xe3b8a040	! t0_kref+0x14e4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa49af87d	! t0_kref+0x14e8:   	xorcc	%o3, -0x783, %l2
	.word	0x39480008	! t0_kref+0x14ec:   	fbuge,a,pt	%fcc0, _kref+0x150c
	.word	0xe428a011	! t0_kref+0x14f0:   	stb	%l2, [%g2 + 0x11]
	.word	0x81ad8ad6	! t0_kref+0x14f4:   	fcmped	%fcc0, %f22, %f22
	.word	0xd820a008	! t0_kref+0x14f8:   	st	%o4, [%g2 + 8]
	.word	0xe0de1000	! t0_kref+0x14fc:   	ldxa	[%i0]0x80, %l0
	.word	0xb3b6cf79	! t0_kref+0x1500:   	fornot1s	%f27, %f25, %f25
	.word	0x94a4000d	! t0_kref+0x1504:   	subcc	%l0, %o5, %o2
	.word	0xabb70510	! t0_kref+0x1508:   	fcmpgt16	%f28, %f16, %l5
	.word	0xafa0189f	! t0_kref+0x150c:   	fitos	%f31, %f23
	.word	0xbba0053b	! t0_kref+0x1510:   	fsqrts	%f27, %f29
	.word	0xa7400000	! t0_kref+0x1514:   	mov	%y, %l3
	.word	0xaea4a571	! t0_kref+0x1518:   	subcc	%l2, 0x571, %l7
	.word	0xa212001c	! t0_kref+0x151c:   	or	%o0, %i4, %l1
	.word	0xb1a00537	! t0_kref+0x1520:   	fsqrts	%f23, %f24
	.word	0xe620a01c	! t0_kref+0x1524:   	st	%l3, [%g2 + 0x1c]
	.word	0xbda6c839	! t0_kref+0x1528:   	fadds	%f27, %f25, %f30
	.word	0xb1a01056	! t0_kref+0x152c:   	fdtox	%f22, %f24
	.word	0x27480005	! t0_kref+0x1530:   	fbul,a,pt	%fcc0, _kref+0x1544
	.word	0x81dbafec	! t0_kref+0x1534:   	flush	%sp + 0xfec
	.word	0xb3a40830	! t0_kref+0x1538:   	fadds	%f16, %f16, %f25
	.word	0xa5b50dd0	! t0_kref+0x153c:   	fnand	%f20, %f16, %f18
	.word	0xc96e0012	! t0_kref+0x1540:   	prefetch	%i0 + %l2, 4
	.word	0x2b800006	! t0_kref+0x1544:   	fbug,a	_kref+0x155c
	.word	0xd00e6002	! t0_kref+0x1548:   	ldub	[%i1 + 2], %o0
	.word	0x33800007	! t0_kref+0x154c:   	fbe,a	_kref+0x1568
	.word	0x94f23c5e	! t0_kref+0x1550:   	udivcc	%o0, -0x3a2, %o2
	.word	0xc768a080	! t0_kref+0x1554:   	prefetch	%g2 + 0x80, 3
	.word	0x909c2168	! t0_kref+0x1558:   	xorcc	%l0, 0x168, %o0
	.word	0xb5a00038	! t0_kref+0x155c:   	fmovs	%f24, %f26
	.word	0xa9a6cd2f	! t0_kref+0x1560:   	fsmuld	%f27, %f15, %f20
	.word	0xac1f0000	! t0_kref+0x1564:   	xor	%i4, %g0, %l6
	.word	0xaba648bd	! t0_kref+0x1568:   	fsubs	%f25, %f29, %f21
	.word	0x81ae0ad0	! t0_kref+0x156c:   	fcmped	%fcc0, %f24, %f16
	.word	0xc06e0000	! t0_kref+0x1570:   	ldstub	[%i0], %g0
	.word	0xbfa00534	! t0_kref+0x1574:   	fsqrts	%f20, %f31
	.word	0xa89a000c	! t0_kref+0x1578:   	xorcc	%o0, %o4, %l4
	.word	0xa3b5c010	! t0_kref+0x157c:   	edge8	%l7, %l0, %l1
	.word	0x87802080	! t0_kref+0x1580:   	mov	0x80, %asi
	.word	0xb5a00554	! t0_kref+0x1584:   	fsqrtd	%f20, %f26
	.word	0x37800004	! t0_kref+0x1588:   	fbge,a	_kref+0x1598
	.word	0x9fa34832	! t0_kref+0x158c:   	fadds	%f13, %f18, %f15
	.word	0xa5a000da	! t0_kref+0x1590:   	fnegd	%f26, %f18
	.word	0xd27f0018	! t0_kref+0x1594:   	swap	[%i4 + %i0], %o1
	.word	0xa9b48f98	! t0_kref+0x1598:   	for	%f18, %f24, %f20
	.word	0x95b7054e	! t0_kref+0x159c:   	fcmpeq16	%f28, %f14, %o2
	.word	0xa72b4015	! t0_kref+0x15a0:   	sll	%o5, %l5, %l3
	.word	0xe66e8018	! t0_kref+0x15a4:   	ldstub	[%i2 + %i0], %l3
	.word	0xd62e3fed	! t0_kref+0x15a8:   	stb	%o3, [%i0 - 0x13]
	.word	0xa6d335f6	! t0_kref+0x15ac:   	umulcc	%o4, -0xa0a, %l3
	.word	0xaba58832	! t0_kref+0x15b0:   	fadds	%f22, %f18, %f21
	.word	0xb1b60a35	! t0_kref+0x15b4:   	fpadd16s	%f24, %f21, %f24
	.word	0xd6280019	! t0_kref+0x15b8:   	stb	%o3, [%g0 + %i1]
	.word	0xa3b5c177	! t0_kref+0x15bc:   	edge32ln	%l7, %l7, %l1
	.word	0xaa75000d	! t0_kref+0x15c0:   	udiv	%l4, %o5, %l5
	.word	0x90dd801c	! t0_kref+0x15c4:   	smulcc	%l6, %i4, %o0
	.word	0xb5a00536	! t0_kref+0x15c8:   	fsqrts	%f22, %f26
	.word	0xb5b34c7a	! t0_kref+0x15cc:   	fnors	%f13, %f26, %f26
	.word	0xe646001c	! t0_kref+0x15d0:   	ldsw	[%i0 + %i4], %l3
	.word	0xc807bfec	! t0_kref+0x15d4:   	ld	[%fp - 0x14], %g4
	.word	0x92fac012	! t0_kref+0x15d8:   	sdivcc	%o3, %l2, %o1
	.word	0xadb70200	! t0_kref+0x15dc:   	array8	%i4, %g0, %l6
	.word	0x81d90000	! t0_kref+0x15e0:   	flush	%g4
	.word	0xe3e65011	! t0_kref+0x15e4:   	casa	[%i1]0x80, %l1, %l1
	.word	0x81dc7b2f	! t0_kref+0x15e8:   	flush	%l1 - 0x4d1
	.word	0xbda00530	! t0_kref+0x15ec:   	fsqrts	%f16, %f30
	.word	0x9de3bfa0	! t0_kref+0x15f0:   	save	%sp, -0x60, %sp
	.word	0xb0173f6d	! t0_kref+0x15f4:   	or	%i4, -0x93, %i0
	.word	0xa7eeecbc	! t0_kref+0x15f8:   	restore	%i3, 0xcbc, %l3
	.word	0xee0e0000	! t0_kref+0x15fc:   	ldub	[%i0], %l7
	.word	0x2c480004	! t0_kref+0x1600:   	bneg,a,pt	%icc, _kref+0x1610
	.word	0xe6c8a022	! t0_kref+0x1604:   	ldsba	[%g2 + 0x22]%asi, %l3
	.word	0xc807bfe4	! t0_kref+0x1608:   	ld	[%fp - 0x1c], %g4
	.word	0xb9b38ada	! t0_kref+0x160c:   	fpsub32	%f14, %f26, %f28
	.word	0xe4a01019	! t0_kref+0x1610:   	sta	%l2, [%g0 + %i1]0x80
	.word	0xb5a00538	! t0_kref+0x1614:   	fsqrts	%f24, %f26
	.word	0xeefe3fe4	! t0_kref+0x1618:   	swapa	[%i0 - 0x1c]%asi, %l7
	.word	0x90dd000c	! t0_kref+0x161c:   	smulcc	%l4, %o4, %o0
	.word	0x8610201c	! t0_kref+0x1620:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x1624:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x1628:   	be,a	_kref+0x1668
	.word	0xa9a34d3a	! t0_kref+0x162c:   	fsmuld	%f13, %f26, %f20
	.word	0xafa0012d	! t0_kref+0x1630:   	fabss	%f13, %f23
	.word	0xd0067fec	! t0_kref+0x1634:   	ld	[%i1 - 0x14], %o0
	.word	0xa5b34240	! t0_kref+0x1638:   	array16	%o5, %g0, %l2
	.word	0x95b5041c	! t0_kref+0x163c:   	fcmple16	%f20, %f28, %o2
	.word	0x91400000	! t0_kref+0x1640:   	mov	%y, %o0
	.word	0xe6164000	! t0_kref+0x1644:   	lduh	[%i1], %l3
	.word	0x9bb38a37	! t0_kref+0x1648:   	fpadd16s	%f14, %f23, %f13
	.word	0xa89c401b	! t0_kref+0x164c:   	xorcc	%l1, %i3, %l4
	.word	0xede61009	! t0_kref+0x1650:   	casa	[%i0]0x80, %o1, %l6
	.word	0xe91e7ff8	! t0_kref+0x1654:   	ldd	[%i1 - 8], %f20
	.word	0xd236401b	! t0_kref+0x1658:   	sth	%o1, [%i1 + %i3]
	call	SYM(t0_subr3)
	.word	0x92f5793e	! t0_kref+0x1660:   	udivcc	%l5, -0x6c2, %o1
	.word	0x304ffff0	! t0_kref+0x1664:   	ba,a,pt	%icc, _kref+0x1624
	.word	0xa9b00f37	! t0_kref+0x1668:   	fsrc2s	%f23, %f20
	.word	0xa1a01a52	! t0_kref+0x166c:   	fdtoi	%f18, %f16
	.word	0xdab0a012	! t0_kref+0x1670:   	stha	%o5, [%g2 + 0x12]%asi
	.word	0xbdb54ea0	! t0_kref+0x1674:   	fsrc1s	%f21, %f30
	.word	0xbfa0013d	! t0_kref+0x1678:   	fabss	%f29, %f31
	.word	0xae14001c	! t0_kref+0x167c:   	or	%l0, %i4, %l7
	.word	0xaafdeb3c	! t0_kref+0x1680:   	sdivcc	%l7, 0xb3c, %l5
	.word	0xa075c013	! t0_kref+0x1684:   	udiv	%l7, %l3, %l0
	.word	0xa2870009	! t0_kref+0x1688:   	addcc	%i4, %o1, %l1
	.word	0xaf418000	! t0_kref+0x168c:   	mov	%fprs, %l7
	.word	0x28480007	! t0_kref+0x1690:   	bleu,a,pt	%icc, _kref+0x16ac
	.word	0xaa9d4011	! t0_kref+0x1694:   	xorcc	%l5, %l1, %l5
	.word	0xbfa01894	! t0_kref+0x1698:   	fitos	%f20, %f31
	.word	0xb1b70f5c	! t0_kref+0x169c:   	fornot1	%f28, %f28, %f24
	call	SYM(t0_subr3)
	.word	0xf8200018	! t0_kref+0x16a4:   	st	%i4, [%g0 + %i0]
	.word	0x2d800007	! t0_kref+0x16a8:   	fbg,a	_kref+0x16c4
	.word	0xdd266004	! t0_kref+0x16ac:   	st	%f14, [%i1 + 4]
	.word	0x21800005	! t0_kref+0x16b0:   	fbn,a	_kref+0x16c4
	.word	0xbfb6ce7c	! t0_kref+0x16b4:   	fxnors	%f27, %f28, %f31
	.word	0xd026401c	! t0_kref+0x16b8:   	st	%o0, [%i1 + %i4]
	.word	0xb9a0012e	! t0_kref+0x16bc:   	fabss	%f14, %f28
	.word	0xa1b5c071	! t0_kref+0x16c0:   	edge8ln	%l7, %l1, %l0
	.word	0x927ce145	! t0_kref+0x16c4:   	sdiv	%l3, 0x145, %o1
	.word	0xa5a68850	! t0_kref+0x16c8:   	faddd	%f26, %f16, %f18
	.word	0xb1b009ae	! t0_kref+0x16cc:   	fexpand	%f14, %f24
	.word	0xd006401c	! t0_kref+0x16d0:   	ld	[%i1 + %i4], %o0
	.word	0x2737219a	! t0_kref+0x16d4:   	sethi	%hi(0xdc866800), %l3
	.word	0x38480001	! t0_kref+0x16d8:   	bgu,a,pt	%icc, _kref+0x16dc
	.word	0xa7b2000c	! t0_kref+0x16dc:   	edge8	%o0, %o4, %l3
	.word	0x81854000	! t0_kref+0x16e0:   	wr	%l5, %g0, %y
	.word	0xf626001c	! t0_kref+0x16e4:   	st	%i3, [%i0 + %i4]
	.word	0x81ab4abf	! t0_kref+0x16e8:   	fcmpes	%fcc0, %f13, %f31
	.word	0xa4dd4016	! t0_kref+0x16ec:   	smulcc	%l5, %l6, %l2
	.word	0x92b20009	! t0_kref+0x16f0:   	orncc	%o0, %o1, %o1
	.word	0x2c480007	! t0_kref+0x16f4:   	bneg,a,pt	%icc, _kref+0x1710
	.word	0xeb20a030	! t0_kref+0x16f8:   	st	%f21, [%g2 + 0x30]
	.word	0xb7a3482e	! t0_kref+0x16fc:   	fadds	%f13, %f14, %f27
	.word	0xd1e61015	! t0_kref+0x1700:   	casa	[%i0]0x80, %l5, %o0
	.word	0xbdb54df8	! t0_kref+0x1704:   	fnands	%f21, %f24, %f30
	.word	0xd42167ac	! t0_kref+0x1708:   	st	%o2, [%g5 + 0x7ac]
	.word	0x99a0055a	! t0_kref+0x170c:   	fsqrtd	%f26, %f12
	.word	0xa7b70598	! t0_kref+0x1710:   	fcmpgt32	%f28, %f24, %l3
	.word	0xa8da4009	! t0_kref+0x1714:   	smulcc	%o1, %o1, %l4
	.word	0xe46e8018	! t0_kref+0x1718:   	ldstub	[%i2 + %i0], %l2
	.word	0x3d480007	! t0_kref+0x171c:   	fbule,a,pt	%fcc0, _kref+0x1738
	.word	0x231e73e6	! t0_kref+0x1720:   	sethi	%hi(0x79cf9800), %l1
	.word	0x81de8014	! t0_kref+0x1724:   	flush	%i2 + %l4
	.word	0x81af0aaf	! t0_kref+0x1728:   	fcmpes	%fcc0, %f28, %f15
	.word	0xda7e0000	! t0_kref+0x172c:   	swap	[%i0], %o5
	.word	0x3c800002	! t0_kref+0x1730:   	bpos,a	_kref+0x1738
	.word	0xae63401a	! t0_kref+0x1734:   	subc	%o5, %i2, %l7
	.word	0xa71d3170	! t0_kref+0x1738:   	tsubcctv	%l4, -0xe90, %l3
	.word	0x9de3bfa0	! t0_kref+0x173c:   	save	%sp, -0x60, %sp
	.word	0xb6576754	! t0_kref+0x1740:   	umul	%i5, 0x754, %i3
	.word	0xa7eea697	! t0_kref+0x1744:   	restore	%i2, 0x697, %l3
	.word	0xa28af6da	! t0_kref+0x1748:   	andcc	%o3, -0x926, %l1
	.word	0xb5a01936	! t0_kref+0x174c:   	fstod	%f22, %f26
	.word	0xa9a588b2	! t0_kref+0x1750:   	fsubs	%f22, %f18, %f20
	.word	0xf83e0000	! t0_kref+0x1754:   	std	%i4, [%i0]
	.word	0xeb20a00c	! t0_kref+0x1758:   	st	%f21, [%g2 + 0xc]
	.word	0x81580000	! t0_kref+0x175c:   	flushw
	.word	0x81580000	! t0_kref+0x1760:   	flushw
	.word	0xd91e001d	! t0_kref+0x1764:   	ldd	[%i0 + %i5], %f12
	.word	0xd22e2018	! t0_kref+0x1768:   	stb	%o1, [%i0 + 0x18]
	.word	0xf836600a	! t0_kref+0x176c:   	sth	%i4, [%i1 + 0xa]
	.word	0xa1a01a34	! t0_kref+0x1770:   	fstoi	%f20, %f16
	.word	0xff06401c	! t0_kref+0x1774:   	ld	[%i1 + %i4], %f31
	.word	0x86102001	! t0_kref+0x1778:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x177c:   	bne,a	_kref+0x177c
	.word	0x86a0e001	! t0_kref+0x1780:   	subcc	%g3, 1, %g3
	.word	0xd86e6015	! t0_kref+0x1784:   	ldstub	[%i1 + 0x15], %o4
	.word	0xe22e3fea	! t0_kref+0x1788:   	stb	%l1, [%i0 - 0x16]
	.word	0xd4380019	! t0_kref+0x178c:   	std	%o2, [%g0 + %i1]
	.word	0x3b800005	! t0_kref+0x1790:   	fble,a	_kref+0x17a4
	.word	0x9db7891e	! t0_kref+0x1794:   	faligndata	%f30, %f30, %f14
	.word	0xac2af372	! t0_kref+0x1798:   	andn	%o3, -0xc8e, %l6
	.word	0xe9ee101b	! t0_kref+0x179c:   	prefetcha	%i0 + %i3, 20
	.word	0xb5a0055e	! t0_kref+0x17a0:   	fsqrtd	%f30, %f26
	call	SYM(t0_subr1)
	.word	0xe9180019	! t0_kref+0x17a8:   	ldd	[%g0 + %i1], %f20
	.word	0xaa7d618f	! t0_kref+0x17ac:   	sdiv	%l5, 0x18f, %l5
	.word	0x9de3bfa0	! t0_kref+0x17b0:   	save	%sp, -0x60, %sp
	.word	0xb50e001b	! t0_kref+0x17b4:   	tsubcc	%i0, %i3, %i2
	.word	0xa7ef0019	! t0_kref+0x17b8:   	restore	%i4, %i1, %l3
	.word	0xa4a4c01a	! t0_kref+0x17bc:   	subcc	%l3, %i2, %l2
	.word	0x8184c000	! t0_kref+0x17c0:   	wr	%l3, %g0, %y
	call	SYM(t0_subr0)
	.word	0x909daf5c	! t0_kref+0x17c8:   	xorcc	%l6, 0xf5c, %o0
	.word	0xec380019	! t0_kref+0x17cc:   	std	%l6, [%g0 + %i1]
	.word	0xa3400000	! t0_kref+0x17d0:   	mov	%y, %l1
	call	SYM(t0_subr1)
	.word	0xacfb715f	! t0_kref+0x17d8:   	sdivcc	%o5, -0xea1, %l6
	.word	0x81af0a3b	! t0_kref+0x17dc:   	fcmps	%fcc0, %f28, %f27
	.word	0x9fc00004	! t0_kref+0x17e0:   	call	%g0 + %g4
	.word	0xada0005e	! t0_kref+0x17e4:   	fmovd	%f30, %f22
	.word	0xb1a01a3a	! t0_kref+0x17e8:   	fstoi	%f26, %f24
	.word	0xf6262014	! t0_kref+0x17ec:   	st	%i3, [%i0 + 0x14]
	.word	0xa4ad762d	! t0_kref+0x17f0:   	andncc	%l5, -0x9d3, %l2
	.word	0xe5e61016	! t0_kref+0x17f4:   	casa	[%i0]0x80, %l6, %l2
	.word	0xae7c801b	! t0_kref+0x17f8:   	sdiv	%l2, %i3, %l7
	.word	0xe6263ff8	! t0_kref+0x17fc:   	st	%l3, [%i0 - 8]
	.word	0xa23dc009	! t0_kref+0x1800:   	xnor	%l7, %o1, %l1
	.word	0xa5b78c9a	! t0_kref+0x1804:   	fandnot2	%f30, %f26, %f18
	.word	0xe9e6500a	! t0_kref+0x1808:   	casa	[%i1]0x80, %o2, %l4
	.word	0xb1a00558	! t0_kref+0x180c:   	fsqrtd	%f24, %f24
	.word	0xb5a01894	! t0_kref+0x1810:   	fitos	%f20, %f26
	.word	0x81848000	! t0_kref+0x1814:   	wr	%l2, %g0, %y
	.word	0x23480007	! t0_kref+0x1818:   	fbne,a,pt	%fcc0, _kref+0x1834
	.word	0xd6267fe0	! t0_kref+0x181c:   	st	%o3, [%i1 - 0x20]
	.word	0x81dbc008	! t0_kref+0x1820:   	flush	%o7 + %o0
	.word	0x3d800003	! t0_kref+0x1824:   	fbule,a	_kref+0x1830
	.word	0x947dffd6	! t0_kref+0x1828:   	sdiv	%l7, -0x2a, %o2
	.word	0xb1a5cd34	! t0_kref+0x182c:   	fsmuld	%f23, %f20, %f24
	.word	0xada0191b	! t0_kref+0x1830:   	fitod	%f27, %f22
	.word	0x9525800c	! t0_kref+0x1834:   	mulscc	%l6, %o4, %o2
	.word	0xb9a0193f	! t0_kref+0x1838:   	fstod	%f31, %f28
	.word	0xd4be101d	! t0_kref+0x183c:   	stda	%o2, [%i0 + %i5]0x80
	.word	0xb9a98054	! t0_kref+0x1840:   	fmovdg	%fcc0, %f20, %f28
	.word	0xba103fe8	! t0_kref+0x1844:   	mov	0xffffffe8, %i5
	.word	0x9da01937	! t0_kref+0x1848:   	fstod	%f23, %f14
	.word	0x9db50998	! t0_kref+0x184c:   	bshuffle	%f20, %f24, %f14
	.word	0x9da3884e	! t0_kref+0x1850:   	faddd	%f14, %f14, %f14
	.word	0xa672a2a7	! t0_kref+0x1854:   	udiv	%o2, 0x2a7, %l3
	.word	0x2b480001	! t0_kref+0x1858:   	fbug,a,pt	%fcc0, _kref+0x185c
	.word	0xec06200c	! t0_kref+0x185c:   	ld	[%i0 + 0xc], %l6
	.word	0xadb387d0	! t0_kref+0x1860:   	pdist	%f14, %f16, %f22
	.word	0x3d480008	! t0_kref+0x1864:   	fbule,a,pt	%fcc0, _kref+0x1884
	.word	0x2d28aa7c	! t0_kref+0x1868:   	sethi	%hi(0xa2a9f000), %l6
	.word	0x9ba748bb	! t0_kref+0x186c:   	fsubs	%f29, %f27, %f13
	.word	0xa2134017	! t0_kref+0x1870:   	or	%o5, %l7, %l1
	.word	0xb5a4895e	! t0_kref+0x1874:   	fmuld	%f18, %f30, %f26
	.word	0xf628a007	! t0_kref+0x1878:   	stb	%i3, [%g2 + 7]
	.word	0x9fb00774	! t0_kref+0x187c:   	fpack16	%f20, %f15
	.word	0x920cbbf0	! t0_kref+0x1880:   	and	%l2, -0x410, %o1
	.word	0x2c480002	! t0_kref+0x1884:   	bneg,a,pt	%icc, _kref+0x188c
	.word	0xa1b68914	! t0_kref+0x1888:   	faligndata	%f26, %f20, %f16
	.word	0xe26e7ff8	! t0_kref+0x188c:   	ldstub	[%i1 - 8], %l1
	.word	0x2a800003	! t0_kref+0x1890:   	bcs,a	_kref+0x189c
	.word	0xea0e001a	! t0_kref+0x1894:   	ldub	[%i0 + %i2], %l5
	.word	0x94fa654e	! t0_kref+0x1898:   	sdivcc	%o1, 0x54e, %o2
	.word	0xbdb4ce76	! t0_kref+0x189c:   	fxnors	%f19, %f22, %f30
	.word	0xa8672d64	! t0_kref+0x18a0:   	subc	%i4, 0xd64, %l4
	.word	0xd25e3fe0	! t0_kref+0x18a4:   	ldx	[%i0 - 0x20], %o1
	.word	0xa8124010	! t0_kref+0x18a8:   	or	%o1, %l0, %l4
	.word	0x913f0013	! t0_kref+0x18ac:   	sra	%i4, %l3, %o0
	.word	0xabb00c20	! t0_kref+0x18b0:   	fzeros	%f21
	.word	0x24480008	! t0_kref+0x18b4:   	ble,a,pt	%icc, _kref+0x18d4
	.word	0xada0105c	! t0_kref+0x18b8:   	fdtox	%f28, %f22
	.word	0x27480002	! t0_kref+0x18bc:   	fbul,a,pt	%fcc0, _kref+0x18c4
	.word	0xe8200019	! t0_kref+0x18c0:   	st	%l4, [%g0 + %i1]
	.word	0x9da489ce	! t0_kref+0x18c4:   	fdivd	%f18, %f14, %f14
	.word	0xada38d3a	! t0_kref+0x18c8:   	fsmuld	%f14, %f26, %f22
	.word	0xa1b74ab2	! t0_kref+0x18cc:   	fpsub16s	%f29, %f18, %f16
	.word	0x9f414000	! t0_kref+0x18d0:   	mov	%pc, %o7
	.word	0xafb6801c	! t0_kref+0x18d4:   	edge8	%i2, %i4, %l7
	.word	0xd4be5000	! t0_kref+0x18d8:   	stda	%o2, [%i1]0x80
	.word	0xb5a000ba	! t0_kref+0x18dc:   	fnegs	%f26, %f26
	.word	0xb1a688b6	! t0_kref+0x18e0:   	fsubs	%f26, %f22, %f24
	.word	0x29480008	! t0_kref+0x18e4:   	fbl,a,pt	%fcc0, _kref+0x1904
	.word	0xa1a3085a	! t0_kref+0x18e8:   	faddd	%f12, %f26, %f16
	.word	0xec070019	! t0_kref+0x18ec:   	ld	[%i4 + %i1], %l6
	.word	0x30480003	! t0_kref+0x18f0:   	ba,a,pt	%icc, _kref+0x18fc
	.word	0xf83e401d	! t0_kref+0x18f4:   	std	%i4, [%i1 + %i5]
	.word	0xb3a0189c	! t0_kref+0x18f8:   	fitos	%f28, %f25
	.word	0xb5b00cd2	! t0_kref+0x18fc:   	fnot2	%f18, %f26
	.word	0xa9a0013d	! t0_kref+0x1900:   	fabss	%f29, %f20
	.word	0xb5a408b1	! t0_kref+0x1904:   	fsubs	%f16, %f17, %f26
	.word	0xc807bff0	! t0_kref+0x1908:   	ld	[%fp - 0x10], %g4
	.word	0xbfa0053d	! t0_kref+0x190c:   	fsqrts	%f29, %f31
	.word	0x86102001	! t0_kref+0x1910:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1914:   	bne,a	_kref+0x1914
	.word	0x86a0e001	! t0_kref+0x1918:   	subcc	%g3, 1, %g3
	.word	0xbdb48e7f	! t0_kref+0x191c:   	fxnors	%f18, %f31, %f30
	.word	0x81adcabf	! t0_kref+0x1920:   	fcmpes	%fcc0, %f23, %f31
	.word	0xa9a00554	! t0_kref+0x1924:   	fsqrtd	%f20, %f20
	.word	0x38800005	! t0_kref+0x1928:   	bgu,a	_kref+0x193c
	.word	0x9db54d60	! t0_kref+0x192c:   	fnot1s	%f21, %f14
	.word	0xad242d9e	! t0_kref+0x1930:   	mulscc	%l0, 0xd9e, %l6
	.word	0x22800007	! t0_kref+0x1934:   	be,a	_kref+0x1950
	.word	0x92d32c98	! t0_kref+0x1938:   	umulcc	%o4, 0xc98, %o1
	.word	0xa1a0189c	! t0_kref+0x193c:   	fitos	%f28, %f16
	.word	0xbfa3c838	! t0_kref+0x1940:   	fadds	%f15, %f24, %f31
	.word	0xb5a0054c	! t0_kref+0x1944:   	fsqrtd	%f12, %f26
	.word	0xe53e3fe8	! t0_kref+0x1948:   	std	%f18, [%i0 - 0x18]
	.word	0x92602fa6	! t0_kref+0x194c:   	subc	%g0, 0xfa6, %o1
	.word	0x32480008	! t0_kref+0x1950:   	bne,a,pt	%icc, _kref+0x1970
	.word	0xd028a036	! t0_kref+0x1954:   	stb	%o0, [%g2 + 0x36]
	.word	0xd0ce6002	! t0_kref+0x1958:   	ldsba	[%i1 + 2]%asi, %o0
	.word	0xb9a74835	! t0_kref+0x195c:   	fadds	%f29, %f21, %f28
	.word	0xe7063fe0	! t0_kref+0x1960:   	ld	[%i0 - 0x20], %f19
	.word	0xed067fe4	! t0_kref+0x1964:   	ld	[%i1 - 0x1c], %f22
	.word	0xada608af	! t0_kref+0x1968:   	fsubs	%f24, %f15, %f22
	.word	0xaa0527c2	! t0_kref+0x196c:   	add	%l4, 0x7c2, %l5
	.word	0x3c480003	! t0_kref+0x1970:   	bpos,a,pt	%icc, _kref+0x197c
	.word	0xa72aa001	! t0_kref+0x1974:   	sll	%o2, 0x1, %l3
	.word	0xada5095e	! t0_kref+0x1978:   	fmuld	%f20, %f30, %f22
	.word	0xad64c011	! t0_kref+0x197c:   	movl	%icc, %l1, %l6
	.word	0x33480006	! t0_kref+0x1980:   	fbe,a,pt	%fcc0, _kref+0x1998
	.word	0x93b5048e	! t0_kref+0x1984:   	fcmple32	%f20, %f14, %o1
	.word	0xa7b00772	! t0_kref+0x1988:   	fpack16	%f18, %f19
	.word	0xf1066004	! t0_kref+0x198c:   	ld	[%i1 + 4], %f24
	.word	0x21480004	! t0_kref+0x1990:   	fbn,a,pt	%fcc0, _kref+0x19a0
	.word	0x8143c000	! t0_kref+0x1994:   	stbar
	.word	0xd42e7fee	! t0_kref+0x1998:   	stb	%o2, [%i1 - 0x12]
	.word	0xec76001d	! t0_kref+0x199c:   	stx	%l6, [%i0 + %i5]
	.word	0x23800006	! t0_kref+0x19a0:   	fbne,a	_kref+0x19b8
	.word	0xd826001c	! t0_kref+0x19a4:   	st	%o4, [%i0 + %i4]
	.word	0xae1a401c	! t0_kref+0x19a8:   	xor	%o1, %i4, %l7
	.word	0xa9a388b8	! t0_kref+0x19ac:   	fsubs	%f14, %f24, %f20
	.word	0xbdb58910	! t0_kref+0x19b0:   	faligndata	%f22, %f16, %f30
	.word	0xe26e3ff3	! t0_kref+0x19b4:   	ldstub	[%i0 - 0xd], %l1
	.word	0x81df3b65	! t0_kref+0x19b8:   	flush	%i4 - 0x49b
	.word	0xc12e401c	! t0_kref+0x19bc:   	st	%fsr, [%i1 + %i4]
	.word	0xa1b48494	! t0_kref+0x19c0:   	fcmple32	%f18, %f20, %l0
	.word	0xf9be5811	! t0_kref+0x19c4:   	stda	%f28, [%i1 + %l1]0xc0
	.word	0xe1062008	! t0_kref+0x19c8:   	ld	[%i0 + 8], %f16
	.word	0x90880015	! t0_kref+0x19cc:   	andcc	%g0, %l5, %o0
	.word	0xe89e5000	! t0_kref+0x19d0:   	ldda	[%i1]0x80, %l4
	.word	0x81ac8ab5	! t0_kref+0x19d4:   	fcmpes	%fcc0, %f18, %f21
	.word	0xee7e401c	! t0_kref+0x19d8:   	swap	[%i1 + %i4], %l7
	.word	0xadb50496	! t0_kref+0x19dc:   	fcmple32	%f20, %f22, %l6
	.word	0xf93f4018	! t0_kref+0x19e0:   	std	%f28, [%i5 + %i0]
	.word	0xefe8a007	! t0_kref+0x19e4:   	prefetcha	%g2 + 7, 23
	.word	0xaedcabc7	! t0_kref+0x19e8:   	smulcc	%l2, 0xbc7, %l7
	.word	0x94b4c011	! t0_kref+0x19ec:   	orncc	%l3, %l1, %o2
	.word	0xe9e8a009	! t0_kref+0x19f0:   	prefetcha	%g2 + 9, 20
	.word	0xd4562014	! t0_kref+0x19f4:   	ldsh	[%i0 + 0x14], %o2
	.word	0xb7a0053c	! t0_kref+0x19f8:   	fsqrts	%f28, %f27
	.word	0xa06469cb	! t0_kref+0x19fc:   	subc	%l1, 0x9cb, %l0
	.word	0xe7000019	! t0_kref+0x1a00:   	ld	[%g0 + %i1], %f19
	.word	0x24480001	! t0_kref+0x1a04:   	ble,a,pt	%icc, _kref+0x1a08
	.word	0xaba0189a	! t0_kref+0x1a08:   	fitos	%f26, %f21
	.word	0x25800004	! t0_kref+0x1a0c:   	fblg,a	_kref+0x1a1c
	.word	0xef26401c	! t0_kref+0x1a10:   	st	%f23, [%i1 + %i4]
	.word	0xe8266000	! t0_kref+0x1a14:   	st	%l4, [%i1]
	.word	0x81ddba3a	! t0_kref+0x1a18:   	flush	%l6 - 0x5c6
	.word	0x81ac8a50	! t0_kref+0x1a1c:   	fcmpd	%fcc0, %f18, %f16
	.word	0x9da00533	! t0_kref+0x1a20:   	fsqrts	%f19, %f14
	.word	0x9da0054e	! t0_kref+0x1a24:   	fsqrtd	%f14, %f14
	.word	0xa85b6557	! t0_kref+0x1a28:   	smul	%o5, 0x557, %l4
	.word	0x3c800002	! t0_kref+0x1a2c:   	bpos,a	_kref+0x1a34
	.word	0xb5a01938	! t0_kref+0x1a30:   	fstod	%f24, %f26
	.word	0x81854000	! t0_kref+0x1a34:   	wr	%l5, %g0, %y
	.word	0xa9b4c02a	! t0_kref+0x1a38:   	edge8n	%l3, %o2, %l4
	.word	0xafa01a39	! t0_kref+0x1a3c:   	fstoi	%f25, %f23
	.word	0xafb00f2d	! t0_kref+0x1a40:   	fsrc2s	%f13, %f23
	.word	0xb5b40eee	! t0_kref+0x1a44:   	fornot2s	%f16, %f14, %f26
	.word	0xaed68013	! t0_kref+0x1a48:   	umulcc	%i2, %l3, %l7
	.word	0x81dbc010	! t0_kref+0x1a4c:   	flush	%o7 + %l0
	.word	0xa9a0193d	! t0_kref+0x1a50:   	fstod	%f29, %f20
	.word	0xdd3e7ff8	! t0_kref+0x1a54:   	std	%f14, [%i1 - 8]
	.word	0xbda018d0	! t0_kref+0x1a58:   	fdtos	%f16, %f30
	.word	0xa4dd001a	! t0_kref+0x1a5c:   	smulcc	%l4, %i2, %l2
	.word	0xf99f1a18	! t0_kref+0x1a60:   	ldda	[%i4 + %i0]0xd0, %f28
	.word	0xb7a0052f	! t0_kref+0x1a64:   	fsqrts	%f15, %f27
	.word	0xec3e4000	! t0_kref+0x1a68:   	std	%l6, [%i1]
	.word	0xea5e7ff8	! t0_kref+0x1a6c:   	ldx	[%i1 - 8], %l5
	.word	0xa1b70e4e	! t0_kref+0x1a70:   	fxnor	%f28, %f14, %f16
	.word	0x9524800d	! t0_kref+0x1a74:   	mulscc	%l2, %o5, %o2
	.word	0xabb680fc	! t0_kref+0x1a78:   	edge16ln	%i2, %i4, %l5
	.word	0x2a800004	! t0_kref+0x1a7c:   	bcs,a	_kref+0x1a8c
	.word	0x81dfb23e	! t0_kref+0x1a80:   	flush	%fp - 0xdc2
	.word	0xec3e3fe0	! t0_kref+0x1a84:   	std	%l6, [%i0 - 0x20]
	.word	0xdb06001c	! t0_kref+0x1a88:   	ld	[%i0 + %i4], %f13
	.word	0xea200019	! t0_kref+0x1a8c:   	st	%l5, [%g0 + %i1]
	.word	0xe62e4000	! t0_kref+0x1a90:   	stb	%l3, [%i1]
	.word	0xada00131	! t0_kref+0x1a94:   	fabss	%f17, %f22
	.word	0xbba000ae	! t0_kref+0x1a98:   	fnegs	%f14, %f29
	.word	0xe60e6002	! t0_kref+0x1a9c:   	ldub	[%i1 + 2], %l3
	.word	0xada01a31	! t0_kref+0x1aa0:   	fstoi	%f17, %f22
	.word	0x949c4011	! t0_kref+0x1aa4:   	xorcc	%l1, %l1, %o2
	.word	0xa7a5c8bd	! t0_kref+0x1aa8:   	fsubs	%f23, %f29, %f19
	.word	0xa004a8a5	! t0_kref+0x1aac:   	add	%l2, 0x8a5, %l0
	.word	0xa086c010	! t0_kref+0x1ab0:   	addcc	%i3, %l0, %l0
	.word	0xe2680019	! t0_kref+0x1ab4:   	ldstub	[%g0 + %i1], %l1
	.word	0x8143e040	! t0_kref+0x1ab8:   	membar	0x40
	.word	0xbfa00536	! t0_kref+0x1abc:   	fsqrts	%f22, %f31
	.word	0xf7266018	! t0_kref+0x1ac0:   	st	%f27, [%i1 + 0x18]
	.word	0x81df7a1d	! t0_kref+0x1ac4:   	flush	%i5 - 0x5e3
	.word	0xb5b78dd2	! t0_kref+0x1ac8:   	fnand	%f30, %f18, %f26
	.word	0xa5a608b0	! t0_kref+0x1acc:   	fsubs	%f24, %f16, %f18
	.word	0x27480006	! t0_kref+0x1ad0:   	fbul,a,pt	%fcc0, _kref+0x1ae8
	.word	0xa075ba88	! t0_kref+0x1ad4:   	udiv	%l6, -0x578, %l0
	.word	0xe00e6013	! t0_kref+0x1ad8:   	ldub	[%i1 + 0x13], %l0
	.word	0xa4d7001b	! t0_kref+0x1adc:   	umulcc	%i4, %i3, %l2
	.word	0x13260f66	! t0_kref+0x1ae0:   	sethi	%hi(0x983d9800), %o1
	.word	0xea4e0000	! t0_kref+0x1ae4:   	ldsb	[%i0], %l5
	.word	0xb7b00776	! t0_kref+0x1ae8:   	fpack16	%f22, %f27
	.word	0xf1063fe4	! t0_kref+0x1aec:   	ld	[%i0 - 0x1c], %f24
	.word	0xa8537b9f	! t0_kref+0x1af0:   	umul	%o5, -0x461, %l4
	.word	0xad26b09d	! t0_kref+0x1af4:   	mulscc	%i2, -0xf63, %l6
	.word	0x91b44133	! t0_kref+0x1af8:   	edge32n	%l1, %l3, %o0
	.word	0xadb50412	! t0_kref+0x1afc:   	fcmple16	%f20, %f18, %l6
	.word	0xea366010	! t0_kref+0x1b00:   	sth	%l5, [%i1 + 0x10]
	.word	0xb9a01918	! t0_kref+0x1b04:   	fitod	%f24, %f28
	.word	0x253c23aa	! t0_kref+0x1b08:   	sethi	%hi(0xf08ea800), %l2
	.word	0x94fdf0e5	! t0_kref+0x1b0c:   	sdivcc	%l7, -0xf1b, %o2
	.word	0xa9a01a56	! t0_kref+0x1b10:   	fdtoi	%f22, %f20
	.word	0xacba63a0	! t0_kref+0x1b14:   	xnorcc	%o1, 0x3a0, %l6
	.word	0xada548bf	! t0_kref+0x1b18:   	fsubs	%f21, %f31, %f22
	.word	0xada00550	! t0_kref+0x1b1c:   	fsqrtd	%f16, %f22
	.word	0xa1a448ae	! t0_kref+0x1b20:   	fsubs	%f17, %f14, %f16
	.word	0xc1ee1014	! t0_kref+0x1b24:   	prefetcha	%i0 + %l4, 0
	.word	0xf1be589c	! t0_kref+0x1b28:   	stda	%f24, [%i1 + %i4]0xc4
	.word	0x9da7895e	! t0_kref+0x1b2c:   	fmuld	%f30, %f30, %f14
	.word	0xa9b00cde	! t0_kref+0x1b30:   	fnot2	%f30, %f20
	.word	0xbdb68c4e	! t0_kref+0x1b34:   	fnor	%f26, %f14, %f30
	.word	0xd4ce3fed	! t0_kref+0x1b38:   	ldsba	[%i0 - 0x13]%asi, %o2
	.word	0xecc8a026	! t0_kref+0x1b3c:   	ldsba	[%g2 + 0x26]%asi, %l6
	.word	0x9fc00004	! t0_kref+0x1b40:   	call	%g0 + %g4
	.word	0xea266014	! t0_kref+0x1b44:   	st	%l5, [%i1 + 0x14]
	.word	0x33480007	! t0_kref+0x1b48:   	fbe,a,pt	%fcc0, _kref+0x1b64
	.word	0xa8d4f8b6	! t0_kref+0x1b4c:   	umulcc	%l3, -0x74a, %l4
	.word	0xe24e200b	! t0_kref+0x1b50:   	ldsb	[%i0 + 0xb], %l1
	.word	0x907d4017	! t0_kref+0x1b54:   	sdiv	%l5, %l7, %o0
	.word	0xe16e401b	! t0_kref+0x1b58:   	prefetch	%i1 + %i3, 16
	.word	0xc0ae101a	! t0_kref+0x1b5c:   	stba	%g0, [%i0 + %i2]0x80
	.word	0xb1a0013f	! t0_kref+0x1b60:   	fabss	%f31, %f24
	.word	0xa9a0053c	! t0_kref+0x1b64:   	fsqrts	%f28, %f20
	.word	0x26800002	! t0_kref+0x1b68:   	bl,a	_kref+0x1b70
	.word	0x9bb00c20	! t0_kref+0x1b6c:   	fzeros	%f13
	.word	0xada488de	! t0_kref+0x1b70:   	fsubd	%f18, %f30, %f22
	.word	0xa6b8000a	! t0_kref+0x1b74:   	xnorcc	%g0, %o2, %l3
	.word	0xa6dd800d	! t0_kref+0x1b78:   	smulcc	%l6, %o5, %l3
	.word	0xb5a4094e	! t0_kref+0x1b7c:   	fmuld	%f16, %f14, %f26
	.word	0x921d400a	! t0_kref+0x1b80:   	xor	%l5, %o2, %o1
	.word	0xfd20a020	! t0_kref+0x1b84:   	st	%f30, [%g2 + 0x20]
	.word	0xaa172fd2	! t0_kref+0x1b88:   	or	%i4, 0xfd2, %l5
	.word	0xa9a018d6	! t0_kref+0x1b8c:   	fdtos	%f22, %f20
	.word	0x9db34ea0	! t0_kref+0x1b90:   	fsrc1s	%f13, %f14
	.word	0xc3e8a000	! t0_kref+0x1b94:   	prefetcha	%g2, 1
	.word	0xf9be1a5c	! t0_kref+0x1b98:   	stda	%f28, [%i0 + %i4]0xd2
	.word	0x9db506f4	! t0_kref+0x1b9c:   	fmul8ulx16	%f20, %f20, %f14
	.word	0xa9a54833	! t0_kref+0x1ba0:   	fadds	%f21, %f19, %f20
	.word	0xdd3e001d	! t0_kref+0x1ba4:   	std	%f14, [%i0 + %i5]
	.word	0xae67001c	! t0_kref+0x1ba8:   	subc	%i4, %i4, %l7
	.word	0xadb50a5a	! t0_kref+0x1bac:   	fpadd32	%f20, %f26, %f22
	.word	0xaa168014	! t0_kref+0x1bb0:   	or	%i2, %l4, %l5
	.word	0x8143e040	! t0_kref+0x1bb4:   	membar	0x40
	.word	0x9fa0189b	! t0_kref+0x1bb8:   	fitos	%f27, %f15
	.word	0x81de0000	! t0_kref+0x1bbc:   	flush	%i0
	.word	0x33480005	! t0_kref+0x1bc0:   	fbe,a,pt	%fcc0, _kref+0x1bd4
	.word	0xa1a0055c	! t0_kref+0x1bc4:   	fsqrtd	%f28, %f16
	.word	0xee4e6014	! t0_kref+0x1bc8:   	ldsb	[%i1 + 0x14], %l7
	.word	0xb1a018dc	! t0_kref+0x1bcc:   	fdtos	%f28, %f24
	.word	0x34480002	! t0_kref+0x1bd0:   	bg,a,pt	%icc, _kref+0x1bd8
	.word	0xea270018	! t0_kref+0x1bd4:   	st	%l5, [%i4 + %i0]
	call	SYM(t0_subr1)
	.word	0x81824000	! t0_kref+0x1bdc:   	wr	%o1, %g0, %y
!	.word	0x3abfd108	! t0_kref+0x1be0:   	bcc,a	SYM(t0_subr0)
	   	bcc,a	SYM(t0_subr0)
	.word	0x9f414000	! t0_kref+0x1be4:   	mov	%pc, %o7
	.word	0xb9a0189c	! t0_kref+0x1be8:   	fitos	%f28, %f28
	.word	0xd0563fe8	! t0_kref+0x1bec:   	ldsh	[%i0 - 0x18], %o0
	.word	0xada00138	! t0_kref+0x1bf0:   	fabss	%f24, %f22
	.word	0x9ba01890	! t0_kref+0x1bf4:   	fitos	%f16, %f13
	.word	0xd2b0a034	! t0_kref+0x1bf8:   	stha	%o1, [%g2 + 0x34]%asi
	.word	0xb7a000ae	! t0_kref+0x1bfc:   	fnegs	%f14, %f27
	.word	0xa2d2656c	! t0_kref+0x1c00:   	umulcc	%o1, 0x56c, %l1
	.word	0xb8102014	! t0_kref+0x1c04:   	mov	0x14, %i4
	.word	0xb9a000bf	! t0_kref+0x1c08:   	fnegs	%f31, %f28
	.word	0xaba608be	! t0_kref+0x1c0c:   	fsubs	%f24, %f30, %f21
	.word	0xafb34009	! t0_kref+0x1c10:   	edge8	%o5, %o1, %l7
	.word	0x8610201b	! t0_kref+0x1c14:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x1c18:   	subcc	%g3, 1, %g3
	.word	0x22800020	! t0_kref+0x1c1c:   	be,a	_kref+0x1c9c
	.word	0x9da609cc	! t0_kref+0x1c20:   	fdivd	%f24, %f12, %f14
	.word	0xa0de8010	! t0_kref+0x1c24:   	smulcc	%i2, %l0, %l0
	.word	0x81da000e	! t0_kref+0x1c28:   	flush	%o0 + %sp
	.word	0xe2266000	! t0_kref+0x1c2c:   	st	%l1, [%i1]
	.word	0xa9b58ed0	! t0_kref+0x1c30:   	fornot2	%f22, %f16, %f20
	.word	0xac66c01c	! t0_kref+0x1c34:   	subc	%i3, %i4, %l6
	.word	0xed262000	! t0_kref+0x1c38:   	st	%f22, [%i0]
	.word	0x81ab0adc	! t0_kref+0x1c3c:   	fcmped	%fcc0, %f12, %f28
	.word	0xb5a54d32	! t0_kref+0x1c40:   	fsmuld	%f21, %f18, %f26
	.word	0x95400000	! t0_kref+0x1c44:   	mov	%y, %o2
	.word	0xe8ae9019	! t0_kref+0x1c48:   	stba	%l4, [%i2 + %i1]0x80
	.word	0x28480007	! t0_kref+0x1c4c:   	bleu,a,pt	%icc, _kref+0x1c68
	.word	0xd48e501a	! t0_kref+0x1c50:   	lduba	[%i1 + %i2]0x80, %o2
	.word	0xabb44eed	! t0_kref+0x1c54:   	fornot2s	%f17, %f13, %f21
	.word	0xe2267ff0	! t0_kref+0x1c58:   	st	%l1, [%i1 - 0x10]
	.word	0xa7b34abc	! t0_kref+0x1c5c:   	fpsub16s	%f13, %f28, %f19
	.word	0xa784fe57	! t0_kref+0x1c60:   	wr	%l3, 0xfffffe57, %gsr
	.word	0xa67a2341	! t0_kref+0x1c64:   	sdiv	%o0, 0x341, %l3
	.word	0xb1a50852	! t0_kref+0x1c68:   	faddd	%f20, %f18, %f24
	.word	0x81ae0a37	! t0_kref+0x1c6c:   	fcmps	%fcc0, %f24, %f23
	.word	0xd26e7fe1	! t0_kref+0x1c70:   	ldstub	[%i1 - 0x1f], %o1
	.word	0x9ba0189e	! t0_kref+0x1c74:   	fitos	%f30, %f13
	.word	0x9212bfac	! t0_kref+0x1c78:   	or	%o2, -0x54, %o1
	.word	0xa5b74dfa	! t0_kref+0x1c7c:   	fnands	%f29, %f26, %f18
	.word	0xa3a0053d	! t0_kref+0x1c80:   	fsqrts	%f29, %f17
	.word	0xb5a01037	! t0_kref+0x1c84:   	fstox	%f23, %f26
	.word	0xe056401b	! t0_kref+0x1c88:   	ldsh	[%i1 + %i3], %l0
	.word	0xa61cfea4	! t0_kref+0x1c8c:   	xor	%l3, -0x15c, %l3
	.word	0xaa9ab1b6	! t0_kref+0x1c90:   	xorcc	%o2, -0xe4a, %l5
	.word	0xec7f0019	! t0_kref+0x1c94:   	swap	[%i4 + %i1], %l6
	.word	0xb3a018d2	! t0_kref+0x1c98:   	fdtos	%f18, %f25
	.word	0x9da409d2	! t0_kref+0x1c9c:   	fdivd	%f16, %f18, %f14
	.word	0xa89d4012	! t0_kref+0x1ca0:   	xorcc	%l5, %l2, %l4
	call	SYM(t0_subr3)
	.word	0x81b01023	! t0_kref+0x1ca8:   	siam	0x3
	.word	0x36480007	! t0_kref+0x1cac:   	bge,a,pt	%icc, _kref+0x1cc8
	.word	0xa28d0015	! t0_kref+0x1cb0:   	andcc	%l4, %l5, %l1
	.word	0x001fffff	! t0_kref+0x1cb4:   	illtrap	0x1fffff
	.word	0xa47a8017	! t0_kref+0x1cb8:   	sdiv	%o2, %l7, %l2
	.word	0xa5a3c82d	! t0_kref+0x1cbc:   	fadds	%f15, %f13, %f18
	.word	0xa9a348bd	! t0_kref+0x1cc0:   	fsubs	%f13, %f29, %f20
	.word	0xa6d5e263	! t0_kref+0x1cc4:   	umulcc	%l7, 0x263, %l3
	.word	0x81da2204	! t0_kref+0x1cc8:   	flush	%o0 + 0x204
	.word	0xb9b50d94	! t0_kref+0x1ccc:   	fxor	%f20, %f20, %f28
	.word	0x81ab8a31	! t0_kref+0x1cd0:   	fcmps	%fcc0, %f14, %f17
	.word	0xe4280018	! t0_kref+0x1cd4:   	stb	%l2, [%g0 + %i0]
	.word	0xa9a608dc	! t0_kref+0x1cd8:   	fsubd	%f24, %f28, %f20
	.word	0x26800001	! t0_kref+0x1cdc:   	bl,a	_kref+0x1ce0
	.word	0xe2266000	! t0_kref+0x1ce0:   	st	%l1, [%i1]
	.word	0x99a70958	! t0_kref+0x1ce4:   	fmuld	%f28, %f24, %f12
	.word	0xa132a01d	! t0_kref+0x1ce8:   	srl	%o2, 0x1d, %l0
	.word	0xea280019	! t0_kref+0x1cec:   	stb	%l5, [%g0 + %i1]
	.word	0xa1b009bb	! t0_kref+0x1cf0:   	fexpand	%f27, %f16
	.word	0xa7a0013c	! t0_kref+0x1cf4:   	fabss	%f28, %f19
	.word	0xd406201c	! t0_kref+0x1cf8:   	ld	[%i0 + 0x1c], %o2
	.word	0xa818336d	! t0_kref+0x1cfc:   	xor	%g0, -0xc93, %l4
	.word	0xa60d400a	! t0_kref+0x1d00:   	and	%l5, %o2, %l3
	.word	0xa723284d	! t0_kref+0x1d04:   	mulscc	%o4, 0x84d, %l3
	.word	0xd46e3fe9	! t0_kref+0x1d08:   	ldstub	[%i0 - 0x17], %o2
	.word	0x1123fa11	! t0_kref+0x1d0c:   	sethi	%hi(0x8fe84400), %o0
	.word	0xa3408000	! t0_kref+0x1d10:   	mov	%ccr, %l1
	.word	0x3c800007	! t0_kref+0x1d14:   	bpos,a	_kref+0x1d30
	.word	0x8186c000	! t0_kref+0x1d18:   	wr	%i3, %g0, %y
	.word	0xdb06201c	! t0_kref+0x1d1c:   	ld	[%i0 + 0x1c], %f13
	.word	0xabb48dfc	! t0_kref+0x1d20:   	fnands	%f18, %f28, %f21
	.word	0xa0f6c009	! t0_kref+0x1d24:   	udivcc	%i3, %o1, %l0
	.word	0xeefe5000	! t0_kref+0x1d28:   	swapa	[%i1]0x80, %l7
	.word	0x94f5400a	! t0_kref+0x1d2c:   	udivcc	%l5, %o2, %o2
	.word	0x3e480001	! t0_kref+0x1d30:   	bvc,a,pt	%icc, _kref+0x1d34
	.word	0xbfb00774	! t0_kref+0x1d34:   	fpack16	%f20, %f31
	.word	0x3e800005	! t0_kref+0x1d38:   	bvc,a	_kref+0x1d4c
	.word	0xa0f50011	! t0_kref+0x1d3c:   	udivcc	%l4, %l1, %l0
	.word	0xa81d372e	! t0_kref+0x1d40:   	xor	%l4, -0x8d2, %l4
	.word	0xa9400000	! t0_kref+0x1d44:   	mov	%y, %l4
	.word	0xe02e3ff6	! t0_kref+0x1d48:   	stb	%l0, [%i0 - 0xa]
	.word	0xf636601a	! t0_kref+0x1d4c:   	sth	%i3, [%i1 + 0x1a]
	.word	0x35480003	! t0_kref+0x1d50:   	fbue,a,pt	%fcc0, _kref+0x1d5c
	.word	0xa0a4c00b	! t0_kref+0x1d54:   	subcc	%l3, %o3, %l0
	.word	0xc0a0a018	! t0_kref+0x1d58:   	sta	%g0, [%g2 + 0x18]%asi
	.word	0xee067ffc	! t0_kref+0x1d5c:   	ld	[%i1 - 4], %l7
	.word	0xa3400000	! t0_kref+0x1d60:   	mov	%y, %l1
	.word	0xb9a00539	! t0_kref+0x1d64:   	fsqrts	%f25, %f28
	.word	0xdd1fbe30	! t0_kref+0x1d68:   	ldd	[%fp - 0x1d0], %f14
	.word	0x81800000	! t0_kref+0x1d6c:   	mov	%g0, %y
	.word	0xa3a488b2	! t0_kref+0x1d70:   	fsubs	%f18, %f18, %f17
	.word	0xb1b00c20	! t0_kref+0x1d74:   	fzeros	%f24
	.word	0xb5b7c672	! t0_kref+0x1d78:   	fmul8x16au	%f31, %f18, %f26
	.word	0x93b540f3	! t0_kref+0x1d7c:   	edge16ln	%l5, %l3, %o1
	.word	0x81da4013	! t0_kref+0x1d80:   	flush	%o1 + %l3
	.word	0xda266014	! t0_kref+0x1d84:   	st	%o5, [%i1 + 0x14]
	.word	0x212094dc	! t0_kref+0x1d88:   	sethi	%hi(0x82537000), %l0
	.word	0xa41dc01a	! t0_kref+0x1d8c:   	xor	%l7, %i2, %l2
	.word	0xa1a40852	! t0_kref+0x1d90:   	faddd	%f16, %f18, %f16
	.word	0x81dc801d	! t0_kref+0x1d94:   	flush	%l2 + %i5
	.word	0xea500018	! t0_kref+0x1d98:   	ldsh	[%g0 + %i0], %l5
	.word	0xec062018	! t0_kref+0x1d9c:   	ld	[%i0 + 0x18], %l6
	.word	0xa8f4c00c	! t0_kref+0x1da0:   	udivcc	%l3, %o4, %l4
	.word	0xf986501c	! t0_kref+0x1da4:   	lda	[%i1 + %i4]0x80, %f28
	.word	0x9da7082d	! t0_kref+0x1da8:   	fadds	%f28, %f13, %f14
	.word	0xb9a00556	! t0_kref+0x1dac:   	fsqrtd	%f22, %f28
	.word	0xbbb007b2	! t0_kref+0x1db0:   	fpackfix	%f18, %f29
	.word	0x9de3bfa0	! t0_kref+0x1db4:   	save	%sp, -0x60, %sp
	.word	0xb60e401c	! t0_kref+0x1db8:   	and	%i1, %i4, %i3
	.word	0xabeec01d	! t0_kref+0x1dbc:   	restore	%i3, %i5, %l5
	.word	0x81df6c38	! t0_kref+0x1dc0:   	flush	%i5 + 0xc38
	.word	0x8143c000	! t0_kref+0x1dc4:   	stbar
	.word	0xa9a58850	! t0_kref+0x1dc8:   	faddd	%f22, %f16, %f20
	.word	0xf8200018	! t0_kref+0x1dcc:   	st	%i4, [%g0 + %i0]
	.word	0xb3a01a56	! t0_kref+0x1dd0:   	fdtoi	%f22, %f25
	.word	0xe0263fe8	! t0_kref+0x1dd4:   	st	%l0, [%i0 - 0x18]
	.word	0x9da0193e	! t0_kref+0x1dd8:   	fstod	%f30, %f14
	.word	0xafa01a50	! t0_kref+0x1ddc:   	fdtoi	%f16, %f23
	.word	0x940331aa	! t0_kref+0x1de0:   	add	%o4, -0xe56, %o2
	.word	0xd43e0000	! t0_kref+0x1de4:   	std	%o2, [%i0]
	.word	0x86102001	! t0_kref+0x1de8:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1dec:   	bne,a	_kref+0x1dec
	.word	0x86a0e001	! t0_kref+0x1df0:   	subcc	%g3, 1, %g3
	.word	0xa2856309	! t0_kref+0x1df4:   	addcc	%l5, 0x309, %l1
	.word	0xf1be189b	! t0_kref+0x1df8:   	stda	%f24, [%i0 + %i3]0xc4
	.word	0xad400000	! t0_kref+0x1dfc:   	mov	%y, %l6
	.word	0xd4c65000	! t0_kref+0x1e00:   	ldswa	[%i1]0x80, %o2
	.word	0x9db3c63e	! t0_kref+0x1e04:   	fmul8x16	%f15, %f30, %f14
	.word	0xa5a01a32	! t0_kref+0x1e08:   	fstoi	%f18, %f18
	.word	0xac0a0016	! t0_kref+0x1e0c:   	and	%o0, %l6, %l6
	.word	0xa875001c	! t0_kref+0x1e10:   	udiv	%l4, %i4, %l4
	.word	0xaba00532	! t0_kref+0x1e14:   	fsqrts	%f18, %f21
	.word	0xb1a0192e	! t0_kref+0x1e18:   	fstod	%f14, %f24
	.word	0x909f001c	! t0_kref+0x1e1c:   	xorcc	%i4, %i4, %o0
	.word	0xa5b70998	! t0_kref+0x1e20:   	bshuffle	%f28, %f24, %f18
	.word	0xadb5ce36	! t0_kref+0x1e24:   	fands	%f23, %f22, %f22
	.word	0xadb00c00	! t0_kref+0x1e28:   	fzero	%f22
	.word	0xac26bef3	! t0_kref+0x1e2c:   	sub	%i2, -0x10d, %l6
	.word	0x9215317d	! t0_kref+0x1e30:   	or	%l4, -0xe83, %o1
	.word	0xd0270000	! t0_kref+0x1e34:   	st	%o0, [%i4]
	.word	0xa0fa0011	! t0_kref+0x1e38:   	sdivcc	%o0, %l1, %l0
	.word	0x945a31e0	! t0_kref+0x1e3c:   	smul	%o0, -0xe20, %o2
	.word	0xa5a0052e	! t0_kref+0x1e40:   	fsqrts	%f14, %f18
	.word	0xabb30017	! t0_kref+0x1e44:   	edge8	%o4, %l7, %l5
	.word	0xa09c64b1	! t0_kref+0x1e48:   	xorcc	%l1, 0x4b1, %l0
	.word	0xb1a0189b	! t0_kref+0x1e4c:   	fitos	%f27, %f24
	.word	0xafb50175	! t0_kref+0x1e50:   	edge32ln	%l4, %l5, %l7
	.word	0xa6833af1	! t0_kref+0x1e54:   	addcc	%o4, -0x50f, %l3
	.word	0xd4200019	! t0_kref+0x1e58:   	st	%o2, [%g0 + %i1]
	.word	0xac9b7b06	! t0_kref+0x1e5c:   	xorcc	%o5, -0x4fa, %l6
	.word	0xa49ec016	! t0_kref+0x1e60:   	xorcc	%i3, %l6, %l2
	.word	0xa3b50492	! t0_kref+0x1e64:   	fcmple32	%f20, %f18, %l1
	.word	0x8610200a	! t0_kref+0x1e68:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x1e6c:   	subcc	%g3, 1, %g3
	.word	0x22800004	! t0_kref+0x1e70:   	be,a	_kref+0x1e80
	.word	0x9ba0012d	! t0_kref+0x1e74:   	fabss	%f13, %f13
	.word	0x81dc0016	! t0_kref+0x1e78:   	flush	%l0 + %l6
	.word	0xf7063ff4	! t0_kref+0x1e7c:   	ld	[%i0 - 0xc], %f27
	.word	0x9f414000	! t0_kref+0x1e80:   	mov	%pc, %o7
!	.word	0x3189105d	! t0_kref+0x1e84:   	fba,a	SYM(t0_subr2)
	   	fba,a	SYM(t0_subr2)
	.word	0xafa0053b	! t0_kref+0x1e88:   	fsqrts	%f27, %f23
	.word	0xe46e001a	! t0_kref+0x1e8c:   	ldstub	[%i0 + %i2], %l2
	.word	0xecfe501c	! t0_kref+0x1e90:   	swapa	[%i1 + %i4]0x80, %l6
	.word	0xf4267ff4	! t0_kref+0x1e94:   	st	%i2, [%i1 - 0xc]
	.word	0xe00e3fec	! t0_kref+0x1e98:   	ldub	[%i0 - 0x14], %l0
	.word	0xc108001c	! t0_kref+0x1e9c:   	ld	[%g0 + %i4], %fsr
	.word	0xa45dbceb	! t0_kref+0x1ea0:   	smul	%l6, -0x315, %l2
	.word	0xafb40e6e	! t0_kref+0x1ea4:   	fxnors	%f16, %f14, %f23
	.word	0xa21a0010	! t0_kref+0x1ea8:   	xor	%o0, %l0, %l1
	.word	0xbda7c8bb	! t0_kref+0x1eac:   	fsubs	%f31, %f27, %f30
	.word	0xb9a00558	! t0_kref+0x1eb0:   	fsqrtd	%f24, %f28
	.word	0x901d4000	! t0_kref+0x1eb4:   	xor	%l5, %g0, %o0
	.word	0xbda34d3a	! t0_kref+0x1eb8:   	fsmuld	%f13, %f26, %f30
	.word	0xa5a60d33	! t0_kref+0x1ebc:   	fsmuld	%f24, %f19, %f18
	.word	0xd87f0019	! t0_kref+0x1ec0:   	swap	[%i4 + %i1], %o4
	.word	0xd46e3ff0	! t0_kref+0x1ec4:   	ldstub	[%i0 - 0x10], %o2
	.word	0xa85f0014	! t0_kref+0x1ec8:   	smul	%i4, %l4, %l4
	.word	0xafa0052e	! t0_kref+0x1ecc:   	fsqrts	%f14, %f23
	.word	0xa5a4895a	! t0_kref+0x1ed0:   	fmuld	%f18, %f26, %f18
	.word	0xb5a0054c	! t0_kref+0x1ed4:   	fsqrtd	%f12, %f26
	.word	0x92d8001b	! t0_kref+0x1ed8:   	smulcc	%g0, %i3, %o1
	.word	0xaa742236	! t0_kref+0x1edc:   	udiv	%l0, 0x236, %l5
	.word	0xf906401c	! t0_kref+0x1ee0:   	ld	[%i1 + %i4], %f28
	.word	0xe02e200c	! t0_kref+0x1ee4:   	stb	%l0, [%i0 + 0xc]
	.word	0x81580000	! t0_kref+0x1ee8:   	flushw
	.word	0x81ad8ad2	! t0_kref+0x1eec:   	fcmped	%fcc0, %f22, %f18
	.word	0xa7a01a3c	! t0_kref+0x1ef0:   	fstoi	%f28, %f19
	.word	0xb1b68ad0	! t0_kref+0x1ef4:   	fpsub32	%f26, %f16, %f24
	.word	0x928ebfb9	! t0_kref+0x1ef8:   	andcc	%i2, -0x47, %o1
	.word	0xee6e2004	! t0_kref+0x1efc:   	ldstub	[%i0 + 4], %l7
	.word	0xbfa0002d	! t0_kref+0x1f00:   	fmovs	%f13, %f31
	.word	0xe3867fe4	! t0_kref+0x1f04:   	lda	[%i1 - 0x1c]%asi, %f17
	.word	0xa1a0055c	! t0_kref+0x1f08:   	fsqrtd	%f28, %f16
	.word	0x9ba0053b	! t0_kref+0x1f0c:   	fsqrts	%f27, %f13
	.word	0x26800005	! t0_kref+0x1f10:   	bl,a	_kref+0x1f24
	.word	0xa1a01a5e	! t0_kref+0x1f14:   	fdtoi	%f30, %f16
	.word	0xbfa6c83a	! t0_kref+0x1f18:   	fadds	%f27, %f26, %f31
	.word	0xd8380018	! t0_kref+0x1f1c:   	std	%o4, [%g0 + %i0]
	.word	0xadb50f9a	! t0_kref+0x1f20:   	for	%f20, %f26, %f22
	.word	0xc608001a	! t0_kref+0x1f24:   	ldub	[%g0 + %i2], %g3
	.word	0x90828008	! t0_kref+0x1f28:   	addcc	%o2, %o0, %o0
	.word	0x90daff7b	! t0_kref+0x1f2c:   	smulcc	%o3, -0x85, %o0
	.word	0x9472b0e5	! t0_kref+0x1f30:   	udiv	%o2, -0xf1b, %o2
	.word	0x94130015	! t0_kref+0x1f34:   	or	%o4, %l5, %o2
	.word	0x92524014	! t0_kref+0x1f38:   	umul	%o1, %l4, %o1
	.word	0x3e800004	! t0_kref+0x1f3c:   	bvc,a	_kref+0x1f4c
	.word	0xbda708b7	! t0_kref+0x1f40:   	fsubs	%f28, %f23, %f30
	.word	0x95b48136	! t0_kref+0x1f44:   	edge32n	%l2, %l6, %o2
	.word	0xa1b5c128	! t0_kref+0x1f48:   	edge32n	%l7, %o0, %l0
	.word	0xada00031	! t0_kref+0x1f4c:   	fmovs	%f17, %f22
	.word	0x9da38950	! t0_kref+0x1f50:   	fmuld	%f14, %f16, %f14
	.word	0xa324b0f4	! t0_kref+0x1f54:   	mulscc	%l2, -0xf0c, %l1
	.word	0xd8e81018	! t0_kref+0x1f58:   	ldstuba	[%g0 + %i0]0x80, %o4
	.word	0x8143e040	! t0_kref+0x1f5c:   	membar	0x40
	.word	0x81af0a39	! t0_kref+0x1f60:   	fcmps	%fcc0, %f28, %f25
	.word	0xa875ba90	! t0_kref+0x1f64:   	udiv	%l6, -0x570, %l4
	.word	0x9db00c20	! t0_kref+0x1f68:   	fzeros	%f14
	.word	0xe06e6017	! t0_kref+0x1f6c:   	ldstub	[%i1 + 0x17], %l0
	call	SYM(t0_subr2)
	.word	0xbda5095e	! t0_kref+0x1f74:   	fmuld	%f20, %f30, %f30
	.word	0xb5a00530	! t0_kref+0x1f78:   	fsqrts	%f16, %f26
	.word	0xa4f2401a	! t0_kref+0x1f7c:   	udivcc	%o1, %i2, %l2
	.word	0xa3a6483d	! t0_kref+0x1f80:   	fadds	%f25, %f29, %f17
	.word	0xb3a01a3b	! t0_kref+0x1f84:   	fstoi	%f27, %f25
	.word	0x13209741	! t0_kref+0x1f88:   	sethi	%hi(0x825d0400), %o1
	.word	0x99a000d8	! t0_kref+0x1f8c:   	fnegd	%f24, %f12
	.word	0xabb6cabe	! t0_kref+0x1f90:   	fpsub16s	%f27, %f30, %f21
	.word	0xada588ce	! t0_kref+0x1f94:   	fsubd	%f22, %f14, %f22
	.word	0x3c480008	! t0_kref+0x1f98:   	bpos,a,pt	%icc, _kref+0x1fb8
	.word	0xa4f34016	! t0_kref+0x1f9c:   	udivcc	%o5, %l6, %l2
	.word	0x2e480008	! t0_kref+0x1fa0:   	bvs,a,pt	%icc, _kref+0x1fc0
	.word	0xa12aa01c	! t0_kref+0x1fa4:   	sll	%o2, 0x1c, %l0
	.word	0x27480001	! t0_kref+0x1fa8:   	fbul,a,pt	%fcc0, _kref+0x1fac
	.word	0xee26401c	! t0_kref+0x1fac:   	st	%l7, [%i1 + %i4]
	.word	0xbda00138	! t0_kref+0x1fb0:   	fabss	%f24, %f30
	.word	0xadb50f6e	! t0_kref+0x1fb4:   	fornot1s	%f20, %f14, %f22
	.word	0x3d480007	! t0_kref+0x1fb8:   	fbule,a,pt	%fcc0, _kref+0x1fd4
	.word	0xe67e7ff0	! t0_kref+0x1fbc:   	swap	[%i1 - 0x10], %l3
	.word	0xaba01898	! t0_kref+0x1fc0:   	fitos	%f24, %f21
	.word	0xa7400000	! t0_kref+0x1fc4:   	mov	%y, %l3
	.word	0xed68a083	! t0_kref+0x1fc8:   	prefetch	%g2 + 0x83, 22
	.word	0xaaa4801a	! t0_kref+0x1fcc:   	subcc	%l2, %i2, %l5
	.word	0xa7b4045c	! t0_kref+0x1fd0:   	fcmpne16	%f16, %f28, %l3
	.word	0x81ab8a54	! t0_kref+0x1fd4:   	fcmpd	%fcc0, %f14, %f20
	.word	0x9fc10000	! t0_kref+0x1fd8:   	call	%g4
	.word	0x90834014	! t0_kref+0x1fdc:   	addcc	%o5, %l4, %o0
	.word	0xa085ede5	! t0_kref+0x1fe0:   	addcc	%l7, 0xde5, %l0
	.word	0x95b30157	! t0_kref+0x1fe4:   	edge32l	%o4, %l7, %o2
	.word	0xa864800b	! t0_kref+0x1fe8:   	subc	%l2, %o3, %l4
	.word	0x34800008	! t0_kref+0x1fec:   	bg,a	_kref+0x200c
	.word	0xb9b007b0	! t0_kref+0x1ff0:   	fpackfix	%f16, %f28
	.word	0xa5a0192e	! t0_kref+0x1ff4:   	fstod	%f14, %f18
	.word	0xd2266018	! t0_kref+0x1ff8:   	st	%o1, [%i1 + 0x18]
	.word	0x81df6fe2	! t0_kref+0x1ffc:   	flush	%i5 + 0xfe2
	.word	0xba103ff0	! t0_kref+0x2000:   	mov	0xfffffff0, %i5
	.word	0xb4102013	! t0_kref+0x2004:   	mov	0x13, %i2
	.word	0xaa7c7ad1	! t0_kref+0x2008:   	sdiv	%l1, -0x52f, %l5
	.word	0x93b6850e	! t0_kref+0x200c:   	fcmpgt16	%f26, %f14, %o1
	.word	0xdd866014	! t0_kref+0x2010:   	lda	[%i1 + 0x14]%asi, %f14
	.word	0x3d800003	! t0_kref+0x2014:   	fbule,a	_kref+0x2020
	.word	0xab400000	! t0_kref+0x2018:   	mov	%y, %l5
	.word	0xb7b48ded	! t0_kref+0x201c:   	fnands	%f18, %f13, %f27
	.word	0xbdb60ad4	! t0_kref+0x2020:   	fpsub32	%f24, %f20, %f30
	.word	0xe0e81018	! t0_kref+0x2024:   	ldstuba	[%g0 + %i0]0x80, %l0
	.word	0xd4c0a00c	! t0_kref+0x2028:   	ldswa	[%g2 + 0xc]%asi, %o2
	.word	0xbdb68ece	! t0_kref+0x202c:   	fornot2	%f26, %f14, %f30
	.word	0xe60e401a	! t0_kref+0x2030:   	ldub	[%i1 + %i2], %l3
	.word	0xa2daf92d	! t0_kref+0x2034:   	smulcc	%o3, -0x6d3, %l1
	.word	0xbba0053f	! t0_kref+0x2038:   	fsqrts	%f31, %f29
	.word	0x941e800b	! t0_kref+0x203c:   	xor	%i2, %o3, %o2
	.word	0xd46e201e	! t0_kref+0x2040:   	ldstub	[%i0 + 0x1e], %o2
	.word	0xf1ee101a	! t0_kref+0x2044:   	prefetcha	%i0 + %i2, 24
	.word	0x81828000	! t0_kref+0x2048:   	wr	%o2, %g0, %y
	.word	0xf19e1000	! t0_kref+0x204c:   	ldda	[%i0]0x80, %f24
	.word	0xe6062014	! t0_kref+0x2050:   	ld	[%i0 + 0x14], %l3
	.word	0xa01a0013	! t0_kref+0x2054:   	xor	%o0, %l3, %l0
	.word	0xa1a5083c	! t0_kref+0x2058:   	fadds	%f20, %f28, %f16
	.word	0xa1b4c074	! t0_kref+0x205c:   	edge8ln	%l3, %l4, %l0
	.word	0xdb066010	! t0_kref+0x2060:   	ld	[%i1 + 0x10], %f13
	call	SYM(t0_subr2)
	.word	0xb7a688bd	! t0_kref+0x2068:   	fsubs	%f26, %f29, %f27
	.word	0xea0e0000	! t0_kref+0x206c:   	ldub	[%i0], %l5
	.word	0x8584aa6e	! t0_kref+0x2070:   	wr	%l2, 0xa6e, %ccr
	.word	0xa3b6814c	! t0_kref+0x2074:   	edge32l	%i2, %o4, %l1
	.word	0xeef81018	! t0_kref+0x2078:   	swapa	[%g0 + %i0]0x80, %l7
	.word	0x34480005	! t0_kref+0x207c:   	bg,a,pt	%icc, _kref+0x2090
	.word	0xd04e2017	! t0_kref+0x2080:   	ldsb	[%i0 + 0x17], %o0
	.word	0xe4700019	! t0_kref+0x2084:   	stx	%l2, [%g0 + %i1]
	.word	0xe51f4019	! t0_kref+0x2088:   	ldd	[%i5 + %i1], %f18
	.word	0x21033050	! t0_kref+0x208c:   	sethi	%hi(0xcc14000), %l0
	.word	0x99b38918	! t0_kref+0x2090:   	faligndata	%f14, %f24, %f12
	.word	0x2d800001	! t0_kref+0x2094:   	fbg,a	_kref+0x2098
	.word	0x929ee0df	! t0_kref+0x2098:   	xorcc	%i3, 0xdf, %o1
	.word	0x21480001	! t0_kref+0x209c:   	fbn,a,pt	%fcc0, _kref+0x20a0
	.word	0x001fffff	! t0_kref+0x20a0:   	illtrap	0x1fffff
	.word	0xec56600c	! t0_kref+0x20a4:   	ldsh	[%i1 + 0xc], %l6
	.word	0x81aeca34	! t0_kref+0x20a8:   	fcmps	%fcc0, %f27, %f20
	.word	0x90da2927	! t0_kref+0x20ac:   	smulcc	%o0, 0x927, %o0
	.word	0x34480005	! t0_kref+0x20b0:   	bg,a,pt	%icc, _kref+0x20c4
	.word	0x923a000a	! t0_kref+0x20b4:   	xnor	%o0, %o2, %o1
	.word	0xa3b5854e	! t0_kref+0x20b8:   	fcmpeq16	%f22, %f14, %l1
	.word	0x9db48c90	! t0_kref+0x20bc:   	fandnot2	%f18, %f16, %f14
	.word	0xaafb2f00	! t0_kref+0x20c0:   	sdivcc	%o4, 0xf00, %l5
	.word	0xa605400d	! t0_kref+0x20c4:   	add	%l5, %o5, %l3
	call	SYM(t0_subr2)
	.word	0xe66e601c	! t0_kref+0x20cc:   	ldstub	[%i1 + 0x1c], %l3
	.word	0x92e232e9	! t0_kref+0x20d0:   	subccc	%o0, -0xd17, %o1
	.word	0xa013400b	! t0_kref+0x20d4:   	or	%o5, %o3, %l0
	.word	0x81ac0aba	! t0_kref+0x20d8:   	fcmpes	%fcc0, %f16, %f26
	.word	0xa9b40ace	! t0_kref+0x20dc:   	fpsub32	%f16, %f14, %f20
	.word	0xa265c015	! t0_kref+0x20e0:   	subc	%l7, %l5, %l1
	.word	0xabb3cf71	! t0_kref+0x20e4:   	fornot1s	%f15, %f17, %f21
	.word	0xaa3d800a	! t0_kref+0x20e8:   	xnor	%l6, %o2, %l5
	.word	0x81dca9a6	! t0_kref+0x20ec:   	flush	%l2 + 0x9a6
	.word	0x38480008	! t0_kref+0x20f0:   	bgu,a,pt	%icc, _kref+0x2110
	.word	0xec462018	! t0_kref+0x20f4:   	ldsw	[%i0 + 0x18], %l6
	.word	0xe1be5888	! t0_kref+0x20f8:   	stda	%f16, [%i1 + %o0]0xc4
	.word	0x3f800008	! t0_kref+0x20fc:   	fbo,a	_kref+0x211c
	.word	0xf4200018	! t0_kref+0x2100:   	st	%i2, [%g0 + %i0]
	.word	0x99a00152	! t0_kref+0x2104:   	fabsd	%f18, %f12
	.word	0xf5a0a030	! t0_kref+0x2108:   	sta	%f26, [%g2 + 0x30]%asi
	.word	0xbda7094c	! t0_kref+0x210c:   	fmuld	%f28, %f12, %f30
	.word	0xbda589d6	! t0_kref+0x2110:   	fdivd	%f22, %f22, %f30
	.word	0x3d480006	! t0_kref+0x2114:   	fbule,a,pt	%fcc0, _kref+0x212c
	.word	0xa0dac010	! t0_kref+0x2118:   	smulcc	%o3, %l0, %l0
	.word	0xa4200015	! t0_kref+0x211c:   	neg	%l5, %l2
	.word	0xdd06600c	! t0_kref+0x2120:   	ld	[%i1 + 0xc], %f14
	.word	0xa825000d	! t0_kref+0x2124:   	sub	%l4, %o5, %l4
	call	SYM(t0_subr1)
	.word	0xb5b70d9a	! t0_kref+0x212c:   	fxor	%f28, %f26, %f26
	.word	0xa29ac011	! t0_kref+0x2130:   	xorcc	%o3, %l1, %l1
	.word	0xd91e001d	! t0_kref+0x2134:   	ldd	[%i0 + %i5], %f12
	.word	0xb6103ffe	! t0_kref+0x2138:   	mov	0xfffffffe, %i3
	.word	0xbda48950	! t0_kref+0x213c:   	fmuld	%f18, %f16, %f30
	.word	0x81db4016	! t0_kref+0x2140:   	flush	%o5 + %l6
	.word	0x9de3bfa0	! t0_kref+0x2144:   	save	%sp, -0x60, %sp
	.word	0xabee801b	! t0_kref+0x2148:   	restore	%i2, %i3, %l5
	call	SYM(t0_subr2)
	.word	0xa4d30013	! t0_kref+0x2150:   	umulcc	%o4, %l3, %l2
	.word	0x34480003	! t0_kref+0x2154:   	bg,a,pt	%icc, _kref+0x2160
	.word	0xd6270019	! t0_kref+0x2158:   	st	%o3, [%i4 + %i1]
	.word	0xa9b64eef	! t0_kref+0x215c:   	fornot2s	%f25, %f15, %f20
	.word	0x9ba00036	! t0_kref+0x2160:   	fmovs	%f22, %f13
	.word	0xa9a0103b	! t0_kref+0x2164:   	fstox	%f27, %f20
	.word	0xadb587ce	! t0_kref+0x2168:   	pdist	%f22, %f14, %f22
	.word	0x9f414000	! t0_kref+0x216c:   	mov	%pc, %o7
!	.word	0x3f4fcfa4	! t0_kref+0x2170:   	fbo,a,pt	%fcc0, SYM(t0_subr0)
	   	fbo,a,pt	%fcc0, SYM(t0_subr0)
	.word	0xa083635c	! t0_kref+0x2174:   	addcc	%o5, 0x35c, %l0
	.word	0xa53aa00b	! t0_kref+0x2178:   	sra	%o2, 0xb, %l2
	.word	0x9ba01a4e	! t0_kref+0x217c:   	fdtoi	%f14, %f13
	.word	0x2d480008	! t0_kref+0x2180:   	fbg,a,pt	%fcc0, _kref+0x21a0
	.word	0xa3400000	! t0_kref+0x2184:   	mov	%y, %l1
	.word	0xd67e6008	! t0_kref+0x2188:   	swap	[%i1 + 8], %o3
	.word	0xf6280018	! t0_kref+0x218c:   	stb	%i3, [%g0 + %i0]
	.word	0xa40ae4e5	! t0_kref+0x2190:   	and	%o3, 0x4e5, %l2
	.word	0xdf000019	! t0_kref+0x2194:   	ld	[%g0 + %i1], %f15
	.word	0xa5b3cf7e	! t0_kref+0x2198:   	fornot1s	%f15, %f30, %f18
	.word	0xdfa0a018	! t0_kref+0x219c:   	sta	%f15, [%g2 + 0x18]%asi
	.word	0xb5a70d37	! t0_kref+0x21a0:   	fsmuld	%f28, %f23, %f26
	.word	0xa0fc2789	! t0_kref+0x21a4:   	sdivcc	%l0, 0x789, %l0
	.word	0xa9a0055c	! t0_kref+0x21a8:   	fsqrtd	%f28, %f20
	.word	0xef867ff4	! t0_kref+0x21ac:   	lda	[%i1 - 0xc]%asi, %f23
	.word	0xa5a3884e	! t0_kref+0x21b0:   	faddd	%f14, %f14, %f18
	.word	0xaba0188d	! t0_kref+0x21b4:   	fitos	%f13, %f21
	.word	0xae56c00b	! t0_kref+0x21b8:   	umul	%i3, %o3, %l7
	.word	0xaa7365e9	! t0_kref+0x21bc:   	udiv	%o5, 0x5e9, %l5
	.word	0xd06e3fe3	! t0_kref+0x21c0:   	ldstub	[%i0 - 0x1d], %o0
	.word	0xe968a005	! t0_kref+0x21c4:   	prefetch	%g2 + 5, 20
	.word	0xac7d6248	! t0_kref+0x21c8:   	sdiv	%l5, 0x248, %l6
	.word	0x81ab0ad6	! t0_kref+0x21cc:   	fcmped	%fcc0, %f12, %f22
	.word	0xa9a01118	! t0_kref+0x21d0:   	fxtod	%f24, %f20
	.word	0xaba0013f	! t0_kref+0x21d4:   	fabss	%f31, %f21
	.word	0x2731fb43	! t0_kref+0x21d8:   	sethi	%hi(0xc7ed0c00), %l3
	.word	0xfb6e401a	! t0_kref+0x21dc:   	prefetch	%i1 + %i2, 29
	.word	0x86102002	! t0_kref+0x21e0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x21e4:   	bne,a	_kref+0x21e4
	.word	0x86a0e001	! t0_kref+0x21e8:   	subcc	%g3, 1, %g3
	.word	0xb7a01a58	! t0_kref+0x21ec:   	fdtoi	%f24, %f27
	.word	0x8143c000	! t0_kref+0x21f0:   	stbar
	.word	0x9486b759	! t0_kref+0x21f4:   	addcc	%i2, -0x8a7, %o2
	call	SYM(t0_subr3)
	.word	0xae54ebd6	! t0_kref+0x21fc:   	umul	%l3, 0xbd6, %l7
	.word	0xaa52656e	! t0_kref+0x2200:   	umul	%o1, 0x56e, %l5
	.word	0x81dd0001	! t0_kref+0x2204:   	flush	%l4 + %g1
	.word	0x9db50dd0	! t0_kref+0x2208:   	fnand	%f20, %f16, %f14
	.word	0xa606e8a2	! t0_kref+0x220c:   	add	%i3, 0x8a2, %l3
	.word	0xe91e7ff0	! t0_kref+0x2210:   	ldd	[%i1 - 0x10], %f20
	.word	0xe8865000	! t0_kref+0x2214:   	lda	[%i1]0x80, %l4
	.word	0xf9be5a5c	! t0_kref+0x2218:   	stda	%f28, [%i1 + %i4]0xd2
	.word	0xbdb38ad0	! t0_kref+0x221c:   	fpsub32	%f14, %f16, %f30
	.word	0xc028a039	! t0_kref+0x2220:   	clrb	[%g2 + 0x39]
	.word	0x001fffff	! t0_kref+0x2224:   	illtrap	0x1fffff
	.word	0xe81f4018	! t0_kref+0x2228:   	ldd	[%i5 + %i0], %l4
	.word	0xa1b38a6e	! t0_kref+0x222c:   	fpadd32s	%f14, %f14, %f16
	.word	0xe1264000	! t0_kref+0x2230:   	st	%f16, [%i1]
	.word	0xe51e3fe8	! t0_kref+0x2234:   	ldd	[%i0 - 0x18], %f18
	.word	0xf8a0a004	! t0_kref+0x2238:   	sta	%i4, [%g2 + 4]%asi
	.word	0xae2ec01a	! t0_kref+0x223c:   	andn	%i3, %i2, %l7
	.word	0x8143c000	! t0_kref+0x2240:   	stbar
	.word	0x86102021	! t0_kref+0x2244:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x2248:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x224c:   	be,a	_kref+0x22c0
	.word	0xea263ff8	! t0_kref+0x2250:   	st	%l5, [%i0 - 8]
	.word	0xa61f2103	! t0_kref+0x2254:   	xor	%i4, 0x103, %l3
	.word	0x2e4ffffc	! t0_kref+0x2258:   	bvs,a,pt	%icc, _kref+0x2248
	.word	0x2d08d160	! t0_kref+0x225c:   	sethi	%hi(0x23458000), %l6
	.word	0xa5a7cd30	! t0_kref+0x2260:   	fsmuld	%f31, %f16, %f18
	call	SYM(t0_subr3)
	.word	0xa65aa125	! t0_kref+0x2268:   	smul	%o2, 0x125, %l3
	.word	0xa1b58a94	! t0_kref+0x226c:   	fpsub16	%f22, %f20, %f16
	.word	0xa3a488b8	! t0_kref+0x2270:   	fsubs	%f18, %f24, %f17
	.word	0x2e480003	! t0_kref+0x2274:   	bvs,a,pt	%icc, _kref+0x2280
	.word	0x81db8005	! t0_kref+0x2278:   	flush	%sp + %g5
	.word	0xa5a0053d	! t0_kref+0x227c:   	fsqrts	%f29, %f18
	.word	0xd82e6008	! t0_kref+0x2280:   	stb	%o4, [%i1 + 8]
	.word	0xad400000	! t0_kref+0x2284:   	mov	%y, %l6
	.word	0xaaddac08	! t0_kref+0x2288:   	smulcc	%l6, 0xc08, %l5
	.word	0xbba0013c	! t0_kref+0x228c:   	fabss	%f28, %f29
	.word	0xe2070019	! t0_kref+0x2290:   	ld	[%i4 + %i1], %l1
	.word	0x29bfffed	! t0_kref+0x2294:   	fbl,a	_kref+0x2248
	.word	0xa9a0055e	! t0_kref+0x2298:   	fsqrtd	%f30, %f20
	.word	0x8143c000	! t0_kref+0x229c:   	stbar
	.word	0xae0c4014	! t0_kref+0x22a0:   	and	%l1, %l4, %l7
	call	SYM(t0_subr2)
	.word	0x81dde24e	! t0_kref+0x22a8:   	flush	%l7 + 0x24e
	.word	0xda7f0018	! t0_kref+0x22ac:   	swap	[%i4 + %i0], %o5
	.word	0xa1a6cd2f	! t0_kref+0x22b0:   	fsmuld	%f27, %f15, %f16
	.word	0xafa7c8b1	! t0_kref+0x22b4:   	fsubs	%f31, %f17, %f23
	.word	0x8143c000	! t0_kref+0x22b8:   	stbar
	.word	0xaba000bc	! t0_kref+0x22bc:   	fnegs	%f28, %f21
	.word	0xb1a0055c	! t0_kref+0x22c0:   	fsqrtd	%f28, %f24
	.word	0x27800005	! t0_kref+0x22c4:   	fbul,a	_kref+0x22d8
	.word	0xd406601c	! t0_kref+0x22c8:   	ld	[%i1 + 0x1c], %o2
	.word	0xa1a40d36	! t0_kref+0x22cc:   	fsmuld	%f16, %f22, %f16
	.word	0xa7a01a5a	! t0_kref+0x22d0:   	fdtoi	%f26, %f19
	.word	0xafb58ef3	! t0_kref+0x22d4:   	fornot2s	%f22, %f19, %f23
	.word	0xd00e401a	! t0_kref+0x22d8:   	ldub	[%i1 + %i2], %o0
	.word	0xbda0052d	! t0_kref+0x22dc:   	fsqrts	%f13, %f30
	.word	0xd4200018	! t0_kref+0x22e0:   	st	%o2, [%g0 + %i0]
	.word	0x3e480003	! t0_kref+0x22e4:   	bvc,a,pt	%icc, _kref+0x22f0
	.word	0xa50b401c	! t0_kref+0x22e8:   	tsubcc	%o5, %i4, %l2
	.word	0xa2df350c	! t0_kref+0x22ec:   	smulcc	%i4, -0xaf4, %l1
	.word	0x94e5e75c	! t0_kref+0x22f0:   	subccc	%l7, 0x75c, %o2
	.word	0xf9064000	! t0_kref+0x22f4:   	ld	[%i1], %f28
	.word	0xbfb60d33	! t0_kref+0x22f8:   	fandnot1s	%f24, %f19, %f31
	.word	0xea7e0000	! t0_kref+0x22fc:   	swap	[%i0], %l5
	.word	0x86102003	! t0_kref+0x2300:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2304:   	bne,a	_kref+0x2304
	.word	0x86a0e001	! t0_kref+0x2308:   	subcc	%g3, 1, %g3
	.word	0xb5b38ede	! t0_kref+0x230c:   	fornot2	%f14, %f30, %f26
	.word	0xb3a0052e	! t0_kref+0x2310:   	fsqrts	%f14, %f25
	call	SYM(t0_subr1)
	.word	0x9240001b	! t0_kref+0x2318:   	addc	%g0, %i3, %o1
	.word	0x35800005	! t0_kref+0x231c:   	fbue,a	_kref+0x2330
	.word	0xd3e65009	! t0_kref+0x2320:   	casa	[%i1]0x80, %o1, %o1
	.word	0x925a0011	! t0_kref+0x2324:   	smul	%o0, %l1, %o1
	.word	0xf11f4018	! t0_kref+0x2328:   	ldd	[%i5 + %i0], %f24
	.word	0x3b480002	! t0_kref+0x232c:   	fble,a,pt	%fcc0, _kref+0x2334
	.word	0xa9b2c04d	! t0_kref+0x2330:   	edge8l	%o3, %o5, %l4
	.word	0xa42a800c	! t0_kref+0x2334:   	andn	%o2, %o4, %l2
	.word	0xa4a42bd0	! t0_kref+0x2338:   	subcc	%l0, 0xbd0, %l2
	.word	0x92f73d26	! t0_kref+0x233c:   	udivcc	%i4, -0x2da, %o1
	.word	0xe9bf1a59	! t0_kref+0x2340:   	stda	%f20, [%i4 + %i1]0xd2
	.word	0xa5b40a94	! t0_kref+0x2344:   	fpsub16	%f16, %f20, %f18
	.word	0x9db48ecc	! t0_kref+0x2348:   	fornot2	%f18, %f12, %f14
	.word	0x81850000	! t0_kref+0x234c:   	wr	%l4, %g0, %y
	.word	0xbda60954	! t0_kref+0x2350:   	fmuld	%f24, %f20, %f30
	.word	0xa8f6a9bb	! t0_kref+0x2354:   	udivcc	%i2, 0x9bb, %l4
	.word	0x81ac8aba	! t0_kref+0x2358:   	fcmpes	%fcc0, %f18, %f26
	.word	0xb1a64d31	! t0_kref+0x235c:   	fsmuld	%f25, %f17, %f24
	.word	0xa5a348b2	! t0_kref+0x2360:   	fsubs	%f13, %f18, %f18
	.word	0xe2480019	! t0_kref+0x2364:   	ldsb	[%g0 + %i1], %l1
	.word	0xe6270019	! t0_kref+0x2368:   	st	%l3, [%i4 + %i1]
	.word	0x28800003	! t0_kref+0x236c:   	bleu,a	_kref+0x2378
	.word	0x81df001c	! t0_kref+0x2370:   	flush	%i4 + %i4
	.word	0xa8df0011	! t0_kref+0x2374:   	smulcc	%i4, %l1, %l4
	.word	0xa1a6095e	! t0_kref+0x2378:   	fmuld	%f24, %f30, %f16
	.word	0xa873351c	! t0_kref+0x237c:   	udiv	%o4, -0xae4, %l4
	.word	0xa93ec000	! t0_kref+0x2380:   	sra	%i3, %g0, %l4
	.word	0x9fc00004	! t0_kref+0x2384:   	call	%g0 + %g4
	.word	0xaa168014	! t0_kref+0x2388:   	or	%i2, %l4, %l5
	.word	0x8143c000	! t0_kref+0x238c:   	stbar
	.word	0x9fc00004	! t0_kref+0x2390:   	call	%g0 + %g4
	.word	0xd81e2000	! t0_kref+0x2394:   	ldd	[%i0], %o4
	.word	0xa5a34d38	! t0_kref+0x2398:   	fsmuld	%f13, %f24, %f18
	.word	0xadb3cab5	! t0_kref+0x239c:   	fpsub16s	%f15, %f21, %f22
	.word	0xd06e0000	! t0_kref+0x23a0:   	ldstub	[%i0], %o0
	.word	0x81ae8a58	! t0_kref+0x23a4:   	fcmpd	%fcc0, %f26, %f24
	.word	0x920a001b	! t0_kref+0x23a8:   	and	%o0, %i3, %o1
	.word	0xaba548bb	! t0_kref+0x23ac:   	fsubs	%f21, %f27, %f21
	.word	0x9fa5c83e	! t0_kref+0x23b0:   	fadds	%f23, %f30, %f15
	.word	0xbba01891	! t0_kref+0x23b4:   	fitos	%f17, %f29
	.word	0x81dec00c	! t0_kref+0x23b8:   	flush	%i3 + %o4
	.word	0xb1b70f8e	! t0_kref+0x23bc:   	for	%f28, %f14, %f24
	.word	0xc0270019	! t0_kref+0x23c0:   	clr	[%i4 + %i1]
	.word	0x2f480008	! t0_kref+0x23c4:   	fbu,a,pt	%fcc0, _kref+0x23e4
	.word	0xa49ead65	! t0_kref+0x23c8:   	xorcc	%i2, 0xd65, %l2
	.word	0xd0067fe0	! t0_kref+0x23cc:   	ld	[%i1 - 0x20], %o0
	.word	0x26480001	! t0_kref+0x23d0:   	bl,a,pt	%icc, _kref+0x23d4
	.word	0xff06001c	! t0_kref+0x23d4:   	ld	[%i0 + %i4], %f31
	.word	0x3b800005	! t0_kref+0x23d8:   	fble,a	_kref+0x23ec
	.word	0xd86e7ff3	! t0_kref+0x23dc:   	ldstub	[%i1 - 0xd], %o4
	.word	0xbba748b1	! t0_kref+0x23e0:   	fsubs	%f29, %f17, %f29
	.word	0xa1b70ed0	! t0_kref+0x23e4:   	fornot2	%f28, %f16, %f16
	.word	0x9da01935	! t0_kref+0x23e8:   	fstod	%f21, %f14
	.word	0xac7b3e11	! t0_kref+0x23ec:   	sdiv	%o4, -0x1ef, %l6
	.word	0xb3a01a58	! t0_kref+0x23f0:   	fdtoi	%f24, %f25
	.word	0xb5a54d34	! t0_kref+0x23f4:   	fsmuld	%f21, %f20, %f26
	.word	0x22480007	! t0_kref+0x23f8:   	be,a,pt	%icc, _kref+0x2414
	.word	0xd67e2010	! t0_kref+0x23fc:   	swap	[%i0 + 0x10], %o3
	.word	0xb9b30a50	! t0_kref+0x2400:   	fpadd32	%f12, %f16, %f28
	.word	0xa1a648b5	! t0_kref+0x2404:   	fsubs	%f25, %f21, %f16
	.word	0xac5d6f69	! t0_kref+0x2408:   	smul	%l5, 0xf69, %l6
	.word	0xadb0077e	! t0_kref+0x240c:   	fpack16	%f30, %f22
	.word	0xb1a38952	! t0_kref+0x2410:   	fmuld	%f14, %f18, %f24
	.word	0xada50852	! t0_kref+0x2414:   	faddd	%f20, %f18, %f22
	.word	0xa5a01a2f	! t0_kref+0x2418:   	fstoi	%f15, %f18
	.word	0x37800008	! t0_kref+0x241c:   	fbge,a	_kref+0x243c
	.word	0xfb264000	! t0_kref+0x2420:   	st	%f29, [%i1]
	.word	0xae36aaf4	! t0_kref+0x2424:   	orn	%i2, 0xaf4, %l7
	.word	0xb3a0189a	! t0_kref+0x2428:   	fitos	%f26, %f25
	.word	0xe46e2005	! t0_kref+0x242c:   	ldstub	[%i0 + 5], %l2
	.word	0x2a480003	! t0_kref+0x2430:   	bcs,a,pt	%icc, _kref+0x243c
	.word	0xe26e7fee	! t0_kref+0x2434:   	ldstub	[%i1 - 0x12], %l1
	.word	0x81580000	! t0_kref+0x2438:   	flushw
	.word	0x908b7266	! t0_kref+0x243c:   	andcc	%o5, -0xd9a, %o0
	.word	0x90847ce8	! t0_kref+0x2440:   	addcc	%l1, -0x318, %o0
	.word	0x81800000	! t0_kref+0x2444:   	mov	%g0, %y
	.word	0xab400000	! t0_kref+0x2448:   	mov	%y, %l5
	.word	0x9da018d0	! t0_kref+0x244c:   	fdtos	%f16, %f14
	.word	0x81dd0015	! t0_kref+0x2450:   	flush	%l4 + %l5
	.word	0xbba548b9	! t0_kref+0x2454:   	fsubs	%f21, %f25, %f29
	.word	0xbda58d31	! t0_kref+0x2458:   	fsmuld	%f22, %f17, %f30
	.word	0x912a0000	! t0_kref+0x245c:   	sll	%o0, %g0, %o0
	.word	0xa1b58f9a	! t0_kref+0x2460:   	for	%f22, %f26, %f16
	call	1f
	.empty
	.word	0xe6400018	! t0_kref+0x2468:   	ldsw	[%g0 + %i0], %l3
	.word	0xeaae601a	! t0_kref+0x246c:   	stba	%l5, [%i1 + 0x1a]%asi
1:	.word	0xbdb009b3	! t0_kref+0x2470:   	fexpand	%f19, %f30
	.word	0x900cff17	! t0_kref+0x2474:   	and	%l3, -0xe9, %o0
	.word	0x150f1753	! t0_kref+0x2478:   	sethi	%hi(0x3c5d4c00), %o2
	.word	0x23800005	! t0_kref+0x247c:   	fbne,a	_kref+0x2490
	.word	0x9524c01a	! t0_kref+0x2480:   	mulscc	%l3, %i2, %o2
	.word	0xaba00536	! t0_kref+0x2484:   	fsqrts	%f22, %f21
	.word	0xe80e2012	! t0_kref+0x2488:   	ldub	[%i0 + 0x12], %l4
	.word	0x2a480006	! t0_kref+0x248c:   	bcs,a,pt	%icc, _kref+0x24a4
	.word	0xaba00537	! t0_kref+0x2490:   	fsqrts	%f23, %f21
	.word	0xa48ac00b	! t0_kref+0x2494:   	andcc	%o3, %o3, %l2
	.word	0xb5b009ad	! t0_kref+0x2498:   	fexpand	%f13, %f26
	.word	0xd0c61000	! t0_kref+0x249c:   	ldswa	[%i0]0x80, %o0
	.word	0xe9e8a08a	! t0_kref+0x24a0:   	prefetcha	%g2 + 0x8a, 20
	.word	0xc807bfe8	! t0_kref+0x24a4:   	ld	[%fp - 0x18], %g4
	.word	0xa0550000	! t0_kref+0x24a8:   	umul	%l4, %g0, %l0
	.word	0xa1b40ad0	! t0_kref+0x24ac:   	fpsub32	%f16, %f16, %f16
	.word	0x81ac8a36	! t0_kref+0x24b0:   	fcmps	%fcc0, %f18, %f22
	.word	0x9db74632	! t0_kref+0x24b4:   	fmul8x16	%f29, %f18, %f14
	.word	0xa4daa344	! t0_kref+0x24b8:   	smulcc	%o2, 0x344, %l2
	.word	0xacd57ab6	! t0_kref+0x24bc:   	umulcc	%l5, -0x54a, %l6
	.word	0xba103fe8	! t0_kref+0x24c0:   	mov	0xffffffe8, %i5
	.word	0xa1b70a14	! t0_kref+0x24c4:   	fpadd16	%f28, %f20, %f16
	.word	0xb9a01937	! t0_kref+0x24c8:   	fstod	%f23, %f28
	.word	0xada0052e	! t0_kref+0x24cc:   	fsqrts	%f14, %f22
	.word	0xd40e3ffc	! t0_kref+0x24d0:   	ldub	[%i0 - 4], %o2
	.word	0x28480005	! t0_kref+0x24d4:   	bleu,a,pt	%icc, _kref+0x24e8
	.word	0xa8603108	! t0_kref+0x24d8:   	subc	%g0, -0xef8, %l4
	.word	0xbda50d38	! t0_kref+0x24dc:   	fsmuld	%f20, %f24, %f30
	.word	0xa8dda56e	! t0_kref+0x24e0:   	smulcc	%l6, 0x56e, %l4
	.word	0x9da0189b	! t0_kref+0x24e4:   	fitos	%f27, %f14
	.word	0xa1a0055c	! t0_kref+0x24e8:   	fsqrtd	%f28, %f16
	.word	0x23480007	! t0_kref+0x24ec:   	fbne,a,pt	%fcc0, _kref+0x2508
	.word	0xa40a237b	! t0_kref+0x24f0:   	and	%o0, 0x37b, %l2
	.word	0xa52b600c	! t0_kref+0x24f4:   	sll	%o5, 0xc, %l2
	.word	0x93b28169	! t0_kref+0x24f8:   	edge32ln	%o2, %o1, %o1
	.word	0xb3a01a54	! t0_kref+0x24fc:   	fdtoi	%f20, %f25
	.word	0xa49eed7f	! t0_kref+0x2500:   	xorcc	%i3, 0xd7f, %l2
	.word	0xaa75001a	! t0_kref+0x2504:   	udiv	%l4, %i2, %l5
	.word	0xee200018	! t0_kref+0x2508:   	st	%l7, [%g0 + %i0]
	.word	0x30480007	! t0_kref+0x250c:   	ba,a,pt	%icc, _kref+0x2528
	.word	0x94defd26	! t0_kref+0x2510:   	smulcc	%i3, -0x2da, %o2
	.word	0xac17001b	! t0_kref+0x2514:   	or	%i4, %i3, %l6
	.word	0x93b70594	! t0_kref+0x2518:   	fcmpgt32	%f28, %f20, %o1
	.word	0xada01939	! t0_kref+0x251c:   	fstod	%f25, %f22
	.word	0xa40ac008	! t0_kref+0x2520:   	and	%o3, %o0, %l2
	.word	0xa9a54d33	! t0_kref+0x2524:   	fsmuld	%f21, %f19, %f20
	.word	0xaae28010	! t0_kref+0x2528:   	subccc	%o2, %l0, %l5
	.word	0xa4d73da3	! t0_kref+0x252c:   	umulcc	%i4, -0x25d, %l2
	.word	0xd04e2007	! t0_kref+0x2530:   	ldsb	[%i0 + 7], %o0
	.word	0xa1400000	! t0_kref+0x2534:   	mov	%y, %l0
	.word	0x35800006	! t0_kref+0x2538:   	fbue,a	_kref+0x2550
	.word	0xe22e2004	! t0_kref+0x253c:   	stb	%l1, [%i0 + 4]
	.word	0xe2270019	! t0_kref+0x2540:   	st	%l1, [%i4 + %i1]
	call	SYM(t0_subr3)
	.word	0x8143c000	! t0_kref+0x2548:   	stbar
	.word	0x33480007	! t0_kref+0x254c:   	fbe,a,pt	%fcc0, _kref+0x2568
	.word	0x95400000	! t0_kref+0x2550:   	mov	%y, %o2
	.word	0xada0193f	! t0_kref+0x2554:   	fstod	%f31, %f22
	.word	0x81db401f	! t0_kref+0x2558:   	flush	%o5 + %i7
	.word	0x941024ac	! t0_kref+0x255c:   	mov	0x4ac, %o2
	.word	0xa0768016	! t0_kref+0x2560:   	udiv	%i2, %l6, %l0
	.word	0xe13e2008	! t0_kref+0x2564:   	std	%f16, [%i0 + 8]
	.word	0x9540c000	! t0_kref+0x2568:   	mov	%asi, %o2
	.word	0xac52c016	! t0_kref+0x256c:   	umul	%o3, %l6, %l6
	.word	0x25800007	! t0_kref+0x2570:   	fblg,a	_kref+0x258c
	.word	0x8143c000	! t0_kref+0x2574:   	stbar
	.word	0xd2ce600f	! t0_kref+0x2578:   	ldsba	[%i1 + 0xf]%asi, %o1
	.word	0xb8102018	! t0_kref+0x257c:   	mov	0x18, %i4
	.word	0x9404c01a	! t0_kref+0x2580:   	add	%l3, %i2, %o2
	.word	0xd2260000	! t0_kref+0x2584:   	st	%o1, [%i0]
	.word	0x9da0053e	! t0_kref+0x2588:   	fsqrts	%f30, %f14
	.word	0xe6070019	! t0_kref+0x258c:   	ld	[%i4 + %i1], %l3
	.word	0x9de3bfa0	! t0_kref+0x2590:   	save	%sp, -0x60, %sp
	.word	0xbade3ade	! t0_kref+0x2594:   	smulcc	%i0, -0x522, %i5
	.word	0x95ee27f5	! t0_kref+0x2598:   	restore	%i0, 0x7f5, %o2
	.word	0xb1a0055a	! t0_kref+0x259c:   	fsqrtd	%f26, %f24
	.word	0x81d84004	! t0_kref+0x25a0:   	flush	%g1 + %g4
	.word	0xec500018	! t0_kref+0x25a4:   	ldsh	[%g0 + %i0], %l6
	.word	0xa7a648ba	! t0_kref+0x25a8:   	fsubs	%f25, %f26, %f19
	.word	0xa6a4800c	! t0_kref+0x25ac:   	subcc	%l2, %o4, %l3
	.word	0x2f800006	! t0_kref+0x25b0:   	fbu,a	_kref+0x25c8
	.word	0xa726e0be	! t0_kref+0x25b4:   	mulscc	%i3, 0xbe, %l3
	.word	0xf4263fe8	! t0_kref+0x25b8:   	st	%i2, [%i0 - 0x18]
	.word	0x93b48057	! t0_kref+0x25bc:   	edge8l	%l2, %l7, %o1
	.word	0xa204c01b	! t0_kref+0x25c0:   	add	%l3, %i3, %l1
	.word	0x8143c000	! t0_kref+0x25c4:   	stbar
	.word	0x9de3bfa0	! t0_kref+0x25c8:   	save	%sp, -0x60, %sp
	.word	0x91ef001b	! t0_kref+0x25cc:   	restore	%i4, %i3, %o0
	.word	0xaba0052e	! t0_kref+0x25d0:   	fsqrts	%f14, %f21
	.word	0xab40c000	! t0_kref+0x25d4:   	mov	%asi, %l5
	.word	0xbba000ae	! t0_kref+0x25d8:   	fnegs	%f14, %f29
	.word	0x81d83ada	! t0_kref+0x25dc:   	flush	%g0 - 0x526
	.word	0xaafa801b	! t0_kref+0x25e0:   	sdivcc	%o2, %i3, %l5
	.word	0x3c480005	! t0_kref+0x25e4:   	bpos,a,pt	%icc, _kref+0x25f8
	.word	0xa5400000	! t0_kref+0x25e8:   	mov	%y, %l2
	.word	0x9db44c73	! t0_kref+0x25ec:   	fnors	%f17, %f19, %f14
	.word	0x940cc016	! t0_kref+0x25f0:   	and	%l3, %l6, %o2
	.word	0xaafc8012	! t0_kref+0x25f4:   	sdivcc	%l2, %l2, %l5
	.word	0x2e480008	! t0_kref+0x25f8:   	bvs,a,pt	%icc, _kref+0x2618
	.word	0xf91fbc48	! t0_kref+0x25fc:   	ldd	[%fp - 0x3b8], %f28
	.word	0xa6f6f26c	! t0_kref+0x2600:   	udivcc	%i3, -0xd94, %l3
	.word	0xe6fe2018	! t0_kref+0x2604:   	swapa	[%i0 + 0x18]%asi, %l3
	.word	0x9da0053f	! t0_kref+0x2608:   	fsqrts	%f31, %f14
	.word	0xd82e6014	! t0_kref+0x260c:   	stb	%o4, [%i1 + 0x14]
	.word	0xa85eb41c	! t0_kref+0x2610:   	smul	%i2, -0xbe4, %l4
	.word	0x92703bac	! t0_kref+0x2614:   	udiv	%g0, -0x454, %o1
	.word	0xa5b24055	! t0_kref+0x2618:   	edge8l	%o1, %l5, %l2
	.word	0xa9a7cd2f	! t0_kref+0x261c:   	fsmuld	%f31, %f15, %f20
	.word	0xa5a38954	! t0_kref+0x2620:   	fmuld	%f14, %f20, %f18
	.word	0xc3ee1016	! t0_kref+0x2624:   	prefetcha	%i0 + %l6, 1
	.word	0xe04e3fe3	! t0_kref+0x2628:   	ldsb	[%i0 - 0x1d], %l0
	.word	0x23800004	! t0_kref+0x262c:   	fbne,a	_kref+0x263c
	.word	0xa61a4016	! t0_kref+0x2630:   	xor	%o1, %l6, %l3
	.word	0xa5b68070	! t0_kref+0x2634:   	edge8ln	%i2, %l0, %l2
	.word	0x3a480001	! t0_kref+0x2638:   	bcc,a,pt	%icc, _kref+0x263c
	.word	0xa0fcef17	! t0_kref+0x263c:   	sdivcc	%l3, 0xf17, %l0
	.word	0xf51e3fe0	! t0_kref+0x2640:   	ldd	[%i0 - 0x20], %f26
	.word	0x26800003	! t0_kref+0x2644:   	bl,a	_kref+0x2650
	.word	0xadb78912	! t0_kref+0x2648:   	faligndata	%f30, %f18, %f22
	.word	0xfbee501b	! t0_kref+0x264c:   	prefetcha	%i1 + %i3, 29
	.word	0xb9a01891	! t0_kref+0x2650:   	fitos	%f17, %f28
	.word	0x92ab400a	! t0_kref+0x2654:   	andncc	%o5, %o2, %o1
	.word	0x942537de	! t0_kref+0x2658:   	sub	%l4, -0x822, %o2
	.word	0xec6e601f	! t0_kref+0x265c:   	ldstub	[%i1 + 0x1f], %l6
	.word	0xa81ae226	! t0_kref+0x2660:   	xor	%o3, 0x226, %l4
	.word	0xaf183b91	! t0_kref+0x2664:   	tsubcctv	%g0, -0x46f, %l7
	.word	0xbfa01a58	! t0_kref+0x2668:   	fdtoi	%f24, %f31
	.word	0x24800007	! t0_kref+0x266c:   	ble,a	_kref+0x2688
	.word	0xe51e3ff0	! t0_kref+0x2670:   	ldd	[%i0 - 0x10], %f18
	.word	0x81ad4ab9	! t0_kref+0x2674:   	fcmpes	%fcc0, %f21, %f25
	.word	0xf1ee501d	! t0_kref+0x2678:   	prefetcha	%i1 + %i5, 24
	.word	0x93b3001a	! t0_kref+0x267c:   	edge8	%o4, %i2, %o1
	.word	0x949f001c	! t0_kref+0x2680:   	xorcc	%i4, %i4, %o2
	.word	0x81ae8aae	! t0_kref+0x2684:   	fcmpes	%fcc0, %f26, %f14
	.word	0xe0263ff8	! t0_kref+0x2688:   	st	%l0, [%i0 - 8]
	.word	0xea680018	! t0_kref+0x268c:   	ldstub	[%g0 + %i0], %l5
	.word	0xa3b5c0f7	! t0_kref+0x2690:   	edge16ln	%l7, %l7, %l1
	.word	0xb3b4cd60	! t0_kref+0x2694:   	fnot1s	%f19, %f25
	.word	0xc807bff0	! t0_kref+0x2698:   	ld	[%fp - 0x10], %g4
	.word	0xc0fe3fe8	! t0_kref+0x269c:   	swapa	[%i0 - 0x18]%asi, %g0
	.word	0xee6e6014	! t0_kref+0x26a0:   	ldstub	[%i1 + 0x14], %l7
	.word	0x945c0013	! t0_kref+0x26a4:   	smul	%l0, %l3, %o2
	.word	0x9ba00131	! t0_kref+0x26a8:   	fabss	%f17, %f13
	.word	0x9fa7c8b1	! t0_kref+0x26ac:   	fsubs	%f31, %f17, %f15
	.word	0x8143e040	! t0_kref+0x26b0:   	membar	0x40
	.word	0xf91e4000	! t0_kref+0x26b4:   	ldd	[%i1], %f28
	.word	0xaad5c015	! t0_kref+0x26b8:   	umulcc	%l7, %l5, %l5
	.word	0x2e480007	! t0_kref+0x26bc:   	bvs,a,pt	%icc, _kref+0x26d8
	.word	0xa9b50590	! t0_kref+0x26c0:   	fcmpgt32	%f20, %f16, %l4
	.word	0x81dc800e	! t0_kref+0x26c4:   	flush	%l2 + %sp
	.word	0x3e480008	! t0_kref+0x26c8:   	bvc,a,pt	%icc, _kref+0x26e8
	.word	0xe96e7fe8	! t0_kref+0x26cc:   	prefetch	%i1 - 0x18, 20
	.word	0xada48835	! t0_kref+0x26d0:   	fadds	%f18, %f21, %f22
	.word	0xc3ee5016	! t0_kref+0x26d4:   	prefetcha	%i1 + %l6, 1
	.word	0xa49825d2	! t0_kref+0x26d8:   	xorcc	%g0, 0x5d2, %l2
	.word	0x3c480005	! t0_kref+0x26dc:   	bpos,a,pt	%icc, _kref+0x26f0
	.word	0xd82e2015	! t0_kref+0x26e0:   	stb	%o4, [%i0 + 0x15]
	.word	0xbda0054c	! t0_kref+0x26e4:   	fsqrtd	%f12, %f30
	.word	0x20800004	! t0_kref+0x26e8:   	bn,a	_kref+0x26f8
	.word	0xa0834012	! t0_kref+0x26ec:   	addcc	%o5, %l2, %l0
	.word	0x8143c000	! t0_kref+0x26f0:   	stbar
	.word	0xea881018	! t0_kref+0x26f4:   	lduba	[%g0 + %i0]0x80, %l5
	.word	0xa1a4895c	! t0_kref+0x26f8:   	fmuld	%f18, %f28, %f16
	.word	0xd83e3fe8	! t0_kref+0x26fc:   	std	%o4, [%i0 - 0x18]
	.word	0x9db38c56	! t0_kref+0x2700:   	fnor	%f14, %f22, %f14
	.word	0x9fb00774	! t0_kref+0x2704:   	fpack16	%f20, %f15
	.word	0xda262008	! t0_kref+0x2708:   	st	%o5, [%i0 + 8]
	.word	0x9ba98032	! t0_kref+0x270c:   	fmovsg	%fcc0, %f18, %f13
	.word	0xa2f80010	! t0_kref+0x2710:   	sdivcc	%g0, %l0, %l1
	.word	0xf91e4000	! t0_kref+0x2714:   	ldd	[%i1], %f28
	.word	0xe9be5894	! t0_kref+0x2718:   	stda	%f20, [%i1 + %l4]0xc4
	.word	0x81ab4ab4	! t0_kref+0x271c:   	fcmpes	%fcc0, %f13, %f20
	.word	0xa5b44ea0	! t0_kref+0x2720:   	fsrc1s	%f17, %f18
	.word	0xe51e3ff8	! t0_kref+0x2724:   	ldd	[%i0 - 8], %f18
	.word	0xa2dcc01c	! t0_kref+0x2728:   	smulcc	%l3, %i4, %l1
	.word	0xf4266010	! t0_kref+0x272c:   	st	%i2, [%i1 + 0x10]
	.word	0xd876001d	! t0_kref+0x2730:   	stx	%o4, [%i0 + %i5]
	.word	0x922d7417	! t0_kref+0x2734:   	andn	%l5, -0xbe9, %o1
	.word	0x3e480003	! t0_kref+0x2738:   	bvc,a,pt	%icc, _kref+0x2744
	.word	0xf6a8a029	! t0_kref+0x273c:   	stba	%i3, [%g2 + 0x29]%asi
	.word	0xa5a0055a	! t0_kref+0x2740:   	fsqrtd	%f26, %f18
	.word	0xa4ad001a	! t0_kref+0x2744:   	andncc	%l4, %i2, %l2
	.word	0xb1a00552	! t0_kref+0x2748:   	fsqrtd	%f18, %f24
	call	SYM(t0_subr0)
	.word	0xa5b00776	! t0_kref+0x2750:   	fpack16	%f22, %f18
	.word	0xdf266014	! t0_kref+0x2754:   	st	%f15, [%i1 + 0x14]
	.word	0xa49cbe6a	! t0_kref+0x2758:   	xorcc	%l2, -0x196, %l2
	.word	0x91368009	! t0_kref+0x275c:   	srl	%i2, %o1, %o0
	.word	0xb7b54d60	! t0_kref+0x2760:   	fnot1s	%f21, %f27
	.word	0xac76c00b	! t0_kref+0x2764:   	udiv	%i3, %o3, %l6
	.word	0x81af0ad6	! t0_kref+0x2768:   	fcmped	%fcc0, %f28, %f22
	.word	0x9de3bfa0	! t0_kref+0x276c:   	save	%sp, -0x60, %sp
	.word	0xb08e4019	! t0_kref+0x2770:   	andcc	%i1, %i1, %i0
	.word	0x95eeaaeb	! t0_kref+0x2774:   	restore	%i2, 0xaeb, %o2
	.word	0xbda00058	! t0_kref+0x2778:   	fmovd	%f24, %f30
	.word	0xb5b70a98	! t0_kref+0x277c:   	fpsub16	%f28, %f24, %f26
	.word	0xaa823fea	! t0_kref+0x2780:   	addcc	%o0, -0x16, %l5
	.word	0xaa780010	! t0_kref+0x2784:   	sdiv	%g0, %l0, %l5
	.word	0x35800005	! t0_kref+0x2788:   	fbue,a	_kref+0x279c
	.word	0xb1b58c96	! t0_kref+0x278c:   	fandnot2	%f22, %f22, %f24
	.word	0xb5a01a34	! t0_kref+0x2790:   	fstoi	%f20, %f26
	.word	0x8186c000	! t0_kref+0x2794:   	wr	%i3, %g0, %y
	.word	0x22480002	! t0_kref+0x2798:   	be,a,pt	%icc, _kref+0x27a0
	.word	0xe2080018	! t0_kref+0x279c:   	ldub	[%g0 + %i0], %l1
	.word	0xd48e1000	! t0_kref+0x27a0:   	lduba	[%i0]0x80, %o2
	.word	0xbda00154	! t0_kref+0x27a4:   	fabsd	%f20, %f30
	.word	0xea0e8019	! t0_kref+0x27a8:   	ldub	[%i2 + %i1], %l5
	.word	0xadb00cde	! t0_kref+0x27ac:   	fnot2	%f30, %f22
	.word	0xadb48518	! t0_kref+0x27b0:   	fcmpgt16	%f18, %f24, %l6
	.word	0xfdee101d	! t0_kref+0x27b4:   	prefetcha	%i0 + %i5, 30
	.word	0xe6063fec	! t0_kref+0x27b8:   	ld	[%i0 - 0x14], %l3
	.word	0xa1b40d96	! t0_kref+0x27bc:   	fxor	%f16, %f22, %f16
	.word	0xa87df603	! t0_kref+0x27c0:   	sdiv	%l7, -0x9fd, %l4
	.word	0xa5b4c076	! t0_kref+0x27c4:   	edge8ln	%l3, %l6, %l2
	.word	0xa1408000	! t0_kref+0x27c8:   	mov	%ccr, %l0
	.word	0xb9b007ba	! t0_kref+0x27cc:   	fpackfix	%f26, %f28
	.word	0xa452800a	! t0_kref+0x27d0:   	umul	%o2, %o2, %l2
	.word	0xadb50914	! t0_kref+0x27d4:   	faligndata	%f20, %f20, %f22
	.word	0xf7060000	! t0_kref+0x27d8:   	ld	[%i0], %f27
	.word	0xadb50514	! t0_kref+0x27dc:   	fcmpgt16	%f20, %f20, %l6
	.word	0xb5b48910	! t0_kref+0x27e0:   	faligndata	%f18, %f16, %f26
	.word	0xe51e0000	! t0_kref+0x27e4:   	ldd	[%i0], %f18
	.word	0xe1264000	! t0_kref+0x27e8:   	st	%f16, [%i1]
	.word	0x81870000	! t0_kref+0x27ec:   	wr	%i4, %g0, %y
	.word	0xfd6e401a	! t0_kref+0x27f0:   	prefetch	%i1 + %i2, 30
	.word	0xe0100018	! t0_kref+0x27f4:   	lduh	[%g0 + %i0], %l0
	.word	0xa4db4017	! t0_kref+0x27f8:   	smulcc	%o5, %l7, %l2
	.word	0xd2270019	! t0_kref+0x27fc:   	st	%o1, [%i4 + %i1]
	.word	0xada00554	! t0_kref+0x2800:   	fsqrtd	%f20, %f22
	.word	0xb5a6483a	! t0_kref+0x2804:   	fadds	%f25, %f26, %f26
	.word	0x9de3bfa0	! t0_kref+0x2808:   	save	%sp, -0x60, %sp
	.word	0x810ea103	! t0_kref+0x280c:   	tsubcc	%i2, 0x103, %g0
	.word	0xa3ef4019	! t0_kref+0x2810:   	restore	%i5, %i1, %l1
	.word	0xac830017	! t0_kref+0x2814:   	addcc	%o4, %l7, %l6
	.word	0xbda00554	! t0_kref+0x2818:   	fsqrtd	%f20, %f30
	.word	0xa9a4c8bc	! t0_kref+0x281c:   	fsubs	%f19, %f28, %f20
	.word	0xa5a01031	! t0_kref+0x2820:   	fstox	%f17, %f18
	.word	0x92036bfa	! t0_kref+0x2824:   	add	%o5, 0xbfa, %o1
	.word	0x2d480003	! t0_kref+0x2828:   	fbg,a,pt	%fcc0, _kref+0x2834
	.word	0xafb5c0c0	! t0_kref+0x282c:   	edge16l	%l7, %g0, %l7
	.word	0xfd3f4018	! t0_kref+0x2830:   	std	%f30, [%i5 + %i0]
	.word	0xb1b3ce71	! t0_kref+0x2834:   	fxnors	%f15, %f17, %f24
	.word	0xd0263fe0	! t0_kref+0x2838:   	st	%o0, [%i0 - 0x20]
	.word	0x99b70f52	! t0_kref+0x283c:   	fornot1	%f28, %f18, %f12
	.word	0x90758012	! t0_kref+0x2840:   	udiv	%l6, %l2, %o0
	.word	0x2f480005	! t0_kref+0x2844:   	fbu,a,pt	%fcc0, _kref+0x2858
	.word	0xadb7caaf	! t0_kref+0x2848:   	fpsub16s	%f31, %f15, %f22
	.word	0xb9b38dd2	! t0_kref+0x284c:   	fnand	%f14, %f18, %f28
	.word	0xb1a01a5c	! t0_kref+0x2850:   	fdtoi	%f28, %f24
	.word	0xc36e6008	! t0_kref+0x2854:   	prefetch	%i1 + 8, 1
	.word	0x37480007	! t0_kref+0x2858:   	fbge,a,pt	%fcc0, _kref+0x2874
	.word	0x95034017	! t0_kref+0x285c:   	taddcc	%o5, %l7, %o2
	.word	0xada6cd3c	! t0_kref+0x2860:   	fsmuld	%f27, %f28, %f22
	.word	0x8143c000	! t0_kref+0x2864:   	stbar
	.word	0x9273401b	! t0_kref+0x2868:   	udiv	%o5, %i3, %o1
	.word	0x94dcb55a	! t0_kref+0x286c:   	smulcc	%l2, -0xaa6, %o2
	.word	0xeeee200b	! t0_kref+0x2870:   	ldstuba	[%i0 + 0xb]%asi, %l7
	.word	0xf9a0a02c	! t0_kref+0x2874:   	sta	%f28, [%g2 + 0x2c]%asi
	.word	0xaaf5800d	! t0_kref+0x2878:   	udivcc	%l6, %o5, %l5
	.word	0x86102002	! t0_kref+0x287c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x2880:   	bne,a	_kref+0x2880
	.word	0x86a0e001	! t0_kref+0x2884:   	subcc	%g3, 1, %g3
	.word	0xa3a0053a	! t0_kref+0x2888:   	fsqrts	%f26, %f17
	.word	0xee7e7fe8	! t0_kref+0x288c:   	swap	[%i1 - 0x18], %l7
	.word	0x23480006	! t0_kref+0x2890:   	fbne,a,pt	%fcc0, _kref+0x28a8
	.word	0xf6a0a024	! t0_kref+0x2894:   	sta	%i3, [%g2 + 0x24]%asi
	.word	0xae0ec00c	! t0_kref+0x2898:   	and	%i3, %o4, %l7
	.word	0xaeda800d	! t0_kref+0x289c:   	smulcc	%o2, %o5, %l7
	.word	0xf828a01c	! t0_kref+0x28a0:   	stb	%i4, [%g2 + 0x1c]
	.word	0xae5c8015	! t0_kref+0x28a4:   	smul	%l2, %l5, %l7
	.word	0x909c400a	! t0_kref+0x28a8:   	xorcc	%l1, %o2, %o0
	.word	0x25480003	! t0_kref+0x28ac:   	fblg,a,pt	%fcc0, _kref+0x28b8
	.word	0xb1a000ba	! t0_kref+0x28b0:   	fnegs	%f26, %f24
	.word	0x30480003	! t0_kref+0x28b4:   	ba,a,pt	%icc, _kref+0x28c0
	.word	0xd2680019	! t0_kref+0x28b8:   	ldstub	[%g0 + %i1], %o1
	.word	0x81580000	! t0_kref+0x28bc:   	flushw
	.word	0xb9a01a3b	! t0_kref+0x28c0:   	fstoi	%f27, %f28
	.word	0xaaadc01b	! t0_kref+0x28c4:   	andncc	%l7, %i3, %l5
	.word	0x81af8a56	! t0_kref+0x28c8:   	fcmpd	%fcc0, %f30, %f22
	.word	0xd4966004	! t0_kref+0x28cc:   	lduha	[%i1 + 4]%asi, %o2
	.word	0xbfb5ca3d	! t0_kref+0x28d0:   	fpadd16s	%f23, %f29, %f31
	.word	0xa1244015	! t0_kref+0x28d4:   	mulscc	%l1, %l5, %l0
	.word	0xe786101c	! t0_kref+0x28d8:   	lda	[%i0 + %i4]0x80, %f19
	.word	0xb5b38ad8	! t0_kref+0x28dc:   	fpsub32	%f14, %f24, %f26
	.word	0xfdee501b	! t0_kref+0x28e0:   	prefetcha	%i1 + %i3, 30
	.word	0x9fa01a50	! t0_kref+0x28e4:   	fdtoi	%f16, %f15
	.word	0xbda0054e	! t0_kref+0x28e8:   	fsqrtd	%f14, %f30
	.word	0xe968a081	! t0_kref+0x28ec:   	prefetch	%g2 + 0x81, 20
	.word	0xa418239e	! t0_kref+0x28f0:   	xor	%g0, 0x39e, %l2
	.word	0xbdb40e56	! t0_kref+0x28f4:   	fxnor	%f16, %f22, %f30
	.word	0xa67e8012	! t0_kref+0x28f8:   	sdiv	%i2, %l2, %l3
	.word	0xe6f75019	! t0_kref+0x28fc:   	stxa	%l3, [%i5 + %i1]0x80
	.word	0xd46e3fed	! t0_kref+0x2900:   	ldstub	[%i0 - 0x13], %o2
	.word	0x9405aba5	! t0_kref+0x2904:   	add	%l6, 0xba5, %o2
	.word	0xbfa7c83a	! t0_kref+0x2908:   	fadds	%f31, %f26, %f31
	.word	0xea8e9018	! t0_kref+0x290c:   	lduba	[%i2 + %i0]0x80, %l5
	.word	0xfd070018	! t0_kref+0x2910:   	ld	[%i4 + %i0], %f30
	.word	0xd03f4018	! t0_kref+0x2914:   	std	%o0, [%i5 + %i0]
	.word	0xd82e7ff9	! t0_kref+0x2918:   	stb	%o4, [%i1 - 7]
	.word	0xf428a01b	! t0_kref+0x291c:   	stb	%i2, [%g2 + 0x1b]
	.word	0xf1070019	! t0_kref+0x2920:   	ld	[%i4 + %i1], %f24
	.word	0x30480008	! t0_kref+0x2924:   	ba,a,pt	%icc, _kref+0x2944
	.word	0xea20a008	! t0_kref+0x2928:   	st	%l5, [%g2 + 8]
	.word	0xa005f0f5	! t0_kref+0x292c:   	add	%l7, -0xf0b, %l0
	.word	0x26480001	! t0_kref+0x2930:   	bl,a,pt	%icc, _kref+0x2934
	.word	0xee2e2005	! t0_kref+0x2934:   	stb	%l7, [%i0 + 5]
	.word	0xf8b0a016	! t0_kref+0x2938:   	stha	%i4, [%g2 + 0x16]%asi
	.word	0xadb40df3	! t0_kref+0x293c:   	fnands	%f16, %f19, %f22
	.word	0x21800006	! t0_kref+0x2940:   	fbn,a	_kref+0x2958
	.word	0xb9a88050	! t0_kref+0x2944:   	fmovdlg	%fcc0, %f16, %f28
	.word	0xada01a37	! t0_kref+0x2948:   	fstoi	%f23, %f22
	.word	0x85844017	! t0_kref+0x294c:   	wr	%l1, %l7, %ccr
	.word	0x11212fbe	! t0_kref+0x2950:   	sethi	%hi(0x84bef800), %o0
	.word	0x20480003	! t0_kref+0x2954:   	bn,a,pt	%icc, _kref+0x2960
	.word	0xb1a000d4	! t0_kref+0x2958:   	fnegd	%f20, %f24
	.word	0x37480004	! t0_kref+0x295c:   	fbge,a,pt	%fcc0, _kref+0x296c
	.word	0x91b40075	! t0_kref+0x2960:   	edge8ln	%l0, %l5, %o0
	.word	0x9da348b0	! t0_kref+0x2964:   	fsubs	%f13, %f16, %f14
	.word	0x900ca0ab	! t0_kref+0x2968:   	and	%l2, 0xab, %o0
	.word	0x949ef6b8	! t0_kref+0x296c:   	xorcc	%i3, -0x948, %o2
	.word	0xf13e4000	! t0_kref+0x2970:   	std	%f24, [%i1]
	.word	0xa9b70c9e	! t0_kref+0x2974:   	fandnot2	%f28, %f30, %f20
	.word	0x8143c000	! t0_kref+0x2978:   	stbar
	.word	0xf62e8019	! t0_kref+0x297c:   	stb	%i3, [%i2 + %i1]
	.word	0x99a7cd39	! t0_kref+0x2980:   	fsmuld	%f31, %f25, %f12
	.word	0x2c800007	! t0_kref+0x2984:   	bneg,a	_kref+0x29a0
	.word	0x99a0105c	! t0_kref+0x2988:   	fdtox	%f28, %f12
	.word	0xf83e2018	! t0_kref+0x298c:   	std	%i4, [%i0 + 0x18]
	.word	0xc76e6000	! t0_kref+0x2990:   	prefetch	%i1, 3
	.word	0xe4c71019	! t0_kref+0x2994:   	ldswa	[%i4 + %i1]0x80, %l2
	.word	0xf91e0000	! t0_kref+0x2998:   	ldd	[%i0], %f28
	.word	0xb9a01918	! t0_kref+0x299c:   	fitod	%f24, %f28
	.word	0xd27e201c	! t0_kref+0x29a0:   	swap	[%i0 + 0x1c], %o1
	.word	0xac046a30	! t0_kref+0x29a4:   	add	%l1, 0xa30, %l6
	.word	0xe11f4018	! t0_kref+0x29a8:   	ldd	[%i5 + %i0], %f16
	.word	0xf1871018	! t0_kref+0x29ac:   	lda	[%i4 + %i0]0x80, %f24
	.word	0x81ab0ad8	! t0_kref+0x29b0:   	fcmped	%fcc0, %f12, %f24
	.word	0x99b70dd0	! t0_kref+0x29b4:   	fnand	%f28, %f16, %f12
	.word	0x9fb00c20	! t0_kref+0x29b8:   	fzeros	%f15
	.word	0xa3a6c934	! t0_kref+0x29bc:   	fmuls	%f27, %f20, %f17
	.word	0x91b680c0	! t0_kref+0x29c0:   	edge16l	%i2, %g0, %o0
	.word	0x9da01118	! t0_kref+0x29c4:   	fxtod	%f24, %f14
	.word	0x81dce8d2	! t0_kref+0x29c8:   	flush	%l3 + 0x8d2
	.word	0xa5b28128	! t0_kref+0x29cc:   	edge32n	%o2, %o0, %l2
	call	SYM(t0_subr1)
	.word	0x273eb706	! t0_kref+0x29d4:   	sethi	%hi(0xfadc1800), %l3
	.word	0xb3a01a5a	! t0_kref+0x29d8:   	fdtoi	%f26, %f25
	call	SYM(t0_subr1)
	.word	0xa48dffc2	! t0_kref+0x29e0:   	andcc	%l7, -0x3e, %l2
	.word	0xaa54e889	! t0_kref+0x29e4:   	umul	%l3, 0x889, %l5
	.word	0x81aecab5	! t0_kref+0x29e8:   	fcmpes	%fcc0, %f27, %f21
	.word	0x81aecaae	! t0_kref+0x29ec:   	fcmpes	%fcc0, %f27, %f14
	.word	0xa005c01a	! t0_kref+0x29f0:   	add	%l7, %i2, %l0
	.word	0xa5a01896	! t0_kref+0x29f4:   	fitos	%f22, %f18
	.word	0x26480003	! t0_kref+0x29f8:   	bl,a,pt	%icc, _kref+0x2a04
	.word	0xa8642365	! t0_kref+0x29fc:   	subc	%l0, 0x365, %l4
	.word	0x29014dda	! t0_kref+0x2a00:   	sethi	%hi(0x5376800), %l4
	.word	0x9db38abd	! t0_kref+0x2a04:   	fpsub16s	%f14, %f29, %f14
	.word	0x8185c000	! t0_kref+0x2a08:   	wr	%l7, %g0, %y
	.word	0xa5a788bd	! t0_kref+0x2a0c:   	fsubs	%f30, %f29, %f18
	.word	0x9db50d1e	! t0_kref+0x2a10:   	fandnot1	%f20, %f30, %f14
	.word	0xa9a00550	! t0_kref+0x2a14:   	fsqrtd	%f16, %f20
	.word	0xaafa7669	! t0_kref+0x2a18:   	sdivcc	%o1, -0x997, %l5
	.word	0x3c480008	! t0_kref+0x2a1c:   	bpos,a,pt	%icc, _kref+0x2a3c
	.word	0xd62e7fe8	! t0_kref+0x2a20:   	stb	%o3, [%i1 - 0x18]
	.word	0x81ac4aba	! t0_kref+0x2a24:   	fcmpes	%fcc0, %f17, %f26
	.word	0xb9a6094e	! t0_kref+0x2a28:   	fmuld	%f24, %f14, %f28
	call	SYM(t0_subr2)
	.word	0xe62e001a	! t0_kref+0x2a30:   	stb	%l3, [%i0 + %i2]
	.word	0xf9060000	! t0_kref+0x2a34:   	ld	[%i0], %f28
	.word	0xd83e6018	! t0_kref+0x2a38:   	std	%o4, [%i1 + 0x18]
	.word	0xf83e2010	! t0_kref+0x2a3c:   	std	%i4, [%i0 + 0x10]
	.word	0xee6e8019	! t0_kref+0x2a40:   	ldstub	[%i2 + %i1], %l7
	.word	0x37800005	! t0_kref+0x2a44:   	fbge,a	_kref+0x2a58
	.word	0xee46200c	! t0_kref+0x2a48:   	ldsw	[%i0 + 0xc], %l7
	.word	0x81db4011	! t0_kref+0x2a4c:   	flush	%o5 + %l1
	.word	0xfd1e0000	! t0_kref+0x2a50:   	ldd	[%i0], %f30
	.word	0x8585c00b	! t0_kref+0x2a54:   	wr	%l7, %o3, %ccr
	.word	0xada00131	! t0_kref+0x2a58:   	fabss	%f17, %f22
	.word	0x81ad8a35	! t0_kref+0x2a5c:   	fcmps	%fcc0, %f22, %f21
	.word	0x2a480004	! t0_kref+0x2a60:   	bcs,a,pt	%icc, _kref+0x2a70
	.word	0xabb28160	! t0_kref+0x2a64:   	edge32ln	%o2, %g0, %l5
	.word	0x91b6c031	! t0_kref+0x2a68:   	edge8n	%i3, %l1, %o0
	.word	0xa5a70d3c	! t0_kref+0x2a6c:   	fsmuld	%f28, %f28, %f18
	.word	0xa7a000ba	! t0_kref+0x2a70:   	fnegs	%f26, %f19
	.word	0xa1b00cd6	! t0_kref+0x2a74:   	fnot2	%f22, %f16
	.word	0xfd9e501d	! t0_kref+0x2a78:   	ldda	[%i1 + %i5]0x80, %f30
	.word	0xb9b78a90	! t0_kref+0x2a7c:   	fpsub16	%f30, %f16, %f28
	.word	0xa8f6e5b6	! t0_kref+0x2a80:   	udivcc	%i3, 0x5b6, %l4
	.word	0xb9a508da	! t0_kref+0x2a84:   	fsubd	%f20, %f26, %f28
	.word	0xa2158015	! t0_kref+0x2a88:   	or	%l6, %l5, %l1
	.word	0xa1a0192d	! t0_kref+0x2a8c:   	fstod	%f13, %f16
	.word	0xec2e201f	! t0_kref+0x2a90:   	stb	%l6, [%i0 + 0x1f]
	.word	0x9de3bfa0	! t0_kref+0x2a94:   	save	%sp, -0x60, %sp
	.word	0xb106255c	! t0_kref+0x2a98:   	taddcc	%i0, 0x55c, %i0
	.word	0x91ef7b87	! t0_kref+0x2a9c:   	restore	%i5, -0x479, %o0
	.word	0xaba000ad	! t0_kref+0x2aa0:   	fnegs	%f13, %f21
	.word	0x90144010	! t0_kref+0x2aa4:   	or	%l1, %l0, %o0
	.word	0xada5894e	! t0_kref+0x2aa8:   	fmuld	%f22, %f14, %f22
	.word	0xa1b48a18	! t0_kref+0x2aac:   	fpadd16	%f18, %f24, %f16
	.word	0xe91e2000	! t0_kref+0x2ab0:   	ldd	[%i0], %f20
	call	SYM(t0_subr1)
	.word	0xda270018	! t0_kref+0x2ab8:   	st	%o5, [%i4 + %i0]
	.word	0xa21c8013	! t0_kref+0x2abc:   	xor	%l2, %l3, %l1
	.word	0x8143e040	! t0_kref+0x2ac0:   	membar	0x40
	.word	0xafb34e35	! t0_kref+0x2ac4:   	fands	%f13, %f21, %f23
	.word	0xe02e2019	! t0_kref+0x2ac8:   	stb	%l0, [%i0 + 0x19]
	.word	0xa22232e3	! t0_kref+0x2acc:   	sub	%o0, -0xd1d, %l1
	.word	0xafa0052f	! t0_kref+0x2ad0:   	fsqrts	%f15, %f23
	.word	0xa5344014	! t0_kref+0x2ad4:   	srl	%l1, %l4, %l2
	.word	0x9da0053c	! t0_kref+0x2ad8:   	fsqrts	%f28, %f14
	.word	0xe99e5a1b	! t0_kref+0x2adc:   	ldda	[%i1 + %i3]0xd0, %f20
	.word	0xa9a00034	! t0_kref+0x2ae0:   	fmovs	%f20, %f20
	.word	0xd216001b	! t0_kref+0x2ae4:   	lduh	[%i0 + %i3], %o1
	.word	0x9da0052e	! t0_kref+0x2ae8:   	fsqrts	%f14, %f14
	.word	0x27800008	! t0_kref+0x2aec:   	fbul,a	_kref+0x2b0c
	.word	0xbbb3cabe	! t0_kref+0x2af0:   	fpsub16s	%f15, %f30, %f29
	.word	0xb5a38850	! t0_kref+0x2af4:   	faddd	%f14, %f16, %f26
	.word	0x9075400c	! t0_kref+0x2af8:   	udiv	%l5, %o4, %o0
	.word	0xbdb5c63a	! t0_kref+0x2afc:   	fmul8x16	%f23, %f26, %f30
	.word	0x3a480007	! t0_kref+0x2b00:   	bcc,a,pt	%icc, _kref+0x2b1c
	.word	0xb1a01933	! t0_kref+0x2b04:   	fstod	%f19, %f24
	.word	0xa5a01899	! t0_kref+0x2b08:   	fitos	%f25, %f18
	.word	0x92730008	! t0_kref+0x2b0c:   	udiv	%o4, %o0, %o1
	.word	0xae72f22b	! t0_kref+0x2b10:   	udiv	%o3, -0xdd5, %l7
	.word	0xa9b6841e	! t0_kref+0x2b14:   	fcmple16	%f26, %f30, %l4
	.word	0xa5a688ba	! t0_kref+0x2b18:   	fsubs	%f26, %f26, %f18
	.word	0x9da388dc	! t0_kref+0x2b1c:   	fsubd	%f14, %f28, %f14
	.word	0x911d801c	! t0_kref+0x2b20:   	tsubcctv	%l6, %i4, %o0
	.word	0xa69a000c	! t0_kref+0x2b24:   	xorcc	%o0, %o4, %l3
	.word	0xe80e4000	! t0_kref+0x2b28:   	ldub	[%i1], %l4
	.word	0xb7a01a4e	! t0_kref+0x2b2c:   	fdtoi	%f14, %f27
	.word	0xa05efdc5	! t0_kref+0x2b30:   	smul	%i3, -0x23b, %l0
	.word	0x9074c015	! t0_kref+0x2b34:   	udiv	%l3, %l5, %o0
	.word	0x81854000	! t0_kref+0x2b38:   	wr	%l5, %g0, %y
	.word	0x91b70518	! t0_kref+0x2b3c:   	fcmpgt16	%f28, %f24, %o0
	.word	0xb9b00cce	! t0_kref+0x2b40:   	fnot2	%f14, %f28
	.word	0xa9408000	! t0_kref+0x2b44:   	mov	%ccr, %l4
	.word	0xaa568009	! t0_kref+0x2b48:   	umul	%i2, %o1, %l5
	.word	0xa27a4009	! t0_kref+0x2b4c:   	sdiv	%o1, %o1, %l1
	.word	0xe9070018	! t0_kref+0x2b50:   	ld	[%i4 + %i0], %f20
	.word	0xa5a0193c	! t0_kref+0x2b54:   	fstod	%f28, %f18
	.word	0x2f3d04d9	! t0_kref+0x2b58:   	sethi	%hi(0xf4136400), %l7
	.word	0x81af0ad0	! t0_kref+0x2b5c:   	fcmped	%fcc0, %f28, %f16
	.word	0xa3400000	! t0_kref+0x2b60:   	mov	%y, %l1
	.word	0x2b480004	! t0_kref+0x2b64:   	fbug,a,pt	%fcc0, _kref+0x2b74
	.word	0xbda388ad	! t0_kref+0x2b68:   	fsubs	%f14, %f13, %f30
	.word	0xa5b4c677	! t0_kref+0x2b6c:   	fmul8x16au	%f19, %f23, %f18
	.word	0x3e480002	! t0_kref+0x2b70:   	bvc,a,pt	%icc, _kref+0x2b78
	.word	0xae8aeaec	! t0_kref+0x2b74:   	andcc	%o3, 0xaec, %l7
	.word	0xbda68956	! t0_kref+0x2b78:   	fmuld	%f26, %f22, %f30
	.word	0xa6058008	! t0_kref+0x2b7c:   	add	%l6, %o0, %l3
	.word	0xa3a01a54	! t0_kref+0x2b80:   	fdtoi	%f20, %f17
	.word	0xa1b00c20	! t0_kref+0x2b84:   	fzeros	%f16
	.word	0xa1a00539	! t0_kref+0x2b88:   	fsqrts	%f25, %f16
	.word	0xe8ff1018	! t0_kref+0x2b8c:   	swapa	[%i4 + %i0]0x80, %l4
	.word	0xb5b70c5a	! t0_kref+0x2b90:   	fnor	%f28, %f26, %f26
	.word	0xbda01934	! t0_kref+0x2b94:   	fstod	%f20, %f30
	.word	0x90bcfbb3	! t0_kref+0x2b98:   	xnorcc	%l3, -0x44d, %o0
	.word	0x31480006	! t0_kref+0x2b9c:   	fba,a,pt	%fcc0, _kref+0x2bb4
	.word	0xa9b38edc	! t0_kref+0x2ba0:   	fornot2	%f14, %f28, %f20
	.word	0xe1867ffc	! t0_kref+0x2ba4:   	lda	[%i1 - 4]%asi, %f16
	.word	0xee070019	! t0_kref+0x2ba8:   	ld	[%i4 + %i1], %l7
	.word	0x8143e050	! t0_kref+0x2bac:   	membar	0x50
	.word	0xf62e401a	! t0_kref+0x2bb0:   	stb	%i3, [%i1 + %i2]
	.word	0x8143e040	! t0_kref+0x2bb4:   	membar	0x40
	.word	0xabb4c0fc	! t0_kref+0x2bb8:   	edge16ln	%l3, %i4, %l5
	.word	0x3b800004	! t0_kref+0x2bbc:   	fble,a	_kref+0x2bcc
	.word	0xa7a018d4	! t0_kref+0x2bc0:   	fdtos	%f20, %f19
	.word	0xa624f49f	! t0_kref+0x2bc4:   	sub	%l3, -0xb61, %l3
	.word	0xa87aea7c	! t0_kref+0x2bc8:   	sdiv	%o3, 0xa7c, %l4
	.word	0xb9a6cd3b	! t0_kref+0x2bcc:   	fsmuld	%f27, %f27, %f28
	.word	0x81af4a33	! t0_kref+0x2bd0:   	fcmps	%fcc0, %f29, %f19
	.word	0x81580000	! t0_kref+0x2bd4:   	flushw
	.word	0x99a4095e	! t0_kref+0x2bd8:   	fmuld	%f16, %f30, %f12
	.word	0x29093df6	! t0_kref+0x2bdc:   	sethi	%hi(0x24f7d800), %l4
	.word	0xebee501b	! t0_kref+0x2be0:   	prefetcha	%i1 + %i3, 21
	.word	0xb1b70d40	! t0_kref+0x2be4:   	fnot1	%f28, %f24
	.word	0xb7a7082d	! t0_kref+0x2be8:   	fadds	%f28, %f13, %f27
	.word	0x9fa01a4c	! t0_kref+0x2bec:   	fdtoi	%f12, %f15
	.word	0x99b40dd4	! t0_kref+0x2bf0:   	fnand	%f16, %f20, %f12
	.word	0xd02e8018	! t0_kref+0x2bf4:   	stb	%o0, [%i2 + %i0]
	.word	0xac85c015	! t0_kref+0x2bf8:   	addcc	%l7, %l5, %l6
	.word	0xa3a0189b	! t0_kref+0x2bfc:   	fitos	%f27, %f17
	.word	0x81830000	! t0_kref+0x2c00:   	wr	%o4, %g0, %y
	.word	0xaa533ba9	! t0_kref+0x2c04:   	umul	%o4, -0x457, %l5
	.word	0xd44e4000	! t0_kref+0x2c08:   	ldsb	[%i1], %o2
	.word	0xae43001b	! t0_kref+0x2c0c:   	addc	%o4, %i3, %l7
	.word	0x9fc00004	! t0_kref+0x2c10:   	call	%g0 + %g4
	.word	0x9fa0053f	! t0_kref+0x2c14:   	fsqrts	%f31, %f15
	.word	0xadb7062e	! t0_kref+0x2c18:   	fmul8x16	%f28, %f14, %f22
	.word	0xac66e495	! t0_kref+0x2c1c:   	subc	%i3, 0x495, %l6
	.word	0xfd1e7fe0	! t0_kref+0x2c20:   	ldd	[%i1 - 0x20], %f30
	.word	0x2f480004	! t0_kref+0x2c24:   	fbu,a,pt	%fcc0, _kref+0x2c34
	.word	0xea7e4000	! t0_kref+0x2c28:   	swap	[%i1], %l5
	.word	0xe99e5a1c	! t0_kref+0x2c2c:   	ldda	[%i1 + %i4]0xd0, %f20
	.word	0xa1b58335	! t0_kref+0x2c30:   	bmask	%l6, %l5, %l0
	.word	0xd2fe6004	! t0_kref+0x2c34:   	swapa	[%i1 + 4]%asi, %o1
	.word	0xa672a2ea	! t0_kref+0x2c38:   	udiv	%o2, 0x2ea, %l3
	.word	0xadb50d92	! t0_kref+0x2c3c:   	fxor	%f20, %f18, %f22
	.word	0x81da0000	! t0_kref+0x2c40:   	flush	%o0
	.word	0xa85cae4d	! t0_kref+0x2c44:   	smul	%l2, 0xe4d, %l4
	.word	0x38800007	! t0_kref+0x2c48:   	bgu,a	_kref+0x2c64
	.word	0xa5a388b0	! t0_kref+0x2c4c:   	fsubs	%f14, %f16, %f18
	.word	0xd0d6200e	! t0_kref+0x2c50:   	ldsha	[%i0 + 0xe]%asi, %o0
	.word	0x26480007	! t0_kref+0x2c54:   	bl,a,pt	%icc, _kref+0x2c70
	.word	0x9db4090c	! t0_kref+0x2c58:   	faligndata	%f16, %f12, %f14
	.word	0xb9b58e7e	! t0_kref+0x2c5c:   	fxnors	%f22, %f30, %f28
	.word	0xec300018	! t0_kref+0x2c60:   	sth	%l6, [%g0 + %i0]
	.word	0xa7b70558	! t0_kref+0x2c64:   	fcmpeq16	%f28, %f24, %l3
	.word	0xa537201b	! t0_kref+0x2c68:   	srl	%i4, 0x1b, %l2
	.word	0xa476801a	! t0_kref+0x2c6c:   	udiv	%i2, %i2, %l2
	.word	0x26800008	! t0_kref+0x2c70:   	bl,a	_kref+0x2c90
	.word	0xa82b3376	! t0_kref+0x2c74:   	andn	%o4, -0xc8a, %l4
	.word	0xb9a01a52	! t0_kref+0x2c78:   	fdtoi	%f18, %f28
	.word	0xd4a0a004	! t0_kref+0x2c7c:   	sta	%o2, [%g2 + 4]%asi
	.word	0xa8850013	! t0_kref+0x2c80:   	addcc	%l4, %l3, %l4
	.word	0xd89f5018	! t0_kref+0x2c84:   	ldda	[%i5 + %i0]0x80, %o4
	.word	0xb1a48852	! t0_kref+0x2c88:   	faddd	%f18, %f18, %f24
	.word	0xee7e3fec	! t0_kref+0x2c8c:   	swap	[%i0 - 0x14], %l7
	.word	0xd02e8018	! t0_kref+0x2c90:   	stb	%o0, [%i2 + %i0]
	.word	0xb9a00533	! t0_kref+0x2c94:   	fsqrts	%f19, %f28
	.word	0x92fa2bf0	! t0_kref+0x2c98:   	sdivcc	%o0, 0xbf0, %o1
	.word	0xafb680b1	! t0_kref+0x2c9c:   	edge16n	%i2, %l1, %l7
	.word	0xa1232d54	! t0_kref+0x2ca0:   	mulscc	%o4, 0xd54, %l0
	.word	0xfdb81019	! t0_kref+0x2ca4:   	stda	%f30, [%g0 + %i1]0x80
	.word	0xa4627e09	! t0_kref+0x2ca8:   	subc	%o1, -0x1f7, %l2
	.word	0xa41d401b	! t0_kref+0x2cac:   	xor	%l5, %i3, %l2
	.word	0x9de3bfa0	! t0_kref+0x2cb0:   	save	%sp, -0x60, %sp
	.word	0xa3ee3dd8	! t0_kref+0x2cb4:   	restore	%i0, -0x228, %l1
	.word	0xacdc7746	! t0_kref+0x2cb8:   	smulcc	%l1, -0x8ba, %l6
	.word	0x9414e019	! t0_kref+0x2cbc:   	or	%l3, 0x19, %o2
	.word	0x8143e040	! t0_kref+0x2cc0:   	membar	0x40
	.word	0x9de3bfa0	! t0_kref+0x2cc4:   	save	%sp, -0x60, %sp
	.word	0x91e820de	! t0_kref+0x2cc8:   	restore	%g0, 0xde, %o0
	.word	0xd2b0a038	! t0_kref+0x2ccc:   	stha	%o1, [%g2 + 0x38]%asi
	.word	0x3f800002	! t0_kref+0x2cd0:   	fbo,a	_kref+0x2cd8
	.word	0xfd1e6000	! t0_kref+0x2cd4:   	ldd	[%i1], %f30
	.word	0xea6e401a	! t0_kref+0x2cd8:   	ldstub	[%i1 + %i2], %l5
	.word	0xa9a0193d	! t0_kref+0x2cdc:   	fstod	%f29, %f20
	.word	0xfd062014	! t0_kref+0x2ce0:   	ld	[%i0 + 0x14], %f30
	.word	0xe0ce201f	! t0_kref+0x2ce4:   	ldsba	[%i0 + 0x1f]%asi, %l0
	.word	0x30480007	! t0_kref+0x2ce8:   	ba,a,pt	%icc, _kref+0x2d04
	.word	0xfd1e2018	! t0_kref+0x2cec:   	ldd	[%i0 + 0x18], %f30
	.word	0x3c480007	! t0_kref+0x2cf0:   	bpos,a,pt	%icc, _kref+0x2d0c
	.word	0xadb700e0	! t0_kref+0x2cf4:   	edge16ln	%i4, %g0, %l6
	.word	0x9db78ab2	! t0_kref+0x2cf8:   	fpsub16s	%f30, %f18, %f14
	.word	0x29071992	! t0_kref+0x2cfc:   	sethi	%hi(0x1c664800), %l4
	.word	0xfb06001c	! t0_kref+0x2d00:   	ld	[%i0 + %i4], %f29
	.word	0xa5b7044e	! t0_kref+0x2d04:   	fcmpne16	%f28, %f14, %l2
	.word	0x81adcab9	! t0_kref+0x2d08:   	fcmpes	%fcc0, %f23, %f25
	.word	0xe86e601c	! t0_kref+0x2d0c:   	ldstub	[%i1 + 0x1c], %l4
	.word	0xd6280018	! t0_kref+0x2d10:   	stb	%o3, [%g0 + %i0]
	.word	0x8185c000	! t0_kref+0x2d14:   	wr	%l7, %g0, %y
	call	SYM(t0_subr0)
	.word	0xa1b6c200	! t0_kref+0x2d1c:   	array8	%i3, %g0, %l0
	.word	0x92ba77f5	! t0_kref+0x2d20:   	xnorcc	%o1, -0x80b, %o1
	.word	0x22800003	! t0_kref+0x2d24:   	be,a	_kref+0x2d30
	.word	0xa854801b	! t0_kref+0x2d28:   	umul	%l2, %i3, %l4
	.word	0xec3e7ff8	! t0_kref+0x2d2c:   	std	%l6, [%i1 - 8]
	.word	0xc026600c	! t0_kref+0x2d30:   	clr	[%i1 + 0xc]
	.word	0x81abcab6	! t0_kref+0x2d34:   	fcmpes	%fcc0, %f15, %f22
	.word	0xa5b6091e	! t0_kref+0x2d38:   	faligndata	%f24, %f30, %f18
	.word	0x36480004	! t0_kref+0x2d3c:   	bge,a,pt	%icc, _kref+0x2d4c
	.word	0xa1a0105e	! t0_kref+0x2d40:   	fdtox	%f30, %f16
	.word	0x3e480007	! t0_kref+0x2d44:   	bvc,a,pt	%icc, _kref+0x2d60
	.word	0xbfb74c7b	! t0_kref+0x2d48:   	fnors	%f29, %f27, %f31
	call	SYM(t0_subr2)
	.word	0xa27ee76f	! t0_kref+0x2d50:   	sdiv	%i3, 0x76f, %l1
	.word	0xa3400000	! t0_kref+0x2d54:   	mov	%y, %l1
	.word	0xbdb00cd4	! t0_kref+0x2d58:   	fnot2	%f20, %f30
	.word	0xa05ac008	! t0_kref+0x2d5c:   	smul	%o3, %o0, %l0
	.word	0xbfa4883d	! t0_kref+0x2d60:   	fadds	%f18, %f29, %f31
	.word	0xbda00131	! t0_kref+0x2d64:   	fabss	%f17, %f30
	.word	0x32800008	! t0_kref+0x2d68:   	bne,a	_kref+0x2d88
	.word	0x13189567	! t0_kref+0x2d6c:   	sethi	%hi(0x62559c00), %o1
	.word	0xbdb40a10	! t0_kref+0x2d70:   	fpadd16	%f16, %f16, %f30
	.word	0xd2ff1018	! t0_kref+0x2d74:   	swapa	[%i4 + %i0]0x80, %o1
	.word	0xe2c01018	! t0_kref+0x2d78:   	ldswa	[%g0 + %i0]0x80, %l1
	.word	0xb1a3cd3b	! t0_kref+0x2d7c:   	fsmuld	%f15, %f27, %f24
	.word	0x91b3006b	! t0_kref+0x2d80:   	edge8ln	%o4, %o3, %o0
	.word	0x9da70d37	! t0_kref+0x2d84:   	fsmuld	%f28, %f23, %f14
	.word	0xac75bfcb	! t0_kref+0x2d88:   	udiv	%l6, -0x35, %l6
	.word	0xa9b58ece	! t0_kref+0x2d8c:   	fornot2	%f22, %f14, %f20
	.word	0xd6263fe0	! t0_kref+0x2d90:   	st	%o3, [%i0 - 0x20]
	.word	0xa5b007b6	! t0_kref+0x2d94:   	fpackfix	%f22, %f18
	.word	0xac768015	! t0_kref+0x2d98:   	udiv	%i2, %l5, %l6
	.word	0xbdb30c92	! t0_kref+0x2d9c:   	fandnot2	%f12, %f18, %f30
	.word	0xa8f27371	! t0_kref+0x2da0:   	udivcc	%o1, -0xc8f, %l4
	.word	0xada4095c	! t0_kref+0x2da4:   	fmuld	%f16, %f28, %f22
	.word	0xae1a0000	! t0_kref+0x2da8:   	xor	%o0, %g0, %l7
	.word	0xf007bfe0	! t0_kref+0x2dac:   	ld	[%fp - 0x20], %i0
	.word	0xb1a7895e	! t0_kref+0x2db0:   	fmuld	%f30, %f30, %f24
	.word	0xb9b506f8	! t0_kref+0x2db4:   	fmul8ulx16	%f20, %f24, %f28
	.word	0xe046001c	! t0_kref+0x2db8:   	ldsw	[%i0 + %i4], %l0
	.word	0xc768a04e	! t0_kref+0x2dbc:   	prefetch	%g2 + 0x4e, 3
	.word	0x9fa6092e	! t0_kref+0x2dc0:   	fmuls	%f24, %f14, %f15
	.word	0xe40e0000	! t0_kref+0x2dc4:   	ldub	[%i0], %l2
	.word	0x250bb439	! t0_kref+0x2dc8:   	sethi	%hi(0x2ed0e400), %l2
	.word	0xa225c017	! t0_kref+0x2dcc:   	sub	%l7, %l7, %l1
	.word	0x901a001b	! t0_kref+0x2dd0:   	xor	%o0, %i3, %o0
	.word	0xe9e8a040	! t0_kref+0x2dd4:   	prefetcha	%g2 + 0x40, 20
	.word	0xa80425fd	! t0_kref+0x2dd8:   	add	%l0, 0x5fd, %l4
	.word	0xe4c71019	! t0_kref+0x2ddc:   	ldswa	[%i4 + %i1]0x80, %l2
	.word	0x3c800001	! t0_kref+0x2de0:   	bpos,a	_kref+0x2de4
	.word	0xb9b00c20	! t0_kref+0x2de4:   	fzeros	%f28
	.word	0xe686600c	! t0_kref+0x2de8:   	lda	[%i1 + 0xc]%asi, %l3
	.word	0xadb40f5c	! t0_kref+0x2dec:   	fornot1	%f16, %f28, %f22
	.word	0xacdf234c	! t0_kref+0x2df0:   	smulcc	%i4, 0x34c, %l6
	.word	0x20480008	! t0_kref+0x2df4:   	bn,a,pt	%icc, _kref+0x2e14
	.word	0xa4e732f1	! t0_kref+0x2df8:   	subccc	%i4, -0xd0f, %l2
	.word	0x81ab8abb	! t0_kref+0x2dfc:   	fcmpes	%fcc0, %f14, %f27
	.word	0xe9be5813	! t0_kref+0x2e00:   	stda	%f20, [%i1 + %l3]0xc0
	.word	0xa5a00556	! t0_kref+0x2e04:   	fsqrtd	%f22, %f18
	.word	0xe20e7ffc	! t0_kref+0x2e08:   	ldub	[%i1 - 4], %l1
	.word	0xa4058015	! t0_kref+0x2e0c:   	add	%l6, %l5, %l2
	.word	0x9416e7ba	! t0_kref+0x2e10:   	or	%i3, 0x7ba, %o2
	.word	0xa1b440ed	! t0_kref+0x2e14:   	edge16ln	%l1, %o5, %l0
	.word	0xa60c4017	! t0_kref+0x2e18:   	and	%l1, %l7, %l3
	.word	0x83414000	! t0_kref+0x2e1c:   	mov	%pc, %g1
	.word	0x9fc00004	! t0_kref+0x2e20:   	call	%g0 + %g4
	.word	0xa9b68dff	! t0_kref+0x2e24:   	fnands	%f26, %f31, %f20
	.word	0xa9a3884e	! t0_kref+0x2e28:   	faddd	%f14, %f14, %f20
	.word	0xa4f54013	! t0_kref+0x2e2c:   	udivcc	%l5, %l3, %l2
	.word	0xa65b3020	! t0_kref+0x2e30:   	smul	%o4, -0xfe0, %l3
	.word	0xa1a00136	! t0_kref+0x2e34:   	fabss	%f22, %f16
	.word	0xe49e2008	! t0_kref+0x2e38:   	ldda	[%i0 + 8]%asi, %l2
	.word	0x81ae4abe	! t0_kref+0x2e3c:   	fcmpes	%fcc0, %f25, %f30
	.word	0xee4e6005	! t0_kref+0x2e40:   	ldsb	[%i1 + 5], %l7
	.word	0xf82e7ff8	! t0_kref+0x2e44:   	stb	%i4, [%i1 - 8]
	.word	0xa5b5cea0	! t0_kref+0x2e48:   	fsrc1s	%f23, %f18
	.word	0xeca0a02c	! t0_kref+0x2e4c:   	sta	%l6, [%g2 + 0x2c]%asi
	.word	0xbda0193b	! t0_kref+0x2e50:   	fstod	%f27, %f30
	.word	0xb1b7891a	! t0_kref+0x2e54:   	faligndata	%f30, %f26, %f24
	.word	0xa0183369	! t0_kref+0x2e58:   	xor	%g0, -0xc97, %l0
	.word	0x94d420be	! t0_kref+0x2e5c:   	umulcc	%l0, 0xbe, %o2
	.word	0xb1b587de	! t0_kref+0x2e60:   	pdist	%f22, %f30, %f24
	.word	0x94a02c1f	! t0_kref+0x2e64:   	subcc	%g0, 0xc1f, %o2
	.word	0x9da01914	! t0_kref+0x2e68:   	fitod	%f20, %f14
	.word	0xac1c8016	! t0_kref+0x2e6c:   	xor	%l2, %l6, %l6
	.word	0xa89a7eca	! t0_kref+0x2e70:   	xorcc	%o1, -0x136, %l4
	.word	0xadb50013	! t0_kref+0x2e74:   	edge8	%l4, %l3, %l6
	.word	0xe6300019	! t0_kref+0x2e78:   	sth	%l3, [%g0 + %i1]
	.word	0xb1a688ba	! t0_kref+0x2e7c:   	fsubs	%f26, %f26, %f24
	.word	0x91342019	! t0_kref+0x2e80:   	srl	%l0, 0x19, %o0
	.word	0xb9a00531	! t0_kref+0x2e84:   	fsqrts	%f17, %f28
	.word	0xa5a0052e	! t0_kref+0x2e88:   	fsqrts	%f14, %f18
	.word	0xa0e58014	! t0_kref+0x2e8c:   	subccc	%l6, %l4, %l0
	.word	0xadb60a98	! t0_kref+0x2e90:   	fpsub16	%f24, %f24, %f22
	.word	0x9fa648b2	! t0_kref+0x2e94:   	fsubs	%f25, %f18, %f15
	.word	0x81afcaad	! t0_kref+0x2e98:   	fcmpes	%fcc0, %f31, %f13
	.word	0xa7a01890	! t0_kref+0x2e9c:   	fitos	%f16, %f19
	.word	0x8143e040	! t0_kref+0x2ea0:   	membar	0x40
	.word	0xae152d1a	! t0_kref+0x2ea4:   	or	%l4, 0xd1a, %l7
	.word	0xa5b30edc	! t0_kref+0x2ea8:   	fornot2	%f12, %f28, %f18
	.word	0xaba01098	! t0_kref+0x2eac:   	fxtos	%f24, %f21
	.word	0xada0013d	! t0_kref+0x2eb0:   	fabss	%f29, %f22
	.word	0xada50856	! t0_kref+0x2eb4:   	faddd	%f20, %f22, %f22
	.word	0x2d480004	! t0_kref+0x2eb8:   	fbg,a,pt	%fcc0, _kref+0x2ec8
	.word	0xe8280019	! t0_kref+0x2ebc:   	stb	%l4, [%g0 + %i1]
	.word	0xd43e3fe0	! t0_kref+0x2ec0:   	std	%o2, [%i0 - 0x20]
	.word	0xadb70ad4	! t0_kref+0x2ec4:   	fpsub32	%f28, %f20, %f22
	.word	0xa2000016	! t0_kref+0x2ec8:   	add	%g0, %l6, %l1
	.word	0x3d480003	! t0_kref+0x2ecc:   	fbule,a,pt	%fcc0, _kref+0x2ed8
	.word	0xe22e2008	! t0_kref+0x2ed0:   	stb	%l1, [%i0 + 8]
	.word	0xa9b70c9c	! t0_kref+0x2ed4:   	fandnot2	%f28, %f28, %f20
	.word	0xa9408000	! t0_kref+0x2ed8:   	mov	%ccr, %l4
	.word	0xbda00558	! t0_kref+0x2edc:   	fsqrtd	%f24, %f30
	.word	0xe40e3ffd	! t0_kref+0x2ee0:   	ldub	[%i0 - 3], %l2
	.word	0x37480001	! t0_kref+0x2ee4:   	fbge,a,pt	%fcc0, _kref+0x2ee8
	.word	0xb1a38958	! t0_kref+0x2ee8:   	fmuld	%f14, %f24, %f24
	.word	0x81aeca32	! t0_kref+0x2eec:   	fcmps	%fcc0, %f27, %f18
	.word	0x9da00554	! t0_kref+0x2ef0:   	fsqrtd	%f20, %f14
	.word	0xa206800d	! t0_kref+0x2ef4:   	add	%i2, %o5, %l1
	.word	0xa428001a	! t0_kref+0x2ef8:   	andn	%g0, %i2, %l2
	.word	0x2c800007	! t0_kref+0x2efc:   	bneg,a	_kref+0x2f18
	.word	0xa9b24136	! t0_kref+0x2f00:   	edge32n	%o1, %l6, %l4
	.word	0x2d480007	! t0_kref+0x2f04:   	fbg,a,pt	%fcc0, _kref+0x2f20
	.word	0xf11e0000	! t0_kref+0x2f08:   	ldd	[%i0], %f24
	.word	0xe0a0a024	! t0_kref+0x2f0c:   	sta	%l0, [%g2 + 0x24]%asi
	.word	0xb7b60f78	! t0_kref+0x2f10:   	fornot1s	%f24, %f24, %f27
	.word	0xd0070018	! t0_kref+0x2f14:   	ld	[%i4 + %i0], %o0
	.word	0xa9a70936	! t0_kref+0x2f18:   	fmuls	%f28, %f22, %f20
	.word	0xafb38d3e	! t0_kref+0x2f1c:   	fandnot1s	%f14, %f30, %f23
	.word	0xaed34016	! t0_kref+0x2f20:   	umulcc	%o5, %l6, %l7
	.word	0xf83e401d	! t0_kref+0x2f24:   	std	%i4, [%i1 + %i5]
	.word	0x9322400d	! t0_kref+0x2f28:   	mulscc	%o1, %o5, %o1
	.word	0x81824000	! t0_kref+0x2f2c:   	wr	%o1, %g0, %y
	.word	0xb5a0054e	! t0_kref+0x2f30:   	fsqrtd	%f14, %f26
	.word	0xb5a0105e	! t0_kref+0x2f34:   	fdtox	%f30, %f26
	.word	0xda7e7fe0	! t0_kref+0x2f38:   	swap	[%i1 - 0x20], %o5
	.word	0xa7b00772	! t0_kref+0x2f3c:   	fpack16	%f18, %f19
	.word	0x27800001	! t0_kref+0x2f40:   	fbul,a	_kref+0x2f44
	.word	0xee067fec	! t0_kref+0x2f44:   	ld	[%i1 - 0x14], %l7
	.word	0xd62e6000	! t0_kref+0x2f48:   	stb	%o3, [%i1]
	.word	0xfd06001c	! t0_kref+0x2f4c:   	ld	[%i0 + %i4], %f30
	.word	0x9f414000	! t0_kref+0x2f50:   	mov	%pc, %o7
	.word	0xc807bfe4	! t0_kref+0x2f54:   	ld	[%fp - 0x1c], %g4
	.word	0xb6102014	! t0_kref+0x2f58:   	mov	0x14, %i3
	.word	0xebe6501c	! t0_kref+0x2f5c:   	casa	[%i1]0x80, %i4, %l5
	.word	0x28800001	! t0_kref+0x2f60:   	bleu,a	_kref+0x2f64
	.word	0xf4270019	! t0_kref+0x2f64:   	st	%i2, [%i4 + %i1]
	.word	0x878020f0	! t0_kref+0x2f68:   	mov	0xf0, %asi
	.word	0xa83e8014	! t0_kref+0x2f6c:   	xnor	%i2, %l4, %l4
	.word	0xa9b4ca3f	! t0_kref+0x2f70:   	fpadd16s	%f19, %f31, %f20
	.word	0x8143c000	! t0_kref+0x2f74:   	stbar
	.word	0xb5b7ca2e	! t0_kref+0x2f78:   	fpadd16s	%f31, %f14, %f26
	.word	0xbda01936	! t0_kref+0x2f7c:   	fstod	%f22, %f30
	.word	0xa7b007bc	! t0_kref+0x2f80:   	fpackfix	%f28, %f19
	.word	0x81858000	! t0_kref+0x2f84:   	wr	%l6, %g0, %y
	.word	0x907d4017	! t0_kref+0x2f88:   	sdiv	%l5, %l7, %o0
	call	SYM(t0_subr3)
	.word	0xaa9c800d	! t0_kref+0x2f90:   	xorcc	%l2, %o5, %l5
	.word	0x9fa01a3d	! t0_kref+0x2f94:   	fstoi	%f29, %f15
	.word	0x9de3bfa0	! t0_kref+0x2f98:   	save	%sp, -0x60, %sp
	.word	0xa9ee21be	! t0_kref+0x2f9c:   	restore	%i0, 0x1be, %l4
	call	SYM(t0_subr0)
	.word	0x81ddc013	! t0_kref+0x2fa4:   	flush	%l7 + %l3
	.word	0xe016c018	! t0_kref+0x2fa8:   	lduh	[%i3 + %i0], %l0
	.word	0x86102002	! t0_kref+0x2fac:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x2fb0:   	bne,a	_kref+0x2fb0
	.word	0x86a0e001	! t0_kref+0x2fb4:   	subcc	%g3, 1, %g3
	.word	0x947c001a	! t0_kref+0x2fb8:   	sdiv	%l0, %i2, %o2
	.word	0xa7b28280	! t0_kref+0x2fbc:   	array32	%o2, %g0, %l3
	.word	0x35800004	! t0_kref+0x2fc0:   	fbue,a	_kref+0x2fd0
	.word	0xe6262018	! t0_kref+0x2fc4:   	st	%l3, [%i0 + 0x18]
	.word	0xa41cb0dc	! t0_kref+0x2fc8:   	xor	%l2, -0xf24, %l2
	.word	0xdd063ff0	! t0_kref+0x2fcc:   	ld	[%i0 - 0x10], %f14
	.word	0x9da0013f	! t0_kref+0x2fd0:   	fabss	%f31, %f14
	.word	0x94f54010	! t0_kref+0x2fd4:   	udivcc	%l5, %l0, %o2
	.word	0xee0e6006	! t0_kref+0x2fd8:   	ldub	[%i1 + 6], %l7
	.word	0x8143e040	! t0_kref+0x2fdc:   	membar	0x40
	.word	0xe0680018	! t0_kref+0x2fe0:   	ldstub	[%g0 + %i0], %l0
	.word	0x81800000	! t0_kref+0x2fe4:   	mov	%g0, %y
	.word	0xb9a00550	! t0_kref+0x2fe8:   	fsqrtd	%f16, %f28
	.word	0x933d4014	! t0_kref+0x2fec:   	sra	%l5, %l4, %o1
	.word	0xe630a000	! t0_kref+0x2ff0:   	sth	%l3, [%g2]
	.word	0xaa5f23dd	! t0_kref+0x2ff4:   	smul	%i4, 0x3dd, %l5
	.word	0xda36201a	! t0_kref+0x2ff8:   	sth	%o5, [%i0 + 0x1a]
	.word	0x927c001c	! t0_kref+0x2ffc:   	sdiv	%l0, %i4, %o1
	.word	0x92dde702	! t0_kref+0x3000:   	smulcc	%l7, 0x702, %o1
	.word	0x922ec015	! t0_kref+0x3004:   	andn	%i3, %l5, %o1
	.word	0x81834000	! t0_kref+0x3008:   	wr	%o5, %g0, %y
	.word	0xd0164000	! t0_kref+0x300c:   	lduh	[%i1], %o0
	.word	0xa4d00011	! t0_kref+0x3010:   	umulcc	%g0, %l1, %l2
	.word	0x3d480007	! t0_kref+0x3014:   	fbule,a,pt	%fcc0, _kref+0x3030
	.word	0xa8d37b11	! t0_kref+0x3018:   	umulcc	%o5, -0x4ef, %l4
	.word	0xa3400000	! t0_kref+0x301c:   	mov	%y, %l1
	.word	0xe9be1a1d	! t0_kref+0x3020:   	stda	%f20, [%i0 + %i5]0xd0
	.word	0xa5b30169	! t0_kref+0x3024:   	edge32ln	%o4, %o1, %l2
	.word	0xa80dc009	! t0_kref+0x3028:   	and	%l7, %o1, %l4
	.word	0xacda0012	! t0_kref+0x302c:   	smulcc	%o0, %l2, %l6
	.word	0xe8360000	! t0_kref+0x3030:   	sth	%l4, [%i0]
	.word	0x34480002	! t0_kref+0x3034:   	bg,a,pt	%icc, _kref+0x303c
	.word	0xad3b6001	! t0_kref+0x3038:   	sra	%o5, 0x1, %l6
	.word	0xc5ee5017	! t0_kref+0x303c:   	prefetcha	%i1 + %l7, 2
	.word	0xe8100018	! t0_kref+0x3040:   	lduh	[%g0 + %i0], %l4
	.word	0xac1b0017	! t0_kref+0x3044:   	xor	%o4, %l7, %l6
	.word	0xb9a01910	! t0_kref+0x3048:   	fitod	%f16, %f28
	.word	0xeb68a082	! t0_kref+0x304c:   	prefetch	%g2 + 0x82, 21
	.word	0x9367a716	! t0_kref+0x3050:   	movpos	%icc, -0xea, %o1
	.word	0x35480005	! t0_kref+0x3054:   	fbue,a,pt	%fcc0, _kref+0x3068
	.word	0xe5063ff4	! t0_kref+0x3058:   	ld	[%i0 - 0xc], %f18
	.word	0xf6267fe4	! t0_kref+0x305c:   	st	%i3, [%i1 - 0x1c]
	.word	0xa4030010	! t0_kref+0x3060:   	add	%o4, %l0, %l2
	.word	0xa7400000	! t0_kref+0x3064:   	mov	%y, %l3
	.word	0xa1a60d39	! t0_kref+0x3068:   	fsmuld	%f24, %f25, %f16
	.word	0xa1a0193e	! t0_kref+0x306c:   	fstod	%f30, %f16
	.word	0xa1b5404a	! t0_kref+0x3070:   	edge8l	%l5, %o2, %l0
	.word	0x81ab0a54	! t0_kref+0x3074:   	fcmpd	%fcc0, %f12, %f20
	.word	0x9da74835	! t0_kref+0x3078:   	fadds	%f29, %f21, %f14
	.word	0x2a480006	! t0_kref+0x307c:   	bcs,a,pt	%icc, _kref+0x3094
	.word	0x920c000c	! t0_kref+0x3080:   	and	%l0, %o4, %o1
	.word	0xd82e3fe0	! t0_kref+0x3084:   	stb	%o4, [%i0 - 0x20]
	.word	0xa89b2264	! t0_kref+0x3088:   	xorcc	%o4, 0x264, %l4
	.word	0x9da0190f	! t0_kref+0x308c:   	fitod	%f15, %f14
	.word	0xeb067ff4	! t0_kref+0x3090:   	ld	[%i1 - 0xc], %f21
	call	SYM(t0_subr2)
	.word	0xb1a0103d	! t0_kref+0x3098:   	fstox	%f29, %f24
	.word	0x91b34133	! t0_kref+0x309c:   	edge32n	%o5, %l3, %o0
	.word	0xa2020000	! t0_kref+0x30a0:   	add	%o0, %g0, %l1
	.word	0xada01a3d	! t0_kref+0x30a4:   	fstoi	%f29, %f22
	.word	0xa49f0010	! t0_kref+0x30a8:   	xorcc	%i4, %l0, %l2
	.word	0xd226001c	! t0_kref+0x30ac:   	st	%o1, [%i0 + %i4]
	.word	0x8d852179	! t0_kref+0x30b0:   	wr	%l4, 0x179, %fprs
	.word	0xbfa6c834	! t0_kref+0x30b4:   	fadds	%f27, %f20, %f31
	.word	0xea96d018	! t0_kref+0x30b8:   	lduha	[%i3 + %i0]0x80, %l5
	.word	0xa9b54174	! t0_kref+0x30bc:   	edge32ln	%l5, %l4, %l4
	.word	0xa9b5091e	! t0_kref+0x30c0:   	faligndata	%f20, %f30, %f20
	.word	0xaedc401a	! t0_kref+0x30c4:   	smulcc	%l1, %i2, %l7
	.word	0x9014c01c	! t0_kref+0x30c8:   	or	%l3, %i4, %o0
	.word	0xa9b28056	! t0_kref+0x30cc:   	edge8l	%o2, %l6, %l4
	.word	0xfb000018	! t0_kref+0x30d0:   	ld	[%g0 + %i0], %f29
	.word	0xa9b58a0c	! t0_kref+0x30d4:   	fpadd16	%f22, %f12, %f20
	.word	0x3e480006	! t0_kref+0x30d8:   	bvc,a,pt	%icc, _kref+0x30f0
	.word	0x81da0000	! t0_kref+0x30dc:   	flush	%o0
	.word	0x34800001	! t0_kref+0x30e0:   	bg,a	_kref+0x30e4
	.word	0xb1a7cd3f	! t0_kref+0x30e4:   	fsmuld	%f31, %f31, %f24
	.word	0xa65cf79f	! t0_kref+0x30e8:   	smul	%l3, -0x861, %l3
	.word	0xb5a01931	! t0_kref+0x30ec:   	fstod	%f17, %f26
	.word	0x929835aa	! t0_kref+0x30f0:   	xorcc	%g0, -0xa56, %o1
	.word	0x99b48ed0	! t0_kref+0x30f4:   	fornot2	%f18, %f16, %f12
	.word	0x90dd8017	! t0_kref+0x30f8:   	smulcc	%l6, %l7, %o0
	.word	0xb9b58f4c	! t0_kref+0x30fc:   	fornot1	%f22, %f12, %f28
	.word	0x9da00533	! t0_kref+0x3100:   	fsqrts	%f19, %f14
	.word	0xa340c000	! t0_kref+0x3104:   	mov	%asi, %l1
	.word	0xa9a6084e	! t0_kref+0x3108:   	faddd	%f24, %f14, %f20
	.word	0x34480008	! t0_kref+0x310c:   	bg,a,pt	%icc, _kref+0x312c
	.word	0xbfa01a32	! t0_kref+0x3110:   	fstoi	%f18, %f31
	.word	0x81ad8a2d	! t0_kref+0x3114:   	fcmps	%fcc0, %f22, %f13
!	.word	0x34824bb8	! t0_kref+0x3118:   	bg,a	SYM(t0_subr1)
	   	bg,a	SYM(t0_subr1)
	.word	0x9e0062fc	! t0_kref+0x311c:   	add	%g1, 0x2fc, %o7
	.word	0x81da7814	! t0_kref+0x3120:   	flush	%o1 - 0x7ec
	.word	0xea063fec	! t0_kref+0x3124:   	ld	[%i0 - 0x14], %l5
	.word	0xeb060000	! t0_kref+0x3128:   	ld	[%i0], %f21
	.word	0x9da609d8	! t0_kref+0x312c:   	fdivd	%f24, %f24, %f14
	.word	0xd0f75019	! t0_kref+0x3130:   	stxa	%o0, [%i5 + %i1]0x80
	.word	0x37800005	! t0_kref+0x3134:   	fbge,a	_kref+0x3148
	.word	0xa5b60d40	! t0_kref+0x3138:   	fnot1	%f24, %f18
	.word	0xa012c00d	! t0_kref+0x313c:   	or	%o3, %o5, %l0
	.word	0x932ac017	! t0_kref+0x3140:   	sll	%o3, %l7, %o1
	.word	0xa9a4085e	! t0_kref+0x3144:   	faddd	%f16, %f30, %f20
	.word	0xa1a01a2e	! t0_kref+0x3148:   	fstoi	%f14, %f16
	.word	0xad27000c	! t0_kref+0x314c:   	mulscc	%i4, %o4, %l6
	.word	0xaba01a3c	! t0_kref+0x3150:   	fstoi	%f28, %f21
	.word	0xa1b00200	! t0_kref+0x3154:   	array8	%g0, %g0, %l0
	.word	0x37800005	! t0_kref+0x3158:   	fbge,a	_kref+0x316c
	.word	0xa0d0000a	! t0_kref+0x315c:   	umulcc	%g0, %o2, %l0
	.word	0xb9b68996	! t0_kref+0x3160:   	bshuffle	%f26, %f22, %f28
	.word	0xafa0053f	! t0_kref+0x3164:   	fsqrts	%f31, %f23
	.word	0x30480006	! t0_kref+0x3168:   	ba,a,pt	%icc, _kref+0x3180
	.word	0xbda0053a	! t0_kref+0x316c:   	fsqrts	%f26, %f30
	.word	0xe030a032	! t0_kref+0x3170:   	sth	%l0, [%g2 + 0x32]
	.word	0xac0cc009	! t0_kref+0x3174:   	and	%l3, %o1, %l6
	.word	0xc398a040	! t0_kref+0x3178:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xd27e0000	! t0_kref+0x317c:   	swap	[%i0], %o1
	.word	0xa1a78d3c	! t0_kref+0x3180:   	fsmuld	%f30, %f28, %f16
	.word	0xbda0193b	! t0_kref+0x3184:   	fstod	%f27, %f30
	.word	0x33480007	! t0_kref+0x3188:   	fbe,a,pt	%fcc0, _kref+0x31a4
	.word	0xaba00530	! t0_kref+0x318c:   	fsqrts	%f16, %f21
	call	SYM(t0_subr0)
	.word	0xa3a0188f	! t0_kref+0x3194:   	fitos	%f15, %f17
	.word	0xee26401c	! t0_kref+0x3198:   	st	%l7, [%i1 + %i4]
	.word	0x81580000	! t0_kref+0x319c:   	flushw
	.word	0x3d480006	! t0_kref+0x31a0:   	fbule,a,pt	%fcc0, _kref+0x31b8
	.word	0xd82e2010	! t0_kref+0x31a4:   	stb	%o4, [%i0 + 0x10]
	.word	0x20800004	! t0_kref+0x31a8:   	bn,a	_kref+0x31b8
	.word	0x9422c014	! t0_kref+0x31ac:   	sub	%o3, %l4, %o2
	.word	0xaa572a30	! t0_kref+0x31b0:   	umul	%i4, 0xa30, %l5
	.word	0x26800001	! t0_kref+0x31b4:   	bl,a	_kref+0x31b8
	.word	0xa7a01a39	! t0_kref+0x31b8:   	fstoi	%f25, %f19
	.word	0xada748af	! t0_kref+0x31bc:   	fsubs	%f29, %f15, %f22
	.word	0x26480005	! t0_kref+0x31c0:   	bl,a,pt	%icc, _kref+0x31d4
	.word	0xeac81019	! t0_kref+0x31c4:   	ldsba	[%g0 + %i1]0x80, %l5
	.word	0x31480006	! t0_kref+0x31c8:   	fba,a,pt	%fcc0, _kref+0x31e0
	.word	0x947a8014	! t0_kref+0x31cc:   	sdiv	%o2, %l4, %o2
	.word	0xef067fe4	! t0_kref+0x31d0:   	ld	[%i1 - 0x1c], %f23
	.word	0xaa548000	! t0_kref+0x31d4:   	umul	%l2, %g0, %l5
	.word	0x91036e6e	! t0_kref+0x31d8:   	taddcc	%o5, 0xe6e, %o0
	.word	0xa1b58994	! t0_kref+0x31dc:   	bshuffle	%f22, %f20, %f16
	.word	0xaba40834	! t0_kref+0x31e0:   	fadds	%f16, %f20, %f21
	.word	0xaca731c4	! t0_kref+0x31e4:   	subcc	%i4, -0xe3c, %l6
	.word	0xe87e6018	! t0_kref+0x31e8:   	swap	[%i1 + 0x18], %l4
	.word	0x2c800006	! t0_kref+0x31ec:   	bneg,a	_kref+0x3204
	.word	0xff26001c	! t0_kref+0x31f0:   	st	%f31, [%i0 + %i4]
	.word	0x81ab4ab7	! t0_kref+0x31f4:   	fcmpes	%fcc0, %f13, %f23
	.word	0xe506401c	! t0_kref+0x31f8:   	ld	[%i1 + %i4], %f18
	.word	0x9fc00004	! t0_kref+0x31fc:   	call	%g0 + %g4
	.word	0xdb20a008	! t0_kref+0x3200:   	st	%f13, [%g2 + 8]
	.word	0xb9a548af	! t0_kref+0x3204:   	fsubs	%f21, %f15, %f28
	.word	0xada01897	! t0_kref+0x3208:   	fitos	%f23, %f22
	.word	0xe036001b	! t0_kref+0x320c:   	sth	%l0, [%i0 + %i3]
	.word	0xa2a54015	! t0_kref+0x3210:   	subcc	%l5, %l5, %l1
	call	SYM(t0_subr3)
	.word	0xe47e7ff4	! t0_kref+0x3218:   	swap	[%i1 - 0xc], %l2
	.word	0xb9b48adc	! t0_kref+0x321c:   	fpsub32	%f18, %f28, %f28
	.word	0x9fa0053f	! t0_kref+0x3220:   	fsqrts	%f31, %f15
	.word	0xc807bfe8	! t0_kref+0x3224:   	ld	[%fp - 0x18], %g4
	.word	0x34480005	! t0_kref+0x3228:   	bg,a,pt	%icc, _kref+0x323c
	.word	0xa9b48918	! t0_kref+0x322c:   	faligndata	%f18, %f24, %f20
	.word	0x20480001	! t0_kref+0x3230:   	bn,a,pt	%icc, _kref+0x3234
	.word	0xac05b135	! t0_kref+0x3234:   	add	%l6, -0xecb, %l6
	.word	0xf720a014	! t0_kref+0x3238:   	st	%f27, [%g2 + 0x14]
	.word	0x9fa7483f	! t0_kref+0x323c:   	fadds	%f29, %f31, %f15
	.word	0xacd838fe	! t0_kref+0x3240:   	smulcc	%g0, -0x702, %l6
	.word	0x922a2726	! t0_kref+0x3244:   	andn	%o0, 0x726, %o1
	.word	0xb9a00552	! t0_kref+0x3248:   	fsqrtd	%f18, %f28
	.word	0x22480008	! t0_kref+0x324c:   	be,a,pt	%icc, _kref+0x326c
	.word	0xe968a009	! t0_kref+0x3250:   	prefetch	%g2 + 9, 20
	.word	0xb3a6492f	! t0_kref+0x3254:   	fmuls	%f25, %f15, %f25
	.word	0x26480004	! t0_kref+0x3258:   	bl,a,pt	%icc, _kref+0x3268
	.word	0xd01f4019	! t0_kref+0x325c:   	ldd	[%i5 + %i1], %o0
	.word	0x93b68492	! t0_kref+0x3260:   	fcmple32	%f26, %f18, %o1
	.word	0xec380019	! t0_kref+0x3264:   	std	%l6, [%g0 + %i1]
	.word	0xa0f54017	! t0_kref+0x3268:   	udivcc	%l5, %l7, %l0
	.word	0x292e76cb	! t0_kref+0x326c:   	sethi	%hi(0xb9db2c00), %l4
	.word	0xac3cc00b	! t0_kref+0x3270:   	xnor	%l3, %o3, %l6
	.word	0xbdb5899c	! t0_kref+0x3274:   	bshuffle	%f22, %f28, %f30
	.word	0x94d47518	! t0_kref+0x3278:   	umulcc	%l1, -0xae8, %o2
	.word	0xf51e2018	! t0_kref+0x327c:   	ldd	[%i0 + 0x18], %f26
	.word	0x86102001	! t0_kref+0x3280:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3284:   	bne,a	_kref+0x3284
	.word	0x86a0e001	! t0_kref+0x3288:   	subcc	%g3, 1, %g3
	.word	0x81abcabf	! t0_kref+0x328c:   	fcmpes	%fcc0, %f15, %f31
	.word	0x28800006	! t0_kref+0x3290:   	bleu,a	_kref+0x32a8
	.word	0xae5f0013	! t0_kref+0x3294:   	smul	%i4, %l3, %l7
	.word	0xd04e3ffe	! t0_kref+0x3298:   	ldsb	[%i0 - 2], %o0
	.word	0x251ad895	! t0_kref+0x329c:   	sethi	%hi(0x6b625400), %l2
	.word	0xa4bb22f3	! t0_kref+0x32a0:   	xnorcc	%o4, 0x2f3, %l2
	.word	0xa2ac800b	! t0_kref+0x32a4:   	andncc	%l2, %o3, %l1
	.word	0xd07e001c	! t0_kref+0x32a8:   	swap	[%i0 + %i4], %o0
	.word	0x27480007	! t0_kref+0x32ac:   	fbul,a,pt	%fcc0, _kref+0x32c8
	.word	0xa5b44069	! t0_kref+0x32b0:   	edge8ln	%l1, %o1, %l2
	.word	0xf51e4000	! t0_kref+0x32b4:   	ldd	[%i1], %f26
	.word	0xa276800b	! t0_kref+0x32b8:   	udiv	%i2, %o3, %l1
	.word	0xa1a708b2	! t0_kref+0x32bc:   	fsubs	%f28, %f18, %f16
	.word	0xeaf65000	! t0_kref+0x32c0:   	stxa	%l5, [%i1]0x80
	.word	0xaba000be	! t0_kref+0x32c4:   	fnegs	%f30, %f21
	.word	0x85832553	! t0_kref+0x32c8:   	wr	%o4, 0x553, %ccr
	.word	0xaf253b84	! t0_kref+0x32cc:   	mulscc	%l4, -0x47c, %l7
	.word	0x9da54d2f	! t0_kref+0x32d0:   	fsmuld	%f21, %f15, %f14
	.word	0x81adcabd	! t0_kref+0x32d4:   	fcmpes	%fcc0, %f23, %f29
	.word	0xe628a02d	! t0_kref+0x32d8:   	stb	%l3, [%g2 + 0x2d]
	.word	0x3a800001	! t0_kref+0x32dc:   	bcc,a	_kref+0x32e0
	.word	0x233ee1db	! t0_kref+0x32e0:   	sethi	%hi(0xfb876c00), %l1
	.word	0xbdb007b2	! t0_kref+0x32e4:   	fpackfix	%f18, %f30
	.word	0xaad40012	! t0_kref+0x32e8:   	umulcc	%l0, %l2, %l5
	.word	0x81ac8abf	! t0_kref+0x32ec:   	fcmpes	%fcc0, %f18, %f31
	.word	0x30800003	! t0_kref+0x32f0:   	ba,a	_kref+0x32fc
	.word	0x9db587de	! t0_kref+0x32f4:   	pdist	%f22, %f30, %f14
	.word	0xa1b4cef5	! t0_kref+0x32f8:   	fornot2s	%f19, %f21, %f16
	.word	0xa9b58ad0	! t0_kref+0x32fc:   	fpsub32	%f22, %f16, %f20
	.word	0xec3e0000	! t0_kref+0x3300:   	std	%l6, [%i0]
	.word	0xb1a4884c	! t0_kref+0x3304:   	faddd	%f18, %f12, %f24
	.word	0xdf06401c	! t0_kref+0x3308:   	ld	[%i1 + %i4], %f15
	.word	0xb5b64e7f	! t0_kref+0x330c:   	fxnors	%f25, %f31, %f26
	.word	0xc07e001c	! t0_kref+0x3310:   	swap	[%i0 + %i4], %g0
	.word	0xac148009	! t0_kref+0x3314:   	or	%l2, %o1, %l6
	.word	0xa1400000	! t0_kref+0x3318:   	mov	%y, %l0
	.word	0x9db4cef7	! t0_kref+0x331c:   	fornot2s	%f19, %f23, %f14
	.word	0xa5b480cb	! t0_kref+0x3320:   	edge16l	%l2, %o3, %l2
	.word	0xc398a040	! t0_kref+0x3324:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa686f36c	! t0_kref+0x3328:   	addcc	%i3, -0xc94, %l3
	.word	0xa3b48120	! t0_kref+0x332c:   	edge32n	%l2, %g0, %l1
	.word	0xa876c013	! t0_kref+0x3330:   	udiv	%i3, %l3, %l4
	.word	0xd4080018	! t0_kref+0x3334:   	ldub	[%g0 + %i0], %o2
	.word	0xa5a0193a	! t0_kref+0x3338:   	fstod	%f26, %f18
	.word	0x923d3049	! t0_kref+0x333c:   	xnor	%l4, -0xfb7, %o1
	.word	0x81dca7cd	! t0_kref+0x3340:   	flush	%l2 + 0x7cd
	.word	0x85848015	! t0_kref+0x3344:   	wr	%l2, %l5, %ccr
	.word	0xc807bff0	! t0_kref+0x3348:   	ld	[%fp - 0x10], %g4
	.word	0xc020a008	! t0_kref+0x334c:   	clr	[%g2 + 8]
	.word	0x81d80010	! t0_kref+0x3350:   	flush	%g0 + %l0
	.word	0x81af0ab4	! t0_kref+0x3354:   	fcmpes	%fcc0, %f28, %f20
	.word	0xadb009bd	! t0_kref+0x3358:   	fexpand	%f29, %f22
	.word	0xb5a0102f	! t0_kref+0x335c:   	fstox	%f15, %f26
	.word	0xee4e4000	! t0_kref+0x3360:   	ldsb	[%i1], %l7
	.word	0x2100a71b	! t0_kref+0x3364:   	sethi	%hi(0x29c6c00), %l0
	.word	0xa01c3939	! t0_kref+0x3368:   	xor	%l0, -0x6c7, %l0
	.word	0x38480004	! t0_kref+0x336c:   	bgu,a,pt	%icc, _kref+0x337c
	.word	0xa52a2018	! t0_kref+0x3370:   	sll	%o0, 0x18, %l2
	.word	0xaa04e62a	! t0_kref+0x3374:   	add	%l3, 0x62a, %l5
	.word	0xa2873420	! t0_kref+0x3378:   	addcc	%i4, -0xbe0, %l1
	.word	0xb9b68f58	! t0_kref+0x337c:   	fornot1	%f26, %f24, %f28
	.word	0xa2748009	! t0_kref+0x3380:   	udiv	%l2, %o1, %l1
	.word	0x37480005	! t0_kref+0x3384:   	fbge,a,pt	%fcc0, _kref+0x3398
	.word	0xf306401c	! t0_kref+0x3388:   	ld	[%i1 + %i4], %f25
	.word	0xbda0013a	! t0_kref+0x338c:   	fabss	%f26, %f30
	.word	0xaa77001a	! t0_kref+0x3390:   	udiv	%i4, %i2, %l5
	.word	0xb9a448b9	! t0_kref+0x3394:   	fsubs	%f17, %f25, %f28
	.word	0xe030a02c	! t0_kref+0x3398:   	sth	%l0, [%g2 + 0x2c]
	.word	0xba103ff0	! t0_kref+0x339c:   	mov	0xfffffff0, %i5
	.word	0xae1de06b	! t0_kref+0x33a0:   	xor	%l7, 0x6b, %l7
	.word	0xa5a00556	! t0_kref+0x33a4:   	fsqrtd	%f22, %f18
	.word	0x9ba01a3e	! t0_kref+0x33a8:   	fstoi	%f30, %f13
	.word	0x94db0017	! t0_kref+0x33ac:   	smulcc	%o4, %l7, %o2
	.word	0x81dc8014	! t0_kref+0x33b0:   	flush	%l2 + %l4
	.word	0x2e480005	! t0_kref+0x33b4:   	bvs,a,pt	%icc, _kref+0x33c8
	.word	0xae0eb70a	! t0_kref+0x33b8:   	and	%i2, -0x8f6, %l7
	.word	0xa09ac000	! t0_kref+0x33bc:   	xorcc	%o3, %g0, %l0
	.word	0x81dac017	! t0_kref+0x33c0:   	flush	%o3 + %l7
	.word	0x2d800007	! t0_kref+0x33c4:   	fbg,a	_kref+0x33e0
	.word	0xb9a7cd39	! t0_kref+0x33c8:   	fsmuld	%f31, %f25, %f28
	.word	0x9da000b7	! t0_kref+0x33cc:   	fnegs	%f23, %f14
	.word	0xb9b5890e	! t0_kref+0x33d0:   	faligndata	%f22, %f14, %f28
	.word	0xf62e8019	! t0_kref+0x33d4:   	stb	%i3, [%i2 + %i1]
	.word	0x81afca36	! t0_kref+0x33d8:   	fcmps	%fcc0, %f31, %f22
	.word	0xd420a024	! t0_kref+0x33dc:   	st	%o2, [%g2 + 0x24]
	.word	0xb6103fe4	! t0_kref+0x33e0:   	mov	0xffffffe4, %i3
	.word	0x93b5c320	! t0_kref+0x33e4:   	bmask	%l7, %g0, %o1
	.word	0xada30854	! t0_kref+0x33e8:   	faddd	%f12, %f20, %f22
	.word	0xa48b2483	! t0_kref+0x33ec:   	andcc	%o4, 0x483, %l2
	.word	0xf6280018	! t0_kref+0x33f0:   	stb	%i3, [%g0 + %i0]
	.word	0xbda0111a	! t0_kref+0x33f4:   	fxtod	%f26, %f30
	call	SYM(t0_subr3)
	.word	0xc0263ff4	! t0_kref+0x33fc:   	clr	[%i0 - 0xc]
	.word	0x953b2019	! t0_kref+0x3400:   	sra	%o4, 0x19, %o2
	.word	0xfd9e101d	! t0_kref+0x3404:   	ldda	[%i0 + %i5]0x80, %f30
	.word	0xa762800d	! t0_kref+0x3408:   	movue	%fcc0, %o5, %l3
	.word	0x9da01935	! t0_kref+0x340c:   	fstod	%f21, %f14
	.word	0xd02e3fe8	! t0_kref+0x3410:   	stb	%o0, [%i0 - 0x18]
	.word	0xafa00533	! t0_kref+0x3414:   	fsqrts	%f19, %f23
	.word	0xb5a01916	! t0_kref+0x3418:   	fitod	%f22, %f26
	.word	0x93b7048e	! t0_kref+0x341c:   	fcmple32	%f28, %f14, %o1
	.word	0xd46e3ffb	! t0_kref+0x3420:   	ldstub	[%i0 - 5], %o2
	.word	0xa8528011	! t0_kref+0x3424:   	umul	%o2, %l1, %l4
	.word	0xfbee501c	! t0_kref+0x3428:   	prefetcha	%i1 + %i4, 29
	.word	0xacf2c008	! t0_kref+0x342c:   	udivcc	%o3, %o0, %l6
	.word	0xf7070019	! t0_kref+0x3430:   	ld	[%i4 + %i1], %f27
	.word	0xa3b5cef8	! t0_kref+0x3434:   	fornot2s	%f23, %f24, %f17
	.word	0xac0a7b55	! t0_kref+0x3438:   	and	%o1, -0x4ab, %l6
	.word	0xfbee501b	! t0_kref+0x343c:   	prefetcha	%i1 + %i3, 29
	.word	0x9075ab72	! t0_kref+0x3440:   	udiv	%l6, 0xb72, %o0
	.word	0xacdc3322	! t0_kref+0x3444:   	smulcc	%l0, -0xcde, %l6
	.word	0xe06e7ff6	! t0_kref+0x3448:   	ldstub	[%i1 - 0xa], %l0
	.word	0xe9be589c	! t0_kref+0x344c:   	stda	%f20, [%i1 + %i4]0xc4
	.word	0xd24e201d	! t0_kref+0x3450:   	ldsb	[%i0 + 0x1d], %o1
	.word	0xa0857131	! t0_kref+0x3454:   	addcc	%l5, -0xecf, %l0
	.word	0xc6270000	! t0_kref+0x3458:   	st	%g3, [%i4]
	.word	0x8143c000	! t0_kref+0x345c:   	stbar
	.word	0x8184c000	! t0_kref+0x3460:   	wr	%l3, %g0, %y
	.word	0xc398a040	! t0_kref+0x3464:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xd46e2018	! t0_kref+0x3468:   	ldstub	[%i0 + 0x18], %o2
	.word	0xaa9afa70	! t0_kref+0x346c:   	xorcc	%o3, -0x590, %l5
	.word	0x941cc01a	! t0_kref+0x3470:   	xor	%l3, %i2, %o2
	.word	0xaba01a56	! t0_kref+0x3474:   	fdtoi	%f22, %f21
	.word	0xaca732a4	! t0_kref+0x3478:   	subcc	%i4, -0xd5c, %l6
	.word	0xc398a040	! t0_kref+0x347c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x81ad4a36	! t0_kref+0x3480:   	fcmps	%fcc0, %f21, %f22
	.word	0x9de3bfa0	! t0_kref+0x3484:   	save	%sp, -0x60, %sp
	.word	0xb80ec01b	! t0_kref+0x3488:   	and	%i3, %i3, %i4
	.word	0xabef7739	! t0_kref+0x348c:   	restore	%i5, -0x8c7, %l5
	.word	0xae56f69b	! t0_kref+0x3490:   	umul	%i3, -0x965, %l7
	.word	0x9fb58df4	! t0_kref+0x3494:   	fnands	%f22, %f20, %f15
	.word	0xe320a00c	! t0_kref+0x3498:   	st	%f17, [%g2 + 0xc]
	.word	0x9fc00004	! t0_kref+0x349c:   	call	%g0 + %g4
	.word	0xacd2000a	! t0_kref+0x34a0:   	umulcc	%o0, %o2, %l6
	.word	0xa52b4000	! t0_kref+0x34a4:   	sll	%o5, %g0, %l2
	.word	0x9203400d	! t0_kref+0x34a8:   	add	%o5, %o5, %o1
	.word	0x8143e040	! t0_kref+0x34ac:   	membar	0x40
	call	SYM(t0_subr1)
	.word	0x9ba01899	! t0_kref+0x34b4:   	fitos	%f25, %f13
	.word	0x30480001	! t0_kref+0x34b8:   	ba,a,pt	%icc, _kref+0x34bc
	.word	0xa50d001a	! t0_kref+0x34bc:   	tsubcc	%l4, %i2, %l2
	.word	0xa202c014	! t0_kref+0x34c0:   	add	%o3, %l4, %l1
	.word	0x9da01a5a	! t0_kref+0x34c4:   	fdtoi	%f26, %f14
	.word	0xa42a2fc3	! t0_kref+0x34c8:   	andn	%o0, 0xfc3, %l2
	.word	0xef68a00a	! t0_kref+0x34cc:   	prefetch	%g2 + 0xa, 23
	.word	0xa80c6df9	! t0_kref+0x34d0:   	and	%l1, 0xdf9, %l4
	.word	0xbdb009ad	! t0_kref+0x34d4:   	fexpand	%f13, %f30
	.word	0xd0162004	! t0_kref+0x34d8:   	lduh	[%i0 + 4], %o0
	.word	0xb1a50d2f	! t0_kref+0x34dc:   	fsmuld	%f20, %f15, %f24
	.word	0xd9be5848	! t0_kref+0x34e0:   	stda	%f12, [%i1 + %o0]0xc2
	.word	0xd20e7fe2	! t0_kref+0x34e4:   	ldub	[%i1 - 0x1e], %o1
	.word	0x81d973ce	! t0_kref+0x34e8:   	flush	%g5 - 0xc32
	.word	0xb5a00135	! t0_kref+0x34ec:   	fabss	%f21, %f26
	.word	0xda360000	! t0_kref+0x34f0:   	sth	%o5, [%i0]
	.word	0xa8f23d42	! t0_kref+0x34f4:   	udivcc	%o0, -0x2be, %l4
	.word	0xada6085c	! t0_kref+0x34f8:   	faddd	%f24, %f28, %f22
	.word	0x86102015	! t0_kref+0x34fc:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x3500:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x3504:   	be,a	_kref+0x3510
	.word	0xa27dc008	! t0_kref+0x3508:   	sdiv	%l7, %o0, %l1
	.word	0xf1be588b	! t0_kref+0x350c:   	stda	%f24, [%i1 + %o3]0xc4
	.word	0xbba00138	! t0_kref+0x3510:   	fabss	%f24, %f29
	.word	0xe8c01018	! t0_kref+0x3514:   	ldswa	[%g0 + %i0]0x80, %l4
	.word	0x81af0ab0	! t0_kref+0x3518:   	fcmpes	%fcc0, %f28, %f16
	.word	0xb9a01938	! t0_kref+0x351c:   	fstod	%f24, %f28
	.word	0xe828a031	! t0_kref+0x3520:   	stb	%l4, [%g2 + 0x31]
	.word	0x9fc00004	! t0_kref+0x3524:   	call	%g0 + %g4
	.word	0x90aac01c	! t0_kref+0x3528:   	andncc	%o3, %i4, %o0
	.word	0xa5a38952	! t0_kref+0x352c:   	fmuld	%f14, %f18, %f18
	.word	0xa8fa000d	! t0_kref+0x3530:   	sdivcc	%o0, %o5, %l4
	.word	0xbda018d6	! t0_kref+0x3534:   	fdtos	%f22, %f30
	.word	0x81580000	! t0_kref+0x3538:   	flushw
	.word	0xbda01a4c	! t0_kref+0x353c:   	fdtoi	%f12, %f30
	call	SYM(t0_subr0)
	.word	0xf96e401c	! t0_kref+0x3544:   	prefetch	%i1 + %i4, 28
	.word	0x81ac0ab8	! t0_kref+0x3548:   	fcmpes	%fcc0, %f16, %f24
	.word	0xab25c00b	! t0_kref+0x354c:   	mulscc	%l7, %o3, %l5
	.word	0x81ad4a34	! t0_kref+0x3550:   	fcmps	%fcc0, %f21, %f20
	.word	0x94747499	! t0_kref+0x3554:   	udiv	%l1, -0xb67, %o2
	.word	0xb3a00535	! t0_kref+0x3558:   	fsqrts	%f21, %f25
	.word	0x3f800001	! t0_kref+0x355c:   	fbo,a	_kref+0x3560
	.word	0x81b01024	! t0_kref+0x3560:   	siam	0x4
	.word	0x21800005	! t0_kref+0x3564:   	fbn,a	_kref+0x3578
	.word	0x81df001c	! t0_kref+0x3568:   	flush	%i4 + %i4
	.word	0xf53e2018	! t0_kref+0x356c:   	std	%f26, [%i0 + 0x18]
	.word	0xac340009	! t0_kref+0x3570:   	orn	%l0, %o1, %l6
	.word	0xe5180018	! t0_kref+0x3574:   	ldd	[%g0 + %i0], %f18
	.word	0x9de3bfa0	! t0_kref+0x3578:   	save	%sp, -0x60, %sp
	.word	0x91ef6e23	! t0_kref+0x357c:   	restore	%i5, 0xe23, %o0
	.word	0xa1a0055e	! t0_kref+0x3580:   	fsqrtd	%f30, %f16
	.word	0x9fc10000	! t0_kref+0x3584:   	call	%g4
	.word	0xec26401c	! t0_kref+0x3588:   	st	%l6, [%i1 + %i4]
	.word	0xa6e4c00b	! t0_kref+0x358c:   	subccc	%l3, %o3, %l3
	.word	0xe87e3ff0	! t0_kref+0x3590:   	swap	[%i0 - 0x10], %l4
	.word	0xe9064000	! t0_kref+0x3594:   	ld	[%i1], %f20
	.word	0xa4fdb5a3	! t0_kref+0x3598:   	sdivcc	%l6, -0xa5d, %l2
	.word	0xf5270019	! t0_kref+0x359c:   	st	%f26, [%i4 + %i1]
	.word	0xa40d7507	! t0_kref+0x35a0:   	and	%l5, -0xaf9, %l2
	.word	0xa5a00137	! t0_kref+0x35a4:   	fabss	%f23, %f18
	.word	0xe7270018	! t0_kref+0x35a8:   	st	%f19, [%i4 + %i0]
	.word	0xe7067fe0	! t0_kref+0x35ac:   	ld	[%i1 - 0x20], %f19
	.word	0xfd1e7fe0	! t0_kref+0x35b0:   	ldd	[%i1 - 0x20], %f30
	.word	0x9da0054c	! t0_kref+0x35b4:   	fsqrtd	%f12, %f14
	.word	0x2f800008	! t0_kref+0x35b8:   	fbu,a	_kref+0x35d8
	.word	0xe20e0000	! t0_kref+0x35bc:   	ldub	[%i0], %l1
	.word	0x1309e50e	! t0_kref+0x35c0:   	sethi	%hi(0x27943800), %o1
	.word	0x90a6a893	! t0_kref+0x35c4:   	subcc	%i2, 0x893, %o0
	.word	0x81afca31	! t0_kref+0x35c8:   	fcmps	%fcc0, %f31, %f17
	.word	0xd0480019	! t0_kref+0x35cc:   	ldsb	[%g0 + %i1], %o0
	.word	0x3a480008	! t0_kref+0x35d0:   	bcc,a,pt	%icc, _kref+0x35f0
	.word	0xa2557dec	! t0_kref+0x35d4:   	umul	%l5, -0x214, %l1
	.word	0xa5a01890	! t0_kref+0x35d8:   	fitos	%f16, %f18
	.word	0xa6aab5d2	! t0_kref+0x35dc:   	andncc	%o2, -0xa2e, %l3
	.word	0x9da00556	! t0_kref+0x35e0:   	fsqrtd	%f22, %f14
	.word	0xbfb00cfe	! t0_kref+0x35e4:   	fnot2s	%f30, %f31
	.word	0x30480006	! t0_kref+0x35e8:   	ba,a,pt	%icc, _kref+0x3600
	.word	0xb5a588b5	! t0_kref+0x35ec:   	fsubs	%f22, %f21, %f26
	.word	0xada708b6	! t0_kref+0x35f0:   	fsubs	%f28, %f22, %f22
	.word	0xe4270019	! t0_kref+0x35f4:   	st	%l2, [%i4 + %i1]
	.word	0xa2f3400b	! t0_kref+0x35f8:   	udivcc	%o5, %o3, %l1
	.word	0xeb68a040	! t0_kref+0x35fc:   	prefetch	%g2 + 0x40, 21
	.word	0xb1a01910	! t0_kref+0x3600:   	fitod	%f16, %f24
	.word	0xa7b00017	! t0_kref+0x3604:   	edge8	%g0, %l7, %l3
	.word	0xa5a4cd38	! t0_kref+0x3608:   	fsmuld	%f19, %f24, %f18
	.word	0xae76b6e6	! t0_kref+0x360c:   	udiv	%i2, -0x91a, %l7
	.word	0x95400000	! t0_kref+0x3610:   	mov	%y, %o2
	.word	0xae87000b	! t0_kref+0x3614:   	addcc	%i4, %o3, %l7
	.word	0xeb6e7ff0	! t0_kref+0x3618:   	prefetch	%i1 - 0x10, 21
	.word	0xaf234011	! t0_kref+0x361c:   	mulscc	%o5, %l1, %l7
	.word	0xa2840017	! t0_kref+0x3620:   	addcc	%l0, %l7, %l1
	.word	0xe2066004	! t0_kref+0x3624:   	ld	[%i1 + 4], %l1
	.word	0xa69de6fc	! t0_kref+0x3628:   	xorcc	%l7, 0x6fc, %l3
	.word	0x81580000	! t0_kref+0x362c:   	flushw
	.word	0x9ba0189b	! t0_kref+0x3630:   	fitos	%f27, %f13
	.word	0xd2280019	! t0_kref+0x3634:   	stb	%o1, [%g0 + %i1]
	.word	0xa2dc801a	! t0_kref+0x3638:   	smulcc	%l2, %i2, %l1
	.word	0xb9a0054e	! t0_kref+0x363c:   	fsqrtd	%f14, %f28
	.word	0x9db5ca33	! t0_kref+0x3640:   	fpadd16s	%f23, %f19, %f14
	.word	0xa5b40c58	! t0_kref+0x3644:   	fnor	%f16, %f24, %f18
	.word	0xaa06ac00	! t0_kref+0x3648:   	add	%i2, 0xc00, %l5
	.word	0xae12f0ab	! t0_kref+0x364c:   	or	%o3, -0xf55, %l7
	.word	0x21800001	! t0_kref+0x3650:   	fbn,a	_kref+0x3654
	.word	0xc56e4012	! t0_kref+0x3654:   	prefetch	%i1 + %l2, 2
	.word	0xa29d8011	! t0_kref+0x3658:   	xorcc	%l6, %l1, %l1
	.word	0x8186c000	! t0_kref+0x365c:   	wr	%i3, %g0, %y
	.word	0xbba01895	! t0_kref+0x3660:   	fitos	%f21, %f29
	.word	0x81ab8aad	! t0_kref+0x3664:   	fcmpes	%fcc0, %f14, %f13
	.word	0xa0d833c8	! t0_kref+0x3668:   	smulcc	%g0, -0xc38, %l0
	.word	0x21480004	! t0_kref+0x366c:   	fbn,a,pt	%fcc0, _kref+0x367c
	.word	0xbfb5cf79	! t0_kref+0x3670:   	fornot1s	%f23, %f25, %f31
	.word	0xa5a0188f	! t0_kref+0x3674:   	fitos	%f15, %f18
	.word	0xef68a00a	! t0_kref+0x3678:   	prefetch	%g2 + 0xa, 23
	.word	0x9ba00532	! t0_kref+0x367c:   	fsqrts	%f18, %f13
	.word	0x81ab4a2f	! t0_kref+0x3680:   	fcmps	%fcc0, %f13, %f15
	.word	0xb7a688be	! t0_kref+0x3684:   	fsubs	%f26, %f30, %f27
	.word	0xc398a080	! t0_kref+0x3688:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x2c800008	! t0_kref+0x368c:   	bneg,a	_kref+0x36ac
	.word	0xaba01895	! t0_kref+0x3690:   	fitos	%f21, %f21
	.word	0xe06e001a	! t0_kref+0x3694:   	ldstub	[%i0 + %i2], %l0
	.word	0xa3226809	! t0_kref+0x3698:   	mulscc	%o1, 0x809, %l1
	.word	0x8184c000	! t0_kref+0x369c:   	wr	%l3, %g0, %y
	.word	0x95b00280	! t0_kref+0x36a0:   	array32	%g0, %g0, %o2
	.word	0xa9b78994	! t0_kref+0x36a4:   	bshuffle	%f30, %f20, %f20
	.word	0xf51f4018	! t0_kref+0x36a8:   	ldd	[%i5 + %i0], %f26
	.word	0xbbb5ca2e	! t0_kref+0x36ac:   	fpadd16s	%f23, %f14, %f29
	.word	0x91400000	! t0_kref+0x36b0:   	mov	%y, %o0
	.word	0xaf056502	! t0_kref+0x36b4:   	taddcc	%l5, 0x502, %l7
	.word	0x81ac0ad8	! t0_kref+0x36b8:   	fcmped	%fcc0, %f16, %f24
	.word	0xaf240015	! t0_kref+0x36bc:   	mulscc	%l0, %l5, %l7
	.word	0xf43e6000	! t0_kref+0x36c0:   	std	%i2, [%i1]
	.word	0xac9a4015	! t0_kref+0x36c4:   	xorcc	%o1, %l5, %l6
	.word	0x9de3bfa0	! t0_kref+0x36c8:   	save	%sp, -0x60, %sp
	.word	0xba0e001a	! t0_kref+0x36cc:   	and	%i0, %i2, %i5
	.word	0x95eef5fe	! t0_kref+0x36d0:   	restore	%i3, -0xa02, %o2
	.word	0x9456a61d	! t0_kref+0x36d4:   	umul	%i2, 0x61d, %o2
	.word	0xe7063fec	! t0_kref+0x36d8:   	ld	[%i0 - 0x14], %f19
	.word	0x9050001c	! t0_kref+0x36dc:   	umul	%g0, %i4, %o0
	.word	0xa5a50d31	! t0_kref+0x36e0:   	fsmuld	%f20, %f17, %f18
	.word	0xbfb58f78	! t0_kref+0x36e4:   	fornot1s	%f22, %f24, %f31
	.word	0xe906600c	! t0_kref+0x36e8:   	ld	[%i1 + 0xc], %f20
	.word	0xe91fbf98	! t0_kref+0x36ec:   	ldd	[%fp - 0x68], %f20
	.word	0xaba01a38	! t0_kref+0x36f0:   	fstoi	%f24, %f21
	.word	0x37800008	! t0_kref+0x36f4:   	fbge,a	_kref+0x3714
	.word	0x81834000	! t0_kref+0x36f8:   	wr	%o5, %g0, %y
	.word	0xa4557097	! t0_kref+0x36fc:   	umul	%l5, -0xf69, %l2
	.word	0xb1a78952	! t0_kref+0x3700:   	fmuld	%f30, %f18, %f24
	.word	0xafb5cf72	! t0_kref+0x3704:   	fornot1s	%f23, %f18, %f23
	.word	0xa9a648ad	! t0_kref+0x3708:   	fsubs	%f25, %f13, %f20
	.word	0xa6d2c00a	! t0_kref+0x370c:   	umulcc	%o3, %o2, %l3
	.word	0xa5b38edc	! t0_kref+0x3710:   	fornot2	%f14, %f28, %f18
	.word	0xacf44014	! t0_kref+0x3714:   	udivcc	%l1, %l4, %l6
	.word	0xa0173bf5	! t0_kref+0x3718:   	or	%i4, -0x40b, %l0
	.word	0xd3e61012	! t0_kref+0x371c:   	casa	[%i0]0x80, %l2, %o1
	.word	0xbda38d35	! t0_kref+0x3720:   	fsmuld	%f14, %f21, %f30
	.word	0x8143e040	! t0_kref+0x3724:   	membar	0x40
	.word	0x22480004	! t0_kref+0x3728:   	be,a,pt	%icc, _kref+0x3738
	.word	0xe00e6017	! t0_kref+0x372c:   	ldub	[%i1 + 0x17], %l0
	.word	0xfb86501c	! t0_kref+0x3730:   	lda	[%i1 + %i4]0x80, %f29
	.word	0xbdb38d9e	! t0_kref+0x3734:   	fxor	%f14, %f30, %f30
	.word	0xa407000a	! t0_kref+0x3738:   	add	%i4, %o2, %l2
	.word	0xb7a0189d	! t0_kref+0x373c:   	fitos	%f29, %f27
	.word	0x923af855	! t0_kref+0x3740:   	xnor	%o3, -0x7ab, %o1
	.word	0xf1ee501a	! t0_kref+0x3744:   	prefetcha	%i1 + %i2, 24
	.word	0x81580000	! t0_kref+0x3748:   	flushw
	.word	0x2f31d0bb	! t0_kref+0x374c:   	sethi	%hi(0xc742ec00), %l7
	.word	0xe0881019	! t0_kref+0x3750:   	lduba	[%g0 + %i1]0x80, %l0
	.word	0x81ae0ab0	! t0_kref+0x3754:   	fcmpes	%fcc0, %f24, %f16
	.word	0xa6883f09	! t0_kref+0x3758:   	andcc	%g0, -0xf7, %l3
	.word	0x95b68040	! t0_kref+0x375c:   	edge8l	%i2, %g0, %o2
	.word	0xae9a7848	! t0_kref+0x3760:   	xorcc	%o1, -0x7b8, %l7
	.word	0x3a480002	! t0_kref+0x3764:   	bcc,a,pt	%icc, _kref+0x376c
	.word	0xafa0052d	! t0_kref+0x3768:   	fsqrts	%f13, %f23
	.word	0x81db0011	! t0_kref+0x376c:   	flush	%o4 + %l1
	.word	0x81af0ade	! t0_kref+0x3770:   	fcmped	%fcc0, %f28, %f30
	.word	0xa9b00f37	! t0_kref+0x3774:   	fsrc2s	%f23, %f20
	.word	0x3b480003	! t0_kref+0x3778:   	fble,a,pt	%fcc0, _kref+0x3784
	.word	0xa2070013	! t0_kref+0x377c:   	add	%i4, %l3, %l1
	.word	0xa6de8009	! t0_kref+0x3780:   	smulcc	%i2, %o1, %l3
	.word	0xc398a040	! t0_kref+0x3784:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x9da0055e	! t0_kref+0x3788:   	fsqrtd	%f30, %f14
	.word	0x99a509d2	! t0_kref+0x378c:   	fdivd	%f20, %f18, %f12
	.word	0xbda0193a	! t0_kref+0x3790:   	fstod	%f26, %f30
	.word	0x81ac0ad6	! t0_kref+0x3794:   	fcmped	%fcc0, %f16, %f22
	.word	0xa09dc008	! t0_kref+0x3798:   	xorcc	%l7, %o0, %l0
	.word	0x9486f840	! t0_kref+0x379c:   	addcc	%i3, -0x7c0, %o2
	.word	0x86102003	! t0_kref+0x37a0:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x37a4:   	bne,a	_kref+0x37a4
	.word	0x86a0e001	! t0_kref+0x37a8:   	subcc	%g3, 1, %g3
	.word	0x001fffff	! t0_kref+0x37ac:   	illtrap	0x1fffff
	.word	0x90a6e544	! t0_kref+0x37b0:   	subcc	%i3, 0x544, %o0
	.word	0xa21830be	! t0_kref+0x37b4:   	xor	%g0, -0xf42, %l1
	call	SYM(t0_subr3)
	.word	0x90d4e661	! t0_kref+0x37bc:   	umulcc	%l3, 0x661, %o0
	.word	0x28800002	! t0_kref+0x37c0:   	bleu,a	_kref+0x37c8
	.word	0xa4832633	! t0_kref+0x37c4:   	addcc	%o4, 0x633, %l2
	.word	0xec3e7ff0	! t0_kref+0x37c8:   	std	%l6, [%i1 - 0x10]
	.word	0x31800001	! t0_kref+0x37cc:   	fba,a	_kref+0x37d0
	.word	0x001fffff	! t0_kref+0x37d0:   	illtrap	0x1fffff
	.word	0xa672e456	! t0_kref+0x37d4:   	udiv	%o3, 0x456, %l3
	.word	0xa9b00c20	! t0_kref+0x37d8:   	fzeros	%f20
	.word	0x9de3bfa0	! t0_kref+0x37dc:   	save	%sp, -0x60, %sp
	.word	0x91eec019	! t0_kref+0x37e0:   	restore	%i3, %i1, %o0
	.word	0xa0f0000d	! t0_kref+0x37e4:   	udivcc	%g0, %o5, %l0
	.word	0x3f800008	! t0_kref+0x37e8:   	fbo,a	_kref+0x3808
	.word	0xa1400000	! t0_kref+0x37ec:   	mov	%y, %l0
	.word	0xa1a0012f	! t0_kref+0x37f0:   	fabss	%f15, %f16
	.word	0xe02e401a	! t0_kref+0x37f4:   	stb	%l0, [%i1 + %i2]
	.word	0xd03e6008	! t0_kref+0x37f8:   	std	%o0, [%i1 + 8]
	.word	0x94244008	! t0_kref+0x37fc:   	sub	%l1, %o0, %o2
	.word	0xa4e5e4eb	! t0_kref+0x3800:   	subccc	%l7, 0x4eb, %l2
	.word	0xb5a00554	! t0_kref+0x3804:   	fsqrtd	%f20, %f26
	.word	0xd456600a	! t0_kref+0x3808:   	ldsh	[%i1 + 0xa], %o2
	.word	0xe836c019	! t0_kref+0x380c:   	sth	%l4, [%i3 + %i1]
	.word	0xabb5cc76	! t0_kref+0x3810:   	fnors	%f23, %f22, %f21
	.word	0x9de3bfa0	! t0_kref+0x3814:   	save	%sp, -0x60, %sp
	.word	0x91ee0000	! t0_kref+0x3818:   	restore	%i0, %g0, %o0
	.word	0xf19e1a1b	! t0_kref+0x381c:   	ldda	[%i0 + %i3]0xd0, %f24
	.word	0x81abcab0	! t0_kref+0x3820:   	fcmpes	%fcc0, %f15, %f16
	call	SYM(t0_subr3)
	.word	0xe2162008	! t0_kref+0x3828:   	lduh	[%i0 + 8], %l1
	.word	0xd2060000	! t0_kref+0x382c:   	ld	[%i0], %o1
	.word	0xe9e61011	! t0_kref+0x3830:   	casa	[%i0]0x80, %l1, %l4
	.word	0xd8b61000	! t0_kref+0x3834:   	stha	%o4, [%i0]0x80
	.word	0xa1a60956	! t0_kref+0x3838:   	fmuld	%f24, %f22, %f16
	.word	0xbda01913	! t0_kref+0x383c:   	fitod	%f19, %f30
	.word	0x93b54131	! t0_kref+0x3840:   	edge32n	%l5, %l1, %o1
	.word	0xafa00132	! t0_kref+0x3844:   	fabss	%f18, %f23
	.word	0x909a0011	! t0_kref+0x3848:   	xorcc	%o0, %l1, %o0
	.word	0xada50950	! t0_kref+0x384c:   	fmuld	%f20, %f16, %f22
	.word	0xa1b6c280	! t0_kref+0x3850:   	array32	%i3, %g0, %l0
	.word	0xd2062010	! t0_kref+0x3854:   	ld	[%i0 + 0x10], %o1
	.word	0xe216001b	! t0_kref+0x3858:   	lduh	[%i0 + %i3], %l1
	.word	0xff000019	! t0_kref+0x385c:   	ld	[%g0 + %i1], %f31
	.word	0xe226401c	! t0_kref+0x3860:   	st	%l1, [%i1 + %i4]
	.word	0xc768a00d	! t0_kref+0x3864:   	prefetch	%g2 + 0xd, 3
	.word	0x9de3bfa0	! t0_kref+0x3868:   	save	%sp, -0x60, %sp
	.word	0xb83e37cb	! t0_kref+0x386c:   	xnor	%i0, -0x835, %i4
	.word	0xa5ee78db	! t0_kref+0x3870:   	restore	%i1, -0x725, %l2
	.word	0x81ad8a3d	! t0_kref+0x3874:   	fcmps	%fcc0, %f22, %f29
	.word	0xa7b6ca3d	! t0_kref+0x3878:   	fpadd16s	%f27, %f29, %f19
	.word	0xa9b3899c	! t0_kref+0x387c:   	bshuffle	%f14, %f28, %f20
	.word	0xb1a01930	! t0_kref+0x3880:   	fstod	%f16, %f24
	.word	0x81ad0ab2	! t0_kref+0x3884:   	fcmpes	%fcc0, %f20, %f18
	.word	0xa1a00132	! t0_kref+0x3888:   	fabss	%f18, %f16
	.word	0x93408000	! t0_kref+0x388c:   	mov	%ccr, %o1
	.word	0x9fc00004	! t0_kref+0x3890:   	call	%g0 + %g4
	.word	0xb1a0052f	! t0_kref+0x3894:   	fsqrts	%f15, %f24
	.word	0xa5a7cd3d	! t0_kref+0x3898:   	fsmuld	%f31, %f29, %f18
	.word	0xecdf5019	! t0_kref+0x389c:   	ldxa	[%i5 + %i1]0x80, %l6
	.word	0xe84e6018	! t0_kref+0x38a0:   	ldsb	[%i1 + 0x18], %l4
	.word	0xaba01a36	! t0_kref+0x38a4:   	fstoi	%f22, %f21
	.word	0xaf04001b	! t0_kref+0x38a8:   	taddcc	%l0, %i3, %l7
	.word	0x23480002	! t0_kref+0x38ac:   	fbne,a,pt	%fcc0, _kref+0x38b4
	.word	0xa5a6094c	! t0_kref+0x38b0:   	fmuld	%f24, %f12, %f18
	.word	0xe6267ff0	! t0_kref+0x38b4:   	st	%l3, [%i1 - 0x10]
	.word	0x90d2000a	! t0_kref+0x38b8:   	umulcc	%o0, %o2, %o0
	.word	0xe99e5a1b	! t0_kref+0x38bc:   	ldda	[%i1 + %i3]0xd0, %f20
	.word	0xaad27f62	! t0_kref+0x38c0:   	umulcc	%o1, -0x9e, %l5
	.word	0xa5a01a5a	! t0_kref+0x38c4:   	fdtoi	%f26, %f18
	.word	0xa47dc00c	! t0_kref+0x38c8:   	sdiv	%l7, %o4, %l2
	.word	0xabb24148	! t0_kref+0x38cc:   	edge32l	%o1, %o0, %l5
	.word	0xeace1000	! t0_kref+0x38d0:   	ldsba	[%i0]0x80, %l5
	.word	0xac7ac00a	! t0_kref+0x38d4:   	sdiv	%o3, %o2, %l6
	.word	0xf8bf5019	! t0_kref+0x38d8:   	stda	%i4, [%i5 + %i1]0x80
	.word	0x24480003	! t0_kref+0x38dc:   	ble,a,pt	%icc, _kref+0x38e8
	.word	0x81844000	! t0_kref+0x38e0:   	wr	%l1, %g0, %y
	.word	0xadb4c000	! t0_kref+0x38e4:   	edge8	%l3, %g0, %l6
	.word	0xab3ce016	! t0_kref+0x38e8:   	sra	%l3, 0x16, %l5
	.word	0xe896d019	! t0_kref+0x38ec:   	lduha	[%i3 + %i1]0x80, %l4
	.word	0x32480003	! t0_kref+0x38f0:   	bne,a,pt	%icc, _kref+0x38fc
	.word	0x9da00554	! t0_kref+0x38f4:   	fsqrtd	%f20, %f14
	.word	0xb1b38632	! t0_kref+0x38f8:   	fmul8x16	%f14, %f18, %f24
	.word	0x38480003	! t0_kref+0x38fc:   	bgu,a,pt	%icc, _kref+0x3908
	.word	0xb5a00534	! t0_kref+0x3900:   	fsqrts	%f20, %f26
	.word	0x81850000	! t0_kref+0x3904:   	wr	%l4, %g0, %y
	.word	0x8582c010	! t0_kref+0x3908:   	wr	%o3, %l0, %ccr
	.word	0xa52c600b	! t0_kref+0x390c:   	sll	%l1, 0xb, %l2
	.word	0xeb066000	! t0_kref+0x3910:   	ld	[%i1], %f21
	.word	0xaa1d26f9	! t0_kref+0x3914:   	xor	%l4, 0x6f9, %l5
	.word	0xb9a01a2f	! t0_kref+0x3918:   	fstoi	%f15, %f28
	.word	0xb9b38c98	! t0_kref+0x391c:   	fandnot2	%f14, %f24, %f28
	.word	0x39480008	! t0_kref+0x3920:   	fbuge,a,pt	%fcc0, _kref+0x3940
	.word	0x927ec000	! t0_kref+0x3924:   	sdiv	%i3, %g0, %o1
	.word	0xa09c4014	! t0_kref+0x3928:   	xorcc	%l1, %l4, %l0
	.word	0x94fb75ab	! t0_kref+0x392c:   	sdivcc	%o5, -0xa55, %o2
	.word	0xb3b48e7c	! t0_kref+0x3930:   	fxnors	%f18, %f28, %f25
	.word	0xae9d0016	! t0_kref+0x3934:   	xorcc	%l4, %l6, %l7
	.word	0x9fb34df0	! t0_kref+0x3938:   	fnands	%f13, %f16, %f15
	.word	0xa784c015	! t0_kref+0x393c:   	wr	%l3, %l5, %gsr
	.word	0xd5e61012	! t0_kref+0x3940:   	casa	[%i0]0x80, %l2, %o2
	.word	0x9da0111a	! t0_kref+0x3944:   	fxtod	%f26, %f14
	.word	0xa5b60ddc	! t0_kref+0x3948:   	fnand	%f24, %f28, %f18
	.word	0xf5b81018	! t0_kref+0x394c:   	stda	%f26, [%g0 + %i0]0x80
	.word	0xa8d2c013	! t0_kref+0x3950:   	umulcc	%o3, %l3, %l4
	.word	0xa80b2a2a	! t0_kref+0x3954:   	and	%o4, 0xa2a, %l4
	.word	0xf1270019	! t0_kref+0x3958:   	st	%f24, [%i4 + %i1]
	.word	0x81af4ab8	! t0_kref+0x395c:   	fcmpes	%fcc0, %f29, %f24
	.word	0x9ba748b1	! t0_kref+0x3960:   	fsubs	%f29, %f17, %f13
	.word	0x81580000	! t0_kref+0x3964:   	flushw
	.word	0xabb3001b	! t0_kref+0x3968:   	edge8	%o4, %i3, %l5
	.word	0x81da2129	! t0_kref+0x396c:   	flush	%o0 + 0x129
	.word	0xc398a040	! t0_kref+0x3970:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa7b00c20	! t0_kref+0x3974:   	fzeros	%f19
	.word	0xa3b6051a	! t0_kref+0x3978:   	fcmpgt16	%f24, %f26, %l1
	.word	0xa5b74aba	! t0_kref+0x397c:   	fpsub16s	%f29, %f26, %f18
	.word	0x3e800006	! t0_kref+0x3980:   	bvc,a	_kref+0x3998
	.word	0xa7a4c83b	! t0_kref+0x3984:   	fadds	%f19, %f27, %f19
	.word	0xa7272133	! t0_kref+0x3988:   	mulscc	%i4, 0x133, %l3
	.word	0x3b480006	! t0_kref+0x398c:   	fble,a,pt	%fcc0, _kref+0x39a4
	.word	0xa7b7859a	! t0_kref+0x3990:   	fcmpgt32	%f30, %f26, %l3
	.word	0x30480006	! t0_kref+0x3994:   	ba,a,pt	%icc, _kref+0x39ac
	.word	0xa9b5849c	! t0_kref+0x3998:   	fcmple32	%f22, %f28, %l4
	.word	0xc398a040	! t0_kref+0x399c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x8143c000	! t0_kref+0x39a0:   	stbar
	.word	0x920a8015	! t0_kref+0x39a4:   	and	%o2, %l5, %o1
	.word	0xa87f3e23	! t0_kref+0x39a8:   	sdiv	%i4, -0x1dd, %l4
	.word	0x86102002	! t0_kref+0x39ac:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x39b0:   	bne,a	_kref+0x39b0
	.word	0x86a0e001	! t0_kref+0x39b4:   	subcc	%g3, 1, %g3
	.word	0xa5a58831	! t0_kref+0x39b8:   	fadds	%f22, %f17, %f18
	.word	0xfd06601c	! t0_kref+0x39bc:   	ld	[%i1 + 0x1c], %f30
	.word	0xafa0052f	! t0_kref+0x39c0:   	fsqrts	%f15, %f23
	.word	0xf19e5a1b	! t0_kref+0x39c4:   	ldda	[%i1 + %i3]0xd0, %f24
	.word	0xf19eda19	! t0_kref+0x39c8:   	ldda	[%i3 + %i1]0xd0, %f24
	.word	0xc398a040	! t0_kref+0x39cc:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xb5a01934	! t0_kref+0x39d0:   	fstod	%f20, %f26
	call	SYM(t0_subr0)
	.word	0xadb60a10	! t0_kref+0x39d8:   	fpadd16	%f24, %f16, %f22
	.word	0x9de3bfa0	! t0_kref+0x39dc:   	save	%sp, -0x60, %sp
	.word	0xb40ee9d1	! t0_kref+0x39e0:   	and	%i3, 0x9d1, %i2
	.word	0xa7ee8000	! t0_kref+0x39e4:   	restore	%i2, %g0, %l3
	.word	0xd6280018	! t0_kref+0x39e8:   	stb	%o3, [%g0 + %i0]
	.word	0x8143c000	! t0_kref+0x39ec:   	stbar
	.word	0xa474c00b	! t0_kref+0x39f0:   	udiv	%l3, %o3, %l2
	.word	0x9067001a	! t0_kref+0x39f4:   	subc	%i4, %i2, %o0
	.word	0x24480001	! t0_kref+0x39f8:   	ble,a,pt	%icc, _kref+0x39fc
	.word	0x99a48d3e	! t0_kref+0x39fc:   	fsmuld	%f18, %f30, %f12
	.word	0xada688dc	! t0_kref+0x3a00:   	fsubd	%f26, %f28, %f22
	.word	0x9de3bfa0	! t0_kref+0x3a04:   	save	%sp, -0x60, %sp
	.word	0xb266b7a2	! t0_kref+0x3a08:   	subc	%i2, -0x85e, %i1
	.word	0xa7ee0000	! t0_kref+0x3a0c:   	restore	%i0, %g0, %l3
	.word	0xbfb78a37	! t0_kref+0x3a10:   	fpadd16s	%f30, %f23, %f31
	.word	0xac72326d	! t0_kref+0x3a14:   	udiv	%o0, -0xd93, %l6
	.word	0xa29c7ccd	! t0_kref+0x3a18:   	xorcc	%l1, -0x333, %l1
	.word	0xe0780019	! t0_kref+0x3a1c:   	swap	[%g0 + %i1], %l0
	.word	0xc768a002	! t0_kref+0x3a20:   	prefetch	%g2 + 2, 3
	.word	0xda36600c	! t0_kref+0x3a24:   	sth	%o5, [%i1 + 0xc]
	.word	0xaba01895	! t0_kref+0x3a28:   	fitos	%f21, %f21
	.word	0xa5b30a1e	! t0_kref+0x3a2c:   	fpadd16	%f12, %f30, %f18
	.word	0x2f480005	! t0_kref+0x3a30:   	fbu,a,pt	%fcc0, _kref+0x3a44
	.word	0xb5a01118	! t0_kref+0x3a34:   	fxtod	%f24, %f26
	.word	0xa5a0192e	! t0_kref+0x3a38:   	fstod	%f14, %f18
	.word	0xadb68a16	! t0_kref+0x3a3c:   	fpadd16	%f26, %f22, %f22
	.word	0xd20e3fe9	! t0_kref+0x3a40:   	ldub	[%i0 - 0x17], %o1
	.word	0xe016001b	! t0_kref+0x3a44:   	lduh	[%i0 + %i3], %l0
	.word	0xf51e3ff0	! t0_kref+0x3a48:   	ldd	[%i0 - 0x10], %f26
	.word	0x903ca105	! t0_kref+0x3a4c:   	xnor	%l2, 0x105, %o0
	.word	0xbdb5899a	! t0_kref+0x3a50:   	bshuffle	%f22, %f26, %f30
	.word	0x9da01938	! t0_kref+0x3a54:   	fstod	%f24, %f14
	.word	0x3b800006	! t0_kref+0x3a58:   	fble,a	_kref+0x3a70
	.word	0xf6766018	! t0_kref+0x3a5c:   	stx	%i3, [%i1 + 0x18]
	.word	0xacf2c008	! t0_kref+0x3a60:   	udivcc	%o3, %o0, %l6
	.word	0x90dd71b3	! t0_kref+0x3a64:   	smulcc	%l5, -0xe4d, %o0
	.word	0xbfa000b7	! t0_kref+0x3a68:   	fnegs	%f23, %f31
	.word	0x99a3895c	! t0_kref+0x3a6c:   	fmuld	%f14, %f28, %f12
	.word	0xf3063ff8	! t0_kref+0x3a70:   	ld	[%i0 - 8], %f25
	.word	0xa1b30d96	! t0_kref+0x3a74:   	fxor	%f12, %f22, %f16
	.word	0x912d4012	! t0_kref+0x3a78:   	sll	%l5, %l2, %o0
	.word	0xa7802ddb	! t0_kref+0x3a7c:   	mov	0xddb, %gsr
	.word	0x8143c000	! t0_kref+0x3a80:   	stbar
	.word	0xe1be1897	! t0_kref+0x3a84:   	stda	%f16, [%i0 + %l7]0xc4
	.word	0xa2627fed	! t0_kref+0x3a88:   	subc	%o1, -0x13, %l1
	.word	0x8610201e	! t0_kref+0x3a8c:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x3a90:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x3a94:   	be,a	_kref+0x3aa0
	.word	0xa89d75e7	! t0_kref+0x3a98:   	xorcc	%l5, -0xa19, %l4
	.word	0x95400000	! t0_kref+0x3a9c:   	mov	%y, %o2
	.word	0x21254cde	! t0_kref+0x3aa0:   	sethi	%hi(0x95337800), %l0
	.word	0x90858000	! t0_kref+0x3aa4:   	addcc	%l6, %g0, %o0
	.word	0xfb270019	! t0_kref+0x3aa8:   	st	%f29, [%i4 + %i1]
	.word	0x93b30132	! t0_kref+0x3aac:   	edge32n	%o4, %l2, %o1
	.word	0x2e800006	! t0_kref+0x3ab0:   	bvs,a	_kref+0x3ac8
	.word	0xa6644012	! t0_kref+0x3ab4:   	subc	%l1, %l2, %l3
	.word	0xa88dc011	! t0_kref+0x3ab8:   	andcc	%l7, %l1, %l4
	.word	0x93b5400d	! t0_kref+0x3abc:   	edge8	%l5, %o5, %o1
	.word	0xaca5c00a	! t0_kref+0x3ac0:   	subcc	%l7, %o2, %l6
	.word	0xa9b580fb	! t0_kref+0x3ac4:   	edge16ln	%l6, %i3, %l4
	.word	0x90050009	! t0_kref+0x3ac8:   	add	%l4, %o1, %o0
	.word	0xc807bfec	! t0_kref+0x3acc:   	ld	[%fp - 0x14], %g4
	.word	0xa5b68f4c	! t0_kref+0x3ad0:   	fornot1	%f26, %f12, %f18
	.word	0xa1b48ad2	! t0_kref+0x3ad4:   	fpsub32	%f18, %f18, %f16
	.word	0xb9a0192f	! t0_kref+0x3ad8:   	fstod	%f15, %f28
	.word	0xaba448bc	! t0_kref+0x3adc:   	fsubs	%f17, %f28, %f21
	.word	0x8143e017	! t0_kref+0x3ae0:   	membar	0x17
	.word	0xa5a608b5	! t0_kref+0x3ae4:   	fsubs	%f24, %f21, %f18
	.word	0x9de3bfa0	! t0_kref+0x3ae8:   	save	%sp, -0x60, %sp
	.word	0xb4d8001d	! t0_kref+0x3aec:   	smulcc	%g0, %i5, %i2
	.word	0xadeeaa9e	! t0_kref+0x3af0:   	restore	%i2, 0xa9e, %l6
	.word	0x929a400c	! t0_kref+0x3af4:   	xorcc	%o1, %o4, %o1
	.word	0xb3b64df6	! t0_kref+0x3af8:   	fnands	%f25, %f22, %f25
	.word	0xa780001a	! t0_kref+0x3afc:   	mov	%i2, %gsr
	.word	0x932c0000	! t0_kref+0x3b00:   	sll	%l0, %g0, %o1
	.word	0xb5a64d2d	! t0_kref+0x3b04:   	fsmuld	%f25, %f13, %f26
	.word	0x2a480001	! t0_kref+0x3b08:   	bcs,a,pt	%icc, _kref+0x3b0c
	.word	0xa1b6048e	! t0_kref+0x3b0c:   	fcmple32	%f24, %f14, %l0
	.word	0xada6095a	! t0_kref+0x3b10:   	fmuld	%f24, %f26, %f22
	.word	0xc398a040	! t0_kref+0x3b14:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa8634015	! t0_kref+0x3b18:   	subc	%o5, %l5, %l4
	.word	0x8143c000	! t0_kref+0x3b1c:   	stbar
	.word	0xadb40200	! t0_kref+0x3b20:   	array8	%l0, %g0, %l6
	.word	0xa08c4016	! t0_kref+0x3b24:   	andcc	%l1, %l6, %l0
	.word	0xa472fbd4	! t0_kref+0x3b28:   	udiv	%o3, -0x42c, %l2
	.word	0x95400000	! t0_kref+0x3b2c:   	mov	%y, %o2
	.word	0x90152b7f	! t0_kref+0x3b30:   	or	%l4, 0xb7f, %o0
	.word	0x2d2f5c61	! t0_kref+0x3b34:   	sethi	%hi(0xbd718400), %l6
	call	SYM(t0_subr0)
	.word	0xef6e401b	! t0_kref+0x3b3c:   	prefetch	%i1 + %i3, 23
	.word	0xa265b061	! t0_kref+0x3b40:   	subc	%l6, -0xf9f, %l1
	.word	0xbfa64834	! t0_kref+0x3b44:   	fadds	%f25, %f20, %f31
	.word	0xa1b68f50	! t0_kref+0x3b48:   	fornot1	%f26, %f16, %f16
	.word	0x94d5801c	! t0_kref+0x3b4c:   	umulcc	%l6, %i4, %o2
	.word	0xada000bc	! t0_kref+0x3b50:   	fnegs	%f28, %f22
	.word	0xaa0c0000	! t0_kref+0x3b54:   	and	%l0, %g0, %l5
	.word	0x86102002	! t0_kref+0x3b58:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x3b5c:   	bne,a	_kref+0x3b5c
	.word	0x86a0e001	! t0_kref+0x3b60:   	subcc	%g3, 1, %g3
	.word	0xa6d32b63	! t0_kref+0x3b64:   	umulcc	%o4, 0xb63, %l3
	.word	0xa9a00554	! t0_kref+0x3b68:   	fsqrtd	%f20, %f20
	.word	0xac3a4014	! t0_kref+0x3b6c:   	xnor	%o1, %l4, %l6
	.word	0xb5a0013f	! t0_kref+0x3b70:   	fabss	%f31, %f26
	.word	0xa6028012	! t0_kref+0x3b74:   	add	%o2, %l2, %l3
	.word	0xf9be501d	! t0_kref+0x3b78:   	stda	%f28, [%i1 + %i5]0x80
	.word	0xaba48834	! t0_kref+0x3b7c:   	fadds	%f18, %f20, %f21
	.word	0xe46e7fed	! t0_kref+0x3b80:   	ldstub	[%i1 - 0x13], %l2
	.word	0xaed6c00a	! t0_kref+0x3b84:   	umulcc	%i3, %o2, %l7
	.word	0xb5a74836	! t0_kref+0x3b88:   	fadds	%f29, %f22, %f26
	.word	0x2d480001	! t0_kref+0x3b8c:   	fbg,a,pt	%fcc0, _kref+0x3b90
	.word	0x9db007b4	! t0_kref+0x3b90:   	fpackfix	%f20, %f14
	.word	0xa1a00539	! t0_kref+0x3b94:   	fsqrts	%f25, %f16
	.word	0xa8d363c4	! t0_kref+0x3b98:   	umulcc	%o5, 0x3c4, %l4
	.word	0x910ee35a	! t0_kref+0x3b9c:   	tsubcc	%i3, 0x35a, %o0
	.word	0xb1a7085e	! t0_kref+0x3ba0:   	faddd	%f28, %f30, %f24
	.word	0xa29db2ef	! t0_kref+0x3ba4:   	xorcc	%l6, -0xd11, %l1
	.word	0x8143e040	! t0_kref+0x3ba8:   	membar	0x40
	.word	0xa7a00533	! t0_kref+0x3bac:   	fsqrts	%f19, %f19
	.word	0x2500bb4f	! t0_kref+0x3bb0:   	sethi	%hi(0x2ed3c00), %l2
	.word	0xc398a080	! t0_kref+0x3bb4:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xa3a0188e	! t0_kref+0x3bb8:   	fitos	%f14, %f17
	.word	0xb1a0193e	! t0_kref+0x3bbc:   	fstod	%f30, %f24
	call	SYM(t0_subr3)
	.word	0xb5b007b0	! t0_kref+0x3bc4:   	fpackfix	%f16, %f26
	.word	0x3d480006	! t0_kref+0x3bc8:   	fbule,a,pt	%fcc0, _kref+0x3be0
	.word	0x929cb991	! t0_kref+0x3bcc:   	xorcc	%l2, -0x66f, %o1
	.word	0xa1a0193d	! t0_kref+0x3bd0:   	fstod	%f29, %f16
	.word	0xef270018	! t0_kref+0x3bd4:   	st	%f23, [%i4 + %i0]
	.word	0xe62e0000	! t0_kref+0x3bd8:   	stb	%l3, [%i0]
	.word	0x9db60739	! t0_kref+0x3bdc:   	fmuld8ulx16	%f24, %f25, %f14
	.word	0xeb6e2008	! t0_kref+0x3be0:   	prefetch	%i0 + 8, 21
	.word	0xaba0053b	! t0_kref+0x3be4:   	fsqrts	%f27, %f21
	.word	0xd87e3fe8	! t0_kref+0x3be8:   	swap	[%i0 - 0x18], %o4
	.word	0xb9a0188f	! t0_kref+0x3bec:   	fitos	%f15, %f28
	.word	0x9161a0a0	! t0_kref+0x3bf0:   	movg	%fcc0, 0xa0, %o0
	.word	0xb7a00136	! t0_kref+0x3bf4:   	fabss	%f22, %f27
	.word	0xea6e3fee	! t0_kref+0x3bf8:   	ldstub	[%i0 - 0x12], %l5
	.word	0x35480002	! t0_kref+0x3bfc:   	fbue,a,pt	%fcc0, _kref+0x3c04
	.word	0xa9a000bc	! t0_kref+0x3c00:   	fnegs	%f28, %f20
	.word	0xf120a008	! t0_kref+0x3c04:   	st	%f24, [%g2 + 8]
	.word	0xd22e7feb	! t0_kref+0x3c08:   	stb	%o1, [%i1 - 0x15]
	.word	0xe20e0000	! t0_kref+0x3c0c:   	ldub	[%i0], %l1
	.word	0x34480005	! t0_kref+0x3c10:   	bg,a,pt	%icc, _kref+0x3c24
	.word	0x8143c000	! t0_kref+0x3c14:   	stbar
	.word	0x23800007	! t0_kref+0x3c18:   	fbne,a	_kref+0x3c34
	.word	0xbfb00f30	! t0_kref+0x3c1c:   	fsrc2s	%f16, %f31
	.word	0xea16c018	! t0_kref+0x3c20:   	lduh	[%i3 + %i0], %l5
	.word	0xa874bb42	! t0_kref+0x3c24:   	udiv	%l2, -0x4be, %l4
	.word	0x3b480002	! t0_kref+0x3c28:   	fble,a,pt	%fcc0, _kref+0x3c30
	.word	0xbdb50ede	! t0_kref+0x3c2c:   	fornot2	%f20, %f30, %f30
	.word	0xa658001b	! t0_kref+0x3c30:   	smul	%g0, %i3, %l3
	.word	0xef68a04c	! t0_kref+0x3c34:   	prefetch	%g2 + 0x4c, 23
	.word	0x2f480002	! t0_kref+0x3c38:   	fbu,a,pt	%fcc0, _kref+0x3c40
	.word	0xd2100019	! t0_kref+0x3c3c:   	lduh	[%g0 + %i1], %o1
	.word	0xbda5c833	! t0_kref+0x3c40:   	fadds	%f23, %f19, %f30
	.word	0xaadea56a	! t0_kref+0x3c44:   	smulcc	%i2, 0x56a, %l5
	call	SYM(t0_subr2)
	.word	0xaa9c401b	! t0_kref+0x3c4c:   	xorcc	%l1, %i3, %l5
	.word	0xb3a5493d	! t0_kref+0x3c50:   	fmuls	%f21, %f29, %f25
	.word	0xc398a080	! t0_kref+0x3c54:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xa89e8012	! t0_kref+0x3c58:   	xorcc	%i2, %l2, %l4
	.word	0xbda40d36	! t0_kref+0x3c5c:   	fsmuld	%f16, %f22, %f30
	.word	0xa9a00552	! t0_kref+0x3c60:   	fsqrtd	%f18, %f20
	.word	0x87802082	! t0_kref+0x3c64:   	mov	0x82, %asi
	.word	0xec4e401a	! t0_kref+0x3c68:   	ldsb	[%i1 + %i2], %l6
	.word	0x81830000	! t0_kref+0x3c6c:   	wr	%o4, %g0, %y
	.word	0xb7a01a3c	! t0_kref+0x3c70:   	fstoi	%f28, %f27
	.word	0xa41c311a	! t0_kref+0x3c74:   	xor	%l0, -0xee6, %l2
	.word	0xa31d69e8	! t0_kref+0x3c78:   	tsubcctv	%l5, 0x9e8, %l1
	.word	0xa7b44e35	! t0_kref+0x3c7c:   	fands	%f17, %f21, %f19
	.word	0x9de3bfa0	! t0_kref+0x3c80:   	save	%sp, -0x60, %sp
	.word	0xb636b434	! t0_kref+0x3c84:   	orn	%i2, -0xbcc, %i3
	.word	0x95eef093	! t0_kref+0x3c88:   	restore	%i3, -0xf6d, %o2
	.word	0xa1a01037	! t0_kref+0x3c8c:   	fstox	%f23, %f16
	.word	0xd47e2010	! t0_kref+0x3c90:   	swap	[%i0 + 0x10], %o2
	.word	0xacd28014	! t0_kref+0x3c94:   	umulcc	%o2, %l4, %l6
	.word	0x38800003	! t0_kref+0x3c98:   	bgu,a	_kref+0x3ca4
	.word	0xe86e3fed	! t0_kref+0x3c9c:   	ldstub	[%i0 - 0x13], %l4
	.word	0x24480002	! t0_kref+0x3ca0:   	ble,a,pt	%icc, _kref+0x3ca8
	.word	0xada00534	! t0_kref+0x3ca4:   	fsqrts	%f20, %f22
	.word	0x9fa01891	! t0_kref+0x3ca8:   	fitos	%f17, %f15
	.word	0xae1dc014	! t0_kref+0x3cac:   	xor	%l7, %l4, %l7
	.word	0xd91f4018	! t0_kref+0x3cb0:   	ldd	[%i5 + %i0], %f12
	.word	0x81ac8aad	! t0_kref+0x3cb4:   	fcmpes	%fcc0, %f18, %f13
	.word	0xe8167ff4	! t0_kref+0x3cb8:   	lduh	[%i1 - 0xc], %l4
	.word	0x81ae0a31	! t0_kref+0x3cbc:   	fcmps	%fcc0, %f24, %f17
	.word	0xe81e2010	! t0_kref+0x3cc0:   	ldd	[%i0 + 0x10], %l4
	.word	0x2c480004	! t0_kref+0x3cc4:   	bneg,a,pt	%icc, _kref+0x3cd4
	.word	0xac7c7558	! t0_kref+0x3cc8:   	sdiv	%l1, -0xaa8, %l6
	.word	0xd91fbe30	! t0_kref+0x3ccc:   	ldd	[%fp - 0x1d0], %f12
	.word	0xd06e0000	! t0_kref+0x3cd0:   	ldstub	[%i0], %o0
	.word	0x8584a925	! t0_kref+0x3cd4:   	wr	%l2, 0x925, %ccr
	.word	0x34800008	! t0_kref+0x3cd8:   	bg,a	_kref+0x3cf8
	.word	0xaada4011	! t0_kref+0x3cdc:   	smulcc	%o1, %l1, %l5
	.word	0xa9a00135	! t0_kref+0x3ce0:   	fabss	%f21, %f20
	.word	0xbba5c83e	! t0_kref+0x3ce4:   	fadds	%f23, %f30, %f29
	.word	0xac844010	! t0_kref+0x3ce8:   	addcc	%l1, %l0, %l6
	.word	0xa1270008	! t0_kref+0x3cec:   	mulscc	%i4, %o0, %l0
	.word	0xd2ff1018	! t0_kref+0x3cf0:   	swapa	[%i4 + %i0]0x80, %o1
	.word	0x37800003	! t0_kref+0x3cf4:   	fbge,a	_kref+0x3d00
	.word	0xafa0052f	! t0_kref+0x3cf8:   	fsqrts	%f15, %f23
	.word	0xa2bc0000	! t0_kref+0x3cfc:   	xnorcc	%l0, %g0, %l1
	.word	0xafa348ad	! t0_kref+0x3d00:   	fsubs	%f13, %f13, %f23
	.word	0xeb06600c	! t0_kref+0x3d04:   	ld	[%i1 + 0xc], %f21
	.word	0xa80a4012	! t0_kref+0x3d08:   	and	%o1, %l2, %l4
	.word	0xac52366f	! t0_kref+0x3d0c:   	umul	%o0, -0x991, %l6
	.word	0x9db40c5e	! t0_kref+0x3d10:   	fnor	%f16, %f30, %f14
	.word	0xa69e8008	! t0_kref+0x3d14:   	xorcc	%i2, %o0, %l3
	.word	0xb1a01939	! t0_kref+0x3d18:   	fstod	%f25, %f24
	.word	0xec26001c	! t0_kref+0x3d1c:   	st	%l6, [%i0 + %i4]
	.word	0xf720a01c	! t0_kref+0x3d20:   	st	%f27, [%g2 + 0x1c]
	.word	0x94af000d	! t0_kref+0x3d24:   	andncc	%i4, %o5, %o2
	.word	0xaab824f7	! t0_kref+0x3d28:   	xnorcc	%g0, 0x4f7, %l5
	.word	0xe28e101a	! t0_kref+0x3d2c:   	lduba	[%i0 + %i2]0x80, %l1
	.word	0x9455c00a	! t0_kref+0x3d30:   	umul	%l7, %o2, %o2
	.word	0xb1a000de	! t0_kref+0x3d34:   	fnegd	%f30, %f24
	.word	0x8d83401b	! t0_kref+0x3d38:   	wr	%o5, %i3, %fprs
	.word	0x81844000	! t0_kref+0x3d3c:   	wr	%l1, %g0, %y
	.word	0xe6680018	! t0_kref+0x3d40:   	ldstub	[%g0 + %i0], %l3
	.word	0x99b009b1	! t0_kref+0x3d44:   	fexpand	%f17, %f12
	.word	0xa5a0052d	! t0_kref+0x3d48:   	fsqrts	%f13, %f18
	.word	0xa6dd800d	! t0_kref+0x3d4c:   	smulcc	%l6, %o5, %l3
	.word	0x932d4011	! t0_kref+0x3d50:   	sll	%l5, %l1, %o1
	.word	0xa6533a7b	! t0_kref+0x3d54:   	umul	%o4, -0x585, %l3
	.word	0x81d969f7	! t0_kref+0x3d58:   	flush	%g5 + 0x9f7
	.word	0x9fa000bf	! t0_kref+0x3d5c:   	fnegs	%f31, %f15
	.word	0xa93a6017	! t0_kref+0x3d60:   	sra	%o1, 0x17, %l4
	.word	0xe7267ff0	! t0_kref+0x3d64:   	st	%f19, [%i1 - 0x10]
	.word	0xb5a7cd2e	! t0_kref+0x3d68:   	fsmuld	%f31, %f14, %f26
	.word	0xb9a01912	! t0_kref+0x3d6c:   	fitod	%f18, %f28
	.word	0xf43e3ff0	! t0_kref+0x3d70:   	std	%i2, [%i0 - 0x10]
	.word	0xbbb50ea0	! t0_kref+0x3d74:   	fsrc1s	%f20, %f29
	.word	0x86102002	! t0_kref+0x3d78:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x3d7c:   	bne,a	_kref+0x3d7c
	.word	0x86a0e001	! t0_kref+0x3d80:   	subcc	%g3, 1, %g3
	.word	0x99a00554	! t0_kref+0x3d84:   	fsqrtd	%f20, %f12
	.word	0xdb06001c	! t0_kref+0x3d88:   	ld	[%i0 + %i4], %f13
	.word	0xaeddc012	! t0_kref+0x3d8c:   	smulcc	%l7, %l2, %l7
	.word	0xe27e401c	! t0_kref+0x3d90:   	swap	[%i1 + %i4], %l1
	.word	0xa256a14c	! t0_kref+0x3d94:   	umul	%i2, 0x14c, %l1
	.word	0x9de3bfa0	! t0_kref+0x3d98:   	save	%sp, -0x60, %sp
	.word	0xb6aec01a	! t0_kref+0x3d9c:   	andncc	%i3, %i2, %i3
	.word	0xa7e8001a	! t0_kref+0x3da0:   	restore	%g0, %i2, %l3
	.word	0xf4200018	! t0_kref+0x3da4:   	st	%i2, [%g0 + %i0]
	.word	0xe4680018	! t0_kref+0x3da8:   	ldstub	[%g0 + %i0], %l2
	.word	0xf4267ffc	! t0_kref+0x3dac:   	st	%i2, [%i1 - 4]
	.word	0x39800001	! t0_kref+0x3db0:   	fbuge,a	_kref+0x3db4
	.word	0x81820000	! t0_kref+0x3db4:   	wr	%o0, %g0, %y
	.word	0xec100018	! t0_kref+0x3db8:   	lduh	[%g0 + %i0], %l6
	.word	0xb5a01a56	! t0_kref+0x3dbc:   	fdtoi	%f22, %f26
	.word	0x920b0010	! t0_kref+0x3dc0:   	and	%o4, %l0, %o1
	.word	0x99b00cde	! t0_kref+0x3dc4:   	fnot2	%f30, %f12
	.word	0x290b8cb1	! t0_kref+0x3dc8:   	sethi	%hi(0x2e32c400), %l4
	.word	0xe9be589a	! t0_kref+0x3dcc:   	stda	%f20, [%i1 + %i2]0xc4
	.word	0xad400000	! t0_kref+0x3dd0:   	mov	%y, %l6
	.word	0xa1b7cc72	! t0_kref+0x3dd4:   	fnors	%f31, %f18, %f16
	.word	0xe168a08b	! t0_kref+0x3dd8:   	prefetch	%g2 + 0x8b, 16
	.word	0xe920a004	! t0_kref+0x3ddc:   	st	%f20, [%g2 + 4]
	.word	0x32800002	! t0_kref+0x3de0:   	bne,a	_kref+0x3de8
	.word	0xadb58074	! t0_kref+0x3de4:   	edge8ln	%l6, %l4, %l6
	.word	0xb9a58836	! t0_kref+0x3de8:   	fadds	%f22, %f22, %f28
	.word	0x38480008	! t0_kref+0x3dec:   	bgu,a,pt	%icc, _kref+0x3e0c
	.word	0xae7c71e5	! t0_kref+0x3df0:   	sdiv	%l1, -0xe1b, %l7
	.word	0x93234013	! t0_kref+0x3df4:   	mulscc	%o5, %l3, %o1
	.word	0x9fa01a2f	! t0_kref+0x3df8:   	fstoi	%f15, %f15
	.word	0xea263ffc	! t0_kref+0x3dfc:   	st	%l5, [%i0 - 4]
	.word	0xb1a0053c	! t0_kref+0x3e00:   	fsqrts	%f28, %f24
	.word	0xe306401c	! t0_kref+0x3e04:   	ld	[%i1 + %i4], %f17
	.word	0xa9a7c8ad	! t0_kref+0x3e08:   	fsubs	%f31, %f13, %f20
	.word	0x909eb431	! t0_kref+0x3e0c:   	xorcc	%i2, -0xbcf, %o0
	.word	0xe0ce501a	! t0_kref+0x3e10:   	ldsba	[%i1 + %i2]0x80, %l0
	.word	0xa81a8017	! t0_kref+0x3e14:   	xor	%o2, %l7, %l4
	.word	0xae08001b	! t0_kref+0x3e18:   	and	%g0, %i3, %l7
	.word	0xf5270018	! t0_kref+0x3e1c:   	st	%f26, [%i4 + %i0]
	.word	0xa0f68014	! t0_kref+0x3e20:   	udivcc	%i2, %l4, %l0
	.word	0x93b50512	! t0_kref+0x3e24:   	fcmpgt16	%f20, %f18, %o1
	.word	0xb1b3cea0	! t0_kref+0x3e28:   	fsrc1s	%f15, %f24
	.word	0x9da6c8b2	! t0_kref+0x3e2c:   	fsubs	%f27, %f18, %f14
	.word	0xad348016	! t0_kref+0x3e30:   	srl	%l2, %l6, %l6
	.word	0x9ba408b3	! t0_kref+0x3e34:   	fsubs	%f16, %f19, %f13
	.word	0xb3b40c6f	! t0_kref+0x3e38:   	fnors	%f16, %f15, %f25
	.word	0x9fa00539	! t0_kref+0x3e3c:   	fsqrts	%f25, %f15
	.word	0x9da01a39	! t0_kref+0x3e40:   	fstoi	%f25, %f14
	.word	0xda7e3fe0	! t0_kref+0x3e44:   	swap	[%i0 - 0x20], %o5
	.word	0xa9a58954	! t0_kref+0x3e48:   	fmuld	%f22, %f20, %f20
	.word	0xab2ee01e	! t0_kref+0x3e4c:   	sll	%i3, 0x1e, %l5
	.word	0xe00e3fe9	! t0_kref+0x3e50:   	ldub	[%i0 - 0x17], %l0
	.word	0x9de3bfa0	! t0_kref+0x3e54:   	save	%sp, -0x60, %sp
	.word	0xb8d77055	! t0_kref+0x3e58:   	umulcc	%i5, -0xfab, %i4
	.word	0xafeec01c	! t0_kref+0x3e5c:   	restore	%i3, %i4, %l7
	.word	0xa09a2003	! t0_kref+0x3e60:   	xorcc	%o0, 3, %l0
	.word	0xa8054008	! t0_kref+0x3e64:   	add	%l5, %o0, %l4
	.word	0xb5a7c8ba	! t0_kref+0x3e68:   	fsubs	%f31, %f26, %f26
	.word	0xee200019	! t0_kref+0x3e6c:   	st	%l7, [%g0 + %i1]
	.word	0x8185c000	! t0_kref+0x3e70:   	wr	%l7, %g0, %y
	.word	0xa29aa47c	! t0_kref+0x3e74:   	xorcc	%o2, 0x47c, %l1
	.word	0xda2e2015	! t0_kref+0x3e78:   	stb	%o5, [%i0 + 0x15]
	.word	0xa8ba801c	! t0_kref+0x3e7c:   	xnorcc	%o2, %i4, %l4
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x3e84:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x69596000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x69636000)
.seg "text"
t0_subr1_page_begin:
	.skip 8184
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x697e6000)
.seg "text"
t0_subr2_page_begin:
	.skip 8184
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x04646000)
.seg "text"
t0_subr3_page_begin:
	.skip 8136
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
!  Total operations: 3881  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.01   0.64
!  ldub              0.60   0.95
!  ldsh              0.17   0.21
!  lduh              0.47   0.62
!  ld                0.91   0.77
!  ldd               0.17   0.15
!  swap              1.12   1.00
!  ldstub            1.29   1.52
!  stb               1.37   1.37
!  sth               0.49   0.49
!  st                1.16   1.78
!  std               0.79   0.82
!  add               1.10   1.19
!  addcc             0.82   0.95
!  addx              0.16   0.05
!  addxcc            0.05   0.05
!  taddcc            0.22   0.23
!  taddcctv          0.04   0.00
!  sub               0.21   0.36
!  subcc             0.44   0.64
!  subx              0.60   0.52
!  subxcc            0.52   0.33
!  tsubcc            0.17   0.10
!  tsubcctv          0.15   0.15
!  mulscc            0.48   0.72
!  and               0.77   0.95
!  andcc             0.31   0.49
!  andn              0.45   0.41
!  andncc            0.31   0.26
!  or                1.10   1.03
!  orcc              0.09   0.03
!  orn               0.10   0.08
!  orncc             0.11   0.05
!  xor               0.94   1.08
!  xorcc             1.25   1.62
!  xnor              0.45   0.46
!  xnorcc            0.11   0.31
!  sll               0.61   0.57
!  srl               0.17   0.18
!  sra               0.35   0.31
!  unimp             0.21   0.18
!  umul              0.72   0.88
!  smul              0.62   0.72
!  udiv              1.34   1.34
!  sdiv              1.18   1.03
!  umulcc            1.23   1.00
!  smulcc            1.26   1.34
!  udivcc            1.08   1.19
!  sdivcc            0.65   0.62
!  rdy               0.83   0.98
!  wry               1.15   1.34
!  bicc              1.95   1.70
!  sethi             1.37   1.34
!  jmpl              0.52   0.41
!  call              1.27   1.42
!  ticc              0.00   0.00
!  flush             1.21   1.39
!  save              1.34   0.95
!  restore           1.07   0.00
!  stbar             0.99   0.98
!  ldf               1.22   1.75
!  lddf              1.23   1.31
!  stf               0.46   0.57
!  stdf              0.24   0.26
!  fadds             1.23   1.34
!  fsubs             1.39   1.93
!  fmuls             0.17   0.18
!  fdivs             0.08   0.03
!  faddd             0.57   0.57
!  fsubd             0.36   0.28
!  fmuld             1.16   1.34
!  fdivd             0.18   0.21
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.17   1.29
!  fdmulq            0.00   0.00
!  fitos             1.33   1.19
!  fitod             0.29   0.39
!  fitoq             0.00   0.00
!  fstoi             1.23   1.00
!  fstod             1.18   1.31
!  fstoq             0.00   0.00
!  fdtoi             0.85   0.82
!  fdtos             0.11   0.18
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.15   0.23
!  fnegs             0.74   0.62
!  fabss             1.08   1.21
!  fsqrts            1.99   2.16
!  fsqrtd            1.58   1.57
!  fsqrtq            0.00   0.00
!  fcmps             0.73   0.62
!  fcmpd             0.39   0.28
!  fcmpq             0.00   0.00
!  fcmpes            1.29   1.13
!  fcmped            0.39   0.41
!  fcmpeq            0.00   0.00
!  fbfcc             1.76   1.78
!  ldfsr             0.02   0.00
!  stfsr             0.08   0.05
!  loop              0.88   0.77
!  offset            0.23   0.33
!  area              0.11   0.03
!  target            0.15   0.28
!  goto              0.17   0.03
!  sigsegv           0.16   0.15
!  sigbus            0.02   0.03
!  imodify           0.00   0.00
!  ldfsr_offset      0.23   0.00
!  fpattern          0.16   0.15
!  lbranch           0.24   0.18
!  shmld             0.20   0.10
!  shmst             0.98   1.26
!  shmpf             0.68   0.75
!  shmswap           0.03   0.00
!  shmblkld          1.29   0.31
!  shmblkst          0.16   0.05
!  shmblkchk         0.52   0.39
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
!  casa              0.22   0.41
!  rdasi             0.20   0.08
!  wrasi             0.20   0.10
!  bpcc              3.61   2.99
!  fbpfcc            2.37   2.19
!  fmovscc           0.14   0.05
!  fmovdcc           0.11   0.05
!  fmovqcc           0.00   0.00
!  movcc             0.11   0.15
!  flushw            0.21   0.33
!  membar            0.19   0.08
!  prefetch          0.45   0.59
!  rdpc              0.20   0.15
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.24   0.36
!  lddfa             0.14   0.13
!  ldqfa             0.00   0.00
!  ldsba             0.25   0.23
!  ldsha             0.11   0.03
!  lduba             0.26   0.28
!  lduha             0.13   0.10
!  lda               0.03   0.08
!  ldda              0.13   0.13
!  ldstuba           0.14   0.18
!  prefetcha         0.45   0.62
!  stfa              0.00   0.00
!  stdfa             0.09   0.10
!  stqfa             0.00   0.00
!  stba              0.06   0.10
!  stha              0.04   0.05
!  sta               0.05   0.03
!  stda              0.18   0.10
!  swapa             0.20   0.31
!  fmovd             0.11   0.05
!  fnegd             0.23   0.13
!  fabsd             0.11   0.10
!  fstox             0.22   0.28
!  fdtox             0.22   0.15
!  fxtos             0.04   0.03
!  fxtod             0.25   0.21
!  lds               0.06   0.15
!  ldsa              0.26   0.23
!  ldx               0.25   0.21
!  ldxa              0.04   0.08
!  nofault           0.01   0.00
!  rdgsr             0.03   0.03
!  wrgsr             0.22   0.21
!  fpadd16           0.13   0.31
!  fpadd16s          0.23   0.46
!  fpadd32           0.14   0.08
!  fpadd32s          0.14   0.03
!  fpsub16           0.23   0.15
!  fpsub16s          0.27   0.28
!  fpsub32           0.20   0.44
!  fpsub32s          0.11   0.00
!  fpack16           0.21   0.28
!  fpack32           0.02   0.00
!  fpackfix          0.27   0.23
!  fexpand           0.21   0.21
!  fpmerge           0.08   0.05
!  fmul8x16          0.12   0.13
!  fmul8x16au        0.12   0.05
!  fmul8x16al        0.02   0.00
!  fmul8sux16        0.06   0.03
!  fmul8ulx16        0.15   0.13
!  fmuld8sux16       0.00   0.00
!  fmuld8ulx16       0.17   0.05
!  alignaddr         0.01   0.00
!  alignaddrl        0.04   0.00
!  faligndata        0.23   0.39
!  fzero             0.04   0.03
!  fzeros            0.25   0.28
!  fone              0.01   0.00
!  fones             0.02   0.00
!  fsrc1             0.00   0.00
!  fsrc1s            0.20   0.18
!  fsrc2             0.12   0.00
!  fsrc2s            0.18   0.18
!  fnot1             0.14   0.13
!  fnot1s            0.24   0.31
!  fnot2             0.19   0.28
!  fnot2s            0.17   0.10
!  for               0.20   0.21
!  fors              0.04   0.03
!  fnor              0.17   0.18
!  fnors             0.22   0.21
!  fand              0.09   0.05
!  fands             0.18   0.08
!  fnand             0.21   0.39
!  fnands            0.21   0.36
!  fxor              0.18   0.18
!  fxors             0.11   0.03
!  fxnor             0.11   0.08
!  fxnors            0.26   0.31
!  fornot1           0.14   0.23
!  fornot1s          0.24   0.28
!  fornot2           0.27   0.39
!  fornot2s          0.19   0.21
!  fandnot1          0.12   0.10
!  fandnot1s         0.08   0.05
!  fandnot2          0.22   0.28
!  fandnot2s         0.04   0.00
!  fcmpgt16          0.27   0.23
!  fcmpgt32          0.20   0.33
!  fcmple16          0.03   0.08
!  fcmple32          0.27   0.31
!  fcmpne16          0.06   0.13
!  fcmpne32          0.02   0.00
!  fcmpeq16          0.07   0.10
!  fcmpeq32          0.01   0.03
!  edge8             0.27   0.33
!  edge8l            0.18   0.18
!  edge16            0.04   0.03
!  edge16l           0.08   0.10
!  edge32            0.05   0.00
!  edge32l           0.03   0.08
!  pdist             0.13   0.13
!  partial_st8       0.20   0.13
!  partial_st16      0.24   0.15
!  partial_st32      0.20   0.33
!  short_st8         0.04   0.03
!  short_st16        0.09   0.08
!  short_ld8         0.24   0.31
!  short_ld16        0.07   0.15
!  blkld             0.13   0.00
!  blkst             0.25   0.00
!  blkld_offset      0.12   0.00
!  blkst_offset      0.09   0.00
!  blk_check         0.20   0.18
!  casxa             0.01   0.00
!  rdccr             0.21   0.15
!  rdfprs            0.03   0.03
!  wrccr             0.26   0.33
!  popc              0.09   0.10
!  wrfprs            0.20   0.05
!  stx               0.24   0.21
!  stxa              0.10   0.08
!  cflush            0.00   0.00
!  array8            0.13   0.15
!  array16           0.21   0.08
!  array32           0.10   0.13
!  edge8n            0.15   0.15
!  edge8ln           0.23   0.28
!  edge16n           0.16   0.15
!  edge16ln          0.20   0.21
!  edge32n           0.27   0.33
!  edge32ln          0.18   0.18
!  bmask             0.23   0.18
!  bshuffle          0.25   0.28
!  siam              0.13   0.05
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
KDATA_MODULE(t0_module_offset_table, 0x68262000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0xfffffff8
	.word	0xffffffe0
	.word	0x00000018
	.word	0xffffffe8
	.word	0x00000010
	.word	0xfffffff0
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

KDATA_MODULE(t0_module_data_in_regs, 0x58c24000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x5769816b          ! %f0
	.word	0xe493735d          ! %f1
	.word	0xdba4773c          ! %f2
	.word	0x9158208e          ! %f3
	.word	0x44988c74          ! %f4
	.word	0x64a9d9f0          ! %f5
	.word	0x390ed65b          ! %f6
	.word	0xa20a1913          ! %f7
	.word	0xe864e5b4          ! %f8
	.word	0x364f86ca          ! %f9
	.word	0xcf231539          ! %f10
	.word	0x5e6d5e20          ! %f11
	.word	0xcccfcd06          ! %f12
	.word	0x7e046c7c          ! %f13
	.word	0x98b45397          ! %f14
	.word	0xa7a99e83          ! %f15
	.word	0xa19c593c          ! %f16
	.word	0xcb02a880          ! %f17
	.word	0x9b14b92d          ! %f18
	.word	0x1aa72a5d          ! %f19
	.word	0x7c4f83aa          ! %f20
	.word	0x774c0269          ! %f21
	.word	0x480d56cd          ! %f22
	.word	0x40102780          ! %f23
	.word	0x7326e7eb          ! %f24
	.word	0x13b3aa5a          ! %f25
	.word	0x6a1075c7          ! %f26
	.word	0x39403700          ! %f27
	.word	0x8a553bdf          ! %f28
	.word	0xda20eabc          ! %f29
	.word	0xa036f98f          ! %f30
	.word	0x6c106004          ! %f31
	.word	0x623fc3f2          ! %f32
	.word	0x3adec12b          ! %f33
	.word	0xa57fb79d          ! %f34
	.word	0x7ff653dc          ! %f35
	.word	0x2f6847a4          ! %f36
	.word	0x7e9792b0          ! %f37
	.word	0xa4d1e994          ! %f38
	.word	0xc6cb5f58          ! %f39
	.word	0x65634a44          ! %f40
	.word	0x14db6f35          ! %f41
	.word	0x0fb21da6          ! %f42
	.word	0x8c009d57          ! %f43
	.word	0x4df28bfe          ! %f44
	.word	0x22029835          ! %f45
	.word	0xd2ab4936          ! %f46
	.word	0x334b3e9e          ! %f47
	.word	0xf0581718          ! %f48
	.word	0xce253eb2          ! %f49
	.word	0x3e63e1be          ! %f50
	.word	0x152cfaea          ! %f51
	.word	0x23765d78          ! %f52
	.word	0x84fcac6c          ! %f53
	.word	0x99711ff2          ! %f54
	.word	0x8169ff47          ! %f55
	.word	0x1b962a69          ! %f56
	.word	0x03114c4f          ! %f57
	.word	0x7b78d125          ! %f58
	.word	0xaebeeda2          ! %f59
	.word	0xf2f36c9e          ! %f60
	.word	0xaadc462c          ! %f61
	.word	0xe0545aec          ! %f62
	.word	0xe93ec19d          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x17c       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xbd2917f9          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xda126242          ! %o0
	.word	0x562f5fdd          ! %o1
	.word	0x7b430ad7          ! %o2
	.word	0xe6ff9d9f          ! %o3
	.word	0x84c1cd36          ! %o4
	.word	0x2f7ba127          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x8ebe1c76          ! %l0
	.word	0x13baa1ac          ! %l1
	.word	0x47edd500          ! %l2
	.word	0x5ee9aea2          ! %l3
	.word	0x594cc281          ! %l4
	.word	0x2ffb2480          ! %l5
	.word	0x4fba5d68          ! %l6
	.word	0x298b4b3a          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000014          ! %i2 (byte offset)
	.word	0x00000014          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7c602152          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0xc0000b8c          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x16586000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xd252794a
	.word	0x753dc441
	.word	0x71a20a3d
	.word	0xca90f687
	.word	0x86a0d3ee
	.word	0x8e704ec7
	.word	0x4d7728d3
	.word	0xb679e388
	.word	0x47a8f6e0
	.word	0x3762f121
	.word	0x42554df6
	.word	0x7b60c76a
	.word	0xfc40ea55
	.word	0xd68751e0
	.word	0x78ad6d75
	.word	0x49cc387b
	.word	0x6c5439f4
	.word	0x7d63b4bf
	.word	0xe1bddb79
	.word	0x6ad2b5d4
	.word	0xc16691bb
	.word	0x53549fae
	.word	0x2cc58e0e
	.word	0x917a2486
	.word	0x7aa8c524
	.word	0x341b3d2e
	.word	0xb36b72e3
	.word	0x62756c12
	.word	0x6634a483
	.word	0x003f0fdf
	.word	0x5f1edd4d
	.word	0xa4bae61f
	.word	0x8b6644b1
	.word	0xde9ecb57
	.word	0x72025091
	.word	0x2de59566
	.word	0x688f9cee
	.word	0x27f56634
	.word	0x5f422a62
	.word	0x85fe57f0
	.word	0xd2ad9f03
	.word	0xd3d5b974
	.word	0xfcccf1a8
	.word	0x3e698883
	.word	0xe6942da7
	.word	0x83f04103
	.word	0xdb7b4d82
	.word	0x9288c359
	.word	0x32789523
	.word	0x0b9bd195
	.word	0x4711e88e
	.word	0x9567c213
	.word	0xd3186a38
	.word	0xf7d357b5
	.word	0xa567c467
	.word	0x99c682ed
	.word	0x1b34f340
	.word	0xe467f41e
	.word	0xb79fc16f
	.word	0xc8422f31
	.word	0x4cf97f92
	.word	0xa7480949
	.word	0xba0c5ecd
	.word	0xcd8174f0
	.word	0x6565512b
	.word	0xafb10e47
	.word	0xe340f6b9
	.word	0xf76047f0
	.word	0x5037fc89
	.word	0x9e2b3ad0
	.word	0x3143faf6
	.word	0xf7623de0
	.word	0x896962da
	.word	0xa08b609b
	.word	0x7109f5a0
	.word	0x4171f9d2
	.word	0x1624aa56
	.word	0xa42885ef
	.word	0xa0995227
	.word	0xc3675ae9
	.word	0x5ccfd8e8
	.word	0xed381579
	.word	0x23b3329b
	.word	0x93356251
	.word	0x201ff513
	.word	0x1e1cb760
	.word	0x2dddd529
	.word	0x7a3c046f
	.word	0x46d3d113
	.word	0x91a12796
	.word	0x77714de5
	.word	0xb3495959
	.word	0x16ade442
	.word	0x10d99d71
	.word	0x060f98c9
	.word	0x3998e088
	.word	0xafe7d6bd
	.word	0x25fb9879
	.word	0xfffd47fd
	.word	0x10d6cbcc
	.word	0x5ce0a347
	.word	0x72252683
	.word	0x2d605258
	.word	0x9418857f
	.word	0x4a70736d
	.word	0xaa09f6fe
	.word	0xb6bec626
	.word	0x2b1ae5fd
	.word	0x765b99e9
	.word	0xf60dcf8c
	.word	0xa56f642b
	.word	0x8529cc53
	.word	0xb5104f4b
	.word	0xfab935d4
	.word	0xb54a66e8
	.word	0x5f1c0e35
	.word	0x247114d5
	.word	0x6fee6296
	.word	0xb708fa1c
	.word	0xd109f335
	.word	0xe127e1a7
	.word	0xe511d1ff
	.word	0x6ca6268d
	.word	0x8813af32
	.word	0x6d1c7e1b
	.word	0xafbb053e
	.word	0xc4fc3607
	.word	0x3bf0900e
	.word	0x9a6ab172
	.word	0x6eb74956
	.word	0x4605d3a4
	.word	0x2656d2a3
	.word	0x94db25af
	.word	0x7d719735
	.word	0x6dda6c4e
	.word	0x7ed752f6
	.word	0x86ac25c3
	.word	0xf96fe106
	.word	0xbdf19382
	.word	0xafc78bad
	.word	0x72a599e9
	.word	0xf5c760c2
	.word	0xeab17056
	.word	0x838798be
	.word	0xf745e653
	.word	0x5c6ebc0d
	.word	0x770876bc
	.word	0x44193169
	.word	0x6b8b9006
	.word	0x146e113f
	.word	0x8912f108
	.word	0x3cd7cd67
	.word	0xefb9cc01
	.word	0xeb5a41c0
	.word	0x75d11daf
	.word	0x3e716963
	.word	0xd1b45ca4
	.word	0xa98a0d98
	.word	0xd6fae551
	.word	0x63429ea9
	.word	0xd7716150
	.word	0xa848d445
	.word	0xb34a6cf8
	.word	0x0530021d
	.word	0x58c5fc4a
	.word	0x51340ecf
	.word	0x976708a2
	.word	0x7941fe6d
t0_data_in_sp:
	.word	0x66bcf2e4
	.word	0x8b2dd71a
	.word	0x782e51fc
	.word	0x07e79d8a
	.word	0xcff4abde
	.word	0x4520107a
	.word	0xdeb16770
	.word	0xbe17f553
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffff9
	.word	0xffffffee
	.word	0xfffffffc
	.word	0x00000018
	.word	t0_data_in_fp
	.word	0x09c38f43
	.word	0xc5fffbb5
	.word	0x20ef452d
	.word	0xdbda5b2c
	.word	0x2daa1941
	.word	0xb003c993
	.word	0xfe443495
	.word	0xdb8af366
	.word	0x09951767
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
	.word   	0xfd5b596d	! [%fp - 0xc]
	.word   	0xd97ddb82	! [%fp - 0x8]
	.word   	0x78a80a5f	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x28bac0af
	.word	0x63ce2b40
	.word	0x47fdf3e1
	.word	0x9fce839f
	.word	0x2a3f2338
	.word	0x243e6b1a
	.word	0x0693140c
	.word	0x495c77d9
	.word	0x2ac0e5a2
	.word	0x82b8b9dc
	.word	0x5341423b
	.word	0x6f42354f
	.word	0x48e0499b
	.word	0x38b13e41
	.word	0x963bcb3a
	.word	0x7c386274
	.word	0xc99b43ba
	.word	0x7d12421e
	.word	0xe419505c
	.word	0xf56326d2
	.word	0x53b2bc8b
	.word	0x9d40dfeb
	.word	0xc66640af
	.word	0x4d847e2e
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x1ff46000)
.seg "data"
t0_data_in_area0_start:
.skip 960
t0_data_in_area0_begin:
	.word	0xeffa4eea	! t0_data_in_area0-0x20
	.word	0x11808481	! t0_data_in_area0-0x1c
	.word	0xe9493170	! t0_data_in_area0-0x18
	.word	0x9e5e19e9	! t0_data_in_area0-0x14
	.word	0x68b51794	! t0_data_in_area0-0x10
	.word	0x2e664925	! t0_data_in_area0-0xc
	.word	0xc02fc9c1	! t0_data_in_area0-0x8
	.word	0x840574a8	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x893769fa	! t0_data_in_area0+0x0
	.word	0x109969c4	! t0_data_in_area0+0x4
	.word	0xcfb23599	! t0_data_in_area0+0x8
	.word	0x7cf2fc37	! t0_data_in_area0+0xc
	.word	0xfa2e7e58	! t0_data_in_area0+0x10
	.word	0xa02e5b80	! t0_data_in_area0+0x14
	.word	0x2b4653fb	! t0_data_in_area0+0x18
	.word	0x1abf75aa	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 7168
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x6b4d0000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xb36c6d06	! t0_data_in_shm_area+0x0 (t0)
	.word	0xd1be476b	! t0_data_in_shm_area+0x4 (t0)
	.word	0x693b146a	! t0_data_in_shm_area+0x8 (t0)
	.word	0x7910ffc5	! t0_data_in_shm_area+0xc (t0)
	.word	0x7b280b0e	! t0_data_in_shm_area+0x10 (t0)
	.word	0xe534ed91	! t0_data_in_shm_area+0x14 (t0)
	.word	0x1a07b79b	! t0_data_in_shm_area+0x18 (t0)
	.word	0xfc6b579d	! t0_data_in_shm_area+0x1c (t0)
	.word	0xc1857bfe	! t0_data_in_shm_area+0x20 (t0)
	.word	0xd96b343b	! t0_data_in_shm_area+0x24 (t0)
	.word	0xe881e76c	! t0_data_in_shm_area+0x28 (t0)
	.word	0x4fad437e	! t0_data_in_shm_area+0x2c (t0)
	.word	0x7f358cfe	! t0_data_in_shm_area+0x30 (t0)
	.word	0xb044e772	! t0_data_in_shm_area+0x34 (t0)
	.word	0x5a48da15	! t0_data_in_shm_area+0x38 (t0)
	.word	0x1f3f480f	! t0_data_in_shm_area+0x3c (t0)
	.word	0x14472d24	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x456c6cc2	! t0_data_in_shm_area+0x44
	.word	0x91e2f49c	! t0_data_in_shm_area+0x48
	.word	0xba960bb4	! t0_data_in_shm_area+0x4c
	.word	0x8a279706	! t0_data_in_shm_area+0x50
	.word	0x3a2f6f3f	! t0_data_in_shm_area+0x54
	.word	0x09eea08e	! t0_data_in_shm_area+0x58
	.word	0xc1ed0c33	! t0_data_in_shm_area+0x5c
	.word	0xf682ff90	! t0_data_in_shm_area+0x60
	.word	0xefabc7cd	! t0_data_in_shm_area+0x64
	.word	0x899e48eb	! t0_data_in_shm_area+0x68
	.word	0x6d448a99	! t0_data_in_shm_area+0x6c
	.word	0x0580de18	! t0_data_in_shm_area+0x70
	.word	0x55ac259b	! t0_data_in_shm_area+0x74
	.word	0x49c2b261	! t0_data_in_shm_area+0x78
	.word	0x04f7d15e	! t0_data_in_shm_area+0x7c
	.word	0x35f421af	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xdc883aef	! t0_data_in_shm_area+0x84
	.word	0x962622bd	! t0_data_in_shm_area+0x88
	.word	0x71ef38c7	! t0_data_in_shm_area+0x8c
	.word	0xf2c8e7ba	! t0_data_in_shm_area+0x90
	.word	0x83547228	! t0_data_in_shm_area+0x94
	.word	0x0c2e0b9e	! t0_data_in_shm_area+0x98
	.word	0x9dc38d8b	! t0_data_in_shm_area+0x9c
	.word	0x277e87c0	! t0_data_in_shm_area+0xa0
	.word	0x75e96f01	! t0_data_in_shm_area+0xa4
	.word	0xc4e02c6b	! t0_data_in_shm_area+0xa8
	.word	0xd85ebdb9	! t0_data_in_shm_area+0xac
	.word	0xfb160884	! t0_data_in_shm_area+0xb0
	.word	0x280be012	! t0_data_in_shm_area+0xb4
	.word	0x48c35f86	! t0_data_in_shm_area+0xb8
	.word	0xeaffefd8	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x1320c000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x5769816b          ! %f0
	.word	0xe493735d          ! %f1
	.word	0xdba4773c          ! %f2
	.word	0x9158208e          ! %f3
	.word	0x44988c74          ! %f4
	.word	0x64a9d9f0          ! %f5
	.word	0x390ed65b          ! %f6
	.word	0xa20a1913          ! %f7
	.word	0xe864e5b4          ! %f8
	.word	0x364f86ca          ! %f9
	.word	0xcf231539          ! %f10
	.word	0x5e6d5e20          ! %f11
	.word	0xcccfcd06          ! %f12
	.word	0x7e046c7c          ! %f13
	.word	0x98b45397          ! %f14
	.word	0xa7a99e83          ! %f15
	.word	0xa19c593c          ! %f16
	.word	0xcb02a880          ! %f17
	.word	0x9b14b92d          ! %f18
	.word	0x1aa72a5d          ! %f19
	.word	0x7c4f83aa          ! %f20
	.word	0x774c0269          ! %f21
	.word	0x480d56cd          ! %f22
	.word	0x40102780          ! %f23
	.word	0x7326e7eb          ! %f24
	.word	0x13b3aa5a          ! %f25
	.word	0x6a1075c7          ! %f26
	.word	0x39403700          ! %f27
	.word	0x8a553bdf          ! %f28
	.word	0xda20eabc          ! %f29
	.word	0xa036f98f          ! %f30
	.word	0x6c106004          ! %f31
	.word	0x623fc3f2          ! %f32
	.word	0x3adec12b          ! %f33
	.word	0xa57fb79d          ! %f34
	.word	0x7ff653dc          ! %f35
	.word	0x2f6847a4          ! %f36
	.word	0x7e9792b0          ! %f37
	.word	0xa4d1e994          ! %f38
	.word	0xc6cb5f58          ! %f39
	.word	0x65634a44          ! %f40
	.word	0x14db6f35          ! %f41
	.word	0x0fb21da6          ! %f42
	.word	0x8c009d57          ! %f43
	.word	0x4df28bfe          ! %f44
	.word	0x22029835          ! %f45
	.word	0xd2ab4936          ! %f46
	.word	0x334b3e9e          ! %f47
	.word	0xf0581718          ! %f48
	.word	0xce253eb2          ! %f49
	.word	0x3e63e1be          ! %f50
	.word	0x152cfaea          ! %f51
	.word	0x23765d78          ! %f52
	.word	0x84fcac6c          ! %f53
	.word	0x99711ff2          ! %f54
	.word	0x8169ff47          ! %f55
	.word	0x1b962a69          ! %f56
	.word	0x03114c4f          ! %f57
	.word	0x7b78d125          ! %f58
	.word	0xaebeeda2          ! %f59
	.word	0xf2f36c9e          ! %f60
	.word	0xaadc462c          ! %f61
	.word	0xe0545aec          ! %f62
	.word	0xe93ec19d          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x17c       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xbd2917f9          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xda126242          ! %o0
	.word	0x562f5fdd          ! %o1
	.word	0x7b430ad7          ! %o2
	.word	0xe6ff9d9f          ! %o3
	.word	0x84c1cd36          ! %o4
	.word	0x2f7ba127          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x8ebe1c76          ! %l0
	.word	0x13baa1ac          ! %l1
	.word	0x47edd500          ! %l2
	.word	0x5ee9aea2          ! %l3
	.word	0x594cc281          ! %l4
	.word	0x2ffb2480          ! %l5
	.word	0x4fba5d68          ! %l6
	.word	0x298b4b3a          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000014          ! %i2 (byte offset)
	.word	0x00000014          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7c602152          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0xc0000b8c          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x03e48000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xd252794a
	.word	0x753dc441
	.word	0x71a20a3d
	.word	0xca90f687
	.word	0x86a0d3ee
	.word	0x8e704ec7
	.word	0x4d7728d3
	.word	0xb679e388
	.word	0x47a8f6e0
	.word	0x3762f121
	.word	0x42554df6
	.word	0x7b60c76a
	.word	0xfc40ea55
	.word	0xd68751e0
	.word	0x78ad6d75
	.word	0x49cc387b
	.word	0x6c5439f4
	.word	0x7d63b4bf
	.word	0xe1bddb79
	.word	0x6ad2b5d4
	.word	0xc16691bb
	.word	0x53549fae
	.word	0x2cc58e0e
	.word	0x917a2486
	.word	0x7aa8c524
	.word	0x341b3d2e
	.word	0xb36b72e3
	.word	0x62756c12
	.word	0x6634a483
	.word	0x003f0fdf
	.word	0x5f1edd4d
	.word	0xa4bae61f
	.word	0x8b6644b1
	.word	0xde9ecb57
	.word	0x72025091
	.word	0x2de59566
	.word	0x688f9cee
	.word	0x27f56634
	.word	0x5f422a62
	.word	0x85fe57f0
	.word	0xd2ad9f03
	.word	0xd3d5b974
	.word	0xfcccf1a8
	.word	0x3e698883
	.word	0xe6942da7
	.word	0x83f04103
	.word	0xdb7b4d82
	.word	0x9288c359
	.word	0x32789523
	.word	0x0b9bd195
	.word	0x4711e88e
	.word	0x9567c213
	.word	0xd3186a38
	.word	0xf7d357b5
	.word	0xa567c467
	.word	0x99c682ed
	.word	0x1b34f340
	.word	0xe467f41e
	.word	0xb79fc16f
	.word	0xc8422f31
	.word	0x4cf97f92
	.word	0xa7480949
	.word	0xba0c5ecd
	.word	0xcd8174f0
	.word	0x6565512b
	.word	0xafb10e47
	.word	0xe340f6b9
	.word	0xf76047f0
	.word	0x5037fc89
	.word	0x9e2b3ad0
	.word	0x3143faf6
	.word	0xf7623de0
	.word	0x896962da
	.word	0xa08b609b
	.word	0x7109f5a0
	.word	0x4171f9d2
	.word	0x1624aa56
	.word	0xa42885ef
	.word	0xa0995227
	.word	0xc3675ae9
	.word	0x5ccfd8e8
	.word	0xed381579
	.word	0x23b3329b
	.word	0x93356251
	.word	0x201ff513
	.word	0x1e1cb760
	.word	0x2dddd529
	.word	0x7a3c046f
	.word	0x46d3d113
	.word	0x91a12796
	.word	0x77714de5
	.word	0xb3495959
	.word	0x16ade442
	.word	0x10d99d71
	.word	0x060f98c9
	.word	0x3998e088
	.word	0xafe7d6bd
	.word	0x25fb9879
	.word	0xfffd47fd
	.word	0x10d6cbcc
	.word	0x5ce0a347
	.word	0x72252683
	.word	0x2d605258
	.word	0x9418857f
	.word	0x4a70736d
	.word	0xaa09f6fe
	.word	0xb6bec626
	.word	0x2b1ae5fd
	.word	0x765b99e9
	.word	0xf60dcf8c
	.word	0xa56f642b
	.word	0x8529cc53
	.word	0xb5104f4b
	.word	0xfab935d4
	.word	0xb54a66e8
	.word	0x5f1c0e35
	.word	0x247114d5
	.word	0x6fee6296
	.word	0xb708fa1c
	.word	0xd109f335
	.word	0xe127e1a7
	.word	0xe511d1ff
	.word	0x6ca6268d
	.word	0x8813af32
	.word	0x6d1c7e1b
	.word	0xafbb053e
	.word	0xc4fc3607
	.word	0x3bf0900e
	.word	0x9a6ab172
	.word	0x6eb74956
	.word	0x4605d3a4
	.word	0x2656d2a3
	.word	0x94db25af
	.word	0x7d719735
	.word	0x6dda6c4e
	.word	0x7ed752f6
	.word	0x86ac25c3
	.word	0xf96fe106
	.word	0xbdf19382
	.word	0xafc78bad
	.word	0x72a599e9
	.word	0xf5c760c2
	.word	0xeab17056
	.word	0x838798be
	.word	0xf745e653
	.word	0x5c6ebc0d
	.word	0x770876bc
	.word	0x44193169
	.word	0x6b8b9006
	.word	0x146e113f
	.word	0x8912f108
	.word	0x3cd7cd67
	.word	0xefb9cc01
	.word	0xeb5a41c0
	.word	0x75d11daf
	.word	0x3e716963
	.word	0xd1b45ca4
	.word	0xa98a0d98
	.word	0xd6fae551
	.word	0x63429ea9
	.word	0xd7716150
	.word	0xa848d445
	.word	0xb34a6cf8
	.word	0x0530021d
	.word	0x58c5fc4a
	.word	0x51340ecf
	.word	0x976708a2
	.word	0x7941fe6d
t0_data_exp_sp:
	.word	0x66bcf2e4
	.word	0x8b2dd71a
	.word	0x782e51fc
	.word	0x07e79d8a
	.word	0xcff4abde
	.word	0x4520107a
	.word	0xdeb16770
	.word	0xbe17f553
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffff9
	.word	0xffffffee
	.word	0xfffffffc
	.word	0x00000018
	.word	t0_data_exp_fp
	.word	0x09c38f43
	.word	0xc5fffbb5
	.word	0x20ef452d
	.word	0xdbda5b2c
	.word	0x2daa1941
	.word	0xb003c993
	.word	0xfe443495
	.word	0xdb8af366
	.word	0x09951767
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
	.word   	0xfd5b596d	! [%fp - 0xc]
	.word   	0xd97ddb82	! [%fp - 0x8]
	.word   	0x78a80a5f	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x28bac0af
	.word	0x63ce2b40
	.word	0x47fdf3e1
	.word	0x9fce839f
	.word	0x2a3f2338
	.word	0x243e6b1a
	.word	0x0693140c
	.word	0x495c77d9
	.word	0x2ac0e5a2
	.word	0x82b8b9dc
	.word	0x5341423b
	.word	0x6f42354f
	.word	0x48e0499b
	.word	0x38b13e41
	.word	0x963bcb3a
	.word	0x7c386274
	.word	0xc99b43ba
	.word	0x7d12421e
	.word	0xe419505c
	.word	0xf56326d2
	.word	0x53b2bc8b
	.word	0x9d40dfeb
	.word	0xc66640af
	.word	0x4d847e2e
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x2ce82000)
.seg "data"
t0_data_exp_area0_start:
.skip 960
t0_data_exp_area0_begin:
	.word	0xeffa4eea	! t0_data_exp_area0-0x20
	.word	0x11808481	! t0_data_exp_area0-0x1c
	.word	0xe9493170	! t0_data_exp_area0-0x18
	.word	0x9e5e19e9	! t0_data_exp_area0-0x14
	.word	0x68b51794	! t0_data_exp_area0-0x10
	.word	0x2e664925	! t0_data_exp_area0-0xc
	.word	0xc02fc9c1	! t0_data_exp_area0-0x8
	.word	0x840574a8	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x893769fa	! t0_data_exp_area0+0x0
	.word	0x109969c4	! t0_data_exp_area0+0x4
	.word	0xcfb23599	! t0_data_exp_area0+0x8
	.word	0x7cf2fc37	! t0_data_exp_area0+0xc
	.word	0xfa2e7e58	! t0_data_exp_area0+0x10
	.word	0xa02e5b80	! t0_data_exp_area0+0x14
	.word	0x2b4653fb	! t0_data_exp_area0+0x18
	.word	0x1abf75aa	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 7168
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x6e042000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xb36c6d06	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xd1be476b	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x693b146a	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x7910ffc5	! t0_data_exp_shm_area+0xc (t0)
	.word	0x7b280b0e	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xe534ed91	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x1a07b79b	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xfc6b579d	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xc1857bfe	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xd96b343b	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xe881e76c	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x4fad437e	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x7f358cfe	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xb044e772	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x5a48da15	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x1f3f480f	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x14472d24	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x456c6cc2	! t0_data_exp_shm_area+0x44
	.word	0x91e2f49c	! t0_data_exp_shm_area+0x48
	.word	0xba960bb4	! t0_data_exp_shm_area+0x4c
	.word	0x8a279706	! t0_data_exp_shm_area+0x50
	.word	0x3a2f6f3f	! t0_data_exp_shm_area+0x54
	.word	0x09eea08e	! t0_data_exp_shm_area+0x58
	.word	0xc1ed0c33	! t0_data_exp_shm_area+0x5c
	.word	0xf682ff90	! t0_data_exp_shm_area+0x60
	.word	0xefabc7cd	! t0_data_exp_shm_area+0x64
	.word	0x899e48eb	! t0_data_exp_shm_area+0x68
	.word	0x6d448a99	! t0_data_exp_shm_area+0x6c
	.word	0x0580de18	! t0_data_exp_shm_area+0x70
	.word	0x55ac259b	! t0_data_exp_shm_area+0x74
	.word	0x49c2b261	! t0_data_exp_shm_area+0x78
	.word	0x04f7d15e	! t0_data_exp_shm_area+0x7c
	.word	0x35f421af	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xdc883aef	! t0_data_exp_shm_area+0x84
	.word	0x962622bd	! t0_data_exp_shm_area+0x88
	.word	0x71ef38c7	! t0_data_exp_shm_area+0x8c
	.word	0xf2c8e7ba	! t0_data_exp_shm_area+0x90
	.word	0x83547228	! t0_data_exp_shm_area+0x94
	.word	0x0c2e0b9e	! t0_data_exp_shm_area+0x98
	.word	0x9dc38d8b	! t0_data_exp_shm_area+0x9c
	.word	0x277e87c0	! t0_data_exp_shm_area+0xa0
	.word	0x75e96f01	! t0_data_exp_shm_area+0xa4
	.word	0xc4e02c6b	! t0_data_exp_shm_area+0xa8
	.word	0xd85ebdb9	! t0_data_exp_shm_area+0xac
	.word	0xfb160884	! t0_data_exp_shm_area+0xb0
	.word	0x280be012	! t0_data_exp_shm_area+0xb4
	.word	0x48c35f86	! t0_data_exp_shm_area+0xb8
	.word	0xeaffefd8	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d2b3e3aa2091
#define T0_KAOS_ICOUNT        4000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    960
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     4002

#define T0_KAOS_BOOT_VA                  0x30e54000
#define T0_KAOS_BOOT_PA                  0x0000000000818000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x26d14000
#define T0_KAOS_STARTUP_PA               0x00000000023c2000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x68262000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000055c8000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x21d10000
#define T0_KAOS_DONE_PA                  0x0000000007ef2000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x695a2000
#define T0_KAOS_KTBL_PA                  0x000000000836e000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x69596000
#define T0_KAOS_SUBR0_PA                 0x000000000a4be000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x69636000
#define T0_KAOS_SUBR1_PA                 0x000000000d818000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x697e6000
#define T0_KAOS_SUBR2_PA                 0x000000000fbe4000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x04646000
#define T0_KAOS_SUBR3_PA                 0x0000000010640000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x1320c000
#define T0_KAOS_EXP_REGS_PA              0x0000000012c7c000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x58c24000
#define T0_KAOS_RUN_REGS_PA              0x0000000014744000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x03e48000
#define T0_KAOS_EXP_STACK_PA             0x0000000016a1e000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x16586000
#define T0_KAOS_RUN_STACK_PA             0x000000001813c000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x2ce82000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a53e000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x1ff46000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c218000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x6e042000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000e24000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x6b4d0000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000014a6000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x22ca5256
#define T0_KAOS_RANVAL_01     0x4881649c
#define T0_KAOS_RANVAL_02     0x9ee386c1
#define T0_KAOS_RANVAL_03     0x9647684f
#define T0_KAOS_RANVAL_04     0x6d68b2a5
#define T0_KAOS_RANVAL_05     0x40678a85
#define T0_KAOS_RANVAL_06     0x50c34b10
#define T0_KAOS_RANVAL_07     0x4450e107
#define T0_KAOS_RANVAL_08     0x467584d9
#define T0_KAOS_RANVAL_09     0x74ee28a1
#define T0_KAOS_RANVAL_0a     0x027da380
#define T0_KAOS_RANVAL_0b     0xef29374e
#define T0_KAOS_RANVAL_0c     0x96b2145f
#define T0_KAOS_RANVAL_0d     0xebe69932
#define T0_KAOS_RANVAL_0e     0x9c045768
#define T0_KAOS_RANVAL_0f     0xf95693fe
#define T0_KAOS_RANVAL_10     0x83560c05
#define T0_KAOS_RANVAL_11     0xcaad98b2
#define T0_KAOS_RANVAL_12     0xc587efdd
#define T0_KAOS_RANVAL_13     0xb7f871de
#define T0_KAOS_RANVAL_14     0x9fa00687
#define T0_KAOS_RANVAL_15     0xf30dcccf
#define T0_KAOS_RANVAL_16     0x28e8cc6a
#define T0_KAOS_RANVAL_17     0x16772647
#define T0_KAOS_RANVAL_18     0x82861468
#define T0_KAOS_RANVAL_19     0x8f1537b6
#define T0_KAOS_RANVAL_1a     0xfbd84f00
#define T0_KAOS_RANVAL_1b     0x5110d00a
#define T0_KAOS_RANVAL_1c     0xc5884b06
#define T0_KAOS_RANVAL_1d     0xfbb81b94
#define T0_KAOS_RANVAL_1e     0x754c532b
#define T0_KAOS_RANVAL_1f     0xb00bd091
#define T0_KAOS_RANVAL_20     0xf734b0e8
#define T0_KAOS_RANVAL_21     0x46c01259
#define T0_KAOS_RANVAL_22     0x1c566486
#define T0_KAOS_RANVAL_23     0x3f353343
#define T0_KAOS_RANVAL_24     0x550d1b5a
#define T0_KAOS_RANVAL_25     0x772e5dbe
#define T0_KAOS_RANVAL_26     0x29936871
#define T0_KAOS_RANVAL_27     0x26d3a72d
#define T0_KAOS_RANVAL_28     0x5274d13c
#define T0_KAOS_RANVAL_29     0x7424b389
#define T0_KAOS_RANVAL_2a     0x467faf00
#define T0_KAOS_RANVAL_2b     0xe29deede
#define T0_KAOS_RANVAL_2c     0x46550715
#define T0_KAOS_RANVAL_2d     0x75d80a0f
#define T0_KAOS_RANVAL_2e     0xca469f36
#define T0_KAOS_RANVAL_2f     0x92cdea91
#define T0_KAOS_RANVAL_30     0x9c84886e
#define T0_KAOS_RANVAL_31     0x224528fa
#define T0_KAOS_RANVAL_32     0x99647272
#define T0_KAOS_RANVAL_33     0xe957a091
#define T0_KAOS_RANVAL_34     0xbbf0225d
#define T0_KAOS_RANVAL_35     0x7497024c
#define T0_KAOS_RANVAL_36     0x27e3b329
#define T0_KAOS_RANVAL_37     0x43dde7d9
#define T0_KAOS_RANVAL_38     0x6c46a35f
#define T0_KAOS_RANVAL_39     0x3eab17a3
#define T0_KAOS_RANVAL_3a     0xe46772d5
#define T0_KAOS_RANVAL_3b     0xc07498fa
#define T0_KAOS_RANVAL_3c     0xeec4846b
#define T0_KAOS_RANVAL_3d     0xe8206fbe
#define T0_KAOS_RANVAL_3e     0xcfce6b2c
#define T0_KAOS_RANVAL_3f     0x11da6941
#define T0_KAOS_RANVAL_40     0x92e88f43
#define T0_KAOS_RANVAL_41     0x3a21e03f
#define T0_KAOS_RANVAL_42     0xf94a7e95
#define T0_KAOS_RANVAL_43     0x75d2d418
#define T0_KAOS_RANVAL_44     0x429c160c
#define T0_KAOS_RANVAL_45     0xc2e4afb2
#define T0_KAOS_RANVAL_46     0x748b4bd7
#define T0_KAOS_RANVAL_47     0x07eab6ac
#define T0_KAOS_RANVAL_48     0x16ee9021
#define T0_KAOS_RANVAL_49     0x23e0d3cd
#define T0_KAOS_RANVAL_4a     0x8e51c913
#define T0_KAOS_RANVAL_4b     0x327881d0
#define T0_KAOS_RANVAL_4c     0x582db023
#define T0_KAOS_RANVAL_4d     0x72584ff9
#define T0_KAOS_RANVAL_4e     0x1eae19f4
#define T0_KAOS_RANVAL_4f     0xd1532620
#define T0_KAOS_RANVAL_50     0x87204754
#define T0_KAOS_RANVAL_51     0x77177811
#define T0_KAOS_RANVAL_52     0xee881524
#define T0_KAOS_RANVAL_53     0xb3c91e69
#define T0_KAOS_RANVAL_54     0xf2bb8a25
#define T0_KAOS_RANVAL_55     0xd8b01b68
#define T0_KAOS_RANVAL_56     0xfb262d01
#define T0_KAOS_RANVAL_57     0x30133c48
#define T0_KAOS_RANVAL_58     0x830f8a0c
#define T0_KAOS_RANVAL_59     0x1f0ddc10
#define T0_KAOS_RANVAL_5a     0xad6daf90
#define T0_KAOS_RANVAL_5b     0xf0151b10
#define T0_KAOS_RANVAL_5c     0x70a0f89b
#define T0_KAOS_RANVAL_5d     0x98623659
#define T0_KAOS_RANVAL_5e     0xc6d291b1
#define T0_KAOS_RANVAL_5f     0xaff75cf1
#define T0_KAOS_RANVAL_60     0x943387ce
#define T0_KAOS_RANVAL_61     0xca4afc98
#define T0_KAOS_RANVAL_62     0x329c3994
#define T0_KAOS_RANVAL_63     0x61461655
#define T0_KAOS_RANVAL_64     0x67697ba4
#define T0_KAOS_RANVAL_65     0x9efe4b29
#define T0_KAOS_RANVAL_66     0x2a87fc6b
#define T0_KAOS_RANVAL_67     0xbb000b8d
#define T0_KAOS_RANVAL_68     0x17d240f0
#define T0_KAOS_RANVAL_69     0x817338b6
#define T0_KAOS_RANVAL_6a     0x39294360
#define T0_KAOS_RANVAL_6b     0x46a9a4ac
#define T0_KAOS_RANVAL_6c     0xad4b1d70
#define T0_KAOS_RANVAL_6d     0x3d2ec6b8
#define T0_KAOS_RANVAL_6e     0xd5f28bc9
#define T0_KAOS_RANVAL_6f     0x2e40bbb3
#define T0_KAOS_RANVAL_70     0x07324d1e
#define T0_KAOS_RANVAL_71     0x9ad0d63d
#define T0_KAOS_RANVAL_72     0x4dd1b69a
#define T0_KAOS_RANVAL_73     0x8d1ca8ee
#define T0_KAOS_RANVAL_74     0xbb1e20c6
#define T0_KAOS_RANVAL_75     0x41f524ec
#define T0_KAOS_RANVAL_76     0xcafd5b1b
#define T0_KAOS_RANVAL_77     0x9098319c
#define T0_KAOS_RANVAL_78     0xe0cef1d8
#define T0_KAOS_RANVAL_79     0x8fb89646
#define T0_KAOS_RANVAL_7a     0xee3810da
#define T0_KAOS_RANVAL_7b     0xf3193cd5
#define T0_KAOS_RANVAL_7c     0xdb2bff7f
#define T0_KAOS_RANVAL_7d     0x7f734d2e
#define T0_KAOS_RANVAL_7e     0x16a9e4e2
#define T0_KAOS_RANVAL_7f     0x16e472a8
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
!    areaoffset     960
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      4002
!    code           695a2000
!    entry          695a2000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2b3e3aa2091
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

KTEXT_MODULE(t0_module_ktbl, 0x695a2000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xaad2fc0c	! t0_kref+0x0:   	umulcc	%o3, -0x3f4, %l5
	.word	0xa7400000	! t0_kref+0x4:   	mov	%y, %l3
	.word	0xa9b78e58	! t0_kref+0x8:   	fxnor	%f30, %f24, %f20
	.word	0x9fa00539	! t0_kref+0xc:   	fsqrts	%f25, %f15
	.word	0xe1be1856	! t0_kref+0x10:   	stda	%f16, [%i0 + %l6]0xc2
	.word	0xadb3844e	! t0_kref+0x14:   	fcmpne16	%f14, %f14, %l6
	.word	0xa3b54175	! t0_kref+0x18:   	edge32ln	%l5, %l5, %l1
	.word	0x2f480002	! t0_kref+0x1c:   	fbu,a,pt	%fcc0, _kref+0x24
	.word	0xabb540ab	! t0_kref+0x20:   	edge16n	%l5, %o3, %l5
	.word	0xa6d5000d	! t0_kref+0x24:   	umulcc	%l4, %o5, %l3
	.word	0xb5a00538	! t0_kref+0x28:   	fsqrts	%f24, %f26
	.word	0xada0193f	! t0_kref+0x2c:   	fstod	%f31, %f22
	.word	0xafa788b6	! t0_kref+0x30:   	fsubs	%f30, %f22, %f23
	.word	0xa1702ea0	! t0_kref+0x34:   	popc	0xea0, %l0
	.word	0xa2f5c009	! t0_kref+0x38:   	udivcc	%l7, %o1, %l1
	.word	0x38480003	! t0_kref+0x3c:   	bgu,a,pt	%icc, _kref+0x48
	.word	0xc568a084	! t0_kref+0x40:   	prefetch	%g2 + 0x84, 2
	.word	0xa1a709b3	! t0_kref+0x44:   	fdivs	%f28, %f19, %f16
	.word	0xaa2b4009	! t0_kref+0x48:   	andn	%o5, %o1, %l5
	.word	0xa20a001c	! t0_kref+0x4c:   	and	%o0, %i4, %l1
	.word	0x81828000	! t0_kref+0x50:   	wr	%o2, %g0, %y
	.word	0x9bb58dff	! t0_kref+0x54:   	fnands	%f22, %f31, %f13
	.word	0xaba01a30	! t0_kref+0x58:   	fstoi	%f16, %f21
	.word	0x94702465	! t0_kref+0x5c:   	udiv	%g0, 0x465, %o2
	.word	0x001fffff	! t0_kref+0x60:   	illtrap	0x1fffff
	.word	0x8585e495	! t0_kref+0x64:   	wr	%l7, 0x495, %ccr
	.word	0xa1b30d40	! t0_kref+0x68:   	fnot1	%f12, %f16
	.word	0x36800001	! t0_kref+0x6c:   	bge,a	_kref+0x70
	.word	0xb1b48ece	! t0_kref+0x70:   	fornot2	%f18, %f14, %f24
	.word	0x903f0017	! t0_kref+0x74:   	xnor	%i4, %l7, %o0
	.word	0x20480001	! t0_kref+0x78:   	bn,a,pt	%icc, _kref+0x7c
	.word	0x91b28130	! t0_kref+0x7c:   	edge32n	%o2, %l0, %o0
	.word	0x9ba0053f	! t0_kref+0x80:   	fsqrts	%f31, %f13
	.word	0xbda60d2e	! t0_kref+0x84:   	fsmuld	%f24, %f14, %f30
	.word	0xa5b24030	! t0_kref+0x88:   	edge8n	%o1, %l0, %l2
	.word	0x92134017	! t0_kref+0x8c:   	or	%o5, %l7, %o1
	.word	0x36800002	! t0_kref+0x90:   	bge,a	_kref+0x98
	.word	0xbda0193b	! t0_kref+0x94:   	fstod	%f27, %f30
	.word	0xa1a64838	! t0_kref+0x98:   	fadds	%f25, %f24, %f16
	.word	0xbfa4083c	! t0_kref+0x9c:   	fadds	%f16, %f28, %f31
	.word	0xe9be1811	! t0_kref+0xa0:   	stda	%f20, [%i0 + %l1]0xc0
	.word	0xf920a02c	! t0_kref+0xa4:   	st	%f28, [%g2 + 0x2c]
	.word	0x39480001	! t0_kref+0xa8:   	fbuge,a,pt	%fcc0, _kref+0xac
	.word	0xec3e4000	! t0_kref+0xac:   	std	%l6, [%i1]
	.word	0xd6367fe8	! t0_kref+0xb0:   	sth	%o3, [%i1 - 0x18]
	.word	0xc807bfe4	! t0_kref+0xb4:   	ld	[%fp - 0x1c], %g4
	.word	0x3d480008	! t0_kref+0xb8:   	fbule,a,pt	%fcc0, _kref+0xd8
	.word	0xa4f70011	! t0_kref+0xbc:   	udivcc	%i4, %l1, %l2
	.word	0x94ddc00a	! t0_kref+0xc0:   	smulcc	%l7, %o2, %o2
	.word	0xabb6cdf5	! t0_kref+0xc4:   	fnands	%f27, %f21, %f21
	.word	0xda6e8019	! t0_kref+0xc8:   	ldstub	[%i2 + %i1], %o5
	.word	0xac02c016	! t0_kref+0xcc:   	add	%o3, %l6, %l6
	.word	0x38800007	! t0_kref+0xd0:   	bgu,a	_kref+0xec
	.word	0xb5b48a9a	! t0_kref+0xd4:   	fpsub16	%f18, %f26, %f26
	.word	0xb5b00cce	! t0_kref+0xd8:   	fnot2	%f14, %f26
	.word	0x8143c000	! t0_kref+0xdc:   	stbar
	call	SYM(t0_subr1)
	.word	0xb9a00536	! t0_kref+0xe4:   	fsqrts	%f22, %f28
	.word	0xbda0111e	! t0_kref+0xe8:   	fxtod	%f30, %f30
	.word	0x2d800004	! t0_kref+0xec:   	fbg,a	_kref+0xfc
	.word	0xaad8000b	! t0_kref+0xf0:   	smulcc	%g0, %o3, %l5
	.word	0xa4a48009	! t0_kref+0xf4:   	subcc	%l2, %o1, %l2
	.word	0x38800005	! t0_kref+0xf8:   	bgu,a	_kref+0x10c
	.word	0xa3b4849e	! t0_kref+0xfc:   	fcmple32	%f18, %f30, %l1
	.word	0x35800008	! t0_kref+0x100:   	fbue,a	_kref+0x120
	.word	0xd2067fec	! t0_kref+0x104:   	ld	[%i1 - 0x14], %o1
	.word	0x90f2c01c	! t0_kref+0x108:   	udivcc	%o3, %i4, %o0
	.word	0xbfa00137	! t0_kref+0x10c:   	fabss	%f23, %f31
	.word	0xb1a01932	! t0_kref+0x110:   	fstod	%f18, %f24
	.word	0xe4580019	! t0_kref+0x114:   	ldx	[%g0 + %i1], %l2
	.word	0x2c480002	! t0_kref+0x118:   	bneg,a,pt	%icc, _kref+0x120
	.word	0xec4e7ffb	! t0_kref+0x11c:   	ldsb	[%i1 - 5], %l6
	.word	0xefee101d	! t0_kref+0x120:   	prefetcha	%i0 + %i5, 23
	.word	0x86102003	! t0_kref+0x124:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x128:   	bne,a	_kref+0x128
	.word	0x86a0e001	! t0_kref+0x12c:   	subcc	%g3, 1, %g3
	.word	0x949cc00d	! t0_kref+0x130:   	xorcc	%l3, %o5, %o2
	.word	0xadb28334	! t0_kref+0x134:   	bmask	%o2, %l4, %l6
	.word	0xbda4482e	! t0_kref+0x138:   	fadds	%f17, %f14, %f30
	.word	0xd286101c	! t0_kref+0x13c:   	lda	[%i0 + %i4]0x80, %o1
	.word	0x81868000	! t0_kref+0x140:   	wr	%i2, %g0, %y
	.word	0xb9b68c5c	! t0_kref+0x144:   	fnor	%f26, %f28, %f28
	.word	0xa9a01939	! t0_kref+0x148:   	fstod	%f25, %f20
	.word	0xa1a000d8	! t0_kref+0x14c:   	fnegd	%f24, %f16
	call	SYM(t0_subr3)
	.word	0xd40e3ff3	! t0_kref+0x154:   	ldub	[%i0 - 0xd], %o2
	.word	0x8143c000	! t0_kref+0x158:   	stbar
	.word	0xa0e48013	! t0_kref+0x15c:   	subccc	%l2, %l3, %l0
	.word	0x8143c000	! t0_kref+0x160:   	stbar
	.word	0x32480007	! t0_kref+0x164:   	bne,a,pt	%icc, _kref+0x180
	.word	0xeef81019	! t0_kref+0x168:   	swapa	[%g0 + %i1]0x80, %l7
	.word	0xe4ee9018	! t0_kref+0x16c:   	ldstuba	[%i2 + %i0]0x80, %l2
	.word	0xee68001a	! t0_kref+0x170:   	ldstub	[%g0 + %i2], %l7
	.word	0xae124013	! t0_kref+0x174:   	or	%o1, %l3, %l7
	.word	0xed180018	! t0_kref+0x178:   	ldd	[%g0 + %i0], %f22
	.word	0x36480008	! t0_kref+0x17c:   	bge,a,pt	%icc, _kref+0x19c
	.word	0xea16200a	! t0_kref+0x180:   	lduh	[%i0 + 0xa], %l5
	.word	0xa5a589dc	! t0_kref+0x184:   	fdivd	%f22, %f28, %f18
	.word	0xe65e0000	! t0_kref+0x188:   	ldx	[%i0], %l3
	.word	0xa8524017	! t0_kref+0x18c:   	umul	%o1, %l7, %l4
	.word	0xe87e6010	! t0_kref+0x190:   	swap	[%i1 + 0x10], %l4
	.word	0x27480001	! t0_kref+0x194:   	fbul,a,pt	%fcc0, _kref+0x198
	.word	0xd6680019	! t0_kref+0x198:   	ldstub	[%g0 + %i1], %o3
	.word	0xa21ac00d	! t0_kref+0x19c:   	xor	%o3, %o5, %l1
	.word	0xa272c010	! t0_kref+0x1a0:   	udiv	%o3, %l0, %l1
	.word	0xa927291a	! t0_kref+0x1a4:   	mulscc	%i4, 0x91a, %l4
	.word	0xea0e7fe5	! t0_kref+0x1a8:   	ldub	[%i1 - 0x1b], %l5
	.word	0xd2162000	! t0_kref+0x1ac:   	lduh	[%i0], %o1
	.word	0xfb6e001c	! t0_kref+0x1b0:   	prefetch	%i0 + %i4, 29
	.word	0xd4480018	! t0_kref+0x1b4:   	ldsb	[%g0 + %i0], %o2
	.word	0xe51e7fe8	! t0_kref+0x1b8:   	ldd	[%i1 - 0x18], %f18
	.word	0xb9b68a31	! t0_kref+0x1bc:   	fpadd16s	%f26, %f17, %f28
	.word	0x8584c00c	! t0_kref+0x1c0:   	wr	%l3, %o4, %ccr
	.word	0x3e800005	! t0_kref+0x1c4:   	bvc,a	_kref+0x1d8
	.word	0xac0cc000	! t0_kref+0x1c8:   	and	%l3, %g0, %l6
	.word	0xa9a01898	! t0_kref+0x1cc:   	fitos	%f24, %f20
	.word	0xa3b4059a	! t0_kref+0x1d0:   	fcmpgt32	%f16, %f26, %l1
	.word	0xa815e05d	! t0_kref+0x1d4:   	or	%l7, 0x5d, %l4
	.word	0x8143e040	! t0_kref+0x1d8:   	membar	0x40
	.word	0xacf2e7c0	! t0_kref+0x1dc:   	udivcc	%o3, 0x7c0, %l6
	.word	0x9405b94e	! t0_kref+0x1e0:   	add	%l6, -0x6b2, %o2
	.word	0xea6e001a	! t0_kref+0x1e4:   	ldstub	[%i0 + %i2], %l5
	.word	0x2a480003	! t0_kref+0x1e8:   	bcs,a,pt	%icc, _kref+0x1f4
	.word	0xa1a7c8b6	! t0_kref+0x1ec:   	fsubs	%f31, %f22, %f16
	.word	0xe726201c	! t0_kref+0x1f0:   	st	%f19, [%i0 + 0x1c]
	.word	0xfb063fe0	! t0_kref+0x1f4:   	ld	[%i0 - 0x20], %f29
	.word	0x95070016	! t0_kref+0x1f8:   	taddcc	%i4, %l6, %o2
	.word	0xa9b40ed6	! t0_kref+0x1fc:   	fornot2	%f16, %f22, %f20
	.word	0x8610200f	! t0_kref+0x200:   	mov	0xf, %g3
	.word	0x86a0e001	! t0_kref+0x204:   	subcc	%g3, 1, %g3
	.word	0x22800020	! t0_kref+0x208:   	be,a	_kref+0x288
	.word	0xb5a5c8b9	! t0_kref+0x20c:   	fsubs	%f23, %f25, %f26
	.word	0xc1082f54	! t0_kref+0x210:   	ld	[%g0 + 0xf54], %fsr
	.word	0x930a801b	! t0_kref+0x214:   	tsubcc	%o2, %i3, %o1
	.word	0x9fa00535	! t0_kref+0x218:   	fsqrts	%f21, %f15
	.word	0xa5a0055c	! t0_kref+0x21c:   	fsqrtd	%f28, %f18
	.word	0xb5a00554	! t0_kref+0x220:   	fsqrtd	%f20, %f26
	.word	0xd8280019	! t0_kref+0x224:   	stb	%o4, [%g0 + %i1]
	.word	0xa1a0055a	! t0_kref+0x228:   	fsqrtd	%f26, %f16
	.word	0xd93e0000	! t0_kref+0x22c:   	std	%f12, [%i0]
	.word	0x9fa5483a	! t0_kref+0x230:   	fadds	%f21, %f26, %f15
	call	SYM(t0_subr0)
	.word	0xa1b50a1c	! t0_kref+0x238:   	fpadd16	%f20, %f28, %f16
	.word	0xf9be584b	! t0_kref+0x23c:   	stda	%f28, [%i1 + %o3]0xc2
	.word	0xa875a6aa	! t0_kref+0x240:   	udiv	%l6, 0x6aa, %l4
	.word	0x9db50dd8	! t0_kref+0x244:   	fnand	%f20, %f24, %f14
	.word	0xafa01a56	! t0_kref+0x248:   	fdtoi	%f22, %f23
	.word	0xaef33cde	! t0_kref+0x24c:   	udivcc	%o4, -0x322, %l7
	.word	0xda367ff4	! t0_kref+0x250:   	sth	%o5, [%i1 - 0xc]
	.word	0xb9a00130	! t0_kref+0x254:   	fabss	%f16, %f28
	.word	0x81ac8a50	! t0_kref+0x258:   	fcmpd	%fcc0, %f18, %f16
	.word	0x244fffea	! t0_kref+0x25c:   	ble,a,pt	%icc, _kref+0x204
	.word	0x9054c008	! t0_kref+0x260:   	umul	%l3, %o0, %o0
	.word	0xfd1fbde0	! t0_kref+0x264:   	ldd	[%fp - 0x220], %f30
	.word	0xd4780018	! t0_kref+0x268:   	swap	[%g0 + %i0], %o2
	.word	0x909b4010	! t0_kref+0x26c:   	xorcc	%o5, %l0, %o0
	.word	0xf16e6008	! t0_kref+0x270:   	prefetch	%i1 + 8, 24
	.word	0x35800001	! t0_kref+0x274:   	fbue,a	_kref+0x278
	.word	0x9fb007bc	! t0_kref+0x278:   	fpackfix	%f28, %f15
	.word	0xf19f1a58	! t0_kref+0x27c:   	ldda	[%i4 + %i0]0xd2, %f24
	.word	0xa9a50954	! t0_kref+0x280:   	fmuld	%f20, %f20, %f20
	.word	0xa7844013	! t0_kref+0x284:   	wr	%l1, %l3, %gsr
	.word	0xaba508b6	! t0_kref+0x288:   	fsubs	%f20, %f22, %f21
	.word	0xa5b70d40	! t0_kref+0x28c:   	fnot1	%f28, %f18
	.word	0x25800005	! t0_kref+0x290:   	fblg,a	_kref+0x2a4
	.word	0xa01ec008	! t0_kref+0x294:   	xor	%i3, %o0, %l0
	.word	0x2e480008	! t0_kref+0x298:   	bvs,a,pt	%icc, _kref+0x2b8
	.word	0xaa758000	! t0_kref+0x29c:   	udiv	%l6, %g0, %l5
	.word	0x81d86926	! t0_kref+0x2a0:   	flush	%g1 + 0x926
	.word	0xae5cb771	! t0_kref+0x2a4:   	smul	%l2, -0x88f, %l7
	.word	0xac0f000c	! t0_kref+0x2a8:   	and	%i4, %o4, %l6
	.word	0xa5b68dce	! t0_kref+0x2ac:   	fnand	%f26, %f14, %f18
	.word	0xa60b6403	! t0_kref+0x2b0:   	and	%o5, 0x403, %l3
	.word	0xaaf571b4	! t0_kref+0x2b4:   	udivcc	%l5, -0xe4c, %l5
	.word	0xaf400000	! t0_kref+0x2b8:   	mov	%y, %l7
	.word	0x9de3bfa0	! t0_kref+0x2bc:   	save	%sp, -0x60, %sp
	.word	0xba66001b	! t0_kref+0x2c0:   	subc	%i0, %i3, %i5
	.word	0x93ef4018	! t0_kref+0x2c4:   	restore	%i5, %i0, %o1
	.word	0xae747ae3	! t0_kref+0x2c8:   	udiv	%l1, -0x51d, %l7
	.word	0x35480002	! t0_kref+0x2cc:   	fbue,a,pt	%fcc0, _kref+0x2d4
	.word	0xa1b40e18	! t0_kref+0x2d0:   	fand	%f16, %f24, %f16
	.word	0xb1a788de	! t0_kref+0x2d4:   	fsubd	%f30, %f30, %f24
	.word	0xb5a0013e	! t0_kref+0x2d8:   	fabss	%f30, %f26
	.word	0x81830000	! t0_kref+0x2dc:   	wr	%o4, %g0, %y
	.word	0x37800004	! t0_kref+0x2e0:   	fbge,a	_kref+0x2f0
	.word	0xa7a708be	! t0_kref+0x2e4:   	fsubs	%f28, %f30, %f19
	.word	0xaebb001c	! t0_kref+0x2e8:   	xnorcc	%o4, %i4, %l7
	.word	0x95400000	! t0_kref+0x2ec:   	mov	%y, %o2
	.word	0x81ac4a3e	! t0_kref+0x2f0:   	fcmps	%fcc0, %f17, %f30
	.word	0x3d480007	! t0_kref+0x2f4:   	fbule,a,pt	%fcc0, _kref+0x310
	.word	0xa1b38edc	! t0_kref+0x2f8:   	fornot2	%f14, %f28, %f16
	.word	0xb5a7083e	! t0_kref+0x2fc:   	fadds	%f28, %f30, %f26
	.word	0xab400000	! t0_kref+0x300:   	mov	%y, %l5
	.word	0xfd1e4000	! t0_kref+0x304:   	ldd	[%i1], %f30
	.word	0xa3b2400b	! t0_kref+0x308:   	edge8	%o1, %o3, %l1
	.word	0x11060660	! t0_kref+0x30c:   	sethi	%hi(0x18198000), %o0
	.word	0x2e480005	! t0_kref+0x310:   	bvs,a,pt	%icc, _kref+0x324
	.word	0x001fffff	! t0_kref+0x314:   	illtrap	0x1fffff
	.word	0xdb000018	! t0_kref+0x318:   	ld	[%g0 + %i0], %f13
	.word	0xa5a0191d	! t0_kref+0x31c:   	fitod	%f29, %f18
	.word	0xd028a01f	! t0_kref+0x320:   	stb	%o0, [%g2 + 0x1f]
	.word	0x34480005	! t0_kref+0x324:   	bg,a,pt	%icc, _kref+0x338
	.word	0x81800000	! t0_kref+0x328:   	mov	%g0, %y
	.word	0xf43e2000	! t0_kref+0x32c:   	std	%i2, [%i0]
	.word	0xaa5c800a	! t0_kref+0x330:   	smul	%l2, %o2, %l5
	.word	0xd07e4000	! t0_kref+0x334:   	swap	[%i1], %o0
	.word	0xd420a034	! t0_kref+0x338:   	st	%o2, [%g2 + 0x34]
	.word	0xbdb68d14	! t0_kref+0x33c:   	fandnot1	%f26, %f20, %f30
	.word	0x81870000	! t0_kref+0x340:   	wr	%i4, %g0, %y
	.word	0xa6d48014	! t0_kref+0x344:   	umulcc	%l2, %l4, %l3
	.word	0x9e0061d0	! t0_kref+0x348:   	add	%g1, 0x1d0, %o7
!	.word	0x2b4fd72d	! t0_kref+0x34c:   	fbug,a,pt	%fcc0, SYM(t0_subr0)
	   	fbug,a,pt	%fcc0, SYM(t0_subr0)
	.word	0xd2580019	! t0_kref+0x350:   	ldx	[%g0 + %i1], %o1
	.word	0xa69dc00c	! t0_kref+0x354:   	xorcc	%l7, %o4, %l3
	.word	0xf9ee501d	! t0_kref+0x358:   	prefetcha	%i1 + %i5, 28
	.word	0xc1e6500b	! t0_kref+0x35c:   	casa	[%i1]0x80, %o3, %g0
	.word	0x86102001	! t0_kref+0x360:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x364:   	bne,a	_kref+0x364
	.word	0x86a0e001	! t0_kref+0x368:   	subcc	%g3, 1, %g3
	.word	0xbda34837	! t0_kref+0x36c:   	fadds	%f13, %f23, %f30
	.word	0xa27e800c	! t0_kref+0x370:   	sdiv	%i2, %o4, %l1
	.word	0x3b800002	! t0_kref+0x374:   	fble,a	_kref+0x37c
	.word	0x9570000b	! t0_kref+0x378:   	popc	%o3, %o2
	.word	0xa5a60950	! t0_kref+0x37c:   	fmuld	%f24, %f16, %f18
	.word	0x33480004	! t0_kref+0x380:   	fbe,a,pt	%fcc0, _kref+0x390
	.word	0x151412d8	! t0_kref+0x384:   	sethi	%hi(0x504b6000), %o2
	.word	0x2e800006	! t0_kref+0x388:   	bvs,a	_kref+0x3a0
	.word	0xeb6e401a	! t0_kref+0x38c:   	prefetch	%i1 + %i2, 21
	.word	0xed68a008	! t0_kref+0x390:   	prefetch	%g2 + 8, 22
	.word	0xa22ec009	! t0_kref+0x394:   	andn	%i3, %o1, %l1
	.word	0xa5a68956	! t0_kref+0x398:   	fmuld	%f26, %f22, %f18
	.word	0xd86e4000	! t0_kref+0x39c:   	ldstub	[%i1], %o4
	.word	0xfd1e7ff8	! t0_kref+0x3a0:   	ldd	[%i1 - 8], %f30
	.word	0x947ced69	! t0_kref+0x3a4:   	sdiv	%l3, 0xd69, %o2
	.word	0x8143c000	! t0_kref+0x3a8:   	stbar
	.word	0xec4e7fe5	! t0_kref+0x3ac:   	ldsb	[%i1 - 0x1b], %l6
	.word	0xf1be1814	! t0_kref+0x3b0:   	stda	%f24, [%i0 + %l4]0xc0
	.word	0xe04e3fe7	! t0_kref+0x3b4:   	ldsb	[%i0 - 0x19], %l0
	.word	0xa7227e2f	! t0_kref+0x3b8:   	mulscc	%o1, -0x1d1, %l3
	.word	0xadb50512	! t0_kref+0x3bc:   	fcmpgt16	%f20, %f18, %l6
	.word	0x95b40240	! t0_kref+0x3c0:   	array16	%l0, %g0, %o2
	.word	0xabb00ced	! t0_kref+0x3c4:   	fnot2s	%f13, %f21
	.word	0xf436401b	! t0_kref+0x3c8:   	sth	%i2, [%i1 + %i3]
	.word	0xb6103fec	! t0_kref+0x3cc:   	mov	0xffffffec, %i3
	.word	0xd62e8018	! t0_kref+0x3d0:   	stb	%o3, [%i2 + %i0]
	.word	0x8143c000	! t0_kref+0x3d4:   	stbar
	.word	0xb9a409da	! t0_kref+0x3d8:   	fdivd	%f16, %f26, %f28
	.word	0xa81d7253	! t0_kref+0x3dc:   	xor	%l5, -0xdad, %l4
	.word	0xa3a388bc	! t0_kref+0x3e0:   	fsubs	%f14, %f28, %f17
	.word	0xb9a00532	! t0_kref+0x3e4:   	fsqrts	%f18, %f28
	.word	0x25800008	! t0_kref+0x3e8:   	fblg,a	_kref+0x408
	.word	0xac7a0000	! t0_kref+0x3ec:   	sdiv	%o0, %g0, %l6
	.word	0x31800008	! t0_kref+0x3f0:   	fba,a	_kref+0x410
	.word	0xfdee501b	! t0_kref+0x3f4:   	prefetcha	%i1 + %i3, 30
	.word	0xd06e4000	! t0_kref+0x3f8:   	ldstub	[%i1], %o0
	.word	0xd91e2008	! t0_kref+0x3fc:   	ldd	[%i0 + 8], %f12
	.word	0x85824014	! t0_kref+0x400:   	wr	%o1, %l4, %ccr
	.word	0x81848000	! t0_kref+0x404:   	wr	%l2, %g0, %y
	.word	0x33800004	! t0_kref+0x408:   	fbe,a	_kref+0x418
	.word	0xb1a0013b	! t0_kref+0x40c:   	fabss	%f27, %f24
	.word	0xa1b68d40	! t0_kref+0x410:   	fnot1	%f26, %f16
	.word	0xaee4400a	! t0_kref+0x414:   	subccc	%l1, %o2, %l7
	.word	0xb1a00130	! t0_kref+0x418:   	fabss	%f16, %f24
	.word	0xb1a000b2	! t0_kref+0x41c:   	fnegs	%f18, %f24
	.word	0xbba0189a	! t0_kref+0x420:   	fitos	%f26, %f29
	.word	0x94daefd5	! t0_kref+0x424:   	smulcc	%o3, 0xfd5, %o2
	.word	0xb5a0190d	! t0_kref+0x428:   	fitod	%f13, %f26
	.word	0x9082c00b	! t0_kref+0x42c:   	addcc	%o3, %o3, %o0
	.word	0x83414000	! t0_kref+0x430:   	mov	%pc, %g1
	.word	0x3a480003	! t0_kref+0x434:   	bcc,a,pt	%icc, _kref+0x440
	.word	0xaba0003f	! t0_kref+0x438:   	fmovs	%f31, %f21
	.word	0xdd1f4018	! t0_kref+0x43c:   	ldd	[%i5 + %i0], %f14
	.word	0x9ba000b8	! t0_kref+0x440:   	fnegs	%f24, %f13
	.word	0xafa01a4c	! t0_kref+0x444:   	fdtoi	%f12, %f23
	.word	0x91b24280	! t0_kref+0x448:   	array32	%o1, %g0, %o0
!	.word	0x2f8256eb	! t0_kref+0x44c:   	fbu,a	SYM(t0_subr1)
	   	fbu,a	SYM(t0_subr1)
	.word	0x9e00601c	! t0_kref+0x450:   	add	%g1, 0x1c, %o7
	.word	0x81844000	! t0_kref+0x454:   	wr	%l1, %g0, %y
	.word	0x3f800008	! t0_kref+0x458:   	fbo,a	_kref+0x478
	.word	0xa2742bbb	! t0_kref+0x45c:   	udiv	%l0, 0xbbb, %l1
	.word	0xd00e2004	! t0_kref+0x460:   	ldub	[%i0 + 4], %o0
	.word	0x37800001	! t0_kref+0x464:   	fbge,a	_kref+0x468
	.word	0xada01a36	! t0_kref+0x468:   	fstoi	%f22, %f22
	.word	0x2528dfb0	! t0_kref+0x46c:   	sethi	%hi(0xa37ec000), %l2
	call	SYM(t0_subr3)
	.word	0xe826001c	! t0_kref+0x474:   	st	%l4, [%i0 + %i4]
	.word	0xa9043aec	! t0_kref+0x478:   	taddcc	%l0, -0x514, %l4
	.word	0x28480001	! t0_kref+0x47c:   	bleu,a,pt	%icc, _kref+0x480
	.word	0x902ac016	! t0_kref+0x480:   	andn	%o3, %l6, %o0
	.word	0xd0100018	! t0_kref+0x484:   	lduh	[%g0 + %i0], %o0
	.word	0x9284c00d	! t0_kref+0x488:   	addcc	%l3, %o5, %o1
	.word	0xa91a4009	! t0_kref+0x48c:   	tsubcctv	%o1, %o1, %l4
	.word	0x95b70594	! t0_kref+0x490:   	fcmpgt32	%f28, %f20, %o2
	.word	0x2d20fb78	! t0_kref+0x494:   	sethi	%hi(0x83ede000), %l6
	.word	0xa3a00531	! t0_kref+0x498:   	fsqrts	%f17, %f17
	.word	0xdb062018	! t0_kref+0x49c:   	ld	[%i0 + 0x18], %f13
	.word	0xd7e65013	! t0_kref+0x4a0:   	casa	[%i1]0x80, %l3, %o3
	.word	0xa3b7858c	! t0_kref+0x4a4:   	fcmpgt32	%f30, %f12, %l1
	.word	0xb3b78f7e	! t0_kref+0x4a8:   	fornot1s	%f30, %f30, %f25
	.word	0xf426001c	! t0_kref+0x4ac:   	st	%i2, [%i0 + %i4]
	.word	0xa3a708ba	! t0_kref+0x4b0:   	fsubs	%f28, %f26, %f17
	.word	0xecc71018	! t0_kref+0x4b4:   	ldswa	[%i4 + %i0]0x80, %l6
	.word	0xb5a388ad	! t0_kref+0x4b8:   	fsubs	%f14, %f13, %f26
	.word	0xbfa01a2d	! t0_kref+0x4bc:   	fstoi	%f13, %f31
	.word	0x8143c000	! t0_kref+0x4c0:   	stbar
	.word	0xa12ae00b	! t0_kref+0x4c4:   	sll	%o3, 0xb, %l0
	.word	0xa7b40240	! t0_kref+0x4c8:   	array16	%l0, %g0, %l3
	.word	0xbda38d31	! t0_kref+0x4cc:   	fsmuld	%f14, %f17, %f30
	.word	0xab3e8015	! t0_kref+0x4d0:   	sra	%i2, %l5, %l5
	.word	0xaa843712	! t0_kref+0x4d4:   	addcc	%l0, -0x8ee, %l5
	.word	0xeb68a041	! t0_kref+0x4d8:   	prefetch	%g2 + 0x41, 21
	.word	0xd2780018	! t0_kref+0x4dc:   	swap	[%g0 + %i0], %o1
	.word	0x34800008	! t0_kref+0x4e0:   	bg,a	_kref+0x500
	.word	0xb9a0055e	! t0_kref+0x4e4:   	fsqrtd	%f30, %f28
	.word	0xe6200019	! t0_kref+0x4e8:   	st	%l3, [%g0 + %i1]
	.word	0xd4700018	! t0_kref+0x4ec:   	stx	%o2, [%g0 + %i0]
	.word	0xbda0189d	! t0_kref+0x4f0:   	fitos	%f29, %f30
	.word	0xb9b40c8e	! t0_kref+0x4f4:   	fandnot2	%f16, %f14, %f28
	.word	0xaa853b0d	! t0_kref+0x4f8:   	addcc	%l4, -0x4f3, %l5
	.word	0xed68a00d	! t0_kref+0x4fc:   	prefetch	%g2 + 0xd, 22
	.word	0xabb00776	! t0_kref+0x500:   	fpack16	%f22, %f21
	.word	0x81af4a3b	! t0_kref+0x504:   	fcmps	%fcc0, %f29, %f27
	.word	0xadb5ca36	! t0_kref+0x508:   	fpadd16s	%f23, %f22, %f22
	.word	0xbdb00c20	! t0_kref+0x50c:   	fzeros	%f30
	.word	0xb1b7ca37	! t0_kref+0x510:   	fpadd16s	%f31, %f23, %f24
	.word	0xeaae1000	! t0_kref+0x514:   	stba	%l5, [%i0]0x80
	.word	0xa3a01895	! t0_kref+0x518:   	fitos	%f21, %f17
	.word	0xe44e201c	! t0_kref+0x51c:   	ldsb	[%i0 + 0x1c], %l2
	.word	0x9de3bfa0	! t0_kref+0x520:   	save	%sp, -0x60, %sp
	.word	0x91ef401d	! t0_kref+0x524:   	restore	%i5, %i5, %o0
	.word	0xaba01a3f	! t0_kref+0x528:   	fstoi	%f31, %f21
	.word	0x27286371	! t0_kref+0x52c:   	sethi	%hi(0xa18dc400), %l3
	.word	0xda6e8018	! t0_kref+0x530:   	ldstub	[%i2 + %i0], %o5
	.word	0xa3b30011	! t0_kref+0x534:   	edge8	%o4, %l1, %l1
	.word	0xa2adc017	! t0_kref+0x538:   	andncc	%l7, %l7, %l1
	.word	0xec6e3fed	! t0_kref+0x53c:   	ldstub	[%i0 - 0x13], %l6
	.word	0x9fc00004	! t0_kref+0x540:   	call	%g0 + %g4
	.word	0x81db0004	! t0_kref+0x544:   	flush	%o4 + %g4
	.word	0x86102002	! t0_kref+0x548:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x54c:   	bne,a	_kref+0x54c
	.word	0x86a0e001	! t0_kref+0x550:   	subcc	%g3, 1, %g3
	.word	0xbdb78ace	! t0_kref+0x554:   	fpsub32	%f30, %f14, %f30
	.word	0xa2f28008	! t0_kref+0x558:   	udivcc	%o2, %o0, %l1
	.word	0xa7a00533	! t0_kref+0x55c:   	fsqrts	%f19, %f19
	.word	0xf62e601a	! t0_kref+0x560:   	stb	%i3, [%i1 + 0x1a]
	.word	0xa5400000	! t0_kref+0x564:   	mov	%y, %l2
	.word	0xa33a6014	! t0_kref+0x568:   	sra	%o1, 0x14, %l1
	.word	0x28480005	! t0_kref+0x56c:   	bleu,a,pt	%icc, _kref+0x580
	.word	0xa528000c	! t0_kref+0x570:   	sll	%g0, %o4, %l2
	.word	0xa205eb9c	! t0_kref+0x574:   	add	%l7, 0xb9c, %l1
	.word	0x38480002	! t0_kref+0x578:   	bgu,a,pt	%icc, _kref+0x580
	.word	0xb9b50e7a	! t0_kref+0x57c:   	fxnors	%f20, %f26, %f28
	.word	0xb9b60d90	! t0_kref+0x580:   	fxor	%f24, %f16, %f28
	.word	0xac8eee80	! t0_kref+0x584:   	andcc	%i3, 0xe80, %l6
	.word	0xa5b50036	! t0_kref+0x588:   	edge8n	%l4, %l6, %l2
	.word	0xa0deb968	! t0_kref+0x58c:   	smulcc	%i2, -0x698, %l0
	.word	0xafa388b9	! t0_kref+0x590:   	fsubs	%f14, %f25, %f23
	.word	0x99b38f90	! t0_kref+0x594:   	for	%f14, %f16, %f12
	.word	0xa5a44d32	! t0_kref+0x598:   	fsmuld	%f17, %f18, %f18
	.word	0xee0e2017	! t0_kref+0x59c:   	ldub	[%i0 + 0x17], %l7
	.word	0x9da0193d	! t0_kref+0x5a0:   	fstod	%f29, %f14
	.word	0xada00130	! t0_kref+0x5a4:   	fabss	%f16, %f22
	.word	0xbfb74f7f	! t0_kref+0x5a8:   	fornot1s	%f29, %f31, %f31
	.word	0xb1a01935	! t0_kref+0x5ac:   	fstod	%f21, %f24
	.word	0xbdb30f5e	! t0_kref+0x5b0:   	fornot1	%f12, %f30, %f30
	.word	0xb1a0193b	! t0_kref+0x5b4:   	fstod	%f27, %f24
	.word	0xeac81018	! t0_kref+0x5b8:   	ldsba	[%g0 + %i0]0x80, %l5
	.word	0x3d480007	! t0_kref+0x5bc:   	fbule,a,pt	%fcc0, _kref+0x5d8
	.word	0xa72c2016	! t0_kref+0x5c0:   	sll	%l0, 0x16, %l3
	.word	0xb3a00138	! t0_kref+0x5c4:   	fabss	%f24, %f25
	.word	0xa3a0053f	! t0_kref+0x5c8:   	fsqrts	%f31, %f17
	.word	0xa1a0193b	! t0_kref+0x5cc:   	fstod	%f27, %f16
	.word	0xbdb48d1a	! t0_kref+0x5d0:   	fandnot1	%f18, %f26, %f30
	.word	0x9da01110	! t0_kref+0x5d4:   	fxtod	%f16, %f14
	.word	0x31480004	! t0_kref+0x5d8:   	fba,a,pt	%fcc0, _kref+0x5e8
	.word	0x8582c000	! t0_kref+0x5dc:   	wr	%o3, %g0, %ccr
	.word	0x81840000	! t0_kref+0x5e0:   	wr	%l0, %g0, %y
	.word	0x1310a769	! t0_kref+0x5e4:   	sethi	%hi(0x429da400), %o1
	.word	0xe2070018	! t0_kref+0x5e8:   	ld	[%i4 + %i0], %l1
	.word	0xbda000ad	! t0_kref+0x5ec:   	fnegs	%f13, %f30
	.word	0x81ae8a54	! t0_kref+0x5f0:   	fcmpd	%fcc0, %f26, %f20
	.word	0xe1be5896	! t0_kref+0x5f4:   	stda	%f16, [%i1 + %l6]0xc4
	.word	0x81ac4a31	! t0_kref+0x5f8:   	fcmps	%fcc0, %f17, %f17
	.word	0xa7b2c32b	! t0_kref+0x5fc:   	bmask	%o3, %o3, %l3
	.word	0x99b58acc	! t0_kref+0x600:   	fpsub32	%f22, %f12, %f12
	.word	0xdb263fec	! t0_kref+0x604:   	st	%f13, [%i0 - 0x14]
	.word	0x3b800004	! t0_kref+0x608:   	fble,a	_kref+0x618
	.word	0x23302426	! t0_kref+0x60c:   	sethi	%hi(0xc0909800), %l1
	.word	0xb7b3cdbf	! t0_kref+0x610:   	fxors	%f15, %f31, %f27
	.word	0x9fc00004	! t0_kref+0x614:   	call	%g0 + %g4
	.word	0x9003401c	! t0_kref+0x618:   	add	%o5, %i4, %o0
	.word	0x81af0aad	! t0_kref+0x61c:   	fcmpes	%fcc0, %f28, %f13
	.word	0x20480001	! t0_kref+0x620:   	bn,a,pt	%icc, _kref+0x624
	.word	0xad400000	! t0_kref+0x624:   	mov	%y, %l6
	.word	0xf83e001d	! t0_kref+0x628:   	std	%i4, [%i0 + %i5]
	.word	0xbda40952	! t0_kref+0x62c:   	fmuld	%f16, %f18, %f30
	.word	0xe07f0019	! t0_kref+0x630:   	swap	[%i4 + %i1], %l0
	.word	0xadb68a16	! t0_kref+0x634:   	fpadd16	%f26, %f22, %f22
	.word	0x93b3006d	! t0_kref+0x638:   	edge8ln	%o4, %o5, %o1
	.word	0xadb3407b	! t0_kref+0x63c:   	edge8ln	%o5, %i3, %l6
	.word	0xec5e7ff0	! t0_kref+0x640:   	ldx	[%i1 - 0x10], %l6
	.word	0x8143c000	! t0_kref+0x644:   	stbar
	.word	0xbba488b0	! t0_kref+0x648:   	fsubs	%f18, %f16, %f29
	.word	0xb7b68d60	! t0_kref+0x64c:   	fnot1s	%f26, %f27
	.word	0xe416200a	! t0_kref+0x650:   	lduh	[%i0 + 0xa], %l2
	.word	0xb5b30c9e	! t0_kref+0x654:   	fandnot2	%f12, %f30, %f26
	.word	0x27800002	! t0_kref+0x658:   	fbul,a	_kref+0x660
	.word	0xa655692b	! t0_kref+0x65c:   	umul	%l5, 0x92b, %l3
	.word	0xafb3cc73	! t0_kref+0x660:   	fnors	%f15, %f19, %f23
	.word	0x81848000	! t0_kref+0x664:   	wr	%l2, %g0, %y
	.word	0x928020d7	! t0_kref+0x668:   	addcc	%g0, 0xd7, %o1
	.word	0xbdb44e71	! t0_kref+0x66c:   	fxnors	%f17, %f17, %f30
	.word	0xaa547900	! t0_kref+0x670:   	umul	%l1, -0x700, %l5
	.word	0xe47e001c	! t0_kref+0x674:   	swap	[%i0 + %i4], %l2
	.word	0xbda01930	! t0_kref+0x678:   	fstod	%f16, %f30
	.word	0xe2567ff4	! t0_kref+0x67c:   	ldsh	[%i1 - 0xc], %l1
	.word	0x37480007	! t0_kref+0x680:   	fbge,a,pt	%fcc0, _kref+0x69c
	.word	0xa2a6b087	! t0_kref+0x684:   	subcc	%i2, -0xf79, %l1
	.word	0xb3a00538	! t0_kref+0x688:   	fsqrts	%f24, %f25
	.word	0x9076801b	! t0_kref+0x68c:   	udiv	%i2, %i3, %o0
	.word	0x35800005	! t0_kref+0x690:   	fbue,a	_kref+0x6a4
	.word	0xe96e001d	! t0_kref+0x694:   	prefetch	%i0 + %i5, 20
	.word	0xace00012	! t0_kref+0x698:   	subccc	%g0, %l2, %l6
	.word	0x32480003	! t0_kref+0x69c:   	bne,a,pt	%icc, _kref+0x6a8
	.word	0x8143c000	! t0_kref+0x6a0:   	stbar
	.word	0xb7b00f3a	! t0_kref+0x6a4:   	fsrc2s	%f26, %f27
	.word	0x94256e84	! t0_kref+0x6a8:   	sub	%l5, 0xe84, %o2
	.word	0xa086efb7	! t0_kref+0x6ac:   	addcc	%i3, 0xfb7, %l0
	.word	0xadb60492	! t0_kref+0x6b0:   	fcmple32	%f24, %f18, %l6
	.word	0xb1b30a18	! t0_kref+0x6b4:   	fpadd16	%f12, %f24, %f24
	.word	0xa5b48598	! t0_kref+0x6b8:   	fcmpgt32	%f18, %f24, %l2
	.word	0x9db30dce	! t0_kref+0x6bc:   	fnand	%f12, %f14, %f14
	.word	0x81ae0aad	! t0_kref+0x6c0:   	fcmpes	%fcc0, %f24, %f13
	.word	0x8143c000	! t0_kref+0x6c4:   	stbar
	.word	0xec3e7ff8	! t0_kref+0x6c8:   	std	%l6, [%i1 - 8]
	.word	0x81def804	! t0_kref+0x6cc:   	flush	%i3 - 0x7fc
	.word	0xa9b6c280	! t0_kref+0x6d0:   	array32	%i3, %g0, %l4
	.word	0x30800002	! t0_kref+0x6d4:   	ba,a	_kref+0x6dc
	.word	0xe7ee501b	! t0_kref+0x6d8:   	prefetcha	%i1 + %i3, 19
	.word	0xaedb400c	! t0_kref+0x6dc:   	smulcc	%o5, %o4, %l7
	.word	0xe3066008	! t0_kref+0x6e0:   	ld	[%i1 + 8], %f17
	.word	0xb5a00158	! t0_kref+0x6e4:   	fabsd	%f24, %f26
	.word	0xa5b24200	! t0_kref+0x6e8:   	array8	%o1, %g0, %l2
	.word	0xb5a01a52	! t0_kref+0x6ec:   	fdtoi	%f18, %f26
	.word	0xd0780018	! t0_kref+0x6f0:   	swap	[%g0 + %i0], %o0
	.word	0xaa3aefe7	! t0_kref+0x6f4:   	xnor	%o3, 0xfe7, %l5
	.word	0x81ac8a32	! t0_kref+0x6f8:   	fcmps	%fcc0, %f18, %f18
	.word	0xa83a0010	! t0_kref+0x6fc:   	xnor	%o0, %l0, %l4
	.word	0xa6282c73	! t0_kref+0x700:   	andn	%g0, 0xc73, %l3
	.word	0xa40d8010	! t0_kref+0x704:   	and	%l6, %l0, %l2
	call	SYM(t0_subr3)
	.word	0xa8a7001b	! t0_kref+0x70c:   	subcc	%i4, %i3, %l4
	.word	0xa203401c	! t0_kref+0x710:   	add	%o5, %i4, %l1
	.word	0xa49d4008	! t0_kref+0x714:   	xorcc	%l5, %o0, %l2
	.word	0xd62e4000	! t0_kref+0x718:   	stb	%o3, [%i1]
	.word	0x29480001	! t0_kref+0x71c:   	fbl,a,pt	%fcc0, _kref+0x720
	.word	0xb9a00136	! t0_kref+0x720:   	fabss	%f22, %f28
	.word	0xaef6c017	! t0_kref+0x724:   	udivcc	%i3, %l7, %l7
	.word	0xbba0188f	! t0_kref+0x728:   	fitos	%f15, %f29
	.word	0xa7a01897	! t0_kref+0x72c:   	fitos	%f23, %f19
	.word	0xa69d000d	! t0_kref+0x730:   	xorcc	%l4, %o5, %l3
	.word	0xb1a70954	! t0_kref+0x734:   	fmuld	%f28, %f20, %f24
	.word	0xda6e2009	! t0_kref+0x738:   	ldstub	[%i0 + 9], %o5
	.word	0xafb4845a	! t0_kref+0x73c:   	fcmpne16	%f18, %f26, %l7
	.word	0xd3e65016	! t0_kref+0x740:   	casa	[%i1]0x80, %l6, %o1
	.word	0xa5a01931	! t0_kref+0x744:   	fstod	%f17, %f18
	.word	0xd44e3fe5	! t0_kref+0x748:   	ldsb	[%i0 - 0x1b], %o2
	.word	0xa9b60ada	! t0_kref+0x74c:   	fpsub32	%f24, %f26, %f20
	.word	0x2d0b3857	! t0_kref+0x750:   	sethi	%hi(0x2ce15c00), %l6
	.word	0x35800005	! t0_kref+0x754:   	fbue,a	_kref+0x768
	.word	0xb9a000b2	! t0_kref+0x758:   	fnegs	%f18, %f28
	.word	0x81ad8a4c	! t0_kref+0x75c:   	fcmpd	%fcc0, %f22, %f12
	.word	0x95b000b0	! t0_kref+0x760:   	edge16n	%g0, %l0, %o2
	.word	0xb9a0012f	! t0_kref+0x764:   	fabss	%f15, %f28
	.word	0xa7b60a30	! t0_kref+0x768:   	fpadd16s	%f24, %f16, %f19
	.word	0xd42e7fe3	! t0_kref+0x76c:   	stb	%o2, [%i1 - 0x1d]
	.word	0x9005c00b	! t0_kref+0x770:   	add	%l7, %o3, %o0
	.word	0x932d6004	! t0_kref+0x774:   	sll	%l5, 0x4, %o1
	.word	0x81ac0ab1	! t0_kref+0x778:   	fcmpes	%fcc0, %f16, %f17
	.word	0x9064c011	! t0_kref+0x77c:   	subc	%l3, %l1, %o0
	.word	0xe416201c	! t0_kref+0x780:   	lduh	[%i0 + 0x1c], %l2
	.word	0x35480001	! t0_kref+0x784:   	fbue,a,pt	%fcc0, _kref+0x788
	.word	0xbda01894	! t0_kref+0x788:   	fitos	%f20, %f30
	.word	0xa5a5895a	! t0_kref+0x78c:   	fmuld	%f22, %f26, %f18
	.word	0xf99e7fec	! t0_kref+0x790:   	ldda	[%i1 - 0x14]%asi, %f28
	.word	0xb1b58971	! t0_kref+0x794:   	fpmerge	%f22, %f17, %f24
	.word	0x9de3bfa0	! t0_kref+0x798:   	save	%sp, -0x60, %sp
	.word	0xa3eeadfc	! t0_kref+0x79c:   	restore	%i2, 0xdfc, %l1
	.word	0xac042465	! t0_kref+0x7a0:   	add	%l0, 0x465, %l6
	.word	0xd6e81018	! t0_kref+0x7a4:   	ldstuba	[%g0 + %i0]0x80, %o3
	.word	0xb7a01a31	! t0_kref+0x7a8:   	fstoi	%f17, %f27
	.word	0x8610200b	! t0_kref+0x7ac:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x7b0:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x7b4:   	be,a	_kref+0x7d8
	.word	0xaef2ad86	! t0_kref+0x7b8:   	udivcc	%o2, 0xd86, %l7
	.word	0x31480004	! t0_kref+0x7bc:   	fba,a,pt	%fcc0, _kref+0x7cc
	.word	0xb1a74d39	! t0_kref+0x7c0:   	fsmuld	%f29, %f25, %f24
	.word	0xadb68990	! t0_kref+0x7c4:   	bshuffle	%f26, %f16, %f22
	.word	0xb9a01938	! t0_kref+0x7c8:   	fstod	%f24, %f28
	.word	0x9004801c	! t0_kref+0x7cc:   	add	%l2, %i4, %o0
	.word	0xbfb00c20	! t0_kref+0x7d0:   	fzeros	%f31
	.word	0xf586501c	! t0_kref+0x7d4:   	lda	[%i1 + %i4]0x80, %f26
	.word	0xa3b4859a	! t0_kref+0x7d8:   	fcmpgt32	%f18, %f26, %l1
	.word	0x2f800007	! t0_kref+0x7dc:   	fbu,a	_kref+0x7f8
	.word	0x95b34200	! t0_kref+0x7e0:   	array8	%o5, %g0, %o2
	.word	0xe41e001d	! t0_kref+0x7e4:   	ldd	[%i0 + %i5], %l2
	.word	0x81afcabe	! t0_kref+0x7e8:   	fcmpes	%fcc0, %f31, %f30
	.word	0xada0003a	! t0_kref+0x7ec:   	fmovs	%f26, %f22
	.word	0x99a00552	! t0_kref+0x7f0:   	fsqrtd	%f18, %f12
	.word	0x94748013	! t0_kref+0x7f4:   	udiv	%l2, %l3, %o2
	.word	0xaa12c011	! t0_kref+0x7f8:   	or	%o3, %l1, %l5
	.word	0x95230008	! t0_kref+0x7fc:   	mulscc	%o4, %o0, %o2
	.word	0x90754010	! t0_kref+0x800:   	udiv	%l5, %l0, %o0
	.word	0x94736e1b	! t0_kref+0x804:   	udiv	%o5, 0xe1b, %o2
	.word	0xa1a0055e	! t0_kref+0x808:   	fsqrtd	%f30, %f16
	.word	0xad65c00b	! t0_kref+0x80c:   	movvs	%icc, %o3, %l6
	.word	0x90830016	! t0_kref+0x810:   	addcc	%o4, %l6, %o0
	.word	0x8143e040	! t0_kref+0x814:   	membar	0x40
	.word	0xd8b6101b	! t0_kref+0x818:   	stha	%o4, [%i0 + %i3]0x80
	.word	0xbda4482d	! t0_kref+0x81c:   	fadds	%f17, %f13, %f30
	.word	0xa4350015	! t0_kref+0x820:   	orn	%l4, %l5, %l2
	.word	0x9fc10000	! t0_kref+0x824:   	call	%g4
	.word	0xf4be501d	! t0_kref+0x828:   	stda	%i2, [%i1 + %i5]0x80
	.word	0xa0853955	! t0_kref+0x82c:   	addcc	%l4, -0x6ab, %l0
	.word	0xed68a041	! t0_kref+0x830:   	prefetch	%g2 + 0x41, 22
	.word	0xbba7883c	! t0_kref+0x834:   	fadds	%f30, %f28, %f29
	.word	0xa6f6b14b	! t0_kref+0x838:   	udivcc	%i2, -0xeb5, %l3
	.word	0xb5b3cab8	! t0_kref+0x83c:   	fpsub16s	%f15, %f24, %f26
	.word	0xa63eb41b	! t0_kref+0x840:   	xnor	%i2, -0xbe5, %l3
	.word	0x94c024c2	! t0_kref+0x844:   	addccc	%g0, 0x4c2, %o2
	.word	0xc368a007	! t0_kref+0x848:   	prefetch	%g2 + 7, 1
	.word	0xa7a01a52	! t0_kref+0x84c:   	fdtoi	%f18, %f19
	.word	0x81ad0abe	! t0_kref+0x850:   	fcmpes	%fcc0, %f20, %f30
	.word	0xac7c216a	! t0_kref+0x854:   	sdiv	%l0, 0x16a, %l6
	.word	0xafa0012f	! t0_kref+0x858:   	fabss	%f15, %f23
	.word	0xa016c008	! t0_kref+0x85c:   	or	%i3, %o0, %l0
	.word	0xae7a8016	! t0_kref+0x860:   	sdiv	%o2, %l6, %l7
	.word	0xb5a48d3a	! t0_kref+0x864:   	fsmuld	%f18, %f26, %f26
	.word	0x2d800006	! t0_kref+0x868:   	fbg,a	_kref+0x880
	.word	0xa3b5c0b3	! t0_kref+0x86c:   	edge16n	%l7, %l3, %l1
	.word	0x9db487d8	! t0_kref+0x870:   	pdist	%f18, %f24, %f14
	.word	0xa2dcc014	! t0_kref+0x874:   	smulcc	%l3, %l4, %l1
	.word	0x99a01056	! t0_kref+0x878:   	fdtox	%f22, %f12
	.word	0xa9a38850	! t0_kref+0x87c:   	faddd	%f14, %f16, %f20
	.word	0xaba00536	! t0_kref+0x880:   	fsqrts	%f22, %f21
	.word	0xaa744008	! t0_kref+0x884:   	udiv	%l1, %o0, %l5
	.word	0x8143c000	! t0_kref+0x888:   	stbar
	.word	0xab64a3b4	! t0_kref+0x88c:   	movle	%icc, 0x3b4, %l5
	.word	0xac154000	! t0_kref+0x890:   	or	%l5, %g0, %l6
	.word	0xb7a6c8bc	! t0_kref+0x894:   	fsubs	%f27, %f28, %f27
	.word	0xaba68830	! t0_kref+0x898:   	fadds	%f26, %f16, %f21
	.word	0xa9b60dde	! t0_kref+0x89c:   	fnand	%f24, %f30, %f20
	.word	0x9da00539	! t0_kref+0x8a0:   	fsqrts	%f25, %f14
	.word	0x925cc00d	! t0_kref+0x8a4:   	smul	%l3, %o5, %o1
	.word	0xa7a6c830	! t0_kref+0x8a8:   	fadds	%f27, %f16, %f19
	.word	0xa4533d53	! t0_kref+0x8ac:   	umul	%o4, -0x2ad, %l2
	.word	0xa28ee94c	! t0_kref+0x8b0:   	andcc	%i3, 0x94c, %l1
	.word	0x9da7885a	! t0_kref+0x8b4:   	faddd	%f30, %f26, %f14
	.word	0xab222541	! t0_kref+0x8b8:   	mulscc	%o0, 0x541, %l5
	.word	0xf82e7ffa	! t0_kref+0x8bc:   	stb	%i4, [%i1 - 6]
	.word	0x8143c000	! t0_kref+0x8c0:   	stbar
	.word	0x9da508ba	! t0_kref+0x8c4:   	fsubs	%f20, %f26, %f14
	.word	0xf51e4000	! t0_kref+0x8c8:   	ldd	[%i1], %f26
	.word	0x905d0009	! t0_kref+0x8cc:   	smul	%l4, %o1, %o0
	.word	0xafa0053e	! t0_kref+0x8d0:   	fsqrts	%f30, %f23
	.word	0x8610200b	! t0_kref+0x8d4:   	mov	0xb, %g3
	.word	0x86a0e001	! t0_kref+0x8d8:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x8dc:   	be,a	_kref+0x930
	.word	0xad44c000	! t0_kref+0x8e0:   	mov	%gsr, %l6
	.word	0xb5b68ddc	! t0_kref+0x8e4:   	fnand	%f26, %f28, %f26
	.word	0x254ffffc	! t0_kref+0x8e8:   	fblg,a,pt	%fcc0, _kref+0x8d8
	.word	0xda7e6004	! t0_kref+0x8ec:   	swap	[%i1 + 4], %o5
	.word	0xac9f22a7	! t0_kref+0x8f0:   	xorcc	%i4, 0x2a7, %l6
	.word	0x90f22f02	! t0_kref+0x8f4:   	udivcc	%o0, 0xf02, %o0
	.word	0xa5b58028	! t0_kref+0x8f8:   	edge8n	%l6, %o0, %l2
	.word	0xe24e3fe8	! t0_kref+0x8fc:   	ldsb	[%i0 - 0x18], %l1
	.word	0xaa1d800b	! t0_kref+0x900:   	xor	%l6, %o3, %l5
	.word	0xa206e704	! t0_kref+0x904:   	add	%i3, 0x704, %l1
	.word	0xae982334	! t0_kref+0x908:   	xorcc	%g0, 0x334, %l7
	.word	0xaf400000	! t0_kref+0x90c:   	mov	%y, %l7
	.word	0xafa60832	! t0_kref+0x910:   	fadds	%f24, %f18, %f23
	.word	0xa2568015	! t0_kref+0x914:   	umul	%i2, %l5, %l1
	.word	0x81ae0ad6	! t0_kref+0x918:   	fcmped	%fcc0, %f24, %f22
	.word	0xd03e3fe8	! t0_kref+0x91c:   	std	%o0, [%i0 - 0x18]
	.word	0xbda488ce	! t0_kref+0x920:   	fsubd	%f18, %f14, %f30
	.word	0xa0d739a8	! t0_kref+0x924:   	umulcc	%i4, -0x658, %l0
	.word	0x26480004	! t0_kref+0x928:   	bl,a,pt	%icc, _kref+0x938
	.word	0xed1e0000	! t0_kref+0x92c:   	ldd	[%i0], %f22
	.word	0x3c480002	! t0_kref+0x930:   	bpos,a,pt	%icc, _kref+0x938
	.word	0xb9a00552	! t0_kref+0x934:   	fsqrtd	%f18, %f28
	.word	0x86102004	! t0_kref+0x938:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x93c:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x940:   	be,a	_kref+0x960
	.word	0xbda01a3c	! t0_kref+0x944:   	fstoi	%f28, %f30
	.word	0xaca5401b	! t0_kref+0x948:   	subcc	%l5, %i3, %l6
	.word	0x9da00538	! t0_kref+0x94c:   	fsqrts	%f24, %f14
	.word	0xe4e81018	! t0_kref+0x950:   	ldstuba	[%g0 + %i0]0x80, %l2
	.word	0xe19f5a58	! t0_kref+0x954:   	ldda	[%i5 + %i0]0xd2, %f16
	.word	0xe85e2018	! t0_kref+0x958:   	ldx	[%i0 + 0x18], %l4
	.word	0x81800000	! t0_kref+0x95c:   	mov	%g0, %y
	.word	0x81ac0ab0	! t0_kref+0x960:   	fcmpes	%fcc0, %f16, %f16
	.word	0xeb063fe4	! t0_kref+0x964:   	ld	[%i0 - 0x1c], %f21
	.word	0xf320a01c	! t0_kref+0x968:   	st	%f25, [%g2 + 0x1c]
	.word	0x22800008	! t0_kref+0x96c:   	be,a	_kref+0x98c
	.word	0xc36e6018	! t0_kref+0x970:   	prefetch	%i1 + 0x18, 1
	.word	0xa7b20329	! t0_kref+0x974:   	bmask	%o0, %o1, %l3
	.word	0xae1560ea	! t0_kref+0x978:   	or	%l5, 0xea, %l7
	.word	0xa07caef4	! t0_kref+0x97c:   	sdiv	%l2, 0xef4, %l0
	.word	0xa1a01933	! t0_kref+0x980:   	fstod	%f19, %f16
	.word	0xd406401c	! t0_kref+0x984:   	ld	[%i1 + %i4], %o2
	.word	0x9215401c	! t0_kref+0x988:   	or	%l5, %i4, %o1
	.word	0xe56e401c	! t0_kref+0x98c:   	prefetch	%i1 + %i4, 18
	.word	0xe91e401d	! t0_kref+0x990:   	ldd	[%i1 + %i5], %f20
	.word	0xe1be5852	! t0_kref+0x994:   	stda	%f16, [%i1 + %l2]0xc2
	.word	0x86102015	! t0_kref+0x998:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x99c:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x9a0:   	be,a	_kref+0x9d0
	.word	0x81dda7fc	! t0_kref+0x9a4:   	flush	%l6 + 0x7fc
	.word	0x2cbffffd	! t0_kref+0x9a8:   	bneg,a	_kref+0x99c
	.word	0xd6263ff8	! t0_kref+0x9ac:   	st	%o3, [%i0 - 8]
	.word	0xb9a588dc	! t0_kref+0x9b0:   	fsubd	%f22, %f28, %f28
	.word	0xbda000be	! t0_kref+0x9b4:   	fnegs	%f30, %f30
	.word	0x2b0a9b7f	! t0_kref+0x9b8:   	sethi	%hi(0x2a6dfc00), %l5
	.word	0xc12e401c	! t0_kref+0x9bc:   	st	%fsr, [%i1 + %i4]
	.word	0xb3a0013b	! t0_kref+0x9c0:   	fabss	%f27, %f25
	.word	0xaf702465	! t0_kref+0x9c4:   	popc	0x465, %l7
	.word	0xa23e801c	! t0_kref+0x9c8:   	xnor	%i2, %i4, %l1
	.word	0xbda48956	! t0_kref+0x9cc:   	fmuld	%f18, %f22, %f30
	.word	0x902225e4	! t0_kref+0x9d0:   	sub	%o0, 0x5e4, %o0
	.word	0xaa048017	! t0_kref+0x9d4:   	add	%l2, %l7, %l5
	.word	0xf426200c	! t0_kref+0x9d8:   	st	%i2, [%i0 + 0xc]
	call	SYM(t0_subr1)
	.word	0xaa8dc01c	! t0_kref+0x9e0:   	andcc	%l7, %i4, %l5
	.word	0x81820000	! t0_kref+0x9e4:   	wr	%o0, %g0, %y
	.word	0xed1e2010	! t0_kref+0x9e8:   	ldd	[%i0 + 0x10], %f22
	.word	0xfd180018	! t0_kref+0x9ec:   	ldd	[%g0 + %i0], %f30
	.word	0xaed4801b	! t0_kref+0x9f0:   	umulcc	%l2, %i3, %l7
	.word	0xa49d4017	! t0_kref+0x9f4:   	xorcc	%l5, %l7, %l2
	.word	0xe616600e	! t0_kref+0x9f8:   	lduh	[%i1 + 0xe], %l3
	.word	0x81ad0a58	! t0_kref+0x9fc:   	fcmpd	%fcc0, %f20, %f24
	.word	0xe44e401a	! t0_kref+0xa00:   	ldsb	[%i1 + %i2], %l2
	.word	0xe20e8019	! t0_kref+0xa04:   	ldub	[%i2 + %i1], %l1
	.word	0xa4bf0010	! t0_kref+0xa08:   	xnorcc	%i4, %l0, %l2
	.word	0xaaf4000b	! t0_kref+0xa0c:   	udivcc	%l0, %o3, %l5
	.word	0xb1a000b2	! t0_kref+0xa10:   	fnegs	%f18, %f24
	.word	0x9de3bfa0	! t0_kref+0xa14:   	save	%sp, -0x60, %sp
	.word	0x93eeb9b5	! t0_kref+0xa18:   	restore	%i2, -0x64b, %o1
	.word	0xb5b486f0	! t0_kref+0xa1c:   	fmul8ulx16	%f18, %f16, %f26
	.word	0x24800004	! t0_kref+0xa20:   	ble,a	_kref+0xa30
	.word	0x923dfb58	! t0_kref+0xa24:   	xnor	%l7, -0x4a8, %o1
	.word	0x24480001	! t0_kref+0xa28:   	ble,a,pt	%icc, _kref+0xa2c
	.word	0xe09e101d	! t0_kref+0xa2c:   	ldda	[%i0 + %i5]0x80, %l0
	.word	0xb9b5098c	! t0_kref+0xa30:   	bshuffle	%f20, %f12, %f28
	.word	0x9da01032	! t0_kref+0xa34:   	fstox	%f18, %f14
	.word	0xb1b00cd0	! t0_kref+0xa38:   	fnot2	%f16, %f24
	.word	0xd00e0000	! t0_kref+0xa3c:   	ldub	[%i0], %o0
	.word	0xa9a44d32	! t0_kref+0xa40:   	fsmuld	%f17, %f18, %f20
	.word	0xa3a0013b	! t0_kref+0xa44:   	fabss	%f27, %f17
	.word	0x81ad8ab5	! t0_kref+0xa48:   	fcmpes	%fcc0, %f22, %f21
	.word	0xa05e801b	! t0_kref+0xa4c:   	smul	%i2, %i3, %l0
	.word	0xa5a01910	! t0_kref+0xa50:   	fitod	%f16, %f18
	.word	0xb9a38d3c	! t0_kref+0xa54:   	fsmuld	%f14, %f28, %f28
	.word	0x9ba0013d	! t0_kref+0xa58:   	fabss	%f29, %f13
	.word	0x24800002	! t0_kref+0xa5c:   	ble,a	_kref+0xa64
	.word	0xc06e3feb	! t0_kref+0xa60:   	ldstub	[%i0 - 0x15], %g0
	.word	0xb5b5cd60	! t0_kref+0xa64:   	fnot1s	%f23, %f26
	.word	0xe91e3fe0	! t0_kref+0xa68:   	ldd	[%i0 - 0x20], %f20
	.word	0xdb865000	! t0_kref+0xa6c:   	lda	[%i1]0x80, %f13
	.word	0xee266008	! t0_kref+0xa70:   	st	%l7, [%i1 + 8]
	.word	0x925ae618	! t0_kref+0xa74:   	smul	%o3, 0x618, %o1
	.word	0xc0280019	! t0_kref+0xa78:   	clrb	[%g0 + %i1]
	.word	0xa5700016	! t0_kref+0xa7c:   	popc	%l6, %l2
	.word	0xea067fec	! t0_kref+0xa80:   	ld	[%i1 - 0x14], %l5
	.word	0xb5a0013a	! t0_kref+0xa84:   	fabss	%f26, %f26
	.word	0xdf86101c	! t0_kref+0xa88:   	lda	[%i0 + %i4]0x80, %f15
	.word	0xe6366012	! t0_kref+0xa8c:   	sth	%l3, [%i1 + 0x12]
	.word	0xa5a3cd32	! t0_kref+0xa90:   	fsmuld	%f15, %f18, %f18
	.word	0xe62e001a	! t0_kref+0xa94:   	stb	%l3, [%i0 + %i2]
	.word	0xa7828011	! t0_kref+0xa98:   	wr	%o2, %l1, %gsr
	.word	0xa8e4401a	! t0_kref+0xa9c:   	subccc	%l1, %i2, %l4
	.word	0xa4fa4009	! t0_kref+0xaa0:   	sdivcc	%o1, %o1, %l2
	.word	0x81844000	! t0_kref+0xaa4:   	wr	%l1, %g0, %y
	.word	0xd228a020	! t0_kref+0xaa8:   	stb	%o1, [%g2 + 0x20]
	.word	0x91b40596	! t0_kref+0xaac:   	fcmpgt32	%f16, %f22, %o0
	.word	0x81af0a4e	! t0_kref+0xab0:   	fcmpd	%fcc0, %f28, %f14
	.word	0xe1ee501d	! t0_kref+0xab4:   	prefetcha	%i1 + %i5, 16
	.word	0xe1067ff8	! t0_kref+0xab8:   	ld	[%i1 - 8], %f16
	.word	0xbda388dc	! t0_kref+0xabc:   	fsubd	%f14, %f28, %f30
	.word	0xa9b34d60	! t0_kref+0xac0:   	fnot1s	%f13, %f20
	.word	0xa1b4044c	! t0_kref+0xac4:   	fcmpne16	%f16, %f12, %l0
	.word	0xe0c61000	! t0_kref+0xac8:   	ldswa	[%i0]0x80, %l0
	.word	0x9da48958	! t0_kref+0xacc:   	fmuld	%f18, %f24, %f14
	.word	0xa9b3ca38	! t0_kref+0xad0:   	fpadd16s	%f15, %f24, %f20
	.word	0x9ba708ba	! t0_kref+0xad4:   	fsubs	%f28, %f26, %f13
	.word	0x81ac4ab5	! t0_kref+0xad8:   	fcmpes	%fcc0, %f17, %f21
	.word	0xa9b68973	! t0_kref+0xadc:   	fpmerge	%f26, %f19, %f20
	.word	0x9fa01a50	! t0_kref+0xae0:   	fdtoi	%f16, %f15
	.word	0x24480006	! t0_kref+0xae4:   	ble,a,pt	%icc, _kref+0xafc
	.word	0xa5400000	! t0_kref+0xae8:   	mov	%y, %l2
	.word	0x20800004	! t0_kref+0xaec:   	bn,a	_kref+0xafc
	.word	0x91b3859a	! t0_kref+0xaf0:   	fcmpgt32	%f14, %f26, %o0
	.word	0xe1be5895	! t0_kref+0xaf4:   	stda	%f16, [%i1 + %l5]0xc4
	.word	0xbdb48ddc	! t0_kref+0xaf8:   	fnand	%f18, %f28, %f30
	.word	0x9407001b	! t0_kref+0xafc:   	add	%i4, %i3, %o2
	.word	0xeefe501c	! t0_kref+0xb00:   	swapa	[%i1 + %i4]0x80, %l7
	.word	0x86102003	! t0_kref+0xb04:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xb08:   	bne,a	_kref+0xb08
	.word	0x86a0e001	! t0_kref+0xb0c:   	subcc	%g3, 1, %g3
	.word	0x2c800006	! t0_kref+0xb10:   	bneg,a	_kref+0xb28
	.word	0x81834000	! t0_kref+0xb14:   	wr	%o5, %g0, %y
	.word	0x91073420	! t0_kref+0xb18:   	taddcc	%i4, -0xbe0, %o0
	.word	0x91b3859a	! t0_kref+0xb1c:   	fcmpgt32	%f14, %f26, %o0
	call	SYM(t0_subr3)
	.word	0xa5b60c94	! t0_kref+0xb24:   	fandnot2	%f24, %f20, %f18
	.word	0xa4fd7915	! t0_kref+0xb28:   	sdivcc	%l5, -0x6eb, %l2
	call	SYM(t0_subr1)
	.word	0xe120a020	! t0_kref+0xb30:   	st	%f16, [%g2 + 0x20]
	.word	0xe0680019	! t0_kref+0xb34:   	ldstub	[%g0 + %i1], %l0
	.word	0xb1a48d34	! t0_kref+0xb38:   	fsmuld	%f18, %f20, %f24
	.word	0xac05ea6d	! t0_kref+0xb3c:   	add	%l7, 0xa6d, %l6
	.word	0xa0dce299	! t0_kref+0xb40:   	smulcc	%l3, 0x299, %l0
	.word	0x3c480003	! t0_kref+0xb44:   	bpos,a,pt	%icc, _kref+0xb50
	.word	0xbbb00770	! t0_kref+0xb48:   	fpack16	%f16, %f29
	.word	0x27480007	! t0_kref+0xb4c:   	fbul,a,pt	%fcc0, _kref+0xb68
	.word	0xeac71018	! t0_kref+0xb50:   	ldswa	[%i4 + %i0]0x80, %l5
	.word	0x3e480001	! t0_kref+0xb54:   	bvc,a,pt	%icc, _kref+0xb58
	.word	0xe4267ff4	! t0_kref+0xb58:   	st	%l2, [%i1 - 0xc]
	.word	0xd03f4018	! t0_kref+0xb5c:   	std	%o0, [%i5 + %i0]
	.word	0xac56801c	! t0_kref+0xb60:   	umul	%i2, %i4, %l6
	.word	0xa8aa2a81	! t0_kref+0xb64:   	andncc	%o0, 0xa81, %l4
	.word	0x81854000	! t0_kref+0xb68:   	wr	%l5, %g0, %y
	.word	0x99b30910	! t0_kref+0xb6c:   	faligndata	%f12, %f16, %f12
	.word	0xa5a548b4	! t0_kref+0xb70:   	fsubs	%f21, %f20, %f18
	.word	0x3e480003	! t0_kref+0xb74:   	bvc,a,pt	%icc, _kref+0xb80
	.word	0xeb067fe4	! t0_kref+0xb78:   	ld	[%i1 - 0x1c], %f21
	.word	0x901d73d8	! t0_kref+0xb7c:   	xor	%l5, -0xc28, %o0
	.word	0x81ad8ade	! t0_kref+0xb80:   	fcmped	%fcc0, %f22, %f30
	.word	0xbba4c8ba	! t0_kref+0xb84:   	fsubs	%f19, %f26, %f29
	.word	0xdb067ffc	! t0_kref+0xb88:   	ld	[%i1 - 4], %f13
	.word	0xa5b68ada	! t0_kref+0xb8c:   	fpsub32	%f26, %f26, %f18
	.word	0x21800005	! t0_kref+0xb90:   	fbn,a	_kref+0xba4
	.word	0xa1a00552	! t0_kref+0xb94:   	fsqrtd	%f18, %f16
	.word	0xbbb64ea0	! t0_kref+0xb98:   	fsrc1s	%f25, %f29
	.word	0x29800003	! t0_kref+0xb9c:   	fbl,a	_kref+0xba8
	.word	0xb1a6882e	! t0_kref+0xba0:   	fadds	%f26, %f14, %f24
	.word	0xabb68a3b	! t0_kref+0xba4:   	fpadd16s	%f26, %f27, %f21
	.word	0xaa637e43	! t0_kref+0xba8:   	subc	%o5, -0x1bd, %l5
	.word	0xa07ea822	! t0_kref+0xbac:   	sdiv	%i2, 0x822, %l0
	.word	0xa6dcc015	! t0_kref+0xbb0:   	smulcc	%l3, %l5, %l3
	.word	0x8185c000	! t0_kref+0xbb4:   	wr	%l7, %g0, %y
	.word	0xda28a022	! t0_kref+0xbb8:   	stb	%o5, [%g2 + 0x22]
	.word	0xba103fe0	! t0_kref+0xbbc:   	mov	0xffffffe0, %i5
	.word	0x81820000	! t0_kref+0xbc0:   	wr	%o0, %g0, %y
	.word	0xb9a5094c	! t0_kref+0xbc4:   	fmuld	%f20, %f12, %f28
	.word	0xb5b00cd6	! t0_kref+0xbc8:   	fnot2	%f22, %f26
	.word	0x2a800008	! t0_kref+0xbcc:   	bcs,a	_kref+0xbec
	.word	0xb5a6094e	! t0_kref+0xbd0:   	fmuld	%f24, %f14, %f26
	.word	0x99b48c58	! t0_kref+0xbd4:   	fnor	%f18, %f24, %f12
	.word	0x9da74834	! t0_kref+0xbd8:   	fadds	%f29, %f20, %f14
	.word	0xdd1e0000	! t0_kref+0xbdc:   	ldd	[%i0], %f14
	.word	0xb5a01a39	! t0_kref+0xbe0:   	fstoi	%f25, %f26
	.word	0xa52a6005	! t0_kref+0xbe4:   	sll	%o1, 0x5, %l2
	.word	0xb5b58ad2	! t0_kref+0xbe8:   	fpsub32	%f22, %f18, %f26
	.word	0x9326b0eb	! t0_kref+0xbec:   	mulscc	%i2, -0xf15, %o1
	.word	0x9fc00004	! t0_kref+0xbf0:   	call	%g0 + %g4
	.word	0xe4267fe4	! t0_kref+0xbf4:   	st	%l2, [%i1 - 0x1c]
	.word	0xb6103ff2	! t0_kref+0xbf8:   	mov	0xfffffff2, %i3
	.word	0xe5b81019	! t0_kref+0xbfc:   	stda	%f18, [%g0 + %i1]0x80
	call	SYM(t0_subr1)
	.word	0x929df135	! t0_kref+0xc04:   	xorcc	%l7, -0xecb, %o1
	.word	0xbda50954	! t0_kref+0xc08:   	fmuld	%f20, %f20, %f30
	.word	0xa5a50952	! t0_kref+0xc0c:   	fmuld	%f20, %f18, %f18
	.word	0xd99e1a1a	! t0_kref+0xc10:   	ldda	[%i0 + %i2]0xd0, %f12
	.word	0xa5a01a33	! t0_kref+0xc14:   	fstoi	%f19, %f18
	.word	0xed200019	! t0_kref+0xc18:   	st	%f22, [%g0 + %i1]
	.word	0xe0063ff0	! t0_kref+0xc1c:   	ld	[%i0 - 0x10], %l0
	.word	0xa3a348bf	! t0_kref+0xc20:   	fsubs	%f13, %f31, %f17
	.word	0x907daafb	! t0_kref+0xc24:   	sdiv	%l6, 0xafb, %o0
	.word	0x2e800006	! t0_kref+0xc28:   	bvs,a	_kref+0xc40
	.word	0xafb340ad	! t0_kref+0xc2c:   	edge16n	%o5, %o5, %l7
	.word	0xa3a00534	! t0_kref+0xc30:   	fsqrts	%f20, %f17
	.word	0xe48e9019	! t0_kref+0xc34:   	lduba	[%i2 + %i1]0x80, %l2
	.word	0x91400000	! t0_kref+0xc38:   	mov	%y, %o0
	.word	0x9db686d2	! t0_kref+0xc3c:   	fmul8sux16	%f26, %f18, %f14
	.word	0xee0e6010	! t0_kref+0xc40:   	ldub	[%i1 + 0x10], %l7
	.word	0xf186101c	! t0_kref+0xc44:   	lda	[%i0 + %i4]0x80, %f24
	.word	0xafa01897	! t0_kref+0xc48:   	fitos	%f23, %f23
	.word	0x22480008	! t0_kref+0xc4c:   	be,a,pt	%icc, _kref+0xc6c
	.word	0xb5a0055c	! t0_kref+0xc50:   	fsqrtd	%f28, %f26
	.word	0xf83e3fe8	! t0_kref+0xc54:   	std	%i4, [%i0 - 0x18]
	.word	0xa4a4c013	! t0_kref+0xc58:   	subcc	%l3, %l3, %l2
	.word	0xaa86c01c	! t0_kref+0xc5c:   	addcc	%i3, %i4, %l5
	.word	0xecd81018	! t0_kref+0xc60:   	ldxa	[%g0 + %i0]0x80, %l6
	.word	0xec364000	! t0_kref+0xc64:   	sth	%l6, [%i1]
	.word	0xb5b7ca39	! t0_kref+0xc68:   	fpadd16s	%f31, %f25, %f26
	.word	0x8143e040	! t0_kref+0xc6c:   	membar	0x40
	.word	0xb1b78f9a	! t0_kref+0xc70:   	for	%f30, %f26, %f24
	.word	0x920c74cd	! t0_kref+0xc74:   	and	%l1, -0xb33, %o1
	.word	0xf9be188c	! t0_kref+0xc78:   	stda	%f28, [%i0 + %o4]0xc4
	call	SYM(t0_subr0)
	.word	0xa5a58d38	! t0_kref+0xc80:   	fsmuld	%f22, %f24, %f18
	.word	0x86102003	! t0_kref+0xc84:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0xc88:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t0_kref+0xc8c:   	be,a	_kref+0xce8
	.word	0xa9a00039	! t0_kref+0xc90:   	fmovs	%f25, %f20
	.word	0xa1b50e7c	! t0_kref+0xc94:   	fxnors	%f20, %f28, %f16
	.word	0xe19e7ff6	! t0_kref+0xc98:   	ldda	[%i1 - 0xa]%asi, %f16
	.word	0xa676800c	! t0_kref+0xc9c:   	udiv	%i2, %o4, %l3
	.word	0x394ffffa	! t0_kref+0xca0:   	fbuge,a,pt	%fcc0, _kref+0xc88
	.word	0xa785adc9	! t0_kref+0xca4:   	wr	%l6, 0xdc9, %gsr
	.word	0xa1400000	! t0_kref+0xca8:   	mov	%y, %l0
	.word	0x20bffff7	! t0_kref+0xcac:   	bn,a	_kref+0xc88
	.word	0xaa127686	! t0_kref+0xcb0:   	or	%o1, -0x97a, %l5
	.word	0xada00554	! t0_kref+0xcb4:   	fsqrtd	%f20, %f22
	.word	0x8143c000	! t0_kref+0xcb8:   	stbar
	.word	0x2abffff3	! t0_kref+0xcbc:   	bcs,a	_kref+0xc88
	.word	0xe7e61015	! t0_kref+0xcc0:   	casa	[%i0]0x80, %l5, %l3
	.word	0xa8058016	! t0_kref+0xcc4:   	add	%l6, %l6, %l4
	.word	0xb9b78e1a	! t0_kref+0xcc8:   	fand	%f30, %f26, %f28
	.word	0xaa8b2744	! t0_kref+0xccc:   	andcc	%o4, 0x744, %l5
	.word	0xb5a60950	! t0_kref+0xcd0:   	fmuld	%f24, %f16, %f26
	.word	0xea4e6004	! t0_kref+0xcd4:   	ldsb	[%i1 + 4], %l5
	.word	0x81d82b3b	! t0_kref+0xcd8:   	flush	%g0 + 0xb3b
	.word	0xbdb60f9a	! t0_kref+0xcdc:   	for	%f24, %f26, %f30
	.word	0x91b785d6	! t0_kref+0xce0:   	fcmpeq32	%f30, %f22, %o0
	.word	0xc07e7fec	! t0_kref+0xce4:   	swap	[%i1 - 0x14], %g0
	.word	0xbda01938	! t0_kref+0xce8:   	fstod	%f24, %f30
	.word	0xee2e3ffc	! t0_kref+0xcec:   	stb	%l7, [%i0 - 4]
	.word	0xaaa223bd	! t0_kref+0xcf0:   	subcc	%o0, 0x3bd, %l5
	.word	0x33480004	! t0_kref+0xcf4:   	fbe,a,pt	%fcc0, _kref+0xd04
	.word	0xbdb30d16	! t0_kref+0xcf8:   	fandnot1	%f12, %f22, %f30
	.word	0xe11e6010	! t0_kref+0xcfc:   	ldd	[%i1 + 0x10], %f16
	.word	0xe6100018	! t0_kref+0xd00:   	lduh	[%g0 + %i0], %l3
	.word	0x29232070	! t0_kref+0xd04:   	sethi	%hi(0x8c81c000), %l4
	.word	0xac040011	! t0_kref+0xd08:   	add	%l0, %l1, %l6
	.word	0xa1b7891a	! t0_kref+0xd0c:   	faligndata	%f30, %f26, %f16
	.word	0xd86e7fe1	! t0_kref+0xd10:   	ldstub	[%i1 - 0x1f], %o4
	.word	0xd216001b	! t0_kref+0xd14:   	lduh	[%i0 + %i3], %o1
	.word	0xaa7cc01c	! t0_kref+0xd18:   	sdiv	%l3, %i4, %l5
	.word	0x35480004	! t0_kref+0xd1c:   	fbue,a,pt	%fcc0, _kref+0xd2c
	.word	0xb9ab8030	! t0_kref+0xd20:   	fmovsule	%fcc0, %f16, %f28
	.word	0xb7b6cf7c	! t0_kref+0xd24:   	fornot1s	%f27, %f28, %f27
	.word	0xf9266004	! t0_kref+0xd28:   	st	%f28, [%i1 + 4]
	.word	0xa60a637c	! t0_kref+0xd2c:   	and	%o1, 0x37c, %l3
	call	SYM(t0_subr1)
	.word	0xa21c4009	! t0_kref+0xd34:   	xor	%l1, %o1, %l1
	.word	0xe26e600e	! t0_kref+0xd38:   	ldstub	[%i1 + 0xe], %l1
	.word	0xec3e6010	! t0_kref+0xd3c:   	std	%l6, [%i1 + 0x10]
	.word	0x9de3bfa0	! t0_kref+0xd40:   	save	%sp, -0x60, %sp
	.word	0xafef0019	! t0_kref+0xd44:   	restore	%i4, %i1, %l7
	.word	0xabb38c71	! t0_kref+0xd48:   	fnors	%f14, %f17, %f21
	.word	0xeb68a004	! t0_kref+0xd4c:   	prefetch	%g2 + 4, 21
	.word	0xa9a4483c	! t0_kref+0xd50:   	fadds	%f17, %f28, %f20
	.word	0xab25801b	! t0_kref+0xd54:   	mulscc	%l6, %i3, %l5
	.word	0xbbb00f3f	! t0_kref+0xd58:   	fsrc2s	%f31, %f29
	.word	0xae75c008	! t0_kref+0xd5c:   	udiv	%l7, %o0, %l7
	.word	0xb1a01a5a	! t0_kref+0xd60:   	fdtoi	%f26, %f24
	.word	0x99a0055e	! t0_kref+0xd64:   	fsqrtd	%f30, %f12
	.word	0x9de3bfa0	! t0_kref+0xd68:   	save	%sp, -0x60, %sp
	.word	0xadef001a	! t0_kref+0xd6c:   	restore	%i4, %i2, %l6
	.word	0xb5a00558	! t0_kref+0xd70:   	fsqrtd	%f24, %f26
	.word	0x210310b0	! t0_kref+0xd74:   	sethi	%hi(0xc42c000), %l0
	.word	0xa6f5001a	! t0_kref+0xd78:   	udivcc	%l4, %i2, %l3
	.word	0x92a6c009	! t0_kref+0xd7c:   	subcc	%i3, %o1, %o1
	.word	0xee6e3fee	! t0_kref+0xd80:   	ldstub	[%i0 - 0x12], %l7
	.word	0xd27e601c	! t0_kref+0xd84:   	swap	[%i1 + 0x1c], %o1
	.word	0x2c480001	! t0_kref+0xd88:   	bneg,a,pt	%icc, _kref+0xd8c
	.word	0xf19e1a1b	! t0_kref+0xd8c:   	ldda	[%i0 + %i3]0xd0, %f24
	.word	0xe4167ff4	! t0_kref+0xd90:   	lduh	[%i1 - 0xc], %l2
	.word	0xe60e401a	! t0_kref+0xd94:   	ldub	[%i1 + %i2], %l3
	.word	0xbda0103a	! t0_kref+0xd98:   	fstox	%f26, %f30
	.word	0x151a7aeb	! t0_kref+0xd9c:   	sethi	%hi(0x69ebac00), %o2
	.word	0xd4100019	! t0_kref+0xda0:   	lduh	[%g0 + %i1], %o2
	.word	0xa3b7054c	! t0_kref+0xda4:   	fcmpeq16	%f28, %f12, %l1
	.word	0x31800001	! t0_kref+0xda8:   	fba,a	_kref+0xdac
	.word	0xae5ac008	! t0_kref+0xdac:   	smul	%o3, %o0, %l7
	.word	0xe3062010	! t0_kref+0xdb0:   	ld	[%i0 + 0x10], %f17
	.word	0xa3a01a33	! t0_kref+0xdb4:   	fstoi	%f19, %f17
	.word	0xa49a6e2b	! t0_kref+0xdb8:   	xorcc	%o1, 0xe2b, %l2
	.word	0xabb60ded	! t0_kref+0xdbc:   	fnands	%f24, %f13, %f21
	.word	0xe06e7fe7	! t0_kref+0xdc0:   	ldstub	[%i1 - 0x19], %l0
	.word	0xb7a000b0	! t0_kref+0xdc4:   	fnegs	%f16, %f27
	.word	0xa1b506fa	! t0_kref+0xdc8:   	fmul8ulx16	%f20, %f26, %f16
	.word	0xc807bfe4	! t0_kref+0xdcc:   	ld	[%fp - 0x1c], %g4
	.word	0xaad5f82c	! t0_kref+0xdd0:   	umulcc	%l7, -0x7d4, %l5
	.word	0xdf062004	! t0_kref+0xdd4:   	ld	[%i0 + 4], %f15
	.word	0xada5cd3e	! t0_kref+0xdd8:   	fsmuld	%f23, %f30, %f22
	.word	0xda30a024	! t0_kref+0xddc:   	sth	%o5, [%g2 + 0x24]
	.word	0xb1a00536	! t0_kref+0xde0:   	fsqrts	%f22, %f24
	.word	0xbbb7ca35	! t0_kref+0xde4:   	fpadd16s	%f31, %f21, %f29
	.word	0xa4254015	! t0_kref+0xde8:   	sub	%l5, %l5, %l2
	.word	0xbfa74837	! t0_kref+0xdec:   	fadds	%f29, %f23, %f31
	.word	0xdf871018	! t0_kref+0xdf0:   	lda	[%i4 + %i0]0x80, %f15
	.word	0xec3f4018	! t0_kref+0xdf4:   	std	%l6, [%i5 + %i0]
	.word	0xe3066000	! t0_kref+0xdf8:   	ld	[%i1], %f17
	.word	0x9fb70fbf	! t0_kref+0xdfc:   	fors	%f28, %f31, %f15
	.word	0x3d800004	! t0_kref+0xe00:   	fbule,a	_kref+0xe10
	.word	0xd0062000	! t0_kref+0xe04:   	ld	[%i0], %o0
	.word	0xb1a5094c	! t0_kref+0xe08:   	fmuld	%f20, %f12, %f24
	.word	0x3b480006	! t0_kref+0xe0c:   	fble,a,pt	%fcc0, _kref+0xe24
	.word	0x81da0008	! t0_kref+0xe10:   	flush	%o0 + %o0
	.word	0x3a480002	! t0_kref+0xe14:   	bcc,a,pt	%icc, _kref+0xe1c
	.word	0xda6e0000	! t0_kref+0xe18:   	ldstub	[%i0], %o5
	.word	0xb5b68ade	! t0_kref+0xe1c:   	fpsub32	%f26, %f30, %f26
	.word	0xa1b4404d	! t0_kref+0xe20:   	edge8l	%l1, %o5, %l0
	.word	0xa1a7095e	! t0_kref+0xe24:   	fmuld	%f28, %f30, %f16
	.word	0xa6d43b2c	! t0_kref+0xe28:   	umulcc	%l0, -0x4d4, %l3
	.word	0xc06e3fef	! t0_kref+0xe2c:   	ldstub	[%i0 - 0x11], %g0
	.word	0x92f6afeb	! t0_kref+0xe30:   	udivcc	%i2, 0xfeb, %o1
	.word	0xd48e1000	! t0_kref+0xe34:   	lduba	[%i0]0x80, %o2
	.word	0xa217362d	! t0_kref+0xe38:   	or	%i4, -0x9d3, %l1
	.word	0xea267ff0	! t0_kref+0xe3c:   	st	%l5, [%i1 - 0x10]
	.word	0xadb78f58	! t0_kref+0xe40:   	fornot1	%f30, %f24, %f22
	.word	0x81d80012	! t0_kref+0xe44:   	flush	%g0 + %l2
	.word	0x232b9760	! t0_kref+0xe48:   	sethi	%hi(0xae5d8000), %l1
	.word	0x36800005	! t0_kref+0xe4c:   	bge,a	_kref+0xe60
	.word	0xa52d6007	! t0_kref+0xe50:   	sll	%l5, 0x7, %l2
	.word	0x8143c000	! t0_kref+0xe54:   	stbar
	.word	0xb9a01a37	! t0_kref+0xe58:   	fstoi	%f23, %f28
	.word	0x81830000	! t0_kref+0xe5c:   	wr	%o4, %g0, %y
	.word	0x34480001	! t0_kref+0xe60:   	bg,a,pt	%icc, _kref+0xe64
	.word	0xa9b68efa	! t0_kref+0xe64:   	fornot2s	%f26, %f26, %f20
	.word	0xa5a30956	! t0_kref+0xe68:   	fmuld	%f12, %f22, %f18
	.word	0xbba0053c	! t0_kref+0xe6c:   	fsqrts	%f28, %f29
	.word	0xb5b68d60	! t0_kref+0xe70:   	fnot1s	%f26, %f26
	.word	0xdf063ff4	! t0_kref+0xe74:   	ld	[%i0 - 0xc], %f15
	.word	0xf820a000	! t0_kref+0xe78:   	st	%i4, [%g2]
	.word	0x908b0011	! t0_kref+0xe7c:   	andcc	%o4, %l1, %o0
	.word	0xa5b00cef	! t0_kref+0xe80:   	fnot2s	%f15, %f18
	.word	0x90dd250c	! t0_kref+0xe84:   	smulcc	%l4, 0x50c, %o0
	.word	0xa5a60852	! t0_kref+0xe88:   	faddd	%f24, %f18, %f18
	.word	0xa7a00131	! t0_kref+0xe8c:   	fabss	%f17, %f19
	.word	0x9db74731	! t0_kref+0xe90:   	fmuld8ulx16	%f29, %f17, %f14
	.word	0xb5a01937	! t0_kref+0xe94:   	fstod	%f23, %f26
	.word	0xf42e001a	! t0_kref+0xe98:   	stb	%i2, [%i0 + %i2]
	.word	0xa9a588d6	! t0_kref+0xe9c:   	fsubd	%f22, %f22, %f20
	.word	0x22480007	! t0_kref+0xea0:   	be,a,pt	%icc, _kref+0xebc
	.word	0xa784000d	! t0_kref+0xea4:   	wr	%l0, %o5, %gsr
	.word	0x81af0abf	! t0_kref+0xea8:   	fcmpes	%fcc0, %f28, %f31
	.word	0xf19e1000	! t0_kref+0xeac:   	ldda	[%i0]0x80, %f24
	.word	0xe02e001a	! t0_kref+0xeb0:   	stb	%l0, [%i0 + %i2]
	.word	0xb3b00cf0	! t0_kref+0xeb4:   	fnot2s	%f16, %f25
	.word	0xa5a00558	! t0_kref+0xeb8:   	fsqrtd	%f24, %f18
	.word	0xc3ee100a	! t0_kref+0xebc:   	prefetcha	%i0 + %o2, 1
	.word	0x8585401c	! t0_kref+0xec0:   	wr	%l5, %i4, %ccr
	.word	0xea366000	! t0_kref+0xec4:   	sth	%l5, [%i1]
	.word	0x9da58956	! t0_kref+0xec8:   	fmuld	%f22, %f22, %f14
	.word	0xafa348b0	! t0_kref+0xecc:   	fsubs	%f13, %f16, %f23
	.word	0xbfa00537	! t0_kref+0xed0:   	fsqrts	%f23, %f31
	.word	0x8185c000	! t0_kref+0xed4:   	wr	%l7, %g0, %y
	.word	0xe1000018	! t0_kref+0xed8:   	ld	[%g0 + %i0], %f16
	.word	0xa4a6c000	! t0_kref+0xedc:   	subcc	%i3, %g0, %l2
	.word	0xb1a648bc	! t0_kref+0xee0:   	fsubs	%f25, %f28, %f24
	.word	0xa6f836e9	! t0_kref+0xee4:   	sdivcc	%g0, -0x917, %l3
	.word	0xa5a40852	! t0_kref+0xee8:   	faddd	%f16, %f18, %f18
	.word	0xabb00f3b	! t0_kref+0xeec:   	fsrc2s	%f27, %f21
	.word	0x9db60c9e	! t0_kref+0xef0:   	fandnot2	%f24, %f30, %f14
	.word	0xaba0052e	! t0_kref+0xef4:   	fsqrts	%f14, %f21
	.word	0xab240015	! t0_kref+0xef8:   	mulscc	%l0, %l5, %l5
	.word	0x90202bb3	! t0_kref+0xefc:   	sub	%g0, 0xbb3, %o0
	.word	0x2f480007	! t0_kref+0xf00:   	fbu,a,pt	%fcc0, _kref+0xf1c
	.word	0xf99e3ff0	! t0_kref+0xf04:   	ldda	[%i0 - 0x10]%asi, %f28
	.word	0x81abcaba	! t0_kref+0xf08:   	fcmpes	%fcc0, %f15, %f26
	.word	0x34800007	! t0_kref+0xf0c:   	bg,a	_kref+0xf28
	.word	0xa25a615e	! t0_kref+0xf10:   	smul	%o1, 0x15e, %l1
	.word	0x3d480002	! t0_kref+0xf14:   	fbule,a,pt	%fcc0, _kref+0xf1c
	.word	0xee463ff0	! t0_kref+0xf18:   	ldsw	[%i0 - 0x10], %l7
	.word	0xda20a038	! t0_kref+0xf1c:   	st	%o5, [%g2 + 0x38]
	.word	0xa7a0189c	! t0_kref+0xf20:   	fitos	%f28, %f19
	.word	0x9da00138	! t0_kref+0xf24:   	fabss	%f24, %f14
	call	SYM(t0_subr3)
	.word	0x9422400a	! t0_kref+0xf2c:   	sub	%o1, %o2, %o2
	.word	0xa1a6095e	! t0_kref+0xf30:   	fmuld	%f24, %f30, %f16
	.word	0x29238f31	! t0_kref+0xf34:   	sethi	%hi(0x8e3cc400), %l4
	.word	0x22480006	! t0_kref+0xf38:   	be,a,pt	%icc, _kref+0xf50
	.word	0xe7060000	! t0_kref+0xf3c:   	ld	[%i0], %f19
	.word	0x8143c000	! t0_kref+0xf40:   	stbar
	.word	0x24480004	! t0_kref+0xf44:   	ble,a,pt	%icc, _kref+0xf54
	.word	0xe000a008	! t0_kref+0xf48:   	ld	[%g2 + 8], %l0
	.word	0x3f480006	! t0_kref+0xf4c:   	fbo,a,pt	%fcc0, _kref+0xf64
	.word	0xa6847b8d	! t0_kref+0xf50:   	addcc	%l1, -0x473, %l3
	.word	0xbbb58e7e	! t0_kref+0xf54:   	fxnors	%f22, %f30, %f29
	.word	0xee8e5000	! t0_kref+0xf58:   	lduba	[%i1]0x80, %l7
	.word	0x2524dc9f	! t0_kref+0xf5c:   	sethi	%hi(0x93727c00), %l2
	.word	0xa2c6c015	! t0_kref+0xf60:   	addccc	%i3, %l5, %l1
	.word	0xafb44d60	! t0_kref+0xf64:   	fnot1s	%f17, %f23
	.word	0x290606bf	! t0_kref+0xf68:   	sethi	%hi(0x181afc00), %l4
	.word	0xc168a049	! t0_kref+0xf6c:   	prefetch	%g2 + 0x49, 0
	.word	0xed3e7ff0	! t0_kref+0xf70:   	std	%f22, [%i1 - 0x10]
	.word	0xe99e1a5c	! t0_kref+0xf74:   	ldda	[%i0 + %i4]0xd2, %f20
	.word	0x81848000	! t0_kref+0xf78:   	wr	%l2, %g0, %y
	.word	0x858369e6	! t0_kref+0xf7c:   	wr	%o5, 0x9e6, %ccr
	.word	0xeb060000	! t0_kref+0xf80:   	ld	[%i0], %f21
	.word	0x86102002	! t0_kref+0xf84:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xf88:   	bne,a	_kref+0xf88
	.word	0x86a0e001	! t0_kref+0xf8c:   	subcc	%g3, 1, %g3
	.word	0xa02ac017	! t0_kref+0xf90:   	andn	%o3, %l7, %l0
	.word	0x9de3bfa0	! t0_kref+0xf94:   	save	%sp, -0x60, %sp
	.word	0xa7e83921	! t0_kref+0xf98:   	restore	%g0, -0x6df, %l3
	.word	0xadb4412b	! t0_kref+0xf9c:   	edge32n	%l1, %o3, %l6
	.word	0x86102001	! t0_kref+0xfa0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xfa4:   	bne,a	_kref+0xfa4
	.word	0x86a0e001	! t0_kref+0xfa8:   	subcc	%g3, 1, %g3
	.word	0x81820000	! t0_kref+0xfac:   	wr	%o0, %g0, %y
	.word	0x94fc0013	! t0_kref+0xfb0:   	sdivcc	%l0, %l3, %o2
	.word	0xa2ba69af	! t0_kref+0xfb4:   	xnorcc	%o1, 0x9af, %l1
	.word	0xbda348bd	! t0_kref+0xfb8:   	fsubs	%f13, %f29, %f30
	.word	0xa8568010	! t0_kref+0xfbc:   	umul	%i2, %l0, %l4
	.word	0xa5b6c0d7	! t0_kref+0xfc0:   	edge16l	%i3, %l7, %l2
	.word	0xa6f27a1f	! t0_kref+0xfc4:   	udivcc	%o1, -0x5e1, %l3
	.word	0xa6754017	! t0_kref+0xfc8:   	udiv	%l5, %l7, %l3
	.word	0xa32c0015	! t0_kref+0xfcc:   	sll	%l0, %l5, %l1
	.word	0xa9a34832	! t0_kref+0xfd0:   	fadds	%f13, %f18, %f20
	.word	0xbfa00537	! t0_kref+0xfd4:   	fsqrts	%f23, %f31
	.word	0xa6143e7d	! t0_kref+0xfd8:   	or	%l0, -0x183, %l3
	.word	0x2a800007	! t0_kref+0xfdc:   	bcs,a	_kref+0xff8
	.word	0xa6dd0010	! t0_kref+0xfe0:   	smulcc	%l4, %l0, %l3
	.word	0xe84e001a	! t0_kref+0xfe4:   	ldsb	[%i0 + %i2], %l4
	.word	0xa5b64d60	! t0_kref+0xfe8:   	fnot1s	%f25, %f18
	.word	0xd20e201f	! t0_kref+0xfec:   	ldub	[%i0 + 0x1f], %o1
	.word	0xb5a58950	! t0_kref+0xff0:   	fmuld	%f22, %f16, %f26
	.word	0xfd1e7fe8	! t0_kref+0xff4:   	ldd	[%i1 - 0x18], %f30
	.word	0xa5a01a52	! t0_kref+0xff8:   	fdtoi	%f18, %f18
	.word	0x2d23a76c	! t0_kref+0xffc:   	sethi	%hi(0x8e9db000), %l6
	.word	0x9de3bfa0	! t0_kref+0x1000:   	save	%sp, -0x60, %sp
	.word	0x80360019	! t0_kref+0x1004:   	orn	%i0, %i1, %g0
	.word	0xa5ee752a	! t0_kref+0x1008:   	restore	%i1, -0xad6, %l2
	.word	0xef68a088	! t0_kref+0x100c:   	prefetch	%g2 + 0x88, 23
	.word	0x28480007	! t0_kref+0x1010:   	bleu,a,pt	%icc, _kref+0x102c
	.word	0xaba00035	! t0_kref+0x1014:   	fmovs	%f21, %f21
	.word	0xe9be1896	! t0_kref+0x1018:   	stda	%f20, [%i0 + %l6]0xc4
	.word	0x9fa608bb	! t0_kref+0x101c:   	fsubs	%f24, %f27, %f15
	.word	0xb5a60930	! t0_kref+0x1020:   	fmuls	%f24, %f16, %f26
	.word	0xa13a8008	! t0_kref+0x1024:   	sra	%o2, %o0, %l0
	.word	0xa49d4009	! t0_kref+0x1028:   	xorcc	%l5, %o1, %l2
	.word	0x920b4010	! t0_kref+0x102c:   	and	%o5, %l0, %o1
	.word	0xe11e6008	! t0_kref+0x1030:   	ldd	[%i1 + 8], %f16
	.word	0xfb070019	! t0_kref+0x1034:   	ld	[%i4 + %i1], %f29
	.word	0x230ebedc	! t0_kref+0x1038:   	sethi	%hi(0x3afb7000), %l1
	.word	0xa0fdf8c7	! t0_kref+0x103c:   	sdivcc	%l7, -0x739, %l0
	.word	0xa27a8011	! t0_kref+0x1040:   	sdiv	%o2, %l1, %l1
	.word	0x81af4ab3	! t0_kref+0x1044:   	fcmpes	%fcc0, %f29, %f19
	.word	0xb5a0110c	! t0_kref+0x1048:   	fxtod	%f12, %f26
	.word	0x9da000bb	! t0_kref+0x104c:   	fnegs	%f27, %f14
	.word	0x903d4000	! t0_kref+0x1050:   	not	%l5, %o0
	call	SYM(t0_subr0)
	.word	0xbda388b2	! t0_kref+0x1058:   	fsubs	%f14, %f18, %f30
	.word	0xa1b4c120	! t0_kref+0x105c:   	edge32n	%l3, %g0, %l0
	.word	0xb7a01890	! t0_kref+0x1060:   	fitos	%f16, %f27
	.word	0xe4070019	! t0_kref+0x1064:   	ld	[%i4 + %i1], %l2
	.word	0xb1a4883d	! t0_kref+0x1068:   	fadds	%f18, %f29, %f24
	.word	0xa1322016	! t0_kref+0x106c:   	srl	%o0, 0x16, %l0
	.word	0xbfa588b0	! t0_kref+0x1070:   	fsubs	%f22, %f16, %f31
	.word	0xf99e9a18	! t0_kref+0x1074:   	ldda	[%i2 + %i0]0xd0, %f28
	.word	0xaefd6373	! t0_kref+0x1078:   	sdivcc	%l5, 0x373, %l7
	.word	0x940dc011	! t0_kref+0x107c:   	and	%l7, %l1, %o2
	.word	0xabb6c330	! t0_kref+0x1080:   	bmask	%i3, %l0, %l5
	.word	0x25480007	! t0_kref+0x1084:   	fblg,a,pt	%fcc0, _kref+0x10a0
	.word	0x953da002	! t0_kref+0x1088:   	sra	%l6, 0x2, %o2
	.word	0x9f414000	! t0_kref+0x108c:   	mov	%pc, %o7
	.word	0xad1d7fc7	! t0_kref+0x1090:   	tsubcctv	%l5, -0x39, %l6
	.word	0xd9e65017	! t0_kref+0x1094:   	casa	[%i1]0x80, %l7, %o4
	.word	0xb9a4c8ba	! t0_kref+0x1098:   	fsubs	%f19, %f26, %f28
	.word	0xa5a0053f	! t0_kref+0x109c:   	fsqrts	%f31, %f18
	.word	0xfd060000	! t0_kref+0x10a0:   	ld	[%i0], %f30
	.word	0x932ac00b	! t0_kref+0x10a4:   	sll	%o3, %o3, %o1
	.word	0xbfa01a52	! t0_kref+0x10a8:   	fdtoi	%f18, %f31
	.word	0x2f480004	! t0_kref+0x10ac:   	fbu,a,pt	%fcc0, _kref+0x10bc
	.word	0xa2146c2f	! t0_kref+0x10b0:   	or	%l1, 0xc2f, %l1
	.word	0x90de801a	! t0_kref+0x10b4:   	smulcc	%i2, %i2, %o0
	.word	0xf36e7ff8	! t0_kref+0x10b8:   	prefetch	%i1 - 8, 25
	.word	0xf8763ff0	! t0_kref+0x10bc:   	stx	%i4, [%i0 - 0x10]
	.word	0xa7400000	! t0_kref+0x10c0:   	mov	%y, %l3
	.word	0xbba01a37	! t0_kref+0x10c4:   	fstoi	%f23, %f29
	.word	0xd6262008	! t0_kref+0x10c8:   	st	%o3, [%i0 + 8]
	.word	0xb9a40958	! t0_kref+0x10cc:   	fmuld	%f16, %f24, %f28
	.word	0x940a377c	! t0_kref+0x10d0:   	and	%o0, -0x884, %o2
	.word	0xbfa748b1	! t0_kref+0x10d4:   	fsubs	%f29, %f17, %f31
	.word	0xd46e401a	! t0_kref+0x10d8:   	ldstub	[%i1 + %i2], %o2
	.word	0x95b58074	! t0_kref+0x10dc:   	edge8ln	%l6, %l4, %o2
	.word	0xb5a01a31	! t0_kref+0x10e0:   	fstoi	%f17, %f26
	.word	0xb3a0053e	! t0_kref+0x10e4:   	fsqrts	%f30, %f25
	.word	0xaaf5b119	! t0_kref+0x10e8:   	udivcc	%l6, -0xee7, %l5
	.word	0xf96e2000	! t0_kref+0x10ec:   	prefetch	%i0, 28
	.word	0x81580000	! t0_kref+0x10f0:   	flushw
	.word	0x81580000	! t0_kref+0x10f4:   	flushw
	.word	0x37480004	! t0_kref+0x10f8:   	fbge,a,pt	%fcc0, _kref+0x1108
	.word	0x8143c000	! t0_kref+0x10fc:   	stbar
	.word	0x81ac0ade	! t0_kref+0x1100:   	fcmped	%fcc0, %f16, %f30
	.word	0x3a800006	! t0_kref+0x1104:   	bcc,a	_kref+0x111c
	.word	0xada6cd3f	! t0_kref+0x1108:   	fsmuld	%f27, %f31, %f22
	.word	0x22800001	! t0_kref+0x110c:   	be,a	_kref+0x1110
	.word	0xe2e81018	! t0_kref+0x1110:   	ldstuba	[%g0 + %i0]0x80, %l1
	.word	0xa2ff0011	! t0_kref+0x1114:   	sdivcc	%i4, %l1, %l1
	.word	0xaa2f2886	! t0_kref+0x1118:   	andn	%i4, 0x886, %l5
	.word	0xadb60a16	! t0_kref+0x111c:   	fpadd16	%f24, %f22, %f22
	.word	0x30480007	! t0_kref+0x1120:   	ba,a,pt	%icc, _kref+0x113c
	.word	0xe006600c	! t0_kref+0x1124:   	ld	[%i1 + 0xc], %l0
	.word	0xec6e001a	! t0_kref+0x1128:   	ldstub	[%i0 + %i2], %l6
	.word	0x25356d55	! t0_kref+0x112c:   	sethi	%hi(0xd5b55400), %l2
	.word	0xb9b48f90	! t0_kref+0x1130:   	for	%f18, %f16, %f28
	.word	0xa1b78ed6	! t0_kref+0x1134:   	fornot2	%f30, %f22, %f16
	.word	0x3b800007	! t0_kref+0x1138:   	fble,a	_kref+0x1154
	.word	0xb5a01930	! t0_kref+0x113c:   	fstod	%f16, %f26
!	.word	0x3bbfd3b0	! t0_kref+0x1140:   	fble,a	SYM(t0_subr0)
	   	fble,a	SYM(t0_subr0)
	.word	0x9f414000	! t0_kref+0x1144:   	mov	%pc, %o7
	.word	0xae020011	! t0_kref+0x1148:   	add	%o0, %l1, %l7
	.word	0xd2067fe0	! t0_kref+0x114c:   	ld	[%i1 - 0x20], %o1
	.word	0xed067fe8	! t0_kref+0x1150:   	ld	[%i1 - 0x18], %f22
	.word	0x94d6a0bd	! t0_kref+0x1154:   	umulcc	%i2, 0xbd, %o2
	.word	0xa5a0055e	! t0_kref+0x1158:   	fsqrtd	%f30, %f18
	.word	0x81ad4a39	! t0_kref+0x115c:   	fcmps	%fcc0, %f21, %f25
	.word	0xe08e101a	! t0_kref+0x1160:   	lduba	[%i0 + %i2]0x80, %l0
	.word	0xa678000d	! t0_kref+0x1164:   	sdiv	%g0, %o5, %l3
	.word	0xae054009	! t0_kref+0x1168:   	add	%l5, %o1, %l7
	.word	0xea270019	! t0_kref+0x116c:   	st	%l5, [%i4 + %i1]
	call	SYM(t0_subr0)
	.word	0xb5b009af	! t0_kref+0x1174:   	fexpand	%f15, %f26
	.word	0x2d29a306	! t0_kref+0x1178:   	sethi	%hi(0xa68c1800), %l6
	.word	0xa4157971	! t0_kref+0x117c:   	or	%l5, -0x68f, %l2
	.word	0xa4e40015	! t0_kref+0x1180:   	subccc	%l0, %l5, %l2
	.word	0x9de3bfa0	! t0_kref+0x1184:   	save	%sp, -0x60, %sp
	.word	0xb616f8a7	! t0_kref+0x1188:   	or	%i3, -0x759, %i3
	.word	0xa7e8362c	! t0_kref+0x118c:   	restore	%g0, -0x9d4, %l3
	.word	0x2c800001	! t0_kref+0x1190:   	bneg,a	_kref+0x1194
	.word	0x92600013	! t0_kref+0x1194:   	subc	%g0, %l3, %o1
	.word	0xbda0055e	! t0_kref+0x1198:   	fsqrtd	%f30, %f30
	.word	0xa0f5770b	! t0_kref+0x119c:   	udivcc	%l5, -0x8f5, %l0
	call	SYM(t0_subr1)
	.word	0xd26e0000	! t0_kref+0x11a4:   	ldstub	[%i0], %o1
	.word	0xa9b5008c	! t0_kref+0x11a8:   	edge16	%l4, %o4, %l4
	.word	0xf9ee101b	! t0_kref+0x11ac:   	prefetcha	%i0 + %i3, 28
	.word	0x9bb50a3a	! t0_kref+0x11b0:   	fpadd16s	%f20, %f26, %f13
	.word	0xe60e8018	! t0_kref+0x11b4:   	ldub	[%i2 + %i0], %l3
	.word	0xa1b48dd6	! t0_kref+0x11b8:   	fnand	%f18, %f22, %f16
	.word	0xaba0052d	! t0_kref+0x11bc:   	fsqrts	%f13, %f21
	.word	0x9073000b	! t0_kref+0x11c0:   	udiv	%o4, %o3, %o0
	.word	0xe80e6006	! t0_kref+0x11c4:   	ldub	[%i1 + 6], %l4
	call	SYM(t0_subr0)
	.word	0xa9b00ccc	! t0_kref+0x11cc:   	fnot2	%f12, %f20
	.word	0xf5180019	! t0_kref+0x11d0:   	ldd	[%g0 + %i1], %f26
	.word	0xf7ee101a	! t0_kref+0x11d4:   	prefetcha	%i0 + %i2, 27
	.word	0xa88c0017	! t0_kref+0x11d8:   	andcc	%l0, %l7, %l4
	.word	0xadb5032d	! t0_kref+0x11dc:   	bmask	%l4, %o5, %l6
	.word	0x9de3bfa0	! t0_kref+0x11e0:   	save	%sp, -0x60, %sp
	.word	0xa5ee801a	! t0_kref+0x11e4:   	restore	%i2, %i2, %l2
	.word	0xbfb58df2	! t0_kref+0x11e8:   	fnands	%f22, %f18, %f31
	.word	0x90826eb9	! t0_kref+0x11ec:   	addcc	%o1, 0xeb9, %o0
	.word	0xa47de570	! t0_kref+0x11f0:   	sdiv	%l7, 0x570, %l2
	.word	0x9db7cab3	! t0_kref+0x11f4:   	fpsub16s	%f31, %f19, %f14
	.word	0xada00558	! t0_kref+0x11f8:   	fsqrtd	%f24, %f22
	.word	0xbba0013b	! t0_kref+0x11fc:   	fabss	%f27, %f29
	.word	0x81db801f	! t0_kref+0x1200:   	flush	%sp + %i7
	.word	0xa3408000	! t0_kref+0x1204:   	mov	%ccr, %l1
	.word	0xb5b606f4	! t0_kref+0x1208:   	fmul8ulx16	%f24, %f20, %f26
	.word	0xc368a00f	! t0_kref+0x120c:   	prefetch	%g2 + 0xf, 1
	.word	0xa6a0323b	! t0_kref+0x1210:   	subcc	%g0, -0xdc5, %l3
	.word	0xe106001c	! t0_kref+0x1214:   	ld	[%i0 + %i4], %f16
	.word	0x909d36bc	! t0_kref+0x1218:   	xorcc	%l4, -0x944, %o0
	.word	0x3f480003	! t0_kref+0x121c:   	fbo,a,pt	%fcc0, _kref+0x1228
	.word	0x99a0015e	! t0_kref+0x1220:   	fabsd	%f30, %f12
	.word	0x33480007	! t0_kref+0x1224:   	fbe,a,pt	%fcc0, _kref+0x1240
	.word	0x8143c000	! t0_kref+0x1228:   	stbar
	.word	0xe1062018	! t0_kref+0x122c:   	ld	[%i0 + 0x18], %f16
	.word	0x2e800003	! t0_kref+0x1230:   	bvs,a	_kref+0x123c
	.word	0xae544010	! t0_kref+0x1234:   	umul	%l1, %l0, %l7
	.word	0xd91e4000	! t0_kref+0x1238:   	ldd	[%i1], %f12
	.word	0xa1b40d60	! t0_kref+0x123c:   	fnot1s	%f16, %f16
	.word	0x8143e040	! t0_kref+0x1240:   	membar	0x40
	.word	0xafb68134	! t0_kref+0x1244:   	edge32n	%i2, %l4, %l7
	.word	0x9276febc	! t0_kref+0x1248:   	udiv	%i3, -0x144, %o1
	.word	0x2f480003	! t0_kref+0x124c:   	fbu,a,pt	%fcc0, _kref+0x1258
	.word	0x9db40dd4	! t0_kref+0x1250:   	fnand	%f16, %f20, %f14
	.word	0x81ac8a33	! t0_kref+0x1254:   	fcmps	%fcc0, %f18, %f19
	.word	0x3e800001	! t0_kref+0x1258:   	bvc,a	_kref+0x125c
	.word	0xa7b58590	! t0_kref+0x125c:   	fcmpgt32	%f22, %f16, %l3
	.word	0x81dae166	! t0_kref+0x1260:   	flush	%o3 + 0x166
	.word	0xa1b7849e	! t0_kref+0x1264:   	fcmple32	%f30, %f30, %l0
	.word	0xada5c832	! t0_kref+0x1268:   	fadds	%f23, %f18, %f22
	.word	0x81ad8a3d	! t0_kref+0x126c:   	fcmps	%fcc0, %f22, %f29
	.word	0xa102a1d3	! t0_kref+0x1270:   	taddcc	%o2, 0x1d3, %l0
	.word	0xe7062018	! t0_kref+0x1274:   	ld	[%i0 + 0x18], %f19
	.word	0x921a000a	! t0_kref+0x1278:   	xor	%o0, %o2, %o1
	.word	0x92e5273d	! t0_kref+0x127c:   	subccc	%l4, 0x73d, %o1
	.word	0x9da01038	! t0_kref+0x1280:   	fstox	%f24, %f14
	.word	0x81ae0ab1	! t0_kref+0x1284:   	fcmpes	%fcc0, %f24, %f17
	.word	0xabb58494	! t0_kref+0x1288:   	fcmple32	%f22, %f20, %l5
	.word	0xebee501d	! t0_kref+0x128c:   	prefetcha	%i1 + %i5, 21
	.word	0x2c480001	! t0_kref+0x1290:   	bneg,a,pt	%icc, _kref+0x1294
	.word	0xa87dafa7	! t0_kref+0x1294:   	sdiv	%l6, 0xfa7, %l4
	.word	0xda36401b	! t0_kref+0x1298:   	sth	%o5, [%i1 + %i3]
	.word	0x9de3bfa0	! t0_kref+0x129c:   	save	%sp, -0x60, %sp
	.word	0xb2577205	! t0_kref+0x12a0:   	umul	%i5, -0xdfb, %i1
	.word	0xadef001b	! t0_kref+0x12a4:   	restore	%i4, %i3, %l6
	.word	0xb9a0190e	! t0_kref+0x12a8:   	fitod	%f14, %f28
	.word	0xf51e2010	! t0_kref+0x12ac:   	ldd	[%i0 + 0x10], %f26
	.word	0x9fa00532	! t0_kref+0x12b0:   	fsqrts	%f18, %f15
	.word	0xe8c81019	! t0_kref+0x12b4:   	ldsba	[%g0 + %i1]0x80, %l4
	.word	0xa9a68956	! t0_kref+0x12b8:   	fmuld	%f26, %f22, %f20
	.word	0x878020e0	! t0_kref+0x12bc:   	mov	0xe0, %asi
	call	SYM(t0_subr3)
	.word	0x99a60954	! t0_kref+0x12c4:   	fmuld	%f24, %f20, %f12
	.word	0xa32a0015	! t0_kref+0x12c8:   	sll	%o0, %l5, %l1
	.word	0x99a0193f	! t0_kref+0x12cc:   	fstod	%f31, %f12
	.word	0xa614e178	! t0_kref+0x12d0:   	or	%l3, 0x178, %l3
	.word	0x81aecaba	! t0_kref+0x12d4:   	fcmpes	%fcc0, %f27, %f26
	.word	0xdd063fec	! t0_kref+0x12d8:   	ld	[%i0 - 0x14], %f14
	.word	0xbba01895	! t0_kref+0x12dc:   	fitos	%f21, %f29
	.word	0xdb801018	! t0_kref+0x12e0:   	lda	[%g0 + %i0]0x80, %f13
	.word	0xd2263fe0	! t0_kref+0x12e4:   	st	%o1, [%i0 - 0x20]
	.word	0xee5f4018	! t0_kref+0x12e8:   	ldx	[%i5 + %i0], %l7
	.word	0x81ae0ada	! t0_kref+0x12ec:   	fcmped	%fcc0, %f24, %f26
	.word	0x81834000	! t0_kref+0x12f0:   	wr	%o5, %g0, %y
	.word	0xfd070019	! t0_kref+0x12f4:   	ld	[%i4 + %i1], %f30
	.word	0x21480003	! t0_kref+0x12f8:   	fbn,a,pt	%fcc0, _kref+0x1304
	.word	0xada01938	! t0_kref+0x12fc:   	fstod	%f24, %f22
	.word	0xb5a01037	! t0_kref+0x1300:   	fstox	%f23, %f26
	.word	0xaed5c014	! t0_kref+0x1304:   	umulcc	%l7, %l4, %l7
	.word	0x151ff08f	! t0_kref+0x1308:   	sethi	%hi(0x7fc23c00), %o2
	.word	0xac380017	! t0_kref+0x130c:   	xnor	%g0, %l7, %l6
	.word	0x35480003	! t0_kref+0x1310:   	fbue,a,pt	%fcc0, _kref+0x131c
	.word	0xc0267ff4	! t0_kref+0x1314:   	clr	[%i1 - 0xc]
	.word	0xabb0077e	! t0_kref+0x1318:   	fpack16	%f30, %f21
	.word	0xac5cfe95	! t0_kref+0x131c:   	smul	%l3, -0x16b, %l6
	.word	0xe19e5a1c	! t0_kref+0x1320:   	ldda	[%i1 + %i4]0xd0, %f16
	.word	0xa81ef4bc	! t0_kref+0x1324:   	xor	%i3, -0xb44, %l4
	.word	0x9fb44d60	! t0_kref+0x1328:   	fnot1s	%f17, %f15
	.word	0x37800002	! t0_kref+0x132c:   	fbge,a	_kref+0x1334
	.word	0x8143c000	! t0_kref+0x1330:   	stbar
	.word	0xa80eb0be	! t0_kref+0x1334:   	and	%i2, -0xf42, %l4
	.word	0xf9ee101c	! t0_kref+0x1338:   	prefetcha	%i0 + %i4, 28
	.word	0xa5a000b7	! t0_kref+0x133c:   	fnegs	%f23, %f18
	.word	0xf8766000	! t0_kref+0x1340:   	stx	%i4, [%i1]
	.word	0x9216c01a	! t0_kref+0x1344:   	or	%i3, %i2, %o1
	.word	0xa89aa0e5	! t0_kref+0x1348:   	xorcc	%o2, 0xe5, %l4
	.word	0x36480002	! t0_kref+0x134c:   	bge,a,pt	%icc, _kref+0x1354
	.word	0xb7a00138	! t0_kref+0x1350:   	fabss	%f24, %f27
	.word	0xafa01a2d	! t0_kref+0x1354:   	fstoi	%f13, %f23
	.word	0xada01899	! t0_kref+0x1358:   	fitos	%f25, %f22
	.word	0x95b440eb	! t0_kref+0x135c:   	edge16ln	%l1, %o3, %o2
	.word	0xafa00538	! t0_kref+0x1360:   	fsqrts	%f24, %f23
	.word	0xbfa6083b	! t0_kref+0x1364:   	fadds	%f24, %f27, %f31
	.word	0xe3b8a040	! t0_kref+0x1368:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xac2c292f	! t0_kref+0x136c:   	andn	%l0, 0x92f, %l6
	.word	0xd8760000	! t0_kref+0x1370:   	stx	%o4, [%i0]
	.word	0x901b0008	! t0_kref+0x1374:   	xor	%o4, %o0, %o0
	.word	0xb3a5c93f	! t0_kref+0x1378:   	fmuls	%f23, %f31, %f25
	.word	0x90a5000a	! t0_kref+0x137c:   	subcc	%l4, %o2, %o0
	.word	0xd9be5892	! t0_kref+0x1380:   	stda	%f12, [%i1 + %l2]0xc4
	.word	0xe99e1000	! t0_kref+0x1384:   	ldda	[%i0]0x80, %f20
	.word	0x13057352	! t0_kref+0x1388:   	sethi	%hi(0x15cd4800), %o1
	.word	0x9202800a	! t0_kref+0x138c:   	add	%o2, %o2, %o1
	.word	0xf51fbe48	! t0_kref+0x1390:   	ldd	[%fp - 0x1b8], %f26
	.word	0xa1b5099c	! t0_kref+0x1394:   	bshuffle	%f20, %f28, %f16
	.word	0xe91e2000	! t0_kref+0x1398:   	ldd	[%i0], %f20
	.word	0x34480001	! t0_kref+0x139c:   	bg,a,pt	%icc, _kref+0x13a0
	.word	0xa494e563	! t0_kref+0x13a0:   	orcc	%l3, 0x563, %l2
	.word	0xbda01a3b	! t0_kref+0x13a4:   	fstoi	%f27, %f30
	.word	0x81ab8a4e	! t0_kref+0x13a8:   	fcmpd	%fcc0, %f14, %f14
	.word	0xbdb40d60	! t0_kref+0x13ac:   	fnot1s	%f16, %f30
	.word	0xd43e401d	! t0_kref+0x13b0:   	std	%o2, [%i1 + %i5]
	.word	0xa056e393	! t0_kref+0x13b4:   	umul	%i3, 0x393, %l0
	.word	0xac12b061	! t0_kref+0x13b8:   	or	%o2, -0xf9f, %l6
	.word	0xf76e6010	! t0_kref+0x13bc:   	prefetch	%i1 + 0x10, 27
	.word	0xa8d5395d	! t0_kref+0x13c0:   	umulcc	%l4, -0x6a3, %l4
	.word	0xa0f40015	! t0_kref+0x13c4:   	udivcc	%l0, %l5, %l0
	.word	0xafa00137	! t0_kref+0x13c8:   	fabss	%f23, %f23
	.word	0xd20e2011	! t0_kref+0x13cc:   	ldub	[%i0 + 0x11], %o1
	.word	0xa01d0008	! t0_kref+0x13d0:   	xor	%l4, %o0, %l0
	.word	0x27800004	! t0_kref+0x13d4:   	fbul,a	_kref+0x13e4
	.word	0xa85cc01a	! t0_kref+0x13d8:   	smul	%l3, %i2, %l4
	.word	0x2c800003	! t0_kref+0x13dc:   	bneg,a	_kref+0x13e8
	.word	0xa8da0011	! t0_kref+0x13e0:   	smulcc	%o0, %l1, %l4
	.word	0xe48e1000	! t0_kref+0x13e4:   	lduba	[%i0]0x80, %l2
	.word	0x901c0010	! t0_kref+0x13e8:   	xor	%l0, %l0, %o0
	.word	0xef6e401b	! t0_kref+0x13ec:   	prefetch	%i1 + %i3, 23
	.word	0xed1e401d	! t0_kref+0x13f0:   	ldd	[%i1 + %i5], %f22
	.word	0xa682a83f	! t0_kref+0x13f4:   	addcc	%o2, 0x83f, %l3
	.word	0x29800003	! t0_kref+0x13f8:   	fbl,a	_kref+0x1404
	.word	0xae83001a	! t0_kref+0x13fc:   	addcc	%o4, %i2, %l7
	.word	0xafb680b1	! t0_kref+0x1400:   	edge16n	%i2, %l1, %l7
	.word	0xf9be5855	! t0_kref+0x1404:   	stda	%f28, [%i1 + %l5]0xc2
	.word	0xe696d019	! t0_kref+0x1408:   	lduha	[%i3 + %i1]0x80, %l3
	.word	0xa88afb74	! t0_kref+0x140c:   	andcc	%o3, -0x48c, %l4
	.word	0xaaa5c014	! t0_kref+0x1410:   	subcc	%l7, %l4, %l5
	.word	0xaeb83a82	! t0_kref+0x1414:   	xnorcc	%g0, -0x57e, %l7
	.word	0x9f414000	! t0_kref+0x1418:   	mov	%pc, %o7
	.word	0xe4680018	! t0_kref+0x141c:   	ldstub	[%g0 + %i0], %l2
	.word	0xd87e401c	! t0_kref+0x1420:   	swap	[%i1 + %i4], %o4
	.word	0xe19e9a18	! t0_kref+0x1424:   	ldda	[%i2 + %i0]0xd0, %f16
	.word	0xa4f023e0	! t0_kref+0x1428:   	udivcc	%g0, 0x3e0, %l2
	.word	0xff200018	! t0_kref+0x142c:   	st	%f31, [%g0 + %i0]
	.word	0x39480005	! t0_kref+0x1430:   	fbuge,a,pt	%fcc0, _kref+0x1444
	.word	0xbba7083e	! t0_kref+0x1434:   	fadds	%f28, %f30, %f29
	.word	0xa3b38514	! t0_kref+0x1438:   	fcmpgt16	%f14, %f20, %l1
	.word	0xa9b58030	! t0_kref+0x143c:   	edge8n	%l6, %l0, %l4
	.word	0xa9a01a35	! t0_kref+0x1440:   	fstoi	%f21, %f20
	.word	0xe91e3fe8	! t0_kref+0x1444:   	ldd	[%i0 - 0x18], %f20
	.word	0xe89e101d	! t0_kref+0x1448:   	ldda	[%i0 + %i5]0x80, %l4
	.word	0x20480008	! t0_kref+0x144c:   	bn,a,pt	%icc, _kref+0x146c
	.word	0xab23000d	! t0_kref+0x1450:   	mulscc	%o4, %o5, %l5
	.word	0xa1a01035	! t0_kref+0x1454:   	fstox	%f21, %f16
	.word	0xa1a0055a	! t0_kref+0x1458:   	fsqrtd	%f26, %f16
	.word	0x81af0ad0	! t0_kref+0x145c:   	fcmped	%fcc0, %f28, %f16
	.word	0x93400000	! t0_kref+0x1460:   	mov	%y, %o1
	.word	0xd0266010	! t0_kref+0x1464:   	st	%o0, [%i1 + 0x10]
	.word	0xee780019	! t0_kref+0x1468:   	swap	[%g0 + %i1], %l7
	.word	0xe9be180a	! t0_kref+0x146c:   	stda	%f20, [%i0 + %o2]0xc0
	.word	0xd9be585b	! t0_kref+0x1470:   	stda	%f12, [%i1 + %i3]0xc2
	.word	0xa2f4401c	! t0_kref+0x1474:   	udivcc	%l1, %i4, %l1
	.word	0x8143c000	! t0_kref+0x1478:   	stbar
	.word	0xe81e2010	! t0_kref+0x147c:   	ldd	[%i0 + 0x10], %l4
	.word	0xa7a6c834	! t0_kref+0x1480:   	fadds	%f27, %f20, %f19
	.word	0x9db68a16	! t0_kref+0x1484:   	fpadd16	%f26, %f22, %f14
	.word	0xa6f2e5c3	! t0_kref+0x1488:   	udivcc	%o3, 0x5c3, %l3
	.word	0xabb38dee	! t0_kref+0x148c:   	fnands	%f14, %f14, %f21
	.word	0x81858000	! t0_kref+0x1490:   	wr	%l6, %g0, %y
	.word	0xa7024014	! t0_kref+0x1494:   	taddcc	%o1, %l4, %l3
	.word	0xb7a01a4e	! t0_kref+0x1498:   	fdtoi	%f14, %f27
	.word	0xc16e4014	! t0_kref+0x149c:   	prefetch	%i1 + %l4, 0
	.word	0xd02e001a	! t0_kref+0x14a0:   	stb	%o0, [%i0 + %i2]
	.word	0xac3ebc25	! t0_kref+0x14a4:   	xnor	%i2, -0x3db, %l6
	.word	0xac9ca84f	! t0_kref+0x14a8:   	xorcc	%l2, 0x84f, %l6
	.word	0xb9a00554	! t0_kref+0x14ac:   	fsqrtd	%f20, %f28
	.word	0x9da3c8ae	! t0_kref+0x14b0:   	fsubs	%f15, %f14, %f14
	.word	0x9de3bfa0	! t0_kref+0x14b4:   	save	%sp, -0x60, %sp
	.word	0xbaaf7c10	! t0_kref+0x14b8:   	andncc	%i5, -0x3f0, %i5
	.word	0xadee4000	! t0_kref+0x14bc:   	restore	%i1, %g0, %l6
	.word	0xb9a00552	! t0_kref+0x14c0:   	fsqrtd	%f18, %f28
	.word	0x81afcabf	! t0_kref+0x14c4:   	fcmpes	%fcc0, %f31, %f31
	.word	0xd7e6100d	! t0_kref+0x14c8:   	casa	[%i0]0x80, %o5, %o3
	.word	0x99a01916	! t0_kref+0x14cc:   	fitod	%f22, %f12
	.word	0x94f2401a	! t0_kref+0x14d0:   	udivcc	%o1, %i2, %o2
	.word	0xd6780018	! t0_kref+0x14d4:   	swap	[%g0 + %i0], %o3
	.word	0xa1b68a54	! t0_kref+0x14d8:   	fpadd32	%f26, %f20, %f16
	.word	0xd0067fe8	! t0_kref+0x14dc:   	ld	[%i1 - 0x18], %o0
	.word	0xdf263ff0	! t0_kref+0x14e0:   	st	%f15, [%i0 - 0x10]
	.word	0xe3b8a040	! t0_kref+0x14e4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xa49af87d	! t0_kref+0x14e8:   	xorcc	%o3, -0x783, %l2
	.word	0x39480008	! t0_kref+0x14ec:   	fbuge,a,pt	%fcc0, _kref+0x150c
	.word	0xe428a011	! t0_kref+0x14f0:   	stb	%l2, [%g2 + 0x11]
	.word	0x81ad8ad6	! t0_kref+0x14f4:   	fcmped	%fcc0, %f22, %f22
	.word	0xd820a008	! t0_kref+0x14f8:   	st	%o4, [%g2 + 8]
	.word	0xe0de1000	! t0_kref+0x14fc:   	ldxa	[%i0]0x80, %l0
	.word	0xb3b6cf79	! t0_kref+0x1500:   	fornot1s	%f27, %f25, %f25
	.word	0x94a4000d	! t0_kref+0x1504:   	subcc	%l0, %o5, %o2
	.word	0xabb70510	! t0_kref+0x1508:   	fcmpgt16	%f28, %f16, %l5
	.word	0xafa0189f	! t0_kref+0x150c:   	fitos	%f31, %f23
	.word	0xbba0053b	! t0_kref+0x1510:   	fsqrts	%f27, %f29
	.word	0xa7400000	! t0_kref+0x1514:   	mov	%y, %l3
	.word	0xaea4a571	! t0_kref+0x1518:   	subcc	%l2, 0x571, %l7
	.word	0xa212001c	! t0_kref+0x151c:   	or	%o0, %i4, %l1
	.word	0xb1a00537	! t0_kref+0x1520:   	fsqrts	%f23, %f24
	.word	0xe620a01c	! t0_kref+0x1524:   	st	%l3, [%g2 + 0x1c]
	.word	0xbda6c839	! t0_kref+0x1528:   	fadds	%f27, %f25, %f30
	.word	0xb1a01056	! t0_kref+0x152c:   	fdtox	%f22, %f24
	.word	0x27480005	! t0_kref+0x1530:   	fbul,a,pt	%fcc0, _kref+0x1544
	.word	0x81dbafec	! t0_kref+0x1534:   	flush	%sp + 0xfec
	.word	0xb3a40830	! t0_kref+0x1538:   	fadds	%f16, %f16, %f25
	.word	0xa5b50dd0	! t0_kref+0x153c:   	fnand	%f20, %f16, %f18
	.word	0xc96e0012	! t0_kref+0x1540:   	prefetch	%i0 + %l2, 4
	.word	0x2b800006	! t0_kref+0x1544:   	fbug,a	_kref+0x155c
	.word	0xd00e6002	! t0_kref+0x1548:   	ldub	[%i1 + 2], %o0
	.word	0x33800007	! t0_kref+0x154c:   	fbe,a	_kref+0x1568
	.word	0x94f23c5e	! t0_kref+0x1550:   	udivcc	%o0, -0x3a2, %o2
	.word	0xc768a080	! t0_kref+0x1554:   	prefetch	%g2 + 0x80, 3
	.word	0x909c2168	! t0_kref+0x1558:   	xorcc	%l0, 0x168, %o0
	.word	0xb5a00038	! t0_kref+0x155c:   	fmovs	%f24, %f26
	.word	0xa9a6cd2f	! t0_kref+0x1560:   	fsmuld	%f27, %f15, %f20
	.word	0xac1f0000	! t0_kref+0x1564:   	xor	%i4, %g0, %l6
	.word	0xaba648bd	! t0_kref+0x1568:   	fsubs	%f25, %f29, %f21
	.word	0x81ae0ad0	! t0_kref+0x156c:   	fcmped	%fcc0, %f24, %f16
	.word	0xc06e0000	! t0_kref+0x1570:   	ldstub	[%i0], %g0
	.word	0xbfa00534	! t0_kref+0x1574:   	fsqrts	%f20, %f31
	.word	0xa89a000c	! t0_kref+0x1578:   	xorcc	%o0, %o4, %l4
	.word	0xa3b5c010	! t0_kref+0x157c:   	edge8	%l7, %l0, %l1
	.word	0x87802080	! t0_kref+0x1580:   	mov	0x80, %asi
	.word	0xb5a00554	! t0_kref+0x1584:   	fsqrtd	%f20, %f26
	.word	0x37800004	! t0_kref+0x1588:   	fbge,a	_kref+0x1598
	.word	0x9fa34832	! t0_kref+0x158c:   	fadds	%f13, %f18, %f15
	.word	0xa5a000da	! t0_kref+0x1590:   	fnegd	%f26, %f18
	.word	0xd27f0018	! t0_kref+0x1594:   	swap	[%i4 + %i0], %o1
	.word	0xa9b48f98	! t0_kref+0x1598:   	for	%f18, %f24, %f20
	.word	0x95b7054e	! t0_kref+0x159c:   	fcmpeq16	%f28, %f14, %o2
	.word	0xa72b4015	! t0_kref+0x15a0:   	sll	%o5, %l5, %l3
	.word	0xe66e8018	! t0_kref+0x15a4:   	ldstub	[%i2 + %i0], %l3
	.word	0xd62e3fed	! t0_kref+0x15a8:   	stb	%o3, [%i0 - 0x13]
	.word	0xa6d335f6	! t0_kref+0x15ac:   	umulcc	%o4, -0xa0a, %l3
	.word	0xaba58832	! t0_kref+0x15b0:   	fadds	%f22, %f18, %f21
	.word	0xb1b60a35	! t0_kref+0x15b4:   	fpadd16s	%f24, %f21, %f24
	.word	0xd6280019	! t0_kref+0x15b8:   	stb	%o3, [%g0 + %i1]
	.word	0xa3b5c177	! t0_kref+0x15bc:   	edge32ln	%l7, %l7, %l1
	.word	0xaa75000d	! t0_kref+0x15c0:   	udiv	%l4, %o5, %l5
	.word	0x90dd801c	! t0_kref+0x15c4:   	smulcc	%l6, %i4, %o0
	.word	0xb5a00536	! t0_kref+0x15c8:   	fsqrts	%f22, %f26
	.word	0xb5b34c7a	! t0_kref+0x15cc:   	fnors	%f13, %f26, %f26
	.word	0xe646001c	! t0_kref+0x15d0:   	ldsw	[%i0 + %i4], %l3
	.word	0xc807bfec	! t0_kref+0x15d4:   	ld	[%fp - 0x14], %g4
	.word	0x92fac012	! t0_kref+0x15d8:   	sdivcc	%o3, %l2, %o1
	.word	0xadb70200	! t0_kref+0x15dc:   	array8	%i4, %g0, %l6
	.word	0x81d90000	! t0_kref+0x15e0:   	flush	%g4
	.word	0xe3e65011	! t0_kref+0x15e4:   	casa	[%i1]0x80, %l1, %l1
	.word	0x81dc7b2f	! t0_kref+0x15e8:   	flush	%l1 - 0x4d1
	.word	0xbda00530	! t0_kref+0x15ec:   	fsqrts	%f16, %f30
	.word	0x9de3bfa0	! t0_kref+0x15f0:   	save	%sp, -0x60, %sp
	.word	0xb0173f6d	! t0_kref+0x15f4:   	or	%i4, -0x93, %i0
	.word	0xa7eeecbc	! t0_kref+0x15f8:   	restore	%i3, 0xcbc, %l3
	.word	0xee0e0000	! t0_kref+0x15fc:   	ldub	[%i0], %l7
	.word	0x2c480004	! t0_kref+0x1600:   	bneg,a,pt	%icc, _kref+0x1610
	.word	0xe6c8a022	! t0_kref+0x1604:   	ldsba	[%g2 + 0x22]%asi, %l3
	.word	0xc807bfe4	! t0_kref+0x1608:   	ld	[%fp - 0x1c], %g4
	.word	0xb9b38ada	! t0_kref+0x160c:   	fpsub32	%f14, %f26, %f28
	.word	0xe4a01019	! t0_kref+0x1610:   	sta	%l2, [%g0 + %i1]0x80
	.word	0xb5a00538	! t0_kref+0x1614:   	fsqrts	%f24, %f26
	.word	0xeefe3fe4	! t0_kref+0x1618:   	swapa	[%i0 - 0x1c]%asi, %l7
	.word	0x90dd000c	! t0_kref+0x161c:   	smulcc	%l4, %o4, %o0
	.word	0x8610201c	! t0_kref+0x1620:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x1624:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x1628:   	be,a	_kref+0x1668
	.word	0xa9a34d3a	! t0_kref+0x162c:   	fsmuld	%f13, %f26, %f20
	.word	0xafa0012d	! t0_kref+0x1630:   	fabss	%f13, %f23
	.word	0xd0067fec	! t0_kref+0x1634:   	ld	[%i1 - 0x14], %o0
	.word	0xa5b34240	! t0_kref+0x1638:   	array16	%o5, %g0, %l2
	.word	0x95b5041c	! t0_kref+0x163c:   	fcmple16	%f20, %f28, %o2
	.word	0x91400000	! t0_kref+0x1640:   	mov	%y, %o0
	.word	0xe6164000	! t0_kref+0x1644:   	lduh	[%i1], %l3
	.word	0x9bb38a37	! t0_kref+0x1648:   	fpadd16s	%f14, %f23, %f13
	.word	0xa89c401b	! t0_kref+0x164c:   	xorcc	%l1, %i3, %l4
	.word	0xede61009	! t0_kref+0x1650:   	casa	[%i0]0x80, %o1, %l6
	.word	0xe91e7ff8	! t0_kref+0x1654:   	ldd	[%i1 - 8], %f20
	.word	0xd236401b	! t0_kref+0x1658:   	sth	%o1, [%i1 + %i3]
	call	SYM(t0_subr3)
	.word	0x92f5793e	! t0_kref+0x1660:   	udivcc	%l5, -0x6c2, %o1
	.word	0x304ffff0	! t0_kref+0x1664:   	ba,a,pt	%icc, _kref+0x1624
	.word	0xa9b00f37	! t0_kref+0x1668:   	fsrc2s	%f23, %f20
	.word	0xa1a01a52	! t0_kref+0x166c:   	fdtoi	%f18, %f16
	.word	0xdab0a012	! t0_kref+0x1670:   	stha	%o5, [%g2 + 0x12]%asi
	.word	0xbdb54ea0	! t0_kref+0x1674:   	fsrc1s	%f21, %f30
	.word	0xbfa0013d	! t0_kref+0x1678:   	fabss	%f29, %f31
	.word	0xae14001c	! t0_kref+0x167c:   	or	%l0, %i4, %l7
	.word	0xaafdeb3c	! t0_kref+0x1680:   	sdivcc	%l7, 0xb3c, %l5
	.word	0xa075c013	! t0_kref+0x1684:   	udiv	%l7, %l3, %l0
	.word	0xa2870009	! t0_kref+0x1688:   	addcc	%i4, %o1, %l1
	.word	0xaf418000	! t0_kref+0x168c:   	mov	%fprs, %l7
	.word	0x28480007	! t0_kref+0x1690:   	bleu,a,pt	%icc, _kref+0x16ac
	.word	0xaa9d4011	! t0_kref+0x1694:   	xorcc	%l5, %l1, %l5
	.word	0xbfa01894	! t0_kref+0x1698:   	fitos	%f20, %f31
	.word	0xb1b70f5c	! t0_kref+0x169c:   	fornot1	%f28, %f28, %f24
	call	SYM(t0_subr3)
	.word	0xf8200018	! t0_kref+0x16a4:   	st	%i4, [%g0 + %i0]
	.word	0x2d800007	! t0_kref+0x16a8:   	fbg,a	_kref+0x16c4
	.word	0xdd266004	! t0_kref+0x16ac:   	st	%f14, [%i1 + 4]
	.word	0x21800005	! t0_kref+0x16b0:   	fbn,a	_kref+0x16c4
	.word	0xbfb6ce7c	! t0_kref+0x16b4:   	fxnors	%f27, %f28, %f31
	.word	0xd026401c	! t0_kref+0x16b8:   	st	%o0, [%i1 + %i4]
	.word	0xb9a0012e	! t0_kref+0x16bc:   	fabss	%f14, %f28
	.word	0xa1b5c071	! t0_kref+0x16c0:   	edge8ln	%l7, %l1, %l0
	.word	0x927ce145	! t0_kref+0x16c4:   	sdiv	%l3, 0x145, %o1
	.word	0xa5a68850	! t0_kref+0x16c8:   	faddd	%f26, %f16, %f18
	.word	0xb1b009ae	! t0_kref+0x16cc:   	fexpand	%f14, %f24
	.word	0xd006401c	! t0_kref+0x16d0:   	ld	[%i1 + %i4], %o0
	.word	0x2737219a	! t0_kref+0x16d4:   	sethi	%hi(0xdc866800), %l3
	.word	0x38480001	! t0_kref+0x16d8:   	bgu,a,pt	%icc, _kref+0x16dc
	.word	0xa7b2000c	! t0_kref+0x16dc:   	edge8	%o0, %o4, %l3
	.word	0x81854000	! t0_kref+0x16e0:   	wr	%l5, %g0, %y
	.word	0xf626001c	! t0_kref+0x16e4:   	st	%i3, [%i0 + %i4]
	.word	0x81ab4abf	! t0_kref+0x16e8:   	fcmpes	%fcc0, %f13, %f31
	.word	0xa4dd4016	! t0_kref+0x16ec:   	smulcc	%l5, %l6, %l2
	.word	0x92b20009	! t0_kref+0x16f0:   	orncc	%o0, %o1, %o1
	.word	0x2c480007	! t0_kref+0x16f4:   	bneg,a,pt	%icc, _kref+0x1710
	.word	0xeb20a030	! t0_kref+0x16f8:   	st	%f21, [%g2 + 0x30]
	.word	0xb7a3482e	! t0_kref+0x16fc:   	fadds	%f13, %f14, %f27
	.word	0xd1e61015	! t0_kref+0x1700:   	casa	[%i0]0x80, %l5, %o0
	.word	0xbdb54df8	! t0_kref+0x1704:   	fnands	%f21, %f24, %f30
	.word	0xd42167ac	! t0_kref+0x1708:   	st	%o2, [%g5 + 0x7ac]
	.word	0x99a0055a	! t0_kref+0x170c:   	fsqrtd	%f26, %f12
	.word	0xa7b70598	! t0_kref+0x1710:   	fcmpgt32	%f28, %f24, %l3
	.word	0xa8da4009	! t0_kref+0x1714:   	smulcc	%o1, %o1, %l4
	.word	0xe46e8018	! t0_kref+0x1718:   	ldstub	[%i2 + %i0], %l2
	.word	0x3d480007	! t0_kref+0x171c:   	fbule,a,pt	%fcc0, _kref+0x1738
	.word	0x231e73e6	! t0_kref+0x1720:   	sethi	%hi(0x79cf9800), %l1
	.word	0x81de8014	! t0_kref+0x1724:   	flush	%i2 + %l4
	.word	0x81af0aaf	! t0_kref+0x1728:   	fcmpes	%fcc0, %f28, %f15
	.word	0xda7e0000	! t0_kref+0x172c:   	swap	[%i0], %o5
	.word	0x3c800002	! t0_kref+0x1730:   	bpos,a	_kref+0x1738
	.word	0xae63401a	! t0_kref+0x1734:   	subc	%o5, %i2, %l7
	.word	0xa71d3170	! t0_kref+0x1738:   	tsubcctv	%l4, -0xe90, %l3
	.word	0x9de3bfa0	! t0_kref+0x173c:   	save	%sp, -0x60, %sp
	.word	0xb6576754	! t0_kref+0x1740:   	umul	%i5, 0x754, %i3
	.word	0xa7eea697	! t0_kref+0x1744:   	restore	%i2, 0x697, %l3
	.word	0xa28af6da	! t0_kref+0x1748:   	andcc	%o3, -0x926, %l1
	.word	0xb5a01936	! t0_kref+0x174c:   	fstod	%f22, %f26
	.word	0xa9a588b2	! t0_kref+0x1750:   	fsubs	%f22, %f18, %f20
	.word	0xf83e0000	! t0_kref+0x1754:   	std	%i4, [%i0]
	.word	0xeb20a00c	! t0_kref+0x1758:   	st	%f21, [%g2 + 0xc]
	.word	0x81580000	! t0_kref+0x175c:   	flushw
	.word	0x81580000	! t0_kref+0x1760:   	flushw
	.word	0xd91e001d	! t0_kref+0x1764:   	ldd	[%i0 + %i5], %f12
	.word	0xd22e2018	! t0_kref+0x1768:   	stb	%o1, [%i0 + 0x18]
	.word	0xf836600a	! t0_kref+0x176c:   	sth	%i4, [%i1 + 0xa]
	.word	0xa1a01a34	! t0_kref+0x1770:   	fstoi	%f20, %f16
	.word	0xff06401c	! t0_kref+0x1774:   	ld	[%i1 + %i4], %f31
	.word	0x86102001	! t0_kref+0x1778:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x177c:   	bne,a	_kref+0x177c
	.word	0x86a0e001	! t0_kref+0x1780:   	subcc	%g3, 1, %g3
	.word	0xd86e6015	! t0_kref+0x1784:   	ldstub	[%i1 + 0x15], %o4
	.word	0xe22e3fea	! t0_kref+0x1788:   	stb	%l1, [%i0 - 0x16]
	.word	0xd4380019	! t0_kref+0x178c:   	std	%o2, [%g0 + %i1]
	.word	0x3b800005	! t0_kref+0x1790:   	fble,a	_kref+0x17a4
	.word	0x9db7891e	! t0_kref+0x1794:   	faligndata	%f30, %f30, %f14
	.word	0xac2af372	! t0_kref+0x1798:   	andn	%o3, -0xc8e, %l6
	.word	0xe9ee101b	! t0_kref+0x179c:   	prefetcha	%i0 + %i3, 20
	.word	0xb5a0055e	! t0_kref+0x17a0:   	fsqrtd	%f30, %f26
	call	SYM(t0_subr1)
	.word	0xe9180019	! t0_kref+0x17a8:   	ldd	[%g0 + %i1], %f20
	.word	0xaa7d618f	! t0_kref+0x17ac:   	sdiv	%l5, 0x18f, %l5
	.word	0x9de3bfa0	! t0_kref+0x17b0:   	save	%sp, -0x60, %sp
	.word	0xb50e001b	! t0_kref+0x17b4:   	tsubcc	%i0, %i3, %i2
	.word	0xa7ef0019	! t0_kref+0x17b8:   	restore	%i4, %i1, %l3
	.word	0xa4a4c01a	! t0_kref+0x17bc:   	subcc	%l3, %i2, %l2
	.word	0x8184c000	! t0_kref+0x17c0:   	wr	%l3, %g0, %y
	call	SYM(t0_subr0)
	.word	0x909daf5c	! t0_kref+0x17c8:   	xorcc	%l6, 0xf5c, %o0
	.word	0xec380019	! t0_kref+0x17cc:   	std	%l6, [%g0 + %i1]
	.word	0xa3400000	! t0_kref+0x17d0:   	mov	%y, %l1
	call	SYM(t0_subr1)
	.word	0xacfb715f	! t0_kref+0x17d8:   	sdivcc	%o5, -0xea1, %l6
	.word	0x81af0a3b	! t0_kref+0x17dc:   	fcmps	%fcc0, %f28, %f27
	.word	0x9fc00004	! t0_kref+0x17e0:   	call	%g0 + %g4
	.word	0xada0005e	! t0_kref+0x17e4:   	fmovd	%f30, %f22
	.word	0xb1a01a3a	! t0_kref+0x17e8:   	fstoi	%f26, %f24
	.word	0xf6262014	! t0_kref+0x17ec:   	st	%i3, [%i0 + 0x14]
	.word	0xa4ad762d	! t0_kref+0x17f0:   	andncc	%l5, -0x9d3, %l2
	.word	0xe5e61016	! t0_kref+0x17f4:   	casa	[%i0]0x80, %l6, %l2
	.word	0xae7c801b	! t0_kref+0x17f8:   	sdiv	%l2, %i3, %l7
	.word	0xe6263ff8	! t0_kref+0x17fc:   	st	%l3, [%i0 - 8]
	.word	0xa23dc009	! t0_kref+0x1800:   	xnor	%l7, %o1, %l1
	.word	0xa5b78c9a	! t0_kref+0x1804:   	fandnot2	%f30, %f26, %f18
	.word	0xe9e6500a	! t0_kref+0x1808:   	casa	[%i1]0x80, %o2, %l4
	.word	0xb1a00558	! t0_kref+0x180c:   	fsqrtd	%f24, %f24
	.word	0xb5a01894	! t0_kref+0x1810:   	fitos	%f20, %f26
	.word	0x81848000	! t0_kref+0x1814:   	wr	%l2, %g0, %y
	.word	0x23480007	! t0_kref+0x1818:   	fbne,a,pt	%fcc0, _kref+0x1834
	.word	0xd6267fe0	! t0_kref+0x181c:   	st	%o3, [%i1 - 0x20]
	.word	0x81dbc008	! t0_kref+0x1820:   	flush	%o7 + %o0
	.word	0x3d800003	! t0_kref+0x1824:   	fbule,a	_kref+0x1830
	.word	0x947dffd6	! t0_kref+0x1828:   	sdiv	%l7, -0x2a, %o2
	.word	0xb1a5cd34	! t0_kref+0x182c:   	fsmuld	%f23, %f20, %f24
	.word	0xada0191b	! t0_kref+0x1830:   	fitod	%f27, %f22
	.word	0x9525800c	! t0_kref+0x1834:   	mulscc	%l6, %o4, %o2
	.word	0xb9a0193f	! t0_kref+0x1838:   	fstod	%f31, %f28
	.word	0xd4be101d	! t0_kref+0x183c:   	stda	%o2, [%i0 + %i5]0x80
	.word	0xb9a98054	! t0_kref+0x1840:   	fmovdg	%fcc0, %f20, %f28
	.word	0xba103fe8	! t0_kref+0x1844:   	mov	0xffffffe8, %i5
	.word	0x9da01937	! t0_kref+0x1848:   	fstod	%f23, %f14
	.word	0x9db50998	! t0_kref+0x184c:   	bshuffle	%f20, %f24, %f14
	.word	0x9da3884e	! t0_kref+0x1850:   	faddd	%f14, %f14, %f14
	.word	0xa672a2a7	! t0_kref+0x1854:   	udiv	%o2, 0x2a7, %l3
	.word	0x2b480001	! t0_kref+0x1858:   	fbug,a,pt	%fcc0, _kref+0x185c
	.word	0xec06200c	! t0_kref+0x185c:   	ld	[%i0 + 0xc], %l6
	.word	0xadb387d0	! t0_kref+0x1860:   	pdist	%f14, %f16, %f22
	.word	0x3d480008	! t0_kref+0x1864:   	fbule,a,pt	%fcc0, _kref+0x1884
	.word	0x2d28aa7c	! t0_kref+0x1868:   	sethi	%hi(0xa2a9f000), %l6
	.word	0x9ba748bb	! t0_kref+0x186c:   	fsubs	%f29, %f27, %f13
	.word	0xa2134017	! t0_kref+0x1870:   	or	%o5, %l7, %l1
	.word	0xb5a4895e	! t0_kref+0x1874:   	fmuld	%f18, %f30, %f26
	.word	0xf628a007	! t0_kref+0x1878:   	stb	%i3, [%g2 + 7]
	.word	0x9fb00774	! t0_kref+0x187c:   	fpack16	%f20, %f15
	.word	0x920cbbf0	! t0_kref+0x1880:   	and	%l2, -0x410, %o1
	.word	0x2c480002	! t0_kref+0x1884:   	bneg,a,pt	%icc, _kref+0x188c
	.word	0xa1b68914	! t0_kref+0x1888:   	faligndata	%f26, %f20, %f16
	.word	0xe26e7ff8	! t0_kref+0x188c:   	ldstub	[%i1 - 8], %l1
	.word	0x2a800003	! t0_kref+0x1890:   	bcs,a	_kref+0x189c
	.word	0xea0e001a	! t0_kref+0x1894:   	ldub	[%i0 + %i2], %l5
	.word	0x94fa654e	! t0_kref+0x1898:   	sdivcc	%o1, 0x54e, %o2
	.word	0xbdb4ce76	! t0_kref+0x189c:   	fxnors	%f19, %f22, %f30
	.word	0xa8672d64	! t0_kref+0x18a0:   	subc	%i4, 0xd64, %l4
	.word	0xd25e3fe0	! t0_kref+0x18a4:   	ldx	[%i0 - 0x20], %o1
	.word	0xa8124010	! t0_kref+0x18a8:   	or	%o1, %l0, %l4
	.word	0x913f0013	! t0_kref+0x18ac:   	sra	%i4, %l3, %o0
	.word	0xabb00c20	! t0_kref+0x18b0:   	fzeros	%f21
	.word	0x24480008	! t0_kref+0x18b4:   	ble,a,pt	%icc, _kref+0x18d4
	.word	0xada0105c	! t0_kref+0x18b8:   	fdtox	%f28, %f22
	.word	0x27480002	! t0_kref+0x18bc:   	fbul,a,pt	%fcc0, _kref+0x18c4
	.word	0xe8200019	! t0_kref+0x18c0:   	st	%l4, [%g0 + %i1]
	.word	0x9da489ce	! t0_kref+0x18c4:   	fdivd	%f18, %f14, %f14
	.word	0xada38d3a	! t0_kref+0x18c8:   	fsmuld	%f14, %f26, %f22
	.word	0xa1b74ab2	! t0_kref+0x18cc:   	fpsub16s	%f29, %f18, %f16
	.word	0x9f414000	! t0_kref+0x18d0:   	mov	%pc, %o7
	.word	0xafb6801c	! t0_kref+0x18d4:   	edge8	%i2, %i4, %l7
	.word	0xd4be5000	! t0_kref+0x18d8:   	stda	%o2, [%i1]0x80
	.word	0xb5a000ba	! t0_kref+0x18dc:   	fnegs	%f26, %f26
	.word	0xb1a688b6	! t0_kref+0x18e0:   	fsubs	%f26, %f22, %f24
	.word	0x29480008	! t0_kref+0x18e4:   	fbl,a,pt	%fcc0, _kref+0x1904
	.word	0xa1a3085a	! t0_kref+0x18e8:   	faddd	%f12, %f26, %f16
	.word	0xec070019	! t0_kref+0x18ec:   	ld	[%i4 + %i1], %l6
	.word	0x30480003	! t0_kref+0x18f0:   	ba,a,pt	%icc, _kref+0x18fc
	.word	0xf83e401d	! t0_kref+0x18f4:   	std	%i4, [%i1 + %i5]
	.word	0xb3a0189c	! t0_kref+0x18f8:   	fitos	%f28, %f25
	.word	0xb5b00cd2	! t0_kref+0x18fc:   	fnot2	%f18, %f26
	.word	0xa9a0013d	! t0_kref+0x1900:   	fabss	%f29, %f20
	.word	0xb5a408b1	! t0_kref+0x1904:   	fsubs	%f16, %f17, %f26
	.word	0xc807bff0	! t0_kref+0x1908:   	ld	[%fp - 0x10], %g4
	.word	0xbfa0053d	! t0_kref+0x190c:   	fsqrts	%f29, %f31
	.word	0x86102001	! t0_kref+0x1910:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1914:   	bne,a	_kref+0x1914
	.word	0x86a0e001	! t0_kref+0x1918:   	subcc	%g3, 1, %g3
	.word	0xbdb48e7f	! t0_kref+0x191c:   	fxnors	%f18, %f31, %f30
	.word	0x81adcabf	! t0_kref+0x1920:   	fcmpes	%fcc0, %f23, %f31
	.word	0xa9a00554	! t0_kref+0x1924:   	fsqrtd	%f20, %f20
	.word	0x38800005	! t0_kref+0x1928:   	bgu,a	_kref+0x193c
	.word	0x9db54d60	! t0_kref+0x192c:   	fnot1s	%f21, %f14
	.word	0xad242d9e	! t0_kref+0x1930:   	mulscc	%l0, 0xd9e, %l6
	.word	0x22800007	! t0_kref+0x1934:   	be,a	_kref+0x1950
	.word	0x92d32c98	! t0_kref+0x1938:   	umulcc	%o4, 0xc98, %o1
	.word	0xa1a0189c	! t0_kref+0x193c:   	fitos	%f28, %f16
	.word	0xbfa3c838	! t0_kref+0x1940:   	fadds	%f15, %f24, %f31
	.word	0xb5a0054c	! t0_kref+0x1944:   	fsqrtd	%f12, %f26
	.word	0xe53e3fe8	! t0_kref+0x1948:   	std	%f18, [%i0 - 0x18]
	.word	0x92602fa6	! t0_kref+0x194c:   	subc	%g0, 0xfa6, %o1
	.word	0x32480008	! t0_kref+0x1950:   	bne,a,pt	%icc, _kref+0x1970
	.word	0xd028a036	! t0_kref+0x1954:   	stb	%o0, [%g2 + 0x36]
	.word	0xd0ce6002	! t0_kref+0x1958:   	ldsba	[%i1 + 2]%asi, %o0
	.word	0xb9a74835	! t0_kref+0x195c:   	fadds	%f29, %f21, %f28
	.word	0xe7063fe0	! t0_kref+0x1960:   	ld	[%i0 - 0x20], %f19
	.word	0xed067fe4	! t0_kref+0x1964:   	ld	[%i1 - 0x1c], %f22
	.word	0xada608af	! t0_kref+0x1968:   	fsubs	%f24, %f15, %f22
	.word	0xaa0527c2	! t0_kref+0x196c:   	add	%l4, 0x7c2, %l5
	.word	0x3c480003	! t0_kref+0x1970:   	bpos,a,pt	%icc, _kref+0x197c
	.word	0xa72aa001	! t0_kref+0x1974:   	sll	%o2, 0x1, %l3
	.word	0xada5095e	! t0_kref+0x1978:   	fmuld	%f20, %f30, %f22
	.word	0xad64c011	! t0_kref+0x197c:   	movl	%icc, %l1, %l6
	.word	0x33480006	! t0_kref+0x1980:   	fbe,a,pt	%fcc0, _kref+0x1998
	.word	0x93b5048e	! t0_kref+0x1984:   	fcmple32	%f20, %f14, %o1
	.word	0xa7b00772	! t0_kref+0x1988:   	fpack16	%f18, %f19
	.word	0xf1066004	! t0_kref+0x198c:   	ld	[%i1 + 4], %f24
	.word	0x21480004	! t0_kref+0x1990:   	fbn,a,pt	%fcc0, _kref+0x19a0
	.word	0x8143c000	! t0_kref+0x1994:   	stbar
	.word	0xd42e7fee	! t0_kref+0x1998:   	stb	%o2, [%i1 - 0x12]
	.word	0xec76001d	! t0_kref+0x199c:   	stx	%l6, [%i0 + %i5]
	.word	0x23800006	! t0_kref+0x19a0:   	fbne,a	_kref+0x19b8
	.word	0xd826001c	! t0_kref+0x19a4:   	st	%o4, [%i0 + %i4]
	.word	0xae1a401c	! t0_kref+0x19a8:   	xor	%o1, %i4, %l7
	.word	0xa9a388b8	! t0_kref+0x19ac:   	fsubs	%f14, %f24, %f20
	.word	0xbdb58910	! t0_kref+0x19b0:   	faligndata	%f22, %f16, %f30
	.word	0xe26e3ff3	! t0_kref+0x19b4:   	ldstub	[%i0 - 0xd], %l1
	.word	0x81df3b65	! t0_kref+0x19b8:   	flush	%i4 - 0x49b
	.word	0xc12e401c	! t0_kref+0x19bc:   	st	%fsr, [%i1 + %i4]
	.word	0xa1b48494	! t0_kref+0x19c0:   	fcmple32	%f18, %f20, %l0
	.word	0xf9be5811	! t0_kref+0x19c4:   	stda	%f28, [%i1 + %l1]0xc0
	.word	0xe1062008	! t0_kref+0x19c8:   	ld	[%i0 + 8], %f16
	.word	0x90880015	! t0_kref+0x19cc:   	andcc	%g0, %l5, %o0
	.word	0xe89e5000	! t0_kref+0x19d0:   	ldda	[%i1]0x80, %l4
	.word	0x81ac8ab5	! t0_kref+0x19d4:   	fcmpes	%fcc0, %f18, %f21
	.word	0xee7e401c	! t0_kref+0x19d8:   	swap	[%i1 + %i4], %l7
	.word	0xadb50496	! t0_kref+0x19dc:   	fcmple32	%f20, %f22, %l6
	.word	0xf93f4018	! t0_kref+0x19e0:   	std	%f28, [%i5 + %i0]
	.word	0xefe8a007	! t0_kref+0x19e4:   	prefetcha	%g2 + 7, 23
	.word	0xaedcabc7	! t0_kref+0x19e8:   	smulcc	%l2, 0xbc7, %l7
	.word	0x94b4c011	! t0_kref+0x19ec:   	orncc	%l3, %l1, %o2
	.word	0xe9e8a009	! t0_kref+0x19f0:   	prefetcha	%g2 + 9, 20
	.word	0xd4562014	! t0_kref+0x19f4:   	ldsh	[%i0 + 0x14], %o2
	.word	0xb7a0053c	! t0_kref+0x19f8:   	fsqrts	%f28, %f27
	.word	0xa06469cb	! t0_kref+0x19fc:   	subc	%l1, 0x9cb, %l0
	.word	0xe7000019	! t0_kref+0x1a00:   	ld	[%g0 + %i1], %f19
	.word	0x24480001	! t0_kref+0x1a04:   	ble,a,pt	%icc, _kref+0x1a08
	.word	0xaba0189a	! t0_kref+0x1a08:   	fitos	%f26, %f21
	.word	0x25800004	! t0_kref+0x1a0c:   	fblg,a	_kref+0x1a1c
	.word	0xef26401c	! t0_kref+0x1a10:   	st	%f23, [%i1 + %i4]
	.word	0xe8266000	! t0_kref+0x1a14:   	st	%l4, [%i1]
	.word	0x81ddba3a	! t0_kref+0x1a18:   	flush	%l6 - 0x5c6
	.word	0x81ac8a50	! t0_kref+0x1a1c:   	fcmpd	%fcc0, %f18, %f16
	.word	0x9da00533	! t0_kref+0x1a20:   	fsqrts	%f19, %f14
	.word	0x9da0054e	! t0_kref+0x1a24:   	fsqrtd	%f14, %f14
	.word	0xa85b6557	! t0_kref+0x1a28:   	smul	%o5, 0x557, %l4
	.word	0x3c800002	! t0_kref+0x1a2c:   	bpos,a	_kref+0x1a34
	.word	0xb5a01938	! t0_kref+0x1a30:   	fstod	%f24, %f26
	.word	0x81854000	! t0_kref+0x1a34:   	wr	%l5, %g0, %y
	.word	0xa9b4c02a	! t0_kref+0x1a38:   	edge8n	%l3, %o2, %l4
	.word	0xafa01a39	! t0_kref+0x1a3c:   	fstoi	%f25, %f23
	.word	0xafb00f2d	! t0_kref+0x1a40:   	fsrc2s	%f13, %f23
	.word	0xb5b40eee	! t0_kref+0x1a44:   	fornot2s	%f16, %f14, %f26
	.word	0xaed68013	! t0_kref+0x1a48:   	umulcc	%i2, %l3, %l7
	.word	0x81dbc010	! t0_kref+0x1a4c:   	flush	%o7 + %l0
	.word	0xa9a0193d	! t0_kref+0x1a50:   	fstod	%f29, %f20
	.word	0xdd3e7ff8	! t0_kref+0x1a54:   	std	%f14, [%i1 - 8]
	.word	0xbda018d0	! t0_kref+0x1a58:   	fdtos	%f16, %f30
	.word	0xa4dd001a	! t0_kref+0x1a5c:   	smulcc	%l4, %i2, %l2
	.word	0xf99f1a18	! t0_kref+0x1a60:   	ldda	[%i4 + %i0]0xd0, %f28
	.word	0xb7a0052f	! t0_kref+0x1a64:   	fsqrts	%f15, %f27
	.word	0xec3e4000	! t0_kref+0x1a68:   	std	%l6, [%i1]
	.word	0xea5e7ff8	! t0_kref+0x1a6c:   	ldx	[%i1 - 8], %l5
	.word	0xa1b70e4e	! t0_kref+0x1a70:   	fxnor	%f28, %f14, %f16
	.word	0x9524800d	! t0_kref+0x1a74:   	mulscc	%l2, %o5, %o2
	.word	0xabb680fc	! t0_kref+0x1a78:   	edge16ln	%i2, %i4, %l5
	.word	0x2a800004	! t0_kref+0x1a7c:   	bcs,a	_kref+0x1a8c
	.word	0x81dfb23e	! t0_kref+0x1a80:   	flush	%fp - 0xdc2
	.word	0xec3e3fe0	! t0_kref+0x1a84:   	std	%l6, [%i0 - 0x20]
	.word	0xdb06001c	! t0_kref+0x1a88:   	ld	[%i0 + %i4], %f13
	.word	0xea200019	! t0_kref+0x1a8c:   	st	%l5, [%g0 + %i1]
	.word	0xe62e4000	! t0_kref+0x1a90:   	stb	%l3, [%i1]
	.word	0xada00131	! t0_kref+0x1a94:   	fabss	%f17, %f22
	.word	0xbba000ae	! t0_kref+0x1a98:   	fnegs	%f14, %f29
	.word	0xe60e6002	! t0_kref+0x1a9c:   	ldub	[%i1 + 2], %l3
	.word	0xada01a31	! t0_kref+0x1aa0:   	fstoi	%f17, %f22
	.word	0x949c4011	! t0_kref+0x1aa4:   	xorcc	%l1, %l1, %o2
	.word	0xa7a5c8bd	! t0_kref+0x1aa8:   	fsubs	%f23, %f29, %f19
	.word	0xa004a8a5	! t0_kref+0x1aac:   	add	%l2, 0x8a5, %l0
	.word	0xa086c010	! t0_kref+0x1ab0:   	addcc	%i3, %l0, %l0
	.word	0xe2680019	! t0_kref+0x1ab4:   	ldstub	[%g0 + %i1], %l1
	.word	0x8143e040	! t0_kref+0x1ab8:   	membar	0x40
	.word	0xbfa00536	! t0_kref+0x1abc:   	fsqrts	%f22, %f31
	.word	0xf7266018	! t0_kref+0x1ac0:   	st	%f27, [%i1 + 0x18]
	.word	0x81df7a1d	! t0_kref+0x1ac4:   	flush	%i5 - 0x5e3
	.word	0xb5b78dd2	! t0_kref+0x1ac8:   	fnand	%f30, %f18, %f26
	.word	0xa5a608b0	! t0_kref+0x1acc:   	fsubs	%f24, %f16, %f18
	.word	0x27480006	! t0_kref+0x1ad0:   	fbul,a,pt	%fcc0, _kref+0x1ae8
	.word	0xa075ba88	! t0_kref+0x1ad4:   	udiv	%l6, -0x578, %l0
	.word	0xe00e6013	! t0_kref+0x1ad8:   	ldub	[%i1 + 0x13], %l0
	.word	0xa4d7001b	! t0_kref+0x1adc:   	umulcc	%i4, %i3, %l2
	.word	0x13260f66	! t0_kref+0x1ae0:   	sethi	%hi(0x983d9800), %o1
	.word	0xea4e0000	! t0_kref+0x1ae4:   	ldsb	[%i0], %l5
	.word	0xb7b00776	! t0_kref+0x1ae8:   	fpack16	%f22, %f27
	.word	0xf1063fe4	! t0_kref+0x1aec:   	ld	[%i0 - 0x1c], %f24
	.word	0xa8537b9f	! t0_kref+0x1af0:   	umul	%o5, -0x461, %l4
	.word	0xad26b09d	! t0_kref+0x1af4:   	mulscc	%i2, -0xf63, %l6
	.word	0x91b44133	! t0_kref+0x1af8:   	edge32n	%l1, %l3, %o0
	.word	0xadb50412	! t0_kref+0x1afc:   	fcmple16	%f20, %f18, %l6
	.word	0xea366010	! t0_kref+0x1b00:   	sth	%l5, [%i1 + 0x10]
	.word	0xb9a01918	! t0_kref+0x1b04:   	fitod	%f24, %f28
	.word	0x253c23aa	! t0_kref+0x1b08:   	sethi	%hi(0xf08ea800), %l2
	.word	0x94fdf0e5	! t0_kref+0x1b0c:   	sdivcc	%l7, -0xf1b, %o2
	.word	0xa9a01a56	! t0_kref+0x1b10:   	fdtoi	%f22, %f20
	.word	0xacba63a0	! t0_kref+0x1b14:   	xnorcc	%o1, 0x3a0, %l6
	.word	0xada548bf	! t0_kref+0x1b18:   	fsubs	%f21, %f31, %f22
	.word	0xada00550	! t0_kref+0x1b1c:   	fsqrtd	%f16, %f22
	.word	0xa1a448ae	! t0_kref+0x1b20:   	fsubs	%f17, %f14, %f16
	.word	0xc1ee1014	! t0_kref+0x1b24:   	prefetcha	%i0 + %l4, 0
	.word	0xf1be589c	! t0_kref+0x1b28:   	stda	%f24, [%i1 + %i4]0xc4
	.word	0x9da7895e	! t0_kref+0x1b2c:   	fmuld	%f30, %f30, %f14
	.word	0xa9b00cde	! t0_kref+0x1b30:   	fnot2	%f30, %f20
	.word	0xbdb68c4e	! t0_kref+0x1b34:   	fnor	%f26, %f14, %f30
	.word	0xd4ce3fed	! t0_kref+0x1b38:   	ldsba	[%i0 - 0x13]%asi, %o2
	.word	0xecc8a026	! t0_kref+0x1b3c:   	ldsba	[%g2 + 0x26]%asi, %l6
	.word	0x9fc00004	! t0_kref+0x1b40:   	call	%g0 + %g4
	.word	0xea266014	! t0_kref+0x1b44:   	st	%l5, [%i1 + 0x14]
	.word	0x33480007	! t0_kref+0x1b48:   	fbe,a,pt	%fcc0, _kref+0x1b64
	.word	0xa8d4f8b6	! t0_kref+0x1b4c:   	umulcc	%l3, -0x74a, %l4
	.word	0xe24e200b	! t0_kref+0x1b50:   	ldsb	[%i0 + 0xb], %l1
	.word	0x907d4017	! t0_kref+0x1b54:   	sdiv	%l5, %l7, %o0
	.word	0xe16e401b	! t0_kref+0x1b58:   	prefetch	%i1 + %i3, 16
	.word	0xc0ae101a	! t0_kref+0x1b5c:   	stba	%g0, [%i0 + %i2]0x80
	.word	0xb1a0013f	! t0_kref+0x1b60:   	fabss	%f31, %f24
	.word	0xa9a0053c	! t0_kref+0x1b64:   	fsqrts	%f28, %f20
	.word	0x26800002	! t0_kref+0x1b68:   	bl,a	_kref+0x1b70
	.word	0x9bb00c20	! t0_kref+0x1b6c:   	fzeros	%f13
	.word	0xada488de	! t0_kref+0x1b70:   	fsubd	%f18, %f30, %f22
	.word	0xa6b8000a	! t0_kref+0x1b74:   	xnorcc	%g0, %o2, %l3
	.word	0xa6dd800d	! t0_kref+0x1b78:   	smulcc	%l6, %o5, %l3
	.word	0xb5a4094e	! t0_kref+0x1b7c:   	fmuld	%f16, %f14, %f26
	.word	0x921d400a	! t0_kref+0x1b80:   	xor	%l5, %o2, %o1
	.word	0xfd20a020	! t0_kref+0x1b84:   	st	%f30, [%g2 + 0x20]
	.word	0xaa172fd2	! t0_kref+0x1b88:   	or	%i4, 0xfd2, %l5
	.word	0xa9a018d6	! t0_kref+0x1b8c:   	fdtos	%f22, %f20
	.word	0x9db34ea0	! t0_kref+0x1b90:   	fsrc1s	%f13, %f14
	.word	0xc3e8a000	! t0_kref+0x1b94:   	prefetcha	%g2, 1
	.word	0xf9be1a5c	! t0_kref+0x1b98:   	stda	%f28, [%i0 + %i4]0xd2
	.word	0x9db506f4	! t0_kref+0x1b9c:   	fmul8ulx16	%f20, %f20, %f14
	.word	0xa9a54833	! t0_kref+0x1ba0:   	fadds	%f21, %f19, %f20
	.word	0xdd3e001d	! t0_kref+0x1ba4:   	std	%f14, [%i0 + %i5]
	.word	0xae67001c	! t0_kref+0x1ba8:   	subc	%i4, %i4, %l7
	.word	0xadb50a5a	! t0_kref+0x1bac:   	fpadd32	%f20, %f26, %f22
	.word	0xaa168014	! t0_kref+0x1bb0:   	or	%i2, %l4, %l5
	.word	0x8143e040	! t0_kref+0x1bb4:   	membar	0x40
	.word	0x9fa0189b	! t0_kref+0x1bb8:   	fitos	%f27, %f15
	.word	0x81de0000	! t0_kref+0x1bbc:   	flush	%i0
	.word	0x33480005	! t0_kref+0x1bc0:   	fbe,a,pt	%fcc0, _kref+0x1bd4
	.word	0xa1a0055c	! t0_kref+0x1bc4:   	fsqrtd	%f28, %f16
	.word	0xee4e6014	! t0_kref+0x1bc8:   	ldsb	[%i1 + 0x14], %l7
	.word	0xb1a018dc	! t0_kref+0x1bcc:   	fdtos	%f28, %f24
	.word	0x34480002	! t0_kref+0x1bd0:   	bg,a,pt	%icc, _kref+0x1bd8
	.word	0xea270018	! t0_kref+0x1bd4:   	st	%l5, [%i4 + %i0]
	call	SYM(t0_subr1)
	.word	0x81824000	! t0_kref+0x1bdc:   	wr	%o1, %g0, %y
!	.word	0x3abfd108	! t0_kref+0x1be0:   	bcc,a	SYM(t0_subr0)
	   	bcc,a	SYM(t0_subr0)
	.word	0x9f414000	! t0_kref+0x1be4:   	mov	%pc, %o7
	.word	0xb9a0189c	! t0_kref+0x1be8:   	fitos	%f28, %f28
	.word	0xd0563fe8	! t0_kref+0x1bec:   	ldsh	[%i0 - 0x18], %o0
	.word	0xada00138	! t0_kref+0x1bf0:   	fabss	%f24, %f22
	.word	0x9ba01890	! t0_kref+0x1bf4:   	fitos	%f16, %f13
	.word	0xd2b0a034	! t0_kref+0x1bf8:   	stha	%o1, [%g2 + 0x34]%asi
	.word	0xb7a000ae	! t0_kref+0x1bfc:   	fnegs	%f14, %f27
	.word	0xa2d2656c	! t0_kref+0x1c00:   	umulcc	%o1, 0x56c, %l1
	.word	0xb8102014	! t0_kref+0x1c04:   	mov	0x14, %i4
	.word	0xb9a000bf	! t0_kref+0x1c08:   	fnegs	%f31, %f28
	.word	0xaba608be	! t0_kref+0x1c0c:   	fsubs	%f24, %f30, %f21
	.word	0xafb34009	! t0_kref+0x1c10:   	edge8	%o5, %o1, %l7
	.word	0x8610201b	! t0_kref+0x1c14:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x1c18:   	subcc	%g3, 1, %g3
	.word	0x22800020	! t0_kref+0x1c1c:   	be,a	_kref+0x1c9c
	.word	0x9da609cc	! t0_kref+0x1c20:   	fdivd	%f24, %f12, %f14
	.word	0xa0de8010	! t0_kref+0x1c24:   	smulcc	%i2, %l0, %l0
	.word	0x81da000e	! t0_kref+0x1c28:   	flush	%o0 + %sp
	.word	0xe2266000	! t0_kref+0x1c2c:   	st	%l1, [%i1]
	.word	0xa9b58ed0	! t0_kref+0x1c30:   	fornot2	%f22, %f16, %f20
	.word	0xac66c01c	! t0_kref+0x1c34:   	subc	%i3, %i4, %l6
	.word	0xed262000	! t0_kref+0x1c38:   	st	%f22, [%i0]
	.word	0x81ab0adc	! t0_kref+0x1c3c:   	fcmped	%fcc0, %f12, %f28
	.word	0xb5a54d32	! t0_kref+0x1c40:   	fsmuld	%f21, %f18, %f26
	.word	0x95400000	! t0_kref+0x1c44:   	mov	%y, %o2
	.word	0xe8ae9019	! t0_kref+0x1c48:   	stba	%l4, [%i2 + %i1]0x80
	.word	0x28480007	! t0_kref+0x1c4c:   	bleu,a,pt	%icc, _kref+0x1c68
	.word	0xd48e501a	! t0_kref+0x1c50:   	lduba	[%i1 + %i2]0x80, %o2
	.word	0xabb44eed	! t0_kref+0x1c54:   	fornot2s	%f17, %f13, %f21
	.word	0xe2267ff0	! t0_kref+0x1c58:   	st	%l1, [%i1 - 0x10]
	.word	0xa7b34abc	! t0_kref+0x1c5c:   	fpsub16s	%f13, %f28, %f19
	.word	0xa784fe57	! t0_kref+0x1c60:   	wr	%l3, 0xfffffe57, %gsr
	.word	0xa67a2341	! t0_kref+0x1c64:   	sdiv	%o0, 0x341, %l3
	.word	0xb1a50852	! t0_kref+0x1c68:   	faddd	%f20, %f18, %f24
	.word	0x81ae0a37	! t0_kref+0x1c6c:   	fcmps	%fcc0, %f24, %f23
	.word	0xd26e7fe1	! t0_kref+0x1c70:   	ldstub	[%i1 - 0x1f], %o1
	.word	0x9ba0189e	! t0_kref+0x1c74:   	fitos	%f30, %f13
	.word	0x9212bfac	! t0_kref+0x1c78:   	or	%o2, -0x54, %o1
	.word	0xa5b74dfa	! t0_kref+0x1c7c:   	fnands	%f29, %f26, %f18
	.word	0xa3a0053d	! t0_kref+0x1c80:   	fsqrts	%f29, %f17
	.word	0xb5a01037	! t0_kref+0x1c84:   	fstox	%f23, %f26
	.word	0xe056401b	! t0_kref+0x1c88:   	ldsh	[%i1 + %i3], %l0
	.word	0xa61cfea4	! t0_kref+0x1c8c:   	xor	%l3, -0x15c, %l3
	.word	0xaa9ab1b6	! t0_kref+0x1c90:   	xorcc	%o2, -0xe4a, %l5
	.word	0xec7f0019	! t0_kref+0x1c94:   	swap	[%i4 + %i1], %l6
	.word	0xb3a018d2	! t0_kref+0x1c98:   	fdtos	%f18, %f25
	.word	0x9da409d2	! t0_kref+0x1c9c:   	fdivd	%f16, %f18, %f14
	.word	0xa89d4012	! t0_kref+0x1ca0:   	xorcc	%l5, %l2, %l4
	call	SYM(t0_subr3)
	.word	0x81b01023	! t0_kref+0x1ca8:   	siam	0x3
	.word	0x36480007	! t0_kref+0x1cac:   	bge,a,pt	%icc, _kref+0x1cc8
	.word	0xa28d0015	! t0_kref+0x1cb0:   	andcc	%l4, %l5, %l1
	.word	0x001fffff	! t0_kref+0x1cb4:   	illtrap	0x1fffff
	.word	0xa47a8017	! t0_kref+0x1cb8:   	sdiv	%o2, %l7, %l2
	.word	0xa5a3c82d	! t0_kref+0x1cbc:   	fadds	%f15, %f13, %f18
	.word	0xa9a348bd	! t0_kref+0x1cc0:   	fsubs	%f13, %f29, %f20
	.word	0xa6d5e263	! t0_kref+0x1cc4:   	umulcc	%l7, 0x263, %l3
	.word	0x81da2204	! t0_kref+0x1cc8:   	flush	%o0 + 0x204
	.word	0xb9b50d94	! t0_kref+0x1ccc:   	fxor	%f20, %f20, %f28
	.word	0x81ab8a31	! t0_kref+0x1cd0:   	fcmps	%fcc0, %f14, %f17
	.word	0xe4280018	! t0_kref+0x1cd4:   	stb	%l2, [%g0 + %i0]
	.word	0xa9a608dc	! t0_kref+0x1cd8:   	fsubd	%f24, %f28, %f20
	.word	0x26800001	! t0_kref+0x1cdc:   	bl,a	_kref+0x1ce0
	.word	0xe2266000	! t0_kref+0x1ce0:   	st	%l1, [%i1]
	.word	0x99a70958	! t0_kref+0x1ce4:   	fmuld	%f28, %f24, %f12
	.word	0xa132a01d	! t0_kref+0x1ce8:   	srl	%o2, 0x1d, %l0
	.word	0xea280019	! t0_kref+0x1cec:   	stb	%l5, [%g0 + %i1]
	.word	0xa1b009bb	! t0_kref+0x1cf0:   	fexpand	%f27, %f16
	.word	0xa7a0013c	! t0_kref+0x1cf4:   	fabss	%f28, %f19
	.word	0xd406201c	! t0_kref+0x1cf8:   	ld	[%i0 + 0x1c], %o2
	.word	0xa818336d	! t0_kref+0x1cfc:   	xor	%g0, -0xc93, %l4
	.word	0xa60d400a	! t0_kref+0x1d00:   	and	%l5, %o2, %l3
	.word	0xa723284d	! t0_kref+0x1d04:   	mulscc	%o4, 0x84d, %l3
	.word	0xd46e3fe9	! t0_kref+0x1d08:   	ldstub	[%i0 - 0x17], %o2
	.word	0x1123fa11	! t0_kref+0x1d0c:   	sethi	%hi(0x8fe84400), %o0
	.word	0xa3408000	! t0_kref+0x1d10:   	mov	%ccr, %l1
	.word	0x3c800007	! t0_kref+0x1d14:   	bpos,a	_kref+0x1d30
	.word	0x8186c000	! t0_kref+0x1d18:   	wr	%i3, %g0, %y
	.word	0xdb06201c	! t0_kref+0x1d1c:   	ld	[%i0 + 0x1c], %f13
	.word	0xabb48dfc	! t0_kref+0x1d20:   	fnands	%f18, %f28, %f21
	.word	0xa0f6c009	! t0_kref+0x1d24:   	udivcc	%i3, %o1, %l0
	.word	0xeefe5000	! t0_kref+0x1d28:   	swapa	[%i1]0x80, %l7
	.word	0x94f5400a	! t0_kref+0x1d2c:   	udivcc	%l5, %o2, %o2
	.word	0x3e480001	! t0_kref+0x1d30:   	bvc,a,pt	%icc, _kref+0x1d34
	.word	0xbfb00774	! t0_kref+0x1d34:   	fpack16	%f20, %f31
	.word	0x3e800005	! t0_kref+0x1d38:   	bvc,a	_kref+0x1d4c
	.word	0xa0f50011	! t0_kref+0x1d3c:   	udivcc	%l4, %l1, %l0
	.word	0xa81d372e	! t0_kref+0x1d40:   	xor	%l4, -0x8d2, %l4
	.word	0xa9400000	! t0_kref+0x1d44:   	mov	%y, %l4
	.word	0xe02e3ff6	! t0_kref+0x1d48:   	stb	%l0, [%i0 - 0xa]
	.word	0xf636601a	! t0_kref+0x1d4c:   	sth	%i3, [%i1 + 0x1a]
	.word	0x35480003	! t0_kref+0x1d50:   	fbue,a,pt	%fcc0, _kref+0x1d5c
	.word	0xa0a4c00b	! t0_kref+0x1d54:   	subcc	%l3, %o3, %l0
	.word	0xc0a0a018	! t0_kref+0x1d58:   	sta	%g0, [%g2 + 0x18]%asi
	.word	0xee067ffc	! t0_kref+0x1d5c:   	ld	[%i1 - 4], %l7
	.word	0xa3400000	! t0_kref+0x1d60:   	mov	%y, %l1
	.word	0xb9a00539	! t0_kref+0x1d64:   	fsqrts	%f25, %f28
	.word	0xdd1fbe30	! t0_kref+0x1d68:   	ldd	[%fp - 0x1d0], %f14
	.word	0x81800000	! t0_kref+0x1d6c:   	mov	%g0, %y
	.word	0xa3a488b2	! t0_kref+0x1d70:   	fsubs	%f18, %f18, %f17
	.word	0xb1b00c20	! t0_kref+0x1d74:   	fzeros	%f24
	.word	0xb5b7c672	! t0_kref+0x1d78:   	fmul8x16au	%f31, %f18, %f26
	.word	0x93b540f3	! t0_kref+0x1d7c:   	edge16ln	%l5, %l3, %o1
	.word	0x81da4013	! t0_kref+0x1d80:   	flush	%o1 + %l3
	.word	0xda266014	! t0_kref+0x1d84:   	st	%o5, [%i1 + 0x14]
	.word	0x212094dc	! t0_kref+0x1d88:   	sethi	%hi(0x82537000), %l0
	.word	0xa41dc01a	! t0_kref+0x1d8c:   	xor	%l7, %i2, %l2
	.word	0xa1a40852	! t0_kref+0x1d90:   	faddd	%f16, %f18, %f16
	.word	0x81dc801d	! t0_kref+0x1d94:   	flush	%l2 + %i5
	.word	0xea500018	! t0_kref+0x1d98:   	ldsh	[%g0 + %i0], %l5
	.word	0xec062018	! t0_kref+0x1d9c:   	ld	[%i0 + 0x18], %l6
	.word	0xa8f4c00c	! t0_kref+0x1da0:   	udivcc	%l3, %o4, %l4
	.word	0xf986501c	! t0_kref+0x1da4:   	lda	[%i1 + %i4]0x80, %f28
	.word	0x9da7082d	! t0_kref+0x1da8:   	fadds	%f28, %f13, %f14
	.word	0xb9a00556	! t0_kref+0x1dac:   	fsqrtd	%f22, %f28
	.word	0xbbb007b2	! t0_kref+0x1db0:   	fpackfix	%f18, %f29
	.word	0x9de3bfa0	! t0_kref+0x1db4:   	save	%sp, -0x60, %sp
	.word	0xb60e401c	! t0_kref+0x1db8:   	and	%i1, %i4, %i3
	.word	0xabeec01d	! t0_kref+0x1dbc:   	restore	%i3, %i5, %l5
	.word	0x81df6c38	! t0_kref+0x1dc0:   	flush	%i5 + 0xc38
	.word	0x8143c000	! t0_kref+0x1dc4:   	stbar
	.word	0xa9a58850	! t0_kref+0x1dc8:   	faddd	%f22, %f16, %f20
	.word	0xf8200018	! t0_kref+0x1dcc:   	st	%i4, [%g0 + %i0]
	.word	0xb3a01a56	! t0_kref+0x1dd0:   	fdtoi	%f22, %f25
	.word	0xe0263fe8	! t0_kref+0x1dd4:   	st	%l0, [%i0 - 0x18]
	.word	0x9da0193e	! t0_kref+0x1dd8:   	fstod	%f30, %f14
	.word	0xafa01a50	! t0_kref+0x1ddc:   	fdtoi	%f16, %f23
	.word	0x940331aa	! t0_kref+0x1de0:   	add	%o4, -0xe56, %o2
	.word	0xd43e0000	! t0_kref+0x1de4:   	std	%o2, [%i0]
	.word	0x86102001	! t0_kref+0x1de8:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1dec:   	bne,a	_kref+0x1dec
	.word	0x86a0e001	! t0_kref+0x1df0:   	subcc	%g3, 1, %g3
	.word	0xa2856309	! t0_kref+0x1df4:   	addcc	%l5, 0x309, %l1
	.word	0xf1be189b	! t0_kref+0x1df8:   	stda	%f24, [%i0 + %i3]0xc4
	.word	0xad400000	! t0_kref+0x1dfc:   	mov	%y, %l6
	.word	0xd4c65000	! t0_kref+0x1e00:   	ldswa	[%i1]0x80, %o2
	.word	0x9db3c63e	! t0_kref+0x1e04:   	fmul8x16	%f15, %f30, %f14
	.word	0xa5a01a32	! t0_kref+0x1e08:   	fstoi	%f18, %f18
	.word	0xac0a0016	! t0_kref+0x1e0c:   	and	%o0, %l6, %l6
	.word	0xa875001c	! t0_kref+0x1e10:   	udiv	%l4, %i4, %l4
	.word	0xaba00532	! t0_kref+0x1e14:   	fsqrts	%f18, %f21
	.word	0xb1a0192e	! t0_kref+0x1e18:   	fstod	%f14, %f24
	.word	0x909f001c	! t0_kref+0x1e1c:   	xorcc	%i4, %i4, %o0
	.word	0xa5b70998	! t0_kref+0x1e20:   	bshuffle	%f28, %f24, %f18
	.word	0xadb5ce36	! t0_kref+0x1e24:   	fands	%f23, %f22, %f22
	.word	0xadb00c00	! t0_kref+0x1e28:   	fzero	%f22
	.word	0xac26bef3	! t0_kref+0x1e2c:   	sub	%i2, -0x10d, %l6
	.word	0x9215317d	! t0_kref+0x1e30:   	or	%l4, -0xe83, %o1
	.word	0xd0270000	! t0_kref+0x1e34:   	st	%o0, [%i4]
	.word	0xa0fa0011	! t0_kref+0x1e38:   	sdivcc	%o0, %l1, %l0
	.word	0x945a31e0	! t0_kref+0x1e3c:   	smul	%o0, -0xe20, %o2
	.word	0xa5a0052e	! t0_kref+0x1e40:   	fsqrts	%f14, %f18
	.word	0xabb30017	! t0_kref+0x1e44:   	edge8	%o4, %l7, %l5
	.word	0xa09c64b1	! t0_kref+0x1e48:   	xorcc	%l1, 0x4b1, %l0
	.word	0xb1a0189b	! t0_kref+0x1e4c:   	fitos	%f27, %f24
	.word	0xafb50175	! t0_kref+0x1e50:   	edge32ln	%l4, %l5, %l7
	.word	0xa6833af1	! t0_kref+0x1e54:   	addcc	%o4, -0x50f, %l3
	.word	0xd4200019	! t0_kref+0x1e58:   	st	%o2, [%g0 + %i1]
	.word	0xac9b7b06	! t0_kref+0x1e5c:   	xorcc	%o5, -0x4fa, %l6
	.word	0xa49ec016	! t0_kref+0x1e60:   	xorcc	%i3, %l6, %l2
	.word	0xa3b50492	! t0_kref+0x1e64:   	fcmple32	%f20, %f18, %l1
	.word	0x8610200a	! t0_kref+0x1e68:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x1e6c:   	subcc	%g3, 1, %g3
	.word	0x22800004	! t0_kref+0x1e70:   	be,a	_kref+0x1e80
	.word	0x9ba0012d	! t0_kref+0x1e74:   	fabss	%f13, %f13
	.word	0x81dc0016	! t0_kref+0x1e78:   	flush	%l0 + %l6
	.word	0xf7063ff4	! t0_kref+0x1e7c:   	ld	[%i0 - 0xc], %f27
	.word	0x9f414000	! t0_kref+0x1e80:   	mov	%pc, %o7
!	.word	0x3189105d	! t0_kref+0x1e84:   	fba,a	SYM(t0_subr2)
	   	fba,a	SYM(t0_subr2)
	.word	0xafa0053b	! t0_kref+0x1e88:   	fsqrts	%f27, %f23
	.word	0xe46e001a	! t0_kref+0x1e8c:   	ldstub	[%i0 + %i2], %l2
	.word	0xecfe501c	! t0_kref+0x1e90:   	swapa	[%i1 + %i4]0x80, %l6
	.word	0xf4267ff4	! t0_kref+0x1e94:   	st	%i2, [%i1 - 0xc]
	.word	0xe00e3fec	! t0_kref+0x1e98:   	ldub	[%i0 - 0x14], %l0
	.word	0xc108001c	! t0_kref+0x1e9c:   	ld	[%g0 + %i4], %fsr
	.word	0xa45dbceb	! t0_kref+0x1ea0:   	smul	%l6, -0x315, %l2
	.word	0xafb40e6e	! t0_kref+0x1ea4:   	fxnors	%f16, %f14, %f23
	.word	0xa21a0010	! t0_kref+0x1ea8:   	xor	%o0, %l0, %l1
	.word	0xbda7c8bb	! t0_kref+0x1eac:   	fsubs	%f31, %f27, %f30
	.word	0xb9a00558	! t0_kref+0x1eb0:   	fsqrtd	%f24, %f28
	.word	0x901d4000	! t0_kref+0x1eb4:   	xor	%l5, %g0, %o0
	.word	0xbda34d3a	! t0_kref+0x1eb8:   	fsmuld	%f13, %f26, %f30
	.word	0xa5a60d33	! t0_kref+0x1ebc:   	fsmuld	%f24, %f19, %f18
	.word	0xd87f0019	! t0_kref+0x1ec0:   	swap	[%i4 + %i1], %o4
	.word	0xd46e3ff0	! t0_kref+0x1ec4:   	ldstub	[%i0 - 0x10], %o2
	.word	0xa85f0014	! t0_kref+0x1ec8:   	smul	%i4, %l4, %l4
	.word	0xafa0052e	! t0_kref+0x1ecc:   	fsqrts	%f14, %f23
	.word	0xa5a4895a	! t0_kref+0x1ed0:   	fmuld	%f18, %f26, %f18
	.word	0xb5a0054c	! t0_kref+0x1ed4:   	fsqrtd	%f12, %f26
	.word	0x92d8001b	! t0_kref+0x1ed8:   	smulcc	%g0, %i3, %o1
	.word	0xaa742236	! t0_kref+0x1edc:   	udiv	%l0, 0x236, %l5
	.word	0xf906401c	! t0_kref+0x1ee0:   	ld	[%i1 + %i4], %f28
	.word	0xe02e200c	! t0_kref+0x1ee4:   	stb	%l0, [%i0 + 0xc]
	.word	0x81580000	! t0_kref+0x1ee8:   	flushw
	.word	0x81ad8ad2	! t0_kref+0x1eec:   	fcmped	%fcc0, %f22, %f18
	.word	0xa7a01a3c	! t0_kref+0x1ef0:   	fstoi	%f28, %f19
	.word	0xb1b68ad0	! t0_kref+0x1ef4:   	fpsub32	%f26, %f16, %f24
	.word	0x928ebfb9	! t0_kref+0x1ef8:   	andcc	%i2, -0x47, %o1
	.word	0xee6e2004	! t0_kref+0x1efc:   	ldstub	[%i0 + 4], %l7
	.word	0xbfa0002d	! t0_kref+0x1f00:   	fmovs	%f13, %f31
	.word	0xe3867fe4	! t0_kref+0x1f04:   	lda	[%i1 - 0x1c]%asi, %f17
	.word	0xa1a0055c	! t0_kref+0x1f08:   	fsqrtd	%f28, %f16
	.word	0x9ba0053b	! t0_kref+0x1f0c:   	fsqrts	%f27, %f13
	.word	0x26800005	! t0_kref+0x1f10:   	bl,a	_kref+0x1f24
	.word	0xa1a01a5e	! t0_kref+0x1f14:   	fdtoi	%f30, %f16
	.word	0xbfa6c83a	! t0_kref+0x1f18:   	fadds	%f27, %f26, %f31
	.word	0xd8380018	! t0_kref+0x1f1c:   	std	%o4, [%g0 + %i0]
	.word	0xadb50f9a	! t0_kref+0x1f20:   	for	%f20, %f26, %f22
	.word	0xc608001a	! t0_kref+0x1f24:   	ldub	[%g0 + %i2], %g3
	.word	0x90828008	! t0_kref+0x1f28:   	addcc	%o2, %o0, %o0
	.word	0x90daff7b	! t0_kref+0x1f2c:   	smulcc	%o3, -0x85, %o0
	.word	0x9472b0e5	! t0_kref+0x1f30:   	udiv	%o2, -0xf1b, %o2
	.word	0x94130015	! t0_kref+0x1f34:   	or	%o4, %l5, %o2
	.word	0x92524014	! t0_kref+0x1f38:   	umul	%o1, %l4, %o1
	.word	0x3e800004	! t0_kref+0x1f3c:   	bvc,a	_kref+0x1f4c
	.word	0xbda708b7	! t0_kref+0x1f40:   	fsubs	%f28, %f23, %f30
	.word	0x95b48136	! t0_kref+0x1f44:   	edge32n	%l2, %l6, %o2
	.word	0xa1b5c128	! t0_kref+0x1f48:   	edge32n	%l7, %o0, %l0
	.word	0xada00031	! t0_kref+0x1f4c:   	fmovs	%f17, %f22
	.word	0x9da38950	! t0_kref+0x1f50:   	fmuld	%f14, %f16, %f14
	.word	0xa324b0f4	! t0_kref+0x1f54:   	mulscc	%l2, -0xf0c, %l1
	.word	0xd8e81018	! t0_kref+0x1f58:   	ldstuba	[%g0 + %i0]0x80, %o4
	.word	0x8143e040	! t0_kref+0x1f5c:   	membar	0x40
	.word	0x81af0a39	! t0_kref+0x1f60:   	fcmps	%fcc0, %f28, %f25
	.word	0xa875ba90	! t0_kref+0x1f64:   	udiv	%l6, -0x570, %l4
	.word	0x9db00c20	! t0_kref+0x1f68:   	fzeros	%f14
	.word	0xe06e6017	! t0_kref+0x1f6c:   	ldstub	[%i1 + 0x17], %l0
	call	SYM(t0_subr2)
	.word	0xbda5095e	! t0_kref+0x1f74:   	fmuld	%f20, %f30, %f30
	.word	0xb5a00530	! t0_kref+0x1f78:   	fsqrts	%f16, %f26
	.word	0xa4f2401a	! t0_kref+0x1f7c:   	udivcc	%o1, %i2, %l2
	.word	0xa3a6483d	! t0_kref+0x1f80:   	fadds	%f25, %f29, %f17
	.word	0xb3a01a3b	! t0_kref+0x1f84:   	fstoi	%f27, %f25
	.word	0x13209741	! t0_kref+0x1f88:   	sethi	%hi(0x825d0400), %o1
	.word	0x99a000d8	! t0_kref+0x1f8c:   	fnegd	%f24, %f12
	.word	0xabb6cabe	! t0_kref+0x1f90:   	fpsub16s	%f27, %f30, %f21
	.word	0xada588ce	! t0_kref+0x1f94:   	fsubd	%f22, %f14, %f22
	.word	0x3c480008	! t0_kref+0x1f98:   	bpos,a,pt	%icc, _kref+0x1fb8
	.word	0xa4f34016	! t0_kref+0x1f9c:   	udivcc	%o5, %l6, %l2
	.word	0x2e480008	! t0_kref+0x1fa0:   	bvs,a,pt	%icc, _kref+0x1fc0
	.word	0xa12aa01c	! t0_kref+0x1fa4:   	sll	%o2, 0x1c, %l0
	.word	0x27480001	! t0_kref+0x1fa8:   	fbul,a,pt	%fcc0, _kref+0x1fac
	.word	0xee26401c	! t0_kref+0x1fac:   	st	%l7, [%i1 + %i4]
	.word	0xbda00138	! t0_kref+0x1fb0:   	fabss	%f24, %f30
	.word	0xadb50f6e	! t0_kref+0x1fb4:   	fornot1s	%f20, %f14, %f22
	.word	0x3d480007	! t0_kref+0x1fb8:   	fbule,a,pt	%fcc0, _kref+0x1fd4
	.word	0xe67e7ff0	! t0_kref+0x1fbc:   	swap	[%i1 - 0x10], %l3
	.word	0xaba01898	! t0_kref+0x1fc0:   	fitos	%f24, %f21
	.word	0xa7400000	! t0_kref+0x1fc4:   	mov	%y, %l3
	.word	0xed68a083	! t0_kref+0x1fc8:   	prefetch	%g2 + 0x83, 22
	.word	0xaaa4801a	! t0_kref+0x1fcc:   	subcc	%l2, %i2, %l5
	.word	0xa7b4045c	! t0_kref+0x1fd0:   	fcmpne16	%f16, %f28, %l3
	.word	0x81ab8a54	! t0_kref+0x1fd4:   	fcmpd	%fcc0, %f14, %f20
	.word	0x9fc10000	! t0_kref+0x1fd8:   	call	%g4
	.word	0x90834014	! t0_kref+0x1fdc:   	addcc	%o5, %l4, %o0
	.word	0xa085ede5	! t0_kref+0x1fe0:   	addcc	%l7, 0xde5, %l0
	.word	0x95b30157	! t0_kref+0x1fe4:   	edge32l	%o4, %l7, %o2
	.word	0xa864800b	! t0_kref+0x1fe8:   	subc	%l2, %o3, %l4
	.word	0x34800008	! t0_kref+0x1fec:   	bg,a	_kref+0x200c
	.word	0xb9b007b0	! t0_kref+0x1ff0:   	fpackfix	%f16, %f28
	.word	0xa5a0192e	! t0_kref+0x1ff4:   	fstod	%f14, %f18
	.word	0xd2266018	! t0_kref+0x1ff8:   	st	%o1, [%i1 + 0x18]
	.word	0x81df6fe2	! t0_kref+0x1ffc:   	flush	%i5 + 0xfe2
	.word	0xba103ff0	! t0_kref+0x2000:   	mov	0xfffffff0, %i5
	.word	0xb4102013	! t0_kref+0x2004:   	mov	0x13, %i2
	.word	0xaa7c7ad1	! t0_kref+0x2008:   	sdiv	%l1, -0x52f, %l5
	.word	0x93b6850e	! t0_kref+0x200c:   	fcmpgt16	%f26, %f14, %o1
	.word	0xdd866014	! t0_kref+0x2010:   	lda	[%i1 + 0x14]%asi, %f14
	.word	0x3d800003	! t0_kref+0x2014:   	fbule,a	_kref+0x2020
	.word	0xab400000	! t0_kref+0x2018:   	mov	%y, %l5
	.word	0xb7b48ded	! t0_kref+0x201c:   	fnands	%f18, %f13, %f27
	.word	0xbdb60ad4	! t0_kref+0x2020:   	fpsub32	%f24, %f20, %f30
	.word	0xe0e81018	! t0_kref+0x2024:   	ldstuba	[%g0 + %i0]0x80, %l0
	.word	0xd4c0a00c	! t0_kref+0x2028:   	ldswa	[%g2 + 0xc]%asi, %o2
	.word	0xbdb68ece	! t0_kref+0x202c:   	fornot2	%f26, %f14, %f30
	.word	0xe60e401a	! t0_kref+0x2030:   	ldub	[%i1 + %i2], %l3
	.word	0xa2daf92d	! t0_kref+0x2034:   	smulcc	%o3, -0x6d3, %l1
	.word	0xbba0053f	! t0_kref+0x2038:   	fsqrts	%f31, %f29
	.word	0x941e800b	! t0_kref+0x203c:   	xor	%i2, %o3, %o2
	.word	0xd46e201e	! t0_kref+0x2040:   	ldstub	[%i0 + 0x1e], %o2
	.word	0xf1ee101a	! t0_kref+0x2044:   	prefetcha	%i0 + %i2, 24
	.word	0x81828000	! t0_kref+0x2048:   	wr	%o2, %g0, %y
	.word	0xf19e1000	! t0_kref+0x204c:   	ldda	[%i0]0x80, %f24
	.word	0xe6062014	! t0_kref+0x2050:   	ld	[%i0 + 0x14], %l3
	.word	0xa01a0013	! t0_kref+0x2054:   	xor	%o0, %l3, %l0
	.word	0xa1a5083c	! t0_kref+0x2058:   	fadds	%f20, %f28, %f16
	.word	0xa1b4c074	! t0_kref+0x205c:   	edge8ln	%l3, %l4, %l0
	.word	0xdb066010	! t0_kref+0x2060:   	ld	[%i1 + 0x10], %f13
	call	SYM(t0_subr2)
	.word	0xb7a688bd	! t0_kref+0x2068:   	fsubs	%f26, %f29, %f27
	.word	0xea0e0000	! t0_kref+0x206c:   	ldub	[%i0], %l5
	.word	0x8584aa6e	! t0_kref+0x2070:   	wr	%l2, 0xa6e, %ccr
	.word	0xa3b6814c	! t0_kref+0x2074:   	edge32l	%i2, %o4, %l1
	.word	0xeef81018	! t0_kref+0x2078:   	swapa	[%g0 + %i0]0x80, %l7
	.word	0x34480005	! t0_kref+0x207c:   	bg,a,pt	%icc, _kref+0x2090
	.word	0xd04e2017	! t0_kref+0x2080:   	ldsb	[%i0 + 0x17], %o0
	.word	0xe4700019	! t0_kref+0x2084:   	stx	%l2, [%g0 + %i1]
	.word	0xe51f4019	! t0_kref+0x2088:   	ldd	[%i5 + %i1], %f18
	.word	0x21033050	! t0_kref+0x208c:   	sethi	%hi(0xcc14000), %l0
	.word	0x99b38918	! t0_kref+0x2090:   	faligndata	%f14, %f24, %f12
	.word	0x2d800001	! t0_kref+0x2094:   	fbg,a	_kref+0x2098
	.word	0x929ee0df	! t0_kref+0x2098:   	xorcc	%i3, 0xdf, %o1
	.word	0x21480001	! t0_kref+0x209c:   	fbn,a,pt	%fcc0, _kref+0x20a0
	.word	0x001fffff	! t0_kref+0x20a0:   	illtrap	0x1fffff
	.word	0xec56600c	! t0_kref+0x20a4:   	ldsh	[%i1 + 0xc], %l6
	.word	0x81aeca34	! t0_kref+0x20a8:   	fcmps	%fcc0, %f27, %f20
	.word	0x90da2927	! t0_kref+0x20ac:   	smulcc	%o0, 0x927, %o0
	.word	0x34480005	! t0_kref+0x20b0:   	bg,a,pt	%icc, _kref+0x20c4
	.word	0x923a000a	! t0_kref+0x20b4:   	xnor	%o0, %o2, %o1
	.word	0xa3b5854e	! t0_kref+0x20b8:   	fcmpeq16	%f22, %f14, %l1
	.word	0x9db48c90	! t0_kref+0x20bc:   	fandnot2	%f18, %f16, %f14
	.word	0xaafb2f00	! t0_kref+0x20c0:   	sdivcc	%o4, 0xf00, %l5
	.word	0xa605400d	! t0_kref+0x20c4:   	add	%l5, %o5, %l3
	call	SYM(t0_subr2)
	.word	0xe66e601c	! t0_kref+0x20cc:   	ldstub	[%i1 + 0x1c], %l3
	.word	0x92e232e9	! t0_kref+0x20d0:   	subccc	%o0, -0xd17, %o1
	.word	0xa013400b	! t0_kref+0x20d4:   	or	%o5, %o3, %l0
	.word	0x81ac0aba	! t0_kref+0x20d8:   	fcmpes	%fcc0, %f16, %f26
	.word	0xa9b40ace	! t0_kref+0x20dc:   	fpsub32	%f16, %f14, %f20
	.word	0xa265c015	! t0_kref+0x20e0:   	subc	%l7, %l5, %l1
	.word	0xabb3cf71	! t0_kref+0x20e4:   	fornot1s	%f15, %f17, %f21
	.word	0xaa3d800a	! t0_kref+0x20e8:   	xnor	%l6, %o2, %l5
	.word	0x81dca9a6	! t0_kref+0x20ec:   	flush	%l2 + 0x9a6
	.word	0x38480008	! t0_kref+0x20f0:   	bgu,a,pt	%icc, _kref+0x2110
	.word	0xec462018	! t0_kref+0x20f4:   	ldsw	[%i0 + 0x18], %l6
	.word	0xe1be5888	! t0_kref+0x20f8:   	stda	%f16, [%i1 + %o0]0xc4
	.word	0x3f800008	! t0_kref+0x20fc:   	fbo,a	_kref+0x211c
	.word	0xf4200018	! t0_kref+0x2100:   	st	%i2, [%g0 + %i0]
	.word	0x99a00152	! t0_kref+0x2104:   	fabsd	%f18, %f12
	.word	0xf5a0a030	! t0_kref+0x2108:   	sta	%f26, [%g2 + 0x30]%asi
	.word	0xbda7094c	! t0_kref+0x210c:   	fmuld	%f28, %f12, %f30
	.word	0xbda589d6	! t0_kref+0x2110:   	fdivd	%f22, %f22, %f30
	.word	0x3d480006	! t0_kref+0x2114:   	fbule,a,pt	%fcc0, _kref+0x212c
	.word	0xa0dac010	! t0_kref+0x2118:   	smulcc	%o3, %l0, %l0
	.word	0xa4200015	! t0_kref+0x211c:   	neg	%l5, %l2
	.word	0xdd06600c	! t0_kref+0x2120:   	ld	[%i1 + 0xc], %f14
	.word	0xa825000d	! t0_kref+0x2124:   	sub	%l4, %o5, %l4
	call	SYM(t0_subr1)
	.word	0xb5b70d9a	! t0_kref+0x212c:   	fxor	%f28, %f26, %f26
	.word	0xa29ac011	! t0_kref+0x2130:   	xorcc	%o3, %l1, %l1
	.word	0xd91e001d	! t0_kref+0x2134:   	ldd	[%i0 + %i5], %f12
	.word	0xb6103ffe	! t0_kref+0x2138:   	mov	0xfffffffe, %i3
	.word	0xbda48950	! t0_kref+0x213c:   	fmuld	%f18, %f16, %f30
	.word	0x81db4016	! t0_kref+0x2140:   	flush	%o5 + %l6
	.word	0x9de3bfa0	! t0_kref+0x2144:   	save	%sp, -0x60, %sp
	.word	0xabee801b	! t0_kref+0x2148:   	restore	%i2, %i3, %l5
	call	SYM(t0_subr2)
	.word	0xa4d30013	! t0_kref+0x2150:   	umulcc	%o4, %l3, %l2
	.word	0x34480003	! t0_kref+0x2154:   	bg,a,pt	%icc, _kref+0x2160
	.word	0xd6270019	! t0_kref+0x2158:   	st	%o3, [%i4 + %i1]
	.word	0xa9b64eef	! t0_kref+0x215c:   	fornot2s	%f25, %f15, %f20
	.word	0x9ba00036	! t0_kref+0x2160:   	fmovs	%f22, %f13
	.word	0xa9a0103b	! t0_kref+0x2164:   	fstox	%f27, %f20
	.word	0xadb587ce	! t0_kref+0x2168:   	pdist	%f22, %f14, %f22
	.word	0x9f414000	! t0_kref+0x216c:   	mov	%pc, %o7
!	.word	0x3f4fcfa4	! t0_kref+0x2170:   	fbo,a,pt	%fcc0, SYM(t0_subr0)
	   	fbo,a,pt	%fcc0, SYM(t0_subr0)
	.word	0xa083635c	! t0_kref+0x2174:   	addcc	%o5, 0x35c, %l0
	.word	0xa53aa00b	! t0_kref+0x2178:   	sra	%o2, 0xb, %l2
	.word	0x9ba01a4e	! t0_kref+0x217c:   	fdtoi	%f14, %f13
	.word	0x2d480008	! t0_kref+0x2180:   	fbg,a,pt	%fcc0, _kref+0x21a0
	.word	0xa3400000	! t0_kref+0x2184:   	mov	%y, %l1
	.word	0xd67e6008	! t0_kref+0x2188:   	swap	[%i1 + 8], %o3
	.word	0xf6280018	! t0_kref+0x218c:   	stb	%i3, [%g0 + %i0]
	.word	0xa40ae4e5	! t0_kref+0x2190:   	and	%o3, 0x4e5, %l2
	.word	0xdf000019	! t0_kref+0x2194:   	ld	[%g0 + %i1], %f15
	.word	0xa5b3cf7e	! t0_kref+0x2198:   	fornot1s	%f15, %f30, %f18
	.word	0xdfa0a018	! t0_kref+0x219c:   	sta	%f15, [%g2 + 0x18]%asi
	.word	0xb5a70d37	! t0_kref+0x21a0:   	fsmuld	%f28, %f23, %f26
	.word	0xa0fc2789	! t0_kref+0x21a4:   	sdivcc	%l0, 0x789, %l0
	.word	0xa9a0055c	! t0_kref+0x21a8:   	fsqrtd	%f28, %f20
	.word	0xef867ff4	! t0_kref+0x21ac:   	lda	[%i1 - 0xc]%asi, %f23
	.word	0xa5a3884e	! t0_kref+0x21b0:   	faddd	%f14, %f14, %f18
	.word	0xaba0188d	! t0_kref+0x21b4:   	fitos	%f13, %f21
	.word	0xae56c00b	! t0_kref+0x21b8:   	umul	%i3, %o3, %l7
	.word	0xaa7365e9	! t0_kref+0x21bc:   	udiv	%o5, 0x5e9, %l5
	.word	0xd06e3fe3	! t0_kref+0x21c0:   	ldstub	[%i0 - 0x1d], %o0
	.word	0xe968a005	! t0_kref+0x21c4:   	prefetch	%g2 + 5, 20
	.word	0xac7d6248	! t0_kref+0x21c8:   	sdiv	%l5, 0x248, %l6
	.word	0x81ab0ad6	! t0_kref+0x21cc:   	fcmped	%fcc0, %f12, %f22
	.word	0xa9a01118	! t0_kref+0x21d0:   	fxtod	%f24, %f20
	.word	0xaba0013f	! t0_kref+0x21d4:   	fabss	%f31, %f21
	.word	0x2731fb43	! t0_kref+0x21d8:   	sethi	%hi(0xc7ed0c00), %l3
	.word	0xfb6e401a	! t0_kref+0x21dc:   	prefetch	%i1 + %i2, 29
	.word	0x86102002	! t0_kref+0x21e0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x21e4:   	bne,a	_kref+0x21e4
	.word	0x86a0e001	! t0_kref+0x21e8:   	subcc	%g3, 1, %g3
	.word	0xb7a01a58	! t0_kref+0x21ec:   	fdtoi	%f24, %f27
	.word	0x8143c000	! t0_kref+0x21f0:   	stbar
	.word	0x9486b759	! t0_kref+0x21f4:   	addcc	%i2, -0x8a7, %o2
	call	SYM(t0_subr3)
	.word	0xae54ebd6	! t0_kref+0x21fc:   	umul	%l3, 0xbd6, %l7
	.word	0xaa52656e	! t0_kref+0x2200:   	umul	%o1, 0x56e, %l5
	.word	0x81dd0001	! t0_kref+0x2204:   	flush	%l4 + %g1
	.word	0x9db50dd0	! t0_kref+0x2208:   	fnand	%f20, %f16, %f14
	.word	0xa606e8a2	! t0_kref+0x220c:   	add	%i3, 0x8a2, %l3
	.word	0xe91e7ff0	! t0_kref+0x2210:   	ldd	[%i1 - 0x10], %f20
	.word	0xe8865000	! t0_kref+0x2214:   	lda	[%i1]0x80, %l4
	.word	0xf9be5a5c	! t0_kref+0x2218:   	stda	%f28, [%i1 + %i4]0xd2
	.word	0xbdb38ad0	! t0_kref+0x221c:   	fpsub32	%f14, %f16, %f30
	.word	0xc028a039	! t0_kref+0x2220:   	clrb	[%g2 + 0x39]
	.word	0x001fffff	! t0_kref+0x2224:   	illtrap	0x1fffff
	.word	0xe81f4018	! t0_kref+0x2228:   	ldd	[%i5 + %i0], %l4
	.word	0xa1b38a6e	! t0_kref+0x222c:   	fpadd32s	%f14, %f14, %f16
	.word	0xe1264000	! t0_kref+0x2230:   	st	%f16, [%i1]
	.word	0xe51e3fe8	! t0_kref+0x2234:   	ldd	[%i0 - 0x18], %f18
	.word	0xf8a0a004	! t0_kref+0x2238:   	sta	%i4, [%g2 + 4]%asi
	.word	0xae2ec01a	! t0_kref+0x223c:   	andn	%i3, %i2, %l7
	.word	0x8143c000	! t0_kref+0x2240:   	stbar
	.word	0x86102021	! t0_kref+0x2244:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x2248:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x224c:   	be,a	_kref+0x22c0
	.word	0xea263ff8	! t0_kref+0x2250:   	st	%l5, [%i0 - 8]
	.word	0xa61f2103	! t0_kref+0x2254:   	xor	%i4, 0x103, %l3
	.word	0x2e4ffffc	! t0_kref+0x2258:   	bvs,a,pt	%icc, _kref+0x2248
	.word	0x2d08d160	! t0_kref+0x225c:   	sethi	%hi(0x23458000), %l6
	.word	0xa5a7cd30	! t0_kref+0x2260:   	fsmuld	%f31, %f16, %f18
	call	SYM(t0_subr3)
	.word	0xa65aa125	! t0_kref+0x2268:   	smul	%o2, 0x125, %l3
	.word	0xa1b58a94	! t0_kref+0x226c:   	fpsub16	%f22, %f20, %f16
	.word	0xa3a488b8	! t0_kref+0x2270:   	fsubs	%f18, %f24, %f17
	.word	0x2e480003	! t0_kref+0x2274:   	bvs,a,pt	%icc, _kref+0x2280
	.word	0x81db8005	! t0_kref+0x2278:   	flush	%sp + %g5
	.word	0xa5a0053d	! t0_kref+0x227c:   	fsqrts	%f29, %f18
	.word	0xd82e6008	! t0_kref+0x2280:   	stb	%o4, [%i1 + 8]
	.word	0xad400000	! t0_kref+0x2284:   	mov	%y, %l6
	.word	0xaaddac08	! t0_kref+0x2288:   	smulcc	%l6, 0xc08, %l5
	.word	0xbba0013c	! t0_kref+0x228c:   	fabss	%f28, %f29
	.word	0xe2070019	! t0_kref+0x2290:   	ld	[%i4 + %i1], %l1
	.word	0x29bfffed	! t0_kref+0x2294:   	fbl,a	_kref+0x2248
	.word	0xa9a0055e	! t0_kref+0x2298:   	fsqrtd	%f30, %f20
	.word	0x8143c000	! t0_kref+0x229c:   	stbar
	.word	0xae0c4014	! t0_kref+0x22a0:   	and	%l1, %l4, %l7
	call	SYM(t0_subr2)
	.word	0x81dde24e	! t0_kref+0x22a8:   	flush	%l7 + 0x24e
	.word	0xda7f0018	! t0_kref+0x22ac:   	swap	[%i4 + %i0], %o5
	.word	0xa1a6cd2f	! t0_kref+0x22b0:   	fsmuld	%f27, %f15, %f16
	.word	0xafa7c8b1	! t0_kref+0x22b4:   	fsubs	%f31, %f17, %f23
	.word	0x8143c000	! t0_kref+0x22b8:   	stbar
	.word	0xaba000bc	! t0_kref+0x22bc:   	fnegs	%f28, %f21
	.word	0xb1a0055c	! t0_kref+0x22c0:   	fsqrtd	%f28, %f24
	.word	0x27800005	! t0_kref+0x22c4:   	fbul,a	_kref+0x22d8
	.word	0xd406601c	! t0_kref+0x22c8:   	ld	[%i1 + 0x1c], %o2
	.word	0xa1a40d36	! t0_kref+0x22cc:   	fsmuld	%f16, %f22, %f16
	.word	0xa7a01a5a	! t0_kref+0x22d0:   	fdtoi	%f26, %f19
	.word	0xafb58ef3	! t0_kref+0x22d4:   	fornot2s	%f22, %f19, %f23
	.word	0xd00e401a	! t0_kref+0x22d8:   	ldub	[%i1 + %i2], %o0
	.word	0xbda0052d	! t0_kref+0x22dc:   	fsqrts	%f13, %f30
	.word	0xd4200018	! t0_kref+0x22e0:   	st	%o2, [%g0 + %i0]
	.word	0x3e480003	! t0_kref+0x22e4:   	bvc,a,pt	%icc, _kref+0x22f0
	.word	0xa50b401c	! t0_kref+0x22e8:   	tsubcc	%o5, %i4, %l2
	.word	0xa2df350c	! t0_kref+0x22ec:   	smulcc	%i4, -0xaf4, %l1
	.word	0x94e5e75c	! t0_kref+0x22f0:   	subccc	%l7, 0x75c, %o2
	.word	0xf9064000	! t0_kref+0x22f4:   	ld	[%i1], %f28
	.word	0xbfb60d33	! t0_kref+0x22f8:   	fandnot1s	%f24, %f19, %f31
	.word	0xea7e0000	! t0_kref+0x22fc:   	swap	[%i0], %l5
	.word	0x86102003	! t0_kref+0x2300:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2304:   	bne,a	_kref+0x2304
	.word	0x86a0e001	! t0_kref+0x2308:   	subcc	%g3, 1, %g3
	.word	0xb5b38ede	! t0_kref+0x230c:   	fornot2	%f14, %f30, %f26
	.word	0xb3a0052e	! t0_kref+0x2310:   	fsqrts	%f14, %f25
	call	SYM(t0_subr1)
	.word	0x9240001b	! t0_kref+0x2318:   	addc	%g0, %i3, %o1
	.word	0x35800005	! t0_kref+0x231c:   	fbue,a	_kref+0x2330
	.word	0xd3e65009	! t0_kref+0x2320:   	casa	[%i1]0x80, %o1, %o1
	.word	0x925a0011	! t0_kref+0x2324:   	smul	%o0, %l1, %o1
	.word	0xf11f4018	! t0_kref+0x2328:   	ldd	[%i5 + %i0], %f24
	.word	0x3b480002	! t0_kref+0x232c:   	fble,a,pt	%fcc0, _kref+0x2334
	.word	0xa9b2c04d	! t0_kref+0x2330:   	edge8l	%o3, %o5, %l4
	.word	0xa42a800c	! t0_kref+0x2334:   	andn	%o2, %o4, %l2
	.word	0xa4a42bd0	! t0_kref+0x2338:   	subcc	%l0, 0xbd0, %l2
	.word	0x92f73d26	! t0_kref+0x233c:   	udivcc	%i4, -0x2da, %o1
	.word	0xe9bf1a59	! t0_kref+0x2340:   	stda	%f20, [%i4 + %i1]0xd2
	.word	0xa5b40a94	! t0_kref+0x2344:   	fpsub16	%f16, %f20, %f18
	.word	0x9db48ecc	! t0_kref+0x2348:   	fornot2	%f18, %f12, %f14
	.word	0x81850000	! t0_kref+0x234c:   	wr	%l4, %g0, %y
	.word	0xbda60954	! t0_kref+0x2350:   	fmuld	%f24, %f20, %f30
	.word	0xa8f6a9bb	! t0_kref+0x2354:   	udivcc	%i2, 0x9bb, %l4
	.word	0x81ac8aba	! t0_kref+0x2358:   	fcmpes	%fcc0, %f18, %f26
	.word	0xb1a64d31	! t0_kref+0x235c:   	fsmuld	%f25, %f17, %f24
	.word	0xa5a348b2	! t0_kref+0x2360:   	fsubs	%f13, %f18, %f18
	.word	0xe2480019	! t0_kref+0x2364:   	ldsb	[%g0 + %i1], %l1
	.word	0xe6270019	! t0_kref+0x2368:   	st	%l3, [%i4 + %i1]
	.word	0x28800003	! t0_kref+0x236c:   	bleu,a	_kref+0x2378
	.word	0x81df001c	! t0_kref+0x2370:   	flush	%i4 + %i4
	.word	0xa8df0011	! t0_kref+0x2374:   	smulcc	%i4, %l1, %l4
	.word	0xa1a6095e	! t0_kref+0x2378:   	fmuld	%f24, %f30, %f16
	.word	0xa873351c	! t0_kref+0x237c:   	udiv	%o4, -0xae4, %l4
	.word	0xa93ec000	! t0_kref+0x2380:   	sra	%i3, %g0, %l4
	.word	0x9fc00004	! t0_kref+0x2384:   	call	%g0 + %g4
	.word	0xaa168014	! t0_kref+0x2388:   	or	%i2, %l4, %l5
	.word	0x8143c000	! t0_kref+0x238c:   	stbar
	.word	0x9fc00004	! t0_kref+0x2390:   	call	%g0 + %g4
	.word	0xd81e2000	! t0_kref+0x2394:   	ldd	[%i0], %o4
	.word	0xa5a34d38	! t0_kref+0x2398:   	fsmuld	%f13, %f24, %f18
	.word	0xadb3cab5	! t0_kref+0x239c:   	fpsub16s	%f15, %f21, %f22
	.word	0xd06e0000	! t0_kref+0x23a0:   	ldstub	[%i0], %o0
	.word	0x81ae8a58	! t0_kref+0x23a4:   	fcmpd	%fcc0, %f26, %f24
	.word	0x920a001b	! t0_kref+0x23a8:   	and	%o0, %i3, %o1
	.word	0xaba548bb	! t0_kref+0x23ac:   	fsubs	%f21, %f27, %f21
	.word	0x9fa5c83e	! t0_kref+0x23b0:   	fadds	%f23, %f30, %f15
	.word	0xbba01891	! t0_kref+0x23b4:   	fitos	%f17, %f29
	.word	0x81dec00c	! t0_kref+0x23b8:   	flush	%i3 + %o4
	.word	0xb1b70f8e	! t0_kref+0x23bc:   	for	%f28, %f14, %f24
	.word	0xc0270019	! t0_kref+0x23c0:   	clr	[%i4 + %i1]
	.word	0x2f480008	! t0_kref+0x23c4:   	fbu,a,pt	%fcc0, _kref+0x23e4
	.word	0xa49ead65	! t0_kref+0x23c8:   	xorcc	%i2, 0xd65, %l2
	.word	0xd0067fe0	! t0_kref+0x23cc:   	ld	[%i1 - 0x20], %o0
	.word	0x26480001	! t0_kref+0x23d0:   	bl,a,pt	%icc, _kref+0x23d4
	.word	0xff06001c	! t0_kref+0x23d4:   	ld	[%i0 + %i4], %f31
	.word	0x3b800005	! t0_kref+0x23d8:   	fble,a	_kref+0x23ec
	.word	0xd86e7ff3	! t0_kref+0x23dc:   	ldstub	[%i1 - 0xd], %o4
	.word	0xbba748b1	! t0_kref+0x23e0:   	fsubs	%f29, %f17, %f29
	.word	0xa1b70ed0	! t0_kref+0x23e4:   	fornot2	%f28, %f16, %f16
	.word	0x9da01935	! t0_kref+0x23e8:   	fstod	%f21, %f14
	.word	0xac7b3e11	! t0_kref+0x23ec:   	sdiv	%o4, -0x1ef, %l6
	.word	0xb3a01a58	! t0_kref+0x23f0:   	fdtoi	%f24, %f25
	.word	0xb5a54d34	! t0_kref+0x23f4:   	fsmuld	%f21, %f20, %f26
	.word	0x22480007	! t0_kref+0x23f8:   	be,a,pt	%icc, _kref+0x2414
	.word	0xd67e2010	! t0_kref+0x23fc:   	swap	[%i0 + 0x10], %o3
	.word	0xb9b30a50	! t0_kref+0x2400:   	fpadd32	%f12, %f16, %f28
	.word	0xa1a648b5	! t0_kref+0x2404:   	fsubs	%f25, %f21, %f16
	.word	0xac5d6f69	! t0_kref+0x2408:   	smul	%l5, 0xf69, %l6
	.word	0xadb0077e	! t0_kref+0x240c:   	fpack16	%f30, %f22
	.word	0xb1a38952	! t0_kref+0x2410:   	fmuld	%f14, %f18, %f24
	.word	0xada50852	! t0_kref+0x2414:   	faddd	%f20, %f18, %f22
	.word	0xa5a01a2f	! t0_kref+0x2418:   	fstoi	%f15, %f18
	.word	0x37800008	! t0_kref+0x241c:   	fbge,a	_kref+0x243c
	.word	0xfb264000	! t0_kref+0x2420:   	st	%f29, [%i1]
	.word	0xae36aaf4	! t0_kref+0x2424:   	orn	%i2, 0xaf4, %l7
	.word	0xb3a0189a	! t0_kref+0x2428:   	fitos	%f26, %f25
	.word	0xe46e2005	! t0_kref+0x242c:   	ldstub	[%i0 + 5], %l2
	.word	0x2a480003	! t0_kref+0x2430:   	bcs,a,pt	%icc, _kref+0x243c
	.word	0xe26e7fee	! t0_kref+0x2434:   	ldstub	[%i1 - 0x12], %l1
	.word	0x81580000	! t0_kref+0x2438:   	flushw
	.word	0x908b7266	! t0_kref+0x243c:   	andcc	%o5, -0xd9a, %o0
	.word	0x90847ce8	! t0_kref+0x2440:   	addcc	%l1, -0x318, %o0
	.word	0x81800000	! t0_kref+0x2444:   	mov	%g0, %y
	.word	0xab400000	! t0_kref+0x2448:   	mov	%y, %l5
	.word	0x9da018d0	! t0_kref+0x244c:   	fdtos	%f16, %f14
	.word	0x81dd0015	! t0_kref+0x2450:   	flush	%l4 + %l5
	.word	0xbba548b9	! t0_kref+0x2454:   	fsubs	%f21, %f25, %f29
	.word	0xbda58d31	! t0_kref+0x2458:   	fsmuld	%f22, %f17, %f30
	.word	0x912a0000	! t0_kref+0x245c:   	sll	%o0, %g0, %o0
	.word	0xa1b58f9a	! t0_kref+0x2460:   	for	%f22, %f26, %f16
	call	1f
	.empty
	.word	0xe6400018	! t0_kref+0x2468:   	ldsw	[%g0 + %i0], %l3
	.word	0xeaae601a	! t0_kref+0x246c:   	stba	%l5, [%i1 + 0x1a]%asi
1:	.word	0xbdb009b3	! t0_kref+0x2470:   	fexpand	%f19, %f30
	.word	0x900cff17	! t0_kref+0x2474:   	and	%l3, -0xe9, %o0
	.word	0x150f1753	! t0_kref+0x2478:   	sethi	%hi(0x3c5d4c00), %o2
	.word	0x23800005	! t0_kref+0x247c:   	fbne,a	_kref+0x2490
	.word	0x9524c01a	! t0_kref+0x2480:   	mulscc	%l3, %i2, %o2
	.word	0xaba00536	! t0_kref+0x2484:   	fsqrts	%f22, %f21
	.word	0xe80e2012	! t0_kref+0x2488:   	ldub	[%i0 + 0x12], %l4
	.word	0x2a480006	! t0_kref+0x248c:   	bcs,a,pt	%icc, _kref+0x24a4
	.word	0xaba00537	! t0_kref+0x2490:   	fsqrts	%f23, %f21
	.word	0xa48ac00b	! t0_kref+0x2494:   	andcc	%o3, %o3, %l2
	.word	0xb5b009ad	! t0_kref+0x2498:   	fexpand	%f13, %f26
	.word	0xd0c61000	! t0_kref+0x249c:   	ldswa	[%i0]0x80, %o0
	.word	0xe9e8a08a	! t0_kref+0x24a0:   	prefetcha	%g2 + 0x8a, 20
	.word	0xc807bfe8	! t0_kref+0x24a4:   	ld	[%fp - 0x18], %g4
	.word	0xa0550000	! t0_kref+0x24a8:   	umul	%l4, %g0, %l0
	.word	0xa1b40ad0	! t0_kref+0x24ac:   	fpsub32	%f16, %f16, %f16
	.word	0x81ac8a36	! t0_kref+0x24b0:   	fcmps	%fcc0, %f18, %f22
	.word	0x9db74632	! t0_kref+0x24b4:   	fmul8x16	%f29, %f18, %f14
	.word	0xa4daa344	! t0_kref+0x24b8:   	smulcc	%o2, 0x344, %l2
	.word	0xacd57ab6	! t0_kref+0x24bc:   	umulcc	%l5, -0x54a, %l6
	.word	0xba103fe8	! t0_kref+0x24c0:   	mov	0xffffffe8, %i5
	.word	0xa1b70a14	! t0_kref+0x24c4:   	fpadd16	%f28, %f20, %f16
	.word	0xb9a01937	! t0_kref+0x24c8:   	fstod	%f23, %f28
	.word	0xada0052e	! t0_kref+0x24cc:   	fsqrts	%f14, %f22
	.word	0xd40e3ffc	! t0_kref+0x24d0:   	ldub	[%i0 - 4], %o2
	.word	0x28480005	! t0_kref+0x24d4:   	bleu,a,pt	%icc, _kref+0x24e8
	.word	0xa8603108	! t0_kref+0x24d8:   	subc	%g0, -0xef8, %l4
	.word	0xbda50d38	! t0_kref+0x24dc:   	fsmuld	%f20, %f24, %f30
	.word	0xa8dda56e	! t0_kref+0x24e0:   	smulcc	%l6, 0x56e, %l4
	.word	0x9da0189b	! t0_kref+0x24e4:   	fitos	%f27, %f14
	.word	0xa1a0055c	! t0_kref+0x24e8:   	fsqrtd	%f28, %f16
	.word	0x23480007	! t0_kref+0x24ec:   	fbne,a,pt	%fcc0, _kref+0x2508
	.word	0xa40a237b	! t0_kref+0x24f0:   	and	%o0, 0x37b, %l2
	.word	0xa52b600c	! t0_kref+0x24f4:   	sll	%o5, 0xc, %l2
	.word	0x93b28169	! t0_kref+0x24f8:   	edge32ln	%o2, %o1, %o1
	.word	0xb3a01a54	! t0_kref+0x24fc:   	fdtoi	%f20, %f25
	.word	0xa49eed7f	! t0_kref+0x2500:   	xorcc	%i3, 0xd7f, %l2
	.word	0xaa75001a	! t0_kref+0x2504:   	udiv	%l4, %i2, %l5
	.word	0xee200018	! t0_kref+0x2508:   	st	%l7, [%g0 + %i0]
	.word	0x30480007	! t0_kref+0x250c:   	ba,a,pt	%icc, _kref+0x2528
	.word	0x94defd26	! t0_kref+0x2510:   	smulcc	%i3, -0x2da, %o2
	.word	0xac17001b	! t0_kref+0x2514:   	or	%i4, %i3, %l6
	.word	0x93b70594	! t0_kref+0x2518:   	fcmpgt32	%f28, %f20, %o1
	.word	0xada01939	! t0_kref+0x251c:   	fstod	%f25, %f22
	.word	0xa40ac008	! t0_kref+0x2520:   	and	%o3, %o0, %l2
	.word	0xa9a54d33	! t0_kref+0x2524:   	fsmuld	%f21, %f19, %f20
	.word	0xaae28010	! t0_kref+0x2528:   	subccc	%o2, %l0, %l5
	.word	0xa4d73da3	! t0_kref+0x252c:   	umulcc	%i4, -0x25d, %l2
	.word	0xd04e2007	! t0_kref+0x2530:   	ldsb	[%i0 + 7], %o0
	.word	0xa1400000	! t0_kref+0x2534:   	mov	%y, %l0
	.word	0x35800006	! t0_kref+0x2538:   	fbue,a	_kref+0x2550
	.word	0xe22e2004	! t0_kref+0x253c:   	stb	%l1, [%i0 + 4]
	.word	0xe2270019	! t0_kref+0x2540:   	st	%l1, [%i4 + %i1]
	call	SYM(t0_subr3)
	.word	0x8143c000	! t0_kref+0x2548:   	stbar
	.word	0x33480007	! t0_kref+0x254c:   	fbe,a,pt	%fcc0, _kref+0x2568
	.word	0x95400000	! t0_kref+0x2550:   	mov	%y, %o2
	.word	0xada0193f	! t0_kref+0x2554:   	fstod	%f31, %f22
	.word	0x81db401f	! t0_kref+0x2558:   	flush	%o5 + %i7
	.word	0x941024ac	! t0_kref+0x255c:   	mov	0x4ac, %o2
	.word	0xa0768016	! t0_kref+0x2560:   	udiv	%i2, %l6, %l0
	.word	0xe13e2008	! t0_kref+0x2564:   	std	%f16, [%i0 + 8]
	.word	0x9540c000	! t0_kref+0x2568:   	mov	%asi, %o2
	.word	0xac52c016	! t0_kref+0x256c:   	umul	%o3, %l6, %l6
	.word	0x25800007	! t0_kref+0x2570:   	fblg,a	_kref+0x258c
	.word	0x8143c000	! t0_kref+0x2574:   	stbar
	.word	0xd2ce600f	! t0_kref+0x2578:   	ldsba	[%i1 + 0xf]%asi, %o1
	.word	0xb8102018	! t0_kref+0x257c:   	mov	0x18, %i4
	.word	0x9404c01a	! t0_kref+0x2580:   	add	%l3, %i2, %o2
	.word	0xd2260000	! t0_kref+0x2584:   	st	%o1, [%i0]
	.word	0x9da0053e	! t0_kref+0x2588:   	fsqrts	%f30, %f14
	.word	0xe6070019	! t0_kref+0x258c:   	ld	[%i4 + %i1], %l3
	.word	0x9de3bfa0	! t0_kref+0x2590:   	save	%sp, -0x60, %sp
	.word	0xbade3ade	! t0_kref+0x2594:   	smulcc	%i0, -0x522, %i5
	.word	0x95ee27f5	! t0_kref+0x2598:   	restore	%i0, 0x7f5, %o2
	.word	0xb1a0055a	! t0_kref+0x259c:   	fsqrtd	%f26, %f24
	.word	0x81d84004	! t0_kref+0x25a0:   	flush	%g1 + %g4
	.word	0xec500018	! t0_kref+0x25a4:   	ldsh	[%g0 + %i0], %l6
	.word	0xa7a648ba	! t0_kref+0x25a8:   	fsubs	%f25, %f26, %f19
	.word	0xa6a4800c	! t0_kref+0x25ac:   	subcc	%l2, %o4, %l3
	.word	0x2f800006	! t0_kref+0x25b0:   	fbu,a	_kref+0x25c8
	.word	0xa726e0be	! t0_kref+0x25b4:   	mulscc	%i3, 0xbe, %l3
	.word	0xf4263fe8	! t0_kref+0x25b8:   	st	%i2, [%i0 - 0x18]
	.word	0x93b48057	! t0_kref+0x25bc:   	edge8l	%l2, %l7, %o1
	.word	0xa204c01b	! t0_kref+0x25c0:   	add	%l3, %i3, %l1
	.word	0x8143c000	! t0_kref+0x25c4:   	stbar
	.word	0x9de3bfa0	! t0_kref+0x25c8:   	save	%sp, -0x60, %sp
	.word	0x91ef001b	! t0_kref+0x25cc:   	restore	%i4, %i3, %o0
	.word	0xaba0052e	! t0_kref+0x25d0:   	fsqrts	%f14, %f21
	.word	0xab40c000	! t0_kref+0x25d4:   	mov	%asi, %l5
	.word	0xbba000ae	! t0_kref+0x25d8:   	fnegs	%f14, %f29
	.word	0x81d83ada	! t0_kref+0x25dc:   	flush	%g0 - 0x526
	.word	0xaafa801b	! t0_kref+0x25e0:   	sdivcc	%o2, %i3, %l5
	.word	0x3c480005	! t0_kref+0x25e4:   	bpos,a,pt	%icc, _kref+0x25f8
	.word	0xa5400000	! t0_kref+0x25e8:   	mov	%y, %l2
	.word	0x9db44c73	! t0_kref+0x25ec:   	fnors	%f17, %f19, %f14
	.word	0x940cc016	! t0_kref+0x25f0:   	and	%l3, %l6, %o2
	.word	0xaafc8012	! t0_kref+0x25f4:   	sdivcc	%l2, %l2, %l5
	.word	0x2e480008	! t0_kref+0x25f8:   	bvs,a,pt	%icc, _kref+0x2618
	.word	0xf91fbc48	! t0_kref+0x25fc:   	ldd	[%fp - 0x3b8], %f28
	.word	0xa6f6f26c	! t0_kref+0x2600:   	udivcc	%i3, -0xd94, %l3
	.word	0xe6fe2018	! t0_kref+0x2604:   	swapa	[%i0 + 0x18]%asi, %l3
	.word	0x9da0053f	! t0_kref+0x2608:   	fsqrts	%f31, %f14
	.word	0xd82e6014	! t0_kref+0x260c:   	stb	%o4, [%i1 + 0x14]
	.word	0xa85eb41c	! t0_kref+0x2610:   	smul	%i2, -0xbe4, %l4
	.word	0x92703bac	! t0_kref+0x2614:   	udiv	%g0, -0x454, %o1
	.word	0xa5b24055	! t0_kref+0x2618:   	edge8l	%o1, %l5, %l2
	.word	0xa9a7cd2f	! t0_kref+0x261c:   	fsmuld	%f31, %f15, %f20
	.word	0xa5a38954	! t0_kref+0x2620:   	fmuld	%f14, %f20, %f18
	.word	0xc3ee1016	! t0_kref+0x2624:   	prefetcha	%i0 + %l6, 1
	.word	0xe04e3fe3	! t0_kref+0x2628:   	ldsb	[%i0 - 0x1d], %l0
	.word	0x23800004	! t0_kref+0x262c:   	fbne,a	_kref+0x263c
	.word	0xa61a4016	! t0_kref+0x2630:   	xor	%o1, %l6, %l3
	.word	0xa5b68070	! t0_kref+0x2634:   	edge8ln	%i2, %l0, %l2
	.word	0x3a480001	! t0_kref+0x2638:   	bcc,a,pt	%icc, _kref+0x263c
	.word	0xa0fcef17	! t0_kref+0x263c:   	sdivcc	%l3, 0xf17, %l0
	.word	0xf51e3fe0	! t0_kref+0x2640:   	ldd	[%i0 - 0x20], %f26
	.word	0x26800003	! t0_kref+0x2644:   	bl,a	_kref+0x2650
	.word	0xadb78912	! t0_kref+0x2648:   	faligndata	%f30, %f18, %f22
	.word	0xfbee501b	! t0_kref+0x264c:   	prefetcha	%i1 + %i3, 29
	.word	0xb9a01891	! t0_kref+0x2650:   	fitos	%f17, %f28
	.word	0x92ab400a	! t0_kref+0x2654:   	andncc	%o5, %o2, %o1
	.word	0x942537de	! t0_kref+0x2658:   	sub	%l4, -0x822, %o2
	.word	0xec6e601f	! t0_kref+0x265c:   	ldstub	[%i1 + 0x1f], %l6
	.word	0xa81ae226	! t0_kref+0x2660:   	xor	%o3, 0x226, %l4
	.word	0xaf183b91	! t0_kref+0x2664:   	tsubcctv	%g0, -0x46f, %l7
	.word	0xbfa01a58	! t0_kref+0x2668:   	fdtoi	%f24, %f31
	.word	0x24800007	! t0_kref+0x266c:   	ble,a	_kref+0x2688
	.word	0xe51e3ff0	! t0_kref+0x2670:   	ldd	[%i0 - 0x10], %f18
	.word	0x81ad4ab9	! t0_kref+0x2674:   	fcmpes	%fcc0, %f21, %f25
	.word	0xf1ee501d	! t0_kref+0x2678:   	prefetcha	%i1 + %i5, 24
	.word	0x93b3001a	! t0_kref+0x267c:   	edge8	%o4, %i2, %o1
	.word	0x949f001c	! t0_kref+0x2680:   	xorcc	%i4, %i4, %o2
	.word	0x81ae8aae	! t0_kref+0x2684:   	fcmpes	%fcc0, %f26, %f14
	.word	0xe0263ff8	! t0_kref+0x2688:   	st	%l0, [%i0 - 8]
	.word	0xea680018	! t0_kref+0x268c:   	ldstub	[%g0 + %i0], %l5
	.word	0xa3b5c0f7	! t0_kref+0x2690:   	edge16ln	%l7, %l7, %l1
	.word	0xb3b4cd60	! t0_kref+0x2694:   	fnot1s	%f19, %f25
	.word	0xc807bff0	! t0_kref+0x2698:   	ld	[%fp - 0x10], %g4
	.word	0xc0fe3fe8	! t0_kref+0x269c:   	swapa	[%i0 - 0x18]%asi, %g0
	.word	0xee6e6014	! t0_kref+0x26a0:   	ldstub	[%i1 + 0x14], %l7
	.word	0x945c0013	! t0_kref+0x26a4:   	smul	%l0, %l3, %o2
	.word	0x9ba00131	! t0_kref+0x26a8:   	fabss	%f17, %f13
	.word	0x9fa7c8b1	! t0_kref+0x26ac:   	fsubs	%f31, %f17, %f15
	.word	0x8143e040	! t0_kref+0x26b0:   	membar	0x40
	.word	0xf91e4000	! t0_kref+0x26b4:   	ldd	[%i1], %f28
	.word	0xaad5c015	! t0_kref+0x26b8:   	umulcc	%l7, %l5, %l5
	.word	0x2e480007	! t0_kref+0x26bc:   	bvs,a,pt	%icc, _kref+0x26d8
	.word	0xa9b50590	! t0_kref+0x26c0:   	fcmpgt32	%f20, %f16, %l4
	.word	0x81dc800e	! t0_kref+0x26c4:   	flush	%l2 + %sp
	.word	0x3e480008	! t0_kref+0x26c8:   	bvc,a,pt	%icc, _kref+0x26e8
	.word	0xe96e7fe8	! t0_kref+0x26cc:   	prefetch	%i1 - 0x18, 20
	.word	0xada48835	! t0_kref+0x26d0:   	fadds	%f18, %f21, %f22
	.word	0xc3ee5016	! t0_kref+0x26d4:   	prefetcha	%i1 + %l6, 1
	.word	0xa49825d2	! t0_kref+0x26d8:   	xorcc	%g0, 0x5d2, %l2
	.word	0x3c480005	! t0_kref+0x26dc:   	bpos,a,pt	%icc, _kref+0x26f0
	.word	0xd82e2015	! t0_kref+0x26e0:   	stb	%o4, [%i0 + 0x15]
	.word	0xbda0054c	! t0_kref+0x26e4:   	fsqrtd	%f12, %f30
	.word	0x20800004	! t0_kref+0x26e8:   	bn,a	_kref+0x26f8
	.word	0xa0834012	! t0_kref+0x26ec:   	addcc	%o5, %l2, %l0
	.word	0x8143c000	! t0_kref+0x26f0:   	stbar
	.word	0xea881018	! t0_kref+0x26f4:   	lduba	[%g0 + %i0]0x80, %l5
	.word	0xa1a4895c	! t0_kref+0x26f8:   	fmuld	%f18, %f28, %f16
	.word	0xd83e3fe8	! t0_kref+0x26fc:   	std	%o4, [%i0 - 0x18]
	.word	0x9db38c56	! t0_kref+0x2700:   	fnor	%f14, %f22, %f14
	.word	0x9fb00774	! t0_kref+0x2704:   	fpack16	%f20, %f15
	.word	0xda262008	! t0_kref+0x2708:   	st	%o5, [%i0 + 8]
	.word	0x9ba98032	! t0_kref+0x270c:   	fmovsg	%fcc0, %f18, %f13
	.word	0xa2f80010	! t0_kref+0x2710:   	sdivcc	%g0, %l0, %l1
	.word	0xf91e4000	! t0_kref+0x2714:   	ldd	[%i1], %f28
	.word	0xe9be5894	! t0_kref+0x2718:   	stda	%f20, [%i1 + %l4]0xc4
	.word	0x81ab4ab4	! t0_kref+0x271c:   	fcmpes	%fcc0, %f13, %f20
	.word	0xa5b44ea0	! t0_kref+0x2720:   	fsrc1s	%f17, %f18
	.word	0xe51e3ff8	! t0_kref+0x2724:   	ldd	[%i0 - 8], %f18
	.word	0xa2dcc01c	! t0_kref+0x2728:   	smulcc	%l3, %i4, %l1
	.word	0xf4266010	! t0_kref+0x272c:   	st	%i2, [%i1 + 0x10]
	.word	0xd876001d	! t0_kref+0x2730:   	stx	%o4, [%i0 + %i5]
	.word	0x922d7417	! t0_kref+0x2734:   	andn	%l5, -0xbe9, %o1
	.word	0x3e480003	! t0_kref+0x2738:   	bvc,a,pt	%icc, _kref+0x2744
	.word	0xf6a8a029	! t0_kref+0x273c:   	stba	%i3, [%g2 + 0x29]%asi
	.word	0xa5a0055a	! t0_kref+0x2740:   	fsqrtd	%f26, %f18
	.word	0xa4ad001a	! t0_kref+0x2744:   	andncc	%l4, %i2, %l2
	.word	0xb1a00552	! t0_kref+0x2748:   	fsqrtd	%f18, %f24
	call	SYM(t0_subr0)
	.word	0xa5b00776	! t0_kref+0x2750:   	fpack16	%f22, %f18
	.word	0xdf266014	! t0_kref+0x2754:   	st	%f15, [%i1 + 0x14]
	.word	0xa49cbe6a	! t0_kref+0x2758:   	xorcc	%l2, -0x196, %l2
	.word	0x91368009	! t0_kref+0x275c:   	srl	%i2, %o1, %o0
	.word	0xb7b54d60	! t0_kref+0x2760:   	fnot1s	%f21, %f27
	.word	0xac76c00b	! t0_kref+0x2764:   	udiv	%i3, %o3, %l6
	.word	0x81af0ad6	! t0_kref+0x2768:   	fcmped	%fcc0, %f28, %f22
	.word	0x9de3bfa0	! t0_kref+0x276c:   	save	%sp, -0x60, %sp
	.word	0xb08e4019	! t0_kref+0x2770:   	andcc	%i1, %i1, %i0
	.word	0x95eeaaeb	! t0_kref+0x2774:   	restore	%i2, 0xaeb, %o2
	.word	0xbda00058	! t0_kref+0x2778:   	fmovd	%f24, %f30
	.word	0xb5b70a98	! t0_kref+0x277c:   	fpsub16	%f28, %f24, %f26
	.word	0xaa823fea	! t0_kref+0x2780:   	addcc	%o0, -0x16, %l5
	.word	0xaa780010	! t0_kref+0x2784:   	sdiv	%g0, %l0, %l5
	.word	0x35800005	! t0_kref+0x2788:   	fbue,a	_kref+0x279c
	.word	0xb1b58c96	! t0_kref+0x278c:   	fandnot2	%f22, %f22, %f24
	.word	0xb5a01a34	! t0_kref+0x2790:   	fstoi	%f20, %f26
	.word	0x8186c000	! t0_kref+0x2794:   	wr	%i3, %g0, %y
	.word	0x22480002	! t0_kref+0x2798:   	be,a,pt	%icc, _kref+0x27a0
	.word	0xe2080018	! t0_kref+0x279c:   	ldub	[%g0 + %i0], %l1
	.word	0xd48e1000	! t0_kref+0x27a0:   	lduba	[%i0]0x80, %o2
	.word	0xbda00154	! t0_kref+0x27a4:   	fabsd	%f20, %f30
	.word	0xea0e8019	! t0_kref+0x27a8:   	ldub	[%i2 + %i1], %l5
	.word	0xadb00cde	! t0_kref+0x27ac:   	fnot2	%f30, %f22
	.word	0xadb48518	! t0_kref+0x27b0:   	fcmpgt16	%f18, %f24, %l6
	.word	0xfdee101d	! t0_kref+0x27b4:   	prefetcha	%i0 + %i5, 30
	.word	0xe6063fec	! t0_kref+0x27b8:   	ld	[%i0 - 0x14], %l3
	.word	0xa1b40d96	! t0_kref+0x27bc:   	fxor	%f16, %f22, %f16
	.word	0xa87df603	! t0_kref+0x27c0:   	sdiv	%l7, -0x9fd, %l4
	.word	0xa5b4c076	! t0_kref+0x27c4:   	edge8ln	%l3, %l6, %l2
	.word	0xa1408000	! t0_kref+0x27c8:   	mov	%ccr, %l0
	.word	0xb9b007ba	! t0_kref+0x27cc:   	fpackfix	%f26, %f28
	.word	0xa452800a	! t0_kref+0x27d0:   	umul	%o2, %o2, %l2
	.word	0xadb50914	! t0_kref+0x27d4:   	faligndata	%f20, %f20, %f22
	.word	0xf7060000	! t0_kref+0x27d8:   	ld	[%i0], %f27
	.word	0xadb50514	! t0_kref+0x27dc:   	fcmpgt16	%f20, %f20, %l6
	.word	0xb5b48910	! t0_kref+0x27e0:   	faligndata	%f18, %f16, %f26
	.word	0xe51e0000	! t0_kref+0x27e4:   	ldd	[%i0], %f18
	.word	0xe1264000	! t0_kref+0x27e8:   	st	%f16, [%i1]
	.word	0x81870000	! t0_kref+0x27ec:   	wr	%i4, %g0, %y
	.word	0xfd6e401a	! t0_kref+0x27f0:   	prefetch	%i1 + %i2, 30
	.word	0xe0100018	! t0_kref+0x27f4:   	lduh	[%g0 + %i0], %l0
	.word	0xa4db4017	! t0_kref+0x27f8:   	smulcc	%o5, %l7, %l2
	.word	0xd2270019	! t0_kref+0x27fc:   	st	%o1, [%i4 + %i1]
	.word	0xada00554	! t0_kref+0x2800:   	fsqrtd	%f20, %f22
	.word	0xb5a6483a	! t0_kref+0x2804:   	fadds	%f25, %f26, %f26
	.word	0x9de3bfa0	! t0_kref+0x2808:   	save	%sp, -0x60, %sp
	.word	0x810ea103	! t0_kref+0x280c:   	tsubcc	%i2, 0x103, %g0
	.word	0xa3ef4019	! t0_kref+0x2810:   	restore	%i5, %i1, %l1
	.word	0xac830017	! t0_kref+0x2814:   	addcc	%o4, %l7, %l6
	.word	0xbda00554	! t0_kref+0x2818:   	fsqrtd	%f20, %f30
	.word	0xa9a4c8bc	! t0_kref+0x281c:   	fsubs	%f19, %f28, %f20
	.word	0xa5a01031	! t0_kref+0x2820:   	fstox	%f17, %f18
	.word	0x92036bfa	! t0_kref+0x2824:   	add	%o5, 0xbfa, %o1
	.word	0x2d480003	! t0_kref+0x2828:   	fbg,a,pt	%fcc0, _kref+0x2834
	.word	0xafb5c0c0	! t0_kref+0x282c:   	edge16l	%l7, %g0, %l7
	.word	0xfd3f4018	! t0_kref+0x2830:   	std	%f30, [%i5 + %i0]
	.word	0xb1b3ce71	! t0_kref+0x2834:   	fxnors	%f15, %f17, %f24
	.word	0xd0263fe0	! t0_kref+0x2838:   	st	%o0, [%i0 - 0x20]
	.word	0x99b70f52	! t0_kref+0x283c:   	fornot1	%f28, %f18, %f12
	.word	0x90758012	! t0_kref+0x2840:   	udiv	%l6, %l2, %o0
	.word	0x2f480005	! t0_kref+0x2844:   	fbu,a,pt	%fcc0, _kref+0x2858
	.word	0xadb7caaf	! t0_kref+0x2848:   	fpsub16s	%f31, %f15, %f22
	.word	0xb9b38dd2	! t0_kref+0x284c:   	fnand	%f14, %f18, %f28
	.word	0xb1a01a5c	! t0_kref+0x2850:   	fdtoi	%f28, %f24
	.word	0xc36e6008	! t0_kref+0x2854:   	prefetch	%i1 + 8, 1
	.word	0x37480007	! t0_kref+0x2858:   	fbge,a,pt	%fcc0, _kref+0x2874
	.word	0x95034017	! t0_kref+0x285c:   	taddcc	%o5, %l7, %o2
	.word	0xada6cd3c	! t0_kref+0x2860:   	fsmuld	%f27, %f28, %f22
	.word	0x8143c000	! t0_kref+0x2864:   	stbar
	.word	0x9273401b	! t0_kref+0x2868:   	udiv	%o5, %i3, %o1
	.word	0x94dcb55a	! t0_kref+0x286c:   	smulcc	%l2, -0xaa6, %o2
	.word	0xeeee200b	! t0_kref+0x2870:   	ldstuba	[%i0 + 0xb]%asi, %l7
	.word	0xf9a0a02c	! t0_kref+0x2874:   	sta	%f28, [%g2 + 0x2c]%asi
	.word	0xaaf5800d	! t0_kref+0x2878:   	udivcc	%l6, %o5, %l5
	.word	0x86102002	! t0_kref+0x287c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x2880:   	bne,a	_kref+0x2880
	.word	0x86a0e001	! t0_kref+0x2884:   	subcc	%g3, 1, %g3
	.word	0xa3a0053a	! t0_kref+0x2888:   	fsqrts	%f26, %f17
	.word	0xee7e7fe8	! t0_kref+0x288c:   	swap	[%i1 - 0x18], %l7
	.word	0x23480006	! t0_kref+0x2890:   	fbne,a,pt	%fcc0, _kref+0x28a8
	.word	0xf6a0a024	! t0_kref+0x2894:   	sta	%i3, [%g2 + 0x24]%asi
	.word	0xae0ec00c	! t0_kref+0x2898:   	and	%i3, %o4, %l7
	.word	0xaeda800d	! t0_kref+0x289c:   	smulcc	%o2, %o5, %l7
	.word	0xf828a01c	! t0_kref+0x28a0:   	stb	%i4, [%g2 + 0x1c]
	.word	0xae5c8015	! t0_kref+0x28a4:   	smul	%l2, %l5, %l7
	.word	0x909c400a	! t0_kref+0x28a8:   	xorcc	%l1, %o2, %o0
	.word	0x25480003	! t0_kref+0x28ac:   	fblg,a,pt	%fcc0, _kref+0x28b8
	.word	0xb1a000ba	! t0_kref+0x28b0:   	fnegs	%f26, %f24
	.word	0x30480003	! t0_kref+0x28b4:   	ba,a,pt	%icc, _kref+0x28c0
	.word	0xd2680019	! t0_kref+0x28b8:   	ldstub	[%g0 + %i1], %o1
	.word	0x81580000	! t0_kref+0x28bc:   	flushw
	.word	0xb9a01a3b	! t0_kref+0x28c0:   	fstoi	%f27, %f28
	.word	0xaaadc01b	! t0_kref+0x28c4:   	andncc	%l7, %i3, %l5
	.word	0x81af8a56	! t0_kref+0x28c8:   	fcmpd	%fcc0, %f30, %f22
	.word	0xd4966004	! t0_kref+0x28cc:   	lduha	[%i1 + 4]%asi, %o2
	.word	0xbfb5ca3d	! t0_kref+0x28d0:   	fpadd16s	%f23, %f29, %f31
	.word	0xa1244015	! t0_kref+0x28d4:   	mulscc	%l1, %l5, %l0
	.word	0xe786101c	! t0_kref+0x28d8:   	lda	[%i0 + %i4]0x80, %f19
	.word	0xb5b38ad8	! t0_kref+0x28dc:   	fpsub32	%f14, %f24, %f26
	.word	0xfdee501b	! t0_kref+0x28e0:   	prefetcha	%i1 + %i3, 30
	.word	0x9fa01a50	! t0_kref+0x28e4:   	fdtoi	%f16, %f15
	.word	0xbda0054e	! t0_kref+0x28e8:   	fsqrtd	%f14, %f30
	.word	0xe968a081	! t0_kref+0x28ec:   	prefetch	%g2 + 0x81, 20
	.word	0xa418239e	! t0_kref+0x28f0:   	xor	%g0, 0x39e, %l2
	.word	0xbdb40e56	! t0_kref+0x28f4:   	fxnor	%f16, %f22, %f30
	.word	0xa67e8012	! t0_kref+0x28f8:   	sdiv	%i2, %l2, %l3
	.word	0xe6f75019	! t0_kref+0x28fc:   	stxa	%l3, [%i5 + %i1]0x80
	.word	0xd46e3fed	! t0_kref+0x2900:   	ldstub	[%i0 - 0x13], %o2
	.word	0x9405aba5	! t0_kref+0x2904:   	add	%l6, 0xba5, %o2
	.word	0xbfa7c83a	! t0_kref+0x2908:   	fadds	%f31, %f26, %f31
	.word	0xea8e9018	! t0_kref+0x290c:   	lduba	[%i2 + %i0]0x80, %l5
	.word	0xfd070018	! t0_kref+0x2910:   	ld	[%i4 + %i0], %f30
	.word	0xd03f4018	! t0_kref+0x2914:   	std	%o0, [%i5 + %i0]
	.word	0xd82e7ff9	! t0_kref+0x2918:   	stb	%o4, [%i1 - 7]
	.word	0xf428a01b	! t0_kref+0x291c:   	stb	%i2, [%g2 + 0x1b]
	.word	0xf1070019	! t0_kref+0x2920:   	ld	[%i4 + %i1], %f24
	.word	0x30480008	! t0_kref+0x2924:   	ba,a,pt	%icc, _kref+0x2944
	.word	0xea20a008	! t0_kref+0x2928:   	st	%l5, [%g2 + 8]
	.word	0xa005f0f5	! t0_kref+0x292c:   	add	%l7, -0xf0b, %l0
	.word	0x26480001	! t0_kref+0x2930:   	bl,a,pt	%icc, _kref+0x2934
	.word	0xee2e2005	! t0_kref+0x2934:   	stb	%l7, [%i0 + 5]
	.word	0xf8b0a016	! t0_kref+0x2938:   	stha	%i4, [%g2 + 0x16]%asi
	.word	0xadb40df3	! t0_kref+0x293c:   	fnands	%f16, %f19, %f22
	.word	0x21800006	! t0_kref+0x2940:   	fbn,a	_kref+0x2958
	.word	0xb9a88050	! t0_kref+0x2944:   	fmovdlg	%fcc0, %f16, %f28
	.word	0xada01a37	! t0_kref+0x2948:   	fstoi	%f23, %f22
	.word	0x85844017	! t0_kref+0x294c:   	wr	%l1, %l7, %ccr
	.word	0x11212fbe	! t0_kref+0x2950:   	sethi	%hi(0x84bef800), %o0
	.word	0x20480003	! t0_kref+0x2954:   	bn,a,pt	%icc, _kref+0x2960
	.word	0xb1a000d4	! t0_kref+0x2958:   	fnegd	%f20, %f24
	.word	0x37480004	! t0_kref+0x295c:   	fbge,a,pt	%fcc0, _kref+0x296c
	.word	0x91b40075	! t0_kref+0x2960:   	edge8ln	%l0, %l5, %o0
	.word	0x9da348b0	! t0_kref+0x2964:   	fsubs	%f13, %f16, %f14
	.word	0x900ca0ab	! t0_kref+0x2968:   	and	%l2, 0xab, %o0
	.word	0x949ef6b8	! t0_kref+0x296c:   	xorcc	%i3, -0x948, %o2
	.word	0xf13e4000	! t0_kref+0x2970:   	std	%f24, [%i1]
	.word	0xa9b70c9e	! t0_kref+0x2974:   	fandnot2	%f28, %f30, %f20
	.word	0x8143c000	! t0_kref+0x2978:   	stbar
	.word	0xf62e8019	! t0_kref+0x297c:   	stb	%i3, [%i2 + %i1]
	.word	0x99a7cd39	! t0_kref+0x2980:   	fsmuld	%f31, %f25, %f12
	.word	0x2c800007	! t0_kref+0x2984:   	bneg,a	_kref+0x29a0
	.word	0x99a0105c	! t0_kref+0x2988:   	fdtox	%f28, %f12
	.word	0xf83e2018	! t0_kref+0x298c:   	std	%i4, [%i0 + 0x18]
	.word	0xc76e6000	! t0_kref+0x2990:   	prefetch	%i1, 3
	.word	0xe4c71019	! t0_kref+0x2994:   	ldswa	[%i4 + %i1]0x80, %l2
	.word	0xf91e0000	! t0_kref+0x2998:   	ldd	[%i0], %f28
	.word	0xb9a01918	! t0_kref+0x299c:   	fitod	%f24, %f28
	.word	0xd27e201c	! t0_kref+0x29a0:   	swap	[%i0 + 0x1c], %o1
	.word	0xac046a30	! t0_kref+0x29a4:   	add	%l1, 0xa30, %l6
	.word	0xe11f4018	! t0_kref+0x29a8:   	ldd	[%i5 + %i0], %f16
	.word	0xf1871018	! t0_kref+0x29ac:   	lda	[%i4 + %i0]0x80, %f24
	.word	0x81ab0ad8	! t0_kref+0x29b0:   	fcmped	%fcc0, %f12, %f24
	.word	0x99b70dd0	! t0_kref+0x29b4:   	fnand	%f28, %f16, %f12
	.word	0x9fb00c20	! t0_kref+0x29b8:   	fzeros	%f15
	.word	0xa3a6c934	! t0_kref+0x29bc:   	fmuls	%f27, %f20, %f17
	.word	0x91b680c0	! t0_kref+0x29c0:   	edge16l	%i2, %g0, %o0
	.word	0x9da01118	! t0_kref+0x29c4:   	fxtod	%f24, %f14
	.word	0x81dce8d2	! t0_kref+0x29c8:   	flush	%l3 + 0x8d2
	.word	0xa5b28128	! t0_kref+0x29cc:   	edge32n	%o2, %o0, %l2
	call	SYM(t0_subr1)
	.word	0x273eb706	! t0_kref+0x29d4:   	sethi	%hi(0xfadc1800), %l3
	.word	0xb3a01a5a	! t0_kref+0x29d8:   	fdtoi	%f26, %f25
	call	SYM(t0_subr1)
	.word	0xa48dffc2	! t0_kref+0x29e0:   	andcc	%l7, -0x3e, %l2
	.word	0xaa54e889	! t0_kref+0x29e4:   	umul	%l3, 0x889, %l5
	.word	0x81aecab5	! t0_kref+0x29e8:   	fcmpes	%fcc0, %f27, %f21
	.word	0x81aecaae	! t0_kref+0x29ec:   	fcmpes	%fcc0, %f27, %f14
	.word	0xa005c01a	! t0_kref+0x29f0:   	add	%l7, %i2, %l0
	.word	0xa5a01896	! t0_kref+0x29f4:   	fitos	%f22, %f18
	.word	0x26480003	! t0_kref+0x29f8:   	bl,a,pt	%icc, _kref+0x2a04
	.word	0xa8642365	! t0_kref+0x29fc:   	subc	%l0, 0x365, %l4
	.word	0x29014dda	! t0_kref+0x2a00:   	sethi	%hi(0x5376800), %l4
	.word	0x9db38abd	! t0_kref+0x2a04:   	fpsub16s	%f14, %f29, %f14
	.word	0x8185c000	! t0_kref+0x2a08:   	wr	%l7, %g0, %y
	.word	0xa5a788bd	! t0_kref+0x2a0c:   	fsubs	%f30, %f29, %f18
	.word	0x9db50d1e	! t0_kref+0x2a10:   	fandnot1	%f20, %f30, %f14
	.word	0xa9a00550	! t0_kref+0x2a14:   	fsqrtd	%f16, %f20
	.word	0xaafa7669	! t0_kref+0x2a18:   	sdivcc	%o1, -0x997, %l5
	.word	0x3c480008	! t0_kref+0x2a1c:   	bpos,a,pt	%icc, _kref+0x2a3c
	.word	0xd62e7fe8	! t0_kref+0x2a20:   	stb	%o3, [%i1 - 0x18]
	.word	0x81ac4aba	! t0_kref+0x2a24:   	fcmpes	%fcc0, %f17, %f26
	.word	0xb9a6094e	! t0_kref+0x2a28:   	fmuld	%f24, %f14, %f28
	call	SYM(t0_subr2)
	.word	0xe62e001a	! t0_kref+0x2a30:   	stb	%l3, [%i0 + %i2]
	.word	0xf9060000	! t0_kref+0x2a34:   	ld	[%i0], %f28
	.word	0xd83e6018	! t0_kref+0x2a38:   	std	%o4, [%i1 + 0x18]
	.word	0xf83e2010	! t0_kref+0x2a3c:   	std	%i4, [%i0 + 0x10]
	.word	0xee6e8019	! t0_kref+0x2a40:   	ldstub	[%i2 + %i1], %l7
	.word	0x37800005	! t0_kref+0x2a44:   	fbge,a	_kref+0x2a58
	.word	0xee46200c	! t0_kref+0x2a48:   	ldsw	[%i0 + 0xc], %l7
	.word	0x81db4011	! t0_kref+0x2a4c:   	flush	%o5 + %l1
	.word	0xfd1e0000	! t0_kref+0x2a50:   	ldd	[%i0], %f30
	.word	0x8585c00b	! t0_kref+0x2a54:   	wr	%l7, %o3, %ccr
	.word	0xada00131	! t0_kref+0x2a58:   	fabss	%f17, %f22
	.word	0x81ad8a35	! t0_kref+0x2a5c:   	fcmps	%fcc0, %f22, %f21
	.word	0x2a480004	! t0_kref+0x2a60:   	bcs,a,pt	%icc, _kref+0x2a70
	.word	0xabb28160	! t0_kref+0x2a64:   	edge32ln	%o2, %g0, %l5
	.word	0x91b6c031	! t0_kref+0x2a68:   	edge8n	%i3, %l1, %o0
	.word	0xa5a70d3c	! t0_kref+0x2a6c:   	fsmuld	%f28, %f28, %f18
	.word	0xa7a000ba	! t0_kref+0x2a70:   	fnegs	%f26, %f19
	.word	0xa1b00cd6	! t0_kref+0x2a74:   	fnot2	%f22, %f16
	.word	0xfd9e501d	! t0_kref+0x2a78:   	ldda	[%i1 + %i5]0x80, %f30
	.word	0xb9b78a90	! t0_kref+0x2a7c:   	fpsub16	%f30, %f16, %f28
	.word	0xa8f6e5b6	! t0_kref+0x2a80:   	udivcc	%i3, 0x5b6, %l4
	.word	0xb9a508da	! t0_kref+0x2a84:   	fsubd	%f20, %f26, %f28
	.word	0xa2158015	! t0_kref+0x2a88:   	or	%l6, %l5, %l1
	.word	0xa1a0192d	! t0_kref+0x2a8c:   	fstod	%f13, %f16
	.word	0xec2e201f	! t0_kref+0x2a90:   	stb	%l6, [%i0 + 0x1f]
	.word	0x9de3bfa0	! t0_kref+0x2a94:   	save	%sp, -0x60, %sp
	.word	0xb106255c	! t0_kref+0x2a98:   	taddcc	%i0, 0x55c, %i0
	.word	0x91ef7b87	! t0_kref+0x2a9c:   	restore	%i5, -0x479, %o0
	.word	0xaba000ad	! t0_kref+0x2aa0:   	fnegs	%f13, %f21
	.word	0x90144010	! t0_kref+0x2aa4:   	or	%l1, %l0, %o0
	.word	0xada5894e	! t0_kref+0x2aa8:   	fmuld	%f22, %f14, %f22
	.word	0xa1b48a18	! t0_kref+0x2aac:   	fpadd16	%f18, %f24, %f16
	.word	0xe91e2000	! t0_kref+0x2ab0:   	ldd	[%i0], %f20
	call	SYM(t0_subr1)
	.word	0xda270018	! t0_kref+0x2ab8:   	st	%o5, [%i4 + %i0]
	.word	0xa21c8013	! t0_kref+0x2abc:   	xor	%l2, %l3, %l1
	.word	0x8143e040	! t0_kref+0x2ac0:   	membar	0x40
	.word	0xafb34e35	! t0_kref+0x2ac4:   	fands	%f13, %f21, %f23
	.word	0xe02e2019	! t0_kref+0x2ac8:   	stb	%l0, [%i0 + 0x19]
	.word	0xa22232e3	! t0_kref+0x2acc:   	sub	%o0, -0xd1d, %l1
	.word	0xafa0052f	! t0_kref+0x2ad0:   	fsqrts	%f15, %f23
	.word	0xa5344014	! t0_kref+0x2ad4:   	srl	%l1, %l4, %l2
	.word	0x9da0053c	! t0_kref+0x2ad8:   	fsqrts	%f28, %f14
	.word	0xe99e5a1b	! t0_kref+0x2adc:   	ldda	[%i1 + %i3]0xd0, %f20
	.word	0xa9a00034	! t0_kref+0x2ae0:   	fmovs	%f20, %f20
	.word	0xd216001b	! t0_kref+0x2ae4:   	lduh	[%i0 + %i3], %o1
	.word	0x9da0052e	! t0_kref+0x2ae8:   	fsqrts	%f14, %f14
	.word	0x27800008	! t0_kref+0x2aec:   	fbul,a	_kref+0x2b0c
	.word	0xbbb3cabe	! t0_kref+0x2af0:   	fpsub16s	%f15, %f30, %f29
	.word	0xb5a38850	! t0_kref+0x2af4:   	faddd	%f14, %f16, %f26
	.word	0x9075400c	! t0_kref+0x2af8:   	udiv	%l5, %o4, %o0
	.word	0xbdb5c63a	! t0_kref+0x2afc:   	fmul8x16	%f23, %f26, %f30
	.word	0x3a480007	! t0_kref+0x2b00:   	bcc,a,pt	%icc, _kref+0x2b1c
	.word	0xb1a01933	! t0_kref+0x2b04:   	fstod	%f19, %f24
	.word	0xa5a01899	! t0_kref+0x2b08:   	fitos	%f25, %f18
	.word	0x92730008	! t0_kref+0x2b0c:   	udiv	%o4, %o0, %o1
	.word	0xae72f22b	! t0_kref+0x2b10:   	udiv	%o3, -0xdd5, %l7
	.word	0xa9b6841e	! t0_kref+0x2b14:   	fcmple16	%f26, %f30, %l4
	.word	0xa5a688ba	! t0_kref+0x2b18:   	fsubs	%f26, %f26, %f18
	.word	0x9da388dc	! t0_kref+0x2b1c:   	fsubd	%f14, %f28, %f14
	.word	0x911d801c	! t0_kref+0x2b20:   	tsubcctv	%l6, %i4, %o0
	.word	0xa69a000c	! t0_kref+0x2b24:   	xorcc	%o0, %o4, %l3
	.word	0xe80e4000	! t0_kref+0x2b28:   	ldub	[%i1], %l4
	.word	0xb7a01a4e	! t0_kref+0x2b2c:   	fdtoi	%f14, %f27
	.word	0xa05efdc5	! t0_kref+0x2b30:   	smul	%i3, -0x23b, %l0
	.word	0x9074c015	! t0_kref+0x2b34:   	udiv	%l3, %l5, %o0
	.word	0x81854000	! t0_kref+0x2b38:   	wr	%l5, %g0, %y
	.word	0x91b70518	! t0_kref+0x2b3c:   	fcmpgt16	%f28, %f24, %o0
	.word	0xb9b00cce	! t0_kref+0x2b40:   	fnot2	%f14, %f28
	.word	0xa9408000	! t0_kref+0x2b44:   	mov	%ccr, %l4
	.word	0xaa568009	! t0_kref+0x2b48:   	umul	%i2, %o1, %l5
	.word	0xa27a4009	! t0_kref+0x2b4c:   	sdiv	%o1, %o1, %l1
	.word	0xe9070018	! t0_kref+0x2b50:   	ld	[%i4 + %i0], %f20
	.word	0xa5a0193c	! t0_kref+0x2b54:   	fstod	%f28, %f18
	.word	0x2f3d04d9	! t0_kref+0x2b58:   	sethi	%hi(0xf4136400), %l7
	.word	0x81af0ad0	! t0_kref+0x2b5c:   	fcmped	%fcc0, %f28, %f16
	.word	0xa3400000	! t0_kref+0x2b60:   	mov	%y, %l1
	.word	0x2b480004	! t0_kref+0x2b64:   	fbug,a,pt	%fcc0, _kref+0x2b74
	.word	0xbda388ad	! t0_kref+0x2b68:   	fsubs	%f14, %f13, %f30
	.word	0xa5b4c677	! t0_kref+0x2b6c:   	fmul8x16au	%f19, %f23, %f18
	.word	0x3e480002	! t0_kref+0x2b70:   	bvc,a,pt	%icc, _kref+0x2b78
	.word	0xae8aeaec	! t0_kref+0x2b74:   	andcc	%o3, 0xaec, %l7
	.word	0xbda68956	! t0_kref+0x2b78:   	fmuld	%f26, %f22, %f30
	.word	0xa6058008	! t0_kref+0x2b7c:   	add	%l6, %o0, %l3
	.word	0xa3a01a54	! t0_kref+0x2b80:   	fdtoi	%f20, %f17
	.word	0xa1b00c20	! t0_kref+0x2b84:   	fzeros	%f16
	.word	0xa1a00539	! t0_kref+0x2b88:   	fsqrts	%f25, %f16
	.word	0xe8ff1018	! t0_kref+0x2b8c:   	swapa	[%i4 + %i0]0x80, %l4
	.word	0xb5b70c5a	! t0_kref+0x2b90:   	fnor	%f28, %f26, %f26
	.word	0xbda01934	! t0_kref+0x2b94:   	fstod	%f20, %f30
	.word	0x90bcfbb3	! t0_kref+0x2b98:   	xnorcc	%l3, -0x44d, %o0
	.word	0x31480006	! t0_kref+0x2b9c:   	fba,a,pt	%fcc0, _kref+0x2bb4
	.word	0xa9b38edc	! t0_kref+0x2ba0:   	fornot2	%f14, %f28, %f20
	.word	0xe1867ffc	! t0_kref+0x2ba4:   	lda	[%i1 - 4]%asi, %f16
	.word	0xee070019	! t0_kref+0x2ba8:   	ld	[%i4 + %i1], %l7
	.word	0x8143e050	! t0_kref+0x2bac:   	membar	0x50
	.word	0xf62e401a	! t0_kref+0x2bb0:   	stb	%i3, [%i1 + %i2]
	.word	0x8143e040	! t0_kref+0x2bb4:   	membar	0x40
	.word	0xabb4c0fc	! t0_kref+0x2bb8:   	edge16ln	%l3, %i4, %l5
	.word	0x3b800004	! t0_kref+0x2bbc:   	fble,a	_kref+0x2bcc
	.word	0xa7a018d4	! t0_kref+0x2bc0:   	fdtos	%f20, %f19
	.word	0xa624f49f	! t0_kref+0x2bc4:   	sub	%l3, -0xb61, %l3
	.word	0xa87aea7c	! t0_kref+0x2bc8:   	sdiv	%o3, 0xa7c, %l4
	.word	0xb9a6cd3b	! t0_kref+0x2bcc:   	fsmuld	%f27, %f27, %f28
	.word	0x81af4a33	! t0_kref+0x2bd0:   	fcmps	%fcc0, %f29, %f19
	.word	0x81580000	! t0_kref+0x2bd4:   	flushw
	.word	0x99a4095e	! t0_kref+0x2bd8:   	fmuld	%f16, %f30, %f12
	.word	0x29093df6	! t0_kref+0x2bdc:   	sethi	%hi(0x24f7d800), %l4
	.word	0xebee501b	! t0_kref+0x2be0:   	prefetcha	%i1 + %i3, 21
	.word	0xb1b70d40	! t0_kref+0x2be4:   	fnot1	%f28, %f24
	.word	0xb7a7082d	! t0_kref+0x2be8:   	fadds	%f28, %f13, %f27
	.word	0x9fa01a4c	! t0_kref+0x2bec:   	fdtoi	%f12, %f15
	.word	0x99b40dd4	! t0_kref+0x2bf0:   	fnand	%f16, %f20, %f12
	.word	0xd02e8018	! t0_kref+0x2bf4:   	stb	%o0, [%i2 + %i0]
	.word	0xac85c015	! t0_kref+0x2bf8:   	addcc	%l7, %l5, %l6
	.word	0xa3a0189b	! t0_kref+0x2bfc:   	fitos	%f27, %f17
	.word	0x81830000	! t0_kref+0x2c00:   	wr	%o4, %g0, %y
	.word	0xaa533ba9	! t0_kref+0x2c04:   	umul	%o4, -0x457, %l5
	.word	0xd44e4000	! t0_kref+0x2c08:   	ldsb	[%i1], %o2
	.word	0xae43001b	! t0_kref+0x2c0c:   	addc	%o4, %i3, %l7
	.word	0x9fc00004	! t0_kref+0x2c10:   	call	%g0 + %g4
	.word	0x9fa0053f	! t0_kref+0x2c14:   	fsqrts	%f31, %f15
	.word	0xadb7062e	! t0_kref+0x2c18:   	fmul8x16	%f28, %f14, %f22
	.word	0xac66e495	! t0_kref+0x2c1c:   	subc	%i3, 0x495, %l6
	.word	0xfd1e7fe0	! t0_kref+0x2c20:   	ldd	[%i1 - 0x20], %f30
	.word	0x2f480004	! t0_kref+0x2c24:   	fbu,a,pt	%fcc0, _kref+0x2c34
	.word	0xea7e4000	! t0_kref+0x2c28:   	swap	[%i1], %l5
	.word	0xe99e5a1c	! t0_kref+0x2c2c:   	ldda	[%i1 + %i4]0xd0, %f20
	.word	0xa1b58335	! t0_kref+0x2c30:   	bmask	%l6, %l5, %l0
	.word	0xd2fe6004	! t0_kref+0x2c34:   	swapa	[%i1 + 4]%asi, %o1
	.word	0xa672a2ea	! t0_kref+0x2c38:   	udiv	%o2, 0x2ea, %l3
	.word	0xadb50d92	! t0_kref+0x2c3c:   	fxor	%f20, %f18, %f22
	.word	0x81da0000	! t0_kref+0x2c40:   	flush	%o0
	.word	0xa85cae4d	! t0_kref+0x2c44:   	smul	%l2, 0xe4d, %l4
	.word	0x38800007	! t0_kref+0x2c48:   	bgu,a	_kref+0x2c64
	.word	0xa5a388b0	! t0_kref+0x2c4c:   	fsubs	%f14, %f16, %f18
	.word	0xd0d6200e	! t0_kref+0x2c50:   	ldsha	[%i0 + 0xe]%asi, %o0
	.word	0x26480007	! t0_kref+0x2c54:   	bl,a,pt	%icc, _kref+0x2c70
	.word	0x9db4090c	! t0_kref+0x2c58:   	faligndata	%f16, %f12, %f14
	.word	0xb9b58e7e	! t0_kref+0x2c5c:   	fxnors	%f22, %f30, %f28
	.word	0xec300018	! t0_kref+0x2c60:   	sth	%l6, [%g0 + %i0]
	.word	0xa7b70558	! t0_kref+0x2c64:   	fcmpeq16	%f28, %f24, %l3
	.word	0xa537201b	! t0_kref+0x2c68:   	srl	%i4, 0x1b, %l2
	.word	0xa476801a	! t0_kref+0x2c6c:   	udiv	%i2, %i2, %l2
	.word	0x26800008	! t0_kref+0x2c70:   	bl,a	_kref+0x2c90
	.word	0xa82b3376	! t0_kref+0x2c74:   	andn	%o4, -0xc8a, %l4
	.word	0xb9a01a52	! t0_kref+0x2c78:   	fdtoi	%f18, %f28
	.word	0xd4a0a004	! t0_kref+0x2c7c:   	sta	%o2, [%g2 + 4]%asi
	.word	0xa8850013	! t0_kref+0x2c80:   	addcc	%l4, %l3, %l4
	.word	0xd89f5018	! t0_kref+0x2c84:   	ldda	[%i5 + %i0]0x80, %o4
	.word	0xb1a48852	! t0_kref+0x2c88:   	faddd	%f18, %f18, %f24
	.word	0xee7e3fec	! t0_kref+0x2c8c:   	swap	[%i0 - 0x14], %l7
	.word	0xd02e8018	! t0_kref+0x2c90:   	stb	%o0, [%i2 + %i0]
	.word	0xb9a00533	! t0_kref+0x2c94:   	fsqrts	%f19, %f28
	.word	0x92fa2bf0	! t0_kref+0x2c98:   	sdivcc	%o0, 0xbf0, %o1
	.word	0xafb680b1	! t0_kref+0x2c9c:   	edge16n	%i2, %l1, %l7
	.word	0xa1232d54	! t0_kref+0x2ca0:   	mulscc	%o4, 0xd54, %l0
	.word	0xfdb81019	! t0_kref+0x2ca4:   	stda	%f30, [%g0 + %i1]0x80
	.word	0xa4627e09	! t0_kref+0x2ca8:   	subc	%o1, -0x1f7, %l2
	.word	0xa41d401b	! t0_kref+0x2cac:   	xor	%l5, %i3, %l2
	.word	0x9de3bfa0	! t0_kref+0x2cb0:   	save	%sp, -0x60, %sp
	.word	0xa3ee3dd8	! t0_kref+0x2cb4:   	restore	%i0, -0x228, %l1
	.word	0xacdc7746	! t0_kref+0x2cb8:   	smulcc	%l1, -0x8ba, %l6
	.word	0x9414e019	! t0_kref+0x2cbc:   	or	%l3, 0x19, %o2
	.word	0x8143e040	! t0_kref+0x2cc0:   	membar	0x40
	.word	0x9de3bfa0	! t0_kref+0x2cc4:   	save	%sp, -0x60, %sp
	.word	0x91e820de	! t0_kref+0x2cc8:   	restore	%g0, 0xde, %o0
	.word	0xd2b0a038	! t0_kref+0x2ccc:   	stha	%o1, [%g2 + 0x38]%asi
	.word	0x3f800002	! t0_kref+0x2cd0:   	fbo,a	_kref+0x2cd8
	.word	0xfd1e6000	! t0_kref+0x2cd4:   	ldd	[%i1], %f30
	.word	0xea6e401a	! t0_kref+0x2cd8:   	ldstub	[%i1 + %i2], %l5
	.word	0xa9a0193d	! t0_kref+0x2cdc:   	fstod	%f29, %f20
	.word	0xfd062014	! t0_kref+0x2ce0:   	ld	[%i0 + 0x14], %f30
	.word	0xe0ce201f	! t0_kref+0x2ce4:   	ldsba	[%i0 + 0x1f]%asi, %l0
	.word	0x30480007	! t0_kref+0x2ce8:   	ba,a,pt	%icc, _kref+0x2d04
	.word	0xfd1e2018	! t0_kref+0x2cec:   	ldd	[%i0 + 0x18], %f30
	.word	0x3c480007	! t0_kref+0x2cf0:   	bpos,a,pt	%icc, _kref+0x2d0c
	.word	0xadb700e0	! t0_kref+0x2cf4:   	edge16ln	%i4, %g0, %l6
	.word	0x9db78ab2	! t0_kref+0x2cf8:   	fpsub16s	%f30, %f18, %f14
	.word	0x29071992	! t0_kref+0x2cfc:   	sethi	%hi(0x1c664800), %l4
	.word	0xfb06001c	! t0_kref+0x2d00:   	ld	[%i0 + %i4], %f29
	.word	0xa5b7044e	! t0_kref+0x2d04:   	fcmpne16	%f28, %f14, %l2
	.word	0x81adcab9	! t0_kref+0x2d08:   	fcmpes	%fcc0, %f23, %f25
	.word	0xe86e601c	! t0_kref+0x2d0c:   	ldstub	[%i1 + 0x1c], %l4
	.word	0xd6280018	! t0_kref+0x2d10:   	stb	%o3, [%g0 + %i0]
	.word	0x8185c000	! t0_kref+0x2d14:   	wr	%l7, %g0, %y
	call	SYM(t0_subr0)
	.word	0xa1b6c200	! t0_kref+0x2d1c:   	array8	%i3, %g0, %l0
	.word	0x92ba77f5	! t0_kref+0x2d20:   	xnorcc	%o1, -0x80b, %o1
	.word	0x22800003	! t0_kref+0x2d24:   	be,a	_kref+0x2d30
	.word	0xa854801b	! t0_kref+0x2d28:   	umul	%l2, %i3, %l4
	.word	0xec3e7ff8	! t0_kref+0x2d2c:   	std	%l6, [%i1 - 8]
	.word	0xc026600c	! t0_kref+0x2d30:   	clr	[%i1 + 0xc]
	.word	0x81abcab6	! t0_kref+0x2d34:   	fcmpes	%fcc0, %f15, %f22
	.word	0xa5b6091e	! t0_kref+0x2d38:   	faligndata	%f24, %f30, %f18
	.word	0x36480004	! t0_kref+0x2d3c:   	bge,a,pt	%icc, _kref+0x2d4c
	.word	0xa1a0105e	! t0_kref+0x2d40:   	fdtox	%f30, %f16
	.word	0x3e480007	! t0_kref+0x2d44:   	bvc,a,pt	%icc, _kref+0x2d60
	.word	0xbfb74c7b	! t0_kref+0x2d48:   	fnors	%f29, %f27, %f31
	call	SYM(t0_subr2)
	.word	0xa27ee76f	! t0_kref+0x2d50:   	sdiv	%i3, 0x76f, %l1
	.word	0xa3400000	! t0_kref+0x2d54:   	mov	%y, %l1
	.word	0xbdb00cd4	! t0_kref+0x2d58:   	fnot2	%f20, %f30
	.word	0xa05ac008	! t0_kref+0x2d5c:   	smul	%o3, %o0, %l0
	.word	0xbfa4883d	! t0_kref+0x2d60:   	fadds	%f18, %f29, %f31
	.word	0xbda00131	! t0_kref+0x2d64:   	fabss	%f17, %f30
	.word	0x32800008	! t0_kref+0x2d68:   	bne,a	_kref+0x2d88
	.word	0x13189567	! t0_kref+0x2d6c:   	sethi	%hi(0x62559c00), %o1
	.word	0xbdb40a10	! t0_kref+0x2d70:   	fpadd16	%f16, %f16, %f30
	.word	0xd2ff1018	! t0_kref+0x2d74:   	swapa	[%i4 + %i0]0x80, %o1
	.word	0xe2c01018	! t0_kref+0x2d78:   	ldswa	[%g0 + %i0]0x80, %l1
	.word	0xb1a3cd3b	! t0_kref+0x2d7c:   	fsmuld	%f15, %f27, %f24
	.word	0x91b3006b	! t0_kref+0x2d80:   	edge8ln	%o4, %o3, %o0
	.word	0x9da70d37	! t0_kref+0x2d84:   	fsmuld	%f28, %f23, %f14
	.word	0xac75bfcb	! t0_kref+0x2d88:   	udiv	%l6, -0x35, %l6
	.word	0xa9b58ece	! t0_kref+0x2d8c:   	fornot2	%f22, %f14, %f20
	.word	0xd6263fe0	! t0_kref+0x2d90:   	st	%o3, [%i0 - 0x20]
	.word	0xa5b007b6	! t0_kref+0x2d94:   	fpackfix	%f22, %f18
	.word	0xac768015	! t0_kref+0x2d98:   	udiv	%i2, %l5, %l6
	.word	0xbdb30c92	! t0_kref+0x2d9c:   	fandnot2	%f12, %f18, %f30
	.word	0xa8f27371	! t0_kref+0x2da0:   	udivcc	%o1, -0xc8f, %l4
	.word	0xada4095c	! t0_kref+0x2da4:   	fmuld	%f16, %f28, %f22
	.word	0xae1a0000	! t0_kref+0x2da8:   	xor	%o0, %g0, %l7
	.word	0xf007bfe0	! t0_kref+0x2dac:   	ld	[%fp - 0x20], %i0
	.word	0xb1a7895e	! t0_kref+0x2db0:   	fmuld	%f30, %f30, %f24
	.word	0xb9b506f8	! t0_kref+0x2db4:   	fmul8ulx16	%f20, %f24, %f28
	.word	0xe046001c	! t0_kref+0x2db8:   	ldsw	[%i0 + %i4], %l0
	.word	0xc768a04e	! t0_kref+0x2dbc:   	prefetch	%g2 + 0x4e, 3
	.word	0x9fa6092e	! t0_kref+0x2dc0:   	fmuls	%f24, %f14, %f15
	.word	0xe40e0000	! t0_kref+0x2dc4:   	ldub	[%i0], %l2
	.word	0x250bb439	! t0_kref+0x2dc8:   	sethi	%hi(0x2ed0e400), %l2
	.word	0xa225c017	! t0_kref+0x2dcc:   	sub	%l7, %l7, %l1
	.word	0x901a001b	! t0_kref+0x2dd0:   	xor	%o0, %i3, %o0
	.word	0xe9e8a040	! t0_kref+0x2dd4:   	prefetcha	%g2 + 0x40, 20
	.word	0xa80425fd	! t0_kref+0x2dd8:   	add	%l0, 0x5fd, %l4
	.word	0xe4c71019	! t0_kref+0x2ddc:   	ldswa	[%i4 + %i1]0x80, %l2
	.word	0x3c800001	! t0_kref+0x2de0:   	bpos,a	_kref+0x2de4
	.word	0xb9b00c20	! t0_kref+0x2de4:   	fzeros	%f28
	.word	0xe686600c	! t0_kref+0x2de8:   	lda	[%i1 + 0xc]%asi, %l3
	.word	0xadb40f5c	! t0_kref+0x2dec:   	fornot1	%f16, %f28, %f22
	.word	0xacdf234c	! t0_kref+0x2df0:   	smulcc	%i4, 0x34c, %l6
	.word	0x20480008	! t0_kref+0x2df4:   	bn,a,pt	%icc, _kref+0x2e14
	.word	0xa4e732f1	! t0_kref+0x2df8:   	subccc	%i4, -0xd0f, %l2
	.word	0x81ab8abb	! t0_kref+0x2dfc:   	fcmpes	%fcc0, %f14, %f27
	.word	0xe9be5813	! t0_kref+0x2e00:   	stda	%f20, [%i1 + %l3]0xc0
	.word	0xa5a00556	! t0_kref+0x2e04:   	fsqrtd	%f22, %f18
	.word	0xe20e7ffc	! t0_kref+0x2e08:   	ldub	[%i1 - 4], %l1
	.word	0xa4058015	! t0_kref+0x2e0c:   	add	%l6, %l5, %l2
	.word	0x9416e7ba	! t0_kref+0x2e10:   	or	%i3, 0x7ba, %o2
	.word	0xa1b440ed	! t0_kref+0x2e14:   	edge16ln	%l1, %o5, %l0
	.word	0xa60c4017	! t0_kref+0x2e18:   	and	%l1, %l7, %l3
	.word	0x83414000	! t0_kref+0x2e1c:   	mov	%pc, %g1
	.word	0x9fc00004	! t0_kref+0x2e20:   	call	%g0 + %g4
	.word	0xa9b68dff	! t0_kref+0x2e24:   	fnands	%f26, %f31, %f20
	.word	0xa9a3884e	! t0_kref+0x2e28:   	faddd	%f14, %f14, %f20
	.word	0xa4f54013	! t0_kref+0x2e2c:   	udivcc	%l5, %l3, %l2
	.word	0xa65b3020	! t0_kref+0x2e30:   	smul	%o4, -0xfe0, %l3
	.word	0xa1a00136	! t0_kref+0x2e34:   	fabss	%f22, %f16
	.word	0xe49e2008	! t0_kref+0x2e38:   	ldda	[%i0 + 8]%asi, %l2
	.word	0x81ae4abe	! t0_kref+0x2e3c:   	fcmpes	%fcc0, %f25, %f30
	.word	0xee4e6005	! t0_kref+0x2e40:   	ldsb	[%i1 + 5], %l7
	.word	0xf82e7ff8	! t0_kref+0x2e44:   	stb	%i4, [%i1 - 8]
	.word	0xa5b5cea0	! t0_kref+0x2e48:   	fsrc1s	%f23, %f18
	.word	0xeca0a02c	! t0_kref+0x2e4c:   	sta	%l6, [%g2 + 0x2c]%asi
	.word	0xbda0193b	! t0_kref+0x2e50:   	fstod	%f27, %f30
	.word	0xb1b7891a	! t0_kref+0x2e54:   	faligndata	%f30, %f26, %f24
	.word	0xa0183369	! t0_kref+0x2e58:   	xor	%g0, -0xc97, %l0
	.word	0x94d420be	! t0_kref+0x2e5c:   	umulcc	%l0, 0xbe, %o2
	.word	0xb1b587de	! t0_kref+0x2e60:   	pdist	%f22, %f30, %f24
	.word	0x94a02c1f	! t0_kref+0x2e64:   	subcc	%g0, 0xc1f, %o2
	.word	0x9da01914	! t0_kref+0x2e68:   	fitod	%f20, %f14
	.word	0xac1c8016	! t0_kref+0x2e6c:   	xor	%l2, %l6, %l6
	.word	0xa89a7eca	! t0_kref+0x2e70:   	xorcc	%o1, -0x136, %l4
	.word	0xadb50013	! t0_kref+0x2e74:   	edge8	%l4, %l3, %l6
	.word	0xe6300019	! t0_kref+0x2e78:   	sth	%l3, [%g0 + %i1]
	.word	0xb1a688ba	! t0_kref+0x2e7c:   	fsubs	%f26, %f26, %f24
	.word	0x91342019	! t0_kref+0x2e80:   	srl	%l0, 0x19, %o0
	.word	0xb9a00531	! t0_kref+0x2e84:   	fsqrts	%f17, %f28
	.word	0xa5a0052e	! t0_kref+0x2e88:   	fsqrts	%f14, %f18
	.word	0xa0e58014	! t0_kref+0x2e8c:   	subccc	%l6, %l4, %l0
	.word	0xadb60a98	! t0_kref+0x2e90:   	fpsub16	%f24, %f24, %f22
	.word	0x9fa648b2	! t0_kref+0x2e94:   	fsubs	%f25, %f18, %f15
	.word	0x81afcaad	! t0_kref+0x2e98:   	fcmpes	%fcc0, %f31, %f13
	.word	0xa7a01890	! t0_kref+0x2e9c:   	fitos	%f16, %f19
	.word	0x8143e040	! t0_kref+0x2ea0:   	membar	0x40
	.word	0xae152d1a	! t0_kref+0x2ea4:   	or	%l4, 0xd1a, %l7
	.word	0xa5b30edc	! t0_kref+0x2ea8:   	fornot2	%f12, %f28, %f18
	.word	0xaba01098	! t0_kref+0x2eac:   	fxtos	%f24, %f21
	.word	0xada0013d	! t0_kref+0x2eb0:   	fabss	%f29, %f22
	.word	0xada50856	! t0_kref+0x2eb4:   	faddd	%f20, %f22, %f22
	.word	0x2d480004	! t0_kref+0x2eb8:   	fbg,a,pt	%fcc0, _kref+0x2ec8
	.word	0xe8280019	! t0_kref+0x2ebc:   	stb	%l4, [%g0 + %i1]
	.word	0xd43e3fe0	! t0_kref+0x2ec0:   	std	%o2, [%i0 - 0x20]
	.word	0xadb70ad4	! t0_kref+0x2ec4:   	fpsub32	%f28, %f20, %f22
	.word	0xa2000016	! t0_kref+0x2ec8:   	add	%g0, %l6, %l1
	.word	0x3d480003	! t0_kref+0x2ecc:   	fbule,a,pt	%fcc0, _kref+0x2ed8
	.word	0xe22e2008	! t0_kref+0x2ed0:   	stb	%l1, [%i0 + 8]
	.word	0xa9b70c9c	! t0_kref+0x2ed4:   	fandnot2	%f28, %f28, %f20
	.word	0xa9408000	! t0_kref+0x2ed8:   	mov	%ccr, %l4
	.word	0xbda00558	! t0_kref+0x2edc:   	fsqrtd	%f24, %f30
	.word	0xe40e3ffd	! t0_kref+0x2ee0:   	ldub	[%i0 - 3], %l2
	.word	0x37480001	! t0_kref+0x2ee4:   	fbge,a,pt	%fcc0, _kref+0x2ee8
	.word	0xb1a38958	! t0_kref+0x2ee8:   	fmuld	%f14, %f24, %f24
	.word	0x81aeca32	! t0_kref+0x2eec:   	fcmps	%fcc0, %f27, %f18
	.word	0x9da00554	! t0_kref+0x2ef0:   	fsqrtd	%f20, %f14
	.word	0xa206800d	! t0_kref+0x2ef4:   	add	%i2, %o5, %l1
	.word	0xa428001a	! t0_kref+0x2ef8:   	andn	%g0, %i2, %l2
	.word	0x2c800007	! t0_kref+0x2efc:   	bneg,a	_kref+0x2f18
	.word	0xa9b24136	! t0_kref+0x2f00:   	edge32n	%o1, %l6, %l4
	.word	0x2d480007	! t0_kref+0x2f04:   	fbg,a,pt	%fcc0, _kref+0x2f20
	.word	0xf11e0000	! t0_kref+0x2f08:   	ldd	[%i0], %f24
	.word	0xe0a0a024	! t0_kref+0x2f0c:   	sta	%l0, [%g2 + 0x24]%asi
	.word	0xb7b60f78	! t0_kref+0x2f10:   	fornot1s	%f24, %f24, %f27
	.word	0xd0070018	! t0_kref+0x2f14:   	ld	[%i4 + %i0], %o0
	.word	0xa9a70936	! t0_kref+0x2f18:   	fmuls	%f28, %f22, %f20
	.word	0xafb38d3e	! t0_kref+0x2f1c:   	fandnot1s	%f14, %f30, %f23
	.word	0xaed34016	! t0_kref+0x2f20:   	umulcc	%o5, %l6, %l7
	.word	0xf83e401d	! t0_kref+0x2f24:   	std	%i4, [%i1 + %i5]
	.word	0x9322400d	! t0_kref+0x2f28:   	mulscc	%o1, %o5, %o1
	.word	0x81824000	! t0_kref+0x2f2c:   	wr	%o1, %g0, %y
	.word	0xb5a0054e	! t0_kref+0x2f30:   	fsqrtd	%f14, %f26
	.word	0xb5a0105e	! t0_kref+0x2f34:   	fdtox	%f30, %f26
	.word	0xda7e7fe0	! t0_kref+0x2f38:   	swap	[%i1 - 0x20], %o5
	.word	0xa7b00772	! t0_kref+0x2f3c:   	fpack16	%f18, %f19
	.word	0x27800001	! t0_kref+0x2f40:   	fbul,a	_kref+0x2f44
	.word	0xee067fec	! t0_kref+0x2f44:   	ld	[%i1 - 0x14], %l7
	.word	0xd62e6000	! t0_kref+0x2f48:   	stb	%o3, [%i1]
	.word	0xfd06001c	! t0_kref+0x2f4c:   	ld	[%i0 + %i4], %f30
	.word	0x9f414000	! t0_kref+0x2f50:   	mov	%pc, %o7
	.word	0xc807bfe4	! t0_kref+0x2f54:   	ld	[%fp - 0x1c], %g4
	.word	0xb6102014	! t0_kref+0x2f58:   	mov	0x14, %i3
	.word	0xebe6501c	! t0_kref+0x2f5c:   	casa	[%i1]0x80, %i4, %l5
	.word	0x28800001	! t0_kref+0x2f60:   	bleu,a	_kref+0x2f64
	.word	0xf4270019	! t0_kref+0x2f64:   	st	%i2, [%i4 + %i1]
	.word	0x878020f0	! t0_kref+0x2f68:   	mov	0xf0, %asi
	.word	0xa83e8014	! t0_kref+0x2f6c:   	xnor	%i2, %l4, %l4
	.word	0xa9b4ca3f	! t0_kref+0x2f70:   	fpadd16s	%f19, %f31, %f20
	.word	0x8143c000	! t0_kref+0x2f74:   	stbar
	.word	0xb5b7ca2e	! t0_kref+0x2f78:   	fpadd16s	%f31, %f14, %f26
	.word	0xbda01936	! t0_kref+0x2f7c:   	fstod	%f22, %f30
	.word	0xa7b007bc	! t0_kref+0x2f80:   	fpackfix	%f28, %f19
	.word	0x81858000	! t0_kref+0x2f84:   	wr	%l6, %g0, %y
	.word	0x907d4017	! t0_kref+0x2f88:   	sdiv	%l5, %l7, %o0
	call	SYM(t0_subr3)
	.word	0xaa9c800d	! t0_kref+0x2f90:   	xorcc	%l2, %o5, %l5
	.word	0x9fa01a3d	! t0_kref+0x2f94:   	fstoi	%f29, %f15
	.word	0x9de3bfa0	! t0_kref+0x2f98:   	save	%sp, -0x60, %sp
	.word	0xa9ee21be	! t0_kref+0x2f9c:   	restore	%i0, 0x1be, %l4
	call	SYM(t0_subr0)
	.word	0x81ddc013	! t0_kref+0x2fa4:   	flush	%l7 + %l3
	.word	0xe016c018	! t0_kref+0x2fa8:   	lduh	[%i3 + %i0], %l0
	.word	0x86102002	! t0_kref+0x2fac:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x2fb0:   	bne,a	_kref+0x2fb0
	.word	0x86a0e001	! t0_kref+0x2fb4:   	subcc	%g3, 1, %g3
	.word	0x947c001a	! t0_kref+0x2fb8:   	sdiv	%l0, %i2, %o2
	.word	0xa7b28280	! t0_kref+0x2fbc:   	array32	%o2, %g0, %l3
	.word	0x35800004	! t0_kref+0x2fc0:   	fbue,a	_kref+0x2fd0
	.word	0xe6262018	! t0_kref+0x2fc4:   	st	%l3, [%i0 + 0x18]
	.word	0xa41cb0dc	! t0_kref+0x2fc8:   	xor	%l2, -0xf24, %l2
	.word	0xdd063ff0	! t0_kref+0x2fcc:   	ld	[%i0 - 0x10], %f14
	.word	0x9da0013f	! t0_kref+0x2fd0:   	fabss	%f31, %f14
	.word	0x94f54010	! t0_kref+0x2fd4:   	udivcc	%l5, %l0, %o2
	.word	0xee0e6006	! t0_kref+0x2fd8:   	ldub	[%i1 + 6], %l7
	.word	0x8143e040	! t0_kref+0x2fdc:   	membar	0x40
	.word	0xe0680018	! t0_kref+0x2fe0:   	ldstub	[%g0 + %i0], %l0
	.word	0x81800000	! t0_kref+0x2fe4:   	mov	%g0, %y
	.word	0xb9a00550	! t0_kref+0x2fe8:   	fsqrtd	%f16, %f28
	.word	0x933d4014	! t0_kref+0x2fec:   	sra	%l5, %l4, %o1
	.word	0xe630a000	! t0_kref+0x2ff0:   	sth	%l3, [%g2]
	.word	0xaa5f23dd	! t0_kref+0x2ff4:   	smul	%i4, 0x3dd, %l5
	.word	0xda36201a	! t0_kref+0x2ff8:   	sth	%o5, [%i0 + 0x1a]
	.word	0x927c001c	! t0_kref+0x2ffc:   	sdiv	%l0, %i4, %o1
	.word	0x92dde702	! t0_kref+0x3000:   	smulcc	%l7, 0x702, %o1
	.word	0x922ec015	! t0_kref+0x3004:   	andn	%i3, %l5, %o1
	.word	0x81834000	! t0_kref+0x3008:   	wr	%o5, %g0, %y
	.word	0xd0164000	! t0_kref+0x300c:   	lduh	[%i1], %o0
	.word	0xa4d00011	! t0_kref+0x3010:   	umulcc	%g0, %l1, %l2
	.word	0x3d480007	! t0_kref+0x3014:   	fbule,a,pt	%fcc0, _kref+0x3030
	.word	0xa8d37b11	! t0_kref+0x3018:   	umulcc	%o5, -0x4ef, %l4
	.word	0xa3400000	! t0_kref+0x301c:   	mov	%y, %l1
	.word	0xe9be1a1d	! t0_kref+0x3020:   	stda	%f20, [%i0 + %i5]0xd0
	.word	0xa5b30169	! t0_kref+0x3024:   	edge32ln	%o4, %o1, %l2
	.word	0xa80dc009	! t0_kref+0x3028:   	and	%l7, %o1, %l4
	.word	0xacda0012	! t0_kref+0x302c:   	smulcc	%o0, %l2, %l6
	.word	0xe8360000	! t0_kref+0x3030:   	sth	%l4, [%i0]
	.word	0x34480002	! t0_kref+0x3034:   	bg,a,pt	%icc, _kref+0x303c
	.word	0xad3b6001	! t0_kref+0x3038:   	sra	%o5, 0x1, %l6
	.word	0xc5ee5017	! t0_kref+0x303c:   	prefetcha	%i1 + %l7, 2
	.word	0xe8100018	! t0_kref+0x3040:   	lduh	[%g0 + %i0], %l4
	.word	0xac1b0017	! t0_kref+0x3044:   	xor	%o4, %l7, %l6
	.word	0xb9a01910	! t0_kref+0x3048:   	fitod	%f16, %f28
	.word	0xeb68a082	! t0_kref+0x304c:   	prefetch	%g2 + 0x82, 21
	.word	0x9367a716	! t0_kref+0x3050:   	movpos	%icc, -0xea, %o1
	.word	0x35480005	! t0_kref+0x3054:   	fbue,a,pt	%fcc0, _kref+0x3068
	.word	0xe5063ff4	! t0_kref+0x3058:   	ld	[%i0 - 0xc], %f18
	.word	0xf6267fe4	! t0_kref+0x305c:   	st	%i3, [%i1 - 0x1c]
	.word	0xa4030010	! t0_kref+0x3060:   	add	%o4, %l0, %l2
	.word	0xa7400000	! t0_kref+0x3064:   	mov	%y, %l3
	.word	0xa1a60d39	! t0_kref+0x3068:   	fsmuld	%f24, %f25, %f16
	.word	0xa1a0193e	! t0_kref+0x306c:   	fstod	%f30, %f16
	.word	0xa1b5404a	! t0_kref+0x3070:   	edge8l	%l5, %o2, %l0
	.word	0x81ab0a54	! t0_kref+0x3074:   	fcmpd	%fcc0, %f12, %f20
	.word	0x9da74835	! t0_kref+0x3078:   	fadds	%f29, %f21, %f14
	.word	0x2a480006	! t0_kref+0x307c:   	bcs,a,pt	%icc, _kref+0x3094
	.word	0x920c000c	! t0_kref+0x3080:   	and	%l0, %o4, %o1
	.word	0xd82e3fe0	! t0_kref+0x3084:   	stb	%o4, [%i0 - 0x20]
	.word	0xa89b2264	! t0_kref+0x3088:   	xorcc	%o4, 0x264, %l4
	.word	0x9da0190f	! t0_kref+0x308c:   	fitod	%f15, %f14
	.word	0xeb067ff4	! t0_kref+0x3090:   	ld	[%i1 - 0xc], %f21
	call	SYM(t0_subr2)
	.word	0xb1a0103d	! t0_kref+0x3098:   	fstox	%f29, %f24
	.word	0x91b34133	! t0_kref+0x309c:   	edge32n	%o5, %l3, %o0
	.word	0xa2020000	! t0_kref+0x30a0:   	add	%o0, %g0, %l1
	.word	0xada01a3d	! t0_kref+0x30a4:   	fstoi	%f29, %f22
	.word	0xa49f0010	! t0_kref+0x30a8:   	xorcc	%i4, %l0, %l2
	.word	0xd226001c	! t0_kref+0x30ac:   	st	%o1, [%i0 + %i4]
	.word	0x8d852179	! t0_kref+0x30b0:   	wr	%l4, 0x179, %fprs
	.word	0xbfa6c834	! t0_kref+0x30b4:   	fadds	%f27, %f20, %f31
	.word	0xea96d018	! t0_kref+0x30b8:   	lduha	[%i3 + %i0]0x80, %l5
	.word	0xa9b54174	! t0_kref+0x30bc:   	edge32ln	%l5, %l4, %l4
	.word	0xa9b5091e	! t0_kref+0x30c0:   	faligndata	%f20, %f30, %f20
	.word	0xaedc401a	! t0_kref+0x30c4:   	smulcc	%l1, %i2, %l7
	.word	0x9014c01c	! t0_kref+0x30c8:   	or	%l3, %i4, %o0
	.word	0xa9b28056	! t0_kref+0x30cc:   	edge8l	%o2, %l6, %l4
	.word	0xfb000018	! t0_kref+0x30d0:   	ld	[%g0 + %i0], %f29
	.word	0xa9b58a0c	! t0_kref+0x30d4:   	fpadd16	%f22, %f12, %f20
	.word	0x3e480006	! t0_kref+0x30d8:   	bvc,a,pt	%icc, _kref+0x30f0
	.word	0x81da0000	! t0_kref+0x30dc:   	flush	%o0
	.word	0x34800001	! t0_kref+0x30e0:   	bg,a	_kref+0x30e4
	.word	0xb1a7cd3f	! t0_kref+0x30e4:   	fsmuld	%f31, %f31, %f24
	.word	0xa65cf79f	! t0_kref+0x30e8:   	smul	%l3, -0x861, %l3
	.word	0xb5a01931	! t0_kref+0x30ec:   	fstod	%f17, %f26
	.word	0x929835aa	! t0_kref+0x30f0:   	xorcc	%g0, -0xa56, %o1
	.word	0x99b48ed0	! t0_kref+0x30f4:   	fornot2	%f18, %f16, %f12
	.word	0x90dd8017	! t0_kref+0x30f8:   	smulcc	%l6, %l7, %o0
	.word	0xb9b58f4c	! t0_kref+0x30fc:   	fornot1	%f22, %f12, %f28
	.word	0x9da00533	! t0_kref+0x3100:   	fsqrts	%f19, %f14
	.word	0xa340c000	! t0_kref+0x3104:   	mov	%asi, %l1
	.word	0xa9a6084e	! t0_kref+0x3108:   	faddd	%f24, %f14, %f20
	.word	0x34480008	! t0_kref+0x310c:   	bg,a,pt	%icc, _kref+0x312c
	.word	0xbfa01a32	! t0_kref+0x3110:   	fstoi	%f18, %f31
	.word	0x81ad8a2d	! t0_kref+0x3114:   	fcmps	%fcc0, %f22, %f13
!	.word	0x34824bb8	! t0_kref+0x3118:   	bg,a	SYM(t0_subr1)
	   	bg,a	SYM(t0_subr1)
	.word	0x9e0062fc	! t0_kref+0x311c:   	add	%g1, 0x2fc, %o7
	.word	0x81da7814	! t0_kref+0x3120:   	flush	%o1 - 0x7ec
	.word	0xea063fec	! t0_kref+0x3124:   	ld	[%i0 - 0x14], %l5
	.word	0xeb060000	! t0_kref+0x3128:   	ld	[%i0], %f21
	.word	0x9da609d8	! t0_kref+0x312c:   	fdivd	%f24, %f24, %f14
	.word	0xd0f75019	! t0_kref+0x3130:   	stxa	%o0, [%i5 + %i1]0x80
	.word	0x37800005	! t0_kref+0x3134:   	fbge,a	_kref+0x3148
	.word	0xa5b60d40	! t0_kref+0x3138:   	fnot1	%f24, %f18
	.word	0xa012c00d	! t0_kref+0x313c:   	or	%o3, %o5, %l0
	.word	0x932ac017	! t0_kref+0x3140:   	sll	%o3, %l7, %o1
	.word	0xa9a4085e	! t0_kref+0x3144:   	faddd	%f16, %f30, %f20
	.word	0xa1a01a2e	! t0_kref+0x3148:   	fstoi	%f14, %f16
	.word	0xad27000c	! t0_kref+0x314c:   	mulscc	%i4, %o4, %l6
	.word	0xaba01a3c	! t0_kref+0x3150:   	fstoi	%f28, %f21
	.word	0xa1b00200	! t0_kref+0x3154:   	array8	%g0, %g0, %l0
	.word	0x37800005	! t0_kref+0x3158:   	fbge,a	_kref+0x316c
	.word	0xa0d0000a	! t0_kref+0x315c:   	umulcc	%g0, %o2, %l0
	.word	0xb9b68996	! t0_kref+0x3160:   	bshuffle	%f26, %f22, %f28
	.word	0xafa0053f	! t0_kref+0x3164:   	fsqrts	%f31, %f23
	.word	0x30480006	! t0_kref+0x3168:   	ba,a,pt	%icc, _kref+0x3180
	.word	0xbda0053a	! t0_kref+0x316c:   	fsqrts	%f26, %f30
	.word	0xe030a032	! t0_kref+0x3170:   	sth	%l0, [%g2 + 0x32]
	.word	0xac0cc009	! t0_kref+0x3174:   	and	%l3, %o1, %l6
	.word	0xc398a040	! t0_kref+0x3178:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xd27e0000	! t0_kref+0x317c:   	swap	[%i0], %o1
	.word	0xa1a78d3c	! t0_kref+0x3180:   	fsmuld	%f30, %f28, %f16
	.word	0xbda0193b	! t0_kref+0x3184:   	fstod	%f27, %f30
	.word	0x33480007	! t0_kref+0x3188:   	fbe,a,pt	%fcc0, _kref+0x31a4
	.word	0xaba00530	! t0_kref+0x318c:   	fsqrts	%f16, %f21
	call	SYM(t0_subr0)
	.word	0xa3a0188f	! t0_kref+0x3194:   	fitos	%f15, %f17
	.word	0xee26401c	! t0_kref+0x3198:   	st	%l7, [%i1 + %i4]
	.word	0x81580000	! t0_kref+0x319c:   	flushw
	.word	0x3d480006	! t0_kref+0x31a0:   	fbule,a,pt	%fcc0, _kref+0x31b8
	.word	0xd82e2010	! t0_kref+0x31a4:   	stb	%o4, [%i0 + 0x10]
	.word	0x20800004	! t0_kref+0x31a8:   	bn,a	_kref+0x31b8
	.word	0x9422c014	! t0_kref+0x31ac:   	sub	%o3, %l4, %o2
	.word	0xaa572a30	! t0_kref+0x31b0:   	umul	%i4, 0xa30, %l5
	.word	0x26800001	! t0_kref+0x31b4:   	bl,a	_kref+0x31b8
	.word	0xa7a01a39	! t0_kref+0x31b8:   	fstoi	%f25, %f19
	.word	0xada748af	! t0_kref+0x31bc:   	fsubs	%f29, %f15, %f22
	.word	0x26480005	! t0_kref+0x31c0:   	bl,a,pt	%icc, _kref+0x31d4
	.word	0xeac81019	! t0_kref+0x31c4:   	ldsba	[%g0 + %i1]0x80, %l5
	.word	0x31480006	! t0_kref+0x31c8:   	fba,a,pt	%fcc0, _kref+0x31e0
	.word	0x947a8014	! t0_kref+0x31cc:   	sdiv	%o2, %l4, %o2
	.word	0xef067fe4	! t0_kref+0x31d0:   	ld	[%i1 - 0x1c], %f23
	.word	0xaa548000	! t0_kref+0x31d4:   	umul	%l2, %g0, %l5
	.word	0x91036e6e	! t0_kref+0x31d8:   	taddcc	%o5, 0xe6e, %o0
	.word	0xa1b58994	! t0_kref+0x31dc:   	bshuffle	%f22, %f20, %f16
	.word	0xaba40834	! t0_kref+0x31e0:   	fadds	%f16, %f20, %f21
	.word	0xaca731c4	! t0_kref+0x31e4:   	subcc	%i4, -0xe3c, %l6
	.word	0xe87e6018	! t0_kref+0x31e8:   	swap	[%i1 + 0x18], %l4
	.word	0x2c800006	! t0_kref+0x31ec:   	bneg,a	_kref+0x3204
	.word	0xff26001c	! t0_kref+0x31f0:   	st	%f31, [%i0 + %i4]
	.word	0x81ab4ab7	! t0_kref+0x31f4:   	fcmpes	%fcc0, %f13, %f23
	.word	0xe506401c	! t0_kref+0x31f8:   	ld	[%i1 + %i4], %f18
	.word	0x9fc00004	! t0_kref+0x31fc:   	call	%g0 + %g4
	.word	0xdb20a008	! t0_kref+0x3200:   	st	%f13, [%g2 + 8]
	.word	0xb9a548af	! t0_kref+0x3204:   	fsubs	%f21, %f15, %f28
	.word	0xada01897	! t0_kref+0x3208:   	fitos	%f23, %f22
	.word	0xe036001b	! t0_kref+0x320c:   	sth	%l0, [%i0 + %i3]
	.word	0xa2a54015	! t0_kref+0x3210:   	subcc	%l5, %l5, %l1
	call	SYM(t0_subr3)
	.word	0xe47e7ff4	! t0_kref+0x3218:   	swap	[%i1 - 0xc], %l2
	.word	0xb9b48adc	! t0_kref+0x321c:   	fpsub32	%f18, %f28, %f28
	.word	0x9fa0053f	! t0_kref+0x3220:   	fsqrts	%f31, %f15
	.word	0xc807bfe8	! t0_kref+0x3224:   	ld	[%fp - 0x18], %g4
	.word	0x34480005	! t0_kref+0x3228:   	bg,a,pt	%icc, _kref+0x323c
	.word	0xa9b48918	! t0_kref+0x322c:   	faligndata	%f18, %f24, %f20
	.word	0x20480001	! t0_kref+0x3230:   	bn,a,pt	%icc, _kref+0x3234
	.word	0xac05b135	! t0_kref+0x3234:   	add	%l6, -0xecb, %l6
	.word	0xf720a014	! t0_kref+0x3238:   	st	%f27, [%g2 + 0x14]
	.word	0x9fa7483f	! t0_kref+0x323c:   	fadds	%f29, %f31, %f15
	.word	0xacd838fe	! t0_kref+0x3240:   	smulcc	%g0, -0x702, %l6
	.word	0x922a2726	! t0_kref+0x3244:   	andn	%o0, 0x726, %o1
	.word	0xb9a00552	! t0_kref+0x3248:   	fsqrtd	%f18, %f28
	.word	0x22480008	! t0_kref+0x324c:   	be,a,pt	%icc, _kref+0x326c
	.word	0xe968a009	! t0_kref+0x3250:   	prefetch	%g2 + 9, 20
	.word	0xb3a6492f	! t0_kref+0x3254:   	fmuls	%f25, %f15, %f25
	.word	0x26480004	! t0_kref+0x3258:   	bl,a,pt	%icc, _kref+0x3268
	.word	0xd01f4019	! t0_kref+0x325c:   	ldd	[%i5 + %i1], %o0
	.word	0x93b68492	! t0_kref+0x3260:   	fcmple32	%f26, %f18, %o1
	.word	0xec380019	! t0_kref+0x3264:   	std	%l6, [%g0 + %i1]
	.word	0xa0f54017	! t0_kref+0x3268:   	udivcc	%l5, %l7, %l0
	.word	0x292e76cb	! t0_kref+0x326c:   	sethi	%hi(0xb9db2c00), %l4
	.word	0xac3cc00b	! t0_kref+0x3270:   	xnor	%l3, %o3, %l6
	.word	0xbdb5899c	! t0_kref+0x3274:   	bshuffle	%f22, %f28, %f30
	.word	0x94d47518	! t0_kref+0x3278:   	umulcc	%l1, -0xae8, %o2
	.word	0xf51e2018	! t0_kref+0x327c:   	ldd	[%i0 + 0x18], %f26
	.word	0x86102001	! t0_kref+0x3280:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3284:   	bne,a	_kref+0x3284
	.word	0x86a0e001	! t0_kref+0x3288:   	subcc	%g3, 1, %g3
	.word	0x81abcabf	! t0_kref+0x328c:   	fcmpes	%fcc0, %f15, %f31
	.word	0x28800006	! t0_kref+0x3290:   	bleu,a	_kref+0x32a8
	.word	0xae5f0013	! t0_kref+0x3294:   	smul	%i4, %l3, %l7
	.word	0xd04e3ffe	! t0_kref+0x3298:   	ldsb	[%i0 - 2], %o0
	.word	0x251ad895	! t0_kref+0x329c:   	sethi	%hi(0x6b625400), %l2
	.word	0xa4bb22f3	! t0_kref+0x32a0:   	xnorcc	%o4, 0x2f3, %l2
	.word	0xa2ac800b	! t0_kref+0x32a4:   	andncc	%l2, %o3, %l1
	.word	0xd07e001c	! t0_kref+0x32a8:   	swap	[%i0 + %i4], %o0
	.word	0x27480007	! t0_kref+0x32ac:   	fbul,a,pt	%fcc0, _kref+0x32c8
	.word	0xa5b44069	! t0_kref+0x32b0:   	edge8ln	%l1, %o1, %l2
	.word	0xf51e4000	! t0_kref+0x32b4:   	ldd	[%i1], %f26
	.word	0xa276800b	! t0_kref+0x32b8:   	udiv	%i2, %o3, %l1
	.word	0xa1a708b2	! t0_kref+0x32bc:   	fsubs	%f28, %f18, %f16
	.word	0xeaf65000	! t0_kref+0x32c0:   	stxa	%l5, [%i1]0x80
	.word	0xaba000be	! t0_kref+0x32c4:   	fnegs	%f30, %f21
	.word	0x85832553	! t0_kref+0x32c8:   	wr	%o4, 0x553, %ccr
	.word	0xaf253b84	! t0_kref+0x32cc:   	mulscc	%l4, -0x47c, %l7
	.word	0x9da54d2f	! t0_kref+0x32d0:   	fsmuld	%f21, %f15, %f14
	.word	0x81adcabd	! t0_kref+0x32d4:   	fcmpes	%fcc0, %f23, %f29
	.word	0xe628a02d	! t0_kref+0x32d8:   	stb	%l3, [%g2 + 0x2d]
	.word	0x3a800001	! t0_kref+0x32dc:   	bcc,a	_kref+0x32e0
	.word	0x233ee1db	! t0_kref+0x32e0:   	sethi	%hi(0xfb876c00), %l1
	.word	0xbdb007b2	! t0_kref+0x32e4:   	fpackfix	%f18, %f30
	.word	0xaad40012	! t0_kref+0x32e8:   	umulcc	%l0, %l2, %l5
	.word	0x81ac8abf	! t0_kref+0x32ec:   	fcmpes	%fcc0, %f18, %f31
	.word	0x30800003	! t0_kref+0x32f0:   	ba,a	_kref+0x32fc
	.word	0x9db587de	! t0_kref+0x32f4:   	pdist	%f22, %f30, %f14
	.word	0xa1b4cef5	! t0_kref+0x32f8:   	fornot2s	%f19, %f21, %f16
	.word	0xa9b58ad0	! t0_kref+0x32fc:   	fpsub32	%f22, %f16, %f20
	.word	0xec3e0000	! t0_kref+0x3300:   	std	%l6, [%i0]
	.word	0xb1a4884c	! t0_kref+0x3304:   	faddd	%f18, %f12, %f24
	.word	0xdf06401c	! t0_kref+0x3308:   	ld	[%i1 + %i4], %f15
	.word	0xb5b64e7f	! t0_kref+0x330c:   	fxnors	%f25, %f31, %f26
	.word	0xc07e001c	! t0_kref+0x3310:   	swap	[%i0 + %i4], %g0
	.word	0xac148009	! t0_kref+0x3314:   	or	%l2, %o1, %l6
	.word	0xa1400000	! t0_kref+0x3318:   	mov	%y, %l0
	.word	0x9db4cef7	! t0_kref+0x331c:   	fornot2s	%f19, %f23, %f14
	.word	0xa5b480cb	! t0_kref+0x3320:   	edge16l	%l2, %o3, %l2
	.word	0xc398a040	! t0_kref+0x3324:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa686f36c	! t0_kref+0x3328:   	addcc	%i3, -0xc94, %l3
	.word	0xa3b48120	! t0_kref+0x332c:   	edge32n	%l2, %g0, %l1
	.word	0xa876c013	! t0_kref+0x3330:   	udiv	%i3, %l3, %l4
	.word	0xd4080018	! t0_kref+0x3334:   	ldub	[%g0 + %i0], %o2
	.word	0xa5a0193a	! t0_kref+0x3338:   	fstod	%f26, %f18
	.word	0x923d3049	! t0_kref+0x333c:   	xnor	%l4, -0xfb7, %o1
	.word	0x81dca7cd	! t0_kref+0x3340:   	flush	%l2 + 0x7cd
	.word	0x85848015	! t0_kref+0x3344:   	wr	%l2, %l5, %ccr
	.word	0xc807bff0	! t0_kref+0x3348:   	ld	[%fp - 0x10], %g4
	.word	0xc020a008	! t0_kref+0x334c:   	clr	[%g2 + 8]
	.word	0x81d80010	! t0_kref+0x3350:   	flush	%g0 + %l0
	.word	0x81af0ab4	! t0_kref+0x3354:   	fcmpes	%fcc0, %f28, %f20
	.word	0xadb009bd	! t0_kref+0x3358:   	fexpand	%f29, %f22
	.word	0xb5a0102f	! t0_kref+0x335c:   	fstox	%f15, %f26
	.word	0xee4e4000	! t0_kref+0x3360:   	ldsb	[%i1], %l7
	.word	0x2100a71b	! t0_kref+0x3364:   	sethi	%hi(0x29c6c00), %l0
	.word	0xa01c3939	! t0_kref+0x3368:   	xor	%l0, -0x6c7, %l0
	.word	0x38480004	! t0_kref+0x336c:   	bgu,a,pt	%icc, _kref+0x337c
	.word	0xa52a2018	! t0_kref+0x3370:   	sll	%o0, 0x18, %l2
	.word	0xaa04e62a	! t0_kref+0x3374:   	add	%l3, 0x62a, %l5
	.word	0xa2873420	! t0_kref+0x3378:   	addcc	%i4, -0xbe0, %l1
	.word	0xb9b68f58	! t0_kref+0x337c:   	fornot1	%f26, %f24, %f28
	.word	0xa2748009	! t0_kref+0x3380:   	udiv	%l2, %o1, %l1
	.word	0x37480005	! t0_kref+0x3384:   	fbge,a,pt	%fcc0, _kref+0x3398
	.word	0xf306401c	! t0_kref+0x3388:   	ld	[%i1 + %i4], %f25
	.word	0xbda0013a	! t0_kref+0x338c:   	fabss	%f26, %f30
	.word	0xaa77001a	! t0_kref+0x3390:   	udiv	%i4, %i2, %l5
	.word	0xb9a448b9	! t0_kref+0x3394:   	fsubs	%f17, %f25, %f28
	.word	0xe030a02c	! t0_kref+0x3398:   	sth	%l0, [%g2 + 0x2c]
	.word	0xba103ff0	! t0_kref+0x339c:   	mov	0xfffffff0, %i5
	.word	0xae1de06b	! t0_kref+0x33a0:   	xor	%l7, 0x6b, %l7
	.word	0xa5a00556	! t0_kref+0x33a4:   	fsqrtd	%f22, %f18
	.word	0x9ba01a3e	! t0_kref+0x33a8:   	fstoi	%f30, %f13
	.word	0x94db0017	! t0_kref+0x33ac:   	smulcc	%o4, %l7, %o2
	.word	0x81dc8014	! t0_kref+0x33b0:   	flush	%l2 + %l4
	.word	0x2e480005	! t0_kref+0x33b4:   	bvs,a,pt	%icc, _kref+0x33c8
	.word	0xae0eb70a	! t0_kref+0x33b8:   	and	%i2, -0x8f6, %l7
	.word	0xa09ac000	! t0_kref+0x33bc:   	xorcc	%o3, %g0, %l0
	.word	0x81dac017	! t0_kref+0x33c0:   	flush	%o3 + %l7
	.word	0x2d800007	! t0_kref+0x33c4:   	fbg,a	_kref+0x33e0
	.word	0xb9a7cd39	! t0_kref+0x33c8:   	fsmuld	%f31, %f25, %f28
	.word	0x9da000b7	! t0_kref+0x33cc:   	fnegs	%f23, %f14
	.word	0xb9b5890e	! t0_kref+0x33d0:   	faligndata	%f22, %f14, %f28
	.word	0xf62e8019	! t0_kref+0x33d4:   	stb	%i3, [%i2 + %i1]
	.word	0x81afca36	! t0_kref+0x33d8:   	fcmps	%fcc0, %f31, %f22
	.word	0xd420a024	! t0_kref+0x33dc:   	st	%o2, [%g2 + 0x24]
	.word	0xb6103fe4	! t0_kref+0x33e0:   	mov	0xffffffe4, %i3
	.word	0x93b5c320	! t0_kref+0x33e4:   	bmask	%l7, %g0, %o1
	.word	0xada30854	! t0_kref+0x33e8:   	faddd	%f12, %f20, %f22
	.word	0xa48b2483	! t0_kref+0x33ec:   	andcc	%o4, 0x483, %l2
	.word	0xf6280018	! t0_kref+0x33f0:   	stb	%i3, [%g0 + %i0]
	.word	0xbda0111a	! t0_kref+0x33f4:   	fxtod	%f26, %f30
	call	SYM(t0_subr3)
	.word	0xc0263ff4	! t0_kref+0x33fc:   	clr	[%i0 - 0xc]
	.word	0x953b2019	! t0_kref+0x3400:   	sra	%o4, 0x19, %o2
	.word	0xfd9e101d	! t0_kref+0x3404:   	ldda	[%i0 + %i5]0x80, %f30
	.word	0xa762800d	! t0_kref+0x3408:   	movue	%fcc0, %o5, %l3
	.word	0x9da01935	! t0_kref+0x340c:   	fstod	%f21, %f14
	.word	0xd02e3fe8	! t0_kref+0x3410:   	stb	%o0, [%i0 - 0x18]
	.word	0xafa00533	! t0_kref+0x3414:   	fsqrts	%f19, %f23
	.word	0xb5a01916	! t0_kref+0x3418:   	fitod	%f22, %f26
	.word	0x93b7048e	! t0_kref+0x341c:   	fcmple32	%f28, %f14, %o1
	.word	0xd46e3ffb	! t0_kref+0x3420:   	ldstub	[%i0 - 5], %o2
	.word	0xa8528011	! t0_kref+0x3424:   	umul	%o2, %l1, %l4
	.word	0xfbee501c	! t0_kref+0x3428:   	prefetcha	%i1 + %i4, 29
	.word	0xacf2c008	! t0_kref+0x342c:   	udivcc	%o3, %o0, %l6
	.word	0xf7070019	! t0_kref+0x3430:   	ld	[%i4 + %i1], %f27
	.word	0xa3b5cef8	! t0_kref+0x3434:   	fornot2s	%f23, %f24, %f17
	.word	0xac0a7b55	! t0_kref+0x3438:   	and	%o1, -0x4ab, %l6
	.word	0xfbee501b	! t0_kref+0x343c:   	prefetcha	%i1 + %i3, 29
	.word	0x9075ab72	! t0_kref+0x3440:   	udiv	%l6, 0xb72, %o0
	.word	0xacdc3322	! t0_kref+0x3444:   	smulcc	%l0, -0xcde, %l6
	.word	0xe06e7ff6	! t0_kref+0x3448:   	ldstub	[%i1 - 0xa], %l0
	.word	0xe9be589c	! t0_kref+0x344c:   	stda	%f20, [%i1 + %i4]0xc4
	.word	0xd24e201d	! t0_kref+0x3450:   	ldsb	[%i0 + 0x1d], %o1
	.word	0xa0857131	! t0_kref+0x3454:   	addcc	%l5, -0xecf, %l0
	.word	0xc6270000	! t0_kref+0x3458:   	st	%g3, [%i4]
	.word	0x8143c000	! t0_kref+0x345c:   	stbar
	.word	0x8184c000	! t0_kref+0x3460:   	wr	%l3, %g0, %y
	.word	0xc398a040	! t0_kref+0x3464:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xd46e2018	! t0_kref+0x3468:   	ldstub	[%i0 + 0x18], %o2
	.word	0xaa9afa70	! t0_kref+0x346c:   	xorcc	%o3, -0x590, %l5
	.word	0x941cc01a	! t0_kref+0x3470:   	xor	%l3, %i2, %o2
	.word	0xaba01a56	! t0_kref+0x3474:   	fdtoi	%f22, %f21
	.word	0xaca732a4	! t0_kref+0x3478:   	subcc	%i4, -0xd5c, %l6
	.word	0xc398a040	! t0_kref+0x347c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x81ad4a36	! t0_kref+0x3480:   	fcmps	%fcc0, %f21, %f22
	.word	0x9de3bfa0	! t0_kref+0x3484:   	save	%sp, -0x60, %sp
	.word	0xb80ec01b	! t0_kref+0x3488:   	and	%i3, %i3, %i4
	.word	0xabef7739	! t0_kref+0x348c:   	restore	%i5, -0x8c7, %l5
	.word	0xae56f69b	! t0_kref+0x3490:   	umul	%i3, -0x965, %l7
	.word	0x9fb58df4	! t0_kref+0x3494:   	fnands	%f22, %f20, %f15
	.word	0xe320a00c	! t0_kref+0x3498:   	st	%f17, [%g2 + 0xc]
	.word	0x9fc00004	! t0_kref+0x349c:   	call	%g0 + %g4
	.word	0xacd2000a	! t0_kref+0x34a0:   	umulcc	%o0, %o2, %l6
	.word	0xa52b4000	! t0_kref+0x34a4:   	sll	%o5, %g0, %l2
	.word	0x9203400d	! t0_kref+0x34a8:   	add	%o5, %o5, %o1
	.word	0x8143e040	! t0_kref+0x34ac:   	membar	0x40
	call	SYM(t0_subr1)
	.word	0x9ba01899	! t0_kref+0x34b4:   	fitos	%f25, %f13
	.word	0x30480001	! t0_kref+0x34b8:   	ba,a,pt	%icc, _kref+0x34bc
	.word	0xa50d001a	! t0_kref+0x34bc:   	tsubcc	%l4, %i2, %l2
	.word	0xa202c014	! t0_kref+0x34c0:   	add	%o3, %l4, %l1
	.word	0x9da01a5a	! t0_kref+0x34c4:   	fdtoi	%f26, %f14
	.word	0xa42a2fc3	! t0_kref+0x34c8:   	andn	%o0, 0xfc3, %l2
	.word	0xef68a00a	! t0_kref+0x34cc:   	prefetch	%g2 + 0xa, 23
	.word	0xa80c6df9	! t0_kref+0x34d0:   	and	%l1, 0xdf9, %l4
	.word	0xbdb009ad	! t0_kref+0x34d4:   	fexpand	%f13, %f30
	.word	0xd0162004	! t0_kref+0x34d8:   	lduh	[%i0 + 4], %o0
	.word	0xb1a50d2f	! t0_kref+0x34dc:   	fsmuld	%f20, %f15, %f24
	.word	0xd9be5848	! t0_kref+0x34e0:   	stda	%f12, [%i1 + %o0]0xc2
	.word	0xd20e7fe2	! t0_kref+0x34e4:   	ldub	[%i1 - 0x1e], %o1
	.word	0x81d973ce	! t0_kref+0x34e8:   	flush	%g5 - 0xc32
	.word	0xb5a00135	! t0_kref+0x34ec:   	fabss	%f21, %f26
	.word	0xda360000	! t0_kref+0x34f0:   	sth	%o5, [%i0]
	.word	0xa8f23d42	! t0_kref+0x34f4:   	udivcc	%o0, -0x2be, %l4
	.word	0xada6085c	! t0_kref+0x34f8:   	faddd	%f24, %f28, %f22
	.word	0x86102015	! t0_kref+0x34fc:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x3500:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x3504:   	be,a	_kref+0x3510
	.word	0xa27dc008	! t0_kref+0x3508:   	sdiv	%l7, %o0, %l1
	.word	0xf1be588b	! t0_kref+0x350c:   	stda	%f24, [%i1 + %o3]0xc4
	.word	0xbba00138	! t0_kref+0x3510:   	fabss	%f24, %f29
	.word	0xe8c01018	! t0_kref+0x3514:   	ldswa	[%g0 + %i0]0x80, %l4
	.word	0x81af0ab0	! t0_kref+0x3518:   	fcmpes	%fcc0, %f28, %f16
	.word	0xb9a01938	! t0_kref+0x351c:   	fstod	%f24, %f28
	.word	0xe828a031	! t0_kref+0x3520:   	stb	%l4, [%g2 + 0x31]
	.word	0x9fc00004	! t0_kref+0x3524:   	call	%g0 + %g4
	.word	0x90aac01c	! t0_kref+0x3528:   	andncc	%o3, %i4, %o0
	.word	0xa5a38952	! t0_kref+0x352c:   	fmuld	%f14, %f18, %f18
	.word	0xa8fa000d	! t0_kref+0x3530:   	sdivcc	%o0, %o5, %l4
	.word	0xbda018d6	! t0_kref+0x3534:   	fdtos	%f22, %f30
	.word	0x81580000	! t0_kref+0x3538:   	flushw
	.word	0xbda01a4c	! t0_kref+0x353c:   	fdtoi	%f12, %f30
	call	SYM(t0_subr0)
	.word	0xf96e401c	! t0_kref+0x3544:   	prefetch	%i1 + %i4, 28
	.word	0x81ac0ab8	! t0_kref+0x3548:   	fcmpes	%fcc0, %f16, %f24
	.word	0xab25c00b	! t0_kref+0x354c:   	mulscc	%l7, %o3, %l5
	.word	0x81ad4a34	! t0_kref+0x3550:   	fcmps	%fcc0, %f21, %f20
	.word	0x94747499	! t0_kref+0x3554:   	udiv	%l1, -0xb67, %o2
	.word	0xb3a00535	! t0_kref+0x3558:   	fsqrts	%f21, %f25
	.word	0x3f800001	! t0_kref+0x355c:   	fbo,a	_kref+0x3560
	.word	0x81b01024	! t0_kref+0x3560:   	siam	0x4
	.word	0x21800005	! t0_kref+0x3564:   	fbn,a	_kref+0x3578
	.word	0x81df001c	! t0_kref+0x3568:   	flush	%i4 + %i4
	.word	0xf53e2018	! t0_kref+0x356c:   	std	%f26, [%i0 + 0x18]
	.word	0xac340009	! t0_kref+0x3570:   	orn	%l0, %o1, %l6
	.word	0xe5180018	! t0_kref+0x3574:   	ldd	[%g0 + %i0], %f18
	.word	0x9de3bfa0	! t0_kref+0x3578:   	save	%sp, -0x60, %sp
	.word	0x91ef6e23	! t0_kref+0x357c:   	restore	%i5, 0xe23, %o0
	.word	0xa1a0055e	! t0_kref+0x3580:   	fsqrtd	%f30, %f16
	.word	0x9fc10000	! t0_kref+0x3584:   	call	%g4
	.word	0xec26401c	! t0_kref+0x3588:   	st	%l6, [%i1 + %i4]
	.word	0xa6e4c00b	! t0_kref+0x358c:   	subccc	%l3, %o3, %l3
	.word	0xe87e3ff0	! t0_kref+0x3590:   	swap	[%i0 - 0x10], %l4
	.word	0xe9064000	! t0_kref+0x3594:   	ld	[%i1], %f20
	.word	0xa4fdb5a3	! t0_kref+0x3598:   	sdivcc	%l6, -0xa5d, %l2
	.word	0xf5270019	! t0_kref+0x359c:   	st	%f26, [%i4 + %i1]
	.word	0xa40d7507	! t0_kref+0x35a0:   	and	%l5, -0xaf9, %l2
	.word	0xa5a00137	! t0_kref+0x35a4:   	fabss	%f23, %f18
	.word	0xe7270018	! t0_kref+0x35a8:   	st	%f19, [%i4 + %i0]
	.word	0xe7067fe0	! t0_kref+0x35ac:   	ld	[%i1 - 0x20], %f19
	.word	0xfd1e7fe0	! t0_kref+0x35b0:   	ldd	[%i1 - 0x20], %f30
	.word	0x9da0054c	! t0_kref+0x35b4:   	fsqrtd	%f12, %f14
	.word	0x2f800008	! t0_kref+0x35b8:   	fbu,a	_kref+0x35d8
	.word	0xe20e0000	! t0_kref+0x35bc:   	ldub	[%i0], %l1
	.word	0x1309e50e	! t0_kref+0x35c0:   	sethi	%hi(0x27943800), %o1
	.word	0x90a6a893	! t0_kref+0x35c4:   	subcc	%i2, 0x893, %o0
	.word	0x81afca31	! t0_kref+0x35c8:   	fcmps	%fcc0, %f31, %f17
	.word	0xd0480019	! t0_kref+0x35cc:   	ldsb	[%g0 + %i1], %o0
	.word	0x3a480008	! t0_kref+0x35d0:   	bcc,a,pt	%icc, _kref+0x35f0
	.word	0xa2557dec	! t0_kref+0x35d4:   	umul	%l5, -0x214, %l1
	.word	0xa5a01890	! t0_kref+0x35d8:   	fitos	%f16, %f18
	.word	0xa6aab5d2	! t0_kref+0x35dc:   	andncc	%o2, -0xa2e, %l3
	.word	0x9da00556	! t0_kref+0x35e0:   	fsqrtd	%f22, %f14
	.word	0xbfb00cfe	! t0_kref+0x35e4:   	fnot2s	%f30, %f31
	.word	0x30480006	! t0_kref+0x35e8:   	ba,a,pt	%icc, _kref+0x3600
	.word	0xb5a588b5	! t0_kref+0x35ec:   	fsubs	%f22, %f21, %f26
	.word	0xada708b6	! t0_kref+0x35f0:   	fsubs	%f28, %f22, %f22
	.word	0xe4270019	! t0_kref+0x35f4:   	st	%l2, [%i4 + %i1]
	.word	0xa2f3400b	! t0_kref+0x35f8:   	udivcc	%o5, %o3, %l1
	.word	0xeb68a040	! t0_kref+0x35fc:   	prefetch	%g2 + 0x40, 21
	.word	0xb1a01910	! t0_kref+0x3600:   	fitod	%f16, %f24
	.word	0xa7b00017	! t0_kref+0x3604:   	edge8	%g0, %l7, %l3
	.word	0xa5a4cd38	! t0_kref+0x3608:   	fsmuld	%f19, %f24, %f18
	.word	0xae76b6e6	! t0_kref+0x360c:   	udiv	%i2, -0x91a, %l7
	.word	0x95400000	! t0_kref+0x3610:   	mov	%y, %o2
	.word	0xae87000b	! t0_kref+0x3614:   	addcc	%i4, %o3, %l7
	.word	0xeb6e7ff0	! t0_kref+0x3618:   	prefetch	%i1 - 0x10, 21
	.word	0xaf234011	! t0_kref+0x361c:   	mulscc	%o5, %l1, %l7
	.word	0xa2840017	! t0_kref+0x3620:   	addcc	%l0, %l7, %l1
	.word	0xe2066004	! t0_kref+0x3624:   	ld	[%i1 + 4], %l1
	.word	0xa69de6fc	! t0_kref+0x3628:   	xorcc	%l7, 0x6fc, %l3
	.word	0x81580000	! t0_kref+0x362c:   	flushw
	.word	0x9ba0189b	! t0_kref+0x3630:   	fitos	%f27, %f13
	.word	0xd2280019	! t0_kref+0x3634:   	stb	%o1, [%g0 + %i1]
	.word	0xa2dc801a	! t0_kref+0x3638:   	smulcc	%l2, %i2, %l1
	.word	0xb9a0054e	! t0_kref+0x363c:   	fsqrtd	%f14, %f28
	.word	0x9db5ca33	! t0_kref+0x3640:   	fpadd16s	%f23, %f19, %f14
	.word	0xa5b40c58	! t0_kref+0x3644:   	fnor	%f16, %f24, %f18
	.word	0xaa06ac00	! t0_kref+0x3648:   	add	%i2, 0xc00, %l5
	.word	0xae12f0ab	! t0_kref+0x364c:   	or	%o3, -0xf55, %l7
	.word	0x21800001	! t0_kref+0x3650:   	fbn,a	_kref+0x3654
	.word	0xc56e4012	! t0_kref+0x3654:   	prefetch	%i1 + %l2, 2
	.word	0xa29d8011	! t0_kref+0x3658:   	xorcc	%l6, %l1, %l1
	.word	0x8186c000	! t0_kref+0x365c:   	wr	%i3, %g0, %y
	.word	0xbba01895	! t0_kref+0x3660:   	fitos	%f21, %f29
	.word	0x81ab8aad	! t0_kref+0x3664:   	fcmpes	%fcc0, %f14, %f13
	.word	0xa0d833c8	! t0_kref+0x3668:   	smulcc	%g0, -0xc38, %l0
	.word	0x21480004	! t0_kref+0x366c:   	fbn,a,pt	%fcc0, _kref+0x367c
	.word	0xbfb5cf79	! t0_kref+0x3670:   	fornot1s	%f23, %f25, %f31
	.word	0xa5a0188f	! t0_kref+0x3674:   	fitos	%f15, %f18
	.word	0xef68a00a	! t0_kref+0x3678:   	prefetch	%g2 + 0xa, 23
	.word	0x9ba00532	! t0_kref+0x367c:   	fsqrts	%f18, %f13
	.word	0x81ab4a2f	! t0_kref+0x3680:   	fcmps	%fcc0, %f13, %f15
	.word	0xb7a688be	! t0_kref+0x3684:   	fsubs	%f26, %f30, %f27
	.word	0xc398a080	! t0_kref+0x3688:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0x2c800008	! t0_kref+0x368c:   	bneg,a	_kref+0x36ac
	.word	0xaba01895	! t0_kref+0x3690:   	fitos	%f21, %f21
	.word	0xe06e001a	! t0_kref+0x3694:   	ldstub	[%i0 + %i2], %l0
	.word	0xa3226809	! t0_kref+0x3698:   	mulscc	%o1, 0x809, %l1
	.word	0x8184c000	! t0_kref+0x369c:   	wr	%l3, %g0, %y
	.word	0x95b00280	! t0_kref+0x36a0:   	array32	%g0, %g0, %o2
	.word	0xa9b78994	! t0_kref+0x36a4:   	bshuffle	%f30, %f20, %f20
	.word	0xf51f4018	! t0_kref+0x36a8:   	ldd	[%i5 + %i0], %f26
	.word	0xbbb5ca2e	! t0_kref+0x36ac:   	fpadd16s	%f23, %f14, %f29
	.word	0x91400000	! t0_kref+0x36b0:   	mov	%y, %o0
	.word	0xaf056502	! t0_kref+0x36b4:   	taddcc	%l5, 0x502, %l7
	.word	0x81ac0ad8	! t0_kref+0x36b8:   	fcmped	%fcc0, %f16, %f24
	.word	0xaf240015	! t0_kref+0x36bc:   	mulscc	%l0, %l5, %l7
	.word	0xf43e6000	! t0_kref+0x36c0:   	std	%i2, [%i1]
	.word	0xac9a4015	! t0_kref+0x36c4:   	xorcc	%o1, %l5, %l6
	.word	0x9de3bfa0	! t0_kref+0x36c8:   	save	%sp, -0x60, %sp
	.word	0xba0e001a	! t0_kref+0x36cc:   	and	%i0, %i2, %i5
	.word	0x95eef5fe	! t0_kref+0x36d0:   	restore	%i3, -0xa02, %o2
	.word	0x9456a61d	! t0_kref+0x36d4:   	umul	%i2, 0x61d, %o2
	.word	0xe7063fec	! t0_kref+0x36d8:   	ld	[%i0 - 0x14], %f19
	.word	0x9050001c	! t0_kref+0x36dc:   	umul	%g0, %i4, %o0
	.word	0xa5a50d31	! t0_kref+0x36e0:   	fsmuld	%f20, %f17, %f18
	.word	0xbfb58f78	! t0_kref+0x36e4:   	fornot1s	%f22, %f24, %f31
	.word	0xe906600c	! t0_kref+0x36e8:   	ld	[%i1 + 0xc], %f20
	.word	0xe91fbf98	! t0_kref+0x36ec:   	ldd	[%fp - 0x68], %f20
	.word	0xaba01a38	! t0_kref+0x36f0:   	fstoi	%f24, %f21
	.word	0x37800008	! t0_kref+0x36f4:   	fbge,a	_kref+0x3714
	.word	0x81834000	! t0_kref+0x36f8:   	wr	%o5, %g0, %y
	.word	0xa4557097	! t0_kref+0x36fc:   	umul	%l5, -0xf69, %l2
	.word	0xb1a78952	! t0_kref+0x3700:   	fmuld	%f30, %f18, %f24
	.word	0xafb5cf72	! t0_kref+0x3704:   	fornot1s	%f23, %f18, %f23
	.word	0xa9a648ad	! t0_kref+0x3708:   	fsubs	%f25, %f13, %f20
	.word	0xa6d2c00a	! t0_kref+0x370c:   	umulcc	%o3, %o2, %l3
	.word	0xa5b38edc	! t0_kref+0x3710:   	fornot2	%f14, %f28, %f18
	.word	0xacf44014	! t0_kref+0x3714:   	udivcc	%l1, %l4, %l6
	.word	0xa0173bf5	! t0_kref+0x3718:   	or	%i4, -0x40b, %l0
	.word	0xd3e61012	! t0_kref+0x371c:   	casa	[%i0]0x80, %l2, %o1
	.word	0xbda38d35	! t0_kref+0x3720:   	fsmuld	%f14, %f21, %f30
	.word	0x8143e040	! t0_kref+0x3724:   	membar	0x40
	.word	0x22480004	! t0_kref+0x3728:   	be,a,pt	%icc, _kref+0x3738
	.word	0xe00e6017	! t0_kref+0x372c:   	ldub	[%i1 + 0x17], %l0
	.word	0xfb86501c	! t0_kref+0x3730:   	lda	[%i1 + %i4]0x80, %f29
	.word	0xbdb38d9e	! t0_kref+0x3734:   	fxor	%f14, %f30, %f30
	.word	0xa407000a	! t0_kref+0x3738:   	add	%i4, %o2, %l2
	.word	0xb7a0189d	! t0_kref+0x373c:   	fitos	%f29, %f27
	.word	0x923af855	! t0_kref+0x3740:   	xnor	%o3, -0x7ab, %o1
	.word	0xf1ee501a	! t0_kref+0x3744:   	prefetcha	%i1 + %i2, 24
	.word	0x81580000	! t0_kref+0x3748:   	flushw
	.word	0x2f31d0bb	! t0_kref+0x374c:   	sethi	%hi(0xc742ec00), %l7
	.word	0xe0881019	! t0_kref+0x3750:   	lduba	[%g0 + %i1]0x80, %l0
	.word	0x81ae0ab0	! t0_kref+0x3754:   	fcmpes	%fcc0, %f24, %f16
	.word	0xa6883f09	! t0_kref+0x3758:   	andcc	%g0, -0xf7, %l3
	.word	0x95b68040	! t0_kref+0x375c:   	edge8l	%i2, %g0, %o2
	.word	0xae9a7848	! t0_kref+0x3760:   	xorcc	%o1, -0x7b8, %l7
	.word	0x3a480002	! t0_kref+0x3764:   	bcc,a,pt	%icc, _kref+0x376c
	.word	0xafa0052d	! t0_kref+0x3768:   	fsqrts	%f13, %f23
	.word	0x81db0011	! t0_kref+0x376c:   	flush	%o4 + %l1
	.word	0x81af0ade	! t0_kref+0x3770:   	fcmped	%fcc0, %f28, %f30
	.word	0xa9b00f37	! t0_kref+0x3774:   	fsrc2s	%f23, %f20
	.word	0x3b480003	! t0_kref+0x3778:   	fble,a,pt	%fcc0, _kref+0x3784
	.word	0xa2070013	! t0_kref+0x377c:   	add	%i4, %l3, %l1
	.word	0xa6de8009	! t0_kref+0x3780:   	smulcc	%i2, %o1, %l3
	.word	0xc398a040	! t0_kref+0x3784:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x9da0055e	! t0_kref+0x3788:   	fsqrtd	%f30, %f14
	.word	0x99a509d2	! t0_kref+0x378c:   	fdivd	%f20, %f18, %f12
	.word	0xbda0193a	! t0_kref+0x3790:   	fstod	%f26, %f30
	.word	0x81ac0ad6	! t0_kref+0x3794:   	fcmped	%fcc0, %f16, %f22
	.word	0xa09dc008	! t0_kref+0x3798:   	xorcc	%l7, %o0, %l0
	.word	0x9486f840	! t0_kref+0x379c:   	addcc	%i3, -0x7c0, %o2
	.word	0x86102003	! t0_kref+0x37a0:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x37a4:   	bne,a	_kref+0x37a4
	.word	0x86a0e001	! t0_kref+0x37a8:   	subcc	%g3, 1, %g3
	.word	0x001fffff	! t0_kref+0x37ac:   	illtrap	0x1fffff
	.word	0x90a6e544	! t0_kref+0x37b0:   	subcc	%i3, 0x544, %o0
	.word	0xa21830be	! t0_kref+0x37b4:   	xor	%g0, -0xf42, %l1
	call	SYM(t0_subr3)
	.word	0x90d4e661	! t0_kref+0x37bc:   	umulcc	%l3, 0x661, %o0
	.word	0x28800002	! t0_kref+0x37c0:   	bleu,a	_kref+0x37c8
	.word	0xa4832633	! t0_kref+0x37c4:   	addcc	%o4, 0x633, %l2
	.word	0xec3e7ff0	! t0_kref+0x37c8:   	std	%l6, [%i1 - 0x10]
	.word	0x31800001	! t0_kref+0x37cc:   	fba,a	_kref+0x37d0
	.word	0x001fffff	! t0_kref+0x37d0:   	illtrap	0x1fffff
	.word	0xa672e456	! t0_kref+0x37d4:   	udiv	%o3, 0x456, %l3
	.word	0xa9b00c20	! t0_kref+0x37d8:   	fzeros	%f20
	.word	0x9de3bfa0	! t0_kref+0x37dc:   	save	%sp, -0x60, %sp
	.word	0x91eec019	! t0_kref+0x37e0:   	restore	%i3, %i1, %o0
	.word	0xa0f0000d	! t0_kref+0x37e4:   	udivcc	%g0, %o5, %l0
	.word	0x3f800008	! t0_kref+0x37e8:   	fbo,a	_kref+0x3808
	.word	0xa1400000	! t0_kref+0x37ec:   	mov	%y, %l0
	.word	0xa1a0012f	! t0_kref+0x37f0:   	fabss	%f15, %f16
	.word	0xe02e401a	! t0_kref+0x37f4:   	stb	%l0, [%i1 + %i2]
	.word	0xd03e6008	! t0_kref+0x37f8:   	std	%o0, [%i1 + 8]
	.word	0x94244008	! t0_kref+0x37fc:   	sub	%l1, %o0, %o2
	.word	0xa4e5e4eb	! t0_kref+0x3800:   	subccc	%l7, 0x4eb, %l2
	.word	0xb5a00554	! t0_kref+0x3804:   	fsqrtd	%f20, %f26
	.word	0xd456600a	! t0_kref+0x3808:   	ldsh	[%i1 + 0xa], %o2
	.word	0xe836c019	! t0_kref+0x380c:   	sth	%l4, [%i3 + %i1]
	.word	0xabb5cc76	! t0_kref+0x3810:   	fnors	%f23, %f22, %f21
	.word	0x9de3bfa0	! t0_kref+0x3814:   	save	%sp, -0x60, %sp
	.word	0x91ee0000	! t0_kref+0x3818:   	restore	%i0, %g0, %o0
	.word	0xf19e1a1b	! t0_kref+0x381c:   	ldda	[%i0 + %i3]0xd0, %f24
	.word	0x81abcab0	! t0_kref+0x3820:   	fcmpes	%fcc0, %f15, %f16
	call	SYM(t0_subr3)
	.word	0xe2162008	! t0_kref+0x3828:   	lduh	[%i0 + 8], %l1
	.word	0xd2060000	! t0_kref+0x382c:   	ld	[%i0], %o1
	.word	0xe9e61011	! t0_kref+0x3830:   	casa	[%i0]0x80, %l1, %l4
	.word	0xd8b61000	! t0_kref+0x3834:   	stha	%o4, [%i0]0x80
	.word	0xa1a60956	! t0_kref+0x3838:   	fmuld	%f24, %f22, %f16
	.word	0xbda01913	! t0_kref+0x383c:   	fitod	%f19, %f30
	.word	0x93b54131	! t0_kref+0x3840:   	edge32n	%l5, %l1, %o1
	.word	0xafa00132	! t0_kref+0x3844:   	fabss	%f18, %f23
	.word	0x909a0011	! t0_kref+0x3848:   	xorcc	%o0, %l1, %o0
	.word	0xada50950	! t0_kref+0x384c:   	fmuld	%f20, %f16, %f22
	.word	0xa1b6c280	! t0_kref+0x3850:   	array32	%i3, %g0, %l0
	.word	0xd2062010	! t0_kref+0x3854:   	ld	[%i0 + 0x10], %o1
	.word	0xe216001b	! t0_kref+0x3858:   	lduh	[%i0 + %i3], %l1
	.word	0xff000019	! t0_kref+0x385c:   	ld	[%g0 + %i1], %f31
	.word	0xe226401c	! t0_kref+0x3860:   	st	%l1, [%i1 + %i4]
	.word	0xc768a00d	! t0_kref+0x3864:   	prefetch	%g2 + 0xd, 3
	.word	0x9de3bfa0	! t0_kref+0x3868:   	save	%sp, -0x60, %sp
	.word	0xb83e37cb	! t0_kref+0x386c:   	xnor	%i0, -0x835, %i4
	.word	0xa5ee78db	! t0_kref+0x3870:   	restore	%i1, -0x725, %l2
	.word	0x81ad8a3d	! t0_kref+0x3874:   	fcmps	%fcc0, %f22, %f29
	.word	0xa7b6ca3d	! t0_kref+0x3878:   	fpadd16s	%f27, %f29, %f19
	.word	0xa9b3899c	! t0_kref+0x387c:   	bshuffle	%f14, %f28, %f20
	.word	0xb1a01930	! t0_kref+0x3880:   	fstod	%f16, %f24
	.word	0x81ad0ab2	! t0_kref+0x3884:   	fcmpes	%fcc0, %f20, %f18
	.word	0xa1a00132	! t0_kref+0x3888:   	fabss	%f18, %f16
	.word	0x93408000	! t0_kref+0x388c:   	mov	%ccr, %o1
	.word	0x9fc00004	! t0_kref+0x3890:   	call	%g0 + %g4
	.word	0xb1a0052f	! t0_kref+0x3894:   	fsqrts	%f15, %f24
	.word	0xa5a7cd3d	! t0_kref+0x3898:   	fsmuld	%f31, %f29, %f18
	.word	0xecdf5019	! t0_kref+0x389c:   	ldxa	[%i5 + %i1]0x80, %l6
	.word	0xe84e6018	! t0_kref+0x38a0:   	ldsb	[%i1 + 0x18], %l4
	.word	0xaba01a36	! t0_kref+0x38a4:   	fstoi	%f22, %f21
	.word	0xaf04001b	! t0_kref+0x38a8:   	taddcc	%l0, %i3, %l7
	.word	0x23480002	! t0_kref+0x38ac:   	fbne,a,pt	%fcc0, _kref+0x38b4
	.word	0xa5a6094c	! t0_kref+0x38b0:   	fmuld	%f24, %f12, %f18
	.word	0xe6267ff0	! t0_kref+0x38b4:   	st	%l3, [%i1 - 0x10]
	.word	0x90d2000a	! t0_kref+0x38b8:   	umulcc	%o0, %o2, %o0
	.word	0xe99e5a1b	! t0_kref+0x38bc:   	ldda	[%i1 + %i3]0xd0, %f20
	.word	0xaad27f62	! t0_kref+0x38c0:   	umulcc	%o1, -0x9e, %l5
	.word	0xa5a01a5a	! t0_kref+0x38c4:   	fdtoi	%f26, %f18
	.word	0xa47dc00c	! t0_kref+0x38c8:   	sdiv	%l7, %o4, %l2
	.word	0xabb24148	! t0_kref+0x38cc:   	edge32l	%o1, %o0, %l5
	.word	0xeace1000	! t0_kref+0x38d0:   	ldsba	[%i0]0x80, %l5
	.word	0xac7ac00a	! t0_kref+0x38d4:   	sdiv	%o3, %o2, %l6
	.word	0xf8bf5019	! t0_kref+0x38d8:   	stda	%i4, [%i5 + %i1]0x80
	.word	0x24480003	! t0_kref+0x38dc:   	ble,a,pt	%icc, _kref+0x38e8
	.word	0x81844000	! t0_kref+0x38e0:   	wr	%l1, %g0, %y
	.word	0xadb4c000	! t0_kref+0x38e4:   	edge8	%l3, %g0, %l6
	.word	0xab3ce016	! t0_kref+0x38e8:   	sra	%l3, 0x16, %l5
	.word	0xe896d019	! t0_kref+0x38ec:   	lduha	[%i3 + %i1]0x80, %l4
	.word	0x32480003	! t0_kref+0x38f0:   	bne,a,pt	%icc, _kref+0x38fc
	.word	0x9da00554	! t0_kref+0x38f4:   	fsqrtd	%f20, %f14
	.word	0xb1b38632	! t0_kref+0x38f8:   	fmul8x16	%f14, %f18, %f24
	.word	0x38480003	! t0_kref+0x38fc:   	bgu,a,pt	%icc, _kref+0x3908
	.word	0xb5a00534	! t0_kref+0x3900:   	fsqrts	%f20, %f26
	.word	0x81850000	! t0_kref+0x3904:   	wr	%l4, %g0, %y
	.word	0x8582c010	! t0_kref+0x3908:   	wr	%o3, %l0, %ccr
	.word	0xa52c600b	! t0_kref+0x390c:   	sll	%l1, 0xb, %l2
	.word	0xeb066000	! t0_kref+0x3910:   	ld	[%i1], %f21
	.word	0xaa1d26f9	! t0_kref+0x3914:   	xor	%l4, 0x6f9, %l5
	.word	0xb9a01a2f	! t0_kref+0x3918:   	fstoi	%f15, %f28
	.word	0xb9b38c98	! t0_kref+0x391c:   	fandnot2	%f14, %f24, %f28
	.word	0x39480008	! t0_kref+0x3920:   	fbuge,a,pt	%fcc0, _kref+0x3940
	.word	0x927ec000	! t0_kref+0x3924:   	sdiv	%i3, %g0, %o1
	.word	0xa09c4014	! t0_kref+0x3928:   	xorcc	%l1, %l4, %l0
	.word	0x94fb75ab	! t0_kref+0x392c:   	sdivcc	%o5, -0xa55, %o2
	.word	0xb3b48e7c	! t0_kref+0x3930:   	fxnors	%f18, %f28, %f25
	.word	0xae9d0016	! t0_kref+0x3934:   	xorcc	%l4, %l6, %l7
	.word	0x9fb34df0	! t0_kref+0x3938:   	fnands	%f13, %f16, %f15
	.word	0xa784c015	! t0_kref+0x393c:   	wr	%l3, %l5, %gsr
	.word	0xd5e61012	! t0_kref+0x3940:   	casa	[%i0]0x80, %l2, %o2
	.word	0x9da0111a	! t0_kref+0x3944:   	fxtod	%f26, %f14
	.word	0xa5b60ddc	! t0_kref+0x3948:   	fnand	%f24, %f28, %f18
	.word	0xf5b81018	! t0_kref+0x394c:   	stda	%f26, [%g0 + %i0]0x80
	.word	0xa8d2c013	! t0_kref+0x3950:   	umulcc	%o3, %l3, %l4
	.word	0xa80b2a2a	! t0_kref+0x3954:   	and	%o4, 0xa2a, %l4
	.word	0xf1270019	! t0_kref+0x3958:   	st	%f24, [%i4 + %i1]
	.word	0x81af4ab8	! t0_kref+0x395c:   	fcmpes	%fcc0, %f29, %f24
	.word	0x9ba748b1	! t0_kref+0x3960:   	fsubs	%f29, %f17, %f13
	.word	0x81580000	! t0_kref+0x3964:   	flushw
	.word	0xabb3001b	! t0_kref+0x3968:   	edge8	%o4, %i3, %l5
	.word	0x81da2129	! t0_kref+0x396c:   	flush	%o0 + 0x129
	.word	0xc398a040	! t0_kref+0x3970:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa7b00c20	! t0_kref+0x3974:   	fzeros	%f19
	.word	0xa3b6051a	! t0_kref+0x3978:   	fcmpgt16	%f24, %f26, %l1
	.word	0xa5b74aba	! t0_kref+0x397c:   	fpsub16s	%f29, %f26, %f18
	.word	0x3e800006	! t0_kref+0x3980:   	bvc,a	_kref+0x3998
	.word	0xa7a4c83b	! t0_kref+0x3984:   	fadds	%f19, %f27, %f19
	.word	0xa7272133	! t0_kref+0x3988:   	mulscc	%i4, 0x133, %l3
	.word	0x3b480006	! t0_kref+0x398c:   	fble,a,pt	%fcc0, _kref+0x39a4
	.word	0xa7b7859a	! t0_kref+0x3990:   	fcmpgt32	%f30, %f26, %l3
	.word	0x30480006	! t0_kref+0x3994:   	ba,a,pt	%icc, _kref+0x39ac
	.word	0xa9b5849c	! t0_kref+0x3998:   	fcmple32	%f22, %f28, %l4
	.word	0xc398a040	! t0_kref+0x399c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x8143c000	! t0_kref+0x39a0:   	stbar
	.word	0x920a8015	! t0_kref+0x39a4:   	and	%o2, %l5, %o1
	.word	0xa87f3e23	! t0_kref+0x39a8:   	sdiv	%i4, -0x1dd, %l4
	.word	0x86102002	! t0_kref+0x39ac:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x39b0:   	bne,a	_kref+0x39b0
	.word	0x86a0e001	! t0_kref+0x39b4:   	subcc	%g3, 1, %g3
	.word	0xa5a58831	! t0_kref+0x39b8:   	fadds	%f22, %f17, %f18
	.word	0xfd06601c	! t0_kref+0x39bc:   	ld	[%i1 + 0x1c], %f30
	.word	0xafa0052f	! t0_kref+0x39c0:   	fsqrts	%f15, %f23
	.word	0xf19e5a1b	! t0_kref+0x39c4:   	ldda	[%i1 + %i3]0xd0, %f24
	.word	0xf19eda19	! t0_kref+0x39c8:   	ldda	[%i3 + %i1]0xd0, %f24
	.word	0xc398a040	! t0_kref+0x39cc:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xb5a01934	! t0_kref+0x39d0:   	fstod	%f20, %f26
	call	SYM(t0_subr0)
	.word	0xadb60a10	! t0_kref+0x39d8:   	fpadd16	%f24, %f16, %f22
	.word	0x9de3bfa0	! t0_kref+0x39dc:   	save	%sp, -0x60, %sp
	.word	0xb40ee9d1	! t0_kref+0x39e0:   	and	%i3, 0x9d1, %i2
	.word	0xa7ee8000	! t0_kref+0x39e4:   	restore	%i2, %g0, %l3
	.word	0xd6280018	! t0_kref+0x39e8:   	stb	%o3, [%g0 + %i0]
	.word	0x8143c000	! t0_kref+0x39ec:   	stbar
	.word	0xa474c00b	! t0_kref+0x39f0:   	udiv	%l3, %o3, %l2
	.word	0x9067001a	! t0_kref+0x39f4:   	subc	%i4, %i2, %o0
	.word	0x24480001	! t0_kref+0x39f8:   	ble,a,pt	%icc, _kref+0x39fc
	.word	0x99a48d3e	! t0_kref+0x39fc:   	fsmuld	%f18, %f30, %f12
	.word	0xada688dc	! t0_kref+0x3a00:   	fsubd	%f26, %f28, %f22
	.word	0x9de3bfa0	! t0_kref+0x3a04:   	save	%sp, -0x60, %sp
	.word	0xb266b7a2	! t0_kref+0x3a08:   	subc	%i2, -0x85e, %i1
	.word	0xa7ee0000	! t0_kref+0x3a0c:   	restore	%i0, %g0, %l3
	.word	0xbfb78a37	! t0_kref+0x3a10:   	fpadd16s	%f30, %f23, %f31
	.word	0xac72326d	! t0_kref+0x3a14:   	udiv	%o0, -0xd93, %l6
	.word	0xa29c7ccd	! t0_kref+0x3a18:   	xorcc	%l1, -0x333, %l1
	.word	0xe0780019	! t0_kref+0x3a1c:   	swap	[%g0 + %i1], %l0
	.word	0xc768a002	! t0_kref+0x3a20:   	prefetch	%g2 + 2, 3
	.word	0xda36600c	! t0_kref+0x3a24:   	sth	%o5, [%i1 + 0xc]
	.word	0xaba01895	! t0_kref+0x3a28:   	fitos	%f21, %f21
	.word	0xa5b30a1e	! t0_kref+0x3a2c:   	fpadd16	%f12, %f30, %f18
	.word	0x2f480005	! t0_kref+0x3a30:   	fbu,a,pt	%fcc0, _kref+0x3a44
	.word	0xb5a01118	! t0_kref+0x3a34:   	fxtod	%f24, %f26
	.word	0xa5a0192e	! t0_kref+0x3a38:   	fstod	%f14, %f18
	.word	0xadb68a16	! t0_kref+0x3a3c:   	fpadd16	%f26, %f22, %f22
	.word	0xd20e3fe9	! t0_kref+0x3a40:   	ldub	[%i0 - 0x17], %o1
	.word	0xe016001b	! t0_kref+0x3a44:   	lduh	[%i0 + %i3], %l0
	.word	0xf51e3ff0	! t0_kref+0x3a48:   	ldd	[%i0 - 0x10], %f26
	.word	0x903ca105	! t0_kref+0x3a4c:   	xnor	%l2, 0x105, %o0
	.word	0xbdb5899a	! t0_kref+0x3a50:   	bshuffle	%f22, %f26, %f30
	.word	0x9da01938	! t0_kref+0x3a54:   	fstod	%f24, %f14
	.word	0x3b800006	! t0_kref+0x3a58:   	fble,a	_kref+0x3a70
	.word	0xf6766018	! t0_kref+0x3a5c:   	stx	%i3, [%i1 + 0x18]
	.word	0xacf2c008	! t0_kref+0x3a60:   	udivcc	%o3, %o0, %l6
	.word	0x90dd71b3	! t0_kref+0x3a64:   	smulcc	%l5, -0xe4d, %o0
	.word	0xbfa000b7	! t0_kref+0x3a68:   	fnegs	%f23, %f31
	.word	0x99a3895c	! t0_kref+0x3a6c:   	fmuld	%f14, %f28, %f12
	.word	0xf3063ff8	! t0_kref+0x3a70:   	ld	[%i0 - 8], %f25
	.word	0xa1b30d96	! t0_kref+0x3a74:   	fxor	%f12, %f22, %f16
	.word	0x912d4012	! t0_kref+0x3a78:   	sll	%l5, %l2, %o0
	.word	0xa7802ddb	! t0_kref+0x3a7c:   	mov	0xddb, %gsr
	.word	0x8143c000	! t0_kref+0x3a80:   	stbar
	.word	0xe1be1897	! t0_kref+0x3a84:   	stda	%f16, [%i0 + %l7]0xc4
	.word	0xa2627fed	! t0_kref+0x3a88:   	subc	%o1, -0x13, %l1
	.word	0x8610201e	! t0_kref+0x3a8c:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x3a90:   	subcc	%g3, 1, %g3
	.word	0x22800003	! t0_kref+0x3a94:   	be,a	_kref+0x3aa0
	.word	0xa89d75e7	! t0_kref+0x3a98:   	xorcc	%l5, -0xa19, %l4
	.word	0x95400000	! t0_kref+0x3a9c:   	mov	%y, %o2
	.word	0x21254cde	! t0_kref+0x3aa0:   	sethi	%hi(0x95337800), %l0
	.word	0x90858000	! t0_kref+0x3aa4:   	addcc	%l6, %g0, %o0
	.word	0xfb270019	! t0_kref+0x3aa8:   	st	%f29, [%i4 + %i1]
	.word	0x93b30132	! t0_kref+0x3aac:   	edge32n	%o4, %l2, %o1
	.word	0x2e800006	! t0_kref+0x3ab0:   	bvs,a	_kref+0x3ac8
	.word	0xa6644012	! t0_kref+0x3ab4:   	subc	%l1, %l2, %l3
	.word	0xa88dc011	! t0_kref+0x3ab8:   	andcc	%l7, %l1, %l4
	.word	0x93b5400d	! t0_kref+0x3abc:   	edge8	%l5, %o5, %o1
	.word	0xaca5c00a	! t0_kref+0x3ac0:   	subcc	%l7, %o2, %l6
	.word	0xa9b580fb	! t0_kref+0x3ac4:   	edge16ln	%l6, %i3, %l4
	.word	0x90050009	! t0_kref+0x3ac8:   	add	%l4, %o1, %o0
	.word	0xc807bfec	! t0_kref+0x3acc:   	ld	[%fp - 0x14], %g4
	.word	0xa5b68f4c	! t0_kref+0x3ad0:   	fornot1	%f26, %f12, %f18
	.word	0xa1b48ad2	! t0_kref+0x3ad4:   	fpsub32	%f18, %f18, %f16
	.word	0xb9a0192f	! t0_kref+0x3ad8:   	fstod	%f15, %f28
	.word	0xaba448bc	! t0_kref+0x3adc:   	fsubs	%f17, %f28, %f21
	.word	0x8143e017	! t0_kref+0x3ae0:   	membar	0x17
	.word	0xa5a608b5	! t0_kref+0x3ae4:   	fsubs	%f24, %f21, %f18
	.word	0x9de3bfa0	! t0_kref+0x3ae8:   	save	%sp, -0x60, %sp
	.word	0xb4d8001d	! t0_kref+0x3aec:   	smulcc	%g0, %i5, %i2
	.word	0xadeeaa9e	! t0_kref+0x3af0:   	restore	%i2, 0xa9e, %l6
	.word	0x929a400c	! t0_kref+0x3af4:   	xorcc	%o1, %o4, %o1
	.word	0xb3b64df6	! t0_kref+0x3af8:   	fnands	%f25, %f22, %f25
	.word	0xa780001a	! t0_kref+0x3afc:   	mov	%i2, %gsr
	.word	0x932c0000	! t0_kref+0x3b00:   	sll	%l0, %g0, %o1
	.word	0xb5a64d2d	! t0_kref+0x3b04:   	fsmuld	%f25, %f13, %f26
	.word	0x2a480001	! t0_kref+0x3b08:   	bcs,a,pt	%icc, _kref+0x3b0c
	.word	0xa1b6048e	! t0_kref+0x3b0c:   	fcmple32	%f24, %f14, %l0
	.word	0xada6095a	! t0_kref+0x3b10:   	fmuld	%f24, %f26, %f22
	.word	0xc398a040	! t0_kref+0x3b14:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa8634015	! t0_kref+0x3b18:   	subc	%o5, %l5, %l4
	.word	0x8143c000	! t0_kref+0x3b1c:   	stbar
	.word	0xadb40200	! t0_kref+0x3b20:   	array8	%l0, %g0, %l6
	.word	0xa08c4016	! t0_kref+0x3b24:   	andcc	%l1, %l6, %l0
	.word	0xa472fbd4	! t0_kref+0x3b28:   	udiv	%o3, -0x42c, %l2
	.word	0x95400000	! t0_kref+0x3b2c:   	mov	%y, %o2
	.word	0x90152b7f	! t0_kref+0x3b30:   	or	%l4, 0xb7f, %o0
	.word	0x2d2f5c61	! t0_kref+0x3b34:   	sethi	%hi(0xbd718400), %l6
	call	SYM(t0_subr0)
	.word	0xef6e401b	! t0_kref+0x3b3c:   	prefetch	%i1 + %i3, 23
	.word	0xa265b061	! t0_kref+0x3b40:   	subc	%l6, -0xf9f, %l1
	.word	0xbfa64834	! t0_kref+0x3b44:   	fadds	%f25, %f20, %f31
	.word	0xa1b68f50	! t0_kref+0x3b48:   	fornot1	%f26, %f16, %f16
	.word	0x94d5801c	! t0_kref+0x3b4c:   	umulcc	%l6, %i4, %o2
	.word	0xada000bc	! t0_kref+0x3b50:   	fnegs	%f28, %f22
	.word	0xaa0c0000	! t0_kref+0x3b54:   	and	%l0, %g0, %l5
	.word	0x86102002	! t0_kref+0x3b58:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x3b5c:   	bne,a	_kref+0x3b5c
	.word	0x86a0e001	! t0_kref+0x3b60:   	subcc	%g3, 1, %g3
	.word	0xa6d32b63	! t0_kref+0x3b64:   	umulcc	%o4, 0xb63, %l3
	.word	0xa9a00554	! t0_kref+0x3b68:   	fsqrtd	%f20, %f20
	.word	0xac3a4014	! t0_kref+0x3b6c:   	xnor	%o1, %l4, %l6
	.word	0xb5a0013f	! t0_kref+0x3b70:   	fabss	%f31, %f26
	.word	0xa6028012	! t0_kref+0x3b74:   	add	%o2, %l2, %l3
	.word	0xf9be501d	! t0_kref+0x3b78:   	stda	%f28, [%i1 + %i5]0x80
	.word	0xaba48834	! t0_kref+0x3b7c:   	fadds	%f18, %f20, %f21
	.word	0xe46e7fed	! t0_kref+0x3b80:   	ldstub	[%i1 - 0x13], %l2
	.word	0xaed6c00a	! t0_kref+0x3b84:   	umulcc	%i3, %o2, %l7
	.word	0xb5a74836	! t0_kref+0x3b88:   	fadds	%f29, %f22, %f26
	.word	0x2d480001	! t0_kref+0x3b8c:   	fbg,a,pt	%fcc0, _kref+0x3b90
	.word	0x9db007b4	! t0_kref+0x3b90:   	fpackfix	%f20, %f14
	.word	0xa1a00539	! t0_kref+0x3b94:   	fsqrts	%f25, %f16
	.word	0xa8d363c4	! t0_kref+0x3b98:   	umulcc	%o5, 0x3c4, %l4
	.word	0x910ee35a	! t0_kref+0x3b9c:   	tsubcc	%i3, 0x35a, %o0
	.word	0xb1a7085e	! t0_kref+0x3ba0:   	faddd	%f28, %f30, %f24
	.word	0xa29db2ef	! t0_kref+0x3ba4:   	xorcc	%l6, -0xd11, %l1
	.word	0x8143e040	! t0_kref+0x3ba8:   	membar	0x40
	.word	0xa7a00533	! t0_kref+0x3bac:   	fsqrts	%f19, %f19
	.word	0x2500bb4f	! t0_kref+0x3bb0:   	sethi	%hi(0x2ed3c00), %l2
	.word	0xc398a080	! t0_kref+0x3bb4:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xa3a0188e	! t0_kref+0x3bb8:   	fitos	%f14, %f17
	.word	0xb1a0193e	! t0_kref+0x3bbc:   	fstod	%f30, %f24
	call	SYM(t0_subr3)
	.word	0xb5b007b0	! t0_kref+0x3bc4:   	fpackfix	%f16, %f26
	.word	0x3d480006	! t0_kref+0x3bc8:   	fbule,a,pt	%fcc0, _kref+0x3be0
	.word	0x929cb991	! t0_kref+0x3bcc:   	xorcc	%l2, -0x66f, %o1
	.word	0xa1a0193d	! t0_kref+0x3bd0:   	fstod	%f29, %f16
	.word	0xef270018	! t0_kref+0x3bd4:   	st	%f23, [%i4 + %i0]
	.word	0xe62e0000	! t0_kref+0x3bd8:   	stb	%l3, [%i0]
	.word	0x9db60739	! t0_kref+0x3bdc:   	fmuld8ulx16	%f24, %f25, %f14
	.word	0xeb6e2008	! t0_kref+0x3be0:   	prefetch	%i0 + 8, 21
	.word	0xaba0053b	! t0_kref+0x3be4:   	fsqrts	%f27, %f21
	.word	0xd87e3fe8	! t0_kref+0x3be8:   	swap	[%i0 - 0x18], %o4
	.word	0xb9a0188f	! t0_kref+0x3bec:   	fitos	%f15, %f28
	.word	0x9161a0a0	! t0_kref+0x3bf0:   	movg	%fcc0, 0xa0, %o0
	.word	0xb7a00136	! t0_kref+0x3bf4:   	fabss	%f22, %f27
	.word	0xea6e3fee	! t0_kref+0x3bf8:   	ldstub	[%i0 - 0x12], %l5
	.word	0x35480002	! t0_kref+0x3bfc:   	fbue,a,pt	%fcc0, _kref+0x3c04
	.word	0xa9a000bc	! t0_kref+0x3c00:   	fnegs	%f28, %f20
	.word	0xf120a008	! t0_kref+0x3c04:   	st	%f24, [%g2 + 8]
	.word	0xd22e7feb	! t0_kref+0x3c08:   	stb	%o1, [%i1 - 0x15]
	.word	0xe20e0000	! t0_kref+0x3c0c:   	ldub	[%i0], %l1
	.word	0x34480005	! t0_kref+0x3c10:   	bg,a,pt	%icc, _kref+0x3c24
	.word	0x8143c000	! t0_kref+0x3c14:   	stbar
	.word	0x23800007	! t0_kref+0x3c18:   	fbne,a	_kref+0x3c34
	.word	0xbfb00f30	! t0_kref+0x3c1c:   	fsrc2s	%f16, %f31
	.word	0xea16c018	! t0_kref+0x3c20:   	lduh	[%i3 + %i0], %l5
	.word	0xa874bb42	! t0_kref+0x3c24:   	udiv	%l2, -0x4be, %l4
	.word	0x3b480002	! t0_kref+0x3c28:   	fble,a,pt	%fcc0, _kref+0x3c30
	.word	0xbdb50ede	! t0_kref+0x3c2c:   	fornot2	%f20, %f30, %f30
	.word	0xa658001b	! t0_kref+0x3c30:   	smul	%g0, %i3, %l3
	.word	0xef68a04c	! t0_kref+0x3c34:   	prefetch	%g2 + 0x4c, 23
	.word	0x2f480002	! t0_kref+0x3c38:   	fbu,a,pt	%fcc0, _kref+0x3c40
	.word	0xd2100019	! t0_kref+0x3c3c:   	lduh	[%g0 + %i1], %o1
	.word	0xbda5c833	! t0_kref+0x3c40:   	fadds	%f23, %f19, %f30
	.word	0xaadea56a	! t0_kref+0x3c44:   	smulcc	%i2, 0x56a, %l5
	call	SYM(t0_subr2)
	.word	0xaa9c401b	! t0_kref+0x3c4c:   	xorcc	%l1, %i3, %l5
	.word	0xb3a5493d	! t0_kref+0x3c50:   	fmuls	%f21, %f29, %f25
	.word	0xc398a080	! t0_kref+0x3c54:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xa89e8012	! t0_kref+0x3c58:   	xorcc	%i2, %l2, %l4
	.word	0xbda40d36	! t0_kref+0x3c5c:   	fsmuld	%f16, %f22, %f30
	.word	0xa9a00552	! t0_kref+0x3c60:   	fsqrtd	%f18, %f20
	.word	0x87802082	! t0_kref+0x3c64:   	mov	0x82, %asi
	.word	0xec4e401a	! t0_kref+0x3c68:   	ldsb	[%i1 + %i2], %l6
	.word	0x81830000	! t0_kref+0x3c6c:   	wr	%o4, %g0, %y
	.word	0xb7a01a3c	! t0_kref+0x3c70:   	fstoi	%f28, %f27
	.word	0xa41c311a	! t0_kref+0x3c74:   	xor	%l0, -0xee6, %l2
	.word	0xa31d69e8	! t0_kref+0x3c78:   	tsubcctv	%l5, 0x9e8, %l1
	.word	0xa7b44e35	! t0_kref+0x3c7c:   	fands	%f17, %f21, %f19
	.word	0x9de3bfa0	! t0_kref+0x3c80:   	save	%sp, -0x60, %sp
	.word	0xb636b434	! t0_kref+0x3c84:   	orn	%i2, -0xbcc, %i3
	.word	0x95eef093	! t0_kref+0x3c88:   	restore	%i3, -0xf6d, %o2
	.word	0xa1a01037	! t0_kref+0x3c8c:   	fstox	%f23, %f16
	.word	0xd47e2010	! t0_kref+0x3c90:   	swap	[%i0 + 0x10], %o2
	.word	0xacd28014	! t0_kref+0x3c94:   	umulcc	%o2, %l4, %l6
	.word	0x38800003	! t0_kref+0x3c98:   	bgu,a	_kref+0x3ca4
	.word	0xe86e3fed	! t0_kref+0x3c9c:   	ldstub	[%i0 - 0x13], %l4
	.word	0x24480002	! t0_kref+0x3ca0:   	ble,a,pt	%icc, _kref+0x3ca8
	.word	0xada00534	! t0_kref+0x3ca4:   	fsqrts	%f20, %f22
	.word	0x9fa01891	! t0_kref+0x3ca8:   	fitos	%f17, %f15
	.word	0xae1dc014	! t0_kref+0x3cac:   	xor	%l7, %l4, %l7
	.word	0xd91f4018	! t0_kref+0x3cb0:   	ldd	[%i5 + %i0], %f12
	.word	0x81ac8aad	! t0_kref+0x3cb4:   	fcmpes	%fcc0, %f18, %f13
	.word	0xe8167ff4	! t0_kref+0x3cb8:   	lduh	[%i1 - 0xc], %l4
	.word	0x81ae0a31	! t0_kref+0x3cbc:   	fcmps	%fcc0, %f24, %f17
	.word	0xe81e2010	! t0_kref+0x3cc0:   	ldd	[%i0 + 0x10], %l4
	.word	0x2c480004	! t0_kref+0x3cc4:   	bneg,a,pt	%icc, _kref+0x3cd4
	.word	0xac7c7558	! t0_kref+0x3cc8:   	sdiv	%l1, -0xaa8, %l6
	.word	0xd91fbe30	! t0_kref+0x3ccc:   	ldd	[%fp - 0x1d0], %f12
	.word	0xd06e0000	! t0_kref+0x3cd0:   	ldstub	[%i0], %o0
	.word	0x8584a925	! t0_kref+0x3cd4:   	wr	%l2, 0x925, %ccr
	.word	0x34800008	! t0_kref+0x3cd8:   	bg,a	_kref+0x3cf8
	.word	0xaada4011	! t0_kref+0x3cdc:   	smulcc	%o1, %l1, %l5
	.word	0xa9a00135	! t0_kref+0x3ce0:   	fabss	%f21, %f20
	.word	0xbba5c83e	! t0_kref+0x3ce4:   	fadds	%f23, %f30, %f29
	.word	0xac844010	! t0_kref+0x3ce8:   	addcc	%l1, %l0, %l6
	.word	0xa1270008	! t0_kref+0x3cec:   	mulscc	%i4, %o0, %l0
	.word	0xd2ff1018	! t0_kref+0x3cf0:   	swapa	[%i4 + %i0]0x80, %o1
	.word	0x37800003	! t0_kref+0x3cf4:   	fbge,a	_kref+0x3d00
	.word	0xafa0052f	! t0_kref+0x3cf8:   	fsqrts	%f15, %f23
	.word	0xa2bc0000	! t0_kref+0x3cfc:   	xnorcc	%l0, %g0, %l1
	.word	0xafa348ad	! t0_kref+0x3d00:   	fsubs	%f13, %f13, %f23
	.word	0xeb06600c	! t0_kref+0x3d04:   	ld	[%i1 + 0xc], %f21
	.word	0xa80a4012	! t0_kref+0x3d08:   	and	%o1, %l2, %l4
	.word	0xac52366f	! t0_kref+0x3d0c:   	umul	%o0, -0x991, %l6
	.word	0x9db40c5e	! t0_kref+0x3d10:   	fnor	%f16, %f30, %f14
	.word	0xa69e8008	! t0_kref+0x3d14:   	xorcc	%i2, %o0, %l3
	.word	0xb1a01939	! t0_kref+0x3d18:   	fstod	%f25, %f24
	.word	0xec26001c	! t0_kref+0x3d1c:   	st	%l6, [%i0 + %i4]
	.word	0xf720a01c	! t0_kref+0x3d20:   	st	%f27, [%g2 + 0x1c]
	.word	0x94af000d	! t0_kref+0x3d24:   	andncc	%i4, %o5, %o2
	.word	0xaab824f7	! t0_kref+0x3d28:   	xnorcc	%g0, 0x4f7, %l5
	.word	0xe28e101a	! t0_kref+0x3d2c:   	lduba	[%i0 + %i2]0x80, %l1
	.word	0x9455c00a	! t0_kref+0x3d30:   	umul	%l7, %o2, %o2
	.word	0xb1a000de	! t0_kref+0x3d34:   	fnegd	%f30, %f24
	.word	0x8d83401b	! t0_kref+0x3d38:   	wr	%o5, %i3, %fprs
	.word	0x81844000	! t0_kref+0x3d3c:   	wr	%l1, %g0, %y
	.word	0xe6680018	! t0_kref+0x3d40:   	ldstub	[%g0 + %i0], %l3
	.word	0x99b009b1	! t0_kref+0x3d44:   	fexpand	%f17, %f12
	.word	0xa5a0052d	! t0_kref+0x3d48:   	fsqrts	%f13, %f18
	.word	0xa6dd800d	! t0_kref+0x3d4c:   	smulcc	%l6, %o5, %l3
	.word	0x932d4011	! t0_kref+0x3d50:   	sll	%l5, %l1, %o1
	.word	0xa6533a7b	! t0_kref+0x3d54:   	umul	%o4, -0x585, %l3
	.word	0x81d969f7	! t0_kref+0x3d58:   	flush	%g5 + 0x9f7
	.word	0x9fa000bf	! t0_kref+0x3d5c:   	fnegs	%f31, %f15
	.word	0xa93a6017	! t0_kref+0x3d60:   	sra	%o1, 0x17, %l4
	.word	0xe7267ff0	! t0_kref+0x3d64:   	st	%f19, [%i1 - 0x10]
	.word	0xb5a7cd2e	! t0_kref+0x3d68:   	fsmuld	%f31, %f14, %f26
	.word	0xb9a01912	! t0_kref+0x3d6c:   	fitod	%f18, %f28
	.word	0xf43e3ff0	! t0_kref+0x3d70:   	std	%i2, [%i0 - 0x10]
	.word	0xbbb50ea0	! t0_kref+0x3d74:   	fsrc1s	%f20, %f29
	.word	0x86102002	! t0_kref+0x3d78:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x3d7c:   	bne,a	_kref+0x3d7c
	.word	0x86a0e001	! t0_kref+0x3d80:   	subcc	%g3, 1, %g3
	.word	0x99a00554	! t0_kref+0x3d84:   	fsqrtd	%f20, %f12
	.word	0xdb06001c	! t0_kref+0x3d88:   	ld	[%i0 + %i4], %f13
	.word	0xaeddc012	! t0_kref+0x3d8c:   	smulcc	%l7, %l2, %l7
	.word	0xe27e401c	! t0_kref+0x3d90:   	swap	[%i1 + %i4], %l1
	.word	0xa256a14c	! t0_kref+0x3d94:   	umul	%i2, 0x14c, %l1
	.word	0x9de3bfa0	! t0_kref+0x3d98:   	save	%sp, -0x60, %sp
	.word	0xb6aec01a	! t0_kref+0x3d9c:   	andncc	%i3, %i2, %i3
	.word	0xa7e8001a	! t0_kref+0x3da0:   	restore	%g0, %i2, %l3
	.word	0xf4200018	! t0_kref+0x3da4:   	st	%i2, [%g0 + %i0]
	.word	0xe4680018	! t0_kref+0x3da8:   	ldstub	[%g0 + %i0], %l2
	.word	0xf4267ffc	! t0_kref+0x3dac:   	st	%i2, [%i1 - 4]
	.word	0x39800001	! t0_kref+0x3db0:   	fbuge,a	_kref+0x3db4
	.word	0x81820000	! t0_kref+0x3db4:   	wr	%o0, %g0, %y
	.word	0xec100018	! t0_kref+0x3db8:   	lduh	[%g0 + %i0], %l6
	.word	0xb5a01a56	! t0_kref+0x3dbc:   	fdtoi	%f22, %f26
	.word	0x920b0010	! t0_kref+0x3dc0:   	and	%o4, %l0, %o1
	.word	0x99b00cde	! t0_kref+0x3dc4:   	fnot2	%f30, %f12
	.word	0x290b8cb1	! t0_kref+0x3dc8:   	sethi	%hi(0x2e32c400), %l4
	.word	0xe9be589a	! t0_kref+0x3dcc:   	stda	%f20, [%i1 + %i2]0xc4
	.word	0xad400000	! t0_kref+0x3dd0:   	mov	%y, %l6
	.word	0xa1b7cc72	! t0_kref+0x3dd4:   	fnors	%f31, %f18, %f16
	.word	0xe168a08b	! t0_kref+0x3dd8:   	prefetch	%g2 + 0x8b, 16
	.word	0xe920a004	! t0_kref+0x3ddc:   	st	%f20, [%g2 + 4]
	.word	0x32800002	! t0_kref+0x3de0:   	bne,a	_kref+0x3de8
	.word	0xadb58074	! t0_kref+0x3de4:   	edge8ln	%l6, %l4, %l6
	.word	0xb9a58836	! t0_kref+0x3de8:   	fadds	%f22, %f22, %f28
	.word	0x38480008	! t0_kref+0x3dec:   	bgu,a,pt	%icc, _kref+0x3e0c
	.word	0xae7c71e5	! t0_kref+0x3df0:   	sdiv	%l1, -0xe1b, %l7
	.word	0x93234013	! t0_kref+0x3df4:   	mulscc	%o5, %l3, %o1
	.word	0x9fa01a2f	! t0_kref+0x3df8:   	fstoi	%f15, %f15
	.word	0xea263ffc	! t0_kref+0x3dfc:   	st	%l5, [%i0 - 4]
	.word	0xb1a0053c	! t0_kref+0x3e00:   	fsqrts	%f28, %f24
	.word	0xe306401c	! t0_kref+0x3e04:   	ld	[%i1 + %i4], %f17
	.word	0xa9a7c8ad	! t0_kref+0x3e08:   	fsubs	%f31, %f13, %f20
	.word	0x909eb431	! t0_kref+0x3e0c:   	xorcc	%i2, -0xbcf, %o0
	.word	0xe0ce501a	! t0_kref+0x3e10:   	ldsba	[%i1 + %i2]0x80, %l0
	.word	0xa81a8017	! t0_kref+0x3e14:   	xor	%o2, %l7, %l4
	.word	0xae08001b	! t0_kref+0x3e18:   	and	%g0, %i3, %l7
	.word	0xf5270018	! t0_kref+0x3e1c:   	st	%f26, [%i4 + %i0]
	.word	0xa0f68014	! t0_kref+0x3e20:   	udivcc	%i2, %l4, %l0
	.word	0x93b50512	! t0_kref+0x3e24:   	fcmpgt16	%f20, %f18, %o1
	.word	0xb1b3cea0	! t0_kref+0x3e28:   	fsrc1s	%f15, %f24
	.word	0x9da6c8b2	! t0_kref+0x3e2c:   	fsubs	%f27, %f18, %f14
	.word	0xad348016	! t0_kref+0x3e30:   	srl	%l2, %l6, %l6
	.word	0x9ba408b3	! t0_kref+0x3e34:   	fsubs	%f16, %f19, %f13
	.word	0xb3b40c6f	! t0_kref+0x3e38:   	fnors	%f16, %f15, %f25
	.word	0x9fa00539	! t0_kref+0x3e3c:   	fsqrts	%f25, %f15
	.word	0x9da01a39	! t0_kref+0x3e40:   	fstoi	%f25, %f14
	.word	0xda7e3fe0	! t0_kref+0x3e44:   	swap	[%i0 - 0x20], %o5
	.word	0xa9a58954	! t0_kref+0x3e48:   	fmuld	%f22, %f20, %f20
	.word	0xab2ee01e	! t0_kref+0x3e4c:   	sll	%i3, 0x1e, %l5
	.word	0xe00e3fe9	! t0_kref+0x3e50:   	ldub	[%i0 - 0x17], %l0
	.word	0x9de3bfa0	! t0_kref+0x3e54:   	save	%sp, -0x60, %sp
	.word	0xb8d77055	! t0_kref+0x3e58:   	umulcc	%i5, -0xfab, %i4
	.word	0xafeec01c	! t0_kref+0x3e5c:   	restore	%i3, %i4, %l7
	.word	0xa09a2003	! t0_kref+0x3e60:   	xorcc	%o0, 3, %l0
	.word	0xa8054008	! t0_kref+0x3e64:   	add	%l5, %o0, %l4
	.word	0xb5a7c8ba	! t0_kref+0x3e68:   	fsubs	%f31, %f26, %f26
	.word	0xee200019	! t0_kref+0x3e6c:   	st	%l7, [%g0 + %i1]
	.word	0x8185c000	! t0_kref+0x3e70:   	wr	%l7, %g0, %y
	.word	0xa29aa47c	! t0_kref+0x3e74:   	xorcc	%o2, 0x47c, %l1
	.word	0xda2e2015	! t0_kref+0x3e78:   	stb	%o5, [%i0 + 0x15]
	.word	0xa8ba801c	! t0_kref+0x3e7c:   	xnorcc	%o2, %i4, %l4
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x3e84:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x69596000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x69636000)
.seg "text"
t0_subr1_page_begin:
	.skip 8184
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x697e6000)
.seg "text"
t0_subr2_page_begin:
	.skip 8184
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x04646000)
.seg "text"
t0_subr3_page_begin:
	.skip 8136
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
!  Total operations: 3881  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.01   0.64
!  ldub              0.60   0.95
!  ldsh              0.17   0.21
!  lduh              0.47   0.62
!  ld                0.91   0.77
!  ldd               0.17   0.15
!  swap              1.12   1.00
!  ldstub            1.29   1.52
!  stb               1.37   1.37
!  sth               0.49   0.49
!  st                1.16   1.78
!  std               0.79   0.82
!  add               1.10   1.19
!  addcc             0.82   0.95
!  addx              0.16   0.05
!  addxcc            0.05   0.05
!  taddcc            0.22   0.23
!  taddcctv          0.04   0.00
!  sub               0.21   0.36
!  subcc             0.44   0.64
!  subx              0.60   0.52
!  subxcc            0.52   0.33
!  tsubcc            0.17   0.10
!  tsubcctv          0.15   0.15
!  mulscc            0.48   0.72
!  and               0.77   0.95
!  andcc             0.31   0.49
!  andn              0.45   0.41
!  andncc            0.31   0.26
!  or                1.10   1.03
!  orcc              0.09   0.03
!  orn               0.10   0.08
!  orncc             0.11   0.05
!  xor               0.94   1.08
!  xorcc             1.25   1.62
!  xnor              0.45   0.46
!  xnorcc            0.11   0.31
!  sll               0.61   0.57
!  srl               0.17   0.18
!  sra               0.35   0.31
!  unimp             0.21   0.18
!  umul              0.72   0.88
!  smul              0.62   0.72
!  udiv              1.34   1.34
!  sdiv              1.18   1.03
!  umulcc            1.23   1.00
!  smulcc            1.26   1.34
!  udivcc            1.08   1.19
!  sdivcc            0.65   0.62
!  rdy               0.83   0.98
!  wry               1.15   1.34
!  bicc              1.95   1.70
!  sethi             1.37   1.34
!  jmpl              0.52   0.41
!  call              1.27   1.42
!  ticc              0.00   0.00
!  flush             1.21   1.39
!  save              1.34   0.95
!  restore           1.07   0.00
!  stbar             0.99   0.98
!  ldf               1.22   1.75
!  lddf              1.23   1.31
!  stf               0.46   0.57
!  stdf              0.24   0.26
!  fadds             1.23   1.34
!  fsubs             1.39   1.93
!  fmuls             0.17   0.18
!  fdivs             0.08   0.03
!  faddd             0.57   0.57
!  fsubd             0.36   0.28
!  fmuld             1.16   1.34
!  fdivd             0.18   0.21
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.17   1.29
!  fdmulq            0.00   0.00
!  fitos             1.33   1.19
!  fitod             0.29   0.39
!  fitoq             0.00   0.00
!  fstoi             1.23   1.00
!  fstod             1.18   1.31
!  fstoq             0.00   0.00
!  fdtoi             0.85   0.82
!  fdtos             0.11   0.18
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.15   0.23
!  fnegs             0.74   0.62
!  fabss             1.08   1.21
!  fsqrts            1.99   2.16
!  fsqrtd            1.58   1.57
!  fsqrtq            0.00   0.00
!  fcmps             0.73   0.62
!  fcmpd             0.39   0.28
!  fcmpq             0.00   0.00
!  fcmpes            1.29   1.13
!  fcmped            0.39   0.41
!  fcmpeq            0.00   0.00
!  fbfcc             1.76   1.78
!  ldfsr             0.02   0.00
!  stfsr             0.08   0.05
!  loop              0.88   0.77
!  offset            0.23   0.33
!  area              0.11   0.03
!  target            0.15   0.28
!  goto              0.17   0.03
!  sigsegv           0.16   0.15
!  sigbus            0.02   0.03
!  imodify           0.00   0.00
!  ldfsr_offset      0.23   0.00
!  fpattern          0.16   0.15
!  lbranch           0.24   0.18
!  shmld             0.20   0.10
!  shmst             0.98   1.26
!  shmpf             0.68   0.75
!  shmswap           0.03   0.00
!  shmblkld          1.29   0.31
!  shmblkst          0.16   0.05
!  shmblkchk         0.52   0.39
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
!  casa              0.22   0.41
!  rdasi             0.20   0.08
!  wrasi             0.20   0.10
!  bpcc              3.61   2.99
!  fbpfcc            2.37   2.19
!  fmovscc           0.14   0.05
!  fmovdcc           0.11   0.05
!  fmovqcc           0.00   0.00
!  movcc             0.11   0.15
!  flushw            0.21   0.33
!  membar            0.19   0.08
!  prefetch          0.45   0.59
!  rdpc              0.20   0.15
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.24   0.36
!  lddfa             0.14   0.13
!  ldqfa             0.00   0.00
!  ldsba             0.25   0.23
!  ldsha             0.11   0.03
!  lduba             0.26   0.28
!  lduha             0.13   0.10
!  lda               0.03   0.08
!  ldda              0.13   0.13
!  ldstuba           0.14   0.18
!  prefetcha         0.45   0.62
!  stfa              0.00   0.00
!  stdfa             0.09   0.10
!  stqfa             0.00   0.00
!  stba              0.06   0.10
!  stha              0.04   0.05
!  sta               0.05   0.03
!  stda              0.18   0.10
!  swapa             0.20   0.31
!  fmovd             0.11   0.05
!  fnegd             0.23   0.13
!  fabsd             0.11   0.10
!  fstox             0.22   0.28
!  fdtox             0.22   0.15
!  fxtos             0.04   0.03
!  fxtod             0.25   0.21
!  lds               0.06   0.15
!  ldsa              0.26   0.23
!  ldx               0.25   0.21
!  ldxa              0.04   0.08
!  nofault           0.01   0.00
!  rdgsr             0.03   0.03
!  wrgsr             0.22   0.21
!  fpadd16           0.13   0.31
!  fpadd16s          0.23   0.46
!  fpadd32           0.14   0.08
!  fpadd32s          0.14   0.03
!  fpsub16           0.23   0.15
!  fpsub16s          0.27   0.28
!  fpsub32           0.20   0.44
!  fpsub32s          0.11   0.00
!  fpack16           0.21   0.28
!  fpack32           0.02   0.00
!  fpackfix          0.27   0.23
!  fexpand           0.21   0.21
!  fpmerge           0.08   0.05
!  fmul8x16          0.12   0.13
!  fmul8x16au        0.12   0.05
!  fmul8x16al        0.02   0.00
!  fmul8sux16        0.06   0.03
!  fmul8ulx16        0.15   0.13
!  fmuld8sux16       0.00   0.00
!  fmuld8ulx16       0.17   0.05
!  alignaddr         0.01   0.00
!  alignaddrl        0.04   0.00
!  faligndata        0.23   0.39
!  fzero             0.04   0.03
!  fzeros            0.25   0.28
!  fone              0.01   0.00
!  fones             0.02   0.00
!  fsrc1             0.00   0.00
!  fsrc1s            0.20   0.18
!  fsrc2             0.12   0.00
!  fsrc2s            0.18   0.18
!  fnot1             0.14   0.13
!  fnot1s            0.24   0.31
!  fnot2             0.19   0.28
!  fnot2s            0.17   0.10
!  for               0.20   0.21
!  fors              0.04   0.03
!  fnor              0.17   0.18
!  fnors             0.22   0.21
!  fand              0.09   0.05
!  fands             0.18   0.08
!  fnand             0.21   0.39
!  fnands            0.21   0.36
!  fxor              0.18   0.18
!  fxors             0.11   0.03
!  fxnor             0.11   0.08
!  fxnors            0.26   0.31
!  fornot1           0.14   0.23
!  fornot1s          0.24   0.28
!  fornot2           0.27   0.39
!  fornot2s          0.19   0.21
!  fandnot1          0.12   0.10
!  fandnot1s         0.08   0.05
!  fandnot2          0.22   0.28
!  fandnot2s         0.04   0.00
!  fcmpgt16          0.27   0.23
!  fcmpgt32          0.20   0.33
!  fcmple16          0.03   0.08
!  fcmple32          0.27   0.31
!  fcmpne16          0.06   0.13
!  fcmpne32          0.02   0.00
!  fcmpeq16          0.07   0.10
!  fcmpeq32          0.01   0.03
!  edge8             0.27   0.33
!  edge8l            0.18   0.18
!  edge16            0.04   0.03
!  edge16l           0.08   0.10
!  edge32            0.05   0.00
!  edge32l           0.03   0.08
!  pdist             0.13   0.13
!  partial_st8       0.20   0.13
!  partial_st16      0.24   0.15
!  partial_st32      0.20   0.33
!  short_st8         0.04   0.03
!  short_st16        0.09   0.08
!  short_ld8         0.24   0.31
!  short_ld16        0.07   0.15
!  blkld             0.13   0.00
!  blkst             0.25   0.00
!  blkld_offset      0.12   0.00
!  blkst_offset      0.09   0.00
!  blk_check         0.20   0.18
!  casxa             0.01   0.00
!  rdccr             0.21   0.15
!  rdfprs            0.03   0.03
!  wrccr             0.26   0.33
!  popc              0.09   0.10
!  wrfprs            0.20   0.05
!  stx               0.24   0.21
!  stxa              0.10   0.08
!  cflush            0.00   0.00
!  array8            0.13   0.15
!  array16           0.21   0.08
!  array32           0.10   0.13
!  edge8n            0.15   0.15
!  edge8ln           0.23   0.28
!  edge16n           0.16   0.15
!  edge16ln          0.20   0.21
!  edge32n           0.27   0.33
!  edge32ln          0.18   0.18
!  bmask             0.23   0.18
!  bshuffle          0.25   0.28
!  siam              0.13   0.05
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
KDATA_MODULE(t0_module_offset_table, 0x68262000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0xfffffff8
	.word	0xffffffe0
	.word	0x00000018
	.word	0xffffffe8
	.word	0x00000010
	.word	0xfffffff0
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

KDATA_MODULE(t0_module_data_in_regs, 0x58c24000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x5769816b          ! %f0
	.word	0xe493735d          ! %f1
	.word	0xdba4773c          ! %f2
	.word	0x9158208e          ! %f3
	.word	0x44988c74          ! %f4
	.word	0x64a9d9f0          ! %f5
	.word	0x390ed65b          ! %f6
	.word	0xa20a1913          ! %f7
	.word	0xe864e5b4          ! %f8
	.word	0x364f86ca          ! %f9
	.word	0xcf231539          ! %f10
	.word	0x5e6d5e20          ! %f11
	.word	0xcccfcd06          ! %f12
	.word	0x7e046c7c          ! %f13
	.word	0x98b45397          ! %f14
	.word	0xa7a99e83          ! %f15
	.word	0xa19c593c          ! %f16
	.word	0xcb02a880          ! %f17
	.word	0x9b14b92d          ! %f18
	.word	0x1aa72a5d          ! %f19
	.word	0x7c4f83aa          ! %f20
	.word	0x774c0269          ! %f21
	.word	0x480d56cd          ! %f22
	.word	0x40102780          ! %f23
	.word	0x7326e7eb          ! %f24
	.word	0x13b3aa5a          ! %f25
	.word	0x6a1075c7          ! %f26
	.word	0x39403700          ! %f27
	.word	0x8a553bdf          ! %f28
	.word	0xda20eabc          ! %f29
	.word	0xa036f98f          ! %f30
	.word	0x6c106004          ! %f31
	.word	0x623fc3f2          ! %f32
	.word	0x3adec12b          ! %f33
	.word	0xa57fb79d          ! %f34
	.word	0x7ff653dc          ! %f35
	.word	0x2f6847a4          ! %f36
	.word	0x7e9792b0          ! %f37
	.word	0xa4d1e994          ! %f38
	.word	0xc6cb5f58          ! %f39
	.word	0x65634a44          ! %f40
	.word	0x14db6f35          ! %f41
	.word	0x0fb21da6          ! %f42
	.word	0x8c009d57          ! %f43
	.word	0x4df28bfe          ! %f44
	.word	0x22029835          ! %f45
	.word	0xd2ab4936          ! %f46
	.word	0x334b3e9e          ! %f47
	.word	0xf0581718          ! %f48
	.word	0xce253eb2          ! %f49
	.word	0x3e63e1be          ! %f50
	.word	0x152cfaea          ! %f51
	.word	0x23765d78          ! %f52
	.word	0x84fcac6c          ! %f53
	.word	0x99711ff2          ! %f54
	.word	0x8169ff47          ! %f55
	.word	0x1b962a69          ! %f56
	.word	0x03114c4f          ! %f57
	.word	0x7b78d125          ! %f58
	.word	0xaebeeda2          ! %f59
	.word	0xf2f36c9e          ! %f60
	.word	0xaadc462c          ! %f61
	.word	0xe0545aec          ! %f62
	.word	0xe93ec19d          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x17c       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xbd2917f9          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xda126242          ! %o0
	.word	0x562f5fdd          ! %o1
	.word	0x7b430ad7          ! %o2
	.word	0xe6ff9d9f          ! %o3
	.word	0x84c1cd36          ! %o4
	.word	0x2f7ba127          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x8ebe1c76          ! %l0
	.word	0x13baa1ac          ! %l1
	.word	0x47edd500          ! %l2
	.word	0x5ee9aea2          ! %l3
	.word	0x594cc281          ! %l4
	.word	0x2ffb2480          ! %l5
	.word	0x4fba5d68          ! %l6
	.word	0x298b4b3a          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000014          ! %i2 (byte offset)
	.word	0x00000014          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7c602152          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0xc0000b8c          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x16586000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xd252794a
	.word	0x753dc441
	.word	0x71a20a3d
	.word	0xca90f687
	.word	0x86a0d3ee
	.word	0x8e704ec7
	.word	0x4d7728d3
	.word	0xb679e388
	.word	0x47a8f6e0
	.word	0x3762f121
	.word	0x42554df6
	.word	0x7b60c76a
	.word	0xfc40ea55
	.word	0xd68751e0
	.word	0x78ad6d75
	.word	0x49cc387b
	.word	0x6c5439f4
	.word	0x7d63b4bf
	.word	0xe1bddb79
	.word	0x6ad2b5d4
	.word	0xc16691bb
	.word	0x53549fae
	.word	0x2cc58e0e
	.word	0x917a2486
	.word	0x7aa8c524
	.word	0x341b3d2e
	.word	0xb36b72e3
	.word	0x62756c12
	.word	0x6634a483
	.word	0x003f0fdf
	.word	0x5f1edd4d
	.word	0xa4bae61f
	.word	0x8b6644b1
	.word	0xde9ecb57
	.word	0x72025091
	.word	0x2de59566
	.word	0x688f9cee
	.word	0x27f56634
	.word	0x5f422a62
	.word	0x85fe57f0
	.word	0xd2ad9f03
	.word	0xd3d5b974
	.word	0xfcccf1a8
	.word	0x3e698883
	.word	0xe6942da7
	.word	0x83f04103
	.word	0xdb7b4d82
	.word	0x9288c359
	.word	0x32789523
	.word	0x0b9bd195
	.word	0x4711e88e
	.word	0x9567c213
	.word	0xd3186a38
	.word	0xf7d357b5
	.word	0xa567c467
	.word	0x99c682ed
	.word	0x1b34f340
	.word	0xe467f41e
	.word	0xb79fc16f
	.word	0xc8422f31
	.word	0x4cf97f92
	.word	0xa7480949
	.word	0xba0c5ecd
	.word	0xcd8174f0
	.word	0x6565512b
	.word	0xafb10e47
	.word	0xe340f6b9
	.word	0xf76047f0
	.word	0x5037fc89
	.word	0x9e2b3ad0
	.word	0x3143faf6
	.word	0xf7623de0
	.word	0x896962da
	.word	0xa08b609b
	.word	0x7109f5a0
	.word	0x4171f9d2
	.word	0x1624aa56
	.word	0xa42885ef
	.word	0xa0995227
	.word	0xc3675ae9
	.word	0x5ccfd8e8
	.word	0xed381579
	.word	0x23b3329b
	.word	0x93356251
	.word	0x201ff513
	.word	0x1e1cb760
	.word	0x2dddd529
	.word	0x7a3c046f
	.word	0x46d3d113
	.word	0x91a12796
	.word	0x77714de5
	.word	0xb3495959
	.word	0x16ade442
	.word	0x10d99d71
	.word	0x060f98c9
	.word	0x3998e088
	.word	0xafe7d6bd
	.word	0x25fb9879
	.word	0xfffd47fd
	.word	0x10d6cbcc
	.word	0x5ce0a347
	.word	0x72252683
	.word	0x2d605258
	.word	0x9418857f
	.word	0x4a70736d
	.word	0xaa09f6fe
	.word	0xb6bec626
	.word	0x2b1ae5fd
	.word	0x765b99e9
	.word	0xf60dcf8c
	.word	0xa56f642b
	.word	0x8529cc53
	.word	0xb5104f4b
	.word	0xfab935d4
	.word	0xb54a66e8
	.word	0x5f1c0e35
	.word	0x247114d5
	.word	0x6fee6296
	.word	0xb708fa1c
	.word	0xd109f335
	.word	0xe127e1a7
	.word	0xe511d1ff
	.word	0x6ca6268d
	.word	0x8813af32
	.word	0x6d1c7e1b
	.word	0xafbb053e
	.word	0xc4fc3607
	.word	0x3bf0900e
	.word	0x9a6ab172
	.word	0x6eb74956
	.word	0x4605d3a4
	.word	0x2656d2a3
	.word	0x94db25af
	.word	0x7d719735
	.word	0x6dda6c4e
	.word	0x7ed752f6
	.word	0x86ac25c3
	.word	0xf96fe106
	.word	0xbdf19382
	.word	0xafc78bad
	.word	0x72a599e9
	.word	0xf5c760c2
	.word	0xeab17056
	.word	0x838798be
	.word	0xf745e653
	.word	0x5c6ebc0d
	.word	0x770876bc
	.word	0x44193169
	.word	0x6b8b9006
	.word	0x146e113f
	.word	0x8912f108
	.word	0x3cd7cd67
	.word	0xefb9cc01
	.word	0xeb5a41c0
	.word	0x75d11daf
	.word	0x3e716963
	.word	0xd1b45ca4
	.word	0xa98a0d98
	.word	0xd6fae551
	.word	0x63429ea9
	.word	0xd7716150
	.word	0xa848d445
	.word	0xb34a6cf8
	.word	0x0530021d
	.word	0x58c5fc4a
	.word	0x51340ecf
	.word	0x976708a2
	.word	0x7941fe6d
t0_data_in_sp:
	.word	0x66bcf2e4
	.word	0x8b2dd71a
	.word	0x782e51fc
	.word	0x07e79d8a
	.word	0xcff4abde
	.word	0x4520107a
	.word	0xdeb16770
	.word	0xbe17f553
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffff9
	.word	0xffffffee
	.word	0xfffffffc
	.word	0x00000018
	.word	t0_data_in_fp
	.word	0x09c38f43
	.word	0xc5fffbb5
	.word	0x20ef452d
	.word	0xdbda5b2c
	.word	0x2daa1941
	.word	0xb003c993
	.word	0xfe443495
	.word	0xdb8af366
	.word	0x09951767
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
	.word   	0xfd5b596d	! [%fp - 0xc]
	.word   	0xd97ddb82	! [%fp - 0x8]
	.word   	0x78a80a5f	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x28bac0af
	.word	0x63ce2b40
	.word	0x47fdf3e1
	.word	0x9fce839f
	.word	0x2a3f2338
	.word	0x243e6b1a
	.word	0x0693140c
	.word	0x495c77d9
	.word	0x2ac0e5a2
	.word	0x82b8b9dc
	.word	0x5341423b
	.word	0x6f42354f
	.word	0x48e0499b
	.word	0x38b13e41
	.word	0x963bcb3a
	.word	0x7c386274
	.word	0xc99b43ba
	.word	0x7d12421e
	.word	0xe419505c
	.word	0xf56326d2
	.word	0x53b2bc8b
	.word	0x9d40dfeb
	.word	0xc66640af
	.word	0x4d847e2e
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x1ff46000)
.seg "data"
t0_data_in_area0_start:
.skip 960
t0_data_in_area0_begin:
	.word	0xeffa4eea	! t0_data_in_area0-0x20
	.word	0x11808481	! t0_data_in_area0-0x1c
	.word	0xe9493170	! t0_data_in_area0-0x18
	.word	0x9e5e19e9	! t0_data_in_area0-0x14
	.word	0x68b51794	! t0_data_in_area0-0x10
	.word	0x2e664925	! t0_data_in_area0-0xc
	.word	0xc02fc9c1	! t0_data_in_area0-0x8
	.word	0x840574a8	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x893769fa	! t0_data_in_area0+0x0
	.word	0x109969c4	! t0_data_in_area0+0x4
	.word	0xcfb23599	! t0_data_in_area0+0x8
	.word	0x7cf2fc37	! t0_data_in_area0+0xc
	.word	0xfa2e7e58	! t0_data_in_area0+0x10
	.word	0xa02e5b80	! t0_data_in_area0+0x14
	.word	0x2b4653fb	! t0_data_in_area0+0x18
	.word	0x1abf75aa	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 7168
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x6b4d0000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xb36c6d06	! t0_data_in_shm_area+0x0 (t0)
	.word	0xd1be476b	! t0_data_in_shm_area+0x4 (t0)
	.word	0x693b146a	! t0_data_in_shm_area+0x8 (t0)
	.word	0x7910ffc5	! t0_data_in_shm_area+0xc (t0)
	.word	0x7b280b0e	! t0_data_in_shm_area+0x10 (t0)
	.word	0xe534ed91	! t0_data_in_shm_area+0x14 (t0)
	.word	0x1a07b79b	! t0_data_in_shm_area+0x18 (t0)
	.word	0xfc6b579d	! t0_data_in_shm_area+0x1c (t0)
	.word	0xc1857bfe	! t0_data_in_shm_area+0x20 (t0)
	.word	0xd96b343b	! t0_data_in_shm_area+0x24 (t0)
	.word	0xe881e76c	! t0_data_in_shm_area+0x28 (t0)
	.word	0x4fad437e	! t0_data_in_shm_area+0x2c (t0)
	.word	0x7f358cfe	! t0_data_in_shm_area+0x30 (t0)
	.word	0xb044e772	! t0_data_in_shm_area+0x34 (t0)
	.word	0x5a48da15	! t0_data_in_shm_area+0x38 (t0)
	.word	0x1f3f480f	! t0_data_in_shm_area+0x3c (t0)
	.word	0x14472d24	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x456c6cc2	! t0_data_in_shm_area+0x44
	.word	0x91e2f49c	! t0_data_in_shm_area+0x48
	.word	0xba960bb4	! t0_data_in_shm_area+0x4c
	.word	0x8a279706	! t0_data_in_shm_area+0x50
	.word	0x3a2f6f3f	! t0_data_in_shm_area+0x54
	.word	0x09eea08e	! t0_data_in_shm_area+0x58
	.word	0xc1ed0c33	! t0_data_in_shm_area+0x5c
	.word	0xf682ff90	! t0_data_in_shm_area+0x60
	.word	0xefabc7cd	! t0_data_in_shm_area+0x64
	.word	0x899e48eb	! t0_data_in_shm_area+0x68
	.word	0x6d448a99	! t0_data_in_shm_area+0x6c
	.word	0x0580de18	! t0_data_in_shm_area+0x70
	.word	0x55ac259b	! t0_data_in_shm_area+0x74
	.word	0x49c2b261	! t0_data_in_shm_area+0x78
	.word	0x04f7d15e	! t0_data_in_shm_area+0x7c
	.word	0x35f421af	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xdc883aef	! t0_data_in_shm_area+0x84
	.word	0x962622bd	! t0_data_in_shm_area+0x88
	.word	0x71ef38c7	! t0_data_in_shm_area+0x8c
	.word	0xf2c8e7ba	! t0_data_in_shm_area+0x90
	.word	0x83547228	! t0_data_in_shm_area+0x94
	.word	0x0c2e0b9e	! t0_data_in_shm_area+0x98
	.word	0x9dc38d8b	! t0_data_in_shm_area+0x9c
	.word	0x277e87c0	! t0_data_in_shm_area+0xa0
	.word	0x75e96f01	! t0_data_in_shm_area+0xa4
	.word	0xc4e02c6b	! t0_data_in_shm_area+0xa8
	.word	0xd85ebdb9	! t0_data_in_shm_area+0xac
	.word	0xfb160884	! t0_data_in_shm_area+0xb0
	.word	0x280be012	! t0_data_in_shm_area+0xb4
	.word	0x48c35f86	! t0_data_in_shm_area+0xb8
	.word	0xeaffefd8	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x1320c000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x5769816b          ! %f0
	.word	0xe493735d          ! %f1
	.word	0xdba4773c          ! %f2
	.word	0x9158208e          ! %f3
	.word	0x44988c74          ! %f4
	.word	0x64a9d9f0          ! %f5
	.word	0x390ed65b          ! %f6
	.word	0xa20a1913          ! %f7
	.word	0xe864e5b4          ! %f8
	.word	0x364f86ca          ! %f9
	.word	0xcf231539          ! %f10
	.word	0x5e6d5e20          ! %f11
	.word	0xcccfcd06          ! %f12
	.word	0x7e046c7c          ! %f13
	.word	0x98b45397          ! %f14
	.word	0xa7a99e83          ! %f15
	.word	0xa19c593c          ! %f16
	.word	0xcb02a880          ! %f17
	.word	0x9b14b92d          ! %f18
	.word	0x1aa72a5d          ! %f19
	.word	0x7c4f83aa          ! %f20
	.word	0x774c0269          ! %f21
	.word	0x480d56cd          ! %f22
	.word	0x40102780          ! %f23
	.word	0x7326e7eb          ! %f24
	.word	0x13b3aa5a          ! %f25
	.word	0x6a1075c7          ! %f26
	.word	0x39403700          ! %f27
	.word	0x8a553bdf          ! %f28
	.word	0xda20eabc          ! %f29
	.word	0xa036f98f          ! %f30
	.word	0x6c106004          ! %f31
	.word	0x623fc3f2          ! %f32
	.word	0x3adec12b          ! %f33
	.word	0xa57fb79d          ! %f34
	.word	0x7ff653dc          ! %f35
	.word	0x2f6847a4          ! %f36
	.word	0x7e9792b0          ! %f37
	.word	0xa4d1e994          ! %f38
	.word	0xc6cb5f58          ! %f39
	.word	0x65634a44          ! %f40
	.word	0x14db6f35          ! %f41
	.word	0x0fb21da6          ! %f42
	.word	0x8c009d57          ! %f43
	.word	0x4df28bfe          ! %f44
	.word	0x22029835          ! %f45
	.word	0xd2ab4936          ! %f46
	.word	0x334b3e9e          ! %f47
	.word	0xf0581718          ! %f48
	.word	0xce253eb2          ! %f49
	.word	0x3e63e1be          ! %f50
	.word	0x152cfaea          ! %f51
	.word	0x23765d78          ! %f52
	.word	0x84fcac6c          ! %f53
	.word	0x99711ff2          ! %f54
	.word	0x8169ff47          ! %f55
	.word	0x1b962a69          ! %f56
	.word	0x03114c4f          ! %f57
	.word	0x7b78d125          ! %f58
	.word	0xaebeeda2          ! %f59
	.word	0xf2f36c9e          ! %f60
	.word	0xaadc462c          ! %f61
	.word	0xe0545aec          ! %f62
	.word	0xe93ec19d          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x17c       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xbd2917f9          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xda126242          ! %o0
	.word	0x562f5fdd          ! %o1
	.word	0x7b430ad7          ! %o2
	.word	0xe6ff9d9f          ! %o3
	.word	0x84c1cd36          ! %o4
	.word	0x2f7ba127          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x8ebe1c76          ! %l0
	.word	0x13baa1ac          ! %l1
	.word	0x47edd500          ! %l2
	.word	0x5ee9aea2          ! %l3
	.word	0x594cc281          ! %l4
	.word	0x2ffb2480          ! %l5
	.word	0x4fba5d68          ! %l6
	.word	0x298b4b3a          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000014          ! %i2 (byte offset)
	.word	0x00000014          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x7c602152          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0xc0000b8c          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x03e48000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xd252794a
	.word	0x753dc441
	.word	0x71a20a3d
	.word	0xca90f687
	.word	0x86a0d3ee
	.word	0x8e704ec7
	.word	0x4d7728d3
	.word	0xb679e388
	.word	0x47a8f6e0
	.word	0x3762f121
	.word	0x42554df6
	.word	0x7b60c76a
	.word	0xfc40ea55
	.word	0xd68751e0
	.word	0x78ad6d75
	.word	0x49cc387b
	.word	0x6c5439f4
	.word	0x7d63b4bf
	.word	0xe1bddb79
	.word	0x6ad2b5d4
	.word	0xc16691bb
	.word	0x53549fae
	.word	0x2cc58e0e
	.word	0x917a2486
	.word	0x7aa8c524
	.word	0x341b3d2e
	.word	0xb36b72e3
	.word	0x62756c12
	.word	0x6634a483
	.word	0x003f0fdf
	.word	0x5f1edd4d
	.word	0xa4bae61f
	.word	0x8b6644b1
	.word	0xde9ecb57
	.word	0x72025091
	.word	0x2de59566
	.word	0x688f9cee
	.word	0x27f56634
	.word	0x5f422a62
	.word	0x85fe57f0
	.word	0xd2ad9f03
	.word	0xd3d5b974
	.word	0xfcccf1a8
	.word	0x3e698883
	.word	0xe6942da7
	.word	0x83f04103
	.word	0xdb7b4d82
	.word	0x9288c359
	.word	0x32789523
	.word	0x0b9bd195
	.word	0x4711e88e
	.word	0x9567c213
	.word	0xd3186a38
	.word	0xf7d357b5
	.word	0xa567c467
	.word	0x99c682ed
	.word	0x1b34f340
	.word	0xe467f41e
	.word	0xb79fc16f
	.word	0xc8422f31
	.word	0x4cf97f92
	.word	0xa7480949
	.word	0xba0c5ecd
	.word	0xcd8174f0
	.word	0x6565512b
	.word	0xafb10e47
	.word	0xe340f6b9
	.word	0xf76047f0
	.word	0x5037fc89
	.word	0x9e2b3ad0
	.word	0x3143faf6
	.word	0xf7623de0
	.word	0x896962da
	.word	0xa08b609b
	.word	0x7109f5a0
	.word	0x4171f9d2
	.word	0x1624aa56
	.word	0xa42885ef
	.word	0xa0995227
	.word	0xc3675ae9
	.word	0x5ccfd8e8
	.word	0xed381579
	.word	0x23b3329b
	.word	0x93356251
	.word	0x201ff513
	.word	0x1e1cb760
	.word	0x2dddd529
	.word	0x7a3c046f
	.word	0x46d3d113
	.word	0x91a12796
	.word	0x77714de5
	.word	0xb3495959
	.word	0x16ade442
	.word	0x10d99d71
	.word	0x060f98c9
	.word	0x3998e088
	.word	0xafe7d6bd
	.word	0x25fb9879
	.word	0xfffd47fd
	.word	0x10d6cbcc
	.word	0x5ce0a347
	.word	0x72252683
	.word	0x2d605258
	.word	0x9418857f
	.word	0x4a70736d
	.word	0xaa09f6fe
	.word	0xb6bec626
	.word	0x2b1ae5fd
	.word	0x765b99e9
	.word	0xf60dcf8c
	.word	0xa56f642b
	.word	0x8529cc53
	.word	0xb5104f4b
	.word	0xfab935d4
	.word	0xb54a66e8
	.word	0x5f1c0e35
	.word	0x247114d5
	.word	0x6fee6296
	.word	0xb708fa1c
	.word	0xd109f335
	.word	0xe127e1a7
	.word	0xe511d1ff
	.word	0x6ca6268d
	.word	0x8813af32
	.word	0x6d1c7e1b
	.word	0xafbb053e
	.word	0xc4fc3607
	.word	0x3bf0900e
	.word	0x9a6ab172
	.word	0x6eb74956
	.word	0x4605d3a4
	.word	0x2656d2a3
	.word	0x94db25af
	.word	0x7d719735
	.word	0x6dda6c4e
	.word	0x7ed752f6
	.word	0x86ac25c3
	.word	0xf96fe106
	.word	0xbdf19382
	.word	0xafc78bad
	.word	0x72a599e9
	.word	0xf5c760c2
	.word	0xeab17056
	.word	0x838798be
	.word	0xf745e653
	.word	0x5c6ebc0d
	.word	0x770876bc
	.word	0x44193169
	.word	0x6b8b9006
	.word	0x146e113f
	.word	0x8912f108
	.word	0x3cd7cd67
	.word	0xefb9cc01
	.word	0xeb5a41c0
	.word	0x75d11daf
	.word	0x3e716963
	.word	0xd1b45ca4
	.word	0xa98a0d98
	.word	0xd6fae551
	.word	0x63429ea9
	.word	0xd7716150
	.word	0xa848d445
	.word	0xb34a6cf8
	.word	0x0530021d
	.word	0x58c5fc4a
	.word	0x51340ecf
	.word	0x976708a2
	.word	0x7941fe6d
t0_data_exp_sp:
	.word	0x66bcf2e4
	.word	0x8b2dd71a
	.word	0x782e51fc
	.word	0x07e79d8a
	.word	0xcff4abde
	.word	0x4520107a
	.word	0xdeb16770
	.word	0xbe17f553
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffff9
	.word	0xffffffee
	.word	0xfffffffc
	.word	0x00000018
	.word	t0_data_exp_fp
	.word	0x09c38f43
	.word	0xc5fffbb5
	.word	0x20ef452d
	.word	0xdbda5b2c
	.word	0x2daa1941
	.word	0xb003c993
	.word	0xfe443495
	.word	0xdb8af366
	.word	0x09951767
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
	.word   	0xfd5b596d	! [%fp - 0xc]
	.word   	0xd97ddb82	! [%fp - 0x8]
	.word   	0x78a80a5f	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x28bac0af
	.word	0x63ce2b40
	.word	0x47fdf3e1
	.word	0x9fce839f
	.word	0x2a3f2338
	.word	0x243e6b1a
	.word	0x0693140c
	.word	0x495c77d9
	.word	0x2ac0e5a2
	.word	0x82b8b9dc
	.word	0x5341423b
	.word	0x6f42354f
	.word	0x48e0499b
	.word	0x38b13e41
	.word	0x963bcb3a
	.word	0x7c386274
	.word	0xc99b43ba
	.word	0x7d12421e
	.word	0xe419505c
	.word	0xf56326d2
	.word	0x53b2bc8b
	.word	0x9d40dfeb
	.word	0xc66640af
	.word	0x4d847e2e
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x2ce82000)
.seg "data"
t0_data_exp_area0_start:
.skip 960
t0_data_exp_area0_begin:
	.word	0xeffa4eea	! t0_data_exp_area0-0x20
	.word	0x11808481	! t0_data_exp_area0-0x1c
	.word	0xe9493170	! t0_data_exp_area0-0x18
	.word	0x9e5e19e9	! t0_data_exp_area0-0x14
	.word	0x68b51794	! t0_data_exp_area0-0x10
	.word	0x2e664925	! t0_data_exp_area0-0xc
	.word	0xc02fc9c1	! t0_data_exp_area0-0x8
	.word	0x840574a8	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x893769fa	! t0_data_exp_area0+0x0
	.word	0x109969c4	! t0_data_exp_area0+0x4
	.word	0xcfb23599	! t0_data_exp_area0+0x8
	.word	0x7cf2fc37	! t0_data_exp_area0+0xc
	.word	0xfa2e7e58	! t0_data_exp_area0+0x10
	.word	0xa02e5b80	! t0_data_exp_area0+0x14
	.word	0x2b4653fb	! t0_data_exp_area0+0x18
	.word	0x1abf75aa	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 7168
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x6e042000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xb36c6d06	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xd1be476b	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x693b146a	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x7910ffc5	! t0_data_exp_shm_area+0xc (t0)
	.word	0x7b280b0e	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xe534ed91	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x1a07b79b	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xfc6b579d	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xc1857bfe	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xd96b343b	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xe881e76c	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x4fad437e	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x7f358cfe	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xb044e772	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x5a48da15	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x1f3f480f	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x14472d24	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x456c6cc2	! t0_data_exp_shm_area+0x44
	.word	0x91e2f49c	! t0_data_exp_shm_area+0x48
	.word	0xba960bb4	! t0_data_exp_shm_area+0x4c
	.word	0x8a279706	! t0_data_exp_shm_area+0x50
	.word	0x3a2f6f3f	! t0_data_exp_shm_area+0x54
	.word	0x09eea08e	! t0_data_exp_shm_area+0x58
	.word	0xc1ed0c33	! t0_data_exp_shm_area+0x5c
	.word	0xf682ff90	! t0_data_exp_shm_area+0x60
	.word	0xefabc7cd	! t0_data_exp_shm_area+0x64
	.word	0x899e48eb	! t0_data_exp_shm_area+0x68
	.word	0x6d448a99	! t0_data_exp_shm_area+0x6c
	.word	0x0580de18	! t0_data_exp_shm_area+0x70
	.word	0x55ac259b	! t0_data_exp_shm_area+0x74
	.word	0x49c2b261	! t0_data_exp_shm_area+0x78
	.word	0x04f7d15e	! t0_data_exp_shm_area+0x7c
	.word	0x35f421af	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xdc883aef	! t0_data_exp_shm_area+0x84
	.word	0x962622bd	! t0_data_exp_shm_area+0x88
	.word	0x71ef38c7	! t0_data_exp_shm_area+0x8c
	.word	0xf2c8e7ba	! t0_data_exp_shm_area+0x90
	.word	0x83547228	! t0_data_exp_shm_area+0x94
	.word	0x0c2e0b9e	! t0_data_exp_shm_area+0x98
	.word	0x9dc38d8b	! t0_data_exp_shm_area+0x9c
	.word	0x277e87c0	! t0_data_exp_shm_area+0xa0
	.word	0x75e96f01	! t0_data_exp_shm_area+0xa4
	.word	0xc4e02c6b	! t0_data_exp_shm_area+0xa8
	.word	0xd85ebdb9	! t0_data_exp_shm_area+0xac
	.word	0xfb160884	! t0_data_exp_shm_area+0xb0
	.word	0x280be012	! t0_data_exp_shm_area+0xb4
	.word	0x48c35f86	! t0_data_exp_shm_area+0xb8
	.word	0xeaffefd8	! t0_data_exp_shm_area+0xbc
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



