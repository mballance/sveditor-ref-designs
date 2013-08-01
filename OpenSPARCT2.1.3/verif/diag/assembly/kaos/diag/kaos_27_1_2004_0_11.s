/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_27_1_2004_0_11.s
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
#define T0_KAOS_SEED          d1e992b1a453
#define T0_KAOS_ICOUNT        2513
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    8128
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2515

#define T0_KAOS_BOOT_VA                  0x09f0c000
#define T0_KAOS_BOOT_PA                  0x00000000002b4000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x35744000
#define T0_KAOS_STARTUP_PA               0x0000000002f56000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x1ed64000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004d84000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x7a70e000
#define T0_KAOS_DONE_PA                  0x0000000007d3e000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x7a62a000
#define T0_KAOS_KTBL_PA                  0x00000000089d6000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x7a2e0000
#define T0_KAOS_SUBR0_PA                 0x000000000a85e000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x7a7c0000
#define T0_KAOS_SUBR1_PA                 0x000000000d4b8000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x7a66c000
#define T0_KAOS_SUBR2_PA                 0x000000000fb68000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x24306000
#define T0_KAOS_SUBR3_PA                 0x0000000011a6a000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x4a4c4000
#define T0_KAOS_EXP_REGS_PA              0x0000000013e50000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x7852e000
#define T0_KAOS_RUN_REGS_PA              0x0000000015264000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x03da2000
#define T0_KAOS_EXP_STACK_PA             0x000000001664c000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x6beb4000
#define T0_KAOS_RUN_STACK_PA             0x0000000019efa000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x193d2000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a278000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x35612000
#define T0_KAOS_RUN_AREA0_PA             0x000000001db14000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x70470000
#define T0_KAOS_EXP_SHM_AREA_PA          0x00000000011c8000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x721e6000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000aaa000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xa7adec04
#define T0_KAOS_RANVAL_01     0x37f49996
#define T0_KAOS_RANVAL_02     0x69437043
#define T0_KAOS_RANVAL_03     0xc25eaef5
#define T0_KAOS_RANVAL_04     0xb3d47f5e
#define T0_KAOS_RANVAL_05     0x50305362
#define T0_KAOS_RANVAL_06     0x7a1d95e4
#define T0_KAOS_RANVAL_07     0xbbe235a2
#define T0_KAOS_RANVAL_08     0x5855e105
#define T0_KAOS_RANVAL_09     0xecd97c2b
#define T0_KAOS_RANVAL_0a     0x258aac33
#define T0_KAOS_RANVAL_0b     0x9434a8d1
#define T0_KAOS_RANVAL_0c     0x6b63dcbf
#define T0_KAOS_RANVAL_0d     0x3f05f216
#define T0_KAOS_RANVAL_0e     0x27ea8f46
#define T0_KAOS_RANVAL_0f     0x37eafbde
#define T0_KAOS_RANVAL_10     0x44e21122
#define T0_KAOS_RANVAL_11     0xe58aa294
#define T0_KAOS_RANVAL_12     0x7420a04a
#define T0_KAOS_RANVAL_13     0xed0896fa
#define T0_KAOS_RANVAL_14     0xb1f0a636
#define T0_KAOS_RANVAL_15     0xd652a63f
#define T0_KAOS_RANVAL_16     0x501b16ca
#define T0_KAOS_RANVAL_17     0xee50091a
#define T0_KAOS_RANVAL_18     0x3b194a58
#define T0_KAOS_RANVAL_19     0x84ebc5ea
#define T0_KAOS_RANVAL_1a     0x04a7a230
#define T0_KAOS_RANVAL_1b     0xaf986532
#define T0_KAOS_RANVAL_1c     0xf2549960
#define T0_KAOS_RANVAL_1d     0xc2adbcf2
#define T0_KAOS_RANVAL_1e     0x91321f8c
#define T0_KAOS_RANVAL_1f     0x45febea2
#define T0_KAOS_RANVAL_20     0x98dc5206
#define T0_KAOS_RANVAL_21     0xa562ccda
#define T0_KAOS_RANVAL_22     0xba926794
#define T0_KAOS_RANVAL_23     0x004e78f0
#define T0_KAOS_RANVAL_24     0xcd20fd81
#define T0_KAOS_RANVAL_25     0x90ad7617
#define T0_KAOS_RANVAL_26     0xaada78eb
#define T0_KAOS_RANVAL_27     0x9a725eb8
#define T0_KAOS_RANVAL_28     0x4d7fed70
#define T0_KAOS_RANVAL_29     0xe5d06a27
#define T0_KAOS_RANVAL_2a     0xef6682a5
#define T0_KAOS_RANVAL_2b     0xfd6bb3e0
#define T0_KAOS_RANVAL_2c     0x8ec0b3fd
#define T0_KAOS_RANVAL_2d     0xca3b0ae7
#define T0_KAOS_RANVAL_2e     0x7684930b
#define T0_KAOS_RANVAL_2f     0xfb6bb70f
#define T0_KAOS_RANVAL_30     0xac2f7a40
#define T0_KAOS_RANVAL_31     0x688e0b26
#define T0_KAOS_RANVAL_32     0xc721ee9a
#define T0_KAOS_RANVAL_33     0x707f465f
#define T0_KAOS_RANVAL_34     0x749bd8e0
#define T0_KAOS_RANVAL_35     0x5ef10474
#define T0_KAOS_RANVAL_36     0xd7485351
#define T0_KAOS_RANVAL_37     0x1b039b50
#define T0_KAOS_RANVAL_38     0x51da1700
#define T0_KAOS_RANVAL_39     0x21cb1640
#define T0_KAOS_RANVAL_3a     0xf215ac2c
#define T0_KAOS_RANVAL_3b     0x07165200
#define T0_KAOS_RANVAL_3c     0x69def357
#define T0_KAOS_RANVAL_3d     0xb07de221
#define T0_KAOS_RANVAL_3e     0x1f7cf8eb
#define T0_KAOS_RANVAL_3f     0xaca22f98
#define T0_KAOS_RANVAL_40     0x6f6c5ba0
#define T0_KAOS_RANVAL_41     0x63e37973
#define T0_KAOS_RANVAL_42     0x8fc76e17
#define T0_KAOS_RANVAL_43     0xb3cd5c09
#define T0_KAOS_RANVAL_44     0x96c7b635
#define T0_KAOS_RANVAL_45     0x01451026
#define T0_KAOS_RANVAL_46     0x06b91146
#define T0_KAOS_RANVAL_47     0x7ea502f8
#define T0_KAOS_RANVAL_48     0x5f58a1f6
#define T0_KAOS_RANVAL_49     0xd18988d2
#define T0_KAOS_RANVAL_4a     0x06ac559d
#define T0_KAOS_RANVAL_4b     0x142d8ff6
#define T0_KAOS_RANVAL_4c     0xd799506f
#define T0_KAOS_RANVAL_4d     0xd0b82e0d
#define T0_KAOS_RANVAL_4e     0x2f2c7c96
#define T0_KAOS_RANVAL_4f     0x47bdf9f4
#define T0_KAOS_RANVAL_50     0x8bafde39
#define T0_KAOS_RANVAL_51     0x3edd2d00
#define T0_KAOS_RANVAL_52     0x8ccebf02
#define T0_KAOS_RANVAL_53     0x1affd1f5
#define T0_KAOS_RANVAL_54     0xf29a4da0
#define T0_KAOS_RANVAL_55     0xe622a538
#define T0_KAOS_RANVAL_56     0x65868251
#define T0_KAOS_RANVAL_57     0x78550905
#define T0_KAOS_RANVAL_58     0x504d0786
#define T0_KAOS_RANVAL_59     0x53ca61b9
#define T0_KAOS_RANVAL_5a     0xcdb11e11
#define T0_KAOS_RANVAL_5b     0xc9ffa169
#define T0_KAOS_RANVAL_5c     0x2ebe0686
#define T0_KAOS_RANVAL_5d     0x67e18f59
#define T0_KAOS_RANVAL_5e     0x3ad9f5b4
#define T0_KAOS_RANVAL_5f     0x5f76bf17
#define T0_KAOS_RANVAL_60     0xb2d5105c
#define T0_KAOS_RANVAL_61     0xf349044a
#define T0_KAOS_RANVAL_62     0x91ffea95
#define T0_KAOS_RANVAL_63     0x7917cb68
#define T0_KAOS_RANVAL_64     0xbedba183
#define T0_KAOS_RANVAL_65     0x6241ecf7
#define T0_KAOS_RANVAL_66     0x54316a3d
#define T0_KAOS_RANVAL_67     0x9a19a00b
#define T0_KAOS_RANVAL_68     0x808d6f1f
#define T0_KAOS_RANVAL_69     0x8457f214
#define T0_KAOS_RANVAL_6a     0x8de49ce1
#define T0_KAOS_RANVAL_6b     0x0492ed3d
#define T0_KAOS_RANVAL_6c     0x4f94a31d
#define T0_KAOS_RANVAL_6d     0x8e7f2bf0
#define T0_KAOS_RANVAL_6e     0xcfc5782f
#define T0_KAOS_RANVAL_6f     0x12c44f36
#define T0_KAOS_RANVAL_70     0xa04b3698
#define T0_KAOS_RANVAL_71     0x3acd770d
#define T0_KAOS_RANVAL_72     0x830bba49
#define T0_KAOS_RANVAL_73     0x3ee9c6e6
#define T0_KAOS_RANVAL_74     0xe84d0e7e
#define T0_KAOS_RANVAL_75     0xff9bfdf1
#define T0_KAOS_RANVAL_76     0x6c071111
#define T0_KAOS_RANVAL_77     0xcede89e1
#define T0_KAOS_RANVAL_78     0x2cfcbe73
#define T0_KAOS_RANVAL_79     0x67570c3e
#define T0_KAOS_RANVAL_7a     0xb3aff1a7
#define T0_KAOS_RANVAL_7b     0x2e195d96
#define T0_KAOS_RANVAL_7c     0x39d715f4
#define T0_KAOS_RANVAL_7d     0x980f7f00
#define T0_KAOS_RANVAL_7e     0xb0efe42f
#define T0_KAOS_RANVAL_7f     0x6636f1c7
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
!    areaoffset     8128
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2515
!    code           7a62a000
!    entry          7a62a000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d1e992b1a453
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

KTEXT_MODULE(t0_module_ktbl, 0x7a62a000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xd83e401d	! t0_kref+0x0:   	std	%o4, [%i1 + %i5]
	.word	0xd220a010	! t0_kref+0x4:   	st	%o1, [%g2 + 0x10]
	.word	0x981d7ff9	! t0_kref+0x8:   	xor	%l5, -0x7, %o4
	.word	0xd24e0000	! t0_kref+0xc:   	ldsb	[%i0], %o1
	.word	0x98fb7937	! t0_kref+0x10:   	sdivcc	%o5, -0x6c9, %o4
	.word	0x9740c000	! t0_kref+0x14:   	mov	%asi, %o3
	.word	0xa3a01a58	! t0_kref+0x18:   	fdtoi	%f24, %f17
	.word	0x92582810	! t0_kref+0x1c:   	smul	%g0, 0x810, %o1
	.word	0x949832de	! t0_kref+0x20:   	xorcc	%g0, -0xd22, %o2
	.word	0x94d5ff4b	! t0_kref+0x24:   	umulcc	%l7, -0xb5, %o2
	.word	0x8143c000	! t0_kref+0x28:   	stbar
	.word	0x991d4000	! t0_kref+0x2c:   	tsubcctv	%l5, %g0, %o4
	.word	0xe4086048	! t0_kref+0x30:   	ldub	[%g1 + 0x48], %l2
	.word	0xa41ca00c	! t0_kref+0x34:   	xor	%l2, 0xc, %l2
	.word	0xe4286048	! t0_kref+0x38:   	stb	%l2, [%g1 + 0x48]
	.word	0x81d86048	! t0_kref+0x3c:   	flush	%g1 + 0x48
	.word	0x81af0a58	! t0_kref+0x40:   	fcmpd	%fcc0, %f28, %f24
	.word	0x98f68017	! t0_kref+0x44:   	udivcc	%i2, %l7, %o4
	.word	0xd8b01018	! t0_kref+0x48:   	stha	%o4, [%g0 + %i0]0x80
	.word	0xd40e6004	! t0_kref+0x4c:   	ldub	[%i1 + 4], %o2
	.word	0xbba01a58	! t0_kref+0x50:   	fdtoi	%f24, %f29
	.word	0x932d6008	! t0_kref+0x54:   	sll	%l5, 0x8, %o1
	.word	0xb1a01a3e	! t0_kref+0x58:   	fstoi	%f30, %f24
	.word	0x26800004	! t0_kref+0x5c:   	bl,a	_kref+0x6c
	.word	0xd83e6010	! t0_kref+0x60:   	std	%o4, [%i1 + 0x10]
	.word	0x94180009	! t0_kref+0x64:   	xor	%g0, %o1, %o2
	.word	0xb1a409d0	! t0_kref+0x68:   	fdivd	%f16, %f16, %f24
	.word	0xd24e0000	! t0_kref+0x6c:   	ldsb	[%i0], %o1
	.word	0xd6480018	! t0_kref+0x70:   	ldsb	[%g0 + %i0], %o3
2:	.word	0xb9a708d4	! t0_kref+0x74:   	fsubd	%f28, %f20, %f28
	.word	0xa9a48956	! t0_kref+0x78:   	fmuld	%f18, %f22, %f20
	.word	0x921b400a	! t0_kref+0x7c:   	xor	%o5, %o2, %o1
	.word	0xc030a00c	! t0_kref+0x80:   	clrh	[%g2 + 0xc]
	.word	0x941e8016	! t0_kref+0x84:   	xor	%i2, %l6, %o2
	.word	0xafa01899	! t0_kref+0x88:   	fitos	%f25, %f23
	.word	0x989b4008	! t0_kref+0x8c:   	xorcc	%o5, %o0, %o4
	.word	0x9875400d	! t0_kref+0x90:   	udiv	%l5, %o5, %o4
	.word	0xd4881019	! t0_kref+0x94:   	lduba	[%g0 + %i1]0x80, %o2
	.word	0x964238ee	! t0_kref+0x98:   	addc	%o0, -0x712, %o3
	.word	0xec363ffa	! t0_kref+0x9c:   	sth	%l6, [%i0 - 6]
	.word	0x92103731	! t0_kref+0xa0:   	mov	0xfffff731, %o1
	.word	0xd85f4018	! t0_kref+0xa4:   	ldx	[%i5 + %i0], %o4
	.word	0xada688de	! t0_kref+0xa8:   	fsubd	%f26, %f30, %f22
	.word	0x92fdc00a	! t0_kref+0xac:   	sdivcc	%l7, %o2, %o1
	.word	0x9426b335	! t0_kref+0xb0:   	sub	%i2, -0xccb, %o2
	.word	0x8182c000	! t0_kref+0xb4:   	wr	%o3, %g0, %y
	.word	0x9740c000	! t0_kref+0xb8:   	mov	%asi, %o3
	.word	0xe320a038	! t0_kref+0xbc:   	st	%f17, [%g2 + 0x38]
	.word	0xda30a03a	! t0_kref+0xc0:   	sth	%o5, [%g2 + 0x3a]
	.word	0xb1a01919	! t0_kref+0xc4:   	fitod	%f25, %f24
	.word	0x8143e075	! t0_kref+0xc8:   	membar	0x75
	.word	0xb3a018d2	! t0_kref+0xcc:   	fdtos	%f18, %f25
	.word	0x92236015	! t0_kref+0xd0:   	sub	%o5, 0x15, %o1
	.word	0x92a22e1f	! t0_kref+0xd4:   	subcc	%o0, 0xe1f, %o1
	.word	0xb1a689d4	! t0_kref+0xd8:   	fdivd	%f26, %f20, %f24
	.word	0xd6562004	! t0_kref+0xdc:   	ldsh	[%i0 + 4], %o3
	.word	0x973d4017	! t0_kref+0xe0:   	sra	%l5, %l7, %o3
	.word	0xd4263ffc	! t0_kref+0xe4:   	st	%o2, [%i0 - 4]
	call	SYM(t0_subr3)
	.word	0x96f3000a	! t0_kref+0xec:   	udivcc	%o4, %o2, %o3
	.word	0x965aec48	! t0_kref+0xf0:   	smul	%o3, 0xc48, %o3
	.word	0xd808a02d	! t0_kref+0xf4:   	ldub	[%g2 + 0x2d], %o4
	.word	0x81dfc01b	! t0_kref+0xf8:   	flush	%i7 + %i3
	.word	0xa5a01939	! t0_kref+0xfc:   	fstod	%f25, %f18
	.word	0x933e800d	! t0_kref+0x100:   	sra	%i2, %o5, %o1
	.word	0x989ab48f	! t0_kref+0x104:   	xorcc	%o2, -0xb71, %o4
	.word	0xd82e3fe2	! t0_kref+0x108:   	stb	%o4, [%i0 - 0x1e]
	.word	0xd850a00c	! t0_kref+0x10c:   	ldsh	[%g2 + 0xc], %o4
	.word	0x81830000	! t0_kref+0x110:   	wr	%o4, %g0, %y
	.word	0xd240a03c	! t0_kref+0x114:   	ldsw	[%g2 + 0x3c], %o1
	.word	0x8143e040	! t0_kref+0x118:   	membar	0x40
	.word	0xd20e4000	! t0_kref+0x11c:   	ldub	[%i1], %o1
	.word	0xd240a000	! t0_kref+0x120:   	ldsw	[%g2], %o1
	.word	0xd648a020	! t0_kref+0x124:   	ldsb	[%g2 + 0x20], %o3
	.word	0xbda4cd3e	! t0_kref+0x128:   	fsmuld	%f19, %f30, %f30
	.word	0x8610201e	! t0_kref+0x12c:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x130:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x134:   	be,a	_kref+0x194
	.word	0xd40e8019	! t0_kref+0x138:   	ldub	[%i2 + %i1], %o2
	.word	0x928ac00a	! t0_kref+0x13c:   	andcc	%o3, %o2, %o1
	.word	0xb1a00136	! t0_kref+0x140:   	fabss	%f22, %f24
	.word	0x930b000b	! t0_kref+0x144:   	tsubcc	%o4, %o3, %o1
	.word	0xd836401b	! t0_kref+0x148:   	sth	%o4, [%i1 + %i3]
	.word	0xd2264000	! t0_kref+0x14c:   	st	%o1, [%i1]
	.word	0xd84e2009	! t0_kref+0x150:   	ldsb	[%i0 + 9], %o4
	.word	0x9718000d	! t0_kref+0x154:   	tsubcctv	%g0, %o5, %o3
	.word	0xa7a01894	! t0_kref+0x158:   	fitos	%f20, %f19
	.word	0xa9a00535	! t0_kref+0x15c:   	fsqrts	%f21, %f20
	.word	0xe9be1808	! t0_kref+0x160:   	stda	%f20, [%i0 + %o0]0xc0
	.word	0xd8b81018	! t0_kref+0x164:   	stda	%o4, [%g0 + %i0]0x80
	.word	0x81824000	! t0_kref+0x168:   	wr	%o1, %g0, %y
	.word	0xa5a01899	! t0_kref+0x16c:   	fitos	%f25, %f18
	.word	0x94920017	! t0_kref+0x170:   	orcc	%o0, %l7, %o2
	.word	0x9fc00004	! t0_kref+0x174:   	call	%g0 + %g4
	.word	0x92db3987	! t0_kref+0x178:   	smulcc	%o4, -0x679, %o1
	.word	0x92fa3b6c	! t0_kref+0x17c:   	sdivcc	%o0, -0x494, %o1
	.word	0xfd00a034	! t0_kref+0x180:   	ld	[%g2 + 0x34], %f30
	.word	0xafa01a58	! t0_kref+0x184:   	fdtoi	%f24, %f23
	.word	0x96f5ed11	! t0_kref+0x188:   	udivcc	%l7, 0xd11, %o3
	.word	0x9655606a	! t0_kref+0x18c:   	umul	%l5, 0x6a, %o3
	.word	0x9216800a	! t0_kref+0x190:   	or	%i2, %o2, %o1
	.word	0x3f480005	! t0_kref+0x194:   	fbo,a,pt	%fcc0, _kref+0x1a8
	.word	0xda7e2008	! t0_kref+0x198:   	swap	[%i0 + 8], %o5
	.word	0x96ddc00c	! t0_kref+0x19c:   	smulcc	%l7, %o4, %o3
	.word	0x945b2e5f	! t0_kref+0x1a0:   	smul	%o4, 0xe5f, %o2
	.word	0x81d90017	! t0_kref+0x1a4:   	flush	%g4 + %l7
	.word	0xe1ee501a	! t0_kref+0x1a8:   	prefetcha	%i1 + %i2, 16
	.word	0xef00a038	! t0_kref+0x1ac:   	ld	[%g2 + 0x38], %f23
	.word	0x81ae8a5c	! t0_kref+0x1b0:   	fcmpd	%fcc0, %f26, %f28
	.word	0xe906401c	! t0_kref+0x1b4:   	ld	[%i1 + %i4], %f20
	.word	0xd440a00c	! t0_kref+0x1b8:   	ldsw	[%g2 + 0xc], %o2
	.word	0xd84e8018	! t0_kref+0x1bc:   	ldsb	[%i2 + %i0], %o4
	.word	0x94e5c015	! t0_kref+0x1c0:   	subccc	%l7, %l5, %o2
	.word	0x941365a8	! t0_kref+0x1c4:   	or	%o5, 0x5a8, %o2
	.word	0xfd3e6010	! t0_kref+0x1c8:   	std	%f30, [%i1 + 0x10]
	.word	0x94824015	! t0_kref+0x1cc:   	addcc	%o1, %l5, %o2
	.word	0xf007bfe0	! t0_kref+0x1d0:   	ld	[%fp - 0x20], %i0
	.word	0x27800006	! t0_kref+0x1d4:   	fbul,a	_kref+0x1ec
	.word	0xe56e3ff0	! t0_kref+0x1d8:   	prefetch	%i0 - 0x10, 18
	.word	0xea20a00c	! t0_kref+0x1dc:   	st	%l5, [%g2 + 0xc]
	.word	0xb1a01a5c	! t0_kref+0x1e0:   	fdtoi	%f28, %f24
	.word	0xee2e7fe6	! t0_kref+0x1e4:   	stb	%l7, [%i1 - 0x1a]
	.word	0xef00a034	! t0_kref+0x1e8:   	ld	[%g2 + 0x34], %f23
	.word	0xd608a034	! t0_kref+0x1ec:   	ldub	[%g2 + 0x34], %o3
	.word	0xa7a01a5c	! t0_kref+0x1f0:   	fdtoi	%f28, %f19
	.word	0xe678a008	! t0_kref+0x1f4:   	swap	[%g2 + 8], %l3
	.word	0xd40e6007	! t0_kref+0x1f8:   	ldub	[%i1 + 7], %o2
	.word	0xf5ee501c	! t0_kref+0x1fc:   	prefetcha	%i1 + %i4, 26
	.word	0x94dd8016	! t0_kref+0x200:   	smulcc	%l6, %l6, %o2
	.word	0x96154015	! t0_kref+0x204:   	or	%l5, %l5, %o3
	.word	0xd230a02e	! t0_kref+0x208:   	sth	%o1, [%g2 + 0x2e]
	.word	0x956124c6	! t0_kref+0x20c:   	movl	%fcc0, -0x33a, %o2
	.word	0xa3a018de	! t0_kref+0x210:   	fdtos	%f30, %f17
	.word	0xa1a488dc	! t0_kref+0x214:   	fsubd	%f18, %f28, %f16
	.word	0xd62e8018	! t0_kref+0x218:   	stb	%o3, [%i2 + %i0]
	.word	0xe1be5a1b	! t0_kref+0x21c:   	stda	%f16, [%i1 + %i3]0xd0
	.word	0x96230015	! t0_kref+0x220:   	sub	%o4, %l5, %o3
	.word	0x26800001	! t0_kref+0x224:   	bl,a	_kref+0x228
	.word	0x983a000b	! t0_kref+0x228:   	xnor	%o0, %o3, %o4
	.word	0xe96e2000	! t0_kref+0x22c:   	prefetch	%i0, 20
	.word	0xb5a01913	! t0_kref+0x230:   	fitod	%f19, %f26
	.word	0x9fc10000	! t0_kref+0x234:   	call	%g4
	.word	0xb3a01a52	! t0_kref+0x238:   	fdtoi	%f18, %f25
	.word	0x9de3bfa0	! t0_kref+0x23c:   	save	%sp, -0x60, %sp
	.word	0x95ee001d	! t0_kref+0x240:   	restore	%i0, %i5, %o2
	.word	0xd8480018	! t0_kref+0x244:   	ldsb	[%g0 + %i0], %o4
	.word	0xd836401b	! t0_kref+0x248:   	sth	%o4, [%i1 + %i3]
	.word	0xaba018de	! t0_kref+0x24c:   	fdtos	%f30, %f21
	.word	0x8610201d	! t0_kref+0x250:   	mov	0x1d, %g3
	.word	0x86a0e001	! t0_kref+0x254:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x258:   	be,a	_kref+0x2b8
	.word	0xd62e8019	! t0_kref+0x25c:   	stb	%o3, [%i2 + %i1]
	.word	0xc06e401a	! t0_kref+0x260:   	ldstub	[%i1 + %i2], %g0
	.word	0x9682c000	! t0_kref+0x264:   	addcc	%o3, %g0, %o3
	.word	0xd64e2009	! t0_kref+0x268:   	ldsb	[%i0 + 9], %o3
	.word	0xbda48d3e	! t0_kref+0x26c:   	fsmuld	%f18, %f30, %f30
	.word	0x96e6a406	! t0_kref+0x270:   	subccc	%i2, 0x406, %o3
	.word	0xada00050	! t0_kref+0x274:   	fmovd	%f16, %f22
	.word	0xb1a688d0	! t0_kref+0x278:   	fsubd	%f26, %f16, %f24
	.word	0x921a7f74	! t0_kref+0x27c:   	xor	%o1, -0x8c, %o1
	.word	0xa1a01939	! t0_kref+0x280:   	fstod	%f25, %f16
	.word	0x9732e00a	! t0_kref+0x284:   	srl	%o3, 0xa, %o3
	.word	0x9fc10000	! t0_kref+0x288:   	call	%g4
	.word	0xd850a012	! t0_kref+0x28c:   	ldsh	[%g2 + 0x12], %o4
	.word	0xd6a71019	! t0_kref+0x290:   	sta	%o3, [%i4 + %i1]0x80
	.word	0x34bffff0	! t0_kref+0x294:   	bg,a	_kref+0x254
	.word	0xe1f6500b	! t0_kref+0x298:   	casxa	[%i1]0x80, %o3, %l0
	.word	0x28bfffee	! t0_kref+0x29c:   	bleu,a	_kref+0x254
	.word	0xd44e3fff	! t0_kref+0x2a0:   	ldsb	[%i0 - 1], %o2
	.word	0xee2e7ff1	! t0_kref+0x2a4:   	stb	%l7, [%i1 - 0xf]
	.word	0xd810a01e	! t0_kref+0x2a8:   	lduh	[%g2 + 0x1e], %o4
	.word	0xd5e6500a	! t0_kref+0x2ac:   	casa	[%i1]0x80, %o2, %o2
	.word	0xada01a5e	! t0_kref+0x2b0:   	fdtoi	%f30, %f22
	.word	0x965b757d	! t0_kref+0x2b4:   	smul	%o5, -0xa83, %o3
	.word	0x2c800003	! t0_kref+0x2b8:   	bneg,a	_kref+0x2c4
	.word	0xd8ae101a	! t0_kref+0x2bc:   	stba	%o4, [%i0 + %i2]0x80
	.word	0x93418000	! t0_kref+0x2c0:   	mov	%fprs, %o1
	.word	0x92e3001a	! t0_kref+0x2c4:   	subccc	%o4, %i2, %o1
	.word	0x81858000	! t0_kref+0x2c8:   	wr	%l6, %g0, %y
	.word	0xf91e001d	! t0_kref+0x2cc:   	ldd	[%i0 + %i5], %f28
	.word	0xd610a03c	! t0_kref+0x2d0:   	lduh	[%g2 + 0x3c], %o3
	.word	0xd6280018	! t0_kref+0x2d4:   	stb	%o3, [%g0 + %i0]
	.word	0xf4280019	! t0_kref+0x2d8:   	stb	%i2, [%g0 + %i1]
	.word	0xef00a034	! t0_kref+0x2dc:   	ld	[%g2 + 0x34], %f23
	.word	0x925a4008	! t0_kref+0x2e0:   	smul	%o1, %o0, %o1
	.word	0xe3e61000	! t0_kref+0x2e4:   	casa	[%i0]0x80, %g0, %l1
	.word	0xda264000	! t0_kref+0x2e8:   	st	%o5, [%i1]
	.word	0x971d8015	! t0_kref+0x2ec:   	tsubcctv	%l6, %l5, %o3
	.word	0xf9801018	! t0_kref+0x2f0:   	lda	[%g0 + %i0]0x80, %f28
	.word	0x21800007	! t0_kref+0x2f4:   	fbn,a	_kref+0x310
	.word	0x98836298	! t0_kref+0x2f8:   	addcc	%o5, 0x298, %o4
	.word	0x8143c000	! t0_kref+0x2fc:   	stbar
	.word	0x92e5eb2f	! t0_kref+0x300:   	subccc	%l7, 0xb2f, %o1
	.word	0xd64e401a	! t0_kref+0x304:   	ldsb	[%i1 + %i2], %o3
	.word	0x93334016	! t0_kref+0x308:   	srl	%o5, %l6, %o1
	.word	0x92f83561	! t0_kref+0x30c:   	sdivcc	%g0, -0xa9f, %o1
	.word	0xb3a018d2	! t0_kref+0x310:   	fdtos	%f18, %f25
	.word	0x981ac00d	! t0_kref+0x314:   	xor	%o3, %o5, %o4
	.word	0xd610a030	! t0_kref+0x318:   	lduh	[%g2 + 0x30], %o3
	.word	0xf19e5a1c	! t0_kref+0x31c:   	ldda	[%i1 + %i4]0xd0, %f24
	.word	0x98fa400d	! t0_kref+0x320:   	sdivcc	%o1, %o5, %o4
	.word	0x953a800a	! t0_kref+0x324:   	sra	%o2, %o2, %o2
	.word	0xfd3e7fe0	! t0_kref+0x328:   	std	%f30, [%i1 - 0x20]
	.word	0xf320a028	! t0_kref+0x32c:   	st	%f25, [%g2 + 0x28]
	.word	0x94333990	! t0_kref+0x330:   	orn	%o4, -0x670, %o2
	.word	0x92aaf4b8	! t0_kref+0x334:   	andncc	%o3, -0xb48, %o1
	.word	0xee28a004	! t0_kref+0x338:   	stb	%l7, [%g2 + 4]
	.word	0xf42e6006	! t0_kref+0x33c:   	stb	%i2, [%i1 + 6]
	.word	0xe93e401d	! t0_kref+0x340:   	std	%f20, [%i1 + %i5]
	.word	0x8143c000	! t0_kref+0x344:   	stbar
	.word	0xb5a0191b	! t0_kref+0x348:   	fitod	%f27, %f26
	.word	0x2f800002	! t0_kref+0x34c:   	fbu,a	_kref+0x354
	.word	0x9633643f	! t0_kref+0x350:   	orn	%o5, 0x43f, %o3
	.word	0xd2480018	! t0_kref+0x354:   	ldsb	[%g0 + %i0], %o1
	.word	0xea263fec	! t0_kref+0x358:   	st	%l5, [%i0 - 0x14]
	.word	0xd428a006	! t0_kref+0x35c:   	stb	%o2, [%g2 + 6]
	.word	0x94f30016	! t0_kref+0x360:   	udivcc	%o4, %l6, %o2
	.word	0xada01919	! t0_kref+0x364:   	fitod	%f25, %f22
	.word	0x81dd8001	! t0_kref+0x368:   	flush	%l6 + %g1
	.word	0x963ac015	! t0_kref+0x36c:   	xnor	%o3, %l5, %o3
	sethi	%hi(2f), %o7
	.word	0xe40be38c	! t0_kref+0x374:   	ldub	[%o7 + 0x38c], %l2
	.word	0xa41ca00c	! t0_kref+0x378:   	xor	%l2, 0xc, %l2
	.word	0xe42be38c	! t0_kref+0x37c:   	stb	%l2, [%o7 + 0x38c]
	.word	0x81dbe38c	! t0_kref+0x380:   	flush	%o7 + 0x38c
	.word	0xd406401c	! t0_kref+0x384:   	ld	[%i1 + %i4], %o2
	.word	0xf9380019	! t0_kref+0x388:   	std	%f28, [%g0 + %i1]
2:	.word	0x98a26a8e	! t0_kref+0x38c:   	subcc	%o1, 0xa8e, %o4
	.word	0x81af0a5a	! t0_kref+0x390:   	fcmpd	%fcc0, %f28, %f26
	.word	0xe86e8019	! t0_kref+0x394:   	ldstub	[%i2 + %i1], %l4
	.word	0x8143c000	! t0_kref+0x398:   	stbar
	.word	0x96f6b006	! t0_kref+0x39c:   	udivcc	%i2, -0xffa, %o3
	.word	0x1925f0d8	! t0_kref+0x3a0:   	sethi	%hi(0x97c36000), %o4
	.word	0x964375b9	! t0_kref+0x3a4:   	addc	%o5, -0xa47, %o3
	.word	0x33800001	! t0_kref+0x3a8:   	fbe,a	_kref+0x3ac
	.word	0x92a23e71	! t0_kref+0x3ac:   	subcc	%o0, -0x18f, %o1
	.word	0xd26e7fee	! t0_kref+0x3b0:   	ldstub	[%i1 - 0x12], %o1
	.word	0xa9a78956	! t0_kref+0x3b4:   	fmuld	%f30, %f22, %f20
	.word	0xa7a01a52	! t0_kref+0x3b8:   	fdtoi	%f18, %f19
	.word	0xf500a01c	! t0_kref+0x3bc:   	ld	[%g2 + 0x1c], %f26
	.word	0xada01911	! t0_kref+0x3c0:   	fitod	%f17, %f22
	.word	0xf5180018	! t0_kref+0x3c4:   	ldd	[%g0 + %i0], %f26
	.word	0x20800001	! t0_kref+0x3c8:   	bn,a	_kref+0x3cc
	.word	0x92e54009	! t0_kref+0x3cc:   	subccc	%l5, %o1, %o1
	.word	0xe11e0000	! t0_kref+0x3d0:   	ldd	[%i0], %f16
	.word	0xd430a036	! t0_kref+0x3d4:   	sth	%o2, [%g2 + 0x36]
	.word	0xc1ee500a	! t0_kref+0x3d8:   	prefetcha	%i1 + %o2, 0
	.word	0x9652c016	! t0_kref+0x3dc:   	umul	%o3, %l6, %o3
	.word	0xe40863c8	! t0_kref+0x3e0:   	ldub	[%g1 + 0x3c8], %l2
	.word	0xa41ca00c	! t0_kref+0x3e4:   	xor	%l2, 0xc, %l2
	.word	0xe42863c8	! t0_kref+0x3e8:   	stb	%l2, [%g1 + 0x3c8]
	.word	0x81d863c8	! t0_kref+0x3ec:   	flush	%g1 + 0x3c8
	.word	0xb1a00138	! t0_kref+0x3f0:   	fabss	%f24, %f24
2:	.word	0x9658305c	! t0_kref+0x3f4:   	smul	%g0, -0xfa4, %o3
	.word	0xf99e1a1b	! t0_kref+0x3f8:   	ldda	[%i0 + %i3]0xd0, %f28
	.word	0x96b2a74c	! t0_kref+0x3fc:   	orncc	%o2, 0x74c, %o3
	.word	0xc76e3fe8	! t0_kref+0x400:   	prefetch	%i0 - 0x18, 3
	.word	0xd650a022	! t0_kref+0x404:   	ldsh	[%g2 + 0x22], %o3
	.word	0x94e5400d	! t0_kref+0x408:   	subccc	%l5, %o5, %o2
	.word	0x98fb4016	! t0_kref+0x40c:   	sdivcc	%o5, %l6, %o4
	.word	0xf51e2000	! t0_kref+0x410:   	ldd	[%i0], %f26
	.word	0x92f2000a	! t0_kref+0x414:   	udivcc	%o0, %o2, %o1
	.word	0x980b400d	! t0_kref+0x418:   	and	%o5, %o5, %o4
	.word	0x96baa303	! t0_kref+0x41c:   	xnorcc	%o2, 0x303, %o3
	.word	0x98c20017	! t0_kref+0x420:   	addccc	%o0, %l7, %o4
	.word	0x86102004	! t0_kref+0x424:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x428:   	bne,a	_kref+0x428
	.word	0x86a0e001	! t0_kref+0x42c:   	subcc	%g3, 1, %g3
	.word	0x96c24009	! t0_kref+0x430:   	addccc	%o1, %o1, %o3
	.word	0xa1a94054	! t0_kref+0x434:   	fmovdug	%fcc0, %f20, %f16
	.word	0x9262a2dc	! t0_kref+0x438:   	subc	%o2, 0x2dc, %o1
	.word	0xec364000	! t0_kref+0x43c:   	sth	%l6, [%i1]
	.word	0x9866800a	! t0_kref+0x440:   	subc	%i2, %o2, %o4
	.word	0x8143c000	! t0_kref+0x444:   	stbar
	.word	0x94d6b3fc	! t0_kref+0x448:   	umulcc	%i2, -0xc04, %o2
	.word	0xb5a00534	! t0_kref+0x44c:   	fsqrts	%f20, %f26
	.word	0xa5a0003d	! t0_kref+0x450:   	fmovs	%f29, %f18
	.word	0xd200a020	! t0_kref+0x454:   	ld	[%g2 + 0x20], %o1
	.word	0xaba00534	! t0_kref+0x458:   	fsqrts	%f20, %f21
	.word	0x92f68016	! t0_kref+0x45c:   	udivcc	%i2, %l6, %o1
	.word	0xc56e4017	! t0_kref+0x460:   	prefetch	%i1 + %l7, 2
	.word	0x37800006	! t0_kref+0x464:   	fbge,a	_kref+0x47c
	.word	0x96b6b578	! t0_kref+0x468:   	orncc	%i2, -0xa88, %o3
	.word	0x39800005	! t0_kref+0x46c:   	fbuge,a	_kref+0x480
	.word	0xa9a0015e	! t0_kref+0x470:   	fabsd	%f30, %f20
	.word	0x81ad4ab6	! t0_kref+0x474:   	fcmpes	%fcc0, %f21, %f22
	.word	0x965b2187	! t0_kref+0x478:   	smul	%o4, 0x187, %o3
	.word	0xa5a01a39	! t0_kref+0x47c:   	fstoi	%f25, %f18
	.word	0x8182c000	! t0_kref+0x480:   	wr	%o3, %g0, %y
	.word	0xd2480018	! t0_kref+0x484:   	ldsb	[%g0 + %i0], %o1
	.word	0xd83e3fe8	! t0_kref+0x488:   	std	%o4, [%i0 - 0x18]
	.word	0x9332e009	! t0_kref+0x48c:   	srl	%o3, 0x9, %o1
	.word	0x98f00016	! t0_kref+0x490:   	udivcc	%g0, %l6, %o4
	.word	0xbda80056	! t0_kref+0x494:   	fmovdn	%fcc0, %f22, %f30
	.word	0xb9a78958	! t0_kref+0x498:   	fmuld	%f30, %f24, %f28
	.word	0xe51e6000	! t0_kref+0x49c:   	ldd	[%i1], %f18
	.word	0xd83e2018	! t0_kref+0x4a0:   	std	%o4, [%i0 + 0x18]
	.word	0xb9a0103a	! t0_kref+0x4a4:   	fstox	%f26, %f28
	.word	0xd6865000	! t0_kref+0x4a8:   	lda	[%i1]0x80, %o3
	.word	0x38800003	! t0_kref+0x4ac:   	bgu,a	_kref+0x4b8
	.word	0x95232876	! t0_kref+0x4b0:   	mulscc	%o4, 0x876, %o2
	.word	0xc807bfe4	! t0_kref+0x4b4:   	ld	[%fp - 0x1c], %g4
	.word	0x940ae669	! t0_kref+0x4b8:   	and	%o3, 0x669, %o2
	.word	0xed1e2018	! t0_kref+0x4bc:   	ldd	[%i0 + 0x18], %f22
	.word	0xbda0053a	! t0_kref+0x4c0:   	fsqrts	%f26, %f30
	.word	0x96da0009	! t0_kref+0x4c4:   	smulcc	%o0, %o1, %o3
	.word	0xd6801018	! t0_kref+0x4c8:   	lda	[%g0 + %i0]0x80, %o3
	.word	0x9456ad86	! t0_kref+0x4cc:   	umul	%i2, 0xd86, %o2
	.word	0x3e800005	! t0_kref+0x4d0:   	bvc,a	_kref+0x4e4
	.word	0xb5a0191d	! t0_kref+0x4d4:   	fitod	%f29, %f26
	.word	0xd20e3ffd	! t0_kref+0x4d8:   	ldub	[%i0 - 3], %o1
	.word	0x968d6e53	! t0_kref+0x4dc:   	andcc	%l5, 0xe53, %o3
	.word	0xd0a81018	! t0_kref+0x4e0:   	stba	%o0, [%g0 + %i0]0x80
	.word	0x98f02b8a	! t0_kref+0x4e4:   	udivcc	%g0, 0xb8a, %o4
	.word	0x81858000	! t0_kref+0x4e8:   	wr	%l6, %g0, %y
	.word	0x98a6a040	! t0_kref+0x4ec:   	subcc	%i2, 0x40, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be134	! t0_kref+0x4f4:   	ldub	[%o7 + 0x134], %l2
	.word	0xa41ca00c	! t0_kref+0x4f8:   	xor	%l2, 0xc, %l2
	.word	0xe42be134	! t0_kref+0x4fc:   	stb	%l2, [%o7 + 0x134]
	.word	0x81dbe134	! t0_kref+0x500:   	flush	%o7 + 0x134
	.word	0x9422f9d5	! t0_kref+0x504:   	sub	%o3, -0x62b, %o2
	.word	0x9695ff5d	! t0_kref+0x508:   	orcc	%l7, -0xa3, %o3
	.word	0xd4000019	! t0_kref+0x50c:   	ld	[%g0 + %i1], %o2
	.word	0x98c262ae	! t0_kref+0x510:   	addccc	%o1, 0x2ae, %o4
	.word	0xd84e401a	! t0_kref+0x514:   	ldsb	[%i1 + %i2], %o4
	.word	0x98fdc00a	! t0_kref+0x518:   	sdivcc	%l7, %o2, %o4
	.word	0x929a0009	! t0_kref+0x51c:   	xorcc	%o0, %o1, %o1
	.word	0xd20e7fe3	! t0_kref+0x520:   	ldub	[%i1 - 0x1d], %o1
	.word	0xb9a608d4	! t0_kref+0x524:   	fsubd	%f24, %f20, %f28
	.word	0xb5a509de	! t0_kref+0x528:   	fdivd	%f20, %f30, %f26
	.word	0x988d800c	! t0_kref+0x52c:   	andcc	%l6, %o4, %o4
	.word	0xe5180018	! t0_kref+0x530:   	ldd	[%g0 + %i0], %f18
2:	.word	0xf320a034	! t0_kref+0x534:   	st	%f25, [%g2 + 0x34]
	call	SYM(t0_subr3)
	.word	0x945dc015	! t0_kref+0x53c:   	smul	%l7, %l5, %o2
	call	SYM(t0_subr0)
	.word	0xda2e0000	! t0_kref+0x544:   	stb	%o5, [%i0]
	.word	0x8143c000	! t0_kref+0x548:   	stbar
	.word	0x1305868b	! t0_kref+0x54c:   	sethi	%hi(0x161a2c00), %o1
	.word	0x86102003	! t0_kref+0x550:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x554:   	bne,a	_kref+0x554
	.word	0x86a0e001	! t0_kref+0x558:   	subcc	%g3, 1, %g3
	.word	0x9612400c	! t0_kref+0x55c:   	or	%o1, %o4, %o3
	.word	0x81580000	! t0_kref+0x560:   	flushw
	.word	0xf93e2018	! t0_kref+0x564:   	std	%f28, [%i0 + 0x18]
	.word	0x81dd001a	! t0_kref+0x568:   	flush	%l4 + %i2
	.word	0x980b0000	! t0_kref+0x56c:   	and	%o4, %g0, %o4
!	.word	0x22810ea1	! t0_kref+0x570:   	be,a	SYM(t0_subr2)
	   	be,a	SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x574:   	mov	%pc, %o7
	.word	0x001fffff	! t0_kref+0x578:   	illtrap	0x1fffff
	.word	0xd200a008	! t0_kref+0x57c:   	ld	[%g2 + 8], %o1
	.word	0x81af4aba	! t0_kref+0x580:   	fcmpes	%fcc0, %f29, %f26
	.word	0x81800000	! t0_kref+0x584:   	mov	%g0, %y
	.word	0xa3a01a52	! t0_kref+0x588:   	fdtoi	%f18, %f17
	.word	0x98a6800d	! t0_kref+0x58c:   	subcc	%i2, %o5, %o4
	.word	0x928d800a	! t0_kref+0x590:   	andcc	%l6, %o2, %o1
	.word	0x98158009	! t0_kref+0x594:   	or	%l6, %o1, %o4
	.word	0xb9a01918	! t0_kref+0x598:   	fitod	%f24, %f28
	.word	0xec1e3fe8	! t0_kref+0x59c:   	ldd	[%i0 - 0x18], %l6
	.word	0x3b800004	! t0_kref+0x5a0:   	fble,a	_kref+0x5b0
	.word	0x8143c000	! t0_kref+0x5a4:   	stbar
	.word	0xfb6e001c	! t0_kref+0x5a8:   	prefetch	%i0 + %i4, 29
	.word	0xb9a01a39	! t0_kref+0x5ac:   	fstoi	%f25, %f28
	.word	0xada00536	! t0_kref+0x5b0:   	fsqrts	%f22, %f22
	.word	0x3d800002	! t0_kref+0x5b4:   	fbule,a	_kref+0x5bc
	.word	0x93408000	! t0_kref+0x5b8:   	mov	%ccr, %o1
	.word	0x96e5fafc	! t0_kref+0x5bc:   	subccc	%l7, -0x504, %o3
	.word	0x94200008	! t0_kref+0x5c0:   	neg	%o0, %o2
	.word	0x24800001	! t0_kref+0x5c4:   	ble,a	_kref+0x5c8
	.word	0xa5a018d8	! t0_kref+0x5c8:   	fdtos	%f24, %f18
	.word	0xb7a018d4	! t0_kref+0x5cc:   	fdtos	%f20, %f27
	.word	0x921dc016	! t0_kref+0x5d0:   	xor	%l7, %l6, %o1
	.word	0x98e2e08d	! t0_kref+0x5d4:   	subccc	%o3, 0x8d, %o4
!	.word	0x2b865e8a	! t0_kref+0x5d8:   	fbug,a	SYM(t0_subr1)
	   	fbug,a	SYM(t0_subr1)
	.word	0x9e0065ac	! t0_kref+0x5dc:   	add	%g1, 0x5ac, %o7
	.word	0x989db4a2	! t0_kref+0x5e0:   	xorcc	%l6, -0xb5e, %o4
	.word	0x92223370	! t0_kref+0x5e4:   	sub	%o0, -0xc90, %o1
	.word	0x94fb401a	! t0_kref+0x5e8:   	sdivcc	%o5, %i2, %o2
	.word	0x94adf98c	! t0_kref+0x5ec:   	andncc	%l7, -0x674, %o2
	.word	0x9832ace5	! t0_kref+0x5f0:   	orn	%o2, 0xce5, %o4
	.word	0xb1a01a3a	! t0_kref+0x5f4:   	fstoi	%f26, %f24
	.word	0xe81e2018	! t0_kref+0x5f8:   	ldd	[%i0 + 0x18], %l4
	.word	0x9242c00d	! t0_kref+0x5fc:   	addc	%o3, %o5, %o1
	call	SYM(t0_subr0)
	.word	0xfd00a030	! t0_kref+0x604:   	ld	[%g2 + 0x30], %f30
	.word	0x9425c015	! t0_kref+0x608:   	sub	%l7, %l5, %o2
	.word	0x98420000	! t0_kref+0x60c:   	addc	%o0, %g0, %o4
	.word	0x92222633	! t0_kref+0x610:   	sub	%o0, 0x633, %o1
	.word	0xe9be580a	! t0_kref+0x614:   	stda	%f20, [%i1 + %o2]0xc0
	.word	0xd9e61009	! t0_kref+0x618:   	casa	[%i0]0x80, %o1, %o4
	.word	0xf11e3ff0	! t0_kref+0x61c:   	ldd	[%i0 - 0x10], %f24
	.word	0x95358016	! t0_kref+0x620:   	srl	%l6, %l6, %o2
	.word	0x81828000	! t0_kref+0x624:   	wr	%o2, %g0, %y
	.word	0xd640a014	! t0_kref+0x628:   	ldsw	[%g2 + 0x14], %o3
	.word	0xaba01a3d	! t0_kref+0x62c:   	fstoi	%f29, %f21
	.word	0x960b61d9	! t0_kref+0x630:   	and	%o5, 0x1d9, %o3
	.word	0x98254017	! t0_kref+0x634:   	sub	%l5, %l7, %o4
	.word	0x948a8015	! t0_kref+0x638:   	andcc	%o2, %l5, %o2
	.word	0xb3a70939	! t0_kref+0x63c:   	fmuls	%f28, %f25, %f25
	.word	0x96da800d	! t0_kref+0x640:   	smulcc	%o2, %o5, %o3
	.word	0xd608a020	! t0_kref+0x644:   	ldub	[%g2 + 0x20], %o3
	.word	0xa3a00539	! t0_kref+0x648:   	fsqrts	%f25, %f17
	.word	0xb9a01a38	! t0_kref+0x64c:   	fstoi	%f24, %f28
	.word	0xb1a7895e	! t0_kref+0x650:   	fmuld	%f30, %f30, %f24
	.word	0x98103319	! t0_kref+0x654:   	mov	0xfffff319, %o4
	.word	0xfb00a010	! t0_kref+0x658:   	ld	[%g2 + 0x10], %f29
	.word	0x9325800d	! t0_kref+0x65c:   	mulscc	%l6, %o5, %o1
	.word	0x980d6525	! t0_kref+0x660:   	and	%l5, 0x525, %o4
	.word	0x98c32375	! t0_kref+0x664:   	addccc	%o4, 0x375, %o4
	.word	0x21800007	! t0_kref+0x668:   	fbn,a	_kref+0x684
	.word	0x962362ce	! t0_kref+0x66c:   	sub	%o5, 0x2ce, %o3
	.word	0xaba0053c	! t0_kref+0x670:   	fsqrts	%f28, %f21
	.word	0xd650a022	! t0_kref+0x674:   	ldsh	[%g2 + 0x22], %o3
	.word	0x99418000	! t0_kref+0x678:   	mov	%fprs, %o4
	.word	0x3c800005	! t0_kref+0x67c:   	bpos,a	_kref+0x690
	.word	0xd41e7fe0	! t0_kref+0x680:   	ldd	[%i1 - 0x20], %o2
	.word	0xd236601c	! t0_kref+0x684:   	sth	%o1, [%i1 + 0x1c]
	.word	0xa5a01a35	! t0_kref+0x688:   	fstoi	%f21, %f18
	.word	0x921375d2	! t0_kref+0x68c:   	or	%o5, -0xa2e, %o1
	.word	0x9693254b	! t0_kref+0x690:   	orcc	%o4, 0x54b, %o3
	.word	0x81ad8a5a	! t0_kref+0x694:   	fcmpd	%fcc0, %f22, %f26
	.word	0x92a5be3e	! t0_kref+0x698:   	subcc	%l6, -0x1c2, %o1
	.word	0xb1a01a32	! t0_kref+0x69c:   	fstoi	%f18, %f24
	.word	0xd6462004	! t0_kref+0x6a0:   	ldsw	[%i0 + 4], %o3
	.word	0x92257e3f	! t0_kref+0x6a4:   	sub	%l5, -0x1c1, %o1
	.word	0xa1a70950	! t0_kref+0x6a8:   	fmuld	%f28, %f16, %f16
	.word	0x9225fa1e	! t0_kref+0x6ac:   	sub	%l7, -0x5e2, %o1
	.word	0xd800a034	! t0_kref+0x6b0:   	ld	[%g2 + 0x34], %o4
	.word	0xb1a01912	! t0_kref+0x6b4:   	fitod	%f18, %f24
	.word	0x92854015	! t0_kref+0x6b8:   	addcc	%l5, %l5, %o1
	.word	0x921a800c	! t0_kref+0x6bc:   	xor	%o2, %o4, %o1
	.word	0x9486b2c8	! t0_kref+0x6c0:   	addcc	%i2, -0xd38, %o2
	.word	0x94f58017	! t0_kref+0x6c4:   	udivcc	%l6, %l7, %o2
	.word	0xe4680019	! t0_kref+0x6c8:   	ldstub	[%g0 + %i1], %l2
	.word	0x34800002	! t0_kref+0x6cc:   	bg,a	_kref+0x6d4
	.word	0x9933001a	! t0_kref+0x6d0:   	srl	%o4, %i2, %o4
	.word	0x94da0008	! t0_kref+0x6d4:   	smulcc	%o0, %o0, %o2
	.word	0xe91e7fe0	! t0_kref+0x6d8:   	ldd	[%i1 - 0x20], %f20
	.word	0x969aa263	! t0_kref+0x6dc:   	xorcc	%o2, 0x263, %o3
	.word	0x99368017	! t0_kref+0x6e0:   	srl	%i2, %l7, %o4
	.word	0x2c800004	! t0_kref+0x6e4:   	bneg,a	_kref+0x6f4
	.word	0x94a0233c	! t0_kref+0x6e8:   	subcc	%g0, 0x33c, %o2
	.word	0x3b800002	! t0_kref+0x6ec:   	fble,a	_kref+0x6f4
	.word	0xc807bfe4	! t0_kref+0x6f0:   	ld	[%fp - 0x1c], %g4
	.word	0xec260000	! t0_kref+0x6f4:   	st	%l6, [%i0]
	.word	0xb5a589d6	! t0_kref+0x6f8:   	fdivd	%f22, %f22, %f26
	.word	0x9486801a	! t0_kref+0x6fc:   	addcc	%i2, %i2, %o2
	.word	0x991afdcc	! t0_kref+0x700:   	tsubcctv	%o3, -0x234, %o4
	.word	0x9492b526	! t0_kref+0x704:   	orcc	%o2, -0xada, %o2
	.word	0xd600a034	! t0_kref+0x708:   	ld	[%g2 + 0x34], %o3
	.word	0x9665c00c	! t0_kref+0x70c:   	subc	%l7, %o4, %o3
	.word	0xd640a038	! t0_kref+0x710:   	ldsw	[%g2 + 0x38], %o3
	.word	0xd028a03b	! t0_kref+0x714:   	stb	%o0, [%g2 + 0x3b]
	.word	0xee264000	! t0_kref+0x718:   	st	%l7, [%i1]
	.word	0xafa00034	! t0_kref+0x71c:   	fmovs	%f20, %f23
	.word	0x22800007	! t0_kref+0x720:   	be,a	_kref+0x73c
	.word	0xebee501b	! t0_kref+0x724:   	prefetcha	%i1 + %i3, 21
	.word	0xd8be5000	! t0_kref+0x728:   	stda	%o4, [%i1]0x80
	.word	0xd430a01e	! t0_kref+0x72c:   	sth	%o2, [%g2 + 0x1e]
	.word	0x98d0245b	! t0_kref+0x730:   	umulcc	%g0, 0x45b, %o4
	.word	0x949ac008	! t0_kref+0x734:   	xorcc	%o3, %o0, %o2
	.word	0x933b001a	! t0_kref+0x738:   	sra	%o4, %i2, %o1
	.word	0xd01e4000	! t0_kref+0x73c:   	ldd	[%i1], %o0
	.word	0xe9bf1a58	! t0_kref+0x740:   	stda	%f20, [%i4 + %i0]0xd2
	.word	0x9402800c	! t0_kref+0x744:   	add	%o2, %o4, %o2
	.word	0x29800006	! t0_kref+0x748:   	fbl,a	_kref+0x760
	.word	0x962de09a	! t0_kref+0x74c:   	andn	%l7, 0x9a, %o3
	.word	0xa3a01a5a	! t0_kref+0x750:   	fdtoi	%f26, %f17
	.word	0x972b2007	! t0_kref+0x754:   	sll	%o4, 0x7, %o3
	.word	0xec363ff8	! t0_kref+0x758:   	sth	%l6, [%i0 - 8]
	.word	0x92aaa183	! t0_kref+0x75c:   	andncc	%o2, 0x183, %o1
	.word	0x8143c000	! t0_kref+0x760:   	stbar
	.word	0x96623d70	! t0_kref+0x764:   	subc	%o0, -0x290, %o3
	.word	0xa3a0003e	! t0_kref+0x768:   	fmovs	%f30, %f17
	.word	0x26800003	! t0_kref+0x76c:   	bl,a	_kref+0x778
	.word	0xd036201a	! t0_kref+0x770:   	sth	%o0, [%i0 + 0x1a]
	.word	0x23800005	! t0_kref+0x774:   	fbne,a	_kref+0x788
	.word	0xd41e001d	! t0_kref+0x778:   	ldd	[%i0 + %i5], %o2
	.word	0x96256bb1	! t0_kref+0x77c:   	sub	%l5, 0xbb1, %o3
	.word	0xd600a03c	! t0_kref+0x780:   	ld	[%g2 + 0x3c], %o3
	.word	0xef6e001d	! t0_kref+0x784:   	prefetch	%i0 + %i5, 23
	.word	0xda362000	! t0_kref+0x788:   	sth	%o5, [%i0]
	.word	0xec68a004	! t0_kref+0x78c:   	ldstub	[%g2 + 4], %l6
	.word	0xec20a008	! t0_kref+0x790:   	st	%l6, [%g2 + 8]
	.word	0x9732e007	! t0_kref+0x794:   	srl	%o3, 0x7, %o3
	.word	0x928a800a	! t0_kref+0x798:   	andcc	%o2, %o2, %o1
	.word	0xf7861000	! t0_kref+0x79c:   	lda	[%i0]0x80, %f27
	.word	0x9de3bfa0	! t0_kref+0x7a0:   	save	%sp, -0x60, %sp
	.word	0x99ee7e1a	! t0_kref+0x7a4:   	restore	%i1, -0x1e6, %o4
	.word	0xf53e3ff0	! t0_kref+0x7a8:   	std	%f26, [%i0 - 0x10]
	.word	0x96e34015	! t0_kref+0x7ac:   	subccc	%o5, %l5, %o3
	.word	0xd64e7ffd	! t0_kref+0x7b0:   	ldsb	[%i1 - 3], %o3
	.word	0x988b401a	! t0_kref+0x7b4:   	andcc	%o5, %i2, %o4
	.word	0x9723000d	! t0_kref+0x7b8:   	mulscc	%o4, %o5, %o3
	.word	0x9488000c	! t0_kref+0x7bc:   	andcc	%g0, %o4, %o2
	.word	0x81ad0a38	! t0_kref+0x7c0:   	fcmps	%fcc0, %f20, %f24
	.word	0x96256342	! t0_kref+0x7c4:   	sub	%l5, 0x342, %o3
	.word	0xa9a01035	! t0_kref+0x7c8:   	fstox	%f21, %f20
	.word	0xe86e001a	! t0_kref+0x7cc:   	ldstub	[%i0 + %i2], %l4
	.word	0xf1ee101a	! t0_kref+0x7d0:   	prefetcha	%i0 + %i2, 24
	.word	0x98424017	! t0_kref+0x7d4:   	addc	%o1, %l7, %o4
	.word	0xd6263ff0	! t0_kref+0x7d8:   	st	%o3, [%i0 - 0x10]
	.word	0xd24e0000	! t0_kref+0x7dc:   	ldsb	[%i0], %o1
	.word	0x8610201b	! t0_kref+0x7e0:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x7e4:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x7e8:   	be,a	_kref+0x7f0
	.word	0x92654000	! t0_kref+0x7ec:   	subc	%l5, %g0, %o1
	.word	0x948ea11c	! t0_kref+0x7f0:   	andcc	%i2, 0x11c, %o2
	.word	0x924231c1	! t0_kref+0x7f4:   	addc	%o0, -0xe3f, %o1
	.word	0x96a27cdd	! t0_kref+0x7f8:   	subcc	%o1, -0x323, %o3
	.word	0xfd06401c	! t0_kref+0x7fc:   	ld	[%i1 + %i4], %f30
	.word	0x96220015	! t0_kref+0x800:   	sub	%o0, %l5, %o3
	.word	0x98e2303e	! t0_kref+0x804:   	subccc	%o0, -0xfc2, %o4
	.word	0xd24e201f	! t0_kref+0x808:   	ldsb	[%i0 + 0x1f], %o1
	.word	0x8185c000	! t0_kref+0x80c:   	wr	%l7, %g0, %y
	.word	0x86102001	! t0_kref+0x810:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x814:   	bne,a	_kref+0x814
	.word	0x86a0e001	! t0_kref+0x818:   	subcc	%g3, 1, %g3
	.word	0xf3060000	! t0_kref+0x81c:   	ld	[%i0], %f25
	.word	0x92fdc016	! t0_kref+0x820:   	sdivcc	%l7, %l6, %o1
	.word	0xb9a01934	! t0_kref+0x824:   	fstod	%f20, %f28
	.word	0xa9a54d3d	! t0_kref+0x828:   	fsmuld	%f21, %f29, %f20
	.word	0x987dfbbc	! t0_kref+0x82c:   	sdiv	%l7, -0x444, %o4
	.word	0xf4363ff0	! t0_kref+0x830:   	sth	%i2, [%i0 - 0x10]
	.word	0xaba018da	! t0_kref+0x834:   	fdtos	%f26, %f21
	.word	0x38800001	! t0_kref+0x838:   	bgu,a	_kref+0x83c
	.word	0x969e8015	! t0_kref+0x83c:   	xorcc	%i2, %l5, %o3
	.word	0x98c34017	! t0_kref+0x840:   	addccc	%o5, %l7, %o4
	.word	0x96620000	! t0_kref+0x844:   	subc	%o0, %g0, %o3
	.word	0xd028a01d	! t0_kref+0x848:   	stb	%o0, [%g2 + 0x1d]
	.word	0x9725400b	! t0_kref+0x84c:   	mulscc	%l5, %o3, %o3
	.word	0x985d4017	! t0_kref+0x850:   	smul	%l5, %l7, %o4
	.word	0x97408000	! t0_kref+0x854:   	mov	%ccr, %o3
	.word	0x96a6a21e	! t0_kref+0x858:   	subcc	%i2, 0x21e, %o3
	.word	0x962af290	! t0_kref+0x85c:   	andn	%o3, -0xd70, %o3
	.word	0x92158016	! t0_kref+0x860:   	or	%l6, %l6, %o1
	.word	0xe19eda19	! t0_kref+0x864:   	ldda	[%i3 + %i1]0xd0, %f16
	.word	0x8143c000	! t0_kref+0x868:   	stbar
	.word	0xd640a024	! t0_kref+0x86c:   	ldsw	[%g2 + 0x24], %o3
	call	1f
	.empty
	.word	0xd428a02a	! t0_kref+0x874:   	stb	%o2, [%g2 + 0x2a]
	.word	0x9725b617	! t0_kref+0x878:   	mulscc	%l6, -0x9e9, %o3
	.word	0xe96e6000	! t0_kref+0x87c:   	prefetch	%i1, 20
	.word	0xb5a58852	! t0_kref+0x880:   	faddd	%f22, %f18, %f26
	.word	0x93033845	! t0_kref+0x884:   	taddcc	%o4, -0x7bb, %o1
1:	.word	0xfd00a010	! t0_kref+0x888:   	ld	[%g2 + 0x10], %f30
	.word	0x9622c00c	! t0_kref+0x88c:   	sub	%o3, %o4, %o3
	.word	0xe320a010	! t0_kref+0x890:   	st	%f17, [%g2 + 0x10]
	.word	0xe7067fe4	! t0_kref+0x894:   	ld	[%i1 - 0x1c], %f19
	.word	0xd208a005	! t0_kref+0x898:   	ldub	[%g2 + 5], %o1
	.word	0x948b0016	! t0_kref+0x89c:   	andcc	%o4, %l6, %o2
	.word	0x96568015	! t0_kref+0x8a0:   	umul	%i2, %l5, %o3
	.word	0x94627257	! t0_kref+0x8a4:   	subc	%o1, -0xda9, %o2
	.word	0xe86e8018	! t0_kref+0x8a8:   	ldstub	[%i2 + %i0], %l4
	call	SYM(t0_subr1)
	.word	0xdaa61000	! t0_kref+0x8b0:   	sta	%o5, [%i0]0x80
	.word	0xb1a7095c	! t0_kref+0x8b4:   	fmuld	%f28, %f28, %f24
	.word	0xe1e6100c	! t0_kref+0x8b8:   	casa	[%i0]0x80, %o4, %l0
	.word	0xa7a00536	! t0_kref+0x8bc:   	fsqrts	%f22, %f19
	.word	0x949ac01a	! t0_kref+0x8c0:   	xorcc	%o3, %i2, %o2
	.word	0x97330015	! t0_kref+0x8c4:   	srl	%o4, %l5, %o3
	.word	0x92f6b0b6	! t0_kref+0x8c8:   	udivcc	%i2, -0xf4a, %o1
	.word	0xc807bfe4	! t0_kref+0x8cc:   	ld	[%fp - 0x1c], %g4
	.word	0x968b4008	! t0_kref+0x8d0:   	andcc	%o5, %o0, %o3
	.word	0x96826b90	! t0_kref+0x8d4:   	addcc	%o1, 0xb90, %o3
	.word	0x961a000c	! t0_kref+0x8d8:   	xor	%o0, %o4, %o3
	.word	0x94528009	! t0_kref+0x8dc:   	umul	%o2, %o1, %o2
	.word	0x969a32f5	! t0_kref+0x8e0:   	xorcc	%o0, -0xd0b, %o3
	.word	0xe926001c	! t0_kref+0x8e4:   	st	%f20, [%i0 + %i4]
	.word	0xef00a01c	! t0_kref+0x8e8:   	ld	[%g2 + 0x1c], %f23
	.word	0x9226ba0e	! t0_kref+0x8ec:   	sub	%i2, -0x5f2, %o1
	.word	0xd0a65000	! t0_kref+0x8f0:   	sta	%o0, [%i1]0x80
	.word	0x921dc000	! t0_kref+0x8f4:   	xor	%l7, %g0, %o1
	.word	0x9fc00004	! t0_kref+0x8f8:   	call	%g0 + %g4
	.word	0xd62e001a	! t0_kref+0x8fc:   	stb	%o3, [%i0 + %i2]
	.word	0x23480002	! t0_kref+0x900:   	fbne,a,pt	%fcc0, _kref+0x908
	.word	0xc16e4000	! t0_kref+0x904:   	prefetch	%i1, 0
	.word	0xec36c018	! t0_kref+0x908:   	sth	%l6, [%i3 + %i0]
	.word	0x96583fcd	! t0_kref+0x90c:   	smul	%g0, -0x33, %o3
	.word	0x9fc00004	! t0_kref+0x910:   	call	%g0 + %g4
	.word	0x952d801a	! t0_kref+0x914:   	sll	%l6, %i2, %o2
	.word	0x81ac8a5c	! t0_kref+0x918:   	fcmpd	%fcc0, %f18, %f28
	.word	0xd4d81018	! t0_kref+0x91c:   	ldxa	[%g0 + %i0]0x80, %o2
	.word	0xd20e8018	! t0_kref+0x920:   	ldub	[%i2 + %i0], %o1
	.word	0x92d32fac	! t0_kref+0x924:   	umulcc	%o4, 0xfac, %o1
	.word	0x92257c5c	! t0_kref+0x928:   	sub	%l5, -0x3a4, %o1
	.word	0x98fdfce9	! t0_kref+0x92c:   	sdivcc	%l7, -0x317, %o4
	.word	0xd62e7ff4	! t0_kref+0x930:   	stb	%o3, [%i1 - 0xc]
	.word	0xafa018d8	! t0_kref+0x934:   	fdtos	%f24, %f23
	.word	0xed20a004	! t0_kref+0x938:   	st	%f22, [%g2 + 4]
	.word	0x34800005	! t0_kref+0x93c:   	bg,a	_kref+0x950
	.word	0x94a232a2	! t0_kref+0x940:   	subcc	%o0, -0xd5e, %o2
	.word	0x94fb6123	! t0_kref+0x944:   	sdivcc	%o5, 0x123, %o2
	.word	0xeb6e7fe0	! t0_kref+0x948:   	prefetch	%i1 - 0x20, 21
	.word	0x98a3000c	! t0_kref+0x94c:   	subcc	%o4, %o4, %o4
	.word	0x34800002	! t0_kref+0x950:   	bg,a	_kref+0x958
	.word	0x99382015	! t0_kref+0x954:   	sra	%g0, 0x15, %o4
	.word	0xd410a038	! t0_kref+0x958:   	lduh	[%g2 + 0x38], %o2
	.word	0x81dd800b	! t0_kref+0x95c:   	flush	%l6 + %o3
	.word	0x9652fff4	! t0_kref+0x960:   	umul	%o3, -0xc, %o3
	.word	0x81ac4a3d	! t0_kref+0x964:   	fcmps	%fcc0, %f17, %f29
	.word	0xe51e2008	! t0_kref+0x968:   	ldd	[%i0 + 8], %f18
	.word	0xf93e401d	! t0_kref+0x96c:   	std	%f28, [%i1 + %i5]
	.word	0xb7a01895	! t0_kref+0x970:   	fitos	%f21, %f27
	.word	0xbda018da	! t0_kref+0x974:   	fdtos	%f26, %f30
	.word	0xd468a03a	! t0_kref+0x978:   	ldstub	[%g2 + 0x3a], %o2
	.word	0x9683000d	! t0_kref+0x97c:   	addcc	%o4, %o5, %o3
	.word	0x9815400d	! t0_kref+0x980:   	or	%l5, %o5, %o4
	.word	0xd0200018	! t0_kref+0x984:   	st	%o0, [%g0 + %i0]
	.word	0x92e5ef56	! t0_kref+0x988:   	subccc	%l7, 0xf56, %o1
	.word	0x39800005	! t0_kref+0x98c:   	fbuge,a	_kref+0x9a0
	.word	0x8143c000	! t0_kref+0x990:   	stbar
	.word	0xd6080019	! t0_kref+0x994:   	ldub	[%g0 + %i1], %o3
	.word	0x94f28017	! t0_kref+0x998:   	udivcc	%o2, %l7, %o2
	.word	0x921a396e	! t0_kref+0x99c:   	xor	%o0, -0x692, %o1
	.word	0x932de005	! t0_kref+0x9a0:   	sll	%l7, 0x5, %o1
	.word	0x947024ac	! t0_kref+0x9a4:   	udiv	%g0, 0x4ac, %o2
	.word	0x8143c000	! t0_kref+0x9a8:   	stbar
	.word	0x8143c000	! t0_kref+0x9ac:   	stbar
	.word	0x3d800004	! t0_kref+0x9b0:   	fbule,a	_kref+0x9c0
	.word	0xe51e2018	! t0_kref+0x9b4:   	ldd	[%i0 + 0x18], %f18
	.word	0x3d800008	! t0_kref+0x9b8:   	fbule,a	_kref+0x9d8
	.word	0xd808a00f	! t0_kref+0x9bc:   	ldub	[%g2 + 0xf], %o4
	.word	0x96da0009	! t0_kref+0x9c0:   	smulcc	%o0, %o1, %o3
	.word	0x9322f1b8	! t0_kref+0x9c4:   	mulscc	%o3, -0xe48, %o1
	.word	0xd408a014	! t0_kref+0x9c8:   	ldub	[%g2 + 0x14], %o2
	.word	0xb5a589d0	! t0_kref+0x9cc:   	fdivd	%f22, %f16, %f26
	.word	0xd64e3fea	! t0_kref+0x9d0:   	ldsb	[%i0 - 0x16], %o3
	.word	0xd44e7ffd	! t0_kref+0x9d4:   	ldsb	[%i1 - 3], %o2
	.word	0x36800004	! t0_kref+0x9d8:   	bge,a	_kref+0x9e8
	.word	0xc0366002	! t0_kref+0x9dc:   	clrh	[%i1 + 2]
	.word	0x992dc015	! t0_kref+0x9e0:   	sll	%l7, %l5, %o4
	.word	0x987b0000	! t0_kref+0x9e4:   	sdiv	%o4, %g0, %o4
	.word	0xb5a01118	! t0_kref+0x9e8:   	fxtod	%f24, %f26
	.word	0x9940c000	! t0_kref+0x9ec:   	mov	%asi, %o4
	.word	0x3c800002	! t0_kref+0x9f0:   	bpos,a	_kref+0x9f8
	.word	0x985e800a	! t0_kref+0x9f4:   	smul	%i2, %o2, %o4
	.word	0x953b2017	! t0_kref+0x9f8:   	sra	%o4, 0x17, %o2
!	.word	0x3d490d7e	! t0_kref+0x9fc:   	fbule,a,pt	%fcc0, SYM(t0_subr2)
	   	fbule,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9e0069d0	! t0_kref+0xa00:   	add	%g1, 0x9d0, %o7
	.word	0x8185c000	! t0_kref+0xa04:   	wr	%l7, %g0, %y
	.word	0xef20a000	! t0_kref+0xa08:   	st	%f23, [%g2]
	.word	0x81dffdde	! t0_kref+0xa0c:   	flush	%i7 - 0x222
	.word	0x963325d9	! t0_kref+0xa10:   	orn	%o4, 0x5d9, %o3
	.word	0x97237ddb	! t0_kref+0xa14:   	mulscc	%o5, -0x225, %o3
	.word	0x94232653	! t0_kref+0xa18:   	sub	%o4, 0x653, %o2
	.word	0x8185c000	! t0_kref+0xa1c:   	wr	%l7, %g0, %y
	.word	0x9fc00004	! t0_kref+0xa20:   	call	%g0 + %g4
	.word	0x96fdc017	! t0_kref+0xa24:   	sdivcc	%l7, %l7, %o3
	.word	0xd80e6015	! t0_kref+0xa28:   	ldub	[%i1 + 0x15], %o4
	.word	0xb9a018d2	! t0_kref+0xa2c:   	fdtos	%f18, %f28
	.word	0xd83e001d	! t0_kref+0xa30:   	std	%o4, [%i0 + %i5]
	.word	0xafa018d8	! t0_kref+0xa34:   	fdtos	%f24, %f23
	.word	0x34800003	! t0_kref+0xa38:   	bg,a	_kref+0xa44
	.word	0x9735800c	! t0_kref+0xa3c:   	srl	%l6, %o4, %o3
	.word	0xe786501c	! t0_kref+0xa40:   	lda	[%i1 + %i4]0x80, %f19
	.word	0x92ddc000	! t0_kref+0xa44:   	smulcc	%l7, %g0, %o1
	.word	0x2d800005	! t0_kref+0xa48:   	fbg,a	_kref+0xa5c
	.word	0xd4801018	! t0_kref+0xa4c:   	lda	[%g0 + %i0]0x80, %o2
	.word	0xd208a001	! t0_kref+0xa50:   	ldub	[%g2 + 1], %o1
	.word	0x81dd4018	! t0_kref+0xa54:   	flush	%l5 + %i0
	.word	0x96a2287e	! t0_kref+0xa58:   	subcc	%o0, 0x87e, %o3
	.word	0x34800008	! t0_kref+0xa5c:   	bg,a	_kref+0xa7c
	.word	0x15079af9	! t0_kref+0xa60:   	sethi	%hi(0x1e6be400), %o2
	.word	0xfd1e7fe0	! t0_kref+0xa64:   	ldd	[%i1 - 0x20], %f30
	.word	0xaba00531	! t0_kref+0xa68:   	fsqrts	%f17, %f21
	.word	0x8143c000	! t0_kref+0xa6c:   	stbar
	.word	0xd01f4019	! t0_kref+0xa70:   	ldd	[%i5 + %i1], %o0
	.word	0x2d800007	! t0_kref+0xa74:   	fbg,a	_kref+0xa90
	.word	0x942b6e21	! t0_kref+0xa78:   	andn	%o5, 0xe21, %o2
	.word	0xafa018d0	! t0_kref+0xa7c:   	fdtos	%f16, %f23
	.word	0xe7067fe8	! t0_kref+0xa80:   	ld	[%i1 - 0x18], %f19
	.word	0x98ddbfff	! t0_kref+0xa84:   	smulcc	%l6, -0x1, %o4
	.word	0x9675f5d9	! t0_kref+0xa88:   	udiv	%l7, -0xa27, %o3
	.word	0x94db2e33	! t0_kref+0xa8c:   	smulcc	%o4, 0xe33, %o2
	.word	0xe0303d2e	! t0_kref+0xa90:   	sth	%l0, [%g0 - 0x2d2]
	.word	0x99320000	! t0_kref+0xa94:   	srl	%o0, %g0, %o4
	.word	0xd208a00a	! t0_kref+0xa98:   	ldub	[%g2 + 0xa], %o1
	.word	0x96980000	! t0_kref+0xa9c:   	xorcc	%g0, %g0, %o3
	.word	0xd4680018	! t0_kref+0xaa0:   	ldstub	[%g0 + %i0], %o2
	.word	0xee263fe0	! t0_kref+0xaa4:   	st	%l7, [%i0 - 0x20]
	.word	0x98a6a9d5	! t0_kref+0xaa8:   	subcc	%i2, 0x9d5, %o4
	.word	0x30800007	! t0_kref+0xaac:   	ba,a	_kref+0xac8
	.word	0x9272ffd6	! t0_kref+0xab0:   	udiv	%o3, -0x2a, %o1
	.word	0xd20e8019	! t0_kref+0xab4:   	ldub	[%i2 + %i1], %o1
	.word	0xf1063fe0	! t0_kref+0xab8:   	ld	[%i0 - 0x20], %f24
	.word	0xd808a021	! t0_kref+0xabc:   	ldub	[%g2 + 0x21], %o4
	.word	0x9653387e	! t0_kref+0xac0:   	umul	%o4, -0x782, %o3
	.word	0x923a4008	! t0_kref+0xac4:   	xnor	%o1, %o0, %o1
	.word	0xa5a589de	! t0_kref+0xac8:   	fdivd	%f22, %f30, %f18
	.word	0x98333b24	! t0_kref+0xacc:   	orn	%o4, -0x4dc, %o4
	.word	0x947d400a	! t0_kref+0xad0:   	sdiv	%l5, %o2, %o2
	.word	0xbda01913	! t0_kref+0xad4:   	fitod	%f19, %f30
	.word	0x8143c000	! t0_kref+0xad8:   	stbar
	.word	0xa9a018d2	! t0_kref+0xadc:   	fdtos	%f18, %f20
	.word	0xf76e2000	! t0_kref+0xae0:   	prefetch	%i0, 27
	.word	0x81ae4a34	! t0_kref+0xae4:   	fcmps	%fcc0, %f25, %f20
	.word	0x932dc00a	! t0_kref+0xae8:   	sll	%l7, %o2, %o1
	.word	0x9338201d	! t0_kref+0xaec:   	sra	%g0, 0x1d, %o1
	.word	0x951a6726	! t0_kref+0xaf0:   	tsubcctv	%o1, 0x726, %o2
	.word	0xef00a018	! t0_kref+0xaf4:   	ld	[%g2 + 0x18], %f23
	.word	0x81824000	! t0_kref+0xaf8:   	wr	%o1, %g0, %y
	.word	0x973e8008	! t0_kref+0xafc:   	sra	%i2, %o0, %o3
	.word	0xa9a70958	! t0_kref+0xb00:   	fmuld	%f28, %f24, %f20
	.word	0xa9a50958	! t0_kref+0xb04:   	fmuld	%f20, %f24, %f20
	.word	0xada01a50	! t0_kref+0xb08:   	fdtoi	%f16, %f22
	.word	0x20800002	! t0_kref+0xb0c:   	bn,a	_kref+0xb14
	.word	0xafa01a5e	! t0_kref+0xb10:   	fdtoi	%f30, %f23
	.word	0xe81e001d	! t0_kref+0xb14:   	ldd	[%i0 + %i5], %l4
	.word	0x81ae0a54	! t0_kref+0xb18:   	fcmpd	%fcc0, %f24, %f20
	.word	0x9722c000	! t0_kref+0xb1c:   	mulscc	%o3, %g0, %o3
	.word	0xf91fbe38	! t0_kref+0xb20:   	ldd	[%fp - 0x1c8], %f28
	.word	0x9fc00004	! t0_kref+0xb24:   	call	%g0 + %g4
	.word	0x9222800b	! t0_kref+0xb28:   	sub	%o2, %o3, %o1
	.word	0xd0a61000	! t0_kref+0xb2c:   	sta	%o0, [%i0]0x80
	.word	0x965820b7	! t0_kref+0xb30:   	smul	%g0, 0xb7, %o3
	.word	0x922d6004	! t0_kref+0xb34:   	andn	%l5, 4, %o1
	.word	0xf19f1a18	! t0_kref+0xb38:   	ldda	[%i4 + %i0]0xd0, %f24
	.word	0x86102003	! t0_kref+0xb3c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xb40:   	bne,a	_kref+0xb40
	.word	0x86a0e001	! t0_kref+0xb44:   	subcc	%g3, 1, %g3
	.word	0xd8167ff4	! t0_kref+0xb48:   	lduh	[%i1 - 0xc], %o4
	.word	0xa7a01a38	! t0_kref+0xb4c:   	fstoi	%f24, %f19
	.word	0x33800008	! t0_kref+0xb50:   	fbe,a	_kref+0xb70
	.word	0x95258000	! t0_kref+0xb54:   	mulscc	%l6, %g0, %o2
	.word	0xe900a034	! t0_kref+0xb58:   	ld	[%g2 + 0x34], %f20
	.word	0xc020a018	! t0_kref+0xb5c:   	clr	[%g2 + 0x18]
	.word	0x9940c000	! t0_kref+0xb60:   	mov	%asi, %o4
	.word	0xb9a00538	! t0_kref+0xb64:   	fsqrts	%f24, %f28
	.word	0x9625a90a	! t0_kref+0xb68:   	sub	%l6, 0x90a, %o3
	.word	0x98530015	! t0_kref+0xb6c:   	umul	%o4, %l5, %o4
	.word	0xe4086b78	! t0_kref+0xb70:   	ldub	[%g1 + 0xb78], %l2
	.word	0xa41ca00c	! t0_kref+0xb74:   	xor	%l2, 0xc, %l2
	.word	0xe4286b78	! t0_kref+0xb78:   	stb	%l2, [%g1 + 0xb78]
	.word	0x81d86b78	! t0_kref+0xb7c:   	flush	%g1 + 0xb78
	.word	0x92fd800a	! t0_kref+0xb80:   	sdivcc	%l6, %o2, %o1
	.word	0x985b000b	! t0_kref+0xb84:   	smul	%o4, %o3, %o4
	.word	0xd0fe5000	! t0_kref+0xb88:   	swapa	[%i1]0x80, %o0
	.word	0xe59e101d	! t0_kref+0xb8c:   	ldda	[%i0 + %i5]0x80, %f18
	.word	0x85828000	! t0_kref+0xb90:   	wr	%o2, %g0, %ccr
	.word	0x3d480004	! t0_kref+0xb94:   	fbule,a,pt	%fcc0, _kref+0xba4
	.word	0xd4de1000	! t0_kref+0xb98:   	ldxa	[%i0]0x80, %o2
	.word	0x81ad4ab8	! t0_kref+0xb9c:   	fcmpes	%fcc0, %f21, %f24
	.word	0x8143c000	! t0_kref+0xba0:   	stbar
2:	.word	0x945570ad	! t0_kref+0xba4:   	umul	%l5, -0xf53, %o2
	.word	0xf9066014	! t0_kref+0xba8:   	ld	[%i1 + 0x14], %f28
	.word	0xa7a01a58	! t0_kref+0xbac:   	fdtoi	%f24, %f19
	.word	0xd848a02a	! t0_kref+0xbb0:   	ldsb	[%g2 + 0x2a], %o4
	.word	0x924268e1	! t0_kref+0xbb4:   	addc	%o1, 0x8e1, %o1
	.word	0xecf01018	! t0_kref+0xbb8:   	stxa	%l6, [%g0 + %i0]0x80
	.word	0xd4080018	! t0_kref+0xbbc:   	ldub	[%g0 + %i0], %o2
	.word	0xada489da	! t0_kref+0xbc0:   	fdivd	%f18, %f26, %f22
	.word	0x972a2013	! t0_kref+0xbc4:   	sll	%o0, 0x13, %o3
	.word	0x98726386	! t0_kref+0xbc8:   	udiv	%o1, 0x386, %o4
	.word	0xe8180018	! t0_kref+0xbcc:   	ldd	[%g0 + %i0], %l4
	.word	0x81af4ab5	! t0_kref+0xbd0:   	fcmpes	%fcc0, %f29, %f21
	.word	0xb5a01912	! t0_kref+0xbd4:   	fitod	%f18, %f26
	.word	0xd440a038	! t0_kref+0xbd8:   	ldsw	[%g2 + 0x38], %o2
	.word	0xd208a028	! t0_kref+0xbdc:   	ldub	[%g2 + 0x28], %o1
	.word	0x9725ea5b	! t0_kref+0xbe0:   	mulscc	%l7, 0xa5b, %o3
	.word	0x31800005	! t0_kref+0xbe4:   	fba,a	_kref+0xbf8
	.word	0xe51fbfa0	! t0_kref+0xbe8:   	ldd	[%fp - 0x60], %f18
	.word	0xf700a01c	! t0_kref+0xbec:   	ld	[%g2 + 0x1c], %f27
	.word	0xa1a78956	! t0_kref+0xbf0:   	fmuld	%f30, %f22, %f16
	.word	0x94fb0000	! t0_kref+0xbf4:   	sdivcc	%o4, %g0, %o2
	.word	0x81ac8a50	! t0_kref+0xbf8:   	fcmpd	%fcc0, %f18, %f16
	.word	0x960b000d	! t0_kref+0xbfc:   	and	%o4, %o5, %o3
	.word	0xb5a509da	! t0_kref+0xc00:   	fdivd	%f20, %f26, %f26
	.word	0xb9a00139	! t0_kref+0xc04:   	fabss	%f25, %f28
	.word	0xa9a688bc	! t0_kref+0xc08:   	fsubs	%f26, %f28, %f20
	.word	0xd628a039	! t0_kref+0xc0c:   	stb	%o3, [%g2 + 0x39]
	.word	0xea2e3fe3	! t0_kref+0xc10:   	stb	%l5, [%i0 - 0x1d]
	.word	0x131b7fd4	! t0_kref+0xc14:   	sethi	%hi(0x6dff5000), %o1
	.word	0x2f800004	! t0_kref+0xc18:   	fbu,a	_kref+0xc28
	.word	0xd8861000	! t0_kref+0xc1c:   	lda	[%i0]0x80, %o4
	.word	0xf7067ff8	! t0_kref+0xc20:   	ld	[%i1 - 8], %f27
	.word	0x928b20a5	! t0_kref+0xc24:   	andcc	%o4, 0xa5, %o1
	.word	0x31800002	! t0_kref+0xc28:   	fba,a	_kref+0xc30
	.word	0x94a2e895	! t0_kref+0xc2c:   	subcc	%o3, 0x895, %o2
	.word	0xd4066010	! t0_kref+0xc30:   	ld	[%i1 + 0x10], %o2
	.word	0xc36e400b	! t0_kref+0xc34:   	prefetch	%i1 + %o3, 1
	.word	0xb1a689d2	! t0_kref+0xc38:   	fdivd	%f26, %f18, %f24
	.word	0x993b401a	! t0_kref+0xc3c:   	sra	%o5, %i2, %o4
	.word	0x26800003	! t0_kref+0xc40:   	bl,a	_kref+0xc4c
	.word	0x9658000b	! t0_kref+0xc44:   	smul	%g0, %o3, %o3
	.word	0xe19e9a19	! t0_kref+0xc48:   	ldda	[%i2 + %i1]0xd0, %f16
	.word	0xbda018d4	! t0_kref+0xc4c:   	fdtos	%f20, %f30
	.word	0xd86e3fe9	! t0_kref+0xc50:   	ldstub	[%i0 - 0x17], %o4
	.word	0xd02e8019	! t0_kref+0xc54:   	stb	%o0, [%i2 + %i1]
	.word	0xada01914	! t0_kref+0xc58:   	fitod	%f20, %f22
	.word	0xf93e7fe8	! t0_kref+0xc5c:   	std	%f28, [%i1 - 0x18]
	.word	0x30800008	! t0_kref+0xc60:   	ba,a	_kref+0xc80
	.word	0x81db2e25	! t0_kref+0xc64:   	flush	%o4 + 0xe25
	.word	0xb5a00032	! t0_kref+0xc68:   	fmovs	%f18, %f26
	.word	0x9482400b	! t0_kref+0xc6c:   	addcc	%o1, %o3, %o2
	.word	0x81858000	! t0_kref+0xc70:   	wr	%l6, %g0, %y
	.word	0x92f0312a	! t0_kref+0xc74:   	udivcc	%g0, -0xed6, %o1
	.word	0x26800002	! t0_kref+0xc78:   	bl,a	_kref+0xc80
	.word	0xf51e001d	! t0_kref+0xc7c:   	ldd	[%i0 + %i5], %f26
	.word	0xb7a01a3c	! t0_kref+0xc80:   	fstoi	%f28, %f27
	.word	0xfd062014	! t0_kref+0xc84:   	ld	[%i0 + 0x14], %f30
	.word	0xb1a0191d	! t0_kref+0xc88:   	fitod	%f29, %f24
	.word	0xc96e6018	! t0_kref+0xc8c:   	prefetch	%i1 + 0x18, 4
	.word	0xea680018	! t0_kref+0xc90:   	ldstub	[%g0 + %i0], %l5
	.word	0xed20a020	! t0_kref+0xc94:   	st	%f22, [%g2 + 0x20]
	.word	0x96a3400b	! t0_kref+0xc98:   	subcc	%o5, %o3, %o3
	.word	0xb5a0005a	! t0_kref+0xc9c:   	fmovd	%f26, %f26
	.word	0xa5a78958	! t0_kref+0xca0:   	fmuld	%f30, %f24, %f18
	.word	0x962a262e	! t0_kref+0xca4:   	andn	%o0, 0x62e, %o3
	.word	0x81ad8a5c	! t0_kref+0xca8:   	fcmpd	%fcc0, %f22, %f28
	.word	0x81ac0a5c	! t0_kref+0xcac:   	fcmpd	%fcc0, %f16, %f28
	.word	0xd84e6014	! t0_kref+0xcb0:   	ldsb	[%i1 + 0x14], %o4
	.word	0x81868000	! t0_kref+0xcb4:   	wr	%i2, %g0, %y
	.word	0xd25e6008	! t0_kref+0xcb8:   	ldx	[%i1 + 8], %o1
	.word	0xb1a018d4	! t0_kref+0xcbc:   	fdtos	%f20, %f24
	.word	0xb3a0053d	! t0_kref+0xcc0:   	fsqrts	%f29, %f25
	.word	0x92f0001a	! t0_kref+0xcc4:   	udivcc	%g0, %i2, %o1
	.word	0x9f414000	! t0_kref+0xcc8:   	mov	%pc, %o7
	.word	0x98f34015	! t0_kref+0xccc:   	udivcc	%o5, %l5, %o4
	.word	0x95408000	! t0_kref+0xcd0:   	mov	%ccr, %o2
	.word	0xada01a3d	! t0_kref+0xcd4:   	fstoi	%f29, %f22
	.word	0xd0ae9018	! t0_kref+0xcd8:   	stba	%o0, [%i2 + %i0]0x80
	.word	0xaba01a54	! t0_kref+0xcdc:   	fdtoi	%f20, %f21
	.word	0xec30a036	! t0_kref+0xce0:   	sth	%l6, [%g2 + 0x36]
	.word	0x968d8015	! t0_kref+0xce4:   	andcc	%l6, %l5, %o3
	.word	0xbda0053b	! t0_kref+0xce8:   	fsqrts	%f27, %f30
	.word	0x94f5b54a	! t0_kref+0xcec:   	udivcc	%l6, -0xab6, %o2
	.word	0xec2e8018	! t0_kref+0xcf0:   	stb	%l6, [%i2 + %i0]
	.word	0xe3262018	! t0_kref+0xcf4:   	st	%f17, [%i0 + 0x18]
	.word	0xf4362010	! t0_kref+0xcf8:   	sth	%i2, [%i0 + 0x10]
	.word	0xd408a022	! t0_kref+0xcfc:   	ldub	[%g2 + 0x22], %o2
	.word	0xec200018	! t0_kref+0xd00:   	st	%l6, [%g0 + %i0]
	.word	0x9fc10000	! t0_kref+0xd04:   	call	%g4
	.word	0x93408000	! t0_kref+0xd08:   	mov	%ccr, %o1
	.word	0xd648a010	! t0_kref+0xd0c:   	ldsb	[%g2 + 0x10], %o3
	.word	0xd84e2003	! t0_kref+0xd10:   	ldsb	[%i0 + 3], %o4
	.word	0xb5a588d2	! t0_kref+0xd14:   	fsubd	%f22, %f18, %f26
	.word	0x96554000	! t0_kref+0xd18:   	umul	%l5, %g0, %o3
	.word	0xd24e8019	! t0_kref+0xd1c:   	ldsb	[%i2 + %i1], %o1
	.word	0x92b021f6	! t0_kref+0xd20:   	orncc	%g0, 0x1f6, %o1
	.word	0x35800003	! t0_kref+0xd24:   	fbue,a	_kref+0xd30
	.word	0xe900a004	! t0_kref+0xd28:   	ld	[%g2 + 4], %f20
	.word	0xbda01a5a	! t0_kref+0xd2c:   	fdtoi	%f26, %f30
	.word	0xb9a018d0	! t0_kref+0xd30:   	fdtos	%f16, %f28
	.word	0x9535c008	! t0_kref+0xd34:   	srl	%l7, %o0, %o2
	.word	0x94626a65	! t0_kref+0xd38:   	subc	%o1, 0xa65, %o2
	.word	0xd448a02f	! t0_kref+0xd3c:   	ldsb	[%g2 + 0x2f], %o2
	.word	0xa7a4c835	! t0_kref+0xd40:   	fadds	%f19, %f21, %f19
	.word	0x985ac00a	! t0_kref+0xd44:   	smul	%o3, %o2, %o4
	.word	0xf19e1a1a	! t0_kref+0xd48:   	ldda	[%i0 + %i2]0xd0, %f24
	.word	0xafa01a3a	! t0_kref+0xd4c:   	fstoi	%f26, %f23
	.word	0x81ae8a5c	! t0_kref+0xd50:   	fcmpd	%fcc0, %f26, %f28
	.word	0xd440a000	! t0_kref+0xd54:   	ldsw	[%g2], %o2
	.word	0x81dd000b	! t0_kref+0xd58:   	flush	%l4 + %o3
	.word	0xe9bf1a19	! t0_kref+0xd5c:   	stda	%f20, [%i4 + %i1]0xd0
	.word	0xafa01a54	! t0_kref+0xd60:   	fdtoi	%f20, %f23
	.word	0xb1a01a5a	! t0_kref+0xd64:   	fdtoi	%f26, %f24
	.word	0x21480008	! t0_kref+0xd68:   	fbn,a,pt	%fcc0, _kref+0xd88
	.word	0x96c3401a	! t0_kref+0xd6c:   	addccc	%o5, %i2, %o3
	.word	0xa5a0003d	! t0_kref+0xd70:   	fmovs	%f29, %f18
	.word	0x3a800006	! t0_kref+0xd74:   	bcc,a	_kref+0xd8c
	.word	0x985abb8b	! t0_kref+0xd78:   	smul	%o2, -0x475, %o4
	.word	0x97358015	! t0_kref+0xd7c:   	srl	%l6, %l5, %o3
	.word	0xeef6501d	! t0_kref+0xd80:   	stxa	%l7, [%i1 + %i5]0x80
	.word	0xd608a00c	! t0_kref+0xd84:   	ldub	[%g2 + 0xc], %o3
	.word	0xd44e2019	! t0_kref+0xd88:   	ldsb	[%i0 + 0x19], %o2
	.word	0xd030a002	! t0_kref+0xd8c:   	sth	%o0, [%g2 + 2]
	.word	0xeb00a03c	! t0_kref+0xd90:   	ld	[%g2 + 0x3c], %f21
	.word	0x95222513	! t0_kref+0xd94:   	mulscc	%o0, 0x513, %o2
	.word	0xd030a018	! t0_kref+0xd98:   	sth	%o0, [%g2 + 0x18]
	.word	0x9855c00a	! t0_kref+0xd9c:   	umul	%l7, %o2, %o4
	.word	0x98837dc7	! t0_kref+0xda0:   	addcc	%o5, -0x239, %o4
	.word	0x96783e28	! t0_kref+0xda4:   	sdiv	%g0, -0x1d8, %o3
	.word	0x3b800005	! t0_kref+0xda8:   	fble,a	_kref+0xdbc
	.word	0xc87834b4	! t0_kref+0xdac:   	swap	[%g0 - 0xb4c], %g4
	.word	0xf706401c	! t0_kref+0xdb0:   	ld	[%i1 + %i4], %f27
	.word	0x98e20009	! t0_kref+0xdb4:   	subccc	%o0, %o1, %o4
	.word	0xc807bfec	! t0_kref+0xdb8:   	ld	[%fp - 0x14], %g4
	.word	0xb1a7895a	! t0_kref+0xdbc:   	fmuld	%f30, %f26, %f24
	.word	0x20800002	! t0_kref+0xdc0:   	bn,a	_kref+0xdc8
	.word	0x92c6b4ec	! t0_kref+0xdc4:   	addccc	%i2, -0xb14, %o1
	.word	0x23800007	! t0_kref+0xdc8:   	fbne,a	_kref+0xde4
	.word	0xee20a014	! t0_kref+0xdcc:   	st	%l7, [%g2 + 0x14]
	.word	0xd6263fe0	! t0_kref+0xdd0:   	st	%o3, [%i0 - 0x20]
	call	SYM(t0_subr0)
	.word	0xf900a018	! t0_kref+0xdd8:   	ld	[%g2 + 0x18], %f28
	.word	0x9612c008	! t0_kref+0xddc:   	or	%o3, %o0, %o3
	.word	0x9fc10000	! t0_kref+0xde0:   	call	%g4
	.word	0xa1a60852	! t0_kref+0xde4:   	faddd	%f24, %f18, %f16
	.word	0x001fffff	! t0_kref+0xde8:   	illtrap	0x1fffff
	.word	0xd81e401d	! t0_kref+0xdec:   	ldd	[%i1 + %i5], %o4
	.word	0x81830000	! t0_kref+0xdf0:   	wr	%o4, %g0, %y
	.word	0xe51e0000	! t0_kref+0xdf4:   	ldd	[%i0], %f18
	.word	0x20800006	! t0_kref+0xdf8:   	bn,a	_kref+0xe10
	.word	0xe5180018	! t0_kref+0xdfc:   	ldd	[%g0 + %i0], %f18
	.word	0x92fa401a	! t0_kref+0xe00:   	sdivcc	%o1, %i2, %o1
	.word	0xee28a006	! t0_kref+0xe04:   	stb	%l7, [%g2 + 6]
	.word	0xe5380018	! t0_kref+0xe08:   	std	%f18, [%g0 + %i0]
	.word	0xa9a01935	! t0_kref+0xe0c:   	fstod	%f21, %f20
	.word	0xd610a00a	! t0_kref+0xe10:   	lduh	[%g2 + 0xa], %o3
	.word	0x948e8000	! t0_kref+0xe14:   	andcc	%i2, %g0, %o2
	.word	0xb9a00538	! t0_kref+0xe18:   	fsqrts	%f24, %f28
	.word	0xf53e7fe0	! t0_kref+0xe1c:   	std	%f26, [%i1 - 0x20]
	.word	0x8182c000	! t0_kref+0xe20:   	wr	%o3, %g0, %y
	.word	0xd6b61000	! t0_kref+0xe24:   	stha	%o3, [%i0]0x80
	.word	0xd408a01d	! t0_kref+0xe28:   	ldub	[%g2 + 0x1d], %o2
	.word	0xd40e2015	! t0_kref+0xe2c:   	ldub	[%i0 + 0x15], %o2
	.word	0xf53e2000	! t0_kref+0xe30:   	std	%f26, [%i0]
	.word	0x965b645d	! t0_kref+0xe34:   	smul	%o5, 0x45d, %o3
	.word	0x9226b210	! t0_kref+0xe38:   	sub	%i2, -0xdf0, %o1
	.word	0xb5a01a5c	! t0_kref+0xe3c:   	fdtoi	%f28, %f26
	.word	0x9653000d	! t0_kref+0xe40:   	umul	%o4, %o5, %o3
	.word	0x969a7494	! t0_kref+0xe44:   	xorcc	%o1, -0xb6c, %o3
	.word	0xada5c9b9	! t0_kref+0xe48:   	fdivs	%f23, %f25, %f22
	.word	0xd6200018	! t0_kref+0xe4c:   	st	%o3, [%g0 + %i0]
	.word	0xb3a018da	! t0_kref+0xe50:   	fdtos	%f26, %f25
	.word	0x171e4193	! t0_kref+0xe54:   	sethi	%hi(0x79064c00), %o3
	.word	0x92236459	! t0_kref+0xe58:   	sub	%o5, 0x459, %o1
	.word	0xe9be9a18	! t0_kref+0xe5c:   	stda	%f20, [%i2 + %i0]0xd0
	.word	0x962a65e1	! t0_kref+0xe60:   	andn	%o1, 0x5e1, %o3
	.word	0x25800003	! t0_kref+0xe64:   	fblg,a	_kref+0xe70
	.word	0x949a0000	! t0_kref+0xe68:   	xorcc	%o0, %g0, %o2
	.word	0xb7a018d6	! t0_kref+0xe6c:   	fdtos	%f22, %f27
	.word	0x81ddb545	! t0_kref+0xe70:   	flush	%l6 - 0xabb
	.word	0x3e800006	! t0_kref+0xe74:   	bvc,a	_kref+0xe8c
	.word	0x9822a6c5	! t0_kref+0xe78:   	sub	%o2, 0x6c5, %o4
	.word	0xb9a708d6	! t0_kref+0xe7c:   	fsubd	%f28, %f22, %f28
	.word	0x943d4009	! t0_kref+0xe80:   	xnor	%l5, %o1, %o2
	.word	0x17216a34	! t0_kref+0xe84:   	sethi	%hi(0x85a8d000), %o3
	.word	0x81ae8a58	! t0_kref+0xe88:   	fcmpd	%fcc0, %f26, %f24
	.word	0x96aabd58	! t0_kref+0xe8c:   	andncc	%o2, -0x2a8, %o3
	.word	0x8143c000	! t0_kref+0xe90:   	stbar
	.word	0x81ad0a52	! t0_kref+0xe94:   	fcmpd	%fcc0, %f20, %f18
	.word	0x991ae6ab	! t0_kref+0xe98:   	tsubcctv	%o3, 0x6ab, %o4
	.word	0xa5a01a5a	! t0_kref+0xe9c:   	fdtoi	%f26, %f18
	.word	0xf1be1840	! t0_kref+0xea0:   	stda	%f24, [%i0]0xc2
	.word	0xd6080018	! t0_kref+0xea4:   	ldub	[%g0 + %i0], %o3
	.word	0x930dae50	! t0_kref+0xea8:   	tsubcc	%l6, 0xe50, %o1
	.word	0xb1a00536	! t0_kref+0xeac:   	fsqrts	%f22, %f24
!	.word	0x29490c51	! t0_kref+0xeb0:   	fbl,a,pt	%fcc0, SYM(t0_subr2)
	   	fbl,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9e006e84	! t0_kref+0xeb4:   	add	%g1, 0xe84, %o7
	.word	0xd8300019	! t0_kref+0xeb8:   	sth	%o4, [%g0 + %i1]
	.word	0x932361d2	! t0_kref+0xebc:   	mulscc	%o5, 0x1d2, %o1
	.word	0xa5a018dc	! t0_kref+0xec0:   	fdtos	%f28, %f18
	.word	0x98e3000a	! t0_kref+0xec4:   	subccc	%o4, %o2, %o4
	.word	0x25480008	! t0_kref+0xec8:   	fblg,a,pt	%fcc0, _kref+0xee8
	.word	0x961b000b	! t0_kref+0xecc:   	xor	%o4, %o3, %o3
	.word	0x925dc00d	! t0_kref+0xed0:   	smul	%l7, %o5, %o1
	call	SYM(t0_subr2)
	.word	0xb1a0005a	! t0_kref+0xed8:   	fmovd	%f26, %f24
	.word	0x9245401a	! t0_kref+0xedc:   	addc	%l5, %i2, %o1
	.word	0xb1a01a3b	! t0_kref+0xee0:   	fstoi	%f27, %f24
	.word	0x92e0001a	! t0_kref+0xee4:   	subccc	%g0, %i2, %o1
	.word	0x81ae8aba	! t0_kref+0xee8:   	fcmpes	%fcc0, %f26, %f26
	.word	0x9325800d	! t0_kref+0xeec:   	mulscc	%l6, %o5, %o1
	.word	0xe0680019	! t0_kref+0xef0:   	ldstub	[%g0 + %i1], %l0
	.word	0x96a56a4e	! t0_kref+0xef4:   	subcc	%l5, 0xa4e, %o3
	.word	0x991dab21	! t0_kref+0xef8:   	tsubcctv	%l6, 0xb21, %o4
	.word	0x81ae0a5e	! t0_kref+0xefc:   	fcmpd	%fcc0, %f24, %f30
	.word	0x9833700a	! t0_kref+0xf00:   	orn	%o5, -0xff6, %o4
	.word	0xada9405c	! t0_kref+0xf04:   	fmovdug	%fcc0, %f28, %f22
	.word	0x9822a674	! t0_kref+0xf08:   	sub	%o2, 0x674, %o4
	.word	0xada01a50	! t0_kref+0xf0c:   	fdtoi	%f16, %f22
	.word	0xd44e0000	! t0_kref+0xf10:   	ldsb	[%i0], %o2
	.word	0xfd3e2008	! t0_kref+0xf14:   	std	%f30, [%i0 + 8]
	.word	0xa5a01a34	! t0_kref+0xf18:   	fstoi	%f20, %f18
	.word	0x9665bb3b	! t0_kref+0xf1c:   	subc	%l6, -0x4c5, %o3
	.word	0x9855baa1	! t0_kref+0xf20:   	umul	%l6, -0x55f, %o4
	.word	0x942020f5	! t0_kref+0xf24:   	sub	%g0, 0xf5, %o2
	sethi	%hi(2f), %o7
	.word	0xe40be348	! t0_kref+0xf2c:   	ldub	[%o7 + 0x348], %l2
	.word	0xa41ca00c	! t0_kref+0xf30:   	xor	%l2, 0xc, %l2
	.word	0xe42be348	! t0_kref+0xf34:   	stb	%l2, [%o7 + 0x348]
	.word	0x81dbe348	! t0_kref+0xf38:   	flush	%o7 + 0x348
	.word	0xc07f0018	! t0_kref+0xf3c:   	swap	[%i4 + %i0], %g0
	.word	0x98fb001a	! t0_kref+0xf40:   	sdivcc	%o4, %i2, %o4
	.word	0xf1be5816	! t0_kref+0xf44:   	stda	%f24, [%i1 + %l6]0xc0
2:	.word	0x9932a019	! t0_kref+0xf48:   	srl	%o2, 0x19, %o4
	.word	0x8143e040	! t0_kref+0xf4c:   	membar	0x40
	.word	0xd240a020	! t0_kref+0xf50:   	ldsw	[%g2 + 0x20], %o1
	.word	0xb5a508d8	! t0_kref+0xf54:   	fsubd	%f20, %f24, %f26
	.word	0xec1e7ff0	! t0_kref+0xf58:   	ldd	[%i1 - 0x10], %l6
	.word	0xd41e6018	! t0_kref+0xf5c:   	ldd	[%i1 + 0x18], %o2
	.word	0xfd00a014	! t0_kref+0xf60:   	ld	[%g2 + 0x14], %f30
	.word	0x92aac00a	! t0_kref+0xf64:   	andncc	%o3, %o2, %o1
	.word	0x9843000d	! t0_kref+0xf68:   	addc	%o4, %o5, %o4
	.word	0x150446da	! t0_kref+0xf6c:   	sethi	%hi(0x111b6800), %o2
	.word	0xb5a749bd	! t0_kref+0xf70:   	fdivs	%f29, %f29, %f26
	.word	0x9fc00004	! t0_kref+0xf74:   	call	%g0 + %g4
	.word	0x97418000	! t0_kref+0xf78:   	mov	%fprs, %o3
	.word	0xb5a01a5c	! t0_kref+0xf7c:   	fdtoi	%f28, %f26
	.word	0xb5a01114	! t0_kref+0xf80:   	fxtod	%f20, %f26
	.word	0x81da4018	! t0_kref+0xf84:   	flush	%o1 + %i0
	.word	0xaba018de	! t0_kref+0xf88:   	fdtos	%f30, %f21
	.word	0xb9a688d4	! t0_kref+0xf8c:   	fsubd	%f26, %f20, %f28
	.word	0xa5a788d2	! t0_kref+0xf90:   	fsubd	%f30, %f18, %f18
	.word	0xd808a03d	! t0_kref+0xf94:   	ldub	[%g2 + 0x3d], %o4
	.word	0x85834000	! t0_kref+0xf98:   	wr	%o5, %g0, %ccr
	.word	0xec1e3ff8	! t0_kref+0xf9c:   	ldd	[%i0 - 8], %l6
	.word	0x948b29d1	! t0_kref+0xfa0:   	andcc	%o4, 0x9d1, %o2
	.word	0xd856001b	! t0_kref+0xfa4:   	ldsh	[%i0 + %i3], %o4
	.word	0x985022e1	! t0_kref+0xfa8:   	umul	%g0, 0x2e1, %o4
	.word	0xa9a01a37	! t0_kref+0xfac:   	fstoi	%f23, %f20
	.word	0xed6e7fe8	! t0_kref+0xfb0:   	prefetch	%i1 - 0x18, 22
	.word	0x8143c000	! t0_kref+0xfb4:   	stbar
	.word	0x98a2ecd2	! t0_kref+0xfb8:   	subcc	%o3, 0xcd2, %o4
	.word	0xb7a00039	! t0_kref+0xfbc:   	fmovs	%f25, %f27
	.word	0xd41f4019	! t0_kref+0xfc0:   	ldd	[%i5 + %i1], %o2
	.word	0x24800004	! t0_kref+0xfc4:   	ble,a	_kref+0xfd4
	.word	0xee2e7ff9	! t0_kref+0xfc8:   	stb	%l7, [%i1 - 7]
	.word	0xd40e6016	! t0_kref+0xfcc:   	ldub	[%i1 + 0x16], %o2
	.word	0x98d5e652	! t0_kref+0xfd0:   	umulcc	%l7, 0x652, %o4
	.word	0x98aa3d00	! t0_kref+0xfd4:   	andncc	%o0, -0x300, %o4
	.word	0x96524009	! t0_kref+0xfd8:   	umul	%o1, %o1, %o3
	.word	0x99037e1d	! t0_kref+0xfdc:   	taddcc	%o5, -0x1e3, %o4
	.word	0x98080000	! t0_kref+0xfe0:   	and	%g0, %g0, %o4
	.word	0x98580015	! t0_kref+0xfe4:   	smul	%g0, %l5, %o4
	.word	0xb9a588de	! t0_kref+0xfe8:   	fsubd	%f22, %f30, %f28
	.word	0x83414000	! t0_kref+0xfec:   	mov	%pc, %g1
	.word	0x3d800002	! t0_kref+0xff0:   	fbule,a	_kref+0xff8
	.word	0xe76e401b	! t0_kref+0xff4:   	prefetch	%i1 + %i3, 19
	.word	0x968b2931	! t0_kref+0xff8:   	andcc	%o4, 0x931, %o3
	.word	0x95418000	! t0_kref+0xffc:   	mov	%fprs, %o2
	.word	0x952379a5	! t0_kref+0x1000:   	mulscc	%o5, -0x65b, %o2
	.word	0xbda01a5a	! t0_kref+0x1004:   	fdtoi	%f26, %f30
	.word	0x81ae0a54	! t0_kref+0x1008:   	fcmpd	%fcc0, %f24, %f20
	.word	0x94658016	! t0_kref+0x100c:   	subc	%l6, %l6, %o2
	.word	0x92a68017	! t0_kref+0x1010:   	subcc	%i2, %l7, %o1
	.word	0x947af8dd	! t0_kref+0x1014:   	sdiv	%o3, -0x723, %o2
	.word	0x81ac4abc	! t0_kref+0x1018:   	fcmpes	%fcc0, %f17, %f28
	.word	0x96bb0017	! t0_kref+0x101c:   	xnorcc	%o4, %l7, %o3
	.word	0xd24e3fe8	! t0_kref+0x1020:   	ldsb	[%i0 - 0x18], %o1
	.word	0xd4ff1019	! t0_kref+0x1024:   	swapa	[%i4 + %i1]0x80, %o2
	.word	0x949a3cae	! t0_kref+0x1028:   	xorcc	%o0, -0x352, %o2
	.word	0xbda00035	! t0_kref+0x102c:   	fmovs	%f21, %f30
	.word	0xb5a688d4	! t0_kref+0x1030:   	fsubd	%f26, %f20, %f26
	.word	0x81da400a	! t0_kref+0x1034:   	flush	%o1 + %o2
	.word	0xd406001c	! t0_kref+0x1038:   	ld	[%i0 + %i4], %o2
	.word	0xa9a00532	! t0_kref+0x103c:   	fsqrts	%f18, %f20
	.word	0xd6563ff4	! t0_kref+0x1040:   	ldsh	[%i0 - 0xc], %o3
	.word	0x94e68015	! t0_kref+0x1044:   	subccc	%i2, %l5, %o2
	.word	0x2d800002	! t0_kref+0x1048:   	fbg,a	_kref+0x1050
	.word	0xada58950	! t0_kref+0x104c:   	fmuld	%f22, %f16, %f22
	.word	0x942afb64	! t0_kref+0x1050:   	andn	%o3, -0x49c, %o2
	.word	0x31800008	! t0_kref+0x1054:   	fba,a	_kref+0x1074
	.word	0xc0264000	! t0_kref+0x1058:   	clr	[%i1]
	.word	0x81de292c	! t0_kref+0x105c:   	flush	%i0 + 0x92c
	.word	0x98f570f2	! t0_kref+0x1060:   	udivcc	%l5, -0xf0e, %o4
	.word	0x94380017	! t0_kref+0x1064:   	xnor	%g0, %l7, %o2
	.word	0x81af8a5a	! t0_kref+0x1068:   	fcmpd	%fcc0, %f30, %f26
	.word	0xa1a70850	! t0_kref+0x106c:   	faddd	%f28, %f16, %f16
	.word	0x8143c000	! t0_kref+0x1070:   	stbar
	.word	0xbda01912	! t0_kref+0x1074:   	fitod	%f18, %f30
	.word	0x95230000	! t0_kref+0x1078:   	mulscc	%o4, %g0, %o2
	.word	0x942d6e8f	! t0_kref+0x107c:   	andn	%l5, 0xe8f, %o2
	.word	0x928d4008	! t0_kref+0x1080:   	andcc	%l5, %o0, %o1
	.word	0x9222ee02	! t0_kref+0x1084:   	sub	%o3, 0xe02, %o1
	.word	0xf1be184c	! t0_kref+0x1088:   	stda	%f24, [%i0 + %o4]0xc2
	.word	0xd8080018	! t0_kref+0x108c:   	ldub	[%g0 + %i0], %o4
	.word	0x92d33966	! t0_kref+0x1090:   	umulcc	%o4, -0x69a, %o1
	.word	0x8143c000	! t0_kref+0x1094:   	stbar
	.word	0xe56e2010	! t0_kref+0x1098:   	prefetch	%i0 + 0x10, 18
	.word	0xd8be101d	! t0_kref+0x109c:   	stda	%o4, [%i0 + %i5]0x80
	.word	0x928b2049	! t0_kref+0x10a0:   	andcc	%o4, 0x49, %o1
	.word	0xd6480019	! t0_kref+0x10a4:   	ldsb	[%g0 + %i1], %o3
	.word	0x973a001a	! t0_kref+0x10a8:   	sra	%o0, %i2, %o3
	.word	0x35800003	! t0_kref+0x10ac:   	fbue,a	_kref+0x10b8
	.word	0xb7a7893c	! t0_kref+0x10b0:   	fmuls	%f30, %f28, %f27
	.word	0xe7ee501c	! t0_kref+0x10b4:   	prefetcha	%i1 + %i4, 19
	.word	0xb5a688d4	! t0_kref+0x10b8:   	fsubd	%f26, %f20, %f26
	.word	0x98e2c017	! t0_kref+0x10bc:   	subccc	%o3, %l7, %o4
	.word	0x96e54016	! t0_kref+0x10c0:   	subccc	%l5, %l6, %o3
	.word	0xbda58936	! t0_kref+0x10c4:   	fmuls	%f22, %f22, %f30
	.word	0x94dac00d	! t0_kref+0x10c8:   	smulcc	%o3, %o5, %o2
	.word	0x2e800001	! t0_kref+0x10cc:   	bvs,a	_kref+0x10d0
	.word	0x8143c000	! t0_kref+0x10d0:   	stbar
	.word	0xd200a028	! t0_kref+0x10d4:   	ld	[%g2 + 0x28], %o1
	.word	0x9473766e	! t0_kref+0x10d8:   	udiv	%o5, -0x992, %o2
	.word	0xfb00a024	! t0_kref+0x10dc:   	ld	[%g2 + 0x24], %f29
	.word	0x9822c00b	! t0_kref+0x10e0:   	sub	%o3, %o3, %o4
	.word	0x95324008	! t0_kref+0x10e4:   	srl	%o1, %o0, %o2
	.word	0x92dd7399	! t0_kref+0x10e8:   	smulcc	%l5, -0xc67, %o1
	.word	0x92d83e77	! t0_kref+0x10ec:   	smulcc	%g0, -0x189, %o1
	.word	0x3e800003	! t0_kref+0x10f0:   	bvc,a	_kref+0x10fc
	.word	0x9665c000	! t0_kref+0x10f4:   	subc	%l7, %g0, %o3
	.word	0x9825ee3b	! t0_kref+0x10f8:   	sub	%l7, 0xe3b, %o4
	.word	0x8143c000	! t0_kref+0x10fc:   	stbar
	.word	0x9485c017	! t0_kref+0x1100:   	addcc	%l7, %l7, %o2
	.word	0x972339dd	! t0_kref+0x1104:   	mulscc	%o4, -0x623, %o3
	.word	0xda20a014	! t0_kref+0x1108:   	st	%o5, [%g2 + 0x14]
	.word	0x34800008	! t0_kref+0x110c:   	bg,a	_kref+0x112c
	.word	0xd828a037	! t0_kref+0x1110:   	stb	%o4, [%g2 + 0x37]
	.word	0xd440a018	! t0_kref+0x1114:   	ldsw	[%g2 + 0x18], %o2
	.word	0x9632c01a	! t0_kref+0x1118:   	orn	%o3, %i2, %o3
	.word	0x9416801a	! t0_kref+0x111c:   	or	%i2, %i2, %o2
	.word	0xd430a038	! t0_kref+0x1120:   	sth	%o2, [%g2 + 0x38]
	.word	0x97400000	! t0_kref+0x1124:   	mov	%y, %o3
	.word	0x94a2a45a	! t0_kref+0x1128:   	subcc	%o2, 0x45a, %o2
	.word	0xada01933	! t0_kref+0x112c:   	fstod	%f19, %f22
	.word	0x943aa1a7	! t0_kref+0x1130:   	xnor	%o2, 0x1a7, %o2
	.word	0xe9be5a1a	! t0_kref+0x1134:   	stda	%f20, [%i1 + %i2]0xd0
	.word	0x9735a008	! t0_kref+0x1138:   	srl	%l6, 0x8, %o3
	.word	0xf3a6101c	! t0_kref+0x113c:   	sta	%f25, [%i0 + %i4]0x80
	.word	0x98da39a2	! t0_kref+0x1140:   	smulcc	%o0, -0x65e, %o4
	.word	0xd0266010	! t0_kref+0x1144:   	st	%o0, [%i1 + 0x10]
	.word	0x81ae8a34	! t0_kref+0x1148:   	fcmps	%fcc0, %f26, %f20
	.word	0xed00a004	! t0_kref+0x114c:   	ld	[%g2 + 4], %f22
	.word	0x98a58000	! t0_kref+0x1150:   	subcc	%l6, %g0, %o4
	.word	0xd64e401a	! t0_kref+0x1154:   	ldsb	[%i1 + %i2], %o3
	.word	0xefa01018	! t0_kref+0x1158:   	sta	%f23, [%g0 + %i0]0x80
	.word	0xa9a01a32	! t0_kref+0x115c:   	fstoi	%f18, %f20
	.word	0x9fc00004	! t0_kref+0x1160:   	call	%g0 + %g4
	.word	0xd240a034	! t0_kref+0x1164:   	ldsw	[%g2 + 0x34], %o1
	.word	0xd030a01c	! t0_kref+0x1168:   	sth	%o0, [%g2 + 0x1c]
	.word	0x81dc4015	! t0_kref+0x116c:   	flush	%l1 + %l5
	.word	0xe81e3ff8	! t0_kref+0x1170:   	ldd	[%i0 - 8], %l4
	.word	0x9fc00004	! t0_kref+0x1174:   	call	%g0 + %g4
	.word	0xd83e3fe8	! t0_kref+0x1178:   	std	%o4, [%i0 - 0x18]
	.word	0x98f3000b	! t0_kref+0x117c:   	udivcc	%o4, %o3, %o4
	.word	0x96a30016	! t0_kref+0x1180:   	subcc	%o4, %l6, %o3
	.word	0xaba018d4	! t0_kref+0x1184:   	fdtos	%f20, %f21
	.word	0x9923400b	! t0_kref+0x1188:   	mulscc	%o5, %o3, %o4
	.word	0x86102002	! t0_kref+0x118c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1190:   	bne,a	_kref+0x1190
	.word	0x86a0e001	! t0_kref+0x1194:   	subcc	%g3, 1, %g3
	.word	0x8143c000	! t0_kref+0x1198:   	stbar
	.word	0x9fc00004	! t0_kref+0x119c:   	call	%g0 + %g4
	.word	0x96e6800d	! t0_kref+0x11a0:   	subccc	%i2, %o5, %o3
	.word	0x9726800a	! t0_kref+0x11a4:   	mulscc	%i2, %o2, %o3
	.word	0x9850000c	! t0_kref+0x11a8:   	umul	%g0, %o4, %o4
	.word	0xd62e6008	! t0_kref+0x11ac:   	stb	%o3, [%i1 + 8]
	.word	0xbda4cd31	! t0_kref+0x11b0:   	fsmuld	%f19, %f17, %f30
	.word	0xec30a03a	! t0_kref+0x11b4:   	sth	%l6, [%g2 + 0x3a]
	.word	0x949d800a	! t0_kref+0x11b8:   	xorcc	%l6, %o2, %o2
	.word	0x93258000	! t0_kref+0x11bc:   	mulscc	%l6, %g0, %o1
	.word	0x94a30000	! t0_kref+0x11c0:   	subcc	%o4, %g0, %o2
	.word	0x93400000	! t0_kref+0x11c4:   	mov	%y, %o1
	.word	0x19391cde	! t0_kref+0x11c8:   	sethi	%hi(0xe4737800), %o4
	.word	0xd628a014	! t0_kref+0x11cc:   	stb	%o3, [%g2 + 0x14]
	.word	0xd640a030	! t0_kref+0x11d0:   	ldsw	[%g2 + 0x30], %o3
	.word	0x945d4009	! t0_kref+0x11d4:   	smul	%l5, %o1, %o2
	.word	0xb3a5093a	! t0_kref+0x11d8:   	fmuls	%f20, %f26, %f25
	.word	0x98a574a5	! t0_kref+0x11dc:   	subcc	%l5, -0xb5b, %o4
	.word	0x3e480001	! t0_kref+0x11e0:   	bvc,a,pt	%icc, _kref+0x11e4
	.word	0x9662000b	! t0_kref+0x11e4:   	subc	%o0, %o3, %o3
	.word	0x983dc01a	! t0_kref+0x11e8:   	xnor	%l7, %i2, %o4
	.word	0xee2e7ff1	! t0_kref+0x11ec:   	stb	%l7, [%i1 - 0xf]
	.word	0xb5a70958	! t0_kref+0x11f0:   	fmuld	%f28, %f24, %f26
	.word	0xc036c018	! t0_kref+0x11f4:   	clrh	[%i3 + %i0]
	.word	0xb5a709de	! t0_kref+0x11f8:   	fdivd	%f28, %f30, %f26
	.word	0xb1a68d39	! t0_kref+0x11fc:   	fsmuld	%f26, %f25, %f24
	.word	0x9265c00d	! t0_kref+0x1200:   	subc	%l7, %o5, %o1
	.word	0x92fa000d	! t0_kref+0x1204:   	sdivcc	%o0, %o5, %o1
	.word	0xd848a02c	! t0_kref+0x1208:   	ldsb	[%g2 + 0x2c], %o4
	.word	0xb9a0103b	! t0_kref+0x120c:   	fstox	%f27, %f28
	.word	0x972d800a	! t0_kref+0x1210:   	sll	%l6, %o2, %o3
	.word	0x94554016	! t0_kref+0x1214:   	umul	%l5, %l6, %o2
	.word	0x92882bfa	! t0_kref+0x1218:   	andcc	%g0, 0xbfa, %o1
	.word	0x86102004	! t0_kref+0x121c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1220:   	bne,a	_kref+0x1220
	.word	0x86a0e001	! t0_kref+0x1224:   	subcc	%g3, 1, %g3
	.word	0xd608a01b	! t0_kref+0x1228:   	ldub	[%g2 + 0x1b], %o3
	.word	0x94f30016	! t0_kref+0x122c:   	udivcc	%o4, %l6, %o2
	.word	0xb5a0191c	! t0_kref+0x1230:   	fitod	%f28, %f26
	.word	0xd4080018	! t0_kref+0x1234:   	ldub	[%g0 + %i0], %o2
	.word	0xf1060000	! t0_kref+0x1238:   	ld	[%i0], %f24
	.word	0x98700000	! t0_kref+0x123c:   	udiv	%g0, %g0, %o4
	.word	0x94158017	! t0_kref+0x1240:   	or	%l6, %l7, %o2
	.word	0xee262018	! t0_kref+0x1244:   	st	%l7, [%i0 + 0x18]
	.word	0xedee501a	! t0_kref+0x1248:   	prefetcha	%i1 + %i2, 22
	.word	0x9652a3d4	! t0_kref+0x124c:   	umul	%o2, 0x3d4, %o3
	.word	0x94e3369b	! t0_kref+0x1250:   	subccc	%o4, -0x965, %o2
	.word	0x94fae5c0	! t0_kref+0x1254:   	sdivcc	%o3, 0x5c0, %o2
	.word	0x8143c000	! t0_kref+0x1258:   	stbar
	.word	0x993dc000	! t0_kref+0x125c:   	sra	%l7, %g0, %o4
	.word	0x8610200d	! t0_kref+0x1260:   	mov	0xd, %g3
	.word	0x86a0e001	! t0_kref+0x1264:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x1268:   	be,a	_kref+0x12bc
	.word	0xd84e8018	! t0_kref+0x126c:   	ldsb	[%i2 + %i0], %o4
	.word	0x81ae0a56	! t0_kref+0x1270:   	fcmpd	%fcc0, %f24, %f22
	.word	0xd286101c	! t0_kref+0x1274:   	lda	[%i0 + %i4]0x80, %o1
	.word	0xd600a00c	! t0_kref+0x1278:   	ld	[%g2 + 0xc], %o3
	.word	0x92dd400b	! t0_kref+0x127c:   	smulcc	%l5, %o3, %o1
	.word	0x98268016	! t0_kref+0x1280:   	sub	%i2, %l6, %o4
	.word	0x9fc00004	! t0_kref+0x1284:   	call	%g0 + %g4
	.word	0x92e33d42	! t0_kref+0x1288:   	subccc	%o4, -0x2be, %o1
	.word	0x980a400b	! t0_kref+0x128c:   	and	%o1, %o3, %o4
	.word	0x94a02741	! t0_kref+0x1290:   	subcc	%g0, 0x741, %o2
	.word	0xd4367ffc	! t0_kref+0x1294:   	sth	%o2, [%i1 - 4]
	.word	0xd80e8019	! t0_kref+0x1298:   	ldub	[%i2 + %i1], %o4
	.word	0xb9a488d4	! t0_kref+0x129c:   	fsubd	%f18, %f20, %f28
	.word	0xa9a688d4	! t0_kref+0x12a0:   	fsubd	%f26, %f20, %f20
	.word	0x96bdac5e	! t0_kref+0x12a4:   	xnorcc	%l6, 0xc5e, %o3
	.word	0xaba01a5a	! t0_kref+0x12a8:   	fdtoi	%f26, %f21
	.word	0x81ae0ab5	! t0_kref+0x12ac:   	fcmpes	%fcc0, %f24, %f21
	.word	0x96e23e88	! t0_kref+0x12b0:   	subccc	%o0, -0x178, %o3
	.word	0x9458378b	! t0_kref+0x12b4:   	smul	%g0, -0x875, %o2
	.word	0x98f3400a	! t0_kref+0x12b8:   	udivcc	%o5, %o2, %o4
	.word	0xa1a488dc	! t0_kref+0x12bc:   	fsubd	%f18, %f28, %f16
	.word	0xa9a4095c	! t0_kref+0x12c0:   	fmuld	%f16, %f28, %f20
	.word	0x37800005	! t0_kref+0x12c4:   	fbge,a	_kref+0x12d8
	.word	0x94fa6bb5	! t0_kref+0x12c8:   	sdivcc	%o1, 0xbb5, %o2
	.word	0x9332400a	! t0_kref+0x12cc:   	srl	%o1, %o2, %o1
	.word	0xb7a0013a	! t0_kref+0x12d0:   	fabss	%f26, %f27
	.word	0x925eb6b8	! t0_kref+0x12d4:   	smul	%i2, -0x948, %o1
	.word	0x98134015	! t0_kref+0x12d8:   	or	%o5, %l5, %o4
	.word	0xd448a02b	! t0_kref+0x12dc:   	ldsb	[%g2 + 0x2b], %o2
	.word	0xa9a01a31	! t0_kref+0x12e0:   	fstoi	%f17, %f20
	.word	0xd840a034	! t0_kref+0x12e4:   	ldsw	[%g2 + 0x34], %o4
	.word	0x94f5e7d7	! t0_kref+0x12e8:   	udivcc	%l7, 0x7d7, %o2
	.word	0xd83f4019	! t0_kref+0x12ec:   	std	%o4, [%i5 + %i1]
	.word	0xec280019	! t0_kref+0x12f0:   	stb	%l6, [%g0 + %i1]
	.word	0xd82e2006	! t0_kref+0x12f4:   	stb	%o4, [%i0 + 6]
	.word	0x31480005	! t0_kref+0x12f8:   	fba,a,pt	%fcc0, _kref+0x130c
	.word	0x98f2c00c	! t0_kref+0x12fc:   	udivcc	%o3, %o4, %o4
	.word	0x9242c00a	! t0_kref+0x1300:   	addc	%o3, %o2, %o1
	.word	0xfb20a020	! t0_kref+0x1304:   	st	%f29, [%g2 + 0x20]
	.word	0x96debf4f	! t0_kref+0x1308:   	smulcc	%i2, -0xb1, %o3
	.word	0x92aac00d	! t0_kref+0x130c:   	andncc	%o3, %o5, %o1
	.word	0x96c6800b	! t0_kref+0x1310:   	addccc	%i2, %o3, %o3
	.word	0xe3e65008	! t0_kref+0x1314:   	casa	[%i1]0x80, %o0, %l1
	.word	0x81db0004	! t0_kref+0x1318:   	flush	%o4 + %g4
	.word	0x96b2c009	! t0_kref+0x131c:   	orncc	%o3, %o1, %o3
!	.word	0x2e490b35	! t0_kref+0x1320:   	bvs,a,pt	%icc, SYM(t0_subr2)
	   	bvs,a,pt	%icc, SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x1324:   	mov	%pc, %o7
	.word	0x94454016	! t0_kref+0x1328:   	addc	%l5, %l6, %o2
	.word	0x9933600f	! t0_kref+0x132c:   	srl	%o5, 0xf, %o4
	.word	0x81af0ab6	! t0_kref+0x1330:   	fcmpes	%fcc0, %f28, %f22
	.word	0x945a0016	! t0_kref+0x1334:   	smul	%o0, %l6, %o2
	.word	0x932ac01a	! t0_kref+0x1338:   	sll	%o3, %i2, %o1
	.word	0xbba018d6	! t0_kref+0x133c:   	fdtos	%f22, %f29
	.word	0x20800008	! t0_kref+0x1340:   	bn,a	_kref+0x1360
	.word	0xf9bf5019	! t0_kref+0x1344:   	stda	%f28, [%i5 + %i1]0x80
	.word	0xb5a488d2	! t0_kref+0x1348:   	fsubd	%f18, %f18, %f26
	.word	0xb3a01a32	! t0_kref+0x134c:   	fstoi	%f18, %f25
	.word	0xf428a008	! t0_kref+0x1350:   	stb	%i2, [%g2 + 8]
	.word	0x92de8017	! t0_kref+0x1354:   	smulcc	%i2, %l7, %o1
	.word	0xd26e4000	! t0_kref+0x1358:   	ldstub	[%i1], %o1
	.word	0xc0a71018	! t0_kref+0x135c:   	sta	%g0, [%i4 + %i0]0x80
	.word	0x9876b8af	! t0_kref+0x1360:   	udiv	%i2, -0x751, %o4
	.word	0x23800008	! t0_kref+0x1364:   	fbne,a	_kref+0x1384
	.word	0xa5a708d8	! t0_kref+0x1368:   	fsubd	%f28, %f24, %f18
	.word	0x25800007	! t0_kref+0x136c:   	fblg,a	_kref+0x1388
	.word	0x94bd4015	! t0_kref+0x1370:   	xnorcc	%l5, %l5, %o2
	.word	0xd7e61016	! t0_kref+0x1374:   	casa	[%i0]0x80, %l6, %o3
	.word	0x81824000	! t0_kref+0x1378:   	wr	%o1, %g0, %y
	.word	0x98332800	! t0_kref+0x137c:   	orn	%o4, 0x800, %o4
	.word	0x93408000	! t0_kref+0x1380:   	mov	%ccr, %o1
	.word	0xd6363fee	! t0_kref+0x1384:   	sth	%o3, [%i0 - 0x12]
	.word	0x9642800a	! t0_kref+0x1388:   	addc	%o2, %o2, %o3
	.word	0xd2467ff8	! t0_kref+0x138c:   	ldsw	[%i1 - 8], %o1
	.word	0x85803b2e	! t0_kref+0x1390:   	mov	0xfffffb2e, %ccr
	.word	0x3c800008	! t0_kref+0x1394:   	bpos,a	_kref+0x13b4
	.word	0xbda018dc	! t0_kref+0x1398:   	fdtos	%f28, %f30
	.word	0xb7a01a39	! t0_kref+0x139c:   	fstoi	%f25, %f27
	.word	0xa5a508de	! t0_kref+0x13a0:   	fsubd	%f20, %f30, %f18
	.word	0xa5a01935	! t0_kref+0x13a4:   	fstod	%f21, %f18
	.word	0x96537a26	! t0_kref+0x13a8:   	umul	%o5, -0x5da, %o3
	.word	0x20800004	! t0_kref+0x13ac:   	bn,a	_kref+0x13bc
	.word	0xd648a000	! t0_kref+0x13b0:   	ldsb	[%g2], %o3
	.word	0xb3a00033	! t0_kref+0x13b4:   	fmovs	%f19, %f25
	.word	0xd810a036	! t0_kref+0x13b8:   	lduh	[%g2 + 0x36], %o4
	.word	0xd410a018	! t0_kref+0x13bc:   	lduh	[%g2 + 0x18], %o2
	.word	0x933d600f	! t0_kref+0x13c0:   	sra	%l5, 0xf, %o1
	.word	0x98d24000	! t0_kref+0x13c4:   	umulcc	%o1, %g0, %o4
	.word	0xa3a00132	! t0_kref+0x13c8:   	fabss	%f18, %f17
	.word	0xbda788de	! t0_kref+0x13cc:   	fsubd	%f30, %f30, %f30
	.word	0x9fc00004	! t0_kref+0x13d0:   	call	%g0 + %g4
	.word	0x981d8016	! t0_kref+0x13d4:   	xor	%l6, %l6, %o4
	.word	0xb3a018d0	! t0_kref+0x13d8:   	fdtos	%f16, %f25
	.word	0xec267ffc	! t0_kref+0x13dc:   	st	%l6, [%i1 - 4]
	.word	0xee2e001a	! t0_kref+0x13e0:   	stb	%l7, [%i0 + %i2]
	.word	0x94fa0000	! t0_kref+0x13e4:   	sdivcc	%o0, %g0, %o2
	.word	0x95356017	! t0_kref+0x13e8:   	srl	%l5, 0x17, %o2
	.word	0x92258017	! t0_kref+0x13ec:   	sub	%l6, %l7, %o1
	.word	0x9458001a	! t0_kref+0x13f0:   	smul	%g0, %i2, %o2
	.word	0xb9a01912	! t0_kref+0x13f4:   	fitod	%f18, %f28
	.word	0x001fffff	! t0_kref+0x13f8:   	illtrap	0x1fffff
	.word	0x81accab7	! t0_kref+0x13fc:   	fcmpes	%fcc0, %f19, %f23
	.word	0x953b6005	! t0_kref+0x1400:   	sra	%o5, 0x5, %o2
	.word	0x988eb421	! t0_kref+0x1404:   	andcc	%i2, -0xbdf, %o4
	.word	0xd8470019	! t0_kref+0x1408:   	ldsw	[%i4 + %i1], %o4
	.word	0x94d83003	! t0_kref+0x140c:   	smulcc	%g0, -0xffd, %o2
	.word	0x9fc00004	! t0_kref+0x1410:   	call	%g0 + %g4
	.word	0xdaa6501c	! t0_kref+0x1414:   	sta	%o5, [%i1 + %i4]0x80
	call	SYM(t0_subr1)
	.word	0x9672ad11	! t0_kref+0x141c:   	udiv	%o2, 0xd11, %o3
	.word	0xb1a40952	! t0_kref+0x1420:   	fmuld	%f16, %f18, %f24
	.word	0xec1e7fe0	! t0_kref+0x1424:   	ldd	[%i1 - 0x20], %l6
	.word	0x8143c000	! t0_kref+0x1428:   	stbar
	.word	0xb1a00535	! t0_kref+0x142c:   	fsqrts	%f21, %f24
	.word	0xf51e6010	! t0_kref+0x1430:   	ldd	[%i1 + 0x10], %f26
	.word	0xd440a014	! t0_kref+0x1434:   	ldsw	[%g2 + 0x14], %o2
	.word	0x98fa4016	! t0_kref+0x1438:   	sdivcc	%o1, %l6, %o4
	.word	0x001fffff	! t0_kref+0x143c:   	illtrap	0x1fffff
	.word	0xd608a018	! t0_kref+0x1440:   	ldub	[%g2 + 0x18], %o3
	.word	0x9435c00b	! t0_kref+0x1444:   	orn	%l7, %o3, %o2
	.word	0x001fffff	! t0_kref+0x1448:   	illtrap	0x1fffff
	.word	0x8182c000	! t0_kref+0x144c:   	wr	%o3, %g0, %y
	.word	0x93382005	! t0_kref+0x1450:   	sra	%g0, 0x5, %o1
	.word	0x22800004	! t0_kref+0x1454:   	be,a	_kref+0x1464
	.word	0x9616800b	! t0_kref+0x1458:   	or	%i2, %o3, %o3
!	.word	0x2f490ae6	! t0_kref+0x145c:   	fbu,a,pt	%fcc0, SYM(t0_subr2)
	   	fbu,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9e006470	! t0_kref+0x1460:   	add	%g1, 0x470, %o7
	.word	0xe700a024	! t0_kref+0x1464:   	ld	[%g2 + 0x24], %f19
	.word	0x949e8009	! t0_kref+0x1468:   	xorcc	%i2, %o1, %o2
	.word	0x38800003	! t0_kref+0x146c:   	bgu,a	_kref+0x1478
	.word	0x96e37e00	! t0_kref+0x1470:   	subccc	%o5, -0x200, %o3
	.word	0xb5a01114	! t0_kref+0x1474:   	fxtod	%f20, %f26
	.word	0x81ae0abb	! t0_kref+0x1478:   	fcmpes	%fcc0, %f24, %f27
	.word	0xd44e0000	! t0_kref+0x147c:   	ldsb	[%i0], %o2
	.word	0x96b5801a	! t0_kref+0x1480:   	orncc	%l6, %i2, %o3
	.word	0x9402fb9d	! t0_kref+0x1484:   	add	%o3, -0x463, %o2
	.word	0x2e800005	! t0_kref+0x1488:   	bvs,a	_kref+0x149c
	.word	0xfb067ff0	! t0_kref+0x148c:   	ld	[%i1 - 0x10], %f29
	.word	0xd8270018	! t0_kref+0x1490:   	st	%o4, [%i4 + %i0]
	.word	0x948d69e3	! t0_kref+0x1494:   	andcc	%l5, 0x9e3, %o2
	.word	0x95220008	! t0_kref+0x1498:   	mulscc	%o0, %o0, %o2
	.word	0x37480003	! t0_kref+0x149c:   	fbge,a,pt	%fcc0, _kref+0x14a8
	.word	0xd8066000	! t0_kref+0x14a0:   	ld	[%i1], %o4
	.word	0xbda588d4	! t0_kref+0x14a4:   	fsubd	%f22, %f20, %f30
	.word	0xada00154	! t0_kref+0x14a8:   	fabsd	%f20, %f22
	.word	0xb5a0191e	! t0_kref+0x14ac:   	fitod	%f30, %f26
	.word	0x9282ea33	! t0_kref+0x14b0:   	addcc	%o3, 0xa33, %o1
	.word	0x92e5e27e	! t0_kref+0x14b4:   	subccc	%l7, 0x27e, %o1
	.word	0x94fb400c	! t0_kref+0x14b8:   	sdivcc	%o5, %o4, %o2
	.word	0x3f800005	! t0_kref+0x14bc:   	fbo,a	_kref+0x14d0
	.word	0xd60e3ffa	! t0_kref+0x14c0:   	ldub	[%i0 - 6], %o3
	.word	0xef070018	! t0_kref+0x14c4:   	ld	[%i4 + %i0], %f23
	.word	0xc02e401a	! t0_kref+0x14c8:   	clrb	[%i1 + %i2]
	.word	0xada6095a	! t0_kref+0x14cc:   	fmuld	%f24, %f26, %f22
	.word	0xda367fec	! t0_kref+0x14d0:   	sth	%o5, [%i1 - 0x14]
	.word	0x933ae017	! t0_kref+0x14d4:   	sra	%o3, 0x17, %o1
	.word	0x9850001a	! t0_kref+0x14d8:   	umul	%g0, %i2, %o4
	.word	0xec1e3fe8	! t0_kref+0x14dc:   	ldd	[%i0 - 0x18], %l6
	.word	0xa9a50d37	! t0_kref+0x14e0:   	fsmuld	%f20, %f23, %f20
	.word	0xd608a007	! t0_kref+0x14e4:   	ldub	[%g2 + 7], %o3
	.word	0xd656001b	! t0_kref+0x14e8:   	ldsh	[%i0 + %i3], %o3
	.word	0xe9865000	! t0_kref+0x14ec:   	lda	[%i1]0x80, %f20
	.word	0xd83e3ff8	! t0_kref+0x14f0:   	std	%o4, [%i0 - 8]
	.word	0xd8363fe8	! t0_kref+0x14f4:   	sth	%o4, [%i0 - 0x18]
	.word	0xf1be1889	! t0_kref+0x14f8:   	stda	%f24, [%i0 + %o1]0xc4
	.word	0x3c800007	! t0_kref+0x14fc:   	bpos,a	_kref+0x1518
	.word	0xd6267fe4	! t0_kref+0x1500:   	st	%o3, [%i1 - 0x1c]
	.word	0x96ade23b	! t0_kref+0x1504:   	andncc	%l7, 0x23b, %o3
	.word	0x945a401a	! t0_kref+0x1508:   	smul	%o1, %i2, %o2
	.word	0xe9263ff4	! t0_kref+0x150c:   	st	%f20, [%i0 - 0xc]
	.word	0x8583400c	! t0_kref+0x1510:   	wr	%o5, %o4, %ccr
	.word	0x34800003	! t0_kref+0x1514:   	bg,a	_kref+0x1520
	.word	0xd44e3fe2	! t0_kref+0x1518:   	ldsb	[%i0 - 0x1e], %o2
	.word	0xafa0003d	! t0_kref+0x151c:   	fmovs	%f29, %f23
	.word	0x94e2fc4c	! t0_kref+0x1520:   	subccc	%o3, -0x3b4, %o2
	.word	0x81da4010	! t0_kref+0x1524:   	flush	%o1 + %l0
	.word	0x94fae248	! t0_kref+0x1528:   	sdivcc	%o3, 0x248, %o2
	.word	0x921a615a	! t0_kref+0x152c:   	xor	%o1, 0x15a, %o1
	.word	0x98aeba79	! t0_kref+0x1530:   	andncc	%i2, -0x587, %o4
	.word	0x933a6010	! t0_kref+0x1534:   	sra	%o1, 0x10, %o1
	.word	0x99382019	! t0_kref+0x1538:   	sra	%g0, 0x19, %o4
	.word	0x8143c000	! t0_kref+0x153c:   	stbar
	.word	0xe0ff1018	! t0_kref+0x1540:   	swapa	[%i4 + %i0]0x80, %l0
	.word	0xb9a018dc	! t0_kref+0x1544:   	fdtos	%f28, %f28
	.word	0x98a3401a	! t0_kref+0x1548:   	subcc	%o5, %i2, %o4
	.word	0xb1a4cd39	! t0_kref+0x154c:   	fsmuld	%f19, %f25, %f24
	.word	0xa5a48d32	! t0_kref+0x1550:   	fsmuld	%f18, %f18, %f18
	.word	0xed1e001d	! t0_kref+0x1554:   	ldd	[%i0 + %i5], %f22
	.word	0x98d5acb0	! t0_kref+0x1558:   	umulcc	%l6, 0xcb0, %o4
	.word	0x001fffff	! t0_kref+0x155c:   	illtrap	0x1fffff
	.word	0x99334009	! t0_kref+0x1560:   	srl	%o5, %o1, %o4
	.word	0x921ea65c	! t0_kref+0x1564:   	xor	%i2, 0x65c, %o1
	.word	0x98a2b1b4	! t0_kref+0x1568:   	subcc	%o2, -0xe4c, %o4
	.word	0xada94056	! t0_kref+0x156c:   	fmovdug	%fcc0, %f22, %f22
	.word	0xb1a408d4	! t0_kref+0x1570:   	fsubd	%f16, %f20, %f24
	.word	0xd440a004	! t0_kref+0x1574:   	ldsw	[%g2 + 4], %o2
	.word	0xe53e7ff8	! t0_kref+0x1578:   	std	%f18, [%i1 - 8]
	.word	0x9612c015	! t0_kref+0x157c:   	or	%o3, %l5, %o3
	.word	0xe4fe101c	! t0_kref+0x1580:   	swapa	[%i0 + %i4]0x80, %l2
	.word	0x9536800b	! t0_kref+0x1584:   	srl	%i2, %o3, %o2
	.word	0xd610a00a	! t0_kref+0x1588:   	lduh	[%g2 + 0xa], %o3
	.word	0xada000b8	! t0_kref+0x158c:   	fnegs	%f24, %f22
	.word	0xd200a03c	! t0_kref+0x1590:   	ld	[%g2 + 0x3c], %o1
	.word	0xafa01a50	! t0_kref+0x1594:   	fdtoi	%f16, %f23
	.word	0x9de3bfa0	! t0_kref+0x1598:   	save	%sp, -0x60, %sp
	.word	0x97ef2808	! t0_kref+0x159c:   	restore	%i4, 0x808, %o3
	.word	0x32800002	! t0_kref+0x15a0:   	bne,a	_kref+0x15a8
	.word	0x81834000	! t0_kref+0x15a4:   	wr	%o5, %g0, %y
	.word	0x941afa34	! t0_kref+0x15a8:   	xor	%o3, -0x5cc, %o2
	.word	0x81af4abe	! t0_kref+0x15ac:   	fcmpes	%fcc0, %f29, %f30
	.word	0x152bd101	! t0_kref+0x15b0:   	sethi	%hi(0xaf440400), %o2
	.word	0x25800008	! t0_kref+0x15b4:   	fblg,a	_kref+0x15d4
	.word	0xa9a708d0	! t0_kref+0x15b8:   	fsubd	%f28, %f16, %f20
	.word	0xd83e7fe0	! t0_kref+0x15bc:   	std	%o4, [%i1 - 0x20]
	.word	0x945e800c	! t0_kref+0x15c0:   	smul	%i2, %o4, %o2
	.word	0x95358008	! t0_kref+0x15c4:   	srl	%l6, %o0, %o2
	.word	0x98c5c017	! t0_kref+0x15c8:   	addccc	%l7, %l7, %o4
	.word	0xd828a003	! t0_kref+0x15cc:   	stb	%o4, [%g2 + 3]
	.word	0xda2e8018	! t0_kref+0x15d0:   	stb	%o5, [%i2 + %i0]
	.word	0x26800001	! t0_kref+0x15d4:   	bl,a	_kref+0x15d8
	.word	0xafa58934	! t0_kref+0x15d8:   	fmuls	%f22, %f20, %f23
	.word	0x9225e6f6	! t0_kref+0x15dc:   	sub	%l7, 0x6f6, %o1
	.word	0x94a28016	! t0_kref+0x15e0:   	subcc	%o2, %l6, %o2
	.word	0x9fc00004	! t0_kref+0x15e4:   	call	%g0 + %g4
	.word	0x9326a973	! t0_kref+0x15e8:   	mulscc	%i2, 0x973, %o1
	.word	0x9de3bfa0	! t0_kref+0x15ec:   	save	%sp, -0x60, %sp
	.word	0x80182ac2	! t0_kref+0x15f0:   	xor	%g0, 0xac2, %g0
	.word	0x93eef1e7	! t0_kref+0x15f4:   	restore	%i3, -0xe19, %o1
	.word	0xda363ffa	! t0_kref+0x15f8:   	sth	%o5, [%i0 - 6]
	call	SYM(t0_subr3)
	.word	0x81dc0009	! t0_kref+0x1600:   	flush	%l0 + %o1
	.word	0x980a400a	! t0_kref+0x1604:   	and	%o1, %o2, %o4
	.word	0x96630017	! t0_kref+0x1608:   	subc	%o4, %l7, %o3
	.word	0x9866800a	! t0_kref+0x160c:   	subc	%i2, %o2, %o4
	.word	0xd600a000	! t0_kref+0x1610:   	ld	[%g2], %o3
	.word	0xd2080019	! t0_kref+0x1614:   	ldub	[%g0 + %i1], %o1
	.word	0xd84e8019	! t0_kref+0x1618:   	ldsb	[%i2 + %i1], %o4
	.word	0xd226200c	! t0_kref+0x161c:   	st	%o1, [%i0 + 0xc]
	.word	0x993ae018	! t0_kref+0x1620:   	sra	%o3, 0x18, %o4
	.word	0xe900a000	! t0_kref+0x1624:   	ld	[%g2], %f20
	call	SYM(t0_subr0)
	.word	0xd40e0000	! t0_kref+0x162c:   	ldub	[%i0], %o2
	.word	0x96427dc9	! t0_kref+0x1630:   	addc	%o1, -0x237, %o3
	.word	0xbda0003c	! t0_kref+0x1634:   	fmovs	%f28, %f30
	.word	0x92f56661	! t0_kref+0x1638:   	udivcc	%l5, 0x661, %o1
	.word	0xda6e4000	! t0_kref+0x163c:   	ldstub	[%i1], %o5
	.word	0xa1a01112	! t0_kref+0x1640:   	fxtod	%f18, %f16
	.word	0xb9a01938	! t0_kref+0x1644:   	fstod	%f24, %f28
	.word	0xb1a688d4	! t0_kref+0x1648:   	fsubd	%f26, %f20, %f24
	.word	0xea6e0000	! t0_kref+0x164c:   	ldstub	[%i0], %l5
	.word	0x9625b4d3	! t0_kref+0x1650:   	sub	%l6, -0xb2d, %o3
	.word	0x928ac015	! t0_kref+0x1654:   	andcc	%o3, %l5, %o1
	.word	0x960a400c	! t0_kref+0x1658:   	and	%o1, %o4, %o3
	.word	0xd40e6001	! t0_kref+0x165c:   	ldub	[%i1 + 1], %o2
	.word	0x96da4000	! t0_kref+0x1660:   	smulcc	%o1, %g0, %o3
	.word	0x9682c008	! t0_kref+0x1664:   	addcc	%o3, %o0, %o3
	.word	0xafa01a31	! t0_kref+0x1668:   	fstoi	%f17, %f23
	.word	0x9415400b	! t0_kref+0x166c:   	or	%l5, %o3, %o2
	.word	0x81aecabd	! t0_kref+0x1670:   	fcmpes	%fcc0, %f27, %f29
	sethi	%hi(2f), %o7
	.word	0xe40be2b0	! t0_kref+0x1678:   	ldub	[%o7 + 0x2b0], %l2
	.word	0xa41ca00c	! t0_kref+0x167c:   	xor	%l2, 0xc, %l2
	.word	0xe42be2b0	! t0_kref+0x1680:   	stb	%l2, [%o7 + 0x2b0]
	.word	0x81dbe2b0	! t0_kref+0x1684:   	flush	%o7 + 0x2b0
	.word	0x96282fdf	! t0_kref+0x1688:   	andn	%g0, 0xfdf, %o3
	.word	0x9815c00b	! t0_kref+0x168c:   	or	%l7, %o3, %o4
	.word	0x9332e011	! t0_kref+0x1690:   	srl	%o3, 0x11, %o1
	.word	0x93418000	! t0_kref+0x1694:   	mov	%fprs, %o1
	.word	0xb1a588dc	! t0_kref+0x1698:   	fsubd	%f22, %f28, %f24
	.word	0x98deabba	! t0_kref+0x169c:   	smulcc	%i2, 0xbba, %o4
	.word	0xada6cd36	! t0_kref+0x16a0:   	fsmuld	%f27, %f22, %f22
	.word	0x92a28017	! t0_kref+0x16a4:   	subcc	%o2, %l7, %o1
	.word	0x9222a3dc	! t0_kref+0x16a8:   	sub	%o2, 0x3dc, %o1
	.word	0xe51e6010	! t0_kref+0x16ac:   	ldd	[%i1 + 0x10], %f18
2:	.word	0xaba01a37	! t0_kref+0x16b0:   	fstoi	%f23, %f21
	.word	0x99408000	! t0_kref+0x16b4:   	mov	%ccr, %o4
	.word	0x2e800007	! t0_kref+0x16b8:   	bvs,a	_kref+0x16d4
	.word	0xf36e6008	! t0_kref+0x16bc:   	prefetch	%i1 + 8, 25
	.word	0xafa01a52	! t0_kref+0x16c0:   	fdtoi	%f18, %f23
	.word	0xd828a035	! t0_kref+0x16c4:   	stb	%o4, [%g2 + 0x35]
	.word	0x981dc000	! t0_kref+0x16c8:   	xor	%l7, %g0, %o4
	.word	0xd24e8019	! t0_kref+0x16cc:   	ldsb	[%i2 + %i1], %o1
	.word	0xd82e7ff9	! t0_kref+0x16d0:   	stb	%o4, [%i1 - 7]
	.word	0xec6e4000	! t0_kref+0x16d4:   	ldstub	[%i1], %l6
	.word	0x988b6f2b	! t0_kref+0x16d8:   	andcc	%o5, 0xf2b, %o4
	.word	0x28800005	! t0_kref+0x16dc:   	bleu,a	_kref+0x16f0
	.word	0xb9a408de	! t0_kref+0x16e0:   	fsubd	%f16, %f30, %f28
	.word	0xd64e6010	! t0_kref+0x16e4:   	ldsb	[%i1 + 0x10], %o3
	.word	0xd200a010	! t0_kref+0x16e8:   	ld	[%g2 + 0x10], %o1
	.word	0xfb06401c	! t0_kref+0x16ec:   	ld	[%i1 + %i4], %f29
	.word	0x98883848	! t0_kref+0x16f0:   	andcc	%g0, -0x7b8, %o4
	.word	0xedbf5019	! t0_kref+0x16f4:   	stda	%f22, [%i5 + %i1]0x80
	.word	0xc1f6100b	! t0_kref+0x16f8:   	casxa	[%i0]0x80, %o3, %g0
	.word	0x8143c000	! t0_kref+0x16fc:   	stbar
	.word	0xd1f6100b	! t0_kref+0x1700:   	casxa	[%i0]0x80, %o3, %o0
	.word	0xe4086728	! t0_kref+0x1704:   	ldub	[%g1 + 0x728], %l2
	.word	0xa41ca00c	! t0_kref+0x1708:   	xor	%l2, 0xc, %l2
	.word	0xe4286728	! t0_kref+0x170c:   	stb	%l2, [%g1 + 0x728]
	.word	0x81d86728	! t0_kref+0x1710:   	flush	%g1 + 0x728
2:	.word	0x94a54000	! t0_kref+0x1714:   	subcc	%l5, %g0, %o2
	.word	0x943577c3	! t0_kref+0x1718:   	orn	%l5, -0x83d, %o2
	.word	0x81ad0a58	! t0_kref+0x171c:   	fcmpd	%fcc0, %f20, %f24
	.word	0xe1be501d	! t0_kref+0x1720:   	stda	%f16, [%i1 + %i5]0x80
	.word	0xb9a00050	! t0_kref+0x1724:   	fmovd	%f16, %f28
	.word	0xa3a01a3c	! t0_kref+0x1728:   	fstoi	%f28, %f17
	.word	0x9842800b	! t0_kref+0x172c:   	addc	%o2, %o3, %o4
	.word	0xb5a70838	! t0_kref+0x1730:   	fadds	%f28, %f24, %f26
	.word	0xa9a01918	! t0_kref+0x1734:   	fitod	%f24, %f20
	.word	0x96a268b7	! t0_kref+0x1738:   	subcc	%o1, 0x8b7, %o3
	.word	0xd8767ff8	! t0_kref+0x173c:   	stx	%o4, [%i1 - 8]
	.word	0xed3e3ff8	! t0_kref+0x1740:   	std	%f22, [%i0 - 8]
	.word	0xd8263fe8	! t0_kref+0x1744:   	st	%o4, [%i0 - 0x18]
	.word	0x81ad0a5c	! t0_kref+0x1748:   	fcmpd	%fcc0, %f20, %f28
	.word	0xa5a01a3c	! t0_kref+0x174c:   	fstoi	%f28, %f18
	.word	0xd8466004	! t0_kref+0x1750:   	ldsw	[%i1 + 4], %o4
	.word	0xb9a488d6	! t0_kref+0x1754:   	fsubd	%f18, %f22, %f28
	.word	0x962a602a	! t0_kref+0x1758:   	andn	%o1, 0x2a, %o3
	.word	0x929b000b	! t0_kref+0x175c:   	xorcc	%o4, %o3, %o1
	.word	0x92f02bb2	! t0_kref+0x1760:   	udivcc	%g0, 0xbb2, %o1
	.word	0x9632f74f	! t0_kref+0x1764:   	orn	%o3, -0x8b1, %o3
	.word	0x98d36d98	! t0_kref+0x1768:   	umulcc	%o5, 0xd98, %o4
	.word	0xeeb6d018	! t0_kref+0x176c:   	stha	%l7, [%i3 + %i0]0x80
	.word	0xb1a60952	! t0_kref+0x1770:   	fmuld	%f24, %f18, %f24
	.word	0x920a4017	! t0_kref+0x1774:   	and	%o1, %l7, %o1
	.word	0x99230009	! t0_kref+0x1778:   	mulscc	%o4, %o1, %o4
	.word	0xd4180018	! t0_kref+0x177c:   	ldd	[%g0 + %i0], %o2
	.word	0xd44e2005	! t0_kref+0x1780:   	ldsb	[%i0 + 5], %o2
	call	SYM(t0_subr2)
	.word	0x922ac000	! t0_kref+0x1788:   	andn	%o3, %g0, %o1
	.word	0x38800005	! t0_kref+0x178c:   	bgu,a	_kref+0x17a0
	.word	0xe51f4019	! t0_kref+0x1790:   	ldd	[%i5 + %i1], %f18
	.word	0x858577e1	! t0_kref+0x1794:   	wr	%l5, 0xfffff7e1, %ccr
	.word	0xea362012	! t0_kref+0x1798:   	sth	%l5, [%i0 + 0x12]
	.word	0x9472fdac	! t0_kref+0x179c:   	udiv	%o3, -0x254, %o2
	.word	0x98232d1c	! t0_kref+0x17a0:   	sub	%o4, 0xd1c, %o4
	.word	0x931ea206	! t0_kref+0x17a4:   	tsubcctv	%i2, 0x206, %o1
	.word	0xa9a709da	! t0_kref+0x17a8:   	fdivd	%f28, %f26, %f20
	.word	0x94e5c00c	! t0_kref+0x17ac:   	subccc	%l7, %o4, %o2
	.word	0xa5a01a54	! t0_kref+0x17b0:   	fdtoi	%f20, %f18
	.word	0x9f414000	! t0_kref+0x17b4:   	mov	%pc, %o7
	.word	0x878020d0	! t0_kref+0x17b8:   	mov	0xd0, %asi
	.word	0xda263ff8	! t0_kref+0x17bc:   	st	%o5, [%i0 - 8]
	.word	0xd6871019	! t0_kref+0x17c0:   	lda	[%i4 + %i1]0x80, %o3
	.word	0x28800007	! t0_kref+0x17c4:   	bleu,a	_kref+0x17e0
	.word	0x9445e4e8	! t0_kref+0x17c8:   	addc	%l7, 0x4e8, %o2
	.word	0xe91e401d	! t0_kref+0x17cc:   	ldd	[%i1 + %i5], %f20
	.word	0xd44e7fe4	! t0_kref+0x17d0:   	ldsb	[%i1 - 0x1c], %o2
	.word	0xd256001b	! t0_kref+0x17d4:   	ldsh	[%i0 + %i3], %o1
	.word	0x81ddc019	! t0_kref+0x17d8:   	flush	%l7 + %i1
	.word	0xd64e8019	! t0_kref+0x17dc:   	ldsb	[%i2 + %i1], %o3
	.word	0xf720a024	! t0_kref+0x17e0:   	st	%f27, [%g2 + 0x24]
	.word	0x86102004	! t0_kref+0x17e4:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x17e8:   	subcc	%g3, 1, %g3
	.word	0x2280000f	! t0_kref+0x17ec:   	be,a	_kref+0x1828
	.word	0x928def37	! t0_kref+0x17f0:   	andcc	%l7, 0xf37, %o1
	.word	0xd8280018	! t0_kref+0x17f4:   	stb	%o4, [%g0 + %i0]
	.word	0x952b000a	! t0_kref+0x17f8:   	sll	%o4, %o2, %o2
	.word	0xd4180019	! t0_kref+0x17fc:   	ldd	[%g0 + %i1], %o2
	.word	0xef6e7ff0	! t0_kref+0x1800:   	prefetch	%i1 - 0x10, 23
	.word	0x9564e1e0	! t0_kref+0x1804:   	movl	%icc, 0x1e0, %o2
	.word	0x9fc00004	! t0_kref+0x1808:   	call	%g0 + %g4
	.word	0x92083bb2	! t0_kref+0x180c:   	and	%g0, -0x44e, %o1
	.word	0x96faaa14	! t0_kref+0x1810:   	sdivcc	%o2, 0xa14, %o3
	.word	0x982b764b	! t0_kref+0x1814:   	andn	%o5, -0x9b5, %o4
	.word	0x8143c000	! t0_kref+0x1818:   	stbar
	.word	0x96202c65	! t0_kref+0x181c:   	sub	%g0, 0xc65, %o3
	.word	0xada01936	! t0_kref+0x1820:   	fstod	%f22, %f22
	.word	0x943eadfb	! t0_kref+0x1824:   	xnor	%i2, 0xdfb, %o2
	.word	0x9f414000	! t0_kref+0x1828:   	mov	%pc, %o7
	.word	0xb1a018da	! t0_kref+0x182c:   	fdtos	%f26, %f24
	.word	0xd81e3fe0	! t0_kref+0x1830:   	ldd	[%i0 - 0x20], %o4
	.word	0x20800002	! t0_kref+0x1834:   	bn,a	_kref+0x183c
	.word	0xea366000	! t0_kref+0x1838:   	sth	%l5, [%i1]
	.word	0x973a6014	! t0_kref+0x183c:   	sra	%o1, 0x14, %o3
	.word	0xaba54938	! t0_kref+0x1840:   	fmuls	%f21, %f24, %f21
	.word	0x96da001a	! t0_kref+0x1844:   	smulcc	%o0, %i2, %o3
	.word	0x993da00f	! t0_kref+0x1848:   	sra	%l6, 0xf, %o4
	.word	0xe9be188b	! t0_kref+0x184c:   	stda	%f20, [%i0 + %o3]0xc4
	.word	0x8143c000	! t0_kref+0x1850:   	stbar
	.word	0x980a3253	! t0_kref+0x1854:   	and	%o0, -0xdad, %o4
	.word	0x8610201b	! t0_kref+0x1858:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x185c:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x1860:   	be,a	_kref+0x187c
	.word	0xe1ee501b	! t0_kref+0x1864:   	prefetcha	%i1 + %i3, 16
	.word	0x96833b69	! t0_kref+0x1868:   	addcc	%o4, -0x497, %o3
	.word	0x98aa71b2	! t0_kref+0x186c:   	andncc	%o1, -0xe4e, %o4
	.word	0x96de8015	! t0_kref+0x1870:   	smulcc	%i2, %l5, %o3
	.word	0x94faa862	! t0_kref+0x1874:   	sdivcc	%o2, 0x862, %o2
	.word	0xf93e0000	! t0_kref+0x1878:   	std	%f28, [%i0]
	.word	0x9635fa14	! t0_kref+0x187c:   	orn	%l7, -0x5ec, %o3
	.word	0xb9a50831	! t0_kref+0x1880:   	fadds	%f20, %f17, %f28
	.word	0x81ad8ab5	! t0_kref+0x1884:   	fcmpes	%fcc0, %f22, %f21
	.word	0x952b401a	! t0_kref+0x1888:   	sll	%o5, %i2, %o2
	.word	0x9245b504	! t0_kref+0x188c:   	addc	%l6, -0xafc, %o1
	.word	0x94768015	! t0_kref+0x1890:   	udiv	%i2, %l5, %o2
	.word	0xea78a03c	! t0_kref+0x1894:   	swap	[%g2 + 0x3c], %l5
	.word	0xf91e6010	! t0_kref+0x1898:   	ldd	[%i1 + 0x10], %f28
	.word	0xb9a60d37	! t0_kref+0x189c:   	fsmuld	%f24, %f23, %f28
	.word	0x988d800b	! t0_kref+0x18a0:   	andcc	%l6, %o3, %o4
	.word	0xd84e0000	! t0_kref+0x18a4:   	ldsb	[%i0], %o4
	.word	0x972371bf	! t0_kref+0x18a8:   	mulscc	%o5, -0xe41, %o3
	.word	0x9822b44e	! t0_kref+0x18ac:   	sub	%o2, -0xbb2, %o4
	.word	0xe5a6101c	! t0_kref+0x18b0:   	sta	%f18, [%i0 + %i4]0x80
	.word	0x94ad4008	! t0_kref+0x18b4:   	andncc	%l5, %o0, %o2
	.word	0x9612afe1	! t0_kref+0x18b8:   	or	%o2, 0xfe1, %o3
	.word	0xe99e601c	! t0_kref+0x18bc:   	ldda	[%i1 + 0x1c]%asi, %f20
	.word	0x35800002	! t0_kref+0x18c0:   	fbue,a	_kref+0x18c8
	.word	0x961a4015	! t0_kref+0x18c4:   	xor	%o1, %l5, %o3
	.word	0x8143e051	! t0_kref+0x18c8:   	membar	0x51
	.word	0xf51f4019	! t0_kref+0x18cc:   	ldd	[%i5 + %i1], %f26
	.word	0xe91e2008	! t0_kref+0x18d0:   	ldd	[%i0 + 8], %f20
	.word	0x9816a2c9	! t0_kref+0x18d4:   	or	%i2, 0x2c9, %o4
	.word	0xd610a024	! t0_kref+0x18d8:   	lduh	[%g2 + 0x24], %o3
	.word	0xf1180019	! t0_kref+0x18dc:   	ldd	[%g0 + %i1], %f24
	.word	0x3a480005	! t0_kref+0x18e0:   	bcc,a,pt	%icc, _kref+0x18f4
	.word	0xe868a01b	! t0_kref+0x18e4:   	ldstub	[%g2 + 0x1b], %l4
	.word	0x988ac00b	! t0_kref+0x18e8:   	andcc	%o3, %o3, %o4
	.word	0xd80e6005	! t0_kref+0x18ec:   	ldub	[%i1 + 5], %o4
	.word	0x92b5f5e2	! t0_kref+0x18f0:   	orncc	%l7, -0xa1e, %o1
	.word	0x8143c000	! t0_kref+0x18f4:   	stbar
	.word	0xf906601c	! t0_kref+0x18f8:   	ld	[%i1 + 0x1c], %f28
	.word	0xf1ee501c	! t0_kref+0x18fc:   	prefetcha	%i1 + %i4, 24
	.word	0xd24e3fe8	! t0_kref+0x1900:   	ldsb	[%i0 - 0x18], %o1
	.word	0xda364000	! t0_kref+0x1904:   	sth	%o5, [%i1]
	.word	0xf900a038	! t0_kref+0x1908:   	ld	[%g2 + 0x38], %f28
	.word	0x2e800002	! t0_kref+0x190c:   	bvs,a	_kref+0x1914
	.word	0xe700a024	! t0_kref+0x1910:   	ld	[%g2 + 0x24], %f19
	.word	0xd2067fe4	! t0_kref+0x1914:   	ld	[%i1 - 0x1c], %o1
	.word	0xd850a022	! t0_kref+0x1918:   	ldsh	[%g2 + 0x22], %o4
	.word	0x98aa2768	! t0_kref+0x191c:   	andncc	%o0, 0x768, %o4
	.word	0x99228000	! t0_kref+0x1920:   	mulscc	%o2, %g0, %o4
	.word	0x927ea138	! t0_kref+0x1924:   	sdiv	%i2, 0x138, %o1
	.word	0xada01918	! t0_kref+0x1928:   	fitod	%f24, %f22
	.word	0xd400a034	! t0_kref+0x192c:   	ld	[%g2 + 0x34], %o2
	.word	0xa3a7893a	! t0_kref+0x1930:   	fmuls	%f30, %f26, %f17
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xb5a689d8	! t0_kref+0x193c:   	fdivd	%f26, %f24, %f26
1:	.word	0xa5a01915	! t0_kref+0x1940:   	fitod	%f21, %f18
	.word	0xe7e61000	! t0_kref+0x1944:   	casa	[%i0]0x80, %g0, %l3
	.word	0xadab0054	! t0_kref+0x1948:   	fmovduge	%fcc0, %f20, %f22
	.word	0x3e480002	! t0_kref+0x194c:   	bvc,a,pt	%icc, _kref+0x1954
	.word	0xd64e8019	! t0_kref+0x1950:   	ldsb	[%i2 + %i1], %o3
	.word	0x9465fb18	! t0_kref+0x1954:   	subc	%l7, -0x4e8, %o2
	.word	0xd41e2008	! t0_kref+0x1958:   	ldd	[%i0 + 8], %o2
	.word	0x98dac00a	! t0_kref+0x195c:   	smulcc	%o3, %o2, %o4
	.word	0xe900a02c	! t0_kref+0x1960:   	ld	[%g2 + 0x2c], %f20
	.word	0x8143e03f	! t0_kref+0x1964:   	membar	0x3f
	.word	0x94bdc01a	! t0_kref+0x1968:   	xnorcc	%l7, %i2, %o2
	.word	0x94ad800c	! t0_kref+0x196c:   	andncc	%l6, %o4, %o2
	.word	0xf1bf1a19	! t0_kref+0x1970:   	stda	%f24, [%i4 + %i1]0xd0
	.word	0x9843000d	! t0_kref+0x1974:   	addc	%o4, %o5, %o4
	call	0x00000494
	.word	0xd648a013	! t0_kref+0x197c:   	ldsb	[%g2 + 0x13], %o3
	.word	0x92854016	! t0_kref+0x1980:   	addcc	%l5, %l6, %o1
	.word	0x9455a0a2	! t0_kref+0x1984:   	umul	%l6, 0xa2, %o2
	.word	0xa9a50956	! t0_kref+0x1988:   	fmuld	%f20, %f22, %f20
	.word	0x3e800001	! t0_kref+0x198c:   	bvc,a	_kref+0x1990
	.word	0xb7a00532	! t0_kref+0x1990:   	fsqrts	%f18, %f27
	.word	0x81dc3f01	! t0_kref+0x1994:   	flush	%l0 - 0xff
	.word	0x921d800c	! t0_kref+0x1998:   	xor	%l6, %o4, %o1
	.word	0x81580000	! t0_kref+0x199c:   	flushw
	.word	0xf4200019	! t0_kref+0x19a0:   	st	%i2, [%g0 + %i1]
	.word	0xd848a02b	! t0_kref+0x19a4:   	ldsb	[%g2 + 0x2b], %o4
	.word	0x32800002	! t0_kref+0x19a8:   	bne,a	_kref+0x19b0
	.word	0x96f00015	! t0_kref+0x19ac:   	udivcc	%g0, %l5, %o3
	.word	0xb1a589da	! t0_kref+0x19b0:   	fdivd	%f22, %f26, %f24
	.word	0xb9a608da	! t0_kref+0x19b4:   	fsubd	%f24, %f26, %f28
	.word	0x86102015	! t0_kref+0x19b8:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x19bc:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x19c0:   	be,a	_kref+0x19f0
	.word	0x98db4008	! t0_kref+0x19c4:   	smulcc	%o5, %o0, %o4
	.word	0xaba00134	! t0_kref+0x19c8:   	fabss	%f20, %f21
	.word	0x94e23ae7	! t0_kref+0x19cc:   	subccc	%o0, -0x519, %o2
	.word	0x96ada4e0	! t0_kref+0x19d0:   	andncc	%l6, 0x4e0, %o3
	.word	0xd84e2014	! t0_kref+0x19d4:   	ldsb	[%i0 + 0x14], %o4
	.word	0xd8380018	! t0_kref+0x19d8:   	std	%o4, [%g0 + %i0]
	.word	0xee766008	! t0_kref+0x19dc:   	stx	%l7, [%i1 + 8]
	.word	0xe11fbc80	! t0_kref+0x19e0:   	ldd	[%fp - 0x380], %f16
	.word	0xd640a020	! t0_kref+0x19e4:   	ldsw	[%g2 + 0x20], %o3
	.word	0x973a4017	! t0_kref+0x19e8:   	sra	%o1, %l7, %o3
	.word	0xc51822e0	! t0_kref+0x19ec:   	ldd	[%g0 + 0x2e0], %f2
	.word	0xc807bfec	! t0_kref+0x19f0:   	ld	[%fp - 0x14], %g4
	.word	0x21800008	! t0_kref+0x19f4:   	fbn,a	_kref+0x1a14
	.word	0x94e2000b	! t0_kref+0x19f8:   	subccc	%o0, %o3, %o2
	.word	0x9932600f	! t0_kref+0x19fc:   	srl	%o1, 0xf, %o4
	.word	0x98fa3fc8	! t0_kref+0x1a00:   	sdivcc	%o0, -0x38, %o4
	.word	0x94e2f546	! t0_kref+0x1a04:   	subccc	%o3, -0xaba, %o2
	.word	0x92d28000	! t0_kref+0x1a08:   	umulcc	%o2, %g0, %o1
	.word	0xb1a00536	! t0_kref+0x1a0c:   	fsqrts	%f22, %f24
	.word	0x94ddf983	! t0_kref+0x1a10:   	smulcc	%l7, -0x67d, %o2
	.word	0x9616800d	! t0_kref+0x1a14:   	or	%i2, %o5, %o3
	.word	0x94fd800a	! t0_kref+0x1a18:   	sdivcc	%l6, %o2, %o2
	.word	0x8143c000	! t0_kref+0x1a1c:   	stbar
	.word	0xf91e3fe0	! t0_kref+0x1a20:   	ldd	[%i0 - 0x20], %f28
	.word	0x98dab1e7	! t0_kref+0x1a24:   	smulcc	%o2, -0xe19, %o4
	.word	0x9253000b	! t0_kref+0x1a28:   	umul	%o4, %o3, %o1
	.word	0xd410a014	! t0_kref+0x1a2c:   	lduh	[%g2 + 0x14], %o2
	.word	0x3e800006	! t0_kref+0x1a30:   	bvc,a	_kref+0x1a48
	.word	0xd210a00e	! t0_kref+0x1a34:   	lduh	[%g2 + 0xe], %o1
	.word	0x9816801a	! t0_kref+0x1a38:   	or	%i2, %i2, %o4
	.word	0x947221e0	! t0_kref+0x1a3c:   	udiv	%o0, 0x1e0, %o2
	.word	0xf906001c	! t0_kref+0x1a40:   	ld	[%i0 + %i4], %f28
	.word	0xfb067ffc	! t0_kref+0x1a44:   	ld	[%i1 - 4], %f29
	.word	0x3b800004	! t0_kref+0x1a48:   	fble,a	_kref+0x1a58
	.word	0xa9a01a3c	! t0_kref+0x1a4c:   	fstoi	%f28, %f20
	.word	0xb9a01a3c	! t0_kref+0x1a50:   	fstoi	%f28, %f28
	.word	0x001fffff	! t0_kref+0x1a54:   	illtrap	0x1fffff
	.word	0xd65e2018	! t0_kref+0x1a58:   	ldx	[%i0 + 0x18], %o3
	.word	0x81af8a5e	! t0_kref+0x1a5c:   	fcmpd	%fcc0, %f30, %f30
	.word	0x948a7ad5	! t0_kref+0x1a60:   	andcc	%o1, -0x52b, %o2
	.word	0xd808a02b	! t0_kref+0x1a64:   	ldub	[%g2 + 0x2b], %o4
	.word	0x3c800004	! t0_kref+0x1a68:   	bpos,a	_kref+0x1a78
	.word	0x98d5c01a	! t0_kref+0x1a6c:   	umulcc	%l7, %i2, %o4
	.word	0xa9a508d2	! t0_kref+0x1a70:   	fsubd	%f20, %f18, %f20
	.word	0x8143c000	! t0_kref+0x1a74:   	stbar
	.word	0x81dd0019	! t0_kref+0x1a78:   	flush	%l4 + %i1
	.word	0x949a31fb	! t0_kref+0x1a7c:   	xorcc	%o0, -0xe05, %o2
	.word	0x9485c009	! t0_kref+0x1a80:   	addcc	%l7, %o1, %o2
	.word	0x2b800003	! t0_kref+0x1a84:   	fbug,a	_kref+0x1a90
	.word	0x92132867	! t0_kref+0x1a88:   	or	%o4, 0x867, %o1
	.word	0xd216c019	! t0_kref+0x1a8c:   	lduh	[%i3 + %i1], %o1
	.word	0xb9a01a37	! t0_kref+0x1a90:   	fstoi	%f23, %f28
	.word	0xda30a008	! t0_kref+0x1a94:   	sth	%o5, [%g2 + 8]
	.word	0x94fd400d	! t0_kref+0x1a98:   	sdivcc	%l5, %o5, %o2
	.word	0x96b30016	! t0_kref+0x1a9c:   	orncc	%o4, %l6, %o3
	.word	0x9fc00004	! t0_kref+0x1aa0:   	call	%g0 + %g4
	.word	0xe500a02c	! t0_kref+0x1aa4:   	ld	[%g2 + 0x2c], %f18
	.word	0xa9a018da	! t0_kref+0x1aa8:   	fdtos	%f26, %f20
	.word	0x9fc00004	! t0_kref+0x1aac:   	call	%g0 + %g4
	.word	0xd44e7ff0	! t0_kref+0x1ab0:   	ldsb	[%i1 - 0x10], %o2
	.word	0xd248a026	! t0_kref+0x1ab4:   	ldsb	[%g2 + 0x26], %o1
	.word	0xb5a01911	! t0_kref+0x1ab8:   	fitod	%f17, %f26
	.word	0x96a6bca7	! t0_kref+0x1abc:   	subcc	%i2, -0x359, %o3
	.word	0x953ac00d	! t0_kref+0x1ac0:   	sra	%o3, %o5, %o2
	.word	0x96832c1d	! t0_kref+0x1ac4:   	addcc	%o4, 0xc1d, %o3
	.word	0x98d6b999	! t0_kref+0x1ac8:   	umulcc	%i2, -0x667, %o4
	.word	0x98da4016	! t0_kref+0x1acc:   	smulcc	%o1, %l6, %o4
	.word	0xd4563ff2	! t0_kref+0x1ad0:   	ldsh	[%i0 - 0xe], %o2
	.word	0xe900a034	! t0_kref+0x1ad4:   	ld	[%g2 + 0x34], %f20
	.word	0x9fc10000	! t0_kref+0x1ad8:   	call	%g4
	.word	0xd44e3ff8	! t0_kref+0x1adc:   	ldsb	[%i0 - 8], %o2
	.word	0x985aec8a	! t0_kref+0x1ae0:   	smul	%o3, 0xc8a, %o4
	.word	0xda78a004	! t0_kref+0x1ae4:   	swap	[%g2 + 4], %o5
	.word	0x94503df7	! t0_kref+0x1ae8:   	umul	%g0, -0x209, %o2
	.word	0x81830000	! t0_kref+0x1aec:   	wr	%o4, %g0, %y
	.word	0x921d8000	! t0_kref+0x1af0:   	xor	%l6, %g0, %o1
	.word	0x8182c000	! t0_kref+0x1af4:   	wr	%o3, %g0, %y
	call	SYM(t0_subr3)
	.word	0xd83e4000	! t0_kref+0x1afc:   	std	%o4, [%i1]
	.word	0x9322c017	! t0_kref+0x1b00:   	mulscc	%o3, %l7, %o1
	.word	0xc02e4000	! t0_kref+0x1b04:   	clrb	[%i1]
	.word	0xada0191d	! t0_kref+0x1b08:   	fitod	%f29, %f22
	.word	0x968afe47	! t0_kref+0x1b0c:   	andcc	%o3, -0x1b9, %o3
	.word	0x25800004	! t0_kref+0x1b10:   	fblg,a	_kref+0x1b20
	.word	0x928a3589	! t0_kref+0x1b14:   	andcc	%o0, -0xa77, %o1
	.word	0xb9a609da	! t0_kref+0x1b18:   	fdivd	%f24, %f26, %f28
	.word	0xe16e001a	! t0_kref+0x1b1c:   	prefetch	%i0 + %i2, 16
	.word	0xfd6e401a	! t0_kref+0x1b20:   	prefetch	%i1 + %i2, 30
	.word	0x9735e007	! t0_kref+0x1b24:   	srl	%l7, 0x7, %o3
	.word	0x8182c000	! t0_kref+0x1b28:   	wr	%o3, %g0, %y
	.word	0xd2060000	! t0_kref+0x1b2c:   	ld	[%i0], %o1
	.word	0xd408a035	! t0_kref+0x1b30:   	ldub	[%g2 + 0x35], %o2
	.word	0xb3a01a37	! t0_kref+0x1b34:   	fstoi	%f23, %f25
	.word	0xb7a018d0	! t0_kref+0x1b38:   	fdtos	%f16, %f27
	.word	0xbda0191c	! t0_kref+0x1b3c:   	fitod	%f28, %f30
	.word	0xa9a00150	! t0_kref+0x1b40:   	fabsd	%f16, %f20
	.word	0xe5067ff0	! t0_kref+0x1b44:   	ld	[%i1 - 0x10], %f18
	.word	0x92880015	! t0_kref+0x1b48:   	andcc	%g0, %l5, %o1
	.word	0x17058107	! t0_kref+0x1b4c:   	sethi	%hi(0x16041c00), %o3
	.word	0xada01916	! t0_kref+0x1b50:   	fitod	%f22, %f22
	.word	0x81aecabc	! t0_kref+0x1b54:   	fcmpes	%fcc0, %f27, %f28
	.word	0x28800006	! t0_kref+0x1b58:   	bleu,a	_kref+0x1b70
	.word	0xd830a024	! t0_kref+0x1b5c:   	sth	%o4, [%g2 + 0x24]
	.word	0x81ae8ab5	! t0_kref+0x1b60:   	fcmpes	%fcc0, %f26, %f21
	.word	0x92127606	! t0_kref+0x1b64:   	or	%o1, -0x9fa, %o1
	.word	0x92220015	! t0_kref+0x1b68:   	sub	%o0, %l5, %o1
	.word	0xda20a008	! t0_kref+0x1b6c:   	st	%o5, [%g2 + 8]
	.word	0x925dc016	! t0_kref+0x1b70:   	smul	%l7, %l6, %o1
	.word	0xf13f4019	! t0_kref+0x1b74:   	std	%f24, [%i5 + %i1]
	.word	0xa9a01a54	! t0_kref+0x1b78:   	fdtoi	%f20, %f20
	.word	0x94fe8017	! t0_kref+0x1b7c:   	sdivcc	%i2, %l7, %o2
	.word	0x86102003	! t0_kref+0x1b80:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1b84:   	bne,a	_kref+0x1b84
	.word	0x86a0e001	! t0_kref+0x1b88:   	subcc	%g3, 1, %g3
	.word	0x15137a85	! t0_kref+0x1b8c:   	sethi	%hi(0x4dea1400), %o2
	.word	0x26800003	! t0_kref+0x1b90:   	bl,a	_kref+0x1b9c
	.word	0xd678a01c	! t0_kref+0x1b94:   	swap	[%g2 + 0x1c], %o3
	.word	0x98e6a62a	! t0_kref+0x1b98:   	subccc	%i2, 0x62a, %o4
	.word	0x9f414000	! t0_kref+0x1b9c:   	mov	%pc, %o7
!	.word	0x24490915	! t0_kref+0x1ba0:   	ble,a,pt	%icc, SYM(t0_subr2)
	   	ble,a,pt	%icc, SYM(t0_subr2)
	.word	0xe91e0000	! t0_kref+0x1ba4:   	ldd	[%i0], %f20
	.word	0x81828000	! t0_kref+0x1ba8:   	wr	%o2, %g0, %y
	.word	0xd6080018	! t0_kref+0x1bac:   	ldub	[%g0 + %i0], %o3
	.word	0xa1a70854	! t0_kref+0x1bb0:   	faddd	%f28, %f20, %f16
	.word	0xd60e7ff6	! t0_kref+0x1bb4:   	ldub	[%i1 - 0xa], %o3
	.word	0xada6095c	! t0_kref+0x1bb8:   	fmuld	%f24, %f28, %f22
	.word	0x94837cb0	! t0_kref+0x1bbc:   	addcc	%o5, -0x350, %o2
	.word	0xd650a028	! t0_kref+0x1bc0:   	ldsh	[%g2 + 0x28], %o3
	.word	0xd8270018	! t0_kref+0x1bc4:   	st	%o4, [%i4 + %i0]
	.word	0xd450a014	! t0_kref+0x1bc8:   	ldsh	[%g2 + 0x14], %o2
	.word	0xbda549be	! t0_kref+0x1bcc:   	fdivs	%f21, %f30, %f30
	.word	0x25800006	! t0_kref+0x1bd0:   	fblg,a	_kref+0x1be8
	.word	0x98f34000	! t0_kref+0x1bd4:   	udivcc	%o5, %g0, %o4
	.word	0x96dd400c	! t0_kref+0x1bd8:   	smulcc	%l5, %o4, %o3
	.word	0x92e362f4	! t0_kref+0x1bdc:   	subccc	%o5, 0x2f4, %o1
	.word	0xec2e3ffb	! t0_kref+0x1be0:   	stb	%l6, [%i0 - 5]
	.word	0x98256959	! t0_kref+0x1be4:   	sub	%l5, 0x959, %o4
	.word	0xe5e65008	! t0_kref+0x1be8:   	casa	[%i1]0x80, %o0, %l2
	.word	0xd6567fee	! t0_kref+0x1bec:   	ldsh	[%i1 - 0x12], %o3
	.word	0xd6480019	! t0_kref+0x1bf0:   	ldsb	[%g0 + %i1], %o3
	.word	0xd248a01e	! t0_kref+0x1bf4:   	ldsb	[%g2 + 0x1e], %o1
	.word	0x941e801a	! t0_kref+0x1bf8:   	xor	%i2, %i2, %o2
	.word	0x81868000	! t0_kref+0x1bfc:   	wr	%i2, %g0, %y
	.word	0xd640a020	! t0_kref+0x1c00:   	ldsw	[%g2 + 0x20], %o3
	.word	0x8143c000	! t0_kref+0x1c04:   	stbar
	.word	0xf9180018	! t0_kref+0x1c08:   	ldd	[%g0 + %i0], %f28
	.word	0x96fb4009	! t0_kref+0x1c0c:   	sdivcc	%o5, %o1, %o3
	.word	0xd440a000	! t0_kref+0x1c10:   	ldsw	[%g2], %o2
	.word	0x98fb0009	! t0_kref+0x1c14:   	sdivcc	%o4, %o1, %o4
	.word	0xd6060000	! t0_kref+0x1c18:   	ld	[%i0], %o3
	.word	0xd1e6100b	! t0_kref+0x1c1c:   	casa	[%i0]0x80, %o3, %o0
	.word	0xd4400018	! t0_kref+0x1c20:   	ldsw	[%g0 + %i0], %o2
	.word	0x96a56bf6	! t0_kref+0x1c24:   	subcc	%l5, 0xbf6, %o3
	.word	0x9480372a	! t0_kref+0x1c28:   	addcc	%g0, -0x8d6, %o2
	.word	0x96154016	! t0_kref+0x1c2c:   	or	%l5, %l6, %o3
	.word	0x83414000	! t0_kref+0x1c30:   	mov	%pc, %g1
	.word	0x1330b8a9	! t0_kref+0x1c34:   	sethi	%hi(0xc2e2a400), %o1
	.word	0x36800003	! t0_kref+0x1c38:   	bge,a	_kref+0x1c44
	.word	0xa5a018d4	! t0_kref+0x1c3c:   	fdtos	%f20, %f18
	.word	0x98222bb7	! t0_kref+0x1c40:   	sub	%o0, 0xbb7, %o4
	.word	0xee30a02c	! t0_kref+0x1c44:   	sth	%l7, [%g2 + 0x2c]
	.word	0x9465adc8	! t0_kref+0x1c48:   	subc	%l6, 0xdc8, %o2
	call	SYM(t0_subr3)
	.word	0xc02e2011	! t0_kref+0x1c50:   	clrb	[%i0 + 0x11]
	.word	0x9940c000	! t0_kref+0x1c54:   	mov	%asi, %o4
	.word	0xd24e8018	! t0_kref+0x1c58:   	ldsb	[%i2 + %i0], %o1
	.word	0x21480001	! t0_kref+0x1c5c:   	fbn,a,pt	%fcc0, _kref+0x1c60
	.word	0x92da0008	! t0_kref+0x1c60:   	smulcc	%o0, %o0, %o1
	.word	0xa7a0189a	! t0_kref+0x1c64:   	fitos	%f26, %f19
	.word	0xfdb81018	! t0_kref+0x1c68:   	stda	%f30, [%g0 + %i0]0x80
	.word	0x96aa8015	! t0_kref+0x1c6c:   	andncc	%o2, %l5, %o3
	call	SYM(t0_subr0)
	.word	0x81824000	! t0_kref+0x1c74:   	wr	%o1, %g0, %y
	.word	0xd83e001d	! t0_kref+0x1c78:   	std	%o4, [%i0 + %i5]
	.word	0x35800001	! t0_kref+0x1c7c:   	fbue,a	_kref+0x1c80
	.word	0xb7a01a54	! t0_kref+0x1c80:   	fdtoi	%f20, %f27
	.word	0xc02e8019	! t0_kref+0x1c84:   	clrb	[%i2 + %i1]
	.word	0xd2680019	! t0_kref+0x1c88:   	ldstub	[%g0 + %i1], %o1
	.word	0x96f20016	! t0_kref+0x1c8c:   	udivcc	%o0, %l6, %o3
	.word	0xada0015c	! t0_kref+0x1c90:   	fabsd	%f28, %f22
	.word	0x969b401a	! t0_kref+0x1c94:   	xorcc	%o5, %i2, %o3
	.word	0x96433b43	! t0_kref+0x1c98:   	addc	%o4, -0x4bd, %o3
	.word	0x9fc10000	! t0_kref+0x1c9c:   	call	%g4
	.word	0xe91e3ff0	! t0_kref+0x1ca0:   	ldd	[%i0 - 0x10], %f20
	.word	0x94de800d	! t0_kref+0x1ca4:   	smulcc	%i2, %o5, %o2
	.word	0x9240375b	! t0_kref+0x1ca8:   	addc	%g0, -0x8a5, %o1
	.word	0x989ac016	! t0_kref+0x1cac:   	xorcc	%o3, %l6, %o4
	.word	0xd830a036	! t0_kref+0x1cb0:   	sth	%o4, [%g2 + 0x36]
	call	SYM(t0_subr0)
	.word	0x92db400c	! t0_kref+0x1cb8:   	smulcc	%o5, %o4, %o1
	.word	0xd208a038	! t0_kref+0x1cbc:   	ldub	[%g2 + 0x38], %o1
	.word	0x9865b1b7	! t0_kref+0x1cc0:   	subc	%l6, -0xe49, %o4
	.word	0x81de8015	! t0_kref+0x1cc4:   	flush	%i2 + %l5
	.word	0x9265646e	! t0_kref+0x1cc8:   	subc	%l5, 0x46e, %o1
	.word	0x2c800004	! t0_kref+0x1ccc:   	bneg,a	_kref+0x1cdc
	.word	0xb9a489d0	! t0_kref+0x1cd0:   	fdivd	%f18, %f16, %f28
	.word	0xadaa003e	! t0_kref+0x1cd4:   	fmovsa	%fcc0, %f30, %f22
	.word	0xd83e001d	! t0_kref+0x1cd8:   	std	%o4, [%i0 + %i5]
	.word	0x9850301d	! t0_kref+0x1cdc:   	umul	%g0, -0xfe3, %o4
	.word	0x81820000	! t0_kref+0x1ce0:   	wr	%o0, %g0, %y
	.word	0xd440a024	! t0_kref+0x1ce4:   	ldsw	[%g2 + 0x24], %o2
	.word	0x94554008	! t0_kref+0x1ce8:   	umul	%l5, %o0, %o2
	.word	0xa7a01a54	! t0_kref+0x1cec:   	fdtoi	%f20, %f19
	.word	0x98e58008	! t0_kref+0x1cf0:   	subccc	%l6, %o0, %o4
	.word	0x81dec018	! t0_kref+0x1cf4:   	flush	%i3 + %i0
	.word	0x94102a9c	! t0_kref+0x1cf8:   	mov	0xa9c, %o2
	.word	0xd4266014	! t0_kref+0x1cfc:   	st	%o2, [%i1 + 0x14]
	.word	0xb7a01a39	! t0_kref+0x1d00:   	fstoi	%f25, %f27
	.word	0xe7e65016	! t0_kref+0x1d04:   	casa	[%i1]0x80, %l6, %l3
	.word	0x81df64a2	! t0_kref+0x1d08:   	flush	%i5 + 0x4a2
	.word	0x921d4016	! t0_kref+0x1d0c:   	xor	%l5, %l6, %o1
	.word	0x81820000	! t0_kref+0x1d10:   	wr	%o0, %g0, %y
	.word	0xd810a010	! t0_kref+0x1d14:   	lduh	[%g2 + 0x10], %o4
	.word	0xd2300018	! t0_kref+0x1d18:   	sth	%o1, [%g0 + %i0]
	.word	0xed6e2000	! t0_kref+0x1d1c:   	prefetch	%i0, 22
	.word	0xf7066018	! t0_kref+0x1d20:   	ld	[%i1 + 0x18], %f27
	.word	0x98fafe26	! t0_kref+0x1d24:   	sdivcc	%o3, -0x1da, %o4
	.word	0x2d480003	! t0_kref+0x1d28:   	fbg,a,pt	%fcc0, _kref+0x1d34
	.word	0x925a7460	! t0_kref+0x1d2c:   	smul	%o1, -0xba0, %o1
	.word	0x96faa9e1	! t0_kref+0x1d30:   	sdivcc	%o2, 0x9e1, %o3
	.word	0xf5be101d	! t0_kref+0x1d34:   	stda	%f26, [%i0 + %i5]0x80
	.word	0x96fd68ad	! t0_kref+0x1d38:   	sdivcc	%l5, 0x8ad, %o3
	.word	0xf51fbce8	! t0_kref+0x1d3c:   	ldd	[%fp - 0x318], %f26
	.word	0x94dde947	! t0_kref+0x1d40:   	smulcc	%l7, 0x947, %o2
	.word	0x9fc00004	! t0_kref+0x1d44:   	call	%g0 + %g4
	.word	0xb1a409d4	! t0_kref+0x1d48:   	fdivd	%f16, %f20, %f24
	.word	0x920224be	! t0_kref+0x1d4c:   	add	%o0, 0x4be, %o1
	.word	0xd2b6501b	! t0_kref+0x1d50:   	stha	%o1, [%i1 + %i3]0x80
	.word	0xeb20a008	! t0_kref+0x1d54:   	st	%f21, [%g2 + 8]
	.word	0x92ddb87f	! t0_kref+0x1d58:   	smulcc	%l6, -0x781, %o1
	.word	0xb1a78958	! t0_kref+0x1d5c:   	fmuld	%f30, %f24, %f24
	.word	0x20800003	! t0_kref+0x1d60:   	bn,a	_kref+0x1d6c
	.word	0x9685c00d	! t0_kref+0x1d64:   	addcc	%l7, %o5, %o3
	.word	0xc12e001c	! t0_kref+0x1d68:   	st	%fsr, [%i0 + %i4]
	.word	0x99083990	! t0_kref+0x1d6c:   	tsubcc	%g0, -0x670, %o4
	.word	0xada01a34	! t0_kref+0x1d70:   	fstoi	%f20, %f22
	.word	0x94f2800a	! t0_kref+0x1d74:   	udivcc	%o2, %o2, %o2
	.word	0x81828000	! t0_kref+0x1d78:   	wr	%o2, %g0, %y
	.word	0x1908f863	! t0_kref+0x1d7c:   	sethi	%hi(0x23e18c00), %o4
	.word	0x9408001a	! t0_kref+0x1d80:   	and	%g0, %i2, %o2
	.word	0x98e2001a	! t0_kref+0x1d84:   	subccc	%o0, %i2, %o4
	.word	0x972261f0	! t0_kref+0x1d88:   	mulscc	%o1, 0x1f0, %o3
	.word	0xea280018	! t0_kref+0x1d8c:   	stb	%l5, [%g0 + %i0]
	.word	0x29800008	! t0_kref+0x1d90:   	fbl,a	_kref+0x1db0
	.word	0x98436a5f	! t0_kref+0x1d94:   	addc	%o5, 0xa5f, %o4
	.word	0x933ea01e	! t0_kref+0x1d98:   	sra	%i2, 0x1e, %o1
	.word	0x92c2710b	! t0_kref+0x1d9c:   	addccc	%o1, -0xef5, %o1
	.word	0xd486101c	! t0_kref+0x1da0:   	lda	[%i0 + %i4]0x80, %o2
	.word	0xb7a00138	! t0_kref+0x1da4:   	fabss	%f24, %f27
	.word	0xbda608da	! t0_kref+0x1da8:   	fsubd	%f24, %f26, %f30
	.word	0x9215b48f	! t0_kref+0x1dac:   	or	%l6, -0xb71, %o1
	.word	0xe51e4000	! t0_kref+0x1db0:   	ldd	[%i1], %f18
	.word	0x38800007	! t0_kref+0x1db4:   	bgu,a	_kref+0x1dd0
	.word	0xb5a018d2	! t0_kref+0x1db8:   	fdtos	%f18, %f26
	call	SYM(t0_subr2)
	.word	0x962a0016	! t0_kref+0x1dc0:   	andn	%o0, %l6, %o3
	.word	0xd84e401a	! t0_kref+0x1dc4:   	ldsb	[%i1 + %i2], %o4
	.word	0xb1a0189a	! t0_kref+0x1dc8:   	fitos	%f26, %f24
	.word	0x9285b8ce	! t0_kref+0x1dcc:   	addcc	%l6, -0x732, %o1
	.word	0x9738001a	! t0_kref+0x1dd0:   	sra	%g0, %i2, %o3
	.word	0xe51e2000	! t0_kref+0x1dd4:   	ldd	[%i0], %f18
	.word	0x945b668d	! t0_kref+0x1dd8:   	smul	%o5, 0x68d, %o2
	.word	0x948a000d	! t0_kref+0x1ddc:   	andcc	%o0, %o5, %o2
	.word	0x81830000	! t0_kref+0x1de0:   	wr	%o4, %g0, %y
	.word	0x32800006	! t0_kref+0x1de4:   	bne,a	_kref+0x1dfc
	.word	0xb9a01934	! t0_kref+0x1de8:   	fstod	%f20, %f28
	.word	0xa5a01a50	! t0_kref+0x1dec:   	fdtoi	%f16, %f18
	.word	0x9fc10000	! t0_kref+0x1df0:   	call	%g4
	.word	0xbda01911	! t0_kref+0x1df4:   	fitod	%f17, %f30
	.word	0x21800007	! t0_kref+0x1df8:   	fbn,a	_kref+0x1e14
	.word	0x9286b117	! t0_kref+0x1dfc:   	addcc	%i2, -0xee9, %o1
	.word	0xbda01938	! t0_kref+0x1e00:   	fstod	%f24, %f30
	.word	0x92254000	! t0_kref+0x1e04:   	sub	%l5, %g0, %o1
	.word	0x949b272b	! t0_kref+0x1e08:   	xorcc	%o4, 0x72b, %o2
	.word	0x9860000d	! t0_kref+0x1e0c:   	subc	%g0, %o5, %o4
	.word	0x94b5f10c	! t0_kref+0x1e10:   	orncc	%l7, -0xef4, %o2
	.word	0x94e5800a	! t0_kref+0x1e14:   	subccc	%l6, %o2, %o2
	.word	0xa7a018d2	! t0_kref+0x1e18:   	fdtos	%f18, %f19
	.word	0xd4466000	! t0_kref+0x1e1c:   	ldsw	[%i1], %o2
	.word	0x98228017	! t0_kref+0x1e20:   	sub	%o2, %l7, %o4
	.word	0x9822400c	! t0_kref+0x1e24:   	sub	%o1, %o4, %o4
	.word	0xa5a54d37	! t0_kref+0x1e28:   	fsmuld	%f21, %f23, %f18
	.word	0xb9a709da	! t0_kref+0x1e2c:   	fdivd	%f28, %f26, %f28
	.word	0x8582a675	! t0_kref+0x1e30:   	wr	%o2, 0x675, %ccr
	.word	0xd64e2014	! t0_kref+0x1e34:   	ldsb	[%i0 + 0x14], %o3
	.word	0x81854000	! t0_kref+0x1e38:   	wr	%l5, %g0, %y
	.word	0xf1be188a	! t0_kref+0x1e3c:   	stda	%f24, [%i0 + %o2]0xc4
	.word	0x9483000b	! t0_kref+0x1e40:   	addcc	%o4, %o3, %o2
	.word	0x81ad8ab2	! t0_kref+0x1e44:   	fcmpes	%fcc0, %f22, %f18
	.word	0xd648a02b	! t0_kref+0x1e48:   	ldsb	[%g2 + 0x2b], %o3
	.word	0x81accab6	! t0_kref+0x1e4c:   	fcmpes	%fcc0, %f19, %f22
	.word	0x98bea9cf	! t0_kref+0x1e50:   	xnorcc	%i2, 0x9cf, %o4
	.word	0x98d827f3	! t0_kref+0x1e54:   	smulcc	%g0, 0x7f3, %o4
	.word	0xd616c018	! t0_kref+0x1e58:   	lduh	[%i3 + %i0], %o3
	.word	0xe91fbe78	! t0_kref+0x1e5c:   	ldd	[%fp - 0x188], %f20
	.word	0x99382009	! t0_kref+0x1e60:   	sra	%g0, 0x9, %o4
	.word	0xf420a03c	! t0_kref+0x1e64:   	st	%i2, [%g2 + 0x3c]
	.word	0x973de002	! t0_kref+0x1e68:   	sra	%l7, 0x2, %o3
	.word	0x81ae0a58	! t0_kref+0x1e6c:   	fcmpd	%fcc0, %f24, %f24
	.word	0x81ae8a54	! t0_kref+0x1e70:   	fcmpd	%fcc0, %f26, %f20
	.word	0xd02e8019	! t0_kref+0x1e74:   	stb	%o0, [%i2 + %i1]
	.word	0xada9c05a	! t0_kref+0x1e78:   	fmovdu	%fcc0, %f26, %f22
	.word	0x94403447	! t0_kref+0x1e7c:   	addc	%g0, -0xbb9, %o2
	.word	0xea2e001a	! t0_kref+0x1e80:   	stb	%l5, [%i0 + %i2]
	.word	0xb5a689d4	! t0_kref+0x1e84:   	fdivd	%f26, %f20, %f26
	.word	0xda2e4000	! t0_kref+0x1e88:   	stb	%o5, [%i1]
	.word	0xf93e3fe8	! t0_kref+0x1e8c:   	std	%f28, [%i0 - 0x18]
	.word	0x9fc00004	! t0_kref+0x1e90:   	call	%g0 + %g4
	.word	0xf900a038	! t0_kref+0x1e94:   	ld	[%g2 + 0x38], %f28
	.word	0xef20a010	! t0_kref+0x1e98:   	st	%f23, [%g2 + 0x10]
	.word	0xd626001c	! t0_kref+0x1e9c:   	st	%o3, [%i0 + %i4]
	.word	0xada00156	! t0_kref+0x1ea0:   	fabsd	%f22, %f22
	.word	0x9de3bfa0	! t0_kref+0x1ea4:   	save	%sp, -0x60, %sp
	.word	0xb6d6ebaf	! t0_kref+0x1ea8:   	umulcc	%i3, 0xbaf, %i3
	.word	0x93ef401a	! t0_kref+0x1eac:   	restore	%i5, %i2, %o1
	.word	0xd24e7ff4	! t0_kref+0x1eb0:   	ldsb	[%i1 - 0xc], %o1
	.word	0x96a37775	! t0_kref+0x1eb4:   	subcc	%o5, -0x88b, %o3
	.word	0xe9bf5019	! t0_kref+0x1eb8:   	stda	%f20, [%i5 + %i1]0x80
	.word	0xe7000019	! t0_kref+0x1ebc:   	ld	[%g0 + %i1], %f19
	.word	0x86102002	! t0_kref+0x1ec0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1ec4:   	bne,a	_kref+0x1ec4
	.word	0x86a0e001	! t0_kref+0x1ec8:   	subcc	%g3, 1, %g3
	.word	0xbba00537	! t0_kref+0x1ecc:   	fsqrts	%f23, %f29
	sethi	%hi(2f), %o7
	.word	0xe40be2e8	! t0_kref+0x1ed4:   	ldub	[%o7 + 0x2e8], %l2
	.word	0xa41ca00c	! t0_kref+0x1ed8:   	xor	%l2, 0xc, %l2
	.word	0xe42be2e8	! t0_kref+0x1edc:   	stb	%l2, [%o7 + 0x2e8]
	.word	0x81dbe2e8	! t0_kref+0x1ee0:   	flush	%o7 + 0x2e8
	.word	0x2f800001	! t0_kref+0x1ee4:   	fbu,a	_kref+0x1ee8
2:	.word	0x92a2e03c	! t0_kref+0x1ee8:   	subcc	%o3, 0x3c, %o1
	.word	0xd248a001	! t0_kref+0x1eec:   	ldsb	[%g2 + 1], %o1
	.word	0xd42e8018	! t0_kref+0x1ef0:   	stb	%o2, [%i2 + %i0]
	.word	0x98a28000	! t0_kref+0x1ef4:   	subcc	%o2, %g0, %o4
	.word	0xd440a038	! t0_kref+0x1ef8:   	ldsw	[%g2 + 0x38], %o2
	.word	0xbba6c939	! t0_kref+0x1efc:   	fmuls	%f27, %f25, %f29
	.word	0xb5a508da	! t0_kref+0x1f00:   	fsubd	%f20, %f26, %f26
	.word	0xe3062010	! t0_kref+0x1f04:   	ld	[%i0 + 0x10], %f17
	.word	0xa5a6895c	! t0_kref+0x1f08:   	fmuld	%f26, %f28, %f18
	.word	0x27800007	! t0_kref+0x1f0c:   	fbul,a	_kref+0x1f28
	.word	0x9725800d	! t0_kref+0x1f10:   	mulscc	%l6, %o5, %o3
	.word	0xea2e7fe9	! t0_kref+0x1f14:   	stb	%l5, [%i1 - 0x17]
	.word	0x982373e1	! t0_kref+0x1f18:   	sub	%o5, -0xc1f, %o4
	call	SYM(t0_subr3)
	.word	0xf99e7ff0	! t0_kref+0x1f20:   	ldda	[%i1 - 0x10]%asi, %f28
	.word	0xe51e6018	! t0_kref+0x1f24:   	ldd	[%i1 + 0x18], %f18
	.word	0x931821f3	! t0_kref+0x1f28:   	tsubcctv	%g0, 0x1f3, %o1
	.word	0x9642400b	! t0_kref+0x1f2c:   	addc	%o1, %o3, %o3
	.word	0xada6895e	! t0_kref+0x1f30:   	fmuld	%f26, %f30, %f22
	.word	0x94a37653	! t0_kref+0x1f34:   	subcc	%o5, -0x9ad, %o2
	.word	0x965aefbb	! t0_kref+0x1f38:   	smul	%o3, 0xfbb, %o3
	.word	0xf700a024	! t0_kref+0x1f3c:   	ld	[%g2 + 0x24], %f27
	.word	0xe1be2009	! t0_kref+0x1f40:   	stda	%f16, [%i0 + 9]%asi
	.word	0xf9be5855	! t0_kref+0x1f44:   	stda	%f28, [%i1 + %l5]0xc2
	.word	0xe51e3fe8	! t0_kref+0x1f48:   	ldd	[%i0 - 0x18], %f18
	.word	0x9fc00004	! t0_kref+0x1f4c:   	call	%g0 + %g4
	.word	0xe1180018	! t0_kref+0x1f50:   	ldd	[%g0 + %i0], %f16
	.word	0x932da016	! t0_kref+0x1f54:   	sll	%l6, 0x16, %o1
	.word	0x23480003	! t0_kref+0x1f58:   	fbne,a,pt	%fcc0, _kref+0x1f64
	.word	0xd648a024	! t0_kref+0x1f5c:   	ldsb	[%g2 + 0x24], %o3
	.word	0x85802930	! t0_kref+0x1f60:   	mov	0x930, %ccr
	.word	0x94e58015	! t0_kref+0x1f64:   	subccc	%l6, %l5, %o2
	.word	0x8143c000	! t0_kref+0x1f68:   	stbar
	.word	0x973dc00c	! t0_kref+0x1f6c:   	sra	%l7, %o4, %o3
	.word	0xd41e6018	! t0_kref+0x1f70:   	ldd	[%i1 + 0x18], %o2
	.word	0x92ad8016	! t0_kref+0x1f74:   	andncc	%l6, %l6, %o1
	.word	0xd44e2004	! t0_kref+0x1f78:   	ldsb	[%i0 + 4], %o2
	.word	0x96502c1e	! t0_kref+0x1f7c:   	umul	%g0, 0xc1e, %o3
	.word	0x96d33db7	! t0_kref+0x1f80:   	umulcc	%o4, -0x249, %o3
	.word	0xc02e8019	! t0_kref+0x1f84:   	clrb	[%i2 + %i1]
	.word	0x81580000	! t0_kref+0x1f88:   	flushw
	.word	0x81858000	! t0_kref+0x1f8c:   	wr	%l6, %g0, %y
	.word	0xda763ff0	! t0_kref+0x1f90:   	stx	%o5, [%i0 - 0x10]
	.word	0xd200a000	! t0_kref+0x1f94:   	ld	[%g2], %o1
	.word	0x9325800d	! t0_kref+0x1f98:   	mulscc	%l6, %o5, %o1
	.word	0xd01e7fe8	! t0_kref+0x1f9c:   	ldd	[%i1 - 0x18], %o0
	.word	0xaba0189e	! t0_kref+0x1fa0:   	fitos	%f30, %f21
	.word	0x98b2f0db	! t0_kref+0x1fa4:   	orncc	%o3, -0xf25, %o4
	.word	0xa3a00037	! t0_kref+0x1fa8:   	fmovs	%f23, %f17
	call	SYM(t0_subr2)
	.word	0xd83f4019	! t0_kref+0x1fb0:   	std	%o4, [%i5 + %i1]
	.word	0xe1be7fe6	! t0_kref+0x1fb4:   	stda	%f16, [%i1 - 0x1a]%asi
	.word	0x2e800007	! t0_kref+0x1fb8:   	bvs,a	_kref+0x1fd4
	.word	0xc7ee5016	! t0_kref+0x1fbc:   	prefetcha	%i1 + %l6, 3
	.word	0xe81e7fe0	! t0_kref+0x1fc0:   	ldd	[%i1 - 0x20], %l4
	.word	0x92d28015	! t0_kref+0x1fc4:   	umulcc	%o2, %l5, %o1
	.word	0xfd1e6018	! t0_kref+0x1fc8:   	ldd	[%i1 + 0x18], %f30
	.word	0x96e22e84	! t0_kref+0x1fcc:   	subccc	%o0, 0xe84, %o3
	.word	0x81d93f6a	! t0_kref+0x1fd0:   	flush	%g4 - 0x96
	.word	0x9416800b	! t0_kref+0x1fd4:   	or	%i2, %o3, %o2
	.word	0xa9a508da	! t0_kref+0x1fd8:   	fsubd	%f20, %f26, %f20
	.word	0x920d800d	! t0_kref+0x1fdc:   	and	%l6, %o5, %o1
	.word	0x98fdb625	! t0_kref+0x1fe0:   	sdivcc	%l6, -0x9db, %o4
	.word	0x981b315b	! t0_kref+0x1fe4:   	xor	%o4, -0xea5, %o4
	.word	0xb9a488d2	! t0_kref+0x1fe8:   	fsubd	%f18, %f18, %f28
	.word	0x9fc00004	! t0_kref+0x1fec:   	call	%g0 + %g4
	.word	0x9453000c	! t0_kref+0x1ff0:   	umul	%o4, %o4, %o2
	.word	0xd4300018	! t0_kref+0x1ff4:   	sth	%o2, [%g0 + %i0]
	.word	0xee2e0000	! t0_kref+0x1ff8:   	stb	%l7, [%i0]
	.word	0xc807bfe8	! t0_kref+0x1ffc:   	ld	[%fp - 0x18], %g4
	.word	0xada01912	! t0_kref+0x2000:   	fitod	%f18, %f22
	.word	0xe500a034	! t0_kref+0x2004:   	ld	[%g2 + 0x34], %f18
	.word	0x81adcabe	! t0_kref+0x2008:   	fcmpes	%fcc0, %f23, %f30
	.word	0x92deb020	! t0_kref+0x200c:   	smulcc	%i2, -0xfe0, %o1
	.word	0xb5a68958	! t0_kref+0x2010:   	fmuld	%f26, %f24, %f26
	.word	0x963a615c	! t0_kref+0x2014:   	xnor	%o1, 0x15c, %o3
	.word	0x973ae009	! t0_kref+0x2018:   	sra	%o3, 0x9, %o3
	.word	0x9835400a	! t0_kref+0x201c:   	orn	%l5, %o2, %o4
	.word	0x81ae4ab3	! t0_kref+0x2020:   	fcmpes	%fcc0, %f25, %f19
	.word	0x98f32105	! t0_kref+0x2024:   	udivcc	%o4, 0x105, %o4
	.word	0x952a400c	! t0_kref+0x2028:   	sll	%o1, %o4, %o2
	call	1f
	.empty
	.word	0x983a000a	! t0_kref+0x2030:   	xnor	%o0, %o2, %o4
	.word	0xc7ee5009	! t0_kref+0x2034:   	prefetcha	%i1 + %o1, 3
	.word	0xf436600e	! t0_kref+0x2038:   	sth	%i2, [%i1 + 0xe]
	.word	0xf207bfe0	! t0_kref+0x203c:   	ld	[%fp - 0x20], %i1
	.word	0xd620a00c	! t0_kref+0x2040:   	st	%o3, [%g2 + 0xc]
	.word	0xf1067fe8	! t0_kref+0x2044:   	ld	[%i1 - 0x18], %f24
	.word	0xa5a01a38	! t0_kref+0x2048:   	fstoi	%f24, %f18
1:	.word	0x9332c017	! t0_kref+0x204c:   	srl	%o3, %l7, %o1
	.word	0x98582f70	! t0_kref+0x2050:   	smul	%g0, 0xf70, %o4
	.word	0xa9a54934	! t0_kref+0x2054:   	fmuls	%f21, %f20, %f20
	.word	0x9662800a	! t0_kref+0x2058:   	subc	%o2, %o2, %o3
	.word	0xd850a012	! t0_kref+0x205c:   	ldsh	[%g2 + 0x12], %o4
	.word	0x981a4009	! t0_kref+0x2060:   	xor	%o1, %o1, %o4
	.word	0x9676800a	! t0_kref+0x2064:   	udiv	%i2, %o2, %o3
	.word	0x9885a3cd	! t0_kref+0x2068:   	addcc	%l6, 0x3cd, %o4
	.word	0xf9be1848	! t0_kref+0x206c:   	stda	%f28, [%i0 + %o0]0xc2
	.word	0x993a6008	! t0_kref+0x2070:   	sra	%o1, 0x8, %o4
	.word	0xe300a000	! t0_kref+0x2074:   	ld	[%g2], %f17
	.word	0x96dd6061	! t0_kref+0x2078:   	smulcc	%l5, 0x61, %o3
	.word	0x953ac008	! t0_kref+0x207c:   	sra	%o3, %o0, %o2
	.word	0xc36e000a	! t0_kref+0x2080:   	prefetch	%i0 + %o2, 1
	.word	0x92654009	! t0_kref+0x2084:   	subc	%l5, %o1, %o1
	.word	0xe66e4000	! t0_kref+0x2088:   	ldstub	[%i1], %l3
	.word	0xe7063fe0	! t0_kref+0x208c:   	ld	[%i0 - 0x20], %f19
	.word	0xd828a027	! t0_kref+0x2090:   	stb	%o4, [%g2 + 0x27]
	.word	0x9643400c	! t0_kref+0x2094:   	addc	%o5, %o4, %o3
	.word	0x99418000	! t0_kref+0x2098:   	mov	%fprs, %o4
	.word	0xd6ff1019	! t0_kref+0x209c:   	swapa	[%i4 + %i1]0x80, %o3
	.word	0x8143c000	! t0_kref+0x20a0:   	stbar
	.word	0xd850a00e	! t0_kref+0x20a4:   	ldsh	[%g2 + 0xe], %o4
	.word	0x81af8ab1	! t0_kref+0x20a8:   	fcmpes	%fcc0, %f30, %f17
	.word	0xf120a038	! t0_kref+0x20ac:   	st	%f24, [%g2 + 0x38]
	.word	0xc36e6008	! t0_kref+0x20b0:   	prefetch	%i1 + 8, 1
	.word	0xe5062010	! t0_kref+0x20b4:   	ld	[%i0 + 0x10], %f18
	.word	0xe9be5a5c	! t0_kref+0x20b8:   	stda	%f20, [%i1 + %i4]0xd2
	.word	0x96a2800c	! t0_kref+0x20bc:   	subcc	%o2, %o4, %o3
	.word	0xd3f6501a	! t0_kref+0x20c0:   	casxa	[%i1]0x80, %i2, %o1
	.word	0x92f32247	! t0_kref+0x20c4:   	udivcc	%o4, 0x247, %o1
	.word	0x94623cdd	! t0_kref+0x20c8:   	subc	%o0, -0x323, %o2
	.word	0x8143c000	! t0_kref+0x20cc:   	stbar
	.word	0xb1a01114	! t0_kref+0x20d0:   	fxtod	%f20, %f24
	.word	0xa5a688d6	! t0_kref+0x20d4:   	fsubd	%f26, %f22, %f18
	.word	0xbda01a3e	! t0_kref+0x20d8:   	fstoi	%f30, %f30
	.word	0x81580000	! t0_kref+0x20dc:   	flushw
	.word	0x3a800008	! t0_kref+0x20e0:   	bcc,a	_kref+0x2100
	.word	0xb9a489da	! t0_kref+0x20e4:   	fdivd	%f18, %f26, %f28
	.word	0x9425c016	! t0_kref+0x20e8:   	sub	%l7, %l6, %o2
	.word	0xd8380018	! t0_kref+0x20ec:   	std	%o4, [%g0 + %i0]
	.word	0x985b6b7d	! t0_kref+0x20f0:   	smul	%o5, 0xb7d, %o4
	.word	0x9435c00b	! t0_kref+0x20f4:   	orn	%l7, %o3, %o2
	.word	0x24480003	! t0_kref+0x20f8:   	ble,a,pt	%icc, _kref+0x2104
	.word	0xe5bf5018	! t0_kref+0x20fc:   	stda	%f18, [%i5 + %i0]0x80
	.word	0x81d83bb9	! t0_kref+0x2100:   	flush	%g0 - 0x447
	.word	0xd208a039	! t0_kref+0x2104:   	ldub	[%g2 + 0x39], %o1
	.word	0xd2280018	! t0_kref+0x2108:   	stb	%o1, [%g0 + %i0]
	.word	0x39480007	! t0_kref+0x210c:   	fbuge,a,pt	%fcc0, _kref+0x2128
	.word	0x92aa4015	! t0_kref+0x2110:   	andncc	%o1, %l5, %o1
	.word	0x92db314a	! t0_kref+0x2114:   	smulcc	%o4, -0xeb6, %o1
	.word	0xe91f4018	! t0_kref+0x2118:   	ldd	[%i5 + %i0], %f20
	.word	0x989b3404	! t0_kref+0x211c:   	xorcc	%o4, -0xbfc, %o4
	.word	0xd83e4000	! t0_kref+0x2120:   	std	%o4, [%i1]
	.word	0x953a6011	! t0_kref+0x2124:   	sra	%o1, 0x11, %o2
	.word	0xf100a00c	! t0_kref+0x2128:   	ld	[%g2 + 0xc], %f24
	.word	0x2a800007	! t0_kref+0x212c:   	bcs,a	_kref+0x2148
	.word	0x92a3637b	! t0_kref+0x2130:   	subcc	%o5, 0x37b, %o1
	.word	0xc0280018	! t0_kref+0x2134:   	clrb	[%g0 + %i0]
	.word	0x991a3601	! t0_kref+0x2138:   	tsubcctv	%o0, -0x9ff, %o4
	.word	0xd6c71018	! t0_kref+0x213c:   	ldswa	[%i4 + %i0]0x80, %o3
	.word	0xc0267ff8	! t0_kref+0x2140:   	clr	[%i1 - 8]
	.word	0x81ad0ab1	! t0_kref+0x2144:   	fcmpes	%fcc0, %f20, %f17
	.word	0x81ad0a54	! t0_kref+0x2148:   	fcmpd	%fcc0, %f20, %f20
	.word	0xf19e1a1b	! t0_kref+0x214c:   	ldda	[%i0 + %i3]0xd0, %f24
	.word	0xa9a0103d	! t0_kref+0x2150:   	fstox	%f29, %f20
	.word	0xd40e3fe1	! t0_kref+0x2154:   	ldub	[%i0 - 0x1f], %o2
	.word	0xd44e2009	! t0_kref+0x2158:   	ldsb	[%i0 + 9], %o2
	.word	0xd81e6000	! t0_kref+0x215c:   	ldd	[%i1], %o4
	.word	0x9455c00a	! t0_kref+0x2160:   	umul	%l7, %o2, %o2
	.word	0x2f800006	! t0_kref+0x2164:   	fbu,a	_kref+0x217c
	.word	0xd86e4000	! t0_kref+0x2168:   	ldstub	[%i1], %o4
	.word	0x94de800b	! t0_kref+0x216c:   	smulcc	%i2, %o3, %o2
	.word	0x81ac8a58	! t0_kref+0x2170:   	fcmpd	%fcc0, %f18, %f24
	.word	0x92e24016	! t0_kref+0x2174:   	subccc	%o1, %l6, %o1
	.word	0x31800008	! t0_kref+0x2178:   	fba,a	_kref+0x2198
	.word	0x96e5c00d	! t0_kref+0x217c:   	subccc	%l7, %o5, %o3
	.word	0xada01918	! t0_kref+0x2180:   	fitod	%f24, %f22
	.word	0x966568e9	! t0_kref+0x2184:   	subc	%l5, 0x8e9, %o3
	.word	0xe53e3ff0	! t0_kref+0x2188:   	std	%f18, [%i0 - 0x10]
	.word	0xea367fe6	! t0_kref+0x218c:   	sth	%l5, [%i1 - 0x1a]
	.word	0xede6100a	! t0_kref+0x2190:   	casa	[%i0]0x80, %o2, %l6
	.word	0xe91e4000	! t0_kref+0x2194:   	ldd	[%i1], %f20
	.word	0x3d800004	! t0_kref+0x2198:   	fbule,a	_kref+0x21a8
	.word	0x96fa800d	! t0_kref+0x219c:   	sdivcc	%o2, %o5, %o3
	.word	0x81d87154	! t0_kref+0x21a0:   	flush	%g1 - 0xeac
	.word	0x92ad800a	! t0_kref+0x21a4:   	andncc	%l6, %o2, %o1
	.word	0x81ad0a52	! t0_kref+0x21a8:   	fcmpd	%fcc0, %f20, %f18
	.word	0xc5ee1000	! t0_kref+0x21ac:   	prefetcha	%i0, 2
	.word	0xeaff1019	! t0_kref+0x21b0:   	swapa	[%i4 + %i1]0x80, %l5
	.word	0xf5ee101b	! t0_kref+0x21b4:   	prefetcha	%i0 + %i3, 26
	.word	0x33800002	! t0_kref+0x21b8:   	fbe,a	_kref+0x21c0
	.word	0x98600016	! t0_kref+0x21bc:   	subc	%g0, %l6, %o4
	.word	0x9880319e	! t0_kref+0x21c0:   	addcc	%g0, -0xe62, %o4
	.word	0xb1a00058	! t0_kref+0x21c4:   	fmovd	%f24, %f24
	.word	0x9412000a	! t0_kref+0x21c8:   	or	%o0, %o2, %o2
	.word	0x921a001a	! t0_kref+0x21cc:   	xor	%o0, %i2, %o1
	.word	0xd2480019	! t0_kref+0x21d0:   	ldsb	[%g0 + %i1], %o1
	.word	0xafa00538	! t0_kref+0x21d4:   	fsqrts	%f24, %f23
	.word	0x94534016	! t0_kref+0x21d8:   	umul	%o5, %l6, %o2
	.word	0xe93e4000	! t0_kref+0x21dc:   	std	%f20, [%i1]
	.word	0x9525e1b7	! t0_kref+0x21e0:   	mulscc	%l7, 0x1b7, %o2
	.word	0x9825ab3b	! t0_kref+0x21e4:   	sub	%l6, 0xb3b, %o4
	.word	0xee2e7fe7	! t0_kref+0x21e8:   	stb	%l7, [%i1 - 0x19]
	.word	0xd4d81018	! t0_kref+0x21ec:   	ldxa	[%g0 + %i0]0x80, %o2
	.word	0x9828001a	! t0_kref+0x21f0:   	andn	%g0, %i2, %o4
	.word	0x985a001a	! t0_kref+0x21f4:   	smul	%o0, %i2, %o4
	.word	0x945a400b	! t0_kref+0x21f8:   	smul	%o1, %o3, %o2
	.word	0xd83e0000	! t0_kref+0x21fc:   	std	%o4, [%i0]
	.word	0x96337a22	! t0_kref+0x2200:   	orn	%o5, -0x5de, %o3
	.word	0x96254017	! t0_kref+0x2204:   	sub	%l5, %l7, %o3
	.word	0x81820000	! t0_kref+0x2208:   	wr	%o0, %g0, %y
	.word	0xb9a68954	! t0_kref+0x220c:   	fmuld	%f26, %f20, %f28
	.word	0x94268008	! t0_kref+0x2210:   	sub	%i2, %o0, %o2
	.word	0x928d60ab	! t0_kref+0x2214:   	andcc	%l5, 0xab, %o1
	.word	0xf91e0000	! t0_kref+0x2218:   	ldd	[%i0], %f28
	.word	0x971a2dd2	! t0_kref+0x221c:   	tsubcctv	%o0, 0xdd2, %o3
	.word	0x971aff18	! t0_kref+0x2220:   	tsubcctv	%o3, -0xe8, %o3
	.word	0x92582923	! t0_kref+0x2224:   	smul	%g0, 0x923, %o1
	.word	0xada018d8	! t0_kref+0x2228:   	fdtos	%f24, %f22
	.word	0xada01936	! t0_kref+0x222c:   	fstod	%f22, %f22
	.word	0xb9a0193d	! t0_kref+0x2230:   	fstod	%f29, %f28
	.word	0xd228a012	! t0_kref+0x2234:   	stb	%o1, [%g2 + 0x12]
	.word	0xd640a028	! t0_kref+0x2238:   	ldsw	[%g2 + 0x28], %o3
	.word	0x96da4009	! t0_kref+0x223c:   	smulcc	%o1, %o1, %o3
	.word	0xa9a588d8	! t0_kref+0x2240:   	fsubd	%f22, %f24, %f20
	.word	0x94f57ff3	! t0_kref+0x2244:   	udivcc	%l5, -0xd, %o2
	.word	0x962d401a	! t0_kref+0x2248:   	andn	%l5, %i2, %o3
	.word	0x94533de6	! t0_kref+0x224c:   	umul	%o4, -0x21a, %o2
	.word	0x96fb3281	! t0_kref+0x2250:   	sdivcc	%o4, -0xd7f, %o3
	.word	0xada709d4	! t0_kref+0x2254:   	fdivd	%f28, %f20, %f22
	.word	0x81da0010	! t0_kref+0x2258:   	flush	%o0 + %l0
	.word	0xd01e401d	! t0_kref+0x225c:   	ldd	[%i1 + %i5], %o0
	.word	0xd248a004	! t0_kref+0x2260:   	ldsb	[%g2 + 4], %o1
	.word	0xb1a788d4	! t0_kref+0x2264:   	fsubd	%f30, %f20, %f24
	.word	0xd81e3fe8	! t0_kref+0x2268:   	ldd	[%i0 - 0x18], %o4
	.word	0x929eaffb	! t0_kref+0x226c:   	xorcc	%i2, 0xffb, %o1
	.word	0x92fdb3da	! t0_kref+0x2270:   	sdivcc	%l6, -0xc26, %o1
	.word	0xafa0053a	! t0_kref+0x2274:   	fsqrts	%f26, %f23
	.word	0x81de3da7	! t0_kref+0x2278:   	flush	%i0 - 0x259
	.word	0x81834000	! t0_kref+0x227c:   	wr	%o5, %g0, %y
	.word	0xd4367ff0	! t0_kref+0x2280:   	sth	%o2, [%i1 - 0x10]
	.word	0xd4080018	! t0_kref+0x2284:   	ldub	[%g0 + %i0], %o2
	.word	0x8143e040	! t0_kref+0x2288:   	membar	0x40
	.word	0x94e6800c	! t0_kref+0x228c:   	subccc	%i2, %o4, %o2
	.word	0x34800003	! t0_kref+0x2290:   	bg,a	_kref+0x229c
	.word	0xe51fbf68	! t0_kref+0x2294:   	ldd	[%fp - 0x98], %f18
	.word	0x965dc00c	! t0_kref+0x2298:   	smul	%l7, %o4, %o3
	.word	0xb9a0053a	! t0_kref+0x229c:   	fsqrts	%f26, %f28
	.word	0x26800001	! t0_kref+0x22a0:   	bl,a	_kref+0x22a4
	.word	0xb1a70958	! t0_kref+0x22a4:   	fmuld	%f28, %f24, %f24
	.word	0x81af0a3b	! t0_kref+0x22a8:   	fcmps	%fcc0, %f28, %f27
	.word	0xada709da	! t0_kref+0x22ac:   	fdivd	%f28, %f26, %f22
	.word	0xd41e3ff8	! t0_kref+0x22b0:   	ldd	[%i0 - 8], %o2
	.word	0xd808a002	! t0_kref+0x22b4:   	ldub	[%g2 + 2], %o4
	.word	0xd850a002	! t0_kref+0x22b8:   	ldsh	[%g2 + 2], %o4
	.word	0xa3a01a5a	! t0_kref+0x22bc:   	fdtoi	%f26, %f17
	.word	0x25480007	! t0_kref+0x22c0:   	fblg,a,pt	%fcc0, _kref+0x22dc
	.word	0xd62e3ffb	! t0_kref+0x22c4:   	stb	%o3, [%i0 - 5]
	.word	0xd248a016	! t0_kref+0x22c8:   	ldsb	[%g2 + 0x16], %o1
	.word	0x99224000	! t0_kref+0x22cc:   	mulscc	%o1, %g0, %o4
	.word	0x965b400a	! t0_kref+0x22d0:   	smul	%o5, %o2, %o3
	.word	0x8143c000	! t0_kref+0x22d4:   	stbar
	.word	0xb1a0015c	! t0_kref+0x22d8:   	fabsd	%f28, %f24
	.word	0xf56e7ff0	! t0_kref+0x22dc:   	prefetch	%i1 - 0x10, 26
	.word	0x8143c000	! t0_kref+0x22e0:   	stbar
	.word	0xb5a789d2	! t0_kref+0x22e4:   	fdivd	%f30, %f18, %f26
	.word	0x9462c009	! t0_kref+0x22e8:   	subc	%o3, %o1, %o2
	.word	0xada708d6	! t0_kref+0x22ec:   	fsubd	%f28, %f22, %f22
	.word	0x953a8000	! t0_kref+0x22f0:   	sra	%o2, %g0, %o2
	.word	0xada01939	! t0_kref+0x22f4:   	fstod	%f25, %f22
	.word	0xaba018dc	! t0_kref+0x22f8:   	fdtos	%f28, %f21
	.word	0x96fab00b	! t0_kref+0x22fc:   	sdivcc	%o2, -0xff5, %o3
	.word	0x940de9a1	! t0_kref+0x2300:   	and	%l7, 0x9a1, %o2
	.word	0x8143c000	! t0_kref+0x2304:   	stbar
	.word	0xd80e3fe1	! t0_kref+0x2308:   	ldub	[%i0 - 0x1f], %o4
	.word	0xf9be5840	! t0_kref+0x230c:   	stda	%f28, [%i1]0xc2
	.word	0xe1be1a1d	! t0_kref+0x2310:   	stda	%f16, [%i0 + %i5]0xd0
	.word	0x83414000	! t0_kref+0x2314:   	mov	%pc, %g1
	.word	0x152d604a	! t0_kref+0x2318:   	sethi	%hi(0xb5812800), %o2
	.word	0xd0180018	! t0_kref+0x231c:   	ldd	[%g0 + %i0], %o0
	.word	0x98a2c000	! t0_kref+0x2320:   	subcc	%o3, %g0, %o4
	.word	0xd01e6000	! t0_kref+0x2324:   	ldd	[%i1], %o0
	.word	0xd650a000	! t0_kref+0x2328:   	ldsh	[%g2], %o3
	.word	0xb1a708da	! t0_kref+0x232c:   	fsubd	%f28, %f26, %f24
	.word	0xb5a688d4	! t0_kref+0x2330:   	fsubd	%f26, %f20, %f26
	.word	0xd650a004	! t0_kref+0x2334:   	ldsh	[%g2 + 4], %o3
	.word	0x9645c00b	! t0_kref+0x2338:   	addc	%l7, %o3, %o3
	.word	0xd648a02b	! t0_kref+0x233c:   	ldsb	[%g2 + 0x2b], %o3
	.word	0x9215c009	! t0_kref+0x2340:   	or	%l7, %o1, %o1
	.word	0x96c373e2	! t0_kref+0x2344:   	addccc	%o5, -0xc1e, %o3
	.word	0xd25f4019	! t0_kref+0x2348:   	ldx	[%i5 + %i1], %o1
	.word	0x940a7d94	! t0_kref+0x234c:   	and	%o1, -0x26c, %o2
	.word	0x81dd8008	! t0_kref+0x2350:   	flush	%l6 + %o0
!	.word	0x2686572b	! t0_kref+0x2354:   	bl,a	SYM(t0_subr1)
	   	bl,a	SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x2358:   	mov	%pc, %o7
	.word	0x98fa000a	! t0_kref+0x235c:   	sdivcc	%o0, %o2, %o4
	.word	0x98fb000c	! t0_kref+0x2360:   	sdivcc	%o4, %o4, %o4
	.word	0xbda018da	! t0_kref+0x2364:   	fdtos	%f26, %f30
	.word	0xda36201a	! t0_kref+0x2368:   	sth	%o5, [%i0 + 0x1a]
	.word	0x98a28016	! t0_kref+0x236c:   	subcc	%o2, %l6, %o4
	.word	0x98d22356	! t0_kref+0x2370:   	umulcc	%o0, 0x356, %o4
	.word	0xaba0053c	! t0_kref+0x2374:   	fsqrts	%f28, %f21
	.word	0xb1a01934	! t0_kref+0x2378:   	fstod	%f20, %f24
	.word	0xb5a0191d	! t0_kref+0x237c:   	fitod	%f29, %f26
	.word	0xe07e601c	! t0_kref+0x2380:   	swap	[%i1 + 0x1c], %l0
	.word	0x8182c000	! t0_kref+0x2384:   	wr	%o3, %g0, %y
	.word	0xd486101c	! t0_kref+0x2388:   	lda	[%i0 + %i4]0x80, %o2
	.word	0x9540c000	! t0_kref+0x238c:   	mov	%asi, %o2
	.word	0xb9a00532	! t0_kref+0x2390:   	fsqrts	%f18, %f28
	.word	0x81854000	! t0_kref+0x2394:   	wr	%l5, %g0, %y
	.word	0xa5a01a52	! t0_kref+0x2398:   	fdtoi	%f18, %f18
	.word	0x9305653a	! t0_kref+0x239c:   	taddcc	%l5, 0x53a, %o1
	.word	0xc0260000	! t0_kref+0x23a0:   	clr	[%i0]
	.word	0xe27e401c	! t0_kref+0x23a4:   	swap	[%i1 + %i4], %l1
	.word	0x878020e0	! t0_kref+0x23a8:   	mov	0xe0, %asi
	.word	0x9835c00d	! t0_kref+0x23ac:   	orn	%l7, %o5, %o4
	.word	0xd810a03e	! t0_kref+0x23b0:   	lduh	[%g2 + 0x3e], %o4
	.word	0x3c800005	! t0_kref+0x23b4:   	bpos,a	_kref+0x23c8
	.word	0x8143c000	! t0_kref+0x23b8:   	stbar
	.word	0xe9be5a1b	! t0_kref+0x23bc:   	stda	%f20, [%i1 + %i3]0xd0
	.word	0x961a752c	! t0_kref+0x23c0:   	xor	%o1, -0xad4, %o3
	.word	0xd0267fe8	! t0_kref+0x23c4:   	st	%o0, [%i1 - 0x18]
	.word	0xf9060000	! t0_kref+0x23c8:   	ld	[%i0], %f28
	.word	0xd64e7ffc	! t0_kref+0x23cc:   	ldsb	[%i1 - 4], %o3
	.word	0x1335df57	! t0_kref+0x23d0:   	sethi	%hi(0xd77d5c00), %o1
	.word	0xa1a40956	! t0_kref+0x23d4:   	fmuld	%f16, %f22, %f16
	.word	0xada01913	! t0_kref+0x23d8:   	fitod	%f19, %f22
	.word	0x96a2a652	! t0_kref+0x23dc:   	subcc	%o2, 0x652, %o3
	.word	0x9885800b	! t0_kref+0x23e0:   	addcc	%l6, %o3, %o4
	.word	0x9236a30b	! t0_kref+0x23e4:   	orn	%i2, 0x30b, %o1
	.word	0x8143e031	! t0_kref+0x23e8:   	membar	0x31
	.word	0xd850a026	! t0_kref+0x23ec:   	ldsh	[%g2 + 0x26], %o4
	.word	0xd220a014	! t0_kref+0x23f0:   	st	%o1, [%g2 + 0x14]
	.word	0xa9a9c054	! t0_kref+0x23f4:   	fmovdu	%fcc0, %f20, %f20
	sethi	%hi(2f), %o7
	.word	0xe40be038	! t0_kref+0x23fc:   	ldub	[%o7 + 0x38], %l2
	.word	0xa41ca00c	! t0_kref+0x2400:   	xor	%l2, 0xc, %l2
	.word	0xe42be038	! t0_kref+0x2404:   	stb	%l2, [%o7 + 0x38]
	.word	0x81dbe038	! t0_kref+0x2408:   	flush	%o7 + 0x38
	.word	0xd62e2019	! t0_kref+0x240c:   	stb	%o3, [%i0 + 0x19]
	.word	0xc030a020	! t0_kref+0x2410:   	clrh	[%g2 + 0x20]
	.word	0x8143c000	! t0_kref+0x2414:   	stbar
	.word	0x8143c000	! t0_kref+0x2418:   	stbar
	.word	0x992de018	! t0_kref+0x241c:   	sll	%l7, 0x18, %o4
	.word	0xec267fe8	! t0_kref+0x2420:   	st	%l6, [%i1 - 0x18]
	.word	0x9fc00004	! t0_kref+0x2424:   	call	%g0 + %g4
	.word	0x98254000	! t0_kref+0x2428:   	sub	%l5, %g0, %o4
	.word	0xf9801019	! t0_kref+0x242c:   	lda	[%g0 + %i1]0x80, %f28
	.word	0xfb6e6008	! t0_kref+0x2430:   	prefetch	%i1 + 8, 29
	.word	0x81af4abd	! t0_kref+0x2434:   	fcmpes	%fcc0, %f29, %f29
2:	.word	0xd240a004	! t0_kref+0x2438:   	ldsw	[%g2 + 4], %o1
	.word	0xe81e2010	! t0_kref+0x243c:   	ldd	[%i0 + 0x10], %l4
	.word	0x982d8016	! t0_kref+0x2440:   	andn	%l6, %l6, %o4
	.word	0x81ad0a3b	! t0_kref+0x2444:   	fcmps	%fcc0, %f20, %f27
	.word	0xada01a50	! t0_kref+0x2448:   	fdtoi	%f16, %f22
	.word	0x925a4017	! t0_kref+0x244c:   	smul	%o1, %l7, %o1
	.word	0x81ae8a33	! t0_kref+0x2450:   	fcmps	%fcc0, %f26, %f19
	.word	0x96a22c8d	! t0_kref+0x2454:   	subcc	%o0, 0xc8d, %o3
	.word	0x933dc00c	! t0_kref+0x2458:   	sra	%l7, %o4, %o1
	.word	0xb5a488d2	! t0_kref+0x245c:   	fsubd	%f18, %f18, %f26
	.word	0xa9a7493e	! t0_kref+0x2460:   	fmuls	%f29, %f30, %f20
	.word	0xf42e4000	! t0_kref+0x2464:   	stb	%i2, [%i1]
	.word	0x81ad8a56	! t0_kref+0x2468:   	fcmpd	%fcc0, %f22, %f22
	.word	0xd20e0000	! t0_kref+0x246c:   	ldub	[%i0], %o1
	.word	0x942ac01a	! t0_kref+0x2470:   	andn	%o3, %i2, %o2
	.word	0xd2f81019	! t0_kref+0x2474:   	swapa	[%g0 + %i1]0x80, %o1
	.word	0xea2e2006	! t0_kref+0x2478:   	stb	%l5, [%i0 + 6]
	.word	0xd820a03c	! t0_kref+0x247c:   	st	%o4, [%g2 + 0x3c]
	.word	0x9263000d	! t0_kref+0x2480:   	subc	%o4, %o5, %o1
	.word	0x989a2e83	! t0_kref+0x2484:   	xorcc	%o0, 0xe83, %o4
	.word	0x9722c000	! t0_kref+0x2488:   	mulscc	%o3, %g0, %o3
	.word	0x8143c000	! t0_kref+0x248c:   	stbar
	.word	0x96228017	! t0_kref+0x2490:   	sub	%o2, %l7, %o3
	.word	0x982029d8	! t0_kref+0x2494:   	sub	%g0, 0x9d8, %o4
	.word	0xe66e401a	! t0_kref+0x2498:   	ldstub	[%i1 + %i2], %l3
	.word	0x8143c000	! t0_kref+0x249c:   	stbar
	.word	0xd610a028	! t0_kref+0x24a0:   	lduh	[%g2 + 0x28], %o3
	.word	0x8182c000	! t0_kref+0x24a4:   	wr	%o3, %g0, %y
	.word	0x94354016	! t0_kref+0x24a8:   	orn	%l5, %l6, %o2
	.word	0x81ae0ab4	! t0_kref+0x24ac:   	fcmpes	%fcc0, %f24, %f20
	.word	0xb1a4cd3d	! t0_kref+0x24b0:   	fsmuld	%f19, %f29, %f24
	.word	0xe9be584a	! t0_kref+0x24b4:   	stda	%f20, [%i1 + %o2]0xc2
	.word	0x98da6f03	! t0_kref+0x24b8:   	smulcc	%o1, 0xf03, %o4
	.word	0x86102002	! t0_kref+0x24bc:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x24c0:   	bne,a	_kref+0x24c0
	.word	0x86a0e001	! t0_kref+0x24c4:   	subcc	%g3, 1, %g3
	.word	0xada01a50	! t0_kref+0x24c8:   	fdtoi	%f16, %f22
	.word	0x81ac4abd	! t0_kref+0x24cc:   	fcmpes	%fcc0, %f17, %f29
	.word	0x9336a007	! t0_kref+0x24d0:   	srl	%i2, 0x7, %o1
	.word	0xef00a004	! t0_kref+0x24d4:   	ld	[%g2 + 4], %f23
	.word	0xd84e3fe5	! t0_kref+0x24d8:   	ldsb	[%i0 - 0x1b], %o4
	.word	0x98deacf5	! t0_kref+0x24dc:   	smulcc	%i2, 0xcf5, %o4
	.word	0x92f5c00b	! t0_kref+0x24e0:   	udivcc	%l7, %o3, %o1
	.word	0x928ac00b	! t0_kref+0x24e4:   	andcc	%o3, %o3, %o1
	.word	0xb7a018d0	! t0_kref+0x24e8:   	fdtos	%f16, %f27
	.word	0xd826001c	! t0_kref+0x24ec:   	st	%o4, [%i0 + %i4]
	.word	0xeb070019	! t0_kref+0x24f0:   	ld	[%i4 + %i1], %f21
	.word	0x9de3bfa0	! t0_kref+0x24f4:   	save	%sp, -0x60, %sp
	.word	0x93e8001d	! t0_kref+0x24f8:   	restore	%g0, %i5, %o1
	.word	0xb9a018dc	! t0_kref+0x24fc:   	fdtos	%f28, %f28
	.word	0x968dac27	! t0_kref+0x2500:   	andcc	%l6, 0xc27, %o3
	.word	0xf11e2010	! t0_kref+0x2504:   	ldd	[%i0 + 0x10], %f24
	.word	0x81af0a5c	! t0_kref+0x2508:   	fcmpd	%fcc0, %f28, %f28
	.word	0x92e30017	! t0_kref+0x250c:   	subccc	%o4, %l7, %o1
	.word	0xe56e3ff0	! t0_kref+0x2510:   	prefetch	%i0 - 0x10, 18
	.word	0xd84e6006	! t0_kref+0x2514:   	ldsb	[%i1 + 6], %o4
	.word	0x9630000a	! t0_kref+0x2518:   	orn	%g0, %o2, %o3
	.word	0x945e800d	! t0_kref+0x251c:   	smul	%i2, %o5, %o2
	.word	0xe4086224	! t0_kref+0x2520:   	ldub	[%g1 + 0x224], %l2
	.word	0xa41ca00c	! t0_kref+0x2524:   	xor	%l2, 0xc, %l2
	.word	0xe4286224	! t0_kref+0x2528:   	stb	%l2, [%g1 + 0x224]
	.word	0x81d86224	! t0_kref+0x252c:   	flush	%g1 + 0x224
	.word	0xfb06200c	! t0_kref+0x2530:   	ld	[%i0 + 0xc], %f29
	.word	0x993b6011	! t0_kref+0x2534:   	sra	%o5, 0x11, %o4
2:	.word	0x920dc01a	! t0_kref+0x2538:   	and	%l7, %i2, %o1
	.word	0xd4060000	! t0_kref+0x253c:   	ld	[%i0], %o2
	.word	0xf4264000	! t0_kref+0x2540:   	st	%i2, [%i1]
	.word	0xd01e0000	! t0_kref+0x2544:   	ldd	[%i0], %o0
	.word	0xaba018d6	! t0_kref+0x2548:   	fdtos	%f22, %f21
	.word	0xda20a004	! t0_kref+0x254c:   	st	%o5, [%g2 + 4]
	.word	0xea200019	! t0_kref+0x2550:   	st	%l5, [%g0 + %i1]
	.word	0x81ae0a56	! t0_kref+0x2554:   	fcmpd	%fcc0, %f24, %f22
	.word	0xf91e3fe8	! t0_kref+0x2558:   	ldd	[%i0 - 0x18], %f28
	.word	0xb9a6895a	! t0_kref+0x255c:   	fmuld	%f26, %f26, %f28
	.word	0x94757637	! t0_kref+0x2560:   	udiv	%l5, -0x9c9, %o2
	.word	0x94336abc	! t0_kref+0x2564:   	orn	%o5, 0xabc, %o2
	.word	0x9252c017	! t0_kref+0x2568:   	umul	%o3, %l7, %o1
	.word	0xada01a37	! t0_kref+0x256c:   	fstoi	%f23, %f22
	.word	0x9760000b	! t0_kref+0x2570:   	movn	%fcc0, %o3, %o3
	.word	0x965a797a	! t0_kref+0x2574:   	smul	%o1, -0x686, %o3
	.word	0x93280017	! t0_kref+0x2578:   	sll	%g0, %l7, %o1
	.word	0xa5a40954	! t0_kref+0x257c:   	fmuld	%f16, %f20, %f18
	.word	0x8143c000	! t0_kref+0x2580:   	stbar
	.word	0x9636aad9	! t0_kref+0x2584:   	orn	%i2, 0xad9, %o3
	.word	0x96128017	! t0_kref+0x2588:   	or	%o2, %l7, %o3
	.word	0xb7a018d8	! t0_kref+0x258c:   	fdtos	%f24, %f27
	.word	0x932e800d	! t0_kref+0x2590:   	sll	%i2, %o5, %o1
	.word	0x23800003	! t0_kref+0x2594:   	fbne,a	_kref+0x25a0
	.word	0xec28a010	! t0_kref+0x2598:   	stb	%l6, [%g2 + 0x10]
	.word	0x93408000	! t0_kref+0x259c:   	mov	%ccr, %o1
	.word	0x93408000	! t0_kref+0x25a0:   	mov	%ccr, %o1
	.word	0x92630016	! t0_kref+0x25a4:   	subc	%o4, %l6, %o1
	.word	0x9de3bfa0	! t0_kref+0x25a8:   	save	%sp, -0x60, %sp
	.word	0x99e83528	! t0_kref+0x25ac:   	restore	%g0, -0xad8, %o4
	.word	0xa7a0053c	! t0_kref+0x25b0:   	fsqrts	%f28, %f19
	.word	0xc76e400c	! t0_kref+0x25b4:   	prefetch	%i1 + %o4, 3
	.word	0x985ea733	! t0_kref+0x25b8:   	smul	%i2, 0x733, %o4
	.word	0xe078a020	! t0_kref+0x25bc:   	swap	[%g2 + 0x20], %l0
	.word	0x94db7011	! t0_kref+0x25c0:   	smulcc	%o5, -0xfef, %o2
	.word	0xa1a508da	! t0_kref+0x25c4:   	fsubd	%f20, %f26, %f16
	.word	0xe5b81019	! t0_kref+0x25c8:   	stda	%f18, [%g0 + %i1]0x80
	.word	0x8143c000	! t0_kref+0x25cc:   	stbar
	.word	0x81ac8a52	! t0_kref+0x25d0:   	fcmpd	%fcc0, %f18, %f18
	.word	0x96b2e462	! t0_kref+0x25d4:   	orncc	%o3, 0x462, %o3
	.word	0xed060000	! t0_kref+0x25d8:   	ld	[%i0], %f22
	.word	0xb1a00539	! t0_kref+0x25dc:   	fsqrts	%f25, %f24
	.word	0x95227969	! t0_kref+0x25e0:   	mulscc	%o1, -0x697, %o2
	.word	0xd448a019	! t0_kref+0x25e4:   	ldsb	[%g2 + 0x19], %o2
	.word	0x960aa8e1	! t0_kref+0x25e8:   	and	%o2, 0x8e1, %o3
	.word	0xb7a00538	! t0_kref+0x25ec:   	fsqrts	%f24, %f27
	.word	0xe51fbc60	! t0_kref+0x25f0:   	ldd	[%fp - 0x3a0], %f18
	.word	0xd8f65000	! t0_kref+0x25f4:   	stxa	%o4, [%i1]0x80
	.word	0x2a800001	! t0_kref+0x25f8:   	bcs,a	_kref+0x25fc
	.word	0xd2467ff8	! t0_kref+0x25fc:   	ldsw	[%i1 - 8], %o1
	.word	0x9740c000	! t0_kref+0x2600:   	mov	%asi, %o3
	.word	0x988ac00b	! t0_kref+0x2604:   	andcc	%o3, %o3, %o4
	.word	0xb5a50d32	! t0_kref+0x2608:   	fsmuld	%f20, %f18, %f26
	.word	0xf11e001d	! t0_kref+0x260c:   	ldd	[%i0 + %i5], %f24
	.word	0x96f5739c	! t0_kref+0x2610:   	udivcc	%l5, -0xc64, %o3
	.word	0x81868000	! t0_kref+0x2614:   	wr	%i2, %g0, %y
	.word	0x9538201c	! t0_kref+0x2618:   	sra	%g0, 0x1c, %o2
	.word	0x982a400a	! t0_kref+0x261c:   	andn	%o1, %o2, %o4
	.word	0xfd6e3ff0	! t0_kref+0x2620:   	prefetch	%i0 - 0x10, 30
	.word	0xe500a020	! t0_kref+0x2624:   	ld	[%g2 + 0x20], %f18
	.word	0xd810a02c	! t0_kref+0x2628:   	lduh	[%g2 + 0x2c], %o4
	.word	0x2d800002	! t0_kref+0x262c:   	fbg,a	_kref+0x2634
	.word	0xdbf6100b	! t0_kref+0x2630:   	casxa	[%i0]0x80, %o3, %o5
	.word	0xb7a01899	! t0_kref+0x2634:   	fitos	%f25, %f27
	.word	0x31800007	! t0_kref+0x2638:   	fba,a	_kref+0x2654
	.word	0x968db2c7	! t0_kref+0x263c:   	andcc	%l6, -0xd39, %o3
	.word	0x94580000	! t0_kref+0x2640:   	smul	%g0, %g0, %o2
	.word	0xbda01a31	! t0_kref+0x2644:   	fstoi	%f17, %f30
	.word	0x28800008	! t0_kref+0x2648:   	bleu,a	_kref+0x2668
	.word	0xa3a0053e	! t0_kref+0x264c:   	fsqrts	%f30, %f17
	.word	0x98da000c	! t0_kref+0x2650:   	smulcc	%o0, %o4, %o4
	.word	0x98902576	! t0_kref+0x2654:   	orcc	%g0, 0x576, %o4
	.word	0xa5a01933	! t0_kref+0x2658:   	fstod	%f19, %f18
	.word	0xd8066018	! t0_kref+0x265c:   	ld	[%i1 + 0x18], %o4
	.word	0x81ac0a58	! t0_kref+0x2660:   	fcmpd	%fcc0, %f16, %f24
	.word	0xb5a00037	! t0_kref+0x2664:   	fmovs	%f23, %f26
	.word	0x001fffff	! t0_kref+0x2668:   	illtrap	0x1fffff
	.word	0x96330017	! t0_kref+0x266c:   	orn	%o4, %l7, %o3
	.word	0xd630a000	! t0_kref+0x2670:   	sth	%o3, [%g2]
	.word	0x96f6800a	! t0_kref+0x2674:   	udivcc	%i2, %o2, %o3
	.word	0xa3a01a56	! t0_kref+0x2678:   	fdtoi	%f22, %f17
	.word	0xea30a032	! t0_kref+0x267c:   	sth	%l5, [%g2 + 0x32]
	.word	0x965b31fd	! t0_kref+0x2680:   	smul	%o4, -0xe03, %o3
	.word	0xbda01038	! t0_kref+0x2684:   	fstox	%f24, %f30
	.word	0x2e800002	! t0_kref+0x2688:   	bvs,a	_kref+0x2690
	.word	0xd808a009	! t0_kref+0x268c:   	ldub	[%g2 + 9], %o4
	.word	0xf16e401c	! t0_kref+0x2690:   	prefetch	%i1 + %i4, 24
	.word	0xd240a000	! t0_kref+0x2694:   	ldsw	[%g2], %o1
	.word	0x96db3d99	! t0_kref+0x2698:   	smulcc	%o4, -0x267, %o3
	.word	0xe40863ac	! t0_kref+0x269c:   	ldub	[%g1 + 0x3ac], %l2
	.word	0xa41ca00c	! t0_kref+0x26a0:   	xor	%l2, 0xc, %l2
	.word	0xe42863ac	! t0_kref+0x26a4:   	stb	%l2, [%g1 + 0x3ac]
	.word	0x81d863ac	! t0_kref+0x26a8:   	flush	%g1 + 0x3ac
	.word	0xd60e0000	! t0_kref+0x26ac:   	ldub	[%i0], %o3
	.word	0x9640287a	! t0_kref+0x26b0:   	addc	%g0, 0x87a, %o3
	.word	0x96da611b	! t0_kref+0x26b4:   	smulcc	%o1, 0x11b, %o3
	.word	0x9665a106	! t0_kref+0x26b8:   	subc	%l6, 0x106, %o3
	.word	0x993da01f	! t0_kref+0x26bc:   	sra	%l6, 0x1f, %o4
2:	.word	0x949dc008	! t0_kref+0x26c0:   	xorcc	%l7, %o0, %o2
	.word	0xf9be5855	! t0_kref+0x26c4:   	stda	%f28, [%i1 + %l5]0xc2
	.word	0x9465a5a0	! t0_kref+0x26c8:   	subc	%l6, 0x5a0, %o2
	.word	0xf11fbcf0	! t0_kref+0x26cc:   	ldd	[%fp - 0x310], %f24
	.word	0xd6462000	! t0_kref+0x26d0:   	ldsw	[%i0], %o3
	.word	0x92d6a6a3	! t0_kref+0x26d4:   	umulcc	%i2, 0x6a3, %o1
	.word	0xc807bfec	! t0_kref+0x26d8:   	ld	[%fp - 0x14], %g4
	.word	0xda36600e	! t0_kref+0x26dc:   	sth	%o5, [%i1 + 0xe]
	.word	0xa5a0015a	! t0_kref+0x26e0:   	fabsd	%f26, %f18
	.word	0x86102003	! t0_kref+0x26e4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x26e8:   	bne,a	_kref+0x26e8
	.word	0x86a0e001	! t0_kref+0x26ec:   	subcc	%g3, 1, %g3
	.word	0xd83e4000	! t0_kref+0x26f0:   	std	%o4, [%i1]
	.word	0x99202e5e	! t0_kref+0x26f4:   	mulscc	%g0, 0xe5e, %o4
	.word	0xd810a016	! t0_kref+0x26f8:   	lduh	[%g2 + 0x16], %o4
	.word	0xd24e3ff8	! t0_kref+0x26fc:   	ldsb	[%i0 - 8], %o1
	.word	0x968a38f7	! t0_kref+0x2700:   	andcc	%o0, -0x709, %o3
	.word	0x81ae0ab7	! t0_kref+0x2704:   	fcmpes	%fcc0, %f24, %f23
	.word	0xa5a70958	! t0_kref+0x2708:   	fmuld	%f28, %f24, %f18
	.word	0x9fc00004	! t0_kref+0x270c:   	call	%g0 + %g4
	.word	0x81db391d	! t0_kref+0x2710:   	flush	%o4 - 0x6e3
	.word	0x92358015	! t0_kref+0x2714:   	orn	%l6, %l5, %o1
	.word	0xd840a000	! t0_kref+0x2718:   	ldsw	[%g2], %o4
	.word	0xc020a004	! t0_kref+0x271c:   	clr	[%g2 + 4]
	.word	0x92ad4015	! t0_kref+0x2720:   	andncc	%l5, %l5, %o1
	.word	0x927a4000	! t0_kref+0x2724:   	sdiv	%o1, %g0, %o1
	.word	0x98b6800b	! t0_kref+0x2728:   	orncc	%i2, %o3, %o4
	.word	0xb1a01931	! t0_kref+0x272c:   	fstod	%f17, %f24
	.word	0xe9801019	! t0_kref+0x2730:   	lda	[%g0 + %i1]0x80, %f20
	.word	0x94228000	! t0_kref+0x2734:   	sub	%o2, %g0, %o2
	.word	0xe500a01c	! t0_kref+0x2738:   	ld	[%g2 + 0x1c], %f18
	.word	0xbba5c9b6	! t0_kref+0x273c:   	fdivs	%f23, %f22, %f29
	.word	0xa7a00531	! t0_kref+0x2740:   	fsqrts	%f17, %f19
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x2748:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x7a2e0000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x7a7c0000)
.seg "text"
t0_subr1_page_begin:
	.skip 8192
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x7a66c000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x24306000)
.seg "text"
t0_subr3_page_begin:
	.skip 8180
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
!  Total operations: 2419  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.57   2.15
!  ldub              1.33   1.20
!  ldsh              0.34   0.29
!  lduh              0.21   0.12
!  ld                0.41   0.41
!  ldd               1.00   1.28
!  swap              0.25   0.17
!  ldstub            0.39   0.74
!  stb               1.16   1.78
!  sth               1.01   1.20
!  st                1.27   1.32
!  std               1.08   0.74
!  add               0.10   0.12
!  addcc             1.24   1.07
!  addx              1.12   1.03
!  addxcc            0.51   0.45
!  taddcc            0.18   0.12
!  taddcctv          0.02   0.00
!  sub               1.60   2.15
!  subcc             1.25   1.74
!  subx              0.97   1.24
!  subxcc            1.27   1.61
!  tsubcc            0.17   0.12
!  tsubcctv          0.30   0.50
!  mulscc            1.44   1.36
!  and               0.88   0.79
!  andcc             1.36   1.57
!  andn              0.63   0.74
!  andncc            0.69   0.79
!  or                0.98   1.28
!  orcc              0.13   0.21
!  orn               1.00   0.95
!  orncc             0.42   0.45
!  xor               1.12   1.07
!  xorcc             1.05   1.03
!  xnor              0.54   0.41
!  xnorcc            0.25   0.25
!  sll               0.94   0.66
!  srl               1.10   1.07
!  sra               1.16   1.49
!  unimp             0.19   0.33
!  umul              0.97   1.28
!  smul              1.47   1.82
!  udiv              0.68   0.58
!  sdiv              0.16   0.29
!  umulcc            0.45   0.66
!  smulcc            1.57   1.86
!  udivcc            1.48   1.41
!  sdivcc            1.25   1.69
!  rdy               0.13   0.08
!  wry               1.52   1.53
!  bicc              3.21   2.89
!  sethi             0.62   0.62
!  jmpl              1.54   1.20
!  call              0.89   0.74
!  ticc              0.00   0.00
!  flush             1.06   1.24
!  save              0.41   0.29
!  restore           0.50   0.00
!  stbar             1.56   1.86
!  ldf               1.04   1.16
!  lddf              1.56   1.65
!  stf               0.18   0.12
!  stdf              1.12   0.79
!  fadds             0.31   0.12
!  fsubs             0.14   0.04
!  fmuls             0.31   0.41
!  fdivs             0.20   0.17
!  faddd             0.30   0.17
!  fsubd             1.60   1.69
!  fmuld             1.25   1.20
!  fdivd             1.23   0.91
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.61   0.54
!  fdmulq            0.00   0.00
!  fitos             0.32   0.33
!  fitod             1.15   1.16
!  fitoq             0.00   0.00
!  fstoi             1.29   1.36
!  fstod             0.71   0.66
!  fstoq             0.00   0.00
!  fdtoi             1.25   1.45
!  fdtos             1.16   1.57
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.58   0.50
!  fnegs             0.01   0.04
!  fabss             0.35   0.29
!  fsqrts            1.02   1.20
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.58   0.29
!  fcmpd             1.54   1.20
!  fcmpq             0.00   0.00
!  fcmpes            0.98   1.03
!  fcmped            0.08   0.00
!  fcmpeq            0.00   0.00
!  fbfcc             2.71   2.15
!  ldfsr             0.13   0.00
!  stfsr             0.12   0.04
!  loop              0.64   0.70
!  offset            0.09   0.00
!  area              0.09   0.08
!  target            0.23   0.29
!  goto              0.03   0.12
!  sigsegv           0.15   0.17
!  sigbus            0.00   0.00
!  imodify           0.93   0.50
!  ldfsr_offset      0.31   0.00
!  fpattern          0.50   0.33
!  lbranch           0.18   0.33
!  shmld             6.16   5.75
!  shmst             2.14   2.40
!  shmpf             0.06   0.00
!  shmswap           0.31   0.33
!  shmblkld          0.71   0.00
!  shmblkst          0.01   0.00
!  shmblkchk         0.08   0.12
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
!  casa              0.29   0.45
!  rdasi             0.30   0.29
!  wrasi             0.21   0.08
!  bpcc              0.14   0.17
!  fbpfcc            0.51   0.50
!  fmovscc           0.05   0.04
!  fmovdcc           0.31   0.29
!  fmovqcc           0.00   0.00
!  movcc             0.18   0.12
!  flushw            0.14   0.17
!  membar            0.32   0.17
!  prefetch          0.89   1.16
!  rdpc              0.22   0.25
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.20   0.25
!  lddfa             0.11   0.04
!  ldqfa             0.00   0.00
!  ldsba             0.02   0.00
!  ldsha             0.17   0.00
!  lduba             0.09   0.04
!  lduha             0.01   0.00
!  lda               0.30   0.33
!  ldda              0.00   0.00
!  ldstuba           0.04   0.00
!  prefetcha         0.60   0.54
!  stfa              0.32   0.12
!  stdfa             0.30   0.33
!  stqfa             0.00   0.00
!  stba              0.06   0.12
!  stha              0.09   0.17
!  sta               0.22   0.25
!  stda              0.12   0.12
!  swapa             0.24   0.29
!  fmovd             0.26   0.21
!  fnegd             0.14   0.00
!  fabsd             0.25   0.29
!  fstox             0.30   0.21
!  fdtox             0.05   0.00
!  fxtos             0.02   0.00
!  fxtod             0.13   0.21
!  lds               0.23   0.33
!  ldsa              0.21   0.04
!  ldx               0.13   0.17
!  ldxa              0.26   0.12
!  nofault           0.09   0.00
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
!  partial_st8       0.09   0.12
!  partial_st16      0.17   0.29
!  partial_st32      0.17   0.12
!  short_st8         0.31   0.37
!  short_st16        0.05   0.08
!  short_ld8         0.21   0.37
!  short_ld16        0.00   0.00
!  blkld             0.11   0.00
!  blkst             0.05   0.00
!  blkld_offset      0.22   0.00
!  blkst_offset      0.23   0.00
!  blk_check         0.03   0.00
!  casxa             0.18   0.21
!  rdccr             0.27   0.33
!  rdfprs            0.25   0.25
!  wrccr             0.32   0.29
!  popc              0.04   0.00
!  wrfprs            0.02   0.00
!  stx               0.08   0.12
!  stxa              0.13   0.12
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
KDATA_MODULE(t0_module_offset_table, 0x1ed64000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xffffffe0
	.word	0x00000008
	.word	0x00000000
	.word	0x00000018
	.word	0xfffffff8
	.word	0x00000010
	.word	0xffffffe8
	.word	0xfffffff0
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

KDATA_MODULE(t0_module_data_in_regs, 0x7852e000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x79ca36b4          ! %f0
	.word	0x3349f7ec          ! %f1
	.word	0xa2881303          ! %f2
	.word	0xace59fa1          ! %f3
	.word	0x351a1829          ! %f4
	.word	0xb2df7e11          ! %f5
	.word	0x264f8203          ! %f6
	.word	0xd030ebcf          ! %f7
	.word	0xc0c6f996          ! %f8
	.word	0xcb0ca238          ! %f9
	.word	0x3543ef28          ! %f10
	.word	0x0f75848b          ! %f11
	.word	0xa5b1996a          ! %f12
	.word	0x41bdf73f          ! %f13
	.word	0x243152a2          ! %f14
	.word	0x7fd7f055          ! %f15
	.word	0x8dde3aeb          ! %f16
	.word	0x635b1cc2          ! %f17
	.word	0xb7fd7f06          ! %f18
	.word	0x33ec2a27          ! %f19
	.word	0xb18b7559          ! %f20
	.word	0x20c74968          ! %f21
	.word	0xc59a7f09          ! %f22
	.word	0x7ed5a5ea          ! %f23
	.word	0xe2c45152          ! %f24
	.word	0x132fa67a          ! %f25
	.word	0xfb9a8b8b          ! %f26
	.word	0xfafea82b          ! %f27
	.word	0x142c5878          ! %f28
	.word	0xda2b50b5          ! %f29
	.word	0x51feddd7          ! %f30
	.word	0xc4c0e50e          ! %f31
	.word	0xf28a7b50          ! %f32
	.word	0xec9a1260          ! %f33
	.word	0xf6aae229          ! %f34
	.word	0xb0849a82          ! %f35
	.word	0x2181f16d          ! %f36
	.word	0x65ec2a9f          ! %f37
	.word	0xcb798e6f          ! %f38
	.word	0x1a7a99b6          ! %f39
	.word	0x213677cd          ! %f40
	.word	0x994eb609          ! %f41
	.word	0xb68ae154          ! %f42
	.word	0x4768f3cb          ! %f43
	.word	0xb68b9182          ! %f44
	.word	0x17dd8c78          ! %f45
	.word	0x6a3bcd79          ! %f46
	.word	0x21493dca          ! %f47
	.word	0xa884ae94          ! %f48
	.word	0x47b4a821          ! %f49
	.word	0xb89b1505          ! %f50
	.word	0x92f29fd7          ! %f51
	.word	0xad465d25          ! %f52
	.word	0xe4c869e3          ! %f53
	.word	0x9251d95f          ! %f54
	.word	0x82f923a6          ! %f55
	.word	0xc696e8d6          ! %f56
	.word	0x9b0d4ee3          ! %f57
	.word	0x131ee33a          ! %f58
	.word	0xc28ef62e          ! %f59
	.word	0x02bf0c69          ! %f60
	.word	0x00eceb58          ! %f61
	.word	0x526fe6d1          ! %f62
	.word	0x78cb909d          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x2c        ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xd90f991b          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x2969b680          ! %o0
	.word	0xfc8e6845          ! %o1
	.word	0x7096a437          ! %o2
	.word	0xf750795c          ! %o3
	.word	0xbc2c4b4f          ! %o4
	.word	0x8ee77b60          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x719199a7          ! %l0
	.word	0x4a8f3ea3          ! %l1
	.word	0x75944873          ! %l2
	.word	0x2087fc8b          ! %l3
	.word	0x186b3b84          ! %l4
	.word	0x275cb4a2          ! %l5
	.word	0xdeb92542          ! %l6
	.word	0x063ea771          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffffa          ! %i2 (byte offset)
	.word	0x00000016          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0xffffffe0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x26b2d368          ! %y
	.word	0x0000000d          ! %icc (nzvc)
	.word	0x40000783          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x6beb4000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x329f391e
	.word	0xcaa65241
	.word	0x7723a69d
	.word	0x924e8dab
	.word	0xd12e05e4
	.word	0x3adb3777
	.word	0xa23afc80
	.word	0x22c042c2
	.word	0x644e2faa
	.word	0xe33bff38
	.word	0xe49a37d1
	.word	0x3237b099
	.word	0x42d33266
	.word	0x99cd20da
	.word	0xdc8a495e
	.word	0x2ca0a1b7
	.word	0x6caf6737
	.word	0x1b1780ea
	.word	0x42585f8f
	.word	0x4fd3ca66
	.word	0x92726792
	.word	0x5409664d
	.word	0xae8c9ebb
	.word	0xffeebc72
	.word	0xb46defc1
	.word	0xa30f1da8
	.word	0xcc638ab6
	.word	0x0650d330
	.word	0x3c21f48e
	.word	0xe087ef01
	.word	0xb37bf5ae
	.word	0x08ac5bc1
	.word	0x2f67e03b
	.word	0xc9e249a6
	.word	0x00748837
	.word	0x56cb7d98
	.word	0x87e02ab4
	.word	0x19f44a4d
	.word	0x9c5136a3
	.word	0xf99ca738
	.word	0x01a4c107
	.word	0xcad3ff7c
	.word	0xd7323797
	.word	0x1d128342
	.word	0xbd75f013
	.word	0xf3c5102a
	.word	0x416b4fda
	.word	0x2c9fb9ae
	.word	0xb3bec67f
	.word	0x9707a8a6
	.word	0x4fa38770
	.word	0x77d70158
	.word	0x3a2921ee
	.word	0xc9aed1b8
	.word	0x70929be7
	.word	0xe63c45be
	.word	0x4448db70
	.word	0x99629605
	.word	0x7e72c3f0
	.word	0x1edbe508
	.word	0xc468c73b
	.word	0x435499b7
	.word	0xe8929830
	.word	0xce094a47
	.word	0xcafb7b9a
	.word	0xeaf4085d
	.word	0x2bdc3558
	.word	0x21f66801
	.word	0x14dd1324
	.word	0x6057fd0f
	.word	0x20e3eb72
	.word	0xb1e9d6ed
	.word	0x71b25e31
	.word	0x6c25c8d5
	.word	0xcc620e7e
	.word	0x53f19cfa
	.word	0x4f85378a
	.word	0xe32abb48
	.word	0x1120bc3d
	.word	0xb64ce096
	.word	0x3e84f05f
	.word	0xbd37517a
	.word	0x499fab4b
	.word	0x34a70c2c
	.word	0x12cd077d
	.word	0xfb43ef12
	.word	0x293d5773
	.word	0x69e325ed
	.word	0x89839fbf
	.word	0x1ec585bb
	.word	0xa1d61f3e
	.word	0x85de5fd2
	.word	0xd5c469c5
	.word	0xc19acebf
	.word	0x10bf26cd
	.word	0xcf7d23e2
	.word	0xffe3f4e4
	.word	0xd960faee
	.word	0xde0c13e8
	.word	0xd6c620b0
	.word	0x89e29b5c
	.word	0xd488fcc4
	.word	0x906bf756
	.word	0x55031a27
	.word	0xc5a57dd0
	.word	0xe974d0ca
	.word	0x3fdaf76e
	.word	0x3a178289
	.word	0xd7ff41f2
	.word	0x2276683c
	.word	0x3f2b8fee
	.word	0xdab91fb5
	.word	0x9df9887d
	.word	0x530019eb
	.word	0xd1437b0a
	.word	0x0b3740a8
	.word	0xdb6b4e68
	.word	0xbcf0bd65
	.word	0x281597c8
	.word	0x62414745
	.word	0x01f7ad58
	.word	0xaee3d452
	.word	0xb223618a
	.word	0x1ee58a58
	.word	0xf153af55
	.word	0x60106620
	.word	0xa4e5ccec
	.word	0xb90dd3d8
	.word	0xb46929c0
	.word	0x39c771e2
	.word	0x98269dd0
	.word	0xfc4eff6c
	.word	0x0dd7d384
	.word	0x344d1a75
	.word	0x15508ab6
	.word	0x76357d30
	.word	0xb0b50a8c
	.word	0xead5f0e4
	.word	0xf74dc150
	.word	0xc390bcb8
	.word	0x0b7dfc74
	.word	0x3324010d
	.word	0xf0f1a055
	.word	0xefdbc454
	.word	0x4a372682
	.word	0xded58484
	.word	0x3263ba95
	.word	0x37017895
	.word	0x94ef60d7
	.word	0x81315fb6
	.word	0xeecf774d
	.word	0x609f5810
	.word	0xf08be8e1
	.word	0xb25bcd51
	.word	0x03fce3bc
	.word	0xf4d1af61
	.word	0x9c261f13
	.word	0x029fdbe3
	.word	0xa2ac89f5
	.word	0x51c08972
	.word	0x549aebd8
	.word	0x3c20a1c1
	.word	0x09d960f7
	.word	0x4ed4dffd
	.word	0xcd76ffc4
	.word	0x690f4b29
	.word	0xfda129fa
	.word	0x82f1d04f
t0_data_in_sp:
	.word	0x996a630c
	.word	0x76b166ab
	.word	0xfdc4cf0b
	.word	0x5685d84d
	.word	0x10210838
	.word	0xfc5513c4
	.word	0x94b796da
	.word	0xf5045fbc
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xffffffed
	.word	0x0000001a
	.word	0x00000000
	.word	0xfffffff8
	.word	t0_data_in_fp
	.word	0x69b81d10
	.word	0x6d84646a
	.word	0x70e2ca95
	.word	0x54feab03
	.word	0x7bc02041
	.word	0x4aeb92ba
	.word	0x13a81db5
	.word	0xc9a5f427
	.word	0xf78a500f
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
	.word   	0x55f53151	! [%fp - 0xc]
	.word   	0xe08bb7f9	! [%fp - 0x8]
	.word   	0x395b00d2	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x7702a312
	.word	0xb876ff45
	.word	0x41dd222b
	.word	0x88f79844
	.word	0x9541a7ea
	.word	0x79cfad8a
	.word	0x13fea7cb
	.word	0x17eb59f9
	.word	0x3344d3a6
	.word	0x53fe1787
	.word	0xbd8d6612
	.word	0x5677ba66
	.word	0x6272d268
	.word	0xfd9af0e6
	.word	0x184cc733
	.word	0x1d6296e1
	.word	0x2981be48
	.word	0x275efcab
	.word	0x1737ede3
	.word	0x9fa994e0
	.word	0x714f6078
	.word	0xe3ed2188
	.word	0x1b3fd51b
	.word	0x90afc065
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x35612000)
.seg "data"
t0_data_in_area0_start:
.skip 8128
t0_data_in_area0_begin:
	.word	0xed99e0a9	! t0_data_in_area0-0x20
	.word	0x1438ef6e	! t0_data_in_area0-0x1c
	.word	0xb365281c	! t0_data_in_area0-0x18
	.word	0xc3021db9	! t0_data_in_area0-0x14
	.word	0xbb8986ad	! t0_data_in_area0-0x10
	.word	0x67576a67	! t0_data_in_area0-0xc
	.word	0xf24916b3	! t0_data_in_area0-0x8
	.word	0x5c672257	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x8be2725e	! t0_data_in_area0+0x0
	.word	0x3b112ea2	! t0_data_in_area0+0x4
	.word	0xf340a9be	! t0_data_in_area0+0x8
	.word	0x3eb8492b	! t0_data_in_area0+0xc
	.word	0x7abf6dbd	! t0_data_in_area0+0x10
	.word	0x406a41cf	! t0_data_in_area0+0x14
	.word	0xbfaa5bee	! t0_data_in_area0+0x18
	.word	0x614435fc	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x721e6000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x91253d5d	! t0_data_in_shm_area+0x0 (t0)
	.word	0xd5c525ad	! t0_data_in_shm_area+0x4 (t0)
	.word	0xaafdfacd	! t0_data_in_shm_area+0x8 (t0)
	.word	0x2f6b1c25	! t0_data_in_shm_area+0xc (t0)
	.word	0x57d01302	! t0_data_in_shm_area+0x10 (t0)
	.word	0x048bffe0	! t0_data_in_shm_area+0x14 (t0)
	.word	0xdd0b1403	! t0_data_in_shm_area+0x18 (t0)
	.word	0x2e0e5c8b	! t0_data_in_shm_area+0x1c (t0)
	.word	0xc4930684	! t0_data_in_shm_area+0x20 (t0)
	.word	0x83a3eb07	! t0_data_in_shm_area+0x24 (t0)
	.word	0x0e5a72d4	! t0_data_in_shm_area+0x28 (t0)
	.word	0xf5878eca	! t0_data_in_shm_area+0x2c (t0)
	.word	0x2ebbb8f9	! t0_data_in_shm_area+0x30 (t0)
	.word	0xe79bc50e	! t0_data_in_shm_area+0x34 (t0)
	.word	0x26eb71ec	! t0_data_in_shm_area+0x38 (t0)
	.word	0x386a69b1	! t0_data_in_shm_area+0x3c (t0)
	.word	0x496a8612	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xb6c90ec0	! t0_data_in_shm_area+0x44
	.word	0x33ce255e	! t0_data_in_shm_area+0x48
	.word	0x0b983ef0	! t0_data_in_shm_area+0x4c
	.word	0x76f1e7c5	! t0_data_in_shm_area+0x50
	.word	0xaf9ab09f	! t0_data_in_shm_area+0x54
	.word	0x00a7a0ea	! t0_data_in_shm_area+0x58
	.word	0xd962fe0f	! t0_data_in_shm_area+0x5c
	.word	0x1455f02c	! t0_data_in_shm_area+0x60
	.word	0x8b92b8f7	! t0_data_in_shm_area+0x64
	.word	0x0f3dde7e	! t0_data_in_shm_area+0x68
	.word	0x72e8f2a2	! t0_data_in_shm_area+0x6c
	.word	0xba2efdac	! t0_data_in_shm_area+0x70
	.word	0x96d56730	! t0_data_in_shm_area+0x74
	.word	0xecfd08ff	! t0_data_in_shm_area+0x78
	.word	0x1fb1b1bb	! t0_data_in_shm_area+0x7c
	.word	0x5ec10d59	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xd44d1864	! t0_data_in_shm_area+0x84
	.word	0x4d402f48	! t0_data_in_shm_area+0x88
	.word	0x9f27ea9f	! t0_data_in_shm_area+0x8c
	.word	0xe64b4f99	! t0_data_in_shm_area+0x90
	.word	0x2e47e931	! t0_data_in_shm_area+0x94
	.word	0x6343a372	! t0_data_in_shm_area+0x98
	.word	0x01130ebb	! t0_data_in_shm_area+0x9c
	.word	0x08a9e307	! t0_data_in_shm_area+0xa0
	.word	0x8c6d20cf	! t0_data_in_shm_area+0xa4
	.word	0xc8478a55	! t0_data_in_shm_area+0xa8
	.word	0x74ef04d8	! t0_data_in_shm_area+0xac
	.word	0xb09dd999	! t0_data_in_shm_area+0xb0
	.word	0x0f35b964	! t0_data_in_shm_area+0xb4
	.word	0x9dcd5f4f	! t0_data_in_shm_area+0xb8
	.word	0x932f5b8d	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x4a4c4000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x79ca36b4          ! %f0
	.word	0x3349f7ec          ! %f1
	.word	0xa2881303          ! %f2
	.word	0xace59fa1          ! %f3
	.word	0x351a1829          ! %f4
	.word	0xb2df7e11          ! %f5
	.word	0x264f8203          ! %f6
	.word	0xd030ebcf          ! %f7
	.word	0xc0c6f996          ! %f8
	.word	0xcb0ca238          ! %f9
	.word	0x3543ef28          ! %f10
	.word	0x0f75848b          ! %f11
	.word	0xa5b1996a          ! %f12
	.word	0x41bdf73f          ! %f13
	.word	0x243152a2          ! %f14
	.word	0x7fd7f055          ! %f15
	.word	0x8dde3aeb          ! %f16
	.word	0x635b1cc2          ! %f17
	.word	0xb7fd7f06          ! %f18
	.word	0x33ec2a27          ! %f19
	.word	0xb18b7559          ! %f20
	.word	0x20c74968          ! %f21
	.word	0xc59a7f09          ! %f22
	.word	0x7ed5a5ea          ! %f23
	.word	0xe2c45152          ! %f24
	.word	0x132fa67a          ! %f25
	.word	0xfb9a8b8b          ! %f26
	.word	0xfafea82b          ! %f27
	.word	0x142c5878          ! %f28
	.word	0xda2b50b5          ! %f29
	.word	0x51feddd7          ! %f30
	.word	0xc4c0e50e          ! %f31
	.word	0xf28a7b50          ! %f32
	.word	0xec9a1260          ! %f33
	.word	0xf6aae229          ! %f34
	.word	0xb0849a82          ! %f35
	.word	0x2181f16d          ! %f36
	.word	0x65ec2a9f          ! %f37
	.word	0xcb798e6f          ! %f38
	.word	0x1a7a99b6          ! %f39
	.word	0x213677cd          ! %f40
	.word	0x994eb609          ! %f41
	.word	0xb68ae154          ! %f42
	.word	0x4768f3cb          ! %f43
	.word	0xb68b9182          ! %f44
	.word	0x17dd8c78          ! %f45
	.word	0x6a3bcd79          ! %f46
	.word	0x21493dca          ! %f47
	.word	0xa884ae94          ! %f48
	.word	0x47b4a821          ! %f49
	.word	0xb89b1505          ! %f50
	.word	0x92f29fd7          ! %f51
	.word	0xad465d25          ! %f52
	.word	0xe4c869e3          ! %f53
	.word	0x9251d95f          ! %f54
	.word	0x82f923a6          ! %f55
	.word	0xc696e8d6          ! %f56
	.word	0x9b0d4ee3          ! %f57
	.word	0x131ee33a          ! %f58
	.word	0xc28ef62e          ! %f59
	.word	0x02bf0c69          ! %f60
	.word	0x00eceb58          ! %f61
	.word	0x526fe6d1          ! %f62
	.word	0x78cb909d          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x2c        ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xd90f991b          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x2969b680          ! %o0
	.word	0xfc8e6845          ! %o1
	.word	0x7096a437          ! %o2
	.word	0xf750795c          ! %o3
	.word	0xbc2c4b4f          ! %o4
	.word	0x8ee77b60          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x719199a7          ! %l0
	.word	0x4a8f3ea3          ! %l1
	.word	0x75944873          ! %l2
	.word	0x2087fc8b          ! %l3
	.word	0x186b3b84          ! %l4
	.word	0x275cb4a2          ! %l5
	.word	0xdeb92542          ! %l6
	.word	0x063ea771          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffffa          ! %i2 (byte offset)
	.word	0x00000016          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0xffffffe0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x26b2d368          ! %y
	.word	0x0000000d          ! %icc (nzvc)
	.word	0x40000783          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x03da2000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x329f391e
	.word	0xcaa65241
	.word	0x7723a69d
	.word	0x924e8dab
	.word	0xd12e05e4
	.word	0x3adb3777
	.word	0xa23afc80
	.word	0x22c042c2
	.word	0x644e2faa
	.word	0xe33bff38
	.word	0xe49a37d1
	.word	0x3237b099
	.word	0x42d33266
	.word	0x99cd20da
	.word	0xdc8a495e
	.word	0x2ca0a1b7
	.word	0x6caf6737
	.word	0x1b1780ea
	.word	0x42585f8f
	.word	0x4fd3ca66
	.word	0x92726792
	.word	0x5409664d
	.word	0xae8c9ebb
	.word	0xffeebc72
	.word	0xb46defc1
	.word	0xa30f1da8
	.word	0xcc638ab6
	.word	0x0650d330
	.word	0x3c21f48e
	.word	0xe087ef01
	.word	0xb37bf5ae
	.word	0x08ac5bc1
	.word	0x2f67e03b
	.word	0xc9e249a6
	.word	0x00748837
	.word	0x56cb7d98
	.word	0x87e02ab4
	.word	0x19f44a4d
	.word	0x9c5136a3
	.word	0xf99ca738
	.word	0x01a4c107
	.word	0xcad3ff7c
	.word	0xd7323797
	.word	0x1d128342
	.word	0xbd75f013
	.word	0xf3c5102a
	.word	0x416b4fda
	.word	0x2c9fb9ae
	.word	0xb3bec67f
	.word	0x9707a8a6
	.word	0x4fa38770
	.word	0x77d70158
	.word	0x3a2921ee
	.word	0xc9aed1b8
	.word	0x70929be7
	.word	0xe63c45be
	.word	0x4448db70
	.word	0x99629605
	.word	0x7e72c3f0
	.word	0x1edbe508
	.word	0xc468c73b
	.word	0x435499b7
	.word	0xe8929830
	.word	0xce094a47
	.word	0xcafb7b9a
	.word	0xeaf4085d
	.word	0x2bdc3558
	.word	0x21f66801
	.word	0x14dd1324
	.word	0x6057fd0f
	.word	0x20e3eb72
	.word	0xb1e9d6ed
	.word	0x71b25e31
	.word	0x6c25c8d5
	.word	0xcc620e7e
	.word	0x53f19cfa
	.word	0x4f85378a
	.word	0xe32abb48
	.word	0x1120bc3d
	.word	0xb64ce096
	.word	0x3e84f05f
	.word	0xbd37517a
	.word	0x499fab4b
	.word	0x34a70c2c
	.word	0x12cd077d
	.word	0xfb43ef12
	.word	0x293d5773
	.word	0x69e325ed
	.word	0x89839fbf
	.word	0x1ec585bb
	.word	0xa1d61f3e
	.word	0x85de5fd2
	.word	0xd5c469c5
	.word	0xc19acebf
	.word	0x10bf26cd
	.word	0xcf7d23e2
	.word	0xffe3f4e4
	.word	0xd960faee
	.word	0xde0c13e8
	.word	0xd6c620b0
	.word	0x89e29b5c
	.word	0xd488fcc4
	.word	0x906bf756
	.word	0x55031a27
	.word	0xc5a57dd0
	.word	0xe974d0ca
	.word	0x3fdaf76e
	.word	0x3a178289
	.word	0xd7ff41f2
	.word	0x2276683c
	.word	0x3f2b8fee
	.word	0xdab91fb5
	.word	0x9df9887d
	.word	0x530019eb
	.word	0xd1437b0a
	.word	0x0b3740a8
	.word	0xdb6b4e68
	.word	0xbcf0bd65
	.word	0x281597c8
	.word	0x62414745
	.word	0x01f7ad58
	.word	0xaee3d452
	.word	0xb223618a
	.word	0x1ee58a58
	.word	0xf153af55
	.word	0x60106620
	.word	0xa4e5ccec
	.word	0xb90dd3d8
	.word	0xb46929c0
	.word	0x39c771e2
	.word	0x98269dd0
	.word	0xfc4eff6c
	.word	0x0dd7d384
	.word	0x344d1a75
	.word	0x15508ab6
	.word	0x76357d30
	.word	0xb0b50a8c
	.word	0xead5f0e4
	.word	0xf74dc150
	.word	0xc390bcb8
	.word	0x0b7dfc74
	.word	0x3324010d
	.word	0xf0f1a055
	.word	0xefdbc454
	.word	0x4a372682
	.word	0xded58484
	.word	0x3263ba95
	.word	0x37017895
	.word	0x94ef60d7
	.word	0x81315fb6
	.word	0xeecf774d
	.word	0x609f5810
	.word	0xf08be8e1
	.word	0xb25bcd51
	.word	0x03fce3bc
	.word	0xf4d1af61
	.word	0x9c261f13
	.word	0x029fdbe3
	.word	0xa2ac89f5
	.word	0x51c08972
	.word	0x549aebd8
	.word	0x3c20a1c1
	.word	0x09d960f7
	.word	0x4ed4dffd
	.word	0xcd76ffc4
	.word	0x690f4b29
	.word	0xfda129fa
	.word	0x82f1d04f
t0_data_exp_sp:
	.word	0x996a630c
	.word	0x76b166ab
	.word	0xfdc4cf0b
	.word	0x5685d84d
	.word	0x10210838
	.word	0xfc5513c4
	.word	0x94b796da
	.word	0xf5045fbc
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xffffffed
	.word	0x0000001a
	.word	0x00000000
	.word	0xfffffff8
	.word	t0_data_exp_fp
	.word	0x69b81d10
	.word	0x6d84646a
	.word	0x70e2ca95
	.word	0x54feab03
	.word	0x7bc02041
	.word	0x4aeb92ba
	.word	0x13a81db5
	.word	0xc9a5f427
	.word	0xf78a500f
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
	.word   	0x55f53151	! [%fp - 0xc]
	.word   	0xe08bb7f9	! [%fp - 0x8]
	.word   	0x395b00d2	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x7702a312
	.word	0xb876ff45
	.word	0x41dd222b
	.word	0x88f79844
	.word	0x9541a7ea
	.word	0x79cfad8a
	.word	0x13fea7cb
	.word	0x17eb59f9
	.word	0x3344d3a6
	.word	0x53fe1787
	.word	0xbd8d6612
	.word	0x5677ba66
	.word	0x6272d268
	.word	0xfd9af0e6
	.word	0x184cc733
	.word	0x1d6296e1
	.word	0x2981be48
	.word	0x275efcab
	.word	0x1737ede3
	.word	0x9fa994e0
	.word	0x714f6078
	.word	0xe3ed2188
	.word	0x1b3fd51b
	.word	0x90afc065
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x193d2000)
.seg "data"
t0_data_exp_area0_start:
.skip 8128
t0_data_exp_area0_begin:
	.word	0xed99e0a9	! t0_data_exp_area0-0x20
	.word	0x1438ef6e	! t0_data_exp_area0-0x1c
	.word	0xb365281c	! t0_data_exp_area0-0x18
	.word	0xc3021db9	! t0_data_exp_area0-0x14
	.word	0xbb8986ad	! t0_data_exp_area0-0x10
	.word	0x67576a67	! t0_data_exp_area0-0xc
	.word	0xf24916b3	! t0_data_exp_area0-0x8
	.word	0x5c672257	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x8be2725e	! t0_data_exp_area0+0x0
	.word	0x3b112ea2	! t0_data_exp_area0+0x4
	.word	0xf340a9be	! t0_data_exp_area0+0x8
	.word	0x3eb8492b	! t0_data_exp_area0+0xc
	.word	0x7abf6dbd	! t0_data_exp_area0+0x10
	.word	0x406a41cf	! t0_data_exp_area0+0x14
	.word	0xbfaa5bee	! t0_data_exp_area0+0x18
	.word	0x614435fc	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x70470000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x91253d5d	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xd5c525ad	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xaafdfacd	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x2f6b1c25	! t0_data_exp_shm_area+0xc (t0)
	.word	0x57d01302	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x048bffe0	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xdd0b1403	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x2e0e5c8b	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xc4930684	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x83a3eb07	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x0e5a72d4	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xf5878eca	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x2ebbb8f9	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xe79bc50e	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x26eb71ec	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x386a69b1	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x496a8612	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xb6c90ec0	! t0_data_exp_shm_area+0x44
	.word	0x33ce255e	! t0_data_exp_shm_area+0x48
	.word	0x0b983ef0	! t0_data_exp_shm_area+0x4c
	.word	0x76f1e7c5	! t0_data_exp_shm_area+0x50
	.word	0xaf9ab09f	! t0_data_exp_shm_area+0x54
	.word	0x00a7a0ea	! t0_data_exp_shm_area+0x58
	.word	0xd962fe0f	! t0_data_exp_shm_area+0x5c
	.word	0x1455f02c	! t0_data_exp_shm_area+0x60
	.word	0x8b92b8f7	! t0_data_exp_shm_area+0x64
	.word	0x0f3dde7e	! t0_data_exp_shm_area+0x68
	.word	0x72e8f2a2	! t0_data_exp_shm_area+0x6c
	.word	0xba2efdac	! t0_data_exp_shm_area+0x70
	.word	0x96d56730	! t0_data_exp_shm_area+0x74
	.word	0xecfd08ff	! t0_data_exp_shm_area+0x78
	.word	0x1fb1b1bb	! t0_data_exp_shm_area+0x7c
	.word	0x5ec10d59	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xd44d1864	! t0_data_exp_shm_area+0x84
	.word	0x4d402f48	! t0_data_exp_shm_area+0x88
	.word	0x9f27ea9f	! t0_data_exp_shm_area+0x8c
	.word	0xe64b4f99	! t0_data_exp_shm_area+0x90
	.word	0x2e47e931	! t0_data_exp_shm_area+0x94
	.word	0x6343a372	! t0_data_exp_shm_area+0x98
	.word	0x01130ebb	! t0_data_exp_shm_area+0x9c
	.word	0x08a9e307	! t0_data_exp_shm_area+0xa0
	.word	0x8c6d20cf	! t0_data_exp_shm_area+0xa4
	.word	0xc8478a55	! t0_data_exp_shm_area+0xa8
	.word	0x74ef04d8	! t0_data_exp_shm_area+0xac
	.word	0xb09dd999	! t0_data_exp_shm_area+0xb0
	.word	0x0f35b964	! t0_data_exp_shm_area+0xb4
	.word	0x9dcd5f4f	! t0_data_exp_shm_area+0xb8
	.word	0x932f5b8d	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d1e992b1a453
#define T0_KAOS_ICOUNT        2513
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    8128
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2515

#define T0_KAOS_BOOT_VA                  0x09f0c000
#define T0_KAOS_BOOT_PA                  0x00000000002b4000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x35744000
#define T0_KAOS_STARTUP_PA               0x0000000002f56000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x1ed64000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004d84000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x7a70e000
#define T0_KAOS_DONE_PA                  0x0000000007d3e000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x7a62a000
#define T0_KAOS_KTBL_PA                  0x00000000089d6000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x7a2e0000
#define T0_KAOS_SUBR0_PA                 0x000000000a85e000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x7a7c0000
#define T0_KAOS_SUBR1_PA                 0x000000000d4b8000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x7a66c000
#define T0_KAOS_SUBR2_PA                 0x000000000fb68000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x24306000
#define T0_KAOS_SUBR3_PA                 0x0000000011a6a000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x4a4c4000
#define T0_KAOS_EXP_REGS_PA              0x0000000013e50000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x7852e000
#define T0_KAOS_RUN_REGS_PA              0x0000000015264000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x03da2000
#define T0_KAOS_EXP_STACK_PA             0x000000001664c000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x6beb4000
#define T0_KAOS_RUN_STACK_PA             0x0000000019efa000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x193d2000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a278000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x35612000
#define T0_KAOS_RUN_AREA0_PA             0x000000001db14000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x70470000
#define T0_KAOS_EXP_SHM_AREA_PA          0x00000000011c8000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x721e6000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000aaa000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xa7adec04
#define T0_KAOS_RANVAL_01     0x37f49996
#define T0_KAOS_RANVAL_02     0x69437043
#define T0_KAOS_RANVAL_03     0xc25eaef5
#define T0_KAOS_RANVAL_04     0xb3d47f5e
#define T0_KAOS_RANVAL_05     0x50305362
#define T0_KAOS_RANVAL_06     0x7a1d95e4
#define T0_KAOS_RANVAL_07     0xbbe235a2
#define T0_KAOS_RANVAL_08     0x5855e105
#define T0_KAOS_RANVAL_09     0xecd97c2b
#define T0_KAOS_RANVAL_0a     0x258aac33
#define T0_KAOS_RANVAL_0b     0x9434a8d1
#define T0_KAOS_RANVAL_0c     0x6b63dcbf
#define T0_KAOS_RANVAL_0d     0x3f05f216
#define T0_KAOS_RANVAL_0e     0x27ea8f46
#define T0_KAOS_RANVAL_0f     0x37eafbde
#define T0_KAOS_RANVAL_10     0x44e21122
#define T0_KAOS_RANVAL_11     0xe58aa294
#define T0_KAOS_RANVAL_12     0x7420a04a
#define T0_KAOS_RANVAL_13     0xed0896fa
#define T0_KAOS_RANVAL_14     0xb1f0a636
#define T0_KAOS_RANVAL_15     0xd652a63f
#define T0_KAOS_RANVAL_16     0x501b16ca
#define T0_KAOS_RANVAL_17     0xee50091a
#define T0_KAOS_RANVAL_18     0x3b194a58
#define T0_KAOS_RANVAL_19     0x84ebc5ea
#define T0_KAOS_RANVAL_1a     0x04a7a230
#define T0_KAOS_RANVAL_1b     0xaf986532
#define T0_KAOS_RANVAL_1c     0xf2549960
#define T0_KAOS_RANVAL_1d     0xc2adbcf2
#define T0_KAOS_RANVAL_1e     0x91321f8c
#define T0_KAOS_RANVAL_1f     0x45febea2
#define T0_KAOS_RANVAL_20     0x98dc5206
#define T0_KAOS_RANVAL_21     0xa562ccda
#define T0_KAOS_RANVAL_22     0xba926794
#define T0_KAOS_RANVAL_23     0x004e78f0
#define T0_KAOS_RANVAL_24     0xcd20fd81
#define T0_KAOS_RANVAL_25     0x90ad7617
#define T0_KAOS_RANVAL_26     0xaada78eb
#define T0_KAOS_RANVAL_27     0x9a725eb8
#define T0_KAOS_RANVAL_28     0x4d7fed70
#define T0_KAOS_RANVAL_29     0xe5d06a27
#define T0_KAOS_RANVAL_2a     0xef6682a5
#define T0_KAOS_RANVAL_2b     0xfd6bb3e0
#define T0_KAOS_RANVAL_2c     0x8ec0b3fd
#define T0_KAOS_RANVAL_2d     0xca3b0ae7
#define T0_KAOS_RANVAL_2e     0x7684930b
#define T0_KAOS_RANVAL_2f     0xfb6bb70f
#define T0_KAOS_RANVAL_30     0xac2f7a40
#define T0_KAOS_RANVAL_31     0x688e0b26
#define T0_KAOS_RANVAL_32     0xc721ee9a
#define T0_KAOS_RANVAL_33     0x707f465f
#define T0_KAOS_RANVAL_34     0x749bd8e0
#define T0_KAOS_RANVAL_35     0x5ef10474
#define T0_KAOS_RANVAL_36     0xd7485351
#define T0_KAOS_RANVAL_37     0x1b039b50
#define T0_KAOS_RANVAL_38     0x51da1700
#define T0_KAOS_RANVAL_39     0x21cb1640
#define T0_KAOS_RANVAL_3a     0xf215ac2c
#define T0_KAOS_RANVAL_3b     0x07165200
#define T0_KAOS_RANVAL_3c     0x69def357
#define T0_KAOS_RANVAL_3d     0xb07de221
#define T0_KAOS_RANVAL_3e     0x1f7cf8eb
#define T0_KAOS_RANVAL_3f     0xaca22f98
#define T0_KAOS_RANVAL_40     0x6f6c5ba0
#define T0_KAOS_RANVAL_41     0x63e37973
#define T0_KAOS_RANVAL_42     0x8fc76e17
#define T0_KAOS_RANVAL_43     0xb3cd5c09
#define T0_KAOS_RANVAL_44     0x96c7b635
#define T0_KAOS_RANVAL_45     0x01451026
#define T0_KAOS_RANVAL_46     0x06b91146
#define T0_KAOS_RANVAL_47     0x7ea502f8
#define T0_KAOS_RANVAL_48     0x5f58a1f6
#define T0_KAOS_RANVAL_49     0xd18988d2
#define T0_KAOS_RANVAL_4a     0x06ac559d
#define T0_KAOS_RANVAL_4b     0x142d8ff6
#define T0_KAOS_RANVAL_4c     0xd799506f
#define T0_KAOS_RANVAL_4d     0xd0b82e0d
#define T0_KAOS_RANVAL_4e     0x2f2c7c96
#define T0_KAOS_RANVAL_4f     0x47bdf9f4
#define T0_KAOS_RANVAL_50     0x8bafde39
#define T0_KAOS_RANVAL_51     0x3edd2d00
#define T0_KAOS_RANVAL_52     0x8ccebf02
#define T0_KAOS_RANVAL_53     0x1affd1f5
#define T0_KAOS_RANVAL_54     0xf29a4da0
#define T0_KAOS_RANVAL_55     0xe622a538
#define T0_KAOS_RANVAL_56     0x65868251
#define T0_KAOS_RANVAL_57     0x78550905
#define T0_KAOS_RANVAL_58     0x504d0786
#define T0_KAOS_RANVAL_59     0x53ca61b9
#define T0_KAOS_RANVAL_5a     0xcdb11e11
#define T0_KAOS_RANVAL_5b     0xc9ffa169
#define T0_KAOS_RANVAL_5c     0x2ebe0686
#define T0_KAOS_RANVAL_5d     0x67e18f59
#define T0_KAOS_RANVAL_5e     0x3ad9f5b4
#define T0_KAOS_RANVAL_5f     0x5f76bf17
#define T0_KAOS_RANVAL_60     0xb2d5105c
#define T0_KAOS_RANVAL_61     0xf349044a
#define T0_KAOS_RANVAL_62     0x91ffea95
#define T0_KAOS_RANVAL_63     0x7917cb68
#define T0_KAOS_RANVAL_64     0xbedba183
#define T0_KAOS_RANVAL_65     0x6241ecf7
#define T0_KAOS_RANVAL_66     0x54316a3d
#define T0_KAOS_RANVAL_67     0x9a19a00b
#define T0_KAOS_RANVAL_68     0x808d6f1f
#define T0_KAOS_RANVAL_69     0x8457f214
#define T0_KAOS_RANVAL_6a     0x8de49ce1
#define T0_KAOS_RANVAL_6b     0x0492ed3d
#define T0_KAOS_RANVAL_6c     0x4f94a31d
#define T0_KAOS_RANVAL_6d     0x8e7f2bf0
#define T0_KAOS_RANVAL_6e     0xcfc5782f
#define T0_KAOS_RANVAL_6f     0x12c44f36
#define T0_KAOS_RANVAL_70     0xa04b3698
#define T0_KAOS_RANVAL_71     0x3acd770d
#define T0_KAOS_RANVAL_72     0x830bba49
#define T0_KAOS_RANVAL_73     0x3ee9c6e6
#define T0_KAOS_RANVAL_74     0xe84d0e7e
#define T0_KAOS_RANVAL_75     0xff9bfdf1
#define T0_KAOS_RANVAL_76     0x6c071111
#define T0_KAOS_RANVAL_77     0xcede89e1
#define T0_KAOS_RANVAL_78     0x2cfcbe73
#define T0_KAOS_RANVAL_79     0x67570c3e
#define T0_KAOS_RANVAL_7a     0xb3aff1a7
#define T0_KAOS_RANVAL_7b     0x2e195d96
#define T0_KAOS_RANVAL_7c     0x39d715f4
#define T0_KAOS_RANVAL_7d     0x980f7f00
#define T0_KAOS_RANVAL_7e     0xb0efe42f
#define T0_KAOS_RANVAL_7f     0x6636f1c7
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
!    areaoffset     8128
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2515
!    code           7a62a000
!    entry          7a62a000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d1e992b1a453
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

KTEXT_MODULE(t0_module_ktbl, 0x7a62a000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xd83e401d	! t0_kref+0x0:   	std	%o4, [%i1 + %i5]
	.word	0xd220a010	! t0_kref+0x4:   	st	%o1, [%g2 + 0x10]
	.word	0x981d7ff9	! t0_kref+0x8:   	xor	%l5, -0x7, %o4
	.word	0xd24e0000	! t0_kref+0xc:   	ldsb	[%i0], %o1
	.word	0x98fb7937	! t0_kref+0x10:   	sdivcc	%o5, -0x6c9, %o4
	.word	0x9740c000	! t0_kref+0x14:   	mov	%asi, %o3
	.word	0xa3a01a58	! t0_kref+0x18:   	fdtoi	%f24, %f17
	.word	0x92582810	! t0_kref+0x1c:   	smul	%g0, 0x810, %o1
	.word	0x949832de	! t0_kref+0x20:   	xorcc	%g0, -0xd22, %o2
	.word	0x94d5ff4b	! t0_kref+0x24:   	umulcc	%l7, -0xb5, %o2
	.word	0x8143c000	! t0_kref+0x28:   	stbar
	.word	0x991d4000	! t0_kref+0x2c:   	tsubcctv	%l5, %g0, %o4
	.word	0xe4086048	! t0_kref+0x30:   	ldub	[%g1 + 0x48], %l2
	.word	0xa41ca00c	! t0_kref+0x34:   	xor	%l2, 0xc, %l2
	.word	0xe4286048	! t0_kref+0x38:   	stb	%l2, [%g1 + 0x48]
	.word	0x81d86048	! t0_kref+0x3c:   	flush	%g1 + 0x48
	.word	0x81af0a58	! t0_kref+0x40:   	fcmpd	%fcc0, %f28, %f24
	.word	0x98f68017	! t0_kref+0x44:   	udivcc	%i2, %l7, %o4
	.word	0xd8b01018	! t0_kref+0x48:   	stha	%o4, [%g0 + %i0]0x80
	.word	0xd40e6004	! t0_kref+0x4c:   	ldub	[%i1 + 4], %o2
	.word	0xbba01a58	! t0_kref+0x50:   	fdtoi	%f24, %f29
	.word	0x932d6008	! t0_kref+0x54:   	sll	%l5, 0x8, %o1
	.word	0xb1a01a3e	! t0_kref+0x58:   	fstoi	%f30, %f24
	.word	0x26800004	! t0_kref+0x5c:   	bl,a	_kref+0x6c
	.word	0xd83e6010	! t0_kref+0x60:   	std	%o4, [%i1 + 0x10]
	.word	0x94180009	! t0_kref+0x64:   	xor	%g0, %o1, %o2
	.word	0xb1a409d0	! t0_kref+0x68:   	fdivd	%f16, %f16, %f24
	.word	0xd24e0000	! t0_kref+0x6c:   	ldsb	[%i0], %o1
	.word	0xd6480018	! t0_kref+0x70:   	ldsb	[%g0 + %i0], %o3
2:	.word	0xb9a708d4	! t0_kref+0x74:   	fsubd	%f28, %f20, %f28
	.word	0xa9a48956	! t0_kref+0x78:   	fmuld	%f18, %f22, %f20
	.word	0x921b400a	! t0_kref+0x7c:   	xor	%o5, %o2, %o1
	.word	0xc030a00c	! t0_kref+0x80:   	clrh	[%g2 + 0xc]
	.word	0x941e8016	! t0_kref+0x84:   	xor	%i2, %l6, %o2
	.word	0xafa01899	! t0_kref+0x88:   	fitos	%f25, %f23
	.word	0x989b4008	! t0_kref+0x8c:   	xorcc	%o5, %o0, %o4
	.word	0x9875400d	! t0_kref+0x90:   	udiv	%l5, %o5, %o4
	.word	0xd4881019	! t0_kref+0x94:   	lduba	[%g0 + %i1]0x80, %o2
	.word	0x964238ee	! t0_kref+0x98:   	addc	%o0, -0x712, %o3
	.word	0xec363ffa	! t0_kref+0x9c:   	sth	%l6, [%i0 - 6]
	.word	0x92103731	! t0_kref+0xa0:   	mov	0xfffff731, %o1
	.word	0xd85f4018	! t0_kref+0xa4:   	ldx	[%i5 + %i0], %o4
	.word	0xada688de	! t0_kref+0xa8:   	fsubd	%f26, %f30, %f22
	.word	0x92fdc00a	! t0_kref+0xac:   	sdivcc	%l7, %o2, %o1
	.word	0x9426b335	! t0_kref+0xb0:   	sub	%i2, -0xccb, %o2
	.word	0x8182c000	! t0_kref+0xb4:   	wr	%o3, %g0, %y
	.word	0x9740c000	! t0_kref+0xb8:   	mov	%asi, %o3
	.word	0xe320a038	! t0_kref+0xbc:   	st	%f17, [%g2 + 0x38]
	.word	0xda30a03a	! t0_kref+0xc0:   	sth	%o5, [%g2 + 0x3a]
	.word	0xb1a01919	! t0_kref+0xc4:   	fitod	%f25, %f24
	.word	0x8143e075	! t0_kref+0xc8:   	membar	0x75
	.word	0xb3a018d2	! t0_kref+0xcc:   	fdtos	%f18, %f25
	.word	0x92236015	! t0_kref+0xd0:   	sub	%o5, 0x15, %o1
	.word	0x92a22e1f	! t0_kref+0xd4:   	subcc	%o0, 0xe1f, %o1
	.word	0xb1a689d4	! t0_kref+0xd8:   	fdivd	%f26, %f20, %f24
	.word	0xd6562004	! t0_kref+0xdc:   	ldsh	[%i0 + 4], %o3
	.word	0x973d4017	! t0_kref+0xe0:   	sra	%l5, %l7, %o3
	.word	0xd4263ffc	! t0_kref+0xe4:   	st	%o2, [%i0 - 4]
	call	SYM(t0_subr3)
	.word	0x96f3000a	! t0_kref+0xec:   	udivcc	%o4, %o2, %o3
	.word	0x965aec48	! t0_kref+0xf0:   	smul	%o3, 0xc48, %o3
	.word	0xd808a02d	! t0_kref+0xf4:   	ldub	[%g2 + 0x2d], %o4
	.word	0x81dfc01b	! t0_kref+0xf8:   	flush	%i7 + %i3
	.word	0xa5a01939	! t0_kref+0xfc:   	fstod	%f25, %f18
	.word	0x933e800d	! t0_kref+0x100:   	sra	%i2, %o5, %o1
	.word	0x989ab48f	! t0_kref+0x104:   	xorcc	%o2, -0xb71, %o4
	.word	0xd82e3fe2	! t0_kref+0x108:   	stb	%o4, [%i0 - 0x1e]
	.word	0xd850a00c	! t0_kref+0x10c:   	ldsh	[%g2 + 0xc], %o4
	.word	0x81830000	! t0_kref+0x110:   	wr	%o4, %g0, %y
	.word	0xd240a03c	! t0_kref+0x114:   	ldsw	[%g2 + 0x3c], %o1
	.word	0x8143e040	! t0_kref+0x118:   	membar	0x40
	.word	0xd20e4000	! t0_kref+0x11c:   	ldub	[%i1], %o1
	.word	0xd240a000	! t0_kref+0x120:   	ldsw	[%g2], %o1
	.word	0xd648a020	! t0_kref+0x124:   	ldsb	[%g2 + 0x20], %o3
	.word	0xbda4cd3e	! t0_kref+0x128:   	fsmuld	%f19, %f30, %f30
	.word	0x8610201e	! t0_kref+0x12c:   	mov	0x1e, %g3
	.word	0x86a0e001	! t0_kref+0x130:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x134:   	be,a	_kref+0x194
	.word	0xd40e8019	! t0_kref+0x138:   	ldub	[%i2 + %i1], %o2
	.word	0x928ac00a	! t0_kref+0x13c:   	andcc	%o3, %o2, %o1
	.word	0xb1a00136	! t0_kref+0x140:   	fabss	%f22, %f24
	.word	0x930b000b	! t0_kref+0x144:   	tsubcc	%o4, %o3, %o1
	.word	0xd836401b	! t0_kref+0x148:   	sth	%o4, [%i1 + %i3]
	.word	0xd2264000	! t0_kref+0x14c:   	st	%o1, [%i1]
	.word	0xd84e2009	! t0_kref+0x150:   	ldsb	[%i0 + 9], %o4
	.word	0x9718000d	! t0_kref+0x154:   	tsubcctv	%g0, %o5, %o3
	.word	0xa7a01894	! t0_kref+0x158:   	fitos	%f20, %f19
	.word	0xa9a00535	! t0_kref+0x15c:   	fsqrts	%f21, %f20
	.word	0xe9be1808	! t0_kref+0x160:   	stda	%f20, [%i0 + %o0]0xc0
	.word	0xd8b81018	! t0_kref+0x164:   	stda	%o4, [%g0 + %i0]0x80
	.word	0x81824000	! t0_kref+0x168:   	wr	%o1, %g0, %y
	.word	0xa5a01899	! t0_kref+0x16c:   	fitos	%f25, %f18
	.word	0x94920017	! t0_kref+0x170:   	orcc	%o0, %l7, %o2
	.word	0x9fc00004	! t0_kref+0x174:   	call	%g0 + %g4
	.word	0x92db3987	! t0_kref+0x178:   	smulcc	%o4, -0x679, %o1
	.word	0x92fa3b6c	! t0_kref+0x17c:   	sdivcc	%o0, -0x494, %o1
	.word	0xfd00a034	! t0_kref+0x180:   	ld	[%g2 + 0x34], %f30
	.word	0xafa01a58	! t0_kref+0x184:   	fdtoi	%f24, %f23
	.word	0x96f5ed11	! t0_kref+0x188:   	udivcc	%l7, 0xd11, %o3
	.word	0x9655606a	! t0_kref+0x18c:   	umul	%l5, 0x6a, %o3
	.word	0x9216800a	! t0_kref+0x190:   	or	%i2, %o2, %o1
	.word	0x3f480005	! t0_kref+0x194:   	fbo,a,pt	%fcc0, _kref+0x1a8
	.word	0xda7e2008	! t0_kref+0x198:   	swap	[%i0 + 8], %o5
	.word	0x96ddc00c	! t0_kref+0x19c:   	smulcc	%l7, %o4, %o3
	.word	0x945b2e5f	! t0_kref+0x1a0:   	smul	%o4, 0xe5f, %o2
	.word	0x81d90017	! t0_kref+0x1a4:   	flush	%g4 + %l7
	.word	0xe1ee501a	! t0_kref+0x1a8:   	prefetcha	%i1 + %i2, 16
	.word	0xef00a038	! t0_kref+0x1ac:   	ld	[%g2 + 0x38], %f23
	.word	0x81ae8a5c	! t0_kref+0x1b0:   	fcmpd	%fcc0, %f26, %f28
	.word	0xe906401c	! t0_kref+0x1b4:   	ld	[%i1 + %i4], %f20
	.word	0xd440a00c	! t0_kref+0x1b8:   	ldsw	[%g2 + 0xc], %o2
	.word	0xd84e8018	! t0_kref+0x1bc:   	ldsb	[%i2 + %i0], %o4
	.word	0x94e5c015	! t0_kref+0x1c0:   	subccc	%l7, %l5, %o2
	.word	0x941365a8	! t0_kref+0x1c4:   	or	%o5, 0x5a8, %o2
	.word	0xfd3e6010	! t0_kref+0x1c8:   	std	%f30, [%i1 + 0x10]
	.word	0x94824015	! t0_kref+0x1cc:   	addcc	%o1, %l5, %o2
	.word	0xf007bfe0	! t0_kref+0x1d0:   	ld	[%fp - 0x20], %i0
	.word	0x27800006	! t0_kref+0x1d4:   	fbul,a	_kref+0x1ec
	.word	0xe56e3ff0	! t0_kref+0x1d8:   	prefetch	%i0 - 0x10, 18
	.word	0xea20a00c	! t0_kref+0x1dc:   	st	%l5, [%g2 + 0xc]
	.word	0xb1a01a5c	! t0_kref+0x1e0:   	fdtoi	%f28, %f24
	.word	0xee2e7fe6	! t0_kref+0x1e4:   	stb	%l7, [%i1 - 0x1a]
	.word	0xef00a034	! t0_kref+0x1e8:   	ld	[%g2 + 0x34], %f23
	.word	0xd608a034	! t0_kref+0x1ec:   	ldub	[%g2 + 0x34], %o3
	.word	0xa7a01a5c	! t0_kref+0x1f0:   	fdtoi	%f28, %f19
	.word	0xe678a008	! t0_kref+0x1f4:   	swap	[%g2 + 8], %l3
	.word	0xd40e6007	! t0_kref+0x1f8:   	ldub	[%i1 + 7], %o2
	.word	0xf5ee501c	! t0_kref+0x1fc:   	prefetcha	%i1 + %i4, 26
	.word	0x94dd8016	! t0_kref+0x200:   	smulcc	%l6, %l6, %o2
	.word	0x96154015	! t0_kref+0x204:   	or	%l5, %l5, %o3
	.word	0xd230a02e	! t0_kref+0x208:   	sth	%o1, [%g2 + 0x2e]
	.word	0x956124c6	! t0_kref+0x20c:   	movl	%fcc0, -0x33a, %o2
	.word	0xa3a018de	! t0_kref+0x210:   	fdtos	%f30, %f17
	.word	0xa1a488dc	! t0_kref+0x214:   	fsubd	%f18, %f28, %f16
	.word	0xd62e8018	! t0_kref+0x218:   	stb	%o3, [%i2 + %i0]
	.word	0xe1be5a1b	! t0_kref+0x21c:   	stda	%f16, [%i1 + %i3]0xd0
	.word	0x96230015	! t0_kref+0x220:   	sub	%o4, %l5, %o3
	.word	0x26800001	! t0_kref+0x224:   	bl,a	_kref+0x228
	.word	0x983a000b	! t0_kref+0x228:   	xnor	%o0, %o3, %o4
	.word	0xe96e2000	! t0_kref+0x22c:   	prefetch	%i0, 20
	.word	0xb5a01913	! t0_kref+0x230:   	fitod	%f19, %f26
	.word	0x9fc10000	! t0_kref+0x234:   	call	%g4
	.word	0xb3a01a52	! t0_kref+0x238:   	fdtoi	%f18, %f25
	.word	0x9de3bfa0	! t0_kref+0x23c:   	save	%sp, -0x60, %sp
	.word	0x95ee001d	! t0_kref+0x240:   	restore	%i0, %i5, %o2
	.word	0xd8480018	! t0_kref+0x244:   	ldsb	[%g0 + %i0], %o4
	.word	0xd836401b	! t0_kref+0x248:   	sth	%o4, [%i1 + %i3]
	.word	0xaba018de	! t0_kref+0x24c:   	fdtos	%f30, %f21
	.word	0x8610201d	! t0_kref+0x250:   	mov	0x1d, %g3
	.word	0x86a0e001	! t0_kref+0x254:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x258:   	be,a	_kref+0x2b8
	.word	0xd62e8019	! t0_kref+0x25c:   	stb	%o3, [%i2 + %i1]
	.word	0xc06e401a	! t0_kref+0x260:   	ldstub	[%i1 + %i2], %g0
	.word	0x9682c000	! t0_kref+0x264:   	addcc	%o3, %g0, %o3
	.word	0xd64e2009	! t0_kref+0x268:   	ldsb	[%i0 + 9], %o3
	.word	0xbda48d3e	! t0_kref+0x26c:   	fsmuld	%f18, %f30, %f30
	.word	0x96e6a406	! t0_kref+0x270:   	subccc	%i2, 0x406, %o3
	.word	0xada00050	! t0_kref+0x274:   	fmovd	%f16, %f22
	.word	0xb1a688d0	! t0_kref+0x278:   	fsubd	%f26, %f16, %f24
	.word	0x921a7f74	! t0_kref+0x27c:   	xor	%o1, -0x8c, %o1
	.word	0xa1a01939	! t0_kref+0x280:   	fstod	%f25, %f16
	.word	0x9732e00a	! t0_kref+0x284:   	srl	%o3, 0xa, %o3
	.word	0x9fc10000	! t0_kref+0x288:   	call	%g4
	.word	0xd850a012	! t0_kref+0x28c:   	ldsh	[%g2 + 0x12], %o4
	.word	0xd6a71019	! t0_kref+0x290:   	sta	%o3, [%i4 + %i1]0x80
	.word	0x34bffff0	! t0_kref+0x294:   	bg,a	_kref+0x254
	.word	0xe1f6500b	! t0_kref+0x298:   	casxa	[%i1]0x80, %o3, %l0
	.word	0x28bfffee	! t0_kref+0x29c:   	bleu,a	_kref+0x254
	.word	0xd44e3fff	! t0_kref+0x2a0:   	ldsb	[%i0 - 1], %o2
	.word	0xee2e7ff1	! t0_kref+0x2a4:   	stb	%l7, [%i1 - 0xf]
	.word	0xd810a01e	! t0_kref+0x2a8:   	lduh	[%g2 + 0x1e], %o4
	.word	0xd5e6500a	! t0_kref+0x2ac:   	casa	[%i1]0x80, %o2, %o2
	.word	0xada01a5e	! t0_kref+0x2b0:   	fdtoi	%f30, %f22
	.word	0x965b757d	! t0_kref+0x2b4:   	smul	%o5, -0xa83, %o3
	.word	0x2c800003	! t0_kref+0x2b8:   	bneg,a	_kref+0x2c4
	.word	0xd8ae101a	! t0_kref+0x2bc:   	stba	%o4, [%i0 + %i2]0x80
	.word	0x93418000	! t0_kref+0x2c0:   	mov	%fprs, %o1
	.word	0x92e3001a	! t0_kref+0x2c4:   	subccc	%o4, %i2, %o1
	.word	0x81858000	! t0_kref+0x2c8:   	wr	%l6, %g0, %y
	.word	0xf91e001d	! t0_kref+0x2cc:   	ldd	[%i0 + %i5], %f28
	.word	0xd610a03c	! t0_kref+0x2d0:   	lduh	[%g2 + 0x3c], %o3
	.word	0xd6280018	! t0_kref+0x2d4:   	stb	%o3, [%g0 + %i0]
	.word	0xf4280019	! t0_kref+0x2d8:   	stb	%i2, [%g0 + %i1]
	.word	0xef00a034	! t0_kref+0x2dc:   	ld	[%g2 + 0x34], %f23
	.word	0x925a4008	! t0_kref+0x2e0:   	smul	%o1, %o0, %o1
	.word	0xe3e61000	! t0_kref+0x2e4:   	casa	[%i0]0x80, %g0, %l1
	.word	0xda264000	! t0_kref+0x2e8:   	st	%o5, [%i1]
	.word	0x971d8015	! t0_kref+0x2ec:   	tsubcctv	%l6, %l5, %o3
	.word	0xf9801018	! t0_kref+0x2f0:   	lda	[%g0 + %i0]0x80, %f28
	.word	0x21800007	! t0_kref+0x2f4:   	fbn,a	_kref+0x310
	.word	0x98836298	! t0_kref+0x2f8:   	addcc	%o5, 0x298, %o4
	.word	0x8143c000	! t0_kref+0x2fc:   	stbar
	.word	0x92e5eb2f	! t0_kref+0x300:   	subccc	%l7, 0xb2f, %o1
	.word	0xd64e401a	! t0_kref+0x304:   	ldsb	[%i1 + %i2], %o3
	.word	0x93334016	! t0_kref+0x308:   	srl	%o5, %l6, %o1
	.word	0x92f83561	! t0_kref+0x30c:   	sdivcc	%g0, -0xa9f, %o1
	.word	0xb3a018d2	! t0_kref+0x310:   	fdtos	%f18, %f25
	.word	0x981ac00d	! t0_kref+0x314:   	xor	%o3, %o5, %o4
	.word	0xd610a030	! t0_kref+0x318:   	lduh	[%g2 + 0x30], %o3
	.word	0xf19e5a1c	! t0_kref+0x31c:   	ldda	[%i1 + %i4]0xd0, %f24
	.word	0x98fa400d	! t0_kref+0x320:   	sdivcc	%o1, %o5, %o4
	.word	0x953a800a	! t0_kref+0x324:   	sra	%o2, %o2, %o2
	.word	0xfd3e7fe0	! t0_kref+0x328:   	std	%f30, [%i1 - 0x20]
	.word	0xf320a028	! t0_kref+0x32c:   	st	%f25, [%g2 + 0x28]
	.word	0x94333990	! t0_kref+0x330:   	orn	%o4, -0x670, %o2
	.word	0x92aaf4b8	! t0_kref+0x334:   	andncc	%o3, -0xb48, %o1
	.word	0xee28a004	! t0_kref+0x338:   	stb	%l7, [%g2 + 4]
	.word	0xf42e6006	! t0_kref+0x33c:   	stb	%i2, [%i1 + 6]
	.word	0xe93e401d	! t0_kref+0x340:   	std	%f20, [%i1 + %i5]
	.word	0x8143c000	! t0_kref+0x344:   	stbar
	.word	0xb5a0191b	! t0_kref+0x348:   	fitod	%f27, %f26
	.word	0x2f800002	! t0_kref+0x34c:   	fbu,a	_kref+0x354
	.word	0x9633643f	! t0_kref+0x350:   	orn	%o5, 0x43f, %o3
	.word	0xd2480018	! t0_kref+0x354:   	ldsb	[%g0 + %i0], %o1
	.word	0xea263fec	! t0_kref+0x358:   	st	%l5, [%i0 - 0x14]
	.word	0xd428a006	! t0_kref+0x35c:   	stb	%o2, [%g2 + 6]
	.word	0x94f30016	! t0_kref+0x360:   	udivcc	%o4, %l6, %o2
	.word	0xada01919	! t0_kref+0x364:   	fitod	%f25, %f22
	.word	0x81dd8001	! t0_kref+0x368:   	flush	%l6 + %g1
	.word	0x963ac015	! t0_kref+0x36c:   	xnor	%o3, %l5, %o3
	sethi	%hi(2f), %o7
	.word	0xe40be38c	! t0_kref+0x374:   	ldub	[%o7 + 0x38c], %l2
	.word	0xa41ca00c	! t0_kref+0x378:   	xor	%l2, 0xc, %l2
	.word	0xe42be38c	! t0_kref+0x37c:   	stb	%l2, [%o7 + 0x38c]
	.word	0x81dbe38c	! t0_kref+0x380:   	flush	%o7 + 0x38c
	.word	0xd406401c	! t0_kref+0x384:   	ld	[%i1 + %i4], %o2
	.word	0xf9380019	! t0_kref+0x388:   	std	%f28, [%g0 + %i1]
2:	.word	0x98a26a8e	! t0_kref+0x38c:   	subcc	%o1, 0xa8e, %o4
	.word	0x81af0a5a	! t0_kref+0x390:   	fcmpd	%fcc0, %f28, %f26
	.word	0xe86e8019	! t0_kref+0x394:   	ldstub	[%i2 + %i1], %l4
	.word	0x8143c000	! t0_kref+0x398:   	stbar
	.word	0x96f6b006	! t0_kref+0x39c:   	udivcc	%i2, -0xffa, %o3
	.word	0x1925f0d8	! t0_kref+0x3a0:   	sethi	%hi(0x97c36000), %o4
	.word	0x964375b9	! t0_kref+0x3a4:   	addc	%o5, -0xa47, %o3
	.word	0x33800001	! t0_kref+0x3a8:   	fbe,a	_kref+0x3ac
	.word	0x92a23e71	! t0_kref+0x3ac:   	subcc	%o0, -0x18f, %o1
	.word	0xd26e7fee	! t0_kref+0x3b0:   	ldstub	[%i1 - 0x12], %o1
	.word	0xa9a78956	! t0_kref+0x3b4:   	fmuld	%f30, %f22, %f20
	.word	0xa7a01a52	! t0_kref+0x3b8:   	fdtoi	%f18, %f19
	.word	0xf500a01c	! t0_kref+0x3bc:   	ld	[%g2 + 0x1c], %f26
	.word	0xada01911	! t0_kref+0x3c0:   	fitod	%f17, %f22
	.word	0xf5180018	! t0_kref+0x3c4:   	ldd	[%g0 + %i0], %f26
	.word	0x20800001	! t0_kref+0x3c8:   	bn,a	_kref+0x3cc
	.word	0x92e54009	! t0_kref+0x3cc:   	subccc	%l5, %o1, %o1
	.word	0xe11e0000	! t0_kref+0x3d0:   	ldd	[%i0], %f16
	.word	0xd430a036	! t0_kref+0x3d4:   	sth	%o2, [%g2 + 0x36]
	.word	0xc1ee500a	! t0_kref+0x3d8:   	prefetcha	%i1 + %o2, 0
	.word	0x9652c016	! t0_kref+0x3dc:   	umul	%o3, %l6, %o3
	.word	0xe40863c8	! t0_kref+0x3e0:   	ldub	[%g1 + 0x3c8], %l2
	.word	0xa41ca00c	! t0_kref+0x3e4:   	xor	%l2, 0xc, %l2
	.word	0xe42863c8	! t0_kref+0x3e8:   	stb	%l2, [%g1 + 0x3c8]
	.word	0x81d863c8	! t0_kref+0x3ec:   	flush	%g1 + 0x3c8
	.word	0xb1a00138	! t0_kref+0x3f0:   	fabss	%f24, %f24
2:	.word	0x9658305c	! t0_kref+0x3f4:   	smul	%g0, -0xfa4, %o3
	.word	0xf99e1a1b	! t0_kref+0x3f8:   	ldda	[%i0 + %i3]0xd0, %f28
	.word	0x96b2a74c	! t0_kref+0x3fc:   	orncc	%o2, 0x74c, %o3
	.word	0xc76e3fe8	! t0_kref+0x400:   	prefetch	%i0 - 0x18, 3
	.word	0xd650a022	! t0_kref+0x404:   	ldsh	[%g2 + 0x22], %o3
	.word	0x94e5400d	! t0_kref+0x408:   	subccc	%l5, %o5, %o2
	.word	0x98fb4016	! t0_kref+0x40c:   	sdivcc	%o5, %l6, %o4
	.word	0xf51e2000	! t0_kref+0x410:   	ldd	[%i0], %f26
	.word	0x92f2000a	! t0_kref+0x414:   	udivcc	%o0, %o2, %o1
	.word	0x980b400d	! t0_kref+0x418:   	and	%o5, %o5, %o4
	.word	0x96baa303	! t0_kref+0x41c:   	xnorcc	%o2, 0x303, %o3
	.word	0x98c20017	! t0_kref+0x420:   	addccc	%o0, %l7, %o4
	.word	0x86102004	! t0_kref+0x424:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x428:   	bne,a	_kref+0x428
	.word	0x86a0e001	! t0_kref+0x42c:   	subcc	%g3, 1, %g3
	.word	0x96c24009	! t0_kref+0x430:   	addccc	%o1, %o1, %o3
	.word	0xa1a94054	! t0_kref+0x434:   	fmovdug	%fcc0, %f20, %f16
	.word	0x9262a2dc	! t0_kref+0x438:   	subc	%o2, 0x2dc, %o1
	.word	0xec364000	! t0_kref+0x43c:   	sth	%l6, [%i1]
	.word	0x9866800a	! t0_kref+0x440:   	subc	%i2, %o2, %o4
	.word	0x8143c000	! t0_kref+0x444:   	stbar
	.word	0x94d6b3fc	! t0_kref+0x448:   	umulcc	%i2, -0xc04, %o2
	.word	0xb5a00534	! t0_kref+0x44c:   	fsqrts	%f20, %f26
	.word	0xa5a0003d	! t0_kref+0x450:   	fmovs	%f29, %f18
	.word	0xd200a020	! t0_kref+0x454:   	ld	[%g2 + 0x20], %o1
	.word	0xaba00534	! t0_kref+0x458:   	fsqrts	%f20, %f21
	.word	0x92f68016	! t0_kref+0x45c:   	udivcc	%i2, %l6, %o1
	.word	0xc56e4017	! t0_kref+0x460:   	prefetch	%i1 + %l7, 2
	.word	0x37800006	! t0_kref+0x464:   	fbge,a	_kref+0x47c
	.word	0x96b6b578	! t0_kref+0x468:   	orncc	%i2, -0xa88, %o3
	.word	0x39800005	! t0_kref+0x46c:   	fbuge,a	_kref+0x480
	.word	0xa9a0015e	! t0_kref+0x470:   	fabsd	%f30, %f20
	.word	0x81ad4ab6	! t0_kref+0x474:   	fcmpes	%fcc0, %f21, %f22
	.word	0x965b2187	! t0_kref+0x478:   	smul	%o4, 0x187, %o3
	.word	0xa5a01a39	! t0_kref+0x47c:   	fstoi	%f25, %f18
	.word	0x8182c000	! t0_kref+0x480:   	wr	%o3, %g0, %y
	.word	0xd2480018	! t0_kref+0x484:   	ldsb	[%g0 + %i0], %o1
	.word	0xd83e3fe8	! t0_kref+0x488:   	std	%o4, [%i0 - 0x18]
	.word	0x9332e009	! t0_kref+0x48c:   	srl	%o3, 0x9, %o1
	.word	0x98f00016	! t0_kref+0x490:   	udivcc	%g0, %l6, %o4
	.word	0xbda80056	! t0_kref+0x494:   	fmovdn	%fcc0, %f22, %f30
	.word	0xb9a78958	! t0_kref+0x498:   	fmuld	%f30, %f24, %f28
	.word	0xe51e6000	! t0_kref+0x49c:   	ldd	[%i1], %f18
	.word	0xd83e2018	! t0_kref+0x4a0:   	std	%o4, [%i0 + 0x18]
	.word	0xb9a0103a	! t0_kref+0x4a4:   	fstox	%f26, %f28
	.word	0xd6865000	! t0_kref+0x4a8:   	lda	[%i1]0x80, %o3
	.word	0x38800003	! t0_kref+0x4ac:   	bgu,a	_kref+0x4b8
	.word	0x95232876	! t0_kref+0x4b0:   	mulscc	%o4, 0x876, %o2
	.word	0xc807bfe4	! t0_kref+0x4b4:   	ld	[%fp - 0x1c], %g4
	.word	0x940ae669	! t0_kref+0x4b8:   	and	%o3, 0x669, %o2
	.word	0xed1e2018	! t0_kref+0x4bc:   	ldd	[%i0 + 0x18], %f22
	.word	0xbda0053a	! t0_kref+0x4c0:   	fsqrts	%f26, %f30
	.word	0x96da0009	! t0_kref+0x4c4:   	smulcc	%o0, %o1, %o3
	.word	0xd6801018	! t0_kref+0x4c8:   	lda	[%g0 + %i0]0x80, %o3
	.word	0x9456ad86	! t0_kref+0x4cc:   	umul	%i2, 0xd86, %o2
	.word	0x3e800005	! t0_kref+0x4d0:   	bvc,a	_kref+0x4e4
	.word	0xb5a0191d	! t0_kref+0x4d4:   	fitod	%f29, %f26
	.word	0xd20e3ffd	! t0_kref+0x4d8:   	ldub	[%i0 - 3], %o1
	.word	0x968d6e53	! t0_kref+0x4dc:   	andcc	%l5, 0xe53, %o3
	.word	0xd0a81018	! t0_kref+0x4e0:   	stba	%o0, [%g0 + %i0]0x80
	.word	0x98f02b8a	! t0_kref+0x4e4:   	udivcc	%g0, 0xb8a, %o4
	.word	0x81858000	! t0_kref+0x4e8:   	wr	%l6, %g0, %y
	.word	0x98a6a040	! t0_kref+0x4ec:   	subcc	%i2, 0x40, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be134	! t0_kref+0x4f4:   	ldub	[%o7 + 0x134], %l2
	.word	0xa41ca00c	! t0_kref+0x4f8:   	xor	%l2, 0xc, %l2
	.word	0xe42be134	! t0_kref+0x4fc:   	stb	%l2, [%o7 + 0x134]
	.word	0x81dbe134	! t0_kref+0x500:   	flush	%o7 + 0x134
	.word	0x9422f9d5	! t0_kref+0x504:   	sub	%o3, -0x62b, %o2
	.word	0x9695ff5d	! t0_kref+0x508:   	orcc	%l7, -0xa3, %o3
	.word	0xd4000019	! t0_kref+0x50c:   	ld	[%g0 + %i1], %o2
	.word	0x98c262ae	! t0_kref+0x510:   	addccc	%o1, 0x2ae, %o4
	.word	0xd84e401a	! t0_kref+0x514:   	ldsb	[%i1 + %i2], %o4
	.word	0x98fdc00a	! t0_kref+0x518:   	sdivcc	%l7, %o2, %o4
	.word	0x929a0009	! t0_kref+0x51c:   	xorcc	%o0, %o1, %o1
	.word	0xd20e7fe3	! t0_kref+0x520:   	ldub	[%i1 - 0x1d], %o1
	.word	0xb9a608d4	! t0_kref+0x524:   	fsubd	%f24, %f20, %f28
	.word	0xb5a509de	! t0_kref+0x528:   	fdivd	%f20, %f30, %f26
	.word	0x988d800c	! t0_kref+0x52c:   	andcc	%l6, %o4, %o4
	.word	0xe5180018	! t0_kref+0x530:   	ldd	[%g0 + %i0], %f18
2:	.word	0xf320a034	! t0_kref+0x534:   	st	%f25, [%g2 + 0x34]
	call	SYM(t0_subr3)
	.word	0x945dc015	! t0_kref+0x53c:   	smul	%l7, %l5, %o2
	call	SYM(t0_subr0)
	.word	0xda2e0000	! t0_kref+0x544:   	stb	%o5, [%i0]
	.word	0x8143c000	! t0_kref+0x548:   	stbar
	.word	0x1305868b	! t0_kref+0x54c:   	sethi	%hi(0x161a2c00), %o1
	.word	0x86102003	! t0_kref+0x550:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x554:   	bne,a	_kref+0x554
	.word	0x86a0e001	! t0_kref+0x558:   	subcc	%g3, 1, %g3
	.word	0x9612400c	! t0_kref+0x55c:   	or	%o1, %o4, %o3
	.word	0x81580000	! t0_kref+0x560:   	flushw
	.word	0xf93e2018	! t0_kref+0x564:   	std	%f28, [%i0 + 0x18]
	.word	0x81dd001a	! t0_kref+0x568:   	flush	%l4 + %i2
	.word	0x980b0000	! t0_kref+0x56c:   	and	%o4, %g0, %o4
!	.word	0x22810ea1	! t0_kref+0x570:   	be,a	SYM(t0_subr2)
	   	be,a	SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x574:   	mov	%pc, %o7
	.word	0x001fffff	! t0_kref+0x578:   	illtrap	0x1fffff
	.word	0xd200a008	! t0_kref+0x57c:   	ld	[%g2 + 8], %o1
	.word	0x81af4aba	! t0_kref+0x580:   	fcmpes	%fcc0, %f29, %f26
	.word	0x81800000	! t0_kref+0x584:   	mov	%g0, %y
	.word	0xa3a01a52	! t0_kref+0x588:   	fdtoi	%f18, %f17
	.word	0x98a6800d	! t0_kref+0x58c:   	subcc	%i2, %o5, %o4
	.word	0x928d800a	! t0_kref+0x590:   	andcc	%l6, %o2, %o1
	.word	0x98158009	! t0_kref+0x594:   	or	%l6, %o1, %o4
	.word	0xb9a01918	! t0_kref+0x598:   	fitod	%f24, %f28
	.word	0xec1e3fe8	! t0_kref+0x59c:   	ldd	[%i0 - 0x18], %l6
	.word	0x3b800004	! t0_kref+0x5a0:   	fble,a	_kref+0x5b0
	.word	0x8143c000	! t0_kref+0x5a4:   	stbar
	.word	0xfb6e001c	! t0_kref+0x5a8:   	prefetch	%i0 + %i4, 29
	.word	0xb9a01a39	! t0_kref+0x5ac:   	fstoi	%f25, %f28
	.word	0xada00536	! t0_kref+0x5b0:   	fsqrts	%f22, %f22
	.word	0x3d800002	! t0_kref+0x5b4:   	fbule,a	_kref+0x5bc
	.word	0x93408000	! t0_kref+0x5b8:   	mov	%ccr, %o1
	.word	0x96e5fafc	! t0_kref+0x5bc:   	subccc	%l7, -0x504, %o3
	.word	0x94200008	! t0_kref+0x5c0:   	neg	%o0, %o2
	.word	0x24800001	! t0_kref+0x5c4:   	ble,a	_kref+0x5c8
	.word	0xa5a018d8	! t0_kref+0x5c8:   	fdtos	%f24, %f18
	.word	0xb7a018d4	! t0_kref+0x5cc:   	fdtos	%f20, %f27
	.word	0x921dc016	! t0_kref+0x5d0:   	xor	%l7, %l6, %o1
	.word	0x98e2e08d	! t0_kref+0x5d4:   	subccc	%o3, 0x8d, %o4
!	.word	0x2b865e8a	! t0_kref+0x5d8:   	fbug,a	SYM(t0_subr1)
	   	fbug,a	SYM(t0_subr1)
	.word	0x9e0065ac	! t0_kref+0x5dc:   	add	%g1, 0x5ac, %o7
	.word	0x989db4a2	! t0_kref+0x5e0:   	xorcc	%l6, -0xb5e, %o4
	.word	0x92223370	! t0_kref+0x5e4:   	sub	%o0, -0xc90, %o1
	.word	0x94fb401a	! t0_kref+0x5e8:   	sdivcc	%o5, %i2, %o2
	.word	0x94adf98c	! t0_kref+0x5ec:   	andncc	%l7, -0x674, %o2
	.word	0x9832ace5	! t0_kref+0x5f0:   	orn	%o2, 0xce5, %o4
	.word	0xb1a01a3a	! t0_kref+0x5f4:   	fstoi	%f26, %f24
	.word	0xe81e2018	! t0_kref+0x5f8:   	ldd	[%i0 + 0x18], %l4
	.word	0x9242c00d	! t0_kref+0x5fc:   	addc	%o3, %o5, %o1
	call	SYM(t0_subr0)
	.word	0xfd00a030	! t0_kref+0x604:   	ld	[%g2 + 0x30], %f30
	.word	0x9425c015	! t0_kref+0x608:   	sub	%l7, %l5, %o2
	.word	0x98420000	! t0_kref+0x60c:   	addc	%o0, %g0, %o4
	.word	0x92222633	! t0_kref+0x610:   	sub	%o0, 0x633, %o1
	.word	0xe9be580a	! t0_kref+0x614:   	stda	%f20, [%i1 + %o2]0xc0
	.word	0xd9e61009	! t0_kref+0x618:   	casa	[%i0]0x80, %o1, %o4
	.word	0xf11e3ff0	! t0_kref+0x61c:   	ldd	[%i0 - 0x10], %f24
	.word	0x95358016	! t0_kref+0x620:   	srl	%l6, %l6, %o2
	.word	0x81828000	! t0_kref+0x624:   	wr	%o2, %g0, %y
	.word	0xd640a014	! t0_kref+0x628:   	ldsw	[%g2 + 0x14], %o3
	.word	0xaba01a3d	! t0_kref+0x62c:   	fstoi	%f29, %f21
	.word	0x960b61d9	! t0_kref+0x630:   	and	%o5, 0x1d9, %o3
	.word	0x98254017	! t0_kref+0x634:   	sub	%l5, %l7, %o4
	.word	0x948a8015	! t0_kref+0x638:   	andcc	%o2, %l5, %o2
	.word	0xb3a70939	! t0_kref+0x63c:   	fmuls	%f28, %f25, %f25
	.word	0x96da800d	! t0_kref+0x640:   	smulcc	%o2, %o5, %o3
	.word	0xd608a020	! t0_kref+0x644:   	ldub	[%g2 + 0x20], %o3
	.word	0xa3a00539	! t0_kref+0x648:   	fsqrts	%f25, %f17
	.word	0xb9a01a38	! t0_kref+0x64c:   	fstoi	%f24, %f28
	.word	0xb1a7895e	! t0_kref+0x650:   	fmuld	%f30, %f30, %f24
	.word	0x98103319	! t0_kref+0x654:   	mov	0xfffff319, %o4
	.word	0xfb00a010	! t0_kref+0x658:   	ld	[%g2 + 0x10], %f29
	.word	0x9325800d	! t0_kref+0x65c:   	mulscc	%l6, %o5, %o1
	.word	0x980d6525	! t0_kref+0x660:   	and	%l5, 0x525, %o4
	.word	0x98c32375	! t0_kref+0x664:   	addccc	%o4, 0x375, %o4
	.word	0x21800007	! t0_kref+0x668:   	fbn,a	_kref+0x684
	.word	0x962362ce	! t0_kref+0x66c:   	sub	%o5, 0x2ce, %o3
	.word	0xaba0053c	! t0_kref+0x670:   	fsqrts	%f28, %f21
	.word	0xd650a022	! t0_kref+0x674:   	ldsh	[%g2 + 0x22], %o3
	.word	0x99418000	! t0_kref+0x678:   	mov	%fprs, %o4
	.word	0x3c800005	! t0_kref+0x67c:   	bpos,a	_kref+0x690
	.word	0xd41e7fe0	! t0_kref+0x680:   	ldd	[%i1 - 0x20], %o2
	.word	0xd236601c	! t0_kref+0x684:   	sth	%o1, [%i1 + 0x1c]
	.word	0xa5a01a35	! t0_kref+0x688:   	fstoi	%f21, %f18
	.word	0x921375d2	! t0_kref+0x68c:   	or	%o5, -0xa2e, %o1
	.word	0x9693254b	! t0_kref+0x690:   	orcc	%o4, 0x54b, %o3
	.word	0x81ad8a5a	! t0_kref+0x694:   	fcmpd	%fcc0, %f22, %f26
	.word	0x92a5be3e	! t0_kref+0x698:   	subcc	%l6, -0x1c2, %o1
	.word	0xb1a01a32	! t0_kref+0x69c:   	fstoi	%f18, %f24
	.word	0xd6462004	! t0_kref+0x6a0:   	ldsw	[%i0 + 4], %o3
	.word	0x92257e3f	! t0_kref+0x6a4:   	sub	%l5, -0x1c1, %o1
	.word	0xa1a70950	! t0_kref+0x6a8:   	fmuld	%f28, %f16, %f16
	.word	0x9225fa1e	! t0_kref+0x6ac:   	sub	%l7, -0x5e2, %o1
	.word	0xd800a034	! t0_kref+0x6b0:   	ld	[%g2 + 0x34], %o4
	.word	0xb1a01912	! t0_kref+0x6b4:   	fitod	%f18, %f24
	.word	0x92854015	! t0_kref+0x6b8:   	addcc	%l5, %l5, %o1
	.word	0x921a800c	! t0_kref+0x6bc:   	xor	%o2, %o4, %o1
	.word	0x9486b2c8	! t0_kref+0x6c0:   	addcc	%i2, -0xd38, %o2
	.word	0x94f58017	! t0_kref+0x6c4:   	udivcc	%l6, %l7, %o2
	.word	0xe4680019	! t0_kref+0x6c8:   	ldstub	[%g0 + %i1], %l2
	.word	0x34800002	! t0_kref+0x6cc:   	bg,a	_kref+0x6d4
	.word	0x9933001a	! t0_kref+0x6d0:   	srl	%o4, %i2, %o4
	.word	0x94da0008	! t0_kref+0x6d4:   	smulcc	%o0, %o0, %o2
	.word	0xe91e7fe0	! t0_kref+0x6d8:   	ldd	[%i1 - 0x20], %f20
	.word	0x969aa263	! t0_kref+0x6dc:   	xorcc	%o2, 0x263, %o3
	.word	0x99368017	! t0_kref+0x6e0:   	srl	%i2, %l7, %o4
	.word	0x2c800004	! t0_kref+0x6e4:   	bneg,a	_kref+0x6f4
	.word	0x94a0233c	! t0_kref+0x6e8:   	subcc	%g0, 0x33c, %o2
	.word	0x3b800002	! t0_kref+0x6ec:   	fble,a	_kref+0x6f4
	.word	0xc807bfe4	! t0_kref+0x6f0:   	ld	[%fp - 0x1c], %g4
	.word	0xec260000	! t0_kref+0x6f4:   	st	%l6, [%i0]
	.word	0xb5a589d6	! t0_kref+0x6f8:   	fdivd	%f22, %f22, %f26
	.word	0x9486801a	! t0_kref+0x6fc:   	addcc	%i2, %i2, %o2
	.word	0x991afdcc	! t0_kref+0x700:   	tsubcctv	%o3, -0x234, %o4
	.word	0x9492b526	! t0_kref+0x704:   	orcc	%o2, -0xada, %o2
	.word	0xd600a034	! t0_kref+0x708:   	ld	[%g2 + 0x34], %o3
	.word	0x9665c00c	! t0_kref+0x70c:   	subc	%l7, %o4, %o3
	.word	0xd640a038	! t0_kref+0x710:   	ldsw	[%g2 + 0x38], %o3
	.word	0xd028a03b	! t0_kref+0x714:   	stb	%o0, [%g2 + 0x3b]
	.word	0xee264000	! t0_kref+0x718:   	st	%l7, [%i1]
	.word	0xafa00034	! t0_kref+0x71c:   	fmovs	%f20, %f23
	.word	0x22800007	! t0_kref+0x720:   	be,a	_kref+0x73c
	.word	0xebee501b	! t0_kref+0x724:   	prefetcha	%i1 + %i3, 21
	.word	0xd8be5000	! t0_kref+0x728:   	stda	%o4, [%i1]0x80
	.word	0xd430a01e	! t0_kref+0x72c:   	sth	%o2, [%g2 + 0x1e]
	.word	0x98d0245b	! t0_kref+0x730:   	umulcc	%g0, 0x45b, %o4
	.word	0x949ac008	! t0_kref+0x734:   	xorcc	%o3, %o0, %o2
	.word	0x933b001a	! t0_kref+0x738:   	sra	%o4, %i2, %o1
	.word	0xd01e4000	! t0_kref+0x73c:   	ldd	[%i1], %o0
	.word	0xe9bf1a58	! t0_kref+0x740:   	stda	%f20, [%i4 + %i0]0xd2
	.word	0x9402800c	! t0_kref+0x744:   	add	%o2, %o4, %o2
	.word	0x29800006	! t0_kref+0x748:   	fbl,a	_kref+0x760
	.word	0x962de09a	! t0_kref+0x74c:   	andn	%l7, 0x9a, %o3
	.word	0xa3a01a5a	! t0_kref+0x750:   	fdtoi	%f26, %f17
	.word	0x972b2007	! t0_kref+0x754:   	sll	%o4, 0x7, %o3
	.word	0xec363ff8	! t0_kref+0x758:   	sth	%l6, [%i0 - 8]
	.word	0x92aaa183	! t0_kref+0x75c:   	andncc	%o2, 0x183, %o1
	.word	0x8143c000	! t0_kref+0x760:   	stbar
	.word	0x96623d70	! t0_kref+0x764:   	subc	%o0, -0x290, %o3
	.word	0xa3a0003e	! t0_kref+0x768:   	fmovs	%f30, %f17
	.word	0x26800003	! t0_kref+0x76c:   	bl,a	_kref+0x778
	.word	0xd036201a	! t0_kref+0x770:   	sth	%o0, [%i0 + 0x1a]
	.word	0x23800005	! t0_kref+0x774:   	fbne,a	_kref+0x788
	.word	0xd41e001d	! t0_kref+0x778:   	ldd	[%i0 + %i5], %o2
	.word	0x96256bb1	! t0_kref+0x77c:   	sub	%l5, 0xbb1, %o3
	.word	0xd600a03c	! t0_kref+0x780:   	ld	[%g2 + 0x3c], %o3
	.word	0xef6e001d	! t0_kref+0x784:   	prefetch	%i0 + %i5, 23
	.word	0xda362000	! t0_kref+0x788:   	sth	%o5, [%i0]
	.word	0xec68a004	! t0_kref+0x78c:   	ldstub	[%g2 + 4], %l6
	.word	0xec20a008	! t0_kref+0x790:   	st	%l6, [%g2 + 8]
	.word	0x9732e007	! t0_kref+0x794:   	srl	%o3, 0x7, %o3
	.word	0x928a800a	! t0_kref+0x798:   	andcc	%o2, %o2, %o1
	.word	0xf7861000	! t0_kref+0x79c:   	lda	[%i0]0x80, %f27
	.word	0x9de3bfa0	! t0_kref+0x7a0:   	save	%sp, -0x60, %sp
	.word	0x99ee7e1a	! t0_kref+0x7a4:   	restore	%i1, -0x1e6, %o4
	.word	0xf53e3ff0	! t0_kref+0x7a8:   	std	%f26, [%i0 - 0x10]
	.word	0x96e34015	! t0_kref+0x7ac:   	subccc	%o5, %l5, %o3
	.word	0xd64e7ffd	! t0_kref+0x7b0:   	ldsb	[%i1 - 3], %o3
	.word	0x988b401a	! t0_kref+0x7b4:   	andcc	%o5, %i2, %o4
	.word	0x9723000d	! t0_kref+0x7b8:   	mulscc	%o4, %o5, %o3
	.word	0x9488000c	! t0_kref+0x7bc:   	andcc	%g0, %o4, %o2
	.word	0x81ad0a38	! t0_kref+0x7c0:   	fcmps	%fcc0, %f20, %f24
	.word	0x96256342	! t0_kref+0x7c4:   	sub	%l5, 0x342, %o3
	.word	0xa9a01035	! t0_kref+0x7c8:   	fstox	%f21, %f20
	.word	0xe86e001a	! t0_kref+0x7cc:   	ldstub	[%i0 + %i2], %l4
	.word	0xf1ee101a	! t0_kref+0x7d0:   	prefetcha	%i0 + %i2, 24
	.word	0x98424017	! t0_kref+0x7d4:   	addc	%o1, %l7, %o4
	.word	0xd6263ff0	! t0_kref+0x7d8:   	st	%o3, [%i0 - 0x10]
	.word	0xd24e0000	! t0_kref+0x7dc:   	ldsb	[%i0], %o1
	.word	0x8610201b	! t0_kref+0x7e0:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x7e4:   	subcc	%g3, 1, %g3
	.word	0x22800002	! t0_kref+0x7e8:   	be,a	_kref+0x7f0
	.word	0x92654000	! t0_kref+0x7ec:   	subc	%l5, %g0, %o1
	.word	0x948ea11c	! t0_kref+0x7f0:   	andcc	%i2, 0x11c, %o2
	.word	0x924231c1	! t0_kref+0x7f4:   	addc	%o0, -0xe3f, %o1
	.word	0x96a27cdd	! t0_kref+0x7f8:   	subcc	%o1, -0x323, %o3
	.word	0xfd06401c	! t0_kref+0x7fc:   	ld	[%i1 + %i4], %f30
	.word	0x96220015	! t0_kref+0x800:   	sub	%o0, %l5, %o3
	.word	0x98e2303e	! t0_kref+0x804:   	subccc	%o0, -0xfc2, %o4
	.word	0xd24e201f	! t0_kref+0x808:   	ldsb	[%i0 + 0x1f], %o1
	.word	0x8185c000	! t0_kref+0x80c:   	wr	%l7, %g0, %y
	.word	0x86102001	! t0_kref+0x810:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x814:   	bne,a	_kref+0x814
	.word	0x86a0e001	! t0_kref+0x818:   	subcc	%g3, 1, %g3
	.word	0xf3060000	! t0_kref+0x81c:   	ld	[%i0], %f25
	.word	0x92fdc016	! t0_kref+0x820:   	sdivcc	%l7, %l6, %o1
	.word	0xb9a01934	! t0_kref+0x824:   	fstod	%f20, %f28
	.word	0xa9a54d3d	! t0_kref+0x828:   	fsmuld	%f21, %f29, %f20
	.word	0x987dfbbc	! t0_kref+0x82c:   	sdiv	%l7, -0x444, %o4
	.word	0xf4363ff0	! t0_kref+0x830:   	sth	%i2, [%i0 - 0x10]
	.word	0xaba018da	! t0_kref+0x834:   	fdtos	%f26, %f21
	.word	0x38800001	! t0_kref+0x838:   	bgu,a	_kref+0x83c
	.word	0x969e8015	! t0_kref+0x83c:   	xorcc	%i2, %l5, %o3
	.word	0x98c34017	! t0_kref+0x840:   	addccc	%o5, %l7, %o4
	.word	0x96620000	! t0_kref+0x844:   	subc	%o0, %g0, %o3
	.word	0xd028a01d	! t0_kref+0x848:   	stb	%o0, [%g2 + 0x1d]
	.word	0x9725400b	! t0_kref+0x84c:   	mulscc	%l5, %o3, %o3
	.word	0x985d4017	! t0_kref+0x850:   	smul	%l5, %l7, %o4
	.word	0x97408000	! t0_kref+0x854:   	mov	%ccr, %o3
	.word	0x96a6a21e	! t0_kref+0x858:   	subcc	%i2, 0x21e, %o3
	.word	0x962af290	! t0_kref+0x85c:   	andn	%o3, -0xd70, %o3
	.word	0x92158016	! t0_kref+0x860:   	or	%l6, %l6, %o1
	.word	0xe19eda19	! t0_kref+0x864:   	ldda	[%i3 + %i1]0xd0, %f16
	.word	0x8143c000	! t0_kref+0x868:   	stbar
	.word	0xd640a024	! t0_kref+0x86c:   	ldsw	[%g2 + 0x24], %o3
	call	1f
	.empty
	.word	0xd428a02a	! t0_kref+0x874:   	stb	%o2, [%g2 + 0x2a]
	.word	0x9725b617	! t0_kref+0x878:   	mulscc	%l6, -0x9e9, %o3
	.word	0xe96e6000	! t0_kref+0x87c:   	prefetch	%i1, 20
	.word	0xb5a58852	! t0_kref+0x880:   	faddd	%f22, %f18, %f26
	.word	0x93033845	! t0_kref+0x884:   	taddcc	%o4, -0x7bb, %o1
1:	.word	0xfd00a010	! t0_kref+0x888:   	ld	[%g2 + 0x10], %f30
	.word	0x9622c00c	! t0_kref+0x88c:   	sub	%o3, %o4, %o3
	.word	0xe320a010	! t0_kref+0x890:   	st	%f17, [%g2 + 0x10]
	.word	0xe7067fe4	! t0_kref+0x894:   	ld	[%i1 - 0x1c], %f19
	.word	0xd208a005	! t0_kref+0x898:   	ldub	[%g2 + 5], %o1
	.word	0x948b0016	! t0_kref+0x89c:   	andcc	%o4, %l6, %o2
	.word	0x96568015	! t0_kref+0x8a0:   	umul	%i2, %l5, %o3
	.word	0x94627257	! t0_kref+0x8a4:   	subc	%o1, -0xda9, %o2
	.word	0xe86e8018	! t0_kref+0x8a8:   	ldstub	[%i2 + %i0], %l4
	call	SYM(t0_subr1)
	.word	0xdaa61000	! t0_kref+0x8b0:   	sta	%o5, [%i0]0x80
	.word	0xb1a7095c	! t0_kref+0x8b4:   	fmuld	%f28, %f28, %f24
	.word	0xe1e6100c	! t0_kref+0x8b8:   	casa	[%i0]0x80, %o4, %l0
	.word	0xa7a00536	! t0_kref+0x8bc:   	fsqrts	%f22, %f19
	.word	0x949ac01a	! t0_kref+0x8c0:   	xorcc	%o3, %i2, %o2
	.word	0x97330015	! t0_kref+0x8c4:   	srl	%o4, %l5, %o3
	.word	0x92f6b0b6	! t0_kref+0x8c8:   	udivcc	%i2, -0xf4a, %o1
	.word	0xc807bfe4	! t0_kref+0x8cc:   	ld	[%fp - 0x1c], %g4
	.word	0x968b4008	! t0_kref+0x8d0:   	andcc	%o5, %o0, %o3
	.word	0x96826b90	! t0_kref+0x8d4:   	addcc	%o1, 0xb90, %o3
	.word	0x961a000c	! t0_kref+0x8d8:   	xor	%o0, %o4, %o3
	.word	0x94528009	! t0_kref+0x8dc:   	umul	%o2, %o1, %o2
	.word	0x969a32f5	! t0_kref+0x8e0:   	xorcc	%o0, -0xd0b, %o3
	.word	0xe926001c	! t0_kref+0x8e4:   	st	%f20, [%i0 + %i4]
	.word	0xef00a01c	! t0_kref+0x8e8:   	ld	[%g2 + 0x1c], %f23
	.word	0x9226ba0e	! t0_kref+0x8ec:   	sub	%i2, -0x5f2, %o1
	.word	0xd0a65000	! t0_kref+0x8f0:   	sta	%o0, [%i1]0x80
	.word	0x921dc000	! t0_kref+0x8f4:   	xor	%l7, %g0, %o1
	.word	0x9fc00004	! t0_kref+0x8f8:   	call	%g0 + %g4
	.word	0xd62e001a	! t0_kref+0x8fc:   	stb	%o3, [%i0 + %i2]
	.word	0x23480002	! t0_kref+0x900:   	fbne,a,pt	%fcc0, _kref+0x908
	.word	0xc16e4000	! t0_kref+0x904:   	prefetch	%i1, 0
	.word	0xec36c018	! t0_kref+0x908:   	sth	%l6, [%i3 + %i0]
	.word	0x96583fcd	! t0_kref+0x90c:   	smul	%g0, -0x33, %o3
	.word	0x9fc00004	! t0_kref+0x910:   	call	%g0 + %g4
	.word	0x952d801a	! t0_kref+0x914:   	sll	%l6, %i2, %o2
	.word	0x81ac8a5c	! t0_kref+0x918:   	fcmpd	%fcc0, %f18, %f28
	.word	0xd4d81018	! t0_kref+0x91c:   	ldxa	[%g0 + %i0]0x80, %o2
	.word	0xd20e8018	! t0_kref+0x920:   	ldub	[%i2 + %i0], %o1
	.word	0x92d32fac	! t0_kref+0x924:   	umulcc	%o4, 0xfac, %o1
	.word	0x92257c5c	! t0_kref+0x928:   	sub	%l5, -0x3a4, %o1
	.word	0x98fdfce9	! t0_kref+0x92c:   	sdivcc	%l7, -0x317, %o4
	.word	0xd62e7ff4	! t0_kref+0x930:   	stb	%o3, [%i1 - 0xc]
	.word	0xafa018d8	! t0_kref+0x934:   	fdtos	%f24, %f23
	.word	0xed20a004	! t0_kref+0x938:   	st	%f22, [%g2 + 4]
	.word	0x34800005	! t0_kref+0x93c:   	bg,a	_kref+0x950
	.word	0x94a232a2	! t0_kref+0x940:   	subcc	%o0, -0xd5e, %o2
	.word	0x94fb6123	! t0_kref+0x944:   	sdivcc	%o5, 0x123, %o2
	.word	0xeb6e7fe0	! t0_kref+0x948:   	prefetch	%i1 - 0x20, 21
	.word	0x98a3000c	! t0_kref+0x94c:   	subcc	%o4, %o4, %o4
	.word	0x34800002	! t0_kref+0x950:   	bg,a	_kref+0x958
	.word	0x99382015	! t0_kref+0x954:   	sra	%g0, 0x15, %o4
	.word	0xd410a038	! t0_kref+0x958:   	lduh	[%g2 + 0x38], %o2
	.word	0x81dd800b	! t0_kref+0x95c:   	flush	%l6 + %o3
	.word	0x9652fff4	! t0_kref+0x960:   	umul	%o3, -0xc, %o3
	.word	0x81ac4a3d	! t0_kref+0x964:   	fcmps	%fcc0, %f17, %f29
	.word	0xe51e2008	! t0_kref+0x968:   	ldd	[%i0 + 8], %f18
	.word	0xf93e401d	! t0_kref+0x96c:   	std	%f28, [%i1 + %i5]
	.word	0xb7a01895	! t0_kref+0x970:   	fitos	%f21, %f27
	.word	0xbda018da	! t0_kref+0x974:   	fdtos	%f26, %f30
	.word	0xd468a03a	! t0_kref+0x978:   	ldstub	[%g2 + 0x3a], %o2
	.word	0x9683000d	! t0_kref+0x97c:   	addcc	%o4, %o5, %o3
	.word	0x9815400d	! t0_kref+0x980:   	or	%l5, %o5, %o4
	.word	0xd0200018	! t0_kref+0x984:   	st	%o0, [%g0 + %i0]
	.word	0x92e5ef56	! t0_kref+0x988:   	subccc	%l7, 0xf56, %o1
	.word	0x39800005	! t0_kref+0x98c:   	fbuge,a	_kref+0x9a0
	.word	0x8143c000	! t0_kref+0x990:   	stbar
	.word	0xd6080019	! t0_kref+0x994:   	ldub	[%g0 + %i1], %o3
	.word	0x94f28017	! t0_kref+0x998:   	udivcc	%o2, %l7, %o2
	.word	0x921a396e	! t0_kref+0x99c:   	xor	%o0, -0x692, %o1
	.word	0x932de005	! t0_kref+0x9a0:   	sll	%l7, 0x5, %o1
	.word	0x947024ac	! t0_kref+0x9a4:   	udiv	%g0, 0x4ac, %o2
	.word	0x8143c000	! t0_kref+0x9a8:   	stbar
	.word	0x8143c000	! t0_kref+0x9ac:   	stbar
	.word	0x3d800004	! t0_kref+0x9b0:   	fbule,a	_kref+0x9c0
	.word	0xe51e2018	! t0_kref+0x9b4:   	ldd	[%i0 + 0x18], %f18
	.word	0x3d800008	! t0_kref+0x9b8:   	fbule,a	_kref+0x9d8
	.word	0xd808a00f	! t0_kref+0x9bc:   	ldub	[%g2 + 0xf], %o4
	.word	0x96da0009	! t0_kref+0x9c0:   	smulcc	%o0, %o1, %o3
	.word	0x9322f1b8	! t0_kref+0x9c4:   	mulscc	%o3, -0xe48, %o1
	.word	0xd408a014	! t0_kref+0x9c8:   	ldub	[%g2 + 0x14], %o2
	.word	0xb5a589d0	! t0_kref+0x9cc:   	fdivd	%f22, %f16, %f26
	.word	0xd64e3fea	! t0_kref+0x9d0:   	ldsb	[%i0 - 0x16], %o3
	.word	0xd44e7ffd	! t0_kref+0x9d4:   	ldsb	[%i1 - 3], %o2
	.word	0x36800004	! t0_kref+0x9d8:   	bge,a	_kref+0x9e8
	.word	0xc0366002	! t0_kref+0x9dc:   	clrh	[%i1 + 2]
	.word	0x992dc015	! t0_kref+0x9e0:   	sll	%l7, %l5, %o4
	.word	0x987b0000	! t0_kref+0x9e4:   	sdiv	%o4, %g0, %o4
	.word	0xb5a01118	! t0_kref+0x9e8:   	fxtod	%f24, %f26
	.word	0x9940c000	! t0_kref+0x9ec:   	mov	%asi, %o4
	.word	0x3c800002	! t0_kref+0x9f0:   	bpos,a	_kref+0x9f8
	.word	0x985e800a	! t0_kref+0x9f4:   	smul	%i2, %o2, %o4
	.word	0x953b2017	! t0_kref+0x9f8:   	sra	%o4, 0x17, %o2
!	.word	0x3d490d7e	! t0_kref+0x9fc:   	fbule,a,pt	%fcc0, SYM(t0_subr2)
	   	fbule,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9e0069d0	! t0_kref+0xa00:   	add	%g1, 0x9d0, %o7
	.word	0x8185c000	! t0_kref+0xa04:   	wr	%l7, %g0, %y
	.word	0xef20a000	! t0_kref+0xa08:   	st	%f23, [%g2]
	.word	0x81dffdde	! t0_kref+0xa0c:   	flush	%i7 - 0x222
	.word	0x963325d9	! t0_kref+0xa10:   	orn	%o4, 0x5d9, %o3
	.word	0x97237ddb	! t0_kref+0xa14:   	mulscc	%o5, -0x225, %o3
	.word	0x94232653	! t0_kref+0xa18:   	sub	%o4, 0x653, %o2
	.word	0x8185c000	! t0_kref+0xa1c:   	wr	%l7, %g0, %y
	.word	0x9fc00004	! t0_kref+0xa20:   	call	%g0 + %g4
	.word	0x96fdc017	! t0_kref+0xa24:   	sdivcc	%l7, %l7, %o3
	.word	0xd80e6015	! t0_kref+0xa28:   	ldub	[%i1 + 0x15], %o4
	.word	0xb9a018d2	! t0_kref+0xa2c:   	fdtos	%f18, %f28
	.word	0xd83e001d	! t0_kref+0xa30:   	std	%o4, [%i0 + %i5]
	.word	0xafa018d8	! t0_kref+0xa34:   	fdtos	%f24, %f23
	.word	0x34800003	! t0_kref+0xa38:   	bg,a	_kref+0xa44
	.word	0x9735800c	! t0_kref+0xa3c:   	srl	%l6, %o4, %o3
	.word	0xe786501c	! t0_kref+0xa40:   	lda	[%i1 + %i4]0x80, %f19
	.word	0x92ddc000	! t0_kref+0xa44:   	smulcc	%l7, %g0, %o1
	.word	0x2d800005	! t0_kref+0xa48:   	fbg,a	_kref+0xa5c
	.word	0xd4801018	! t0_kref+0xa4c:   	lda	[%g0 + %i0]0x80, %o2
	.word	0xd208a001	! t0_kref+0xa50:   	ldub	[%g2 + 1], %o1
	.word	0x81dd4018	! t0_kref+0xa54:   	flush	%l5 + %i0
	.word	0x96a2287e	! t0_kref+0xa58:   	subcc	%o0, 0x87e, %o3
	.word	0x34800008	! t0_kref+0xa5c:   	bg,a	_kref+0xa7c
	.word	0x15079af9	! t0_kref+0xa60:   	sethi	%hi(0x1e6be400), %o2
	.word	0xfd1e7fe0	! t0_kref+0xa64:   	ldd	[%i1 - 0x20], %f30
	.word	0xaba00531	! t0_kref+0xa68:   	fsqrts	%f17, %f21
	.word	0x8143c000	! t0_kref+0xa6c:   	stbar
	.word	0xd01f4019	! t0_kref+0xa70:   	ldd	[%i5 + %i1], %o0
	.word	0x2d800007	! t0_kref+0xa74:   	fbg,a	_kref+0xa90
	.word	0x942b6e21	! t0_kref+0xa78:   	andn	%o5, 0xe21, %o2
	.word	0xafa018d0	! t0_kref+0xa7c:   	fdtos	%f16, %f23
	.word	0xe7067fe8	! t0_kref+0xa80:   	ld	[%i1 - 0x18], %f19
	.word	0x98ddbfff	! t0_kref+0xa84:   	smulcc	%l6, -0x1, %o4
	.word	0x9675f5d9	! t0_kref+0xa88:   	udiv	%l7, -0xa27, %o3
	.word	0x94db2e33	! t0_kref+0xa8c:   	smulcc	%o4, 0xe33, %o2
	.word	0xe0303d2e	! t0_kref+0xa90:   	sth	%l0, [%g0 - 0x2d2]
	.word	0x99320000	! t0_kref+0xa94:   	srl	%o0, %g0, %o4
	.word	0xd208a00a	! t0_kref+0xa98:   	ldub	[%g2 + 0xa], %o1
	.word	0x96980000	! t0_kref+0xa9c:   	xorcc	%g0, %g0, %o3
	.word	0xd4680018	! t0_kref+0xaa0:   	ldstub	[%g0 + %i0], %o2
	.word	0xee263fe0	! t0_kref+0xaa4:   	st	%l7, [%i0 - 0x20]
	.word	0x98a6a9d5	! t0_kref+0xaa8:   	subcc	%i2, 0x9d5, %o4
	.word	0x30800007	! t0_kref+0xaac:   	ba,a	_kref+0xac8
	.word	0x9272ffd6	! t0_kref+0xab0:   	udiv	%o3, -0x2a, %o1
	.word	0xd20e8019	! t0_kref+0xab4:   	ldub	[%i2 + %i1], %o1
	.word	0xf1063fe0	! t0_kref+0xab8:   	ld	[%i0 - 0x20], %f24
	.word	0xd808a021	! t0_kref+0xabc:   	ldub	[%g2 + 0x21], %o4
	.word	0x9653387e	! t0_kref+0xac0:   	umul	%o4, -0x782, %o3
	.word	0x923a4008	! t0_kref+0xac4:   	xnor	%o1, %o0, %o1
	.word	0xa5a589de	! t0_kref+0xac8:   	fdivd	%f22, %f30, %f18
	.word	0x98333b24	! t0_kref+0xacc:   	orn	%o4, -0x4dc, %o4
	.word	0x947d400a	! t0_kref+0xad0:   	sdiv	%l5, %o2, %o2
	.word	0xbda01913	! t0_kref+0xad4:   	fitod	%f19, %f30
	.word	0x8143c000	! t0_kref+0xad8:   	stbar
	.word	0xa9a018d2	! t0_kref+0xadc:   	fdtos	%f18, %f20
	.word	0xf76e2000	! t0_kref+0xae0:   	prefetch	%i0, 27
	.word	0x81ae4a34	! t0_kref+0xae4:   	fcmps	%fcc0, %f25, %f20
	.word	0x932dc00a	! t0_kref+0xae8:   	sll	%l7, %o2, %o1
	.word	0x9338201d	! t0_kref+0xaec:   	sra	%g0, 0x1d, %o1
	.word	0x951a6726	! t0_kref+0xaf0:   	tsubcctv	%o1, 0x726, %o2
	.word	0xef00a018	! t0_kref+0xaf4:   	ld	[%g2 + 0x18], %f23
	.word	0x81824000	! t0_kref+0xaf8:   	wr	%o1, %g0, %y
	.word	0x973e8008	! t0_kref+0xafc:   	sra	%i2, %o0, %o3
	.word	0xa9a70958	! t0_kref+0xb00:   	fmuld	%f28, %f24, %f20
	.word	0xa9a50958	! t0_kref+0xb04:   	fmuld	%f20, %f24, %f20
	.word	0xada01a50	! t0_kref+0xb08:   	fdtoi	%f16, %f22
	.word	0x20800002	! t0_kref+0xb0c:   	bn,a	_kref+0xb14
	.word	0xafa01a5e	! t0_kref+0xb10:   	fdtoi	%f30, %f23
	.word	0xe81e001d	! t0_kref+0xb14:   	ldd	[%i0 + %i5], %l4
	.word	0x81ae0a54	! t0_kref+0xb18:   	fcmpd	%fcc0, %f24, %f20
	.word	0x9722c000	! t0_kref+0xb1c:   	mulscc	%o3, %g0, %o3
	.word	0xf91fbe38	! t0_kref+0xb20:   	ldd	[%fp - 0x1c8], %f28
	.word	0x9fc00004	! t0_kref+0xb24:   	call	%g0 + %g4
	.word	0x9222800b	! t0_kref+0xb28:   	sub	%o2, %o3, %o1
	.word	0xd0a61000	! t0_kref+0xb2c:   	sta	%o0, [%i0]0x80
	.word	0x965820b7	! t0_kref+0xb30:   	smul	%g0, 0xb7, %o3
	.word	0x922d6004	! t0_kref+0xb34:   	andn	%l5, 4, %o1
	.word	0xf19f1a18	! t0_kref+0xb38:   	ldda	[%i4 + %i0]0xd0, %f24
	.word	0x86102003	! t0_kref+0xb3c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xb40:   	bne,a	_kref+0xb40
	.word	0x86a0e001	! t0_kref+0xb44:   	subcc	%g3, 1, %g3
	.word	0xd8167ff4	! t0_kref+0xb48:   	lduh	[%i1 - 0xc], %o4
	.word	0xa7a01a38	! t0_kref+0xb4c:   	fstoi	%f24, %f19
	.word	0x33800008	! t0_kref+0xb50:   	fbe,a	_kref+0xb70
	.word	0x95258000	! t0_kref+0xb54:   	mulscc	%l6, %g0, %o2
	.word	0xe900a034	! t0_kref+0xb58:   	ld	[%g2 + 0x34], %f20
	.word	0xc020a018	! t0_kref+0xb5c:   	clr	[%g2 + 0x18]
	.word	0x9940c000	! t0_kref+0xb60:   	mov	%asi, %o4
	.word	0xb9a00538	! t0_kref+0xb64:   	fsqrts	%f24, %f28
	.word	0x9625a90a	! t0_kref+0xb68:   	sub	%l6, 0x90a, %o3
	.word	0x98530015	! t0_kref+0xb6c:   	umul	%o4, %l5, %o4
	.word	0xe4086b78	! t0_kref+0xb70:   	ldub	[%g1 + 0xb78], %l2
	.word	0xa41ca00c	! t0_kref+0xb74:   	xor	%l2, 0xc, %l2
	.word	0xe4286b78	! t0_kref+0xb78:   	stb	%l2, [%g1 + 0xb78]
	.word	0x81d86b78	! t0_kref+0xb7c:   	flush	%g1 + 0xb78
	.word	0x92fd800a	! t0_kref+0xb80:   	sdivcc	%l6, %o2, %o1
	.word	0x985b000b	! t0_kref+0xb84:   	smul	%o4, %o3, %o4
	.word	0xd0fe5000	! t0_kref+0xb88:   	swapa	[%i1]0x80, %o0
	.word	0xe59e101d	! t0_kref+0xb8c:   	ldda	[%i0 + %i5]0x80, %f18
	.word	0x85828000	! t0_kref+0xb90:   	wr	%o2, %g0, %ccr
	.word	0x3d480004	! t0_kref+0xb94:   	fbule,a,pt	%fcc0, _kref+0xba4
	.word	0xd4de1000	! t0_kref+0xb98:   	ldxa	[%i0]0x80, %o2
	.word	0x81ad4ab8	! t0_kref+0xb9c:   	fcmpes	%fcc0, %f21, %f24
	.word	0x8143c000	! t0_kref+0xba0:   	stbar
2:	.word	0x945570ad	! t0_kref+0xba4:   	umul	%l5, -0xf53, %o2
	.word	0xf9066014	! t0_kref+0xba8:   	ld	[%i1 + 0x14], %f28
	.word	0xa7a01a58	! t0_kref+0xbac:   	fdtoi	%f24, %f19
	.word	0xd848a02a	! t0_kref+0xbb0:   	ldsb	[%g2 + 0x2a], %o4
	.word	0x924268e1	! t0_kref+0xbb4:   	addc	%o1, 0x8e1, %o1
	.word	0xecf01018	! t0_kref+0xbb8:   	stxa	%l6, [%g0 + %i0]0x80
	.word	0xd4080018	! t0_kref+0xbbc:   	ldub	[%g0 + %i0], %o2
	.word	0xada489da	! t0_kref+0xbc0:   	fdivd	%f18, %f26, %f22
	.word	0x972a2013	! t0_kref+0xbc4:   	sll	%o0, 0x13, %o3
	.word	0x98726386	! t0_kref+0xbc8:   	udiv	%o1, 0x386, %o4
	.word	0xe8180018	! t0_kref+0xbcc:   	ldd	[%g0 + %i0], %l4
	.word	0x81af4ab5	! t0_kref+0xbd0:   	fcmpes	%fcc0, %f29, %f21
	.word	0xb5a01912	! t0_kref+0xbd4:   	fitod	%f18, %f26
	.word	0xd440a038	! t0_kref+0xbd8:   	ldsw	[%g2 + 0x38], %o2
	.word	0xd208a028	! t0_kref+0xbdc:   	ldub	[%g2 + 0x28], %o1
	.word	0x9725ea5b	! t0_kref+0xbe0:   	mulscc	%l7, 0xa5b, %o3
	.word	0x31800005	! t0_kref+0xbe4:   	fba,a	_kref+0xbf8
	.word	0xe51fbfa0	! t0_kref+0xbe8:   	ldd	[%fp - 0x60], %f18
	.word	0xf700a01c	! t0_kref+0xbec:   	ld	[%g2 + 0x1c], %f27
	.word	0xa1a78956	! t0_kref+0xbf0:   	fmuld	%f30, %f22, %f16
	.word	0x94fb0000	! t0_kref+0xbf4:   	sdivcc	%o4, %g0, %o2
	.word	0x81ac8a50	! t0_kref+0xbf8:   	fcmpd	%fcc0, %f18, %f16
	.word	0x960b000d	! t0_kref+0xbfc:   	and	%o4, %o5, %o3
	.word	0xb5a509da	! t0_kref+0xc00:   	fdivd	%f20, %f26, %f26
	.word	0xb9a00139	! t0_kref+0xc04:   	fabss	%f25, %f28
	.word	0xa9a688bc	! t0_kref+0xc08:   	fsubs	%f26, %f28, %f20
	.word	0xd628a039	! t0_kref+0xc0c:   	stb	%o3, [%g2 + 0x39]
	.word	0xea2e3fe3	! t0_kref+0xc10:   	stb	%l5, [%i0 - 0x1d]
	.word	0x131b7fd4	! t0_kref+0xc14:   	sethi	%hi(0x6dff5000), %o1
	.word	0x2f800004	! t0_kref+0xc18:   	fbu,a	_kref+0xc28
	.word	0xd8861000	! t0_kref+0xc1c:   	lda	[%i0]0x80, %o4
	.word	0xf7067ff8	! t0_kref+0xc20:   	ld	[%i1 - 8], %f27
	.word	0x928b20a5	! t0_kref+0xc24:   	andcc	%o4, 0xa5, %o1
	.word	0x31800002	! t0_kref+0xc28:   	fba,a	_kref+0xc30
	.word	0x94a2e895	! t0_kref+0xc2c:   	subcc	%o3, 0x895, %o2
	.word	0xd4066010	! t0_kref+0xc30:   	ld	[%i1 + 0x10], %o2
	.word	0xc36e400b	! t0_kref+0xc34:   	prefetch	%i1 + %o3, 1
	.word	0xb1a689d2	! t0_kref+0xc38:   	fdivd	%f26, %f18, %f24
	.word	0x993b401a	! t0_kref+0xc3c:   	sra	%o5, %i2, %o4
	.word	0x26800003	! t0_kref+0xc40:   	bl,a	_kref+0xc4c
	.word	0x9658000b	! t0_kref+0xc44:   	smul	%g0, %o3, %o3
	.word	0xe19e9a19	! t0_kref+0xc48:   	ldda	[%i2 + %i1]0xd0, %f16
	.word	0xbda018d4	! t0_kref+0xc4c:   	fdtos	%f20, %f30
	.word	0xd86e3fe9	! t0_kref+0xc50:   	ldstub	[%i0 - 0x17], %o4
	.word	0xd02e8019	! t0_kref+0xc54:   	stb	%o0, [%i2 + %i1]
	.word	0xada01914	! t0_kref+0xc58:   	fitod	%f20, %f22
	.word	0xf93e7fe8	! t0_kref+0xc5c:   	std	%f28, [%i1 - 0x18]
	.word	0x30800008	! t0_kref+0xc60:   	ba,a	_kref+0xc80
	.word	0x81db2e25	! t0_kref+0xc64:   	flush	%o4 + 0xe25
	.word	0xb5a00032	! t0_kref+0xc68:   	fmovs	%f18, %f26
	.word	0x9482400b	! t0_kref+0xc6c:   	addcc	%o1, %o3, %o2
	.word	0x81858000	! t0_kref+0xc70:   	wr	%l6, %g0, %y
	.word	0x92f0312a	! t0_kref+0xc74:   	udivcc	%g0, -0xed6, %o1
	.word	0x26800002	! t0_kref+0xc78:   	bl,a	_kref+0xc80
	.word	0xf51e001d	! t0_kref+0xc7c:   	ldd	[%i0 + %i5], %f26
	.word	0xb7a01a3c	! t0_kref+0xc80:   	fstoi	%f28, %f27
	.word	0xfd062014	! t0_kref+0xc84:   	ld	[%i0 + 0x14], %f30
	.word	0xb1a0191d	! t0_kref+0xc88:   	fitod	%f29, %f24
	.word	0xc96e6018	! t0_kref+0xc8c:   	prefetch	%i1 + 0x18, 4
	.word	0xea680018	! t0_kref+0xc90:   	ldstub	[%g0 + %i0], %l5
	.word	0xed20a020	! t0_kref+0xc94:   	st	%f22, [%g2 + 0x20]
	.word	0x96a3400b	! t0_kref+0xc98:   	subcc	%o5, %o3, %o3
	.word	0xb5a0005a	! t0_kref+0xc9c:   	fmovd	%f26, %f26
	.word	0xa5a78958	! t0_kref+0xca0:   	fmuld	%f30, %f24, %f18
	.word	0x962a262e	! t0_kref+0xca4:   	andn	%o0, 0x62e, %o3
	.word	0x81ad8a5c	! t0_kref+0xca8:   	fcmpd	%fcc0, %f22, %f28
	.word	0x81ac0a5c	! t0_kref+0xcac:   	fcmpd	%fcc0, %f16, %f28
	.word	0xd84e6014	! t0_kref+0xcb0:   	ldsb	[%i1 + 0x14], %o4
	.word	0x81868000	! t0_kref+0xcb4:   	wr	%i2, %g0, %y
	.word	0xd25e6008	! t0_kref+0xcb8:   	ldx	[%i1 + 8], %o1
	.word	0xb1a018d4	! t0_kref+0xcbc:   	fdtos	%f20, %f24
	.word	0xb3a0053d	! t0_kref+0xcc0:   	fsqrts	%f29, %f25
	.word	0x92f0001a	! t0_kref+0xcc4:   	udivcc	%g0, %i2, %o1
	.word	0x9f414000	! t0_kref+0xcc8:   	mov	%pc, %o7
	.word	0x98f34015	! t0_kref+0xccc:   	udivcc	%o5, %l5, %o4
	.word	0x95408000	! t0_kref+0xcd0:   	mov	%ccr, %o2
	.word	0xada01a3d	! t0_kref+0xcd4:   	fstoi	%f29, %f22
	.word	0xd0ae9018	! t0_kref+0xcd8:   	stba	%o0, [%i2 + %i0]0x80
	.word	0xaba01a54	! t0_kref+0xcdc:   	fdtoi	%f20, %f21
	.word	0xec30a036	! t0_kref+0xce0:   	sth	%l6, [%g2 + 0x36]
	.word	0x968d8015	! t0_kref+0xce4:   	andcc	%l6, %l5, %o3
	.word	0xbda0053b	! t0_kref+0xce8:   	fsqrts	%f27, %f30
	.word	0x94f5b54a	! t0_kref+0xcec:   	udivcc	%l6, -0xab6, %o2
	.word	0xec2e8018	! t0_kref+0xcf0:   	stb	%l6, [%i2 + %i0]
	.word	0xe3262018	! t0_kref+0xcf4:   	st	%f17, [%i0 + 0x18]
	.word	0xf4362010	! t0_kref+0xcf8:   	sth	%i2, [%i0 + 0x10]
	.word	0xd408a022	! t0_kref+0xcfc:   	ldub	[%g2 + 0x22], %o2
	.word	0xec200018	! t0_kref+0xd00:   	st	%l6, [%g0 + %i0]
	.word	0x9fc10000	! t0_kref+0xd04:   	call	%g4
	.word	0x93408000	! t0_kref+0xd08:   	mov	%ccr, %o1
	.word	0xd648a010	! t0_kref+0xd0c:   	ldsb	[%g2 + 0x10], %o3
	.word	0xd84e2003	! t0_kref+0xd10:   	ldsb	[%i0 + 3], %o4
	.word	0xb5a588d2	! t0_kref+0xd14:   	fsubd	%f22, %f18, %f26
	.word	0x96554000	! t0_kref+0xd18:   	umul	%l5, %g0, %o3
	.word	0xd24e8019	! t0_kref+0xd1c:   	ldsb	[%i2 + %i1], %o1
	.word	0x92b021f6	! t0_kref+0xd20:   	orncc	%g0, 0x1f6, %o1
	.word	0x35800003	! t0_kref+0xd24:   	fbue,a	_kref+0xd30
	.word	0xe900a004	! t0_kref+0xd28:   	ld	[%g2 + 4], %f20
	.word	0xbda01a5a	! t0_kref+0xd2c:   	fdtoi	%f26, %f30
	.word	0xb9a018d0	! t0_kref+0xd30:   	fdtos	%f16, %f28
	.word	0x9535c008	! t0_kref+0xd34:   	srl	%l7, %o0, %o2
	.word	0x94626a65	! t0_kref+0xd38:   	subc	%o1, 0xa65, %o2
	.word	0xd448a02f	! t0_kref+0xd3c:   	ldsb	[%g2 + 0x2f], %o2
	.word	0xa7a4c835	! t0_kref+0xd40:   	fadds	%f19, %f21, %f19
	.word	0x985ac00a	! t0_kref+0xd44:   	smul	%o3, %o2, %o4
	.word	0xf19e1a1a	! t0_kref+0xd48:   	ldda	[%i0 + %i2]0xd0, %f24
	.word	0xafa01a3a	! t0_kref+0xd4c:   	fstoi	%f26, %f23
	.word	0x81ae8a5c	! t0_kref+0xd50:   	fcmpd	%fcc0, %f26, %f28
	.word	0xd440a000	! t0_kref+0xd54:   	ldsw	[%g2], %o2
	.word	0x81dd000b	! t0_kref+0xd58:   	flush	%l4 + %o3
	.word	0xe9bf1a19	! t0_kref+0xd5c:   	stda	%f20, [%i4 + %i1]0xd0
	.word	0xafa01a54	! t0_kref+0xd60:   	fdtoi	%f20, %f23
	.word	0xb1a01a5a	! t0_kref+0xd64:   	fdtoi	%f26, %f24
	.word	0x21480008	! t0_kref+0xd68:   	fbn,a,pt	%fcc0, _kref+0xd88
	.word	0x96c3401a	! t0_kref+0xd6c:   	addccc	%o5, %i2, %o3
	.word	0xa5a0003d	! t0_kref+0xd70:   	fmovs	%f29, %f18
	.word	0x3a800006	! t0_kref+0xd74:   	bcc,a	_kref+0xd8c
	.word	0x985abb8b	! t0_kref+0xd78:   	smul	%o2, -0x475, %o4
	.word	0x97358015	! t0_kref+0xd7c:   	srl	%l6, %l5, %o3
	.word	0xeef6501d	! t0_kref+0xd80:   	stxa	%l7, [%i1 + %i5]0x80
	.word	0xd608a00c	! t0_kref+0xd84:   	ldub	[%g2 + 0xc], %o3
	.word	0xd44e2019	! t0_kref+0xd88:   	ldsb	[%i0 + 0x19], %o2
	.word	0xd030a002	! t0_kref+0xd8c:   	sth	%o0, [%g2 + 2]
	.word	0xeb00a03c	! t0_kref+0xd90:   	ld	[%g2 + 0x3c], %f21
	.word	0x95222513	! t0_kref+0xd94:   	mulscc	%o0, 0x513, %o2
	.word	0xd030a018	! t0_kref+0xd98:   	sth	%o0, [%g2 + 0x18]
	.word	0x9855c00a	! t0_kref+0xd9c:   	umul	%l7, %o2, %o4
	.word	0x98837dc7	! t0_kref+0xda0:   	addcc	%o5, -0x239, %o4
	.word	0x96783e28	! t0_kref+0xda4:   	sdiv	%g0, -0x1d8, %o3
	.word	0x3b800005	! t0_kref+0xda8:   	fble,a	_kref+0xdbc
	.word	0xc87834b4	! t0_kref+0xdac:   	swap	[%g0 - 0xb4c], %g4
	.word	0xf706401c	! t0_kref+0xdb0:   	ld	[%i1 + %i4], %f27
	.word	0x98e20009	! t0_kref+0xdb4:   	subccc	%o0, %o1, %o4
	.word	0xc807bfec	! t0_kref+0xdb8:   	ld	[%fp - 0x14], %g4
	.word	0xb1a7895a	! t0_kref+0xdbc:   	fmuld	%f30, %f26, %f24
	.word	0x20800002	! t0_kref+0xdc0:   	bn,a	_kref+0xdc8
	.word	0x92c6b4ec	! t0_kref+0xdc4:   	addccc	%i2, -0xb14, %o1
	.word	0x23800007	! t0_kref+0xdc8:   	fbne,a	_kref+0xde4
	.word	0xee20a014	! t0_kref+0xdcc:   	st	%l7, [%g2 + 0x14]
	.word	0xd6263fe0	! t0_kref+0xdd0:   	st	%o3, [%i0 - 0x20]
	call	SYM(t0_subr0)
	.word	0xf900a018	! t0_kref+0xdd8:   	ld	[%g2 + 0x18], %f28
	.word	0x9612c008	! t0_kref+0xddc:   	or	%o3, %o0, %o3
	.word	0x9fc10000	! t0_kref+0xde0:   	call	%g4
	.word	0xa1a60852	! t0_kref+0xde4:   	faddd	%f24, %f18, %f16
	.word	0x001fffff	! t0_kref+0xde8:   	illtrap	0x1fffff
	.word	0xd81e401d	! t0_kref+0xdec:   	ldd	[%i1 + %i5], %o4
	.word	0x81830000	! t0_kref+0xdf0:   	wr	%o4, %g0, %y
	.word	0xe51e0000	! t0_kref+0xdf4:   	ldd	[%i0], %f18
	.word	0x20800006	! t0_kref+0xdf8:   	bn,a	_kref+0xe10
	.word	0xe5180018	! t0_kref+0xdfc:   	ldd	[%g0 + %i0], %f18
	.word	0x92fa401a	! t0_kref+0xe00:   	sdivcc	%o1, %i2, %o1
	.word	0xee28a006	! t0_kref+0xe04:   	stb	%l7, [%g2 + 6]
	.word	0xe5380018	! t0_kref+0xe08:   	std	%f18, [%g0 + %i0]
	.word	0xa9a01935	! t0_kref+0xe0c:   	fstod	%f21, %f20
	.word	0xd610a00a	! t0_kref+0xe10:   	lduh	[%g2 + 0xa], %o3
	.word	0x948e8000	! t0_kref+0xe14:   	andcc	%i2, %g0, %o2
	.word	0xb9a00538	! t0_kref+0xe18:   	fsqrts	%f24, %f28
	.word	0xf53e7fe0	! t0_kref+0xe1c:   	std	%f26, [%i1 - 0x20]
	.word	0x8182c000	! t0_kref+0xe20:   	wr	%o3, %g0, %y
	.word	0xd6b61000	! t0_kref+0xe24:   	stha	%o3, [%i0]0x80
	.word	0xd408a01d	! t0_kref+0xe28:   	ldub	[%g2 + 0x1d], %o2
	.word	0xd40e2015	! t0_kref+0xe2c:   	ldub	[%i0 + 0x15], %o2
	.word	0xf53e2000	! t0_kref+0xe30:   	std	%f26, [%i0]
	.word	0x965b645d	! t0_kref+0xe34:   	smul	%o5, 0x45d, %o3
	.word	0x9226b210	! t0_kref+0xe38:   	sub	%i2, -0xdf0, %o1
	.word	0xb5a01a5c	! t0_kref+0xe3c:   	fdtoi	%f28, %f26
	.word	0x9653000d	! t0_kref+0xe40:   	umul	%o4, %o5, %o3
	.word	0x969a7494	! t0_kref+0xe44:   	xorcc	%o1, -0xb6c, %o3
	.word	0xada5c9b9	! t0_kref+0xe48:   	fdivs	%f23, %f25, %f22
	.word	0xd6200018	! t0_kref+0xe4c:   	st	%o3, [%g0 + %i0]
	.word	0xb3a018da	! t0_kref+0xe50:   	fdtos	%f26, %f25
	.word	0x171e4193	! t0_kref+0xe54:   	sethi	%hi(0x79064c00), %o3
	.word	0x92236459	! t0_kref+0xe58:   	sub	%o5, 0x459, %o1
	.word	0xe9be9a18	! t0_kref+0xe5c:   	stda	%f20, [%i2 + %i0]0xd0
	.word	0x962a65e1	! t0_kref+0xe60:   	andn	%o1, 0x5e1, %o3
	.word	0x25800003	! t0_kref+0xe64:   	fblg,a	_kref+0xe70
	.word	0x949a0000	! t0_kref+0xe68:   	xorcc	%o0, %g0, %o2
	.word	0xb7a018d6	! t0_kref+0xe6c:   	fdtos	%f22, %f27
	.word	0x81ddb545	! t0_kref+0xe70:   	flush	%l6 - 0xabb
	.word	0x3e800006	! t0_kref+0xe74:   	bvc,a	_kref+0xe8c
	.word	0x9822a6c5	! t0_kref+0xe78:   	sub	%o2, 0x6c5, %o4
	.word	0xb9a708d6	! t0_kref+0xe7c:   	fsubd	%f28, %f22, %f28
	.word	0x943d4009	! t0_kref+0xe80:   	xnor	%l5, %o1, %o2
	.word	0x17216a34	! t0_kref+0xe84:   	sethi	%hi(0x85a8d000), %o3
	.word	0x81ae8a58	! t0_kref+0xe88:   	fcmpd	%fcc0, %f26, %f24
	.word	0x96aabd58	! t0_kref+0xe8c:   	andncc	%o2, -0x2a8, %o3
	.word	0x8143c000	! t0_kref+0xe90:   	stbar
	.word	0x81ad0a52	! t0_kref+0xe94:   	fcmpd	%fcc0, %f20, %f18
	.word	0x991ae6ab	! t0_kref+0xe98:   	tsubcctv	%o3, 0x6ab, %o4
	.word	0xa5a01a5a	! t0_kref+0xe9c:   	fdtoi	%f26, %f18
	.word	0xf1be1840	! t0_kref+0xea0:   	stda	%f24, [%i0]0xc2
	.word	0xd6080018	! t0_kref+0xea4:   	ldub	[%g0 + %i0], %o3
	.word	0x930dae50	! t0_kref+0xea8:   	tsubcc	%l6, 0xe50, %o1
	.word	0xb1a00536	! t0_kref+0xeac:   	fsqrts	%f22, %f24
!	.word	0x29490c51	! t0_kref+0xeb0:   	fbl,a,pt	%fcc0, SYM(t0_subr2)
	   	fbl,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9e006e84	! t0_kref+0xeb4:   	add	%g1, 0xe84, %o7
	.word	0xd8300019	! t0_kref+0xeb8:   	sth	%o4, [%g0 + %i1]
	.word	0x932361d2	! t0_kref+0xebc:   	mulscc	%o5, 0x1d2, %o1
	.word	0xa5a018dc	! t0_kref+0xec0:   	fdtos	%f28, %f18
	.word	0x98e3000a	! t0_kref+0xec4:   	subccc	%o4, %o2, %o4
	.word	0x25480008	! t0_kref+0xec8:   	fblg,a,pt	%fcc0, _kref+0xee8
	.word	0x961b000b	! t0_kref+0xecc:   	xor	%o4, %o3, %o3
	.word	0x925dc00d	! t0_kref+0xed0:   	smul	%l7, %o5, %o1
	call	SYM(t0_subr2)
	.word	0xb1a0005a	! t0_kref+0xed8:   	fmovd	%f26, %f24
	.word	0x9245401a	! t0_kref+0xedc:   	addc	%l5, %i2, %o1
	.word	0xb1a01a3b	! t0_kref+0xee0:   	fstoi	%f27, %f24
	.word	0x92e0001a	! t0_kref+0xee4:   	subccc	%g0, %i2, %o1
	.word	0x81ae8aba	! t0_kref+0xee8:   	fcmpes	%fcc0, %f26, %f26
	.word	0x9325800d	! t0_kref+0xeec:   	mulscc	%l6, %o5, %o1
	.word	0xe0680019	! t0_kref+0xef0:   	ldstub	[%g0 + %i1], %l0
	.word	0x96a56a4e	! t0_kref+0xef4:   	subcc	%l5, 0xa4e, %o3
	.word	0x991dab21	! t0_kref+0xef8:   	tsubcctv	%l6, 0xb21, %o4
	.word	0x81ae0a5e	! t0_kref+0xefc:   	fcmpd	%fcc0, %f24, %f30
	.word	0x9833700a	! t0_kref+0xf00:   	orn	%o5, -0xff6, %o4
	.word	0xada9405c	! t0_kref+0xf04:   	fmovdug	%fcc0, %f28, %f22
	.word	0x9822a674	! t0_kref+0xf08:   	sub	%o2, 0x674, %o4
	.word	0xada01a50	! t0_kref+0xf0c:   	fdtoi	%f16, %f22
	.word	0xd44e0000	! t0_kref+0xf10:   	ldsb	[%i0], %o2
	.word	0xfd3e2008	! t0_kref+0xf14:   	std	%f30, [%i0 + 8]
	.word	0xa5a01a34	! t0_kref+0xf18:   	fstoi	%f20, %f18
	.word	0x9665bb3b	! t0_kref+0xf1c:   	subc	%l6, -0x4c5, %o3
	.word	0x9855baa1	! t0_kref+0xf20:   	umul	%l6, -0x55f, %o4
	.word	0x942020f5	! t0_kref+0xf24:   	sub	%g0, 0xf5, %o2
	sethi	%hi(2f), %o7
	.word	0xe40be348	! t0_kref+0xf2c:   	ldub	[%o7 + 0x348], %l2
	.word	0xa41ca00c	! t0_kref+0xf30:   	xor	%l2, 0xc, %l2
	.word	0xe42be348	! t0_kref+0xf34:   	stb	%l2, [%o7 + 0x348]
	.word	0x81dbe348	! t0_kref+0xf38:   	flush	%o7 + 0x348
	.word	0xc07f0018	! t0_kref+0xf3c:   	swap	[%i4 + %i0], %g0
	.word	0x98fb001a	! t0_kref+0xf40:   	sdivcc	%o4, %i2, %o4
	.word	0xf1be5816	! t0_kref+0xf44:   	stda	%f24, [%i1 + %l6]0xc0
2:	.word	0x9932a019	! t0_kref+0xf48:   	srl	%o2, 0x19, %o4
	.word	0x8143e040	! t0_kref+0xf4c:   	membar	0x40
	.word	0xd240a020	! t0_kref+0xf50:   	ldsw	[%g2 + 0x20], %o1
	.word	0xb5a508d8	! t0_kref+0xf54:   	fsubd	%f20, %f24, %f26
	.word	0xec1e7ff0	! t0_kref+0xf58:   	ldd	[%i1 - 0x10], %l6
	.word	0xd41e6018	! t0_kref+0xf5c:   	ldd	[%i1 + 0x18], %o2
	.word	0xfd00a014	! t0_kref+0xf60:   	ld	[%g2 + 0x14], %f30
	.word	0x92aac00a	! t0_kref+0xf64:   	andncc	%o3, %o2, %o1
	.word	0x9843000d	! t0_kref+0xf68:   	addc	%o4, %o5, %o4
	.word	0x150446da	! t0_kref+0xf6c:   	sethi	%hi(0x111b6800), %o2
	.word	0xb5a749bd	! t0_kref+0xf70:   	fdivs	%f29, %f29, %f26
	.word	0x9fc00004	! t0_kref+0xf74:   	call	%g0 + %g4
	.word	0x97418000	! t0_kref+0xf78:   	mov	%fprs, %o3
	.word	0xb5a01a5c	! t0_kref+0xf7c:   	fdtoi	%f28, %f26
	.word	0xb5a01114	! t0_kref+0xf80:   	fxtod	%f20, %f26
	.word	0x81da4018	! t0_kref+0xf84:   	flush	%o1 + %i0
	.word	0xaba018de	! t0_kref+0xf88:   	fdtos	%f30, %f21
	.word	0xb9a688d4	! t0_kref+0xf8c:   	fsubd	%f26, %f20, %f28
	.word	0xa5a788d2	! t0_kref+0xf90:   	fsubd	%f30, %f18, %f18
	.word	0xd808a03d	! t0_kref+0xf94:   	ldub	[%g2 + 0x3d], %o4
	.word	0x85834000	! t0_kref+0xf98:   	wr	%o5, %g0, %ccr
	.word	0xec1e3ff8	! t0_kref+0xf9c:   	ldd	[%i0 - 8], %l6
	.word	0x948b29d1	! t0_kref+0xfa0:   	andcc	%o4, 0x9d1, %o2
	.word	0xd856001b	! t0_kref+0xfa4:   	ldsh	[%i0 + %i3], %o4
	.word	0x985022e1	! t0_kref+0xfa8:   	umul	%g0, 0x2e1, %o4
	.word	0xa9a01a37	! t0_kref+0xfac:   	fstoi	%f23, %f20
	.word	0xed6e7fe8	! t0_kref+0xfb0:   	prefetch	%i1 - 0x18, 22
	.word	0x8143c000	! t0_kref+0xfb4:   	stbar
	.word	0x98a2ecd2	! t0_kref+0xfb8:   	subcc	%o3, 0xcd2, %o4
	.word	0xb7a00039	! t0_kref+0xfbc:   	fmovs	%f25, %f27
	.word	0xd41f4019	! t0_kref+0xfc0:   	ldd	[%i5 + %i1], %o2
	.word	0x24800004	! t0_kref+0xfc4:   	ble,a	_kref+0xfd4
	.word	0xee2e7ff9	! t0_kref+0xfc8:   	stb	%l7, [%i1 - 7]
	.word	0xd40e6016	! t0_kref+0xfcc:   	ldub	[%i1 + 0x16], %o2
	.word	0x98d5e652	! t0_kref+0xfd0:   	umulcc	%l7, 0x652, %o4
	.word	0x98aa3d00	! t0_kref+0xfd4:   	andncc	%o0, -0x300, %o4
	.word	0x96524009	! t0_kref+0xfd8:   	umul	%o1, %o1, %o3
	.word	0x99037e1d	! t0_kref+0xfdc:   	taddcc	%o5, -0x1e3, %o4
	.word	0x98080000	! t0_kref+0xfe0:   	and	%g0, %g0, %o4
	.word	0x98580015	! t0_kref+0xfe4:   	smul	%g0, %l5, %o4
	.word	0xb9a588de	! t0_kref+0xfe8:   	fsubd	%f22, %f30, %f28
	.word	0x83414000	! t0_kref+0xfec:   	mov	%pc, %g1
	.word	0x3d800002	! t0_kref+0xff0:   	fbule,a	_kref+0xff8
	.word	0xe76e401b	! t0_kref+0xff4:   	prefetch	%i1 + %i3, 19
	.word	0x968b2931	! t0_kref+0xff8:   	andcc	%o4, 0x931, %o3
	.word	0x95418000	! t0_kref+0xffc:   	mov	%fprs, %o2
	.word	0x952379a5	! t0_kref+0x1000:   	mulscc	%o5, -0x65b, %o2
	.word	0xbda01a5a	! t0_kref+0x1004:   	fdtoi	%f26, %f30
	.word	0x81ae0a54	! t0_kref+0x1008:   	fcmpd	%fcc0, %f24, %f20
	.word	0x94658016	! t0_kref+0x100c:   	subc	%l6, %l6, %o2
	.word	0x92a68017	! t0_kref+0x1010:   	subcc	%i2, %l7, %o1
	.word	0x947af8dd	! t0_kref+0x1014:   	sdiv	%o3, -0x723, %o2
	.word	0x81ac4abc	! t0_kref+0x1018:   	fcmpes	%fcc0, %f17, %f28
	.word	0x96bb0017	! t0_kref+0x101c:   	xnorcc	%o4, %l7, %o3
	.word	0xd24e3fe8	! t0_kref+0x1020:   	ldsb	[%i0 - 0x18], %o1
	.word	0xd4ff1019	! t0_kref+0x1024:   	swapa	[%i4 + %i1]0x80, %o2
	.word	0x949a3cae	! t0_kref+0x1028:   	xorcc	%o0, -0x352, %o2
	.word	0xbda00035	! t0_kref+0x102c:   	fmovs	%f21, %f30
	.word	0xb5a688d4	! t0_kref+0x1030:   	fsubd	%f26, %f20, %f26
	.word	0x81da400a	! t0_kref+0x1034:   	flush	%o1 + %o2
	.word	0xd406001c	! t0_kref+0x1038:   	ld	[%i0 + %i4], %o2
	.word	0xa9a00532	! t0_kref+0x103c:   	fsqrts	%f18, %f20
	.word	0xd6563ff4	! t0_kref+0x1040:   	ldsh	[%i0 - 0xc], %o3
	.word	0x94e68015	! t0_kref+0x1044:   	subccc	%i2, %l5, %o2
	.word	0x2d800002	! t0_kref+0x1048:   	fbg,a	_kref+0x1050
	.word	0xada58950	! t0_kref+0x104c:   	fmuld	%f22, %f16, %f22
	.word	0x942afb64	! t0_kref+0x1050:   	andn	%o3, -0x49c, %o2
	.word	0x31800008	! t0_kref+0x1054:   	fba,a	_kref+0x1074
	.word	0xc0264000	! t0_kref+0x1058:   	clr	[%i1]
	.word	0x81de292c	! t0_kref+0x105c:   	flush	%i0 + 0x92c
	.word	0x98f570f2	! t0_kref+0x1060:   	udivcc	%l5, -0xf0e, %o4
	.word	0x94380017	! t0_kref+0x1064:   	xnor	%g0, %l7, %o2
	.word	0x81af8a5a	! t0_kref+0x1068:   	fcmpd	%fcc0, %f30, %f26
	.word	0xa1a70850	! t0_kref+0x106c:   	faddd	%f28, %f16, %f16
	.word	0x8143c000	! t0_kref+0x1070:   	stbar
	.word	0xbda01912	! t0_kref+0x1074:   	fitod	%f18, %f30
	.word	0x95230000	! t0_kref+0x1078:   	mulscc	%o4, %g0, %o2
	.word	0x942d6e8f	! t0_kref+0x107c:   	andn	%l5, 0xe8f, %o2
	.word	0x928d4008	! t0_kref+0x1080:   	andcc	%l5, %o0, %o1
	.word	0x9222ee02	! t0_kref+0x1084:   	sub	%o3, 0xe02, %o1
	.word	0xf1be184c	! t0_kref+0x1088:   	stda	%f24, [%i0 + %o4]0xc2
	.word	0xd8080018	! t0_kref+0x108c:   	ldub	[%g0 + %i0], %o4
	.word	0x92d33966	! t0_kref+0x1090:   	umulcc	%o4, -0x69a, %o1
	.word	0x8143c000	! t0_kref+0x1094:   	stbar
	.word	0xe56e2010	! t0_kref+0x1098:   	prefetch	%i0 + 0x10, 18
	.word	0xd8be101d	! t0_kref+0x109c:   	stda	%o4, [%i0 + %i5]0x80
	.word	0x928b2049	! t0_kref+0x10a0:   	andcc	%o4, 0x49, %o1
	.word	0xd6480019	! t0_kref+0x10a4:   	ldsb	[%g0 + %i1], %o3
	.word	0x973a001a	! t0_kref+0x10a8:   	sra	%o0, %i2, %o3
	.word	0x35800003	! t0_kref+0x10ac:   	fbue,a	_kref+0x10b8
	.word	0xb7a7893c	! t0_kref+0x10b0:   	fmuls	%f30, %f28, %f27
	.word	0xe7ee501c	! t0_kref+0x10b4:   	prefetcha	%i1 + %i4, 19
	.word	0xb5a688d4	! t0_kref+0x10b8:   	fsubd	%f26, %f20, %f26
	.word	0x98e2c017	! t0_kref+0x10bc:   	subccc	%o3, %l7, %o4
	.word	0x96e54016	! t0_kref+0x10c0:   	subccc	%l5, %l6, %o3
	.word	0xbda58936	! t0_kref+0x10c4:   	fmuls	%f22, %f22, %f30
	.word	0x94dac00d	! t0_kref+0x10c8:   	smulcc	%o3, %o5, %o2
	.word	0x2e800001	! t0_kref+0x10cc:   	bvs,a	_kref+0x10d0
	.word	0x8143c000	! t0_kref+0x10d0:   	stbar
	.word	0xd200a028	! t0_kref+0x10d4:   	ld	[%g2 + 0x28], %o1
	.word	0x9473766e	! t0_kref+0x10d8:   	udiv	%o5, -0x992, %o2
	.word	0xfb00a024	! t0_kref+0x10dc:   	ld	[%g2 + 0x24], %f29
	.word	0x9822c00b	! t0_kref+0x10e0:   	sub	%o3, %o3, %o4
	.word	0x95324008	! t0_kref+0x10e4:   	srl	%o1, %o0, %o2
	.word	0x92dd7399	! t0_kref+0x10e8:   	smulcc	%l5, -0xc67, %o1
	.word	0x92d83e77	! t0_kref+0x10ec:   	smulcc	%g0, -0x189, %o1
	.word	0x3e800003	! t0_kref+0x10f0:   	bvc,a	_kref+0x10fc
	.word	0x9665c000	! t0_kref+0x10f4:   	subc	%l7, %g0, %o3
	.word	0x9825ee3b	! t0_kref+0x10f8:   	sub	%l7, 0xe3b, %o4
	.word	0x8143c000	! t0_kref+0x10fc:   	stbar
	.word	0x9485c017	! t0_kref+0x1100:   	addcc	%l7, %l7, %o2
	.word	0x972339dd	! t0_kref+0x1104:   	mulscc	%o4, -0x623, %o3
	.word	0xda20a014	! t0_kref+0x1108:   	st	%o5, [%g2 + 0x14]
	.word	0x34800008	! t0_kref+0x110c:   	bg,a	_kref+0x112c
	.word	0xd828a037	! t0_kref+0x1110:   	stb	%o4, [%g2 + 0x37]
	.word	0xd440a018	! t0_kref+0x1114:   	ldsw	[%g2 + 0x18], %o2
	.word	0x9632c01a	! t0_kref+0x1118:   	orn	%o3, %i2, %o3
	.word	0x9416801a	! t0_kref+0x111c:   	or	%i2, %i2, %o2
	.word	0xd430a038	! t0_kref+0x1120:   	sth	%o2, [%g2 + 0x38]
	.word	0x97400000	! t0_kref+0x1124:   	mov	%y, %o3
	.word	0x94a2a45a	! t0_kref+0x1128:   	subcc	%o2, 0x45a, %o2
	.word	0xada01933	! t0_kref+0x112c:   	fstod	%f19, %f22
	.word	0x943aa1a7	! t0_kref+0x1130:   	xnor	%o2, 0x1a7, %o2
	.word	0xe9be5a1a	! t0_kref+0x1134:   	stda	%f20, [%i1 + %i2]0xd0
	.word	0x9735a008	! t0_kref+0x1138:   	srl	%l6, 0x8, %o3
	.word	0xf3a6101c	! t0_kref+0x113c:   	sta	%f25, [%i0 + %i4]0x80
	.word	0x98da39a2	! t0_kref+0x1140:   	smulcc	%o0, -0x65e, %o4
	.word	0xd0266010	! t0_kref+0x1144:   	st	%o0, [%i1 + 0x10]
	.word	0x81ae8a34	! t0_kref+0x1148:   	fcmps	%fcc0, %f26, %f20
	.word	0xed00a004	! t0_kref+0x114c:   	ld	[%g2 + 4], %f22
	.word	0x98a58000	! t0_kref+0x1150:   	subcc	%l6, %g0, %o4
	.word	0xd64e401a	! t0_kref+0x1154:   	ldsb	[%i1 + %i2], %o3
	.word	0xefa01018	! t0_kref+0x1158:   	sta	%f23, [%g0 + %i0]0x80
	.word	0xa9a01a32	! t0_kref+0x115c:   	fstoi	%f18, %f20
	.word	0x9fc00004	! t0_kref+0x1160:   	call	%g0 + %g4
	.word	0xd240a034	! t0_kref+0x1164:   	ldsw	[%g2 + 0x34], %o1
	.word	0xd030a01c	! t0_kref+0x1168:   	sth	%o0, [%g2 + 0x1c]
	.word	0x81dc4015	! t0_kref+0x116c:   	flush	%l1 + %l5
	.word	0xe81e3ff8	! t0_kref+0x1170:   	ldd	[%i0 - 8], %l4
	.word	0x9fc00004	! t0_kref+0x1174:   	call	%g0 + %g4
	.word	0xd83e3fe8	! t0_kref+0x1178:   	std	%o4, [%i0 - 0x18]
	.word	0x98f3000b	! t0_kref+0x117c:   	udivcc	%o4, %o3, %o4
	.word	0x96a30016	! t0_kref+0x1180:   	subcc	%o4, %l6, %o3
	.word	0xaba018d4	! t0_kref+0x1184:   	fdtos	%f20, %f21
	.word	0x9923400b	! t0_kref+0x1188:   	mulscc	%o5, %o3, %o4
	.word	0x86102002	! t0_kref+0x118c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1190:   	bne,a	_kref+0x1190
	.word	0x86a0e001	! t0_kref+0x1194:   	subcc	%g3, 1, %g3
	.word	0x8143c000	! t0_kref+0x1198:   	stbar
	.word	0x9fc00004	! t0_kref+0x119c:   	call	%g0 + %g4
	.word	0x96e6800d	! t0_kref+0x11a0:   	subccc	%i2, %o5, %o3
	.word	0x9726800a	! t0_kref+0x11a4:   	mulscc	%i2, %o2, %o3
	.word	0x9850000c	! t0_kref+0x11a8:   	umul	%g0, %o4, %o4
	.word	0xd62e6008	! t0_kref+0x11ac:   	stb	%o3, [%i1 + 8]
	.word	0xbda4cd31	! t0_kref+0x11b0:   	fsmuld	%f19, %f17, %f30
	.word	0xec30a03a	! t0_kref+0x11b4:   	sth	%l6, [%g2 + 0x3a]
	.word	0x949d800a	! t0_kref+0x11b8:   	xorcc	%l6, %o2, %o2
	.word	0x93258000	! t0_kref+0x11bc:   	mulscc	%l6, %g0, %o1
	.word	0x94a30000	! t0_kref+0x11c0:   	subcc	%o4, %g0, %o2
	.word	0x93400000	! t0_kref+0x11c4:   	mov	%y, %o1
	.word	0x19391cde	! t0_kref+0x11c8:   	sethi	%hi(0xe4737800), %o4
	.word	0xd628a014	! t0_kref+0x11cc:   	stb	%o3, [%g2 + 0x14]
	.word	0xd640a030	! t0_kref+0x11d0:   	ldsw	[%g2 + 0x30], %o3
	.word	0x945d4009	! t0_kref+0x11d4:   	smul	%l5, %o1, %o2
	.word	0xb3a5093a	! t0_kref+0x11d8:   	fmuls	%f20, %f26, %f25
	.word	0x98a574a5	! t0_kref+0x11dc:   	subcc	%l5, -0xb5b, %o4
	.word	0x3e480001	! t0_kref+0x11e0:   	bvc,a,pt	%icc, _kref+0x11e4
	.word	0x9662000b	! t0_kref+0x11e4:   	subc	%o0, %o3, %o3
	.word	0x983dc01a	! t0_kref+0x11e8:   	xnor	%l7, %i2, %o4
	.word	0xee2e7ff1	! t0_kref+0x11ec:   	stb	%l7, [%i1 - 0xf]
	.word	0xb5a70958	! t0_kref+0x11f0:   	fmuld	%f28, %f24, %f26
	.word	0xc036c018	! t0_kref+0x11f4:   	clrh	[%i3 + %i0]
	.word	0xb5a709de	! t0_kref+0x11f8:   	fdivd	%f28, %f30, %f26
	.word	0xb1a68d39	! t0_kref+0x11fc:   	fsmuld	%f26, %f25, %f24
	.word	0x9265c00d	! t0_kref+0x1200:   	subc	%l7, %o5, %o1
	.word	0x92fa000d	! t0_kref+0x1204:   	sdivcc	%o0, %o5, %o1
	.word	0xd848a02c	! t0_kref+0x1208:   	ldsb	[%g2 + 0x2c], %o4
	.word	0xb9a0103b	! t0_kref+0x120c:   	fstox	%f27, %f28
	.word	0x972d800a	! t0_kref+0x1210:   	sll	%l6, %o2, %o3
	.word	0x94554016	! t0_kref+0x1214:   	umul	%l5, %l6, %o2
	.word	0x92882bfa	! t0_kref+0x1218:   	andcc	%g0, 0xbfa, %o1
	.word	0x86102004	! t0_kref+0x121c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x1220:   	bne,a	_kref+0x1220
	.word	0x86a0e001	! t0_kref+0x1224:   	subcc	%g3, 1, %g3
	.word	0xd608a01b	! t0_kref+0x1228:   	ldub	[%g2 + 0x1b], %o3
	.word	0x94f30016	! t0_kref+0x122c:   	udivcc	%o4, %l6, %o2
	.word	0xb5a0191c	! t0_kref+0x1230:   	fitod	%f28, %f26
	.word	0xd4080018	! t0_kref+0x1234:   	ldub	[%g0 + %i0], %o2
	.word	0xf1060000	! t0_kref+0x1238:   	ld	[%i0], %f24
	.word	0x98700000	! t0_kref+0x123c:   	udiv	%g0, %g0, %o4
	.word	0x94158017	! t0_kref+0x1240:   	or	%l6, %l7, %o2
	.word	0xee262018	! t0_kref+0x1244:   	st	%l7, [%i0 + 0x18]
	.word	0xedee501a	! t0_kref+0x1248:   	prefetcha	%i1 + %i2, 22
	.word	0x9652a3d4	! t0_kref+0x124c:   	umul	%o2, 0x3d4, %o3
	.word	0x94e3369b	! t0_kref+0x1250:   	subccc	%o4, -0x965, %o2
	.word	0x94fae5c0	! t0_kref+0x1254:   	sdivcc	%o3, 0x5c0, %o2
	.word	0x8143c000	! t0_kref+0x1258:   	stbar
	.word	0x993dc000	! t0_kref+0x125c:   	sra	%l7, %g0, %o4
	.word	0x8610200d	! t0_kref+0x1260:   	mov	0xd, %g3
	.word	0x86a0e001	! t0_kref+0x1264:   	subcc	%g3, 1, %g3
	.word	0x22800015	! t0_kref+0x1268:   	be,a	_kref+0x12bc
	.word	0xd84e8018	! t0_kref+0x126c:   	ldsb	[%i2 + %i0], %o4
	.word	0x81ae0a56	! t0_kref+0x1270:   	fcmpd	%fcc0, %f24, %f22
	.word	0xd286101c	! t0_kref+0x1274:   	lda	[%i0 + %i4]0x80, %o1
	.word	0xd600a00c	! t0_kref+0x1278:   	ld	[%g2 + 0xc], %o3
	.word	0x92dd400b	! t0_kref+0x127c:   	smulcc	%l5, %o3, %o1
	.word	0x98268016	! t0_kref+0x1280:   	sub	%i2, %l6, %o4
	.word	0x9fc00004	! t0_kref+0x1284:   	call	%g0 + %g4
	.word	0x92e33d42	! t0_kref+0x1288:   	subccc	%o4, -0x2be, %o1
	.word	0x980a400b	! t0_kref+0x128c:   	and	%o1, %o3, %o4
	.word	0x94a02741	! t0_kref+0x1290:   	subcc	%g0, 0x741, %o2
	.word	0xd4367ffc	! t0_kref+0x1294:   	sth	%o2, [%i1 - 4]
	.word	0xd80e8019	! t0_kref+0x1298:   	ldub	[%i2 + %i1], %o4
	.word	0xb9a488d4	! t0_kref+0x129c:   	fsubd	%f18, %f20, %f28
	.word	0xa9a688d4	! t0_kref+0x12a0:   	fsubd	%f26, %f20, %f20
	.word	0x96bdac5e	! t0_kref+0x12a4:   	xnorcc	%l6, 0xc5e, %o3
	.word	0xaba01a5a	! t0_kref+0x12a8:   	fdtoi	%f26, %f21
	.word	0x81ae0ab5	! t0_kref+0x12ac:   	fcmpes	%fcc0, %f24, %f21
	.word	0x96e23e88	! t0_kref+0x12b0:   	subccc	%o0, -0x178, %o3
	.word	0x9458378b	! t0_kref+0x12b4:   	smul	%g0, -0x875, %o2
	.word	0x98f3400a	! t0_kref+0x12b8:   	udivcc	%o5, %o2, %o4
	.word	0xa1a488dc	! t0_kref+0x12bc:   	fsubd	%f18, %f28, %f16
	.word	0xa9a4095c	! t0_kref+0x12c0:   	fmuld	%f16, %f28, %f20
	.word	0x37800005	! t0_kref+0x12c4:   	fbge,a	_kref+0x12d8
	.word	0x94fa6bb5	! t0_kref+0x12c8:   	sdivcc	%o1, 0xbb5, %o2
	.word	0x9332400a	! t0_kref+0x12cc:   	srl	%o1, %o2, %o1
	.word	0xb7a0013a	! t0_kref+0x12d0:   	fabss	%f26, %f27
	.word	0x925eb6b8	! t0_kref+0x12d4:   	smul	%i2, -0x948, %o1
	.word	0x98134015	! t0_kref+0x12d8:   	or	%o5, %l5, %o4
	.word	0xd448a02b	! t0_kref+0x12dc:   	ldsb	[%g2 + 0x2b], %o2
	.word	0xa9a01a31	! t0_kref+0x12e0:   	fstoi	%f17, %f20
	.word	0xd840a034	! t0_kref+0x12e4:   	ldsw	[%g2 + 0x34], %o4
	.word	0x94f5e7d7	! t0_kref+0x12e8:   	udivcc	%l7, 0x7d7, %o2
	.word	0xd83f4019	! t0_kref+0x12ec:   	std	%o4, [%i5 + %i1]
	.word	0xec280019	! t0_kref+0x12f0:   	stb	%l6, [%g0 + %i1]
	.word	0xd82e2006	! t0_kref+0x12f4:   	stb	%o4, [%i0 + 6]
	.word	0x31480005	! t0_kref+0x12f8:   	fba,a,pt	%fcc0, _kref+0x130c
	.word	0x98f2c00c	! t0_kref+0x12fc:   	udivcc	%o3, %o4, %o4
	.word	0x9242c00a	! t0_kref+0x1300:   	addc	%o3, %o2, %o1
	.word	0xfb20a020	! t0_kref+0x1304:   	st	%f29, [%g2 + 0x20]
	.word	0x96debf4f	! t0_kref+0x1308:   	smulcc	%i2, -0xb1, %o3
	.word	0x92aac00d	! t0_kref+0x130c:   	andncc	%o3, %o5, %o1
	.word	0x96c6800b	! t0_kref+0x1310:   	addccc	%i2, %o3, %o3
	.word	0xe3e65008	! t0_kref+0x1314:   	casa	[%i1]0x80, %o0, %l1
	.word	0x81db0004	! t0_kref+0x1318:   	flush	%o4 + %g4
	.word	0x96b2c009	! t0_kref+0x131c:   	orncc	%o3, %o1, %o3
!	.word	0x2e490b35	! t0_kref+0x1320:   	bvs,a,pt	%icc, SYM(t0_subr2)
	   	bvs,a,pt	%icc, SYM(t0_subr2)
	.word	0x9f414000	! t0_kref+0x1324:   	mov	%pc, %o7
	.word	0x94454016	! t0_kref+0x1328:   	addc	%l5, %l6, %o2
	.word	0x9933600f	! t0_kref+0x132c:   	srl	%o5, 0xf, %o4
	.word	0x81af0ab6	! t0_kref+0x1330:   	fcmpes	%fcc0, %f28, %f22
	.word	0x945a0016	! t0_kref+0x1334:   	smul	%o0, %l6, %o2
	.word	0x932ac01a	! t0_kref+0x1338:   	sll	%o3, %i2, %o1
	.word	0xbba018d6	! t0_kref+0x133c:   	fdtos	%f22, %f29
	.word	0x20800008	! t0_kref+0x1340:   	bn,a	_kref+0x1360
	.word	0xf9bf5019	! t0_kref+0x1344:   	stda	%f28, [%i5 + %i1]0x80
	.word	0xb5a488d2	! t0_kref+0x1348:   	fsubd	%f18, %f18, %f26
	.word	0xb3a01a32	! t0_kref+0x134c:   	fstoi	%f18, %f25
	.word	0xf428a008	! t0_kref+0x1350:   	stb	%i2, [%g2 + 8]
	.word	0x92de8017	! t0_kref+0x1354:   	smulcc	%i2, %l7, %o1
	.word	0xd26e4000	! t0_kref+0x1358:   	ldstub	[%i1], %o1
	.word	0xc0a71018	! t0_kref+0x135c:   	sta	%g0, [%i4 + %i0]0x80
	.word	0x9876b8af	! t0_kref+0x1360:   	udiv	%i2, -0x751, %o4
	.word	0x23800008	! t0_kref+0x1364:   	fbne,a	_kref+0x1384
	.word	0xa5a708d8	! t0_kref+0x1368:   	fsubd	%f28, %f24, %f18
	.word	0x25800007	! t0_kref+0x136c:   	fblg,a	_kref+0x1388
	.word	0x94bd4015	! t0_kref+0x1370:   	xnorcc	%l5, %l5, %o2
	.word	0xd7e61016	! t0_kref+0x1374:   	casa	[%i0]0x80, %l6, %o3
	.word	0x81824000	! t0_kref+0x1378:   	wr	%o1, %g0, %y
	.word	0x98332800	! t0_kref+0x137c:   	orn	%o4, 0x800, %o4
	.word	0x93408000	! t0_kref+0x1380:   	mov	%ccr, %o1
	.word	0xd6363fee	! t0_kref+0x1384:   	sth	%o3, [%i0 - 0x12]
	.word	0x9642800a	! t0_kref+0x1388:   	addc	%o2, %o2, %o3
	.word	0xd2467ff8	! t0_kref+0x138c:   	ldsw	[%i1 - 8], %o1
	.word	0x85803b2e	! t0_kref+0x1390:   	mov	0xfffffb2e, %ccr
	.word	0x3c800008	! t0_kref+0x1394:   	bpos,a	_kref+0x13b4
	.word	0xbda018dc	! t0_kref+0x1398:   	fdtos	%f28, %f30
	.word	0xb7a01a39	! t0_kref+0x139c:   	fstoi	%f25, %f27
	.word	0xa5a508de	! t0_kref+0x13a0:   	fsubd	%f20, %f30, %f18
	.word	0xa5a01935	! t0_kref+0x13a4:   	fstod	%f21, %f18
	.word	0x96537a26	! t0_kref+0x13a8:   	umul	%o5, -0x5da, %o3
	.word	0x20800004	! t0_kref+0x13ac:   	bn,a	_kref+0x13bc
	.word	0xd648a000	! t0_kref+0x13b0:   	ldsb	[%g2], %o3
	.word	0xb3a00033	! t0_kref+0x13b4:   	fmovs	%f19, %f25
	.word	0xd810a036	! t0_kref+0x13b8:   	lduh	[%g2 + 0x36], %o4
	.word	0xd410a018	! t0_kref+0x13bc:   	lduh	[%g2 + 0x18], %o2
	.word	0x933d600f	! t0_kref+0x13c0:   	sra	%l5, 0xf, %o1
	.word	0x98d24000	! t0_kref+0x13c4:   	umulcc	%o1, %g0, %o4
	.word	0xa3a00132	! t0_kref+0x13c8:   	fabss	%f18, %f17
	.word	0xbda788de	! t0_kref+0x13cc:   	fsubd	%f30, %f30, %f30
	.word	0x9fc00004	! t0_kref+0x13d0:   	call	%g0 + %g4
	.word	0x981d8016	! t0_kref+0x13d4:   	xor	%l6, %l6, %o4
	.word	0xb3a018d0	! t0_kref+0x13d8:   	fdtos	%f16, %f25
	.word	0xec267ffc	! t0_kref+0x13dc:   	st	%l6, [%i1 - 4]
	.word	0xee2e001a	! t0_kref+0x13e0:   	stb	%l7, [%i0 + %i2]
	.word	0x94fa0000	! t0_kref+0x13e4:   	sdivcc	%o0, %g0, %o2
	.word	0x95356017	! t0_kref+0x13e8:   	srl	%l5, 0x17, %o2
	.word	0x92258017	! t0_kref+0x13ec:   	sub	%l6, %l7, %o1
	.word	0x9458001a	! t0_kref+0x13f0:   	smul	%g0, %i2, %o2
	.word	0xb9a01912	! t0_kref+0x13f4:   	fitod	%f18, %f28
	.word	0x001fffff	! t0_kref+0x13f8:   	illtrap	0x1fffff
	.word	0x81accab7	! t0_kref+0x13fc:   	fcmpes	%fcc0, %f19, %f23
	.word	0x953b6005	! t0_kref+0x1400:   	sra	%o5, 0x5, %o2
	.word	0x988eb421	! t0_kref+0x1404:   	andcc	%i2, -0xbdf, %o4
	.word	0xd8470019	! t0_kref+0x1408:   	ldsw	[%i4 + %i1], %o4
	.word	0x94d83003	! t0_kref+0x140c:   	smulcc	%g0, -0xffd, %o2
	.word	0x9fc00004	! t0_kref+0x1410:   	call	%g0 + %g4
	.word	0xdaa6501c	! t0_kref+0x1414:   	sta	%o5, [%i1 + %i4]0x80
	call	SYM(t0_subr1)
	.word	0x9672ad11	! t0_kref+0x141c:   	udiv	%o2, 0xd11, %o3
	.word	0xb1a40952	! t0_kref+0x1420:   	fmuld	%f16, %f18, %f24
	.word	0xec1e7fe0	! t0_kref+0x1424:   	ldd	[%i1 - 0x20], %l6
	.word	0x8143c000	! t0_kref+0x1428:   	stbar
	.word	0xb1a00535	! t0_kref+0x142c:   	fsqrts	%f21, %f24
	.word	0xf51e6010	! t0_kref+0x1430:   	ldd	[%i1 + 0x10], %f26
	.word	0xd440a014	! t0_kref+0x1434:   	ldsw	[%g2 + 0x14], %o2
	.word	0x98fa4016	! t0_kref+0x1438:   	sdivcc	%o1, %l6, %o4
	.word	0x001fffff	! t0_kref+0x143c:   	illtrap	0x1fffff
	.word	0xd608a018	! t0_kref+0x1440:   	ldub	[%g2 + 0x18], %o3
	.word	0x9435c00b	! t0_kref+0x1444:   	orn	%l7, %o3, %o2
	.word	0x001fffff	! t0_kref+0x1448:   	illtrap	0x1fffff
	.word	0x8182c000	! t0_kref+0x144c:   	wr	%o3, %g0, %y
	.word	0x93382005	! t0_kref+0x1450:   	sra	%g0, 0x5, %o1
	.word	0x22800004	! t0_kref+0x1454:   	be,a	_kref+0x1464
	.word	0x9616800b	! t0_kref+0x1458:   	or	%i2, %o3, %o3
!	.word	0x2f490ae6	! t0_kref+0x145c:   	fbu,a,pt	%fcc0, SYM(t0_subr2)
	   	fbu,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9e006470	! t0_kref+0x1460:   	add	%g1, 0x470, %o7
	.word	0xe700a024	! t0_kref+0x1464:   	ld	[%g2 + 0x24], %f19
	.word	0x949e8009	! t0_kref+0x1468:   	xorcc	%i2, %o1, %o2
	.word	0x38800003	! t0_kref+0x146c:   	bgu,a	_kref+0x1478
	.word	0x96e37e00	! t0_kref+0x1470:   	subccc	%o5, -0x200, %o3
	.word	0xb5a01114	! t0_kref+0x1474:   	fxtod	%f20, %f26
	.word	0x81ae0abb	! t0_kref+0x1478:   	fcmpes	%fcc0, %f24, %f27
	.word	0xd44e0000	! t0_kref+0x147c:   	ldsb	[%i0], %o2
	.word	0x96b5801a	! t0_kref+0x1480:   	orncc	%l6, %i2, %o3
	.word	0x9402fb9d	! t0_kref+0x1484:   	add	%o3, -0x463, %o2
	.word	0x2e800005	! t0_kref+0x1488:   	bvs,a	_kref+0x149c
	.word	0xfb067ff0	! t0_kref+0x148c:   	ld	[%i1 - 0x10], %f29
	.word	0xd8270018	! t0_kref+0x1490:   	st	%o4, [%i4 + %i0]
	.word	0x948d69e3	! t0_kref+0x1494:   	andcc	%l5, 0x9e3, %o2
	.word	0x95220008	! t0_kref+0x1498:   	mulscc	%o0, %o0, %o2
	.word	0x37480003	! t0_kref+0x149c:   	fbge,a,pt	%fcc0, _kref+0x14a8
	.word	0xd8066000	! t0_kref+0x14a0:   	ld	[%i1], %o4
	.word	0xbda588d4	! t0_kref+0x14a4:   	fsubd	%f22, %f20, %f30
	.word	0xada00154	! t0_kref+0x14a8:   	fabsd	%f20, %f22
	.word	0xb5a0191e	! t0_kref+0x14ac:   	fitod	%f30, %f26
	.word	0x9282ea33	! t0_kref+0x14b0:   	addcc	%o3, 0xa33, %o1
	.word	0x92e5e27e	! t0_kref+0x14b4:   	subccc	%l7, 0x27e, %o1
	.word	0x94fb400c	! t0_kref+0x14b8:   	sdivcc	%o5, %o4, %o2
	.word	0x3f800005	! t0_kref+0x14bc:   	fbo,a	_kref+0x14d0
	.word	0xd60e3ffa	! t0_kref+0x14c0:   	ldub	[%i0 - 6], %o3
	.word	0xef070018	! t0_kref+0x14c4:   	ld	[%i4 + %i0], %f23
	.word	0xc02e401a	! t0_kref+0x14c8:   	clrb	[%i1 + %i2]
	.word	0xada6095a	! t0_kref+0x14cc:   	fmuld	%f24, %f26, %f22
	.word	0xda367fec	! t0_kref+0x14d0:   	sth	%o5, [%i1 - 0x14]
	.word	0x933ae017	! t0_kref+0x14d4:   	sra	%o3, 0x17, %o1
	.word	0x9850001a	! t0_kref+0x14d8:   	umul	%g0, %i2, %o4
	.word	0xec1e3fe8	! t0_kref+0x14dc:   	ldd	[%i0 - 0x18], %l6
	.word	0xa9a50d37	! t0_kref+0x14e0:   	fsmuld	%f20, %f23, %f20
	.word	0xd608a007	! t0_kref+0x14e4:   	ldub	[%g2 + 7], %o3
	.word	0xd656001b	! t0_kref+0x14e8:   	ldsh	[%i0 + %i3], %o3
	.word	0xe9865000	! t0_kref+0x14ec:   	lda	[%i1]0x80, %f20
	.word	0xd83e3ff8	! t0_kref+0x14f0:   	std	%o4, [%i0 - 8]
	.word	0xd8363fe8	! t0_kref+0x14f4:   	sth	%o4, [%i0 - 0x18]
	.word	0xf1be1889	! t0_kref+0x14f8:   	stda	%f24, [%i0 + %o1]0xc4
	.word	0x3c800007	! t0_kref+0x14fc:   	bpos,a	_kref+0x1518
	.word	0xd6267fe4	! t0_kref+0x1500:   	st	%o3, [%i1 - 0x1c]
	.word	0x96ade23b	! t0_kref+0x1504:   	andncc	%l7, 0x23b, %o3
	.word	0x945a401a	! t0_kref+0x1508:   	smul	%o1, %i2, %o2
	.word	0xe9263ff4	! t0_kref+0x150c:   	st	%f20, [%i0 - 0xc]
	.word	0x8583400c	! t0_kref+0x1510:   	wr	%o5, %o4, %ccr
	.word	0x34800003	! t0_kref+0x1514:   	bg,a	_kref+0x1520
	.word	0xd44e3fe2	! t0_kref+0x1518:   	ldsb	[%i0 - 0x1e], %o2
	.word	0xafa0003d	! t0_kref+0x151c:   	fmovs	%f29, %f23
	.word	0x94e2fc4c	! t0_kref+0x1520:   	subccc	%o3, -0x3b4, %o2
	.word	0x81da4010	! t0_kref+0x1524:   	flush	%o1 + %l0
	.word	0x94fae248	! t0_kref+0x1528:   	sdivcc	%o3, 0x248, %o2
	.word	0x921a615a	! t0_kref+0x152c:   	xor	%o1, 0x15a, %o1
	.word	0x98aeba79	! t0_kref+0x1530:   	andncc	%i2, -0x587, %o4
	.word	0x933a6010	! t0_kref+0x1534:   	sra	%o1, 0x10, %o1
	.word	0x99382019	! t0_kref+0x1538:   	sra	%g0, 0x19, %o4
	.word	0x8143c000	! t0_kref+0x153c:   	stbar
	.word	0xe0ff1018	! t0_kref+0x1540:   	swapa	[%i4 + %i0]0x80, %l0
	.word	0xb9a018dc	! t0_kref+0x1544:   	fdtos	%f28, %f28
	.word	0x98a3401a	! t0_kref+0x1548:   	subcc	%o5, %i2, %o4
	.word	0xb1a4cd39	! t0_kref+0x154c:   	fsmuld	%f19, %f25, %f24
	.word	0xa5a48d32	! t0_kref+0x1550:   	fsmuld	%f18, %f18, %f18
	.word	0xed1e001d	! t0_kref+0x1554:   	ldd	[%i0 + %i5], %f22
	.word	0x98d5acb0	! t0_kref+0x1558:   	umulcc	%l6, 0xcb0, %o4
	.word	0x001fffff	! t0_kref+0x155c:   	illtrap	0x1fffff
	.word	0x99334009	! t0_kref+0x1560:   	srl	%o5, %o1, %o4
	.word	0x921ea65c	! t0_kref+0x1564:   	xor	%i2, 0x65c, %o1
	.word	0x98a2b1b4	! t0_kref+0x1568:   	subcc	%o2, -0xe4c, %o4
	.word	0xada94056	! t0_kref+0x156c:   	fmovdug	%fcc0, %f22, %f22
	.word	0xb1a408d4	! t0_kref+0x1570:   	fsubd	%f16, %f20, %f24
	.word	0xd440a004	! t0_kref+0x1574:   	ldsw	[%g2 + 4], %o2
	.word	0xe53e7ff8	! t0_kref+0x1578:   	std	%f18, [%i1 - 8]
	.word	0x9612c015	! t0_kref+0x157c:   	or	%o3, %l5, %o3
	.word	0xe4fe101c	! t0_kref+0x1580:   	swapa	[%i0 + %i4]0x80, %l2
	.word	0x9536800b	! t0_kref+0x1584:   	srl	%i2, %o3, %o2
	.word	0xd610a00a	! t0_kref+0x1588:   	lduh	[%g2 + 0xa], %o3
	.word	0xada000b8	! t0_kref+0x158c:   	fnegs	%f24, %f22
	.word	0xd200a03c	! t0_kref+0x1590:   	ld	[%g2 + 0x3c], %o1
	.word	0xafa01a50	! t0_kref+0x1594:   	fdtoi	%f16, %f23
	.word	0x9de3bfa0	! t0_kref+0x1598:   	save	%sp, -0x60, %sp
	.word	0x97ef2808	! t0_kref+0x159c:   	restore	%i4, 0x808, %o3
	.word	0x32800002	! t0_kref+0x15a0:   	bne,a	_kref+0x15a8
	.word	0x81834000	! t0_kref+0x15a4:   	wr	%o5, %g0, %y
	.word	0x941afa34	! t0_kref+0x15a8:   	xor	%o3, -0x5cc, %o2
	.word	0x81af4abe	! t0_kref+0x15ac:   	fcmpes	%fcc0, %f29, %f30
	.word	0x152bd101	! t0_kref+0x15b0:   	sethi	%hi(0xaf440400), %o2
	.word	0x25800008	! t0_kref+0x15b4:   	fblg,a	_kref+0x15d4
	.word	0xa9a708d0	! t0_kref+0x15b8:   	fsubd	%f28, %f16, %f20
	.word	0xd83e7fe0	! t0_kref+0x15bc:   	std	%o4, [%i1 - 0x20]
	.word	0x945e800c	! t0_kref+0x15c0:   	smul	%i2, %o4, %o2
	.word	0x95358008	! t0_kref+0x15c4:   	srl	%l6, %o0, %o2
	.word	0x98c5c017	! t0_kref+0x15c8:   	addccc	%l7, %l7, %o4
	.word	0xd828a003	! t0_kref+0x15cc:   	stb	%o4, [%g2 + 3]
	.word	0xda2e8018	! t0_kref+0x15d0:   	stb	%o5, [%i2 + %i0]
	.word	0x26800001	! t0_kref+0x15d4:   	bl,a	_kref+0x15d8
	.word	0xafa58934	! t0_kref+0x15d8:   	fmuls	%f22, %f20, %f23
	.word	0x9225e6f6	! t0_kref+0x15dc:   	sub	%l7, 0x6f6, %o1
	.word	0x94a28016	! t0_kref+0x15e0:   	subcc	%o2, %l6, %o2
	.word	0x9fc00004	! t0_kref+0x15e4:   	call	%g0 + %g4
	.word	0x9326a973	! t0_kref+0x15e8:   	mulscc	%i2, 0x973, %o1
	.word	0x9de3bfa0	! t0_kref+0x15ec:   	save	%sp, -0x60, %sp
	.word	0x80182ac2	! t0_kref+0x15f0:   	xor	%g0, 0xac2, %g0
	.word	0x93eef1e7	! t0_kref+0x15f4:   	restore	%i3, -0xe19, %o1
	.word	0xda363ffa	! t0_kref+0x15f8:   	sth	%o5, [%i0 - 6]
	call	SYM(t0_subr3)
	.word	0x81dc0009	! t0_kref+0x1600:   	flush	%l0 + %o1
	.word	0x980a400a	! t0_kref+0x1604:   	and	%o1, %o2, %o4
	.word	0x96630017	! t0_kref+0x1608:   	subc	%o4, %l7, %o3
	.word	0x9866800a	! t0_kref+0x160c:   	subc	%i2, %o2, %o4
	.word	0xd600a000	! t0_kref+0x1610:   	ld	[%g2], %o3
	.word	0xd2080019	! t0_kref+0x1614:   	ldub	[%g0 + %i1], %o1
	.word	0xd84e8019	! t0_kref+0x1618:   	ldsb	[%i2 + %i1], %o4
	.word	0xd226200c	! t0_kref+0x161c:   	st	%o1, [%i0 + 0xc]
	.word	0x993ae018	! t0_kref+0x1620:   	sra	%o3, 0x18, %o4
	.word	0xe900a000	! t0_kref+0x1624:   	ld	[%g2], %f20
	call	SYM(t0_subr0)
	.word	0xd40e0000	! t0_kref+0x162c:   	ldub	[%i0], %o2
	.word	0x96427dc9	! t0_kref+0x1630:   	addc	%o1, -0x237, %o3
	.word	0xbda0003c	! t0_kref+0x1634:   	fmovs	%f28, %f30
	.word	0x92f56661	! t0_kref+0x1638:   	udivcc	%l5, 0x661, %o1
	.word	0xda6e4000	! t0_kref+0x163c:   	ldstub	[%i1], %o5
	.word	0xa1a01112	! t0_kref+0x1640:   	fxtod	%f18, %f16
	.word	0xb9a01938	! t0_kref+0x1644:   	fstod	%f24, %f28
	.word	0xb1a688d4	! t0_kref+0x1648:   	fsubd	%f26, %f20, %f24
	.word	0xea6e0000	! t0_kref+0x164c:   	ldstub	[%i0], %l5
	.word	0x9625b4d3	! t0_kref+0x1650:   	sub	%l6, -0xb2d, %o3
	.word	0x928ac015	! t0_kref+0x1654:   	andcc	%o3, %l5, %o1
	.word	0x960a400c	! t0_kref+0x1658:   	and	%o1, %o4, %o3
	.word	0xd40e6001	! t0_kref+0x165c:   	ldub	[%i1 + 1], %o2
	.word	0x96da4000	! t0_kref+0x1660:   	smulcc	%o1, %g0, %o3
	.word	0x9682c008	! t0_kref+0x1664:   	addcc	%o3, %o0, %o3
	.word	0xafa01a31	! t0_kref+0x1668:   	fstoi	%f17, %f23
	.word	0x9415400b	! t0_kref+0x166c:   	or	%l5, %o3, %o2
	.word	0x81aecabd	! t0_kref+0x1670:   	fcmpes	%fcc0, %f27, %f29
	sethi	%hi(2f), %o7
	.word	0xe40be2b0	! t0_kref+0x1678:   	ldub	[%o7 + 0x2b0], %l2
	.word	0xa41ca00c	! t0_kref+0x167c:   	xor	%l2, 0xc, %l2
	.word	0xe42be2b0	! t0_kref+0x1680:   	stb	%l2, [%o7 + 0x2b0]
	.word	0x81dbe2b0	! t0_kref+0x1684:   	flush	%o7 + 0x2b0
	.word	0x96282fdf	! t0_kref+0x1688:   	andn	%g0, 0xfdf, %o3
	.word	0x9815c00b	! t0_kref+0x168c:   	or	%l7, %o3, %o4
	.word	0x9332e011	! t0_kref+0x1690:   	srl	%o3, 0x11, %o1
	.word	0x93418000	! t0_kref+0x1694:   	mov	%fprs, %o1
	.word	0xb1a588dc	! t0_kref+0x1698:   	fsubd	%f22, %f28, %f24
	.word	0x98deabba	! t0_kref+0x169c:   	smulcc	%i2, 0xbba, %o4
	.word	0xada6cd36	! t0_kref+0x16a0:   	fsmuld	%f27, %f22, %f22
	.word	0x92a28017	! t0_kref+0x16a4:   	subcc	%o2, %l7, %o1
	.word	0x9222a3dc	! t0_kref+0x16a8:   	sub	%o2, 0x3dc, %o1
	.word	0xe51e6010	! t0_kref+0x16ac:   	ldd	[%i1 + 0x10], %f18
2:	.word	0xaba01a37	! t0_kref+0x16b0:   	fstoi	%f23, %f21
	.word	0x99408000	! t0_kref+0x16b4:   	mov	%ccr, %o4
	.word	0x2e800007	! t0_kref+0x16b8:   	bvs,a	_kref+0x16d4
	.word	0xf36e6008	! t0_kref+0x16bc:   	prefetch	%i1 + 8, 25
	.word	0xafa01a52	! t0_kref+0x16c0:   	fdtoi	%f18, %f23
	.word	0xd828a035	! t0_kref+0x16c4:   	stb	%o4, [%g2 + 0x35]
	.word	0x981dc000	! t0_kref+0x16c8:   	xor	%l7, %g0, %o4
	.word	0xd24e8019	! t0_kref+0x16cc:   	ldsb	[%i2 + %i1], %o1
	.word	0xd82e7ff9	! t0_kref+0x16d0:   	stb	%o4, [%i1 - 7]
	.word	0xec6e4000	! t0_kref+0x16d4:   	ldstub	[%i1], %l6
	.word	0x988b6f2b	! t0_kref+0x16d8:   	andcc	%o5, 0xf2b, %o4
	.word	0x28800005	! t0_kref+0x16dc:   	bleu,a	_kref+0x16f0
	.word	0xb9a408de	! t0_kref+0x16e0:   	fsubd	%f16, %f30, %f28
	.word	0xd64e6010	! t0_kref+0x16e4:   	ldsb	[%i1 + 0x10], %o3
	.word	0xd200a010	! t0_kref+0x16e8:   	ld	[%g2 + 0x10], %o1
	.word	0xfb06401c	! t0_kref+0x16ec:   	ld	[%i1 + %i4], %f29
	.word	0x98883848	! t0_kref+0x16f0:   	andcc	%g0, -0x7b8, %o4
	.word	0xedbf5019	! t0_kref+0x16f4:   	stda	%f22, [%i5 + %i1]0x80
	.word	0xc1f6100b	! t0_kref+0x16f8:   	casxa	[%i0]0x80, %o3, %g0
	.word	0x8143c000	! t0_kref+0x16fc:   	stbar
	.word	0xd1f6100b	! t0_kref+0x1700:   	casxa	[%i0]0x80, %o3, %o0
	.word	0xe4086728	! t0_kref+0x1704:   	ldub	[%g1 + 0x728], %l2
	.word	0xa41ca00c	! t0_kref+0x1708:   	xor	%l2, 0xc, %l2
	.word	0xe4286728	! t0_kref+0x170c:   	stb	%l2, [%g1 + 0x728]
	.word	0x81d86728	! t0_kref+0x1710:   	flush	%g1 + 0x728
2:	.word	0x94a54000	! t0_kref+0x1714:   	subcc	%l5, %g0, %o2
	.word	0x943577c3	! t0_kref+0x1718:   	orn	%l5, -0x83d, %o2
	.word	0x81ad0a58	! t0_kref+0x171c:   	fcmpd	%fcc0, %f20, %f24
	.word	0xe1be501d	! t0_kref+0x1720:   	stda	%f16, [%i1 + %i5]0x80
	.word	0xb9a00050	! t0_kref+0x1724:   	fmovd	%f16, %f28
	.word	0xa3a01a3c	! t0_kref+0x1728:   	fstoi	%f28, %f17
	.word	0x9842800b	! t0_kref+0x172c:   	addc	%o2, %o3, %o4
	.word	0xb5a70838	! t0_kref+0x1730:   	fadds	%f28, %f24, %f26
	.word	0xa9a01918	! t0_kref+0x1734:   	fitod	%f24, %f20
	.word	0x96a268b7	! t0_kref+0x1738:   	subcc	%o1, 0x8b7, %o3
	.word	0xd8767ff8	! t0_kref+0x173c:   	stx	%o4, [%i1 - 8]
	.word	0xed3e3ff8	! t0_kref+0x1740:   	std	%f22, [%i0 - 8]
	.word	0xd8263fe8	! t0_kref+0x1744:   	st	%o4, [%i0 - 0x18]
	.word	0x81ad0a5c	! t0_kref+0x1748:   	fcmpd	%fcc0, %f20, %f28
	.word	0xa5a01a3c	! t0_kref+0x174c:   	fstoi	%f28, %f18
	.word	0xd8466004	! t0_kref+0x1750:   	ldsw	[%i1 + 4], %o4
	.word	0xb9a488d6	! t0_kref+0x1754:   	fsubd	%f18, %f22, %f28
	.word	0x962a602a	! t0_kref+0x1758:   	andn	%o1, 0x2a, %o3
	.word	0x929b000b	! t0_kref+0x175c:   	xorcc	%o4, %o3, %o1
	.word	0x92f02bb2	! t0_kref+0x1760:   	udivcc	%g0, 0xbb2, %o1
	.word	0x9632f74f	! t0_kref+0x1764:   	orn	%o3, -0x8b1, %o3
	.word	0x98d36d98	! t0_kref+0x1768:   	umulcc	%o5, 0xd98, %o4
	.word	0xeeb6d018	! t0_kref+0x176c:   	stha	%l7, [%i3 + %i0]0x80
	.word	0xb1a60952	! t0_kref+0x1770:   	fmuld	%f24, %f18, %f24
	.word	0x920a4017	! t0_kref+0x1774:   	and	%o1, %l7, %o1
	.word	0x99230009	! t0_kref+0x1778:   	mulscc	%o4, %o1, %o4
	.word	0xd4180018	! t0_kref+0x177c:   	ldd	[%g0 + %i0], %o2
	.word	0xd44e2005	! t0_kref+0x1780:   	ldsb	[%i0 + 5], %o2
	call	SYM(t0_subr2)
	.word	0x922ac000	! t0_kref+0x1788:   	andn	%o3, %g0, %o1
	.word	0x38800005	! t0_kref+0x178c:   	bgu,a	_kref+0x17a0
	.word	0xe51f4019	! t0_kref+0x1790:   	ldd	[%i5 + %i1], %f18
	.word	0x858577e1	! t0_kref+0x1794:   	wr	%l5, 0xfffff7e1, %ccr
	.word	0xea362012	! t0_kref+0x1798:   	sth	%l5, [%i0 + 0x12]
	.word	0x9472fdac	! t0_kref+0x179c:   	udiv	%o3, -0x254, %o2
	.word	0x98232d1c	! t0_kref+0x17a0:   	sub	%o4, 0xd1c, %o4
	.word	0x931ea206	! t0_kref+0x17a4:   	tsubcctv	%i2, 0x206, %o1
	.word	0xa9a709da	! t0_kref+0x17a8:   	fdivd	%f28, %f26, %f20
	.word	0x94e5c00c	! t0_kref+0x17ac:   	subccc	%l7, %o4, %o2
	.word	0xa5a01a54	! t0_kref+0x17b0:   	fdtoi	%f20, %f18
	.word	0x9f414000	! t0_kref+0x17b4:   	mov	%pc, %o7
	.word	0x878020d0	! t0_kref+0x17b8:   	mov	0xd0, %asi
	.word	0xda263ff8	! t0_kref+0x17bc:   	st	%o5, [%i0 - 8]
	.word	0xd6871019	! t0_kref+0x17c0:   	lda	[%i4 + %i1]0x80, %o3
	.word	0x28800007	! t0_kref+0x17c4:   	bleu,a	_kref+0x17e0
	.word	0x9445e4e8	! t0_kref+0x17c8:   	addc	%l7, 0x4e8, %o2
	.word	0xe91e401d	! t0_kref+0x17cc:   	ldd	[%i1 + %i5], %f20
	.word	0xd44e7fe4	! t0_kref+0x17d0:   	ldsb	[%i1 - 0x1c], %o2
	.word	0xd256001b	! t0_kref+0x17d4:   	ldsh	[%i0 + %i3], %o1
	.word	0x81ddc019	! t0_kref+0x17d8:   	flush	%l7 + %i1
	.word	0xd64e8019	! t0_kref+0x17dc:   	ldsb	[%i2 + %i1], %o3
	.word	0xf720a024	! t0_kref+0x17e0:   	st	%f27, [%g2 + 0x24]
	.word	0x86102004	! t0_kref+0x17e4:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x17e8:   	subcc	%g3, 1, %g3
	.word	0x2280000f	! t0_kref+0x17ec:   	be,a	_kref+0x1828
	.word	0x928def37	! t0_kref+0x17f0:   	andcc	%l7, 0xf37, %o1
	.word	0xd8280018	! t0_kref+0x17f4:   	stb	%o4, [%g0 + %i0]
	.word	0x952b000a	! t0_kref+0x17f8:   	sll	%o4, %o2, %o2
	.word	0xd4180019	! t0_kref+0x17fc:   	ldd	[%g0 + %i1], %o2
	.word	0xef6e7ff0	! t0_kref+0x1800:   	prefetch	%i1 - 0x10, 23
	.word	0x9564e1e0	! t0_kref+0x1804:   	movl	%icc, 0x1e0, %o2
	.word	0x9fc00004	! t0_kref+0x1808:   	call	%g0 + %g4
	.word	0x92083bb2	! t0_kref+0x180c:   	and	%g0, -0x44e, %o1
	.word	0x96faaa14	! t0_kref+0x1810:   	sdivcc	%o2, 0xa14, %o3
	.word	0x982b764b	! t0_kref+0x1814:   	andn	%o5, -0x9b5, %o4
	.word	0x8143c000	! t0_kref+0x1818:   	stbar
	.word	0x96202c65	! t0_kref+0x181c:   	sub	%g0, 0xc65, %o3
	.word	0xada01936	! t0_kref+0x1820:   	fstod	%f22, %f22
	.word	0x943eadfb	! t0_kref+0x1824:   	xnor	%i2, 0xdfb, %o2
	.word	0x9f414000	! t0_kref+0x1828:   	mov	%pc, %o7
	.word	0xb1a018da	! t0_kref+0x182c:   	fdtos	%f26, %f24
	.word	0xd81e3fe0	! t0_kref+0x1830:   	ldd	[%i0 - 0x20], %o4
	.word	0x20800002	! t0_kref+0x1834:   	bn,a	_kref+0x183c
	.word	0xea366000	! t0_kref+0x1838:   	sth	%l5, [%i1]
	.word	0x973a6014	! t0_kref+0x183c:   	sra	%o1, 0x14, %o3
	.word	0xaba54938	! t0_kref+0x1840:   	fmuls	%f21, %f24, %f21
	.word	0x96da001a	! t0_kref+0x1844:   	smulcc	%o0, %i2, %o3
	.word	0x993da00f	! t0_kref+0x1848:   	sra	%l6, 0xf, %o4
	.word	0xe9be188b	! t0_kref+0x184c:   	stda	%f20, [%i0 + %o3]0xc4
	.word	0x8143c000	! t0_kref+0x1850:   	stbar
	.word	0x980a3253	! t0_kref+0x1854:   	and	%o0, -0xdad, %o4
	.word	0x8610201b	! t0_kref+0x1858:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x185c:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x1860:   	be,a	_kref+0x187c
	.word	0xe1ee501b	! t0_kref+0x1864:   	prefetcha	%i1 + %i3, 16
	.word	0x96833b69	! t0_kref+0x1868:   	addcc	%o4, -0x497, %o3
	.word	0x98aa71b2	! t0_kref+0x186c:   	andncc	%o1, -0xe4e, %o4
	.word	0x96de8015	! t0_kref+0x1870:   	smulcc	%i2, %l5, %o3
	.word	0x94faa862	! t0_kref+0x1874:   	sdivcc	%o2, 0x862, %o2
	.word	0xf93e0000	! t0_kref+0x1878:   	std	%f28, [%i0]
	.word	0x9635fa14	! t0_kref+0x187c:   	orn	%l7, -0x5ec, %o3
	.word	0xb9a50831	! t0_kref+0x1880:   	fadds	%f20, %f17, %f28
	.word	0x81ad8ab5	! t0_kref+0x1884:   	fcmpes	%fcc0, %f22, %f21
	.word	0x952b401a	! t0_kref+0x1888:   	sll	%o5, %i2, %o2
	.word	0x9245b504	! t0_kref+0x188c:   	addc	%l6, -0xafc, %o1
	.word	0x94768015	! t0_kref+0x1890:   	udiv	%i2, %l5, %o2
	.word	0xea78a03c	! t0_kref+0x1894:   	swap	[%g2 + 0x3c], %l5
	.word	0xf91e6010	! t0_kref+0x1898:   	ldd	[%i1 + 0x10], %f28
	.word	0xb9a60d37	! t0_kref+0x189c:   	fsmuld	%f24, %f23, %f28
	.word	0x988d800b	! t0_kref+0x18a0:   	andcc	%l6, %o3, %o4
	.word	0xd84e0000	! t0_kref+0x18a4:   	ldsb	[%i0], %o4
	.word	0x972371bf	! t0_kref+0x18a8:   	mulscc	%o5, -0xe41, %o3
	.word	0x9822b44e	! t0_kref+0x18ac:   	sub	%o2, -0xbb2, %o4
	.word	0xe5a6101c	! t0_kref+0x18b0:   	sta	%f18, [%i0 + %i4]0x80
	.word	0x94ad4008	! t0_kref+0x18b4:   	andncc	%l5, %o0, %o2
	.word	0x9612afe1	! t0_kref+0x18b8:   	or	%o2, 0xfe1, %o3
	.word	0xe99e601c	! t0_kref+0x18bc:   	ldda	[%i1 + 0x1c]%asi, %f20
	.word	0x35800002	! t0_kref+0x18c0:   	fbue,a	_kref+0x18c8
	.word	0x961a4015	! t0_kref+0x18c4:   	xor	%o1, %l5, %o3
	.word	0x8143e051	! t0_kref+0x18c8:   	membar	0x51
	.word	0xf51f4019	! t0_kref+0x18cc:   	ldd	[%i5 + %i1], %f26
	.word	0xe91e2008	! t0_kref+0x18d0:   	ldd	[%i0 + 8], %f20
	.word	0x9816a2c9	! t0_kref+0x18d4:   	or	%i2, 0x2c9, %o4
	.word	0xd610a024	! t0_kref+0x18d8:   	lduh	[%g2 + 0x24], %o3
	.word	0xf1180019	! t0_kref+0x18dc:   	ldd	[%g0 + %i1], %f24
	.word	0x3a480005	! t0_kref+0x18e0:   	bcc,a,pt	%icc, _kref+0x18f4
	.word	0xe868a01b	! t0_kref+0x18e4:   	ldstub	[%g2 + 0x1b], %l4
	.word	0x988ac00b	! t0_kref+0x18e8:   	andcc	%o3, %o3, %o4
	.word	0xd80e6005	! t0_kref+0x18ec:   	ldub	[%i1 + 5], %o4
	.word	0x92b5f5e2	! t0_kref+0x18f0:   	orncc	%l7, -0xa1e, %o1
	.word	0x8143c000	! t0_kref+0x18f4:   	stbar
	.word	0xf906601c	! t0_kref+0x18f8:   	ld	[%i1 + 0x1c], %f28
	.word	0xf1ee501c	! t0_kref+0x18fc:   	prefetcha	%i1 + %i4, 24
	.word	0xd24e3fe8	! t0_kref+0x1900:   	ldsb	[%i0 - 0x18], %o1
	.word	0xda364000	! t0_kref+0x1904:   	sth	%o5, [%i1]
	.word	0xf900a038	! t0_kref+0x1908:   	ld	[%g2 + 0x38], %f28
	.word	0x2e800002	! t0_kref+0x190c:   	bvs,a	_kref+0x1914
	.word	0xe700a024	! t0_kref+0x1910:   	ld	[%g2 + 0x24], %f19
	.word	0xd2067fe4	! t0_kref+0x1914:   	ld	[%i1 - 0x1c], %o1
	.word	0xd850a022	! t0_kref+0x1918:   	ldsh	[%g2 + 0x22], %o4
	.word	0x98aa2768	! t0_kref+0x191c:   	andncc	%o0, 0x768, %o4
	.word	0x99228000	! t0_kref+0x1920:   	mulscc	%o2, %g0, %o4
	.word	0x927ea138	! t0_kref+0x1924:   	sdiv	%i2, 0x138, %o1
	.word	0xada01918	! t0_kref+0x1928:   	fitod	%f24, %f22
	.word	0xd400a034	! t0_kref+0x192c:   	ld	[%g2 + 0x34], %o2
	.word	0xa3a7893a	! t0_kref+0x1930:   	fmuls	%f30, %f26, %f17
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xb5a689d8	! t0_kref+0x193c:   	fdivd	%f26, %f24, %f26
1:	.word	0xa5a01915	! t0_kref+0x1940:   	fitod	%f21, %f18
	.word	0xe7e61000	! t0_kref+0x1944:   	casa	[%i0]0x80, %g0, %l3
	.word	0xadab0054	! t0_kref+0x1948:   	fmovduge	%fcc0, %f20, %f22
	.word	0x3e480002	! t0_kref+0x194c:   	bvc,a,pt	%icc, _kref+0x1954
	.word	0xd64e8019	! t0_kref+0x1950:   	ldsb	[%i2 + %i1], %o3
	.word	0x9465fb18	! t0_kref+0x1954:   	subc	%l7, -0x4e8, %o2
	.word	0xd41e2008	! t0_kref+0x1958:   	ldd	[%i0 + 8], %o2
	.word	0x98dac00a	! t0_kref+0x195c:   	smulcc	%o3, %o2, %o4
	.word	0xe900a02c	! t0_kref+0x1960:   	ld	[%g2 + 0x2c], %f20
	.word	0x8143e03f	! t0_kref+0x1964:   	membar	0x3f
	.word	0x94bdc01a	! t0_kref+0x1968:   	xnorcc	%l7, %i2, %o2
	.word	0x94ad800c	! t0_kref+0x196c:   	andncc	%l6, %o4, %o2
	.word	0xf1bf1a19	! t0_kref+0x1970:   	stda	%f24, [%i4 + %i1]0xd0
	.word	0x9843000d	! t0_kref+0x1974:   	addc	%o4, %o5, %o4
	call	0x00000494
	.word	0xd648a013	! t0_kref+0x197c:   	ldsb	[%g2 + 0x13], %o3
	.word	0x92854016	! t0_kref+0x1980:   	addcc	%l5, %l6, %o1
	.word	0x9455a0a2	! t0_kref+0x1984:   	umul	%l6, 0xa2, %o2
	.word	0xa9a50956	! t0_kref+0x1988:   	fmuld	%f20, %f22, %f20
	.word	0x3e800001	! t0_kref+0x198c:   	bvc,a	_kref+0x1990
	.word	0xb7a00532	! t0_kref+0x1990:   	fsqrts	%f18, %f27
	.word	0x81dc3f01	! t0_kref+0x1994:   	flush	%l0 - 0xff
	.word	0x921d800c	! t0_kref+0x1998:   	xor	%l6, %o4, %o1
	.word	0x81580000	! t0_kref+0x199c:   	flushw
	.word	0xf4200019	! t0_kref+0x19a0:   	st	%i2, [%g0 + %i1]
	.word	0xd848a02b	! t0_kref+0x19a4:   	ldsb	[%g2 + 0x2b], %o4
	.word	0x32800002	! t0_kref+0x19a8:   	bne,a	_kref+0x19b0
	.word	0x96f00015	! t0_kref+0x19ac:   	udivcc	%g0, %l5, %o3
	.word	0xb1a589da	! t0_kref+0x19b0:   	fdivd	%f22, %f26, %f24
	.word	0xb9a608da	! t0_kref+0x19b4:   	fsubd	%f24, %f26, %f28
	.word	0x86102015	! t0_kref+0x19b8:   	mov	0x15, %g3
	.word	0x86a0e001	! t0_kref+0x19bc:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x19c0:   	be,a	_kref+0x19f0
	.word	0x98db4008	! t0_kref+0x19c4:   	smulcc	%o5, %o0, %o4
	.word	0xaba00134	! t0_kref+0x19c8:   	fabss	%f20, %f21
	.word	0x94e23ae7	! t0_kref+0x19cc:   	subccc	%o0, -0x519, %o2
	.word	0x96ada4e0	! t0_kref+0x19d0:   	andncc	%l6, 0x4e0, %o3
	.word	0xd84e2014	! t0_kref+0x19d4:   	ldsb	[%i0 + 0x14], %o4
	.word	0xd8380018	! t0_kref+0x19d8:   	std	%o4, [%g0 + %i0]
	.word	0xee766008	! t0_kref+0x19dc:   	stx	%l7, [%i1 + 8]
	.word	0xe11fbc80	! t0_kref+0x19e0:   	ldd	[%fp - 0x380], %f16
	.word	0xd640a020	! t0_kref+0x19e4:   	ldsw	[%g2 + 0x20], %o3
	.word	0x973a4017	! t0_kref+0x19e8:   	sra	%o1, %l7, %o3
	.word	0xc51822e0	! t0_kref+0x19ec:   	ldd	[%g0 + 0x2e0], %f2
	.word	0xc807bfec	! t0_kref+0x19f0:   	ld	[%fp - 0x14], %g4
	.word	0x21800008	! t0_kref+0x19f4:   	fbn,a	_kref+0x1a14
	.word	0x94e2000b	! t0_kref+0x19f8:   	subccc	%o0, %o3, %o2
	.word	0x9932600f	! t0_kref+0x19fc:   	srl	%o1, 0xf, %o4
	.word	0x98fa3fc8	! t0_kref+0x1a00:   	sdivcc	%o0, -0x38, %o4
	.word	0x94e2f546	! t0_kref+0x1a04:   	subccc	%o3, -0xaba, %o2
	.word	0x92d28000	! t0_kref+0x1a08:   	umulcc	%o2, %g0, %o1
	.word	0xb1a00536	! t0_kref+0x1a0c:   	fsqrts	%f22, %f24
	.word	0x94ddf983	! t0_kref+0x1a10:   	smulcc	%l7, -0x67d, %o2
	.word	0x9616800d	! t0_kref+0x1a14:   	or	%i2, %o5, %o3
	.word	0x94fd800a	! t0_kref+0x1a18:   	sdivcc	%l6, %o2, %o2
	.word	0x8143c000	! t0_kref+0x1a1c:   	stbar
	.word	0xf91e3fe0	! t0_kref+0x1a20:   	ldd	[%i0 - 0x20], %f28
	.word	0x98dab1e7	! t0_kref+0x1a24:   	smulcc	%o2, -0xe19, %o4
	.word	0x9253000b	! t0_kref+0x1a28:   	umul	%o4, %o3, %o1
	.word	0xd410a014	! t0_kref+0x1a2c:   	lduh	[%g2 + 0x14], %o2
	.word	0x3e800006	! t0_kref+0x1a30:   	bvc,a	_kref+0x1a48
	.word	0xd210a00e	! t0_kref+0x1a34:   	lduh	[%g2 + 0xe], %o1
	.word	0x9816801a	! t0_kref+0x1a38:   	or	%i2, %i2, %o4
	.word	0x947221e0	! t0_kref+0x1a3c:   	udiv	%o0, 0x1e0, %o2
	.word	0xf906001c	! t0_kref+0x1a40:   	ld	[%i0 + %i4], %f28
	.word	0xfb067ffc	! t0_kref+0x1a44:   	ld	[%i1 - 4], %f29
	.word	0x3b800004	! t0_kref+0x1a48:   	fble,a	_kref+0x1a58
	.word	0xa9a01a3c	! t0_kref+0x1a4c:   	fstoi	%f28, %f20
	.word	0xb9a01a3c	! t0_kref+0x1a50:   	fstoi	%f28, %f28
	.word	0x001fffff	! t0_kref+0x1a54:   	illtrap	0x1fffff
	.word	0xd65e2018	! t0_kref+0x1a58:   	ldx	[%i0 + 0x18], %o3
	.word	0x81af8a5e	! t0_kref+0x1a5c:   	fcmpd	%fcc0, %f30, %f30
	.word	0x948a7ad5	! t0_kref+0x1a60:   	andcc	%o1, -0x52b, %o2
	.word	0xd808a02b	! t0_kref+0x1a64:   	ldub	[%g2 + 0x2b], %o4
	.word	0x3c800004	! t0_kref+0x1a68:   	bpos,a	_kref+0x1a78
	.word	0x98d5c01a	! t0_kref+0x1a6c:   	umulcc	%l7, %i2, %o4
	.word	0xa9a508d2	! t0_kref+0x1a70:   	fsubd	%f20, %f18, %f20
	.word	0x8143c000	! t0_kref+0x1a74:   	stbar
	.word	0x81dd0019	! t0_kref+0x1a78:   	flush	%l4 + %i1
	.word	0x949a31fb	! t0_kref+0x1a7c:   	xorcc	%o0, -0xe05, %o2
	.word	0x9485c009	! t0_kref+0x1a80:   	addcc	%l7, %o1, %o2
	.word	0x2b800003	! t0_kref+0x1a84:   	fbug,a	_kref+0x1a90
	.word	0x92132867	! t0_kref+0x1a88:   	or	%o4, 0x867, %o1
	.word	0xd216c019	! t0_kref+0x1a8c:   	lduh	[%i3 + %i1], %o1
	.word	0xb9a01a37	! t0_kref+0x1a90:   	fstoi	%f23, %f28
	.word	0xda30a008	! t0_kref+0x1a94:   	sth	%o5, [%g2 + 8]
	.word	0x94fd400d	! t0_kref+0x1a98:   	sdivcc	%l5, %o5, %o2
	.word	0x96b30016	! t0_kref+0x1a9c:   	orncc	%o4, %l6, %o3
	.word	0x9fc00004	! t0_kref+0x1aa0:   	call	%g0 + %g4
	.word	0xe500a02c	! t0_kref+0x1aa4:   	ld	[%g2 + 0x2c], %f18
	.word	0xa9a018da	! t0_kref+0x1aa8:   	fdtos	%f26, %f20
	.word	0x9fc00004	! t0_kref+0x1aac:   	call	%g0 + %g4
	.word	0xd44e7ff0	! t0_kref+0x1ab0:   	ldsb	[%i1 - 0x10], %o2
	.word	0xd248a026	! t0_kref+0x1ab4:   	ldsb	[%g2 + 0x26], %o1
	.word	0xb5a01911	! t0_kref+0x1ab8:   	fitod	%f17, %f26
	.word	0x96a6bca7	! t0_kref+0x1abc:   	subcc	%i2, -0x359, %o3
	.word	0x953ac00d	! t0_kref+0x1ac0:   	sra	%o3, %o5, %o2
	.word	0x96832c1d	! t0_kref+0x1ac4:   	addcc	%o4, 0xc1d, %o3
	.word	0x98d6b999	! t0_kref+0x1ac8:   	umulcc	%i2, -0x667, %o4
	.word	0x98da4016	! t0_kref+0x1acc:   	smulcc	%o1, %l6, %o4
	.word	0xd4563ff2	! t0_kref+0x1ad0:   	ldsh	[%i0 - 0xe], %o2
	.word	0xe900a034	! t0_kref+0x1ad4:   	ld	[%g2 + 0x34], %f20
	.word	0x9fc10000	! t0_kref+0x1ad8:   	call	%g4
	.word	0xd44e3ff8	! t0_kref+0x1adc:   	ldsb	[%i0 - 8], %o2
	.word	0x985aec8a	! t0_kref+0x1ae0:   	smul	%o3, 0xc8a, %o4
	.word	0xda78a004	! t0_kref+0x1ae4:   	swap	[%g2 + 4], %o5
	.word	0x94503df7	! t0_kref+0x1ae8:   	umul	%g0, -0x209, %o2
	.word	0x81830000	! t0_kref+0x1aec:   	wr	%o4, %g0, %y
	.word	0x921d8000	! t0_kref+0x1af0:   	xor	%l6, %g0, %o1
	.word	0x8182c000	! t0_kref+0x1af4:   	wr	%o3, %g0, %y
	call	SYM(t0_subr3)
	.word	0xd83e4000	! t0_kref+0x1afc:   	std	%o4, [%i1]
	.word	0x9322c017	! t0_kref+0x1b00:   	mulscc	%o3, %l7, %o1
	.word	0xc02e4000	! t0_kref+0x1b04:   	clrb	[%i1]
	.word	0xada0191d	! t0_kref+0x1b08:   	fitod	%f29, %f22
	.word	0x968afe47	! t0_kref+0x1b0c:   	andcc	%o3, -0x1b9, %o3
	.word	0x25800004	! t0_kref+0x1b10:   	fblg,a	_kref+0x1b20
	.word	0x928a3589	! t0_kref+0x1b14:   	andcc	%o0, -0xa77, %o1
	.word	0xb9a609da	! t0_kref+0x1b18:   	fdivd	%f24, %f26, %f28
	.word	0xe16e001a	! t0_kref+0x1b1c:   	prefetch	%i0 + %i2, 16
	.word	0xfd6e401a	! t0_kref+0x1b20:   	prefetch	%i1 + %i2, 30
	.word	0x9735e007	! t0_kref+0x1b24:   	srl	%l7, 0x7, %o3
	.word	0x8182c000	! t0_kref+0x1b28:   	wr	%o3, %g0, %y
	.word	0xd2060000	! t0_kref+0x1b2c:   	ld	[%i0], %o1
	.word	0xd408a035	! t0_kref+0x1b30:   	ldub	[%g2 + 0x35], %o2
	.word	0xb3a01a37	! t0_kref+0x1b34:   	fstoi	%f23, %f25
	.word	0xb7a018d0	! t0_kref+0x1b38:   	fdtos	%f16, %f27
	.word	0xbda0191c	! t0_kref+0x1b3c:   	fitod	%f28, %f30
	.word	0xa9a00150	! t0_kref+0x1b40:   	fabsd	%f16, %f20
	.word	0xe5067ff0	! t0_kref+0x1b44:   	ld	[%i1 - 0x10], %f18
	.word	0x92880015	! t0_kref+0x1b48:   	andcc	%g0, %l5, %o1
	.word	0x17058107	! t0_kref+0x1b4c:   	sethi	%hi(0x16041c00), %o3
	.word	0xada01916	! t0_kref+0x1b50:   	fitod	%f22, %f22
	.word	0x81aecabc	! t0_kref+0x1b54:   	fcmpes	%fcc0, %f27, %f28
	.word	0x28800006	! t0_kref+0x1b58:   	bleu,a	_kref+0x1b70
	.word	0xd830a024	! t0_kref+0x1b5c:   	sth	%o4, [%g2 + 0x24]
	.word	0x81ae8ab5	! t0_kref+0x1b60:   	fcmpes	%fcc0, %f26, %f21
	.word	0x92127606	! t0_kref+0x1b64:   	or	%o1, -0x9fa, %o1
	.word	0x92220015	! t0_kref+0x1b68:   	sub	%o0, %l5, %o1
	.word	0xda20a008	! t0_kref+0x1b6c:   	st	%o5, [%g2 + 8]
	.word	0x925dc016	! t0_kref+0x1b70:   	smul	%l7, %l6, %o1
	.word	0xf13f4019	! t0_kref+0x1b74:   	std	%f24, [%i5 + %i1]
	.word	0xa9a01a54	! t0_kref+0x1b78:   	fdtoi	%f20, %f20
	.word	0x94fe8017	! t0_kref+0x1b7c:   	sdivcc	%i2, %l7, %o2
	.word	0x86102003	! t0_kref+0x1b80:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1b84:   	bne,a	_kref+0x1b84
	.word	0x86a0e001	! t0_kref+0x1b88:   	subcc	%g3, 1, %g3
	.word	0x15137a85	! t0_kref+0x1b8c:   	sethi	%hi(0x4dea1400), %o2
	.word	0x26800003	! t0_kref+0x1b90:   	bl,a	_kref+0x1b9c
	.word	0xd678a01c	! t0_kref+0x1b94:   	swap	[%g2 + 0x1c], %o3
	.word	0x98e6a62a	! t0_kref+0x1b98:   	subccc	%i2, 0x62a, %o4
	.word	0x9f414000	! t0_kref+0x1b9c:   	mov	%pc, %o7
!	.word	0x24490915	! t0_kref+0x1ba0:   	ble,a,pt	%icc, SYM(t0_subr2)
	   	ble,a,pt	%icc, SYM(t0_subr2)
	.word	0xe91e0000	! t0_kref+0x1ba4:   	ldd	[%i0], %f20
	.word	0x81828000	! t0_kref+0x1ba8:   	wr	%o2, %g0, %y
	.word	0xd6080018	! t0_kref+0x1bac:   	ldub	[%g0 + %i0], %o3
	.word	0xa1a70854	! t0_kref+0x1bb0:   	faddd	%f28, %f20, %f16
	.word	0xd60e7ff6	! t0_kref+0x1bb4:   	ldub	[%i1 - 0xa], %o3
	.word	0xada6095c	! t0_kref+0x1bb8:   	fmuld	%f24, %f28, %f22
	.word	0x94837cb0	! t0_kref+0x1bbc:   	addcc	%o5, -0x350, %o2
	.word	0xd650a028	! t0_kref+0x1bc0:   	ldsh	[%g2 + 0x28], %o3
	.word	0xd8270018	! t0_kref+0x1bc4:   	st	%o4, [%i4 + %i0]
	.word	0xd450a014	! t0_kref+0x1bc8:   	ldsh	[%g2 + 0x14], %o2
	.word	0xbda549be	! t0_kref+0x1bcc:   	fdivs	%f21, %f30, %f30
	.word	0x25800006	! t0_kref+0x1bd0:   	fblg,a	_kref+0x1be8
	.word	0x98f34000	! t0_kref+0x1bd4:   	udivcc	%o5, %g0, %o4
	.word	0x96dd400c	! t0_kref+0x1bd8:   	smulcc	%l5, %o4, %o3
	.word	0x92e362f4	! t0_kref+0x1bdc:   	subccc	%o5, 0x2f4, %o1
	.word	0xec2e3ffb	! t0_kref+0x1be0:   	stb	%l6, [%i0 - 5]
	.word	0x98256959	! t0_kref+0x1be4:   	sub	%l5, 0x959, %o4
	.word	0xe5e65008	! t0_kref+0x1be8:   	casa	[%i1]0x80, %o0, %l2
	.word	0xd6567fee	! t0_kref+0x1bec:   	ldsh	[%i1 - 0x12], %o3
	.word	0xd6480019	! t0_kref+0x1bf0:   	ldsb	[%g0 + %i1], %o3
	.word	0xd248a01e	! t0_kref+0x1bf4:   	ldsb	[%g2 + 0x1e], %o1
	.word	0x941e801a	! t0_kref+0x1bf8:   	xor	%i2, %i2, %o2
	.word	0x81868000	! t0_kref+0x1bfc:   	wr	%i2, %g0, %y
	.word	0xd640a020	! t0_kref+0x1c00:   	ldsw	[%g2 + 0x20], %o3
	.word	0x8143c000	! t0_kref+0x1c04:   	stbar
	.word	0xf9180018	! t0_kref+0x1c08:   	ldd	[%g0 + %i0], %f28
	.word	0x96fb4009	! t0_kref+0x1c0c:   	sdivcc	%o5, %o1, %o3
	.word	0xd440a000	! t0_kref+0x1c10:   	ldsw	[%g2], %o2
	.word	0x98fb0009	! t0_kref+0x1c14:   	sdivcc	%o4, %o1, %o4
	.word	0xd6060000	! t0_kref+0x1c18:   	ld	[%i0], %o3
	.word	0xd1e6100b	! t0_kref+0x1c1c:   	casa	[%i0]0x80, %o3, %o0
	.word	0xd4400018	! t0_kref+0x1c20:   	ldsw	[%g0 + %i0], %o2
	.word	0x96a56bf6	! t0_kref+0x1c24:   	subcc	%l5, 0xbf6, %o3
	.word	0x9480372a	! t0_kref+0x1c28:   	addcc	%g0, -0x8d6, %o2
	.word	0x96154016	! t0_kref+0x1c2c:   	or	%l5, %l6, %o3
	.word	0x83414000	! t0_kref+0x1c30:   	mov	%pc, %g1
	.word	0x1330b8a9	! t0_kref+0x1c34:   	sethi	%hi(0xc2e2a400), %o1
	.word	0x36800003	! t0_kref+0x1c38:   	bge,a	_kref+0x1c44
	.word	0xa5a018d4	! t0_kref+0x1c3c:   	fdtos	%f20, %f18
	.word	0x98222bb7	! t0_kref+0x1c40:   	sub	%o0, 0xbb7, %o4
	.word	0xee30a02c	! t0_kref+0x1c44:   	sth	%l7, [%g2 + 0x2c]
	.word	0x9465adc8	! t0_kref+0x1c48:   	subc	%l6, 0xdc8, %o2
	call	SYM(t0_subr3)
	.word	0xc02e2011	! t0_kref+0x1c50:   	clrb	[%i0 + 0x11]
	.word	0x9940c000	! t0_kref+0x1c54:   	mov	%asi, %o4
	.word	0xd24e8018	! t0_kref+0x1c58:   	ldsb	[%i2 + %i0], %o1
	.word	0x21480001	! t0_kref+0x1c5c:   	fbn,a,pt	%fcc0, _kref+0x1c60
	.word	0x92da0008	! t0_kref+0x1c60:   	smulcc	%o0, %o0, %o1
	.word	0xa7a0189a	! t0_kref+0x1c64:   	fitos	%f26, %f19
	.word	0xfdb81018	! t0_kref+0x1c68:   	stda	%f30, [%g0 + %i0]0x80
	.word	0x96aa8015	! t0_kref+0x1c6c:   	andncc	%o2, %l5, %o3
	call	SYM(t0_subr0)
	.word	0x81824000	! t0_kref+0x1c74:   	wr	%o1, %g0, %y
	.word	0xd83e001d	! t0_kref+0x1c78:   	std	%o4, [%i0 + %i5]
	.word	0x35800001	! t0_kref+0x1c7c:   	fbue,a	_kref+0x1c80
	.word	0xb7a01a54	! t0_kref+0x1c80:   	fdtoi	%f20, %f27
	.word	0xc02e8019	! t0_kref+0x1c84:   	clrb	[%i2 + %i1]
	.word	0xd2680019	! t0_kref+0x1c88:   	ldstub	[%g0 + %i1], %o1
	.word	0x96f20016	! t0_kref+0x1c8c:   	udivcc	%o0, %l6, %o3
	.word	0xada0015c	! t0_kref+0x1c90:   	fabsd	%f28, %f22
	.word	0x969b401a	! t0_kref+0x1c94:   	xorcc	%o5, %i2, %o3
	.word	0x96433b43	! t0_kref+0x1c98:   	addc	%o4, -0x4bd, %o3
	.word	0x9fc10000	! t0_kref+0x1c9c:   	call	%g4
	.word	0xe91e3ff0	! t0_kref+0x1ca0:   	ldd	[%i0 - 0x10], %f20
	.word	0x94de800d	! t0_kref+0x1ca4:   	smulcc	%i2, %o5, %o2
	.word	0x9240375b	! t0_kref+0x1ca8:   	addc	%g0, -0x8a5, %o1
	.word	0x989ac016	! t0_kref+0x1cac:   	xorcc	%o3, %l6, %o4
	.word	0xd830a036	! t0_kref+0x1cb0:   	sth	%o4, [%g2 + 0x36]
	call	SYM(t0_subr0)
	.word	0x92db400c	! t0_kref+0x1cb8:   	smulcc	%o5, %o4, %o1
	.word	0xd208a038	! t0_kref+0x1cbc:   	ldub	[%g2 + 0x38], %o1
	.word	0x9865b1b7	! t0_kref+0x1cc0:   	subc	%l6, -0xe49, %o4
	.word	0x81de8015	! t0_kref+0x1cc4:   	flush	%i2 + %l5
	.word	0x9265646e	! t0_kref+0x1cc8:   	subc	%l5, 0x46e, %o1
	.word	0x2c800004	! t0_kref+0x1ccc:   	bneg,a	_kref+0x1cdc
	.word	0xb9a489d0	! t0_kref+0x1cd0:   	fdivd	%f18, %f16, %f28
	.word	0xadaa003e	! t0_kref+0x1cd4:   	fmovsa	%fcc0, %f30, %f22
	.word	0xd83e001d	! t0_kref+0x1cd8:   	std	%o4, [%i0 + %i5]
	.word	0x9850301d	! t0_kref+0x1cdc:   	umul	%g0, -0xfe3, %o4
	.word	0x81820000	! t0_kref+0x1ce0:   	wr	%o0, %g0, %y
	.word	0xd440a024	! t0_kref+0x1ce4:   	ldsw	[%g2 + 0x24], %o2
	.word	0x94554008	! t0_kref+0x1ce8:   	umul	%l5, %o0, %o2
	.word	0xa7a01a54	! t0_kref+0x1cec:   	fdtoi	%f20, %f19
	.word	0x98e58008	! t0_kref+0x1cf0:   	subccc	%l6, %o0, %o4
	.word	0x81dec018	! t0_kref+0x1cf4:   	flush	%i3 + %i0
	.word	0x94102a9c	! t0_kref+0x1cf8:   	mov	0xa9c, %o2
	.word	0xd4266014	! t0_kref+0x1cfc:   	st	%o2, [%i1 + 0x14]
	.word	0xb7a01a39	! t0_kref+0x1d00:   	fstoi	%f25, %f27
	.word	0xe7e65016	! t0_kref+0x1d04:   	casa	[%i1]0x80, %l6, %l3
	.word	0x81df64a2	! t0_kref+0x1d08:   	flush	%i5 + 0x4a2
	.word	0x921d4016	! t0_kref+0x1d0c:   	xor	%l5, %l6, %o1
	.word	0x81820000	! t0_kref+0x1d10:   	wr	%o0, %g0, %y
	.word	0xd810a010	! t0_kref+0x1d14:   	lduh	[%g2 + 0x10], %o4
	.word	0xd2300018	! t0_kref+0x1d18:   	sth	%o1, [%g0 + %i0]
	.word	0xed6e2000	! t0_kref+0x1d1c:   	prefetch	%i0, 22
	.word	0xf7066018	! t0_kref+0x1d20:   	ld	[%i1 + 0x18], %f27
	.word	0x98fafe26	! t0_kref+0x1d24:   	sdivcc	%o3, -0x1da, %o4
	.word	0x2d480003	! t0_kref+0x1d28:   	fbg,a,pt	%fcc0, _kref+0x1d34
	.word	0x925a7460	! t0_kref+0x1d2c:   	smul	%o1, -0xba0, %o1
	.word	0x96faa9e1	! t0_kref+0x1d30:   	sdivcc	%o2, 0x9e1, %o3
	.word	0xf5be101d	! t0_kref+0x1d34:   	stda	%f26, [%i0 + %i5]0x80
	.word	0x96fd68ad	! t0_kref+0x1d38:   	sdivcc	%l5, 0x8ad, %o3
	.word	0xf51fbce8	! t0_kref+0x1d3c:   	ldd	[%fp - 0x318], %f26
	.word	0x94dde947	! t0_kref+0x1d40:   	smulcc	%l7, 0x947, %o2
	.word	0x9fc00004	! t0_kref+0x1d44:   	call	%g0 + %g4
	.word	0xb1a409d4	! t0_kref+0x1d48:   	fdivd	%f16, %f20, %f24
	.word	0x920224be	! t0_kref+0x1d4c:   	add	%o0, 0x4be, %o1
	.word	0xd2b6501b	! t0_kref+0x1d50:   	stha	%o1, [%i1 + %i3]0x80
	.word	0xeb20a008	! t0_kref+0x1d54:   	st	%f21, [%g2 + 8]
	.word	0x92ddb87f	! t0_kref+0x1d58:   	smulcc	%l6, -0x781, %o1
	.word	0xb1a78958	! t0_kref+0x1d5c:   	fmuld	%f30, %f24, %f24
	.word	0x20800003	! t0_kref+0x1d60:   	bn,a	_kref+0x1d6c
	.word	0x9685c00d	! t0_kref+0x1d64:   	addcc	%l7, %o5, %o3
	.word	0xc12e001c	! t0_kref+0x1d68:   	st	%fsr, [%i0 + %i4]
	.word	0x99083990	! t0_kref+0x1d6c:   	tsubcc	%g0, -0x670, %o4
	.word	0xada01a34	! t0_kref+0x1d70:   	fstoi	%f20, %f22
	.word	0x94f2800a	! t0_kref+0x1d74:   	udivcc	%o2, %o2, %o2
	.word	0x81828000	! t0_kref+0x1d78:   	wr	%o2, %g0, %y
	.word	0x1908f863	! t0_kref+0x1d7c:   	sethi	%hi(0x23e18c00), %o4
	.word	0x9408001a	! t0_kref+0x1d80:   	and	%g0, %i2, %o2
	.word	0x98e2001a	! t0_kref+0x1d84:   	subccc	%o0, %i2, %o4
	.word	0x972261f0	! t0_kref+0x1d88:   	mulscc	%o1, 0x1f0, %o3
	.word	0xea280018	! t0_kref+0x1d8c:   	stb	%l5, [%g0 + %i0]
	.word	0x29800008	! t0_kref+0x1d90:   	fbl,a	_kref+0x1db0
	.word	0x98436a5f	! t0_kref+0x1d94:   	addc	%o5, 0xa5f, %o4
	.word	0x933ea01e	! t0_kref+0x1d98:   	sra	%i2, 0x1e, %o1
	.word	0x92c2710b	! t0_kref+0x1d9c:   	addccc	%o1, -0xef5, %o1
	.word	0xd486101c	! t0_kref+0x1da0:   	lda	[%i0 + %i4]0x80, %o2
	.word	0xb7a00138	! t0_kref+0x1da4:   	fabss	%f24, %f27
	.word	0xbda608da	! t0_kref+0x1da8:   	fsubd	%f24, %f26, %f30
	.word	0x9215b48f	! t0_kref+0x1dac:   	or	%l6, -0xb71, %o1
	.word	0xe51e4000	! t0_kref+0x1db0:   	ldd	[%i1], %f18
	.word	0x38800007	! t0_kref+0x1db4:   	bgu,a	_kref+0x1dd0
	.word	0xb5a018d2	! t0_kref+0x1db8:   	fdtos	%f18, %f26
	call	SYM(t0_subr2)
	.word	0x962a0016	! t0_kref+0x1dc0:   	andn	%o0, %l6, %o3
	.word	0xd84e401a	! t0_kref+0x1dc4:   	ldsb	[%i1 + %i2], %o4
	.word	0xb1a0189a	! t0_kref+0x1dc8:   	fitos	%f26, %f24
	.word	0x9285b8ce	! t0_kref+0x1dcc:   	addcc	%l6, -0x732, %o1
	.word	0x9738001a	! t0_kref+0x1dd0:   	sra	%g0, %i2, %o3
	.word	0xe51e2000	! t0_kref+0x1dd4:   	ldd	[%i0], %f18
	.word	0x945b668d	! t0_kref+0x1dd8:   	smul	%o5, 0x68d, %o2
	.word	0x948a000d	! t0_kref+0x1ddc:   	andcc	%o0, %o5, %o2
	.word	0x81830000	! t0_kref+0x1de0:   	wr	%o4, %g0, %y
	.word	0x32800006	! t0_kref+0x1de4:   	bne,a	_kref+0x1dfc
	.word	0xb9a01934	! t0_kref+0x1de8:   	fstod	%f20, %f28
	.word	0xa5a01a50	! t0_kref+0x1dec:   	fdtoi	%f16, %f18
	.word	0x9fc10000	! t0_kref+0x1df0:   	call	%g4
	.word	0xbda01911	! t0_kref+0x1df4:   	fitod	%f17, %f30
	.word	0x21800007	! t0_kref+0x1df8:   	fbn,a	_kref+0x1e14
	.word	0x9286b117	! t0_kref+0x1dfc:   	addcc	%i2, -0xee9, %o1
	.word	0xbda01938	! t0_kref+0x1e00:   	fstod	%f24, %f30
	.word	0x92254000	! t0_kref+0x1e04:   	sub	%l5, %g0, %o1
	.word	0x949b272b	! t0_kref+0x1e08:   	xorcc	%o4, 0x72b, %o2
	.word	0x9860000d	! t0_kref+0x1e0c:   	subc	%g0, %o5, %o4
	.word	0x94b5f10c	! t0_kref+0x1e10:   	orncc	%l7, -0xef4, %o2
	.word	0x94e5800a	! t0_kref+0x1e14:   	subccc	%l6, %o2, %o2
	.word	0xa7a018d2	! t0_kref+0x1e18:   	fdtos	%f18, %f19
	.word	0xd4466000	! t0_kref+0x1e1c:   	ldsw	[%i1], %o2
	.word	0x98228017	! t0_kref+0x1e20:   	sub	%o2, %l7, %o4
	.word	0x9822400c	! t0_kref+0x1e24:   	sub	%o1, %o4, %o4
	.word	0xa5a54d37	! t0_kref+0x1e28:   	fsmuld	%f21, %f23, %f18
	.word	0xb9a709da	! t0_kref+0x1e2c:   	fdivd	%f28, %f26, %f28
	.word	0x8582a675	! t0_kref+0x1e30:   	wr	%o2, 0x675, %ccr
	.word	0xd64e2014	! t0_kref+0x1e34:   	ldsb	[%i0 + 0x14], %o3
	.word	0x81854000	! t0_kref+0x1e38:   	wr	%l5, %g0, %y
	.word	0xf1be188a	! t0_kref+0x1e3c:   	stda	%f24, [%i0 + %o2]0xc4
	.word	0x9483000b	! t0_kref+0x1e40:   	addcc	%o4, %o3, %o2
	.word	0x81ad8ab2	! t0_kref+0x1e44:   	fcmpes	%fcc0, %f22, %f18
	.word	0xd648a02b	! t0_kref+0x1e48:   	ldsb	[%g2 + 0x2b], %o3
	.word	0x81accab6	! t0_kref+0x1e4c:   	fcmpes	%fcc0, %f19, %f22
	.word	0x98bea9cf	! t0_kref+0x1e50:   	xnorcc	%i2, 0x9cf, %o4
	.word	0x98d827f3	! t0_kref+0x1e54:   	smulcc	%g0, 0x7f3, %o4
	.word	0xd616c018	! t0_kref+0x1e58:   	lduh	[%i3 + %i0], %o3
	.word	0xe91fbe78	! t0_kref+0x1e5c:   	ldd	[%fp - 0x188], %f20
	.word	0x99382009	! t0_kref+0x1e60:   	sra	%g0, 0x9, %o4
	.word	0xf420a03c	! t0_kref+0x1e64:   	st	%i2, [%g2 + 0x3c]
	.word	0x973de002	! t0_kref+0x1e68:   	sra	%l7, 0x2, %o3
	.word	0x81ae0a58	! t0_kref+0x1e6c:   	fcmpd	%fcc0, %f24, %f24
	.word	0x81ae8a54	! t0_kref+0x1e70:   	fcmpd	%fcc0, %f26, %f20
	.word	0xd02e8019	! t0_kref+0x1e74:   	stb	%o0, [%i2 + %i1]
	.word	0xada9c05a	! t0_kref+0x1e78:   	fmovdu	%fcc0, %f26, %f22
	.word	0x94403447	! t0_kref+0x1e7c:   	addc	%g0, -0xbb9, %o2
	.word	0xea2e001a	! t0_kref+0x1e80:   	stb	%l5, [%i0 + %i2]
	.word	0xb5a689d4	! t0_kref+0x1e84:   	fdivd	%f26, %f20, %f26
	.word	0xda2e4000	! t0_kref+0x1e88:   	stb	%o5, [%i1]
	.word	0xf93e3fe8	! t0_kref+0x1e8c:   	std	%f28, [%i0 - 0x18]
	.word	0x9fc00004	! t0_kref+0x1e90:   	call	%g0 + %g4
	.word	0xf900a038	! t0_kref+0x1e94:   	ld	[%g2 + 0x38], %f28
	.word	0xef20a010	! t0_kref+0x1e98:   	st	%f23, [%g2 + 0x10]
	.word	0xd626001c	! t0_kref+0x1e9c:   	st	%o3, [%i0 + %i4]
	.word	0xada00156	! t0_kref+0x1ea0:   	fabsd	%f22, %f22
	.word	0x9de3bfa0	! t0_kref+0x1ea4:   	save	%sp, -0x60, %sp
	.word	0xb6d6ebaf	! t0_kref+0x1ea8:   	umulcc	%i3, 0xbaf, %i3
	.word	0x93ef401a	! t0_kref+0x1eac:   	restore	%i5, %i2, %o1
	.word	0xd24e7ff4	! t0_kref+0x1eb0:   	ldsb	[%i1 - 0xc], %o1
	.word	0x96a37775	! t0_kref+0x1eb4:   	subcc	%o5, -0x88b, %o3
	.word	0xe9bf5019	! t0_kref+0x1eb8:   	stda	%f20, [%i5 + %i1]0x80
	.word	0xe7000019	! t0_kref+0x1ebc:   	ld	[%g0 + %i1], %f19
	.word	0x86102002	! t0_kref+0x1ec0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1ec4:   	bne,a	_kref+0x1ec4
	.word	0x86a0e001	! t0_kref+0x1ec8:   	subcc	%g3, 1, %g3
	.word	0xbba00537	! t0_kref+0x1ecc:   	fsqrts	%f23, %f29
	sethi	%hi(2f), %o7
	.word	0xe40be2e8	! t0_kref+0x1ed4:   	ldub	[%o7 + 0x2e8], %l2
	.word	0xa41ca00c	! t0_kref+0x1ed8:   	xor	%l2, 0xc, %l2
	.word	0xe42be2e8	! t0_kref+0x1edc:   	stb	%l2, [%o7 + 0x2e8]
	.word	0x81dbe2e8	! t0_kref+0x1ee0:   	flush	%o7 + 0x2e8
	.word	0x2f800001	! t0_kref+0x1ee4:   	fbu,a	_kref+0x1ee8
2:	.word	0x92a2e03c	! t0_kref+0x1ee8:   	subcc	%o3, 0x3c, %o1
	.word	0xd248a001	! t0_kref+0x1eec:   	ldsb	[%g2 + 1], %o1
	.word	0xd42e8018	! t0_kref+0x1ef0:   	stb	%o2, [%i2 + %i0]
	.word	0x98a28000	! t0_kref+0x1ef4:   	subcc	%o2, %g0, %o4
	.word	0xd440a038	! t0_kref+0x1ef8:   	ldsw	[%g2 + 0x38], %o2
	.word	0xbba6c939	! t0_kref+0x1efc:   	fmuls	%f27, %f25, %f29
	.word	0xb5a508da	! t0_kref+0x1f00:   	fsubd	%f20, %f26, %f26
	.word	0xe3062010	! t0_kref+0x1f04:   	ld	[%i0 + 0x10], %f17
	.word	0xa5a6895c	! t0_kref+0x1f08:   	fmuld	%f26, %f28, %f18
	.word	0x27800007	! t0_kref+0x1f0c:   	fbul,a	_kref+0x1f28
	.word	0x9725800d	! t0_kref+0x1f10:   	mulscc	%l6, %o5, %o3
	.word	0xea2e7fe9	! t0_kref+0x1f14:   	stb	%l5, [%i1 - 0x17]
	.word	0x982373e1	! t0_kref+0x1f18:   	sub	%o5, -0xc1f, %o4
	call	SYM(t0_subr3)
	.word	0xf99e7ff0	! t0_kref+0x1f20:   	ldda	[%i1 - 0x10]%asi, %f28
	.word	0xe51e6018	! t0_kref+0x1f24:   	ldd	[%i1 + 0x18], %f18
	.word	0x931821f3	! t0_kref+0x1f28:   	tsubcctv	%g0, 0x1f3, %o1
	.word	0x9642400b	! t0_kref+0x1f2c:   	addc	%o1, %o3, %o3
	.word	0xada6895e	! t0_kref+0x1f30:   	fmuld	%f26, %f30, %f22
	.word	0x94a37653	! t0_kref+0x1f34:   	subcc	%o5, -0x9ad, %o2
	.word	0x965aefbb	! t0_kref+0x1f38:   	smul	%o3, 0xfbb, %o3
	.word	0xf700a024	! t0_kref+0x1f3c:   	ld	[%g2 + 0x24], %f27
	.word	0xe1be2009	! t0_kref+0x1f40:   	stda	%f16, [%i0 + 9]%asi
	.word	0xf9be5855	! t0_kref+0x1f44:   	stda	%f28, [%i1 + %l5]0xc2
	.word	0xe51e3fe8	! t0_kref+0x1f48:   	ldd	[%i0 - 0x18], %f18
	.word	0x9fc00004	! t0_kref+0x1f4c:   	call	%g0 + %g4
	.word	0xe1180018	! t0_kref+0x1f50:   	ldd	[%g0 + %i0], %f16
	.word	0x932da016	! t0_kref+0x1f54:   	sll	%l6, 0x16, %o1
	.word	0x23480003	! t0_kref+0x1f58:   	fbne,a,pt	%fcc0, _kref+0x1f64
	.word	0xd648a024	! t0_kref+0x1f5c:   	ldsb	[%g2 + 0x24], %o3
	.word	0x85802930	! t0_kref+0x1f60:   	mov	0x930, %ccr
	.word	0x94e58015	! t0_kref+0x1f64:   	subccc	%l6, %l5, %o2
	.word	0x8143c000	! t0_kref+0x1f68:   	stbar
	.word	0x973dc00c	! t0_kref+0x1f6c:   	sra	%l7, %o4, %o3
	.word	0xd41e6018	! t0_kref+0x1f70:   	ldd	[%i1 + 0x18], %o2
	.word	0x92ad8016	! t0_kref+0x1f74:   	andncc	%l6, %l6, %o1
	.word	0xd44e2004	! t0_kref+0x1f78:   	ldsb	[%i0 + 4], %o2
	.word	0x96502c1e	! t0_kref+0x1f7c:   	umul	%g0, 0xc1e, %o3
	.word	0x96d33db7	! t0_kref+0x1f80:   	umulcc	%o4, -0x249, %o3
	.word	0xc02e8019	! t0_kref+0x1f84:   	clrb	[%i2 + %i1]
	.word	0x81580000	! t0_kref+0x1f88:   	flushw
	.word	0x81858000	! t0_kref+0x1f8c:   	wr	%l6, %g0, %y
	.word	0xda763ff0	! t0_kref+0x1f90:   	stx	%o5, [%i0 - 0x10]
	.word	0xd200a000	! t0_kref+0x1f94:   	ld	[%g2], %o1
	.word	0x9325800d	! t0_kref+0x1f98:   	mulscc	%l6, %o5, %o1
	.word	0xd01e7fe8	! t0_kref+0x1f9c:   	ldd	[%i1 - 0x18], %o0
	.word	0xaba0189e	! t0_kref+0x1fa0:   	fitos	%f30, %f21
	.word	0x98b2f0db	! t0_kref+0x1fa4:   	orncc	%o3, -0xf25, %o4
	.word	0xa3a00037	! t0_kref+0x1fa8:   	fmovs	%f23, %f17
	call	SYM(t0_subr2)
	.word	0xd83f4019	! t0_kref+0x1fb0:   	std	%o4, [%i5 + %i1]
	.word	0xe1be7fe6	! t0_kref+0x1fb4:   	stda	%f16, [%i1 - 0x1a]%asi
	.word	0x2e800007	! t0_kref+0x1fb8:   	bvs,a	_kref+0x1fd4
	.word	0xc7ee5016	! t0_kref+0x1fbc:   	prefetcha	%i1 + %l6, 3
	.word	0xe81e7fe0	! t0_kref+0x1fc0:   	ldd	[%i1 - 0x20], %l4
	.word	0x92d28015	! t0_kref+0x1fc4:   	umulcc	%o2, %l5, %o1
	.word	0xfd1e6018	! t0_kref+0x1fc8:   	ldd	[%i1 + 0x18], %f30
	.word	0x96e22e84	! t0_kref+0x1fcc:   	subccc	%o0, 0xe84, %o3
	.word	0x81d93f6a	! t0_kref+0x1fd0:   	flush	%g4 - 0x96
	.word	0x9416800b	! t0_kref+0x1fd4:   	or	%i2, %o3, %o2
	.word	0xa9a508da	! t0_kref+0x1fd8:   	fsubd	%f20, %f26, %f20
	.word	0x920d800d	! t0_kref+0x1fdc:   	and	%l6, %o5, %o1
	.word	0x98fdb625	! t0_kref+0x1fe0:   	sdivcc	%l6, -0x9db, %o4
	.word	0x981b315b	! t0_kref+0x1fe4:   	xor	%o4, -0xea5, %o4
	.word	0xb9a488d2	! t0_kref+0x1fe8:   	fsubd	%f18, %f18, %f28
	.word	0x9fc00004	! t0_kref+0x1fec:   	call	%g0 + %g4
	.word	0x9453000c	! t0_kref+0x1ff0:   	umul	%o4, %o4, %o2
	.word	0xd4300018	! t0_kref+0x1ff4:   	sth	%o2, [%g0 + %i0]
	.word	0xee2e0000	! t0_kref+0x1ff8:   	stb	%l7, [%i0]
	.word	0xc807bfe8	! t0_kref+0x1ffc:   	ld	[%fp - 0x18], %g4
	.word	0xada01912	! t0_kref+0x2000:   	fitod	%f18, %f22
	.word	0xe500a034	! t0_kref+0x2004:   	ld	[%g2 + 0x34], %f18
	.word	0x81adcabe	! t0_kref+0x2008:   	fcmpes	%fcc0, %f23, %f30
	.word	0x92deb020	! t0_kref+0x200c:   	smulcc	%i2, -0xfe0, %o1
	.word	0xb5a68958	! t0_kref+0x2010:   	fmuld	%f26, %f24, %f26
	.word	0x963a615c	! t0_kref+0x2014:   	xnor	%o1, 0x15c, %o3
	.word	0x973ae009	! t0_kref+0x2018:   	sra	%o3, 0x9, %o3
	.word	0x9835400a	! t0_kref+0x201c:   	orn	%l5, %o2, %o4
	.word	0x81ae4ab3	! t0_kref+0x2020:   	fcmpes	%fcc0, %f25, %f19
	.word	0x98f32105	! t0_kref+0x2024:   	udivcc	%o4, 0x105, %o4
	.word	0x952a400c	! t0_kref+0x2028:   	sll	%o1, %o4, %o2
	call	1f
	.empty
	.word	0x983a000a	! t0_kref+0x2030:   	xnor	%o0, %o2, %o4
	.word	0xc7ee5009	! t0_kref+0x2034:   	prefetcha	%i1 + %o1, 3
	.word	0xf436600e	! t0_kref+0x2038:   	sth	%i2, [%i1 + 0xe]
	.word	0xf207bfe0	! t0_kref+0x203c:   	ld	[%fp - 0x20], %i1
	.word	0xd620a00c	! t0_kref+0x2040:   	st	%o3, [%g2 + 0xc]
	.word	0xf1067fe8	! t0_kref+0x2044:   	ld	[%i1 - 0x18], %f24
	.word	0xa5a01a38	! t0_kref+0x2048:   	fstoi	%f24, %f18
1:	.word	0x9332c017	! t0_kref+0x204c:   	srl	%o3, %l7, %o1
	.word	0x98582f70	! t0_kref+0x2050:   	smul	%g0, 0xf70, %o4
	.word	0xa9a54934	! t0_kref+0x2054:   	fmuls	%f21, %f20, %f20
	.word	0x9662800a	! t0_kref+0x2058:   	subc	%o2, %o2, %o3
	.word	0xd850a012	! t0_kref+0x205c:   	ldsh	[%g2 + 0x12], %o4
	.word	0x981a4009	! t0_kref+0x2060:   	xor	%o1, %o1, %o4
	.word	0x9676800a	! t0_kref+0x2064:   	udiv	%i2, %o2, %o3
	.word	0x9885a3cd	! t0_kref+0x2068:   	addcc	%l6, 0x3cd, %o4
	.word	0xf9be1848	! t0_kref+0x206c:   	stda	%f28, [%i0 + %o0]0xc2
	.word	0x993a6008	! t0_kref+0x2070:   	sra	%o1, 0x8, %o4
	.word	0xe300a000	! t0_kref+0x2074:   	ld	[%g2], %f17
	.word	0x96dd6061	! t0_kref+0x2078:   	smulcc	%l5, 0x61, %o3
	.word	0x953ac008	! t0_kref+0x207c:   	sra	%o3, %o0, %o2
	.word	0xc36e000a	! t0_kref+0x2080:   	prefetch	%i0 + %o2, 1
	.word	0x92654009	! t0_kref+0x2084:   	subc	%l5, %o1, %o1
	.word	0xe66e4000	! t0_kref+0x2088:   	ldstub	[%i1], %l3
	.word	0xe7063fe0	! t0_kref+0x208c:   	ld	[%i0 - 0x20], %f19
	.word	0xd828a027	! t0_kref+0x2090:   	stb	%o4, [%g2 + 0x27]
	.word	0x9643400c	! t0_kref+0x2094:   	addc	%o5, %o4, %o3
	.word	0x99418000	! t0_kref+0x2098:   	mov	%fprs, %o4
	.word	0xd6ff1019	! t0_kref+0x209c:   	swapa	[%i4 + %i1]0x80, %o3
	.word	0x8143c000	! t0_kref+0x20a0:   	stbar
	.word	0xd850a00e	! t0_kref+0x20a4:   	ldsh	[%g2 + 0xe], %o4
	.word	0x81af8ab1	! t0_kref+0x20a8:   	fcmpes	%fcc0, %f30, %f17
	.word	0xf120a038	! t0_kref+0x20ac:   	st	%f24, [%g2 + 0x38]
	.word	0xc36e6008	! t0_kref+0x20b0:   	prefetch	%i1 + 8, 1
	.word	0xe5062010	! t0_kref+0x20b4:   	ld	[%i0 + 0x10], %f18
	.word	0xe9be5a5c	! t0_kref+0x20b8:   	stda	%f20, [%i1 + %i4]0xd2
	.word	0x96a2800c	! t0_kref+0x20bc:   	subcc	%o2, %o4, %o3
	.word	0xd3f6501a	! t0_kref+0x20c0:   	casxa	[%i1]0x80, %i2, %o1
	.word	0x92f32247	! t0_kref+0x20c4:   	udivcc	%o4, 0x247, %o1
	.word	0x94623cdd	! t0_kref+0x20c8:   	subc	%o0, -0x323, %o2
	.word	0x8143c000	! t0_kref+0x20cc:   	stbar
	.word	0xb1a01114	! t0_kref+0x20d0:   	fxtod	%f20, %f24
	.word	0xa5a688d6	! t0_kref+0x20d4:   	fsubd	%f26, %f22, %f18
	.word	0xbda01a3e	! t0_kref+0x20d8:   	fstoi	%f30, %f30
	.word	0x81580000	! t0_kref+0x20dc:   	flushw
	.word	0x3a800008	! t0_kref+0x20e0:   	bcc,a	_kref+0x2100
	.word	0xb9a489da	! t0_kref+0x20e4:   	fdivd	%f18, %f26, %f28
	.word	0x9425c016	! t0_kref+0x20e8:   	sub	%l7, %l6, %o2
	.word	0xd8380018	! t0_kref+0x20ec:   	std	%o4, [%g0 + %i0]
	.word	0x985b6b7d	! t0_kref+0x20f0:   	smul	%o5, 0xb7d, %o4
	.word	0x9435c00b	! t0_kref+0x20f4:   	orn	%l7, %o3, %o2
	.word	0x24480003	! t0_kref+0x20f8:   	ble,a,pt	%icc, _kref+0x2104
	.word	0xe5bf5018	! t0_kref+0x20fc:   	stda	%f18, [%i5 + %i0]0x80
	.word	0x81d83bb9	! t0_kref+0x2100:   	flush	%g0 - 0x447
	.word	0xd208a039	! t0_kref+0x2104:   	ldub	[%g2 + 0x39], %o1
	.word	0xd2280018	! t0_kref+0x2108:   	stb	%o1, [%g0 + %i0]
	.word	0x39480007	! t0_kref+0x210c:   	fbuge,a,pt	%fcc0, _kref+0x2128
	.word	0x92aa4015	! t0_kref+0x2110:   	andncc	%o1, %l5, %o1
	.word	0x92db314a	! t0_kref+0x2114:   	smulcc	%o4, -0xeb6, %o1
	.word	0xe91f4018	! t0_kref+0x2118:   	ldd	[%i5 + %i0], %f20
	.word	0x989b3404	! t0_kref+0x211c:   	xorcc	%o4, -0xbfc, %o4
	.word	0xd83e4000	! t0_kref+0x2120:   	std	%o4, [%i1]
	.word	0x953a6011	! t0_kref+0x2124:   	sra	%o1, 0x11, %o2
	.word	0xf100a00c	! t0_kref+0x2128:   	ld	[%g2 + 0xc], %f24
	.word	0x2a800007	! t0_kref+0x212c:   	bcs,a	_kref+0x2148
	.word	0x92a3637b	! t0_kref+0x2130:   	subcc	%o5, 0x37b, %o1
	.word	0xc0280018	! t0_kref+0x2134:   	clrb	[%g0 + %i0]
	.word	0x991a3601	! t0_kref+0x2138:   	tsubcctv	%o0, -0x9ff, %o4
	.word	0xd6c71018	! t0_kref+0x213c:   	ldswa	[%i4 + %i0]0x80, %o3
	.word	0xc0267ff8	! t0_kref+0x2140:   	clr	[%i1 - 8]
	.word	0x81ad0ab1	! t0_kref+0x2144:   	fcmpes	%fcc0, %f20, %f17
	.word	0x81ad0a54	! t0_kref+0x2148:   	fcmpd	%fcc0, %f20, %f20
	.word	0xf19e1a1b	! t0_kref+0x214c:   	ldda	[%i0 + %i3]0xd0, %f24
	.word	0xa9a0103d	! t0_kref+0x2150:   	fstox	%f29, %f20
	.word	0xd40e3fe1	! t0_kref+0x2154:   	ldub	[%i0 - 0x1f], %o2
	.word	0xd44e2009	! t0_kref+0x2158:   	ldsb	[%i0 + 9], %o2
	.word	0xd81e6000	! t0_kref+0x215c:   	ldd	[%i1], %o4
	.word	0x9455c00a	! t0_kref+0x2160:   	umul	%l7, %o2, %o2
	.word	0x2f800006	! t0_kref+0x2164:   	fbu,a	_kref+0x217c
	.word	0xd86e4000	! t0_kref+0x2168:   	ldstub	[%i1], %o4
	.word	0x94de800b	! t0_kref+0x216c:   	smulcc	%i2, %o3, %o2
	.word	0x81ac8a58	! t0_kref+0x2170:   	fcmpd	%fcc0, %f18, %f24
	.word	0x92e24016	! t0_kref+0x2174:   	subccc	%o1, %l6, %o1
	.word	0x31800008	! t0_kref+0x2178:   	fba,a	_kref+0x2198
	.word	0x96e5c00d	! t0_kref+0x217c:   	subccc	%l7, %o5, %o3
	.word	0xada01918	! t0_kref+0x2180:   	fitod	%f24, %f22
	.word	0x966568e9	! t0_kref+0x2184:   	subc	%l5, 0x8e9, %o3
	.word	0xe53e3ff0	! t0_kref+0x2188:   	std	%f18, [%i0 - 0x10]
	.word	0xea367fe6	! t0_kref+0x218c:   	sth	%l5, [%i1 - 0x1a]
	.word	0xede6100a	! t0_kref+0x2190:   	casa	[%i0]0x80, %o2, %l6
	.word	0xe91e4000	! t0_kref+0x2194:   	ldd	[%i1], %f20
	.word	0x3d800004	! t0_kref+0x2198:   	fbule,a	_kref+0x21a8
	.word	0x96fa800d	! t0_kref+0x219c:   	sdivcc	%o2, %o5, %o3
	.word	0x81d87154	! t0_kref+0x21a0:   	flush	%g1 - 0xeac
	.word	0x92ad800a	! t0_kref+0x21a4:   	andncc	%l6, %o2, %o1
	.word	0x81ad0a52	! t0_kref+0x21a8:   	fcmpd	%fcc0, %f20, %f18
	.word	0xc5ee1000	! t0_kref+0x21ac:   	prefetcha	%i0, 2
	.word	0xeaff1019	! t0_kref+0x21b0:   	swapa	[%i4 + %i1]0x80, %l5
	.word	0xf5ee101b	! t0_kref+0x21b4:   	prefetcha	%i0 + %i3, 26
	.word	0x33800002	! t0_kref+0x21b8:   	fbe,a	_kref+0x21c0
	.word	0x98600016	! t0_kref+0x21bc:   	subc	%g0, %l6, %o4
	.word	0x9880319e	! t0_kref+0x21c0:   	addcc	%g0, -0xe62, %o4
	.word	0xb1a00058	! t0_kref+0x21c4:   	fmovd	%f24, %f24
	.word	0x9412000a	! t0_kref+0x21c8:   	or	%o0, %o2, %o2
	.word	0x921a001a	! t0_kref+0x21cc:   	xor	%o0, %i2, %o1
	.word	0xd2480019	! t0_kref+0x21d0:   	ldsb	[%g0 + %i1], %o1
	.word	0xafa00538	! t0_kref+0x21d4:   	fsqrts	%f24, %f23
	.word	0x94534016	! t0_kref+0x21d8:   	umul	%o5, %l6, %o2
	.word	0xe93e4000	! t0_kref+0x21dc:   	std	%f20, [%i1]
	.word	0x9525e1b7	! t0_kref+0x21e0:   	mulscc	%l7, 0x1b7, %o2
	.word	0x9825ab3b	! t0_kref+0x21e4:   	sub	%l6, 0xb3b, %o4
	.word	0xee2e7fe7	! t0_kref+0x21e8:   	stb	%l7, [%i1 - 0x19]
	.word	0xd4d81018	! t0_kref+0x21ec:   	ldxa	[%g0 + %i0]0x80, %o2
	.word	0x9828001a	! t0_kref+0x21f0:   	andn	%g0, %i2, %o4
	.word	0x985a001a	! t0_kref+0x21f4:   	smul	%o0, %i2, %o4
	.word	0x945a400b	! t0_kref+0x21f8:   	smul	%o1, %o3, %o2
	.word	0xd83e0000	! t0_kref+0x21fc:   	std	%o4, [%i0]
	.word	0x96337a22	! t0_kref+0x2200:   	orn	%o5, -0x5de, %o3
	.word	0x96254017	! t0_kref+0x2204:   	sub	%l5, %l7, %o3
	.word	0x81820000	! t0_kref+0x2208:   	wr	%o0, %g0, %y
	.word	0xb9a68954	! t0_kref+0x220c:   	fmuld	%f26, %f20, %f28
	.word	0x94268008	! t0_kref+0x2210:   	sub	%i2, %o0, %o2
	.word	0x928d60ab	! t0_kref+0x2214:   	andcc	%l5, 0xab, %o1
	.word	0xf91e0000	! t0_kref+0x2218:   	ldd	[%i0], %f28
	.word	0x971a2dd2	! t0_kref+0x221c:   	tsubcctv	%o0, 0xdd2, %o3
	.word	0x971aff18	! t0_kref+0x2220:   	tsubcctv	%o3, -0xe8, %o3
	.word	0x92582923	! t0_kref+0x2224:   	smul	%g0, 0x923, %o1
	.word	0xada018d8	! t0_kref+0x2228:   	fdtos	%f24, %f22
	.word	0xada01936	! t0_kref+0x222c:   	fstod	%f22, %f22
	.word	0xb9a0193d	! t0_kref+0x2230:   	fstod	%f29, %f28
	.word	0xd228a012	! t0_kref+0x2234:   	stb	%o1, [%g2 + 0x12]
	.word	0xd640a028	! t0_kref+0x2238:   	ldsw	[%g2 + 0x28], %o3
	.word	0x96da4009	! t0_kref+0x223c:   	smulcc	%o1, %o1, %o3
	.word	0xa9a588d8	! t0_kref+0x2240:   	fsubd	%f22, %f24, %f20
	.word	0x94f57ff3	! t0_kref+0x2244:   	udivcc	%l5, -0xd, %o2
	.word	0x962d401a	! t0_kref+0x2248:   	andn	%l5, %i2, %o3
	.word	0x94533de6	! t0_kref+0x224c:   	umul	%o4, -0x21a, %o2
	.word	0x96fb3281	! t0_kref+0x2250:   	sdivcc	%o4, -0xd7f, %o3
	.word	0xada709d4	! t0_kref+0x2254:   	fdivd	%f28, %f20, %f22
	.word	0x81da0010	! t0_kref+0x2258:   	flush	%o0 + %l0
	.word	0xd01e401d	! t0_kref+0x225c:   	ldd	[%i1 + %i5], %o0
	.word	0xd248a004	! t0_kref+0x2260:   	ldsb	[%g2 + 4], %o1
	.word	0xb1a788d4	! t0_kref+0x2264:   	fsubd	%f30, %f20, %f24
	.word	0xd81e3fe8	! t0_kref+0x2268:   	ldd	[%i0 - 0x18], %o4
	.word	0x929eaffb	! t0_kref+0x226c:   	xorcc	%i2, 0xffb, %o1
	.word	0x92fdb3da	! t0_kref+0x2270:   	sdivcc	%l6, -0xc26, %o1
	.word	0xafa0053a	! t0_kref+0x2274:   	fsqrts	%f26, %f23
	.word	0x81de3da7	! t0_kref+0x2278:   	flush	%i0 - 0x259
	.word	0x81834000	! t0_kref+0x227c:   	wr	%o5, %g0, %y
	.word	0xd4367ff0	! t0_kref+0x2280:   	sth	%o2, [%i1 - 0x10]
	.word	0xd4080018	! t0_kref+0x2284:   	ldub	[%g0 + %i0], %o2
	.word	0x8143e040	! t0_kref+0x2288:   	membar	0x40
	.word	0x94e6800c	! t0_kref+0x228c:   	subccc	%i2, %o4, %o2
	.word	0x34800003	! t0_kref+0x2290:   	bg,a	_kref+0x229c
	.word	0xe51fbf68	! t0_kref+0x2294:   	ldd	[%fp - 0x98], %f18
	.word	0x965dc00c	! t0_kref+0x2298:   	smul	%l7, %o4, %o3
	.word	0xb9a0053a	! t0_kref+0x229c:   	fsqrts	%f26, %f28
	.word	0x26800001	! t0_kref+0x22a0:   	bl,a	_kref+0x22a4
	.word	0xb1a70958	! t0_kref+0x22a4:   	fmuld	%f28, %f24, %f24
	.word	0x81af0a3b	! t0_kref+0x22a8:   	fcmps	%fcc0, %f28, %f27
	.word	0xada709da	! t0_kref+0x22ac:   	fdivd	%f28, %f26, %f22
	.word	0xd41e3ff8	! t0_kref+0x22b0:   	ldd	[%i0 - 8], %o2
	.word	0xd808a002	! t0_kref+0x22b4:   	ldub	[%g2 + 2], %o4
	.word	0xd850a002	! t0_kref+0x22b8:   	ldsh	[%g2 + 2], %o4
	.word	0xa3a01a5a	! t0_kref+0x22bc:   	fdtoi	%f26, %f17
	.word	0x25480007	! t0_kref+0x22c0:   	fblg,a,pt	%fcc0, _kref+0x22dc
	.word	0xd62e3ffb	! t0_kref+0x22c4:   	stb	%o3, [%i0 - 5]
	.word	0xd248a016	! t0_kref+0x22c8:   	ldsb	[%g2 + 0x16], %o1
	.word	0x99224000	! t0_kref+0x22cc:   	mulscc	%o1, %g0, %o4
	.word	0x965b400a	! t0_kref+0x22d0:   	smul	%o5, %o2, %o3
	.word	0x8143c000	! t0_kref+0x22d4:   	stbar
	.word	0xb1a0015c	! t0_kref+0x22d8:   	fabsd	%f28, %f24
	.word	0xf56e7ff0	! t0_kref+0x22dc:   	prefetch	%i1 - 0x10, 26
	.word	0x8143c000	! t0_kref+0x22e0:   	stbar
	.word	0xb5a789d2	! t0_kref+0x22e4:   	fdivd	%f30, %f18, %f26
	.word	0x9462c009	! t0_kref+0x22e8:   	subc	%o3, %o1, %o2
	.word	0xada708d6	! t0_kref+0x22ec:   	fsubd	%f28, %f22, %f22
	.word	0x953a8000	! t0_kref+0x22f0:   	sra	%o2, %g0, %o2
	.word	0xada01939	! t0_kref+0x22f4:   	fstod	%f25, %f22
	.word	0xaba018dc	! t0_kref+0x22f8:   	fdtos	%f28, %f21
	.word	0x96fab00b	! t0_kref+0x22fc:   	sdivcc	%o2, -0xff5, %o3
	.word	0x940de9a1	! t0_kref+0x2300:   	and	%l7, 0x9a1, %o2
	.word	0x8143c000	! t0_kref+0x2304:   	stbar
	.word	0xd80e3fe1	! t0_kref+0x2308:   	ldub	[%i0 - 0x1f], %o4
	.word	0xf9be5840	! t0_kref+0x230c:   	stda	%f28, [%i1]0xc2
	.word	0xe1be1a1d	! t0_kref+0x2310:   	stda	%f16, [%i0 + %i5]0xd0
	.word	0x83414000	! t0_kref+0x2314:   	mov	%pc, %g1
	.word	0x152d604a	! t0_kref+0x2318:   	sethi	%hi(0xb5812800), %o2
	.word	0xd0180018	! t0_kref+0x231c:   	ldd	[%g0 + %i0], %o0
	.word	0x98a2c000	! t0_kref+0x2320:   	subcc	%o3, %g0, %o4
	.word	0xd01e6000	! t0_kref+0x2324:   	ldd	[%i1], %o0
	.word	0xd650a000	! t0_kref+0x2328:   	ldsh	[%g2], %o3
	.word	0xb1a708da	! t0_kref+0x232c:   	fsubd	%f28, %f26, %f24
	.word	0xb5a688d4	! t0_kref+0x2330:   	fsubd	%f26, %f20, %f26
	.word	0xd650a004	! t0_kref+0x2334:   	ldsh	[%g2 + 4], %o3
	.word	0x9645c00b	! t0_kref+0x2338:   	addc	%l7, %o3, %o3
	.word	0xd648a02b	! t0_kref+0x233c:   	ldsb	[%g2 + 0x2b], %o3
	.word	0x9215c009	! t0_kref+0x2340:   	or	%l7, %o1, %o1
	.word	0x96c373e2	! t0_kref+0x2344:   	addccc	%o5, -0xc1e, %o3
	.word	0xd25f4019	! t0_kref+0x2348:   	ldx	[%i5 + %i1], %o1
	.word	0x940a7d94	! t0_kref+0x234c:   	and	%o1, -0x26c, %o2
	.word	0x81dd8008	! t0_kref+0x2350:   	flush	%l6 + %o0
!	.word	0x2686572b	! t0_kref+0x2354:   	bl,a	SYM(t0_subr1)
	   	bl,a	SYM(t0_subr1)
	.word	0x9f414000	! t0_kref+0x2358:   	mov	%pc, %o7
	.word	0x98fa000a	! t0_kref+0x235c:   	sdivcc	%o0, %o2, %o4
	.word	0x98fb000c	! t0_kref+0x2360:   	sdivcc	%o4, %o4, %o4
	.word	0xbda018da	! t0_kref+0x2364:   	fdtos	%f26, %f30
	.word	0xda36201a	! t0_kref+0x2368:   	sth	%o5, [%i0 + 0x1a]
	.word	0x98a28016	! t0_kref+0x236c:   	subcc	%o2, %l6, %o4
	.word	0x98d22356	! t0_kref+0x2370:   	umulcc	%o0, 0x356, %o4
	.word	0xaba0053c	! t0_kref+0x2374:   	fsqrts	%f28, %f21
	.word	0xb1a01934	! t0_kref+0x2378:   	fstod	%f20, %f24
	.word	0xb5a0191d	! t0_kref+0x237c:   	fitod	%f29, %f26
	.word	0xe07e601c	! t0_kref+0x2380:   	swap	[%i1 + 0x1c], %l0
	.word	0x8182c000	! t0_kref+0x2384:   	wr	%o3, %g0, %y
	.word	0xd486101c	! t0_kref+0x2388:   	lda	[%i0 + %i4]0x80, %o2
	.word	0x9540c000	! t0_kref+0x238c:   	mov	%asi, %o2
	.word	0xb9a00532	! t0_kref+0x2390:   	fsqrts	%f18, %f28
	.word	0x81854000	! t0_kref+0x2394:   	wr	%l5, %g0, %y
	.word	0xa5a01a52	! t0_kref+0x2398:   	fdtoi	%f18, %f18
	.word	0x9305653a	! t0_kref+0x239c:   	taddcc	%l5, 0x53a, %o1
	.word	0xc0260000	! t0_kref+0x23a0:   	clr	[%i0]
	.word	0xe27e401c	! t0_kref+0x23a4:   	swap	[%i1 + %i4], %l1
	.word	0x878020e0	! t0_kref+0x23a8:   	mov	0xe0, %asi
	.word	0x9835c00d	! t0_kref+0x23ac:   	orn	%l7, %o5, %o4
	.word	0xd810a03e	! t0_kref+0x23b0:   	lduh	[%g2 + 0x3e], %o4
	.word	0x3c800005	! t0_kref+0x23b4:   	bpos,a	_kref+0x23c8
	.word	0x8143c000	! t0_kref+0x23b8:   	stbar
	.word	0xe9be5a1b	! t0_kref+0x23bc:   	stda	%f20, [%i1 + %i3]0xd0
	.word	0x961a752c	! t0_kref+0x23c0:   	xor	%o1, -0xad4, %o3
	.word	0xd0267fe8	! t0_kref+0x23c4:   	st	%o0, [%i1 - 0x18]
	.word	0xf9060000	! t0_kref+0x23c8:   	ld	[%i0], %f28
	.word	0xd64e7ffc	! t0_kref+0x23cc:   	ldsb	[%i1 - 4], %o3
	.word	0x1335df57	! t0_kref+0x23d0:   	sethi	%hi(0xd77d5c00), %o1
	.word	0xa1a40956	! t0_kref+0x23d4:   	fmuld	%f16, %f22, %f16
	.word	0xada01913	! t0_kref+0x23d8:   	fitod	%f19, %f22
	.word	0x96a2a652	! t0_kref+0x23dc:   	subcc	%o2, 0x652, %o3
	.word	0x9885800b	! t0_kref+0x23e0:   	addcc	%l6, %o3, %o4
	.word	0x9236a30b	! t0_kref+0x23e4:   	orn	%i2, 0x30b, %o1
	.word	0x8143e031	! t0_kref+0x23e8:   	membar	0x31
	.word	0xd850a026	! t0_kref+0x23ec:   	ldsh	[%g2 + 0x26], %o4
	.word	0xd220a014	! t0_kref+0x23f0:   	st	%o1, [%g2 + 0x14]
	.word	0xa9a9c054	! t0_kref+0x23f4:   	fmovdu	%fcc0, %f20, %f20
	sethi	%hi(2f), %o7
	.word	0xe40be038	! t0_kref+0x23fc:   	ldub	[%o7 + 0x38], %l2
	.word	0xa41ca00c	! t0_kref+0x2400:   	xor	%l2, 0xc, %l2
	.word	0xe42be038	! t0_kref+0x2404:   	stb	%l2, [%o7 + 0x38]
	.word	0x81dbe038	! t0_kref+0x2408:   	flush	%o7 + 0x38
	.word	0xd62e2019	! t0_kref+0x240c:   	stb	%o3, [%i0 + 0x19]
	.word	0xc030a020	! t0_kref+0x2410:   	clrh	[%g2 + 0x20]
	.word	0x8143c000	! t0_kref+0x2414:   	stbar
	.word	0x8143c000	! t0_kref+0x2418:   	stbar
	.word	0x992de018	! t0_kref+0x241c:   	sll	%l7, 0x18, %o4
	.word	0xec267fe8	! t0_kref+0x2420:   	st	%l6, [%i1 - 0x18]
	.word	0x9fc00004	! t0_kref+0x2424:   	call	%g0 + %g4
	.word	0x98254000	! t0_kref+0x2428:   	sub	%l5, %g0, %o4
	.word	0xf9801019	! t0_kref+0x242c:   	lda	[%g0 + %i1]0x80, %f28
	.word	0xfb6e6008	! t0_kref+0x2430:   	prefetch	%i1 + 8, 29
	.word	0x81af4abd	! t0_kref+0x2434:   	fcmpes	%fcc0, %f29, %f29
2:	.word	0xd240a004	! t0_kref+0x2438:   	ldsw	[%g2 + 4], %o1
	.word	0xe81e2010	! t0_kref+0x243c:   	ldd	[%i0 + 0x10], %l4
	.word	0x982d8016	! t0_kref+0x2440:   	andn	%l6, %l6, %o4
	.word	0x81ad0a3b	! t0_kref+0x2444:   	fcmps	%fcc0, %f20, %f27
	.word	0xada01a50	! t0_kref+0x2448:   	fdtoi	%f16, %f22
	.word	0x925a4017	! t0_kref+0x244c:   	smul	%o1, %l7, %o1
	.word	0x81ae8a33	! t0_kref+0x2450:   	fcmps	%fcc0, %f26, %f19
	.word	0x96a22c8d	! t0_kref+0x2454:   	subcc	%o0, 0xc8d, %o3
	.word	0x933dc00c	! t0_kref+0x2458:   	sra	%l7, %o4, %o1
	.word	0xb5a488d2	! t0_kref+0x245c:   	fsubd	%f18, %f18, %f26
	.word	0xa9a7493e	! t0_kref+0x2460:   	fmuls	%f29, %f30, %f20
	.word	0xf42e4000	! t0_kref+0x2464:   	stb	%i2, [%i1]
	.word	0x81ad8a56	! t0_kref+0x2468:   	fcmpd	%fcc0, %f22, %f22
	.word	0xd20e0000	! t0_kref+0x246c:   	ldub	[%i0], %o1
	.word	0x942ac01a	! t0_kref+0x2470:   	andn	%o3, %i2, %o2
	.word	0xd2f81019	! t0_kref+0x2474:   	swapa	[%g0 + %i1]0x80, %o1
	.word	0xea2e2006	! t0_kref+0x2478:   	stb	%l5, [%i0 + 6]
	.word	0xd820a03c	! t0_kref+0x247c:   	st	%o4, [%g2 + 0x3c]
	.word	0x9263000d	! t0_kref+0x2480:   	subc	%o4, %o5, %o1
	.word	0x989a2e83	! t0_kref+0x2484:   	xorcc	%o0, 0xe83, %o4
	.word	0x9722c000	! t0_kref+0x2488:   	mulscc	%o3, %g0, %o3
	.word	0x8143c000	! t0_kref+0x248c:   	stbar
	.word	0x96228017	! t0_kref+0x2490:   	sub	%o2, %l7, %o3
	.word	0x982029d8	! t0_kref+0x2494:   	sub	%g0, 0x9d8, %o4
	.word	0xe66e401a	! t0_kref+0x2498:   	ldstub	[%i1 + %i2], %l3
	.word	0x8143c000	! t0_kref+0x249c:   	stbar
	.word	0xd610a028	! t0_kref+0x24a0:   	lduh	[%g2 + 0x28], %o3
	.word	0x8182c000	! t0_kref+0x24a4:   	wr	%o3, %g0, %y
	.word	0x94354016	! t0_kref+0x24a8:   	orn	%l5, %l6, %o2
	.word	0x81ae0ab4	! t0_kref+0x24ac:   	fcmpes	%fcc0, %f24, %f20
	.word	0xb1a4cd3d	! t0_kref+0x24b0:   	fsmuld	%f19, %f29, %f24
	.word	0xe9be584a	! t0_kref+0x24b4:   	stda	%f20, [%i1 + %o2]0xc2
	.word	0x98da6f03	! t0_kref+0x24b8:   	smulcc	%o1, 0xf03, %o4
	.word	0x86102002	! t0_kref+0x24bc:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x24c0:   	bne,a	_kref+0x24c0
	.word	0x86a0e001	! t0_kref+0x24c4:   	subcc	%g3, 1, %g3
	.word	0xada01a50	! t0_kref+0x24c8:   	fdtoi	%f16, %f22
	.word	0x81ac4abd	! t0_kref+0x24cc:   	fcmpes	%fcc0, %f17, %f29
	.word	0x9336a007	! t0_kref+0x24d0:   	srl	%i2, 0x7, %o1
	.word	0xef00a004	! t0_kref+0x24d4:   	ld	[%g2 + 4], %f23
	.word	0xd84e3fe5	! t0_kref+0x24d8:   	ldsb	[%i0 - 0x1b], %o4
	.word	0x98deacf5	! t0_kref+0x24dc:   	smulcc	%i2, 0xcf5, %o4
	.word	0x92f5c00b	! t0_kref+0x24e0:   	udivcc	%l7, %o3, %o1
	.word	0x928ac00b	! t0_kref+0x24e4:   	andcc	%o3, %o3, %o1
	.word	0xb7a018d0	! t0_kref+0x24e8:   	fdtos	%f16, %f27
	.word	0xd826001c	! t0_kref+0x24ec:   	st	%o4, [%i0 + %i4]
	.word	0xeb070019	! t0_kref+0x24f0:   	ld	[%i4 + %i1], %f21
	.word	0x9de3bfa0	! t0_kref+0x24f4:   	save	%sp, -0x60, %sp
	.word	0x93e8001d	! t0_kref+0x24f8:   	restore	%g0, %i5, %o1
	.word	0xb9a018dc	! t0_kref+0x24fc:   	fdtos	%f28, %f28
	.word	0x968dac27	! t0_kref+0x2500:   	andcc	%l6, 0xc27, %o3
	.word	0xf11e2010	! t0_kref+0x2504:   	ldd	[%i0 + 0x10], %f24
	.word	0x81af0a5c	! t0_kref+0x2508:   	fcmpd	%fcc0, %f28, %f28
	.word	0x92e30017	! t0_kref+0x250c:   	subccc	%o4, %l7, %o1
	.word	0xe56e3ff0	! t0_kref+0x2510:   	prefetch	%i0 - 0x10, 18
	.word	0xd84e6006	! t0_kref+0x2514:   	ldsb	[%i1 + 6], %o4
	.word	0x9630000a	! t0_kref+0x2518:   	orn	%g0, %o2, %o3
	.word	0x945e800d	! t0_kref+0x251c:   	smul	%i2, %o5, %o2
	.word	0xe4086224	! t0_kref+0x2520:   	ldub	[%g1 + 0x224], %l2
	.word	0xa41ca00c	! t0_kref+0x2524:   	xor	%l2, 0xc, %l2
	.word	0xe4286224	! t0_kref+0x2528:   	stb	%l2, [%g1 + 0x224]
	.word	0x81d86224	! t0_kref+0x252c:   	flush	%g1 + 0x224
	.word	0xfb06200c	! t0_kref+0x2530:   	ld	[%i0 + 0xc], %f29
	.word	0x993b6011	! t0_kref+0x2534:   	sra	%o5, 0x11, %o4
2:	.word	0x920dc01a	! t0_kref+0x2538:   	and	%l7, %i2, %o1
	.word	0xd4060000	! t0_kref+0x253c:   	ld	[%i0], %o2
	.word	0xf4264000	! t0_kref+0x2540:   	st	%i2, [%i1]
	.word	0xd01e0000	! t0_kref+0x2544:   	ldd	[%i0], %o0
	.word	0xaba018d6	! t0_kref+0x2548:   	fdtos	%f22, %f21
	.word	0xda20a004	! t0_kref+0x254c:   	st	%o5, [%g2 + 4]
	.word	0xea200019	! t0_kref+0x2550:   	st	%l5, [%g0 + %i1]
	.word	0x81ae0a56	! t0_kref+0x2554:   	fcmpd	%fcc0, %f24, %f22
	.word	0xf91e3fe8	! t0_kref+0x2558:   	ldd	[%i0 - 0x18], %f28
	.word	0xb9a6895a	! t0_kref+0x255c:   	fmuld	%f26, %f26, %f28
	.word	0x94757637	! t0_kref+0x2560:   	udiv	%l5, -0x9c9, %o2
	.word	0x94336abc	! t0_kref+0x2564:   	orn	%o5, 0xabc, %o2
	.word	0x9252c017	! t0_kref+0x2568:   	umul	%o3, %l7, %o1
	.word	0xada01a37	! t0_kref+0x256c:   	fstoi	%f23, %f22
	.word	0x9760000b	! t0_kref+0x2570:   	movn	%fcc0, %o3, %o3
	.word	0x965a797a	! t0_kref+0x2574:   	smul	%o1, -0x686, %o3
	.word	0x93280017	! t0_kref+0x2578:   	sll	%g0, %l7, %o1
	.word	0xa5a40954	! t0_kref+0x257c:   	fmuld	%f16, %f20, %f18
	.word	0x8143c000	! t0_kref+0x2580:   	stbar
	.word	0x9636aad9	! t0_kref+0x2584:   	orn	%i2, 0xad9, %o3
	.word	0x96128017	! t0_kref+0x2588:   	or	%o2, %l7, %o3
	.word	0xb7a018d8	! t0_kref+0x258c:   	fdtos	%f24, %f27
	.word	0x932e800d	! t0_kref+0x2590:   	sll	%i2, %o5, %o1
	.word	0x23800003	! t0_kref+0x2594:   	fbne,a	_kref+0x25a0
	.word	0xec28a010	! t0_kref+0x2598:   	stb	%l6, [%g2 + 0x10]
	.word	0x93408000	! t0_kref+0x259c:   	mov	%ccr, %o1
	.word	0x93408000	! t0_kref+0x25a0:   	mov	%ccr, %o1
	.word	0x92630016	! t0_kref+0x25a4:   	subc	%o4, %l6, %o1
	.word	0x9de3bfa0	! t0_kref+0x25a8:   	save	%sp, -0x60, %sp
	.word	0x99e83528	! t0_kref+0x25ac:   	restore	%g0, -0xad8, %o4
	.word	0xa7a0053c	! t0_kref+0x25b0:   	fsqrts	%f28, %f19
	.word	0xc76e400c	! t0_kref+0x25b4:   	prefetch	%i1 + %o4, 3
	.word	0x985ea733	! t0_kref+0x25b8:   	smul	%i2, 0x733, %o4
	.word	0xe078a020	! t0_kref+0x25bc:   	swap	[%g2 + 0x20], %l0
	.word	0x94db7011	! t0_kref+0x25c0:   	smulcc	%o5, -0xfef, %o2
	.word	0xa1a508da	! t0_kref+0x25c4:   	fsubd	%f20, %f26, %f16
	.word	0xe5b81019	! t0_kref+0x25c8:   	stda	%f18, [%g0 + %i1]0x80
	.word	0x8143c000	! t0_kref+0x25cc:   	stbar
	.word	0x81ac8a52	! t0_kref+0x25d0:   	fcmpd	%fcc0, %f18, %f18
	.word	0x96b2e462	! t0_kref+0x25d4:   	orncc	%o3, 0x462, %o3
	.word	0xed060000	! t0_kref+0x25d8:   	ld	[%i0], %f22
	.word	0xb1a00539	! t0_kref+0x25dc:   	fsqrts	%f25, %f24
	.word	0x95227969	! t0_kref+0x25e0:   	mulscc	%o1, -0x697, %o2
	.word	0xd448a019	! t0_kref+0x25e4:   	ldsb	[%g2 + 0x19], %o2
	.word	0x960aa8e1	! t0_kref+0x25e8:   	and	%o2, 0x8e1, %o3
	.word	0xb7a00538	! t0_kref+0x25ec:   	fsqrts	%f24, %f27
	.word	0xe51fbc60	! t0_kref+0x25f0:   	ldd	[%fp - 0x3a0], %f18
	.word	0xd8f65000	! t0_kref+0x25f4:   	stxa	%o4, [%i1]0x80
	.word	0x2a800001	! t0_kref+0x25f8:   	bcs,a	_kref+0x25fc
	.word	0xd2467ff8	! t0_kref+0x25fc:   	ldsw	[%i1 - 8], %o1
	.word	0x9740c000	! t0_kref+0x2600:   	mov	%asi, %o3
	.word	0x988ac00b	! t0_kref+0x2604:   	andcc	%o3, %o3, %o4
	.word	0xb5a50d32	! t0_kref+0x2608:   	fsmuld	%f20, %f18, %f26
	.word	0xf11e001d	! t0_kref+0x260c:   	ldd	[%i0 + %i5], %f24
	.word	0x96f5739c	! t0_kref+0x2610:   	udivcc	%l5, -0xc64, %o3
	.word	0x81868000	! t0_kref+0x2614:   	wr	%i2, %g0, %y
	.word	0x9538201c	! t0_kref+0x2618:   	sra	%g0, 0x1c, %o2
	.word	0x982a400a	! t0_kref+0x261c:   	andn	%o1, %o2, %o4
	.word	0xfd6e3ff0	! t0_kref+0x2620:   	prefetch	%i0 - 0x10, 30
	.word	0xe500a020	! t0_kref+0x2624:   	ld	[%g2 + 0x20], %f18
	.word	0xd810a02c	! t0_kref+0x2628:   	lduh	[%g2 + 0x2c], %o4
	.word	0x2d800002	! t0_kref+0x262c:   	fbg,a	_kref+0x2634
	.word	0xdbf6100b	! t0_kref+0x2630:   	casxa	[%i0]0x80, %o3, %o5
	.word	0xb7a01899	! t0_kref+0x2634:   	fitos	%f25, %f27
	.word	0x31800007	! t0_kref+0x2638:   	fba,a	_kref+0x2654
	.word	0x968db2c7	! t0_kref+0x263c:   	andcc	%l6, -0xd39, %o3
	.word	0x94580000	! t0_kref+0x2640:   	smul	%g0, %g0, %o2
	.word	0xbda01a31	! t0_kref+0x2644:   	fstoi	%f17, %f30
	.word	0x28800008	! t0_kref+0x2648:   	bleu,a	_kref+0x2668
	.word	0xa3a0053e	! t0_kref+0x264c:   	fsqrts	%f30, %f17
	.word	0x98da000c	! t0_kref+0x2650:   	smulcc	%o0, %o4, %o4
	.word	0x98902576	! t0_kref+0x2654:   	orcc	%g0, 0x576, %o4
	.word	0xa5a01933	! t0_kref+0x2658:   	fstod	%f19, %f18
	.word	0xd8066018	! t0_kref+0x265c:   	ld	[%i1 + 0x18], %o4
	.word	0x81ac0a58	! t0_kref+0x2660:   	fcmpd	%fcc0, %f16, %f24
	.word	0xb5a00037	! t0_kref+0x2664:   	fmovs	%f23, %f26
	.word	0x001fffff	! t0_kref+0x2668:   	illtrap	0x1fffff
	.word	0x96330017	! t0_kref+0x266c:   	orn	%o4, %l7, %o3
	.word	0xd630a000	! t0_kref+0x2670:   	sth	%o3, [%g2]
	.word	0x96f6800a	! t0_kref+0x2674:   	udivcc	%i2, %o2, %o3
	.word	0xa3a01a56	! t0_kref+0x2678:   	fdtoi	%f22, %f17
	.word	0xea30a032	! t0_kref+0x267c:   	sth	%l5, [%g2 + 0x32]
	.word	0x965b31fd	! t0_kref+0x2680:   	smul	%o4, -0xe03, %o3
	.word	0xbda01038	! t0_kref+0x2684:   	fstox	%f24, %f30
	.word	0x2e800002	! t0_kref+0x2688:   	bvs,a	_kref+0x2690
	.word	0xd808a009	! t0_kref+0x268c:   	ldub	[%g2 + 9], %o4
	.word	0xf16e401c	! t0_kref+0x2690:   	prefetch	%i1 + %i4, 24
	.word	0xd240a000	! t0_kref+0x2694:   	ldsw	[%g2], %o1
	.word	0x96db3d99	! t0_kref+0x2698:   	smulcc	%o4, -0x267, %o3
	.word	0xe40863ac	! t0_kref+0x269c:   	ldub	[%g1 + 0x3ac], %l2
	.word	0xa41ca00c	! t0_kref+0x26a0:   	xor	%l2, 0xc, %l2
	.word	0xe42863ac	! t0_kref+0x26a4:   	stb	%l2, [%g1 + 0x3ac]
	.word	0x81d863ac	! t0_kref+0x26a8:   	flush	%g1 + 0x3ac
	.word	0xd60e0000	! t0_kref+0x26ac:   	ldub	[%i0], %o3
	.word	0x9640287a	! t0_kref+0x26b0:   	addc	%g0, 0x87a, %o3
	.word	0x96da611b	! t0_kref+0x26b4:   	smulcc	%o1, 0x11b, %o3
	.word	0x9665a106	! t0_kref+0x26b8:   	subc	%l6, 0x106, %o3
	.word	0x993da01f	! t0_kref+0x26bc:   	sra	%l6, 0x1f, %o4
2:	.word	0x949dc008	! t0_kref+0x26c0:   	xorcc	%l7, %o0, %o2
	.word	0xf9be5855	! t0_kref+0x26c4:   	stda	%f28, [%i1 + %l5]0xc2
	.word	0x9465a5a0	! t0_kref+0x26c8:   	subc	%l6, 0x5a0, %o2
	.word	0xf11fbcf0	! t0_kref+0x26cc:   	ldd	[%fp - 0x310], %f24
	.word	0xd6462000	! t0_kref+0x26d0:   	ldsw	[%i0], %o3
	.word	0x92d6a6a3	! t0_kref+0x26d4:   	umulcc	%i2, 0x6a3, %o1
	.word	0xc807bfec	! t0_kref+0x26d8:   	ld	[%fp - 0x14], %g4
	.word	0xda36600e	! t0_kref+0x26dc:   	sth	%o5, [%i1 + 0xe]
	.word	0xa5a0015a	! t0_kref+0x26e0:   	fabsd	%f26, %f18
	.word	0x86102003	! t0_kref+0x26e4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x26e8:   	bne,a	_kref+0x26e8
	.word	0x86a0e001	! t0_kref+0x26ec:   	subcc	%g3, 1, %g3
	.word	0xd83e4000	! t0_kref+0x26f0:   	std	%o4, [%i1]
	.word	0x99202e5e	! t0_kref+0x26f4:   	mulscc	%g0, 0xe5e, %o4
	.word	0xd810a016	! t0_kref+0x26f8:   	lduh	[%g2 + 0x16], %o4
	.word	0xd24e3ff8	! t0_kref+0x26fc:   	ldsb	[%i0 - 8], %o1
	.word	0x968a38f7	! t0_kref+0x2700:   	andcc	%o0, -0x709, %o3
	.word	0x81ae0ab7	! t0_kref+0x2704:   	fcmpes	%fcc0, %f24, %f23
	.word	0xa5a70958	! t0_kref+0x2708:   	fmuld	%f28, %f24, %f18
	.word	0x9fc00004	! t0_kref+0x270c:   	call	%g0 + %g4
	.word	0x81db391d	! t0_kref+0x2710:   	flush	%o4 - 0x6e3
	.word	0x92358015	! t0_kref+0x2714:   	orn	%l6, %l5, %o1
	.word	0xd840a000	! t0_kref+0x2718:   	ldsw	[%g2], %o4
	.word	0xc020a004	! t0_kref+0x271c:   	clr	[%g2 + 4]
	.word	0x92ad4015	! t0_kref+0x2720:   	andncc	%l5, %l5, %o1
	.word	0x927a4000	! t0_kref+0x2724:   	sdiv	%o1, %g0, %o1
	.word	0x98b6800b	! t0_kref+0x2728:   	orncc	%i2, %o3, %o4
	.word	0xb1a01931	! t0_kref+0x272c:   	fstod	%f17, %f24
	.word	0xe9801019	! t0_kref+0x2730:   	lda	[%g0 + %i1]0x80, %f20
	.word	0x94228000	! t0_kref+0x2734:   	sub	%o2, %g0, %o2
	.word	0xe500a01c	! t0_kref+0x2738:   	ld	[%g2 + 0x1c], %f18
	.word	0xbba5c9b6	! t0_kref+0x273c:   	fdivs	%f23, %f22, %f29
	.word	0xa7a00531	! t0_kref+0x2740:   	fsqrts	%f17, %f19
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x2748:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x7a2e0000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x7a7c0000)
.seg "text"
t0_subr1_page_begin:
	.skip 8192
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x7a66c000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x24306000)
.seg "text"
t0_subr3_page_begin:
	.skip 8180
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
!  Total operations: 2419  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.57   2.15
!  ldub              1.33   1.20
!  ldsh              0.34   0.29
!  lduh              0.21   0.12
!  ld                0.41   0.41
!  ldd               1.00   1.28
!  swap              0.25   0.17
!  ldstub            0.39   0.74
!  stb               1.16   1.78
!  sth               1.01   1.20
!  st                1.27   1.32
!  std               1.08   0.74
!  add               0.10   0.12
!  addcc             1.24   1.07
!  addx              1.12   1.03
!  addxcc            0.51   0.45
!  taddcc            0.18   0.12
!  taddcctv          0.02   0.00
!  sub               1.60   2.15
!  subcc             1.25   1.74
!  subx              0.97   1.24
!  subxcc            1.27   1.61
!  tsubcc            0.17   0.12
!  tsubcctv          0.30   0.50
!  mulscc            1.44   1.36
!  and               0.88   0.79
!  andcc             1.36   1.57
!  andn              0.63   0.74
!  andncc            0.69   0.79
!  or                0.98   1.28
!  orcc              0.13   0.21
!  orn               1.00   0.95
!  orncc             0.42   0.45
!  xor               1.12   1.07
!  xorcc             1.05   1.03
!  xnor              0.54   0.41
!  xnorcc            0.25   0.25
!  sll               0.94   0.66
!  srl               1.10   1.07
!  sra               1.16   1.49
!  unimp             0.19   0.33
!  umul              0.97   1.28
!  smul              1.47   1.82
!  udiv              0.68   0.58
!  sdiv              0.16   0.29
!  umulcc            0.45   0.66
!  smulcc            1.57   1.86
!  udivcc            1.48   1.41
!  sdivcc            1.25   1.69
!  rdy               0.13   0.08
!  wry               1.52   1.53
!  bicc              3.21   2.89
!  sethi             0.62   0.62
!  jmpl              1.54   1.20
!  call              0.89   0.74
!  ticc              0.00   0.00
!  flush             1.06   1.24
!  save              0.41   0.29
!  restore           0.50   0.00
!  stbar             1.56   1.86
!  ldf               1.04   1.16
!  lddf              1.56   1.65
!  stf               0.18   0.12
!  stdf              1.12   0.79
!  fadds             0.31   0.12
!  fsubs             0.14   0.04
!  fmuls             0.31   0.41
!  fdivs             0.20   0.17
!  faddd             0.30   0.17
!  fsubd             1.60   1.69
!  fmuld             1.25   1.20
!  fdivd             1.23   0.91
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.61   0.54
!  fdmulq            0.00   0.00
!  fitos             0.32   0.33
!  fitod             1.15   1.16
!  fitoq             0.00   0.00
!  fstoi             1.29   1.36
!  fstod             0.71   0.66
!  fstoq             0.00   0.00
!  fdtoi             1.25   1.45
!  fdtos             1.16   1.57
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.58   0.50
!  fnegs             0.01   0.04
!  fabss             0.35   0.29
!  fsqrts            1.02   1.20
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.58   0.29
!  fcmpd             1.54   1.20
!  fcmpq             0.00   0.00
!  fcmpes            0.98   1.03
!  fcmped            0.08   0.00
!  fcmpeq            0.00   0.00
!  fbfcc             2.71   2.15
!  ldfsr             0.13   0.00
!  stfsr             0.12   0.04
!  loop              0.64   0.70
!  offset            0.09   0.00
!  area              0.09   0.08
!  target            0.23   0.29
!  goto              0.03   0.12
!  sigsegv           0.15   0.17
!  sigbus            0.00   0.00
!  imodify           0.93   0.50
!  ldfsr_offset      0.31   0.00
!  fpattern          0.50   0.33
!  lbranch           0.18   0.33
!  shmld             6.16   5.75
!  shmst             2.14   2.40
!  shmpf             0.06   0.00
!  shmswap           0.31   0.33
!  shmblkld          0.71   0.00
!  shmblkst          0.01   0.00
!  shmblkchk         0.08   0.12
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
!  casa              0.29   0.45
!  rdasi             0.30   0.29
!  wrasi             0.21   0.08
!  bpcc              0.14   0.17
!  fbpfcc            0.51   0.50
!  fmovscc           0.05   0.04
!  fmovdcc           0.31   0.29
!  fmovqcc           0.00   0.00
!  movcc             0.18   0.12
!  flushw            0.14   0.17
!  membar            0.32   0.17
!  prefetch          0.89   1.16
!  rdpc              0.22   0.25
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.20   0.25
!  lddfa             0.11   0.04
!  ldqfa             0.00   0.00
!  ldsba             0.02   0.00
!  ldsha             0.17   0.00
!  lduba             0.09   0.04
!  lduha             0.01   0.00
!  lda               0.30   0.33
!  ldda              0.00   0.00
!  ldstuba           0.04   0.00
!  prefetcha         0.60   0.54
!  stfa              0.32   0.12
!  stdfa             0.30   0.33
!  stqfa             0.00   0.00
!  stba              0.06   0.12
!  stha              0.09   0.17
!  sta               0.22   0.25
!  stda              0.12   0.12
!  swapa             0.24   0.29
!  fmovd             0.26   0.21
!  fnegd             0.14   0.00
!  fabsd             0.25   0.29
!  fstox             0.30   0.21
!  fdtox             0.05   0.00
!  fxtos             0.02   0.00
!  fxtod             0.13   0.21
!  lds               0.23   0.33
!  ldsa              0.21   0.04
!  ldx               0.13   0.17
!  ldxa              0.26   0.12
!  nofault           0.09   0.00
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
!  partial_st8       0.09   0.12
!  partial_st16      0.17   0.29
!  partial_st32      0.17   0.12
!  short_st8         0.31   0.37
!  short_st16        0.05   0.08
!  short_ld8         0.21   0.37
!  short_ld16        0.00   0.00
!  blkld             0.11   0.00
!  blkst             0.05   0.00
!  blkld_offset      0.22   0.00
!  blkst_offset      0.23   0.00
!  blk_check         0.03   0.00
!  casxa             0.18   0.21
!  rdccr             0.27   0.33
!  rdfprs            0.25   0.25
!  wrccr             0.32   0.29
!  popc              0.04   0.00
!  wrfprs            0.02   0.00
!  stx               0.08   0.12
!  stxa              0.13   0.12
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
KDATA_MODULE(t0_module_offset_table, 0x1ed64000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xffffffe0
	.word	0x00000008
	.word	0x00000000
	.word	0x00000018
	.word	0xfffffff8
	.word	0x00000010
	.word	0xffffffe8
	.word	0xfffffff0
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

KDATA_MODULE(t0_module_data_in_regs, 0x7852e000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x79ca36b4          ! %f0
	.word	0x3349f7ec          ! %f1
	.word	0xa2881303          ! %f2
	.word	0xace59fa1          ! %f3
	.word	0x351a1829          ! %f4
	.word	0xb2df7e11          ! %f5
	.word	0x264f8203          ! %f6
	.word	0xd030ebcf          ! %f7
	.word	0xc0c6f996          ! %f8
	.word	0xcb0ca238          ! %f9
	.word	0x3543ef28          ! %f10
	.word	0x0f75848b          ! %f11
	.word	0xa5b1996a          ! %f12
	.word	0x41bdf73f          ! %f13
	.word	0x243152a2          ! %f14
	.word	0x7fd7f055          ! %f15
	.word	0x8dde3aeb          ! %f16
	.word	0x635b1cc2          ! %f17
	.word	0xb7fd7f06          ! %f18
	.word	0x33ec2a27          ! %f19
	.word	0xb18b7559          ! %f20
	.word	0x20c74968          ! %f21
	.word	0xc59a7f09          ! %f22
	.word	0x7ed5a5ea          ! %f23
	.word	0xe2c45152          ! %f24
	.word	0x132fa67a          ! %f25
	.word	0xfb9a8b8b          ! %f26
	.word	0xfafea82b          ! %f27
	.word	0x142c5878          ! %f28
	.word	0xda2b50b5          ! %f29
	.word	0x51feddd7          ! %f30
	.word	0xc4c0e50e          ! %f31
	.word	0xf28a7b50          ! %f32
	.word	0xec9a1260          ! %f33
	.word	0xf6aae229          ! %f34
	.word	0xb0849a82          ! %f35
	.word	0x2181f16d          ! %f36
	.word	0x65ec2a9f          ! %f37
	.word	0xcb798e6f          ! %f38
	.word	0x1a7a99b6          ! %f39
	.word	0x213677cd          ! %f40
	.word	0x994eb609          ! %f41
	.word	0xb68ae154          ! %f42
	.word	0x4768f3cb          ! %f43
	.word	0xb68b9182          ! %f44
	.word	0x17dd8c78          ! %f45
	.word	0x6a3bcd79          ! %f46
	.word	0x21493dca          ! %f47
	.word	0xa884ae94          ! %f48
	.word	0x47b4a821          ! %f49
	.word	0xb89b1505          ! %f50
	.word	0x92f29fd7          ! %f51
	.word	0xad465d25          ! %f52
	.word	0xe4c869e3          ! %f53
	.word	0x9251d95f          ! %f54
	.word	0x82f923a6          ! %f55
	.word	0xc696e8d6          ! %f56
	.word	0x9b0d4ee3          ! %f57
	.word	0x131ee33a          ! %f58
	.word	0xc28ef62e          ! %f59
	.word	0x02bf0c69          ! %f60
	.word	0x00eceb58          ! %f61
	.word	0x526fe6d1          ! %f62
	.word	0x78cb909d          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x2c        ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xd90f991b          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x2969b680          ! %o0
	.word	0xfc8e6845          ! %o1
	.word	0x7096a437          ! %o2
	.word	0xf750795c          ! %o3
	.word	0xbc2c4b4f          ! %o4
	.word	0x8ee77b60          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x719199a7          ! %l0
	.word	0x4a8f3ea3          ! %l1
	.word	0x75944873          ! %l2
	.word	0x2087fc8b          ! %l3
	.word	0x186b3b84          ! %l4
	.word	0x275cb4a2          ! %l5
	.word	0xdeb92542          ! %l6
	.word	0x063ea771          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffffa          ! %i2 (byte offset)
	.word	0x00000016          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0xffffffe0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x26b2d368          ! %y
	.word	0x0000000d          ! %icc (nzvc)
	.word	0x40000783          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x6beb4000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x329f391e
	.word	0xcaa65241
	.word	0x7723a69d
	.word	0x924e8dab
	.word	0xd12e05e4
	.word	0x3adb3777
	.word	0xa23afc80
	.word	0x22c042c2
	.word	0x644e2faa
	.word	0xe33bff38
	.word	0xe49a37d1
	.word	0x3237b099
	.word	0x42d33266
	.word	0x99cd20da
	.word	0xdc8a495e
	.word	0x2ca0a1b7
	.word	0x6caf6737
	.word	0x1b1780ea
	.word	0x42585f8f
	.word	0x4fd3ca66
	.word	0x92726792
	.word	0x5409664d
	.word	0xae8c9ebb
	.word	0xffeebc72
	.word	0xb46defc1
	.word	0xa30f1da8
	.word	0xcc638ab6
	.word	0x0650d330
	.word	0x3c21f48e
	.word	0xe087ef01
	.word	0xb37bf5ae
	.word	0x08ac5bc1
	.word	0x2f67e03b
	.word	0xc9e249a6
	.word	0x00748837
	.word	0x56cb7d98
	.word	0x87e02ab4
	.word	0x19f44a4d
	.word	0x9c5136a3
	.word	0xf99ca738
	.word	0x01a4c107
	.word	0xcad3ff7c
	.word	0xd7323797
	.word	0x1d128342
	.word	0xbd75f013
	.word	0xf3c5102a
	.word	0x416b4fda
	.word	0x2c9fb9ae
	.word	0xb3bec67f
	.word	0x9707a8a6
	.word	0x4fa38770
	.word	0x77d70158
	.word	0x3a2921ee
	.word	0xc9aed1b8
	.word	0x70929be7
	.word	0xe63c45be
	.word	0x4448db70
	.word	0x99629605
	.word	0x7e72c3f0
	.word	0x1edbe508
	.word	0xc468c73b
	.word	0x435499b7
	.word	0xe8929830
	.word	0xce094a47
	.word	0xcafb7b9a
	.word	0xeaf4085d
	.word	0x2bdc3558
	.word	0x21f66801
	.word	0x14dd1324
	.word	0x6057fd0f
	.word	0x20e3eb72
	.word	0xb1e9d6ed
	.word	0x71b25e31
	.word	0x6c25c8d5
	.word	0xcc620e7e
	.word	0x53f19cfa
	.word	0x4f85378a
	.word	0xe32abb48
	.word	0x1120bc3d
	.word	0xb64ce096
	.word	0x3e84f05f
	.word	0xbd37517a
	.word	0x499fab4b
	.word	0x34a70c2c
	.word	0x12cd077d
	.word	0xfb43ef12
	.word	0x293d5773
	.word	0x69e325ed
	.word	0x89839fbf
	.word	0x1ec585bb
	.word	0xa1d61f3e
	.word	0x85de5fd2
	.word	0xd5c469c5
	.word	0xc19acebf
	.word	0x10bf26cd
	.word	0xcf7d23e2
	.word	0xffe3f4e4
	.word	0xd960faee
	.word	0xde0c13e8
	.word	0xd6c620b0
	.word	0x89e29b5c
	.word	0xd488fcc4
	.word	0x906bf756
	.word	0x55031a27
	.word	0xc5a57dd0
	.word	0xe974d0ca
	.word	0x3fdaf76e
	.word	0x3a178289
	.word	0xd7ff41f2
	.word	0x2276683c
	.word	0x3f2b8fee
	.word	0xdab91fb5
	.word	0x9df9887d
	.word	0x530019eb
	.word	0xd1437b0a
	.word	0x0b3740a8
	.word	0xdb6b4e68
	.word	0xbcf0bd65
	.word	0x281597c8
	.word	0x62414745
	.word	0x01f7ad58
	.word	0xaee3d452
	.word	0xb223618a
	.word	0x1ee58a58
	.word	0xf153af55
	.word	0x60106620
	.word	0xa4e5ccec
	.word	0xb90dd3d8
	.word	0xb46929c0
	.word	0x39c771e2
	.word	0x98269dd0
	.word	0xfc4eff6c
	.word	0x0dd7d384
	.word	0x344d1a75
	.word	0x15508ab6
	.word	0x76357d30
	.word	0xb0b50a8c
	.word	0xead5f0e4
	.word	0xf74dc150
	.word	0xc390bcb8
	.word	0x0b7dfc74
	.word	0x3324010d
	.word	0xf0f1a055
	.word	0xefdbc454
	.word	0x4a372682
	.word	0xded58484
	.word	0x3263ba95
	.word	0x37017895
	.word	0x94ef60d7
	.word	0x81315fb6
	.word	0xeecf774d
	.word	0x609f5810
	.word	0xf08be8e1
	.word	0xb25bcd51
	.word	0x03fce3bc
	.word	0xf4d1af61
	.word	0x9c261f13
	.word	0x029fdbe3
	.word	0xa2ac89f5
	.word	0x51c08972
	.word	0x549aebd8
	.word	0x3c20a1c1
	.word	0x09d960f7
	.word	0x4ed4dffd
	.word	0xcd76ffc4
	.word	0x690f4b29
	.word	0xfda129fa
	.word	0x82f1d04f
t0_data_in_sp:
	.word	0x996a630c
	.word	0x76b166ab
	.word	0xfdc4cf0b
	.word	0x5685d84d
	.word	0x10210838
	.word	0xfc5513c4
	.word	0x94b796da
	.word	0xf5045fbc
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xffffffed
	.word	0x0000001a
	.word	0x00000000
	.word	0xfffffff8
	.word	t0_data_in_fp
	.word	0x69b81d10
	.word	0x6d84646a
	.word	0x70e2ca95
	.word	0x54feab03
	.word	0x7bc02041
	.word	0x4aeb92ba
	.word	0x13a81db5
	.word	0xc9a5f427
	.word	0xf78a500f
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
	.word   	0x55f53151	! [%fp - 0xc]
	.word   	0xe08bb7f9	! [%fp - 0x8]
	.word   	0x395b00d2	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x7702a312
	.word	0xb876ff45
	.word	0x41dd222b
	.word	0x88f79844
	.word	0x9541a7ea
	.word	0x79cfad8a
	.word	0x13fea7cb
	.word	0x17eb59f9
	.word	0x3344d3a6
	.word	0x53fe1787
	.word	0xbd8d6612
	.word	0x5677ba66
	.word	0x6272d268
	.word	0xfd9af0e6
	.word	0x184cc733
	.word	0x1d6296e1
	.word	0x2981be48
	.word	0x275efcab
	.word	0x1737ede3
	.word	0x9fa994e0
	.word	0x714f6078
	.word	0xe3ed2188
	.word	0x1b3fd51b
	.word	0x90afc065
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x35612000)
.seg "data"
t0_data_in_area0_start:
.skip 8128
t0_data_in_area0_begin:
	.word	0xed99e0a9	! t0_data_in_area0-0x20
	.word	0x1438ef6e	! t0_data_in_area0-0x1c
	.word	0xb365281c	! t0_data_in_area0-0x18
	.word	0xc3021db9	! t0_data_in_area0-0x14
	.word	0xbb8986ad	! t0_data_in_area0-0x10
	.word	0x67576a67	! t0_data_in_area0-0xc
	.word	0xf24916b3	! t0_data_in_area0-0x8
	.word	0x5c672257	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x8be2725e	! t0_data_in_area0+0x0
	.word	0x3b112ea2	! t0_data_in_area0+0x4
	.word	0xf340a9be	! t0_data_in_area0+0x8
	.word	0x3eb8492b	! t0_data_in_area0+0xc
	.word	0x7abf6dbd	! t0_data_in_area0+0x10
	.word	0x406a41cf	! t0_data_in_area0+0x14
	.word	0xbfaa5bee	! t0_data_in_area0+0x18
	.word	0x614435fc	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x721e6000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x91253d5d	! t0_data_in_shm_area+0x0 (t0)
	.word	0xd5c525ad	! t0_data_in_shm_area+0x4 (t0)
	.word	0xaafdfacd	! t0_data_in_shm_area+0x8 (t0)
	.word	0x2f6b1c25	! t0_data_in_shm_area+0xc (t0)
	.word	0x57d01302	! t0_data_in_shm_area+0x10 (t0)
	.word	0x048bffe0	! t0_data_in_shm_area+0x14 (t0)
	.word	0xdd0b1403	! t0_data_in_shm_area+0x18 (t0)
	.word	0x2e0e5c8b	! t0_data_in_shm_area+0x1c (t0)
	.word	0xc4930684	! t0_data_in_shm_area+0x20 (t0)
	.word	0x83a3eb07	! t0_data_in_shm_area+0x24 (t0)
	.word	0x0e5a72d4	! t0_data_in_shm_area+0x28 (t0)
	.word	0xf5878eca	! t0_data_in_shm_area+0x2c (t0)
	.word	0x2ebbb8f9	! t0_data_in_shm_area+0x30 (t0)
	.word	0xe79bc50e	! t0_data_in_shm_area+0x34 (t0)
	.word	0x26eb71ec	! t0_data_in_shm_area+0x38 (t0)
	.word	0x386a69b1	! t0_data_in_shm_area+0x3c (t0)
	.word	0x496a8612	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xb6c90ec0	! t0_data_in_shm_area+0x44
	.word	0x33ce255e	! t0_data_in_shm_area+0x48
	.word	0x0b983ef0	! t0_data_in_shm_area+0x4c
	.word	0x76f1e7c5	! t0_data_in_shm_area+0x50
	.word	0xaf9ab09f	! t0_data_in_shm_area+0x54
	.word	0x00a7a0ea	! t0_data_in_shm_area+0x58
	.word	0xd962fe0f	! t0_data_in_shm_area+0x5c
	.word	0x1455f02c	! t0_data_in_shm_area+0x60
	.word	0x8b92b8f7	! t0_data_in_shm_area+0x64
	.word	0x0f3dde7e	! t0_data_in_shm_area+0x68
	.word	0x72e8f2a2	! t0_data_in_shm_area+0x6c
	.word	0xba2efdac	! t0_data_in_shm_area+0x70
	.word	0x96d56730	! t0_data_in_shm_area+0x74
	.word	0xecfd08ff	! t0_data_in_shm_area+0x78
	.word	0x1fb1b1bb	! t0_data_in_shm_area+0x7c
	.word	0x5ec10d59	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xd44d1864	! t0_data_in_shm_area+0x84
	.word	0x4d402f48	! t0_data_in_shm_area+0x88
	.word	0x9f27ea9f	! t0_data_in_shm_area+0x8c
	.word	0xe64b4f99	! t0_data_in_shm_area+0x90
	.word	0x2e47e931	! t0_data_in_shm_area+0x94
	.word	0x6343a372	! t0_data_in_shm_area+0x98
	.word	0x01130ebb	! t0_data_in_shm_area+0x9c
	.word	0x08a9e307	! t0_data_in_shm_area+0xa0
	.word	0x8c6d20cf	! t0_data_in_shm_area+0xa4
	.word	0xc8478a55	! t0_data_in_shm_area+0xa8
	.word	0x74ef04d8	! t0_data_in_shm_area+0xac
	.word	0xb09dd999	! t0_data_in_shm_area+0xb0
	.word	0x0f35b964	! t0_data_in_shm_area+0xb4
	.word	0x9dcd5f4f	! t0_data_in_shm_area+0xb8
	.word	0x932f5b8d	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x4a4c4000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x79ca36b4          ! %f0
	.word	0x3349f7ec          ! %f1
	.word	0xa2881303          ! %f2
	.word	0xace59fa1          ! %f3
	.word	0x351a1829          ! %f4
	.word	0xb2df7e11          ! %f5
	.word	0x264f8203          ! %f6
	.word	0xd030ebcf          ! %f7
	.word	0xc0c6f996          ! %f8
	.word	0xcb0ca238          ! %f9
	.word	0x3543ef28          ! %f10
	.word	0x0f75848b          ! %f11
	.word	0xa5b1996a          ! %f12
	.word	0x41bdf73f          ! %f13
	.word	0x243152a2          ! %f14
	.word	0x7fd7f055          ! %f15
	.word	0x8dde3aeb          ! %f16
	.word	0x635b1cc2          ! %f17
	.word	0xb7fd7f06          ! %f18
	.word	0x33ec2a27          ! %f19
	.word	0xb18b7559          ! %f20
	.word	0x20c74968          ! %f21
	.word	0xc59a7f09          ! %f22
	.word	0x7ed5a5ea          ! %f23
	.word	0xe2c45152          ! %f24
	.word	0x132fa67a          ! %f25
	.word	0xfb9a8b8b          ! %f26
	.word	0xfafea82b          ! %f27
	.word	0x142c5878          ! %f28
	.word	0xda2b50b5          ! %f29
	.word	0x51feddd7          ! %f30
	.word	0xc4c0e50e          ! %f31
	.word	0xf28a7b50          ! %f32
	.word	0xec9a1260          ! %f33
	.word	0xf6aae229          ! %f34
	.word	0xb0849a82          ! %f35
	.word	0x2181f16d          ! %f36
	.word	0x65ec2a9f          ! %f37
	.word	0xcb798e6f          ! %f38
	.word	0x1a7a99b6          ! %f39
	.word	0x213677cd          ! %f40
	.word	0x994eb609          ! %f41
	.word	0xb68ae154          ! %f42
	.word	0x4768f3cb          ! %f43
	.word	0xb68b9182          ! %f44
	.word	0x17dd8c78          ! %f45
	.word	0x6a3bcd79          ! %f46
	.word	0x21493dca          ! %f47
	.word	0xa884ae94          ! %f48
	.word	0x47b4a821          ! %f49
	.word	0xb89b1505          ! %f50
	.word	0x92f29fd7          ! %f51
	.word	0xad465d25          ! %f52
	.word	0xe4c869e3          ! %f53
	.word	0x9251d95f          ! %f54
	.word	0x82f923a6          ! %f55
	.word	0xc696e8d6          ! %f56
	.word	0x9b0d4ee3          ! %f57
	.word	0x131ee33a          ! %f58
	.word	0xc28ef62e          ! %f59
	.word	0x02bf0c69          ! %f60
	.word	0x00eceb58          ! %f61
	.word	0x526fe6d1          ! %f62
	.word	0x78cb909d          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x2c        ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xd90f991b          ! %g3 (loop index)
	.word	SYM(t0_subr2)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x2969b680          ! %o0
	.word	0xfc8e6845          ! %o1
	.word	0x7096a437          ! %o2
	.word	0xf750795c          ! %o3
	.word	0xbc2c4b4f          ! %o4
	.word	0x8ee77b60          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x719199a7          ! %l0
	.word	0x4a8f3ea3          ! %l1
	.word	0x75944873          ! %l2
	.word	0x2087fc8b          ! %l3
	.word	0x186b3b84          ! %l4
	.word	0x275cb4a2          ! %l5
	.word	0xdeb92542          ! %l6
	.word	0x063ea771          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffffa          ! %i2 (byte offset)
	.word	0x00000016          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0xffffffe0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x26b2d368          ! %y
	.word	0x0000000d          ! %icc (nzvc)
	.word	0x40000783          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x03da2000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x329f391e
	.word	0xcaa65241
	.word	0x7723a69d
	.word	0x924e8dab
	.word	0xd12e05e4
	.word	0x3adb3777
	.word	0xa23afc80
	.word	0x22c042c2
	.word	0x644e2faa
	.word	0xe33bff38
	.word	0xe49a37d1
	.word	0x3237b099
	.word	0x42d33266
	.word	0x99cd20da
	.word	0xdc8a495e
	.word	0x2ca0a1b7
	.word	0x6caf6737
	.word	0x1b1780ea
	.word	0x42585f8f
	.word	0x4fd3ca66
	.word	0x92726792
	.word	0x5409664d
	.word	0xae8c9ebb
	.word	0xffeebc72
	.word	0xb46defc1
	.word	0xa30f1da8
	.word	0xcc638ab6
	.word	0x0650d330
	.word	0x3c21f48e
	.word	0xe087ef01
	.word	0xb37bf5ae
	.word	0x08ac5bc1
	.word	0x2f67e03b
	.word	0xc9e249a6
	.word	0x00748837
	.word	0x56cb7d98
	.word	0x87e02ab4
	.word	0x19f44a4d
	.word	0x9c5136a3
	.word	0xf99ca738
	.word	0x01a4c107
	.word	0xcad3ff7c
	.word	0xd7323797
	.word	0x1d128342
	.word	0xbd75f013
	.word	0xf3c5102a
	.word	0x416b4fda
	.word	0x2c9fb9ae
	.word	0xb3bec67f
	.word	0x9707a8a6
	.word	0x4fa38770
	.word	0x77d70158
	.word	0x3a2921ee
	.word	0xc9aed1b8
	.word	0x70929be7
	.word	0xe63c45be
	.word	0x4448db70
	.word	0x99629605
	.word	0x7e72c3f0
	.word	0x1edbe508
	.word	0xc468c73b
	.word	0x435499b7
	.word	0xe8929830
	.word	0xce094a47
	.word	0xcafb7b9a
	.word	0xeaf4085d
	.word	0x2bdc3558
	.word	0x21f66801
	.word	0x14dd1324
	.word	0x6057fd0f
	.word	0x20e3eb72
	.word	0xb1e9d6ed
	.word	0x71b25e31
	.word	0x6c25c8d5
	.word	0xcc620e7e
	.word	0x53f19cfa
	.word	0x4f85378a
	.word	0xe32abb48
	.word	0x1120bc3d
	.word	0xb64ce096
	.word	0x3e84f05f
	.word	0xbd37517a
	.word	0x499fab4b
	.word	0x34a70c2c
	.word	0x12cd077d
	.word	0xfb43ef12
	.word	0x293d5773
	.word	0x69e325ed
	.word	0x89839fbf
	.word	0x1ec585bb
	.word	0xa1d61f3e
	.word	0x85de5fd2
	.word	0xd5c469c5
	.word	0xc19acebf
	.word	0x10bf26cd
	.word	0xcf7d23e2
	.word	0xffe3f4e4
	.word	0xd960faee
	.word	0xde0c13e8
	.word	0xd6c620b0
	.word	0x89e29b5c
	.word	0xd488fcc4
	.word	0x906bf756
	.word	0x55031a27
	.word	0xc5a57dd0
	.word	0xe974d0ca
	.word	0x3fdaf76e
	.word	0x3a178289
	.word	0xd7ff41f2
	.word	0x2276683c
	.word	0x3f2b8fee
	.word	0xdab91fb5
	.word	0x9df9887d
	.word	0x530019eb
	.word	0xd1437b0a
	.word	0x0b3740a8
	.word	0xdb6b4e68
	.word	0xbcf0bd65
	.word	0x281597c8
	.word	0x62414745
	.word	0x01f7ad58
	.word	0xaee3d452
	.word	0xb223618a
	.word	0x1ee58a58
	.word	0xf153af55
	.word	0x60106620
	.word	0xa4e5ccec
	.word	0xb90dd3d8
	.word	0xb46929c0
	.word	0x39c771e2
	.word	0x98269dd0
	.word	0xfc4eff6c
	.word	0x0dd7d384
	.word	0x344d1a75
	.word	0x15508ab6
	.word	0x76357d30
	.word	0xb0b50a8c
	.word	0xead5f0e4
	.word	0xf74dc150
	.word	0xc390bcb8
	.word	0x0b7dfc74
	.word	0x3324010d
	.word	0xf0f1a055
	.word	0xefdbc454
	.word	0x4a372682
	.word	0xded58484
	.word	0x3263ba95
	.word	0x37017895
	.word	0x94ef60d7
	.word	0x81315fb6
	.word	0xeecf774d
	.word	0x609f5810
	.word	0xf08be8e1
	.word	0xb25bcd51
	.word	0x03fce3bc
	.word	0xf4d1af61
	.word	0x9c261f13
	.word	0x029fdbe3
	.word	0xa2ac89f5
	.word	0x51c08972
	.word	0x549aebd8
	.word	0x3c20a1c1
	.word	0x09d960f7
	.word	0x4ed4dffd
	.word	0xcd76ffc4
	.word	0x690f4b29
	.word	0xfda129fa
	.word	0x82f1d04f
t0_data_exp_sp:
	.word	0x996a630c
	.word	0x76b166ab
	.word	0xfdc4cf0b
	.word	0x5685d84d
	.word	0x10210838
	.word	0xfc5513c4
	.word	0x94b796da
	.word	0xf5045fbc
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xffffffed
	.word	0x0000001a
	.word	0x00000000
	.word	0xfffffff8
	.word	t0_data_exp_fp
	.word	0x69b81d10
	.word	0x6d84646a
	.word	0x70e2ca95
	.word	0x54feab03
	.word	0x7bc02041
	.word	0x4aeb92ba
	.word	0x13a81db5
	.word	0xc9a5f427
	.word	0xf78a500f
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
	.word   	0x55f53151	! [%fp - 0xc]
	.word   	0xe08bb7f9	! [%fp - 0x8]
	.word   	0x395b00d2	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x7702a312
	.word	0xb876ff45
	.word	0x41dd222b
	.word	0x88f79844
	.word	0x9541a7ea
	.word	0x79cfad8a
	.word	0x13fea7cb
	.word	0x17eb59f9
	.word	0x3344d3a6
	.word	0x53fe1787
	.word	0xbd8d6612
	.word	0x5677ba66
	.word	0x6272d268
	.word	0xfd9af0e6
	.word	0x184cc733
	.word	0x1d6296e1
	.word	0x2981be48
	.word	0x275efcab
	.word	0x1737ede3
	.word	0x9fa994e0
	.word	0x714f6078
	.word	0xe3ed2188
	.word	0x1b3fd51b
	.word	0x90afc065
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x193d2000)
.seg "data"
t0_data_exp_area0_start:
.skip 8128
t0_data_exp_area0_begin:
	.word	0xed99e0a9	! t0_data_exp_area0-0x20
	.word	0x1438ef6e	! t0_data_exp_area0-0x1c
	.word	0xb365281c	! t0_data_exp_area0-0x18
	.word	0xc3021db9	! t0_data_exp_area0-0x14
	.word	0xbb8986ad	! t0_data_exp_area0-0x10
	.word	0x67576a67	! t0_data_exp_area0-0xc
	.word	0xf24916b3	! t0_data_exp_area0-0x8
	.word	0x5c672257	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x8be2725e	! t0_data_exp_area0+0x0
	.word	0x3b112ea2	! t0_data_exp_area0+0x4
	.word	0xf340a9be	! t0_data_exp_area0+0x8
	.word	0x3eb8492b	! t0_data_exp_area0+0xc
	.word	0x7abf6dbd	! t0_data_exp_area0+0x10
	.word	0x406a41cf	! t0_data_exp_area0+0x14
	.word	0xbfaa5bee	! t0_data_exp_area0+0x18
	.word	0x614435fc	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x70470000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x91253d5d	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xd5c525ad	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xaafdfacd	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x2f6b1c25	! t0_data_exp_shm_area+0xc (t0)
	.word	0x57d01302	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x048bffe0	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xdd0b1403	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x2e0e5c8b	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xc4930684	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x83a3eb07	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x0e5a72d4	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xf5878eca	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x2ebbb8f9	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xe79bc50e	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x26eb71ec	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x386a69b1	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x496a8612	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xb6c90ec0	! t0_data_exp_shm_area+0x44
	.word	0x33ce255e	! t0_data_exp_shm_area+0x48
	.word	0x0b983ef0	! t0_data_exp_shm_area+0x4c
	.word	0x76f1e7c5	! t0_data_exp_shm_area+0x50
	.word	0xaf9ab09f	! t0_data_exp_shm_area+0x54
	.word	0x00a7a0ea	! t0_data_exp_shm_area+0x58
	.word	0xd962fe0f	! t0_data_exp_shm_area+0x5c
	.word	0x1455f02c	! t0_data_exp_shm_area+0x60
	.word	0x8b92b8f7	! t0_data_exp_shm_area+0x64
	.word	0x0f3dde7e	! t0_data_exp_shm_area+0x68
	.word	0x72e8f2a2	! t0_data_exp_shm_area+0x6c
	.word	0xba2efdac	! t0_data_exp_shm_area+0x70
	.word	0x96d56730	! t0_data_exp_shm_area+0x74
	.word	0xecfd08ff	! t0_data_exp_shm_area+0x78
	.word	0x1fb1b1bb	! t0_data_exp_shm_area+0x7c
	.word	0x5ec10d59	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xd44d1864	! t0_data_exp_shm_area+0x84
	.word	0x4d402f48	! t0_data_exp_shm_area+0x88
	.word	0x9f27ea9f	! t0_data_exp_shm_area+0x8c
	.word	0xe64b4f99	! t0_data_exp_shm_area+0x90
	.word	0x2e47e931	! t0_data_exp_shm_area+0x94
	.word	0x6343a372	! t0_data_exp_shm_area+0x98
	.word	0x01130ebb	! t0_data_exp_shm_area+0x9c
	.word	0x08a9e307	! t0_data_exp_shm_area+0xa0
	.word	0x8c6d20cf	! t0_data_exp_shm_area+0xa4
	.word	0xc8478a55	! t0_data_exp_shm_area+0xa8
	.word	0x74ef04d8	! t0_data_exp_shm_area+0xac
	.word	0xb09dd999	! t0_data_exp_shm_area+0xb0
	.word	0x0f35b964	! t0_data_exp_shm_area+0xb4
	.word	0x9dcd5f4f	! t0_data_exp_shm_area+0xb8
	.word	0x932f5b8d	! t0_data_exp_shm_area+0xbc
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



