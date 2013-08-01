/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: v9_kao_02_14_04_103.s
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
#define T0_KAOS_SEED          d33f396684c7
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    6336
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5003

#define T0_KAOS_BOOT_VA                  0x47ba8000
#define T0_KAOS_BOOT_PA                  0x000000000111e000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x123ca000
#define T0_KAOS_STARTUP_PA               0x00000000023a6000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x2f0f6000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000058c0000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x5d958000
#define T0_KAOS_DONE_PA                  0x0000000007192000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x70a5e000
#define T0_KAOS_KTBL_PA                  0x0000000008a1c000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x70c3c000
#define T0_KAOS_SUBR0_PA                 0x000000000aff6000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x709f0000
#define T0_KAOS_SUBR1_PA                 0x000000000dce8000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x709e6000
#define T0_KAOS_SUBR2_PA                 0x000000000fc30000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x70a0e000
#define T0_KAOS_SUBR3_PA                 0x0000000010110000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x644a4000
#define T0_KAOS_EXP_REGS_PA              0x0000000012d60000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x507c8000
#define T0_KAOS_RUN_REGS_PA              0x0000000015f32000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x33612000
#define T0_KAOS_EXP_STACK_PA             0x0000000017bd0000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x553f4000
#define T0_KAOS_RUN_STACK_PA             0x00000000190f0000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x48a96000
#define T0_KAOS_EXP_AREA0_PA             0x000000001ab92000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x4cdf4000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d6a2000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x2bb60000
#define T0_KAOS_EXP_SHM_AREA_PA          0x00000000016ba000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x00e14000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000019c2000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x4c3db4a9
#define T0_KAOS_RANVAL_01     0xb0b61f6d
#define T0_KAOS_RANVAL_02     0x766137fd
#define T0_KAOS_RANVAL_03     0xc3f5a0c8
#define T0_KAOS_RANVAL_04     0x833c2986
#define T0_KAOS_RANVAL_05     0xa4afa6c2
#define T0_KAOS_RANVAL_06     0x7014d4de
#define T0_KAOS_RANVAL_07     0xa3057d61
#define T0_KAOS_RANVAL_08     0x8f3833de
#define T0_KAOS_RANVAL_09     0x4864cf12
#define T0_KAOS_RANVAL_0a     0x9a78a15a
#define T0_KAOS_RANVAL_0b     0x217969fc
#define T0_KAOS_RANVAL_0c     0x007ca5ff
#define T0_KAOS_RANVAL_0d     0x473897ff
#define T0_KAOS_RANVAL_0e     0xcfcd7367
#define T0_KAOS_RANVAL_0f     0x4b040e5a
#define T0_KAOS_RANVAL_10     0xdeb261e0
#define T0_KAOS_RANVAL_11     0x3846d54d
#define T0_KAOS_RANVAL_12     0xb89d1f7d
#define T0_KAOS_RANVAL_13     0x68a87531
#define T0_KAOS_RANVAL_14     0xad3bc364
#define T0_KAOS_RANVAL_15     0x897985d9
#define T0_KAOS_RANVAL_16     0xd0dfb67c
#define T0_KAOS_RANVAL_17     0x6d603e3f
#define T0_KAOS_RANVAL_18     0x8165eae0
#define T0_KAOS_RANVAL_19     0x652825c9
#define T0_KAOS_RANVAL_1a     0x309c3dcc
#define T0_KAOS_RANVAL_1b     0xc12a5da2
#define T0_KAOS_RANVAL_1c     0xf105abda
#define T0_KAOS_RANVAL_1d     0x5e1d7004
#define T0_KAOS_RANVAL_1e     0xe51a45c5
#define T0_KAOS_RANVAL_1f     0x2475fc66
#define T0_KAOS_RANVAL_20     0x4d2e2414
#define T0_KAOS_RANVAL_21     0x2ab342e4
#define T0_KAOS_RANVAL_22     0x992c0251
#define T0_KAOS_RANVAL_23     0xd9024e60
#define T0_KAOS_RANVAL_24     0x1b0b3ec8
#define T0_KAOS_RANVAL_25     0x667b9c2a
#define T0_KAOS_RANVAL_26     0xb96ec9d0
#define T0_KAOS_RANVAL_27     0xb5857139
#define T0_KAOS_RANVAL_28     0x5ccaa834
#define T0_KAOS_RANVAL_29     0xdde8e032
#define T0_KAOS_RANVAL_2a     0x96da1e3b
#define T0_KAOS_RANVAL_2b     0x03f9a8cd
#define T0_KAOS_RANVAL_2c     0x1221f558
#define T0_KAOS_RANVAL_2d     0x6fd6e067
#define T0_KAOS_RANVAL_2e     0x14d3a48b
#define T0_KAOS_RANVAL_2f     0x58918cb5
#define T0_KAOS_RANVAL_30     0x7ba903fd
#define T0_KAOS_RANVAL_31     0xe8f954f8
#define T0_KAOS_RANVAL_32     0xa280ae5b
#define T0_KAOS_RANVAL_33     0x1648fb22
#define T0_KAOS_RANVAL_34     0x7a2bd6f9
#define T0_KAOS_RANVAL_35     0x2c4bbdcb
#define T0_KAOS_RANVAL_36     0xef7439cc
#define T0_KAOS_RANVAL_37     0x4f11e4ec
#define T0_KAOS_RANVAL_38     0xbb8772b1
#define T0_KAOS_RANVAL_39     0x7ce9deb1
#define T0_KAOS_RANVAL_3a     0x74628ba8
#define T0_KAOS_RANVAL_3b     0xa5f946ea
#define T0_KAOS_RANVAL_3c     0xedd97ddf
#define T0_KAOS_RANVAL_3d     0x40774adb
#define T0_KAOS_RANVAL_3e     0x6771c7c9
#define T0_KAOS_RANVAL_3f     0xf291e483
#define T0_KAOS_RANVAL_40     0x9002aa95
#define T0_KAOS_RANVAL_41     0x38afb38d
#define T0_KAOS_RANVAL_42     0x8b512bbb
#define T0_KAOS_RANVAL_43     0x93b79785
#define T0_KAOS_RANVAL_44     0x17f82b82
#define T0_KAOS_RANVAL_45     0x1620ee11
#define T0_KAOS_RANVAL_46     0xdeb6cfa0
#define T0_KAOS_RANVAL_47     0xad974935
#define T0_KAOS_RANVAL_48     0x7c60b972
#define T0_KAOS_RANVAL_49     0xb0aae4ed
#define T0_KAOS_RANVAL_4a     0x117e1154
#define T0_KAOS_RANVAL_4b     0x5914e8a6
#define T0_KAOS_RANVAL_4c     0xebbded1b
#define T0_KAOS_RANVAL_4d     0xe370e857
#define T0_KAOS_RANVAL_4e     0xbb9f0dd1
#define T0_KAOS_RANVAL_4f     0x0269f24e
#define T0_KAOS_RANVAL_50     0xd82af115
#define T0_KAOS_RANVAL_51     0x74ab11e9
#define T0_KAOS_RANVAL_52     0x32d9ccd3
#define T0_KAOS_RANVAL_53     0x9f6c5cd5
#define T0_KAOS_RANVAL_54     0xf7c5d02a
#define T0_KAOS_RANVAL_55     0xfd7daf90
#define T0_KAOS_RANVAL_56     0xfc7602be
#define T0_KAOS_RANVAL_57     0xdc96ff30
#define T0_KAOS_RANVAL_58     0x6f68e3d0
#define T0_KAOS_RANVAL_59     0x0de7e9ca
#define T0_KAOS_RANVAL_5a     0xd3228cbf
#define T0_KAOS_RANVAL_5b     0x0fe9c3ee
#define T0_KAOS_RANVAL_5c     0xd3ae26f2
#define T0_KAOS_RANVAL_5d     0xdc3a1910
#define T0_KAOS_RANVAL_5e     0x0c0e0b32
#define T0_KAOS_RANVAL_5f     0x6b493dd2
#define T0_KAOS_RANVAL_60     0xcb8e70f6
#define T0_KAOS_RANVAL_61     0x71977e90
#define T0_KAOS_RANVAL_62     0x74043e43
#define T0_KAOS_RANVAL_63     0x226a71a1
#define T0_KAOS_RANVAL_64     0xf48adcfb
#define T0_KAOS_RANVAL_65     0x2d0e541e
#define T0_KAOS_RANVAL_66     0x0bf208d7
#define T0_KAOS_RANVAL_67     0xabd0e93b
#define T0_KAOS_RANVAL_68     0xc26ee162
#define T0_KAOS_RANVAL_69     0x900c676c
#define T0_KAOS_RANVAL_6a     0x05ec3dac
#define T0_KAOS_RANVAL_6b     0xee3263f0
#define T0_KAOS_RANVAL_6c     0xc89ddb90
#define T0_KAOS_RANVAL_6d     0xf0a5b479
#define T0_KAOS_RANVAL_6e     0x16f39abe
#define T0_KAOS_RANVAL_6f     0x9cf4b80c
#define T0_KAOS_RANVAL_70     0x80c713f1
#define T0_KAOS_RANVAL_71     0xfb85b347
#define T0_KAOS_RANVAL_72     0x507296ec
#define T0_KAOS_RANVAL_73     0xa4afb9b3
#define T0_KAOS_RANVAL_74     0xd7077e3f
#define T0_KAOS_RANVAL_75     0xe7bb4cd0
#define T0_KAOS_RANVAL_76     0xd517e5db
#define T0_KAOS_RANVAL_77     0xcce63af4
#define T0_KAOS_RANVAL_78     0xa630ba03
#define T0_KAOS_RANVAL_79     0x1d1aab3a
#define T0_KAOS_RANVAL_7a     0x997ad61a
#define T0_KAOS_RANVAL_7b     0x6bc67917
#define T0_KAOS_RANVAL_7c     0xc461175c
#define T0_KAOS_RANVAL_7d     0x81ef5949
#define T0_KAOS_RANVAL_7e     0x1824ed87
#define T0_KAOS_RANVAL_7f     0x94f38b39
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
!    areaoffset     6336
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5003
!    code           70a5e000
!    entry          70a5e000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d33f396684c7
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

KTEXT_MODULE(t0_module_ktbl, 0x70a5e000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xf426001c	! t0_kref+0x0:   	st	%i2, [%i0 + %i4]
	.word	0x3b480003	! t0_kref+0x4:   	fble,a,pt	%fcc0, _kref+0x10
	.word	0x900b32dd	! t0_kref+0x8:   	and	%o4, -0xd23, %o0
	.word	0x9da0053b	! t0_kref+0xc:   	fsqrts	%f27, %f14
	.word	0xa67262cd	! t0_kref+0x10:   	udiv	%o1, 0x2cd, %l3
	.word	0xeed6101b	! t0_kref+0x14:   	ldsha	[%i0 + %i3]0x80, %l7
	.word	0xada01a3a	! t0_kref+0x18:   	fstoi	%f26, %f22
	.word	0xa9a0052e	! t0_kref+0x1c:   	fsqrts	%f14, %f20
	.word	0x37800008	! t0_kref+0x20:   	fbge,a	_kref+0x40
	.word	0xea20a008	! t0_kref+0x24:   	st	%l5, [%g2 + 8]
	.word	0xe8be5000	! t0_kref+0x28:   	stda	%l4, [%i1]0x80
	.word	0xa7a01a37	! t0_kref+0x2c:   	fstoi	%f23, %f19
	.word	0xab254017	! t0_kref+0x30:   	mulscc	%l5, %l7, %l5
	.word	0xd020a018	! t0_kref+0x34:   	st	%o0, [%g2 + 0x18]
	.word	0xc807bfe8	! t0_kref+0x38:   	ld	[%fp - 0x18], %g4
	.word	0xf207bfe0	! t0_kref+0x3c:   	ld	[%fp - 0x20], %i1
	.word	0xb9a01898	! t0_kref+0x40:   	fitos	%f24, %f28
	.word	0x28800001	! t0_kref+0x44:   	bleu,a	_kref+0x48
	.word	0xa1b44efd	! t0_kref+0x48:   	fornot2s	%f17, %f29, %f16
	.word	0xdd1e3ff8	! t0_kref+0x4c:   	ldd	[%i0 - 8], %f14
	.word	0x2b480006	! t0_kref+0x50:   	fbug,a,pt	%fcc0, _kref+0x68
	.word	0xa9b70ab6	! t0_kref+0x54:   	fpsub16s	%f28, %f22, %f20
	.word	0x9fc10000	! t0_kref+0x58:   	call	%g4
	.word	0xac0b39e9	! t0_kref+0x5c:   	and	%o4, -0x617, %l6
	.word	0xb9b74a2f	! t0_kref+0x60:   	fpadd16s	%f29, %f15, %f28
	.word	0x8143c000	! t0_kref+0x64:   	stbar
	.word	0xa6703e0d	! t0_kref+0x68:   	udiv	%g0, -0x1f3, %l3
	.word	0xb1a0055e	! t0_kref+0x6c:   	fsqrtd	%f30, %f24
	.word	0xafa01a56	! t0_kref+0x70:   	fdtoi	%f22, %f23
	.word	0x22480005	! t0_kref+0x74:   	be,a,pt	%icc, _kref+0x88
	.word	0x9db5c70c	! t0_kref+0x78:   	fmuld8sux16	%f23, %f12, %f14
	.word	0x80d6ae1d	! t0_kref+0x7c:   	umulcc	%i2, 0xe1d, %g0
	.word	0x3b800002	! t0_kref+0x80:   	fble,a	_kref+0x88
	.word	0xa835a6f2	! t0_kref+0x84:   	orn	%l6, 0x6f2, %l4
	.word	0xa82a4017	! t0_kref+0x88:   	andn	%o1, %l7, %l4
	.word	0x9de3bfa0	! t0_kref+0x8c:   	save	%sp, -0x60, %sp
	.word	0xb61f39f4	! t0_kref+0x90:   	xor	%i4, -0x60c, %i3
	.word	0x95eeec23	! t0_kref+0x94:   	restore	%i3, 0xc23, %o2
	.word	0xdf264000	! t0_kref+0x98:   	st	%f15, [%i1]
	.word	0x90d5f1c8	! t0_kref+0x9c:   	umulcc	%l7, -0xe38, %o0
	.word	0x99a0104e	! t0_kref+0xa0:   	fdtox	%f14, %f12
	.word	0xadb70e80	! t0_kref+0xa4:   	fsrc1	%f28, %f22
	.word	0xa9a00554	! t0_kref+0xa8:   	fsqrtd	%f20, %f20
	.word	0x81ad8a5e	! t0_kref+0xac:   	fcmpd	%fcc0, %f22, %f30
	.word	0x81dafbd1	! t0_kref+0xb0:   	flush	%o3 - 0x42f
	.word	0xb3b74a38	! t0_kref+0xb4:   	fpadd16s	%f29, %f24, %f25
	.word	0xb9a0052d	! t0_kref+0xb8:   	fsqrts	%f13, %f28
	.word	0xee36001b	! t0_kref+0xbc:   	sth	%l7, [%i0 + %i3]
	.word	0xa6300015	! t0_kref+0xc0:   	orn	%g0, %l5, %l3
	.word	0xa5a00558	! t0_kref+0xc4:   	fsqrtd	%f24, %f18
	.word	0xa9a00552	! t0_kref+0xc8:   	fsqrtd	%f18, %f20
	.word	0xb1a018d6	! t0_kref+0xcc:   	fdtos	%f22, %f24
	.word	0x81ac8a32	! t0_kref+0xd0:   	fcmps	%fcc0, %f18, %f18
	.word	0xd020a00c	! t0_kref+0xd4:   	st	%o0, [%g2 + 0xc]
	.word	0xa522c01a	! t0_kref+0xd8:   	mulscc	%o3, %i2, %l2
	.word	0xe1062014	! t0_kref+0xdc:   	ld	[%i0 + 0x14], %f16
	.word	0xb1aa405c	! t0_kref+0xe0:   	fmovde	%fcc0, %f28, %f24
	.word	0xac62801a	! t0_kref+0xe4:   	subc	%o2, %i2, %l6
	.word	0xc008a039	! t0_kref+0xe8:   	ldub	[%g2 + 0x39], %g0
	.word	0x9ae33057	! t0_kref+0xec:   	subccc	%o4, -0xfa9, %o5
	.word	0x97b3049c	! t0_kref+0xf0:   	fcmple32	%f12, %f28, %o3
	.word	0x2e800005	! t0_kref+0xf4:   	bvs,a	_kref+0x108
	.word	0xf91e6010	! t0_kref+0xf8:   	ldd	[%i1 + 0x10], %f28
	.word	0xec3e4000	! t0_kref+0xfc:   	std	%l6, [%i1]
	.word	0x8143c000	! t0_kref+0x100:   	stbar
	.word	0xea064000	! t0_kref+0x104:   	ld	[%i1], %l5
	.word	0xd81f4019	! t0_kref+0x108:   	ldd	[%i5 + %i1], %o4
	.word	0xb1b606ce	! t0_kref+0x10c:   	fmul8sux16	%f24, %f14, %f24
	.word	0xa535a003	! t0_kref+0x110:   	srl	%l6, 0x3, %l2
	.word	0xea8e101a	! t0_kref+0x114:   	lduba	[%i0 + %i2]0x80, %l5
	.word	0x9db00c00	! t0_kref+0x118:   	fzero	%f14
	.word	0xc036c018	! t0_kref+0x11c:   	clrh	[%i3 + %i0]
	.word	0x21800003	! t0_kref+0x120:   	fbn,a	_kref+0x12c
	.word	0x9bb6055e	! t0_kref+0x124:   	fcmpeq16	%f24, %f30, %o5
	.word	0x3a480002	! t0_kref+0x128:   	bcc,a,pt	%icc, _kref+0x130
	.word	0xb5b68c96	! t0_kref+0x12c:   	fandnot2	%f26, %f22, %f26
	.word	0x31480001	! t0_kref+0x130:   	fba,a,pt	%fcc0, _kref+0x134
	.word	0xa45a70b9	! t0_kref+0x134:   	smul	%o1, -0xf47, %l2
	.word	0x90d3400d	! t0_kref+0x138:   	umulcc	%o5, %o5, %o0
	.word	0x31480002	! t0_kref+0x13c:   	fba,a,pt	%fcc0, _kref+0x144
	.word	0xe6c81018	! t0_kref+0x140:   	ldsba	[%g0 + %i0]0x80, %l3
	.word	0x81b7849a	! t0_kref+0x144:   	fcmple32	%f30, %f26, %g0
	.word	0x94a2f76a	! t0_kref+0x148:   	subcc	%o3, -0x896, %o2
	.word	0xda40a030	! t0_kref+0x14c:   	ldsw	[%g2 + 0x30], %o5
	.word	0x9fa58834	! t0_kref+0x150:   	fadds	%f22, %f20, %f15
	.word	0x9335c016	! t0_kref+0x154:   	srl	%l7, %l6, %o1
	.word	0xac15800a	! t0_kref+0x158:   	or	%l6, %o2, %l6
	.word	0xd6562014	! t0_kref+0x15c:   	ldsh	[%i0 + 0x14], %o3
	.word	0x941a400a	! t0_kref+0x160:   	xor	%o1, %o2, %o2
	.word	0xac928009	! t0_kref+0x164:   	orcc	%o2, %o1, %l6
	.word	0x80926460	! t0_kref+0x168:   	orcc	%o1, 0x460, %g0
	.word	0x81dea120	! t0_kref+0x16c:   	flush	%i2 + 0x120
	.word	0xd620a014	! t0_kref+0x170:   	st	%o3, [%g2 + 0x14]
	.word	0xaa75b189	! t0_kref+0x174:   	udiv	%l6, -0xe77, %l5
	.word	0x38800005	! t0_kref+0x178:   	bgu,a	_kref+0x18c
	.word	0xd228a031	! t0_kref+0x17c:   	stb	%o1, [%g2 + 0x31]
	.word	0xa3a01a3a	! t0_kref+0x180:   	fstoi	%f26, %f17
	.word	0x9132801a	! t0_kref+0x184:   	srl	%o2, %i2, %o0
	.word	0x173cc83f	! t0_kref+0x188:   	sethi	%hi(0xf320fc00), %o3
	.word	0x33800008	! t0_kref+0x18c:   	fbe,a	_kref+0x1ac
	.word	0xada788de	! t0_kref+0x190:   	fsubd	%f30, %f30, %f22
	.word	0x30480001	! t0_kref+0x194:   	ba,a,pt	%icc, _kref+0x198
	.word	0xf726600c	! t0_kref+0x198:   	st	%f27, [%i1 + 0xc]
	.word	0xc0a6101c	! t0_kref+0x19c:   	sta	%g0, [%i0 + %i4]0x80
	.word	0xec28a014	! t0_kref+0x1a0:   	stb	%l6, [%g2 + 0x14]
	.word	0xd07e4000	! t0_kref+0x1a4:   	swap	[%i1], %o0
	.word	0xd8801018	! t0_kref+0x1a8:   	lda	[%g0 + %i0]0x80, %o4
	.word	0xdd1e3ff0	! t0_kref+0x1ac:   	ldd	[%i0 - 0x10], %f14
	.word	0xada00532	! t0_kref+0x1b0:   	fsqrts	%f18, %f22
	.word	0xea68a01a	! t0_kref+0x1b4:   	ldstub	[%g2 + 0x1a], %l5
	.word	0x8143e040	! t0_kref+0x1b8:   	membar	0x40
	.word	0xb9a5885e	! t0_kref+0x1bc:   	faddd	%f22, %f30, %f28
	.word	0xb5a00554	! t0_kref+0x1c0:   	fsqrtd	%f20, %f26
	.word	0x9de3bfa0	! t0_kref+0x1c4:   	save	%sp, -0x60, %sp
	.word	0xb63eb152	! t0_kref+0x1c8:   	xnor	%i2, -0xeae, %i3
	.word	0xa9ef786b	! t0_kref+0x1cc:   	restore	%i5, -0x795, %l4
	.word	0xae5af3e3	! t0_kref+0x1d0:   	smul	%o3, -0xc1d, %l7
	.word	0xa3a01893	! t0_kref+0x1d4:   	fitos	%f19, %f17
	.word	0x2d800007	! t0_kref+0x1d8:   	fbg,a	_kref+0x1f4
	.word	0x96d5800a	! t0_kref+0x1dc:   	umulcc	%l6, %o2, %o3
	.word	0xc807bfe8	! t0_kref+0x1e0:   	ld	[%fp - 0x18], %g4
	.word	0xbda000d0	! t0_kref+0x1e4:   	fnegd	%f16, %f30
	.word	0xa1a3c83b	! t0_kref+0x1e8:   	fadds	%f15, %f27, %f16
	.word	0x2f185686	! t0_kref+0x1ec:   	sethi	%hi(0x615a1800), %l7
	.word	0xc1ee5015	! t0_kref+0x1f0:   	prefetcha	%i1 + %l5, 0
	.word	0xb1a0191b	! t0_kref+0x1f4:   	fitod	%f27, %f24
	.word	0xa9a018cc	! t0_kref+0x1f8:   	fdtos	%f12, %f20
	.word	0xa9a509ce	! t0_kref+0x1fc:   	fdivd	%f20, %f14, %f20
	.word	0xd036c019	! t0_kref+0x200:   	sth	%o0, [%i3 + %i1]
	.word	0xbda00532	! t0_kref+0x204:   	fsqrts	%f18, %f30
	.word	0x3c480006	! t0_kref+0x208:   	bpos,a,pt	%icc, _kref+0x220
	.word	0xa7800009	! t0_kref+0x20c:   	mov	%o1, %gsr
	.word	0xec30a000	! t0_kref+0x210:   	sth	%l6, [%g2]
	.word	0xe868a016	! t0_kref+0x214:   	ldstub	[%g2 + 0x16], %l4
	.word	0xa4b5f2a5	! t0_kref+0x218:   	orncc	%l7, -0xd5b, %l2
	.word	0xf91e401d	! t0_kref+0x21c:   	ldd	[%i1 + %i5], %f28
	.word	0xef20a034	! t0_kref+0x220:   	st	%f23, [%g2 + 0x34]
	.word	0xbdb00c20	! t0_kref+0x224:   	fzeros	%f30
	.word	0xc0063fec	! t0_kref+0x228:   	ld	[%i0 - 0x14], %g0
	.word	0xecc01019	! t0_kref+0x22c:   	ldswa	[%g0 + %i1]0x80, %l6
	.word	0xaad32141	! t0_kref+0x230:   	umulcc	%o4, 0x141, %l5
	.word	0xee262008	! t0_kref+0x234:   	st	%l7, [%i0 + 8]
	.word	0xb5a00532	! t0_kref+0x238:   	fsqrts	%f18, %f26
	.word	0xb5a018d6	! t0_kref+0x23c:   	fdtos	%f22, %f26
	.word	0xb5a5885a	! t0_kref+0x240:   	faddd	%f22, %f26, %f26
	.word	0xf19f1a59	! t0_kref+0x244:   	ldda	[%i4 + %i1]0xd2, %f24
	.word	0xbda0189a	! t0_kref+0x248:   	fitos	%f26, %f30
	.word	0x9ad5c01a	! t0_kref+0x24c:   	umulcc	%l7, %i2, %o5
	.word	0xd81e001d	! t0_kref+0x250:   	ldd	[%i0 + %i5], %o4
	.word	0x29800008	! t0_kref+0x254:   	fbl,a	_kref+0x274
	.word	0xaf22c009	! t0_kref+0x258:   	mulscc	%o3, %o1, %l7
	.word	0x9abdb9c5	! t0_kref+0x25c:   	xnorcc	%l6, -0x63b, %o5
	.word	0x27800005	! t0_kref+0x260:   	fbul,a	_kref+0x274
	.word	0x9a432a44	! t0_kref+0x264:   	addc	%o4, 0xa44, %o5
	.word	0x193d8b5a	! t0_kref+0x268:   	sethi	%hi(0xf62d6800), %o4
	.word	0xa9a608da	! t0_kref+0x26c:   	fsubd	%f24, %f26, %f20
	.word	0xe8b81019	! t0_kref+0x270:   	stda	%l4, [%g0 + %i1]0x80
	.word	0x27480002	! t0_kref+0x274:   	fbul,a,pt	%fcc0, _kref+0x27c
	.word	0x9536a00a	! t0_kref+0x278:   	srl	%i2, 0xa, %o2
	.word	0x81ae4a2f	! t0_kref+0x27c:   	fcmps	%fcc0, %f25, %f15
	.word	0xaba01a4e	! t0_kref+0x280:   	fdtoi	%f14, %f21
	.word	0x9ba01a37	! t0_kref+0x284:   	fstoi	%f23, %f13
	.word	0x9335801a	! t0_kref+0x288:   	srl	%l6, %i2, %o1
	.word	0xac700017	! t0_kref+0x28c:   	udiv	%g0, %l7, %l6
	.word	0xe6070005	! t0_kref+0x290:   	ld	[%i4 + %g5], %l3
	.word	0xd228a003	! t0_kref+0x294:   	stb	%o1, [%g2 + 3]
	.word	0xb1b486f4	! t0_kref+0x298:   	fmul8ulx16	%f18, %f20, %f24
	.word	0xda20a03c	! t0_kref+0x29c:   	st	%o5, [%g2 + 0x3c]
	.word	0x94620015	! t0_kref+0x2a0:   	subc	%o0, %l5, %o2
	.word	0xbba308be	! t0_kref+0x2a4:   	fsubs	%f12, %f30, %f29
	.word	0x93b68160	! t0_kref+0x2a8:   	edge32ln	%i2, %g0, %o1
	.word	0xec3e6018	! t0_kref+0x2ac:   	std	%l6, [%i1 + 0x18]
	.word	0x8143c000	! t0_kref+0x2b0:   	stbar
	.word	0x99b38d12	! t0_kref+0x2b4:   	fandnot1	%f14, %f18, %f12
	.word	0xd0000019	! t0_kref+0x2b8:   	ld	[%g0 + %i1], %o0
	.word	0x8143e05b	! t0_kref+0x2bc:   	membar	0x5b
	.word	0xb1b54cad	! t0_kref+0x2c0:   	fandnot2s	%f21, %f13, %f24
	.word	0xec4e4000	! t0_kref+0x2c4:   	ldsb	[%i1], %l6
	.word	0x99b28280	! t0_kref+0x2c8:   	array32	%o2, %g0, %o4
	.word	0xa9b58a9e	! t0_kref+0x2cc:   	fpsub16	%f22, %f30, %f20
	.word	0xa9a018d2	! t0_kref+0x2d0:   	fdtos	%f18, %f20
	.word	0xd8a6501c	! t0_kref+0x2d4:   	sta	%o4, [%i1 + %i4]0x80
	.word	0xaba40837	! t0_kref+0x2d8:   	fadds	%f16, %f23, %f21
	.word	0xdd1e001d	! t0_kref+0x2dc:   	ldd	[%i0 + %i5], %f14
	.word	0xf1be1855	! t0_kref+0x2e0:   	stda	%f24, [%i0 + %l5]0xc2
	.word	0xb1b707d8	! t0_kref+0x2e4:   	pdist	%f28, %f24, %f24
	.word	0xa9a018d6	! t0_kref+0x2e8:   	fdtos	%f22, %f20
	.word	0xa1a01114	! t0_kref+0x2ec:   	fxtod	%f20, %f16
	.word	0xada408d6	! t0_kref+0x2f0:   	fsubd	%f16, %f22, %f22
	.word	0x3e480004	! t0_kref+0x2f4:   	bvc,a,pt	%icc, _kref+0x304
	.word	0x812dc009	! t0_kref+0x2f8:   	sll	%l7, %o1, %g0
	.word	0xee0e200f	! t0_kref+0x2fc:   	ldub	[%i0 + 0xf], %l7
	.word	0xa4b22cc5	! t0_kref+0x300:   	orncc	%o0, 0xcc5, %l2
	.word	0x23800005	! t0_kref+0x304:   	fbne,a	_kref+0x318
	.word	0x99b487dc	! t0_kref+0x308:   	pdist	%f18, %f28, %f12
	.word	0xa476bff0	! t0_kref+0x30c:   	udiv	%i2, -0x10, %l2
	.word	0xd8500018	! t0_kref+0x310:   	ldsh	[%g0 + %i0], %o4
	.word	0xadab0039	! t0_kref+0x314:   	fmovsuge	%fcc0, %f25, %f22
	.word	0x81dd0008	! t0_kref+0x318:   	flush	%l4 + %o0
	.word	0x940d800c	! t0_kref+0x31c:   	and	%l6, %o4, %o2
	.word	0xee280019	! t0_kref+0x320:   	stb	%l7, [%g0 + %i1]
	.word	0xa812000c	! t0_kref+0x324:   	or	%o0, %o4, %l4
	.word	0xa1b4472e	! t0_kref+0x328:   	fmuld8ulx16	%f17, %f14, %f16
	.word	0x8143c000	! t0_kref+0x32c:   	stbar
	.word	0x35800003	! t0_kref+0x330:   	fbue,a	_kref+0x33c
	.word	0xaaaaf9f8	! t0_kref+0x334:   	andncc	%o3, -0x608, %l5
	.word	0xe520a018	! t0_kref+0x338:   	st	%f18, [%g2 + 0x18]
	.word	0xae732ea6	! t0_kref+0x33c:   	udiv	%o4, 0xea6, %l7
	.word	0xe3ee501d	! t0_kref+0x340:   	prefetcha	%i1 + %i5, 17
	.word	0x39800007	! t0_kref+0x344:   	fbuge,a	_kref+0x360
	.word	0xe9ee501a	! t0_kref+0x348:   	prefetcha	%i1 + %i2, 20
	.word	0x2502a8ca	! t0_kref+0x34c:   	sethi	%hi(0xaa32800), %l2
	.word	0xea30a018	! t0_kref+0x350:   	sth	%l5, [%g2 + 0x18]
	.word	0x81aeca2e	! t0_kref+0x354:   	fcmps	%fcc0, %f27, %f14
	.word	0xa8227d57	! t0_kref+0x358:   	sub	%o1, -0x2a9, %l4
	.word	0xa465bb46	! t0_kref+0x35c:   	subc	%l6, -0x4ba, %l2
	.word	0xd250a008	! t0_kref+0x360:   	ldsh	[%g2 + 8], %o1
	.word	0x949d4017	! t0_kref+0x364:   	xorcc	%l5, %l7, %o2
	.word	0x150f2249	! t0_kref+0x368:   	sethi	%hi(0x3c892400), %o2
	.word	0xc0067ff4	! t0_kref+0x36c:   	ld	[%i1 - 0xc], %g0
	.word	0xfb200018	! t0_kref+0x370:   	st	%f29, [%g0 + %i0]
	.word	0x9a1eb2a8	! t0_kref+0x374:   	xor	%i2, -0xd58, %o5
	.word	0x81af8a56	! t0_kref+0x378:   	fcmpd	%fcc0, %f30, %f22
	.word	0x9fc10000	! t0_kref+0x37c:   	call	%g4
	.word	0xe07e7ff4	! t0_kref+0x380:   	swap	[%i1 - 0xc], %l0
	.word	0xa1b70eec	! t0_kref+0x384:   	fornot2s	%f28, %f12, %f16
	.word	0xe4d6d019	! t0_kref+0x388:   	ldsha	[%i3 + %i1]0x80, %l2
	.word	0xfb00a000	! t0_kref+0x38c:   	ld	[%g2], %f29
	.word	0xd906001c	! t0_kref+0x390:   	ld	[%i0 + %i4], %f12
	.word	0xa8d57b90	! t0_kref+0x394:   	umulcc	%l5, -0x470, %l4
	.word	0x9af24009	! t0_kref+0x398:   	udivcc	%o1, %o1, %o5
	.word	0x81254009	! t0_kref+0x39c:   	mulscc	%l5, %o1, %g0
	.word	0x98257a72	! t0_kref+0x3a0:   	sub	%l5, -0x58e, %o4
	.word	0xb1b68adc	! t0_kref+0x3a4:   	fpsub32	%f26, %f28, %f24
	.word	0xb1a00558	! t0_kref+0x3a8:   	fsqrtd	%f24, %f24
	.word	0x9344c000	! t0_kref+0x3ac:   	mov	%gsr, %o1
	.word	0xa7b60a33	! t0_kref+0x3b0:   	fpadd16s	%f24, %f19, %f19
	.word	0x9370000b	! t0_kref+0x3b4:   	popc	%o3, %o1
	.word	0x81dd73a6	! t0_kref+0x3b8:   	flush	%l5 - 0xc5a
	.word	0x9fb2c0ca	! t0_kref+0x3bc:   	edge16l	%o3, %o2, %o7
	.word	0x988dc00c	! t0_kref+0x3c0:   	andcc	%l7, %o4, %o4
	.word	0x21800008	! t0_kref+0x3c4:   	fbn,a	_kref+0x3e4
	.word	0xeb20a028	! t0_kref+0x3c8:   	st	%f21, [%g2 + 0x28]
	.word	0xe9be1816	! t0_kref+0x3cc:   	stda	%f20, [%i0 + %l6]0xc0
	.word	0xec7e0000	! t0_kref+0x3d0:   	swap	[%i0], %l6
	.word	0xee8e501a	! t0_kref+0x3d4:   	lduba	[%i1 + %i2]0x80, %l7
	.word	0x945a8017	! t0_kref+0x3d8:   	smul	%o2, %l7, %o2
	.word	0xd3f61009	! t0_kref+0x3dc:   	casxa	[%i0]0x80, %o1, %o1
	.word	0x80aac015	! t0_kref+0x3e0:   	andncc	%o3, %l5, %g0
	.word	0x991dbf2a	! t0_kref+0x3e4:   	tsubcctv	%l6, -0xd6, %o4
	.word	0xf11e3ff8	! t0_kref+0x3e8:   	ldd	[%i0 - 8], %f24
	.word	0xb7b74db7	! t0_kref+0x3ec:   	fxors	%f29, %f23, %f27
	.word	0x95408000	! t0_kref+0x3f0:   	mov	%ccr, %o2
	.word	0x272529e2	! t0_kref+0x3f4:   	sethi	%hi(0x94a78800), %l3
	.word	0xea28a025	! t0_kref+0x3f8:   	stb	%l5, [%g2 + 0x25]
	.word	0xf420a024	! t0_kref+0x3fc:   	st	%i2, [%g2 + 0x24]
	.word	0xbda01a32	! t0_kref+0x400:   	fstoi	%f18, %f30
	.word	0x9fc00004	! t0_kref+0x404:   	call	%g0 + %g4
	.word	0xda462018	! t0_kref+0x408:   	ldsw	[%i0 + 0x18], %o5
	.word	0x28480004	! t0_kref+0x40c:   	bleu,a,pt	%icc, _kref+0x41c
	.word	0x92a80017	! t0_kref+0x410:   	andncc	%g0, %l7, %o1
	.word	0xafa018d4	! t0_kref+0x414:   	fdtos	%f20, %f23
	.word	0x96357f3a	! t0_kref+0x418:   	orn	%l5, -0xc6, %o3
	.word	0xe8bf5018	! t0_kref+0x41c:   	stda	%l4, [%i5 + %i0]0x80
	.word	0xa822400a	! t0_kref+0x420:   	sub	%o1, %o2, %l4
	.word	0x28480008	! t0_kref+0x424:   	bleu,a,pt	%icc, _kref+0x444
	.word	0xb1a6885c	! t0_kref+0x428:   	faddd	%f26, %f28, %f24
	.word	0xa9332012	! t0_kref+0x42c:   	srl	%o4, 0x12, %l4
	.word	0x98134008	! t0_kref+0x430:   	or	%o5, %o0, %o4
	.word	0xc008a03a	! t0_kref+0x434:   	ldub	[%g2 + 0x3a], %g0
	.word	0xadb50ecc	! t0_kref+0x438:   	fornot2	%f20, %f12, %f22
	.word	0xd6c6501c	! t0_kref+0x43c:   	ldswa	[%i1 + %i4]0x80, %o3
	.word	0x96b68000	! t0_kref+0x440:   	orncc	%i2, %g0, %o3
	.word	0x9bb34df4	! t0_kref+0x444:   	fnands	%f13, %f20, %f13
	.word	0xa62a64fc	! t0_kref+0x448:   	andn	%o1, 0x4fc, %l3
	.word	0x9ad2c000	! t0_kref+0x44c:   	umulcc	%o3, %g0, %o5
	.word	0x96300015	! t0_kref+0x450:   	orn	%g0, %l5, %o3
	.word	0x9f1b4017	! t0_kref+0x454:   	tsubcctv	%o5, %l7, %o7
	.word	0x9fc10000	! t0_kref+0x458:   	call	%g4
	.word	0xd9000019	! t0_kref+0x45c:   	ld	[%g0 + %i1], %f12
	.word	0xa49df67a	! t0_kref+0x460:   	xorcc	%l7, -0x986, %l2
	.word	0xf9be188d	! t0_kref+0x464:   	stda	%f28, [%i0 + %o5]0xc4
	.word	0xf007bfe0	! t0_kref+0x468:   	ld	[%fp - 0x20], %i0
	.word	0xe67e7ff4	! t0_kref+0x46c:   	swap	[%i1 - 0xc], %l3
	.word	0xb9a01a5a	! t0_kref+0x470:   	fdtoi	%f26, %f28
	.word	0x37800003	! t0_kref+0x474:   	fbge,a	_kref+0x480
	.word	0x99702ec9	! t0_kref+0x478:   	popc	0xec9, %o4
	.word	0xe8be1000	! t0_kref+0x47c:   	stda	%l4, [%i0]0x80
	.word	0x9b400000	! t0_kref+0x480:   	mov	%y, %o5
	.word	0xee08a02c	! t0_kref+0x484:   	ldub	[%g2 + 0x2c], %l7
	.word	0x81ae0a3e	! t0_kref+0x488:   	fcmps	%fcc0, %f24, %f30
	.word	0xa1a00558	! t0_kref+0x48c:   	fsqrtd	%f24, %f16
	.word	0x81ac8a39	! t0_kref+0x490:   	fcmps	%fcc0, %f18, %f25
	.word	0x99b009b3	! t0_kref+0x494:   	fexpand	%f19, %f12
	.word	0x33800002	! t0_kref+0x498:   	fbe,a	_kref+0x4a0
	.word	0xdf20a03c	! t0_kref+0x49c:   	st	%f15, [%g2 + 0x3c]
	.word	0xd900a00c	! t0_kref+0x4a0:   	ld	[%g2 + 0xc], %f12
	.word	0xb3a0002c	! t0_kref+0x4a4:   	fmovs	%f12, %f25
	.word	0xbba00534	! t0_kref+0x4a8:   	fsqrts	%f20, %f29
	.word	0xf420a020	! t0_kref+0x4ac:   	st	%i2, [%g2 + 0x20]
	.word	0xb9a018ce	! t0_kref+0x4b0:   	fdtos	%f14, %f28
	.word	0xb5b00fe0	! t0_kref+0x4b4:   	fones	%f26
	.word	0xd2580018	! t0_kref+0x4b8:   	ldx	[%g0 + %i0], %o1
	.word	0xd086101c	! t0_kref+0x4bc:   	lda	[%i0 + %i4]0x80, %o0
	.word	0x99180009	! t0_kref+0x4c0:   	tsubcctv	%g0, %o1, %o4
	.word	0x802ea5af	! t0_kref+0x4c4:   	andn	%i2, 0x5af, %g0
	.word	0xde06001c	! t0_kref+0x4c8:   	ld	[%i0 + %i4], %o7
	.word	0xa9a00552	! t0_kref+0x4cc:   	fsqrtd	%f18, %f20
	.word	0xac702bb7	! t0_kref+0x4d0:   	udiv	%g0, 0xbb7, %l6
	.word	0xb5a018da	! t0_kref+0x4d4:   	fdtos	%f26, %f26
	.word	0x81dec015	! t0_kref+0x4d8:   	flush	%i3 + %l5
	.word	0xf51f4019	! t0_kref+0x4dc:   	ldd	[%i5 + %i1], %f26
	.word	0xf926001c	! t0_kref+0x4e0:   	st	%f28, [%i0 + %i4]
	.word	0x80f2700c	! t0_kref+0x4e4:   	udivcc	%o1, -0xff4, %g0
	.word	0x81ac8a39	! t0_kref+0x4e8:   	fcmps	%fcc0, %f18, %f25
	.word	0x99a00552	! t0_kref+0x4ec:   	fsqrtd	%f18, %f12
	.word	0xe11e0000	! t0_kref+0x4f0:   	ldd	[%i0], %f16
	.word	0xa8728017	! t0_kref+0x4f4:   	udiv	%o2, %l7, %l4
	.word	0x92b2af00	! t0_kref+0x4f8:   	orncc	%o2, 0xf00, %o1
	.word	0xf11e3fe0	! t0_kref+0x4fc:   	ldd	[%i0 - 0x20], %f24
	.word	0xd220a024	! t0_kref+0x500:   	st	%o1, [%g2 + 0x24]
	.word	0xc768a00b	! t0_kref+0x504:   	prefetch	%g2 + 0xb, 3
	.word	0xee2e8018	! t0_kref+0x508:   	stb	%l7, [%i2 + %i0]
	.word	0xec564000	! t0_kref+0x50c:   	ldsh	[%i1], %l6
	.word	0xafb50ea0	! t0_kref+0x510:   	fsrc1s	%f20, %f23
	.word	0xc168a08c	! t0_kref+0x514:   	prefetch	%g2 + 0x8c, 0
	.word	0xed000018	! t0_kref+0x518:   	ld	[%g0 + %i0], %f22
	.word	0xa9a00533	! t0_kref+0x51c:   	fsqrts	%f19, %f20
	.word	0x9db00f0c	! t0_kref+0x520:   	fsrc2	%f12, %f14
	.word	0xac0dfc11	! t0_kref+0x524:   	and	%l7, -0x3ef, %l6
	.word	0xfd00a028	! t0_kref+0x528:   	ld	[%g2 + 0x28], %f30
	.word	0xa1a01039	! t0_kref+0x52c:   	fstox	%f25, %f16
	.word	0xa9b30137	! t0_kref+0x530:   	edge32n	%o4, %l7, %l4
	.word	0xa1a0055a	! t0_kref+0x534:   	fsqrtd	%f26, %f16
	.word	0xd2881018	! t0_kref+0x538:   	lduba	[%g0 + %i0]0x80, %o1
	.word	0x96e2c01a	! t0_kref+0x53c:   	subccc	%o3, %i2, %o3
	.word	0xf91e3fe0	! t0_kref+0x540:   	ldd	[%i0 - 0x20], %f28
	.word	0xa3a000ba	! t0_kref+0x544:   	fnegs	%f26, %f17
	.word	0x9fa7892d	! t0_kref+0x548:   	fmuls	%f30, %f13, %f15
	.word	0xb5a389de	! t0_kref+0x54c:   	fdivd	%f14, %f30, %f26
	.word	0xd676001d	! t0_kref+0x550:   	stx	%o3, [%i0 + %i5]
	.word	0x3d800006	! t0_kref+0x554:   	fbule,a	_kref+0x56c
	.word	0xa736a002	! t0_kref+0x558:   	srl	%i2, 0x2, %l3
	.word	0x80f5fb27	! t0_kref+0x55c:   	udivcc	%l7, -0x4d9, %g0
	.word	0x80c20009	! t0_kref+0x560:   	addccc	%o0, %o1, %g0
	.word	0xb9a389dc	! t0_kref+0x564:   	fdivd	%f14, %f28, %f28
	.word	0xa3a00533	! t0_kref+0x568:   	fsqrts	%f19, %f17
	.word	0xd4062000	! t0_kref+0x56c:   	ld	[%i0], %o2
	.word	0xa45a0000	! t0_kref+0x570:   	smul	%o0, %g0, %l2
	.word	0x9da00552	! t0_kref+0x574:   	fsqrtd	%f18, %f14
	.word	0xb5b00cf4	! t0_kref+0x578:   	fnot2s	%f20, %f26
	.word	0x26480003	! t0_kref+0x57c:   	bl,a,pt	%icc, _kref+0x588
	.word	0xe3ee101c	! t0_kref+0x580:   	prefetcha	%i0 + %i4, 17
	.word	0x96856de2	! t0_kref+0x584:   	addcc	%l5, 0xde2, %o3
	.word	0xa3b00cfc	! t0_kref+0x588:   	fnot2s	%f28, %f17
	.word	0x9e66a276	! t0_kref+0x58c:   	subc	%i2, 0x276, %o7
	.word	0xa4e2e161	! t0_kref+0x590:   	subccc	%o3, 0x161, %l2
	.word	0xec78a000	! t0_kref+0x594:   	swap	[%g2], %l6
	.word	0x35480008	! t0_kref+0x598:   	fbue,a,pt	%fcc0, _kref+0x5b8
	.word	0xb5b00c20	! t0_kref+0x59c:   	fzeros	%f26
	.word	0xa1a589dc	! t0_kref+0x5a0:   	fdivd	%f22, %f28, %f16
	.word	0x946234bc	! t0_kref+0x5a4:   	subc	%o0, -0xb44, %o2
	.word	0xec1e4000	! t0_kref+0x5a8:   	ldd	[%i1], %l6
	.word	0x93400000	! t0_kref+0x5ac:   	mov	%y, %o1
	.word	0xa1b5cd38	! t0_kref+0x5b0:   	fandnot1s	%f23, %f24, %f16
	.word	0x9ba000af	! t0_kref+0x5b4:   	fnegs	%f15, %f13
	.word	0xa8d24016	! t0_kref+0x5b8:   	umulcc	%o1, %l6, %l4
	.word	0xee366016	! t0_kref+0x5bc:   	sth	%l7, [%i1 + 0x16]
	.word	0x9618310b	! t0_kref+0x5c0:   	xor	%g0, -0xef5, %o3
	.word	0xc768a043	! t0_kref+0x5c4:   	prefetch	%g2 + 0x43, 3
	.word	0x28480008	! t0_kref+0x5c8:   	bleu,a,pt	%icc, _kref+0x5e8
	.word	0xb1b30e80	! t0_kref+0x5cc:   	fsrc1	%f12, %f24
	.word	0xb9a00537	! t0_kref+0x5d0:   	fsqrts	%f23, %f28
	.word	0xfd1f4018	! t0_kref+0x5d4:   	ldd	[%i5 + %i0], %f30
	.word	0xea270019	! t0_kref+0x5d8:   	st	%l5, [%i4 + %i1]
	.word	0xb7b00fe0	! t0_kref+0x5dc:   	fones	%f27
	.word	0xa940c000	! t0_kref+0x5e0:   	mov	%asi, %l4
	.word	0xc00e8019	! t0_kref+0x5e4:   	ldub	[%i2 + %i1], %g0
	.word	0xa60e800b	! t0_kref+0x5e8:   	and	%i2, %o3, %l3
	.word	0x9fa00135	! t0_kref+0x5ec:   	fabss	%f21, %f15
	.word	0xc0780018	! t0_kref+0x5f0:   	swap	[%g0 + %i0], %g0
	.word	0xd00e8018	! t0_kref+0x5f4:   	ldub	[%i2 + %i0], %o0
	.word	0xa1a00533	! t0_kref+0x5f8:   	fsqrts	%f19, %f16
	.word	0x982823c6	! t0_kref+0x5fc:   	andn	%g0, 0x3c6, %o4
	.word	0x99a70d3d	! t0_kref+0x600:   	fsmuld	%f28, %f29, %f12
	.word	0xca11401b	! t0_kref+0x604:   	lduh	[%g5 + %i3], %g5
	.word	0xa8ad400c	! t0_kref+0x608:   	andncc	%l5, %o4, %l4
	.word	0xe81f4018	! t0_kref+0x60c:   	ldd	[%i5 + %i0], %l4
	.word	0x9bb2c000	! t0_kref+0x610:   	edge8	%o3, %g0, %o5
	.word	0x9ba0002e	! t0_kref+0x614:   	fmovs	%f14, %f13
	.word	0xc807bfe4	! t0_kref+0x618:   	ld	[%fp - 0x1c], %g4
	.word	0xaaf28017	! t0_kref+0x61c:   	udivcc	%o2, %l7, %l5
	.word	0xf9be1880	! t0_kref+0x620:   	stda	%f28, [%i0]0xc4
	.word	0xaed34017	! t0_kref+0x624:   	umulcc	%o5, %l7, %l7
	.word	0xeb68a086	! t0_kref+0x628:   	prefetch	%g2 + 0x86, 21
	.word	0xec1e001d	! t0_kref+0x62c:   	ldd	[%i0 + %i5], %l6
	.word	0x81224000	! t0_kref+0x630:   	mulscc	%o1, %g0, %g0
	.word	0xee20a018	! t0_kref+0x634:   	st	%l7, [%g2 + 0x18]
	.word	0xd828a010	! t0_kref+0x638:   	stb	%o4, [%g2 + 0x10]
	.word	0xc02e7fe6	! t0_kref+0x63c:   	clrb	[%i1 - 0x1a]
	.word	0xa1a0103c	! t0_kref+0x640:   	fstox	%f28, %f16
	.word	0xb1b50efc	! t0_kref+0x644:   	fornot2s	%f20, %f28, %f24
	.word	0xafb34336	! t0_kref+0x648:   	bmask	%o5, %l6, %l7
	.word	0xda363fec	! t0_kref+0x64c:   	sth	%o5, [%i0 - 0x14]
	.word	0xb1a00552	! t0_kref+0x650:   	fsqrtd	%f18, %f24
	.word	0xa5a0003a	! t0_kref+0x654:   	fmovs	%f26, %f18
	.word	0xe51f4019	! t0_kref+0x658:   	ldd	[%i5 + %i1], %f18
	.word	0xee480018	! t0_kref+0x65c:   	ldsb	[%g0 + %i0], %l7
	.word	0xed180018	! t0_kref+0x660:   	ldd	[%g0 + %i0], %f22
	.word	0x94827bae	! t0_kref+0x664:   	addcc	%o1, -0x452, %o2
	.word	0x8120397f	! t0_kref+0x668:   	mulscc	%g0, -0x681, %g0
	.word	0xada00550	! t0_kref+0x66c:   	fsqrtd	%f16, %f22
	.word	0x99b2c0a9	! t0_kref+0x670:   	edge16n	%o3, %o1, %o4
	.word	0x8143e040	! t0_kref+0x674:   	membar	0x40
	.word	0x9fb00cee	! t0_kref+0x678:   	fnot2s	%f14, %f15
	.word	0xae423d83	! t0_kref+0x67c:   	addc	%o0, -0x27d, %l7
	.word	0xa5b50e16	! t0_kref+0x680:   	fand	%f20, %f22, %f18
	.word	0xd27e4000	! t0_kref+0x684:   	swap	[%i1], %o1
	.word	0xa42a62d7	! t0_kref+0x688:   	andn	%o1, 0x2d7, %l2
	.word	0xf720a010	! t0_kref+0x68c:   	st	%f27, [%g2 + 0x10]
	.word	0x36480007	! t0_kref+0x690:   	bge,a,pt	%icc, _kref+0x6ac
	.word	0xbda5884c	! t0_kref+0x694:   	faddd	%f22, %f12, %f30
	.word	0xb5a01a39	! t0_kref+0x698:   	fstoi	%f25, %f26
	.word	0x8135a004	! t0_kref+0x69c:   	srl	%l6, 0x4, %g0
	.word	0x99b34caf	! t0_kref+0x6a0:   	fandnot2s	%f13, %f15, %f12
	.word	0xe83e4000	! t0_kref+0x6a4:   	std	%l4, [%i1]
	.word	0x94633c03	! t0_kref+0x6a8:   	subc	%o4, -0x3fd, %o2
	.word	0xd82e3ff6	! t0_kref+0x6ac:   	stb	%o4, [%i0 - 0xa]
	.word	0xab400000	! t0_kref+0x6b0:   	mov	%y, %l5
	.word	0x9fc00004	! t0_kref+0x6b4:   	call	%g0 + %g4
	.word	0xf76e001c	! t0_kref+0x6b8:   	prefetch	%i0 + %i4, 27
	.word	0x8143c000	! t0_kref+0x6bc:   	stbar
	.word	0x9a15400a	! t0_kref+0x6c0:   	or	%l5, %o2, %o5
	.word	0x97b280f6	! t0_kref+0x6c4:   	edge16ln	%o2, %l6, %o3
	.word	0xd2ce5000	! t0_kref+0x6c8:   	ldsba	[%i1]0x80, %o1
	.word	0xa7400000	! t0_kref+0x6cc:   	mov	%y, %l3
	.word	0xaedb20fa	! t0_kref+0x6d0:   	smulcc	%o4, 0xfa, %l7
	.word	0xa4603c92	! t0_kref+0x6d4:   	subc	%g0, -0x36e, %l2
	.word	0x9ba018da	! t0_kref+0x6d8:   	fdtos	%f26, %f13
	.word	0x2f347803	! t0_kref+0x6dc:   	sethi	%hi(0xd1e00c00), %l7
	.word	0xb3a018d0	! t0_kref+0x6e0:   	fdtos	%f16, %f25
	.word	0xec060000	! t0_kref+0x6e4:   	ld	[%i0], %l6
	.word	0x9653401a	! t0_kref+0x6e8:   	umul	%o5, %i2, %o3
	.word	0xc06e8018	! t0_kref+0x6ec:   	ldstub	[%i2 + %i0], %g0
	.word	0xea4e200a	! t0_kref+0x6f0:   	ldsb	[%i0 + 0xa], %l5
	.word	0xa80e8008	! t0_kref+0x6f4:   	and	%i2, %o0, %l4
	.word	0xbda01a35	! t0_kref+0x6f8:   	fstoi	%f21, %f30
	.word	0xaa2d401a	! t0_kref+0x6fc:   	andn	%l5, %i2, %l5
	.word	0xeb06600c	! t0_kref+0x700:   	ld	[%i1 + 0xc], %f21
	call	SYM(t0_subr1)
	.word	0xc3ee500c	! t0_kref+0x708:   	prefetcha	%i1 + %o4, 1
	.word	0x81ad0a3a	! t0_kref+0x70c:   	fcmps	%fcc0, %f20, %f26
	.word	0xf1063fe8	! t0_kref+0x710:   	ld	[%i0 - 0x18], %f24
	.word	0xe500a03c	! t0_kref+0x714:   	ld	[%g2 + 0x3c], %f18
	.word	0xe6480019	! t0_kref+0x718:   	ldsb	[%g0 + %i1], %l3
	.word	0x93b54240	! t0_kref+0x71c:   	array16	%l5, %g0, %o1
	.word	0x24800006	! t0_kref+0x720:   	ble,a	_kref+0x738
	.word	0xac0b6a37	! t0_kref+0x724:   	and	%o5, 0xa37, %l6
	.word	0xb1a00552	! t0_kref+0x728:   	fsqrtd	%f18, %f24
	.word	0x94f83a90	! t0_kref+0x72c:   	sdivcc	%g0, -0x570, %o2
	.word	0xb1a78d3b	! t0_kref+0x730:   	fsmuld	%f30, %f27, %f24
	.word	0xea20a02c	! t0_kref+0x734:   	st	%l5, [%g2 + 0x2c]
	.word	0x9e123969	! t0_kref+0x738:   	or	%o0, -0x697, %o7
	.word	0xa3a01a30	! t0_kref+0x73c:   	fstoi	%f16, %f17
	.word	0xecbe101d	! t0_kref+0x740:   	stda	%l6, [%i0 + %i5]0x80
	.word	0x9e3ea8b0	! t0_kref+0x744:   	xnor	%i2, 0x8b0, %o7
	.word	0xa1a01033	! t0_kref+0x748:   	fstox	%f19, %f16
	.word	0xaa0eb5ea	! t0_kref+0x74c:   	and	%i2, -0xa16, %l5
	.word	0xa9a01917	! t0_kref+0x750:   	fitod	%f23, %f20
	.word	0xa6e20015	! t0_kref+0x754:   	subccc	%o0, %l5, %l3
	.word	0xd440a038	! t0_kref+0x758:   	ldsw	[%g2 + 0x38], %o2
	.word	0x940ac016	! t0_kref+0x75c:   	and	%o3, %l6, %o2
	.word	0xa7b0034d	! t0_kref+0x760:   	alignaddrl	%g0, %o5, %l3
	.word	0xe608a013	! t0_kref+0x764:   	ldub	[%g2 + 0x13], %l3
	.word	0xaaab65ea	! t0_kref+0x768:   	andncc	%o5, 0x5ea, %l5
	.word	0xada3085c	! t0_kref+0x76c:   	faddd	%f12, %f28, %f22
	.word	0x81d80014	! t0_kref+0x770:   	flush	%g0 + %l4
	.word	0x9e5a800b	! t0_kref+0x774:   	smul	%o2, %o3, %o7
	.word	0x81af8a5e	! t0_kref+0x778:   	fcmpd	%fcc0, %f30, %f30
	.word	0xd226001c	! t0_kref+0x77c:   	st	%o1, [%i0 + %i4]
	.word	0xd028a006	! t0_kref+0x780:   	stb	%o0, [%g2 + 6]
	.word	0xa1b786f6	! t0_kref+0x784:   	fmul8ulx16	%f30, %f22, %f16
	.word	0x37800004	! t0_kref+0x788:   	fbge,a	_kref+0x798
	.word	0xaa700000	! t0_kref+0x78c:   	udiv	%g0, %g0, %l5
	.word	0xc7ee1008	! t0_kref+0x790:   	prefetcha	%i0 + %o0, 3
	.word	0xd048a03e	! t0_kref+0x794:   	ldsb	[%g2 + 0x3e], %o0
	.word	0x9a5a400b	! t0_kref+0x798:   	smul	%o1, %o3, %o5
	.word	0x9de3bfa0	! t0_kref+0x79c:   	save	%sp, -0x60, %sp
	.word	0xb02ee526	! t0_kref+0x7a0:   	andn	%i3, 0x526, %i0
	.word	0x95e83585	! t0_kref+0x7a4:   	restore	%g0, -0xa7b, %o2
	.word	0xe67e6004	! t0_kref+0x7a8:   	swap	[%i1 + 4], %l3
	.word	0xa6b34008	! t0_kref+0x7ac:   	orncc	%o5, %o0, %l3
	.word	0xf920a020	! t0_kref+0x7b0:   	st	%f28, [%g2 + 0x20]
	.word	0xa85020cb	! t0_kref+0x7b4:   	umul	%g0, 0xcb, %l4
	.word	0x81ad8ad8	! t0_kref+0x7b8:   	fcmped	%fcc0, %f22, %f24
	.word	0xde006d26	! t0_kref+0x7bc:   	ld	[%g1 + 0xd26], %o7
	.word	0xae5a7da5	! t0_kref+0x7c0:   	smul	%o1, -0x25b, %l7
	.word	0xde567ff6	! t0_kref+0x7c4:   	ldsh	[%i1 - 0xa], %o7
	.word	0xa9a44d35	! t0_kref+0x7c8:   	fsmuld	%f17, %f21, %f20
	.word	0x9de3bfa0	! t0_kref+0x7cc:   	save	%sp, -0x60, %sp
	.word	0xb03f401d	! t0_kref+0x7d0:   	xnor	%i5, %i5, %i0
	.word	0x9bef4000	! t0_kref+0x7d4:   	restore	%i5, %g0, %o5
	.word	0xb9a01915	! t0_kref+0x7d8:   	fitod	%f21, %f28
	.word	0x99b24200	! t0_kref+0x7dc:   	array8	%o1, %g0, %o4
	.word	0x24800003	! t0_kref+0x7e0:   	ble,a	_kref+0x7ec
	.word	0xafa0189e	! t0_kref+0x7e4:   	fitos	%f30, %f23
	.word	0xa65d400d	! t0_kref+0x7e8:   	smul	%l5, %o5, %l3
	.word	0x9a2b0016	! t0_kref+0x7ec:   	andn	%o4, %l6, %o5
	.word	0x26480003	! t0_kref+0x7f0:   	bl,a,pt	%icc, _kref+0x7fc
	.word	0xada00556	! t0_kref+0x7f4:   	fsqrtd	%f22, %f22
	.word	0xc1ee500b	! t0_kref+0x7f8:   	prefetcha	%i1 + %o3, 0
	.word	0x97703453	! t0_kref+0x7fc:   	popc	-0xbad, %o3
	.word	0xaa628009	! t0_kref+0x800:   	subc	%o2, %o1, %l5
	.word	0xf96e6018	! t0_kref+0x804:   	prefetch	%i1 + 0x18, 28
	.word	0xd630a000	! t0_kref+0x808:   	sth	%o3, [%g2]
	.word	0xf7ee501d	! t0_kref+0x80c:   	prefetcha	%i1 + %i5, 27
	.word	0x98fb000b	! t0_kref+0x810:   	sdivcc	%o4, %o3, %o4
	.word	0x9870001a	! t0_kref+0x814:   	udiv	%g0, %i2, %o4
	.word	0x83414000	! t0_kref+0x818:   	mov	%pc, %g1
	.word	0xdaee5000	! t0_kref+0x81c:   	ldstuba	[%i1]0x80, %o5
	.word	0xabb70eee	! t0_kref+0x820:   	fornot2s	%f28, %f14, %f21
	.word	0xfd180018	! t0_kref+0x824:   	ldd	[%g0 + %i0], %f30
	.word	0x952da015	! t0_kref+0x828:   	sll	%l6, 0x15, %o2
	.word	0xe306401c	! t0_kref+0x82c:   	ld	[%i1 + %i4], %f17
	.word	0x81de6c42	! t0_kref+0x830:   	flush	%i1 + 0xc42
	.word	0xa5a0102c	! t0_kref+0x834:   	fstox	%f12, %f18
	.word	0xec1e6008	! t0_kref+0x838:   	ldd	[%i1 + 8], %l6
	.word	0xb5a0053d	! t0_kref+0x83c:   	fsqrts	%f29, %f26
	.word	0xb1a01936	! t0_kref+0x840:   	fstod	%f22, %f24
	.word	0x9035b849	! t0_kref+0x844:   	orn	%l6, -0x7b7, %o0
	.word	0x292bff6f	! t0_kref+0x848:   	sethi	%hi(0xaffdbc00), %l4
	.word	0x9de3bfa0	! t0_kref+0x84c:   	save	%sp, -0x60, %sp
	.word	0x9beeb171	! t0_kref+0x850:   	restore	%i2, -0xe8f, %o5
	.word	0xda2e7fe4	! t0_kref+0x854:   	stb	%o5, [%i1 - 0x1c]
	.word	0x9462fb40	! t0_kref+0x858:   	subc	%o3, -0x4c0, %o2
	.word	0x39800003	! t0_kref+0x85c:   	fbuge,a	_kref+0x868
	.word	0xbba000b9	! t0_kref+0x860:   	fnegs	%f25, %f29
	.word	0xdf00a000	! t0_kref+0x864:   	ld	[%g2], %f15
	.word	0x38480007	! t0_kref+0x868:   	bgu,a,pt	%icc, _kref+0x884
	.word	0xa1a01a2d	! t0_kref+0x86c:   	fstoi	%f13, %f16
	.word	0xb5a0003b	! t0_kref+0x870:   	fmovs	%f27, %f26
	.word	0xbdb34ab3	! t0_kref+0x874:   	fpsub16s	%f13, %f19, %f30
	.word	0xa7a308af	! t0_kref+0x878:   	fsubs	%f12, %f15, %f19
	.word	0xa1a0054c	! t0_kref+0x87c:   	fsqrtd	%f12, %f16
	.word	0x90ddc00b	! t0_kref+0x880:   	smulcc	%l7, %o3, %o0
	.word	0xc807bfe4	! t0_kref+0x884:   	ld	[%fp - 0x1c], %g4
	.word	0xa1a00556	! t0_kref+0x888:   	fsqrtd	%f22, %f16
	.word	0x903235a2	! t0_kref+0x88c:   	orn	%o0, -0xa5e, %o0
	.word	0xa5a01936	! t0_kref+0x890:   	fstod	%f22, %f18
	.word	0x802339f9	! t0_kref+0x894:   	sub	%o4, -0x607, %g0
	.word	0xd2a81018	! t0_kref+0x898:   	stba	%o1, [%g0 + %i0]0x80
	.word	0x81af8a3c	! t0_kref+0x89c:   	fcmps	%fcc0, %f30, %f28
	.word	0x3c480006	! t0_kref+0x8a0:   	bpos,a,pt	%icc, _kref+0x8b8
	.word	0xa622800b	! t0_kref+0x8a4:   	sub	%o2, %o3, %l3
	.word	0xa7b200b7	! t0_kref+0x8a8:   	edge16n	%o0, %l7, %l3
	.word	0xd430a008	! t0_kref+0x8ac:   	sth	%o2, [%g2 + 8]
	.word	0xafb3cc71	! t0_kref+0x8b0:   	fnors	%f15, %f17, %f23
	.word	0x9da01919	! t0_kref+0x8b4:   	fitod	%f25, %f14
	.word	0xbda50858	! t0_kref+0x8b8:   	faddd	%f20, %f24, %f30
	.word	0xbba01a3a	! t0_kref+0x8bc:   	fstoi	%f26, %f29
	.word	0xd93f4018	! t0_kref+0x8c0:   	std	%f12, [%i5 + %i0]
	.word	0xb1a01a32	! t0_kref+0x8c4:   	fstoi	%f18, %f24
	.word	0x2d800004	! t0_kref+0x8c8:   	fbg,a	_kref+0x8d8
	.word	0x98e034d5	! t0_kref+0x8cc:   	subccc	%g0, -0xb2b, %o4
	.word	0x29480003	! t0_kref+0x8d0:   	fbl,a,pt	%fcc0, _kref+0x8dc
	.word	0xb1b587dc	! t0_kref+0x8d4:   	pdist	%f22, %f28, %f24
	.word	0x1735b88e	! t0_kref+0x8d8:   	sethi	%hi(0xd6e23800), %o3
	.word	0x27800002	! t0_kref+0x8dc:   	fbul,a	_kref+0x8e4
	.word	0xd040a02c	! t0_kref+0x8e0:   	ldsw	[%g2 + 0x2c], %o0
	.word	0xa9a01a30	! t0_kref+0x8e4:   	fstoi	%f16, %f20
	.word	0x8d836b83	! t0_kref+0x8e8:   	wr	%o5, 0xb83, %fprs
	.word	0xa1a409d0	! t0_kref+0x8ec:   	fdivd	%f16, %f16, %f16
	.word	0xf5263ffc	! t0_kref+0x8f0:   	st	%f26, [%i0 - 4]
	.word	0xa5a01a38	! t0_kref+0x8f4:   	fstoi	%f24, %f18
	.word	0x95b0004a	! t0_kref+0x8f8:   	edge8l	%g0, %o2, %o2
	.word	0xaeb68016	! t0_kref+0x8fc:   	orncc	%i2, %l6, %l7
	.word	0xa9b30e52	! t0_kref+0x900:   	fxnor	%f12, %f18, %f20
	.word	0xec3e7ff0	! t0_kref+0x904:   	std	%l6, [%i1 - 0x10]
	.word	0x96aa0008	! t0_kref+0x908:   	andncc	%o0, %o0, %o3
	.word	0xa60aaf9a	! t0_kref+0x90c:   	and	%o2, 0xf9a, %l3
	.word	0xb9a01938	! t0_kref+0x910:   	fstod	%f24, %f28
	.word	0x29800007	! t0_kref+0x914:   	fbl,a	_kref+0x930
	.word	0xb1a60852	! t0_kref+0x918:   	faddd	%f24, %f18, %f24
	.word	0x99b2c055	! t0_kref+0x91c:   	edge8l	%o3, %l5, %o4
	.word	0xa1a00554	! t0_kref+0x920:   	fsqrtd	%f20, %f16
	.word	0xae2d7fee	! t0_kref+0x924:   	andn	%l5, -0x12, %l7
	.word	0xe27e3ffc	! t0_kref+0x928:   	swap	[%i0 - 4], %l1
	.word	0xada0055c	! t0_kref+0x92c:   	fsqrtd	%f28, %f22
	.word	0x94420017	! t0_kref+0x930:   	addc	%o0, %l7, %o2
	.word	0x98e34017	! t0_kref+0x934:   	subccc	%o5, %l7, %o4
	.word	0xf720a038	! t0_kref+0x938:   	st	%f27, [%g2 + 0x38]
	.word	0xb1a0191c	! t0_kref+0x93c:   	fitod	%f28, %f24
	.word	0xa60db9b7	! t0_kref+0x940:   	and	%l6, -0x649, %l3
	.word	0xb3a00534	! t0_kref+0x944:   	fsqrts	%f20, %f25
	.word	0xada0193a	! t0_kref+0x948:   	fstod	%f26, %f22
	.word	0xa5a0055c	! t0_kref+0x94c:   	fsqrtd	%f28, %f18
	.word	0x81df38be	! t0_kref+0x950:   	flush	%i4 - 0x742
	.word	0xdd3e4000	! t0_kref+0x954:   	std	%f14, [%i1]
	.word	0x8072ab22	! t0_kref+0x958:   	udiv	%o2, 0xb22, %g0
	.word	0xb1a0052d	! t0_kref+0x95c:   	fsqrts	%f13, %f24
	.word	0xa6828017	! t0_kref+0x960:   	addcc	%o2, %l7, %l3
	.word	0x96654016	! t0_kref+0x964:   	subc	%l5, %l6, %o3
	.word	0xc04e6018	! t0_kref+0x968:   	ldsb	[%i1 + 0x18], %g0
	.word	0x98ada994	! t0_kref+0x96c:   	andncc	%l6, 0x994, %o4
	.word	0x99a01a5c	! t0_kref+0x970:   	fdtoi	%f28, %f12
	.word	0xa3a7083d	! t0_kref+0x974:   	fadds	%f28, %f29, %f17
	.word	0xf4260000	! t0_kref+0x978:   	st	%i2, [%i0]
	.word	0xe1be180d	! t0_kref+0x97c:   	stda	%f16, [%i0 + %o5]0xc0
	.word	0x92fb64ed	! t0_kref+0x980:   	sdivcc	%o5, 0x4ed, %o1
	.word	0xed1e0000	! t0_kref+0x984:   	ldd	[%i0], %f22
	.word	0x27800005	! t0_kref+0x988:   	fbul,a	_kref+0x99c
	.word	0xafb5cd60	! t0_kref+0x98c:   	fnot1s	%f23, %f23
	.word	0xafa0002c	! t0_kref+0x990:   	fmovs	%f12, %f23
	.word	0xa7b64aba	! t0_kref+0x994:   	fpsub16s	%f25, %f26, %f19
	.word	0x26480004	! t0_kref+0x998:   	bl,a,pt	%icc, _kref+0x9a8
	.word	0x99a0108e	! t0_kref+0x99c:   	fxtos	%f14, %f12
	.word	0xc807bfe4	! t0_kref+0x9a0:   	ld	[%fp - 0x1c], %g4
	.word	0xf42e6006	! t0_kref+0x9a4:   	stb	%i2, [%i1 + 6]
	.word	0x8143c000	! t0_kref+0x9a8:   	stbar
	.word	0xe168a00a	! t0_kref+0x9ac:   	prefetch	%g2 + 0xa, 16
	.word	0x8143c000	! t0_kref+0x9b0:   	stbar
	.word	0xa7b34097	! t0_kref+0x9b4:   	edge16	%o5, %l7, %l3
	.word	0x8143e040	! t0_kref+0x9b8:   	membar	0x40
	.word	0xbba000ae	! t0_kref+0x9bc:   	fnegs	%f14, %f29
	.word	0xda070018	! t0_kref+0x9c0:   	ld	[%i4 + %i0], %o5
	.word	0x2e800002	! t0_kref+0x9c4:   	bvs,a	_kref+0x9cc
	.word	0x9b2b601f	! t0_kref+0x9c8:   	sll	%o5, 0x1f, %o5
	.word	0xe51e3ff8	! t0_kref+0x9cc:   	ldd	[%i0 - 8], %f18
	.word	0x981ae61f	! t0_kref+0x9d0:   	xor	%o3, 0x61f, %o4
	.word	0xf5ee101b	! t0_kref+0x9d4:   	prefetcha	%i0 + %i3, 26
	.word	0xd468a00a	! t0_kref+0x9d8:   	ldstub	[%g2 + 0xa], %o2
	.word	0xae72c015	! t0_kref+0x9dc:   	udiv	%o3, %l5, %l7
	.word	0x29480008	! t0_kref+0x9e0:   	fbl,a,pt	%fcc0, _kref+0xa00
	.word	0x95b280c8	! t0_kref+0x9e4:   	edge16l	%o2, %o0, %o2
	.word	0xf428a03d	! t0_kref+0x9e8:   	stb	%i2, [%g2 + 0x3d]
	.word	0xa432c009	! t0_kref+0x9ec:   	orn	%o3, %o1, %l2
	.word	0xbdb64ea0	! t0_kref+0x9f0:   	fsrc1s	%f25, %f30
	.word	0x9fc00004	! t0_kref+0x9f4:   	call	%g0 + %g4
	.word	0x90d28009	! t0_kref+0x9f8:   	umulcc	%o2, %o1, %o0
	.word	0xf93e401d	! t0_kref+0x9fc:   	std	%f28, [%i1 + %i5]
	.word	0xd8180019	! t0_kref+0xa00:   	ldd	[%g0 + %i1], %o4
	.word	0x948b0009	! t0_kref+0xa04:   	andcc	%o4, %o1, %o2
	.word	0xb9b3cdee	! t0_kref+0xa08:   	fnands	%f15, %f14, %f28
	.word	0x99a0188e	! t0_kref+0xa0c:   	fitos	%f14, %f12
	.word	0x9da01a3d	! t0_kref+0xa10:   	fstoi	%f29, %f14
	call	SYM(t0_subr0)
	.word	0xeb270019	! t0_kref+0xa18:   	st	%f21, [%i4 + %i1]
	.word	0xa666ae39	! t0_kref+0xa1c:   	subc	%i2, 0xe39, %l3
	.word	0xad418000	! t0_kref+0xa20:   	mov	%fprs, %l6
	.word	0xd4267ff8	! t0_kref+0xa24:   	st	%o2, [%i1 - 8]
	.word	0xed1e001d	! t0_kref+0xa28:   	ldd	[%i0 + %i5], %f22
	.word	0x9ba5092f	! t0_kref+0xa2c:   	fmuls	%f20, %f15, %f13
	.word	0xd04e2015	! t0_kref+0xa30:   	ldsb	[%i0 + 0x15], %o0
	.word	0xd62e200a	! t0_kref+0xa34:   	stb	%o3, [%i0 + 0xa]
	.word	0xd25e6000	! t0_kref+0xa38:   	ldx	[%i1], %o1
	.word	0xec0e601b	! t0_kref+0xa3c:   	ldub	[%i1 + 0x1b], %l6
	.word	0xc020a004	! t0_kref+0xa40:   	clr	[%g2 + 4]
	.word	0xee4e7fe9	! t0_kref+0xa44:   	ldsb	[%i1 - 0x17], %l7
	.word	0xb9a488d6	! t0_kref+0xa48:   	fsubd	%f18, %f22, %f28
	.word	0x01022cfc	! t0_kref+0xa4c:   	sethi	%hi(0x8b3f000), %g0
	.word	0xc0566012	! t0_kref+0xa50:   	ldsh	[%i1 + 0x12], %g0
	.word	0x93b28176	! t0_kref+0xa54:   	edge32ln	%o2, %l6, %o1
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xaf25ee73	! t0_kref+0xa60:   	mulscc	%l7, 0xe73, %l7
1:	.word	0x80fd800d	! t0_kref+0xa64:   	sdivcc	%l6, %o5, %g0
	.word	0xa522749f	! t0_kref+0xa68:   	mulscc	%o1, -0xb61, %l2
	.word	0xd4d6501b	! t0_kref+0xa6c:   	ldsha	[%i1 + %i3]0x80, %o2
	.word	0xb9a488ba	! t0_kref+0xa70:   	fsubs	%f18, %f26, %f28
	.word	0xa4f33e81	! t0_kref+0xa74:   	udivcc	%o4, -0x17f, %l2
	.word	0xb5b74a2c	! t0_kref+0xa78:   	fpadd16s	%f29, %f12, %f26
	.word	0x90aa801a	! t0_kref+0xa7c:   	andncc	%o2, %i2, %o0
	.word	0xb3a000be	! t0_kref+0xa80:   	fnegs	%f30, %f25
	.word	0xf11fbe48	! t0_kref+0xa84:   	ldd	[%fp - 0x1b8], %f24
	.word	0xabaac03a	! t0_kref+0xa88:   	fmovsge	%fcc0, %f26, %f21
	.word	0xd020a014	! t0_kref+0xa8c:   	st	%o0, [%g2 + 0x14]
	.word	0x81ac8ace	! t0_kref+0xa90:   	fcmped	%fcc0, %f18, %f14
	.word	0xe4464000	! t0_kref+0xa94:   	ldsw	[%i1], %l2
	.word	0xac626dc0	! t0_kref+0xa98:   	subc	%o1, 0xdc0, %l6
	.word	0x98f2c00c	! t0_kref+0xa9c:   	udivcc	%o3, %o4, %o4
	.word	0xd0180018	! t0_kref+0xaa0:   	ldd	[%g0 + %i0], %o0
	.word	0x9da0002c	! t0_kref+0xaa4:   	fmovs	%f12, %f14
	.word	0xa5b70976	! t0_kref+0xaa8:   	fpmerge	%f28, %f22, %f18
	.word	0xed6e001c	! t0_kref+0xaac:   	prefetch	%i0 + %i4, 22
	.word	0x32800003	! t0_kref+0xab0:   	bne,a	_kref+0xabc
	.word	0xa4120015	! t0_kref+0xab4:   	or	%o0, %l5, %l2
	.word	0xde50a00e	! t0_kref+0xab8:   	ldsh	[%g2 + 0xe], %o7
	.word	0xeb00a008	! t0_kref+0xabc:   	ld	[%g2 + 8], %f21
	.word	0xd020a038	! t0_kref+0xac0:   	st	%o0, [%g2 + 0x38]
	.word	0x97418000	! t0_kref+0xac4:   	mov	%fprs, %o3
	.word	0xb3a000b4	! t0_kref+0xac8:   	fnegs	%f20, %f25
	.word	0x9e824009	! t0_kref+0xacc:   	addcc	%o1, %o1, %o7
	.word	0x2d480003	! t0_kref+0xad0:   	fbg,a,pt	%fcc0, _kref+0xadc
	.word	0xa6630008	! t0_kref+0xad4:   	subc	%o4, %o0, %l3
	.word	0x81af0a4c	! t0_kref+0xad8:   	fcmpd	%fcc0, %f28, %f12
	.word	0xa1b406b7	! t0_kref+0xadc:   	fmul8x16al	%f16, %f23, %f16
	.word	0x902d6fd5	! t0_kref+0xae0:   	andn	%l5, 0xfd5, %o0
	.word	0xef68a08f	! t0_kref+0xae4:   	prefetch	%g2 + 0x8f, 23
	.word	0x27800005	! t0_kref+0xae8:   	fbul,a	_kref+0xafc
	.word	0x9e2226ce	! t0_kref+0xaec:   	sub	%o0, 0x6ce, %o7
	.word	0x969d800a	! t0_kref+0xaf0:   	xorcc	%l6, %o2, %o3
	.word	0x270482ae	! t0_kref+0xaf4:   	sethi	%hi(0x120ab800), %l3
	.word	0x992278c4	! t0_kref+0xaf8:   	mulscc	%o1, -0x73c, %o4
	.word	0xb5b00fe0	! t0_kref+0xafc:   	fones	%f26
	.word	0xd628a039	! t0_kref+0xb00:   	stb	%o3, [%g2 + 0x39]
	.word	0xaf400000	! t0_kref+0xb04:   	mov	%y, %l7
	.word	0x9e6375e9	! t0_kref+0xb08:   	subc	%o5, -0xa17, %o7
	.word	0xadb50f98	! t0_kref+0xb0c:   	for	%f20, %f24, %f22
	.word	0x9eda800c	! t0_kref+0xb10:   	smulcc	%o2, %o4, %o7
	.word	0xd078a030	! t0_kref+0xb14:   	swap	[%g2 + 0x30], %o0
	.word	0xac1d8008	! t0_kref+0xb18:   	xor	%l6, %o0, %l6
	.word	0xde00a024	! t0_kref+0xb1c:   	ld	[%g2 + 0x24], %o7
	.word	0xe120a020	! t0_kref+0xb20:   	st	%f16, [%g2 + 0x20]
	.word	0xf4200018	! t0_kref+0xb24:   	st	%i2, [%g0 + %i0]
	.word	0xdf00a01c	! t0_kref+0xb28:   	ld	[%g2 + 0x1c], %f15
	call	SYM(t0_subr1)
	.word	0xc028a011	! t0_kref+0xb30:   	clrb	[%g2 + 0x11]
	.word	0xd4563ffc	! t0_kref+0xb34:   	ldsh	[%i0 - 4], %o2
	.word	0x8143c000	! t0_kref+0xb38:   	stbar
	.word	0x961376b2	! t0_kref+0xb3c:   	or	%o5, -0x94e, %o3
	.word	0xd47e3ff4	! t0_kref+0xb40:   	swap	[%i0 - 0xc], %o2
	.word	0x9aa262a7	! t0_kref+0xb44:   	subcc	%o1, 0x2a7, %o5
	.word	0x29800004	! t0_kref+0xb48:   	fbl,a	_kref+0xb58
	.word	0xd8267fe8	! t0_kref+0xb4c:   	st	%o4, [%i1 - 0x18]
	.word	0x3a480001	! t0_kref+0xb50:   	bcc,a,pt	%icc, _kref+0xb54
	.word	0x9f28000c	! t0_kref+0xb54:   	sll	%g0, %o4, %o7
	.word	0xea4e3fed	! t0_kref+0xb58:   	ldsb	[%i0 - 0x13], %l5
	.word	0x3e480008	! t0_kref+0xb5c:   	bvc,a,pt	%icc, _kref+0xb7c
	.word	0x96d8000c	! t0_kref+0xb60:   	smulcc	%g0, %o4, %o3
	.word	0xa69a4015	! t0_kref+0xb64:   	xorcc	%o1, %l5, %l3
	.word	0xdbe65016	! t0_kref+0xb68:   	casa	[%i1]0x80, %l6, %o5
	.word	0xa5a0192c	! t0_kref+0xb6c:   	fstod	%f12, %f18
	.word	0xa9a01a2f	! t0_kref+0xb70:   	fstoi	%f15, %f20
	.word	0xd86e8018	! t0_kref+0xb74:   	ldstub	[%i2 + %i0], %o4
	.word	0xaee5400c	! t0_kref+0xb78:   	subccc	%l5, %o4, %l7
	.word	0xd8d81018	! t0_kref+0xb7c:   	ldxa	[%g0 + %i0]0x80, %o4
	.word	0x99a018d4	! t0_kref+0xb80:   	fdtos	%f20, %f12
	.word	0x37480008	! t0_kref+0xb84:   	fbge,a,pt	%fcc0, _kref+0xba4
	.word	0x9bb00316	! t0_kref+0xb88:   	alignaddr	%g0, %l6, %o5
	.word	0xa9a0111a	! t0_kref+0xb8c:   	fxtod	%f26, %f20
	.word	0x9db487dc	! t0_kref+0xb90:   	pdist	%f18, %f28, %f14
	.word	0xbda01a4e	! t0_kref+0xb94:   	fdtoi	%f14, %f30
	.word	0xa5a000da	! t0_kref+0xb98:   	fnegd	%f26, %f18
	.word	0xa5b58d14	! t0_kref+0xb9c:   	fandnot1	%f22, %f20, %f18
	.word	0x8143c000	! t0_kref+0xba0:   	stbar
	.word	0x81580000	! t0_kref+0xba4:   	flushw
	.word	0xf1be180c	! t0_kref+0xba8:   	stda	%f24, [%i0 + %o4]0xc0
	.word	0xadb28240	! t0_kref+0xbac:   	array16	%o2, %g0, %l6
	.word	0xc56e0000	! t0_kref+0xbb0:   	prefetch	%i0, 2
	.word	0x972b6019	! t0_kref+0xbb4:   	sll	%o5, 0x19, %o3
	.word	0xa5b70db6	! t0_kref+0xbb8:   	fxors	%f28, %f22, %f18
	.word	0xaa5e8008	! t0_kref+0xbbc:   	smul	%i2, %o0, %l5
	.word	0xb1a389d8	! t0_kref+0xbc0:   	fdivd	%f14, %f24, %f24
	.word	0xaba000b8	! t0_kref+0xbc4:   	fnegs	%f24, %f21
	.word	0xaf408000	! t0_kref+0xbc8:   	mov	%ccr, %l7
	.word	0x942a8015	! t0_kref+0xbcc:   	andn	%o2, %l5, %o2
	.word	0xa430311c	! t0_kref+0xbd0:   	orn	%g0, -0xee4, %l2
	.word	0x9862219f	! t0_kref+0xbd4:   	subc	%o0, 0x19f, %o4
	.word	0xa425f625	! t0_kref+0xbd8:   	sub	%l7, -0x9db, %l2
	.word	0xae158009	! t0_kref+0xbdc:   	or	%l6, %o1, %l7
	.word	0xed3e401d	! t0_kref+0xbe0:   	std	%f22, [%i1 + %i5]
	.word	0x26800003	! t0_kref+0xbe4:   	bl,a	_kref+0xbf0
	.word	0xb7a88031	! t0_kref+0xbe8:   	fmovslg	%fcc0, %f17, %f27
	.word	0xae73000c	! t0_kref+0xbec:   	udiv	%o4, %o4, %l7
	.word	0xae2d61c9	! t0_kref+0xbf0:   	andn	%l5, 0x1c9, %l7
	.word	0xae52a17c	! t0_kref+0xbf4:   	umul	%o2, 0x17c, %l7
	.word	0xaef03331	! t0_kref+0xbf8:   	udivcc	%g0, -0xccf, %l7
	.word	0xb5b00cf2	! t0_kref+0xbfc:   	fnot2s	%f18, %f26
	.word	0x81228017	! t0_kref+0xc00:   	mulscc	%o2, %l7, %g0
	.word	0xac9d6d82	! t0_kref+0xc04:   	xorcc	%l5, 0xd82, %l6
	.word	0x98700008	! t0_kref+0xc08:   	udiv	%g0, %o0, %o4
	.word	0xa62a2a67	! t0_kref+0xc0c:   	andn	%o0, 0xa67, %l3
	.word	0xe8bf5019	! t0_kref+0xc10:   	stda	%l4, [%i5 + %i1]0x80
	.word	0x8016800c	! t0_kref+0xc14:   	or	%i2, %o4, %g0
	.word	0xec20a024	! t0_kref+0xc18:   	st	%l6, [%g2 + 0x24]
	.word	0xafa000ba	! t0_kref+0xc1c:   	fnegs	%f26, %f23
	.word	0xea080019	! t0_kref+0xc20:   	ldub	[%g0 + %i1], %l5
	.word	0x99a01934	! t0_kref+0xc24:   	fstod	%f20, %f12
	.word	0xed68a044	! t0_kref+0xc28:   	prefetch	%g2 + 0x44, 22
	.word	0xd630a038	! t0_kref+0xc2c:   	sth	%o3, [%g2 + 0x38]
	.word	0xec063ff4	! t0_kref+0xc30:   	ld	[%i0 - 0xc], %l6
	.word	0xd67e3ff0	! t0_kref+0xc34:   	swap	[%i0 - 0x10], %o3
	.word	0xa1b5c66f	! t0_kref+0xc38:   	fmul8x16au	%f23, %f15, %f16
	.word	0x901a0017	! t0_kref+0xc3c:   	xor	%o0, %l7, %o0
	.word	0xa9b0077a	! t0_kref+0xc40:   	fpack16	%f26, %f20
	.word	0x3b800006	! t0_kref+0xc44:   	fble,a	_kref+0xc5c
	.word	0xea30a014	! t0_kref+0xc48:   	sth	%l5, [%g2 + 0x14]
	.word	0x9ed5730b	! t0_kref+0xc4c:   	umulcc	%l5, -0xcf5, %o7
	.word	0xa9b50e1a	! t0_kref+0xc50:   	fand	%f20, %f26, %f20
	.word	0xec48a01d	! t0_kref+0xc54:   	ldsb	[%g2 + 0x1d], %l6
	.word	0xec363fe0	! t0_kref+0xc58:   	sth	%l6, [%i0 - 0x20]
	.word	0x9da68838	! t0_kref+0xc5c:   	fadds	%f26, %f24, %f14
	.word	0xf51fbc68	! t0_kref+0xc60:   	ldd	[%fp - 0x398], %f26
	.word	0x9fb54057	! t0_kref+0xc64:   	edge8l	%l5, %l7, %o7
	.word	0x81abca38	! t0_kref+0xc68:   	fcmps	%fcc0, %f15, %f24
	.word	0xf1981018	! t0_kref+0xc6c:   	ldda	[%g0 + %i0]0x80, %f24
	.word	0x80e30015	! t0_kref+0xc70:   	subccc	%o4, %l5, %g0
	.word	0xd8480019	! t0_kref+0xc74:   	ldsb	[%g0 + %i1], %o4
	.word	0xfdee101d	! t0_kref+0xc78:   	prefetcha	%i0 + %i5, 30
	.word	0xd830a024	! t0_kref+0xc7c:   	sth	%o4, [%g2 + 0x24]
	.word	0x81400000	! t0_kref+0xc80:   	mov	%y, %g0
	.word	0x2e800005	! t0_kref+0xc84:   	bvs,a	_kref+0xc98
	.word	0x9833000b	! t0_kref+0xc88:   	orn	%o4, %o3, %o4
	.word	0xbba508b2	! t0_kref+0xc8c:   	fsubs	%f20, %f18, %f29
	.word	0xa785c00b	! t0_kref+0xc90:   	wr	%l7, %o3, %gsr
	.word	0xd050a00e	! t0_kref+0xc94:   	ldsh	[%g2 + 0xe], %o0
	.word	0xa1b78e58	! t0_kref+0xc98:   	fxnor	%f30, %f24, %f16
	.word	0xd2262018	! t0_kref+0xc9c:   	st	%o1, [%i0 + 0x18]
	.word	0xb1b48c54	! t0_kref+0xca0:   	fnor	%f18, %f20, %f24
	.word	0x9fa01a3e	! t0_kref+0xca4:   	fstoi	%f30, %f15
	.word	0x922b001a	! t0_kref+0xca8:   	andn	%o4, %i2, %o1
	.word	0x30800002	! t0_kref+0xcac:   	ba,a	_kref+0xcb4
	.word	0xd426401c	! t0_kref+0xcb0:   	st	%o2, [%i1 + %i4]
	.word	0xb5a000b3	! t0_kref+0xcb4:   	fnegs	%f19, %f26
	.word	0xda30a03c	! t0_kref+0xcb8:   	sth	%o5, [%g2 + 0x3c]
	.word	0xa9b586f8	! t0_kref+0xcbc:   	fmul8ulx16	%f22, %f24, %f20
	.word	0x90f03a74	! t0_kref+0xcc0:   	udivcc	%g0, -0x58c, %o0
	.word	0x28800001	! t0_kref+0xcc4:   	bleu,a	_kref+0xcc8
	.word	0xb1a0005a	! t0_kref+0xcc8:   	fmovd	%f26, %f24
	.word	0x39800003	! t0_kref+0xccc:   	fbuge,a	_kref+0xcd8
	.word	0xa8180000	! t0_kref+0xcd0:   	xor	%g0, %g0, %l4
	.word	0x9fb00cfa	! t0_kref+0xcd4:   	fnot2s	%f26, %f15
	.word	0xc768a007	! t0_kref+0xcd8:   	prefetch	%g2 + 7, 3
	.word	0x8585800d	! t0_kref+0xcdc:   	wr	%l6, %o5, %ccr
	.word	0xa9b68eda	! t0_kref+0xce0:   	fornot2	%f26, %f26, %f20
	.word	0xc568a04d	! t0_kref+0xce4:   	prefetch	%g2 + 0x4d, 2
	.word	0xee500019	! t0_kref+0xce8:   	ldsh	[%g0 + %i1], %l7
	.word	0xf4366000	! t0_kref+0xcec:   	sth	%i2, [%i1]
	.word	0x37800002	! t0_kref+0xcf0:   	fbge,a	_kref+0xcf8
	.word	0xf106401c	! t0_kref+0xcf4:   	ld	[%i1 + %i4], %f24
	.word	0xadb48c56	! t0_kref+0xcf8:   	fnor	%f18, %f22, %f22
	.word	0x30480006	! t0_kref+0xcfc:   	ba,a,pt	%icc, _kref+0xd14
	.word	0xac5ac000	! t0_kref+0xd00:   	smul	%o3, %g0, %l6
	.word	0xa9b2c14c	! t0_kref+0xd04:   	edge32l	%o3, %o4, %l4
	.word	0x99b00f3b	! t0_kref+0xd08:   	fsrc2s	%f27, %f12
	.word	0x949a8008	! t0_kref+0xd0c:   	xorcc	%o2, %o0, %o2
	.word	0xb5b00fc0	! t0_kref+0xd10:   	fone	%f26
	.word	0xdd3e2008	! t0_kref+0xd14:   	std	%f14, [%i0 + 8]
	.word	0xa9a409ce	! t0_kref+0xd18:   	fdivd	%f16, %f14, %f20
	.word	0xda20a028	! t0_kref+0xd1c:   	st	%o5, [%g2 + 0x28]
	.word	0xe408a006	! t0_kref+0xd20:   	ldub	[%g2 + 6], %l2
	.word	0xf91fbd10	! t0_kref+0xd24:   	ldd	[%fp - 0x2f0], %f28
	.word	0xb7a01a34	! t0_kref+0xd28:   	fstoi	%f20, %f27
	.word	0x35480004	! t0_kref+0xd2c:   	fbue,a,pt	%fcc0, _kref+0xd3c
	.word	0x81834000	! t0_kref+0xd30:   	wr	%o5, %g0, %y
	.word	0xfd263fec	! t0_kref+0xd34:   	st	%f30, [%i0 - 0x14]
	.word	0xd228a034	! t0_kref+0xd38:   	stb	%o1, [%g2 + 0x34]
	.word	0x960b6e61	! t0_kref+0xd3c:   	and	%o5, 0xe61, %o3
	.word	0xd420a020	! t0_kref+0xd40:   	st	%o2, [%g2 + 0x20]
	.word	0xee20a02c	! t0_kref+0xd44:   	st	%l7, [%g2 + 0x2c]
	.word	0xad2b200f	! t0_kref+0xd48:   	sll	%o4, 0xf, %l6
	.word	0xa925a1c8	! t0_kref+0xd4c:   	mulscc	%l6, 0x1c8, %l4
	.word	0xb1a01a5e	! t0_kref+0xd50:   	fdtoi	%f30, %f24
	.word	0x013b2c63	! t0_kref+0xd54:   	sethi	%hi(0xecb18c00), %g0
	.word	0xe2680019	! t0_kref+0xd58:   	ldstub	[%g0 + %i1], %l1
	.word	0xf700a024	! t0_kref+0xd5c:   	ld	[%g2 + 0x24], %f27
	.word	0xa1a308dc	! t0_kref+0xd60:   	fsubd	%f12, %f28, %f16
	.word	0x9095801a	! t0_kref+0xd64:   	orcc	%l6, %i2, %o0
	.word	0x8143e040	! t0_kref+0xd68:   	membar	0x40
	.word	0xb1a408d6	! t0_kref+0xd6c:   	fsubd	%f16, %f22, %f24
	.word	0x9e05e359	! t0_kref+0xd70:   	add	%l7, 0x359, %o7
	.word	0xa1a00558	! t0_kref+0xd74:   	fsqrtd	%f24, %f16
	.word	0xaa1d63ca	! t0_kref+0xd78:   	xor	%l5, 0x3ca, %l5
	.word	0xa9a78935	! t0_kref+0xd7c:   	fmuls	%f30, %f21, %f20
	.word	0x81ae8a3c	! t0_kref+0xd80:   	fcmps	%fcc0, %f26, %f28
	.word	0xdd00a01c	! t0_kref+0xd84:   	ld	[%g2 + 0x1c], %f14
	.word	0xa5a00556	! t0_kref+0xd88:   	fsqrtd	%f22, %f18
	.word	0xee7f0018	! t0_kref+0xd8c:   	swap	[%i4 + %i0], %l7
	.word	0xbda018dc	! t0_kref+0xd90:   	fdtos	%f28, %f30
	.word	0xe168a04a	! t0_kref+0xd94:   	prefetch	%g2 + 0x4a, 16
	.word	0xa8b82ccf	! t0_kref+0xd98:   	xnorcc	%g0, 0xccf, %l4
	.word	0xaa92800a	! t0_kref+0xd9c:   	orcc	%o2, %o2, %l5
	.word	0xf1270000	! t0_kref+0xda0:   	st	%f24, [%i4]
	.word	0xc1f65000	! t0_kref+0xda4:   	casxa	[%i1]0x80, %g0, %g0
	.word	0xb5a01a4e	! t0_kref+0xda8:   	fdtoi	%f14, %f26
	.word	0x9bb240b6	! t0_kref+0xdac:   	edge16n	%o1, %l6, %o5
	.word	0x99a0191a	! t0_kref+0xdb0:   	fitod	%f26, %f12
	.word	0xed264000	! t0_kref+0xdb4:   	st	%f22, [%i1]
	.word	0x8143c000	! t0_kref+0xdb8:   	stbar
	.word	0xe47f0018	! t0_kref+0xdbc:   	swap	[%i4 + %i0], %l2
	.word	0x9fb34a3c	! t0_kref+0xdc0:   	fpadd16s	%f13, %f28, %f15
	.word	0xa5b38a78	! t0_kref+0xdc4:   	fpadd32s	%f14, %f24, %f18
	.word	0x81580000	! t0_kref+0xdc8:   	flushw
	.word	0x9ad58015	! t0_kref+0xdcc:   	umulcc	%l6, %l5, %o5
	.word	0x805d4000	! t0_kref+0xdd0:   	smul	%l5, %g0, %g0
	.word	0x9bb20280	! t0_kref+0xdd4:   	array32	%o0, %g0, %o5
	.word	0xafa01a5a	! t0_kref+0xdd8:   	fdtoi	%f26, %f23
	.word	0xd030a010	! t0_kref+0xddc:   	sth	%o0, [%g2 + 0x10]
	.word	0xbda01a30	! t0_kref+0xde0:   	fstoi	%f16, %f30
	.word	0xa7b70550	! t0_kref+0xde4:   	fcmpeq16	%f28, %f16, %l3
	.word	0xbbb30a72	! t0_kref+0xde8:   	fpadd32s	%f12, %f18, %f29
	.word	0x92da3ce1	! t0_kref+0xdec:   	smulcc	%o0, -0x31f, %o1
	.word	0xa1a709dc	! t0_kref+0xdf0:   	fdivd	%f28, %f28, %f16
	.word	0xafb70510	! t0_kref+0xdf4:   	fcmpgt16	%f28, %f16, %l7
	.word	0x9fc00004	! t0_kref+0xdf8:   	call	%g0 + %g4
	.word	0x9b40c000	! t0_kref+0xdfc:   	mov	%asi, %o5
	.word	0x8143e040	! t0_kref+0xe00:   	membar	0x40
	.word	0x9126a82e	! t0_kref+0xe04:   	mulscc	%i2, 0x82e, %o0
	.word	0x95408000	! t0_kref+0xe08:   	mov	%ccr, %o2
	.word	0xf126200c	! t0_kref+0xe0c:   	st	%f24, [%i0 + 0xc]
	.word	0x9a183a9a	! t0_kref+0xe10:   	xor	%g0, -0x566, %o5
	.word	0x965a8015	! t0_kref+0xe14:   	smul	%o2, %l5, %o3
	.word	0x9530000b	! t0_kref+0xe18:   	srl	%g0, %o3, %o2
	.word	0x8143c000	! t0_kref+0xe1c:   	stbar
	.word	0xabb64a70	! t0_kref+0xe20:   	fpadd32s	%f25, %f16, %f21
	.word	0xabb540a9	! t0_kref+0xe24:   	edge16n	%l5, %o1, %l5
	.word	0xa6f5620f	! t0_kref+0xe28:   	udivcc	%l5, 0x20f, %l3
	.word	0xaedaa02c	! t0_kref+0xe2c:   	smulcc	%o2, 0x2c, %l7
	.word	0xa8a278f9	! t0_kref+0xe30:   	subcc	%o1, -0x707, %l4
	.word	0x9fc10000	! t0_kref+0xe34:   	call	%g4
	.word	0x99408000	! t0_kref+0xe38:   	mov	%ccr, %o4
	.word	0x3e800002	! t0_kref+0xe3c:   	bvc,a	_kref+0xe44
	.word	0xd88e9018	! t0_kref+0xe40:   	lduba	[%i2 + %i0]0x80, %o4
	.word	0xee067ff0	! t0_kref+0xe44:   	ld	[%i1 - 0x10], %l7
	.word	0xd048a03d	! t0_kref+0xe48:   	ldsb	[%g2 + 0x3d], %o0
	.word	0x21800004	! t0_kref+0xe4c:   	fbn,a	_kref+0xe5c
	.word	0xe8d81018	! t0_kref+0xe50:   	ldxa	[%g0 + %i0]0x80, %l4
	.word	0xa80d8008	! t0_kref+0xe54:   	and	%l6, %o0, %l4
	.word	0x931e8017	! t0_kref+0xe58:   	tsubcctv	%i2, %l7, %o1
	.word	0xb7a70837	! t0_kref+0xe5c:   	fadds	%f28, %f23, %f27
	.word	0x805ebbed	! t0_kref+0xe60:   	smul	%i2, -0x413, %g0
	.word	0xbba0053b	! t0_kref+0xe64:   	fsqrts	%f27, %f29
	.word	0x34480007	! t0_kref+0xe68:   	bg,a,pt	%icc, _kref+0xe84
	.word	0xadb5c12c	! t0_kref+0xe6c:   	edge32n	%l7, %o4, %l6
	.word	0x81ad0a36	! t0_kref+0xe70:   	fcmps	%fcc0, %f20, %f22
	.word	0xed68a043	! t0_kref+0xe74:   	prefetch	%g2 + 0x43, 22
	.word	0x9096a231	! t0_kref+0xe78:   	orcc	%i2, 0x231, %o0
	.word	0xbba01a31	! t0_kref+0xe7c:   	fstoi	%f17, %f29
	.word	0xd4300019	! t0_kref+0xe80:   	sth	%o2, [%g0 + %i1]
	.word	0x2a800004	! t0_kref+0xe84:   	bcs,a	_kref+0xe94
	.word	0xa8282e5c	! t0_kref+0xe88:   	andn	%g0, 0xe5c, %l4
	.word	0x39800002	! t0_kref+0xe8c:   	fbuge,a	_kref+0xe94
	.word	0x1336f037	! t0_kref+0xe90:   	sethi	%hi(0xdbc0dc00), %o1
	.word	0xd620a01c	! t0_kref+0xe94:   	st	%o3, [%g2 + 0x1c]
	.word	0xe068a012	! t0_kref+0xe98:   	ldstub	[%g2 + 0x12], %l0
	.word	0xa1a01a5a	! t0_kref+0xe9c:   	fdtoi	%f26, %f16
	.word	0xa1b00cce	! t0_kref+0xea0:   	fnot2	%f14, %f16
	.word	0x9fc00004	! t0_kref+0xea4:   	call	%g0 + %g4
	.word	0x9db44d35	! t0_kref+0xea8:   	fandnot1s	%f17, %f21, %f14
	.word	0xd2563fe4	! t0_kref+0xeac:   	ldsh	[%i0 - 0x1c], %o1
	.word	0x91b2c156	! t0_kref+0xeb0:   	edge32l	%o3, %l6, %o0
	.word	0xb5b00cec	! t0_kref+0xeb4:   	fnot2s	%f12, %f26
	.word	0x9fc00004	! t0_kref+0xeb8:   	call	%g0 + %g4
	.word	0xd7e61000	! t0_kref+0xebc:   	casa	[%i0]0x80, %g0, %o3
	.word	0xe2e81018	! t0_kref+0xec0:   	ldstuba	[%g0 + %i0]0x80, %l1
	.word	0x34800005	! t0_kref+0xec4:   	bg,a	_kref+0xed8
	.word	0xc028a01a	! t0_kref+0xec8:   	clrb	[%g2 + 0x1a]
	.word	0x9e8b2b85	! t0_kref+0xecc:   	andcc	%o4, 0xb85, %o7
	.word	0xe47f0018	! t0_kref+0xed0:   	swap	[%i4 + %i0], %l2
	.word	0xa1a00550	! t0_kref+0xed4:   	fsqrtd	%f16, %f16
	.word	0x9a602c0d	! t0_kref+0xed8:   	subc	%g0, 0xc0d, %o5
	.word	0xc1ee100c	! t0_kref+0xedc:   	prefetcha	%i0 + %o4, 0
	.word	0xa1a00536	! t0_kref+0xee0:   	fsqrts	%f22, %f16
	.word	0xf42e0000	! t0_kref+0xee4:   	stb	%i2, [%i0]
	.word	0x8143c000	! t0_kref+0xee8:   	stbar
	.word	0xa8db400d	! t0_kref+0xeec:   	smulcc	%o5, %o5, %l4
	.word	0xd408a01f	! t0_kref+0xef0:   	ldub	[%g2 + 0x1f], %o2
	.word	0x94fdfb70	! t0_kref+0xef4:   	sdivcc	%l7, -0x490, %o2
	.word	0xd648a020	! t0_kref+0xef8:   	ldsb	[%g2 + 0x20], %o3
	.word	0x001fffff	! t0_kref+0xefc:   	illtrap	0x1fffff
	.word	0x30800008	! t0_kref+0xf00:   	ba,a	_kref+0xf20
	.word	0x98aaa572	! t0_kref+0xf04:   	andncc	%o2, 0x572, %o4
	.word	0xb1b78ea0	! t0_kref+0xf08:   	fsrc1s	%f30, %f24
	.word	0xb5b48d40	! t0_kref+0xf0c:   	fnot1	%f18, %f26
	call	SYM(t0_subr2)
	.word	0xa0b2c00c	! t0_kref+0xf14:   	orncc	%o3, %o4, %l0
	.word	0x9da58d34	! t0_kref+0xf18:   	fsmuld	%f22, %f20, %f14
	.word	0xa7a5c837	! t0_kref+0xf1c:   	fadds	%f23, %f23, %f19
	.word	0xeb263fec	! t0_kref+0xf20:   	st	%f21, [%i0 - 0x14]
	.word	0xfb00a000	! t0_kref+0xf24:   	ld	[%g2], %f29
	.word	0xa1a0002d	! t0_kref+0xf28:   	fmovs	%f13, %f16
	.word	0x34800008	! t0_kref+0xf2c:   	bg,a	_kref+0xf4c
	.word	0x91b2c017	! t0_kref+0xf30:   	edge8	%o3, %l7, %o0
	.word	0xf7070019	! t0_kref+0xf34:   	ld	[%i4 + %i1], %f27
	.word	0x9e724016	! t0_kref+0xf38:   	udiv	%o1, %l6, %o7
	.word	0x9fc00004	! t0_kref+0xf3c:   	call	%g0 + %g4
	.word	0xaf2a8009	! t0_kref+0xf40:   	sll	%o2, %o1, %l7
	.word	0x97400000	! t0_kref+0xf44:   	mov	%y, %o3
	.word	0xda2e7ff5	! t0_kref+0xf48:   	stb	%o5, [%i1 - 0xb]
	.word	0xc020a028	! t0_kref+0xf4c:   	clr	[%g2 + 0x28]
	.word	0x8022800d	! t0_kref+0xf50:   	sub	%o2, %o5, %g0
	.word	0xf420a00c	! t0_kref+0xf54:   	st	%i2, [%g2 + 0xc]
	.word	0xaa2d400c	! t0_kref+0xf58:   	andn	%l5, %o4, %l5
	.word	0x9da0054e	! t0_kref+0xf5c:   	fsqrtd	%f14, %f14
	.word	0xeaae9019	! t0_kref+0xf60:   	stba	%l5, [%i2 + %i1]0x80
	.word	0x99b70d90	! t0_kref+0xf64:   	fxor	%f28, %f16, %f12
	.word	0xd2e81018	! t0_kref+0xf68:   	ldstuba	[%g0 + %i0]0x80, %o1
	.word	0x963a0009	! t0_kref+0xf6c:   	xnor	%o0, %o1, %o3
	.word	0x81abca39	! t0_kref+0xf70:   	fcmps	%fcc0, %f15, %f25
	.word	0xda20a000	! t0_kref+0xf74:   	st	%o5, [%g2]
	.word	0xe07e001c	! t0_kref+0xf78:   	swap	[%i0 + %i4], %l0
	.word	0xadb54049	! t0_kref+0xf7c:   	edge8l	%l5, %o1, %l6
	.word	0xf1066004	! t0_kref+0xf80:   	ld	[%i1 + 4], %f24
	.word	0x30480004	! t0_kref+0xf84:   	ba,a,pt	%icc, _kref+0xf94
	.word	0xc3ee100a	! t0_kref+0xf88:   	prefetcha	%i0 + %o2, 1
	.word	0x92aa801a	! t0_kref+0xf8c:   	andncc	%o2, %i2, %o1
	.word	0xbda00537	! t0_kref+0xf90:   	fsqrts	%f23, %f30
	.word	0x97b0004d	! t0_kref+0xf94:   	edge8l	%g0, %o5, %o3
	.word	0xd608a035	! t0_kref+0xf98:   	ldub	[%g2 + 0x35], %o3
	.word	0x292783e3	! t0_kref+0xf9c:   	sethi	%hi(0x9e0f8c00), %l4
	.word	0xecc6101c	! t0_kref+0xfa0:   	ldswa	[%i0 + %i4]0x80, %l6
	.word	0xdf266010	! t0_kref+0xfa4:   	st	%f15, [%i1 + 0x10]
	.word	0xae3df625	! t0_kref+0xfa8:   	xnor	%l7, -0x9db, %l7
	.word	0xadb484ce	! t0_kref+0xfac:   	fcmpne32	%f18, %f14, %l6
	.word	0xe8064000	! t0_kref+0xfb0:   	ld	[%i1], %l4
	.word	0x9122ef6b	! t0_kref+0xfb4:   	mulscc	%o3, 0xf6b, %o0
	.word	0xec40a034	! t0_kref+0xfb8:   	ldsw	[%g2 + 0x34], %l6
	.word	0x9da000ae	! t0_kref+0xfbc:   	fnegs	%f14, %f14
	.word	0xc168a046	! t0_kref+0xfc0:   	prefetch	%g2 + 0x46, 0
	.word	0xabb0077e	! t0_kref+0xfc4:   	fpack16	%f30, %f21
	.word	0xa6e28017	! t0_kref+0xfc8:   	subccc	%o2, %l7, %l3
	.word	0xc807bfec	! t0_kref+0xfcc:   	ld	[%fp - 0x14], %g4
	.word	0xa486a612	! t0_kref+0xfd0:   	addcc	%i2, 0x612, %l2
	.word	0x9e720008	! t0_kref+0xfd4:   	udiv	%o0, %o0, %o7
	.word	0x81dc0013	! t0_kref+0xfd8:   	flush	%l0 + %l3
	.word	0xea56401b	! t0_kref+0xfdc:   	ldsh	[%i1 + %i3], %l5
	.word	0xf207bfe0	! t0_kref+0xfe0:   	ld	[%fp - 0x20], %i1
	.word	0xa42b31eb	! t0_kref+0xfe4:   	andn	%o4, -0xe15, %l2
	.word	0xad35601e	! t0_kref+0xfe8:   	srl	%l5, 0x1e, %l6
	.word	0xd406200c	! t0_kref+0xfec:   	ld	[%i0 + 0xc], %o2
	.word	0xbba01a3a	! t0_kref+0xff0:   	fstoi	%f26, %f29
	.word	0xe11e7ff0	! t0_kref+0xff4:   	ldd	[%i1 - 0x10], %f16
	.word	0x99a000d0	! t0_kref+0xff8:   	fnegd	%f16, %f12
	.word	0x9ebd7eba	! t0_kref+0xffc:   	xnorcc	%l5, -0x146, %o7
	.word	0x9da709de	! t0_kref+0x1000:   	fdivd	%f28, %f30, %f14
	.word	0x9fa01a5a	! t0_kref+0x1004:   	fdtoi	%f26, %f15
	.word	0x0135d141	! t0_kref+0x1008:   	sethi	%hi(0xd7450400), %g0
	.word	0xa9a00550	! t0_kref+0x100c:   	fsqrtd	%f16, %f20
	.word	0xe6070018	! t0_kref+0x1010:   	ld	[%i4 + %i0], %l3
	.word	0xaa55c01a	! t0_kref+0x1014:   	umul	%l7, %i2, %l5
	.word	0x9ba01a32	! t0_kref+0x1018:   	fstoi	%f18, %f13
	.word	0xe300a01c	! t0_kref+0x101c:   	ld	[%g2 + 0x1c], %f17
	.word	0x9fc00004	! t0_kref+0x1020:   	call	%g0 + %g4
	.word	0xf7260000	! t0_kref+0x1024:   	st	%f27, [%i0]
	.word	0x81ae0ada	! t0_kref+0x1028:   	fcmped	%fcc0, %f24, %f26
	.word	0xd47e4000	! t0_kref+0x102c:   	swap	[%i1], %o2
	.word	0xb9b68914	! t0_kref+0x1030:   	faligndata	%f26, %f20, %f28
	.word	0x9fb00cee	! t0_kref+0x1034:   	fnot2s	%f14, %f15
	.word	0xada0193d	! t0_kref+0x1038:   	fstod	%f29, %f22
	.word	0xeef6101d	! t0_kref+0x103c:   	stxa	%l7, [%i0 + %i5]0x80
	.word	0x81ddc01d	! t0_kref+0x1040:   	flush	%l7 + %i5
	.word	0xa1a01a36	! t0_kref+0x1044:   	fstoi	%f22, %f16
	.word	0xf4280019	! t0_kref+0x1048:   	stb	%i2, [%g0 + %i1]
	.word	0xb5a4885e	! t0_kref+0x104c:   	faddd	%f18, %f30, %f26
	.word	0xa63b605e	! t0_kref+0x1050:   	xnor	%o5, 0x5e, %l3
	.word	0xa1a0055a	! t0_kref+0x1054:   	fsqrtd	%f26, %f16
	.word	0xd410a00a	! t0_kref+0x1058:   	lduh	[%g2 + 0xa], %o2
	.word	0x90f2c000	! t0_kref+0x105c:   	udivcc	%o3, %g0, %o0
	.word	0xacaac01a	! t0_kref+0x1060:   	andncc	%o3, %i2, %l6
	.word	0x9af34015	! t0_kref+0x1064:   	udivcc	%o5, %l5, %o5
	.word	0xbda609d4	! t0_kref+0x1068:   	fdivd	%f24, %f20, %f30
	.word	0xee4e7ff2	! t0_kref+0x106c:   	ldsb	[%i1 - 0xe], %l7
	.word	0x9e3b295d	! t0_kref+0x1070:   	xnor	%o4, 0x95d, %o7
	.word	0x20480003	! t0_kref+0x1074:   	bn,a,pt	%icc, _kref+0x1080
	.word	0xafb3ccaf	! t0_kref+0x1078:   	fandnot2s	%f15, %f15, %f23
	.word	0xae2ae194	! t0_kref+0x107c:   	andn	%o3, 0x194, %l7
	.word	0x8143c000	! t0_kref+0x1080:   	stbar
	.word	0xb7a018d4	! t0_kref+0x1084:   	fdtos	%f20, %f27
	.word	0x251b6778	! t0_kref+0x1088:   	sethi	%hi(0x6d9de000), %l2
	.word	0x982b4008	! t0_kref+0x108c:   	andn	%o5, %o0, %o4
	call	SYM(t0_subr0)
	.word	0xa0282691	! t0_kref+0x1094:   	andn	%g0, 0x691, %l0
	.word	0xef00a01c	! t0_kref+0x1098:   	ld	[%g2 + 0x1c], %f23
	.word	0xa5a589de	! t0_kref+0x109c:   	fdivd	%f22, %f30, %f18
	.word	0x26800005	! t0_kref+0x10a0:   	bl,a	_kref+0x10b4
	.word	0x9a1aba1f	! t0_kref+0x10a4:   	xor	%o2, -0x5e1, %o5
	.word	0xe3ee501a	! t0_kref+0x10a8:   	prefetcha	%i1 + %i2, 17
	.word	0xa61a0009	! t0_kref+0x10ac:   	xor	%o0, %o1, %l3
	.word	0x81b2c240	! t0_kref+0x10b0:   	array16	%o3, %g0, %g0
	.word	0xb7a00530	! t0_kref+0x10b4:   	fsqrts	%f16, %f27
	.word	0xadb00cda	! t0_kref+0x10b8:   	fnot2	%f26, %f22
	.word	0x34480003	! t0_kref+0x10bc:   	bg,a,pt	%icc, _kref+0x10c8
	.word	0xe87e601c	! t0_kref+0x10c0:   	swap	[%i1 + 0x1c], %l4
	.word	0xe5180018	! t0_kref+0x10c4:   	ldd	[%g0 + %i0], %f18
	.word	0xd636200a	! t0_kref+0x10c8:   	sth	%o3, [%i0 + 0xa]
	.word	0xf5267fe4	! t0_kref+0x10cc:   	st	%f26, [%i1 - 0x1c]
	.word	0x80f5c00c	! t0_kref+0x10d0:   	udivcc	%l7, %o4, %g0
	.word	0x99b5400c	! t0_kref+0x10d4:   	edge8	%l5, %o4, %o4
	.word	0xeb68a08c	! t0_kref+0x10d8:   	prefetch	%g2 + 0x8c, 21
	.word	0xf42e0000	! t0_kref+0x10dc:   	stb	%i2, [%i0]
	.word	0xa1a00554	! t0_kref+0x10e0:   	fsqrtd	%f20, %f16
	.word	0xa5b6cdfd	! t0_kref+0x10e4:   	fnands	%f27, %f29, %f18
	.word	0xb5b3071c	! t0_kref+0x10e8:   	fmuld8sux16	%f12, %f28, %f26
	.word	0x9ee34008	! t0_kref+0x10ec:   	subccc	%o5, %o0, %o7
	.word	0xeaa6101c	! t0_kref+0x10f0:   	sta	%l5, [%i0 + %i4]0x80
	.word	0xd0264000	! t0_kref+0x10f4:   	st	%o0, [%i1]
	.word	0xd9be5855	! t0_kref+0x10f8:   	stda	%f12, [%i1 + %l5]0xc2
	.word	0xd88e101a	! t0_kref+0x10fc:   	lduba	[%i0 + %i2]0x80, %o4
	.word	0xb1a00158	! t0_kref+0x1100:   	fabsd	%f24, %f24
	.word	0xae1e800a	! t0_kref+0x1104:   	xor	%i2, %o2, %l7
	.word	0x9072bcd7	! t0_kref+0x1108:   	udiv	%o2, -0x329, %o0
	.word	0x8143c000	! t0_kref+0x110c:   	stbar
	.word	0x9de3bfa0	! t0_kref+0x1110:   	save	%sp, -0x60, %sp
	.word	0xb2c7277f	! t0_kref+0x1114:   	addccc	%i4, 0x77f, %i1
	.word	0x9beebced	! t0_kref+0x1118:   	restore	%i2, -0x313, %o5
	.word	0xaa0b271b	! t0_kref+0x111c:   	and	%o4, 0x71b, %l5
	.word	0x8133601e	! t0_kref+0x1120:   	srl	%o5, 0x1e, %g0
	.word	0x91400000	! t0_kref+0x1124:   	mov	%y, %o0
	.word	0xadb300d5	! t0_kref+0x1128:   	edge16l	%o4, %l5, %l6
	.word	0xdb801019	! t0_kref+0x112c:   	lda	[%g0 + %i1]0x80, %f13
	.word	0x9aab76fd	! t0_kref+0x1130:   	andncc	%o5, -0x903, %o5
	.word	0x26800003	! t0_kref+0x1134:   	bl,a	_kref+0x1140
	.word	0xb5a01a5c	! t0_kref+0x1138:   	fdtoi	%f28, %f26
	.word	0xdb264000	! t0_kref+0x113c:   	st	%f13, [%i1]
	.word	0xec50a01e	! t0_kref+0x1140:   	ldsh	[%g2 + 0x1e], %l6
	.word	0xf430a028	! t0_kref+0x1144:   	sth	%i2, [%g2 + 0x28]
	.word	0x8143c000	! t0_kref+0x1148:   	stbar
	.word	0xe868a02e	! t0_kref+0x114c:   	ldstub	[%g2 + 0x2e], %l4
	.word	0xa5a0012e	! t0_kref+0x1150:   	fabss	%f14, %f18
	.word	0xa9a0054c	! t0_kref+0x1154:   	fsqrtd	%f12, %f20
	.word	0xec30a02c	! t0_kref+0x1158:   	sth	%l6, [%g2 + 0x2c]
	.word	0xe4563fe4	! t0_kref+0x115c:   	ldsh	[%i0 - 0x1c], %l2
	.word	0xc807bff0	! t0_kref+0x1160:   	ld	[%fp - 0x10], %g4
	.word	0x9e522e8a	! t0_kref+0x1164:   	umul	%o0, 0xe8a, %o7
	.word	0xadb30e16	! t0_kref+0x1168:   	fand	%f12, %f22, %f22
	.word	0xaca80016	! t0_kref+0x116c:   	andncc	%g0, %l6, %l6
	.word	0xa1a00558	! t0_kref+0x1170:   	fsqrtd	%f24, %f16
	.word	0xaa257411	! t0_kref+0x1174:   	sub	%l5, -0xbef, %l5
	.word	0xe400a030	! t0_kref+0x1178:   	ld	[%g2 + 0x30], %l2
	.word	0xa85b400c	! t0_kref+0x117c:   	smul	%o5, %o4, %l4
	.word	0xa635c01a	! t0_kref+0x1180:   	orn	%l7, %i2, %l3
	.word	0xa8168009	! t0_kref+0x1184:   	or	%i2, %o1, %l4
	.word	0xb7a0053c	! t0_kref+0x1188:   	fsqrts	%f28, %f27
	.word	0x9da58854	! t0_kref+0x118c:   	faddd	%f22, %f20, %f14
	.word	0xe07e4000	! t0_kref+0x1190:   	swap	[%i1], %l0
	.word	0xb9b4ccac	! t0_kref+0x1194:   	fandnot2s	%f19, %f12, %f28
	.word	0xea267fec	! t0_kref+0x1198:   	st	%l5, [%i1 - 0x14]
	.word	0xea070018	! t0_kref+0x119c:   	ld	[%i4 + %i0], %l5
	.word	0xac62afaa	! t0_kref+0x11a0:   	subc	%o2, 0xfaa, %l6
	.word	0x9fc00004	! t0_kref+0x11a4:   	call	%g0 + %g4
	.word	0xb5a448b7	! t0_kref+0x11a8:   	fsubs	%f17, %f23, %f26
	.word	0xa8e2f4a4	! t0_kref+0x11ac:   	subccc	%o3, -0xb5c, %l4
	.word	0xd2c6501c	! t0_kref+0x11b0:   	ldswa	[%i1 + %i4]0x80, %o1
	.word	0xa702801a	! t0_kref+0x11b4:   	taddcc	%o2, %i2, %l3
	.word	0xac2d4015	! t0_kref+0x11b8:   	andn	%l5, %l5, %l6
	.word	0x2b3086fb	! t0_kref+0x11bc:   	sethi	%hi(0xc21bec00), %l5
	.word	0x32480002	! t0_kref+0x11c0:   	bne,a,pt	%icc, _kref+0x11c8
	.word	0x9a5ebdaf	! t0_kref+0x11c4:   	smul	%i2, -0x251, %o5
	.word	0x81db8013	! t0_kref+0x11c8:   	flush	%sp + %l3
	.word	0x9de3bfa0	! t0_kref+0x11cc:   	save	%sp, -0x60, %sp
	.word	0xb497401c	! t0_kref+0x11d0:   	orcc	%i5, %i4, %i2
	.word	0x81e823a8	! t0_kref+0x11d4:   	restore	%g0, 0x3a8, %g0
	.word	0x3e800001	! t0_kref+0x11d8:   	bvc,a	_kref+0x11dc
	.word	0x98d5c017	! t0_kref+0x11dc:   	umulcc	%l7, %l7, %o4
	.word	0xd2f61000	! t0_kref+0x11e0:   	stxa	%o1, [%i0]0x80
	.word	0xa8e5b821	! t0_kref+0x11e4:   	subccc	%l6, -0x7df, %l4
	.word	0x9436b60c	! t0_kref+0x11e8:   	orn	%i2, -0x9f4, %o2
	.word	0xa92b6007	! t0_kref+0x11ec:   	sll	%o5, 0x7, %l4
	.word	0xe656c019	! t0_kref+0x11f0:   	ldsh	[%i3 + %i1], %l3
	.word	0xa9a388d0	! t0_kref+0x11f4:   	fsubd	%f14, %f16, %f20
	.word	0x38800004	! t0_kref+0x11f8:   	bgu,a	_kref+0x1208
	.word	0xe920a010	! t0_kref+0x11fc:   	st	%f20, [%g2 + 0x10]
	.word	0xb1a60850	! t0_kref+0x1200:   	faddd	%f24, %f16, %f24
	.word	0x3d800007	! t0_kref+0x1204:   	fbule,a	_kref+0x1220
	.word	0x93258009	! t0_kref+0x1208:   	mulscc	%l6, %o1, %o1
	.word	0xd040a004	! t0_kref+0x120c:   	ldsw	[%g2 + 4], %o0
	.word	0xa732600f	! t0_kref+0x1210:   	srl	%o1, 0xf, %l3
	.word	0x97280015	! t0_kref+0x1214:   	sll	%g0, %l5, %o3
	.word	0xdd26201c	! t0_kref+0x1218:   	st	%f14, [%i0 + 0x1c]
	.word	0xa8fb0008	! t0_kref+0x121c:   	sdivcc	%o4, %o0, %l4
	.word	0x83414000	! t0_kref+0x1220:   	mov	%pc, %g1
	.word	0x38800008	! t0_kref+0x1224:   	bgu,a	_kref+0x1244
	.word	0xaf2b200f	! t0_kref+0x1228:   	sll	%o4, 0xf, %l7
	.word	0xa1a00133	! t0_kref+0x122c:   	fabss	%f19, %f16
	.word	0xada00550	! t0_kref+0x1230:   	fsqrtd	%f16, %f22
	.word	0x9ea80015	! t0_kref+0x1234:   	andncc	%g0, %l5, %o7
	.word	0xb5b3072c	! t0_kref+0x1238:   	fmuld8ulx16	%f12, %f12, %f26
	.word	0xb3a01a37	! t0_kref+0x123c:   	fstoi	%f23, %f25
	.word	0xb1a000b1	! t0_kref+0x1240:   	fnegs	%f17, %f24
	.word	0xab1a000a	! t0_kref+0x1244:   	tsubcctv	%o0, %o2, %l5
	.word	0xd4063fe4	! t0_kref+0x1248:   	ld	[%i0 - 0x1c], %o2
	.word	0xdf20a030	! t0_kref+0x124c:   	st	%f15, [%g2 + 0x30]
	.word	0xdf00a03c	! t0_kref+0x1250:   	ld	[%g2 + 0x3c], %f15
	.word	0xafa38838	! t0_kref+0x1254:   	fadds	%f14, %f24, %f23
	.word	0xd830a03a	! t0_kref+0x1258:   	sth	%o4, [%g2 + 0x3a]
	.word	0xe1be5809	! t0_kref+0x125c:   	stda	%f16, [%i1 + %o1]0xc0
	.word	0xdf064000	! t0_kref+0x1260:   	ld	[%i1], %f15
	.word	0xb5a0054c	! t0_kref+0x1264:   	fsqrtd	%f12, %f26
	.word	0x3c800005	! t0_kref+0x1268:   	bpos,a	_kref+0x127c
	.word	0xa5a01896	! t0_kref+0x126c:   	fitos	%f22, %f18
	.word	0xa540c000	! t0_kref+0x1270:   	mov	%asi, %l2
	.word	0x99a0110e	! t0_kref+0x1274:   	fxtod	%f14, %f12
	.word	0x94e2800a	! t0_kref+0x1278:   	subccc	%o2, %o2, %o2
	.word	0x99a0012f	! t0_kref+0x127c:   	fabss	%f15, %f12
	.word	0xd67e7fe8	! t0_kref+0x1280:   	swap	[%i1 - 0x18], %o3
	.word	0xa1b58ea0	! t0_kref+0x1284:   	fsrc1s	%f22, %f16
	.word	0xbba01a54	! t0_kref+0x1288:   	fdtoi	%f20, %f29
	.word	0xd2ae9018	! t0_kref+0x128c:   	stba	%o1, [%i2 + %i0]0x80
	.word	0xb3a01a3d	! t0_kref+0x1290:   	fstoi	%f29, %f25
	.word	0xd448a013	! t0_kref+0x1294:   	ldsb	[%g2 + 0x13], %o2
	.word	0x81830000	! t0_kref+0x1298:   	wr	%o4, %g0, %y
	.word	0xea861000	! t0_kref+0x129c:   	lda	[%i0]0x80, %l5
	.word	0xe3260000	! t0_kref+0x12a0:   	st	%f17, [%i0]
	.word	0x9f202215	! t0_kref+0x12a4:   	mulscc	%g0, 0x215, %o7
	.word	0xa8aa72a6	! t0_kref+0x12a8:   	andncc	%o1, -0xd5a, %l4
	.word	0xd236600c	! t0_kref+0x12ac:   	sth	%o1, [%i1 + 0xc]
	.word	0x99b00f18	! t0_kref+0x12b0:   	fsrc2	%f24, %f12
	.word	0x22800001	! t0_kref+0x12b4:   	be,a	_kref+0x12b8
	.word	0x9f12bbb8	! t0_kref+0x12b8:   	taddcctv	%o2, -0x448, %o7
	.word	0xd8180019	! t0_kref+0x12bc:   	ldd	[%g0 + %i1], %o4
	.word	0x9932a000	! t0_kref+0x12c0:   	srl	%o2, 0x0, %o4
	.word	0x9da00531	! t0_kref+0x12c4:   	fsqrts	%f17, %f14
	.word	0x8143c000	! t0_kref+0x12c8:   	stbar
	.word	0x2c480005	! t0_kref+0x12cc:   	bneg,a,pt	%icc, _kref+0x12e0
	.word	0xe91fbc20	! t0_kref+0x12d0:   	ldd	[%fp - 0x3e0], %f20
	.word	0x81ae0ad6	! t0_kref+0x12d4:   	fcmped	%fcc0, %f24, %f22
	.word	0x92e00016	! t0_kref+0x12d8:   	subccc	%g0, %l6, %o1
	.word	0x8063000d	! t0_kref+0x12dc:   	subc	%o4, %o5, %g0
	.word	0x39480003	! t0_kref+0x12e0:   	fbuge,a,pt	%fcc0, _kref+0x12ec
	.word	0xc0563fee	! t0_kref+0x12e4:   	ldsh	[%i0 - 0x12], %g0
	.word	0xd24e8019	! t0_kref+0x12e8:   	ldsb	[%i2 + %i1], %o1
	.word	0xa81a400c	! t0_kref+0x12ec:   	xor	%o1, %o4, %l4
	.word	0x9db00cd2	! t0_kref+0x12f0:   	fnot2	%f18, %f14
	.word	0xd030a012	! t0_kref+0x12f4:   	sth	%o0, [%g2 + 0x12]
	.word	0x94a5ef40	! t0_kref+0x12f8:   	subcc	%l7, 0xf40, %o2
	.word	0xfd1f4018	! t0_kref+0x12fc:   	ldd	[%i5 + %i0], %f30
	.word	0x96fd76b7	! t0_kref+0x1300:   	sdivcc	%l5, -0x949, %o3
	.word	0x96626937	! t0_kref+0x1304:   	subc	%o1, 0x937, %o3
	.word	0xb9a00554	! t0_kref+0x1308:   	fsqrtd	%f20, %f28
	.word	0xec06001c	! t0_kref+0x130c:   	ld	[%i0 + %i4], %l6
	.word	0xb5b7891a	! t0_kref+0x1310:   	faligndata	%f30, %f26, %f26
	.word	0xb3b00fe0	! t0_kref+0x1314:   	fones	%f25
	.word	0x99b786d8	! t0_kref+0x1318:   	fmul8sux16	%f30, %f24, %f12
	.word	0x9e50001a	! t0_kref+0x131c:   	umul	%g0, %i2, %o7
	.word	0x92e56281	! t0_kref+0x1320:   	subccc	%l5, 0x281, %o1
	.word	0xabb68117	! t0_kref+0x1324:   	edge32	%i2, %l7, %l5
	.word	0x800b4009	! t0_kref+0x1328:   	and	%o5, %o1, %g0
	.word	0xb5b5097b	! t0_kref+0x132c:   	fpmerge	%f20, %f27, %f26
	.word	0xe7ee101d	! t0_kref+0x1330:   	prefetcha	%i0 + %i5, 19
	.word	0x9bb00cf1	! t0_kref+0x1334:   	fnot2s	%f17, %f13
	.word	0x9de3bfa0	! t0_kref+0x1338:   	save	%sp, -0x60, %sp
	.word	0xb0400018	! t0_kref+0x133c:   	addc	%g0, %i0, %i0
	.word	0x81ee001a	! t0_kref+0x1340:   	restore	%i0, %i2, %g0
	.word	0xa5b407d2	! t0_kref+0x1344:   	pdist	%f16, %f18, %f18
	.word	0x9db58a9c	! t0_kref+0x1348:   	fpsub16	%f22, %f28, %f14
	.word	0x21800005	! t0_kref+0x134c:   	fbn,a	_kref+0x1360
	.word	0xd04e0000	! t0_kref+0x1350:   	ldsb	[%i0], %o0
	.word	0xd220a010	! t0_kref+0x1354:   	st	%o1, [%g2 + 0x10]
	.word	0xdb801018	! t0_kref+0x1358:   	lda	[%g0 + %i0]0x80, %f13
	.word	0x29800004	! t0_kref+0x135c:   	fbl,a	_kref+0x136c
	.word	0x9476800a	! t0_kref+0x1360:   	udiv	%i2, %o2, %o2
	.word	0xafa01a5e	! t0_kref+0x1364:   	fdtoi	%f30, %f23
	.word	0xa4658016	! t0_kref+0x1368:   	subc	%l6, %l6, %l2
	.word	0x99234008	! t0_kref+0x136c:   	mulscc	%o5, %o0, %o4
	.word	0xa6e36085	! t0_kref+0x1370:   	subccc	%o5, 0x85, %l3
	.word	0x91b2c04c	! t0_kref+0x1374:   	edge8l	%o3, %o4, %o0
	.word	0xecbe501d	! t0_kref+0x1378:   	stda	%l6, [%i1 + %i5]0x80
	.word	0x29800004	! t0_kref+0x137c:   	fbl,a	_kref+0x138c
	.word	0xa9b5863a	! t0_kref+0x1380:   	fmul8x16	%f22, %f26, %f20
	.word	0x37800008	! t0_kref+0x1384:   	fbge,a	_kref+0x13a4
	.word	0xdd3e2000	! t0_kref+0x1388:   	std	%f14, [%i0]
	.word	0xd650a008	! t0_kref+0x138c:   	ldsh	[%g2 + 8], %o3
	.word	0xafa000ac	! t0_kref+0x1390:   	fnegs	%f12, %f23
	.word	0x9fa488bd	! t0_kref+0x1394:   	fsubs	%f18, %f29, %f15
	.word	0x1924a8c7	! t0_kref+0x1398:   	sethi	%hi(0x92a31c00), %o4
	.word	0xd42e4000	! t0_kref+0x139c:   	stb	%o2, [%i1]
	.word	0xea064000	! t0_kref+0x13a0:   	ld	[%i1], %l5
	.word	0x291678c1	! t0_kref+0x13a4:   	sethi	%hi(0x59e30400), %l4
	.word	0x27800006	! t0_kref+0x13a8:   	fbul,a	_kref+0x13c0
	.word	0x98adc00b	! t0_kref+0x13ac:   	andncc	%l7, %o3, %o4
	.word	0xecee501a	! t0_kref+0x13b0:   	ldstuba	[%i1 + %i2]0x80, %l6
	.word	0xa7b68175	! t0_kref+0x13b4:   	edge32ln	%i2, %l5, %l3
	.word	0xb1b78e5c	! t0_kref+0x13b8:   	fxnor	%f30, %f28, %f24
	.word	0xb5a0193a	! t0_kref+0x13bc:   	fstod	%f26, %f26
	.word	0x9f12c00d	! t0_kref+0x13c0:   	taddcctv	%o3, %o5, %o7
	.word	0xd00e401a	! t0_kref+0x13c4:   	ldub	[%i1 + %i2], %o0
	.word	0xa1b00ced	! t0_kref+0x13c8:   	fnot2s	%f13, %f16
	.word	0xa1a0055e	! t0_kref+0x13cc:   	fsqrtd	%f30, %f16
	.word	0xe410a030	! t0_kref+0x13d0:   	lduh	[%g2 + 0x30], %l2
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xa42a000b	! t0_kref+0x13dc:   	andn	%o0, %o3, %l2
1:	.word	0xa7a01a3c	! t0_kref+0x13e0:   	fstoi	%f28, %f19
	.word	0x96bb35f4	! t0_kref+0x13e4:   	xnorcc	%o4, -0xa0c, %o3
	.word	0xd020a02c	! t0_kref+0x13e8:   	st	%o0, [%g2 + 0x2c]
	.word	0xb1b6867c	! t0_kref+0x13ec:   	fmul8x16au	%f26, %f28, %f24
	.word	0xa91af151	! t0_kref+0x13f0:   	tsubcctv	%o3, -0xeaf, %l4
	.word	0x11180ccd	! t0_kref+0x13f4:   	sethi	%hi(0x60333400), %o0
	.word	0x91326018	! t0_kref+0x13f8:   	srl	%o1, 0x18, %o0
	.word	0xe4480018	! t0_kref+0x13fc:   	ldsb	[%g0 + %i0], %l2
	.word	0xd848a038	! t0_kref+0x1400:   	ldsb	[%g2 + 0x38], %o4
	.word	0xc02e6010	! t0_kref+0x1404:   	clrb	[%i1 + 0x10]
	.word	0xea40a004	! t0_kref+0x1408:   	ldsw	[%g2 + 4], %l5
	.word	0xd2270018	! t0_kref+0x140c:   	st	%o1, [%i4 + %i0]
	.word	0xdd263ff8	! t0_kref+0x1410:   	st	%f14, [%i0 - 8]
	.word	0xbbb007ae	! t0_kref+0x1414:   	fpackfix	%f14, %f29
	.word	0xa6f2c00c	! t0_kref+0x1418:   	udivcc	%o3, %o4, %l3
	.word	0xd9be2010	! t0_kref+0x141c:   	stda	%f12, [%i0 + 0x10]%asi
	.word	0xac22afc5	! t0_kref+0x1420:   	sub	%o2, 0xfc5, %l6
	.word	0xda50a01a	! t0_kref+0x1424:   	ldsh	[%g2 + 0x1a], %o5
	.word	0x3a480004	! t0_kref+0x1428:   	bcc,a,pt	%icc, _kref+0x1438
	.word	0x81de3942	! t0_kref+0x142c:   	flush	%i0 - 0x6be
	.word	0xbda00139	! t0_kref+0x1430:   	fabss	%f25, %f30
	.word	0xa865c00a	! t0_kref+0x1434:   	subc	%l7, %o2, %l4
	.word	0xd230a000	! t0_kref+0x1438:   	sth	%o1, [%g2]
	.word	0xd0564000	! t0_kref+0x143c:   	ldsh	[%i1], %o0
	.word	0x3b800005	! t0_kref+0x1440:   	fble,a	_kref+0x1454
	.word	0x9a0dc00c	! t0_kref+0x1444:   	and	%l7, %o4, %o5
	.word	0xec20a030	! t0_kref+0x1448:   	st	%l6, [%g2 + 0x30]
	.word	0xa8db6bf9	! t0_kref+0x144c:   	smulcc	%o5, 0xbf9, %l4
	.word	0x9da01931	! t0_kref+0x1450:   	fstod	%f17, %f14
	.word	0xbda000cc	! t0_kref+0x1454:   	fnegd	%f12, %f30
	.word	0xf13e001d	! t0_kref+0x1458:   	std	%f24, [%i0 + %i5]
	.word	0xc807bfe8	! t0_kref+0x145c:   	ld	[%fp - 0x18], %g4
	.word	0x9fc00004	! t0_kref+0x1460:   	call	%g0 + %g4
	.word	0x9af24000	! t0_kref+0x1464:   	udivcc	%o1, %g0, %o5
	.word	0xadb7463a	! t0_kref+0x1468:   	fmul8x16	%f29, %f26, %f22
	.word	0x81ad8a39	! t0_kref+0x146c:   	fcmps	%fcc0, %f22, %f25
	call	SYM(t0_subr2)
	.word	0xe83e4000	! t0_kref+0x1474:   	std	%l4, [%i1]
	.word	0xb9a01a33	! t0_kref+0x1478:   	fstoi	%f19, %f28
	.word	0xa4f5e6c8	! t0_kref+0x147c:   	udivcc	%l7, 0x6c8, %l2
	.word	0xc0200019	! t0_kref+0x1480:   	clr	[%g0 + %i1]
	.word	0x81df0000	! t0_kref+0x1484:   	flush	%i4
	.word	0x80f30000	! t0_kref+0x1488:   	udivcc	%o4, %g0, %g0
	.word	0xd8200018	! t0_kref+0x148c:   	st	%o4, [%g0 + %i0]
	.word	0xb9a78838	! t0_kref+0x1490:   	fadds	%f30, %f24, %f28
	.word	0x22800006	! t0_kref+0x1494:   	be,a	_kref+0x14ac
	.word	0xc0df5018	! t0_kref+0x1498:   	ldxa	[%i5 + %i0]0x80, %g0
	.word	0xc96e400d	! t0_kref+0x149c:   	prefetch	%i1 + %o5, 4
	.word	0x9922000b	! t0_kref+0x14a0:   	mulscc	%o0, %o3, %o4
	.word	0xd04e2014	! t0_kref+0x14a4:   	ldsb	[%i0 + 0x14], %o0
	.word	0xda30a01a	! t0_kref+0x14a8:   	sth	%o5, [%g2 + 0x1a]
	.word	0xa69d7187	! t0_kref+0x14ac:   	xorcc	%l5, -0xe79, %l3
	.word	0x952da01d	! t0_kref+0x14b0:   	sll	%l6, 0x1d, %o2
	.word	0x22800003	! t0_kref+0x14b4:   	be,a	_kref+0x14c0
	.word	0xa5b58d2d	! t0_kref+0x14b8:   	fandnot1s	%f22, %f13, %f18
	.word	0xf428a000	! t0_kref+0x14bc:   	stb	%i2, [%g2]
	.word	0xa1a0053a	! t0_kref+0x14c0:   	fsqrts	%f26, %f16
	.word	0x805563e6	! t0_kref+0x14c4:   	umul	%l5, 0x3e6, %g0
	.word	0xda7e6008	! t0_kref+0x14c8:   	swap	[%i1 + 8], %o5
	.word	0x9fb5812c	! t0_kref+0x14cc:   	edge32n	%l6, %o4, %o7
	.word	0xe168a048	! t0_kref+0x14d0:   	prefetch	%g2 + 0x48, 16
	.word	0x81ae8a3d	! t0_kref+0x14d4:   	fcmps	%fcc0, %f26, %f29
	.word	0xa4e58015	! t0_kref+0x14d8:   	subccc	%l6, %l5, %l2
	.word	0x9da60850	! t0_kref+0x14dc:   	faddd	%f24, %f16, %f14
	.word	0xae5220eb	! t0_kref+0x14e0:   	umul	%o0, 0xeb, %l7
	.word	0xf7262014	! t0_kref+0x14e4:   	st	%f27, [%i0 + 0x14]
	.word	0x3b800007	! t0_kref+0x14e8:   	fble,a	_kref+0x1504
	.word	0xa3b48d60	! t0_kref+0x14ec:   	fnot1s	%f18, %f17
	.word	0x902ea9e4	! t0_kref+0x14f0:   	andn	%i2, 0x9e4, %o0
	.word	0x9532e005	! t0_kref+0x14f4:   	srl	%o3, 0x5, %o2
	.word	0x25800008	! t0_kref+0x14f8:   	fblg,a	_kref+0x1518
	.word	0xc1ee100a	! t0_kref+0x14fc:   	prefetcha	%i0 + %o2, 0
	.word	0x9082f420	! t0_kref+0x1500:   	addcc	%o3, -0xbe0, %o0
	.word	0x9da01a5a	! t0_kref+0x1504:   	fdtoi	%f26, %f14
	.word	0xa69ac00b	! t0_kref+0x1508:   	xorcc	%o3, %o3, %l3
	.word	0xf96e401a	! t0_kref+0x150c:   	prefetch	%i1 + %i2, 28
	.word	0x9ef56e68	! t0_kref+0x1510:   	udivcc	%l5, 0xe68, %o7
	.word	0x9866a186	! t0_kref+0x1514:   	subc	%i2, 0x186, %o4
	.word	0x81ad8a35	! t0_kref+0x1518:   	fcmps	%fcc0, %f22, %f21
	.word	0xa685f42b	! t0_kref+0x151c:   	addcc	%l7, -0xbd5, %l3
	.word	0xb5b686cc	! t0_kref+0x1520:   	fmul8sux16	%f26, %f12, %f26
	.word	0xfd200018	! t0_kref+0x1524:   	st	%f30, [%g0 + %i0]
	.word	0x805ead75	! t0_kref+0x1528:   	smul	%i2, 0xd75, %g0
	.word	0xa5a64d2e	! t0_kref+0x152c:   	fsmuld	%f25, %f14, %f18
	.word	0xace5e5ab	! t0_kref+0x1530:   	subccc	%l7, 0x5ab, %l6
	.word	0x9fc00004	! t0_kref+0x1534:   	call	%g0 + %g4
	.word	0x809ae600	! t0_kref+0x1538:   	xorcc	%o3, 0x600, %g0
	.word	0x9a300009	! t0_kref+0x153c:   	orn	%g0, %o1, %o5
	.word	0xa3b00cf9	! t0_kref+0x1540:   	fnot2s	%f25, %f17
	.word	0xe81f4018	! t0_kref+0x1544:   	ldd	[%i5 + %i0], %l4
	.word	0x97b30280	! t0_kref+0x1548:   	array32	%o4, %g0, %o3
	.word	0xa8e57738	! t0_kref+0x154c:   	subccc	%l5, -0x8c8, %l4
	.word	0x9fc00004	! t0_kref+0x1550:   	call	%g0 + %g4
	.word	0xada00554	! t0_kref+0x1554:   	fsqrtd	%f20, %f22
	.word	0x9b32a002	! t0_kref+0x1558:   	srl	%o2, 0x2, %o5
	.word	0xb7b007be	! t0_kref+0x155c:   	fpackfix	%f30, %f27
	.word	0x9fc00004	! t0_kref+0x1560:   	call	%g0 + %g4
	.word	0xec48a01f	! t0_kref+0x1564:   	ldsb	[%g2 + 0x1f], %l6
	.word	0xd01e3fe0	! t0_kref+0x1568:   	ldd	[%i0 - 0x20], %o0
	.word	0x80724016	! t0_kref+0x156c:   	udiv	%o1, %l6, %g0
	.word	0x9fa84037	! t0_kref+0x1570:   	fmovsne	%fcc0, %f23, %f15
	.word	0xe44e4000	! t0_kref+0x1574:   	ldsb	[%i1], %l2
	.word	0xbbb00c20	! t0_kref+0x1578:   	fzeros	%f29
	.word	0x8143e040	! t0_kref+0x157c:   	membar	0x40
	.word	0x99a01a4c	! t0_kref+0x1580:   	fdtoi	%f12, %f12
	.word	0x94dd6ff6	! t0_kref+0x1584:   	smulcc	%l5, 0xff6, %o2
	.word	0x9f32e01c	! t0_kref+0x1588:   	srl	%o3, 0x1c, %o7
	.word	0xc028a014	! t0_kref+0x158c:   	clrb	[%g2 + 0x14]
	.word	0x81ae4a36	! t0_kref+0x1590:   	fcmps	%fcc0, %f25, %f22
	.word	0x81ae0a52	! t0_kref+0x1594:   	fcmpd	%fcc0, %f24, %f18
	.word	0x81ae8a3a	! t0_kref+0x1598:   	fcmps	%fcc0, %f26, %f26
	.word	0xc0280018	! t0_kref+0x159c:   	clrb	[%g0 + %i0]
	.word	0xf11e401d	! t0_kref+0x15a0:   	ldd	[%i1 + %i5], %f24
	.word	0xd900a02c	! t0_kref+0x15a4:   	ld	[%g2 + 0x2c], %f12
	.word	0x81abca2e	! t0_kref+0x15a8:   	fcmps	%fcc0, %f15, %f14
	.word	0x9ada6956	! t0_kref+0x15ac:   	smulcc	%o1, 0x956, %o5
	.word	0xea00a03c	! t0_kref+0x15b0:   	ld	[%g2 + 0x3c], %l5
	.word	0x8143e040	! t0_kref+0x15b4:   	membar	0x40
	.word	0x3b480002	! t0_kref+0x15b8:   	fble,a,pt	%fcc0, _kref+0x15c0
	.word	0xea06401c	! t0_kref+0x15bc:   	ld	[%i1 + %i4], %l5
	.word	0xfb6e7fe0	! t0_kref+0x15c0:   	prefetch	%i1 - 0x20, 29
	.word	0x86102016	! t0_kref+0x15c4:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x15c8:   	subcc	%g3, 1, %g3
	.word	0x2280001e	! t0_kref+0x15cc:   	be,a	_kref+0x1644
	.word	0xa6f00016	! t0_kref+0x15d0:   	udivcc	%g0, %l6, %l3
	.word	0xaba38832	! t0_kref+0x15d4:   	fadds	%f14, %f18, %f21
	.word	0xa1a00550	! t0_kref+0x15d8:   	fsqrtd	%f16, %f16
	.word	0xe83f4018	! t0_kref+0x15dc:   	std	%l4, [%i5 + %i0]
	.word	0xb5a01917	! t0_kref+0x15e0:   	fitod	%f23, %f26
	.word	0xc05e7fe8	! t0_kref+0x15e4:   	ldx	[%i1 - 0x18], %g0
	.word	0xfd270018	! t0_kref+0x15e8:   	st	%f30, [%i4 + %i0]
	.word	0x99a01031	! t0_kref+0x15ec:   	fstox	%f17, %f12
	.word	0xee28a018	! t0_kref+0x15f0:   	stb	%l7, [%g2 + 0x18]
	.word	0xb5b00fe0	! t0_kref+0x15f4:   	fones	%f26
	.word	0x9460000c	! t0_kref+0x15f8:   	subc	%g0, %o4, %o2
	.word	0xa9b6c735	! t0_kref+0x15fc:   	fmuld8ulx16	%f27, %f21, %f20
	.word	0xa1a01056	! t0_kref+0x1600:   	fdtox	%f22, %f16
	.word	0xa9a01a52	! t0_kref+0x1604:   	fdtoi	%f18, %f20
	.word	0xe6062010	! t0_kref+0x1608:   	ld	[%i0 + 0x10], %l3
	.word	0x9db506ec	! t0_kref+0x160c:   	fmul8ulx16	%f20, %f12, %f14
	.word	0xd900a018	! t0_kref+0x1610:   	ld	[%g2 + 0x18], %f12
	.word	0x9445a35e	! t0_kref+0x1614:   	addc	%l6, 0x35e, %o2
	.word	0x90223d5b	! t0_kref+0x1618:   	sub	%o0, -0x2a5, %o0
	.word	0x81ae0a35	! t0_kref+0x161c:   	fcmps	%fcc0, %f24, %f21
	.word	0xc56e7fe0	! t0_kref+0x1620:   	prefetch	%i1 - 0x20, 2
	.word	0xb9b44972	! t0_kref+0x1624:   	fpmerge	%f17, %f18, %f28
	.word	0xd868a026	! t0_kref+0x1628:   	ldstub	[%g2 + 0x26], %o4
	.word	0x92d37a8c	! t0_kref+0x162c:   	umulcc	%o5, -0x574, %o1
	.word	0xeb68a043	! t0_kref+0x1630:   	prefetch	%g2 + 0x43, 21
	.word	0x9263363d	! t0_kref+0x1634:   	subc	%o4, -0x9c3, %o1
	.word	0xe19f1a18	! t0_kref+0x1638:   	ldda	[%i4 + %i0]0xd0, %f16
	.word	0x3d800001	! t0_kref+0x163c:   	fbule,a	_kref+0x1640
	.word	0xd4263ff0	! t0_kref+0x1640:   	st	%o2, [%i0 - 0x10]
	.word	0xb1b00cd6	! t0_kref+0x1644:   	fnot2	%f22, %f24
	.word	0xb9b38a96	! t0_kref+0x1648:   	fpsub16	%f14, %f22, %f28
	.word	0x3a800003	! t0_kref+0x164c:   	bcc,a	_kref+0x1658
	.word	0xada01896	! t0_kref+0x1650:   	fitos	%f22, %f22
	.word	0xd02e001a	! t0_kref+0x1654:   	stb	%o0, [%i0 + %i2]
	.word	0xe64e4000	! t0_kref+0x1658:   	ldsb	[%i1], %l3
	.word	0x9323747e	! t0_kref+0x165c:   	mulscc	%o5, -0xb82, %o1
	.word	0xb1b5466e	! t0_kref+0x1660:   	fmul8x16au	%f21, %f14, %f24
	.word	0xacfa0015	! t0_kref+0x1664:   	sdivcc	%o0, %l5, %l6
	.word	0xda50a02e	! t0_kref+0x1668:   	ldsh	[%g2 + 0x2e], %o5
	.word	0x95b2801a	! t0_kref+0x166c:   	edge8	%o2, %i2, %o2
	.word	0xf4a65000	! t0_kref+0x1670:   	sta	%i2, [%i1]0x80
	.word	0xdda01019	! t0_kref+0x1674:   	sta	%f14, [%g0 + %i1]0x80
	.word	0xa45a4008	! t0_kref+0x1678:   	smul	%o1, %o0, %l2
	.word	0x81830000	! t0_kref+0x167c:   	wr	%o4, %g0, %y
	.word	0x30480007	! t0_kref+0x1680:   	ba,a,pt	%icc, _kref+0x169c
	.word	0xadb00cce	! t0_kref+0x1684:   	fnot2	%f14, %f22
	.word	0x29037bf6	! t0_kref+0x1688:   	sethi	%hi(0xdefd800), %l4
	.word	0xa5b384d2	! t0_kref+0x168c:   	fcmpne32	%f14, %f18, %l2
	.word	0x9af5c00a	! t0_kref+0x1690:   	udivcc	%l7, %o2, %o5
	.word	0x81af0a34	! t0_kref+0x1694:   	fcmps	%fcc0, %f28, %f20
	.word	0xa5b70ed2	! t0_kref+0x1698:   	fornot2	%f28, %f18, %f18
	.word	0x9db74ea0	! t0_kref+0x169c:   	fsrc1s	%f29, %f14
	.word	0x98b33407	! t0_kref+0x16a0:   	orncc	%o4, -0xbf9, %o4
	.word	0xda28a012	! t0_kref+0x16a4:   	stb	%o5, [%g2 + 0x12]
	.word	0x90f2a9c2	! t0_kref+0x16a8:   	udivcc	%o2, 0x9c2, %o0
	.word	0xc04e401a	! t0_kref+0x16ac:   	ldsb	[%i1 + %i2], %g0
	.word	0xa5228000	! t0_kref+0x16b0:   	mulscc	%o2, %g0, %l2
	.word	0xd91e401d	! t0_kref+0x16b4:   	ldd	[%i1 + %i5], %f12
	.word	0x98e6a7e5	! t0_kref+0x16b8:   	subccc	%i2, 0x7e5, %o4
	.word	0xadb68d40	! t0_kref+0x16bc:   	fnot1	%f26, %f22
	.word	0xfb00a024	! t0_kref+0x16c0:   	ld	[%g2 + 0x24], %f29
	.word	0xa82e800a	! t0_kref+0x16c4:   	andn	%i2, %o2, %l4
	.word	0xaba018ce	! t0_kref+0x16c8:   	fdtos	%f14, %f21
	.word	0x92db4016	! t0_kref+0x16cc:   	smulcc	%o5, %l6, %o1
	.word	0x8143c000	! t0_kref+0x16d0:   	stbar
	.word	0x9db007b0	! t0_kref+0x16d4:   	fpackfix	%f16, %f14
	.word	0xeb062014	! t0_kref+0x16d8:   	ld	[%i0 + 0x14], %f21
	.word	0xf4300018	! t0_kref+0x16dc:   	sth	%i2, [%g0 + %i0]
	.word	0x81ad8a37	! t0_kref+0x16e0:   	fcmps	%fcc0, %f22, %f23
	.word	0x9bb34cbc	! t0_kref+0x16e4:   	fandnot2s	%f13, %f28, %f13
	.word	0xa642b6b5	! t0_kref+0x16e8:   	addc	%o2, -0x94b, %l3
	.word	0xb9a01a58	! t0_kref+0x16ec:   	fdtoi	%f24, %f28
	.word	0x91256798	! t0_kref+0x16f0:   	mulscc	%l5, 0x798, %o0
	.word	0xa9b3859c	! t0_kref+0x16f4:   	fcmpgt32	%f14, %f28, %l4
	.word	0x98183b7e	! t0_kref+0x16f8:   	xor	%g0, -0x482, %o4
	.word	0xd8180019	! t0_kref+0x16fc:   	ldd	[%g0 + %i1], %o4
	.word	0xbda608b0	! t0_kref+0x1700:   	fsubs	%f24, %f16, %f30
	.word	0xe41e6000	! t0_kref+0x1704:   	ldd	[%i1], %l2
	.word	0x273caf62	! t0_kref+0x1708:   	sethi	%hi(0xf2bd8800), %l3
	.word	0x99a0055e	! t0_kref+0x170c:   	fsqrtd	%f30, %f12
	.word	0xd01e3ff8	! t0_kref+0x1710:   	ldd	[%i0 - 8], %o0
	.word	0xc028a03b	! t0_kref+0x1714:   	clrb	[%g2 + 0x3b]
	call	SYM(t0_subr0)
	.word	0x81580000	! t0_kref+0x171c:   	flushw
	.word	0x81834000	! t0_kref+0x1720:   	wr	%o5, %g0, %y
	.word	0x3c480001	! t0_kref+0x1724:   	bpos,a,pt	%icc, _kref+0x1728
	.word	0xb7a00134	! t0_kref+0x1728:   	fabss	%f20, %f27
	.word	0x9ab2c009	! t0_kref+0x172c:   	orncc	%o3, %o1, %o5
	.word	0x9de3bfa0	! t0_kref+0x1730:   	save	%sp, -0x60, %sp
	.word	0xb6a63446	! t0_kref+0x1734:   	subcc	%i0, -0xbba, %i3
	.word	0xa7eec018	! t0_kref+0x1738:   	restore	%i3, %i0, %l3
	.word	0xda562008	! t0_kref+0x173c:   	ldsh	[%i0 + 8], %o5
	.word	0x9a2a0000	! t0_kref+0x1740:   	andn	%o0, %g0, %o5
	call	SYM(t0_subr2)
	.word	0xf4367ff4	! t0_kref+0x1748:   	sth	%i2, [%i1 - 0xc]
	.word	0xa7b68e3b	! t0_kref+0x174c:   	fands	%f26, %f27, %f19
	.word	0x90a2c016	! t0_kref+0x1750:   	subcc	%o3, %l6, %o0
	.word	0xdb062010	! t0_kref+0x1754:   	ld	[%i0 + 0x10], %f13
	.word	0xa7a01a58	! t0_kref+0x1758:   	fdtoi	%f24, %f19
	.word	0xae568009	! t0_kref+0x175c:   	umul	%i2, %o1, %l7
	.word	0x92aa401a	! t0_kref+0x1760:   	andncc	%o1, %i2, %o1
	.word	0x9da34938	! t0_kref+0x1764:   	fmuls	%f13, %f24, %f14
	.word	0xecbe1000	! t0_kref+0x1768:   	stda	%l6, [%i0]0x80
	.word	0x8116a521	! t0_kref+0x176c:   	taddcctv	%i2, 0x521, %g0
	.word	0x9de3bfa0	! t0_kref+0x1770:   	save	%sp, -0x60, %sp
	.word	0xb2268019	! t0_kref+0x1774:   	sub	%i2, %i1, %i1
	.word	0x91eef7d6	! t0_kref+0x1778:   	restore	%i3, -0x82a, %o0
	.word	0xc3ee1015	! t0_kref+0x177c:   	prefetcha	%i0 + %l5, 1
	.word	0x96182a45	! t0_kref+0x1780:   	xor	%g0, 0xa45, %o3
	.word	0xd036401b	! t0_kref+0x1784:   	sth	%o0, [%i1 + %i3]
	.word	0xa5a018da	! t0_kref+0x1788:   	fdtos	%f26, %f18
	.word	0xdb264000	! t0_kref+0x178c:   	st	%f13, [%i1]
	call	SYM(t0_subr0)
	.word	0xa01ab029	! t0_kref+0x1794:   	xor	%o2, -0xfd7, %l0
	.word	0xd8460000	! t0_kref+0x1798:   	ldsw	[%i0], %o4
	.word	0xee270019	! t0_kref+0x179c:   	st	%l7, [%i4 + %i1]
	.word	0xde00a004	! t0_kref+0x17a0:   	ld	[%g2 + 4], %o7
	.word	0xf11e001d	! t0_kref+0x17a4:   	ldd	[%i0 + %i5], %f24
	.word	0xd07e6014	! t0_kref+0x17a8:   	swap	[%i1 + 0x14], %o0
	.word	0xa3a00533	! t0_kref+0x17ac:   	fsqrts	%f19, %f17
	.word	0xde10a00a	! t0_kref+0x17b0:   	lduh	[%g2 + 0xa], %o7
	.word	0x9da000b0	! t0_kref+0x17b4:   	fnegs	%f16, %f14
	.word	0x9fa000b6	! t0_kref+0x17b8:   	fnegs	%f22, %f15
	.word	0xb5a388d8	! t0_kref+0x17bc:   	fsubd	%f14, %f24, %f26
	.word	0xe9180019	! t0_kref+0x17c0:   	ldd	[%g0 + %i1], %f20
	.word	0xa7a788b9	! t0_kref+0x17c4:   	fsubs	%f30, %f25, %f19
	.word	0xb5b60c8c	! t0_kref+0x17c8:   	fandnot2	%f24, %f12, %f26
	.word	0x97b20200	! t0_kref+0x17cc:   	array8	%o0, %g0, %o3
	.word	0xb9a01a56	! t0_kref+0x17d0:   	fdtoi	%f22, %f28
	.word	0xbda0055e	! t0_kref+0x17d4:   	fsqrtd	%f30, %f30
	.word	0xaa282fe2	! t0_kref+0x17d8:   	andn	%g0, 0xfe2, %l5
	.word	0xd67e6008	! t0_kref+0x17dc:   	swap	[%i1 + 8], %o3
	.word	0xae868015	! t0_kref+0x17e0:   	addcc	%i2, %l5, %l7
	.word	0xeea6501c	! t0_kref+0x17e4:   	sta	%l7, [%i1 + %i4]0x80
	.word	0x9db30d40	! t0_kref+0x17e8:   	fnot1	%f12, %f14
	.word	0x81af0a58	! t0_kref+0x17ec:   	fcmpd	%fcc0, %f28, %f24
	.word	0x97b68148	! t0_kref+0x17f0:   	edge32l	%i2, %o0, %o3
	.word	0x9276af3b	! t0_kref+0x17f4:   	udiv	%i2, 0xf3b, %o1
	.word	0xb9a00558	! t0_kref+0x17f8:   	fsqrtd	%f24, %f28
	.word	0x8143e040	! t0_kref+0x17fc:   	membar	0x40
	.word	0xa465f2af	! t0_kref+0x1800:   	subc	%l7, -0xd51, %l2
	.word	0xe920a00c	! t0_kref+0x1804:   	st	%f20, [%g2 + 0xc]
	.word	0xc36e6008	! t0_kref+0x1808:   	prefetch	%i1 + 8, 1
	call	SYM(t0_subr1)
	.word	0xe0063ff4	! t0_kref+0x1810:   	ld	[%i0 - 0xc], %l0
	.word	0x9de3bfa0	! t0_kref+0x1814:   	save	%sp, -0x60, %sp
	.word	0xabee001d	! t0_kref+0x1818:   	restore	%i0, %i5, %l5
	.word	0x9e5e8008	! t0_kref+0x181c:   	smul	%i2, %o0, %o7
	.word	0xb9b64710	! t0_kref+0x1820:   	fmuld8sux16	%f25, %f16, %f28
	.word	0xb5b58c94	! t0_kref+0x1824:   	fandnot2	%f22, %f20, %f26
	.word	0xeca01019	! t0_kref+0x1828:   	sta	%l6, [%g0 + %i1]0x80
	.word	0xff6e7ff0	! t0_kref+0x182c:   	prefetch	%i1 - 0x10, 31
	.word	0xac82c01a	! t0_kref+0x1830:   	addcc	%o3, %i2, %l6
	.word	0xde00a02c	! t0_kref+0x1834:   	ld	[%g2 + 0x2c], %o7
	.word	0x96ab401a	! t0_kref+0x1838:   	andncc	%o5, %i2, %o3
	call	SYM(t0_subr0)
	.word	0xefee101d	! t0_kref+0x1840:   	prefetcha	%i0 + %i5, 23
	.word	0x99b5c0da	! t0_kref+0x1844:   	edge16l	%l7, %i2, %o4
	.word	0xaad6b18c	! t0_kref+0x1848:   	umulcc	%i2, -0xe74, %l5
	.word	0x90254015	! t0_kref+0x184c:   	sub	%l5, %l5, %o0
	.word	0xa6f57b91	! t0_kref+0x1850:   	udivcc	%l5, -0x46f, %l3
	.word	0xd42e600f	! t0_kref+0x1854:   	stb	%o2, [%i1 + 0xf]
	.word	0x81dfc01a	! t0_kref+0x1858:   	flush	%i7 + %i2
	.word	0xa1b4467b	! t0_kref+0x185c:   	fmul8x16au	%f17, %f27, %f16
	.word	0x191a5ffd	! t0_kref+0x1860:   	sethi	%hi(0x697ff400), %o4
	.word	0x95b5432b	! t0_kref+0x1864:   	bmask	%l5, %o3, %o2
	.word	0x31800003	! t0_kref+0x1868:   	fba,a	_kref+0x1874
	.word	0x9a65400d	! t0_kref+0x186c:   	subc	%l5, %o5, %o5
	.word	0xe8ff1018	! t0_kref+0x1870:   	swapa	[%i4 + %i0]0x80, %l4
	.word	0x34480007	! t0_kref+0x1874:   	bg,a,pt	%icc, _kref+0x1890
	.word	0xac080000	! t0_kref+0x1878:   	and	%g0, %g0, %l6
	.word	0xa7a4492c	! t0_kref+0x187c:   	fmuls	%f17, %f12, %f19
	.word	0xa1b58e4c	! t0_kref+0x1880:   	fxnor	%f22, %f12, %f16
	.word	0xe11fbe08	! t0_kref+0x1884:   	ldd	[%fp - 0x1f8], %f16
	.word	0xb1a0110e	! t0_kref+0x1888:   	fxtod	%f14, %f24
	.word	0xbdb00c20	! t0_kref+0x188c:   	fzeros	%f30
	.word	0x85834008	! t0_kref+0x1890:   	wr	%o5, %o0, %ccr
	.word	0x9332a002	! t0_kref+0x1894:   	srl	%o2, 0x2, %o1
	.word	0x9bb30e79	! t0_kref+0x1898:   	fxnors	%f12, %f25, %f13
	.word	0x99b5c01a	! t0_kref+0x189c:   	edge8	%l7, %i2, %o4
	.word	0x9de3bfa0	! t0_kref+0x18a0:   	save	%sp, -0x60, %sp
	.word	0x99ee401b	! t0_kref+0x18a4:   	restore	%i1, %i3, %o4
	.word	0x9abdc008	! t0_kref+0x18a8:   	xnorcc	%l7, %o0, %o5
	.word	0x900a8016	! t0_kref+0x18ac:   	and	%o2, %l6, %o0
	.word	0xaf2a400c	! t0_kref+0x18b0:   	sll	%o1, %o4, %l7
	.word	0x962b2d36	! t0_kref+0x18b4:   	andn	%o4, 0xd36, %o3
	.word	0x2a800005	! t0_kref+0x18b8:   	bcs,a	_kref+0x18cc
	.word	0xa5b30a50	! t0_kref+0x18bc:   	fpadd32	%f12, %f16, %f18
	.word	0xf99f1a59	! t0_kref+0x18c0:   	ldda	[%i4 + %i1]0xd2, %f28
	.word	0xa1a00550	! t0_kref+0x18c4:   	fsqrtd	%f16, %f16
	.word	0xb9a709d4	! t0_kref+0x18c8:   	fdivd	%f28, %f20, %f28
	.word	0x900b0009	! t0_kref+0x18cc:   	and	%o4, %o1, %o0
	.word	0x2f800001	! t0_kref+0x18d0:   	fbu,a	_kref+0x18d4
	.word	0xa40ae97a	! t0_kref+0x18d4:   	and	%o3, 0x97a, %l2
	.word	0xec20a024	! t0_kref+0x18d8:   	st	%l6, [%g2 + 0x24]
	.word	0xb9a01938	! t0_kref+0x18dc:   	fstod	%f24, %f28
	.word	0xada000b5	! t0_kref+0x18e0:   	fnegs	%f21, %f22
	.word	0xc0f65000	! t0_kref+0x18e4:   	stxa	%g0, [%i1]0x80
	.word	0x9b33200f	! t0_kref+0x18e8:   	srl	%o4, 0xf, %o5
	.word	0x80dac01a	! t0_kref+0x18ec:   	smulcc	%o3, %i2, %g0
	.word	0x94bd6d47	! t0_kref+0x18f0:   	xnorcc	%l5, 0xd47, %o2
	.word	0xa9a409d8	! t0_kref+0x18f4:   	fdivd	%f16, %f24, %f20
	.word	0x2e800001	! t0_kref+0x18f8:   	bvs,a	_kref+0x18fc
	.word	0xe300a02c	! t0_kref+0x18fc:   	ld	[%g2 + 0x2c], %f17
	.word	0x9de3bfa0	! t0_kref+0x1900:   	save	%sp, -0x60, %sp
	.word	0xb026c019	! t0_kref+0x1904:   	sub	%i3, %i1, %i0
	.word	0x91ee4019	! t0_kref+0x1908:   	restore	%i1, %i1, %o0
	.word	0xec00a018	! t0_kref+0x190c:   	ld	[%g2 + 0x18], %l6
	.word	0xbbb00cf0	! t0_kref+0x1910:   	fnot2s	%f16, %f29
	.word	0xee0e4000	! t0_kref+0x1914:   	ldub	[%i1], %l7
	.word	0xf91e0000	! t0_kref+0x1918:   	ldd	[%i0], %f28
	.word	0xfd063fe4	! t0_kref+0x191c:   	ld	[%i0 - 0x1c], %f30
	.word	0xa7b44a6e	! t0_kref+0x1920:   	fpadd32s	%f17, %f14, %f19
	.word	0xa3a01a2f	! t0_kref+0x1924:   	fstoi	%f15, %f17
	.word	0xa482fcdf	! t0_kref+0x1928:   	addcc	%o3, -0x321, %l2
	.word	0xb1a78833	! t0_kref+0x192c:   	fadds	%f30, %f19, %f24
	.word	0x94d34016	! t0_kref+0x1930:   	umulcc	%o5, %l6, %o2
	.word	0xad400000	! t0_kref+0x1934:   	mov	%y, %l6
	.word	0x99b4c6b8	! t0_kref+0x1938:   	fmul8x16al	%f19, %f24, %f12
	.word	0xb5a000d0	! t0_kref+0x193c:   	fnegd	%f16, %f26
	.word	0x81ad8a34	! t0_kref+0x1940:   	fcmps	%fcc0, %f22, %f20
	.word	0x8143c000	! t0_kref+0x1944:   	stbar
	.word	0x9666b3f7	! t0_kref+0x1948:   	subc	%i2, -0xc09, %o3
	.word	0xc028a03a	! t0_kref+0x194c:   	clrb	[%g2 + 0x3a]
	.word	0x9fc00004	! t0_kref+0x1950:   	call	%g0 + %g4
	.word	0xbbb64ef1	! t0_kref+0x1954:   	fornot2s	%f25, %f17, %f29
	.word	0xb5a6084e	! t0_kref+0x1958:   	faddd	%f24, %f14, %f26
	.word	0x25480008	! t0_kref+0x195c:   	fblg,a,pt	%fcc0, _kref+0x197c
	.word	0xc020a014	! t0_kref+0x1960:   	clr	[%g2 + 0x14]
	.word	0x80b34015	! t0_kref+0x1964:   	orncc	%o5, %l5, %g0
	.word	0xd6567ff4	! t0_kref+0x1968:   	ldsh	[%i1 - 0xc], %o3
	.word	0xd668a031	! t0_kref+0x196c:   	ldstub	[%g2 + 0x31], %o3
	.word	0xe7270018	! t0_kref+0x1970:   	st	%f19, [%i4 + %i0]
	.word	0xe4070019	! t0_kref+0x1974:   	ld	[%i4 + %i1], %l2
	.word	0x99b30ada	! t0_kref+0x1978:   	fpsub32	%f12, %f26, %f12
	.word	0xaba018d6	! t0_kref+0x197c:   	fdtos	%f22, %f21
	.word	0xaaf24009	! t0_kref+0x1980:   	udivcc	%o1, %o1, %l5
	.word	0x3a480003	! t0_kref+0x1984:   	bcc,a,pt	%icc, _kref+0x1990
	.word	0xea28a003	! t0_kref+0x1988:   	stb	%l5, [%g2 + 3]
	.word	0xb7a3492e	! t0_kref+0x198c:   	fmuls	%f13, %f14, %f27
	.word	0xea200018	! t0_kref+0x1990:   	st	%l5, [%g0 + %i0]
	.word	0x90657990	! t0_kref+0x1994:   	subc	%l5, -0x670, %o0
	.word	0x9f414000	! t0_kref+0x1998:   	mov	%pc, %o7
	.word	0xadb6c6be	! t0_kref+0x199c:   	fmul8x16al	%f27, %f30, %f22
	.word	0xb5a01a52	! t0_kref+0x19a0:   	fdtoi	%f18, %f26
	.word	0x3f480008	! t0_kref+0x19a4:   	fbo,a,pt	%fcc0, _kref+0x19c4
	.word	0xd430a008	! t0_kref+0x19a8:   	sth	%o2, [%g2 + 8]
	.word	0x9db48916	! t0_kref+0x19ac:   	faligndata	%f18, %f22, %f14
	.word	0x81ae4a3d	! t0_kref+0x19b0:   	fcmps	%fcc0, %f25, %f29
	.word	0xed68a045	! t0_kref+0x19b4:   	prefetch	%g2 + 0x45, 22
	.word	0x9db6ccb3	! t0_kref+0x19b8:   	fandnot2s	%f27, %f19, %f14
	.word	0x9db00f1e	! t0_kref+0x19bc:   	fsrc2	%f30, %f14
	.word	0xb9b00ccc	! t0_kref+0x19c0:   	fnot2	%f12, %f28
	.word	0x901264ac	! t0_kref+0x19c4:   	or	%o1, 0x4ac, %o0
	.word	0x2e800003	! t0_kref+0x19c8:   	bvs,a	_kref+0x19d4
	.word	0x92b2801a	! t0_kref+0x19cc:   	orncc	%o2, %i2, %o1
	.word	0xea28a007	! t0_kref+0x19d0:   	stb	%l5, [%g2 + 7]
	.word	0xec30a026	! t0_kref+0x19d4:   	sth	%l6, [%g2 + 0x26]
	.word	0xee20a028	! t0_kref+0x19d8:   	st	%l7, [%g2 + 0x28]
	.word	0xee7e0000	! t0_kref+0x19dc:   	swap	[%i0], %l7
	.word	0x29800003	! t0_kref+0x19e0:   	fbl,a	_kref+0x19ec
	.word	0x9da01931	! t0_kref+0x19e4:   	fstod	%f17, %f14
	.word	0xafa01a5c	! t0_kref+0x19e8:   	fdtoi	%f28, %f23
	.word	0xc768a006	! t0_kref+0x19ec:   	prefetch	%g2 + 6, 3
	.word	0x8052400a	! t0_kref+0x19f0:   	umul	%o1, %o2, %g0
	.word	0x99b68eda	! t0_kref+0x19f4:   	fornot2	%f26, %f26, %f12
	.word	0xb1a01914	! t0_kref+0x19f8:   	fitod	%f20, %f24
	.word	0x31800006	! t0_kref+0x19fc:   	fba,a	_kref+0x1a14
	.word	0xa736800b	! t0_kref+0x1a00:   	srl	%i2, %o3, %l3
	.word	0xe4216d30	! t0_kref+0x1a04:   	st	%l2, [%g5 + 0xd30]
	.word	0xa72565bf	! t0_kref+0x1a08:   	mulscc	%l5, 0x5bf, %l3
	.word	0xa51b3286	! t0_kref+0x1a0c:   	tsubcctv	%o4, -0xd7a, %l2
	.word	0x91b300b5	! t0_kref+0x1a10:   	edge16n	%o4, %l5, %o0
	.word	0xd800a030	! t0_kref+0x1a14:   	ld	[%g2 + 0x30], %o4
	.word	0xf879401c	! t0_kref+0x1a18:   	swap	[%g5 + %i4], %i4
	.word	0xa5b60c90	! t0_kref+0x1a1c:   	fandnot2	%f24, %f16, %f18
	.word	0x9073000b	! t0_kref+0x1a20:   	udiv	%o4, %o3, %o0
	.word	0xa41dbbc0	! t0_kref+0x1a24:   	xor	%l6, -0x440, %l2
	.word	0xed1fbec0	! t0_kref+0x1a28:   	ldd	[%fp - 0x140], %f22
	.word	0xaca80016	! t0_kref+0x1a2c:   	andncc	%g0, %l6, %l6
	.word	0xe648a00a	! t0_kref+0x1a30:   	ldsb	[%g2 + 0xa], %l3
	.word	0x81ab8a58	! t0_kref+0x1a34:   	fcmpd	%fcc0, %f14, %f24
	.word	0xbda0055c	! t0_kref+0x1a38:   	fsqrtd	%f28, %f30
	.word	0x9b400000	! t0_kref+0x1a3c:   	mov	%y, %o5
	.word	0xa1b68737	! t0_kref+0x1a40:   	fmuld8ulx16	%f26, %f23, %f16
	.word	0x81acca3a	! t0_kref+0x1a44:   	fcmps	%fcc0, %f19, %f26
	.word	0xe11e7fe0	! t0_kref+0x1a48:   	ldd	[%i1 - 0x20], %f16
	.word	0x80d37337	! t0_kref+0x1a4c:   	umulcc	%o5, -0xcc9, %g0
	.word	0xb7a74836	! t0_kref+0x1a50:   	fadds	%f29, %f22, %f27
	.word	0xd84e6015	! t0_kref+0x1a54:   	ldsb	[%i1 + 0x15], %o4
	.word	0x81ad4a3e	! t0_kref+0x1a58:   	fcmps	%fcc0, %f21, %f30
	.word	0x3e480004	! t0_kref+0x1a5c:   	bvc,a,pt	%icc, _kref+0x1a6c
	.word	0xabb58175	! t0_kref+0x1a60:   	edge32ln	%l6, %l5, %l5
	.word	0xa45a4009	! t0_kref+0x1a64:   	smul	%o1, %o1, %l2
	.word	0xa4ba001a	! t0_kref+0x1a68:   	xnorcc	%o0, %i2, %l2
	.word	0xa5b00fc0	! t0_kref+0x1a6c:   	fone	%f18
	.word	0xadb506f8	! t0_kref+0x1a70:   	fmul8ulx16	%f20, %f24, %f22
	.word	0xe51e2010	! t0_kref+0x1a74:   	ldd	[%i0 + 0x10], %f18
	.word	0x9676ade7	! t0_kref+0x1a78:   	udiv	%i2, 0xde7, %o3
	.word	0xe6066008	! t0_kref+0x1a7c:   	ld	[%i1 + 8], %l3
	.word	0x99418000	! t0_kref+0x1a80:   	mov	%fprs, %o4
	.word	0x9da748bc	! t0_kref+0x1a84:   	fsubs	%f29, %f28, %f14
	.word	0xed68a084	! t0_kref+0x1a88:   	prefetch	%g2 + 0x84, 22
	.word	0x9efac017	! t0_kref+0x1a8c:   	sdivcc	%o3, %l7, %o7
	.word	0xbda01a5c	! t0_kref+0x1a90:   	fdtoi	%f28, %f30
	.word	0x2a480005	! t0_kref+0x1a94:   	bcs,a,pt	%icc, _kref+0x1aa8
	.word	0x925d400a	! t0_kref+0x1a98:   	smul	%l5, %o2, %o1
	.word	0xe1063fe8	! t0_kref+0x1a9c:   	ld	[%i0 - 0x18], %f16
	.word	0x92b32552	! t0_kref+0x1aa0:   	orncc	%o4, 0x552, %o1
	.word	0x9f320016	! t0_kref+0x1aa4:   	srl	%o0, %l6, %o7
	.word	0xde00a020	! t0_kref+0x1aa8:   	ld	[%g2 + 0x20], %o7
	.word	0x9a5b63be	! t0_kref+0x1aac:   	smul	%o5, 0x3be, %o5
	.word	0x9925c016	! t0_kref+0x1ab0:   	mulscc	%l7, %l6, %o4
	.word	0xa85a0015	! t0_kref+0x1ab4:   	smul	%o0, %l5, %l4
	.word	0x2b480007	! t0_kref+0x1ab8:   	fbug,a,pt	%fcc0, _kref+0x1ad4
	.word	0xdd1e7fe0	! t0_kref+0x1abc:   	ldd	[%i1 - 0x20], %f14
	.word	0x3c480001	! t0_kref+0x1ac0:   	bpos,a,pt	%icc, _kref+0x1ac4
	.word	0x94302eb7	! t0_kref+0x1ac4:   	orn	%g0, 0xeb7, %o2
	.word	0xebe6100a	! t0_kref+0x1ac8:   	casa	[%i0]0x80, %o2, %l5
	.word	0x940e800c	! t0_kref+0x1acc:   	and	%i2, %o4, %o2
	.word	0xea56c018	! t0_kref+0x1ad0:   	ldsh	[%i3 + %i0], %l5
	.word	0xd6480019	! t0_kref+0x1ad4:   	ldsb	[%g0 + %i1], %o3
	call	1f
	.empty
	.word	0xa5a309ce	! t0_kref+0x1adc:   	fdivd	%f12, %f14, %f18
	.word	0xb9a0111c	! t0_kref+0x1ae0:   	fxtod	%f28, %f28
	.word	0xaf2d6015	! t0_kref+0x1ae4:   	sll	%l5, 0x15, %l7
	.word	0x99b5496d	! t0_kref+0x1ae8:   	fpmerge	%f21, %f13, %f12
	.word	0x2d04ecae	! t0_kref+0x1aec:   	sethi	%hi(0x13b2b800), %l6
	.word	0xada00554	! t0_kref+0x1af0:   	fsqrtd	%f20, %f22
1:	.word	0xf100a028	! t0_kref+0x1af4:   	ld	[%g2 + 0x28], %f24
	.word	0x2f800001	! t0_kref+0x1af8:   	fbu,a	_kref+0x1afc
	.word	0xed262004	! t0_kref+0x1afc:   	st	%f22, [%i0 + 4]
	.word	0x9de3bfa0	! t0_kref+0x1b00:   	save	%sp, -0x60, %sp
	.word	0xb2c64018	! t0_kref+0x1b04:   	addccc	%i1, %i0, %i1
	.word	0xabef4019	! t0_kref+0x1b08:   	restore	%i5, %i1, %l5
	.word	0xd2060000	! t0_kref+0x1b0c:   	ld	[%i0], %o1
	.word	0xaed573cd	! t0_kref+0x1b10:   	umulcc	%l5, -0xc33, %l7
	.word	0x8143c000	! t0_kref+0x1b14:   	stbar
	.word	0xac5b0016	! t0_kref+0x1b18:   	smul	%o4, %l6, %l6
	.word	0x94f2801a	! t0_kref+0x1b1c:   	udivcc	%o2, %i2, %o2
	.word	0xb1b38ea0	! t0_kref+0x1b20:   	fsrc1s	%f14, %f24
	.word	0xd806401c	! t0_kref+0x1b24:   	ld	[%i1 + %i4], %o4
	.word	0xe300a03c	! t0_kref+0x1b28:   	ld	[%g2 + 0x3c], %f17
	.word	0x80db38b8	! t0_kref+0x1b2c:   	smulcc	%o4, -0x748, %g0
	.word	0x32480007	! t0_kref+0x1b30:   	bne,a,pt	%icc, _kref+0x1b4c
	.word	0x9bb30afc	! t0_kref+0x1b34:   	fpsub32s	%f12, %f28, %f13
	.word	0x2e800008	! t0_kref+0x1b38:   	bvs,a	_kref+0x1b58
	.word	0xb1a58d2f	! t0_kref+0x1b3c:   	fsmuld	%f22, %f15, %f24
	.word	0xd028a013	! t0_kref+0x1b40:   	stb	%o0, [%g2 + 0x13]
	.word	0x92700008	! t0_kref+0x1b44:   	udiv	%g0, %o0, %o1
	.word	0xd008a02b	! t0_kref+0x1b48:   	ldub	[%g2 + 0x2b], %o0
	.word	0x99a01896	! t0_kref+0x1b4c:   	fitos	%f22, %f12
	.word	0x90db400d	! t0_kref+0x1b50:   	smulcc	%o5, %o5, %o0
	.word	0xd47f0018	! t0_kref+0x1b54:   	swap	[%i4 + %i0], %o2
	.word	0xd44e7fe8	! t0_kref+0x1b58:   	ldsb	[%i1 - 0x18], %o2
	.word	0xa9a01a39	! t0_kref+0x1b5c:   	fstoi	%f25, %f20
	.word	0xaa32800c	! t0_kref+0x1b60:   	orn	%o2, %o4, %l5
	.word	0x985df1d3	! t0_kref+0x1b64:   	smul	%l7, -0xe2d, %o4
	.word	0xda774019	! t0_kref+0x1b68:   	stx	%o5, [%i5 + %i1]
	.word	0x9722a348	! t0_kref+0x1b6c:   	mulscc	%o2, 0x348, %o3
	.word	0x83c067a8	! t0_kref+0x1b70:   	jmpl	%g1 + 0x7a8, %g1
	.word	0xd6ee9018	! t0_kref+0x1b74:   	ldstuba	[%i2 + %i0]0x80, %o3
	.word	0xf1be5848	! t0_kref+0x1b78:   	stda	%f24, [%i1 + %o0]0xc2
	.word	0xa61d401a	! t0_kref+0x1b7c:   	xor	%l5, %i2, %l3
	.word	0x9fc00004	! t0_kref+0x1b80:   	call	%g0 + %g4
	.word	0xd8280019	! t0_kref+0x1b84:   	stb	%o4, [%g0 + %i1]
	.word	0xf91f4018	! t0_kref+0x1b88:   	ldd	[%i5 + %i0], %f28
	.word	0xdd1fbcc8	! t0_kref+0x1b8c:   	ldd	[%fp - 0x338], %f14
	.word	0xe9070018	! t0_kref+0x1b90:   	ld	[%i4 + %i0], %f20
	.word	0xd8ee9018	! t0_kref+0x1b94:   	ldstuba	[%i2 + %i0]0x80, %o4
	.word	0xd048a03c	! t0_kref+0x1b98:   	ldsb	[%g2 + 0x3c], %o0
	call	SYM(t0_subr0)
	.word	0x9da0192d	! t0_kref+0x1ba0:   	fstod	%f13, %f14
	.word	0xea5e001d	! t0_kref+0x1ba4:   	ldx	[%i0 + %i5], %l5
	.word	0xa9b48714	! t0_kref+0x1ba8:   	fmuld8sux16	%f18, %f20, %f20
	.word	0x81af4a2e	! t0_kref+0x1bac:   	fcmps	%fcc0, %f29, %f14
	.word	0x9de3bfa0	! t0_kref+0x1bb0:   	save	%sp, -0x60, %sp
	.word	0x802e2f29	! t0_kref+0x1bb4:   	andn	%i0, 0xf29, %g0
	.word	0x99ef7c13	! t0_kref+0x1bb8:   	restore	%i5, -0x3ed, %o4
	.word	0x29800002	! t0_kref+0x1bbc:   	fbl,a	_kref+0x1bc4
	.word	0x95b2c0b7	! t0_kref+0x1bc0:   	edge16n	%o3, %l7, %o2
	.word	0xee08a006	! t0_kref+0x1bc4:   	ldub	[%g2 + 6], %l7
	.word	0x9fb605d2	! t0_kref+0x1bc8:   	fcmpeq32	%f24, %f18, %o7
	.word	0x9fc10000	! t0_kref+0x1bcc:   	call	%g4
	.word	0x96bd4015	! t0_kref+0x1bd0:   	xnorcc	%l5, %l5, %o3
	.word	0x29800004	! t0_kref+0x1bd4:   	fbl,a	_kref+0x1be4
	.word	0xacbac00d	! t0_kref+0x1bd8:   	xnorcc	%o3, %o5, %l6
	.word	0xabb305d2	! t0_kref+0x1bdc:   	fcmpeq32	%f12, %f18, %l5
	.word	0xa6d2e23a	! t0_kref+0x1be0:   	umulcc	%o3, 0x23a, %l3
	.word	0xd420a030	! t0_kref+0x1be4:   	st	%o2, [%g2 + 0x30]
	.word	0xf7ee101d	! t0_kref+0x1be8:   	prefetcha	%i0 + %i5, 27
	.word	0x99a0055e	! t0_kref+0x1bec:   	fsqrtd	%f30, %f12
	.word	0xae26a63b	! t0_kref+0x1bf0:   	sub	%i2, 0x63b, %l7
	.word	0xfd00a008	! t0_kref+0x1bf4:   	ld	[%g2 + 8], %f30
	.word	0xb1a0055a	! t0_kref+0x1bf8:   	fsqrtd	%f26, %f24
	.word	0xa3a01a5e	! t0_kref+0x1bfc:   	fdtoi	%f30, %f17
	.word	0xd25e2010	! t0_kref+0x1c00:   	ldx	[%i0 + 0x10], %o1
	.word	0xdec65000	! t0_kref+0x1c04:   	ldswa	[%i1]0x80, %o7
	.word	0x3b480005	! t0_kref+0x1c08:   	fble,a,pt	%fcc0, _kref+0x1c1c
	.word	0xe1be180c	! t0_kref+0x1c0c:   	stda	%f16, [%i0 + %o4]0xc0
	.word	0xb7a00539	! t0_kref+0x1c10:   	fsqrts	%f25, %f27
	.word	0xb5b60c4e	! t0_kref+0x1c14:   	fnor	%f24, %f14, %f26
	.word	0xeb263ffc	! t0_kref+0x1c18:   	st	%f21, [%i0 - 4]
	.word	0x9830200b	! t0_kref+0x1c1c:   	orn	%g0, 0xb, %o4
	.word	0xd428a013	! t0_kref+0x1c20:   	stb	%o2, [%g2 + 0x13]
	.word	0xbdb70e80	! t0_kref+0x1c24:   	fsrc1	%f28, %f30
	.word	0xb5a00552	! t0_kref+0x1c28:   	fsqrtd	%f18, %f26
	.word	0x94223802	! t0_kref+0x1c2c:   	sub	%o0, -0x7fe, %o2
	.word	0x8143c000	! t0_kref+0x1c30:   	stbar
	.word	0x942b0016	! t0_kref+0x1c34:   	andn	%o4, %l6, %o2
	.word	0xfb063ffc	! t0_kref+0x1c38:   	ld	[%i0 - 4], %f29
	.word	0xafb00088	! t0_kref+0x1c3c:   	edge16	%g0, %o0, %l7
	.word	0xe67e3fe4	! t0_kref+0x1c40:   	swap	[%i0 - 0x1c], %l3
	.word	0x29480008	! t0_kref+0x1c44:   	fbl,a,pt	%fcc0, _kref+0x1c64
	.word	0xa5a01898	! t0_kref+0x1c48:   	fitos	%f24, %f18
	.word	0xe078a028	! t0_kref+0x1c4c:   	swap	[%g2 + 0x28], %l0
	.word	0x2f397460	! t0_kref+0x1c50:   	sethi	%hi(0xe5d18000), %l7
	.word	0xabb0077c	! t0_kref+0x1c54:   	fpack16	%f28, %f21
	.word	0xf926401c	! t0_kref+0x1c58:   	st	%f28, [%i1 + %i4]
	.word	0xb5a0191e	! t0_kref+0x1c5c:   	fitod	%f30, %f26
	.word	0x9e5b4016	! t0_kref+0x1c60:   	smul	%o5, %l6, %o7
	.word	0xea28a006	! t0_kref+0x1c64:   	stb	%l5, [%g2 + 6]
	.word	0xa5b30556	! t0_kref+0x1c68:   	fcmpeq16	%f12, %f22, %l2
	.word	0xa9b707cc	! t0_kref+0x1c6c:   	pdist	%f28, %f12, %f20
	.word	0xb1a5884c	! t0_kref+0x1c70:   	faddd	%f22, %f12, %f24
	.word	0x29480007	! t0_kref+0x1c74:   	fbl,a,pt	%fcc0, _kref+0x1c90
	.word	0xd28e1000	! t0_kref+0x1c78:   	lduba	[%i0]0x80, %o1
	.word	0xa812400d	! t0_kref+0x1c7c:   	or	%o1, %o5, %l4
	.word	0x31800002	! t0_kref+0x1c80:   	fba,a	_kref+0x1c88
	.word	0x94d02291	! t0_kref+0x1c84:   	umulcc	%g0, 0x291, %o2
	.word	0xaa5a400b	! t0_kref+0x1c88:   	smul	%o1, %o3, %l5
	.word	0x81ab4aac	! t0_kref+0x1c8c:   	fcmpes	%fcc0, %f13, %f12
	.word	0xec08a025	! t0_kref+0x1c90:   	ldub	[%g2 + 0x25], %l6
	.word	0xf91fbe70	! t0_kref+0x1c94:   	ldd	[%fp - 0x190], %f28
	.word	0x99a01a5a	! t0_kref+0x1c98:   	fdtoi	%f26, %f12
	.word	0xa9a00550	! t0_kref+0x1c9c:   	fsqrtd	%f16, %f20
	.word	0xaa436b57	! t0_kref+0x1ca0:   	addc	%o5, 0xb57, %l5
	.word	0xf420a02c	! t0_kref+0x1ca4:   	st	%i2, [%g2 + 0x2c]
	.word	0xef865000	! t0_kref+0x1ca8:   	lda	[%i1]0x80, %f23
	.word	0xbda01a50	! t0_kref+0x1cac:   	fdtoi	%f16, %f30
	.word	0x925ae700	! t0_kref+0x1cb0:   	smul	%o3, 0x700, %o1
	.word	0xadb306bd	! t0_kref+0x1cb4:   	fmul8x16al	%f12, %f29, %f22
	.word	0x92b261e8	! t0_kref+0x1cb8:   	orncc	%o1, 0x1e8, %o1
	.word	0xc768a042	! t0_kref+0x1cbc:   	prefetch	%g2 + 0x42, 3
	.word	0xc048a01f	! t0_kref+0x1cc0:   	ldsb	[%g2 + 0x1f], %g0
	.word	0x95b540eb	! t0_kref+0x1cc4:   	edge16ln	%l5, %o3, %o2
	.word	0xbbb30a70	! t0_kref+0x1cc8:   	fpadd32s	%f12, %f16, %f29
	.word	0xa5a01a50	! t0_kref+0x1ccc:   	fdtoi	%f16, %f18
	.word	0x81228016	! t0_kref+0x1cd0:   	mulscc	%o2, %l6, %g0
	.word	0x9665e627	! t0_kref+0x1cd4:   	subc	%l7, 0x627, %o3
	.word	0x98adb8f3	! t0_kref+0x1cd8:   	andncc	%l6, -0x70d, %o4
	.word	0xad033d0e	! t0_kref+0x1cdc:   	taddcc	%o4, -0x2f2, %l6
	.word	0xaadae046	! t0_kref+0x1ce0:   	smulcc	%o3, 0x46, %l5
	.word	0xa1a00554	! t0_kref+0x1ce4:   	fsqrtd	%f20, %f16
	.word	0xa1b00cd2	! t0_kref+0x1ce8:   	fnot2	%f18, %f16
	.word	0xac5da278	! t0_kref+0x1cec:   	smul	%l6, 0x278, %l6
	.word	0x99a309d8	! t0_kref+0x1cf0:   	fdivd	%f12, %f24, %f12
	.word	0xac924009	! t0_kref+0x1cf4:   	orcc	%o1, %o1, %l6
	.word	0x81d9691c	! t0_kref+0x1cf8:   	flush	%g5 + 0x91c
	.word	0x99a01911	! t0_kref+0x1cfc:   	fitod	%f17, %f12
	.word	0x22480001	! t0_kref+0x1d00:   	be,a,pt	%icc, _kref+0x1d04
	.word	0xebee101d	! t0_kref+0x1d04:   	prefetcha	%i0 + %i5, 21
	.word	0x9fa0189b	! t0_kref+0x1d08:   	fitos	%f27, %f15
	.word	0x81db2880	! t0_kref+0x1d0c:   	flush	%o4 + 0x880
	.word	0x92320017	! t0_kref+0x1d10:   	orn	%o0, %l7, %o1
	.word	0x9b400000	! t0_kref+0x1d14:   	mov	%y, %o5
	.word	0xf430a000	! t0_kref+0x1d18:   	sth	%i2, [%g2]
	.word	0x961b0015	! t0_kref+0x1d1c:   	xor	%o4, %l5, %o3
	.word	0xadb40db3	! t0_kref+0x1d20:   	fxors	%f16, %f19, %f22
	.word	0xd0264000	! t0_kref+0x1d24:   	st	%o0, [%i1]
	.word	0x9536a00e	! t0_kref+0x1d28:   	srl	%i2, 0xe, %o2
	.word	0x33800007	! t0_kref+0x1d2c:   	fbe,a	_kref+0x1d48
	.word	0xaca336e1	! t0_kref+0x1d30:   	subcc	%o4, -0x91f, %l6
	.word	0xf906401c	! t0_kref+0x1d34:   	ld	[%i1 + %i4], %f28
	.word	0x2c800002	! t0_kref+0x1d38:   	bneg,a	_kref+0x1d40
	.word	0x81858000	! t0_kref+0x1d3c:   	wr	%l6, %g0, %y
	.word	0xa8b34015	! t0_kref+0x1d40:   	orncc	%o5, %l5, %l4
	.word	0xd230a00a	! t0_kref+0x1d44:   	sth	%o1, [%g2 + 0xa]
	.word	0xe64e3fee	! t0_kref+0x1d48:   	ldsb	[%i0 - 0x12], %l3
	.word	0x9de3bfa0	! t0_kref+0x1d4c:   	save	%sp, -0x60, %sp
	.word	0xafe829f7	! t0_kref+0x1d50:   	restore	%g0, 0x9f7, %l7
	.word	0xb5a608ce	! t0_kref+0x1d54:   	fsubd	%f24, %f14, %f26
	.word	0x9fa0002f	! t0_kref+0x1d58:   	fmovs	%f15, %f15
	.word	0x9ef2801a	! t0_kref+0x1d5c:   	udivcc	%o2, %i2, %o7
	.word	0x9de3bfa0	! t0_kref+0x1d60:   	save	%sp, -0x60, %sp
	.word	0xb20eeb5f	! t0_kref+0x1d64:   	and	%i3, 0xb5f, %i1
	.word	0xafeec018	! t0_kref+0x1d68:   	restore	%i3, %i0, %l7
	.word	0xacbb000a	! t0_kref+0x1d6c:   	xnorcc	%o4, %o2, %l6
	.word	0x92d58000	! t0_kref+0x1d70:   	umulcc	%l6, %g0, %o1
	.word	0x8143c000	! t0_kref+0x1d74:   	stbar
	.word	0xa735801a	! t0_kref+0x1d78:   	srl	%l6, %i2, %l3
	.word	0xd4360000	! t0_kref+0x1d7c:   	sth	%o2, [%i0]
	.word	0x90958009	! t0_kref+0x1d80:   	orcc	%l6, %o1, %o0
	.word	0xb5b6c6b2	! t0_kref+0x1d84:   	fmul8x16al	%f27, %f18, %f26
	.word	0x81b6800b	! t0_kref+0x1d88:   	edge8	%i2, %o3, %g0
	.word	0xe6066008	! t0_kref+0x1d8c:   	ld	[%i1 + 8], %l3
	.word	0x9fa00531	! t0_kref+0x1d90:   	fsqrts	%f17, %f15
	.word	0xac5b4017	! t0_kref+0x1d94:   	smul	%o5, %l7, %l6
	.word	0xb5a0054e	! t0_kref+0x1d98:   	fsqrtd	%f14, %f26
	.word	0xaeb2c009	! t0_kref+0x1d9c:   	orncc	%o3, %o1, %l7
	.word	0xb1a0055a	! t0_kref+0x1da0:   	fsqrtd	%f26, %f24
	.word	0xd6063fec	! t0_kref+0x1da4:   	ld	[%i0 - 0x14], %o3
	.word	0x34480006	! t0_kref+0x1da8:   	bg,a,pt	%icc, _kref+0x1dc0
	.word	0x8185c000	! t0_kref+0x1dac:   	wr	%l7, %g0, %y
	.word	0xae9b4015	! t0_kref+0x1db0:   	xorcc	%o5, %l5, %l7
	.word	0xe8b81018	! t0_kref+0x1db4:   	stda	%l4, [%g0 + %i0]0x80
	.word	0x98920016	! t0_kref+0x1db8:   	orcc	%o0, %l6, %o4
	.word	0xea367ffa	! t0_kref+0x1dbc:   	sth	%l5, [%i1 - 6]
	.word	0x9fa788af	! t0_kref+0x1dc0:   	fsubs	%f30, %f15, %f15
	.word	0xaf2da01d	! t0_kref+0x1dc4:   	sll	%l6, 0x1d, %l7
	.word	0xa5b48a3b	! t0_kref+0x1dc8:   	fpadd16s	%f18, %f27, %f18
	.word	0x26800003	! t0_kref+0x1dcc:   	bl,a	_kref+0x1dd8
	.word	0xadb64df2	! t0_kref+0x1dd0:   	fnands	%f25, %f18, %f22
	.word	0x9e9a31bd	! t0_kref+0x1dd4:   	xorcc	%o0, -0xe43, %o7
	.word	0xae25400c	! t0_kref+0x1dd8:   	sub	%l5, %o4, %l7
	.word	0xb3b34c79	! t0_kref+0x1ddc:   	fnors	%f13, %f25, %f25
	.word	0xb1a588b8	! t0_kref+0x1de0:   	fsubs	%f22, %f24, %f24
	.word	0xfb26201c	! t0_kref+0x1de4:   	st	%f29, [%i0 + 0x1c]
	.word	0x99b78a77	! t0_kref+0x1de8:   	fpadd32s	%f30, %f23, %f12
	.word	0xd436401b	! t0_kref+0x1dec:   	sth	%o2, [%i1 + %i3]
	.word	0xd626001c	! t0_kref+0x1df0:   	st	%o3, [%i0 + %i4]
	.word	0x23480001	! t0_kref+0x1df4:   	fbne,a,pt	%fcc0, _kref+0x1df8
	.word	0xaa357bb9	! t0_kref+0x1df8:   	orn	%l5, -0x447, %l5
	.word	0xa1a0191e	! t0_kref+0x1dfc:   	fitod	%f30, %f16
	.word	0xa9408000	! t0_kref+0x1e00:   	mov	%ccr, %l4
	.word	0xf83f4005	! t0_kref+0x1e04:   	std	%i4, [%i5 + %g5]
	.word	0xa866b693	! t0_kref+0x1e08:   	subc	%i2, -0x96d, %l4
	.word	0xa496b79b	! t0_kref+0x1e0c:   	orcc	%i2, -0x865, %l2
	.word	0xe921401c	! t0_kref+0x1e10:   	st	%f20, [%g5 + %i4]
	.word	0xf91e401d	! t0_kref+0x1e14:   	ldd	[%i1 + %i5], %f28
	.word	0xef68a00e	! t0_kref+0x1e18:   	prefetch	%g2 + 0xe, 23
	.word	0xb1b70a12	! t0_kref+0x1e1c:   	fpadd16	%f28, %f18, %f24
	.word	0x81acca35	! t0_kref+0x1e20:   	fcmps	%fcc0, %f19, %f21
	.word	0xef68a006	! t0_kref+0x1e24:   	prefetch	%g2 + 6, 23
	.word	0x9fc10000	! t0_kref+0x1e28:   	call	%g4
	.word	0xaaba8017	! t0_kref+0x1e2c:   	xnorcc	%o2, %l7, %l5
	.word	0x171890fd	! t0_kref+0x1e30:   	sethi	%hi(0x6243f400), %o3
	.word	0xd0362004	! t0_kref+0x1e34:   	sth	%o0, [%i0 + 4]
	.word	0x001fffff	! t0_kref+0x1e38:   	illtrap	0x1fffff
	.word	0xe168a00c	! t0_kref+0x1e3c:   	prefetch	%g2 + 0xc, 16
	.word	0xc08e5000	! t0_kref+0x1e40:   	lduba	[%i1]0x80, %g0
	.word	0x9fc10000	! t0_kref+0x1e44:   	call	%g4
	.word	0xb7a4c832	! t0_kref+0x1e48:   	fadds	%f19, %f18, %f27
	.word	0xb5a50930	! t0_kref+0x1e4c:   	fmuls	%f20, %f16, %f26
	.word	0xa8f3400b	! t0_kref+0x1e50:   	udivcc	%o5, %o3, %l4
	.word	0xac1d711e	! t0_kref+0x1e54:   	xor	%l5, -0xee2, %l6
	.word	0x97b20100	! t0_kref+0x1e58:   	edge32	%o0, %g0, %o3
	.word	0xde10a024	! t0_kref+0x1e5c:   	lduh	[%g2 + 0x24], %o7
	.word	0x3b800003	! t0_kref+0x1e60:   	fble,a	_kref+0x1e6c
	.word	0xac95c000	! t0_kref+0x1e64:   	orcc	%l7, %g0, %l6
	.word	0x2f392c40	! t0_kref+0x1e68:   	sethi	%hi(0xe4b10000), %l7
	.word	0xd2080019	! t0_kref+0x1e6c:   	ldub	[%g0 + %i1], %o1
	.word	0xd2d01018	! t0_kref+0x1e70:   	ldsha	[%g0 + %i0]0x80, %o1
	.word	0xee262000	! t0_kref+0x1e74:   	st	%l7, [%i0]
	.word	0xac2e800c	! t0_kref+0x1e78:   	andn	%i2, %o4, %l6
	.word	0x36480008	! t0_kref+0x1e7c:   	bge,a,pt	%icc, _kref+0x1e9c
	.word	0xec20a00c	! t0_kref+0x1e80:   	st	%l6, [%g2 + 0xc]
	.word	0x81830000	! t0_kref+0x1e84:   	wr	%o4, %g0, %y
	.word	0xae630008	! t0_kref+0x1e88:   	subc	%o4, %o0, %l7
	.word	0x96b20015	! t0_kref+0x1e8c:   	orncc	%o0, %l5, %o3
	.word	0x99a4c833	! t0_kref+0x1e90:   	fadds	%f19, %f19, %f12
	.word	0x32800008	! t0_kref+0x1e94:   	bne,a	_kref+0x1eb4
	.word	0xfb80105c	! t0_kref+0x1e98:   	lda	[%g0 + %i4]0x82, %f29
	.word	0xa9b38cb2	! t0_kref+0x1e9c:   	fandnot2s	%f14, %f18, %f20
	.word	0xdb064000	! t0_kref+0x1ea0:   	ld	[%i1], %f13
	.word	0x3c480004	! t0_kref+0x1ea4:   	bpos,a,pt	%icc, _kref+0x1eb4
	.word	0xd67f0019	! t0_kref+0x1ea8:   	swap	[%i4 + %i1], %o3
	.word	0x80256692	! t0_kref+0x1eac:   	sub	%l5, 0x692, %g0
	.word	0x81af0a2c	! t0_kref+0x1eb0:   	fcmps	%fcc0, %f28, %f12
	.word	0xb7b0076c	! t0_kref+0x1eb4:   	fpack16	%f12, %f27
	.word	0xa1b40c8c	! t0_kref+0x1eb8:   	fandnot2	%f16, %f12, %f16
	.word	0x94624009	! t0_kref+0x1ebc:   	subc	%o1, %o1, %o2
	.word	0xecbe101d	! t0_kref+0x1ec0:   	stda	%l6, [%i0 + %i5]0x80
	.word	0xada00550	! t0_kref+0x1ec4:   	fsqrtd	%f16, %f22
	.word	0xde067ffc	! t0_kref+0x1ec8:   	ld	[%i1 - 4], %o7
	.word	0xee4e2016	! t0_kref+0x1ecc:   	ldsb	[%i0 + 0x16], %l7
	.word	0x81df8010	! t0_kref+0x1ed0:   	flush	%fp + %l0
	.word	0xa5a0193d	! t0_kref+0x1ed4:   	fstod	%f29, %f18
	.word	0xad400000	! t0_kref+0x1ed8:   	mov	%y, %l6
	call	SYM(t0_subr1)
	.word	0xe520a028	! t0_kref+0x1ee0:   	st	%f18, [%g2 + 0x28]
	.word	0x81ab8a38	! t0_kref+0x1ee4:   	fcmps	%fcc0, %f14, %f24
	.word	0x9a3ebc70	! t0_kref+0x1ee8:   	xnor	%i2, -0x390, %o5
	.word	0xa1a01035	! t0_kref+0x1eec:   	fstox	%f21, %f16
	.word	0x22480008	! t0_kref+0x1ef0:   	be,a,pt	%icc, _kref+0x1f10
	.word	0xa5a01a58	! t0_kref+0x1ef4:   	fdtoi	%f24, %f18
	.word	0xec4e3fe5	! t0_kref+0x1ef8:   	ldsb	[%i0 - 0x1b], %l6
	.word	0xc028a023	! t0_kref+0x1efc:   	clrb	[%g2 + 0x23]
	.word	0x96f2c017	! t0_kref+0x1f00:   	udivcc	%o3, %l7, %o3
	.word	0x9e226289	! t0_kref+0x1f04:   	sub	%o1, 0x289, %o7
	.word	0x99b587d8	! t0_kref+0x1f08:   	pdist	%f22, %f24, %f12
	.word	0xa9ab005a	! t0_kref+0x1f0c:   	fmovduge	%fcc0, %f26, %f20
	.word	0x81ab0ad4	! t0_kref+0x1f10:   	fcmped	%fcc0, %f12, %f20
	.word	0x9e124000	! t0_kref+0x1f14:   	or	%o1, %g0, %o7
	.word	0xada00531	! t0_kref+0x1f18:   	fsqrts	%f17, %f22
	.word	0x922aeb44	! t0_kref+0x1f1c:   	andn	%o3, 0xb44, %o1
	.word	0xee50a01e	! t0_kref+0x1f20:   	ldsh	[%g2 + 0x1e], %l7
	.word	0x911afe8b	! t0_kref+0x1f24:   	tsubcctv	%o3, -0x175, %o0
	.word	0x8d86801a	! t0_kref+0x1f28:   	wr	%i2, %i2, %fprs
	.word	0xeb68a08c	! t0_kref+0x1f2c:   	prefetch	%g2 + 0x8c, 21
	.word	0xac5b36ec	! t0_kref+0x1f30:   	smul	%o4, -0x914, %l6
	.word	0xc768a009	! t0_kref+0x1f34:   	prefetch	%g2 + 9, 3
	.word	0x37800007	! t0_kref+0x1f38:   	fbge,a	_kref+0x1f54
	.word	0xacbdab46	! t0_kref+0x1f3c:   	xnorcc	%l6, 0xb46, %l6
	.word	0xf9066004	! t0_kref+0x1f40:   	ld	[%i1 + 4], %f28
	.word	0xa5b50f5a	! t0_kref+0x1f44:   	fornot1	%f20, %f26, %f18
	.word	0xee262010	! t0_kref+0x1f48:   	st	%l7, [%i0 + 0x10]
	.word	0x9da708b0	! t0_kref+0x1f4c:   	fsubs	%f28, %f16, %f14
	.word	0xe1270019	! t0_kref+0x1f50:   	st	%f16, [%i4 + %i1]
	.word	0xa9b4ccb5	! t0_kref+0x1f54:   	fandnot2s	%f19, %f21, %f20
	.word	0x86102011	! t0_kref+0x1f58:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0x1f5c:   	subcc	%g3, 1, %g3
	.word	0x2280000f	! t0_kref+0x1f60:   	be,a	_kref+0x1f9c
	.word	0xa9a489d0	! t0_kref+0x1f64:   	fdivd	%f18, %f16, %f20
	.word	0xa52b401a	! t0_kref+0x1f68:   	sll	%o5, %i2, %l2
	.word	0xafa40835	! t0_kref+0x1f6c:   	fadds	%f16, %f21, %f23
	.word	0xd02e7fe8	! t0_kref+0x1f70:   	stb	%o0, [%i1 - 0x18]
	.word	0x9af2f6bf	! t0_kref+0x1f74:   	udivcc	%o3, -0x941, %o5
	.word	0xb5b50cb1	! t0_kref+0x1f78:   	fandnot2s	%f20, %f17, %f26
	.word	0xf1be5897	! t0_kref+0x1f7c:   	stda	%f24, [%i1 + %l7]0xc4
	.word	0xa1a3084e	! t0_kref+0x1f80:   	faddd	%f12, %f14, %f16
	.word	0xaca8001a	! t0_kref+0x1f84:   	andncc	%g0, %i2, %l6
	.word	0x9b2b001a	! t0_kref+0x1f88:   	sll	%o4, %i2, %o5
	.word	0xb7a000b7	! t0_kref+0x1f8c:   	fnegs	%f23, %f27
	.word	0x9692fecb	! t0_kref+0x1f90:   	orcc	%o3, -0x135, %o3
	.word	0x3bbffff2	! t0_kref+0x1f94:   	fble,a	_kref+0x1f5c
	.word	0x980dc00d	! t0_kref+0x1f98:   	and	%l7, %o5, %o4
	.word	0xa1b00c00	! t0_kref+0x1f9c:   	fzero	%f16
	.word	0xac26ba62	! t0_kref+0x1fa0:   	sub	%i2, -0x59e, %l6
	.word	0xa9b58d40	! t0_kref+0x1fa4:   	fnot1	%f22, %f20
	.word	0x35800002	! t0_kref+0x1fa8:   	fbue,a	_kref+0x1fb0
	.word	0xa82a8009	! t0_kref+0x1fac:   	andn	%o2, %o1, %l4
	.word	0xb1b306d2	! t0_kref+0x1fb0:   	fmul8sux16	%f12, %f18, %f24
	.word	0xaf2a4015	! t0_kref+0x1fb4:   	sll	%o1, %l5, %l7
	.word	0xa9702a02	! t0_kref+0x1fb8:   	popc	0xa02, %l4
	.word	0x9466a785	! t0_kref+0x1fbc:   	subc	%i2, 0x785, %o2
	.word	0x9462000d	! t0_kref+0x1fc0:   	subc	%o0, %o5, %o2
	.word	0xda30a01a	! t0_kref+0x1fc4:   	sth	%o5, [%g2 + 0x1a]
	.word	0x9adb6ac7	! t0_kref+0x1fc8:   	smulcc	%o5, 0xac7, %o5
	.word	0x9ba48833	! t0_kref+0x1fcc:   	fadds	%f18, %f19, %f13
	.word	0xebee101d	! t0_kref+0x1fd0:   	prefetcha	%i0 + %i5, 21
	.word	0x94258009	! t0_kref+0x1fd4:   	sub	%l6, %o1, %o2
	.word	0x94e26d8e	! t0_kref+0x1fd8:   	subccc	%o1, 0xd8e, %o2
	.word	0x80f2800b	! t0_kref+0x1fdc:   	udivcc	%o2, %o3, %g0
	.word	0x2731b5f9	! t0_kref+0x1fe0:   	sethi	%hi(0xc6d7e400), %l3
	.word	0xb3b78cac	! t0_kref+0x1fe4:   	fandnot2s	%f30, %f12, %f25
	.word	0xe11e3ff8	! t0_kref+0x1fe8:   	ldd	[%i0 - 8], %f16
	.word	0x2e480005	! t0_kref+0x1fec:   	bvs,a,pt	%icc, _kref+0x2000
	.word	0xa3a0189e	! t0_kref+0x1ff0:   	fitos	%f30, %f17
	.word	0x9a2a0000	! t0_kref+0x1ff4:   	andn	%o0, %g0, %o5
	.word	0xe7062000	! t0_kref+0x1ff8:   	ld	[%i0], %f19
	.word	0x81ad4a33	! t0_kref+0x1ffc:   	fcmps	%fcc0, %f21, %f19
	.word	0x921376f5	! t0_kref+0x2000:   	or	%o5, -0x90b, %o1
	.word	0xd87e2008	! t0_kref+0x2004:   	swap	[%i0 + 8], %o4
	.word	0x9820001a	! t0_kref+0x2008:   	neg	%i2, %o4
	.word	0xb5a01a3d	! t0_kref+0x200c:   	fstoi	%f29, %f26
	.word	0xa6f325f5	! t0_kref+0x2010:   	udivcc	%o4, 0x5f5, %l3
	.word	0xb7a01a5c	! t0_kref+0x2014:   	fdtoi	%f28, %f27
	.word	0xadb486f0	! t0_kref+0x2018:   	fmul8ulx16	%f18, %f16, %f22
	.word	0xb5b34eed	! t0_kref+0x201c:   	fornot2s	%f13, %f13, %f26
	.word	0xa1a000ae	! t0_kref+0x2020:   	fnegs	%f14, %f16
	.word	0x25800005	! t0_kref+0x2024:   	fblg,a	_kref+0x2038
	.word	0xada01913	! t0_kref+0x2028:   	fitod	%f19, %f22
	.word	0xb1a00130	! t0_kref+0x202c:   	fabss	%f16, %f24
	.word	0xacf22880	! t0_kref+0x2030:   	udivcc	%o0, 0x880, %l6
	.word	0xaa734017	! t0_kref+0x2034:   	udiv	%o5, %l7, %l5
	.word	0xb3a01894	! t0_kref+0x2038:   	fitos	%f20, %f25
	.word	0xa8330015	! t0_kref+0x203c:   	orn	%o4, %l5, %l4
	.word	0xa42ab7f8	! t0_kref+0x2040:   	andn	%o2, -0x808, %l2
	.word	0xa6fd8000	! t0_kref+0x2044:   	sdivcc	%l6, %g0, %l3
	call	SYM(t0_subr0)
	.word	0xa1a0055a	! t0_kref+0x204c:   	fsqrtd	%f26, %f16
	.word	0xa1b70d92	! t0_kref+0x2050:   	fxor	%f28, %f18, %f16
	.word	0xa9a0003c	! t0_kref+0x2054:   	fmovs	%f28, %f20
	.word	0xec366006	! t0_kref+0x2058:   	sth	%l6, [%i1 + 6]
	.word	0x31800004	! t0_kref+0x205c:   	fba,a	_kref+0x206c
	.word	0xb9a00554	! t0_kref+0x2060:   	fsqrtd	%f20, %f28
	.word	0xae1dea24	! t0_kref+0x2064:   	xor	%l7, 0xa24, %l7
	.word	0xa9b00778	! t0_kref+0x2068:   	fpack16	%f24, %f20
	.word	0xa9a01a54	! t0_kref+0x206c:   	fdtoi	%f20, %f20
	.word	0x9fc00004	! t0_kref+0x2070:   	call	%g0 + %g4
	.word	0xadb386fe	! t0_kref+0x2074:   	fmul8ulx16	%f14, %f30, %f22
	.word	0xd048a030	! t0_kref+0x2078:   	ldsb	[%g2 + 0x30], %o0
	.word	0x9a56a283	! t0_kref+0x207c:   	umul	%i2, 0x283, %o5
	.word	0xa9b68dfb	! t0_kref+0x2080:   	fnands	%f26, %f27, %f20
	.word	0xe456c019	! t0_kref+0x2084:   	ldsh	[%i3 + %i1], %l2
	.word	0xf420a008	! t0_kref+0x2088:   	st	%i2, [%g2 + 8]
	.word	0xb9a0054e	! t0_kref+0x208c:   	fsqrtd	%f14, %f28
	.word	0x81aeca3d	! t0_kref+0x2090:   	fcmps	%fcc0, %f27, %f29
	.word	0xebee101c	! t0_kref+0x2094:   	prefetcha	%i0 + %i4, 21
	.word	0xed68a046	! t0_kref+0x2098:   	prefetch	%g2 + 0x46, 22
	.word	0xa3a0053e	! t0_kref+0x209c:   	fsqrts	%f30, %f17
	.word	0x932d6003	! t0_kref+0x20a0:   	sll	%l5, 0x3, %o1
	call	SYM(t0_subr0)
	.word	0xd47e0000	! t0_kref+0x20a8:   	swap	[%i0], %o2
	.word	0xae25400d	! t0_kref+0x20ac:   	sub	%l5, %o5, %l7
	.word	0xe168a004	! t0_kref+0x20b0:   	prefetch	%g2 + 4, 16
	.word	0x9da0193d	! t0_kref+0x20b4:   	fstod	%f29, %f14
	.word	0x94130015	! t0_kref+0x20b8:   	or	%o4, %l5, %o2
	.word	0xa3a4c9ac	! t0_kref+0x20bc:   	fdivs	%f19, %f12, %f17
	.word	0xadb20136	! t0_kref+0x20c0:   	edge32n	%o0, %l6, %l6
	.word	0x9ed2697b	! t0_kref+0x20c4:   	umulcc	%o1, 0x97b, %o7
	.word	0xa9a00134	! t0_kref+0x20c8:   	fabss	%f20, %f20
	.word	0x9eb6801a	! t0_kref+0x20cc:   	orncc	%i2, %i2, %o7
	call	SYM(t0_subr3)
	.word	0x948afdf4	! t0_kref+0x20d4:   	andcc	%o3, -0x20c, %o2
	.word	0xa3b64d60	! t0_kref+0x20d8:   	fnot1s	%f25, %f17
	.word	0xec1e3ff0	! t0_kref+0x20dc:   	ldd	[%i0 - 0x10], %l6
	.word	0x9da0055c	! t0_kref+0x20e0:   	fsqrtd	%f28, %f14
	.word	0x9125c017	! t0_kref+0x20e4:   	mulscc	%l7, %l7, %o0
	.word	0x9fc00004	! t0_kref+0x20e8:   	call	%g0 + %g4
	.word	0xf720a004	! t0_kref+0x20ec:   	st	%f27, [%g2 + 4]
	.word	0xecf01019	! t0_kref+0x20f0:   	stxa	%l6, [%g0 + %i1]0x80
	.word	0x98920000	! t0_kref+0x20f4:   	orcc	%o0, %g0, %o4
	.word	0xa6b34000	! t0_kref+0x20f8:   	orncc	%o5, %g0, %l3
	.word	0xe920a030	! t0_kref+0x20fc:   	st	%f20, [%g2 + 0x30]
	.word	0x9de3bfa0	! t0_kref+0x2100:   	save	%sp, -0x60, %sp
	.word	0x93e8001c	! t0_kref+0x2104:   	restore	%g0, %i4, %o1
	.word	0x97054008	! t0_kref+0x2108:   	taddcc	%l5, %o0, %o3
	.word	0x80f2400b	! t0_kref+0x210c:   	udivcc	%o1, %o3, %g0
	.word	0x9ef58009	! t0_kref+0x2110:   	udivcc	%l6, %o1, %o7
	.word	0x111a2918	! t0_kref+0x2114:   	sethi	%hi(0x68a46000), %o0
	.word	0xa40dc00c	! t0_kref+0x2118:   	and	%l7, %o4, %l2
	.word	0x9ba0053d	! t0_kref+0x211c:   	fsqrts	%f29, %f13
	.word	0xb1a00554	! t0_kref+0x2120:   	fsqrtd	%f20, %f24
	.word	0xea062000	! t0_kref+0x2124:   	ld	[%i0], %l5
	.word	0xae830015	! t0_kref+0x2128:   	addcc	%o4, %l5, %l7
	.word	0xa926a43a	! t0_kref+0x212c:   	mulscc	%i2, 0x43a, %l4
	.word	0xea070018	! t0_kref+0x2130:   	ld	[%i4 + %i0], %l5
	.word	0xf428a022	! t0_kref+0x2134:   	stb	%i2, [%g2 + 0x22]
	.word	0xace54000	! t0_kref+0x2138:   	subccc	%l5, %g0, %l6
	.word	0x9da0110e	! t0_kref+0x213c:   	fxtod	%f14, %f14
	.word	0xada6c93d	! t0_kref+0x2140:   	fmuls	%f27, %f29, %f22
	.word	0x001fffff	! t0_kref+0x2144:   	illtrap	0x1fffff
	.word	0x99a508d0	! t0_kref+0x2148:   	fsubd	%f20, %f16, %f12
	.word	0x9bb6859a	! t0_kref+0x214c:   	fcmpgt32	%f26, %f26, %o5
	.word	0x81da0016	! t0_kref+0x2150:   	flush	%o0 + %l6
	.word	0xef00a010	! t0_kref+0x2154:   	ld	[%g2 + 0x10], %f23
	.word	0x9da01917	! t0_kref+0x2158:   	fitod	%f23, %f14
	.word	0x99a54d3d	! t0_kref+0x215c:   	fsmuld	%f21, %f29, %f12
	.word	0x99b406fa	! t0_kref+0x2160:   	fmul8ulx16	%f16, %f26, %f12
	.word	0xec30a022	! t0_kref+0x2164:   	sth	%l6, [%g2 + 0x22]
	.word	0xa8554016	! t0_kref+0x2168:   	umul	%l5, %l6, %l4
	call	SYM(t0_subr2)
	.word	0x932025da	! t0_kref+0x2170:   	mulscc	%g0, 0x5da, %o1
	.word	0xa9b406f4	! t0_kref+0x2174:   	fmul8ulx16	%f16, %f20, %f20
	.word	0xaa5b0015	! t0_kref+0x2178:   	smul	%o4, %l5, %l5
	.word	0xaee68009	! t0_kref+0x217c:   	subccc	%i2, %o1, %l7
	.word	0xfdee501d	! t0_kref+0x2180:   	prefetcha	%i1 + %i5, 30
	.word	0xe56e401d	! t0_kref+0x2184:   	prefetch	%i1 + %i5, 18
	.word	0x9de3bfa0	! t0_kref+0x2188:   	save	%sp, -0x60, %sp
	.word	0xba50001a	! t0_kref+0x218c:   	umul	%g0, %i2, %i5
	.word	0x95e8001d	! t0_kref+0x2190:   	restore	%g0, %i5, %o2
	.word	0x99b785da	! t0_kref+0x2194:   	fcmpeq32	%f30, %f26, %o4
	.word	0x81ad8a33	! t0_kref+0x2198:   	fcmps	%fcc0, %f22, %f19
	.word	0x93b58280	! t0_kref+0x219c:   	array32	%l6, %g0, %o1
	.word	0x36800001	! t0_kref+0x21a0:   	bge,a	_kref+0x21a4
	.word	0xe91e3ff8	! t0_kref+0x21a4:   	ldd	[%i0 - 8], %f20
	.word	0xd230a038	! t0_kref+0x21a8:   	sth	%o1, [%g2 + 0x38]
	.word	0x3d480004	! t0_kref+0x21ac:   	fbule,a,pt	%fcc0, _kref+0x21bc
	.word	0x9db40715	! t0_kref+0x21b0:   	fmuld8sux16	%f16, %f21, %f14
	.word	0x9b028016	! t0_kref+0x21b4:   	taddcc	%o2, %l6, %o5
	.word	0xc0280019	! t0_kref+0x21b8:   	clrb	[%g0 + %i1]
	.word	0xa9b546b5	! t0_kref+0x21bc:   	fmul8x16al	%f21, %f21, %f20
	.word	0xf11fbde8	! t0_kref+0x21c0:   	ldd	[%fp - 0x218], %f24
	.word	0xd6567ffe	! t0_kref+0x21c4:   	ldsh	[%i1 - 2], %o3
	.word	0xb5b58e54	! t0_kref+0x21c8:   	fxnor	%f22, %f20, %f26
	.word	0x81ac0a2c	! t0_kref+0x21cc:   	fcmps	%fcc0, %f16, %f12
	.word	0x99a00550	! t0_kref+0x21d0:   	fsqrtd	%f16, %f12
	.word	0xde500019	! t0_kref+0x21d4:   	ldsh	[%g0 + %i1], %o7
	.word	0x9db70e50	! t0_kref+0x21d8:   	fxnor	%f28, %f16, %f14
	.word	0x30480001	! t0_kref+0x21dc:   	ba,a,pt	%icc, _kref+0x21e0
	.word	0xa8babf85	! t0_kref+0x21e0:   	xnorcc	%o2, -0x7b, %l4
	.word	0xec3e6010	! t0_kref+0x21e4:   	std	%l6, [%i1 + 0x10]
	.word	0x941aab1c	! t0_kref+0x21e8:   	xor	%o2, 0xb1c, %o2
	.word	0xbbb54aee	! t0_kref+0x21ec:   	fpsub32s	%f21, %f14, %f29
	.word	0x81ad8a50	! t0_kref+0x21f0:   	fcmpd	%fcc0, %f22, %f16
	.word	0x92424000	! t0_kref+0x21f4:   	addc	%o1, %g0, %o1
	.word	0xc0500018	! t0_kref+0x21f8:   	ldsh	[%g0 + %i0], %g0
	.word	0xb5a01933	! t0_kref+0x21fc:   	fstod	%f19, %f26
	.word	0xe9981018	! t0_kref+0x2200:   	ldda	[%g0 + %i0]0x80, %f20
	.word	0x9e603c27	! t0_kref+0x2204:   	subc	%g0, -0x3d9, %o7
	.word	0xbda01a5c	! t0_kref+0x2208:   	fdtoi	%f28, %f30
	.word	0x93268009	! t0_kref+0x220c:   	mulscc	%i2, %o1, %o1
	.word	0x9fb00fe0	! t0_kref+0x2210:   	fones	%f15
	.word	0x96aac000	! t0_kref+0x2214:   	andncc	%o3, %g0, %o3
	.word	0x9fa5c8b9	! t0_kref+0x2218:   	fsubs	%f23, %f25, %f15
	.word	0xa7a01a3d	! t0_kref+0x221c:   	fstoi	%f29, %f19
	.word	0xa1a74d3c	! t0_kref+0x2220:   	fsmuld	%f29, %f28, %f16
	.word	0xaaaa8009	! t0_kref+0x2224:   	andncc	%o2, %o1, %l5
	.word	0xbba0013e	! t0_kref+0x2228:   	fabss	%f30, %f29
	.word	0x83414000	! t0_kref+0x222c:   	mov	%pc, %g1
	.word	0xd8ae1000	! t0_kref+0x2230:   	stba	%o4, [%i0]0x80
	.word	0x2d253852	! t0_kref+0x2234:   	sethi	%hi(0x94e14800), %l6
	.word	0x952a000d	! t0_kref+0x2238:   	sll	%o0, %o5, %o2
	.word	0x81800000	! t0_kref+0x223c:   	mov	%g0, %y
	.word	0x9a302f38	! t0_kref+0x2240:   	orn	%g0, 0xf38, %o5
	.word	0x9de3bfa0	! t0_kref+0x2244:   	save	%sp, -0x60, %sp
	.word	0x95eef2be	! t0_kref+0x2248:   	restore	%i3, -0xd42, %o2
	.word	0xbba018d0	! t0_kref+0x224c:   	fdtos	%f16, %f29
	.word	0xa7a00538	! t0_kref+0x2250:   	fsqrts	%f24, %f19
	.word	0xd4270018	! t0_kref+0x2254:   	st	%o2, [%i4 + %i0]
	.word	0x9db0076c	! t0_kref+0x2258:   	fpack16	%f12, %f14
	.word	0x9e634017	! t0_kref+0x225c:   	subc	%o5, %l7, %o7
	.word	0x3c480006	! t0_kref+0x2260:   	bpos,a,pt	%icc, _kref+0x2278
	.word	0xe07e4000	! t0_kref+0x2264:   	swap	[%i1], %l0
	.word	0xd456c019	! t0_kref+0x2268:   	ldsh	[%i3 + %i1], %o2
	.word	0x81abca34	! t0_kref+0x226c:   	fcmps	%fcc0, %f15, %f20
	.word	0x95332003	! t0_kref+0x2270:   	srl	%o4, 0x3, %o2
	.word	0xaefaf632	! t0_kref+0x2274:   	sdivcc	%o3, -0x9ce, %l7
	.word	0x3f480007	! t0_kref+0x2278:   	fbo,a,pt	%fcc0, _kref+0x2294
	.word	0xe6ee101a	! t0_kref+0x227c:   	ldstuba	[%i0 + %i2]0x80, %l3
	.word	0xac2d4015	! t0_kref+0x2280:   	andn	%l5, %l5, %l6
	.word	0xbba78835	! t0_kref+0x2284:   	fadds	%f30, %f21, %f29
	.word	0xb9a00556	! t0_kref+0x2288:   	fsqrtd	%f22, %f28
	.word	0x8185c000	! t0_kref+0x228c:   	wr	%l7, %g0, %y
	.word	0xa9a00137	! t0_kref+0x2290:   	fabss	%f23, %f20
	.word	0xada01932	! t0_kref+0x2294:   	fstod	%f18, %f22
	.word	0x81abca2d	! t0_kref+0x2298:   	fcmps	%fcc0, %f15, %f13
	.word	0x9aa24017	! t0_kref+0x229c:   	subcc	%o1, %l7, %o5
	.word	0x81df801e	! t0_kref+0x22a0:   	flush	%fp + %fp
	.word	0xee480018	! t0_kref+0x22a4:   	ldsb	[%g0 + %i0], %l7
	.word	0x81868000	! t0_kref+0x22a8:   	wr	%i2, %g0, %y
	.word	0x9ab6800a	! t0_kref+0x22ac:   	orncc	%i2, %o2, %o5
	.word	0x9ef5f5f8	! t0_kref+0x22b0:   	udivcc	%l7, -0xa08, %o7
	.word	0xb5b307cc	! t0_kref+0x22b4:   	pdist	%f12, %f12, %f26
	.word	0xaa1da80b	! t0_kref+0x22b8:   	xor	%l6, 0x80b, %l5
	.word	0xa730000d	! t0_kref+0x22bc:   	srl	%g0, %o5, %l3
	.word	0x9fc10000	! t0_kref+0x22c0:   	call	%g4
	.word	0xb1b48ed0	! t0_kref+0x22c4:   	fornot2	%f18, %f16, %f24
	.word	0xb5a38834	! t0_kref+0x22c8:   	fadds	%f14, %f20, %f26
	.word	0xa51b0008	! t0_kref+0x22cc:   	tsubcctv	%o4, %o0, %l2
	.word	0x962ac016	! t0_kref+0x22d0:   	andn	%o3, %l6, %o3
	.word	0xf91e001d	! t0_kref+0x22d4:   	ldd	[%i0 + %i5], %f28
	.word	0x91700008	! t0_kref+0x22d8:   	popc	%o0, %o0
	.word	0x81400000	! t0_kref+0x22dc:   	mov	%y, %g0
	.word	0xa7336002	! t0_kref+0x22e0:   	srl	%o5, 0x2, %l3
	.word	0x36480003	! t0_kref+0x22e4:   	bge,a,pt	%icc, _kref+0x22f0
	.word	0xa8f33430	! t0_kref+0x22e8:   	udivcc	%o4, -0xbd0, %l4
	.word	0xa1a589cc	! t0_kref+0x22ec:   	fdivd	%f22, %f12, %f16
	.word	0x151f3ee2	! t0_kref+0x22f0:   	sethi	%hi(0x7cfb8800), %o2
	.word	0x9e0a401a	! t0_kref+0x22f4:   	and	%o1, %i2, %o7
	.word	0xb3a0003d	! t0_kref+0x22f8:   	fmovs	%f29, %f25
	.word	0xd4e81018	! t0_kref+0x22fc:   	ldstuba	[%g0 + %i0]0x80, %o2
	.word	0xb1b78739	! t0_kref+0x2300:   	fmuld8ulx16	%f30, %f25, %f24
	.word	0xd88e9019	! t0_kref+0x2304:   	lduba	[%i2 + %i1]0x80, %o4
	.word	0x8d80001a	! t0_kref+0x2308:   	mov	%i2, %fprs
	.word	0xf007bfe0	! t0_kref+0x230c:   	ld	[%fp - 0x20], %i0
	.word	0x900b7fc8	! t0_kref+0x2310:   	and	%o5, -0x38, %o0
	.word	0x92258009	! t0_kref+0x2314:   	sub	%l6, %o1, %o1
	.word	0xf1ee101d	! t0_kref+0x2318:   	prefetcha	%i0 + %i5, 24
	.word	0x99a44835	! t0_kref+0x231c:   	fadds	%f17, %f21, %f12
	.word	0x9495bd2a	! t0_kref+0x2320:   	orcc	%l6, -0x2d6, %o2
	.word	0xa1b58673	! t0_kref+0x2324:   	fmul8x16au	%f22, %f19, %f16
	call	SYM(t0_subr1)
	.word	0xa9a5483e	! t0_kref+0x232c:   	fadds	%f21, %f30, %f20
	.word	0x99a0193a	! t0_kref+0x2330:   	fstod	%f26, %f12
	.word	0x8143e040	! t0_kref+0x2334:   	membar	0x40
	.word	0x99b300a8	! t0_kref+0x2338:   	edge16n	%o4, %o0, %o4
	.word	0xec00a03c	! t0_kref+0x233c:   	ld	[%g2 + 0x3c], %l6
	.word	0x93b20200	! t0_kref+0x2340:   	array8	%o0, %g0, %o1
	.word	0x21480007	! t0_kref+0x2344:   	fbn,a,pt	%fcc0, _kref+0x2360
	.word	0x9db3c978	! t0_kref+0x2348:   	fpmerge	%f15, %f24, %f14
	.word	0xa5b50c90	! t0_kref+0x234c:   	fandnot2	%f20, %f16, %f18
	.word	0x81580000	! t0_kref+0x2350:   	flushw
	.word	0xa85df5a1	! t0_kref+0x2354:   	smul	%l7, -0xa5f, %l4
	.word	0xac723af1	! t0_kref+0x2358:   	udiv	%o0, -0x50f, %l6
	.word	0x9485c00c	! t0_kref+0x235c:   	addcc	%l7, %o4, %o2
	.word	0x2f2ab2a0	! t0_kref+0x2360:   	sethi	%hi(0xaaca8000), %l7
	.word	0xecbe101d	! t0_kref+0x2364:   	stda	%l6, [%i0 + %i5]0x80
	call	SYM(t0_subr3)
	.word	0xe8ee101a	! t0_kref+0x236c:   	ldstuba	[%i0 + %i2]0x80, %l4
	.word	0xa933000b	! t0_kref+0x2370:   	srl	%o4, %o3, %l4
	.word	0xaba018ce	! t0_kref+0x2374:   	fdtos	%f14, %f21
	.word	0x91358017	! t0_kref+0x2378:   	srl	%l6, %l7, %o0
	.word	0xbda0053a	! t0_kref+0x237c:   	fsqrts	%f26, %f30
	.word	0xa544c000	! t0_kref+0x2380:   	mov	%gsr, %l2
	.word	0x878020d2	! t0_kref+0x2384:   	mov	0xd2, %asi
	.word	0xe11e7ff8	! t0_kref+0x2388:   	ldd	[%i1 - 8], %f16
	.word	0x9bb24100	! t0_kref+0x238c:   	edge32	%o1, %g0, %o5
	.word	0x9e35b41f	! t0_kref+0x2390:   	orn	%l6, -0xbe1, %o7
	.word	0xaee03725	! t0_kref+0x2394:   	subccc	%g0, -0x8db, %l7
	.word	0xa42ac00b	! t0_kref+0x2398:   	andn	%o3, %o3, %l2
	.word	0x32800006	! t0_kref+0x239c:   	bne,a	_kref+0x23b4
	.word	0xa5a688d6	! t0_kref+0x23a0:   	fsubd	%f26, %f22, %f18
	.word	0x961dafc6	! t0_kref+0x23a4:   	xor	%l6, 0xfc6, %o3
	.word	0x93230015	! t0_kref+0x23a8:   	mulscc	%o4, %l5, %o1
	.word	0x26800002	! t0_kref+0x23ac:   	bl,a	_kref+0x23b4
	.word	0xa5a00530	! t0_kref+0x23b0:   	fsqrts	%f16, %f18
	.word	0x981ac017	! t0_kref+0x23b4:   	xor	%o3, %l7, %o4
	.word	0xb1a01a54	! t0_kref+0x23b8:   	fdtoi	%f20, %f24
	.word	0x9ab24000	! t0_kref+0x23bc:   	orncc	%o1, %g0, %o5
	call	SYM(t0_subr1)
	.word	0xb9a018cc	! t0_kref+0x23c4:   	fdtos	%f12, %f28
	.word	0xa4e6ab11	! t0_kref+0x23c8:   	subccc	%i2, 0xb11, %l2
	.word	0xec3e6018	! t0_kref+0x23cc:   	std	%l6, [%i1 + 0x18]
	.word	0xadb38e52	! t0_kref+0x23d0:   	fxnor	%f14, %f18, %f22
	.word	0x9ab5800c	! t0_kref+0x23d4:   	orncc	%l6, %o4, %o5
	.word	0x94e3400d	! t0_kref+0x23d8:   	subccc	%o5, %o5, %o2
	.word	0xfd1e3fe8	! t0_kref+0x23dc:   	ldd	[%i0 - 0x18], %f30
	.word	0x9712c00a	! t0_kref+0x23e0:   	taddcctv	%o3, %o2, %o3
	.word	0xd4580019	! t0_kref+0x23e4:   	ldx	[%g0 + %i1], %o2
	.word	0xd4f75019	! t0_kref+0x23e8:   	stxa	%o2, [%i5 + %i1]0x80
	.word	0xacf8000b	! t0_kref+0x23ec:   	sdivcc	%g0, %o3, %l6
	.word	0xeb00a03c	! t0_kref+0x23f0:   	ld	[%g2 + 0x3c], %f21
	.word	0xc0d6501b	! t0_kref+0x23f4:   	ldsha	[%i1 + %i3]0x80, %g0
	.word	0xa5a018da	! t0_kref+0x23f8:   	fdtos	%f26, %f18
	.word	0x8143c000	! t0_kref+0x23fc:   	stbar
	.word	0x96debbda	! t0_kref+0x2400:   	smulcc	%i2, -0x426, %o3
	.word	0xc5ee100b	! t0_kref+0x2404:   	prefetcha	%i0 + %o3, 2
	.word	0xa9a00539	! t0_kref+0x2408:   	fsqrts	%f25, %f20
	.word	0xba103fe8	! t0_kref+0x240c:   	mov	0xffffffe8, %i5
	.word	0x920aac48	! t0_kref+0x2410:   	and	%o2, 0xc48, %o1
	.word	0x2c800002	! t0_kref+0x2414:   	bneg,a	_kref+0x241c
	.word	0xf207bfe0	! t0_kref+0x2418:   	ld	[%fp - 0x20], %i1
	.word	0xa6dd8017	! t0_kref+0x241c:   	smulcc	%l6, %l7, %l3
	.word	0xbda000ac	! t0_kref+0x2420:   	fnegs	%f12, %f30
	.word	0xd01e7fe0	! t0_kref+0x2424:   	ldd	[%i1 - 0x20], %o0
	.word	0xa8956d88	! t0_kref+0x2428:   	orcc	%l5, 0xd88, %l4
	.word	0xaba01a32	! t0_kref+0x242c:   	fstoi	%f18, %f21
	.word	0x9bb0000a	! t0_kref+0x2430:   	edge8	%g0, %o2, %o5
	.word	0xf51e6008	! t0_kref+0x2434:   	ldd	[%i1 + 8], %f26
	.word	0xd62e601a	! t0_kref+0x2438:   	stb	%o3, [%i1 + 0x1a]
	.word	0x90e2f927	! t0_kref+0x243c:   	subccc	%o3, -0x6d9, %o0
	.word	0xec263fe8	! t0_kref+0x2440:   	st	%l6, [%i0 - 0x18]
	.word	0xd62e4000	! t0_kref+0x2444:   	stb	%o3, [%i1]
	.word	0x28800002	! t0_kref+0x2448:   	bleu,a	_kref+0x2450
	.word	0xe8e81018	! t0_kref+0x244c:   	ldstuba	[%g0 + %i0]0x80, %l4
	.word	0x9ad0000b	! t0_kref+0x2450:   	umulcc	%g0, %o3, %o5
	.word	0xac920009	! t0_kref+0x2454:   	orcc	%o0, %o1, %l6
	.word	0xdd26401c	! t0_kref+0x2458:   	st	%f14, [%i1 + %i4]
	.word	0xec4e3fe0	! t0_kref+0x245c:   	ldsb	[%i0 - 0x20], %l6
	.word	0x2c480001	! t0_kref+0x2460:   	bneg,a,pt	%icc, _kref+0x2464
	.word	0xd2280018	! t0_kref+0x2464:   	stb	%o1, [%g0 + %i0]
	.word	0xa3a018cc	! t0_kref+0x2468:   	fdtos	%f12, %f17
	.word	0xeb20a004	! t0_kref+0x246c:   	st	%f21, [%g2 + 4]
	.word	0xa7b3caf4	! t0_kref+0x2470:   	fpsub32s	%f15, %f20, %f19
	.word	0x9da00538	! t0_kref+0x2474:   	fsqrts	%f24, %f14
	.word	0xe9063fe8	! t0_kref+0x2478:   	ld	[%i0 - 0x18], %f20
	.word	0xe64e001a	! t0_kref+0x247c:   	ldsb	[%i0 + %i2], %l3
	.word	0x99b48dcc	! t0_kref+0x2480:   	fnand	%f18, %f12, %f12
	.word	0xdf064000	! t0_kref+0x2484:   	ld	[%i1], %f15
	.word	0x9db50f50	! t0_kref+0x2488:   	fornot1	%f20, %f16, %f14
	.word	0x9db00fe0	! t0_kref+0x248c:   	fones	%f14
	.word	0xda463ff8	! t0_kref+0x2490:   	ldsw	[%i0 - 8], %o5
	.word	0xd408a033	! t0_kref+0x2494:   	ldub	[%g2 + 0x33], %o2
	.word	0xd606001c	! t0_kref+0x2498:   	ld	[%i0 + %i4], %o3
	.word	0x9ba0052f	! t0_kref+0x249c:   	fsqrts	%f15, %f13
	.word	0x9da0015e	! t0_kref+0x24a0:   	fabsd	%f30, %f14
	.word	0xe64e7ffd	! t0_kref+0x24a4:   	ldsb	[%i1 - 3], %l3
	.word	0xab2a400b	! t0_kref+0x24a8:   	sll	%o1, %o3, %l5
	.word	0xbda0054e	! t0_kref+0x24ac:   	fsqrtd	%f14, %f30
	.word	0x99b34320	! t0_kref+0x24b0:   	bmask	%o5, %g0, %o4
	.word	0xf428a03a	! t0_kref+0x24b4:   	stb	%i2, [%g2 + 0x3a]
	.word	0xae2a800b	! t0_kref+0x24b8:   	andn	%o2, %o3, %l7
	.word	0xeb00a018	! t0_kref+0x24bc:   	ld	[%g2 + 0x18], %f21
	.word	0xb1b00f18	! t0_kref+0x24c0:   	fsrc2	%f24, %f24
	.word	0xa1a00132	! t0_kref+0x24c4:   	fabss	%f18, %f16
	.word	0xb1a3c82d	! t0_kref+0x24c8:   	fadds	%f15, %f13, %f24
	.word	0xaa954008	! t0_kref+0x24cc:   	orcc	%l5, %o0, %l5
	call	SYM(t0_subr1)
	.word	0xb9a0191a	! t0_kref+0x24d4:   	fitod	%f26, %f28
	.word	0xd220a024	! t0_kref+0x24d8:   	st	%o1, [%g2 + 0x24]
	.word	0xda000018	! t0_kref+0x24dc:   	ld	[%g0 + %i0], %o5
	.word	0xb5a0191c	! t0_kref+0x24e0:   	fitod	%f28, %f26
	.word	0x96e57d2b	! t0_kref+0x24e4:   	subccc	%l5, -0x2d5, %o3
	.word	0xe9263ff8	! t0_kref+0x24e8:   	st	%f20, [%i0 - 8]
	.word	0xbdb7066e	! t0_kref+0x24ec:   	fmul8x16au	%f28, %f14, %f30
	.word	0xf700a014	! t0_kref+0x24f0:   	ld	[%g2 + 0x14], %f27
	.word	0xa615b3fa	! t0_kref+0x24f4:   	or	%l6, -0xc06, %l3
	.word	0x81adca33	! t0_kref+0x24f8:   	fcmps	%fcc0, %f23, %f19
	.word	0xa5a34839	! t0_kref+0x24fc:   	fadds	%f13, %f25, %f18
	.word	0x96768016	! t0_kref+0x2500:   	udiv	%i2, %l6, %o3
	.word	0x34480001	! t0_kref+0x2504:   	bg,a,pt	%icc, _kref+0x2508
	.word	0xddbf5018	! t0_kref+0x2508:   	stda	%f14, [%i5 + %i0]0x80
	.word	0xea28a035	! t0_kref+0x250c:   	stb	%l5, [%g2 + 0x35]
	.word	0x9da00554	! t0_kref+0x2510:   	fsqrtd	%f20, %f14
	.word	0xd2ee101a	! t0_kref+0x2514:   	ldstuba	[%i0 + %i2]0x80, %o1
	.word	0x90227b20	! t0_kref+0x2518:   	sub	%o1, -0x4e0, %o0
	.word	0xb1a00536	! t0_kref+0x251c:   	fsqrts	%f22, %f24
	.word	0xb9a01a56	! t0_kref+0x2520:   	fdtoi	%f22, %f28
	.word	0x941a7ca0	! t0_kref+0x2524:   	xor	%o1, -0x360, %o2
	.word	0x965d4016	! t0_kref+0x2528:   	smul	%l5, %l6, %o3
	.word	0x93b2017a	! t0_kref+0x252c:   	edge32ln	%o0, %i2, %o1
	.word	0xe720a020	! t0_kref+0x2530:   	st	%f19, [%g2 + 0x20]
	.word	0xa882c01a	! t0_kref+0x2534:   	addcc	%o3, %i2, %l4
	.word	0xe1ee501b	! t0_kref+0x2538:   	prefetcha	%i1 + %i3, 16
	.word	0x920b3788	! t0_kref+0x253c:   	and	%o4, -0x878, %o1
	.word	0xd028a01d	! t0_kref+0x2540:   	stb	%o0, [%g2 + 0x1d]
	.word	0x9fc00004	! t0_kref+0x2544:   	call	%g0 + %g4
	.word	0x952d6009	! t0_kref+0x2548:   	sll	%l5, 0x9, %o2
	.word	0xbda0190d	! t0_kref+0x254c:   	fitod	%f13, %f30
	.word	0x81dec019	! t0_kref+0x2550:   	flush	%i3 + %i1
	.word	0xa92d4008	! t0_kref+0x2554:   	sll	%l5, %o0, %l4
	.word	0x81dee65c	! t0_kref+0x2558:   	flush	%i3 + 0x65c
	.word	0xa9400000	! t0_kref+0x255c:   	mov	%y, %l4
	.word	0xb9a00532	! t0_kref+0x2560:   	fsqrts	%f18, %f28
	.word	0x9a422f5d	! t0_kref+0x2564:   	addc	%o0, 0xf5d, %o5
	.word	0xb9a01098	! t0_kref+0x2568:   	fxtos	%f24, %f28
	call	SYM(t0_subr0)
	.word	0x93230009	! t0_kref+0x2570:   	mulscc	%o4, %o1, %o1
	.word	0xb5a00556	! t0_kref+0x2574:   	fsqrtd	%f22, %f26
	.word	0xec3f4018	! t0_kref+0x2578:   	std	%l6, [%i5 + %i0]
	.word	0x93b38594	! t0_kref+0x257c:   	fcmpgt32	%f14, %f20, %o1
	.word	0x942b6a49	! t0_kref+0x2580:   	andn	%o5, 0xa49, %o2
	.word	0x9fb68280	! t0_kref+0x2584:   	array32	%i2, %g0, %o7
	.word	0x90a2b075	! t0_kref+0x2588:   	subcc	%o2, -0xf8b, %o0
	.word	0xc086101c	! t0_kref+0x258c:   	lda	[%i0 + %i4]0x80, %g0
	.word	0xede6100a	! t0_kref+0x2590:   	casa	[%i0]0x80, %o2, %l6
	.word	0x9a3025c5	! t0_kref+0x2594:   	orn	%g0, 0x5c5, %o5
	.word	0x26480008	! t0_kref+0x2598:   	bl,a,pt	%icc, _kref+0x25b8
	.word	0xacf5ac62	! t0_kref+0x259c:   	udivcc	%l6, 0xc62, %l6
	.word	0xda280019	! t0_kref+0x25a0:   	stb	%o5, [%g0 + %i1]
	.word	0xabb00fe0	! t0_kref+0x25a4:   	fones	%f21
	.word	0x9b336003	! t0_kref+0x25a8:   	srl	%o5, 0x3, %o5
	.word	0xb1a000af	! t0_kref+0x25ac:   	fnegs	%f15, %f24
	.word	0x93b340e8	! t0_kref+0x25b0:   	edge16ln	%o5, %o0, %o1
	.word	0x9da3482f	! t0_kref+0x25b4:   	fadds	%f13, %f15, %f14
	.word	0xf7ee501d	! t0_kref+0x25b8:   	prefetcha	%i1 + %i5, 27
	.word	0xaa36b9c5	! t0_kref+0x25bc:   	orn	%i2, -0x63b, %l5
	.word	0x24800003	! t0_kref+0x25c0:   	ble,a	_kref+0x25cc
	.word	0x992a201b	! t0_kref+0x25c4:   	sll	%o0, 0x1b, %o4
	.word	0xd22e6008	! t0_kref+0x25c8:   	stb	%o1, [%i1 + 8]
	.word	0xaab2b3cb	! t0_kref+0x25cc:   	orncc	%o2, -0xc35, %l5
	.word	0xae70000a	! t0_kref+0x25d0:   	udiv	%g0, %o2, %l7
	.word	0x9fc00004	! t0_kref+0x25d4:   	call	%g0 + %g4
	.word	0x91302018	! t0_kref+0x25d8:   	srl	%g0, 0x18, %o0
	.word	0xf91e7ff8	! t0_kref+0x25dc:   	ldd	[%i1 - 8], %f28
	.word	0xa5b00cda	! t0_kref+0x25e0:   	fnot2	%f26, %f18
	.word	0x99b009bc	! t0_kref+0x25e4:   	fexpand	%f28, %f12
	.word	0x26480002	! t0_kref+0x25e8:   	bl,a,pt	%icc, _kref+0x25f0
	.word	0x99a408d6	! t0_kref+0x25ec:   	fsubd	%f16, %f22, %f12
	.word	0xefee501d	! t0_kref+0x25f0:   	prefetcha	%i1 + %i5, 23
	.word	0xb9a01932	! t0_kref+0x25f4:   	fstod	%f18, %f28
	.word	0xd030a008	! t0_kref+0x25f8:   	sth	%o0, [%g2 + 8]
	.word	0xaba01a58	! t0_kref+0x25fc:   	fdtoi	%f24, %f21
	.word	0xb7b4cdfe	! t0_kref+0x2600:   	fnands	%f19, %f30, %f27
	.word	0xd868a001	! t0_kref+0x2604:   	ldstub	[%g2 + 1], %o4
	.word	0x9a75400a	! t0_kref+0x2608:   	udiv	%l5, %o2, %o5
	.word	0x81af0a33	! t0_kref+0x260c:   	fcmps	%fcc0, %f28, %f19
	.word	0x9da30833	! t0_kref+0x2610:   	fadds	%f12, %f19, %f14
	.word	0xa5a00533	! t0_kref+0x2614:   	fsqrts	%f19, %f18
	.word	0x8185c000	! t0_kref+0x2618:   	wr	%l7, %g0, %y
	.word	0xd8567fe0	! t0_kref+0x261c:   	ldsh	[%i1 - 0x20], %o4
	.word	0xa8e28017	! t0_kref+0x2620:   	subccc	%o2, %l7, %l4
	.word	0xe4180019	! t0_kref+0x2624:   	ldd	[%g0 + %i1], %l2
	.word	0xbdb00c00	! t0_kref+0x2628:   	fzero	%f30
	.word	0xc028a017	! t0_kref+0x262c:   	clrb	[%g2 + 0x17]
	.word	0xa9a01a33	! t0_kref+0x2630:   	fstoi	%f19, %f20
	.word	0xa1b48670	! t0_kref+0x2634:   	fmul8x16au	%f18, %f16, %f16
	.word	0xd6f61000	! t0_kref+0x2638:   	stxa	%o3, [%i0]0x80
	.word	0xa1b58e56	! t0_kref+0x263c:   	fxnor	%f22, %f22, %f16
	.word	0x9853000b	! t0_kref+0x2640:   	umul	%o4, %o3, %o4
	.word	0x9af28016	! t0_kref+0x2644:   	udivcc	%o2, %l6, %o5
	.word	0x81858000	! t0_kref+0x2648:   	wr	%l6, %g0, %y
	.word	0x90257786	! t0_kref+0x264c:   	sub	%l5, -0x87a, %o0
	.word	0x9518000c	! t0_kref+0x2650:   	tsubcctv	%g0, %o4, %o2
	.word	0x81ae8a33	! t0_kref+0x2654:   	fcmps	%fcc0, %f26, %f19
	.word	0xa5a01a2f	! t0_kref+0x2658:   	fstoi	%f15, %f18
	.word	0x81800000	! t0_kref+0x265c:   	mov	%g0, %y
	.word	0x94deaefa	! t0_kref+0x2660:   	smulcc	%i2, 0xefa, %o2
	.word	0x90b5687a	! t0_kref+0x2664:   	orncc	%l5, 0x87a, %o0
	.word	0xe8563ff6	! t0_kref+0x2668:   	ldsh	[%i0 - 0xa], %l4
	.word	0xbbb40ea0	! t0_kref+0x266c:   	fsrc1s	%f16, %f29
	.word	0x26800008	! t0_kref+0x2670:   	bl,a	_kref+0x2690
	.word	0xdf270019	! t0_kref+0x2674:   	st	%f15, [%i4 + %i1]
	.word	0xee6e8019	! t0_kref+0x2678:   	ldstub	[%i2 + %i1], %l7
	call	SYM(t0_subr2)
	.word	0xabb3855a	! t0_kref+0x2680:   	fcmpeq16	%f14, %f26, %l5
	.word	0x92f3234f	! t0_kref+0x2684:   	udivcc	%o4, 0x34f, %o1
	.word	0xacb27cb9	! t0_kref+0x2688:   	orncc	%o1, -0x347, %l6
	.word	0xb3a01a4c	! t0_kref+0x268c:   	fdtoi	%f12, %f25
	.word	0xe456201e	! t0_kref+0x2690:   	ldsh	[%i0 + 0x1e], %l2
	.word	0x38800002	! t0_kref+0x2694:   	bgu,a	_kref+0x269c
	.word	0xd5f6100c	! t0_kref+0x2698:   	casxa	[%i0]0x80, %o4, %o2
	.word	0x26480006	! t0_kref+0x269c:   	bl,a,pt	%icc, _kref+0x26b4
	.word	0xd428a03f	! t0_kref+0x26a0:   	stb	%o2, [%g2 + 0x3f]
	call	SYM(t0_subr0)
	.word	0xb9b34df2	! t0_kref+0x26a8:   	fnands	%f13, %f18, %f28
	.word	0x21480004	! t0_kref+0x26ac:   	fbn,a,pt	%fcc0, _kref+0x26bc
	.word	0xabb2c280	! t0_kref+0x26b0:   	array32	%o3, %g0, %l5
	.word	0xa9b2411a	! t0_kref+0x26b4:   	edge32	%o1, %i2, %l4
	.word	0xafa0013c	! t0_kref+0x26b8:   	fabss	%f28, %f23
	.word	0x99a01918	! t0_kref+0x26bc:   	fitod	%f24, %f12
	.word	0x9db58d40	! t0_kref+0x26c0:   	fnot1	%f22, %f14
	.word	0xb1a01a34	! t0_kref+0x26c4:   	fstoi	%f20, %f24
	.word	0xaa9ea9a7	! t0_kref+0x26c8:   	xorcc	%i2, 0x9a7, %l5
	.word	0x900b4009	! t0_kref+0x26cc:   	and	%o5, %o1, %o0
	.word	0x8143c000	! t0_kref+0x26d0:   	stbar
	.word	0x96282dee	! t0_kref+0x26d4:   	andn	%g0, 0xdee, %o3
	.word	0xb9b30712	! t0_kref+0x26d8:   	fmuld8sux16	%f12, %f18, %f28
	.word	0x949024ff	! t0_kref+0x26dc:   	orcc	%g0, 0x4ff, %o2
	.word	0xa6b0000c	! t0_kref+0x26e0:   	orncc	%g0, %o4, %l3
	.word	0xaa65ff7a	! t0_kref+0x26e4:   	subc	%l7, -0x86, %l5
	.word	0xa9a0053c	! t0_kref+0x26e8:   	fsqrts	%f28, %f20
	.word	0xe1060000	! t0_kref+0x26ec:   	ld	[%i0], %f16
	.word	0x9a82a514	! t0_kref+0x26f0:   	addcc	%o2, 0x514, %o5
	.word	0xc1ee5000	! t0_kref+0x26f4:   	prefetcha	%i1, 0
	.word	0xaab6a533	! t0_kref+0x26f8:   	orncc	%i2, 0x533, %l5
	.word	0xe8c71018	! t0_kref+0x26fc:   	ldswa	[%i4 + %i0]0x80, %l4
	.word	0xd036c018	! t0_kref+0x2700:   	sth	%o0, [%i3 + %i0]
	.word	0xa4e2e859	! t0_kref+0x2704:   	subccc	%o3, 0x859, %l2
	.word	0x9072ec64	! t0_kref+0x2708:   	udiv	%o3, 0xc64, %o0
	.word	0x3d800008	! t0_kref+0x270c:   	fbule,a	_kref+0x272c
	.word	0x9e500016	! t0_kref+0x2710:   	umul	%g0, %l6, %o7
	.word	0xc0d6d019	! t0_kref+0x2714:   	ldsha	[%i3 + %i1]0x80, %g0
	.word	0xa1a01a4c	! t0_kref+0x2718:   	fdtoi	%f12, %f16
	.word	0xd47e0000	! t0_kref+0x271c:   	swap	[%i0], %o2
	.word	0xa422800c	! t0_kref+0x2720:   	sub	%o2, %o4, %l2
	.word	0xed1fbf90	! t0_kref+0x2724:   	ldd	[%fp - 0x70], %f22
	.word	0x99a0103a	! t0_kref+0x2728:   	fstox	%f26, %f12
	.word	0x81ac8a54	! t0_kref+0x272c:   	fcmpd	%fcc0, %f18, %f20
	.word	0x81400000	! t0_kref+0x2730:   	mov	%y, %g0
	.word	0xa8136426	! t0_kref+0x2734:   	or	%o5, 0x426, %l4
	.word	0x96a2ae38	! t0_kref+0x2738:   	subcc	%o2, 0xe38, %o3
	.word	0x93400000	! t0_kref+0x273c:   	mov	%y, %o1
	.word	0xc5ee1015	! t0_kref+0x2740:   	prefetcha	%i0 + %l5, 2
	.word	0x949aa3e4	! t0_kref+0x2744:   	xorcc	%o2, 0x3e4, %o2
	.word	0x90532fe2	! t0_kref+0x2748:   	umul	%o4, 0xfe2, %o0
	.word	0xd91fbce0	! t0_kref+0x274c:   	ldd	[%fp - 0x320], %f12
	.word	0x39800006	! t0_kref+0x2750:   	fbuge,a	_kref+0x2768
	.word	0xc0c6101c	! t0_kref+0x2754:   	ldswa	[%i0 + %i4]0x80, %g0
	.word	0x99b2c017	! t0_kref+0x2758:   	edge8	%o3, %l7, %o4
	.word	0x98e031a4	! t0_kref+0x275c:   	subccc	%g0, -0xe5c, %o4
	.word	0x81af8a31	! t0_kref+0x2760:   	fcmps	%fcc0, %f30, %f17
	.word	0x9eda7dae	! t0_kref+0x2764:   	smulcc	%o1, -0x252, %o7
	.word	0xad2a8017	! t0_kref+0x2768:   	sll	%o2, %l7, %l6
	.word	0xa7158000	! t0_kref+0x276c:   	taddcctv	%l6, %g0, %l3
	.word	0x9202f875	! t0_kref+0x2770:   	add	%o3, -0x78b, %o1
	.word	0x93b68200	! t0_kref+0x2774:   	array8	%i2, %g0, %o1
	.word	0x9b400000	! t0_kref+0x2778:   	mov	%y, %o5
	.word	0x32480005	! t0_kref+0x277c:   	bne,a,pt	%icc, _kref+0x2790
	.word	0xfb20a008	! t0_kref+0x2780:   	st	%f29, [%g2 + 8]
	.word	0xb5a00554	! t0_kref+0x2784:   	fsqrtd	%f20, %f26
	.word	0xa9b60c98	! t0_kref+0x2788:   	fandnot2	%f24, %f24, %f20
	.word	0x98934009	! t0_kref+0x278c:   	orcc	%o5, %o1, %o4
	.word	0xa1a40858	! t0_kref+0x2790:   	faddd	%f16, %f24, %f16
	.word	0x9053703a	! t0_kref+0x2794:   	umul	%o5, -0xfc6, %o0
	.word	0xd9be1817	! t0_kref+0x2798:   	stda	%f12, [%i0 + %l7]0xc0
	.word	0x99a589de	! t0_kref+0x279c:   	fdivd	%f22, %f30, %f12
	.word	0xb9a0190f	! t0_kref+0x27a0:   	fitod	%f15, %f28
	.word	0x9632ea00	! t0_kref+0x27a4:   	orn	%o3, 0xa00, %o3
	.word	0x34480001	! t0_kref+0x27a8:   	bg,a,pt	%icc, _kref+0x27ac
	.word	0xa872400d	! t0_kref+0x27ac:   	udiv	%o1, %o5, %l4
	.word	0xfb00a038	! t0_kref+0x27b0:   	ld	[%g2 + 0x38], %f29
	.word	0x3a480005	! t0_kref+0x27b4:   	bcc,a,pt	%icc, _kref+0x27c8
	.word	0xd27e401c	! t0_kref+0x27b8:   	swap	[%i1 + %i4], %o1
	.word	0x99418000	! t0_kref+0x27bc:   	mov	%fprs, %o4
	.word	0xc0480019	! t0_kref+0x27c0:   	ldsb	[%g0 + %i1], %g0
	.word	0xbba0052c	! t0_kref+0x27c4:   	fsqrts	%f12, %f29
	.word	0x96dabfa0	! t0_kref+0x27c8:   	smulcc	%o2, -0x60, %o3
	.word	0xdd180018	! t0_kref+0x27cc:   	ldd	[%g0 + %i0], %f14
	.word	0x81ac0ace	! t0_kref+0x27d0:   	fcmped	%fcc0, %f16, %f14
	.word	0xac1b001a	! t0_kref+0x27d4:   	xor	%o4, %i2, %l6
	.word	0xd9be180a	! t0_kref+0x27d8:   	stda	%f12, [%i0 + %o2]0xc0
	.word	0x9fa01899	! t0_kref+0x27dc:   	fitos	%f25, %f15
	.word	0xea4e0000	! t0_kref+0x27e0:   	ldsb	[%i0], %l5
	.word	0x9265400d	! t0_kref+0x27e4:   	subc	%l5, %o5, %o1
	.word	0xa825e276	! t0_kref+0x27e8:   	sub	%l7, 0x276, %l4
	.word	0x2b480003	! t0_kref+0x27ec:   	fbug,a,pt	%fcc0, _kref+0x27f8
	.word	0x81800000	! t0_kref+0x27f0:   	mov	%g0, %y
	.word	0x3b800005	! t0_kref+0x27f4:   	fble,a	_kref+0x2808
	.word	0x9aaa6194	! t0_kref+0x27f8:   	andncc	%o1, 0x194, %o5
	.word	0x81dac01e	! t0_kref+0x27fc:   	flush	%o3 + %fp
	.word	0x31800003	! t0_kref+0x2800:   	fba,a	_kref+0x280c
	.word	0xaad26697	! t0_kref+0x2804:   	umulcc	%o1, 0x697, %l5
	.word	0xa7b30dee	! t0_kref+0x2808:   	fnands	%f12, %f14, %f19
	.word	0x9de3bfa0	! t0_kref+0x280c:   	save	%sp, -0x60, %sp
	.word	0x80583e8e	! t0_kref+0x2810:   	smul	%g0, -0x172, %g0
	.word	0x91ee401c	! t0_kref+0x2814:   	restore	%i1, %i4, %o0
	.word	0x9fc00004	! t0_kref+0x2818:   	call	%g0 + %g4
	.word	0x99b0012b	! t0_kref+0x281c:   	edge32n	%g0, %o3, %o4
	.word	0xa9220016	! t0_kref+0x2820:   	mulscc	%o0, %l6, %l4
	.word	0xbba018da	! t0_kref+0x2824:   	fdtos	%f26, %f29
	.word	0xb1b406ec	! t0_kref+0x2828:   	fmul8ulx16	%f16, %f12, %f24
	.word	0x9de3bfa0	! t0_kref+0x282c:   	save	%sp, -0x60, %sp
	.word	0xa9e83be7	! t0_kref+0x2830:   	restore	%g0, -0x419, %l4
	.word	0xd206001c	! t0_kref+0x2834:   	ld	[%i0 + %i4], %o1
	.word	0xef200019	! t0_kref+0x2838:   	st	%f23, [%g0 + %i1]
	.word	0xa9b30015	! t0_kref+0x283c:   	edge8	%o4, %l5, %l4
	.word	0xac358008	! t0_kref+0x2840:   	orn	%l6, %o0, %l6
	.word	0xa5b3c714	! t0_kref+0x2844:   	fmuld8sux16	%f15, %f20, %f18
	.word	0xee462000	! t0_kref+0x2848:   	ldsw	[%i0], %l7
	.word	0x99b00fc0	! t0_kref+0x284c:   	fone	%f12
	.word	0xada00556	! t0_kref+0x2850:   	fsqrtd	%f22, %f22
	.word	0x929af3c3	! t0_kref+0x2854:   	xorcc	%o3, -0xc3d, %o1
	.word	0x3c800004	! t0_kref+0x2858:   	bpos,a	_kref+0x2868
	.word	0x908b001a	! t0_kref+0x285c:   	andcc	%o4, %i2, %o0
	.word	0xe9be5800	! t0_kref+0x2860:   	stda	%f20, [%i1]0xc0
	.word	0xa9a00552	! t0_kref+0x2864:   	fsqrtd	%f18, %f20
	.word	0x8143c000	! t0_kref+0x2868:   	stbar
	.word	0xe9266018	! t0_kref+0x286c:   	st	%f20, [%i1 + 0x18]
	.word	0x9fa0052d	! t0_kref+0x2870:   	fsqrts	%f13, %f15
	.word	0xa83dc017	! t0_kref+0x2874:   	xnor	%l7, %l7, %l4
	.word	0xd64e7fed	! t0_kref+0x2878:   	ldsb	[%i1 - 0x13], %o3
	.word	0x28480004	! t0_kref+0x287c:   	bleu,a,pt	%icc, _kref+0x288c
	.word	0xd420a030	! t0_kref+0x2880:   	st	%o2, [%g2 + 0x30]
	.word	0x9db70dee	! t0_kref+0x2884:   	fnands	%f28, %f14, %f14
	.word	0x99b58d16	! t0_kref+0x2888:   	fandnot1	%f22, %f22, %f12
	.word	0xa9a01a31	! t0_kref+0x288c:   	fstoi	%f17, %f20
	.word	0xbba000b2	! t0_kref+0x2890:   	fnegs	%f18, %f29
	.word	0xa695b7ed	! t0_kref+0x2894:   	orcc	%l6, -0x813, %l3
	.word	0xa65b000b	! t0_kref+0x2898:   	smul	%o4, %o3, %l3
	.word	0xa3a018d8	! t0_kref+0x289c:   	fdtos	%f24, %f17
	.word	0xe808a025	! t0_kref+0x28a0:   	ldub	[%g2 + 0x25], %l4
	.word	0xe5f65016	! t0_kref+0x28a4:   	casxa	[%i1]0x80, %l6, %l2
	.word	0xc807bfe8	! t0_kref+0x28a8:   	ld	[%fp - 0x18], %g4
	.word	0x9da6cd3a	! t0_kref+0x28ac:   	fsmuld	%f27, %f26, %f14
	.word	0x81ab4a38	! t0_kref+0x28b0:   	fcmps	%fcc0, %f13, %f24
	.word	0xacb8000d	! t0_kref+0x28b4:   	xnorcc	%g0, %o5, %l6
	.word	0x34800006	! t0_kref+0x28b8:   	bg,a	_kref+0x28d0
	.word	0xa9a01a3a	! t0_kref+0x28bc:   	fstoi	%f26, %f20
	.word	0xac75ab14	! t0_kref+0x28c0:   	udiv	%l6, 0xb14, %l6
	.word	0x9fb74d32	! t0_kref+0x28c4:   	fandnot1s	%f29, %f18, %f15
	.word	0x81ab0a3b	! t0_kref+0x28c8:   	fcmps	%fcc0, %f12, %f27
	.word	0xada409d4	! t0_kref+0x28cc:   	fdivd	%f16, %f20, %f22
	.word	0xa9a01a52	! t0_kref+0x28d0:   	fdtoi	%f18, %f20
	.word	0xaafdc009	! t0_kref+0x28d4:   	sdivcc	%l7, %o1, %l5
	.word	0x962aaff3	! t0_kref+0x28d8:   	andn	%o2, 0xff3, %o3
	.word	0xada8804c	! t0_kref+0x28dc:   	fmovdlg	%fcc0, %f12, %f22
	.word	0xa5a0055c	! t0_kref+0x28e0:   	fsqrtd	%f28, %f18
	.word	0xa9b68200	! t0_kref+0x28e4:   	array8	%i2, %g0, %l4
	.word	0xbbb00fe0	! t0_kref+0x28e8:   	fones	%f29
	.word	0xada000b3	! t0_kref+0x28ec:   	fnegs	%f19, %f22
	.word	0x9e65e247	! t0_kref+0x28f0:   	subc	%l7, 0x247, %o7
	.word	0x8143e040	! t0_kref+0x28f4:   	membar	0x40
	.word	0x3b800004	! t0_kref+0x28f8:   	fble,a	_kref+0x2908
	.word	0xa7408000	! t0_kref+0x28fc:   	mov	%ccr, %l3
	.word	0xacba6970	! t0_kref+0x2900:   	xnorcc	%o1, 0x970, %l6
	.word	0x9fa0188c	! t0_kref+0x2904:   	fitos	%f12, %f15
	.word	0xf1200019	! t0_kref+0x2908:   	st	%f24, [%g0 + %i1]
	.word	0x9e0eb5cc	! t0_kref+0x290c:   	and	%i2, -0xa34, %o7
	.word	0xdd00a038	! t0_kref+0x2910:   	ld	[%g2 + 0x38], %f14
	.word	0xde06401c	! t0_kref+0x2914:   	ld	[%i1 + %i4], %o7
	.word	0x8055400d	! t0_kref+0x2918:   	umul	%l5, %o5, %g0
	.word	0xa92324a8	! t0_kref+0x291c:   	mulscc	%o4, 0x4a8, %l4
	.word	0xf51fbf68	! t0_kref+0x2920:   	ldd	[%fp - 0x98], %f26
	.word	0xa90362b2	! t0_kref+0x2924:   	taddcc	%o5, 0x2b2, %l4
	.word	0x1935ca69	! t0_kref+0x2928:   	sethi	%hi(0xd729a400), %o4
	.word	0xbda00036	! t0_kref+0x292c:   	fmovs	%f22, %f30
	.word	0xf4280019	! t0_kref+0x2930:   	stb	%i2, [%g0 + %i1]
	.word	0x22800006	! t0_kref+0x2934:   	be,a	_kref+0x294c
	.word	0xb7b00cf9	! t0_kref+0x2938:   	fnot2s	%f25, %f27
	.word	0xe76e6018	! t0_kref+0x293c:   	prefetch	%i1 + 0x18, 19
	.word	0xacd34008	! t0_kref+0x2940:   	umulcc	%o5, %o0, %l6
	.word	0x3c480008	! t0_kref+0x2944:   	bpos,a,pt	%icc, _kref+0x2964
	.word	0xec7e401c	! t0_kref+0x2948:   	swap	[%i1 + %i4], %l6
	.word	0x9db506d4	! t0_kref+0x294c:   	fmul8sux16	%f20, %f20, %f14
	.word	0xa8aa7541	! t0_kref+0x2950:   	andncc	%o1, -0xabf, %l4
	.word	0xdaa01019	! t0_kref+0x2954:   	sta	%o5, [%g0 + %i1]0x80
	.word	0x99b60d18	! t0_kref+0x2958:   	fandnot1	%f24, %f24, %f12
	.word	0x8035c017	! t0_kref+0x295c:   	orn	%l7, %l7, %g0
	.word	0x9eda7cca	! t0_kref+0x2960:   	smulcc	%o1, -0x336, %o7
	.word	0x2f800008	! t0_kref+0x2964:   	fbu,a	_kref+0x2984
	.word	0x8143c000	! t0_kref+0x2968:   	stbar
	.word	0x8143c000	! t0_kref+0x296c:   	stbar
	.word	0x9b22e09c	! t0_kref+0x2970:   	mulscc	%o3, 0x9c, %o5
	.word	0x3a480002	! t0_kref+0x2974:   	bcc,a,pt	%icc, _kref+0x297c
	.word	0xda46600c	! t0_kref+0x2978:   	ldsw	[%i1 + 0xc], %o5
	.word	0xa9a00552	! t0_kref+0x297c:   	fsqrtd	%f18, %f20
	.word	0xb7a0052d	! t0_kref+0x2980:   	fsqrts	%f13, %f27
	.word	0x3c480004	! t0_kref+0x2984:   	bpos,a,pt	%icc, _kref+0x2994
	.word	0x911aa7e8	! t0_kref+0x2988:   	tsubcctv	%o2, 0x7e8, %o0
	.word	0xed263ff0	! t0_kref+0x298c:   	st	%f22, [%i0 - 0x10]
	.word	0x94368017	! t0_kref+0x2990:   	orn	%i2, %l7, %o2
	.word	0xbba01a35	! t0_kref+0x2994:   	fstoi	%f21, %f29
	.word	0x808b23ba	! t0_kref+0x2998:   	btst	0x3ba, %o4
	.word	0xa5a88054	! t0_kref+0x299c:   	fmovdlg	%fcc0, %f20, %f18
	.word	0x80e54000	! t0_kref+0x29a0:   	subccc	%l5, %g0, %g0
	.word	0x3d480008	! t0_kref+0x29a4:   	fbule,a,pt	%fcc0, _kref+0x29c4
	.word	0xafb54a73	! t0_kref+0x29a8:   	fpadd32s	%f21, %f19, %f23
	.word	0xe8566010	! t0_kref+0x29ac:   	ldsh	[%i1 + 0x10], %l4
	.word	0xacf5801a	! t0_kref+0x29b0:   	udivcc	%l6, %i2, %l6
	.word	0xabb200ea	! t0_kref+0x29b4:   	edge16ln	%o0, %o2, %l5
	.word	0xae1ab761	! t0_kref+0x29b8:   	xor	%o2, -0x89f, %l7
	.word	0xe81e4000	! t0_kref+0x29bc:   	ldd	[%i1], %l4
	.word	0xe8060000	! t0_kref+0x29c0:   	ld	[%i0], %l4
	.word	0x1323bc20	! t0_kref+0x29c4:   	sethi	%hi(0x8ef08000), %o1
	.word	0xa9b70f94	! t0_kref+0x29c8:   	for	%f28, %f20, %f20
	.word	0xf3067fe0	! t0_kref+0x29cc:   	ld	[%i1 - 0x20], %f25
	.word	0xec36001b	! t0_kref+0x29d0:   	sth	%l6, [%i0 + %i3]
	.word	0x9e957e6a	! t0_kref+0x29d4:   	orcc	%l5, -0x196, %o7
	.word	0x26800008	! t0_kref+0x29d8:   	bl,a	_kref+0x29f8
	.word	0xa7a5892d	! t0_kref+0x29dc:   	fmuls	%f22, %f13, %f19
	.word	0xe96e401b	! t0_kref+0x29e0:   	prefetch	%i1 + %i3, 20
	.word	0xdece501a	! t0_kref+0x29e4:   	ldsba	[%i1 + %i2]0x80, %o7
	.word	0xa9a0190e	! t0_kref+0x29e8:   	fitod	%f14, %f20
	.word	0x20480007	! t0_kref+0x29ec:   	bn,a,pt	%icc, _kref+0x2a08
	.word	0xe9062010	! t0_kref+0x29f0:   	ld	[%i0 + 0x10], %f20
	.word	0x93b5c14a	! t0_kref+0x29f4:   	edge32l	%l7, %o2, %o1
	.word	0x96ab28b2	! t0_kref+0x29f8:   	andncc	%o4, 0x8b2, %o3
	.word	0x91b68160	! t0_kref+0x29fc:   	edge32ln	%i2, %g0, %o0
	.word	0x9e23400c	! t0_kref+0x2a00:   	sub	%o5, %o4, %o7
	.word	0x97b684d6	! t0_kref+0x2a04:   	fcmpne32	%f26, %f22, %o3
	.word	0xa5702c7b	! t0_kref+0x2a08:   	popc	0xc7b, %l2
	.word	0x99a0054c	! t0_kref+0x2a0c:   	fsqrtd	%f12, %f12
	.word	0xb1a00558	! t0_kref+0x2a10:   	fsqrtd	%f24, %f24
	.word	0xdb200018	! t0_kref+0x2a14:   	st	%f13, [%g0 + %i0]
	.word	0xed20a020	! t0_kref+0x2a18:   	st	%f22, [%g2 + 0x20]
	.word	0x9076b83a	! t0_kref+0x2a1c:   	udiv	%i2, -0x7c6, %o0
	.word	0xb5a3cd30	! t0_kref+0x2a20:   	fsmuld	%f15, %f16, %f26
	.word	0xa1b70edc	! t0_kref+0x2a24:   	fornot2	%f28, %f28, %f16
	.word	0xe968a086	! t0_kref+0x2a28:   	prefetch	%g2 + 0x86, 20
	.word	0xd4280018	! t0_kref+0x2a2c:   	stb	%o2, [%g0 + %i0]
	.word	0xa7b58200	! t0_kref+0x2a30:   	array8	%l6, %g0, %l3
	.word	0xb9a708d8	! t0_kref+0x2a34:   	fsubd	%f28, %f24, %f28
	.word	0x9ad54017	! t0_kref+0x2a38:   	umulcc	%l5, %l7, %o5
	.word	0xb5a0189c	! t0_kref+0x2a3c:   	fitos	%f28, %f26
	.word	0x99a709d8	! t0_kref+0x2a40:   	fdivd	%f28, %f24, %f12
	.word	0xa7b4cd60	! t0_kref+0x2a44:   	fnot1s	%f19, %f19
	.word	0xb9b38ade	! t0_kref+0x2a48:   	fpsub32	%f14, %f30, %f28
	.word	0x33800001	! t0_kref+0x2a4c:   	fbe,a	_kref+0x2a50
	.word	0xd86e2002	! t0_kref+0x2a50:   	ldstub	[%i0 + 2], %o4
	.word	0xf900a024	! t0_kref+0x2a54:   	ld	[%g2 + 0x24], %f28
	.word	0x2d1f8b05	! t0_kref+0x2a58:   	sethi	%hi(0x7e2c1400), %l6
	.word	0x9db60e3a	! t0_kref+0x2a5c:   	fands	%f24, %f26, %f14
	.word	0x3a480004	! t0_kref+0x2a60:   	bcc,a,pt	%icc, _kref+0x2a70
	.word	0x99408000	! t0_kref+0x2a64:   	mov	%ccr, %o4
	.word	0x1b3d2620	! t0_kref+0x2a68:   	sethi	%hi(0xf4988000), %o5
	.word	0xd06e6000	! t0_kref+0x2a6c:   	ldstub	[%i1], %o0
	.word	0xf99e5a1d	! t0_kref+0x2a70:   	ldda	[%i1 + %i5]0xd0, %f28
	.word	0xee30a036	! t0_kref+0x2a74:   	sth	%l7, [%g2 + 0x36]
	.word	0xa9a0110c	! t0_kref+0x2a78:   	fxtod	%f12, %f20
	.word	0x9056b2af	! t0_kref+0x2a7c:   	umul	%i2, -0xd51, %o0
	.word	0xec3e6000	! t0_kref+0x2a80:   	std	%l6, [%i1]
	.word	0x81580000	! t0_kref+0x2a84:   	flushw
	.word	0x98468008	! t0_kref+0x2a88:   	addc	%i2, %o0, %o4
	.word	0xae722b15	! t0_kref+0x2a8c:   	udiv	%o0, 0xb15, %l7
	.word	0x99a01a2d	! t0_kref+0x2a90:   	fstoi	%f13, %f12
	.word	0x33800005	! t0_kref+0x2a94:   	fbe,a	_kref+0x2aa8
	.word	0xa81af512	! t0_kref+0x2a98:   	xor	%o3, -0xaee, %l4
	.word	0x969d4015	! t0_kref+0x2a9c:   	xorcc	%l5, %l5, %o3
	.word	0xb5a00556	! t0_kref+0x2aa0:   	fsqrtd	%f22, %f26
	.word	0xd648a024	! t0_kref+0x2aa4:   	ldsb	[%g2 + 0x24], %o3
	.word	0x93400000	! t0_kref+0x2aa8:   	mov	%y, %o1
	.word	0xadb00117	! t0_kref+0x2aac:   	edge32	%g0, %l7, %l6
	.word	0x8d828009	! t0_kref+0x2ab0:   	wr	%o2, %o1, %fprs
	.word	0x9410000a	! t0_kref+0x2ab4:   	mov	%o2, %o2
	.word	0xab22c00d	! t0_kref+0x2ab8:   	mulscc	%o3, %o5, %l5
	.word	0x99a01033	! t0_kref+0x2abc:   	fstox	%f19, %f12
	.word	0xac1dc00d	! t0_kref+0x2ac0:   	xor	%l7, %o5, %l6
	.word	0xaae24017	! t0_kref+0x2ac4:   	subccc	%o1, %l7, %l5
	.word	0xd62e401a	! t0_kref+0x2ac8:   	stb	%o3, [%i1 + %i2]
	.word	0xd24e6001	! t0_kref+0x2acc:   	ldsb	[%i1 + 1], %o1
	.word	0x96934016	! t0_kref+0x2ad0:   	orcc	%o5, %l6, %o3
	.word	0x81ad8a3c	! t0_kref+0x2ad4:   	fcmps	%fcc0, %f22, %f28
	.word	0xda363ffe	! t0_kref+0x2ad8:   	sth	%o5, [%i0 - 2]
	.word	0x908d6bf7	! t0_kref+0x2adc:   	andcc	%l5, 0xbf7, %o0
	.word	0xaca2e0b7	! t0_kref+0x2ae0:   	subcc	%o3, 0xb7, %l6
	.word	0x94f54015	! t0_kref+0x2ae4:   	udivcc	%l5, %l5, %o2
	.word	0xa3a01a5c	! t0_kref+0x2ae8:   	fdtoi	%f28, %f17
	.word	0xaa5a0008	! t0_kref+0x2aec:   	smul	%o0, %o0, %l5
	.word	0xa9b6063c	! t0_kref+0x2af0:   	fmul8x16	%f24, %f28, %f20
	.word	0x805df89c	! t0_kref+0x2af4:   	smul	%l7, -0x764, %g0
	.word	0xea2e8019	! t0_kref+0x2af8:   	stb	%l5, [%i2 + %i1]
	.word	0xa1a0055c	! t0_kref+0x2afc:   	fsqrtd	%f28, %f16
	.word	0xd8ae9019	! t0_kref+0x2b00:   	stba	%o4, [%i2 + %i1]0x80
	.word	0x34480002	! t0_kref+0x2b04:   	bg,a,pt	%icc, _kref+0x2b0c
	.word	0xd8200018	! t0_kref+0x2b08:   	st	%o4, [%g0 + %i0]
	.word	0x907a7c74	! t0_kref+0x2b0c:   	sdiv	%o1, -0x38c, %o0
	.word	0xb3b64a36	! t0_kref+0x2b10:   	fpadd16s	%f25, %f22, %f25
	.word	0xaf332012	! t0_kref+0x2b14:   	srl	%o4, 0x12, %l7
	.word	0x92ab400a	! t0_kref+0x2b18:   	andncc	%o5, %o2, %o1
	.word	0xada64d2c	! t0_kref+0x2b1c:   	fsmuld	%f25, %f12, %f22
	.word	0x97400000	! t0_kref+0x2b20:   	mov	%y, %o3
	.word	0xaca82d4e	! t0_kref+0x2b24:   	andncc	%g0, 0xd4e, %l6
	.word	0xa9b38e14	! t0_kref+0x2b28:   	fand	%f14, %f20, %f20
	.word	0xa4f2f6a4	! t0_kref+0x2b2c:   	udivcc	%o3, -0x95c, %l2
	.word	0x99a489ce	! t0_kref+0x2b30:   	fdivd	%f18, %f14, %f12
	.word	0xe11e3ff0	! t0_kref+0x2b34:   	ldd	[%i0 - 0x10], %f16
	.word	0xe1070018	! t0_kref+0x2b38:   	ld	[%i4 + %i0], %f16
	.word	0xd8ce5000	! t0_kref+0x2b3c:   	ldsba	[%i1]0x80, %o4
	.word	0x920a000b	! t0_kref+0x2b40:   	and	%o0, %o3, %o1
	.word	0xd41f4018	! t0_kref+0x2b44:   	ldd	[%i5 + %i0], %o2
	.word	0xde40a000	! t0_kref+0x2b48:   	ldsw	[%g2], %o7
	.word	0xda270019	! t0_kref+0x2b4c:   	st	%o5, [%i4 + %i1]
	.word	0xf207bfe0	! t0_kref+0x2b50:   	ld	[%fp - 0x20], %i1
	.word	0x27800005	! t0_kref+0x2b54:   	fbul,a	_kref+0x2b68
	.word	0xb3b74ea0	! t0_kref+0x2b58:   	fsrc1s	%f29, %f25
	.word	0xa1a01094	! t0_kref+0x2b5c:   	fxtos	%f20, %f16
	.word	0xf920a014	! t0_kref+0x2b60:   	st	%f28, [%g2 + 0x14]
	.word	0xa940c000	! t0_kref+0x2b64:   	mov	%asi, %l4
	.word	0x9325a95a	! t0_kref+0x2b68:   	mulscc	%l6, 0x95a, %o1
	.word	0x3e480008	! t0_kref+0x2b6c:   	bvc,a,pt	%icc, _kref+0x2b8c
	.word	0xee070019	! t0_kref+0x2b70:   	ld	[%i4 + %i1], %l7
	.word	0xebe61017	! t0_kref+0x2b74:   	casa	[%i0]0x80, %l7, %l5
	.word	0xa8aa000a	! t0_kref+0x2b78:   	andncc	%o0, %o2, %l4
	.word	0x8182c000	! t0_kref+0x2b7c:   	wr	%o3, %g0, %y
	.word	0xdd1e401d	! t0_kref+0x2b80:   	ldd	[%i1 + %i5], %f14
	.word	0x80adb676	! t0_kref+0x2b84:   	andncc	%l6, -0x98a, %g0
	.word	0x3a480003	! t0_kref+0x2b88:   	bcc,a,pt	%icc, _kref+0x2b94
	.word	0x949b2ab7	! t0_kref+0x2b8c:   	xorcc	%o4, 0xab7, %o2
	.word	0xa88a800b	! t0_kref+0x2b90:   	andcc	%o2, %o3, %l4
	.word	0x2d480007	! t0_kref+0x2b94:   	fbg,a,pt	%fcc0, _kref+0x2bb0
	.word	0xb9a01930	! t0_kref+0x2b98:   	fstod	%f16, %f28
	.word	0xa5a0110e	! t0_kref+0x2b9c:   	fxtod	%f14, %f18
	.word	0xa9b58e4c	! t0_kref+0x2ba0:   	fxnor	%f22, %f12, %f20
	.word	0xb3b58df1	! t0_kref+0x2ba4:   	fnands	%f22, %f17, %f25
	.word	0xda4e200c	! t0_kref+0x2ba8:   	ldsb	[%i0 + 0xc], %o5
	.word	0xda28a03c	! t0_kref+0x2bac:   	stb	%o5, [%g2 + 0x3c]
	.word	0xa1a01a50	! t0_kref+0x2bb0:   	fdtoi	%f16, %f16
	.word	0xecee9018	! t0_kref+0x2bb4:   	ldstuba	[%i2 + %i0]0x80, %l6
	.word	0xadb00770	! t0_kref+0x2bb8:   	fpack16	%f16, %f22
	.word	0x3a800007	! t0_kref+0x2bbc:   	bcc,a	_kref+0x2bd8
	.word	0xe1be1800	! t0_kref+0x2bc0:   	stda	%f16, [%i0]0xc0
	.word	0xd41f4018	! t0_kref+0x2bc4:   	ldd	[%i5 + %i0], %o2
	.word	0x81b0004a	! t0_kref+0x2bc8:   	edge8l	%g0, %o2, %g0
	.word	0xadb5404c	! t0_kref+0x2bcc:   	edge8l	%l5, %o4, %l6
	.word	0xae82000c	! t0_kref+0x2bd0:   	addcc	%o0, %o4, %l7
	.word	0xec6e8018	! t0_kref+0x2bd4:   	ldstub	[%i2 + %i0], %l6
	.word	0x3e480008	! t0_kref+0x2bd8:   	bvc,a,pt	%icc, _kref+0x2bf8
	.word	0x9a1e800b	! t0_kref+0x2bdc:   	xor	%i2, %o3, %o5
	.word	0xf11e7ff0	! t0_kref+0x2be0:   	ldd	[%i1 - 0x10], %f24
	.word	0xa1a0053b	! t0_kref+0x2be4:   	fsqrts	%f27, %f16
	.word	0xaba0012f	! t0_kref+0x2be8:   	fabss	%f15, %f21
	.word	0xaa5aa6d9	! t0_kref+0x2bec:   	smul	%o2, 0x6d9, %l5
	.word	0xea7e2014	! t0_kref+0x2bf0:   	swap	[%i0 + 0x14], %l5
	.word	0x99b48af2	! t0_kref+0x2bf4:   	fpsub32s	%f18, %f18, %f12
	.word	0xea766018	! t0_kref+0x2bf8:   	stx	%l5, [%i1 + 0x18]
	.word	0xfbee501a	! t0_kref+0x2bfc:   	prefetcha	%i1 + %i2, 29
	.word	0xf9ee501a	! t0_kref+0x2c00:   	prefetcha	%i1 + %i2, 28
	.word	0x37800001	! t0_kref+0x2c04:   	fbge,a	_kref+0x2c08
	.word	0xb5a0193c	! t0_kref+0x2c08:   	fstod	%f28, %f26
	.word	0xea6e4000	! t0_kref+0x2c0c:   	ldstub	[%i1], %l5
	.word	0xa62b6e79	! t0_kref+0x2c10:   	andn	%o5, 0xe79, %l3
	.word	0xa7b2c140	! t0_kref+0x2c14:   	edge32l	%o3, %g0, %l3
	.word	0xd0000018	! t0_kref+0x2c18:   	ld	[%g0 + %i0], %o0
	.word	0x9ab5c00c	! t0_kref+0x2c1c:   	orncc	%l7, %o4, %o5
	call	1f
	.empty
	.word	0xd8a81018	! t0_kref+0x2c24:   	stba	%o4, [%g0 + %i0]0x80
	.word	0xa45ae685	! t0_kref+0x2c28:   	smul	%o3, 0x685, %l2
	.word	0xada748b2	! t0_kref+0x2c2c:   	fsubs	%f29, %f18, %f22
	.word	0x8143c000	! t0_kref+0x2c30:   	stbar
	.word	0xea063fe8	! t0_kref+0x2c34:   	ld	[%i0 - 0x18], %l5
	.word	0x2c480002	! t0_kref+0x2c38:   	bneg,a,pt	%icc, _kref+0x2c40
1:	.word	0xe51f4018	! t0_kref+0x2c3c:   	ldd	[%i5 + %i0], %f18
	.word	0xa1b406f0	! t0_kref+0x2c40:   	fmul8ulx16	%f16, %f16, %f16
	.word	0xa8720009	! t0_kref+0x2c44:   	udiv	%o0, %o1, %l4
	.word	0x33480001	! t0_kref+0x2c48:   	fbe,a,pt	%fcc0, _kref+0x2c4c
	.word	0xd6270018	! t0_kref+0x2c4c:   	st	%o3, [%i4 + %i0]
	.word	0x9285fcc0	! t0_kref+0x2c50:   	addcc	%l7, -0x340, %o1
	.word	0x98f24009	! t0_kref+0x2c54:   	udivcc	%o1, %o1, %o4
	.word	0xb1b38d2d	! t0_kref+0x2c58:   	fandnot1s	%f14, %f13, %f24
	.word	0xda5e3fe8	! t0_kref+0x2c5c:   	ldx	[%i0 - 0x18], %o5
	.word	0xa6154008	! t0_kref+0x2c60:   	or	%l5, %o0, %l3
	.word	0xebee101d	! t0_kref+0x2c64:   	prefetcha	%i0 + %i5, 21
	.word	0xa5a00554	! t0_kref+0x2c68:   	fsqrtd	%f20, %f18
	.word	0x961a400d	! t0_kref+0x2c6c:   	xor	%o1, %o5, %o3
	.word	0x2c800008	! t0_kref+0x2c70:   	bneg,a	_kref+0x2c90
	.word	0xecb01018	! t0_kref+0x2c74:   	stha	%l6, [%g0 + %i0]0x80
	.word	0xe84e401a	! t0_kref+0x2c78:   	ldsb	[%i1 + %i2], %l4
	.word	0xebee101b	! t0_kref+0x2c7c:   	prefetcha	%i0 + %i3, 21
	.word	0xd9be5a1c	! t0_kref+0x2c80:   	stda	%f12, [%i1 + %i4]0xd0
	.word	0x29480002	! t0_kref+0x2c84:   	fbl,a,pt	%fcc0, _kref+0x2c8c
	.word	0xa7b2c089	! t0_kref+0x2c88:   	edge16	%o3, %o1, %l3
	.word	0x2d39a692	! t0_kref+0x2c8c:   	sethi	%hi(0xe69a4800), %l6
	.word	0x32800002	! t0_kref+0x2c90:   	bne,a	_kref+0x2c98
	.word	0xae0d8017	! t0_kref+0x2c94:   	and	%l6, %l7, %l7
	.word	0xaba000be	! t0_kref+0x2c98:   	fnegs	%f30, %f21
	.word	0xed9e5000	! t0_kref+0x2c9c:   	ldda	[%i1]0x80, %f22
	.word	0x9116b430	! t0_kref+0x2ca0:   	taddcctv	%i2, -0xbd0, %o0
	.word	0x9a2ab2a5	! t0_kref+0x2ca4:   	andn	%o2, -0xd5b, %o5
	.word	0x81580000	! t0_kref+0x2ca8:   	flushw
	.word	0xc0000019	! t0_kref+0x2cac:   	ld	[%g0 + %i1], %g0
	.word	0xafa00137	! t0_kref+0x2cb0:   	fabss	%f23, %f23
	.word	0xb3a0013e	! t0_kref+0x2cb4:   	fabss	%f30, %f25
	.word	0x9fc00004	! t0_kref+0x2cb8:   	call	%g0 + %g4
	.word	0xa144c000	! t0_kref+0x2cbc:   	mov	%gsr, %l0
	.word	0x2f800007	! t0_kref+0x2cc0:   	fbu,a	_kref+0x2cdc
	.word	0xdd1e6000	! t0_kref+0x2cc4:   	ldd	[%i1], %f14
	.word	0xa4732aeb	! t0_kref+0x2cc8:   	udiv	%o4, 0xaeb, %l2
	.word	0xadb4caee	! t0_kref+0x2ccc:   	fpsub32s	%f19, %f14, %f22
	.word	0x34800005	! t0_kref+0x2cd0:   	bg,a	_kref+0x2ce4
	.word	0x96354015	! t0_kref+0x2cd4:   	orn	%l5, %l5, %o3
	.word	0xaab2c016	! t0_kref+0x2cd8:   	orncc	%o3, %l6, %l5
	.word	0xe9be1857	! t0_kref+0x2cdc:   	stda	%f20, [%i0 + %l7]0xc2
	.word	0xb9a01934	! t0_kref+0x2ce0:   	fstod	%f20, %f28
	.word	0x3d800001	! t0_kref+0x2ce4:   	fbule,a	_kref+0x2ce8
	.word	0xc006001c	! t0_kref+0x2ce8:   	ld	[%i0 + %i4], %g0
	.word	0xea10a00e	! t0_kref+0x2cec:   	lduh	[%g2 + 0xe], %l5
	.word	0xe27e2014	! t0_kref+0x2cf0:   	swap	[%i0 + 0x14], %l1
	.word	0xefee101d	! t0_kref+0x2cf4:   	prefetcha	%i0 + %i5, 23
	.word	0xab400000	! t0_kref+0x2cf8:   	mov	%y, %l5
	.word	0xee20a030	! t0_kref+0x2cfc:   	st	%l7, [%g2 + 0x30]
	.word	0x9db70e12	! t0_kref+0x2d00:   	fand	%f28, %f18, %f14
	.word	0xfd1e6018	! t0_kref+0x2d04:   	ldd	[%i1 + 0x18], %f30
	.word	0x37480004	! t0_kref+0x2d08:   	fbge,a,pt	%fcc0, _kref+0x2d18
	.word	0xe968a008	! t0_kref+0x2d0c:   	prefetch	%g2 + 8, 20
	.word	0xaab03ab0	! t0_kref+0x2d10:   	orncc	%g0, -0x550, %l5
	.word	0xafa00535	! t0_kref+0x2d14:   	fsqrts	%f21, %f23
	.word	0xb3a018dc	! t0_kref+0x2d18:   	fdtos	%f28, %f25
	.word	0x9da0191b	! t0_kref+0x2d1c:   	fitod	%f27, %f14
	.word	0x9252265b	! t0_kref+0x2d20:   	umul	%o0, 0x65b, %o1
	.word	0x9042fa9d	! t0_kref+0x2d24:   	addc	%o3, -0x563, %o0
	.word	0x986562c8	! t0_kref+0x2d28:   	subc	%l5, 0x2c8, %o4
	.word	0x9ba54835	! t0_kref+0x2d2c:   	fadds	%f21, %f21, %f13
	.word	0xe6562016	! t0_kref+0x2d30:   	ldsh	[%i0 + 0x16], %l3
	.word	0x3e480008	! t0_kref+0x2d34:   	bvc,a,pt	%icc, _kref+0x2d54
	.word	0x908de82b	! t0_kref+0x2d38:   	andcc	%l7, 0x82b, %o0
	.word	0xc1ee500a	! t0_kref+0x2d3c:   	prefetcha	%i1 + %o2, 0
	.word	0xdd263ff4	! t0_kref+0x2d40:   	st	%f14, [%i0 - 0xc]
	.word	0x8076a7fa	! t0_kref+0x2d44:   	udiv	%i2, 0x7fa, %g0
	.word	0xb1b74716	! t0_kref+0x2d48:   	fmuld8sux16	%f29, %f22, %f24
	.word	0xc00e6009	! t0_kref+0x2d4c:   	ldub	[%i1 + 9], %g0
	.word	0xe4063fec	! t0_kref+0x2d50:   	ld	[%i0 - 0x14], %l2
	.word	0x81ad4a3d	! t0_kref+0x2d54:   	fcmps	%fcc0, %f21, %f29
	.word	0x9418000b	! t0_kref+0x2d58:   	xor	%g0, %o3, %o2
	.word	0xa6120015	! t0_kref+0x2d5c:   	or	%o0, %l5, %l3
	.word	0x94303b2d	! t0_kref+0x2d60:   	orn	%g0, -0x4d3, %o2
	.word	0x2a480004	! t0_kref+0x2d64:   	bcs,a,pt	%icc, _kref+0x2d74
	.word	0xa9a5c82f	! t0_kref+0x2d68:   	fadds	%f23, %f15, %f20
	.word	0x9da0193b	! t0_kref+0x2d6c:   	fstod	%f27, %f14
	.word	0xe41e001d	! t0_kref+0x2d70:   	ldd	[%i0 + %i5], %l2
	.word	0x3d800006	! t0_kref+0x2d74:   	fbule,a	_kref+0x2d8c
	.word	0xee4e3ffd	! t0_kref+0x2d78:   	ldsb	[%i0 - 3], %l7
	.word	0xa80d400c	! t0_kref+0x2d7c:   	and	%l5, %o4, %l4
	.word	0x3b800008	! t0_kref+0x2d80:   	fble,a	_kref+0x2da0
	.word	0xee28a00e	! t0_kref+0x2d84:   	stb	%l7, [%g2 + 0xe]
	.word	0xda280018	! t0_kref+0x2d88:   	stb	%o5, [%g0 + %i0]
	.word	0xe8be101d	! t0_kref+0x2d8c:   	stda	%l4, [%i0 + %i5]0x80
	.word	0xb9a4cd2c	! t0_kref+0x2d90:   	fsmuld	%f19, %f12, %f28
	.word	0xd628a01e	! t0_kref+0x2d94:   	stb	%o3, [%g2 + 0x1e]
	.word	0xd01e6000	! t0_kref+0x2d98:   	ldd	[%i1], %o0
	.word	0xda10a010	! t0_kref+0x2d9c:   	lduh	[%g2 + 0x10], %o5
	.word	0x9e0a000c	! t0_kref+0x2da0:   	and	%o0, %o4, %o7
	.word	0xfb00a00c	! t0_kref+0x2da4:   	ld	[%g2 + 0xc], %f29
	.word	0xa6334015	! t0_kref+0x2da8:   	orn	%o5, %l5, %l3
	.word	0x80d2400b	! t0_kref+0x2dac:   	umulcc	%o1, %o3, %g0
	.word	0xaf2ae002	! t0_kref+0x2db0:   	sll	%o3, 0x2, %l7
	.word	0xa1a709d0	! t0_kref+0x2db4:   	fdivd	%f28, %f16, %f16
	.word	0xbbb38cba	! t0_kref+0x2db8:   	fandnot2s	%f14, %f26, %f29
	.word	0xb7b30aed	! t0_kref+0x2dbc:   	fpsub32s	%f12, %f13, %f27
	.word	0xbda01a3c	! t0_kref+0x2dc0:   	fstoi	%f28, %f30
	.word	0xd250a030	! t0_kref+0x2dc4:   	ldsh	[%g2 + 0x30], %o1
	.word	0x972a400d	! t0_kref+0x2dc8:   	sll	%o1, %o5, %o3
	.word	0x99a01a2f	! t0_kref+0x2dcc:   	fstoi	%f15, %f12
	.word	0x3e480001	! t0_kref+0x2dd0:   	bvc,a,pt	%icc, _kref+0x2dd4
	.word	0xa6a02914	! t0_kref+0x2dd4:   	subcc	%g0, 0x914, %l3
	.word	0xbba0052d	! t0_kref+0x2dd8:   	fsqrts	%f13, %f29
	.word	0xee5e6000	! t0_kref+0x2ddc:   	ldx	[%i1], %l7
	.word	0x28800002	! t0_kref+0x2de0:   	bleu,a	_kref+0x2de8
	.word	0xe83e001d	! t0_kref+0x2de4:   	std	%l4, [%i0 + %i5]
	.word	0x9fc00004	! t0_kref+0x2de8:   	call	%g0 + %g4
	.word	0x8143c000	! t0_kref+0x2dec:   	stbar
	.word	0xabb68592	! t0_kref+0x2df0:   	fcmpgt32	%f26, %f18, %l5
	.word	0xe51e2010	! t0_kref+0x2df4:   	ldd	[%i0 + 0x10], %f18
	.word	0xb7a0053b	! t0_kref+0x2df8:   	fsqrts	%f27, %f27
	.word	0xa3a00531	! t0_kref+0x2dfc:   	fsqrts	%f17, %f17
	call	SYM(t0_subr3)
	.word	0xa5aa0054	! t0_kref+0x2e04:   	fmovda	%fcc0, %f20, %f18
	.word	0x2d1bbbe7	! t0_kref+0x2e08:   	sethi	%hi(0x6eef9c00), %l6
	.word	0x23800008	! t0_kref+0x2e0c:   	fbne,a	_kref+0x2e2c
	.word	0xafa6c82d	! t0_kref+0x2e10:   	fadds	%f27, %f13, %f23
	.word	0xb5a01938	! t0_kref+0x2e14:   	fstod	%f24, %f26
	.word	0xd420a030	! t0_kref+0x2e18:   	st	%o2, [%g2 + 0x30]
	.word	0xa1a018d8	! t0_kref+0x2e1c:   	fdtos	%f24, %f16
	.word	0x8062add2	! t0_kref+0x2e20:   	subc	%o2, 0xdd2, %g0
	.word	0xb9b48c9a	! t0_kref+0x2e24:   	fandnot2	%f18, %f26, %f28
	.word	0xc7ee500b	! t0_kref+0x2e28:   	prefetcha	%i1 + %o3, 3
	.word	0xda0e0000	! t0_kref+0x2e2c:   	ldub	[%i0], %o5
	.word	0x9ee2c008	! t0_kref+0x2e30:   	subccc	%o3, %o0, %o7
	.word	0xb9b60dce	! t0_kref+0x2e34:   	fnand	%f24, %f14, %f28
	.word	0x36480008	! t0_kref+0x2e38:   	bge,a,pt	%icc, _kref+0x2e58
	.word	0xd9000019	! t0_kref+0x2e3c:   	ld	[%g0 + %i1], %f12
	.word	0xedee501b	! t0_kref+0x2e40:   	prefetcha	%i1 + %i3, 22
	.word	0x93400000	! t0_kref+0x2e44:   	mov	%y, %o1
	.word	0x901ac00d	! t0_kref+0x2e48:   	xor	%o3, %o5, %o0
	.word	0x99b58558	! t0_kref+0x2e4c:   	fcmpeq16	%f22, %f24, %o4
	.word	0xee2e6016	! t0_kref+0x2e50:   	stb	%l7, [%i1 + 0x16]
	.word	0xb3a0053b	! t0_kref+0x2e54:   	fsqrts	%f27, %f25
	.word	0xada01911	! t0_kref+0x2e58:   	fitod	%f17, %f22
	.word	0x8143c000	! t0_kref+0x2e5c:   	stbar
	.word	0xad400000	! t0_kref+0x2e60:   	mov	%y, %l6
	.word	0x9e9d6fed	! t0_kref+0x2e64:   	xorcc	%l5, 0xfed, %o7
	.word	0x9fc10000	! t0_kref+0x2e68:   	call	%g4
	.word	0xd830a03c	! t0_kref+0x2e6c:   	sth	%o4, [%g2 + 0x3c]
	.word	0x9312e0a6	! t0_kref+0x2e70:   	taddcctv	%o3, 0xa6, %o1
	.word	0xada0192f	! t0_kref+0x2e74:   	fstod	%f15, %f22
	.word	0x3c480001	! t0_kref+0x2e78:   	bpos,a,pt	%icc, _kref+0x2e7c
	.word	0xde08a000	! t0_kref+0x2e7c:   	ldub	[%g2], %o7
	.word	0xc168a08b	! t0_kref+0x2e80:   	prefetch	%g2 + 0x8b, 0
	.word	0xe83e6010	! t0_kref+0x2e84:   	std	%l4, [%i1 + 0x10]
	.word	0x81ad8a54	! t0_kref+0x2e88:   	fcmpd	%fcc0, %f22, %f20
	.word	0xa72b6006	! t0_kref+0x2e8c:   	sll	%o5, 0x6, %l3
	.word	0xd640a020	! t0_kref+0x2e90:   	ldsw	[%g2 + 0x20], %o3
	.word	0x9fc00004	! t0_kref+0x2e94:   	call	%g0 + %g4
	.word	0xeaa01018	! t0_kref+0x2e98:   	sta	%l5, [%g0 + %i0]0x80
	.word	0xa655680f	! t0_kref+0x2e9c:   	umul	%l5, 0x80f, %l3
	.word	0xe81f4019	! t0_kref+0x2ea0:   	ldd	[%i5 + %i1], %l4
	.word	0x96580000	! t0_kref+0x2ea4:   	smul	%g0, %g0, %o3
	.word	0x940a73e9	! t0_kref+0x2ea8:   	and	%o1, -0xc17, %o2
	.word	0xa1a000b0	! t0_kref+0x2eac:   	fnegs	%f16, %f16
	.word	0xb5a589cc	! t0_kref+0x2eb0:   	fdivd	%f22, %f12, %f26
	.word	0x91b2c02d	! t0_kref+0x2eb4:   	edge8n	%o3, %o5, %o0
	.word	0xa9b0076c	! t0_kref+0x2eb8:   	fpack16	%f12, %f20
	.word	0x95400000	! t0_kref+0x2ebc:   	mov	%y, %o2
	call	1f
	.empty
	.word	0x8143c000	! t0_kref+0x2ec4:   	stbar
1:	.word	0xabb5ccb4	! t0_kref+0x2ec8:   	fandnot2s	%f23, %f20, %f21
	.word	0xb5a58858	! t0_kref+0x2ecc:   	faddd	%f22, %f24, %f26
	.word	0xa6f68016	! t0_kref+0x2ed0:   	udivcc	%i2, %l6, %l3
	.word	0xdf00a008	! t0_kref+0x2ed4:   	ld	[%g2 + 8], %f15
	.word	0xa5a488d2	! t0_kref+0x2ed8:   	fsubd	%f18, %f18, %f18
	.word	0x25800004	! t0_kref+0x2edc:   	fblg,a	_kref+0x2eec
	.word	0xa1a00550	! t0_kref+0x2ee0:   	fsqrtd	%f16, %f16
	.word	0x90f03be7	! t0_kref+0x2ee4:   	udivcc	%g0, -0x419, %o0
	.word	0xbda00550	! t0_kref+0x2ee8:   	fsqrtd	%f16, %f30
	.word	0xab400000	! t0_kref+0x2eec:   	mov	%y, %l5
	.word	0xa9a0191c	! t0_kref+0x2ef0:   	fitod	%f28, %f20
	.word	0x90728017	! t0_kref+0x2ef4:   	udiv	%o2, %l7, %o0
	.word	0xd64e401a	! t0_kref+0x2ef8:   	ldsb	[%i1 + %i2], %o3
	.word	0x903a7656	! t0_kref+0x2efc:   	xnor	%o1, -0x9aa, %o0
	.word	0xc0260000	! t0_kref+0x2f00:   	clr	[%i0]
	.word	0xd62e7ffb	! t0_kref+0x2f04:   	stb	%o3, [%i1 - 5]
	.word	0xa61de23c	! t0_kref+0x2f08:   	xor	%l7, 0x23c, %l3
	.word	0x8115f6e6	! t0_kref+0x2f0c:   	taddcctv	%l7, -0x91a, %g0
	.word	0x9a920008	! t0_kref+0x2f10:   	orcc	%o0, %o0, %o5
	.word	0xef26401c	! t0_kref+0x2f14:   	st	%f23, [%i1 + %i4]
	.word	0x99b68d40	! t0_kref+0x2f18:   	fnot1	%f26, %f12
	.word	0xa8134017	! t0_kref+0x2f1c:   	or	%o5, %l7, %l4
	.word	0xd640a03c	! t0_kref+0x2f20:   	ldsw	[%g2 + 0x3c], %o3
	.word	0xaf2d8009	! t0_kref+0x2f24:   	sll	%l6, %o1, %l7
	.word	0xf207bfe0	! t0_kref+0x2f28:   	ld	[%fp - 0x20], %i1
	.word	0x94fd6692	! t0_kref+0x2f2c:   	sdivcc	%l5, 0x692, %o2
	.word	0x901a800d	! t0_kref+0x2f30:   	xor	%o2, %o5, %o0
	.word	0xf4280019	! t0_kref+0x2f34:   	stb	%i2, [%g0 + %i1]
	.word	0xe9be1816	! t0_kref+0x2f38:   	stda	%f20, [%i0 + %l6]0xc0
	.word	0xbbb34d60	! t0_kref+0x2f3c:   	fnot1s	%f13, %f29
	.word	0xaaa2eeab	! t0_kref+0x2f40:   	subcc	%o3, 0xeab, %l5
	.word	0x2d800001	! t0_kref+0x2f44:   	fbg,a	_kref+0x2f48
	.word	0xc07e7fe4	! t0_kref+0x2f48:   	swap	[%i1 - 0x1c], %g0
	.word	0xf430a02e	! t0_kref+0x2f4c:   	sth	%i2, [%g2 + 0x2e]
	.word	0x3d800006	! t0_kref+0x2f50:   	fbule,a	_kref+0x2f68
	.word	0xd6c61000	! t0_kref+0x2f54:   	ldswa	[%i0]0x80, %o3
	.word	0xb5a38d33	! t0_kref+0x2f58:   	fsmuld	%f14, %f19, %f26
	.word	0xd91e3fe0	! t0_kref+0x2f5c:   	ldd	[%i0 - 0x20], %f12
	.word	0xb1a308cc	! t0_kref+0x2f60:   	fsubd	%f12, %f12, %f24
	.word	0x81dac009	! t0_kref+0x2f64:   	flush	%o3 + %o1
	.word	0x83c06d54	! t0_kref+0x2f68:   	jmpl	%g1 + 0xd54, %g1
	.word	0x99a01a54	! t0_kref+0x2f6c:   	fdtoi	%f20, %f12
	.word	0xc807bfec	! t0_kref+0x2f70:   	ld	[%fp - 0x14], %g4
	.word	0xec1e6010	! t0_kref+0x2f74:   	ldd	[%i1 + 0x10], %l6
	.word	0xe7260000	! t0_kref+0x2f78:   	st	%f19, [%i0]
	.word	0x9140c000	! t0_kref+0x2f7c:   	mov	%asi, %o0
	.word	0xa9a408ac	! t0_kref+0x2f80:   	fsubs	%f16, %f12, %f20
	.word	0xada01a3e	! t0_kref+0x2f84:   	fstoi	%f30, %f22
	.word	0xb9b3462e	! t0_kref+0x2f88:   	fmul8x16	%f13, %f14, %f28
	.word	0xb5a409d8	! t0_kref+0x2f8c:   	fdivd	%f16, %f24, %f26
	.word	0x29480004	! t0_kref+0x2f90:   	fbl,a,pt	%fcc0, _kref+0x2fa0
	.word	0xae2d6744	! t0_kref+0x2f94:   	andn	%l5, 0x744, %l7
	.word	0x28800006	! t0_kref+0x2f98:   	bleu,a	_kref+0x2fb0
	.word	0x9665b358	! t0_kref+0x2f9c:   	subc	%l6, -0xca8, %o3
	.word	0x99a6885e	! t0_kref+0x2fa0:   	faddd	%f26, %f30, %f12
	.word	0x3a480005	! t0_kref+0x2fa4:   	bcc,a,pt	%icc, _kref+0x2fb8
	.word	0xb5a018da	! t0_kref+0x2fa8:   	fdtos	%f26, %f26
	.word	0x81af8a2f	! t0_kref+0x2fac:   	fcmps	%fcc0, %f30, %f15
	.word	0x9170000b	! t0_kref+0x2fb0:   	popc	%o3, %o0
	call	SYM(t0_subr3)
	.word	0xc12e2008	! t0_kref+0x2fb8:   	st	%fsr, [%i0 + 8]
	.word	0xa49d6412	! t0_kref+0x2fbc:   	xorcc	%l5, 0x412, %l2
	.word	0xa8f5c000	! t0_kref+0x2fc0:   	udivcc	%l7, %g0, %l4
	.word	0xab02401a	! t0_kref+0x2fc4:   	taddcc	%o1, %i2, %l5
	.word	0x9e9d800b	! t0_kref+0x2fc8:   	xorcc	%l6, %o3, %o7
	.word	0x99b605da	! t0_kref+0x2fcc:   	fcmpeq32	%f24, %f26, %o4
	.word	0xa9a00558	! t0_kref+0x2fd0:   	fsqrtd	%f24, %f20
	.word	0xae258009	! t0_kref+0x2fd4:   	sub	%l6, %o1, %l7
	.word	0xf9063ffc	! t0_kref+0x2fd8:   	ld	[%i0 - 4], %f28
	.word	0x93024008	! t0_kref+0x2fdc:   	taddcc	%o1, %o0, %o1
	.word	0xd448a013	! t0_kref+0x2fe0:   	ldsb	[%g2 + 0x13], %o2
	.word	0xd078a014	! t0_kref+0x2fe4:   	swap	[%g2 + 0x14], %o0
	.word	0xc000a020	! t0_kref+0x2fe8:   	ld	[%g2 + 0x20], %g0
	.word	0xaa934015	! t0_kref+0x2fec:   	orcc	%o5, %l5, %l5
	.word	0xee262008	! t0_kref+0x2ff0:   	st	%l7, [%i0 + 8]
	.word	0xa5a6cd3a	! t0_kref+0x2ff4:   	fsmuld	%f27, %f26, %f18
	.word	0x9db40670	! t0_kref+0x2ff8:   	fmul8x16au	%f16, %f16, %f14
	.word	0x9fc00004	! t0_kref+0x2ffc:   	call	%g0 + %g4
	.word	0x90803134	! t0_kref+0x3000:   	addcc	%g0, -0xecc, %o0
	.word	0x39800004	! t0_kref+0x3004:   	fbuge,a	_kref+0x3014
	.word	0xa49a782f	! t0_kref+0x3008:   	xorcc	%o1, -0x7d1, %l2
	.word	0xec3f4018	! t0_kref+0x300c:   	std	%l6, [%i5 + %i0]
	.word	0x8143c000	! t0_kref+0x3010:   	stbar
	.word	0xada0055e	! t0_kref+0x3014:   	fsqrtd	%f30, %f22
	.word	0x99b50d40	! t0_kref+0x3018:   	fnot1	%f20, %f12
	.word	0x920dc000	! t0_kref+0x301c:   	and	%l7, %g0, %o1
	.word	0x90f2c009	! t0_kref+0x3020:   	udivcc	%o3, %o1, %o0
	.word	0x37800008	! t0_kref+0x3024:   	fbge,a	_kref+0x3044
	.word	0x8143c000	! t0_kref+0x3028:   	stbar
	.word	0x94e2e091	! t0_kref+0x302c:   	subccc	%o3, 0x91, %o2
	.word	0xa80a731a	! t0_kref+0x3030:   	and	%o1, -0xce6, %l4
	.word	0xb1a488b6	! t0_kref+0x3034:   	fsubs	%f18, %f22, %f24
	.word	0x99b70d40	! t0_kref+0x3038:   	fnot1	%f28, %f12
	.word	0xaada000c	! t0_kref+0x303c:   	smulcc	%o0, %o4, %l5
	.word	0x2e480008	! t0_kref+0x3040:   	bvs,a,pt	%icc, _kref+0x3060
	.word	0x96f28016	! t0_kref+0x3044:   	udivcc	%o2, %l6, %o3
	.word	0xea563fe8	! t0_kref+0x3048:   	ldsh	[%i0 - 0x18], %l5
	.word	0xa6fac00a	! t0_kref+0x304c:   	sdivcc	%o3, %o2, %l3
	.word	0x38800008	! t0_kref+0x3050:   	bgu,a	_kref+0x3070
	.word	0x97b20240	! t0_kref+0x3054:   	array16	%o0, %g0, %o3
	.word	0xd200a028	! t0_kref+0x3058:   	ld	[%g2 + 0x28], %o1
	.word	0x9ba00039	! t0_kref+0x305c:   	fmovs	%f25, %f13
	.word	0x8185c000	! t0_kref+0x3060:   	wr	%l7, %g0, %y
	.word	0xb1a309d2	! t0_kref+0x3064:   	fdivd	%f12, %f18, %f24
	.word	0xda08a016	! t0_kref+0x3068:   	ldub	[%g2 + 0x16], %o5
	.word	0x3a480001	! t0_kref+0x306c:   	bcc,a,pt	%icc, _kref+0x3070
	.word	0x81dfa4ba	! t0_kref+0x3070:   	flush	%fp + 0x4ba
	.word	0x39800004	! t0_kref+0x3074:   	fbuge,a	_kref+0x3084
	.word	0x8143c000	! t0_kref+0x3078:   	stbar
	.word	0x99a8005a	! t0_kref+0x307c:   	fmovdn	%fcc0, %f26, %f12
	.word	0x9da00035	! t0_kref+0x3080:   	fmovs	%f21, %f14
	.word	0x8185c000	! t0_kref+0x3084:   	wr	%l7, %g0, %y
	.word	0xa9b486da	! t0_kref+0x3088:   	fmul8sux16	%f18, %f26, %f20
	.word	0x30480006	! t0_kref+0x308c:   	ba,a,pt	%icc, _kref+0x30a4
	.word	0x81580000	! t0_kref+0x3090:   	flushw
	.word	0xb1a01937	! t0_kref+0x3094:   	fstod	%f23, %f24
	.word	0x99a60836	! t0_kref+0x3098:   	fadds	%f24, %f22, %f12
	.word	0xa5a000ce	! t0_kref+0x309c:   	fnegd	%f14, %f18
	.word	0xe4780019	! t0_kref+0x30a0:   	swap	[%g0 + %i1], %l2
	.word	0x95b6816c	! t0_kref+0x30a4:   	edge32ln	%i2, %o4, %o2
	.word	0xe406001c	! t0_kref+0x30a8:   	ld	[%i0 + %i4], %l2
	.word	0x32480007	! t0_kref+0x30ac:   	bne,a,pt	%icc, _kref+0x30c8
	.word	0xed1fbcf0	! t0_kref+0x30b0:   	ldd	[%fp - 0x310], %f22
	.word	0xbda40d37	! t0_kref+0x30b4:   	fsmuld	%f16, %f23, %f30
	.word	0x9a32000d	! t0_kref+0x30b8:   	orn	%o0, %o5, %o5
	.word	0xafa308b9	! t0_kref+0x30bc:   	fsubs	%f12, %f25, %f23
	.word	0xec1e401d	! t0_kref+0x30c0:   	ldd	[%i1 + %i5], %l6
	.word	0xc0280019	! t0_kref+0x30c4:   	clrb	[%g0 + %i1]
	.word	0x98d5e8db	! t0_kref+0x30c8:   	umulcc	%l7, 0x8db, %o4
	.word	0xc0280018	! t0_kref+0x30cc:   	clrb	[%g0 + %i0]
	.word	0xa7a000b8	! t0_kref+0x30d0:   	fnegs	%f24, %f19
	.word	0xa623401a	! t0_kref+0x30d4:   	sub	%o5, %i2, %l3
	.word	0x81ad0a58	! t0_kref+0x30d8:   	fcmpd	%fcc0, %f20, %f24
	.word	0xd87e4000	! t0_kref+0x30dc:   	swap	[%i1], %o4
	.word	0xd01e2018	! t0_kref+0x30e0:   	ldd	[%i0 + 0x18], %o0
	.word	0x3d800002	! t0_kref+0x30e4:   	fbule,a	_kref+0x30ec
	.word	0xb9b30e80	! t0_kref+0x30e8:   	fsrc1	%f12, %f28
	.word	0x80820016	! t0_kref+0x30ec:   	addcc	%o0, %l6, %g0
	.word	0xae1a0000	! t0_kref+0x30f0:   	xor	%o0, %g0, %l7
	.word	0xee28a000	! t0_kref+0x30f4:   	stb	%l7, [%g2]
	.word	0x912ae011	! t0_kref+0x30f8:   	sll	%o3, 0x11, %o0
	.word	0xb5a00550	! t0_kref+0x30fc:   	fsqrtd	%f16, %f26
	.word	0xb9b40e80	! t0_kref+0x3100:   	fsrc1	%f16, %f28
	.word	0xb1a0012e	! t0_kref+0x3104:   	fabss	%f14, %f24
	.word	0xa1a01116	! t0_kref+0x3108:   	fxtod	%f22, %f16
	.word	0x3f480004	! t0_kref+0x310c:   	fbo,a,pt	%fcc0, _kref+0x311c
	.word	0xa7b5855a	! t0_kref+0x3110:   	fcmpeq16	%f22, %f26, %l3
	.word	0xa9b78596	! t0_kref+0x3114:   	fcmpgt32	%f30, %f22, %l4
	.word	0x96b30000	! t0_kref+0x3118:   	orncc	%o4, %g0, %o3
	.word	0x9e636315	! t0_kref+0x311c:   	subc	%o5, 0x315, %o7
	.word	0x81868000	! t0_kref+0x3120:   	wr	%i2, %g0, %y
	.word	0xbbb38a7a	! t0_kref+0x3124:   	fpadd32s	%f14, %f26, %f29
	.word	0xadb487ce	! t0_kref+0x3128:   	pdist	%f18, %f14, %f22
	.word	0xd2c71018	! t0_kref+0x312c:   	ldswa	[%i4 + %i0]0x80, %o1
	.word	0xaba708ba	! t0_kref+0x3130:   	fsubs	%f28, %f26, %f21
	.word	0x83414000	! t0_kref+0x3134:   	mov	%pc, %g1
	.word	0x9540c000	! t0_kref+0x3138:   	mov	%asi, %o2
	.word	0xa5b00c00	! t0_kref+0x313c:   	fzero	%f18
	.word	0xf53e7ff8	! t0_kref+0x3140:   	std	%f26, [%i1 - 8]
	.word	0xe1be5808	! t0_kref+0x3144:   	stda	%f16, [%i1 + %o0]0xc0
	.word	0xd05f4018	! t0_kref+0x3148:   	ldx	[%i5 + %i0], %o0
	.word	0x81de4008	! t0_kref+0x314c:   	flush	%i1 + %o0
	.word	0xda68a005	! t0_kref+0x3150:   	ldstub	[%g2 + 5], %o5
	.word	0xadb70e12	! t0_kref+0x3154:   	fand	%f28, %f18, %f22
	.word	0xe320a024	! t0_kref+0x3158:   	st	%f17, [%g2 + 0x24]
	.word	0xe81e4000	! t0_kref+0x315c:   	ldd	[%i1], %l4
	.word	0x95b20036	! t0_kref+0x3160:   	edge8n	%o0, %l6, %o2
	.word	0x81adca2f	! t0_kref+0x3164:   	fcmps	%fcc0, %f23, %f15
	.word	0x81ae0a5e	! t0_kref+0x3168:   	fcmpd	%fcc0, %f24, %f30
	.word	0xb9a44d30	! t0_kref+0x316c:   	fsmuld	%f17, %f16, %f28
	.word	0xd228a01e	! t0_kref+0x3170:   	stb	%o1, [%g2 + 0x1e]
	.word	0xa9b70d10	! t0_kref+0x3174:   	fandnot1	%f28, %f16, %f20
	.word	0x80d02ba2	! t0_kref+0x3178:   	umulcc	%g0, 0xba2, %g0
	.word	0xd4c01018	! t0_kref+0x317c:   	ldswa	[%g0 + %i0]0x80, %o2
	.word	0x9afd6486	! t0_kref+0x3180:   	sdivcc	%l5, 0x486, %o5
	.word	0x96728017	! t0_kref+0x3184:   	udiv	%o2, %l7, %o3
	.word	0xa7b58ef3	! t0_kref+0x3188:   	fornot2s	%f22, %f19, %f19
	.word	0x38800003	! t0_kref+0x318c:   	bgu,a	_kref+0x3198
	.word	0xa1a0188f	! t0_kref+0x3190:   	fitos	%f15, %f16
	.word	0xec4e3ff4	! t0_kref+0x3194:   	ldsb	[%i0 - 0xc], %l6
	.word	0xec563ff2	! t0_kref+0x3198:   	ldsh	[%i0 - 0xe], %l6
	.word	0xb5a0193a	! t0_kref+0x319c:   	fstod	%f26, %f26
	.word	0xf42e401a	! t0_kref+0x31a0:   	stb	%i2, [%i1 + %i2]
	.word	0x96e26f1e	! t0_kref+0x31a4:   	subccc	%o1, 0xf1e, %o3
	.word	0x9e0dc009	! t0_kref+0x31a8:   	and	%l7, %o1, %o7
	.word	0x38800005	! t0_kref+0x31ac:   	bgu,a	_kref+0x31c0
	.word	0x9823401a	! t0_kref+0x31b0:   	sub	%o5, %i2, %o4
	.word	0xaaa56376	! t0_kref+0x31b4:   	subcc	%l5, 0x376, %l5
	.word	0xec20a03c	! t0_kref+0x31b8:   	st	%l6, [%g2 + 0x3c]
	.word	0x2b800002	! t0_kref+0x31bc:   	fbug,a	_kref+0x31c4
	.word	0x1f00b67e	! t0_kref+0x31c0:   	sethi	%hi(0x2d9f800), %o7
	.word	0xa5a01912	! t0_kref+0x31c4:   	fitod	%f18, %f18
	.word	0xf51e3fe0	! t0_kref+0x31c8:   	ldd	[%i0 - 0x20], %f26
	.word	0x26480003	! t0_kref+0x31cc:   	bl,a,pt	%icc, _kref+0x31d8
	.word	0x150bf8d0	! t0_kref+0x31d0:   	sethi	%hi(0x2fe34000), %o2
	.word	0xea28a027	! t0_kref+0x31d4:   	stb	%l5, [%g2 + 0x27]
	.word	0xacf37da8	! t0_kref+0x31d8:   	udivcc	%o5, -0x258, %l6
	.word	0xe6560000	! t0_kref+0x31dc:   	ldsh	[%i0], %l3
	.word	0xeb68a00c	! t0_kref+0x31e0:   	prefetch	%g2 + 0xc, 21
	.word	0xb1b00fe0	! t0_kref+0x31e4:   	fones	%f24
	.word	0x2f800007	! t0_kref+0x31e8:   	fbu,a	_kref+0x3204
	.word	0xa5b705dc	! t0_kref+0x31ec:   	fcmpeq32	%f28, %f28, %l2
	.word	0x99a0192e	! t0_kref+0x31f0:   	fstod	%f14, %f12
	.word	0xd600a008	! t0_kref+0x31f4:   	ld	[%g2 + 8], %o3
	.word	0x932a4009	! t0_kref+0x31f8:   	sll	%o1, %o1, %o1
	.word	0xd250a024	! t0_kref+0x31fc:   	ldsh	[%g2 + 0x24], %o1
	.word	0x3a800007	! t0_kref+0x3200:   	bcc,a	_kref+0x321c
	.word	0xabb3ccaf	! t0_kref+0x3204:   	fandnot2s	%f15, %f15, %f21
	.word	0x2c800002	! t0_kref+0x3208:   	bneg,a	_kref+0x3210
	.word	0xde060000	! t0_kref+0x320c:   	ld	[%i0], %o7
	.word	0xed9e101d	! t0_kref+0x3210:   	ldda	[%i0 + %i5]0x80, %f22
	.word	0xae733855	! t0_kref+0x3214:   	udiv	%o4, -0x7ab, %l7
	.word	0x941d7c13	! t0_kref+0x3218:   	xor	%l5, -0x3ed, %o2
	.word	0xd2267fec	! t0_kref+0x321c:   	st	%o1, [%i1 - 0x14]
	.word	0xecbe5000	! t0_kref+0x3220:   	stda	%l6, [%i1]0x80
	.word	0x962a8009	! t0_kref+0x3224:   	andn	%o2, %o1, %o3
	.word	0x2d800006	! t0_kref+0x3228:   	fbg,a	_kref+0x3240
	.word	0x99b64c6f	! t0_kref+0x322c:   	fnors	%f25, %f15, %f12
	.word	0x22800002	! t0_kref+0x3230:   	be,a	_kref+0x3238
	.word	0x81dbf13c	! t0_kref+0x3234:   	flush	%o7 - 0xec4
	.word	0x989576df	! t0_kref+0x3238:   	orcc	%l5, -0x921, %o4
	.word	0x30800003	! t0_kref+0x323c:   	ba,a	_kref+0x3248
	.word	0xa4254008	! t0_kref+0x3240:   	sub	%l5, %o0, %l2
	.word	0xd230a02c	! t0_kref+0x3244:   	sth	%o1, [%g2 + 0x2c]
	.word	0xa5a0053c	! t0_kref+0x3248:   	fsqrts	%f28, %f18
	.word	0xad268008	! t0_kref+0x324c:   	mulscc	%i2, %o0, %l6
	.word	0xe8186438	! t0_kref+0x3250:   	ldd	[%g1 + 0x438], %l4
	.word	0xda2e0000	! t0_kref+0x3254:   	stb	%o5, [%i0]
	.word	0x9db68f5a	! t0_kref+0x3258:   	fornot1	%f26, %f26, %f14
	.word	0xab226726	! t0_kref+0x325c:   	mulscc	%o1, 0x726, %l5
	.word	0x9b326003	! t0_kref+0x3260:   	srl	%o1, 0x3, %o5
	.word	0xf91e3ff8	! t0_kref+0x3264:   	ldd	[%i0 - 8], %f28
	.word	0xb1b68e80	! t0_kref+0x3268:   	fsrc1	%f26, %f24
	.word	0xb5a00531	! t0_kref+0x326c:   	fsqrts	%f17, %f26
	.word	0xada4492c	! t0_kref+0x3270:   	fmuls	%f17, %f12, %f22
	.word	0xae5a0008	! t0_kref+0x3274:   	smul	%o0, %o0, %l7
	call	SYM(t0_subr1)
	.word	0x96e2aa75	! t0_kref+0x327c:   	subccc	%o2, 0xa75, %o3
	.word	0x011af88a	! t0_kref+0x3280:   	sethi	%hi(0x6be22800), %g0
	.word	0x3d480003	! t0_kref+0x3284:   	fbule,a,pt	%fcc0, _kref+0x3290
	.word	0xab1e800c	! t0_kref+0x3288:   	tsubcctv	%i2, %o4, %l5
	.word	0xa9b00cdc	! t0_kref+0x328c:   	fnot2	%f28, %f20
	.word	0xa9b00fe0	! t0_kref+0x3290:   	fones	%f20
	.word	0x8143c000	! t0_kref+0x3294:   	stbar
	.word	0x925dc015	! t0_kref+0x3298:   	smul	%l7, %l5, %o1
	.word	0x81da401f	! t0_kref+0x329c:   	flush	%o1 + %i7
	.word	0xb1a00530	! t0_kref+0x32a0:   	fsqrts	%f16, %f24
	.word	0x9ba348b0	! t0_kref+0x32a4:   	fsubs	%f13, %f16, %f13
	.word	0x3a480001	! t0_kref+0x32a8:   	bcc,a,pt	%icc, _kref+0x32ac
	.word	0xa7b5c280	! t0_kref+0x32ac:   	array32	%l7, %g0, %l3
	.word	0xadb78f56	! t0_kref+0x32b0:   	fornot1	%f30, %f22, %f22
	.word	0x9fc00004	! t0_kref+0x32b4:   	call	%g0 + %g4
	.word	0x81854000	! t0_kref+0x32b8:   	wr	%l5, %g0, %y
	.word	0xdbf65015	! t0_kref+0x32bc:   	casxa	[%i1]0x80, %l5, %o5
	.word	0xa4326593	! t0_kref+0x32c0:   	orn	%o1, 0x593, %l2
	.word	0x2a800007	! t0_kref+0x32c4:   	bcs,a	_kref+0x32e0
	.word	0xa6120009	! t0_kref+0x32c8:   	or	%o0, %o1, %l3
	.word	0x9da50d3a	! t0_kref+0x32cc:   	fsmuld	%f20, %f26, %f14
	.word	0x9fa308b1	! t0_kref+0x32d0:   	fsubs	%f12, %f17, %f15
	.word	0x01361053	! t0_kref+0x32d4:   	sethi	%hi(0xd8414c00), %g0
	.word	0xc768a009	! t0_kref+0x32d8:   	prefetch	%g2 + 9, 3
	.word	0xa7400000	! t0_kref+0x32dc:   	mov	%y, %l3
	.word	0x8065b5c7	! t0_kref+0x32e0:   	subc	%l6, -0xa39, %g0
	.word	0xe168a084	! t0_kref+0x32e4:   	prefetch	%g2 + 0x84, 16
	.word	0x9de3bfa0	! t0_kref+0x32e8:   	save	%sp, -0x60, %sp
	.word	0xb6b77c98	! t0_kref+0x32ec:   	orncc	%i5, -0x368, %i3
	.word	0xadee001c	! t0_kref+0x32f0:   	restore	%i0, %i4, %l6
	.word	0xadb38e80	! t0_kref+0x32f4:   	fsrc1	%f14, %f22
	.word	0x98a5800b	! t0_kref+0x32f8:   	subcc	%l6, %o3, %o4
	call	SYM(t0_subr1)
	.word	0xa89eb980	! t0_kref+0x3300:   	xorcc	%i2, -0x680, %l4
	.word	0xa5a000dc	! t0_kref+0x3304:   	fnegd	%f28, %f18
	.word	0x99a01a31	! t0_kref+0x3308:   	fstoi	%f17, %f12
	.word	0xee4e001a	! t0_kref+0x330c:   	ldsb	[%i0 + %i2], %l7
	.word	0xed68a00e	! t0_kref+0x3310:   	prefetch	%g2 + 0xe, 22
	.word	0xaa630017	! t0_kref+0x3314:   	subc	%o4, %l7, %l5
	.word	0xf42e001a	! t0_kref+0x3318:   	stb	%i2, [%i0 + %i2]
	.word	0x9262800b	! t0_kref+0x331c:   	subc	%o2, %o3, %o1
	.word	0xa1a4c82d	! t0_kref+0x3320:   	fadds	%f19, %f13, %f16
	.word	0x9e228000	! t0_kref+0x3324:   	sub	%o2, %g0, %o7
	.word	0xbba01a52	! t0_kref+0x3328:   	fdtoi	%f18, %f29
	.word	0xee064000	! t0_kref+0x332c:   	ld	[%i1], %l7
	.word	0xd4200018	! t0_kref+0x3330:   	st	%o2, [%g0 + %i0]
	.word	0xaf23400d	! t0_kref+0x3334:   	mulscc	%o5, %o5, %l7
	.word	0xb5a4483e	! t0_kref+0x3338:   	fadds	%f17, %f30, %f26
	.word	0x96f576d4	! t0_kref+0x333c:   	udivcc	%l5, -0x92c, %o3
	.word	0xea300018	! t0_kref+0x3340:   	sth	%l5, [%g0 + %i0]
	.word	0x9bb38d60	! t0_kref+0x3344:   	fnot1s	%f14, %f13
	.word	0xa5a58d3d	! t0_kref+0x3348:   	fsmuld	%f22, %f29, %f18
	.word	0x2e480006	! t0_kref+0x334c:   	bvs,a,pt	%icc, _kref+0x3364
	.word	0xa783400d	! t0_kref+0x3350:   	wr	%o5, %o5, %gsr
	.word	0xc568a08c	! t0_kref+0x3354:   	prefetch	%g2 + 0x8c, 2
	.word	0x95328015	! t0_kref+0x3358:   	srl	%o2, %l5, %o2
	.word	0x3a800007	! t0_kref+0x335c:   	bcc,a	_kref+0x3378
	.word	0x9fb00336	! t0_kref+0x3360:   	bmask	%g0, %l6, %o7
	.word	0xdb00a028	! t0_kref+0x3364:   	ld	[%g2 + 0x28], %f13
	.word	0x809b779b	! t0_kref+0x3368:   	xorcc	%o5, -0x865, %g0
	.word	0xc0ae9018	! t0_kref+0x336c:   	stba	%g0, [%i2 + %i0]0x80
	.word	0x81af4a2f	! t0_kref+0x3370:   	fcmps	%fcc0, %f29, %f15
	.word	0xa61dfca3	! t0_kref+0x3374:   	xor	%l7, -0x35d, %l3
	.word	0xa92a6007	! t0_kref+0x3378:   	sll	%o1, 0x7, %l4
	.word	0xd84e3fec	! t0_kref+0x337c:   	ldsb	[%i0 - 0x14], %o4
	.word	0x81dd800e	! t0_kref+0x3380:   	flush	%l6 + %sp
	.word	0xb9b58e80	! t0_kref+0x3384:   	fsrc1	%f22, %f28
	.word	0x9fc00004	! t0_kref+0x3388:   	call	%g0 + %g4
	.word	0xf3801019	! t0_kref+0x338c:   	lda	[%g0 + %i1]0x80, %f25
	.word	0xf4270019	! t0_kref+0x3390:   	st	%i2, [%i4 + %i1]
	.word	0xd906401c	! t0_kref+0x3394:   	ld	[%i1 + %i4], %f12
	.word	0x99a409d0	! t0_kref+0x3398:   	fdivd	%f16, %f16, %f12
	.word	0x9b223cc3	! t0_kref+0x339c:   	mulscc	%o0, -0x33d, %o5
	.word	0xc807bff0	! t0_kref+0x33a0:   	ld	[%fp - 0x10], %g4
	.word	0x8143c000	! t0_kref+0x33a4:   	stbar
	.word	0xe41f4018	! t0_kref+0x33a8:   	ldd	[%i5 + %i0], %l2
	.word	0xac0d8017	! t0_kref+0x33ac:   	and	%l6, %l7, %l6
	.word	0xaba01a31	! t0_kref+0x33b0:   	fstoi	%f17, %f21
	.word	0xb9a6483c	! t0_kref+0x33b4:   	fadds	%f25, %f28, %f28
	.word	0x98730015	! t0_kref+0x33b8:   	udiv	%o4, %l5, %o4
	.word	0xe91e2008	! t0_kref+0x33bc:   	ldd	[%i0 + 8], %f20
	.word	0xc248382c	! t0_kref+0x33c0:   	ldsb	[%g0 - 0x7d4], %g1
	.word	0x24480003	! t0_kref+0x33c4:   	ble,a,pt	%icc, _kref+0x33d0
	.word	0x9a2dc00b	! t0_kref+0x33c8:   	andn	%l7, %o3, %o5
	.word	0xa5b48e80	! t0_kref+0x33cc:   	fsrc1	%f18, %f18
	.word	0xa9b68518	! t0_kref+0x33d0:   	fcmpgt16	%f26, %f24, %l4
	.word	0x1f22b068	! t0_kref+0x33d4:   	sethi	%hi(0x8ac1a000), %o7
	.word	0x9fc00004	! t0_kref+0x33d8:   	call	%g0 + %g4
	.word	0x972de01f	! t0_kref+0x33dc:   	sll	%l7, 0x1f, %o3
	.word	0xe59f5018	! t0_kref+0x33e0:   	ldda	[%i5 + %i0]0x80, %f18
	.word	0x81868000	! t0_kref+0x33e4:   	wr	%i2, %g0, %y
	.word	0x97b58200	! t0_kref+0x33e8:   	array8	%l6, %g0, %o3
	.word	0xd450a032	! t0_kref+0x33ec:   	ldsh	[%g2 + 0x32], %o2
	.word	0xed067fe8	! t0_kref+0x33f0:   	ld	[%i1 - 0x18], %f22
	.word	0x99b40e1c	! t0_kref+0x33f4:   	fand	%f16, %f28, %f12
	.word	0xac82af99	! t0_kref+0x33f8:   	addcc	%o2, 0xf99, %l6
	.word	0xbdb00cce	! t0_kref+0x33fc:   	fnot2	%f14, %f30
	.word	0xc0c6501c	! t0_kref+0x3400:   	ldswa	[%i1 + %i4]0x80, %g0
	.word	0xf430a036	! t0_kref+0x3404:   	sth	%i2, [%g2 + 0x36]
	.word	0xb1b00f1a	! t0_kref+0x3408:   	fsrc2	%f26, %f24
	.word	0x8143c000	! t0_kref+0x340c:   	stbar
	.word	0xb1b00cdc	! t0_kref+0x3410:   	fnot2	%f28, %f24
	.word	0x99a00554	! t0_kref+0x3414:   	fsqrtd	%f20, %f12
	.word	0x9875ecab	! t0_kref+0x3418:   	udiv	%l7, 0xcab, %o4
	.word	0xa9b680aa	! t0_kref+0x341c:   	edge16n	%i2, %o2, %l4
	.word	0x2a480006	! t0_kref+0x3420:   	bcs,a,pt	%icc, _kref+0x3438
	.word	0xd9e65008	! t0_kref+0x3424:   	casa	[%i1]0x80, %o0, %o4
	.word	0x99b38edc	! t0_kref+0x3428:   	fornot2	%f14, %f28, %f12
	.word	0xec68a00d	! t0_kref+0x342c:   	ldstub	[%g2 + 0xd], %l6
	.word	0x8143c000	! t0_kref+0x3430:   	stbar
	.word	0xa9a308da	! t0_kref+0x3434:   	fsubd	%f12, %f26, %f20
	.word	0xb5a000af	! t0_kref+0x3438:   	fnegs	%f15, %f26
	.word	0x9f30000a	! t0_kref+0x343c:   	srl	%g0, %o2, %o7
	.word	0x9fc00004	! t0_kref+0x3440:   	call	%g0 + %g4
	.word	0xedee101b	! t0_kref+0x3444:   	prefetcha	%i0 + %i3, 22
	.word	0xa7a01a34	! t0_kref+0x3448:   	fstoi	%f20, %f19
	.word	0xe3200019	! t0_kref+0x344c:   	st	%f17, [%g0 + %i1]
	.word	0xe81f4018	! t0_kref+0x3450:   	ldd	[%i5 + %i0], %l4
	.word	0x9a75fc4d	! t0_kref+0x3454:   	udiv	%l7, -0x3b3, %o5
	.word	0xafb00117	! t0_kref+0x3458:   	edge32	%g0, %l7, %l7
	.word	0xead6d018	! t0_kref+0x345c:   	ldsha	[%i3 + %i0]0x80, %l5
	.word	0x30800001	! t0_kref+0x3460:   	ba,a	_kref+0x3464
	.word	0x982b6e39	! t0_kref+0x3464:   	andn	%o5, 0xe39, %o4
	.word	0xee4e8018	! t0_kref+0x3468:   	ldsb	[%i2 + %i0], %l7
	.word	0xe76e3ff8	! t0_kref+0x346c:   	prefetch	%i0 - 8, 19
	.word	0x9fb3030b	! t0_kref+0x3470:   	alignaddr	%o4, %o3, %o7
	.word	0xbba0188d	! t0_kref+0x3474:   	fitos	%f13, %f29
	.word	0xe8562012	! t0_kref+0x3478:   	ldsh	[%i0 + 0x12], %l4
	.word	0xd630a028	! t0_kref+0x347c:   	sth	%o3, [%g2 + 0x28]
	.word	0xdda61000	! t0_kref+0x3480:   	sta	%f14, [%i0]0x80
	.word	0x932ea01d	! t0_kref+0x3484:   	sll	%i2, 0x1d, %o1
	.word	0xaa724000	! t0_kref+0x3488:   	udiv	%o1, %g0, %l5
	.word	0x81abca30	! t0_kref+0x348c:   	fcmps	%fcc0, %f15, %f16
	.word	0xa8b2e4c7	! t0_kref+0x3490:   	orncc	%o3, 0x4c7, %l4
	.word	0xaa5b6518	! t0_kref+0x3494:   	smul	%o5, 0x518, %l5
	.word	0xf42e401a	! t0_kref+0x3498:   	stb	%i2, [%i1 + %i2]
	.word	0x81af0acc	! t0_kref+0x349c:   	fcmped	%fcc0, %f28, %f12
	.word	0xa6932226	! t0_kref+0x34a0:   	orcc	%o4, 0x226, %l3
	.word	0xa6b80015	! t0_kref+0x34a4:   	xnorcc	%g0, %l5, %l3
	.word	0x8143c000	! t0_kref+0x34a8:   	stbar
	.word	0x91400000	! t0_kref+0x34ac:   	mov	%y, %o0
	.word	0x2b224e5e	! t0_kref+0x34b0:   	sethi	%hi(0x89397800), %l5
	.word	0x9ee561b3	! t0_kref+0x34b4:   	subccc	%l5, 0x1b3, %o7
	.word	0xa5400000	! t0_kref+0x34b8:   	mov	%y, %l2
	.word	0x2e800002	! t0_kref+0x34bc:   	bvs,a	_kref+0x34c4
	.word	0xc0263ff0	! t0_kref+0x34c0:   	clr	[%i0 - 0x10]
	.word	0x9132e018	! t0_kref+0x34c4:   	srl	%o3, 0x18, %o0
	.word	0xb5a01933	! t0_kref+0x34c8:   	fstod	%f19, %f26
	.word	0xa9b50a96	! t0_kref+0x34cc:   	fpsub16	%f20, %f22, %f20
	.word	0xa6b8000b	! t0_kref+0x34d0:   	xnorcc	%g0, %o3, %l3
	.word	0xd428a03a	! t0_kref+0x34d4:   	stb	%o2, [%g2 + 0x3a]
	.word	0xc851401b	! t0_kref+0x34d8:   	ldsh	[%g5 + %i3], %g4
	.word	0xa9128008	! t0_kref+0x34dc:   	taddcctv	%o2, %o0, %l4
	.word	0x81ad0a54	! t0_kref+0x34e0:   	fcmpd	%fcc0, %f20, %f20
	.word	0xf51e4000	! t0_kref+0x34e4:   	ldd	[%i1], %f26
	.word	0xee200018	! t0_kref+0x34e8:   	st	%l7, [%g0 + %i0]
	.word	0x99b5400d	! t0_kref+0x34ec:   	edge8	%l5, %o5, %o4
	.word	0xadb50d2e	! t0_kref+0x34f0:   	fandnot1s	%f20, %f14, %f22
	.word	0x9e657cef	! t0_kref+0x34f4:   	subc	%l5, -0x311, %o7
	.word	0x9de3bfa0	! t0_kref+0x34f8:   	save	%sp, -0x60, %sp
	.word	0x95ef0019	! t0_kref+0x34fc:   	restore	%i4, %i1, %o2
	.word	0xd8267ff8	! t0_kref+0x3500:   	st	%o4, [%i1 - 8]
	.word	0x945eb4f8	! t0_kref+0x3504:   	smul	%i2, -0xb08, %o2
	.word	0xd02e001a	! t0_kref+0x3508:   	stb	%o0, [%i0 + %i2]
	.word	0xb5a6c8af	! t0_kref+0x350c:   	fsubs	%f27, %f15, %f26
	.word	0xec4e3ff0	! t0_kref+0x3510:   	ldsb	[%i0 - 0x10], %l6
	call	SYM(t0_subr1)
	.word	0x9db30dcc	! t0_kref+0x3518:   	fnand	%f12, %f12, %f14
	.word	0xe41e3ff0	! t0_kref+0x351c:   	ldd	[%i0 - 0x10], %l2
	.word	0xa5b304dc	! t0_kref+0x3520:   	fcmpne32	%f12, %f28, %l2
	.word	0xaa72000a	! t0_kref+0x3524:   	udiv	%o0, %o2, %l5
	.word	0x2f480006	! t0_kref+0x3528:   	fbu,a,pt	%fcc0, _kref+0x3540
	.word	0x80bdc000	! t0_kref+0x352c:   	xnorcc	%l7, %g0, %g0
	.word	0x81df0004	! t0_kref+0x3530:   	flush	%i4 + %g4
	.word	0x9855e879	! t0_kref+0x3534:   	umul	%l7, 0x879, %o4
	.word	0xd428a00f	! t0_kref+0x3538:   	stb	%o2, [%g2 + 0xf]
	.word	0xd9070019	! t0_kref+0x353c:   	ld	[%i4 + %i1], %f12
	.word	0xb1a0052d	! t0_kref+0x3540:   	fsqrts	%f13, %f24
	.word	0x9a32c00b	! t0_kref+0x3544:   	orn	%o3, %o3, %o5
	.word	0x8143c000	! t0_kref+0x3548:   	stbar
	.word	0x39800003	! t0_kref+0x354c:   	fbuge,a	_kref+0x3558
	.word	0xd630a02e	! t0_kref+0x3550:   	sth	%o3, [%g2 + 0x2e]
	.word	0x929a8009	! t0_kref+0x3554:   	xorcc	%o2, %o1, %o1
	.word	0xae70001a	! t0_kref+0x3558:   	udiv	%g0, %i2, %l7
	.word	0xea564000	! t0_kref+0x355c:   	ldsh	[%i1], %l5
	.word	0xc0200018	! t0_kref+0x3560:   	clr	[%g0 + %i0]
	.word	0x97b5c057	! t0_kref+0x3564:   	edge8l	%l7, %l7, %o3
	.word	0xe968a084	! t0_kref+0x3568:   	prefetch	%g2 + 0x84, 20
	.word	0xada01917	! t0_kref+0x356c:   	fitod	%f23, %f22
	.word	0xe4480019	! t0_kref+0x3570:   	ldsb	[%g0 + %i1], %l2
	.word	0x90f02a71	! t0_kref+0x3574:   	udivcc	%g0, 0xa71, %o0
	.word	0xf7ee501a	! t0_kref+0x3578:   	prefetcha	%i1 + %i2, 27
	.word	0xd24e0000	! t0_kref+0x357c:   	ldsb	[%i0], %o1
	.word	0x9fb4859e	! t0_kref+0x3580:   	fcmpgt32	%f18, %f30, %o7
	.word	0xa1a0191b	! t0_kref+0x3584:   	fitod	%f27, %f16
	.word	0xa5a01a32	! t0_kref+0x3588:   	fstoi	%f18, %f18
	.word	0x9b32e002	! t0_kref+0x358c:   	srl	%o3, 0x2, %o5
	.word	0x3a480005	! t0_kref+0x3590:   	bcc,a,pt	%icc, _kref+0x35a4
	.word	0xac0de7e0	! t0_kref+0x3594:   	and	%l7, 0x7e0, %l6
	.word	0xe656001b	! t0_kref+0x3598:   	ldsh	[%i0 + %i3], %l3
	.word	0xa6f37e4d	! t0_kref+0x359c:   	udivcc	%o5, -0x1b3, %l3
	.word	0xd4562002	! t0_kref+0x35a0:   	ldsh	[%i0 + 2], %o2
	.word	0xec3e2018	! t0_kref+0x35a4:   	std	%l6, [%i0 + 0x18]
	.word	0xf51e6010	! t0_kref+0x35a8:   	ldd	[%i1 + 0x10], %f26
	.word	0xa6768017	! t0_kref+0x35ac:   	udiv	%i2, %l7, %l3
	.word	0xb7a0189d	! t0_kref+0x35b0:   	fitos	%f29, %f27
	.word	0x81dbc01f	! t0_kref+0x35b4:   	flush	%o7 + %i7
	.word	0xec1e4000	! t0_kref+0x35b8:   	ldd	[%i1], %l6
	.word	0xa3b4cef8	! t0_kref+0x35bc:   	fornot2s	%f19, %f24, %f17
	.word	0xb9a6884c	! t0_kref+0x35c0:   	faddd	%f26, %f12, %f28
	.word	0xa9a689ce	! t0_kref+0x35c4:   	fdivd	%f26, %f14, %f20
	.word	0x170b72fb	! t0_kref+0x35c8:   	sethi	%hi(0x2dcbec00), %o3
	.word	0xada0055a	! t0_kref+0x35cc:   	fsqrtd	%f26, %f22
	.word	0x3d480006	! t0_kref+0x35d0:   	fbule,a,pt	%fcc0, _kref+0x35e8
	.word	0xd4c6101c	! t0_kref+0x35d4:   	ldswa	[%i0 + %i4]0x80, %o2
	.word	0xa6d54015	! t0_kref+0x35d8:   	umulcc	%l5, %l5, %l3
	.word	0x2d480008	! t0_kref+0x35dc:   	fbg,a,pt	%fcc0, _kref+0x35fc
	.word	0xa5a9c04e	! t0_kref+0x35e0:   	fmovdu	%fcc0, %f14, %f18
	.word	0x34480003	! t0_kref+0x35e4:   	bg,a,pt	%icc, _kref+0x35f0
	.word	0x93b58200	! t0_kref+0x35e8:   	array8	%l6, %g0, %o1
	.word	0x37800005	! t0_kref+0x35ec:   	fbge,a	_kref+0x3600
	.word	0xed1e001d	! t0_kref+0x35f0:   	ldd	[%i0 + %i5], %f22
	.word	0x81ad8adc	! t0_kref+0x35f4:   	fcmped	%fcc0, %f22, %f28
	.word	0x91b785d2	! t0_kref+0x35f8:   	fcmpeq32	%f30, %f18, %o0
	.word	0x95257b25	! t0_kref+0x35fc:   	mulscc	%l5, -0x4db, %o2
	.word	0xd900a018	! t0_kref+0x3600:   	ld	[%g2 + 0x18], %f12
	.word	0x3e800008	! t0_kref+0x3604:   	bvc,a	_kref+0x3624
	.word	0xe6480019	! t0_kref+0x3608:   	ldsb	[%g0 + %i1], %l3
	.word	0xa5a70858	! t0_kref+0x360c:   	faddd	%f28, %f24, %f18
	.word	0xf4f01018	! t0_kref+0x3610:   	stxa	%i2, [%g0 + %i0]0x80
	.word	0xa1a01930	! t0_kref+0x3614:   	fstod	%f16, %f16
	.word	0x36480005	! t0_kref+0x3618:   	bge,a,pt	%icc, _kref+0x362c
	.word	0xf326001c	! t0_kref+0x361c:   	st	%f25, [%i0 + %i4]
	.word	0x9fa000bd	! t0_kref+0x3620:   	fnegs	%f29, %f15
	.word	0xb1a509dc	! t0_kref+0x3624:   	fdivd	%f20, %f28, %f24
	.word	0xada01933	! t0_kref+0x3628:   	fstod	%f19, %f22
	.word	0x9db68a96	! t0_kref+0x362c:   	fpsub16	%f26, %f22, %f14
	.word	0x98657a2b	! t0_kref+0x3630:   	subc	%l5, -0x5d5, %o4
	.word	0xada0055c	! t0_kref+0x3634:   	fsqrtd	%f28, %f22
	.word	0x95227ee6	! t0_kref+0x3638:   	mulscc	%o1, -0x11a, %o2
	.word	0x90aa0015	! t0_kref+0x363c:   	andncc	%o0, %l5, %o0
	.word	0x81adca36	! t0_kref+0x3640:   	fcmps	%fcc0, %f23, %f22
	.word	0xda580018	! t0_kref+0x3644:   	ldx	[%g0 + %i0], %o5
	.word	0xbda48d30	! t0_kref+0x3648:   	fsmuld	%f18, %f16, %f30
	.word	0xeeee5000	! t0_kref+0x364c:   	ldstuba	[%i1]0x80, %l7
	.word	0xbda7482d	! t0_kref+0x3650:   	fadds	%f29, %f13, %f30
	.word	0xd256c019	! t0_kref+0x3654:   	ldsh	[%i3 + %i1], %o1
	.word	0x9e006528	! t0_kref+0x3658:   	add	%g1, 0x528, %o7
!	.word	0x3e4e1a66	! t0_kref+0x365c:   	bvc,a,pt	%icc, SYM(t0_subr2)
	   	bvc,a,pt	%icc, SYM(t0_subr2)
	.word	0xb7a00032	! t0_kref+0x3660:   	fmovs	%f18, %f27
	.word	0x37800002	! t0_kref+0x3664:   	fbge,a	_kref+0x366c
	.word	0xe440a014	! t0_kref+0x3668:   	ldsw	[%g2 + 0x14], %l2
	.word	0x9db00cd4	! t0_kref+0x366c:   	fnot2	%f20, %f14
	.word	0xa7220008	! t0_kref+0x3670:   	mulscc	%o0, %o0, %l3
	.word	0x9de3bfa0	! t0_kref+0x3674:   	save	%sp, -0x60, %sp
	.word	0xb10f0019	! t0_kref+0x3678:   	tsubcc	%i4, %i1, %i0
	.word	0x81e80000	! t0_kref+0x367c:   	restore
	.word	0x31800004	! t0_kref+0x3680:   	fba,a	_kref+0x3690
	.word	0x92920017	! t0_kref+0x3684:   	orcc	%o0, %l7, %o1
	.word	0xa675400b	! t0_kref+0x3688:   	udiv	%l5, %o3, %l3
	.word	0x28480001	! t0_kref+0x368c:   	bleu,a,pt	%icc, _kref+0x3690
	.word	0x93203760	! t0_kref+0x3690:   	mulscc	%g0, -0x8a0, %o1
	.word	0xd900a034	! t0_kref+0x3694:   	ld	[%g2 + 0x34], %f12
	.word	0xc0000019	! t0_kref+0x3698:   	ld	[%g0 + %i1], %g0
	.word	0x81228016	! t0_kref+0x369c:   	mulscc	%o2, %l6, %g0
	.word	0x9f414000	! t0_kref+0x36a0:   	mov	%pc, %o7
	.word	0xa435400a	! t0_kref+0x36a4:   	orn	%l5, %o2, %l2
	.word	0xa4aa800a	! t0_kref+0x36a8:   	andncc	%o2, %o2, %l2
	.word	0x98c5400b	! t0_kref+0x36ac:   	addccc	%l5, %o3, %o4
	.word	0xb3b00fe0	! t0_kref+0x36b0:   	fones	%f25
	.word	0x95228009	! t0_kref+0x36b4:   	mulscc	%o2, %o1, %o2
	.word	0xd628a02c	! t0_kref+0x36b8:   	stb	%o3, [%g2 + 0x2c]
	.word	0xa82a3abb	! t0_kref+0x36bc:   	andn	%o0, -0x545, %l4
	.word	0xaa52687d	! t0_kref+0x36c0:   	umul	%o1, 0x87d, %l5
	.word	0xec3e401d	! t0_kref+0x36c4:   	std	%l6, [%i1 + %i5]
	.word	0xada018da	! t0_kref+0x36c8:   	fdtos	%f26, %f22
	.word	0xea4e200b	! t0_kref+0x36cc:   	ldsb	[%i0 + 0xb], %l5
	.word	0xe3270018	! t0_kref+0x36d0:   	st	%f17, [%i4 + %i0]
	.word	0xa1a00552	! t0_kref+0x36d4:   	fsqrtd	%f18, %f16
	.word	0x801d652c	! t0_kref+0x36d8:   	xor	%l5, 0x52c, %g0
	.word	0x99a388dc	! t0_kref+0x36dc:   	fsubd	%f14, %f28, %f12
	.word	0x81854000	! t0_kref+0x36e0:   	wr	%l5, %g0, %y
	.word	0x808d7045	! t0_kref+0x36e4:   	btst	0xfffff045, %l5
	.word	0xea280018	! t0_kref+0x36e8:   	stb	%l5, [%g0 + %i0]
	.word	0xa9b5c01a	! t0_kref+0x36ec:   	edge8	%l7, %i2, %l4
	.word	0x91400000	! t0_kref+0x36f0:   	mov	%y, %o0
	.word	0xa1a0190e	! t0_kref+0x36f4:   	fitod	%f14, %f16
	.word	0x9de3bfa0	! t0_kref+0x36f8:   	save	%sp, -0x60, %sp
	.word	0x9bef3618	! t0_kref+0x36fc:   	restore	%i4, -0x9e8, %o5
	.word	0xaf22400c	! t0_kref+0x3700:   	mulscc	%o1, %o4, %l7
	.word	0xa8700009	! t0_kref+0x3704:   	udiv	%g0, %o1, %l4
	.word	0xa9b685d2	! t0_kref+0x3708:   	fcmpeq32	%f26, %f18, %l4
	.word	0xb7a01a38	! t0_kref+0x370c:   	fstoi	%f24, %f27
	.word	0xac1a400b	! t0_kref+0x3710:   	xor	%o1, %o3, %l6
	.word	0x81aeca3a	! t0_kref+0x3714:   	fcmps	%fcc0, %f27, %f26
	.word	0xa1a0191c	! t0_kref+0x3718:   	fitod	%f28, %f16
	.word	0x92daf31f	! t0_kref+0x371c:   	smulcc	%o3, -0xce1, %o1
	.word	0xc020a00c	! t0_kref+0x3720:   	clr	[%g2 + 0xc]
	.word	0xd8ce101a	! t0_kref+0x3724:   	ldsba	[%i0 + %i2]0x80, %o4
	.word	0xb5a01891	! t0_kref+0x3728:   	fitos	%f17, %f26
	.word	0xa5a40835	! t0_kref+0x372c:   	fadds	%f16, %f21, %f18
	.word	0xa5b3430d	! t0_kref+0x3730:   	alignaddr	%o5, %o5, %l2
	.word	0xe406200c	! t0_kref+0x3734:   	ld	[%i0 + 0xc], %l2
	.word	0xd8463ff4	! t0_kref+0x3738:   	ldsw	[%i0 - 0xc], %o4
	.word	0x9e1a2cca	! t0_kref+0x373c:   	xor	%o0, 0xcca, %o7
	.word	0x92182bd9	! t0_kref+0x3740:   	xor	%g0, 0xbd9, %o1
	.word	0xaaadbfb9	! t0_kref+0x3744:   	andncc	%l6, -0x47, %l5
	.word	0x9e66b4be	! t0_kref+0x3748:   	subc	%i2, -0xb42, %o7
	.word	0x8582fe7b	! t0_kref+0x374c:   	wr	%o3, 0xfffffe7b, %ccr
	.word	0x9fa01a36	! t0_kref+0x3750:   	fstoi	%f22, %f15
	.word	0xd810a006	! t0_kref+0x3754:   	lduh	[%g2 + 6], %o4
	.word	0x92132a1e	! t0_kref+0x3758:   	or	%o4, 0xa1e, %o1
	.word	0xeb68a00a	! t0_kref+0x375c:   	prefetch	%g2 + 0xa, 21
	.word	0x9aba800a	! t0_kref+0x3760:   	xnorcc	%o2, %o2, %o5
	.word	0xa1a00531	! t0_kref+0x3764:   	fsqrts	%f17, %f16
	.word	0xb3a018d8	! t0_kref+0x3768:   	fdtos	%f24, %f25
	.word	0x94f265d2	! t0_kref+0x376c:   	udivcc	%o1, 0x5d2, %o2
	.word	0x9db386fe	! t0_kref+0x3770:   	fmul8ulx16	%f14, %f30, %f14
	.word	0x9fb34008	! t0_kref+0x3774:   	edge8	%o5, %o0, %o7
	.word	0x9e15a448	! t0_kref+0x3778:   	or	%l6, 0x448, %o7
	.word	0x99b60c58	! t0_kref+0x377c:   	fnor	%f24, %f24, %f12
	.word	0xa1b00c00	! t0_kref+0x3780:   	fzero	%f16
	.word	0x99a01916	! t0_kref+0x3784:   	fitod	%f22, %f12
	.word	0xb5a709d8	! t0_kref+0x3788:   	fdivd	%f28, %f24, %f26
	.word	0xfb267ff0	! t0_kref+0x378c:   	st	%f29, [%i1 - 0x10]
	.word	0xd42e2002	! t0_kref+0x3790:   	stb	%o2, [%i0 + 2]
	.word	0x8143c000	! t0_kref+0x3794:   	stbar
	.word	0x2b1f99fc	! t0_kref+0x3798:   	sethi	%hi(0x7e67f000), %l5
	.word	0x812e800d	! t0_kref+0x379c:   	sll	%i2, %o5, %g0
	.word	0xada00531	! t0_kref+0x37a0:   	fsqrts	%f17, %f22
	.word	0x81dd0000	! t0_kref+0x37a4:   	flush	%l4
	.word	0xa5a01a34	! t0_kref+0x37a8:   	fstoi	%f20, %f18
	.word	0x38800002	! t0_kref+0x37ac:   	bgu,a	_kref+0x37b4
	.word	0xd8200018	! t0_kref+0x37b0:   	st	%o4, [%g0 + %i0]
	.word	0xee28a01b	! t0_kref+0x37b4:   	stb	%l7, [%g2 + 0x1b]
	.word	0xe848a02a	! t0_kref+0x37b8:   	ldsb	[%g2 + 0x2a], %l4
	.word	0x9bb34309	! t0_kref+0x37bc:   	alignaddr	%o5, %o1, %o5
	.word	0xaab2aa2f	! t0_kref+0x37c0:   	orncc	%o2, 0xa2f, %l5
	.word	0xa1a489ce	! t0_kref+0x37c4:   	fdivd	%f18, %f14, %f16
	.word	0x3a480008	! t0_kref+0x37c8:   	bcc,a,pt	%icc, _kref+0x37e8
	.word	0xa8d20015	! t0_kref+0x37cc:   	umulcc	%o0, %l5, %l4
	.word	0xd86e6003	! t0_kref+0x37d0:   	ldstub	[%i1 + 3], %o4
	.word	0xee500018	! t0_kref+0x37d4:   	ldsh	[%g0 + %i0], %l7
	.word	0xf1be1817	! t0_kref+0x37d8:   	stda	%f24, [%i0 + %l7]0xc0
	.word	0xbdb6cc78	! t0_kref+0x37dc:   	fnors	%f27, %f24, %f30
	.word	0xec6e6008	! t0_kref+0x37e0:   	ldstub	[%i1 + 8], %l6
	.word	0xed26401c	! t0_kref+0x37e4:   	st	%f22, [%i1 + %i4]
	.word	0xd856c019	! t0_kref+0x37e8:   	ldsh	[%i3 + %i1], %o4
	.word	0xa1ab0058	! t0_kref+0x37ec:   	fmovduge	%fcc0, %f24, %f16
	.word	0xb9a018d6	! t0_kref+0x37f0:   	fdtos	%f22, %f28
	.word	0x962afe37	! t0_kref+0x37f4:   	andn	%o3, -0x1c9, %o3
	.word	0xde063fe8	! t0_kref+0x37f8:   	ld	[%i0 - 0x18], %o7
	.word	0x940a000a	! t0_kref+0x37fc:   	and	%o0, %o2, %o2
	.word	0xf1be584b	! t0_kref+0x3800:   	stda	%f24, [%i1 + %o3]0xc2
	.word	0x81834000	! t0_kref+0x3804:   	wr	%o5, %g0, %y
	.word	0xbba018ce	! t0_kref+0x3808:   	fdtos	%f14, %f29
	.word	0x8143c000	! t0_kref+0x380c:   	stbar
	.word	0xee470019	! t0_kref+0x3810:   	ldsw	[%i4 + %i1], %l7
	.word	0xada0055a	! t0_kref+0x3814:   	fsqrtd	%f26, %f22
	.word	0x39480006	! t0_kref+0x3818:   	fbuge,a,pt	%fcc0, _kref+0x3830
	.word	0xaba01a35	! t0_kref+0x381c:   	fstoi	%f21, %f21
	.word	0x37800006	! t0_kref+0x3820:   	fbge,a	_kref+0x3838
	.word	0xa9b50dd6	! t0_kref+0x3824:   	fnand	%f20, %f22, %f20
	.word	0xe700a014	! t0_kref+0x3828:   	ld	[%g2 + 0x14], %f19
	.word	0x980b4017	! t0_kref+0x382c:   	and	%o5, %l7, %o4
	.word	0x9e72644d	! t0_kref+0x3830:   	udiv	%o1, 0x44d, %o7
	.word	0x90adeacc	! t0_kref+0x3834:   	andncc	%l7, 0xacc, %o0
	.word	0x81de4015	! t0_kref+0x3838:   	flush	%i1 + %l5
	.word	0xa9a01934	! t0_kref+0x383c:   	fstod	%f20, %f20
	.word	0x9802c00d	! t0_kref+0x3840:   	add	%o3, %o5, %o4
	.word	0xa85260aa	! t0_kref+0x3844:   	umul	%o1, 0xaa, %l4
	.word	0xd8a81018	! t0_kref+0x3848:   	stba	%o4, [%g0 + %i0]0x80
	.word	0xa7a01896	! t0_kref+0x384c:   	fitos	%f22, %f19
	.word	0x81ad8ade	! t0_kref+0x3850:   	fcmped	%fcc0, %f22, %f30
	.word	0x3a800003	! t0_kref+0x3854:   	bcc,a	_kref+0x3860
	.word	0xb9a0193a	! t0_kref+0x3858:   	fstod	%f26, %f28
	.word	0xb9b50abd	! t0_kref+0x385c:   	fpsub16s	%f20, %f29, %f28
	.word	0xbda000bb	! t0_kref+0x3860:   	fnegs	%f27, %f30
	.word	0x9452801a	! t0_kref+0x3864:   	umul	%o2, %i2, %o2
	.word	0xa1a78836	! t0_kref+0x3868:   	fadds	%f30, %f22, %f16
	.word	0x9126800a	! t0_kref+0x386c:   	mulscc	%i2, %o2, %o0
	.word	0x96d2c01a	! t0_kref+0x3870:   	umulcc	%o3, %i2, %o3
	.word	0x805ab23f	! t0_kref+0x3874:   	smul	%o2, -0xdc1, %g0
	.word	0x95b300ac	! t0_kref+0x3878:   	edge16n	%o4, %o4, %o2
	.word	0xa8d34016	! t0_kref+0x387c:   	umulcc	%o5, %l6, %l4
	.word	0x91100017	! t0_kref+0x3880:   	taddcctv	%g0, %l7, %o0
	.word	0xe96e401d	! t0_kref+0x3884:   	prefetch	%i1 + %i5, 20
	.word	0x9da01a58	! t0_kref+0x3888:   	fdtoi	%f24, %f14
	.word	0xb5b00ccc	! t0_kref+0x388c:   	fnot2	%f12, %f26
	.word	0xf500a00c	! t0_kref+0x3890:   	ld	[%g2 + 0xc], %f26
	.word	0x38480008	! t0_kref+0x3894:   	bgu,a,pt	%icc, _kref+0x38b4
	.word	0xee566014	! t0_kref+0x3898:   	ldsh	[%i1 + 0x14], %l7
	.word	0xd64e7ff5	! t0_kref+0x389c:   	ldsb	[%i1 - 0xb], %o3
	.word	0x948e800b	! t0_kref+0x38a0:   	andcc	%i2, %o3, %o2
	.word	0xee0e2007	! t0_kref+0x38a4:   	ldub	[%i0 + 7], %l7
	.word	0xafa6c833	! t0_kref+0x38a8:   	fadds	%f27, %f19, %f23
	.word	0x37480005	! t0_kref+0x38ac:   	fbge,a,pt	%fcc0, _kref+0x38c0
	.word	0x92d30000	! t0_kref+0x38b0:   	umulcc	%o4, %g0, %o1
	.word	0x9fa6083a	! t0_kref+0x38b4:   	fadds	%f24, %f26, %f15
	.word	0xf007bfe0	! t0_kref+0x38b8:   	ld	[%fp - 0x20], %i0
	.word	0xa1b40c58	! t0_kref+0x38bc:   	fnor	%f16, %f24, %f16
	.word	0x961ac008	! t0_kref+0x38c0:   	xor	%o3, %o0, %o3
	.word	0xa4e2c01a	! t0_kref+0x38c4:   	subccc	%o3, %i2, %l2
	.word	0x97b60554	! t0_kref+0x38c8:   	fcmpeq16	%f24, %f20, %o3
	.word	0x2a800003	! t0_kref+0x38cc:   	bcs,a	_kref+0x38d8
	.word	0xe4180019	! t0_kref+0x38d0:   	ldd	[%g0 + %i1], %l2
	.word	0x9fc10000	! t0_kref+0x38d4:   	call	%g4
	.word	0x80fb0015	! t0_kref+0x38d8:   	sdivcc	%o4, %l5, %g0
	.word	0xa7b54176	! t0_kref+0x38dc:   	edge32ln	%l5, %l6, %l3
	.word	0xa7b30a70	! t0_kref+0x38e0:   	fpadd32s	%f12, %f16, %f19
	.word	0xa5a01931	! t0_kref+0x38e4:   	fstod	%f17, %f18
	.word	0xae2dc01a	! t0_kref+0x38e8:   	andn	%l7, %i2, %l7
	.word	0xda20a020	! t0_kref+0x38ec:   	st	%o5, [%g2 + 0x20]
	.word	0x908de74d	! t0_kref+0x38f0:   	andcc	%l7, 0x74d, %o0
	.word	0xc5ee100b	! t0_kref+0x38f4:   	prefetcha	%i0 + %o3, 2
	.word	0xb3a018d2	! t0_kref+0x38f8:   	fdtos	%f18, %f25
	.word	0xe610a02e	! t0_kref+0x38fc:   	lduh	[%g2 + 0x2e], %l3
	.word	0xd67e001c	! t0_kref+0x3900:   	swap	[%i0 + %i4], %o3
	.word	0x81580000	! t0_kref+0x3904:   	flushw
	.word	0x81abca30	! t0_kref+0x3908:   	fcmps	%fcc0, %f15, %f16
	.word	0xee48a02b	! t0_kref+0x390c:   	ldsb	[%g2 + 0x2b], %l7
	.word	0xeb00a03c	! t0_kref+0x3910:   	ld	[%g2 + 0x3c], %f21
	.word	0x97b5417a	! t0_kref+0x3914:   	edge32ln	%l5, %i2, %o3
	.word	0xf3063fe8	! t0_kref+0x3918:   	ld	[%i0 - 0x18], %f25
	.word	0xe91e6008	! t0_kref+0x391c:   	ldd	[%i1 + 8], %f20
	.word	0xde40a004	! t0_kref+0x3920:   	ldsw	[%g2 + 4], %o7
	.word	0x2d800004	! t0_kref+0x3924:   	fbg,a	_kref+0x3934
	.word	0x9bb0001a	! t0_kref+0x3928:   	edge8	%g0, %i2, %o5
	.word	0xe968a004	! t0_kref+0x392c:   	prefetch	%g2 + 4, 20
	.word	0x9f414000	! t0_kref+0x3930:   	mov	%pc, %o7
	.word	0xa5a5083a	! t0_kref+0x3934:   	fadds	%f20, %f26, %f18
	.word	0xd84e4000	! t0_kref+0x3938:   	ldsb	[%i1], %o4
	.word	0xb5a0191d	! t0_kref+0x393c:   	fitod	%f29, %f26
	.word	0x90633c7c	! t0_kref+0x3940:   	subc	%o4, -0x384, %o0
	.word	0x9f2579fd	! t0_kref+0x3944:   	mulscc	%l5, -0x603, %o7
	.word	0x962e8000	! t0_kref+0x3948:   	andn	%i2, %g0, %o3
	.word	0x81dde94e	! t0_kref+0x394c:   	flush	%l7 + 0x94e
	.word	0x81dc7209	! t0_kref+0x3950:   	flush	%l1 - 0xdf7
	.word	0xa52e8017	! t0_kref+0x3954:   	sll	%i2, %l7, %l2
	.word	0xa1b78c96	! t0_kref+0x3958:   	fandnot2	%f30, %f22, %f16
	.word	0xd428a03c	! t0_kref+0x395c:   	stb	%o2, [%g2 + 0x3c]
	.word	0xae623428	! t0_kref+0x3960:   	subc	%o0, -0xbd8, %l7
	.word	0x90bac000	! t0_kref+0x3964:   	xnorcc	%o3, %g0, %o0
	.word	0x2d800008	! t0_kref+0x3968:   	fbg,a	_kref+0x3988
	.word	0xe6c01019	! t0_kref+0x396c:   	ldswa	[%g0 + %i1]0x80, %l3
	.word	0xa40e8016	! t0_kref+0x3970:   	and	%i2, %l6, %l2
	.word	0x81ac0a5c	! t0_kref+0x3974:   	fcmpd	%fcc0, %f16, %f28
	.word	0xb9a01917	! t0_kref+0x3978:   	fitod	%f23, %f28
	.word	0xadb00cdc	! t0_kref+0x397c:   	fnot2	%f28, %f22
	.word	0xd448a004	! t0_kref+0x3980:   	ldsb	[%g2 + 4], %o2
	.word	0xc368a002	! t0_kref+0x3984:   	prefetch	%g2 + 2, 1
	.word	0xb7b00cf6	! t0_kref+0x3988:   	fnot2s	%f22, %f27
	.word	0xc028a013	! t0_kref+0x398c:   	clrb	[%g2 + 0x13]
	.word	0xb5a0013b	! t0_kref+0x3990:   	fabss	%f27, %f26
	.word	0x20800006	! t0_kref+0x3994:   	bn,a	_kref+0x39ac
	.word	0x94c6a45a	! t0_kref+0x3998:   	addccc	%i2, 0x45a, %o2
	.word	0xa7b48d3d	! t0_kref+0x399c:   	fandnot1s	%f18, %f29, %f19
	.word	0xa52a8016	! t0_kref+0x39a0:   	sll	%o2, %l6, %l2
	.word	0xd8d6101b	! t0_kref+0x39a4:   	ldsha	[%i0 + %i3]0x80, %o4
	.word	0x9fb00c20	! t0_kref+0x39a8:   	fzeros	%f15
	.word	0xbdb44a37	! t0_kref+0x39ac:   	fpadd16s	%f17, %f23, %f30
	.word	0xa5b70719	! t0_kref+0x39b0:   	fmuld8sux16	%f28, %f25, %f18
	.word	0x3c480002	! t0_kref+0x39b4:   	bpos,a,pt	%icc, _kref+0x39bc
	.word	0xc56e4009	! t0_kref+0x39b8:   	prefetch	%i1 + %o1, 2
	.word	0x8143c000	! t0_kref+0x39bc:   	stbar
	.word	0xa9a308d4	! t0_kref+0x39c0:   	fsubd	%f12, %f20, %f20
	.word	0xa3b4ca3a	! t0_kref+0x39c4:   	fpadd16s	%f19, %f26, %f17
	.word	0x9452ec44	! t0_kref+0x39c8:   	umul	%o3, 0xc44, %o2
	.word	0xd430a008	! t0_kref+0x39cc:   	sth	%o2, [%g2 + 8]
	.word	0x24480004	! t0_kref+0x39d0:   	ble,a,pt	%icc, _kref+0x39e0
	.word	0x99a0004e	! t0_kref+0x39d4:   	fmovd	%f14, %f12
	.word	0x96954015	! t0_kref+0x39d8:   	orcc	%l5, %l5, %o3
	.word	0xb5a58d36	! t0_kref+0x39dc:   	fsmuld	%f22, %f22, %f26
	.word	0xb9a00556	! t0_kref+0x39e0:   	fsqrtd	%f22, %f28
	.word	0x80f031dd	! t0_kref+0x39e4:   	udivcc	%g0, -0xe23, %g0
	.word	0x969ab3cf	! t0_kref+0x39e8:   	xorcc	%o2, -0xc31, %o3
	.word	0xea2e7fe1	! t0_kref+0x39ec:   	stb	%l5, [%i1 - 0x1f]
	.word	0xe83e6018	! t0_kref+0x39f0:   	std	%l4, [%i1 + 0x18]
	.word	0x96257701	! t0_kref+0x39f4:   	sub	%l5, -0x8ff, %o3
	.word	0x963db8dd	! t0_kref+0x39f8:   	xnor	%l6, -0x723, %o3
	.word	0x922d7a60	! t0_kref+0x39fc:   	andn	%l5, -0x5a0, %o1
	.word	0x81aeca3c	! t0_kref+0x3a00:   	fcmps	%fcc0, %f27, %f28
	.word	0x9695c016	! t0_kref+0x3a04:   	orcc	%l7, %l6, %o3
	.word	0xa85d800c	! t0_kref+0x3a08:   	smul	%l6, %o4, %l4
	.word	0xa62ebf14	! t0_kref+0x3a0c:   	andn	%i2, -0xec, %l3
	.word	0xb9b68ab7	! t0_kref+0x3a10:   	fpsub16s	%f26, %f23, %f28
	.word	0xa5a00530	! t0_kref+0x3a14:   	fsqrts	%f16, %f18
	.word	0xc807bfec	! t0_kref+0x3a18:   	ld	[%fp - 0x14], %g4
	.word	0x92834015	! t0_kref+0x3a1c:   	addcc	%o5, %l5, %o1
	.word	0xe8067fe8	! t0_kref+0x3a20:   	ld	[%i1 - 0x18], %l4
	.word	0x2f480001	! t0_kref+0x3a24:   	fbu,a,pt	%fcc0, _kref+0x3a28
	.word	0x01203627	! t0_kref+0x3a28:   	sethi	%hi(0x80d89c00), %g0
	.word	0x8170000b	! t0_kref+0x3a2c:   	popc	%o3, %g0
	.word	0x3d480001	! t0_kref+0x3a30:   	fbule,a,pt	%fcc0, _kref+0x3a34
	.word	0xafb50596	! t0_kref+0x3a34:   	fcmpgt32	%f20, %f22, %l7
	.word	0x99a01a54	! t0_kref+0x3a38:   	fdtoi	%f20, %f12
	.word	0x22800001	! t0_kref+0x3a3c:   	be,a	_kref+0x3a40
	.word	0xea26001c	! t0_kref+0x3a40:   	st	%l5, [%i0 + %i4]
	.word	0x9a0b4009	! t0_kref+0x3a44:   	and	%o5, %o1, %o5
	.word	0xd88e9019	! t0_kref+0x3a48:   	lduba	[%i2 + %i1]0x80, %o4
	.word	0xb1a0193c	! t0_kref+0x3a4c:   	fstod	%f28, %f24
	.word	0x9535c00a	! t0_kref+0x3a50:   	srl	%l7, %o2, %o2
	.word	0x92e68009	! t0_kref+0x3a54:   	subccc	%i2, %o1, %o1
	.word	0x807261ee	! t0_kref+0x3a58:   	udiv	%o1, 0x1ee, %g0
	.word	0xd808a014	! t0_kref+0x3a5c:   	ldub	[%g2 + 0x14], %o4
	.word	0xb9a0191d	! t0_kref+0x3a60:   	fitod	%f29, %f28
	.word	0xa9b40db5	! t0_kref+0x3a64:   	fxors	%f16, %f21, %f20
	.word	0xec1e7fe8	! t0_kref+0x3a68:   	ldd	[%i1 - 0x18], %l6
	.word	0x99a7085e	! t0_kref+0x3a6c:   	faddd	%f28, %f30, %f12
	.word	0x9b35a015	! t0_kref+0x3a70:   	srl	%l6, 0x15, %o5
	.word	0xa892adf1	! t0_kref+0x3a74:   	orcc	%o2, 0xdf1, %l4
	.word	0xa92b000b	! t0_kref+0x3a78:   	sll	%o4, %o3, %l4
	.word	0xab02f09c	! t0_kref+0x3a7c:   	taddcc	%o3, -0xf64, %l5
	.word	0xa1a0055e	! t0_kref+0x3a80:   	fsqrtd	%f30, %f16
	.word	0xa62e8016	! t0_kref+0x3a84:   	andn	%i2, %l6, %l3
	.word	0xb9a01935	! t0_kref+0x3a88:   	fstod	%f21, %f28
	.word	0x8143c000	! t0_kref+0x3a8c:   	stbar
	.word	0xada0192d	! t0_kref+0x3a90:   	fstod	%f13, %f22
	.word	0xe6d6d040	! t0_kref+0x3a94:   	ldsha	[%i3]0x82, %l3
	.word	0xfb063fe0	! t0_kref+0x3a98:   	ld	[%i0 - 0x20], %f29
	.word	0x9b2a2005	! t0_kref+0x3a9c:   	sll	%o0, 0x5, %o5
	.word	0x3e480006	! t0_kref+0x3aa0:   	bvc,a,pt	%icc, _kref+0x3ab8
	.word	0xd44e0000	! t0_kref+0x3aa4:   	ldsb	[%i0], %o2
	.word	0x98824009	! t0_kref+0x3aa8:   	addcc	%o1, %o1, %o4
	.word	0x001fffff	! t0_kref+0x3aac:   	illtrap	0x1fffff
	.word	0xde4e4000	! t0_kref+0x3ab0:   	ldsb	[%i1], %o7
	.word	0xa6758016	! t0_kref+0x3ab4:   	udiv	%l6, %l6, %l3
	.word	0x3c800007	! t0_kref+0x3ab8:   	bpos,a	_kref+0x3ad4
	.word	0xda30a018	! t0_kref+0x3abc:   	sth	%o5, [%g2 + 0x18]
	.word	0x9ba5c837	! t0_kref+0x3ac0:   	fadds	%f23, %f23, %f13
	.word	0x9472400d	! t0_kref+0x3ac4:   	udiv	%o1, %o5, %o2
	.word	0x81ad8a2c	! t0_kref+0x3ac8:   	fcmps	%fcc0, %f22, %f12
	.word	0x97b6848e	! t0_kref+0x3acc:   	fcmple32	%f26, %f14, %o3
	.word	0x90d30016	! t0_kref+0x3ad0:   	umulcc	%o4, %l6, %o0
	.word	0xac6338de	! t0_kref+0x3ad4:   	subc	%o4, -0x722, %l6
	.word	0xd848a02d	! t0_kref+0x3ad8:   	ldsb	[%g2 + 0x2d], %o4
	.word	0xf93e2018	! t0_kref+0x3adc:   	std	%f28, [%i0 + 0x18]
	call	1f
	.empty
	.word	0x92f27b1d	! t0_kref+0x3ae4:   	udivcc	%o1, -0x4e3, %o1
	.word	0xe4d01019	! t0_kref+0x3ae8:   	ldsha	[%g0 + %i1]0x80, %l2
	.word	0xe120a010	! t0_kref+0x3aec:   	st	%f16, [%g2 + 0x10]
	.word	0xabb64a3e	! t0_kref+0x3af0:   	fpadd16s	%f25, %f30, %f21
	.word	0x99b00ccc	! t0_kref+0x3af4:   	fnot2	%f12, %f12
	.word	0xae36b8c1	! t0_kref+0x3af8:   	orn	%i2, -0x73f, %l7
	.word	0xd630a012	! t0_kref+0x3afc:   	sth	%o3, [%g2 + 0x12]
	.word	0xa6aa000b	! t0_kref+0x3b00:   	andncc	%o0, %o3, %l3
1:	.word	0xa3b38ab0	! t0_kref+0x3b04:   	fpsub16s	%f14, %f16, %f17
	.word	0xb9a00556	! t0_kref+0x3b08:   	fsqrtd	%f22, %f28
	.word	0xa7b3cab5	! t0_kref+0x3b0c:   	fpsub16s	%f15, %f21, %f19
	.word	0x988b36ca	! t0_kref+0x3b10:   	andcc	%o4, -0x936, %o4
	.word	0xa8730017	! t0_kref+0x3b14:   	udiv	%o4, %l7, %l4
	.word	0xa6e5b4e4	! t0_kref+0x3b18:   	subccc	%l6, -0xb1c, %l3
	.word	0xafb484d8	! t0_kref+0x3b1c:   	fcmpne32	%f18, %f24, %l7
	.word	0x9935400d	! t0_kref+0x3b20:   	srl	%l5, %o5, %o4
	.word	0x8143c000	! t0_kref+0x3b24:   	stbar
	.word	0x968b4008	! t0_kref+0x3b28:   	andcc	%o5, %o0, %o3
	.word	0x3a800008	! t0_kref+0x3b2c:   	bcc,a	_kref+0x3b4c
	.word	0xb7b30ef7	! t0_kref+0x3b30:   	fornot2s	%f12, %f23, %f27
	.word	0xa9b586d0	! t0_kref+0x3b34:   	fmul8sux16	%f22, %f16, %f20
	.word	0x21800004	! t0_kref+0x3b38:   	fbn,a	_kref+0x3b48
	.word	0xadb0077c	! t0_kref+0x3b3c:   	fpack16	%f28, %f22
	.word	0xacf33c2d	! t0_kref+0x3b40:   	udivcc	%o4, -0x3d3, %l6
	.word	0xa452fce8	! t0_kref+0x3b44:   	umul	%o3, -0x318, %l2
	.word	0xbda018da	! t0_kref+0x3b48:   	fdtos	%f26, %f30
	.word	0xa1a0191e	! t0_kref+0x3b4c:   	fitod	%f30, %f16
	.word	0xf11e6008	! t0_kref+0x3b50:   	ldd	[%i1 + 8], %f24
	.word	0xa3b5cabe	! t0_kref+0x3b54:   	fpsub16s	%f23, %f30, %f17
	.word	0xa65ab86f	! t0_kref+0x3b58:   	smul	%o2, -0x791, %l3
	.word	0xbda0002d	! t0_kref+0x3b5c:   	fmovs	%f13, %f30
	.word	0x9af6b88e	! t0_kref+0x3b60:   	udivcc	%i2, -0x772, %o5
	.word	0x92d20015	! t0_kref+0x3b64:   	umulcc	%o0, %l5, %o1
	.word	0x81ac8a35	! t0_kref+0x3b68:   	fcmps	%fcc0, %f18, %f21
	.word	0xae9b0015	! t0_kref+0x3b6c:   	xorcc	%o4, %l5, %l7
	.word	0xd00e7fe4	! t0_kref+0x3b70:   	ldub	[%i1 - 0x1c], %o0
	.word	0xaa0dc017	! t0_kref+0x3b74:   	and	%l7, %l7, %l5
	.word	0x81b00200	! t0_kref+0x3b78:   	array8	%g0, %g0, %g0
	.word	0x8143c000	! t0_kref+0x3b7c:   	stbar
	.word	0x9e2d800b	! t0_kref+0x3b80:   	andn	%l6, %o3, %o7
	.word	0x9b2b6005	! t0_kref+0x3b84:   	sll	%o5, 0x5, %o5
	.word	0x81418000	! t0_kref+0x3b88:   	mov	%fprs, %g0
	.word	0x80f0000d	! t0_kref+0x3b8c:   	udivcc	%g0, %o5, %g0
	.word	0xde40a024	! t0_kref+0x3b90:   	ldsw	[%g2 + 0x24], %o7
	.word	0x8143e040	! t0_kref+0x3b94:   	membar	0x40
	.word	0x9da00554	! t0_kref+0x3b98:   	fsqrtd	%f20, %f14
	.word	0x95b4041a	! t0_kref+0x3b9c:   	fcmple16	%f16, %f26, %o2
	.word	0xd62e601b	! t0_kref+0x3ba0:   	stb	%o3, [%i1 + 0x1b]
	.word	0xd2a65000	! t0_kref+0x3ba4:   	sta	%o1, [%i1]0x80
	.word	0x9672800b	! t0_kref+0x3ba8:   	udiv	%o2, %o3, %o3
	.word	0xec10a000	! t0_kref+0x3bac:   	lduh	[%g2], %l6
	.word	0xa40da1dc	! t0_kref+0x3bb0:   	and	%l6, 0x1dc, %l2
	.word	0x35800002	! t0_kref+0x3bb4:   	fbue,a	_kref+0x3bbc
	.word	0xada0053d	! t0_kref+0x3bb8:   	fsqrts	%f29, %f22
	.word	0x9922000d	! t0_kref+0x3bbc:   	mulscc	%o0, %o5, %o4
	.word	0x35800001	! t0_kref+0x3bc0:   	fbue,a	_kref+0x3bc4
	.word	0xa7b605d0	! t0_kref+0x3bc4:   	fcmpeq32	%f24, %f16, %l3
	.word	0xa472f1fa	! t0_kref+0x3bc8:   	udiv	%o3, -0xe06, %l2
	.word	0x9322a219	! t0_kref+0x3bcc:   	mulscc	%o2, 0x219, %o1
	.word	0xada00558	! t0_kref+0x3bd0:   	fsqrtd	%f24, %f22
	.word	0x3d800007	! t0_kref+0x3bd4:   	fbule,a	_kref+0x3bf0
	.word	0xa62a8008	! t0_kref+0x3bd8:   	andn	%o2, %o0, %l3
	.word	0x969d400d	! t0_kref+0x3bdc:   	xorcc	%l5, %o5, %o3
	.word	0x3a800007	! t0_kref+0x3be0:   	bcc,a	_kref+0x3bfc
	.word	0x9bb34169	! t0_kref+0x3be4:   	edge32ln	%o5, %o1, %o5
	.word	0xa5a0190f	! t0_kref+0x3be8:   	fitod	%f15, %f18
	.word	0xfb267fe0	! t0_kref+0x3bec:   	st	%f29, [%i1 - 0x20]
	.word	0x001fffff	! t0_kref+0x3bf0:   	illtrap	0x1fffff
	.word	0xa4da800d	! t0_kref+0x3bf4:   	smulcc	%o2, %o5, %l2
	.word	0xac15ba58	! t0_kref+0x3bf8:   	or	%l6, -0x5a8, %l6
	.word	0xe1067fe4	! t0_kref+0x3bfc:   	ld	[%i1 - 0x1c], %f16
	.word	0x81db269c	! t0_kref+0x3c00:   	flush	%o4 + 0x69c
	.word	0xbda44d34	! t0_kref+0x3c04:   	fsmuld	%f17, %f20, %f30
	.word	0x81af0ada	! t0_kref+0x3c08:   	fcmped	%fcc0, %f28, %f26
	.word	0x81af4a38	! t0_kref+0x3c0c:   	fcmps	%fcc0, %f29, %f24
	.word	0x9bb4055a	! t0_kref+0x3c10:   	fcmpeq16	%f16, %f26, %o5
	.word	0x20800005	! t0_kref+0x3c14:   	bn,a	_kref+0x3c28
	.word	0xac75ff5a	! t0_kref+0x3c18:   	udiv	%l7, -0xa6, %l6
	.word	0xb7b50abb	! t0_kref+0x3c1c:   	fpsub16s	%f20, %f27, %f27
	.word	0xd428a024	! t0_kref+0x3c20:   	stb	%o2, [%g2 + 0x24]
	.word	0xec263ff8	! t0_kref+0x3c24:   	st	%l6, [%i0 - 8]
	.word	0xec000019	! t0_kref+0x3c28:   	ld	[%g0 + %i1], %l6
	.word	0xf5063fe8	! t0_kref+0x3c2c:   	ld	[%i0 - 0x18], %f26
	.word	0xa7828015	! t0_kref+0x3c30:   	wr	%o2, %l5, %gsr
	.word	0xa9b00fc0	! t0_kref+0x3c34:   	fone	%f20
	.word	0x99a708dc	! t0_kref+0x3c38:   	fsubd	%f28, %f28, %f12
	.word	0xa502800d	! t0_kref+0x3c3c:   	taddcc	%o2, %o5, %l2
	.word	0xadb30176	! t0_kref+0x3c40:   	edge32ln	%o4, %l6, %l6
	.word	0x99a00558	! t0_kref+0x3c44:   	fsqrtd	%f24, %f12
	.word	0xee000019	! t0_kref+0x3c48:   	ld	[%g0 + %i1], %l7
	.word	0x34800005	! t0_kref+0x3c4c:   	bg,a	_kref+0x3c60
	.word	0x93b58008	! t0_kref+0x3c50:   	edge8	%l6, %o0, %o1
	.word	0xabb504cc	! t0_kref+0x3c54:   	fcmpne32	%f20, %f12, %l5
	.word	0xacdb400a	! t0_kref+0x3c58:   	smulcc	%o5, %o2, %l6
	.word	0xe520a034	! t0_kref+0x3c5c:   	st	%f18, [%g2 + 0x34]
	.word	0x2b480004	! t0_kref+0x3c60:   	fbug,a,pt	%fcc0, _kref+0x3c70
	.word	0xa925401a	! t0_kref+0x3c64:   	mulscc	%l5, %i2, %l4
	.word	0xac76a3c4	! t0_kref+0x3c68:   	udiv	%i2, 0x3c4, %l6
	.word	0x81db4013	! t0_kref+0x3c6c:   	flush	%o5 + %l3
	.word	0xe07e001c	! t0_kref+0x3c70:   	swap	[%i0 + %i4], %l0
	.word	0x86102001	! t0_kref+0x3c74:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3c78:   	bne,a	_kref+0x3c78
	.word	0x86a0e001	! t0_kref+0x3c7c:   	subcc	%g3, 1, %g3
	.word	0xe8060000	! t0_kref+0x3c80:   	ld	[%i0], %l4
	.word	0x99b40e79	! t0_kref+0x3c84:   	fxnors	%f16, %f25, %f12
	.word	0xd6280019	! t0_kref+0x3c88:   	stb	%o3, [%g0 + %i1]
	.word	0xf520a004	! t0_kref+0x3c8c:   	st	%f26, [%g2 + 4]
	.word	0xa9b38db0	! t0_kref+0x3c90:   	fxors	%f14, %f16, %f20
	.word	0x99b38e5e	! t0_kref+0x3c94:   	fxnor	%f14, %f30, %f12
	.word	0xbdb00fc0	! t0_kref+0x3c98:   	fone	%f30
	.word	0xd830a02e	! t0_kref+0x3c9c:   	sth	%o4, [%g2 + 0x2e]
	.word	0x9252f58f	! t0_kref+0x3ca0:   	umul	%o3, -0xa71, %o1
	.word	0xe47e6014	! t0_kref+0x3ca4:   	swap	[%i1 + 0x14], %l2
	.word	0xb3a00532	! t0_kref+0x3ca8:   	fsqrts	%f18, %f25
	.word	0xe41e2010	! t0_kref+0x3cac:   	ldd	[%i0 + 0x10], %l2
	.word	0x9ef2000d	! t0_kref+0x3cb0:   	udivcc	%o0, %o5, %o7
	.word	0xd448a032	! t0_kref+0x3cb4:   	ldsb	[%g2 + 0x32], %o2
	.word	0xadb2016c	! t0_kref+0x3cb8:   	edge32ln	%o0, %o4, %l6
	.word	0xa8724015	! t0_kref+0x3cbc:   	udiv	%o1, %l5, %l4
	.word	0xa9a588cc	! t0_kref+0x3cc0:   	fsubd	%f22, %f12, %f20
	.word	0xa4d0000d	! t0_kref+0x3cc4:   	umulcc	%g0, %o5, %l2
	.word	0x3c800006	! t0_kref+0x3cc8:   	bpos,a	_kref+0x3ce0
	.word	0xa1a00538	! t0_kref+0x3ccc:   	fsqrts	%f24, %f16
	.word	0xf1be5856	! t0_kref+0x3cd0:   	stda	%f24, [%i1 + %l6]0xc2
	.word	0x912376b8	! t0_kref+0x3cd4:   	mulscc	%o5, -0x948, %o0
	.word	0xaa0ae4be	! t0_kref+0x3cd8:   	and	%o3, 0x4be, %l5
	.word	0xa5a01936	! t0_kref+0x3cdc:   	fstod	%f22, %f18
	.word	0xbda01a31	! t0_kref+0x3ce0:   	fstoi	%f17, %f30
	.word	0xa49a62b6	! t0_kref+0x3ce4:   	xorcc	%o1, 0x2b6, %l2
	.word	0x9bb5c16c	! t0_kref+0x3ce8:   	edge32ln	%l7, %o4, %o5
	.word	0xb1b00fc0	! t0_kref+0x3cec:   	fone	%f24
	.word	0x23480007	! t0_kref+0x3cf0:   	fbne,a,pt	%fcc0, _kref+0x3d0c
	.word	0x9bb54e33	! t0_kref+0x3cf4:   	fands	%f21, %f19, %f13
	.word	0x90583bdd	! t0_kref+0x3cf8:   	smul	%g0, -0x423, %o0
	.word	0xa8b27d6a	! t0_kref+0x3cfc:   	orncc	%o1, -0x296, %l4
	.word	0x2a800001	! t0_kref+0x3d00:   	bcs,a	_kref+0x3d04
	.word	0x80f56fd3	! t0_kref+0x3d04:   	udivcc	%l5, 0xfd3, %g0
	.word	0xe5f6500a	! t0_kref+0x3d08:   	casxa	[%i1]0x80, %o2, %l2
	.word	0xee801019	! t0_kref+0x3d0c:   	lda	[%g0 + %i1]0x80, %l7
	.word	0xe68e9018	! t0_kref+0x3d10:   	lduba	[%i2 + %i0]0x80, %l3
	.word	0xafb58009	! t0_kref+0x3d14:   	edge8	%l6, %o1, %l7
	.word	0x32800002	! t0_kref+0x3d18:   	bne,a	_kref+0x3d20
	.word	0xa3a00539	! t0_kref+0x3d1c:   	fsqrts	%f25, %f17
	.word	0xb7a30838	! t0_kref+0x3d20:   	fadds	%f12, %f24, %f27
	.word	0xa9254009	! t0_kref+0x3d24:   	mulscc	%l5, %o1, %l4
	.word	0x81ae8a5a	! t0_kref+0x3d28:   	fcmpd	%fcc0, %f26, %f26
	.word	0x9bb7854c	! t0_kref+0x3d2c:   	fcmpeq16	%f30, %f12, %o5
	.word	0x3a480005	! t0_kref+0x3d30:   	bcc,a,pt	%icc, _kref+0x3d44
	.word	0x921af747	! t0_kref+0x3d34:   	xor	%o3, -0x8b9, %o1
	.word	0xc96e001a	! t0_kref+0x3d38:   	prefetch	%i0 + %i2, 4
	.word	0x942ebdac	! t0_kref+0x3d3c:   	andn	%i2, -0x254, %o2
	.word	0x97400000	! t0_kref+0x3d40:   	mov	%y, %o3
	.word	0xbda00550	! t0_kref+0x3d44:   	fsqrtd	%f16, %f30
	.word	0xc04e001a	! t0_kref+0x3d48:   	ldsb	[%i0 + %i2], %g0
	.word	0xf7262014	! t0_kref+0x3d4c:   	st	%f27, [%i0 + 0x14]
	.word	0x9da50d35	! t0_kref+0x3d50:   	fsmuld	%f20, %f21, %f14
	.word	0xd628a022	! t0_kref+0x3d54:   	stb	%o3, [%g2 + 0x22]
	.word	0x26480006	! t0_kref+0x3d58:   	bl,a,pt	%icc, _kref+0x3d70
	.word	0x8143c000	! t0_kref+0x3d5c:   	stbar
	.word	0xb7a018d0	! t0_kref+0x3d60:   	fdtos	%f16, %f27
	.word	0xada00558	! t0_kref+0x3d64:   	fsqrtd	%f24, %f22
	.word	0xbdb30df1	! t0_kref+0x3d68:   	fnands	%f12, %f17, %f30
	.word	0x92fb36e6	! t0_kref+0x3d6c:   	sdivcc	%o4, -0x91a, %o1
	.word	0x99b70514	! t0_kref+0x3d70:   	fcmpgt16	%f28, %f20, %o4
	.word	0xf1be584a	! t0_kref+0x3d74:   	stda	%f24, [%i1 + %o2]0xc2
	.word	0xd4070018	! t0_kref+0x3d78:   	ld	[%i4 + %i0], %o2
	.word	0xf1981018	! t0_kref+0x3d7c:   	ldda	[%g0 + %i0]0x80, %f24
	.word	0xdf06601c	! t0_kref+0x3d80:   	ld	[%i1 + 0x1c], %f15
	.word	0xd410a018	! t0_kref+0x3d84:   	lduh	[%g2 + 0x18], %o2
	.word	0xec360000	! t0_kref+0x3d88:   	sth	%l6, [%i0]
	.word	0x93122580	! t0_kref+0x3d8c:   	taddcctv	%o0, 0x580, %o1
	.word	0xa9b50d30	! t0_kref+0x3d90:   	fandnot1s	%f20, %f16, %f20
	.word	0x001fffff	! t0_kref+0x3d94:   	illtrap	0x1fffff
	.word	0x9da0190d	! t0_kref+0x3d98:   	fitod	%f13, %f14
	.word	0xabb5c04a	! t0_kref+0x3d9c:   	edge8l	%l7, %o2, %l5
	.word	0xa1b00c20	! t0_kref+0x3da0:   	fzeros	%f16
	.word	0xee30a006	! t0_kref+0x3da4:   	sth	%l7, [%g2 + 6]
	.word	0xa9a0191a	! t0_kref+0x3da8:   	fitod	%f26, %f20
	.word	0xa9a0054e	! t0_kref+0x3dac:   	fsqrtd	%f14, %f20
	.word	0x9de3bfa0	! t0_kref+0x3db0:   	save	%sp, -0x60, %sp
	.word	0xb2173669	! t0_kref+0x3db4:   	or	%i4, -0x997, %i1
	.word	0x93ee2356	! t0_kref+0x3db8:   	restore	%i0, 0x356, %o1
	.word	0x9a5ac008	! t0_kref+0x3dbc:   	smul	%o3, %o0, %o5
	.word	0x90257cdb	! t0_kref+0x3dc0:   	sub	%l5, -0x325, %o0
	.word	0x8143c000	! t0_kref+0x3dc4:   	stbar
	.word	0xbdb3462c	! t0_kref+0x3dc8:   	fmul8x16	%f13, %f12, %f30
	.word	0xe4462004	! t0_kref+0x3dcc:   	ldsw	[%i0 + 4], %l2
	.word	0x96b33326	! t0_kref+0x3dd0:   	orncc	%o4, -0xcda, %o3
	.word	0xada0055c	! t0_kref+0x3dd4:   	fsqrtd	%f28, %f22
	.word	0x97332006	! t0_kref+0x3dd8:   	srl	%o4, 0x6, %o3
	.word	0x905d4015	! t0_kref+0x3ddc:   	smul	%l5, %l5, %o0
	.word	0x001fffff	! t0_kref+0x3de0:   	illtrap	0x1fffff
	.word	0xe5200018	! t0_kref+0x3de4:   	st	%f18, [%g0 + %i0]
	.word	0xb7a000bb	! t0_kref+0x3de8:   	fnegs	%f27, %f27
	.word	0xf91e6000	! t0_kref+0x3dec:   	ldd	[%i1], %f28
	.word	0x99a01a50	! t0_kref+0x3df0:   	fdtoi	%f16, %f12
	.word	0xa9b68029	! t0_kref+0x3df4:   	edge8n	%i2, %o1, %l4
	.word	0x81ab0a54	! t0_kref+0x3df8:   	fcmpd	%fcc0, %f12, %f20
	.word	0xd9267fec	! t0_kref+0x3dfc:   	st	%f12, [%i1 - 0x14]
	.word	0xe07e3ff8	! t0_kref+0x3e00:   	swap	[%i0 - 8], %l0
	.word	0x80f80016	! t0_kref+0x3e04:   	sdivcc	%g0, %l6, %g0
	.word	0x878020f0	! t0_kref+0x3e08:   	mov	0xf0, %asi
	.word	0xc0566010	! t0_kref+0x3e0c:   	ldsh	[%i1 + 0x10], %g0
	.word	0xac0d800a	! t0_kref+0x3e10:   	and	%l6, %o2, %l6
	.word	0xa4e2a1d0	! t0_kref+0x3e14:   	subccc	%o2, 0x1d0, %l2
	.word	0x9fc10000	! t0_kref+0x3e18:   	call	%g4
	.word	0xd4ae501a	! t0_kref+0x3e1c:   	stba	%o2, [%i1 + %i2]0x80
	.word	0xa3a708ad	! t0_kref+0x3e20:   	fsubs	%f28, %f13, %f17
	.word	0xbba0053a	! t0_kref+0x3e24:   	fsqrts	%f26, %f29
	.word	0x37480006	! t0_kref+0x3e28:   	fbge,a,pt	%fcc0, _kref+0x3e40
	.word	0x9a35c015	! t0_kref+0x3e2c:   	orn	%l7, %l5, %o5
	.word	0xb3b48af2	! t0_kref+0x3e30:   	fpsub32s	%f18, %f18, %f25
	.word	0xadb586d8	! t0_kref+0x3e34:   	fmul8sux16	%f22, %f24, %f22
	.word	0xa1a01116	! t0_kref+0x3e38:   	fxtod	%f22, %f16
	.word	0x81b705cc	! t0_kref+0x3e3c:   	fcmpeq32	%f28, %f12, %g0
	.word	0x9e8dfa38	! t0_kref+0x3e40:   	andcc	%l7, -0x5c8, %o7
	.word	0xda200019	! t0_kref+0x3e44:   	st	%o5, [%g0 + %i1]
	.word	0x97400000	! t0_kref+0x3e48:   	mov	%y, %o3
	.word	0x98436dac	! t0_kref+0x3e4c:   	addc	%o5, 0xdac, %o4
	.word	0xd240a018	! t0_kref+0x3e50:   	ldsw	[%g2 + 0x18], %o1
	.word	0xe67f0019	! t0_kref+0x3e54:   	swap	[%i4 + %i1], %l3
	.word	0xa5a01031	! t0_kref+0x3e58:   	fstox	%f17, %f18
	.word	0xe68e101a	! t0_kref+0x3e5c:   	lduba	[%i0 + %i2]0x80, %l3
	.word	0x35800006	! t0_kref+0x3e60:   	fbue,a	_kref+0x3e78
	.word	0x190127d8	! t0_kref+0x3e64:   	sethi	%hi(0x49f6000), %o4
	.word	0xdd262000	! t0_kref+0x3e68:   	st	%f14, [%i0]
	.word	0xe1267ff4	! t0_kref+0x3e6c:   	st	%f16, [%i1 - 0xc]
	.word	0xadb304ce	! t0_kref+0x3e70:   	fcmpne32	%f12, %f14, %l6
	.word	0xd428a025	! t0_kref+0x3e74:   	stb	%o2, [%g2 + 0x25]
	.word	0xeeae9019	! t0_kref+0x3e78:   	stba	%l7, [%i2 + %i1]0x80
	.word	0xf11e0000	! t0_kref+0x3e7c:   	ldd	[%i0], %f24
	.word	0xe808a01e	! t0_kref+0x3e80:   	ldub	[%g2 + 0x1e], %l4
	.word	0xd5f6500b	! t0_kref+0x3e84:   	casxa	[%i1]0x80, %o3, %o2
	.word	0x2b480004	! t0_kref+0x3e88:   	fbug,a,pt	%fcc0, _kref+0x3e98
	.word	0xa5b70e4e	! t0_kref+0x3e8c:   	fxnor	%f28, %f14, %f18
	.word	0xede6101a	! t0_kref+0x3e90:   	casa	[%i0]0x80, %i2, %l6
	.word	0x93b2c308	! t0_kref+0x3e94:   	alignaddr	%o3, %o0, %o1
	.word	0xec20a02c	! t0_kref+0x3e98:   	st	%l6, [%g2 + 0x2c]
	.word	0x8143e040	! t0_kref+0x3e9c:   	membar	0x40
	.word	0x28800002	! t0_kref+0x3ea0:   	bleu,a	_kref+0x3ea8
	.word	0xee360000	! t0_kref+0x3ea4:   	sth	%l7, [%i0]
	.word	0xe3b8a080	! t0_kref+0x3ea8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xd400a008	! t0_kref+0x3eac:   	ld	[%g2 + 8], %o2
	.word	0x9b23000c	! t0_kref+0x3eb0:   	mulscc	%o4, %o4, %o5
	.word	0x900eb431	! t0_kref+0x3eb4:   	and	%i2, -0xbcf, %o0
	.word	0x902a721c	! t0_kref+0x3eb8:   	andn	%o1, -0xde4, %o0
	.word	0x9135a01f	! t0_kref+0x3ebc:   	srl	%l6, 0x1f, %o0
	.word	0xaba58937	! t0_kref+0x3ec0:   	fmuls	%f22, %f23, %f21
	.word	0xc398a040	! t0_kref+0x3ec4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xae25c017	! t0_kref+0x3ec8:   	sub	%l7, %l7, %l7
	.word	0xa1b50a0e	! t0_kref+0x3ecc:   	fpadd16	%f20, %f14, %f16
	.word	0xe84e4000	! t0_kref+0x3ed0:   	ldsb	[%i1], %l4
	.word	0xa1b50ea0	! t0_kref+0x3ed4:   	fsrc1s	%f20, %f16
	.word	0xb9b3470d	! t0_kref+0x3ed8:   	fmuld8sux16	%f13, %f13, %f28
	.word	0x96adf6f4	! t0_kref+0x3edc:   	andncc	%l7, -0x90c, %o3
	.word	0xa7a00539	! t0_kref+0x3ee0:   	fsqrts	%f25, %f19
	.word	0xc04e8019	! t0_kref+0x3ee4:   	ldsb	[%i2 + %i1], %g0
	.word	0xa5b48c8c	! t0_kref+0x3ee8:   	fandnot2	%f18, %f12, %f18
	.word	0xaa2b3c20	! t0_kref+0x3eec:   	andn	%o4, -0x3e0, %l5
	.word	0x2c480007	! t0_kref+0x3ef0:   	bneg,a,pt	%icc, _kref+0x3f0c
	.word	0xaba01a32	! t0_kref+0x3ef4:   	fstoi	%f18, %f21
	.word	0xc398a040	! t0_kref+0x3ef8:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x8143c000	! t0_kref+0x3efc:   	stbar
	.word	0xb7a01a3a	! t0_kref+0x3f00:   	fstoi	%f26, %f27
	.word	0xd420a000	! t0_kref+0x3f04:   	st	%o2, [%g2]
	.word	0xacab0016	! t0_kref+0x3f08:   	andncc	%o4, %l6, %l6
	.word	0xadb5854c	! t0_kref+0x3f0c:   	fcmpeq16	%f22, %f12, %l6
	.word	0x9fb6854c	! t0_kref+0x3f10:   	fcmpeq16	%f26, %f12, %o7
	.word	0xa7400000	! t0_kref+0x3f14:   	mov	%y, %l3
	.word	0x81800000	! t0_kref+0x3f18:   	mov	%g0, %y
	.word	0xada308dc	! t0_kref+0x3f1c:   	fsubd	%f12, %f28, %f22
	.word	0xfd20a038	! t0_kref+0x3f20:   	st	%f30, [%g2 + 0x38]
	.word	0xecbf5018	! t0_kref+0x3f24:   	stda	%l6, [%i5 + %i0]0x80
	.word	0xd8a6101c	! t0_kref+0x3f28:   	sta	%o4, [%i0 + %i4]0x80
	.word	0xaf1a8000	! t0_kref+0x3f2c:   	tsubcctv	%o2, %g0, %l7
	.word	0xac9b6d65	! t0_kref+0x3f30:   	xorcc	%o5, 0xd65, %l6
	.word	0xbba60830	! t0_kref+0x3f34:   	fadds	%f24, %f16, %f29
	.word	0x31480005	! t0_kref+0x3f38:   	fba,a,pt	%fcc0, _kref+0x3f4c
	.word	0xa3b58c73	! t0_kref+0x3f3c:   	fnors	%f22, %f19, %f17
	.word	0xe64e0000	! t0_kref+0x3f40:   	ldsb	[%i0], %l3
	.word	0xb9a01114	! t0_kref+0x3f44:   	fxtod	%f20, %f28
	.word	0xa4724016	! t0_kref+0x3f48:   	udiv	%o1, %l6, %l2
	.word	0x1f262bc6	! t0_kref+0x3f4c:   	sethi	%hi(0x98af1800), %o7
	.word	0xb9a00552	! t0_kref+0x3f50:   	fsqrtd	%f18, %f28
	.word	0xfd1e7fe0	! t0_kref+0x3f54:   	ldd	[%i1 - 0x20], %f30
	.word	0xa1b507ce	! t0_kref+0x3f58:   	pdist	%f20, %f14, %f16
	.word	0x801b0017	! t0_kref+0x3f5c:   	xor	%o4, %l7, %g0
	.word	0xed68a083	! t0_kref+0x3f60:   	prefetch	%g2 + 0x83, 22
	.word	0xbda0054c	! t0_kref+0x3f64:   	fsqrtd	%f12, %f30
	.word	0x9475a9f2	! t0_kref+0x3f68:   	udiv	%l6, 0x9f2, %o2
	.word	0x8d820008	! t0_kref+0x3f6c:   	wr	%o0, %o0, %fprs
	.word	0x9af57831	! t0_kref+0x3f70:   	udivcc	%l5, -0x7cf, %o5
	.word	0x81b585da	! t0_kref+0x3f74:   	fcmpeq32	%f22, %f26, %g0
	.word	0xafa018cc	! t0_kref+0x3f78:   	fdtos	%f12, %f23
	.word	0xee8e5000	! t0_kref+0x3f7c:   	lduba	[%i1]0x80, %l7
	.word	0xe83e2000	! t0_kref+0x3f80:   	std	%l4, [%i0]
	.word	0x83c06e74	! t0_kref+0x3f84:   	jmpl	%g1 + 0xe74, %g1
	.word	0x90d2701e	! t0_kref+0x3f88:   	umulcc	%o1, -0xfe2, %o0
	.word	0xa8156512	! t0_kref+0x3f8c:   	or	%l5, 0x512, %l4
	.word	0xadb00cd6	! t0_kref+0x3f90:   	fnot2	%f22, %f22
	.word	0xa7b40552	! t0_kref+0x3f94:   	fcmpeq16	%f16, %f18, %l3
	.word	0xe51fbee8	! t0_kref+0x3f98:   	ldd	[%fp - 0x118], %f18
	.word	0x989da025	! t0_kref+0x3f9c:   	xorcc	%l6, 0x25, %o4
	.word	0x9a2dc017	! t0_kref+0x3fa0:   	andn	%l7, %l7, %o5
	.word	0xd420a02c	! t0_kref+0x3fa4:   	st	%o2, [%g2 + 0x2c]
	.word	0x81ae0a37	! t0_kref+0x3fa8:   	fcmps	%fcc0, %f24, %f23
	.word	0xbba00537	! t0_kref+0x3fac:   	fsqrts	%f23, %f29
	.word	0x9420309c	! t0_kref+0x3fb0:   	sub	%g0, -0xf64, %o2
	.word	0xd078a034	! t0_kref+0x3fb4:   	swap	[%g2 + 0x34], %o0
	.word	0xb7a01a56	! t0_kref+0x3fb8:   	fdtoi	%f22, %f27
	.word	0x3a800006	! t0_kref+0x3fbc:   	bcc,a	_kref+0x3fd4
	.word	0x921eb63c	! t0_kref+0x3fc0:   	xor	%i2, -0x9c4, %o1
	.word	0x11036fad	! t0_kref+0x3fc4:   	sethi	%hi(0xdbeb400), %o0
	.word	0x948e8016	! t0_kref+0x3fc8:   	andcc	%i2, %l6, %o2
	.word	0x8143c000	! t0_kref+0x3fcc:   	stbar
	.word	0xde50a020	! t0_kref+0x3fd0:   	ldsh	[%g2 + 0x20], %o7
	.word	0x95400000	! t0_kref+0x3fd4:   	mov	%y, %o2
	.word	0x29480003	! t0_kref+0x3fd8:   	fbl,a,pt	%fcc0, _kref+0x3fe4
	.word	0xa9a00550	! t0_kref+0x3fdc:   	fsqrtd	%f16, %f20
	.word	0xec7f0018	! t0_kref+0x3fe0:   	swap	[%i4 + %i0], %l6
	.word	0xc398a040	! t0_kref+0x3fe4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa1b48ab5	! t0_kref+0x3fe8:   	fpsub16s	%f18, %f21, %f16
	.word	0xc398a040	! t0_kref+0x3fec:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x9412400b	! t0_kref+0x3ff0:   	or	%o1, %o3, %o2
	.word	0xbbb60cba	! t0_kref+0x3ff4:   	fandnot2s	%f24, %f26, %f29
	.word	0x28480007	! t0_kref+0x3ff8:   	bleu,a,pt	%icc, _kref+0x4014
	.word	0xd82e4000	! t0_kref+0x3ffc:   	stb	%o4, [%i1]
	.word	0x81af4a39	! t0_kref+0x4000:   	fcmps	%fcc0, %f29, %f25
	.word	0x8185c000	! t0_kref+0x4004:   	wr	%l7, %g0, %y
	call	SYM(t0_subr1)
	.word	0x945b4015	! t0_kref+0x400c:   	smul	%o5, %l5, %o2
	.word	0x9fb280a0	! t0_kref+0x4010:   	edge16n	%o2, %g0, %o7
	.word	0xc807bff0	! t0_kref+0x4014:   	ld	[%fp - 0x10], %g4
	.word	0xa646b652	! t0_kref+0x4018:   	addc	%i2, -0x9ae, %l3
	.word	0xb9a01912	! t0_kref+0x401c:   	fitod	%f18, %f28
	.word	0x81ab0a32	! t0_kref+0x4020:   	fcmps	%fcc0, %f12, %f18
	.word	0x9db706d2	! t0_kref+0x4024:   	fmul8sux16	%f28, %f18, %f14
	.word	0xf76e2018	! t0_kref+0x4028:   	prefetch	%i0 + 0x18, 27
	.word	0xd050a006	! t0_kref+0x402c:   	ldsh	[%g2 + 6], %o0
	.word	0xee267ff8	! t0_kref+0x4030:   	st	%l7, [%i1 - 8]
	.word	0xd6263ffc	! t0_kref+0x4034:   	st	%o3, [%i0 - 4]
	.word	0xd45e401d	! t0_kref+0x4038:   	ldx	[%i1 + %i5], %o2
	.word	0xfd20a030	! t0_kref+0x403c:   	st	%f30, [%g2 + 0x30]
	.word	0xf430a00c	! t0_kref+0x4040:   	sth	%i2, [%g2 + 0xc]
	.word	0x81ab8a34	! t0_kref+0x4044:   	fcmps	%fcc0, %f14, %f20
	.word	0x2c800002	! t0_kref+0x4048:   	bneg,a	_kref+0x4050
	.word	0xb7b0076e	! t0_kref+0x404c:   	fpack16	%f14, %f27
	call	SYM(t0_subr0)
	.word	0xa9b5054c	! t0_kref+0x4054:   	fcmpeq16	%f20, %f12, %l4
	.word	0x9bb54000	! t0_kref+0x4058:   	edge8	%l5, %g0, %o5
	.word	0xb1b40a92	! t0_kref+0x405c:   	fpsub16	%f16, %f18, %f24
	.word	0x81ad8a33	! t0_kref+0x4060:   	fcmps	%fcc0, %f22, %f19
	.word	0x8143e040	! t0_kref+0x4064:   	membar	0x40
	.word	0xb7a000b7	! t0_kref+0x4068:   	fnegs	%f23, %f27
	.word	0xec7f0019	! t0_kref+0x406c:   	swap	[%i4 + %i1], %l6
	.word	0xd0066008	! t0_kref+0x4070:   	ld	[%i1 + 8], %o0
	.word	0xd3e61016	! t0_kref+0x4074:   	casa	[%i0]0x80, %l6, %o1
	.word	0x9170000a	! t0_kref+0x4078:   	popc	%o2, %o0
	.word	0x85802a35	! t0_kref+0x407c:   	mov	0xa35, %ccr
	.word	0xfb20a030	! t0_kref+0x4080:   	st	%f29, [%g2 + 0x30]
	.word	0x81ae8ada	! t0_kref+0x4084:   	fcmped	%fcc0, %f26, %f26
	.word	0x9a12400d	! t0_kref+0x4088:   	or	%o1, %o5, %o5
	.word	0x9de3bfa0	! t0_kref+0x408c:   	save	%sp, -0x60, %sp
	.word	0x9fee801a	! t0_kref+0x4090:   	restore	%i2, %i2, %o7
	.word	0xa6aea6b6	! t0_kref+0x4094:   	andncc	%i2, 0x6b6, %l3
	.word	0xab230017	! t0_kref+0x4098:   	mulscc	%o4, %l7, %l5
	.word	0xb1a0053d	! t0_kref+0x409c:   	fsqrts	%f29, %f24
	.word	0xed6e6008	! t0_kref+0x40a0:   	prefetch	%i1 + 8, 22
	.word	0xa81dc015	! t0_kref+0x40a4:   	xor	%l7, %l5, %l4
	.word	0xb1a0054e	! t0_kref+0x40a8:   	fsqrtd	%f14, %f24
	.word	0xb9a00554	! t0_kref+0x40ac:   	fsqrtd	%f20, %f28
	.word	0xae100008	! t0_kref+0x40b0:   	mov	%o0, %l7
	.word	0xa7b6802b	! t0_kref+0x40b4:   	edge8n	%i2, %o3, %l3
	.word	0xc398a080	! t0_kref+0x40b8:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xffee501b	! t0_kref+0x40bc:   	prefetcha	%i1 + %i3, 31
	.word	0xac1a3031	! t0_kref+0x40c0:   	xor	%o0, -0xfcf, %l6
	.word	0x94a3777c	! t0_kref+0x40c4:   	subcc	%o5, -0x884, %o2
	.word	0xea263fe4	! t0_kref+0x40c8:   	st	%l5, [%i0 - 0x1c]
	.word	0xa5a408cc	! t0_kref+0x40cc:   	fsubd	%f16, %f12, %f18
	.word	0xda7e200c	! t0_kref+0x40d0:   	swap	[%i0 + 0xc], %o5
	.word	0x9923000c	! t0_kref+0x40d4:   	mulscc	%o4, %o4, %o4
	.word	0xd836c005	! t0_kref+0x40d8:   	sth	%o4, [%i3 + %g5]
	.word	0x81b540c9	! t0_kref+0x40dc:   	edge16l	%l5, %o1, %g0
	.word	0xb7a018d0	! t0_kref+0x40e0:   	fdtos	%f16, %f27
	.word	0xe11e401d	! t0_kref+0x40e4:   	ldd	[%i1 + %i5], %f16
	.word	0xadb70a9c	! t0_kref+0x40e8:   	fpsub16	%f28, %f28, %f22
	.word	0xadb54328	! t0_kref+0x40ec:   	bmask	%l5, %o0, %l6
	.word	0x9a85f1b0	! t0_kref+0x40f0:   	addcc	%l7, -0xe50, %o5
	.word	0x9da01a52	! t0_kref+0x40f4:   	fdtoi	%f18, %f14
	.word	0xa526800a	! t0_kref+0x40f8:   	mulscc	%i2, %o2, %l2
	.word	0xc398a080	! t0_kref+0x40fc:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xb1a0054e	! t0_kref+0x4100:   	fsqrtd	%f14, %f24
	.word	0x9e636405	! t0_kref+0x4104:   	subc	%o5, 0x405, %o7
	.word	0x92b28016	! t0_kref+0x4108:   	orncc	%o2, %l6, %o1
	.word	0x81800000	! t0_kref+0x410c:   	mov	%g0, %y
	.word	0x9466bc09	! t0_kref+0x4110:   	subc	%i2, -0x3f7, %o2
	.word	0xb5a0053e	! t0_kref+0x4114:   	fsqrts	%f30, %f26
	.word	0xa625800d	! t0_kref+0x4118:   	sub	%l6, %o5, %l3
	.word	0xae223a88	! t0_kref+0x411c:   	sub	%o0, -0x578, %l7
	.word	0xb5b38ad4	! t0_kref+0x4120:   	fpsub32	%f14, %f20, %f26
	.word	0xa6e6b444	! t0_kref+0x4124:   	subccc	%i2, -0xbbc, %l3
	.word	0x9da00134	! t0_kref+0x4128:   	fabss	%f20, %f14
	.word	0xe91e7ff8	! t0_kref+0x412c:   	ldd	[%i1 - 8], %f20
	.word	0x9fc00004	! t0_kref+0x4130:   	call	%g0 + %g4
	.word	0x932a6010	! t0_kref+0x4134:   	sll	%o1, 0x10, %o1
	.word	0xd208a036	! t0_kref+0x4138:   	ldub	[%g2 + 0x36], %o1
	.word	0xd4c6101c	! t0_kref+0x413c:   	ldswa	[%i0 + %i4]0x80, %o2
	.word	0xe8066008	! t0_kref+0x4140:   	ld	[%i1 + 8], %l4
	.word	0x8185c000	! t0_kref+0x4144:   	wr	%l7, %g0, %y
	.word	0xc07e601c	! t0_kref+0x4148:   	swap	[%i1 + 0x1c], %g0
	.word	0xb5a00552	! t0_kref+0x414c:   	fsqrtd	%f18, %f26
	.word	0xe46e001a	! t0_kref+0x4150:   	ldstub	[%i0 + %i2], %l2
	.word	0x3b800001	! t0_kref+0x4154:   	fble,a	_kref+0x4158
	.word	0xdac65000	! t0_kref+0x4158:   	ldswa	[%i1]0x80, %o5
	.word	0x32800008	! t0_kref+0x415c:   	bne,a	_kref+0x417c
	.word	0xda08a024	! t0_kref+0x4160:   	ldub	[%g2 + 0x24], %o5
	.word	0xe84e8018	! t0_kref+0x4164:   	ldsb	[%i2 + %i0], %l4
	.word	0x9122800c	! t0_kref+0x4168:   	mulscc	%o2, %o4, %o0
	.word	0xa9a00552	! t0_kref+0x416c:   	fsqrtd	%f18, %f20
	.word	0xd7e65009	! t0_kref+0x4170:   	casa	[%i1]0x80, %o1, %o3
	.word	0xd67e3fe0	! t0_kref+0x4174:   	swap	[%i0 - 0x20], %o3
	.word	0xef264000	! t0_kref+0x4178:   	st	%f23, [%i1]
	.word	0x27800006	! t0_kref+0x417c:   	fbul,a	_kref+0x4194
	.word	0xf428a023	! t0_kref+0x4180:   	stb	%i2, [%g2 + 0x23]
	.word	0xd0363fe8	! t0_kref+0x4184:   	sth	%o0, [%i0 - 0x18]
	.word	0xf500a00c	! t0_kref+0x4188:   	ld	[%g2 + 0xc], %f26
	.word	0xc807bfe4	! t0_kref+0x418c:   	ld	[%fp - 0x1c], %g4
	.word	0x9e1e801a	! t0_kref+0x4190:   	xor	%i2, %i2, %o7
	.word	0xf7270019	! t0_kref+0x4194:   	st	%f27, [%i4 + %i1]
	.word	0xb5a0054c	! t0_kref+0x4198:   	fsqrtd	%f12, %f26
	.word	0x9fc00004	! t0_kref+0x419c:   	call	%g0 + %g4
	.word	0xaba000be	! t0_kref+0x41a0:   	fnegs	%f30, %f21
	.word	0x8143c000	! t0_kref+0x41a4:   	stbar
	.word	0x23480003	! t0_kref+0x41a8:   	fbne,a,pt	%fcc0, _kref+0x41b4
	.word	0x8143c000	! t0_kref+0x41ac:   	stbar
	.word	0x9e2b74e4	! t0_kref+0x41b0:   	andn	%o5, -0xb1c, %o7
	.word	0xed1e7fe8	! t0_kref+0x41b4:   	ldd	[%i1 - 0x18], %f22
	.word	0x99a7085e	! t0_kref+0x41b8:   	faddd	%f28, %f30, %f12
	.word	0xfb066010	! t0_kref+0x41bc:   	ld	[%i1 + 0x10], %f29
	.word	0xb7a000ae	! t0_kref+0x41c0:   	fnegs	%f14, %f27
	.word	0xd84e401a	! t0_kref+0x41c4:   	ldsb	[%i1 + %i2], %o4
	.word	0xc020a03c	! t0_kref+0x41c8:   	clr	[%g2 + 0x3c]
	.word	0xa9b70dd8	! t0_kref+0x41cc:   	fnand	%f28, %f24, %f20
	.word	0x81df4012	! t0_kref+0x41d0:   	flush	%i5 + %l2
	.word	0xec56c019	! t0_kref+0x41d4:   	ldsh	[%i3 + %i1], %l6
	.word	0xd8300019	! t0_kref+0x41d8:   	sth	%o4, [%g0 + %i1]
	.word	0xd006401c	! t0_kref+0x41dc:   	ld	[%i1 + %i4], %o0
	.word	0xd4260000	! t0_kref+0x41e0:   	st	%o2, [%i0]
	.word	0xa5a0055a	! t0_kref+0x41e4:   	fsqrtd	%f26, %f18
	.word	0xeb6e2010	! t0_kref+0x41e8:   	prefetch	%i0 + 0x10, 21
	.word	0x87802080	! t0_kref+0x41ec:   	mov	0x80, %asi
	.word	0x9812400d	! t0_kref+0x41f0:   	or	%o1, %o5, %o4
	.word	0x9672f6a2	! t0_kref+0x41f4:   	udiv	%o3, -0x95e, %o3
	.word	0xe480a014	! t0_kref+0x41f8:   	lda	[%g2 + 0x14]%asi, %l2
	.word	0xed270019	! t0_kref+0x41fc:   	st	%f22, [%i4 + %i1]
	.word	0xe41e001d	! t0_kref+0x4200:   	ldd	[%i0 + %i5], %l2
	.word	0xb1a6c8b4	! t0_kref+0x4204:   	fsubs	%f27, %f20, %f24
	.word	0xe41e0000	! t0_kref+0x4208:   	ldd	[%i0], %l2
	.word	0x80956ebf	! t0_kref+0x420c:   	orcc	%l5, 0xebf, %g0
	.word	0xf720a000	! t0_kref+0x4210:   	st	%f27, [%g2]
	.word	0xd44e0000	! t0_kref+0x4214:   	ldsb	[%i0], %o2
	.word	0xe83e7ff8	! t0_kref+0x4218:   	std	%l4, [%i1 - 8]
	.word	0x9fb50a7e	! t0_kref+0x421c:   	fpadd32s	%f20, %f30, %f15
	.word	0x25800007	! t0_kref+0x4220:   	fblg,a	_kref+0x423c
	.word	0xa1a0193b	! t0_kref+0x4224:   	fstod	%f27, %f16
	.word	0x98d5800d	! t0_kref+0x4228:   	umulcc	%l6, %o5, %o4
	.word	0xa412800a	! t0_kref+0x422c:   	or	%o2, %o2, %l2
	.word	0xb9a01892	! t0_kref+0x4230:   	fitos	%f18, %f28
	.word	0xb9a018d8	! t0_kref+0x4234:   	fdtos	%f24, %f28
	call	SYM(t0_subr0)
	.word	0xa62af7da	! t0_kref+0x423c:   	andn	%o3, -0x826, %l3
	.word	0xe4ee5000	! t0_kref+0x4240:   	ldstuba	[%i1]0x80, %l2
	.word	0x90d368d1	! t0_kref+0x4244:   	umulcc	%o5, 0x8d1, %o0
	.word	0xeed67fea	! t0_kref+0x4248:   	ldsha	[%i1 - 0x16]%asi, %l7
	.word	0xacb20009	! t0_kref+0x424c:   	orncc	%o0, %o1, %l6
	.word	0x9db6cd60	! t0_kref+0x4250:   	fnot1s	%f27, %f14
	.word	0xbda000d4	! t0_kref+0x4254:   	fnegd	%f20, %f30
	.word	0xda2e3fff	! t0_kref+0x4258:   	stb	%o5, [%i0 - 1]
	.word	0xee567fea	! t0_kref+0x425c:   	ldsh	[%i1 - 0x16], %l7
	.word	0xe4d0a014	! t0_kref+0x4260:   	ldsha	[%g2 + 0x14]%asi, %l2
	.word	0xd8d0a038	! t0_kref+0x4264:   	ldsha	[%g2 + 0x38]%asi, %o4
	.word	0x9a76800c	! t0_kref+0x4268:   	udiv	%i2, %o4, %o5
	.word	0xe81e4000	! t0_kref+0x426c:   	ldd	[%i1], %l4
	.word	0xd27e401c	! t0_kref+0x4270:   	swap	[%i1 + %i4], %o1
	.word	0xec567fe0	! t0_kref+0x4274:   	ldsh	[%i1 - 0x20], %l6
	.word	0xdf000018	! t0_kref+0x4278:   	ld	[%g0 + %i0], %f15
	.word	0xec28a03c	! t0_kref+0x427c:   	stb	%l6, [%g2 + 0x3c]
	.word	0x9da309d4	! t0_kref+0x4280:   	fdivd	%f12, %f20, %f14
	.word	0x8143c000	! t0_kref+0x4284:   	stbar
	.word	0xd81e7ff8	! t0_kref+0x4288:   	ldd	[%i1 - 8], %o4
	.word	0xa72dc016	! t0_kref+0x428c:   	sll	%l7, %l6, %l3
	.word	0xada0055e	! t0_kref+0x4290:   	fsqrtd	%f30, %f22
	.word	0x9415c015	! t0_kref+0x4294:   	or	%l7, %l5, %o2
	.word	0xed200019	! t0_kref+0x4298:   	st	%f22, [%g0 + %i1]
	.word	0xd236601e	! t0_kref+0x429c:   	sth	%o1, [%i1 + 0x1e]
	.word	0xa7258000	! t0_kref+0x42a0:   	mulscc	%l6, %g0, %l3
	.word	0x9825e7bf	! t0_kref+0x42a4:   	sub	%l7, 0x7bf, %o4
	.word	0x2a480003	! t0_kref+0x42a8:   	bcs,a,pt	%icc, _kref+0x42b4
	.word	0x9fa018de	! t0_kref+0x42ac:   	fdtos	%f30, %f15
	.word	0xb9a0053d	! t0_kref+0x42b0:   	fsqrts	%f29, %f28
	.word	0xb1b586f6	! t0_kref+0x42b4:   	fmul8ulx16	%f22, %f22, %f24
	.word	0x97400000	! t0_kref+0x42b8:   	mov	%y, %o3
	.word	0x902dc00a	! t0_kref+0x42bc:   	andn	%l7, %o2, %o0
	.word	0xf4ae1000	! t0_kref+0x42c0:   	stba	%i2, [%i0]0x80
	.word	0xa1a7483a	! t0_kref+0x42c4:   	fadds	%f29, %f26, %f16
	.word	0x81dc2465	! t0_kref+0x42c8:   	flush	%l0 + 0x465
	.word	0x32800008	! t0_kref+0x42cc:   	bne,a	_kref+0x42ec
	.word	0x99b58f50	! t0_kref+0x42d0:   	fornot1	%f22, %f16, %f12
	.word	0xed06600c	! t0_kref+0x42d4:   	ld	[%i1 + 0xc], %f22
	.word	0x81da3b86	! t0_kref+0x42d8:   	flush	%o0 - 0x47a
	.word	0xb1a01a56	! t0_kref+0x42dc:   	fdtoi	%f22, %f24
	.word	0xa9a01890	! t0_kref+0x42e0:   	fitos	%f16, %f20
	.word	0xd0560000	! t0_kref+0x42e4:   	ldsh	[%i0], %o0
	.word	0xb1b00cf4	! t0_kref+0x42e8:   	fnot2s	%f20, %f24
	.word	0xa5408000	! t0_kref+0x42ec:   	mov	%ccr, %l2
	.word	0x81de7a46	! t0_kref+0x42f0:   	flush	%i1 - 0x5ba
	.word	0xb5a0190d	! t0_kref+0x42f4:   	fitod	%f13, %f26
	.word	0x81ab8a3a	! t0_kref+0x42f8:   	fcmps	%fcc0, %f14, %f26
	.word	0xac9e8016	! t0_kref+0x42fc:   	xorcc	%i2, %l6, %l6
	.word	0xa1a309cc	! t0_kref+0x4300:   	fdivd	%f12, %f12, %f16
	.word	0xc807bfe4	! t0_kref+0x4304:   	ld	[%fp - 0x1c], %g4
	.word	0xf4b0a010	! t0_kref+0x4308:   	stha	%i2, [%g2 + 0x10]%asi
	.word	0xc168a00d	! t0_kref+0x430c:   	prefetch	%g2 + 0xd, 0
	.word	0x3f800008	! t0_kref+0x4310:   	fbo,a	_kref+0x4330
	.word	0xbbab403d	! t0_kref+0x4314:   	fmovsle	%fcc0, %f29, %f29
	.word	0xe9be5817	! t0_kref+0x4318:   	stda	%f20, [%i1 + %l7]0xc0
	.word	0xf5063ffc	! t0_kref+0x431c:   	ld	[%i0 - 4], %f26
	.word	0x9e100016	! t0_kref+0x4320:   	mov	%l6, %o7
	.word	0x985a400d	! t0_kref+0x4324:   	smul	%o1, %o5, %o4
	.word	0x91b784d4	! t0_kref+0x4328:   	fcmpne32	%f30, %f20, %o0
	.word	0x81daa681	! t0_kref+0x432c:   	flush	%o2 + 0x681
	.word	0x21800001	! t0_kref+0x4330:   	fbn,a	_kref+0x4334
	.word	0xd0080019	! t0_kref+0x4334:   	ldub	[%g0 + %i1], %o0
	.word	0xe41e4000	! t0_kref+0x4338:   	ldd	[%i1], %l2
	.word	0xacbde078	! t0_kref+0x433c:   	xnorcc	%l7, 0x78, %l6
	.word	0xb3a018de	! t0_kref+0x4340:   	fdtos	%f30, %f25
	.word	0xb1a00034	! t0_kref+0x4344:   	fmovs	%f20, %f24
	.word	0xda580019	! t0_kref+0x4348:   	ldx	[%g0 + %i1], %o5
	.word	0x9fb38554	! t0_kref+0x434c:   	fcmpeq16	%f14, %f20, %o7
	.word	0xb5a0053e	! t0_kref+0x4350:   	fsqrts	%f30, %f26
	.word	0x2e480003	! t0_kref+0x4354:   	bvs,a,pt	%icc, _kref+0x4360
	.word	0xda06401c	! t0_kref+0x4358:   	ld	[%i1 + %i4], %o5
	.word	0x809a8008	! t0_kref+0x435c:   	xorcc	%o2, %o0, %g0
	.word	0x99b3063c	! t0_kref+0x4360:   	fmul8x16	%f12, %f28, %f12
	.word	0xa1b30ea0	! t0_kref+0x4364:   	fsrc1s	%f12, %f16
	.word	0x81ac0ace	! t0_kref+0x4368:   	fcmped	%fcc0, %f16, %f14
	.word	0xb5a01911	! t0_kref+0x436c:   	fitod	%f17, %f26
	.word	0xa9408000	! t0_kref+0x4370:   	mov	%ccr, %l4
	.word	0x81aeca33	! t0_kref+0x4374:   	fcmps	%fcc0, %f27, %f19
	.word	0xe83e6008	! t0_kref+0x4378:   	std	%l4, [%i1 + 8]
	.word	0xaed2fc9e	! t0_kref+0x437c:   	umulcc	%o3, -0x362, %l7
	.word	0xac72b298	! t0_kref+0x4380:   	udiv	%o2, -0xd68, %l6
	.word	0xaba64833	! t0_kref+0x4384:   	fadds	%f25, %f19, %f21
	.word	0xf7070018	! t0_kref+0x4388:   	ld	[%i4 + %i0], %f27
	.word	0xec1e7fe8	! t0_kref+0x438c:   	ldd	[%i1 - 0x18], %l6
	.word	0xac42b1a9	! t0_kref+0x4390:   	addc	%o2, -0xe57, %l6
	.word	0xa1b58d40	! t0_kref+0x4394:   	fnot1	%f22, %f16
	.word	0x99b68a16	! t0_kref+0x4398:   	fpadd16	%f26, %f22, %f12
	.word	0xd030a008	! t0_kref+0x439c:   	sth	%o0, [%g2 + 8]
	.word	0xa1a00032	! t0_kref+0x43a0:   	fmovs	%f18, %f16
	.word	0xa49a801a	! t0_kref+0x43a4:   	xorcc	%o2, %i2, %l2
	.word	0x9a7228db	! t0_kref+0x43a8:   	udiv	%o0, 0x8db, %o5
	.word	0xee28a03d	! t0_kref+0x43ac:   	stb	%l7, [%g2 + 0x3d]
	.word	0xb5a0193b	! t0_kref+0x43b0:   	fstod	%f27, %f26
	.word	0xb9b38e80	! t0_kref+0x43b4:   	fsrc1	%f14, %f28
	.word	0x9db38d0c	! t0_kref+0x43b8:   	fandnot1	%f14, %f12, %f14
	.word	0x9fc00004	! t0_kref+0x43bc:   	call	%g0 + %g4
	.word	0x001fffff	! t0_kref+0x43c0:   	illtrap	0x1fffff
	.word	0xa416800a	! t0_kref+0x43c4:   	or	%i2, %o2, %l2
	.word	0x97400000	! t0_kref+0x43c8:   	mov	%y, %o3
	.word	0x8143c000	! t0_kref+0x43cc:   	stbar
	.word	0xaaf2a0c0	! t0_kref+0x43d0:   	udivcc	%o2, 0xc0, %l5
	.word	0xa5b70a74	! t0_kref+0x43d4:   	fpadd32s	%f28, %f20, %f18
	.word	0xe06e7ffd	! t0_kref+0x43d8:   	ldstub	[%i1 - 3], %l0
	.word	0xec1e2010	! t0_kref+0x43dc:   	ldd	[%i0 + 0x10], %l6
	.word	0xacf02bbc	! t0_kref+0x43e0:   	udivcc	%g0, 0xbbc, %l6
	.word	0xa5a000b4	! t0_kref+0x43e4:   	fnegs	%f20, %f18
	.word	0xa7a000b1	! t0_kref+0x43e8:   	fnegs	%f17, %f19
	.word	0x963e8017	! t0_kref+0x43ec:   	xnor	%i2, %l7, %o3
	.word	0x91054000	! t0_kref+0x43f0:   	taddcc	%l5, %g0, %o0
	.word	0xb5b48e4c	! t0_kref+0x43f4:   	fxnor	%f18, %f12, %f26
	.word	0xf106001c	! t0_kref+0x43f8:   	ld	[%i0 + %i4], %f24
	.word	0x99a00558	! t0_kref+0x43fc:   	fsqrtd	%f24, %f12
	.word	0x81ae8a30	! t0_kref+0x4400:   	fcmps	%fcc0, %f26, %f16
	.word	0xc7e8a04c	! t0_kref+0x4404:   	prefetcha	%g2 + 0x4c, 3
	.word	0xee363ffc	! t0_kref+0x4408:   	sth	%l7, [%i0 - 4]
	.word	0xa925bad6	! t0_kref+0x440c:   	mulscc	%l6, -0x52a, %l4
	.word	0xa7b5ca34	! t0_kref+0x4410:   	fpadd16s	%f23, %f20, %f19
	.word	0xafb6814d	! t0_kref+0x4414:   	edge32l	%i2, %o5, %l7
	.word	0x3b480008	! t0_kref+0x4418:   	fble,a,pt	%fcc0, _kref+0x4438
	.word	0x8143c000	! t0_kref+0x441c:   	stbar
	.word	0xe320a028	! t0_kref+0x4420:   	st	%f17, [%g2 + 0x28]
	.word	0xa60df47b	! t0_kref+0x4424:   	and	%l7, -0xb85, %l3
	.word	0xa65a23b6	! t0_kref+0x4428:   	smul	%o0, 0x3b6, %l3
	.word	0xe1264000	! t0_kref+0x442c:   	st	%f16, [%i1]
	.word	0x25800006	! t0_kref+0x4430:   	fblg,a	_kref+0x4448
	.word	0xa65af1e5	! t0_kref+0x4434:   	smul	%o3, -0xe1b, %l3
	.word	0xa5b586ec	! t0_kref+0x4438:   	fmul8ulx16	%f22, %f12, %f18
	.word	0xa6868000	! t0_kref+0x443c:   	addcc	%i2, %g0, %l3
	.word	0xd440a010	! t0_kref+0x4440:   	ldsw	[%g2 + 0x10], %o2
	.word	0x2b800002	! t0_kref+0x4444:   	fbug,a	_kref+0x444c
	.word	0x8143c000	! t0_kref+0x4448:   	stbar
	.word	0xa9b307d6	! t0_kref+0x444c:   	pdist	%f12, %f22, %f20
	.word	0x38800005	! t0_kref+0x4450:   	bgu,a	_kref+0x4464
	.word	0x985da566	! t0_kref+0x4454:   	smul	%l6, 0x566, %o4
	.word	0xb9a00132	! t0_kref+0x4458:   	fabss	%f18, %f28
	.word	0x95254000	! t0_kref+0x445c:   	mulscc	%l5, %g0, %o2
	.word	0x1118cf07	! t0_kref+0x4460:   	sethi	%hi(0x633c1c00), %o0
	.word	0xc12e401c	! t0_kref+0x4464:   	st	%fsr, [%i1 + %i4]
	.word	0x9672c015	! t0_kref+0x4468:   	udiv	%o3, %l5, %o3
	.word	0xa69b400d	! t0_kref+0x446c:   	xorcc	%o5, %o5, %l3
	.word	0xee2e3ff2	! t0_kref+0x4470:   	stb	%l7, [%i0 - 0xe]
	.word	0xde06401c	! t0_kref+0x4474:   	ld	[%i1 + %i4], %o7
	.word	0x2e800008	! t0_kref+0x4478:   	bvs,a	_kref+0x4498
	.word	0x2912d05f	! t0_kref+0x447c:   	sethi	%hi(0x4b417c00), %l4
	.word	0xe1000018	! t0_kref+0x4480:   	ld	[%g0 + %i0], %f16
	.word	0xada68d36	! t0_kref+0x4484:   	fsmuld	%f26, %f22, %f22
	.word	0xac8d400c	! t0_kref+0x4488:   	andcc	%l5, %o4, %l6
	.word	0xbba70838	! t0_kref+0x448c:   	fadds	%f28, %f24, %f29
	.word	0xe580a008	! t0_kref+0x4490:   	lda	[%g2 + 8]%asi, %f18
	.word	0xa9a6c833	! t0_kref+0x4494:   	fadds	%f27, %f19, %f20
	.word	0x968d6c5e	! t0_kref+0x4498:   	andcc	%l5, 0xc5e, %o3
	.word	0x9ba01a50	! t0_kref+0x449c:   	fdtoi	%f16, %f13
	.word	0x9640000b	! t0_kref+0x44a0:   	addc	%g0, %o3, %o3
	.word	0xd4070019	! t0_kref+0x44a4:   	ld	[%i4 + %i1], %o2
	.word	0xffee101c	! t0_kref+0x44a8:   	prefetcha	%i0 + %i4, 31
	.word	0xeaf62010	! t0_kref+0x44ac:   	stxa	%l5, [%i0 + 0x10]%asi
	.word	0x37480002	! t0_kref+0x44b0:   	fbge,a,pt	%fcc0, _kref+0x44b8
	.word	0xadb40733	! t0_kref+0x44b4:   	fmuld8ulx16	%f16, %f19, %f22
	.word	0xada00534	! t0_kref+0x44b8:   	fsqrts	%f20, %f22
	.word	0x29800005	! t0_kref+0x44bc:   	fbl,a	_kref+0x44d0
	.word	0xaf400000	! t0_kref+0x44c0:   	mov	%y, %l7
	.word	0xed1f4018	! t0_kref+0x44c4:   	ldd	[%i5 + %i0], %f22
	.word	0x992b6014	! t0_kref+0x44c8:   	sll	%o5, 0x14, %o4
	.word	0x36800007	! t0_kref+0x44cc:   	bge,a	_kref+0x44e8
	.word	0xd2c67fec	! t0_kref+0x44d0:   	ldswa	[%i1 - 0x14]%asi, %o1
	.word	0xf9060000	! t0_kref+0x44d4:   	ld	[%i0], %f28
	.word	0x3a800004	! t0_kref+0x44d8:   	bcc,a	_kref+0x44e8
	.word	0xbda5c82e	! t0_kref+0x44dc:   	fadds	%f23, %f14, %f30
	.word	0xac756d6a	! t0_kref+0x44e0:   	udiv	%l5, 0xd6a, %l6
	.word	0xde0e7ff5	! t0_kref+0x44e4:   	ldub	[%i1 - 0xb], %o7
	.word	0x2a480008	! t0_kref+0x44e8:   	bcs,a,pt	%icc, _kref+0x4508
	.word	0xab2e8015	! t0_kref+0x44ec:   	sll	%i2, %l5, %l5
	.word	0xec801019	! t0_kref+0x44f0:   	lda	[%g0 + %i1]0x80, %l6
	.word	0xa1b38e80	! t0_kref+0x44f4:   	fsrc1	%f14, %f16
	.word	0x90bdacc7	! t0_kref+0x44f8:   	xnorcc	%l6, 0xcc7, %o0
	.word	0x9a2a78d8	! t0_kref+0x44fc:   	andn	%o1, -0x728, %o5
	.word	0xb1a00552	! t0_kref+0x4500:   	fsqrtd	%f18, %f24
	.word	0xb7a01a33	! t0_kref+0x4504:   	fstoi	%f19, %f27
	.word	0x99a3882c	! t0_kref+0x4508:   	fadds	%f14, %f12, %f12
	.word	0xb1a78850	! t0_kref+0x450c:   	faddd	%f30, %f16, %f24
	.word	0x94d2bc1d	! t0_kref+0x4510:   	umulcc	%o2, -0x3e3, %o2
	.word	0xe9e8a009	! t0_kref+0x4514:   	prefetcha	%g2 + 9, 20
	.word	0x949eba50	! t0_kref+0x4518:   	xorcc	%i2, -0x5b0, %o2
	.word	0x8066800b	! t0_kref+0x451c:   	subc	%i2, %o3, %g0
	.word	0x81aeca39	! t0_kref+0x4520:   	fcmps	%fcc0, %f27, %f25
	.word	0xb1a0192e	! t0_kref+0x4524:   	fstod	%f14, %f24
	.word	0xada78837	! t0_kref+0x4528:   	fadds	%f30, %f23, %f22
	.word	0x3a800007	! t0_kref+0x452c:   	bcc,a	_kref+0x4548
	.word	0x98bb001a	! t0_kref+0x4530:   	xnorcc	%o4, %i2, %o4
	.word	0xec070019	! t0_kref+0x4534:   	ld	[%i4 + %i1], %l6
	.word	0xef066014	! t0_kref+0x4538:   	ld	[%i1 + 0x14], %f23
	.word	0x8143c000	! t0_kref+0x453c:   	stbar
	.word	0xa5a509ce	! t0_kref+0x4540:   	fdivd	%f20, %f14, %f18
	.word	0x9da60854	! t0_kref+0x4544:   	faddd	%f24, %f20, %f14
	.word	0x9a65800d	! t0_kref+0x4548:   	subc	%l6, %o5, %o5
	.word	0xec3e0000	! t0_kref+0x454c:   	std	%l6, [%i0]
	.word	0xa5b00fe0	! t0_kref+0x4550:   	fones	%f18
	.word	0xd6270019	! t0_kref+0x4554:   	st	%o3, [%i4 + %i1]
	.word	0xb1b00cf8	! t0_kref+0x4558:   	fnot2s	%f24, %f24
	.word	0x99b58f52	! t0_kref+0x455c:   	fornot1	%f22, %f18, %f12
	.word	0x9fa0053c	! t0_kref+0x4560:   	fsqrts	%f28, %f15
	.word	0xdb20a03c	! t0_kref+0x4564:   	st	%f13, [%g2 + 0x3c]
	.word	0xa9a688b0	! t0_kref+0x4568:   	fsubs	%f26, %f16, %f20
	.word	0x37800008	! t0_kref+0x456c:   	fbge,a	_kref+0x458c
	.word	0x9bb68156	! t0_kref+0x4570:   	edge32l	%i2, %l6, %o5
	.word	0x80630009	! t0_kref+0x4574:   	subc	%o4, %o1, %g0
	.word	0x22800002	! t0_kref+0x4578:   	be,a	_kref+0x4580
	.word	0xe920a034	! t0_kref+0x457c:   	st	%f20, [%g2 + 0x34]
	.word	0xed1e6008	! t0_kref+0x4580:   	ldd	[%i1 + 8], %f22
	.word	0xaee332d5	! t0_kref+0x4584:   	subccc	%o4, -0xd2b, %l7
	.word	0x925b400c	! t0_kref+0x4588:   	smul	%o5, %o4, %o1
	.word	0x9de3bfa0	! t0_kref+0x458c:   	save	%sp, -0x60, %sp
	.word	0xa9e8001c	! t0_kref+0x4590:   	restore	%g0, %i4, %l4
	.word	0x24480003	! t0_kref+0x4594:   	ble,a,pt	%icc, _kref+0x45a0
	.word	0x94f5e32e	! t0_kref+0x4598:   	udivcc	%l7, 0x32e, %o2
	.word	0xb7a018ce	! t0_kref+0x459c:   	fdtos	%f14, %f27
	.word	0x81d92650	! t0_kref+0x45a0:   	flush	%g4 + 0x650
	.word	0x988a4016	! t0_kref+0x45a4:   	andcc	%o1, %l6, %o4
	.word	0xb5a0012f	! t0_kref+0x45a8:   	fabss	%f15, %f26
	.word	0xad418000	! t0_kref+0x45ac:   	mov	%fprs, %l6
	.word	0xaba00532	! t0_kref+0x45b0:   	fsqrts	%f18, %f21
	.word	0xa8d82eda	! t0_kref+0x45b4:   	smulcc	%g0, 0xeda, %l4
	.word	0x9ba40836	! t0_kref+0x45b8:   	fadds	%f16, %f22, %f13
	.word	0xd840a03c	! t0_kref+0x45bc:   	ldsw	[%g2 + 0x3c], %o4
	.word	0x98ddc00a	! t0_kref+0x45c0:   	smulcc	%l7, %o2, %o4
	.word	0xd0060000	! t0_kref+0x45c4:   	ld	[%i0], %o0
	.word	0xaa2b0015	! t0_kref+0x45c8:   	andn	%o4, %l5, %l5
	.word	0xa52b0008	! t0_kref+0x45cc:   	sll	%o4, %o0, %l2
	.word	0x2e480001	! t0_kref+0x45d0:   	bvs,a,pt	%icc, _kref+0x45d4
	.word	0x929aeca9	! t0_kref+0x45d4:   	xorcc	%o3, 0xca9, %o1
	.word	0xbdb506be	! t0_kref+0x45d8:   	fmul8x16al	%f20, %f30, %f30
	.word	0x24480006	! t0_kref+0x45dc:   	ble,a,pt	%icc, _kref+0x45f4
	.word	0x968271ca	! t0_kref+0x45e0:   	addcc	%o1, -0xe36, %o3
	.word	0xa52b6015	! t0_kref+0x45e4:   	sll	%o5, 0x15, %l2
	.word	0xb7a01a37	! t0_kref+0x45e8:   	fstoi	%f23, %f27
	.word	0x99b605d8	! t0_kref+0x45ec:   	fcmpeq32	%f24, %f24, %o4
	.word	0xd4366002	! t0_kref+0x45f0:   	sth	%o2, [%i1 + 2]
	.word	0xa9a0190c	! t0_kref+0x45f4:   	fitod	%f12, %f20
	.word	0xdaa0a004	! t0_kref+0x45f8:   	sta	%o5, [%g2 + 4]%asi
	.word	0xc0066000	! t0_kref+0x45fc:   	ld	[%i1], %g0
	.word	0x9de3bfa0	! t0_kref+0x4600:   	save	%sp, -0x60, %sp
	.word	0xb29e2e67	! t0_kref+0x4604:   	xorcc	%i0, 0xe67, %i1
	.word	0xa9ee0018	! t0_kref+0x4608:   	restore	%i0, %i0, %l4
	.word	0x94f68015	! t0_kref+0x460c:   	udivcc	%i2, %l5, %o2
	.word	0xda4e3fe0	! t0_kref+0x4610:   	ldsb	[%i0 - 0x20], %o5
	.word	0xabb24177	! t0_kref+0x4614:   	edge32ln	%o1, %l7, %l5
	.word	0x96bd400c	! t0_kref+0x4618:   	xnorcc	%l5, %o4, %o3
	.word	0x81ac0ade	! t0_kref+0x461c:   	fcmped	%fcc0, %f16, %f30
	.word	0xe5270018	! t0_kref+0x4620:   	st	%f18, [%i4 + %i0]
	.word	0xa9ab0054	! t0_kref+0x4624:   	fmovduge	%fcc0, %f20, %f20
	.word	0x94b2400b	! t0_kref+0x4628:   	orncc	%o1, %o3, %o2
	.word	0x81ab4a30	! t0_kref+0x462c:   	fcmps	%fcc0, %f13, %f16
	.word	0xa620000c	! t0_kref+0x4630:   	neg	%o4, %l3
	.word	0xa7a00538	! t0_kref+0x4634:   	fsqrts	%f24, %f19
	.word	0xa5b58f54	! t0_kref+0x4638:   	fornot1	%f22, %f20, %f18
	.word	0xd290a016	! t0_kref+0x463c:   	lduha	[%g2 + 0x16]%asi, %o1
	.word	0xe67e401c	! t0_kref+0x4640:   	swap	[%i1 + %i4], %l3
	.word	0xe44e7fe8	! t0_kref+0x4644:   	ldsb	[%i1 - 0x18], %l2
	.word	0xa1b4c716	! t0_kref+0x4648:   	fmuld8sux16	%f19, %f22, %f16
	.word	0x9a1a231a	! t0_kref+0x464c:   	xor	%o0, 0x31a, %o5
	.word	0x91408000	! t0_kref+0x4650:   	mov	%ccr, %o0
	.word	0xee066000	! t0_kref+0x4654:   	ld	[%i1], %l7
	.word	0x99a01931	! t0_kref+0x4658:   	fstod	%f17, %f12
	.word	0xb5b48a96	! t0_kref+0x465c:   	fpsub16	%f18, %f22, %f26
	.word	0x9ba000ba	! t0_kref+0x4660:   	fnegs	%f26, %f13
	.word	0xd228a01a	! t0_kref+0x4664:   	stb	%o1, [%g2 + 0x1a]
	.word	0xb9a000b8	! t0_kref+0x4668:   	fnegs	%f24, %f28
	.word	0xe67e7fe4	! t0_kref+0x466c:   	swap	[%i1 - 0x1c], %l3
	.word	0x901db833	! t0_kref+0x4670:   	xor	%l6, -0x7cd, %o0
	.word	0xa4a2c016	! t0_kref+0x4674:   	subcc	%o3, %l6, %l2
	.word	0x9ae2e4be	! t0_kref+0x4678:   	subccc	%o3, 0x4be, %o5
	.word	0x2c800003	! t0_kref+0x467c:   	bneg,a	_kref+0x4688
	.word	0x9a72bce1	! t0_kref+0x4680:   	udiv	%o2, -0x31f, %o5
	.word	0xae26afb0	! t0_kref+0x4684:   	sub	%i2, 0xfb0, %l7
	.word	0x27275b62	! t0_kref+0x4688:   	sethi	%hi(0x9d6d8800), %l3
	.word	0xb1a0055c	! t0_kref+0x468c:   	fsqrtd	%f28, %f24
	.word	0x8115e052	! t0_kref+0x4690:   	taddcctv	%l7, 0x52, %g0
	.word	0xa9b54016	! t0_kref+0x4694:   	edge8	%l5, %l6, %l4
	.word	0xa932400c	! t0_kref+0x4698:   	srl	%o1, %o4, %l4
	.word	0xada00552	! t0_kref+0x469c:   	fsqrtd	%f18, %f22
	.word	0x83414000	! t0_kref+0x46a0:   	mov	%pc, %g1
	.word	0xa3a00037	! t0_kref+0x46a4:   	fmovs	%f23, %f17
	call	SYM(t0_subr1)
	.word	0xf7270018	! t0_kref+0x46ac:   	st	%f27, [%i4 + %i0]
	.word	0xa3b64dee	! t0_kref+0x46b0:   	fnands	%f25, %f14, %f17
	.word	0x2b800008	! t0_kref+0x46b4:   	fbug,a	_kref+0x46d4
	.word	0xfba0a030	! t0_kref+0x46b8:   	sta	%f29, [%g2 + 0x30]%asi
	.word	0xe6c8a016	! t0_kref+0x46bc:   	ldsba	[%g2 + 0x16]%asi, %l3
	.word	0xa8934015	! t0_kref+0x46c0:   	orcc	%o5, %l5, %l4
	.word	0x2c480005	! t0_kref+0x46c4:   	bneg,a,pt	%icc, _kref+0x46d8
	.word	0xa6db24f0	! t0_kref+0x46c8:   	smulcc	%o4, 0x4f0, %l3
	.word	0x9222c017	! t0_kref+0x46cc:   	sub	%o3, %l7, %o1
	.word	0x81ae4a3d	! t0_kref+0x46d0:   	fcmps	%fcc0, %f25, %f29
	.word	0x9fc00004	! t0_kref+0x46d4:   	call	%g0 + %g4
	.word	0x9fb50cb8	! t0_kref+0x46d8:   	fandnot2s	%f20, %f24, %f15
	.word	0xaf400000	! t0_kref+0x46dc:   	mov	%y, %l7
	.word	0x28480007	! t0_kref+0x46e0:   	bleu,a,pt	%icc, _kref+0x46fc
	.word	0xd8ce5000	! t0_kref+0x46e4:   	ldsba	[%i1]0x80, %o4
	.word	0x9e730008	! t0_kref+0x46e8:   	udiv	%o4, %o0, %o7
	.word	0x8185c000	! t0_kref+0x46ec:   	wr	%l7, %g0, %y
	.word	0xadb60edc	! t0_kref+0x46f0:   	fornot2	%f24, %f28, %f22
	.word	0xe326001c	! t0_kref+0x46f4:   	st	%f17, [%i0 + %i4]
	.word	0xeb066000	! t0_kref+0x46f8:   	ld	[%i1], %f21
	.word	0xe2780018	! t0_kref+0x46fc:   	swap	[%g0 + %i0], %l1
	.word	0xd88e7ff2	! t0_kref+0x4700:   	lduba	[%i1 - 0xe]%asi, %o4
	.word	0xaba0012e	! t0_kref+0x4704:   	fabss	%f14, %f21
	.word	0xa825ec81	! t0_kref+0x4708:   	sub	%l7, 0xc81, %l4
	.word	0xe27e6010	! t0_kref+0x470c:   	swap	[%i1 + 0x10], %l1
	.word	0xa5408000	! t0_kref+0x4710:   	mov	%ccr, %l2
	.word	0xbda00130	! t0_kref+0x4714:   	fabss	%f16, %f30
	.word	0x805a800c	! t0_kref+0x4718:   	smul	%o2, %o4, %g0
	.word	0xb5a01a36	! t0_kref+0x471c:   	fstoi	%f22, %f26
	.word	0x93130008	! t0_kref+0x4720:   	taddcctv	%o4, %o0, %o1
	.word	0x99b00c00	! t0_kref+0x4724:   	fzero	%f12
	.word	0xafb38d60	! t0_kref+0x4728:   	fnot1s	%f14, %f23
	.word	0xb9a448ad	! t0_kref+0x472c:   	fsubs	%f17, %f13, %f28
	.word	0xaebd7a3e	! t0_kref+0x4730:   	xnorcc	%l5, -0x5c2, %l7
	.word	0xa436a68a	! t0_kref+0x4734:   	orn	%i2, 0x68a, %l2
	.word	0x9fc00004	! t0_kref+0x4738:   	call	%g0 + %g4
	.word	0xa9a01913	! t0_kref+0x473c:   	fitod	%f19, %f20
	.word	0xbda018d6	! t0_kref+0x4740:   	fdtos	%f22, %f30
	.word	0xb9a0190f	! t0_kref+0x4744:   	fitod	%f15, %f28
	.word	0xac5a0008	! t0_kref+0x4748:   	smul	%o0, %o0, %l6
	.word	0xb5b68cb7	! t0_kref+0x474c:   	fandnot2s	%f26, %f23, %f26
	.word	0xae72000a	! t0_kref+0x4750:   	udiv	%o0, %o2, %l7
	.word	0x9a757e8f	! t0_kref+0x4754:   	udiv	%l5, -0x171, %o5
	.word	0xada0192c	! t0_kref+0x4758:   	fstod	%f12, %f22
	.word	0x28800001	! t0_kref+0x475c:   	bleu,a	_kref+0x4760
	.word	0xb1b68c54	! t0_kref+0x4760:   	fnor	%f26, %f20, %f24
	.word	0xb1b40ada	! t0_kref+0x4764:   	fpsub32	%f16, %f26, %f24
	.word	0x805a39a7	! t0_kref+0x4768:   	smul	%o0, -0x659, %g0
	.word	0x0120da51	! t0_kref+0x476c:   	sethi	%hi(0x83694400), %g0
	.word	0xb9a00552	! t0_kref+0x4770:   	fsqrtd	%f18, %f28
	.word	0x99b406da	! t0_kref+0x4774:   	fmul8sux16	%f16, %f26, %f12
	.word	0xe9be1a1d	! t0_kref+0x4778:   	stda	%f20, [%i0 + %i5]0xd0
	.word	0xaba5c83d	! t0_kref+0x477c:   	fadds	%f23, %f29, %f21
	.word	0xa9b28200	! t0_kref+0x4780:   	array8	%o2, %g0, %l4
	.word	0xee30a018	! t0_kref+0x4784:   	sth	%l7, [%g2 + 0x18]
	.word	0xbda0188e	! t0_kref+0x4788:   	fitos	%f14, %f30
	.word	0x99a0054c	! t0_kref+0x478c:   	fsqrtd	%f12, %f12
	.word	0xed1e3ff8	! t0_kref+0x4790:   	ldd	[%i0 - 8], %f22
	.word	0x38800001	! t0_kref+0x4794:   	bgu,a	_kref+0x4798
	.word	0xb5a588d4	! t0_kref+0x4798:   	fsubd	%f22, %f20, %f26
	.word	0xeeb0a024	! t0_kref+0x479c:   	stha	%l7, [%g2 + 0x24]%asi
	.word	0x920b400d	! t0_kref+0x47a0:   	and	%o5, %o5, %o1
	.word	0x94aaaee4	! t0_kref+0x47a4:   	andncc	%o2, 0xee4, %o2
	.word	0xf5a0a03c	! t0_kref+0x47a8:   	sta	%f26, [%g2 + 0x3c]%asi
	.word	0xf56e001a	! t0_kref+0x47ac:   	prefetch	%i0 + %i2, 26
	.word	0x9aab000b	! t0_kref+0x47b0:   	andncc	%o4, %o3, %o5
	.word	0x961a76bb	! t0_kref+0x47b4:   	xor	%o1, -0x945, %o3
	.word	0xc807bfec	! t0_kref+0x47b8:   	ld	[%fp - 0x14], %g4
	.word	0x960a400d	! t0_kref+0x47bc:   	and	%o1, %o5, %o3
	.word	0xd24e8018	! t0_kref+0x47c0:   	ldsb	[%i2 + %i0], %o1
	.word	0xe7ee101b	! t0_kref+0x47c4:   	prefetcha	%i0 + %i3, 19
	.word	0x9463400c	! t0_kref+0x47c8:   	subc	%o5, %o4, %o2
	.word	0xafb30200	! t0_kref+0x47cc:   	array8	%o4, %g0, %l7
	.word	0xd24e3fe9	! t0_kref+0x47d0:   	ldsb	[%i0 - 0x17], %o1
	.word	0xc36e400d	! t0_kref+0x47d4:   	prefetch	%i1 + %o5, 1
	call	SYM(t0_subr3)
	.word	0xbda8005c	! t0_kref+0x47dc:   	fmovdn	%fcc0, %f28, %f30
	.word	0x9da3893d	! t0_kref+0x47e0:   	fmuls	%f14, %f29, %f14
	.word	0xe440a030	! t0_kref+0x47e4:   	ldsw	[%g2 + 0x30], %l2
	.word	0xe4563ff2	! t0_kref+0x47e8:   	ldsh	[%i0 - 0xe], %l2
	.word	0x35800006	! t0_kref+0x47ec:   	fbue,a	_kref+0x4804
	.word	0x9bb38e3b	! t0_kref+0x47f0:   	fands	%f14, %f27, %f13
	.word	0x8185c000	! t0_kref+0x47f4:   	wr	%l7, %g0, %y
	.word	0x99224015	! t0_kref+0x47f8:   	mulscc	%o1, %l5, %o4
	.word	0xd44e8018	! t0_kref+0x47fc:   	ldsb	[%i2 + %i0], %o2
	.word	0x9515a763	! t0_kref+0x4800:   	taddcctv	%l6, 0x763, %o2
	.word	0xd890a008	! t0_kref+0x4804:   	lduha	[%g2 + 8]%asi, %o4
	.word	0xa61af177	! t0_kref+0x4808:   	xor	%o3, -0xe89, %l3
	.word	0x81de3f8f	! t0_kref+0x480c:   	flush	%i0 - 0x71
	.word	0xa782401a	! t0_kref+0x4810:   	wr	%o1, %i2, %gsr
	.word	0xe5a0a038	! t0_kref+0x4814:   	sta	%f18, [%g2 + 0x38]%asi
	.word	0xeca8a02a	! t0_kref+0x4818:   	stba	%l6, [%g2 + 0x2a]%asi
	.word	0x86102016	! t0_kref+0x481c:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x4820:   	subcc	%g3, 1, %g3
	.word	0x22800016	! t0_kref+0x4824:   	be,a	_kref+0x487c
	.word	0x9825f6b6	! t0_kref+0x4828:   	sub	%l7, -0x94a, %o4
	.word	0x27bffffd	! t0_kref+0x482c:   	fbul,a	_kref+0x4820
	.word	0xaba01a2d	! t0_kref+0x4830:   	fstoi	%f13, %f21
	.word	0xaa26b1e3	! t0_kref+0x4834:   	sub	%i2, -0xe1d, %l5
	.word	0xdbe65000	! t0_kref+0x4838:   	casa	[%i1]0x80, %g0, %o5
	.word	0xea367fea	! t0_kref+0x483c:   	sth	%l5, [%i1 - 0x16]
	.word	0x2abffff8	! t0_kref+0x4840:   	bcs,a	_kref+0x4820
	.word	0x96956f03	! t0_kref+0x4844:   	orcc	%l5, 0xf03, %o3
	.word	0x93b5c30c	! t0_kref+0x4848:   	alignaddr	%l7, %o4, %o1
	.word	0xd8a8a008	! t0_kref+0x484c:   	stba	%o4, [%g2 + 8]%asi
	.word	0xd0b0a01a	! t0_kref+0x4850:   	stha	%o0, [%g2 + 0x1a]%asi
	.word	0xdb20a030	! t0_kref+0x4854:   	st	%f13, [%g2 + 0x30]
	.word	0xa7b00fe0	! t0_kref+0x4858:   	fones	%f19
	.word	0xa8234015	! t0_kref+0x485c:   	sub	%o5, %l5, %l4
	.word	0x81dee3c0	! t0_kref+0x4860:   	flush	%i3 + 0x3c0
	.word	0x20480005	! t0_kref+0x4864:   	bn,a,pt	%icc, _kref+0x4878
	.word	0x80ab000a	! t0_kref+0x4868:   	andncc	%o4, %o2, %g0
	.word	0xd07e7ff0	! t0_kref+0x486c:   	swap	[%i1 - 0x10], %o0
	.word	0x2d1347e9	! t0_kref+0x4870:   	sethi	%hi(0x4d1fa400), %l6
	.word	0xada01a58	! t0_kref+0x4874:   	fdtoi	%f24, %f22
	.word	0x8115c000	! t0_kref+0x4878:   	taddcctv	%l7, %g0, %g0
	.word	0xd428a005	! t0_kref+0x487c:   	stb	%o2, [%g2 + 5]
	.word	0xa9a5482e	! t0_kref+0x4880:   	fadds	%f21, %f14, %f20
	.word	0xe27e001c	! t0_kref+0x4884:   	swap	[%i0 + %i4], %l1
	.word	0xdd1fbda8	! t0_kref+0x4888:   	ldd	[%fp - 0x258], %f14
	.word	0xd026401c	! t0_kref+0x488c:   	st	%o0, [%i1 + %i4]
	.word	0xe8c81019	! t0_kref+0x4890:   	ldsba	[%g0 + %i1]0x80, %l4
	.word	0xa41ac009	! t0_kref+0x4894:   	xor	%o3, %o1, %l2
	call	SYM(t0_subr1)
	.word	0xf1200019	! t0_kref+0x489c:   	st	%f24, [%g0 + %i1]
	.word	0xb5b606dc	! t0_kref+0x48a0:   	fmul8sux16	%f24, %f28, %f26
	.word	0xac1aaca8	! t0_kref+0x48a4:   	xor	%o2, 0xca8, %l6
	.word	0xedee101c	! t0_kref+0x48a8:   	prefetcha	%i0 + %i4, 22
	.word	0xc5ee5015	! t0_kref+0x48ac:   	prefetcha	%i1 + %l5, 2
	.word	0x8143e040	! t0_kref+0x48b0:   	membar	0x40
	.word	0xd9f6500a	! t0_kref+0x48b4:   	casxa	[%i1]0x80, %o2, %o4
	.word	0xa5b34abc	! t0_kref+0x48b8:   	fpsub16s	%f13, %f28, %f18
	.word	0xc16e0015	! t0_kref+0x48bc:   	prefetch	%i0 + %l5, 0
	.word	0x8092400b	! t0_kref+0x48c0:   	orcc	%o1, %o3, %g0
	.word	0xae65e0f1	! t0_kref+0x48c4:   	subc	%l7, 0xf1, %l7
	.word	0xa4aac01a	! t0_kref+0x48c8:   	andncc	%o3, %i2, %l2
	.word	0xa3b34a71	! t0_kref+0x48cc:   	fpadd32s	%f13, %f17, %f17
	.word	0xe9a0a028	! t0_kref+0x48d0:   	sta	%f20, [%g2 + 0x28]%asi
	.word	0xa682800a	! t0_kref+0x48d4:   	addcc	%o2, %o2, %l3
	.word	0xa1a01912	! t0_kref+0x48d8:   	fitod	%f18, %f16
	.word	0xea066008	! t0_kref+0x48dc:   	ld	[%i1 + 8], %l5
	.word	0xaa58234d	! t0_kref+0x48e0:   	smul	%g0, 0x34d, %l5
	.word	0xafb34af0	! t0_kref+0x48e4:   	fpsub32s	%f13, %f16, %f23
	.word	0x9da000bc	! t0_kref+0x48e8:   	fnegs	%f28, %f14
	.word	0x9832800b	! t0_kref+0x48ec:   	orn	%o2, %o3, %o4
	.word	0xa4922ea0	! t0_kref+0x48f0:   	orcc	%o0, 0xea0, %l2
	.word	0xe9ee501c	! t0_kref+0x48f4:   	prefetcha	%i1 + %i4, 20
	.word	0x9ef22f90	! t0_kref+0x48f8:   	udivcc	%o0, 0xf90, %o7
	.word	0x90e36e63	! t0_kref+0x48fc:   	subccc	%o5, 0xe63, %o0
	.word	0x83414000	! t0_kref+0x4900:   	mov	%pc, %g1
	.word	0x9613689c	! t0_kref+0x4904:   	or	%o5, 0x89c, %o3
	.word	0xd01e2000	! t0_kref+0x4908:   	ldd	[%i0], %o0
	.word	0x173cd434	! t0_kref+0x490c:   	sethi	%hi(0xf350d000), %o3
	.word	0xf11e001d	! t0_kref+0x4910:   	ldd	[%i0 + %i5], %f24
	.word	0x94e5f43d	! t0_kref+0x4914:   	subccc	%l7, -0xbc3, %o2
	.word	0xa9a0054e	! t0_kref+0x4918:   	fsqrtd	%f14, %f20
	.word	0xe91fbf50	! t0_kref+0x491c:   	ldd	[%fp - 0xb0], %f20
	.word	0xafa01a5c	! t0_kref+0x4920:   	fdtoi	%f28, %f23
	.word	0x9bb54aed	! t0_kref+0x4924:   	fpsub32s	%f21, %f13, %f13
	.word	0xa8b58017	! t0_kref+0x4928:   	orncc	%l6, %l7, %l4
	.word	0xee062010	! t0_kref+0x492c:   	ld	[%i0 + 0x10], %l7
	.word	0xadb507d0	! t0_kref+0x4930:   	pdist	%f20, %f16, %f22
	.word	0xea08a03a	! t0_kref+0x4934:   	ldub	[%g2 + 0x3a], %l5
	.word	0x9da508d0	! t0_kref+0x4938:   	fsubd	%f20, %f16, %f14
	.word	0xadb60719	! t0_kref+0x493c:   	fmuld8sux16	%f24, %f25, %f22
	.word	0xe9be5816	! t0_kref+0x4940:   	stda	%f20, [%i1 + %l6]0xc0
	.word	0xb7b5ca39	! t0_kref+0x4944:   	fpadd16s	%f23, %f25, %f27
	.word	0xaa0aabd9	! t0_kref+0x4948:   	and	%o2, 0xbd9, %l5
	.word	0xd090a01c	! t0_kref+0x494c:   	lduha	[%g2 + 0x1c]%asi, %o0
	.word	0x8143c000	! t0_kref+0x4950:   	stbar
	.word	0x81af0a52	! t0_kref+0x4954:   	fcmpd	%fcc0, %f28, %f18
	.word	0xd25e001d	! t0_kref+0x4958:   	ldx	[%i0 + %i5], %o1
	.word	0xa5a0053c	! t0_kref+0x495c:   	fsqrts	%f28, %f18
	.word	0x92024017	! t0_kref+0x4960:   	add	%o1, %l7, %o1
	.word	0xe126401c	! t0_kref+0x4964:   	st	%f16, [%i1 + %i4]
	.word	0xab2a400c	! t0_kref+0x4968:   	sll	%o1, %o4, %l5
	.word	0x942b400a	! t0_kref+0x496c:   	andn	%o5, %o2, %o2
	.word	0xe8be3fe8	! t0_kref+0x4970:   	stda	%l4, [%i0 - 0x18]%asi
	.word	0x9822801a	! t0_kref+0x4974:   	sub	%o2, %i2, %o4
	.word	0x27800001	! t0_kref+0x4978:   	fbul,a	_kref+0x497c
	.word	0xa5a0193c	! t0_kref+0x497c:   	fstod	%f28, %f18
	.word	0xeef63fe8	! t0_kref+0x4980:   	stxa	%l7, [%i0 - 0x18]%asi
	.word	0xeb20a024	! t0_kref+0x4984:   	st	%f21, [%g2 + 0x24]
	.word	0x8143c000	! t0_kref+0x4988:   	stbar
	.word	0xd9a0a03c	! t0_kref+0x498c:   	sta	%f12, [%g2 + 0x3c]%asi
	call	SYM(t0_subr1)
	.word	0xeace7fe8	! t0_kref+0x4994:   	ldsba	[%i1 - 0x18]%asi, %l5
	.word	0x9ad57e22	! t0_kref+0x4998:   	umulcc	%l5, -0x1de, %o5
	.word	0xc12e3ff8	! t0_kref+0x499c:   	st	%fsr, [%i0 - 8]
	.word	0x95b2c04b	! t0_kref+0x49a0:   	edge8l	%o3, %o3, %o2
	.word	0x2c480006	! t0_kref+0x49a4:   	bneg,a,pt	%icc, _kref+0x49bc
	.word	0xd208a019	! t0_kref+0x49a8:   	ldub	[%g2 + 0x19], %o1
	.word	0x2f0ce491	! t0_kref+0x49ac:   	sethi	%hi(0x33924400), %l7
	.word	0xc807bfe8	! t0_kref+0x49b0:   	ld	[%fp - 0x18], %g4
	.word	0x9ee5e84d	! t0_kref+0x49b4:   	subccc	%l7, 0x84d, %o7
	.word	0x9fc10000	! t0_kref+0x49b8:   	call	%g4
	.word	0xaba01896	! t0_kref+0x49bc:   	fitos	%f22, %f21
	.word	0xa5b50558	! t0_kref+0x49c0:   	fcmpeq16	%f20, %f24, %l2
	.word	0xb7a0053b	! t0_kref+0x49c4:   	fsqrts	%f27, %f27
	.word	0xbba01a4c	! t0_kref+0x49c8:   	fdtoi	%f12, %f29
	.word	0xb1a000b5	! t0_kref+0x49cc:   	fnegs	%f21, %f24
	.word	0xa7a01a56	! t0_kref+0x49d0:   	fdtoi	%f22, %f19
	.word	0x80a00000	! t0_kref+0x49d4:   	cmp	%g0, %g0
	.word	0x20800005	! t0_kref+0x49d8:   	bn,a	_kref+0x49ec
	.word	0x81db39c8	! t0_kref+0x49dc:   	flush	%o4 - 0x638
	.word	0xfb06401c	! t0_kref+0x49e0:   	ld	[%i1 + %i4], %f29
	.word	0x9e08000a	! t0_kref+0x49e4:   	and	%g0, %o2, %o7
	.word	0xfd80a034	! t0_kref+0x49e8:   	lda	[%g2 + 0x34]%asi, %f30
	.word	0x3c800008	! t0_kref+0x49ec:   	bpos,a	_kref+0x4a0c
	.word	0xa9a54837	! t0_kref+0x49f0:   	fadds	%f21, %f23, %f20
	.word	0x8143c000	! t0_kref+0x49f4:   	stbar
	.word	0xae5ea5c8	! t0_kref+0x49f8:   	smul	%i2, 0x5c8, %l7
	.word	0xa5b34a72	! t0_kref+0x49fc:   	fpadd32s	%f13, %f18, %f18
	.word	0xb9a00535	! t0_kref+0x4a00:   	fsqrts	%f21, %f28
	.word	0x36480002	! t0_kref+0x4a04:   	bge,a,pt	%icc, _kref+0x4a0c
	.word	0xa71264f0	! t0_kref+0x4a08:   	taddcctv	%o1, 0x4f0, %l3
	.word	0xada01a3c	! t0_kref+0x4a0c:   	fstoi	%f28, %f22
	.word	0xf1ee101d	! t0_kref+0x4a10:   	prefetcha	%i0 + %i5, 24
	.word	0xa72dc01a	! t0_kref+0x4a14:   	sll	%l7, %i2, %l3
	.word	0xf5ee501b	! t0_kref+0x4a18:   	prefetcha	%i1 + %i3, 26
	.word	0xe408a02c	! t0_kref+0x4a1c:   	ldub	[%g2 + 0x2c], %l2
	.word	0x99a0191b	! t0_kref+0x4a20:   	fitod	%f27, %f12
	.word	0x9fa01893	! t0_kref+0x4a24:   	fitos	%f19, %f15
	.word	0x34800004	! t0_kref+0x4a28:   	bg,a	_kref+0x4a38
	.word	0xaa9b000a	! t0_kref+0x4a2c:   	xorcc	%o4, %o2, %l5
	.word	0xa42a8000	! t0_kref+0x4a30:   	andn	%o2, %g0, %l2
	.word	0xb3a000b5	! t0_kref+0x4a34:   	fnegs	%f21, %f25
	.word	0x9ba01a5e	! t0_kref+0x4a38:   	fdtoi	%f30, %f13
	.word	0x90ad8017	! t0_kref+0x4a3c:   	andncc	%l6, %l7, %o0
	.word	0x91322011	! t0_kref+0x4a40:   	srl	%o0, 0x11, %o0
	.word	0xd48e9018	! t0_kref+0x4a44:   	lduba	[%i2 + %i0]0x80, %o2
	.word	0xa9a58d3e	! t0_kref+0x4a48:   	fsmuld	%f22, %f30, %f20
	.word	0xf1be180b	! t0_kref+0x4a4c:   	stda	%f24, [%i0 + %o3]0xc0
	.word	0xb9a30936	! t0_kref+0x4a50:   	fmuls	%f12, %f22, %f28
	call	SYM(t0_subr0)
	.word	0xa8700008	! t0_kref+0x4a58:   	udiv	%g0, %o0, %l4
	.word	0x803b7511	! t0_kref+0x4a5c:   	xnor	%o5, -0xaef, %g0
	.word	0x81ab0ad2	! t0_kref+0x4a60:   	fcmped	%fcc0, %f12, %f18
	.word	0xaebb6ba1	! t0_kref+0x4a64:   	xnorcc	%o5, 0xba1, %l7
	.word	0x92180008	! t0_kref+0x4a68:   	xor	%g0, %o0, %o1
	.word	0x9486800b	! t0_kref+0x4a6c:   	addcc	%i2, %o3, %o2
	.word	0xeb6e401c	! t0_kref+0x4a70:   	prefetch	%i1 + %i4, 21
	.word	0x80e5a84e	! t0_kref+0x4a74:   	subccc	%l6, 0x84e, %g0
	.word	0x94b5c00b	! t0_kref+0x4a78:   	orncc	%l7, %o3, %o2
	call	SYM(t0_subr0)
	.word	0xc0400019	! t0_kref+0x4a80:   	ldsw	[%g0 + %i1], %g0
	.word	0xb9a408b9	! t0_kref+0x4a84:   	fsubs	%f16, %f25, %f28
	.word	0xaaa3000d	! t0_kref+0x4a88:   	subcc	%o4, %o5, %l5
	.word	0xea262014	! t0_kref+0x4a8c:   	st	%l5, [%i0 + 0x14]
	.word	0x81ae4a3a	! t0_kref+0x4a90:   	fcmps	%fcc0, %f25, %f26
	.word	0xd436c019	! t0_kref+0x4a94:   	sth	%o2, [%i3 + %i1]
	.word	0xe440a014	! t0_kref+0x4a98:   	ldsw	[%g2 + 0x14], %l2
	.word	0x83414000	! t0_kref+0x4a9c:   	mov	%pc, %g1
	.word	0xe1263fe4	! t0_kref+0x4aa0:   	st	%f16, [%i0 - 0x1c]
	.word	0xdd9e2000	! t0_kref+0x4aa4:   	ldda	[%i0]%asi, %f14
	.word	0xb1b78e80	! t0_kref+0x4aa8:   	fsrc1	%f30, %f24
	.word	0xa5400000	! t0_kref+0x4aac:   	mov	%y, %l2
	.word	0x8143e040	! t0_kref+0x4ab0:   	membar	0x40
	.word	0xadb00c00	! t0_kref+0x4ab4:   	fzero	%f22
	.word	0x31800003	! t0_kref+0x4ab8:   	fba,a	_kref+0x4ac4
	.word	0x922a800d	! t0_kref+0x4abc:   	andn	%o2, %o5, %o1
	.word	0x91b34300	! t0_kref+0x4ac0:   	alignaddr	%o5, %g0, %o0
	.word	0x9f280015	! t0_kref+0x4ac4:   	sll	%g0, %l5, %o7
	.word	0xbdb48979	! t0_kref+0x4ac8:   	fpmerge	%f18, %f25, %f30
	.word	0xf5ee501c	! t0_kref+0x4acc:   	prefetcha	%i1 + %i4, 26
	.word	0x9fc00004	! t0_kref+0x4ad0:   	call	%g0 + %g4
	.word	0xff6e3fe0	! t0_kref+0x4ad4:   	prefetch	%i0 - 0x20, 31
	.word	0xd66e001a	! t0_kref+0x4ad8:   	ldstub	[%i0 + %i2], %o3
	.word	0x9255a654	! t0_kref+0x4adc:   	umul	%l6, 0x654, %o1
	.word	0x2a800008	! t0_kref+0x4ae0:   	bcs,a	_kref+0x4b00
	.word	0xa8f28017	! t0_kref+0x4ae4:   	udivcc	%o2, %l7, %l4
	.word	0xae23000c	! t0_kref+0x4ae8:   	sub	%o4, %o4, %l7
	.word	0x28480005	! t0_kref+0x4aec:   	bleu,a,pt	%icc, _kref+0x4b00
	.word	0xd99e5a5d	! t0_kref+0x4af0:   	ldda	[%i1 + %i5]0xd2, %f12
	.word	0x3a800007	! t0_kref+0x4af4:   	bcc,a	_kref+0x4b10
	.word	0x8143e002	! t0_kref+0x4af8:   	membar	0x2
	.word	0x2b480007	! t0_kref+0x4afc:   	fbug,a,pt	%fcc0, _kref+0x4b18
	.word	0xe4067ff4	! t0_kref+0x4b00:   	ld	[%i1 - 0xc], %l2
	.word	0xb9a018dc	! t0_kref+0x4b04:   	fdtos	%f28, %f28
	.word	0x2c800004	! t0_kref+0x4b08:   	bneg,a	_kref+0x4b18
	.word	0xb9b48d16	! t0_kref+0x4b0c:   	fandnot1	%f18, %f22, %f28
	.word	0x113f9ae2	! t0_kref+0x4b10:   	sethi	%hi(0xfe6b8800), %o0
	.word	0xd2a0a004	! t0_kref+0x4b14:   	sta	%o1, [%g2 + 4]%asi
	.word	0xaf418000	! t0_kref+0x4b18:   	mov	%fprs, %l7
	.word	0xbba3883c	! t0_kref+0x4b1c:   	fadds	%f14, %f28, %f29
	.word	0xee30a036	! t0_kref+0x4b20:   	sth	%l7, [%g2 + 0x36]
	.word	0x92e26ce3	! t0_kref+0x4b24:   	subccc	%o1, 0xce3, %o1
	.word	0xb1b687cc	! t0_kref+0x4b28:   	pdist	%f26, %f12, %f24
	.word	0xb5b00cce	! t0_kref+0x4b2c:   	fnot2	%f14, %f26
	.word	0x2d800006	! t0_kref+0x4b30:   	fbg,a	_kref+0x4b48
	.word	0x90836908	! t0_kref+0x4b34:   	addcc	%o5, 0x908, %o0
	.word	0x34480005	! t0_kref+0x4b38:   	bg,a,pt	%icc, _kref+0x4b4c
	.word	0xdd20a014	! t0_kref+0x4b3c:   	st	%f14, [%g2 + 0x14]
	.word	0x9732e00f	! t0_kref+0x4b40:   	srl	%o3, 0xf, %o3
	.word	0x9fc10000	! t0_kref+0x4b44:   	call	%g4
	.word	0x9072aa71	! t0_kref+0x4b48:   	udiv	%o2, 0xa71, %o0
	call	SYM(t0_subr2)
	.word	0xb1a0054c	! t0_kref+0x4b50:   	fsqrtd	%f12, %f24
	.word	0xac75eb30	! t0_kref+0x4b54:   	udiv	%l7, 0xb30, %l6
	.word	0xee26001c	! t0_kref+0x4b58:   	st	%l7, [%i0 + %i4]
	.word	0x2e480003	! t0_kref+0x4b5c:   	bvs,a,pt	%icc, _kref+0x4b68
	.word	0xb1a68852	! t0_kref+0x4b60:   	faddd	%f26, %f18, %f24
	.word	0x99a01910	! t0_kref+0x4b64:   	fitod	%f16, %f12
	.word	0xea36c018	! t0_kref+0x4b68:   	sth	%l5, [%i3 + %i0]
	.word	0xaa5a30e2	! t0_kref+0x4b6c:   	smul	%o0, -0xf1e, %l5
	.word	0xa40ac00d	! t0_kref+0x4b70:   	and	%o3, %o5, %l2
	.word	0x2b800003	! t0_kref+0x4b74:   	fbug,a	_kref+0x4b80
	.word	0xf1be584a	! t0_kref+0x4b78:   	stda	%f24, [%i1 + %o2]0xc2
	.word	0x99234015	! t0_kref+0x4b7c:   	mulscc	%o5, %l5, %o4
	.word	0xb1b4ca2d	! t0_kref+0x4b80:   	fpadd16s	%f19, %f13, %f24
	.word	0xe83e401d	! t0_kref+0x4b84:   	std	%l4, [%i1 + %i5]
	.word	0xa3b3cdf1	! t0_kref+0x4b88:   	fnands	%f15, %f17, %f17
	.word	0x81dfb532	! t0_kref+0x4b8c:   	flush	%fp - 0xace
	.word	0xac923e96	! t0_kref+0x4b90:   	orcc	%o0, -0x16a, %l6
	.word	0x22800006	! t0_kref+0x4b94:   	be,a	_kref+0x4bac
	.word	0x965aed75	! t0_kref+0x4b98:   	smul	%o3, 0xd75, %o3
	.word	0xa6403f0b	! t0_kref+0x4b9c:   	addc	%g0, -0xf5, %l3
	.word	0xc0480019	! t0_kref+0x4ba0:   	ldsb	[%g0 + %i1], %g0
	.word	0xeaae3ff5	! t0_kref+0x4ba4:   	stba	%l5, [%i0 - 0xb]%asi
	.word	0xb5b58adc	! t0_kref+0x4ba8:   	fpsub32	%f22, %f28, %f26
	.word	0xd428a033	! t0_kref+0x4bac:   	stb	%o2, [%g2 + 0x33]
	.word	0xe406001c	! t0_kref+0x4bb0:   	ld	[%i0 + %i4], %l2
	.word	0xed1e7fe8	! t0_kref+0x4bb4:   	ldd	[%i1 - 0x18], %f22
	.word	0xe448a036	! t0_kref+0x4bb8:   	ldsb	[%g2 + 0x36], %l2
	.word	0xd4ce1000	! t0_kref+0x4bbc:   	ldsba	[%i0]0x80, %o2
	.word	0xe5267ffc	! t0_kref+0x4bc0:   	st	%f18, [%i1 - 4]
	.word	0xb1a4084e	! t0_kref+0x4bc4:   	faddd	%f16, %f14, %f24
	.word	0x3d480008	! t0_kref+0x4bc8:   	fbule,a,pt	%fcc0, _kref+0x4be8
	.word	0x9b02a64d	! t0_kref+0x4bcc:   	taddcc	%o2, 0x64d, %o5
	.word	0xaa1ac009	! t0_kref+0x4bd0:   	xor	%o3, %o1, %l5
	.word	0xd2270018	! t0_kref+0x4bd4:   	st	%o1, [%i4 + %i0]
	.word	0xab2031e8	! t0_kref+0x4bd8:   	mulscc	%g0, -0xe18, %l5
	.word	0xb9a000b7	! t0_kref+0x4bdc:   	fnegs	%f23, %f28
	.word	0xb5b38ab9	! t0_kref+0x4be0:   	fpsub16s	%f14, %f25, %f26
	.word	0xb5a01916	! t0_kref+0x4be4:   	fitod	%f22, %f26
	.word	0xe84e201b	! t0_kref+0x4be8:   	ldsb	[%i0 + 0x1b], %l4
	.word	0xa4a5f033	! t0_kref+0x4bec:   	subcc	%l7, -0xfcd, %l2
	.word	0x989decf9	! t0_kref+0x4bf0:   	xorcc	%l7, 0xcf9, %o4
	.word	0xa92ac017	! t0_kref+0x4bf4:   	sll	%o3, %l7, %l4
	.word	0x2f480005	! t0_kref+0x4bf8:   	fbu,a,pt	%fcc0, _kref+0x4c0c
	.word	0xc807bfec	! t0_kref+0x4bfc:   	ld	[%fp - 0x14], %g4
	.word	0xd6b0a008	! t0_kref+0x4c00:   	stha	%o3, [%g2 + 8]%asi
	.word	0xf7200018	! t0_kref+0x4c04:   	st	%f27, [%g0 + %i0]
	.word	0xb1b00cdc	! t0_kref+0x4c08:   	fnot2	%f28, %f24
	.word	0xb1a01895	! t0_kref+0x4c0c:   	fitos	%f21, %f24
	.word	0xd830a008	! t0_kref+0x4c10:   	sth	%o4, [%g2 + 8]
	.word	0xac968016	! t0_kref+0x4c14:   	orcc	%i2, %l6, %l6
	.word	0xd2a63fe4	! t0_kref+0x4c18:   	sta	%o1, [%i0 - 0x1c]%asi
	.word	0xa41a400c	! t0_kref+0x4c1c:   	xor	%o1, %o4, %l2
	.word	0xae722429	! t0_kref+0x4c20:   	udiv	%o0, 0x429, %l7
	.word	0x94e54015	! t0_kref+0x4c24:   	subccc	%l5, %l5, %o2
	.word	0xb1b5c67b	! t0_kref+0x4c28:   	fmul8x16au	%f23, %f27, %f24
	.word	0x8143c000	! t0_kref+0x4c2c:   	stbar
	.word	0x36480002	! t0_kref+0x4c30:   	bge,a,pt	%icc, _kref+0x4c38
	.word	0xa7a788b4	! t0_kref+0x4c34:   	fsubs	%f30, %f20, %f19
	.word	0xaae2c00b	! t0_kref+0x4c38:   	subccc	%o3, %o3, %l5
	.word	0x9ba00533	! t0_kref+0x4c3c:   	fsqrts	%f19, %f13
	.word	0x81af4a3e	! t0_kref+0x4c40:   	fcmps	%fcc0, %f29, %f30
	.word	0x9ae336a2	! t0_kref+0x4c44:   	subccc	%o4, -0x95e, %o5
	.word	0xbda00554	! t0_kref+0x4c48:   	fsqrtd	%f20, %f30
	.word	0x81ab4a31	! t0_kref+0x4c4c:   	fcmps	%fcc0, %f13, %f17
	.word	0xaba00133	! t0_kref+0x4c50:   	fabss	%f19, %f21
	.word	0xa5a00552	! t0_kref+0x4c54:   	fsqrtd	%f18, %f18
	.word	0x33800007	! t0_kref+0x4c58:   	fbe,a	_kref+0x4c74
	.word	0x98c2800b	! t0_kref+0x4c5c:   	addccc	%o2, %o3, %o4
	.word	0xada000ce	! t0_kref+0x4c60:   	fnegd	%f14, %f22
	.word	0xf91fbc88	! t0_kref+0x4c64:   	ldd	[%fp - 0x378], %f28
	.word	0x9130200b	! t0_kref+0x4c68:   	srl	%g0, 0xb, %o0
	.word	0xa5257fbb	! t0_kref+0x4c6c:   	mulscc	%l5, -0x45, %l2
	.word	0x20800006	! t0_kref+0x4c70:   	bn,a	_kref+0x4c88
	.word	0xd91e3ff8	! t0_kref+0x4c74:   	ldd	[%i0 - 8], %f12
	.word	0xe93e7ff0	! t0_kref+0x4c78:   	std	%f20, [%i1 - 0x10]
	.word	0xa5b54aba	! t0_kref+0x4c7c:   	fpsub16s	%f21, %f26, %f18
	.word	0xee2e7fe5	! t0_kref+0x4c80:   	stb	%l7, [%i1 - 0x1b]
	.word	0x97302017	! t0_kref+0x4c84:   	srl	%g0, 0x17, %o3
	.word	0x99a000b0	! t0_kref+0x4c88:   	fnegs	%f16, %f12
	.word	0xd8270018	! t0_kref+0x4c8c:   	st	%o4, [%i4 + %i0]
	.word	0xe1263ff4	! t0_kref+0x4c90:   	st	%f16, [%i0 - 0xc]
	.word	0xea5f4019	! t0_kref+0x4c94:   	ldx	[%i5 + %i1], %l5
	.word	0xa7a5482f	! t0_kref+0x4c98:   	fadds	%f21, %f15, %f19
	.word	0x9da0054c	! t0_kref+0x4c9c:   	fsqrtd	%f12, %f14
	.word	0xb5a01a32	! t0_kref+0x4ca0:   	fstoi	%f18, %f26
	.word	0xa5b40e80	! t0_kref+0x4ca4:   	fsrc1	%f16, %f18
	.word	0xabb64cb6	! t0_kref+0x4ca8:   	fandnot2s	%f25, %f22, %f21
	.word	0x81d97a57	! t0_kref+0x4cac:   	flush	%g5 - 0x5a9
	.word	0x90700016	! t0_kref+0x4cb0:   	udiv	%g0, %l6, %o0
	.word	0xd290a016	! t0_kref+0x4cb4:   	lduha	[%g2 + 0x16]%asi, %o1
	.word	0xac9a8015	! t0_kref+0x4cb8:   	xorcc	%o2, %l5, %l6
	.word	0xa832000c	! t0_kref+0x4cbc:   	orn	%o0, %o4, %l4
	call	SYM(t0_subr1)
	.word	0xd81e001d	! t0_kref+0x4cc4:   	ldd	[%i0 + %i5], %o4
	.word	0xe81e3fe8	! t0_kref+0x4cc8:   	ldd	[%i0 - 0x18], %l4
	.word	0x9ba018da	! t0_kref+0x4ccc:   	fdtos	%f26, %f13
	.word	0xb5b00fc0	! t0_kref+0x4cd0:   	fone	%f26
	.word	0xd2363ffc	! t0_kref+0x4cd4:   	sth	%o1, [%i0 - 4]
	.word	0x99a01a31	! t0_kref+0x4cd8:   	fstoi	%f17, %f12
	.word	0xde500019	! t0_kref+0x4cdc:   	ldsh	[%g0 + %i1], %o7
	.word	0xa5b68e54	! t0_kref+0x4ce0:   	fxnor	%f26, %f20, %f18
	.word	0x30800002	! t0_kref+0x4ce4:   	ba,a	_kref+0x4cec
	.word	0x94b30015	! t0_kref+0x4ce8:   	orncc	%o4, %l5, %o2
	.word	0xadb70c94	! t0_kref+0x4cec:   	fandnot2	%f28, %f20, %f22
	.word	0x801a7a86	! t0_kref+0x4cf0:   	xor	%o1, -0x57a, %g0
	.word	0x80fa4000	! t0_kref+0x4cf4:   	sdivcc	%o1, %g0, %g0
	.word	0xb9a38854	! t0_kref+0x4cf8:   	faddd	%f14, %f20, %f28
	.word	0x22480001	! t0_kref+0x4cfc:   	be,a,pt	%icc, _kref+0x4d00
	.word	0xd6280019	! t0_kref+0x4d00:   	stb	%o3, [%g0 + %i1]
	.word	0x81580000	! t0_kref+0x4d04:   	flushw
	.word	0x3d480001	! t0_kref+0x4d08:   	fbule,a,pt	%fcc0, _kref+0x4d0c
	.word	0xb9a0055c	! t0_kref+0x4d0c:   	fsqrtd	%f28, %f28
	.word	0xbba000ad	! t0_kref+0x4d10:   	fnegs	%f13, %f29
	.word	0x96e00016	! t0_kref+0x4d14:   	subccc	%g0, %l6, %o3
	.word	0xae12c00c	! t0_kref+0x4d18:   	or	%o3, %o4, %l7
	.word	0xa5b68280	! t0_kref+0x4d1c:   	array32	%i2, %g0, %l2
	.word	0x2909efb6	! t0_kref+0x4d20:   	sethi	%hi(0x27bed800), %l4
	.word	0x81dcc00b	! t0_kref+0x4d24:   	flush	%l3 + %o3
	.word	0xa9b38598	! t0_kref+0x4d28:   	fcmpgt32	%f14, %f24, %l4
	.word	0xd9be5840	! t0_kref+0x4d2c:   	stda	%f12, [%i1]0xc2
	.word	0x20800001	! t0_kref+0x4d30:   	bn,a	_kref+0x4d34
	.word	0x9a5de7ec	! t0_kref+0x4d34:   	smul	%l7, 0x7ec, %o5
	.word	0x9ba000bb	! t0_kref+0x4d38:   	fnegs	%f27, %f13
	.word	0x36480008	! t0_kref+0x4d3c:   	bge,a,pt	%icc, _kref+0x4d5c
	.word	0x9740c000	! t0_kref+0x4d40:   	mov	%asi, %o3
	.word	0x9822800c	! t0_kref+0x4d44:   	sub	%o2, %o4, %o4
	.word	0xafa01a5c	! t0_kref+0x4d48:   	fdtoi	%f28, %f23
	.word	0xb9b48d18	! t0_kref+0x4d4c:   	fandnot1	%f18, %f24, %f28
	.word	0x912dc00c	! t0_kref+0x4d50:   	sll	%l7, %o4, %o0
	.word	0xadb48d40	! t0_kref+0x4d54:   	fnot1	%f18, %f22
	.word	0xf11e4000	! t0_kref+0x4d58:   	ldd	[%i1], %f24
	.word	0xe91e3fe8	! t0_kref+0x4d5c:   	ldd	[%i0 - 0x18], %f20
	.word	0xb9a309d0	! t0_kref+0x4d60:   	fdivd	%f12, %f16, %f28
	.word	0xd2000019	! t0_kref+0x4d64:   	ld	[%g0 + %i1], %o1
	.word	0x81b50554	! t0_kref+0x4d68:   	fcmpeq16	%f20, %f20, %g0
	.word	0xa8132253	! t0_kref+0x4d6c:   	or	%o4, 0x253, %l4
	.word	0xee28a015	! t0_kref+0x4d70:   	stb	%l7, [%g2 + 0x15]
	.word	0x9033400c	! t0_kref+0x4d74:   	orn	%o5, %o4, %o0
	.word	0xd07e7ff4	! t0_kref+0x4d78:   	swap	[%i1 - 0xc], %o0
	.word	0x9da588d4	! t0_kref+0x4d7c:   	fsubd	%f22, %f20, %f14
	.word	0xa6300000	! t0_kref+0x4d80:   	orn	%g0, %g0, %l3
	.word	0x81dbc001	! t0_kref+0x4d84:   	flush	%o7 + %g1
	.word	0x81af8a34	! t0_kref+0x4d88:   	fcmps	%fcc0, %f30, %f20
	.word	0xf3ee501c	! t0_kref+0x4d8c:   	prefetcha	%i1 + %i4, 25
	.word	0x94d8000d	! t0_kref+0x4d90:   	smulcc	%g0, %o5, %o2
	.word	0xe8e8a001	! t0_kref+0x4d94:   	ldstuba	[%g2 + 1]%asi, %l4
	.word	0xa1a0190d	! t0_kref+0x4d98:   	fitod	%f13, %f16
	.word	0x802031ff	! t0_kref+0x4d9c:   	sub	%g0, -0xe01, %g0
	.word	0xecb0a03c	! t0_kref+0x4da0:   	stha	%l6, [%g2 + 0x3c]%asi
	.word	0xf420a00c	! t0_kref+0x4da4:   	st	%i2, [%g2 + 0xc]
	.word	0x9e930009	! t0_kref+0x4da8:   	orcc	%o4, %o1, %o7
	.word	0xa5a0104c	! t0_kref+0x4dac:   	fdtox	%f12, %f18
	.word	0xb5a4cd39	! t0_kref+0x4db0:   	fsmuld	%f19, %f25, %f26
	.word	0x93b5816b	! t0_kref+0x4db4:   	edge32ln	%l6, %o3, %o1
	.word	0xa9b60a92	! t0_kref+0x4db8:   	fpsub16	%f24, %f18, %f20
	.word	0xf526001c	! t0_kref+0x4dbc:   	st	%f26, [%i0 + %i4]
	.word	0xb9a0192c	! t0_kref+0x4dc0:   	fstod	%f12, %f28
	.word	0xd8363ffe	! t0_kref+0x4dc4:   	sth	%o4, [%i0 - 2]
	.word	0x9b70000d	! t0_kref+0x4dc8:   	popc	%o5, %o5
	.word	0xaee2288c	! t0_kref+0x4dcc:   	subccc	%o0, 0x88c, %l7
	.word	0xe9e65009	! t0_kref+0x4dd0:   	casa	[%i1]0x80, %o1, %l4
	.word	0x81b6048e	! t0_kref+0x4dd4:   	fcmple32	%f24, %f14, %g0
	.word	0x81ac8a5c	! t0_kref+0x4dd8:   	fcmpd	%fcc0, %f18, %f28
	.word	0x86102004	! t0_kref+0x4ddc:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x4de0:   	bne,a	_kref+0x4de0
	.word	0x86a0e001	! t0_kref+0x4de4:   	subcc	%g3, 1, %g3
	.word	0x908ac008	! t0_kref+0x4de8:   	andcc	%o3, %o0, %o0
	.word	0xaf15ff7c	! t0_kref+0x4dec:   	taddcctv	%l7, -0x84, %l7
	.word	0xae55c000	! t0_kref+0x4df0:   	umul	%l7, %g0, %l7
	.word	0xa40a7fc6	! t0_kref+0x4df4:   	and	%o1, -0x3a, %l2
	.word	0x97418000	! t0_kref+0x4df8:   	mov	%fprs, %o3
	.word	0x9fc10000	! t0_kref+0x4dfc:   	call	%g4
	.word	0x9bb58168	! t0_kref+0x4e00:   	edge32ln	%l6, %o0, %o5
	.word	0x28800008	! t0_kref+0x4e04:   	bleu,a	_kref+0x4e24
	.word	0x93400000	! t0_kref+0x4e08:   	mov	%y, %o1
	.word	0x8143c000	! t0_kref+0x4e0c:   	stbar
	.word	0xd6070018	! t0_kref+0x4e10:   	ld	[%i4 + %i0], %o3
	.word	0xb5a70d3b	! t0_kref+0x4e14:   	fsmuld	%f28, %f27, %f26
	.word	0x99b48a4c	! t0_kref+0x4e18:   	fpadd32	%f18, %f12, %f12
	.word	0xaefb37df	! t0_kref+0x4e1c:   	sdivcc	%o4, -0x821, %l7
	.word	0x01000000	! t0_kref+0x4e20:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e28:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x70c3c000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x709f0000)
.seg "text"
t0_subr1_page_begin:
	.skip 8180
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x709e6000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x70a0e000)
.seg "text"
t0_subr3_page_begin:
	.skip 8172
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
!  Total operations: 4944  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.20   1.25
!  ldub              0.38   0.28
!  ldsh              0.84   0.89
!  lduh              0.01   0.00
!  ld                1.23   1.36
!  ldd               0.75   0.89
!  swap              1.00   1.09
!  ldstub            0.39   0.26
!  stb               0.95   0.99
!  sth               0.67   0.69
!  st                0.92   1.01
!  std               0.26   0.42
!  add               0.07   0.08
!  addcc             0.50   0.55
!  addx              0.32   0.30
!  addxcc            0.08   0.08
!  taddcc            0.14   0.22
!  taddcctv          0.25   0.34
!  sub               0.92   1.01
!  subcc             0.43   0.38
!  subx              1.17   1.19
!  subxcc            0.85   1.11
!  tsubcc            0.09   0.00
!  tsubcctv          0.19   0.26
!  mulscc            1.07   1.31
!  and               1.04   1.11
!  andcc             0.39   0.40
!  andn              1.01   1.33
!  andncc            0.91   0.87
!  or                0.59   0.75
!  orcc              0.87   0.75
!  orn               0.75   0.81
!  orncc             0.77   0.81
!  xor               1.14   1.21
!  xorcc             1.01   0.77
!  xnor              0.26   0.22
!  xnorcc            0.54   0.53
!  sll               1.07   1.01
!  srl               0.81   0.93
!  sra               0.03   0.00
!  unimp             0.11   0.16
!  umul              0.55   0.59
!  smul              1.20   1.27
!  udiv              1.00   1.52
!  sdiv              0.09   0.02
!  umulcc            1.11   0.89
!  smulcc            0.41   0.61
!  udivcc            1.17   1.31
!  sdivcc            0.59   0.42
!  rdy               0.76   0.77
!  wry               0.42   0.57
!  bicc              2.30   2.06
!  sethi             1.29   1.19
!  jmpl              1.02   0.97
!  call              1.17   0.81
!  ticc              0.00   0.00
!  flush             0.94   0.99
!  save              0.81   0.61
!  restore           0.49   0.00
!  stbar             1.28   1.23
!  ldf               0.81   0.97
!  lddf              1.14   1.38
!  stf               1.12   1.29
!  stdf              0.15   0.20
!  fadds             1.04   1.07
!  fsubs             0.63   0.55
!  fmuls             0.19   0.26
!  fdivs             0.06   0.02
!  faddd             0.39   0.53
!  fsubd             0.44   0.51
!  fmuld             0.01   0.00
!  fdivd             0.62   0.69
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.64   0.53
!  fdmulq            0.00   0.00
!  fitos             0.38   0.53
!  fitod             0.89   0.93
!  fitoq             0.00   0.00
!  fstoi             1.03   1.19
!  fstod             1.21   0.89
!  fstoq             0.00   0.00
!  fdtoi             0.92   1.07
!  fdtos             0.69   0.85
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.40   0.36
!  fnegs             0.86   0.85
!  fabss             0.44   0.47
!  fsqrts            1.45   1.46
!  fsqrtd            2.22   2.27
!  fsqrtq            0.00   0.00
!  fcmps             1.20   1.40
!  fcmpd             0.45   0.36
!  fcmpq             0.00   0.00
!  fcmpes            0.02   0.02
!  fcmped            0.51   0.28
!  fcmpeq            0.00   0.00
!  fbfcc             2.59   2.14
!  ldfsr             0.15   0.00
!  stfsr             0.06   0.06
!  loop              0.18   0.10
!  offset            0.04   0.02
!  area              0.10   0.16
!  target            0.21   0.36
!  goto              0.19   0.18
!  sigsegv           0.05   0.04
!  sigbus            0.16   0.20
!  imodify           0.00   0.00
!  ldfsr_offset      0.19   0.00
!  fpattern          0.30   0.34
!  lbranch           0.02   0.02
!  shmld             2.52   2.81
!  shmst             3.57   3.66
!  shmpf             0.80   0.85
!  shmswap           0.26   0.32
!  shmblkld          1.11   0.12
!  shmblkst          1.15   0.02
!  shmblkchk         0.23   0.30
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
!  casa              0.23   0.22
!  rdasi             0.14   0.14
!  wrasi             0.07   0.06
!  bpcc              2.76   2.12
!  fbpfcc            0.96   1.07
!  fmovscc           0.12   0.10
!  fmovdcc           0.20   0.20
!  fmovqcc           0.00   0.00
!  movcc             0.02   0.00
!  flushw            0.25   0.18
!  membar            0.06   0.04
!  prefetch          0.53   0.51
!  rdpc              0.12   0.20
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.09   0.08
!  lddfa             0.14   0.14
!  ldqfa             0.00   0.00
!  ldsba             0.21   0.18
!  ldsha             0.18   0.20
!  lduba             0.19   0.28
!  lduha             0.02   0.00
!  lda               0.15   0.12
!  ldda              0.04   0.00
!  ldstuba           0.24   0.28
!  prefetcha         1.00   1.01
!  stfa              0.10   0.04
!  stdfa             0.05   0.02
!  stqfa             0.00   0.00
!  stba              0.17   0.24
!  stha              0.03   0.02
!  sta               0.13   0.22
!  stda              0.18   0.30
!  swapa             0.02   0.02
!  fmovd             0.05   0.04
!  fnegd             0.22   0.18
!  fabsd             0.09   0.04
!  fstox             0.19   0.18
!  fdtox             0.07   0.06
!  fxtos             0.10   0.06
!  fxtod             0.20   0.22
!  lds               0.14   0.20
!  ldsa              0.22   0.32
!  ldx               0.21   0.28
!  ldxa              0.05   0.06
!  nofault           0.02   0.04
!  rdgsr             0.04   0.06
!  wrgsr             0.11   0.10
!  fpadd16           0.09   0.06
!  fpadd16s          0.15   0.26
!  fpadd32           0.09   0.04
!  fpadd32s          0.22   0.26
!  fpsub16           0.18   0.18
!  fpsub16s          0.21   0.26
!  fpsub32           0.09   0.12
!  fpsub32s          0.24   0.18
!  fpack16           0.25   0.20
!  fpack32           0.00   0.00
!  fpackfix          0.06   0.06
!  fexpand           0.04   0.04
!  fpmerge           0.19   0.12
!  fmul8x16          0.16   0.12
!  fmul8x16au        0.21   0.18
!  fmul8x16al        0.09   0.14
!  fmul8sux16        0.10   0.22
!  fmul8ulx16        0.20   0.28
!  fmuld8sux16       0.16   0.24
!  fmuld8ulx16       0.22   0.12
!  alignaddr         0.11   0.14
!  alignaddrl        0.10   0.02
!  faligndata        0.09   0.06
!  fzero             0.14   0.14
!  fzeros            0.05   0.12
!  fone              0.07   0.14
!  fones             0.22   0.28
!  fsrc1             0.25   0.26
!  fsrc1s            0.17   0.20
!  fsrc2             0.07   0.10
!  fsrc2s            0.02   0.02
!  fnot1             0.11   0.20
!  fnot1s            0.19   0.16
!  fnot2             0.25   0.36
!  fnot2s            0.23   0.30
!  for               0.10   0.04
!  fors              0.01   0.00
!  fnor              0.11   0.12
!  fnors             0.17   0.10
!  fand              0.24   0.14
!  fands             0.17   0.08
!  fnand             0.06   0.10
!  fnands            0.22   0.26
!  fxor              0.03   0.04
!  fxors             0.09   0.10
!  fxnor             0.16   0.26
!  fxnors            0.06   0.04
!  fornot1           0.16   0.14
!  fornot1s          0.00   0.00
!  fornot2           0.23   0.16
!  fornot2s          0.20   0.18
!  fandnot1          0.18   0.16
!  fandnot1s         0.21   0.16
!  fandnot2          0.25   0.22
!  fandnot2s         0.24   0.34
!  fcmpgt16          0.12   0.06
!  fcmpgt32          0.09   0.16
!  fcmple16          0.01   0.02
!  fcmple32          0.04   0.08
!  fcmpne16          0.00   0.00
!  fcmpne32          0.17   0.16
!  fcmpeq16          0.24   0.32
!  fcmpeq32          0.10   0.22
!  edge8             0.20   0.34
!  edge8l            0.15   0.22
!  edge16            0.08   0.06
!  edge16l           0.07   0.10
!  edge32            0.08   0.12
!  edge32l           0.16   0.14
!  pdist             0.16   0.26
!  partial_st8       0.22   0.30
!  partial_st16      0.17   0.18
!  partial_st32      0.07   0.06
!  short_st8         0.03   0.04
!  short_st16        0.03   0.02
!  short_ld8         0.06   0.04
!  short_ld16        0.12   0.06
!  blkld             0.05   0.00
!  blkst             0.07   0.00
!  blkld_offset      0.19   0.00
!  blkst_offset      0.21   0.00
!  blk_check         0.10   0.12
!  casxa             0.24   0.16
!  rdccr             0.22   0.22
!  rdfprs            0.21   0.16
!  wrccr             0.12   0.08
!  popc              0.24   0.20
!  wrfprs            0.07   0.10
!  stx               0.02   0.06
!  stxa              0.22   0.18
!  cflush            0.00   0.00
!  array8            0.22   0.22
!  array16           0.13   0.08
!  array32           0.13   0.16
!  edge8n            0.12   0.08
!  edge8ln           0.00   0.00
!  edge16n           0.16   0.20
!  edge16ln          0.06   0.08
!  edge32n           0.14   0.10
!  edge32ln          0.25   0.32
!  bmask             0.05   0.10
!  bshuffle          0.00   0.00
!  siam              0.02   0.00
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
KDATA_MODULE(t0_module_offset_table, 0x2f0f6000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0xfffffff0
	.word	0xffffffe0
	.word	0xffffffe8
	.word	0x00000008
	.word	0x00000010
	.word	0x00000018
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

KDATA_MODULE(t0_module_data_in_regs, 0x507c8000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xe5510e2f          ! %f0
	.word	0x1d3b705b          ! %f1
	.word	0x79e2a0da          ! %f2
	.word	0xa3ca03c4          ! %f3
	.word	0x4e6473ee          ! %f4
	.word	0x82908e3b          ! %f5
	.word	0x8a37d0e2          ! %f6
	.word	0xa3ac209f          ! %f7
	.word	0x92459bb0          ! %f8
	.word	0x38ccc67c          ! %f9
	.word	0xaa49df37          ! %f10
	.word	0x523ba798          ! %f11
	.word	0xc4f7edd7          ! %f12
	.word	0x82ea48e4          ! %f13
	.word	0x1e9e0460          ! %f14
	.word	0x30d9762b          ! %f15
	.word	0xe20c6093          ! %f16
	.word	0xa16c4043          ! %f17
	.word	0xc18a91c2          ! %f18
	.word	0x70bbc787          ! %f19
	.word	0x66c7c153          ! %f20
	.word	0x299a50db          ! %f21
	.word	0xd7499a32          ! %f22
	.word	0xc2c4f395          ! %f23
	.word	0x4fdfa178          ! %f24
	.word	0x198b18fb          ! %f25
	.word	0xd5350fcc          ! %f26
	.word	0x86589a37          ! %f27
	.word	0x69ccda4b          ! %f28
	.word	0x6ac397ec          ! %f29
	.word	0x98466b02          ! %f30
	.word	0x0c41bed4          ! %f31
	.word	0x5f2ddc31          ! %f32
	.word	0xa12b9f11          ! %f33
	.word	0x66012ef7          ! %f34
	.word	0x82e09814          ! %f35
	.word	0xf1a23d1d          ! %f36
	.word	0x2d75b149          ! %f37
	.word	0xcd90df0d          ! %f38
	.word	0x76ff17e8          ! %f39
	.word	0xa22c3a45          ! %f40
	.word	0x631af498          ! %f41
	.word	0xba5839bc          ! %f42
	.word	0x7d176fcc          ! %f43
	.word	0x05bc2118          ! %f44
	.word	0x10f21a05          ! %f45
	.word	0x7eb8cca5          ! %f46
	.word	0xf1c81550          ! %f47
	.word	0x9454d36e          ! %f48
	.word	0x7a725fc5          ! %f49
	.word	0x5ab735e6          ! %f50
	.word	0xf1e50ad4          ! %f51
	.word	0xdc77db01          ! %f52
	.word	0xdd221198          ! %f53
	.word	0xa791a6af          ! %f54
	.word	0xdb4e7092          ! %f55
	.word	0x4c7ac01b          ! %f56
	.word	0xdbc22b72          ! %f57
	.word	0xd4a37b15          ! %f58
	.word	0x43b0a1e0          ! %f59
	.word	0xcf4e9790          ! %f60
	.word	0xfdbf025e          ! %f61
	.word	0x4c49fb26          ! %f62
	.word	0x49d262b6          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x38        ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x301d0338          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x2ee91840          ! %o0
	.word	0xfdd359ed          ! %o1
	.word	0xb92e8f24          ! %o2
	.word	0x18821e3d          ! %o3
	.word	0x3b71124b          ! %o4
	.word	0xf05ab269          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x155dfbef          ! %l0
	.word	0xf788179f          ! %l1
	.word	0x062b993d          ! %l2
	.word	0x2d59e16e          ! %l3
	.word	0xcbb4e5f4          ! %l4
	.word	0x15ef7a18          ! %l5
	.word	0x70844196          ! %l6
	.word	0xe83990cb          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffff1          ! %i2 (byte offset)
	.word	0xfffffffc          ! %i3 (halfword offset)
	.word	0xffffffe8          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xb24af9a1          ! %y
	.word	0x00000001          ! %icc (nzvc)
	.word	0x00000e75          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x553f4000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xa177cc75
	.word	0x503b6fea
	.word	0x70ec8790
	.word	0xa06aed0c
	.word	0xcdf52a12
	.word	0xf5a5fe1b
	.word	0x0bee031c
	.word	0x6829242f
	.word	0xea568164
	.word	0xb86a4612
	.word	0x47f16cc9
	.word	0x764c6283
	.word	0x61080ed6
	.word	0x80265231
	.word	0xff374319
	.word	0xbf583697
	.word	0x8bba493d
	.word	0xbf869b28
	.word	0xc1bc163b
	.word	0x9c229062
	.word	0xb029972c
	.word	0x83a7b4be
	.word	0x5fb72f7a
	.word	0x832345a8
	.word	0x1c1b8586
	.word	0x865f82d1
	.word	0xd017bbf7
	.word	0x160cf8a2
	.word	0x25e05353
	.word	0x88763a9b
	.word	0xf49d6e97
	.word	0xa6bb44dd
	.word	0xdc40e6d7
	.word	0x4a97b436
	.word	0x0584cd3e
	.word	0x20dc5661
	.word	0x6eae7fe0
	.word	0x0149d061
	.word	0x198e9d3c
	.word	0x337a4f16
	.word	0x7e0abb5f
	.word	0x11bcf684
	.word	0x7fad2307
	.word	0xf8eb1e63
	.word	0x1cb3bc3a
	.word	0x7f17eef1
	.word	0x9d19292a
	.word	0x6af3af18
	.word	0xe2e98d60
	.word	0x72309d6c
	.word	0x183c027d
	.word	0x06558f8d
	.word	0x105f111d
	.word	0x34b75fed
	.word	0x15fafb96
	.word	0xdacc780b
	.word	0xbe1a11af
	.word	0x5cf315a3
	.word	0xb6c3ef7f
	.word	0x44f3536a
	.word	0xf9eb4718
	.word	0x8c88123c
	.word	0x4a81f3a9
	.word	0xfcdeadfa
	.word	0xb0006635
	.word	0x5ba48163
	.word	0x899c4f1f
	.word	0x68b4aea6
	.word	0x449f8d0f
	.word	0xe690fe8a
	.word	0xa49130fe
	.word	0x0c68fe56
	.word	0x013ca070
	.word	0x0e4c64e9
	.word	0xfee0da24
	.word	0xf1454195
	.word	0x220e6eb9
	.word	0x31c61bc5
	.word	0xb4152e26
	.word	0x4f4d0874
	.word	0x9d52abf2
	.word	0xd4ba62f5
	.word	0x91fcdf87
	.word	0x1a1658ad
	.word	0x38cd1b23
	.word	0xf76863a1
	.word	0x70f0ab27
	.word	0x309e360a
	.word	0x4dff78e1
	.word	0x7792094d
	.word	0xe56c56f9
	.word	0x5632cd07
	.word	0xaf5cfb2b
	.word	0x9bb1e715
	.word	0x44ac67f9
	.word	0x300323b6
	.word	0x81957a76
	.word	0x5553ad39
	.word	0x2b9cc35c
	.word	0xd17e74e2
	.word	0xe9419805
	.word	0x0b3ff2dc
	.word	0xe373af08
	.word	0xd7ab9977
	.word	0x17fa757e
	.word	0x0ff45808
	.word	0x9517e546
	.word	0x43432420
	.word	0x517cd1ba
	.word	0xc8ed43f5
	.word	0xa327afb5
	.word	0xa0dd1332
	.word	0xcb209edc
	.word	0xf7d6c38b
	.word	0x55623d81
	.word	0x382d3cc8
	.word	0xfaeb65a4
	.word	0x540e4c24
	.word	0x4e93a8d5
	.word	0xed57d92e
	.word	0xc9150a05
	.word	0x79376695
	.word	0xd3375f8d
	.word	0xdc19cf82
	.word	0xb43bc4f4
	.word	0x2b41866e
	.word	0x6a0be330
	.word	0x0216a898
	.word	0xfefd6782
	.word	0xa15d9181
	.word	0xc40e141d
	.word	0x36584c1e
	.word	0x6a793b2c
	.word	0x4445dba1
	.word	0x7e017c03
	.word	0x3e2aec00
	.word	0x659f1372
	.word	0x69239aab
	.word	0x460e4b96
	.word	0xbd41c20d
	.word	0x5a6564a5
	.word	0xad8916ca
	.word	0x4354ff7f
	.word	0x9eb783da
	.word	0x59497405
	.word	0xd2a81af5
	.word	0x86e2e093
	.word	0x2047b0e6
	.word	0x9e19f50b
	.word	0x326069bc
	.word	0x7c71d347
	.word	0xff4c1efe
	.word	0xa83da802
	.word	0x103a3a44
	.word	0x29112a63
	.word	0x29dc68e3
	.word	0x19accddb
	.word	0x471d0190
	.word	0xdd7c70f6
	.word	0x6c232329
	.word	0x8bed8542
	.word	0xdad30c01
	.word	0x64c05f89
	.word	0xa4d6fb61
	.word	0xa6d064ec
	.word	0x366eab1f
	.word	0xa51d7097
	.word	0x4a04257a
t0_data_in_sp:
	.word	0x32abe732
	.word	0xd6adfb99
	.word	0xd41ac83c
	.word	0x4334bb64
	.word	0xa4aa7ae3
	.word	0x85c6878a
	.word	0x6eb3632b
	.word	0x0dccf2f5
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000010
	.word	0x00000014
	.word	0x00000014
	.word	0x00000000
	.word	t0_data_in_fp
	.word	0xcaabd0b3
	.word	0x55f57d27
	.word	0xbbe32904
	.word	0xb04fc9c0
	.word	0x889f9523
	.word	0xba958ca3
	.word	0x8b364b31
	.word	0xcfee1349
	.word	0xb734adc1
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
	.word   	0xbb5110f3	! [%fp - 0xc]
	.word   	0x6e105df0	! [%fp - 0x8]
	.word   	0x036d3f9d	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x98af7e83
	.word	0xc4f5f7ca
	.word	0x26e76db4
	.word	0x4eb057ab
	.word	0xf81517a0
	.word	0xd78bd96c
	.word	0xac8ad96c
	.word	0x07a2f1a8
	.word	0x4a9e4d9a
	.word	0xc798ca5f
	.word	0x32c8542c
	.word	0x7f243bdb
	.word	0x9af5cd7f
	.word	0xd4751462
	.word	0x7d2cdd0b
	.word	0xda1760b5
	.word	0x498cb16a
	.word	0xeb6d0a9e
	.word	0x9102d14e
	.word	0x100d9824
	.word	0x18055950
	.word	0x4faf6d1b
	.word	0xaa1c7cc5
	.word	0xf76f7a28
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x4cdf4000)
.seg "data"
t0_data_in_area0_start:
.skip 6336
t0_data_in_area0_begin:
	.word	0xef6c8bf8	! t0_data_in_area0-0x20
	.word	0x3bfa0f75	! t0_data_in_area0-0x1c
	.word	0xf50ccc75	! t0_data_in_area0-0x18
	.word	0x675066a5	! t0_data_in_area0-0x14
	.word	0xc5f5244b	! t0_data_in_area0-0x10
	.word	0x03ddb6ce	! t0_data_in_area0-0xc
	.word	0xe7660777	! t0_data_in_area0-0x8
	.word	0x4e70167b	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xe96acecd	! t0_data_in_area0+0x0
	.word	0x0a8d6306	! t0_data_in_area0+0x4
	.word	0x25b0b21f	! t0_data_in_area0+0x8
	.word	0x0a9ba9d3	! t0_data_in_area0+0xc
	.word	0x73d49b6b	! t0_data_in_area0+0x10
	.word	0xd3bc7729	! t0_data_in_area0+0x14
	.word	0x2d4aff5f	! t0_data_in_area0+0x18
	.word	0xbce0c7bb	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 1792
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x00e14000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x88086776	! t0_data_in_shm_area+0x0 (t0)
	.word	0x73527529	! t0_data_in_shm_area+0x4 (t0)
	.word	0x8083746d	! t0_data_in_shm_area+0x8 (t0)
	.word	0x131aa2f5	! t0_data_in_shm_area+0xc (t0)
	.word	0x207c63ef	! t0_data_in_shm_area+0x10 (t0)
	.word	0x99f240cc	! t0_data_in_shm_area+0x14 (t0)
	.word	0xd347a2a3	! t0_data_in_shm_area+0x18 (t0)
	.word	0x5f89f80c	! t0_data_in_shm_area+0x1c (t0)
	.word	0x3bb43c05	! t0_data_in_shm_area+0x20 (t0)
	.word	0x89be1de7	! t0_data_in_shm_area+0x24 (t0)
	.word	0xc8ea1ba7	! t0_data_in_shm_area+0x28 (t0)
	.word	0x88a658a7	! t0_data_in_shm_area+0x2c (t0)
	.word	0x4b7b9fdb	! t0_data_in_shm_area+0x30 (t0)
	.word	0xefa0ddcc	! t0_data_in_shm_area+0x34 (t0)
	.word	0xb61103cb	! t0_data_in_shm_area+0x38 (t0)
	.word	0x9f685821	! t0_data_in_shm_area+0x3c (t0)
	.word	0x46f8378d	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x34f7f000	! t0_data_in_shm_area+0x44
	.word	0xaf10e6b6	! t0_data_in_shm_area+0x48
	.word	0xd6316d58	! t0_data_in_shm_area+0x4c
	.word	0x27b94274	! t0_data_in_shm_area+0x50
	.word	0x93014a31	! t0_data_in_shm_area+0x54
	.word	0xf90db243	! t0_data_in_shm_area+0x58
	.word	0x4f6f9dc4	! t0_data_in_shm_area+0x5c
	.word	0xff8b66a9	! t0_data_in_shm_area+0x60
	.word	0x702b5b66	! t0_data_in_shm_area+0x64
	.word	0xe575fba9	! t0_data_in_shm_area+0x68
	.word	0x466845cc	! t0_data_in_shm_area+0x6c
	.word	0x0c3b74c8	! t0_data_in_shm_area+0x70
	.word	0x36947e78	! t0_data_in_shm_area+0x74
	.word	0xc20af2db	! t0_data_in_shm_area+0x78
	.word	0x7f769254	! t0_data_in_shm_area+0x7c
	.word	0x0fdb23f6	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x75ea9fc0	! t0_data_in_shm_area+0x84
	.word	0x0de9a830	! t0_data_in_shm_area+0x88
	.word	0x9cbf7f9a	! t0_data_in_shm_area+0x8c
	.word	0xdbc70a24	! t0_data_in_shm_area+0x90
	.word	0x48b30a11	! t0_data_in_shm_area+0x94
	.word	0xa4308846	! t0_data_in_shm_area+0x98
	.word	0xe2267142	! t0_data_in_shm_area+0x9c
	.word	0x0add5494	! t0_data_in_shm_area+0xa0
	.word	0x590d8ee8	! t0_data_in_shm_area+0xa4
	.word	0x41263224	! t0_data_in_shm_area+0xa8
	.word	0x6c6ab7ae	! t0_data_in_shm_area+0xac
	.word	0xc049049b	! t0_data_in_shm_area+0xb0
	.word	0xb2857de2	! t0_data_in_shm_area+0xb4
	.word	0x4d750b9e	! t0_data_in_shm_area+0xb8
	.word	0xc5079693	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x644a4000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xe5510e2f          ! %f0
	.word	0x1d3b705b          ! %f1
	.word	0x79e2a0da          ! %f2
	.word	0xa3ca03c4          ! %f3
	.word	0x4e6473ee          ! %f4
	.word	0x82908e3b          ! %f5
	.word	0x8a37d0e2          ! %f6
	.word	0xa3ac209f          ! %f7
	.word	0x92459bb0          ! %f8
	.word	0x38ccc67c          ! %f9
	.word	0xaa49df37          ! %f10
	.word	0x523ba798          ! %f11
	.word	0xc4f7edd7          ! %f12
	.word	0x82ea48e4          ! %f13
	.word	0x1e9e0460          ! %f14
	.word	0x30d9762b          ! %f15
	.word	0xe20c6093          ! %f16
	.word	0xa16c4043          ! %f17
	.word	0xc18a91c2          ! %f18
	.word	0x70bbc787          ! %f19
	.word	0x66c7c153          ! %f20
	.word	0x299a50db          ! %f21
	.word	0xd7499a32          ! %f22
	.word	0xc2c4f395          ! %f23
	.word	0x4fdfa178          ! %f24
	.word	0x198b18fb          ! %f25
	.word	0xd5350fcc          ! %f26
	.word	0x86589a37          ! %f27
	.word	0x69ccda4b          ! %f28
	.word	0x6ac397ec          ! %f29
	.word	0x98466b02          ! %f30
	.word	0x0c41bed4          ! %f31
	.word	0x5f2ddc31          ! %f32
	.word	0xa12b9f11          ! %f33
	.word	0x66012ef7          ! %f34
	.word	0x82e09814          ! %f35
	.word	0xf1a23d1d          ! %f36
	.word	0x2d75b149          ! %f37
	.word	0xcd90df0d          ! %f38
	.word	0x76ff17e8          ! %f39
	.word	0xa22c3a45          ! %f40
	.word	0x631af498          ! %f41
	.word	0xba5839bc          ! %f42
	.word	0x7d176fcc          ! %f43
	.word	0x05bc2118          ! %f44
	.word	0x10f21a05          ! %f45
	.word	0x7eb8cca5          ! %f46
	.word	0xf1c81550          ! %f47
	.word	0x9454d36e          ! %f48
	.word	0x7a725fc5          ! %f49
	.word	0x5ab735e6          ! %f50
	.word	0xf1e50ad4          ! %f51
	.word	0xdc77db01          ! %f52
	.word	0xdd221198          ! %f53
	.word	0xa791a6af          ! %f54
	.word	0xdb4e7092          ! %f55
	.word	0x4c7ac01b          ! %f56
	.word	0xdbc22b72          ! %f57
	.word	0xd4a37b15          ! %f58
	.word	0x43b0a1e0          ! %f59
	.word	0xcf4e9790          ! %f60
	.word	0xfdbf025e          ! %f61
	.word	0x4c49fb26          ! %f62
	.word	0x49d262b6          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x38        ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x301d0338          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x2ee91840          ! %o0
	.word	0xfdd359ed          ! %o1
	.word	0xb92e8f24          ! %o2
	.word	0x18821e3d          ! %o3
	.word	0x3b71124b          ! %o4
	.word	0xf05ab269          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x155dfbef          ! %l0
	.word	0xf788179f          ! %l1
	.word	0x062b993d          ! %l2
	.word	0x2d59e16e          ! %l3
	.word	0xcbb4e5f4          ! %l4
	.word	0x15ef7a18          ! %l5
	.word	0x70844196          ! %l6
	.word	0xe83990cb          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffff1          ! %i2 (byte offset)
	.word	0xfffffffc          ! %i3 (halfword offset)
	.word	0xffffffe8          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xb24af9a1          ! %y
	.word	0x00000001          ! %icc (nzvc)
	.word	0x00000e75          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x33612000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xa177cc75
	.word	0x503b6fea
	.word	0x70ec8790
	.word	0xa06aed0c
	.word	0xcdf52a12
	.word	0xf5a5fe1b
	.word	0x0bee031c
	.word	0x6829242f
	.word	0xea568164
	.word	0xb86a4612
	.word	0x47f16cc9
	.word	0x764c6283
	.word	0x61080ed6
	.word	0x80265231
	.word	0xff374319
	.word	0xbf583697
	.word	0x8bba493d
	.word	0xbf869b28
	.word	0xc1bc163b
	.word	0x9c229062
	.word	0xb029972c
	.word	0x83a7b4be
	.word	0x5fb72f7a
	.word	0x832345a8
	.word	0x1c1b8586
	.word	0x865f82d1
	.word	0xd017bbf7
	.word	0x160cf8a2
	.word	0x25e05353
	.word	0x88763a9b
	.word	0xf49d6e97
	.word	0xa6bb44dd
	.word	0xdc40e6d7
	.word	0x4a97b436
	.word	0x0584cd3e
	.word	0x20dc5661
	.word	0x6eae7fe0
	.word	0x0149d061
	.word	0x198e9d3c
	.word	0x337a4f16
	.word	0x7e0abb5f
	.word	0x11bcf684
	.word	0x7fad2307
	.word	0xf8eb1e63
	.word	0x1cb3bc3a
	.word	0x7f17eef1
	.word	0x9d19292a
	.word	0x6af3af18
	.word	0xe2e98d60
	.word	0x72309d6c
	.word	0x183c027d
	.word	0x06558f8d
	.word	0x105f111d
	.word	0x34b75fed
	.word	0x15fafb96
	.word	0xdacc780b
	.word	0xbe1a11af
	.word	0x5cf315a3
	.word	0xb6c3ef7f
	.word	0x44f3536a
	.word	0xf9eb4718
	.word	0x8c88123c
	.word	0x4a81f3a9
	.word	0xfcdeadfa
	.word	0xb0006635
	.word	0x5ba48163
	.word	0x899c4f1f
	.word	0x68b4aea6
	.word	0x449f8d0f
	.word	0xe690fe8a
	.word	0xa49130fe
	.word	0x0c68fe56
	.word	0x013ca070
	.word	0x0e4c64e9
	.word	0xfee0da24
	.word	0xf1454195
	.word	0x220e6eb9
	.word	0x31c61bc5
	.word	0xb4152e26
	.word	0x4f4d0874
	.word	0x9d52abf2
	.word	0xd4ba62f5
	.word	0x91fcdf87
	.word	0x1a1658ad
	.word	0x38cd1b23
	.word	0xf76863a1
	.word	0x70f0ab27
	.word	0x309e360a
	.word	0x4dff78e1
	.word	0x7792094d
	.word	0xe56c56f9
	.word	0x5632cd07
	.word	0xaf5cfb2b
	.word	0x9bb1e715
	.word	0x44ac67f9
	.word	0x300323b6
	.word	0x81957a76
	.word	0x5553ad39
	.word	0x2b9cc35c
	.word	0xd17e74e2
	.word	0xe9419805
	.word	0x0b3ff2dc
	.word	0xe373af08
	.word	0xd7ab9977
	.word	0x17fa757e
	.word	0x0ff45808
	.word	0x9517e546
	.word	0x43432420
	.word	0x517cd1ba
	.word	0xc8ed43f5
	.word	0xa327afb5
	.word	0xa0dd1332
	.word	0xcb209edc
	.word	0xf7d6c38b
	.word	0x55623d81
	.word	0x382d3cc8
	.word	0xfaeb65a4
	.word	0x540e4c24
	.word	0x4e93a8d5
	.word	0xed57d92e
	.word	0xc9150a05
	.word	0x79376695
	.word	0xd3375f8d
	.word	0xdc19cf82
	.word	0xb43bc4f4
	.word	0x2b41866e
	.word	0x6a0be330
	.word	0x0216a898
	.word	0xfefd6782
	.word	0xa15d9181
	.word	0xc40e141d
	.word	0x36584c1e
	.word	0x6a793b2c
	.word	0x4445dba1
	.word	0x7e017c03
	.word	0x3e2aec00
	.word	0x659f1372
	.word	0x69239aab
	.word	0x460e4b96
	.word	0xbd41c20d
	.word	0x5a6564a5
	.word	0xad8916ca
	.word	0x4354ff7f
	.word	0x9eb783da
	.word	0x59497405
	.word	0xd2a81af5
	.word	0x86e2e093
	.word	0x2047b0e6
	.word	0x9e19f50b
	.word	0x326069bc
	.word	0x7c71d347
	.word	0xff4c1efe
	.word	0xa83da802
	.word	0x103a3a44
	.word	0x29112a63
	.word	0x29dc68e3
	.word	0x19accddb
	.word	0x471d0190
	.word	0xdd7c70f6
	.word	0x6c232329
	.word	0x8bed8542
	.word	0xdad30c01
	.word	0x64c05f89
	.word	0xa4d6fb61
	.word	0xa6d064ec
	.word	0x366eab1f
	.word	0xa51d7097
	.word	0x4a04257a
t0_data_exp_sp:
	.word	0x32abe732
	.word	0xd6adfb99
	.word	0xd41ac83c
	.word	0x4334bb64
	.word	0xa4aa7ae3
	.word	0x85c6878a
	.word	0x6eb3632b
	.word	0x0dccf2f5
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000010
	.word	0x00000014
	.word	0x00000014
	.word	0x00000000
	.word	t0_data_exp_fp
	.word	0xcaabd0b3
	.word	0x55f57d27
	.word	0xbbe32904
	.word	0xb04fc9c0
	.word	0x889f9523
	.word	0xba958ca3
	.word	0x8b364b31
	.word	0xcfee1349
	.word	0xb734adc1
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
	.word   	0xbb5110f3	! [%fp - 0xc]
	.word   	0x6e105df0	! [%fp - 0x8]
	.word   	0x036d3f9d	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x98af7e83
	.word	0xc4f5f7ca
	.word	0x26e76db4
	.word	0x4eb057ab
	.word	0xf81517a0
	.word	0xd78bd96c
	.word	0xac8ad96c
	.word	0x07a2f1a8
	.word	0x4a9e4d9a
	.word	0xc798ca5f
	.word	0x32c8542c
	.word	0x7f243bdb
	.word	0x9af5cd7f
	.word	0xd4751462
	.word	0x7d2cdd0b
	.word	0xda1760b5
	.word	0x498cb16a
	.word	0xeb6d0a9e
	.word	0x9102d14e
	.word	0x100d9824
	.word	0x18055950
	.word	0x4faf6d1b
	.word	0xaa1c7cc5
	.word	0xf76f7a28
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x48a96000)
.seg "data"
t0_data_exp_area0_start:
.skip 6336
t0_data_exp_area0_begin:
	.word	0xef6c8bf8	! t0_data_exp_area0-0x20
	.word	0x3bfa0f75	! t0_data_exp_area0-0x1c
	.word	0xf50ccc75	! t0_data_exp_area0-0x18
	.word	0x675066a5	! t0_data_exp_area0-0x14
	.word	0xc5f5244b	! t0_data_exp_area0-0x10
	.word	0x03ddb6ce	! t0_data_exp_area0-0xc
	.word	0xe7660777	! t0_data_exp_area0-0x8
	.word	0x4e70167b	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xe96acecd	! t0_data_exp_area0+0x0
	.word	0x0a8d6306	! t0_data_exp_area0+0x4
	.word	0x25b0b21f	! t0_data_exp_area0+0x8
	.word	0x0a9ba9d3	! t0_data_exp_area0+0xc
	.word	0x73d49b6b	! t0_data_exp_area0+0x10
	.word	0xd3bc7729	! t0_data_exp_area0+0x14
	.word	0x2d4aff5f	! t0_data_exp_area0+0x18
	.word	0xbce0c7bb	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 1792
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x2bb60000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x88086776	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x73527529	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x8083746d	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x131aa2f5	! t0_data_exp_shm_area+0xc (t0)
	.word	0x207c63ef	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x99f240cc	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xd347a2a3	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x5f89f80c	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x3bb43c05	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x89be1de7	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xc8ea1ba7	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x88a658a7	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x4b7b9fdb	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xefa0ddcc	! t0_data_exp_shm_area+0x34 (t0)
	.word	0xb61103cb	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x9f685821	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x46f8378d	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x34f7f000	! t0_data_exp_shm_area+0x44
	.word	0xaf10e6b6	! t0_data_exp_shm_area+0x48
	.word	0xd6316d58	! t0_data_exp_shm_area+0x4c
	.word	0x27b94274	! t0_data_exp_shm_area+0x50
	.word	0x93014a31	! t0_data_exp_shm_area+0x54
	.word	0xf90db243	! t0_data_exp_shm_area+0x58
	.word	0x4f6f9dc4	! t0_data_exp_shm_area+0x5c
	.word	0xff8b66a9	! t0_data_exp_shm_area+0x60
	.word	0x702b5b66	! t0_data_exp_shm_area+0x64
	.word	0xe575fba9	! t0_data_exp_shm_area+0x68
	.word	0x466845cc	! t0_data_exp_shm_area+0x6c
	.word	0x0c3b74c8	! t0_data_exp_shm_area+0x70
	.word	0x36947e78	! t0_data_exp_shm_area+0x74
	.word	0xc20af2db	! t0_data_exp_shm_area+0x78
	.word	0x7f769254	! t0_data_exp_shm_area+0x7c
	.word	0x0fdb23f6	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x75ea9fc0	! t0_data_exp_shm_area+0x84
	.word	0x0de9a830	! t0_data_exp_shm_area+0x88
	.word	0x9cbf7f9a	! t0_data_exp_shm_area+0x8c
	.word	0xdbc70a24	! t0_data_exp_shm_area+0x90
	.word	0x48b30a11	! t0_data_exp_shm_area+0x94
	.word	0xa4308846	! t0_data_exp_shm_area+0x98
	.word	0xe2267142	! t0_data_exp_shm_area+0x9c
	.word	0x0add5494	! t0_data_exp_shm_area+0xa0
	.word	0x590d8ee8	! t0_data_exp_shm_area+0xa4
	.word	0x41263224	! t0_data_exp_shm_area+0xa8
	.word	0x6c6ab7ae	! t0_data_exp_shm_area+0xac
	.word	0xc049049b	! t0_data_exp_shm_area+0xb0
	.word	0xb2857de2	! t0_data_exp_shm_area+0xb4
	.word	0x4d750b9e	! t0_data_exp_shm_area+0xb8
	.word	0xc5079693	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d33f396684c7
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    6336
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5003

#define T0_KAOS_BOOT_VA                  0x47ba8000
#define T0_KAOS_BOOT_PA                  0x000000000111e000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x123ca000
#define T0_KAOS_STARTUP_PA               0x00000000023a6000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x2f0f6000
#define T0_KAOS_OFFSET_TBL_PA            0x00000000058c0000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x5d958000
#define T0_KAOS_DONE_PA                  0x0000000007192000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x70a5e000
#define T0_KAOS_KTBL_PA                  0x0000000008a1c000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x70c3c000
#define T0_KAOS_SUBR0_PA                 0x000000000aff6000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x709f0000
#define T0_KAOS_SUBR1_PA                 0x000000000dce8000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x709e6000
#define T0_KAOS_SUBR2_PA                 0x000000000fc30000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x70a0e000
#define T0_KAOS_SUBR3_PA                 0x0000000010110000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x644a4000
#define T0_KAOS_EXP_REGS_PA              0x0000000012d60000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x507c8000
#define T0_KAOS_RUN_REGS_PA              0x0000000015f32000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x33612000
#define T0_KAOS_EXP_STACK_PA             0x0000000017bd0000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x553f4000
#define T0_KAOS_RUN_STACK_PA             0x00000000190f0000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x48a96000
#define T0_KAOS_EXP_AREA0_PA             0x000000001ab92000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x4cdf4000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d6a2000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x2bb60000
#define T0_KAOS_EXP_SHM_AREA_PA          0x00000000016ba000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x00e14000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000019c2000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x4c3db4a9
#define T0_KAOS_RANVAL_01     0xb0b61f6d
#define T0_KAOS_RANVAL_02     0x766137fd
#define T0_KAOS_RANVAL_03     0xc3f5a0c8
#define T0_KAOS_RANVAL_04     0x833c2986
#define T0_KAOS_RANVAL_05     0xa4afa6c2
#define T0_KAOS_RANVAL_06     0x7014d4de
#define T0_KAOS_RANVAL_07     0xa3057d61
#define T0_KAOS_RANVAL_08     0x8f3833de
#define T0_KAOS_RANVAL_09     0x4864cf12
#define T0_KAOS_RANVAL_0a     0x9a78a15a
#define T0_KAOS_RANVAL_0b     0x217969fc
#define T0_KAOS_RANVAL_0c     0x007ca5ff
#define T0_KAOS_RANVAL_0d     0x473897ff
#define T0_KAOS_RANVAL_0e     0xcfcd7367
#define T0_KAOS_RANVAL_0f     0x4b040e5a
#define T0_KAOS_RANVAL_10     0xdeb261e0
#define T0_KAOS_RANVAL_11     0x3846d54d
#define T0_KAOS_RANVAL_12     0xb89d1f7d
#define T0_KAOS_RANVAL_13     0x68a87531
#define T0_KAOS_RANVAL_14     0xad3bc364
#define T0_KAOS_RANVAL_15     0x897985d9
#define T0_KAOS_RANVAL_16     0xd0dfb67c
#define T0_KAOS_RANVAL_17     0x6d603e3f
#define T0_KAOS_RANVAL_18     0x8165eae0
#define T0_KAOS_RANVAL_19     0x652825c9
#define T0_KAOS_RANVAL_1a     0x309c3dcc
#define T0_KAOS_RANVAL_1b     0xc12a5da2
#define T0_KAOS_RANVAL_1c     0xf105abda
#define T0_KAOS_RANVAL_1d     0x5e1d7004
#define T0_KAOS_RANVAL_1e     0xe51a45c5
#define T0_KAOS_RANVAL_1f     0x2475fc66
#define T0_KAOS_RANVAL_20     0x4d2e2414
#define T0_KAOS_RANVAL_21     0x2ab342e4
#define T0_KAOS_RANVAL_22     0x992c0251
#define T0_KAOS_RANVAL_23     0xd9024e60
#define T0_KAOS_RANVAL_24     0x1b0b3ec8
#define T0_KAOS_RANVAL_25     0x667b9c2a
#define T0_KAOS_RANVAL_26     0xb96ec9d0
#define T0_KAOS_RANVAL_27     0xb5857139
#define T0_KAOS_RANVAL_28     0x5ccaa834
#define T0_KAOS_RANVAL_29     0xdde8e032
#define T0_KAOS_RANVAL_2a     0x96da1e3b
#define T0_KAOS_RANVAL_2b     0x03f9a8cd
#define T0_KAOS_RANVAL_2c     0x1221f558
#define T0_KAOS_RANVAL_2d     0x6fd6e067
#define T0_KAOS_RANVAL_2e     0x14d3a48b
#define T0_KAOS_RANVAL_2f     0x58918cb5
#define T0_KAOS_RANVAL_30     0x7ba903fd
#define T0_KAOS_RANVAL_31     0xe8f954f8
#define T0_KAOS_RANVAL_32     0xa280ae5b
#define T0_KAOS_RANVAL_33     0x1648fb22
#define T0_KAOS_RANVAL_34     0x7a2bd6f9
#define T0_KAOS_RANVAL_35     0x2c4bbdcb
#define T0_KAOS_RANVAL_36     0xef7439cc
#define T0_KAOS_RANVAL_37     0x4f11e4ec
#define T0_KAOS_RANVAL_38     0xbb8772b1
#define T0_KAOS_RANVAL_39     0x7ce9deb1
#define T0_KAOS_RANVAL_3a     0x74628ba8
#define T0_KAOS_RANVAL_3b     0xa5f946ea
#define T0_KAOS_RANVAL_3c     0xedd97ddf
#define T0_KAOS_RANVAL_3d     0x40774adb
#define T0_KAOS_RANVAL_3e     0x6771c7c9
#define T0_KAOS_RANVAL_3f     0xf291e483
#define T0_KAOS_RANVAL_40     0x9002aa95
#define T0_KAOS_RANVAL_41     0x38afb38d
#define T0_KAOS_RANVAL_42     0x8b512bbb
#define T0_KAOS_RANVAL_43     0x93b79785
#define T0_KAOS_RANVAL_44     0x17f82b82
#define T0_KAOS_RANVAL_45     0x1620ee11
#define T0_KAOS_RANVAL_46     0xdeb6cfa0
#define T0_KAOS_RANVAL_47     0xad974935
#define T0_KAOS_RANVAL_48     0x7c60b972
#define T0_KAOS_RANVAL_49     0xb0aae4ed
#define T0_KAOS_RANVAL_4a     0x117e1154
#define T0_KAOS_RANVAL_4b     0x5914e8a6
#define T0_KAOS_RANVAL_4c     0xebbded1b
#define T0_KAOS_RANVAL_4d     0xe370e857
#define T0_KAOS_RANVAL_4e     0xbb9f0dd1
#define T0_KAOS_RANVAL_4f     0x0269f24e
#define T0_KAOS_RANVAL_50     0xd82af115
#define T0_KAOS_RANVAL_51     0x74ab11e9
#define T0_KAOS_RANVAL_52     0x32d9ccd3
#define T0_KAOS_RANVAL_53     0x9f6c5cd5
#define T0_KAOS_RANVAL_54     0xf7c5d02a
#define T0_KAOS_RANVAL_55     0xfd7daf90
#define T0_KAOS_RANVAL_56     0xfc7602be
#define T0_KAOS_RANVAL_57     0xdc96ff30
#define T0_KAOS_RANVAL_58     0x6f68e3d0
#define T0_KAOS_RANVAL_59     0x0de7e9ca
#define T0_KAOS_RANVAL_5a     0xd3228cbf
#define T0_KAOS_RANVAL_5b     0x0fe9c3ee
#define T0_KAOS_RANVAL_5c     0xd3ae26f2
#define T0_KAOS_RANVAL_5d     0xdc3a1910
#define T0_KAOS_RANVAL_5e     0x0c0e0b32
#define T0_KAOS_RANVAL_5f     0x6b493dd2
#define T0_KAOS_RANVAL_60     0xcb8e70f6
#define T0_KAOS_RANVAL_61     0x71977e90
#define T0_KAOS_RANVAL_62     0x74043e43
#define T0_KAOS_RANVAL_63     0x226a71a1
#define T0_KAOS_RANVAL_64     0xf48adcfb
#define T0_KAOS_RANVAL_65     0x2d0e541e
#define T0_KAOS_RANVAL_66     0x0bf208d7
#define T0_KAOS_RANVAL_67     0xabd0e93b
#define T0_KAOS_RANVAL_68     0xc26ee162
#define T0_KAOS_RANVAL_69     0x900c676c
#define T0_KAOS_RANVAL_6a     0x05ec3dac
#define T0_KAOS_RANVAL_6b     0xee3263f0
#define T0_KAOS_RANVAL_6c     0xc89ddb90
#define T0_KAOS_RANVAL_6d     0xf0a5b479
#define T0_KAOS_RANVAL_6e     0x16f39abe
#define T0_KAOS_RANVAL_6f     0x9cf4b80c
#define T0_KAOS_RANVAL_70     0x80c713f1
#define T0_KAOS_RANVAL_71     0xfb85b347
#define T0_KAOS_RANVAL_72     0x507296ec
#define T0_KAOS_RANVAL_73     0xa4afb9b3
#define T0_KAOS_RANVAL_74     0xd7077e3f
#define T0_KAOS_RANVAL_75     0xe7bb4cd0
#define T0_KAOS_RANVAL_76     0xd517e5db
#define T0_KAOS_RANVAL_77     0xcce63af4
#define T0_KAOS_RANVAL_78     0xa630ba03
#define T0_KAOS_RANVAL_79     0x1d1aab3a
#define T0_KAOS_RANVAL_7a     0x997ad61a
#define T0_KAOS_RANVAL_7b     0x6bc67917
#define T0_KAOS_RANVAL_7c     0xc461175c
#define T0_KAOS_RANVAL_7d     0x81ef5949
#define T0_KAOS_RANVAL_7e     0x1824ed87
#define T0_KAOS_RANVAL_7f     0x94f38b39
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
!    areaoffset     6336
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5003
!    code           70a5e000
!    entry          70a5e000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d33f396684c7
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

KTEXT_MODULE(t0_module_ktbl, 0x70a5e000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xf426001c	! t0_kref+0x0:   	st	%i2, [%i0 + %i4]
	.word	0x3b480003	! t0_kref+0x4:   	fble,a,pt	%fcc0, _kref+0x10
	.word	0x900b32dd	! t0_kref+0x8:   	and	%o4, -0xd23, %o0
	.word	0x9da0053b	! t0_kref+0xc:   	fsqrts	%f27, %f14
	.word	0xa67262cd	! t0_kref+0x10:   	udiv	%o1, 0x2cd, %l3
	.word	0xeed6101b	! t0_kref+0x14:   	ldsha	[%i0 + %i3]0x80, %l7
	.word	0xada01a3a	! t0_kref+0x18:   	fstoi	%f26, %f22
	.word	0xa9a0052e	! t0_kref+0x1c:   	fsqrts	%f14, %f20
	.word	0x37800008	! t0_kref+0x20:   	fbge,a	_kref+0x40
	.word	0xea20a008	! t0_kref+0x24:   	st	%l5, [%g2 + 8]
	.word	0xe8be5000	! t0_kref+0x28:   	stda	%l4, [%i1]0x80
	.word	0xa7a01a37	! t0_kref+0x2c:   	fstoi	%f23, %f19
	.word	0xab254017	! t0_kref+0x30:   	mulscc	%l5, %l7, %l5
	.word	0xd020a018	! t0_kref+0x34:   	st	%o0, [%g2 + 0x18]
	.word	0xc807bfe8	! t0_kref+0x38:   	ld	[%fp - 0x18], %g4
	.word	0xf207bfe0	! t0_kref+0x3c:   	ld	[%fp - 0x20], %i1
	.word	0xb9a01898	! t0_kref+0x40:   	fitos	%f24, %f28
	.word	0x28800001	! t0_kref+0x44:   	bleu,a	_kref+0x48
	.word	0xa1b44efd	! t0_kref+0x48:   	fornot2s	%f17, %f29, %f16
	.word	0xdd1e3ff8	! t0_kref+0x4c:   	ldd	[%i0 - 8], %f14
	.word	0x2b480006	! t0_kref+0x50:   	fbug,a,pt	%fcc0, _kref+0x68
	.word	0xa9b70ab6	! t0_kref+0x54:   	fpsub16s	%f28, %f22, %f20
	.word	0x9fc10000	! t0_kref+0x58:   	call	%g4
	.word	0xac0b39e9	! t0_kref+0x5c:   	and	%o4, -0x617, %l6
	.word	0xb9b74a2f	! t0_kref+0x60:   	fpadd16s	%f29, %f15, %f28
	.word	0x8143c000	! t0_kref+0x64:   	stbar
	.word	0xa6703e0d	! t0_kref+0x68:   	udiv	%g0, -0x1f3, %l3
	.word	0xb1a0055e	! t0_kref+0x6c:   	fsqrtd	%f30, %f24
	.word	0xafa01a56	! t0_kref+0x70:   	fdtoi	%f22, %f23
	.word	0x22480005	! t0_kref+0x74:   	be,a,pt	%icc, _kref+0x88
	.word	0x9db5c70c	! t0_kref+0x78:   	fmuld8sux16	%f23, %f12, %f14
	.word	0x80d6ae1d	! t0_kref+0x7c:   	umulcc	%i2, 0xe1d, %g0
	.word	0x3b800002	! t0_kref+0x80:   	fble,a	_kref+0x88
	.word	0xa835a6f2	! t0_kref+0x84:   	orn	%l6, 0x6f2, %l4
	.word	0xa82a4017	! t0_kref+0x88:   	andn	%o1, %l7, %l4
	.word	0x9de3bfa0	! t0_kref+0x8c:   	save	%sp, -0x60, %sp
	.word	0xb61f39f4	! t0_kref+0x90:   	xor	%i4, -0x60c, %i3
	.word	0x95eeec23	! t0_kref+0x94:   	restore	%i3, 0xc23, %o2
	.word	0xdf264000	! t0_kref+0x98:   	st	%f15, [%i1]
	.word	0x90d5f1c8	! t0_kref+0x9c:   	umulcc	%l7, -0xe38, %o0
	.word	0x99a0104e	! t0_kref+0xa0:   	fdtox	%f14, %f12
	.word	0xadb70e80	! t0_kref+0xa4:   	fsrc1	%f28, %f22
	.word	0xa9a00554	! t0_kref+0xa8:   	fsqrtd	%f20, %f20
	.word	0x81ad8a5e	! t0_kref+0xac:   	fcmpd	%fcc0, %f22, %f30
	.word	0x81dafbd1	! t0_kref+0xb0:   	flush	%o3 - 0x42f
	.word	0xb3b74a38	! t0_kref+0xb4:   	fpadd16s	%f29, %f24, %f25
	.word	0xb9a0052d	! t0_kref+0xb8:   	fsqrts	%f13, %f28
	.word	0xee36001b	! t0_kref+0xbc:   	sth	%l7, [%i0 + %i3]
	.word	0xa6300015	! t0_kref+0xc0:   	orn	%g0, %l5, %l3
	.word	0xa5a00558	! t0_kref+0xc4:   	fsqrtd	%f24, %f18
	.word	0xa9a00552	! t0_kref+0xc8:   	fsqrtd	%f18, %f20
	.word	0xb1a018d6	! t0_kref+0xcc:   	fdtos	%f22, %f24
	.word	0x81ac8a32	! t0_kref+0xd0:   	fcmps	%fcc0, %f18, %f18
	.word	0xd020a00c	! t0_kref+0xd4:   	st	%o0, [%g2 + 0xc]
	.word	0xa522c01a	! t0_kref+0xd8:   	mulscc	%o3, %i2, %l2
	.word	0xe1062014	! t0_kref+0xdc:   	ld	[%i0 + 0x14], %f16
	.word	0xb1aa405c	! t0_kref+0xe0:   	fmovde	%fcc0, %f28, %f24
	.word	0xac62801a	! t0_kref+0xe4:   	subc	%o2, %i2, %l6
	.word	0xc008a039	! t0_kref+0xe8:   	ldub	[%g2 + 0x39], %g0
	.word	0x9ae33057	! t0_kref+0xec:   	subccc	%o4, -0xfa9, %o5
	.word	0x97b3049c	! t0_kref+0xf0:   	fcmple32	%f12, %f28, %o3
	.word	0x2e800005	! t0_kref+0xf4:   	bvs,a	_kref+0x108
	.word	0xf91e6010	! t0_kref+0xf8:   	ldd	[%i1 + 0x10], %f28
	.word	0xec3e4000	! t0_kref+0xfc:   	std	%l6, [%i1]
	.word	0x8143c000	! t0_kref+0x100:   	stbar
	.word	0xea064000	! t0_kref+0x104:   	ld	[%i1], %l5
	.word	0xd81f4019	! t0_kref+0x108:   	ldd	[%i5 + %i1], %o4
	.word	0xb1b606ce	! t0_kref+0x10c:   	fmul8sux16	%f24, %f14, %f24
	.word	0xa535a003	! t0_kref+0x110:   	srl	%l6, 0x3, %l2
	.word	0xea8e101a	! t0_kref+0x114:   	lduba	[%i0 + %i2]0x80, %l5
	.word	0x9db00c00	! t0_kref+0x118:   	fzero	%f14
	.word	0xc036c018	! t0_kref+0x11c:   	clrh	[%i3 + %i0]
	.word	0x21800003	! t0_kref+0x120:   	fbn,a	_kref+0x12c
	.word	0x9bb6055e	! t0_kref+0x124:   	fcmpeq16	%f24, %f30, %o5
	.word	0x3a480002	! t0_kref+0x128:   	bcc,a,pt	%icc, _kref+0x130
	.word	0xb5b68c96	! t0_kref+0x12c:   	fandnot2	%f26, %f22, %f26
	.word	0x31480001	! t0_kref+0x130:   	fba,a,pt	%fcc0, _kref+0x134
	.word	0xa45a70b9	! t0_kref+0x134:   	smul	%o1, -0xf47, %l2
	.word	0x90d3400d	! t0_kref+0x138:   	umulcc	%o5, %o5, %o0
	.word	0x31480002	! t0_kref+0x13c:   	fba,a,pt	%fcc0, _kref+0x144
	.word	0xe6c81018	! t0_kref+0x140:   	ldsba	[%g0 + %i0]0x80, %l3
	.word	0x81b7849a	! t0_kref+0x144:   	fcmple32	%f30, %f26, %g0
	.word	0x94a2f76a	! t0_kref+0x148:   	subcc	%o3, -0x896, %o2
	.word	0xda40a030	! t0_kref+0x14c:   	ldsw	[%g2 + 0x30], %o5
	.word	0x9fa58834	! t0_kref+0x150:   	fadds	%f22, %f20, %f15
	.word	0x9335c016	! t0_kref+0x154:   	srl	%l7, %l6, %o1
	.word	0xac15800a	! t0_kref+0x158:   	or	%l6, %o2, %l6
	.word	0xd6562014	! t0_kref+0x15c:   	ldsh	[%i0 + 0x14], %o3
	.word	0x941a400a	! t0_kref+0x160:   	xor	%o1, %o2, %o2
	.word	0xac928009	! t0_kref+0x164:   	orcc	%o2, %o1, %l6
	.word	0x80926460	! t0_kref+0x168:   	orcc	%o1, 0x460, %g0
	.word	0x81dea120	! t0_kref+0x16c:   	flush	%i2 + 0x120
	.word	0xd620a014	! t0_kref+0x170:   	st	%o3, [%g2 + 0x14]
	.word	0xaa75b189	! t0_kref+0x174:   	udiv	%l6, -0xe77, %l5
	.word	0x38800005	! t0_kref+0x178:   	bgu,a	_kref+0x18c
	.word	0xd228a031	! t0_kref+0x17c:   	stb	%o1, [%g2 + 0x31]
	.word	0xa3a01a3a	! t0_kref+0x180:   	fstoi	%f26, %f17
	.word	0x9132801a	! t0_kref+0x184:   	srl	%o2, %i2, %o0
	.word	0x173cc83f	! t0_kref+0x188:   	sethi	%hi(0xf320fc00), %o3
	.word	0x33800008	! t0_kref+0x18c:   	fbe,a	_kref+0x1ac
	.word	0xada788de	! t0_kref+0x190:   	fsubd	%f30, %f30, %f22
	.word	0x30480001	! t0_kref+0x194:   	ba,a,pt	%icc, _kref+0x198
	.word	0xf726600c	! t0_kref+0x198:   	st	%f27, [%i1 + 0xc]
	.word	0xc0a6101c	! t0_kref+0x19c:   	sta	%g0, [%i0 + %i4]0x80
	.word	0xec28a014	! t0_kref+0x1a0:   	stb	%l6, [%g2 + 0x14]
	.word	0xd07e4000	! t0_kref+0x1a4:   	swap	[%i1], %o0
	.word	0xd8801018	! t0_kref+0x1a8:   	lda	[%g0 + %i0]0x80, %o4
	.word	0xdd1e3ff0	! t0_kref+0x1ac:   	ldd	[%i0 - 0x10], %f14
	.word	0xada00532	! t0_kref+0x1b0:   	fsqrts	%f18, %f22
	.word	0xea68a01a	! t0_kref+0x1b4:   	ldstub	[%g2 + 0x1a], %l5
	.word	0x8143e040	! t0_kref+0x1b8:   	membar	0x40
	.word	0xb9a5885e	! t0_kref+0x1bc:   	faddd	%f22, %f30, %f28
	.word	0xb5a00554	! t0_kref+0x1c0:   	fsqrtd	%f20, %f26
	.word	0x9de3bfa0	! t0_kref+0x1c4:   	save	%sp, -0x60, %sp
	.word	0xb63eb152	! t0_kref+0x1c8:   	xnor	%i2, -0xeae, %i3
	.word	0xa9ef786b	! t0_kref+0x1cc:   	restore	%i5, -0x795, %l4
	.word	0xae5af3e3	! t0_kref+0x1d0:   	smul	%o3, -0xc1d, %l7
	.word	0xa3a01893	! t0_kref+0x1d4:   	fitos	%f19, %f17
	.word	0x2d800007	! t0_kref+0x1d8:   	fbg,a	_kref+0x1f4
	.word	0x96d5800a	! t0_kref+0x1dc:   	umulcc	%l6, %o2, %o3
	.word	0xc807bfe8	! t0_kref+0x1e0:   	ld	[%fp - 0x18], %g4
	.word	0xbda000d0	! t0_kref+0x1e4:   	fnegd	%f16, %f30
	.word	0xa1a3c83b	! t0_kref+0x1e8:   	fadds	%f15, %f27, %f16
	.word	0x2f185686	! t0_kref+0x1ec:   	sethi	%hi(0x615a1800), %l7
	.word	0xc1ee5015	! t0_kref+0x1f0:   	prefetcha	%i1 + %l5, 0
	.word	0xb1a0191b	! t0_kref+0x1f4:   	fitod	%f27, %f24
	.word	0xa9a018cc	! t0_kref+0x1f8:   	fdtos	%f12, %f20
	.word	0xa9a509ce	! t0_kref+0x1fc:   	fdivd	%f20, %f14, %f20
	.word	0xd036c019	! t0_kref+0x200:   	sth	%o0, [%i3 + %i1]
	.word	0xbda00532	! t0_kref+0x204:   	fsqrts	%f18, %f30
	.word	0x3c480006	! t0_kref+0x208:   	bpos,a,pt	%icc, _kref+0x220
	.word	0xa7800009	! t0_kref+0x20c:   	mov	%o1, %gsr
	.word	0xec30a000	! t0_kref+0x210:   	sth	%l6, [%g2]
	.word	0xe868a016	! t0_kref+0x214:   	ldstub	[%g2 + 0x16], %l4
	.word	0xa4b5f2a5	! t0_kref+0x218:   	orncc	%l7, -0xd5b, %l2
	.word	0xf91e401d	! t0_kref+0x21c:   	ldd	[%i1 + %i5], %f28
	.word	0xef20a034	! t0_kref+0x220:   	st	%f23, [%g2 + 0x34]
	.word	0xbdb00c20	! t0_kref+0x224:   	fzeros	%f30
	.word	0xc0063fec	! t0_kref+0x228:   	ld	[%i0 - 0x14], %g0
	.word	0xecc01019	! t0_kref+0x22c:   	ldswa	[%g0 + %i1]0x80, %l6
	.word	0xaad32141	! t0_kref+0x230:   	umulcc	%o4, 0x141, %l5
	.word	0xee262008	! t0_kref+0x234:   	st	%l7, [%i0 + 8]
	.word	0xb5a00532	! t0_kref+0x238:   	fsqrts	%f18, %f26
	.word	0xb5a018d6	! t0_kref+0x23c:   	fdtos	%f22, %f26
	.word	0xb5a5885a	! t0_kref+0x240:   	faddd	%f22, %f26, %f26
	.word	0xf19f1a59	! t0_kref+0x244:   	ldda	[%i4 + %i1]0xd2, %f24
	.word	0xbda0189a	! t0_kref+0x248:   	fitos	%f26, %f30
	.word	0x9ad5c01a	! t0_kref+0x24c:   	umulcc	%l7, %i2, %o5
	.word	0xd81e001d	! t0_kref+0x250:   	ldd	[%i0 + %i5], %o4
	.word	0x29800008	! t0_kref+0x254:   	fbl,a	_kref+0x274
	.word	0xaf22c009	! t0_kref+0x258:   	mulscc	%o3, %o1, %l7
	.word	0x9abdb9c5	! t0_kref+0x25c:   	xnorcc	%l6, -0x63b, %o5
	.word	0x27800005	! t0_kref+0x260:   	fbul,a	_kref+0x274
	.word	0x9a432a44	! t0_kref+0x264:   	addc	%o4, 0xa44, %o5
	.word	0x193d8b5a	! t0_kref+0x268:   	sethi	%hi(0xf62d6800), %o4
	.word	0xa9a608da	! t0_kref+0x26c:   	fsubd	%f24, %f26, %f20
	.word	0xe8b81019	! t0_kref+0x270:   	stda	%l4, [%g0 + %i1]0x80
	.word	0x27480002	! t0_kref+0x274:   	fbul,a,pt	%fcc0, _kref+0x27c
	.word	0x9536a00a	! t0_kref+0x278:   	srl	%i2, 0xa, %o2
	.word	0x81ae4a2f	! t0_kref+0x27c:   	fcmps	%fcc0, %f25, %f15
	.word	0xaba01a4e	! t0_kref+0x280:   	fdtoi	%f14, %f21
	.word	0x9ba01a37	! t0_kref+0x284:   	fstoi	%f23, %f13
	.word	0x9335801a	! t0_kref+0x288:   	srl	%l6, %i2, %o1
	.word	0xac700017	! t0_kref+0x28c:   	udiv	%g0, %l7, %l6
	.word	0xe6070005	! t0_kref+0x290:   	ld	[%i4 + %g5], %l3
	.word	0xd228a003	! t0_kref+0x294:   	stb	%o1, [%g2 + 3]
	.word	0xb1b486f4	! t0_kref+0x298:   	fmul8ulx16	%f18, %f20, %f24
	.word	0xda20a03c	! t0_kref+0x29c:   	st	%o5, [%g2 + 0x3c]
	.word	0x94620015	! t0_kref+0x2a0:   	subc	%o0, %l5, %o2
	.word	0xbba308be	! t0_kref+0x2a4:   	fsubs	%f12, %f30, %f29
	.word	0x93b68160	! t0_kref+0x2a8:   	edge32ln	%i2, %g0, %o1
	.word	0xec3e6018	! t0_kref+0x2ac:   	std	%l6, [%i1 + 0x18]
	.word	0x8143c000	! t0_kref+0x2b0:   	stbar
	.word	0x99b38d12	! t0_kref+0x2b4:   	fandnot1	%f14, %f18, %f12
	.word	0xd0000019	! t0_kref+0x2b8:   	ld	[%g0 + %i1], %o0
	.word	0x8143e05b	! t0_kref+0x2bc:   	membar	0x5b
	.word	0xb1b54cad	! t0_kref+0x2c0:   	fandnot2s	%f21, %f13, %f24
	.word	0xec4e4000	! t0_kref+0x2c4:   	ldsb	[%i1], %l6
	.word	0x99b28280	! t0_kref+0x2c8:   	array32	%o2, %g0, %o4
	.word	0xa9b58a9e	! t0_kref+0x2cc:   	fpsub16	%f22, %f30, %f20
	.word	0xa9a018d2	! t0_kref+0x2d0:   	fdtos	%f18, %f20
	.word	0xd8a6501c	! t0_kref+0x2d4:   	sta	%o4, [%i1 + %i4]0x80
	.word	0xaba40837	! t0_kref+0x2d8:   	fadds	%f16, %f23, %f21
	.word	0xdd1e001d	! t0_kref+0x2dc:   	ldd	[%i0 + %i5], %f14
	.word	0xf1be1855	! t0_kref+0x2e0:   	stda	%f24, [%i0 + %l5]0xc2
	.word	0xb1b707d8	! t0_kref+0x2e4:   	pdist	%f28, %f24, %f24
	.word	0xa9a018d6	! t0_kref+0x2e8:   	fdtos	%f22, %f20
	.word	0xa1a01114	! t0_kref+0x2ec:   	fxtod	%f20, %f16
	.word	0xada408d6	! t0_kref+0x2f0:   	fsubd	%f16, %f22, %f22
	.word	0x3e480004	! t0_kref+0x2f4:   	bvc,a,pt	%icc, _kref+0x304
	.word	0x812dc009	! t0_kref+0x2f8:   	sll	%l7, %o1, %g0
	.word	0xee0e200f	! t0_kref+0x2fc:   	ldub	[%i0 + 0xf], %l7
	.word	0xa4b22cc5	! t0_kref+0x300:   	orncc	%o0, 0xcc5, %l2
	.word	0x23800005	! t0_kref+0x304:   	fbne,a	_kref+0x318
	.word	0x99b487dc	! t0_kref+0x308:   	pdist	%f18, %f28, %f12
	.word	0xa476bff0	! t0_kref+0x30c:   	udiv	%i2, -0x10, %l2
	.word	0xd8500018	! t0_kref+0x310:   	ldsh	[%g0 + %i0], %o4
	.word	0xadab0039	! t0_kref+0x314:   	fmovsuge	%fcc0, %f25, %f22
	.word	0x81dd0008	! t0_kref+0x318:   	flush	%l4 + %o0
	.word	0x940d800c	! t0_kref+0x31c:   	and	%l6, %o4, %o2
	.word	0xee280019	! t0_kref+0x320:   	stb	%l7, [%g0 + %i1]
	.word	0xa812000c	! t0_kref+0x324:   	or	%o0, %o4, %l4
	.word	0xa1b4472e	! t0_kref+0x328:   	fmuld8ulx16	%f17, %f14, %f16
	.word	0x8143c000	! t0_kref+0x32c:   	stbar
	.word	0x35800003	! t0_kref+0x330:   	fbue,a	_kref+0x33c
	.word	0xaaaaf9f8	! t0_kref+0x334:   	andncc	%o3, -0x608, %l5
	.word	0xe520a018	! t0_kref+0x338:   	st	%f18, [%g2 + 0x18]
	.word	0xae732ea6	! t0_kref+0x33c:   	udiv	%o4, 0xea6, %l7
	.word	0xe3ee501d	! t0_kref+0x340:   	prefetcha	%i1 + %i5, 17
	.word	0x39800007	! t0_kref+0x344:   	fbuge,a	_kref+0x360
	.word	0xe9ee501a	! t0_kref+0x348:   	prefetcha	%i1 + %i2, 20
	.word	0x2502a8ca	! t0_kref+0x34c:   	sethi	%hi(0xaa32800), %l2
	.word	0xea30a018	! t0_kref+0x350:   	sth	%l5, [%g2 + 0x18]
	.word	0x81aeca2e	! t0_kref+0x354:   	fcmps	%fcc0, %f27, %f14
	.word	0xa8227d57	! t0_kref+0x358:   	sub	%o1, -0x2a9, %l4
	.word	0xa465bb46	! t0_kref+0x35c:   	subc	%l6, -0x4ba, %l2
	.word	0xd250a008	! t0_kref+0x360:   	ldsh	[%g2 + 8], %o1
	.word	0x949d4017	! t0_kref+0x364:   	xorcc	%l5, %l7, %o2
	.word	0x150f2249	! t0_kref+0x368:   	sethi	%hi(0x3c892400), %o2
	.word	0xc0067ff4	! t0_kref+0x36c:   	ld	[%i1 - 0xc], %g0
	.word	0xfb200018	! t0_kref+0x370:   	st	%f29, [%g0 + %i0]
	.word	0x9a1eb2a8	! t0_kref+0x374:   	xor	%i2, -0xd58, %o5
	.word	0x81af8a56	! t0_kref+0x378:   	fcmpd	%fcc0, %f30, %f22
	.word	0x9fc10000	! t0_kref+0x37c:   	call	%g4
	.word	0xe07e7ff4	! t0_kref+0x380:   	swap	[%i1 - 0xc], %l0
	.word	0xa1b70eec	! t0_kref+0x384:   	fornot2s	%f28, %f12, %f16
	.word	0xe4d6d019	! t0_kref+0x388:   	ldsha	[%i3 + %i1]0x80, %l2
	.word	0xfb00a000	! t0_kref+0x38c:   	ld	[%g2], %f29
	.word	0xd906001c	! t0_kref+0x390:   	ld	[%i0 + %i4], %f12
	.word	0xa8d57b90	! t0_kref+0x394:   	umulcc	%l5, -0x470, %l4
	.word	0x9af24009	! t0_kref+0x398:   	udivcc	%o1, %o1, %o5
	.word	0x81254009	! t0_kref+0x39c:   	mulscc	%l5, %o1, %g0
	.word	0x98257a72	! t0_kref+0x3a0:   	sub	%l5, -0x58e, %o4
	.word	0xb1b68adc	! t0_kref+0x3a4:   	fpsub32	%f26, %f28, %f24
	.word	0xb1a00558	! t0_kref+0x3a8:   	fsqrtd	%f24, %f24
	.word	0x9344c000	! t0_kref+0x3ac:   	mov	%gsr, %o1
	.word	0xa7b60a33	! t0_kref+0x3b0:   	fpadd16s	%f24, %f19, %f19
	.word	0x9370000b	! t0_kref+0x3b4:   	popc	%o3, %o1
	.word	0x81dd73a6	! t0_kref+0x3b8:   	flush	%l5 - 0xc5a
	.word	0x9fb2c0ca	! t0_kref+0x3bc:   	edge16l	%o3, %o2, %o7
	.word	0x988dc00c	! t0_kref+0x3c0:   	andcc	%l7, %o4, %o4
	.word	0x21800008	! t0_kref+0x3c4:   	fbn,a	_kref+0x3e4
	.word	0xeb20a028	! t0_kref+0x3c8:   	st	%f21, [%g2 + 0x28]
	.word	0xe9be1816	! t0_kref+0x3cc:   	stda	%f20, [%i0 + %l6]0xc0
	.word	0xec7e0000	! t0_kref+0x3d0:   	swap	[%i0], %l6
	.word	0xee8e501a	! t0_kref+0x3d4:   	lduba	[%i1 + %i2]0x80, %l7
	.word	0x945a8017	! t0_kref+0x3d8:   	smul	%o2, %l7, %o2
	.word	0xd3f61009	! t0_kref+0x3dc:   	casxa	[%i0]0x80, %o1, %o1
	.word	0x80aac015	! t0_kref+0x3e0:   	andncc	%o3, %l5, %g0
	.word	0x991dbf2a	! t0_kref+0x3e4:   	tsubcctv	%l6, -0xd6, %o4
	.word	0xf11e3ff8	! t0_kref+0x3e8:   	ldd	[%i0 - 8], %f24
	.word	0xb7b74db7	! t0_kref+0x3ec:   	fxors	%f29, %f23, %f27
	.word	0x95408000	! t0_kref+0x3f0:   	mov	%ccr, %o2
	.word	0x272529e2	! t0_kref+0x3f4:   	sethi	%hi(0x94a78800), %l3
	.word	0xea28a025	! t0_kref+0x3f8:   	stb	%l5, [%g2 + 0x25]
	.word	0xf420a024	! t0_kref+0x3fc:   	st	%i2, [%g2 + 0x24]
	.word	0xbda01a32	! t0_kref+0x400:   	fstoi	%f18, %f30
	.word	0x9fc00004	! t0_kref+0x404:   	call	%g0 + %g4
	.word	0xda462018	! t0_kref+0x408:   	ldsw	[%i0 + 0x18], %o5
	.word	0x28480004	! t0_kref+0x40c:   	bleu,a,pt	%icc, _kref+0x41c
	.word	0x92a80017	! t0_kref+0x410:   	andncc	%g0, %l7, %o1
	.word	0xafa018d4	! t0_kref+0x414:   	fdtos	%f20, %f23
	.word	0x96357f3a	! t0_kref+0x418:   	orn	%l5, -0xc6, %o3
	.word	0xe8bf5018	! t0_kref+0x41c:   	stda	%l4, [%i5 + %i0]0x80
	.word	0xa822400a	! t0_kref+0x420:   	sub	%o1, %o2, %l4
	.word	0x28480008	! t0_kref+0x424:   	bleu,a,pt	%icc, _kref+0x444
	.word	0xb1a6885c	! t0_kref+0x428:   	faddd	%f26, %f28, %f24
	.word	0xa9332012	! t0_kref+0x42c:   	srl	%o4, 0x12, %l4
	.word	0x98134008	! t0_kref+0x430:   	or	%o5, %o0, %o4
	.word	0xc008a03a	! t0_kref+0x434:   	ldub	[%g2 + 0x3a], %g0
	.word	0xadb50ecc	! t0_kref+0x438:   	fornot2	%f20, %f12, %f22
	.word	0xd6c6501c	! t0_kref+0x43c:   	ldswa	[%i1 + %i4]0x80, %o3
	.word	0x96b68000	! t0_kref+0x440:   	orncc	%i2, %g0, %o3
	.word	0x9bb34df4	! t0_kref+0x444:   	fnands	%f13, %f20, %f13
	.word	0xa62a64fc	! t0_kref+0x448:   	andn	%o1, 0x4fc, %l3
	.word	0x9ad2c000	! t0_kref+0x44c:   	umulcc	%o3, %g0, %o5
	.word	0x96300015	! t0_kref+0x450:   	orn	%g0, %l5, %o3
	.word	0x9f1b4017	! t0_kref+0x454:   	tsubcctv	%o5, %l7, %o7
	.word	0x9fc10000	! t0_kref+0x458:   	call	%g4
	.word	0xd9000019	! t0_kref+0x45c:   	ld	[%g0 + %i1], %f12
	.word	0xa49df67a	! t0_kref+0x460:   	xorcc	%l7, -0x986, %l2
	.word	0xf9be188d	! t0_kref+0x464:   	stda	%f28, [%i0 + %o5]0xc4
	.word	0xf007bfe0	! t0_kref+0x468:   	ld	[%fp - 0x20], %i0
	.word	0xe67e7ff4	! t0_kref+0x46c:   	swap	[%i1 - 0xc], %l3
	.word	0xb9a01a5a	! t0_kref+0x470:   	fdtoi	%f26, %f28
	.word	0x37800003	! t0_kref+0x474:   	fbge,a	_kref+0x480
	.word	0x99702ec9	! t0_kref+0x478:   	popc	0xec9, %o4
	.word	0xe8be1000	! t0_kref+0x47c:   	stda	%l4, [%i0]0x80
	.word	0x9b400000	! t0_kref+0x480:   	mov	%y, %o5
	.word	0xee08a02c	! t0_kref+0x484:   	ldub	[%g2 + 0x2c], %l7
	.word	0x81ae0a3e	! t0_kref+0x488:   	fcmps	%fcc0, %f24, %f30
	.word	0xa1a00558	! t0_kref+0x48c:   	fsqrtd	%f24, %f16
	.word	0x81ac8a39	! t0_kref+0x490:   	fcmps	%fcc0, %f18, %f25
	.word	0x99b009b3	! t0_kref+0x494:   	fexpand	%f19, %f12
	.word	0x33800002	! t0_kref+0x498:   	fbe,a	_kref+0x4a0
	.word	0xdf20a03c	! t0_kref+0x49c:   	st	%f15, [%g2 + 0x3c]
	.word	0xd900a00c	! t0_kref+0x4a0:   	ld	[%g2 + 0xc], %f12
	.word	0xb3a0002c	! t0_kref+0x4a4:   	fmovs	%f12, %f25
	.word	0xbba00534	! t0_kref+0x4a8:   	fsqrts	%f20, %f29
	.word	0xf420a020	! t0_kref+0x4ac:   	st	%i2, [%g2 + 0x20]
	.word	0xb9a018ce	! t0_kref+0x4b0:   	fdtos	%f14, %f28
	.word	0xb5b00fe0	! t0_kref+0x4b4:   	fones	%f26
	.word	0xd2580018	! t0_kref+0x4b8:   	ldx	[%g0 + %i0], %o1
	.word	0xd086101c	! t0_kref+0x4bc:   	lda	[%i0 + %i4]0x80, %o0
	.word	0x99180009	! t0_kref+0x4c0:   	tsubcctv	%g0, %o1, %o4
	.word	0x802ea5af	! t0_kref+0x4c4:   	andn	%i2, 0x5af, %g0
	.word	0xde06001c	! t0_kref+0x4c8:   	ld	[%i0 + %i4], %o7
	.word	0xa9a00552	! t0_kref+0x4cc:   	fsqrtd	%f18, %f20
	.word	0xac702bb7	! t0_kref+0x4d0:   	udiv	%g0, 0xbb7, %l6
	.word	0xb5a018da	! t0_kref+0x4d4:   	fdtos	%f26, %f26
	.word	0x81dec015	! t0_kref+0x4d8:   	flush	%i3 + %l5
	.word	0xf51f4019	! t0_kref+0x4dc:   	ldd	[%i5 + %i1], %f26
	.word	0xf926001c	! t0_kref+0x4e0:   	st	%f28, [%i0 + %i4]
	.word	0x80f2700c	! t0_kref+0x4e4:   	udivcc	%o1, -0xff4, %g0
	.word	0x81ac8a39	! t0_kref+0x4e8:   	fcmps	%fcc0, %f18, %f25
	.word	0x99a00552	! t0_kref+0x4ec:   	fsqrtd	%f18, %f12
	.word	0xe11e0000	! t0_kref+0x4f0:   	ldd	[%i0], %f16
	.word	0xa8728017	! t0_kref+0x4f4:   	udiv	%o2, %l7, %l4
	.word	0x92b2af00	! t0_kref+0x4f8:   	orncc	%o2, 0xf00, %o1
	.word	0xf11e3fe0	! t0_kref+0x4fc:   	ldd	[%i0 - 0x20], %f24
	.word	0xd220a024	! t0_kref+0x500:   	st	%o1, [%g2 + 0x24]
	.word	0xc768a00b	! t0_kref+0x504:   	prefetch	%g2 + 0xb, 3
	.word	0xee2e8018	! t0_kref+0x508:   	stb	%l7, [%i2 + %i0]
	.word	0xec564000	! t0_kref+0x50c:   	ldsh	[%i1], %l6
	.word	0xafb50ea0	! t0_kref+0x510:   	fsrc1s	%f20, %f23
	.word	0xc168a08c	! t0_kref+0x514:   	prefetch	%g2 + 0x8c, 0
	.word	0xed000018	! t0_kref+0x518:   	ld	[%g0 + %i0], %f22
	.word	0xa9a00533	! t0_kref+0x51c:   	fsqrts	%f19, %f20
	.word	0x9db00f0c	! t0_kref+0x520:   	fsrc2	%f12, %f14
	.word	0xac0dfc11	! t0_kref+0x524:   	and	%l7, -0x3ef, %l6
	.word	0xfd00a028	! t0_kref+0x528:   	ld	[%g2 + 0x28], %f30
	.word	0xa1a01039	! t0_kref+0x52c:   	fstox	%f25, %f16
	.word	0xa9b30137	! t0_kref+0x530:   	edge32n	%o4, %l7, %l4
	.word	0xa1a0055a	! t0_kref+0x534:   	fsqrtd	%f26, %f16
	.word	0xd2881018	! t0_kref+0x538:   	lduba	[%g0 + %i0]0x80, %o1
	.word	0x96e2c01a	! t0_kref+0x53c:   	subccc	%o3, %i2, %o3
	.word	0xf91e3fe0	! t0_kref+0x540:   	ldd	[%i0 - 0x20], %f28
	.word	0xa3a000ba	! t0_kref+0x544:   	fnegs	%f26, %f17
	.word	0x9fa7892d	! t0_kref+0x548:   	fmuls	%f30, %f13, %f15
	.word	0xb5a389de	! t0_kref+0x54c:   	fdivd	%f14, %f30, %f26
	.word	0xd676001d	! t0_kref+0x550:   	stx	%o3, [%i0 + %i5]
	.word	0x3d800006	! t0_kref+0x554:   	fbule,a	_kref+0x56c
	.word	0xa736a002	! t0_kref+0x558:   	srl	%i2, 0x2, %l3
	.word	0x80f5fb27	! t0_kref+0x55c:   	udivcc	%l7, -0x4d9, %g0
	.word	0x80c20009	! t0_kref+0x560:   	addccc	%o0, %o1, %g0
	.word	0xb9a389dc	! t0_kref+0x564:   	fdivd	%f14, %f28, %f28
	.word	0xa3a00533	! t0_kref+0x568:   	fsqrts	%f19, %f17
	.word	0xd4062000	! t0_kref+0x56c:   	ld	[%i0], %o2
	.word	0xa45a0000	! t0_kref+0x570:   	smul	%o0, %g0, %l2
	.word	0x9da00552	! t0_kref+0x574:   	fsqrtd	%f18, %f14
	.word	0xb5b00cf4	! t0_kref+0x578:   	fnot2s	%f20, %f26
	.word	0x26480003	! t0_kref+0x57c:   	bl,a,pt	%icc, _kref+0x588
	.word	0xe3ee101c	! t0_kref+0x580:   	prefetcha	%i0 + %i4, 17
	.word	0x96856de2	! t0_kref+0x584:   	addcc	%l5, 0xde2, %o3
	.word	0xa3b00cfc	! t0_kref+0x588:   	fnot2s	%f28, %f17
	.word	0x9e66a276	! t0_kref+0x58c:   	subc	%i2, 0x276, %o7
	.word	0xa4e2e161	! t0_kref+0x590:   	subccc	%o3, 0x161, %l2
	.word	0xec78a000	! t0_kref+0x594:   	swap	[%g2], %l6
	.word	0x35480008	! t0_kref+0x598:   	fbue,a,pt	%fcc0, _kref+0x5b8
	.word	0xb5b00c20	! t0_kref+0x59c:   	fzeros	%f26
	.word	0xa1a589dc	! t0_kref+0x5a0:   	fdivd	%f22, %f28, %f16
	.word	0x946234bc	! t0_kref+0x5a4:   	subc	%o0, -0xb44, %o2
	.word	0xec1e4000	! t0_kref+0x5a8:   	ldd	[%i1], %l6
	.word	0x93400000	! t0_kref+0x5ac:   	mov	%y, %o1
	.word	0xa1b5cd38	! t0_kref+0x5b0:   	fandnot1s	%f23, %f24, %f16
	.word	0x9ba000af	! t0_kref+0x5b4:   	fnegs	%f15, %f13
	.word	0xa8d24016	! t0_kref+0x5b8:   	umulcc	%o1, %l6, %l4
	.word	0xee366016	! t0_kref+0x5bc:   	sth	%l7, [%i1 + 0x16]
	.word	0x9618310b	! t0_kref+0x5c0:   	xor	%g0, -0xef5, %o3
	.word	0xc768a043	! t0_kref+0x5c4:   	prefetch	%g2 + 0x43, 3
	.word	0x28480008	! t0_kref+0x5c8:   	bleu,a,pt	%icc, _kref+0x5e8
	.word	0xb1b30e80	! t0_kref+0x5cc:   	fsrc1	%f12, %f24
	.word	0xb9a00537	! t0_kref+0x5d0:   	fsqrts	%f23, %f28
	.word	0xfd1f4018	! t0_kref+0x5d4:   	ldd	[%i5 + %i0], %f30
	.word	0xea270019	! t0_kref+0x5d8:   	st	%l5, [%i4 + %i1]
	.word	0xb7b00fe0	! t0_kref+0x5dc:   	fones	%f27
	.word	0xa940c000	! t0_kref+0x5e0:   	mov	%asi, %l4
	.word	0xc00e8019	! t0_kref+0x5e4:   	ldub	[%i2 + %i1], %g0
	.word	0xa60e800b	! t0_kref+0x5e8:   	and	%i2, %o3, %l3
	.word	0x9fa00135	! t0_kref+0x5ec:   	fabss	%f21, %f15
	.word	0xc0780018	! t0_kref+0x5f0:   	swap	[%g0 + %i0], %g0
	.word	0xd00e8018	! t0_kref+0x5f4:   	ldub	[%i2 + %i0], %o0
	.word	0xa1a00533	! t0_kref+0x5f8:   	fsqrts	%f19, %f16
	.word	0x982823c6	! t0_kref+0x5fc:   	andn	%g0, 0x3c6, %o4
	.word	0x99a70d3d	! t0_kref+0x600:   	fsmuld	%f28, %f29, %f12
	.word	0xca11401b	! t0_kref+0x604:   	lduh	[%g5 + %i3], %g5
	.word	0xa8ad400c	! t0_kref+0x608:   	andncc	%l5, %o4, %l4
	.word	0xe81f4018	! t0_kref+0x60c:   	ldd	[%i5 + %i0], %l4
	.word	0x9bb2c000	! t0_kref+0x610:   	edge8	%o3, %g0, %o5
	.word	0x9ba0002e	! t0_kref+0x614:   	fmovs	%f14, %f13
	.word	0xc807bfe4	! t0_kref+0x618:   	ld	[%fp - 0x1c], %g4
	.word	0xaaf28017	! t0_kref+0x61c:   	udivcc	%o2, %l7, %l5
	.word	0xf9be1880	! t0_kref+0x620:   	stda	%f28, [%i0]0xc4
	.word	0xaed34017	! t0_kref+0x624:   	umulcc	%o5, %l7, %l7
	.word	0xeb68a086	! t0_kref+0x628:   	prefetch	%g2 + 0x86, 21
	.word	0xec1e001d	! t0_kref+0x62c:   	ldd	[%i0 + %i5], %l6
	.word	0x81224000	! t0_kref+0x630:   	mulscc	%o1, %g0, %g0
	.word	0xee20a018	! t0_kref+0x634:   	st	%l7, [%g2 + 0x18]
	.word	0xd828a010	! t0_kref+0x638:   	stb	%o4, [%g2 + 0x10]
	.word	0xc02e7fe6	! t0_kref+0x63c:   	clrb	[%i1 - 0x1a]
	.word	0xa1a0103c	! t0_kref+0x640:   	fstox	%f28, %f16
	.word	0xb1b50efc	! t0_kref+0x644:   	fornot2s	%f20, %f28, %f24
	.word	0xafb34336	! t0_kref+0x648:   	bmask	%o5, %l6, %l7
	.word	0xda363fec	! t0_kref+0x64c:   	sth	%o5, [%i0 - 0x14]
	.word	0xb1a00552	! t0_kref+0x650:   	fsqrtd	%f18, %f24
	.word	0xa5a0003a	! t0_kref+0x654:   	fmovs	%f26, %f18
	.word	0xe51f4019	! t0_kref+0x658:   	ldd	[%i5 + %i1], %f18
	.word	0xee480018	! t0_kref+0x65c:   	ldsb	[%g0 + %i0], %l7
	.word	0xed180018	! t0_kref+0x660:   	ldd	[%g0 + %i0], %f22
	.word	0x94827bae	! t0_kref+0x664:   	addcc	%o1, -0x452, %o2
	.word	0x8120397f	! t0_kref+0x668:   	mulscc	%g0, -0x681, %g0
	.word	0xada00550	! t0_kref+0x66c:   	fsqrtd	%f16, %f22
	.word	0x99b2c0a9	! t0_kref+0x670:   	edge16n	%o3, %o1, %o4
	.word	0x8143e040	! t0_kref+0x674:   	membar	0x40
	.word	0x9fb00cee	! t0_kref+0x678:   	fnot2s	%f14, %f15
	.word	0xae423d83	! t0_kref+0x67c:   	addc	%o0, -0x27d, %l7
	.word	0xa5b50e16	! t0_kref+0x680:   	fand	%f20, %f22, %f18
	.word	0xd27e4000	! t0_kref+0x684:   	swap	[%i1], %o1
	.word	0xa42a62d7	! t0_kref+0x688:   	andn	%o1, 0x2d7, %l2
	.word	0xf720a010	! t0_kref+0x68c:   	st	%f27, [%g2 + 0x10]
	.word	0x36480007	! t0_kref+0x690:   	bge,a,pt	%icc, _kref+0x6ac
	.word	0xbda5884c	! t0_kref+0x694:   	faddd	%f22, %f12, %f30
	.word	0xb5a01a39	! t0_kref+0x698:   	fstoi	%f25, %f26
	.word	0x8135a004	! t0_kref+0x69c:   	srl	%l6, 0x4, %g0
	.word	0x99b34caf	! t0_kref+0x6a0:   	fandnot2s	%f13, %f15, %f12
	.word	0xe83e4000	! t0_kref+0x6a4:   	std	%l4, [%i1]
	.word	0x94633c03	! t0_kref+0x6a8:   	subc	%o4, -0x3fd, %o2
	.word	0xd82e3ff6	! t0_kref+0x6ac:   	stb	%o4, [%i0 - 0xa]
	.word	0xab400000	! t0_kref+0x6b0:   	mov	%y, %l5
	.word	0x9fc00004	! t0_kref+0x6b4:   	call	%g0 + %g4
	.word	0xf76e001c	! t0_kref+0x6b8:   	prefetch	%i0 + %i4, 27
	.word	0x8143c000	! t0_kref+0x6bc:   	stbar
	.word	0x9a15400a	! t0_kref+0x6c0:   	or	%l5, %o2, %o5
	.word	0x97b280f6	! t0_kref+0x6c4:   	edge16ln	%o2, %l6, %o3
	.word	0xd2ce5000	! t0_kref+0x6c8:   	ldsba	[%i1]0x80, %o1
	.word	0xa7400000	! t0_kref+0x6cc:   	mov	%y, %l3
	.word	0xaedb20fa	! t0_kref+0x6d0:   	smulcc	%o4, 0xfa, %l7
	.word	0xa4603c92	! t0_kref+0x6d4:   	subc	%g0, -0x36e, %l2
	.word	0x9ba018da	! t0_kref+0x6d8:   	fdtos	%f26, %f13
	.word	0x2f347803	! t0_kref+0x6dc:   	sethi	%hi(0xd1e00c00), %l7
	.word	0xb3a018d0	! t0_kref+0x6e0:   	fdtos	%f16, %f25
	.word	0xec060000	! t0_kref+0x6e4:   	ld	[%i0], %l6
	.word	0x9653401a	! t0_kref+0x6e8:   	umul	%o5, %i2, %o3
	.word	0xc06e8018	! t0_kref+0x6ec:   	ldstub	[%i2 + %i0], %g0
	.word	0xea4e200a	! t0_kref+0x6f0:   	ldsb	[%i0 + 0xa], %l5
	.word	0xa80e8008	! t0_kref+0x6f4:   	and	%i2, %o0, %l4
	.word	0xbda01a35	! t0_kref+0x6f8:   	fstoi	%f21, %f30
	.word	0xaa2d401a	! t0_kref+0x6fc:   	andn	%l5, %i2, %l5
	.word	0xeb06600c	! t0_kref+0x700:   	ld	[%i1 + 0xc], %f21
	call	SYM(t0_subr1)
	.word	0xc3ee500c	! t0_kref+0x708:   	prefetcha	%i1 + %o4, 1
	.word	0x81ad0a3a	! t0_kref+0x70c:   	fcmps	%fcc0, %f20, %f26
	.word	0xf1063fe8	! t0_kref+0x710:   	ld	[%i0 - 0x18], %f24
	.word	0xe500a03c	! t0_kref+0x714:   	ld	[%g2 + 0x3c], %f18
	.word	0xe6480019	! t0_kref+0x718:   	ldsb	[%g0 + %i1], %l3
	.word	0x93b54240	! t0_kref+0x71c:   	array16	%l5, %g0, %o1
	.word	0x24800006	! t0_kref+0x720:   	ble,a	_kref+0x738
	.word	0xac0b6a37	! t0_kref+0x724:   	and	%o5, 0xa37, %l6
	.word	0xb1a00552	! t0_kref+0x728:   	fsqrtd	%f18, %f24
	.word	0x94f83a90	! t0_kref+0x72c:   	sdivcc	%g0, -0x570, %o2
	.word	0xb1a78d3b	! t0_kref+0x730:   	fsmuld	%f30, %f27, %f24
	.word	0xea20a02c	! t0_kref+0x734:   	st	%l5, [%g2 + 0x2c]
	.word	0x9e123969	! t0_kref+0x738:   	or	%o0, -0x697, %o7
	.word	0xa3a01a30	! t0_kref+0x73c:   	fstoi	%f16, %f17
	.word	0xecbe101d	! t0_kref+0x740:   	stda	%l6, [%i0 + %i5]0x80
	.word	0x9e3ea8b0	! t0_kref+0x744:   	xnor	%i2, 0x8b0, %o7
	.word	0xa1a01033	! t0_kref+0x748:   	fstox	%f19, %f16
	.word	0xaa0eb5ea	! t0_kref+0x74c:   	and	%i2, -0xa16, %l5
	.word	0xa9a01917	! t0_kref+0x750:   	fitod	%f23, %f20
	.word	0xa6e20015	! t0_kref+0x754:   	subccc	%o0, %l5, %l3
	.word	0xd440a038	! t0_kref+0x758:   	ldsw	[%g2 + 0x38], %o2
	.word	0x940ac016	! t0_kref+0x75c:   	and	%o3, %l6, %o2
	.word	0xa7b0034d	! t0_kref+0x760:   	alignaddrl	%g0, %o5, %l3
	.word	0xe608a013	! t0_kref+0x764:   	ldub	[%g2 + 0x13], %l3
	.word	0xaaab65ea	! t0_kref+0x768:   	andncc	%o5, 0x5ea, %l5
	.word	0xada3085c	! t0_kref+0x76c:   	faddd	%f12, %f28, %f22
	.word	0x81d80014	! t0_kref+0x770:   	flush	%g0 + %l4
	.word	0x9e5a800b	! t0_kref+0x774:   	smul	%o2, %o3, %o7
	.word	0x81af8a5e	! t0_kref+0x778:   	fcmpd	%fcc0, %f30, %f30
	.word	0xd226001c	! t0_kref+0x77c:   	st	%o1, [%i0 + %i4]
	.word	0xd028a006	! t0_kref+0x780:   	stb	%o0, [%g2 + 6]
	.word	0xa1b786f6	! t0_kref+0x784:   	fmul8ulx16	%f30, %f22, %f16
	.word	0x37800004	! t0_kref+0x788:   	fbge,a	_kref+0x798
	.word	0xaa700000	! t0_kref+0x78c:   	udiv	%g0, %g0, %l5
	.word	0xc7ee1008	! t0_kref+0x790:   	prefetcha	%i0 + %o0, 3
	.word	0xd048a03e	! t0_kref+0x794:   	ldsb	[%g2 + 0x3e], %o0
	.word	0x9a5a400b	! t0_kref+0x798:   	smul	%o1, %o3, %o5
	.word	0x9de3bfa0	! t0_kref+0x79c:   	save	%sp, -0x60, %sp
	.word	0xb02ee526	! t0_kref+0x7a0:   	andn	%i3, 0x526, %i0
	.word	0x95e83585	! t0_kref+0x7a4:   	restore	%g0, -0xa7b, %o2
	.word	0xe67e6004	! t0_kref+0x7a8:   	swap	[%i1 + 4], %l3
	.word	0xa6b34008	! t0_kref+0x7ac:   	orncc	%o5, %o0, %l3
	.word	0xf920a020	! t0_kref+0x7b0:   	st	%f28, [%g2 + 0x20]
	.word	0xa85020cb	! t0_kref+0x7b4:   	umul	%g0, 0xcb, %l4
	.word	0x81ad8ad8	! t0_kref+0x7b8:   	fcmped	%fcc0, %f22, %f24
	.word	0xde006d26	! t0_kref+0x7bc:   	ld	[%g1 + 0xd26], %o7
	.word	0xae5a7da5	! t0_kref+0x7c0:   	smul	%o1, -0x25b, %l7
	.word	0xde567ff6	! t0_kref+0x7c4:   	ldsh	[%i1 - 0xa], %o7
	.word	0xa9a44d35	! t0_kref+0x7c8:   	fsmuld	%f17, %f21, %f20
	.word	0x9de3bfa0	! t0_kref+0x7cc:   	save	%sp, -0x60, %sp
	.word	0xb03f401d	! t0_kref+0x7d0:   	xnor	%i5, %i5, %i0
	.word	0x9bef4000	! t0_kref+0x7d4:   	restore	%i5, %g0, %o5
	.word	0xb9a01915	! t0_kref+0x7d8:   	fitod	%f21, %f28
	.word	0x99b24200	! t0_kref+0x7dc:   	array8	%o1, %g0, %o4
	.word	0x24800003	! t0_kref+0x7e0:   	ble,a	_kref+0x7ec
	.word	0xafa0189e	! t0_kref+0x7e4:   	fitos	%f30, %f23
	.word	0xa65d400d	! t0_kref+0x7e8:   	smul	%l5, %o5, %l3
	.word	0x9a2b0016	! t0_kref+0x7ec:   	andn	%o4, %l6, %o5
	.word	0x26480003	! t0_kref+0x7f0:   	bl,a,pt	%icc, _kref+0x7fc
	.word	0xada00556	! t0_kref+0x7f4:   	fsqrtd	%f22, %f22
	.word	0xc1ee500b	! t0_kref+0x7f8:   	prefetcha	%i1 + %o3, 0
	.word	0x97703453	! t0_kref+0x7fc:   	popc	-0xbad, %o3
	.word	0xaa628009	! t0_kref+0x800:   	subc	%o2, %o1, %l5
	.word	0xf96e6018	! t0_kref+0x804:   	prefetch	%i1 + 0x18, 28
	.word	0xd630a000	! t0_kref+0x808:   	sth	%o3, [%g2]
	.word	0xf7ee501d	! t0_kref+0x80c:   	prefetcha	%i1 + %i5, 27
	.word	0x98fb000b	! t0_kref+0x810:   	sdivcc	%o4, %o3, %o4
	.word	0x9870001a	! t0_kref+0x814:   	udiv	%g0, %i2, %o4
	.word	0x83414000	! t0_kref+0x818:   	mov	%pc, %g1
	.word	0xdaee5000	! t0_kref+0x81c:   	ldstuba	[%i1]0x80, %o5
	.word	0xabb70eee	! t0_kref+0x820:   	fornot2s	%f28, %f14, %f21
	.word	0xfd180018	! t0_kref+0x824:   	ldd	[%g0 + %i0], %f30
	.word	0x952da015	! t0_kref+0x828:   	sll	%l6, 0x15, %o2
	.word	0xe306401c	! t0_kref+0x82c:   	ld	[%i1 + %i4], %f17
	.word	0x81de6c42	! t0_kref+0x830:   	flush	%i1 + 0xc42
	.word	0xa5a0102c	! t0_kref+0x834:   	fstox	%f12, %f18
	.word	0xec1e6008	! t0_kref+0x838:   	ldd	[%i1 + 8], %l6
	.word	0xb5a0053d	! t0_kref+0x83c:   	fsqrts	%f29, %f26
	.word	0xb1a01936	! t0_kref+0x840:   	fstod	%f22, %f24
	.word	0x9035b849	! t0_kref+0x844:   	orn	%l6, -0x7b7, %o0
	.word	0x292bff6f	! t0_kref+0x848:   	sethi	%hi(0xaffdbc00), %l4
	.word	0x9de3bfa0	! t0_kref+0x84c:   	save	%sp, -0x60, %sp
	.word	0x9beeb171	! t0_kref+0x850:   	restore	%i2, -0xe8f, %o5
	.word	0xda2e7fe4	! t0_kref+0x854:   	stb	%o5, [%i1 - 0x1c]
	.word	0x9462fb40	! t0_kref+0x858:   	subc	%o3, -0x4c0, %o2
	.word	0x39800003	! t0_kref+0x85c:   	fbuge,a	_kref+0x868
	.word	0xbba000b9	! t0_kref+0x860:   	fnegs	%f25, %f29
	.word	0xdf00a000	! t0_kref+0x864:   	ld	[%g2], %f15
	.word	0x38480007	! t0_kref+0x868:   	bgu,a,pt	%icc, _kref+0x884
	.word	0xa1a01a2d	! t0_kref+0x86c:   	fstoi	%f13, %f16
	.word	0xb5a0003b	! t0_kref+0x870:   	fmovs	%f27, %f26
	.word	0xbdb34ab3	! t0_kref+0x874:   	fpsub16s	%f13, %f19, %f30
	.word	0xa7a308af	! t0_kref+0x878:   	fsubs	%f12, %f15, %f19
	.word	0xa1a0054c	! t0_kref+0x87c:   	fsqrtd	%f12, %f16
	.word	0x90ddc00b	! t0_kref+0x880:   	smulcc	%l7, %o3, %o0
	.word	0xc807bfe4	! t0_kref+0x884:   	ld	[%fp - 0x1c], %g4
	.word	0xa1a00556	! t0_kref+0x888:   	fsqrtd	%f22, %f16
	.word	0x903235a2	! t0_kref+0x88c:   	orn	%o0, -0xa5e, %o0
	.word	0xa5a01936	! t0_kref+0x890:   	fstod	%f22, %f18
	.word	0x802339f9	! t0_kref+0x894:   	sub	%o4, -0x607, %g0
	.word	0xd2a81018	! t0_kref+0x898:   	stba	%o1, [%g0 + %i0]0x80
	.word	0x81af8a3c	! t0_kref+0x89c:   	fcmps	%fcc0, %f30, %f28
	.word	0x3c480006	! t0_kref+0x8a0:   	bpos,a,pt	%icc, _kref+0x8b8
	.word	0xa622800b	! t0_kref+0x8a4:   	sub	%o2, %o3, %l3
	.word	0xa7b200b7	! t0_kref+0x8a8:   	edge16n	%o0, %l7, %l3
	.word	0xd430a008	! t0_kref+0x8ac:   	sth	%o2, [%g2 + 8]
	.word	0xafb3cc71	! t0_kref+0x8b0:   	fnors	%f15, %f17, %f23
	.word	0x9da01919	! t0_kref+0x8b4:   	fitod	%f25, %f14
	.word	0xbda50858	! t0_kref+0x8b8:   	faddd	%f20, %f24, %f30
	.word	0xbba01a3a	! t0_kref+0x8bc:   	fstoi	%f26, %f29
	.word	0xd93f4018	! t0_kref+0x8c0:   	std	%f12, [%i5 + %i0]
	.word	0xb1a01a32	! t0_kref+0x8c4:   	fstoi	%f18, %f24
	.word	0x2d800004	! t0_kref+0x8c8:   	fbg,a	_kref+0x8d8
	.word	0x98e034d5	! t0_kref+0x8cc:   	subccc	%g0, -0xb2b, %o4
	.word	0x29480003	! t0_kref+0x8d0:   	fbl,a,pt	%fcc0, _kref+0x8dc
	.word	0xb1b587dc	! t0_kref+0x8d4:   	pdist	%f22, %f28, %f24
	.word	0x1735b88e	! t0_kref+0x8d8:   	sethi	%hi(0xd6e23800), %o3
	.word	0x27800002	! t0_kref+0x8dc:   	fbul,a	_kref+0x8e4
	.word	0xd040a02c	! t0_kref+0x8e0:   	ldsw	[%g2 + 0x2c], %o0
	.word	0xa9a01a30	! t0_kref+0x8e4:   	fstoi	%f16, %f20
	.word	0x8d836b83	! t0_kref+0x8e8:   	wr	%o5, 0xb83, %fprs
	.word	0xa1a409d0	! t0_kref+0x8ec:   	fdivd	%f16, %f16, %f16
	.word	0xf5263ffc	! t0_kref+0x8f0:   	st	%f26, [%i0 - 4]
	.word	0xa5a01a38	! t0_kref+0x8f4:   	fstoi	%f24, %f18
	.word	0x95b0004a	! t0_kref+0x8f8:   	edge8l	%g0, %o2, %o2
	.word	0xaeb68016	! t0_kref+0x8fc:   	orncc	%i2, %l6, %l7
	.word	0xa9b30e52	! t0_kref+0x900:   	fxnor	%f12, %f18, %f20
	.word	0xec3e7ff0	! t0_kref+0x904:   	std	%l6, [%i1 - 0x10]
	.word	0x96aa0008	! t0_kref+0x908:   	andncc	%o0, %o0, %o3
	.word	0xa60aaf9a	! t0_kref+0x90c:   	and	%o2, 0xf9a, %l3
	.word	0xb9a01938	! t0_kref+0x910:   	fstod	%f24, %f28
	.word	0x29800007	! t0_kref+0x914:   	fbl,a	_kref+0x930
	.word	0xb1a60852	! t0_kref+0x918:   	faddd	%f24, %f18, %f24
	.word	0x99b2c055	! t0_kref+0x91c:   	edge8l	%o3, %l5, %o4
	.word	0xa1a00554	! t0_kref+0x920:   	fsqrtd	%f20, %f16
	.word	0xae2d7fee	! t0_kref+0x924:   	andn	%l5, -0x12, %l7
	.word	0xe27e3ffc	! t0_kref+0x928:   	swap	[%i0 - 4], %l1
	.word	0xada0055c	! t0_kref+0x92c:   	fsqrtd	%f28, %f22
	.word	0x94420017	! t0_kref+0x930:   	addc	%o0, %l7, %o2
	.word	0x98e34017	! t0_kref+0x934:   	subccc	%o5, %l7, %o4
	.word	0xf720a038	! t0_kref+0x938:   	st	%f27, [%g2 + 0x38]
	.word	0xb1a0191c	! t0_kref+0x93c:   	fitod	%f28, %f24
	.word	0xa60db9b7	! t0_kref+0x940:   	and	%l6, -0x649, %l3
	.word	0xb3a00534	! t0_kref+0x944:   	fsqrts	%f20, %f25
	.word	0xada0193a	! t0_kref+0x948:   	fstod	%f26, %f22
	.word	0xa5a0055c	! t0_kref+0x94c:   	fsqrtd	%f28, %f18
	.word	0x81df38be	! t0_kref+0x950:   	flush	%i4 - 0x742
	.word	0xdd3e4000	! t0_kref+0x954:   	std	%f14, [%i1]
	.word	0x8072ab22	! t0_kref+0x958:   	udiv	%o2, 0xb22, %g0
	.word	0xb1a0052d	! t0_kref+0x95c:   	fsqrts	%f13, %f24
	.word	0xa6828017	! t0_kref+0x960:   	addcc	%o2, %l7, %l3
	.word	0x96654016	! t0_kref+0x964:   	subc	%l5, %l6, %o3
	.word	0xc04e6018	! t0_kref+0x968:   	ldsb	[%i1 + 0x18], %g0
	.word	0x98ada994	! t0_kref+0x96c:   	andncc	%l6, 0x994, %o4
	.word	0x99a01a5c	! t0_kref+0x970:   	fdtoi	%f28, %f12
	.word	0xa3a7083d	! t0_kref+0x974:   	fadds	%f28, %f29, %f17
	.word	0xf4260000	! t0_kref+0x978:   	st	%i2, [%i0]
	.word	0xe1be180d	! t0_kref+0x97c:   	stda	%f16, [%i0 + %o5]0xc0
	.word	0x92fb64ed	! t0_kref+0x980:   	sdivcc	%o5, 0x4ed, %o1
	.word	0xed1e0000	! t0_kref+0x984:   	ldd	[%i0], %f22
	.word	0x27800005	! t0_kref+0x988:   	fbul,a	_kref+0x99c
	.word	0xafb5cd60	! t0_kref+0x98c:   	fnot1s	%f23, %f23
	.word	0xafa0002c	! t0_kref+0x990:   	fmovs	%f12, %f23
	.word	0xa7b64aba	! t0_kref+0x994:   	fpsub16s	%f25, %f26, %f19
	.word	0x26480004	! t0_kref+0x998:   	bl,a,pt	%icc, _kref+0x9a8
	.word	0x99a0108e	! t0_kref+0x99c:   	fxtos	%f14, %f12
	.word	0xc807bfe4	! t0_kref+0x9a0:   	ld	[%fp - 0x1c], %g4
	.word	0xf42e6006	! t0_kref+0x9a4:   	stb	%i2, [%i1 + 6]
	.word	0x8143c000	! t0_kref+0x9a8:   	stbar
	.word	0xe168a00a	! t0_kref+0x9ac:   	prefetch	%g2 + 0xa, 16
	.word	0x8143c000	! t0_kref+0x9b0:   	stbar
	.word	0xa7b34097	! t0_kref+0x9b4:   	edge16	%o5, %l7, %l3
	.word	0x8143e040	! t0_kref+0x9b8:   	membar	0x40
	.word	0xbba000ae	! t0_kref+0x9bc:   	fnegs	%f14, %f29
	.word	0xda070018	! t0_kref+0x9c0:   	ld	[%i4 + %i0], %o5
	.word	0x2e800002	! t0_kref+0x9c4:   	bvs,a	_kref+0x9cc
	.word	0x9b2b601f	! t0_kref+0x9c8:   	sll	%o5, 0x1f, %o5
	.word	0xe51e3ff8	! t0_kref+0x9cc:   	ldd	[%i0 - 8], %f18
	.word	0x981ae61f	! t0_kref+0x9d0:   	xor	%o3, 0x61f, %o4
	.word	0xf5ee101b	! t0_kref+0x9d4:   	prefetcha	%i0 + %i3, 26
	.word	0xd468a00a	! t0_kref+0x9d8:   	ldstub	[%g2 + 0xa], %o2
	.word	0xae72c015	! t0_kref+0x9dc:   	udiv	%o3, %l5, %l7
	.word	0x29480008	! t0_kref+0x9e0:   	fbl,a,pt	%fcc0, _kref+0xa00
	.word	0x95b280c8	! t0_kref+0x9e4:   	edge16l	%o2, %o0, %o2
	.word	0xf428a03d	! t0_kref+0x9e8:   	stb	%i2, [%g2 + 0x3d]
	.word	0xa432c009	! t0_kref+0x9ec:   	orn	%o3, %o1, %l2
	.word	0xbdb64ea0	! t0_kref+0x9f0:   	fsrc1s	%f25, %f30
	.word	0x9fc00004	! t0_kref+0x9f4:   	call	%g0 + %g4
	.word	0x90d28009	! t0_kref+0x9f8:   	umulcc	%o2, %o1, %o0
	.word	0xf93e401d	! t0_kref+0x9fc:   	std	%f28, [%i1 + %i5]
	.word	0xd8180019	! t0_kref+0xa00:   	ldd	[%g0 + %i1], %o4
	.word	0x948b0009	! t0_kref+0xa04:   	andcc	%o4, %o1, %o2
	.word	0xb9b3cdee	! t0_kref+0xa08:   	fnands	%f15, %f14, %f28
	.word	0x99a0188e	! t0_kref+0xa0c:   	fitos	%f14, %f12
	.word	0x9da01a3d	! t0_kref+0xa10:   	fstoi	%f29, %f14
	call	SYM(t0_subr0)
	.word	0xeb270019	! t0_kref+0xa18:   	st	%f21, [%i4 + %i1]
	.word	0xa666ae39	! t0_kref+0xa1c:   	subc	%i2, 0xe39, %l3
	.word	0xad418000	! t0_kref+0xa20:   	mov	%fprs, %l6
	.word	0xd4267ff8	! t0_kref+0xa24:   	st	%o2, [%i1 - 8]
	.word	0xed1e001d	! t0_kref+0xa28:   	ldd	[%i0 + %i5], %f22
	.word	0x9ba5092f	! t0_kref+0xa2c:   	fmuls	%f20, %f15, %f13
	.word	0xd04e2015	! t0_kref+0xa30:   	ldsb	[%i0 + 0x15], %o0
	.word	0xd62e200a	! t0_kref+0xa34:   	stb	%o3, [%i0 + 0xa]
	.word	0xd25e6000	! t0_kref+0xa38:   	ldx	[%i1], %o1
	.word	0xec0e601b	! t0_kref+0xa3c:   	ldub	[%i1 + 0x1b], %l6
	.word	0xc020a004	! t0_kref+0xa40:   	clr	[%g2 + 4]
	.word	0xee4e7fe9	! t0_kref+0xa44:   	ldsb	[%i1 - 0x17], %l7
	.word	0xb9a488d6	! t0_kref+0xa48:   	fsubd	%f18, %f22, %f28
	.word	0x01022cfc	! t0_kref+0xa4c:   	sethi	%hi(0x8b3f000), %g0
	.word	0xc0566012	! t0_kref+0xa50:   	ldsh	[%i1 + 0x12], %g0
	.word	0x93b28176	! t0_kref+0xa54:   	edge32ln	%o2, %l6, %o1
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xaf25ee73	! t0_kref+0xa60:   	mulscc	%l7, 0xe73, %l7
1:	.word	0x80fd800d	! t0_kref+0xa64:   	sdivcc	%l6, %o5, %g0
	.word	0xa522749f	! t0_kref+0xa68:   	mulscc	%o1, -0xb61, %l2
	.word	0xd4d6501b	! t0_kref+0xa6c:   	ldsha	[%i1 + %i3]0x80, %o2
	.word	0xb9a488ba	! t0_kref+0xa70:   	fsubs	%f18, %f26, %f28
	.word	0xa4f33e81	! t0_kref+0xa74:   	udivcc	%o4, -0x17f, %l2
	.word	0xb5b74a2c	! t0_kref+0xa78:   	fpadd16s	%f29, %f12, %f26
	.word	0x90aa801a	! t0_kref+0xa7c:   	andncc	%o2, %i2, %o0
	.word	0xb3a000be	! t0_kref+0xa80:   	fnegs	%f30, %f25
	.word	0xf11fbe48	! t0_kref+0xa84:   	ldd	[%fp - 0x1b8], %f24
	.word	0xabaac03a	! t0_kref+0xa88:   	fmovsge	%fcc0, %f26, %f21
	.word	0xd020a014	! t0_kref+0xa8c:   	st	%o0, [%g2 + 0x14]
	.word	0x81ac8ace	! t0_kref+0xa90:   	fcmped	%fcc0, %f18, %f14
	.word	0xe4464000	! t0_kref+0xa94:   	ldsw	[%i1], %l2
	.word	0xac626dc0	! t0_kref+0xa98:   	subc	%o1, 0xdc0, %l6
	.word	0x98f2c00c	! t0_kref+0xa9c:   	udivcc	%o3, %o4, %o4
	.word	0xd0180018	! t0_kref+0xaa0:   	ldd	[%g0 + %i0], %o0
	.word	0x9da0002c	! t0_kref+0xaa4:   	fmovs	%f12, %f14
	.word	0xa5b70976	! t0_kref+0xaa8:   	fpmerge	%f28, %f22, %f18
	.word	0xed6e001c	! t0_kref+0xaac:   	prefetch	%i0 + %i4, 22
	.word	0x32800003	! t0_kref+0xab0:   	bne,a	_kref+0xabc
	.word	0xa4120015	! t0_kref+0xab4:   	or	%o0, %l5, %l2
	.word	0xde50a00e	! t0_kref+0xab8:   	ldsh	[%g2 + 0xe], %o7
	.word	0xeb00a008	! t0_kref+0xabc:   	ld	[%g2 + 8], %f21
	.word	0xd020a038	! t0_kref+0xac0:   	st	%o0, [%g2 + 0x38]
	.word	0x97418000	! t0_kref+0xac4:   	mov	%fprs, %o3
	.word	0xb3a000b4	! t0_kref+0xac8:   	fnegs	%f20, %f25
	.word	0x9e824009	! t0_kref+0xacc:   	addcc	%o1, %o1, %o7
	.word	0x2d480003	! t0_kref+0xad0:   	fbg,a,pt	%fcc0, _kref+0xadc
	.word	0xa6630008	! t0_kref+0xad4:   	subc	%o4, %o0, %l3
	.word	0x81af0a4c	! t0_kref+0xad8:   	fcmpd	%fcc0, %f28, %f12
	.word	0xa1b406b7	! t0_kref+0xadc:   	fmul8x16al	%f16, %f23, %f16
	.word	0x902d6fd5	! t0_kref+0xae0:   	andn	%l5, 0xfd5, %o0
	.word	0xef68a08f	! t0_kref+0xae4:   	prefetch	%g2 + 0x8f, 23
	.word	0x27800005	! t0_kref+0xae8:   	fbul,a	_kref+0xafc
	.word	0x9e2226ce	! t0_kref+0xaec:   	sub	%o0, 0x6ce, %o7
	.word	0x969d800a	! t0_kref+0xaf0:   	xorcc	%l6, %o2, %o3
	.word	0x270482ae	! t0_kref+0xaf4:   	sethi	%hi(0x120ab800), %l3
	.word	0x992278c4	! t0_kref+0xaf8:   	mulscc	%o1, -0x73c, %o4
	.word	0xb5b00fe0	! t0_kref+0xafc:   	fones	%f26
	.word	0xd628a039	! t0_kref+0xb00:   	stb	%o3, [%g2 + 0x39]
	.word	0xaf400000	! t0_kref+0xb04:   	mov	%y, %l7
	.word	0x9e6375e9	! t0_kref+0xb08:   	subc	%o5, -0xa17, %o7
	.word	0xadb50f98	! t0_kref+0xb0c:   	for	%f20, %f24, %f22
	.word	0x9eda800c	! t0_kref+0xb10:   	smulcc	%o2, %o4, %o7
	.word	0xd078a030	! t0_kref+0xb14:   	swap	[%g2 + 0x30], %o0
	.word	0xac1d8008	! t0_kref+0xb18:   	xor	%l6, %o0, %l6
	.word	0xde00a024	! t0_kref+0xb1c:   	ld	[%g2 + 0x24], %o7
	.word	0xe120a020	! t0_kref+0xb20:   	st	%f16, [%g2 + 0x20]
	.word	0xf4200018	! t0_kref+0xb24:   	st	%i2, [%g0 + %i0]
	.word	0xdf00a01c	! t0_kref+0xb28:   	ld	[%g2 + 0x1c], %f15
	call	SYM(t0_subr1)
	.word	0xc028a011	! t0_kref+0xb30:   	clrb	[%g2 + 0x11]
	.word	0xd4563ffc	! t0_kref+0xb34:   	ldsh	[%i0 - 4], %o2
	.word	0x8143c000	! t0_kref+0xb38:   	stbar
	.word	0x961376b2	! t0_kref+0xb3c:   	or	%o5, -0x94e, %o3
	.word	0xd47e3ff4	! t0_kref+0xb40:   	swap	[%i0 - 0xc], %o2
	.word	0x9aa262a7	! t0_kref+0xb44:   	subcc	%o1, 0x2a7, %o5
	.word	0x29800004	! t0_kref+0xb48:   	fbl,a	_kref+0xb58
	.word	0xd8267fe8	! t0_kref+0xb4c:   	st	%o4, [%i1 - 0x18]
	.word	0x3a480001	! t0_kref+0xb50:   	bcc,a,pt	%icc, _kref+0xb54
	.word	0x9f28000c	! t0_kref+0xb54:   	sll	%g0, %o4, %o7
	.word	0xea4e3fed	! t0_kref+0xb58:   	ldsb	[%i0 - 0x13], %l5
	.word	0x3e480008	! t0_kref+0xb5c:   	bvc,a,pt	%icc, _kref+0xb7c
	.word	0x96d8000c	! t0_kref+0xb60:   	smulcc	%g0, %o4, %o3
	.word	0xa69a4015	! t0_kref+0xb64:   	xorcc	%o1, %l5, %l3
	.word	0xdbe65016	! t0_kref+0xb68:   	casa	[%i1]0x80, %l6, %o5
	.word	0xa5a0192c	! t0_kref+0xb6c:   	fstod	%f12, %f18
	.word	0xa9a01a2f	! t0_kref+0xb70:   	fstoi	%f15, %f20
	.word	0xd86e8018	! t0_kref+0xb74:   	ldstub	[%i2 + %i0], %o4
	.word	0xaee5400c	! t0_kref+0xb78:   	subccc	%l5, %o4, %l7
	.word	0xd8d81018	! t0_kref+0xb7c:   	ldxa	[%g0 + %i0]0x80, %o4
	.word	0x99a018d4	! t0_kref+0xb80:   	fdtos	%f20, %f12
	.word	0x37480008	! t0_kref+0xb84:   	fbge,a,pt	%fcc0, _kref+0xba4
	.word	0x9bb00316	! t0_kref+0xb88:   	alignaddr	%g0, %l6, %o5
	.word	0xa9a0111a	! t0_kref+0xb8c:   	fxtod	%f26, %f20
	.word	0x9db487dc	! t0_kref+0xb90:   	pdist	%f18, %f28, %f14
	.word	0xbda01a4e	! t0_kref+0xb94:   	fdtoi	%f14, %f30
	.word	0xa5a000da	! t0_kref+0xb98:   	fnegd	%f26, %f18
	.word	0xa5b58d14	! t0_kref+0xb9c:   	fandnot1	%f22, %f20, %f18
	.word	0x8143c000	! t0_kref+0xba0:   	stbar
	.word	0x81580000	! t0_kref+0xba4:   	flushw
	.word	0xf1be180c	! t0_kref+0xba8:   	stda	%f24, [%i0 + %o4]0xc0
	.word	0xadb28240	! t0_kref+0xbac:   	array16	%o2, %g0, %l6
	.word	0xc56e0000	! t0_kref+0xbb0:   	prefetch	%i0, 2
	.word	0x972b6019	! t0_kref+0xbb4:   	sll	%o5, 0x19, %o3
	.word	0xa5b70db6	! t0_kref+0xbb8:   	fxors	%f28, %f22, %f18
	.word	0xaa5e8008	! t0_kref+0xbbc:   	smul	%i2, %o0, %l5
	.word	0xb1a389d8	! t0_kref+0xbc0:   	fdivd	%f14, %f24, %f24
	.word	0xaba000b8	! t0_kref+0xbc4:   	fnegs	%f24, %f21
	.word	0xaf408000	! t0_kref+0xbc8:   	mov	%ccr, %l7
	.word	0x942a8015	! t0_kref+0xbcc:   	andn	%o2, %l5, %o2
	.word	0xa430311c	! t0_kref+0xbd0:   	orn	%g0, -0xee4, %l2
	.word	0x9862219f	! t0_kref+0xbd4:   	subc	%o0, 0x19f, %o4
	.word	0xa425f625	! t0_kref+0xbd8:   	sub	%l7, -0x9db, %l2
	.word	0xae158009	! t0_kref+0xbdc:   	or	%l6, %o1, %l7
	.word	0xed3e401d	! t0_kref+0xbe0:   	std	%f22, [%i1 + %i5]
	.word	0x26800003	! t0_kref+0xbe4:   	bl,a	_kref+0xbf0
	.word	0xb7a88031	! t0_kref+0xbe8:   	fmovslg	%fcc0, %f17, %f27
	.word	0xae73000c	! t0_kref+0xbec:   	udiv	%o4, %o4, %l7
	.word	0xae2d61c9	! t0_kref+0xbf0:   	andn	%l5, 0x1c9, %l7
	.word	0xae52a17c	! t0_kref+0xbf4:   	umul	%o2, 0x17c, %l7
	.word	0xaef03331	! t0_kref+0xbf8:   	udivcc	%g0, -0xccf, %l7
	.word	0xb5b00cf2	! t0_kref+0xbfc:   	fnot2s	%f18, %f26
	.word	0x81228017	! t0_kref+0xc00:   	mulscc	%o2, %l7, %g0
	.word	0xac9d6d82	! t0_kref+0xc04:   	xorcc	%l5, 0xd82, %l6
	.word	0x98700008	! t0_kref+0xc08:   	udiv	%g0, %o0, %o4
	.word	0xa62a2a67	! t0_kref+0xc0c:   	andn	%o0, 0xa67, %l3
	.word	0xe8bf5019	! t0_kref+0xc10:   	stda	%l4, [%i5 + %i1]0x80
	.word	0x8016800c	! t0_kref+0xc14:   	or	%i2, %o4, %g0
	.word	0xec20a024	! t0_kref+0xc18:   	st	%l6, [%g2 + 0x24]
	.word	0xafa000ba	! t0_kref+0xc1c:   	fnegs	%f26, %f23
	.word	0xea080019	! t0_kref+0xc20:   	ldub	[%g0 + %i1], %l5
	.word	0x99a01934	! t0_kref+0xc24:   	fstod	%f20, %f12
	.word	0xed68a044	! t0_kref+0xc28:   	prefetch	%g2 + 0x44, 22
	.word	0xd630a038	! t0_kref+0xc2c:   	sth	%o3, [%g2 + 0x38]
	.word	0xec063ff4	! t0_kref+0xc30:   	ld	[%i0 - 0xc], %l6
	.word	0xd67e3ff0	! t0_kref+0xc34:   	swap	[%i0 - 0x10], %o3
	.word	0xa1b5c66f	! t0_kref+0xc38:   	fmul8x16au	%f23, %f15, %f16
	.word	0x901a0017	! t0_kref+0xc3c:   	xor	%o0, %l7, %o0
	.word	0xa9b0077a	! t0_kref+0xc40:   	fpack16	%f26, %f20
	.word	0x3b800006	! t0_kref+0xc44:   	fble,a	_kref+0xc5c
	.word	0xea30a014	! t0_kref+0xc48:   	sth	%l5, [%g2 + 0x14]
	.word	0x9ed5730b	! t0_kref+0xc4c:   	umulcc	%l5, -0xcf5, %o7
	.word	0xa9b50e1a	! t0_kref+0xc50:   	fand	%f20, %f26, %f20
	.word	0xec48a01d	! t0_kref+0xc54:   	ldsb	[%g2 + 0x1d], %l6
	.word	0xec363fe0	! t0_kref+0xc58:   	sth	%l6, [%i0 - 0x20]
	.word	0x9da68838	! t0_kref+0xc5c:   	fadds	%f26, %f24, %f14
	.word	0xf51fbc68	! t0_kref+0xc60:   	ldd	[%fp - 0x398], %f26
	.word	0x9fb54057	! t0_kref+0xc64:   	edge8l	%l5, %l7, %o7
	.word	0x81abca38	! t0_kref+0xc68:   	fcmps	%fcc0, %f15, %f24
	.word	0xf1981018	! t0_kref+0xc6c:   	ldda	[%g0 + %i0]0x80, %f24
	.word	0x80e30015	! t0_kref+0xc70:   	subccc	%o4, %l5, %g0
	.word	0xd8480019	! t0_kref+0xc74:   	ldsb	[%g0 + %i1], %o4
	.word	0xfdee101d	! t0_kref+0xc78:   	prefetcha	%i0 + %i5, 30
	.word	0xd830a024	! t0_kref+0xc7c:   	sth	%o4, [%g2 + 0x24]
	.word	0x81400000	! t0_kref+0xc80:   	mov	%y, %g0
	.word	0x2e800005	! t0_kref+0xc84:   	bvs,a	_kref+0xc98
	.word	0x9833000b	! t0_kref+0xc88:   	orn	%o4, %o3, %o4
	.word	0xbba508b2	! t0_kref+0xc8c:   	fsubs	%f20, %f18, %f29
	.word	0xa785c00b	! t0_kref+0xc90:   	wr	%l7, %o3, %gsr
	.word	0xd050a00e	! t0_kref+0xc94:   	ldsh	[%g2 + 0xe], %o0
	.word	0xa1b78e58	! t0_kref+0xc98:   	fxnor	%f30, %f24, %f16
	.word	0xd2262018	! t0_kref+0xc9c:   	st	%o1, [%i0 + 0x18]
	.word	0xb1b48c54	! t0_kref+0xca0:   	fnor	%f18, %f20, %f24
	.word	0x9fa01a3e	! t0_kref+0xca4:   	fstoi	%f30, %f15
	.word	0x922b001a	! t0_kref+0xca8:   	andn	%o4, %i2, %o1
	.word	0x30800002	! t0_kref+0xcac:   	ba,a	_kref+0xcb4
	.word	0xd426401c	! t0_kref+0xcb0:   	st	%o2, [%i1 + %i4]
	.word	0xb5a000b3	! t0_kref+0xcb4:   	fnegs	%f19, %f26
	.word	0xda30a03c	! t0_kref+0xcb8:   	sth	%o5, [%g2 + 0x3c]
	.word	0xa9b586f8	! t0_kref+0xcbc:   	fmul8ulx16	%f22, %f24, %f20
	.word	0x90f03a74	! t0_kref+0xcc0:   	udivcc	%g0, -0x58c, %o0
	.word	0x28800001	! t0_kref+0xcc4:   	bleu,a	_kref+0xcc8
	.word	0xb1a0005a	! t0_kref+0xcc8:   	fmovd	%f26, %f24
	.word	0x39800003	! t0_kref+0xccc:   	fbuge,a	_kref+0xcd8
	.word	0xa8180000	! t0_kref+0xcd0:   	xor	%g0, %g0, %l4
	.word	0x9fb00cfa	! t0_kref+0xcd4:   	fnot2s	%f26, %f15
	.word	0xc768a007	! t0_kref+0xcd8:   	prefetch	%g2 + 7, 3
	.word	0x8585800d	! t0_kref+0xcdc:   	wr	%l6, %o5, %ccr
	.word	0xa9b68eda	! t0_kref+0xce0:   	fornot2	%f26, %f26, %f20
	.word	0xc568a04d	! t0_kref+0xce4:   	prefetch	%g2 + 0x4d, 2
	.word	0xee500019	! t0_kref+0xce8:   	ldsh	[%g0 + %i1], %l7
	.word	0xf4366000	! t0_kref+0xcec:   	sth	%i2, [%i1]
	.word	0x37800002	! t0_kref+0xcf0:   	fbge,a	_kref+0xcf8
	.word	0xf106401c	! t0_kref+0xcf4:   	ld	[%i1 + %i4], %f24
	.word	0xadb48c56	! t0_kref+0xcf8:   	fnor	%f18, %f22, %f22
	.word	0x30480006	! t0_kref+0xcfc:   	ba,a,pt	%icc, _kref+0xd14
	.word	0xac5ac000	! t0_kref+0xd00:   	smul	%o3, %g0, %l6
	.word	0xa9b2c14c	! t0_kref+0xd04:   	edge32l	%o3, %o4, %l4
	.word	0x99b00f3b	! t0_kref+0xd08:   	fsrc2s	%f27, %f12
	.word	0x949a8008	! t0_kref+0xd0c:   	xorcc	%o2, %o0, %o2
	.word	0xb5b00fc0	! t0_kref+0xd10:   	fone	%f26
	.word	0xdd3e2008	! t0_kref+0xd14:   	std	%f14, [%i0 + 8]
	.word	0xa9a409ce	! t0_kref+0xd18:   	fdivd	%f16, %f14, %f20
	.word	0xda20a028	! t0_kref+0xd1c:   	st	%o5, [%g2 + 0x28]
	.word	0xe408a006	! t0_kref+0xd20:   	ldub	[%g2 + 6], %l2
	.word	0xf91fbd10	! t0_kref+0xd24:   	ldd	[%fp - 0x2f0], %f28
	.word	0xb7a01a34	! t0_kref+0xd28:   	fstoi	%f20, %f27
	.word	0x35480004	! t0_kref+0xd2c:   	fbue,a,pt	%fcc0, _kref+0xd3c
	.word	0x81834000	! t0_kref+0xd30:   	wr	%o5, %g0, %y
	.word	0xfd263fec	! t0_kref+0xd34:   	st	%f30, [%i0 - 0x14]
	.word	0xd228a034	! t0_kref+0xd38:   	stb	%o1, [%g2 + 0x34]
	.word	0x960b6e61	! t0_kref+0xd3c:   	and	%o5, 0xe61, %o3
	.word	0xd420a020	! t0_kref+0xd40:   	st	%o2, [%g2 + 0x20]
	.word	0xee20a02c	! t0_kref+0xd44:   	st	%l7, [%g2 + 0x2c]
	.word	0xad2b200f	! t0_kref+0xd48:   	sll	%o4, 0xf, %l6
	.word	0xa925a1c8	! t0_kref+0xd4c:   	mulscc	%l6, 0x1c8, %l4
	.word	0xb1a01a5e	! t0_kref+0xd50:   	fdtoi	%f30, %f24
	.word	0x013b2c63	! t0_kref+0xd54:   	sethi	%hi(0xecb18c00), %g0
	.word	0xe2680019	! t0_kref+0xd58:   	ldstub	[%g0 + %i1], %l1
	.word	0xf700a024	! t0_kref+0xd5c:   	ld	[%g2 + 0x24], %f27
	.word	0xa1a308dc	! t0_kref+0xd60:   	fsubd	%f12, %f28, %f16
	.word	0x9095801a	! t0_kref+0xd64:   	orcc	%l6, %i2, %o0
	.word	0x8143e040	! t0_kref+0xd68:   	membar	0x40
	.word	0xb1a408d6	! t0_kref+0xd6c:   	fsubd	%f16, %f22, %f24
	.word	0x9e05e359	! t0_kref+0xd70:   	add	%l7, 0x359, %o7
	.word	0xa1a00558	! t0_kref+0xd74:   	fsqrtd	%f24, %f16
	.word	0xaa1d63ca	! t0_kref+0xd78:   	xor	%l5, 0x3ca, %l5
	.word	0xa9a78935	! t0_kref+0xd7c:   	fmuls	%f30, %f21, %f20
	.word	0x81ae8a3c	! t0_kref+0xd80:   	fcmps	%fcc0, %f26, %f28
	.word	0xdd00a01c	! t0_kref+0xd84:   	ld	[%g2 + 0x1c], %f14
	.word	0xa5a00556	! t0_kref+0xd88:   	fsqrtd	%f22, %f18
	.word	0xee7f0018	! t0_kref+0xd8c:   	swap	[%i4 + %i0], %l7
	.word	0xbda018dc	! t0_kref+0xd90:   	fdtos	%f28, %f30
	.word	0xe168a04a	! t0_kref+0xd94:   	prefetch	%g2 + 0x4a, 16
	.word	0xa8b82ccf	! t0_kref+0xd98:   	xnorcc	%g0, 0xccf, %l4
	.word	0xaa92800a	! t0_kref+0xd9c:   	orcc	%o2, %o2, %l5
	.word	0xf1270000	! t0_kref+0xda0:   	st	%f24, [%i4]
	.word	0xc1f65000	! t0_kref+0xda4:   	casxa	[%i1]0x80, %g0, %g0
	.word	0xb5a01a4e	! t0_kref+0xda8:   	fdtoi	%f14, %f26
	.word	0x9bb240b6	! t0_kref+0xdac:   	edge16n	%o1, %l6, %o5
	.word	0x99a0191a	! t0_kref+0xdb0:   	fitod	%f26, %f12
	.word	0xed264000	! t0_kref+0xdb4:   	st	%f22, [%i1]
	.word	0x8143c000	! t0_kref+0xdb8:   	stbar
	.word	0xe47f0018	! t0_kref+0xdbc:   	swap	[%i4 + %i0], %l2
	.word	0x9fb34a3c	! t0_kref+0xdc0:   	fpadd16s	%f13, %f28, %f15
	.word	0xa5b38a78	! t0_kref+0xdc4:   	fpadd32s	%f14, %f24, %f18
	.word	0x81580000	! t0_kref+0xdc8:   	flushw
	.word	0x9ad58015	! t0_kref+0xdcc:   	umulcc	%l6, %l5, %o5
	.word	0x805d4000	! t0_kref+0xdd0:   	smul	%l5, %g0, %g0
	.word	0x9bb20280	! t0_kref+0xdd4:   	array32	%o0, %g0, %o5
	.word	0xafa01a5a	! t0_kref+0xdd8:   	fdtoi	%f26, %f23
	.word	0xd030a010	! t0_kref+0xddc:   	sth	%o0, [%g2 + 0x10]
	.word	0xbda01a30	! t0_kref+0xde0:   	fstoi	%f16, %f30
	.word	0xa7b70550	! t0_kref+0xde4:   	fcmpeq16	%f28, %f16, %l3
	.word	0xbbb30a72	! t0_kref+0xde8:   	fpadd32s	%f12, %f18, %f29
	.word	0x92da3ce1	! t0_kref+0xdec:   	smulcc	%o0, -0x31f, %o1
	.word	0xa1a709dc	! t0_kref+0xdf0:   	fdivd	%f28, %f28, %f16
	.word	0xafb70510	! t0_kref+0xdf4:   	fcmpgt16	%f28, %f16, %l7
	.word	0x9fc00004	! t0_kref+0xdf8:   	call	%g0 + %g4
	.word	0x9b40c000	! t0_kref+0xdfc:   	mov	%asi, %o5
	.word	0x8143e040	! t0_kref+0xe00:   	membar	0x40
	.word	0x9126a82e	! t0_kref+0xe04:   	mulscc	%i2, 0x82e, %o0
	.word	0x95408000	! t0_kref+0xe08:   	mov	%ccr, %o2
	.word	0xf126200c	! t0_kref+0xe0c:   	st	%f24, [%i0 + 0xc]
	.word	0x9a183a9a	! t0_kref+0xe10:   	xor	%g0, -0x566, %o5
	.word	0x965a8015	! t0_kref+0xe14:   	smul	%o2, %l5, %o3
	.word	0x9530000b	! t0_kref+0xe18:   	srl	%g0, %o3, %o2
	.word	0x8143c000	! t0_kref+0xe1c:   	stbar
	.word	0xabb64a70	! t0_kref+0xe20:   	fpadd32s	%f25, %f16, %f21
	.word	0xabb540a9	! t0_kref+0xe24:   	edge16n	%l5, %o1, %l5
	.word	0xa6f5620f	! t0_kref+0xe28:   	udivcc	%l5, 0x20f, %l3
	.word	0xaedaa02c	! t0_kref+0xe2c:   	smulcc	%o2, 0x2c, %l7
	.word	0xa8a278f9	! t0_kref+0xe30:   	subcc	%o1, -0x707, %l4
	.word	0x9fc10000	! t0_kref+0xe34:   	call	%g4
	.word	0x99408000	! t0_kref+0xe38:   	mov	%ccr, %o4
	.word	0x3e800002	! t0_kref+0xe3c:   	bvc,a	_kref+0xe44
	.word	0xd88e9018	! t0_kref+0xe40:   	lduba	[%i2 + %i0]0x80, %o4
	.word	0xee067ff0	! t0_kref+0xe44:   	ld	[%i1 - 0x10], %l7
	.word	0xd048a03d	! t0_kref+0xe48:   	ldsb	[%g2 + 0x3d], %o0
	.word	0x21800004	! t0_kref+0xe4c:   	fbn,a	_kref+0xe5c
	.word	0xe8d81018	! t0_kref+0xe50:   	ldxa	[%g0 + %i0]0x80, %l4
	.word	0xa80d8008	! t0_kref+0xe54:   	and	%l6, %o0, %l4
	.word	0x931e8017	! t0_kref+0xe58:   	tsubcctv	%i2, %l7, %o1
	.word	0xb7a70837	! t0_kref+0xe5c:   	fadds	%f28, %f23, %f27
	.word	0x805ebbed	! t0_kref+0xe60:   	smul	%i2, -0x413, %g0
	.word	0xbba0053b	! t0_kref+0xe64:   	fsqrts	%f27, %f29
	.word	0x34480007	! t0_kref+0xe68:   	bg,a,pt	%icc, _kref+0xe84
	.word	0xadb5c12c	! t0_kref+0xe6c:   	edge32n	%l7, %o4, %l6
	.word	0x81ad0a36	! t0_kref+0xe70:   	fcmps	%fcc0, %f20, %f22
	.word	0xed68a043	! t0_kref+0xe74:   	prefetch	%g2 + 0x43, 22
	.word	0x9096a231	! t0_kref+0xe78:   	orcc	%i2, 0x231, %o0
	.word	0xbba01a31	! t0_kref+0xe7c:   	fstoi	%f17, %f29
	.word	0xd4300019	! t0_kref+0xe80:   	sth	%o2, [%g0 + %i1]
	.word	0x2a800004	! t0_kref+0xe84:   	bcs,a	_kref+0xe94
	.word	0xa8282e5c	! t0_kref+0xe88:   	andn	%g0, 0xe5c, %l4
	.word	0x39800002	! t0_kref+0xe8c:   	fbuge,a	_kref+0xe94
	.word	0x1336f037	! t0_kref+0xe90:   	sethi	%hi(0xdbc0dc00), %o1
	.word	0xd620a01c	! t0_kref+0xe94:   	st	%o3, [%g2 + 0x1c]
	.word	0xe068a012	! t0_kref+0xe98:   	ldstub	[%g2 + 0x12], %l0
	.word	0xa1a01a5a	! t0_kref+0xe9c:   	fdtoi	%f26, %f16
	.word	0xa1b00cce	! t0_kref+0xea0:   	fnot2	%f14, %f16
	.word	0x9fc00004	! t0_kref+0xea4:   	call	%g0 + %g4
	.word	0x9db44d35	! t0_kref+0xea8:   	fandnot1s	%f17, %f21, %f14
	.word	0xd2563fe4	! t0_kref+0xeac:   	ldsh	[%i0 - 0x1c], %o1
	.word	0x91b2c156	! t0_kref+0xeb0:   	edge32l	%o3, %l6, %o0
	.word	0xb5b00cec	! t0_kref+0xeb4:   	fnot2s	%f12, %f26
	.word	0x9fc00004	! t0_kref+0xeb8:   	call	%g0 + %g4
	.word	0xd7e61000	! t0_kref+0xebc:   	casa	[%i0]0x80, %g0, %o3
	.word	0xe2e81018	! t0_kref+0xec0:   	ldstuba	[%g0 + %i0]0x80, %l1
	.word	0x34800005	! t0_kref+0xec4:   	bg,a	_kref+0xed8
	.word	0xc028a01a	! t0_kref+0xec8:   	clrb	[%g2 + 0x1a]
	.word	0x9e8b2b85	! t0_kref+0xecc:   	andcc	%o4, 0xb85, %o7
	.word	0xe47f0018	! t0_kref+0xed0:   	swap	[%i4 + %i0], %l2
	.word	0xa1a00550	! t0_kref+0xed4:   	fsqrtd	%f16, %f16
	.word	0x9a602c0d	! t0_kref+0xed8:   	subc	%g0, 0xc0d, %o5
	.word	0xc1ee100c	! t0_kref+0xedc:   	prefetcha	%i0 + %o4, 0
	.word	0xa1a00536	! t0_kref+0xee0:   	fsqrts	%f22, %f16
	.word	0xf42e0000	! t0_kref+0xee4:   	stb	%i2, [%i0]
	.word	0x8143c000	! t0_kref+0xee8:   	stbar
	.word	0xa8db400d	! t0_kref+0xeec:   	smulcc	%o5, %o5, %l4
	.word	0xd408a01f	! t0_kref+0xef0:   	ldub	[%g2 + 0x1f], %o2
	.word	0x94fdfb70	! t0_kref+0xef4:   	sdivcc	%l7, -0x490, %o2
	.word	0xd648a020	! t0_kref+0xef8:   	ldsb	[%g2 + 0x20], %o3
	.word	0x001fffff	! t0_kref+0xefc:   	illtrap	0x1fffff
	.word	0x30800008	! t0_kref+0xf00:   	ba,a	_kref+0xf20
	.word	0x98aaa572	! t0_kref+0xf04:   	andncc	%o2, 0x572, %o4
	.word	0xb1b78ea0	! t0_kref+0xf08:   	fsrc1s	%f30, %f24
	.word	0xb5b48d40	! t0_kref+0xf0c:   	fnot1	%f18, %f26
	call	SYM(t0_subr2)
	.word	0xa0b2c00c	! t0_kref+0xf14:   	orncc	%o3, %o4, %l0
	.word	0x9da58d34	! t0_kref+0xf18:   	fsmuld	%f22, %f20, %f14
	.word	0xa7a5c837	! t0_kref+0xf1c:   	fadds	%f23, %f23, %f19
	.word	0xeb263fec	! t0_kref+0xf20:   	st	%f21, [%i0 - 0x14]
	.word	0xfb00a000	! t0_kref+0xf24:   	ld	[%g2], %f29
	.word	0xa1a0002d	! t0_kref+0xf28:   	fmovs	%f13, %f16
	.word	0x34800008	! t0_kref+0xf2c:   	bg,a	_kref+0xf4c
	.word	0x91b2c017	! t0_kref+0xf30:   	edge8	%o3, %l7, %o0
	.word	0xf7070019	! t0_kref+0xf34:   	ld	[%i4 + %i1], %f27
	.word	0x9e724016	! t0_kref+0xf38:   	udiv	%o1, %l6, %o7
	.word	0x9fc00004	! t0_kref+0xf3c:   	call	%g0 + %g4
	.word	0xaf2a8009	! t0_kref+0xf40:   	sll	%o2, %o1, %l7
	.word	0x97400000	! t0_kref+0xf44:   	mov	%y, %o3
	.word	0xda2e7ff5	! t0_kref+0xf48:   	stb	%o5, [%i1 - 0xb]
	.word	0xc020a028	! t0_kref+0xf4c:   	clr	[%g2 + 0x28]
	.word	0x8022800d	! t0_kref+0xf50:   	sub	%o2, %o5, %g0
	.word	0xf420a00c	! t0_kref+0xf54:   	st	%i2, [%g2 + 0xc]
	.word	0xaa2d400c	! t0_kref+0xf58:   	andn	%l5, %o4, %l5
	.word	0x9da0054e	! t0_kref+0xf5c:   	fsqrtd	%f14, %f14
	.word	0xeaae9019	! t0_kref+0xf60:   	stba	%l5, [%i2 + %i1]0x80
	.word	0x99b70d90	! t0_kref+0xf64:   	fxor	%f28, %f16, %f12
	.word	0xd2e81018	! t0_kref+0xf68:   	ldstuba	[%g0 + %i0]0x80, %o1
	.word	0x963a0009	! t0_kref+0xf6c:   	xnor	%o0, %o1, %o3
	.word	0x81abca39	! t0_kref+0xf70:   	fcmps	%fcc0, %f15, %f25
	.word	0xda20a000	! t0_kref+0xf74:   	st	%o5, [%g2]
	.word	0xe07e001c	! t0_kref+0xf78:   	swap	[%i0 + %i4], %l0
	.word	0xadb54049	! t0_kref+0xf7c:   	edge8l	%l5, %o1, %l6
	.word	0xf1066004	! t0_kref+0xf80:   	ld	[%i1 + 4], %f24
	.word	0x30480004	! t0_kref+0xf84:   	ba,a,pt	%icc, _kref+0xf94
	.word	0xc3ee100a	! t0_kref+0xf88:   	prefetcha	%i0 + %o2, 1
	.word	0x92aa801a	! t0_kref+0xf8c:   	andncc	%o2, %i2, %o1
	.word	0xbda00537	! t0_kref+0xf90:   	fsqrts	%f23, %f30
	.word	0x97b0004d	! t0_kref+0xf94:   	edge8l	%g0, %o5, %o3
	.word	0xd608a035	! t0_kref+0xf98:   	ldub	[%g2 + 0x35], %o3
	.word	0x292783e3	! t0_kref+0xf9c:   	sethi	%hi(0x9e0f8c00), %l4
	.word	0xecc6101c	! t0_kref+0xfa0:   	ldswa	[%i0 + %i4]0x80, %l6
	.word	0xdf266010	! t0_kref+0xfa4:   	st	%f15, [%i1 + 0x10]
	.word	0xae3df625	! t0_kref+0xfa8:   	xnor	%l7, -0x9db, %l7
	.word	0xadb484ce	! t0_kref+0xfac:   	fcmpne32	%f18, %f14, %l6
	.word	0xe8064000	! t0_kref+0xfb0:   	ld	[%i1], %l4
	.word	0x9122ef6b	! t0_kref+0xfb4:   	mulscc	%o3, 0xf6b, %o0
	.word	0xec40a034	! t0_kref+0xfb8:   	ldsw	[%g2 + 0x34], %l6
	.word	0x9da000ae	! t0_kref+0xfbc:   	fnegs	%f14, %f14
	.word	0xc168a046	! t0_kref+0xfc0:   	prefetch	%g2 + 0x46, 0
	.word	0xabb0077e	! t0_kref+0xfc4:   	fpack16	%f30, %f21
	.word	0xa6e28017	! t0_kref+0xfc8:   	subccc	%o2, %l7, %l3
	.word	0xc807bfec	! t0_kref+0xfcc:   	ld	[%fp - 0x14], %g4
	.word	0xa486a612	! t0_kref+0xfd0:   	addcc	%i2, 0x612, %l2
	.word	0x9e720008	! t0_kref+0xfd4:   	udiv	%o0, %o0, %o7
	.word	0x81dc0013	! t0_kref+0xfd8:   	flush	%l0 + %l3
	.word	0xea56401b	! t0_kref+0xfdc:   	ldsh	[%i1 + %i3], %l5
	.word	0xf207bfe0	! t0_kref+0xfe0:   	ld	[%fp - 0x20], %i1
	.word	0xa42b31eb	! t0_kref+0xfe4:   	andn	%o4, -0xe15, %l2
	.word	0xad35601e	! t0_kref+0xfe8:   	srl	%l5, 0x1e, %l6
	.word	0xd406200c	! t0_kref+0xfec:   	ld	[%i0 + 0xc], %o2
	.word	0xbba01a3a	! t0_kref+0xff0:   	fstoi	%f26, %f29
	.word	0xe11e7ff0	! t0_kref+0xff4:   	ldd	[%i1 - 0x10], %f16
	.word	0x99a000d0	! t0_kref+0xff8:   	fnegd	%f16, %f12
	.word	0x9ebd7eba	! t0_kref+0xffc:   	xnorcc	%l5, -0x146, %o7
	.word	0x9da709de	! t0_kref+0x1000:   	fdivd	%f28, %f30, %f14
	.word	0x9fa01a5a	! t0_kref+0x1004:   	fdtoi	%f26, %f15
	.word	0x0135d141	! t0_kref+0x1008:   	sethi	%hi(0xd7450400), %g0
	.word	0xa9a00550	! t0_kref+0x100c:   	fsqrtd	%f16, %f20
	.word	0xe6070018	! t0_kref+0x1010:   	ld	[%i4 + %i0], %l3
	.word	0xaa55c01a	! t0_kref+0x1014:   	umul	%l7, %i2, %l5
	.word	0x9ba01a32	! t0_kref+0x1018:   	fstoi	%f18, %f13
	.word	0xe300a01c	! t0_kref+0x101c:   	ld	[%g2 + 0x1c], %f17
	.word	0x9fc00004	! t0_kref+0x1020:   	call	%g0 + %g4
	.word	0xf7260000	! t0_kref+0x1024:   	st	%f27, [%i0]
	.word	0x81ae0ada	! t0_kref+0x1028:   	fcmped	%fcc0, %f24, %f26
	.word	0xd47e4000	! t0_kref+0x102c:   	swap	[%i1], %o2
	.word	0xb9b68914	! t0_kref+0x1030:   	faligndata	%f26, %f20, %f28
	.word	0x9fb00cee	! t0_kref+0x1034:   	fnot2s	%f14, %f15
	.word	0xada0193d	! t0_kref+0x1038:   	fstod	%f29, %f22
	.word	0xeef6101d	! t0_kref+0x103c:   	stxa	%l7, [%i0 + %i5]0x80
	.word	0x81ddc01d	! t0_kref+0x1040:   	flush	%l7 + %i5
	.word	0xa1a01a36	! t0_kref+0x1044:   	fstoi	%f22, %f16
	.word	0xf4280019	! t0_kref+0x1048:   	stb	%i2, [%g0 + %i1]
	.word	0xb5a4885e	! t0_kref+0x104c:   	faddd	%f18, %f30, %f26
	.word	0xa63b605e	! t0_kref+0x1050:   	xnor	%o5, 0x5e, %l3
	.word	0xa1a0055a	! t0_kref+0x1054:   	fsqrtd	%f26, %f16
	.word	0xd410a00a	! t0_kref+0x1058:   	lduh	[%g2 + 0xa], %o2
	.word	0x90f2c000	! t0_kref+0x105c:   	udivcc	%o3, %g0, %o0
	.word	0xacaac01a	! t0_kref+0x1060:   	andncc	%o3, %i2, %l6
	.word	0x9af34015	! t0_kref+0x1064:   	udivcc	%o5, %l5, %o5
	.word	0xbda609d4	! t0_kref+0x1068:   	fdivd	%f24, %f20, %f30
	.word	0xee4e7ff2	! t0_kref+0x106c:   	ldsb	[%i1 - 0xe], %l7
	.word	0x9e3b295d	! t0_kref+0x1070:   	xnor	%o4, 0x95d, %o7
	.word	0x20480003	! t0_kref+0x1074:   	bn,a,pt	%icc, _kref+0x1080
	.word	0xafb3ccaf	! t0_kref+0x1078:   	fandnot2s	%f15, %f15, %f23
	.word	0xae2ae194	! t0_kref+0x107c:   	andn	%o3, 0x194, %l7
	.word	0x8143c000	! t0_kref+0x1080:   	stbar
	.word	0xb7a018d4	! t0_kref+0x1084:   	fdtos	%f20, %f27
	.word	0x251b6778	! t0_kref+0x1088:   	sethi	%hi(0x6d9de000), %l2
	.word	0x982b4008	! t0_kref+0x108c:   	andn	%o5, %o0, %o4
	call	SYM(t0_subr0)
	.word	0xa0282691	! t0_kref+0x1094:   	andn	%g0, 0x691, %l0
	.word	0xef00a01c	! t0_kref+0x1098:   	ld	[%g2 + 0x1c], %f23
	.word	0xa5a589de	! t0_kref+0x109c:   	fdivd	%f22, %f30, %f18
	.word	0x26800005	! t0_kref+0x10a0:   	bl,a	_kref+0x10b4
	.word	0x9a1aba1f	! t0_kref+0x10a4:   	xor	%o2, -0x5e1, %o5
	.word	0xe3ee501a	! t0_kref+0x10a8:   	prefetcha	%i1 + %i2, 17
	.word	0xa61a0009	! t0_kref+0x10ac:   	xor	%o0, %o1, %l3
	.word	0x81b2c240	! t0_kref+0x10b0:   	array16	%o3, %g0, %g0
	.word	0xb7a00530	! t0_kref+0x10b4:   	fsqrts	%f16, %f27
	.word	0xadb00cda	! t0_kref+0x10b8:   	fnot2	%f26, %f22
	.word	0x34480003	! t0_kref+0x10bc:   	bg,a,pt	%icc, _kref+0x10c8
	.word	0xe87e601c	! t0_kref+0x10c0:   	swap	[%i1 + 0x1c], %l4
	.word	0xe5180018	! t0_kref+0x10c4:   	ldd	[%g0 + %i0], %f18
	.word	0xd636200a	! t0_kref+0x10c8:   	sth	%o3, [%i0 + 0xa]
	.word	0xf5267fe4	! t0_kref+0x10cc:   	st	%f26, [%i1 - 0x1c]
	.word	0x80f5c00c	! t0_kref+0x10d0:   	udivcc	%l7, %o4, %g0
	.word	0x99b5400c	! t0_kref+0x10d4:   	edge8	%l5, %o4, %o4
	.word	0xeb68a08c	! t0_kref+0x10d8:   	prefetch	%g2 + 0x8c, 21
	.word	0xf42e0000	! t0_kref+0x10dc:   	stb	%i2, [%i0]
	.word	0xa1a00554	! t0_kref+0x10e0:   	fsqrtd	%f20, %f16
	.word	0xa5b6cdfd	! t0_kref+0x10e4:   	fnands	%f27, %f29, %f18
	.word	0xb5b3071c	! t0_kref+0x10e8:   	fmuld8sux16	%f12, %f28, %f26
	.word	0x9ee34008	! t0_kref+0x10ec:   	subccc	%o5, %o0, %o7
	.word	0xeaa6101c	! t0_kref+0x10f0:   	sta	%l5, [%i0 + %i4]0x80
	.word	0xd0264000	! t0_kref+0x10f4:   	st	%o0, [%i1]
	.word	0xd9be5855	! t0_kref+0x10f8:   	stda	%f12, [%i1 + %l5]0xc2
	.word	0xd88e101a	! t0_kref+0x10fc:   	lduba	[%i0 + %i2]0x80, %o4
	.word	0xb1a00158	! t0_kref+0x1100:   	fabsd	%f24, %f24
	.word	0xae1e800a	! t0_kref+0x1104:   	xor	%i2, %o2, %l7
	.word	0x9072bcd7	! t0_kref+0x1108:   	udiv	%o2, -0x329, %o0
	.word	0x8143c000	! t0_kref+0x110c:   	stbar
	.word	0x9de3bfa0	! t0_kref+0x1110:   	save	%sp, -0x60, %sp
	.word	0xb2c7277f	! t0_kref+0x1114:   	addccc	%i4, 0x77f, %i1
	.word	0x9beebced	! t0_kref+0x1118:   	restore	%i2, -0x313, %o5
	.word	0xaa0b271b	! t0_kref+0x111c:   	and	%o4, 0x71b, %l5
	.word	0x8133601e	! t0_kref+0x1120:   	srl	%o5, 0x1e, %g0
	.word	0x91400000	! t0_kref+0x1124:   	mov	%y, %o0
	.word	0xadb300d5	! t0_kref+0x1128:   	edge16l	%o4, %l5, %l6
	.word	0xdb801019	! t0_kref+0x112c:   	lda	[%g0 + %i1]0x80, %f13
	.word	0x9aab76fd	! t0_kref+0x1130:   	andncc	%o5, -0x903, %o5
	.word	0x26800003	! t0_kref+0x1134:   	bl,a	_kref+0x1140
	.word	0xb5a01a5c	! t0_kref+0x1138:   	fdtoi	%f28, %f26
	.word	0xdb264000	! t0_kref+0x113c:   	st	%f13, [%i1]
	.word	0xec50a01e	! t0_kref+0x1140:   	ldsh	[%g2 + 0x1e], %l6
	.word	0xf430a028	! t0_kref+0x1144:   	sth	%i2, [%g2 + 0x28]
	.word	0x8143c000	! t0_kref+0x1148:   	stbar
	.word	0xe868a02e	! t0_kref+0x114c:   	ldstub	[%g2 + 0x2e], %l4
	.word	0xa5a0012e	! t0_kref+0x1150:   	fabss	%f14, %f18
	.word	0xa9a0054c	! t0_kref+0x1154:   	fsqrtd	%f12, %f20
	.word	0xec30a02c	! t0_kref+0x1158:   	sth	%l6, [%g2 + 0x2c]
	.word	0xe4563fe4	! t0_kref+0x115c:   	ldsh	[%i0 - 0x1c], %l2
	.word	0xc807bff0	! t0_kref+0x1160:   	ld	[%fp - 0x10], %g4
	.word	0x9e522e8a	! t0_kref+0x1164:   	umul	%o0, 0xe8a, %o7
	.word	0xadb30e16	! t0_kref+0x1168:   	fand	%f12, %f22, %f22
	.word	0xaca80016	! t0_kref+0x116c:   	andncc	%g0, %l6, %l6
	.word	0xa1a00558	! t0_kref+0x1170:   	fsqrtd	%f24, %f16
	.word	0xaa257411	! t0_kref+0x1174:   	sub	%l5, -0xbef, %l5
	.word	0xe400a030	! t0_kref+0x1178:   	ld	[%g2 + 0x30], %l2
	.word	0xa85b400c	! t0_kref+0x117c:   	smul	%o5, %o4, %l4
	.word	0xa635c01a	! t0_kref+0x1180:   	orn	%l7, %i2, %l3
	.word	0xa8168009	! t0_kref+0x1184:   	or	%i2, %o1, %l4
	.word	0xb7a0053c	! t0_kref+0x1188:   	fsqrts	%f28, %f27
	.word	0x9da58854	! t0_kref+0x118c:   	faddd	%f22, %f20, %f14
	.word	0xe07e4000	! t0_kref+0x1190:   	swap	[%i1], %l0
	.word	0xb9b4ccac	! t0_kref+0x1194:   	fandnot2s	%f19, %f12, %f28
	.word	0xea267fec	! t0_kref+0x1198:   	st	%l5, [%i1 - 0x14]
	.word	0xea070018	! t0_kref+0x119c:   	ld	[%i4 + %i0], %l5
	.word	0xac62afaa	! t0_kref+0x11a0:   	subc	%o2, 0xfaa, %l6
	.word	0x9fc00004	! t0_kref+0x11a4:   	call	%g0 + %g4
	.word	0xb5a448b7	! t0_kref+0x11a8:   	fsubs	%f17, %f23, %f26
	.word	0xa8e2f4a4	! t0_kref+0x11ac:   	subccc	%o3, -0xb5c, %l4
	.word	0xd2c6501c	! t0_kref+0x11b0:   	ldswa	[%i1 + %i4]0x80, %o1
	.word	0xa702801a	! t0_kref+0x11b4:   	taddcc	%o2, %i2, %l3
	.word	0xac2d4015	! t0_kref+0x11b8:   	andn	%l5, %l5, %l6
	.word	0x2b3086fb	! t0_kref+0x11bc:   	sethi	%hi(0xc21bec00), %l5
	.word	0x32480002	! t0_kref+0x11c0:   	bne,a,pt	%icc, _kref+0x11c8
	.word	0x9a5ebdaf	! t0_kref+0x11c4:   	smul	%i2, -0x251, %o5
	.word	0x81db8013	! t0_kref+0x11c8:   	flush	%sp + %l3
	.word	0x9de3bfa0	! t0_kref+0x11cc:   	save	%sp, -0x60, %sp
	.word	0xb497401c	! t0_kref+0x11d0:   	orcc	%i5, %i4, %i2
	.word	0x81e823a8	! t0_kref+0x11d4:   	restore	%g0, 0x3a8, %g0
	.word	0x3e800001	! t0_kref+0x11d8:   	bvc,a	_kref+0x11dc
	.word	0x98d5c017	! t0_kref+0x11dc:   	umulcc	%l7, %l7, %o4
	.word	0xd2f61000	! t0_kref+0x11e0:   	stxa	%o1, [%i0]0x80
	.word	0xa8e5b821	! t0_kref+0x11e4:   	subccc	%l6, -0x7df, %l4
	.word	0x9436b60c	! t0_kref+0x11e8:   	orn	%i2, -0x9f4, %o2
	.word	0xa92b6007	! t0_kref+0x11ec:   	sll	%o5, 0x7, %l4
	.word	0xe656c019	! t0_kref+0x11f0:   	ldsh	[%i3 + %i1], %l3
	.word	0xa9a388d0	! t0_kref+0x11f4:   	fsubd	%f14, %f16, %f20
	.word	0x38800004	! t0_kref+0x11f8:   	bgu,a	_kref+0x1208
	.word	0xe920a010	! t0_kref+0x11fc:   	st	%f20, [%g2 + 0x10]
	.word	0xb1a60850	! t0_kref+0x1200:   	faddd	%f24, %f16, %f24
	.word	0x3d800007	! t0_kref+0x1204:   	fbule,a	_kref+0x1220
	.word	0x93258009	! t0_kref+0x1208:   	mulscc	%l6, %o1, %o1
	.word	0xd040a004	! t0_kref+0x120c:   	ldsw	[%g2 + 4], %o0
	.word	0xa732600f	! t0_kref+0x1210:   	srl	%o1, 0xf, %l3
	.word	0x97280015	! t0_kref+0x1214:   	sll	%g0, %l5, %o3
	.word	0xdd26201c	! t0_kref+0x1218:   	st	%f14, [%i0 + 0x1c]
	.word	0xa8fb0008	! t0_kref+0x121c:   	sdivcc	%o4, %o0, %l4
	.word	0x83414000	! t0_kref+0x1220:   	mov	%pc, %g1
	.word	0x38800008	! t0_kref+0x1224:   	bgu,a	_kref+0x1244
	.word	0xaf2b200f	! t0_kref+0x1228:   	sll	%o4, 0xf, %l7
	.word	0xa1a00133	! t0_kref+0x122c:   	fabss	%f19, %f16
	.word	0xada00550	! t0_kref+0x1230:   	fsqrtd	%f16, %f22
	.word	0x9ea80015	! t0_kref+0x1234:   	andncc	%g0, %l5, %o7
	.word	0xb5b3072c	! t0_kref+0x1238:   	fmuld8ulx16	%f12, %f12, %f26
	.word	0xb3a01a37	! t0_kref+0x123c:   	fstoi	%f23, %f25
	.word	0xb1a000b1	! t0_kref+0x1240:   	fnegs	%f17, %f24
	.word	0xab1a000a	! t0_kref+0x1244:   	tsubcctv	%o0, %o2, %l5
	.word	0xd4063fe4	! t0_kref+0x1248:   	ld	[%i0 - 0x1c], %o2
	.word	0xdf20a030	! t0_kref+0x124c:   	st	%f15, [%g2 + 0x30]
	.word	0xdf00a03c	! t0_kref+0x1250:   	ld	[%g2 + 0x3c], %f15
	.word	0xafa38838	! t0_kref+0x1254:   	fadds	%f14, %f24, %f23
	.word	0xd830a03a	! t0_kref+0x1258:   	sth	%o4, [%g2 + 0x3a]
	.word	0xe1be5809	! t0_kref+0x125c:   	stda	%f16, [%i1 + %o1]0xc0
	.word	0xdf064000	! t0_kref+0x1260:   	ld	[%i1], %f15
	.word	0xb5a0054c	! t0_kref+0x1264:   	fsqrtd	%f12, %f26
	.word	0x3c800005	! t0_kref+0x1268:   	bpos,a	_kref+0x127c
	.word	0xa5a01896	! t0_kref+0x126c:   	fitos	%f22, %f18
	.word	0xa540c000	! t0_kref+0x1270:   	mov	%asi, %l2
	.word	0x99a0110e	! t0_kref+0x1274:   	fxtod	%f14, %f12
	.word	0x94e2800a	! t0_kref+0x1278:   	subccc	%o2, %o2, %o2
	.word	0x99a0012f	! t0_kref+0x127c:   	fabss	%f15, %f12
	.word	0xd67e7fe8	! t0_kref+0x1280:   	swap	[%i1 - 0x18], %o3
	.word	0xa1b58ea0	! t0_kref+0x1284:   	fsrc1s	%f22, %f16
	.word	0xbba01a54	! t0_kref+0x1288:   	fdtoi	%f20, %f29
	.word	0xd2ae9018	! t0_kref+0x128c:   	stba	%o1, [%i2 + %i0]0x80
	.word	0xb3a01a3d	! t0_kref+0x1290:   	fstoi	%f29, %f25
	.word	0xd448a013	! t0_kref+0x1294:   	ldsb	[%g2 + 0x13], %o2
	.word	0x81830000	! t0_kref+0x1298:   	wr	%o4, %g0, %y
	.word	0xea861000	! t0_kref+0x129c:   	lda	[%i0]0x80, %l5
	.word	0xe3260000	! t0_kref+0x12a0:   	st	%f17, [%i0]
	.word	0x9f202215	! t0_kref+0x12a4:   	mulscc	%g0, 0x215, %o7
	.word	0xa8aa72a6	! t0_kref+0x12a8:   	andncc	%o1, -0xd5a, %l4
	.word	0xd236600c	! t0_kref+0x12ac:   	sth	%o1, [%i1 + 0xc]
	.word	0x99b00f18	! t0_kref+0x12b0:   	fsrc2	%f24, %f12
	.word	0x22800001	! t0_kref+0x12b4:   	be,a	_kref+0x12b8
	.word	0x9f12bbb8	! t0_kref+0x12b8:   	taddcctv	%o2, -0x448, %o7
	.word	0xd8180019	! t0_kref+0x12bc:   	ldd	[%g0 + %i1], %o4
	.word	0x9932a000	! t0_kref+0x12c0:   	srl	%o2, 0x0, %o4
	.word	0x9da00531	! t0_kref+0x12c4:   	fsqrts	%f17, %f14
	.word	0x8143c000	! t0_kref+0x12c8:   	stbar
	.word	0x2c480005	! t0_kref+0x12cc:   	bneg,a,pt	%icc, _kref+0x12e0
	.word	0xe91fbc20	! t0_kref+0x12d0:   	ldd	[%fp - 0x3e0], %f20
	.word	0x81ae0ad6	! t0_kref+0x12d4:   	fcmped	%fcc0, %f24, %f22
	.word	0x92e00016	! t0_kref+0x12d8:   	subccc	%g0, %l6, %o1
	.word	0x8063000d	! t0_kref+0x12dc:   	subc	%o4, %o5, %g0
	.word	0x39480003	! t0_kref+0x12e0:   	fbuge,a,pt	%fcc0, _kref+0x12ec
	.word	0xc0563fee	! t0_kref+0x12e4:   	ldsh	[%i0 - 0x12], %g0
	.word	0xd24e8019	! t0_kref+0x12e8:   	ldsb	[%i2 + %i1], %o1
	.word	0xa81a400c	! t0_kref+0x12ec:   	xor	%o1, %o4, %l4
	.word	0x9db00cd2	! t0_kref+0x12f0:   	fnot2	%f18, %f14
	.word	0xd030a012	! t0_kref+0x12f4:   	sth	%o0, [%g2 + 0x12]
	.word	0x94a5ef40	! t0_kref+0x12f8:   	subcc	%l7, 0xf40, %o2
	.word	0xfd1f4018	! t0_kref+0x12fc:   	ldd	[%i5 + %i0], %f30
	.word	0x96fd76b7	! t0_kref+0x1300:   	sdivcc	%l5, -0x949, %o3
	.word	0x96626937	! t0_kref+0x1304:   	subc	%o1, 0x937, %o3
	.word	0xb9a00554	! t0_kref+0x1308:   	fsqrtd	%f20, %f28
	.word	0xec06001c	! t0_kref+0x130c:   	ld	[%i0 + %i4], %l6
	.word	0xb5b7891a	! t0_kref+0x1310:   	faligndata	%f30, %f26, %f26
	.word	0xb3b00fe0	! t0_kref+0x1314:   	fones	%f25
	.word	0x99b786d8	! t0_kref+0x1318:   	fmul8sux16	%f30, %f24, %f12
	.word	0x9e50001a	! t0_kref+0x131c:   	umul	%g0, %i2, %o7
	.word	0x92e56281	! t0_kref+0x1320:   	subccc	%l5, 0x281, %o1
	.word	0xabb68117	! t0_kref+0x1324:   	edge32	%i2, %l7, %l5
	.word	0x800b4009	! t0_kref+0x1328:   	and	%o5, %o1, %g0
	.word	0xb5b5097b	! t0_kref+0x132c:   	fpmerge	%f20, %f27, %f26
	.word	0xe7ee101d	! t0_kref+0x1330:   	prefetcha	%i0 + %i5, 19
	.word	0x9bb00cf1	! t0_kref+0x1334:   	fnot2s	%f17, %f13
	.word	0x9de3bfa0	! t0_kref+0x1338:   	save	%sp, -0x60, %sp
	.word	0xb0400018	! t0_kref+0x133c:   	addc	%g0, %i0, %i0
	.word	0x81ee001a	! t0_kref+0x1340:   	restore	%i0, %i2, %g0
	.word	0xa5b407d2	! t0_kref+0x1344:   	pdist	%f16, %f18, %f18
	.word	0x9db58a9c	! t0_kref+0x1348:   	fpsub16	%f22, %f28, %f14
	.word	0x21800005	! t0_kref+0x134c:   	fbn,a	_kref+0x1360
	.word	0xd04e0000	! t0_kref+0x1350:   	ldsb	[%i0], %o0
	.word	0xd220a010	! t0_kref+0x1354:   	st	%o1, [%g2 + 0x10]
	.word	0xdb801018	! t0_kref+0x1358:   	lda	[%g0 + %i0]0x80, %f13
	.word	0x29800004	! t0_kref+0x135c:   	fbl,a	_kref+0x136c
	.word	0x9476800a	! t0_kref+0x1360:   	udiv	%i2, %o2, %o2
	.word	0xafa01a5e	! t0_kref+0x1364:   	fdtoi	%f30, %f23
	.word	0xa4658016	! t0_kref+0x1368:   	subc	%l6, %l6, %l2
	.word	0x99234008	! t0_kref+0x136c:   	mulscc	%o5, %o0, %o4
	.word	0xa6e36085	! t0_kref+0x1370:   	subccc	%o5, 0x85, %l3
	.word	0x91b2c04c	! t0_kref+0x1374:   	edge8l	%o3, %o4, %o0
	.word	0xecbe501d	! t0_kref+0x1378:   	stda	%l6, [%i1 + %i5]0x80
	.word	0x29800004	! t0_kref+0x137c:   	fbl,a	_kref+0x138c
	.word	0xa9b5863a	! t0_kref+0x1380:   	fmul8x16	%f22, %f26, %f20
	.word	0x37800008	! t0_kref+0x1384:   	fbge,a	_kref+0x13a4
	.word	0xdd3e2000	! t0_kref+0x1388:   	std	%f14, [%i0]
	.word	0xd650a008	! t0_kref+0x138c:   	ldsh	[%g2 + 8], %o3
	.word	0xafa000ac	! t0_kref+0x1390:   	fnegs	%f12, %f23
	.word	0x9fa488bd	! t0_kref+0x1394:   	fsubs	%f18, %f29, %f15
	.word	0x1924a8c7	! t0_kref+0x1398:   	sethi	%hi(0x92a31c00), %o4
	.word	0xd42e4000	! t0_kref+0x139c:   	stb	%o2, [%i1]
	.word	0xea064000	! t0_kref+0x13a0:   	ld	[%i1], %l5
	.word	0x291678c1	! t0_kref+0x13a4:   	sethi	%hi(0x59e30400), %l4
	.word	0x27800006	! t0_kref+0x13a8:   	fbul,a	_kref+0x13c0
	.word	0x98adc00b	! t0_kref+0x13ac:   	andncc	%l7, %o3, %o4
	.word	0xecee501a	! t0_kref+0x13b0:   	ldstuba	[%i1 + %i2]0x80, %l6
	.word	0xa7b68175	! t0_kref+0x13b4:   	edge32ln	%i2, %l5, %l3
	.word	0xb1b78e5c	! t0_kref+0x13b8:   	fxnor	%f30, %f28, %f24
	.word	0xb5a0193a	! t0_kref+0x13bc:   	fstod	%f26, %f26
	.word	0x9f12c00d	! t0_kref+0x13c0:   	taddcctv	%o3, %o5, %o7
	.word	0xd00e401a	! t0_kref+0x13c4:   	ldub	[%i1 + %i2], %o0
	.word	0xa1b00ced	! t0_kref+0x13c8:   	fnot2s	%f13, %f16
	.word	0xa1a0055e	! t0_kref+0x13cc:   	fsqrtd	%f30, %f16
	.word	0xe410a030	! t0_kref+0x13d0:   	lduh	[%g2 + 0x30], %l2
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xa42a000b	! t0_kref+0x13dc:   	andn	%o0, %o3, %l2
1:	.word	0xa7a01a3c	! t0_kref+0x13e0:   	fstoi	%f28, %f19
	.word	0x96bb35f4	! t0_kref+0x13e4:   	xnorcc	%o4, -0xa0c, %o3
	.word	0xd020a02c	! t0_kref+0x13e8:   	st	%o0, [%g2 + 0x2c]
	.word	0xb1b6867c	! t0_kref+0x13ec:   	fmul8x16au	%f26, %f28, %f24
	.word	0xa91af151	! t0_kref+0x13f0:   	tsubcctv	%o3, -0xeaf, %l4
	.word	0x11180ccd	! t0_kref+0x13f4:   	sethi	%hi(0x60333400), %o0
	.word	0x91326018	! t0_kref+0x13f8:   	srl	%o1, 0x18, %o0
	.word	0xe4480018	! t0_kref+0x13fc:   	ldsb	[%g0 + %i0], %l2
	.word	0xd848a038	! t0_kref+0x1400:   	ldsb	[%g2 + 0x38], %o4
	.word	0xc02e6010	! t0_kref+0x1404:   	clrb	[%i1 + 0x10]
	.word	0xea40a004	! t0_kref+0x1408:   	ldsw	[%g2 + 4], %l5
	.word	0xd2270018	! t0_kref+0x140c:   	st	%o1, [%i4 + %i0]
	.word	0xdd263ff8	! t0_kref+0x1410:   	st	%f14, [%i0 - 8]
	.word	0xbbb007ae	! t0_kref+0x1414:   	fpackfix	%f14, %f29
	.word	0xa6f2c00c	! t0_kref+0x1418:   	udivcc	%o3, %o4, %l3
	.word	0xd9be2010	! t0_kref+0x141c:   	stda	%f12, [%i0 + 0x10]%asi
	.word	0xac22afc5	! t0_kref+0x1420:   	sub	%o2, 0xfc5, %l6
	.word	0xda50a01a	! t0_kref+0x1424:   	ldsh	[%g2 + 0x1a], %o5
	.word	0x3a480004	! t0_kref+0x1428:   	bcc,a,pt	%icc, _kref+0x1438
	.word	0x81de3942	! t0_kref+0x142c:   	flush	%i0 - 0x6be
	.word	0xbda00139	! t0_kref+0x1430:   	fabss	%f25, %f30
	.word	0xa865c00a	! t0_kref+0x1434:   	subc	%l7, %o2, %l4
	.word	0xd230a000	! t0_kref+0x1438:   	sth	%o1, [%g2]
	.word	0xd0564000	! t0_kref+0x143c:   	ldsh	[%i1], %o0
	.word	0x3b800005	! t0_kref+0x1440:   	fble,a	_kref+0x1454
	.word	0x9a0dc00c	! t0_kref+0x1444:   	and	%l7, %o4, %o5
	.word	0xec20a030	! t0_kref+0x1448:   	st	%l6, [%g2 + 0x30]
	.word	0xa8db6bf9	! t0_kref+0x144c:   	smulcc	%o5, 0xbf9, %l4
	.word	0x9da01931	! t0_kref+0x1450:   	fstod	%f17, %f14
	.word	0xbda000cc	! t0_kref+0x1454:   	fnegd	%f12, %f30
	.word	0xf13e001d	! t0_kref+0x1458:   	std	%f24, [%i0 + %i5]
	.word	0xc807bfe8	! t0_kref+0x145c:   	ld	[%fp - 0x18], %g4
	.word	0x9fc00004	! t0_kref+0x1460:   	call	%g0 + %g4
	.word	0x9af24000	! t0_kref+0x1464:   	udivcc	%o1, %g0, %o5
	.word	0xadb7463a	! t0_kref+0x1468:   	fmul8x16	%f29, %f26, %f22
	.word	0x81ad8a39	! t0_kref+0x146c:   	fcmps	%fcc0, %f22, %f25
	call	SYM(t0_subr2)
	.word	0xe83e4000	! t0_kref+0x1474:   	std	%l4, [%i1]
	.word	0xb9a01a33	! t0_kref+0x1478:   	fstoi	%f19, %f28
	.word	0xa4f5e6c8	! t0_kref+0x147c:   	udivcc	%l7, 0x6c8, %l2
	.word	0xc0200019	! t0_kref+0x1480:   	clr	[%g0 + %i1]
	.word	0x81df0000	! t0_kref+0x1484:   	flush	%i4
	.word	0x80f30000	! t0_kref+0x1488:   	udivcc	%o4, %g0, %g0
	.word	0xd8200018	! t0_kref+0x148c:   	st	%o4, [%g0 + %i0]
	.word	0xb9a78838	! t0_kref+0x1490:   	fadds	%f30, %f24, %f28
	.word	0x22800006	! t0_kref+0x1494:   	be,a	_kref+0x14ac
	.word	0xc0df5018	! t0_kref+0x1498:   	ldxa	[%i5 + %i0]0x80, %g0
	.word	0xc96e400d	! t0_kref+0x149c:   	prefetch	%i1 + %o5, 4
	.word	0x9922000b	! t0_kref+0x14a0:   	mulscc	%o0, %o3, %o4
	.word	0xd04e2014	! t0_kref+0x14a4:   	ldsb	[%i0 + 0x14], %o0
	.word	0xda30a01a	! t0_kref+0x14a8:   	sth	%o5, [%g2 + 0x1a]
	.word	0xa69d7187	! t0_kref+0x14ac:   	xorcc	%l5, -0xe79, %l3
	.word	0x952da01d	! t0_kref+0x14b0:   	sll	%l6, 0x1d, %o2
	.word	0x22800003	! t0_kref+0x14b4:   	be,a	_kref+0x14c0
	.word	0xa5b58d2d	! t0_kref+0x14b8:   	fandnot1s	%f22, %f13, %f18
	.word	0xf428a000	! t0_kref+0x14bc:   	stb	%i2, [%g2]
	.word	0xa1a0053a	! t0_kref+0x14c0:   	fsqrts	%f26, %f16
	.word	0x805563e6	! t0_kref+0x14c4:   	umul	%l5, 0x3e6, %g0
	.word	0xda7e6008	! t0_kref+0x14c8:   	swap	[%i1 + 8], %o5
	.word	0x9fb5812c	! t0_kref+0x14cc:   	edge32n	%l6, %o4, %o7
	.word	0xe168a048	! t0_kref+0x14d0:   	prefetch	%g2 + 0x48, 16
	.word	0x81ae8a3d	! t0_kref+0x14d4:   	fcmps	%fcc0, %f26, %f29
	.word	0xa4e58015	! t0_kref+0x14d8:   	subccc	%l6, %l5, %l2
	.word	0x9da60850	! t0_kref+0x14dc:   	faddd	%f24, %f16, %f14
	.word	0xae5220eb	! t0_kref+0x14e0:   	umul	%o0, 0xeb, %l7
	.word	0xf7262014	! t0_kref+0x14e4:   	st	%f27, [%i0 + 0x14]
	.word	0x3b800007	! t0_kref+0x14e8:   	fble,a	_kref+0x1504
	.word	0xa3b48d60	! t0_kref+0x14ec:   	fnot1s	%f18, %f17
	.word	0x902ea9e4	! t0_kref+0x14f0:   	andn	%i2, 0x9e4, %o0
	.word	0x9532e005	! t0_kref+0x14f4:   	srl	%o3, 0x5, %o2
	.word	0x25800008	! t0_kref+0x14f8:   	fblg,a	_kref+0x1518
	.word	0xc1ee100a	! t0_kref+0x14fc:   	prefetcha	%i0 + %o2, 0
	.word	0x9082f420	! t0_kref+0x1500:   	addcc	%o3, -0xbe0, %o0
	.word	0x9da01a5a	! t0_kref+0x1504:   	fdtoi	%f26, %f14
	.word	0xa69ac00b	! t0_kref+0x1508:   	xorcc	%o3, %o3, %l3
	.word	0xf96e401a	! t0_kref+0x150c:   	prefetch	%i1 + %i2, 28
	.word	0x9ef56e68	! t0_kref+0x1510:   	udivcc	%l5, 0xe68, %o7
	.word	0x9866a186	! t0_kref+0x1514:   	subc	%i2, 0x186, %o4
	.word	0x81ad8a35	! t0_kref+0x1518:   	fcmps	%fcc0, %f22, %f21
	.word	0xa685f42b	! t0_kref+0x151c:   	addcc	%l7, -0xbd5, %l3
	.word	0xb5b686cc	! t0_kref+0x1520:   	fmul8sux16	%f26, %f12, %f26
	.word	0xfd200018	! t0_kref+0x1524:   	st	%f30, [%g0 + %i0]
	.word	0x805ead75	! t0_kref+0x1528:   	smul	%i2, 0xd75, %g0
	.word	0xa5a64d2e	! t0_kref+0x152c:   	fsmuld	%f25, %f14, %f18
	.word	0xace5e5ab	! t0_kref+0x1530:   	subccc	%l7, 0x5ab, %l6
	.word	0x9fc00004	! t0_kref+0x1534:   	call	%g0 + %g4
	.word	0x809ae600	! t0_kref+0x1538:   	xorcc	%o3, 0x600, %g0
	.word	0x9a300009	! t0_kref+0x153c:   	orn	%g0, %o1, %o5
	.word	0xa3b00cf9	! t0_kref+0x1540:   	fnot2s	%f25, %f17
	.word	0xe81f4018	! t0_kref+0x1544:   	ldd	[%i5 + %i0], %l4
	.word	0x97b30280	! t0_kref+0x1548:   	array32	%o4, %g0, %o3
	.word	0xa8e57738	! t0_kref+0x154c:   	subccc	%l5, -0x8c8, %l4
	.word	0x9fc00004	! t0_kref+0x1550:   	call	%g0 + %g4
	.word	0xada00554	! t0_kref+0x1554:   	fsqrtd	%f20, %f22
	.word	0x9b32a002	! t0_kref+0x1558:   	srl	%o2, 0x2, %o5
	.word	0xb7b007be	! t0_kref+0x155c:   	fpackfix	%f30, %f27
	.word	0x9fc00004	! t0_kref+0x1560:   	call	%g0 + %g4
	.word	0xec48a01f	! t0_kref+0x1564:   	ldsb	[%g2 + 0x1f], %l6
	.word	0xd01e3fe0	! t0_kref+0x1568:   	ldd	[%i0 - 0x20], %o0
	.word	0x80724016	! t0_kref+0x156c:   	udiv	%o1, %l6, %g0
	.word	0x9fa84037	! t0_kref+0x1570:   	fmovsne	%fcc0, %f23, %f15
	.word	0xe44e4000	! t0_kref+0x1574:   	ldsb	[%i1], %l2
	.word	0xbbb00c20	! t0_kref+0x1578:   	fzeros	%f29
	.word	0x8143e040	! t0_kref+0x157c:   	membar	0x40
	.word	0x99a01a4c	! t0_kref+0x1580:   	fdtoi	%f12, %f12
	.word	0x94dd6ff6	! t0_kref+0x1584:   	smulcc	%l5, 0xff6, %o2
	.word	0x9f32e01c	! t0_kref+0x1588:   	srl	%o3, 0x1c, %o7
	.word	0xc028a014	! t0_kref+0x158c:   	clrb	[%g2 + 0x14]
	.word	0x81ae4a36	! t0_kref+0x1590:   	fcmps	%fcc0, %f25, %f22
	.word	0x81ae0a52	! t0_kref+0x1594:   	fcmpd	%fcc0, %f24, %f18
	.word	0x81ae8a3a	! t0_kref+0x1598:   	fcmps	%fcc0, %f26, %f26
	.word	0xc0280018	! t0_kref+0x159c:   	clrb	[%g0 + %i0]
	.word	0xf11e401d	! t0_kref+0x15a0:   	ldd	[%i1 + %i5], %f24
	.word	0xd900a02c	! t0_kref+0x15a4:   	ld	[%g2 + 0x2c], %f12
	.word	0x81abca2e	! t0_kref+0x15a8:   	fcmps	%fcc0, %f15, %f14
	.word	0x9ada6956	! t0_kref+0x15ac:   	smulcc	%o1, 0x956, %o5
	.word	0xea00a03c	! t0_kref+0x15b0:   	ld	[%g2 + 0x3c], %l5
	.word	0x8143e040	! t0_kref+0x15b4:   	membar	0x40
	.word	0x3b480002	! t0_kref+0x15b8:   	fble,a,pt	%fcc0, _kref+0x15c0
	.word	0xea06401c	! t0_kref+0x15bc:   	ld	[%i1 + %i4], %l5
	.word	0xfb6e7fe0	! t0_kref+0x15c0:   	prefetch	%i1 - 0x20, 29
	.word	0x86102016	! t0_kref+0x15c4:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x15c8:   	subcc	%g3, 1, %g3
	.word	0x2280001e	! t0_kref+0x15cc:   	be,a	_kref+0x1644
	.word	0xa6f00016	! t0_kref+0x15d0:   	udivcc	%g0, %l6, %l3
	.word	0xaba38832	! t0_kref+0x15d4:   	fadds	%f14, %f18, %f21
	.word	0xa1a00550	! t0_kref+0x15d8:   	fsqrtd	%f16, %f16
	.word	0xe83f4018	! t0_kref+0x15dc:   	std	%l4, [%i5 + %i0]
	.word	0xb5a01917	! t0_kref+0x15e0:   	fitod	%f23, %f26
	.word	0xc05e7fe8	! t0_kref+0x15e4:   	ldx	[%i1 - 0x18], %g0
	.word	0xfd270018	! t0_kref+0x15e8:   	st	%f30, [%i4 + %i0]
	.word	0x99a01031	! t0_kref+0x15ec:   	fstox	%f17, %f12
	.word	0xee28a018	! t0_kref+0x15f0:   	stb	%l7, [%g2 + 0x18]
	.word	0xb5b00fe0	! t0_kref+0x15f4:   	fones	%f26
	.word	0x9460000c	! t0_kref+0x15f8:   	subc	%g0, %o4, %o2
	.word	0xa9b6c735	! t0_kref+0x15fc:   	fmuld8ulx16	%f27, %f21, %f20
	.word	0xa1a01056	! t0_kref+0x1600:   	fdtox	%f22, %f16
	.word	0xa9a01a52	! t0_kref+0x1604:   	fdtoi	%f18, %f20
	.word	0xe6062010	! t0_kref+0x1608:   	ld	[%i0 + 0x10], %l3
	.word	0x9db506ec	! t0_kref+0x160c:   	fmul8ulx16	%f20, %f12, %f14
	.word	0xd900a018	! t0_kref+0x1610:   	ld	[%g2 + 0x18], %f12
	.word	0x9445a35e	! t0_kref+0x1614:   	addc	%l6, 0x35e, %o2
	.word	0x90223d5b	! t0_kref+0x1618:   	sub	%o0, -0x2a5, %o0
	.word	0x81ae0a35	! t0_kref+0x161c:   	fcmps	%fcc0, %f24, %f21
	.word	0xc56e7fe0	! t0_kref+0x1620:   	prefetch	%i1 - 0x20, 2
	.word	0xb9b44972	! t0_kref+0x1624:   	fpmerge	%f17, %f18, %f28
	.word	0xd868a026	! t0_kref+0x1628:   	ldstub	[%g2 + 0x26], %o4
	.word	0x92d37a8c	! t0_kref+0x162c:   	umulcc	%o5, -0x574, %o1
	.word	0xeb68a043	! t0_kref+0x1630:   	prefetch	%g2 + 0x43, 21
	.word	0x9263363d	! t0_kref+0x1634:   	subc	%o4, -0x9c3, %o1
	.word	0xe19f1a18	! t0_kref+0x1638:   	ldda	[%i4 + %i0]0xd0, %f16
	.word	0x3d800001	! t0_kref+0x163c:   	fbule,a	_kref+0x1640
	.word	0xd4263ff0	! t0_kref+0x1640:   	st	%o2, [%i0 - 0x10]
	.word	0xb1b00cd6	! t0_kref+0x1644:   	fnot2	%f22, %f24
	.word	0xb9b38a96	! t0_kref+0x1648:   	fpsub16	%f14, %f22, %f28
	.word	0x3a800003	! t0_kref+0x164c:   	bcc,a	_kref+0x1658
	.word	0xada01896	! t0_kref+0x1650:   	fitos	%f22, %f22
	.word	0xd02e001a	! t0_kref+0x1654:   	stb	%o0, [%i0 + %i2]
	.word	0xe64e4000	! t0_kref+0x1658:   	ldsb	[%i1], %l3
	.word	0x9323747e	! t0_kref+0x165c:   	mulscc	%o5, -0xb82, %o1
	.word	0xb1b5466e	! t0_kref+0x1660:   	fmul8x16au	%f21, %f14, %f24
	.word	0xacfa0015	! t0_kref+0x1664:   	sdivcc	%o0, %l5, %l6
	.word	0xda50a02e	! t0_kref+0x1668:   	ldsh	[%g2 + 0x2e], %o5
	.word	0x95b2801a	! t0_kref+0x166c:   	edge8	%o2, %i2, %o2
	.word	0xf4a65000	! t0_kref+0x1670:   	sta	%i2, [%i1]0x80
	.word	0xdda01019	! t0_kref+0x1674:   	sta	%f14, [%g0 + %i1]0x80
	.word	0xa45a4008	! t0_kref+0x1678:   	smul	%o1, %o0, %l2
	.word	0x81830000	! t0_kref+0x167c:   	wr	%o4, %g0, %y
	.word	0x30480007	! t0_kref+0x1680:   	ba,a,pt	%icc, _kref+0x169c
	.word	0xadb00cce	! t0_kref+0x1684:   	fnot2	%f14, %f22
	.word	0x29037bf6	! t0_kref+0x1688:   	sethi	%hi(0xdefd800), %l4
	.word	0xa5b384d2	! t0_kref+0x168c:   	fcmpne32	%f14, %f18, %l2
	.word	0x9af5c00a	! t0_kref+0x1690:   	udivcc	%l7, %o2, %o5
	.word	0x81af0a34	! t0_kref+0x1694:   	fcmps	%fcc0, %f28, %f20
	.word	0xa5b70ed2	! t0_kref+0x1698:   	fornot2	%f28, %f18, %f18
	.word	0x9db74ea0	! t0_kref+0x169c:   	fsrc1s	%f29, %f14
	.word	0x98b33407	! t0_kref+0x16a0:   	orncc	%o4, -0xbf9, %o4
	.word	0xda28a012	! t0_kref+0x16a4:   	stb	%o5, [%g2 + 0x12]
	.word	0x90f2a9c2	! t0_kref+0x16a8:   	udivcc	%o2, 0x9c2, %o0
	.word	0xc04e401a	! t0_kref+0x16ac:   	ldsb	[%i1 + %i2], %g0
	.word	0xa5228000	! t0_kref+0x16b0:   	mulscc	%o2, %g0, %l2
	.word	0xd91e401d	! t0_kref+0x16b4:   	ldd	[%i1 + %i5], %f12
	.word	0x98e6a7e5	! t0_kref+0x16b8:   	subccc	%i2, 0x7e5, %o4
	.word	0xadb68d40	! t0_kref+0x16bc:   	fnot1	%f26, %f22
	.word	0xfb00a024	! t0_kref+0x16c0:   	ld	[%g2 + 0x24], %f29
	.word	0xa82e800a	! t0_kref+0x16c4:   	andn	%i2, %o2, %l4
	.word	0xaba018ce	! t0_kref+0x16c8:   	fdtos	%f14, %f21
	.word	0x92db4016	! t0_kref+0x16cc:   	smulcc	%o5, %l6, %o1
	.word	0x8143c000	! t0_kref+0x16d0:   	stbar
	.word	0x9db007b0	! t0_kref+0x16d4:   	fpackfix	%f16, %f14
	.word	0xeb062014	! t0_kref+0x16d8:   	ld	[%i0 + 0x14], %f21
	.word	0xf4300018	! t0_kref+0x16dc:   	sth	%i2, [%g0 + %i0]
	.word	0x81ad8a37	! t0_kref+0x16e0:   	fcmps	%fcc0, %f22, %f23
	.word	0x9bb34cbc	! t0_kref+0x16e4:   	fandnot2s	%f13, %f28, %f13
	.word	0xa642b6b5	! t0_kref+0x16e8:   	addc	%o2, -0x94b, %l3
	.word	0xb9a01a58	! t0_kref+0x16ec:   	fdtoi	%f24, %f28
	.word	0x91256798	! t0_kref+0x16f0:   	mulscc	%l5, 0x798, %o0
	.word	0xa9b3859c	! t0_kref+0x16f4:   	fcmpgt32	%f14, %f28, %l4
	.word	0x98183b7e	! t0_kref+0x16f8:   	xor	%g0, -0x482, %o4
	.word	0xd8180019	! t0_kref+0x16fc:   	ldd	[%g0 + %i1], %o4
	.word	0xbda608b0	! t0_kref+0x1700:   	fsubs	%f24, %f16, %f30
	.word	0xe41e6000	! t0_kref+0x1704:   	ldd	[%i1], %l2
	.word	0x273caf62	! t0_kref+0x1708:   	sethi	%hi(0xf2bd8800), %l3
	.word	0x99a0055e	! t0_kref+0x170c:   	fsqrtd	%f30, %f12
	.word	0xd01e3ff8	! t0_kref+0x1710:   	ldd	[%i0 - 8], %o0
	.word	0xc028a03b	! t0_kref+0x1714:   	clrb	[%g2 + 0x3b]
	call	SYM(t0_subr0)
	.word	0x81580000	! t0_kref+0x171c:   	flushw
	.word	0x81834000	! t0_kref+0x1720:   	wr	%o5, %g0, %y
	.word	0x3c480001	! t0_kref+0x1724:   	bpos,a,pt	%icc, _kref+0x1728
	.word	0xb7a00134	! t0_kref+0x1728:   	fabss	%f20, %f27
	.word	0x9ab2c009	! t0_kref+0x172c:   	orncc	%o3, %o1, %o5
	.word	0x9de3bfa0	! t0_kref+0x1730:   	save	%sp, -0x60, %sp
	.word	0xb6a63446	! t0_kref+0x1734:   	subcc	%i0, -0xbba, %i3
	.word	0xa7eec018	! t0_kref+0x1738:   	restore	%i3, %i0, %l3
	.word	0xda562008	! t0_kref+0x173c:   	ldsh	[%i0 + 8], %o5
	.word	0x9a2a0000	! t0_kref+0x1740:   	andn	%o0, %g0, %o5
	call	SYM(t0_subr2)
	.word	0xf4367ff4	! t0_kref+0x1748:   	sth	%i2, [%i1 - 0xc]
	.word	0xa7b68e3b	! t0_kref+0x174c:   	fands	%f26, %f27, %f19
	.word	0x90a2c016	! t0_kref+0x1750:   	subcc	%o3, %l6, %o0
	.word	0xdb062010	! t0_kref+0x1754:   	ld	[%i0 + 0x10], %f13
	.word	0xa7a01a58	! t0_kref+0x1758:   	fdtoi	%f24, %f19
	.word	0xae568009	! t0_kref+0x175c:   	umul	%i2, %o1, %l7
	.word	0x92aa401a	! t0_kref+0x1760:   	andncc	%o1, %i2, %o1
	.word	0x9da34938	! t0_kref+0x1764:   	fmuls	%f13, %f24, %f14
	.word	0xecbe1000	! t0_kref+0x1768:   	stda	%l6, [%i0]0x80
	.word	0x8116a521	! t0_kref+0x176c:   	taddcctv	%i2, 0x521, %g0
	.word	0x9de3bfa0	! t0_kref+0x1770:   	save	%sp, -0x60, %sp
	.word	0xb2268019	! t0_kref+0x1774:   	sub	%i2, %i1, %i1
	.word	0x91eef7d6	! t0_kref+0x1778:   	restore	%i3, -0x82a, %o0
	.word	0xc3ee1015	! t0_kref+0x177c:   	prefetcha	%i0 + %l5, 1
	.word	0x96182a45	! t0_kref+0x1780:   	xor	%g0, 0xa45, %o3
	.word	0xd036401b	! t0_kref+0x1784:   	sth	%o0, [%i1 + %i3]
	.word	0xa5a018da	! t0_kref+0x1788:   	fdtos	%f26, %f18
	.word	0xdb264000	! t0_kref+0x178c:   	st	%f13, [%i1]
	call	SYM(t0_subr0)
	.word	0xa01ab029	! t0_kref+0x1794:   	xor	%o2, -0xfd7, %l0
	.word	0xd8460000	! t0_kref+0x1798:   	ldsw	[%i0], %o4
	.word	0xee270019	! t0_kref+0x179c:   	st	%l7, [%i4 + %i1]
	.word	0xde00a004	! t0_kref+0x17a0:   	ld	[%g2 + 4], %o7
	.word	0xf11e001d	! t0_kref+0x17a4:   	ldd	[%i0 + %i5], %f24
	.word	0xd07e6014	! t0_kref+0x17a8:   	swap	[%i1 + 0x14], %o0
	.word	0xa3a00533	! t0_kref+0x17ac:   	fsqrts	%f19, %f17
	.word	0xde10a00a	! t0_kref+0x17b0:   	lduh	[%g2 + 0xa], %o7
	.word	0x9da000b0	! t0_kref+0x17b4:   	fnegs	%f16, %f14
	.word	0x9fa000b6	! t0_kref+0x17b8:   	fnegs	%f22, %f15
	.word	0xb5a388d8	! t0_kref+0x17bc:   	fsubd	%f14, %f24, %f26
	.word	0xe9180019	! t0_kref+0x17c0:   	ldd	[%g0 + %i1], %f20
	.word	0xa7a788b9	! t0_kref+0x17c4:   	fsubs	%f30, %f25, %f19
	.word	0xb5b60c8c	! t0_kref+0x17c8:   	fandnot2	%f24, %f12, %f26
	.word	0x97b20200	! t0_kref+0x17cc:   	array8	%o0, %g0, %o3
	.word	0xb9a01a56	! t0_kref+0x17d0:   	fdtoi	%f22, %f28
	.word	0xbda0055e	! t0_kref+0x17d4:   	fsqrtd	%f30, %f30
	.word	0xaa282fe2	! t0_kref+0x17d8:   	andn	%g0, 0xfe2, %l5
	.word	0xd67e6008	! t0_kref+0x17dc:   	swap	[%i1 + 8], %o3
	.word	0xae868015	! t0_kref+0x17e0:   	addcc	%i2, %l5, %l7
	.word	0xeea6501c	! t0_kref+0x17e4:   	sta	%l7, [%i1 + %i4]0x80
	.word	0x9db30d40	! t0_kref+0x17e8:   	fnot1	%f12, %f14
	.word	0x81af0a58	! t0_kref+0x17ec:   	fcmpd	%fcc0, %f28, %f24
	.word	0x97b68148	! t0_kref+0x17f0:   	edge32l	%i2, %o0, %o3
	.word	0x9276af3b	! t0_kref+0x17f4:   	udiv	%i2, 0xf3b, %o1
	.word	0xb9a00558	! t0_kref+0x17f8:   	fsqrtd	%f24, %f28
	.word	0x8143e040	! t0_kref+0x17fc:   	membar	0x40
	.word	0xa465f2af	! t0_kref+0x1800:   	subc	%l7, -0xd51, %l2
	.word	0xe920a00c	! t0_kref+0x1804:   	st	%f20, [%g2 + 0xc]
	.word	0xc36e6008	! t0_kref+0x1808:   	prefetch	%i1 + 8, 1
	call	SYM(t0_subr1)
	.word	0xe0063ff4	! t0_kref+0x1810:   	ld	[%i0 - 0xc], %l0
	.word	0x9de3bfa0	! t0_kref+0x1814:   	save	%sp, -0x60, %sp
	.word	0xabee001d	! t0_kref+0x1818:   	restore	%i0, %i5, %l5
	.word	0x9e5e8008	! t0_kref+0x181c:   	smul	%i2, %o0, %o7
	.word	0xb9b64710	! t0_kref+0x1820:   	fmuld8sux16	%f25, %f16, %f28
	.word	0xb5b58c94	! t0_kref+0x1824:   	fandnot2	%f22, %f20, %f26
	.word	0xeca01019	! t0_kref+0x1828:   	sta	%l6, [%g0 + %i1]0x80
	.word	0xff6e7ff0	! t0_kref+0x182c:   	prefetch	%i1 - 0x10, 31
	.word	0xac82c01a	! t0_kref+0x1830:   	addcc	%o3, %i2, %l6
	.word	0xde00a02c	! t0_kref+0x1834:   	ld	[%g2 + 0x2c], %o7
	.word	0x96ab401a	! t0_kref+0x1838:   	andncc	%o5, %i2, %o3
	call	SYM(t0_subr0)
	.word	0xefee101d	! t0_kref+0x1840:   	prefetcha	%i0 + %i5, 23
	.word	0x99b5c0da	! t0_kref+0x1844:   	edge16l	%l7, %i2, %o4
	.word	0xaad6b18c	! t0_kref+0x1848:   	umulcc	%i2, -0xe74, %l5
	.word	0x90254015	! t0_kref+0x184c:   	sub	%l5, %l5, %o0
	.word	0xa6f57b91	! t0_kref+0x1850:   	udivcc	%l5, -0x46f, %l3
	.word	0xd42e600f	! t0_kref+0x1854:   	stb	%o2, [%i1 + 0xf]
	.word	0x81dfc01a	! t0_kref+0x1858:   	flush	%i7 + %i2
	.word	0xa1b4467b	! t0_kref+0x185c:   	fmul8x16au	%f17, %f27, %f16
	.word	0x191a5ffd	! t0_kref+0x1860:   	sethi	%hi(0x697ff400), %o4
	.word	0x95b5432b	! t0_kref+0x1864:   	bmask	%l5, %o3, %o2
	.word	0x31800003	! t0_kref+0x1868:   	fba,a	_kref+0x1874
	.word	0x9a65400d	! t0_kref+0x186c:   	subc	%l5, %o5, %o5
	.word	0xe8ff1018	! t0_kref+0x1870:   	swapa	[%i4 + %i0]0x80, %l4
	.word	0x34480007	! t0_kref+0x1874:   	bg,a,pt	%icc, _kref+0x1890
	.word	0xac080000	! t0_kref+0x1878:   	and	%g0, %g0, %l6
	.word	0xa7a4492c	! t0_kref+0x187c:   	fmuls	%f17, %f12, %f19
	.word	0xa1b58e4c	! t0_kref+0x1880:   	fxnor	%f22, %f12, %f16
	.word	0xe11fbe08	! t0_kref+0x1884:   	ldd	[%fp - 0x1f8], %f16
	.word	0xb1a0110e	! t0_kref+0x1888:   	fxtod	%f14, %f24
	.word	0xbdb00c20	! t0_kref+0x188c:   	fzeros	%f30
	.word	0x85834008	! t0_kref+0x1890:   	wr	%o5, %o0, %ccr
	.word	0x9332a002	! t0_kref+0x1894:   	srl	%o2, 0x2, %o1
	.word	0x9bb30e79	! t0_kref+0x1898:   	fxnors	%f12, %f25, %f13
	.word	0x99b5c01a	! t0_kref+0x189c:   	edge8	%l7, %i2, %o4
	.word	0x9de3bfa0	! t0_kref+0x18a0:   	save	%sp, -0x60, %sp
	.word	0x99ee401b	! t0_kref+0x18a4:   	restore	%i1, %i3, %o4
	.word	0x9abdc008	! t0_kref+0x18a8:   	xnorcc	%l7, %o0, %o5
	.word	0x900a8016	! t0_kref+0x18ac:   	and	%o2, %l6, %o0
	.word	0xaf2a400c	! t0_kref+0x18b0:   	sll	%o1, %o4, %l7
	.word	0x962b2d36	! t0_kref+0x18b4:   	andn	%o4, 0xd36, %o3
	.word	0x2a800005	! t0_kref+0x18b8:   	bcs,a	_kref+0x18cc
	.word	0xa5b30a50	! t0_kref+0x18bc:   	fpadd32	%f12, %f16, %f18
	.word	0xf99f1a59	! t0_kref+0x18c0:   	ldda	[%i4 + %i1]0xd2, %f28
	.word	0xa1a00550	! t0_kref+0x18c4:   	fsqrtd	%f16, %f16
	.word	0xb9a709d4	! t0_kref+0x18c8:   	fdivd	%f28, %f20, %f28
	.word	0x900b0009	! t0_kref+0x18cc:   	and	%o4, %o1, %o0
	.word	0x2f800001	! t0_kref+0x18d0:   	fbu,a	_kref+0x18d4
	.word	0xa40ae97a	! t0_kref+0x18d4:   	and	%o3, 0x97a, %l2
	.word	0xec20a024	! t0_kref+0x18d8:   	st	%l6, [%g2 + 0x24]
	.word	0xb9a01938	! t0_kref+0x18dc:   	fstod	%f24, %f28
	.word	0xada000b5	! t0_kref+0x18e0:   	fnegs	%f21, %f22
	.word	0xc0f65000	! t0_kref+0x18e4:   	stxa	%g0, [%i1]0x80
	.word	0x9b33200f	! t0_kref+0x18e8:   	srl	%o4, 0xf, %o5
	.word	0x80dac01a	! t0_kref+0x18ec:   	smulcc	%o3, %i2, %g0
	.word	0x94bd6d47	! t0_kref+0x18f0:   	xnorcc	%l5, 0xd47, %o2
	.word	0xa9a409d8	! t0_kref+0x18f4:   	fdivd	%f16, %f24, %f20
	.word	0x2e800001	! t0_kref+0x18f8:   	bvs,a	_kref+0x18fc
	.word	0xe300a02c	! t0_kref+0x18fc:   	ld	[%g2 + 0x2c], %f17
	.word	0x9de3bfa0	! t0_kref+0x1900:   	save	%sp, -0x60, %sp
	.word	0xb026c019	! t0_kref+0x1904:   	sub	%i3, %i1, %i0
	.word	0x91ee4019	! t0_kref+0x1908:   	restore	%i1, %i1, %o0
	.word	0xec00a018	! t0_kref+0x190c:   	ld	[%g2 + 0x18], %l6
	.word	0xbbb00cf0	! t0_kref+0x1910:   	fnot2s	%f16, %f29
	.word	0xee0e4000	! t0_kref+0x1914:   	ldub	[%i1], %l7
	.word	0xf91e0000	! t0_kref+0x1918:   	ldd	[%i0], %f28
	.word	0xfd063fe4	! t0_kref+0x191c:   	ld	[%i0 - 0x1c], %f30
	.word	0xa7b44a6e	! t0_kref+0x1920:   	fpadd32s	%f17, %f14, %f19
	.word	0xa3a01a2f	! t0_kref+0x1924:   	fstoi	%f15, %f17
	.word	0xa482fcdf	! t0_kref+0x1928:   	addcc	%o3, -0x321, %l2
	.word	0xb1a78833	! t0_kref+0x192c:   	fadds	%f30, %f19, %f24
	.word	0x94d34016	! t0_kref+0x1930:   	umulcc	%o5, %l6, %o2
	.word	0xad400000	! t0_kref+0x1934:   	mov	%y, %l6
	.word	0x99b4c6b8	! t0_kref+0x1938:   	fmul8x16al	%f19, %f24, %f12
	.word	0xb5a000d0	! t0_kref+0x193c:   	fnegd	%f16, %f26
	.word	0x81ad8a34	! t0_kref+0x1940:   	fcmps	%fcc0, %f22, %f20
	.word	0x8143c000	! t0_kref+0x1944:   	stbar
	.word	0x9666b3f7	! t0_kref+0x1948:   	subc	%i2, -0xc09, %o3
	.word	0xc028a03a	! t0_kref+0x194c:   	clrb	[%g2 + 0x3a]
	.word	0x9fc00004	! t0_kref+0x1950:   	call	%g0 + %g4
	.word	0xbbb64ef1	! t0_kref+0x1954:   	fornot2s	%f25, %f17, %f29
	.word	0xb5a6084e	! t0_kref+0x1958:   	faddd	%f24, %f14, %f26
	.word	0x25480008	! t0_kref+0x195c:   	fblg,a,pt	%fcc0, _kref+0x197c
	.word	0xc020a014	! t0_kref+0x1960:   	clr	[%g2 + 0x14]
	.word	0x80b34015	! t0_kref+0x1964:   	orncc	%o5, %l5, %g0
	.word	0xd6567ff4	! t0_kref+0x1968:   	ldsh	[%i1 - 0xc], %o3
	.word	0xd668a031	! t0_kref+0x196c:   	ldstub	[%g2 + 0x31], %o3
	.word	0xe7270018	! t0_kref+0x1970:   	st	%f19, [%i4 + %i0]
	.word	0xe4070019	! t0_kref+0x1974:   	ld	[%i4 + %i1], %l2
	.word	0x99b30ada	! t0_kref+0x1978:   	fpsub32	%f12, %f26, %f12
	.word	0xaba018d6	! t0_kref+0x197c:   	fdtos	%f22, %f21
	.word	0xaaf24009	! t0_kref+0x1980:   	udivcc	%o1, %o1, %l5
	.word	0x3a480003	! t0_kref+0x1984:   	bcc,a,pt	%icc, _kref+0x1990
	.word	0xea28a003	! t0_kref+0x1988:   	stb	%l5, [%g2 + 3]
	.word	0xb7a3492e	! t0_kref+0x198c:   	fmuls	%f13, %f14, %f27
	.word	0xea200018	! t0_kref+0x1990:   	st	%l5, [%g0 + %i0]
	.word	0x90657990	! t0_kref+0x1994:   	subc	%l5, -0x670, %o0
	.word	0x9f414000	! t0_kref+0x1998:   	mov	%pc, %o7
	.word	0xadb6c6be	! t0_kref+0x199c:   	fmul8x16al	%f27, %f30, %f22
	.word	0xb5a01a52	! t0_kref+0x19a0:   	fdtoi	%f18, %f26
	.word	0x3f480008	! t0_kref+0x19a4:   	fbo,a,pt	%fcc0, _kref+0x19c4
	.word	0xd430a008	! t0_kref+0x19a8:   	sth	%o2, [%g2 + 8]
	.word	0x9db48916	! t0_kref+0x19ac:   	faligndata	%f18, %f22, %f14
	.word	0x81ae4a3d	! t0_kref+0x19b0:   	fcmps	%fcc0, %f25, %f29
	.word	0xed68a045	! t0_kref+0x19b4:   	prefetch	%g2 + 0x45, 22
	.word	0x9db6ccb3	! t0_kref+0x19b8:   	fandnot2s	%f27, %f19, %f14
	.word	0x9db00f1e	! t0_kref+0x19bc:   	fsrc2	%f30, %f14
	.word	0xb9b00ccc	! t0_kref+0x19c0:   	fnot2	%f12, %f28
	.word	0x901264ac	! t0_kref+0x19c4:   	or	%o1, 0x4ac, %o0
	.word	0x2e800003	! t0_kref+0x19c8:   	bvs,a	_kref+0x19d4
	.word	0x92b2801a	! t0_kref+0x19cc:   	orncc	%o2, %i2, %o1
	.word	0xea28a007	! t0_kref+0x19d0:   	stb	%l5, [%g2 + 7]
	.word	0xec30a026	! t0_kref+0x19d4:   	sth	%l6, [%g2 + 0x26]
	.word	0xee20a028	! t0_kref+0x19d8:   	st	%l7, [%g2 + 0x28]
	.word	0xee7e0000	! t0_kref+0x19dc:   	swap	[%i0], %l7
	.word	0x29800003	! t0_kref+0x19e0:   	fbl,a	_kref+0x19ec
	.word	0x9da01931	! t0_kref+0x19e4:   	fstod	%f17, %f14
	.word	0xafa01a5c	! t0_kref+0x19e8:   	fdtoi	%f28, %f23
	.word	0xc768a006	! t0_kref+0x19ec:   	prefetch	%g2 + 6, 3
	.word	0x8052400a	! t0_kref+0x19f0:   	umul	%o1, %o2, %g0
	.word	0x99b68eda	! t0_kref+0x19f4:   	fornot2	%f26, %f26, %f12
	.word	0xb1a01914	! t0_kref+0x19f8:   	fitod	%f20, %f24
	.word	0x31800006	! t0_kref+0x19fc:   	fba,a	_kref+0x1a14
	.word	0xa736800b	! t0_kref+0x1a00:   	srl	%i2, %o3, %l3
	.word	0xe4216d30	! t0_kref+0x1a04:   	st	%l2, [%g5 + 0xd30]
	.word	0xa72565bf	! t0_kref+0x1a08:   	mulscc	%l5, 0x5bf, %l3
	.word	0xa51b3286	! t0_kref+0x1a0c:   	tsubcctv	%o4, -0xd7a, %l2
	.word	0x91b300b5	! t0_kref+0x1a10:   	edge16n	%o4, %l5, %o0
	.word	0xd800a030	! t0_kref+0x1a14:   	ld	[%g2 + 0x30], %o4
	.word	0xf879401c	! t0_kref+0x1a18:   	swap	[%g5 + %i4], %i4
	.word	0xa5b60c90	! t0_kref+0x1a1c:   	fandnot2	%f24, %f16, %f18
	.word	0x9073000b	! t0_kref+0x1a20:   	udiv	%o4, %o3, %o0
	.word	0xa41dbbc0	! t0_kref+0x1a24:   	xor	%l6, -0x440, %l2
	.word	0xed1fbec0	! t0_kref+0x1a28:   	ldd	[%fp - 0x140], %f22
	.word	0xaca80016	! t0_kref+0x1a2c:   	andncc	%g0, %l6, %l6
	.word	0xe648a00a	! t0_kref+0x1a30:   	ldsb	[%g2 + 0xa], %l3
	.word	0x81ab8a58	! t0_kref+0x1a34:   	fcmpd	%fcc0, %f14, %f24
	.word	0xbda0055c	! t0_kref+0x1a38:   	fsqrtd	%f28, %f30
	.word	0x9b400000	! t0_kref+0x1a3c:   	mov	%y, %o5
	.word	0xa1b68737	! t0_kref+0x1a40:   	fmuld8ulx16	%f26, %f23, %f16
	.word	0x81acca3a	! t0_kref+0x1a44:   	fcmps	%fcc0, %f19, %f26
	.word	0xe11e7fe0	! t0_kref+0x1a48:   	ldd	[%i1 - 0x20], %f16
	.word	0x80d37337	! t0_kref+0x1a4c:   	umulcc	%o5, -0xcc9, %g0
	.word	0xb7a74836	! t0_kref+0x1a50:   	fadds	%f29, %f22, %f27
	.word	0xd84e6015	! t0_kref+0x1a54:   	ldsb	[%i1 + 0x15], %o4
	.word	0x81ad4a3e	! t0_kref+0x1a58:   	fcmps	%fcc0, %f21, %f30
	.word	0x3e480004	! t0_kref+0x1a5c:   	bvc,a,pt	%icc, _kref+0x1a6c
	.word	0xabb58175	! t0_kref+0x1a60:   	edge32ln	%l6, %l5, %l5
	.word	0xa45a4009	! t0_kref+0x1a64:   	smul	%o1, %o1, %l2
	.word	0xa4ba001a	! t0_kref+0x1a68:   	xnorcc	%o0, %i2, %l2
	.word	0xa5b00fc0	! t0_kref+0x1a6c:   	fone	%f18
	.word	0xadb506f8	! t0_kref+0x1a70:   	fmul8ulx16	%f20, %f24, %f22
	.word	0xe51e2010	! t0_kref+0x1a74:   	ldd	[%i0 + 0x10], %f18
	.word	0x9676ade7	! t0_kref+0x1a78:   	udiv	%i2, 0xde7, %o3
	.word	0xe6066008	! t0_kref+0x1a7c:   	ld	[%i1 + 8], %l3
	.word	0x99418000	! t0_kref+0x1a80:   	mov	%fprs, %o4
	.word	0x9da748bc	! t0_kref+0x1a84:   	fsubs	%f29, %f28, %f14
	.word	0xed68a084	! t0_kref+0x1a88:   	prefetch	%g2 + 0x84, 22
	.word	0x9efac017	! t0_kref+0x1a8c:   	sdivcc	%o3, %l7, %o7
	.word	0xbda01a5c	! t0_kref+0x1a90:   	fdtoi	%f28, %f30
	.word	0x2a480005	! t0_kref+0x1a94:   	bcs,a,pt	%icc, _kref+0x1aa8
	.word	0x925d400a	! t0_kref+0x1a98:   	smul	%l5, %o2, %o1
	.word	0xe1063fe8	! t0_kref+0x1a9c:   	ld	[%i0 - 0x18], %f16
	.word	0x92b32552	! t0_kref+0x1aa0:   	orncc	%o4, 0x552, %o1
	.word	0x9f320016	! t0_kref+0x1aa4:   	srl	%o0, %l6, %o7
	.word	0xde00a020	! t0_kref+0x1aa8:   	ld	[%g2 + 0x20], %o7
	.word	0x9a5b63be	! t0_kref+0x1aac:   	smul	%o5, 0x3be, %o5
	.word	0x9925c016	! t0_kref+0x1ab0:   	mulscc	%l7, %l6, %o4
	.word	0xa85a0015	! t0_kref+0x1ab4:   	smul	%o0, %l5, %l4
	.word	0x2b480007	! t0_kref+0x1ab8:   	fbug,a,pt	%fcc0, _kref+0x1ad4
	.word	0xdd1e7fe0	! t0_kref+0x1abc:   	ldd	[%i1 - 0x20], %f14
	.word	0x3c480001	! t0_kref+0x1ac0:   	bpos,a,pt	%icc, _kref+0x1ac4
	.word	0x94302eb7	! t0_kref+0x1ac4:   	orn	%g0, 0xeb7, %o2
	.word	0xebe6100a	! t0_kref+0x1ac8:   	casa	[%i0]0x80, %o2, %l5
	.word	0x940e800c	! t0_kref+0x1acc:   	and	%i2, %o4, %o2
	.word	0xea56c018	! t0_kref+0x1ad0:   	ldsh	[%i3 + %i0], %l5
	.word	0xd6480019	! t0_kref+0x1ad4:   	ldsb	[%g0 + %i1], %o3
	call	1f
	.empty
	.word	0xa5a309ce	! t0_kref+0x1adc:   	fdivd	%f12, %f14, %f18
	.word	0xb9a0111c	! t0_kref+0x1ae0:   	fxtod	%f28, %f28
	.word	0xaf2d6015	! t0_kref+0x1ae4:   	sll	%l5, 0x15, %l7
	.word	0x99b5496d	! t0_kref+0x1ae8:   	fpmerge	%f21, %f13, %f12
	.word	0x2d04ecae	! t0_kref+0x1aec:   	sethi	%hi(0x13b2b800), %l6
	.word	0xada00554	! t0_kref+0x1af0:   	fsqrtd	%f20, %f22
1:	.word	0xf100a028	! t0_kref+0x1af4:   	ld	[%g2 + 0x28], %f24
	.word	0x2f800001	! t0_kref+0x1af8:   	fbu,a	_kref+0x1afc
	.word	0xed262004	! t0_kref+0x1afc:   	st	%f22, [%i0 + 4]
	.word	0x9de3bfa0	! t0_kref+0x1b00:   	save	%sp, -0x60, %sp
	.word	0xb2c64018	! t0_kref+0x1b04:   	addccc	%i1, %i0, %i1
	.word	0xabef4019	! t0_kref+0x1b08:   	restore	%i5, %i1, %l5
	.word	0xd2060000	! t0_kref+0x1b0c:   	ld	[%i0], %o1
	.word	0xaed573cd	! t0_kref+0x1b10:   	umulcc	%l5, -0xc33, %l7
	.word	0x8143c000	! t0_kref+0x1b14:   	stbar
	.word	0xac5b0016	! t0_kref+0x1b18:   	smul	%o4, %l6, %l6
	.word	0x94f2801a	! t0_kref+0x1b1c:   	udivcc	%o2, %i2, %o2
	.word	0xb1b38ea0	! t0_kref+0x1b20:   	fsrc1s	%f14, %f24
	.word	0xd806401c	! t0_kref+0x1b24:   	ld	[%i1 + %i4], %o4
	.word	0xe300a03c	! t0_kref+0x1b28:   	ld	[%g2 + 0x3c], %f17
	.word	0x80db38b8	! t0_kref+0x1b2c:   	smulcc	%o4, -0x748, %g0
	.word	0x32480007	! t0_kref+0x1b30:   	bne,a,pt	%icc, _kref+0x1b4c
	.word	0x9bb30afc	! t0_kref+0x1b34:   	fpsub32s	%f12, %f28, %f13
	.word	0x2e800008	! t0_kref+0x1b38:   	bvs,a	_kref+0x1b58
	.word	0xb1a58d2f	! t0_kref+0x1b3c:   	fsmuld	%f22, %f15, %f24
	.word	0xd028a013	! t0_kref+0x1b40:   	stb	%o0, [%g2 + 0x13]
	.word	0x92700008	! t0_kref+0x1b44:   	udiv	%g0, %o0, %o1
	.word	0xd008a02b	! t0_kref+0x1b48:   	ldub	[%g2 + 0x2b], %o0
	.word	0x99a01896	! t0_kref+0x1b4c:   	fitos	%f22, %f12
	.word	0x90db400d	! t0_kref+0x1b50:   	smulcc	%o5, %o5, %o0
	.word	0xd47f0018	! t0_kref+0x1b54:   	swap	[%i4 + %i0], %o2
	.word	0xd44e7fe8	! t0_kref+0x1b58:   	ldsb	[%i1 - 0x18], %o2
	.word	0xa9a01a39	! t0_kref+0x1b5c:   	fstoi	%f25, %f20
	.word	0xaa32800c	! t0_kref+0x1b60:   	orn	%o2, %o4, %l5
	.word	0x985df1d3	! t0_kref+0x1b64:   	smul	%l7, -0xe2d, %o4
	.word	0xda774019	! t0_kref+0x1b68:   	stx	%o5, [%i5 + %i1]
	.word	0x9722a348	! t0_kref+0x1b6c:   	mulscc	%o2, 0x348, %o3
	.word	0x83c067a8	! t0_kref+0x1b70:   	jmpl	%g1 + 0x7a8, %g1
	.word	0xd6ee9018	! t0_kref+0x1b74:   	ldstuba	[%i2 + %i0]0x80, %o3
	.word	0xf1be5848	! t0_kref+0x1b78:   	stda	%f24, [%i1 + %o0]0xc2
	.word	0xa61d401a	! t0_kref+0x1b7c:   	xor	%l5, %i2, %l3
	.word	0x9fc00004	! t0_kref+0x1b80:   	call	%g0 + %g4
	.word	0xd8280019	! t0_kref+0x1b84:   	stb	%o4, [%g0 + %i1]
	.word	0xf91f4018	! t0_kref+0x1b88:   	ldd	[%i5 + %i0], %f28
	.word	0xdd1fbcc8	! t0_kref+0x1b8c:   	ldd	[%fp - 0x338], %f14
	.word	0xe9070018	! t0_kref+0x1b90:   	ld	[%i4 + %i0], %f20
	.word	0xd8ee9018	! t0_kref+0x1b94:   	ldstuba	[%i2 + %i0]0x80, %o4
	.word	0xd048a03c	! t0_kref+0x1b98:   	ldsb	[%g2 + 0x3c], %o0
	call	SYM(t0_subr0)
	.word	0x9da0192d	! t0_kref+0x1ba0:   	fstod	%f13, %f14
	.word	0xea5e001d	! t0_kref+0x1ba4:   	ldx	[%i0 + %i5], %l5
	.word	0xa9b48714	! t0_kref+0x1ba8:   	fmuld8sux16	%f18, %f20, %f20
	.word	0x81af4a2e	! t0_kref+0x1bac:   	fcmps	%fcc0, %f29, %f14
	.word	0x9de3bfa0	! t0_kref+0x1bb0:   	save	%sp, -0x60, %sp
	.word	0x802e2f29	! t0_kref+0x1bb4:   	andn	%i0, 0xf29, %g0
	.word	0x99ef7c13	! t0_kref+0x1bb8:   	restore	%i5, -0x3ed, %o4
	.word	0x29800002	! t0_kref+0x1bbc:   	fbl,a	_kref+0x1bc4
	.word	0x95b2c0b7	! t0_kref+0x1bc0:   	edge16n	%o3, %l7, %o2
	.word	0xee08a006	! t0_kref+0x1bc4:   	ldub	[%g2 + 6], %l7
	.word	0x9fb605d2	! t0_kref+0x1bc8:   	fcmpeq32	%f24, %f18, %o7
	.word	0x9fc10000	! t0_kref+0x1bcc:   	call	%g4
	.word	0x96bd4015	! t0_kref+0x1bd0:   	xnorcc	%l5, %l5, %o3
	.word	0x29800004	! t0_kref+0x1bd4:   	fbl,a	_kref+0x1be4
	.word	0xacbac00d	! t0_kref+0x1bd8:   	xnorcc	%o3, %o5, %l6
	.word	0xabb305d2	! t0_kref+0x1bdc:   	fcmpeq32	%f12, %f18, %l5
	.word	0xa6d2e23a	! t0_kref+0x1be0:   	umulcc	%o3, 0x23a, %l3
	.word	0xd420a030	! t0_kref+0x1be4:   	st	%o2, [%g2 + 0x30]
	.word	0xf7ee101d	! t0_kref+0x1be8:   	prefetcha	%i0 + %i5, 27
	.word	0x99a0055e	! t0_kref+0x1bec:   	fsqrtd	%f30, %f12
	.word	0xae26a63b	! t0_kref+0x1bf0:   	sub	%i2, 0x63b, %l7
	.word	0xfd00a008	! t0_kref+0x1bf4:   	ld	[%g2 + 8], %f30
	.word	0xb1a0055a	! t0_kref+0x1bf8:   	fsqrtd	%f26, %f24
	.word	0xa3a01a5e	! t0_kref+0x1bfc:   	fdtoi	%f30, %f17
	.word	0xd25e2010	! t0_kref+0x1c00:   	ldx	[%i0 + 0x10], %o1
	.word	0xdec65000	! t0_kref+0x1c04:   	ldswa	[%i1]0x80, %o7
	.word	0x3b480005	! t0_kref+0x1c08:   	fble,a,pt	%fcc0, _kref+0x1c1c
	.word	0xe1be180c	! t0_kref+0x1c0c:   	stda	%f16, [%i0 + %o4]0xc0
	.word	0xb7a00539	! t0_kref+0x1c10:   	fsqrts	%f25, %f27
	.word	0xb5b60c4e	! t0_kref+0x1c14:   	fnor	%f24, %f14, %f26
	.word	0xeb263ffc	! t0_kref+0x1c18:   	st	%f21, [%i0 - 4]
	.word	0x9830200b	! t0_kref+0x1c1c:   	orn	%g0, 0xb, %o4
	.word	0xd428a013	! t0_kref+0x1c20:   	stb	%o2, [%g2 + 0x13]
	.word	0xbdb70e80	! t0_kref+0x1c24:   	fsrc1	%f28, %f30
	.word	0xb5a00552	! t0_kref+0x1c28:   	fsqrtd	%f18, %f26
	.word	0x94223802	! t0_kref+0x1c2c:   	sub	%o0, -0x7fe, %o2
	.word	0x8143c000	! t0_kref+0x1c30:   	stbar
	.word	0x942b0016	! t0_kref+0x1c34:   	andn	%o4, %l6, %o2
	.word	0xfb063ffc	! t0_kref+0x1c38:   	ld	[%i0 - 4], %f29
	.word	0xafb00088	! t0_kref+0x1c3c:   	edge16	%g0, %o0, %l7
	.word	0xe67e3fe4	! t0_kref+0x1c40:   	swap	[%i0 - 0x1c], %l3
	.word	0x29480008	! t0_kref+0x1c44:   	fbl,a,pt	%fcc0, _kref+0x1c64
	.word	0xa5a01898	! t0_kref+0x1c48:   	fitos	%f24, %f18
	.word	0xe078a028	! t0_kref+0x1c4c:   	swap	[%g2 + 0x28], %l0
	.word	0x2f397460	! t0_kref+0x1c50:   	sethi	%hi(0xe5d18000), %l7
	.word	0xabb0077c	! t0_kref+0x1c54:   	fpack16	%f28, %f21
	.word	0xf926401c	! t0_kref+0x1c58:   	st	%f28, [%i1 + %i4]
	.word	0xb5a0191e	! t0_kref+0x1c5c:   	fitod	%f30, %f26
	.word	0x9e5b4016	! t0_kref+0x1c60:   	smul	%o5, %l6, %o7
	.word	0xea28a006	! t0_kref+0x1c64:   	stb	%l5, [%g2 + 6]
	.word	0xa5b30556	! t0_kref+0x1c68:   	fcmpeq16	%f12, %f22, %l2
	.word	0xa9b707cc	! t0_kref+0x1c6c:   	pdist	%f28, %f12, %f20
	.word	0xb1a5884c	! t0_kref+0x1c70:   	faddd	%f22, %f12, %f24
	.word	0x29480007	! t0_kref+0x1c74:   	fbl,a,pt	%fcc0, _kref+0x1c90
	.word	0xd28e1000	! t0_kref+0x1c78:   	lduba	[%i0]0x80, %o1
	.word	0xa812400d	! t0_kref+0x1c7c:   	or	%o1, %o5, %l4
	.word	0x31800002	! t0_kref+0x1c80:   	fba,a	_kref+0x1c88
	.word	0x94d02291	! t0_kref+0x1c84:   	umulcc	%g0, 0x291, %o2
	.word	0xaa5a400b	! t0_kref+0x1c88:   	smul	%o1, %o3, %l5
	.word	0x81ab4aac	! t0_kref+0x1c8c:   	fcmpes	%fcc0, %f13, %f12
	.word	0xec08a025	! t0_kref+0x1c90:   	ldub	[%g2 + 0x25], %l6
	.word	0xf91fbe70	! t0_kref+0x1c94:   	ldd	[%fp - 0x190], %f28
	.word	0x99a01a5a	! t0_kref+0x1c98:   	fdtoi	%f26, %f12
	.word	0xa9a00550	! t0_kref+0x1c9c:   	fsqrtd	%f16, %f20
	.word	0xaa436b57	! t0_kref+0x1ca0:   	addc	%o5, 0xb57, %l5
	.word	0xf420a02c	! t0_kref+0x1ca4:   	st	%i2, [%g2 + 0x2c]
	.word	0xef865000	! t0_kref+0x1ca8:   	lda	[%i1]0x80, %f23
	.word	0xbda01a50	! t0_kref+0x1cac:   	fdtoi	%f16, %f30
	.word	0x925ae700	! t0_kref+0x1cb0:   	smul	%o3, 0x700, %o1
	.word	0xadb306bd	! t0_kref+0x1cb4:   	fmul8x16al	%f12, %f29, %f22
	.word	0x92b261e8	! t0_kref+0x1cb8:   	orncc	%o1, 0x1e8, %o1
	.word	0xc768a042	! t0_kref+0x1cbc:   	prefetch	%g2 + 0x42, 3
	.word	0xc048a01f	! t0_kref+0x1cc0:   	ldsb	[%g2 + 0x1f], %g0
	.word	0x95b540eb	! t0_kref+0x1cc4:   	edge16ln	%l5, %o3, %o2
	.word	0xbbb30a70	! t0_kref+0x1cc8:   	fpadd32s	%f12, %f16, %f29
	.word	0xa5a01a50	! t0_kref+0x1ccc:   	fdtoi	%f16, %f18
	.word	0x81228016	! t0_kref+0x1cd0:   	mulscc	%o2, %l6, %g0
	.word	0x9665e627	! t0_kref+0x1cd4:   	subc	%l7, 0x627, %o3
	.word	0x98adb8f3	! t0_kref+0x1cd8:   	andncc	%l6, -0x70d, %o4
	.word	0xad033d0e	! t0_kref+0x1cdc:   	taddcc	%o4, -0x2f2, %l6
	.word	0xaadae046	! t0_kref+0x1ce0:   	smulcc	%o3, 0x46, %l5
	.word	0xa1a00554	! t0_kref+0x1ce4:   	fsqrtd	%f20, %f16
	.word	0xa1b00cd2	! t0_kref+0x1ce8:   	fnot2	%f18, %f16
	.word	0xac5da278	! t0_kref+0x1cec:   	smul	%l6, 0x278, %l6
	.word	0x99a309d8	! t0_kref+0x1cf0:   	fdivd	%f12, %f24, %f12
	.word	0xac924009	! t0_kref+0x1cf4:   	orcc	%o1, %o1, %l6
	.word	0x81d9691c	! t0_kref+0x1cf8:   	flush	%g5 + 0x91c
	.word	0x99a01911	! t0_kref+0x1cfc:   	fitod	%f17, %f12
	.word	0x22480001	! t0_kref+0x1d00:   	be,a,pt	%icc, _kref+0x1d04
	.word	0xebee101d	! t0_kref+0x1d04:   	prefetcha	%i0 + %i5, 21
	.word	0x9fa0189b	! t0_kref+0x1d08:   	fitos	%f27, %f15
	.word	0x81db2880	! t0_kref+0x1d0c:   	flush	%o4 + 0x880
	.word	0x92320017	! t0_kref+0x1d10:   	orn	%o0, %l7, %o1
	.word	0x9b400000	! t0_kref+0x1d14:   	mov	%y, %o5
	.word	0xf430a000	! t0_kref+0x1d18:   	sth	%i2, [%g2]
	.word	0x961b0015	! t0_kref+0x1d1c:   	xor	%o4, %l5, %o3
	.word	0xadb40db3	! t0_kref+0x1d20:   	fxors	%f16, %f19, %f22
	.word	0xd0264000	! t0_kref+0x1d24:   	st	%o0, [%i1]
	.word	0x9536a00e	! t0_kref+0x1d28:   	srl	%i2, 0xe, %o2
	.word	0x33800007	! t0_kref+0x1d2c:   	fbe,a	_kref+0x1d48
	.word	0xaca336e1	! t0_kref+0x1d30:   	subcc	%o4, -0x91f, %l6
	.word	0xf906401c	! t0_kref+0x1d34:   	ld	[%i1 + %i4], %f28
	.word	0x2c800002	! t0_kref+0x1d38:   	bneg,a	_kref+0x1d40
	.word	0x81858000	! t0_kref+0x1d3c:   	wr	%l6, %g0, %y
	.word	0xa8b34015	! t0_kref+0x1d40:   	orncc	%o5, %l5, %l4
	.word	0xd230a00a	! t0_kref+0x1d44:   	sth	%o1, [%g2 + 0xa]
	.word	0xe64e3fee	! t0_kref+0x1d48:   	ldsb	[%i0 - 0x12], %l3
	.word	0x9de3bfa0	! t0_kref+0x1d4c:   	save	%sp, -0x60, %sp
	.word	0xafe829f7	! t0_kref+0x1d50:   	restore	%g0, 0x9f7, %l7
	.word	0xb5a608ce	! t0_kref+0x1d54:   	fsubd	%f24, %f14, %f26
	.word	0x9fa0002f	! t0_kref+0x1d58:   	fmovs	%f15, %f15
	.word	0x9ef2801a	! t0_kref+0x1d5c:   	udivcc	%o2, %i2, %o7
	.word	0x9de3bfa0	! t0_kref+0x1d60:   	save	%sp, -0x60, %sp
	.word	0xb20eeb5f	! t0_kref+0x1d64:   	and	%i3, 0xb5f, %i1
	.word	0xafeec018	! t0_kref+0x1d68:   	restore	%i3, %i0, %l7
	.word	0xacbb000a	! t0_kref+0x1d6c:   	xnorcc	%o4, %o2, %l6
	.word	0x92d58000	! t0_kref+0x1d70:   	umulcc	%l6, %g0, %o1
	.word	0x8143c000	! t0_kref+0x1d74:   	stbar
	.word	0xa735801a	! t0_kref+0x1d78:   	srl	%l6, %i2, %l3
	.word	0xd4360000	! t0_kref+0x1d7c:   	sth	%o2, [%i0]
	.word	0x90958009	! t0_kref+0x1d80:   	orcc	%l6, %o1, %o0
	.word	0xb5b6c6b2	! t0_kref+0x1d84:   	fmul8x16al	%f27, %f18, %f26
	.word	0x81b6800b	! t0_kref+0x1d88:   	edge8	%i2, %o3, %g0
	.word	0xe6066008	! t0_kref+0x1d8c:   	ld	[%i1 + 8], %l3
	.word	0x9fa00531	! t0_kref+0x1d90:   	fsqrts	%f17, %f15
	.word	0xac5b4017	! t0_kref+0x1d94:   	smul	%o5, %l7, %l6
	.word	0xb5a0054e	! t0_kref+0x1d98:   	fsqrtd	%f14, %f26
	.word	0xaeb2c009	! t0_kref+0x1d9c:   	orncc	%o3, %o1, %l7
	.word	0xb1a0055a	! t0_kref+0x1da0:   	fsqrtd	%f26, %f24
	.word	0xd6063fec	! t0_kref+0x1da4:   	ld	[%i0 - 0x14], %o3
	.word	0x34480006	! t0_kref+0x1da8:   	bg,a,pt	%icc, _kref+0x1dc0
	.word	0x8185c000	! t0_kref+0x1dac:   	wr	%l7, %g0, %y
	.word	0xae9b4015	! t0_kref+0x1db0:   	xorcc	%o5, %l5, %l7
	.word	0xe8b81018	! t0_kref+0x1db4:   	stda	%l4, [%g0 + %i0]0x80
	.word	0x98920016	! t0_kref+0x1db8:   	orcc	%o0, %l6, %o4
	.word	0xea367ffa	! t0_kref+0x1dbc:   	sth	%l5, [%i1 - 6]
	.word	0x9fa788af	! t0_kref+0x1dc0:   	fsubs	%f30, %f15, %f15
	.word	0xaf2da01d	! t0_kref+0x1dc4:   	sll	%l6, 0x1d, %l7
	.word	0xa5b48a3b	! t0_kref+0x1dc8:   	fpadd16s	%f18, %f27, %f18
	.word	0x26800003	! t0_kref+0x1dcc:   	bl,a	_kref+0x1dd8
	.word	0xadb64df2	! t0_kref+0x1dd0:   	fnands	%f25, %f18, %f22
	.word	0x9e9a31bd	! t0_kref+0x1dd4:   	xorcc	%o0, -0xe43, %o7
	.word	0xae25400c	! t0_kref+0x1dd8:   	sub	%l5, %o4, %l7
	.word	0xb3b34c79	! t0_kref+0x1ddc:   	fnors	%f13, %f25, %f25
	.word	0xb1a588b8	! t0_kref+0x1de0:   	fsubs	%f22, %f24, %f24
	.word	0xfb26201c	! t0_kref+0x1de4:   	st	%f29, [%i0 + 0x1c]
	.word	0x99b78a77	! t0_kref+0x1de8:   	fpadd32s	%f30, %f23, %f12
	.word	0xd436401b	! t0_kref+0x1dec:   	sth	%o2, [%i1 + %i3]
	.word	0xd626001c	! t0_kref+0x1df0:   	st	%o3, [%i0 + %i4]
	.word	0x23480001	! t0_kref+0x1df4:   	fbne,a,pt	%fcc0, _kref+0x1df8
	.word	0xaa357bb9	! t0_kref+0x1df8:   	orn	%l5, -0x447, %l5
	.word	0xa1a0191e	! t0_kref+0x1dfc:   	fitod	%f30, %f16
	.word	0xa9408000	! t0_kref+0x1e00:   	mov	%ccr, %l4
	.word	0xf83f4005	! t0_kref+0x1e04:   	std	%i4, [%i5 + %g5]
	.word	0xa866b693	! t0_kref+0x1e08:   	subc	%i2, -0x96d, %l4
	.word	0xa496b79b	! t0_kref+0x1e0c:   	orcc	%i2, -0x865, %l2
	.word	0xe921401c	! t0_kref+0x1e10:   	st	%f20, [%g5 + %i4]
	.word	0xf91e401d	! t0_kref+0x1e14:   	ldd	[%i1 + %i5], %f28
	.word	0xef68a00e	! t0_kref+0x1e18:   	prefetch	%g2 + 0xe, 23
	.word	0xb1b70a12	! t0_kref+0x1e1c:   	fpadd16	%f28, %f18, %f24
	.word	0x81acca35	! t0_kref+0x1e20:   	fcmps	%fcc0, %f19, %f21
	.word	0xef68a006	! t0_kref+0x1e24:   	prefetch	%g2 + 6, 23
	.word	0x9fc10000	! t0_kref+0x1e28:   	call	%g4
	.word	0xaaba8017	! t0_kref+0x1e2c:   	xnorcc	%o2, %l7, %l5
	.word	0x171890fd	! t0_kref+0x1e30:   	sethi	%hi(0x6243f400), %o3
	.word	0xd0362004	! t0_kref+0x1e34:   	sth	%o0, [%i0 + 4]
	.word	0x001fffff	! t0_kref+0x1e38:   	illtrap	0x1fffff
	.word	0xe168a00c	! t0_kref+0x1e3c:   	prefetch	%g2 + 0xc, 16
	.word	0xc08e5000	! t0_kref+0x1e40:   	lduba	[%i1]0x80, %g0
	.word	0x9fc10000	! t0_kref+0x1e44:   	call	%g4
	.word	0xb7a4c832	! t0_kref+0x1e48:   	fadds	%f19, %f18, %f27
	.word	0xb5a50930	! t0_kref+0x1e4c:   	fmuls	%f20, %f16, %f26
	.word	0xa8f3400b	! t0_kref+0x1e50:   	udivcc	%o5, %o3, %l4
	.word	0xac1d711e	! t0_kref+0x1e54:   	xor	%l5, -0xee2, %l6
	.word	0x97b20100	! t0_kref+0x1e58:   	edge32	%o0, %g0, %o3
	.word	0xde10a024	! t0_kref+0x1e5c:   	lduh	[%g2 + 0x24], %o7
	.word	0x3b800003	! t0_kref+0x1e60:   	fble,a	_kref+0x1e6c
	.word	0xac95c000	! t0_kref+0x1e64:   	orcc	%l7, %g0, %l6
	.word	0x2f392c40	! t0_kref+0x1e68:   	sethi	%hi(0xe4b10000), %l7
	.word	0xd2080019	! t0_kref+0x1e6c:   	ldub	[%g0 + %i1], %o1
	.word	0xd2d01018	! t0_kref+0x1e70:   	ldsha	[%g0 + %i0]0x80, %o1
	.word	0xee262000	! t0_kref+0x1e74:   	st	%l7, [%i0]
	.word	0xac2e800c	! t0_kref+0x1e78:   	andn	%i2, %o4, %l6
	.word	0x36480008	! t0_kref+0x1e7c:   	bge,a,pt	%icc, _kref+0x1e9c
	.word	0xec20a00c	! t0_kref+0x1e80:   	st	%l6, [%g2 + 0xc]
	.word	0x81830000	! t0_kref+0x1e84:   	wr	%o4, %g0, %y
	.word	0xae630008	! t0_kref+0x1e88:   	subc	%o4, %o0, %l7
	.word	0x96b20015	! t0_kref+0x1e8c:   	orncc	%o0, %l5, %o3
	.word	0x99a4c833	! t0_kref+0x1e90:   	fadds	%f19, %f19, %f12
	.word	0x32800008	! t0_kref+0x1e94:   	bne,a	_kref+0x1eb4
	.word	0xfb80105c	! t0_kref+0x1e98:   	lda	[%g0 + %i4]0x82, %f29
	.word	0xa9b38cb2	! t0_kref+0x1e9c:   	fandnot2s	%f14, %f18, %f20
	.word	0xdb064000	! t0_kref+0x1ea0:   	ld	[%i1], %f13
	.word	0x3c480004	! t0_kref+0x1ea4:   	bpos,a,pt	%icc, _kref+0x1eb4
	.word	0xd67f0019	! t0_kref+0x1ea8:   	swap	[%i4 + %i1], %o3
	.word	0x80256692	! t0_kref+0x1eac:   	sub	%l5, 0x692, %g0
	.word	0x81af0a2c	! t0_kref+0x1eb0:   	fcmps	%fcc0, %f28, %f12
	.word	0xb7b0076c	! t0_kref+0x1eb4:   	fpack16	%f12, %f27
	.word	0xa1b40c8c	! t0_kref+0x1eb8:   	fandnot2	%f16, %f12, %f16
	.word	0x94624009	! t0_kref+0x1ebc:   	subc	%o1, %o1, %o2
	.word	0xecbe101d	! t0_kref+0x1ec0:   	stda	%l6, [%i0 + %i5]0x80
	.word	0xada00550	! t0_kref+0x1ec4:   	fsqrtd	%f16, %f22
	.word	0xde067ffc	! t0_kref+0x1ec8:   	ld	[%i1 - 4], %o7
	.word	0xee4e2016	! t0_kref+0x1ecc:   	ldsb	[%i0 + 0x16], %l7
	.word	0x81df8010	! t0_kref+0x1ed0:   	flush	%fp + %l0
	.word	0xa5a0193d	! t0_kref+0x1ed4:   	fstod	%f29, %f18
	.word	0xad400000	! t0_kref+0x1ed8:   	mov	%y, %l6
	call	SYM(t0_subr1)
	.word	0xe520a028	! t0_kref+0x1ee0:   	st	%f18, [%g2 + 0x28]
	.word	0x81ab8a38	! t0_kref+0x1ee4:   	fcmps	%fcc0, %f14, %f24
	.word	0x9a3ebc70	! t0_kref+0x1ee8:   	xnor	%i2, -0x390, %o5
	.word	0xa1a01035	! t0_kref+0x1eec:   	fstox	%f21, %f16
	.word	0x22480008	! t0_kref+0x1ef0:   	be,a,pt	%icc, _kref+0x1f10
	.word	0xa5a01a58	! t0_kref+0x1ef4:   	fdtoi	%f24, %f18
	.word	0xec4e3fe5	! t0_kref+0x1ef8:   	ldsb	[%i0 - 0x1b], %l6
	.word	0xc028a023	! t0_kref+0x1efc:   	clrb	[%g2 + 0x23]
	.word	0x96f2c017	! t0_kref+0x1f00:   	udivcc	%o3, %l7, %o3
	.word	0x9e226289	! t0_kref+0x1f04:   	sub	%o1, 0x289, %o7
	.word	0x99b587d8	! t0_kref+0x1f08:   	pdist	%f22, %f24, %f12
	.word	0xa9ab005a	! t0_kref+0x1f0c:   	fmovduge	%fcc0, %f26, %f20
	.word	0x81ab0ad4	! t0_kref+0x1f10:   	fcmped	%fcc0, %f12, %f20
	.word	0x9e124000	! t0_kref+0x1f14:   	or	%o1, %g0, %o7
	.word	0xada00531	! t0_kref+0x1f18:   	fsqrts	%f17, %f22
	.word	0x922aeb44	! t0_kref+0x1f1c:   	andn	%o3, 0xb44, %o1
	.word	0xee50a01e	! t0_kref+0x1f20:   	ldsh	[%g2 + 0x1e], %l7
	.word	0x911afe8b	! t0_kref+0x1f24:   	tsubcctv	%o3, -0x175, %o0
	.word	0x8d86801a	! t0_kref+0x1f28:   	wr	%i2, %i2, %fprs
	.word	0xeb68a08c	! t0_kref+0x1f2c:   	prefetch	%g2 + 0x8c, 21
	.word	0xac5b36ec	! t0_kref+0x1f30:   	smul	%o4, -0x914, %l6
	.word	0xc768a009	! t0_kref+0x1f34:   	prefetch	%g2 + 9, 3
	.word	0x37800007	! t0_kref+0x1f38:   	fbge,a	_kref+0x1f54
	.word	0xacbdab46	! t0_kref+0x1f3c:   	xnorcc	%l6, 0xb46, %l6
	.word	0xf9066004	! t0_kref+0x1f40:   	ld	[%i1 + 4], %f28
	.word	0xa5b50f5a	! t0_kref+0x1f44:   	fornot1	%f20, %f26, %f18
	.word	0xee262010	! t0_kref+0x1f48:   	st	%l7, [%i0 + 0x10]
	.word	0x9da708b0	! t0_kref+0x1f4c:   	fsubs	%f28, %f16, %f14
	.word	0xe1270019	! t0_kref+0x1f50:   	st	%f16, [%i4 + %i1]
	.word	0xa9b4ccb5	! t0_kref+0x1f54:   	fandnot2s	%f19, %f21, %f20
	.word	0x86102011	! t0_kref+0x1f58:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0x1f5c:   	subcc	%g3, 1, %g3
	.word	0x2280000f	! t0_kref+0x1f60:   	be,a	_kref+0x1f9c
	.word	0xa9a489d0	! t0_kref+0x1f64:   	fdivd	%f18, %f16, %f20
	.word	0xa52b401a	! t0_kref+0x1f68:   	sll	%o5, %i2, %l2
	.word	0xafa40835	! t0_kref+0x1f6c:   	fadds	%f16, %f21, %f23
	.word	0xd02e7fe8	! t0_kref+0x1f70:   	stb	%o0, [%i1 - 0x18]
	.word	0x9af2f6bf	! t0_kref+0x1f74:   	udivcc	%o3, -0x941, %o5
	.word	0xb5b50cb1	! t0_kref+0x1f78:   	fandnot2s	%f20, %f17, %f26
	.word	0xf1be5897	! t0_kref+0x1f7c:   	stda	%f24, [%i1 + %l7]0xc4
	.word	0xa1a3084e	! t0_kref+0x1f80:   	faddd	%f12, %f14, %f16
	.word	0xaca8001a	! t0_kref+0x1f84:   	andncc	%g0, %i2, %l6
	.word	0x9b2b001a	! t0_kref+0x1f88:   	sll	%o4, %i2, %o5
	.word	0xb7a000b7	! t0_kref+0x1f8c:   	fnegs	%f23, %f27
	.word	0x9692fecb	! t0_kref+0x1f90:   	orcc	%o3, -0x135, %o3
	.word	0x3bbffff2	! t0_kref+0x1f94:   	fble,a	_kref+0x1f5c
	.word	0x980dc00d	! t0_kref+0x1f98:   	and	%l7, %o5, %o4
	.word	0xa1b00c00	! t0_kref+0x1f9c:   	fzero	%f16
	.word	0xac26ba62	! t0_kref+0x1fa0:   	sub	%i2, -0x59e, %l6
	.word	0xa9b58d40	! t0_kref+0x1fa4:   	fnot1	%f22, %f20
	.word	0x35800002	! t0_kref+0x1fa8:   	fbue,a	_kref+0x1fb0
	.word	0xa82a8009	! t0_kref+0x1fac:   	andn	%o2, %o1, %l4
	.word	0xb1b306d2	! t0_kref+0x1fb0:   	fmul8sux16	%f12, %f18, %f24
	.word	0xaf2a4015	! t0_kref+0x1fb4:   	sll	%o1, %l5, %l7
	.word	0xa9702a02	! t0_kref+0x1fb8:   	popc	0xa02, %l4
	.word	0x9466a785	! t0_kref+0x1fbc:   	subc	%i2, 0x785, %o2
	.word	0x9462000d	! t0_kref+0x1fc0:   	subc	%o0, %o5, %o2
	.word	0xda30a01a	! t0_kref+0x1fc4:   	sth	%o5, [%g2 + 0x1a]
	.word	0x9adb6ac7	! t0_kref+0x1fc8:   	smulcc	%o5, 0xac7, %o5
	.word	0x9ba48833	! t0_kref+0x1fcc:   	fadds	%f18, %f19, %f13
	.word	0xebee101d	! t0_kref+0x1fd0:   	prefetcha	%i0 + %i5, 21
	.word	0x94258009	! t0_kref+0x1fd4:   	sub	%l6, %o1, %o2
	.word	0x94e26d8e	! t0_kref+0x1fd8:   	subccc	%o1, 0xd8e, %o2
	.word	0x80f2800b	! t0_kref+0x1fdc:   	udivcc	%o2, %o3, %g0
	.word	0x2731b5f9	! t0_kref+0x1fe0:   	sethi	%hi(0xc6d7e400), %l3
	.word	0xb3b78cac	! t0_kref+0x1fe4:   	fandnot2s	%f30, %f12, %f25
	.word	0xe11e3ff8	! t0_kref+0x1fe8:   	ldd	[%i0 - 8], %f16
	.word	0x2e480005	! t0_kref+0x1fec:   	bvs,a,pt	%icc, _kref+0x2000
	.word	0xa3a0189e	! t0_kref+0x1ff0:   	fitos	%f30, %f17
	.word	0x9a2a0000	! t0_kref+0x1ff4:   	andn	%o0, %g0, %o5
	.word	0xe7062000	! t0_kref+0x1ff8:   	ld	[%i0], %f19
	.word	0x81ad4a33	! t0_kref+0x1ffc:   	fcmps	%fcc0, %f21, %f19
	.word	0x921376f5	! t0_kref+0x2000:   	or	%o5, -0x90b, %o1
	.word	0xd87e2008	! t0_kref+0x2004:   	swap	[%i0 + 8], %o4
	.word	0x9820001a	! t0_kref+0x2008:   	neg	%i2, %o4
	.word	0xb5a01a3d	! t0_kref+0x200c:   	fstoi	%f29, %f26
	.word	0xa6f325f5	! t0_kref+0x2010:   	udivcc	%o4, 0x5f5, %l3
	.word	0xb7a01a5c	! t0_kref+0x2014:   	fdtoi	%f28, %f27
	.word	0xadb486f0	! t0_kref+0x2018:   	fmul8ulx16	%f18, %f16, %f22
	.word	0xb5b34eed	! t0_kref+0x201c:   	fornot2s	%f13, %f13, %f26
	.word	0xa1a000ae	! t0_kref+0x2020:   	fnegs	%f14, %f16
	.word	0x25800005	! t0_kref+0x2024:   	fblg,a	_kref+0x2038
	.word	0xada01913	! t0_kref+0x2028:   	fitod	%f19, %f22
	.word	0xb1a00130	! t0_kref+0x202c:   	fabss	%f16, %f24
	.word	0xacf22880	! t0_kref+0x2030:   	udivcc	%o0, 0x880, %l6
	.word	0xaa734017	! t0_kref+0x2034:   	udiv	%o5, %l7, %l5
	.word	0xb3a01894	! t0_kref+0x2038:   	fitos	%f20, %f25
	.word	0xa8330015	! t0_kref+0x203c:   	orn	%o4, %l5, %l4
	.word	0xa42ab7f8	! t0_kref+0x2040:   	andn	%o2, -0x808, %l2
	.word	0xa6fd8000	! t0_kref+0x2044:   	sdivcc	%l6, %g0, %l3
	call	SYM(t0_subr0)
	.word	0xa1a0055a	! t0_kref+0x204c:   	fsqrtd	%f26, %f16
	.word	0xa1b70d92	! t0_kref+0x2050:   	fxor	%f28, %f18, %f16
	.word	0xa9a0003c	! t0_kref+0x2054:   	fmovs	%f28, %f20
	.word	0xec366006	! t0_kref+0x2058:   	sth	%l6, [%i1 + 6]
	.word	0x31800004	! t0_kref+0x205c:   	fba,a	_kref+0x206c
	.word	0xb9a00554	! t0_kref+0x2060:   	fsqrtd	%f20, %f28
	.word	0xae1dea24	! t0_kref+0x2064:   	xor	%l7, 0xa24, %l7
	.word	0xa9b00778	! t0_kref+0x2068:   	fpack16	%f24, %f20
	.word	0xa9a01a54	! t0_kref+0x206c:   	fdtoi	%f20, %f20
	.word	0x9fc00004	! t0_kref+0x2070:   	call	%g0 + %g4
	.word	0xadb386fe	! t0_kref+0x2074:   	fmul8ulx16	%f14, %f30, %f22
	.word	0xd048a030	! t0_kref+0x2078:   	ldsb	[%g2 + 0x30], %o0
	.word	0x9a56a283	! t0_kref+0x207c:   	umul	%i2, 0x283, %o5
	.word	0xa9b68dfb	! t0_kref+0x2080:   	fnands	%f26, %f27, %f20
	.word	0xe456c019	! t0_kref+0x2084:   	ldsh	[%i3 + %i1], %l2
	.word	0xf420a008	! t0_kref+0x2088:   	st	%i2, [%g2 + 8]
	.word	0xb9a0054e	! t0_kref+0x208c:   	fsqrtd	%f14, %f28
	.word	0x81aeca3d	! t0_kref+0x2090:   	fcmps	%fcc0, %f27, %f29
	.word	0xebee101c	! t0_kref+0x2094:   	prefetcha	%i0 + %i4, 21
	.word	0xed68a046	! t0_kref+0x2098:   	prefetch	%g2 + 0x46, 22
	.word	0xa3a0053e	! t0_kref+0x209c:   	fsqrts	%f30, %f17
	.word	0x932d6003	! t0_kref+0x20a0:   	sll	%l5, 0x3, %o1
	call	SYM(t0_subr0)
	.word	0xd47e0000	! t0_kref+0x20a8:   	swap	[%i0], %o2
	.word	0xae25400d	! t0_kref+0x20ac:   	sub	%l5, %o5, %l7
	.word	0xe168a004	! t0_kref+0x20b0:   	prefetch	%g2 + 4, 16
	.word	0x9da0193d	! t0_kref+0x20b4:   	fstod	%f29, %f14
	.word	0x94130015	! t0_kref+0x20b8:   	or	%o4, %l5, %o2
	.word	0xa3a4c9ac	! t0_kref+0x20bc:   	fdivs	%f19, %f12, %f17
	.word	0xadb20136	! t0_kref+0x20c0:   	edge32n	%o0, %l6, %l6
	.word	0x9ed2697b	! t0_kref+0x20c4:   	umulcc	%o1, 0x97b, %o7
	.word	0xa9a00134	! t0_kref+0x20c8:   	fabss	%f20, %f20
	.word	0x9eb6801a	! t0_kref+0x20cc:   	orncc	%i2, %i2, %o7
	call	SYM(t0_subr3)
	.word	0x948afdf4	! t0_kref+0x20d4:   	andcc	%o3, -0x20c, %o2
	.word	0xa3b64d60	! t0_kref+0x20d8:   	fnot1s	%f25, %f17
	.word	0xec1e3ff0	! t0_kref+0x20dc:   	ldd	[%i0 - 0x10], %l6
	.word	0x9da0055c	! t0_kref+0x20e0:   	fsqrtd	%f28, %f14
	.word	0x9125c017	! t0_kref+0x20e4:   	mulscc	%l7, %l7, %o0
	.word	0x9fc00004	! t0_kref+0x20e8:   	call	%g0 + %g4
	.word	0xf720a004	! t0_kref+0x20ec:   	st	%f27, [%g2 + 4]
	.word	0xecf01019	! t0_kref+0x20f0:   	stxa	%l6, [%g0 + %i1]0x80
	.word	0x98920000	! t0_kref+0x20f4:   	orcc	%o0, %g0, %o4
	.word	0xa6b34000	! t0_kref+0x20f8:   	orncc	%o5, %g0, %l3
	.word	0xe920a030	! t0_kref+0x20fc:   	st	%f20, [%g2 + 0x30]
	.word	0x9de3bfa0	! t0_kref+0x2100:   	save	%sp, -0x60, %sp
	.word	0x93e8001c	! t0_kref+0x2104:   	restore	%g0, %i4, %o1
	.word	0x97054008	! t0_kref+0x2108:   	taddcc	%l5, %o0, %o3
	.word	0x80f2400b	! t0_kref+0x210c:   	udivcc	%o1, %o3, %g0
	.word	0x9ef58009	! t0_kref+0x2110:   	udivcc	%l6, %o1, %o7
	.word	0x111a2918	! t0_kref+0x2114:   	sethi	%hi(0x68a46000), %o0
	.word	0xa40dc00c	! t0_kref+0x2118:   	and	%l7, %o4, %l2
	.word	0x9ba0053d	! t0_kref+0x211c:   	fsqrts	%f29, %f13
	.word	0xb1a00554	! t0_kref+0x2120:   	fsqrtd	%f20, %f24
	.word	0xea062000	! t0_kref+0x2124:   	ld	[%i0], %l5
	.word	0xae830015	! t0_kref+0x2128:   	addcc	%o4, %l5, %l7
	.word	0xa926a43a	! t0_kref+0x212c:   	mulscc	%i2, 0x43a, %l4
	.word	0xea070018	! t0_kref+0x2130:   	ld	[%i4 + %i0], %l5
	.word	0xf428a022	! t0_kref+0x2134:   	stb	%i2, [%g2 + 0x22]
	.word	0xace54000	! t0_kref+0x2138:   	subccc	%l5, %g0, %l6
	.word	0x9da0110e	! t0_kref+0x213c:   	fxtod	%f14, %f14
	.word	0xada6c93d	! t0_kref+0x2140:   	fmuls	%f27, %f29, %f22
	.word	0x001fffff	! t0_kref+0x2144:   	illtrap	0x1fffff
	.word	0x99a508d0	! t0_kref+0x2148:   	fsubd	%f20, %f16, %f12
	.word	0x9bb6859a	! t0_kref+0x214c:   	fcmpgt32	%f26, %f26, %o5
	.word	0x81da0016	! t0_kref+0x2150:   	flush	%o0 + %l6
	.word	0xef00a010	! t0_kref+0x2154:   	ld	[%g2 + 0x10], %f23
	.word	0x9da01917	! t0_kref+0x2158:   	fitod	%f23, %f14
	.word	0x99a54d3d	! t0_kref+0x215c:   	fsmuld	%f21, %f29, %f12
	.word	0x99b406fa	! t0_kref+0x2160:   	fmul8ulx16	%f16, %f26, %f12
	.word	0xec30a022	! t0_kref+0x2164:   	sth	%l6, [%g2 + 0x22]
	.word	0xa8554016	! t0_kref+0x2168:   	umul	%l5, %l6, %l4
	call	SYM(t0_subr2)
	.word	0x932025da	! t0_kref+0x2170:   	mulscc	%g0, 0x5da, %o1
	.word	0xa9b406f4	! t0_kref+0x2174:   	fmul8ulx16	%f16, %f20, %f20
	.word	0xaa5b0015	! t0_kref+0x2178:   	smul	%o4, %l5, %l5
	.word	0xaee68009	! t0_kref+0x217c:   	subccc	%i2, %o1, %l7
	.word	0xfdee501d	! t0_kref+0x2180:   	prefetcha	%i1 + %i5, 30
	.word	0xe56e401d	! t0_kref+0x2184:   	prefetch	%i1 + %i5, 18
	.word	0x9de3bfa0	! t0_kref+0x2188:   	save	%sp, -0x60, %sp
	.word	0xba50001a	! t0_kref+0x218c:   	umul	%g0, %i2, %i5
	.word	0x95e8001d	! t0_kref+0x2190:   	restore	%g0, %i5, %o2
	.word	0x99b785da	! t0_kref+0x2194:   	fcmpeq32	%f30, %f26, %o4
	.word	0x81ad8a33	! t0_kref+0x2198:   	fcmps	%fcc0, %f22, %f19
	.word	0x93b58280	! t0_kref+0x219c:   	array32	%l6, %g0, %o1
	.word	0x36800001	! t0_kref+0x21a0:   	bge,a	_kref+0x21a4
	.word	0xe91e3ff8	! t0_kref+0x21a4:   	ldd	[%i0 - 8], %f20
	.word	0xd230a038	! t0_kref+0x21a8:   	sth	%o1, [%g2 + 0x38]
	.word	0x3d480004	! t0_kref+0x21ac:   	fbule,a,pt	%fcc0, _kref+0x21bc
	.word	0x9db40715	! t0_kref+0x21b0:   	fmuld8sux16	%f16, %f21, %f14
	.word	0x9b028016	! t0_kref+0x21b4:   	taddcc	%o2, %l6, %o5
	.word	0xc0280019	! t0_kref+0x21b8:   	clrb	[%g0 + %i1]
	.word	0xa9b546b5	! t0_kref+0x21bc:   	fmul8x16al	%f21, %f21, %f20
	.word	0xf11fbde8	! t0_kref+0x21c0:   	ldd	[%fp - 0x218], %f24
	.word	0xd6567ffe	! t0_kref+0x21c4:   	ldsh	[%i1 - 2], %o3
	.word	0xb5b58e54	! t0_kref+0x21c8:   	fxnor	%f22, %f20, %f26
	.word	0x81ac0a2c	! t0_kref+0x21cc:   	fcmps	%fcc0, %f16, %f12
	.word	0x99a00550	! t0_kref+0x21d0:   	fsqrtd	%f16, %f12
	.word	0xde500019	! t0_kref+0x21d4:   	ldsh	[%g0 + %i1], %o7
	.word	0x9db70e50	! t0_kref+0x21d8:   	fxnor	%f28, %f16, %f14
	.word	0x30480001	! t0_kref+0x21dc:   	ba,a,pt	%icc, _kref+0x21e0
	.word	0xa8babf85	! t0_kref+0x21e0:   	xnorcc	%o2, -0x7b, %l4
	.word	0xec3e6010	! t0_kref+0x21e4:   	std	%l6, [%i1 + 0x10]
	.word	0x941aab1c	! t0_kref+0x21e8:   	xor	%o2, 0xb1c, %o2
	.word	0xbbb54aee	! t0_kref+0x21ec:   	fpsub32s	%f21, %f14, %f29
	.word	0x81ad8a50	! t0_kref+0x21f0:   	fcmpd	%fcc0, %f22, %f16
	.word	0x92424000	! t0_kref+0x21f4:   	addc	%o1, %g0, %o1
	.word	0xc0500018	! t0_kref+0x21f8:   	ldsh	[%g0 + %i0], %g0
	.word	0xb5a01933	! t0_kref+0x21fc:   	fstod	%f19, %f26
	.word	0xe9981018	! t0_kref+0x2200:   	ldda	[%g0 + %i0]0x80, %f20
	.word	0x9e603c27	! t0_kref+0x2204:   	subc	%g0, -0x3d9, %o7
	.word	0xbda01a5c	! t0_kref+0x2208:   	fdtoi	%f28, %f30
	.word	0x93268009	! t0_kref+0x220c:   	mulscc	%i2, %o1, %o1
	.word	0x9fb00fe0	! t0_kref+0x2210:   	fones	%f15
	.word	0x96aac000	! t0_kref+0x2214:   	andncc	%o3, %g0, %o3
	.word	0x9fa5c8b9	! t0_kref+0x2218:   	fsubs	%f23, %f25, %f15
	.word	0xa7a01a3d	! t0_kref+0x221c:   	fstoi	%f29, %f19
	.word	0xa1a74d3c	! t0_kref+0x2220:   	fsmuld	%f29, %f28, %f16
	.word	0xaaaa8009	! t0_kref+0x2224:   	andncc	%o2, %o1, %l5
	.word	0xbba0013e	! t0_kref+0x2228:   	fabss	%f30, %f29
	.word	0x83414000	! t0_kref+0x222c:   	mov	%pc, %g1
	.word	0xd8ae1000	! t0_kref+0x2230:   	stba	%o4, [%i0]0x80
	.word	0x2d253852	! t0_kref+0x2234:   	sethi	%hi(0x94e14800), %l6
	.word	0x952a000d	! t0_kref+0x2238:   	sll	%o0, %o5, %o2
	.word	0x81800000	! t0_kref+0x223c:   	mov	%g0, %y
	.word	0x9a302f38	! t0_kref+0x2240:   	orn	%g0, 0xf38, %o5
	.word	0x9de3bfa0	! t0_kref+0x2244:   	save	%sp, -0x60, %sp
	.word	0x95eef2be	! t0_kref+0x2248:   	restore	%i3, -0xd42, %o2
	.word	0xbba018d0	! t0_kref+0x224c:   	fdtos	%f16, %f29
	.word	0xa7a00538	! t0_kref+0x2250:   	fsqrts	%f24, %f19
	.word	0xd4270018	! t0_kref+0x2254:   	st	%o2, [%i4 + %i0]
	.word	0x9db0076c	! t0_kref+0x2258:   	fpack16	%f12, %f14
	.word	0x9e634017	! t0_kref+0x225c:   	subc	%o5, %l7, %o7
	.word	0x3c480006	! t0_kref+0x2260:   	bpos,a,pt	%icc, _kref+0x2278
	.word	0xe07e4000	! t0_kref+0x2264:   	swap	[%i1], %l0
	.word	0xd456c019	! t0_kref+0x2268:   	ldsh	[%i3 + %i1], %o2
	.word	0x81abca34	! t0_kref+0x226c:   	fcmps	%fcc0, %f15, %f20
	.word	0x95332003	! t0_kref+0x2270:   	srl	%o4, 0x3, %o2
	.word	0xaefaf632	! t0_kref+0x2274:   	sdivcc	%o3, -0x9ce, %l7
	.word	0x3f480007	! t0_kref+0x2278:   	fbo,a,pt	%fcc0, _kref+0x2294
	.word	0xe6ee101a	! t0_kref+0x227c:   	ldstuba	[%i0 + %i2]0x80, %l3
	.word	0xac2d4015	! t0_kref+0x2280:   	andn	%l5, %l5, %l6
	.word	0xbba78835	! t0_kref+0x2284:   	fadds	%f30, %f21, %f29
	.word	0xb9a00556	! t0_kref+0x2288:   	fsqrtd	%f22, %f28
	.word	0x8185c000	! t0_kref+0x228c:   	wr	%l7, %g0, %y
	.word	0xa9a00137	! t0_kref+0x2290:   	fabss	%f23, %f20
	.word	0xada01932	! t0_kref+0x2294:   	fstod	%f18, %f22
	.word	0x81abca2d	! t0_kref+0x2298:   	fcmps	%fcc0, %f15, %f13
	.word	0x9aa24017	! t0_kref+0x229c:   	subcc	%o1, %l7, %o5
	.word	0x81df801e	! t0_kref+0x22a0:   	flush	%fp + %fp
	.word	0xee480018	! t0_kref+0x22a4:   	ldsb	[%g0 + %i0], %l7
	.word	0x81868000	! t0_kref+0x22a8:   	wr	%i2, %g0, %y
	.word	0x9ab6800a	! t0_kref+0x22ac:   	orncc	%i2, %o2, %o5
	.word	0x9ef5f5f8	! t0_kref+0x22b0:   	udivcc	%l7, -0xa08, %o7
	.word	0xb5b307cc	! t0_kref+0x22b4:   	pdist	%f12, %f12, %f26
	.word	0xaa1da80b	! t0_kref+0x22b8:   	xor	%l6, 0x80b, %l5
	.word	0xa730000d	! t0_kref+0x22bc:   	srl	%g0, %o5, %l3
	.word	0x9fc10000	! t0_kref+0x22c0:   	call	%g4
	.word	0xb1b48ed0	! t0_kref+0x22c4:   	fornot2	%f18, %f16, %f24
	.word	0xb5a38834	! t0_kref+0x22c8:   	fadds	%f14, %f20, %f26
	.word	0xa51b0008	! t0_kref+0x22cc:   	tsubcctv	%o4, %o0, %l2
	.word	0x962ac016	! t0_kref+0x22d0:   	andn	%o3, %l6, %o3
	.word	0xf91e001d	! t0_kref+0x22d4:   	ldd	[%i0 + %i5], %f28
	.word	0x91700008	! t0_kref+0x22d8:   	popc	%o0, %o0
	.word	0x81400000	! t0_kref+0x22dc:   	mov	%y, %g0
	.word	0xa7336002	! t0_kref+0x22e0:   	srl	%o5, 0x2, %l3
	.word	0x36480003	! t0_kref+0x22e4:   	bge,a,pt	%icc, _kref+0x22f0
	.word	0xa8f33430	! t0_kref+0x22e8:   	udivcc	%o4, -0xbd0, %l4
	.word	0xa1a589cc	! t0_kref+0x22ec:   	fdivd	%f22, %f12, %f16
	.word	0x151f3ee2	! t0_kref+0x22f0:   	sethi	%hi(0x7cfb8800), %o2
	.word	0x9e0a401a	! t0_kref+0x22f4:   	and	%o1, %i2, %o7
	.word	0xb3a0003d	! t0_kref+0x22f8:   	fmovs	%f29, %f25
	.word	0xd4e81018	! t0_kref+0x22fc:   	ldstuba	[%g0 + %i0]0x80, %o2
	.word	0xb1b78739	! t0_kref+0x2300:   	fmuld8ulx16	%f30, %f25, %f24
	.word	0xd88e9019	! t0_kref+0x2304:   	lduba	[%i2 + %i1]0x80, %o4
	.word	0x8d80001a	! t0_kref+0x2308:   	mov	%i2, %fprs
	.word	0xf007bfe0	! t0_kref+0x230c:   	ld	[%fp - 0x20], %i0
	.word	0x900b7fc8	! t0_kref+0x2310:   	and	%o5, -0x38, %o0
	.word	0x92258009	! t0_kref+0x2314:   	sub	%l6, %o1, %o1
	.word	0xf1ee101d	! t0_kref+0x2318:   	prefetcha	%i0 + %i5, 24
	.word	0x99a44835	! t0_kref+0x231c:   	fadds	%f17, %f21, %f12
	.word	0x9495bd2a	! t0_kref+0x2320:   	orcc	%l6, -0x2d6, %o2
	.word	0xa1b58673	! t0_kref+0x2324:   	fmul8x16au	%f22, %f19, %f16
	call	SYM(t0_subr1)
	.word	0xa9a5483e	! t0_kref+0x232c:   	fadds	%f21, %f30, %f20
	.word	0x99a0193a	! t0_kref+0x2330:   	fstod	%f26, %f12
	.word	0x8143e040	! t0_kref+0x2334:   	membar	0x40
	.word	0x99b300a8	! t0_kref+0x2338:   	edge16n	%o4, %o0, %o4
	.word	0xec00a03c	! t0_kref+0x233c:   	ld	[%g2 + 0x3c], %l6
	.word	0x93b20200	! t0_kref+0x2340:   	array8	%o0, %g0, %o1
	.word	0x21480007	! t0_kref+0x2344:   	fbn,a,pt	%fcc0, _kref+0x2360
	.word	0x9db3c978	! t0_kref+0x2348:   	fpmerge	%f15, %f24, %f14
	.word	0xa5b50c90	! t0_kref+0x234c:   	fandnot2	%f20, %f16, %f18
	.word	0x81580000	! t0_kref+0x2350:   	flushw
	.word	0xa85df5a1	! t0_kref+0x2354:   	smul	%l7, -0xa5f, %l4
	.word	0xac723af1	! t0_kref+0x2358:   	udiv	%o0, -0x50f, %l6
	.word	0x9485c00c	! t0_kref+0x235c:   	addcc	%l7, %o4, %o2
	.word	0x2f2ab2a0	! t0_kref+0x2360:   	sethi	%hi(0xaaca8000), %l7
	.word	0xecbe101d	! t0_kref+0x2364:   	stda	%l6, [%i0 + %i5]0x80
	call	SYM(t0_subr3)
	.word	0xe8ee101a	! t0_kref+0x236c:   	ldstuba	[%i0 + %i2]0x80, %l4
	.word	0xa933000b	! t0_kref+0x2370:   	srl	%o4, %o3, %l4
	.word	0xaba018ce	! t0_kref+0x2374:   	fdtos	%f14, %f21
	.word	0x91358017	! t0_kref+0x2378:   	srl	%l6, %l7, %o0
	.word	0xbda0053a	! t0_kref+0x237c:   	fsqrts	%f26, %f30
	.word	0xa544c000	! t0_kref+0x2380:   	mov	%gsr, %l2
	.word	0x878020d2	! t0_kref+0x2384:   	mov	0xd2, %asi
	.word	0xe11e7ff8	! t0_kref+0x2388:   	ldd	[%i1 - 8], %f16
	.word	0x9bb24100	! t0_kref+0x238c:   	edge32	%o1, %g0, %o5
	.word	0x9e35b41f	! t0_kref+0x2390:   	orn	%l6, -0xbe1, %o7
	.word	0xaee03725	! t0_kref+0x2394:   	subccc	%g0, -0x8db, %l7
	.word	0xa42ac00b	! t0_kref+0x2398:   	andn	%o3, %o3, %l2
	.word	0x32800006	! t0_kref+0x239c:   	bne,a	_kref+0x23b4
	.word	0xa5a688d6	! t0_kref+0x23a0:   	fsubd	%f26, %f22, %f18
	.word	0x961dafc6	! t0_kref+0x23a4:   	xor	%l6, 0xfc6, %o3
	.word	0x93230015	! t0_kref+0x23a8:   	mulscc	%o4, %l5, %o1
	.word	0x26800002	! t0_kref+0x23ac:   	bl,a	_kref+0x23b4
	.word	0xa5a00530	! t0_kref+0x23b0:   	fsqrts	%f16, %f18
	.word	0x981ac017	! t0_kref+0x23b4:   	xor	%o3, %l7, %o4
	.word	0xb1a01a54	! t0_kref+0x23b8:   	fdtoi	%f20, %f24
	.word	0x9ab24000	! t0_kref+0x23bc:   	orncc	%o1, %g0, %o5
	call	SYM(t0_subr1)
	.word	0xb9a018cc	! t0_kref+0x23c4:   	fdtos	%f12, %f28
	.word	0xa4e6ab11	! t0_kref+0x23c8:   	subccc	%i2, 0xb11, %l2
	.word	0xec3e6018	! t0_kref+0x23cc:   	std	%l6, [%i1 + 0x18]
	.word	0xadb38e52	! t0_kref+0x23d0:   	fxnor	%f14, %f18, %f22
	.word	0x9ab5800c	! t0_kref+0x23d4:   	orncc	%l6, %o4, %o5
	.word	0x94e3400d	! t0_kref+0x23d8:   	subccc	%o5, %o5, %o2
	.word	0xfd1e3fe8	! t0_kref+0x23dc:   	ldd	[%i0 - 0x18], %f30
	.word	0x9712c00a	! t0_kref+0x23e0:   	taddcctv	%o3, %o2, %o3
	.word	0xd4580019	! t0_kref+0x23e4:   	ldx	[%g0 + %i1], %o2
	.word	0xd4f75019	! t0_kref+0x23e8:   	stxa	%o2, [%i5 + %i1]0x80
	.word	0xacf8000b	! t0_kref+0x23ec:   	sdivcc	%g0, %o3, %l6
	.word	0xeb00a03c	! t0_kref+0x23f0:   	ld	[%g2 + 0x3c], %f21
	.word	0xc0d6501b	! t0_kref+0x23f4:   	ldsha	[%i1 + %i3]0x80, %g0
	.word	0xa5a018da	! t0_kref+0x23f8:   	fdtos	%f26, %f18
	.word	0x8143c000	! t0_kref+0x23fc:   	stbar
	.word	0x96debbda	! t0_kref+0x2400:   	smulcc	%i2, -0x426, %o3
	.word	0xc5ee100b	! t0_kref+0x2404:   	prefetcha	%i0 + %o3, 2
	.word	0xa9a00539	! t0_kref+0x2408:   	fsqrts	%f25, %f20
	.word	0xba103fe8	! t0_kref+0x240c:   	mov	0xffffffe8, %i5
	.word	0x920aac48	! t0_kref+0x2410:   	and	%o2, 0xc48, %o1
	.word	0x2c800002	! t0_kref+0x2414:   	bneg,a	_kref+0x241c
	.word	0xf207bfe0	! t0_kref+0x2418:   	ld	[%fp - 0x20], %i1
	.word	0xa6dd8017	! t0_kref+0x241c:   	smulcc	%l6, %l7, %l3
	.word	0xbda000ac	! t0_kref+0x2420:   	fnegs	%f12, %f30
	.word	0xd01e7fe0	! t0_kref+0x2424:   	ldd	[%i1 - 0x20], %o0
	.word	0xa8956d88	! t0_kref+0x2428:   	orcc	%l5, 0xd88, %l4
	.word	0xaba01a32	! t0_kref+0x242c:   	fstoi	%f18, %f21
	.word	0x9bb0000a	! t0_kref+0x2430:   	edge8	%g0, %o2, %o5
	.word	0xf51e6008	! t0_kref+0x2434:   	ldd	[%i1 + 8], %f26
	.word	0xd62e601a	! t0_kref+0x2438:   	stb	%o3, [%i1 + 0x1a]
	.word	0x90e2f927	! t0_kref+0x243c:   	subccc	%o3, -0x6d9, %o0
	.word	0xec263fe8	! t0_kref+0x2440:   	st	%l6, [%i0 - 0x18]
	.word	0xd62e4000	! t0_kref+0x2444:   	stb	%o3, [%i1]
	.word	0x28800002	! t0_kref+0x2448:   	bleu,a	_kref+0x2450
	.word	0xe8e81018	! t0_kref+0x244c:   	ldstuba	[%g0 + %i0]0x80, %l4
	.word	0x9ad0000b	! t0_kref+0x2450:   	umulcc	%g0, %o3, %o5
	.word	0xac920009	! t0_kref+0x2454:   	orcc	%o0, %o1, %l6
	.word	0xdd26401c	! t0_kref+0x2458:   	st	%f14, [%i1 + %i4]
	.word	0xec4e3fe0	! t0_kref+0x245c:   	ldsb	[%i0 - 0x20], %l6
	.word	0x2c480001	! t0_kref+0x2460:   	bneg,a,pt	%icc, _kref+0x2464
	.word	0xd2280018	! t0_kref+0x2464:   	stb	%o1, [%g0 + %i0]
	.word	0xa3a018cc	! t0_kref+0x2468:   	fdtos	%f12, %f17
	.word	0xeb20a004	! t0_kref+0x246c:   	st	%f21, [%g2 + 4]
	.word	0xa7b3caf4	! t0_kref+0x2470:   	fpsub32s	%f15, %f20, %f19
	.word	0x9da00538	! t0_kref+0x2474:   	fsqrts	%f24, %f14
	.word	0xe9063fe8	! t0_kref+0x2478:   	ld	[%i0 - 0x18], %f20
	.word	0xe64e001a	! t0_kref+0x247c:   	ldsb	[%i0 + %i2], %l3
	.word	0x99b48dcc	! t0_kref+0x2480:   	fnand	%f18, %f12, %f12
	.word	0xdf064000	! t0_kref+0x2484:   	ld	[%i1], %f15
	.word	0x9db50f50	! t0_kref+0x2488:   	fornot1	%f20, %f16, %f14
	.word	0x9db00fe0	! t0_kref+0x248c:   	fones	%f14
	.word	0xda463ff8	! t0_kref+0x2490:   	ldsw	[%i0 - 8], %o5
	.word	0xd408a033	! t0_kref+0x2494:   	ldub	[%g2 + 0x33], %o2
	.word	0xd606001c	! t0_kref+0x2498:   	ld	[%i0 + %i4], %o3
	.word	0x9ba0052f	! t0_kref+0x249c:   	fsqrts	%f15, %f13
	.word	0x9da0015e	! t0_kref+0x24a0:   	fabsd	%f30, %f14
	.word	0xe64e7ffd	! t0_kref+0x24a4:   	ldsb	[%i1 - 3], %l3
	.word	0xab2a400b	! t0_kref+0x24a8:   	sll	%o1, %o3, %l5
	.word	0xbda0054e	! t0_kref+0x24ac:   	fsqrtd	%f14, %f30
	.word	0x99b34320	! t0_kref+0x24b0:   	bmask	%o5, %g0, %o4
	.word	0xf428a03a	! t0_kref+0x24b4:   	stb	%i2, [%g2 + 0x3a]
	.word	0xae2a800b	! t0_kref+0x24b8:   	andn	%o2, %o3, %l7
	.word	0xeb00a018	! t0_kref+0x24bc:   	ld	[%g2 + 0x18], %f21
	.word	0xb1b00f18	! t0_kref+0x24c0:   	fsrc2	%f24, %f24
	.word	0xa1a00132	! t0_kref+0x24c4:   	fabss	%f18, %f16
	.word	0xb1a3c82d	! t0_kref+0x24c8:   	fadds	%f15, %f13, %f24
	.word	0xaa954008	! t0_kref+0x24cc:   	orcc	%l5, %o0, %l5
	call	SYM(t0_subr1)
	.word	0xb9a0191a	! t0_kref+0x24d4:   	fitod	%f26, %f28
	.word	0xd220a024	! t0_kref+0x24d8:   	st	%o1, [%g2 + 0x24]
	.word	0xda000018	! t0_kref+0x24dc:   	ld	[%g0 + %i0], %o5
	.word	0xb5a0191c	! t0_kref+0x24e0:   	fitod	%f28, %f26
	.word	0x96e57d2b	! t0_kref+0x24e4:   	subccc	%l5, -0x2d5, %o3
	.word	0xe9263ff8	! t0_kref+0x24e8:   	st	%f20, [%i0 - 8]
	.word	0xbdb7066e	! t0_kref+0x24ec:   	fmul8x16au	%f28, %f14, %f30
	.word	0xf700a014	! t0_kref+0x24f0:   	ld	[%g2 + 0x14], %f27
	.word	0xa615b3fa	! t0_kref+0x24f4:   	or	%l6, -0xc06, %l3
	.word	0x81adca33	! t0_kref+0x24f8:   	fcmps	%fcc0, %f23, %f19
	.word	0xa5a34839	! t0_kref+0x24fc:   	fadds	%f13, %f25, %f18
	.word	0x96768016	! t0_kref+0x2500:   	udiv	%i2, %l6, %o3
	.word	0x34480001	! t0_kref+0x2504:   	bg,a,pt	%icc, _kref+0x2508
	.word	0xddbf5018	! t0_kref+0x2508:   	stda	%f14, [%i5 + %i0]0x80
	.word	0xea28a035	! t0_kref+0x250c:   	stb	%l5, [%g2 + 0x35]
	.word	0x9da00554	! t0_kref+0x2510:   	fsqrtd	%f20, %f14
	.word	0xd2ee101a	! t0_kref+0x2514:   	ldstuba	[%i0 + %i2]0x80, %o1
	.word	0x90227b20	! t0_kref+0x2518:   	sub	%o1, -0x4e0, %o0
	.word	0xb1a00536	! t0_kref+0x251c:   	fsqrts	%f22, %f24
	.word	0xb9a01a56	! t0_kref+0x2520:   	fdtoi	%f22, %f28
	.word	0x941a7ca0	! t0_kref+0x2524:   	xor	%o1, -0x360, %o2
	.word	0x965d4016	! t0_kref+0x2528:   	smul	%l5, %l6, %o3
	.word	0x93b2017a	! t0_kref+0x252c:   	edge32ln	%o0, %i2, %o1
	.word	0xe720a020	! t0_kref+0x2530:   	st	%f19, [%g2 + 0x20]
	.word	0xa882c01a	! t0_kref+0x2534:   	addcc	%o3, %i2, %l4
	.word	0xe1ee501b	! t0_kref+0x2538:   	prefetcha	%i1 + %i3, 16
	.word	0x920b3788	! t0_kref+0x253c:   	and	%o4, -0x878, %o1
	.word	0xd028a01d	! t0_kref+0x2540:   	stb	%o0, [%g2 + 0x1d]
	.word	0x9fc00004	! t0_kref+0x2544:   	call	%g0 + %g4
	.word	0x952d6009	! t0_kref+0x2548:   	sll	%l5, 0x9, %o2
	.word	0xbda0190d	! t0_kref+0x254c:   	fitod	%f13, %f30
	.word	0x81dec019	! t0_kref+0x2550:   	flush	%i3 + %i1
	.word	0xa92d4008	! t0_kref+0x2554:   	sll	%l5, %o0, %l4
	.word	0x81dee65c	! t0_kref+0x2558:   	flush	%i3 + 0x65c
	.word	0xa9400000	! t0_kref+0x255c:   	mov	%y, %l4
	.word	0xb9a00532	! t0_kref+0x2560:   	fsqrts	%f18, %f28
	.word	0x9a422f5d	! t0_kref+0x2564:   	addc	%o0, 0xf5d, %o5
	.word	0xb9a01098	! t0_kref+0x2568:   	fxtos	%f24, %f28
	call	SYM(t0_subr0)
	.word	0x93230009	! t0_kref+0x2570:   	mulscc	%o4, %o1, %o1
	.word	0xb5a00556	! t0_kref+0x2574:   	fsqrtd	%f22, %f26
	.word	0xec3f4018	! t0_kref+0x2578:   	std	%l6, [%i5 + %i0]
	.word	0x93b38594	! t0_kref+0x257c:   	fcmpgt32	%f14, %f20, %o1
	.word	0x942b6a49	! t0_kref+0x2580:   	andn	%o5, 0xa49, %o2
	.word	0x9fb68280	! t0_kref+0x2584:   	array32	%i2, %g0, %o7
	.word	0x90a2b075	! t0_kref+0x2588:   	subcc	%o2, -0xf8b, %o0
	.word	0xc086101c	! t0_kref+0x258c:   	lda	[%i0 + %i4]0x80, %g0
	.word	0xede6100a	! t0_kref+0x2590:   	casa	[%i0]0x80, %o2, %l6
	.word	0x9a3025c5	! t0_kref+0x2594:   	orn	%g0, 0x5c5, %o5
	.word	0x26480008	! t0_kref+0x2598:   	bl,a,pt	%icc, _kref+0x25b8
	.word	0xacf5ac62	! t0_kref+0x259c:   	udivcc	%l6, 0xc62, %l6
	.word	0xda280019	! t0_kref+0x25a0:   	stb	%o5, [%g0 + %i1]
	.word	0xabb00fe0	! t0_kref+0x25a4:   	fones	%f21
	.word	0x9b336003	! t0_kref+0x25a8:   	srl	%o5, 0x3, %o5
	.word	0xb1a000af	! t0_kref+0x25ac:   	fnegs	%f15, %f24
	.word	0x93b340e8	! t0_kref+0x25b0:   	edge16ln	%o5, %o0, %o1
	.word	0x9da3482f	! t0_kref+0x25b4:   	fadds	%f13, %f15, %f14
	.word	0xf7ee501d	! t0_kref+0x25b8:   	prefetcha	%i1 + %i5, 27
	.word	0xaa36b9c5	! t0_kref+0x25bc:   	orn	%i2, -0x63b, %l5
	.word	0x24800003	! t0_kref+0x25c0:   	ble,a	_kref+0x25cc
	.word	0x992a201b	! t0_kref+0x25c4:   	sll	%o0, 0x1b, %o4
	.word	0xd22e6008	! t0_kref+0x25c8:   	stb	%o1, [%i1 + 8]
	.word	0xaab2b3cb	! t0_kref+0x25cc:   	orncc	%o2, -0xc35, %l5
	.word	0xae70000a	! t0_kref+0x25d0:   	udiv	%g0, %o2, %l7
	.word	0x9fc00004	! t0_kref+0x25d4:   	call	%g0 + %g4
	.word	0x91302018	! t0_kref+0x25d8:   	srl	%g0, 0x18, %o0
	.word	0xf91e7ff8	! t0_kref+0x25dc:   	ldd	[%i1 - 8], %f28
	.word	0xa5b00cda	! t0_kref+0x25e0:   	fnot2	%f26, %f18
	.word	0x99b009bc	! t0_kref+0x25e4:   	fexpand	%f28, %f12
	.word	0x26480002	! t0_kref+0x25e8:   	bl,a,pt	%icc, _kref+0x25f0
	.word	0x99a408d6	! t0_kref+0x25ec:   	fsubd	%f16, %f22, %f12
	.word	0xefee501d	! t0_kref+0x25f0:   	prefetcha	%i1 + %i5, 23
	.word	0xb9a01932	! t0_kref+0x25f4:   	fstod	%f18, %f28
	.word	0xd030a008	! t0_kref+0x25f8:   	sth	%o0, [%g2 + 8]
	.word	0xaba01a58	! t0_kref+0x25fc:   	fdtoi	%f24, %f21
	.word	0xb7b4cdfe	! t0_kref+0x2600:   	fnands	%f19, %f30, %f27
	.word	0xd868a001	! t0_kref+0x2604:   	ldstub	[%g2 + 1], %o4
	.word	0x9a75400a	! t0_kref+0x2608:   	udiv	%l5, %o2, %o5
	.word	0x81af0a33	! t0_kref+0x260c:   	fcmps	%fcc0, %f28, %f19
	.word	0x9da30833	! t0_kref+0x2610:   	fadds	%f12, %f19, %f14
	.word	0xa5a00533	! t0_kref+0x2614:   	fsqrts	%f19, %f18
	.word	0x8185c000	! t0_kref+0x2618:   	wr	%l7, %g0, %y
	.word	0xd8567fe0	! t0_kref+0x261c:   	ldsh	[%i1 - 0x20], %o4
	.word	0xa8e28017	! t0_kref+0x2620:   	subccc	%o2, %l7, %l4
	.word	0xe4180019	! t0_kref+0x2624:   	ldd	[%g0 + %i1], %l2
	.word	0xbdb00c00	! t0_kref+0x2628:   	fzero	%f30
	.word	0xc028a017	! t0_kref+0x262c:   	clrb	[%g2 + 0x17]
	.word	0xa9a01a33	! t0_kref+0x2630:   	fstoi	%f19, %f20
	.word	0xa1b48670	! t0_kref+0x2634:   	fmul8x16au	%f18, %f16, %f16
	.word	0xd6f61000	! t0_kref+0x2638:   	stxa	%o3, [%i0]0x80
	.word	0xa1b58e56	! t0_kref+0x263c:   	fxnor	%f22, %f22, %f16
	.word	0x9853000b	! t0_kref+0x2640:   	umul	%o4, %o3, %o4
	.word	0x9af28016	! t0_kref+0x2644:   	udivcc	%o2, %l6, %o5
	.word	0x81858000	! t0_kref+0x2648:   	wr	%l6, %g0, %y
	.word	0x90257786	! t0_kref+0x264c:   	sub	%l5, -0x87a, %o0
	.word	0x9518000c	! t0_kref+0x2650:   	tsubcctv	%g0, %o4, %o2
	.word	0x81ae8a33	! t0_kref+0x2654:   	fcmps	%fcc0, %f26, %f19
	.word	0xa5a01a2f	! t0_kref+0x2658:   	fstoi	%f15, %f18
	.word	0x81800000	! t0_kref+0x265c:   	mov	%g0, %y
	.word	0x94deaefa	! t0_kref+0x2660:   	smulcc	%i2, 0xefa, %o2
	.word	0x90b5687a	! t0_kref+0x2664:   	orncc	%l5, 0x87a, %o0
	.word	0xe8563ff6	! t0_kref+0x2668:   	ldsh	[%i0 - 0xa], %l4
	.word	0xbbb40ea0	! t0_kref+0x266c:   	fsrc1s	%f16, %f29
	.word	0x26800008	! t0_kref+0x2670:   	bl,a	_kref+0x2690
	.word	0xdf270019	! t0_kref+0x2674:   	st	%f15, [%i4 + %i1]
	.word	0xee6e8019	! t0_kref+0x2678:   	ldstub	[%i2 + %i1], %l7
	call	SYM(t0_subr2)
	.word	0xabb3855a	! t0_kref+0x2680:   	fcmpeq16	%f14, %f26, %l5
	.word	0x92f3234f	! t0_kref+0x2684:   	udivcc	%o4, 0x34f, %o1
	.word	0xacb27cb9	! t0_kref+0x2688:   	orncc	%o1, -0x347, %l6
	.word	0xb3a01a4c	! t0_kref+0x268c:   	fdtoi	%f12, %f25
	.word	0xe456201e	! t0_kref+0x2690:   	ldsh	[%i0 + 0x1e], %l2
	.word	0x38800002	! t0_kref+0x2694:   	bgu,a	_kref+0x269c
	.word	0xd5f6100c	! t0_kref+0x2698:   	casxa	[%i0]0x80, %o4, %o2
	.word	0x26480006	! t0_kref+0x269c:   	bl,a,pt	%icc, _kref+0x26b4
	.word	0xd428a03f	! t0_kref+0x26a0:   	stb	%o2, [%g2 + 0x3f]
	call	SYM(t0_subr0)
	.word	0xb9b34df2	! t0_kref+0x26a8:   	fnands	%f13, %f18, %f28
	.word	0x21480004	! t0_kref+0x26ac:   	fbn,a,pt	%fcc0, _kref+0x26bc
	.word	0xabb2c280	! t0_kref+0x26b0:   	array32	%o3, %g0, %l5
	.word	0xa9b2411a	! t0_kref+0x26b4:   	edge32	%o1, %i2, %l4
	.word	0xafa0013c	! t0_kref+0x26b8:   	fabss	%f28, %f23
	.word	0x99a01918	! t0_kref+0x26bc:   	fitod	%f24, %f12
	.word	0x9db58d40	! t0_kref+0x26c0:   	fnot1	%f22, %f14
	.word	0xb1a01a34	! t0_kref+0x26c4:   	fstoi	%f20, %f24
	.word	0xaa9ea9a7	! t0_kref+0x26c8:   	xorcc	%i2, 0x9a7, %l5
	.word	0x900b4009	! t0_kref+0x26cc:   	and	%o5, %o1, %o0
	.word	0x8143c000	! t0_kref+0x26d0:   	stbar
	.word	0x96282dee	! t0_kref+0x26d4:   	andn	%g0, 0xdee, %o3
	.word	0xb9b30712	! t0_kref+0x26d8:   	fmuld8sux16	%f12, %f18, %f28
	.word	0x949024ff	! t0_kref+0x26dc:   	orcc	%g0, 0x4ff, %o2
	.word	0xa6b0000c	! t0_kref+0x26e0:   	orncc	%g0, %o4, %l3
	.word	0xaa65ff7a	! t0_kref+0x26e4:   	subc	%l7, -0x86, %l5
	.word	0xa9a0053c	! t0_kref+0x26e8:   	fsqrts	%f28, %f20
	.word	0xe1060000	! t0_kref+0x26ec:   	ld	[%i0], %f16
	.word	0x9a82a514	! t0_kref+0x26f0:   	addcc	%o2, 0x514, %o5
	.word	0xc1ee5000	! t0_kref+0x26f4:   	prefetcha	%i1, 0
	.word	0xaab6a533	! t0_kref+0x26f8:   	orncc	%i2, 0x533, %l5
	.word	0xe8c71018	! t0_kref+0x26fc:   	ldswa	[%i4 + %i0]0x80, %l4
	.word	0xd036c018	! t0_kref+0x2700:   	sth	%o0, [%i3 + %i0]
	.word	0xa4e2e859	! t0_kref+0x2704:   	subccc	%o3, 0x859, %l2
	.word	0x9072ec64	! t0_kref+0x2708:   	udiv	%o3, 0xc64, %o0
	.word	0x3d800008	! t0_kref+0x270c:   	fbule,a	_kref+0x272c
	.word	0x9e500016	! t0_kref+0x2710:   	umul	%g0, %l6, %o7
	.word	0xc0d6d019	! t0_kref+0x2714:   	ldsha	[%i3 + %i1]0x80, %g0
	.word	0xa1a01a4c	! t0_kref+0x2718:   	fdtoi	%f12, %f16
	.word	0xd47e0000	! t0_kref+0x271c:   	swap	[%i0], %o2
	.word	0xa422800c	! t0_kref+0x2720:   	sub	%o2, %o4, %l2
	.word	0xed1fbf90	! t0_kref+0x2724:   	ldd	[%fp - 0x70], %f22
	.word	0x99a0103a	! t0_kref+0x2728:   	fstox	%f26, %f12
	.word	0x81ac8a54	! t0_kref+0x272c:   	fcmpd	%fcc0, %f18, %f20
	.word	0x81400000	! t0_kref+0x2730:   	mov	%y, %g0
	.word	0xa8136426	! t0_kref+0x2734:   	or	%o5, 0x426, %l4
	.word	0x96a2ae38	! t0_kref+0x2738:   	subcc	%o2, 0xe38, %o3
	.word	0x93400000	! t0_kref+0x273c:   	mov	%y, %o1
	.word	0xc5ee1015	! t0_kref+0x2740:   	prefetcha	%i0 + %l5, 2
	.word	0x949aa3e4	! t0_kref+0x2744:   	xorcc	%o2, 0x3e4, %o2
	.word	0x90532fe2	! t0_kref+0x2748:   	umul	%o4, 0xfe2, %o0
	.word	0xd91fbce0	! t0_kref+0x274c:   	ldd	[%fp - 0x320], %f12
	.word	0x39800006	! t0_kref+0x2750:   	fbuge,a	_kref+0x2768
	.word	0xc0c6101c	! t0_kref+0x2754:   	ldswa	[%i0 + %i4]0x80, %g0
	.word	0x99b2c017	! t0_kref+0x2758:   	edge8	%o3, %l7, %o4
	.word	0x98e031a4	! t0_kref+0x275c:   	subccc	%g0, -0xe5c, %o4
	.word	0x81af8a31	! t0_kref+0x2760:   	fcmps	%fcc0, %f30, %f17
	.word	0x9eda7dae	! t0_kref+0x2764:   	smulcc	%o1, -0x252, %o7
	.word	0xad2a8017	! t0_kref+0x2768:   	sll	%o2, %l7, %l6
	.word	0xa7158000	! t0_kref+0x276c:   	taddcctv	%l6, %g0, %l3
	.word	0x9202f875	! t0_kref+0x2770:   	add	%o3, -0x78b, %o1
	.word	0x93b68200	! t0_kref+0x2774:   	array8	%i2, %g0, %o1
	.word	0x9b400000	! t0_kref+0x2778:   	mov	%y, %o5
	.word	0x32480005	! t0_kref+0x277c:   	bne,a,pt	%icc, _kref+0x2790
	.word	0xfb20a008	! t0_kref+0x2780:   	st	%f29, [%g2 + 8]
	.word	0xb5a00554	! t0_kref+0x2784:   	fsqrtd	%f20, %f26
	.word	0xa9b60c98	! t0_kref+0x2788:   	fandnot2	%f24, %f24, %f20
	.word	0x98934009	! t0_kref+0x278c:   	orcc	%o5, %o1, %o4
	.word	0xa1a40858	! t0_kref+0x2790:   	faddd	%f16, %f24, %f16
	.word	0x9053703a	! t0_kref+0x2794:   	umul	%o5, -0xfc6, %o0
	.word	0xd9be1817	! t0_kref+0x2798:   	stda	%f12, [%i0 + %l7]0xc0
	.word	0x99a589de	! t0_kref+0x279c:   	fdivd	%f22, %f30, %f12
	.word	0xb9a0190f	! t0_kref+0x27a0:   	fitod	%f15, %f28
	.word	0x9632ea00	! t0_kref+0x27a4:   	orn	%o3, 0xa00, %o3
	.word	0x34480001	! t0_kref+0x27a8:   	bg,a,pt	%icc, _kref+0x27ac
	.word	0xa872400d	! t0_kref+0x27ac:   	udiv	%o1, %o5, %l4
	.word	0xfb00a038	! t0_kref+0x27b0:   	ld	[%g2 + 0x38], %f29
	.word	0x3a480005	! t0_kref+0x27b4:   	bcc,a,pt	%icc, _kref+0x27c8
	.word	0xd27e401c	! t0_kref+0x27b8:   	swap	[%i1 + %i4], %o1
	.word	0x99418000	! t0_kref+0x27bc:   	mov	%fprs, %o4
	.word	0xc0480019	! t0_kref+0x27c0:   	ldsb	[%g0 + %i1], %g0
	.word	0xbba0052c	! t0_kref+0x27c4:   	fsqrts	%f12, %f29
	.word	0x96dabfa0	! t0_kref+0x27c8:   	smulcc	%o2, -0x60, %o3
	.word	0xdd180018	! t0_kref+0x27cc:   	ldd	[%g0 + %i0], %f14
	.word	0x81ac0ace	! t0_kref+0x27d0:   	fcmped	%fcc0, %f16, %f14
	.word	0xac1b001a	! t0_kref+0x27d4:   	xor	%o4, %i2, %l6
	.word	0xd9be180a	! t0_kref+0x27d8:   	stda	%f12, [%i0 + %o2]0xc0
	.word	0x9fa01899	! t0_kref+0x27dc:   	fitos	%f25, %f15
	.word	0xea4e0000	! t0_kref+0x27e0:   	ldsb	[%i0], %l5
	.word	0x9265400d	! t0_kref+0x27e4:   	subc	%l5, %o5, %o1
	.word	0xa825e276	! t0_kref+0x27e8:   	sub	%l7, 0x276, %l4
	.word	0x2b480003	! t0_kref+0x27ec:   	fbug,a,pt	%fcc0, _kref+0x27f8
	.word	0x81800000	! t0_kref+0x27f0:   	mov	%g0, %y
	.word	0x3b800005	! t0_kref+0x27f4:   	fble,a	_kref+0x2808
	.word	0x9aaa6194	! t0_kref+0x27f8:   	andncc	%o1, 0x194, %o5
	.word	0x81dac01e	! t0_kref+0x27fc:   	flush	%o3 + %fp
	.word	0x31800003	! t0_kref+0x2800:   	fba,a	_kref+0x280c
	.word	0xaad26697	! t0_kref+0x2804:   	umulcc	%o1, 0x697, %l5
	.word	0xa7b30dee	! t0_kref+0x2808:   	fnands	%f12, %f14, %f19
	.word	0x9de3bfa0	! t0_kref+0x280c:   	save	%sp, -0x60, %sp
	.word	0x80583e8e	! t0_kref+0x2810:   	smul	%g0, -0x172, %g0
	.word	0x91ee401c	! t0_kref+0x2814:   	restore	%i1, %i4, %o0
	.word	0x9fc00004	! t0_kref+0x2818:   	call	%g0 + %g4
	.word	0x99b0012b	! t0_kref+0x281c:   	edge32n	%g0, %o3, %o4
	.word	0xa9220016	! t0_kref+0x2820:   	mulscc	%o0, %l6, %l4
	.word	0xbba018da	! t0_kref+0x2824:   	fdtos	%f26, %f29
	.word	0xb1b406ec	! t0_kref+0x2828:   	fmul8ulx16	%f16, %f12, %f24
	.word	0x9de3bfa0	! t0_kref+0x282c:   	save	%sp, -0x60, %sp
	.word	0xa9e83be7	! t0_kref+0x2830:   	restore	%g0, -0x419, %l4
	.word	0xd206001c	! t0_kref+0x2834:   	ld	[%i0 + %i4], %o1
	.word	0xef200019	! t0_kref+0x2838:   	st	%f23, [%g0 + %i1]
	.word	0xa9b30015	! t0_kref+0x283c:   	edge8	%o4, %l5, %l4
	.word	0xac358008	! t0_kref+0x2840:   	orn	%l6, %o0, %l6
	.word	0xa5b3c714	! t0_kref+0x2844:   	fmuld8sux16	%f15, %f20, %f18
	.word	0xee462000	! t0_kref+0x2848:   	ldsw	[%i0], %l7
	.word	0x99b00fc0	! t0_kref+0x284c:   	fone	%f12
	.word	0xada00556	! t0_kref+0x2850:   	fsqrtd	%f22, %f22
	.word	0x929af3c3	! t0_kref+0x2854:   	xorcc	%o3, -0xc3d, %o1
	.word	0x3c800004	! t0_kref+0x2858:   	bpos,a	_kref+0x2868
	.word	0x908b001a	! t0_kref+0x285c:   	andcc	%o4, %i2, %o0
	.word	0xe9be5800	! t0_kref+0x2860:   	stda	%f20, [%i1]0xc0
	.word	0xa9a00552	! t0_kref+0x2864:   	fsqrtd	%f18, %f20
	.word	0x8143c000	! t0_kref+0x2868:   	stbar
	.word	0xe9266018	! t0_kref+0x286c:   	st	%f20, [%i1 + 0x18]
	.word	0x9fa0052d	! t0_kref+0x2870:   	fsqrts	%f13, %f15
	.word	0xa83dc017	! t0_kref+0x2874:   	xnor	%l7, %l7, %l4
	.word	0xd64e7fed	! t0_kref+0x2878:   	ldsb	[%i1 - 0x13], %o3
	.word	0x28480004	! t0_kref+0x287c:   	bleu,a,pt	%icc, _kref+0x288c
	.word	0xd420a030	! t0_kref+0x2880:   	st	%o2, [%g2 + 0x30]
	.word	0x9db70dee	! t0_kref+0x2884:   	fnands	%f28, %f14, %f14
	.word	0x99b58d16	! t0_kref+0x2888:   	fandnot1	%f22, %f22, %f12
	.word	0xa9a01a31	! t0_kref+0x288c:   	fstoi	%f17, %f20
	.word	0xbba000b2	! t0_kref+0x2890:   	fnegs	%f18, %f29
	.word	0xa695b7ed	! t0_kref+0x2894:   	orcc	%l6, -0x813, %l3
	.word	0xa65b000b	! t0_kref+0x2898:   	smul	%o4, %o3, %l3
	.word	0xa3a018d8	! t0_kref+0x289c:   	fdtos	%f24, %f17
	.word	0xe808a025	! t0_kref+0x28a0:   	ldub	[%g2 + 0x25], %l4
	.word	0xe5f65016	! t0_kref+0x28a4:   	casxa	[%i1]0x80, %l6, %l2
	.word	0xc807bfe8	! t0_kref+0x28a8:   	ld	[%fp - 0x18], %g4
	.word	0x9da6cd3a	! t0_kref+0x28ac:   	fsmuld	%f27, %f26, %f14
	.word	0x81ab4a38	! t0_kref+0x28b0:   	fcmps	%fcc0, %f13, %f24
	.word	0xacb8000d	! t0_kref+0x28b4:   	xnorcc	%g0, %o5, %l6
	.word	0x34800006	! t0_kref+0x28b8:   	bg,a	_kref+0x28d0
	.word	0xa9a01a3a	! t0_kref+0x28bc:   	fstoi	%f26, %f20
	.word	0xac75ab14	! t0_kref+0x28c0:   	udiv	%l6, 0xb14, %l6
	.word	0x9fb74d32	! t0_kref+0x28c4:   	fandnot1s	%f29, %f18, %f15
	.word	0x81ab0a3b	! t0_kref+0x28c8:   	fcmps	%fcc0, %f12, %f27
	.word	0xada409d4	! t0_kref+0x28cc:   	fdivd	%f16, %f20, %f22
	.word	0xa9a01a52	! t0_kref+0x28d0:   	fdtoi	%f18, %f20
	.word	0xaafdc009	! t0_kref+0x28d4:   	sdivcc	%l7, %o1, %l5
	.word	0x962aaff3	! t0_kref+0x28d8:   	andn	%o2, 0xff3, %o3
	.word	0xada8804c	! t0_kref+0x28dc:   	fmovdlg	%fcc0, %f12, %f22
	.word	0xa5a0055c	! t0_kref+0x28e0:   	fsqrtd	%f28, %f18
	.word	0xa9b68200	! t0_kref+0x28e4:   	array8	%i2, %g0, %l4
	.word	0xbbb00fe0	! t0_kref+0x28e8:   	fones	%f29
	.word	0xada000b3	! t0_kref+0x28ec:   	fnegs	%f19, %f22
	.word	0x9e65e247	! t0_kref+0x28f0:   	subc	%l7, 0x247, %o7
	.word	0x8143e040	! t0_kref+0x28f4:   	membar	0x40
	.word	0x3b800004	! t0_kref+0x28f8:   	fble,a	_kref+0x2908
	.word	0xa7408000	! t0_kref+0x28fc:   	mov	%ccr, %l3
	.word	0xacba6970	! t0_kref+0x2900:   	xnorcc	%o1, 0x970, %l6
	.word	0x9fa0188c	! t0_kref+0x2904:   	fitos	%f12, %f15
	.word	0xf1200019	! t0_kref+0x2908:   	st	%f24, [%g0 + %i1]
	.word	0x9e0eb5cc	! t0_kref+0x290c:   	and	%i2, -0xa34, %o7
	.word	0xdd00a038	! t0_kref+0x2910:   	ld	[%g2 + 0x38], %f14
	.word	0xde06401c	! t0_kref+0x2914:   	ld	[%i1 + %i4], %o7
	.word	0x8055400d	! t0_kref+0x2918:   	umul	%l5, %o5, %g0
	.word	0xa92324a8	! t0_kref+0x291c:   	mulscc	%o4, 0x4a8, %l4
	.word	0xf51fbf68	! t0_kref+0x2920:   	ldd	[%fp - 0x98], %f26
	.word	0xa90362b2	! t0_kref+0x2924:   	taddcc	%o5, 0x2b2, %l4
	.word	0x1935ca69	! t0_kref+0x2928:   	sethi	%hi(0xd729a400), %o4
	.word	0xbda00036	! t0_kref+0x292c:   	fmovs	%f22, %f30
	.word	0xf4280019	! t0_kref+0x2930:   	stb	%i2, [%g0 + %i1]
	.word	0x22800006	! t0_kref+0x2934:   	be,a	_kref+0x294c
	.word	0xb7b00cf9	! t0_kref+0x2938:   	fnot2s	%f25, %f27
	.word	0xe76e6018	! t0_kref+0x293c:   	prefetch	%i1 + 0x18, 19
	.word	0xacd34008	! t0_kref+0x2940:   	umulcc	%o5, %o0, %l6
	.word	0x3c480008	! t0_kref+0x2944:   	bpos,a,pt	%icc, _kref+0x2964
	.word	0xec7e401c	! t0_kref+0x2948:   	swap	[%i1 + %i4], %l6
	.word	0x9db506d4	! t0_kref+0x294c:   	fmul8sux16	%f20, %f20, %f14
	.word	0xa8aa7541	! t0_kref+0x2950:   	andncc	%o1, -0xabf, %l4
	.word	0xdaa01019	! t0_kref+0x2954:   	sta	%o5, [%g0 + %i1]0x80
	.word	0x99b60d18	! t0_kref+0x2958:   	fandnot1	%f24, %f24, %f12
	.word	0x8035c017	! t0_kref+0x295c:   	orn	%l7, %l7, %g0
	.word	0x9eda7cca	! t0_kref+0x2960:   	smulcc	%o1, -0x336, %o7
	.word	0x2f800008	! t0_kref+0x2964:   	fbu,a	_kref+0x2984
	.word	0x8143c000	! t0_kref+0x2968:   	stbar
	.word	0x8143c000	! t0_kref+0x296c:   	stbar
	.word	0x9b22e09c	! t0_kref+0x2970:   	mulscc	%o3, 0x9c, %o5
	.word	0x3a480002	! t0_kref+0x2974:   	bcc,a,pt	%icc, _kref+0x297c
	.word	0xda46600c	! t0_kref+0x2978:   	ldsw	[%i1 + 0xc], %o5
	.word	0xa9a00552	! t0_kref+0x297c:   	fsqrtd	%f18, %f20
	.word	0xb7a0052d	! t0_kref+0x2980:   	fsqrts	%f13, %f27
	.word	0x3c480004	! t0_kref+0x2984:   	bpos,a,pt	%icc, _kref+0x2994
	.word	0x911aa7e8	! t0_kref+0x2988:   	tsubcctv	%o2, 0x7e8, %o0
	.word	0xed263ff0	! t0_kref+0x298c:   	st	%f22, [%i0 - 0x10]
	.word	0x94368017	! t0_kref+0x2990:   	orn	%i2, %l7, %o2
	.word	0xbba01a35	! t0_kref+0x2994:   	fstoi	%f21, %f29
	.word	0x808b23ba	! t0_kref+0x2998:   	btst	0x3ba, %o4
	.word	0xa5a88054	! t0_kref+0x299c:   	fmovdlg	%fcc0, %f20, %f18
	.word	0x80e54000	! t0_kref+0x29a0:   	subccc	%l5, %g0, %g0
	.word	0x3d480008	! t0_kref+0x29a4:   	fbule,a,pt	%fcc0, _kref+0x29c4
	.word	0xafb54a73	! t0_kref+0x29a8:   	fpadd32s	%f21, %f19, %f23
	.word	0xe8566010	! t0_kref+0x29ac:   	ldsh	[%i1 + 0x10], %l4
	.word	0xacf5801a	! t0_kref+0x29b0:   	udivcc	%l6, %i2, %l6
	.word	0xabb200ea	! t0_kref+0x29b4:   	edge16ln	%o0, %o2, %l5
	.word	0xae1ab761	! t0_kref+0x29b8:   	xor	%o2, -0x89f, %l7
	.word	0xe81e4000	! t0_kref+0x29bc:   	ldd	[%i1], %l4
	.word	0xe8060000	! t0_kref+0x29c0:   	ld	[%i0], %l4
	.word	0x1323bc20	! t0_kref+0x29c4:   	sethi	%hi(0x8ef08000), %o1
	.word	0xa9b70f94	! t0_kref+0x29c8:   	for	%f28, %f20, %f20
	.word	0xf3067fe0	! t0_kref+0x29cc:   	ld	[%i1 - 0x20], %f25
	.word	0xec36001b	! t0_kref+0x29d0:   	sth	%l6, [%i0 + %i3]
	.word	0x9e957e6a	! t0_kref+0x29d4:   	orcc	%l5, -0x196, %o7
	.word	0x26800008	! t0_kref+0x29d8:   	bl,a	_kref+0x29f8
	.word	0xa7a5892d	! t0_kref+0x29dc:   	fmuls	%f22, %f13, %f19
	.word	0xe96e401b	! t0_kref+0x29e0:   	prefetch	%i1 + %i3, 20
	.word	0xdece501a	! t0_kref+0x29e4:   	ldsba	[%i1 + %i2]0x80, %o7
	.word	0xa9a0190e	! t0_kref+0x29e8:   	fitod	%f14, %f20
	.word	0x20480007	! t0_kref+0x29ec:   	bn,a,pt	%icc, _kref+0x2a08
	.word	0xe9062010	! t0_kref+0x29f0:   	ld	[%i0 + 0x10], %f20
	.word	0x93b5c14a	! t0_kref+0x29f4:   	edge32l	%l7, %o2, %o1
	.word	0x96ab28b2	! t0_kref+0x29f8:   	andncc	%o4, 0x8b2, %o3
	.word	0x91b68160	! t0_kref+0x29fc:   	edge32ln	%i2, %g0, %o0
	.word	0x9e23400c	! t0_kref+0x2a00:   	sub	%o5, %o4, %o7
	.word	0x97b684d6	! t0_kref+0x2a04:   	fcmpne32	%f26, %f22, %o3
	.word	0xa5702c7b	! t0_kref+0x2a08:   	popc	0xc7b, %l2
	.word	0x99a0054c	! t0_kref+0x2a0c:   	fsqrtd	%f12, %f12
	.word	0xb1a00558	! t0_kref+0x2a10:   	fsqrtd	%f24, %f24
	.word	0xdb200018	! t0_kref+0x2a14:   	st	%f13, [%g0 + %i0]
	.word	0xed20a020	! t0_kref+0x2a18:   	st	%f22, [%g2 + 0x20]
	.word	0x9076b83a	! t0_kref+0x2a1c:   	udiv	%i2, -0x7c6, %o0
	.word	0xb5a3cd30	! t0_kref+0x2a20:   	fsmuld	%f15, %f16, %f26
	.word	0xa1b70edc	! t0_kref+0x2a24:   	fornot2	%f28, %f28, %f16
	.word	0xe968a086	! t0_kref+0x2a28:   	prefetch	%g2 + 0x86, 20
	.word	0xd4280018	! t0_kref+0x2a2c:   	stb	%o2, [%g0 + %i0]
	.word	0xa7b58200	! t0_kref+0x2a30:   	array8	%l6, %g0, %l3
	.word	0xb9a708d8	! t0_kref+0x2a34:   	fsubd	%f28, %f24, %f28
	.word	0x9ad54017	! t0_kref+0x2a38:   	umulcc	%l5, %l7, %o5
	.word	0xb5a0189c	! t0_kref+0x2a3c:   	fitos	%f28, %f26
	.word	0x99a709d8	! t0_kref+0x2a40:   	fdivd	%f28, %f24, %f12
	.word	0xa7b4cd60	! t0_kref+0x2a44:   	fnot1s	%f19, %f19
	.word	0xb9b38ade	! t0_kref+0x2a48:   	fpsub32	%f14, %f30, %f28
	.word	0x33800001	! t0_kref+0x2a4c:   	fbe,a	_kref+0x2a50
	.word	0xd86e2002	! t0_kref+0x2a50:   	ldstub	[%i0 + 2], %o4
	.word	0xf900a024	! t0_kref+0x2a54:   	ld	[%g2 + 0x24], %f28
	.word	0x2d1f8b05	! t0_kref+0x2a58:   	sethi	%hi(0x7e2c1400), %l6
	.word	0x9db60e3a	! t0_kref+0x2a5c:   	fands	%f24, %f26, %f14
	.word	0x3a480004	! t0_kref+0x2a60:   	bcc,a,pt	%icc, _kref+0x2a70
	.word	0x99408000	! t0_kref+0x2a64:   	mov	%ccr, %o4
	.word	0x1b3d2620	! t0_kref+0x2a68:   	sethi	%hi(0xf4988000), %o5
	.word	0xd06e6000	! t0_kref+0x2a6c:   	ldstub	[%i1], %o0
	.word	0xf99e5a1d	! t0_kref+0x2a70:   	ldda	[%i1 + %i5]0xd0, %f28
	.word	0xee30a036	! t0_kref+0x2a74:   	sth	%l7, [%g2 + 0x36]
	.word	0xa9a0110c	! t0_kref+0x2a78:   	fxtod	%f12, %f20
	.word	0x9056b2af	! t0_kref+0x2a7c:   	umul	%i2, -0xd51, %o0
	.word	0xec3e6000	! t0_kref+0x2a80:   	std	%l6, [%i1]
	.word	0x81580000	! t0_kref+0x2a84:   	flushw
	.word	0x98468008	! t0_kref+0x2a88:   	addc	%i2, %o0, %o4
	.word	0xae722b15	! t0_kref+0x2a8c:   	udiv	%o0, 0xb15, %l7
	.word	0x99a01a2d	! t0_kref+0x2a90:   	fstoi	%f13, %f12
	.word	0x33800005	! t0_kref+0x2a94:   	fbe,a	_kref+0x2aa8
	.word	0xa81af512	! t0_kref+0x2a98:   	xor	%o3, -0xaee, %l4
	.word	0x969d4015	! t0_kref+0x2a9c:   	xorcc	%l5, %l5, %o3
	.word	0xb5a00556	! t0_kref+0x2aa0:   	fsqrtd	%f22, %f26
	.word	0xd648a024	! t0_kref+0x2aa4:   	ldsb	[%g2 + 0x24], %o3
	.word	0x93400000	! t0_kref+0x2aa8:   	mov	%y, %o1
	.word	0xadb00117	! t0_kref+0x2aac:   	edge32	%g0, %l7, %l6
	.word	0x8d828009	! t0_kref+0x2ab0:   	wr	%o2, %o1, %fprs
	.word	0x9410000a	! t0_kref+0x2ab4:   	mov	%o2, %o2
	.word	0xab22c00d	! t0_kref+0x2ab8:   	mulscc	%o3, %o5, %l5
	.word	0x99a01033	! t0_kref+0x2abc:   	fstox	%f19, %f12
	.word	0xac1dc00d	! t0_kref+0x2ac0:   	xor	%l7, %o5, %l6
	.word	0xaae24017	! t0_kref+0x2ac4:   	subccc	%o1, %l7, %l5
	.word	0xd62e401a	! t0_kref+0x2ac8:   	stb	%o3, [%i1 + %i2]
	.word	0xd24e6001	! t0_kref+0x2acc:   	ldsb	[%i1 + 1], %o1
	.word	0x96934016	! t0_kref+0x2ad0:   	orcc	%o5, %l6, %o3
	.word	0x81ad8a3c	! t0_kref+0x2ad4:   	fcmps	%fcc0, %f22, %f28
	.word	0xda363ffe	! t0_kref+0x2ad8:   	sth	%o5, [%i0 - 2]
	.word	0x908d6bf7	! t0_kref+0x2adc:   	andcc	%l5, 0xbf7, %o0
	.word	0xaca2e0b7	! t0_kref+0x2ae0:   	subcc	%o3, 0xb7, %l6
	.word	0x94f54015	! t0_kref+0x2ae4:   	udivcc	%l5, %l5, %o2
	.word	0xa3a01a5c	! t0_kref+0x2ae8:   	fdtoi	%f28, %f17
	.word	0xaa5a0008	! t0_kref+0x2aec:   	smul	%o0, %o0, %l5
	.word	0xa9b6063c	! t0_kref+0x2af0:   	fmul8x16	%f24, %f28, %f20
	.word	0x805df89c	! t0_kref+0x2af4:   	smul	%l7, -0x764, %g0
	.word	0xea2e8019	! t0_kref+0x2af8:   	stb	%l5, [%i2 + %i1]
	.word	0xa1a0055c	! t0_kref+0x2afc:   	fsqrtd	%f28, %f16
	.word	0xd8ae9019	! t0_kref+0x2b00:   	stba	%o4, [%i2 + %i1]0x80
	.word	0x34480002	! t0_kref+0x2b04:   	bg,a,pt	%icc, _kref+0x2b0c
	.word	0xd8200018	! t0_kref+0x2b08:   	st	%o4, [%g0 + %i0]
	.word	0x907a7c74	! t0_kref+0x2b0c:   	sdiv	%o1, -0x38c, %o0
	.word	0xb3b64a36	! t0_kref+0x2b10:   	fpadd16s	%f25, %f22, %f25
	.word	0xaf332012	! t0_kref+0x2b14:   	srl	%o4, 0x12, %l7
	.word	0x92ab400a	! t0_kref+0x2b18:   	andncc	%o5, %o2, %o1
	.word	0xada64d2c	! t0_kref+0x2b1c:   	fsmuld	%f25, %f12, %f22
	.word	0x97400000	! t0_kref+0x2b20:   	mov	%y, %o3
	.word	0xaca82d4e	! t0_kref+0x2b24:   	andncc	%g0, 0xd4e, %l6
	.word	0xa9b38e14	! t0_kref+0x2b28:   	fand	%f14, %f20, %f20
	.word	0xa4f2f6a4	! t0_kref+0x2b2c:   	udivcc	%o3, -0x95c, %l2
	.word	0x99a489ce	! t0_kref+0x2b30:   	fdivd	%f18, %f14, %f12
	.word	0xe11e3ff0	! t0_kref+0x2b34:   	ldd	[%i0 - 0x10], %f16
	.word	0xe1070018	! t0_kref+0x2b38:   	ld	[%i4 + %i0], %f16
	.word	0xd8ce5000	! t0_kref+0x2b3c:   	ldsba	[%i1]0x80, %o4
	.word	0x920a000b	! t0_kref+0x2b40:   	and	%o0, %o3, %o1
	.word	0xd41f4018	! t0_kref+0x2b44:   	ldd	[%i5 + %i0], %o2
	.word	0xde40a000	! t0_kref+0x2b48:   	ldsw	[%g2], %o7
	.word	0xda270019	! t0_kref+0x2b4c:   	st	%o5, [%i4 + %i1]
	.word	0xf207bfe0	! t0_kref+0x2b50:   	ld	[%fp - 0x20], %i1
	.word	0x27800005	! t0_kref+0x2b54:   	fbul,a	_kref+0x2b68
	.word	0xb3b74ea0	! t0_kref+0x2b58:   	fsrc1s	%f29, %f25
	.word	0xa1a01094	! t0_kref+0x2b5c:   	fxtos	%f20, %f16
	.word	0xf920a014	! t0_kref+0x2b60:   	st	%f28, [%g2 + 0x14]
	.word	0xa940c000	! t0_kref+0x2b64:   	mov	%asi, %l4
	.word	0x9325a95a	! t0_kref+0x2b68:   	mulscc	%l6, 0x95a, %o1
	.word	0x3e480008	! t0_kref+0x2b6c:   	bvc,a,pt	%icc, _kref+0x2b8c
	.word	0xee070019	! t0_kref+0x2b70:   	ld	[%i4 + %i1], %l7
	.word	0xebe61017	! t0_kref+0x2b74:   	casa	[%i0]0x80, %l7, %l5
	.word	0xa8aa000a	! t0_kref+0x2b78:   	andncc	%o0, %o2, %l4
	.word	0x8182c000	! t0_kref+0x2b7c:   	wr	%o3, %g0, %y
	.word	0xdd1e401d	! t0_kref+0x2b80:   	ldd	[%i1 + %i5], %f14
	.word	0x80adb676	! t0_kref+0x2b84:   	andncc	%l6, -0x98a, %g0
	.word	0x3a480003	! t0_kref+0x2b88:   	bcc,a,pt	%icc, _kref+0x2b94
	.word	0x949b2ab7	! t0_kref+0x2b8c:   	xorcc	%o4, 0xab7, %o2
	.word	0xa88a800b	! t0_kref+0x2b90:   	andcc	%o2, %o3, %l4
	.word	0x2d480007	! t0_kref+0x2b94:   	fbg,a,pt	%fcc0, _kref+0x2bb0
	.word	0xb9a01930	! t0_kref+0x2b98:   	fstod	%f16, %f28
	.word	0xa5a0110e	! t0_kref+0x2b9c:   	fxtod	%f14, %f18
	.word	0xa9b58e4c	! t0_kref+0x2ba0:   	fxnor	%f22, %f12, %f20
	.word	0xb3b58df1	! t0_kref+0x2ba4:   	fnands	%f22, %f17, %f25
	.word	0xda4e200c	! t0_kref+0x2ba8:   	ldsb	[%i0 + 0xc], %o5
	.word	0xda28a03c	! t0_kref+0x2bac:   	stb	%o5, [%g2 + 0x3c]
	.word	0xa1a01a50	! t0_kref+0x2bb0:   	fdtoi	%f16, %f16
	.word	0xecee9018	! t0_kref+0x2bb4:   	ldstuba	[%i2 + %i0]0x80, %l6
	.word	0xadb00770	! t0_kref+0x2bb8:   	fpack16	%f16, %f22
	.word	0x3a800007	! t0_kref+0x2bbc:   	bcc,a	_kref+0x2bd8
	.word	0xe1be1800	! t0_kref+0x2bc0:   	stda	%f16, [%i0]0xc0
	.word	0xd41f4018	! t0_kref+0x2bc4:   	ldd	[%i5 + %i0], %o2
	.word	0x81b0004a	! t0_kref+0x2bc8:   	edge8l	%g0, %o2, %g0
	.word	0xadb5404c	! t0_kref+0x2bcc:   	edge8l	%l5, %o4, %l6
	.word	0xae82000c	! t0_kref+0x2bd0:   	addcc	%o0, %o4, %l7
	.word	0xec6e8018	! t0_kref+0x2bd4:   	ldstub	[%i2 + %i0], %l6
	.word	0x3e480008	! t0_kref+0x2bd8:   	bvc,a,pt	%icc, _kref+0x2bf8
	.word	0x9a1e800b	! t0_kref+0x2bdc:   	xor	%i2, %o3, %o5
	.word	0xf11e7ff0	! t0_kref+0x2be0:   	ldd	[%i1 - 0x10], %f24
	.word	0xa1a0053b	! t0_kref+0x2be4:   	fsqrts	%f27, %f16
	.word	0xaba0012f	! t0_kref+0x2be8:   	fabss	%f15, %f21
	.word	0xaa5aa6d9	! t0_kref+0x2bec:   	smul	%o2, 0x6d9, %l5
	.word	0xea7e2014	! t0_kref+0x2bf0:   	swap	[%i0 + 0x14], %l5
	.word	0x99b48af2	! t0_kref+0x2bf4:   	fpsub32s	%f18, %f18, %f12
	.word	0xea766018	! t0_kref+0x2bf8:   	stx	%l5, [%i1 + 0x18]
	.word	0xfbee501a	! t0_kref+0x2bfc:   	prefetcha	%i1 + %i2, 29
	.word	0xf9ee501a	! t0_kref+0x2c00:   	prefetcha	%i1 + %i2, 28
	.word	0x37800001	! t0_kref+0x2c04:   	fbge,a	_kref+0x2c08
	.word	0xb5a0193c	! t0_kref+0x2c08:   	fstod	%f28, %f26
	.word	0xea6e4000	! t0_kref+0x2c0c:   	ldstub	[%i1], %l5
	.word	0xa62b6e79	! t0_kref+0x2c10:   	andn	%o5, 0xe79, %l3
	.word	0xa7b2c140	! t0_kref+0x2c14:   	edge32l	%o3, %g0, %l3
	.word	0xd0000018	! t0_kref+0x2c18:   	ld	[%g0 + %i0], %o0
	.word	0x9ab5c00c	! t0_kref+0x2c1c:   	orncc	%l7, %o4, %o5
	call	1f
	.empty
	.word	0xd8a81018	! t0_kref+0x2c24:   	stba	%o4, [%g0 + %i0]0x80
	.word	0xa45ae685	! t0_kref+0x2c28:   	smul	%o3, 0x685, %l2
	.word	0xada748b2	! t0_kref+0x2c2c:   	fsubs	%f29, %f18, %f22
	.word	0x8143c000	! t0_kref+0x2c30:   	stbar
	.word	0xea063fe8	! t0_kref+0x2c34:   	ld	[%i0 - 0x18], %l5
	.word	0x2c480002	! t0_kref+0x2c38:   	bneg,a,pt	%icc, _kref+0x2c40
1:	.word	0xe51f4018	! t0_kref+0x2c3c:   	ldd	[%i5 + %i0], %f18
	.word	0xa1b406f0	! t0_kref+0x2c40:   	fmul8ulx16	%f16, %f16, %f16
	.word	0xa8720009	! t0_kref+0x2c44:   	udiv	%o0, %o1, %l4
	.word	0x33480001	! t0_kref+0x2c48:   	fbe,a,pt	%fcc0, _kref+0x2c4c
	.word	0xd6270018	! t0_kref+0x2c4c:   	st	%o3, [%i4 + %i0]
	.word	0x9285fcc0	! t0_kref+0x2c50:   	addcc	%l7, -0x340, %o1
	.word	0x98f24009	! t0_kref+0x2c54:   	udivcc	%o1, %o1, %o4
	.word	0xb1b38d2d	! t0_kref+0x2c58:   	fandnot1s	%f14, %f13, %f24
	.word	0xda5e3fe8	! t0_kref+0x2c5c:   	ldx	[%i0 - 0x18], %o5
	.word	0xa6154008	! t0_kref+0x2c60:   	or	%l5, %o0, %l3
	.word	0xebee101d	! t0_kref+0x2c64:   	prefetcha	%i0 + %i5, 21
	.word	0xa5a00554	! t0_kref+0x2c68:   	fsqrtd	%f20, %f18
	.word	0x961a400d	! t0_kref+0x2c6c:   	xor	%o1, %o5, %o3
	.word	0x2c800008	! t0_kref+0x2c70:   	bneg,a	_kref+0x2c90
	.word	0xecb01018	! t0_kref+0x2c74:   	stha	%l6, [%g0 + %i0]0x80
	.word	0xe84e401a	! t0_kref+0x2c78:   	ldsb	[%i1 + %i2], %l4
	.word	0xebee101b	! t0_kref+0x2c7c:   	prefetcha	%i0 + %i3, 21
	.word	0xd9be5a1c	! t0_kref+0x2c80:   	stda	%f12, [%i1 + %i4]0xd0
	.word	0x29480002	! t0_kref+0x2c84:   	fbl,a,pt	%fcc0, _kref+0x2c8c
	.word	0xa7b2c089	! t0_kref+0x2c88:   	edge16	%o3, %o1, %l3
	.word	0x2d39a692	! t0_kref+0x2c8c:   	sethi	%hi(0xe69a4800), %l6
	.word	0x32800002	! t0_kref+0x2c90:   	bne,a	_kref+0x2c98
	.word	0xae0d8017	! t0_kref+0x2c94:   	and	%l6, %l7, %l7
	.word	0xaba000be	! t0_kref+0x2c98:   	fnegs	%f30, %f21
	.word	0xed9e5000	! t0_kref+0x2c9c:   	ldda	[%i1]0x80, %f22
	.word	0x9116b430	! t0_kref+0x2ca0:   	taddcctv	%i2, -0xbd0, %o0
	.word	0x9a2ab2a5	! t0_kref+0x2ca4:   	andn	%o2, -0xd5b, %o5
	.word	0x81580000	! t0_kref+0x2ca8:   	flushw
	.word	0xc0000019	! t0_kref+0x2cac:   	ld	[%g0 + %i1], %g0
	.word	0xafa00137	! t0_kref+0x2cb0:   	fabss	%f23, %f23
	.word	0xb3a0013e	! t0_kref+0x2cb4:   	fabss	%f30, %f25
	.word	0x9fc00004	! t0_kref+0x2cb8:   	call	%g0 + %g4
	.word	0xa144c000	! t0_kref+0x2cbc:   	mov	%gsr, %l0
	.word	0x2f800007	! t0_kref+0x2cc0:   	fbu,a	_kref+0x2cdc
	.word	0xdd1e6000	! t0_kref+0x2cc4:   	ldd	[%i1], %f14
	.word	0xa4732aeb	! t0_kref+0x2cc8:   	udiv	%o4, 0xaeb, %l2
	.word	0xadb4caee	! t0_kref+0x2ccc:   	fpsub32s	%f19, %f14, %f22
	.word	0x34800005	! t0_kref+0x2cd0:   	bg,a	_kref+0x2ce4
	.word	0x96354015	! t0_kref+0x2cd4:   	orn	%l5, %l5, %o3
	.word	0xaab2c016	! t0_kref+0x2cd8:   	orncc	%o3, %l6, %l5
	.word	0xe9be1857	! t0_kref+0x2cdc:   	stda	%f20, [%i0 + %l7]0xc2
	.word	0xb9a01934	! t0_kref+0x2ce0:   	fstod	%f20, %f28
	.word	0x3d800001	! t0_kref+0x2ce4:   	fbule,a	_kref+0x2ce8
	.word	0xc006001c	! t0_kref+0x2ce8:   	ld	[%i0 + %i4], %g0
	.word	0xea10a00e	! t0_kref+0x2cec:   	lduh	[%g2 + 0xe], %l5
	.word	0xe27e2014	! t0_kref+0x2cf0:   	swap	[%i0 + 0x14], %l1
	.word	0xefee101d	! t0_kref+0x2cf4:   	prefetcha	%i0 + %i5, 23
	.word	0xab400000	! t0_kref+0x2cf8:   	mov	%y, %l5
	.word	0xee20a030	! t0_kref+0x2cfc:   	st	%l7, [%g2 + 0x30]
	.word	0x9db70e12	! t0_kref+0x2d00:   	fand	%f28, %f18, %f14
	.word	0xfd1e6018	! t0_kref+0x2d04:   	ldd	[%i1 + 0x18], %f30
	.word	0x37480004	! t0_kref+0x2d08:   	fbge,a,pt	%fcc0, _kref+0x2d18
	.word	0xe968a008	! t0_kref+0x2d0c:   	prefetch	%g2 + 8, 20
	.word	0xaab03ab0	! t0_kref+0x2d10:   	orncc	%g0, -0x550, %l5
	.word	0xafa00535	! t0_kref+0x2d14:   	fsqrts	%f21, %f23
	.word	0xb3a018dc	! t0_kref+0x2d18:   	fdtos	%f28, %f25
	.word	0x9da0191b	! t0_kref+0x2d1c:   	fitod	%f27, %f14
	.word	0x9252265b	! t0_kref+0x2d20:   	umul	%o0, 0x65b, %o1
	.word	0x9042fa9d	! t0_kref+0x2d24:   	addc	%o3, -0x563, %o0
	.word	0x986562c8	! t0_kref+0x2d28:   	subc	%l5, 0x2c8, %o4
	.word	0x9ba54835	! t0_kref+0x2d2c:   	fadds	%f21, %f21, %f13
	.word	0xe6562016	! t0_kref+0x2d30:   	ldsh	[%i0 + 0x16], %l3
	.word	0x3e480008	! t0_kref+0x2d34:   	bvc,a,pt	%icc, _kref+0x2d54
	.word	0x908de82b	! t0_kref+0x2d38:   	andcc	%l7, 0x82b, %o0
	.word	0xc1ee500a	! t0_kref+0x2d3c:   	prefetcha	%i1 + %o2, 0
	.word	0xdd263ff4	! t0_kref+0x2d40:   	st	%f14, [%i0 - 0xc]
	.word	0x8076a7fa	! t0_kref+0x2d44:   	udiv	%i2, 0x7fa, %g0
	.word	0xb1b74716	! t0_kref+0x2d48:   	fmuld8sux16	%f29, %f22, %f24
	.word	0xc00e6009	! t0_kref+0x2d4c:   	ldub	[%i1 + 9], %g0
	.word	0xe4063fec	! t0_kref+0x2d50:   	ld	[%i0 - 0x14], %l2
	.word	0x81ad4a3d	! t0_kref+0x2d54:   	fcmps	%fcc0, %f21, %f29
	.word	0x9418000b	! t0_kref+0x2d58:   	xor	%g0, %o3, %o2
	.word	0xa6120015	! t0_kref+0x2d5c:   	or	%o0, %l5, %l3
	.word	0x94303b2d	! t0_kref+0x2d60:   	orn	%g0, -0x4d3, %o2
	.word	0x2a480004	! t0_kref+0x2d64:   	bcs,a,pt	%icc, _kref+0x2d74
	.word	0xa9a5c82f	! t0_kref+0x2d68:   	fadds	%f23, %f15, %f20
	.word	0x9da0193b	! t0_kref+0x2d6c:   	fstod	%f27, %f14
	.word	0xe41e001d	! t0_kref+0x2d70:   	ldd	[%i0 + %i5], %l2
	.word	0x3d800006	! t0_kref+0x2d74:   	fbule,a	_kref+0x2d8c
	.word	0xee4e3ffd	! t0_kref+0x2d78:   	ldsb	[%i0 - 3], %l7
	.word	0xa80d400c	! t0_kref+0x2d7c:   	and	%l5, %o4, %l4
	.word	0x3b800008	! t0_kref+0x2d80:   	fble,a	_kref+0x2da0
	.word	0xee28a00e	! t0_kref+0x2d84:   	stb	%l7, [%g2 + 0xe]
	.word	0xda280018	! t0_kref+0x2d88:   	stb	%o5, [%g0 + %i0]
	.word	0xe8be101d	! t0_kref+0x2d8c:   	stda	%l4, [%i0 + %i5]0x80
	.word	0xb9a4cd2c	! t0_kref+0x2d90:   	fsmuld	%f19, %f12, %f28
	.word	0xd628a01e	! t0_kref+0x2d94:   	stb	%o3, [%g2 + 0x1e]
	.word	0xd01e6000	! t0_kref+0x2d98:   	ldd	[%i1], %o0
	.word	0xda10a010	! t0_kref+0x2d9c:   	lduh	[%g2 + 0x10], %o5
	.word	0x9e0a000c	! t0_kref+0x2da0:   	and	%o0, %o4, %o7
	.word	0xfb00a00c	! t0_kref+0x2da4:   	ld	[%g2 + 0xc], %f29
	.word	0xa6334015	! t0_kref+0x2da8:   	orn	%o5, %l5, %l3
	.word	0x80d2400b	! t0_kref+0x2dac:   	umulcc	%o1, %o3, %g0
	.word	0xaf2ae002	! t0_kref+0x2db0:   	sll	%o3, 0x2, %l7
	.word	0xa1a709d0	! t0_kref+0x2db4:   	fdivd	%f28, %f16, %f16
	.word	0xbbb38cba	! t0_kref+0x2db8:   	fandnot2s	%f14, %f26, %f29
	.word	0xb7b30aed	! t0_kref+0x2dbc:   	fpsub32s	%f12, %f13, %f27
	.word	0xbda01a3c	! t0_kref+0x2dc0:   	fstoi	%f28, %f30
	.word	0xd250a030	! t0_kref+0x2dc4:   	ldsh	[%g2 + 0x30], %o1
	.word	0x972a400d	! t0_kref+0x2dc8:   	sll	%o1, %o5, %o3
	.word	0x99a01a2f	! t0_kref+0x2dcc:   	fstoi	%f15, %f12
	.word	0x3e480001	! t0_kref+0x2dd0:   	bvc,a,pt	%icc, _kref+0x2dd4
	.word	0xa6a02914	! t0_kref+0x2dd4:   	subcc	%g0, 0x914, %l3
	.word	0xbba0052d	! t0_kref+0x2dd8:   	fsqrts	%f13, %f29
	.word	0xee5e6000	! t0_kref+0x2ddc:   	ldx	[%i1], %l7
	.word	0x28800002	! t0_kref+0x2de0:   	bleu,a	_kref+0x2de8
	.word	0xe83e001d	! t0_kref+0x2de4:   	std	%l4, [%i0 + %i5]
	.word	0x9fc00004	! t0_kref+0x2de8:   	call	%g0 + %g4
	.word	0x8143c000	! t0_kref+0x2dec:   	stbar
	.word	0xabb68592	! t0_kref+0x2df0:   	fcmpgt32	%f26, %f18, %l5
	.word	0xe51e2010	! t0_kref+0x2df4:   	ldd	[%i0 + 0x10], %f18
	.word	0xb7a0053b	! t0_kref+0x2df8:   	fsqrts	%f27, %f27
	.word	0xa3a00531	! t0_kref+0x2dfc:   	fsqrts	%f17, %f17
	call	SYM(t0_subr3)
	.word	0xa5aa0054	! t0_kref+0x2e04:   	fmovda	%fcc0, %f20, %f18
	.word	0x2d1bbbe7	! t0_kref+0x2e08:   	sethi	%hi(0x6eef9c00), %l6
	.word	0x23800008	! t0_kref+0x2e0c:   	fbne,a	_kref+0x2e2c
	.word	0xafa6c82d	! t0_kref+0x2e10:   	fadds	%f27, %f13, %f23
	.word	0xb5a01938	! t0_kref+0x2e14:   	fstod	%f24, %f26
	.word	0xd420a030	! t0_kref+0x2e18:   	st	%o2, [%g2 + 0x30]
	.word	0xa1a018d8	! t0_kref+0x2e1c:   	fdtos	%f24, %f16
	.word	0x8062add2	! t0_kref+0x2e20:   	subc	%o2, 0xdd2, %g0
	.word	0xb9b48c9a	! t0_kref+0x2e24:   	fandnot2	%f18, %f26, %f28
	.word	0xc7ee500b	! t0_kref+0x2e28:   	prefetcha	%i1 + %o3, 3
	.word	0xda0e0000	! t0_kref+0x2e2c:   	ldub	[%i0], %o5
	.word	0x9ee2c008	! t0_kref+0x2e30:   	subccc	%o3, %o0, %o7
	.word	0xb9b60dce	! t0_kref+0x2e34:   	fnand	%f24, %f14, %f28
	.word	0x36480008	! t0_kref+0x2e38:   	bge,a,pt	%icc, _kref+0x2e58
	.word	0xd9000019	! t0_kref+0x2e3c:   	ld	[%g0 + %i1], %f12
	.word	0xedee501b	! t0_kref+0x2e40:   	prefetcha	%i1 + %i3, 22
	.word	0x93400000	! t0_kref+0x2e44:   	mov	%y, %o1
	.word	0x901ac00d	! t0_kref+0x2e48:   	xor	%o3, %o5, %o0
	.word	0x99b58558	! t0_kref+0x2e4c:   	fcmpeq16	%f22, %f24, %o4
	.word	0xee2e6016	! t0_kref+0x2e50:   	stb	%l7, [%i1 + 0x16]
	.word	0xb3a0053b	! t0_kref+0x2e54:   	fsqrts	%f27, %f25
	.word	0xada01911	! t0_kref+0x2e58:   	fitod	%f17, %f22
	.word	0x8143c000	! t0_kref+0x2e5c:   	stbar
	.word	0xad400000	! t0_kref+0x2e60:   	mov	%y, %l6
	.word	0x9e9d6fed	! t0_kref+0x2e64:   	xorcc	%l5, 0xfed, %o7
	.word	0x9fc10000	! t0_kref+0x2e68:   	call	%g4
	.word	0xd830a03c	! t0_kref+0x2e6c:   	sth	%o4, [%g2 + 0x3c]
	.word	0x9312e0a6	! t0_kref+0x2e70:   	taddcctv	%o3, 0xa6, %o1
	.word	0xada0192f	! t0_kref+0x2e74:   	fstod	%f15, %f22
	.word	0x3c480001	! t0_kref+0x2e78:   	bpos,a,pt	%icc, _kref+0x2e7c
	.word	0xde08a000	! t0_kref+0x2e7c:   	ldub	[%g2], %o7
	.word	0xc168a08b	! t0_kref+0x2e80:   	prefetch	%g2 + 0x8b, 0
	.word	0xe83e6010	! t0_kref+0x2e84:   	std	%l4, [%i1 + 0x10]
	.word	0x81ad8a54	! t0_kref+0x2e88:   	fcmpd	%fcc0, %f22, %f20
	.word	0xa72b6006	! t0_kref+0x2e8c:   	sll	%o5, 0x6, %l3
	.word	0xd640a020	! t0_kref+0x2e90:   	ldsw	[%g2 + 0x20], %o3
	.word	0x9fc00004	! t0_kref+0x2e94:   	call	%g0 + %g4
	.word	0xeaa01018	! t0_kref+0x2e98:   	sta	%l5, [%g0 + %i0]0x80
	.word	0xa655680f	! t0_kref+0x2e9c:   	umul	%l5, 0x80f, %l3
	.word	0xe81f4019	! t0_kref+0x2ea0:   	ldd	[%i5 + %i1], %l4
	.word	0x96580000	! t0_kref+0x2ea4:   	smul	%g0, %g0, %o3
	.word	0x940a73e9	! t0_kref+0x2ea8:   	and	%o1, -0xc17, %o2
	.word	0xa1a000b0	! t0_kref+0x2eac:   	fnegs	%f16, %f16
	.word	0xb5a589cc	! t0_kref+0x2eb0:   	fdivd	%f22, %f12, %f26
	.word	0x91b2c02d	! t0_kref+0x2eb4:   	edge8n	%o3, %o5, %o0
	.word	0xa9b0076c	! t0_kref+0x2eb8:   	fpack16	%f12, %f20
	.word	0x95400000	! t0_kref+0x2ebc:   	mov	%y, %o2
	call	1f
	.empty
	.word	0x8143c000	! t0_kref+0x2ec4:   	stbar
1:	.word	0xabb5ccb4	! t0_kref+0x2ec8:   	fandnot2s	%f23, %f20, %f21
	.word	0xb5a58858	! t0_kref+0x2ecc:   	faddd	%f22, %f24, %f26
	.word	0xa6f68016	! t0_kref+0x2ed0:   	udivcc	%i2, %l6, %l3
	.word	0xdf00a008	! t0_kref+0x2ed4:   	ld	[%g2 + 8], %f15
	.word	0xa5a488d2	! t0_kref+0x2ed8:   	fsubd	%f18, %f18, %f18
	.word	0x25800004	! t0_kref+0x2edc:   	fblg,a	_kref+0x2eec
	.word	0xa1a00550	! t0_kref+0x2ee0:   	fsqrtd	%f16, %f16
	.word	0x90f03be7	! t0_kref+0x2ee4:   	udivcc	%g0, -0x419, %o0
	.word	0xbda00550	! t0_kref+0x2ee8:   	fsqrtd	%f16, %f30
	.word	0xab400000	! t0_kref+0x2eec:   	mov	%y, %l5
	.word	0xa9a0191c	! t0_kref+0x2ef0:   	fitod	%f28, %f20
	.word	0x90728017	! t0_kref+0x2ef4:   	udiv	%o2, %l7, %o0
	.word	0xd64e401a	! t0_kref+0x2ef8:   	ldsb	[%i1 + %i2], %o3
	.word	0x903a7656	! t0_kref+0x2efc:   	xnor	%o1, -0x9aa, %o0
	.word	0xc0260000	! t0_kref+0x2f00:   	clr	[%i0]
	.word	0xd62e7ffb	! t0_kref+0x2f04:   	stb	%o3, [%i1 - 5]
	.word	0xa61de23c	! t0_kref+0x2f08:   	xor	%l7, 0x23c, %l3
	.word	0x8115f6e6	! t0_kref+0x2f0c:   	taddcctv	%l7, -0x91a, %g0
	.word	0x9a920008	! t0_kref+0x2f10:   	orcc	%o0, %o0, %o5
	.word	0xef26401c	! t0_kref+0x2f14:   	st	%f23, [%i1 + %i4]
	.word	0x99b68d40	! t0_kref+0x2f18:   	fnot1	%f26, %f12
	.word	0xa8134017	! t0_kref+0x2f1c:   	or	%o5, %l7, %l4
	.word	0xd640a03c	! t0_kref+0x2f20:   	ldsw	[%g2 + 0x3c], %o3
	.word	0xaf2d8009	! t0_kref+0x2f24:   	sll	%l6, %o1, %l7
	.word	0xf207bfe0	! t0_kref+0x2f28:   	ld	[%fp - 0x20], %i1
	.word	0x94fd6692	! t0_kref+0x2f2c:   	sdivcc	%l5, 0x692, %o2
	.word	0x901a800d	! t0_kref+0x2f30:   	xor	%o2, %o5, %o0
	.word	0xf4280019	! t0_kref+0x2f34:   	stb	%i2, [%g0 + %i1]
	.word	0xe9be1816	! t0_kref+0x2f38:   	stda	%f20, [%i0 + %l6]0xc0
	.word	0xbbb34d60	! t0_kref+0x2f3c:   	fnot1s	%f13, %f29
	.word	0xaaa2eeab	! t0_kref+0x2f40:   	subcc	%o3, 0xeab, %l5
	.word	0x2d800001	! t0_kref+0x2f44:   	fbg,a	_kref+0x2f48
	.word	0xc07e7fe4	! t0_kref+0x2f48:   	swap	[%i1 - 0x1c], %g0
	.word	0xf430a02e	! t0_kref+0x2f4c:   	sth	%i2, [%g2 + 0x2e]
	.word	0x3d800006	! t0_kref+0x2f50:   	fbule,a	_kref+0x2f68
	.word	0xd6c61000	! t0_kref+0x2f54:   	ldswa	[%i0]0x80, %o3
	.word	0xb5a38d33	! t0_kref+0x2f58:   	fsmuld	%f14, %f19, %f26
	.word	0xd91e3fe0	! t0_kref+0x2f5c:   	ldd	[%i0 - 0x20], %f12
	.word	0xb1a308cc	! t0_kref+0x2f60:   	fsubd	%f12, %f12, %f24
	.word	0x81dac009	! t0_kref+0x2f64:   	flush	%o3 + %o1
	.word	0x83c06d54	! t0_kref+0x2f68:   	jmpl	%g1 + 0xd54, %g1
	.word	0x99a01a54	! t0_kref+0x2f6c:   	fdtoi	%f20, %f12
	.word	0xc807bfec	! t0_kref+0x2f70:   	ld	[%fp - 0x14], %g4
	.word	0xec1e6010	! t0_kref+0x2f74:   	ldd	[%i1 + 0x10], %l6
	.word	0xe7260000	! t0_kref+0x2f78:   	st	%f19, [%i0]
	.word	0x9140c000	! t0_kref+0x2f7c:   	mov	%asi, %o0
	.word	0xa9a408ac	! t0_kref+0x2f80:   	fsubs	%f16, %f12, %f20
	.word	0xada01a3e	! t0_kref+0x2f84:   	fstoi	%f30, %f22
	.word	0xb9b3462e	! t0_kref+0x2f88:   	fmul8x16	%f13, %f14, %f28
	.word	0xb5a409d8	! t0_kref+0x2f8c:   	fdivd	%f16, %f24, %f26
	.word	0x29480004	! t0_kref+0x2f90:   	fbl,a,pt	%fcc0, _kref+0x2fa0
	.word	0xae2d6744	! t0_kref+0x2f94:   	andn	%l5, 0x744, %l7
	.word	0x28800006	! t0_kref+0x2f98:   	bleu,a	_kref+0x2fb0
	.word	0x9665b358	! t0_kref+0x2f9c:   	subc	%l6, -0xca8, %o3
	.word	0x99a6885e	! t0_kref+0x2fa0:   	faddd	%f26, %f30, %f12
	.word	0x3a480005	! t0_kref+0x2fa4:   	bcc,a,pt	%icc, _kref+0x2fb8
	.word	0xb5a018da	! t0_kref+0x2fa8:   	fdtos	%f26, %f26
	.word	0x81af8a2f	! t0_kref+0x2fac:   	fcmps	%fcc0, %f30, %f15
	.word	0x9170000b	! t0_kref+0x2fb0:   	popc	%o3, %o0
	call	SYM(t0_subr3)
	.word	0xc12e2008	! t0_kref+0x2fb8:   	st	%fsr, [%i0 + 8]
	.word	0xa49d6412	! t0_kref+0x2fbc:   	xorcc	%l5, 0x412, %l2
	.word	0xa8f5c000	! t0_kref+0x2fc0:   	udivcc	%l7, %g0, %l4
	.word	0xab02401a	! t0_kref+0x2fc4:   	taddcc	%o1, %i2, %l5
	.word	0x9e9d800b	! t0_kref+0x2fc8:   	xorcc	%l6, %o3, %o7
	.word	0x99b605da	! t0_kref+0x2fcc:   	fcmpeq32	%f24, %f26, %o4
	.word	0xa9a00558	! t0_kref+0x2fd0:   	fsqrtd	%f24, %f20
	.word	0xae258009	! t0_kref+0x2fd4:   	sub	%l6, %o1, %l7
	.word	0xf9063ffc	! t0_kref+0x2fd8:   	ld	[%i0 - 4], %f28
	.word	0x93024008	! t0_kref+0x2fdc:   	taddcc	%o1, %o0, %o1
	.word	0xd448a013	! t0_kref+0x2fe0:   	ldsb	[%g2 + 0x13], %o2
	.word	0xd078a014	! t0_kref+0x2fe4:   	swap	[%g2 + 0x14], %o0
	.word	0xc000a020	! t0_kref+0x2fe8:   	ld	[%g2 + 0x20], %g0
	.word	0xaa934015	! t0_kref+0x2fec:   	orcc	%o5, %l5, %l5
	.word	0xee262008	! t0_kref+0x2ff0:   	st	%l7, [%i0 + 8]
	.word	0xa5a6cd3a	! t0_kref+0x2ff4:   	fsmuld	%f27, %f26, %f18
	.word	0x9db40670	! t0_kref+0x2ff8:   	fmul8x16au	%f16, %f16, %f14
	.word	0x9fc00004	! t0_kref+0x2ffc:   	call	%g0 + %g4
	.word	0x90803134	! t0_kref+0x3000:   	addcc	%g0, -0xecc, %o0
	.word	0x39800004	! t0_kref+0x3004:   	fbuge,a	_kref+0x3014
	.word	0xa49a782f	! t0_kref+0x3008:   	xorcc	%o1, -0x7d1, %l2
	.word	0xec3f4018	! t0_kref+0x300c:   	std	%l6, [%i5 + %i0]
	.word	0x8143c000	! t0_kref+0x3010:   	stbar
	.word	0xada0055e	! t0_kref+0x3014:   	fsqrtd	%f30, %f22
	.word	0x99b50d40	! t0_kref+0x3018:   	fnot1	%f20, %f12
	.word	0x920dc000	! t0_kref+0x301c:   	and	%l7, %g0, %o1
	.word	0x90f2c009	! t0_kref+0x3020:   	udivcc	%o3, %o1, %o0
	.word	0x37800008	! t0_kref+0x3024:   	fbge,a	_kref+0x3044
	.word	0x8143c000	! t0_kref+0x3028:   	stbar
	.word	0x94e2e091	! t0_kref+0x302c:   	subccc	%o3, 0x91, %o2
	.word	0xa80a731a	! t0_kref+0x3030:   	and	%o1, -0xce6, %l4
	.word	0xb1a488b6	! t0_kref+0x3034:   	fsubs	%f18, %f22, %f24
	.word	0x99b70d40	! t0_kref+0x3038:   	fnot1	%f28, %f12
	.word	0xaada000c	! t0_kref+0x303c:   	smulcc	%o0, %o4, %l5
	.word	0x2e480008	! t0_kref+0x3040:   	bvs,a,pt	%icc, _kref+0x3060
	.word	0x96f28016	! t0_kref+0x3044:   	udivcc	%o2, %l6, %o3
	.word	0xea563fe8	! t0_kref+0x3048:   	ldsh	[%i0 - 0x18], %l5
	.word	0xa6fac00a	! t0_kref+0x304c:   	sdivcc	%o3, %o2, %l3
	.word	0x38800008	! t0_kref+0x3050:   	bgu,a	_kref+0x3070
	.word	0x97b20240	! t0_kref+0x3054:   	array16	%o0, %g0, %o3
	.word	0xd200a028	! t0_kref+0x3058:   	ld	[%g2 + 0x28], %o1
	.word	0x9ba00039	! t0_kref+0x305c:   	fmovs	%f25, %f13
	.word	0x8185c000	! t0_kref+0x3060:   	wr	%l7, %g0, %y
	.word	0xb1a309d2	! t0_kref+0x3064:   	fdivd	%f12, %f18, %f24
	.word	0xda08a016	! t0_kref+0x3068:   	ldub	[%g2 + 0x16], %o5
	.word	0x3a480001	! t0_kref+0x306c:   	bcc,a,pt	%icc, _kref+0x3070
	.word	0x81dfa4ba	! t0_kref+0x3070:   	flush	%fp + 0x4ba
	.word	0x39800004	! t0_kref+0x3074:   	fbuge,a	_kref+0x3084
	.word	0x8143c000	! t0_kref+0x3078:   	stbar
	.word	0x99a8005a	! t0_kref+0x307c:   	fmovdn	%fcc0, %f26, %f12
	.word	0x9da00035	! t0_kref+0x3080:   	fmovs	%f21, %f14
	.word	0x8185c000	! t0_kref+0x3084:   	wr	%l7, %g0, %y
	.word	0xa9b486da	! t0_kref+0x3088:   	fmul8sux16	%f18, %f26, %f20
	.word	0x30480006	! t0_kref+0x308c:   	ba,a,pt	%icc, _kref+0x30a4
	.word	0x81580000	! t0_kref+0x3090:   	flushw
	.word	0xb1a01937	! t0_kref+0x3094:   	fstod	%f23, %f24
	.word	0x99a60836	! t0_kref+0x3098:   	fadds	%f24, %f22, %f12
	.word	0xa5a000ce	! t0_kref+0x309c:   	fnegd	%f14, %f18
	.word	0xe4780019	! t0_kref+0x30a0:   	swap	[%g0 + %i1], %l2
	.word	0x95b6816c	! t0_kref+0x30a4:   	edge32ln	%i2, %o4, %o2
	.word	0xe406001c	! t0_kref+0x30a8:   	ld	[%i0 + %i4], %l2
	.word	0x32480007	! t0_kref+0x30ac:   	bne,a,pt	%icc, _kref+0x30c8
	.word	0xed1fbcf0	! t0_kref+0x30b0:   	ldd	[%fp - 0x310], %f22
	.word	0xbda40d37	! t0_kref+0x30b4:   	fsmuld	%f16, %f23, %f30
	.word	0x9a32000d	! t0_kref+0x30b8:   	orn	%o0, %o5, %o5
	.word	0xafa308b9	! t0_kref+0x30bc:   	fsubs	%f12, %f25, %f23
	.word	0xec1e401d	! t0_kref+0x30c0:   	ldd	[%i1 + %i5], %l6
	.word	0xc0280019	! t0_kref+0x30c4:   	clrb	[%g0 + %i1]
	.word	0x98d5e8db	! t0_kref+0x30c8:   	umulcc	%l7, 0x8db, %o4
	.word	0xc0280018	! t0_kref+0x30cc:   	clrb	[%g0 + %i0]
	.word	0xa7a000b8	! t0_kref+0x30d0:   	fnegs	%f24, %f19
	.word	0xa623401a	! t0_kref+0x30d4:   	sub	%o5, %i2, %l3
	.word	0x81ad0a58	! t0_kref+0x30d8:   	fcmpd	%fcc0, %f20, %f24
	.word	0xd87e4000	! t0_kref+0x30dc:   	swap	[%i1], %o4
	.word	0xd01e2018	! t0_kref+0x30e0:   	ldd	[%i0 + 0x18], %o0
	.word	0x3d800002	! t0_kref+0x30e4:   	fbule,a	_kref+0x30ec
	.word	0xb9b30e80	! t0_kref+0x30e8:   	fsrc1	%f12, %f28
	.word	0x80820016	! t0_kref+0x30ec:   	addcc	%o0, %l6, %g0
	.word	0xae1a0000	! t0_kref+0x30f0:   	xor	%o0, %g0, %l7
	.word	0xee28a000	! t0_kref+0x30f4:   	stb	%l7, [%g2]
	.word	0x912ae011	! t0_kref+0x30f8:   	sll	%o3, 0x11, %o0
	.word	0xb5a00550	! t0_kref+0x30fc:   	fsqrtd	%f16, %f26
	.word	0xb9b40e80	! t0_kref+0x3100:   	fsrc1	%f16, %f28
	.word	0xb1a0012e	! t0_kref+0x3104:   	fabss	%f14, %f24
	.word	0xa1a01116	! t0_kref+0x3108:   	fxtod	%f22, %f16
	.word	0x3f480004	! t0_kref+0x310c:   	fbo,a,pt	%fcc0, _kref+0x311c
	.word	0xa7b5855a	! t0_kref+0x3110:   	fcmpeq16	%f22, %f26, %l3
	.word	0xa9b78596	! t0_kref+0x3114:   	fcmpgt32	%f30, %f22, %l4
	.word	0x96b30000	! t0_kref+0x3118:   	orncc	%o4, %g0, %o3
	.word	0x9e636315	! t0_kref+0x311c:   	subc	%o5, 0x315, %o7
	.word	0x81868000	! t0_kref+0x3120:   	wr	%i2, %g0, %y
	.word	0xbbb38a7a	! t0_kref+0x3124:   	fpadd32s	%f14, %f26, %f29
	.word	0xadb487ce	! t0_kref+0x3128:   	pdist	%f18, %f14, %f22
	.word	0xd2c71018	! t0_kref+0x312c:   	ldswa	[%i4 + %i0]0x80, %o1
	.word	0xaba708ba	! t0_kref+0x3130:   	fsubs	%f28, %f26, %f21
	.word	0x83414000	! t0_kref+0x3134:   	mov	%pc, %g1
	.word	0x9540c000	! t0_kref+0x3138:   	mov	%asi, %o2
	.word	0xa5b00c00	! t0_kref+0x313c:   	fzero	%f18
	.word	0xf53e7ff8	! t0_kref+0x3140:   	std	%f26, [%i1 - 8]
	.word	0xe1be5808	! t0_kref+0x3144:   	stda	%f16, [%i1 + %o0]0xc0
	.word	0xd05f4018	! t0_kref+0x3148:   	ldx	[%i5 + %i0], %o0
	.word	0x81de4008	! t0_kref+0x314c:   	flush	%i1 + %o0
	.word	0xda68a005	! t0_kref+0x3150:   	ldstub	[%g2 + 5], %o5
	.word	0xadb70e12	! t0_kref+0x3154:   	fand	%f28, %f18, %f22
	.word	0xe320a024	! t0_kref+0x3158:   	st	%f17, [%g2 + 0x24]
	.word	0xe81e4000	! t0_kref+0x315c:   	ldd	[%i1], %l4
	.word	0x95b20036	! t0_kref+0x3160:   	edge8n	%o0, %l6, %o2
	.word	0x81adca2f	! t0_kref+0x3164:   	fcmps	%fcc0, %f23, %f15
	.word	0x81ae0a5e	! t0_kref+0x3168:   	fcmpd	%fcc0, %f24, %f30
	.word	0xb9a44d30	! t0_kref+0x316c:   	fsmuld	%f17, %f16, %f28
	.word	0xd228a01e	! t0_kref+0x3170:   	stb	%o1, [%g2 + 0x1e]
	.word	0xa9b70d10	! t0_kref+0x3174:   	fandnot1	%f28, %f16, %f20
	.word	0x80d02ba2	! t0_kref+0x3178:   	umulcc	%g0, 0xba2, %g0
	.word	0xd4c01018	! t0_kref+0x317c:   	ldswa	[%g0 + %i0]0x80, %o2
	.word	0x9afd6486	! t0_kref+0x3180:   	sdivcc	%l5, 0x486, %o5
	.word	0x96728017	! t0_kref+0x3184:   	udiv	%o2, %l7, %o3
	.word	0xa7b58ef3	! t0_kref+0x3188:   	fornot2s	%f22, %f19, %f19
	.word	0x38800003	! t0_kref+0x318c:   	bgu,a	_kref+0x3198
	.word	0xa1a0188f	! t0_kref+0x3190:   	fitos	%f15, %f16
	.word	0xec4e3ff4	! t0_kref+0x3194:   	ldsb	[%i0 - 0xc], %l6
	.word	0xec563ff2	! t0_kref+0x3198:   	ldsh	[%i0 - 0xe], %l6
	.word	0xb5a0193a	! t0_kref+0x319c:   	fstod	%f26, %f26
	.word	0xf42e401a	! t0_kref+0x31a0:   	stb	%i2, [%i1 + %i2]
	.word	0x96e26f1e	! t0_kref+0x31a4:   	subccc	%o1, 0xf1e, %o3
	.word	0x9e0dc009	! t0_kref+0x31a8:   	and	%l7, %o1, %o7
	.word	0x38800005	! t0_kref+0x31ac:   	bgu,a	_kref+0x31c0
	.word	0x9823401a	! t0_kref+0x31b0:   	sub	%o5, %i2, %o4
	.word	0xaaa56376	! t0_kref+0x31b4:   	subcc	%l5, 0x376, %l5
	.word	0xec20a03c	! t0_kref+0x31b8:   	st	%l6, [%g2 + 0x3c]
	.word	0x2b800002	! t0_kref+0x31bc:   	fbug,a	_kref+0x31c4
	.word	0x1f00b67e	! t0_kref+0x31c0:   	sethi	%hi(0x2d9f800), %o7
	.word	0xa5a01912	! t0_kref+0x31c4:   	fitod	%f18, %f18
	.word	0xf51e3fe0	! t0_kref+0x31c8:   	ldd	[%i0 - 0x20], %f26
	.word	0x26480003	! t0_kref+0x31cc:   	bl,a,pt	%icc, _kref+0x31d8
	.word	0x150bf8d0	! t0_kref+0x31d0:   	sethi	%hi(0x2fe34000), %o2
	.word	0xea28a027	! t0_kref+0x31d4:   	stb	%l5, [%g2 + 0x27]
	.word	0xacf37da8	! t0_kref+0x31d8:   	udivcc	%o5, -0x258, %l6
	.word	0xe6560000	! t0_kref+0x31dc:   	ldsh	[%i0], %l3
	.word	0xeb68a00c	! t0_kref+0x31e0:   	prefetch	%g2 + 0xc, 21
	.word	0xb1b00fe0	! t0_kref+0x31e4:   	fones	%f24
	.word	0x2f800007	! t0_kref+0x31e8:   	fbu,a	_kref+0x3204
	.word	0xa5b705dc	! t0_kref+0x31ec:   	fcmpeq32	%f28, %f28, %l2
	.word	0x99a0192e	! t0_kref+0x31f0:   	fstod	%f14, %f12
	.word	0xd600a008	! t0_kref+0x31f4:   	ld	[%g2 + 8], %o3
	.word	0x932a4009	! t0_kref+0x31f8:   	sll	%o1, %o1, %o1
	.word	0xd250a024	! t0_kref+0x31fc:   	ldsh	[%g2 + 0x24], %o1
	.word	0x3a800007	! t0_kref+0x3200:   	bcc,a	_kref+0x321c
	.word	0xabb3ccaf	! t0_kref+0x3204:   	fandnot2s	%f15, %f15, %f21
	.word	0x2c800002	! t0_kref+0x3208:   	bneg,a	_kref+0x3210
	.word	0xde060000	! t0_kref+0x320c:   	ld	[%i0], %o7
	.word	0xed9e101d	! t0_kref+0x3210:   	ldda	[%i0 + %i5]0x80, %f22
	.word	0xae733855	! t0_kref+0x3214:   	udiv	%o4, -0x7ab, %l7
	.word	0x941d7c13	! t0_kref+0x3218:   	xor	%l5, -0x3ed, %o2
	.word	0xd2267fec	! t0_kref+0x321c:   	st	%o1, [%i1 - 0x14]
	.word	0xecbe5000	! t0_kref+0x3220:   	stda	%l6, [%i1]0x80
	.word	0x962a8009	! t0_kref+0x3224:   	andn	%o2, %o1, %o3
	.word	0x2d800006	! t0_kref+0x3228:   	fbg,a	_kref+0x3240
	.word	0x99b64c6f	! t0_kref+0x322c:   	fnors	%f25, %f15, %f12
	.word	0x22800002	! t0_kref+0x3230:   	be,a	_kref+0x3238
	.word	0x81dbf13c	! t0_kref+0x3234:   	flush	%o7 - 0xec4
	.word	0x989576df	! t0_kref+0x3238:   	orcc	%l5, -0x921, %o4
	.word	0x30800003	! t0_kref+0x323c:   	ba,a	_kref+0x3248
	.word	0xa4254008	! t0_kref+0x3240:   	sub	%l5, %o0, %l2
	.word	0xd230a02c	! t0_kref+0x3244:   	sth	%o1, [%g2 + 0x2c]
	.word	0xa5a0053c	! t0_kref+0x3248:   	fsqrts	%f28, %f18
	.word	0xad268008	! t0_kref+0x324c:   	mulscc	%i2, %o0, %l6
	.word	0xe8186438	! t0_kref+0x3250:   	ldd	[%g1 + 0x438], %l4
	.word	0xda2e0000	! t0_kref+0x3254:   	stb	%o5, [%i0]
	.word	0x9db68f5a	! t0_kref+0x3258:   	fornot1	%f26, %f26, %f14
	.word	0xab226726	! t0_kref+0x325c:   	mulscc	%o1, 0x726, %l5
	.word	0x9b326003	! t0_kref+0x3260:   	srl	%o1, 0x3, %o5
	.word	0xf91e3ff8	! t0_kref+0x3264:   	ldd	[%i0 - 8], %f28
	.word	0xb1b68e80	! t0_kref+0x3268:   	fsrc1	%f26, %f24
	.word	0xb5a00531	! t0_kref+0x326c:   	fsqrts	%f17, %f26
	.word	0xada4492c	! t0_kref+0x3270:   	fmuls	%f17, %f12, %f22
	.word	0xae5a0008	! t0_kref+0x3274:   	smul	%o0, %o0, %l7
	call	SYM(t0_subr1)
	.word	0x96e2aa75	! t0_kref+0x327c:   	subccc	%o2, 0xa75, %o3
	.word	0x011af88a	! t0_kref+0x3280:   	sethi	%hi(0x6be22800), %g0
	.word	0x3d480003	! t0_kref+0x3284:   	fbule,a,pt	%fcc0, _kref+0x3290
	.word	0xab1e800c	! t0_kref+0x3288:   	tsubcctv	%i2, %o4, %l5
	.word	0xa9b00cdc	! t0_kref+0x328c:   	fnot2	%f28, %f20
	.word	0xa9b00fe0	! t0_kref+0x3290:   	fones	%f20
	.word	0x8143c000	! t0_kref+0x3294:   	stbar
	.word	0x925dc015	! t0_kref+0x3298:   	smul	%l7, %l5, %o1
	.word	0x81da401f	! t0_kref+0x329c:   	flush	%o1 + %i7
	.word	0xb1a00530	! t0_kref+0x32a0:   	fsqrts	%f16, %f24
	.word	0x9ba348b0	! t0_kref+0x32a4:   	fsubs	%f13, %f16, %f13
	.word	0x3a480001	! t0_kref+0x32a8:   	bcc,a,pt	%icc, _kref+0x32ac
	.word	0xa7b5c280	! t0_kref+0x32ac:   	array32	%l7, %g0, %l3
	.word	0xadb78f56	! t0_kref+0x32b0:   	fornot1	%f30, %f22, %f22
	.word	0x9fc00004	! t0_kref+0x32b4:   	call	%g0 + %g4
	.word	0x81854000	! t0_kref+0x32b8:   	wr	%l5, %g0, %y
	.word	0xdbf65015	! t0_kref+0x32bc:   	casxa	[%i1]0x80, %l5, %o5
	.word	0xa4326593	! t0_kref+0x32c0:   	orn	%o1, 0x593, %l2
	.word	0x2a800007	! t0_kref+0x32c4:   	bcs,a	_kref+0x32e0
	.word	0xa6120009	! t0_kref+0x32c8:   	or	%o0, %o1, %l3
	.word	0x9da50d3a	! t0_kref+0x32cc:   	fsmuld	%f20, %f26, %f14
	.word	0x9fa308b1	! t0_kref+0x32d0:   	fsubs	%f12, %f17, %f15
	.word	0x01361053	! t0_kref+0x32d4:   	sethi	%hi(0xd8414c00), %g0
	.word	0xc768a009	! t0_kref+0x32d8:   	prefetch	%g2 + 9, 3
	.word	0xa7400000	! t0_kref+0x32dc:   	mov	%y, %l3
	.word	0x8065b5c7	! t0_kref+0x32e0:   	subc	%l6, -0xa39, %g0
	.word	0xe168a084	! t0_kref+0x32e4:   	prefetch	%g2 + 0x84, 16
	.word	0x9de3bfa0	! t0_kref+0x32e8:   	save	%sp, -0x60, %sp
	.word	0xb6b77c98	! t0_kref+0x32ec:   	orncc	%i5, -0x368, %i3
	.word	0xadee001c	! t0_kref+0x32f0:   	restore	%i0, %i4, %l6
	.word	0xadb38e80	! t0_kref+0x32f4:   	fsrc1	%f14, %f22
	.word	0x98a5800b	! t0_kref+0x32f8:   	subcc	%l6, %o3, %o4
	call	SYM(t0_subr1)
	.word	0xa89eb980	! t0_kref+0x3300:   	xorcc	%i2, -0x680, %l4
	.word	0xa5a000dc	! t0_kref+0x3304:   	fnegd	%f28, %f18
	.word	0x99a01a31	! t0_kref+0x3308:   	fstoi	%f17, %f12
	.word	0xee4e001a	! t0_kref+0x330c:   	ldsb	[%i0 + %i2], %l7
	.word	0xed68a00e	! t0_kref+0x3310:   	prefetch	%g2 + 0xe, 22
	.word	0xaa630017	! t0_kref+0x3314:   	subc	%o4, %l7, %l5
	.word	0xf42e001a	! t0_kref+0x3318:   	stb	%i2, [%i0 + %i2]
	.word	0x9262800b	! t0_kref+0x331c:   	subc	%o2, %o3, %o1
	.word	0xa1a4c82d	! t0_kref+0x3320:   	fadds	%f19, %f13, %f16
	.word	0x9e228000	! t0_kref+0x3324:   	sub	%o2, %g0, %o7
	.word	0xbba01a52	! t0_kref+0x3328:   	fdtoi	%f18, %f29
	.word	0xee064000	! t0_kref+0x332c:   	ld	[%i1], %l7
	.word	0xd4200018	! t0_kref+0x3330:   	st	%o2, [%g0 + %i0]
	.word	0xaf23400d	! t0_kref+0x3334:   	mulscc	%o5, %o5, %l7
	.word	0xb5a4483e	! t0_kref+0x3338:   	fadds	%f17, %f30, %f26
	.word	0x96f576d4	! t0_kref+0x333c:   	udivcc	%l5, -0x92c, %o3
	.word	0xea300018	! t0_kref+0x3340:   	sth	%l5, [%g0 + %i0]
	.word	0x9bb38d60	! t0_kref+0x3344:   	fnot1s	%f14, %f13
	.word	0xa5a58d3d	! t0_kref+0x3348:   	fsmuld	%f22, %f29, %f18
	.word	0x2e480006	! t0_kref+0x334c:   	bvs,a,pt	%icc, _kref+0x3364
	.word	0xa783400d	! t0_kref+0x3350:   	wr	%o5, %o5, %gsr
	.word	0xc568a08c	! t0_kref+0x3354:   	prefetch	%g2 + 0x8c, 2
	.word	0x95328015	! t0_kref+0x3358:   	srl	%o2, %l5, %o2
	.word	0x3a800007	! t0_kref+0x335c:   	bcc,a	_kref+0x3378
	.word	0x9fb00336	! t0_kref+0x3360:   	bmask	%g0, %l6, %o7
	.word	0xdb00a028	! t0_kref+0x3364:   	ld	[%g2 + 0x28], %f13
	.word	0x809b779b	! t0_kref+0x3368:   	xorcc	%o5, -0x865, %g0
	.word	0xc0ae9018	! t0_kref+0x336c:   	stba	%g0, [%i2 + %i0]0x80
	.word	0x81af4a2f	! t0_kref+0x3370:   	fcmps	%fcc0, %f29, %f15
	.word	0xa61dfca3	! t0_kref+0x3374:   	xor	%l7, -0x35d, %l3
	.word	0xa92a6007	! t0_kref+0x3378:   	sll	%o1, 0x7, %l4
	.word	0xd84e3fec	! t0_kref+0x337c:   	ldsb	[%i0 - 0x14], %o4
	.word	0x81dd800e	! t0_kref+0x3380:   	flush	%l6 + %sp
	.word	0xb9b58e80	! t0_kref+0x3384:   	fsrc1	%f22, %f28
	.word	0x9fc00004	! t0_kref+0x3388:   	call	%g0 + %g4
	.word	0xf3801019	! t0_kref+0x338c:   	lda	[%g0 + %i1]0x80, %f25
	.word	0xf4270019	! t0_kref+0x3390:   	st	%i2, [%i4 + %i1]
	.word	0xd906401c	! t0_kref+0x3394:   	ld	[%i1 + %i4], %f12
	.word	0x99a409d0	! t0_kref+0x3398:   	fdivd	%f16, %f16, %f12
	.word	0x9b223cc3	! t0_kref+0x339c:   	mulscc	%o0, -0x33d, %o5
	.word	0xc807bff0	! t0_kref+0x33a0:   	ld	[%fp - 0x10], %g4
	.word	0x8143c000	! t0_kref+0x33a4:   	stbar
	.word	0xe41f4018	! t0_kref+0x33a8:   	ldd	[%i5 + %i0], %l2
	.word	0xac0d8017	! t0_kref+0x33ac:   	and	%l6, %l7, %l6
	.word	0xaba01a31	! t0_kref+0x33b0:   	fstoi	%f17, %f21
	.word	0xb9a6483c	! t0_kref+0x33b4:   	fadds	%f25, %f28, %f28
	.word	0x98730015	! t0_kref+0x33b8:   	udiv	%o4, %l5, %o4
	.word	0xe91e2008	! t0_kref+0x33bc:   	ldd	[%i0 + 8], %f20
	.word	0xc248382c	! t0_kref+0x33c0:   	ldsb	[%g0 - 0x7d4], %g1
	.word	0x24480003	! t0_kref+0x33c4:   	ble,a,pt	%icc, _kref+0x33d0
	.word	0x9a2dc00b	! t0_kref+0x33c8:   	andn	%l7, %o3, %o5
	.word	0xa5b48e80	! t0_kref+0x33cc:   	fsrc1	%f18, %f18
	.word	0xa9b68518	! t0_kref+0x33d0:   	fcmpgt16	%f26, %f24, %l4
	.word	0x1f22b068	! t0_kref+0x33d4:   	sethi	%hi(0x8ac1a000), %o7
	.word	0x9fc00004	! t0_kref+0x33d8:   	call	%g0 + %g4
	.word	0x972de01f	! t0_kref+0x33dc:   	sll	%l7, 0x1f, %o3
	.word	0xe59f5018	! t0_kref+0x33e0:   	ldda	[%i5 + %i0]0x80, %f18
	.word	0x81868000	! t0_kref+0x33e4:   	wr	%i2, %g0, %y
	.word	0x97b58200	! t0_kref+0x33e8:   	array8	%l6, %g0, %o3
	.word	0xd450a032	! t0_kref+0x33ec:   	ldsh	[%g2 + 0x32], %o2
	.word	0xed067fe8	! t0_kref+0x33f0:   	ld	[%i1 - 0x18], %f22
	.word	0x99b40e1c	! t0_kref+0x33f4:   	fand	%f16, %f28, %f12
	.word	0xac82af99	! t0_kref+0x33f8:   	addcc	%o2, 0xf99, %l6
	.word	0xbdb00cce	! t0_kref+0x33fc:   	fnot2	%f14, %f30
	.word	0xc0c6501c	! t0_kref+0x3400:   	ldswa	[%i1 + %i4]0x80, %g0
	.word	0xf430a036	! t0_kref+0x3404:   	sth	%i2, [%g2 + 0x36]
	.word	0xb1b00f1a	! t0_kref+0x3408:   	fsrc2	%f26, %f24
	.word	0x8143c000	! t0_kref+0x340c:   	stbar
	.word	0xb1b00cdc	! t0_kref+0x3410:   	fnot2	%f28, %f24
	.word	0x99a00554	! t0_kref+0x3414:   	fsqrtd	%f20, %f12
	.word	0x9875ecab	! t0_kref+0x3418:   	udiv	%l7, 0xcab, %o4
	.word	0xa9b680aa	! t0_kref+0x341c:   	edge16n	%i2, %o2, %l4
	.word	0x2a480006	! t0_kref+0x3420:   	bcs,a,pt	%icc, _kref+0x3438
	.word	0xd9e65008	! t0_kref+0x3424:   	casa	[%i1]0x80, %o0, %o4
	.word	0x99b38edc	! t0_kref+0x3428:   	fornot2	%f14, %f28, %f12
	.word	0xec68a00d	! t0_kref+0x342c:   	ldstub	[%g2 + 0xd], %l6
	.word	0x8143c000	! t0_kref+0x3430:   	stbar
	.word	0xa9a308da	! t0_kref+0x3434:   	fsubd	%f12, %f26, %f20
	.word	0xb5a000af	! t0_kref+0x3438:   	fnegs	%f15, %f26
	.word	0x9f30000a	! t0_kref+0x343c:   	srl	%g0, %o2, %o7
	.word	0x9fc00004	! t0_kref+0x3440:   	call	%g0 + %g4
	.word	0xedee101b	! t0_kref+0x3444:   	prefetcha	%i0 + %i3, 22
	.word	0xa7a01a34	! t0_kref+0x3448:   	fstoi	%f20, %f19
	.word	0xe3200019	! t0_kref+0x344c:   	st	%f17, [%g0 + %i1]
	.word	0xe81f4018	! t0_kref+0x3450:   	ldd	[%i5 + %i0], %l4
	.word	0x9a75fc4d	! t0_kref+0x3454:   	udiv	%l7, -0x3b3, %o5
	.word	0xafb00117	! t0_kref+0x3458:   	edge32	%g0, %l7, %l7
	.word	0xead6d018	! t0_kref+0x345c:   	ldsha	[%i3 + %i0]0x80, %l5
	.word	0x30800001	! t0_kref+0x3460:   	ba,a	_kref+0x3464
	.word	0x982b6e39	! t0_kref+0x3464:   	andn	%o5, 0xe39, %o4
	.word	0xee4e8018	! t0_kref+0x3468:   	ldsb	[%i2 + %i0], %l7
	.word	0xe76e3ff8	! t0_kref+0x346c:   	prefetch	%i0 - 8, 19
	.word	0x9fb3030b	! t0_kref+0x3470:   	alignaddr	%o4, %o3, %o7
	.word	0xbba0188d	! t0_kref+0x3474:   	fitos	%f13, %f29
	.word	0xe8562012	! t0_kref+0x3478:   	ldsh	[%i0 + 0x12], %l4
	.word	0xd630a028	! t0_kref+0x347c:   	sth	%o3, [%g2 + 0x28]
	.word	0xdda61000	! t0_kref+0x3480:   	sta	%f14, [%i0]0x80
	.word	0x932ea01d	! t0_kref+0x3484:   	sll	%i2, 0x1d, %o1
	.word	0xaa724000	! t0_kref+0x3488:   	udiv	%o1, %g0, %l5
	.word	0x81abca30	! t0_kref+0x348c:   	fcmps	%fcc0, %f15, %f16
	.word	0xa8b2e4c7	! t0_kref+0x3490:   	orncc	%o3, 0x4c7, %l4
	.word	0xaa5b6518	! t0_kref+0x3494:   	smul	%o5, 0x518, %l5
	.word	0xf42e401a	! t0_kref+0x3498:   	stb	%i2, [%i1 + %i2]
	.word	0x81af0acc	! t0_kref+0x349c:   	fcmped	%fcc0, %f28, %f12
	.word	0xa6932226	! t0_kref+0x34a0:   	orcc	%o4, 0x226, %l3
	.word	0xa6b80015	! t0_kref+0x34a4:   	xnorcc	%g0, %l5, %l3
	.word	0x8143c000	! t0_kref+0x34a8:   	stbar
	.word	0x91400000	! t0_kref+0x34ac:   	mov	%y, %o0
	.word	0x2b224e5e	! t0_kref+0x34b0:   	sethi	%hi(0x89397800), %l5
	.word	0x9ee561b3	! t0_kref+0x34b4:   	subccc	%l5, 0x1b3, %o7
	.word	0xa5400000	! t0_kref+0x34b8:   	mov	%y, %l2
	.word	0x2e800002	! t0_kref+0x34bc:   	bvs,a	_kref+0x34c4
	.word	0xc0263ff0	! t0_kref+0x34c0:   	clr	[%i0 - 0x10]
	.word	0x9132e018	! t0_kref+0x34c4:   	srl	%o3, 0x18, %o0
	.word	0xb5a01933	! t0_kref+0x34c8:   	fstod	%f19, %f26
	.word	0xa9b50a96	! t0_kref+0x34cc:   	fpsub16	%f20, %f22, %f20
	.word	0xa6b8000b	! t0_kref+0x34d0:   	xnorcc	%g0, %o3, %l3
	.word	0xd428a03a	! t0_kref+0x34d4:   	stb	%o2, [%g2 + 0x3a]
	.word	0xc851401b	! t0_kref+0x34d8:   	ldsh	[%g5 + %i3], %g4
	.word	0xa9128008	! t0_kref+0x34dc:   	taddcctv	%o2, %o0, %l4
	.word	0x81ad0a54	! t0_kref+0x34e0:   	fcmpd	%fcc0, %f20, %f20
	.word	0xf51e4000	! t0_kref+0x34e4:   	ldd	[%i1], %f26
	.word	0xee200018	! t0_kref+0x34e8:   	st	%l7, [%g0 + %i0]
	.word	0x99b5400d	! t0_kref+0x34ec:   	edge8	%l5, %o5, %o4
	.word	0xadb50d2e	! t0_kref+0x34f0:   	fandnot1s	%f20, %f14, %f22
	.word	0x9e657cef	! t0_kref+0x34f4:   	subc	%l5, -0x311, %o7
	.word	0x9de3bfa0	! t0_kref+0x34f8:   	save	%sp, -0x60, %sp
	.word	0x95ef0019	! t0_kref+0x34fc:   	restore	%i4, %i1, %o2
	.word	0xd8267ff8	! t0_kref+0x3500:   	st	%o4, [%i1 - 8]
	.word	0x945eb4f8	! t0_kref+0x3504:   	smul	%i2, -0xb08, %o2
	.word	0xd02e001a	! t0_kref+0x3508:   	stb	%o0, [%i0 + %i2]
	.word	0xb5a6c8af	! t0_kref+0x350c:   	fsubs	%f27, %f15, %f26
	.word	0xec4e3ff0	! t0_kref+0x3510:   	ldsb	[%i0 - 0x10], %l6
	call	SYM(t0_subr1)
	.word	0x9db30dcc	! t0_kref+0x3518:   	fnand	%f12, %f12, %f14
	.word	0xe41e3ff0	! t0_kref+0x351c:   	ldd	[%i0 - 0x10], %l2
	.word	0xa5b304dc	! t0_kref+0x3520:   	fcmpne32	%f12, %f28, %l2
	.word	0xaa72000a	! t0_kref+0x3524:   	udiv	%o0, %o2, %l5
	.word	0x2f480006	! t0_kref+0x3528:   	fbu,a,pt	%fcc0, _kref+0x3540
	.word	0x80bdc000	! t0_kref+0x352c:   	xnorcc	%l7, %g0, %g0
	.word	0x81df0004	! t0_kref+0x3530:   	flush	%i4 + %g4
	.word	0x9855e879	! t0_kref+0x3534:   	umul	%l7, 0x879, %o4
	.word	0xd428a00f	! t0_kref+0x3538:   	stb	%o2, [%g2 + 0xf]
	.word	0xd9070019	! t0_kref+0x353c:   	ld	[%i4 + %i1], %f12
	.word	0xb1a0052d	! t0_kref+0x3540:   	fsqrts	%f13, %f24
	.word	0x9a32c00b	! t0_kref+0x3544:   	orn	%o3, %o3, %o5
	.word	0x8143c000	! t0_kref+0x3548:   	stbar
	.word	0x39800003	! t0_kref+0x354c:   	fbuge,a	_kref+0x3558
	.word	0xd630a02e	! t0_kref+0x3550:   	sth	%o3, [%g2 + 0x2e]
	.word	0x929a8009	! t0_kref+0x3554:   	xorcc	%o2, %o1, %o1
	.word	0xae70001a	! t0_kref+0x3558:   	udiv	%g0, %i2, %l7
	.word	0xea564000	! t0_kref+0x355c:   	ldsh	[%i1], %l5
	.word	0xc0200018	! t0_kref+0x3560:   	clr	[%g0 + %i0]
	.word	0x97b5c057	! t0_kref+0x3564:   	edge8l	%l7, %l7, %o3
	.word	0xe968a084	! t0_kref+0x3568:   	prefetch	%g2 + 0x84, 20
	.word	0xada01917	! t0_kref+0x356c:   	fitod	%f23, %f22
	.word	0xe4480019	! t0_kref+0x3570:   	ldsb	[%g0 + %i1], %l2
	.word	0x90f02a71	! t0_kref+0x3574:   	udivcc	%g0, 0xa71, %o0
	.word	0xf7ee501a	! t0_kref+0x3578:   	prefetcha	%i1 + %i2, 27
	.word	0xd24e0000	! t0_kref+0x357c:   	ldsb	[%i0], %o1
	.word	0x9fb4859e	! t0_kref+0x3580:   	fcmpgt32	%f18, %f30, %o7
	.word	0xa1a0191b	! t0_kref+0x3584:   	fitod	%f27, %f16
	.word	0xa5a01a32	! t0_kref+0x3588:   	fstoi	%f18, %f18
	.word	0x9b32e002	! t0_kref+0x358c:   	srl	%o3, 0x2, %o5
	.word	0x3a480005	! t0_kref+0x3590:   	bcc,a,pt	%icc, _kref+0x35a4
	.word	0xac0de7e0	! t0_kref+0x3594:   	and	%l7, 0x7e0, %l6
	.word	0xe656001b	! t0_kref+0x3598:   	ldsh	[%i0 + %i3], %l3
	.word	0xa6f37e4d	! t0_kref+0x359c:   	udivcc	%o5, -0x1b3, %l3
	.word	0xd4562002	! t0_kref+0x35a0:   	ldsh	[%i0 + 2], %o2
	.word	0xec3e2018	! t0_kref+0x35a4:   	std	%l6, [%i0 + 0x18]
	.word	0xf51e6010	! t0_kref+0x35a8:   	ldd	[%i1 + 0x10], %f26
	.word	0xa6768017	! t0_kref+0x35ac:   	udiv	%i2, %l7, %l3
	.word	0xb7a0189d	! t0_kref+0x35b0:   	fitos	%f29, %f27
	.word	0x81dbc01f	! t0_kref+0x35b4:   	flush	%o7 + %i7
	.word	0xec1e4000	! t0_kref+0x35b8:   	ldd	[%i1], %l6
	.word	0xa3b4cef8	! t0_kref+0x35bc:   	fornot2s	%f19, %f24, %f17
	.word	0xb9a6884c	! t0_kref+0x35c0:   	faddd	%f26, %f12, %f28
	.word	0xa9a689ce	! t0_kref+0x35c4:   	fdivd	%f26, %f14, %f20
	.word	0x170b72fb	! t0_kref+0x35c8:   	sethi	%hi(0x2dcbec00), %o3
	.word	0xada0055a	! t0_kref+0x35cc:   	fsqrtd	%f26, %f22
	.word	0x3d480006	! t0_kref+0x35d0:   	fbule,a,pt	%fcc0, _kref+0x35e8
	.word	0xd4c6101c	! t0_kref+0x35d4:   	ldswa	[%i0 + %i4]0x80, %o2
	.word	0xa6d54015	! t0_kref+0x35d8:   	umulcc	%l5, %l5, %l3
	.word	0x2d480008	! t0_kref+0x35dc:   	fbg,a,pt	%fcc0, _kref+0x35fc
	.word	0xa5a9c04e	! t0_kref+0x35e0:   	fmovdu	%fcc0, %f14, %f18
	.word	0x34480003	! t0_kref+0x35e4:   	bg,a,pt	%icc, _kref+0x35f0
	.word	0x93b58200	! t0_kref+0x35e8:   	array8	%l6, %g0, %o1
	.word	0x37800005	! t0_kref+0x35ec:   	fbge,a	_kref+0x3600
	.word	0xed1e001d	! t0_kref+0x35f0:   	ldd	[%i0 + %i5], %f22
	.word	0x81ad8adc	! t0_kref+0x35f4:   	fcmped	%fcc0, %f22, %f28
	.word	0x91b785d2	! t0_kref+0x35f8:   	fcmpeq32	%f30, %f18, %o0
	.word	0x95257b25	! t0_kref+0x35fc:   	mulscc	%l5, -0x4db, %o2
	.word	0xd900a018	! t0_kref+0x3600:   	ld	[%g2 + 0x18], %f12
	.word	0x3e800008	! t0_kref+0x3604:   	bvc,a	_kref+0x3624
	.word	0xe6480019	! t0_kref+0x3608:   	ldsb	[%g0 + %i1], %l3
	.word	0xa5a70858	! t0_kref+0x360c:   	faddd	%f28, %f24, %f18
	.word	0xf4f01018	! t0_kref+0x3610:   	stxa	%i2, [%g0 + %i0]0x80
	.word	0xa1a01930	! t0_kref+0x3614:   	fstod	%f16, %f16
	.word	0x36480005	! t0_kref+0x3618:   	bge,a,pt	%icc, _kref+0x362c
	.word	0xf326001c	! t0_kref+0x361c:   	st	%f25, [%i0 + %i4]
	.word	0x9fa000bd	! t0_kref+0x3620:   	fnegs	%f29, %f15
	.word	0xb1a509dc	! t0_kref+0x3624:   	fdivd	%f20, %f28, %f24
	.word	0xada01933	! t0_kref+0x3628:   	fstod	%f19, %f22
	.word	0x9db68a96	! t0_kref+0x362c:   	fpsub16	%f26, %f22, %f14
	.word	0x98657a2b	! t0_kref+0x3630:   	subc	%l5, -0x5d5, %o4
	.word	0xada0055c	! t0_kref+0x3634:   	fsqrtd	%f28, %f22
	.word	0x95227ee6	! t0_kref+0x3638:   	mulscc	%o1, -0x11a, %o2
	.word	0x90aa0015	! t0_kref+0x363c:   	andncc	%o0, %l5, %o0
	.word	0x81adca36	! t0_kref+0x3640:   	fcmps	%fcc0, %f23, %f22
	.word	0xda580018	! t0_kref+0x3644:   	ldx	[%g0 + %i0], %o5
	.word	0xbda48d30	! t0_kref+0x3648:   	fsmuld	%f18, %f16, %f30
	.word	0xeeee5000	! t0_kref+0x364c:   	ldstuba	[%i1]0x80, %l7
	.word	0xbda7482d	! t0_kref+0x3650:   	fadds	%f29, %f13, %f30
	.word	0xd256c019	! t0_kref+0x3654:   	ldsh	[%i3 + %i1], %o1
	.word	0x9e006528	! t0_kref+0x3658:   	add	%g1, 0x528, %o7
!	.word	0x3e4e1a66	! t0_kref+0x365c:   	bvc,a,pt	%icc, SYM(t0_subr2)
	   	bvc,a,pt	%icc, SYM(t0_subr2)
	.word	0xb7a00032	! t0_kref+0x3660:   	fmovs	%f18, %f27
	.word	0x37800002	! t0_kref+0x3664:   	fbge,a	_kref+0x366c
	.word	0xe440a014	! t0_kref+0x3668:   	ldsw	[%g2 + 0x14], %l2
	.word	0x9db00cd4	! t0_kref+0x366c:   	fnot2	%f20, %f14
	.word	0xa7220008	! t0_kref+0x3670:   	mulscc	%o0, %o0, %l3
	.word	0x9de3bfa0	! t0_kref+0x3674:   	save	%sp, -0x60, %sp
	.word	0xb10f0019	! t0_kref+0x3678:   	tsubcc	%i4, %i1, %i0
	.word	0x81e80000	! t0_kref+0x367c:   	restore
	.word	0x31800004	! t0_kref+0x3680:   	fba,a	_kref+0x3690
	.word	0x92920017	! t0_kref+0x3684:   	orcc	%o0, %l7, %o1
	.word	0xa675400b	! t0_kref+0x3688:   	udiv	%l5, %o3, %l3
	.word	0x28480001	! t0_kref+0x368c:   	bleu,a,pt	%icc, _kref+0x3690
	.word	0x93203760	! t0_kref+0x3690:   	mulscc	%g0, -0x8a0, %o1
	.word	0xd900a034	! t0_kref+0x3694:   	ld	[%g2 + 0x34], %f12
	.word	0xc0000019	! t0_kref+0x3698:   	ld	[%g0 + %i1], %g0
	.word	0x81228016	! t0_kref+0x369c:   	mulscc	%o2, %l6, %g0
	.word	0x9f414000	! t0_kref+0x36a0:   	mov	%pc, %o7
	.word	0xa435400a	! t0_kref+0x36a4:   	orn	%l5, %o2, %l2
	.word	0xa4aa800a	! t0_kref+0x36a8:   	andncc	%o2, %o2, %l2
	.word	0x98c5400b	! t0_kref+0x36ac:   	addccc	%l5, %o3, %o4
	.word	0xb3b00fe0	! t0_kref+0x36b0:   	fones	%f25
	.word	0x95228009	! t0_kref+0x36b4:   	mulscc	%o2, %o1, %o2
	.word	0xd628a02c	! t0_kref+0x36b8:   	stb	%o3, [%g2 + 0x2c]
	.word	0xa82a3abb	! t0_kref+0x36bc:   	andn	%o0, -0x545, %l4
	.word	0xaa52687d	! t0_kref+0x36c0:   	umul	%o1, 0x87d, %l5
	.word	0xec3e401d	! t0_kref+0x36c4:   	std	%l6, [%i1 + %i5]
	.word	0xada018da	! t0_kref+0x36c8:   	fdtos	%f26, %f22
	.word	0xea4e200b	! t0_kref+0x36cc:   	ldsb	[%i0 + 0xb], %l5
	.word	0xe3270018	! t0_kref+0x36d0:   	st	%f17, [%i4 + %i0]
	.word	0xa1a00552	! t0_kref+0x36d4:   	fsqrtd	%f18, %f16
	.word	0x801d652c	! t0_kref+0x36d8:   	xor	%l5, 0x52c, %g0
	.word	0x99a388dc	! t0_kref+0x36dc:   	fsubd	%f14, %f28, %f12
	.word	0x81854000	! t0_kref+0x36e0:   	wr	%l5, %g0, %y
	.word	0x808d7045	! t0_kref+0x36e4:   	btst	0xfffff045, %l5
	.word	0xea280018	! t0_kref+0x36e8:   	stb	%l5, [%g0 + %i0]
	.word	0xa9b5c01a	! t0_kref+0x36ec:   	edge8	%l7, %i2, %l4
	.word	0x91400000	! t0_kref+0x36f0:   	mov	%y, %o0
	.word	0xa1a0190e	! t0_kref+0x36f4:   	fitod	%f14, %f16
	.word	0x9de3bfa0	! t0_kref+0x36f8:   	save	%sp, -0x60, %sp
	.word	0x9bef3618	! t0_kref+0x36fc:   	restore	%i4, -0x9e8, %o5
	.word	0xaf22400c	! t0_kref+0x3700:   	mulscc	%o1, %o4, %l7
	.word	0xa8700009	! t0_kref+0x3704:   	udiv	%g0, %o1, %l4
	.word	0xa9b685d2	! t0_kref+0x3708:   	fcmpeq32	%f26, %f18, %l4
	.word	0xb7a01a38	! t0_kref+0x370c:   	fstoi	%f24, %f27
	.word	0xac1a400b	! t0_kref+0x3710:   	xor	%o1, %o3, %l6
	.word	0x81aeca3a	! t0_kref+0x3714:   	fcmps	%fcc0, %f27, %f26
	.word	0xa1a0191c	! t0_kref+0x3718:   	fitod	%f28, %f16
	.word	0x92daf31f	! t0_kref+0x371c:   	smulcc	%o3, -0xce1, %o1
	.word	0xc020a00c	! t0_kref+0x3720:   	clr	[%g2 + 0xc]
	.word	0xd8ce101a	! t0_kref+0x3724:   	ldsba	[%i0 + %i2]0x80, %o4
	.word	0xb5a01891	! t0_kref+0x3728:   	fitos	%f17, %f26
	.word	0xa5a40835	! t0_kref+0x372c:   	fadds	%f16, %f21, %f18
	.word	0xa5b3430d	! t0_kref+0x3730:   	alignaddr	%o5, %o5, %l2
	.word	0xe406200c	! t0_kref+0x3734:   	ld	[%i0 + 0xc], %l2
	.word	0xd8463ff4	! t0_kref+0x3738:   	ldsw	[%i0 - 0xc], %o4
	.word	0x9e1a2cca	! t0_kref+0x373c:   	xor	%o0, 0xcca, %o7
	.word	0x92182bd9	! t0_kref+0x3740:   	xor	%g0, 0xbd9, %o1
	.word	0xaaadbfb9	! t0_kref+0x3744:   	andncc	%l6, -0x47, %l5
	.word	0x9e66b4be	! t0_kref+0x3748:   	subc	%i2, -0xb42, %o7
	.word	0x8582fe7b	! t0_kref+0x374c:   	wr	%o3, 0xfffffe7b, %ccr
	.word	0x9fa01a36	! t0_kref+0x3750:   	fstoi	%f22, %f15
	.word	0xd810a006	! t0_kref+0x3754:   	lduh	[%g2 + 6], %o4
	.word	0x92132a1e	! t0_kref+0x3758:   	or	%o4, 0xa1e, %o1
	.word	0xeb68a00a	! t0_kref+0x375c:   	prefetch	%g2 + 0xa, 21
	.word	0x9aba800a	! t0_kref+0x3760:   	xnorcc	%o2, %o2, %o5
	.word	0xa1a00531	! t0_kref+0x3764:   	fsqrts	%f17, %f16
	.word	0xb3a018d8	! t0_kref+0x3768:   	fdtos	%f24, %f25
	.word	0x94f265d2	! t0_kref+0x376c:   	udivcc	%o1, 0x5d2, %o2
	.word	0x9db386fe	! t0_kref+0x3770:   	fmul8ulx16	%f14, %f30, %f14
	.word	0x9fb34008	! t0_kref+0x3774:   	edge8	%o5, %o0, %o7
	.word	0x9e15a448	! t0_kref+0x3778:   	or	%l6, 0x448, %o7
	.word	0x99b60c58	! t0_kref+0x377c:   	fnor	%f24, %f24, %f12
	.word	0xa1b00c00	! t0_kref+0x3780:   	fzero	%f16
	.word	0x99a01916	! t0_kref+0x3784:   	fitod	%f22, %f12
	.word	0xb5a709d8	! t0_kref+0x3788:   	fdivd	%f28, %f24, %f26
	.word	0xfb267ff0	! t0_kref+0x378c:   	st	%f29, [%i1 - 0x10]
	.word	0xd42e2002	! t0_kref+0x3790:   	stb	%o2, [%i0 + 2]
	.word	0x8143c000	! t0_kref+0x3794:   	stbar
	.word	0x2b1f99fc	! t0_kref+0x3798:   	sethi	%hi(0x7e67f000), %l5
	.word	0x812e800d	! t0_kref+0x379c:   	sll	%i2, %o5, %g0
	.word	0xada00531	! t0_kref+0x37a0:   	fsqrts	%f17, %f22
	.word	0x81dd0000	! t0_kref+0x37a4:   	flush	%l4
	.word	0xa5a01a34	! t0_kref+0x37a8:   	fstoi	%f20, %f18
	.word	0x38800002	! t0_kref+0x37ac:   	bgu,a	_kref+0x37b4
	.word	0xd8200018	! t0_kref+0x37b0:   	st	%o4, [%g0 + %i0]
	.word	0xee28a01b	! t0_kref+0x37b4:   	stb	%l7, [%g2 + 0x1b]
	.word	0xe848a02a	! t0_kref+0x37b8:   	ldsb	[%g2 + 0x2a], %l4
	.word	0x9bb34309	! t0_kref+0x37bc:   	alignaddr	%o5, %o1, %o5
	.word	0xaab2aa2f	! t0_kref+0x37c0:   	orncc	%o2, 0xa2f, %l5
	.word	0xa1a489ce	! t0_kref+0x37c4:   	fdivd	%f18, %f14, %f16
	.word	0x3a480008	! t0_kref+0x37c8:   	bcc,a,pt	%icc, _kref+0x37e8
	.word	0xa8d20015	! t0_kref+0x37cc:   	umulcc	%o0, %l5, %l4
	.word	0xd86e6003	! t0_kref+0x37d0:   	ldstub	[%i1 + 3], %o4
	.word	0xee500018	! t0_kref+0x37d4:   	ldsh	[%g0 + %i0], %l7
	.word	0xf1be1817	! t0_kref+0x37d8:   	stda	%f24, [%i0 + %l7]0xc0
	.word	0xbdb6cc78	! t0_kref+0x37dc:   	fnors	%f27, %f24, %f30
	.word	0xec6e6008	! t0_kref+0x37e0:   	ldstub	[%i1 + 8], %l6
	.word	0xed26401c	! t0_kref+0x37e4:   	st	%f22, [%i1 + %i4]
	.word	0xd856c019	! t0_kref+0x37e8:   	ldsh	[%i3 + %i1], %o4
	.word	0xa1ab0058	! t0_kref+0x37ec:   	fmovduge	%fcc0, %f24, %f16
	.word	0xb9a018d6	! t0_kref+0x37f0:   	fdtos	%f22, %f28
	.word	0x962afe37	! t0_kref+0x37f4:   	andn	%o3, -0x1c9, %o3
	.word	0xde063fe8	! t0_kref+0x37f8:   	ld	[%i0 - 0x18], %o7
	.word	0x940a000a	! t0_kref+0x37fc:   	and	%o0, %o2, %o2
	.word	0xf1be584b	! t0_kref+0x3800:   	stda	%f24, [%i1 + %o3]0xc2
	.word	0x81834000	! t0_kref+0x3804:   	wr	%o5, %g0, %y
	.word	0xbba018ce	! t0_kref+0x3808:   	fdtos	%f14, %f29
	.word	0x8143c000	! t0_kref+0x380c:   	stbar
	.word	0xee470019	! t0_kref+0x3810:   	ldsw	[%i4 + %i1], %l7
	.word	0xada0055a	! t0_kref+0x3814:   	fsqrtd	%f26, %f22
	.word	0x39480006	! t0_kref+0x3818:   	fbuge,a,pt	%fcc0, _kref+0x3830
	.word	0xaba01a35	! t0_kref+0x381c:   	fstoi	%f21, %f21
	.word	0x37800006	! t0_kref+0x3820:   	fbge,a	_kref+0x3838
	.word	0xa9b50dd6	! t0_kref+0x3824:   	fnand	%f20, %f22, %f20
	.word	0xe700a014	! t0_kref+0x3828:   	ld	[%g2 + 0x14], %f19
	.word	0x980b4017	! t0_kref+0x382c:   	and	%o5, %l7, %o4
	.word	0x9e72644d	! t0_kref+0x3830:   	udiv	%o1, 0x44d, %o7
	.word	0x90adeacc	! t0_kref+0x3834:   	andncc	%l7, 0xacc, %o0
	.word	0x81de4015	! t0_kref+0x3838:   	flush	%i1 + %l5
	.word	0xa9a01934	! t0_kref+0x383c:   	fstod	%f20, %f20
	.word	0x9802c00d	! t0_kref+0x3840:   	add	%o3, %o5, %o4
	.word	0xa85260aa	! t0_kref+0x3844:   	umul	%o1, 0xaa, %l4
	.word	0xd8a81018	! t0_kref+0x3848:   	stba	%o4, [%g0 + %i0]0x80
	.word	0xa7a01896	! t0_kref+0x384c:   	fitos	%f22, %f19
	.word	0x81ad8ade	! t0_kref+0x3850:   	fcmped	%fcc0, %f22, %f30
	.word	0x3a800003	! t0_kref+0x3854:   	bcc,a	_kref+0x3860
	.word	0xb9a0193a	! t0_kref+0x3858:   	fstod	%f26, %f28
	.word	0xb9b50abd	! t0_kref+0x385c:   	fpsub16s	%f20, %f29, %f28
	.word	0xbda000bb	! t0_kref+0x3860:   	fnegs	%f27, %f30
	.word	0x9452801a	! t0_kref+0x3864:   	umul	%o2, %i2, %o2
	.word	0xa1a78836	! t0_kref+0x3868:   	fadds	%f30, %f22, %f16
	.word	0x9126800a	! t0_kref+0x386c:   	mulscc	%i2, %o2, %o0
	.word	0x96d2c01a	! t0_kref+0x3870:   	umulcc	%o3, %i2, %o3
	.word	0x805ab23f	! t0_kref+0x3874:   	smul	%o2, -0xdc1, %g0
	.word	0x95b300ac	! t0_kref+0x3878:   	edge16n	%o4, %o4, %o2
	.word	0xa8d34016	! t0_kref+0x387c:   	umulcc	%o5, %l6, %l4
	.word	0x91100017	! t0_kref+0x3880:   	taddcctv	%g0, %l7, %o0
	.word	0xe96e401d	! t0_kref+0x3884:   	prefetch	%i1 + %i5, 20
	.word	0x9da01a58	! t0_kref+0x3888:   	fdtoi	%f24, %f14
	.word	0xb5b00ccc	! t0_kref+0x388c:   	fnot2	%f12, %f26
	.word	0xf500a00c	! t0_kref+0x3890:   	ld	[%g2 + 0xc], %f26
	.word	0x38480008	! t0_kref+0x3894:   	bgu,a,pt	%icc, _kref+0x38b4
	.word	0xee566014	! t0_kref+0x3898:   	ldsh	[%i1 + 0x14], %l7
	.word	0xd64e7ff5	! t0_kref+0x389c:   	ldsb	[%i1 - 0xb], %o3
	.word	0x948e800b	! t0_kref+0x38a0:   	andcc	%i2, %o3, %o2
	.word	0xee0e2007	! t0_kref+0x38a4:   	ldub	[%i0 + 7], %l7
	.word	0xafa6c833	! t0_kref+0x38a8:   	fadds	%f27, %f19, %f23
	.word	0x37480005	! t0_kref+0x38ac:   	fbge,a,pt	%fcc0, _kref+0x38c0
	.word	0x92d30000	! t0_kref+0x38b0:   	umulcc	%o4, %g0, %o1
	.word	0x9fa6083a	! t0_kref+0x38b4:   	fadds	%f24, %f26, %f15
	.word	0xf007bfe0	! t0_kref+0x38b8:   	ld	[%fp - 0x20], %i0
	.word	0xa1b40c58	! t0_kref+0x38bc:   	fnor	%f16, %f24, %f16
	.word	0x961ac008	! t0_kref+0x38c0:   	xor	%o3, %o0, %o3
	.word	0xa4e2c01a	! t0_kref+0x38c4:   	subccc	%o3, %i2, %l2
	.word	0x97b60554	! t0_kref+0x38c8:   	fcmpeq16	%f24, %f20, %o3
	.word	0x2a800003	! t0_kref+0x38cc:   	bcs,a	_kref+0x38d8
	.word	0xe4180019	! t0_kref+0x38d0:   	ldd	[%g0 + %i1], %l2
	.word	0x9fc10000	! t0_kref+0x38d4:   	call	%g4
	.word	0x80fb0015	! t0_kref+0x38d8:   	sdivcc	%o4, %l5, %g0
	.word	0xa7b54176	! t0_kref+0x38dc:   	edge32ln	%l5, %l6, %l3
	.word	0xa7b30a70	! t0_kref+0x38e0:   	fpadd32s	%f12, %f16, %f19
	.word	0xa5a01931	! t0_kref+0x38e4:   	fstod	%f17, %f18
	.word	0xae2dc01a	! t0_kref+0x38e8:   	andn	%l7, %i2, %l7
	.word	0xda20a020	! t0_kref+0x38ec:   	st	%o5, [%g2 + 0x20]
	.word	0x908de74d	! t0_kref+0x38f0:   	andcc	%l7, 0x74d, %o0
	.word	0xc5ee100b	! t0_kref+0x38f4:   	prefetcha	%i0 + %o3, 2
	.word	0xb3a018d2	! t0_kref+0x38f8:   	fdtos	%f18, %f25
	.word	0xe610a02e	! t0_kref+0x38fc:   	lduh	[%g2 + 0x2e], %l3
	.word	0xd67e001c	! t0_kref+0x3900:   	swap	[%i0 + %i4], %o3
	.word	0x81580000	! t0_kref+0x3904:   	flushw
	.word	0x81abca30	! t0_kref+0x3908:   	fcmps	%fcc0, %f15, %f16
	.word	0xee48a02b	! t0_kref+0x390c:   	ldsb	[%g2 + 0x2b], %l7
	.word	0xeb00a03c	! t0_kref+0x3910:   	ld	[%g2 + 0x3c], %f21
	.word	0x97b5417a	! t0_kref+0x3914:   	edge32ln	%l5, %i2, %o3
	.word	0xf3063fe8	! t0_kref+0x3918:   	ld	[%i0 - 0x18], %f25
	.word	0xe91e6008	! t0_kref+0x391c:   	ldd	[%i1 + 8], %f20
	.word	0xde40a004	! t0_kref+0x3920:   	ldsw	[%g2 + 4], %o7
	.word	0x2d800004	! t0_kref+0x3924:   	fbg,a	_kref+0x3934
	.word	0x9bb0001a	! t0_kref+0x3928:   	edge8	%g0, %i2, %o5
	.word	0xe968a004	! t0_kref+0x392c:   	prefetch	%g2 + 4, 20
	.word	0x9f414000	! t0_kref+0x3930:   	mov	%pc, %o7
	.word	0xa5a5083a	! t0_kref+0x3934:   	fadds	%f20, %f26, %f18
	.word	0xd84e4000	! t0_kref+0x3938:   	ldsb	[%i1], %o4
	.word	0xb5a0191d	! t0_kref+0x393c:   	fitod	%f29, %f26
	.word	0x90633c7c	! t0_kref+0x3940:   	subc	%o4, -0x384, %o0
	.word	0x9f2579fd	! t0_kref+0x3944:   	mulscc	%l5, -0x603, %o7
	.word	0x962e8000	! t0_kref+0x3948:   	andn	%i2, %g0, %o3
	.word	0x81dde94e	! t0_kref+0x394c:   	flush	%l7 + 0x94e
	.word	0x81dc7209	! t0_kref+0x3950:   	flush	%l1 - 0xdf7
	.word	0xa52e8017	! t0_kref+0x3954:   	sll	%i2, %l7, %l2
	.word	0xa1b78c96	! t0_kref+0x3958:   	fandnot2	%f30, %f22, %f16
	.word	0xd428a03c	! t0_kref+0x395c:   	stb	%o2, [%g2 + 0x3c]
	.word	0xae623428	! t0_kref+0x3960:   	subc	%o0, -0xbd8, %l7
	.word	0x90bac000	! t0_kref+0x3964:   	xnorcc	%o3, %g0, %o0
	.word	0x2d800008	! t0_kref+0x3968:   	fbg,a	_kref+0x3988
	.word	0xe6c01019	! t0_kref+0x396c:   	ldswa	[%g0 + %i1]0x80, %l3
	.word	0xa40e8016	! t0_kref+0x3970:   	and	%i2, %l6, %l2
	.word	0x81ac0a5c	! t0_kref+0x3974:   	fcmpd	%fcc0, %f16, %f28
	.word	0xb9a01917	! t0_kref+0x3978:   	fitod	%f23, %f28
	.word	0xadb00cdc	! t0_kref+0x397c:   	fnot2	%f28, %f22
	.word	0xd448a004	! t0_kref+0x3980:   	ldsb	[%g2 + 4], %o2
	.word	0xc368a002	! t0_kref+0x3984:   	prefetch	%g2 + 2, 1
	.word	0xb7b00cf6	! t0_kref+0x3988:   	fnot2s	%f22, %f27
	.word	0xc028a013	! t0_kref+0x398c:   	clrb	[%g2 + 0x13]
	.word	0xb5a0013b	! t0_kref+0x3990:   	fabss	%f27, %f26
	.word	0x20800006	! t0_kref+0x3994:   	bn,a	_kref+0x39ac
	.word	0x94c6a45a	! t0_kref+0x3998:   	addccc	%i2, 0x45a, %o2
	.word	0xa7b48d3d	! t0_kref+0x399c:   	fandnot1s	%f18, %f29, %f19
	.word	0xa52a8016	! t0_kref+0x39a0:   	sll	%o2, %l6, %l2
	.word	0xd8d6101b	! t0_kref+0x39a4:   	ldsha	[%i0 + %i3]0x80, %o4
	.word	0x9fb00c20	! t0_kref+0x39a8:   	fzeros	%f15
	.word	0xbdb44a37	! t0_kref+0x39ac:   	fpadd16s	%f17, %f23, %f30
	.word	0xa5b70719	! t0_kref+0x39b0:   	fmuld8sux16	%f28, %f25, %f18
	.word	0x3c480002	! t0_kref+0x39b4:   	bpos,a,pt	%icc, _kref+0x39bc
	.word	0xc56e4009	! t0_kref+0x39b8:   	prefetch	%i1 + %o1, 2
	.word	0x8143c000	! t0_kref+0x39bc:   	stbar
	.word	0xa9a308d4	! t0_kref+0x39c0:   	fsubd	%f12, %f20, %f20
	.word	0xa3b4ca3a	! t0_kref+0x39c4:   	fpadd16s	%f19, %f26, %f17
	.word	0x9452ec44	! t0_kref+0x39c8:   	umul	%o3, 0xc44, %o2
	.word	0xd430a008	! t0_kref+0x39cc:   	sth	%o2, [%g2 + 8]
	.word	0x24480004	! t0_kref+0x39d0:   	ble,a,pt	%icc, _kref+0x39e0
	.word	0x99a0004e	! t0_kref+0x39d4:   	fmovd	%f14, %f12
	.word	0x96954015	! t0_kref+0x39d8:   	orcc	%l5, %l5, %o3
	.word	0xb5a58d36	! t0_kref+0x39dc:   	fsmuld	%f22, %f22, %f26
	.word	0xb9a00556	! t0_kref+0x39e0:   	fsqrtd	%f22, %f28
	.word	0x80f031dd	! t0_kref+0x39e4:   	udivcc	%g0, -0xe23, %g0
	.word	0x969ab3cf	! t0_kref+0x39e8:   	xorcc	%o2, -0xc31, %o3
	.word	0xea2e7fe1	! t0_kref+0x39ec:   	stb	%l5, [%i1 - 0x1f]
	.word	0xe83e6018	! t0_kref+0x39f0:   	std	%l4, [%i1 + 0x18]
	.word	0x96257701	! t0_kref+0x39f4:   	sub	%l5, -0x8ff, %o3
	.word	0x963db8dd	! t0_kref+0x39f8:   	xnor	%l6, -0x723, %o3
	.word	0x922d7a60	! t0_kref+0x39fc:   	andn	%l5, -0x5a0, %o1
	.word	0x81aeca3c	! t0_kref+0x3a00:   	fcmps	%fcc0, %f27, %f28
	.word	0x9695c016	! t0_kref+0x3a04:   	orcc	%l7, %l6, %o3
	.word	0xa85d800c	! t0_kref+0x3a08:   	smul	%l6, %o4, %l4
	.word	0xa62ebf14	! t0_kref+0x3a0c:   	andn	%i2, -0xec, %l3
	.word	0xb9b68ab7	! t0_kref+0x3a10:   	fpsub16s	%f26, %f23, %f28
	.word	0xa5a00530	! t0_kref+0x3a14:   	fsqrts	%f16, %f18
	.word	0xc807bfec	! t0_kref+0x3a18:   	ld	[%fp - 0x14], %g4
	.word	0x92834015	! t0_kref+0x3a1c:   	addcc	%o5, %l5, %o1
	.word	0xe8067fe8	! t0_kref+0x3a20:   	ld	[%i1 - 0x18], %l4
	.word	0x2f480001	! t0_kref+0x3a24:   	fbu,a,pt	%fcc0, _kref+0x3a28
	.word	0x01203627	! t0_kref+0x3a28:   	sethi	%hi(0x80d89c00), %g0
	.word	0x8170000b	! t0_kref+0x3a2c:   	popc	%o3, %g0
	.word	0x3d480001	! t0_kref+0x3a30:   	fbule,a,pt	%fcc0, _kref+0x3a34
	.word	0xafb50596	! t0_kref+0x3a34:   	fcmpgt32	%f20, %f22, %l7
	.word	0x99a01a54	! t0_kref+0x3a38:   	fdtoi	%f20, %f12
	.word	0x22800001	! t0_kref+0x3a3c:   	be,a	_kref+0x3a40
	.word	0xea26001c	! t0_kref+0x3a40:   	st	%l5, [%i0 + %i4]
	.word	0x9a0b4009	! t0_kref+0x3a44:   	and	%o5, %o1, %o5
	.word	0xd88e9019	! t0_kref+0x3a48:   	lduba	[%i2 + %i1]0x80, %o4
	.word	0xb1a0193c	! t0_kref+0x3a4c:   	fstod	%f28, %f24
	.word	0x9535c00a	! t0_kref+0x3a50:   	srl	%l7, %o2, %o2
	.word	0x92e68009	! t0_kref+0x3a54:   	subccc	%i2, %o1, %o1
	.word	0x807261ee	! t0_kref+0x3a58:   	udiv	%o1, 0x1ee, %g0
	.word	0xd808a014	! t0_kref+0x3a5c:   	ldub	[%g2 + 0x14], %o4
	.word	0xb9a0191d	! t0_kref+0x3a60:   	fitod	%f29, %f28
	.word	0xa9b40db5	! t0_kref+0x3a64:   	fxors	%f16, %f21, %f20
	.word	0xec1e7fe8	! t0_kref+0x3a68:   	ldd	[%i1 - 0x18], %l6
	.word	0x99a7085e	! t0_kref+0x3a6c:   	faddd	%f28, %f30, %f12
	.word	0x9b35a015	! t0_kref+0x3a70:   	srl	%l6, 0x15, %o5
	.word	0xa892adf1	! t0_kref+0x3a74:   	orcc	%o2, 0xdf1, %l4
	.word	0xa92b000b	! t0_kref+0x3a78:   	sll	%o4, %o3, %l4
	.word	0xab02f09c	! t0_kref+0x3a7c:   	taddcc	%o3, -0xf64, %l5
	.word	0xa1a0055e	! t0_kref+0x3a80:   	fsqrtd	%f30, %f16
	.word	0xa62e8016	! t0_kref+0x3a84:   	andn	%i2, %l6, %l3
	.word	0xb9a01935	! t0_kref+0x3a88:   	fstod	%f21, %f28
	.word	0x8143c000	! t0_kref+0x3a8c:   	stbar
	.word	0xada0192d	! t0_kref+0x3a90:   	fstod	%f13, %f22
	.word	0xe6d6d040	! t0_kref+0x3a94:   	ldsha	[%i3]0x82, %l3
	.word	0xfb063fe0	! t0_kref+0x3a98:   	ld	[%i0 - 0x20], %f29
	.word	0x9b2a2005	! t0_kref+0x3a9c:   	sll	%o0, 0x5, %o5
	.word	0x3e480006	! t0_kref+0x3aa0:   	bvc,a,pt	%icc, _kref+0x3ab8
	.word	0xd44e0000	! t0_kref+0x3aa4:   	ldsb	[%i0], %o2
	.word	0x98824009	! t0_kref+0x3aa8:   	addcc	%o1, %o1, %o4
	.word	0x001fffff	! t0_kref+0x3aac:   	illtrap	0x1fffff
	.word	0xde4e4000	! t0_kref+0x3ab0:   	ldsb	[%i1], %o7
	.word	0xa6758016	! t0_kref+0x3ab4:   	udiv	%l6, %l6, %l3
	.word	0x3c800007	! t0_kref+0x3ab8:   	bpos,a	_kref+0x3ad4
	.word	0xda30a018	! t0_kref+0x3abc:   	sth	%o5, [%g2 + 0x18]
	.word	0x9ba5c837	! t0_kref+0x3ac0:   	fadds	%f23, %f23, %f13
	.word	0x9472400d	! t0_kref+0x3ac4:   	udiv	%o1, %o5, %o2
	.word	0x81ad8a2c	! t0_kref+0x3ac8:   	fcmps	%fcc0, %f22, %f12
	.word	0x97b6848e	! t0_kref+0x3acc:   	fcmple32	%f26, %f14, %o3
	.word	0x90d30016	! t0_kref+0x3ad0:   	umulcc	%o4, %l6, %o0
	.word	0xac6338de	! t0_kref+0x3ad4:   	subc	%o4, -0x722, %l6
	.word	0xd848a02d	! t0_kref+0x3ad8:   	ldsb	[%g2 + 0x2d], %o4
	.word	0xf93e2018	! t0_kref+0x3adc:   	std	%f28, [%i0 + 0x18]
	call	1f
	.empty
	.word	0x92f27b1d	! t0_kref+0x3ae4:   	udivcc	%o1, -0x4e3, %o1
	.word	0xe4d01019	! t0_kref+0x3ae8:   	ldsha	[%g0 + %i1]0x80, %l2
	.word	0xe120a010	! t0_kref+0x3aec:   	st	%f16, [%g2 + 0x10]
	.word	0xabb64a3e	! t0_kref+0x3af0:   	fpadd16s	%f25, %f30, %f21
	.word	0x99b00ccc	! t0_kref+0x3af4:   	fnot2	%f12, %f12
	.word	0xae36b8c1	! t0_kref+0x3af8:   	orn	%i2, -0x73f, %l7
	.word	0xd630a012	! t0_kref+0x3afc:   	sth	%o3, [%g2 + 0x12]
	.word	0xa6aa000b	! t0_kref+0x3b00:   	andncc	%o0, %o3, %l3
1:	.word	0xa3b38ab0	! t0_kref+0x3b04:   	fpsub16s	%f14, %f16, %f17
	.word	0xb9a00556	! t0_kref+0x3b08:   	fsqrtd	%f22, %f28
	.word	0xa7b3cab5	! t0_kref+0x3b0c:   	fpsub16s	%f15, %f21, %f19
	.word	0x988b36ca	! t0_kref+0x3b10:   	andcc	%o4, -0x936, %o4
	.word	0xa8730017	! t0_kref+0x3b14:   	udiv	%o4, %l7, %l4
	.word	0xa6e5b4e4	! t0_kref+0x3b18:   	subccc	%l6, -0xb1c, %l3
	.word	0xafb484d8	! t0_kref+0x3b1c:   	fcmpne32	%f18, %f24, %l7
	.word	0x9935400d	! t0_kref+0x3b20:   	srl	%l5, %o5, %o4
	.word	0x8143c000	! t0_kref+0x3b24:   	stbar
	.word	0x968b4008	! t0_kref+0x3b28:   	andcc	%o5, %o0, %o3
	.word	0x3a800008	! t0_kref+0x3b2c:   	bcc,a	_kref+0x3b4c
	.word	0xb7b30ef7	! t0_kref+0x3b30:   	fornot2s	%f12, %f23, %f27
	.word	0xa9b586d0	! t0_kref+0x3b34:   	fmul8sux16	%f22, %f16, %f20
	.word	0x21800004	! t0_kref+0x3b38:   	fbn,a	_kref+0x3b48
	.word	0xadb0077c	! t0_kref+0x3b3c:   	fpack16	%f28, %f22
	.word	0xacf33c2d	! t0_kref+0x3b40:   	udivcc	%o4, -0x3d3, %l6
	.word	0xa452fce8	! t0_kref+0x3b44:   	umul	%o3, -0x318, %l2
	.word	0xbda018da	! t0_kref+0x3b48:   	fdtos	%f26, %f30
	.word	0xa1a0191e	! t0_kref+0x3b4c:   	fitod	%f30, %f16
	.word	0xf11e6008	! t0_kref+0x3b50:   	ldd	[%i1 + 8], %f24
	.word	0xa3b5cabe	! t0_kref+0x3b54:   	fpsub16s	%f23, %f30, %f17
	.word	0xa65ab86f	! t0_kref+0x3b58:   	smul	%o2, -0x791, %l3
	.word	0xbda0002d	! t0_kref+0x3b5c:   	fmovs	%f13, %f30
	.word	0x9af6b88e	! t0_kref+0x3b60:   	udivcc	%i2, -0x772, %o5
	.word	0x92d20015	! t0_kref+0x3b64:   	umulcc	%o0, %l5, %o1
	.word	0x81ac8a35	! t0_kref+0x3b68:   	fcmps	%fcc0, %f18, %f21
	.word	0xae9b0015	! t0_kref+0x3b6c:   	xorcc	%o4, %l5, %l7
	.word	0xd00e7fe4	! t0_kref+0x3b70:   	ldub	[%i1 - 0x1c], %o0
	.word	0xaa0dc017	! t0_kref+0x3b74:   	and	%l7, %l7, %l5
	.word	0x81b00200	! t0_kref+0x3b78:   	array8	%g0, %g0, %g0
	.word	0x8143c000	! t0_kref+0x3b7c:   	stbar
	.word	0x9e2d800b	! t0_kref+0x3b80:   	andn	%l6, %o3, %o7
	.word	0x9b2b6005	! t0_kref+0x3b84:   	sll	%o5, 0x5, %o5
	.word	0x81418000	! t0_kref+0x3b88:   	mov	%fprs, %g0
	.word	0x80f0000d	! t0_kref+0x3b8c:   	udivcc	%g0, %o5, %g0
	.word	0xde40a024	! t0_kref+0x3b90:   	ldsw	[%g2 + 0x24], %o7
	.word	0x8143e040	! t0_kref+0x3b94:   	membar	0x40
	.word	0x9da00554	! t0_kref+0x3b98:   	fsqrtd	%f20, %f14
	.word	0x95b4041a	! t0_kref+0x3b9c:   	fcmple16	%f16, %f26, %o2
	.word	0xd62e601b	! t0_kref+0x3ba0:   	stb	%o3, [%i1 + 0x1b]
	.word	0xd2a65000	! t0_kref+0x3ba4:   	sta	%o1, [%i1]0x80
	.word	0x9672800b	! t0_kref+0x3ba8:   	udiv	%o2, %o3, %o3
	.word	0xec10a000	! t0_kref+0x3bac:   	lduh	[%g2], %l6
	.word	0xa40da1dc	! t0_kref+0x3bb0:   	and	%l6, 0x1dc, %l2
	.word	0x35800002	! t0_kref+0x3bb4:   	fbue,a	_kref+0x3bbc
	.word	0xada0053d	! t0_kref+0x3bb8:   	fsqrts	%f29, %f22
	.word	0x9922000d	! t0_kref+0x3bbc:   	mulscc	%o0, %o5, %o4
	.word	0x35800001	! t0_kref+0x3bc0:   	fbue,a	_kref+0x3bc4
	.word	0xa7b605d0	! t0_kref+0x3bc4:   	fcmpeq32	%f24, %f16, %l3
	.word	0xa472f1fa	! t0_kref+0x3bc8:   	udiv	%o3, -0xe06, %l2
	.word	0x9322a219	! t0_kref+0x3bcc:   	mulscc	%o2, 0x219, %o1
	.word	0xada00558	! t0_kref+0x3bd0:   	fsqrtd	%f24, %f22
	.word	0x3d800007	! t0_kref+0x3bd4:   	fbule,a	_kref+0x3bf0
	.word	0xa62a8008	! t0_kref+0x3bd8:   	andn	%o2, %o0, %l3
	.word	0x969d400d	! t0_kref+0x3bdc:   	xorcc	%l5, %o5, %o3
	.word	0x3a800007	! t0_kref+0x3be0:   	bcc,a	_kref+0x3bfc
	.word	0x9bb34169	! t0_kref+0x3be4:   	edge32ln	%o5, %o1, %o5
	.word	0xa5a0190f	! t0_kref+0x3be8:   	fitod	%f15, %f18
	.word	0xfb267fe0	! t0_kref+0x3bec:   	st	%f29, [%i1 - 0x20]
	.word	0x001fffff	! t0_kref+0x3bf0:   	illtrap	0x1fffff
	.word	0xa4da800d	! t0_kref+0x3bf4:   	smulcc	%o2, %o5, %l2
	.word	0xac15ba58	! t0_kref+0x3bf8:   	or	%l6, -0x5a8, %l6
	.word	0xe1067fe4	! t0_kref+0x3bfc:   	ld	[%i1 - 0x1c], %f16
	.word	0x81db269c	! t0_kref+0x3c00:   	flush	%o4 + 0x69c
	.word	0xbda44d34	! t0_kref+0x3c04:   	fsmuld	%f17, %f20, %f30
	.word	0x81af0ada	! t0_kref+0x3c08:   	fcmped	%fcc0, %f28, %f26
	.word	0x81af4a38	! t0_kref+0x3c0c:   	fcmps	%fcc0, %f29, %f24
	.word	0x9bb4055a	! t0_kref+0x3c10:   	fcmpeq16	%f16, %f26, %o5
	.word	0x20800005	! t0_kref+0x3c14:   	bn,a	_kref+0x3c28
	.word	0xac75ff5a	! t0_kref+0x3c18:   	udiv	%l7, -0xa6, %l6
	.word	0xb7b50abb	! t0_kref+0x3c1c:   	fpsub16s	%f20, %f27, %f27
	.word	0xd428a024	! t0_kref+0x3c20:   	stb	%o2, [%g2 + 0x24]
	.word	0xec263ff8	! t0_kref+0x3c24:   	st	%l6, [%i0 - 8]
	.word	0xec000019	! t0_kref+0x3c28:   	ld	[%g0 + %i1], %l6
	.word	0xf5063fe8	! t0_kref+0x3c2c:   	ld	[%i0 - 0x18], %f26
	.word	0xa7828015	! t0_kref+0x3c30:   	wr	%o2, %l5, %gsr
	.word	0xa9b00fc0	! t0_kref+0x3c34:   	fone	%f20
	.word	0x99a708dc	! t0_kref+0x3c38:   	fsubd	%f28, %f28, %f12
	.word	0xa502800d	! t0_kref+0x3c3c:   	taddcc	%o2, %o5, %l2
	.word	0xadb30176	! t0_kref+0x3c40:   	edge32ln	%o4, %l6, %l6
	.word	0x99a00558	! t0_kref+0x3c44:   	fsqrtd	%f24, %f12
	.word	0xee000019	! t0_kref+0x3c48:   	ld	[%g0 + %i1], %l7
	.word	0x34800005	! t0_kref+0x3c4c:   	bg,a	_kref+0x3c60
	.word	0x93b58008	! t0_kref+0x3c50:   	edge8	%l6, %o0, %o1
	.word	0xabb504cc	! t0_kref+0x3c54:   	fcmpne32	%f20, %f12, %l5
	.word	0xacdb400a	! t0_kref+0x3c58:   	smulcc	%o5, %o2, %l6
	.word	0xe520a034	! t0_kref+0x3c5c:   	st	%f18, [%g2 + 0x34]
	.word	0x2b480004	! t0_kref+0x3c60:   	fbug,a,pt	%fcc0, _kref+0x3c70
	.word	0xa925401a	! t0_kref+0x3c64:   	mulscc	%l5, %i2, %l4
	.word	0xac76a3c4	! t0_kref+0x3c68:   	udiv	%i2, 0x3c4, %l6
	.word	0x81db4013	! t0_kref+0x3c6c:   	flush	%o5 + %l3
	.word	0xe07e001c	! t0_kref+0x3c70:   	swap	[%i0 + %i4], %l0
	.word	0x86102001	! t0_kref+0x3c74:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x3c78:   	bne,a	_kref+0x3c78
	.word	0x86a0e001	! t0_kref+0x3c7c:   	subcc	%g3, 1, %g3
	.word	0xe8060000	! t0_kref+0x3c80:   	ld	[%i0], %l4
	.word	0x99b40e79	! t0_kref+0x3c84:   	fxnors	%f16, %f25, %f12
	.word	0xd6280019	! t0_kref+0x3c88:   	stb	%o3, [%g0 + %i1]
	.word	0xf520a004	! t0_kref+0x3c8c:   	st	%f26, [%g2 + 4]
	.word	0xa9b38db0	! t0_kref+0x3c90:   	fxors	%f14, %f16, %f20
	.word	0x99b38e5e	! t0_kref+0x3c94:   	fxnor	%f14, %f30, %f12
	.word	0xbdb00fc0	! t0_kref+0x3c98:   	fone	%f30
	.word	0xd830a02e	! t0_kref+0x3c9c:   	sth	%o4, [%g2 + 0x2e]
	.word	0x9252f58f	! t0_kref+0x3ca0:   	umul	%o3, -0xa71, %o1
	.word	0xe47e6014	! t0_kref+0x3ca4:   	swap	[%i1 + 0x14], %l2
	.word	0xb3a00532	! t0_kref+0x3ca8:   	fsqrts	%f18, %f25
	.word	0xe41e2010	! t0_kref+0x3cac:   	ldd	[%i0 + 0x10], %l2
	.word	0x9ef2000d	! t0_kref+0x3cb0:   	udivcc	%o0, %o5, %o7
	.word	0xd448a032	! t0_kref+0x3cb4:   	ldsb	[%g2 + 0x32], %o2
	.word	0xadb2016c	! t0_kref+0x3cb8:   	edge32ln	%o0, %o4, %l6
	.word	0xa8724015	! t0_kref+0x3cbc:   	udiv	%o1, %l5, %l4
	.word	0xa9a588cc	! t0_kref+0x3cc0:   	fsubd	%f22, %f12, %f20
	.word	0xa4d0000d	! t0_kref+0x3cc4:   	umulcc	%g0, %o5, %l2
	.word	0x3c800006	! t0_kref+0x3cc8:   	bpos,a	_kref+0x3ce0
	.word	0xa1a00538	! t0_kref+0x3ccc:   	fsqrts	%f24, %f16
	.word	0xf1be5856	! t0_kref+0x3cd0:   	stda	%f24, [%i1 + %l6]0xc2
	.word	0x912376b8	! t0_kref+0x3cd4:   	mulscc	%o5, -0x948, %o0
	.word	0xaa0ae4be	! t0_kref+0x3cd8:   	and	%o3, 0x4be, %l5
	.word	0xa5a01936	! t0_kref+0x3cdc:   	fstod	%f22, %f18
	.word	0xbda01a31	! t0_kref+0x3ce0:   	fstoi	%f17, %f30
	.word	0xa49a62b6	! t0_kref+0x3ce4:   	xorcc	%o1, 0x2b6, %l2
	.word	0x9bb5c16c	! t0_kref+0x3ce8:   	edge32ln	%l7, %o4, %o5
	.word	0xb1b00fc0	! t0_kref+0x3cec:   	fone	%f24
	.word	0x23480007	! t0_kref+0x3cf0:   	fbne,a,pt	%fcc0, _kref+0x3d0c
	.word	0x9bb54e33	! t0_kref+0x3cf4:   	fands	%f21, %f19, %f13
	.word	0x90583bdd	! t0_kref+0x3cf8:   	smul	%g0, -0x423, %o0
	.word	0xa8b27d6a	! t0_kref+0x3cfc:   	orncc	%o1, -0x296, %l4
	.word	0x2a800001	! t0_kref+0x3d00:   	bcs,a	_kref+0x3d04
	.word	0x80f56fd3	! t0_kref+0x3d04:   	udivcc	%l5, 0xfd3, %g0
	.word	0xe5f6500a	! t0_kref+0x3d08:   	casxa	[%i1]0x80, %o2, %l2
	.word	0xee801019	! t0_kref+0x3d0c:   	lda	[%g0 + %i1]0x80, %l7
	.word	0xe68e9018	! t0_kref+0x3d10:   	lduba	[%i2 + %i0]0x80, %l3
	.word	0xafb58009	! t0_kref+0x3d14:   	edge8	%l6, %o1, %l7
	.word	0x32800002	! t0_kref+0x3d18:   	bne,a	_kref+0x3d20
	.word	0xa3a00539	! t0_kref+0x3d1c:   	fsqrts	%f25, %f17
	.word	0xb7a30838	! t0_kref+0x3d20:   	fadds	%f12, %f24, %f27
	.word	0xa9254009	! t0_kref+0x3d24:   	mulscc	%l5, %o1, %l4
	.word	0x81ae8a5a	! t0_kref+0x3d28:   	fcmpd	%fcc0, %f26, %f26
	.word	0x9bb7854c	! t0_kref+0x3d2c:   	fcmpeq16	%f30, %f12, %o5
	.word	0x3a480005	! t0_kref+0x3d30:   	bcc,a,pt	%icc, _kref+0x3d44
	.word	0x921af747	! t0_kref+0x3d34:   	xor	%o3, -0x8b9, %o1
	.word	0xc96e001a	! t0_kref+0x3d38:   	prefetch	%i0 + %i2, 4
	.word	0x942ebdac	! t0_kref+0x3d3c:   	andn	%i2, -0x254, %o2
	.word	0x97400000	! t0_kref+0x3d40:   	mov	%y, %o3
	.word	0xbda00550	! t0_kref+0x3d44:   	fsqrtd	%f16, %f30
	.word	0xc04e001a	! t0_kref+0x3d48:   	ldsb	[%i0 + %i2], %g0
	.word	0xf7262014	! t0_kref+0x3d4c:   	st	%f27, [%i0 + 0x14]
	.word	0x9da50d35	! t0_kref+0x3d50:   	fsmuld	%f20, %f21, %f14
	.word	0xd628a022	! t0_kref+0x3d54:   	stb	%o3, [%g2 + 0x22]
	.word	0x26480006	! t0_kref+0x3d58:   	bl,a,pt	%icc, _kref+0x3d70
	.word	0x8143c000	! t0_kref+0x3d5c:   	stbar
	.word	0xb7a018d0	! t0_kref+0x3d60:   	fdtos	%f16, %f27
	.word	0xada00558	! t0_kref+0x3d64:   	fsqrtd	%f24, %f22
	.word	0xbdb30df1	! t0_kref+0x3d68:   	fnands	%f12, %f17, %f30
	.word	0x92fb36e6	! t0_kref+0x3d6c:   	sdivcc	%o4, -0x91a, %o1
	.word	0x99b70514	! t0_kref+0x3d70:   	fcmpgt16	%f28, %f20, %o4
	.word	0xf1be584a	! t0_kref+0x3d74:   	stda	%f24, [%i1 + %o2]0xc2
	.word	0xd4070018	! t0_kref+0x3d78:   	ld	[%i4 + %i0], %o2
	.word	0xf1981018	! t0_kref+0x3d7c:   	ldda	[%g0 + %i0]0x80, %f24
	.word	0xdf06601c	! t0_kref+0x3d80:   	ld	[%i1 + 0x1c], %f15
	.word	0xd410a018	! t0_kref+0x3d84:   	lduh	[%g2 + 0x18], %o2
	.word	0xec360000	! t0_kref+0x3d88:   	sth	%l6, [%i0]
	.word	0x93122580	! t0_kref+0x3d8c:   	taddcctv	%o0, 0x580, %o1
	.word	0xa9b50d30	! t0_kref+0x3d90:   	fandnot1s	%f20, %f16, %f20
	.word	0x001fffff	! t0_kref+0x3d94:   	illtrap	0x1fffff
	.word	0x9da0190d	! t0_kref+0x3d98:   	fitod	%f13, %f14
	.word	0xabb5c04a	! t0_kref+0x3d9c:   	edge8l	%l7, %o2, %l5
	.word	0xa1b00c20	! t0_kref+0x3da0:   	fzeros	%f16
	.word	0xee30a006	! t0_kref+0x3da4:   	sth	%l7, [%g2 + 6]
	.word	0xa9a0191a	! t0_kref+0x3da8:   	fitod	%f26, %f20
	.word	0xa9a0054e	! t0_kref+0x3dac:   	fsqrtd	%f14, %f20
	.word	0x9de3bfa0	! t0_kref+0x3db0:   	save	%sp, -0x60, %sp
	.word	0xb2173669	! t0_kref+0x3db4:   	or	%i4, -0x997, %i1
	.word	0x93ee2356	! t0_kref+0x3db8:   	restore	%i0, 0x356, %o1
	.word	0x9a5ac008	! t0_kref+0x3dbc:   	smul	%o3, %o0, %o5
	.word	0x90257cdb	! t0_kref+0x3dc0:   	sub	%l5, -0x325, %o0
	.word	0x8143c000	! t0_kref+0x3dc4:   	stbar
	.word	0xbdb3462c	! t0_kref+0x3dc8:   	fmul8x16	%f13, %f12, %f30
	.word	0xe4462004	! t0_kref+0x3dcc:   	ldsw	[%i0 + 4], %l2
	.word	0x96b33326	! t0_kref+0x3dd0:   	orncc	%o4, -0xcda, %o3
	.word	0xada0055c	! t0_kref+0x3dd4:   	fsqrtd	%f28, %f22
	.word	0x97332006	! t0_kref+0x3dd8:   	srl	%o4, 0x6, %o3
	.word	0x905d4015	! t0_kref+0x3ddc:   	smul	%l5, %l5, %o0
	.word	0x001fffff	! t0_kref+0x3de0:   	illtrap	0x1fffff
	.word	0xe5200018	! t0_kref+0x3de4:   	st	%f18, [%g0 + %i0]
	.word	0xb7a000bb	! t0_kref+0x3de8:   	fnegs	%f27, %f27
	.word	0xf91e6000	! t0_kref+0x3dec:   	ldd	[%i1], %f28
	.word	0x99a01a50	! t0_kref+0x3df0:   	fdtoi	%f16, %f12
	.word	0xa9b68029	! t0_kref+0x3df4:   	edge8n	%i2, %o1, %l4
	.word	0x81ab0a54	! t0_kref+0x3df8:   	fcmpd	%fcc0, %f12, %f20
	.word	0xd9267fec	! t0_kref+0x3dfc:   	st	%f12, [%i1 - 0x14]
	.word	0xe07e3ff8	! t0_kref+0x3e00:   	swap	[%i0 - 8], %l0
	.word	0x80f80016	! t0_kref+0x3e04:   	sdivcc	%g0, %l6, %g0
	.word	0x878020f0	! t0_kref+0x3e08:   	mov	0xf0, %asi
	.word	0xc0566010	! t0_kref+0x3e0c:   	ldsh	[%i1 + 0x10], %g0
	.word	0xac0d800a	! t0_kref+0x3e10:   	and	%l6, %o2, %l6
	.word	0xa4e2a1d0	! t0_kref+0x3e14:   	subccc	%o2, 0x1d0, %l2
	.word	0x9fc10000	! t0_kref+0x3e18:   	call	%g4
	.word	0xd4ae501a	! t0_kref+0x3e1c:   	stba	%o2, [%i1 + %i2]0x80
	.word	0xa3a708ad	! t0_kref+0x3e20:   	fsubs	%f28, %f13, %f17
	.word	0xbba0053a	! t0_kref+0x3e24:   	fsqrts	%f26, %f29
	.word	0x37480006	! t0_kref+0x3e28:   	fbge,a,pt	%fcc0, _kref+0x3e40
	.word	0x9a35c015	! t0_kref+0x3e2c:   	orn	%l7, %l5, %o5
	.word	0xb3b48af2	! t0_kref+0x3e30:   	fpsub32s	%f18, %f18, %f25
	.word	0xadb586d8	! t0_kref+0x3e34:   	fmul8sux16	%f22, %f24, %f22
	.word	0xa1a01116	! t0_kref+0x3e38:   	fxtod	%f22, %f16
	.word	0x81b705cc	! t0_kref+0x3e3c:   	fcmpeq32	%f28, %f12, %g0
	.word	0x9e8dfa38	! t0_kref+0x3e40:   	andcc	%l7, -0x5c8, %o7
	.word	0xda200019	! t0_kref+0x3e44:   	st	%o5, [%g0 + %i1]
	.word	0x97400000	! t0_kref+0x3e48:   	mov	%y, %o3
	.word	0x98436dac	! t0_kref+0x3e4c:   	addc	%o5, 0xdac, %o4
	.word	0xd240a018	! t0_kref+0x3e50:   	ldsw	[%g2 + 0x18], %o1
	.word	0xe67f0019	! t0_kref+0x3e54:   	swap	[%i4 + %i1], %l3
	.word	0xa5a01031	! t0_kref+0x3e58:   	fstox	%f17, %f18
	.word	0xe68e101a	! t0_kref+0x3e5c:   	lduba	[%i0 + %i2]0x80, %l3
	.word	0x35800006	! t0_kref+0x3e60:   	fbue,a	_kref+0x3e78
	.word	0x190127d8	! t0_kref+0x3e64:   	sethi	%hi(0x49f6000), %o4
	.word	0xdd262000	! t0_kref+0x3e68:   	st	%f14, [%i0]
	.word	0xe1267ff4	! t0_kref+0x3e6c:   	st	%f16, [%i1 - 0xc]
	.word	0xadb304ce	! t0_kref+0x3e70:   	fcmpne32	%f12, %f14, %l6
	.word	0xd428a025	! t0_kref+0x3e74:   	stb	%o2, [%g2 + 0x25]
	.word	0xeeae9019	! t0_kref+0x3e78:   	stba	%l7, [%i2 + %i1]0x80
	.word	0xf11e0000	! t0_kref+0x3e7c:   	ldd	[%i0], %f24
	.word	0xe808a01e	! t0_kref+0x3e80:   	ldub	[%g2 + 0x1e], %l4
	.word	0xd5f6500b	! t0_kref+0x3e84:   	casxa	[%i1]0x80, %o3, %o2
	.word	0x2b480004	! t0_kref+0x3e88:   	fbug,a,pt	%fcc0, _kref+0x3e98
	.word	0xa5b70e4e	! t0_kref+0x3e8c:   	fxnor	%f28, %f14, %f18
	.word	0xede6101a	! t0_kref+0x3e90:   	casa	[%i0]0x80, %i2, %l6
	.word	0x93b2c308	! t0_kref+0x3e94:   	alignaddr	%o3, %o0, %o1
	.word	0xec20a02c	! t0_kref+0x3e98:   	st	%l6, [%g2 + 0x2c]
	.word	0x8143e040	! t0_kref+0x3e9c:   	membar	0x40
	.word	0x28800002	! t0_kref+0x3ea0:   	bleu,a	_kref+0x3ea8
	.word	0xee360000	! t0_kref+0x3ea4:   	sth	%l7, [%i0]
	.word	0xe3b8a080	! t0_kref+0x3ea8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xd400a008	! t0_kref+0x3eac:   	ld	[%g2 + 8], %o2
	.word	0x9b23000c	! t0_kref+0x3eb0:   	mulscc	%o4, %o4, %o5
	.word	0x900eb431	! t0_kref+0x3eb4:   	and	%i2, -0xbcf, %o0
	.word	0x902a721c	! t0_kref+0x3eb8:   	andn	%o1, -0xde4, %o0
	.word	0x9135a01f	! t0_kref+0x3ebc:   	srl	%l6, 0x1f, %o0
	.word	0xaba58937	! t0_kref+0x3ec0:   	fmuls	%f22, %f23, %f21
	.word	0xc398a040	! t0_kref+0x3ec4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xae25c017	! t0_kref+0x3ec8:   	sub	%l7, %l7, %l7
	.word	0xa1b50a0e	! t0_kref+0x3ecc:   	fpadd16	%f20, %f14, %f16
	.word	0xe84e4000	! t0_kref+0x3ed0:   	ldsb	[%i1], %l4
	.word	0xa1b50ea0	! t0_kref+0x3ed4:   	fsrc1s	%f20, %f16
	.word	0xb9b3470d	! t0_kref+0x3ed8:   	fmuld8sux16	%f13, %f13, %f28
	.word	0x96adf6f4	! t0_kref+0x3edc:   	andncc	%l7, -0x90c, %o3
	.word	0xa7a00539	! t0_kref+0x3ee0:   	fsqrts	%f25, %f19
	.word	0xc04e8019	! t0_kref+0x3ee4:   	ldsb	[%i2 + %i1], %g0
	.word	0xa5b48c8c	! t0_kref+0x3ee8:   	fandnot2	%f18, %f12, %f18
	.word	0xaa2b3c20	! t0_kref+0x3eec:   	andn	%o4, -0x3e0, %l5
	.word	0x2c480007	! t0_kref+0x3ef0:   	bneg,a,pt	%icc, _kref+0x3f0c
	.word	0xaba01a32	! t0_kref+0x3ef4:   	fstoi	%f18, %f21
	.word	0xc398a040	! t0_kref+0x3ef8:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x8143c000	! t0_kref+0x3efc:   	stbar
	.word	0xb7a01a3a	! t0_kref+0x3f00:   	fstoi	%f26, %f27
	.word	0xd420a000	! t0_kref+0x3f04:   	st	%o2, [%g2]
	.word	0xacab0016	! t0_kref+0x3f08:   	andncc	%o4, %l6, %l6
	.word	0xadb5854c	! t0_kref+0x3f0c:   	fcmpeq16	%f22, %f12, %l6
	.word	0x9fb6854c	! t0_kref+0x3f10:   	fcmpeq16	%f26, %f12, %o7
	.word	0xa7400000	! t0_kref+0x3f14:   	mov	%y, %l3
	.word	0x81800000	! t0_kref+0x3f18:   	mov	%g0, %y
	.word	0xada308dc	! t0_kref+0x3f1c:   	fsubd	%f12, %f28, %f22
	.word	0xfd20a038	! t0_kref+0x3f20:   	st	%f30, [%g2 + 0x38]
	.word	0xecbf5018	! t0_kref+0x3f24:   	stda	%l6, [%i5 + %i0]0x80
	.word	0xd8a6101c	! t0_kref+0x3f28:   	sta	%o4, [%i0 + %i4]0x80
	.word	0xaf1a8000	! t0_kref+0x3f2c:   	tsubcctv	%o2, %g0, %l7
	.word	0xac9b6d65	! t0_kref+0x3f30:   	xorcc	%o5, 0xd65, %l6
	.word	0xbba60830	! t0_kref+0x3f34:   	fadds	%f24, %f16, %f29
	.word	0x31480005	! t0_kref+0x3f38:   	fba,a,pt	%fcc0, _kref+0x3f4c
	.word	0xa3b58c73	! t0_kref+0x3f3c:   	fnors	%f22, %f19, %f17
	.word	0xe64e0000	! t0_kref+0x3f40:   	ldsb	[%i0], %l3
	.word	0xb9a01114	! t0_kref+0x3f44:   	fxtod	%f20, %f28
	.word	0xa4724016	! t0_kref+0x3f48:   	udiv	%o1, %l6, %l2
	.word	0x1f262bc6	! t0_kref+0x3f4c:   	sethi	%hi(0x98af1800), %o7
	.word	0xb9a00552	! t0_kref+0x3f50:   	fsqrtd	%f18, %f28
	.word	0xfd1e7fe0	! t0_kref+0x3f54:   	ldd	[%i1 - 0x20], %f30
	.word	0xa1b507ce	! t0_kref+0x3f58:   	pdist	%f20, %f14, %f16
	.word	0x801b0017	! t0_kref+0x3f5c:   	xor	%o4, %l7, %g0
	.word	0xed68a083	! t0_kref+0x3f60:   	prefetch	%g2 + 0x83, 22
	.word	0xbda0054c	! t0_kref+0x3f64:   	fsqrtd	%f12, %f30
	.word	0x9475a9f2	! t0_kref+0x3f68:   	udiv	%l6, 0x9f2, %o2
	.word	0x8d820008	! t0_kref+0x3f6c:   	wr	%o0, %o0, %fprs
	.word	0x9af57831	! t0_kref+0x3f70:   	udivcc	%l5, -0x7cf, %o5
	.word	0x81b585da	! t0_kref+0x3f74:   	fcmpeq32	%f22, %f26, %g0
	.word	0xafa018cc	! t0_kref+0x3f78:   	fdtos	%f12, %f23
	.word	0xee8e5000	! t0_kref+0x3f7c:   	lduba	[%i1]0x80, %l7
	.word	0xe83e2000	! t0_kref+0x3f80:   	std	%l4, [%i0]
	.word	0x83c06e74	! t0_kref+0x3f84:   	jmpl	%g1 + 0xe74, %g1
	.word	0x90d2701e	! t0_kref+0x3f88:   	umulcc	%o1, -0xfe2, %o0
	.word	0xa8156512	! t0_kref+0x3f8c:   	or	%l5, 0x512, %l4
	.word	0xadb00cd6	! t0_kref+0x3f90:   	fnot2	%f22, %f22
	.word	0xa7b40552	! t0_kref+0x3f94:   	fcmpeq16	%f16, %f18, %l3
	.word	0xe51fbee8	! t0_kref+0x3f98:   	ldd	[%fp - 0x118], %f18
	.word	0x989da025	! t0_kref+0x3f9c:   	xorcc	%l6, 0x25, %o4
	.word	0x9a2dc017	! t0_kref+0x3fa0:   	andn	%l7, %l7, %o5
	.word	0xd420a02c	! t0_kref+0x3fa4:   	st	%o2, [%g2 + 0x2c]
	.word	0x81ae0a37	! t0_kref+0x3fa8:   	fcmps	%fcc0, %f24, %f23
	.word	0xbba00537	! t0_kref+0x3fac:   	fsqrts	%f23, %f29
	.word	0x9420309c	! t0_kref+0x3fb0:   	sub	%g0, -0xf64, %o2
	.word	0xd078a034	! t0_kref+0x3fb4:   	swap	[%g2 + 0x34], %o0
	.word	0xb7a01a56	! t0_kref+0x3fb8:   	fdtoi	%f22, %f27
	.word	0x3a800006	! t0_kref+0x3fbc:   	bcc,a	_kref+0x3fd4
	.word	0x921eb63c	! t0_kref+0x3fc0:   	xor	%i2, -0x9c4, %o1
	.word	0x11036fad	! t0_kref+0x3fc4:   	sethi	%hi(0xdbeb400), %o0
	.word	0x948e8016	! t0_kref+0x3fc8:   	andcc	%i2, %l6, %o2
	.word	0x8143c000	! t0_kref+0x3fcc:   	stbar
	.word	0xde50a020	! t0_kref+0x3fd0:   	ldsh	[%g2 + 0x20], %o7
	.word	0x95400000	! t0_kref+0x3fd4:   	mov	%y, %o2
	.word	0x29480003	! t0_kref+0x3fd8:   	fbl,a,pt	%fcc0, _kref+0x3fe4
	.word	0xa9a00550	! t0_kref+0x3fdc:   	fsqrtd	%f16, %f20
	.word	0xec7f0018	! t0_kref+0x3fe0:   	swap	[%i4 + %i0], %l6
	.word	0xc398a040	! t0_kref+0x3fe4:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa1b48ab5	! t0_kref+0x3fe8:   	fpsub16s	%f18, %f21, %f16
	.word	0xc398a040	! t0_kref+0x3fec:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x9412400b	! t0_kref+0x3ff0:   	or	%o1, %o3, %o2
	.word	0xbbb60cba	! t0_kref+0x3ff4:   	fandnot2s	%f24, %f26, %f29
	.word	0x28480007	! t0_kref+0x3ff8:   	bleu,a,pt	%icc, _kref+0x4014
	.word	0xd82e4000	! t0_kref+0x3ffc:   	stb	%o4, [%i1]
	.word	0x81af4a39	! t0_kref+0x4000:   	fcmps	%fcc0, %f29, %f25
	.word	0x8185c000	! t0_kref+0x4004:   	wr	%l7, %g0, %y
	call	SYM(t0_subr1)
	.word	0x945b4015	! t0_kref+0x400c:   	smul	%o5, %l5, %o2
	.word	0x9fb280a0	! t0_kref+0x4010:   	edge16n	%o2, %g0, %o7
	.word	0xc807bff0	! t0_kref+0x4014:   	ld	[%fp - 0x10], %g4
	.word	0xa646b652	! t0_kref+0x4018:   	addc	%i2, -0x9ae, %l3
	.word	0xb9a01912	! t0_kref+0x401c:   	fitod	%f18, %f28
	.word	0x81ab0a32	! t0_kref+0x4020:   	fcmps	%fcc0, %f12, %f18
	.word	0x9db706d2	! t0_kref+0x4024:   	fmul8sux16	%f28, %f18, %f14
	.word	0xf76e2018	! t0_kref+0x4028:   	prefetch	%i0 + 0x18, 27
	.word	0xd050a006	! t0_kref+0x402c:   	ldsh	[%g2 + 6], %o0
	.word	0xee267ff8	! t0_kref+0x4030:   	st	%l7, [%i1 - 8]
	.word	0xd6263ffc	! t0_kref+0x4034:   	st	%o3, [%i0 - 4]
	.word	0xd45e401d	! t0_kref+0x4038:   	ldx	[%i1 + %i5], %o2
	.word	0xfd20a030	! t0_kref+0x403c:   	st	%f30, [%g2 + 0x30]
	.word	0xf430a00c	! t0_kref+0x4040:   	sth	%i2, [%g2 + 0xc]
	.word	0x81ab8a34	! t0_kref+0x4044:   	fcmps	%fcc0, %f14, %f20
	.word	0x2c800002	! t0_kref+0x4048:   	bneg,a	_kref+0x4050
	.word	0xb7b0076e	! t0_kref+0x404c:   	fpack16	%f14, %f27
	call	SYM(t0_subr0)
	.word	0xa9b5054c	! t0_kref+0x4054:   	fcmpeq16	%f20, %f12, %l4
	.word	0x9bb54000	! t0_kref+0x4058:   	edge8	%l5, %g0, %o5
	.word	0xb1b40a92	! t0_kref+0x405c:   	fpsub16	%f16, %f18, %f24
	.word	0x81ad8a33	! t0_kref+0x4060:   	fcmps	%fcc0, %f22, %f19
	.word	0x8143e040	! t0_kref+0x4064:   	membar	0x40
	.word	0xb7a000b7	! t0_kref+0x4068:   	fnegs	%f23, %f27
	.word	0xec7f0019	! t0_kref+0x406c:   	swap	[%i4 + %i1], %l6
	.word	0xd0066008	! t0_kref+0x4070:   	ld	[%i1 + 8], %o0
	.word	0xd3e61016	! t0_kref+0x4074:   	casa	[%i0]0x80, %l6, %o1
	.word	0x9170000a	! t0_kref+0x4078:   	popc	%o2, %o0
	.word	0x85802a35	! t0_kref+0x407c:   	mov	0xa35, %ccr
	.word	0xfb20a030	! t0_kref+0x4080:   	st	%f29, [%g2 + 0x30]
	.word	0x81ae8ada	! t0_kref+0x4084:   	fcmped	%fcc0, %f26, %f26
	.word	0x9a12400d	! t0_kref+0x4088:   	or	%o1, %o5, %o5
	.word	0x9de3bfa0	! t0_kref+0x408c:   	save	%sp, -0x60, %sp
	.word	0x9fee801a	! t0_kref+0x4090:   	restore	%i2, %i2, %o7
	.word	0xa6aea6b6	! t0_kref+0x4094:   	andncc	%i2, 0x6b6, %l3
	.word	0xab230017	! t0_kref+0x4098:   	mulscc	%o4, %l7, %l5
	.word	0xb1a0053d	! t0_kref+0x409c:   	fsqrts	%f29, %f24
	.word	0xed6e6008	! t0_kref+0x40a0:   	prefetch	%i1 + 8, 22
	.word	0xa81dc015	! t0_kref+0x40a4:   	xor	%l7, %l5, %l4
	.word	0xb1a0054e	! t0_kref+0x40a8:   	fsqrtd	%f14, %f24
	.word	0xb9a00554	! t0_kref+0x40ac:   	fsqrtd	%f20, %f28
	.word	0xae100008	! t0_kref+0x40b0:   	mov	%o0, %l7
	.word	0xa7b6802b	! t0_kref+0x40b4:   	edge8n	%i2, %o3, %l3
	.word	0xc398a080	! t0_kref+0x40b8:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xffee501b	! t0_kref+0x40bc:   	prefetcha	%i1 + %i3, 31
	.word	0xac1a3031	! t0_kref+0x40c0:   	xor	%o0, -0xfcf, %l6
	.word	0x94a3777c	! t0_kref+0x40c4:   	subcc	%o5, -0x884, %o2
	.word	0xea263fe4	! t0_kref+0x40c8:   	st	%l5, [%i0 - 0x1c]
	.word	0xa5a408cc	! t0_kref+0x40cc:   	fsubd	%f16, %f12, %f18
	.word	0xda7e200c	! t0_kref+0x40d0:   	swap	[%i0 + 0xc], %o5
	.word	0x9923000c	! t0_kref+0x40d4:   	mulscc	%o4, %o4, %o4
	.word	0xd836c005	! t0_kref+0x40d8:   	sth	%o4, [%i3 + %g5]
	.word	0x81b540c9	! t0_kref+0x40dc:   	edge16l	%l5, %o1, %g0
	.word	0xb7a018d0	! t0_kref+0x40e0:   	fdtos	%f16, %f27
	.word	0xe11e401d	! t0_kref+0x40e4:   	ldd	[%i1 + %i5], %f16
	.word	0xadb70a9c	! t0_kref+0x40e8:   	fpsub16	%f28, %f28, %f22
	.word	0xadb54328	! t0_kref+0x40ec:   	bmask	%l5, %o0, %l6
	.word	0x9a85f1b0	! t0_kref+0x40f0:   	addcc	%l7, -0xe50, %o5
	.word	0x9da01a52	! t0_kref+0x40f4:   	fdtoi	%f18, %f14
	.word	0xa526800a	! t0_kref+0x40f8:   	mulscc	%i2, %o2, %l2
	.word	0xc398a080	! t0_kref+0x40fc:   	ldda	[%g2 + 0x80]%asi, %f32
	.word	0xb1a0054e	! t0_kref+0x4100:   	fsqrtd	%f14, %f24
	.word	0x9e636405	! t0_kref+0x4104:   	subc	%o5, 0x405, %o7
	.word	0x92b28016	! t0_kref+0x4108:   	orncc	%o2, %l6, %o1
	.word	0x81800000	! t0_kref+0x410c:   	mov	%g0, %y
	.word	0x9466bc09	! t0_kref+0x4110:   	subc	%i2, -0x3f7, %o2
	.word	0xb5a0053e	! t0_kref+0x4114:   	fsqrts	%f30, %f26
	.word	0xa625800d	! t0_kref+0x4118:   	sub	%l6, %o5, %l3
	.word	0xae223a88	! t0_kref+0x411c:   	sub	%o0, -0x578, %l7
	.word	0xb5b38ad4	! t0_kref+0x4120:   	fpsub32	%f14, %f20, %f26
	.word	0xa6e6b444	! t0_kref+0x4124:   	subccc	%i2, -0xbbc, %l3
	.word	0x9da00134	! t0_kref+0x4128:   	fabss	%f20, %f14
	.word	0xe91e7ff8	! t0_kref+0x412c:   	ldd	[%i1 - 8], %f20
	.word	0x9fc00004	! t0_kref+0x4130:   	call	%g0 + %g4
	.word	0x932a6010	! t0_kref+0x4134:   	sll	%o1, 0x10, %o1
	.word	0xd208a036	! t0_kref+0x4138:   	ldub	[%g2 + 0x36], %o1
	.word	0xd4c6101c	! t0_kref+0x413c:   	ldswa	[%i0 + %i4]0x80, %o2
	.word	0xe8066008	! t0_kref+0x4140:   	ld	[%i1 + 8], %l4
	.word	0x8185c000	! t0_kref+0x4144:   	wr	%l7, %g0, %y
	.word	0xc07e601c	! t0_kref+0x4148:   	swap	[%i1 + 0x1c], %g0
	.word	0xb5a00552	! t0_kref+0x414c:   	fsqrtd	%f18, %f26
	.word	0xe46e001a	! t0_kref+0x4150:   	ldstub	[%i0 + %i2], %l2
	.word	0x3b800001	! t0_kref+0x4154:   	fble,a	_kref+0x4158
	.word	0xdac65000	! t0_kref+0x4158:   	ldswa	[%i1]0x80, %o5
	.word	0x32800008	! t0_kref+0x415c:   	bne,a	_kref+0x417c
	.word	0xda08a024	! t0_kref+0x4160:   	ldub	[%g2 + 0x24], %o5
	.word	0xe84e8018	! t0_kref+0x4164:   	ldsb	[%i2 + %i0], %l4
	.word	0x9122800c	! t0_kref+0x4168:   	mulscc	%o2, %o4, %o0
	.word	0xa9a00552	! t0_kref+0x416c:   	fsqrtd	%f18, %f20
	.word	0xd7e65009	! t0_kref+0x4170:   	casa	[%i1]0x80, %o1, %o3
	.word	0xd67e3fe0	! t0_kref+0x4174:   	swap	[%i0 - 0x20], %o3
	.word	0xef264000	! t0_kref+0x4178:   	st	%f23, [%i1]
	.word	0x27800006	! t0_kref+0x417c:   	fbul,a	_kref+0x4194
	.word	0xf428a023	! t0_kref+0x4180:   	stb	%i2, [%g2 + 0x23]
	.word	0xd0363fe8	! t0_kref+0x4184:   	sth	%o0, [%i0 - 0x18]
	.word	0xf500a00c	! t0_kref+0x4188:   	ld	[%g2 + 0xc], %f26
	.word	0xc807bfe4	! t0_kref+0x418c:   	ld	[%fp - 0x1c], %g4
	.word	0x9e1e801a	! t0_kref+0x4190:   	xor	%i2, %i2, %o7
	.word	0xf7270019	! t0_kref+0x4194:   	st	%f27, [%i4 + %i1]
	.word	0xb5a0054c	! t0_kref+0x4198:   	fsqrtd	%f12, %f26
	.word	0x9fc00004	! t0_kref+0x419c:   	call	%g0 + %g4
	.word	0xaba000be	! t0_kref+0x41a0:   	fnegs	%f30, %f21
	.word	0x8143c000	! t0_kref+0x41a4:   	stbar
	.word	0x23480003	! t0_kref+0x41a8:   	fbne,a,pt	%fcc0, _kref+0x41b4
	.word	0x8143c000	! t0_kref+0x41ac:   	stbar
	.word	0x9e2b74e4	! t0_kref+0x41b0:   	andn	%o5, -0xb1c, %o7
	.word	0xed1e7fe8	! t0_kref+0x41b4:   	ldd	[%i1 - 0x18], %f22
	.word	0x99a7085e	! t0_kref+0x41b8:   	faddd	%f28, %f30, %f12
	.word	0xfb066010	! t0_kref+0x41bc:   	ld	[%i1 + 0x10], %f29
	.word	0xb7a000ae	! t0_kref+0x41c0:   	fnegs	%f14, %f27
	.word	0xd84e401a	! t0_kref+0x41c4:   	ldsb	[%i1 + %i2], %o4
	.word	0xc020a03c	! t0_kref+0x41c8:   	clr	[%g2 + 0x3c]
	.word	0xa9b70dd8	! t0_kref+0x41cc:   	fnand	%f28, %f24, %f20
	.word	0x81df4012	! t0_kref+0x41d0:   	flush	%i5 + %l2
	.word	0xec56c019	! t0_kref+0x41d4:   	ldsh	[%i3 + %i1], %l6
	.word	0xd8300019	! t0_kref+0x41d8:   	sth	%o4, [%g0 + %i1]
	.word	0xd006401c	! t0_kref+0x41dc:   	ld	[%i1 + %i4], %o0
	.word	0xd4260000	! t0_kref+0x41e0:   	st	%o2, [%i0]
	.word	0xa5a0055a	! t0_kref+0x41e4:   	fsqrtd	%f26, %f18
	.word	0xeb6e2010	! t0_kref+0x41e8:   	prefetch	%i0 + 0x10, 21
	.word	0x87802080	! t0_kref+0x41ec:   	mov	0x80, %asi
	.word	0x9812400d	! t0_kref+0x41f0:   	or	%o1, %o5, %o4
	.word	0x9672f6a2	! t0_kref+0x41f4:   	udiv	%o3, -0x95e, %o3
	.word	0xe480a014	! t0_kref+0x41f8:   	lda	[%g2 + 0x14]%asi, %l2
	.word	0xed270019	! t0_kref+0x41fc:   	st	%f22, [%i4 + %i1]
	.word	0xe41e001d	! t0_kref+0x4200:   	ldd	[%i0 + %i5], %l2
	.word	0xb1a6c8b4	! t0_kref+0x4204:   	fsubs	%f27, %f20, %f24
	.word	0xe41e0000	! t0_kref+0x4208:   	ldd	[%i0], %l2
	.word	0x80956ebf	! t0_kref+0x420c:   	orcc	%l5, 0xebf, %g0
	.word	0xf720a000	! t0_kref+0x4210:   	st	%f27, [%g2]
	.word	0xd44e0000	! t0_kref+0x4214:   	ldsb	[%i0], %o2
	.word	0xe83e7ff8	! t0_kref+0x4218:   	std	%l4, [%i1 - 8]
	.word	0x9fb50a7e	! t0_kref+0x421c:   	fpadd32s	%f20, %f30, %f15
	.word	0x25800007	! t0_kref+0x4220:   	fblg,a	_kref+0x423c
	.word	0xa1a0193b	! t0_kref+0x4224:   	fstod	%f27, %f16
	.word	0x98d5800d	! t0_kref+0x4228:   	umulcc	%l6, %o5, %o4
	.word	0xa412800a	! t0_kref+0x422c:   	or	%o2, %o2, %l2
	.word	0xb9a01892	! t0_kref+0x4230:   	fitos	%f18, %f28
	.word	0xb9a018d8	! t0_kref+0x4234:   	fdtos	%f24, %f28
	call	SYM(t0_subr0)
	.word	0xa62af7da	! t0_kref+0x423c:   	andn	%o3, -0x826, %l3
	.word	0xe4ee5000	! t0_kref+0x4240:   	ldstuba	[%i1]0x80, %l2
	.word	0x90d368d1	! t0_kref+0x4244:   	umulcc	%o5, 0x8d1, %o0
	.word	0xeed67fea	! t0_kref+0x4248:   	ldsha	[%i1 - 0x16]%asi, %l7
	.word	0xacb20009	! t0_kref+0x424c:   	orncc	%o0, %o1, %l6
	.word	0x9db6cd60	! t0_kref+0x4250:   	fnot1s	%f27, %f14
	.word	0xbda000d4	! t0_kref+0x4254:   	fnegd	%f20, %f30
	.word	0xda2e3fff	! t0_kref+0x4258:   	stb	%o5, [%i0 - 1]
	.word	0xee567fea	! t0_kref+0x425c:   	ldsh	[%i1 - 0x16], %l7
	.word	0xe4d0a014	! t0_kref+0x4260:   	ldsha	[%g2 + 0x14]%asi, %l2
	.word	0xd8d0a038	! t0_kref+0x4264:   	ldsha	[%g2 + 0x38]%asi, %o4
	.word	0x9a76800c	! t0_kref+0x4268:   	udiv	%i2, %o4, %o5
	.word	0xe81e4000	! t0_kref+0x426c:   	ldd	[%i1], %l4
	.word	0xd27e401c	! t0_kref+0x4270:   	swap	[%i1 + %i4], %o1
	.word	0xec567fe0	! t0_kref+0x4274:   	ldsh	[%i1 - 0x20], %l6
	.word	0xdf000018	! t0_kref+0x4278:   	ld	[%g0 + %i0], %f15
	.word	0xec28a03c	! t0_kref+0x427c:   	stb	%l6, [%g2 + 0x3c]
	.word	0x9da309d4	! t0_kref+0x4280:   	fdivd	%f12, %f20, %f14
	.word	0x8143c000	! t0_kref+0x4284:   	stbar
	.word	0xd81e7ff8	! t0_kref+0x4288:   	ldd	[%i1 - 8], %o4
	.word	0xa72dc016	! t0_kref+0x428c:   	sll	%l7, %l6, %l3
	.word	0xada0055e	! t0_kref+0x4290:   	fsqrtd	%f30, %f22
	.word	0x9415c015	! t0_kref+0x4294:   	or	%l7, %l5, %o2
	.word	0xed200019	! t0_kref+0x4298:   	st	%f22, [%g0 + %i1]
	.word	0xd236601e	! t0_kref+0x429c:   	sth	%o1, [%i1 + 0x1e]
	.word	0xa7258000	! t0_kref+0x42a0:   	mulscc	%l6, %g0, %l3
	.word	0x9825e7bf	! t0_kref+0x42a4:   	sub	%l7, 0x7bf, %o4
	.word	0x2a480003	! t0_kref+0x42a8:   	bcs,a,pt	%icc, _kref+0x42b4
	.word	0x9fa018de	! t0_kref+0x42ac:   	fdtos	%f30, %f15
	.word	0xb9a0053d	! t0_kref+0x42b0:   	fsqrts	%f29, %f28
	.word	0xb1b586f6	! t0_kref+0x42b4:   	fmul8ulx16	%f22, %f22, %f24
	.word	0x97400000	! t0_kref+0x42b8:   	mov	%y, %o3
	.word	0x902dc00a	! t0_kref+0x42bc:   	andn	%l7, %o2, %o0
	.word	0xf4ae1000	! t0_kref+0x42c0:   	stba	%i2, [%i0]0x80
	.word	0xa1a7483a	! t0_kref+0x42c4:   	fadds	%f29, %f26, %f16
	.word	0x81dc2465	! t0_kref+0x42c8:   	flush	%l0 + 0x465
	.word	0x32800008	! t0_kref+0x42cc:   	bne,a	_kref+0x42ec
	.word	0x99b58f50	! t0_kref+0x42d0:   	fornot1	%f22, %f16, %f12
	.word	0xed06600c	! t0_kref+0x42d4:   	ld	[%i1 + 0xc], %f22
	.word	0x81da3b86	! t0_kref+0x42d8:   	flush	%o0 - 0x47a
	.word	0xb1a01a56	! t0_kref+0x42dc:   	fdtoi	%f22, %f24
	.word	0xa9a01890	! t0_kref+0x42e0:   	fitos	%f16, %f20
	.word	0xd0560000	! t0_kref+0x42e4:   	ldsh	[%i0], %o0
	.word	0xb1b00cf4	! t0_kref+0x42e8:   	fnot2s	%f20, %f24
	.word	0xa5408000	! t0_kref+0x42ec:   	mov	%ccr, %l2
	.word	0x81de7a46	! t0_kref+0x42f0:   	flush	%i1 - 0x5ba
	.word	0xb5a0190d	! t0_kref+0x42f4:   	fitod	%f13, %f26
	.word	0x81ab8a3a	! t0_kref+0x42f8:   	fcmps	%fcc0, %f14, %f26
	.word	0xac9e8016	! t0_kref+0x42fc:   	xorcc	%i2, %l6, %l6
	.word	0xa1a309cc	! t0_kref+0x4300:   	fdivd	%f12, %f12, %f16
	.word	0xc807bfe4	! t0_kref+0x4304:   	ld	[%fp - 0x1c], %g4
	.word	0xf4b0a010	! t0_kref+0x4308:   	stha	%i2, [%g2 + 0x10]%asi
	.word	0xc168a00d	! t0_kref+0x430c:   	prefetch	%g2 + 0xd, 0
	.word	0x3f800008	! t0_kref+0x4310:   	fbo,a	_kref+0x4330
	.word	0xbbab403d	! t0_kref+0x4314:   	fmovsle	%fcc0, %f29, %f29
	.word	0xe9be5817	! t0_kref+0x4318:   	stda	%f20, [%i1 + %l7]0xc0
	.word	0xf5063ffc	! t0_kref+0x431c:   	ld	[%i0 - 4], %f26
	.word	0x9e100016	! t0_kref+0x4320:   	mov	%l6, %o7
	.word	0x985a400d	! t0_kref+0x4324:   	smul	%o1, %o5, %o4
	.word	0x91b784d4	! t0_kref+0x4328:   	fcmpne32	%f30, %f20, %o0
	.word	0x81daa681	! t0_kref+0x432c:   	flush	%o2 + 0x681
	.word	0x21800001	! t0_kref+0x4330:   	fbn,a	_kref+0x4334
	.word	0xd0080019	! t0_kref+0x4334:   	ldub	[%g0 + %i1], %o0
	.word	0xe41e4000	! t0_kref+0x4338:   	ldd	[%i1], %l2
	.word	0xacbde078	! t0_kref+0x433c:   	xnorcc	%l7, 0x78, %l6
	.word	0xb3a018de	! t0_kref+0x4340:   	fdtos	%f30, %f25
	.word	0xb1a00034	! t0_kref+0x4344:   	fmovs	%f20, %f24
	.word	0xda580019	! t0_kref+0x4348:   	ldx	[%g0 + %i1], %o5
	.word	0x9fb38554	! t0_kref+0x434c:   	fcmpeq16	%f14, %f20, %o7
	.word	0xb5a0053e	! t0_kref+0x4350:   	fsqrts	%f30, %f26
	.word	0x2e480003	! t0_kref+0x4354:   	bvs,a,pt	%icc, _kref+0x4360
	.word	0xda06401c	! t0_kref+0x4358:   	ld	[%i1 + %i4], %o5
	.word	0x809a8008	! t0_kref+0x435c:   	xorcc	%o2, %o0, %g0
	.word	0x99b3063c	! t0_kref+0x4360:   	fmul8x16	%f12, %f28, %f12
	.word	0xa1b30ea0	! t0_kref+0x4364:   	fsrc1s	%f12, %f16
	.word	0x81ac0ace	! t0_kref+0x4368:   	fcmped	%fcc0, %f16, %f14
	.word	0xb5a01911	! t0_kref+0x436c:   	fitod	%f17, %f26
	.word	0xa9408000	! t0_kref+0x4370:   	mov	%ccr, %l4
	.word	0x81aeca33	! t0_kref+0x4374:   	fcmps	%fcc0, %f27, %f19
	.word	0xe83e6008	! t0_kref+0x4378:   	std	%l4, [%i1 + 8]
	.word	0xaed2fc9e	! t0_kref+0x437c:   	umulcc	%o3, -0x362, %l7
	.word	0xac72b298	! t0_kref+0x4380:   	udiv	%o2, -0xd68, %l6
	.word	0xaba64833	! t0_kref+0x4384:   	fadds	%f25, %f19, %f21
	.word	0xf7070018	! t0_kref+0x4388:   	ld	[%i4 + %i0], %f27
	.word	0xec1e7fe8	! t0_kref+0x438c:   	ldd	[%i1 - 0x18], %l6
	.word	0xac42b1a9	! t0_kref+0x4390:   	addc	%o2, -0xe57, %l6
	.word	0xa1b58d40	! t0_kref+0x4394:   	fnot1	%f22, %f16
	.word	0x99b68a16	! t0_kref+0x4398:   	fpadd16	%f26, %f22, %f12
	.word	0xd030a008	! t0_kref+0x439c:   	sth	%o0, [%g2 + 8]
	.word	0xa1a00032	! t0_kref+0x43a0:   	fmovs	%f18, %f16
	.word	0xa49a801a	! t0_kref+0x43a4:   	xorcc	%o2, %i2, %l2
	.word	0x9a7228db	! t0_kref+0x43a8:   	udiv	%o0, 0x8db, %o5
	.word	0xee28a03d	! t0_kref+0x43ac:   	stb	%l7, [%g2 + 0x3d]
	.word	0xb5a0193b	! t0_kref+0x43b0:   	fstod	%f27, %f26
	.word	0xb9b38e80	! t0_kref+0x43b4:   	fsrc1	%f14, %f28
	.word	0x9db38d0c	! t0_kref+0x43b8:   	fandnot1	%f14, %f12, %f14
	.word	0x9fc00004	! t0_kref+0x43bc:   	call	%g0 + %g4
	.word	0x001fffff	! t0_kref+0x43c0:   	illtrap	0x1fffff
	.word	0xa416800a	! t0_kref+0x43c4:   	or	%i2, %o2, %l2
	.word	0x97400000	! t0_kref+0x43c8:   	mov	%y, %o3
	.word	0x8143c000	! t0_kref+0x43cc:   	stbar
	.word	0xaaf2a0c0	! t0_kref+0x43d0:   	udivcc	%o2, 0xc0, %l5
	.word	0xa5b70a74	! t0_kref+0x43d4:   	fpadd32s	%f28, %f20, %f18
	.word	0xe06e7ffd	! t0_kref+0x43d8:   	ldstub	[%i1 - 3], %l0
	.word	0xec1e2010	! t0_kref+0x43dc:   	ldd	[%i0 + 0x10], %l6
	.word	0xacf02bbc	! t0_kref+0x43e0:   	udivcc	%g0, 0xbbc, %l6
	.word	0xa5a000b4	! t0_kref+0x43e4:   	fnegs	%f20, %f18
	.word	0xa7a000b1	! t0_kref+0x43e8:   	fnegs	%f17, %f19
	.word	0x963e8017	! t0_kref+0x43ec:   	xnor	%i2, %l7, %o3
	.word	0x91054000	! t0_kref+0x43f0:   	taddcc	%l5, %g0, %o0
	.word	0xb5b48e4c	! t0_kref+0x43f4:   	fxnor	%f18, %f12, %f26
	.word	0xf106001c	! t0_kref+0x43f8:   	ld	[%i0 + %i4], %f24
	.word	0x99a00558	! t0_kref+0x43fc:   	fsqrtd	%f24, %f12
	.word	0x81ae8a30	! t0_kref+0x4400:   	fcmps	%fcc0, %f26, %f16
	.word	0xc7e8a04c	! t0_kref+0x4404:   	prefetcha	%g2 + 0x4c, 3
	.word	0xee363ffc	! t0_kref+0x4408:   	sth	%l7, [%i0 - 4]
	.word	0xa925bad6	! t0_kref+0x440c:   	mulscc	%l6, -0x52a, %l4
	.word	0xa7b5ca34	! t0_kref+0x4410:   	fpadd16s	%f23, %f20, %f19
	.word	0xafb6814d	! t0_kref+0x4414:   	edge32l	%i2, %o5, %l7
	.word	0x3b480008	! t0_kref+0x4418:   	fble,a,pt	%fcc0, _kref+0x4438
	.word	0x8143c000	! t0_kref+0x441c:   	stbar
	.word	0xe320a028	! t0_kref+0x4420:   	st	%f17, [%g2 + 0x28]
	.word	0xa60df47b	! t0_kref+0x4424:   	and	%l7, -0xb85, %l3
	.word	0xa65a23b6	! t0_kref+0x4428:   	smul	%o0, 0x3b6, %l3
	.word	0xe1264000	! t0_kref+0x442c:   	st	%f16, [%i1]
	.word	0x25800006	! t0_kref+0x4430:   	fblg,a	_kref+0x4448
	.word	0xa65af1e5	! t0_kref+0x4434:   	smul	%o3, -0xe1b, %l3
	.word	0xa5b586ec	! t0_kref+0x4438:   	fmul8ulx16	%f22, %f12, %f18
	.word	0xa6868000	! t0_kref+0x443c:   	addcc	%i2, %g0, %l3
	.word	0xd440a010	! t0_kref+0x4440:   	ldsw	[%g2 + 0x10], %o2
	.word	0x2b800002	! t0_kref+0x4444:   	fbug,a	_kref+0x444c
	.word	0x8143c000	! t0_kref+0x4448:   	stbar
	.word	0xa9b307d6	! t0_kref+0x444c:   	pdist	%f12, %f22, %f20
	.word	0x38800005	! t0_kref+0x4450:   	bgu,a	_kref+0x4464
	.word	0x985da566	! t0_kref+0x4454:   	smul	%l6, 0x566, %o4
	.word	0xb9a00132	! t0_kref+0x4458:   	fabss	%f18, %f28
	.word	0x95254000	! t0_kref+0x445c:   	mulscc	%l5, %g0, %o2
	.word	0x1118cf07	! t0_kref+0x4460:   	sethi	%hi(0x633c1c00), %o0
	.word	0xc12e401c	! t0_kref+0x4464:   	st	%fsr, [%i1 + %i4]
	.word	0x9672c015	! t0_kref+0x4468:   	udiv	%o3, %l5, %o3
	.word	0xa69b400d	! t0_kref+0x446c:   	xorcc	%o5, %o5, %l3
	.word	0xee2e3ff2	! t0_kref+0x4470:   	stb	%l7, [%i0 - 0xe]
	.word	0xde06401c	! t0_kref+0x4474:   	ld	[%i1 + %i4], %o7
	.word	0x2e800008	! t0_kref+0x4478:   	bvs,a	_kref+0x4498
	.word	0x2912d05f	! t0_kref+0x447c:   	sethi	%hi(0x4b417c00), %l4
	.word	0xe1000018	! t0_kref+0x4480:   	ld	[%g0 + %i0], %f16
	.word	0xada68d36	! t0_kref+0x4484:   	fsmuld	%f26, %f22, %f22
	.word	0xac8d400c	! t0_kref+0x4488:   	andcc	%l5, %o4, %l6
	.word	0xbba70838	! t0_kref+0x448c:   	fadds	%f28, %f24, %f29
	.word	0xe580a008	! t0_kref+0x4490:   	lda	[%g2 + 8]%asi, %f18
	.word	0xa9a6c833	! t0_kref+0x4494:   	fadds	%f27, %f19, %f20
	.word	0x968d6c5e	! t0_kref+0x4498:   	andcc	%l5, 0xc5e, %o3
	.word	0x9ba01a50	! t0_kref+0x449c:   	fdtoi	%f16, %f13
	.word	0x9640000b	! t0_kref+0x44a0:   	addc	%g0, %o3, %o3
	.word	0xd4070019	! t0_kref+0x44a4:   	ld	[%i4 + %i1], %o2
	.word	0xffee101c	! t0_kref+0x44a8:   	prefetcha	%i0 + %i4, 31
	.word	0xeaf62010	! t0_kref+0x44ac:   	stxa	%l5, [%i0 + 0x10]%asi
	.word	0x37480002	! t0_kref+0x44b0:   	fbge,a,pt	%fcc0, _kref+0x44b8
	.word	0xadb40733	! t0_kref+0x44b4:   	fmuld8ulx16	%f16, %f19, %f22
	.word	0xada00534	! t0_kref+0x44b8:   	fsqrts	%f20, %f22
	.word	0x29800005	! t0_kref+0x44bc:   	fbl,a	_kref+0x44d0
	.word	0xaf400000	! t0_kref+0x44c0:   	mov	%y, %l7
	.word	0xed1f4018	! t0_kref+0x44c4:   	ldd	[%i5 + %i0], %f22
	.word	0x992b6014	! t0_kref+0x44c8:   	sll	%o5, 0x14, %o4
	.word	0x36800007	! t0_kref+0x44cc:   	bge,a	_kref+0x44e8
	.word	0xd2c67fec	! t0_kref+0x44d0:   	ldswa	[%i1 - 0x14]%asi, %o1
	.word	0xf9060000	! t0_kref+0x44d4:   	ld	[%i0], %f28
	.word	0x3a800004	! t0_kref+0x44d8:   	bcc,a	_kref+0x44e8
	.word	0xbda5c82e	! t0_kref+0x44dc:   	fadds	%f23, %f14, %f30
	.word	0xac756d6a	! t0_kref+0x44e0:   	udiv	%l5, 0xd6a, %l6
	.word	0xde0e7ff5	! t0_kref+0x44e4:   	ldub	[%i1 - 0xb], %o7
	.word	0x2a480008	! t0_kref+0x44e8:   	bcs,a,pt	%icc, _kref+0x4508
	.word	0xab2e8015	! t0_kref+0x44ec:   	sll	%i2, %l5, %l5
	.word	0xec801019	! t0_kref+0x44f0:   	lda	[%g0 + %i1]0x80, %l6
	.word	0xa1b38e80	! t0_kref+0x44f4:   	fsrc1	%f14, %f16
	.word	0x90bdacc7	! t0_kref+0x44f8:   	xnorcc	%l6, 0xcc7, %o0
	.word	0x9a2a78d8	! t0_kref+0x44fc:   	andn	%o1, -0x728, %o5
	.word	0xb1a00552	! t0_kref+0x4500:   	fsqrtd	%f18, %f24
	.word	0xb7a01a33	! t0_kref+0x4504:   	fstoi	%f19, %f27
	.word	0x99a3882c	! t0_kref+0x4508:   	fadds	%f14, %f12, %f12
	.word	0xb1a78850	! t0_kref+0x450c:   	faddd	%f30, %f16, %f24
	.word	0x94d2bc1d	! t0_kref+0x4510:   	umulcc	%o2, -0x3e3, %o2
	.word	0xe9e8a009	! t0_kref+0x4514:   	prefetcha	%g2 + 9, 20
	.word	0x949eba50	! t0_kref+0x4518:   	xorcc	%i2, -0x5b0, %o2
	.word	0x8066800b	! t0_kref+0x451c:   	subc	%i2, %o3, %g0
	.word	0x81aeca39	! t0_kref+0x4520:   	fcmps	%fcc0, %f27, %f25
	.word	0xb1a0192e	! t0_kref+0x4524:   	fstod	%f14, %f24
	.word	0xada78837	! t0_kref+0x4528:   	fadds	%f30, %f23, %f22
	.word	0x3a800007	! t0_kref+0x452c:   	bcc,a	_kref+0x4548
	.word	0x98bb001a	! t0_kref+0x4530:   	xnorcc	%o4, %i2, %o4
	.word	0xec070019	! t0_kref+0x4534:   	ld	[%i4 + %i1], %l6
	.word	0xef066014	! t0_kref+0x4538:   	ld	[%i1 + 0x14], %f23
	.word	0x8143c000	! t0_kref+0x453c:   	stbar
	.word	0xa5a509ce	! t0_kref+0x4540:   	fdivd	%f20, %f14, %f18
	.word	0x9da60854	! t0_kref+0x4544:   	faddd	%f24, %f20, %f14
	.word	0x9a65800d	! t0_kref+0x4548:   	subc	%l6, %o5, %o5
	.word	0xec3e0000	! t0_kref+0x454c:   	std	%l6, [%i0]
	.word	0xa5b00fe0	! t0_kref+0x4550:   	fones	%f18
	.word	0xd6270019	! t0_kref+0x4554:   	st	%o3, [%i4 + %i1]
	.word	0xb1b00cf8	! t0_kref+0x4558:   	fnot2s	%f24, %f24
	.word	0x99b58f52	! t0_kref+0x455c:   	fornot1	%f22, %f18, %f12
	.word	0x9fa0053c	! t0_kref+0x4560:   	fsqrts	%f28, %f15
	.word	0xdb20a03c	! t0_kref+0x4564:   	st	%f13, [%g2 + 0x3c]
	.word	0xa9a688b0	! t0_kref+0x4568:   	fsubs	%f26, %f16, %f20
	.word	0x37800008	! t0_kref+0x456c:   	fbge,a	_kref+0x458c
	.word	0x9bb68156	! t0_kref+0x4570:   	edge32l	%i2, %l6, %o5
	.word	0x80630009	! t0_kref+0x4574:   	subc	%o4, %o1, %g0
	.word	0x22800002	! t0_kref+0x4578:   	be,a	_kref+0x4580
	.word	0xe920a034	! t0_kref+0x457c:   	st	%f20, [%g2 + 0x34]
	.word	0xed1e6008	! t0_kref+0x4580:   	ldd	[%i1 + 8], %f22
	.word	0xaee332d5	! t0_kref+0x4584:   	subccc	%o4, -0xd2b, %l7
	.word	0x925b400c	! t0_kref+0x4588:   	smul	%o5, %o4, %o1
	.word	0x9de3bfa0	! t0_kref+0x458c:   	save	%sp, -0x60, %sp
	.word	0xa9e8001c	! t0_kref+0x4590:   	restore	%g0, %i4, %l4
	.word	0x24480003	! t0_kref+0x4594:   	ble,a,pt	%icc, _kref+0x45a0
	.word	0x94f5e32e	! t0_kref+0x4598:   	udivcc	%l7, 0x32e, %o2
	.word	0xb7a018ce	! t0_kref+0x459c:   	fdtos	%f14, %f27
	.word	0x81d92650	! t0_kref+0x45a0:   	flush	%g4 + 0x650
	.word	0x988a4016	! t0_kref+0x45a4:   	andcc	%o1, %l6, %o4
	.word	0xb5a0012f	! t0_kref+0x45a8:   	fabss	%f15, %f26
	.word	0xad418000	! t0_kref+0x45ac:   	mov	%fprs, %l6
	.word	0xaba00532	! t0_kref+0x45b0:   	fsqrts	%f18, %f21
	.word	0xa8d82eda	! t0_kref+0x45b4:   	smulcc	%g0, 0xeda, %l4
	.word	0x9ba40836	! t0_kref+0x45b8:   	fadds	%f16, %f22, %f13
	.word	0xd840a03c	! t0_kref+0x45bc:   	ldsw	[%g2 + 0x3c], %o4
	.word	0x98ddc00a	! t0_kref+0x45c0:   	smulcc	%l7, %o2, %o4
	.word	0xd0060000	! t0_kref+0x45c4:   	ld	[%i0], %o0
	.word	0xaa2b0015	! t0_kref+0x45c8:   	andn	%o4, %l5, %l5
	.word	0xa52b0008	! t0_kref+0x45cc:   	sll	%o4, %o0, %l2
	.word	0x2e480001	! t0_kref+0x45d0:   	bvs,a,pt	%icc, _kref+0x45d4
	.word	0x929aeca9	! t0_kref+0x45d4:   	xorcc	%o3, 0xca9, %o1
	.word	0xbdb506be	! t0_kref+0x45d8:   	fmul8x16al	%f20, %f30, %f30
	.word	0x24480006	! t0_kref+0x45dc:   	ble,a,pt	%icc, _kref+0x45f4
	.word	0x968271ca	! t0_kref+0x45e0:   	addcc	%o1, -0xe36, %o3
	.word	0xa52b6015	! t0_kref+0x45e4:   	sll	%o5, 0x15, %l2
	.word	0xb7a01a37	! t0_kref+0x45e8:   	fstoi	%f23, %f27
	.word	0x99b605d8	! t0_kref+0x45ec:   	fcmpeq32	%f24, %f24, %o4
	.word	0xd4366002	! t0_kref+0x45f0:   	sth	%o2, [%i1 + 2]
	.word	0xa9a0190c	! t0_kref+0x45f4:   	fitod	%f12, %f20
	.word	0xdaa0a004	! t0_kref+0x45f8:   	sta	%o5, [%g2 + 4]%asi
	.word	0xc0066000	! t0_kref+0x45fc:   	ld	[%i1], %g0
	.word	0x9de3bfa0	! t0_kref+0x4600:   	save	%sp, -0x60, %sp
	.word	0xb29e2e67	! t0_kref+0x4604:   	xorcc	%i0, 0xe67, %i1
	.word	0xa9ee0018	! t0_kref+0x4608:   	restore	%i0, %i0, %l4
	.word	0x94f68015	! t0_kref+0x460c:   	udivcc	%i2, %l5, %o2
	.word	0xda4e3fe0	! t0_kref+0x4610:   	ldsb	[%i0 - 0x20], %o5
	.word	0xabb24177	! t0_kref+0x4614:   	edge32ln	%o1, %l7, %l5
	.word	0x96bd400c	! t0_kref+0x4618:   	xnorcc	%l5, %o4, %o3
	.word	0x81ac0ade	! t0_kref+0x461c:   	fcmped	%fcc0, %f16, %f30
	.word	0xe5270018	! t0_kref+0x4620:   	st	%f18, [%i4 + %i0]
	.word	0xa9ab0054	! t0_kref+0x4624:   	fmovduge	%fcc0, %f20, %f20
	.word	0x94b2400b	! t0_kref+0x4628:   	orncc	%o1, %o3, %o2
	.word	0x81ab4a30	! t0_kref+0x462c:   	fcmps	%fcc0, %f13, %f16
	.word	0xa620000c	! t0_kref+0x4630:   	neg	%o4, %l3
	.word	0xa7a00538	! t0_kref+0x4634:   	fsqrts	%f24, %f19
	.word	0xa5b58f54	! t0_kref+0x4638:   	fornot1	%f22, %f20, %f18
	.word	0xd290a016	! t0_kref+0x463c:   	lduha	[%g2 + 0x16]%asi, %o1
	.word	0xe67e401c	! t0_kref+0x4640:   	swap	[%i1 + %i4], %l3
	.word	0xe44e7fe8	! t0_kref+0x4644:   	ldsb	[%i1 - 0x18], %l2
	.word	0xa1b4c716	! t0_kref+0x4648:   	fmuld8sux16	%f19, %f22, %f16
	.word	0x9a1a231a	! t0_kref+0x464c:   	xor	%o0, 0x31a, %o5
	.word	0x91408000	! t0_kref+0x4650:   	mov	%ccr, %o0
	.word	0xee066000	! t0_kref+0x4654:   	ld	[%i1], %l7
	.word	0x99a01931	! t0_kref+0x4658:   	fstod	%f17, %f12
	.word	0xb5b48a96	! t0_kref+0x465c:   	fpsub16	%f18, %f22, %f26
	.word	0x9ba000ba	! t0_kref+0x4660:   	fnegs	%f26, %f13
	.word	0xd228a01a	! t0_kref+0x4664:   	stb	%o1, [%g2 + 0x1a]
	.word	0xb9a000b8	! t0_kref+0x4668:   	fnegs	%f24, %f28
	.word	0xe67e7fe4	! t0_kref+0x466c:   	swap	[%i1 - 0x1c], %l3
	.word	0x901db833	! t0_kref+0x4670:   	xor	%l6, -0x7cd, %o0
	.word	0xa4a2c016	! t0_kref+0x4674:   	subcc	%o3, %l6, %l2
	.word	0x9ae2e4be	! t0_kref+0x4678:   	subccc	%o3, 0x4be, %o5
	.word	0x2c800003	! t0_kref+0x467c:   	bneg,a	_kref+0x4688
	.word	0x9a72bce1	! t0_kref+0x4680:   	udiv	%o2, -0x31f, %o5
	.word	0xae26afb0	! t0_kref+0x4684:   	sub	%i2, 0xfb0, %l7
	.word	0x27275b62	! t0_kref+0x4688:   	sethi	%hi(0x9d6d8800), %l3
	.word	0xb1a0055c	! t0_kref+0x468c:   	fsqrtd	%f28, %f24
	.word	0x8115e052	! t0_kref+0x4690:   	taddcctv	%l7, 0x52, %g0
	.word	0xa9b54016	! t0_kref+0x4694:   	edge8	%l5, %l6, %l4
	.word	0xa932400c	! t0_kref+0x4698:   	srl	%o1, %o4, %l4
	.word	0xada00552	! t0_kref+0x469c:   	fsqrtd	%f18, %f22
	.word	0x83414000	! t0_kref+0x46a0:   	mov	%pc, %g1
	.word	0xa3a00037	! t0_kref+0x46a4:   	fmovs	%f23, %f17
	call	SYM(t0_subr1)
	.word	0xf7270018	! t0_kref+0x46ac:   	st	%f27, [%i4 + %i0]
	.word	0xa3b64dee	! t0_kref+0x46b0:   	fnands	%f25, %f14, %f17
	.word	0x2b800008	! t0_kref+0x46b4:   	fbug,a	_kref+0x46d4
	.word	0xfba0a030	! t0_kref+0x46b8:   	sta	%f29, [%g2 + 0x30]%asi
	.word	0xe6c8a016	! t0_kref+0x46bc:   	ldsba	[%g2 + 0x16]%asi, %l3
	.word	0xa8934015	! t0_kref+0x46c0:   	orcc	%o5, %l5, %l4
	.word	0x2c480005	! t0_kref+0x46c4:   	bneg,a,pt	%icc, _kref+0x46d8
	.word	0xa6db24f0	! t0_kref+0x46c8:   	smulcc	%o4, 0x4f0, %l3
	.word	0x9222c017	! t0_kref+0x46cc:   	sub	%o3, %l7, %o1
	.word	0x81ae4a3d	! t0_kref+0x46d0:   	fcmps	%fcc0, %f25, %f29
	.word	0x9fc00004	! t0_kref+0x46d4:   	call	%g0 + %g4
	.word	0x9fb50cb8	! t0_kref+0x46d8:   	fandnot2s	%f20, %f24, %f15
	.word	0xaf400000	! t0_kref+0x46dc:   	mov	%y, %l7
	.word	0x28480007	! t0_kref+0x46e0:   	bleu,a,pt	%icc, _kref+0x46fc
	.word	0xd8ce5000	! t0_kref+0x46e4:   	ldsba	[%i1]0x80, %o4
	.word	0x9e730008	! t0_kref+0x46e8:   	udiv	%o4, %o0, %o7
	.word	0x8185c000	! t0_kref+0x46ec:   	wr	%l7, %g0, %y
	.word	0xadb60edc	! t0_kref+0x46f0:   	fornot2	%f24, %f28, %f22
	.word	0xe326001c	! t0_kref+0x46f4:   	st	%f17, [%i0 + %i4]
	.word	0xeb066000	! t0_kref+0x46f8:   	ld	[%i1], %f21
	.word	0xe2780018	! t0_kref+0x46fc:   	swap	[%g0 + %i0], %l1
	.word	0xd88e7ff2	! t0_kref+0x4700:   	lduba	[%i1 - 0xe]%asi, %o4
	.word	0xaba0012e	! t0_kref+0x4704:   	fabss	%f14, %f21
	.word	0xa825ec81	! t0_kref+0x4708:   	sub	%l7, 0xc81, %l4
	.word	0xe27e6010	! t0_kref+0x470c:   	swap	[%i1 + 0x10], %l1
	.word	0xa5408000	! t0_kref+0x4710:   	mov	%ccr, %l2
	.word	0xbda00130	! t0_kref+0x4714:   	fabss	%f16, %f30
	.word	0x805a800c	! t0_kref+0x4718:   	smul	%o2, %o4, %g0
	.word	0xb5a01a36	! t0_kref+0x471c:   	fstoi	%f22, %f26
	.word	0x93130008	! t0_kref+0x4720:   	taddcctv	%o4, %o0, %o1
	.word	0x99b00c00	! t0_kref+0x4724:   	fzero	%f12
	.word	0xafb38d60	! t0_kref+0x4728:   	fnot1s	%f14, %f23
	.word	0xb9a448ad	! t0_kref+0x472c:   	fsubs	%f17, %f13, %f28
	.word	0xaebd7a3e	! t0_kref+0x4730:   	xnorcc	%l5, -0x5c2, %l7
	.word	0xa436a68a	! t0_kref+0x4734:   	orn	%i2, 0x68a, %l2
	.word	0x9fc00004	! t0_kref+0x4738:   	call	%g0 + %g4
	.word	0xa9a01913	! t0_kref+0x473c:   	fitod	%f19, %f20
	.word	0xbda018d6	! t0_kref+0x4740:   	fdtos	%f22, %f30
	.word	0xb9a0190f	! t0_kref+0x4744:   	fitod	%f15, %f28
	.word	0xac5a0008	! t0_kref+0x4748:   	smul	%o0, %o0, %l6
	.word	0xb5b68cb7	! t0_kref+0x474c:   	fandnot2s	%f26, %f23, %f26
	.word	0xae72000a	! t0_kref+0x4750:   	udiv	%o0, %o2, %l7
	.word	0x9a757e8f	! t0_kref+0x4754:   	udiv	%l5, -0x171, %o5
	.word	0xada0192c	! t0_kref+0x4758:   	fstod	%f12, %f22
	.word	0x28800001	! t0_kref+0x475c:   	bleu,a	_kref+0x4760
	.word	0xb1b68c54	! t0_kref+0x4760:   	fnor	%f26, %f20, %f24
	.word	0xb1b40ada	! t0_kref+0x4764:   	fpsub32	%f16, %f26, %f24
	.word	0x805a39a7	! t0_kref+0x4768:   	smul	%o0, -0x659, %g0
	.word	0x0120da51	! t0_kref+0x476c:   	sethi	%hi(0x83694400), %g0
	.word	0xb9a00552	! t0_kref+0x4770:   	fsqrtd	%f18, %f28
	.word	0x99b406da	! t0_kref+0x4774:   	fmul8sux16	%f16, %f26, %f12
	.word	0xe9be1a1d	! t0_kref+0x4778:   	stda	%f20, [%i0 + %i5]0xd0
	.word	0xaba5c83d	! t0_kref+0x477c:   	fadds	%f23, %f29, %f21
	.word	0xa9b28200	! t0_kref+0x4780:   	array8	%o2, %g0, %l4
	.word	0xee30a018	! t0_kref+0x4784:   	sth	%l7, [%g2 + 0x18]
	.word	0xbda0188e	! t0_kref+0x4788:   	fitos	%f14, %f30
	.word	0x99a0054c	! t0_kref+0x478c:   	fsqrtd	%f12, %f12
	.word	0xed1e3ff8	! t0_kref+0x4790:   	ldd	[%i0 - 8], %f22
	.word	0x38800001	! t0_kref+0x4794:   	bgu,a	_kref+0x4798
	.word	0xb5a588d4	! t0_kref+0x4798:   	fsubd	%f22, %f20, %f26
	.word	0xeeb0a024	! t0_kref+0x479c:   	stha	%l7, [%g2 + 0x24]%asi
	.word	0x920b400d	! t0_kref+0x47a0:   	and	%o5, %o5, %o1
	.word	0x94aaaee4	! t0_kref+0x47a4:   	andncc	%o2, 0xee4, %o2
	.word	0xf5a0a03c	! t0_kref+0x47a8:   	sta	%f26, [%g2 + 0x3c]%asi
	.word	0xf56e001a	! t0_kref+0x47ac:   	prefetch	%i0 + %i2, 26
	.word	0x9aab000b	! t0_kref+0x47b0:   	andncc	%o4, %o3, %o5
	.word	0x961a76bb	! t0_kref+0x47b4:   	xor	%o1, -0x945, %o3
	.word	0xc807bfec	! t0_kref+0x47b8:   	ld	[%fp - 0x14], %g4
	.word	0x960a400d	! t0_kref+0x47bc:   	and	%o1, %o5, %o3
	.word	0xd24e8018	! t0_kref+0x47c0:   	ldsb	[%i2 + %i0], %o1
	.word	0xe7ee101b	! t0_kref+0x47c4:   	prefetcha	%i0 + %i3, 19
	.word	0x9463400c	! t0_kref+0x47c8:   	subc	%o5, %o4, %o2
	.word	0xafb30200	! t0_kref+0x47cc:   	array8	%o4, %g0, %l7
	.word	0xd24e3fe9	! t0_kref+0x47d0:   	ldsb	[%i0 - 0x17], %o1
	.word	0xc36e400d	! t0_kref+0x47d4:   	prefetch	%i1 + %o5, 1
	call	SYM(t0_subr3)
	.word	0xbda8005c	! t0_kref+0x47dc:   	fmovdn	%fcc0, %f28, %f30
	.word	0x9da3893d	! t0_kref+0x47e0:   	fmuls	%f14, %f29, %f14
	.word	0xe440a030	! t0_kref+0x47e4:   	ldsw	[%g2 + 0x30], %l2
	.word	0xe4563ff2	! t0_kref+0x47e8:   	ldsh	[%i0 - 0xe], %l2
	.word	0x35800006	! t0_kref+0x47ec:   	fbue,a	_kref+0x4804
	.word	0x9bb38e3b	! t0_kref+0x47f0:   	fands	%f14, %f27, %f13
	.word	0x8185c000	! t0_kref+0x47f4:   	wr	%l7, %g0, %y
	.word	0x99224015	! t0_kref+0x47f8:   	mulscc	%o1, %l5, %o4
	.word	0xd44e8018	! t0_kref+0x47fc:   	ldsb	[%i2 + %i0], %o2
	.word	0x9515a763	! t0_kref+0x4800:   	taddcctv	%l6, 0x763, %o2
	.word	0xd890a008	! t0_kref+0x4804:   	lduha	[%g2 + 8]%asi, %o4
	.word	0xa61af177	! t0_kref+0x4808:   	xor	%o3, -0xe89, %l3
	.word	0x81de3f8f	! t0_kref+0x480c:   	flush	%i0 - 0x71
	.word	0xa782401a	! t0_kref+0x4810:   	wr	%o1, %i2, %gsr
	.word	0xe5a0a038	! t0_kref+0x4814:   	sta	%f18, [%g2 + 0x38]%asi
	.word	0xeca8a02a	! t0_kref+0x4818:   	stba	%l6, [%g2 + 0x2a]%asi
	.word	0x86102016	! t0_kref+0x481c:   	mov	0x16, %g3
	.word	0x86a0e001	! t0_kref+0x4820:   	subcc	%g3, 1, %g3
	.word	0x22800016	! t0_kref+0x4824:   	be,a	_kref+0x487c
	.word	0x9825f6b6	! t0_kref+0x4828:   	sub	%l7, -0x94a, %o4
	.word	0x27bffffd	! t0_kref+0x482c:   	fbul,a	_kref+0x4820
	.word	0xaba01a2d	! t0_kref+0x4830:   	fstoi	%f13, %f21
	.word	0xaa26b1e3	! t0_kref+0x4834:   	sub	%i2, -0xe1d, %l5
	.word	0xdbe65000	! t0_kref+0x4838:   	casa	[%i1]0x80, %g0, %o5
	.word	0xea367fea	! t0_kref+0x483c:   	sth	%l5, [%i1 - 0x16]
	.word	0x2abffff8	! t0_kref+0x4840:   	bcs,a	_kref+0x4820
	.word	0x96956f03	! t0_kref+0x4844:   	orcc	%l5, 0xf03, %o3
	.word	0x93b5c30c	! t0_kref+0x4848:   	alignaddr	%l7, %o4, %o1
	.word	0xd8a8a008	! t0_kref+0x484c:   	stba	%o4, [%g2 + 8]%asi
	.word	0xd0b0a01a	! t0_kref+0x4850:   	stha	%o0, [%g2 + 0x1a]%asi
	.word	0xdb20a030	! t0_kref+0x4854:   	st	%f13, [%g2 + 0x30]
	.word	0xa7b00fe0	! t0_kref+0x4858:   	fones	%f19
	.word	0xa8234015	! t0_kref+0x485c:   	sub	%o5, %l5, %l4
	.word	0x81dee3c0	! t0_kref+0x4860:   	flush	%i3 + 0x3c0
	.word	0x20480005	! t0_kref+0x4864:   	bn,a,pt	%icc, _kref+0x4878
	.word	0x80ab000a	! t0_kref+0x4868:   	andncc	%o4, %o2, %g0
	.word	0xd07e7ff0	! t0_kref+0x486c:   	swap	[%i1 - 0x10], %o0
	.word	0x2d1347e9	! t0_kref+0x4870:   	sethi	%hi(0x4d1fa400), %l6
	.word	0xada01a58	! t0_kref+0x4874:   	fdtoi	%f24, %f22
	.word	0x8115c000	! t0_kref+0x4878:   	taddcctv	%l7, %g0, %g0
	.word	0xd428a005	! t0_kref+0x487c:   	stb	%o2, [%g2 + 5]
	.word	0xa9a5482e	! t0_kref+0x4880:   	fadds	%f21, %f14, %f20
	.word	0xe27e001c	! t0_kref+0x4884:   	swap	[%i0 + %i4], %l1
	.word	0xdd1fbda8	! t0_kref+0x4888:   	ldd	[%fp - 0x258], %f14
	.word	0xd026401c	! t0_kref+0x488c:   	st	%o0, [%i1 + %i4]
	.word	0xe8c81019	! t0_kref+0x4890:   	ldsba	[%g0 + %i1]0x80, %l4
	.word	0xa41ac009	! t0_kref+0x4894:   	xor	%o3, %o1, %l2
	call	SYM(t0_subr1)
	.word	0xf1200019	! t0_kref+0x489c:   	st	%f24, [%g0 + %i1]
	.word	0xb5b606dc	! t0_kref+0x48a0:   	fmul8sux16	%f24, %f28, %f26
	.word	0xac1aaca8	! t0_kref+0x48a4:   	xor	%o2, 0xca8, %l6
	.word	0xedee101c	! t0_kref+0x48a8:   	prefetcha	%i0 + %i4, 22
	.word	0xc5ee5015	! t0_kref+0x48ac:   	prefetcha	%i1 + %l5, 2
	.word	0x8143e040	! t0_kref+0x48b0:   	membar	0x40
	.word	0xd9f6500a	! t0_kref+0x48b4:   	casxa	[%i1]0x80, %o2, %o4
	.word	0xa5b34abc	! t0_kref+0x48b8:   	fpsub16s	%f13, %f28, %f18
	.word	0xc16e0015	! t0_kref+0x48bc:   	prefetch	%i0 + %l5, 0
	.word	0x8092400b	! t0_kref+0x48c0:   	orcc	%o1, %o3, %g0
	.word	0xae65e0f1	! t0_kref+0x48c4:   	subc	%l7, 0xf1, %l7
	.word	0xa4aac01a	! t0_kref+0x48c8:   	andncc	%o3, %i2, %l2
	.word	0xa3b34a71	! t0_kref+0x48cc:   	fpadd32s	%f13, %f17, %f17
	.word	0xe9a0a028	! t0_kref+0x48d0:   	sta	%f20, [%g2 + 0x28]%asi
	.word	0xa682800a	! t0_kref+0x48d4:   	addcc	%o2, %o2, %l3
	.word	0xa1a01912	! t0_kref+0x48d8:   	fitod	%f18, %f16
	.word	0xea066008	! t0_kref+0x48dc:   	ld	[%i1 + 8], %l5
	.word	0xaa58234d	! t0_kref+0x48e0:   	smul	%g0, 0x34d, %l5
	.word	0xafb34af0	! t0_kref+0x48e4:   	fpsub32s	%f13, %f16, %f23
	.word	0x9da000bc	! t0_kref+0x48e8:   	fnegs	%f28, %f14
	.word	0x9832800b	! t0_kref+0x48ec:   	orn	%o2, %o3, %o4
	.word	0xa4922ea0	! t0_kref+0x48f0:   	orcc	%o0, 0xea0, %l2
	.word	0xe9ee501c	! t0_kref+0x48f4:   	prefetcha	%i1 + %i4, 20
	.word	0x9ef22f90	! t0_kref+0x48f8:   	udivcc	%o0, 0xf90, %o7
	.word	0x90e36e63	! t0_kref+0x48fc:   	subccc	%o5, 0xe63, %o0
	.word	0x83414000	! t0_kref+0x4900:   	mov	%pc, %g1
	.word	0x9613689c	! t0_kref+0x4904:   	or	%o5, 0x89c, %o3
	.word	0xd01e2000	! t0_kref+0x4908:   	ldd	[%i0], %o0
	.word	0x173cd434	! t0_kref+0x490c:   	sethi	%hi(0xf350d000), %o3
	.word	0xf11e001d	! t0_kref+0x4910:   	ldd	[%i0 + %i5], %f24
	.word	0x94e5f43d	! t0_kref+0x4914:   	subccc	%l7, -0xbc3, %o2
	.word	0xa9a0054e	! t0_kref+0x4918:   	fsqrtd	%f14, %f20
	.word	0xe91fbf50	! t0_kref+0x491c:   	ldd	[%fp - 0xb0], %f20
	.word	0xafa01a5c	! t0_kref+0x4920:   	fdtoi	%f28, %f23
	.word	0x9bb54aed	! t0_kref+0x4924:   	fpsub32s	%f21, %f13, %f13
	.word	0xa8b58017	! t0_kref+0x4928:   	orncc	%l6, %l7, %l4
	.word	0xee062010	! t0_kref+0x492c:   	ld	[%i0 + 0x10], %l7
	.word	0xadb507d0	! t0_kref+0x4930:   	pdist	%f20, %f16, %f22
	.word	0xea08a03a	! t0_kref+0x4934:   	ldub	[%g2 + 0x3a], %l5
	.word	0x9da508d0	! t0_kref+0x4938:   	fsubd	%f20, %f16, %f14
	.word	0xadb60719	! t0_kref+0x493c:   	fmuld8sux16	%f24, %f25, %f22
	.word	0xe9be5816	! t0_kref+0x4940:   	stda	%f20, [%i1 + %l6]0xc0
	.word	0xb7b5ca39	! t0_kref+0x4944:   	fpadd16s	%f23, %f25, %f27
	.word	0xaa0aabd9	! t0_kref+0x4948:   	and	%o2, 0xbd9, %l5
	.word	0xd090a01c	! t0_kref+0x494c:   	lduha	[%g2 + 0x1c]%asi, %o0
	.word	0x8143c000	! t0_kref+0x4950:   	stbar
	.word	0x81af0a52	! t0_kref+0x4954:   	fcmpd	%fcc0, %f28, %f18
	.word	0xd25e001d	! t0_kref+0x4958:   	ldx	[%i0 + %i5], %o1
	.word	0xa5a0053c	! t0_kref+0x495c:   	fsqrts	%f28, %f18
	.word	0x92024017	! t0_kref+0x4960:   	add	%o1, %l7, %o1
	.word	0xe126401c	! t0_kref+0x4964:   	st	%f16, [%i1 + %i4]
	.word	0xab2a400c	! t0_kref+0x4968:   	sll	%o1, %o4, %l5
	.word	0x942b400a	! t0_kref+0x496c:   	andn	%o5, %o2, %o2
	.word	0xe8be3fe8	! t0_kref+0x4970:   	stda	%l4, [%i0 - 0x18]%asi
	.word	0x9822801a	! t0_kref+0x4974:   	sub	%o2, %i2, %o4
	.word	0x27800001	! t0_kref+0x4978:   	fbul,a	_kref+0x497c
	.word	0xa5a0193c	! t0_kref+0x497c:   	fstod	%f28, %f18
	.word	0xeef63fe8	! t0_kref+0x4980:   	stxa	%l7, [%i0 - 0x18]%asi
	.word	0xeb20a024	! t0_kref+0x4984:   	st	%f21, [%g2 + 0x24]
	.word	0x8143c000	! t0_kref+0x4988:   	stbar
	.word	0xd9a0a03c	! t0_kref+0x498c:   	sta	%f12, [%g2 + 0x3c]%asi
	call	SYM(t0_subr1)
	.word	0xeace7fe8	! t0_kref+0x4994:   	ldsba	[%i1 - 0x18]%asi, %l5
	.word	0x9ad57e22	! t0_kref+0x4998:   	umulcc	%l5, -0x1de, %o5
	.word	0xc12e3ff8	! t0_kref+0x499c:   	st	%fsr, [%i0 - 8]
	.word	0x95b2c04b	! t0_kref+0x49a0:   	edge8l	%o3, %o3, %o2
	.word	0x2c480006	! t0_kref+0x49a4:   	bneg,a,pt	%icc, _kref+0x49bc
	.word	0xd208a019	! t0_kref+0x49a8:   	ldub	[%g2 + 0x19], %o1
	.word	0x2f0ce491	! t0_kref+0x49ac:   	sethi	%hi(0x33924400), %l7
	.word	0xc807bfe8	! t0_kref+0x49b0:   	ld	[%fp - 0x18], %g4
	.word	0x9ee5e84d	! t0_kref+0x49b4:   	subccc	%l7, 0x84d, %o7
	.word	0x9fc10000	! t0_kref+0x49b8:   	call	%g4
	.word	0xaba01896	! t0_kref+0x49bc:   	fitos	%f22, %f21
	.word	0xa5b50558	! t0_kref+0x49c0:   	fcmpeq16	%f20, %f24, %l2
	.word	0xb7a0053b	! t0_kref+0x49c4:   	fsqrts	%f27, %f27
	.word	0xbba01a4c	! t0_kref+0x49c8:   	fdtoi	%f12, %f29
	.word	0xb1a000b5	! t0_kref+0x49cc:   	fnegs	%f21, %f24
	.word	0xa7a01a56	! t0_kref+0x49d0:   	fdtoi	%f22, %f19
	.word	0x80a00000	! t0_kref+0x49d4:   	cmp	%g0, %g0
	.word	0x20800005	! t0_kref+0x49d8:   	bn,a	_kref+0x49ec
	.word	0x81db39c8	! t0_kref+0x49dc:   	flush	%o4 - 0x638
	.word	0xfb06401c	! t0_kref+0x49e0:   	ld	[%i1 + %i4], %f29
	.word	0x9e08000a	! t0_kref+0x49e4:   	and	%g0, %o2, %o7
	.word	0xfd80a034	! t0_kref+0x49e8:   	lda	[%g2 + 0x34]%asi, %f30
	.word	0x3c800008	! t0_kref+0x49ec:   	bpos,a	_kref+0x4a0c
	.word	0xa9a54837	! t0_kref+0x49f0:   	fadds	%f21, %f23, %f20
	.word	0x8143c000	! t0_kref+0x49f4:   	stbar
	.word	0xae5ea5c8	! t0_kref+0x49f8:   	smul	%i2, 0x5c8, %l7
	.word	0xa5b34a72	! t0_kref+0x49fc:   	fpadd32s	%f13, %f18, %f18
	.word	0xb9a00535	! t0_kref+0x4a00:   	fsqrts	%f21, %f28
	.word	0x36480002	! t0_kref+0x4a04:   	bge,a,pt	%icc, _kref+0x4a0c
	.word	0xa71264f0	! t0_kref+0x4a08:   	taddcctv	%o1, 0x4f0, %l3
	.word	0xada01a3c	! t0_kref+0x4a0c:   	fstoi	%f28, %f22
	.word	0xf1ee101d	! t0_kref+0x4a10:   	prefetcha	%i0 + %i5, 24
	.word	0xa72dc01a	! t0_kref+0x4a14:   	sll	%l7, %i2, %l3
	.word	0xf5ee501b	! t0_kref+0x4a18:   	prefetcha	%i1 + %i3, 26
	.word	0xe408a02c	! t0_kref+0x4a1c:   	ldub	[%g2 + 0x2c], %l2
	.word	0x99a0191b	! t0_kref+0x4a20:   	fitod	%f27, %f12
	.word	0x9fa01893	! t0_kref+0x4a24:   	fitos	%f19, %f15
	.word	0x34800004	! t0_kref+0x4a28:   	bg,a	_kref+0x4a38
	.word	0xaa9b000a	! t0_kref+0x4a2c:   	xorcc	%o4, %o2, %l5
	.word	0xa42a8000	! t0_kref+0x4a30:   	andn	%o2, %g0, %l2
	.word	0xb3a000b5	! t0_kref+0x4a34:   	fnegs	%f21, %f25
	.word	0x9ba01a5e	! t0_kref+0x4a38:   	fdtoi	%f30, %f13
	.word	0x90ad8017	! t0_kref+0x4a3c:   	andncc	%l6, %l7, %o0
	.word	0x91322011	! t0_kref+0x4a40:   	srl	%o0, 0x11, %o0
	.word	0xd48e9018	! t0_kref+0x4a44:   	lduba	[%i2 + %i0]0x80, %o2
	.word	0xa9a58d3e	! t0_kref+0x4a48:   	fsmuld	%f22, %f30, %f20
	.word	0xf1be180b	! t0_kref+0x4a4c:   	stda	%f24, [%i0 + %o3]0xc0
	.word	0xb9a30936	! t0_kref+0x4a50:   	fmuls	%f12, %f22, %f28
	call	SYM(t0_subr0)
	.word	0xa8700008	! t0_kref+0x4a58:   	udiv	%g0, %o0, %l4
	.word	0x803b7511	! t0_kref+0x4a5c:   	xnor	%o5, -0xaef, %g0
	.word	0x81ab0ad2	! t0_kref+0x4a60:   	fcmped	%fcc0, %f12, %f18
	.word	0xaebb6ba1	! t0_kref+0x4a64:   	xnorcc	%o5, 0xba1, %l7
	.word	0x92180008	! t0_kref+0x4a68:   	xor	%g0, %o0, %o1
	.word	0x9486800b	! t0_kref+0x4a6c:   	addcc	%i2, %o3, %o2
	.word	0xeb6e401c	! t0_kref+0x4a70:   	prefetch	%i1 + %i4, 21
	.word	0x80e5a84e	! t0_kref+0x4a74:   	subccc	%l6, 0x84e, %g0
	.word	0x94b5c00b	! t0_kref+0x4a78:   	orncc	%l7, %o3, %o2
	call	SYM(t0_subr0)
	.word	0xc0400019	! t0_kref+0x4a80:   	ldsw	[%g0 + %i1], %g0
	.word	0xb9a408b9	! t0_kref+0x4a84:   	fsubs	%f16, %f25, %f28
	.word	0xaaa3000d	! t0_kref+0x4a88:   	subcc	%o4, %o5, %l5
	.word	0xea262014	! t0_kref+0x4a8c:   	st	%l5, [%i0 + 0x14]
	.word	0x81ae4a3a	! t0_kref+0x4a90:   	fcmps	%fcc0, %f25, %f26
	.word	0xd436c019	! t0_kref+0x4a94:   	sth	%o2, [%i3 + %i1]
	.word	0xe440a014	! t0_kref+0x4a98:   	ldsw	[%g2 + 0x14], %l2
	.word	0x83414000	! t0_kref+0x4a9c:   	mov	%pc, %g1
	.word	0xe1263fe4	! t0_kref+0x4aa0:   	st	%f16, [%i0 - 0x1c]
	.word	0xdd9e2000	! t0_kref+0x4aa4:   	ldda	[%i0]%asi, %f14
	.word	0xb1b78e80	! t0_kref+0x4aa8:   	fsrc1	%f30, %f24
	.word	0xa5400000	! t0_kref+0x4aac:   	mov	%y, %l2
	.word	0x8143e040	! t0_kref+0x4ab0:   	membar	0x40
	.word	0xadb00c00	! t0_kref+0x4ab4:   	fzero	%f22
	.word	0x31800003	! t0_kref+0x4ab8:   	fba,a	_kref+0x4ac4
	.word	0x922a800d	! t0_kref+0x4abc:   	andn	%o2, %o5, %o1
	.word	0x91b34300	! t0_kref+0x4ac0:   	alignaddr	%o5, %g0, %o0
	.word	0x9f280015	! t0_kref+0x4ac4:   	sll	%g0, %l5, %o7
	.word	0xbdb48979	! t0_kref+0x4ac8:   	fpmerge	%f18, %f25, %f30
	.word	0xf5ee501c	! t0_kref+0x4acc:   	prefetcha	%i1 + %i4, 26
	.word	0x9fc00004	! t0_kref+0x4ad0:   	call	%g0 + %g4
	.word	0xff6e3fe0	! t0_kref+0x4ad4:   	prefetch	%i0 - 0x20, 31
	.word	0xd66e001a	! t0_kref+0x4ad8:   	ldstub	[%i0 + %i2], %o3
	.word	0x9255a654	! t0_kref+0x4adc:   	umul	%l6, 0x654, %o1
	.word	0x2a800008	! t0_kref+0x4ae0:   	bcs,a	_kref+0x4b00
	.word	0xa8f28017	! t0_kref+0x4ae4:   	udivcc	%o2, %l7, %l4
	.word	0xae23000c	! t0_kref+0x4ae8:   	sub	%o4, %o4, %l7
	.word	0x28480005	! t0_kref+0x4aec:   	bleu,a,pt	%icc, _kref+0x4b00
	.word	0xd99e5a5d	! t0_kref+0x4af0:   	ldda	[%i1 + %i5]0xd2, %f12
	.word	0x3a800007	! t0_kref+0x4af4:   	bcc,a	_kref+0x4b10
	.word	0x8143e002	! t0_kref+0x4af8:   	membar	0x2
	.word	0x2b480007	! t0_kref+0x4afc:   	fbug,a,pt	%fcc0, _kref+0x4b18
	.word	0xe4067ff4	! t0_kref+0x4b00:   	ld	[%i1 - 0xc], %l2
	.word	0xb9a018dc	! t0_kref+0x4b04:   	fdtos	%f28, %f28
	.word	0x2c800004	! t0_kref+0x4b08:   	bneg,a	_kref+0x4b18
	.word	0xb9b48d16	! t0_kref+0x4b0c:   	fandnot1	%f18, %f22, %f28
	.word	0x113f9ae2	! t0_kref+0x4b10:   	sethi	%hi(0xfe6b8800), %o0
	.word	0xd2a0a004	! t0_kref+0x4b14:   	sta	%o1, [%g2 + 4]%asi
	.word	0xaf418000	! t0_kref+0x4b18:   	mov	%fprs, %l7
	.word	0xbba3883c	! t0_kref+0x4b1c:   	fadds	%f14, %f28, %f29
	.word	0xee30a036	! t0_kref+0x4b20:   	sth	%l7, [%g2 + 0x36]
	.word	0x92e26ce3	! t0_kref+0x4b24:   	subccc	%o1, 0xce3, %o1
	.word	0xb1b687cc	! t0_kref+0x4b28:   	pdist	%f26, %f12, %f24
	.word	0xb5b00cce	! t0_kref+0x4b2c:   	fnot2	%f14, %f26
	.word	0x2d800006	! t0_kref+0x4b30:   	fbg,a	_kref+0x4b48
	.word	0x90836908	! t0_kref+0x4b34:   	addcc	%o5, 0x908, %o0
	.word	0x34480005	! t0_kref+0x4b38:   	bg,a,pt	%icc, _kref+0x4b4c
	.word	0xdd20a014	! t0_kref+0x4b3c:   	st	%f14, [%g2 + 0x14]
	.word	0x9732e00f	! t0_kref+0x4b40:   	srl	%o3, 0xf, %o3
	.word	0x9fc10000	! t0_kref+0x4b44:   	call	%g4
	.word	0x9072aa71	! t0_kref+0x4b48:   	udiv	%o2, 0xa71, %o0
	call	SYM(t0_subr2)
	.word	0xb1a0054c	! t0_kref+0x4b50:   	fsqrtd	%f12, %f24
	.word	0xac75eb30	! t0_kref+0x4b54:   	udiv	%l7, 0xb30, %l6
	.word	0xee26001c	! t0_kref+0x4b58:   	st	%l7, [%i0 + %i4]
	.word	0x2e480003	! t0_kref+0x4b5c:   	bvs,a,pt	%icc, _kref+0x4b68
	.word	0xb1a68852	! t0_kref+0x4b60:   	faddd	%f26, %f18, %f24
	.word	0x99a01910	! t0_kref+0x4b64:   	fitod	%f16, %f12
	.word	0xea36c018	! t0_kref+0x4b68:   	sth	%l5, [%i3 + %i0]
	.word	0xaa5a30e2	! t0_kref+0x4b6c:   	smul	%o0, -0xf1e, %l5
	.word	0xa40ac00d	! t0_kref+0x4b70:   	and	%o3, %o5, %l2
	.word	0x2b800003	! t0_kref+0x4b74:   	fbug,a	_kref+0x4b80
	.word	0xf1be584a	! t0_kref+0x4b78:   	stda	%f24, [%i1 + %o2]0xc2
	.word	0x99234015	! t0_kref+0x4b7c:   	mulscc	%o5, %l5, %o4
	.word	0xb1b4ca2d	! t0_kref+0x4b80:   	fpadd16s	%f19, %f13, %f24
	.word	0xe83e401d	! t0_kref+0x4b84:   	std	%l4, [%i1 + %i5]
	.word	0xa3b3cdf1	! t0_kref+0x4b88:   	fnands	%f15, %f17, %f17
	.word	0x81dfb532	! t0_kref+0x4b8c:   	flush	%fp - 0xace
	.word	0xac923e96	! t0_kref+0x4b90:   	orcc	%o0, -0x16a, %l6
	.word	0x22800006	! t0_kref+0x4b94:   	be,a	_kref+0x4bac
	.word	0x965aed75	! t0_kref+0x4b98:   	smul	%o3, 0xd75, %o3
	.word	0xa6403f0b	! t0_kref+0x4b9c:   	addc	%g0, -0xf5, %l3
	.word	0xc0480019	! t0_kref+0x4ba0:   	ldsb	[%g0 + %i1], %g0
	.word	0xeaae3ff5	! t0_kref+0x4ba4:   	stba	%l5, [%i0 - 0xb]%asi
	.word	0xb5b58adc	! t0_kref+0x4ba8:   	fpsub32	%f22, %f28, %f26
	.word	0xd428a033	! t0_kref+0x4bac:   	stb	%o2, [%g2 + 0x33]
	.word	0xe406001c	! t0_kref+0x4bb0:   	ld	[%i0 + %i4], %l2
	.word	0xed1e7fe8	! t0_kref+0x4bb4:   	ldd	[%i1 - 0x18], %f22
	.word	0xe448a036	! t0_kref+0x4bb8:   	ldsb	[%g2 + 0x36], %l2
	.word	0xd4ce1000	! t0_kref+0x4bbc:   	ldsba	[%i0]0x80, %o2
	.word	0xe5267ffc	! t0_kref+0x4bc0:   	st	%f18, [%i1 - 4]
	.word	0xb1a4084e	! t0_kref+0x4bc4:   	faddd	%f16, %f14, %f24
	.word	0x3d480008	! t0_kref+0x4bc8:   	fbule,a,pt	%fcc0, _kref+0x4be8
	.word	0x9b02a64d	! t0_kref+0x4bcc:   	taddcc	%o2, 0x64d, %o5
	.word	0xaa1ac009	! t0_kref+0x4bd0:   	xor	%o3, %o1, %l5
	.word	0xd2270018	! t0_kref+0x4bd4:   	st	%o1, [%i4 + %i0]
	.word	0xab2031e8	! t0_kref+0x4bd8:   	mulscc	%g0, -0xe18, %l5
	.word	0xb9a000b7	! t0_kref+0x4bdc:   	fnegs	%f23, %f28
	.word	0xb5b38ab9	! t0_kref+0x4be0:   	fpsub16s	%f14, %f25, %f26
	.word	0xb5a01916	! t0_kref+0x4be4:   	fitod	%f22, %f26
	.word	0xe84e201b	! t0_kref+0x4be8:   	ldsb	[%i0 + 0x1b], %l4
	.word	0xa4a5f033	! t0_kref+0x4bec:   	subcc	%l7, -0xfcd, %l2
	.word	0x989decf9	! t0_kref+0x4bf0:   	xorcc	%l7, 0xcf9, %o4
	.word	0xa92ac017	! t0_kref+0x4bf4:   	sll	%o3, %l7, %l4
	.word	0x2f480005	! t0_kref+0x4bf8:   	fbu,a,pt	%fcc0, _kref+0x4c0c
	.word	0xc807bfec	! t0_kref+0x4bfc:   	ld	[%fp - 0x14], %g4
	.word	0xd6b0a008	! t0_kref+0x4c00:   	stha	%o3, [%g2 + 8]%asi
	.word	0xf7200018	! t0_kref+0x4c04:   	st	%f27, [%g0 + %i0]
	.word	0xb1b00cdc	! t0_kref+0x4c08:   	fnot2	%f28, %f24
	.word	0xb1a01895	! t0_kref+0x4c0c:   	fitos	%f21, %f24
	.word	0xd830a008	! t0_kref+0x4c10:   	sth	%o4, [%g2 + 8]
	.word	0xac968016	! t0_kref+0x4c14:   	orcc	%i2, %l6, %l6
	.word	0xd2a63fe4	! t0_kref+0x4c18:   	sta	%o1, [%i0 - 0x1c]%asi
	.word	0xa41a400c	! t0_kref+0x4c1c:   	xor	%o1, %o4, %l2
	.word	0xae722429	! t0_kref+0x4c20:   	udiv	%o0, 0x429, %l7
	.word	0x94e54015	! t0_kref+0x4c24:   	subccc	%l5, %l5, %o2
	.word	0xb1b5c67b	! t0_kref+0x4c28:   	fmul8x16au	%f23, %f27, %f24
	.word	0x8143c000	! t0_kref+0x4c2c:   	stbar
	.word	0x36480002	! t0_kref+0x4c30:   	bge,a,pt	%icc, _kref+0x4c38
	.word	0xa7a788b4	! t0_kref+0x4c34:   	fsubs	%f30, %f20, %f19
	.word	0xaae2c00b	! t0_kref+0x4c38:   	subccc	%o3, %o3, %l5
	.word	0x9ba00533	! t0_kref+0x4c3c:   	fsqrts	%f19, %f13
	.word	0x81af4a3e	! t0_kref+0x4c40:   	fcmps	%fcc0, %f29, %f30
	.word	0x9ae336a2	! t0_kref+0x4c44:   	subccc	%o4, -0x95e, %o5
	.word	0xbda00554	! t0_kref+0x4c48:   	fsqrtd	%f20, %f30
	.word	0x81ab4a31	! t0_kref+0x4c4c:   	fcmps	%fcc0, %f13, %f17
	.word	0xaba00133	! t0_kref+0x4c50:   	fabss	%f19, %f21
	.word	0xa5a00552	! t0_kref+0x4c54:   	fsqrtd	%f18, %f18
	.word	0x33800007	! t0_kref+0x4c58:   	fbe,a	_kref+0x4c74
	.word	0x98c2800b	! t0_kref+0x4c5c:   	addccc	%o2, %o3, %o4
	.word	0xada000ce	! t0_kref+0x4c60:   	fnegd	%f14, %f22
	.word	0xf91fbc88	! t0_kref+0x4c64:   	ldd	[%fp - 0x378], %f28
	.word	0x9130200b	! t0_kref+0x4c68:   	srl	%g0, 0xb, %o0
	.word	0xa5257fbb	! t0_kref+0x4c6c:   	mulscc	%l5, -0x45, %l2
	.word	0x20800006	! t0_kref+0x4c70:   	bn,a	_kref+0x4c88
	.word	0xd91e3ff8	! t0_kref+0x4c74:   	ldd	[%i0 - 8], %f12
	.word	0xe93e7ff0	! t0_kref+0x4c78:   	std	%f20, [%i1 - 0x10]
	.word	0xa5b54aba	! t0_kref+0x4c7c:   	fpsub16s	%f21, %f26, %f18
	.word	0xee2e7fe5	! t0_kref+0x4c80:   	stb	%l7, [%i1 - 0x1b]
	.word	0x97302017	! t0_kref+0x4c84:   	srl	%g0, 0x17, %o3
	.word	0x99a000b0	! t0_kref+0x4c88:   	fnegs	%f16, %f12
	.word	0xd8270018	! t0_kref+0x4c8c:   	st	%o4, [%i4 + %i0]
	.word	0xe1263ff4	! t0_kref+0x4c90:   	st	%f16, [%i0 - 0xc]
	.word	0xea5f4019	! t0_kref+0x4c94:   	ldx	[%i5 + %i1], %l5
	.word	0xa7a5482f	! t0_kref+0x4c98:   	fadds	%f21, %f15, %f19
	.word	0x9da0054c	! t0_kref+0x4c9c:   	fsqrtd	%f12, %f14
	.word	0xb5a01a32	! t0_kref+0x4ca0:   	fstoi	%f18, %f26
	.word	0xa5b40e80	! t0_kref+0x4ca4:   	fsrc1	%f16, %f18
	.word	0xabb64cb6	! t0_kref+0x4ca8:   	fandnot2s	%f25, %f22, %f21
	.word	0x81d97a57	! t0_kref+0x4cac:   	flush	%g5 - 0x5a9
	.word	0x90700016	! t0_kref+0x4cb0:   	udiv	%g0, %l6, %o0
	.word	0xd290a016	! t0_kref+0x4cb4:   	lduha	[%g2 + 0x16]%asi, %o1
	.word	0xac9a8015	! t0_kref+0x4cb8:   	xorcc	%o2, %l5, %l6
	.word	0xa832000c	! t0_kref+0x4cbc:   	orn	%o0, %o4, %l4
	call	SYM(t0_subr1)
	.word	0xd81e001d	! t0_kref+0x4cc4:   	ldd	[%i0 + %i5], %o4
	.word	0xe81e3fe8	! t0_kref+0x4cc8:   	ldd	[%i0 - 0x18], %l4
	.word	0x9ba018da	! t0_kref+0x4ccc:   	fdtos	%f26, %f13
	.word	0xb5b00fc0	! t0_kref+0x4cd0:   	fone	%f26
	.word	0xd2363ffc	! t0_kref+0x4cd4:   	sth	%o1, [%i0 - 4]
	.word	0x99a01a31	! t0_kref+0x4cd8:   	fstoi	%f17, %f12
	.word	0xde500019	! t0_kref+0x4cdc:   	ldsh	[%g0 + %i1], %o7
	.word	0xa5b68e54	! t0_kref+0x4ce0:   	fxnor	%f26, %f20, %f18
	.word	0x30800002	! t0_kref+0x4ce4:   	ba,a	_kref+0x4cec
	.word	0x94b30015	! t0_kref+0x4ce8:   	orncc	%o4, %l5, %o2
	.word	0xadb70c94	! t0_kref+0x4cec:   	fandnot2	%f28, %f20, %f22
	.word	0x801a7a86	! t0_kref+0x4cf0:   	xor	%o1, -0x57a, %g0
	.word	0x80fa4000	! t0_kref+0x4cf4:   	sdivcc	%o1, %g0, %g0
	.word	0xb9a38854	! t0_kref+0x4cf8:   	faddd	%f14, %f20, %f28
	.word	0x22480001	! t0_kref+0x4cfc:   	be,a,pt	%icc, _kref+0x4d00
	.word	0xd6280019	! t0_kref+0x4d00:   	stb	%o3, [%g0 + %i1]
	.word	0x81580000	! t0_kref+0x4d04:   	flushw
	.word	0x3d480001	! t0_kref+0x4d08:   	fbule,a,pt	%fcc0, _kref+0x4d0c
	.word	0xb9a0055c	! t0_kref+0x4d0c:   	fsqrtd	%f28, %f28
	.word	0xbba000ad	! t0_kref+0x4d10:   	fnegs	%f13, %f29
	.word	0x96e00016	! t0_kref+0x4d14:   	subccc	%g0, %l6, %o3
	.word	0xae12c00c	! t0_kref+0x4d18:   	or	%o3, %o4, %l7
	.word	0xa5b68280	! t0_kref+0x4d1c:   	array32	%i2, %g0, %l2
	.word	0x2909efb6	! t0_kref+0x4d20:   	sethi	%hi(0x27bed800), %l4
	.word	0x81dcc00b	! t0_kref+0x4d24:   	flush	%l3 + %o3
	.word	0xa9b38598	! t0_kref+0x4d28:   	fcmpgt32	%f14, %f24, %l4
	.word	0xd9be5840	! t0_kref+0x4d2c:   	stda	%f12, [%i1]0xc2
	.word	0x20800001	! t0_kref+0x4d30:   	bn,a	_kref+0x4d34
	.word	0x9a5de7ec	! t0_kref+0x4d34:   	smul	%l7, 0x7ec, %o5
	.word	0x9ba000bb	! t0_kref+0x4d38:   	fnegs	%f27, %f13
	.word	0x36480008	! t0_kref+0x4d3c:   	bge,a,pt	%icc, _kref+0x4d5c
	.word	0x9740c000	! t0_kref+0x4d40:   	mov	%asi, %o3
	.word	0x9822800c	! t0_kref+0x4d44:   	sub	%o2, %o4, %o4
	.word	0xafa01a5c	! t0_kref+0x4d48:   	fdtoi	%f28, %f23
	.word	0xb9b48d18	! t0_kref+0x4d4c:   	fandnot1	%f18, %f24, %f28
	.word	0x912dc00c	! t0_kref+0x4d50:   	sll	%l7, %o4, %o0
	.word	0xadb48d40	! t0_kref+0x4d54:   	fnot1	%f18, %f22
	.word	0xf11e4000	! t0_kref+0x4d58:   	ldd	[%i1], %f24
	.word	0xe91e3fe8	! t0_kref+0x4d5c:   	ldd	[%i0 - 0x18], %f20
	.word	0xb9a309d0	! t0_kref+0x4d60:   	fdivd	%f12, %f16, %f28
	.word	0xd2000019	! t0_kref+0x4d64:   	ld	[%g0 + %i1], %o1
	.word	0x81b50554	! t0_kref+0x4d68:   	fcmpeq16	%f20, %f20, %g0
	.word	0xa8132253	! t0_kref+0x4d6c:   	or	%o4, 0x253, %l4
	.word	0xee28a015	! t0_kref+0x4d70:   	stb	%l7, [%g2 + 0x15]
	.word	0x9033400c	! t0_kref+0x4d74:   	orn	%o5, %o4, %o0
	.word	0xd07e7ff4	! t0_kref+0x4d78:   	swap	[%i1 - 0xc], %o0
	.word	0x9da588d4	! t0_kref+0x4d7c:   	fsubd	%f22, %f20, %f14
	.word	0xa6300000	! t0_kref+0x4d80:   	orn	%g0, %g0, %l3
	.word	0x81dbc001	! t0_kref+0x4d84:   	flush	%o7 + %g1
	.word	0x81af8a34	! t0_kref+0x4d88:   	fcmps	%fcc0, %f30, %f20
	.word	0xf3ee501c	! t0_kref+0x4d8c:   	prefetcha	%i1 + %i4, 25
	.word	0x94d8000d	! t0_kref+0x4d90:   	smulcc	%g0, %o5, %o2
	.word	0xe8e8a001	! t0_kref+0x4d94:   	ldstuba	[%g2 + 1]%asi, %l4
	.word	0xa1a0190d	! t0_kref+0x4d98:   	fitod	%f13, %f16
	.word	0x802031ff	! t0_kref+0x4d9c:   	sub	%g0, -0xe01, %g0
	.word	0xecb0a03c	! t0_kref+0x4da0:   	stha	%l6, [%g2 + 0x3c]%asi
	.word	0xf420a00c	! t0_kref+0x4da4:   	st	%i2, [%g2 + 0xc]
	.word	0x9e930009	! t0_kref+0x4da8:   	orcc	%o4, %o1, %o7
	.word	0xa5a0104c	! t0_kref+0x4dac:   	fdtox	%f12, %f18
	.word	0xb5a4cd39	! t0_kref+0x4db0:   	fsmuld	%f19, %f25, %f26
	.word	0x93b5816b	! t0_kref+0x4db4:   	edge32ln	%l6, %o3, %o1
	.word	0xa9b60a92	! t0_kref+0x4db8:   	fpsub16	%f24, %f18, %f20
	.word	0xf526001c	! t0_kref+0x4dbc:   	st	%f26, [%i0 + %i4]
	.word	0xb9a0192c	! t0_kref+0x4dc0:   	fstod	%f12, %f28
	.word	0xd8363ffe	! t0_kref+0x4dc4:   	sth	%o4, [%i0 - 2]
	.word	0x9b70000d	! t0_kref+0x4dc8:   	popc	%o5, %o5
	.word	0xaee2288c	! t0_kref+0x4dcc:   	subccc	%o0, 0x88c, %l7
	.word	0xe9e65009	! t0_kref+0x4dd0:   	casa	[%i1]0x80, %o1, %l4
	.word	0x81b6048e	! t0_kref+0x4dd4:   	fcmple32	%f24, %f14, %g0
	.word	0x81ac8a5c	! t0_kref+0x4dd8:   	fcmpd	%fcc0, %f18, %f28
	.word	0x86102004	! t0_kref+0x4ddc:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x4de0:   	bne,a	_kref+0x4de0
	.word	0x86a0e001	! t0_kref+0x4de4:   	subcc	%g3, 1, %g3
	.word	0x908ac008	! t0_kref+0x4de8:   	andcc	%o3, %o0, %o0
	.word	0xaf15ff7c	! t0_kref+0x4dec:   	taddcctv	%l7, -0x84, %l7
	.word	0xae55c000	! t0_kref+0x4df0:   	umul	%l7, %g0, %l7
	.word	0xa40a7fc6	! t0_kref+0x4df4:   	and	%o1, -0x3a, %l2
	.word	0x97418000	! t0_kref+0x4df8:   	mov	%fprs, %o3
	.word	0x9fc10000	! t0_kref+0x4dfc:   	call	%g4
	.word	0x9bb58168	! t0_kref+0x4e00:   	edge32ln	%l6, %o0, %o5
	.word	0x28800008	! t0_kref+0x4e04:   	bleu,a	_kref+0x4e24
	.word	0x93400000	! t0_kref+0x4e08:   	mov	%y, %o1
	.word	0x8143c000	! t0_kref+0x4e0c:   	stbar
	.word	0xd6070018	! t0_kref+0x4e10:   	ld	[%i4 + %i0], %o3
	.word	0xb5a70d3b	! t0_kref+0x4e14:   	fsmuld	%f28, %f27, %f26
	.word	0x99b48a4c	! t0_kref+0x4e18:   	fpadd32	%f18, %f12, %f12
	.word	0xaefb37df	! t0_kref+0x4e1c:   	sdivcc	%o4, -0x821, %l7
	.word	0x01000000	! t0_kref+0x4e20:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e28:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x70c3c000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x709f0000)
.seg "text"
t0_subr1_page_begin:
	.skip 8180
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x709e6000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x70a0e000)
.seg "text"
t0_subr3_page_begin:
	.skip 8172
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
!  Total operations: 4944  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.20   1.25
!  ldub              0.38   0.28
!  ldsh              0.84   0.89
!  lduh              0.01   0.00
!  ld                1.23   1.36
!  ldd               0.75   0.89
!  swap              1.00   1.09
!  ldstub            0.39   0.26
!  stb               0.95   0.99
!  sth               0.67   0.69
!  st                0.92   1.01
!  std               0.26   0.42
!  add               0.07   0.08
!  addcc             0.50   0.55
!  addx              0.32   0.30
!  addxcc            0.08   0.08
!  taddcc            0.14   0.22
!  taddcctv          0.25   0.34
!  sub               0.92   1.01
!  subcc             0.43   0.38
!  subx              1.17   1.19
!  subxcc            0.85   1.11
!  tsubcc            0.09   0.00
!  tsubcctv          0.19   0.26
!  mulscc            1.07   1.31
!  and               1.04   1.11
!  andcc             0.39   0.40
!  andn              1.01   1.33
!  andncc            0.91   0.87
!  or                0.59   0.75
!  orcc              0.87   0.75
!  orn               0.75   0.81
!  orncc             0.77   0.81
!  xor               1.14   1.21
!  xorcc             1.01   0.77
!  xnor              0.26   0.22
!  xnorcc            0.54   0.53
!  sll               1.07   1.01
!  srl               0.81   0.93
!  sra               0.03   0.00
!  unimp             0.11   0.16
!  umul              0.55   0.59
!  smul              1.20   1.27
!  udiv              1.00   1.52
!  sdiv              0.09   0.02
!  umulcc            1.11   0.89
!  smulcc            0.41   0.61
!  udivcc            1.17   1.31
!  sdivcc            0.59   0.42
!  rdy               0.76   0.77
!  wry               0.42   0.57
!  bicc              2.30   2.06
!  sethi             1.29   1.19
!  jmpl              1.02   0.97
!  call              1.17   0.81
!  ticc              0.00   0.00
!  flush             0.94   0.99
!  save              0.81   0.61
!  restore           0.49   0.00
!  stbar             1.28   1.23
!  ldf               0.81   0.97
!  lddf              1.14   1.38
!  stf               1.12   1.29
!  stdf              0.15   0.20
!  fadds             1.04   1.07
!  fsubs             0.63   0.55
!  fmuls             0.19   0.26
!  fdivs             0.06   0.02
!  faddd             0.39   0.53
!  fsubd             0.44   0.51
!  fmuld             0.01   0.00
!  fdivd             0.62   0.69
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.64   0.53
!  fdmulq            0.00   0.00
!  fitos             0.38   0.53
!  fitod             0.89   0.93
!  fitoq             0.00   0.00
!  fstoi             1.03   1.19
!  fstod             1.21   0.89
!  fstoq             0.00   0.00
!  fdtoi             0.92   1.07
!  fdtos             0.69   0.85
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.40   0.36
!  fnegs             0.86   0.85
!  fabss             0.44   0.47
!  fsqrts            1.45   1.46
!  fsqrtd            2.22   2.27
!  fsqrtq            0.00   0.00
!  fcmps             1.20   1.40
!  fcmpd             0.45   0.36
!  fcmpq             0.00   0.00
!  fcmpes            0.02   0.02
!  fcmped            0.51   0.28
!  fcmpeq            0.00   0.00
!  fbfcc             2.59   2.14
!  ldfsr             0.15   0.00
!  stfsr             0.06   0.06
!  loop              0.18   0.10
!  offset            0.04   0.02
!  area              0.10   0.16
!  target            0.21   0.36
!  goto              0.19   0.18
!  sigsegv           0.05   0.04
!  sigbus            0.16   0.20
!  imodify           0.00   0.00
!  ldfsr_offset      0.19   0.00
!  fpattern          0.30   0.34
!  lbranch           0.02   0.02
!  shmld             2.52   2.81
!  shmst             3.57   3.66
!  shmpf             0.80   0.85
!  shmswap           0.26   0.32
!  shmblkld          1.11   0.12
!  shmblkst          1.15   0.02
!  shmblkchk         0.23   0.30
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
!  casa              0.23   0.22
!  rdasi             0.14   0.14
!  wrasi             0.07   0.06
!  bpcc              2.76   2.12
!  fbpfcc            0.96   1.07
!  fmovscc           0.12   0.10
!  fmovdcc           0.20   0.20
!  fmovqcc           0.00   0.00
!  movcc             0.02   0.00
!  flushw            0.25   0.18
!  membar            0.06   0.04
!  prefetch          0.53   0.51
!  rdpc              0.12   0.20
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.09   0.08
!  lddfa             0.14   0.14
!  ldqfa             0.00   0.00
!  ldsba             0.21   0.18
!  ldsha             0.18   0.20
!  lduba             0.19   0.28
!  lduha             0.02   0.00
!  lda               0.15   0.12
!  ldda              0.04   0.00
!  ldstuba           0.24   0.28
!  prefetcha         1.00   1.01
!  stfa              0.10   0.04
!  stdfa             0.05   0.02
!  stqfa             0.00   0.00
!  stba              0.17   0.24
!  stha              0.03   0.02
!  sta               0.13   0.22
!  stda              0.18   0.30
!  swapa             0.02   0.02
!  fmovd             0.05   0.04
!  fnegd             0.22   0.18
!  fabsd             0.09   0.04
!  fstox             0.19   0.18
!  fdtox             0.07   0.06
!  fxtos             0.10   0.06
!  fxtod             0.20   0.22
!  lds               0.14   0.20
!  ldsa              0.22   0.32
!  ldx               0.21   0.28
!  ldxa              0.05   0.06
!  nofault           0.02   0.04
!  rdgsr             0.04   0.06
!  wrgsr             0.11   0.10
!  fpadd16           0.09   0.06
!  fpadd16s          0.15   0.26
!  fpadd32           0.09   0.04
!  fpadd32s          0.22   0.26
!  fpsub16           0.18   0.18
!  fpsub16s          0.21   0.26
!  fpsub32           0.09   0.12
!  fpsub32s          0.24   0.18
!  fpack16           0.25   0.20
!  fpack32           0.00   0.00
!  fpackfix          0.06   0.06
!  fexpand           0.04   0.04
!  fpmerge           0.19   0.12
!  fmul8x16          0.16   0.12
!  fmul8x16au        0.21   0.18
!  fmul8x16al        0.09   0.14
!  fmul8sux16        0.10   0.22
!  fmul8ulx16        0.20   0.28
!  fmuld8sux16       0.16   0.24
!  fmuld8ulx16       0.22   0.12
!  alignaddr         0.11   0.14
!  alignaddrl        0.10   0.02
!  faligndata        0.09   0.06
!  fzero             0.14   0.14
!  fzeros            0.05   0.12
!  fone              0.07   0.14
!  fones             0.22   0.28
!  fsrc1             0.25   0.26
!  fsrc1s            0.17   0.20
!  fsrc2             0.07   0.10
!  fsrc2s            0.02   0.02
!  fnot1             0.11   0.20
!  fnot1s            0.19   0.16
!  fnot2             0.25   0.36
!  fnot2s            0.23   0.30
!  for               0.10   0.04
!  fors              0.01   0.00
!  fnor              0.11   0.12
!  fnors             0.17   0.10
!  fand              0.24   0.14
!  fands             0.17   0.08
!  fnand             0.06   0.10
!  fnands            0.22   0.26
!  fxor              0.03   0.04
!  fxors             0.09   0.10
!  fxnor             0.16   0.26
!  fxnors            0.06   0.04
!  fornot1           0.16   0.14
!  fornot1s          0.00   0.00
!  fornot2           0.23   0.16
!  fornot2s          0.20   0.18
!  fandnot1          0.18   0.16
!  fandnot1s         0.21   0.16
!  fandnot2          0.25   0.22
!  fandnot2s         0.24   0.34
!  fcmpgt16          0.12   0.06
!  fcmpgt32          0.09   0.16
!  fcmple16          0.01   0.02
!  fcmple32          0.04   0.08
!  fcmpne16          0.00   0.00
!  fcmpne32          0.17   0.16
!  fcmpeq16          0.24   0.32
!  fcmpeq32          0.10   0.22
!  edge8             0.20   0.34
!  edge8l            0.15   0.22
!  edge16            0.08   0.06
!  edge16l           0.07   0.10
!  edge32            0.08   0.12
!  edge32l           0.16   0.14
!  pdist             0.16   0.26
!  partial_st8       0.22   0.30
!  partial_st16      0.17   0.18
!  partial_st32      0.07   0.06
!  short_st8         0.03   0.04
!  short_st16        0.03   0.02
!  short_ld8         0.06   0.04
!  short_ld16        0.12   0.06
!  blkld             0.05   0.00
!  blkst             0.07   0.00
!  blkld_offset      0.19   0.00
!  blkst_offset      0.21   0.00
!  blk_check         0.10   0.12
!  casxa             0.24   0.16
!  rdccr             0.22   0.22
!  rdfprs            0.21   0.16
!  wrccr             0.12   0.08
!  popc              0.24   0.20
!  wrfprs            0.07   0.10
!  stx               0.02   0.06
!  stxa              0.22   0.18
!  cflush            0.00   0.00
!  array8            0.22   0.22
!  array16           0.13   0.08
!  array32           0.13   0.16
!  edge8n            0.12   0.08
!  edge8ln           0.00   0.00
!  edge16n           0.16   0.20
!  edge16ln          0.06   0.08
!  edge32n           0.14   0.10
!  edge32ln          0.25   0.32
!  bmask             0.05   0.10
!  bshuffle          0.00   0.00
!  siam              0.02   0.00
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
KDATA_MODULE(t0_module_offset_table, 0x2f0f6000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0xfffffff0
	.word	0xffffffe0
	.word	0xffffffe8
	.word	0x00000008
	.word	0x00000010
	.word	0x00000018
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

KDATA_MODULE(t0_module_data_in_regs, 0x507c8000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xe5510e2f          ! %f0
	.word	0x1d3b705b          ! %f1
	.word	0x79e2a0da          ! %f2
	.word	0xa3ca03c4          ! %f3
	.word	0x4e6473ee          ! %f4
	.word	0x82908e3b          ! %f5
	.word	0x8a37d0e2          ! %f6
	.word	0xa3ac209f          ! %f7
	.word	0x92459bb0          ! %f8
	.word	0x38ccc67c          ! %f9
	.word	0xaa49df37          ! %f10
	.word	0x523ba798          ! %f11
	.word	0xc4f7edd7          ! %f12
	.word	0x82ea48e4          ! %f13
	.word	0x1e9e0460          ! %f14
	.word	0x30d9762b          ! %f15
	.word	0xe20c6093          ! %f16
	.word	0xa16c4043          ! %f17
	.word	0xc18a91c2          ! %f18
	.word	0x70bbc787          ! %f19
	.word	0x66c7c153          ! %f20
	.word	0x299a50db          ! %f21
	.word	0xd7499a32          ! %f22
	.word	0xc2c4f395          ! %f23
	.word	0x4fdfa178          ! %f24
	.word	0x198b18fb          ! %f25
	.word	0xd5350fcc          ! %f26
	.word	0x86589a37          ! %f27
	.word	0x69ccda4b          ! %f28
	.word	0x6ac397ec          ! %f29
	.word	0x98466b02          ! %f30
	.word	0x0c41bed4          ! %f31
	.word	0x5f2ddc31          ! %f32
	.word	0xa12b9f11          ! %f33
	.word	0x66012ef7          ! %f34
	.word	0x82e09814          ! %f35
	.word	0xf1a23d1d          ! %f36
	.word	0x2d75b149          ! %f37
	.word	0xcd90df0d          ! %f38
	.word	0x76ff17e8          ! %f39
	.word	0xa22c3a45          ! %f40
	.word	0x631af498          ! %f41
	.word	0xba5839bc          ! %f42
	.word	0x7d176fcc          ! %f43
	.word	0x05bc2118          ! %f44
	.word	0x10f21a05          ! %f45
	.word	0x7eb8cca5          ! %f46
	.word	0xf1c81550          ! %f47
	.word	0x9454d36e          ! %f48
	.word	0x7a725fc5          ! %f49
	.word	0x5ab735e6          ! %f50
	.word	0xf1e50ad4          ! %f51
	.word	0xdc77db01          ! %f52
	.word	0xdd221198          ! %f53
	.word	0xa791a6af          ! %f54
	.word	0xdb4e7092          ! %f55
	.word	0x4c7ac01b          ! %f56
	.word	0xdbc22b72          ! %f57
	.word	0xd4a37b15          ! %f58
	.word	0x43b0a1e0          ! %f59
	.word	0xcf4e9790          ! %f60
	.word	0xfdbf025e          ! %f61
	.word	0x4c49fb26          ! %f62
	.word	0x49d262b6          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x38        ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x301d0338          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x2ee91840          ! %o0
	.word	0xfdd359ed          ! %o1
	.word	0xb92e8f24          ! %o2
	.word	0x18821e3d          ! %o3
	.word	0x3b71124b          ! %o4
	.word	0xf05ab269          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x155dfbef          ! %l0
	.word	0xf788179f          ! %l1
	.word	0x062b993d          ! %l2
	.word	0x2d59e16e          ! %l3
	.word	0xcbb4e5f4          ! %l4
	.word	0x15ef7a18          ! %l5
	.word	0x70844196          ! %l6
	.word	0xe83990cb          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffff1          ! %i2 (byte offset)
	.word	0xfffffffc          ! %i3 (halfword offset)
	.word	0xffffffe8          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xb24af9a1          ! %y
	.word	0x00000001          ! %icc (nzvc)
	.word	0x00000e75          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x553f4000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xa177cc75
	.word	0x503b6fea
	.word	0x70ec8790
	.word	0xa06aed0c
	.word	0xcdf52a12
	.word	0xf5a5fe1b
	.word	0x0bee031c
	.word	0x6829242f
	.word	0xea568164
	.word	0xb86a4612
	.word	0x47f16cc9
	.word	0x764c6283
	.word	0x61080ed6
	.word	0x80265231
	.word	0xff374319
	.word	0xbf583697
	.word	0x8bba493d
	.word	0xbf869b28
	.word	0xc1bc163b
	.word	0x9c229062
	.word	0xb029972c
	.word	0x83a7b4be
	.word	0x5fb72f7a
	.word	0x832345a8
	.word	0x1c1b8586
	.word	0x865f82d1
	.word	0xd017bbf7
	.word	0x160cf8a2
	.word	0x25e05353
	.word	0x88763a9b
	.word	0xf49d6e97
	.word	0xa6bb44dd
	.word	0xdc40e6d7
	.word	0x4a97b436
	.word	0x0584cd3e
	.word	0x20dc5661
	.word	0x6eae7fe0
	.word	0x0149d061
	.word	0x198e9d3c
	.word	0x337a4f16
	.word	0x7e0abb5f
	.word	0x11bcf684
	.word	0x7fad2307
	.word	0xf8eb1e63
	.word	0x1cb3bc3a
	.word	0x7f17eef1
	.word	0x9d19292a
	.word	0x6af3af18
	.word	0xe2e98d60
	.word	0x72309d6c
	.word	0x183c027d
	.word	0x06558f8d
	.word	0x105f111d
	.word	0x34b75fed
	.word	0x15fafb96
	.word	0xdacc780b
	.word	0xbe1a11af
	.word	0x5cf315a3
	.word	0xb6c3ef7f
	.word	0x44f3536a
	.word	0xf9eb4718
	.word	0x8c88123c
	.word	0x4a81f3a9
	.word	0xfcdeadfa
	.word	0xb0006635
	.word	0x5ba48163
	.word	0x899c4f1f
	.word	0x68b4aea6
	.word	0x449f8d0f
	.word	0xe690fe8a
	.word	0xa49130fe
	.word	0x0c68fe56
	.word	0x013ca070
	.word	0x0e4c64e9
	.word	0xfee0da24
	.word	0xf1454195
	.word	0x220e6eb9
	.word	0x31c61bc5
	.word	0xb4152e26
	.word	0x4f4d0874
	.word	0x9d52abf2
	.word	0xd4ba62f5
	.word	0x91fcdf87
	.word	0x1a1658ad
	.word	0x38cd1b23
	.word	0xf76863a1
	.word	0x70f0ab27
	.word	0x309e360a
	.word	0x4dff78e1
	.word	0x7792094d
	.word	0xe56c56f9
	.word	0x5632cd07
	.word	0xaf5cfb2b
	.word	0x9bb1e715
	.word	0x44ac67f9
	.word	0x300323b6
	.word	0x81957a76
	.word	0x5553ad39
	.word	0x2b9cc35c
	.word	0xd17e74e2
	.word	0xe9419805
	.word	0x0b3ff2dc
	.word	0xe373af08
	.word	0xd7ab9977
	.word	0x17fa757e
	.word	0x0ff45808
	.word	0x9517e546
	.word	0x43432420
	.word	0x517cd1ba
	.word	0xc8ed43f5
	.word	0xa327afb5
	.word	0xa0dd1332
	.word	0xcb209edc
	.word	0xf7d6c38b
	.word	0x55623d81
	.word	0x382d3cc8
	.word	0xfaeb65a4
	.word	0x540e4c24
	.word	0x4e93a8d5
	.word	0xed57d92e
	.word	0xc9150a05
	.word	0x79376695
	.word	0xd3375f8d
	.word	0xdc19cf82
	.word	0xb43bc4f4
	.word	0x2b41866e
	.word	0x6a0be330
	.word	0x0216a898
	.word	0xfefd6782
	.word	0xa15d9181
	.word	0xc40e141d
	.word	0x36584c1e
	.word	0x6a793b2c
	.word	0x4445dba1
	.word	0x7e017c03
	.word	0x3e2aec00
	.word	0x659f1372
	.word	0x69239aab
	.word	0x460e4b96
	.word	0xbd41c20d
	.word	0x5a6564a5
	.word	0xad8916ca
	.word	0x4354ff7f
	.word	0x9eb783da
	.word	0x59497405
	.word	0xd2a81af5
	.word	0x86e2e093
	.word	0x2047b0e6
	.word	0x9e19f50b
	.word	0x326069bc
	.word	0x7c71d347
	.word	0xff4c1efe
	.word	0xa83da802
	.word	0x103a3a44
	.word	0x29112a63
	.word	0x29dc68e3
	.word	0x19accddb
	.word	0x471d0190
	.word	0xdd7c70f6
	.word	0x6c232329
	.word	0x8bed8542
	.word	0xdad30c01
	.word	0x64c05f89
	.word	0xa4d6fb61
	.word	0xa6d064ec
	.word	0x366eab1f
	.word	0xa51d7097
	.word	0x4a04257a
t0_data_in_sp:
	.word	0x32abe732
	.word	0xd6adfb99
	.word	0xd41ac83c
	.word	0x4334bb64
	.word	0xa4aa7ae3
	.word	0x85c6878a
	.word	0x6eb3632b
	.word	0x0dccf2f5
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000010
	.word	0x00000014
	.word	0x00000014
	.word	0x00000000
	.word	t0_data_in_fp
	.word	0xcaabd0b3
	.word	0x55f57d27
	.word	0xbbe32904
	.word	0xb04fc9c0
	.word	0x889f9523
	.word	0xba958ca3
	.word	0x8b364b31
	.word	0xcfee1349
	.word	0xb734adc1
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
	.word   	0xbb5110f3	! [%fp - 0xc]
	.word   	0x6e105df0	! [%fp - 0x8]
	.word   	0x036d3f9d	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x98af7e83
	.word	0xc4f5f7ca
	.word	0x26e76db4
	.word	0x4eb057ab
	.word	0xf81517a0
	.word	0xd78bd96c
	.word	0xac8ad96c
	.word	0x07a2f1a8
	.word	0x4a9e4d9a
	.word	0xc798ca5f
	.word	0x32c8542c
	.word	0x7f243bdb
	.word	0x9af5cd7f
	.word	0xd4751462
	.word	0x7d2cdd0b
	.word	0xda1760b5
	.word	0x498cb16a
	.word	0xeb6d0a9e
	.word	0x9102d14e
	.word	0x100d9824
	.word	0x18055950
	.word	0x4faf6d1b
	.word	0xaa1c7cc5
	.word	0xf76f7a28
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x4cdf4000)
.seg "data"
t0_data_in_area0_start:
.skip 6336
t0_data_in_area0_begin:
	.word	0xef6c8bf8	! t0_data_in_area0-0x20
	.word	0x3bfa0f75	! t0_data_in_area0-0x1c
	.word	0xf50ccc75	! t0_data_in_area0-0x18
	.word	0x675066a5	! t0_data_in_area0-0x14
	.word	0xc5f5244b	! t0_data_in_area0-0x10
	.word	0x03ddb6ce	! t0_data_in_area0-0xc
	.word	0xe7660777	! t0_data_in_area0-0x8
	.word	0x4e70167b	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xe96acecd	! t0_data_in_area0+0x0
	.word	0x0a8d6306	! t0_data_in_area0+0x4
	.word	0x25b0b21f	! t0_data_in_area0+0x8
	.word	0x0a9ba9d3	! t0_data_in_area0+0xc
	.word	0x73d49b6b	! t0_data_in_area0+0x10
	.word	0xd3bc7729	! t0_data_in_area0+0x14
	.word	0x2d4aff5f	! t0_data_in_area0+0x18
	.word	0xbce0c7bb	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 1792
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x00e14000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x88086776	! t0_data_in_shm_area+0x0 (t0)
	.word	0x73527529	! t0_data_in_shm_area+0x4 (t0)
	.word	0x8083746d	! t0_data_in_shm_area+0x8 (t0)
	.word	0x131aa2f5	! t0_data_in_shm_area+0xc (t0)
	.word	0x207c63ef	! t0_data_in_shm_area+0x10 (t0)
	.word	0x99f240cc	! t0_data_in_shm_area+0x14 (t0)
	.word	0xd347a2a3	! t0_data_in_shm_area+0x18 (t0)
	.word	0x5f89f80c	! t0_data_in_shm_area+0x1c (t0)
	.word	0x3bb43c05	! t0_data_in_shm_area+0x20 (t0)
	.word	0x89be1de7	! t0_data_in_shm_area+0x24 (t0)
	.word	0xc8ea1ba7	! t0_data_in_shm_area+0x28 (t0)
	.word	0x88a658a7	! t0_data_in_shm_area+0x2c (t0)
	.word	0x4b7b9fdb	! t0_data_in_shm_area+0x30 (t0)
	.word	0xefa0ddcc	! t0_data_in_shm_area+0x34 (t0)
	.word	0xb61103cb	! t0_data_in_shm_area+0x38 (t0)
	.word	0x9f685821	! t0_data_in_shm_area+0x3c (t0)
	.word	0x46f8378d	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x34f7f000	! t0_data_in_shm_area+0x44
	.word	0xaf10e6b6	! t0_data_in_shm_area+0x48
	.word	0xd6316d58	! t0_data_in_shm_area+0x4c
	.word	0x27b94274	! t0_data_in_shm_area+0x50
	.word	0x93014a31	! t0_data_in_shm_area+0x54
	.word	0xf90db243	! t0_data_in_shm_area+0x58
	.word	0x4f6f9dc4	! t0_data_in_shm_area+0x5c
	.word	0xff8b66a9	! t0_data_in_shm_area+0x60
	.word	0x702b5b66	! t0_data_in_shm_area+0x64
	.word	0xe575fba9	! t0_data_in_shm_area+0x68
	.word	0x466845cc	! t0_data_in_shm_area+0x6c
	.word	0x0c3b74c8	! t0_data_in_shm_area+0x70
	.word	0x36947e78	! t0_data_in_shm_area+0x74
	.word	0xc20af2db	! t0_data_in_shm_area+0x78
	.word	0x7f769254	! t0_data_in_shm_area+0x7c
	.word	0x0fdb23f6	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x75ea9fc0	! t0_data_in_shm_area+0x84
	.word	0x0de9a830	! t0_data_in_shm_area+0x88
	.word	0x9cbf7f9a	! t0_data_in_shm_area+0x8c
	.word	0xdbc70a24	! t0_data_in_shm_area+0x90
	.word	0x48b30a11	! t0_data_in_shm_area+0x94
	.word	0xa4308846	! t0_data_in_shm_area+0x98
	.word	0xe2267142	! t0_data_in_shm_area+0x9c
	.word	0x0add5494	! t0_data_in_shm_area+0xa0
	.word	0x590d8ee8	! t0_data_in_shm_area+0xa4
	.word	0x41263224	! t0_data_in_shm_area+0xa8
	.word	0x6c6ab7ae	! t0_data_in_shm_area+0xac
	.word	0xc049049b	! t0_data_in_shm_area+0xb0
	.word	0xb2857de2	! t0_data_in_shm_area+0xb4
	.word	0x4d750b9e	! t0_data_in_shm_area+0xb8
	.word	0xc5079693	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x644a4000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xe5510e2f          ! %f0
	.word	0x1d3b705b          ! %f1
	.word	0x79e2a0da          ! %f2
	.word	0xa3ca03c4          ! %f3
	.word	0x4e6473ee          ! %f4
	.word	0x82908e3b          ! %f5
	.word	0x8a37d0e2          ! %f6
	.word	0xa3ac209f          ! %f7
	.word	0x92459bb0          ! %f8
	.word	0x38ccc67c          ! %f9
	.word	0xaa49df37          ! %f10
	.word	0x523ba798          ! %f11
	.word	0xc4f7edd7          ! %f12
	.word	0x82ea48e4          ! %f13
	.word	0x1e9e0460          ! %f14
	.word	0x30d9762b          ! %f15
	.word	0xe20c6093          ! %f16
	.word	0xa16c4043          ! %f17
	.word	0xc18a91c2          ! %f18
	.word	0x70bbc787          ! %f19
	.word	0x66c7c153          ! %f20
	.word	0x299a50db          ! %f21
	.word	0xd7499a32          ! %f22
	.word	0xc2c4f395          ! %f23
	.word	0x4fdfa178          ! %f24
	.word	0x198b18fb          ! %f25
	.word	0xd5350fcc          ! %f26
	.word	0x86589a37          ! %f27
	.word	0x69ccda4b          ! %f28
	.word	0x6ac397ec          ! %f29
	.word	0x98466b02          ! %f30
	.word	0x0c41bed4          ! %f31
	.word	0x5f2ddc31          ! %f32
	.word	0xa12b9f11          ! %f33
	.word	0x66012ef7          ! %f34
	.word	0x82e09814          ! %f35
	.word	0xf1a23d1d          ! %f36
	.word	0x2d75b149          ! %f37
	.word	0xcd90df0d          ! %f38
	.word	0x76ff17e8          ! %f39
	.word	0xa22c3a45          ! %f40
	.word	0x631af498          ! %f41
	.word	0xba5839bc          ! %f42
	.word	0x7d176fcc          ! %f43
	.word	0x05bc2118          ! %f44
	.word	0x10f21a05          ! %f45
	.word	0x7eb8cca5          ! %f46
	.word	0xf1c81550          ! %f47
	.word	0x9454d36e          ! %f48
	.word	0x7a725fc5          ! %f49
	.word	0x5ab735e6          ! %f50
	.word	0xf1e50ad4          ! %f51
	.word	0xdc77db01          ! %f52
	.word	0xdd221198          ! %f53
	.word	0xa791a6af          ! %f54
	.word	0xdb4e7092          ! %f55
	.word	0x4c7ac01b          ! %f56
	.word	0xdbc22b72          ! %f57
	.word	0xd4a37b15          ! %f58
	.word	0x43b0a1e0          ! %f59
	.word	0xcf4e9790          ! %f60
	.word	0xfdbf025e          ! %f61
	.word	0x4c49fb26          ! %f62
	.word	0x49d262b6          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x38        ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x301d0338          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x2ee91840          ! %o0
	.word	0xfdd359ed          ! %o1
	.word	0xb92e8f24          ! %o2
	.word	0x18821e3d          ! %o3
	.word	0x3b71124b          ! %o4
	.word	0xf05ab269          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x155dfbef          ! %l0
	.word	0xf788179f          ! %l1
	.word	0x062b993d          ! %l2
	.word	0x2d59e16e          ! %l3
	.word	0xcbb4e5f4          ! %l4
	.word	0x15ef7a18          ! %l5
	.word	0x70844196          ! %l6
	.word	0xe83990cb          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffff1          ! %i2 (byte offset)
	.word	0xfffffffc          ! %i3 (halfword offset)
	.word	0xffffffe8          ! %i4 (word offset)
	.word	0x00000018          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xb24af9a1          ! %y
	.word	0x00000001          ! %icc (nzvc)
	.word	0x00000e75          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x33612000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xa177cc75
	.word	0x503b6fea
	.word	0x70ec8790
	.word	0xa06aed0c
	.word	0xcdf52a12
	.word	0xf5a5fe1b
	.word	0x0bee031c
	.word	0x6829242f
	.word	0xea568164
	.word	0xb86a4612
	.word	0x47f16cc9
	.word	0x764c6283
	.word	0x61080ed6
	.word	0x80265231
	.word	0xff374319
	.word	0xbf583697
	.word	0x8bba493d
	.word	0xbf869b28
	.word	0xc1bc163b
	.word	0x9c229062
	.word	0xb029972c
	.word	0x83a7b4be
	.word	0x5fb72f7a
	.word	0x832345a8
	.word	0x1c1b8586
	.word	0x865f82d1
	.word	0xd017bbf7
	.word	0x160cf8a2
	.word	0x25e05353
	.word	0x88763a9b
	.word	0xf49d6e97
	.word	0xa6bb44dd
	.word	0xdc40e6d7
	.word	0x4a97b436
	.word	0x0584cd3e
	.word	0x20dc5661
	.word	0x6eae7fe0
	.word	0x0149d061
	.word	0x198e9d3c
	.word	0x337a4f16
	.word	0x7e0abb5f
	.word	0x11bcf684
	.word	0x7fad2307
	.word	0xf8eb1e63
	.word	0x1cb3bc3a
	.word	0x7f17eef1
	.word	0x9d19292a
	.word	0x6af3af18
	.word	0xe2e98d60
	.word	0x72309d6c
	.word	0x183c027d
	.word	0x06558f8d
	.word	0x105f111d
	.word	0x34b75fed
	.word	0x15fafb96
	.word	0xdacc780b
	.word	0xbe1a11af
	.word	0x5cf315a3
	.word	0xb6c3ef7f
	.word	0x44f3536a
	.word	0xf9eb4718
	.word	0x8c88123c
	.word	0x4a81f3a9
	.word	0xfcdeadfa
	.word	0xb0006635
	.word	0x5ba48163
	.word	0x899c4f1f
	.word	0x68b4aea6
	.word	0x449f8d0f
	.word	0xe690fe8a
	.word	0xa49130fe
	.word	0x0c68fe56
	.word	0x013ca070
	.word	0x0e4c64e9
	.word	0xfee0da24
	.word	0xf1454195
	.word	0x220e6eb9
	.word	0x31c61bc5
	.word	0xb4152e26
	.word	0x4f4d0874
	.word	0x9d52abf2
	.word	0xd4ba62f5
	.word	0x91fcdf87
	.word	0x1a1658ad
	.word	0x38cd1b23
	.word	0xf76863a1
	.word	0x70f0ab27
	.word	0x309e360a
	.word	0x4dff78e1
	.word	0x7792094d
	.word	0xe56c56f9
	.word	0x5632cd07
	.word	0xaf5cfb2b
	.word	0x9bb1e715
	.word	0x44ac67f9
	.word	0x300323b6
	.word	0x81957a76
	.word	0x5553ad39
	.word	0x2b9cc35c
	.word	0xd17e74e2
	.word	0xe9419805
	.word	0x0b3ff2dc
	.word	0xe373af08
	.word	0xd7ab9977
	.word	0x17fa757e
	.word	0x0ff45808
	.word	0x9517e546
	.word	0x43432420
	.word	0x517cd1ba
	.word	0xc8ed43f5
	.word	0xa327afb5
	.word	0xa0dd1332
	.word	0xcb209edc
	.word	0xf7d6c38b
	.word	0x55623d81
	.word	0x382d3cc8
	.word	0xfaeb65a4
	.word	0x540e4c24
	.word	0x4e93a8d5
	.word	0xed57d92e
	.word	0xc9150a05
	.word	0x79376695
	.word	0xd3375f8d
	.word	0xdc19cf82
	.word	0xb43bc4f4
	.word	0x2b41866e
	.word	0x6a0be330
	.word	0x0216a898
	.word	0xfefd6782
	.word	0xa15d9181
	.word	0xc40e141d
	.word	0x36584c1e
	.word	0x6a793b2c
	.word	0x4445dba1
	.word	0x7e017c03
	.word	0x3e2aec00
	.word	0x659f1372
	.word	0x69239aab
	.word	0x460e4b96
	.word	0xbd41c20d
	.word	0x5a6564a5
	.word	0xad8916ca
	.word	0x4354ff7f
	.word	0x9eb783da
	.word	0x59497405
	.word	0xd2a81af5
	.word	0x86e2e093
	.word	0x2047b0e6
	.word	0x9e19f50b
	.word	0x326069bc
	.word	0x7c71d347
	.word	0xff4c1efe
	.word	0xa83da802
	.word	0x103a3a44
	.word	0x29112a63
	.word	0x29dc68e3
	.word	0x19accddb
	.word	0x471d0190
	.word	0xdd7c70f6
	.word	0x6c232329
	.word	0x8bed8542
	.word	0xdad30c01
	.word	0x64c05f89
	.word	0xa4d6fb61
	.word	0xa6d064ec
	.word	0x366eab1f
	.word	0xa51d7097
	.word	0x4a04257a
t0_data_exp_sp:
	.word	0x32abe732
	.word	0xd6adfb99
	.word	0xd41ac83c
	.word	0x4334bb64
	.word	0xa4aa7ae3
	.word	0x85c6878a
	.word	0x6eb3632b
	.word	0x0dccf2f5
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000010
	.word	0x00000014
	.word	0x00000014
	.word	0x00000000
	.word	t0_data_exp_fp
	.word	0xcaabd0b3
	.word	0x55f57d27
	.word	0xbbe32904
	.word	0xb04fc9c0
	.word	0x889f9523
	.word	0xba958ca3
	.word	0x8b364b31
	.word	0xcfee1349
	.word	0xb734adc1
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
	.word   	0xbb5110f3	! [%fp - 0xc]
	.word   	0x6e105df0	! [%fp - 0x8]
	.word   	0x036d3f9d	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x98af7e83
	.word	0xc4f5f7ca
	.word	0x26e76db4
	.word	0x4eb057ab
	.word	0xf81517a0
	.word	0xd78bd96c
	.word	0xac8ad96c
	.word	0x07a2f1a8
	.word	0x4a9e4d9a
	.word	0xc798ca5f
	.word	0x32c8542c
	.word	0x7f243bdb
	.word	0x9af5cd7f
	.word	0xd4751462
	.word	0x7d2cdd0b
	.word	0xda1760b5
	.word	0x498cb16a
	.word	0xeb6d0a9e
	.word	0x9102d14e
	.word	0x100d9824
	.word	0x18055950
	.word	0x4faf6d1b
	.word	0xaa1c7cc5
	.word	0xf76f7a28
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x48a96000)
.seg "data"
t0_data_exp_area0_start:
.skip 6336
t0_data_exp_area0_begin:
	.word	0xef6c8bf8	! t0_data_exp_area0-0x20
	.word	0x3bfa0f75	! t0_data_exp_area0-0x1c
	.word	0xf50ccc75	! t0_data_exp_area0-0x18
	.word	0x675066a5	! t0_data_exp_area0-0x14
	.word	0xc5f5244b	! t0_data_exp_area0-0x10
	.word	0x03ddb6ce	! t0_data_exp_area0-0xc
	.word	0xe7660777	! t0_data_exp_area0-0x8
	.word	0x4e70167b	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xe96acecd	! t0_data_exp_area0+0x0
	.word	0x0a8d6306	! t0_data_exp_area0+0x4
	.word	0x25b0b21f	! t0_data_exp_area0+0x8
	.word	0x0a9ba9d3	! t0_data_exp_area0+0xc
	.word	0x73d49b6b	! t0_data_exp_area0+0x10
	.word	0xd3bc7729	! t0_data_exp_area0+0x14
	.word	0x2d4aff5f	! t0_data_exp_area0+0x18
	.word	0xbce0c7bb	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 1792
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x2bb60000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x88086776	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x73527529	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x8083746d	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x131aa2f5	! t0_data_exp_shm_area+0xc (t0)
	.word	0x207c63ef	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x99f240cc	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xd347a2a3	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x5f89f80c	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x3bb43c05	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x89be1de7	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xc8ea1ba7	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x88a658a7	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x4b7b9fdb	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xefa0ddcc	! t0_data_exp_shm_area+0x34 (t0)
	.word	0xb61103cb	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x9f685821	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x46f8378d	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x34f7f000	! t0_data_exp_shm_area+0x44
	.word	0xaf10e6b6	! t0_data_exp_shm_area+0x48
	.word	0xd6316d58	! t0_data_exp_shm_area+0x4c
	.word	0x27b94274	! t0_data_exp_shm_area+0x50
	.word	0x93014a31	! t0_data_exp_shm_area+0x54
	.word	0xf90db243	! t0_data_exp_shm_area+0x58
	.word	0x4f6f9dc4	! t0_data_exp_shm_area+0x5c
	.word	0xff8b66a9	! t0_data_exp_shm_area+0x60
	.word	0x702b5b66	! t0_data_exp_shm_area+0x64
	.word	0xe575fba9	! t0_data_exp_shm_area+0x68
	.word	0x466845cc	! t0_data_exp_shm_area+0x6c
	.word	0x0c3b74c8	! t0_data_exp_shm_area+0x70
	.word	0x36947e78	! t0_data_exp_shm_area+0x74
	.word	0xc20af2db	! t0_data_exp_shm_area+0x78
	.word	0x7f769254	! t0_data_exp_shm_area+0x7c
	.word	0x0fdb23f6	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x75ea9fc0	! t0_data_exp_shm_area+0x84
	.word	0x0de9a830	! t0_data_exp_shm_area+0x88
	.word	0x9cbf7f9a	! t0_data_exp_shm_area+0x8c
	.word	0xdbc70a24	! t0_data_exp_shm_area+0x90
	.word	0x48b30a11	! t0_data_exp_shm_area+0x94
	.word	0xa4308846	! t0_data_exp_shm_area+0x98
	.word	0xe2267142	! t0_data_exp_shm_area+0x9c
	.word	0x0add5494	! t0_data_exp_shm_area+0xa0
	.word	0x590d8ee8	! t0_data_exp_shm_area+0xa4
	.word	0x41263224	! t0_data_exp_shm_area+0xa8
	.word	0x6c6ab7ae	! t0_data_exp_shm_area+0xac
	.word	0xc049049b	! t0_data_exp_shm_area+0xb0
	.word	0xb2857de2	! t0_data_exp_shm_area+0xb4
	.word	0x4d750b9e	! t0_data_exp_shm_area+0xb8
	.word	0xc5079693	! t0_data_exp_shm_area+0xbc
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



