/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ifu_kao_02_18_04_109.s
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
#define T0_KAOS_SEED          d3a9792b1c64
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    6272
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x65854000
#define T0_KAOS_BOOT_PA                  0x0000000000c74000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x44cb2000
#define T0_KAOS_STARTUP_PA               0x000000000312e000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x089b8000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000005d2c000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x6c4d0000
#define T0_KAOS_DONE_PA                  0x0000000007ce0000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x159e0000
#define T0_KAOS_KTBL_PA                  0x00000000081f2000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x73344000
#define T0_KAOS_SUBR0_PA                 0x000000000baa2000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x7fb36000
#define T0_KAOS_SUBR1_PA                 0x000000000c5da000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x1544e000
#define T0_KAOS_SUBR2_PA                 0x000000000e8f8000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x15944000
#define T0_KAOS_SUBR3_PA                 0x0000000011afc000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x342b4000
#define T0_KAOS_EXP_REGS_PA              0x0000000012342000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x3308a000
#define T0_KAOS_RUN_REGS_PA              0x0000000014c70000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x5dd52000
#define T0_KAOS_EXP_STACK_PA             0x000000001743a000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x11bde000
#define T0_KAOS_RUN_STACK_PA             0x0000000019c4e000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x1c208000
#define T0_KAOS_EXP_AREA0_PA             0x000000001af94000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x75918000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c30c000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x1da34000
#define T0_KAOS_EXP_SHM_AREA_PA          0x000000000118e000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x518aa000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000001ee000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xca4fe90b
#define T0_KAOS_RANVAL_01     0xd3d5d4d2
#define T0_KAOS_RANVAL_02     0x5aa7bf93
#define T0_KAOS_RANVAL_03     0xe3ebaefe
#define T0_KAOS_RANVAL_04     0x717d08bf
#define T0_KAOS_RANVAL_05     0x097dac7f
#define T0_KAOS_RANVAL_06     0x6e909833
#define T0_KAOS_RANVAL_07     0xb36a3c2b
#define T0_KAOS_RANVAL_08     0x8eb540dc
#define T0_KAOS_RANVAL_09     0xdc571098
#define T0_KAOS_RANVAL_0a     0xfc98020a
#define T0_KAOS_RANVAL_0b     0x6893b348
#define T0_KAOS_RANVAL_0c     0xfb6962c2
#define T0_KAOS_RANVAL_0d     0x5ea395cf
#define T0_KAOS_RANVAL_0e     0xb5912616
#define T0_KAOS_RANVAL_0f     0xaac68819
#define T0_KAOS_RANVAL_10     0xa0fab48c
#define T0_KAOS_RANVAL_11     0xf52bf337
#define T0_KAOS_RANVAL_12     0x3ef649d3
#define T0_KAOS_RANVAL_13     0xd33e0a60
#define T0_KAOS_RANVAL_14     0x9fa9fb60
#define T0_KAOS_RANVAL_15     0x0bbee007
#define T0_KAOS_RANVAL_16     0x70db53a8
#define T0_KAOS_RANVAL_17     0xe3450339
#define T0_KAOS_RANVAL_18     0x6bbc5708
#define T0_KAOS_RANVAL_19     0x5f99899d
#define T0_KAOS_RANVAL_1a     0x221fa2a4
#define T0_KAOS_RANVAL_1b     0x2f2a44c7
#define T0_KAOS_RANVAL_1c     0xf3d9c2c1
#define T0_KAOS_RANVAL_1d     0xd8d2e5c6
#define T0_KAOS_RANVAL_1e     0xf5b92d69
#define T0_KAOS_RANVAL_1f     0x65fc1010
#define T0_KAOS_RANVAL_20     0xef924f53
#define T0_KAOS_RANVAL_21     0x8db3653c
#define T0_KAOS_RANVAL_22     0x9b1e1c68
#define T0_KAOS_RANVAL_23     0x1ef97525
#define T0_KAOS_RANVAL_24     0xce346a61
#define T0_KAOS_RANVAL_25     0x9176ca6f
#define T0_KAOS_RANVAL_26     0xf271534e
#define T0_KAOS_RANVAL_27     0x92f71186
#define T0_KAOS_RANVAL_28     0x65efc702
#define T0_KAOS_RANVAL_29     0xa38e2888
#define T0_KAOS_RANVAL_2a     0x86699dbd
#define T0_KAOS_RANVAL_2b     0x83e6d0c3
#define T0_KAOS_RANVAL_2c     0x4ee5bb8f
#define T0_KAOS_RANVAL_2d     0x01544eaa
#define T0_KAOS_RANVAL_2e     0xc932733f
#define T0_KAOS_RANVAL_2f     0x55889366
#define T0_KAOS_RANVAL_30     0xae8128be
#define T0_KAOS_RANVAL_31     0x5287237a
#define T0_KAOS_RANVAL_32     0xa2008677
#define T0_KAOS_RANVAL_33     0xea43e010
#define T0_KAOS_RANVAL_34     0x5a7d3def
#define T0_KAOS_RANVAL_35     0x7cfcb4e1
#define T0_KAOS_RANVAL_36     0xbe039399
#define T0_KAOS_RANVAL_37     0x448902e1
#define T0_KAOS_RANVAL_38     0x79a3aec6
#define T0_KAOS_RANVAL_39     0xb6330010
#define T0_KAOS_RANVAL_3a     0x1402221b
#define T0_KAOS_RANVAL_3b     0x2a1a3f1d
#define T0_KAOS_RANVAL_3c     0xc7c02df9
#define T0_KAOS_RANVAL_3d     0x45c5b5c4
#define T0_KAOS_RANVAL_3e     0x65832dac
#define T0_KAOS_RANVAL_3f     0xe983f70b
#define T0_KAOS_RANVAL_40     0x1bd0416a
#define T0_KAOS_RANVAL_41     0x7ac57ecb
#define T0_KAOS_RANVAL_42     0xbe34ea65
#define T0_KAOS_RANVAL_43     0xe514ee20
#define T0_KAOS_RANVAL_44     0xd053c378
#define T0_KAOS_RANVAL_45     0x7ba084c5
#define T0_KAOS_RANVAL_46     0xf17f183d
#define T0_KAOS_RANVAL_47     0x0816095d
#define T0_KAOS_RANVAL_48     0xd713a591
#define T0_KAOS_RANVAL_49     0xfd04432f
#define T0_KAOS_RANVAL_4a     0x822299c2
#define T0_KAOS_RANVAL_4b     0xcd1331f5
#define T0_KAOS_RANVAL_4c     0x08f9c80b
#define T0_KAOS_RANVAL_4d     0xfc1ce49d
#define T0_KAOS_RANVAL_4e     0xcfaf4206
#define T0_KAOS_RANVAL_4f     0xe4fd3e32
#define T0_KAOS_RANVAL_50     0x30edfb34
#define T0_KAOS_RANVAL_51     0x4416b046
#define T0_KAOS_RANVAL_52     0xa4b40dd6
#define T0_KAOS_RANVAL_53     0xe9070498
#define T0_KAOS_RANVAL_54     0x43597da7
#define T0_KAOS_RANVAL_55     0x820a4bc5
#define T0_KAOS_RANVAL_56     0x8e1d3c32
#define T0_KAOS_RANVAL_57     0x3a9dfd4a
#define T0_KAOS_RANVAL_58     0x9c338be0
#define T0_KAOS_RANVAL_59     0xadc4d51e
#define T0_KAOS_RANVAL_5a     0xb376f9f8
#define T0_KAOS_RANVAL_5b     0x600115ac
#define T0_KAOS_RANVAL_5c     0x408ed513
#define T0_KAOS_RANVAL_5d     0x956918fe
#define T0_KAOS_RANVAL_5e     0x200294e1
#define T0_KAOS_RANVAL_5f     0xbefe9a49
#define T0_KAOS_RANVAL_60     0x57c8e938
#define T0_KAOS_RANVAL_61     0xe5f76946
#define T0_KAOS_RANVAL_62     0xa8f769b1
#define T0_KAOS_RANVAL_63     0xac8c5af7
#define T0_KAOS_RANVAL_64     0x08f9f46a
#define T0_KAOS_RANVAL_65     0x5f9dd7ca
#define T0_KAOS_RANVAL_66     0x6d2801aa
#define T0_KAOS_RANVAL_67     0xdd7b6d39
#define T0_KAOS_RANVAL_68     0xe4545b71
#define T0_KAOS_RANVAL_69     0x4a8ad955
#define T0_KAOS_RANVAL_6a     0x90d71341
#define T0_KAOS_RANVAL_6b     0x7cbb30e3
#define T0_KAOS_RANVAL_6c     0x13090d9d
#define T0_KAOS_RANVAL_6d     0x441894f0
#define T0_KAOS_RANVAL_6e     0x8d0f5a14
#define T0_KAOS_RANVAL_6f     0x8cb57b04
#define T0_KAOS_RANVAL_70     0xdc3e9fd5
#define T0_KAOS_RANVAL_71     0x2cc76363
#define T0_KAOS_RANVAL_72     0x978c7a1a
#define T0_KAOS_RANVAL_73     0xed880aff
#define T0_KAOS_RANVAL_74     0x1ff684ef
#define T0_KAOS_RANVAL_75     0x31e242fc
#define T0_KAOS_RANVAL_76     0x2e72621b
#define T0_KAOS_RANVAL_77     0xf77dadfb
#define T0_KAOS_RANVAL_78     0x4a9cf741
#define T0_KAOS_RANVAL_79     0x7a10438e
#define T0_KAOS_RANVAL_7a     0x44f3e163
#define T0_KAOS_RANVAL_7b     0x426bb47d
#define T0_KAOS_RANVAL_7c     0xdab56777
#define T0_KAOS_RANVAL_7d     0xfec22ebc
#define T0_KAOS_RANVAL_7e     0x72e064b2
#define T0_KAOS_RANVAL_7f     0x05be9e52
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
!    areaoffset     6272
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           159e0000
!    entry          159e0000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3a9792b1c64
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/ifu.w
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

KTEXT_MODULE(t0_module_ktbl, 0x159e0000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x81aeca3b	! t0_kref+0x0:   	fcmps	%fcc0, %f27, %f27
	.word	0xf51e401d	! t0_kref+0x4:   	ldd	[%i1 + %i5], %f26
	.word	0xc3e8a087	! t0_kref+0x8:   	prefetcha	%g2 + 0x87, 1
	.word	0xb9b70c5a	! t0_kref+0xc:   	fnor	%f28, %f26, %f28
	.word	0xa9b3416d	! t0_kref+0x10:   	edge32ln	%o5, %o5, %l4
	.word	0xd0067ffc	! t0_kref+0x14:   	ld	[%i1 - 4], %o0
	.word	0xa6c3400d	! t0_kref+0x18:   	addccc	%o5, %o5, %l3
	.word	0xec567ff0	! t0_kref+0x1c:   	ldsh	[%i1 - 0x10], %l6
	.word	0xe8070019	! t0_kref+0x20:   	ld	[%i4 + %i1], %l4
	.word	0x93b3430d	! t0_kref+0x24:   	alignaddr	%o5, %o5, %o1
	.word	0xdaf63ff0	! t0_kref+0x28:   	stxa	%o5, [%i0 - 0x10]%asi
	.word	0x960b400d	! t0_kref+0x2c:   	and	%o5, %o5, %o3
	.word	0x91b34240	! t0_kref+0x30:   	array16	%o5, %g0, %o0
	.word	0xd0567ffa	! t0_kref+0x34:   	ldsh	[%i1 - 6], %o0
	.word	0x9283400d	! t0_kref+0x38:   	addcc	%o5, %o5, %o1
	.word	0xea08a038	! t0_kref+0x3c:   	ldub	[%g2 + 0x38], %l5
	.word	0x9de3bfa0	! t0_kref+0x40:   	save	%sp, -0x60, %sp
	.word	0xba2e7e77	! t0_kref+0x44:   	andn	%i1, -0x189, %i5
	.word	0xafeea98d	! t0_kref+0x48:   	restore	%i2, 0x98d, %l7
	.word	0xb3a6c9b8	! t0_kref+0x4c:   	fdivs	%f27, %f24, %f25
	.word	0xaed3400d	! t0_kref+0x50:   	umulcc	%o5, %o5, %l7
	.word	0xb1b70f5c	! t0_kref+0x54:   	fornot1	%f28, %f28, %f24
	.word	0xadb34240	! t0_kref+0x58:   	array16	%o5, %g0, %l6
	.word	0xa8d37345	! t0_kref+0x5c:   	umulcc	%o5, -0xcbb, %l4
	.word	0xb9b78eda	! t0_kref+0x60:   	fornot2	%f30, %f26, %f28
	.word	0x81da7f5c	! t0_kref+0x64:   	flush	%o1 - 0xa4
	.word	0x95408000	! t0_kref+0x68:   	mov	%ccr, %o2
	.word	0x93037685	! t0_kref+0x6c:   	taddcc	%o5, -0x97b, %o1
	.word	0xda360000	! t0_kref+0x70:   	sth	%o5, [%i0]
	.word	0xa613400d	! t0_kref+0x74:   	or	%o5, %o5, %l3
	.word	0xb9b78d9a	! t0_kref+0x78:   	fxor	%f30, %f26, %f28
	.word	0xdaa6601c	! t0_kref+0x7c:   	sta	%o5, [%i1 + 0x1c]%asi
	.word	0xd608a034	! t0_kref+0x80:   	ldub	[%g2 + 0x34], %o3
	.word	0xee064000	! t0_kref+0x84:   	ld	[%i1], %l7
	.word	0xaf1b6a05	! t0_kref+0x88:   	tsubcctv	%o5, 0xa05, %l7
	.word	0x2c800002	! t0_kref+0x8c:   	bneg,a	_kref+0x94
	.word	0xbfa7c9bb	! t0_kref+0x90:   	fdivs	%f31, %f27, %f31
	.word	0xd2062018	! t0_kref+0x94:   	ld	[%i0 + 0x18], %o1
          nop   !	call	0xfffff3fc
	.word	0xda30a03a	! t0_kref+0x9c:   	sth	%o5, [%g2 + 0x3a]
	.word	0xea56401b	! t0_kref+0xa0:   	ldsh	[%i1 + %i3], %l5
	.word	0xabb3404d	! t0_kref+0xa4:   	edge8l	%o5, %o5, %l5
	.word	0xbda0055e	! t0_kref+0xa8:   	fsqrtd	%f30, %f30
	.word	0xd288a030	! t0_kref+0xac:   	lduba	[%g2 + 0x30]%asi, %o1
	.word	0xb1b009bf	! t0_kref+0xb0:   	fexpand	%f31, %f24
	.word	0x8143c000	! t0_kref+0xb4:   	stbar
	.word	0xae9362f8	! t0_kref+0xb8:   	orcc	%o5, 0x2f8, %l7
	.word	0xf780a008	! t0_kref+0xbc:   	lda	[%g2 + 8]%asi, %f27
	.word	0xb1b68f9c	! t0_kref+0xc0:   	for	%f26, %f28, %f24
	.word	0xf9a0a018	! t0_kref+0xc4:   	sta	%f28, [%g2 + 0x18]%asi
	.word	0xdab0a002	! t0_kref+0xc8:   	stha	%o5, [%g2 + 2]%asi
	.word	0xb3b00fe0	! t0_kref+0xcc:   	fones	%f25
	.word	0xee50a022	! t0_kref+0xd0:   	ldsh	[%g2 + 0x22], %l7
	.word	0xbba0053f	! t0_kref+0xd4:   	fsqrts	%f31, %f29
	.word	0xaf0b400d	! t0_kref+0xd8:   	tsubcc	%o5, %o5, %l7
	.word	0x81ae8a5a	! t0_kref+0xdc:   	fcmpd	%fcc0, %f26, %f26
	.word	0xb9b6097a	! t0_kref+0xe0:   	fpmerge	%f24, %f26, %f28
	.word	0x3a800006	! t0_kref+0xe4:   	bcc,a	_kref+0xfc
	.word	0xb9b64719	! t0_kref+0xe8:   	fmuld8sux16	%f25, %f25, %f28
	.word	0xbda0191d	! t0_kref+0xec:   	fitod	%f29, %f30
	.word	0xb5b0077a	! t0_kref+0xf0:   	fpack16	%f26, %f26
	.word	0xd20e001a	! t0_kref+0xf4:   	ldub	[%i0 + %i2], %o1
	.word	0x8d83400d	! t0_kref+0xf8:   	wr	%o5, %o5, %fprs
	.word	0xe86e4000	! t0_kref+0xfc:   	ldstub	[%i1], %l4
	.word	0xe81e0000	! t0_kref+0x100:   	ldd	[%i0], %l4
	.word	0xb9a000bf	! t0_kref+0x104:   	fnegs	%f31, %f28
	.word	0xe80e3ffc	! t0_kref+0x108:   	ldub	[%i0 - 4], %l4
	.word	0xd6c8a03a	! t0_kref+0x10c:   	ldsba	[%g2 + 0x3a]%asi, %o3
	.word	0xea063fe8	! t0_kref+0x110:   	ld	[%i0 - 0x18], %l5
	.word	0xf300a014	! t0_kref+0x114:   	ld	[%g2 + 0x14], %f25
	.word	0xf99e5a1d	! t0_kref+0x118:   	ldda	[%i1 + %i5]0xd0, %f28
	.word	0xee064000	! t0_kref+0x11c:   	ld	[%i1], %l7
	.word	0xda2e3fef	! t0_kref+0x120:   	stb	%o5, [%i0 - 0x11]
	.word	0x95b34240	! t0_kref+0x124:   	array16	%o5, %g0, %o2
	.word	0xf3a0a010	! t0_kref+0x128:   	sta	%f25, [%g2 + 0x10]%asi
	.word	0x9723400d	! t0_kref+0x12c:   	mulscc	%o5, %o5, %o3
	.word	0xf7000019	! t0_kref+0x130:   	ld	[%g0 + %i1], %f27
	.word	0xafb3408d	! t0_kref+0x134:   	edge16	%o5, %o5, %l7
	.word	0xa7b7051c	! t0_kref+0x138:   	fcmpgt16	%f28, %f28, %l3
	.word	0xd87e4000	! t0_kref+0x13c:   	swap	[%i1], %o4
	.word	0xb1a00558	! t0_kref+0x140:   	fsqrtd	%f24, %f24
	.word	0xb9a70858	! t0_kref+0x144:   	faddd	%f28, %f24, %f28
	.word	0xbdb6099e	! t0_kref+0x148:   	bshuffle	%f24, %f30, %f30
	.word	0xaa1376c9	! t0_kref+0x14c:   	or	%o5, -0x937, %l5
	.word	0x932b400d	! t0_kref+0x150:   	sll	%o5, %o5, %o1
	.word	0x932372b2	! t0_kref+0x154:   	mulscc	%o5, -0xd4e, %o1
	.word	0xb5a018de	! t0_kref+0x158:   	fdtos	%f30, %f26
	.word	0xf300a028	! t0_kref+0x15c:   	ld	[%g2 + 0x28], %f25
	.word	0xf99e5a5c	! t0_kref+0x160:   	ldda	[%i1 + %i4]0xd2, %f28
	.word	0x94bb74eb	! t0_kref+0x164:   	xnorcc	%o5, -0xb15, %o2
	.word	0xff064000	! t0_kref+0x168:   	ld	[%i1], %f31
	.word	0xf99eda19	! t0_kref+0x16c:   	ldda	[%i3 + %i1]0xd0, %f28
	.word	0xf9bf5a18	! t0_kref+0x170:   	stda	%f28, [%i5 + %i0]0xd0
	.word	0xd6080019	! t0_kref+0x174:   	ldub	[%g0 + %i1], %o3
	.word	0xa80b700b	! t0_kref+0x178:   	and	%o5, -0xff5, %l4
	.word	0x81b01020	! t0_kref+0x17c:   	siam	0x0
	.word	0xa744c000	! t0_kref+0x180:   	mov	%gsr, %l3
	.word	0x95408000	! t0_kref+0x184:   	mov	%ccr, %o2
	.word	0x97b685dc	! t0_kref+0x188:   	fcmpeq32	%f26, %f28, %o3
	.word	0xaf703d26	! t0_kref+0x18c:   	popc	-0x2da, %l7
	.word	0x2d27b679	! t0_kref+0x190:   	sethi	%hi(0x9ed9e400), %l6
	.word	0xecd0a006	! t0_kref+0x194:   	ldsha	[%g2 + 6]%asi, %l6
	.word	0xd0070018	! t0_kref+0x198:   	ld	[%i4 + %i0], %o0
	.word	0xac33400d	! t0_kref+0x19c:   	orn	%o5, %o5, %l6
	.word	0xbdb687de	! t0_kref+0x1a0:   	pdist	%f26, %f30, %f30
	.word	0xb3a609bb	! t0_kref+0x1a4:   	fdivs	%f24, %f27, %f25
	.word	0xa60b400d	! t0_kref+0x1a8:   	and	%o5, %o5, %l3
	.word	0xd6062004	! t0_kref+0x1ac:   	ld	[%i0 + 4], %o3
	.word	0xd4063fe8	! t0_kref+0x1b0:   	ld	[%i0 - 0x18], %o2
	.word	0xd4c6101c	! t0_kref+0x1b4:   	ldswa	[%i0 + %i4]0x80, %o2
	.word	0xf11e7fe8	! t0_kref+0x1b8:   	ldd	[%i1 - 0x18], %f24
	.word	0x95b3402d	! t0_kref+0x1bc:   	edge8n	%o5, %o5, %o2
	.word	0xbdb68f9c	! t0_kref+0x1c0:   	for	%f26, %f28, %f30
	.word	0xf5ee501d	! t0_kref+0x1c4:   	prefetcha	%i1 + %i5, 26
	.word	0xacf3400d	! t0_kref+0x1c8:   	udivcc	%o5, %o5, %l6
	.word	0xd20e8018	! t0_kref+0x1cc:   	ldub	[%i2 + %i0], %o1
	.word	0xd6062000	! t0_kref+0x1d0:   	ld	[%i0], %o3
	.word	0xd6064000	! t0_kref+0x1d4:   	ld	[%i1], %o3
	.word	0xf5180018	! t0_kref+0x1d8:   	ldd	[%g0 + %i0], %f26
	.word	0xdaa0a00c	! t0_kref+0x1dc:   	sta	%o5, [%g2 + 0xc]%asi
	.word	0xa9b3432d	! t0_kref+0x1e0:   	bmask	%o5, %o5, %l4
	.word	0xd2063ffc	! t0_kref+0x1e4:   	ld	[%i0 - 4], %o1
	.word	0xb9a00558	! t0_kref+0x1e8:   	fsqrtd	%f24, %f28
	.word	0xa783400d	! t0_kref+0x1ec:   	wr	%o5, %o5, %gsr
	.word	0x39800007	! t0_kref+0x1f0:   	fbuge,a	_kref+0x20c
	.word	0xafb3430d	! t0_kref+0x1f4:   	alignaddr	%o5, %o5, %l7
	.word	0x973b400d	! t0_kref+0x1f8:   	sra	%o5, %o5, %o3
	.word	0xbda6885e	! t0_kref+0x1fc:   	faddd	%f26, %f30, %f30
	.word	0xec871018	! t0_kref+0x200:   	lda	[%i4 + %i0]0x80, %l6
	.word	0xea0e7fec	! t0_kref+0x204:   	ldub	[%i1 - 0x14], %l5
	.word	0x81ae8ada	! t0_kref+0x208:   	fcmped	%fcc0, %f26, %f26
	.word	0xd408a03e	! t0_kref+0x20c:   	ldub	[%g2 + 0x3e], %o2
	.word	0xae23400d	! t0_kref+0x210:   	sub	%o5, %o5, %l7
	.word	0xfb20a008	! t0_kref+0x214:   	st	%f29, [%g2 + 8]
	.word	0xadb3408d	! t0_kref+0x218:   	edge16	%o5, %o5, %l6
	.word	0xb9b6cfbd	! t0_kref+0x21c:   	fors	%f27, %f29, %f28
	.word	0xebee101d	! t0_kref+0x220:   	prefetcha	%i0 + %i5, 21
	.word	0xb5b6cdbb	! t0_kref+0x224:   	fxors	%f27, %f27, %f26
	.word	0xa9b3408d	! t0_kref+0x228:   	edge16	%o5, %o5, %l4
	.word	0xfd1fbeb8	! t0_kref+0x22c:   	ldd	[%fp - 0x148], %f30
	.word	0xf99e5a1a	! t0_kref+0x230:   	ldda	[%i1 + %i2]0xd0, %f28
	.word	0xeec8a011	! t0_kref+0x234:   	ldsba	[%g2 + 0x11]%asi, %l7
	.word	0xa6937aec	! t0_kref+0x238:   	orcc	%o5, -0x514, %l3
	.word	0xd4060000	! t0_kref+0x23c:   	ld	[%i0], %o2
	.word	0xac937df8	! t0_kref+0x240:   	orcc	%o5, -0x208, %l6
	.word	0xb5a649bb	! t0_kref+0x244:   	fdivs	%f25, %f27, %f26
	.word	0xec4e8019	! t0_kref+0x248:   	ldsb	[%i2 + %i1], %l6
	.word	0xb7a0189a	! t0_kref+0x24c:   	fitos	%f26, %f27
	.word	0xf1be1a1b	! t0_kref+0x250:   	stda	%f24, [%i0 + %i3]0xd0
	.word	0xe80e4000	! t0_kref+0x254:   	ldub	[%i1], %l4
	.word	0xe8163fe2	! t0_kref+0x258:   	lduh	[%i0 - 0x1e], %l4
	.word	0xc7e8a082	! t0_kref+0x25c:   	prefetcha	%g2 + 0x82, 3
	.word	0xee0e3ff2	! t0_kref+0x260:   	ldub	[%i0 - 0xe], %l7
	.word	0xb9a609b8	! t0_kref+0x264:   	fdivs	%f24, %f24, %f28
	.word	0xb9a749bb	! t0_kref+0x268:   	fdivs	%f29, %f27, %f28
	.word	0xadb3434d	! t0_kref+0x26c:   	alignaddrl	%o5, %o5, %l6
	.word	0xb1b706ba	! t0_kref+0x270:   	fmul8x16al	%f28, %f26, %f24
	.word	0xeed6105b	! t0_kref+0x274:   	ldsha	[%i0 + %i3]0x82, %l7
	.word	0xb1b6091c	! t0_kref+0x278:   	faligndata	%f24, %f28, %f24
	.word	0x96a3674b	! t0_kref+0x27c:   	subcc	%o5, 0x74b, %o3
	.word	0xbda0003a	! t0_kref+0x280:   	fmovs	%f26, %f30
	.word	0xb9a0003d	! t0_kref+0x284:   	fmovs	%f29, %f28
	.word	0xbdb009be	! t0_kref+0x288:   	fexpand	%f30, %f30
	.word	0xef68a045	! t0_kref+0x28c:   	prefetch	%g2 + 0x45, 23
	.word	0xb3a0053c	! t0_kref+0x290:   	fsqrts	%f28, %f25
	.word	0x91b3404d	! t0_kref+0x294:   	edge8l	%o5, %o5, %o0
	.word	0xd60e7fe3	! t0_kref+0x298:   	ldub	[%i1 - 0x1d], %o3
	.word	0x92db6deb	! t0_kref+0x29c:   	smulcc	%o5, 0xdeb, %o1
	.word	0xd640a020	! t0_kref+0x2a0:   	ldsw	[%g2 + 0x20], %o3
	.word	0xecee3ff5	! t0_kref+0x2a4:   	ldstuba	[%i0 - 0xb]%asi, %l6
	.word	0xc3e8a080	! t0_kref+0x2a8:   	prefetcha	%g2 + 0x80, 1
	.word	0xa7b3410d	! t0_kref+0x2ac:   	edge32	%o5, %o5, %l3
	.word	0x3f800005	! t0_kref+0x2b0:   	fbo,a	_kref+0x2c4
	.word	0xb7b7cf79	! t0_kref+0x2b4:   	fornot1s	%f31, %f25, %f27
	.word	0xb1b6cea0	! t0_kref+0x2b8:   	fsrc1s	%f27, %f24
	.word	0xb3a649be	! t0_kref+0x2bc:   	fdivs	%f25, %f30, %f25
	.word	0xd200a004	! t0_kref+0x2c0:   	ld	[%g2 + 4], %o1
	.word	0xea0e201d	! t0_kref+0x2c4:   	ldub	[%i0 + 0x1d], %l5
	.word	0xec0e2019	! t0_kref+0x2c8:   	ldub	[%i0 + 0x19], %l6
	.word	0x91400000	! t0_kref+0x2cc:   	mov	%y, %o0
	.word	0xea4e6011	! t0_kref+0x2d0:   	ldsb	[%i1 + 0x11], %l5
	.word	0xb1a0055e	! t0_kref+0x2d4:   	fsqrtd	%f30, %f24
	.word	0xd40e001a	! t0_kref+0x2d8:   	ldub	[%i0 + %i2], %o2
	.word	0xb5b786dc	! t0_kref+0x2dc:   	fmul8sux16	%f30, %f28, %f26
	.word	0xd6000019	! t0_kref+0x2e0:   	ld	[%g0 + %i1], %o3
	.word	0xd6162006	! t0_kref+0x2e4:   	lduh	[%i0 + 6], %o3
	.word	0x85837d86	! t0_kref+0x2e8:   	wr	%o5, 0xfffffd86, %ccr
	.word	0x81834000	! t0_kref+0x2ec:   	wr	%o5, %g0, %y
	.word	0xf380a010	! t0_kref+0x2f0:   	lda	[%g2 + 0x10]%asi, %f25
	.word	0xf99e1a1d	! t0_kref+0x2f4:   	ldda	[%i0 + %i5]0xd0, %f28
	.word	0xb5b78918	! t0_kref+0x2f8:   	faligndata	%f30, %f24, %f26
	.word	0xbdb70fbc	! t0_kref+0x2fc:   	fors	%f28, %f28, %f30
	.word	0xd0070019	! t0_kref+0x300:   	ld	[%i4 + %i1], %o0
	.word	0xe690a01e	! t0_kref+0x304:   	lduha	[%g2 + 0x1e]%asi, %l3
	.word	0xbdb00cda	! t0_kref+0x308:   	fnot2	%f26, %f30
	.word	0xbda01919	! t0_kref+0x30c:   	fitod	%f25, %f30
	.word	0xbda709b9	! t0_kref+0x310:   	fdivs	%f28, %f25, %f30
	.word	0x86102009	! t0_kref+0x314:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0x318:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x31c:   	be,a	_kref+0x36c
	.word	0x81de0004	! t0_kref+0x320:   	flush	%i0 + %g4
	.word	0xbfa7c9bc	! t0_kref+0x324:   	fdivs	%f31, %f28, %f31
	call	SYM(t0_subr0)
	.word	0xdaa8a00d	! t0_kref+0x32c:   	stba	%o5, [%g2 + 0xd]%asi
	.word	0xfb80a038	! t0_kref+0x330:   	lda	[%g2 + 0x38]%asi, %f29
	.word	0xb1b00fc0	! t0_kref+0x334:   	fone	%f24
	.word	0xf1266018	! t0_kref+0x338:   	st	%f24, [%i1 + 0x18]
	.word	0xbda7c9bd	! t0_kref+0x33c:   	fdivs	%f31, %f29, %f30
	.word	0xb5a00558	! t0_kref+0x340:   	fsqrtd	%f24, %f26
	.word	0xbbb00f3a	! t0_kref+0x344:   	fsrc2s	%f26, %f29
	.word	0x85836e11	! t0_kref+0x348:   	wr	%o5, 0xe11, %ccr
	.word	0xd4c8a00e	! t0_kref+0x34c:   	ldsba	[%g2 + 0xe]%asi, %o2
	.word	0xabb3404d	! t0_kref+0x350:   	edge8l	%o5, %o5, %l5
	.word	0xae83400d	! t0_kref+0x354:   	addcc	%o5, %o5, %l7
	.word	0xd0c0a008	! t0_kref+0x358:   	ldswa	[%g2 + 8]%asi, %o0
	.word	0xbfb68d39	! t0_kref+0x35c:   	fandnot1s	%f26, %f25, %f31
	.word	0xd40e200b	! t0_kref+0x360:   	ldub	[%i0 + 0xb], %o2
	.word	0xea16401b	! t0_kref+0x364:   	lduh	[%i1 + %i3], %l5
	.word	0xb5b7899a	! t0_kref+0x368:   	bshuffle	%f30, %f26, %f26
	.word	0xd080a01c	! t0_kref+0x36c:   	lda	[%g2 + 0x1c]%asi, %o0
	.word	0xb9b606fe	! t0_kref+0x370:   	fmul8ulx16	%f24, %f30, %f28
	.word	0xbfb74db9	! t0_kref+0x374:   	fxors	%f29, %f25, %f31
	.word	0xd40e0000	! t0_kref+0x378:   	ldub	[%i0], %o2
	.word	0xd6167fe2	! t0_kref+0x37c:   	lduh	[%i1 - 0x1e], %o3
	.word	0xec070019	! t0_kref+0x380:   	ld	[%i4 + %i1], %l6
	.word	0xcc39401d	! t0_kref+0x384:   	std	%g6, [%g5 + %i5]
	.word	0xaab36342	! t0_kref+0x388:   	orncc	%o5, 0x342, %l5
	.word	0xbba689bb	! t0_kref+0x38c:   	fdivs	%f26, %f27, %f29
	.word	0xd44e8019	! t0_kref+0x390:   	ldsb	[%i2 + %i1], %o2
	.word	0x2c800003	! t0_kref+0x394:   	bneg,a	_kref+0x3a0
	.word	0xe80e8018	! t0_kref+0x398:   	ldub	[%i2 + %i0], %l4
	.word	0xdaf6501d	! t0_kref+0x39c:   	stxa	%o5, [%i1 + %i5]0x80
	.word	0xbda0193a	! t0_kref+0x3a0:   	fstod	%f26, %f30
	.word	0xfda0a02c	! t0_kref+0x3a4:   	sta	%f30, [%g2 + 0x2c]%asi
	.word	0xbdb60998	! t0_kref+0x3a8:   	bshuffle	%f24, %f24, %f30
	.word	0xee0e8019	! t0_kref+0x3ac:   	ldub	[%i2 + %i1], %l7
	.word	0xd406401c	! t0_kref+0x3b0:   	ld	[%i1 + %i4], %o2
	.word	0xf320a01c	! t0_kref+0x3b4:   	st	%f25, [%g2 + 0x1c]
	.word	0xd2500018	! t0_kref+0x3b8:   	ldsh	[%g0 + %i0], %o1
	.word	0xb7a0189f	! t0_kref+0x3bc:   	fitos	%f31, %f27
	.word	0xd690a006	! t0_kref+0x3c0:   	lduha	[%g2 + 6]%asi, %o3
	.word	0xd616200a	! t0_kref+0x3c4:   	lduh	[%i0 + 0xa], %o3
	.word	0xe84e4000	! t0_kref+0x3c8:   	ldsb	[%i1], %l4
	.word	0xf91e6008	! t0_kref+0x3cc:   	ldd	[%i1 + 8], %f28
	call	SYM(t0_subr2)
	.word	0xf11e7ff0	! t0_kref+0x3d4:   	ldd	[%i1 - 0x10], %f24
	.word	0x85836bd3	! t0_kref+0x3d8:   	wr	%o5, 0xbd3, %ccr
	.word	0xbda0003f	! t0_kref+0x3dc:   	fmovs	%f31, %f30
	.word	0xdaa8a02e	! t0_kref+0x3e0:   	stba	%o5, [%g2 + 0x2e]%asi
	.word	0x93b3416d	! t0_kref+0x3e4:   	edge32ln	%o5, %o5, %o1
	.word	0xbda649bd	! t0_kref+0x3e8:   	fdivs	%f25, %f29, %f30
	.word	0xbdb68e80	! t0_kref+0x3ec:   	fsrc1	%f26, %f30
	.word	0xea4e8019	! t0_kref+0x3f0:   	ldsb	[%i2 + %i1], %l5
	.word	0xd416c019	! t0_kref+0x3f4:   	lduh	[%i3 + %i1], %o2
	.word	0xe856201c	! t0_kref+0x3f8:   	ldsh	[%i0 + 0x1c], %l4
	.word	0xd2c0a03c	! t0_kref+0x3fc:   	ldswa	[%g2 + 0x3c]%asi, %o1
	.word	0xaf70000d	! t0_kref+0x400:   	popc	%o5, %l7
	.word	0xee563ffc	! t0_kref+0x404:   	ldsh	[%i0 - 4], %l7
	.word	0xa6fb400d	! t0_kref+0x408:   	sdivcc	%o5, %o5, %l3
	.word	0xda28a028	! t0_kref+0x40c:   	stb	%o5, [%g2 + 0x28]
	.word	0x9fc10000	! t0_kref+0x410:   	call	%g4
	.word	0xdab0a006	! t0_kref+0x414:   	stha	%o5, [%g2 + 6]%asi
	.word	0xbda789b8	! t0_kref+0x418:   	fdivs	%f30, %f24, %f30
	.word	0xffa0a00c	! t0_kref+0x41c:   	sta	%f31, [%g2 + 0xc]%asi
	.word	0xea00a018	! t0_kref+0x420:   	ld	[%g2 + 0x18], %l5
	.word	0x86102020	! t0_kref+0x424:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0x428:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x42c:   	be,a	_kref+0x458
	.word	0x905b7903	! t0_kref+0x430:   	smul	%o5, -0x6fd, %o0
	.word	0xaabb6dbd	! t0_kref+0x434:   	xnorcc	%o5, 0xdbd, %l5
	.word	0x3ebffffc	! t0_kref+0x438:   	bvc,a	_kref+0x428
	.word	0xb9a7c9ba	! t0_kref+0x43c:   	fdivs	%f31, %f26, %f28
	.word	0xd24e401a	! t0_kref+0x440:   	ldsb	[%i1 + %i2], %o1
	.word	0xad418000	! t0_kref+0x444:   	mov	%fprs, %l6
	.word	0xe8062014	! t0_kref+0x448:   	ld	[%i0 + 0x14], %l4
	.word	0xb9b60ddc	! t0_kref+0x44c:   	fnand	%f24, %f28, %f28
	.word	0xf920a02c	! t0_kref+0x450:   	st	%f28, [%g2 + 0x2c]
	.word	0xf1be584d	! t0_kref+0x454:   	stda	%f24, [%i1 + %o5]0xc2
	.word	0xea0e4000	! t0_kref+0x458:   	ldub	[%i1], %l5
	.word	0xb810200c	! t0_kref+0x45c:   	mov	0xc, %i4
	.word	0xda20a010	! t0_kref+0x460:   	st	%o5, [%g2 + 0x10]
	.word	0xb7a00138	! t0_kref+0x464:   	fabss	%f24, %f27
	.word	0xfd1fbd30	! t0_kref+0x468:   	ldd	[%fp - 0x2d0], %f30
	.word	0xfd062008	! t0_kref+0x46c:   	ld	[%i0 + 8], %f30
	.word	0x85836791	! t0_kref+0x470:   	wr	%o5, 0x791, %ccr
	.word	0xe648a021	! t0_kref+0x474:   	ldsb	[%g2 + 0x21], %l3
	.word	0xbdb706fa	! t0_kref+0x478:   	fmul8ulx16	%f28, %f26, %f30
	.word	0xdaa0a038	! t0_kref+0x47c:   	sta	%o5, [%g2 + 0x38]%asi
	.word	0xe6000019	! t0_kref+0x480:   	ld	[%g0 + %i1], %l3
	.word	0xec4e6009	! t0_kref+0x484:   	ldsb	[%i1 + 9], %l6
	.word	0xb1b7899c	! t0_kref+0x488:   	bshuffle	%f30, %f28, %f24
	.word	0xd2963fea	! t0_kref+0x48c:   	lduha	[%i0 - 0x16]%asi, %o1
	.word	0xd40e2000	! t0_kref+0x490:   	ldub	[%i0], %o2
	.word	0xd20e8018	! t0_kref+0x494:   	ldub	[%i2 + %i0], %o1
	.word	0xdaa0a01c	! t0_kref+0x498:   	sta	%o5, [%g2 + 0x1c]%asi
	.word	0xda30a022	! t0_kref+0x49c:   	sth	%o5, [%g2 + 0x22]
	.word	0xb9a649bf	! t0_kref+0x4a0:   	fdivs	%f25, %f31, %f28
	.word	0x977031ab	! t0_kref+0x4a4:   	popc	-0xe55, %o3
	.word	0xb1a0191b	! t0_kref+0x4a8:   	fitod	%f27, %f24
	.word	0xadb3410d	! t0_kref+0x4ac:   	edge32	%o5, %o5, %l6
	.word	0xbbb60a7d	! t0_kref+0x4b0:   	fpadd32s	%f24, %f29, %f29
	.word	0xd00e3fe3	! t0_kref+0x4b4:   	ldub	[%i0 - 0x1d], %o0
	.word	0xd4070018	! t0_kref+0x4b8:   	ld	[%i4 + %i0], %o2
	.word	0xac0b400d	! t0_kref+0x4bc:   	and	%o5, %o5, %l6
	.word	0xe80e8019	! t0_kref+0x4c0:   	ldub	[%i2 + %i1], %l4
	.word	0xf1bf1a18	! t0_kref+0x4c4:   	stda	%f24, [%i4 + %i0]0xd0
	.word	0x81afca3b	! t0_kref+0x4c8:   	fcmps	%fcc0, %f31, %f27
	.word	0xf9000019	! t0_kref+0x4cc:   	ld	[%g0 + %i1], %f28
	.word	0xa6f36461	! t0_kref+0x4d0:   	udivcc	%o5, 0x461, %l3
	.word	0xf91e4000	! t0_kref+0x4d4:   	ldd	[%i1], %f28
	.word	0xdaa8a023	! t0_kref+0x4d8:   	stba	%o5, [%g2 + 0x23]%asi
	.word	0xf9be588d	! t0_kref+0x4dc:   	stda	%f28, [%i1 + %o5]0xc4
	.word	0xe688a01a	! t0_kref+0x4e0:   	lduba	[%g2 + 0x1a]%asi, %l3
	.word	0x913b400d	! t0_kref+0x4e4:   	sra	%o5, %o5, %o0
	.word	0x927b6b5b	! t0_kref+0x4e8:   	sdiv	%o5, 0xb5b, %o1
	.word	0xd2d0a008	! t0_kref+0x4ec:   	ldsha	[%g2 + 8]%asi, %o1
	.word	0xdaf62000	! t0_kref+0x4f0:   	stxa	%o5, [%i0]%asi
	.word	0xb1a0053f	! t0_kref+0x4f4:   	fsqrts	%f31, %f24
	.word	0xb5b68e80	! t0_kref+0x4f8:   	fsrc1	%f26, %f26
	.word	0xdaa8a003	! t0_kref+0x4fc:   	stba	%o5, [%g2 + 3]%asi
	.word	0xb9a0055e	! t0_kref+0x500:   	fsqrtd	%f30, %f28
	.word	0xbdb70e5c	! t0_kref+0x504:   	fxnor	%f28, %f28, %f30
	.word	0xec4e2005	! t0_kref+0x508:   	ldsb	[%i0 + 5], %l6
	.word	0xb1a708dc	! t0_kref+0x50c:   	fsubd	%f28, %f28, %f24
	.word	0xea4e4000	! t0_kref+0x510:   	ldsb	[%i1], %l5
	.word	0xbdb00fc0	! t0_kref+0x514:   	fone	%f30
	.word	0xe616401b	! t0_kref+0x518:   	lduh	[%i1 + %i3], %l3
	.word	0xe6c0a004	! t0_kref+0x51c:   	ldswa	[%g2 + 4]%asi, %l3
	.word	0xb1a018de	! t0_kref+0x520:   	fdtos	%f30, %f24
	.word	0xb5b60d9a	! t0_kref+0x524:   	fxor	%f24, %f26, %f26
	.word	0xb5a789b9	! t0_kref+0x528:   	fdivs	%f30, %f25, %f26
	.word	0xee0e001a	! t0_kref+0x52c:   	ldub	[%i0 + %i2], %l7
	.word	0xb9b6875a	! t0_kref+0x530:   	fpack32	%f26, %f26, %f28
	.word	0xb5b00cdc	! t0_kref+0x534:   	fnot2	%f28, %f26
	.word	0xbdb60d60	! t0_kref+0x538:   	fnot1s	%f24, %f30
	.word	0x93408000	! t0_kref+0x53c:   	mov	%ccr, %o1
	.word	0xbbb74a7f	! t0_kref+0x540:   	fpadd32s	%f29, %f31, %f29
	.word	0xda264000	! t0_kref+0x544:   	st	%o5, [%i1]
	.word	0xb1a608d8	! t0_kref+0x548:   	fsubd	%f24, %f24, %f24
	.word	0xfb80a028	! t0_kref+0x54c:   	lda	[%g2 + 0x28]%asi, %f29
	.word	0xf51e6018	! t0_kref+0x550:   	ldd	[%i1 + 0x18], %f26
	.word	0xda263ff4	! t0_kref+0x554:   	st	%o5, [%i0 - 0xc]
	.word	0xd6166014	! t0_kref+0x558:   	lduh	[%i1 + 0x14], %o3
	.word	0xf11e6000	! t0_kref+0x55c:   	ldd	[%i1], %f24
	.word	0xf1180018	! t0_kref+0x560:   	ldd	[%g0 + %i0], %f24
	.word	0xdaf01018	! t0_kref+0x564:   	stxa	%o5, [%g0 + %i0]0x80
	.word	0xb1b68a1e	! t0_kref+0x568:   	fpadd16	%f26, %f30, %f24
	.word	0xbdb60eda	! t0_kref+0x56c:   	fornot2	%f24, %f26, %f30
	.word	0xb5a00558	! t0_kref+0x570:   	fsqrtd	%f24, %f26
	.word	0xb7b00cf9	! t0_kref+0x574:   	fnot2s	%f25, %f27
	.word	0xb3a749bc	! t0_kref+0x578:   	fdivs	%f29, %f28, %f25
	.word	0xda28a000	! t0_kref+0x57c:   	stb	%o5, [%g2]
	.word	0xd00e6001	! t0_kref+0x580:   	ldub	[%i1 + 1], %o0
	.word	0xd00e401a	! t0_kref+0x584:   	ldub	[%i1 + %i2], %o0
	.word	0xa7418000	! t0_kref+0x588:   	mov	%fprs, %l3
	.word	0xb1a6c9be	! t0_kref+0x58c:   	fdivs	%f27, %f30, %f24
	.word	0xbfa648b9	! t0_kref+0x590:   	fsubs	%f25, %f25, %f31
	.word	0x962b6dda	! t0_kref+0x594:   	andn	%o5, 0xdda, %o3
	.word	0x93b3432d	! t0_kref+0x598:   	bmask	%o5, %o5, %o1
	.word	0xb9b7c679	! t0_kref+0x59c:   	fmul8x16au	%f31, %f25, %f28
	.word	0xb9b6899e	! t0_kref+0x5a0:   	bshuffle	%f26, %f30, %f28
	.word	0x81db2e2c	! t0_kref+0x5a4:   	flush	%o4 + 0xe2c
	.word	0xea56200e	! t0_kref+0x5a8:   	ldsh	[%i0 + 0xe], %l5
	.word	0xfd80a03c	! t0_kref+0x5ac:   	lda	[%g2 + 0x3c]%asi, %f30
	.word	0xd04e7ff0	! t0_kref+0x5b0:   	ldsb	[%i1 - 0x10], %o0
	.word	0xd0162002	! t0_kref+0x5b4:   	lduh	[%i0 + 2], %o0
	.word	0xea16200a	! t0_kref+0x5b8:   	lduh	[%i0 + 0xa], %l5
	.word	0x29022dbd	! t0_kref+0x5bc:   	sethi	%hi(0x8b6f400), %l4
	.word	0xea50a03c	! t0_kref+0x5c0:   	ldsh	[%g2 + 0x3c], %l5
	.word	0xdaa0a000	! t0_kref+0x5c4:   	sta	%o5, [%g2]%asi
	.word	0xd080a008	! t0_kref+0x5c8:   	lda	[%g2 + 8]%asi, %o0
	.word	0xb1a0053a	! t0_kref+0x5cc:   	fsqrts	%f26, %f24
	.word	0xe856401b	! t0_kref+0x5d0:   	ldsh	[%i1 + %i3], %l4
	.word	0xb5a0055a	! t0_kref+0x5d4:   	fsqrtd	%f26, %f26
	.word	0xf99f5a59	! t0_kref+0x5d8:   	ldda	[%i5 + %i1]0xd2, %f28
	.word	0xb5b78dda	! t0_kref+0x5dc:   	fnand	%f30, %f26, %f26
	.word	0xad400000	! t0_kref+0x5e0:   	mov	%y, %l6
	.word	0xe64e4000	! t0_kref+0x5e4:   	ldsb	[%i1], %l3
	.word	0x90236240	! t0_kref+0x5e8:   	sub	%o5, 0x240, %o0
	.word	0xe6062000	! t0_kref+0x5ec:   	ld	[%i0], %l3
	.word	0xd488a036	! t0_kref+0x5f0:   	lduba	[%g2 + 0x36]%asi, %o2
	.word	0xdab6101b	! t0_kref+0x5f4:   	stha	%o5, [%i0 + %i3]0x80
	.word	0xaa837c8d	! t0_kref+0x5f8:   	addcc	%o5, -0x373, %l5
	.word	0xe856600a	! t0_kref+0x5fc:   	ldsh	[%i1 + 0xa], %l4
	.word	0xab400000	! t0_kref+0x600:   	mov	%y, %l5
	.word	0xbba649bb	! t0_kref+0x604:   	fdivs	%f25, %f27, %f29
	.word	0xb1b686fc	! t0_kref+0x608:   	fmul8ulx16	%f26, %f28, %f24
	.word	0xea7e2004	! t0_kref+0x60c:   	swap	[%i0 + 4], %l5
	.word	0x81834000	! t0_kref+0x610:   	wr	%o5, %g0, %y
	.word	0xdaa0a014	! t0_kref+0x614:   	sta	%o5, [%g2 + 0x14]%asi
	.word	0x8143c000	! t0_kref+0x618:   	stbar
	.word	0xd2067fec	! t0_kref+0x61c:   	ld	[%i1 - 0x14], %o1
	.word	0xf91e2018	! t0_kref+0x620:   	ldd	[%i0 + 0x18], %f28
	.word	0xb7a6c9b8	! t0_kref+0x624:   	fdivs	%f27, %f24, %f27
	.word	0xec06200c	! t0_kref+0x628:   	ld	[%i0 + 0xc], %l6
	.word	0xbbb78c7e	! t0_kref+0x62c:   	fnors	%f30, %f30, %f29
	.word	0xbdb6075e	! t0_kref+0x630:   	fpack32	%f24, %f30, %f30
	.word	0xd4080019	! t0_kref+0x634:   	ldub	[%g0 + %i1], %o2
	.word	0xa9b605de	! t0_kref+0x638:   	fcmpeq32	%f24, %f30, %l4
	call	SYM(t0_subr1)
	.word	0xb9b7067c	! t0_kref+0x640:   	fmul8x16au	%f28, %f28, %f28
	.word	0xda76401d	! t0_kref+0x644:   	stx	%o5, [%i1 + %i5]
	.word	0x91408000	! t0_kref+0x648:   	mov	%ccr, %o0
	.word	0xd81e2000	! t0_kref+0x64c:   	ldd	[%i0], %o4
	.word	0xb1a789b9	! t0_kref+0x650:   	fdivs	%f30, %f25, %f24
	.word	0xdaf67fe0	! t0_kref+0x654:   	stxa	%o5, [%i1 - 0x20]%asi
	.word	0xb7a609bc	! t0_kref+0x658:   	fdivs	%f24, %f28, %f27
	.word	0xa8d3400d	! t0_kref+0x65c:   	umulcc	%o5, %o5, %l4
	.word	0xbda0003d	! t0_kref+0x660:   	fmovs	%f29, %f30
	.word	0xb1b7cea0	! t0_kref+0x664:   	fsrc1s	%f31, %f24
	.word	0x922b400d	! t0_kref+0x668:   	andn	%o5, %o5, %o1
	.word	0xdaa0a00c	! t0_kref+0x66c:   	sta	%o5, [%g2 + 0xc]%asi
	.word	0xb1b78ed8	! t0_kref+0x670:   	fornot2	%f30, %f24, %f24
	.word	0xd2480018	! t0_kref+0x674:   	ldsb	[%g0 + %i0], %o1
	.word	0xd6c0a024	! t0_kref+0x678:   	ldswa	[%g2 + 0x24]%asi, %o3
	.word	0xd20e3ff0	! t0_kref+0x67c:   	ldub	[%i0 - 0x10], %o1
	.word	0x9de3bfa0	! t0_kref+0x680:   	save	%sp, -0x60, %sp
	.word	0xba57337e	! t0_kref+0x684:   	umul	%i4, -0xc82, %i5
	.word	0xabee0019	! t0_kref+0x688:   	restore	%i0, %i1, %l5
	.word	0xd44e0000	! t0_kref+0x68c:   	ldsb	[%i0], %o2
	.word	0xd4163fee	! t0_kref+0x690:   	lduh	[%i0 - 0x12], %o2
	.word	0xb1b60e5c	! t0_kref+0x694:   	fxnor	%f24, %f28, %f24
	.word	0xd00e3ff1	! t0_kref+0x698:   	ldub	[%i0 - 0xf], %o0
	.word	0xd4d0a000	! t0_kref+0x69c:   	ldsha	[%g2]%asi, %o2
	.word	0xd4801018	! t0_kref+0x6a0:   	lda	[%g0 + %i0]0x80, %o2
	.word	0xea10a026	! t0_kref+0x6a4:   	lduh	[%g2 + 0x26], %l5
	.word	0x81af8a3f	! t0_kref+0x6a8:   	fcmps	%fcc0, %f30, %f31
	.word	0xbdb70f9e	! t0_kref+0x6ac:   	for	%f28, %f30, %f30
	.word	0xf520a028	! t0_kref+0x6b0:   	st	%f26, [%g2 + 0x28]
	.word	0x94f3400d	! t0_kref+0x6b4:   	udivcc	%o5, %o5, %o2
	.word	0xb3a709bd	! t0_kref+0x6b8:   	fdivs	%f28, %f29, %f25
	.word	0xbda0189d	! t0_kref+0x6bc:   	fitos	%f29, %f30
	.word	0xb9b70cbd	! t0_kref+0x6c0:   	fandnot2s	%f28, %f29, %f28
	.word	0xb7a6c9bd	! t0_kref+0x6c4:   	fdivs	%f27, %f29, %f27
	.word	0xb9b6871f	! t0_kref+0x6c8:   	fmuld8sux16	%f26, %f31, %f28
	.word	0xd4564000	! t0_kref+0x6cc:   	ldsh	[%i1], %o2
	.word	0xae9b400d	! t0_kref+0x6d0:   	xorcc	%o5, %o5, %l7
	.word	0x90f373dd	! t0_kref+0x6d4:   	udivcc	%o5, -0xc23, %o0
	.word	0xbba000bb	! t0_kref+0x6d8:   	fnegs	%f27, %f29
	.word	0xae83400d	! t0_kref+0x6dc:   	addcc	%o5, %o5, %l7
	.word	0xee48a00f	! t0_kref+0x6e0:   	ldsb	[%g2 + 0xf], %l7
	.word	0xe888a03a	! t0_kref+0x6e4:   	lduba	[%g2 + 0x3a]%asi, %l4
	.word	0x3e800004	! t0_kref+0x6e8:   	bvc,a	_kref+0x6f8
	.word	0x94036485	! t0_kref+0x6ec:   	add	%o5, 0x485, %o2
	.word	0xf5066018	! t0_kref+0x6f0:   	ld	[%i1 + 0x18], %f26
	.word	0xb1b6897f	! t0_kref+0x6f4:   	fpmerge	%f26, %f31, %f24
	.word	0xda780019	! t0_kref+0x6f8:   	swap	[%g0 + %i1], %o5
	.word	0xafb7851a	! t0_kref+0x6fc:   	fcmpgt16	%f30, %f26, %l7
	.word	0xbdb6067e	! t0_kref+0x700:   	fmul8x16au	%f24, %f30, %f30
	.word	0xe80e7ff4	! t0_kref+0x704:   	ldub	[%i1 - 0xc], %l4
	.word	0xae53400d	! t0_kref+0x708:   	umul	%o5, %o5, %l7
	.word	0xf9a0a004	! t0_kref+0x70c:   	sta	%f28, [%g2 + 4]%asi
	.word	0xd488a02b	! t0_kref+0x710:   	lduba	[%g2 + 0x2b]%asi, %o2
	.word	0x9fc10000	! t0_kref+0x714:   	call	%g4
	.word	0xa783400d	! t0_kref+0x718:   	wr	%o5, %o5, %gsr
	.word	0xbfb74e3b	! t0_kref+0x71c:   	fands	%f29, %f27, %f31
	.word	0x97b3432d	! t0_kref+0x720:   	bmask	%o5, %o5, %o3
	.word	0xb7b00f3b	! t0_kref+0x724:   	fsrc2s	%f27, %f27
	.word	0xd09e7fe8	! t0_kref+0x728:   	ldda	[%i1 - 0x18]%asi, %o0
	.word	0xb9a789bc	! t0_kref+0x72c:   	fdivs	%f30, %f28, %f28
	.word	0xec4e4000	! t0_kref+0x730:   	ldsb	[%i1], %l6
	.word	0xb1b00f1a	! t0_kref+0x734:   	fsrc2	%f26, %f24
	.word	0xe8c0a030	! t0_kref+0x738:   	ldswa	[%g2 + 0x30]%asi, %l4
	.word	0xb7b74dbb	! t0_kref+0x73c:   	fxors	%f29, %f27, %f27
	.word	0xb9a6c9ba	! t0_kref+0x740:   	fdivs	%f27, %f26, %f28
	.word	0xec162012	! t0_kref+0x744:   	lduh	[%i0 + 0x12], %l6
	.word	0xb1b68e5c	! t0_kref+0x748:   	fxnor	%f26, %f28, %f24
	.word	0x3e800006	! t0_kref+0x74c:   	bvc,a	_kref+0x764
	.word	0xafb3402d	! t0_kref+0x750:   	edge8n	%o5, %o5, %l7
	.word	0xf900a000	! t0_kref+0x754:   	ld	[%g2], %f28
	.word	0xe6566006	! t0_kref+0x758:   	ldsh	[%i1 + 6], %l3
	.word	0xd81e2008	! t0_kref+0x75c:   	ldd	[%i0 + 8], %o4
	.word	0xf786501c	! t0_kref+0x760:   	lda	[%i1 + %i4]0x80, %f27
	.word	0xaf33600e	! t0_kref+0x764:   	srl	%o5, 0xe, %l7
	.word	0xea90a034	! t0_kref+0x768:   	lduha	[%g2 + 0x34]%asi, %l5
	.word	0xda28a03f	! t0_kref+0x76c:   	stb	%o5, [%g2 + 0x3f]
	.word	0xf9be588d	! t0_kref+0x770:   	stda	%f28, [%i1 + %o5]0xc4
	.word	0xee06401c	! t0_kref+0x774:   	ld	[%i1 + %i4], %l7
	.word	0xacf368b8	! t0_kref+0x778:   	udivcc	%o5, 0x8b8, %l6
	.word	0xbda0055c	! t0_kref+0x77c:   	fsqrtd	%f28, %f30
	.word	0xb1a0191e	! t0_kref+0x780:   	fitod	%f30, %f24
	.word	0xb7a749bf	! t0_kref+0x784:   	fdivs	%f29, %f31, %f27
	.word	0x962b400d	! t0_kref+0x788:   	andn	%o5, %o5, %o3
	.word	0xbba689b8	! t0_kref+0x78c:   	fdivs	%f26, %f24, %f29
	.word	0xb5b00f1e	! t0_kref+0x790:   	fsrc2	%f30, %f26
	.word	0xf9000018	! t0_kref+0x794:   	ld	[%g0 + %i0], %f28
	.word	0xd0064000	! t0_kref+0x798:   	ld	[%i1], %o0
	.word	0xa7b68418	! t0_kref+0x79c:   	fcmple16	%f26, %f24, %l3
	.word	0xedf6500d	! t0_kref+0x7a0:   	casxa	[%i1]0x80, %o5, %l6
	.word	0xdaa8a01f	! t0_kref+0x7a4:   	stba	%o5, [%g2 + 0x1f]%asi
	.word	0xe80e0000	! t0_kref+0x7a8:   	ldub	[%i0], %l4
	.word	0xf980a02c	! t0_kref+0x7ac:   	lda	[%g2 + 0x2c]%asi, %f28
	.word	0xb9a649be	! t0_kref+0x7b0:   	fdivs	%f25, %f30, %f28
	.word	0xda30a034	! t0_kref+0x7b4:   	sth	%o5, [%g2 + 0x34]
	.word	0xb5b00cda	! t0_kref+0x7b8:   	fnot2	%f26, %f26
	.word	0xb9a000bd	! t0_kref+0x7bc:   	fnegs	%f29, %f28
	.word	0xea070018	! t0_kref+0x7c0:   	ld	[%i4 + %i0], %l5
	.word	0xd2062010	! t0_kref+0x7c4:   	ld	[%i0 + 0x10], %o1
	.word	0xfd1fbd80	! t0_kref+0x7c8:   	ldd	[%fp - 0x280], %f30
	.word	0x35800005	! t0_kref+0x7cc:   	fbue,a	_kref+0x7e0
	.word	0xb5b00f1c	! t0_kref+0x7d0:   	fsrc2	%f28, %f26
	.word	0xb5b009bd	! t0_kref+0x7d4:   	fexpand	%f29, %f26
	.word	0xb5a0191b	! t0_kref+0x7d8:   	fitod	%f27, %f26
	.word	0xd00e3ff9	! t0_kref+0x7dc:   	ldub	[%i0 - 7], %o0
	.word	0xbdb70738	! t0_kref+0x7e0:   	fmuld8ulx16	%f28, %f24, %f30
	.word	0xbfa01a3e	! t0_kref+0x7e4:   	fstoi	%f30, %f31
	.word	0x96f372b5	! t0_kref+0x7e8:   	udivcc	%o5, -0xd4b, %o3
	.word	0xabb68418	! t0_kref+0x7ec:   	fcmple16	%f26, %f24, %l5
	.word	0xf1a0a028	! t0_kref+0x7f0:   	sta	%f24, [%g2 + 0x28]%asi
	.word	0xea881018	! t0_kref+0x7f4:   	lduba	[%g0 + %i0]0x80, %l5
	.word	0xd4067fe0	! t0_kref+0x7f8:   	ld	[%i1 - 0x20], %o2
	.word	0xe84e200b	! t0_kref+0x7fc:   	ldsb	[%i0 + 0xb], %l4
	.word	0xf920a014	! t0_kref+0x800:   	st	%f28, [%g2 + 0x14]
	.word	0x001fffff	! t0_kref+0x804:   	illtrap	0x1fffff
	.word	0xd6064000	! t0_kref+0x808:   	ld	[%i1], %o3
	.word	0x86102003	! t0_kref+0x80c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x810:   	bne,a	_kref+0x810
	.word	0x86a0e001	! t0_kref+0x814:   	subcc	%g3, 1, %g3
	.word	0xb9a0055c	! t0_kref+0x818:   	fsqrtd	%f28, %f28
	.word	0x8d8375e1	! t0_kref+0x81c:   	wr	%o5, 0xfffff5e1, %fprs
	.word	0xda20a030	! t0_kref+0x820:   	st	%o5, [%g2 + 0x30]
	.word	0xd4462000	! t0_kref+0x824:   	ldsw	[%i0], %o2
	.word	0xbdb70e5e	! t0_kref+0x828:   	fxnor	%f28, %f30, %f30
	.word	0xe46e2003	! t0_kref+0x82c:   	ldstub	[%i0 + 3], %l2
	.word	0xb9b00f38	! t0_kref+0x830:   	fsrc2s	%f24, %f28
	.word	0xd2c0a008	! t0_kref+0x834:   	ldswa	[%g2 + 8]%asi, %o1
	.word	0xea80a02c	! t0_kref+0x838:   	lda	[%g2 + 0x2c]%asi, %l5
	.word	0x37800007	! t0_kref+0x83c:   	fbge,a	_kref+0x858
	.word	0xb9b6097a	! t0_kref+0x840:   	fpmerge	%f24, %f26, %f28
	.word	0xf9be5a5d	! t0_kref+0x844:   	stda	%f28, [%i1 + %i5]0xd2
	.word	0x93b7041e	! t0_kref+0x848:   	fcmple16	%f28, %f30, %o1
	.word	0xec080019	! t0_kref+0x84c:   	ldub	[%g0 + %i1], %l6
	.word	0xb3a709bb	! t0_kref+0x850:   	fdivs	%f28, %f27, %f25
	.word	0xd400a014	! t0_kref+0x854:   	ld	[%g2 + 0x14], %o2
	.word	0x91b3402d	! t0_kref+0x858:   	edge8n	%o5, %o5, %o0
	.word	0xea90a00a	! t0_kref+0x85c:   	lduha	[%g2 + 0xa]%asi, %l5
	.word	0xec4e001a	! t0_kref+0x860:   	ldsb	[%i0 + %i2], %l6
	.word	0xea0e0000	! t0_kref+0x864:   	ldub	[%i0], %l5
	.word	0xd81e6010	! t0_kref+0x868:   	ldd	[%i1 + 0x10], %o4
	.word	0x81afca3a	! t0_kref+0x86c:   	fcmps	%fcc0, %f31, %f26
	.word	0xbda00539	! t0_kref+0x870:   	fsqrts	%f25, %f30
	.word	0xae2b400d	! t0_kref+0x874:   	andn	%o5, %o5, %l7
	.word	0x3c800006	! t0_kref+0x878:   	bpos,a	_kref+0x890
	.word	0xe810a030	! t0_kref+0x87c:   	lduh	[%g2 + 0x30], %l4
	.word	0xa683400d	! t0_kref+0x880:   	addcc	%o5, %o5, %l3
	.word	0xdaa0a010	! t0_kref+0x884:   	sta	%o5, [%g2 + 0x10]%asi
	.word	0x902b400d	! t0_kref+0x888:   	andn	%o5, %o5, %o0
	.word	0x8583400d	! t0_kref+0x88c:   	wr	%o5, %o5, %ccr
	.word	0xbdb00cd8	! t0_kref+0x890:   	fnot2	%f24, %f30
	.word	0xa893400d	! t0_kref+0x894:   	orcc	%o5, %o5, %l4
	.word	0x95702894	! t0_kref+0x898:   	popc	0x894, %o2
	.word	0xd4d01018	! t0_kref+0x89c:   	ldsha	[%g0 + %i0]0x80, %o2
	.word	0xe83e6018	! t0_kref+0x8a0:   	std	%l4, [%i1 + 0x18]
	.word	0x36800005	! t0_kref+0x8a4:   	bge,a	_kref+0x8b8
	.word	0x95b3432d	! t0_kref+0x8a8:   	bmask	%o5, %o5, %o2
	.word	0xda30a036	! t0_kref+0x8ac:   	sth	%o5, [%g2 + 0x36]
	.word	0xaa7b6464	! t0_kref+0x8b0:   	sdiv	%o5, 0x464, %l5
	.word	0xbfa0189e	! t0_kref+0x8b4:   	fitos	%f30, %f31
	.word	0xadb3404d	! t0_kref+0x8b8:   	edge8l	%o5, %o5, %l6
	.word	0xebee101c	! t0_kref+0x8bc:   	prefetcha	%i0 + %i4, 21
	.word	0xf1070018	! t0_kref+0x8c0:   	ld	[%i4 + %i0], %f24
	.word	0xa8fb400d	! t0_kref+0x8c4:   	sdivcc	%o5, %o5, %l4
	.word	0xba102018	! t0_kref+0x8c8:   	mov	0x18, %i5
	.word	0xda28a03f	! t0_kref+0x8cc:   	stb	%o5, [%g2 + 0x3f]
	.word	0xd650a02e	! t0_kref+0x8d0:   	ldsh	[%g2 + 0x2e], %o3
	.word	0xb5a0055a	! t0_kref+0x8d4:   	fsqrtd	%f26, %f26
	.word	0xf51f4018	! t0_kref+0x8d8:   	ldd	[%i5 + %i0], %f26
	.word	0x81834000	! t0_kref+0x8dc:   	wr	%o5, %g0, %y
	.word	0x81ae0adc	! t0_kref+0x8e0:   	fcmped	%fcc0, %f24, %f28
	.word	0xb5a708da	! t0_kref+0x8e4:   	fsubd	%f28, %f26, %f26
	.word	0xd00e6019	! t0_kref+0x8e8:   	ldub	[%i1 + 0x19], %o0
	.word	0xafb34240	! t0_kref+0x8ec:   	array16	%o5, %g0, %l7
	.word	0x9fc00004	! t0_kref+0x8f0:   	call	%g0 + %g4
	.word	0xdaa6601c	! t0_kref+0x8f4:   	sta	%o5, [%i1 + 0x1c]%asi
	.word	0xfd20a028	! t0_kref+0x8f8:   	st	%f30, [%g2 + 0x28]
	.word	0xf51e001d	! t0_kref+0x8fc:   	ldd	[%i0 + %i5], %f26
	.word	0xb5a00538	! t0_kref+0x900:   	fsqrts	%f24, %f26
	.word	0xd4000018	! t0_kref+0x904:   	ld	[%g0 + %i0], %o2
	.word	0xbda608bd	! t0_kref+0x908:   	fsubs	%f24, %f29, %f30
	.word	0xfd06401c	! t0_kref+0x90c:   	ld	[%i1 + %i4], %f30
	.word	0xbba0003a	! t0_kref+0x910:   	fmovs	%f26, %f29
	.word	0xe8060000	! t0_kref+0x914:   	ld	[%i0], %l4
	.word	0xbdb6075a	! t0_kref+0x918:   	fpack32	%f24, %f26, %f30
	.word	0xaa5b400d	! t0_kref+0x91c:   	smul	%o5, %o5, %l5
	.word	0xae6370c3	! t0_kref+0x920:   	subc	%o5, -0xf3d, %l7
	.word	0xfd1e7fe0	! t0_kref+0x924:   	ldd	[%i1 - 0x20], %f30
	.word	0xdaa8a033	! t0_kref+0x928:   	stba	%o5, [%g2 + 0x33]%asi
	.word	0xae5b400d	! t0_kref+0x92c:   	smul	%o5, %o5, %l7
	.word	0xa9b6041e	! t0_kref+0x930:   	fcmple16	%f24, %f30, %l4
	.word	0xdaa8a019	! t0_kref+0x934:   	stba	%o5, [%g2 + 0x19]%asi
	.word	0xfd000019	! t0_kref+0x938:   	ld	[%g0 + %i1], %f30
	.word	0xdab0a038	! t0_kref+0x93c:   	stha	%o5, [%g2 + 0x38]%asi
	.word	0xd090a012	! t0_kref+0x940:   	lduha	[%g2 + 0x12]%asi, %o0
	.word	0xfd180019	! t0_kref+0x944:   	ldd	[%g0 + %i1], %f30
	.word	0xd0180019	! t0_kref+0x948:   	ldd	[%g0 + %i1], %o0
	.word	0xd208a024	! t0_kref+0x94c:   	ldub	[%g2 + 0x24], %o1
	.word	0xea0e6017	! t0_kref+0x950:   	ldub	[%i1 + 0x17], %l5
	.word	0xda20a014	! t0_kref+0x954:   	st	%o5, [%g2 + 0x14]
	.word	0x91408000	! t0_kref+0x958:   	mov	%ccr, %o0
	.word	0x81580000	! t0_kref+0x95c:   	flushw
	.word	0x91703299	! t0_kref+0x960:   	popc	-0xd67, %o0
	.word	0xe968a00b	! t0_kref+0x964:   	prefetch	%g2 + 0xb, 20
	.word	0x9133400d	! t0_kref+0x968:   	srl	%o5, %o5, %o0
	.word	0x81af8a5a	! t0_kref+0x96c:   	fcmpd	%fcc0, %f30, %f26
	.word	0xe80e2016	! t0_kref+0x970:   	ldub	[%i0 + 0x16], %l4
	.word	0x96336977	! t0_kref+0x974:   	orn	%o5, 0x977, %o3
	.word	0xbfa0053f	! t0_kref+0x978:   	fsqrts	%f31, %f31
	.word	0xfd80a028	! t0_kref+0x97c:   	lda	[%g2 + 0x28]%asi, %f30
	.word	0x9fc10000	! t0_kref+0x980:   	call	%g4
	.word	0xb3a609bf	! t0_kref+0x984:   	fdivs	%f24, %f31, %f25
	.word	0xd81e001d	! t0_kref+0x988:   	ldd	[%i0 + %i5], %o4
	.word	0xb1b64a7a	! t0_kref+0x98c:   	fpadd32s	%f25, %f26, %f24
	.word	0xdaa0a030	! t0_kref+0x990:   	sta	%o5, [%g2 + 0x30]%asi
	.word	0xda20a01c	! t0_kref+0x994:   	st	%o5, [%g2 + 0x1c]
	.word	0xbfb68cbc	! t0_kref+0x998:   	fandnot2s	%f26, %f28, %f31
	.word	0xf5a0a008	! t0_kref+0x99c:   	sta	%f26, [%g2 + 8]%asi
	.word	0xfd80a020	! t0_kref+0x9a0:   	lda	[%g2 + 0x20]%asi, %f30
	.word	0xb1b787de	! t0_kref+0x9a4:   	pdist	%f30, %f30, %f24
	.word	0xf900a01c	! t0_kref+0x9a8:   	ld	[%g2 + 0x1c], %f28
	.word	0xe8c8a001	! t0_kref+0x9ac:   	ldsba	[%g2 + 1]%asi, %l4
	.word	0xaef3400d	! t0_kref+0x9b0:   	udivcc	%o5, %o5, %l7
	.word	0xd4480018	! t0_kref+0x9b4:   	ldsb	[%g0 + %i0], %o2
	.word	0xd680a038	! t0_kref+0x9b8:   	lda	[%g2 + 0x38]%asi, %o3
	.word	0xb9a689b8	! t0_kref+0x9bc:   	fdivs	%f26, %f24, %f28
	.word	0xb1b6c97f	! t0_kref+0x9c0:   	fpmerge	%f27, %f31, %f24
	.word	0xaafb7153	! t0_kref+0x9c4:   	sdivcc	%o5, -0xead, %l5
	.word	0x96837058	! t0_kref+0x9c8:   	addcc	%o5, -0xfa8, %o3
	.word	0xd4066000	! t0_kref+0x9cc:   	ld	[%i1], %o2
	.word	0xadb3410d	! t0_kref+0x9d0:   	edge32	%o5, %o5, %l6
	.word	0xec4e401a	! t0_kref+0x9d4:   	ldsb	[%i1 + %i2], %l6
	.word	0xb9b7467f	! t0_kref+0x9d8:   	fmul8x16au	%f29, %f31, %f28
	.word	0xfb80a01c	! t0_kref+0x9dc:   	lda	[%g2 + 0x1c]%asi, %f29
	.word	0xd456c019	! t0_kref+0x9e0:   	ldsh	[%i3 + %i1], %o2
	.word	0xbba7c83e	! t0_kref+0x9e4:   	fadds	%f31, %f30, %f29
	.word	0xf11e0000	! t0_kref+0x9e8:   	ldd	[%i0], %f24
	.word	0xbda789b9	! t0_kref+0x9ec:   	fdivs	%f30, %f25, %f30
	.word	0xb1b68adc	! t0_kref+0x9f0:   	fpsub32	%f26, %f28, %f24
	.word	0xe41e2008	! t0_kref+0x9f4:   	ldd	[%i0 + 8], %l2
	.word	0xf300a02c	! t0_kref+0x9f8:   	ld	[%g2 + 0x2c], %f25
	.word	0x17344d3a	! t0_kref+0x9fc:   	sethi	%hi(0xd134e800), %o3
	.word	0xac3b400d	! t0_kref+0xa00:   	xnor	%o5, %o5, %l6
	.word	0xbfa0053a	! t0_kref+0xa04:   	fsqrts	%f26, %f31
	.word	0xd2063fe4	! t0_kref+0xa08:   	ld	[%i0 - 0x1c], %o1
	.word	0xea88a038	! t0_kref+0xa0c:   	lduba	[%g2 + 0x38]%asi, %l5
	.word	0xee90a004	! t0_kref+0xa10:   	lduha	[%g2 + 4]%asi, %l7
	.word	0xec10a01c	! t0_kref+0xa14:   	lduh	[%g2 + 0x1c], %l6
	.word	0xd288a03a	! t0_kref+0xa18:   	lduba	[%g2 + 0x3a]%asi, %o1
	.word	0xd60e601f	! t0_kref+0xa1c:   	ldub	[%i1 + 0x1f], %o3
	.word	0x86102001	! t0_kref+0xa20:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xa24:   	bne,a	_kref+0xa24
	.word	0x86a0e001	! t0_kref+0xa28:   	subcc	%g3, 1, %g3
	.word	0xec070019	! t0_kref+0xa2c:   	ld	[%i4 + %i1], %l6
	.word	0x95b3416d	! t0_kref+0xa30:   	edge32ln	%o5, %o5, %o2
	.word	0xb9b68e80	! t0_kref+0xa34:   	fsrc1	%f26, %f28
	.word	0x95b34280	! t0_kref+0xa38:   	array32	%o5, %g0, %o2
	.word	0xc568a042	! t0_kref+0xa3c:   	prefetch	%g2 + 0x42, 2
	.word	0xda364000	! t0_kref+0xa40:   	sth	%o5, [%i1]
	.word	0xea8e505a	! t0_kref+0xa44:   	lduba	[%i1 + %i2]0x82, %l5
	.word	0xda20a024	! t0_kref+0xa48:   	st	%o5, [%g2 + 0x24]
	.word	0xf3a0a020	! t0_kref+0xa4c:   	sta	%f25, [%g2 + 0x20]%asi
	.word	0xff20a030	! t0_kref+0xa50:   	st	%f31, [%g2 + 0x30]
	.word	0xadb3404d	! t0_kref+0xa54:   	edge8l	%o5, %o5, %l6
	.word	0x81af8a5c	! t0_kref+0xa58:   	fcmpd	%fcc0, %f30, %f28
	.word	0xea4e7ff2	! t0_kref+0xa5c:   	ldsb	[%i1 - 0xe], %l5
	.word	0xb5b70c5e	! t0_kref+0xa60:   	fnor	%f28, %f30, %f26
	.word	0xee88a006	! t0_kref+0xa64:   	lduba	[%g2 + 6]%asi, %l7
	.word	0xbdb78e80	! t0_kref+0xa68:   	fsrc1	%f30, %f30
	.word	0xd4067fe4	! t0_kref+0xa6c:   	ld	[%i1 - 0x1c], %o2
	.word	0xafb340cd	! t0_kref+0xa70:   	edge16l	%o5, %o5, %l7
	.word	0xea480018	! t0_kref+0xa74:   	ldsb	[%g0 + %i0], %l5
	.word	0xbda0053b	! t0_kref+0xa78:   	fsqrts	%f27, %f30
	.word	0x96db773b	! t0_kref+0xa7c:   	smulcc	%o5, -0x8c5, %o3
	.word	0xd280a000	! t0_kref+0xa80:   	lda	[%g2]%asi, %o1
	.word	0xb9a00138	! t0_kref+0xa84:   	fabss	%f24, %f28
	.word	0xbdb70c98	! t0_kref+0xa88:   	fandnot2	%f28, %f24, %f30
	.word	0xb9b70eda	! t0_kref+0xa8c:   	fornot2	%f28, %f26, %f28
	.word	0xb9b00778	! t0_kref+0xa90:   	fpack16	%f24, %f28
	.word	0xb3a01a39	! t0_kref+0xa94:   	fstoi	%f25, %f25
	.word	0xadb3400d	! t0_kref+0xa98:   	edge8	%o5, %o5, %l6
	.word	0xee500018	! t0_kref+0xa9c:   	ldsh	[%g0 + %i0], %l7
	.word	0xf980a018	! t0_kref+0xaa0:   	lda	[%g2 + 0x18]%asi, %f28
	.word	0xb1a708ba	! t0_kref+0xaa4:   	fsubs	%f28, %f26, %f24
	.word	0xee00a008	! t0_kref+0xaa8:   	ld	[%g2 + 8], %l7
	.word	0xb3a609b8	! t0_kref+0xaac:   	fdivs	%f24, %f24, %f25
	.word	0xae1372ae	! t0_kref+0xab0:   	or	%o5, -0xd52, %l7
	.word	0xb1a7c9bc	! t0_kref+0xab4:   	fdivs	%f31, %f28, %f24
	.word	0xda28a009	! t0_kref+0xab8:   	stb	%o5, [%g2 + 9]
	.word	0xb3b007ba	! t0_kref+0xabc:   	fpackfix	%f26, %f25
	.word	0xec0e6012	! t0_kref+0xac0:   	ldub	[%i1 + 0x12], %l6
	.word	0xadb3404d	! t0_kref+0xac4:   	edge8l	%o5, %o5, %l6
	.word	0xe808a024	! t0_kref+0xac8:   	ldub	[%g2 + 0x24], %l4
	.word	0xb3a609bc	! t0_kref+0xacc:   	fdivs	%f24, %f28, %f25
	.word	0xff066018	! t0_kref+0xad0:   	ld	[%i1 + 0x18], %f31
	.word	0xf51e4000	! t0_kref+0xad4:   	ldd	[%i1], %f26
	.word	0xa9b3404d	! t0_kref+0xad8:   	edge8l	%o5, %o5, %l4
	.word	0xb5a689b9	! t0_kref+0xadc:   	fdivs	%f26, %f25, %f26
	.word	0xaf0b715b	! t0_kref+0xae0:   	tsubcc	%o5, -0xea5, %l7
	.word	0x8583614c	! t0_kref+0xae4:   	wr	%o5, 0x14c, %ccr
	.word	0xb9a609be	! t0_kref+0xae8:   	fdivs	%f24, %f30, %f28
	.word	0xd00e401a	! t0_kref+0xaec:   	ldub	[%i1 + %i2], %o0
	.word	0xacbb400d	! t0_kref+0xaf0:   	xnorcc	%o5, %o5, %l6
	.word	0xdaa8a038	! t0_kref+0xaf4:   	stba	%o5, [%g2 + 0x38]%asi
	.word	0xb5b00f18	! t0_kref+0xaf8:   	fsrc2	%f24, %f26
	.word	0x962b400d	! t0_kref+0xafc:   	andn	%o5, %o5, %o3
	.word	0xea0e6008	! t0_kref+0xb00:   	ldub	[%i1 + 8], %l5
	.word	0xb9b607da	! t0_kref+0xb04:   	pdist	%f24, %f26, %f28
	.word	0xfba0a034	! t0_kref+0xb08:   	sta	%f29, [%g2 + 0x34]%asi
	.word	0xb9a0055e	! t0_kref+0xb0c:   	fsqrtd	%f30, %f28
	.word	0xda30a03c	! t0_kref+0xb10:   	sth	%o5, [%g2 + 0x3c]
	.word	0xb1b687da	! t0_kref+0xb14:   	pdist	%f26, %f26, %f24
	.word	0xb9b6467f	! t0_kref+0xb18:   	fmul8x16au	%f25, %f31, %f28
	.word	0xb5a0055e	! t0_kref+0xb1c:   	fsqrtd	%f30, %f26
	.word	0x86102004	! t0_kref+0xb20:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0xb24:   	bne,a	_kref+0xb24
	.word	0x86a0e001	! t0_kref+0xb28:   	subcc	%g3, 1, %g3
	.word	0xb5a0193e	! t0_kref+0xb2c:   	fstod	%f30, %f26
	.word	0xb5b00c00	! t0_kref+0xb30:   	fzero	%f26
	.word	0xadb605dc	! t0_kref+0xb34:   	fcmpeq32	%f24, %f28, %l6
	.word	0xb9a609b8	! t0_kref+0xb38:   	fdivs	%f24, %f24, %f28
	.word	0xec4e3ff3	! t0_kref+0xb3c:   	ldsb	[%i0 - 0xd], %l6
	.word	0xb5a649be	! t0_kref+0xb40:   	fdivs	%f25, %f30, %f26
	.word	0xe8100018	! t0_kref+0xb44:   	lduh	[%g0 + %i0], %l4
	.word	0xff20a038	! t0_kref+0xb48:   	st	%f31, [%g2 + 0x38]
	.word	0xb5a01938	! t0_kref+0xb4c:   	fstod	%f24, %f26
	.word	0x97b3416d	! t0_kref+0xb50:   	edge32ln	%o5, %o5, %o3
	.word	0xf7000019	! t0_kref+0xb54:   	ld	[%g0 + %i1], %f27
	.word	0xbda0053a	! t0_kref+0xb58:   	fsqrts	%f26, %f30
	.word	0x27800008	! t0_kref+0xb5c:   	fbul,a	_kref+0xb7c
	.word	0xbfa0053e	! t0_kref+0xb60:   	fsqrts	%f30, %f31
	.word	0xb1a000bf	! t0_kref+0xb64:   	fnegs	%f31, %f24
	.word	0xb5a0189e	! t0_kref+0xb68:   	fitos	%f30, %f26
	.word	0xb3a0189e	! t0_kref+0xb6c:   	fitos	%f30, %f25
	.word	0xd4000018	! t0_kref+0xb70:   	ld	[%g0 + %i0], %o2
	.word	0xfda0a000	! t0_kref+0xb74:   	sta	%f30, [%g2]%asi
	.word	0x81834000	! t0_kref+0xb78:   	wr	%o5, %g0, %y
	.word	0xe8000019	! t0_kref+0xb7c:   	ld	[%g0 + %i1], %l4
	.word	0xec3e7ff8	! t0_kref+0xb80:   	std	%l6, [%i1 - 8]
	.word	0xbba749b8	! t0_kref+0xb84:   	fdivs	%f29, %f24, %f29
	.word	0xbdb0077c	! t0_kref+0xb88:   	fpack16	%f28, %f30
	.word	0xf11e4000	! t0_kref+0xb8c:   	ldd	[%i1], %f24
	.word	0xb9b00778	! t0_kref+0xb90:   	fpack16	%f24, %f28
	.word	0x929b73d5	! t0_kref+0xb94:   	xorcc	%o5, -0xc2b, %o1
	.word	0xafb685de	! t0_kref+0xb98:   	fcmpeq32	%f26, %f30, %l7
	.word	0xf1be184d	! t0_kref+0xb9c:   	stda	%f24, [%i0 + %o5]0xc2
	.word	0xda28a03c	! t0_kref+0xba0:   	stb	%o5, [%g2 + 0x3c]
	.word	0xa813400d	! t0_kref+0xba4:   	or	%o5, %o5, %l4
	.word	0x1130dbd5	! t0_kref+0xba8:   	sethi	%hi(0xc36f5400), %o0
	.word	0xb1b00c00	! t0_kref+0xbac:   	fzero	%f24
	.word	0xbda0053e	! t0_kref+0xbb0:   	fsqrts	%f30, %f30
	.word	0xadb34280	! t0_kref+0xbb4:   	array32	%o5, %g0, %l6
	.word	0xbda018de	! t0_kref+0xbb8:   	fdtos	%f30, %f30
	.word	0xb1a608de	! t0_kref+0xbbc:   	fsubd	%f24, %f30, %f24
	.word	0xb1a609bd	! t0_kref+0xbc0:   	fdivs	%f24, %f29, %f24
	.word	0xe80e6011	! t0_kref+0xbc4:   	ldub	[%i1 + 0x11], %l4
	.word	0x81ae8ade	! t0_kref+0xbc8:   	fcmped	%fcc0, %f26, %f30
	.word	0x34800005	! t0_kref+0xbcc:   	bg,a	_kref+0xbe0
	.word	0xda30a026	! t0_kref+0xbd0:   	sth	%o5, [%g2 + 0x26]
	.word	0xee0e401a	! t0_kref+0xbd4:   	ldub	[%i1 + %i2], %l7
	.word	0xb1b686fe	! t0_kref+0xbd8:   	fmul8ulx16	%f26, %f30, %f24
	.word	0x81d90009	! t0_kref+0xbdc:   	flush	%g4 + %o1
	.word	0xd60e401a	! t0_kref+0xbe0:   	ldub	[%i1 + %i2], %o3
	.word	0xeece1000	! t0_kref+0xbe4:   	ldsba	[%i0]0x80, %l7
	.word	0xafb34240	! t0_kref+0xbe8:   	array16	%o5, %g0, %l7
	.word	0xa9b3404d	! t0_kref+0xbec:   	edge8l	%o5, %o5, %l4
	.word	0xb3a6c9b9	! t0_kref+0xbf0:   	fdivs	%f27, %f25, %f25
	.word	0xe6c0a014	! t0_kref+0xbf4:   	ldswa	[%g2 + 0x14]%asi, %l3
	.word	0xbfa0053b	! t0_kref+0xbf8:   	fsqrts	%f27, %f31
	.word	0xd6066000	! t0_kref+0xbfc:   	ld	[%i1], %o3
	.word	0xbdb78e18	! t0_kref+0xc00:   	fand	%f30, %f24, %f30
	.word	0xb1a0055a	! t0_kref+0xc04:   	fsqrtd	%f26, %f24
	.word	0xb1a01939	! t0_kref+0xc08:   	fstod	%f25, %f24
	.word	0xd656c018	! t0_kref+0xc0c:   	ldsh	[%i3 + %i0], %o3
	.word	0xaad3400d	! t0_kref+0xc10:   	umulcc	%o5, %o5, %l5
	.word	0xb5b009b9	! t0_kref+0xc14:   	fexpand	%f25, %f26
	.word	0xb3b7cc7a	! t0_kref+0xc18:   	fnors	%f31, %f26, %f25
	.word	0xf1180019	! t0_kref+0xc1c:   	ldd	[%g0 + %i1], %f24
	.word	0x86102001	! t0_kref+0xc20:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xc24:   	bne,a	_kref+0xc24
	.word	0x86a0e001	! t0_kref+0xc28:   	subcc	%g3, 1, %g3
	.word	0xf51e001d	! t0_kref+0xc2c:   	ldd	[%i0 + %i5], %f26
	.word	0xda28a03c	! t0_kref+0xc30:   	stb	%o5, [%g2 + 0x3c]
	.word	0x34800003	! t0_kref+0xc34:   	bg,a	_kref+0xc40
	.word	0xd60e7ff5	! t0_kref+0xc38:   	ldub	[%i1 - 0xb], %o3
	.word	0xbba00539	! t0_kref+0xc3c:   	fsqrts	%f25, %f29
	.word	0xb5a789bd	! t0_kref+0xc40:   	fdivs	%f30, %f29, %f26
	.word	0xb5b78dda	! t0_kref+0xc44:   	fnand	%f30, %f26, %f26
	.word	0x92bb400d	! t0_kref+0xc48:   	xnorcc	%o5, %o5, %o1
	.word	0xbda0055a	! t0_kref+0xc4c:   	fsqrtd	%f26, %f30
	.word	0xbda0189a	! t0_kref+0xc50:   	fitos	%f26, %f30
	.word	0xa9b605d8	! t0_kref+0xc54:   	fcmpeq32	%f24, %f24, %l4
	.word	0xe656001b	! t0_kref+0xc58:   	ldsh	[%i0 + %i3], %l3
	.word	0x23800006	! t0_kref+0xc5c:   	fbne,a	_kref+0xc74
	.word	0xbda7c9bf	! t0_kref+0xc60:   	fdivs	%f31, %f31, %f30
	.word	0xbfa00538	! t0_kref+0xc64:   	fsqrts	%f24, %f31
	.word	0xbba01899	! t0_kref+0xc68:   	fitos	%f25, %f29
	.word	0xa7b3430d	! t0_kref+0xc6c:   	alignaddr	%o5, %o5, %l3
	.word	0xd686505c	! t0_kref+0xc70:   	lda	[%i1 + %i4]0x82, %o3
	.word	0xd208a03d	! t0_kref+0xc74:   	ldub	[%g2 + 0x3d], %o1
	.word	0xda28a00a	! t0_kref+0xc78:   	stb	%o5, [%g2 + 0xa]
	.word	0x94ab400d	! t0_kref+0xc7c:   	andncc	%o5, %o5, %o2
	.word	0xd4062000	! t0_kref+0xc80:   	ld	[%i0], %o2
	.word	0xd60e3ff1	! t0_kref+0xc84:   	ldub	[%i0 - 0xf], %o3
	.word	0xea10a032	! t0_kref+0xc88:   	lduh	[%g2 + 0x32], %l5
	.word	0xd6067ff0	! t0_kref+0xc8c:   	ld	[%i1 - 0x10], %o3
	.word	0xb5b687d8	! t0_kref+0xc90:   	pdist	%f26, %f24, %f26
	.word	0xa6937298	! t0_kref+0xc94:   	orcc	%o5, -0xd68, %l3
	.word	0xb1b70f58	! t0_kref+0xc98:   	fornot1	%f28, %f24, %f24
	.word	0xf19e1a5c	! t0_kref+0xc9c:   	ldda	[%i0 + %i4]0xd2, %f24
	.word	0xbfa00539	! t0_kref+0xca0:   	fsqrts	%f25, %f31
	.word	0x8143c000	! t0_kref+0xca4:   	stbar
	.word	0xd656401b	! t0_kref+0xca8:   	ldsh	[%i1 + %i3], %o3
	.word	0xf9a0a008	! t0_kref+0xcac:   	sta	%f28, [%g2 + 8]%asi
	.word	0xee000019	! t0_kref+0xcb0:   	ld	[%g0 + %i1], %l7
	.word	0x3f800008	! t0_kref+0xcb4:   	fbo,a	_kref+0xcd4
	.word	0xd2166000	! t0_kref+0xcb8:   	lduh	[%i1], %o1
	.word	0xf9be588d	! t0_kref+0xcbc:   	stda	%f28, [%i1 + %o5]0xc4
	.word	0xdab0a000	! t0_kref+0xcc0:   	stha	%o5, [%g2]%asi
	.word	0x36800006	! t0_kref+0xcc4:   	bge,a	_kref+0xcdc
	.word	0xb9b78adc	! t0_kref+0xcc8:   	fpsub32	%f30, %f28, %f28
	.word	0xe76e2010	! t0_kref+0xccc:   	prefetch	%i0 + 0x10, 19
	.word	0xd6000019	! t0_kref+0xcd0:   	ld	[%g0 + %i1], %o3
	.word	0xa744c000	! t0_kref+0xcd4:   	mov	%gsr, %l3
	.word	0xb1a0055e	! t0_kref+0xcd8:   	fsqrtd	%f30, %f24
	.word	0xda364000	! t0_kref+0xcdc:   	sth	%o5, [%i1]
	.word	0xf3a0a028	! t0_kref+0xce0:   	sta	%f25, [%g2 + 0x28]%asi
	.word	0xb3b68e38	! t0_kref+0xce4:   	fands	%f26, %f24, %f25
	.word	0xd86e6000	! t0_kref+0xce8:   	ldstub	[%i1], %o4
	.word	0xaee3400d	! t0_kref+0xcec:   	subccc	%o5, %o5, %l7
	.word	0xf19e1a1c	! t0_kref+0xcf0:   	ldda	[%i0 + %i4]0xd0, %f24
	.word	0xb1a60958	! t0_kref+0xcf4:   	fmuld	%f24, %f24, %f24
	.word	0xb1a609de	! t0_kref+0xcf8:   	fdivd	%f24, %f30, %f24
	.word	0x13042bea	! t0_kref+0xcfc:   	sethi	%hi(0x10afa800), %o1
	.word	0x91b3402d	! t0_kref+0xd00:   	edge8n	%o5, %o5, %o0
	.word	0xadb60518	! t0_kref+0xd04:   	fcmpgt16	%f24, %f24, %l6
	.word	0xbfb68fb8	! t0_kref+0xd08:   	fors	%f26, %f24, %f31
	.word	0xfd20a020	! t0_kref+0xd0c:   	st	%f30, [%g2 + 0x20]
	.word	0xb1b6875c	! t0_kref+0xd10:   	fpack32	%f26, %f28, %f24
	.word	0xf180a024	! t0_kref+0xd14:   	lda	[%g2 + 0x24]%asi, %f24
	.word	0xff066004	! t0_kref+0xd18:   	ld	[%i1 + 4], %f31
	.word	0xe608a019	! t0_kref+0xd1c:   	ldub	[%g2 + 0x19], %l3
	.word	0xa6f37391	! t0_kref+0xd20:   	udivcc	%o5, -0xc6f, %l3
	.word	0xac13400d	! t0_kref+0xd24:   	or	%o5, %o5, %l6
	.word	0x81db4004	! t0_kref+0xd28:   	flush	%o5 + %g4
	.word	0xe80e4000	! t0_kref+0xd2c:   	ldub	[%i1], %l4
	call	SYM(t0_subr0)
	.word	0xaef3784c	! t0_kref+0xd34:   	udivcc	%o5, -0x7b4, %l7
	.word	0xf9be1a1c	! t0_kref+0xd38:   	stda	%f28, [%i0 + %i4]0xd0
	.word	0xa8b376d4	! t0_kref+0xd3c:   	orncc	%o5, -0x92c, %l4
	.word	0xb5a0055c	! t0_kref+0xd40:   	fsqrtd	%f28, %f26
	.word	0xd6567fea	! t0_kref+0xd44:   	ldsh	[%i1 - 0x16], %o3
	.word	0xd6163fea	! t0_kref+0xd48:   	lduh	[%i0 - 0x16], %o3
	.word	0x945b6de2	! t0_kref+0xd4c:   	smul	%o5, 0xde2, %o2
	.word	0xac5b400d	! t0_kref+0xd50:   	smul	%o5, %o5, %l6
	.word	0xf1180019	! t0_kref+0xd54:   	ldd	[%g0 + %i1], %f24
	.word	0xb1b7c63e	! t0_kref+0xd58:   	fmul8x16	%f31, %f30, %f24
	.word	0xf9180018	! t0_kref+0xd5c:   	ldd	[%g0 + %i0], %f28
	.word	0xd4167ff8	! t0_kref+0xd60:   	lduh	[%i1 - 8], %o2
	.word	0xd04e401a	! t0_kref+0xd64:   	ldsb	[%i1 + %i2], %o0
	.word	0xbda689d8	! t0_kref+0xd68:   	fdivd	%f26, %f24, %f30
	.word	0xd0560000	! t0_kref+0xd6c:   	ldsh	[%i0], %o0
	.word	0xb9a64d38	! t0_kref+0xd70:   	fsmuld	%f25, %f24, %f28
	.word	0xda30a034	! t0_kref+0xd74:   	sth	%o5, [%g2 + 0x34]
	.word	0xf19eda19	! t0_kref+0xd78:   	ldda	[%i3 + %i1]0xd0, %f24
	.word	0x35480007	! t0_kref+0xd7c:   	fbue,a,pt	%fcc0, _kref+0xd98
	.word	0xafb7841e	! t0_kref+0xd80:   	fcmple16	%f30, %f30, %l7
	.word	0xb9a0111c	! t0_kref+0xd84:   	fxtod	%f28, %f28
	.word	0xac0b400d	! t0_kref+0xd88:   	and	%o5, %o5, %l6
	.word	0xda2e8019	! t0_kref+0xd8c:   	stb	%o5, [%i2 + %i1]
	.word	0x81dbabc9	! t0_kref+0xd90:   	flush	%sp + 0xbc9
	.word	0xb5b60678	! t0_kref+0xd94:   	fmul8x16au	%f24, %f24, %f26
	.word	0xd056c019	! t0_kref+0xd98:   	ldsh	[%i3 + %i1], %o0
	.word	0xb5a6c9bd	! t0_kref+0xd9c:   	fdivs	%f27, %f29, %f26
	.word	0x81ae8a5e	! t0_kref+0xda0:   	fcmpd	%fcc0, %f26, %f30
	.word	0xa6b37f2e	! t0_kref+0xda4:   	orncc	%o5, -0xd2, %l3
	.word	0xaee3400d	! t0_kref+0xda8:   	subccc	%o5, %o5, %l7
	.word	0xe608a03c	! t0_kref+0xdac:   	ldub	[%g2 + 0x3c], %l3
	.word	0xea0e7ff9	! t0_kref+0xdb0:   	ldub	[%i1 - 7], %l5
	.word	0xecc0a030	! t0_kref+0xdb4:   	ldswa	[%g2 + 0x30]%asi, %l6
	.word	0x95b685de	! t0_kref+0xdb8:   	fcmpeq32	%f26, %f30, %o2
	.word	0x97b605d8	! t0_kref+0xdbc:   	fcmpeq32	%f24, %f24, %o3
	.word	0xb9b706ba	! t0_kref+0xdc0:   	fmul8x16al	%f28, %f26, %f28
	.word	0xe888a003	! t0_kref+0xdc4:   	lduba	[%g2 + 3]%asi, %l4
	.word	0xf120a014	! t0_kref+0xdc8:   	st	%f24, [%g2 + 0x14]
	.word	0xf5180019	! t0_kref+0xdcc:   	ldd	[%g0 + %i1], %f26
	.word	0xe6063ffc	! t0_kref+0xdd0:   	ld	[%i0 - 4], %l3
	.word	0xf11f4018	! t0_kref+0xdd4:   	ldd	[%i5 + %i0], %f24
	.word	0x8143e040	! t0_kref+0xdd8:   	membar	0x40
	.word	0xd056600c	! t0_kref+0xddc:   	ldsh	[%i1 + 0xc], %o0
	.word	0xb5a01939	! t0_kref+0xde0:   	fstod	%f25, %f26
	.word	0x9de3bfa0	! t0_kref+0xde4:   	save	%sp, -0x60, %sp
	.word	0xb267401c	! t0_kref+0xde8:   	subc	%i5, %i4, %i1
	.word	0x95ee2f96	! t0_kref+0xdec:   	restore	%i0, 0xf96, %o2
	.word	0xa6bb70ee	! t0_kref+0xdf0:   	xnorcc	%o5, -0xf12, %l3
	.word	0xb7a709bc	! t0_kref+0xdf4:   	fdivs	%f28, %f28, %f27
	.word	0x97b785d8	! t0_kref+0xdf8:   	fcmpeq32	%f30, %f24, %o3
	.word	0xf720a024	! t0_kref+0xdfc:   	st	%f27, [%g2 + 0x24]
	.word	0xf180a014	! t0_kref+0xe00:   	lda	[%g2 + 0x14]%asi, %f24
	.word	0x2f800008	! t0_kref+0xe04:   	fbu,a	_kref+0xe24
	.word	0xbbb7caba	! t0_kref+0xe08:   	fpsub16s	%f31, %f26, %f29
	.word	0xe610a026	! t0_kref+0xe0c:   	lduh	[%g2 + 0x26], %l3
	.word	0xb5b74a7b	! t0_kref+0xe10:   	fpadd32s	%f29, %f27, %f26
	.word	0xda30a012	! t0_kref+0xe14:   	sth	%o5, [%g2 + 0x12]
	.word	0xb5b70a1e	! t0_kref+0xe18:   	fpadd16	%f28, %f30, %f26
	.word	0xb5b787dc	! t0_kref+0xe1c:   	pdist	%f30, %f28, %f26
	.word	0xd0562004	! t0_kref+0xe20:   	ldsh	[%i0 + 4], %o0
	.word	0xb5a6cd3d	! t0_kref+0xe24:   	fsmuld	%f27, %f29, %f26
	.word	0xa7b3430d	! t0_kref+0xe28:   	alignaddr	%o5, %o5, %l3
	.word	0xe16e401d	! t0_kref+0xe2c:   	prefetch	%i1 + %i5, 16
	.word	0xd20e200d	! t0_kref+0xe30:   	ldub	[%i0 + 0xd], %o1
	.word	0xea80a01c	! t0_kref+0xe34:   	lda	[%g2 + 0x1c]%asi, %l5
	.word	0x90e3400d	! t0_kref+0xe38:   	subccc	%o5, %o5, %o0
	.word	0xda36201a	! t0_kref+0xe3c:   	sth	%o5, [%i0 + 0x1a]
	call	SYM(t0_subr2)
	.word	0xd2567ffc	! t0_kref+0xe44:   	ldsh	[%i1 - 4], %o1
	.word	0xf7a0a014	! t0_kref+0xe48:   	sta	%f27, [%g2 + 0x14]%asi
	.word	0xd6563ff2	! t0_kref+0xe4c:   	ldsh	[%i0 - 0xe], %o3
	.word	0xf1a0a004	! t0_kref+0xe50:   	sta	%f24, [%g2 + 4]%asi
	.word	0xd6062004	! t0_kref+0xe54:   	ld	[%i0 + 4], %o3
	.word	0xda200018	! t0_kref+0xe58:   	st	%o5, [%g0 + %i0]
	.word	0xb5a0191b	! t0_kref+0xe5c:   	fitod	%f27, %f26
	.word	0xb9b00f39	! t0_kref+0xe60:   	fsrc2s	%f25, %f28
	.word	0xb1b7c67d	! t0_kref+0xe64:   	fmul8x16au	%f31, %f29, %f24
	.word	0x9fc00004	! t0_kref+0xe68:   	call	%g0 + %g4
	.word	0xf500a008	! t0_kref+0xe6c:   	ld	[%g2 + 8], %f26
	.word	0xd0566006	! t0_kref+0xe70:   	ldsh	[%i1 + 6], %o0
	.word	0xb1b7099c	! t0_kref+0xe74:   	bshuffle	%f28, %f28, %f24
	.word	0xec56600a	! t0_kref+0xe78:   	ldsh	[%i1 + 0xa], %l6
	.word	0xb7a0189d	! t0_kref+0xe7c:   	fitos	%f29, %f27
	.word	0xfd20a030	! t0_kref+0xe80:   	st	%f30, [%g2 + 0x30]
	.word	0x81ae0a5c	! t0_kref+0xe84:   	fcmpd	%fcc0, %f24, %f28
	.word	0x858376da	! t0_kref+0xe88:   	wr	%o5, 0xfffff6da, %ccr
	.word	0xa6e36ef4	! t0_kref+0xe8c:   	subccc	%o5, 0xef4, %l3
	.word	0xf91e6008	! t0_kref+0xe90:   	ldd	[%i1 + 8], %f28
	.word	0xf19e1a5d	! t0_kref+0xe94:   	ldda	[%i0 + %i5]0xd2, %f24
	.word	0xd2000019	! t0_kref+0xe98:   	ld	[%g0 + %i1], %o1
	.word	0xbdb7099c	! t0_kref+0xe9c:   	bshuffle	%f28, %f28, %f30
	.word	0xfd1e0000	! t0_kref+0xea0:   	ldd	[%i0], %f30
	.word	0x878020d2	! t0_kref+0xea4:   	mov	0xd2, %asi
	.word	0xb1a649b8	! t0_kref+0xea8:   	fdivs	%f25, %f24, %f24
	.word	0xda20a00c	! t0_kref+0xeac:   	st	%o5, [%g2 + 0xc]
	.word	0x878020f0	! t0_kref+0xeb0:   	mov	0xf0, %asi
	.word	0x9023400d	! t0_kref+0xeb4:   	sub	%o5, %o5, %o0
	.word	0x8143c000	! t0_kref+0xeb8:   	stbar
	.word	0xec166010	! t0_kref+0xebc:   	lduh	[%i1 + 0x10], %l6
	.word	0xb7a0053e	! t0_kref+0xec0:   	fsqrts	%f30, %f27
	.word	0xd450a002	! t0_kref+0xec4:   	ldsh	[%g2 + 2], %o2
	.word	0xf91fbed0	! t0_kref+0xec8:   	ldd	[%fp - 0x130], %f28
	.word	0xf11fbed8	! t0_kref+0xecc:   	ldd	[%fp - 0x128], %f24
	.word	0xb9a9405a	! t0_kref+0xed0:   	fmovdug	%fcc0, %f26, %f28
	.word	0xd256c018	! t0_kref+0xed4:   	ldsh	[%i3 + %i0], %o1
	.word	0xa7703dcb	! t0_kref+0xed8:   	popc	-0x235, %l3
	.word	0x81ae8a58	! t0_kref+0xedc:   	fcmpd	%fcc0, %f26, %f24
	.word	0xda30a00a	! t0_kref+0xee0:   	sth	%o5, [%g2 + 0xa]
	.word	0xab0b400d	! t0_kref+0xee4:   	tsubcc	%o5, %o5, %l5
	.word	0x93b3432d	! t0_kref+0xee8:   	bmask	%o5, %o5, %o1
	.word	0xd2500018	! t0_kref+0xeec:   	ldsh	[%g0 + %i0], %o1
	.word	0x9fc10000	! t0_kref+0xef0:   	call	%g4
	.word	0xfd1f4019	! t0_kref+0xef4:   	ldd	[%i5 + %i1], %f30
	.word	0xa9236a70	! t0_kref+0xef8:   	mulscc	%o5, 0xa70, %l4
	.word	0x93b3432d	! t0_kref+0xefc:   	bmask	%o5, %o5, %o1
	.word	0xb3a018da	! t0_kref+0xf00:   	fdtos	%f26, %f25
	.word	0xe808a026	! t0_kref+0xf04:   	ldub	[%g2 + 0x26], %l4
	.word	0x9de3bfa0	! t0_kref+0xf08:   	save	%sp, -0x60, %sp
	.word	0xa7e82edb	! t0_kref+0xf0c:   	restore	%g0, 0xedb, %l3
	.word	0xaebb400d	! t0_kref+0xf10:   	xnorcc	%o5, %o5, %l7
	.word	0xee567fec	! t0_kref+0xf14:   	ldsh	[%i1 - 0x14], %l7
	.word	0x81af4a3a	! t0_kref+0xf18:   	fcmps	%fcc0, %f29, %f26
	.word	0xf51f4019	! t0_kref+0xf1c:   	ldd	[%i5 + %i1], %f26
	.word	0xd410a000	! t0_kref+0xf20:   	lduh	[%g2], %o2
	.word	0x96136848	! t0_kref+0xf24:   	or	%o5, 0x848, %o3
	.word	0xc768a043	! t0_kref+0xf28:   	prefetch	%g2 + 0x43, 3
	.word	0x9fc10000	! t0_kref+0xf2c:   	call	%g4
	.word	0xd400a01c	! t0_kref+0xf30:   	ld	[%g2 + 0x1c], %o2
	.word	0xee060000	! t0_kref+0xf34:   	ld	[%i0], %l7
	.word	0xbbb7ce39	! t0_kref+0xf38:   	fands	%f31, %f25, %f29
	.word	0x27800005	! t0_kref+0xf3c:   	fbul,a	_kref+0xf50
	.word	0xe800a01c	! t0_kref+0xf40:   	ld	[%g2 + 0x1c], %l4
	.word	0xb5a609bb	! t0_kref+0xf44:   	fdivs	%f24, %f27, %f26
	.word	0xd610a006	! t0_kref+0xf48:   	lduh	[%g2 + 6], %o3
	.word	0xbdb00fc0	! t0_kref+0xf4c:   	fone	%f30
	.word	0xe810a016	! t0_kref+0xf50:   	lduh	[%g2 + 0x16], %l4
	.word	0x91b3432d	! t0_kref+0xf54:   	bmask	%o5, %o5, %o0
	.word	0xb1b78ea0	! t0_kref+0xf58:   	fsrc1s	%f30, %f24
	.word	0xa7837b2a	! t0_kref+0xf5c:   	wr	%o5, 0xfffffb2a, %gsr
	.word	0xda30a03a	! t0_kref+0xf60:   	sth	%o5, [%g2 + 0x3a]
	.word	0xf900a014	! t0_kref+0xf64:   	ld	[%g2 + 0x14], %f28
	.word	0x8143c000	! t0_kref+0xf68:   	stbar
	.word	0xee50a010	! t0_kref+0xf6c:   	ldsh	[%g2 + 0x10], %l7
	.word	0x8143e02c	! t0_kref+0xf70:   	membar	0x2c
	.word	0xee566018	! t0_kref+0xf74:   	ldsh	[%i1 + 0x18], %l7
	.word	0xf520a014	! t0_kref+0xf78:   	st	%f26, [%g2 + 0x14]
	.word	0xbdb009bc	! t0_kref+0xf7c:   	fexpand	%f28, %f30
	.word	0x96836c48	! t0_kref+0xf80:   	addcc	%o5, 0xc48, %o3
	.word	0xb1b7067c	! t0_kref+0xf84:   	fmul8x16au	%f28, %f28, %f24
	.word	0xb5a64d3b	! t0_kref+0xf88:   	fsmuld	%f25, %f27, %f26
	.word	0xd0063fe0	! t0_kref+0xf8c:   	ld	[%i0 - 0x20], %o0
	.word	0xbfa649b8	! t0_kref+0xf90:   	fdivs	%f25, %f24, %f31
	.word	0xa7b784da	! t0_kref+0xf94:   	fcmpne32	%f30, %f26, %l3
	.word	0xd2160000	! t0_kref+0xf98:   	lduh	[%i0], %o1
	.word	0xd4080018	! t0_kref+0xf9c:   	ldub	[%g0 + %i0], %o2
	.word	0xb5a0055a	! t0_kref+0xfa0:   	fsqrtd	%f26, %f26
	.word	0xe810a016	! t0_kref+0xfa4:   	lduh	[%g2 + 0x16], %l4
	.word	0xda2e401a	! t0_kref+0xfa8:   	stb	%o5, [%i1 + %i2]
	.word	0xe640a02c	! t0_kref+0xfac:   	ldsw	[%g2 + 0x2c], %l3
	.word	0xec080018	! t0_kref+0xfb0:   	ldub	[%g0 + %i0], %l6
	.word	0xa813400d	! t0_kref+0xfb4:   	or	%o5, %o5, %l4
	.word	0x90db6085	! t0_kref+0xfb8:   	smulcc	%o5, 0x85, %o0
	.word	0xd496d058	! t0_kref+0xfbc:   	lduha	[%i3 + %i0]0x82, %o2
	.word	0xadb3408d	! t0_kref+0xfc0:   	edge16	%o5, %o5, %l6
	.word	0xee56201a	! t0_kref+0xfc4:   	ldsh	[%i0 + 0x1a], %l7
	.word	0x2f302cf2	! t0_kref+0xfc8:   	sethi	%hi(0xc0b3c800), %l7
	.word	0xb9b7899a	! t0_kref+0xfcc:   	bshuffle	%f30, %f26, %f28
	.word	0x93237f88	! t0_kref+0xfd0:   	mulscc	%o5, -0x78, %o1
	.word	0xadb7845c	! t0_kref+0xfd4:   	fcmpne16	%f30, %f28, %l6
	.word	0xd2066010	! t0_kref+0xfd8:   	ld	[%i1 + 0x10], %o1
	.word	0xe650a002	! t0_kref+0xfdc:   	ldsh	[%g2 + 2], %l3
	.word	0xd650a022	! t0_kref+0xfe0:   	ldsh	[%g2 + 0x22], %o3
	.word	0xec063ff0	! t0_kref+0xfe4:   	ld	[%i0 - 0x10], %l6
	.word	0xf99eda18	! t0_kref+0xfe8:   	ldda	[%i3 + %i0]0xd0, %f28
	.word	0xb9b68e5c	! t0_kref+0xfec:   	fxnor	%f26, %f28, %f28
	.word	0xb3a609be	! t0_kref+0xff0:   	fdivs	%f24, %f30, %f25
	.word	0xfd1e001d	! t0_kref+0xff4:   	ldd	[%i0 + %i5], %f30
	.word	0xe800a028	! t0_kref+0xff8:   	ld	[%g2 + 0x28], %l4
	.word	0xf11e3ff0	! t0_kref+0xffc:   	ldd	[%i0 - 0x10], %f24
	.word	0xee56401b	! t0_kref+0x1000:   	ldsh	[%i1 + %i3], %l7
	.word	0xe03e3fe8	! t0_kref+0x1004:   	std	%l0, [%i0 - 0x18]
	.word	0xfd20a00c	! t0_kref+0x1008:   	st	%f30, [%g2 + 0xc]
	.word	0xbfb74c78	! t0_kref+0x100c:   	fnors	%f29, %f24, %f31
	.word	0xe3b8a040	! t0_kref+0x1010:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x86102002	! t0_kref+0x1014:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1018:   	bne,a	_kref+0x1018
	.word	0x86a0e001	! t0_kref+0x101c:   	subcc	%g3, 1, %g3
	.word	0xbda789ba	! t0_kref+0x1020:   	fdivs	%f30, %f26, %f30
	.word	0xa623400d	! t0_kref+0x1024:   	sub	%o5, %o5, %l3
	.word	0xd0066000	! t0_kref+0x1028:   	ld	[%i1], %o0
	.word	0xb3a01a58	! t0_kref+0x102c:   	fdtoi	%f24, %f25
	.word	0xd640a01c	! t0_kref+0x1030:   	ldsw	[%g2 + 0x1c], %o3
	.word	0xe84e001a	! t0_kref+0x1034:   	ldsb	[%i0 + %i2], %l4
	.word	0xaf2b6005	! t0_kref+0x1038:   	sll	%o5, 0x5, %l7
	.word	0xd6480018	! t0_kref+0x103c:   	ldsb	[%g0 + %i0], %o3
	.word	0x9613400d	! t0_kref+0x1040:   	or	%o5, %o5, %o3
	.word	0xf19e1a1a	! t0_kref+0x1044:   	ldda	[%i0 + %i2]0xd0, %f24
	.word	0xd016c019	! t0_kref+0x1048:   	lduh	[%i3 + %i1], %o0
	.word	0xb5b00f1e	! t0_kref+0x104c:   	fsrc2	%f30, %f26
	.word	0xe840a02c	! t0_kref+0x1050:   	ldsw	[%g2 + 0x2c], %l4
	.word	0xb1b6497b	! t0_kref+0x1054:   	fpmerge	%f25, %f27, %f24
	.word	0xd248a020	! t0_kref+0x1058:   	ldsb	[%g2 + 0x20], %o1
	.word	0xb5a709bb	! t0_kref+0x105c:   	fdivs	%f28, %f27, %f26
	.word	0xd000a028	! t0_kref+0x1060:   	ld	[%g2 + 0x28], %o0
	.word	0xda20a024	! t0_kref+0x1064:   	st	%o5, [%g2 + 0x24]
	.word	0xd250a00c	! t0_kref+0x1068:   	ldsh	[%g2 + 0xc], %o1
	.word	0xd20e001a	! t0_kref+0x106c:   	ldub	[%i0 + %i2], %o1
	.word	0x8143c000	! t0_kref+0x1070:   	stbar
	.word	0xbdb00fc0	! t0_kref+0x1074:   	fone	%f30
	.word	0xb3b7ccbf	! t0_kref+0x1078:   	fandnot2s	%f31, %f31, %f25
	.word	0xbfa0109a	! t0_kref+0x107c:   	fxtos	%f26, %f31
	.word	0xb1b78fbf	! t0_kref+0x1080:   	fors	%f30, %f31, %f24
	.word	0xd60e401a	! t0_kref+0x1084:   	ldub	[%i1 + %i2], %o3
	.word	0x1505312a	! t0_kref+0x1088:   	sethi	%hi(0x14c4a800), %o2
	.word	0xa783400d	! t0_kref+0x108c:   	wr	%o5, %o5, %gsr
	.word	0xf91e7ff8	! t0_kref+0x1090:   	ldd	[%i1 - 8], %f28
	.word	0xda28a00f	! t0_kref+0x1094:   	stb	%o5, [%g2 + 0xf]
	.word	0xe6062010	! t0_kref+0x1098:   	ld	[%i0 + 0x10], %l3
	.word	0xb7b78f7d	! t0_kref+0x109c:   	fornot1s	%f30, %f29, %f27
	.word	0xbfa6c9be	! t0_kref+0x10a0:   	fdivs	%f27, %f30, %f31
	.word	0xd248a018	! t0_kref+0x10a4:   	ldsb	[%g2 + 0x18], %o1
	.word	0xa7837122	! t0_kref+0x10a8:   	wr	%o5, 0xfffff122, %gsr
	.word	0x91b684dc	! t0_kref+0x10ac:   	fcmpne32	%f26, %f28, %o0
	.word	0xb9a0193f	! t0_kref+0x10b0:   	fstod	%f31, %f28
	.word	0xf3067ff8	! t0_kref+0x10b4:   	ld	[%i1 - 8], %f25
	.word	0xec1e6000	! t0_kref+0x10b8:   	ldd	[%i1], %l6
	.word	0xf1be5a5c	! t0_kref+0x10bc:   	stda	%f24, [%i1 + %i4]0xd2
	.word	0xda30a00e	! t0_kref+0x10c0:   	sth	%o5, [%g2 + 0xe]
	.word	0x9de3bfa0	! t0_kref+0x10c4:   	save	%sp, -0x60, %sp
	.word	0x93ee7402	! t0_kref+0x10c8:   	restore	%i1, -0xbfe, %o1
	.word	0xea08a015	! t0_kref+0x10cc:   	ldub	[%g2 + 0x15], %l5
	.word	0xa683400d	! t0_kref+0x10d0:   	addcc	%o5, %o5, %l3
	.word	0xd40e3fff	! t0_kref+0x10d4:   	ldub	[%i0 - 1], %o2
	.word	0xf320a030	! t0_kref+0x10d8:   	st	%f25, [%g2 + 0x30]
	.word	0xa9b785d8	! t0_kref+0x10dc:   	fcmpeq32	%f30, %f24, %l4
	.word	0x93b3410d	! t0_kref+0x10e0:   	edge32	%o5, %o5, %o1
	.word	0xa663400d	! t0_kref+0x10e4:   	subc	%o5, %o5, %l3
	.word	0xd2166002	! t0_kref+0x10e8:   	lduh	[%i1 + 2], %o1
	.word	0xb7b60e78	! t0_kref+0x10ec:   	fxnors	%f24, %f24, %f27
	.word	0x94137c05	! t0_kref+0x10f0:   	or	%o5, -0x3fb, %o2
	.word	0xa970000d	! t0_kref+0x10f4:   	popc	%o5, %l4
	.word	0xac13400d	! t0_kref+0x10f8:   	or	%o5, %o5, %l6
	.word	0x91b7041a	! t0_kref+0x10fc:   	fcmple16	%f28, %f26, %o0
	.word	0xb9b74a79	! t0_kref+0x1100:   	fpadd32s	%f29, %f25, %f28
	.word	0xe8162012	! t0_kref+0x1104:   	lduh	[%i0 + 0x12], %l4
	.word	0xe8567ff8	! t0_kref+0x1108:   	ldsh	[%i1 - 8], %l4
	.word	0xf9180018	! t0_kref+0x110c:   	ldd	[%g0 + %i0], %f28
	.word	0xd016200a	! t0_kref+0x1110:   	lduh	[%i0 + 0xa], %o0
	.word	0xaa13400d	! t0_kref+0x1114:   	or	%o5, %o5, %l5
	.word	0x26800003	! t0_kref+0x1118:   	bl,a	_kref+0x1124
	.word	0x951b400d	! t0_kref+0x111c:   	tsubcctv	%o5, %o5, %o2
	.word	0xaac3400d	! t0_kref+0x1120:   	addccc	%o5, %o5, %l5
	.word	0xf500a03c	! t0_kref+0x1124:   	ld	[%g2 + 0x3c], %f26
	.word	0x91b3410d	! t0_kref+0x1128:   	edge32	%o5, %o5, %o0
	.word	0xa93b6001	! t0_kref+0x112c:   	sra	%o5, 0x1, %l4
	.word	0xd6067fe0	! t0_kref+0x1130:   	ld	[%i1 - 0x20], %o3
	.word	0xb1a0053f	! t0_kref+0x1134:   	fsqrts	%f31, %f24
	.word	0xea067ffc	! t0_kref+0x1138:   	ld	[%i1 - 4], %l5
	.word	0xd608a03e	! t0_kref+0x113c:   	ldub	[%g2 + 0x3e], %o3
	.word	0xab70222b	! t0_kref+0x1140:   	popc	0x22b, %l5
	.word	0xfb06401c	! t0_kref+0x1144:   	ld	[%i1 + %i4], %f29
	.word	0xd04e4000	! t0_kref+0x1148:   	ldsb	[%i1], %o0
	.word	0xaa93400d	! t0_kref+0x114c:   	orcc	%o5, %o5, %l5
	.word	0xee4e8019	! t0_kref+0x1150:   	ldsb	[%i2 + %i1], %l7
	.word	0x3b800002	! t0_kref+0x1154:   	fble,a	_kref+0x115c
	.word	0xf1be188d	! t0_kref+0x1158:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xa744c000	! t0_kref+0x115c:   	mov	%gsr, %l3
	.word	0xafb34200	! t0_kref+0x1160:   	array8	%o5, %g0, %l7
	.word	0xed68a001	! t0_kref+0x1164:   	prefetch	%g2 + 1, 22
	.word	0xe810a010	! t0_kref+0x1168:   	lduh	[%g2 + 0x10], %l4
	.word	0xb1a00038	! t0_kref+0x116c:   	fmovs	%f24, %f24
	.word	0xec180019	! t0_kref+0x1170:   	ldd	[%g0 + %i1], %l6
	.word	0xd40e8018	! t0_kref+0x1174:   	ldub	[%i2 + %i0], %o2
	.word	0xf99e1a5b	! t0_kref+0x1178:   	ldda	[%i0 + %i3]0xd2, %f28
	.word	0xe84e4000	! t0_kref+0x117c:   	ldsb	[%i1], %l4
	.word	0xbdb60db9	! t0_kref+0x1180:   	fxors	%f24, %f25, %f30
	.word	0x923b400d	! t0_kref+0x1184:   	xnor	%o5, %o5, %o1
	.word	0xbda0055c	! t0_kref+0x1188:   	fsqrtd	%f28, %f30
	.word	0xd6070018	! t0_kref+0x118c:   	ld	[%i4 + %i0], %o3
	.word	0x91b7845e	! t0_kref+0x1190:   	fcmpne16	%f30, %f30, %o0
	.word	0xb1b60e1c	! t0_kref+0x1194:   	fand	%f24, %f28, %f24
	.word	0xf11e3ff8	! t0_kref+0x1198:   	ldd	[%i0 - 8], %f24
	.word	0xf1067ffc	! t0_kref+0x119c:   	ld	[%i1 - 4], %f24
	.word	0x81af0a5e	! t0_kref+0x11a0:   	fcmpd	%fcc0, %f28, %f30
	.word	0xe60e3fec	! t0_kref+0x11a4:   	ldub	[%i0 - 0x14], %l3
	.word	0xe60e2012	! t0_kref+0x11a8:   	ldub	[%i0 + 0x12], %l3
	.word	0xda28a009	! t0_kref+0x11ac:   	stb	%o5, [%g2 + 9]
	.word	0x8d83400d	! t0_kref+0x11b0:   	wr	%o5, %o5, %fprs
	.word	0xe80e001a	! t0_kref+0x11b4:   	ldub	[%i0 + %i2], %l4
	.word	0xbda0013d	! t0_kref+0x11b8:   	fabss	%f29, %f30
	.word	0xf1000019	! t0_kref+0x11bc:   	ld	[%g0 + %i1], %f24
	.word	0xbdb7891e	! t0_kref+0x11c0:   	faligndata	%f30, %f30, %f30
	.word	0xb1b6873c	! t0_kref+0x11c4:   	fmuld8ulx16	%f26, %f28, %f24
	.word	0x97b3432d	! t0_kref+0x11c8:   	bmask	%o5, %o5, %o3
	.word	0xbda00558	! t0_kref+0x11cc:   	fsqrtd	%f24, %f30
	.word	0x94db400d	! t0_kref+0x11d0:   	smulcc	%o5, %o5, %o2
	.word	0xb3b00fe0	! t0_kref+0x11d4:   	fones	%f25
	.word	0xbda70d3d	! t0_kref+0x11d8:   	fsmuld	%f28, %f29, %f30
	.word	0xb9a689bf	! t0_kref+0x11dc:   	fdivs	%f26, %f31, %f28
	.word	0xa7b3414d	! t0_kref+0x11e0:   	edge32l	%o5, %o5, %l3
	.word	0xd4563fe6	! t0_kref+0x11e4:   	ldsh	[%i0 - 0x1a], %o2
	.word	0xda28a013	! t0_kref+0x11e8:   	stb	%o5, [%g2 + 0x13]
	.word	0xea0e7fe6	! t0_kref+0x11ec:   	ldub	[%i1 - 0x1a], %l5
	.word	0xee162002	! t0_kref+0x11f0:   	lduh	[%i0 + 2], %l7
	.word	0x905376a8	! t0_kref+0x11f4:   	umul	%o5, -0x958, %o0
	.word	0x912b400d	! t0_kref+0x11f8:   	sll	%o5, %o5, %o0
	.word	0xadb34240	! t0_kref+0x11fc:   	array16	%o5, %g0, %l6
	.word	0xbba709b9	! t0_kref+0x1200:   	fdivs	%f28, %f25, %f29
	.word	0xa723400d	! t0_kref+0x1204:   	mulscc	%o5, %o5, %l3
	.word	0xac13400d	! t0_kref+0x1208:   	or	%o5, %o5, %l6
	.word	0xb9b6c67d	! t0_kref+0x120c:   	fmul8x16au	%f27, %f29, %f28
	.word	0xd00e8018	! t0_kref+0x1210:   	ldub	[%i2 + %i0], %o0
	.word	0xd2167ff8	! t0_kref+0x1214:   	lduh	[%i1 - 8], %o1
	.word	0x81af0a5a	! t0_kref+0x1218:   	fcmpd	%fcc0, %f28, %f26
	.word	0x9de3bfa0	! t0_kref+0x121c:   	save	%sp, -0x60, %sp
	.word	0x97ef401b	! t0_kref+0x1220:   	restore	%i5, %i3, %o3
	.word	0xd24e7ff7	! t0_kref+0x1224:   	ldsb	[%i1 - 9], %o1
	.word	0xb5b78c58	! t0_kref+0x1228:   	fnor	%f30, %f24, %f26
	.word	0xbba01098	! t0_kref+0x122c:   	fxtos	%f24, %f29
	.word	0xda36600c	! t0_kref+0x1230:   	sth	%o5, [%i1 + 0xc]
	.word	0x858365e8	! t0_kref+0x1234:   	wr	%o5, 0x5e8, %ccr
	.word	0xd2567ff8	! t0_kref+0x1238:   	ldsh	[%i1 - 8], %o1
	.word	0xb3a0189d	! t0_kref+0x123c:   	fitos	%f29, %f25
	.word	0xea080019	! t0_kref+0x1240:   	ldub	[%g0 + %i1], %l5
	.word	0xb5b74a78	! t0_kref+0x1244:   	fpadd32s	%f29, %f24, %f26
	.word	0xd00e7ffb	! t0_kref+0x1248:   	ldub	[%i1 - 5], %o0
	.word	0xda262008	! t0_kref+0x124c:   	st	%o5, [%i0 + 8]
	.word	0xf300a008	! t0_kref+0x1250:   	ld	[%g2 + 8], %f25
	.word	0xda2e8019	! t0_kref+0x1254:   	stb	%o5, [%i2 + %i1]
	.word	0xe80e3ffe	! t0_kref+0x1258:   	ldub	[%i0 - 2], %l4
	.word	0x91b685de	! t0_kref+0x125c:   	fcmpeq32	%f26, %f30, %o0
	.word	0x949b400d	! t0_kref+0x1260:   	xorcc	%o5, %o5, %o2
	.word	0xd2060000	! t0_kref+0x1264:   	ld	[%i0], %o1
	.word	0xbbb68fbb	! t0_kref+0x1268:   	fors	%f26, %f27, %f29
	.word	0xd200a010	! t0_kref+0x126c:   	ld	[%g2 + 0x10], %o1
	.word	0x927365e2	! t0_kref+0x1270:   	udiv	%o5, 0x5e2, %o1
	.word	0xd016c019	! t0_kref+0x1274:   	lduh	[%i3 + %i1], %o0
	.word	0xe60e8019	! t0_kref+0x1278:   	ldub	[%i2 + %i1], %l3
	.word	0xd04e401a	! t0_kref+0x127c:   	ldsb	[%i1 + %i2], %o0
	.word	0x81ae0ad8	! t0_kref+0x1280:   	fcmped	%fcc0, %f24, %f24
	.word	0xd656c018	! t0_kref+0x1284:   	ldsh	[%i3 + %i0], %o3
	.word	0xad408000	! t0_kref+0x1288:   	mov	%ccr, %l6
	.word	0xffa01018	! t0_kref+0x128c:   	sta	%f31, [%g0 + %i0]0x80
	.word	0xb1a01a5e	! t0_kref+0x1290:   	fdtoi	%f30, %f24
	.word	0xb5b78ada	! t0_kref+0x1294:   	fpsub32	%f30, %f26, %f26
	.word	0xd456001b	! t0_kref+0x1298:   	ldsh	[%i0 + %i3], %o2
	.word	0x94b37782	! t0_kref+0x129c:   	orncc	%o5, -0x87e, %o2
	.word	0xd40e4000	! t0_kref+0x12a0:   	ldub	[%i1], %o2
	.word	0x97b605d8	! t0_kref+0x12a4:   	fcmpeq32	%f24, %f24, %o3
	.word	0xda20a00c	! t0_kref+0x12a8:   	st	%o5, [%g2 + 0xc]
	call	SYM(t0_subr2)
	.word	0xf91fbd28	! t0_kref+0x12b0:   	ldd	[%fp - 0x2d8], %f28
	.word	0xbda0193b	! t0_kref+0x12b4:   	fstod	%f27, %f30
	.word	0xf900a038	! t0_kref+0x12b8:   	ld	[%g2 + 0x38], %f28
	.word	0xbfa6c9be	! t0_kref+0x12bc:   	fdivs	%f27, %f30, %f31
	.word	0xe01e6010	! t0_kref+0x12c0:   	ldd	[%i1 + 0x10], %l0
	.word	0x23800005	! t0_kref+0x12c4:   	fbne,a	_kref+0x12d8
	.word	0xb7a749ba	! t0_kref+0x12c8:   	fdivs	%f29, %f26, %f27
	.word	0xb5b64978	! t0_kref+0x12cc:   	fpmerge	%f25, %f24, %f26
	.word	0x90f36399	! t0_kref+0x12d0:   	udivcc	%o5, 0x399, %o0
	.word	0x81af0ad8	! t0_kref+0x12d4:   	fcmped	%fcc0, %f28, %f24
	.word	0xb1a7085c	! t0_kref+0x12d8:   	faddd	%f28, %f28, %f24
	.word	0xf9267fec	! t0_kref+0x12dc:   	st	%f28, [%i1 - 0x14]
	.word	0xb9b00cde	! t0_kref+0x12e0:   	fnot2	%f30, %f28
	.word	0xec163ffe	! t0_kref+0x12e4:   	lduh	[%i0 - 2], %l6
	.word	0xd4062004	! t0_kref+0x12e8:   	ld	[%i0 + 4], %o2
	.word	0xb9a7cd3e	! t0_kref+0x12ec:   	fsmuld	%f31, %f30, %f28
	.word	0xb1a789b9	! t0_kref+0x12f0:   	fdivs	%f30, %f25, %f24
	.word	0xbda00539	! t0_kref+0x12f4:   	fsqrts	%f25, %f30
	.word	0xe80e201a	! t0_kref+0x12f8:   	ldub	[%i0 + 0x1a], %l4
	.word	0xec50a024	! t0_kref+0x12fc:   	ldsh	[%g2 + 0x24], %l6
	.word	0xec08a008	! t0_kref+0x1300:   	ldub	[%g2 + 8], %l6
	.word	0xf51e6000	! t0_kref+0x1304:   	ldd	[%i1], %f26
	.word	0xea080019	! t0_kref+0x1308:   	ldub	[%g0 + %i1], %l5
	.word	0xbfb7cdfa	! t0_kref+0x130c:   	fnands	%f31, %f26, %f31
	.word	0xf520a018	! t0_kref+0x1310:   	st	%f26, [%g2 + 0x18]
	.word	0xabb3430d	! t0_kref+0x1314:   	alignaddr	%o5, %o5, %l5
	.word	0xea06001c	! t0_kref+0x1318:   	ld	[%i0 + %i4], %l5
	.word	0xa7b3416d	! t0_kref+0x131c:   	edge32ln	%o5, %o5, %l3
	.word	0xea56c019	! t0_kref+0x1320:   	ldsh	[%i3 + %i1], %l5
	.word	0xe8166014	! t0_kref+0x1324:   	lduh	[%i1 + 0x14], %l4
	.word	0xdab61000	! t0_kref+0x1328:   	stha	%o5, [%i0]0x80
	.word	0xdaf6501d	! t0_kref+0x132c:   	stxa	%o5, [%i1 + %i5]0x80
	.word	0x81af4a3b	! t0_kref+0x1330:   	fcmps	%fcc0, %f29, %f27
	.word	0xf19eda18	! t0_kref+0x1334:   	ldda	[%i3 + %i0]0xd0, %f24
	.word	0xabb3404d	! t0_kref+0x1338:   	edge8l	%o5, %o5, %l5
	.word	0xd4070019	! t0_kref+0x133c:   	ld	[%i4 + %i1], %o2
	.word	0x91b3410d	! t0_kref+0x1340:   	edge32	%o5, %o5, %o0
	.word	0xbda6c9bd	! t0_kref+0x1344:   	fdivs	%f27, %f29, %f30
	.word	0xda760000	! t0_kref+0x1348:   	stx	%o5, [%i0]
	.word	0xb5a0053b	! t0_kref+0x134c:   	fsqrts	%f27, %f26
	.word	0x95b3406d	! t0_kref+0x1350:   	edge8ln	%o5, %o5, %o2
	.word	0xac0b7879	! t0_kref+0x1354:   	and	%o5, -0x787, %l6
	.word	0xe80e3fe1	! t0_kref+0x1358:   	ldub	[%i0 - 0x1f], %l4
	.word	0x9423710f	! t0_kref+0x135c:   	sub	%o5, -0xef1, %o2
	.word	0xda200019	! t0_kref+0x1360:   	st	%o5, [%g0 + %i1]
	.word	0xb1a6c9ba	! t0_kref+0x1364:   	fdivs	%f27, %f26, %f24
	.word	0xea40a030	! t0_kref+0x1368:   	ldsw	[%g2 + 0x30], %l5
	.word	0x97b3410d	! t0_kref+0x136c:   	edge32	%o5, %o5, %o3
	.word	0xe80e8019	! t0_kref+0x1370:   	ldub	[%i2 + %i1], %l4
	.word	0xda20a034	! t0_kref+0x1374:   	st	%o5, [%g2 + 0x34]
	.word	0xb5b78ade	! t0_kref+0x1378:   	fpsub32	%f30, %f30, %f26
	.word	0xb9b00fe0	! t0_kref+0x137c:   	fones	%f28
	.word	0xbbb00f3a	! t0_kref+0x1380:   	fsrc2s	%f26, %f29
	.word	0xe6064000	! t0_kref+0x1384:   	ld	[%i1], %l3
	.word	0xee0e001a	! t0_kref+0x1388:   	ldub	[%i0 + %i2], %l7
	.word	0xfb200018	! t0_kref+0x138c:   	st	%f29, [%g0 + %i0]
	.word	0xb9b68679	! t0_kref+0x1390:   	fmul8x16au	%f26, %f25, %f28
	.word	0xabb3430d	! t0_kref+0x1394:   	alignaddr	%o5, %o5, %l5
	.word	0xbdb7091a	! t0_kref+0x1398:   	faligndata	%f28, %f26, %f30
	.word	0xd000a018	! t0_kref+0x139c:   	ld	[%g2 + 0x18], %o0
	.word	0x81af4a3e	! t0_kref+0x13a0:   	fcmps	%fcc0, %f29, %f30
	.word	0xe83e2010	! t0_kref+0x13a4:   	std	%l4, [%i0 + 0x10]
	.word	0xee066018	! t0_kref+0x13a8:   	ld	[%i1 + 0x18], %l7
	.word	0xd64e6017	! t0_kref+0x13ac:   	ldsb	[%i1 + 0x17], %o3
	.word	0xda20a02c	! t0_kref+0x13b0:   	st	%o5, [%g2 + 0x2c]
	.word	0xadb3408d	! t0_kref+0x13b4:   	edge16	%o5, %o5, %l6
	.word	0xee563ffe	! t0_kref+0x13b8:   	ldsh	[%i0 - 2], %l7
	.word	0xbba688b9	! t0_kref+0x13bc:   	fsubs	%f26, %f25, %f29
	.word	0xf9066010	! t0_kref+0x13c0:   	ld	[%i1 + 0x10], %f28
	.word	0xd04e6003	! t0_kref+0x13c4:   	ldsb	[%i1 + 3], %o0
	.word	0x93b34200	! t0_kref+0x13c8:   	array8	%o5, %g0, %o1
	.word	0xbdb78a7a	! t0_kref+0x13cc:   	fpadd32s	%f30, %f26, %f30
	.word	0xe60e7fe8	! t0_kref+0x13d0:   	ldub	[%i1 - 0x18], %l3
	.word	0xd216c018	! t0_kref+0x13d4:   	lduh	[%i3 + %i0], %o1
	.word	0xd2566008	! t0_kref+0x13d8:   	ldsh	[%i1 + 8], %o1
	.word	0xf7ee501b	! t0_kref+0x13dc:   	prefetcha	%i1 + %i3, 27
	.word	0xda266008	! t0_kref+0x13e0:   	st	%o5, [%i1 + 8]
	.word	0x95b3402d	! t0_kref+0x13e4:   	edge8n	%o5, %o5, %o2
	.word	0xbfa0053f	! t0_kref+0x13e8:   	fsqrts	%f31, %f31
	.word	0x96ab400d	! t0_kref+0x13ec:   	andncc	%o5, %o5, %o3
	.word	0xec06001c	! t0_kref+0x13f0:   	ld	[%i0 + %i4], %l6
	.word	0x913b400d	! t0_kref+0x13f4:   	sra	%o5, %o5, %o0
	.word	0xe650a02c	! t0_kref+0x13f8:   	ldsh	[%g2 + 0x2c], %l3
	.word	0xad0b400d	! t0_kref+0x13fc:   	tsubcc	%o5, %o5, %l6
	.word	0xf100a01c	! t0_kref+0x1400:   	ld	[%g2 + 0x1c], %f24
	.word	0xee166010	! t0_kref+0x1404:   	lduh	[%i1 + 0x10], %l7
	.word	0xe9ee101d	! t0_kref+0x1408:   	prefetcha	%i0 + %i5, 20
	.word	0xfd1e4000	! t0_kref+0x140c:   	ldd	[%i1], %f30
	.word	0x85836ffa	! t0_kref+0x1410:   	wr	%o5, 0xffa, %ccr
	.word	0x22800003	! t0_kref+0x1414:   	be,a	_kref+0x1420
	.word	0xea066008	! t0_kref+0x1418:   	ld	[%i1 + 8], %l5
	.word	0xb5a00158	! t0_kref+0x141c:   	fabsd	%f24, %f26
	.word	0xd0060000	! t0_kref+0x1420:   	ld	[%i0], %o0
	.word	0xb9a688da	! t0_kref+0x1424:   	fsubd	%f26, %f26, %f28
	.word	0x81834000	! t0_kref+0x1428:   	wr	%o5, %g0, %y
	.word	0xbfa018dc	! t0_kref+0x142c:   	fdtos	%f28, %f31
	.word	0xc768a04c	! t0_kref+0x1430:   	prefetch	%g2 + 0x4c, 3
	.word	0xda28a035	! t0_kref+0x1434:   	stb	%o5, [%g2 + 0x35]
	.word	0xb9a0003e	! t0_kref+0x1438:   	fmovs	%f30, %f28
	.word	0x9de3bfa0	! t0_kref+0x143c:   	save	%sp, -0x60, %sp
	.word	0x93e82508	! t0_kref+0x1440:   	restore	%g0, 0x508, %o1
	.word	0xea070018	! t0_kref+0x1444:   	ld	[%i4 + %i0], %l5
	.word	0xd6080018	! t0_kref+0x1448:   	ldub	[%g0 + %i0], %o3
	.word	0xe5e6100d	! t0_kref+0x144c:   	casa	[%i0]0x80, %o5, %l2
	.word	0xda28a029	! t0_kref+0x1450:   	stb	%o5, [%g2 + 0x29]
	.word	0x81af8ada	! t0_kref+0x1454:   	fcmped	%fcc0, %f30, %f26
	.word	0xd400a02c	! t0_kref+0x1458:   	ld	[%g2 + 0x2c], %o2
	.word	0xb5b6091e	! t0_kref+0x145c:   	faligndata	%f24, %f30, %f26
	.word	0xb1a018da	! t0_kref+0x1460:   	fdtos	%f26, %f24
	.word	0xf9be588d	! t0_kref+0x1464:   	stda	%f28, [%i1 + %o5]0xc4
	.word	0xee48a024	! t0_kref+0x1468:   	ldsb	[%g2 + 0x24], %l7
	.word	0xbba8c038	! t0_kref+0x146c:   	fmovsul	%fcc0, %f24, %f29
	.word	0xee0e401a	! t0_kref+0x1470:   	ldub	[%i1 + %i2], %l7
	.word	0xd010a010	! t0_kref+0x1474:   	lduh	[%g2 + 0x10], %o0
	.word	0xbda0055a	! t0_kref+0x1478:   	fsqrtd	%f26, %f30
	.word	0xff263fec	! t0_kref+0x147c:   	st	%f31, [%i0 - 0x14]
	.word	0xac93400d	! t0_kref+0x1480:   	orcc	%o5, %o5, %l6
	.word	0x973b400d	! t0_kref+0x1484:   	sra	%o5, %o5, %o3
	.word	0xbdb00fc0	! t0_kref+0x1488:   	fone	%f30
	.word	0x95b3432d	! t0_kref+0x148c:   	bmask	%o5, %o5, %o2
	.word	0xbfb007ba	! t0_kref+0x1490:   	fpackfix	%f26, %f31
	.word	0xec40a034	! t0_kref+0x1494:   	ldsw	[%g2 + 0x34], %l6
	.word	0xae83400d	! t0_kref+0x1498:   	addcc	%o5, %o5, %l7
	.word	0xadb3410d	! t0_kref+0x149c:   	edge32	%o5, %o5, %l6
	.word	0x960b6974	! t0_kref+0x14a0:   	and	%o5, 0x974, %o3
	.word	0xf5066018	! t0_kref+0x14a4:   	ld	[%i1 + 0x18], %f26
	.word	0x81ae0a5c	! t0_kref+0x14a8:   	fcmpd	%fcc0, %f24, %f28
	.word	0x96e37099	! t0_kref+0x14ac:   	subccc	%o5, -0xf67, %o3
	.word	0xb9b7873b	! t0_kref+0x14b0:   	fmuld8ulx16	%f30, %f27, %f28
	.word	0xf100a028	! t0_kref+0x14b4:   	ld	[%g2 + 0x28], %f24
	.word	0xb8102004	! t0_kref+0x14b8:   	mov	0x4, %i4
	.word	0xb1b78998	! t0_kref+0x14bc:   	bshuffle	%f30, %f24, %f24
	.word	0xa944c000	! t0_kref+0x14c0:   	mov	%gsr, %l4
	.word	0xbba000bd	! t0_kref+0x14c4:   	fnegs	%f29, %f29
	.word	0xbfa649bf	! t0_kref+0x14c8:   	fdivs	%f25, %f31, %f31
	.word	0xda2e401a	! t0_kref+0x14cc:   	stb	%o5, [%i1 + %i2]
	.word	0xb9b6463a	! t0_kref+0x14d0:   	fmul8x16	%f25, %f26, %f28
	.word	0xea063fe4	! t0_kref+0x14d4:   	ld	[%i0 - 0x1c], %l5
	.word	0x92d3400d	! t0_kref+0x14d8:   	umulcc	%o5, %o5, %o1
	.word	0x95702dd7	! t0_kref+0x14dc:   	popc	0xdd7, %o2
	.word	0x2b25bc25	! t0_kref+0x14e0:   	sethi	%hi(0x96f09400), %l5
	.word	0xbdb00cdc	! t0_kref+0x14e4:   	fnot2	%f28, %f30
	.word	0xd44e6005	! t0_kref+0x14e8:   	ldsb	[%i1 + 5], %o2
	.word	0xbfa000ba	! t0_kref+0x14ec:   	fnegs	%f26, %f31
	.word	0xa6a37eb7	! t0_kref+0x14f0:   	subcc	%o5, -0x149, %l3
	.word	0xee164000	! t0_kref+0x14f4:   	lduh	[%i1], %l7
	.word	0xb9b60f9a	! t0_kref+0x14f8:   	for	%f24, %f26, %f28
	.word	0x81af0a58	! t0_kref+0x14fc:   	fcmpd	%fcc0, %f28, %f24
	.word	0xd20e3fea	! t0_kref+0x1500:   	ldub	[%i0 - 0x16], %o1
	.word	0x97b3410d	! t0_kref+0x1504:   	edge32	%o5, %o5, %o3
	.word	0xb1b70f58	! t0_kref+0x1508:   	fornot1	%f28, %f24, %f24
	.word	0x9344c000	! t0_kref+0x150c:   	mov	%gsr, %o1
	.word	0xf900a010	! t0_kref+0x1510:   	ld	[%g2 + 0x10], %f28
	.word	0xb3a0189b	! t0_kref+0x1514:   	fitos	%f27, %f25
	.word	0xd07e7fe8	! t0_kref+0x1518:   	swap	[%i1 - 0x18], %o0
	.word	0x920b400d	! t0_kref+0x151c:   	and	%o5, %o5, %o1
	.word	0xff00a018	! t0_kref+0x1520:   	ld	[%g2 + 0x18], %f31
	.word	0x96036fe3	! t0_kref+0x1524:   	add	%o5, 0xfe3, %o3
	.word	0x878020d2	! t0_kref+0x1528:   	mov	0xd2, %asi
	.word	0xd256c018	! t0_kref+0x152c:   	ldsh	[%i3 + %i0], %o1
	.word	0xbfa00539	! t0_kref+0x1530:   	fsqrts	%f25, %f31
	.word	0xda20a020	! t0_kref+0x1534:   	st	%o5, [%g2 + 0x20]
	.word	0xbfa689b8	! t0_kref+0x1538:   	fdivs	%f26, %f24, %f31
	.word	0xd44e8019	! t0_kref+0x153c:   	ldsb	[%i2 + %i1], %o2
	.word	0xb1b78918	! t0_kref+0x1540:   	faligndata	%f30, %f24, %f24
	.word	0xb5a0053a	! t0_kref+0x1544:   	fsqrts	%f26, %f26
	.word	0xec480019	! t0_kref+0x1548:   	ldsb	[%g0 + %i1], %l6
	.word	0xaeb37022	! t0_kref+0x154c:   	orncc	%o5, -0xfde, %l7
	.word	0xb3a0053d	! t0_kref+0x1550:   	fsqrts	%f29, %f25
	.word	0xe8167fe0	! t0_kref+0x1554:   	lduh	[%i1 - 0x20], %l4
	.word	0xd250a038	! t0_kref+0x1558:   	ldsh	[%g2 + 0x38], %o1
	.word	0xf1180019	! t0_kref+0x155c:   	ldd	[%g0 + %i1], %f24
	.word	0xb3b60ea0	! t0_kref+0x1560:   	fsrc1s	%f24, %f25
	.word	0xa6db400d	! t0_kref+0x1564:   	smulcc	%o5, %o5, %l3
	.word	0x81dd0004	! t0_kref+0x1568:   	flush	%l4 + %g4
	.word	0xafb3410d	! t0_kref+0x156c:   	edge32	%o5, %o5, %l7
	.word	0x91b3406d	! t0_kref+0x1570:   	edge8ln	%o5, %o5, %o0
	.word	0xb5a689bb	! t0_kref+0x1574:   	fdivs	%f26, %f27, %f26
	.word	0xec50a038	! t0_kref+0x1578:   	ldsh	[%g2 + 0x38], %l6
	.word	0xda30a022	! t0_kref+0x157c:   	sth	%o5, [%g2 + 0x22]
	.word	0xa73b400d	! t0_kref+0x1580:   	sra	%o5, %o5, %l3
	.word	0xd60e8019	! t0_kref+0x1584:   	ldub	[%i2 + %i1], %o3
	.word	0xee566006	! t0_kref+0x1588:   	ldsh	[%i1 + 6], %l7
	.word	0xd416600c	! t0_kref+0x158c:   	lduh	[%i1 + 0xc], %o2
	.word	0xbda0055c	! t0_kref+0x1590:   	fsqrtd	%f28, %f30
	.word	0xff067fe8	! t0_kref+0x1594:   	ld	[%i1 - 0x18], %f31
	.word	0xe60e4000	! t0_kref+0x1598:   	ldub	[%i1], %l3
	.word	0xd00e8019	! t0_kref+0x159c:   	ldub	[%i2 + %i1], %o0
	.word	0xbfa609bb	! t0_kref+0x15a0:   	fdivs	%f24, %f27, %f31
	.word	0xf1be5a1c	! t0_kref+0x15a4:   	stda	%f24, [%i1 + %i4]0xd0
	.word	0xf100a018	! t0_kref+0x15a8:   	ld	[%g2 + 0x18], %f24
	.word	0x81df8018	! t0_kref+0x15ac:   	flush	%fp + %i0
	.word	0xea164000	! t0_kref+0x15b0:   	lduh	[%i1], %l5
	.word	0xef68a006	! t0_kref+0x15b4:   	prefetch	%g2 + 6, 23
	.word	0xf300a028	! t0_kref+0x15b8:   	ld	[%g2 + 0x28], %f25
	.word	0x81debb40	! t0_kref+0x15bc:   	flush	%i2 - 0x4c0
	.word	0xe84e601d	! t0_kref+0x15c0:   	ldsb	[%i1 + 0x1d], %l4
	.word	0xec5e3fe8	! t0_kref+0x15c4:   	ldx	[%i0 - 0x18], %l6
	.word	0xaac3400d	! t0_kref+0x15c8:   	addccc	%o5, %o5, %l5
	.word	0x81db4019	! t0_kref+0x15cc:   	flush	%o5 + %i1
	.word	0xf91e2000	! t0_kref+0x15d0:   	ldd	[%i0], %f28
	.word	0xea16c018	! t0_kref+0x15d4:   	lduh	[%i3 + %i0], %l5
	.word	0xea48a003	! t0_kref+0x15d8:   	ldsb	[%g2 + 3], %l5
	.word	0xee4e001a	! t0_kref+0x15dc:   	ldsb	[%i0 + %i2], %l7
	.word	0xd248a02b	! t0_kref+0x15e0:   	ldsb	[%g2 + 0x2b], %o1
	.word	0xb9b60e1e	! t0_kref+0x15e4:   	fand	%f24, %f30, %f28
	.word	0x94036d3d	! t0_kref+0x15e8:   	add	%o5, 0xd3d, %o2
	.word	0xb1b6ce3c	! t0_kref+0x15ec:   	fands	%f27, %f28, %f24
	.word	0xd448a015	! t0_kref+0x15f0:   	ldsb	[%g2 + 0x15], %o2
	.word	0xea167fec	! t0_kref+0x15f4:   	lduh	[%i1 - 0x14], %l5
	.word	0x39480003	! t0_kref+0x15f8:   	fbuge,a,pt	%fcc0, _kref+0x1604
	.word	0xadb3430d	! t0_kref+0x15fc:   	alignaddr	%o5, %o5, %l6
	.word	0x97408000	! t0_kref+0x1600:   	mov	%ccr, %o3
	.word	0xe01f4019	! t0_kref+0x1604:   	ldd	[%i5 + %i1], %l0
	.word	0xda28a006	! t0_kref+0x1608:   	stb	%o5, [%g2 + 6]
	.word	0xa7b3404d	! t0_kref+0x160c:   	edge8l	%o5, %o5, %l3
	.word	0xf1063ff4	! t0_kref+0x1610:   	ld	[%i0 - 0xc], %f24
	.word	0x2a800001	! t0_kref+0x1614:   	bcs,a	_kref+0x1618
	.word	0xd4100019	! t0_kref+0x1618:   	lduh	[%g0 + %i1], %o2
	.word	0xb1a0191a	! t0_kref+0x161c:   	fitod	%f26, %f24
	.word	0xa9418000	! t0_kref+0x1620:   	mov	%fprs, %l4
	.word	0xf11e401d	! t0_kref+0x1624:   	ldd	[%i1 + %i5], %f24
	.word	0xd2062010	! t0_kref+0x1628:   	ld	[%i0 + 0x10], %o1
	.word	0xd400a008	! t0_kref+0x162c:   	ld	[%g2 + 8], %o2
	.word	0xd0500019	! t0_kref+0x1630:   	ldsh	[%g0 + %i1], %o0
	.word	0xb5a649b9	! t0_kref+0x1634:   	fdivs	%f25, %f25, %f26
	.word	0xd04e2009	! t0_kref+0x1638:   	ldsb	[%i0 + 9], %o0
	.word	0xb9a0189b	! t0_kref+0x163c:   	fitos	%f27, %f28
	.word	0xd00e3fed	! t0_kref+0x1640:   	ldub	[%i0 - 0x13], %o0
	.word	0xd2070018	! t0_kref+0x1644:   	ld	[%i4 + %i0], %o1
	.word	0xb5b7ca7a	! t0_kref+0x1648:   	fpadd32s	%f31, %f26, %f26
	.word	0x97b605da	! t0_kref+0x164c:   	fcmpeq32	%f24, %f26, %o3
	.word	0xd408a00b	! t0_kref+0x1650:   	ldub	[%g2 + 0xb], %o2
	.word	0xd648a030	! t0_kref+0x1654:   	ldsb	[%g2 + 0x30], %o3
	.word	0xf1be584d	! t0_kref+0x1658:   	stda	%f24, [%i1 + %o5]0xc2
	.word	0xd2063ff0	! t0_kref+0x165c:   	ld	[%i0 - 0x10], %o1
	.word	0xe84e001a	! t0_kref+0x1660:   	ldsb	[%i0 + %i2], %l4
	.word	0xb7a0053d	! t0_kref+0x1664:   	fsqrts	%f29, %f27
	.word	0x922b65e8	! t0_kref+0x1668:   	andn	%o5, 0x5e8, %o1
	.word	0xe60e601c	! t0_kref+0x166c:   	ldub	[%i1 + 0x1c], %l3
	.word	0xb5b74718	! t0_kref+0x1670:   	fmuld8sux16	%f29, %f24, %f26
	.word	0xf120a000	! t0_kref+0x1674:   	st	%f24, [%g2]
	.word	0xef68a042	! t0_kref+0x1678:   	prefetch	%g2 + 0x42, 23
	.word	0xee4e3ff6	! t0_kref+0x167c:   	ldsb	[%i0 - 0xa], %l7
	.word	0xd40e201a	! t0_kref+0x1680:   	ldub	[%i0 + 0x1a], %o2
	.word	0xf51e2000	! t0_kref+0x1684:   	ldd	[%i0], %f26
	.word	0x8d83400d	! t0_kref+0x1688:   	wr	%o5, %o5, %fprs
	.word	0xa7b6851c	! t0_kref+0x168c:   	fcmpgt16	%f26, %f28, %l3
	.word	0xec460000	! t0_kref+0x1690:   	ldsw	[%i0], %l6
	.word	0xd448a01a	! t0_kref+0x1694:   	ldsb	[%g2 + 0x1a], %o2
	.word	0xa6237fba	! t0_kref+0x1698:   	sub	%o5, -0x46, %l3
	.word	0xbda0055a	! t0_kref+0x169c:   	fsqrtd	%f26, %f30
	.word	0xbda689ba	! t0_kref+0x16a0:   	fdivs	%f26, %f26, %f30
	.word	0xb3b0077c	! t0_kref+0x16a4:   	fpack16	%f28, %f25
	.word	0xae1b400d	! t0_kref+0x16a8:   	xor	%o5, %o5, %l7
	.word	0xf1be184d	! t0_kref+0x16ac:   	stda	%f24, [%i0 + %o5]0xc2
	.word	0xd6062014	! t0_kref+0x16b0:   	ld	[%i0 + 0x14], %o3
	.word	0xdaf01018	! t0_kref+0x16b4:   	stxa	%o5, [%g0 + %i0]0x80
	.word	0xe66e8019	! t0_kref+0x16b8:   	ldstub	[%i2 + %i1], %l3
	.word	0xf11e3fe8	! t0_kref+0x16bc:   	ldd	[%i0 - 0x18], %f24
	.word	0xa7836e2e	! t0_kref+0x16c0:   	wr	%o5, 0xe2e, %gsr
	.word	0xf9beda19	! t0_kref+0x16c4:   	stda	%f28, [%i3 + %i1]0xd0
	.word	0xd2062004	! t0_kref+0x16c8:   	ld	[%i0 + 4], %o1
	.word	0xd4067ff8	! t0_kref+0x16cc:   	ld	[%i1 - 8], %o2
	.word	0xee4e0000	! t0_kref+0x16d0:   	ldsb	[%i0], %l7
	.word	0xabb34240	! t0_kref+0x16d4:   	array16	%o5, %g0, %l5
	.word	0xbbb7cef9	! t0_kref+0x16d8:   	fornot2s	%f31, %f25, %f29
	.word	0xe7ee501a	! t0_kref+0x16dc:   	prefetcha	%i1 + %i2, 19
	.word	0xb7a0003d	! t0_kref+0x16e0:   	fmovs	%f29, %f27
	.word	0xea064000	! t0_kref+0x16e4:   	ld	[%i1], %l5
	.word	0xd40e7ff7	! t0_kref+0x16e8:   	ldub	[%i1 - 9], %o2
	.word	0x001fffff	! t0_kref+0x16ec:   	illtrap	0x1fffff
	.word	0x9483400d	! t0_kref+0x16f0:   	addcc	%o5, %o5, %o2
	.word	0xb1b00cd8	! t0_kref+0x16f4:   	fnot2	%f24, %f24
	.word	0xb9b009bc	! t0_kref+0x16f8:   	fexpand	%f28, %f28
	.word	0xb7a6c9b8	! t0_kref+0x16fc:   	fdivs	%f27, %f24, %f27
	.word	0xb410201c	! t0_kref+0x1700:   	mov	0x1c, %i2
	.word	0xd640a038	! t0_kref+0x1704:   	ldsw	[%g2 + 0x38], %o3
	.word	0xaf23400d	! t0_kref+0x1708:   	mulscc	%o5, %o5, %l7
	.word	0xb8103ff4	! t0_kref+0x170c:   	mov	0xfffffff4, %i4
	.word	0xee066000	! t0_kref+0x1710:   	ld	[%i1], %l7
	.word	0xbdb60d9c	! t0_kref+0x1714:   	fxor	%f24, %f28, %f30
	.word	0xf1be101d	! t0_kref+0x1718:   	stda	%f24, [%i0 + %i5]0x80
	.word	0xb1b78d9c	! t0_kref+0x171c:   	fxor	%f30, %f28, %f24
	.word	0xbda0193a	! t0_kref+0x1720:   	fstod	%f26, %f30
	.word	0x001fffff	! t0_kref+0x1724:   	illtrap	0x1fffff
	.word	0xbdb00f1e	! t0_kref+0x1728:   	fsrc2	%f30, %f30
	.word	0xff00a01c	! t0_kref+0x172c:   	ld	[%g2 + 0x1c], %f31
	.word	0xfb263ff0	! t0_kref+0x1730:   	st	%f29, [%i0 - 0x10]
	.word	0xbba749be	! t0_kref+0x1734:   	fdivs	%f29, %f30, %f29
	.word	0xd40e7ff1	! t0_kref+0x1738:   	ldub	[%i1 - 0xf], %o2
	.word	0xf500a004	! t0_kref+0x173c:   	ld	[%g2 + 4], %f26
	.word	0xbda01899	! t0_kref+0x1740:   	fitos	%f25, %f30
	.word	0xee16c019	! t0_kref+0x1744:   	lduh	[%i3 + %i1], %l7
	.word	0x8143c000	! t0_kref+0x1748:   	stbar
	.word	0x11001a0a	! t0_kref+0x174c:   	sethi	%hi(0x682800), %o0
	.word	0xaf1b400d	! t0_kref+0x1750:   	tsubcctv	%o5, %o5, %l7
	.word	0xe616c019	! t0_kref+0x1754:   	lduh	[%i3 + %i1], %l3
	.word	0xda30a02e	! t0_kref+0x1758:   	sth	%o5, [%g2 + 0x2e]
	.word	0x922b400d	! t0_kref+0x175c:   	andn	%o5, %o5, %o1
	.word	0xea40a034	! t0_kref+0x1760:   	ldsw	[%g2 + 0x34], %l5
	.word	0xda362006	! t0_kref+0x1764:   	sth	%o5, [%i0 + 6]
	.word	0xd2063fe0	! t0_kref+0x1768:   	ld	[%i0 - 0x20], %o1
	.word	0xd0060000	! t0_kref+0x176c:   	ld	[%i0], %o0
	.word	0xb5a00139	! t0_kref+0x1770:   	fabss	%f25, %f26
	.word	0xee000018	! t0_kref+0x1774:   	ld	[%g0 + %i0], %l7
	.word	0xe8be501d	! t0_kref+0x1778:   	stda	%l4, [%i1 + %i5]0x80
	.word	0x95b3412d	! t0_kref+0x177c:   	edge32n	%o5, %o5, %o2
	.word	0xe6066018	! t0_kref+0x1780:   	ld	[%i1 + 0x18], %l3
	.word	0xd478a00c	! t0_kref+0x1784:   	swap	[%g2 + 0xc], %o2
	.word	0xf91f4019	! t0_kref+0x1788:   	ldd	[%i5 + %i1], %f28
	.word	0x92237fd6	! t0_kref+0x178c:   	sub	%o5, -0x2a, %o1
	.word	0xd04e601d	! t0_kref+0x1790:   	ldsb	[%i1 + 0x1d], %o0
	.word	0xbfa0053c	! t0_kref+0x1794:   	fsqrts	%f28, %f31
	.word	0x923b726c	! t0_kref+0x1798:   	xnor	%o5, -0xd94, %o1
	.word	0xda30a034	! t0_kref+0x179c:   	sth	%o5, [%g2 + 0x34]
	.word	0xda20a03c	! t0_kref+0x17a0:   	st	%o5, [%g2 + 0x3c]
	.word	0xf1be188d	! t0_kref+0x17a4:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0x9de3bfa0	! t0_kref+0x17a8:   	save	%sp, -0x60, %sp
	.word	0x97ee3230	! t0_kref+0x17ac:   	restore	%i0, -0xdd0, %o3
	.word	0xf9be5a5d	! t0_kref+0x17b0:   	stda	%f28, [%i1 + %i5]0xd2
	.word	0xf900a038	! t0_kref+0x17b4:   	ld	[%g2 + 0x38], %f28
	.word	0xd440a010	! t0_kref+0x17b8:   	ldsw	[%g2 + 0x10], %o2
	.word	0xb9b0077e	! t0_kref+0x17bc:   	fpack16	%f30, %f28
	.word	0xbdb00f1a	! t0_kref+0x17c0:   	fsrc2	%f26, %f30
	.word	0x81af0a58	! t0_kref+0x17c4:   	fcmpd	%fcc0, %f28, %f24
	.word	0xbba00538	! t0_kref+0x17c8:   	fsqrts	%f24, %f29
	.word	0xa6236d6a	! t0_kref+0x17cc:   	sub	%o5, 0xd6a, %l3
	.word	0xe850a006	! t0_kref+0x17d0:   	ldsh	[%g2 + 6], %l4
	.word	0xb9a01058	! t0_kref+0x17d4:   	fdtox	%f24, %f28
	.word	0xf51e7ff8	! t0_kref+0x17d8:   	ldd	[%i1 - 8], %f26
	.word	0xbda6c9be	! t0_kref+0x17dc:   	fdivs	%f27, %f30, %f30
	.word	0xbdb6c97b	! t0_kref+0x17e0:   	fpmerge	%f27, %f27, %f30
	.word	0xf520a008	! t0_kref+0x17e4:   	st	%f26, [%g2 + 8]
	.word	0xea000018	! t0_kref+0x17e8:   	ld	[%g0 + %i0], %l5
	.word	0xb5b00fc0	! t0_kref+0x17ec:   	fone	%f26
	.word	0xbfb70d60	! t0_kref+0x17f0:   	fnot1s	%f28, %f31
	.word	0xfd1fbcf8	! t0_kref+0x17f4:   	ldd	[%fp - 0x308], %f30
	.word	0xff00a014	! t0_kref+0x17f8:   	ld	[%g2 + 0x14], %f31
	.word	0xe6566006	! t0_kref+0x17fc:   	ldsh	[%i1 + 6], %l3
	.word	0xf11f4018	! t0_kref+0x1800:   	ldd	[%i5 + %i0], %f24
	.word	0xda20a004	! t0_kref+0x1804:   	st	%o5, [%g2 + 4]
	.word	0xb1a6c9bd	! t0_kref+0x1808:   	fdivs	%f27, %f29, %f24
	.word	0xb9b00778	! t0_kref+0x180c:   	fpack16	%f24, %f28
	.word	0xe8567ff8	! t0_kref+0x1810:   	ldsh	[%i1 - 8], %l4
	.word	0xd2066010	! t0_kref+0x1814:   	ld	[%i1 + 0x10], %o1
	.word	0xbba0053e	! t0_kref+0x1818:   	fsqrts	%f30, %f29
	.word	0x91b34240	! t0_kref+0x181c:   	array16	%o5, %g0, %o0
	.word	0xe8480019	! t0_kref+0x1820:   	ldsb	[%g0 + %i1], %l4
	.word	0xf91e6000	! t0_kref+0x1824:   	ldd	[%i1], %f28
	.word	0xe64e401a	! t0_kref+0x1828:   	ldsb	[%i1 + %i2], %l3
	.word	0xea062008	! t0_kref+0x182c:   	ld	[%i0 + 8], %l5
	.word	0xb5a709b9	! t0_kref+0x1830:   	fdivs	%f28, %f25, %f26
	.word	0x83414000	! t0_kref+0x1834:   	mov	%pc, %g1
	.word	0xb9b687da	! t0_kref+0x1838:   	pdist	%f26, %f26, %f28
	.word	0xda28a02a	! t0_kref+0x183c:   	stb	%o5, [%g2 + 0x2a]
	.word	0x81b01021	! t0_kref+0x1840:   	siam	0x1
	.word	0xea16601e	! t0_kref+0x1844:   	lduh	[%i1 + 0x1e], %l5
	.word	0xbda01938	! t0_kref+0x1848:   	fstod	%f24, %f30
	.word	0xafb3410d	! t0_kref+0x184c:   	edge32	%o5, %o5, %l7
	.word	0xd608a01b	! t0_kref+0x1850:   	ldub	[%g2 + 0x1b], %o3
	.word	0xf99e1a1b	! t0_kref+0x1854:   	ldda	[%i0 + %i3]0xd0, %f28
	.word	0x31800007	! t0_kref+0x1858:   	fba,a	_kref+0x1874
	.word	0xa613400d	! t0_kref+0x185c:   	or	%o5, %o5, %l3
	.word	0xb7a01899	! t0_kref+0x1860:   	fitos	%f25, %f27
	.word	0xec4e6018	! t0_kref+0x1864:   	ldsb	[%i1 + 0x18], %l6
	.word	0xda36001b	! t0_kref+0x1868:   	sth	%o5, [%i0 + %i3]
	.word	0xbdb78e80	! t0_kref+0x186c:   	fsrc1	%f30, %f30
	.word	0x38800001	! t0_kref+0x1870:   	bgu,a	_kref+0x1874
	.word	0xf3064000	! t0_kref+0x1874:   	ld	[%i1], %f25
	.word	0xfd180019	! t0_kref+0x1878:   	ldd	[%g0 + %i1], %f30
	.word	0xd456200a	! t0_kref+0x187c:   	ldsh	[%i0 + 0xa], %o2
	.word	0xe840a030	! t0_kref+0x1880:   	ldsw	[%g2 + 0x30], %l4
	.word	0xd04e3ff9	! t0_kref+0x1884:   	ldsb	[%i0 - 7], %o0
	.word	0xe650a018	! t0_kref+0x1888:   	ldsh	[%g2 + 0x18], %l3
	.word	0xbba649be	! t0_kref+0x188c:   	fdivs	%f25, %f30, %f29
	.word	0xe848a03d	! t0_kref+0x1890:   	ldsb	[%g2 + 0x3d], %l4
	.word	0xbda708d8	! t0_kref+0x1894:   	fsubd	%f28, %f24, %f30
	.word	0xb9b64e3f	! t0_kref+0x1898:   	fands	%f25, %f31, %f28
	.word	0xac7360d2	! t0_kref+0x189c:   	udiv	%o5, 0xd2, %l6
	.word	0xbba648b9	! t0_kref+0x18a0:   	fsubs	%f25, %f25, %f29
	.word	0xee0e401a	! t0_kref+0x18a4:   	ldub	[%i1 + %i2], %l7
	.word	0xf5180019	! t0_kref+0x18a8:   	ldd	[%g0 + %i1], %f26
	.word	0xfd1e3fe8	! t0_kref+0x18ac:   	ldd	[%i0 - 0x18], %f30
	.word	0xb3a649b9	! t0_kref+0x18b0:   	fdivs	%f25, %f25, %f25
	.word	0xa863400d	! t0_kref+0x18b4:   	subc	%o5, %o5, %l4
	.word	0xbdb78a7f	! t0_kref+0x18b8:   	fpadd32s	%f30, %f31, %f30
	.word	0xd250a000	! t0_kref+0x18bc:   	ldsh	[%g2], %o1
	.word	0x31800003	! t0_kref+0x18c0:   	fba,a	_kref+0x18cc
	.word	0xf7064000	! t0_kref+0x18c4:   	ld	[%i1], %f27
	.word	0xd240a02c	! t0_kref+0x18c8:   	ldsw	[%g2 + 0x2c], %o1
	.word	0x1332f244	! t0_kref+0x18cc:   	sethi	%hi(0xcbc91000), %o1
	.word	0xf900a000	! t0_kref+0x18d0:   	ld	[%g2], %f28
	.word	0x941366db	! t0_kref+0x18d4:   	or	%o5, 0x6db, %o2
	.word	0xb3b00f3f	! t0_kref+0x18d8:   	fsrc2s	%f31, %f25
	.word	0xe8067ff8	! t0_kref+0x18dc:   	ld	[%i1 - 8], %l4
	.word	0xf700a028	! t0_kref+0x18e0:   	ld	[%g2 + 0x28], %f27
	.word	0xd0480018	! t0_kref+0x18e4:   	ldsb	[%g0 + %i0], %o0
	.word	0xbda0189f	! t0_kref+0x18e8:   	fitos	%f31, %f30
	.word	0xadb340cd	! t0_kref+0x18ec:   	edge16l	%o5, %o5, %l6
	.word	0xac0372b8	! t0_kref+0x18f0:   	add	%o5, -0xd48, %l6
	.word	0xd016200c	! t0_kref+0x18f4:   	lduh	[%i0 + 0xc], %o0
	.word	0xe84e3ff3	! t0_kref+0x18f8:   	ldsb	[%i0 - 0xd], %l4
	.word	0x94837d78	! t0_kref+0x18fc:   	addcc	%o5, -0x288, %o2
	.word	0xf1180019	! t0_kref+0x1900:   	ldd	[%g0 + %i1], %f24
	.word	0x907b400d	! t0_kref+0x1904:   	sdiv	%o5, %o5, %o0
	.word	0xa80b400d	! t0_kref+0x1908:   	and	%o5, %o5, %l4
	.word	0xb9a789bb	! t0_kref+0x190c:   	fdivs	%f30, %f27, %f28
	.word	0xe856401b	! t0_kref+0x1910:   	ldsh	[%i1 + %i3], %l4
	.word	0xda20a01c	! t0_kref+0x1914:   	st	%o5, [%g2 + 0x1c]
	.word	0xd6067fec	! t0_kref+0x1918:   	ld	[%i1 - 0x14], %o3
	.word	0xf91e2018	! t0_kref+0x191c:   	ldd	[%i0 + 0x18], %f28
	.word	0xd6000019	! t0_kref+0x1920:   	ld	[%g0 + %i1], %o3
	.word	0xd650a036	! t0_kref+0x1924:   	ldsh	[%g2 + 0x36], %o3
	.word	0xee560000	! t0_kref+0x1928:   	ldsh	[%i0], %l7
	.word	0xb1b78cbf	! t0_kref+0x192c:   	fandnot2s	%f30, %f31, %f24
	.word	0xac13400d	! t0_kref+0x1930:   	or	%o5, %o5, %l6
	.word	0xb8102010	! t0_kref+0x1934:   	mov	0x10, %i4
	.word	0x81dfe9a6	! t0_kref+0x1938:   	flush	%i7 + 0x9a6
	.word	0xb9a0055c	! t0_kref+0x193c:   	fsqrtd	%f28, %f28
	.word	0x91b6051a	! t0_kref+0x1940:   	fcmpgt16	%f24, %f26, %o0
	.word	0xb9b00c00	! t0_kref+0x1944:   	fzero	%f28
	.word	0xb3b64a7d	! t0_kref+0x1948:   	fpadd32s	%f25, %f29, %f25
	.word	0xaa83690e	! t0_kref+0x194c:   	addcc	%o5, 0x90e, %l5
	.word	0xda20a038	! t0_kref+0x1950:   	st	%o5, [%g2 + 0x38]
	.word	0x2f800005	! t0_kref+0x1954:   	fbu,a	_kref+0x1968
	.word	0xbdb70ddc	! t0_kref+0x1958:   	fnand	%f28, %f28, %f30
	.word	0xd6c6501c	! t0_kref+0x195c:   	ldswa	[%i1 + %i4]0x80, %o3
	.word	0xef68a00d	! t0_kref+0x1960:   	prefetch	%g2 + 0xd, 23
	.word	0xb1b6899e	! t0_kref+0x1964:   	bshuffle	%f26, %f30, %f24
	.word	0xe8080018	! t0_kref+0x1968:   	ldub	[%g0 + %i0], %l4
	.word	0xb9b607de	! t0_kref+0x196c:   	pdist	%f24, %f30, %f28
	.word	0xfd1f4019	! t0_kref+0x1970:   	ldd	[%i5 + %i1], %f30
	.word	0xec062018	! t0_kref+0x1974:   	ld	[%i0 + 0x18], %l6
	.word	0xb9b0077a	! t0_kref+0x1978:   	fpack16	%f26, %f28
	.word	0xb3b68a7d	! t0_kref+0x197c:   	fpadd32s	%f26, %f29, %f25
	.word	0xd4480018	! t0_kref+0x1980:   	ldsb	[%g0 + %i0], %o2
	.word	0xc368a049	! t0_kref+0x1984:   	prefetch	%g2 + 0x49, 1
	.word	0xe648a007	! t0_kref+0x1988:   	ldsb	[%g2 + 7], %l3
	.word	0x24800005	! t0_kref+0x198c:   	ble,a	_kref+0x19a0
	.word	0x921376a4	! t0_kref+0x1990:   	or	%o5, -0x95c, %o1
	.word	0xe8100018	! t0_kref+0x1994:   	lduh	[%g0 + %i0], %l4
	.word	0xb1a0053d	! t0_kref+0x1998:   	fsqrts	%f29, %f24
	.word	0xbdb60fbc	! t0_kref+0x199c:   	fors	%f24, %f28, %f30
	.word	0xaed3400d	! t0_kref+0x19a0:   	umulcc	%o5, %o5, %l7
	.word	0xbfa00538	! t0_kref+0x19a4:   	fsqrts	%f24, %f31
	.word	0xab408000	! t0_kref+0x19a8:   	mov	%ccr, %l5
	.word	0xe610a024	! t0_kref+0x19ac:   	lduh	[%g2 + 0x24], %l3
	.word	0xd81e7ff0	! t0_kref+0x19b0:   	ldd	[%i1 - 0x10], %o4
	.word	0x967b400d	! t0_kref+0x19b4:   	sdiv	%o5, %o5, %o3
	.word	0xb1a6895c	! t0_kref+0x19b8:   	fmuld	%f26, %f28, %f24
	.word	0xafb3416d	! t0_kref+0x19bc:   	edge32ln	%o5, %o5, %l7
	.word	0x3e800005	! t0_kref+0x19c0:   	bvc,a	_kref+0x19d4
	.word	0x81b01023	! t0_kref+0x19c4:   	siam	0x3
	.word	0xadb7845a	! t0_kref+0x19c8:   	fcmpne16	%f30, %f26, %l6
	.word	0xf500a01c	! t0_kref+0x19cc:   	ld	[%g2 + 0x1c], %f26
	.word	0x92e3400d	! t0_kref+0x19d0:   	subccc	%o5, %o5, %o1
	.word	0xd050a016	! t0_kref+0x19d4:   	ldsh	[%g2 + 0x16], %o0
	.word	0xec080018	! t0_kref+0x19d8:   	ldub	[%g0 + %i0], %l6
	.word	0x81ae4a3b	! t0_kref+0x19dc:   	fcmps	%fcc0, %f25, %f27
	.word	0xd6164000	! t0_kref+0x19e0:   	lduh	[%i1], %o3
	call	SYM(t0_subr1)
	.word	0x2b2e362f	! t0_kref+0x19e8:   	sethi	%hi(0xb8d8bc00), %l5
	.word	0x91b70518	! t0_kref+0x19ec:   	fcmpgt16	%f28, %f24, %o0
	.word	0xb7b7cea0	! t0_kref+0x19f0:   	fsrc1s	%f31, %f27
	.word	0xc76e7fe8	! t0_kref+0x19f4:   	prefetch	%i1 - 0x18, 3
	.word	0xf51e0000	! t0_kref+0x19f8:   	ldd	[%i0], %f26
	.word	0xb9b7cefd	! t0_kref+0x19fc:   	fornot2s	%f31, %f29, %f28
	.word	0xbdb68e5a	! t0_kref+0x1a00:   	fxnor	%f26, %f26, %f30
	.word	0xda28a01f	! t0_kref+0x1a04:   	stb	%o5, [%g2 + 0x1f]
	.word	0xb1a0055a	! t0_kref+0x1a08:   	fsqrtd	%f26, %f24
	.word	0xbba0053d	! t0_kref+0x1a0c:   	fsqrts	%f29, %f29
	.word	0xf9bf5a18	! t0_kref+0x1a10:   	stda	%f28, [%i5 + %i0]0xd0
	.word	0x91b785d8	! t0_kref+0x1a14:   	fcmpeq32	%f30, %f24, %o0
	.word	0x24800001	! t0_kref+0x1a18:   	ble,a	_kref+0x1a1c
	.word	0xad70000d	! t0_kref+0x1a1c:   	popc	%o5, %l6
	.word	0x94f378a4	! t0_kref+0x1a20:   	udivcc	%o5, -0x75c, %o2
	.word	0xe848a019	! t0_kref+0x1a24:   	ldsb	[%g2 + 0x19], %l4
	.word	0xb1a688da	! t0_kref+0x1a28:   	fsubd	%f26, %f26, %f24
	.word	0xb5b60f5a	! t0_kref+0x1a2c:   	fornot1	%f24, %f26, %f26
	.word	0xb9b6c6b8	! t0_kref+0x1a30:   	fmul8x16al	%f27, %f24, %f28
	.word	0xd6480019	! t0_kref+0x1a34:   	ldsb	[%g0 + %i1], %o3
	.word	0xb5a00558	! t0_kref+0x1a38:   	fsqrtd	%f24, %f26
	.word	0x9083400d	! t0_kref+0x1a3c:   	addcc	%o5, %o5, %o0
	.word	0xda30a03a	! t0_kref+0x1a40:   	sth	%o5, [%g2 + 0x3a]
	.word	0xda28a01b	! t0_kref+0x1a44:   	stb	%o5, [%g2 + 0x1b]
	.word	0xff00a02c	! t0_kref+0x1a48:   	ld	[%g2 + 0x2c], %f31
	.word	0xb1a649ba	! t0_kref+0x1a4c:   	fdivs	%f25, %f26, %f24
	.word	0xadb34240	! t0_kref+0x1a50:   	array16	%o5, %g0, %l6
	.word	0xee070019	! t0_kref+0x1a54:   	ld	[%i4 + %i1], %l7
	.word	0xb5b74a79	! t0_kref+0x1a58:   	fpadd32s	%f29, %f25, %f26
	.word	0xb1a78958	! t0_kref+0x1a5c:   	fmuld	%f30, %f24, %f24
	.word	0xd40e201b	! t0_kref+0x1a60:   	ldub	[%i0 + 0x1b], %o2
	.word	0xd008a02e	! t0_kref+0x1a64:   	ldub	[%g2 + 0x2e], %o0
	.word	0xd448a00d	! t0_kref+0x1a68:   	ldsb	[%g2 + 0xd], %o2
	.word	0xbfa6c9bb	! t0_kref+0x1a6c:   	fdivs	%f27, %f27, %f31
	.word	0xd6100019	! t0_kref+0x1a70:   	lduh	[%g0 + %i1], %o3
	.word	0xd28e9040	! t0_kref+0x1a74:   	lduba	[%i2]0x82, %o1
	.word	0xa9b7051e	! t0_kref+0x1a78:   	fcmpgt16	%f28, %f30, %l4
	.word	0x96db6657	! t0_kref+0x1a7c:   	smulcc	%o5, 0x657, %o3
	.word	0xee063ffc	! t0_kref+0x1a80:   	ld	[%i0 - 4], %l7
	.word	0xd440a028	! t0_kref+0x1a84:   	ldsw	[%g2 + 0x28], %o2
	.word	0xaa83400d	! t0_kref+0x1a88:   	addcc	%o5, %o5, %l5
	.word	0x8d83400d	! t0_kref+0x1a8c:   	wr	%o5, %o5, %fprs
	.word	0xafb3416d	! t0_kref+0x1a90:   	edge32ln	%o5, %o5, %l7
	.word	0xf7070019	! t0_kref+0x1a94:   	ld	[%i4 + %i1], %f27
	.word	0xb3a609ba	! t0_kref+0x1a98:   	fdivs	%f24, %f26, %f25
	.word	0x93b3404d	! t0_kref+0x1a9c:   	edge8l	%o5, %o5, %o1
	.word	0x001fffff	! t0_kref+0x1aa0:   	illtrap	0x1fffff
	.word	0xbdb64ea0	! t0_kref+0x1aa4:   	fsrc1s	%f25, %f30
	.word	0x93408000	! t0_kref+0x1aa8:   	mov	%ccr, %o1
	.word	0xea4e8019	! t0_kref+0x1aac:   	ldsb	[%i2 + %i1], %l5
	.word	0xd050a018	! t0_kref+0x1ab0:   	ldsh	[%g2 + 0x18], %o0
	.word	0x3b800001	! t0_kref+0x1ab4:   	fble,a	_kref+0x1ab8
	.word	0x960b400d	! t0_kref+0x1ab8:   	and	%o5, %o5, %o3
	.word	0xee08a02f	! t0_kref+0x1abc:   	ldub	[%g2 + 0x2f], %l7
	.word	0xff00a014	! t0_kref+0x1ac0:   	ld	[%g2 + 0x14], %f31
	.word	0xee480018	! t0_kref+0x1ac4:   	ldsb	[%g0 + %i0], %l7
	.word	0xb9a0053f	! t0_kref+0x1ac8:   	fsqrts	%f31, %f28
	.word	0xec080018	! t0_kref+0x1acc:   	ldub	[%g0 + %i0], %l6
	.word	0xd450a032	! t0_kref+0x1ad0:   	ldsh	[%g2 + 0x32], %o2
	.word	0x33800001	! t0_kref+0x1ad4:   	fbe,a	_kref+0x1ad8
	.word	0xea562016	! t0_kref+0x1ad8:   	ldsh	[%i0 + 0x16], %l5
	.word	0xa8fb400d	! t0_kref+0x1adc:   	sdivcc	%o5, %o5, %l4
	.word	0xb9a689be	! t0_kref+0x1ae0:   	fdivs	%f26, %f30, %f28
	.word	0xb5b00f3c	! t0_kref+0x1ae4:   	fsrc2s	%f28, %f26
	.word	0xb5b74c79	! t0_kref+0x1ae8:   	fnors	%f29, %f25, %f26
	.word	0xe8080019	! t0_kref+0x1aec:   	ldub	[%g0 + %i1], %l4
	.word	0x95418000	! t0_kref+0x1af0:   	mov	%fprs, %o2
	.word	0xaf70000d	! t0_kref+0x1af4:   	popc	%o5, %l7
	.word	0xe606401c	! t0_kref+0x1af8:   	ld	[%i1 + %i4], %l3
	.word	0xf91e2010	! t0_kref+0x1afc:   	ldd	[%i0 + 0x10], %f28
	.word	0xbfb70cbb	! t0_kref+0x1b00:   	fandnot2s	%f28, %f27, %f31
	.word	0xb6102006	! t0_kref+0x1b04:   	mov	0x6, %i3
	.word	0xee56200a	! t0_kref+0x1b08:   	ldsh	[%i0 + 0xa], %l7
	.word	0xda28a019	! t0_kref+0x1b0c:   	stb	%o5, [%g2 + 0x19]
	.word	0xd4070019	! t0_kref+0x1b10:   	ld	[%i4 + %i1], %o2
	.word	0xb9b64979	! t0_kref+0x1b14:   	fpmerge	%f25, %f25, %f28
	.word	0x3f480004	! t0_kref+0x1b18:   	fbo,a,pt	%fcc0, _kref+0x1b28
	.word	0xbbb64fba	! t0_kref+0x1b1c:   	fors	%f25, %f26, %f29
	.word	0x965b400d	! t0_kref+0x1b20:   	smul	%o5, %o5, %o3
	.word	0xfb070019	! t0_kref+0x1b24:   	ld	[%i4 + %i1], %f29
	.word	0xb1b6cea0	! t0_kref+0x1b28:   	fsrc1s	%f27, %f24
	.word	0x81af8ada	! t0_kref+0x1b2c:   	fcmped	%fcc0, %f30, %f26
	.word	0xee06401c	! t0_kref+0x1b30:   	ld	[%i1 + %i4], %l7
	.word	0xb1b6497a	! t0_kref+0x1b34:   	fpmerge	%f25, %f26, %f24
	.word	0xda28a017	! t0_kref+0x1b38:   	stb	%o5, [%g2 + 0x17]
	.word	0xf300a038	! t0_kref+0x1b3c:   	ld	[%g2 + 0x38], %f25
	.word	0x91b3408d	! t0_kref+0x1b40:   	edge16	%o5, %o5, %o0
	.word	0xd04e3fea	! t0_kref+0x1b44:   	ldsb	[%i0 - 0x16], %o0
	.word	0xadb3410d	! t0_kref+0x1b48:   	edge32	%o5, %o5, %l6
	.word	0xd40e4000	! t0_kref+0x1b4c:   	ldub	[%i1], %o2
	.word	0xd010a01c	! t0_kref+0x1b50:   	lduh	[%g2 + 0x1c], %o0
	.word	0xda30a024	! t0_kref+0x1b54:   	sth	%o5, [%g2 + 0x24]
	.word	0xe84e3fff	! t0_kref+0x1b58:   	ldsb	[%i0 - 1], %l4
	.word	0xd010a02e	! t0_kref+0x1b5c:   	lduh	[%g2 + 0x2e], %o0
	.word	0xb9a0053c	! t0_kref+0x1b60:   	fsqrts	%f28, %f28
	.word	0xb1a7c9bf	! t0_kref+0x1b64:   	fdivs	%f31, %f31, %f24
	.word	0x97400000	! t0_kref+0x1b68:   	mov	%y, %o3
	.word	0xea4e3fef	! t0_kref+0x1b6c:   	ldsb	[%i0 - 0x11], %l5
	.word	0xb9a749be	! t0_kref+0x1b70:   	fdivs	%f29, %f30, %f28
	.word	0xb9b009bd	! t0_kref+0x1b74:   	fexpand	%f29, %f28
	.word	0xa7b60418	! t0_kref+0x1b78:   	fcmple16	%f24, %f24, %l3
	.word	0xf3067ff4	! t0_kref+0x1b7c:   	ld	[%i1 - 0xc], %f25
	.word	0x9093400d	! t0_kref+0x1b80:   	orcc	%o5, %o5, %o0
	.word	0xee40a030	! t0_kref+0x1b84:   	ldsw	[%g2 + 0x30], %l7
	.word	0xb1b78e5a	! t0_kref+0x1b88:   	fxnor	%f30, %f26, %f24
	.word	0x97b7041e	! t0_kref+0x1b8c:   	fcmple16	%f28, %f30, %o3
	.word	0xd60e3ffa	! t0_kref+0x1b90:   	ldub	[%i0 - 6], %o3
	.word	0xd600a038	! t0_kref+0x1b94:   	ld	[%g2 + 0x38], %o3
	.word	0xda20a014	! t0_kref+0x1b98:   	st	%o5, [%g2 + 0x14]
	.word	0xb7a0189d	! t0_kref+0x1b9c:   	fitos	%f29, %f27
	.word	0x3d800006	! t0_kref+0x1ba0:   	fbule,a	_kref+0x1bb8
	.word	0xd006401c	! t0_kref+0x1ba4:   	ld	[%i1 + %i4], %o0
	.word	0xee48a017	! t0_kref+0x1ba8:   	ldsb	[%g2 + 0x17], %l7
	.word	0x94db6e7d	! t0_kref+0x1bac:   	smulcc	%o5, 0xe7d, %o2
	.word	0xb5b706f8	! t0_kref+0x1bb0:   	fmul8ulx16	%f28, %f24, %f26
	.word	0xb5a01a58	! t0_kref+0x1bb4:   	fdtoi	%f24, %f26
	.word	0xb1b7497c	! t0_kref+0x1bb8:   	fpmerge	%f29, %f28, %f24
	.word	0xfd1e6008	! t0_kref+0x1bbc:   	ldd	[%i1 + 8], %f30
	.word	0xea4e3ff1	! t0_kref+0x1bc0:   	ldsb	[%i0 - 0xf], %l5
	.word	0xa9b3404d	! t0_kref+0x1bc4:   	edge8l	%o5, %o5, %l4
	.word	0xfd180018	! t0_kref+0x1bc8:   	ldd	[%g0 + %i0], %f30
	.word	0xbdb78edc	! t0_kref+0x1bcc:   	fornot2	%f30, %f28, %f30
	.word	0xafb68598	! t0_kref+0x1bd0:   	fcmpgt32	%f26, %f24, %l7
	.word	0xec167ff0	! t0_kref+0x1bd4:   	lduh	[%i1 - 0x10], %l6
	.word	0xda28a00c	! t0_kref+0x1bd8:   	stb	%o5, [%g2 + 0xc]
	.word	0xfd20a00c	! t0_kref+0x1bdc:   	st	%f30, [%g2 + 0xc]
	.word	0xb9b64e78	! t0_kref+0x1be0:   	fxnors	%f25, %f24, %f28
	.word	0xf91e3fe0	! t0_kref+0x1be4:   	ldd	[%i0 - 0x20], %f28
	.word	0x81ae8ad8	! t0_kref+0x1be8:   	fcmped	%fcc0, %f26, %f24
	.word	0x92bb7cdc	! t0_kref+0x1bec:   	xnorcc	%o5, -0x324, %o1
	.word	0x94ab61e9	! t0_kref+0x1bf0:   	andncc	%o5, 0x1e9, %o2
	.word	0xb5a00558	! t0_kref+0x1bf4:   	fsqrtd	%f24, %f26
	.word	0xf120a01c	! t0_kref+0x1bf8:   	st	%f24, [%g2 + 0x1c]
	.word	0xd8180019	! t0_kref+0x1bfc:   	ldd	[%g0 + %i1], %o4
	.word	0xda30a022	! t0_kref+0x1c00:   	sth	%o5, [%g2 + 0x22]
	.word	0x92d3400d	! t0_kref+0x1c04:   	umulcc	%o5, %o5, %o1
	.word	0xec40a00c	! t0_kref+0x1c08:   	ldsw	[%g2 + 0xc], %l6
	.word	0xda262000	! t0_kref+0x1c0c:   	st	%o5, [%i0]
	.word	0xae83400d	! t0_kref+0x1c10:   	addcc	%o5, %o5, %l7
	.word	0xd640a03c	! t0_kref+0x1c14:   	ldsw	[%g2 + 0x3c], %o3
	.word	0xda20a020	! t0_kref+0x1c18:   	st	%o5, [%g2 + 0x20]
	.word	0xb9b68918	! t0_kref+0x1c1c:   	faligndata	%f26, %f24, %f28
	.word	0xbfb0077e	! t0_kref+0x1c20:   	fpack16	%f30, %f31
	.word	0x001fffff	! t0_kref+0x1c24:   	illtrap	0x1fffff
	.word	0xd64e7ffc	! t0_kref+0x1c28:   	ldsb	[%i1 - 4], %o3
	.word	0xb5a000ba	! t0_kref+0x1c2c:   	fnegs	%f26, %f26
	.word	0x9483400d	! t0_kref+0x1c30:   	addcc	%o5, %o5, %o2
	.word	0xe856401b	! t0_kref+0x1c34:   	ldsh	[%i1 + %i3], %l4
	.word	0xf520a034	! t0_kref+0x1c38:   	st	%f26, [%g2 + 0x34]
	.word	0xda30a010	! t0_kref+0x1c3c:   	sth	%o5, [%g2 + 0x10]
	.word	0xb5b6099c	! t0_kref+0x1c40:   	bshuffle	%f24, %f28, %f26
	.word	0xe816201a	! t0_kref+0x1c44:   	lduh	[%i0 + 0x1a], %l4
	.word	0xe60e4000	! t0_kref+0x1c48:   	ldub	[%i1], %l3
	.word	0xd4067ff8	! t0_kref+0x1c4c:   	ld	[%i1 - 8], %o2
	.word	0xf700a028	! t0_kref+0x1c50:   	ld	[%g2 + 0x28], %f27
	.word	0xd010a00c	! t0_kref+0x1c54:   	lduh	[%g2 + 0xc], %o0
	.word	0xf9062010	! t0_kref+0x1c58:   	ld	[%i0 + 0x10], %f28
	.word	0xf19f1a18	! t0_kref+0x1c5c:   	ldda	[%i4 + %i0]0xd0, %f24
	.word	0xda763ff8	! t0_kref+0x1c60:   	stx	%o5, [%i0 - 8]
	.word	0xda30a024	! t0_kref+0x1c64:   	sth	%o5, [%g2 + 0x24]
	.word	0x31800008	! t0_kref+0x1c68:   	fba,a	_kref+0x1c88
	.word	0xd2564000	! t0_kref+0x1c6c:   	ldsh	[%i1], %o1
	.word	0xbdb7ce7c	! t0_kref+0x1c70:   	fxnors	%f31, %f28, %f30
	.word	0xaa7b6542	! t0_kref+0x1c74:   	sdiv	%o5, 0x542, %l5
	.word	0xf11fbec0	! t0_kref+0x1c78:   	ldd	[%fp - 0x140], %f24
	.word	0xd608a01a	! t0_kref+0x1c7c:   	ldub	[%g2 + 0x1a], %o3
	.word	0xbfa689be	! t0_kref+0x1c80:   	fdivs	%f26, %f30, %f31
	.word	0xf9be584d	! t0_kref+0x1c84:   	stda	%f28, [%i1 + %o5]0xc2
	.word	0xec560000	! t0_kref+0x1c88:   	ldsh	[%i0], %l6
	.word	0xda36201e	! t0_kref+0x1c8c:   	sth	%o5, [%i0 + 0x1e]
	.word	0xb9a0055a	! t0_kref+0x1c90:   	fsqrtd	%f26, %f28
	.word	0xda30a030	! t0_kref+0x1c94:   	sth	%o5, [%g2 + 0x30]
	.word	0xe616201a	! t0_kref+0x1c98:   	lduh	[%i0 + 0x1a], %l3
	.word	0xe6163fee	! t0_kref+0x1c9c:   	lduh	[%i0 - 0x12], %l3
	.word	0xb9a0055e	! t0_kref+0x1ca0:   	fsqrtd	%f30, %f28
	.word	0xbfb6cd60	! t0_kref+0x1ca4:   	fnot1s	%f27, %f31
	.word	0x912b400d	! t0_kref+0x1ca8:   	sll	%o5, %o5, %o0
	.word	0xea0e6000	! t0_kref+0x1cac:   	ldub	[%i1], %l5
	.word	0xb9a649b8	! t0_kref+0x1cb0:   	fdivs	%f25, %f24, %f28
	.word	0xb5a00039	! t0_kref+0x1cb4:   	fmovs	%f25, %f26
	.word	0xb9b70fb8	! t0_kref+0x1cb8:   	fors	%f28, %f24, %f28
	.word	0xd4067fe8	! t0_kref+0x1cbc:   	ld	[%i1 - 0x18], %o2
	.word	0xb1b6899a	! t0_kref+0x1cc0:   	bshuffle	%f26, %f26, %f24
	.word	0xf100a038	! t0_kref+0x1cc4:   	ld	[%g2 + 0x38], %f24
	.word	0xe650a018	! t0_kref+0x1cc8:   	ldsh	[%g2 + 0x18], %l3
	.word	0xf920a038	! t0_kref+0x1ccc:   	st	%f28, [%g2 + 0x38]
	.word	0xb5a0193d	! t0_kref+0x1cd0:   	fstod	%f29, %f26
	.word	0xf11e6018	! t0_kref+0x1cd4:   	ldd	[%i1 + 0x18], %f24
	.word	0xb7a609ba	! t0_kref+0x1cd8:   	fdivs	%f24, %f26, %f27
	.word	0xae23400d	! t0_kref+0x1cdc:   	sub	%o5, %o5, %l7
	.word	0xafb3410d	! t0_kref+0x1ce0:   	edge32	%o5, %o5, %l7
	.word	0x91b3404d	! t0_kref+0x1ce4:   	edge8l	%o5, %o5, %o0
	.word	0xe968a083	! t0_kref+0x1ce8:   	prefetch	%g2 + 0x83, 20
	.word	0xb7a000b8	! t0_kref+0x1cec:   	fnegs	%f24, %f27
	.word	0xec070019	! t0_kref+0x1cf0:   	ld	[%i4 + %i1], %l6
	.word	0x86102020	! t0_kref+0x1cf4:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0x1cf8:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x1cfc:   	be,a	_kref+0x1d6c
	.word	0xf920a028	! t0_kref+0x1d00:   	st	%f28, [%g2 + 0x28]
	.word	0xf9180018	! t0_kref+0x1d04:   	ldd	[%g0 + %i0], %f28
	.word	0xf36e6018	! t0_kref+0x1d08:   	prefetch	%i1 + 0x18, 25
	.word	0x36800007	! t0_kref+0x1d0c:   	bge,a	_kref+0x1d28
	.word	0xd0180018	! t0_kref+0x1d10:   	ldd	[%g0 + %i0], %o0
	.word	0x905b6cf1	! t0_kref+0x1d14:   	smul	%o5, 0xcf1, %o0
	.word	0xea16c018	! t0_kref+0x1d18:   	lduh	[%i3 + %i0], %l5
	.word	0xbdb6099a	! t0_kref+0x1d1c:   	bshuffle	%f24, %f26, %f30
	.word	0xda28a01b	! t0_kref+0x1d20:   	stb	%o5, [%g2 + 0x1b]
	.word	0xe840a024	! t0_kref+0x1d24:   	ldsw	[%g2 + 0x24], %l4
	.word	0xbba6c9b8	! t0_kref+0x1d28:   	fdivs	%f27, %f24, %f29
	.word	0xbdb70dda	! t0_kref+0x1d2c:   	fnand	%f28, %f26, %f30
	.word	0xda20a030	! t0_kref+0x1d30:   	st	%o5, [%g2 + 0x30]
	.word	0x3a800001	! t0_kref+0x1d34:   	bcc,a	_kref+0x1d38
	.word	0xe6564000	! t0_kref+0x1d38:   	ldsh	[%i1], %l3
	.word	0xb3b74c7e	! t0_kref+0x1d3c:   	fnors	%f29, %f30, %f25
	.word	0xee00a034	! t0_kref+0x1d40:   	ld	[%g2 + 0x34], %l7
	.word	0xe608a03c	! t0_kref+0x1d44:   	ldub	[%g2 + 0x3c], %l3
	.word	0xe608a011	! t0_kref+0x1d48:   	ldub	[%g2 + 0x11], %l3
	.word	0xee4e3fe5	! t0_kref+0x1d4c:   	ldsb	[%i0 - 0x1b], %l7
	.word	0x90b3400d	! t0_kref+0x1d50:   	orncc	%o5, %o5, %o0
	.word	0xd40e6005	! t0_kref+0x1d54:   	ldub	[%i1 + 5], %o2
	.word	0xe80e7ffc	! t0_kref+0x1d58:   	ldub	[%i1 - 4], %l4
	.word	0x85837549	! t0_kref+0x1d5c:   	wr	%o5, 0xfffff549, %ccr
	.word	0x97b3432d	! t0_kref+0x1d60:   	bmask	%o5, %o5, %o3
	.word	0xf300a00c	! t0_kref+0x1d64:   	ld	[%g2 + 0xc], %f25
	.word	0x92b37dca	! t0_kref+0x1d68:   	orncc	%o5, -0x236, %o1
	.word	0xb3a6c9bd	! t0_kref+0x1d6c:   	fdivs	%f27, %f29, %f25
	.word	0x905b60de	! t0_kref+0x1d70:   	smul	%o5, 0xde, %o0
	.word	0xd4563ff8	! t0_kref+0x1d74:   	ldsh	[%i0 - 8], %o2
	.word	0xea56001b	! t0_kref+0x1d78:   	ldsh	[%i0 + %i3], %l5
	.word	0x86102005	! t0_kref+0x1d7c:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x1d80:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x1d84:   	be,a	_kref+0x1db4
	.word	0xbdb74d39	! t0_kref+0x1d88:   	fandnot1s	%f29, %f25, %f30
	.word	0xbdb00f1c	! t0_kref+0x1d8c:   	fsrc2	%f28, %f30
	.word	0xb9a6c9bd	! t0_kref+0x1d90:   	fdivs	%f27, %f29, %f28
	.word	0xb5a689bb	! t0_kref+0x1d94:   	fdivs	%f26, %f27, %f26
	.word	0x9623400d	! t0_kref+0x1d98:   	sub	%o5, %o5, %o3
	.word	0x8d837a0c	! t0_kref+0x1d9c:   	wr	%o5, 0xfffffa0c, %fprs
	.word	0x93b3404d	! t0_kref+0x1da0:   	edge8l	%o5, %o5, %o1
	.word	0xbdb68adc	! t0_kref+0x1da4:   	fpsub32	%f26, %f28, %f30
	.word	0x96b3400d	! t0_kref+0x1da8:   	orncc	%o5, %o5, %o3
	.word	0xd0164000	! t0_kref+0x1dac:   	lduh	[%i1], %o0
	.word	0xb5b607d8	! t0_kref+0x1db0:   	pdist	%f24, %f24, %f26
	.word	0xb1b78d9e	! t0_kref+0x1db4:   	fxor	%f30, %f30, %f24
	.word	0xb1a0055c	! t0_kref+0x1db8:   	fsqrtd	%f28, %f24
	.word	0xbda0191b	! t0_kref+0x1dbc:   	fitod	%f27, %f30
	.word	0xec070019	! t0_kref+0x1dc0:   	ld	[%i4 + %i1], %l6
	.word	0xf1be188d	! t0_kref+0x1dc4:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0x97b3432d	! t0_kref+0x1dc8:   	bmask	%o5, %o5, %o3
	.word	0xbfb00f3b	! t0_kref+0x1dcc:   	fsrc2s	%f27, %f31
	.word	0xf920a000	! t0_kref+0x1dd0:   	st	%f28, [%g2]
	.word	0xb5b70f5c	! t0_kref+0x1dd4:   	fornot1	%f28, %f28, %f26
	.word	0xb7a709bd	! t0_kref+0x1dd8:   	fdivs	%f28, %f29, %f27
	.word	0xfd1e3ff8	! t0_kref+0x1ddc:   	ldd	[%i0 - 8], %f30
	.word	0xa9b3404d	! t0_kref+0x1de0:   	edge8l	%o5, %o5, %l4
	.word	0x9de3bfa0	! t0_kref+0x1de4:   	save	%sp, -0x60, %sp
	.word	0xb8e6e9e6	! t0_kref+0x1de8:   	subccc	%i3, 0x9e6, %i4
	.word	0xa9ef4019	! t0_kref+0x1dec:   	restore	%i5, %i1, %l4
	.word	0xec062004	! t0_kref+0x1df0:   	ld	[%i0 + 4], %l6
	.word	0xb5a0055a	! t0_kref+0x1df4:   	fsqrtd	%f26, %f26
	.word	0xb9b686fa	! t0_kref+0x1df8:   	fmul8ulx16	%f26, %f26, %f28
	.word	0x931b400d	! t0_kref+0x1dfc:   	tsubcctv	%o5, %o5, %o1
	.word	0xe650a00c	! t0_kref+0x1e00:   	ldsh	[%g2 + 0xc], %l3
	.word	0xb5a688da	! t0_kref+0x1e04:   	fsubd	%f26, %f26, %f26
	.word	0xae03400d	! t0_kref+0x1e08:   	add	%o5, %o5, %l7
	.word	0xda760000	! t0_kref+0x1e0c:   	stx	%o5, [%i0]
	.word	0x35800004	! t0_kref+0x1e10:   	fbue,a	_kref+0x1e20
	.word	0xb5b60c5c	! t0_kref+0x1e14:   	fnor	%f24, %f28, %f26
	.word	0xe80e600e	! t0_kref+0x1e18:   	ldub	[%i1 + 0xe], %l4
	.word	0xd410a034	! t0_kref+0x1e1c:   	lduh	[%g2 + 0x34], %o2
	.word	0x9fc00004	! t0_kref+0x1e20:   	call	%g0 + %g4
	.word	0xea16201e	! t0_kref+0x1e24:   	lduh	[%i0 + 0x1e], %l5
	.word	0xb3a689b9	! t0_kref+0x1e28:   	fdivs	%f26, %f25, %f25
	.word	0xb9a0055c	! t0_kref+0x1e2c:   	fsqrtd	%f28, %f28
	.word	0xb1b6cdb8	! t0_kref+0x1e30:   	fxors	%f27, %f24, %f24
	.word	0xb1b7091a	! t0_kref+0x1e34:   	faligndata	%f28, %f26, %f24
	.word	0xd248a03d	! t0_kref+0x1e38:   	ldsb	[%g2 + 0x3d], %o1
	.word	0xd7e6100d	! t0_kref+0x1e3c:   	casa	[%i0]0x80, %o5, %o3
	.word	0x9de3bfa0	! t0_kref+0x1e40:   	save	%sp, -0x60, %sp
	.word	0xafef353e	! t0_kref+0x1e44:   	restore	%i4, -0xac2, %l7
	.word	0xec0e201c	! t0_kref+0x1e48:   	ldub	[%i0 + 0x1c], %l6
	.word	0xa944c000	! t0_kref+0x1e4c:   	mov	%gsr, %l4
	.word	0xa7b6051e	! t0_kref+0x1e50:   	fcmpgt16	%f24, %f30, %l3
	.word	0xda20a008	! t0_kref+0x1e54:   	st	%o5, [%g2 + 8]
	.word	0xeff6100d	! t0_kref+0x1e58:   	casxa	[%i0]0x80, %o5, %l7
	.word	0xda20a03c	! t0_kref+0x1e5c:   	st	%o5, [%g2 + 0x3c]
	.word	0xd4563ff4	! t0_kref+0x1e60:   	ldsh	[%i0 - 0xc], %o2
	.word	0xea50a002	! t0_kref+0x1e64:   	ldsh	[%g2 + 2], %l5
	.word	0x81ae8a3b	! t0_kref+0x1e68:   	fcmps	%fcc0, %f26, %f27
	.word	0xda28a022	! t0_kref+0x1e6c:   	stb	%o5, [%g2 + 0x22]
	.word	0xe8566000	! t0_kref+0x1e70:   	ldsh	[%i1], %l4
	.word	0xb1b606fe	! t0_kref+0x1e74:   	fmul8ulx16	%f24, %f30, %f24
	.word	0xa883400d	! t0_kref+0x1e78:   	addcc	%o5, %o5, %l4
	.word	0xb9a789b9	! t0_kref+0x1e7c:   	fdivs	%f30, %f25, %f28
	.word	0xbdb60f5e	! t0_kref+0x1e80:   	fornot1	%f24, %f30, %f30
	.word	0xf1be580d	! t0_kref+0x1e84:   	stda	%f24, [%i1 + %o5]0xc0
	.word	0xd81e4000	! t0_kref+0x1e88:   	ldd	[%i1], %o4
	.word	0xd40e2011	! t0_kref+0x1e8c:   	ldub	[%i0 + 0x11], %o2
	.word	0xb3a01a5c	! t0_kref+0x1e90:   	fdtoi	%f28, %f25
	.word	0xea066008	! t0_kref+0x1e94:   	ld	[%i1 + 8], %l5
	.word	0xb5a749bb	! t0_kref+0x1e98:   	fdivs	%f29, %f27, %f26
	.word	0xd4080018	! t0_kref+0x1e9c:   	ldub	[%g0 + %i0], %o2
	.word	0xb5b6099e	! t0_kref+0x1ea0:   	bshuffle	%f24, %f30, %f26
	.word	0xd640a010	! t0_kref+0x1ea4:   	ldsw	[%g2 + 0x10], %o3
	.word	0xea480019	! t0_kref+0x1ea8:   	ldsb	[%g0 + %i1], %l5
	.word	0xb5b68e39	! t0_kref+0x1eac:   	fands	%f26, %f25, %f26
	.word	0xd256200c	! t0_kref+0x1eb0:   	ldsh	[%i0 + 0xc], %o1
	.word	0x81af8ade	! t0_kref+0x1eb4:   	fcmped	%fcc0, %f30, %f30
	.word	0xf700a004	! t0_kref+0x1eb8:   	ld	[%g2 + 4], %f27
	.word	0x8143c000	! t0_kref+0x1ebc:   	stbar
	.word	0xb1a749bb	! t0_kref+0x1ec0:   	fdivs	%f29, %f27, %f24
	.word	0xb9b60a7a	! t0_kref+0x1ec4:   	fpadd32s	%f24, %f26, %f28
	.word	0xec10a01c	! t0_kref+0x1ec8:   	lduh	[%g2 + 0x1c], %l6
	.word	0xd400a024	! t0_kref+0x1ecc:   	ld	[%g2 + 0x24], %o2
	.word	0xbdb7c73f	! t0_kref+0x1ed0:   	fmuld8ulx16	%f31, %f31, %f30
	.word	0xd40e200f	! t0_kref+0x1ed4:   	ldub	[%i0 + 0xf], %o2
	.word	0xb1b007ba	! t0_kref+0x1ed8:   	fpackfix	%f26, %f24
	.word	0xda28a002	! t0_kref+0x1edc:   	stb	%o5, [%g2 + 2]
	.word	0xd616401b	! t0_kref+0x1ee0:   	lduh	[%i1 + %i3], %o3
	.word	0xd2060000	! t0_kref+0x1ee4:   	ld	[%i0], %o1
	.word	0xb5b7071f	! t0_kref+0x1ee8:   	fmuld8sux16	%f28, %f31, %f26
	.word	0xb9a0055e	! t0_kref+0x1eec:   	fsqrtd	%f30, %f28
	.word	0xb5a01a3e	! t0_kref+0x1ef0:   	fstoi	%f30, %f26
	.word	0xd04e6015	! t0_kref+0x1ef4:   	ldsb	[%i1 + 0x15], %o0
	.word	0xd44e8019	! t0_kref+0x1ef8:   	ldsb	[%i2 + %i1], %o2
	.word	0xb9a0055a	! t0_kref+0x1efc:   	fsqrtd	%f26, %f28
	.word	0xd64e7ffa	! t0_kref+0x1f00:   	ldsb	[%i1 - 6], %o3
	.word	0x9083400d	! t0_kref+0x1f04:   	addcc	%o5, %o5, %o0
	.word	0xabb34240	! t0_kref+0x1f08:   	array16	%o5, %g0, %l5
	.word	0xa7837e5f	! t0_kref+0x1f0c:   	wr	%o5, 0xfffffe5f, %gsr
	.word	0xb5a0053c	! t0_kref+0x1f10:   	fsqrts	%f28, %f26
	.word	0xbda0053a	! t0_kref+0x1f14:   	fsqrts	%f26, %f30
	.word	0xbfb6ca7a	! t0_kref+0x1f18:   	fpadd32s	%f27, %f26, %f31
	.word	0xa7b340cd	! t0_kref+0x1f1c:   	edge16l	%o5, %o5, %l3
	.word	0xf91e001d	! t0_kref+0x1f20:   	ldd	[%i0 + %i5], %f28
	.word	0xb6103fec	! t0_kref+0x1f24:   	mov	0xffffffec, %i3
	.word	0xf900a034	! t0_kref+0x1f28:   	ld	[%g2 + 0x34], %f28
	.word	0xea062010	! t0_kref+0x1f2c:   	ld	[%i0 + 0x10], %l5
	.word	0xee167ff2	! t0_kref+0x1f30:   	lduh	[%i1 - 0xe], %l7
	.word	0xb5b6099a	! t0_kref+0x1f34:   	bshuffle	%f24, %f26, %f26
	.word	0x2a800003	! t0_kref+0x1f38:   	bcs,a	_kref+0x1f44
	.word	0xbdb6091e	! t0_kref+0x1f3c:   	faligndata	%f24, %f30, %f30
	.word	0xb5b60a7c	! t0_kref+0x1f40:   	fpadd32s	%f24, %f28, %f26
	.word	0xda20a038	! t0_kref+0x1f44:   	st	%o5, [%g2 + 0x38]
	.word	0xe606401c	! t0_kref+0x1f48:   	ld	[%i1 + %i4], %l3
	.word	0xe81e3ff0	! t0_kref+0x1f4c:   	ldd	[%i0 - 0x10], %l4
	.word	0x9364800d	! t0_kref+0x1f50:   	movle	%icc, %o5, %o1
	.word	0x91336009	! t0_kref+0x1f54:   	srl	%o5, 0x9, %o0
	.word	0x81ae0adc	! t0_kref+0x1f58:   	fcmped	%fcc0, %f24, %f28
	.word	0xdaa65000	! t0_kref+0x1f5c:   	sta	%o5, [%i1]0x80
	.word	0xf56e6018	! t0_kref+0x1f60:   	prefetch	%i1 + 0x18, 26
	.word	0xda30a036	! t0_kref+0x1f64:   	sth	%o5, [%g2 + 0x36]
	.word	0x36800003	! t0_kref+0x1f68:   	bge,a	_kref+0x1f74
	.word	0xaac3400d	! t0_kref+0x1f6c:   	addccc	%o5, %o5, %l5
	.word	0xa9b6045a	! t0_kref+0x1f70:   	fcmpne16	%f24, %f26, %l4
	.word	0xa7b6855e	! t0_kref+0x1f74:   	fcmpeq16	%f26, %f30, %l3
	.word	0xd416c018	! t0_kref+0x1f78:   	lduh	[%i3 + %i0], %o2
	.word	0xfb20a014	! t0_kref+0x1f7c:   	st	%f29, [%g2 + 0x14]
	.word	0xf91fbf90	! t0_kref+0x1f80:   	ldd	[%fp - 0x70], %f28
	.word	0xdaf61000	! t0_kref+0x1f84:   	stxa	%o5, [%i0]0x80
	.word	0xd608a02f	! t0_kref+0x1f88:   	ldub	[%g2 + 0x2f], %o3
	.word	0xb1a018dc	! t0_kref+0x1f8c:   	fdtos	%f28, %f24
	.word	0xa6db400d	! t0_kref+0x1f90:   	smulcc	%o5, %o5, %l3
	.word	0xb7a0053a	! t0_kref+0x1f94:   	fsqrts	%f26, %f27
	.word	0xea40a014	! t0_kref+0x1f98:   	ldsw	[%g2 + 0x14], %l5
	.word	0x3e800007	! t0_kref+0x1f9c:   	bvc,a	_kref+0x1fb8
	.word	0xb7a789b9	! t0_kref+0x1fa0:   	fdivs	%f30, %f25, %f27
	.word	0xe600a024	! t0_kref+0x1fa4:   	ld	[%g2 + 0x24], %l3
	.word	0x81dbbae6	! t0_kref+0x1fa8:   	flush	%sp - 0x51a
	.word	0xda367fea	! t0_kref+0x1fac:   	sth	%o5, [%i1 - 0x16]
	.word	0xb3a0053e	! t0_kref+0x1fb0:   	fsqrts	%f30, %f25
	.word	0xb1b7891e	! t0_kref+0x1fb4:   	faligndata	%f30, %f30, %f24
	.word	0xd048a025	! t0_kref+0x1fb8:   	ldsb	[%g2 + 0x25], %o0
	.word	0xb5a749be	! t0_kref+0x1fbc:   	fdivs	%f29, %f30, %f26
	.word	0x972b400d	! t0_kref+0x1fc0:   	sll	%o5, %o5, %o3
	.word	0xda30a016	! t0_kref+0x1fc4:   	sth	%o5, [%g2 + 0x16]
	.word	0xb1a0055a	! t0_kref+0x1fc8:   	fsqrtd	%f26, %f24
	.word	0xb7a01a3a	! t0_kref+0x1fcc:   	fstoi	%f26, %f27
	.word	0xabb7051c	! t0_kref+0x1fd0:   	fcmpgt16	%f28, %f28, %l5
	.word	0xbdb009b9	! t0_kref+0x1fd4:   	fexpand	%f25, %f30
	.word	0xb9b00778	! t0_kref+0x1fd8:   	fpack16	%f24, %f28
	.word	0xee08a013	! t0_kref+0x1fdc:   	ldub	[%g2 + 0x13], %l7
	.word	0xbfb7cdfd	! t0_kref+0x1fe0:   	fnands	%f31, %f29, %f31
	.word	0x94e3400d	! t0_kref+0x1fe4:   	subccc	%o5, %o5, %o2
	.word	0x8143c000	! t0_kref+0x1fe8:   	stbar
	.word	0x907b400d	! t0_kref+0x1fec:   	sdiv	%o5, %o5, %o0
	.word	0xff06401c	! t0_kref+0x1ff0:   	ld	[%i1 + %i4], %f31
	.word	0xb9a0111e	! t0_kref+0x1ff4:   	fxtod	%f30, %f28
	.word	0xbfa000be	! t0_kref+0x1ff8:   	fnegs	%f30, %f31
	.word	0xa6936ed8	! t0_kref+0x1ffc:   	orcc	%o5, 0xed8, %l3
	.word	0xd64e6005	! t0_kref+0x2000:   	ldsb	[%i1 + 5], %o3
	.word	0xda28a010	! t0_kref+0x2004:   	stb	%o5, [%g2 + 0x10]
	.word	0xbfa7c9b8	! t0_kref+0x2008:   	fdivs	%f31, %f24, %f31
	.word	0xafb3434d	! t0_kref+0x200c:   	alignaddrl	%o5, %o5, %l7
	.word	0xabb7859e	! t0_kref+0x2010:   	fcmpgt32	%f30, %f30, %l5
	.word	0xf520a038	! t0_kref+0x2014:   	st	%f26, [%g2 + 0x38]
	.word	0xbda7c9bd	! t0_kref+0x2018:   	fdivs	%f31, %f29, %f30
	.word	0xf100a030	! t0_kref+0x201c:   	ld	[%g2 + 0x30], %f24
	.word	0xae23400d	! t0_kref+0x2020:   	sub	%o5, %o5, %l7
	.word	0xb5b00fc0	! t0_kref+0x2024:   	fone	%f26
	.word	0xbfa0053f	! t0_kref+0x2028:   	fsqrts	%f31, %f31
	.word	0xe5ee101a	! t0_kref+0x202c:   	prefetcha	%i0 + %i2, 18
	.word	0xf9be584d	! t0_kref+0x2030:   	stda	%f28, [%i1 + %o5]0xc2
	.word	0x960b400d	! t0_kref+0x2034:   	and	%o5, %o5, %o3
	.word	0xb7a6c9bd	! t0_kref+0x2038:   	fdivs	%f27, %f29, %f27
	.word	0xa9b3408d	! t0_kref+0x203c:   	edge16	%o5, %o5, %l4
	.word	0xb5b70ade	! t0_kref+0x2040:   	fpsub32	%f28, %f30, %f26
	.word	0xbba0053f	! t0_kref+0x2044:   	fsqrts	%f31, %f29
	.word	0xb5a7c8bb	! t0_kref+0x2048:   	fsubs	%f31, %f27, %f26
	.word	0xda360000	! t0_kref+0x204c:   	sth	%o5, [%i0]
	.word	0xf19e5a1b	! t0_kref+0x2050:   	ldda	[%i1 + %i3]0xd0, %f24
	.word	0xf11e401d	! t0_kref+0x2054:   	ldd	[%i1 + %i5], %f24
	.word	0xbfa749be	! t0_kref+0x2058:   	fdivs	%f29, %f30, %f31
	.word	0x9423400d	! t0_kref+0x205c:   	sub	%o5, %o5, %o2
	.word	0xda20a010	! t0_kref+0x2060:   	st	%o5, [%g2 + 0x10]
	.word	0xb1a609b9	! t0_kref+0x2064:   	fdivs	%f24, %f25, %f24
	.word	0xee4e7ff1	! t0_kref+0x2068:   	ldsb	[%i1 - 0xf], %l7
	.word	0xd616c019	! t0_kref+0x206c:   	lduh	[%i3 + %i1], %o3
	.word	0xf51f4019	! t0_kref+0x2070:   	ldd	[%i5 + %i1], %f26
	.word	0x9de3bfa0	! t0_kref+0x2074:   	save	%sp, -0x60, %sp
	.word	0xb8d62920	! t0_kref+0x2078:   	umulcc	%i0, 0x920, %i4
	.word	0x97ee2c3f	! t0_kref+0x207c:   	restore	%i0, 0xc3f, %o3
	.word	0xa92b400d	! t0_kref+0x2080:   	sll	%o5, %o5, %l4
	.word	0xd40e7ff2	! t0_kref+0x2084:   	ldub	[%i1 - 0xe], %o2
	.word	0xa7400000	! t0_kref+0x2088:   	mov	%y, %l3
	.word	0xf700a008	! t0_kref+0x208c:   	ld	[%g2 + 8], %f27
	.word	0xb3a0053d	! t0_kref+0x2090:   	fsqrts	%f29, %f25
	.word	0x96f3400d	! t0_kref+0x2094:   	udivcc	%o5, %o5, %o3
	.word	0xb1a0055e	! t0_kref+0x2098:   	fsqrtd	%f30, %f24
	.word	0xe600a00c	! t0_kref+0x209c:   	ld	[%g2 + 0xc], %l3
	.word	0xaaf3400d	! t0_kref+0x20a0:   	udivcc	%o5, %o5, %l5
	.word	0x9de3bfa0	! t0_kref+0x20a4:   	save	%sp, -0x60, %sp
	.word	0xb456001a	! t0_kref+0x20a8:   	umul	%i0, %i2, %i2
	.word	0x91e82e7e	! t0_kref+0x20ac:   	restore	%g0, 0xe7e, %o0
	.word	0xb5b68979	! t0_kref+0x20b0:   	fpmerge	%f26, %f25, %f26
	.word	0x9533400d	! t0_kref+0x20b4:   	srl	%o5, %o5, %o2
	.word	0xac1b62ab	! t0_kref+0x20b8:   	xor	%o5, 0x2ab, %l6
	.word	0x25800008	! t0_kref+0x20bc:   	fblg,a	_kref+0x20dc
	.word	0xab23400d	! t0_kref+0x20c0:   	mulscc	%o5, %o5, %l5
	.word	0xac1b76c1	! t0_kref+0x20c4:   	xor	%o5, -0x93f, %l6
	.word	0xee4e3fe7	! t0_kref+0x20c8:   	ldsb	[%i0 - 0x19], %l7
	.word	0xd648a015	! t0_kref+0x20cc:   	ldsb	[%g2 + 0x15], %o3
	.word	0xb7a749ba	! t0_kref+0x20d0:   	fdivs	%f29, %f26, %f27
	.word	0xb1b00fc0	! t0_kref+0x20d4:   	fone	%f24
	.word	0xa9b34240	! t0_kref+0x20d8:   	array16	%o5, %g0, %l4
	.word	0xfd00a00c	! t0_kref+0x20dc:   	ld	[%g2 + 0xc], %f30
	.word	0xb5b6c678	! t0_kref+0x20e0:   	fmul8x16au	%f27, %f24, %f26
	.word	0xaca37d94	! t0_kref+0x20e4:   	subcc	%o5, -0x26c, %l6
	.word	0xee50a03e	! t0_kref+0x20e8:   	ldsh	[%g2 + 0x3e], %l7
	.word	0xb9b7cfbd	! t0_kref+0x20ec:   	fors	%f31, %f29, %f28
	.word	0xec1e001d	! t0_kref+0x20f0:   	ldd	[%i0 + %i5], %l6
	.word	0xd24e2013	! t0_kref+0x20f4:   	ldsb	[%i0 + 0x13], %o1
	.word	0xaa83400d	! t0_kref+0x20f8:   	addcc	%o5, %o5, %l5
	.word	0xb1b60c9a	! t0_kref+0x20fc:   	fandnot2	%f24, %f26, %f24
	.word	0xaf400000	! t0_kref+0x2100:   	mov	%y, %l7
	.word	0xb5b78d40	! t0_kref+0x2104:   	fnot1	%f30, %f26
	.word	0xf520a02c	! t0_kref+0x2108:   	st	%f26, [%g2 + 0x2c]
	.word	0xd210a00c	! t0_kref+0x210c:   	lduh	[%g2 + 0xc], %o1
	.word	0xa87b7308	! t0_kref+0x2110:   	sdiv	%o5, -0xcf8, %l4
	.word	0xb1a6c9bb	! t0_kref+0x2114:   	fdivs	%f27, %f27, %f24
	.word	0xf100a008	! t0_kref+0x2118:   	ld	[%g2 + 8], %f24
	.word	0x91b7045a	! t0_kref+0x211c:   	fcmpne16	%f28, %f26, %o0
	.word	0xee4e6006	! t0_kref+0x2120:   	ldsb	[%i1 + 6], %l7
	.word	0xe850a006	! t0_kref+0x2124:   	ldsh	[%g2 + 6], %l4
	.word	0xec080019	! t0_kref+0x2128:   	ldub	[%g0 + %i1], %l6
	.word	0xd010a030	! t0_kref+0x212c:   	lduh	[%g2 + 0x30], %o0
	.word	0xa893400d	! t0_kref+0x2130:   	orcc	%o5, %o5, %l4
	.word	0xea060000	! t0_kref+0x2134:   	ld	[%i0], %l5
	.word	0xb3a649bb	! t0_kref+0x2138:   	fdivs	%f25, %f27, %f25
	.word	0xd400a018	! t0_kref+0x213c:   	ld	[%g2 + 0x18], %o2
	.word	0xec0e7fe3	! t0_kref+0x2140:   	ldub	[%i1 - 0x1d], %l6
	.word	0xee48a011	! t0_kref+0x2144:   	ldsb	[%g2 + 0x11], %l7
	.word	0xbbb60c7a	! t0_kref+0x2148:   	fnors	%f24, %f26, %f29
	.word	0xf96e401c	! t0_kref+0x214c:   	prefetch	%i1 + %i4, 28
	.word	0xf99f1a58	! t0_kref+0x2150:   	ldda	[%i4 + %i0]0xd2, %f28
	.word	0xff00a01c	! t0_kref+0x2154:   	ld	[%g2 + 0x1c], %f31
	.word	0xaebb400d	! t0_kref+0x2158:   	xnorcc	%o5, %o5, %l7
	.word	0xda20a008	! t0_kref+0x215c:   	st	%o5, [%g2 + 8]
	.word	0x949b400d	! t0_kref+0x2160:   	xorcc	%o5, %o5, %o2
	.word	0x9fc00004	! t0_kref+0x2164:   	call	%g0 + %g4
	.word	0xd0000018	! t0_kref+0x2168:   	ld	[%g0 + %i0], %o0
	.word	0xbfa789bd	! t0_kref+0x216c:   	fdivs	%f30, %f29, %f31
	.word	0xaebb400d	! t0_kref+0x2170:   	xnorcc	%o5, %o5, %l7
	.word	0xda20a024	! t0_kref+0x2174:   	st	%o5, [%g2 + 0x24]
	.word	0xdaf65000	! t0_kref+0x2178:   	stxa	%o5, [%i1]0x80
	.word	0xfb00a01c	! t0_kref+0x217c:   	ld	[%g2 + 0x1c], %f29
	.word	0xec10a00a	! t0_kref+0x2180:   	lduh	[%g2 + 0xa], %l6
	.word	0xe80e2005	! t0_kref+0x2184:   	ldub	[%i0 + 5], %l4
	.word	0xda20a02c	! t0_kref+0x2188:   	st	%o5, [%g2 + 0x2c]
	.word	0x97b3432d	! t0_kref+0x218c:   	bmask	%o5, %o5, %o3
	.word	0xe6067ff0	! t0_kref+0x2190:   	ld	[%i1 - 0x10], %l3
	.word	0xd616c019	! t0_kref+0x2194:   	lduh	[%i3 + %i1], %o3
	.word	0xb3a0053e	! t0_kref+0x2198:   	fsqrts	%f30, %f25
	.word	0xad23400d	! t0_kref+0x219c:   	mulscc	%o5, %o5, %l6
	.word	0xfb20a038	! t0_kref+0x21a0:   	st	%f29, [%g2 + 0x38]
	.word	0xd00e4000	! t0_kref+0x21a4:   	ldub	[%i1], %o0
	.word	0xb7a000bc	! t0_kref+0x21a8:   	fnegs	%f28, %f27
	.word	0xad70362c	! t0_kref+0x21ac:   	popc	-0x9d4, %l6
	.word	0x9144c000	! t0_kref+0x21b0:   	mov	%gsr, %o0
	.word	0xda30a000	! t0_kref+0x21b4:   	sth	%o5, [%g2]
	.word	0xb9b68f9c	! t0_kref+0x21b8:   	for	%f26, %f28, %f28
	.word	0xee500019	! t0_kref+0x21bc:   	ldsh	[%g0 + %i1], %l7
	.word	0x33800008	! t0_kref+0x21c0:   	fbe,a	_kref+0x21e0
	.word	0xe43e6008	! t0_kref+0x21c4:   	std	%l2, [%i1 + 8]
	.word	0xd4067fe0	! t0_kref+0x21c8:   	ld	[%i1 - 0x20], %o2
	.word	0xb5b78ed8	! t0_kref+0x21cc:   	fornot2	%f30, %f24, %f26
	.word	0xd4060000	! t0_kref+0x21d0:   	ld	[%i0], %o2
	.word	0xb9a6c9be	! t0_kref+0x21d4:   	fdivs	%f27, %f30, %f28
	.word	0x9013400d	! t0_kref+0x21d8:   	or	%o5, %o5, %o0
	.word	0x8d837c93	! t0_kref+0x21dc:   	wr	%o5, 0xfffffc93, %fprs
	.word	0xe806001c	! t0_kref+0x21e0:   	ld	[%i0 + %i4], %l4
	.word	0xf91e401d	! t0_kref+0x21e4:   	ldd	[%i1 + %i5], %f28
	.word	0x81af4a38	! t0_kref+0x21e8:   	fcmps	%fcc0, %f29, %f24
	.word	0x92e37d17	! t0_kref+0x21ec:   	subccc	%o5, -0x2e9, %o1
	.word	0xadb7051a	! t0_kref+0x21f0:   	fcmpgt16	%f28, %f26, %l6
	.word	0xa87b400d	! t0_kref+0x21f4:   	sdiv	%o5, %o5, %l4
	.word	0x96836383	! t0_kref+0x21f8:   	addcc	%o5, 0x383, %o3
	.word	0xe81e3fe8	! t0_kref+0x21fc:   	ldd	[%i0 - 0x18], %l4
	.word	0xda20a000	! t0_kref+0x2200:   	st	%o5, [%g2]
	.word	0xe850a034	! t0_kref+0x2204:   	ldsh	[%g2 + 0x34], %l4
	.word	0xf1be1a1b	! t0_kref+0x2208:   	stda	%f24, [%i0 + %i3]0xd0
	.word	0xb1a78d39	! t0_kref+0x220c:   	fsmuld	%f30, %f25, %f24
	.word	0xaad3400d	! t0_kref+0x2210:   	umulcc	%o5, %o5, %l5
	.word	0x9013400d	! t0_kref+0x2214:   	or	%o5, %o5, %o0
	.word	0x8d83400d	! t0_kref+0x2218:   	wr	%o5, %o5, %fprs
	.word	0xd050a016	! t0_kref+0x221c:   	ldsh	[%g2 + 0x16], %o0
	.word	0xf76e401b	! t0_kref+0x2220:   	prefetch	%i1 + %i3, 27
	.word	0x001fffff	! t0_kref+0x2224:   	illtrap	0x1fffff
	.word	0xd81f4018	! t0_kref+0x2228:   	ldd	[%i5 + %i0], %o4
	.word	0xe8480018	! t0_kref+0x222c:   	ldsb	[%g0 + %i0], %l4
	.word	0xa8e3400d	! t0_kref+0x2230:   	subccc	%o5, %o5, %l4
	.word	0xb9b78c7c	! t0_kref+0x2234:   	fnors	%f30, %f28, %f28
	.word	0xd000a034	! t0_kref+0x2238:   	ld	[%g2 + 0x34], %o0
	.word	0xe640a018	! t0_kref+0x223c:   	ldsw	[%g2 + 0x18], %l3
	.word	0xd248a004	! t0_kref+0x2240:   	ldsb	[%g2 + 4], %o1
	.word	0xf11f4018	! t0_kref+0x2244:   	ldd	[%i5 + %i0], %f24
	.word	0x91b340cd	! t0_kref+0x2248:   	edge16l	%o5, %o5, %o0
	.word	0xd250a018	! t0_kref+0x224c:   	ldsh	[%g2 + 0x18], %o1
	.word	0xb3a789bf	! t0_kref+0x2250:   	fdivs	%f30, %f31, %f25
	.word	0xb7a01a3f	! t0_kref+0x2254:   	fstoi	%f31, %f27
	.word	0xb5a7c9bb	! t0_kref+0x2258:   	fdivs	%f31, %f27, %f26
	.word	0xe656c018	! t0_kref+0x225c:   	ldsh	[%i3 + %i0], %l3
	.word	0xda28a012	! t0_kref+0x2260:   	stb	%o5, [%g2 + 0x12]
	.word	0xb5a0053a	! t0_kref+0x2264:   	fsqrts	%f26, %f26
	.word	0xd6d65000	! t0_kref+0x2268:   	ldsha	[%i1]0x80, %o3
	.word	0xb9a609bc	! t0_kref+0x226c:   	fdivs	%f24, %f28, %f28
	.word	0xa68376f3	! t0_kref+0x2270:   	addcc	%o5, -0x90d, %l3
	.word	0x81af0a38	! t0_kref+0x2274:   	fcmps	%fcc0, %f28, %f24
	.word	0xa9b34240	! t0_kref+0x2278:   	array16	%o5, %g0, %l4
	.word	0x81da3d1e	! t0_kref+0x227c:   	flush	%o0 - 0x2e2
	.word	0x97b785de	! t0_kref+0x2280:   	fcmpeq32	%f30, %f30, %o3
	.word	0xec4e7ffb	! t0_kref+0x2284:   	ldsb	[%i1 - 5], %l6
	.word	0x97b3432d	! t0_kref+0x2288:   	bmask	%o5, %o5, %o3
	.word	0xd606401c	! t0_kref+0x228c:   	ld	[%i1 + %i4], %o3
	.word	0xbda0191e	! t0_kref+0x2290:   	fitod	%f30, %f30
	.word	0xfb00a004	! t0_kref+0x2294:   	ld	[%g2 + 4], %f29
	.word	0x8610201c	! t0_kref+0x2298:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x229c:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x22a0:   	be,a	_kref+0x22d8
	.word	0xdaf01018	! t0_kref+0x22a4:   	stxa	%o5, [%g0 + %i0]0x80
	.word	0x92d3400d	! t0_kref+0x22a8:   	umulcc	%o5, %o5, %o1
	.word	0xda28a026	! t0_kref+0x22ac:   	stb	%o5, [%g2 + 0x26]
	.word	0xd20e4000	! t0_kref+0x22b0:   	ldub	[%i1], %o1
	.word	0x30800001	! t0_kref+0x22b4:   	ba,a	_kref+0x22b8
	.word	0xd0562018	! t0_kref+0x22b8:   	ldsh	[%i0 + 0x18], %o0
	.word	0xb1a789bb	! t0_kref+0x22bc:   	fdivs	%f30, %f27, %f24
	.word	0xda264000	! t0_kref+0x22c0:   	st	%o5, [%i1]
	.word	0x94db6f05	! t0_kref+0x22c4:   	smulcc	%o5, 0xf05, %o2
	.word	0x9540c000	! t0_kref+0x22c8:   	mov	%asi, %o2
	.word	0xea48a032	! t0_kref+0x22cc:   	ldsb	[%g2 + 0x32], %l5
	.word	0xd040a004	! t0_kref+0x22d0:   	ldsw	[%g2 + 4], %o0
	.word	0xd210a03a	! t0_kref+0x22d4:   	lduh	[%g2 + 0x3a], %o1
	.word	0x37800003	! t0_kref+0x22d8:   	fbge,a	_kref+0x22e4
	.word	0xda20a00c	! t0_kref+0x22dc:   	st	%o5, [%g2 + 0xc]
	.word	0xd00e3fe4	! t0_kref+0x22e0:   	ldub	[%i0 - 0x1c], %o0
	.word	0xafb34240	! t0_kref+0x22e4:   	array16	%o5, %g0, %l7
	.word	0xb3b64a7e	! t0_kref+0x22e8:   	fpadd32s	%f25, %f30, %f25
	.word	0x93b3404d	! t0_kref+0x22ec:   	edge8l	%o5, %o5, %o1
	.word	0x81dc4001	! t0_kref+0x22f0:   	flush	%l1 + %g1
	.word	0xb9a0191b	! t0_kref+0x22f4:   	fitod	%f27, %f28
	.word	0xb9b00fc0	! t0_kref+0x22f8:   	fone	%f28
	.word	0xe43e6008	! t0_kref+0x22fc:   	std	%l2, [%i1 + 8]
	.word	0x81dfb774	! t0_kref+0x2300:   	flush	%fp - 0x88c
	.word	0xee4e7ff9	! t0_kref+0x2304:   	ldsb	[%i1 - 7], %l7
	.word	0xbdb68f9e	! t0_kref+0x2308:   	for	%f26, %f30, %f30
	.word	0xace3771a	! t0_kref+0x230c:   	subccc	%o5, -0x8e6, %l6
	.word	0xe80e200a	! t0_kref+0x2310:   	ldub	[%i0 + 0xa], %l4
	.word	0xd296d059	! t0_kref+0x2314:   	lduha	[%i3 + %i1]0x82, %o1
	.word	0xb7a0053c	! t0_kref+0x2318:   	fsqrts	%f28, %f27
	.word	0xb9a748b9	! t0_kref+0x231c:   	fsubs	%f29, %f25, %f28
	.word	0x9523795d	! t0_kref+0x2320:   	mulscc	%o5, -0x6a3, %o2
	.word	0x92e37325	! t0_kref+0x2324:   	subccc	%o5, -0xcdb, %o1
	.word	0xb5a0055e	! t0_kref+0x2328:   	fsqrtd	%f30, %f26
	.word	0x97b340cd	! t0_kref+0x232c:   	edge16l	%o5, %o5, %o3
	.word	0xc168a003	! t0_kref+0x2330:   	prefetch	%g2 + 3, 0
	.word	0xf1be188d	! t0_kref+0x2334:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xafb68418	! t0_kref+0x2338:   	fcmple16	%f26, %f24, %l7
	.word	0x8d8372e2	! t0_kref+0x233c:   	wr	%o5, 0xfffff2e2, %fprs
	.word	0x81af0a5a	! t0_kref+0x2340:   	fcmpd	%fcc0, %f28, %f26
	.word	0xea48a036	! t0_kref+0x2344:   	ldsb	[%g2 + 0x36], %l5
	.word	0x86102001	! t0_kref+0x2348:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x234c:   	bne,a	_kref+0x234c
	.word	0x86a0e001	! t0_kref+0x2350:   	subcc	%g3, 1, %g3
	.word	0xbda6c83d	! t0_kref+0x2354:   	fadds	%f27, %f29, %f30
	.word	0x81dc400a	! t0_kref+0x2358:   	flush	%l1 + %o2
	.word	0x91b6045a	! t0_kref+0x235c:   	fcmpne16	%f24, %f26, %o0
	.word	0xb7a649bc	! t0_kref+0x2360:   	fdivs	%f25, %f28, %f27
	.word	0xfd1e7ff8	! t0_kref+0x2364:   	ldd	[%i1 - 8], %f30
	.word	0xf3070018	! t0_kref+0x2368:   	ld	[%i4 + %i0], %f25
	.word	0xda363fee	! t0_kref+0x236c:   	sth	%o5, [%i0 - 0x12]
	.word	0xb7a00039	! t0_kref+0x2370:   	fmovs	%f25, %f27
	.word	0xb5b68e80	! t0_kref+0x2374:   	fsrc1	%f26, %f26
	.word	0xb3a0053e	! t0_kref+0x2378:   	fsqrts	%f30, %f25
	.word	0xd64e201f	! t0_kref+0x237c:   	ldsb	[%i0 + 0x1f], %o3
	.word	0xea0e600f	! t0_kref+0x2380:   	ldub	[%i1 + 0xf], %l5
	.word	0x8143e040	! t0_kref+0x2384:   	membar	0x40
	.word	0xe6060000	! t0_kref+0x2388:   	ld	[%i0], %l3
	.word	0xb7a0003e	! t0_kref+0x238c:   	fmovs	%f30, %f27
	.word	0xd89f5040	! t0_kref+0x2390:   	ldda	[%i5]0x82, %o4
	.word	0xb1b70c58	! t0_kref+0x2394:   	fnor	%f28, %f24, %f24
	.word	0xda363ff4	! t0_kref+0x2398:   	sth	%o5, [%i0 - 0xc]
	.word	0xa8b3699c	! t0_kref+0x239c:   	orncc	%o5, 0x99c, %l4
	.word	0x93b6851c	! t0_kref+0x23a0:   	fcmpgt16	%f26, %f28, %o1
	.word	0xda30a032	! t0_kref+0x23a4:   	sth	%o5, [%g2 + 0x32]
	.word	0xd450a00c	! t0_kref+0x23a8:   	ldsh	[%g2 + 0xc], %o2
	.word	0xea480018	! t0_kref+0x23ac:   	ldsb	[%g0 + %i0], %l5
	.word	0x8143c000	! t0_kref+0x23b0:   	stbar
	.word	0xd008a016	! t0_kref+0x23b4:   	ldub	[%g2 + 0x16], %o0
	.word	0xb7a018da	! t0_kref+0x23b8:   	fdtos	%f26, %f27
	.word	0xf51e7fe8	! t0_kref+0x23bc:   	ldd	[%i1 - 0x18], %f26
	.word	0x93b785d8	! t0_kref+0x23c0:   	fcmpeq32	%f30, %f24, %o1
	.word	0xfd20a034	! t0_kref+0x23c4:   	st	%f30, [%g2 + 0x34]
	.word	0xbfb7cdb8	! t0_kref+0x23c8:   	fxors	%f31, %f24, %f31
	.word	0xf720a008	! t0_kref+0x23cc:   	st	%f27, [%g2 + 8]
	.word	0xa823400d	! t0_kref+0x23d0:   	sub	%o5, %o5, %l4
	.word	0xb1a649be	! t0_kref+0x23d4:   	fdivs	%f25, %f30, %f24
	.word	0xe610a018	! t0_kref+0x23d8:   	lduh	[%g2 + 0x18], %l3
	.word	0xf9060000	! t0_kref+0x23dc:   	ld	[%i0], %f28
	.word	0xe60e8018	! t0_kref+0x23e0:   	ldub	[%i2 + %i0], %l3
	.word	0xb1b6c97c	! t0_kref+0x23e4:   	fpmerge	%f27, %f28, %f24
	.word	0xd5f6500d	! t0_kref+0x23e8:   	casxa	[%i1]0x80, %o5, %o2
	.word	0xf11e3fe8	! t0_kref+0x23ec:   	ldd	[%i0 - 0x18], %f24
	.word	0x81da8014	! t0_kref+0x23f0:   	flush	%o2 + %l4
	.word	0x91b6041c	! t0_kref+0x23f4:   	fcmple16	%f24, %f28, %o0
	.word	0xd640a000	! t0_kref+0x23f8:   	ldsw	[%g2], %o3
	.word	0xd648a030	! t0_kref+0x23fc:   	ldsb	[%g2 + 0x30], %o3
	.word	0xbda6895e	! t0_kref+0x2400:   	fmuld	%f26, %f30, %f30
	.word	0xd206001c	! t0_kref+0x2404:   	ld	[%i0 + %i4], %o1
	.word	0xf7063ff0	! t0_kref+0x2408:   	ld	[%i0 - 0x10], %f27
	.word	0xb9a0053c	! t0_kref+0x240c:   	fsqrts	%f28, %f28
	.word	0x96bb400d	! t0_kref+0x2410:   	xnorcc	%o5, %o5, %o3
	.word	0xd00e2016	! t0_kref+0x2414:   	ldub	[%i0 + 0x16], %o0
	.word	0xd09e1000	! t0_kref+0x2418:   	ldda	[%i0]0x80, %o0
	.word	0xf3070018	! t0_kref+0x241c:   	ld	[%i4 + %i0], %f25
	.word	0xf9266000	! t0_kref+0x2420:   	st	%f28, [%i1]
	.word	0xbdb6075e	! t0_kref+0x2424:   	fpack32	%f24, %f30, %f30
	.word	0xd81e3ff0	! t0_kref+0x2428:   	ldd	[%i0 - 0x10], %o4
	.word	0xec08a02b	! t0_kref+0x242c:   	ldub	[%g2 + 0x2b], %l6
	.word	0xb1b00fc0	! t0_kref+0x2430:   	fone	%f24
	.word	0x91b34240	! t0_kref+0x2434:   	array16	%o5, %g0, %o0
	.word	0xfb26001c	! t0_kref+0x2438:   	st	%f29, [%i0 + %i4]
	.word	0xe6062008	! t0_kref+0x243c:   	ld	[%i0 + 8], %l3
	.word	0xa7b3402d	! t0_kref+0x2440:   	edge8n	%o5, %o5, %l3
	.word	0x90c3400d	! t0_kref+0x2444:   	addccc	%o5, %o5, %o0
	.word	0xbdb00fc0	! t0_kref+0x2448:   	fone	%f30
	.word	0xd6000018	! t0_kref+0x244c:   	ld	[%g0 + %i0], %o3
	.word	0xd656c018	! t0_kref+0x2450:   	ldsh	[%i3 + %i0], %o3
	.word	0xea56601c	! t0_kref+0x2454:   	ldsh	[%i1 + 0x1c], %l5
	.word	0x9de3bfa0	! t0_kref+0x2458:   	save	%sp, -0x60, %sp
	.word	0x81c86c34	! t0_kref+0x245c:   	return	%g1 + 0xc34
	.word	0xb9a018de	! t0_kref+0x2460:   	fdtos	%f30, %f28
	.word	0xda28a030	! t0_kref+0x2464:   	stb	%o5, [%g2 + 0x30]
	.word	0xb5b70e5a	! t0_kref+0x2468:   	fxnor	%f28, %f26, %f26
	.word	0xae5b400d	! t0_kref+0x246c:   	smul	%o5, %o5, %l7
	.word	0xb3b70d60	! t0_kref+0x2470:   	fnot1s	%f28, %f25
	.word	0xabb3410d	! t0_kref+0x2474:   	edge32	%o5, %o5, %l5
	.word	0x28800003	! t0_kref+0x2478:   	bleu,a	_kref+0x2484
	.word	0xf700a030	! t0_kref+0x247c:   	ld	[%g2 + 0x30], %f27
	.word	0xd0871018	! t0_kref+0x2480:   	lda	[%i4 + %i0]0x80, %o0
	.word	0xd4563ffe	! t0_kref+0x2484:   	ldsh	[%i0 - 2], %o2
	.word	0xe850a012	! t0_kref+0x2488:   	ldsh	[%g2 + 0x12], %l4
	.word	0xb7a01898	! t0_kref+0x248c:   	fitos	%f24, %f27
	.word	0xf5070018	! t0_kref+0x2490:   	ld	[%i4 + %i0], %f26
	.word	0xb9a689bf	! t0_kref+0x2494:   	fdivs	%f26, %f31, %f28
	.word	0xe850a022	! t0_kref+0x2498:   	ldsh	[%g2 + 0x22], %l4
	.word	0xb3a709bb	! t0_kref+0x249c:   	fdivs	%f28, %f27, %f25
	.word	0xbdb009b9	! t0_kref+0x24a0:   	fexpand	%f25, %f30
	.word	0xb9a6c9bf	! t0_kref+0x24a4:   	fdivs	%f27, %f31, %f28
	.word	0x961b400d	! t0_kref+0x24a8:   	xor	%o5, %o5, %o3
	.word	0xb9b60d9e	! t0_kref+0x24ac:   	fxor	%f24, %f30, %f28
	.word	0xb9b00778	! t0_kref+0x24b0:   	fpack16	%f24, %f28
	.word	0xea4e201f	! t0_kref+0x24b4:   	ldsb	[%i0 + 0x1f], %l5
	.word	0xdaae101a	! t0_kref+0x24b8:   	stba	%o5, [%i0 + %i2]0x80
	.word	0x92bb400d	! t0_kref+0x24bc:   	xnorcc	%o5, %o5, %o1
	.word	0x97b604d8	! t0_kref+0x24c0:   	fcmpne32	%f24, %f24, %o3
	.word	0xd4163ff8	! t0_kref+0x24c4:   	lduh	[%i0 - 8], %o2
	.word	0xda28a01c	! t0_kref+0x24c8:   	stb	%o5, [%g2 + 0x1c]
	.word	0xacd3400d	! t0_kref+0x24cc:   	umulcc	%o5, %o5, %l6
	.word	0xb5b009bb	! t0_kref+0x24d0:   	fexpand	%f27, %f26
	.word	0xabb3404d	! t0_kref+0x24d4:   	edge8l	%o5, %o5, %l5
	.word	0x81ae8a5c	! t0_kref+0x24d8:   	fcmpd	%fcc0, %f26, %f28
	.word	0xb5b74979	! t0_kref+0x24dc:   	fpmerge	%f29, %f25, %f26
	.word	0xd20e001a	! t0_kref+0x24e0:   	ldub	[%i0 + %i2], %o1
	.word	0x86102004	! t0_kref+0x24e4:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x24e8:   	bne,a	_kref+0x24e8
	.word	0x86a0e001	! t0_kref+0x24ec:   	subcc	%g3, 1, %g3
	.word	0xd408a03c	! t0_kref+0x24f0:   	ldub	[%g2 + 0x3c], %o2
	.word	0xda200019	! t0_kref+0x24f4:   	st	%o5, [%g0 + %i1]
	.word	0xf500a030	! t0_kref+0x24f8:   	ld	[%g2 + 0x30], %f26
	.word	0xff00a028	! t0_kref+0x24fc:   	ld	[%g2 + 0x28], %f31
	.word	0x9053400d	! t0_kref+0x2500:   	umul	%o5, %o5, %o0
	.word	0xc168a082	! t0_kref+0x2504:   	prefetch	%g2 + 0x82, 0
	.word	0xb9b68d40	! t0_kref+0x2508:   	fnot1	%f26, %f28
	.word	0xee564000	! t0_kref+0x250c:   	ldsh	[%i1], %l7
	.word	0xe80e4000	! t0_kref+0x2510:   	ldub	[%i1], %l4
	.word	0x969b75eb	! t0_kref+0x2514:   	xorcc	%o5, -0xa15, %o3
	.word	0xd450a038	! t0_kref+0x2518:   	ldsh	[%g2 + 0x38], %o2
	.word	0xf500a010	! t0_kref+0x251c:   	ld	[%g2 + 0x10], %f26
	.word	0xabb785d8	! t0_kref+0x2520:   	fcmpeq32	%f30, %f24, %l5
	.word	0xd0d6d040	! t0_kref+0x2524:   	ldsha	[%i3]0x82, %o0
	.word	0xd0000018	! t0_kref+0x2528:   	ld	[%g0 + %i0], %o0
	.word	0xadb3404d	! t0_kref+0x252c:   	edge8l	%o5, %o5, %l6
	.word	0xafb3434d	! t0_kref+0x2530:   	alignaddrl	%o5, %o5, %l7
	.word	0xda30a03c	! t0_kref+0x2534:   	sth	%o5, [%g2 + 0x3c]
	.word	0xf7063ff0	! t0_kref+0x2538:   	ld	[%i0 - 0x10], %f27
	.word	0xee567fe6	! t0_kref+0x253c:   	ldsh	[%i1 - 0x1a], %l7
	.word	0xd2000018	! t0_kref+0x2540:   	ld	[%g0 + %i0], %o1
	.word	0xe650a024	! t0_kref+0x2544:   	ldsh	[%g2 + 0x24], %l3
	.word	0xe610a026	! t0_kref+0x2548:   	lduh	[%g2 + 0x26], %l3
	.word	0x81b01022	! t0_kref+0x254c:   	siam	0x2
	.word	0xd24e600a	! t0_kref+0x2550:   	ldsb	[%i1 + 0xa], %o1
	.word	0xda28a014	! t0_kref+0x2554:   	stb	%o5, [%g2 + 0x14]
	.word	0xf520a034	! t0_kref+0x2558:   	st	%f26, [%g2 + 0x34]
	.word	0xd4062008	! t0_kref+0x255c:   	ld	[%i0 + 8], %o2
	.word	0xea56401b	! t0_kref+0x2560:   	ldsh	[%i1 + %i3], %l5
	.word	0xea08a01b	! t0_kref+0x2564:   	ldub	[%g2 + 0x1b], %l5
	.word	0xfb00a010	! t0_kref+0x2568:   	ld	[%g2 + 0x10], %f29
	.word	0x86102013	! t0_kref+0x256c:   	mov	0x13, %g3
	.word	0x86a0e001	! t0_kref+0x2570:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x2574:   	be,a	_kref+0x2598
	.word	0xe6000019	! t0_kref+0x2578:   	ld	[%g0 + %i1], %l3
	.word	0xf506600c	! t0_kref+0x257c:   	ld	[%i1 + 0xc], %f26
	.word	0xd040a018	! t0_kref+0x2580:   	ldsw	[%g2 + 0x18], %o0
	.word	0xd440a02c	! t0_kref+0x2584:   	ldsw	[%g2 + 0x2c], %o2
	.word	0x81ae0a5a	! t0_kref+0x2588:   	fcmpd	%fcc0, %f24, %f26
	.word	0xaf408000	! t0_kref+0x258c:   	mov	%ccr, %l7
	.word	0xb5a0111e	! t0_kref+0x2590:   	fxtod	%f30, %f26
	.word	0xea10a02a	! t0_kref+0x2594:   	lduh	[%g2 + 0x2a], %l5
	.word	0xd00e401a	! t0_kref+0x2598:   	ldub	[%i1 + %i2], %o0
	.word	0xbfa7093a	! t0_kref+0x259c:   	fmuls	%f28, %f26, %f31
	.word	0xbfa7893f	! t0_kref+0x25a0:   	fmuls	%f30, %f31, %f31
	.word	0xb1a7c9be	! t0_kref+0x25a4:   	fdivs	%f31, %f30, %f24
	.word	0xee0e2017	! t0_kref+0x25a8:   	ldub	[%i0 + 0x17], %l7
	.word	0xe848a019	! t0_kref+0x25ac:   	ldsb	[%g2 + 0x19], %l4
	.word	0xb5b009be	! t0_kref+0x25b0:   	fexpand	%f30, %f26
	.word	0xf920a014	! t0_kref+0x25b4:   	st	%f28, [%g2 + 0x14]
	.word	0xda266004	! t0_kref+0x25b8:   	st	%o5, [%i1 + 4]
	.word	0xd44e0000	! t0_kref+0x25bc:   	ldsb	[%i0], %o2
	.word	0xe656001b	! t0_kref+0x25c0:   	ldsh	[%i0 + %i3], %l3
	.word	0xe610a02c	! t0_kref+0x25c4:   	lduh	[%g2 + 0x2c], %l3
	.word	0xe80e6014	! t0_kref+0x25c8:   	ldub	[%i1 + 0x14], %l4
	.word	0xd4063fe8	! t0_kref+0x25cc:   	ld	[%i0 - 0x18], %o2
	.word	0xc568a042	! t0_kref+0x25d0:   	prefetch	%g2 + 0x42, 2
	.word	0xb5b68ede	! t0_kref+0x25d4:   	fornot2	%f26, %f30, %f26
	.word	0xbda0053f	! t0_kref+0x25d8:   	fsqrts	%f31, %f30
	.word	0xfd1e7ff8	! t0_kref+0x25dc:   	ldd	[%i1 - 8], %f30
	.word	0xb9a0055c	! t0_kref+0x25e0:   	fsqrtd	%f28, %f28
	.word	0xbbb64e39	! t0_kref+0x25e4:   	fands	%f25, %f25, %f29
	.word	0xda20a010	! t0_kref+0x25e8:   	st	%o5, [%g2 + 0x10]
	.word	0xd20e0000	! t0_kref+0x25ec:   	ldub	[%i0], %o1
	.word	0xfd1e3ff0	! t0_kref+0x25f0:   	ldd	[%i0 - 0x10], %f30
	.word	0xd648a022	! t0_kref+0x25f4:   	ldsb	[%g2 + 0x22], %o3
	.word	0xb5b009bd	! t0_kref+0x25f8:   	fexpand	%f29, %f26
	.word	0xd448a020	! t0_kref+0x25fc:   	ldsb	[%g2 + 0x20], %o2
	.word	0xd0566014	! t0_kref+0x2600:   	ldsh	[%i1 + 0x14], %o0
	.word	0xb1a0055e	! t0_kref+0x2604:   	fsqrtd	%f30, %f24
	.word	0xda280018	! t0_kref+0x2608:   	stb	%o5, [%g0 + %i0]
	.word	0x8d83400d	! t0_kref+0x260c:   	wr	%o5, %o5, %fprs
	.word	0x81af8adc	! t0_kref+0x2610:   	fcmped	%fcc0, %f30, %f28
	call	SYM(t0_subr0)
	.word	0xbfb70ea0	! t0_kref+0x2618:   	fsrc1s	%f28, %f31
	.word	0xea062008	! t0_kref+0x261c:   	ld	[%i0 + 8], %l5
	.word	0xe84e7fea	! t0_kref+0x2620:   	ldsb	[%i1 - 0x16], %l4
	.word	0xb1b68c9c	! t0_kref+0x2624:   	fandnot2	%f26, %f28, %f24
	.word	0xf91e401d	! t0_kref+0x2628:   	ldd	[%i1 + %i5], %f28
	.word	0xf500a014	! t0_kref+0x262c:   	ld	[%g2 + 0x14], %f26
	.word	0xd450a01e	! t0_kref+0x2630:   	ldsh	[%g2 + 0x1e], %o2
	.word	0xe64e3ffc	! t0_kref+0x2634:   	ldsb	[%i0 - 4], %l3
	.word	0xd2060000	! t0_kref+0x2638:   	ld	[%i0], %o1
	.word	0xa7b3410d	! t0_kref+0x263c:   	edge32	%o5, %o5, %l3
	.word	0xfd1e6000	! t0_kref+0x2640:   	ldd	[%i1], %f30
	.word	0xec0e8019	! t0_kref+0x2644:   	ldub	[%i2 + %i1], %l6
	.word	0xb1b686f8	! t0_kref+0x2648:   	fmul8ulx16	%f26, %f24, %f24
	.word	0xd2162002	! t0_kref+0x264c:   	lduh	[%i0 + 2], %o1
	.word	0xbdb786bd	! t0_kref+0x2650:   	fmul8x16al	%f30, %f29, %f30
	.word	0xad237742	! t0_kref+0x2654:   	mulscc	%o5, -0x8be, %l6
	.word	0xa744c000	! t0_kref+0x2658:   	mov	%gsr, %l3
	.word	0x3e800004	! t0_kref+0x265c:   	bvc,a	_kref+0x266c
	.word	0xf1be5a1d	! t0_kref+0x2660:   	stda	%f24, [%i1 + %i5]0xd0
	.word	0xe840a000	! t0_kref+0x2664:   	ldsw	[%g2], %l4
	.word	0xe6567ffc	! t0_kref+0x2668:   	ldsh	[%i1 - 4], %l3
	.word	0xea56401b	! t0_kref+0x266c:   	ldsh	[%i1 + %i3], %l5
	.word	0xee40a03c	! t0_kref+0x2670:   	ldsw	[%g2 + 0x3c], %l7
	.word	0xda20a00c	! t0_kref+0x2674:   	st	%o5, [%g2 + 0xc]
	.word	0xee567fe8	! t0_kref+0x2678:   	ldsh	[%i1 - 0x18], %l7
	.word	0x91b3406d	! t0_kref+0x267c:   	edge8ln	%o5, %o5, %o0
	.word	0xb3a01a3e	! t0_kref+0x2680:   	fstoi	%f30, %f25
	.word	0xd600a01c	! t0_kref+0x2684:   	ld	[%g2 + 0x1c], %o3
	.word	0xda20a000	! t0_kref+0x2688:   	st	%o5, [%g2]
	.word	0xb1b60ed8	! t0_kref+0x268c:   	fornot2	%f24, %f24, %f24
	.word	0xbda0053c	! t0_kref+0x2690:   	fsqrts	%f28, %f30
	.word	0xbfa0053c	! t0_kref+0x2694:   	fsqrts	%f28, %f31
	.word	0x922b6aa8	! t0_kref+0x2698:   	andn	%o5, 0xaa8, %o1
	.word	0xd6000018	! t0_kref+0x269c:   	ld	[%g0 + %i0], %o3
	.word	0x33800003	! t0_kref+0x26a0:   	fbe,a	_kref+0x26ac
	.word	0xea067ffc	! t0_kref+0x26a4:   	ld	[%i1 - 4], %l5
	.word	0xea56c018	! t0_kref+0x26a8:   	ldsh	[%i3 + %i0], %l5
	.word	0xd2066004	! t0_kref+0x26ac:   	ld	[%i1 + 4], %o1
	.word	0xb7b7ca78	! t0_kref+0x26b0:   	fpadd32s	%f31, %f24, %f27
	.word	0xbfb0077a	! t0_kref+0x26b4:   	fpack16	%f26, %f31
	.word	0xb3a608bc	! t0_kref+0x26b8:   	fsubs	%f24, %f28, %f25
	.word	0xd81e401d	! t0_kref+0x26bc:   	ldd	[%i1 + %i5], %o4
	.word	0xda20a038	! t0_kref+0x26c0:   	st	%o5, [%g2 + 0x38]
	.word	0xee0e6012	! t0_kref+0x26c4:   	ldub	[%i1 + 0x12], %l7
	.word	0xbda68858	! t0_kref+0x26c8:   	faddd	%f26, %f24, %f30
	.word	0xa9b785de	! t0_kref+0x26cc:   	fcmpeq32	%f30, %f30, %l4
	.word	0xda30a010	! t0_kref+0x26d0:   	sth	%o5, [%g2 + 0x10]
	.word	0xe1ee101a	! t0_kref+0x26d4:   	prefetcha	%i0 + %i2, 16
	.word	0x95b3432d	! t0_kref+0x26d8:   	bmask	%o5, %o5, %o2
	.word	0xafb3416d	! t0_kref+0x26dc:   	edge32ln	%o5, %o5, %l7
	.word	0xbda609bf	! t0_kref+0x26e0:   	fdivs	%f24, %f31, %f30
	.word	0xae63660a	! t0_kref+0x26e4:   	subc	%o5, 0x60a, %l7
	.word	0xda2e401a	! t0_kref+0x26e8:   	stb	%o5, [%i1 + %i2]
	.word	0x940b400d	! t0_kref+0x26ec:   	and	%o5, %o5, %o2
	.word	0xb1b009ba	! t0_kref+0x26f0:   	fexpand	%f26, %f24
	.word	0x20800001	! t0_kref+0x26f4:   	bn,a	_kref+0x26f8
	.word	0x95408000	! t0_kref+0x26f8:   	mov	%ccr, %o2
	.word	0xe616001b	! t0_kref+0x26fc:   	lduh	[%i0 + %i3], %l3
	.word	0xec08a002	! t0_kref+0x2700:   	ldub	[%g2 + 2], %l6
	.word	0xfb00a014	! t0_kref+0x2704:   	ld	[%g2 + 0x14], %f29
	.word	0xec167fe6	! t0_kref+0x2708:   	lduh	[%i1 - 0x1a], %l6
	.word	0xb5a708ba	! t0_kref+0x270c:   	fsubs	%f28, %f26, %f26
	.word	0xf700a03c	! t0_kref+0x2710:   	ld	[%g2 + 0x3c], %f27
	.word	0x91b3432d	! t0_kref+0x2714:   	bmask	%o5, %o5, %o0
	.word	0xbda689b9	! t0_kref+0x2718:   	fdivs	%f26, %f25, %f30
	.word	0xe6164000	! t0_kref+0x271c:   	lduh	[%i1], %l3
	.word	0xb7a00538	! t0_kref+0x2720:   	fsqrts	%f24, %f27
	.word	0xda766018	! t0_kref+0x2724:   	stx	%o5, [%i1 + 0x18]
	.word	0xd44e0000	! t0_kref+0x2728:   	ldsb	[%i0], %o2
	.word	0xaf40c000	! t0_kref+0x272c:   	mov	%asi, %l7
	.word	0xbbb007ba	! t0_kref+0x2730:   	fpackfix	%f26, %f29
	.word	0xd24e600f	! t0_kref+0x2734:   	ldsb	[%i1 + 0xf], %o1
	.word	0xe648a014	! t0_kref+0x2738:   	ldsb	[%g2 + 0x14], %l3
	.word	0xb5b78e3d	! t0_kref+0x273c:   	fands	%f30, %f29, %f26
	.word	0xf19f5040	! t0_kref+0x2740:   	ldda	[%i5]0x82, %f24
	.word	0xec070019	! t0_kref+0x2744:   	ld	[%i4 + %i1], %l6
	.word	0xb9b60638	! t0_kref+0x2748:   	fmul8x16	%f24, %f24, %f28
	.word	0xbba649ba	! t0_kref+0x274c:   	fdivs	%f25, %f26, %f29
	.word	0xb5b6891e	! t0_kref+0x2750:   	faligndata	%f26, %f30, %f26
	.word	0xa65b400d	! t0_kref+0x2754:   	smul	%o5, %o5, %l3
	.word	0xa6ab400d	! t0_kref+0x2758:   	andncc	%o5, %o5, %l3
	.word	0xba103ff8	! t0_kref+0x275c:   	mov	0xfffffff8, %i5
	.word	0xb1a01939	! t0_kref+0x2760:   	fstod	%f25, %f24
	.word	0x91b3434d	! t0_kref+0x2764:   	alignaddrl	%o5, %o5, %o0
	.word	0xf11e3fe8	! t0_kref+0x2768:   	ldd	[%i0 - 0x18], %f24
	.word	0xea08a028	! t0_kref+0x276c:   	ldub	[%g2 + 0x28], %l5
	.word	0xb5b60679	! t0_kref+0x2770:   	fmul8x16au	%f24, %f25, %f26
	.word	0xee060000	! t0_kref+0x2774:   	ld	[%i0], %l7
	.word	0xb5a0191b	! t0_kref+0x2778:   	fitod	%f27, %f26
	.word	0xace37294	! t0_kref+0x277c:   	subccc	%o5, -0xd6c, %l6
	.word	0xa8936f54	! t0_kref+0x2780:   	orcc	%o5, 0xf54, %l4
	.word	0xbfb00f3e	! t0_kref+0x2784:   	fsrc2s	%f30, %f31
	.word	0xec16c018	! t0_kref+0x2788:   	lduh	[%i3 + %i0], %l6
	.word	0xd2567fe0	! t0_kref+0x278c:   	ldsh	[%i1 - 0x20], %o1
	.word	0xd256201e	! t0_kref+0x2790:   	ldsh	[%i0 + 0x1e], %o1
	.word	0x23800004	! t0_kref+0x2794:   	fbne,a	_kref+0x27a4
	.word	0xda30a02a	! t0_kref+0x2798:   	sth	%o5, [%g2 + 0x2a]
	.word	0xbfa6c8bf	! t0_kref+0x279c:   	fsubs	%f27, %f31, %f31
	.word	0xd01e4000	! t0_kref+0x27a0:   	ldd	[%i1], %o0
	.word	0xb5b68adc	! t0_kref+0x27a4:   	fpsub32	%f26, %f28, %f26
	.word	0xb1b00fe0	! t0_kref+0x27a8:   	fones	%f24
	.word	0xf9063ff4	! t0_kref+0x27ac:   	ld	[%i0 - 0xc], %f28
	.word	0xec48a02a	! t0_kref+0x27b0:   	ldsb	[%g2 + 0x2a], %l6
	.word	0xb9b60918	! t0_kref+0x27b4:   	faligndata	%f24, %f24, %f28
	.word	0xb9a0193e	! t0_kref+0x27b8:   	fstod	%f30, %f28
	.word	0xb9b70e5c	! t0_kref+0x27bc:   	fxnor	%f28, %f28, %f28
	.word	0xf3263ff0	! t0_kref+0x27c0:   	st	%f25, [%i0 - 0x10]
	.word	0xabb3410d	! t0_kref+0x27c4:   	edge32	%o5, %o5, %l5
	.word	0xda28a02c	! t0_kref+0x27c8:   	stb	%o5, [%g2 + 0x2c]
	.word	0xf300a024	! t0_kref+0x27cc:   	ld	[%g2 + 0x24], %f25
	.word	0xd410a00c	! t0_kref+0x27d0:   	lduh	[%g2 + 0xc], %o2
	.word	0xa783400d	! t0_kref+0x27d4:   	wr	%o5, %o5, %gsr
	.word	0xd40e4000	! t0_kref+0x27d8:   	ldub	[%i1], %o2
	.word	0xeb6e001b	! t0_kref+0x27dc:   	prefetch	%i0 + %i3, 21
	.word	0xa9b604d8	! t0_kref+0x27e0:   	fcmpne32	%f24, %f24, %l4
	.word	0xfd1e4000	! t0_kref+0x27e4:   	ldd	[%i1], %f30
	.word	0xb9a000bf	! t0_kref+0x27e8:   	fnegs	%f31, %f28
	.word	0xbda00539	! t0_kref+0x27ec:   	fsqrts	%f25, %f30
	.word	0xbda01a58	! t0_kref+0x27f0:   	fdtoi	%f24, %f30
	.word	0xd250a028	! t0_kref+0x27f4:   	ldsh	[%g2 + 0x28], %o1
	.word	0xbdb00f1e	! t0_kref+0x27f8:   	fsrc2	%f30, %f30
	.word	0xab33601a	! t0_kref+0x27fc:   	srl	%o5, 0x1a, %l5
	.word	0xf1070019	! t0_kref+0x2800:   	ld	[%i4 + %i1], %f24
	.word	0xee4e3ff0	! t0_kref+0x2804:   	ldsb	[%i0 - 0x10], %l7
	.word	0xab336007	! t0_kref+0x2808:   	srl	%o5, 0x7, %l5
	.word	0xda263fe4	! t0_kref+0x280c:   	st	%o5, [%i0 - 0x1c]
	.word	0xb1b009b8	! t0_kref+0x2810:   	fexpand	%f24, %f24
	.word	0xb9a789b8	! t0_kref+0x2814:   	fdivs	%f30, %f24, %f28
	.word	0xb9b6899e	! t0_kref+0x2818:   	bshuffle	%f26, %f30, %f28
	.word	0xbda789bf	! t0_kref+0x281c:   	fdivs	%f30, %f31, %f30
	.word	0xda20a010	! t0_kref+0x2820:   	st	%o5, [%g2 + 0x10]
	.word	0xb1a01a3f	! t0_kref+0x2824:   	fstoi	%f31, %f24
	.word	0x9544c000	! t0_kref+0x2828:   	mov	%gsr, %o2
	.word	0xf5062000	! t0_kref+0x282c:   	ld	[%i0], %f26
	.word	0xd20e2012	! t0_kref+0x2830:   	ldub	[%i0 + 0x12], %o1
	.word	0xee4e0000	! t0_kref+0x2834:   	ldsb	[%i0], %l7
	.word	0xda28a014	! t0_kref+0x2838:   	stb	%o5, [%g2 + 0x14]
	.word	0x91b34200	! t0_kref+0x283c:   	array8	%o5, %g0, %o0
	.word	0xf1be188d	! t0_kref+0x2840:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xd2070018	! t0_kref+0x2844:   	ld	[%i4 + %i0], %o1
	.word	0xbfa689bf	! t0_kref+0x2848:   	fdivs	%f26, %f31, %f31
	.word	0xf99eda58	! t0_kref+0x284c:   	ldda	[%i3 + %i0]0xd2, %f28
	.word	0xbdb6c67f	! t0_kref+0x2850:   	fmul8x16au	%f27, %f31, %f30
	.word	0xd050a038	! t0_kref+0x2854:   	ldsh	[%g2 + 0x38], %o0
	.word	0xb1a7c9bc	! t0_kref+0x2858:   	fdivs	%f31, %f28, %f24
	.word	0xe848a009	! t0_kref+0x285c:   	ldsb	[%g2 + 9], %l4
	.word	0xae13400d	! t0_kref+0x2860:   	or	%o5, %o5, %l7
	.word	0xbbb6cea0	! t0_kref+0x2864:   	fsrc1s	%f27, %f29
	.word	0xda20a00c	! t0_kref+0x2868:   	st	%o5, [%g2 + 0xc]
	.word	0x9de3bfa0	! t0_kref+0x286c:   	save	%sp, -0x60, %sp
	.word	0x91e8001b	! t0_kref+0x2870:   	restore	%g0, %i3, %o0
	.word	0xd00e2002	! t0_kref+0x2874:   	ldub	[%i0 + 2], %o0
	.word	0xb1a0003c	! t0_kref+0x2878:   	fmovs	%f28, %f24
	.word	0xe810a02e	! t0_kref+0x287c:   	lduh	[%g2 + 0x2e], %l4
	.word	0xd6062018	! t0_kref+0x2880:   	ld	[%i0 + 0x18], %o3
	.word	0xd0063fe8	! t0_kref+0x2884:   	ld	[%i0 - 0x18], %o0
	.word	0xae7b400d	! t0_kref+0x2888:   	sdiv	%o5, %o5, %l7
	.word	0x33800004	! t0_kref+0x288c:   	fbe,a	_kref+0x289c
	.word	0xfd1f4018	! t0_kref+0x2890:   	ldd	[%i5 + %i0], %f30
	.word	0x81dcbc3e	! t0_kref+0x2894:   	flush	%l2 - 0x3c2
	.word	0xd616401b	! t0_kref+0x2898:   	lduh	[%i1 + %i3], %o3
	.word	0xb9a709bb	! t0_kref+0x289c:   	fdivs	%f28, %f27, %f28
	.word	0xa7418000	! t0_kref+0x28a0:   	mov	%fprs, %l3
	.word	0xae93400d	! t0_kref+0x28a4:   	orcc	%o5, %o5, %l7
	.word	0xa8c3400d	! t0_kref+0x28a8:   	addccc	%o5, %o5, %l4
	.word	0xf720a01c	! t0_kref+0x28ac:   	st	%f27, [%g2 + 0x1c]
	.word	0xd4060000	! t0_kref+0x28b0:   	ld	[%i0], %o2
	.word	0xec48a024	! t0_kref+0x28b4:   	ldsb	[%g2 + 0x24], %l6
	.word	0xd6000019	! t0_kref+0x28b8:   	ld	[%g0 + %i1], %o3
	.word	0xbfb68d39	! t0_kref+0x28bc:   	fandnot1s	%f26, %f25, %f31
	.word	0xec066004	! t0_kref+0x28c0:   	ld	[%i1 + 4], %l6
	.word	0xac13400d	! t0_kref+0x28c4:   	or	%o5, %o5, %l6
	.word	0xbda000bf	! t0_kref+0x28c8:   	fnegs	%f31, %f30
	.word	0xea066004	! t0_kref+0x28cc:   	ld	[%i1 + 4], %l5
	.word	0x81af0ada	! t0_kref+0x28d0:   	fcmped	%fcc0, %f28, %f26
	.word	0x2a800007	! t0_kref+0x28d4:   	bcs,a	_kref+0x28f0
	.word	0xd650a000	! t0_kref+0x28d8:   	ldsh	[%g2], %o3
	.word	0xda20a020	! t0_kref+0x28dc:   	st	%o5, [%g2 + 0x20]
	.word	0x38800008	! t0_kref+0x28e0:   	bgu,a	_kref+0x2900
	.word	0xb5a609b9	! t0_kref+0x28e4:   	fdivs	%f24, %f25, %f26
	.word	0xd6160000	! t0_kref+0x28e8:   	lduh	[%i0], %o3
	.word	0xda28a02e	! t0_kref+0x28ec:   	stb	%o5, [%g2 + 0x2e]
	.word	0x8d83400d	! t0_kref+0x28f0:   	wr	%o5, %o5, %fprs
	.word	0xe848a00b	! t0_kref+0x28f4:   	ldsb	[%g2 + 0xb], %l4
	.word	0xb9b60ed8	! t0_kref+0x28f8:   	fornot2	%f24, %f24, %f28
	.word	0xe60e2018	! t0_kref+0x28fc:   	ldub	[%i0 + 0x18], %l3
	.word	0xd4162016	! t0_kref+0x2900:   	lduh	[%i0 + 0x16], %o2
	.word	0xf11fbd60	! t0_kref+0x2904:   	ldd	[%fp - 0x2a0], %f24
	.word	0xd600a01c	! t0_kref+0x2908:   	ld	[%g2 + 0x1c], %o3
	.word	0xa7b340cd	! t0_kref+0x290c:   	edge16l	%o5, %o5, %l3
	.word	0xda20a028	! t0_kref+0x2910:   	st	%o5, [%g2 + 0x28]
	.word	0xd2560000	! t0_kref+0x2914:   	ldsh	[%i0], %o1
	.word	0xff00a038	! t0_kref+0x2918:   	ld	[%g2 + 0x38], %f31
	.word	0xd050a006	! t0_kref+0x291c:   	ldsh	[%g2 + 6], %o0
	.word	0x81ae0adc	! t0_kref+0x2920:   	fcmped	%fcc0, %f24, %f28
	.word	0xbdb00f38	! t0_kref+0x2924:   	fsrc2s	%f24, %f30
	.word	0xda28a005	! t0_kref+0x2928:   	stb	%o5, [%g2 + 5]
	.word	0xd256200e	! t0_kref+0x292c:   	ldsh	[%i0 + 0xe], %o1
	.word	0xb1a00558	! t0_kref+0x2930:   	fsqrtd	%f24, %f24
	.word	0xda2e6011	! t0_kref+0x2934:   	stb	%o5, [%i1 + 0x11]
	.word	0xa7837a2d	! t0_kref+0x2938:   	wr	%o5, 0xfffffa2d, %gsr
	.word	0xf506201c	! t0_kref+0x293c:   	ld	[%i0 + 0x1c], %f26
	.word	0xd0000019	! t0_kref+0x2940:   	ld	[%g0 + %i1], %o0
	.word	0xb5a0191b	! t0_kref+0x2944:   	fitod	%f27, %f26
	.word	0xda30a03a	! t0_kref+0x2948:   	sth	%o5, [%g2 + 0x3a]
	.word	0xda367fe4	! t0_kref+0x294c:   	sth	%o5, [%i1 - 0x1c]
	.word	0xda28a031	! t0_kref+0x2950:   	stb	%o5, [%g2 + 0x31]
	.word	0xb1b74ea0	! t0_kref+0x2954:   	fsrc1s	%f29, %f24
	.word	0xbdb78978	! t0_kref+0x2958:   	fpmerge	%f30, %f24, %f30
	.word	0xb9b009bd	! t0_kref+0x295c:   	fexpand	%f29, %f28
	.word	0xb1b6891e	! t0_kref+0x2960:   	faligndata	%f26, %f30, %f24
	.word	0x9603708e	! t0_kref+0x2964:   	add	%o5, -0xf72, %o3
	.word	0xb7a689be	! t0_kref+0x2968:   	fdivs	%f26, %f30, %f27
	.word	0xda20a004	! t0_kref+0x296c:   	st	%o5, [%g2 + 4]
	.word	0xb5a018d8	! t0_kref+0x2970:   	fdtos	%f24, %f26
	.word	0xff20a010	! t0_kref+0x2974:   	st	%f31, [%g2 + 0x10]
	.word	0x9744c000	! t0_kref+0x2978:   	mov	%gsr, %o3
	.word	0xa63b400d	! t0_kref+0x297c:   	xnor	%o5, %o5, %l3
	.word	0xda20a038	! t0_kref+0x2980:   	st	%o5, [%g2 + 0x38]
	.word	0xe616001b	! t0_kref+0x2984:   	lduh	[%i0 + %i3], %l3
	.word	0xbbb78ea0	! t0_kref+0x2988:   	fsrc1s	%f30, %f29
	.word	0xb1b64978	! t0_kref+0x298c:   	fpmerge	%f25, %f24, %f24
	.word	0xd200a010	! t0_kref+0x2990:   	ld	[%g2 + 0x10], %o1
	.word	0xafb3404d	! t0_kref+0x2994:   	edge8l	%o5, %o5, %l7
	.word	0xaca37342	! t0_kref+0x2998:   	subcc	%o5, -0xcbe, %l6
	.word	0xb7a01899	! t0_kref+0x299c:   	fitos	%f25, %f27
	.word	0xb1b6091c	! t0_kref+0x29a0:   	faligndata	%f24, %f28, %f24
	.word	0xf926401c	! t0_kref+0x29a4:   	st	%f28, [%i1 + %i4]
	.word	0xec064000	! t0_kref+0x29a8:   	ld	[%i1], %l6
	.word	0xd0167fe4	! t0_kref+0x29ac:   	lduh	[%i1 - 0x1c], %o0
	.word	0x113cc260	! t0_kref+0x29b0:   	sethi	%hi(0xf3098000), %o0
	.word	0xec3e7ff8	! t0_kref+0x29b4:   	std	%l6, [%i1 - 8]
	.word	0xfd1e6000	! t0_kref+0x29b8:   	ldd	[%i1], %f30
	.word	0x91408000	! t0_kref+0x29bc:   	mov	%ccr, %o0
	.word	0xbfa0053c	! t0_kref+0x29c0:   	fsqrts	%f28, %f31
	.word	0xe6066018	! t0_kref+0x29c4:   	ld	[%i1 + 0x18], %l3
	.word	0xe7f6500d	! t0_kref+0x29c8:   	casxa	[%i1]0x80, %o5, %l3
	.word	0xb5a7c9b8	! t0_kref+0x29cc:   	fdivs	%f31, %f24, %f26
	.word	0xd4163ff8	! t0_kref+0x29d0:   	lduh	[%i0 - 8], %o2
	.word	0xda20a010	! t0_kref+0x29d4:   	st	%o5, [%g2 + 0x10]
	.word	0xb5b6875e	! t0_kref+0x29d8:   	fpack32	%f26, %f30, %f26
	.word	0xf120a030	! t0_kref+0x29dc:   	st	%f24, [%g2 + 0x30]
	.word	0xda30a016	! t0_kref+0x29e0:   	sth	%o5, [%g2 + 0x16]
	.word	0xbda709b8	! t0_kref+0x29e4:   	fdivs	%f28, %f24, %f30
	.word	0xe640a02c	! t0_kref+0x29e8:   	ldsw	[%g2 + 0x2c], %l3
	.word	0xea063ff8	! t0_kref+0x29ec:   	ld	[%i0 - 8], %l5
	.word	0xb7a789bc	! t0_kref+0x29f0:   	fdivs	%f30, %f28, %f27
	.word	0xa72364b6	! t0_kref+0x29f4:   	mulscc	%o5, 0x4b6, %l3
	.word	0xf926001c	! t0_kref+0x29f8:   	st	%f28, [%i0 + %i4]
	.word	0x2c800008	! t0_kref+0x29fc:   	bneg,a	_kref+0x2a1c
	.word	0xd010a038	! t0_kref+0x2a00:   	lduh	[%g2 + 0x38], %o0
	.word	0xec4e3fe6	! t0_kref+0x2a04:   	ldsb	[%i0 - 0x1a], %l6
	.word	0xac837ccf	! t0_kref+0x2a08:   	addcc	%o5, -0x331, %l6
	.word	0xe8166004	! t0_kref+0x2a0c:   	lduh	[%i1 + 4], %l4
	.word	0xb1b78c9c	! t0_kref+0x2a10:   	fandnot2	%f30, %f28, %f24
	.word	0x923b400d	! t0_kref+0x2a14:   	xnor	%o5, %o5, %o1
	.word	0xaa637f83	! t0_kref+0x2a18:   	subc	%o5, -0x7d, %l5
	.word	0xb9b70679	! t0_kref+0x2a1c:   	fmul8x16au	%f28, %f25, %f28
	.word	0x9443400d	! t0_kref+0x2a20:   	addc	%o5, %o5, %o2
	.word	0xd44e4000	! t0_kref+0x2a24:   	ldsb	[%i1], %o2
	.word	0xb9aa003a	! t0_kref+0x2a28:   	fmovsa	%fcc0, %f26, %f28
	.word	0xb9a6c9be	! t0_kref+0x2a2c:   	fdivs	%f27, %f30, %f28
	.word	0xbba0053a	! t0_kref+0x2a30:   	fsqrts	%f26, %f29
	.word	0xae837710	! t0_kref+0x2a34:   	addcc	%o5, -0x8f0, %l7
	.word	0xec4e8019	! t0_kref+0x2a38:   	ldsb	[%i2 + %i1], %l6
	.word	0xe816c019	! t0_kref+0x2a3c:   	lduh	[%i3 + %i1], %l4
	.word	0xd04e7ff9	! t0_kref+0x2a40:   	ldsb	[%i1 - 7], %o0
	.word	0xec067ff4	! t0_kref+0x2a44:   	ld	[%i1 - 0xc], %l6
	.word	0xb5b60f9c	! t0_kref+0x2a48:   	for	%f24, %f28, %f26
	.word	0xd008a004	! t0_kref+0x2a4c:   	ldub	[%g2 + 4], %o0
	.word	0xe64e3fe4	! t0_kref+0x2a50:   	ldsb	[%i0 - 0x1c], %l3
	.word	0xb5b70d40	! t0_kref+0x2a54:   	fnot1	%f28, %f26
	.word	0x81af8adc	! t0_kref+0x2a58:   	fcmped	%fcc0, %f30, %f28
	.word	0xdaa6501c	! t0_kref+0x2a5c:   	sta	%o5, [%i1 + %i4]0x80
	.word	0xbfb70ea0	! t0_kref+0x2a60:   	fsrc1s	%f28, %f31
	.word	0x917021b0	! t0_kref+0x2a64:   	popc	0x1b0, %o0
	.word	0xf1bf1a19	! t0_kref+0x2a68:   	stda	%f24, [%i4 + %i1]0xd0
	.word	0xa6e37bbd	! t0_kref+0x2a6c:   	subccc	%o5, -0x443, %l3
	.word	0xb9b70ea0	! t0_kref+0x2a70:   	fsrc1s	%f28, %f28
	.word	0xaa23400d	! t0_kref+0x2a74:   	sub	%o5, %o5, %l5
	.word	0xbfa0013e	! t0_kref+0x2a78:   	fabss	%f30, %f31
	.word	0x81dd8013	! t0_kref+0x2a7c:   	flush	%l6 + %l3
	.word	0xac137444	! t0_kref+0x2a80:   	or	%o5, -0xbbc, %l6
	.word	0xadb7845a	! t0_kref+0x2a84:   	fcmpne16	%f30, %f26, %l6
	.word	0xbfa0053f	! t0_kref+0x2a88:   	fsqrts	%f31, %f31
	.word	0xec066008	! t0_kref+0x2a8c:   	ld	[%i1 + 8], %l6
	.word	0xac13400d	! t0_kref+0x2a90:   	or	%o5, %o5, %l6
	.word	0xb9b00fc0	! t0_kref+0x2a94:   	fone	%f28
	.word	0x86102004	! t0_kref+0x2a98:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2a9c:   	bne,a	_kref+0x2a9c
	.word	0x86a0e001	! t0_kref+0x2aa0:   	subcc	%g3, 1, %g3
	.word	0xa944c000	! t0_kref+0x2aa4:   	mov	%gsr, %l4
	.word	0xd00e200f	! t0_kref+0x2aa8:   	ldub	[%i0 + 0xf], %o0
	.word	0xf700a034	! t0_kref+0x2aac:   	ld	[%g2 + 0x34], %f27
	.word	0xd050a00e	! t0_kref+0x2ab0:   	ldsh	[%g2 + 0xe], %o0
	.word	0x86102005	! t0_kref+0x2ab4:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x2ab8:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x2abc:   	be,a	_kref+0x2adc
	.word	0xec50a008	! t0_kref+0x2ac0:   	ldsh	[%g2 + 8], %l6
	.word	0xee40a000	! t0_kref+0x2ac4:   	ldsw	[%g2], %l7
	.word	0x93b340cd	! t0_kref+0x2ac8:   	edge16l	%o5, %o5, %o1
	.word	0xacdb400d	! t0_kref+0x2acc:   	smulcc	%o5, %o5, %l6
	.word	0xbdb00fc0	! t0_kref+0x2ad0:   	fone	%f30
	.word	0xb9b70f9a	! t0_kref+0x2ad4:   	for	%f28, %f26, %f28
	.word	0x81af8a3b	! t0_kref+0x2ad8:   	fcmps	%fcc0, %f30, %f27
	.word	0xe616401b	! t0_kref+0x2adc:   	lduh	[%i1 + %i3], %l3
	.word	0xe800a004	! t0_kref+0x2ae0:   	ld	[%g2 + 4], %l4
	.word	0xe41e001d	! t0_kref+0x2ae4:   	ldd	[%i0 + %i5], %l2
	.word	0xb5a609b9	! t0_kref+0x2ae8:   	fdivs	%f24, %f25, %f26
	.word	0xb3a789b9	! t0_kref+0x2aec:   	fdivs	%f30, %f25, %f25
	.word	0x2e800007	! t0_kref+0x2af0:   	bvs,a	_kref+0x2b0c
	.word	0xd6067fe4	! t0_kref+0x2af4:   	ld	[%i1 - 0x1c], %o3
	.word	0xda28a012	! t0_kref+0x2af8:   	stb	%o5, [%g2 + 0x12]
	.word	0xf700a02c	! t0_kref+0x2afc:   	ld	[%g2 + 0x2c], %f27
	.word	0xa970000d	! t0_kref+0x2b00:   	popc	%o5, %l4
	.word	0xec0e7ffa	! t0_kref+0x2b04:   	ldub	[%i1 - 6], %l6
	.word	0xbda0053a	! t0_kref+0x2b08:   	fsqrts	%f26, %f30
	.word	0x8610201c	! t0_kref+0x2b0c:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x2b10:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x2b14:   	be,a	_kref+0x2b84
	.word	0xb7a0003b	! t0_kref+0x2b18:   	fmovs	%f27, %f27
	.word	0xb5a68d3d	! t0_kref+0x2b1c:   	fsmuld	%f26, %f29, %f26
	.word	0xe608a005	! t0_kref+0x2b20:   	ldub	[%g2 + 5], %l3
	.word	0x3cbffffb	! t0_kref+0x2b24:   	bpos,a	_kref+0x2b10
	.word	0xbda0053a	! t0_kref+0x2b28:   	fsqrts	%f26, %f30
	.word	0xb3a789ba	! t0_kref+0x2b2c:   	fdivs	%f30, %f26, %f25
	.word	0xfb00a014	! t0_kref+0x2b30:   	ld	[%g2 + 0x14], %f29
	.word	0xac5b7a9e	! t0_kref+0x2b34:   	smul	%o5, -0x562, %l6
	.word	0xd2163fe6	! t0_kref+0x2b38:   	lduh	[%i0 - 0x1a], %o1
	.word	0xb9b00f1c	! t0_kref+0x2b3c:   	fsrc2	%f28, %f28
	.word	0x81df6b6a	! t0_kref+0x2b40:   	flush	%i5 + 0xb6a
	.word	0xb1a6c9b8	! t0_kref+0x2b44:   	fdivs	%f27, %f24, %f24
	.word	0xe8063fe8	! t0_kref+0x2b48:   	ld	[%i0 - 0x18], %l4
	.word	0xfd062000	! t0_kref+0x2b4c:   	ld	[%i0], %f30
	.word	0xadb705dc	! t0_kref+0x2b50:   	fcmpeq32	%f28, %f28, %l6
	.word	0x93b3432d	! t0_kref+0x2b54:   	bmask	%o5, %o5, %o1
	.word	0x8143c000	! t0_kref+0x2b58:   	stbar
	.word	0xa7837943	! t0_kref+0x2b5c:   	wr	%o5, 0xfffff943, %gsr
	.word	0xf51e401d	! t0_kref+0x2b60:   	ldd	[%i1 + %i5], %f26
	.word	0xb5b0077c	! t0_kref+0x2b64:   	fpack16	%f28, %f26
	.word	0xf11e7fe8	! t0_kref+0x2b68:   	ldd	[%i1 - 0x18], %f24
	.word	0xda20a01c	! t0_kref+0x2b6c:   	st	%o5, [%g2 + 0x1c]
	.word	0xb9b00fc0	! t0_kref+0x2b70:   	fone	%f28
	.word	0xb9a0053e	! t0_kref+0x2b74:   	fsqrts	%f30, %f28
	.word	0x900b400d	! t0_kref+0x2b78:   	and	%o5, %o5, %o0
	.word	0xd4180018	! t0_kref+0x2b7c:   	ldd	[%g0 + %i0], %o2
	.word	0xb9a01118	! t0_kref+0x2b80:   	fxtod	%f24, %f28
	.word	0xb1b78e80	! t0_kref+0x2b84:   	fsrc1	%f30, %f24
	.word	0xda20a008	! t0_kref+0x2b88:   	st	%o5, [%g2 + 8]
	.word	0xc168a048	! t0_kref+0x2b8c:   	prefetch	%g2 + 0x48, 0
	.word	0xb3b007b8	! t0_kref+0x2b90:   	fpackfix	%f24, %f25
	.word	0xb3a689b9	! t0_kref+0x2b94:   	fdivs	%f26, %f25, %f25
	.word	0x878020d2	! t0_kref+0x2b98:   	mov	0xd2, %asi
	.word	0xa803400d	! t0_kref+0x2b9c:   	add	%o5, %o5, %l4
	.word	0xbfa018dc	! t0_kref+0x2ba0:   	fdtos	%f28, %f31
	.word	0xa9b34200	! t0_kref+0x2ba4:   	array8	%o5, %g0, %l4
	.word	0xda280019	! t0_kref+0x2ba8:   	stb	%o5, [%g0 + %i1]
	.word	0xec080018	! t0_kref+0x2bac:   	ldub	[%g0 + %i0], %l6
	.word	0xb9a01918	! t0_kref+0x2bb0:   	fitod	%f24, %f28
	.word	0xb1a6cd39	! t0_kref+0x2bb4:   	fsmuld	%f27, %f25, %f24
	.word	0xf9be1a1d	! t0_kref+0x2bb8:   	stda	%f28, [%i0 + %i5]0xd0
	.word	0xafb3412d	! t0_kref+0x2bbc:   	edge32n	%o5, %o5, %l7
	.word	0xda367fe8	! t0_kref+0x2bc0:   	sth	%o5, [%i1 - 0x18]
	.word	0xb1a0055c	! t0_kref+0x2bc4:   	fsqrtd	%f28, %f24
	.word	0xd050a020	! t0_kref+0x2bc8:   	ldsh	[%g2 + 0x20], %o0
	.word	0xa8ab72d3	! t0_kref+0x2bcc:   	andncc	%o5, -0xd2d, %l4
	.word	0xf1bf5a18	! t0_kref+0x2bd0:   	stda	%f24, [%i5 + %i0]0xd0
	.word	0xb9b70c7e	! t0_kref+0x2bd4:   	fnors	%f28, %f30, %f28
	.word	0x81af8adc	! t0_kref+0x2bd8:   	fcmped	%fcc0, %f30, %f28
	.word	0xda28a021	! t0_kref+0x2bdc:   	stb	%o5, [%g2 + 0x21]
	.word	0xfd00a038	! t0_kref+0x2be0:   	ld	[%g2 + 0x38], %f30
	.word	0xd410a004	! t0_kref+0x2be4:   	lduh	[%g2 + 4], %o2
	.word	0xb9b00cde	! t0_kref+0x2be8:   	fnot2	%f30, %f28
	.word	0xf91e3ff0	! t0_kref+0x2bec:   	ldd	[%i0 - 0x10], %f28
	.word	0x3d800007	! t0_kref+0x2bf0:   	fbule,a	_kref+0x2c0c
	.word	0x9433400d	! t0_kref+0x2bf4:   	orn	%o5, %o5, %o2
	.word	0xa65b400d	! t0_kref+0x2bf8:   	smul	%o5, %o5, %l3
	.word	0xea08a033	! t0_kref+0x2bfc:   	ldub	[%g2 + 0x33], %l5
	.word	0xbda649bf	! t0_kref+0x2c00:   	fdivs	%f25, %f31, %f30
	.word	0xe64e8018	! t0_kref+0x2c04:   	ldsb	[%i2 + %i0], %l3
	.word	0x91b7841e	! t0_kref+0x2c08:   	fcmple16	%f30, %f30, %o0
	.word	0xb7a018de	! t0_kref+0x2c0c:   	fdtos	%f30, %f27
	.word	0xf500a018	! t0_kref+0x2c10:   	ld	[%g2 + 0x18], %f26
	.word	0xf1064000	! t0_kref+0x2c14:   	ld	[%i1], %f24
	.word	0xea567fe2	! t0_kref+0x2c18:   	ldsh	[%i1 - 0x1e], %l5
	.word	0xee16c019	! t0_kref+0x2c1c:   	lduh	[%i3 + %i1], %l7
	.word	0xb5a0003a	! t0_kref+0x2c20:   	fmovs	%f26, %f26
	.word	0xd04e3ff2	! t0_kref+0x2c24:   	ldsb	[%i0 - 0xe], %o0
	.word	0x97b3432d	! t0_kref+0x2c28:   	bmask	%o5, %o5, %o3
	.word	0x3b800004	! t0_kref+0x2c2c:   	fble,a	_kref+0x2c3c
	.word	0xda30a000	! t0_kref+0x2c30:   	sth	%o5, [%g2]
	.word	0xec567fec	! t0_kref+0x2c34:   	ldsh	[%i1 - 0x14], %l6
	.word	0xec48a036	! t0_kref+0x2c38:   	ldsb	[%g2 + 0x36], %l6
	.word	0xd00e600d	! t0_kref+0x2c3c:   	ldub	[%i1 + 0xd], %o0
	.word	0xe6164000	! t0_kref+0x2c40:   	lduh	[%i1], %l3
	.word	0xf91e7ff8	! t0_kref+0x2c44:   	ldd	[%i1 - 8], %f28
	.word	0xf1067fec	! t0_kref+0x2c48:   	ld	[%i1 - 0x14], %f24
	.word	0xb7b00c20	! t0_kref+0x2c4c:   	fzeros	%f27
	.word	0xb5a0193c	! t0_kref+0x2c50:   	fstod	%f28, %f26
	.word	0xe60e4000	! t0_kref+0x2c54:   	ldub	[%i1], %l3
	.word	0xd2166018	! t0_kref+0x2c58:   	lduh	[%i1 + 0x18], %o1
	.word	0xafb3416d	! t0_kref+0x2c5c:   	edge32ln	%o5, %o5, %l7
	.word	0xbba0189e	! t0_kref+0x2c60:   	fitos	%f30, %f29
	.word	0xac5b400d	! t0_kref+0x2c64:   	smul	%o5, %o5, %l6
	.word	0xda6e4000	! t0_kref+0x2c68:   	ldstub	[%i1], %o5
	.word	0xff00a00c	! t0_kref+0x2c6c:   	ld	[%g2 + 0xc], %f31
	.word	0xee0e200a	! t0_kref+0x2c70:   	ldub	[%i0 + 0xa], %l7
	.word	0xd41e6000	! t0_kref+0x2c74:   	ldd	[%i1], %o2
	.word	0xa8bb400d	! t0_kref+0x2c78:   	xnorcc	%o5, %o5, %l4
	.word	0x92f37159	! t0_kref+0x2c7c:   	udivcc	%o5, -0xea7, %o1
	.word	0xea062018	! t0_kref+0x2c80:   	ld	[%i0 + 0x18], %l5
	.word	0x81ae8a3f	! t0_kref+0x2c84:   	fcmps	%fcc0, %f26, %f31
	.word	0xf1be188d	! t0_kref+0x2c88:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xe8067ff4	! t0_kref+0x2c8c:   	ld	[%i1 - 0xc], %l4
	.word	0xb9a00558	! t0_kref+0x2c90:   	fsqrtd	%f24, %f28
	.word	0xf1be588d	! t0_kref+0x2c94:   	stda	%f24, [%i1 + %o5]0xc4
	.word	0xffee501d	! t0_kref+0x2c98:   	prefetcha	%i1 + %i5, 31
	.word	0xd650a006	! t0_kref+0x2c9c:   	ldsh	[%g2 + 6], %o3
	.word	0x9423400d	! t0_kref+0x2ca0:   	sub	%o5, %o5, %o2
	.word	0xda20a024	! t0_kref+0x2ca4:   	st	%o5, [%g2 + 0x24]
	.word	0xabb340cd	! t0_kref+0x2ca8:   	edge16l	%o5, %o5, %l5
	.word	0xa803400d	! t0_kref+0x2cac:   	add	%o5, %o5, %l4
	.word	0xfb064000	! t0_kref+0x2cb0:   	ld	[%i1], %f29
	.word	0xd60e4000	! t0_kref+0x2cb4:   	ldub	[%i1], %o3
	.word	0xd44e6002	! t0_kref+0x2cb8:   	ldsb	[%i1 + 2], %o2
	.word	0xb5b7ccbb	! t0_kref+0x2cbc:   	fandnot2s	%f31, %f27, %f26
	.word	0xec080018	! t0_kref+0x2cc0:   	ldub	[%g0 + %i0], %l6
	.word	0xd0480018	! t0_kref+0x2cc4:   	ldsb	[%g0 + %i0], %o0
	.word	0xe84e2007	! t0_kref+0x2cc8:   	ldsb	[%i0 + 7], %l4
	.word	0xec16001b	! t0_kref+0x2ccc:   	lduh	[%i0 + %i3], %l6
	.word	0xda28a009	! t0_kref+0x2cd0:   	stb	%o5, [%g2 + 9]
	.word	0xf9be188d	! t0_kref+0x2cd4:   	stda	%f28, [%i0 + %o5]0xc4
	.word	0xaab3400d	! t0_kref+0x2cd8:   	orncc	%o5, %o5, %l5
	.word	0xe6063ff8	! t0_kref+0x2cdc:   	ld	[%i0 - 8], %l3
	.word	0xe80e8018	! t0_kref+0x2ce0:   	ldub	[%i2 + %i0], %l4
	.word	0xb5b70ea0	! t0_kref+0x2ce4:   	fsrc1s	%f28, %f26
	.word	0xa6836651	! t0_kref+0x2ce8:   	addcc	%o5, 0x651, %l3
	.word	0xd000a03c	! t0_kref+0x2cec:   	ld	[%g2 + 0x3c], %o0
	.word	0xda28a026	! t0_kref+0x2cf0:   	stb	%o5, [%g2 + 0x26]
	.word	0xb5b6899c	! t0_kref+0x2cf4:   	bshuffle	%f26, %f28, %f26
	.word	0xb9a788d8	! t0_kref+0x2cf8:   	fsubd	%f30, %f24, %f28
	.word	0xda30a036	! t0_kref+0x2cfc:   	sth	%o5, [%g2 + 0x36]
	.word	0xd60e8019	! t0_kref+0x2d00:   	ldub	[%i2 + %i1], %o3
	.word	0xec00a03c	! t0_kref+0x2d04:   	ld	[%g2 + 0x3c], %l6
	.word	0xf7064000	! t0_kref+0x2d08:   	ld	[%i1], %f27
	.word	0xbbb00cfa	! t0_kref+0x2d0c:   	fnot2s	%f26, %f29
	.word	0x2f37a616	! t0_kref+0x2d10:   	sethi	%hi(0xde985800), %l7
	.word	0xec4e7ff9	! t0_kref+0x2d14:   	ldsb	[%i1 - 7], %l6
	.word	0xb6103fe2	! t0_kref+0x2d18:   	mov	0xffffffe2, %i3
	.word	0xb3b64fb8	! t0_kref+0x2d1c:   	fors	%f25, %f24, %f25
	.word	0x8610201d	! t0_kref+0x2d20:   	mov	0x1d, %g3
	.word	0x86a0e001	! t0_kref+0x2d24:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x2d28:   	be,a	_kref+0x2d98
	.word	0xbda00538	! t0_kref+0x2d2c:   	fsqrts	%f24, %f30
	.word	0xfd1f4019	! t0_kref+0x2d30:   	ldd	[%i5 + %i1], %f30
	.word	0xafb3410d	! t0_kref+0x2d34:   	edge32	%o5, %o5, %l7
	.word	0xea00a004	! t0_kref+0x2d38:   	ld	[%g2 + 4], %l5
	.word	0xff20a020	! t0_kref+0x2d3c:   	st	%f31, [%g2 + 0x20]
	.word	0xd2066008	! t0_kref+0x2d40:   	ld	[%i1 + 8], %o1
	.word	0x93b3400d	! t0_kref+0x2d44:   	edge8	%o5, %o5, %o1
	.word	0xfb20a004	! t0_kref+0x2d48:   	st	%f29, [%g2 + 4]
	.word	0xda20a03c	! t0_kref+0x2d4c:   	st	%o5, [%g2 + 0x3c]
	.word	0xd40e2001	! t0_kref+0x2d50:   	ldub	[%i0 + 1], %o2
	.word	0xb1a689b9	! t0_kref+0x2d54:   	fdivs	%f26, %f25, %f24
	.word	0xea0e7feb	! t0_kref+0x2d58:   	ldub	[%i1 - 0x15], %l5
	.word	0xee067ff8	! t0_kref+0x2d5c:   	ld	[%i1 - 8], %l7
	.word	0xd416600a	! t0_kref+0x2d60:   	lduh	[%i1 + 0xa], %o2
	.word	0xfd00a034	! t0_kref+0x2d64:   	ld	[%g2 + 0x34], %f30
	.word	0xea4e001a	! t0_kref+0x2d68:   	ldsb	[%i0 + %i2], %l5
	.word	0x920b6421	! t0_kref+0x2d6c:   	and	%o5, 0x421, %o1
	.word	0xa7b3416d	! t0_kref+0x2d70:   	edge32ln	%o5, %o5, %l3
	.word	0xf100a010	! t0_kref+0x2d74:   	ld	[%g2 + 0x10], %f24
	.word	0x9567249b	! t0_kref+0x2d78:   	movgu	%icc, -0x365, %o2
	.word	0xa7336001	! t0_kref+0x2d7c:   	srl	%o5, 0x1, %l3
	.word	0x90a367f5	! t0_kref+0x2d80:   	subcc	%o5, 0x7f5, %o0
	.word	0xb9a788bd	! t0_kref+0x2d84:   	fsubs	%f30, %f29, %f28
	.word	0xd240a038	! t0_kref+0x2d88:   	ldsw	[%g2 + 0x38], %o1
	.word	0xec480019	! t0_kref+0x2d8c:   	ldsb	[%g0 + %i1], %l6
	.word	0xf300a00c	! t0_kref+0x2d90:   	ld	[%g2 + 0xc], %f25
	.word	0xb5b6c71a	! t0_kref+0x2d94:   	fmuld8sux16	%f27, %f26, %f26
	.word	0xec064000	! t0_kref+0x2d98:   	ld	[%i1], %l6
	.word	0xd408a016	! t0_kref+0x2d9c:   	ldub	[%g2 + 0x16], %o2
	.word	0x90a3400d	! t0_kref+0x2da0:   	subcc	%o5, %o5, %o0
	.word	0xbda0053e	! t0_kref+0x2da4:   	fsqrts	%f30, %f30
	.word	0xee067fec	! t0_kref+0x2da8:   	ld	[%i1 - 0x14], %l7
	.word	0xb5a0055c	! t0_kref+0x2dac:   	fsqrtd	%f28, %f26
	.word	0xb5a0189e	! t0_kref+0x2db0:   	fitos	%f30, %f26
	.word	0xea080018	! t0_kref+0x2db4:   	ldub	[%g0 + %i0], %l5
	.word	0xd256001b	! t0_kref+0x2db8:   	ldsh	[%i0 + %i3], %o1
	.word	0xf11f4019	! t0_kref+0x2dbc:   	ldd	[%i5 + %i1], %f24
	.word	0x9de3bfa0	! t0_kref+0x2dc0:   	save	%sp, -0x60, %sp
	.word	0xb8082bdc	! t0_kref+0x2dc4:   	and	%g0, 0xbdc, %i4
	.word	0xa7ee33a8	! t0_kref+0x2dc8:   	restore	%i0, -0xc58, %l3
	.word	0x91b3404d	! t0_kref+0x2dcc:   	edge8l	%o5, %o5, %o0
	.word	0xec4e8018	! t0_kref+0x2dd0:   	ldsb	[%i2 + %i0], %l6
	.word	0xbdb009be	! t0_kref+0x2dd4:   	fexpand	%f30, %f30
	.word	0x81834000	! t0_kref+0x2dd8:   	wr	%o5, %g0, %y
	.word	0xee062004	! t0_kref+0x2ddc:   	ld	[%i0 + 4], %l7
	.word	0xd0100019	! t0_kref+0x2de0:   	lduh	[%g0 + %i1], %o0
	.word	0x91b3412d	! t0_kref+0x2de4:   	edge32n	%o5, %o5, %o0
	.word	0xbfa018dc	! t0_kref+0x2de8:   	fdtos	%f28, %f31
	.word	0xd07e001c	! t0_kref+0x2dec:   	swap	[%i0 + %i4], %o0
	.word	0xf1be1a1d	! t0_kref+0x2df0:   	stda	%f24, [%i0 + %i5]0xd0
	.word	0xb9b00fe0	! t0_kref+0x2df4:   	fones	%f28
	.word	0xda300019	! t0_kref+0x2df8:   	sth	%o5, [%g0 + %i1]
	.word	0xb7a7c9bc	! t0_kref+0x2dfc:   	fdivs	%f31, %f28, %f27
	.word	0x9fc00004	! t0_kref+0x2e00:   	call	%g0 + %g4
	.word	0xda30a012	! t0_kref+0x2e04:   	sth	%o5, [%g2 + 0x12]
	.word	0xd4000019	! t0_kref+0x2e08:   	ld	[%g0 + %i1], %o2
	.word	0xbba649ba	! t0_kref+0x2e0c:   	fdivs	%f25, %f26, %f29
	.word	0xf91f4018	! t0_kref+0x2e10:   	ldd	[%i5 + %i0], %f28
	.word	0xb5a0053a	! t0_kref+0x2e14:   	fsqrts	%f26, %f26
	.word	0xafb3408d	! t0_kref+0x2e18:   	edge16	%o5, %o5, %l7
	.word	0xb5a78d3b	! t0_kref+0x2e1c:   	fsmuld	%f30, %f27, %f26
	.word	0xb3b74e3d	! t0_kref+0x2e20:   	fands	%f29, %f29, %f25
	.word	0x23800004	! t0_kref+0x2e24:   	fbne,a	_kref+0x2e34
	.word	0x81c9401c	! t0_kref+0x2e28:   	return	%g5 + %i4
	.word	0x81834000	! t0_kref+0x2e2c:   	wr	%o5, %g0, %y
	.word	0xf500a000	! t0_kref+0x2e30:   	ld	[%g2], %f26
	.word	0xfd064000	! t0_kref+0x2e34:   	ld	[%i1], %f30
	.word	0xfd1fbe08	! t0_kref+0x2e38:   	ldd	[%fp - 0x1f8], %f30
	.word	0x9613400d	! t0_kref+0x2e3c:   	or	%o5, %o5, %o3
	.word	0xbfa01a5a	! t0_kref+0x2e40:   	fdtoi	%f26, %f31
	.word	0x95703aeb	! t0_kref+0x2e44:   	popc	-0x515, %o2
	.word	0xc36e000d	! t0_kref+0x2e48:   	prefetch	%i0 + %o5, 1
	.word	0x292d66bb	! t0_kref+0x2e4c:   	sethi	%hi(0xb59aec00), %l4
	.word	0xea064000	! t0_kref+0x2e50:   	ld	[%i1], %l5
	.word	0xfb000019	! t0_kref+0x2e54:   	ld	[%g0 + %i1], %f29
	.word	0xda28a018	! t0_kref+0x2e58:   	stb	%o5, [%g2 + 0x18]
	.word	0xf520a02c	! t0_kref+0x2e5c:   	st	%f26, [%g2 + 0x2c]
	.word	0xb1b68f9c	! t0_kref+0x2e60:   	for	%f26, %f28, %f24
	.word	0x90f3400d	! t0_kref+0x2e64:   	udivcc	%o5, %o5, %o0
	.word	0xda28a02a	! t0_kref+0x2e68:   	stb	%o5, [%g2 + 0x2a]
	.word	0x81ae0ad8	! t0_kref+0x2e6c:   	fcmped	%fcc0, %f24, %f24
	.word	0xb9b78c58	! t0_kref+0x2e70:   	fnor	%f30, %f24, %f28
	.word	0xae0b400d	! t0_kref+0x2e74:   	and	%o5, %o5, %l7
	.word	0xbfa709b8	! t0_kref+0x2e78:   	fdivs	%f28, %f24, %f31
	.word	0xff26401c	! t0_kref+0x2e7c:   	st	%f31, [%i1 + %i4]
	.word	0xd406401c	! t0_kref+0x2e80:   	ld	[%i1 + %i4], %o2
	.word	0xd00e200e	! t0_kref+0x2e84:   	ldub	[%i0 + 0xe], %o0
	.word	0xe8560000	! t0_kref+0x2e88:   	ldsh	[%i0], %l4
	.word	0xf120a038	! t0_kref+0x2e8c:   	st	%f24, [%g2 + 0x38]
	.word	0xd6080018	! t0_kref+0x2e90:   	ldub	[%g0 + %i0], %o3
	.word	0xda367ffa	! t0_kref+0x2e94:   	sth	%o5, [%i1 - 6]
	.word	0xafb3416d	! t0_kref+0x2e98:   	edge32ln	%o5, %o5, %l7
	.word	0xa7b3410d	! t0_kref+0x2e9c:   	edge32	%o5, %o5, %l3
	.word	0x95b3416d	! t0_kref+0x2ea0:   	edge32ln	%o5, %o5, %o2
	.word	0xa7b3404d	! t0_kref+0x2ea4:   	edge8l	%o5, %o5, %l3
	.word	0xb5a649bd	! t0_kref+0x2ea8:   	fdivs	%f25, %f29, %f26
	.word	0xaaf364f7	! t0_kref+0x2eac:   	udivcc	%o5, 0x4f7, %l5
	.word	0xda36001b	! t0_kref+0x2eb0:   	sth	%o5, [%i0 + %i3]
	.word	0xb5b7cc7a	! t0_kref+0x2eb4:   	fnors	%f31, %f26, %f26
	.word	0xa60b6b34	! t0_kref+0x2eb8:   	and	%o5, 0xb34, %l3
	.word	0xbdb00f1c	! t0_kref+0x2ebc:   	fsrc2	%f28, %f30
	.word	0xb3b74ef8	! t0_kref+0x2ec0:   	fornot2s	%f29, %f24, %f25
	.word	0xbba0053d	! t0_kref+0x2ec4:   	fsqrts	%f29, %f29
	.word	0xbfa7c9bd	! t0_kref+0x2ec8:   	fdivs	%f31, %f29, %f31
	.word	0xf51f4018	! t0_kref+0x2ecc:   	ldd	[%i5 + %i0], %f26
	.word	0xb9b60e5a	! t0_kref+0x2ed0:   	fxnor	%f24, %f26, %f28
	.word	0xb9a0055e	! t0_kref+0x2ed4:   	fsqrtd	%f30, %f28
	.word	0xf1be188d	! t0_kref+0x2ed8:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xbdb7c739	! t0_kref+0x2edc:   	fmuld8ulx16	%f31, %f25, %f30
	.word	0xec070018	! t0_kref+0x2ee0:   	ld	[%i4 + %i0], %l6
	.word	0xe608a015	! t0_kref+0x2ee4:   	ldub	[%g2 + 0x15], %l3
	.word	0x9162a365	! t0_kref+0x2ee8:   	movue	%fcc0, 0x365, %o0
	.word	0x9de3bfa0	! t0_kref+0x2eec:   	save	%sp, -0x60, %sp
	.word	0xbaa727cf	! t0_kref+0x2ef0:   	subcc	%i4, 0x7cf, %i5
	.word	0x91eef541	! t0_kref+0x2ef4:   	restore	%i3, -0xabf, %o0
	.word	0xee0e601d	! t0_kref+0x2ef8:   	ldub	[%i1 + 0x1d], %l7
	.word	0xe6563ffa	! t0_kref+0x2efc:   	ldsh	[%i0 - 6], %l3
	.word	0xe60e3fec	! t0_kref+0x2f00:   	ldub	[%i0 - 0x14], %l3
	.word	0xb1a749bf	! t0_kref+0x2f04:   	fdivs	%f29, %f31, %f24
	.word	0xbba7c9bf	! t0_kref+0x2f08:   	fdivs	%f31, %f31, %f29
	.word	0xa9b3430d	! t0_kref+0x2f0c:   	alignaddr	%o5, %o5, %l4
	.word	0xb1b606be	! t0_kref+0x2f10:   	fmul8x16al	%f24, %f30, %f24
	.word	0xa723400d	! t0_kref+0x2f14:   	mulscc	%o5, %o5, %l3
	.word	0x83414000	! t0_kref+0x2f18:   	mov	%pc, %g1
	.word	0xbda649b9	! t0_kref+0x2f1c:   	fdivs	%f25, %f25, %f30
	.word	0xb9b00cdc	! t0_kref+0x2f20:   	fnot2	%f28, %f28
	.word	0x96c3400d	! t0_kref+0x2f24:   	addccc	%o5, %o5, %o3
	.word	0xfd1f4019	! t0_kref+0x2f28:   	ldd	[%i5 + %i1], %f30
	.word	0xee56c019	! t0_kref+0x2f2c:   	ldsh	[%i3 + %i1], %l7
	.word	0xb9b70c5a	! t0_kref+0x2f30:   	fnor	%f28, %f26, %f28
	.word	0xee48a004	! t0_kref+0x2f34:   	ldsb	[%g2 + 4], %l7
	.word	0xee480019	! t0_kref+0x2f38:   	ldsb	[%g0 + %i1], %l7
	.word	0xee10a006	! t0_kref+0x2f3c:   	lduh	[%g2 + 6], %l7
	.word	0xe8067ff0	! t0_kref+0x2f40:   	ld	[%i1 - 0x10], %l4
	.word	0xb5b00f1e	! t0_kref+0x2f44:   	fsrc2	%f30, %f26
	.word	0xd6164000	! t0_kref+0x2f48:   	lduh	[%i1], %o3
	.word	0xadb3404d	! t0_kref+0x2f4c:   	edge8l	%o5, %o5, %l6
	.word	0xae23400d	! t0_kref+0x2f50:   	sub	%o5, %o5, %l7
	.word	0xb1a0055a	! t0_kref+0x2f54:   	fsqrtd	%f26, %f24
	.word	0xef68a04a	! t0_kref+0x2f58:   	prefetch	%g2 + 0x4a, 23
	.word	0xf11e4000	! t0_kref+0x2f5c:   	ldd	[%i1], %f24
	.word	0x93b70418	! t0_kref+0x2f60:   	fcmple16	%f28, %f24, %o1
	.word	0xe6062000	! t0_kref+0x2f64:   	ld	[%i0], %l3
	.word	0xb5a0053e	! t0_kref+0x2f68:   	fsqrts	%f30, %f26
	.word	0xf51fbe10	! t0_kref+0x2f6c:   	ldd	[%fp - 0x1f0], %f26
	.word	0xee56401b	! t0_kref+0x2f70:   	ldsh	[%i1 + %i3], %l7
	.word	0xf91e0000	! t0_kref+0x2f74:   	ldd	[%i0], %f28
	.word	0xbdb60e80	! t0_kref+0x2f78:   	fsrc1	%f24, %f30
	.word	0xb7a689bd	! t0_kref+0x2f7c:   	fdivs	%f26, %f29, %f27
	.word	0xb3a648bf	! t0_kref+0x2f80:   	fsubs	%f25, %f31, %f25
	.word	0xf91e6010	! t0_kref+0x2f84:   	ldd	[%i1 + 0x10], %f28
	.word	0xb5b00cfc	! t0_kref+0x2f88:   	fnot2s	%f28, %f26
	.word	0xd4000018	! t0_kref+0x2f8c:   	ld	[%g0 + %i0], %o2
	.word	0xae036a69	! t0_kref+0x2f90:   	add	%o5, 0xa69, %l7
	.word	0x9123400d	! t0_kref+0x2f94:   	mulscc	%o5, %o5, %o0
	.word	0x921b400d	! t0_kref+0x2f98:   	xor	%o5, %o5, %o1
	.word	0xabb3402d	! t0_kref+0x2f9c:   	edge8n	%o5, %o5, %l5
	.word	0xd0564000	! t0_kref+0x2fa0:   	ldsh	[%i1], %o0
	.word	0xfd1e401d	! t0_kref+0x2fa4:   	ldd	[%i1 + %i5], %f30
	.word	0xb5a0055e	! t0_kref+0x2fa8:   	fsqrtd	%f30, %f26
	.word	0xb1a00558	! t0_kref+0x2fac:   	fsqrtd	%f24, %f24
	.word	0xbdb6091a	! t0_kref+0x2fb0:   	faligndata	%f24, %f26, %f30
	.word	0xbda7c9bb	! t0_kref+0x2fb4:   	fdivs	%f31, %f27, %f30
	.word	0xbfa0053b	! t0_kref+0x2fb8:   	fsqrts	%f27, %f31
	.word	0xa693400d	! t0_kref+0x2fbc:   	orcc	%o5, %o5, %l3
	.word	0xd40e2008	! t0_kref+0x2fc0:   	ldub	[%i0 + 8], %o2
	.word	0xd6063ff4	! t0_kref+0x2fc4:   	ld	[%i0 - 0xc], %o3
	.word	0xbba6c9bb	! t0_kref+0x2fc8:   	fdivs	%f27, %f27, %f29
	.word	0xfd1e2018	! t0_kref+0x2fcc:   	ldd	[%i0 + 0x18], %f30
	.word	0xbfa6483f	! t0_kref+0x2fd0:   	fadds	%f25, %f31, %f31
	.word	0xaa7b400d	! t0_kref+0x2fd4:   	sdiv	%o5, %o5, %l5
	.word	0xb5b686fc	! t0_kref+0x2fd8:   	fmul8ulx16	%f26, %f28, %f26
	.word	0x20800001	! t0_kref+0x2fdc:   	bn,a	_kref+0x2fe0
	.word	0xda266014	! t0_kref+0x2fe0:   	st	%o5, [%i1 + 0x14]
	.word	0xd44e4000	! t0_kref+0x2fe4:   	ldsb	[%i1], %o2
	.word	0xb5b6c67e	! t0_kref+0x2fe8:   	fmul8x16au	%f27, %f30, %f26
	.word	0xb9b78f9a	! t0_kref+0x2fec:   	for	%f30, %f26, %f28
	.word	0xb9b70918	! t0_kref+0x2ff0:   	faligndata	%f28, %f24, %f28
	.word	0xb9b00cd8	! t0_kref+0x2ff4:   	fnot2	%f24, %f28
	.word	0xb1b70918	! t0_kref+0x2ff8:   	faligndata	%f28, %f24, %f24
	.word	0xa783400d	! t0_kref+0x2ffc:   	wr	%o5, %o5, %gsr
	.word	0xf7066008	! t0_kref+0x3000:   	ld	[%i1 + 8], %f27
	.word	0xe606001c	! t0_kref+0x3004:   	ld	[%i0 + %i4], %l3
	.word	0xd640a02c	! t0_kref+0x3008:   	ldsw	[%g2 + 0x2c], %o3
	.word	0xe8064000	! t0_kref+0x300c:   	ld	[%i1], %l4
	.word	0xbda0055c	! t0_kref+0x3010:   	fsqrtd	%f28, %f30
	.word	0x9de3bfa0	! t0_kref+0x3014:   	save	%sp, -0x60, %sp
	.word	0xafee3a74	! t0_kref+0x3018:   	restore	%i0, -0x58c, %l7
	.word	0xe610a036	! t0_kref+0x301c:   	lduh	[%g2 + 0x36], %l3
	.word	0xbda0189f	! t0_kref+0x3020:   	fitos	%f31, %f30
	.word	0xf700a004	! t0_kref+0x3024:   	ld	[%g2 + 4], %f27
	.word	0xfd20a000	! t0_kref+0x3028:   	st	%f30, [%g2]
	.word	0xd2567ffe	! t0_kref+0x302c:   	ldsh	[%i1 - 2], %o1
	.word	0x91b3410d	! t0_kref+0x3030:   	edge32	%o5, %o5, %o0
	.word	0xae7b6842	! t0_kref+0x3034:   	sdiv	%o5, 0x842, %l7
	.word	0xec3e6008	! t0_kref+0x3038:   	std	%l6, [%i1 + 8]
	.word	0xff00a008	! t0_kref+0x303c:   	ld	[%g2 + 8], %f31
	.word	0xec0e2008	! t0_kref+0x3040:   	ldub	[%i0 + 8], %l6
	.word	0xe8067ff0	! t0_kref+0x3044:   	ld	[%i1 - 0x10], %l4
	.word	0xb3b00cff	! t0_kref+0x3048:   	fnot2s	%f31, %f25
	.word	0xda28a002	! t0_kref+0x304c:   	stb	%o5, [%g2 + 2]
	.word	0xbfa000bf	! t0_kref+0x3050:   	fnegs	%f31, %f31
	.word	0xb5a0193a	! t0_kref+0x3054:   	fstod	%f26, %f26
	.word	0xda30a034	! t0_kref+0x3058:   	sth	%o5, [%g2 + 0x34]
	.word	0xa6937d5b	! t0_kref+0x305c:   	orcc	%o5, -0x2a5, %l3
	.word	0xbba789bf	! t0_kref+0x3060:   	fdivs	%f30, %f31, %f29
	.word	0xbda709be	! t0_kref+0x3064:   	fdivs	%f28, %f30, %f30
	.word	0x93b705d8	! t0_kref+0x3068:   	fcmpeq32	%f28, %f24, %o1
	.word	0x95b340cd	! t0_kref+0x306c:   	edge16l	%o5, %o5, %o2
	.word	0xd04e001a	! t0_kref+0x3070:   	ldsb	[%i0 + %i2], %o0
	.word	0xda20a004	! t0_kref+0x3074:   	st	%o5, [%g2 + 4]
	.word	0x81af0ade	! t0_kref+0x3078:   	fcmped	%fcc0, %f28, %f30
	.word	0xf9be584d	! t0_kref+0x307c:   	stda	%f28, [%i1 + %o5]0xc2
	.word	0x25800001	! t0_kref+0x3080:   	fblg,a	_kref+0x3084
	.word	0xbda0013e	! t0_kref+0x3084:   	fabss	%f30, %f30
	.word	0xb9b00fc0	! t0_kref+0x3088:   	fone	%f28
	.word	0xbdb009bc	! t0_kref+0x308c:   	fexpand	%f28, %f30
	.word	0x91b68418	! t0_kref+0x3090:   	fcmple16	%f26, %f24, %o0
	.word	0x91b6841a	! t0_kref+0x3094:   	fcmple16	%f26, %f26, %o0
	.word	0xe64e8018	! t0_kref+0x3098:   	ldsb	[%i2 + %i0], %l3
	.word	0xe60e0000	! t0_kref+0x309c:   	ldub	[%i0], %l3
	.word	0xf1be5a1b	! t0_kref+0x30a0:   	stda	%f24, [%i1 + %i3]0xd0
	.word	0xbda0055a	! t0_kref+0x30a4:   	fsqrtd	%f26, %f30
	.word	0xafb3412d	! t0_kref+0x30a8:   	edge32n	%o5, %o5, %l7
	.word	0xd608a023	! t0_kref+0x30ac:   	ldub	[%g2 + 0x23], %o3
	.word	0xd606401c	! t0_kref+0x30b0:   	ld	[%i1 + %i4], %o3
	.word	0x87802080	! t0_kref+0x30b4:   	mov	0x80, %asi
	.word	0xb5b7c97e	! t0_kref+0x30b8:   	fpmerge	%f31, %f30, %f26
	call	SYM(t0_subr0)
	.word	0x969b7fd8	! t0_kref+0x30c0:   	xorcc	%o5, -0x28, %o3
	.word	0x8d83400d	! t0_kref+0x30c4:   	wr	%o5, %o5, %fprs
	.word	0xdaa8a03c	! t0_kref+0x30c8:   	stba	%o5, [%g2 + 0x3c]%asi
	.word	0xfba0a024	! t0_kref+0x30cc:   	sta	%f29, [%g2 + 0x24]%asi
	.word	0xb3a0053a	! t0_kref+0x30d0:   	fsqrts	%f26, %f25
	.word	0xac036d85	! t0_kref+0x30d4:   	add	%o5, 0xd85, %l6
	.word	0xd40e3ff8	! t0_kref+0x30d8:   	ldub	[%i0 - 8], %o2
	.word	0xa7b340cd	! t0_kref+0x30dc:   	edge16l	%o5, %o5, %l3
	.word	0xab44c000	! t0_kref+0x30e0:   	mov	%gsr, %l5
	.word	0xdaa8a031	! t0_kref+0x30e4:   	stba	%o5, [%g2 + 0x31]%asi
	.word	0xd24e200e	! t0_kref+0x30e8:   	ldsb	[%i0 + 0xe], %o1
	.word	0xea000019	! t0_kref+0x30ec:   	ld	[%g0 + %i1], %l5
	.word	0x901b7987	! t0_kref+0x30f0:   	xor	%o5, -0x679, %o0
	.word	0xecc8a009	! t0_kref+0x30f4:   	ldsba	[%g2 + 9]%asi, %l6
	.word	0xda762010	! t0_kref+0x30f8:   	stx	%o5, [%i0 + 0x10]
	.word	0x3c800004	! t0_kref+0x30fc:   	bpos,a	_kref+0x310c
	.word	0x94b3400d	! t0_kref+0x3100:   	orncc	%o5, %o5, %o2
	.word	0xd04e0000	! t0_kref+0x3104:   	ldsb	[%i0], %o0
	.word	0xb5b70f5a	! t0_kref+0x3108:   	fornot1	%f28, %f26, %f26
	.word	0x97b3416d	! t0_kref+0x310c:   	edge32ln	%o5, %o5, %o3
	.word	0xe608a015	! t0_kref+0x3110:   	ldub	[%g2 + 0x15], %l3
	.word	0xb5b78d9c	! t0_kref+0x3114:   	fxor	%f30, %f28, %f26
	.word	0xb5b6099a	! t0_kref+0x3118:   	bshuffle	%f24, %f26, %f26
	.word	0x91b34240	! t0_kref+0x311c:   	array16	%o5, %g0, %o0
	.word	0xb5a649bb	! t0_kref+0x3120:   	fdivs	%f25, %f27, %f26
	.word	0xd406401c	! t0_kref+0x3124:   	ld	[%i1 + %i4], %o2
	.word	0xfd00a034	! t0_kref+0x3128:   	ld	[%g2 + 0x34], %f30
	.word	0xec062010	! t0_kref+0x312c:   	ld	[%i0 + 0x10], %l6
	.word	0xd090a01a	! t0_kref+0x3130:   	lduha	[%g2 + 0x1a]%asi, %o0
	.word	0xbdb6c67a	! t0_kref+0x3134:   	fmul8x16au	%f27, %f26, %f30
	.word	0xb1b70fb9	! t0_kref+0x3138:   	fors	%f28, %f25, %f24
	.word	0xdaa8a010	! t0_kref+0x313c:   	stba	%o5, [%g2 + 0x10]%asi
	.word	0xb1a0015c	! t0_kref+0x3140:   	fabsd	%f28, %f24
	.word	0x23800005	! t0_kref+0x3144:   	fbne,a	_kref+0x3158
	.word	0xb7a609b8	! t0_kref+0x3148:   	fdivs	%f24, %f24, %f27
	.word	0xbfb007bc	! t0_kref+0x314c:   	fpackfix	%f28, %f31
	.word	0xb1a789bf	! t0_kref+0x3150:   	fdivs	%f30, %f31, %f24
	.word	0xd0066000	! t0_kref+0x3154:   	ld	[%i1], %o0
	.word	0xe84e7fe4	! t0_kref+0x3158:   	ldsb	[%i1 - 0x1c], %l4
	.word	0xec40a00c	! t0_kref+0x315c:   	ldsw	[%g2 + 0xc], %l6
	.word	0xb1b68fbd	! t0_kref+0x3160:   	fors	%f26, %f29, %f24
	.word	0x91b340cd	! t0_kref+0x3164:   	edge16l	%o5, %o5, %o0
	.word	0xb1b687d8	! t0_kref+0x3168:   	pdist	%f26, %f24, %f24
	.word	0xb7a01a5c	! t0_kref+0x316c:   	fdtoi	%f28, %f27
	.word	0xb9b00f1e	! t0_kref+0x3170:   	fsrc2	%f30, %f28
	.word	0x97408000	! t0_kref+0x3174:   	mov	%ccr, %o3
	.word	0xe03e3ff8	! t0_kref+0x3178:   	std	%l0, [%i0 - 8]
	.word	0xb9b60758	! t0_kref+0x317c:   	fpack32	%f24, %f24, %f28
	.word	0x94db400d	! t0_kref+0x3180:   	smulcc	%o5, %o5, %o2
	.word	0xa7b60418	! t0_kref+0x3184:   	fcmple16	%f24, %f24, %l3
	.word	0xf180a02c	! t0_kref+0x3188:   	lda	[%g2 + 0x2c]%asi, %f24
	.word	0xb7b7cfbd	! t0_kref+0x318c:   	fors	%f31, %f29, %f27
	.word	0xee500019	! t0_kref+0x3190:   	ldsh	[%g0 + %i1], %l7
	.word	0xfd070018	! t0_kref+0x3194:   	ld	[%i4 + %i0], %f30
	.word	0xf780a02c	! t0_kref+0x3198:   	lda	[%g2 + 0x2c]%asi, %f27
	.word	0xbda64d3d	! t0_kref+0x319c:   	fsmuld	%f25, %f29, %f30
	.word	0x92937b39	! t0_kref+0x31a0:   	orcc	%o5, -0x4c7, %o1
	.word	0xbdb78e5a	! t0_kref+0x31a4:   	fxnor	%f30, %f26, %f30
	.word	0xadb3410d	! t0_kref+0x31a8:   	edge32	%o5, %o5, %l6
	.word	0xfb80a018	! t0_kref+0x31ac:   	lda	[%g2 + 0x18]%asi, %f29
	.word	0xdaa8a00e	! t0_kref+0x31b0:   	stba	%o5, [%g2 + 0xe]%asi
	.word	0xaf336004	! t0_kref+0x31b4:   	srl	%o5, 0x4, %l7
	.word	0x8583400d	! t0_kref+0x31b8:   	wr	%o5, %o5, %ccr
	.word	0xfb20a020	! t0_kref+0x31bc:   	st	%f29, [%g2 + 0x20]
	.word	0x20800006	! t0_kref+0x31c0:   	bn,a	_kref+0x31d8
	.word	0x96f3400d	! t0_kref+0x31c4:   	udivcc	%o5, %o5, %o3
	.word	0xec4e0000	! t0_kref+0x31c8:   	ldsb	[%i0], %l6
	.word	0xbdb00fe0	! t0_kref+0x31cc:   	fones	%f30
	.word	0xf91e001d	! t0_kref+0x31d0:   	ldd	[%i0 + %i5], %f28
	.word	0xbfa0003f	! t0_kref+0x31d4:   	fmovs	%f31, %f31
	.word	0xb5a0193e	! t0_kref+0x31d8:   	fstod	%f30, %f26
	.word	0x95b605d8	! t0_kref+0x31dc:   	fcmpeq32	%f24, %f24, %o2
	.word	0xb5a789b8	! t0_kref+0x31e0:   	fdivs	%f30, %f24, %f26
	.word	0xbda0053f	! t0_kref+0x31e4:   	fsqrts	%f31, %f30
	.word	0xd00e3fff	! t0_kref+0x31e8:   	ldub	[%i0 - 1], %o0
	.word	0xbdb60ede	! t0_kref+0x31ec:   	fornot2	%f24, %f30, %f30
	.word	0xbfa689bd	! t0_kref+0x31f0:   	fdivs	%f26, %f29, %f31
	.word	0x93b3432d	! t0_kref+0x31f4:   	bmask	%o5, %o5, %o1
	.word	0xbda0055c	! t0_kref+0x31f8:   	fsqrtd	%f28, %f30
	.word	0x91b6045e	! t0_kref+0x31fc:   	fcmpne16	%f24, %f30, %o0
	.word	0xbfa00038	! t0_kref+0x3200:   	fmovs	%f24, %f31
	.word	0x878020d0	! t0_kref+0x3204:   	mov	0xd0, %asi
	.word	0x9570000d	! t0_kref+0x3208:   	popc	%o5, %o2
	.word	0x878020e0	! t0_kref+0x320c:   	mov	0xe0, %asi
	.word	0xda20a000	! t0_kref+0x3210:   	st	%o5, [%g2]
	.word	0x913b6013	! t0_kref+0x3214:   	sra	%o5, 0x13, %o0
	.word	0xec0e4000	! t0_kref+0x3218:   	ldub	[%i1], %l6
	.word	0xf9be184d	! t0_kref+0x321c:   	stda	%f28, [%i0 + %o5]0xc2
	.word	0xb1a789b9	! t0_kref+0x3220:   	fdivs	%f30, %f25, %f24
	.word	0xbda018d8	! t0_kref+0x3224:   	fdtos	%f24, %f30
	.word	0x81b01024	! t0_kref+0x3228:   	siam	0x4
	.word	0xb1b70fbe	! t0_kref+0x322c:   	fors	%f28, %f30, %f24
	.word	0xd0567ff4	! t0_kref+0x3230:   	ldsh	[%i1 - 0xc], %o0
	.word	0x81ae0a5c	! t0_kref+0x3234:   	fcmpd	%fcc0, %f24, %f28
	.word	0xec1e6000	! t0_kref+0x3238:   	ldd	[%i1], %l6
	.word	0xb9a68d3e	! t0_kref+0x323c:   	fsmuld	%f26, %f30, %f28
	.word	0xda2e7fe3	! t0_kref+0x3240:   	stb	%o5, [%i1 - 0x1d]
	.word	0x90bb400d	! t0_kref+0x3244:   	xnorcc	%o5, %o5, %o0
	.word	0x35800003	! t0_kref+0x3248:   	fbue,a	_kref+0x3254
	.word	0xd410a022	! t0_kref+0x324c:   	lduh	[%g2 + 0x22], %o2
	.word	0xaef36272	! t0_kref+0x3250:   	udivcc	%o5, 0x272, %l7
	.word	0xb1a689bd	! t0_kref+0x3254:   	fdivs	%f26, %f29, %f24
	.word	0xfba01018	! t0_kref+0x3258:   	sta	%f29, [%g0 + %i0]0x80
	.word	0x97b7845a	! t0_kref+0x325c:   	fcmpne16	%f30, %f26, %o3
	.word	0xf100a010	! t0_kref+0x3260:   	ld	[%g2 + 0x10], %f24
	.word	0x3b800006	! t0_kref+0x3264:   	fble,a	_kref+0x327c
	.word	0xe80e6008	! t0_kref+0x3268:   	ldub	[%i1 + 8], %l4
	.word	0xc568a04f	! t0_kref+0x326c:   	prefetch	%g2 + 0x4f, 2
	.word	0x91b3416d	! t0_kref+0x3270:   	edge32ln	%o5, %o5, %o0
	.word	0x81af8ada	! t0_kref+0x3274:   	fcmped	%fcc0, %f30, %f26
	.word	0xa78374b6	! t0_kref+0x3278:   	wr	%o5, 0xfffff4b6, %gsr
	.word	0x86102002	! t0_kref+0x327c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x3280:   	bne,a	_kref+0x3280
	.word	0x86a0e001	! t0_kref+0x3284:   	subcc	%g3, 1, %g3
	.word	0xd0563ff4	! t0_kref+0x3288:   	ldsh	[%i0 - 0xc], %o0
	.word	0xbdb78f5e	! t0_kref+0x328c:   	fornot1	%f30, %f30, %f30
	.word	0xbfb00f39	! t0_kref+0x3290:   	fsrc2s	%f25, %f31
	.word	0xe43e7fe8	! t0_kref+0x3294:   	std	%l2, [%i1 - 0x18]
	.word	0xb3b0077a	! t0_kref+0x3298:   	fpack16	%f26, %f25
	.word	0xb5b68c9e	! t0_kref+0x329c:   	fandnot2	%f26, %f30, %f26
	.word	0xd008a005	! t0_kref+0x32a0:   	ldub	[%g2 + 5], %o0
	.word	0xa9408000	! t0_kref+0x32a4:   	mov	%ccr, %l4
	.word	0xac0b61b7	! t0_kref+0x32a8:   	and	%o5, 0x1b7, %l6
	.word	0xabb6051c	! t0_kref+0x32ac:   	fcmpgt16	%f24, %f28, %l5
	.word	0xe3f6100d	! t0_kref+0x32b0:   	casxa	[%i0]0x80, %o5, %l1
	.word	0xd050a01c	! t0_kref+0x32b4:   	ldsh	[%g2 + 0x1c], %o0
	.word	0xd040a00c	! t0_kref+0x32b8:   	ldsw	[%g2 + 0xc], %o0
	.word	0xf1be588d	! t0_kref+0x32bc:   	stda	%f24, [%i1 + %o5]0xc4
	.word	0xb1a0055c	! t0_kref+0x32c0:   	fsqrtd	%f28, %f24
	.word	0xe64e6000	! t0_kref+0x32c4:   	ldsb	[%i1], %l3
	.word	0xe8100018	! t0_kref+0x32c8:   	lduh	[%g0 + %i0], %l4
	.word	0xec40a03c	! t0_kref+0x32cc:   	ldsw	[%g2 + 0x3c], %l6
	.word	0xda30a022	! t0_kref+0x32d0:   	sth	%o5, [%g2 + 0x22]
	.word	0xec167ffe	! t0_kref+0x32d4:   	lduh	[%i1 - 2], %l6
	.word	0xda20a03c	! t0_kref+0x32d8:   	st	%o5, [%g2 + 0x3c]
	.word	0x81ae8a58	! t0_kref+0x32dc:   	fcmpd	%fcc0, %f26, %f24
	.word	0xd450a008	! t0_kref+0x32e0:   	ldsh	[%g2 + 8], %o2
	.word	0xb1b70679	! t0_kref+0x32e4:   	fmul8x16au	%f28, %f25, %f24
	.word	0xda28a014	! t0_kref+0x32e8:   	stb	%o5, [%g2 + 0x14]
	.word	0xe606601c	! t0_kref+0x32ec:   	ld	[%i1 + 0x1c], %l3
	.word	0xd048a02d	! t0_kref+0x32f0:   	ldsb	[%g2 + 0x2d], %o0
	.word	0xb9a688d8	! t0_kref+0x32f4:   	fsubd	%f26, %f24, %f28
	.word	0xa82b400d	! t0_kref+0x32f8:   	andn	%o5, %o5, %l4
	.word	0xb3a709b9	! t0_kref+0x32fc:   	fdivs	%f28, %f25, %f25
	.word	0xb5b7891a	! t0_kref+0x3300:   	faligndata	%f30, %f26, %f26
	.word	0xb5b00f1c	! t0_kref+0x3304:   	fsrc2	%f28, %f26
	.word	0x91408000	! t0_kref+0x3308:   	mov	%ccr, %o0
	.word	0xb9a0191e	! t0_kref+0x330c:   	fitod	%f30, %f28
	.word	0xb1b78e80	! t0_kref+0x3310:   	fsrc1	%f30, %f24
	.word	0xee56600c	! t0_kref+0x3314:   	ldsh	[%i1 + 0xc], %l7
	.word	0x9613400d	! t0_kref+0x3318:   	or	%o5, %o5, %o3
	.word	0xfd00a008	! t0_kref+0x331c:   	ld	[%g2 + 8], %f30
	.word	0xa8f3400d	! t0_kref+0x3320:   	udivcc	%o5, %o5, %l4
	.word	0xda30a026	! t0_kref+0x3324:   	sth	%o5, [%g2 + 0x26]
	.word	0xda28a02e	! t0_kref+0x3328:   	stb	%o5, [%g2 + 0x2e]
	.word	0x81af0a3c	! t0_kref+0x332c:   	fcmps	%fcc0, %f28, %f28
	.word	0x90a3400d	! t0_kref+0x3330:   	subcc	%o5, %o5, %o0
	.word	0x93400000	! t0_kref+0x3334:   	mov	%y, %o1
	call	1f
	.empty
	.word	0xe64e3fe5	! t0_kref+0x333c:   	ldsb	[%i0 - 0x1b], %l3
1:	.word	0xb5a0189c	! t0_kref+0x3340:   	fitos	%f28, %f26
	.word	0xb5b60d9c	! t0_kref+0x3344:   	fxor	%f24, %f28, %f26
	.word	0xafb78518	! t0_kref+0x3348:   	fcmpgt16	%f30, %f24, %l7
	.word	0xb5a709b9	! t0_kref+0x334c:   	fdivs	%f28, %f25, %f26
	.word	0xe600a028	! t0_kref+0x3350:   	ld	[%g2 + 0x28], %l3
	.word	0xd04e0000	! t0_kref+0x3354:   	ldsb	[%i0], %o0
	.word	0xadb6859e	! t0_kref+0x3358:   	fcmpgt32	%f26, %f30, %l6
	.word	0xff20a028	! t0_kref+0x335c:   	st	%f31, [%g2 + 0x28]
	.word	0xe600a03c	! t0_kref+0x3360:   	ld	[%g2 + 0x3c], %l3
	.word	0xfd00a014	! t0_kref+0x3364:   	ld	[%g2 + 0x14], %f30
	.word	0xd008a015	! t0_kref+0x3368:   	ldub	[%g2 + 0x15], %o0
	.word	0xc16e7fe0	! t0_kref+0x336c:   	prefetch	%i1 - 0x20, 0
	.word	0xd050a026	! t0_kref+0x3370:   	ldsh	[%g2 + 0x26], %o0
	.word	0xda28a031	! t0_kref+0x3374:   	stb	%o5, [%g2 + 0x31]
	.word	0xee4e201c	! t0_kref+0x3378:   	ldsb	[%i0 + 0x1c], %l7
	.word	0xa813400d	! t0_kref+0x337c:   	or	%o5, %o5, %l4
	.word	0xd048a01e	! t0_kref+0x3380:   	ldsb	[%g2 + 0x1e], %o0
	.word	0xda28a023	! t0_kref+0x3384:   	stb	%o5, [%g2 + 0x23]
	.word	0xff20a024	! t0_kref+0x3388:   	st	%f31, [%g2 + 0x24]
	.word	0xee16c018	! t0_kref+0x338c:   	lduh	[%i3 + %i0], %l7
	.word	0xda28a033	! t0_kref+0x3390:   	stb	%o5, [%g2 + 0x33]
	.word	0xd010a018	! t0_kref+0x3394:   	lduh	[%g2 + 0x18], %o0
	.word	0xacb3400d	! t0_kref+0x3398:   	orncc	%o5, %o5, %l6
	.word	0x81ae0ad8	! t0_kref+0x339c:   	fcmped	%fcc0, %f24, %f24
	.word	0xb9b74fb9	! t0_kref+0x33a0:   	fors	%f29, %f25, %f28
	.word	0xe76e2008	! t0_kref+0x33a4:   	prefetch	%i0 + 8, 19
	.word	0xf9060000	! t0_kref+0x33a8:   	ld	[%i0], %f28
	.word	0xb7a749bb	! t0_kref+0x33ac:   	fdivs	%f29, %f27, %f27
	.word	0xec063ff8	! t0_kref+0x33b0:   	ld	[%i0 - 8], %l6
	.word	0xfb063fe0	! t0_kref+0x33b4:   	ld	[%i0 - 0x20], %f29
	.word	0xee167ff2	! t0_kref+0x33b8:   	lduh	[%i1 - 0xe], %l7
	.word	0xb1a018da	! t0_kref+0x33bc:   	fdtos	%f26, %f24
	.word	0x90b3400d	! t0_kref+0x33c0:   	orncc	%o5, %o5, %o0
	.word	0xea4e401a	! t0_kref+0x33c4:   	ldsb	[%i1 + %i2], %l5
	.word	0xe6080018	! t0_kref+0x33c8:   	ldub	[%g0 + %i0], %l3
	.word	0xf91e401d	! t0_kref+0x33cc:   	ldd	[%i1 + %i5], %f28
	.word	0xb9b6497a	! t0_kref+0x33d0:   	fpmerge	%f25, %f26, %f28
	.word	0xb7b60dba	! t0_kref+0x33d4:   	fxors	%f24, %f26, %f27
	.word	0x91b34280	! t0_kref+0x33d8:   	array32	%o5, %g0, %o0
	.word	0xbda7c9bc	! t0_kref+0x33dc:   	fdivs	%f31, %f28, %f30
	.word	0xabb6045a	! t0_kref+0x33e0:   	fcmpne16	%f24, %f26, %l5
	.word	0x97b3404d	! t0_kref+0x33e4:   	edge8l	%o5, %o5, %o3
	.word	0xb1a789bb	! t0_kref+0x33e8:   	fdivs	%f30, %f27, %f24
	.word	0xf1070018	! t0_kref+0x33ec:   	ld	[%i4 + %i0], %f24
	.word	0xfd1e6008	! t0_kref+0x33f0:   	ldd	[%i1 + 8], %f30
	.word	0xd250a008	! t0_kref+0x33f4:   	ldsh	[%g2 + 8], %o1
	.word	0xad418000	! t0_kref+0x33f8:   	mov	%fprs, %l6
	.word	0xda362008	! t0_kref+0x33fc:   	sth	%o5, [%i0 + 8]
	.word	0xfb064000	! t0_kref+0x3400:   	ld	[%i1], %f29
	.word	0xec08a00a	! t0_kref+0x3404:   	ldub	[%g2 + 0xa], %l6
	.word	0xda28a007	! t0_kref+0x3408:   	stb	%o5, [%g2 + 7]
	.word	0xf500a004	! t0_kref+0x340c:   	ld	[%g2 + 4], %f26
	.word	0xb9a01938	! t0_kref+0x3410:   	fstod	%f24, %f28
	.word	0x93b3410d	! t0_kref+0x3414:   	edge32	%o5, %o5, %o1
	.word	0xbda0055e	! t0_kref+0x3418:   	fsqrtd	%f30, %f30
	.word	0xee4e6007	! t0_kref+0x341c:   	ldsb	[%i1 + 7], %l7
	.word	0xee080019	! t0_kref+0x3420:   	ldub	[%g0 + %i1], %l7
	.word	0x2d800006	! t0_kref+0x3424:   	fbg,a	_kref+0x343c
	.word	0x001fffff	! t0_kref+0x3428:   	illtrap	0x1fffff
	.word	0xbda0053b	! t0_kref+0x342c:   	fsqrts	%f27, %f30
	.word	0xea563ff4	! t0_kref+0x3430:   	ldsh	[%i0 - 0xc], %l5
	.word	0xb1a0055c	! t0_kref+0x3434:   	fsqrtd	%f28, %f24
	.word	0xab70000d	! t0_kref+0x3438:   	popc	%o5, %l5
	.word	0xfb00a024	! t0_kref+0x343c:   	ld	[%g2 + 0x24], %f29
	.word	0xb9a7c9bc	! t0_kref+0x3440:   	fdivs	%f31, %f28, %f28
	.word	0x96db6f4a	! t0_kref+0x3444:   	smulcc	%o5, 0xf4a, %o3
	.word	0xd4567ff2	! t0_kref+0x3448:   	ldsh	[%i1 - 0xe], %o2
	.word	0xb1a01a5a	! t0_kref+0x344c:   	fdtoi	%f26, %f24
	.word	0x38800004	! t0_kref+0x3450:   	bgu,a	_kref+0x3460
	.word	0xda20a028	! t0_kref+0x3454:   	st	%o5, [%g2 + 0x28]
	.word	0xabb3414d	! t0_kref+0x3458:   	edge32l	%o5, %o5, %l5
	.word	0xf100a034	! t0_kref+0x345c:   	ld	[%g2 + 0x34], %f24
	.word	0xbba689bb	! t0_kref+0x3460:   	fdivs	%f26, %f27, %f29
	.word	0x81ae0a5c	! t0_kref+0x3464:   	fcmpd	%fcc0, %f24, %f28
	.word	0xa7b3412d	! t0_kref+0x3468:   	edge32n	%o5, %o5, %l3
	.word	0xda200019	! t0_kref+0x346c:   	st	%o5, [%g0 + %i1]
	.word	0xbda0193b	! t0_kref+0x3470:   	fstod	%f27, %f30
	.word	0xec0e7fe5	! t0_kref+0x3474:   	ldub	[%i1 - 0x1b], %l6
	.word	0xda20a01c	! t0_kref+0x3478:   	st	%o5, [%g2 + 0x1c]
	.word	0xa7b34280	! t0_kref+0x347c:   	array32	%o5, %g0, %l3
	.word	0xfd067fe4	! t0_kref+0x3480:   	ld	[%i1 - 0x1c], %f30
	.word	0xda28a034	! t0_kref+0x3484:   	stb	%o5, [%g2 + 0x34]
	.word	0xda20a010	! t0_kref+0x3488:   	st	%o5, [%g2 + 0x10]
	.word	0xec08a02e	! t0_kref+0x348c:   	ldub	[%g2 + 0x2e], %l6
	.word	0xe808a022	! t0_kref+0x3490:   	ldub	[%g2 + 0x22], %l4
	.word	0xfb20a010	! t0_kref+0x3494:   	st	%f29, [%g2 + 0x10]
	.word	0xf120a028	! t0_kref+0x3498:   	st	%f24, [%g2 + 0x28]
	.word	0xe848a02c	! t0_kref+0x349c:   	ldsb	[%g2 + 0x2c], %l4
	.word	0xa62b640d	! t0_kref+0x34a0:   	andn	%o5, 0x40d, %l3
	.word	0xd250a022	! t0_kref+0x34a4:   	ldsh	[%g2 + 0x22], %o1
	.word	0xf91e3ff8	! t0_kref+0x34a8:   	ldd	[%i0 - 8], %f28
	.word	0x91b34240	! t0_kref+0x34ac:   	array16	%o5, %g0, %o0
	.word	0xbdb60a5c	! t0_kref+0x34b0:   	fpadd32	%f24, %f28, %f30
	.word	0xa7336016	! t0_kref+0x34b4:   	srl	%o5, 0x16, %l3
	.word	0xf51e3ff8	! t0_kref+0x34b8:   	ldd	[%i0 - 8], %f26
	.word	0xbdb646bb	! t0_kref+0x34bc:   	fmul8x16al	%f25, %f27, %f30
	.word	0xd456001b	! t0_kref+0x34c0:   	ldsh	[%i0 + %i3], %o2
	.word	0xb5a0193c	! t0_kref+0x34c4:   	fstod	%f28, %f26
	.word	0xf920a020	! t0_kref+0x34c8:   	st	%f28, [%g2 + 0x20]
	.word	0xf19e9a19	! t0_kref+0x34cc:   	ldda	[%i2 + %i1]0xd0, %f24
	.word	0xf120a004	! t0_kref+0x34d0:   	st	%f24, [%g2 + 4]
	.word	0xee10a018	! t0_kref+0x34d4:   	lduh	[%g2 + 0x18], %l7
	.word	0xd01f4019	! t0_kref+0x34d8:   	ldd	[%i5 + %i1], %o0
	.word	0x91b340cd	! t0_kref+0x34dc:   	edge16l	%o5, %o5, %o0
	.word	0x81834000	! t0_kref+0x34e0:   	wr	%o5, %g0, %y
	.word	0xe80e3fef	! t0_kref+0x34e4:   	ldub	[%i0 - 0x11], %l4
	.word	0xd44e401a	! t0_kref+0x34e8:   	ldsb	[%i1 + %i2], %o2
	.word	0xaae3400d	! t0_kref+0x34ec:   	subccc	%o5, %o5, %l5
	.word	0xd050a004	! t0_kref+0x34f0:   	ldsh	[%g2 + 4], %o0
	.word	0x90c3400d	! t0_kref+0x34f4:   	addccc	%o5, %o5, %o0
	.word	0xbbb70a7c	! t0_kref+0x34f8:   	fpadd32s	%f28, %f28, %f29
	.word	0xbda0055c	! t0_kref+0x34fc:   	fsqrtd	%f28, %f30
	.word	0xd24e8019	! t0_kref+0x3500:   	ldsb	[%i2 + %i1], %o1
	.word	0xe810a018	! t0_kref+0x3504:   	lduh	[%g2 + 0x18], %l4
	.word	0xa6bb7007	! t0_kref+0x3508:   	xnorcc	%o5, -0xff9, %l3
	.word	0xb5b68ea0	! t0_kref+0x350c:   	fsrc1s	%f26, %f26
	.word	0xb1b6899a	! t0_kref+0x3510:   	bshuffle	%f26, %f26, %f24
	.word	0xea062010	! t0_kref+0x3514:   	ld	[%i0 + 0x10], %l5
	.word	0xa8bb400d	! t0_kref+0x3518:   	xnorcc	%o5, %o5, %l4
	.word	0xad23400d	! t0_kref+0x351c:   	mulscc	%o5, %o5, %l6
	.word	0xda2e7feb	! t0_kref+0x3520:   	stb	%o5, [%i1 - 0x15]
	.word	0xe8062008	! t0_kref+0x3524:   	ld	[%i0 + 8], %l4
	.word	0xbfa789bf	! t0_kref+0x3528:   	fdivs	%f30, %f31, %f31
	.word	0x37800005	! t0_kref+0x352c:   	fbge,a	_kref+0x3540
	.word	0xabb7841e	! t0_kref+0x3530:   	fcmple16	%f30, %f30, %l5
	.word	0xf726600c	! t0_kref+0x3534:   	st	%f27, [%i1 + 0xc]
	.word	0xd2064000	! t0_kref+0x3538:   	ld	[%i1], %o1
	.word	0xbda01918	! t0_kref+0x353c:   	fitod	%f24, %f30
	.word	0xe8063fe8	! t0_kref+0x3540:   	ld	[%i0 - 0x18], %l4
	.word	0xbfa01a5a	! t0_kref+0x3544:   	fdtoi	%f26, %f31
	.word	0xfb00a020	! t0_kref+0x3548:   	ld	[%g2 + 0x20], %f29
	.word	0xabb3412d	! t0_kref+0x354c:   	edge32n	%o5, %o5, %l5
	.word	0xda20a038	! t0_kref+0x3550:   	st	%o5, [%g2 + 0x38]
	.word	0x81ae8a58	! t0_kref+0x3554:   	fcmpd	%fcc0, %f26, %f24
	.word	0xb3a609bd	! t0_kref+0x3558:   	fdivs	%f24, %f29, %f25
	.word	0xee000018	! t0_kref+0x355c:   	ld	[%g0 + %i0], %l7
	.word	0xd4164000	! t0_kref+0x3560:   	lduh	[%i1], %o2
	.word	0xbdb686bd	! t0_kref+0x3564:   	fmul8x16al	%f26, %f29, %f30
	.word	0xe608a018	! t0_kref+0x3568:   	ldub	[%g2 + 0x18], %l3
	.word	0xb1a608d8	! t0_kref+0x356c:   	fsubd	%f24, %f24, %f24
	.word	0xf920a03c	! t0_kref+0x3570:   	st	%f28, [%g2 + 0x3c]
	.word	0xea4e7fec	! t0_kref+0x3574:   	ldsb	[%i1 - 0x14], %l5
	.word	0xd4080018	! t0_kref+0x3578:   	ldub	[%g0 + %i0], %o2
	.word	0xea08a015	! t0_kref+0x357c:   	ldub	[%g2 + 0x15], %l5
	.word	0xb5a0015a	! t0_kref+0x3580:   	fabsd	%f26, %f26
	.word	0xb5b7067b	! t0_kref+0x3584:   	fmul8x16au	%f28, %f27, %f26
	.word	0xff00a024	! t0_kref+0x3588:   	ld	[%g2 + 0x24], %f31
	.word	0xaa2b400d	! t0_kref+0x358c:   	andn	%o5, %o5, %l5
	.word	0xda28a022	! t0_kref+0x3590:   	stb	%o5, [%g2 + 0x22]
	.word	0xd4060000	! t0_kref+0x3594:   	ld	[%i0], %o2
	.word	0xea500018	! t0_kref+0x3598:   	ldsh	[%g0 + %i0], %l5
	.word	0xe656c018	! t0_kref+0x359c:   	ldsh	[%i3 + %i0], %l3
	.word	0xb5a788de	! t0_kref+0x35a0:   	fsubd	%f30, %f30, %f26
	.word	0x133919bf	! t0_kref+0x35a4:   	sethi	%hi(0xe466fc00), %o1
	.word	0x81af0a5a	! t0_kref+0x35a8:   	fcmpd	%fcc0, %f28, %f26
	.word	0xd6164000	! t0_kref+0x35ac:   	lduh	[%i1], %o3
	.word	0xd2080018	! t0_kref+0x35b0:   	ldub	[%g0 + %i0], %o1
	.word	0xf91e3ff0	! t0_kref+0x35b4:   	ldd	[%i0 - 0x10], %f28
	.word	0xd4d01018	! t0_kref+0x35b8:   	ldsha	[%g0 + %i0]0x80, %o2
	.word	0xb1a0193b	! t0_kref+0x35bc:   	fstod	%f27, %f24
	.word	0xb1b7c6bc	! t0_kref+0x35c0:   	fmul8x16al	%f31, %f28, %f24
	.word	0xb1b00cd8	! t0_kref+0x35c4:   	fnot2	%f24, %f24
	.word	0xd640a014	! t0_kref+0x35c8:   	ldsw	[%g2 + 0x14], %o3
	.word	0xec16001b	! t0_kref+0x35cc:   	lduh	[%i0 + %i3], %l6
	.word	0xb9b7891c	! t0_kref+0x35d0:   	faligndata	%f30, %f28, %f28
	.word	0xd4063fec	! t0_kref+0x35d4:   	ld	[%i0 - 0x14], %o2
	.word	0xa7b3416d	! t0_kref+0x35d8:   	edge32ln	%o5, %o5, %l3
	.word	0xb3b7ccba	! t0_kref+0x35dc:   	fandnot2s	%f31, %f26, %f25
	.word	0xb1b00fc0	! t0_kref+0x35e0:   	fone	%f24
	.word	0xe6000018	! t0_kref+0x35e4:   	ld	[%g0 + %i0], %l3
	.word	0x900b400d	! t0_kref+0x35e8:   	and	%o5, %o5, %o0
	.word	0xec40a02c	! t0_kref+0x35ec:   	ldsw	[%g2 + 0x2c], %l6
	.word	0xf11e401d	! t0_kref+0x35f0:   	ldd	[%i1 + %i5], %f24
	.word	0xbda649bb	! t0_kref+0x35f4:   	fdivs	%f25, %f27, %f30
	.word	0xbdb7067d	! t0_kref+0x35f8:   	fmul8x16au	%f28, %f29, %f30
	.word	0xa8f3400d	! t0_kref+0x35fc:   	udivcc	%o5, %o5, %l4
	.word	0xbfb6cdfd	! t0_kref+0x3600:   	fnands	%f27, %f29, %f31
	.word	0xda367ff0	! t0_kref+0x3604:   	sth	%o5, [%i1 - 0x10]
	.word	0xda28a01a	! t0_kref+0x3608:   	stb	%o5, [%g2 + 0x1a]
	.word	0xc368a089	! t0_kref+0x360c:   	prefetch	%g2 + 0x89, 1
	.word	0xe8be501d	! t0_kref+0x3610:   	stda	%l4, [%i1 + %i5]0x80
	.word	0xb5a0053a	! t0_kref+0x3614:   	fsqrts	%f26, %f26
	.word	0xda270018	! t0_kref+0x3618:   	st	%o5, [%i4 + %i0]
	.word	0xe806200c	! t0_kref+0x361c:   	ld	[%i0 + 0xc], %l4
	.word	0x97b3408d	! t0_kref+0x3620:   	edge16	%o5, %o5, %o3
	.word	0x81da000d	! t0_kref+0x3624:   	flush	%o0 + %o5
	.word	0x97b3432d	! t0_kref+0x3628:   	bmask	%o5, %o5, %o3
	.word	0xafb705da	! t0_kref+0x362c:   	fcmpeq32	%f28, %f26, %l7
	.word	0xb5b00fe0	! t0_kref+0x3630:   	fones	%f26
	.word	0xc807bfec	! t0_kref+0x3634:   	ld	[%fp - 0x14], %g4
	.word	0xf320a02c	! t0_kref+0x3638:   	st	%f25, [%g2 + 0x2c]
	.word	0xd2067fe4	! t0_kref+0x363c:   	ld	[%i1 - 0x1c], %o1
	.word	0xbfa01a3d	! t0_kref+0x3640:   	fstoi	%f29, %f31
	.word	0xae23400d	! t0_kref+0x3644:   	sub	%o5, %o5, %l7
	.word	0xe81f4018	! t0_kref+0x3648:   	ldd	[%i5 + %i0], %l4
	.word	0xf1be184d	! t0_kref+0x364c:   	stda	%f24, [%i0 + %o5]0xc2
	.word	0xae5b400d	! t0_kref+0x3650:   	smul	%o5, %o5, %l7
	.word	0xb5b60c58	! t0_kref+0x3654:   	fnor	%f24, %f24, %f26
	.word	0xb1b68a7f	! t0_kref+0x3658:   	fpadd32s	%f26, %f31, %f24
	.word	0xe01e7ff8	! t0_kref+0x365c:   	ldd	[%i1 - 8], %l0
	.word	0xe6066014	! t0_kref+0x3660:   	ld	[%i1 + 0x14], %l3
	.word	0xf51e001d	! t0_kref+0x3664:   	ldd	[%i0 + %i5], %f26
	.word	0xd2067fe8	! t0_kref+0x3668:   	ld	[%i1 - 0x18], %o1
	.word	0xda30a012	! t0_kref+0x366c:   	sth	%o5, [%g2 + 0x12]
	.word	0xb9a0055c	! t0_kref+0x3670:   	fsqrtd	%f28, %f28
	.word	0xd240a01c	! t0_kref+0x3674:   	ldsw	[%g2 + 0x1c], %o1
	.word	0xb5a00039	! t0_kref+0x3678:   	fmovs	%f25, %f26
	.word	0xbda0055c	! t0_kref+0x367c:   	fsqrtd	%f28, %f30
	.word	0xbdb70db8	! t0_kref+0x3680:   	fxors	%f28, %f24, %f30
	.word	0xf1180019	! t0_kref+0x3684:   	ldd	[%g0 + %i1], %f24
	.word	0x93400000	! t0_kref+0x3688:   	mov	%y, %o1
	.word	0xf99f1a18	! t0_kref+0x368c:   	ldda	[%i4 + %i0]0xd0, %f28
	.word	0xea06401c	! t0_kref+0x3690:   	ld	[%i1 + %i4], %l5
	.word	0xb1a68d3f	! t0_kref+0x3694:   	fsmuld	%f26, %f31, %f24
	.word	0x95408000	! t0_kref+0x3698:   	mov	%ccr, %o2
	.word	0xd6500018	! t0_kref+0x369c:   	ldsh	[%g0 + %i0], %o3
	.word	0xd44e001a	! t0_kref+0x36a0:   	ldsb	[%i0 + %i2], %o2
	.word	0xbfa01899	! t0_kref+0x36a4:   	fitos	%f25, %f31
	.word	0xda30a014	! t0_kref+0x36a8:   	sth	%o5, [%g2 + 0x14]
	.word	0x95b3434d	! t0_kref+0x36ac:   	alignaddrl	%o5, %o5, %o2
	.word	0xfb00a000	! t0_kref+0x36b0:   	ld	[%g2], %f29
	.word	0xda20a008	! t0_kref+0x36b4:   	st	%o5, [%g2 + 8]
	.word	0xd64e3ff8	! t0_kref+0x36b8:   	ldsb	[%i0 - 8], %o3
	.word	0xaa5b6885	! t0_kref+0x36bc:   	smul	%o5, 0x885, %l5
	.word	0xd2080018	! t0_kref+0x36c0:   	ldub	[%g0 + %i0], %o1
	.word	0xbfa7083d	! t0_kref+0x36c4:   	fadds	%f28, %f29, %f31
	.word	0xbbb70cb9	! t0_kref+0x36c8:   	fandnot2s	%f28, %f25, %f29
	.word	0xfd00a004	! t0_kref+0x36cc:   	ld	[%g2 + 4], %f30
	.word	0x9744c000	! t0_kref+0x36d0:   	mov	%gsr, %o3
	.word	0xd610a010	! t0_kref+0x36d4:   	lduh	[%g2 + 0x10], %o3
	.word	0xa9b340cd	! t0_kref+0x36d8:   	edge16l	%o5, %o5, %l4
	.word	0xd0ce9018	! t0_kref+0x36dc:   	ldsba	[%i2 + %i0]0x80, %o0
	.word	0xee06601c	! t0_kref+0x36e0:   	ld	[%i1 + 0x1c], %l7
	.word	0xec0e401a	! t0_kref+0x36e4:   	ldub	[%i1 + %i2], %l6
	.word	0x290d2f66	! t0_kref+0x36e8:   	sethi	%hi(0x34bd9800), %l4
	.word	0xb3a709b8	! t0_kref+0x36ec:   	fdivs	%f28, %f24, %f25
	.word	0xf9000018	! t0_kref+0x36f0:   	ld	[%g0 + %i0], %f28
	.word	0xbdb6899a	! t0_kref+0x36f4:   	bshuffle	%f26, %f26, %f30
	.word	0xb3b60a7f	! t0_kref+0x36f8:   	fpadd32s	%f24, %f31, %f25
	.word	0xe8080019	! t0_kref+0x36fc:   	ldub	[%g0 + %i1], %l4
	.word	0xd00e8019	! t0_kref+0x3700:   	ldub	[%i2 + %i1], %o0
	.word	0xbba00538	! t0_kref+0x3704:   	fsqrts	%f24, %f29
	.word	0xab44c000	! t0_kref+0x3708:   	mov	%gsr, %l5
	.word	0xd0062010	! t0_kref+0x370c:   	ld	[%i0 + 0x10], %o0
	.word	0xec160000	! t0_kref+0x3710:   	lduh	[%i0], %l6
	.word	0xb1b6091e	! t0_kref+0x3714:   	faligndata	%f24, %f30, %f24
	.word	0xb9b009bd	! t0_kref+0x3718:   	fexpand	%f29, %f28
	.word	0xa7837642	! t0_kref+0x371c:   	wr	%o5, 0xfffff642, %gsr
	.word	0xb5a0055a	! t0_kref+0x3720:   	fsqrtd	%f26, %f26
	.word	0xda30a038	! t0_kref+0x3724:   	sth	%o5, [%g2 + 0x38]
	.word	0xd00e7fef	! t0_kref+0x3728:   	ldub	[%i1 - 0x11], %o0
	.word	0xae7b400d	! t0_kref+0x372c:   	sdiv	%o5, %o5, %l7
	.word	0x93b3412d	! t0_kref+0x3730:   	edge32n	%o5, %o5, %o1
	.word	0xf900a000	! t0_kref+0x3734:   	ld	[%g2], %f28
	.word	0xbfa6c9b9	! t0_kref+0x3738:   	fdivs	%f27, %f25, %f31
	.word	0xa8f3691e	! t0_kref+0x373c:   	udivcc	%o5, 0x91e, %l4
	.word	0xb5b60ad8	! t0_kref+0x3740:   	fpsub32	%f24, %f24, %f26
	.word	0x81dc0005	! t0_kref+0x3744:   	flush	%l0 + %g5
	.word	0xff20a01c	! t0_kref+0x3748:   	st	%f31, [%g2 + 0x1c]
	.word	0xec48a031	! t0_kref+0x374c:   	ldsb	[%g2 + 0x31], %l6
	.word	0xaebb7442	! t0_kref+0x3750:   	xnorcc	%o5, -0xbbe, %l7
	.word	0xd250a032	! t0_kref+0x3754:   	ldsh	[%g2 + 0x32], %o1
	.word	0x90f36734	! t0_kref+0x3758:   	udivcc	%o5, 0x734, %o0
	.word	0xecee101a	! t0_kref+0x375c:   	ldstuba	[%i0 + %i2]0x80, %l6
	.word	0x97b3410d	! t0_kref+0x3760:   	edge32	%o5, %o5, %o3
	.word	0xb5b78f58	! t0_kref+0x3764:   	fornot1	%f30, %f24, %f26
	.word	0xe8063ff8	! t0_kref+0x3768:   	ld	[%i0 - 8], %l4
	.word	0xe64e6018	! t0_kref+0x376c:   	ldsb	[%i1 + 0x18], %l3
	.word	0xee0e4000	! t0_kref+0x3770:   	ldub	[%i1], %l7
	.word	0xbda01a3e	! t0_kref+0x3774:   	fstoi	%f30, %f30
	.word	0xf700a00c	! t0_kref+0x3778:   	ld	[%g2 + 0xc], %f27
	.word	0xb1b78ad8	! t0_kref+0x377c:   	fpsub32	%f30, %f24, %f24
	.word	0x29800006	! t0_kref+0x3780:   	fbl,a	_kref+0x3798
	.word	0xb3a7083c	! t0_kref+0x3784:   	fadds	%f28, %f28, %f25
	.word	0xf1200018	! t0_kref+0x3788:   	st	%f24, [%g0 + %i0]
	.word	0xda28a031	! t0_kref+0x378c:   	stb	%o5, [%g2 + 0x31]
	.word	0xd610a034	! t0_kref+0x3790:   	lduh	[%g2 + 0x34], %o3
	.word	0xe6062000	! t0_kref+0x3794:   	ld	[%i0], %l3
	.word	0xd2567fea	! t0_kref+0x3798:   	ldsh	[%i1 - 0x16], %o1
	.word	0xadb3408d	! t0_kref+0x379c:   	edge16	%o5, %o5, %l6
	.word	0xee40a010	! t0_kref+0x37a0:   	ldsw	[%g2 + 0x10], %l7
	.word	0x85837c9d	! t0_kref+0x37a4:   	wr	%o5, 0xfffffc9d, %ccr
	.word	0xab418000	! t0_kref+0x37a8:   	mov	%fprs, %l5
	.word	0xb3a709bf	! t0_kref+0x37ac:   	fdivs	%f28, %f31, %f25
	.word	0xb5a708da	! t0_kref+0x37b0:   	fsubd	%f28, %f26, %f26
	.word	0xd410a028	! t0_kref+0x37b4:   	lduh	[%g2 + 0x28], %o2
	.word	0xbba018da	! t0_kref+0x37b8:   	fdtos	%f26, %f29
	.word	0xb1b64a78	! t0_kref+0x37bc:   	fpadd32s	%f25, %f24, %f24
	.word	0xbda78d38	! t0_kref+0x37c0:   	fsmuld	%f30, %f24, %f30
	.word	0xba102008	! t0_kref+0x37c4:   	mov	0x8, %i5
	.word	0xda20a028	! t0_kref+0x37c8:   	st	%o5, [%g2 + 0x28]
	.word	0xea0e7fe0	! t0_kref+0x37cc:   	ldub	[%i1 - 0x20], %l5
	.word	0xfd1e001d	! t0_kref+0x37d0:   	ldd	[%i0 + %i5], %f30
	.word	0xda28a000	! t0_kref+0x37d4:   	stb	%o5, [%g2]
	.word	0xe6067fe8	! t0_kref+0x37d8:   	ld	[%i1 - 0x18], %l3
	.word	0xbba00538	! t0_kref+0x37dc:   	fsqrts	%f24, %f29
	.word	0x91b78458	! t0_kref+0x37e0:   	fcmpne16	%f30, %f24, %o0
	.word	0xdaf6101d	! t0_kref+0x37e4:   	stxa	%o5, [%i0 + %i5]0x80
	.word	0xf706601c	! t0_kref+0x37e8:   	ld	[%i1 + 0x1c], %f27
	.word	0xbfa0053d	! t0_kref+0x37ec:   	fsqrts	%f29, %f31
	.word	0xd60e4000	! t0_kref+0x37f0:   	ldub	[%i1], %o3
	.word	0xd0067fe4	! t0_kref+0x37f4:   	ld	[%i1 - 0x1c], %o0
	.word	0xda30a02e	! t0_kref+0x37f8:   	sth	%o5, [%g2 + 0x2e]
	.word	0xc12e6004	! t0_kref+0x37fc:   	st	%fsr, [%i1 + 4]
	.word	0xee50a00a	! t0_kref+0x3800:   	ldsh	[%g2 + 0xa], %l7
	.word	0xd2067ff4	! t0_kref+0x3804:   	ld	[%i1 - 0xc], %o1
	.word	0xee50a00e	! t0_kref+0x3808:   	ldsh	[%g2 + 0xe], %l7
	.word	0x21800004	! t0_kref+0x380c:   	fbn,a	_kref+0x381c
	.word	0xea060000	! t0_kref+0x3810:   	ld	[%i0], %l5
	.word	0xea0e0000	! t0_kref+0x3814:   	ldub	[%i0], %l5
	.word	0xfb063ff8	! t0_kref+0x3818:   	ld	[%i0 - 8], %f29
	.word	0xd44e001a	! t0_kref+0x381c:   	ldsb	[%i0 + %i2], %o2
	.word	0xee4e7fff	! t0_kref+0x3820:   	ldsb	[%i1 - 1], %l7
	.word	0xb9a70d3f	! t0_kref+0x3824:   	fsmuld	%f28, %f31, %f28
	.word	0xe60e001a	! t0_kref+0x3828:   	ldub	[%i0 + %i2], %l3
	.word	0xb5b7cdbb	! t0_kref+0x382c:   	fxors	%f31, %f27, %f26
	.word	0xd04e0000	! t0_kref+0x3830:   	ldsb	[%i0], %o0
	.word	0xfd063ff4	! t0_kref+0x3834:   	ld	[%i0 - 0xc], %f30
	.word	0xffa61000	! t0_kref+0x3838:   	sta	%f31, [%i0]0x80
	.word	0x81dd4005	! t0_kref+0x383c:   	flush	%l5 + %g5
	.word	0xb9a0055a	! t0_kref+0x3840:   	fsqrtd	%f26, %f28
	.word	0xb1a7c9b8	! t0_kref+0x3844:   	fdivs	%f31, %f24, %f24
	.word	0xe640a004	! t0_kref+0x3848:   	ldsw	[%g2 + 4], %l3
	.word	0xdaf75019	! t0_kref+0x384c:   	stxa	%o5, [%i5 + %i1]0x80
	.word	0xf1be5a1c	! t0_kref+0x3850:   	stda	%f24, [%i1 + %i4]0xd0
	.word	0xe656001b	! t0_kref+0x3854:   	ldsh	[%i0 + %i3], %l3
	.word	0xb7a0053d	! t0_kref+0x3858:   	fsqrts	%f29, %f27
	.word	0xbba000ba	! t0_kref+0x385c:   	fnegs	%f26, %f29
	.word	0xda20a02c	! t0_kref+0x3860:   	st	%o5, [%g2 + 0x2c]
	.word	0xd456c019	! t0_kref+0x3864:   	ldsh	[%i3 + %i1], %o2
	.word	0xee4e8019	! t0_kref+0x3868:   	ldsb	[%i2 + %i1], %l7
	.word	0xfbee501b	! t0_kref+0x386c:   	prefetcha	%i1 + %i3, 29
	.word	0xb7b00778	! t0_kref+0x3870:   	fpack16	%f24, %f27
	.word	0xbfa6c9b8	! t0_kref+0x3874:   	fdivs	%f27, %f24, %f31
	.word	0xf9bf5a58	! t0_kref+0x3878:   	stda	%f28, [%i5 + %i0]0xd2
	.word	0xe80e4000	! t0_kref+0x387c:   	ldub	[%i1], %l4
	.word	0xee4e4000	! t0_kref+0x3880:   	ldsb	[%i1], %l7
	.word	0xbdb60a7b	! t0_kref+0x3884:   	fpadd32s	%f24, %f27, %f30
	.word	0x24800006	! t0_kref+0x3888:   	ble,a	_kref+0x38a0
	.word	0xec560000	! t0_kref+0x388c:   	ldsh	[%i0], %l6
	.word	0x81af0a38	! t0_kref+0x3890:   	fcmps	%fcc0, %f28, %f24
	.word	0xbdb70e1a	! t0_kref+0x3894:   	fand	%f28, %f26, %f30
	.word	0xee0e7fee	! t0_kref+0x3898:   	ldub	[%i1 - 0x12], %l7
	.word	0xbfa789bb	! t0_kref+0x389c:   	fdivs	%f30, %f27, %f31
	.word	0xd40e001a	! t0_kref+0x38a0:   	ldub	[%i0 + %i2], %o2
	.word	0x35480002	! t0_kref+0x38a4:   	fbue,a,pt	%fcc0, _kref+0x38ac
	.word	0x95b3412d	! t0_kref+0x38a8:   	edge32n	%o5, %o5, %o2
	.word	0xf3200019	! t0_kref+0x38ac:   	st	%f25, [%g0 + %i1]
	.word	0xead6d018	! t0_kref+0x38b0:   	ldsha	[%i3 + %i0]0x80, %l5
	.word	0xb1a00539	! t0_kref+0x38b4:   	fsqrts	%f25, %f24
	.word	0xbda6cd3b	! t0_kref+0x38b8:   	fsmuld	%f27, %f27, %f30
	.word	0x933b600b	! t0_kref+0x38bc:   	sra	%o5, 0xb, %o1
	.word	0xb7a0189b	! t0_kref+0x38c0:   	fitos	%f27, %f27
	.word	0x92bb677f	! t0_kref+0x38c4:   	xnorcc	%o5, 0x77f, %o1
	.word	0xf1bf5a19	! t0_kref+0x38c8:   	stda	%f24, [%i5 + %i1]0xd0
	.word	0xf720a018	! t0_kref+0x38cc:   	st	%f27, [%g2 + 0x18]
	.word	0xd00e8019	! t0_kref+0x38d0:   	ldub	[%i2 + %i1], %o0
	.word	0xfd1f4019	! t0_kref+0x38d4:   	ldd	[%i5 + %i1], %f30
	.word	0xbba0053f	! t0_kref+0x38d8:   	fsqrts	%f31, %f29
	.word	0xda764000	! t0_kref+0x38dc:   	stx	%o5, [%i1]
	.word	0x91b3430d	! t0_kref+0x38e0:   	alignaddr	%o5, %o5, %o0
	.word	0xd44e6000	! t0_kref+0x38e4:   	ldsb	[%i1], %o2
	.word	0xb9b78abd	! t0_kref+0x38e8:   	fpsub16s	%f30, %f29, %f28
	.word	0x131222e5	! t0_kref+0x38ec:   	sethi	%hi(0x488b9400), %o1
	.word	0xb1a709b8	! t0_kref+0x38f0:   	fdivs	%f28, %f24, %f24
	.word	0xb5b7cd60	! t0_kref+0x38f4:   	fnot1s	%f31, %f26
	.word	0xb1a0055a	! t0_kref+0x38f8:   	fsqrtd	%f26, %f24
	.word	0xf91e0000	! t0_kref+0x38fc:   	ldd	[%i0], %f28
	.word	0xa83b400d	! t0_kref+0x3900:   	xnor	%o5, %o5, %l4
	.word	0x81ae8a5e	! t0_kref+0x3904:   	fcmpd	%fcc0, %f26, %f30
	.word	0xda28a027	! t0_kref+0x3908:   	stb	%o5, [%g2 + 0x27]
	.word	0xb1b60918	! t0_kref+0x390c:   	faligndata	%f24, %f24, %f24
	.word	0xda20a008	! t0_kref+0x3910:   	st	%o5, [%g2 + 8]
	.word	0x9de3bfa0	! t0_kref+0x3914:   	save	%sp, -0x60, %sp
	.word	0xb0defb93	! t0_kref+0x3918:   	smulcc	%i3, -0x46d, %i0
	.word	0xafef26bb	! t0_kref+0x391c:   	restore	%i4, 0x6bb, %l7
	.word	0xd6070019	! t0_kref+0x3920:   	ld	[%i4 + %i1], %o3
	.word	0xd440a018	! t0_kref+0x3924:   	ldsw	[%g2 + 0x18], %o2
	.word	0x95b3404d	! t0_kref+0x3928:   	edge8l	%o5, %o5, %o2
	.word	0xd600a03c	! t0_kref+0x392c:   	ld	[%g2 + 0x3c], %o3
	.word	0xb5a7c9ba	! t0_kref+0x3930:   	fdivs	%f31, %f26, %f26
	.word	0xb9a0191b	! t0_kref+0x3934:   	fitod	%f27, %f28
	.word	0xb1b70678	! t0_kref+0x3938:   	fmul8x16au	%f28, %f24, %f24
	.word	0xb9b60918	! t0_kref+0x393c:   	faligndata	%f24, %f24, %f28
	.word	0xb5a0193c	! t0_kref+0x3940:   	fstod	%f28, %f26
	.word	0x95b34240	! t0_kref+0x3944:   	array16	%o5, %g0, %o2
	.word	0xda30a01e	! t0_kref+0x3948:   	sth	%o5, [%g2 + 0x1e]
	.word	0xaa1b400d	! t0_kref+0x394c:   	xor	%o5, %o5, %l5
	.word	0x36800004	! t0_kref+0x3950:   	bge,a	_kref+0x3960
	.word	0xb4103ff7	! t0_kref+0x3954:   	mov	0xfffffff7, %i2
	.word	0xb9a0053e	! t0_kref+0x3958:   	fsqrts	%f30, %f28
	.word	0xf91e3ff8	! t0_kref+0x395c:   	ldd	[%i0 - 8], %f28
	.word	0xb5b78db9	! t0_kref+0x3960:   	fxors	%f30, %f25, %f26
	.word	0xee4e3ff1	! t0_kref+0x3964:   	ldsb	[%i0 - 0xf], %l7
	.word	0xac336a0d	! t0_kref+0x3968:   	orn	%o5, 0xa0d, %l6
	.word	0x81af0a5c	! t0_kref+0x396c:   	fcmpd	%fcc0, %f28, %f28
	.word	0x97703e44	! t0_kref+0x3970:   	popc	-0x1bc, %o3
	.word	0xadb34280	! t0_kref+0x3974:   	array32	%o5, %g0, %l6
	.word	0xd44e7fe8	! t0_kref+0x3978:   	ldsb	[%i1 - 0x18], %o2
	.word	0xe3b8a080	! t0_kref+0x397c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xb5a608dc	! t0_kref+0x3980:   	fsubd	%f24, %f28, %f26
	.word	0xf9be180d	! t0_kref+0x3984:   	stda	%f28, [%i0 + %o5]0xc0
	.word	0xd60e001a	! t0_kref+0x3988:   	ldub	[%i0 + %i2], %o3
	.word	0xfd1fbf78	! t0_kref+0x398c:   	ldd	[%fp - 0x88], %f30
	.word	0x81b01020	! t0_kref+0x3990:   	siam	0x0
	.word	0xd016401b	! t0_kref+0x3994:   	lduh	[%i1 + %i3], %o0
	.word	0xbfa01a3a	! t0_kref+0x3998:   	fstoi	%f26, %f31
	.word	0x30480003	! t0_kref+0x399c:   	ba,a,pt	%icc, _kref+0x39a8
	.word	0xaf408000	! t0_kref+0x39a0:   	mov	%ccr, %l7
	.word	0x93400000	! t0_kref+0x39a4:   	mov	%y, %o1
	.word	0xec56600e	! t0_kref+0x39a8:   	ldsh	[%i1 + 0xe], %l6
	.word	0xaae3400d	! t0_kref+0x39ac:   	subccc	%o5, %o5, %l5
	.word	0xb9b78e80	! t0_kref+0x39b0:   	fsrc1	%f30, %f28
	.word	0xb5a00558	! t0_kref+0x39b4:   	fsqrtd	%f24, %f26
	.word	0xf11e001d	! t0_kref+0x39b8:   	ldd	[%i0 + %i5], %f24
	.word	0xd40e8018	! t0_kref+0x39bc:   	ldub	[%i2 + %i0], %o2
	.word	0xd44e600e	! t0_kref+0x39c0:   	ldsb	[%i1 + 0xe], %o2
	.word	0xe0b81018	! t0_kref+0x39c4:   	stda	%l0, [%g0 + %i0]0x80
	.word	0xd6070019	! t0_kref+0x39c8:   	ld	[%i4 + %i1], %o3
	.word	0xaabb400d	! t0_kref+0x39cc:   	xnorcc	%o5, %o5, %l5
	.word	0xa9b34200	! t0_kref+0x39d0:   	array8	%o5, %g0, %l4
	.word	0xbda0005e	! t0_kref+0x39d4:   	fmovd	%f30, %f30
	.word	0xd410a014	! t0_kref+0x39d8:   	lduh	[%g2 + 0x14], %o2
	.word	0xab2b400d	! t0_kref+0x39dc:   	sll	%o5, %o5, %l5
	.word	0x9083400d	! t0_kref+0x39e0:   	addcc	%o5, %o5, %o0
	.word	0x173526b3	! t0_kref+0x39e4:   	sethi	%hi(0xd49acc00), %o3
	.word	0xb9b70e3f	! t0_kref+0x39e8:   	fands	%f28, %f31, %f28
	.word	0xd456c018	! t0_kref+0x39ec:   	ldsh	[%i3 + %i0], %o2
	.word	0xf11e2018	! t0_kref+0x39f0:   	ldd	[%i0 + 0x18], %f24
	.word	0xaadb400d	! t0_kref+0x39f4:   	smulcc	%o5, %o5, %l5
	.word	0xee08a005	! t0_kref+0x39f8:   	ldub	[%g2 + 5], %l7
	.word	0xee50a02e	! t0_kref+0x39fc:   	ldsh	[%g2 + 0x2e], %l7
	.word	0xb9b6467d	! t0_kref+0x3a00:   	fmul8x16au	%f25, %f29, %f28
	.word	0xe9ee101c	! t0_kref+0x3a04:   	prefetcha	%i0 + %i4, 20
	.word	0xd2066010	! t0_kref+0x3a08:   	ld	[%i1 + 0x10], %o1
	.word	0xb3a688b9	! t0_kref+0x3a0c:   	fsubs	%f26, %f25, %f25
	.word	0xb1a000b8	! t0_kref+0x3a10:   	fnegs	%f24, %f24
	.word	0xee56001b	! t0_kref+0x3a14:   	ldsh	[%i0 + %i3], %l7
	.word	0xfd1e6010	! t0_kref+0x3a18:   	ldd	[%i1 + 0x10], %f30
	.word	0xb1b68f9a	! t0_kref+0x3a1c:   	for	%f26, %f26, %f24
	.word	0xee063ff8	! t0_kref+0x3a20:   	ld	[%i0 - 8], %l7
	.word	0xb5a608dc	! t0_kref+0x3a24:   	fsubd	%f24, %f28, %f26
	.word	0xf36e7fe0	! t0_kref+0x3a28:   	prefetch	%i1 - 0x20, 25
	.word	0xee0e4000	! t0_kref+0x3a2c:   	ldub	[%i1], %l7
	.word	0xf51e7fe8	! t0_kref+0x3a30:   	ldd	[%i1 - 0x18], %f26
	.word	0xaa13400d	! t0_kref+0x3a34:   	or	%o5, %o5, %l5
	.word	0xee50a028	! t0_kref+0x3a38:   	ldsh	[%g2 + 0x28], %l7
	.word	0xbda00539	! t0_kref+0x3a3c:   	fsqrts	%f25, %f30
	.word	0x2d800003	! t0_kref+0x3a40:   	fbg,a	_kref+0x3a4c
	.word	0xd4067fe4	! t0_kref+0x3a44:   	ld	[%i1 - 0x1c], %o2
	.word	0xbbb00c20	! t0_kref+0x3a48:   	fzeros	%f29
	.word	0xb1a018d8	! t0_kref+0x3a4c:   	fdtos	%f24, %f24
	.word	0xb5b706da	! t0_kref+0x3a50:   	fmul8sux16	%f28, %f26, %f26
	.word	0xd440a038	! t0_kref+0x3a54:   	ldsw	[%g2 + 0x38], %o2
	.word	0xb5b6091a	! t0_kref+0x3a58:   	faligndata	%f24, %f26, %f26
	sethi	%hi(1f), %o7
	save	%sp,-0x60,%sp
	return	%i7+%lo(1f)
	.empty
	.word	0xb1a748be	! t0_kref+0x3a68:   	fsubs	%f29, %f30, %f24
	.word	0x93b6045a	! t0_kref+0x3a6c:   	fcmpne16	%f24, %f26, %o1
	.word	0xd64e8019	! t0_kref+0x3a70:   	ldsb	[%i2 + %i1], %o3
	.word	0x36800008	! t0_kref+0x3a74:   	bge,a	_kref+0x3a94
1:	.word	0xb1a01a58	! t0_kref+0x3a78:   	fdtoi	%f24, %f24
	.word	0xda30a02e	! t0_kref+0x3a7c:   	sth	%o5, [%g2 + 0x2e]
	.word	0xb5b00f1a	! t0_kref+0x3a80:   	fsrc2	%f26, %f26
	.word	0xa70b67d0	! t0_kref+0x3a84:   	tsubcc	%o5, 0x7d0, %l3
	.word	0xd256c019	! t0_kref+0x3a88:   	ldsh	[%i3 + %i1], %o1
	.word	0xb5b00fc0	! t0_kref+0x3a8c:   	fone	%f26
	.word	0xad408000	! t0_kref+0x3a90:   	mov	%ccr, %l6
	.word	0xd010a030	! t0_kref+0x3a94:   	lduh	[%g2 + 0x30], %o0
	call	SYM(t0_subr2)
	.word	0xd448a027	! t0_kref+0x3a9c:   	ldsb	[%g2 + 0x27], %o2
	.word	0xadb3408d	! t0_kref+0x3aa0:   	edge16	%o5, %o5, %l6
	.word	0x3a800006	! t0_kref+0x3aa4:   	bcc,a	_kref+0x3abc
	.word	0xff070018	! t0_kref+0x3aa8:   	ld	[%i4 + %i0], %f31
	.word	0xb9b00fc0	! t0_kref+0x3aac:   	fone	%f28
	.word	0xd6480018	! t0_kref+0x3ab0:   	ldsb	[%g0 + %i0], %o3
	.word	0xa92b400d	! t0_kref+0x3ab4:   	sll	%o5, %o5, %l4
	.word	0xbdb60e80	! t0_kref+0x3ab8:   	fsrc1	%f24, %f30
	.word	0x8610201b	! t0_kref+0x3abc:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x3ac0:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0x3ac4:   	be,a	_kref+0x3af8
	.word	0xe6100019	! t0_kref+0x3ac8:   	lduh	[%g0 + %i1], %l3
	.word	0xb5b0077e	! t0_kref+0x3acc:   	fpack16	%f30, %f26
	.word	0x95b340cd	! t0_kref+0x3ad0:   	edge16l	%o5, %o5, %o2
	.word	0xc96e3fe0	! t0_kref+0x3ad4:   	prefetch	%i0 - 0x20, 4
	.word	0xb9b00cda	! t0_kref+0x3ad8:   	fnot2	%f26, %f28
	.word	0xd478a000	! t0_kref+0x3adc:   	swap	[%g2], %o2
	.word	0xda30a02a	! t0_kref+0x3ae0:   	sth	%o5, [%g2 + 0x2a]
	.word	0x93b34240	! t0_kref+0x3ae4:   	array16	%o5, %g0, %o1
	.word	0xf19e5a1a	! t0_kref+0x3ae8:   	ldda	[%i1 + %i2]0xd0, %f24
	.word	0xf9000019	! t0_kref+0x3aec:   	ld	[%g0 + %i1], %f28
	.word	0xb1b7497c	! t0_kref+0x3af0:   	fpmerge	%f29, %f28, %f24
	.word	0xb5b60a7b	! t0_kref+0x3af4:   	fpadd32s	%f24, %f27, %f26
	.word	0xd64e0000	! t0_kref+0x3af8:   	ldsb	[%i0], %o3
	.word	0xd20e7fe4	! t0_kref+0x3afc:   	ldub	[%i1 - 0x1c], %o1
	.word	0xb7a648bd	! t0_kref+0x3b00:   	fsubs	%f25, %f29, %f27
	.word	0xd60e7fea	! t0_kref+0x3b04:   	ldub	[%i1 - 0x16], %o3
	.word	0x91b704dc	! t0_kref+0x3b08:   	fcmpne32	%f28, %f28, %o0
	.word	0xf19e1a5c	! t0_kref+0x3b0c:   	ldda	[%i0 + %i4]0xd2, %f24
	.word	0xf500a01c	! t0_kref+0x3b10:   	ld	[%g2 + 0x1c], %f26
	.word	0xee500018	! t0_kref+0x3b14:   	ldsh	[%g0 + %i0], %l7
	.word	0xec16601e	! t0_kref+0x3b18:   	lduh	[%i1 + 0x1e], %l6
	.word	0xbdb009b9	! t0_kref+0x3b1c:   	fexpand	%f25, %f30
	.word	0x9de3bfa0	! t0_kref+0x3b20:   	save	%sp, -0x60, %sp
	.word	0xadee2f4c	! t0_kref+0x3b24:   	restore	%i0, 0xf4c, %l6
	.word	0xea50a030	! t0_kref+0x3b28:   	ldsh	[%g2 + 0x30], %l5
	.word	0xda30a01c	! t0_kref+0x3b2c:   	sth	%o5, [%g2 + 0x1c]
	.word	0x95237d0a	! t0_kref+0x3b30:   	mulscc	%o5, -0x2f6, %o2
	.word	0xb7a609b9	! t0_kref+0x3b34:   	fdivs	%f24, %f25, %f27
	.word	0xaa9b400d	! t0_kref+0x3b38:   	xorcc	%o5, %o5, %l5
	.word	0x9fc10000	! t0_kref+0x3b3c:   	call	%g4
	.word	0xb3a688b9	! t0_kref+0x3b40:   	fsubs	%f26, %f25, %f25
	.word	0xda2e8019	! t0_kref+0x3b44:   	stb	%o5, [%i2 + %i1]
	.word	0x97b3416d	! t0_kref+0x3b48:   	edge32ln	%o5, %o5, %o3
	.word	0x81ae8ad8	! t0_kref+0x3b4c:   	fcmped	%fcc0, %f26, %f24
	.word	0xaf23400d	! t0_kref+0x3b50:   	mulscc	%o5, %o5, %l7
	.word	0xd450a030	! t0_kref+0x3b54:   	ldsh	[%g2 + 0x30], %o2
	.word	0xd2064000	! t0_kref+0x3b58:   	ld	[%i1], %o1
	.word	0xf500a034	! t0_kref+0x3b5c:   	ld	[%g2 + 0x34], %f26
	.word	0x91b340cd	! t0_kref+0x3b60:   	edge16l	%o5, %o5, %o0
	.word	0xda2e001a	! t0_kref+0x3b64:   	stb	%o5, [%i0 + %i2]
	.word	0xda20a000	! t0_kref+0x3b68:   	st	%o5, [%g2]
	.word	0xf1be588d	! t0_kref+0x3b6c:   	stda	%f24, [%i1 + %o5]0xc4
	.word	0xfb00a018	! t0_kref+0x3b70:   	ld	[%g2 + 0x18], %f29
	.word	0xd4000019	! t0_kref+0x3b74:   	ld	[%g0 + %i1], %o2
	.word	0xd200a000	! t0_kref+0x3b78:   	ld	[%g2], %o1
	.word	0xf9be584d	! t0_kref+0x3b7c:   	stda	%f28, [%i1 + %o5]0xc2
	.word	0xec10a026	! t0_kref+0x3b80:   	lduh	[%g2 + 0x26], %l6
	.word	0xf9be188d	! t0_kref+0x3b84:   	stda	%f28, [%i0 + %o5]0xc4
	.word	0x960b7713	! t0_kref+0x3b88:   	and	%o5, -0x8ed, %o3
	.word	0x945b400d	! t0_kref+0x3b8c:   	smul	%o5, %o5, %o2
	.word	0xa73b600e	! t0_kref+0x3b90:   	sra	%o5, 0xe, %l3
	.word	0xfb20a02c	! t0_kref+0x3b94:   	st	%f29, [%g2 + 0x2c]
	.word	0xe648a018	! t0_kref+0x3b98:   	ldsb	[%g2 + 0x18], %l3
	.word	0xa783400d	! t0_kref+0x3b9c:   	wr	%o5, %o5, %gsr
	.word	0x9623400d	! t0_kref+0x3ba0:   	sub	%o5, %o5, %o3
	.word	0xa733400d	! t0_kref+0x3ba4:   	srl	%o5, %o5, %l3
	.word	0x8583400d	! t0_kref+0x3ba8:   	wr	%o5, %o5, %ccr
	.word	0xb1a01938	! t0_kref+0x3bac:   	fstod	%f24, %f24
	.word	0xf99e5a1a	! t0_kref+0x3bb0:   	ldda	[%i1 + %i2]0xd0, %f28
	.word	0xbdb6891e	! t0_kref+0x3bb4:   	faligndata	%f26, %f30, %f30
	.word	0xd416001b	! t0_kref+0x3bb8:   	lduh	[%i0 + %i3], %o2
	.word	0x8143c000	! t0_kref+0x3bbc:   	stbar
	.word	0xbfa0053d	! t0_kref+0x3bc0:   	fsqrts	%f29, %f31
	.word	0xf51e4000	! t0_kref+0x3bc4:   	ldd	[%i1], %f26
	.word	0xa863400d	! t0_kref+0x3bc8:   	subc	%o5, %o5, %l4
	.word	0xda30a038	! t0_kref+0x3bcc:   	sth	%o5, [%g2 + 0x38]
	.word	0x31800005	! t0_kref+0x3bd0:   	fba,a	_kref+0x3be4
	.word	0xad33400d	! t0_kref+0x3bd4:   	srl	%o5, %o5, %l6
	.word	0xec56601c	! t0_kref+0x3bd8:   	ldsh	[%i1 + 0x1c], %l6
	.word	0xda30a008	! t0_kref+0x3bdc:   	sth	%o5, [%g2 + 8]
	.word	0xda20a030	! t0_kref+0x3be0:   	st	%o5, [%g2 + 0x30]
	.word	0xb9b60a1c	! t0_kref+0x3be4:   	fpadd16	%f24, %f28, %f28
	.word	0xdab6101b	! t0_kref+0x3be8:   	stha	%o5, [%i0 + %i3]0x80
	.word	0xd4060000	! t0_kref+0x3bec:   	ld	[%i0], %o2
	.word	0xd050a008	! t0_kref+0x3bf0:   	ldsh	[%g2 + 8], %o0
	.word	0xe810a036	! t0_kref+0x3bf4:   	lduh	[%g2 + 0x36], %l4
	.word	0xef68a04a	! t0_kref+0x3bf8:   	prefetch	%g2 + 0x4a, 23
	.word	0xea48a024	! t0_kref+0x3bfc:   	ldsb	[%g2 + 0x24], %l5
	.word	0xda280019	! t0_kref+0x3c00:   	stb	%o5, [%g0 + %i1]
	.word	0xda20a028	! t0_kref+0x3c04:   	st	%o5, [%g2 + 0x28]
	.word	0xe640a014	! t0_kref+0x3c08:   	ldsw	[%g2 + 0x14], %l3
	.word	0xabb605d8	! t0_kref+0x3c0c:   	fcmpeq32	%f24, %f24, %l5
	.word	0xe6080018	! t0_kref+0x3c10:   	ldub	[%g0 + %i0], %l3
	.word	0xf520a038	! t0_kref+0x3c14:   	st	%f26, [%g2 + 0x38]
	.word	0x37480006	! t0_kref+0x3c18:   	fbge,a,pt	%fcc0, _kref+0x3c30
	.word	0xa7b3430d	! t0_kref+0x3c1c:   	alignaddr	%o5, %o5, %l3
	.word	0x91b340cd	! t0_kref+0x3c20:   	edge16l	%o5, %o5, %o0
	.word	0xb7b64abb	! t0_kref+0x3c24:   	fpsub16s	%f25, %f27, %f27
	.word	0x92b36b4b	! t0_kref+0x3c28:   	orncc	%o5, 0xb4b, %o1
	.word	0xb1b70d9c	! t0_kref+0x3c2c:   	fxor	%f28, %f28, %f24
	.word	0xd2066008	! t0_kref+0x3c30:   	ld	[%i1 + 8], %o1
	.word	0xabb3432d	! t0_kref+0x3c34:   	bmask	%o5, %o5, %l5
	.word	0xb1b74ea0	! t0_kref+0x3c38:   	fsrc1s	%f29, %f24
	.word	0xbba00539	! t0_kref+0x3c3c:   	fsqrts	%f25, %f29
	.word	0xd210a014	! t0_kref+0x3c40:   	lduh	[%g2 + 0x14], %o1
	.word	0xe64e6017	! t0_kref+0x3c44:   	ldsb	[%i1 + 0x17], %l3
	.word	0xd41e7fe0	! t0_kref+0x3c48:   	ldd	[%i1 - 0x20], %o2
	.word	0xee162002	! t0_kref+0x3c4c:   	lduh	[%i0 + 2], %l7
	.word	0xf5180019	! t0_kref+0x3c50:   	ldd	[%g0 + %i1], %f26
	.word	0xe6564000	! t0_kref+0x3c54:   	ldsh	[%i1], %l3
	.word	0xda2e601f	! t0_kref+0x3c58:   	stb	%o5, [%i1 + 0x1f]
	.word	0xe6080019	! t0_kref+0x3c5c:   	ldub	[%g0 + %i1], %l3
	.word	0xb9b70a1c	! t0_kref+0x3c60:   	fpadd16	%f28, %f28, %f28
	.word	0xb5b7cefb	! t0_kref+0x3c64:   	fornot2s	%f31, %f27, %f26
	.word	0xfd180018	! t0_kref+0x3c68:   	ldd	[%g0 + %i0], %f30
	.word	0xf100a038	! t0_kref+0x3c6c:   	ld	[%g2 + 0x38], %f24
	.word	0xd2063ff8	! t0_kref+0x3c70:   	ld	[%i0 - 8], %o1
	.word	0xabb704da	! t0_kref+0x3c74:   	fcmpne32	%f28, %f26, %l5
	.word	0xb9b686bc	! t0_kref+0x3c78:   	fmul8x16al	%f26, %f28, %f28
	.word	0xea4e0000	! t0_kref+0x3c7c:   	ldsb	[%i0], %l5
	.word	0xe816001b	! t0_kref+0x3c80:   	lduh	[%i0 + %i3], %l4
	.word	0xbdb74dbe	! t0_kref+0x3c84:   	fxors	%f29, %f30, %f30
	.word	0xf300a028	! t0_kref+0x3c88:   	ld	[%g2 + 0x28], %f25
	.word	0xb9b78f5a	! t0_kref+0x3c8c:   	fornot1	%f30, %f26, %f28
	.word	0xea10a024	! t0_kref+0x3c90:   	lduh	[%g2 + 0x24], %l5
	.word	0x2d0c4453	! t0_kref+0x3c94:   	sethi	%hi(0x31114c00), %l6
	.word	0xabb340cd	! t0_kref+0x3c98:   	edge16l	%o5, %o5, %l5
	.word	0xea4e001a	! t0_kref+0x3c9c:   	ldsb	[%i0 + %i2], %l5
	.word	0x9de3bfa0	! t0_kref+0x3ca0:   	save	%sp, -0x60, %sp
	.word	0xb8274019	! t0_kref+0x3ca4:   	sub	%i5, %i1, %i4
	.word	0xadee7870	! t0_kref+0x3ca8:   	restore	%i1, -0x790, %l6
	.word	0xb5b606de	! t0_kref+0x3cac:   	fmul8sux16	%f24, %f30, %f26
	.word	0xd4067fe8	! t0_kref+0x3cb0:   	ld	[%i1 - 0x18], %o2
	.word	0xb9a709bc	! t0_kref+0x3cb4:   	fdivs	%f28, %f28, %f28
	.word	0xaf13400d	! t0_kref+0x3cb8:   	taddcctv	%o5, %o5, %l7
	.word	0xe650a03c	! t0_kref+0x3cbc:   	ldsh	[%g2 + 0x3c], %l3
	.word	0xda200019	! t0_kref+0x3cc0:   	st	%o5, [%g0 + %i1]
	.word	0xda28a009	! t0_kref+0x3cc4:   	stb	%o5, [%g2 + 9]
	.word	0xbdb00fc0	! t0_kref+0x3cc8:   	fone	%f30
	.word	0xb5b60e1c	! t0_kref+0x3ccc:   	fand	%f24, %f28, %f26
	.word	0x942b7118	! t0_kref+0x3cd0:   	andn	%o5, -0xee8, %o2
	.word	0xf520a01c	! t0_kref+0x3cd4:   	st	%f26, [%g2 + 0x1c]
	.word	0xee0e7ffd	! t0_kref+0x3cd8:   	ldub	[%i1 - 3], %l7
	.word	0xd00e4000	! t0_kref+0x3cdc:   	ldub	[%i1], %o0
	.word	0x81af0a58	! t0_kref+0x3ce0:   	fcmpd	%fcc0, %f28, %f24
	.word	0xda20a038	! t0_kref+0x3ce4:   	st	%o5, [%g2 + 0x38]
	.word	0x9de3bfa0	! t0_kref+0x3ce8:   	save	%sp, -0x60, %sp
	.word	0x808f401b	! t0_kref+0x3cec:   	btst	%i3, %i5
	.word	0xa7ee4018	! t0_kref+0x3cf0:   	restore	%i1, %i0, %l3
	.word	0x91418000	! t0_kref+0x3cf4:   	mov	%fprs, %o0
	.word	0xb9b78dd8	! t0_kref+0x3cf8:   	fnand	%f30, %f24, %f28
	.word	0xb1b7cd60	! t0_kref+0x3cfc:   	fnot1s	%f31, %f24
	.word	0xbda018dc	! t0_kref+0x3d00:   	fdtos	%f28, %f30
	.word	0xbba709bc	! t0_kref+0x3d04:   	fdivs	%f28, %f28, %f29
	.word	0xee4e001a	! t0_kref+0x3d08:   	ldsb	[%i0 + %i2], %l7
	.word	0xd60e6011	! t0_kref+0x3d0c:   	ldub	[%i1 + 0x11], %o3
	.word	0xb5b007bc	! t0_kref+0x3d10:   	fpackfix	%f28, %f26
	.word	0x8d83400d	! t0_kref+0x3d14:   	wr	%o5, %o5, %fprs
	.word	0xadb3404d	! t0_kref+0x3d18:   	edge8l	%o5, %o5, %l6
	.word	0xea060000	! t0_kref+0x3d1c:   	ld	[%i0], %l5
	.word	0x23800007	! t0_kref+0x3d20:   	fbne,a	_kref+0x3d3c
	.word	0xbda74d3a	! t0_kref+0x3d24:   	fsmuld	%f29, %f26, %f30
	.word	0xfb063ff4	! t0_kref+0x3d28:   	ld	[%i0 - 0xc], %f29
	.word	0xd256600c	! t0_kref+0x3d2c:   	ldsh	[%i1 + 0xc], %o1
	.word	0xe8063fe0	! t0_kref+0x3d30:   	ld	[%i0 - 0x20], %l4
	.word	0x94db400d	! t0_kref+0x3d34:   	smulcc	%o5, %o5, %o2
	.word	0xfb20a018	! t0_kref+0x3d38:   	st	%f29, [%g2 + 0x18]
	.word	0xbda7cd3c	! t0_kref+0x3d3c:   	fsmuld	%f31, %f28, %f30
	.word	0xb7b7cea0	! t0_kref+0x3d40:   	fsrc1s	%f31, %f27
	.word	0xd40e001a	! t0_kref+0x3d44:   	ldub	[%i0 + %i2], %o2
	.word	0xda2e3ffd	! t0_kref+0x3d48:   	stb	%o5, [%i0 - 3]
	.word	0xb5a6083e	! t0_kref+0x3d4c:   	fadds	%f24, %f30, %f26
	.word	0xf11fbfa8	! t0_kref+0x3d50:   	ldd	[%fp - 0x58], %f24
	.word	0xe8070019	! t0_kref+0x3d54:   	ld	[%i4 + %i1], %l4
	.word	0x9144c000	! t0_kref+0x3d58:   	mov	%gsr, %o0
	.word	0x96ab400d	! t0_kref+0x3d5c:   	andncc	%o5, %o5, %o3
	.word	0xb5b78a1a	! t0_kref+0x3d60:   	fpadd16	%f30, %f26, %f26
	.word	0xc568a08f	! t0_kref+0x3d64:   	prefetch	%g2 + 0x8f, 2
	.word	0xec16401b	! t0_kref+0x3d68:   	lduh	[%i1 + %i3], %l6
	.word	0x92137b58	! t0_kref+0x3d6c:   	or	%o5, -0x4a8, %o1
	.word	0xf9bf1a19	! t0_kref+0x3d70:   	stda	%f28, [%i4 + %i1]0xd0
	.word	0x95b3404d	! t0_kref+0x3d74:   	edge8l	%o5, %o5, %o2
	.word	0xb1a000b9	! t0_kref+0x3d78:   	fnegs	%f25, %f24
	.word	0xf19f5a59	! t0_kref+0x3d7c:   	ldda	[%i5 + %i1]0xd2, %f24
	.word	0xb1b70e5c	! t0_kref+0x3d80:   	fxnor	%f28, %f28, %f24
	.word	0x93b605da	! t0_kref+0x3d84:   	fcmpeq32	%f24, %f26, %o1
	call	SYM(t0_subr3)
	.word	0xe6000018	! t0_kref+0x3d8c:   	ld	[%g0 + %i0], %l3
	.word	0x86102004	! t0_kref+0x3d90:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x3d94:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x3d98:   	be,a	_kref+0x3e08
	.word	0xbda648b8	! t0_kref+0x3d9c:   	fsubs	%f25, %f24, %f30
	.word	0xb1a0015c	! t0_kref+0x3da0:   	fabsd	%f28, %f24
	.word	0xe800a020	! t0_kref+0x3da4:   	ld	[%g2 + 0x20], %l4
	.word	0x8d83400d	! t0_kref+0x3da8:   	wr	%o5, %o5, %fprs
	.word	0xda20a018	! t0_kref+0x3dac:   	st	%o5, [%g2 + 0x18]
	.word	0xf51e401d	! t0_kref+0x3db0:   	ldd	[%i1 + %i5], %f26
	.word	0xb3a749b8	! t0_kref+0x3db4:   	fdivs	%f29, %f24, %f25
	.word	0xe80e6004	! t0_kref+0x3db8:   	ldub	[%i1 + 4], %l4
	.word	0xf51e6018	! t0_kref+0x3dbc:   	ldd	[%i1 + 0x18], %f26
	.word	0x3e800006	! t0_kref+0x3dc0:   	bvc,a	_kref+0x3dd8
	.word	0xf9be1a5b	! t0_kref+0x3dc4:   	stda	%f28, [%i0 + %i3]0xd2
	.word	0xafb3410d	! t0_kref+0x3dc8:   	edge32	%o5, %o5, %l7
	.word	0xe650a01a	! t0_kref+0x3dcc:   	ldsh	[%g2 + 0x1a], %l3
	.word	0xda2e7fe3	! t0_kref+0x3dd0:   	stb	%o5, [%i1 - 0x1d]
	.word	0x81df4009	! t0_kref+0x3dd4:   	flush	%i5 + %o1
	.word	0xd200a030	! t0_kref+0x3dd8:   	ld	[%g2 + 0x30], %o1
	.word	0xd60e6019	! t0_kref+0x3ddc:   	ldub	[%i1 + 0x19], %o3
	.word	0xe83e3fe8	! t0_kref+0x3de0:   	std	%l4, [%i0 - 0x18]
	.word	0x81af8ada	! t0_kref+0x3de4:   	fcmped	%fcc0, %f30, %f26
	.word	0x81dc4011	! t0_kref+0x3de8:   	flush	%l1 + %l1
	.word	0xea48a035	! t0_kref+0x3dec:   	ldsb	[%g2 + 0x35], %l5
	.word	0xae2b400d	! t0_kref+0x3df0:   	andn	%o5, %o5, %l7
	.word	0x8d83400d	! t0_kref+0x3df4:   	wr	%o5, %o5, %fprs
	.word	0xb5b78c5c	! t0_kref+0x3df8:   	fnor	%f30, %f28, %f26
	.word	0xe8100019	! t0_kref+0x3dfc:   	lduh	[%g0 + %i1], %l4
	.word	0xf1066008	! t0_kref+0x3e00:   	ld	[%i1 + 8], %f24
	.word	0xb1b009bd	! t0_kref+0x3e04:   	fexpand	%f29, %f24
	.word	0xac63400d	! t0_kref+0x3e08:   	subc	%o5, %o5, %l6
	.word	0xb9a0053c	! t0_kref+0x3e0c:   	fsqrts	%f28, %f28
	.word	0xb9b7891e	! t0_kref+0x3e10:   	faligndata	%f30, %f30, %f28
	.word	0xe850a03c	! t0_kref+0x3e14:   	ldsh	[%g2 + 0x3c], %l4
	.word	0xee08a006	! t0_kref+0x3e18:   	ldub	[%g2 + 6], %l7
	.word	0xd448a03c	! t0_kref+0x3e1c:   	ldsb	[%g2 + 0x3c], %o2
	.word	0xee901018	! t0_kref+0x3e20:   	lduha	[%g0 + %i0]0x80, %l7
	.word	0xd4067fec	! t0_kref+0x3e24:   	ld	[%i1 - 0x14], %o2
	call	SYM(t0_subr1)
	.word	0xb3a01a3f	! t0_kref+0x3e2c:   	fstoi	%f31, %f25
	.word	0xb1b60c98	! t0_kref+0x3e30:   	fandnot2	%f24, %f24, %f24
	.word	0xf11e6000	! t0_kref+0x3e34:   	ldd	[%i1], %f24
	.word	0xd0500018	! t0_kref+0x3e38:   	ldsh	[%g0 + %i0], %o0
	.word	0x81ae8a5c	! t0_kref+0x3e3c:   	fcmpd	%fcc0, %f26, %f28
	.word	0xea4e3fe0	! t0_kref+0x3e40:   	ldsb	[%i0 - 0x20], %l5
	.word	0xe60e200f	! t0_kref+0x3e44:   	ldub	[%i0 + 0xf], %l3
	.word	0xe8480019	! t0_kref+0x3e48:   	ldsb	[%g0 + %i1], %l4
	.word	0xb9b009b8	! t0_kref+0x3e4c:   	fexpand	%f24, %f28
	.word	0xda28a002	! t0_kref+0x3e50:   	stb	%o5, [%g2 + 2]
	.word	0xb5a0003c	! t0_kref+0x3e54:   	fmovs	%f28, %f26
	.word	0xb5b78cbb	! t0_kref+0x3e58:   	fandnot2s	%f30, %f27, %f26
	.word	0xb9a708d8	! t0_kref+0x3e5c:   	fsubd	%f28, %f24, %f28
	.word	0xb7a749bd	! t0_kref+0x3e60:   	fdivs	%f29, %f29, %f27
	.word	0xb3a689b9	! t0_kref+0x3e64:   	fdivs	%f26, %f25, %f25
	.word	0xb9b606ba	! t0_kref+0x3e68:   	fmul8x16al	%f24, %f26, %f28
	.word	0x95408000	! t0_kref+0x3e6c:   	mov	%ccr, %o2
	.word	0xb7a0053f	! t0_kref+0x3e70:   	fsqrts	%f31, %f27
	.word	0xd600a010	! t0_kref+0x3e74:   	ld	[%g2 + 0x10], %o3
	.word	0xb5a709bb	! t0_kref+0x3e78:   	fdivs	%f28, %f27, %f26
	.word	0xe6080018	! t0_kref+0x3e7c:   	ldub	[%g0 + %i0], %l3
	.word	0xea0e3fe0	! t0_kref+0x3e80:   	ldub	[%i0 - 0x20], %l5
	.word	0xd4560000	! t0_kref+0x3e84:   	ldsh	[%i0], %o2
	.word	0x81834000	! t0_kref+0x3e88:   	wr	%o5, %g0, %y
	.word	0xa9b340cd	! t0_kref+0x3e8c:   	edge16l	%o5, %o5, %l4
	.word	0x94e3400d	! t0_kref+0x3e90:   	subccc	%o5, %o5, %o2
	.word	0xfd060000	! t0_kref+0x3e94:   	ld	[%i0], %f30
	.word	0xfd00a010	! t0_kref+0x3e98:   	ld	[%g2 + 0x10], %f30
	.word	0x97b68458	! t0_kref+0x3e9c:   	fcmpne16	%f26, %f24, %o3
	.word	0x9144c000	! t0_kref+0x3ea0:   	mov	%gsr, %o0
	.word	0xec070018	! t0_kref+0x3ea4:   	ld	[%i4 + %i0], %l6
	.word	0xb9b706fa	! t0_kref+0x3ea8:   	fmul8ulx16	%f28, %f26, %f28
	.word	0xea10a00c	! t0_kref+0x3eac:   	lduh	[%g2 + 0xc], %l5
	.word	0xee0e7feb	! t0_kref+0x3eb0:   	ldub	[%i1 - 0x15], %l7
	.word	0xa883400d	! t0_kref+0x3eb4:   	addcc	%o5, %o5, %l4
	.word	0xda30a008	! t0_kref+0x3eb8:   	sth	%o5, [%g2 + 8]
	.word	0xa82b6778	! t0_kref+0x3ebc:   	andn	%o5, 0x778, %l4
	.word	0xbdb7cefc	! t0_kref+0x3ec0:   	fornot2s	%f31, %f28, %f30
	.word	0xae137fe6	! t0_kref+0x3ec4:   	or	%o5, -0x1a, %l7
	.word	0xd600a00c	! t0_kref+0x3ec8:   	ld	[%g2 + 0xc], %o3
	.word	0xbdb686bc	! t0_kref+0x3ecc:   	fmul8x16al	%f26, %f28, %f30
	.word	0xf1be584d	! t0_kref+0x3ed0:   	stda	%f24, [%i1 + %o5]0xc2
	.word	0xadb7845a	! t0_kref+0x3ed4:   	fcmpne16	%f30, %f26, %l6
	.word	0xe840a014	! t0_kref+0x3ed8:   	ldsw	[%g2 + 0x14], %l4
	.word	0xaee37172	! t0_kref+0x3edc:   	subccc	%o5, -0xe8e, %l7
	.word	0xf920a010	! t0_kref+0x3ee0:   	st	%f28, [%g2 + 0x10]
	.word	0xb1b7073e	! t0_kref+0x3ee4:   	fmuld8ulx16	%f28, %f30, %f24
	.word	0xe60e7fe4	! t0_kref+0x3ee8:   	ldub	[%i1 - 0x1c], %l3
	.word	0xe64e2011	! t0_kref+0x3eec:   	ldsb	[%i0 + 0x11], %l3
	.word	0xb5a789ba	! t0_kref+0x3ef0:   	fdivs	%f30, %f26, %f26
	.word	0xbda7c9bd	! t0_kref+0x3ef4:   	fdivs	%f31, %f29, %f30
	.word	0xbda0055a	! t0_kref+0x3ef8:   	fsqrtd	%f26, %f30
	.word	0xbdb78e80	! t0_kref+0x3efc:   	fsrc1	%f30, %f30
	.word	0xb3a649be	! t0_kref+0x3f00:   	fdivs	%f25, %f30, %f25
	.word	0xb7a689be	! t0_kref+0x3f04:   	fdivs	%f26, %f30, %f27
	.word	0xda30a002	! t0_kref+0x3f08:   	sth	%o5, [%g2 + 2]
	.word	0x93b340cd	! t0_kref+0x3f0c:   	edge16l	%o5, %o5, %o1
	.word	0xf11e7fe0	! t0_kref+0x3f10:   	ldd	[%i1 - 0x20], %f24
	.word	0xf706401c	! t0_kref+0x3f14:   	ld	[%i1 + %i4], %f27
	.word	0xb5b7073c	! t0_kref+0x3f18:   	fmuld8ulx16	%f28, %f28, %f26
	.word	0xe648a038	! t0_kref+0x3f1c:   	ldsb	[%g2 + 0x38], %l3
	.word	0xb5a6895e	! t0_kref+0x3f20:   	fmuld	%f26, %f30, %f26
	.word	0xb7a689bc	! t0_kref+0x3f24:   	fdivs	%f26, %f28, %f27
	.word	0xda360000	! t0_kref+0x3f28:   	sth	%o5, [%i0]
	.word	0xd600a00c	! t0_kref+0x3f2c:   	ld	[%g2 + 0xc], %o3
	.word	0xee08a029	! t0_kref+0x3f30:   	ldub	[%g2 + 0x29], %l7
	.word	0xe640a004	! t0_kref+0x3f34:   	ldsw	[%g2 + 4], %l3
	.word	0xaf33400d	! t0_kref+0x3f38:   	srl	%o5, %o5, %l7
	.word	0xf1be584d	! t0_kref+0x3f3c:   	stda	%f24, [%i1 + %o5]0xc2
	.word	0xee06001c	! t0_kref+0x3f40:   	ld	[%i0 + %i4], %l7
	.word	0xb1a688bb	! t0_kref+0x3f44:   	fsubs	%f26, %f27, %f24
	.word	0xa80b769e	! t0_kref+0x3f48:   	and	%o5, -0x962, %l4
	.word	0xe80e3fe8	! t0_kref+0x3f4c:   	ldub	[%i0 - 0x18], %l4
	.word	0xe816201c	! t0_kref+0x3f50:   	lduh	[%i0 + 0x1c], %l4
	.word	0xb7b74d60	! t0_kref+0x3f54:   	fnot1s	%f29, %f27
	.word	0x97b3430d	! t0_kref+0x3f58:   	alignaddr	%o5, %o5, %o3
	.word	0xb1b0077c	! t0_kref+0x3f5c:   	fpack16	%f28, %f24
	.word	0xb5b607d8	! t0_kref+0x3f60:   	pdist	%f24, %f24, %f26
	.word	0xbda0055e	! t0_kref+0x3f64:   	fsqrtd	%f30, %f30
	.word	0xd20e4000	! t0_kref+0x3f68:   	ldub	[%i1], %o1
	.word	0x3a800007	! t0_kref+0x3f6c:   	bcc,a	_kref+0x3f88
	.word	0xb9a6c83b	! t0_kref+0x3f70:   	fadds	%f27, %f27, %f28
	.word	0xbdb78a5e	! t0_kref+0x3f74:   	fpadd32	%f30, %f30, %f30
	.word	0x111e2f31	! t0_kref+0x3f78:   	sethi	%hi(0x78bcc400), %o0
	.word	0xb9b7097b	! t0_kref+0x3f7c:   	fpmerge	%f28, %f27, %f28
	.word	0x921b661d	! t0_kref+0x3f80:   	xor	%o5, 0x61d, %o1
	.word	0xb5b64678	! t0_kref+0x3f84:   	fmul8x16au	%f25, %f24, %f26
	.word	0xd20e4000	! t0_kref+0x3f88:   	ldub	[%i1], %o1
	.word	0xbbb64ef8	! t0_kref+0x3f8c:   	fornot2s	%f25, %f24, %f29
	.word	0xbfb6cfbf	! t0_kref+0x3f90:   	fors	%f27, %f31, %f31
	.word	0xb9a0193e	! t0_kref+0x3f94:   	fstod	%f30, %f28
	.word	0xd440a024	! t0_kref+0x3f98:   	ldsw	[%g2 + 0x24], %o2
	.word	0xf920a020	! t0_kref+0x3f9c:   	st	%f28, [%g2 + 0x20]
	.word	0xa7b3410d	! t0_kref+0x3fa0:   	edge32	%o5, %o5, %l3
	.word	0xea0e3fee	! t0_kref+0x3fa4:   	ldub	[%i0 - 0x12], %l5
	.word	0xd40e3fff	! t0_kref+0x3fa8:   	ldub	[%i0 - 1], %o2
	.word	0xea4e200b	! t0_kref+0x3fac:   	ldsb	[%i0 + 0xb], %l5
	.word	0xd608a036	! t0_kref+0x3fb0:   	ldub	[%g2 + 0x36], %o3
	.word	0xda28a00e	! t0_kref+0x3fb4:   	stb	%o5, [%g2 + 0xe]
	call	1f
	.empty
	.word	0xf3ee501c	! t0_kref+0x3fbc:   	prefetcha	%i1 + %i4, 25
	.word	0xb9a0053f	! t0_kref+0x3fc0:   	fsqrts	%f31, %f28
1:	.word	0x90f3659f	! t0_kref+0x3fc4:   	udivcc	%o5, 0x59f, %o0
	.word	0xd00e8019	! t0_kref+0x3fc8:   	ldub	[%i2 + %i1], %o0
	.word	0x95237b5b	! t0_kref+0x3fcc:   	mulscc	%o5, -0x4a5, %o2
	.word	0xaf3b6013	! t0_kref+0x3fd0:   	sra	%o5, 0x13, %l7
	.word	0x9fc10000	! t0_kref+0x3fd4:   	call	%g4
	.word	0xf100a024	! t0_kref+0x3fd8:   	ld	[%g2 + 0x24], %f24
	.word	0xf96e001b	! t0_kref+0x3fdc:   	prefetch	%i0 + %i3, 28
	.word	0xf520a004	! t0_kref+0x3fe0:   	st	%f26, [%g2 + 4]
	.word	0x8143e062	! t0_kref+0x3fe4:   	membar	0x62
	.word	0xbba6c9bb	! t0_kref+0x3fe8:   	fdivs	%f27, %f27, %f29
	.word	0xee0e7ff1	! t0_kref+0x3fec:   	ldub	[%i1 - 0xf], %l7
	.word	0xe648a03e	! t0_kref+0x3ff0:   	ldsb	[%g2 + 0x3e], %l3
	.word	0xaf036df3	! t0_kref+0x3ff4:   	taddcc	%o5, 0xdf3, %l7
	.word	0xf300a03c	! t0_kref+0x3ff8:   	ld	[%g2 + 0x3c], %f25
	.word	0xb7a789b8	! t0_kref+0x3ffc:   	fdivs	%f30, %f24, %f27
	.word	0xee567ffe	! t0_kref+0x4000:   	ldsh	[%i1 - 2], %l7
	.word	0xf520a018	! t0_kref+0x4004:   	st	%f26, [%g2 + 0x18]
	.word	0xbdb00f3b	! t0_kref+0x4008:   	fsrc2s	%f27, %f30
	.word	0xe6062010	! t0_kref+0x400c:   	ld	[%i0 + 0x10], %l3
	.word	0x29480003	! t0_kref+0x4010:   	fbl,a,pt	%fcc0, _kref+0x401c
	.word	0xbfb70d60	! t0_kref+0x4014:   	fnot1s	%f28, %f31
	.word	0xb5b68e3d	! t0_kref+0x4018:   	fands	%f26, %f29, %f26
	.word	0xeb6e001b	! t0_kref+0x401c:   	prefetch	%i0 + %i3, 21
	.word	0xb5b607dc	! t0_kref+0x4020:   	pdist	%f24, %f28, %f26
	.word	0xd200a004	! t0_kref+0x4024:   	ld	[%g2 + 4], %o1
	.word	0xec063fe8	! t0_kref+0x4028:   	ld	[%i0 - 0x18], %l6
	.word	0xd650a018	! t0_kref+0x402c:   	ldsh	[%g2 + 0x18], %o3
	.word	0x36800001	! t0_kref+0x4030:   	bge,a	_kref+0x4034
	.word	0xe850a012	! t0_kref+0x4034:   	ldsh	[%g2 + 0x12], %l4
	.word	0xda30a020	! t0_kref+0x4038:   	sth	%o5, [%g2 + 0x20]
	.word	0xd00e3fe0	! t0_kref+0x403c:   	ldub	[%i0 - 0x20], %o0
	.word	0x2d800008	! t0_kref+0x4040:   	fbg,a	_kref+0x4060
	.word	0xb1b78dba	! t0_kref+0x4044:   	fxors	%f30, %f26, %f24
	.word	0xb5a709bf	! t0_kref+0x4048:   	fdivs	%f28, %f31, %f26
	.word	0xd2881018	! t0_kref+0x404c:   	lduba	[%g0 + %i0]0x80, %o1
	.word	0xf300a038	! t0_kref+0x4050:   	ld	[%g2 + 0x38], %f25
	.word	0xd2067ff8	! t0_kref+0x4054:   	ld	[%i1 - 8], %o1
	.word	0xae13400d	! t0_kref+0x4058:   	or	%o5, %o5, %l7
	.word	0xda2e6005	! t0_kref+0x405c:   	stb	%o5, [%i1 + 5]
	.word	0xb1b00fc0	! t0_kref+0x4060:   	fone	%f24
	.word	0x9093400d	! t0_kref+0x4064:   	orcc	%o5, %o5, %o0
	.word	0x97b3410d	! t0_kref+0x4068:   	edge32	%o5, %o5, %o3
	.word	0xe80e0000	! t0_kref+0x406c:   	ldub	[%i0], %l4
	.word	0xe8562014	! t0_kref+0x4070:   	ldsh	[%i0 + 0x14], %l4
	.word	0x81af0a58	! t0_kref+0x4074:   	fcmpd	%fcc0, %f28, %f24
	.word	0xbba0053b	! t0_kref+0x4078:   	fsqrts	%f27, %f29
	.word	0xbfa01899	! t0_kref+0x407c:   	fitos	%f25, %f31
	.word	0xb9b6891c	! t0_kref+0x4080:   	faligndata	%f26, %f28, %f28
	.word	0xda30a00e	! t0_kref+0x4084:   	sth	%o5, [%g2 + 0xe]
	.word	0xda28a011	! t0_kref+0x4088:   	stb	%o5, [%g2 + 0x11]
	.word	0xe81e0000	! t0_kref+0x408c:   	ldd	[%i0], %l4
	.word	0xee000019	! t0_kref+0x4090:   	ld	[%g0 + %i1], %l7
	.word	0xda20a014	! t0_kref+0x4094:   	st	%o5, [%g2 + 0x14]
	.word	0x81aeca3f	! t0_kref+0x4098:   	fcmps	%fcc0, %f27, %f31
	.word	0xa9b78518	! t0_kref+0x409c:   	fcmpgt16	%f30, %f24, %l4
	.word	0xb1a018da	! t0_kref+0x40a0:   	fdtos	%f26, %f24
	.word	0x9de3bfa0	! t0_kref+0x40a4:   	save	%sp, -0x60, %sp
	.word	0x93ee801b	! t0_kref+0x40a8:   	restore	%i2, %i3, %o1
	.word	0xb7a8c03d	! t0_kref+0x40ac:   	fmovsul	%fcc0, %f29, %f27
	.word	0x95418000	! t0_kref+0x40b0:   	mov	%fprs, %o2
	.word	0xa9b6045a	! t0_kref+0x40b4:   	fcmpne16	%f24, %f26, %l4
	.word	0xe01e0000	! t0_kref+0x40b8:   	ldd	[%i0], %l0
	.word	0xe8166008	! t0_kref+0x40bc:   	lduh	[%i1 + 8], %l4
	.word	0xd40e0000	! t0_kref+0x40c0:   	ldub	[%i0], %o2
	.word	0xb9a0193b	! t0_kref+0x40c4:   	fstod	%f27, %f28
	.word	0xee062010	! t0_kref+0x40c8:   	ld	[%i0 + 0x10], %l7
	.word	0xf700a038	! t0_kref+0x40cc:   	ld	[%g2 + 0x38], %f27
	.word	0xf700a038	! t0_kref+0x40d0:   	ld	[%g2 + 0x38], %f27
	.word	0x81ae0a3e	! t0_kref+0x40d4:   	fcmps	%fcc0, %f24, %f30
	.word	0xb1b68f98	! t0_kref+0x40d8:   	for	%f26, %f24, %f24
	.word	0xf3063ff4	! t0_kref+0x40dc:   	ld	[%i0 - 0xc], %f25
	.word	0xd216001b	! t0_kref+0x40e0:   	lduh	[%i0 + %i3], %o1
	.word	0xe60e7fee	! t0_kref+0x40e4:   	ldub	[%i1 - 0x12], %l3
	.word	0xda2e7fff	! t0_kref+0x40e8:   	stb	%o5, [%i1 - 1]
	.word	0xd2563ffe	! t0_kref+0x40ec:   	ldsh	[%i0 - 2], %o1
	.word	0xd0562000	! t0_kref+0x40f0:   	ldsh	[%i0], %o0
	.word	0xd4067fe4	! t0_kref+0x40f4:   	ld	[%i1 - 0x1c], %o2
	.word	0xbda0191a	! t0_kref+0x40f8:   	fitod	%f26, %f30
	.word	0xf1bf5a59	! t0_kref+0x40fc:   	stda	%f24, [%i5 + %i1]0xd2
	.word	0xaf418000	! t0_kref+0x4100:   	mov	%fprs, %l7
	.word	0xf500a034	! t0_kref+0x4104:   	ld	[%g2 + 0x34], %f26
	.word	0xae1b400d	! t0_kref+0x4108:   	xor	%o5, %o5, %l7
	.word	0xae2b400d	! t0_kref+0x410c:   	andn	%o5, %o5, %l7
	.word	0xbdb70a18	! t0_kref+0x4110:   	fpadd16	%f28, %f24, %f30
	.word	0xb9b64e3e	! t0_kref+0x4114:   	fands	%f25, %f30, %f28
	.word	0xd64e0000	! t0_kref+0x4118:   	ldsb	[%i0], %o3
	.word	0xb9b68cbe	! t0_kref+0x411c:   	fandnot2s	%f26, %f30, %f28
	.word	0xea00a004	! t0_kref+0x4120:   	ld	[%g2 + 4], %l5
	.word	0xac63400d	! t0_kref+0x4124:   	subc	%o5, %o5, %l6
	.word	0xff00a020	! t0_kref+0x4128:   	ld	[%g2 + 0x20], %f31
	.word	0xee50a01c	! t0_kref+0x412c:   	ldsh	[%g2 + 0x1c], %l7
	.word	0xf506600c	! t0_kref+0x4130:   	ld	[%i1 + 0xc], %f26
	.word	0xb3b00fe0	! t0_kref+0x4134:   	fones	%f25
	.word	0xda30a00a	! t0_kref+0x4138:   	sth	%o5, [%g2 + 0xa]
	.word	0x2f800008	! t0_kref+0x413c:   	fbu,a	_kref+0x415c
	.word	0xa770000d	! t0_kref+0x4140:   	popc	%o5, %l3
	.word	0xb9b68db8	! t0_kref+0x4144:   	fxors	%f26, %f24, %f28
	.word	0x95b34240	! t0_kref+0x4148:   	array16	%o5, %g0, %o2
	.word	0xe60e600e	! t0_kref+0x414c:   	ldub	[%i1 + 0xe], %l3
	.word	0xec08a00a	! t0_kref+0x4150:   	ldub	[%g2 + 0xa], %l6
	.word	0xa944c000	! t0_kref+0x4154:   	mov	%gsr, %l4
	.word	0xb1b6ca7e	! t0_kref+0x4158:   	fpadd32s	%f27, %f30, %f24
	.word	0xaee3400d	! t0_kref+0x415c:   	subccc	%o5, %o5, %l7
	.word	0xd20e001a	! t0_kref+0x4160:   	ldub	[%i0 + %i2], %o1
	.word	0xf1be588d	! t0_kref+0x4164:   	stda	%f24, [%i1 + %o5]0xc4
	.word	0xec4e3fe1	! t0_kref+0x4168:   	ldsb	[%i0 - 0x1f], %l6
	.word	0xee50a020	! t0_kref+0x416c:   	ldsh	[%g2 + 0x20], %l7
	.word	0xabb3432d	! t0_kref+0x4170:   	bmask	%o5, %o5, %l5
	.word	0xd2067ffc	! t0_kref+0x4174:   	ld	[%i1 - 4], %o1
	.word	0xf11e3ff0	! t0_kref+0x4178:   	ldd	[%i0 - 0x10], %f24
	.word	0x95400000	! t0_kref+0x417c:   	mov	%y, %o2
	.word	0xea0e7fe0	! t0_kref+0x4180:   	ldub	[%i1 - 0x20], %l5
	.word	0x91b7841a	! t0_kref+0x4184:   	fcmple16	%f30, %f26, %o0
	.word	0xda30a03c	! t0_kref+0x4188:   	sth	%o5, [%g2 + 0x3c]
	.word	0xf5063ff0	! t0_kref+0x418c:   	ld	[%i0 - 0x10], %f26
	.word	0xb7a609bf	! t0_kref+0x4190:   	fdivs	%f24, %f31, %f27
	.word	0x20800004	! t0_kref+0x4194:   	bn,a	_kref+0x41a4
	.word	0x97408000	! t0_kref+0x4198:   	mov	%ccr, %o3
	.word	0xea56c019	! t0_kref+0x419c:   	ldsh	[%i3 + %i1], %l5
	.word	0xbdb60e5e	! t0_kref+0x41a0:   	fxnor	%f24, %f30, %f30
	.word	0xee062018	! t0_kref+0x41a4:   	ld	[%i0 + 0x18], %l7
	.word	0xda30a024	! t0_kref+0x41a8:   	sth	%o5, [%g2 + 0x24]
	.word	0xbbb00f3e	! t0_kref+0x41ac:   	fsrc2s	%f30, %f29
	.word	0xf9be588d	! t0_kref+0x41b0:   	stda	%f28, [%i1 + %o5]0xc4
	.word	0xacbb7fba	! t0_kref+0x41b4:   	xnorcc	%o5, -0x46, %l6
	.word	0xbda0055c	! t0_kref+0x41b8:   	fsqrtd	%f28, %f30
	.word	0xda2e3ffb	! t0_kref+0x41bc:   	stb	%o5, [%i0 - 5]
	.word	0xda30a01a	! t0_kref+0x41c0:   	sth	%o5, [%g2 + 0x1a]
	.word	0x91b3408d	! t0_kref+0x41c4:   	edge16	%o5, %o5, %o0
	.word	0xf3000018	! t0_kref+0x41c8:   	ld	[%g0 + %i0], %f25
	.word	0xb5a0013c	! t0_kref+0x41cc:   	fabss	%f28, %f26
	.word	0xbba709bc	! t0_kref+0x41d0:   	fdivs	%f28, %f28, %f29
	.word	0xb9b7471f	! t0_kref+0x41d4:   	fmuld8sux16	%f29, %f31, %f28
	.word	0xbdb00cda	! t0_kref+0x41d8:   	fnot2	%f26, %f30
	.word	0xe606401c	! t0_kref+0x41dc:   	ld	[%i1 + %i4], %l3
	.word	0x95b7851e	! t0_kref+0x41e0:   	fcmpgt16	%f30, %f30, %o2
	.word	0xa9b3432d	! t0_kref+0x41e4:   	bmask	%o5, %o5, %l4
	.word	0xb610201c	! t0_kref+0x41e8:   	mov	0x1c, %i3
	.word	0x969361f5	! t0_kref+0x41ec:   	orcc	%o5, 0x1f5, %o3
	.word	0xec0e0000	! t0_kref+0x41f0:   	ldub	[%i0], %l6
	.word	0x92b37a78	! t0_kref+0x41f4:   	orncc	%o5, -0x588, %o1
	.word	0xf11e3ff8	! t0_kref+0x41f8:   	ldd	[%i0 - 8], %f24
	.word	0xbfa0003b	! t0_kref+0x41fc:   	fmovs	%f27, %f31
	.word	0xb7a609bf	! t0_kref+0x4200:   	fdivs	%f24, %f31, %f27
	.word	0xbfb78d3c	! t0_kref+0x4204:   	fandnot1s	%f30, %f28, %f31
	.word	0xb1b68d98	! t0_kref+0x4208:   	fxor	%f26, %f24, %f24
	.word	0xe64e8019	! t0_kref+0x420c:   	ldsb	[%i2 + %i1], %l3
	.word	0xb5a649b9	! t0_kref+0x4210:   	fdivs	%f25, %f25, %f26
	.word	0xe5ee501c	! t0_kref+0x4214:   	prefetcha	%i1 + %i4, 18
	.word	0xb6102004	! t0_kref+0x4218:   	mov	0x4, %i3
	.word	0xaa0b6271	! t0_kref+0x421c:   	and	%o5, 0x271, %l5
	.word	0xac9b737e	! t0_kref+0x4220:   	xorcc	%o5, -0xc82, %l6
	.word	0x91b3432d	! t0_kref+0x4224:   	bmask	%o5, %o5, %o0
	.word	0xd200a00c	! t0_kref+0x4228:   	ld	[%g2 + 0xc], %o1
	.word	0xd6080019	! t0_kref+0x422c:   	ldub	[%g0 + %i1], %o3
	.word	0xab33400d	! t0_kref+0x4230:   	srl	%o5, %o5, %l5
	.word	0xb5a01a3e	! t0_kref+0x4234:   	fstoi	%f30, %f26
	.word	0xbdb64ef8	! t0_kref+0x4238:   	fornot2s	%f25, %f24, %f30
	.word	0xfb20a024	! t0_kref+0x423c:   	st	%f29, [%g2 + 0x24]
	.word	0xd60e4000	! t0_kref+0x4240:   	ldub	[%i1], %o3
	.word	0xda30a016	! t0_kref+0x4244:   	sth	%o5, [%g2 + 0x16]
	.word	0x93b340cd	! t0_kref+0x4248:   	edge16l	%o5, %o5, %o1
	.word	0xbdb6073f	! t0_kref+0x424c:   	fmuld8ulx16	%f24, %f31, %f30
	.word	0xb1a0055c	! t0_kref+0x4250:   	fsqrtd	%f28, %f24
	.word	0xa7b340cd	! t0_kref+0x4254:   	edge16l	%o5, %o5, %l3
	.word	0xb1b00c00	! t0_kref+0x4258:   	fzero	%f24
	.word	0xbba0189b	! t0_kref+0x425c:   	fitos	%f27, %f29
	.word	0xbfa789be	! t0_kref+0x4260:   	fdivs	%f30, %f30, %f31
	.word	0x8143c000	! t0_kref+0x4264:   	stbar
	.word	0xa7836be4	! t0_kref+0x4268:   	wr	%o5, 0xbe4, %gsr
	.word	0xf1be9a19	! t0_kref+0x426c:   	stda	%f24, [%i2 + %i1]0xd0
	.word	0xda260000	! t0_kref+0x4270:   	st	%o5, [%i0]
	.word	0xa9b605d8	! t0_kref+0x4274:   	fcmpeq32	%f24, %f24, %l4
	.word	0xbba789b9	! t0_kref+0x4278:   	fdivs	%f30, %f25, %f29
	.word	0xe84e0000	! t0_kref+0x427c:   	ldsb	[%i0], %l4
	.word	0xd210a00c	! t0_kref+0x4280:   	lduh	[%g2 + 0xc], %o1
	.word	0xb5a689ba	! t0_kref+0x4284:   	fdivs	%f26, %f26, %f26
	.word	0xff00a034	! t0_kref+0x4288:   	ld	[%g2 + 0x34], %f31
	.word	0xbdb64979	! t0_kref+0x428c:   	fpmerge	%f25, %f25, %f30
	.word	0xab2366c3	! t0_kref+0x4290:   	mulscc	%o5, 0x6c3, %l5
	.word	0x913b400d	! t0_kref+0x4294:   	sra	%o5, %o5, %o0
	.word	0xb5b6473e	! t0_kref+0x4298:   	fmuld8ulx16	%f25, %f30, %f26
	.word	0x292d8046	! t0_kref+0x429c:   	sethi	%hi(0xb6011800), %l4
	.word	0xb9b78a1a	! t0_kref+0x42a0:   	fpadd16	%f30, %f26, %f28
	.word	0xda20a02c	! t0_kref+0x42a4:   	st	%o5, [%g2 + 0x2c]
	.word	0xd4560000	! t0_kref+0x42a8:   	ldsh	[%i0], %o2
	.word	0xb5a0053c	! t0_kref+0x42ac:   	fsqrts	%f28, %f26
	.word	0x2e800002	! t0_kref+0x42b0:   	bvs,a	_kref+0x42b8
	.word	0xb5b60d9c	! t0_kref+0x42b4:   	fxor	%f24, %f28, %f26
	.word	0x9fc00004	! t0_kref+0x42b8:   	call	%g0 + %g4
	.word	0xda366002	! t0_kref+0x42bc:   	sth	%o5, [%i1 + 2]
	.word	0xbdb64efd	! t0_kref+0x42c0:   	fornot2s	%f25, %f29, %f30
	.word	0x3a800001	! t0_kref+0x42c4:   	bcc,a	_kref+0x42c8
	.word	0xe6000019	! t0_kref+0x42c8:   	ld	[%g0 + %i1], %l3
	.word	0xacab68bb	! t0_kref+0x42cc:   	andncc	%o5, 0x8bb, %l6
	.word	0xee961000	! t0_kref+0x42d0:   	lduha	[%i0]0x80, %l7
	.word	0x97b34240	! t0_kref+0x42d4:   	array16	%o5, %g0, %o3
	.word	0xadb3430d	! t0_kref+0x42d8:   	alignaddr	%o5, %o5, %l6
	.word	0xb9a7c9bd	! t0_kref+0x42dc:   	fdivs	%f31, %f29, %f28
	.word	0xb1b00c20	! t0_kref+0x42e0:   	fzeros	%f24
	.word	0xe8564000	! t0_kref+0x42e4:   	ldsh	[%i1], %l4
	.word	0xae8360c7	! t0_kref+0x42e8:   	addcc	%o5, 0xc7, %l7
	.word	0xbfa7c9ba	! t0_kref+0x42ec:   	fdivs	%f31, %f26, %f31
	.word	0xe8164000	! t0_kref+0x42f0:   	lduh	[%i1], %l4
	.word	0xe656c018	! t0_kref+0x42f4:   	ldsh	[%i3 + %i0], %l3
	.word	0xb1b60e18	! t0_kref+0x42f8:   	fand	%f24, %f24, %f24
	.word	0xb5b70c7d	! t0_kref+0x42fc:   	fnors	%f28, %f29, %f26
	.word	0xb7a0053b	! t0_kref+0x4300:   	fsqrts	%f27, %f27
	.word	0xb1b68edc	! t0_kref+0x4304:   	fornot2	%f26, %f28, %f24
	.word	0xb5a0053a	! t0_kref+0x4308:   	fsqrts	%f26, %f26
	.word	0xa813400d	! t0_kref+0x430c:   	or	%o5, %o5, %l4
	.word	0xb5b60c5c	! t0_kref+0x4310:   	fnor	%f24, %f28, %f26
	.word	0x91b3434d	! t0_kref+0x4314:   	alignaddrl	%o5, %o5, %o0
	.word	0x94bb61c5	! t0_kref+0x4318:   	xnorcc	%o5, 0x1c5, %o2
	.word	0xb1b60d98	! t0_kref+0x431c:   	fxor	%f24, %f24, %f24
	.word	0xd6162006	! t0_kref+0x4320:   	lduh	[%i0 + 6], %o3
	.word	0xb1b64979	! t0_kref+0x4324:   	fpmerge	%f25, %f25, %f24
	.word	0x8583400d	! t0_kref+0x4328:   	wr	%o5, %o5, %ccr
	.word	0xe808a003	! t0_kref+0x432c:   	ldub	[%g2 + 3], %l4
	.word	0x91b3410d	! t0_kref+0x4330:   	edge32	%o5, %o5, %o0
	.word	0xa85b691f	! t0_kref+0x4334:   	smul	%o5, 0x91f, %l4
	.word	0x9123400d	! t0_kref+0x4338:   	mulscc	%o5, %o5, %o0
	.word	0xec560000	! t0_kref+0x433c:   	ldsh	[%i0], %l6
	.word	0xadb340cd	! t0_kref+0x4340:   	edge16l	%o5, %o5, %l6
	.word	0xadb3432d	! t0_kref+0x4344:   	bmask	%o5, %o5, %l6
	.word	0xe6164000	! t0_kref+0x4348:   	lduh	[%i1], %l3
	.word	0xea164000	! t0_kref+0x434c:   	lduh	[%i1], %l5
	.word	0xbda609ba	! t0_kref+0x4350:   	fdivs	%f24, %f26, %f30
	.word	0xb5b68ab8	! t0_kref+0x4354:   	fpsub16s	%f26, %f24, %f26
	.word	0xbdb78c58	! t0_kref+0x4358:   	fnor	%f30, %f24, %f30
	.word	0xb9b78d98	! t0_kref+0x435c:   	fxor	%f30, %f24, %f28
	.word	0xb7a609bb	! t0_kref+0x4360:   	fdivs	%f24, %f27, %f27
	.word	0x9de3bfa0	! t0_kref+0x4364:   	save	%sp, -0x60, %sp
	.word	0xb48e4000	! t0_kref+0x4368:   	andcc	%i1, %g0, %i2
	.word	0xa7ee4019	! t0_kref+0x436c:   	restore	%i1, %i1, %l3
	.word	0xa7b340cd	! t0_kref+0x4370:   	edge16l	%o5, %o5, %l3
	.word	0xe60e2013	! t0_kref+0x4374:   	ldub	[%i0 + 0x13], %l3
	.word	0xb5b60d98	! t0_kref+0x4378:   	fxor	%f24, %f24, %f26
	.word	0xd04e7fea	! t0_kref+0x437c:   	ldsb	[%i1 - 0x16], %o0
	.word	0xa9b3416d	! t0_kref+0x4380:   	edge32ln	%o5, %o5, %l4
	.word	0xe816201a	! t0_kref+0x4384:   	lduh	[%i0 + 0x1a], %l4
	.word	0xd0480019	! t0_kref+0x4388:   	ldsb	[%g0 + %i1], %o0
	.word	0xb5a6c9b8	! t0_kref+0x438c:   	fdivs	%f27, %f24, %f26
	.word	0xda30a00a	! t0_kref+0x4390:   	sth	%o5, [%g2 + 0xa]
	.word	0xae63400d	! t0_kref+0x4394:   	subc	%o5, %o5, %l7
	.word	0xaab3687d	! t0_kref+0x4398:   	orncc	%o5, 0x87d, %l5
	.word	0xd2167fe6	! t0_kref+0x439c:   	lduh	[%i1 - 0x1a], %o1
	.word	0xd40e7ffd	! t0_kref+0x43a0:   	ldub	[%i1 - 3], %o2
	.word	0xae737e41	! t0_kref+0x43a4:   	udiv	%o5, -0x1bf, %l7
	.word	0xfb066014	! t0_kref+0x43a8:   	ld	[%i1 + 0x14], %f29
	.word	0xb5b78ada	! t0_kref+0x43ac:   	fpsub32	%f30, %f26, %f26
	.word	0xb9b6091e	! t0_kref+0x43b0:   	faligndata	%f24, %f30, %f28
	.word	0xbdb70e5c	! t0_kref+0x43b4:   	fxnor	%f28, %f28, %f30
	.word	0xb5b686fa	! t0_kref+0x43b8:   	fmul8ulx16	%f26, %f26, %f26
	.word	0xda28a012	! t0_kref+0x43bc:   	stb	%o5, [%g2 + 0x12]
	.word	0xd6163ff2	! t0_kref+0x43c0:   	lduh	[%i0 - 0xe], %o3
	.word	0xa78372e8	! t0_kref+0x43c4:   	wr	%o5, 0xfffff2e8, %gsr
	.word	0xda30a036	! t0_kref+0x43c8:   	sth	%o5, [%g2 + 0x36]
	.word	0x92f37c07	! t0_kref+0x43cc:   	udivcc	%o5, -0x3f9, %o1
	.word	0xd000a014	! t0_kref+0x43d0:   	ld	[%g2 + 0x14], %o0
	.word	0xc078a02c	! t0_kref+0x43d4:   	swap	[%g2 + 0x2c], %g0
	.word	0xadb340ed	! t0_kref+0x43d8:   	edge16ln	%o5, %o5, %l6
	.word	0xef68a00b	! t0_kref+0x43dc:   	prefetch	%g2 + 0xb, 23
	.word	0xd200a004	! t0_kref+0x43e0:   	ld	[%g2 + 4], %o1
	.word	0xad44c000	! t0_kref+0x43e4:   	mov	%gsr, %l6
	.word	0x97b3404d	! t0_kref+0x43e8:   	edge8l	%o5, %o5, %o3
	.word	0xf300a020	! t0_kref+0x43ec:   	ld	[%g2 + 0x20], %f25
	.word	0xbda709da	! t0_kref+0x43f0:   	fdivd	%f28, %f26, %f30
	.word	0xb7a749bf	! t0_kref+0x43f4:   	fdivs	%f29, %f31, %f27
	.word	0xb9b00f3f	! t0_kref+0x43f8:   	fsrc2s	%f31, %f28
	.word	0xf3070018	! t0_kref+0x43fc:   	ld	[%i4 + %i0], %f25
	.word	0xb7a0053d	! t0_kref+0x4400:   	fsqrts	%f29, %f27
	.word	0xee50a002	! t0_kref+0x4404:   	ldsh	[%g2 + 2], %l7
	.word	0xb7a649bd	! t0_kref+0x4408:   	fdivs	%f25, %f29, %f27
	.word	0xb1a6c9bc	! t0_kref+0x440c:   	fdivs	%f27, %f28, %f24
	.word	0x27800005	! t0_kref+0x4410:   	fbul,a	_kref+0x4424
	.word	0xf300a014	! t0_kref+0x4414:   	ld	[%g2 + 0x14], %f25
	.word	0x92f3759a	! t0_kref+0x4418:   	udivcc	%o5, -0xa66, %o1
	.word	0xda28a02a	! t0_kref+0x441c:   	stb	%o5, [%g2 + 0x2a]
	.word	0x90bb400d	! t0_kref+0x4420:   	xnorcc	%o5, %o5, %o0
	.word	0xf9be1a1c	! t0_kref+0x4424:   	stda	%f28, [%i0 + %i4]0xd0
	.word	0xb9b68e5a	! t0_kref+0x4428:   	fxnor	%f26, %f26, %f28
	.word	0xe4680019	! t0_kref+0x442c:   	ldstub	[%g0 + %i1], %l2
	.word	0xda20a018	! t0_kref+0x4430:   	st	%o5, [%g2 + 0x18]
	.word	0xd640a034	! t0_kref+0x4434:   	ldsw	[%g2 + 0x34], %o3
	.word	0xd6567fe6	! t0_kref+0x4438:   	ldsh	[%i1 - 0x1a], %o3
	.word	0xf720a030	! t0_kref+0x443c:   	st	%f27, [%g2 + 0x30]
	.word	0xbfb00fe0	! t0_kref+0x4440:   	fones	%f31
	.word	0xbdb7497b	! t0_kref+0x4444:   	fpmerge	%f29, %f27, %f30
	.word	0xb1b78e80	! t0_kref+0x4448:   	fsrc1	%f30, %f24
	.word	0xec0e8018	! t0_kref+0x444c:   	ldub	[%i2 + %i0], %l6
	.word	0xaa3b400d	! t0_kref+0x4450:   	xnor	%o5, %o5, %l5
	.word	0x81834000	! t0_kref+0x4454:   	wr	%o5, %g0, %y
	.word	0xec066008	! t0_kref+0x4458:   	ld	[%i1 + 8], %l6
	.word	0x95408000	! t0_kref+0x445c:   	mov	%ccr, %o2
	.word	0xbdb00cda	! t0_kref+0x4460:   	fnot2	%f26, %f30
	.word	0xd04e601d	! t0_kref+0x4464:   	ldsb	[%i1 + 0x1d], %o0
	.word	0xe610a02c	! t0_kref+0x4468:   	lduh	[%g2 + 0x2c], %l3
	.word	0xb9b7497d	! t0_kref+0x446c:   	fpmerge	%f29, %f29, %f28
	.word	0xf11e001d	! t0_kref+0x4470:   	ldd	[%i0 + %i5], %f24
	.word	0xe816c019	! t0_kref+0x4474:   	lduh	[%i3 + %i1], %l4
	.word	0xb1a0053c	! t0_kref+0x4478:   	fsqrts	%f28, %f24
	.word	0xbfa689ba	! t0_kref+0x447c:   	fdivs	%f26, %f26, %f31
	.word	0xd64e4000	! t0_kref+0x4480:   	ldsb	[%i1], %o3
	.word	0xb1b009b9	! t0_kref+0x4484:   	fexpand	%f25, %f24
	.word	0xbfa00539	! t0_kref+0x4488:   	fsqrts	%f25, %f31
	.word	0xac1b6822	! t0_kref+0x448c:   	xor	%o5, 0x822, %l6
	.word	0xa7b7041a	! t0_kref+0x4490:   	fcmple16	%f28, %f26, %l3
	.word	0xd44e8018	! t0_kref+0x4494:   	ldsb	[%i2 + %i0], %o2
	.word	0xea563fe6	! t0_kref+0x4498:   	ldsh	[%i0 - 0x1a], %l5
	.word	0xbdb7063c	! t0_kref+0x449c:   	fmul8x16	%f28, %f28, %f30
	.word	0x2a800008	! t0_kref+0x44a0:   	bcs,a	_kref+0x44c0
	.word	0xd60e001a	! t0_kref+0x44a4:   	ldub	[%i0 + %i2], %o3
	.word	0xd4080018	! t0_kref+0x44a8:   	ldub	[%g0 + %i0], %o2
	.word	0xf900a028	! t0_kref+0x44ac:   	ld	[%g2 + 0x28], %f28
	.word	0xe2ee5000	! t0_kref+0x44b0:   	ldstuba	[%i1]0x80, %l1
	.word	0xd448a01a	! t0_kref+0x44b4:   	ldsb	[%g2 + 0x1a], %o2
	.word	0xda26401c	! t0_kref+0x44b8:   	st	%o5, [%i1 + %i4]
	.word	0x85837eb8	! t0_kref+0x44bc:   	wr	%o5, 0xfffffeb8, %ccr
	.word	0xe650a02c	! t0_kref+0x44c0:   	ldsh	[%g2 + 0x2c], %l3
	.word	0xda30a018	! t0_kref+0x44c4:   	sth	%o5, [%g2 + 0x18]
	.word	0x95b34280	! t0_kref+0x44c8:   	array32	%o5, %g0, %o2
	.word	0xdaf61000	! t0_kref+0x44cc:   	stxa	%o5, [%i0]0x80
	.word	0xbda01a3d	! t0_kref+0x44d0:   	fstoi	%f29, %f30
	.word	0xf7066010	! t0_kref+0x44d4:   	ld	[%i1 + 0x10], %f27
	.word	0xb7a0189d	! t0_kref+0x44d8:   	fitos	%f29, %f27
	.word	0xafb3404d	! t0_kref+0x44dc:   	edge8l	%o5, %o5, %l7
	.word	0xda28a034	! t0_kref+0x44e0:   	stb	%o5, [%g2 + 0x34]
	.word	0xb5a60858	! t0_kref+0x44e4:   	faddd	%f24, %f24, %f26
	.word	0xa7b7045c	! t0_kref+0x44e8:   	fcmpne16	%f28, %f28, %l3
	.word	0xda30a02c	! t0_kref+0x44ec:   	sth	%o5, [%g2 + 0x2c]
	.word	0xb5a0053b	! t0_kref+0x44f0:   	fsqrts	%f27, %f26
	.word	0xb5a7083b	! t0_kref+0x44f4:   	fadds	%f28, %f27, %f26
	.word	0xee00a010	! t0_kref+0x44f8:   	ld	[%g2 + 0x10], %l7
	.word	0xd2062014	! t0_kref+0x44fc:   	ld	[%i0 + 0x14], %o1
	.word	0xda362016	! t0_kref+0x4500:   	sth	%o5, [%i0 + 0x16]
	.word	0xd20e3ffb	! t0_kref+0x4504:   	ldub	[%i0 - 5], %o1
	.word	0xf11f4019	! t0_kref+0x4508:   	ldd	[%i5 + %i1], %f24
	.word	0xda26401c	! t0_kref+0x450c:   	st	%o5, [%i1 + %i4]
	.word	0xa73b400d	! t0_kref+0x4510:   	sra	%o5, %o5, %l3
	.word	0xabb7841e	! t0_kref+0x4514:   	fcmple16	%f30, %f30, %l5
	.word	0x9de3bfa0	! t0_kref+0x4518:   	save	%sp, -0x60, %sp
	.word	0xade8001a	! t0_kref+0x451c:   	restore	%g0, %i2, %l6
	.word	0xc07e2004	! t0_kref+0x4520:   	swap	[%i0 + 4], %g0
	.word	0xe8166000	! t0_kref+0x4524:   	lduh	[%i1], %l4
	.word	0x33800001	! t0_kref+0x4528:   	fbe,a	_kref+0x452c
	.word	0xd450a03e	! t0_kref+0x452c:   	ldsh	[%g2 + 0x3e], %o2
	.word	0xbda01058	! t0_kref+0x4530:   	fdtox	%f24, %f30
	.word	0x81af8a5e	! t0_kref+0x4534:   	fcmpd	%fcc0, %f30, %f30
	.word	0xabb34240	! t0_kref+0x4538:   	array16	%o5, %g0, %l5
	.word	0x8583400d	! t0_kref+0x453c:   	wr	%o5, %o5, %ccr
	.word	0xb1b7863e	! t0_kref+0x4540:   	fmul8x16	%f30, %f30, %f24
	.word	0xe84e600c	! t0_kref+0x4544:   	ldsb	[%i1 + 0xc], %l4
	.word	0xbfa01a5e	! t0_kref+0x4548:   	fdtoi	%f30, %f31
	.word	0xee567ff6	! t0_kref+0x454c:   	ldsh	[%i1 - 0xa], %l7
	.word	0xb5b707dc	! t0_kref+0x4550:   	pdist	%f28, %f28, %f26
	.word	0xb7b78fb9	! t0_kref+0x4554:   	fors	%f30, %f25, %f27
	.word	0xa7b3412d	! t0_kref+0x4558:   	edge32n	%o5, %o5, %l3
	.word	0xa93b400d	! t0_kref+0x455c:   	sra	%o5, %o5, %l4
	.word	0x941b400d	! t0_kref+0x4560:   	xor	%o5, %o5, %o2
	.word	0xff00a014	! t0_kref+0x4564:   	ld	[%g2 + 0x14], %f31
	.word	0x9013752b	! t0_kref+0x4568:   	or	%o5, -0xad5, %o0
	.word	0xd256001b	! t0_kref+0x456c:   	ldsh	[%i0 + %i3], %o1
	.word	0xda2e601c	! t0_kref+0x4570:   	stb	%o5, [%i1 + 0x1c]
	.word	0x952b400d	! t0_kref+0x4574:   	sll	%o5, %o5, %o2
	.word	0xea0e7ff3	! t0_kref+0x4578:   	ldub	[%i1 - 0xd], %l5
	.word	0xa9b6845e	! t0_kref+0x457c:   	fcmpne16	%f26, %f30, %l4
	.word	0xb7b74db9	! t0_kref+0x4580:   	fxors	%f29, %f25, %f27
	.word	0xb7a0053b	! t0_kref+0x4584:   	fsqrts	%f27, %f27
	.word	0x8583400d	! t0_kref+0x4588:   	wr	%o5, %o5, %ccr
	.word	0xa970000d	! t0_kref+0x458c:   	popc	%o5, %l4
	.word	0xf300a014	! t0_kref+0x4590:   	ld	[%g2 + 0x14], %f25
	.word	0xbbb78d60	! t0_kref+0x4594:   	fnot1s	%f30, %f29
	.word	0xb3a0053a	! t0_kref+0x4598:   	fsqrts	%f26, %f25
	.word	0xb5a0055e	! t0_kref+0x459c:   	fsqrtd	%f30, %f26
	.word	0x949b400d	! t0_kref+0x45a0:   	xorcc	%o5, %o5, %o2
	.word	0xbdb00fc0	! t0_kref+0x45a4:   	fone	%f30
	.word	0xd050a028	! t0_kref+0x45a8:   	ldsh	[%g2 + 0x28], %o0
	.word	0xb7a608bd	! t0_kref+0x45ac:   	fsubs	%f24, %f29, %f27
	.word	0xda20a034	! t0_kref+0x45b0:   	st	%o5, [%g2 + 0x34]
	.word	0xaa9b400d	! t0_kref+0x45b4:   	xorcc	%o5, %o5, %l5
	.word	0xb9b7c67a	! t0_kref+0x45b8:   	fmul8x16au	%f31, %f26, %f28
	.word	0xbfa609bd	! t0_kref+0x45bc:   	fdivs	%f24, %f29, %f31
	.word	0xb5a0053a	! t0_kref+0x45c0:   	fsqrts	%f26, %f26
	.word	0xbdb68d9c	! t0_kref+0x45c4:   	fxor	%f26, %f28, %f30
	.word	0x8d8369b3	! t0_kref+0x45c8:   	wr	%o5, 0x9b3, %fprs
	.word	0xa783400d	! t0_kref+0x45cc:   	wr	%o5, %o5, %gsr
	.word	0xb5b707de	! t0_kref+0x45d0:   	pdist	%f28, %f30, %f26
	.word	0x9770000d	! t0_kref+0x45d4:   	popc	%o5, %o3
	.word	0xb9a0053c	! t0_kref+0x45d8:   	fsqrts	%f28, %f28
	.word	0xf19e5a1b	! t0_kref+0x45dc:   	ldda	[%i1 + %i3]0xd0, %f24
	.word	0xa7b3404d	! t0_kref+0x45e0:   	edge8l	%o5, %o5, %l3
	.word	0xe8480018	! t0_kref+0x45e4:   	ldsb	[%g0 + %i0], %l4
	.word	0xe8166016	! t0_kref+0x45e8:   	lduh	[%i1 + 0x16], %l4
	.word	0xb1b68a1e	! t0_kref+0x45ec:   	fpadd16	%f26, %f30, %f24
	.word	0xabb3430d	! t0_kref+0x45f0:   	alignaddr	%o5, %o5, %l5
	.word	0xf51e6010	! t0_kref+0x45f4:   	ldd	[%i1 + 0x10], %f26
	.word	0xd256201c	! t0_kref+0x45f8:   	ldsh	[%i0 + 0x1c], %o1
	.word	0xb5a0055c	! t0_kref+0x45fc:   	fsqrtd	%f28, %f26
	.word	0xf720a000	! t0_kref+0x4600:   	st	%f27, [%g2]
	.word	0xadb3410d	! t0_kref+0x4604:   	edge32	%o5, %o5, %l6
	.word	0xfd000019	! t0_kref+0x4608:   	ld	[%g0 + %i1], %f30
	.word	0x81db8009	! t0_kref+0x460c:   	flush	%sp + %o1
	.word	0xd250a032	! t0_kref+0x4610:   	ldsh	[%g2 + 0x32], %o1
	.word	0xec06001c	! t0_kref+0x4614:   	ld	[%i0 + %i4], %l6
	.word	0xb1a0053b	! t0_kref+0x4618:   	fsqrts	%f27, %f24
	.word	0xb9a688ba	! t0_kref+0x461c:   	fsubs	%f26, %f26, %f28
	.word	0xbbb60fbc	! t0_kref+0x4620:   	fors	%f24, %f28, %f29
	.word	0xbda0053a	! t0_kref+0x4624:   	fsqrts	%f26, %f30
	.word	0xb9b00fe0	! t0_kref+0x4628:   	fones	%f28
	.word	0xa744c000	! t0_kref+0x462c:   	mov	%gsr, %l3
	.word	0xb9b70e5e	! t0_kref+0x4630:   	fxnor	%f28, %f30, %f28
	.word	0xc16e000d	! t0_kref+0x4634:   	prefetch	%i0 + %o5, 0
	.word	0x31800002	! t0_kref+0x4638:   	fba,a	_kref+0x4640
	.word	0xda300019	! t0_kref+0x463c:   	sth	%o5, [%g0 + %i1]
	.word	0xbba689bd	! t0_kref+0x4640:   	fdivs	%f26, %f29, %f29
	.word	0xd6563fea	! t0_kref+0x4644:   	ldsh	[%i0 - 0x16], %o3
	.word	0xbfa0053c	! t0_kref+0x4648:   	fsqrts	%f28, %f31
	.word	0xbdb6091a	! t0_kref+0x464c:   	faligndata	%f24, %f26, %f30
	call	1f
	.empty
	.word	0xbbb60fb8	! t0_kref+0x4654:   	fors	%f24, %f24, %f29
	.word	0xad33600a	! t0_kref+0x4658:   	srl	%o5, 0xa, %l6
	.word	0xb1a0053d	! t0_kref+0x465c:   	fsqrts	%f29, %f24
	.word	0xb9b74fb8	! t0_kref+0x4660:   	fors	%f29, %f24, %f28
	.word	0xee560000	! t0_kref+0x4664:   	ldsh	[%i0], %l7
	.word	0x95b3404d	! t0_kref+0x4668:   	edge8l	%o5, %o5, %o2
1:	.word	0xb9b00fc0	! t0_kref+0x466c:   	fone	%f28
	.word	0xe816401b	! t0_kref+0x4670:   	lduh	[%i1 + %i3], %l4
	.word	0xd20e6004	! t0_kref+0x4674:   	ldub	[%i1 + 4], %o1
	.word	0xa91b400d	! t0_kref+0x4678:   	tsubcctv	%o5, %o5, %l4
	.word	0x81de401e	! t0_kref+0x467c:   	flush	%i1 + %fp
	.word	0xb9a0189d	! t0_kref+0x4680:   	fitos	%f29, %f28
	.word	0xf51fbc50	! t0_kref+0x4684:   	ldd	[%fp - 0x3b0], %f26
	.word	0xe64e3fee	! t0_kref+0x4688:   	ldsb	[%i0 - 0x12], %l3
	.word	0xbbb64cba	! t0_kref+0x468c:   	fandnot2s	%f25, %f26, %f29
	.word	0xbda789bf	! t0_kref+0x4690:   	fdivs	%f30, %f31, %f30
	.word	0xbba0003b	! t0_kref+0x4694:   	fmovs	%f27, %f29
	.word	0xee067fe8	! t0_kref+0x4698:   	ld	[%i1 - 0x18], %l7
	.word	0xe800a000	! t0_kref+0x469c:   	ld	[%g2], %l4
	.word	0xbbb00f3d	! t0_kref+0x46a0:   	fsrc2s	%f29, %f29
	.word	0x24800003	! t0_kref+0x46a4:   	ble,a	_kref+0x46b0
	.word	0xbda0193e	! t0_kref+0x46a8:   	fstod	%f30, %f30
	.word	0xf91e6010	! t0_kref+0x46ac:   	ldd	[%i1 + 0x10], %f28
	.word	0x91b3434d	! t0_kref+0x46b0:   	alignaddrl	%o5, %o5, %o0
	.word	0x8d83400d	! t0_kref+0x46b4:   	wr	%o5, %o5, %fprs
	.word	0x90ab400d	! t0_kref+0x46b8:   	andncc	%o5, %o5, %o0
	.word	0xbfb60e3d	! t0_kref+0x46bc:   	fands	%f24, %f29, %f31
	.word	0xf99f1a19	! t0_kref+0x46c0:   	ldda	[%i4 + %i1]0xd0, %f28
	.word	0xad3b600d	! t0_kref+0x46c4:   	sra	%o5, 0xd, %l6
	.word	0xd24e401a	! t0_kref+0x46c8:   	ldsb	[%i1 + %i2], %o1
	.word	0x93703365	! t0_kref+0x46cc:   	popc	-0xc9b, %o1
	.word	0xa783783e	! t0_kref+0x46d0:   	wr	%o5, 0xfffff83e, %gsr
	.word	0xb6103ff4	! t0_kref+0x46d4:   	mov	0xfffffff4, %i3
	.word	0xf3264000	! t0_kref+0x46d8:   	st	%f25, [%i1]
	.word	0xf9062004	! t0_kref+0x46dc:   	ld	[%i0 + 4], %f28
	.word	0x9fc00004	! t0_kref+0x46e0:   	call	%g0 + %g4
	.word	0xb9b7ca7b	! t0_kref+0x46e4:   	fpadd32s	%f31, %f27, %f28
	.word	0xf700a010	! t0_kref+0x46e8:   	ld	[%g2 + 0x10], %f27
	.word	0xee4e001a	! t0_kref+0x46ec:   	ldsb	[%i0 + %i2], %l7
	.word	0xee00a000	! t0_kref+0x46f0:   	ld	[%g2], %l7
	.word	0xe6167ff8	! t0_kref+0x46f4:   	lduh	[%i1 - 8], %l3
	.word	0x21800002	! t0_kref+0x46f8:   	fbn,a	_kref+0x4700
	.word	0xee562010	! t0_kref+0x46fc:   	ldsh	[%i0 + 0x10], %l7
	.word	0x97b705d8	! t0_kref+0x4700:   	fcmpeq32	%f28, %f24, %o3
	.word	0xf5067ffc	! t0_kref+0x4704:   	ld	[%i1 - 4], %f26
	.word	0xb1a749be	! t0_kref+0x4708:   	fdivs	%f29, %f30, %f24
	.word	0xea08a009	! t0_kref+0x470c:   	ldub	[%g2 + 9], %l5
	.word	0x81ddbffe	! t0_kref+0x4710:   	flush	%l6 - 2
	.word	0xb9b00fc0	! t0_kref+0x4714:   	fone	%f28
	.word	0xaa3b78d1	! t0_kref+0x4718:   	xnor	%o5, -0x72f, %l5
	.word	0xfb00a018	! t0_kref+0x471c:   	ld	[%g2 + 0x18], %f29
	.word	0xf100a038	! t0_kref+0x4720:   	ld	[%g2 + 0x38], %f24
	.word	0xbdb68c58	! t0_kref+0x4724:   	fnor	%f26, %f24, %f30
	.word	0x95b3404d	! t0_kref+0x4728:   	edge8l	%o5, %o5, %o2
	.word	0xb810201c	! t0_kref+0x472c:   	mov	0x1c, %i4
	.word	0xea080018	! t0_kref+0x4730:   	ldub	[%g0 + %i0], %l5
	.word	0xbba7c9b9	! t0_kref+0x4734:   	fdivs	%f31, %f25, %f29
	.word	0xec4e2010	! t0_kref+0x4738:   	ldsb	[%i0 + 0x10], %l6
	.word	0xd250a016	! t0_kref+0x473c:   	ldsh	[%g2 + 0x16], %o1
	.word	0xa82372ae	! t0_kref+0x4740:   	sub	%o5, -0xd52, %l4
	.word	0xe60e3fef	! t0_kref+0x4744:   	ldub	[%i0 - 0x11], %l3
	.word	0x32800008	! t0_kref+0x4748:   	bne,a	_kref+0x4768
	.word	0xb5b78d98	! t0_kref+0x474c:   	fxor	%f30, %f24, %f26
	.word	0xacf371dc	! t0_kref+0x4750:   	udivcc	%o5, -0xe24, %l6
	.word	0xea063fe4	! t0_kref+0x4754:   	ld	[%i0 - 0x1c], %l5
	.word	0xea000018	! t0_kref+0x4758:   	ld	[%g0 + %i0], %l5
	.word	0xd44e001a	! t0_kref+0x475c:   	ldsb	[%i0 + %i2], %o2
	.word	0xd448a02d	! t0_kref+0x4760:   	ldsb	[%g2 + 0x2d], %o2
	.word	0xf920a03c	! t0_kref+0x4764:   	st	%f28, [%g2 + 0x3c]
	.word	0xb9a00539	! t0_kref+0x4768:   	fsqrts	%f25, %f28
	.word	0xd040a034	! t0_kref+0x476c:   	ldsw	[%g2 + 0x34], %o0
	.word	0xb1b70738	! t0_kref+0x4770:   	fmuld8ulx16	%f28, %f24, %f24
	.word	0xb5a0189c	! t0_kref+0x4774:   	fitos	%f28, %f26
	.word	0xec56401b	! t0_kref+0x4778:   	ldsh	[%i1 + %i3], %l6
	.word	0xec50a01a	! t0_kref+0x477c:   	ldsh	[%g2 + 0x1a], %l6
	.word	0xb5b6097a	! t0_kref+0x4780:   	fpmerge	%f24, %f26, %f26
	.word	0xb1b686fc	! t0_kref+0x4784:   	fmul8ulx16	%f26, %f28, %f24
	.word	0xb7b00f3f	! t0_kref+0x4788:   	fsrc2s	%f31, %f27
	.word	0xe41f4019	! t0_kref+0x478c:   	ldd	[%i5 + %i1], %l2
	.word	0xabb340ed	! t0_kref+0x4790:   	edge16ln	%o5, %o5, %l5
	.word	0xb5b00cdc	! t0_kref+0x4794:   	fnot2	%f28, %f26
	.word	0x81af8a3b	! t0_kref+0x4798:   	fcmps	%fcc0, %f30, %f27
	.word	0x90c362d3	! t0_kref+0x479c:   	addccc	%o5, 0x2d3, %o0
	.word	0xe64e0000	! t0_kref+0x47a0:   	ldsb	[%i0], %l3
	.word	0xee564000	! t0_kref+0x47a4:   	ldsh	[%i1], %l7
	.word	0xd24e8018	! t0_kref+0x47a8:   	ldsb	[%i2 + %i0], %o1
	.word	0xda28a027	! t0_kref+0x47ac:   	stb	%o5, [%g2 + 0x27]
	.word	0xd648a026	! t0_kref+0x47b0:   	ldsb	[%g2 + 0x26], %o3
	.word	0xda20a018	! t0_kref+0x47b4:   	st	%o5, [%g2 + 0x18]
	.word	0x90f3640c	! t0_kref+0x47b8:   	udivcc	%o5, 0x40c, %o0
	.word	0xb5b00f1e	! t0_kref+0x47bc:   	fsrc2	%f30, %f26
	.word	0xd0780019	! t0_kref+0x47c0:   	swap	[%g0 + %i1], %o0
	.word	0xd410a028	! t0_kref+0x47c4:   	lduh	[%g2 + 0x28], %o2
	.word	0xacf37072	! t0_kref+0x47c8:   	udivcc	%o5, -0xf8e, %l6
	.word	0xac2b400d	! t0_kref+0x47cc:   	andn	%o5, %o5, %l6
	.word	0xb1a709b8	! t0_kref+0x47d0:   	fdivs	%f28, %f24, %f24
	.word	0xf5067fe0	! t0_kref+0x47d4:   	ld	[%i1 - 0x20], %f26
	.word	0x29800007	! t0_kref+0x47d8:   	fbl,a	_kref+0x47f4
	.word	0xff20a038	! t0_kref+0x47dc:   	st	%f31, [%g2 + 0x38]
	.word	0xe656601e	! t0_kref+0x47e0:   	ldsh	[%i1 + 0x1e], %l3
	.word	0xd496d019	! t0_kref+0x47e4:   	lduha	[%i3 + %i1]0x80, %o2
	.word	0xf7060000	! t0_kref+0x47e8:   	ld	[%i0], %f27
	.word	0xea16401b	! t0_kref+0x47ec:   	lduh	[%i1 + %i3], %l5
	.word	0xbba00538	! t0_kref+0x47f0:   	fsqrts	%f24, %f29
	.word	0xbfb74ea0	! t0_kref+0x47f4:   	fsrc1s	%f29, %f31
	.word	0xbbb6ceff	! t0_kref+0x47f8:   	fornot2s	%f27, %f31, %f29
	.word	0xb1b68e5e	! t0_kref+0x47fc:   	fxnor	%f26, %f30, %f24
	.word	0xda20a034	! t0_kref+0x4800:   	st	%o5, [%g2 + 0x34]
	.word	0xb1a0003b	! t0_kref+0x4804:   	fmovs	%f27, %f24
	.word	0xdaf75019	! t0_kref+0x4808:   	stxa	%o5, [%i5 + %i1]0x80
	.word	0x93b3402d	! t0_kref+0x480c:   	edge8n	%o5, %o5, %o1
	.word	0xb1b60c9e	! t0_kref+0x4810:   	fandnot2	%f24, %f30, %f24
	.word	0xf320a038	! t0_kref+0x4814:   	st	%f25, [%g2 + 0x38]
	.word	0x3c800003	! t0_kref+0x4818:   	bpos,a	_kref+0x4824
	.word	0xbda688dc	! t0_kref+0x481c:   	fsubd	%f26, %f28, %f30
	.word	0x81db001c	! t0_kref+0x4820:   	flush	%o4 + %i4
	.word	0xb1b6c97d	! t0_kref+0x4824:   	fpmerge	%f27, %f29, %f24
	.word	0xda300018	! t0_kref+0x4828:   	sth	%o5, [%g0 + %i0]
	.word	0xf51e6008	! t0_kref+0x482c:   	ldd	[%i1 + 8], %f26
	.word	0xea50a016	! t0_kref+0x4830:   	ldsh	[%g2 + 0x16], %l5
	.word	0xbda0111e	! t0_kref+0x4834:   	fxtod	%f30, %f30
	.word	0xf1be584d	! t0_kref+0x4838:   	stda	%f24, [%i1 + %o5]0xc2
	.word	0xea0e3ff2	! t0_kref+0x483c:   	ldub	[%i0 - 0xe], %l5
	.word	0xb5a788d8	! t0_kref+0x4840:   	fsubd	%f30, %f24, %f26
	.word	0x34800002	! t0_kref+0x4844:   	bg,a	_kref+0x484c
	.word	0xda30a028	! t0_kref+0x4848:   	sth	%o5, [%g2 + 0x28]
	.word	0xfd06001c	! t0_kref+0x484c:   	ld	[%i0 + %i4], %f30
	.word	0xb3b74dbf	! t0_kref+0x4850:   	fxors	%f29, %f31, %f25
	.word	0xd4064000	! t0_kref+0x4854:   	ld	[%i1], %o2
	.word	0xf1066010	! t0_kref+0x4858:   	ld	[%i1 + 0x10], %f24
	.word	0xd000a014	! t0_kref+0x485c:   	ld	[%g2 + 0x14], %o0
	.word	0x1527f77d	! t0_kref+0x4860:   	sethi	%hi(0x9fddf400), %o2
	.word	0xd0100019	! t0_kref+0x4864:   	lduh	[%g0 + %i1], %o0
	.word	0xd486501c	! t0_kref+0x4868:   	lda	[%i1 + %i4]0x80, %o2
	.word	0xe6564000	! t0_kref+0x486c:   	ldsh	[%i1], %l3
	.word	0xda30a028	! t0_kref+0x4870:   	sth	%o5, [%g2 + 0x28]
	.word	0xdab61000	! t0_kref+0x4874:   	stha	%o5, [%i0]0x80
	.word	0xd210a01c	! t0_kref+0x4878:   	lduh	[%g2 + 0x1c], %o1
	.word	0xd448a012	! t0_kref+0x487c:   	ldsb	[%g2 + 0x12], %o2
	.word	0x27800006	! t0_kref+0x4880:   	fbul,a	_kref+0x4898
	.word	0x90636ffb	! t0_kref+0x4884:   	subc	%o5, 0xffb, %o0
	.word	0xbdb60a7e	! t0_kref+0x4888:   	fpadd32s	%f24, %f30, %f30
	.word	0xbda000b8	! t0_kref+0x488c:   	fnegs	%f24, %f30
	.word	0xf1bf5a58	! t0_kref+0x4890:   	stda	%f24, [%i5 + %i0]0xd2
	.word	0xadb340cd	! t0_kref+0x4894:   	edge16l	%o5, %o5, %l6
	.word	0x23480002	! t0_kref+0x4898:   	fbne,a,pt	%fcc0, _kref+0x48a0
	.word	0xec0e7fe7	! t0_kref+0x489c:   	ldub	[%i1 - 0x19], %l6
	.word	0x2f800002	! t0_kref+0x48a0:   	fbu,a	_kref+0x48a8
	.word	0xd210a02a	! t0_kref+0x48a4:   	lduh	[%g2 + 0x2a], %o1
	.word	0xe6480018	! t0_kref+0x48a8:   	ldsb	[%g0 + %i0], %l3
	.word	0xb3b7ccbe	! t0_kref+0x48ac:   	fandnot2s	%f31, %f30, %f25
	.word	0xa7636156	! t0_kref+0x48b0:   	movle	%fcc0, 0x156, %l3
	.word	0xbdb00f1e	! t0_kref+0x48b4:   	fsrc2	%f30, %f30
	.word	0xea080019	! t0_kref+0x48b8:   	ldub	[%g0 + %i1], %l5
	.word	0xd4080018	! t0_kref+0x48bc:   	ldub	[%g0 + %i0], %o2
	.word	0xf9be188d	! t0_kref+0x48c0:   	stda	%f28, [%i0 + %o5]0xc4
	.word	0xc12e401c	! t0_kref+0x48c4:   	st	%fsr, [%i1 + %i4]
	.word	0xaafb400d	! t0_kref+0x48c8:   	sdivcc	%o5, %o5, %l5
	.word	0xb7a00538	! t0_kref+0x48cc:   	fsqrts	%f24, %f27
	.word	0xbba0053a	! t0_kref+0x48d0:   	fsqrts	%f26, %f29
	.word	0xb1a00558	! t0_kref+0x48d4:   	fsqrtd	%f24, %f24
	.word	0xfd1e6018	! t0_kref+0x48d8:   	ldd	[%i1 + 0x18], %f30
	.word	0xe616c019	! t0_kref+0x48dc:   	lduh	[%i3 + %i1], %l3
	.word	0xf900a030	! t0_kref+0x48e0:   	ld	[%g2 + 0x30], %f28
	.word	0xa893400d	! t0_kref+0x48e4:   	orcc	%o5, %o5, %l4
	.word	0xda28a015	! t0_kref+0x48e8:   	stb	%o5, [%g2 + 0x15]
	.word	0xb9b70c7c	! t0_kref+0x48ec:   	fnors	%f28, %f28, %f28
	.word	0x81ae0a5e	! t0_kref+0x48f0:   	fcmpd	%fcc0, %f24, %f30
	.word	0xb5a0053a	! t0_kref+0x48f4:   	fsqrts	%f26, %f26
	.word	0x9de3bfa0	! t0_kref+0x48f8:   	save	%sp, -0x60, %sp
	.word	0xa7ee660f	! t0_kref+0x48fc:   	restore	%i1, 0x60f, %l3
	.word	0xda30a038	! t0_kref+0x4900:   	sth	%o5, [%g2 + 0x38]
	.word	0xf11e7fe8	! t0_kref+0x4904:   	ldd	[%i1 - 0x18], %f24
	.word	0xb9a7c9bb	! t0_kref+0x4908:   	fdivs	%f31, %f27, %f28
	.word	0xe8400019	! t0_kref+0x490c:   	ldsw	[%g0 + %i1], %l4
	.word	0xda20a004	! t0_kref+0x4910:   	st	%o5, [%g2 + 4]
	.word	0xd20e2019	! t0_kref+0x4914:   	ldub	[%i0 + 0x19], %o1
	.word	0xda30a01c	! t0_kref+0x4918:   	sth	%o5, [%g2 + 0x1c]
	.word	0x8d837be1	! t0_kref+0x491c:   	wr	%o5, 0xfffffbe1, %fprs
	.word	0xb9b6899c	! t0_kref+0x4920:   	bshuffle	%f26, %f28, %f28
	.word	0xd656c018	! t0_kref+0x4924:   	ldsh	[%i3 + %i0], %o3
	.word	0xb3a0053c	! t0_kref+0x4928:   	fsqrts	%f28, %f25
	.word	0x81834000	! t0_kref+0x492c:   	wr	%o5, %g0, %y
	.word	0xe64e6016	! t0_kref+0x4930:   	ldsb	[%i1 + 0x16], %l3
	.word	0x81af8a5a	! t0_kref+0x4934:   	fcmpd	%fcc0, %f30, %f26
	.word	0x85837067	! t0_kref+0x4938:   	wr	%o5, 0xfffff067, %ccr
	.word	0xe8100019	! t0_kref+0x493c:   	lduh	[%g0 + %i1], %l4
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xb9a00558	! t0_kref+0x4948:   	fsqrtd	%f24, %f28
	.word	0xafb7041e	! t0_kref+0x494c:   	fcmple16	%f28, %f30, %l7
	.word	0xd6062000	! t0_kref+0x4950:   	ld	[%i0], %o3
	.word	0xee16c019	! t0_kref+0x4954:   	lduh	[%i3 + %i1], %l7
	.word	0xda20a03c	! t0_kref+0x4958:   	st	%o5, [%g2 + 0x3c]
	.word	0xa9b6051a	! t0_kref+0x495c:   	fcmpgt16	%f24, %f26, %l4
1:	.word	0xfd06401c	! t0_kref+0x4960:   	ld	[%i1 + %i4], %f30
	.word	0xadb3404d	! t0_kref+0x4964:   	edge8l	%o5, %o5, %l6
	.word	0xad70000d	! t0_kref+0x4968:   	popc	%o5, %l6
	.word	0xfb070019	! t0_kref+0x496c:   	ld	[%i4 + %i1], %f29
	.word	0xaae3765b	! t0_kref+0x4970:   	subccc	%o5, -0x9a5, %l5
	.word	0xb5b64ea0	! t0_kref+0x4974:   	fsrc1s	%f25, %f26
	.word	0xb3a00538	! t0_kref+0x4978:   	fsqrts	%f24, %f25
	.word	0xfb000019	! t0_kref+0x497c:   	ld	[%g0 + %i1], %f29
	.word	0xd006001c	! t0_kref+0x4980:   	ld	[%i0 + %i4], %o0
	.word	0xe84e6017	! t0_kref+0x4984:   	ldsb	[%i1 + 0x17], %l4
	.word	0xf19f1a18	! t0_kref+0x4988:   	ldda	[%i4 + %i0]0xd0, %f24
	.word	0xb7a6c9bc	! t0_kref+0x498c:   	fdivs	%f27, %f28, %f27
	.word	0xb5a608bc	! t0_kref+0x4990:   	fsubs	%f24, %f28, %f26
	.word	0xda28a00d	! t0_kref+0x4994:   	stb	%o5, [%g2 + 0xd]
	.word	0xb5b6c67e	! t0_kref+0x4998:   	fmul8x16au	%f27, %f30, %f26
	.word	0x20800005	! t0_kref+0x499c:   	bn,a	_kref+0x49b0
	.word	0xe640a00c	! t0_kref+0x49a0:   	ldsw	[%g2 + 0xc], %l3
	.word	0xd456601a	! t0_kref+0x49a4:   	ldsh	[%i1 + 0x1a], %o2
	.word	0x96137839	! t0_kref+0x49a8:   	or	%o5, -0x7c7, %o3
	.word	0xda28a034	! t0_kref+0x49ac:   	stb	%o5, [%g2 + 0x34]
	.word	0xea000019	! t0_kref+0x49b0:   	ld	[%g0 + %i1], %l5
	.word	0x8d837c70	! t0_kref+0x49b4:   	wr	%o5, 0xfffffc70, %fprs
	.word	0xd60e3ffe	! t0_kref+0x49b8:   	ldub	[%i0 - 2], %o3
	.word	0xf100a02c	! t0_kref+0x49bc:   	ld	[%g2 + 0x2c], %f24
	.word	0xb8102004	! t0_kref+0x49c0:   	mov	0x4, %i4
	.word	0xd406401c	! t0_kref+0x49c4:   	ld	[%i1 + %i4], %o2
	.word	0xda20a038	! t0_kref+0x49c8:   	st	%o5, [%g2 + 0x38]
	.word	0xb9a0191e	! t0_kref+0x49cc:   	fitod	%f30, %f28
	.word	0xa8a3400d	! t0_kref+0x49d0:   	subcc	%o5, %o5, %l4
	.word	0xbda0193a	! t0_kref+0x49d4:   	fstod	%f26, %f30
	.word	0xb1b7073a	! t0_kref+0x49d8:   	fmuld8ulx16	%f28, %f26, %f24
	.word	0xb5a709be	! t0_kref+0x49dc:   	fdivs	%f28, %f30, %f26
	.word	0xe6563fe0	! t0_kref+0x49e0:   	ldsh	[%i0 - 0x20], %l3
	.word	0xbbb60db8	! t0_kref+0x49e4:   	fxors	%f24, %f24, %f29
	.word	0xec08a015	! t0_kref+0x49e8:   	ldub	[%g2 + 0x15], %l6
	.word	0xda30a03a	! t0_kref+0x49ec:   	sth	%o5, [%g2 + 0x3a]
	.word	0xb5a709b8	! t0_kref+0x49f0:   	fdivs	%f28, %f24, %f26
	.word	0xb5b60ea0	! t0_kref+0x49f4:   	fsrc1s	%f24, %f26
	.word	0xea562018	! t0_kref+0x49f8:   	ldsh	[%i0 + 0x18], %l5
	.word	0x92137d73	! t0_kref+0x49fc:   	or	%o5, -0x28d, %o1
	.word	0xd000a010	! t0_kref+0x4a00:   	ld	[%g2 + 0x10], %o0
	.word	0xb7a0053a	! t0_kref+0x4a04:   	fsqrts	%f26, %f27
	.word	0xda28a029	! t0_kref+0x4a08:   	stb	%o5, [%g2 + 0x29]
	.word	0xd40e3fe2	! t0_kref+0x4a0c:   	ldub	[%i0 - 0x1e], %o2
	.word	0xb9b78e58	! t0_kref+0x4a10:   	fxnor	%f30, %f24, %f28
	.word	0xa9b7845e	! t0_kref+0x4a14:   	fcmpne16	%f30, %f30, %l4
	.word	0xb1b00f1a	! t0_kref+0x4a18:   	fsrc2	%f26, %f24
	.word	0xe840a010	! t0_kref+0x4a1c:   	ldsw	[%g2 + 0x10], %l4
	.word	0xd4ce9018	! t0_kref+0x4a20:   	ldsba	[%i2 + %i0]0x80, %o2
	.word	0xb9a00558	! t0_kref+0x4a24:   	fsqrtd	%f24, %f28
	.word	0xb7a6c9bb	! t0_kref+0x4a28:   	fdivs	%f27, %f27, %f27
	.word	0xac1b61b1	! t0_kref+0x4a2c:   	xor	%o5, 0x1b1, %l6
	.word	0xda20a028	! t0_kref+0x4a30:   	st	%o5, [%g2 + 0x28]
	.word	0xb9b60d9e	! t0_kref+0x4a34:   	fxor	%f24, %f30, %f28
	.word	0x81ae0adc	! t0_kref+0x4a38:   	fcmped	%fcc0, %f24, %f28
	.word	0xb1b68d9e	! t0_kref+0x4a3c:   	fxor	%f26, %f30, %f24
	.word	0x37800001	! t0_kref+0x4a40:   	fbge,a	_kref+0x4a44
	.word	0xd24e8019	! t0_kref+0x4a44:   	ldsb	[%i2 + %i1], %o1
	.word	0xf99eda59	! t0_kref+0x4a48:   	ldda	[%i3 + %i1]0xd2, %f28
	.word	0xa60b60cd	! t0_kref+0x4a4c:   	and	%o5, 0xcd, %l3
	.word	0xd610a008	! t0_kref+0x4a50:   	lduh	[%g2 + 8], %o3
	.word	0xf7060000	! t0_kref+0x4a54:   	ld	[%i0], %f27
	.word	0x9fc10000	! t0_kref+0x4a58:   	call	%g4
	.word	0xf99e5a5d	! t0_kref+0x4a5c:   	ldda	[%i1 + %i5]0xd2, %f28
	.word	0xb1b686b8	! t0_kref+0x4a60:   	fmul8x16al	%f26, %f24, %f24
	.word	0xff00a024	! t0_kref+0x4a64:   	ld	[%g2 + 0x24], %f31
	.word	0xb1a0053f	! t0_kref+0x4a68:   	fsqrts	%f31, %f24
	.word	0xe84e4000	! t0_kref+0x4a6c:   	ldsb	[%i1], %l4
	.word	0xb1a7c9be	! t0_kref+0x4a70:   	fdivs	%f31, %f30, %f24
	.word	0xe80e001a	! t0_kref+0x4a74:   	ldub	[%i0 + %i2], %l4
	.word	0xb1b7c67a	! t0_kref+0x4a78:   	fmul8x16au	%f31, %f26, %f24
	.word	0xda20a018	! t0_kref+0x4a7c:   	st	%o5, [%g2 + 0x18]
	.word	0x927b62ba	! t0_kref+0x4a80:   	sdiv	%o5, 0x2ba, %o1
	.word	0xd2100019	! t0_kref+0x4a84:   	lduh	[%g0 + %i1], %o1
	.word	0xae2b400d	! t0_kref+0x4a88:   	andn	%o5, %o5, %l7
	.word	0xf326001c	! t0_kref+0x4a8c:   	st	%f25, [%i0 + %i4]
	.word	0xd00e6014	! t0_kref+0x4a90:   	ldub	[%i1 + 0x14], %o0
	.word	0x97b705d8	! t0_kref+0x4a94:   	fcmpeq32	%f28, %f24, %o3
	.word	0xee48a03b	! t0_kref+0x4a98:   	ldsb	[%g2 + 0x3b], %l7
	.word	0xe806200c	! t0_kref+0x4a9c:   	ld	[%i0 + 0xc], %l4
	.word	0xb7a608bc	! t0_kref+0x4aa0:   	fsubs	%f24, %f28, %f27
	.word	0xbdb78f9c	! t0_kref+0x4aa4:   	for	%f30, %f28, %f30
	.word	0xb5a709bd	! t0_kref+0x4aa8:   	fdivs	%f28, %f29, %f26
	.word	0xb5b009ba	! t0_kref+0x4aac:   	fexpand	%f26, %f26
	.word	0xda30a022	! t0_kref+0x4ab0:   	sth	%o5, [%g2 + 0x22]
	.word	0x30800005	! t0_kref+0x4ab4:   	ba,a	_kref+0x4ac8
	.word	0xb7b68e3a	! t0_kref+0x4ab8:   	fands	%f26, %f26, %f27
	.word	0xf51e2008	! t0_kref+0x4abc:   	ldd	[%i0 + 8], %f26
	.word	0xbfa649ba	! t0_kref+0x4ac0:   	fdivs	%f25, %f26, %f31
	.word	0xb9b6cea0	! t0_kref+0x4ac4:   	fsrc1s	%f27, %f28
	.word	0xd4000018	! t0_kref+0x4ac8:   	ld	[%g0 + %i0], %o2
	.word	0xa9b3404d	! t0_kref+0x4acc:   	edge8l	%o5, %o5, %l4
	.word	0xee4e3ffb	! t0_kref+0x4ad0:   	ldsb	[%i0 - 5], %l7
	.word	0x91b3434d	! t0_kref+0x4ad4:   	alignaddrl	%o5, %o5, %o0
	.word	0xbdb00c00	! t0_kref+0x4ad8:   	fzero	%f30
	.word	0xb9a0053e	! t0_kref+0x4adc:   	fsqrts	%f30, %f28
	.word	0xb3a000bf	! t0_kref+0x4ae0:   	fnegs	%f31, %f25
	.word	0xe6067fe0	! t0_kref+0x4ae4:   	ld	[%i1 - 0x20], %l3
	.word	0xd2070019	! t0_kref+0x4ae8:   	ld	[%i4 + %i1], %o1
	.word	0xea567fe6	! t0_kref+0x4aec:   	ldsh	[%i1 - 0x1a], %l5
	.word	0xee10a010	! t0_kref+0x4af0:   	lduh	[%g2 + 0x10], %l7
	.word	0xf91e0000	! t0_kref+0x4af4:   	ldd	[%i0], %f28
	.word	0xa9b3430d	! t0_kref+0x4af8:   	alignaddr	%o5, %o5, %l4
	.word	0xbda78d3a	! t0_kref+0x4afc:   	fsmuld	%f30, %f26, %f30
	.word	0xb7a6c838	! t0_kref+0x4b00:   	fadds	%f27, %f24, %f27
	.word	0xa733400d	! t0_kref+0x4b04:   	srl	%o5, %o5, %l3
	call	SYM(t0_subr0)
	.word	0xbdb606fc	! t0_kref+0x4b0c:   	fmul8ulx16	%f24, %f28, %f30
	.word	0xb3b00778	! t0_kref+0x4b10:   	fpack16	%f24, %f25
	.word	0xe80e7fef	! t0_kref+0x4b14:   	ldub	[%i1 - 0x11], %l4
	.word	0x8d83400d	! t0_kref+0x4b18:   	wr	%o5, %o5, %fprs
	.word	0xda30a02e	! t0_kref+0x4b1c:   	sth	%o5, [%g2 + 0x2e]
	.word	0xfb067ff4	! t0_kref+0x4b20:   	ld	[%i1 - 0xc], %f29
	.word	0xd008a023	! t0_kref+0x4b24:   	ldub	[%g2 + 0x23], %o0
	.word	0xe6067ff4	! t0_kref+0x4b28:   	ld	[%i1 - 0xc], %l3
	.word	0xda267fe4	! t0_kref+0x4b2c:   	st	%o5, [%i1 - 0x1c]
	.word	0xadb34280	! t0_kref+0x4b30:   	array32	%o5, %g0, %l6
	.word	0xb7a789b8	! t0_kref+0x4b34:   	fdivs	%f30, %f24, %f27
	.word	0x29800004	! t0_kref+0x4b38:   	fbl,a	_kref+0x4b48
	.word	0xb1b00fc0	! t0_kref+0x4b3c:   	fone	%f24
	.word	0xfb063ff8	! t0_kref+0x4b40:   	ld	[%i0 - 8], %f29
	.word	0xd608a030	! t0_kref+0x4b44:   	ldub	[%g2 + 0x30], %o3
	.word	0xea6e600f	! t0_kref+0x4b48:   	ldstub	[%i1 + 0xf], %l5
	.word	0xb5a689ba	! t0_kref+0x4b4c:   	fdivs	%f26, %f26, %f26
	.word	0x90b3651c	! t0_kref+0x4b50:   	orncc	%o5, 0x51c, %o0
	.word	0xdaa81019	! t0_kref+0x4b54:   	stba	%o5, [%g0 + %i1]0x80
	.word	0xe80e6010	! t0_kref+0x4b58:   	ldub	[%i1 + 0x10], %l4
	.word	0xd056601e	! t0_kref+0x4b5c:   	ldsh	[%i1 + 0x1e], %o0
	.word	0xb5a0193c	! t0_kref+0x4b60:   	fstod	%f28, %f26
	.word	0xd2780018	! t0_kref+0x4b64:   	swap	[%g0 + %i0], %o1
	.word	0xff26601c	! t0_kref+0x4b68:   	st	%f31, [%i1 + 0x1c]
	.word	0xfb20a000	! t0_kref+0x4b6c:   	st	%f29, [%g2]
	.word	0xd4060000	! t0_kref+0x4b70:   	ld	[%i0], %o2
	.word	0x94637c61	! t0_kref+0x4b74:   	subc	%o5, -0x39f, %o2
	call	SYM(t0_subr0)
	.word	0xb1a0055a	! t0_kref+0x4b7c:   	fsqrtd	%f26, %f24
	.word	0xb1a0055a	! t0_kref+0x4b80:   	fsqrtd	%f26, %f24
	.word	0xea4e3fe6	! t0_kref+0x4b84:   	ldsb	[%i0 - 0x1a], %l5
	.word	0xd6560000	! t0_kref+0x4b88:   	ldsh	[%i0], %o3
	.word	0x94137c8f	! t0_kref+0x4b8c:   	or	%o5, -0x371, %o2
	.word	0xec063ffc	! t0_kref+0x4b90:   	ld	[%i0 - 4], %l6
	.word	0x9de3bfa0	! t0_kref+0x4b94:   	save	%sp, -0x60, %sp
	.word	0x97eec01d	! t0_kref+0x4b98:   	restore	%i3, %i5, %o3
	.word	0xb7a0053b	! t0_kref+0x4b9c:   	fsqrts	%f27, %f27
	.word	0xe60e8019	! t0_kref+0x4ba0:   	ldub	[%i2 + %i1], %l3
	.word	0xda20a028	! t0_kref+0x4ba4:   	st	%o5, [%g2 + 0x28]
	.word	0xbdb78f58	! t0_kref+0x4ba8:   	fornot1	%f30, %f24, %f30
	.word	0xbba01a3e	! t0_kref+0x4bac:   	fstoi	%f30, %f29
	.word	0xe8563ff0	! t0_kref+0x4bb0:   	ldsh	[%i0 - 0x10], %l4
	.word	0xbdb787d8	! t0_kref+0x4bb4:   	pdist	%f30, %f24, %f30
	.word	0x91408000	! t0_kref+0x4bb8:   	mov	%ccr, %o0
	.word	0xee567fe0	! t0_kref+0x4bbc:   	ldsh	[%i1 - 0x20], %l7
	.word	0x921b65f9	! t0_kref+0x4bc0:   	xor	%o5, 0x5f9, %o1
	.word	0xa7b7845e	! t0_kref+0x4bc4:   	fcmpne16	%f30, %f30, %l3
	.word	0xa6c3400d	! t0_kref+0x4bc8:   	addccc	%o5, %o5, %l3
	.word	0xe840a018	! t0_kref+0x4bcc:   	ldsw	[%g2 + 0x18], %l4
	.word	0xa744c000	! t0_kref+0x4bd0:   	mov	%gsr, %l3
	.word	0xb1a0055a	! t0_kref+0x4bd4:   	fsqrtd	%f26, %f24
	.word	0xd440a00c	! t0_kref+0x4bd8:   	ldsw	[%g2 + 0xc], %o2
	.word	0xf11e6008	! t0_kref+0x4bdc:   	ldd	[%i1 + 8], %f24
	.word	0xb9a688be	! t0_kref+0x4be0:   	fsubs	%f26, %f30, %f28
	.word	0xee4e001a	! t0_kref+0x4be4:   	ldsb	[%i0 + %i2], %l7
	.word	0xda30a01c	! t0_kref+0x4be8:   	sth	%o5, [%g2 + 0x1c]
	.word	0xbdb60e3d	! t0_kref+0x4bec:   	fands	%f24, %f29, %f30
	.word	0xb1a0053a	! t0_kref+0x4bf0:   	fsqrts	%f26, %f24
	.word	0xf900a018	! t0_kref+0x4bf4:   	ld	[%g2 + 0x18], %f28
	.word	0xa7b685da	! t0_kref+0x4bf8:   	fcmpeq32	%f26, %f26, %l3
	.word	0xe608a025	! t0_kref+0x4bfc:   	ldub	[%g2 + 0x25], %l3
	.word	0xb3a7c9bc	! t0_kref+0x4c00:   	fdivs	%f31, %f28, %f25
	.word	0x9523400d	! t0_kref+0x4c04:   	mulscc	%o5, %o5, %o2
	.word	0xea4e6011	! t0_kref+0x4c08:   	ldsb	[%i1 + 0x11], %l5
	.word	0xd00e8018	! t0_kref+0x4c0c:   	ldub	[%i2 + %i0], %o0
	.word	0xb3b6ca3d	! t0_kref+0x4c10:   	fpadd16s	%f27, %f29, %f25
	.word	0xaadb400d	! t0_kref+0x4c14:   	smulcc	%o5, %o5, %l5
	.word	0xa7b3404d	! t0_kref+0x4c18:   	edge8l	%o5, %o5, %l3
	.word	0xdaf75019	! t0_kref+0x4c1c:   	stxa	%o5, [%i5 + %i1]0x80
	.word	0xa7b7841e	! t0_kref+0x4c20:   	fcmple16	%f30, %f30, %l3
	.word	0xa653400d	! t0_kref+0x4c24:   	umul	%o5, %o5, %l3
	.word	0xafb3432d	! t0_kref+0x4c28:   	bmask	%o5, %o5, %l7
	.word	0xb9b70d60	! t0_kref+0x4c2c:   	fnot1s	%f28, %f28
	.word	0x858374e9	! t0_kref+0x4c30:   	wr	%o5, 0xfffff4e9, %ccr
	.word	0xd206601c	! t0_kref+0x4c34:   	ld	[%i1 + 0x1c], %o1
	.word	0xe80e001a	! t0_kref+0x4c38:   	ldub	[%i0 + %i2], %l4
	.word	0xb1a0053f	! t0_kref+0x4c3c:   	fsqrts	%f31, %f24
	.word	0xb9a00538	! t0_kref+0x4c40:   	fsqrts	%f24, %f28
	.word	0xee0e7fed	! t0_kref+0x4c44:   	ldub	[%i1 - 0x13], %l7
	.word	0xbdb6c6bf	! t0_kref+0x4c48:   	fmul8x16al	%f27, %f31, %f30
	.word	0xee00a020	! t0_kref+0x4c4c:   	ld	[%g2 + 0x20], %l7
	.word	0xd3f6100d	! t0_kref+0x4c50:   	casxa	[%i0]0x80, %o5, %o1
	.word	0xb5b7897a	! t0_kref+0x4c54:   	fpmerge	%f30, %f26, %f26
	.word	0xd44e2011	! t0_kref+0x4c58:   	ldsb	[%i0 + 0x11], %o2
	.word	0xfb00a004	! t0_kref+0x4c5c:   	ld	[%g2 + 4], %f29
	.word	0xd00e8018	! t0_kref+0x4c60:   	ldub	[%i2 + %i0], %o0
	.word	0xf900a038	! t0_kref+0x4c64:   	ld	[%g2 + 0x38], %f28
	.word	0x81ae8a5c	! t0_kref+0x4c68:   	fcmpd	%fcc0, %f26, %f28
	.word	0xfd20a038	! t0_kref+0x4c6c:   	st	%f30, [%g2 + 0x38]
	.word	0xb7a00539	! t0_kref+0x4c70:   	fsqrts	%f25, %f27
	.word	0xd64e3fee	! t0_kref+0x4c74:   	ldsb	[%i0 - 0x12], %o3
	.word	0xab408000	! t0_kref+0x4c78:   	mov	%ccr, %l5
	.word	0xbda0003c	! t0_kref+0x4c7c:   	fmovs	%f28, %f30
	.word	0xe608a029	! t0_kref+0x4c80:   	ldub	[%g2 + 0x29], %l3
	.word	0xb9a649bf	! t0_kref+0x4c84:   	fdivs	%f25, %f31, %f28
	.word	0xda28a010	! t0_kref+0x4c88:   	stb	%o5, [%g2 + 0x10]
	.word	0xee070019	! t0_kref+0x4c8c:   	ld	[%i4 + %i1], %l7
	.word	0xb1a708dc	! t0_kref+0x4c90:   	fsubd	%f28, %f28, %f24
	.word	0xbdb6cab8	! t0_kref+0x4c94:   	fpsub16s	%f27, %f24, %f30
	.word	0xb9b78f5c	! t0_kref+0x4c98:   	fornot1	%f30, %f28, %f28
	.word	0xd000a00c	! t0_kref+0x4c9c:   	ld	[%g2 + 0xc], %o0
	.word	0xda30a01e	! t0_kref+0x4ca0:   	sth	%o5, [%g2 + 0x1e]
	.word	0x922b400d	! t0_kref+0x4ca4:   	andn	%o5, %o5, %o1
	.word	0xabb6859a	! t0_kref+0x4ca8:   	fcmpgt32	%f26, %f26, %l5
	.word	0x25800007	! t0_kref+0x4cac:   	fblg,a	_kref+0x4cc8
	.word	0xec50a004	! t0_kref+0x4cb0:   	ldsh	[%g2 + 4], %l6
	.word	0xec062010	! t0_kref+0x4cb4:   	ld	[%i0 + 0x10], %l6
	.word	0xbbb6ce3a	! t0_kref+0x4cb8:   	fands	%f27, %f26, %f29
	.word	0x130b47a3	! t0_kref+0x4cbc:   	sethi	%hi(0x2d1e8c00), %o1
	.word	0xace37614	! t0_kref+0x4cc0:   	subccc	%o5, -0x9ec, %l6
	.word	0xd040a01c	! t0_kref+0x4cc4:   	ldsw	[%g2 + 0x1c], %o0
	.word	0xd00e8018	! t0_kref+0x4cc8:   	ldub	[%i2 + %i0], %o0
	.word	0xe800a00c	! t0_kref+0x4ccc:   	ld	[%g2 + 0xc], %l4
	.word	0xe41f4018	! t0_kref+0x4cd0:   	ldd	[%i5 + %i0], %l2
	.word	0xf1bf1a19	! t0_kref+0x4cd4:   	stda	%f24, [%i4 + %i1]0xd0
	.word	0xe60e8018	! t0_kref+0x4cd8:   	ldub	[%i2 + %i0], %l3
	.word	0x35800006	! t0_kref+0x4cdc:   	fbue,a	_kref+0x4cf4
	.word	0xee08a030	! t0_kref+0x4ce0:   	ldub	[%g2 + 0x30], %l7
	.word	0xea167fe2	! t0_kref+0x4ce4:   	lduh	[%i1 - 0x1e], %l5
	.word	0xb1b74efa	! t0_kref+0x4ce8:   	fornot2s	%f29, %f26, %f24
	.word	0xf11e7fe0	! t0_kref+0x4cec:   	ldd	[%i1 - 0x20], %f24
	.word	0xb1a0055c	! t0_kref+0x4cf0:   	fsqrtd	%f28, %f24
	.word	0xbda608ba	! t0_kref+0x4cf4:   	fsubs	%f24, %f26, %f30
	.word	0xa883400d	! t0_kref+0x4cf8:   	addcc	%o5, %o5, %l4
	.word	0xb9b60f9e	! t0_kref+0x4cfc:   	for	%f24, %f30, %f28
	.word	0xda263ffc	! t0_kref+0x4d00:   	st	%o5, [%i0 - 4]
	.word	0xd000a004	! t0_kref+0x4d04:   	ld	[%g2 + 4], %o0
	.word	0xb5b7cd39	! t0_kref+0x4d08:   	fandnot1s	%f31, %f25, %f26
	.word	0xb5b7091a	! t0_kref+0x4d0c:   	faligndata	%f28, %f26, %f26
	.word	0xec060000	! t0_kref+0x4d10:   	ld	[%i0], %l6
	.word	0xe4180018	! t0_kref+0x4d14:   	ldd	[%g0 + %i0], %l2
	.word	0xf9be101d	! t0_kref+0x4d18:   	stda	%f28, [%i0 + %i5]0x80
	.word	0xda267ff0	! t0_kref+0x4d1c:   	st	%o5, [%i1 - 0x10]
	.word	0xe8063ff0	! t0_kref+0x4d20:   	ld	[%i0 - 0x10], %l4
	.word	0xf500a010	! t0_kref+0x4d24:   	ld	[%g2 + 0x10], %f26
	.word	0xf700a02c	! t0_kref+0x4d28:   	ld	[%g2 + 0x2c], %f27
	.word	0xd4162016	! t0_kref+0x4d2c:   	lduh	[%i0 + 0x16], %o2
	.word	0xd2064000	! t0_kref+0x4d30:   	ld	[%i1], %o1
	.word	0xe8567fe4	! t0_kref+0x4d34:   	ldsh	[%i1 - 0x1c], %l4
	.word	0xf99f5a58	! t0_kref+0x4d38:   	ldda	[%i5 + %i0]0xd2, %f28
	.word	0xac13400d	! t0_kref+0x4d3c:   	or	%o5, %o5, %l6
	.word	0xa783400d	! t0_kref+0x4d40:   	wr	%o5, %o5, %gsr
	.word	0xf500a024	! t0_kref+0x4d44:   	ld	[%g2 + 0x24], %f26
	.word	0xf11e4000	! t0_kref+0x4d48:   	ldd	[%i1], %f24
	.word	0xda267fec	! t0_kref+0x4d4c:   	st	%o5, [%i1 - 0x14]
	.word	0xedee101c	! t0_kref+0x4d50:   	prefetcha	%i0 + %i4, 22
	.word	0xea40a004	! t0_kref+0x4d54:   	ldsw	[%g2 + 4], %l5
	.word	0xb5b68d9a	! t0_kref+0x4d58:   	fxor	%f26, %f26, %f26
	.word	0xea4e601a	! t0_kref+0x4d5c:   	ldsb	[%i1 + 0x1a], %l5
	.word	0x90f368b7	! t0_kref+0x4d60:   	udivcc	%o5, 0x8b7, %o0
	.word	0xee10a002	! t0_kref+0x4d64:   	lduh	[%g2 + 2], %l7
	.word	0xadb3434d	! t0_kref+0x4d68:   	alignaddrl	%o5, %o5, %l6
	.word	0xd6066000	! t0_kref+0x4d6c:   	ld	[%i1], %o3
	.word	0xb9a789b8	! t0_kref+0x4d70:   	fdivs	%f30, %f24, %f28
	.word	0xaaab7bc9	! t0_kref+0x4d74:   	andncc	%o5, -0x437, %l5
	.word	0xb9b60dd8	! t0_kref+0x4d78:   	fnand	%f24, %f24, %f28
	.word	0x9fc00004	! t0_kref+0x4d7c:   	call	%g0 + %g4
	.word	0x963b696c	! t0_kref+0x4d80:   	xnor	%o5, 0x96c, %o3
	.word	0xd2167fee	! t0_kref+0x4d84:   	lduh	[%i1 - 0x12], %o1
	.word	0xe64e401a	! t0_kref+0x4d88:   	ldsb	[%i1 + %i2], %l3
	.word	0xec16401b	! t0_kref+0x4d8c:   	lduh	[%i1 + %i3], %l6
	.word	0xbda6c8bd	! t0_kref+0x4d90:   	fsubs	%f27, %f29, %f30
	.word	0xbdb00f3d	! t0_kref+0x4d94:   	fsrc2s	%f29, %f30
	.word	0xda366012	! t0_kref+0x4d98:   	sth	%o5, [%i1 + 0x12]
	.word	0xb1b78e1a	! t0_kref+0x4d9c:   	fand	%f30, %f26, %f24
	.word	0xb1b70e1a	! t0_kref+0x4da0:   	fand	%f28, %f26, %f24
	.word	0xec0e401a	! t0_kref+0x4da4:   	ldub	[%i1 + %i2], %l6
	.word	0xf9be1a5b	! t0_kref+0x4da8:   	stda	%f28, [%i0 + %i3]0xd2
	.word	0xb5b60dd8	! t0_kref+0x4dac:   	fnand	%f24, %f24, %f26
	.word	0xd64e201a	! t0_kref+0x4db0:   	ldsb	[%i0 + 0x1a], %o3
	.word	0xfb00a02c	! t0_kref+0x4db4:   	ld	[%g2 + 0x2c], %f29
	.word	0xc1082ecc	! t0_kref+0x4db8:   	ld	[%g0 + 0xecc], %fsr
	.word	0x8143e05d	! t0_kref+0x4dbc:   	membar	0x5d
	.word	0xec563ff4	! t0_kref+0x4dc0:   	ldsh	[%i0 - 0xc], %l6
	.word	0xb5b70d9a	! t0_kref+0x4dc4:   	fxor	%f28, %f26, %f26
	.word	0xe810a01c	! t0_kref+0x4dc8:   	lduh	[%g2 + 0x1c], %l4
	.word	0xb3a01a3a	! t0_kref+0x4dcc:   	fstoi	%f26, %f25
	.word	0xda263fec	! t0_kref+0x4dd0:   	st	%o5, [%i0 - 0x14]
	.word	0x92ab6512	! t0_kref+0x4dd4:   	andncc	%o5, 0x512, %o1
	.word	0xbdb70f98	! t0_kref+0x4dd8:   	for	%f28, %f24, %f30
	.word	0xee563fe6	! t0_kref+0x4ddc:   	ldsh	[%i0 - 0x1a], %l7
	.word	0xda28a01d	! t0_kref+0x4de0:   	stb	%o5, [%g2 + 0x1d]
	.word	0x94b3400d	! t0_kref+0x4de4:   	orncc	%o5, %o5, %o2
	.word	0xd0167fe6	! t0_kref+0x4de8:   	lduh	[%i1 - 0x1a], %o0
	.word	0x95b3434d	! t0_kref+0x4dec:   	alignaddrl	%o5, %o5, %o2
	.word	0xf56e7fe0	! t0_kref+0x4df0:   	prefetch	%i1 - 0x20, 26
	.word	0xac1b400d	! t0_kref+0x4df4:   	xor	%o5, %o5, %l6
	.word	0xd00e8018	! t0_kref+0x4df8:   	ldub	[%i2 + %i0], %o0
	.word	0xb5b606f8	! t0_kref+0x4dfc:   	fmul8ulx16	%f24, %f24, %f26
	.word	0xbdb60dbc	! t0_kref+0x4e00:   	fxors	%f24, %f28, %f30
	.word	0xec080019	! t0_kref+0x4e04:   	ldub	[%g0 + %i1], %l6
	.word	0xf11e6018	! t0_kref+0x4e08:   	ldd	[%i1 + 0x18], %f24
	.word	0x86102002	! t0_kref+0x4e0c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x4e10:   	bne,a	_kref+0x4e10
	.word	0x86a0e001	! t0_kref+0x4e14:   	subcc	%g3, 1, %g3
	.word	0xa7b34240	! t0_kref+0x4e18:   	array16	%o5, %g0, %l3
	.word	0xf100a00c	! t0_kref+0x4e1c:   	ld	[%g2 + 0xc], %f24
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x73344000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x7fb36000)
.seg "text"
t0_subr1_page_begin:
	.skip 8184
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x1544e000)
.seg "text"
t0_subr2_page_begin:
	.skip 8184
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x15944000)
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
!  Total operations: 4941  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              3.10   3.36
!  ldub              4.49   4.63
!  ldsh              2.75   2.89
!  lduh              2.47   2.43
!  ld                4.48   4.80
!  ldd               0.55   0.71
!  swap              0.15   0.16
!  ldstub            0.23   0.14
!  stb               0.51   0.43
!  sth               0.49   0.51
!  st                0.39   0.47
!  std               0.25   0.22
!  add               0.22   0.20
!  addcc             0.53   0.57
!  addx              0.01   0.02
!  addxcc            0.16   0.20
!  taddcc            0.03   0.04
!  taddcctv          0.01   0.02
!  sub               0.34   0.38
!  subcc             0.26   0.16
!  subx              0.20   0.22
!  subxcc            0.53   0.40
!  tsubcc            0.07   0.10
!  tsubcctv          0.08   0.10
!  mulscc            0.30   0.40
!  and               0.35   0.45
!  andcc             0.01   0.00
!  andn              0.39   0.38
!  andncc            0.44   0.20
!  or                0.55   0.71
!  orcc              0.35   0.36
!  orn               0.09   0.08
!  orncc             0.28   0.36
!  xor               0.31   0.28
!  xorcc             0.26   0.20
!  xnor              0.22   0.18
!  xnorcc            0.47   0.43
!  sll               0.18   0.18
!  srl               0.24   0.30
!  sra               0.21   0.28
!  unimp             0.10   0.14
!  umul              0.10   0.08
!  smul              0.40   0.34
!  udiv              0.20   0.06
!  sdiv              0.38   0.26
!  umulcc            0.20   0.20
!  smulcc            0.22   0.30
!  udivcc            0.46   0.59
!  sdivcc            0.05   0.10
!  rdy               0.20   0.20
!  wry               0.23   0.22
!  bicc              1.01   1.07
!  sethi             0.49   0.47
!  jmpl              0.34   0.32
!  call              0.35   0.28
!  ticc              0.00   0.00
!  flush             0.51   0.59
!  save              0.51   0.51
!  restore           0.11   0.00
!  stbar             0.25   0.26
!  ldf               1.83   1.66
!  lddf              2.79   2.55
!  stf               0.30   0.34
!  stdf              0.01   0.00
!  fadds             0.28   0.18
!  fsubs             0.54   0.51
!  fmuls             0.06   0.04
!  fdivs             4.26   4.53
!  faddd             0.09   0.10
!  fsubd             0.50   0.38
!  fmuld             0.15   0.10
!  fdivd             0.08   0.06
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.47   0.36
!  fdmulq            0.00   0.00
!  fitos             0.54   0.59
!  fitod             0.43   0.36
!  fitoq             0.00   0.00
!  fstoi             0.32   0.30
!  fstod             0.33   0.53
!  fstoq             0.00   0.00
!  fdtoi             0.27   0.22
!  fdtos             0.35   0.38
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.28   0.45
!  fnegs             0.34   0.36
!  fabss             0.17   0.14
!  fsqrts            2.24   2.23
!  fsqrtd            1.80   1.48
!  fsqrtq            0.00   0.00
!  fcmps             0.41   0.36
!  fcmpd             0.45   0.57
!  fcmpq             0.00   0.00
!  fcmpes            0.02   0.00
!  fcmped            0.44   0.45
!  fcmpeq            0.00   0.00
!  fbfcc             0.87   1.05
!  ldfsr             0.03   0.00
!  stfsr             0.07   0.04
!  loop              0.49   0.43
!  offset            0.11   0.34
!  area              0.09   0.00
!  target            0.04   0.02
!  goto              0.06   0.08
!  sigsegv           0.04   0.04
!  sigbus            0.07   0.04
!  imodify           0.01   0.00
!  ldfsr_offset      0.04   0.00
!  fpattern          0.28   0.30
!  lbranch           0.01   0.00
!  shmld             8.97   9.86
!  shmst             6.18   6.27
!  shmpf             0.49   0.49
!  shmswap           0.10   0.06
!  shmblkld          0.47   0.00
!  shmblkst          0.30   0.04
!  shmblkchk         0.02   0.04
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
!  return            0.04   0.04
!  casa              0.04   0.04
!  rdasi             0.06   0.04
!  wrasi             0.11   0.14
!  bpcc              0.05   0.02
!  fbpfcc            0.16   0.14
!  fmovscc           0.06   0.06
!  fmovdcc           0.02   0.02
!  fmovqcc           0.00   0.00
!  movcc             0.06   0.08
!  flushw            0.06   0.02
!  membar            0.10   0.06
!  prefetch          0.48   0.34
!  rdpc              0.02   0.04
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.09   0.02
!  lddfa             0.01   0.00
!  ldqfa             0.00   0.00
!  ldsba             0.07   0.06
!  ldsha             0.11   0.08
!  lduba             0.06   0.04
!  lduha             0.09   0.08
!  lda               0.08   0.08
!  ldda              0.03   0.04
!  ldstuba           0.04   0.06
!  prefetcha         0.29   0.28
!  stfa              0.09   0.06
!  stdfa             0.06   0.04
!  stqfa             0.00   0.00
!  stba              0.09   0.04
!  stha              0.10   0.08
!  sta               0.08   0.08
!  stda              0.07   0.06
!  swapa             0.00   0.00
!  fmovd             0.06   0.02
!  fnegd             0.00   0.00
!  fabsd             0.08   0.08
!  fstox             0.00   0.00
!  fdtox             0.04   0.04
!  fxtos             0.01   0.04
!  fxtod             0.05   0.10
!  lds               0.08   0.06
!  ldsa              0.03   0.04
!  ldx               0.03   0.02
!  ldxa              0.03   0.00
!  nofault           0.09   0.18
!  rdgsr             0.44   0.40
!  wrgsr             0.44   0.38
!  fpadd16           0.08   0.16
!  fpadd16s          0.05   0.02
!  fpadd32           0.07   0.04
!  fpadd32s          0.37   0.53
!  fpsub16           0.04   0.00
!  fpsub16s          0.09   0.10
!  fpsub32           0.19   0.20
!  fpsub32s          0.00   0.00
!  fpack16           0.32   0.36
!  fpack32           0.07   0.14
!  fpackfix          0.09   0.14
!  fexpand           0.48   0.47
!  fpmerge           0.37   0.53
!  fmul8x16          0.11   0.10
!  fmul8x16au        0.49   0.51
!  fmul8x16al        0.27   0.26
!  fmul8sux16        0.05   0.06
!  fmul8ulx16        0.34   0.28
!  fmuld8sux16       0.21   0.12
!  fmuld8ulx16       0.28   0.22
!  alignaddr         0.31   0.28
!  alignaddrl        0.20   0.20
!  faligndata        0.47   0.59
!  fzero             0.21   0.10
!  fzeros            0.08   0.06
!  fone              0.49   0.49
!  fones             0.19   0.20
!  fsrc1             0.23   0.26
!  fsrc1s            0.45   0.43
!  fsrc2             0.36   0.36
!  fsrc2s            0.20   0.34
!  fnot1             0.03   0.06
!  fnot1s            0.15   0.20
!  fnot2             0.34   0.30
!  fnot2s            0.11   0.08
!  for               0.27   0.30
!  fors              0.40   0.40
!  fnor              0.33   0.24
!  fnors             0.15   0.22
!  fand              0.26   0.16
!  fands             0.26   0.32
!  fnand             0.11   0.16
!  fnands            0.02   0.06
!  fxor              0.47   0.40
!  fxors             0.28   0.34
!  fxnor             0.40   0.36
!  fxnors            0.08   0.06
!  fornot1           0.24   0.24
!  fornot1s          0.05   0.04
!  fornot2           0.22   0.22
!  fornot2s          0.20   0.20
!  fandnot1          0.01   0.00
!  fandnot1s         0.07   0.10
!  fandnot2          0.11   0.14
!  fandnot2s         0.34   0.24
!  fcmpgt16          0.44   0.32
!  fcmpgt32          0.13   0.08
!  fcmple16          0.51   0.43
!  fcmple32          0.02   0.00
!  fcmpne16          0.37   0.38
!  fcmpne32          0.06   0.12
!  fcmpeq16          0.08   0.02
!  fcmpeq32          0.40   0.55
!  edge8             0.03   0.04
!  edge8l            0.41   0.69
!  edge16            0.24   0.24
!  edge16l           0.41   0.49
!  edge32            0.52   0.55
!  edge32l           0.08   0.04
!  pdist             0.19   0.30
!  partial_st8       0.05   0.04
!  partial_st16      0.33   0.26
!  partial_st32      0.44   0.38
!  short_st8         0.30   0.40
!  short_st16        0.22   0.16
!  short_ld8         0.53   0.38
!  short_ld16        0.22   0.24
!  blkld             0.52   0.00
!  blkst             0.48   0.00
!  blkld_offset      0.14   0.00
!  blkst_offset      0.02   0.00
!  blk_check         0.44   0.49
!  casxa             0.07   0.12
!  rdccr             0.47   0.47
!  rdfprs            0.22   0.20
!  wrccr             0.31   0.38
!  popc              0.31   0.47
!  wrfprs            0.26   0.40
!  stx               0.22   0.14
!  stxa              0.42   0.30
!  cflush            0.00   0.00
!  array8            0.21   0.10
!  array16           0.47   0.45
!  array32           0.09   0.14
!  edge8n            0.21   0.16
!  edge8ln           0.06   0.06
!  edge16n           0.00   0.00
!  edge16ln          0.06   0.04
!  edge32n           0.17   0.18
!  edge32ln          0.33   0.34
!  bmask             0.49   0.51
!  bshuffle          0.39   0.43
!  siam              0.05   0.12
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
KDATA_MODULE(t0_module_offset_table, 0x089b8000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff8
	.word	0xffffffe0
	.word	0x00000010
	.word	0x00000018
	.word	0x00000000
	.word	0xfffffff0
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

KDATA_MODULE(t0_module_data_in_regs, 0x3308a000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xf2f65cbf          ! %f0
	.word	0xb7ab5db1          ! %f1
	.word	0x9374636d          ! %f2
	.word	0x8f44ac5f          ! %f3
	.word	0x5a7fba80          ! %f4
	.word	0xdb9c27b7          ! %f5
	.word	0xee3073ad          ! %f6
	.word	0x7217d0d1          ! %f7
	.word	0xa25acd76          ! %f8
	.word	0xc3264a7d          ! %f9
	.word	0x61baf069          ! %f10
	.word	0x314d1713          ! %f11
	.word	0xbaa60a7d          ! %f12
	.word	0xc7965cf5          ! %f13
	.word	0x907bfca7          ! %f14
	.word	0x4b4f56b5          ! %f15
	.word	0x722b8f1e          ! %f16
	.word	0xed71ef34          ! %f17
	.word	0xb1f27aef          ! %f18
	.word	0xe8daf73c          ! %f19
	.word	0x075d1bcb          ! %f20
	.word	0xb14a3165          ! %f21
	.word	0x8b545b31          ! %f22
	.word	0x4569f239          ! %f23
	.word	0xea9eee68          ! %f24
	.word	0xeb9d95ff          ! %f25
	.word	0xce4b62e6          ! %f26
	.word	0x5a956296          ! %f27
	.word	0x5707410d          ! %f28
	.word	0xbaf4e33a          ! %f29
	.word	0x93f3d374          ! %f30
	.word	0x24303533          ! %f31
	.word	0x6cd0710a          ! %f32
	.word	0xc53b67be          ! %f33
	.word	0x1cb492d6          ! %f34
	.word	0x3303ceb0          ! %f35
	.word	0xe018122b          ! %f36
	.word	0x0519469d          ! %f37
	.word	0xfcdeba7c          ! %f38
	.word	0x7950ba8c          ! %f39
	.word	0x6765723c          ! %f40
	.word	0x69120e83          ! %f41
	.word	0xd47cb06f          ! %f42
	.word	0x03c2b76f          ! %f43
	.word	0xf41650cf          ! %f44
	.word	0xe799102c          ! %f45
	.word	0x6c972eb8          ! %f46
	.word	0xfca8b4c3          ! %f47
	.word	0x7b78cf3c          ! %f48
	.word	0x28702815          ! %f49
	.word	0x07b8dd02          ! %f50
	.word	0x0b369588          ! %f51
	.word	0x0e45dce8          ! %f52
	.word	0x47bcef75          ! %f53
	.word	0x34df607e          ! %f54
	.word	0x169fcc68          ! %f55
	.word	0x0d9fa3ca          ! %f56
	.word	0x7d8b886e          ! %f57
	.word	0xfd930606          ! %f58
	.word	0x3a372509          ! %f59
	.word	0x1cebb92b          ! %f60
	.word	0x0c357980          ! %f61
	.word	0xb7cc6a84          ! %f62
	.word	0x6db14ea2          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x5bc       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xbd4cd4b9          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x3b7b362b          ! %o0
	.word	0x1a73bb65          ! %o1
	.word	0x70abd2ec          ! %o2
	.word	0x055b7012          ! %o3
	.word	0x6f52a5ca          ! %o4
	.word	0xaf518c2b          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xa71916ac          ! %l0
	.word	0xe4964c3d          ! %l1
	.word	0x9ce1c595          ! %l2
	.word	0x006cfbd0          ! %l3
	.word	0x585e1f8d          ! %l4
	.word	0x075ee342          ! %l5
	.word	0xee2bba68          ! %l6
	.word	0x917cabaa          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffff4          ! %i2 (byte offset)
	.word	0xffffffec          ! %i3 (halfword offset)
	.word	0x00000014          ! %i4 (word offset)
	.word	0xfffffff0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x50fd092a          ! %y
	.word	0x0000000e          ! %icc (nzvc)
	.word	0x000008a2          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x11bde000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x2dabc339
	.word	0xbea17483
	.word	0x1cad966e
	.word	0xbdb7b856
	.word	0x0896a5b1
	.word	0xc17dc926
	.word	0x8465efef
	.word	0xca45554f
	.word	0x56d5b5fc
	.word	0x44c42813
	.word	0x223eb30c
	.word	0xae107b4b
	.word	0x58fb3ae9
	.word	0xef9b1b66
	.word	0x279877b8
	.word	0x635c759b
	.word	0xab2e9784
	.word	0xa3e9213e
	.word	0x856ed9f0
	.word	0xde27b091
	.word	0xde6c28bc
	.word	0xaad7628e
	.word	0xb3b2c9ff
	.word	0x086cfe78
	.word	0xad32d946
	.word	0x23c88335
	.word	0xd9c31cfd
	.word	0x00ffb7c4
	.word	0x4c1c8fc1
	.word	0x0963df4b
	.word	0x6ebf2198
	.word	0xad0d2a8a
	.word	0xff0cdb1b
	.word	0x4986c9bd
	.word	0x31e73d16
	.word	0x7e010d31
	.word	0x70738132
	.word	0x6ff2a01b
	.word	0x5bfbd49a
	.word	0xbf31e86a
	.word	0xefd6d3be
	.word	0x89a7c7b0
	.word	0xd2cb06a5
	.word	0x5b95ac5d
	.word	0x81b3ef6d
	.word	0xcd4ae7d3
	.word	0x6c21f8df
	.word	0xd30de524
	.word	0xbb01494f
	.word	0x6cf2f57c
	.word	0x655ebe17
	.word	0xbbde427c
	.word	0x90822e74
	.word	0xc493e419
	.word	0xdd2c1888
	.word	0x56d766b9
	.word	0x43e019d2
	.word	0xf7230fa2
	.word	0x95c09c5e
	.word	0x46eb30fa
	.word	0x4869046c
	.word	0x68cfb3ea
	.word	0x938ef678
	.word	0xb67ef69e
	.word	0x95a013b1
	.word	0x5f7b0538
	.word	0x56ed5b6e
	.word	0x21235ff6
	.word	0x48c04a21
	.word	0x4140be16
	.word	0xc31662d4
	.word	0x8ea0dc3b
	.word	0x76271e36
	.word	0x549a3668
	.word	0x1245d2c0
	.word	0x77c2e0c2
	.word	0x8a971b81
	.word	0xcbb357bf
	.word	0x11d81f89
	.word	0x6d3b676e
	.word	0xe8a0f212
	.word	0x162a02ef
	.word	0xe27ba3d1
	.word	0x409b6065
	.word	0x7a83981d
	.word	0x96e5bade
	.word	0x7beed4c6
	.word	0x25f40b05
	.word	0x92ba61d9
	.word	0xa83ea89e
	.word	0x99b6f6a4
	.word	0x85806a19
	.word	0xa77a33ab
	.word	0x5c884cbe
	.word	0xa2ef157d
	.word	0xeef54747
	.word	0x95cd3284
	.word	0x458571dd
	.word	0xbb07463c
	.word	0x770979cd
	.word	0x2a0e9686
	.word	0x3790347f
	.word	0xe04873e7
	.word	0x52af646c
	.word	0x937e83ed
	.word	0xfe9a3423
	.word	0xbf713d23
	.word	0x8d93dea3
	.word	0x31c00e2c
	.word	0x30d64194
	.word	0x6604a5fd
	.word	0x8205fd20
	.word	0x4391c956
	.word	0x261e1e7f
	.word	0xf72ba1e7
	.word	0x32ae6d73
	.word	0x78338dbf
	.word	0xe13c2245
	.word	0xf596b9ff
	.word	0xb9b45904
	.word	0x36f251e3
	.word	0xc269d812
	.word	0x17dd5397
	.word	0xc8590347
	.word	0xb47d3e85
	.word	0xd5d1ea2e
	.word	0x38ac5af1
	.word	0x3cf2972d
	.word	0x2235611b
	.word	0xbef4ee93
	.word	0x10ee564a
	.word	0x66c1d7dd
	.word	0x8adba069
	.word	0xb7b5e8be
	.word	0x94332519
	.word	0xdea5a8a3
	.word	0x5016d76b
	.word	0x00cc94c9
	.word	0x0f3def98
	.word	0x546aa028
	.word	0xdf863a77
	.word	0xf6a8cfb9
	.word	0x62040a83
	.word	0x31a41ae3
	.word	0xaab26aa3
	.word	0xd2b3b115
	.word	0xb1cfd31f
	.word	0x0fdf80cf
	.word	0xe571db63
	.word	0xda9029b7
	.word	0xd9e6c77d
	.word	0x3fd9b25e
	.word	0x207b6e76
	.word	0x56c63be5
	.word	0x51425eff
	.word	0xbd69d0ad
	.word	0xbc2c6a03
	.word	0x6d6120a3
	.word	0x96df671b
	.word	0x1753d4f8
	.word	0x08352cfe
	.word	0xccb9ee42
	.word	0xe41fe85e
	.word	0xee68ab4f
	.word	0xf23245d0
	.word	0xa42d943c
	.word	0x91f7d7b4
	.word	0x9380c48a
t0_data_in_sp:
	.word	0x8d6dcf37
	.word	0x85164043
	.word	0x7a5d17e6
	.word	0x03395379
	.word	0xcb5f376a
	.word	0x8b4d8097
	.word	0x9ff78f63
	.word	0x882ba960
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffff8
	.word	0x00000008
	.word	0x00000014
	.word	0xffffffe0
	.word	t0_data_in_fp
	.word	0xfedeb49b
	.word	0xfbbb4087
	.word	0xdaff6cbb
	.word	0x414e201d
	.word	0xe7628600
	.word	0x0bde48a4
	.word	0x26acda73
	.word	0x2e311f2c
	.word	0xa614d883
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
	.word   	0x2b1e9e43	! [%fp - 0xc]
	.word   	0x279a634f	! [%fp - 0x8]
	.word   	0x556687b7	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x21c077d2
	.word	0xff2f5d42
	.word	0x6011d94b
	.word	0x234d08c6
	.word	0x7d13c460
	.word	0x98aa30ff
	.word	0x417cc7c7
	.word	0x0a0705da
	.word	0x4bb63278
	.word	0xdbd267d4
	.word	0x80ac5abe
	.word	0x39c0c00c
	.word	0x364e2695
	.word	0x90773ae5
	.word	0x465c053d
	.word	0xb4cd6d75
	.word	0xf617c2f0
	.word	0xda4c4e18
	.word	0x6b939b11
	.word	0xf273e2d0
	.word	0x21a27a59
	.word	0xeafbac64
	.word	0xfaa4d1c2
	.word	0x05a9b35e
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x75918000)
.seg "data"
t0_data_in_area0_start:
.skip 6272
t0_data_in_area0_begin:
	.word	0xe7547c4a	! t0_data_in_area0-0x20
	.word	0x79a4c44f	! t0_data_in_area0-0x1c
	.word	0x68cb5cc0	! t0_data_in_area0-0x18
	.word	0x1785eb09	! t0_data_in_area0-0x14
	.word	0x14b04e38	! t0_data_in_area0-0x10
	.word	0x94b028b1	! t0_data_in_area0-0xc
	.word	0xd93618dc	! t0_data_in_area0-0x8
	.word	0xd622c6cc	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xcc4a262c	! t0_data_in_area0+0x0
	.word	0x631819bd	! t0_data_in_area0+0x4
	.word	0x5bb2faf9	! t0_data_in_area0+0x8
	.word	0xc2380f51	! t0_data_in_area0+0xc
	.word	0x051fda92	! t0_data_in_area0+0x10
	.word	0x4dc21a41	! t0_data_in_area0+0x14
	.word	0x969eb602	! t0_data_in_area0+0x18
	.word	0x6e2df9db	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 1856
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x518aa000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x65df7b51	! t0_data_in_shm_area+0x0 (t0)
	.word	0x4086152c	! t0_data_in_shm_area+0x4 (t0)
	.word	0xf0544c1e	! t0_data_in_shm_area+0x8 (t0)
	.word	0x5302b366	! t0_data_in_shm_area+0xc (t0)
	.word	0xa2d5e81b	! t0_data_in_shm_area+0x10 (t0)
	.word	0x7143d751	! t0_data_in_shm_area+0x14 (t0)
	.word	0xd767ff22	! t0_data_in_shm_area+0x18 (t0)
	.word	0xc85afa0b	! t0_data_in_shm_area+0x1c (t0)
	.word	0x26fff805	! t0_data_in_shm_area+0x20 (t0)
	.word	0x9a2fe16a	! t0_data_in_shm_area+0x24 (t0)
	.word	0xadbc5447	! t0_data_in_shm_area+0x28 (t0)
	.word	0x7fb868a9	! t0_data_in_shm_area+0x2c (t0)
	.word	0x454e0659	! t0_data_in_shm_area+0x30 (t0)
	.word	0x4f8cd65e	! t0_data_in_shm_area+0x34 (t0)
	.word	0x80371f1c	! t0_data_in_shm_area+0x38 (t0)
	.word	0x155658c1	! t0_data_in_shm_area+0x3c (t0)
	.word	0x4fd2f8ab	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x109709c6	! t0_data_in_shm_area+0x44
	.word	0xb6c7c7be	! t0_data_in_shm_area+0x48
	.word	0x75d87ea2	! t0_data_in_shm_area+0x4c
	.word	0xec95122a	! t0_data_in_shm_area+0x50
	.word	0xabbbf2ad	! t0_data_in_shm_area+0x54
	.word	0x55cf4045	! t0_data_in_shm_area+0x58
	.word	0xfd04a3c5	! t0_data_in_shm_area+0x5c
	.word	0x94482837	! t0_data_in_shm_area+0x60
	.word	0x4f8f8697	! t0_data_in_shm_area+0x64
	.word	0x060d5d81	! t0_data_in_shm_area+0x68
	.word	0xf173237a	! t0_data_in_shm_area+0x6c
	.word	0xeb9e0c3b	! t0_data_in_shm_area+0x70
	.word	0x388dc0c4	! t0_data_in_shm_area+0x74
	.word	0x9a3e86e5	! t0_data_in_shm_area+0x78
	.word	0xe1b80dc3	! t0_data_in_shm_area+0x7c
	.word	0x45533eb5	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xe7d6d9b5	! t0_data_in_shm_area+0x84
	.word	0x1ccff1c3	! t0_data_in_shm_area+0x88
	.word	0x1341147f	! t0_data_in_shm_area+0x8c
	.word	0x0eeb3f91	! t0_data_in_shm_area+0x90
	.word	0x84f8f2ef	! t0_data_in_shm_area+0x94
	.word	0xf3bfdbb9	! t0_data_in_shm_area+0x98
	.word	0xb842a6ca	! t0_data_in_shm_area+0x9c
	.word	0xc5710fc0	! t0_data_in_shm_area+0xa0
	.word	0xd4c23afe	! t0_data_in_shm_area+0xa4
	.word	0x7022786b	! t0_data_in_shm_area+0xa8
	.word	0xb2d0dea3	! t0_data_in_shm_area+0xac
	.word	0xb7c5b804	! t0_data_in_shm_area+0xb0
	.word	0xa542cdbc	! t0_data_in_shm_area+0xb4
	.word	0x311b8671	! t0_data_in_shm_area+0xb8
	.word	0xdde724d0	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x342b4000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xf2f65cbf          ! %f0
	.word	0xb7ab5db1          ! %f1
	.word	0x9374636d          ! %f2
	.word	0x8f44ac5f          ! %f3
	.word	0x5a7fba80          ! %f4
	.word	0xdb9c27b7          ! %f5
	.word	0xee3073ad          ! %f6
	.word	0x7217d0d1          ! %f7
	.word	0xa25acd76          ! %f8
	.word	0xc3264a7d          ! %f9
	.word	0x61baf069          ! %f10
	.word	0x314d1713          ! %f11
	.word	0xbaa60a7d          ! %f12
	.word	0xc7965cf5          ! %f13
	.word	0x907bfca7          ! %f14
	.word	0x4b4f56b5          ! %f15
	.word	0x722b8f1e          ! %f16
	.word	0xed71ef34          ! %f17
	.word	0xb1f27aef          ! %f18
	.word	0xe8daf73c          ! %f19
	.word	0x075d1bcb          ! %f20
	.word	0xb14a3165          ! %f21
	.word	0x8b545b31          ! %f22
	.word	0x4569f239          ! %f23
	.word	0xea9eee68          ! %f24
	.word	0xeb9d95ff          ! %f25
	.word	0xce4b62e6          ! %f26
	.word	0x5a956296          ! %f27
	.word	0x5707410d          ! %f28
	.word	0xbaf4e33a          ! %f29
	.word	0x93f3d374          ! %f30
	.word	0x24303533          ! %f31
	.word	0x6cd0710a          ! %f32
	.word	0xc53b67be          ! %f33
	.word	0x1cb492d6          ! %f34
	.word	0x3303ceb0          ! %f35
	.word	0xe018122b          ! %f36
	.word	0x0519469d          ! %f37
	.word	0xfcdeba7c          ! %f38
	.word	0x7950ba8c          ! %f39
	.word	0x6765723c          ! %f40
	.word	0x69120e83          ! %f41
	.word	0xd47cb06f          ! %f42
	.word	0x03c2b76f          ! %f43
	.word	0xf41650cf          ! %f44
	.word	0xe799102c          ! %f45
	.word	0x6c972eb8          ! %f46
	.word	0xfca8b4c3          ! %f47
	.word	0x7b78cf3c          ! %f48
	.word	0x28702815          ! %f49
	.word	0x07b8dd02          ! %f50
	.word	0x0b369588          ! %f51
	.word	0x0e45dce8          ! %f52
	.word	0x47bcef75          ! %f53
	.word	0x34df607e          ! %f54
	.word	0x169fcc68          ! %f55
	.word	0x0d9fa3ca          ! %f56
	.word	0x7d8b886e          ! %f57
	.word	0xfd930606          ! %f58
	.word	0x3a372509          ! %f59
	.word	0x1cebb92b          ! %f60
	.word	0x0c357980          ! %f61
	.word	0xb7cc6a84          ! %f62
	.word	0x6db14ea2          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x5bc       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xbd4cd4b9          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x3b7b362b          ! %o0
	.word	0x1a73bb65          ! %o1
	.word	0x70abd2ec          ! %o2
	.word	0x055b7012          ! %o3
	.word	0x6f52a5ca          ! %o4
	.word	0xaf518c2b          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xa71916ac          ! %l0
	.word	0xe4964c3d          ! %l1
	.word	0x9ce1c595          ! %l2
	.word	0x006cfbd0          ! %l3
	.word	0x585e1f8d          ! %l4
	.word	0x075ee342          ! %l5
	.word	0xee2bba68          ! %l6
	.word	0x917cabaa          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffff4          ! %i2 (byte offset)
	.word	0xffffffec          ! %i3 (halfword offset)
	.word	0x00000014          ! %i4 (word offset)
	.word	0xfffffff0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x50fd092a          ! %y
	.word	0x0000000e          ! %icc (nzvc)
	.word	0x000008a2          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x5dd52000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x2dabc339
	.word	0xbea17483
	.word	0x1cad966e
	.word	0xbdb7b856
	.word	0x0896a5b1
	.word	0xc17dc926
	.word	0x8465efef
	.word	0xca45554f
	.word	0x56d5b5fc
	.word	0x44c42813
	.word	0x223eb30c
	.word	0xae107b4b
	.word	0x58fb3ae9
	.word	0xef9b1b66
	.word	0x279877b8
	.word	0x635c759b
	.word	0xab2e9784
	.word	0xa3e9213e
	.word	0x856ed9f0
	.word	0xde27b091
	.word	0xde6c28bc
	.word	0xaad7628e
	.word	0xb3b2c9ff
	.word	0x086cfe78
	.word	0xad32d946
	.word	0x23c88335
	.word	0xd9c31cfd
	.word	0x00ffb7c4
	.word	0x4c1c8fc1
	.word	0x0963df4b
	.word	0x6ebf2198
	.word	0xad0d2a8a
	.word	0xff0cdb1b
	.word	0x4986c9bd
	.word	0x31e73d16
	.word	0x7e010d31
	.word	0x70738132
	.word	0x6ff2a01b
	.word	0x5bfbd49a
	.word	0xbf31e86a
	.word	0xefd6d3be
	.word	0x89a7c7b0
	.word	0xd2cb06a5
	.word	0x5b95ac5d
	.word	0x81b3ef6d
	.word	0xcd4ae7d3
	.word	0x6c21f8df
	.word	0xd30de524
	.word	0xbb01494f
	.word	0x6cf2f57c
	.word	0x655ebe17
	.word	0xbbde427c
	.word	0x90822e74
	.word	0xc493e419
	.word	0xdd2c1888
	.word	0x56d766b9
	.word	0x43e019d2
	.word	0xf7230fa2
	.word	0x95c09c5e
	.word	0x46eb30fa
	.word	0x4869046c
	.word	0x68cfb3ea
	.word	0x938ef678
	.word	0xb67ef69e
	.word	0x95a013b1
	.word	0x5f7b0538
	.word	0x56ed5b6e
	.word	0x21235ff6
	.word	0x48c04a21
	.word	0x4140be16
	.word	0xc31662d4
	.word	0x8ea0dc3b
	.word	0x76271e36
	.word	0x549a3668
	.word	0x1245d2c0
	.word	0x77c2e0c2
	.word	0x8a971b81
	.word	0xcbb357bf
	.word	0x11d81f89
	.word	0x6d3b676e
	.word	0xe8a0f212
	.word	0x162a02ef
	.word	0xe27ba3d1
	.word	0x409b6065
	.word	0x7a83981d
	.word	0x96e5bade
	.word	0x7beed4c6
	.word	0x25f40b05
	.word	0x92ba61d9
	.word	0xa83ea89e
	.word	0x99b6f6a4
	.word	0x85806a19
	.word	0xa77a33ab
	.word	0x5c884cbe
	.word	0xa2ef157d
	.word	0xeef54747
	.word	0x95cd3284
	.word	0x458571dd
	.word	0xbb07463c
	.word	0x770979cd
	.word	0x2a0e9686
	.word	0x3790347f
	.word	0xe04873e7
	.word	0x52af646c
	.word	0x937e83ed
	.word	0xfe9a3423
	.word	0xbf713d23
	.word	0x8d93dea3
	.word	0x31c00e2c
	.word	0x30d64194
	.word	0x6604a5fd
	.word	0x8205fd20
	.word	0x4391c956
	.word	0x261e1e7f
	.word	0xf72ba1e7
	.word	0x32ae6d73
	.word	0x78338dbf
	.word	0xe13c2245
	.word	0xf596b9ff
	.word	0xb9b45904
	.word	0x36f251e3
	.word	0xc269d812
	.word	0x17dd5397
	.word	0xc8590347
	.word	0xb47d3e85
	.word	0xd5d1ea2e
	.word	0x38ac5af1
	.word	0x3cf2972d
	.word	0x2235611b
	.word	0xbef4ee93
	.word	0x10ee564a
	.word	0x66c1d7dd
	.word	0x8adba069
	.word	0xb7b5e8be
	.word	0x94332519
	.word	0xdea5a8a3
	.word	0x5016d76b
	.word	0x00cc94c9
	.word	0x0f3def98
	.word	0x546aa028
	.word	0xdf863a77
	.word	0xf6a8cfb9
	.word	0x62040a83
	.word	0x31a41ae3
	.word	0xaab26aa3
	.word	0xd2b3b115
	.word	0xb1cfd31f
	.word	0x0fdf80cf
	.word	0xe571db63
	.word	0xda9029b7
	.word	0xd9e6c77d
	.word	0x3fd9b25e
	.word	0x207b6e76
	.word	0x56c63be5
	.word	0x51425eff
	.word	0xbd69d0ad
	.word	0xbc2c6a03
	.word	0x6d6120a3
	.word	0x96df671b
	.word	0x1753d4f8
	.word	0x08352cfe
	.word	0xccb9ee42
	.word	0xe41fe85e
	.word	0xee68ab4f
	.word	0xf23245d0
	.word	0xa42d943c
	.word	0x91f7d7b4
	.word	0x9380c48a
t0_data_exp_sp:
	.word	0x8d6dcf37
	.word	0x85164043
	.word	0x7a5d17e6
	.word	0x03395379
	.word	0xcb5f376a
	.word	0x8b4d8097
	.word	0x9ff78f63
	.word	0x882ba960
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffff8
	.word	0x00000008
	.word	0x00000014
	.word	0xffffffe0
	.word	t0_data_exp_fp
	.word	0xfedeb49b
	.word	0xfbbb4087
	.word	0xdaff6cbb
	.word	0x414e201d
	.word	0xe7628600
	.word	0x0bde48a4
	.word	0x26acda73
	.word	0x2e311f2c
	.word	0xa614d883
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
	.word   	0x2b1e9e43	! [%fp - 0xc]
	.word   	0x279a634f	! [%fp - 0x8]
	.word   	0x556687b7	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x21c077d2
	.word	0xff2f5d42
	.word	0x6011d94b
	.word	0x234d08c6
	.word	0x7d13c460
	.word	0x98aa30ff
	.word	0x417cc7c7
	.word	0x0a0705da
	.word	0x4bb63278
	.word	0xdbd267d4
	.word	0x80ac5abe
	.word	0x39c0c00c
	.word	0x364e2695
	.word	0x90773ae5
	.word	0x465c053d
	.word	0xb4cd6d75
	.word	0xf617c2f0
	.word	0xda4c4e18
	.word	0x6b939b11
	.word	0xf273e2d0
	.word	0x21a27a59
	.word	0xeafbac64
	.word	0xfaa4d1c2
	.word	0x05a9b35e
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x1c208000)
.seg "data"
t0_data_exp_area0_start:
.skip 6272
t0_data_exp_area0_begin:
	.word	0xe7547c4a	! t0_data_exp_area0-0x20
	.word	0x79a4c44f	! t0_data_exp_area0-0x1c
	.word	0x68cb5cc0	! t0_data_exp_area0-0x18
	.word	0x1785eb09	! t0_data_exp_area0-0x14
	.word	0x14b04e38	! t0_data_exp_area0-0x10
	.word	0x94b028b1	! t0_data_exp_area0-0xc
	.word	0xd93618dc	! t0_data_exp_area0-0x8
	.word	0xd622c6cc	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xcc4a262c	! t0_data_exp_area0+0x0
	.word	0x631819bd	! t0_data_exp_area0+0x4
	.word	0x5bb2faf9	! t0_data_exp_area0+0x8
	.word	0xc2380f51	! t0_data_exp_area0+0xc
	.word	0x051fda92	! t0_data_exp_area0+0x10
	.word	0x4dc21a41	! t0_data_exp_area0+0x14
	.word	0x969eb602	! t0_data_exp_area0+0x18
	.word	0x6e2df9db	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 1856
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x1da34000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x65df7b51	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x4086152c	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xf0544c1e	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x5302b366	! t0_data_exp_shm_area+0xc (t0)
	.word	0xa2d5e81b	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x7143d751	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xd767ff22	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xc85afa0b	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x26fff805	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x9a2fe16a	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xadbc5447	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x7fb868a9	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x454e0659	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x4f8cd65e	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x80371f1c	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x155658c1	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x4fd2f8ab	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x109709c6	! t0_data_exp_shm_area+0x44
	.word	0xb6c7c7be	! t0_data_exp_shm_area+0x48
	.word	0x75d87ea2	! t0_data_exp_shm_area+0x4c
	.word	0xec95122a	! t0_data_exp_shm_area+0x50
	.word	0xabbbf2ad	! t0_data_exp_shm_area+0x54
	.word	0x55cf4045	! t0_data_exp_shm_area+0x58
	.word	0xfd04a3c5	! t0_data_exp_shm_area+0x5c
	.word	0x94482837	! t0_data_exp_shm_area+0x60
	.word	0x4f8f8697	! t0_data_exp_shm_area+0x64
	.word	0x060d5d81	! t0_data_exp_shm_area+0x68
	.word	0xf173237a	! t0_data_exp_shm_area+0x6c
	.word	0xeb9e0c3b	! t0_data_exp_shm_area+0x70
	.word	0x388dc0c4	! t0_data_exp_shm_area+0x74
	.word	0x9a3e86e5	! t0_data_exp_shm_area+0x78
	.word	0xe1b80dc3	! t0_data_exp_shm_area+0x7c
	.word	0x45533eb5	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xe7d6d9b5	! t0_data_exp_shm_area+0x84
	.word	0x1ccff1c3	! t0_data_exp_shm_area+0x88
	.word	0x1341147f	! t0_data_exp_shm_area+0x8c
	.word	0x0eeb3f91	! t0_data_exp_shm_area+0x90
	.word	0x84f8f2ef	! t0_data_exp_shm_area+0x94
	.word	0xf3bfdbb9	! t0_data_exp_shm_area+0x98
	.word	0xb842a6ca	! t0_data_exp_shm_area+0x9c
	.word	0xc5710fc0	! t0_data_exp_shm_area+0xa0
	.word	0xd4c23afe	! t0_data_exp_shm_area+0xa4
	.word	0x7022786b	! t0_data_exp_shm_area+0xa8
	.word	0xb2d0dea3	! t0_data_exp_shm_area+0xac
	.word	0xb7c5b804	! t0_data_exp_shm_area+0xb0
	.word	0xa542cdbc	! t0_data_exp_shm_area+0xb4
	.word	0x311b8671	! t0_data_exp_shm_area+0xb8
	.word	0xdde724d0	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d3a9792b1c64
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    6272
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x65854000
#define T0_KAOS_BOOT_PA                  0x0000000000c74000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x44cb2000
#define T0_KAOS_STARTUP_PA               0x000000000312e000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x089b8000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000005d2c000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x6c4d0000
#define T0_KAOS_DONE_PA                  0x0000000007ce0000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x159e0000
#define T0_KAOS_KTBL_PA                  0x00000000081f2000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x73344000
#define T0_KAOS_SUBR0_PA                 0x000000000baa2000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x7fb36000
#define T0_KAOS_SUBR1_PA                 0x000000000c5da000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x1544e000
#define T0_KAOS_SUBR2_PA                 0x000000000e8f8000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x15944000
#define T0_KAOS_SUBR3_PA                 0x0000000011afc000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x342b4000
#define T0_KAOS_EXP_REGS_PA              0x0000000012342000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x3308a000
#define T0_KAOS_RUN_REGS_PA              0x0000000014c70000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x5dd52000
#define T0_KAOS_EXP_STACK_PA             0x000000001743a000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x11bde000
#define T0_KAOS_RUN_STACK_PA             0x0000000019c4e000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x1c208000
#define T0_KAOS_EXP_AREA0_PA             0x000000001af94000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x75918000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c30c000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x1da34000
#define T0_KAOS_EXP_SHM_AREA_PA          0x000000000118e000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x518aa000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000001ee000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xca4fe90b
#define T0_KAOS_RANVAL_01     0xd3d5d4d2
#define T0_KAOS_RANVAL_02     0x5aa7bf93
#define T0_KAOS_RANVAL_03     0xe3ebaefe
#define T0_KAOS_RANVAL_04     0x717d08bf
#define T0_KAOS_RANVAL_05     0x097dac7f
#define T0_KAOS_RANVAL_06     0x6e909833
#define T0_KAOS_RANVAL_07     0xb36a3c2b
#define T0_KAOS_RANVAL_08     0x8eb540dc
#define T0_KAOS_RANVAL_09     0xdc571098
#define T0_KAOS_RANVAL_0a     0xfc98020a
#define T0_KAOS_RANVAL_0b     0x6893b348
#define T0_KAOS_RANVAL_0c     0xfb6962c2
#define T0_KAOS_RANVAL_0d     0x5ea395cf
#define T0_KAOS_RANVAL_0e     0xb5912616
#define T0_KAOS_RANVAL_0f     0xaac68819
#define T0_KAOS_RANVAL_10     0xa0fab48c
#define T0_KAOS_RANVAL_11     0xf52bf337
#define T0_KAOS_RANVAL_12     0x3ef649d3
#define T0_KAOS_RANVAL_13     0xd33e0a60
#define T0_KAOS_RANVAL_14     0x9fa9fb60
#define T0_KAOS_RANVAL_15     0x0bbee007
#define T0_KAOS_RANVAL_16     0x70db53a8
#define T0_KAOS_RANVAL_17     0xe3450339
#define T0_KAOS_RANVAL_18     0x6bbc5708
#define T0_KAOS_RANVAL_19     0x5f99899d
#define T0_KAOS_RANVAL_1a     0x221fa2a4
#define T0_KAOS_RANVAL_1b     0x2f2a44c7
#define T0_KAOS_RANVAL_1c     0xf3d9c2c1
#define T0_KAOS_RANVAL_1d     0xd8d2e5c6
#define T0_KAOS_RANVAL_1e     0xf5b92d69
#define T0_KAOS_RANVAL_1f     0x65fc1010
#define T0_KAOS_RANVAL_20     0xef924f53
#define T0_KAOS_RANVAL_21     0x8db3653c
#define T0_KAOS_RANVAL_22     0x9b1e1c68
#define T0_KAOS_RANVAL_23     0x1ef97525
#define T0_KAOS_RANVAL_24     0xce346a61
#define T0_KAOS_RANVAL_25     0x9176ca6f
#define T0_KAOS_RANVAL_26     0xf271534e
#define T0_KAOS_RANVAL_27     0x92f71186
#define T0_KAOS_RANVAL_28     0x65efc702
#define T0_KAOS_RANVAL_29     0xa38e2888
#define T0_KAOS_RANVAL_2a     0x86699dbd
#define T0_KAOS_RANVAL_2b     0x83e6d0c3
#define T0_KAOS_RANVAL_2c     0x4ee5bb8f
#define T0_KAOS_RANVAL_2d     0x01544eaa
#define T0_KAOS_RANVAL_2e     0xc932733f
#define T0_KAOS_RANVAL_2f     0x55889366
#define T0_KAOS_RANVAL_30     0xae8128be
#define T0_KAOS_RANVAL_31     0x5287237a
#define T0_KAOS_RANVAL_32     0xa2008677
#define T0_KAOS_RANVAL_33     0xea43e010
#define T0_KAOS_RANVAL_34     0x5a7d3def
#define T0_KAOS_RANVAL_35     0x7cfcb4e1
#define T0_KAOS_RANVAL_36     0xbe039399
#define T0_KAOS_RANVAL_37     0x448902e1
#define T0_KAOS_RANVAL_38     0x79a3aec6
#define T0_KAOS_RANVAL_39     0xb6330010
#define T0_KAOS_RANVAL_3a     0x1402221b
#define T0_KAOS_RANVAL_3b     0x2a1a3f1d
#define T0_KAOS_RANVAL_3c     0xc7c02df9
#define T0_KAOS_RANVAL_3d     0x45c5b5c4
#define T0_KAOS_RANVAL_3e     0x65832dac
#define T0_KAOS_RANVAL_3f     0xe983f70b
#define T0_KAOS_RANVAL_40     0x1bd0416a
#define T0_KAOS_RANVAL_41     0x7ac57ecb
#define T0_KAOS_RANVAL_42     0xbe34ea65
#define T0_KAOS_RANVAL_43     0xe514ee20
#define T0_KAOS_RANVAL_44     0xd053c378
#define T0_KAOS_RANVAL_45     0x7ba084c5
#define T0_KAOS_RANVAL_46     0xf17f183d
#define T0_KAOS_RANVAL_47     0x0816095d
#define T0_KAOS_RANVAL_48     0xd713a591
#define T0_KAOS_RANVAL_49     0xfd04432f
#define T0_KAOS_RANVAL_4a     0x822299c2
#define T0_KAOS_RANVAL_4b     0xcd1331f5
#define T0_KAOS_RANVAL_4c     0x08f9c80b
#define T0_KAOS_RANVAL_4d     0xfc1ce49d
#define T0_KAOS_RANVAL_4e     0xcfaf4206
#define T0_KAOS_RANVAL_4f     0xe4fd3e32
#define T0_KAOS_RANVAL_50     0x30edfb34
#define T0_KAOS_RANVAL_51     0x4416b046
#define T0_KAOS_RANVAL_52     0xa4b40dd6
#define T0_KAOS_RANVAL_53     0xe9070498
#define T0_KAOS_RANVAL_54     0x43597da7
#define T0_KAOS_RANVAL_55     0x820a4bc5
#define T0_KAOS_RANVAL_56     0x8e1d3c32
#define T0_KAOS_RANVAL_57     0x3a9dfd4a
#define T0_KAOS_RANVAL_58     0x9c338be0
#define T0_KAOS_RANVAL_59     0xadc4d51e
#define T0_KAOS_RANVAL_5a     0xb376f9f8
#define T0_KAOS_RANVAL_5b     0x600115ac
#define T0_KAOS_RANVAL_5c     0x408ed513
#define T0_KAOS_RANVAL_5d     0x956918fe
#define T0_KAOS_RANVAL_5e     0x200294e1
#define T0_KAOS_RANVAL_5f     0xbefe9a49
#define T0_KAOS_RANVAL_60     0x57c8e938
#define T0_KAOS_RANVAL_61     0xe5f76946
#define T0_KAOS_RANVAL_62     0xa8f769b1
#define T0_KAOS_RANVAL_63     0xac8c5af7
#define T0_KAOS_RANVAL_64     0x08f9f46a
#define T0_KAOS_RANVAL_65     0x5f9dd7ca
#define T0_KAOS_RANVAL_66     0x6d2801aa
#define T0_KAOS_RANVAL_67     0xdd7b6d39
#define T0_KAOS_RANVAL_68     0xe4545b71
#define T0_KAOS_RANVAL_69     0x4a8ad955
#define T0_KAOS_RANVAL_6a     0x90d71341
#define T0_KAOS_RANVAL_6b     0x7cbb30e3
#define T0_KAOS_RANVAL_6c     0x13090d9d
#define T0_KAOS_RANVAL_6d     0x441894f0
#define T0_KAOS_RANVAL_6e     0x8d0f5a14
#define T0_KAOS_RANVAL_6f     0x8cb57b04
#define T0_KAOS_RANVAL_70     0xdc3e9fd5
#define T0_KAOS_RANVAL_71     0x2cc76363
#define T0_KAOS_RANVAL_72     0x978c7a1a
#define T0_KAOS_RANVAL_73     0xed880aff
#define T0_KAOS_RANVAL_74     0x1ff684ef
#define T0_KAOS_RANVAL_75     0x31e242fc
#define T0_KAOS_RANVAL_76     0x2e72621b
#define T0_KAOS_RANVAL_77     0xf77dadfb
#define T0_KAOS_RANVAL_78     0x4a9cf741
#define T0_KAOS_RANVAL_79     0x7a10438e
#define T0_KAOS_RANVAL_7a     0x44f3e163
#define T0_KAOS_RANVAL_7b     0x426bb47d
#define T0_KAOS_RANVAL_7c     0xdab56777
#define T0_KAOS_RANVAL_7d     0xfec22ebc
#define T0_KAOS_RANVAL_7e     0x72e064b2
#define T0_KAOS_RANVAL_7f     0x05be9e52
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
!    areaoffset     6272
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           159e0000
!    entry          159e0000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d3a9792b1c64
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/ifu.w
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

KTEXT_MODULE(t0_module_ktbl, 0x159e0000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x81aeca3b	! t0_kref+0x0:   	fcmps	%fcc0, %f27, %f27
	.word	0xf51e401d	! t0_kref+0x4:   	ldd	[%i1 + %i5], %f26
	.word	0xc3e8a087	! t0_kref+0x8:   	prefetcha	%g2 + 0x87, 1
	.word	0xb9b70c5a	! t0_kref+0xc:   	fnor	%f28, %f26, %f28
	.word	0xa9b3416d	! t0_kref+0x10:   	edge32ln	%o5, %o5, %l4
	.word	0xd0067ffc	! t0_kref+0x14:   	ld	[%i1 - 4], %o0
	.word	0xa6c3400d	! t0_kref+0x18:   	addccc	%o5, %o5, %l3
	.word	0xec567ff0	! t0_kref+0x1c:   	ldsh	[%i1 - 0x10], %l6
	.word	0xe8070019	! t0_kref+0x20:   	ld	[%i4 + %i1], %l4
	.word	0x93b3430d	! t0_kref+0x24:   	alignaddr	%o5, %o5, %o1
	.word	0xdaf63ff0	! t0_kref+0x28:   	stxa	%o5, [%i0 - 0x10]%asi
	.word	0x960b400d	! t0_kref+0x2c:   	and	%o5, %o5, %o3
	.word	0x91b34240	! t0_kref+0x30:   	array16	%o5, %g0, %o0
	.word	0xd0567ffa	! t0_kref+0x34:   	ldsh	[%i1 - 6], %o0
	.word	0x9283400d	! t0_kref+0x38:   	addcc	%o5, %o5, %o1
	.word	0xea08a038	! t0_kref+0x3c:   	ldub	[%g2 + 0x38], %l5
	.word	0x9de3bfa0	! t0_kref+0x40:   	save	%sp, -0x60, %sp
	.word	0xba2e7e77	! t0_kref+0x44:   	andn	%i1, -0x189, %i5
	.word	0xafeea98d	! t0_kref+0x48:   	restore	%i2, 0x98d, %l7
	.word	0xb3a6c9b8	! t0_kref+0x4c:   	fdivs	%f27, %f24, %f25
	.word	0xaed3400d	! t0_kref+0x50:   	umulcc	%o5, %o5, %l7
	.word	0xb1b70f5c	! t0_kref+0x54:   	fornot1	%f28, %f28, %f24
	.word	0xadb34240	! t0_kref+0x58:   	array16	%o5, %g0, %l6
	.word	0xa8d37345	! t0_kref+0x5c:   	umulcc	%o5, -0xcbb, %l4
	.word	0xb9b78eda	! t0_kref+0x60:   	fornot2	%f30, %f26, %f28
	.word	0x81da7f5c	! t0_kref+0x64:   	flush	%o1 - 0xa4
	.word	0x95408000	! t0_kref+0x68:   	mov	%ccr, %o2
	.word	0x93037685	! t0_kref+0x6c:   	taddcc	%o5, -0x97b, %o1
	.word	0xda360000	! t0_kref+0x70:   	sth	%o5, [%i0]
	.word	0xa613400d	! t0_kref+0x74:   	or	%o5, %o5, %l3
	.word	0xb9b78d9a	! t0_kref+0x78:   	fxor	%f30, %f26, %f28
	.word	0xdaa6601c	! t0_kref+0x7c:   	sta	%o5, [%i1 + 0x1c]%asi
	.word	0xd608a034	! t0_kref+0x80:   	ldub	[%g2 + 0x34], %o3
	.word	0xee064000	! t0_kref+0x84:   	ld	[%i1], %l7
	.word	0xaf1b6a05	! t0_kref+0x88:   	tsubcctv	%o5, 0xa05, %l7
	.word	0x2c800002	! t0_kref+0x8c:   	bneg,a	_kref+0x94
	.word	0xbfa7c9bb	! t0_kref+0x90:   	fdivs	%f31, %f27, %f31
	.word	0xd2062018	! t0_kref+0x94:   	ld	[%i0 + 0x18], %o1
          nop   !	call	0xfffff3fc
	.word	0xda30a03a	! t0_kref+0x9c:   	sth	%o5, [%g2 + 0x3a]
	.word	0xea56401b	! t0_kref+0xa0:   	ldsh	[%i1 + %i3], %l5
	.word	0xabb3404d	! t0_kref+0xa4:   	edge8l	%o5, %o5, %l5
	.word	0xbda0055e	! t0_kref+0xa8:   	fsqrtd	%f30, %f30
	.word	0xd288a030	! t0_kref+0xac:   	lduba	[%g2 + 0x30]%asi, %o1
	.word	0xb1b009bf	! t0_kref+0xb0:   	fexpand	%f31, %f24
	.word	0x8143c000	! t0_kref+0xb4:   	stbar
	.word	0xae9362f8	! t0_kref+0xb8:   	orcc	%o5, 0x2f8, %l7
	.word	0xf780a008	! t0_kref+0xbc:   	lda	[%g2 + 8]%asi, %f27
	.word	0xb1b68f9c	! t0_kref+0xc0:   	for	%f26, %f28, %f24
	.word	0xf9a0a018	! t0_kref+0xc4:   	sta	%f28, [%g2 + 0x18]%asi
	.word	0xdab0a002	! t0_kref+0xc8:   	stha	%o5, [%g2 + 2]%asi
	.word	0xb3b00fe0	! t0_kref+0xcc:   	fones	%f25
	.word	0xee50a022	! t0_kref+0xd0:   	ldsh	[%g2 + 0x22], %l7
	.word	0xbba0053f	! t0_kref+0xd4:   	fsqrts	%f31, %f29
	.word	0xaf0b400d	! t0_kref+0xd8:   	tsubcc	%o5, %o5, %l7
	.word	0x81ae8a5a	! t0_kref+0xdc:   	fcmpd	%fcc0, %f26, %f26
	.word	0xb9b6097a	! t0_kref+0xe0:   	fpmerge	%f24, %f26, %f28
	.word	0x3a800006	! t0_kref+0xe4:   	bcc,a	_kref+0xfc
	.word	0xb9b64719	! t0_kref+0xe8:   	fmuld8sux16	%f25, %f25, %f28
	.word	0xbda0191d	! t0_kref+0xec:   	fitod	%f29, %f30
	.word	0xb5b0077a	! t0_kref+0xf0:   	fpack16	%f26, %f26
	.word	0xd20e001a	! t0_kref+0xf4:   	ldub	[%i0 + %i2], %o1
	.word	0x8d83400d	! t0_kref+0xf8:   	wr	%o5, %o5, %fprs
	.word	0xe86e4000	! t0_kref+0xfc:   	ldstub	[%i1], %l4
	.word	0xe81e0000	! t0_kref+0x100:   	ldd	[%i0], %l4
	.word	0xb9a000bf	! t0_kref+0x104:   	fnegs	%f31, %f28
	.word	0xe80e3ffc	! t0_kref+0x108:   	ldub	[%i0 - 4], %l4
	.word	0xd6c8a03a	! t0_kref+0x10c:   	ldsba	[%g2 + 0x3a]%asi, %o3
	.word	0xea063fe8	! t0_kref+0x110:   	ld	[%i0 - 0x18], %l5
	.word	0xf300a014	! t0_kref+0x114:   	ld	[%g2 + 0x14], %f25
	.word	0xf99e5a1d	! t0_kref+0x118:   	ldda	[%i1 + %i5]0xd0, %f28
	.word	0xee064000	! t0_kref+0x11c:   	ld	[%i1], %l7
	.word	0xda2e3fef	! t0_kref+0x120:   	stb	%o5, [%i0 - 0x11]
	.word	0x95b34240	! t0_kref+0x124:   	array16	%o5, %g0, %o2
	.word	0xf3a0a010	! t0_kref+0x128:   	sta	%f25, [%g2 + 0x10]%asi
	.word	0x9723400d	! t0_kref+0x12c:   	mulscc	%o5, %o5, %o3
	.word	0xf7000019	! t0_kref+0x130:   	ld	[%g0 + %i1], %f27
	.word	0xafb3408d	! t0_kref+0x134:   	edge16	%o5, %o5, %l7
	.word	0xa7b7051c	! t0_kref+0x138:   	fcmpgt16	%f28, %f28, %l3
	.word	0xd87e4000	! t0_kref+0x13c:   	swap	[%i1], %o4
	.word	0xb1a00558	! t0_kref+0x140:   	fsqrtd	%f24, %f24
	.word	0xb9a70858	! t0_kref+0x144:   	faddd	%f28, %f24, %f28
	.word	0xbdb6099e	! t0_kref+0x148:   	bshuffle	%f24, %f30, %f30
	.word	0xaa1376c9	! t0_kref+0x14c:   	or	%o5, -0x937, %l5
	.word	0x932b400d	! t0_kref+0x150:   	sll	%o5, %o5, %o1
	.word	0x932372b2	! t0_kref+0x154:   	mulscc	%o5, -0xd4e, %o1
	.word	0xb5a018de	! t0_kref+0x158:   	fdtos	%f30, %f26
	.word	0xf300a028	! t0_kref+0x15c:   	ld	[%g2 + 0x28], %f25
	.word	0xf99e5a5c	! t0_kref+0x160:   	ldda	[%i1 + %i4]0xd2, %f28
	.word	0x94bb74eb	! t0_kref+0x164:   	xnorcc	%o5, -0xb15, %o2
	.word	0xff064000	! t0_kref+0x168:   	ld	[%i1], %f31
	.word	0xf99eda19	! t0_kref+0x16c:   	ldda	[%i3 + %i1]0xd0, %f28
	.word	0xf9bf5a18	! t0_kref+0x170:   	stda	%f28, [%i5 + %i0]0xd0
	.word	0xd6080019	! t0_kref+0x174:   	ldub	[%g0 + %i1], %o3
	.word	0xa80b700b	! t0_kref+0x178:   	and	%o5, -0xff5, %l4
	.word	0x81b01020	! t0_kref+0x17c:   	siam	0x0
	.word	0xa744c000	! t0_kref+0x180:   	mov	%gsr, %l3
	.word	0x95408000	! t0_kref+0x184:   	mov	%ccr, %o2
	.word	0x97b685dc	! t0_kref+0x188:   	fcmpeq32	%f26, %f28, %o3
	.word	0xaf703d26	! t0_kref+0x18c:   	popc	-0x2da, %l7
	.word	0x2d27b679	! t0_kref+0x190:   	sethi	%hi(0x9ed9e400), %l6
	.word	0xecd0a006	! t0_kref+0x194:   	ldsha	[%g2 + 6]%asi, %l6
	.word	0xd0070018	! t0_kref+0x198:   	ld	[%i4 + %i0], %o0
	.word	0xac33400d	! t0_kref+0x19c:   	orn	%o5, %o5, %l6
	.word	0xbdb687de	! t0_kref+0x1a0:   	pdist	%f26, %f30, %f30
	.word	0xb3a609bb	! t0_kref+0x1a4:   	fdivs	%f24, %f27, %f25
	.word	0xa60b400d	! t0_kref+0x1a8:   	and	%o5, %o5, %l3
	.word	0xd6062004	! t0_kref+0x1ac:   	ld	[%i0 + 4], %o3
	.word	0xd4063fe8	! t0_kref+0x1b0:   	ld	[%i0 - 0x18], %o2
	.word	0xd4c6101c	! t0_kref+0x1b4:   	ldswa	[%i0 + %i4]0x80, %o2
	.word	0xf11e7fe8	! t0_kref+0x1b8:   	ldd	[%i1 - 0x18], %f24
	.word	0x95b3402d	! t0_kref+0x1bc:   	edge8n	%o5, %o5, %o2
	.word	0xbdb68f9c	! t0_kref+0x1c0:   	for	%f26, %f28, %f30
	.word	0xf5ee501d	! t0_kref+0x1c4:   	prefetcha	%i1 + %i5, 26
	.word	0xacf3400d	! t0_kref+0x1c8:   	udivcc	%o5, %o5, %l6
	.word	0xd20e8018	! t0_kref+0x1cc:   	ldub	[%i2 + %i0], %o1
	.word	0xd6062000	! t0_kref+0x1d0:   	ld	[%i0], %o3
	.word	0xd6064000	! t0_kref+0x1d4:   	ld	[%i1], %o3
	.word	0xf5180018	! t0_kref+0x1d8:   	ldd	[%g0 + %i0], %f26
	.word	0xdaa0a00c	! t0_kref+0x1dc:   	sta	%o5, [%g2 + 0xc]%asi
	.word	0xa9b3432d	! t0_kref+0x1e0:   	bmask	%o5, %o5, %l4
	.word	0xd2063ffc	! t0_kref+0x1e4:   	ld	[%i0 - 4], %o1
	.word	0xb9a00558	! t0_kref+0x1e8:   	fsqrtd	%f24, %f28
	.word	0xa783400d	! t0_kref+0x1ec:   	wr	%o5, %o5, %gsr
	.word	0x39800007	! t0_kref+0x1f0:   	fbuge,a	_kref+0x20c
	.word	0xafb3430d	! t0_kref+0x1f4:   	alignaddr	%o5, %o5, %l7
	.word	0x973b400d	! t0_kref+0x1f8:   	sra	%o5, %o5, %o3
	.word	0xbda6885e	! t0_kref+0x1fc:   	faddd	%f26, %f30, %f30
	.word	0xec871018	! t0_kref+0x200:   	lda	[%i4 + %i0]0x80, %l6
	.word	0xea0e7fec	! t0_kref+0x204:   	ldub	[%i1 - 0x14], %l5
	.word	0x81ae8ada	! t0_kref+0x208:   	fcmped	%fcc0, %f26, %f26
	.word	0xd408a03e	! t0_kref+0x20c:   	ldub	[%g2 + 0x3e], %o2
	.word	0xae23400d	! t0_kref+0x210:   	sub	%o5, %o5, %l7
	.word	0xfb20a008	! t0_kref+0x214:   	st	%f29, [%g2 + 8]
	.word	0xadb3408d	! t0_kref+0x218:   	edge16	%o5, %o5, %l6
	.word	0xb9b6cfbd	! t0_kref+0x21c:   	fors	%f27, %f29, %f28
	.word	0xebee101d	! t0_kref+0x220:   	prefetcha	%i0 + %i5, 21
	.word	0xb5b6cdbb	! t0_kref+0x224:   	fxors	%f27, %f27, %f26
	.word	0xa9b3408d	! t0_kref+0x228:   	edge16	%o5, %o5, %l4
	.word	0xfd1fbeb8	! t0_kref+0x22c:   	ldd	[%fp - 0x148], %f30
	.word	0xf99e5a1a	! t0_kref+0x230:   	ldda	[%i1 + %i2]0xd0, %f28
	.word	0xeec8a011	! t0_kref+0x234:   	ldsba	[%g2 + 0x11]%asi, %l7
	.word	0xa6937aec	! t0_kref+0x238:   	orcc	%o5, -0x514, %l3
	.word	0xd4060000	! t0_kref+0x23c:   	ld	[%i0], %o2
	.word	0xac937df8	! t0_kref+0x240:   	orcc	%o5, -0x208, %l6
	.word	0xb5a649bb	! t0_kref+0x244:   	fdivs	%f25, %f27, %f26
	.word	0xec4e8019	! t0_kref+0x248:   	ldsb	[%i2 + %i1], %l6
	.word	0xb7a0189a	! t0_kref+0x24c:   	fitos	%f26, %f27
	.word	0xf1be1a1b	! t0_kref+0x250:   	stda	%f24, [%i0 + %i3]0xd0
	.word	0xe80e4000	! t0_kref+0x254:   	ldub	[%i1], %l4
	.word	0xe8163fe2	! t0_kref+0x258:   	lduh	[%i0 - 0x1e], %l4
	.word	0xc7e8a082	! t0_kref+0x25c:   	prefetcha	%g2 + 0x82, 3
	.word	0xee0e3ff2	! t0_kref+0x260:   	ldub	[%i0 - 0xe], %l7
	.word	0xb9a609b8	! t0_kref+0x264:   	fdivs	%f24, %f24, %f28
	.word	0xb9a749bb	! t0_kref+0x268:   	fdivs	%f29, %f27, %f28
	.word	0xadb3434d	! t0_kref+0x26c:   	alignaddrl	%o5, %o5, %l6
	.word	0xb1b706ba	! t0_kref+0x270:   	fmul8x16al	%f28, %f26, %f24
	.word	0xeed6105b	! t0_kref+0x274:   	ldsha	[%i0 + %i3]0x82, %l7
	.word	0xb1b6091c	! t0_kref+0x278:   	faligndata	%f24, %f28, %f24
	.word	0x96a3674b	! t0_kref+0x27c:   	subcc	%o5, 0x74b, %o3
	.word	0xbda0003a	! t0_kref+0x280:   	fmovs	%f26, %f30
	.word	0xb9a0003d	! t0_kref+0x284:   	fmovs	%f29, %f28
	.word	0xbdb009be	! t0_kref+0x288:   	fexpand	%f30, %f30
	.word	0xef68a045	! t0_kref+0x28c:   	prefetch	%g2 + 0x45, 23
	.word	0xb3a0053c	! t0_kref+0x290:   	fsqrts	%f28, %f25
	.word	0x91b3404d	! t0_kref+0x294:   	edge8l	%o5, %o5, %o0
	.word	0xd60e7fe3	! t0_kref+0x298:   	ldub	[%i1 - 0x1d], %o3
	.word	0x92db6deb	! t0_kref+0x29c:   	smulcc	%o5, 0xdeb, %o1
	.word	0xd640a020	! t0_kref+0x2a0:   	ldsw	[%g2 + 0x20], %o3
	.word	0xecee3ff5	! t0_kref+0x2a4:   	ldstuba	[%i0 - 0xb]%asi, %l6
	.word	0xc3e8a080	! t0_kref+0x2a8:   	prefetcha	%g2 + 0x80, 1
	.word	0xa7b3410d	! t0_kref+0x2ac:   	edge32	%o5, %o5, %l3
	.word	0x3f800005	! t0_kref+0x2b0:   	fbo,a	_kref+0x2c4
	.word	0xb7b7cf79	! t0_kref+0x2b4:   	fornot1s	%f31, %f25, %f27
	.word	0xb1b6cea0	! t0_kref+0x2b8:   	fsrc1s	%f27, %f24
	.word	0xb3a649be	! t0_kref+0x2bc:   	fdivs	%f25, %f30, %f25
	.word	0xd200a004	! t0_kref+0x2c0:   	ld	[%g2 + 4], %o1
	.word	0xea0e201d	! t0_kref+0x2c4:   	ldub	[%i0 + 0x1d], %l5
	.word	0xec0e2019	! t0_kref+0x2c8:   	ldub	[%i0 + 0x19], %l6
	.word	0x91400000	! t0_kref+0x2cc:   	mov	%y, %o0
	.word	0xea4e6011	! t0_kref+0x2d0:   	ldsb	[%i1 + 0x11], %l5
	.word	0xb1a0055e	! t0_kref+0x2d4:   	fsqrtd	%f30, %f24
	.word	0xd40e001a	! t0_kref+0x2d8:   	ldub	[%i0 + %i2], %o2
	.word	0xb5b786dc	! t0_kref+0x2dc:   	fmul8sux16	%f30, %f28, %f26
	.word	0xd6000019	! t0_kref+0x2e0:   	ld	[%g0 + %i1], %o3
	.word	0xd6162006	! t0_kref+0x2e4:   	lduh	[%i0 + 6], %o3
	.word	0x85837d86	! t0_kref+0x2e8:   	wr	%o5, 0xfffffd86, %ccr
	.word	0x81834000	! t0_kref+0x2ec:   	wr	%o5, %g0, %y
	.word	0xf380a010	! t0_kref+0x2f0:   	lda	[%g2 + 0x10]%asi, %f25
	.word	0xf99e1a1d	! t0_kref+0x2f4:   	ldda	[%i0 + %i5]0xd0, %f28
	.word	0xb5b78918	! t0_kref+0x2f8:   	faligndata	%f30, %f24, %f26
	.word	0xbdb70fbc	! t0_kref+0x2fc:   	fors	%f28, %f28, %f30
	.word	0xd0070019	! t0_kref+0x300:   	ld	[%i4 + %i1], %o0
	.word	0xe690a01e	! t0_kref+0x304:   	lduha	[%g2 + 0x1e]%asi, %l3
	.word	0xbdb00cda	! t0_kref+0x308:   	fnot2	%f26, %f30
	.word	0xbda01919	! t0_kref+0x30c:   	fitod	%f25, %f30
	.word	0xbda709b9	! t0_kref+0x310:   	fdivs	%f28, %f25, %f30
	.word	0x86102009	! t0_kref+0x314:   	mov	0x9, %g3
	.word	0x86a0e001	! t0_kref+0x318:   	subcc	%g3, 1, %g3
	.word	0x22800014	! t0_kref+0x31c:   	be,a	_kref+0x36c
	.word	0x81de0004	! t0_kref+0x320:   	flush	%i0 + %g4
	.word	0xbfa7c9bc	! t0_kref+0x324:   	fdivs	%f31, %f28, %f31
	call	SYM(t0_subr0)
	.word	0xdaa8a00d	! t0_kref+0x32c:   	stba	%o5, [%g2 + 0xd]%asi
	.word	0xfb80a038	! t0_kref+0x330:   	lda	[%g2 + 0x38]%asi, %f29
	.word	0xb1b00fc0	! t0_kref+0x334:   	fone	%f24
	.word	0xf1266018	! t0_kref+0x338:   	st	%f24, [%i1 + 0x18]
	.word	0xbda7c9bd	! t0_kref+0x33c:   	fdivs	%f31, %f29, %f30
	.word	0xb5a00558	! t0_kref+0x340:   	fsqrtd	%f24, %f26
	.word	0xbbb00f3a	! t0_kref+0x344:   	fsrc2s	%f26, %f29
	.word	0x85836e11	! t0_kref+0x348:   	wr	%o5, 0xe11, %ccr
	.word	0xd4c8a00e	! t0_kref+0x34c:   	ldsba	[%g2 + 0xe]%asi, %o2
	.word	0xabb3404d	! t0_kref+0x350:   	edge8l	%o5, %o5, %l5
	.word	0xae83400d	! t0_kref+0x354:   	addcc	%o5, %o5, %l7
	.word	0xd0c0a008	! t0_kref+0x358:   	ldswa	[%g2 + 8]%asi, %o0
	.word	0xbfb68d39	! t0_kref+0x35c:   	fandnot1s	%f26, %f25, %f31
	.word	0xd40e200b	! t0_kref+0x360:   	ldub	[%i0 + 0xb], %o2
	.word	0xea16401b	! t0_kref+0x364:   	lduh	[%i1 + %i3], %l5
	.word	0xb5b7899a	! t0_kref+0x368:   	bshuffle	%f30, %f26, %f26
	.word	0xd080a01c	! t0_kref+0x36c:   	lda	[%g2 + 0x1c]%asi, %o0
	.word	0xb9b606fe	! t0_kref+0x370:   	fmul8ulx16	%f24, %f30, %f28
	.word	0xbfb74db9	! t0_kref+0x374:   	fxors	%f29, %f25, %f31
	.word	0xd40e0000	! t0_kref+0x378:   	ldub	[%i0], %o2
	.word	0xd6167fe2	! t0_kref+0x37c:   	lduh	[%i1 - 0x1e], %o3
	.word	0xec070019	! t0_kref+0x380:   	ld	[%i4 + %i1], %l6
	.word	0xcc39401d	! t0_kref+0x384:   	std	%g6, [%g5 + %i5]
	.word	0xaab36342	! t0_kref+0x388:   	orncc	%o5, 0x342, %l5
	.word	0xbba689bb	! t0_kref+0x38c:   	fdivs	%f26, %f27, %f29
	.word	0xd44e8019	! t0_kref+0x390:   	ldsb	[%i2 + %i1], %o2
	.word	0x2c800003	! t0_kref+0x394:   	bneg,a	_kref+0x3a0
	.word	0xe80e8018	! t0_kref+0x398:   	ldub	[%i2 + %i0], %l4
	.word	0xdaf6501d	! t0_kref+0x39c:   	stxa	%o5, [%i1 + %i5]0x80
	.word	0xbda0193a	! t0_kref+0x3a0:   	fstod	%f26, %f30
	.word	0xfda0a02c	! t0_kref+0x3a4:   	sta	%f30, [%g2 + 0x2c]%asi
	.word	0xbdb60998	! t0_kref+0x3a8:   	bshuffle	%f24, %f24, %f30
	.word	0xee0e8019	! t0_kref+0x3ac:   	ldub	[%i2 + %i1], %l7
	.word	0xd406401c	! t0_kref+0x3b0:   	ld	[%i1 + %i4], %o2
	.word	0xf320a01c	! t0_kref+0x3b4:   	st	%f25, [%g2 + 0x1c]
	.word	0xd2500018	! t0_kref+0x3b8:   	ldsh	[%g0 + %i0], %o1
	.word	0xb7a0189f	! t0_kref+0x3bc:   	fitos	%f31, %f27
	.word	0xd690a006	! t0_kref+0x3c0:   	lduha	[%g2 + 6]%asi, %o3
	.word	0xd616200a	! t0_kref+0x3c4:   	lduh	[%i0 + 0xa], %o3
	.word	0xe84e4000	! t0_kref+0x3c8:   	ldsb	[%i1], %l4
	.word	0xf91e6008	! t0_kref+0x3cc:   	ldd	[%i1 + 8], %f28
	call	SYM(t0_subr2)
	.word	0xf11e7ff0	! t0_kref+0x3d4:   	ldd	[%i1 - 0x10], %f24
	.word	0x85836bd3	! t0_kref+0x3d8:   	wr	%o5, 0xbd3, %ccr
	.word	0xbda0003f	! t0_kref+0x3dc:   	fmovs	%f31, %f30
	.word	0xdaa8a02e	! t0_kref+0x3e0:   	stba	%o5, [%g2 + 0x2e]%asi
	.word	0x93b3416d	! t0_kref+0x3e4:   	edge32ln	%o5, %o5, %o1
	.word	0xbda649bd	! t0_kref+0x3e8:   	fdivs	%f25, %f29, %f30
	.word	0xbdb68e80	! t0_kref+0x3ec:   	fsrc1	%f26, %f30
	.word	0xea4e8019	! t0_kref+0x3f0:   	ldsb	[%i2 + %i1], %l5
	.word	0xd416c019	! t0_kref+0x3f4:   	lduh	[%i3 + %i1], %o2
	.word	0xe856201c	! t0_kref+0x3f8:   	ldsh	[%i0 + 0x1c], %l4
	.word	0xd2c0a03c	! t0_kref+0x3fc:   	ldswa	[%g2 + 0x3c]%asi, %o1
	.word	0xaf70000d	! t0_kref+0x400:   	popc	%o5, %l7
	.word	0xee563ffc	! t0_kref+0x404:   	ldsh	[%i0 - 4], %l7
	.word	0xa6fb400d	! t0_kref+0x408:   	sdivcc	%o5, %o5, %l3
	.word	0xda28a028	! t0_kref+0x40c:   	stb	%o5, [%g2 + 0x28]
	.word	0x9fc10000	! t0_kref+0x410:   	call	%g4
	.word	0xdab0a006	! t0_kref+0x414:   	stha	%o5, [%g2 + 6]%asi
	.word	0xbda789b8	! t0_kref+0x418:   	fdivs	%f30, %f24, %f30
	.word	0xffa0a00c	! t0_kref+0x41c:   	sta	%f31, [%g2 + 0xc]%asi
	.word	0xea00a018	! t0_kref+0x420:   	ld	[%g2 + 0x18], %l5
	.word	0x86102020	! t0_kref+0x424:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0x428:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x42c:   	be,a	_kref+0x458
	.word	0x905b7903	! t0_kref+0x430:   	smul	%o5, -0x6fd, %o0
	.word	0xaabb6dbd	! t0_kref+0x434:   	xnorcc	%o5, 0xdbd, %l5
	.word	0x3ebffffc	! t0_kref+0x438:   	bvc,a	_kref+0x428
	.word	0xb9a7c9ba	! t0_kref+0x43c:   	fdivs	%f31, %f26, %f28
	.word	0xd24e401a	! t0_kref+0x440:   	ldsb	[%i1 + %i2], %o1
	.word	0xad418000	! t0_kref+0x444:   	mov	%fprs, %l6
	.word	0xe8062014	! t0_kref+0x448:   	ld	[%i0 + 0x14], %l4
	.word	0xb9b60ddc	! t0_kref+0x44c:   	fnand	%f24, %f28, %f28
	.word	0xf920a02c	! t0_kref+0x450:   	st	%f28, [%g2 + 0x2c]
	.word	0xf1be584d	! t0_kref+0x454:   	stda	%f24, [%i1 + %o5]0xc2
	.word	0xea0e4000	! t0_kref+0x458:   	ldub	[%i1], %l5
	.word	0xb810200c	! t0_kref+0x45c:   	mov	0xc, %i4
	.word	0xda20a010	! t0_kref+0x460:   	st	%o5, [%g2 + 0x10]
	.word	0xb7a00138	! t0_kref+0x464:   	fabss	%f24, %f27
	.word	0xfd1fbd30	! t0_kref+0x468:   	ldd	[%fp - 0x2d0], %f30
	.word	0xfd062008	! t0_kref+0x46c:   	ld	[%i0 + 8], %f30
	.word	0x85836791	! t0_kref+0x470:   	wr	%o5, 0x791, %ccr
	.word	0xe648a021	! t0_kref+0x474:   	ldsb	[%g2 + 0x21], %l3
	.word	0xbdb706fa	! t0_kref+0x478:   	fmul8ulx16	%f28, %f26, %f30
	.word	0xdaa0a038	! t0_kref+0x47c:   	sta	%o5, [%g2 + 0x38]%asi
	.word	0xe6000019	! t0_kref+0x480:   	ld	[%g0 + %i1], %l3
	.word	0xec4e6009	! t0_kref+0x484:   	ldsb	[%i1 + 9], %l6
	.word	0xb1b7899c	! t0_kref+0x488:   	bshuffle	%f30, %f28, %f24
	.word	0xd2963fea	! t0_kref+0x48c:   	lduha	[%i0 - 0x16]%asi, %o1
	.word	0xd40e2000	! t0_kref+0x490:   	ldub	[%i0], %o2
	.word	0xd20e8018	! t0_kref+0x494:   	ldub	[%i2 + %i0], %o1
	.word	0xdaa0a01c	! t0_kref+0x498:   	sta	%o5, [%g2 + 0x1c]%asi
	.word	0xda30a022	! t0_kref+0x49c:   	sth	%o5, [%g2 + 0x22]
	.word	0xb9a649bf	! t0_kref+0x4a0:   	fdivs	%f25, %f31, %f28
	.word	0x977031ab	! t0_kref+0x4a4:   	popc	-0xe55, %o3
	.word	0xb1a0191b	! t0_kref+0x4a8:   	fitod	%f27, %f24
	.word	0xadb3410d	! t0_kref+0x4ac:   	edge32	%o5, %o5, %l6
	.word	0xbbb60a7d	! t0_kref+0x4b0:   	fpadd32s	%f24, %f29, %f29
	.word	0xd00e3fe3	! t0_kref+0x4b4:   	ldub	[%i0 - 0x1d], %o0
	.word	0xd4070018	! t0_kref+0x4b8:   	ld	[%i4 + %i0], %o2
	.word	0xac0b400d	! t0_kref+0x4bc:   	and	%o5, %o5, %l6
	.word	0xe80e8019	! t0_kref+0x4c0:   	ldub	[%i2 + %i1], %l4
	.word	0xf1bf1a18	! t0_kref+0x4c4:   	stda	%f24, [%i4 + %i0]0xd0
	.word	0x81afca3b	! t0_kref+0x4c8:   	fcmps	%fcc0, %f31, %f27
	.word	0xf9000019	! t0_kref+0x4cc:   	ld	[%g0 + %i1], %f28
	.word	0xa6f36461	! t0_kref+0x4d0:   	udivcc	%o5, 0x461, %l3
	.word	0xf91e4000	! t0_kref+0x4d4:   	ldd	[%i1], %f28
	.word	0xdaa8a023	! t0_kref+0x4d8:   	stba	%o5, [%g2 + 0x23]%asi
	.word	0xf9be588d	! t0_kref+0x4dc:   	stda	%f28, [%i1 + %o5]0xc4
	.word	0xe688a01a	! t0_kref+0x4e0:   	lduba	[%g2 + 0x1a]%asi, %l3
	.word	0x913b400d	! t0_kref+0x4e4:   	sra	%o5, %o5, %o0
	.word	0x927b6b5b	! t0_kref+0x4e8:   	sdiv	%o5, 0xb5b, %o1
	.word	0xd2d0a008	! t0_kref+0x4ec:   	ldsha	[%g2 + 8]%asi, %o1
	.word	0xdaf62000	! t0_kref+0x4f0:   	stxa	%o5, [%i0]%asi
	.word	0xb1a0053f	! t0_kref+0x4f4:   	fsqrts	%f31, %f24
	.word	0xb5b68e80	! t0_kref+0x4f8:   	fsrc1	%f26, %f26
	.word	0xdaa8a003	! t0_kref+0x4fc:   	stba	%o5, [%g2 + 3]%asi
	.word	0xb9a0055e	! t0_kref+0x500:   	fsqrtd	%f30, %f28
	.word	0xbdb70e5c	! t0_kref+0x504:   	fxnor	%f28, %f28, %f30
	.word	0xec4e2005	! t0_kref+0x508:   	ldsb	[%i0 + 5], %l6
	.word	0xb1a708dc	! t0_kref+0x50c:   	fsubd	%f28, %f28, %f24
	.word	0xea4e4000	! t0_kref+0x510:   	ldsb	[%i1], %l5
	.word	0xbdb00fc0	! t0_kref+0x514:   	fone	%f30
	.word	0xe616401b	! t0_kref+0x518:   	lduh	[%i1 + %i3], %l3
	.word	0xe6c0a004	! t0_kref+0x51c:   	ldswa	[%g2 + 4]%asi, %l3
	.word	0xb1a018de	! t0_kref+0x520:   	fdtos	%f30, %f24
	.word	0xb5b60d9a	! t0_kref+0x524:   	fxor	%f24, %f26, %f26
	.word	0xb5a789b9	! t0_kref+0x528:   	fdivs	%f30, %f25, %f26
	.word	0xee0e001a	! t0_kref+0x52c:   	ldub	[%i0 + %i2], %l7
	.word	0xb9b6875a	! t0_kref+0x530:   	fpack32	%f26, %f26, %f28
	.word	0xb5b00cdc	! t0_kref+0x534:   	fnot2	%f28, %f26
	.word	0xbdb60d60	! t0_kref+0x538:   	fnot1s	%f24, %f30
	.word	0x93408000	! t0_kref+0x53c:   	mov	%ccr, %o1
	.word	0xbbb74a7f	! t0_kref+0x540:   	fpadd32s	%f29, %f31, %f29
	.word	0xda264000	! t0_kref+0x544:   	st	%o5, [%i1]
	.word	0xb1a608d8	! t0_kref+0x548:   	fsubd	%f24, %f24, %f24
	.word	0xfb80a028	! t0_kref+0x54c:   	lda	[%g2 + 0x28]%asi, %f29
	.word	0xf51e6018	! t0_kref+0x550:   	ldd	[%i1 + 0x18], %f26
	.word	0xda263ff4	! t0_kref+0x554:   	st	%o5, [%i0 - 0xc]
	.word	0xd6166014	! t0_kref+0x558:   	lduh	[%i1 + 0x14], %o3
	.word	0xf11e6000	! t0_kref+0x55c:   	ldd	[%i1], %f24
	.word	0xf1180018	! t0_kref+0x560:   	ldd	[%g0 + %i0], %f24
	.word	0xdaf01018	! t0_kref+0x564:   	stxa	%o5, [%g0 + %i0]0x80
	.word	0xb1b68a1e	! t0_kref+0x568:   	fpadd16	%f26, %f30, %f24
	.word	0xbdb60eda	! t0_kref+0x56c:   	fornot2	%f24, %f26, %f30
	.word	0xb5a00558	! t0_kref+0x570:   	fsqrtd	%f24, %f26
	.word	0xb7b00cf9	! t0_kref+0x574:   	fnot2s	%f25, %f27
	.word	0xb3a749bc	! t0_kref+0x578:   	fdivs	%f29, %f28, %f25
	.word	0xda28a000	! t0_kref+0x57c:   	stb	%o5, [%g2]
	.word	0xd00e6001	! t0_kref+0x580:   	ldub	[%i1 + 1], %o0
	.word	0xd00e401a	! t0_kref+0x584:   	ldub	[%i1 + %i2], %o0
	.word	0xa7418000	! t0_kref+0x588:   	mov	%fprs, %l3
	.word	0xb1a6c9be	! t0_kref+0x58c:   	fdivs	%f27, %f30, %f24
	.word	0xbfa648b9	! t0_kref+0x590:   	fsubs	%f25, %f25, %f31
	.word	0x962b6dda	! t0_kref+0x594:   	andn	%o5, 0xdda, %o3
	.word	0x93b3432d	! t0_kref+0x598:   	bmask	%o5, %o5, %o1
	.word	0xb9b7c679	! t0_kref+0x59c:   	fmul8x16au	%f31, %f25, %f28
	.word	0xb9b6899e	! t0_kref+0x5a0:   	bshuffle	%f26, %f30, %f28
	.word	0x81db2e2c	! t0_kref+0x5a4:   	flush	%o4 + 0xe2c
	.word	0xea56200e	! t0_kref+0x5a8:   	ldsh	[%i0 + 0xe], %l5
	.word	0xfd80a03c	! t0_kref+0x5ac:   	lda	[%g2 + 0x3c]%asi, %f30
	.word	0xd04e7ff0	! t0_kref+0x5b0:   	ldsb	[%i1 - 0x10], %o0
	.word	0xd0162002	! t0_kref+0x5b4:   	lduh	[%i0 + 2], %o0
	.word	0xea16200a	! t0_kref+0x5b8:   	lduh	[%i0 + 0xa], %l5
	.word	0x29022dbd	! t0_kref+0x5bc:   	sethi	%hi(0x8b6f400), %l4
	.word	0xea50a03c	! t0_kref+0x5c0:   	ldsh	[%g2 + 0x3c], %l5
	.word	0xdaa0a000	! t0_kref+0x5c4:   	sta	%o5, [%g2]%asi
	.word	0xd080a008	! t0_kref+0x5c8:   	lda	[%g2 + 8]%asi, %o0
	.word	0xb1a0053a	! t0_kref+0x5cc:   	fsqrts	%f26, %f24
	.word	0xe856401b	! t0_kref+0x5d0:   	ldsh	[%i1 + %i3], %l4
	.word	0xb5a0055a	! t0_kref+0x5d4:   	fsqrtd	%f26, %f26
	.word	0xf99f5a59	! t0_kref+0x5d8:   	ldda	[%i5 + %i1]0xd2, %f28
	.word	0xb5b78dda	! t0_kref+0x5dc:   	fnand	%f30, %f26, %f26
	.word	0xad400000	! t0_kref+0x5e0:   	mov	%y, %l6
	.word	0xe64e4000	! t0_kref+0x5e4:   	ldsb	[%i1], %l3
	.word	0x90236240	! t0_kref+0x5e8:   	sub	%o5, 0x240, %o0
	.word	0xe6062000	! t0_kref+0x5ec:   	ld	[%i0], %l3
	.word	0xd488a036	! t0_kref+0x5f0:   	lduba	[%g2 + 0x36]%asi, %o2
	.word	0xdab6101b	! t0_kref+0x5f4:   	stha	%o5, [%i0 + %i3]0x80
	.word	0xaa837c8d	! t0_kref+0x5f8:   	addcc	%o5, -0x373, %l5
	.word	0xe856600a	! t0_kref+0x5fc:   	ldsh	[%i1 + 0xa], %l4
	.word	0xab400000	! t0_kref+0x600:   	mov	%y, %l5
	.word	0xbba649bb	! t0_kref+0x604:   	fdivs	%f25, %f27, %f29
	.word	0xb1b686fc	! t0_kref+0x608:   	fmul8ulx16	%f26, %f28, %f24
	.word	0xea7e2004	! t0_kref+0x60c:   	swap	[%i0 + 4], %l5
	.word	0x81834000	! t0_kref+0x610:   	wr	%o5, %g0, %y
	.word	0xdaa0a014	! t0_kref+0x614:   	sta	%o5, [%g2 + 0x14]%asi
	.word	0x8143c000	! t0_kref+0x618:   	stbar
	.word	0xd2067fec	! t0_kref+0x61c:   	ld	[%i1 - 0x14], %o1
	.word	0xf91e2018	! t0_kref+0x620:   	ldd	[%i0 + 0x18], %f28
	.word	0xb7a6c9b8	! t0_kref+0x624:   	fdivs	%f27, %f24, %f27
	.word	0xec06200c	! t0_kref+0x628:   	ld	[%i0 + 0xc], %l6
	.word	0xbbb78c7e	! t0_kref+0x62c:   	fnors	%f30, %f30, %f29
	.word	0xbdb6075e	! t0_kref+0x630:   	fpack32	%f24, %f30, %f30
	.word	0xd4080019	! t0_kref+0x634:   	ldub	[%g0 + %i1], %o2
	.word	0xa9b605de	! t0_kref+0x638:   	fcmpeq32	%f24, %f30, %l4
	call	SYM(t0_subr1)
	.word	0xb9b7067c	! t0_kref+0x640:   	fmul8x16au	%f28, %f28, %f28
	.word	0xda76401d	! t0_kref+0x644:   	stx	%o5, [%i1 + %i5]
	.word	0x91408000	! t0_kref+0x648:   	mov	%ccr, %o0
	.word	0xd81e2000	! t0_kref+0x64c:   	ldd	[%i0], %o4
	.word	0xb1a789b9	! t0_kref+0x650:   	fdivs	%f30, %f25, %f24
	.word	0xdaf67fe0	! t0_kref+0x654:   	stxa	%o5, [%i1 - 0x20]%asi
	.word	0xb7a609bc	! t0_kref+0x658:   	fdivs	%f24, %f28, %f27
	.word	0xa8d3400d	! t0_kref+0x65c:   	umulcc	%o5, %o5, %l4
	.word	0xbda0003d	! t0_kref+0x660:   	fmovs	%f29, %f30
	.word	0xb1b7cea0	! t0_kref+0x664:   	fsrc1s	%f31, %f24
	.word	0x922b400d	! t0_kref+0x668:   	andn	%o5, %o5, %o1
	.word	0xdaa0a00c	! t0_kref+0x66c:   	sta	%o5, [%g2 + 0xc]%asi
	.word	0xb1b78ed8	! t0_kref+0x670:   	fornot2	%f30, %f24, %f24
	.word	0xd2480018	! t0_kref+0x674:   	ldsb	[%g0 + %i0], %o1
	.word	0xd6c0a024	! t0_kref+0x678:   	ldswa	[%g2 + 0x24]%asi, %o3
	.word	0xd20e3ff0	! t0_kref+0x67c:   	ldub	[%i0 - 0x10], %o1
	.word	0x9de3bfa0	! t0_kref+0x680:   	save	%sp, -0x60, %sp
	.word	0xba57337e	! t0_kref+0x684:   	umul	%i4, -0xc82, %i5
	.word	0xabee0019	! t0_kref+0x688:   	restore	%i0, %i1, %l5
	.word	0xd44e0000	! t0_kref+0x68c:   	ldsb	[%i0], %o2
	.word	0xd4163fee	! t0_kref+0x690:   	lduh	[%i0 - 0x12], %o2
	.word	0xb1b60e5c	! t0_kref+0x694:   	fxnor	%f24, %f28, %f24
	.word	0xd00e3ff1	! t0_kref+0x698:   	ldub	[%i0 - 0xf], %o0
	.word	0xd4d0a000	! t0_kref+0x69c:   	ldsha	[%g2]%asi, %o2
	.word	0xd4801018	! t0_kref+0x6a0:   	lda	[%g0 + %i0]0x80, %o2
	.word	0xea10a026	! t0_kref+0x6a4:   	lduh	[%g2 + 0x26], %l5
	.word	0x81af8a3f	! t0_kref+0x6a8:   	fcmps	%fcc0, %f30, %f31
	.word	0xbdb70f9e	! t0_kref+0x6ac:   	for	%f28, %f30, %f30
	.word	0xf520a028	! t0_kref+0x6b0:   	st	%f26, [%g2 + 0x28]
	.word	0x94f3400d	! t0_kref+0x6b4:   	udivcc	%o5, %o5, %o2
	.word	0xb3a709bd	! t0_kref+0x6b8:   	fdivs	%f28, %f29, %f25
	.word	0xbda0189d	! t0_kref+0x6bc:   	fitos	%f29, %f30
	.word	0xb9b70cbd	! t0_kref+0x6c0:   	fandnot2s	%f28, %f29, %f28
	.word	0xb7a6c9bd	! t0_kref+0x6c4:   	fdivs	%f27, %f29, %f27
	.word	0xb9b6871f	! t0_kref+0x6c8:   	fmuld8sux16	%f26, %f31, %f28
	.word	0xd4564000	! t0_kref+0x6cc:   	ldsh	[%i1], %o2
	.word	0xae9b400d	! t0_kref+0x6d0:   	xorcc	%o5, %o5, %l7
	.word	0x90f373dd	! t0_kref+0x6d4:   	udivcc	%o5, -0xc23, %o0
	.word	0xbba000bb	! t0_kref+0x6d8:   	fnegs	%f27, %f29
	.word	0xae83400d	! t0_kref+0x6dc:   	addcc	%o5, %o5, %l7
	.word	0xee48a00f	! t0_kref+0x6e0:   	ldsb	[%g2 + 0xf], %l7
	.word	0xe888a03a	! t0_kref+0x6e4:   	lduba	[%g2 + 0x3a]%asi, %l4
	.word	0x3e800004	! t0_kref+0x6e8:   	bvc,a	_kref+0x6f8
	.word	0x94036485	! t0_kref+0x6ec:   	add	%o5, 0x485, %o2
	.word	0xf5066018	! t0_kref+0x6f0:   	ld	[%i1 + 0x18], %f26
	.word	0xb1b6897f	! t0_kref+0x6f4:   	fpmerge	%f26, %f31, %f24
	.word	0xda780019	! t0_kref+0x6f8:   	swap	[%g0 + %i1], %o5
	.word	0xafb7851a	! t0_kref+0x6fc:   	fcmpgt16	%f30, %f26, %l7
	.word	0xbdb6067e	! t0_kref+0x700:   	fmul8x16au	%f24, %f30, %f30
	.word	0xe80e7ff4	! t0_kref+0x704:   	ldub	[%i1 - 0xc], %l4
	.word	0xae53400d	! t0_kref+0x708:   	umul	%o5, %o5, %l7
	.word	0xf9a0a004	! t0_kref+0x70c:   	sta	%f28, [%g2 + 4]%asi
	.word	0xd488a02b	! t0_kref+0x710:   	lduba	[%g2 + 0x2b]%asi, %o2
	.word	0x9fc10000	! t0_kref+0x714:   	call	%g4
	.word	0xa783400d	! t0_kref+0x718:   	wr	%o5, %o5, %gsr
	.word	0xbfb74e3b	! t0_kref+0x71c:   	fands	%f29, %f27, %f31
	.word	0x97b3432d	! t0_kref+0x720:   	bmask	%o5, %o5, %o3
	.word	0xb7b00f3b	! t0_kref+0x724:   	fsrc2s	%f27, %f27
	.word	0xd09e7fe8	! t0_kref+0x728:   	ldda	[%i1 - 0x18]%asi, %o0
	.word	0xb9a789bc	! t0_kref+0x72c:   	fdivs	%f30, %f28, %f28
	.word	0xec4e4000	! t0_kref+0x730:   	ldsb	[%i1], %l6
	.word	0xb1b00f1a	! t0_kref+0x734:   	fsrc2	%f26, %f24
	.word	0xe8c0a030	! t0_kref+0x738:   	ldswa	[%g2 + 0x30]%asi, %l4
	.word	0xb7b74dbb	! t0_kref+0x73c:   	fxors	%f29, %f27, %f27
	.word	0xb9a6c9ba	! t0_kref+0x740:   	fdivs	%f27, %f26, %f28
	.word	0xec162012	! t0_kref+0x744:   	lduh	[%i0 + 0x12], %l6
	.word	0xb1b68e5c	! t0_kref+0x748:   	fxnor	%f26, %f28, %f24
	.word	0x3e800006	! t0_kref+0x74c:   	bvc,a	_kref+0x764
	.word	0xafb3402d	! t0_kref+0x750:   	edge8n	%o5, %o5, %l7
	.word	0xf900a000	! t0_kref+0x754:   	ld	[%g2], %f28
	.word	0xe6566006	! t0_kref+0x758:   	ldsh	[%i1 + 6], %l3
	.word	0xd81e2008	! t0_kref+0x75c:   	ldd	[%i0 + 8], %o4
	.word	0xf786501c	! t0_kref+0x760:   	lda	[%i1 + %i4]0x80, %f27
	.word	0xaf33600e	! t0_kref+0x764:   	srl	%o5, 0xe, %l7
	.word	0xea90a034	! t0_kref+0x768:   	lduha	[%g2 + 0x34]%asi, %l5
	.word	0xda28a03f	! t0_kref+0x76c:   	stb	%o5, [%g2 + 0x3f]
	.word	0xf9be588d	! t0_kref+0x770:   	stda	%f28, [%i1 + %o5]0xc4
	.word	0xee06401c	! t0_kref+0x774:   	ld	[%i1 + %i4], %l7
	.word	0xacf368b8	! t0_kref+0x778:   	udivcc	%o5, 0x8b8, %l6
	.word	0xbda0055c	! t0_kref+0x77c:   	fsqrtd	%f28, %f30
	.word	0xb1a0191e	! t0_kref+0x780:   	fitod	%f30, %f24
	.word	0xb7a749bf	! t0_kref+0x784:   	fdivs	%f29, %f31, %f27
	.word	0x962b400d	! t0_kref+0x788:   	andn	%o5, %o5, %o3
	.word	0xbba689b8	! t0_kref+0x78c:   	fdivs	%f26, %f24, %f29
	.word	0xb5b00f1e	! t0_kref+0x790:   	fsrc2	%f30, %f26
	.word	0xf9000018	! t0_kref+0x794:   	ld	[%g0 + %i0], %f28
	.word	0xd0064000	! t0_kref+0x798:   	ld	[%i1], %o0
	.word	0xa7b68418	! t0_kref+0x79c:   	fcmple16	%f26, %f24, %l3
	.word	0xedf6500d	! t0_kref+0x7a0:   	casxa	[%i1]0x80, %o5, %l6
	.word	0xdaa8a01f	! t0_kref+0x7a4:   	stba	%o5, [%g2 + 0x1f]%asi
	.word	0xe80e0000	! t0_kref+0x7a8:   	ldub	[%i0], %l4
	.word	0xf980a02c	! t0_kref+0x7ac:   	lda	[%g2 + 0x2c]%asi, %f28
	.word	0xb9a649be	! t0_kref+0x7b0:   	fdivs	%f25, %f30, %f28
	.word	0xda30a034	! t0_kref+0x7b4:   	sth	%o5, [%g2 + 0x34]
	.word	0xb5b00cda	! t0_kref+0x7b8:   	fnot2	%f26, %f26
	.word	0xb9a000bd	! t0_kref+0x7bc:   	fnegs	%f29, %f28
	.word	0xea070018	! t0_kref+0x7c0:   	ld	[%i4 + %i0], %l5
	.word	0xd2062010	! t0_kref+0x7c4:   	ld	[%i0 + 0x10], %o1
	.word	0xfd1fbd80	! t0_kref+0x7c8:   	ldd	[%fp - 0x280], %f30
	.word	0x35800005	! t0_kref+0x7cc:   	fbue,a	_kref+0x7e0
	.word	0xb5b00f1c	! t0_kref+0x7d0:   	fsrc2	%f28, %f26
	.word	0xb5b009bd	! t0_kref+0x7d4:   	fexpand	%f29, %f26
	.word	0xb5a0191b	! t0_kref+0x7d8:   	fitod	%f27, %f26
	.word	0xd00e3ff9	! t0_kref+0x7dc:   	ldub	[%i0 - 7], %o0
	.word	0xbdb70738	! t0_kref+0x7e0:   	fmuld8ulx16	%f28, %f24, %f30
	.word	0xbfa01a3e	! t0_kref+0x7e4:   	fstoi	%f30, %f31
	.word	0x96f372b5	! t0_kref+0x7e8:   	udivcc	%o5, -0xd4b, %o3
	.word	0xabb68418	! t0_kref+0x7ec:   	fcmple16	%f26, %f24, %l5
	.word	0xf1a0a028	! t0_kref+0x7f0:   	sta	%f24, [%g2 + 0x28]%asi
	.word	0xea881018	! t0_kref+0x7f4:   	lduba	[%g0 + %i0]0x80, %l5
	.word	0xd4067fe0	! t0_kref+0x7f8:   	ld	[%i1 - 0x20], %o2
	.word	0xe84e200b	! t0_kref+0x7fc:   	ldsb	[%i0 + 0xb], %l4
	.word	0xf920a014	! t0_kref+0x800:   	st	%f28, [%g2 + 0x14]
	.word	0x001fffff	! t0_kref+0x804:   	illtrap	0x1fffff
	.word	0xd6064000	! t0_kref+0x808:   	ld	[%i1], %o3
	.word	0x86102003	! t0_kref+0x80c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x810:   	bne,a	_kref+0x810
	.word	0x86a0e001	! t0_kref+0x814:   	subcc	%g3, 1, %g3
	.word	0xb9a0055c	! t0_kref+0x818:   	fsqrtd	%f28, %f28
	.word	0x8d8375e1	! t0_kref+0x81c:   	wr	%o5, 0xfffff5e1, %fprs
	.word	0xda20a030	! t0_kref+0x820:   	st	%o5, [%g2 + 0x30]
	.word	0xd4462000	! t0_kref+0x824:   	ldsw	[%i0], %o2
	.word	0xbdb70e5e	! t0_kref+0x828:   	fxnor	%f28, %f30, %f30
	.word	0xe46e2003	! t0_kref+0x82c:   	ldstub	[%i0 + 3], %l2
	.word	0xb9b00f38	! t0_kref+0x830:   	fsrc2s	%f24, %f28
	.word	0xd2c0a008	! t0_kref+0x834:   	ldswa	[%g2 + 8]%asi, %o1
	.word	0xea80a02c	! t0_kref+0x838:   	lda	[%g2 + 0x2c]%asi, %l5
	.word	0x37800007	! t0_kref+0x83c:   	fbge,a	_kref+0x858
	.word	0xb9b6097a	! t0_kref+0x840:   	fpmerge	%f24, %f26, %f28
	.word	0xf9be5a5d	! t0_kref+0x844:   	stda	%f28, [%i1 + %i5]0xd2
	.word	0x93b7041e	! t0_kref+0x848:   	fcmple16	%f28, %f30, %o1
	.word	0xec080019	! t0_kref+0x84c:   	ldub	[%g0 + %i1], %l6
	.word	0xb3a709bb	! t0_kref+0x850:   	fdivs	%f28, %f27, %f25
	.word	0xd400a014	! t0_kref+0x854:   	ld	[%g2 + 0x14], %o2
	.word	0x91b3402d	! t0_kref+0x858:   	edge8n	%o5, %o5, %o0
	.word	0xea90a00a	! t0_kref+0x85c:   	lduha	[%g2 + 0xa]%asi, %l5
	.word	0xec4e001a	! t0_kref+0x860:   	ldsb	[%i0 + %i2], %l6
	.word	0xea0e0000	! t0_kref+0x864:   	ldub	[%i0], %l5
	.word	0xd81e6010	! t0_kref+0x868:   	ldd	[%i1 + 0x10], %o4
	.word	0x81afca3a	! t0_kref+0x86c:   	fcmps	%fcc0, %f31, %f26
	.word	0xbda00539	! t0_kref+0x870:   	fsqrts	%f25, %f30
	.word	0xae2b400d	! t0_kref+0x874:   	andn	%o5, %o5, %l7
	.word	0x3c800006	! t0_kref+0x878:   	bpos,a	_kref+0x890
	.word	0xe810a030	! t0_kref+0x87c:   	lduh	[%g2 + 0x30], %l4
	.word	0xa683400d	! t0_kref+0x880:   	addcc	%o5, %o5, %l3
	.word	0xdaa0a010	! t0_kref+0x884:   	sta	%o5, [%g2 + 0x10]%asi
	.word	0x902b400d	! t0_kref+0x888:   	andn	%o5, %o5, %o0
	.word	0x8583400d	! t0_kref+0x88c:   	wr	%o5, %o5, %ccr
	.word	0xbdb00cd8	! t0_kref+0x890:   	fnot2	%f24, %f30
	.word	0xa893400d	! t0_kref+0x894:   	orcc	%o5, %o5, %l4
	.word	0x95702894	! t0_kref+0x898:   	popc	0x894, %o2
	.word	0xd4d01018	! t0_kref+0x89c:   	ldsha	[%g0 + %i0]0x80, %o2
	.word	0xe83e6018	! t0_kref+0x8a0:   	std	%l4, [%i1 + 0x18]
	.word	0x36800005	! t0_kref+0x8a4:   	bge,a	_kref+0x8b8
	.word	0x95b3432d	! t0_kref+0x8a8:   	bmask	%o5, %o5, %o2
	.word	0xda30a036	! t0_kref+0x8ac:   	sth	%o5, [%g2 + 0x36]
	.word	0xaa7b6464	! t0_kref+0x8b0:   	sdiv	%o5, 0x464, %l5
	.word	0xbfa0189e	! t0_kref+0x8b4:   	fitos	%f30, %f31
	.word	0xadb3404d	! t0_kref+0x8b8:   	edge8l	%o5, %o5, %l6
	.word	0xebee101c	! t0_kref+0x8bc:   	prefetcha	%i0 + %i4, 21
	.word	0xf1070018	! t0_kref+0x8c0:   	ld	[%i4 + %i0], %f24
	.word	0xa8fb400d	! t0_kref+0x8c4:   	sdivcc	%o5, %o5, %l4
	.word	0xba102018	! t0_kref+0x8c8:   	mov	0x18, %i5
	.word	0xda28a03f	! t0_kref+0x8cc:   	stb	%o5, [%g2 + 0x3f]
	.word	0xd650a02e	! t0_kref+0x8d0:   	ldsh	[%g2 + 0x2e], %o3
	.word	0xb5a0055a	! t0_kref+0x8d4:   	fsqrtd	%f26, %f26
	.word	0xf51f4018	! t0_kref+0x8d8:   	ldd	[%i5 + %i0], %f26
	.word	0x81834000	! t0_kref+0x8dc:   	wr	%o5, %g0, %y
	.word	0x81ae0adc	! t0_kref+0x8e0:   	fcmped	%fcc0, %f24, %f28
	.word	0xb5a708da	! t0_kref+0x8e4:   	fsubd	%f28, %f26, %f26
	.word	0xd00e6019	! t0_kref+0x8e8:   	ldub	[%i1 + 0x19], %o0
	.word	0xafb34240	! t0_kref+0x8ec:   	array16	%o5, %g0, %l7
	.word	0x9fc00004	! t0_kref+0x8f0:   	call	%g0 + %g4
	.word	0xdaa6601c	! t0_kref+0x8f4:   	sta	%o5, [%i1 + 0x1c]%asi
	.word	0xfd20a028	! t0_kref+0x8f8:   	st	%f30, [%g2 + 0x28]
	.word	0xf51e001d	! t0_kref+0x8fc:   	ldd	[%i0 + %i5], %f26
	.word	0xb5a00538	! t0_kref+0x900:   	fsqrts	%f24, %f26
	.word	0xd4000018	! t0_kref+0x904:   	ld	[%g0 + %i0], %o2
	.word	0xbda608bd	! t0_kref+0x908:   	fsubs	%f24, %f29, %f30
	.word	0xfd06401c	! t0_kref+0x90c:   	ld	[%i1 + %i4], %f30
	.word	0xbba0003a	! t0_kref+0x910:   	fmovs	%f26, %f29
	.word	0xe8060000	! t0_kref+0x914:   	ld	[%i0], %l4
	.word	0xbdb6075a	! t0_kref+0x918:   	fpack32	%f24, %f26, %f30
	.word	0xaa5b400d	! t0_kref+0x91c:   	smul	%o5, %o5, %l5
	.word	0xae6370c3	! t0_kref+0x920:   	subc	%o5, -0xf3d, %l7
	.word	0xfd1e7fe0	! t0_kref+0x924:   	ldd	[%i1 - 0x20], %f30
	.word	0xdaa8a033	! t0_kref+0x928:   	stba	%o5, [%g2 + 0x33]%asi
	.word	0xae5b400d	! t0_kref+0x92c:   	smul	%o5, %o5, %l7
	.word	0xa9b6041e	! t0_kref+0x930:   	fcmple16	%f24, %f30, %l4
	.word	0xdaa8a019	! t0_kref+0x934:   	stba	%o5, [%g2 + 0x19]%asi
	.word	0xfd000019	! t0_kref+0x938:   	ld	[%g0 + %i1], %f30
	.word	0xdab0a038	! t0_kref+0x93c:   	stha	%o5, [%g2 + 0x38]%asi
	.word	0xd090a012	! t0_kref+0x940:   	lduha	[%g2 + 0x12]%asi, %o0
	.word	0xfd180019	! t0_kref+0x944:   	ldd	[%g0 + %i1], %f30
	.word	0xd0180019	! t0_kref+0x948:   	ldd	[%g0 + %i1], %o0
	.word	0xd208a024	! t0_kref+0x94c:   	ldub	[%g2 + 0x24], %o1
	.word	0xea0e6017	! t0_kref+0x950:   	ldub	[%i1 + 0x17], %l5
	.word	0xda20a014	! t0_kref+0x954:   	st	%o5, [%g2 + 0x14]
	.word	0x91408000	! t0_kref+0x958:   	mov	%ccr, %o0
	.word	0x81580000	! t0_kref+0x95c:   	flushw
	.word	0x91703299	! t0_kref+0x960:   	popc	-0xd67, %o0
	.word	0xe968a00b	! t0_kref+0x964:   	prefetch	%g2 + 0xb, 20
	.word	0x9133400d	! t0_kref+0x968:   	srl	%o5, %o5, %o0
	.word	0x81af8a5a	! t0_kref+0x96c:   	fcmpd	%fcc0, %f30, %f26
	.word	0xe80e2016	! t0_kref+0x970:   	ldub	[%i0 + 0x16], %l4
	.word	0x96336977	! t0_kref+0x974:   	orn	%o5, 0x977, %o3
	.word	0xbfa0053f	! t0_kref+0x978:   	fsqrts	%f31, %f31
	.word	0xfd80a028	! t0_kref+0x97c:   	lda	[%g2 + 0x28]%asi, %f30
	.word	0x9fc10000	! t0_kref+0x980:   	call	%g4
	.word	0xb3a609bf	! t0_kref+0x984:   	fdivs	%f24, %f31, %f25
	.word	0xd81e001d	! t0_kref+0x988:   	ldd	[%i0 + %i5], %o4
	.word	0xb1b64a7a	! t0_kref+0x98c:   	fpadd32s	%f25, %f26, %f24
	.word	0xdaa0a030	! t0_kref+0x990:   	sta	%o5, [%g2 + 0x30]%asi
	.word	0xda20a01c	! t0_kref+0x994:   	st	%o5, [%g2 + 0x1c]
	.word	0xbfb68cbc	! t0_kref+0x998:   	fandnot2s	%f26, %f28, %f31
	.word	0xf5a0a008	! t0_kref+0x99c:   	sta	%f26, [%g2 + 8]%asi
	.word	0xfd80a020	! t0_kref+0x9a0:   	lda	[%g2 + 0x20]%asi, %f30
	.word	0xb1b787de	! t0_kref+0x9a4:   	pdist	%f30, %f30, %f24
	.word	0xf900a01c	! t0_kref+0x9a8:   	ld	[%g2 + 0x1c], %f28
	.word	0xe8c8a001	! t0_kref+0x9ac:   	ldsba	[%g2 + 1]%asi, %l4
	.word	0xaef3400d	! t0_kref+0x9b0:   	udivcc	%o5, %o5, %l7
	.word	0xd4480018	! t0_kref+0x9b4:   	ldsb	[%g0 + %i0], %o2
	.word	0xd680a038	! t0_kref+0x9b8:   	lda	[%g2 + 0x38]%asi, %o3
	.word	0xb9a689b8	! t0_kref+0x9bc:   	fdivs	%f26, %f24, %f28
	.word	0xb1b6c97f	! t0_kref+0x9c0:   	fpmerge	%f27, %f31, %f24
	.word	0xaafb7153	! t0_kref+0x9c4:   	sdivcc	%o5, -0xead, %l5
	.word	0x96837058	! t0_kref+0x9c8:   	addcc	%o5, -0xfa8, %o3
	.word	0xd4066000	! t0_kref+0x9cc:   	ld	[%i1], %o2
	.word	0xadb3410d	! t0_kref+0x9d0:   	edge32	%o5, %o5, %l6
	.word	0xec4e401a	! t0_kref+0x9d4:   	ldsb	[%i1 + %i2], %l6
	.word	0xb9b7467f	! t0_kref+0x9d8:   	fmul8x16au	%f29, %f31, %f28
	.word	0xfb80a01c	! t0_kref+0x9dc:   	lda	[%g2 + 0x1c]%asi, %f29
	.word	0xd456c019	! t0_kref+0x9e0:   	ldsh	[%i3 + %i1], %o2
	.word	0xbba7c83e	! t0_kref+0x9e4:   	fadds	%f31, %f30, %f29
	.word	0xf11e0000	! t0_kref+0x9e8:   	ldd	[%i0], %f24
	.word	0xbda789b9	! t0_kref+0x9ec:   	fdivs	%f30, %f25, %f30
	.word	0xb1b68adc	! t0_kref+0x9f0:   	fpsub32	%f26, %f28, %f24
	.word	0xe41e2008	! t0_kref+0x9f4:   	ldd	[%i0 + 8], %l2
	.word	0xf300a02c	! t0_kref+0x9f8:   	ld	[%g2 + 0x2c], %f25
	.word	0x17344d3a	! t0_kref+0x9fc:   	sethi	%hi(0xd134e800), %o3
	.word	0xac3b400d	! t0_kref+0xa00:   	xnor	%o5, %o5, %l6
	.word	0xbfa0053a	! t0_kref+0xa04:   	fsqrts	%f26, %f31
	.word	0xd2063fe4	! t0_kref+0xa08:   	ld	[%i0 - 0x1c], %o1
	.word	0xea88a038	! t0_kref+0xa0c:   	lduba	[%g2 + 0x38]%asi, %l5
	.word	0xee90a004	! t0_kref+0xa10:   	lduha	[%g2 + 4]%asi, %l7
	.word	0xec10a01c	! t0_kref+0xa14:   	lduh	[%g2 + 0x1c], %l6
	.word	0xd288a03a	! t0_kref+0xa18:   	lduba	[%g2 + 0x3a]%asi, %o1
	.word	0xd60e601f	! t0_kref+0xa1c:   	ldub	[%i1 + 0x1f], %o3
	.word	0x86102001	! t0_kref+0xa20:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xa24:   	bne,a	_kref+0xa24
	.word	0x86a0e001	! t0_kref+0xa28:   	subcc	%g3, 1, %g3
	.word	0xec070019	! t0_kref+0xa2c:   	ld	[%i4 + %i1], %l6
	.word	0x95b3416d	! t0_kref+0xa30:   	edge32ln	%o5, %o5, %o2
	.word	0xb9b68e80	! t0_kref+0xa34:   	fsrc1	%f26, %f28
	.word	0x95b34280	! t0_kref+0xa38:   	array32	%o5, %g0, %o2
	.word	0xc568a042	! t0_kref+0xa3c:   	prefetch	%g2 + 0x42, 2
	.word	0xda364000	! t0_kref+0xa40:   	sth	%o5, [%i1]
	.word	0xea8e505a	! t0_kref+0xa44:   	lduba	[%i1 + %i2]0x82, %l5
	.word	0xda20a024	! t0_kref+0xa48:   	st	%o5, [%g2 + 0x24]
	.word	0xf3a0a020	! t0_kref+0xa4c:   	sta	%f25, [%g2 + 0x20]%asi
	.word	0xff20a030	! t0_kref+0xa50:   	st	%f31, [%g2 + 0x30]
	.word	0xadb3404d	! t0_kref+0xa54:   	edge8l	%o5, %o5, %l6
	.word	0x81af8a5c	! t0_kref+0xa58:   	fcmpd	%fcc0, %f30, %f28
	.word	0xea4e7ff2	! t0_kref+0xa5c:   	ldsb	[%i1 - 0xe], %l5
	.word	0xb5b70c5e	! t0_kref+0xa60:   	fnor	%f28, %f30, %f26
	.word	0xee88a006	! t0_kref+0xa64:   	lduba	[%g2 + 6]%asi, %l7
	.word	0xbdb78e80	! t0_kref+0xa68:   	fsrc1	%f30, %f30
	.word	0xd4067fe4	! t0_kref+0xa6c:   	ld	[%i1 - 0x1c], %o2
	.word	0xafb340cd	! t0_kref+0xa70:   	edge16l	%o5, %o5, %l7
	.word	0xea480018	! t0_kref+0xa74:   	ldsb	[%g0 + %i0], %l5
	.word	0xbda0053b	! t0_kref+0xa78:   	fsqrts	%f27, %f30
	.word	0x96db773b	! t0_kref+0xa7c:   	smulcc	%o5, -0x8c5, %o3
	.word	0xd280a000	! t0_kref+0xa80:   	lda	[%g2]%asi, %o1
	.word	0xb9a00138	! t0_kref+0xa84:   	fabss	%f24, %f28
	.word	0xbdb70c98	! t0_kref+0xa88:   	fandnot2	%f28, %f24, %f30
	.word	0xb9b70eda	! t0_kref+0xa8c:   	fornot2	%f28, %f26, %f28
	.word	0xb9b00778	! t0_kref+0xa90:   	fpack16	%f24, %f28
	.word	0xb3a01a39	! t0_kref+0xa94:   	fstoi	%f25, %f25
	.word	0xadb3400d	! t0_kref+0xa98:   	edge8	%o5, %o5, %l6
	.word	0xee500018	! t0_kref+0xa9c:   	ldsh	[%g0 + %i0], %l7
	.word	0xf980a018	! t0_kref+0xaa0:   	lda	[%g2 + 0x18]%asi, %f28
	.word	0xb1a708ba	! t0_kref+0xaa4:   	fsubs	%f28, %f26, %f24
	.word	0xee00a008	! t0_kref+0xaa8:   	ld	[%g2 + 8], %l7
	.word	0xb3a609b8	! t0_kref+0xaac:   	fdivs	%f24, %f24, %f25
	.word	0xae1372ae	! t0_kref+0xab0:   	or	%o5, -0xd52, %l7
	.word	0xb1a7c9bc	! t0_kref+0xab4:   	fdivs	%f31, %f28, %f24
	.word	0xda28a009	! t0_kref+0xab8:   	stb	%o5, [%g2 + 9]
	.word	0xb3b007ba	! t0_kref+0xabc:   	fpackfix	%f26, %f25
	.word	0xec0e6012	! t0_kref+0xac0:   	ldub	[%i1 + 0x12], %l6
	.word	0xadb3404d	! t0_kref+0xac4:   	edge8l	%o5, %o5, %l6
	.word	0xe808a024	! t0_kref+0xac8:   	ldub	[%g2 + 0x24], %l4
	.word	0xb3a609bc	! t0_kref+0xacc:   	fdivs	%f24, %f28, %f25
	.word	0xff066018	! t0_kref+0xad0:   	ld	[%i1 + 0x18], %f31
	.word	0xf51e4000	! t0_kref+0xad4:   	ldd	[%i1], %f26
	.word	0xa9b3404d	! t0_kref+0xad8:   	edge8l	%o5, %o5, %l4
	.word	0xb5a689b9	! t0_kref+0xadc:   	fdivs	%f26, %f25, %f26
	.word	0xaf0b715b	! t0_kref+0xae0:   	tsubcc	%o5, -0xea5, %l7
	.word	0x8583614c	! t0_kref+0xae4:   	wr	%o5, 0x14c, %ccr
	.word	0xb9a609be	! t0_kref+0xae8:   	fdivs	%f24, %f30, %f28
	.word	0xd00e401a	! t0_kref+0xaec:   	ldub	[%i1 + %i2], %o0
	.word	0xacbb400d	! t0_kref+0xaf0:   	xnorcc	%o5, %o5, %l6
	.word	0xdaa8a038	! t0_kref+0xaf4:   	stba	%o5, [%g2 + 0x38]%asi
	.word	0xb5b00f18	! t0_kref+0xaf8:   	fsrc2	%f24, %f26
	.word	0x962b400d	! t0_kref+0xafc:   	andn	%o5, %o5, %o3
	.word	0xea0e6008	! t0_kref+0xb00:   	ldub	[%i1 + 8], %l5
	.word	0xb9b607da	! t0_kref+0xb04:   	pdist	%f24, %f26, %f28
	.word	0xfba0a034	! t0_kref+0xb08:   	sta	%f29, [%g2 + 0x34]%asi
	.word	0xb9a0055e	! t0_kref+0xb0c:   	fsqrtd	%f30, %f28
	.word	0xda30a03c	! t0_kref+0xb10:   	sth	%o5, [%g2 + 0x3c]
	.word	0xb1b687da	! t0_kref+0xb14:   	pdist	%f26, %f26, %f24
	.word	0xb9b6467f	! t0_kref+0xb18:   	fmul8x16au	%f25, %f31, %f28
	.word	0xb5a0055e	! t0_kref+0xb1c:   	fsqrtd	%f30, %f26
	.word	0x86102004	! t0_kref+0xb20:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0xb24:   	bne,a	_kref+0xb24
	.word	0x86a0e001	! t0_kref+0xb28:   	subcc	%g3, 1, %g3
	.word	0xb5a0193e	! t0_kref+0xb2c:   	fstod	%f30, %f26
	.word	0xb5b00c00	! t0_kref+0xb30:   	fzero	%f26
	.word	0xadb605dc	! t0_kref+0xb34:   	fcmpeq32	%f24, %f28, %l6
	.word	0xb9a609b8	! t0_kref+0xb38:   	fdivs	%f24, %f24, %f28
	.word	0xec4e3ff3	! t0_kref+0xb3c:   	ldsb	[%i0 - 0xd], %l6
	.word	0xb5a649be	! t0_kref+0xb40:   	fdivs	%f25, %f30, %f26
	.word	0xe8100018	! t0_kref+0xb44:   	lduh	[%g0 + %i0], %l4
	.word	0xff20a038	! t0_kref+0xb48:   	st	%f31, [%g2 + 0x38]
	.word	0xb5a01938	! t0_kref+0xb4c:   	fstod	%f24, %f26
	.word	0x97b3416d	! t0_kref+0xb50:   	edge32ln	%o5, %o5, %o3
	.word	0xf7000019	! t0_kref+0xb54:   	ld	[%g0 + %i1], %f27
	.word	0xbda0053a	! t0_kref+0xb58:   	fsqrts	%f26, %f30
	.word	0x27800008	! t0_kref+0xb5c:   	fbul,a	_kref+0xb7c
	.word	0xbfa0053e	! t0_kref+0xb60:   	fsqrts	%f30, %f31
	.word	0xb1a000bf	! t0_kref+0xb64:   	fnegs	%f31, %f24
	.word	0xb5a0189e	! t0_kref+0xb68:   	fitos	%f30, %f26
	.word	0xb3a0189e	! t0_kref+0xb6c:   	fitos	%f30, %f25
	.word	0xd4000018	! t0_kref+0xb70:   	ld	[%g0 + %i0], %o2
	.word	0xfda0a000	! t0_kref+0xb74:   	sta	%f30, [%g2]%asi
	.word	0x81834000	! t0_kref+0xb78:   	wr	%o5, %g0, %y
	.word	0xe8000019	! t0_kref+0xb7c:   	ld	[%g0 + %i1], %l4
	.word	0xec3e7ff8	! t0_kref+0xb80:   	std	%l6, [%i1 - 8]
	.word	0xbba749b8	! t0_kref+0xb84:   	fdivs	%f29, %f24, %f29
	.word	0xbdb0077c	! t0_kref+0xb88:   	fpack16	%f28, %f30
	.word	0xf11e4000	! t0_kref+0xb8c:   	ldd	[%i1], %f24
	.word	0xb9b00778	! t0_kref+0xb90:   	fpack16	%f24, %f28
	.word	0x929b73d5	! t0_kref+0xb94:   	xorcc	%o5, -0xc2b, %o1
	.word	0xafb685de	! t0_kref+0xb98:   	fcmpeq32	%f26, %f30, %l7
	.word	0xf1be184d	! t0_kref+0xb9c:   	stda	%f24, [%i0 + %o5]0xc2
	.word	0xda28a03c	! t0_kref+0xba0:   	stb	%o5, [%g2 + 0x3c]
	.word	0xa813400d	! t0_kref+0xba4:   	or	%o5, %o5, %l4
	.word	0x1130dbd5	! t0_kref+0xba8:   	sethi	%hi(0xc36f5400), %o0
	.word	0xb1b00c00	! t0_kref+0xbac:   	fzero	%f24
	.word	0xbda0053e	! t0_kref+0xbb0:   	fsqrts	%f30, %f30
	.word	0xadb34280	! t0_kref+0xbb4:   	array32	%o5, %g0, %l6
	.word	0xbda018de	! t0_kref+0xbb8:   	fdtos	%f30, %f30
	.word	0xb1a608de	! t0_kref+0xbbc:   	fsubd	%f24, %f30, %f24
	.word	0xb1a609bd	! t0_kref+0xbc0:   	fdivs	%f24, %f29, %f24
	.word	0xe80e6011	! t0_kref+0xbc4:   	ldub	[%i1 + 0x11], %l4
	.word	0x81ae8ade	! t0_kref+0xbc8:   	fcmped	%fcc0, %f26, %f30
	.word	0x34800005	! t0_kref+0xbcc:   	bg,a	_kref+0xbe0
	.word	0xda30a026	! t0_kref+0xbd0:   	sth	%o5, [%g2 + 0x26]
	.word	0xee0e401a	! t0_kref+0xbd4:   	ldub	[%i1 + %i2], %l7
	.word	0xb1b686fe	! t0_kref+0xbd8:   	fmul8ulx16	%f26, %f30, %f24
	.word	0x81d90009	! t0_kref+0xbdc:   	flush	%g4 + %o1
	.word	0xd60e401a	! t0_kref+0xbe0:   	ldub	[%i1 + %i2], %o3
	.word	0xeece1000	! t0_kref+0xbe4:   	ldsba	[%i0]0x80, %l7
	.word	0xafb34240	! t0_kref+0xbe8:   	array16	%o5, %g0, %l7
	.word	0xa9b3404d	! t0_kref+0xbec:   	edge8l	%o5, %o5, %l4
	.word	0xb3a6c9b9	! t0_kref+0xbf0:   	fdivs	%f27, %f25, %f25
	.word	0xe6c0a014	! t0_kref+0xbf4:   	ldswa	[%g2 + 0x14]%asi, %l3
	.word	0xbfa0053b	! t0_kref+0xbf8:   	fsqrts	%f27, %f31
	.word	0xd6066000	! t0_kref+0xbfc:   	ld	[%i1], %o3
	.word	0xbdb78e18	! t0_kref+0xc00:   	fand	%f30, %f24, %f30
	.word	0xb1a0055a	! t0_kref+0xc04:   	fsqrtd	%f26, %f24
	.word	0xb1a01939	! t0_kref+0xc08:   	fstod	%f25, %f24
	.word	0xd656c018	! t0_kref+0xc0c:   	ldsh	[%i3 + %i0], %o3
	.word	0xaad3400d	! t0_kref+0xc10:   	umulcc	%o5, %o5, %l5
	.word	0xb5b009b9	! t0_kref+0xc14:   	fexpand	%f25, %f26
	.word	0xb3b7cc7a	! t0_kref+0xc18:   	fnors	%f31, %f26, %f25
	.word	0xf1180019	! t0_kref+0xc1c:   	ldd	[%g0 + %i1], %f24
	.word	0x86102001	! t0_kref+0xc20:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0xc24:   	bne,a	_kref+0xc24
	.word	0x86a0e001	! t0_kref+0xc28:   	subcc	%g3, 1, %g3
	.word	0xf51e001d	! t0_kref+0xc2c:   	ldd	[%i0 + %i5], %f26
	.word	0xda28a03c	! t0_kref+0xc30:   	stb	%o5, [%g2 + 0x3c]
	.word	0x34800003	! t0_kref+0xc34:   	bg,a	_kref+0xc40
	.word	0xd60e7ff5	! t0_kref+0xc38:   	ldub	[%i1 - 0xb], %o3
	.word	0xbba00539	! t0_kref+0xc3c:   	fsqrts	%f25, %f29
	.word	0xb5a789bd	! t0_kref+0xc40:   	fdivs	%f30, %f29, %f26
	.word	0xb5b78dda	! t0_kref+0xc44:   	fnand	%f30, %f26, %f26
	.word	0x92bb400d	! t0_kref+0xc48:   	xnorcc	%o5, %o5, %o1
	.word	0xbda0055a	! t0_kref+0xc4c:   	fsqrtd	%f26, %f30
	.word	0xbda0189a	! t0_kref+0xc50:   	fitos	%f26, %f30
	.word	0xa9b605d8	! t0_kref+0xc54:   	fcmpeq32	%f24, %f24, %l4
	.word	0xe656001b	! t0_kref+0xc58:   	ldsh	[%i0 + %i3], %l3
	.word	0x23800006	! t0_kref+0xc5c:   	fbne,a	_kref+0xc74
	.word	0xbda7c9bf	! t0_kref+0xc60:   	fdivs	%f31, %f31, %f30
	.word	0xbfa00538	! t0_kref+0xc64:   	fsqrts	%f24, %f31
	.word	0xbba01899	! t0_kref+0xc68:   	fitos	%f25, %f29
	.word	0xa7b3430d	! t0_kref+0xc6c:   	alignaddr	%o5, %o5, %l3
	.word	0xd686505c	! t0_kref+0xc70:   	lda	[%i1 + %i4]0x82, %o3
	.word	0xd208a03d	! t0_kref+0xc74:   	ldub	[%g2 + 0x3d], %o1
	.word	0xda28a00a	! t0_kref+0xc78:   	stb	%o5, [%g2 + 0xa]
	.word	0x94ab400d	! t0_kref+0xc7c:   	andncc	%o5, %o5, %o2
	.word	0xd4062000	! t0_kref+0xc80:   	ld	[%i0], %o2
	.word	0xd60e3ff1	! t0_kref+0xc84:   	ldub	[%i0 - 0xf], %o3
	.word	0xea10a032	! t0_kref+0xc88:   	lduh	[%g2 + 0x32], %l5
	.word	0xd6067ff0	! t0_kref+0xc8c:   	ld	[%i1 - 0x10], %o3
	.word	0xb5b687d8	! t0_kref+0xc90:   	pdist	%f26, %f24, %f26
	.word	0xa6937298	! t0_kref+0xc94:   	orcc	%o5, -0xd68, %l3
	.word	0xb1b70f58	! t0_kref+0xc98:   	fornot1	%f28, %f24, %f24
	.word	0xf19e1a5c	! t0_kref+0xc9c:   	ldda	[%i0 + %i4]0xd2, %f24
	.word	0xbfa00539	! t0_kref+0xca0:   	fsqrts	%f25, %f31
	.word	0x8143c000	! t0_kref+0xca4:   	stbar
	.word	0xd656401b	! t0_kref+0xca8:   	ldsh	[%i1 + %i3], %o3
	.word	0xf9a0a008	! t0_kref+0xcac:   	sta	%f28, [%g2 + 8]%asi
	.word	0xee000019	! t0_kref+0xcb0:   	ld	[%g0 + %i1], %l7
	.word	0x3f800008	! t0_kref+0xcb4:   	fbo,a	_kref+0xcd4
	.word	0xd2166000	! t0_kref+0xcb8:   	lduh	[%i1], %o1
	.word	0xf9be588d	! t0_kref+0xcbc:   	stda	%f28, [%i1 + %o5]0xc4
	.word	0xdab0a000	! t0_kref+0xcc0:   	stha	%o5, [%g2]%asi
	.word	0x36800006	! t0_kref+0xcc4:   	bge,a	_kref+0xcdc
	.word	0xb9b78adc	! t0_kref+0xcc8:   	fpsub32	%f30, %f28, %f28
	.word	0xe76e2010	! t0_kref+0xccc:   	prefetch	%i0 + 0x10, 19
	.word	0xd6000019	! t0_kref+0xcd0:   	ld	[%g0 + %i1], %o3
	.word	0xa744c000	! t0_kref+0xcd4:   	mov	%gsr, %l3
	.word	0xb1a0055e	! t0_kref+0xcd8:   	fsqrtd	%f30, %f24
	.word	0xda364000	! t0_kref+0xcdc:   	sth	%o5, [%i1]
	.word	0xf3a0a028	! t0_kref+0xce0:   	sta	%f25, [%g2 + 0x28]%asi
	.word	0xb3b68e38	! t0_kref+0xce4:   	fands	%f26, %f24, %f25
	.word	0xd86e6000	! t0_kref+0xce8:   	ldstub	[%i1], %o4
	.word	0xaee3400d	! t0_kref+0xcec:   	subccc	%o5, %o5, %l7
	.word	0xf19e1a1c	! t0_kref+0xcf0:   	ldda	[%i0 + %i4]0xd0, %f24
	.word	0xb1a60958	! t0_kref+0xcf4:   	fmuld	%f24, %f24, %f24
	.word	0xb1a609de	! t0_kref+0xcf8:   	fdivd	%f24, %f30, %f24
	.word	0x13042bea	! t0_kref+0xcfc:   	sethi	%hi(0x10afa800), %o1
	.word	0x91b3402d	! t0_kref+0xd00:   	edge8n	%o5, %o5, %o0
	.word	0xadb60518	! t0_kref+0xd04:   	fcmpgt16	%f24, %f24, %l6
	.word	0xbfb68fb8	! t0_kref+0xd08:   	fors	%f26, %f24, %f31
	.word	0xfd20a020	! t0_kref+0xd0c:   	st	%f30, [%g2 + 0x20]
	.word	0xb1b6875c	! t0_kref+0xd10:   	fpack32	%f26, %f28, %f24
	.word	0xf180a024	! t0_kref+0xd14:   	lda	[%g2 + 0x24]%asi, %f24
	.word	0xff066004	! t0_kref+0xd18:   	ld	[%i1 + 4], %f31
	.word	0xe608a019	! t0_kref+0xd1c:   	ldub	[%g2 + 0x19], %l3
	.word	0xa6f37391	! t0_kref+0xd20:   	udivcc	%o5, -0xc6f, %l3
	.word	0xac13400d	! t0_kref+0xd24:   	or	%o5, %o5, %l6
	.word	0x81db4004	! t0_kref+0xd28:   	flush	%o5 + %g4
	.word	0xe80e4000	! t0_kref+0xd2c:   	ldub	[%i1], %l4
	call	SYM(t0_subr0)
	.word	0xaef3784c	! t0_kref+0xd34:   	udivcc	%o5, -0x7b4, %l7
	.word	0xf9be1a1c	! t0_kref+0xd38:   	stda	%f28, [%i0 + %i4]0xd0
	.word	0xa8b376d4	! t0_kref+0xd3c:   	orncc	%o5, -0x92c, %l4
	.word	0xb5a0055c	! t0_kref+0xd40:   	fsqrtd	%f28, %f26
	.word	0xd6567fea	! t0_kref+0xd44:   	ldsh	[%i1 - 0x16], %o3
	.word	0xd6163fea	! t0_kref+0xd48:   	lduh	[%i0 - 0x16], %o3
	.word	0x945b6de2	! t0_kref+0xd4c:   	smul	%o5, 0xde2, %o2
	.word	0xac5b400d	! t0_kref+0xd50:   	smul	%o5, %o5, %l6
	.word	0xf1180019	! t0_kref+0xd54:   	ldd	[%g0 + %i1], %f24
	.word	0xb1b7c63e	! t0_kref+0xd58:   	fmul8x16	%f31, %f30, %f24
	.word	0xf9180018	! t0_kref+0xd5c:   	ldd	[%g0 + %i0], %f28
	.word	0xd4167ff8	! t0_kref+0xd60:   	lduh	[%i1 - 8], %o2
	.word	0xd04e401a	! t0_kref+0xd64:   	ldsb	[%i1 + %i2], %o0
	.word	0xbda689d8	! t0_kref+0xd68:   	fdivd	%f26, %f24, %f30
	.word	0xd0560000	! t0_kref+0xd6c:   	ldsh	[%i0], %o0
	.word	0xb9a64d38	! t0_kref+0xd70:   	fsmuld	%f25, %f24, %f28
	.word	0xda30a034	! t0_kref+0xd74:   	sth	%o5, [%g2 + 0x34]
	.word	0xf19eda19	! t0_kref+0xd78:   	ldda	[%i3 + %i1]0xd0, %f24
	.word	0x35480007	! t0_kref+0xd7c:   	fbue,a,pt	%fcc0, _kref+0xd98
	.word	0xafb7841e	! t0_kref+0xd80:   	fcmple16	%f30, %f30, %l7
	.word	0xb9a0111c	! t0_kref+0xd84:   	fxtod	%f28, %f28
	.word	0xac0b400d	! t0_kref+0xd88:   	and	%o5, %o5, %l6
	.word	0xda2e8019	! t0_kref+0xd8c:   	stb	%o5, [%i2 + %i1]
	.word	0x81dbabc9	! t0_kref+0xd90:   	flush	%sp + 0xbc9
	.word	0xb5b60678	! t0_kref+0xd94:   	fmul8x16au	%f24, %f24, %f26
	.word	0xd056c019	! t0_kref+0xd98:   	ldsh	[%i3 + %i1], %o0
	.word	0xb5a6c9bd	! t0_kref+0xd9c:   	fdivs	%f27, %f29, %f26
	.word	0x81ae8a5e	! t0_kref+0xda0:   	fcmpd	%fcc0, %f26, %f30
	.word	0xa6b37f2e	! t0_kref+0xda4:   	orncc	%o5, -0xd2, %l3
	.word	0xaee3400d	! t0_kref+0xda8:   	subccc	%o5, %o5, %l7
	.word	0xe608a03c	! t0_kref+0xdac:   	ldub	[%g2 + 0x3c], %l3
	.word	0xea0e7ff9	! t0_kref+0xdb0:   	ldub	[%i1 - 7], %l5
	.word	0xecc0a030	! t0_kref+0xdb4:   	ldswa	[%g2 + 0x30]%asi, %l6
	.word	0x95b685de	! t0_kref+0xdb8:   	fcmpeq32	%f26, %f30, %o2
	.word	0x97b605d8	! t0_kref+0xdbc:   	fcmpeq32	%f24, %f24, %o3
	.word	0xb9b706ba	! t0_kref+0xdc0:   	fmul8x16al	%f28, %f26, %f28
	.word	0xe888a003	! t0_kref+0xdc4:   	lduba	[%g2 + 3]%asi, %l4
	.word	0xf120a014	! t0_kref+0xdc8:   	st	%f24, [%g2 + 0x14]
	.word	0xf5180019	! t0_kref+0xdcc:   	ldd	[%g0 + %i1], %f26
	.word	0xe6063ffc	! t0_kref+0xdd0:   	ld	[%i0 - 4], %l3
	.word	0xf11f4018	! t0_kref+0xdd4:   	ldd	[%i5 + %i0], %f24
	.word	0x8143e040	! t0_kref+0xdd8:   	membar	0x40
	.word	0xd056600c	! t0_kref+0xddc:   	ldsh	[%i1 + 0xc], %o0
	.word	0xb5a01939	! t0_kref+0xde0:   	fstod	%f25, %f26
	.word	0x9de3bfa0	! t0_kref+0xde4:   	save	%sp, -0x60, %sp
	.word	0xb267401c	! t0_kref+0xde8:   	subc	%i5, %i4, %i1
	.word	0x95ee2f96	! t0_kref+0xdec:   	restore	%i0, 0xf96, %o2
	.word	0xa6bb70ee	! t0_kref+0xdf0:   	xnorcc	%o5, -0xf12, %l3
	.word	0xb7a709bc	! t0_kref+0xdf4:   	fdivs	%f28, %f28, %f27
	.word	0x97b785d8	! t0_kref+0xdf8:   	fcmpeq32	%f30, %f24, %o3
	.word	0xf720a024	! t0_kref+0xdfc:   	st	%f27, [%g2 + 0x24]
	.word	0xf180a014	! t0_kref+0xe00:   	lda	[%g2 + 0x14]%asi, %f24
	.word	0x2f800008	! t0_kref+0xe04:   	fbu,a	_kref+0xe24
	.word	0xbbb7caba	! t0_kref+0xe08:   	fpsub16s	%f31, %f26, %f29
	.word	0xe610a026	! t0_kref+0xe0c:   	lduh	[%g2 + 0x26], %l3
	.word	0xb5b74a7b	! t0_kref+0xe10:   	fpadd32s	%f29, %f27, %f26
	.word	0xda30a012	! t0_kref+0xe14:   	sth	%o5, [%g2 + 0x12]
	.word	0xb5b70a1e	! t0_kref+0xe18:   	fpadd16	%f28, %f30, %f26
	.word	0xb5b787dc	! t0_kref+0xe1c:   	pdist	%f30, %f28, %f26
	.word	0xd0562004	! t0_kref+0xe20:   	ldsh	[%i0 + 4], %o0
	.word	0xb5a6cd3d	! t0_kref+0xe24:   	fsmuld	%f27, %f29, %f26
	.word	0xa7b3430d	! t0_kref+0xe28:   	alignaddr	%o5, %o5, %l3
	.word	0xe16e401d	! t0_kref+0xe2c:   	prefetch	%i1 + %i5, 16
	.word	0xd20e200d	! t0_kref+0xe30:   	ldub	[%i0 + 0xd], %o1
	.word	0xea80a01c	! t0_kref+0xe34:   	lda	[%g2 + 0x1c]%asi, %l5
	.word	0x90e3400d	! t0_kref+0xe38:   	subccc	%o5, %o5, %o0
	.word	0xda36201a	! t0_kref+0xe3c:   	sth	%o5, [%i0 + 0x1a]
	call	SYM(t0_subr2)
	.word	0xd2567ffc	! t0_kref+0xe44:   	ldsh	[%i1 - 4], %o1
	.word	0xf7a0a014	! t0_kref+0xe48:   	sta	%f27, [%g2 + 0x14]%asi
	.word	0xd6563ff2	! t0_kref+0xe4c:   	ldsh	[%i0 - 0xe], %o3
	.word	0xf1a0a004	! t0_kref+0xe50:   	sta	%f24, [%g2 + 4]%asi
	.word	0xd6062004	! t0_kref+0xe54:   	ld	[%i0 + 4], %o3
	.word	0xda200018	! t0_kref+0xe58:   	st	%o5, [%g0 + %i0]
	.word	0xb5a0191b	! t0_kref+0xe5c:   	fitod	%f27, %f26
	.word	0xb9b00f39	! t0_kref+0xe60:   	fsrc2s	%f25, %f28
	.word	0xb1b7c67d	! t0_kref+0xe64:   	fmul8x16au	%f31, %f29, %f24
	.word	0x9fc00004	! t0_kref+0xe68:   	call	%g0 + %g4
	.word	0xf500a008	! t0_kref+0xe6c:   	ld	[%g2 + 8], %f26
	.word	0xd0566006	! t0_kref+0xe70:   	ldsh	[%i1 + 6], %o0
	.word	0xb1b7099c	! t0_kref+0xe74:   	bshuffle	%f28, %f28, %f24
	.word	0xec56600a	! t0_kref+0xe78:   	ldsh	[%i1 + 0xa], %l6
	.word	0xb7a0189d	! t0_kref+0xe7c:   	fitos	%f29, %f27
	.word	0xfd20a030	! t0_kref+0xe80:   	st	%f30, [%g2 + 0x30]
	.word	0x81ae0a5c	! t0_kref+0xe84:   	fcmpd	%fcc0, %f24, %f28
	.word	0x858376da	! t0_kref+0xe88:   	wr	%o5, 0xfffff6da, %ccr
	.word	0xa6e36ef4	! t0_kref+0xe8c:   	subccc	%o5, 0xef4, %l3
	.word	0xf91e6008	! t0_kref+0xe90:   	ldd	[%i1 + 8], %f28
	.word	0xf19e1a5d	! t0_kref+0xe94:   	ldda	[%i0 + %i5]0xd2, %f24
	.word	0xd2000019	! t0_kref+0xe98:   	ld	[%g0 + %i1], %o1
	.word	0xbdb7099c	! t0_kref+0xe9c:   	bshuffle	%f28, %f28, %f30
	.word	0xfd1e0000	! t0_kref+0xea0:   	ldd	[%i0], %f30
	.word	0x878020d2	! t0_kref+0xea4:   	mov	0xd2, %asi
	.word	0xb1a649b8	! t0_kref+0xea8:   	fdivs	%f25, %f24, %f24
	.word	0xda20a00c	! t0_kref+0xeac:   	st	%o5, [%g2 + 0xc]
	.word	0x878020f0	! t0_kref+0xeb0:   	mov	0xf0, %asi
	.word	0x9023400d	! t0_kref+0xeb4:   	sub	%o5, %o5, %o0
	.word	0x8143c000	! t0_kref+0xeb8:   	stbar
	.word	0xec166010	! t0_kref+0xebc:   	lduh	[%i1 + 0x10], %l6
	.word	0xb7a0053e	! t0_kref+0xec0:   	fsqrts	%f30, %f27
	.word	0xd450a002	! t0_kref+0xec4:   	ldsh	[%g2 + 2], %o2
	.word	0xf91fbed0	! t0_kref+0xec8:   	ldd	[%fp - 0x130], %f28
	.word	0xf11fbed8	! t0_kref+0xecc:   	ldd	[%fp - 0x128], %f24
	.word	0xb9a9405a	! t0_kref+0xed0:   	fmovdug	%fcc0, %f26, %f28
	.word	0xd256c018	! t0_kref+0xed4:   	ldsh	[%i3 + %i0], %o1
	.word	0xa7703dcb	! t0_kref+0xed8:   	popc	-0x235, %l3
	.word	0x81ae8a58	! t0_kref+0xedc:   	fcmpd	%fcc0, %f26, %f24
	.word	0xda30a00a	! t0_kref+0xee0:   	sth	%o5, [%g2 + 0xa]
	.word	0xab0b400d	! t0_kref+0xee4:   	tsubcc	%o5, %o5, %l5
	.word	0x93b3432d	! t0_kref+0xee8:   	bmask	%o5, %o5, %o1
	.word	0xd2500018	! t0_kref+0xeec:   	ldsh	[%g0 + %i0], %o1
	.word	0x9fc10000	! t0_kref+0xef0:   	call	%g4
	.word	0xfd1f4019	! t0_kref+0xef4:   	ldd	[%i5 + %i1], %f30
	.word	0xa9236a70	! t0_kref+0xef8:   	mulscc	%o5, 0xa70, %l4
	.word	0x93b3432d	! t0_kref+0xefc:   	bmask	%o5, %o5, %o1
	.word	0xb3a018da	! t0_kref+0xf00:   	fdtos	%f26, %f25
	.word	0xe808a026	! t0_kref+0xf04:   	ldub	[%g2 + 0x26], %l4
	.word	0x9de3bfa0	! t0_kref+0xf08:   	save	%sp, -0x60, %sp
	.word	0xa7e82edb	! t0_kref+0xf0c:   	restore	%g0, 0xedb, %l3
	.word	0xaebb400d	! t0_kref+0xf10:   	xnorcc	%o5, %o5, %l7
	.word	0xee567fec	! t0_kref+0xf14:   	ldsh	[%i1 - 0x14], %l7
	.word	0x81af4a3a	! t0_kref+0xf18:   	fcmps	%fcc0, %f29, %f26
	.word	0xf51f4019	! t0_kref+0xf1c:   	ldd	[%i5 + %i1], %f26
	.word	0xd410a000	! t0_kref+0xf20:   	lduh	[%g2], %o2
	.word	0x96136848	! t0_kref+0xf24:   	or	%o5, 0x848, %o3
	.word	0xc768a043	! t0_kref+0xf28:   	prefetch	%g2 + 0x43, 3
	.word	0x9fc10000	! t0_kref+0xf2c:   	call	%g4
	.word	0xd400a01c	! t0_kref+0xf30:   	ld	[%g2 + 0x1c], %o2
	.word	0xee060000	! t0_kref+0xf34:   	ld	[%i0], %l7
	.word	0xbbb7ce39	! t0_kref+0xf38:   	fands	%f31, %f25, %f29
	.word	0x27800005	! t0_kref+0xf3c:   	fbul,a	_kref+0xf50
	.word	0xe800a01c	! t0_kref+0xf40:   	ld	[%g2 + 0x1c], %l4
	.word	0xb5a609bb	! t0_kref+0xf44:   	fdivs	%f24, %f27, %f26
	.word	0xd610a006	! t0_kref+0xf48:   	lduh	[%g2 + 6], %o3
	.word	0xbdb00fc0	! t0_kref+0xf4c:   	fone	%f30
	.word	0xe810a016	! t0_kref+0xf50:   	lduh	[%g2 + 0x16], %l4
	.word	0x91b3432d	! t0_kref+0xf54:   	bmask	%o5, %o5, %o0
	.word	0xb1b78ea0	! t0_kref+0xf58:   	fsrc1s	%f30, %f24
	.word	0xa7837b2a	! t0_kref+0xf5c:   	wr	%o5, 0xfffffb2a, %gsr
	.word	0xda30a03a	! t0_kref+0xf60:   	sth	%o5, [%g2 + 0x3a]
	.word	0xf900a014	! t0_kref+0xf64:   	ld	[%g2 + 0x14], %f28
	.word	0x8143c000	! t0_kref+0xf68:   	stbar
	.word	0xee50a010	! t0_kref+0xf6c:   	ldsh	[%g2 + 0x10], %l7
	.word	0x8143e02c	! t0_kref+0xf70:   	membar	0x2c
	.word	0xee566018	! t0_kref+0xf74:   	ldsh	[%i1 + 0x18], %l7
	.word	0xf520a014	! t0_kref+0xf78:   	st	%f26, [%g2 + 0x14]
	.word	0xbdb009bc	! t0_kref+0xf7c:   	fexpand	%f28, %f30
	.word	0x96836c48	! t0_kref+0xf80:   	addcc	%o5, 0xc48, %o3
	.word	0xb1b7067c	! t0_kref+0xf84:   	fmul8x16au	%f28, %f28, %f24
	.word	0xb5a64d3b	! t0_kref+0xf88:   	fsmuld	%f25, %f27, %f26
	.word	0xd0063fe0	! t0_kref+0xf8c:   	ld	[%i0 - 0x20], %o0
	.word	0xbfa649b8	! t0_kref+0xf90:   	fdivs	%f25, %f24, %f31
	.word	0xa7b784da	! t0_kref+0xf94:   	fcmpne32	%f30, %f26, %l3
	.word	0xd2160000	! t0_kref+0xf98:   	lduh	[%i0], %o1
	.word	0xd4080018	! t0_kref+0xf9c:   	ldub	[%g0 + %i0], %o2
	.word	0xb5a0055a	! t0_kref+0xfa0:   	fsqrtd	%f26, %f26
	.word	0xe810a016	! t0_kref+0xfa4:   	lduh	[%g2 + 0x16], %l4
	.word	0xda2e401a	! t0_kref+0xfa8:   	stb	%o5, [%i1 + %i2]
	.word	0xe640a02c	! t0_kref+0xfac:   	ldsw	[%g2 + 0x2c], %l3
	.word	0xec080018	! t0_kref+0xfb0:   	ldub	[%g0 + %i0], %l6
	.word	0xa813400d	! t0_kref+0xfb4:   	or	%o5, %o5, %l4
	.word	0x90db6085	! t0_kref+0xfb8:   	smulcc	%o5, 0x85, %o0
	.word	0xd496d058	! t0_kref+0xfbc:   	lduha	[%i3 + %i0]0x82, %o2
	.word	0xadb3408d	! t0_kref+0xfc0:   	edge16	%o5, %o5, %l6
	.word	0xee56201a	! t0_kref+0xfc4:   	ldsh	[%i0 + 0x1a], %l7
	.word	0x2f302cf2	! t0_kref+0xfc8:   	sethi	%hi(0xc0b3c800), %l7
	.word	0xb9b7899a	! t0_kref+0xfcc:   	bshuffle	%f30, %f26, %f28
	.word	0x93237f88	! t0_kref+0xfd0:   	mulscc	%o5, -0x78, %o1
	.word	0xadb7845c	! t0_kref+0xfd4:   	fcmpne16	%f30, %f28, %l6
	.word	0xd2066010	! t0_kref+0xfd8:   	ld	[%i1 + 0x10], %o1
	.word	0xe650a002	! t0_kref+0xfdc:   	ldsh	[%g2 + 2], %l3
	.word	0xd650a022	! t0_kref+0xfe0:   	ldsh	[%g2 + 0x22], %o3
	.word	0xec063ff0	! t0_kref+0xfe4:   	ld	[%i0 - 0x10], %l6
	.word	0xf99eda18	! t0_kref+0xfe8:   	ldda	[%i3 + %i0]0xd0, %f28
	.word	0xb9b68e5c	! t0_kref+0xfec:   	fxnor	%f26, %f28, %f28
	.word	0xb3a609be	! t0_kref+0xff0:   	fdivs	%f24, %f30, %f25
	.word	0xfd1e001d	! t0_kref+0xff4:   	ldd	[%i0 + %i5], %f30
	.word	0xe800a028	! t0_kref+0xff8:   	ld	[%g2 + 0x28], %l4
	.word	0xf11e3ff0	! t0_kref+0xffc:   	ldd	[%i0 - 0x10], %f24
	.word	0xee56401b	! t0_kref+0x1000:   	ldsh	[%i1 + %i3], %l7
	.word	0xe03e3fe8	! t0_kref+0x1004:   	std	%l0, [%i0 - 0x18]
	.word	0xfd20a00c	! t0_kref+0x1008:   	st	%f30, [%g2 + 0xc]
	.word	0xbfb74c78	! t0_kref+0x100c:   	fnors	%f29, %f24, %f31
	.word	0xe3b8a040	! t0_kref+0x1010:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x86102002	! t0_kref+0x1014:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1018:   	bne,a	_kref+0x1018
	.word	0x86a0e001	! t0_kref+0x101c:   	subcc	%g3, 1, %g3
	.word	0xbda789ba	! t0_kref+0x1020:   	fdivs	%f30, %f26, %f30
	.word	0xa623400d	! t0_kref+0x1024:   	sub	%o5, %o5, %l3
	.word	0xd0066000	! t0_kref+0x1028:   	ld	[%i1], %o0
	.word	0xb3a01a58	! t0_kref+0x102c:   	fdtoi	%f24, %f25
	.word	0xd640a01c	! t0_kref+0x1030:   	ldsw	[%g2 + 0x1c], %o3
	.word	0xe84e001a	! t0_kref+0x1034:   	ldsb	[%i0 + %i2], %l4
	.word	0xaf2b6005	! t0_kref+0x1038:   	sll	%o5, 0x5, %l7
	.word	0xd6480018	! t0_kref+0x103c:   	ldsb	[%g0 + %i0], %o3
	.word	0x9613400d	! t0_kref+0x1040:   	or	%o5, %o5, %o3
	.word	0xf19e1a1a	! t0_kref+0x1044:   	ldda	[%i0 + %i2]0xd0, %f24
	.word	0xd016c019	! t0_kref+0x1048:   	lduh	[%i3 + %i1], %o0
	.word	0xb5b00f1e	! t0_kref+0x104c:   	fsrc2	%f30, %f26
	.word	0xe840a02c	! t0_kref+0x1050:   	ldsw	[%g2 + 0x2c], %l4
	.word	0xb1b6497b	! t0_kref+0x1054:   	fpmerge	%f25, %f27, %f24
	.word	0xd248a020	! t0_kref+0x1058:   	ldsb	[%g2 + 0x20], %o1
	.word	0xb5a709bb	! t0_kref+0x105c:   	fdivs	%f28, %f27, %f26
	.word	0xd000a028	! t0_kref+0x1060:   	ld	[%g2 + 0x28], %o0
	.word	0xda20a024	! t0_kref+0x1064:   	st	%o5, [%g2 + 0x24]
	.word	0xd250a00c	! t0_kref+0x1068:   	ldsh	[%g2 + 0xc], %o1
	.word	0xd20e001a	! t0_kref+0x106c:   	ldub	[%i0 + %i2], %o1
	.word	0x8143c000	! t0_kref+0x1070:   	stbar
	.word	0xbdb00fc0	! t0_kref+0x1074:   	fone	%f30
	.word	0xb3b7ccbf	! t0_kref+0x1078:   	fandnot2s	%f31, %f31, %f25
	.word	0xbfa0109a	! t0_kref+0x107c:   	fxtos	%f26, %f31
	.word	0xb1b78fbf	! t0_kref+0x1080:   	fors	%f30, %f31, %f24
	.word	0xd60e401a	! t0_kref+0x1084:   	ldub	[%i1 + %i2], %o3
	.word	0x1505312a	! t0_kref+0x1088:   	sethi	%hi(0x14c4a800), %o2
	.word	0xa783400d	! t0_kref+0x108c:   	wr	%o5, %o5, %gsr
	.word	0xf91e7ff8	! t0_kref+0x1090:   	ldd	[%i1 - 8], %f28
	.word	0xda28a00f	! t0_kref+0x1094:   	stb	%o5, [%g2 + 0xf]
	.word	0xe6062010	! t0_kref+0x1098:   	ld	[%i0 + 0x10], %l3
	.word	0xb7b78f7d	! t0_kref+0x109c:   	fornot1s	%f30, %f29, %f27
	.word	0xbfa6c9be	! t0_kref+0x10a0:   	fdivs	%f27, %f30, %f31
	.word	0xd248a018	! t0_kref+0x10a4:   	ldsb	[%g2 + 0x18], %o1
	.word	0xa7837122	! t0_kref+0x10a8:   	wr	%o5, 0xfffff122, %gsr
	.word	0x91b684dc	! t0_kref+0x10ac:   	fcmpne32	%f26, %f28, %o0
	.word	0xb9a0193f	! t0_kref+0x10b0:   	fstod	%f31, %f28
	.word	0xf3067ff8	! t0_kref+0x10b4:   	ld	[%i1 - 8], %f25
	.word	0xec1e6000	! t0_kref+0x10b8:   	ldd	[%i1], %l6
	.word	0xf1be5a5c	! t0_kref+0x10bc:   	stda	%f24, [%i1 + %i4]0xd2
	.word	0xda30a00e	! t0_kref+0x10c0:   	sth	%o5, [%g2 + 0xe]
	.word	0x9de3bfa0	! t0_kref+0x10c4:   	save	%sp, -0x60, %sp
	.word	0x93ee7402	! t0_kref+0x10c8:   	restore	%i1, -0xbfe, %o1
	.word	0xea08a015	! t0_kref+0x10cc:   	ldub	[%g2 + 0x15], %l5
	.word	0xa683400d	! t0_kref+0x10d0:   	addcc	%o5, %o5, %l3
	.word	0xd40e3fff	! t0_kref+0x10d4:   	ldub	[%i0 - 1], %o2
	.word	0xf320a030	! t0_kref+0x10d8:   	st	%f25, [%g2 + 0x30]
	.word	0xa9b785d8	! t0_kref+0x10dc:   	fcmpeq32	%f30, %f24, %l4
	.word	0x93b3410d	! t0_kref+0x10e0:   	edge32	%o5, %o5, %o1
	.word	0xa663400d	! t0_kref+0x10e4:   	subc	%o5, %o5, %l3
	.word	0xd2166002	! t0_kref+0x10e8:   	lduh	[%i1 + 2], %o1
	.word	0xb7b60e78	! t0_kref+0x10ec:   	fxnors	%f24, %f24, %f27
	.word	0x94137c05	! t0_kref+0x10f0:   	or	%o5, -0x3fb, %o2
	.word	0xa970000d	! t0_kref+0x10f4:   	popc	%o5, %l4
	.word	0xac13400d	! t0_kref+0x10f8:   	or	%o5, %o5, %l6
	.word	0x91b7041a	! t0_kref+0x10fc:   	fcmple16	%f28, %f26, %o0
	.word	0xb9b74a79	! t0_kref+0x1100:   	fpadd32s	%f29, %f25, %f28
	.word	0xe8162012	! t0_kref+0x1104:   	lduh	[%i0 + 0x12], %l4
	.word	0xe8567ff8	! t0_kref+0x1108:   	ldsh	[%i1 - 8], %l4
	.word	0xf9180018	! t0_kref+0x110c:   	ldd	[%g0 + %i0], %f28
	.word	0xd016200a	! t0_kref+0x1110:   	lduh	[%i0 + 0xa], %o0
	.word	0xaa13400d	! t0_kref+0x1114:   	or	%o5, %o5, %l5
	.word	0x26800003	! t0_kref+0x1118:   	bl,a	_kref+0x1124
	.word	0x951b400d	! t0_kref+0x111c:   	tsubcctv	%o5, %o5, %o2
	.word	0xaac3400d	! t0_kref+0x1120:   	addccc	%o5, %o5, %l5
	.word	0xf500a03c	! t0_kref+0x1124:   	ld	[%g2 + 0x3c], %f26
	.word	0x91b3410d	! t0_kref+0x1128:   	edge32	%o5, %o5, %o0
	.word	0xa93b6001	! t0_kref+0x112c:   	sra	%o5, 0x1, %l4
	.word	0xd6067fe0	! t0_kref+0x1130:   	ld	[%i1 - 0x20], %o3
	.word	0xb1a0053f	! t0_kref+0x1134:   	fsqrts	%f31, %f24
	.word	0xea067ffc	! t0_kref+0x1138:   	ld	[%i1 - 4], %l5
	.word	0xd608a03e	! t0_kref+0x113c:   	ldub	[%g2 + 0x3e], %o3
	.word	0xab70222b	! t0_kref+0x1140:   	popc	0x22b, %l5
	.word	0xfb06401c	! t0_kref+0x1144:   	ld	[%i1 + %i4], %f29
	.word	0xd04e4000	! t0_kref+0x1148:   	ldsb	[%i1], %o0
	.word	0xaa93400d	! t0_kref+0x114c:   	orcc	%o5, %o5, %l5
	.word	0xee4e8019	! t0_kref+0x1150:   	ldsb	[%i2 + %i1], %l7
	.word	0x3b800002	! t0_kref+0x1154:   	fble,a	_kref+0x115c
	.word	0xf1be188d	! t0_kref+0x1158:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xa744c000	! t0_kref+0x115c:   	mov	%gsr, %l3
	.word	0xafb34200	! t0_kref+0x1160:   	array8	%o5, %g0, %l7
	.word	0xed68a001	! t0_kref+0x1164:   	prefetch	%g2 + 1, 22
	.word	0xe810a010	! t0_kref+0x1168:   	lduh	[%g2 + 0x10], %l4
	.word	0xb1a00038	! t0_kref+0x116c:   	fmovs	%f24, %f24
	.word	0xec180019	! t0_kref+0x1170:   	ldd	[%g0 + %i1], %l6
	.word	0xd40e8018	! t0_kref+0x1174:   	ldub	[%i2 + %i0], %o2
	.word	0xf99e1a5b	! t0_kref+0x1178:   	ldda	[%i0 + %i3]0xd2, %f28
	.word	0xe84e4000	! t0_kref+0x117c:   	ldsb	[%i1], %l4
	.word	0xbdb60db9	! t0_kref+0x1180:   	fxors	%f24, %f25, %f30
	.word	0x923b400d	! t0_kref+0x1184:   	xnor	%o5, %o5, %o1
	.word	0xbda0055c	! t0_kref+0x1188:   	fsqrtd	%f28, %f30
	.word	0xd6070018	! t0_kref+0x118c:   	ld	[%i4 + %i0], %o3
	.word	0x91b7845e	! t0_kref+0x1190:   	fcmpne16	%f30, %f30, %o0
	.word	0xb1b60e1c	! t0_kref+0x1194:   	fand	%f24, %f28, %f24
	.word	0xf11e3ff8	! t0_kref+0x1198:   	ldd	[%i0 - 8], %f24
	.word	0xf1067ffc	! t0_kref+0x119c:   	ld	[%i1 - 4], %f24
	.word	0x81af0a5e	! t0_kref+0x11a0:   	fcmpd	%fcc0, %f28, %f30
	.word	0xe60e3fec	! t0_kref+0x11a4:   	ldub	[%i0 - 0x14], %l3
	.word	0xe60e2012	! t0_kref+0x11a8:   	ldub	[%i0 + 0x12], %l3
	.word	0xda28a009	! t0_kref+0x11ac:   	stb	%o5, [%g2 + 9]
	.word	0x8d83400d	! t0_kref+0x11b0:   	wr	%o5, %o5, %fprs
	.word	0xe80e001a	! t0_kref+0x11b4:   	ldub	[%i0 + %i2], %l4
	.word	0xbda0013d	! t0_kref+0x11b8:   	fabss	%f29, %f30
	.word	0xf1000019	! t0_kref+0x11bc:   	ld	[%g0 + %i1], %f24
	.word	0xbdb7891e	! t0_kref+0x11c0:   	faligndata	%f30, %f30, %f30
	.word	0xb1b6873c	! t0_kref+0x11c4:   	fmuld8ulx16	%f26, %f28, %f24
	.word	0x97b3432d	! t0_kref+0x11c8:   	bmask	%o5, %o5, %o3
	.word	0xbda00558	! t0_kref+0x11cc:   	fsqrtd	%f24, %f30
	.word	0x94db400d	! t0_kref+0x11d0:   	smulcc	%o5, %o5, %o2
	.word	0xb3b00fe0	! t0_kref+0x11d4:   	fones	%f25
	.word	0xbda70d3d	! t0_kref+0x11d8:   	fsmuld	%f28, %f29, %f30
	.word	0xb9a689bf	! t0_kref+0x11dc:   	fdivs	%f26, %f31, %f28
	.word	0xa7b3414d	! t0_kref+0x11e0:   	edge32l	%o5, %o5, %l3
	.word	0xd4563fe6	! t0_kref+0x11e4:   	ldsh	[%i0 - 0x1a], %o2
	.word	0xda28a013	! t0_kref+0x11e8:   	stb	%o5, [%g2 + 0x13]
	.word	0xea0e7fe6	! t0_kref+0x11ec:   	ldub	[%i1 - 0x1a], %l5
	.word	0xee162002	! t0_kref+0x11f0:   	lduh	[%i0 + 2], %l7
	.word	0x905376a8	! t0_kref+0x11f4:   	umul	%o5, -0x958, %o0
	.word	0x912b400d	! t0_kref+0x11f8:   	sll	%o5, %o5, %o0
	.word	0xadb34240	! t0_kref+0x11fc:   	array16	%o5, %g0, %l6
	.word	0xbba709b9	! t0_kref+0x1200:   	fdivs	%f28, %f25, %f29
	.word	0xa723400d	! t0_kref+0x1204:   	mulscc	%o5, %o5, %l3
	.word	0xac13400d	! t0_kref+0x1208:   	or	%o5, %o5, %l6
	.word	0xb9b6c67d	! t0_kref+0x120c:   	fmul8x16au	%f27, %f29, %f28
	.word	0xd00e8018	! t0_kref+0x1210:   	ldub	[%i2 + %i0], %o0
	.word	0xd2167ff8	! t0_kref+0x1214:   	lduh	[%i1 - 8], %o1
	.word	0x81af0a5a	! t0_kref+0x1218:   	fcmpd	%fcc0, %f28, %f26
	.word	0x9de3bfa0	! t0_kref+0x121c:   	save	%sp, -0x60, %sp
	.word	0x97ef401b	! t0_kref+0x1220:   	restore	%i5, %i3, %o3
	.word	0xd24e7ff7	! t0_kref+0x1224:   	ldsb	[%i1 - 9], %o1
	.word	0xb5b78c58	! t0_kref+0x1228:   	fnor	%f30, %f24, %f26
	.word	0xbba01098	! t0_kref+0x122c:   	fxtos	%f24, %f29
	.word	0xda36600c	! t0_kref+0x1230:   	sth	%o5, [%i1 + 0xc]
	.word	0x858365e8	! t0_kref+0x1234:   	wr	%o5, 0x5e8, %ccr
	.word	0xd2567ff8	! t0_kref+0x1238:   	ldsh	[%i1 - 8], %o1
	.word	0xb3a0189d	! t0_kref+0x123c:   	fitos	%f29, %f25
	.word	0xea080019	! t0_kref+0x1240:   	ldub	[%g0 + %i1], %l5
	.word	0xb5b74a78	! t0_kref+0x1244:   	fpadd32s	%f29, %f24, %f26
	.word	0xd00e7ffb	! t0_kref+0x1248:   	ldub	[%i1 - 5], %o0
	.word	0xda262008	! t0_kref+0x124c:   	st	%o5, [%i0 + 8]
	.word	0xf300a008	! t0_kref+0x1250:   	ld	[%g2 + 8], %f25
	.word	0xda2e8019	! t0_kref+0x1254:   	stb	%o5, [%i2 + %i1]
	.word	0xe80e3ffe	! t0_kref+0x1258:   	ldub	[%i0 - 2], %l4
	.word	0x91b685de	! t0_kref+0x125c:   	fcmpeq32	%f26, %f30, %o0
	.word	0x949b400d	! t0_kref+0x1260:   	xorcc	%o5, %o5, %o2
	.word	0xd2060000	! t0_kref+0x1264:   	ld	[%i0], %o1
	.word	0xbbb68fbb	! t0_kref+0x1268:   	fors	%f26, %f27, %f29
	.word	0xd200a010	! t0_kref+0x126c:   	ld	[%g2 + 0x10], %o1
	.word	0x927365e2	! t0_kref+0x1270:   	udiv	%o5, 0x5e2, %o1
	.word	0xd016c019	! t0_kref+0x1274:   	lduh	[%i3 + %i1], %o0
	.word	0xe60e8019	! t0_kref+0x1278:   	ldub	[%i2 + %i1], %l3
	.word	0xd04e401a	! t0_kref+0x127c:   	ldsb	[%i1 + %i2], %o0
	.word	0x81ae0ad8	! t0_kref+0x1280:   	fcmped	%fcc0, %f24, %f24
	.word	0xd656c018	! t0_kref+0x1284:   	ldsh	[%i3 + %i0], %o3
	.word	0xad408000	! t0_kref+0x1288:   	mov	%ccr, %l6
	.word	0xffa01018	! t0_kref+0x128c:   	sta	%f31, [%g0 + %i0]0x80
	.word	0xb1a01a5e	! t0_kref+0x1290:   	fdtoi	%f30, %f24
	.word	0xb5b78ada	! t0_kref+0x1294:   	fpsub32	%f30, %f26, %f26
	.word	0xd456001b	! t0_kref+0x1298:   	ldsh	[%i0 + %i3], %o2
	.word	0x94b37782	! t0_kref+0x129c:   	orncc	%o5, -0x87e, %o2
	.word	0xd40e4000	! t0_kref+0x12a0:   	ldub	[%i1], %o2
	.word	0x97b605d8	! t0_kref+0x12a4:   	fcmpeq32	%f24, %f24, %o3
	.word	0xda20a00c	! t0_kref+0x12a8:   	st	%o5, [%g2 + 0xc]
	call	SYM(t0_subr2)
	.word	0xf91fbd28	! t0_kref+0x12b0:   	ldd	[%fp - 0x2d8], %f28
	.word	0xbda0193b	! t0_kref+0x12b4:   	fstod	%f27, %f30
	.word	0xf900a038	! t0_kref+0x12b8:   	ld	[%g2 + 0x38], %f28
	.word	0xbfa6c9be	! t0_kref+0x12bc:   	fdivs	%f27, %f30, %f31
	.word	0xe01e6010	! t0_kref+0x12c0:   	ldd	[%i1 + 0x10], %l0
	.word	0x23800005	! t0_kref+0x12c4:   	fbne,a	_kref+0x12d8
	.word	0xb7a749ba	! t0_kref+0x12c8:   	fdivs	%f29, %f26, %f27
	.word	0xb5b64978	! t0_kref+0x12cc:   	fpmerge	%f25, %f24, %f26
	.word	0x90f36399	! t0_kref+0x12d0:   	udivcc	%o5, 0x399, %o0
	.word	0x81af0ad8	! t0_kref+0x12d4:   	fcmped	%fcc0, %f28, %f24
	.word	0xb1a7085c	! t0_kref+0x12d8:   	faddd	%f28, %f28, %f24
	.word	0xf9267fec	! t0_kref+0x12dc:   	st	%f28, [%i1 - 0x14]
	.word	0xb9b00cde	! t0_kref+0x12e0:   	fnot2	%f30, %f28
	.word	0xec163ffe	! t0_kref+0x12e4:   	lduh	[%i0 - 2], %l6
	.word	0xd4062004	! t0_kref+0x12e8:   	ld	[%i0 + 4], %o2
	.word	0xb9a7cd3e	! t0_kref+0x12ec:   	fsmuld	%f31, %f30, %f28
	.word	0xb1a789b9	! t0_kref+0x12f0:   	fdivs	%f30, %f25, %f24
	.word	0xbda00539	! t0_kref+0x12f4:   	fsqrts	%f25, %f30
	.word	0xe80e201a	! t0_kref+0x12f8:   	ldub	[%i0 + 0x1a], %l4
	.word	0xec50a024	! t0_kref+0x12fc:   	ldsh	[%g2 + 0x24], %l6
	.word	0xec08a008	! t0_kref+0x1300:   	ldub	[%g2 + 8], %l6
	.word	0xf51e6000	! t0_kref+0x1304:   	ldd	[%i1], %f26
	.word	0xea080019	! t0_kref+0x1308:   	ldub	[%g0 + %i1], %l5
	.word	0xbfb7cdfa	! t0_kref+0x130c:   	fnands	%f31, %f26, %f31
	.word	0xf520a018	! t0_kref+0x1310:   	st	%f26, [%g2 + 0x18]
	.word	0xabb3430d	! t0_kref+0x1314:   	alignaddr	%o5, %o5, %l5
	.word	0xea06001c	! t0_kref+0x1318:   	ld	[%i0 + %i4], %l5
	.word	0xa7b3416d	! t0_kref+0x131c:   	edge32ln	%o5, %o5, %l3
	.word	0xea56c019	! t0_kref+0x1320:   	ldsh	[%i3 + %i1], %l5
	.word	0xe8166014	! t0_kref+0x1324:   	lduh	[%i1 + 0x14], %l4
	.word	0xdab61000	! t0_kref+0x1328:   	stha	%o5, [%i0]0x80
	.word	0xdaf6501d	! t0_kref+0x132c:   	stxa	%o5, [%i1 + %i5]0x80
	.word	0x81af4a3b	! t0_kref+0x1330:   	fcmps	%fcc0, %f29, %f27
	.word	0xf19eda18	! t0_kref+0x1334:   	ldda	[%i3 + %i0]0xd0, %f24
	.word	0xabb3404d	! t0_kref+0x1338:   	edge8l	%o5, %o5, %l5
	.word	0xd4070019	! t0_kref+0x133c:   	ld	[%i4 + %i1], %o2
	.word	0x91b3410d	! t0_kref+0x1340:   	edge32	%o5, %o5, %o0
	.word	0xbda6c9bd	! t0_kref+0x1344:   	fdivs	%f27, %f29, %f30
	.word	0xda760000	! t0_kref+0x1348:   	stx	%o5, [%i0]
	.word	0xb5a0053b	! t0_kref+0x134c:   	fsqrts	%f27, %f26
	.word	0x95b3406d	! t0_kref+0x1350:   	edge8ln	%o5, %o5, %o2
	.word	0xac0b7879	! t0_kref+0x1354:   	and	%o5, -0x787, %l6
	.word	0xe80e3fe1	! t0_kref+0x1358:   	ldub	[%i0 - 0x1f], %l4
	.word	0x9423710f	! t0_kref+0x135c:   	sub	%o5, -0xef1, %o2
	.word	0xda200019	! t0_kref+0x1360:   	st	%o5, [%g0 + %i1]
	.word	0xb1a6c9ba	! t0_kref+0x1364:   	fdivs	%f27, %f26, %f24
	.word	0xea40a030	! t0_kref+0x1368:   	ldsw	[%g2 + 0x30], %l5
	.word	0x97b3410d	! t0_kref+0x136c:   	edge32	%o5, %o5, %o3
	.word	0xe80e8019	! t0_kref+0x1370:   	ldub	[%i2 + %i1], %l4
	.word	0xda20a034	! t0_kref+0x1374:   	st	%o5, [%g2 + 0x34]
	.word	0xb5b78ade	! t0_kref+0x1378:   	fpsub32	%f30, %f30, %f26
	.word	0xb9b00fe0	! t0_kref+0x137c:   	fones	%f28
	.word	0xbbb00f3a	! t0_kref+0x1380:   	fsrc2s	%f26, %f29
	.word	0xe6064000	! t0_kref+0x1384:   	ld	[%i1], %l3
	.word	0xee0e001a	! t0_kref+0x1388:   	ldub	[%i0 + %i2], %l7
	.word	0xfb200018	! t0_kref+0x138c:   	st	%f29, [%g0 + %i0]
	.word	0xb9b68679	! t0_kref+0x1390:   	fmul8x16au	%f26, %f25, %f28
	.word	0xabb3430d	! t0_kref+0x1394:   	alignaddr	%o5, %o5, %l5
	.word	0xbdb7091a	! t0_kref+0x1398:   	faligndata	%f28, %f26, %f30
	.word	0xd000a018	! t0_kref+0x139c:   	ld	[%g2 + 0x18], %o0
	.word	0x81af4a3e	! t0_kref+0x13a0:   	fcmps	%fcc0, %f29, %f30
	.word	0xe83e2010	! t0_kref+0x13a4:   	std	%l4, [%i0 + 0x10]
	.word	0xee066018	! t0_kref+0x13a8:   	ld	[%i1 + 0x18], %l7
	.word	0xd64e6017	! t0_kref+0x13ac:   	ldsb	[%i1 + 0x17], %o3
	.word	0xda20a02c	! t0_kref+0x13b0:   	st	%o5, [%g2 + 0x2c]
	.word	0xadb3408d	! t0_kref+0x13b4:   	edge16	%o5, %o5, %l6
	.word	0xee563ffe	! t0_kref+0x13b8:   	ldsh	[%i0 - 2], %l7
	.word	0xbba688b9	! t0_kref+0x13bc:   	fsubs	%f26, %f25, %f29
	.word	0xf9066010	! t0_kref+0x13c0:   	ld	[%i1 + 0x10], %f28
	.word	0xd04e6003	! t0_kref+0x13c4:   	ldsb	[%i1 + 3], %o0
	.word	0x93b34200	! t0_kref+0x13c8:   	array8	%o5, %g0, %o1
	.word	0xbdb78a7a	! t0_kref+0x13cc:   	fpadd32s	%f30, %f26, %f30
	.word	0xe60e7fe8	! t0_kref+0x13d0:   	ldub	[%i1 - 0x18], %l3
	.word	0xd216c018	! t0_kref+0x13d4:   	lduh	[%i3 + %i0], %o1
	.word	0xd2566008	! t0_kref+0x13d8:   	ldsh	[%i1 + 8], %o1
	.word	0xf7ee501b	! t0_kref+0x13dc:   	prefetcha	%i1 + %i3, 27
	.word	0xda266008	! t0_kref+0x13e0:   	st	%o5, [%i1 + 8]
	.word	0x95b3402d	! t0_kref+0x13e4:   	edge8n	%o5, %o5, %o2
	.word	0xbfa0053f	! t0_kref+0x13e8:   	fsqrts	%f31, %f31
	.word	0x96ab400d	! t0_kref+0x13ec:   	andncc	%o5, %o5, %o3
	.word	0xec06001c	! t0_kref+0x13f0:   	ld	[%i0 + %i4], %l6
	.word	0x913b400d	! t0_kref+0x13f4:   	sra	%o5, %o5, %o0
	.word	0xe650a02c	! t0_kref+0x13f8:   	ldsh	[%g2 + 0x2c], %l3
	.word	0xad0b400d	! t0_kref+0x13fc:   	tsubcc	%o5, %o5, %l6
	.word	0xf100a01c	! t0_kref+0x1400:   	ld	[%g2 + 0x1c], %f24
	.word	0xee166010	! t0_kref+0x1404:   	lduh	[%i1 + 0x10], %l7
	.word	0xe9ee101d	! t0_kref+0x1408:   	prefetcha	%i0 + %i5, 20
	.word	0xfd1e4000	! t0_kref+0x140c:   	ldd	[%i1], %f30
	.word	0x85836ffa	! t0_kref+0x1410:   	wr	%o5, 0xffa, %ccr
	.word	0x22800003	! t0_kref+0x1414:   	be,a	_kref+0x1420
	.word	0xea066008	! t0_kref+0x1418:   	ld	[%i1 + 8], %l5
	.word	0xb5a00158	! t0_kref+0x141c:   	fabsd	%f24, %f26
	.word	0xd0060000	! t0_kref+0x1420:   	ld	[%i0], %o0
	.word	0xb9a688da	! t0_kref+0x1424:   	fsubd	%f26, %f26, %f28
	.word	0x81834000	! t0_kref+0x1428:   	wr	%o5, %g0, %y
	.word	0xbfa018dc	! t0_kref+0x142c:   	fdtos	%f28, %f31
	.word	0xc768a04c	! t0_kref+0x1430:   	prefetch	%g2 + 0x4c, 3
	.word	0xda28a035	! t0_kref+0x1434:   	stb	%o5, [%g2 + 0x35]
	.word	0xb9a0003e	! t0_kref+0x1438:   	fmovs	%f30, %f28
	.word	0x9de3bfa0	! t0_kref+0x143c:   	save	%sp, -0x60, %sp
	.word	0x93e82508	! t0_kref+0x1440:   	restore	%g0, 0x508, %o1
	.word	0xea070018	! t0_kref+0x1444:   	ld	[%i4 + %i0], %l5
	.word	0xd6080018	! t0_kref+0x1448:   	ldub	[%g0 + %i0], %o3
	.word	0xe5e6100d	! t0_kref+0x144c:   	casa	[%i0]0x80, %o5, %l2
	.word	0xda28a029	! t0_kref+0x1450:   	stb	%o5, [%g2 + 0x29]
	.word	0x81af8ada	! t0_kref+0x1454:   	fcmped	%fcc0, %f30, %f26
	.word	0xd400a02c	! t0_kref+0x1458:   	ld	[%g2 + 0x2c], %o2
	.word	0xb5b6091e	! t0_kref+0x145c:   	faligndata	%f24, %f30, %f26
	.word	0xb1a018da	! t0_kref+0x1460:   	fdtos	%f26, %f24
	.word	0xf9be588d	! t0_kref+0x1464:   	stda	%f28, [%i1 + %o5]0xc4
	.word	0xee48a024	! t0_kref+0x1468:   	ldsb	[%g2 + 0x24], %l7
	.word	0xbba8c038	! t0_kref+0x146c:   	fmovsul	%fcc0, %f24, %f29
	.word	0xee0e401a	! t0_kref+0x1470:   	ldub	[%i1 + %i2], %l7
	.word	0xd010a010	! t0_kref+0x1474:   	lduh	[%g2 + 0x10], %o0
	.word	0xbda0055a	! t0_kref+0x1478:   	fsqrtd	%f26, %f30
	.word	0xff263fec	! t0_kref+0x147c:   	st	%f31, [%i0 - 0x14]
	.word	0xac93400d	! t0_kref+0x1480:   	orcc	%o5, %o5, %l6
	.word	0x973b400d	! t0_kref+0x1484:   	sra	%o5, %o5, %o3
	.word	0xbdb00fc0	! t0_kref+0x1488:   	fone	%f30
	.word	0x95b3432d	! t0_kref+0x148c:   	bmask	%o5, %o5, %o2
	.word	0xbfb007ba	! t0_kref+0x1490:   	fpackfix	%f26, %f31
	.word	0xec40a034	! t0_kref+0x1494:   	ldsw	[%g2 + 0x34], %l6
	.word	0xae83400d	! t0_kref+0x1498:   	addcc	%o5, %o5, %l7
	.word	0xadb3410d	! t0_kref+0x149c:   	edge32	%o5, %o5, %l6
	.word	0x960b6974	! t0_kref+0x14a0:   	and	%o5, 0x974, %o3
	.word	0xf5066018	! t0_kref+0x14a4:   	ld	[%i1 + 0x18], %f26
	.word	0x81ae0a5c	! t0_kref+0x14a8:   	fcmpd	%fcc0, %f24, %f28
	.word	0x96e37099	! t0_kref+0x14ac:   	subccc	%o5, -0xf67, %o3
	.word	0xb9b7873b	! t0_kref+0x14b0:   	fmuld8ulx16	%f30, %f27, %f28
	.word	0xf100a028	! t0_kref+0x14b4:   	ld	[%g2 + 0x28], %f24
	.word	0xb8102004	! t0_kref+0x14b8:   	mov	0x4, %i4
	.word	0xb1b78998	! t0_kref+0x14bc:   	bshuffle	%f30, %f24, %f24
	.word	0xa944c000	! t0_kref+0x14c0:   	mov	%gsr, %l4
	.word	0xbba000bd	! t0_kref+0x14c4:   	fnegs	%f29, %f29
	.word	0xbfa649bf	! t0_kref+0x14c8:   	fdivs	%f25, %f31, %f31
	.word	0xda2e401a	! t0_kref+0x14cc:   	stb	%o5, [%i1 + %i2]
	.word	0xb9b6463a	! t0_kref+0x14d0:   	fmul8x16	%f25, %f26, %f28
	.word	0xea063fe4	! t0_kref+0x14d4:   	ld	[%i0 - 0x1c], %l5
	.word	0x92d3400d	! t0_kref+0x14d8:   	umulcc	%o5, %o5, %o1
	.word	0x95702dd7	! t0_kref+0x14dc:   	popc	0xdd7, %o2
	.word	0x2b25bc25	! t0_kref+0x14e0:   	sethi	%hi(0x96f09400), %l5
	.word	0xbdb00cdc	! t0_kref+0x14e4:   	fnot2	%f28, %f30
	.word	0xd44e6005	! t0_kref+0x14e8:   	ldsb	[%i1 + 5], %o2
	.word	0xbfa000ba	! t0_kref+0x14ec:   	fnegs	%f26, %f31
	.word	0xa6a37eb7	! t0_kref+0x14f0:   	subcc	%o5, -0x149, %l3
	.word	0xee164000	! t0_kref+0x14f4:   	lduh	[%i1], %l7
	.word	0xb9b60f9a	! t0_kref+0x14f8:   	for	%f24, %f26, %f28
	.word	0x81af0a58	! t0_kref+0x14fc:   	fcmpd	%fcc0, %f28, %f24
	.word	0xd20e3fea	! t0_kref+0x1500:   	ldub	[%i0 - 0x16], %o1
	.word	0x97b3410d	! t0_kref+0x1504:   	edge32	%o5, %o5, %o3
	.word	0xb1b70f58	! t0_kref+0x1508:   	fornot1	%f28, %f24, %f24
	.word	0x9344c000	! t0_kref+0x150c:   	mov	%gsr, %o1
	.word	0xf900a010	! t0_kref+0x1510:   	ld	[%g2 + 0x10], %f28
	.word	0xb3a0189b	! t0_kref+0x1514:   	fitos	%f27, %f25
	.word	0xd07e7fe8	! t0_kref+0x1518:   	swap	[%i1 - 0x18], %o0
	.word	0x920b400d	! t0_kref+0x151c:   	and	%o5, %o5, %o1
	.word	0xff00a018	! t0_kref+0x1520:   	ld	[%g2 + 0x18], %f31
	.word	0x96036fe3	! t0_kref+0x1524:   	add	%o5, 0xfe3, %o3
	.word	0x878020d2	! t0_kref+0x1528:   	mov	0xd2, %asi
	.word	0xd256c018	! t0_kref+0x152c:   	ldsh	[%i3 + %i0], %o1
	.word	0xbfa00539	! t0_kref+0x1530:   	fsqrts	%f25, %f31
	.word	0xda20a020	! t0_kref+0x1534:   	st	%o5, [%g2 + 0x20]
	.word	0xbfa689b8	! t0_kref+0x1538:   	fdivs	%f26, %f24, %f31
	.word	0xd44e8019	! t0_kref+0x153c:   	ldsb	[%i2 + %i1], %o2
	.word	0xb1b78918	! t0_kref+0x1540:   	faligndata	%f30, %f24, %f24
	.word	0xb5a0053a	! t0_kref+0x1544:   	fsqrts	%f26, %f26
	.word	0xec480019	! t0_kref+0x1548:   	ldsb	[%g0 + %i1], %l6
	.word	0xaeb37022	! t0_kref+0x154c:   	orncc	%o5, -0xfde, %l7
	.word	0xb3a0053d	! t0_kref+0x1550:   	fsqrts	%f29, %f25
	.word	0xe8167fe0	! t0_kref+0x1554:   	lduh	[%i1 - 0x20], %l4
	.word	0xd250a038	! t0_kref+0x1558:   	ldsh	[%g2 + 0x38], %o1
	.word	0xf1180019	! t0_kref+0x155c:   	ldd	[%g0 + %i1], %f24
	.word	0xb3b60ea0	! t0_kref+0x1560:   	fsrc1s	%f24, %f25
	.word	0xa6db400d	! t0_kref+0x1564:   	smulcc	%o5, %o5, %l3
	.word	0x81dd0004	! t0_kref+0x1568:   	flush	%l4 + %g4
	.word	0xafb3410d	! t0_kref+0x156c:   	edge32	%o5, %o5, %l7
	.word	0x91b3406d	! t0_kref+0x1570:   	edge8ln	%o5, %o5, %o0
	.word	0xb5a689bb	! t0_kref+0x1574:   	fdivs	%f26, %f27, %f26
	.word	0xec50a038	! t0_kref+0x1578:   	ldsh	[%g2 + 0x38], %l6
	.word	0xda30a022	! t0_kref+0x157c:   	sth	%o5, [%g2 + 0x22]
	.word	0xa73b400d	! t0_kref+0x1580:   	sra	%o5, %o5, %l3
	.word	0xd60e8019	! t0_kref+0x1584:   	ldub	[%i2 + %i1], %o3
	.word	0xee566006	! t0_kref+0x1588:   	ldsh	[%i1 + 6], %l7
	.word	0xd416600c	! t0_kref+0x158c:   	lduh	[%i1 + 0xc], %o2
	.word	0xbda0055c	! t0_kref+0x1590:   	fsqrtd	%f28, %f30
	.word	0xff067fe8	! t0_kref+0x1594:   	ld	[%i1 - 0x18], %f31
	.word	0xe60e4000	! t0_kref+0x1598:   	ldub	[%i1], %l3
	.word	0xd00e8019	! t0_kref+0x159c:   	ldub	[%i2 + %i1], %o0
	.word	0xbfa609bb	! t0_kref+0x15a0:   	fdivs	%f24, %f27, %f31
	.word	0xf1be5a1c	! t0_kref+0x15a4:   	stda	%f24, [%i1 + %i4]0xd0
	.word	0xf100a018	! t0_kref+0x15a8:   	ld	[%g2 + 0x18], %f24
	.word	0x81df8018	! t0_kref+0x15ac:   	flush	%fp + %i0
	.word	0xea164000	! t0_kref+0x15b0:   	lduh	[%i1], %l5
	.word	0xef68a006	! t0_kref+0x15b4:   	prefetch	%g2 + 6, 23
	.word	0xf300a028	! t0_kref+0x15b8:   	ld	[%g2 + 0x28], %f25
	.word	0x81debb40	! t0_kref+0x15bc:   	flush	%i2 - 0x4c0
	.word	0xe84e601d	! t0_kref+0x15c0:   	ldsb	[%i1 + 0x1d], %l4
	.word	0xec5e3fe8	! t0_kref+0x15c4:   	ldx	[%i0 - 0x18], %l6
	.word	0xaac3400d	! t0_kref+0x15c8:   	addccc	%o5, %o5, %l5
	.word	0x81db4019	! t0_kref+0x15cc:   	flush	%o5 + %i1
	.word	0xf91e2000	! t0_kref+0x15d0:   	ldd	[%i0], %f28
	.word	0xea16c018	! t0_kref+0x15d4:   	lduh	[%i3 + %i0], %l5
	.word	0xea48a003	! t0_kref+0x15d8:   	ldsb	[%g2 + 3], %l5
	.word	0xee4e001a	! t0_kref+0x15dc:   	ldsb	[%i0 + %i2], %l7
	.word	0xd248a02b	! t0_kref+0x15e0:   	ldsb	[%g2 + 0x2b], %o1
	.word	0xb9b60e1e	! t0_kref+0x15e4:   	fand	%f24, %f30, %f28
	.word	0x94036d3d	! t0_kref+0x15e8:   	add	%o5, 0xd3d, %o2
	.word	0xb1b6ce3c	! t0_kref+0x15ec:   	fands	%f27, %f28, %f24
	.word	0xd448a015	! t0_kref+0x15f0:   	ldsb	[%g2 + 0x15], %o2
	.word	0xea167fec	! t0_kref+0x15f4:   	lduh	[%i1 - 0x14], %l5
	.word	0x39480003	! t0_kref+0x15f8:   	fbuge,a,pt	%fcc0, _kref+0x1604
	.word	0xadb3430d	! t0_kref+0x15fc:   	alignaddr	%o5, %o5, %l6
	.word	0x97408000	! t0_kref+0x1600:   	mov	%ccr, %o3
	.word	0xe01f4019	! t0_kref+0x1604:   	ldd	[%i5 + %i1], %l0
	.word	0xda28a006	! t0_kref+0x1608:   	stb	%o5, [%g2 + 6]
	.word	0xa7b3404d	! t0_kref+0x160c:   	edge8l	%o5, %o5, %l3
	.word	0xf1063ff4	! t0_kref+0x1610:   	ld	[%i0 - 0xc], %f24
	.word	0x2a800001	! t0_kref+0x1614:   	bcs,a	_kref+0x1618
	.word	0xd4100019	! t0_kref+0x1618:   	lduh	[%g0 + %i1], %o2
	.word	0xb1a0191a	! t0_kref+0x161c:   	fitod	%f26, %f24
	.word	0xa9418000	! t0_kref+0x1620:   	mov	%fprs, %l4
	.word	0xf11e401d	! t0_kref+0x1624:   	ldd	[%i1 + %i5], %f24
	.word	0xd2062010	! t0_kref+0x1628:   	ld	[%i0 + 0x10], %o1
	.word	0xd400a008	! t0_kref+0x162c:   	ld	[%g2 + 8], %o2
	.word	0xd0500019	! t0_kref+0x1630:   	ldsh	[%g0 + %i1], %o0
	.word	0xb5a649b9	! t0_kref+0x1634:   	fdivs	%f25, %f25, %f26
	.word	0xd04e2009	! t0_kref+0x1638:   	ldsb	[%i0 + 9], %o0
	.word	0xb9a0189b	! t0_kref+0x163c:   	fitos	%f27, %f28
	.word	0xd00e3fed	! t0_kref+0x1640:   	ldub	[%i0 - 0x13], %o0
	.word	0xd2070018	! t0_kref+0x1644:   	ld	[%i4 + %i0], %o1
	.word	0xb5b7ca7a	! t0_kref+0x1648:   	fpadd32s	%f31, %f26, %f26
	.word	0x97b605da	! t0_kref+0x164c:   	fcmpeq32	%f24, %f26, %o3
	.word	0xd408a00b	! t0_kref+0x1650:   	ldub	[%g2 + 0xb], %o2
	.word	0xd648a030	! t0_kref+0x1654:   	ldsb	[%g2 + 0x30], %o3
	.word	0xf1be584d	! t0_kref+0x1658:   	stda	%f24, [%i1 + %o5]0xc2
	.word	0xd2063ff0	! t0_kref+0x165c:   	ld	[%i0 - 0x10], %o1
	.word	0xe84e001a	! t0_kref+0x1660:   	ldsb	[%i0 + %i2], %l4
	.word	0xb7a0053d	! t0_kref+0x1664:   	fsqrts	%f29, %f27
	.word	0x922b65e8	! t0_kref+0x1668:   	andn	%o5, 0x5e8, %o1
	.word	0xe60e601c	! t0_kref+0x166c:   	ldub	[%i1 + 0x1c], %l3
	.word	0xb5b74718	! t0_kref+0x1670:   	fmuld8sux16	%f29, %f24, %f26
	.word	0xf120a000	! t0_kref+0x1674:   	st	%f24, [%g2]
	.word	0xef68a042	! t0_kref+0x1678:   	prefetch	%g2 + 0x42, 23
	.word	0xee4e3ff6	! t0_kref+0x167c:   	ldsb	[%i0 - 0xa], %l7
	.word	0xd40e201a	! t0_kref+0x1680:   	ldub	[%i0 + 0x1a], %o2
	.word	0xf51e2000	! t0_kref+0x1684:   	ldd	[%i0], %f26
	.word	0x8d83400d	! t0_kref+0x1688:   	wr	%o5, %o5, %fprs
	.word	0xa7b6851c	! t0_kref+0x168c:   	fcmpgt16	%f26, %f28, %l3
	.word	0xec460000	! t0_kref+0x1690:   	ldsw	[%i0], %l6
	.word	0xd448a01a	! t0_kref+0x1694:   	ldsb	[%g2 + 0x1a], %o2
	.word	0xa6237fba	! t0_kref+0x1698:   	sub	%o5, -0x46, %l3
	.word	0xbda0055a	! t0_kref+0x169c:   	fsqrtd	%f26, %f30
	.word	0xbda689ba	! t0_kref+0x16a0:   	fdivs	%f26, %f26, %f30
	.word	0xb3b0077c	! t0_kref+0x16a4:   	fpack16	%f28, %f25
	.word	0xae1b400d	! t0_kref+0x16a8:   	xor	%o5, %o5, %l7
	.word	0xf1be184d	! t0_kref+0x16ac:   	stda	%f24, [%i0 + %o5]0xc2
	.word	0xd6062014	! t0_kref+0x16b0:   	ld	[%i0 + 0x14], %o3
	.word	0xdaf01018	! t0_kref+0x16b4:   	stxa	%o5, [%g0 + %i0]0x80
	.word	0xe66e8019	! t0_kref+0x16b8:   	ldstub	[%i2 + %i1], %l3
	.word	0xf11e3fe8	! t0_kref+0x16bc:   	ldd	[%i0 - 0x18], %f24
	.word	0xa7836e2e	! t0_kref+0x16c0:   	wr	%o5, 0xe2e, %gsr
	.word	0xf9beda19	! t0_kref+0x16c4:   	stda	%f28, [%i3 + %i1]0xd0
	.word	0xd2062004	! t0_kref+0x16c8:   	ld	[%i0 + 4], %o1
	.word	0xd4067ff8	! t0_kref+0x16cc:   	ld	[%i1 - 8], %o2
	.word	0xee4e0000	! t0_kref+0x16d0:   	ldsb	[%i0], %l7
	.word	0xabb34240	! t0_kref+0x16d4:   	array16	%o5, %g0, %l5
	.word	0xbbb7cef9	! t0_kref+0x16d8:   	fornot2s	%f31, %f25, %f29
	.word	0xe7ee501a	! t0_kref+0x16dc:   	prefetcha	%i1 + %i2, 19
	.word	0xb7a0003d	! t0_kref+0x16e0:   	fmovs	%f29, %f27
	.word	0xea064000	! t0_kref+0x16e4:   	ld	[%i1], %l5
	.word	0xd40e7ff7	! t0_kref+0x16e8:   	ldub	[%i1 - 9], %o2
	.word	0x001fffff	! t0_kref+0x16ec:   	illtrap	0x1fffff
	.word	0x9483400d	! t0_kref+0x16f0:   	addcc	%o5, %o5, %o2
	.word	0xb1b00cd8	! t0_kref+0x16f4:   	fnot2	%f24, %f24
	.word	0xb9b009bc	! t0_kref+0x16f8:   	fexpand	%f28, %f28
	.word	0xb7a6c9b8	! t0_kref+0x16fc:   	fdivs	%f27, %f24, %f27
	.word	0xb410201c	! t0_kref+0x1700:   	mov	0x1c, %i2
	.word	0xd640a038	! t0_kref+0x1704:   	ldsw	[%g2 + 0x38], %o3
	.word	0xaf23400d	! t0_kref+0x1708:   	mulscc	%o5, %o5, %l7
	.word	0xb8103ff4	! t0_kref+0x170c:   	mov	0xfffffff4, %i4
	.word	0xee066000	! t0_kref+0x1710:   	ld	[%i1], %l7
	.word	0xbdb60d9c	! t0_kref+0x1714:   	fxor	%f24, %f28, %f30
	.word	0xf1be101d	! t0_kref+0x1718:   	stda	%f24, [%i0 + %i5]0x80
	.word	0xb1b78d9c	! t0_kref+0x171c:   	fxor	%f30, %f28, %f24
	.word	0xbda0193a	! t0_kref+0x1720:   	fstod	%f26, %f30
	.word	0x001fffff	! t0_kref+0x1724:   	illtrap	0x1fffff
	.word	0xbdb00f1e	! t0_kref+0x1728:   	fsrc2	%f30, %f30
	.word	0xff00a01c	! t0_kref+0x172c:   	ld	[%g2 + 0x1c], %f31
	.word	0xfb263ff0	! t0_kref+0x1730:   	st	%f29, [%i0 - 0x10]
	.word	0xbba749be	! t0_kref+0x1734:   	fdivs	%f29, %f30, %f29
	.word	0xd40e7ff1	! t0_kref+0x1738:   	ldub	[%i1 - 0xf], %o2
	.word	0xf500a004	! t0_kref+0x173c:   	ld	[%g2 + 4], %f26
	.word	0xbda01899	! t0_kref+0x1740:   	fitos	%f25, %f30
	.word	0xee16c019	! t0_kref+0x1744:   	lduh	[%i3 + %i1], %l7
	.word	0x8143c000	! t0_kref+0x1748:   	stbar
	.word	0x11001a0a	! t0_kref+0x174c:   	sethi	%hi(0x682800), %o0
	.word	0xaf1b400d	! t0_kref+0x1750:   	tsubcctv	%o5, %o5, %l7
	.word	0xe616c019	! t0_kref+0x1754:   	lduh	[%i3 + %i1], %l3
	.word	0xda30a02e	! t0_kref+0x1758:   	sth	%o5, [%g2 + 0x2e]
	.word	0x922b400d	! t0_kref+0x175c:   	andn	%o5, %o5, %o1
	.word	0xea40a034	! t0_kref+0x1760:   	ldsw	[%g2 + 0x34], %l5
	.word	0xda362006	! t0_kref+0x1764:   	sth	%o5, [%i0 + 6]
	.word	0xd2063fe0	! t0_kref+0x1768:   	ld	[%i0 - 0x20], %o1
	.word	0xd0060000	! t0_kref+0x176c:   	ld	[%i0], %o0
	.word	0xb5a00139	! t0_kref+0x1770:   	fabss	%f25, %f26
	.word	0xee000018	! t0_kref+0x1774:   	ld	[%g0 + %i0], %l7
	.word	0xe8be501d	! t0_kref+0x1778:   	stda	%l4, [%i1 + %i5]0x80
	.word	0x95b3412d	! t0_kref+0x177c:   	edge32n	%o5, %o5, %o2
	.word	0xe6066018	! t0_kref+0x1780:   	ld	[%i1 + 0x18], %l3
	.word	0xd478a00c	! t0_kref+0x1784:   	swap	[%g2 + 0xc], %o2
	.word	0xf91f4019	! t0_kref+0x1788:   	ldd	[%i5 + %i1], %f28
	.word	0x92237fd6	! t0_kref+0x178c:   	sub	%o5, -0x2a, %o1
	.word	0xd04e601d	! t0_kref+0x1790:   	ldsb	[%i1 + 0x1d], %o0
	.word	0xbfa0053c	! t0_kref+0x1794:   	fsqrts	%f28, %f31
	.word	0x923b726c	! t0_kref+0x1798:   	xnor	%o5, -0xd94, %o1
	.word	0xda30a034	! t0_kref+0x179c:   	sth	%o5, [%g2 + 0x34]
	.word	0xda20a03c	! t0_kref+0x17a0:   	st	%o5, [%g2 + 0x3c]
	.word	0xf1be188d	! t0_kref+0x17a4:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0x9de3bfa0	! t0_kref+0x17a8:   	save	%sp, -0x60, %sp
	.word	0x97ee3230	! t0_kref+0x17ac:   	restore	%i0, -0xdd0, %o3
	.word	0xf9be5a5d	! t0_kref+0x17b0:   	stda	%f28, [%i1 + %i5]0xd2
	.word	0xf900a038	! t0_kref+0x17b4:   	ld	[%g2 + 0x38], %f28
	.word	0xd440a010	! t0_kref+0x17b8:   	ldsw	[%g2 + 0x10], %o2
	.word	0xb9b0077e	! t0_kref+0x17bc:   	fpack16	%f30, %f28
	.word	0xbdb00f1a	! t0_kref+0x17c0:   	fsrc2	%f26, %f30
	.word	0x81af0a58	! t0_kref+0x17c4:   	fcmpd	%fcc0, %f28, %f24
	.word	0xbba00538	! t0_kref+0x17c8:   	fsqrts	%f24, %f29
	.word	0xa6236d6a	! t0_kref+0x17cc:   	sub	%o5, 0xd6a, %l3
	.word	0xe850a006	! t0_kref+0x17d0:   	ldsh	[%g2 + 6], %l4
	.word	0xb9a01058	! t0_kref+0x17d4:   	fdtox	%f24, %f28
	.word	0xf51e7ff8	! t0_kref+0x17d8:   	ldd	[%i1 - 8], %f26
	.word	0xbda6c9be	! t0_kref+0x17dc:   	fdivs	%f27, %f30, %f30
	.word	0xbdb6c97b	! t0_kref+0x17e0:   	fpmerge	%f27, %f27, %f30
	.word	0xf520a008	! t0_kref+0x17e4:   	st	%f26, [%g2 + 8]
	.word	0xea000018	! t0_kref+0x17e8:   	ld	[%g0 + %i0], %l5
	.word	0xb5b00fc0	! t0_kref+0x17ec:   	fone	%f26
	.word	0xbfb70d60	! t0_kref+0x17f0:   	fnot1s	%f28, %f31
	.word	0xfd1fbcf8	! t0_kref+0x17f4:   	ldd	[%fp - 0x308], %f30
	.word	0xff00a014	! t0_kref+0x17f8:   	ld	[%g2 + 0x14], %f31
	.word	0xe6566006	! t0_kref+0x17fc:   	ldsh	[%i1 + 6], %l3
	.word	0xf11f4018	! t0_kref+0x1800:   	ldd	[%i5 + %i0], %f24
	.word	0xda20a004	! t0_kref+0x1804:   	st	%o5, [%g2 + 4]
	.word	0xb1a6c9bd	! t0_kref+0x1808:   	fdivs	%f27, %f29, %f24
	.word	0xb9b00778	! t0_kref+0x180c:   	fpack16	%f24, %f28
	.word	0xe8567ff8	! t0_kref+0x1810:   	ldsh	[%i1 - 8], %l4
	.word	0xd2066010	! t0_kref+0x1814:   	ld	[%i1 + 0x10], %o1
	.word	0xbba0053e	! t0_kref+0x1818:   	fsqrts	%f30, %f29
	.word	0x91b34240	! t0_kref+0x181c:   	array16	%o5, %g0, %o0
	.word	0xe8480019	! t0_kref+0x1820:   	ldsb	[%g0 + %i1], %l4
	.word	0xf91e6000	! t0_kref+0x1824:   	ldd	[%i1], %f28
	.word	0xe64e401a	! t0_kref+0x1828:   	ldsb	[%i1 + %i2], %l3
	.word	0xea062008	! t0_kref+0x182c:   	ld	[%i0 + 8], %l5
	.word	0xb5a709b9	! t0_kref+0x1830:   	fdivs	%f28, %f25, %f26
	.word	0x83414000	! t0_kref+0x1834:   	mov	%pc, %g1
	.word	0xb9b687da	! t0_kref+0x1838:   	pdist	%f26, %f26, %f28
	.word	0xda28a02a	! t0_kref+0x183c:   	stb	%o5, [%g2 + 0x2a]
	.word	0x81b01021	! t0_kref+0x1840:   	siam	0x1
	.word	0xea16601e	! t0_kref+0x1844:   	lduh	[%i1 + 0x1e], %l5
	.word	0xbda01938	! t0_kref+0x1848:   	fstod	%f24, %f30
	.word	0xafb3410d	! t0_kref+0x184c:   	edge32	%o5, %o5, %l7
	.word	0xd608a01b	! t0_kref+0x1850:   	ldub	[%g2 + 0x1b], %o3
	.word	0xf99e1a1b	! t0_kref+0x1854:   	ldda	[%i0 + %i3]0xd0, %f28
	.word	0x31800007	! t0_kref+0x1858:   	fba,a	_kref+0x1874
	.word	0xa613400d	! t0_kref+0x185c:   	or	%o5, %o5, %l3
	.word	0xb7a01899	! t0_kref+0x1860:   	fitos	%f25, %f27
	.word	0xec4e6018	! t0_kref+0x1864:   	ldsb	[%i1 + 0x18], %l6
	.word	0xda36001b	! t0_kref+0x1868:   	sth	%o5, [%i0 + %i3]
	.word	0xbdb78e80	! t0_kref+0x186c:   	fsrc1	%f30, %f30
	.word	0x38800001	! t0_kref+0x1870:   	bgu,a	_kref+0x1874
	.word	0xf3064000	! t0_kref+0x1874:   	ld	[%i1], %f25
	.word	0xfd180019	! t0_kref+0x1878:   	ldd	[%g0 + %i1], %f30
	.word	0xd456200a	! t0_kref+0x187c:   	ldsh	[%i0 + 0xa], %o2
	.word	0xe840a030	! t0_kref+0x1880:   	ldsw	[%g2 + 0x30], %l4
	.word	0xd04e3ff9	! t0_kref+0x1884:   	ldsb	[%i0 - 7], %o0
	.word	0xe650a018	! t0_kref+0x1888:   	ldsh	[%g2 + 0x18], %l3
	.word	0xbba649be	! t0_kref+0x188c:   	fdivs	%f25, %f30, %f29
	.word	0xe848a03d	! t0_kref+0x1890:   	ldsb	[%g2 + 0x3d], %l4
	.word	0xbda708d8	! t0_kref+0x1894:   	fsubd	%f28, %f24, %f30
	.word	0xb9b64e3f	! t0_kref+0x1898:   	fands	%f25, %f31, %f28
	.word	0xac7360d2	! t0_kref+0x189c:   	udiv	%o5, 0xd2, %l6
	.word	0xbba648b9	! t0_kref+0x18a0:   	fsubs	%f25, %f25, %f29
	.word	0xee0e401a	! t0_kref+0x18a4:   	ldub	[%i1 + %i2], %l7
	.word	0xf5180019	! t0_kref+0x18a8:   	ldd	[%g0 + %i1], %f26
	.word	0xfd1e3fe8	! t0_kref+0x18ac:   	ldd	[%i0 - 0x18], %f30
	.word	0xb3a649b9	! t0_kref+0x18b0:   	fdivs	%f25, %f25, %f25
	.word	0xa863400d	! t0_kref+0x18b4:   	subc	%o5, %o5, %l4
	.word	0xbdb78a7f	! t0_kref+0x18b8:   	fpadd32s	%f30, %f31, %f30
	.word	0xd250a000	! t0_kref+0x18bc:   	ldsh	[%g2], %o1
	.word	0x31800003	! t0_kref+0x18c0:   	fba,a	_kref+0x18cc
	.word	0xf7064000	! t0_kref+0x18c4:   	ld	[%i1], %f27
	.word	0xd240a02c	! t0_kref+0x18c8:   	ldsw	[%g2 + 0x2c], %o1
	.word	0x1332f244	! t0_kref+0x18cc:   	sethi	%hi(0xcbc91000), %o1
	.word	0xf900a000	! t0_kref+0x18d0:   	ld	[%g2], %f28
	.word	0x941366db	! t0_kref+0x18d4:   	or	%o5, 0x6db, %o2
	.word	0xb3b00f3f	! t0_kref+0x18d8:   	fsrc2s	%f31, %f25
	.word	0xe8067ff8	! t0_kref+0x18dc:   	ld	[%i1 - 8], %l4
	.word	0xf700a028	! t0_kref+0x18e0:   	ld	[%g2 + 0x28], %f27
	.word	0xd0480018	! t0_kref+0x18e4:   	ldsb	[%g0 + %i0], %o0
	.word	0xbda0189f	! t0_kref+0x18e8:   	fitos	%f31, %f30
	.word	0xadb340cd	! t0_kref+0x18ec:   	edge16l	%o5, %o5, %l6
	.word	0xac0372b8	! t0_kref+0x18f0:   	add	%o5, -0xd48, %l6
	.word	0xd016200c	! t0_kref+0x18f4:   	lduh	[%i0 + 0xc], %o0
	.word	0xe84e3ff3	! t0_kref+0x18f8:   	ldsb	[%i0 - 0xd], %l4
	.word	0x94837d78	! t0_kref+0x18fc:   	addcc	%o5, -0x288, %o2
	.word	0xf1180019	! t0_kref+0x1900:   	ldd	[%g0 + %i1], %f24
	.word	0x907b400d	! t0_kref+0x1904:   	sdiv	%o5, %o5, %o0
	.word	0xa80b400d	! t0_kref+0x1908:   	and	%o5, %o5, %l4
	.word	0xb9a789bb	! t0_kref+0x190c:   	fdivs	%f30, %f27, %f28
	.word	0xe856401b	! t0_kref+0x1910:   	ldsh	[%i1 + %i3], %l4
	.word	0xda20a01c	! t0_kref+0x1914:   	st	%o5, [%g2 + 0x1c]
	.word	0xd6067fec	! t0_kref+0x1918:   	ld	[%i1 - 0x14], %o3
	.word	0xf91e2018	! t0_kref+0x191c:   	ldd	[%i0 + 0x18], %f28
	.word	0xd6000019	! t0_kref+0x1920:   	ld	[%g0 + %i1], %o3
	.word	0xd650a036	! t0_kref+0x1924:   	ldsh	[%g2 + 0x36], %o3
	.word	0xee560000	! t0_kref+0x1928:   	ldsh	[%i0], %l7
	.word	0xb1b78cbf	! t0_kref+0x192c:   	fandnot2s	%f30, %f31, %f24
	.word	0xac13400d	! t0_kref+0x1930:   	or	%o5, %o5, %l6
	.word	0xb8102010	! t0_kref+0x1934:   	mov	0x10, %i4
	.word	0x81dfe9a6	! t0_kref+0x1938:   	flush	%i7 + 0x9a6
	.word	0xb9a0055c	! t0_kref+0x193c:   	fsqrtd	%f28, %f28
	.word	0x91b6051a	! t0_kref+0x1940:   	fcmpgt16	%f24, %f26, %o0
	.word	0xb9b00c00	! t0_kref+0x1944:   	fzero	%f28
	.word	0xb3b64a7d	! t0_kref+0x1948:   	fpadd32s	%f25, %f29, %f25
	.word	0xaa83690e	! t0_kref+0x194c:   	addcc	%o5, 0x90e, %l5
	.word	0xda20a038	! t0_kref+0x1950:   	st	%o5, [%g2 + 0x38]
	.word	0x2f800005	! t0_kref+0x1954:   	fbu,a	_kref+0x1968
	.word	0xbdb70ddc	! t0_kref+0x1958:   	fnand	%f28, %f28, %f30
	.word	0xd6c6501c	! t0_kref+0x195c:   	ldswa	[%i1 + %i4]0x80, %o3
	.word	0xef68a00d	! t0_kref+0x1960:   	prefetch	%g2 + 0xd, 23
	.word	0xb1b6899e	! t0_kref+0x1964:   	bshuffle	%f26, %f30, %f24
	.word	0xe8080018	! t0_kref+0x1968:   	ldub	[%g0 + %i0], %l4
	.word	0xb9b607de	! t0_kref+0x196c:   	pdist	%f24, %f30, %f28
	.word	0xfd1f4019	! t0_kref+0x1970:   	ldd	[%i5 + %i1], %f30
	.word	0xec062018	! t0_kref+0x1974:   	ld	[%i0 + 0x18], %l6
	.word	0xb9b0077a	! t0_kref+0x1978:   	fpack16	%f26, %f28
	.word	0xb3b68a7d	! t0_kref+0x197c:   	fpadd32s	%f26, %f29, %f25
	.word	0xd4480018	! t0_kref+0x1980:   	ldsb	[%g0 + %i0], %o2
	.word	0xc368a049	! t0_kref+0x1984:   	prefetch	%g2 + 0x49, 1
	.word	0xe648a007	! t0_kref+0x1988:   	ldsb	[%g2 + 7], %l3
	.word	0x24800005	! t0_kref+0x198c:   	ble,a	_kref+0x19a0
	.word	0x921376a4	! t0_kref+0x1990:   	or	%o5, -0x95c, %o1
	.word	0xe8100018	! t0_kref+0x1994:   	lduh	[%g0 + %i0], %l4
	.word	0xb1a0053d	! t0_kref+0x1998:   	fsqrts	%f29, %f24
	.word	0xbdb60fbc	! t0_kref+0x199c:   	fors	%f24, %f28, %f30
	.word	0xaed3400d	! t0_kref+0x19a0:   	umulcc	%o5, %o5, %l7
	.word	0xbfa00538	! t0_kref+0x19a4:   	fsqrts	%f24, %f31
	.word	0xab408000	! t0_kref+0x19a8:   	mov	%ccr, %l5
	.word	0xe610a024	! t0_kref+0x19ac:   	lduh	[%g2 + 0x24], %l3
	.word	0xd81e7ff0	! t0_kref+0x19b0:   	ldd	[%i1 - 0x10], %o4
	.word	0x967b400d	! t0_kref+0x19b4:   	sdiv	%o5, %o5, %o3
	.word	0xb1a6895c	! t0_kref+0x19b8:   	fmuld	%f26, %f28, %f24
	.word	0xafb3416d	! t0_kref+0x19bc:   	edge32ln	%o5, %o5, %l7
	.word	0x3e800005	! t0_kref+0x19c0:   	bvc,a	_kref+0x19d4
	.word	0x81b01023	! t0_kref+0x19c4:   	siam	0x3
	.word	0xadb7845a	! t0_kref+0x19c8:   	fcmpne16	%f30, %f26, %l6
	.word	0xf500a01c	! t0_kref+0x19cc:   	ld	[%g2 + 0x1c], %f26
	.word	0x92e3400d	! t0_kref+0x19d0:   	subccc	%o5, %o5, %o1
	.word	0xd050a016	! t0_kref+0x19d4:   	ldsh	[%g2 + 0x16], %o0
	.word	0xec080018	! t0_kref+0x19d8:   	ldub	[%g0 + %i0], %l6
	.word	0x81ae4a3b	! t0_kref+0x19dc:   	fcmps	%fcc0, %f25, %f27
	.word	0xd6164000	! t0_kref+0x19e0:   	lduh	[%i1], %o3
	call	SYM(t0_subr1)
	.word	0x2b2e362f	! t0_kref+0x19e8:   	sethi	%hi(0xb8d8bc00), %l5
	.word	0x91b70518	! t0_kref+0x19ec:   	fcmpgt16	%f28, %f24, %o0
	.word	0xb7b7cea0	! t0_kref+0x19f0:   	fsrc1s	%f31, %f27
	.word	0xc76e7fe8	! t0_kref+0x19f4:   	prefetch	%i1 - 0x18, 3
	.word	0xf51e0000	! t0_kref+0x19f8:   	ldd	[%i0], %f26
	.word	0xb9b7cefd	! t0_kref+0x19fc:   	fornot2s	%f31, %f29, %f28
	.word	0xbdb68e5a	! t0_kref+0x1a00:   	fxnor	%f26, %f26, %f30
	.word	0xda28a01f	! t0_kref+0x1a04:   	stb	%o5, [%g2 + 0x1f]
	.word	0xb1a0055a	! t0_kref+0x1a08:   	fsqrtd	%f26, %f24
	.word	0xbba0053d	! t0_kref+0x1a0c:   	fsqrts	%f29, %f29
	.word	0xf9bf5a18	! t0_kref+0x1a10:   	stda	%f28, [%i5 + %i0]0xd0
	.word	0x91b785d8	! t0_kref+0x1a14:   	fcmpeq32	%f30, %f24, %o0
	.word	0x24800001	! t0_kref+0x1a18:   	ble,a	_kref+0x1a1c
	.word	0xad70000d	! t0_kref+0x1a1c:   	popc	%o5, %l6
	.word	0x94f378a4	! t0_kref+0x1a20:   	udivcc	%o5, -0x75c, %o2
	.word	0xe848a019	! t0_kref+0x1a24:   	ldsb	[%g2 + 0x19], %l4
	.word	0xb1a688da	! t0_kref+0x1a28:   	fsubd	%f26, %f26, %f24
	.word	0xb5b60f5a	! t0_kref+0x1a2c:   	fornot1	%f24, %f26, %f26
	.word	0xb9b6c6b8	! t0_kref+0x1a30:   	fmul8x16al	%f27, %f24, %f28
	.word	0xd6480019	! t0_kref+0x1a34:   	ldsb	[%g0 + %i1], %o3
	.word	0xb5a00558	! t0_kref+0x1a38:   	fsqrtd	%f24, %f26
	.word	0x9083400d	! t0_kref+0x1a3c:   	addcc	%o5, %o5, %o0
	.word	0xda30a03a	! t0_kref+0x1a40:   	sth	%o5, [%g2 + 0x3a]
	.word	0xda28a01b	! t0_kref+0x1a44:   	stb	%o5, [%g2 + 0x1b]
	.word	0xff00a02c	! t0_kref+0x1a48:   	ld	[%g2 + 0x2c], %f31
	.word	0xb1a649ba	! t0_kref+0x1a4c:   	fdivs	%f25, %f26, %f24
	.word	0xadb34240	! t0_kref+0x1a50:   	array16	%o5, %g0, %l6
	.word	0xee070019	! t0_kref+0x1a54:   	ld	[%i4 + %i1], %l7
	.word	0xb5b74a79	! t0_kref+0x1a58:   	fpadd32s	%f29, %f25, %f26
	.word	0xb1a78958	! t0_kref+0x1a5c:   	fmuld	%f30, %f24, %f24
	.word	0xd40e201b	! t0_kref+0x1a60:   	ldub	[%i0 + 0x1b], %o2
	.word	0xd008a02e	! t0_kref+0x1a64:   	ldub	[%g2 + 0x2e], %o0
	.word	0xd448a00d	! t0_kref+0x1a68:   	ldsb	[%g2 + 0xd], %o2
	.word	0xbfa6c9bb	! t0_kref+0x1a6c:   	fdivs	%f27, %f27, %f31
	.word	0xd6100019	! t0_kref+0x1a70:   	lduh	[%g0 + %i1], %o3
	.word	0xd28e9040	! t0_kref+0x1a74:   	lduba	[%i2]0x82, %o1
	.word	0xa9b7051e	! t0_kref+0x1a78:   	fcmpgt16	%f28, %f30, %l4
	.word	0x96db6657	! t0_kref+0x1a7c:   	smulcc	%o5, 0x657, %o3
	.word	0xee063ffc	! t0_kref+0x1a80:   	ld	[%i0 - 4], %l7
	.word	0xd440a028	! t0_kref+0x1a84:   	ldsw	[%g2 + 0x28], %o2
	.word	0xaa83400d	! t0_kref+0x1a88:   	addcc	%o5, %o5, %l5
	.word	0x8d83400d	! t0_kref+0x1a8c:   	wr	%o5, %o5, %fprs
	.word	0xafb3416d	! t0_kref+0x1a90:   	edge32ln	%o5, %o5, %l7
	.word	0xf7070019	! t0_kref+0x1a94:   	ld	[%i4 + %i1], %f27
	.word	0xb3a609ba	! t0_kref+0x1a98:   	fdivs	%f24, %f26, %f25
	.word	0x93b3404d	! t0_kref+0x1a9c:   	edge8l	%o5, %o5, %o1
	.word	0x001fffff	! t0_kref+0x1aa0:   	illtrap	0x1fffff
	.word	0xbdb64ea0	! t0_kref+0x1aa4:   	fsrc1s	%f25, %f30
	.word	0x93408000	! t0_kref+0x1aa8:   	mov	%ccr, %o1
	.word	0xea4e8019	! t0_kref+0x1aac:   	ldsb	[%i2 + %i1], %l5
	.word	0xd050a018	! t0_kref+0x1ab0:   	ldsh	[%g2 + 0x18], %o0
	.word	0x3b800001	! t0_kref+0x1ab4:   	fble,a	_kref+0x1ab8
	.word	0x960b400d	! t0_kref+0x1ab8:   	and	%o5, %o5, %o3
	.word	0xee08a02f	! t0_kref+0x1abc:   	ldub	[%g2 + 0x2f], %l7
	.word	0xff00a014	! t0_kref+0x1ac0:   	ld	[%g2 + 0x14], %f31
	.word	0xee480018	! t0_kref+0x1ac4:   	ldsb	[%g0 + %i0], %l7
	.word	0xb9a0053f	! t0_kref+0x1ac8:   	fsqrts	%f31, %f28
	.word	0xec080018	! t0_kref+0x1acc:   	ldub	[%g0 + %i0], %l6
	.word	0xd450a032	! t0_kref+0x1ad0:   	ldsh	[%g2 + 0x32], %o2
	.word	0x33800001	! t0_kref+0x1ad4:   	fbe,a	_kref+0x1ad8
	.word	0xea562016	! t0_kref+0x1ad8:   	ldsh	[%i0 + 0x16], %l5
	.word	0xa8fb400d	! t0_kref+0x1adc:   	sdivcc	%o5, %o5, %l4
	.word	0xb9a689be	! t0_kref+0x1ae0:   	fdivs	%f26, %f30, %f28
	.word	0xb5b00f3c	! t0_kref+0x1ae4:   	fsrc2s	%f28, %f26
	.word	0xb5b74c79	! t0_kref+0x1ae8:   	fnors	%f29, %f25, %f26
	.word	0xe8080019	! t0_kref+0x1aec:   	ldub	[%g0 + %i1], %l4
	.word	0x95418000	! t0_kref+0x1af0:   	mov	%fprs, %o2
	.word	0xaf70000d	! t0_kref+0x1af4:   	popc	%o5, %l7
	.word	0xe606401c	! t0_kref+0x1af8:   	ld	[%i1 + %i4], %l3
	.word	0xf91e2010	! t0_kref+0x1afc:   	ldd	[%i0 + 0x10], %f28
	.word	0xbfb70cbb	! t0_kref+0x1b00:   	fandnot2s	%f28, %f27, %f31
	.word	0xb6102006	! t0_kref+0x1b04:   	mov	0x6, %i3
	.word	0xee56200a	! t0_kref+0x1b08:   	ldsh	[%i0 + 0xa], %l7
	.word	0xda28a019	! t0_kref+0x1b0c:   	stb	%o5, [%g2 + 0x19]
	.word	0xd4070019	! t0_kref+0x1b10:   	ld	[%i4 + %i1], %o2
	.word	0xb9b64979	! t0_kref+0x1b14:   	fpmerge	%f25, %f25, %f28
	.word	0x3f480004	! t0_kref+0x1b18:   	fbo,a,pt	%fcc0, _kref+0x1b28
	.word	0xbbb64fba	! t0_kref+0x1b1c:   	fors	%f25, %f26, %f29
	.word	0x965b400d	! t0_kref+0x1b20:   	smul	%o5, %o5, %o3
	.word	0xfb070019	! t0_kref+0x1b24:   	ld	[%i4 + %i1], %f29
	.word	0xb1b6cea0	! t0_kref+0x1b28:   	fsrc1s	%f27, %f24
	.word	0x81af8ada	! t0_kref+0x1b2c:   	fcmped	%fcc0, %f30, %f26
	.word	0xee06401c	! t0_kref+0x1b30:   	ld	[%i1 + %i4], %l7
	.word	0xb1b6497a	! t0_kref+0x1b34:   	fpmerge	%f25, %f26, %f24
	.word	0xda28a017	! t0_kref+0x1b38:   	stb	%o5, [%g2 + 0x17]
	.word	0xf300a038	! t0_kref+0x1b3c:   	ld	[%g2 + 0x38], %f25
	.word	0x91b3408d	! t0_kref+0x1b40:   	edge16	%o5, %o5, %o0
	.word	0xd04e3fea	! t0_kref+0x1b44:   	ldsb	[%i0 - 0x16], %o0
	.word	0xadb3410d	! t0_kref+0x1b48:   	edge32	%o5, %o5, %l6
	.word	0xd40e4000	! t0_kref+0x1b4c:   	ldub	[%i1], %o2
	.word	0xd010a01c	! t0_kref+0x1b50:   	lduh	[%g2 + 0x1c], %o0
	.word	0xda30a024	! t0_kref+0x1b54:   	sth	%o5, [%g2 + 0x24]
	.word	0xe84e3fff	! t0_kref+0x1b58:   	ldsb	[%i0 - 1], %l4
	.word	0xd010a02e	! t0_kref+0x1b5c:   	lduh	[%g2 + 0x2e], %o0
	.word	0xb9a0053c	! t0_kref+0x1b60:   	fsqrts	%f28, %f28
	.word	0xb1a7c9bf	! t0_kref+0x1b64:   	fdivs	%f31, %f31, %f24
	.word	0x97400000	! t0_kref+0x1b68:   	mov	%y, %o3
	.word	0xea4e3fef	! t0_kref+0x1b6c:   	ldsb	[%i0 - 0x11], %l5
	.word	0xb9a749be	! t0_kref+0x1b70:   	fdivs	%f29, %f30, %f28
	.word	0xb9b009bd	! t0_kref+0x1b74:   	fexpand	%f29, %f28
	.word	0xa7b60418	! t0_kref+0x1b78:   	fcmple16	%f24, %f24, %l3
	.word	0xf3067ff4	! t0_kref+0x1b7c:   	ld	[%i1 - 0xc], %f25
	.word	0x9093400d	! t0_kref+0x1b80:   	orcc	%o5, %o5, %o0
	.word	0xee40a030	! t0_kref+0x1b84:   	ldsw	[%g2 + 0x30], %l7
	.word	0xb1b78e5a	! t0_kref+0x1b88:   	fxnor	%f30, %f26, %f24
	.word	0x97b7041e	! t0_kref+0x1b8c:   	fcmple16	%f28, %f30, %o3
	.word	0xd60e3ffa	! t0_kref+0x1b90:   	ldub	[%i0 - 6], %o3
	.word	0xd600a038	! t0_kref+0x1b94:   	ld	[%g2 + 0x38], %o3
	.word	0xda20a014	! t0_kref+0x1b98:   	st	%o5, [%g2 + 0x14]
	.word	0xb7a0189d	! t0_kref+0x1b9c:   	fitos	%f29, %f27
	.word	0x3d800006	! t0_kref+0x1ba0:   	fbule,a	_kref+0x1bb8
	.word	0xd006401c	! t0_kref+0x1ba4:   	ld	[%i1 + %i4], %o0
	.word	0xee48a017	! t0_kref+0x1ba8:   	ldsb	[%g2 + 0x17], %l7
	.word	0x94db6e7d	! t0_kref+0x1bac:   	smulcc	%o5, 0xe7d, %o2
	.word	0xb5b706f8	! t0_kref+0x1bb0:   	fmul8ulx16	%f28, %f24, %f26
	.word	0xb5a01a58	! t0_kref+0x1bb4:   	fdtoi	%f24, %f26
	.word	0xb1b7497c	! t0_kref+0x1bb8:   	fpmerge	%f29, %f28, %f24
	.word	0xfd1e6008	! t0_kref+0x1bbc:   	ldd	[%i1 + 8], %f30
	.word	0xea4e3ff1	! t0_kref+0x1bc0:   	ldsb	[%i0 - 0xf], %l5
	.word	0xa9b3404d	! t0_kref+0x1bc4:   	edge8l	%o5, %o5, %l4
	.word	0xfd180018	! t0_kref+0x1bc8:   	ldd	[%g0 + %i0], %f30
	.word	0xbdb78edc	! t0_kref+0x1bcc:   	fornot2	%f30, %f28, %f30
	.word	0xafb68598	! t0_kref+0x1bd0:   	fcmpgt32	%f26, %f24, %l7
	.word	0xec167ff0	! t0_kref+0x1bd4:   	lduh	[%i1 - 0x10], %l6
	.word	0xda28a00c	! t0_kref+0x1bd8:   	stb	%o5, [%g2 + 0xc]
	.word	0xfd20a00c	! t0_kref+0x1bdc:   	st	%f30, [%g2 + 0xc]
	.word	0xb9b64e78	! t0_kref+0x1be0:   	fxnors	%f25, %f24, %f28
	.word	0xf91e3fe0	! t0_kref+0x1be4:   	ldd	[%i0 - 0x20], %f28
	.word	0x81ae8ad8	! t0_kref+0x1be8:   	fcmped	%fcc0, %f26, %f24
	.word	0x92bb7cdc	! t0_kref+0x1bec:   	xnorcc	%o5, -0x324, %o1
	.word	0x94ab61e9	! t0_kref+0x1bf0:   	andncc	%o5, 0x1e9, %o2
	.word	0xb5a00558	! t0_kref+0x1bf4:   	fsqrtd	%f24, %f26
	.word	0xf120a01c	! t0_kref+0x1bf8:   	st	%f24, [%g2 + 0x1c]
	.word	0xd8180019	! t0_kref+0x1bfc:   	ldd	[%g0 + %i1], %o4
	.word	0xda30a022	! t0_kref+0x1c00:   	sth	%o5, [%g2 + 0x22]
	.word	0x92d3400d	! t0_kref+0x1c04:   	umulcc	%o5, %o5, %o1
	.word	0xec40a00c	! t0_kref+0x1c08:   	ldsw	[%g2 + 0xc], %l6
	.word	0xda262000	! t0_kref+0x1c0c:   	st	%o5, [%i0]
	.word	0xae83400d	! t0_kref+0x1c10:   	addcc	%o5, %o5, %l7
	.word	0xd640a03c	! t0_kref+0x1c14:   	ldsw	[%g2 + 0x3c], %o3
	.word	0xda20a020	! t0_kref+0x1c18:   	st	%o5, [%g2 + 0x20]
	.word	0xb9b68918	! t0_kref+0x1c1c:   	faligndata	%f26, %f24, %f28
	.word	0xbfb0077e	! t0_kref+0x1c20:   	fpack16	%f30, %f31
	.word	0x001fffff	! t0_kref+0x1c24:   	illtrap	0x1fffff
	.word	0xd64e7ffc	! t0_kref+0x1c28:   	ldsb	[%i1 - 4], %o3
	.word	0xb5a000ba	! t0_kref+0x1c2c:   	fnegs	%f26, %f26
	.word	0x9483400d	! t0_kref+0x1c30:   	addcc	%o5, %o5, %o2
	.word	0xe856401b	! t0_kref+0x1c34:   	ldsh	[%i1 + %i3], %l4
	.word	0xf520a034	! t0_kref+0x1c38:   	st	%f26, [%g2 + 0x34]
	.word	0xda30a010	! t0_kref+0x1c3c:   	sth	%o5, [%g2 + 0x10]
	.word	0xb5b6099c	! t0_kref+0x1c40:   	bshuffle	%f24, %f28, %f26
	.word	0xe816201a	! t0_kref+0x1c44:   	lduh	[%i0 + 0x1a], %l4
	.word	0xe60e4000	! t0_kref+0x1c48:   	ldub	[%i1], %l3
	.word	0xd4067ff8	! t0_kref+0x1c4c:   	ld	[%i1 - 8], %o2
	.word	0xf700a028	! t0_kref+0x1c50:   	ld	[%g2 + 0x28], %f27
	.word	0xd010a00c	! t0_kref+0x1c54:   	lduh	[%g2 + 0xc], %o0
	.word	0xf9062010	! t0_kref+0x1c58:   	ld	[%i0 + 0x10], %f28
	.word	0xf19f1a18	! t0_kref+0x1c5c:   	ldda	[%i4 + %i0]0xd0, %f24
	.word	0xda763ff8	! t0_kref+0x1c60:   	stx	%o5, [%i0 - 8]
	.word	0xda30a024	! t0_kref+0x1c64:   	sth	%o5, [%g2 + 0x24]
	.word	0x31800008	! t0_kref+0x1c68:   	fba,a	_kref+0x1c88
	.word	0xd2564000	! t0_kref+0x1c6c:   	ldsh	[%i1], %o1
	.word	0xbdb7ce7c	! t0_kref+0x1c70:   	fxnors	%f31, %f28, %f30
	.word	0xaa7b6542	! t0_kref+0x1c74:   	sdiv	%o5, 0x542, %l5
	.word	0xf11fbec0	! t0_kref+0x1c78:   	ldd	[%fp - 0x140], %f24
	.word	0xd608a01a	! t0_kref+0x1c7c:   	ldub	[%g2 + 0x1a], %o3
	.word	0xbfa689be	! t0_kref+0x1c80:   	fdivs	%f26, %f30, %f31
	.word	0xf9be584d	! t0_kref+0x1c84:   	stda	%f28, [%i1 + %o5]0xc2
	.word	0xec560000	! t0_kref+0x1c88:   	ldsh	[%i0], %l6
	.word	0xda36201e	! t0_kref+0x1c8c:   	sth	%o5, [%i0 + 0x1e]
	.word	0xb9a0055a	! t0_kref+0x1c90:   	fsqrtd	%f26, %f28
	.word	0xda30a030	! t0_kref+0x1c94:   	sth	%o5, [%g2 + 0x30]
	.word	0xe616201a	! t0_kref+0x1c98:   	lduh	[%i0 + 0x1a], %l3
	.word	0xe6163fee	! t0_kref+0x1c9c:   	lduh	[%i0 - 0x12], %l3
	.word	0xb9a0055e	! t0_kref+0x1ca0:   	fsqrtd	%f30, %f28
	.word	0xbfb6cd60	! t0_kref+0x1ca4:   	fnot1s	%f27, %f31
	.word	0x912b400d	! t0_kref+0x1ca8:   	sll	%o5, %o5, %o0
	.word	0xea0e6000	! t0_kref+0x1cac:   	ldub	[%i1], %l5
	.word	0xb9a649b8	! t0_kref+0x1cb0:   	fdivs	%f25, %f24, %f28
	.word	0xb5a00039	! t0_kref+0x1cb4:   	fmovs	%f25, %f26
	.word	0xb9b70fb8	! t0_kref+0x1cb8:   	fors	%f28, %f24, %f28
	.word	0xd4067fe8	! t0_kref+0x1cbc:   	ld	[%i1 - 0x18], %o2
	.word	0xb1b6899a	! t0_kref+0x1cc0:   	bshuffle	%f26, %f26, %f24
	.word	0xf100a038	! t0_kref+0x1cc4:   	ld	[%g2 + 0x38], %f24
	.word	0xe650a018	! t0_kref+0x1cc8:   	ldsh	[%g2 + 0x18], %l3
	.word	0xf920a038	! t0_kref+0x1ccc:   	st	%f28, [%g2 + 0x38]
	.word	0xb5a0193d	! t0_kref+0x1cd0:   	fstod	%f29, %f26
	.word	0xf11e6018	! t0_kref+0x1cd4:   	ldd	[%i1 + 0x18], %f24
	.word	0xb7a609ba	! t0_kref+0x1cd8:   	fdivs	%f24, %f26, %f27
	.word	0xae23400d	! t0_kref+0x1cdc:   	sub	%o5, %o5, %l7
	.word	0xafb3410d	! t0_kref+0x1ce0:   	edge32	%o5, %o5, %l7
	.word	0x91b3404d	! t0_kref+0x1ce4:   	edge8l	%o5, %o5, %o0
	.word	0xe968a083	! t0_kref+0x1ce8:   	prefetch	%g2 + 0x83, 20
	.word	0xb7a000b8	! t0_kref+0x1cec:   	fnegs	%f24, %f27
	.word	0xec070019	! t0_kref+0x1cf0:   	ld	[%i4 + %i1], %l6
	.word	0x86102020	! t0_kref+0x1cf4:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0x1cf8:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x1cfc:   	be,a	_kref+0x1d6c
	.word	0xf920a028	! t0_kref+0x1d00:   	st	%f28, [%g2 + 0x28]
	.word	0xf9180018	! t0_kref+0x1d04:   	ldd	[%g0 + %i0], %f28
	.word	0xf36e6018	! t0_kref+0x1d08:   	prefetch	%i1 + 0x18, 25
	.word	0x36800007	! t0_kref+0x1d0c:   	bge,a	_kref+0x1d28
	.word	0xd0180018	! t0_kref+0x1d10:   	ldd	[%g0 + %i0], %o0
	.word	0x905b6cf1	! t0_kref+0x1d14:   	smul	%o5, 0xcf1, %o0
	.word	0xea16c018	! t0_kref+0x1d18:   	lduh	[%i3 + %i0], %l5
	.word	0xbdb6099a	! t0_kref+0x1d1c:   	bshuffle	%f24, %f26, %f30
	.word	0xda28a01b	! t0_kref+0x1d20:   	stb	%o5, [%g2 + 0x1b]
	.word	0xe840a024	! t0_kref+0x1d24:   	ldsw	[%g2 + 0x24], %l4
	.word	0xbba6c9b8	! t0_kref+0x1d28:   	fdivs	%f27, %f24, %f29
	.word	0xbdb70dda	! t0_kref+0x1d2c:   	fnand	%f28, %f26, %f30
	.word	0xda20a030	! t0_kref+0x1d30:   	st	%o5, [%g2 + 0x30]
	.word	0x3a800001	! t0_kref+0x1d34:   	bcc,a	_kref+0x1d38
	.word	0xe6564000	! t0_kref+0x1d38:   	ldsh	[%i1], %l3
	.word	0xb3b74c7e	! t0_kref+0x1d3c:   	fnors	%f29, %f30, %f25
	.word	0xee00a034	! t0_kref+0x1d40:   	ld	[%g2 + 0x34], %l7
	.word	0xe608a03c	! t0_kref+0x1d44:   	ldub	[%g2 + 0x3c], %l3
	.word	0xe608a011	! t0_kref+0x1d48:   	ldub	[%g2 + 0x11], %l3
	.word	0xee4e3fe5	! t0_kref+0x1d4c:   	ldsb	[%i0 - 0x1b], %l7
	.word	0x90b3400d	! t0_kref+0x1d50:   	orncc	%o5, %o5, %o0
	.word	0xd40e6005	! t0_kref+0x1d54:   	ldub	[%i1 + 5], %o2
	.word	0xe80e7ffc	! t0_kref+0x1d58:   	ldub	[%i1 - 4], %l4
	.word	0x85837549	! t0_kref+0x1d5c:   	wr	%o5, 0xfffff549, %ccr
	.word	0x97b3432d	! t0_kref+0x1d60:   	bmask	%o5, %o5, %o3
	.word	0xf300a00c	! t0_kref+0x1d64:   	ld	[%g2 + 0xc], %f25
	.word	0x92b37dca	! t0_kref+0x1d68:   	orncc	%o5, -0x236, %o1
	.word	0xb3a6c9bd	! t0_kref+0x1d6c:   	fdivs	%f27, %f29, %f25
	.word	0x905b60de	! t0_kref+0x1d70:   	smul	%o5, 0xde, %o0
	.word	0xd4563ff8	! t0_kref+0x1d74:   	ldsh	[%i0 - 8], %o2
	.word	0xea56001b	! t0_kref+0x1d78:   	ldsh	[%i0 + %i3], %l5
	.word	0x86102005	! t0_kref+0x1d7c:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x1d80:   	subcc	%g3, 1, %g3
	.word	0x2280000c	! t0_kref+0x1d84:   	be,a	_kref+0x1db4
	.word	0xbdb74d39	! t0_kref+0x1d88:   	fandnot1s	%f29, %f25, %f30
	.word	0xbdb00f1c	! t0_kref+0x1d8c:   	fsrc2	%f28, %f30
	.word	0xb9a6c9bd	! t0_kref+0x1d90:   	fdivs	%f27, %f29, %f28
	.word	0xb5a689bb	! t0_kref+0x1d94:   	fdivs	%f26, %f27, %f26
	.word	0x9623400d	! t0_kref+0x1d98:   	sub	%o5, %o5, %o3
	.word	0x8d837a0c	! t0_kref+0x1d9c:   	wr	%o5, 0xfffffa0c, %fprs
	.word	0x93b3404d	! t0_kref+0x1da0:   	edge8l	%o5, %o5, %o1
	.word	0xbdb68adc	! t0_kref+0x1da4:   	fpsub32	%f26, %f28, %f30
	.word	0x96b3400d	! t0_kref+0x1da8:   	orncc	%o5, %o5, %o3
	.word	0xd0164000	! t0_kref+0x1dac:   	lduh	[%i1], %o0
	.word	0xb5b607d8	! t0_kref+0x1db0:   	pdist	%f24, %f24, %f26
	.word	0xb1b78d9e	! t0_kref+0x1db4:   	fxor	%f30, %f30, %f24
	.word	0xb1a0055c	! t0_kref+0x1db8:   	fsqrtd	%f28, %f24
	.word	0xbda0191b	! t0_kref+0x1dbc:   	fitod	%f27, %f30
	.word	0xec070019	! t0_kref+0x1dc0:   	ld	[%i4 + %i1], %l6
	.word	0xf1be188d	! t0_kref+0x1dc4:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0x97b3432d	! t0_kref+0x1dc8:   	bmask	%o5, %o5, %o3
	.word	0xbfb00f3b	! t0_kref+0x1dcc:   	fsrc2s	%f27, %f31
	.word	0xf920a000	! t0_kref+0x1dd0:   	st	%f28, [%g2]
	.word	0xb5b70f5c	! t0_kref+0x1dd4:   	fornot1	%f28, %f28, %f26
	.word	0xb7a709bd	! t0_kref+0x1dd8:   	fdivs	%f28, %f29, %f27
	.word	0xfd1e3ff8	! t0_kref+0x1ddc:   	ldd	[%i0 - 8], %f30
	.word	0xa9b3404d	! t0_kref+0x1de0:   	edge8l	%o5, %o5, %l4
	.word	0x9de3bfa0	! t0_kref+0x1de4:   	save	%sp, -0x60, %sp
	.word	0xb8e6e9e6	! t0_kref+0x1de8:   	subccc	%i3, 0x9e6, %i4
	.word	0xa9ef4019	! t0_kref+0x1dec:   	restore	%i5, %i1, %l4
	.word	0xec062004	! t0_kref+0x1df0:   	ld	[%i0 + 4], %l6
	.word	0xb5a0055a	! t0_kref+0x1df4:   	fsqrtd	%f26, %f26
	.word	0xb9b686fa	! t0_kref+0x1df8:   	fmul8ulx16	%f26, %f26, %f28
	.word	0x931b400d	! t0_kref+0x1dfc:   	tsubcctv	%o5, %o5, %o1
	.word	0xe650a00c	! t0_kref+0x1e00:   	ldsh	[%g2 + 0xc], %l3
	.word	0xb5a688da	! t0_kref+0x1e04:   	fsubd	%f26, %f26, %f26
	.word	0xae03400d	! t0_kref+0x1e08:   	add	%o5, %o5, %l7
	.word	0xda760000	! t0_kref+0x1e0c:   	stx	%o5, [%i0]
	.word	0x35800004	! t0_kref+0x1e10:   	fbue,a	_kref+0x1e20
	.word	0xb5b60c5c	! t0_kref+0x1e14:   	fnor	%f24, %f28, %f26
	.word	0xe80e600e	! t0_kref+0x1e18:   	ldub	[%i1 + 0xe], %l4
	.word	0xd410a034	! t0_kref+0x1e1c:   	lduh	[%g2 + 0x34], %o2
	.word	0x9fc00004	! t0_kref+0x1e20:   	call	%g0 + %g4
	.word	0xea16201e	! t0_kref+0x1e24:   	lduh	[%i0 + 0x1e], %l5
	.word	0xb3a689b9	! t0_kref+0x1e28:   	fdivs	%f26, %f25, %f25
	.word	0xb9a0055c	! t0_kref+0x1e2c:   	fsqrtd	%f28, %f28
	.word	0xb1b6cdb8	! t0_kref+0x1e30:   	fxors	%f27, %f24, %f24
	.word	0xb1b7091a	! t0_kref+0x1e34:   	faligndata	%f28, %f26, %f24
	.word	0xd248a03d	! t0_kref+0x1e38:   	ldsb	[%g2 + 0x3d], %o1
	.word	0xd7e6100d	! t0_kref+0x1e3c:   	casa	[%i0]0x80, %o5, %o3
	.word	0x9de3bfa0	! t0_kref+0x1e40:   	save	%sp, -0x60, %sp
	.word	0xafef353e	! t0_kref+0x1e44:   	restore	%i4, -0xac2, %l7
	.word	0xec0e201c	! t0_kref+0x1e48:   	ldub	[%i0 + 0x1c], %l6
	.word	0xa944c000	! t0_kref+0x1e4c:   	mov	%gsr, %l4
	.word	0xa7b6051e	! t0_kref+0x1e50:   	fcmpgt16	%f24, %f30, %l3
	.word	0xda20a008	! t0_kref+0x1e54:   	st	%o5, [%g2 + 8]
	.word	0xeff6100d	! t0_kref+0x1e58:   	casxa	[%i0]0x80, %o5, %l7
	.word	0xda20a03c	! t0_kref+0x1e5c:   	st	%o5, [%g2 + 0x3c]
	.word	0xd4563ff4	! t0_kref+0x1e60:   	ldsh	[%i0 - 0xc], %o2
	.word	0xea50a002	! t0_kref+0x1e64:   	ldsh	[%g2 + 2], %l5
	.word	0x81ae8a3b	! t0_kref+0x1e68:   	fcmps	%fcc0, %f26, %f27
	.word	0xda28a022	! t0_kref+0x1e6c:   	stb	%o5, [%g2 + 0x22]
	.word	0xe8566000	! t0_kref+0x1e70:   	ldsh	[%i1], %l4
	.word	0xb1b606fe	! t0_kref+0x1e74:   	fmul8ulx16	%f24, %f30, %f24
	.word	0xa883400d	! t0_kref+0x1e78:   	addcc	%o5, %o5, %l4
	.word	0xb9a789b9	! t0_kref+0x1e7c:   	fdivs	%f30, %f25, %f28
	.word	0xbdb60f5e	! t0_kref+0x1e80:   	fornot1	%f24, %f30, %f30
	.word	0xf1be580d	! t0_kref+0x1e84:   	stda	%f24, [%i1 + %o5]0xc0
	.word	0xd81e4000	! t0_kref+0x1e88:   	ldd	[%i1], %o4
	.word	0xd40e2011	! t0_kref+0x1e8c:   	ldub	[%i0 + 0x11], %o2
	.word	0xb3a01a5c	! t0_kref+0x1e90:   	fdtoi	%f28, %f25
	.word	0xea066008	! t0_kref+0x1e94:   	ld	[%i1 + 8], %l5
	.word	0xb5a749bb	! t0_kref+0x1e98:   	fdivs	%f29, %f27, %f26
	.word	0xd4080018	! t0_kref+0x1e9c:   	ldub	[%g0 + %i0], %o2
	.word	0xb5b6099e	! t0_kref+0x1ea0:   	bshuffle	%f24, %f30, %f26
	.word	0xd640a010	! t0_kref+0x1ea4:   	ldsw	[%g2 + 0x10], %o3
	.word	0xea480019	! t0_kref+0x1ea8:   	ldsb	[%g0 + %i1], %l5
	.word	0xb5b68e39	! t0_kref+0x1eac:   	fands	%f26, %f25, %f26
	.word	0xd256200c	! t0_kref+0x1eb0:   	ldsh	[%i0 + 0xc], %o1
	.word	0x81af8ade	! t0_kref+0x1eb4:   	fcmped	%fcc0, %f30, %f30
	.word	0xf700a004	! t0_kref+0x1eb8:   	ld	[%g2 + 4], %f27
	.word	0x8143c000	! t0_kref+0x1ebc:   	stbar
	.word	0xb1a749bb	! t0_kref+0x1ec0:   	fdivs	%f29, %f27, %f24
	.word	0xb9b60a7a	! t0_kref+0x1ec4:   	fpadd32s	%f24, %f26, %f28
	.word	0xec10a01c	! t0_kref+0x1ec8:   	lduh	[%g2 + 0x1c], %l6
	.word	0xd400a024	! t0_kref+0x1ecc:   	ld	[%g2 + 0x24], %o2
	.word	0xbdb7c73f	! t0_kref+0x1ed0:   	fmuld8ulx16	%f31, %f31, %f30
	.word	0xd40e200f	! t0_kref+0x1ed4:   	ldub	[%i0 + 0xf], %o2
	.word	0xb1b007ba	! t0_kref+0x1ed8:   	fpackfix	%f26, %f24
	.word	0xda28a002	! t0_kref+0x1edc:   	stb	%o5, [%g2 + 2]
	.word	0xd616401b	! t0_kref+0x1ee0:   	lduh	[%i1 + %i3], %o3
	.word	0xd2060000	! t0_kref+0x1ee4:   	ld	[%i0], %o1
	.word	0xb5b7071f	! t0_kref+0x1ee8:   	fmuld8sux16	%f28, %f31, %f26
	.word	0xb9a0055e	! t0_kref+0x1eec:   	fsqrtd	%f30, %f28
	.word	0xb5a01a3e	! t0_kref+0x1ef0:   	fstoi	%f30, %f26
	.word	0xd04e6015	! t0_kref+0x1ef4:   	ldsb	[%i1 + 0x15], %o0
	.word	0xd44e8019	! t0_kref+0x1ef8:   	ldsb	[%i2 + %i1], %o2
	.word	0xb9a0055a	! t0_kref+0x1efc:   	fsqrtd	%f26, %f28
	.word	0xd64e7ffa	! t0_kref+0x1f00:   	ldsb	[%i1 - 6], %o3
	.word	0x9083400d	! t0_kref+0x1f04:   	addcc	%o5, %o5, %o0
	.word	0xabb34240	! t0_kref+0x1f08:   	array16	%o5, %g0, %l5
	.word	0xa7837e5f	! t0_kref+0x1f0c:   	wr	%o5, 0xfffffe5f, %gsr
	.word	0xb5a0053c	! t0_kref+0x1f10:   	fsqrts	%f28, %f26
	.word	0xbda0053a	! t0_kref+0x1f14:   	fsqrts	%f26, %f30
	.word	0xbfb6ca7a	! t0_kref+0x1f18:   	fpadd32s	%f27, %f26, %f31
	.word	0xa7b340cd	! t0_kref+0x1f1c:   	edge16l	%o5, %o5, %l3
	.word	0xf91e001d	! t0_kref+0x1f20:   	ldd	[%i0 + %i5], %f28
	.word	0xb6103fec	! t0_kref+0x1f24:   	mov	0xffffffec, %i3
	.word	0xf900a034	! t0_kref+0x1f28:   	ld	[%g2 + 0x34], %f28
	.word	0xea062010	! t0_kref+0x1f2c:   	ld	[%i0 + 0x10], %l5
	.word	0xee167ff2	! t0_kref+0x1f30:   	lduh	[%i1 - 0xe], %l7
	.word	0xb5b6099a	! t0_kref+0x1f34:   	bshuffle	%f24, %f26, %f26
	.word	0x2a800003	! t0_kref+0x1f38:   	bcs,a	_kref+0x1f44
	.word	0xbdb6091e	! t0_kref+0x1f3c:   	faligndata	%f24, %f30, %f30
	.word	0xb5b60a7c	! t0_kref+0x1f40:   	fpadd32s	%f24, %f28, %f26
	.word	0xda20a038	! t0_kref+0x1f44:   	st	%o5, [%g2 + 0x38]
	.word	0xe606401c	! t0_kref+0x1f48:   	ld	[%i1 + %i4], %l3
	.word	0xe81e3ff0	! t0_kref+0x1f4c:   	ldd	[%i0 - 0x10], %l4
	.word	0x9364800d	! t0_kref+0x1f50:   	movle	%icc, %o5, %o1
	.word	0x91336009	! t0_kref+0x1f54:   	srl	%o5, 0x9, %o0
	.word	0x81ae0adc	! t0_kref+0x1f58:   	fcmped	%fcc0, %f24, %f28
	.word	0xdaa65000	! t0_kref+0x1f5c:   	sta	%o5, [%i1]0x80
	.word	0xf56e6018	! t0_kref+0x1f60:   	prefetch	%i1 + 0x18, 26
	.word	0xda30a036	! t0_kref+0x1f64:   	sth	%o5, [%g2 + 0x36]
	.word	0x36800003	! t0_kref+0x1f68:   	bge,a	_kref+0x1f74
	.word	0xaac3400d	! t0_kref+0x1f6c:   	addccc	%o5, %o5, %l5
	.word	0xa9b6045a	! t0_kref+0x1f70:   	fcmpne16	%f24, %f26, %l4
	.word	0xa7b6855e	! t0_kref+0x1f74:   	fcmpeq16	%f26, %f30, %l3
	.word	0xd416c018	! t0_kref+0x1f78:   	lduh	[%i3 + %i0], %o2
	.word	0xfb20a014	! t0_kref+0x1f7c:   	st	%f29, [%g2 + 0x14]
	.word	0xf91fbf90	! t0_kref+0x1f80:   	ldd	[%fp - 0x70], %f28
	.word	0xdaf61000	! t0_kref+0x1f84:   	stxa	%o5, [%i0]0x80
	.word	0xd608a02f	! t0_kref+0x1f88:   	ldub	[%g2 + 0x2f], %o3
	.word	0xb1a018dc	! t0_kref+0x1f8c:   	fdtos	%f28, %f24
	.word	0xa6db400d	! t0_kref+0x1f90:   	smulcc	%o5, %o5, %l3
	.word	0xb7a0053a	! t0_kref+0x1f94:   	fsqrts	%f26, %f27
	.word	0xea40a014	! t0_kref+0x1f98:   	ldsw	[%g2 + 0x14], %l5
	.word	0x3e800007	! t0_kref+0x1f9c:   	bvc,a	_kref+0x1fb8
	.word	0xb7a789b9	! t0_kref+0x1fa0:   	fdivs	%f30, %f25, %f27
	.word	0xe600a024	! t0_kref+0x1fa4:   	ld	[%g2 + 0x24], %l3
	.word	0x81dbbae6	! t0_kref+0x1fa8:   	flush	%sp - 0x51a
	.word	0xda367fea	! t0_kref+0x1fac:   	sth	%o5, [%i1 - 0x16]
	.word	0xb3a0053e	! t0_kref+0x1fb0:   	fsqrts	%f30, %f25
	.word	0xb1b7891e	! t0_kref+0x1fb4:   	faligndata	%f30, %f30, %f24
	.word	0xd048a025	! t0_kref+0x1fb8:   	ldsb	[%g2 + 0x25], %o0
	.word	0xb5a749be	! t0_kref+0x1fbc:   	fdivs	%f29, %f30, %f26
	.word	0x972b400d	! t0_kref+0x1fc0:   	sll	%o5, %o5, %o3
	.word	0xda30a016	! t0_kref+0x1fc4:   	sth	%o5, [%g2 + 0x16]
	.word	0xb1a0055a	! t0_kref+0x1fc8:   	fsqrtd	%f26, %f24
	.word	0xb7a01a3a	! t0_kref+0x1fcc:   	fstoi	%f26, %f27
	.word	0xabb7051c	! t0_kref+0x1fd0:   	fcmpgt16	%f28, %f28, %l5
	.word	0xbdb009b9	! t0_kref+0x1fd4:   	fexpand	%f25, %f30
	.word	0xb9b00778	! t0_kref+0x1fd8:   	fpack16	%f24, %f28
	.word	0xee08a013	! t0_kref+0x1fdc:   	ldub	[%g2 + 0x13], %l7
	.word	0xbfb7cdfd	! t0_kref+0x1fe0:   	fnands	%f31, %f29, %f31
	.word	0x94e3400d	! t0_kref+0x1fe4:   	subccc	%o5, %o5, %o2
	.word	0x8143c000	! t0_kref+0x1fe8:   	stbar
	.word	0x907b400d	! t0_kref+0x1fec:   	sdiv	%o5, %o5, %o0
	.word	0xff06401c	! t0_kref+0x1ff0:   	ld	[%i1 + %i4], %f31
	.word	0xb9a0111e	! t0_kref+0x1ff4:   	fxtod	%f30, %f28
	.word	0xbfa000be	! t0_kref+0x1ff8:   	fnegs	%f30, %f31
	.word	0xa6936ed8	! t0_kref+0x1ffc:   	orcc	%o5, 0xed8, %l3
	.word	0xd64e6005	! t0_kref+0x2000:   	ldsb	[%i1 + 5], %o3
	.word	0xda28a010	! t0_kref+0x2004:   	stb	%o5, [%g2 + 0x10]
	.word	0xbfa7c9b8	! t0_kref+0x2008:   	fdivs	%f31, %f24, %f31
	.word	0xafb3434d	! t0_kref+0x200c:   	alignaddrl	%o5, %o5, %l7
	.word	0xabb7859e	! t0_kref+0x2010:   	fcmpgt32	%f30, %f30, %l5
	.word	0xf520a038	! t0_kref+0x2014:   	st	%f26, [%g2 + 0x38]
	.word	0xbda7c9bd	! t0_kref+0x2018:   	fdivs	%f31, %f29, %f30
	.word	0xf100a030	! t0_kref+0x201c:   	ld	[%g2 + 0x30], %f24
	.word	0xae23400d	! t0_kref+0x2020:   	sub	%o5, %o5, %l7
	.word	0xb5b00fc0	! t0_kref+0x2024:   	fone	%f26
	.word	0xbfa0053f	! t0_kref+0x2028:   	fsqrts	%f31, %f31
	.word	0xe5ee101a	! t0_kref+0x202c:   	prefetcha	%i0 + %i2, 18
	.word	0xf9be584d	! t0_kref+0x2030:   	stda	%f28, [%i1 + %o5]0xc2
	.word	0x960b400d	! t0_kref+0x2034:   	and	%o5, %o5, %o3
	.word	0xb7a6c9bd	! t0_kref+0x2038:   	fdivs	%f27, %f29, %f27
	.word	0xa9b3408d	! t0_kref+0x203c:   	edge16	%o5, %o5, %l4
	.word	0xb5b70ade	! t0_kref+0x2040:   	fpsub32	%f28, %f30, %f26
	.word	0xbba0053f	! t0_kref+0x2044:   	fsqrts	%f31, %f29
	.word	0xb5a7c8bb	! t0_kref+0x2048:   	fsubs	%f31, %f27, %f26
	.word	0xda360000	! t0_kref+0x204c:   	sth	%o5, [%i0]
	.word	0xf19e5a1b	! t0_kref+0x2050:   	ldda	[%i1 + %i3]0xd0, %f24
	.word	0xf11e401d	! t0_kref+0x2054:   	ldd	[%i1 + %i5], %f24
	.word	0xbfa749be	! t0_kref+0x2058:   	fdivs	%f29, %f30, %f31
	.word	0x9423400d	! t0_kref+0x205c:   	sub	%o5, %o5, %o2
	.word	0xda20a010	! t0_kref+0x2060:   	st	%o5, [%g2 + 0x10]
	.word	0xb1a609b9	! t0_kref+0x2064:   	fdivs	%f24, %f25, %f24
	.word	0xee4e7ff1	! t0_kref+0x2068:   	ldsb	[%i1 - 0xf], %l7
	.word	0xd616c019	! t0_kref+0x206c:   	lduh	[%i3 + %i1], %o3
	.word	0xf51f4019	! t0_kref+0x2070:   	ldd	[%i5 + %i1], %f26
	.word	0x9de3bfa0	! t0_kref+0x2074:   	save	%sp, -0x60, %sp
	.word	0xb8d62920	! t0_kref+0x2078:   	umulcc	%i0, 0x920, %i4
	.word	0x97ee2c3f	! t0_kref+0x207c:   	restore	%i0, 0xc3f, %o3
	.word	0xa92b400d	! t0_kref+0x2080:   	sll	%o5, %o5, %l4
	.word	0xd40e7ff2	! t0_kref+0x2084:   	ldub	[%i1 - 0xe], %o2
	.word	0xa7400000	! t0_kref+0x2088:   	mov	%y, %l3
	.word	0xf700a008	! t0_kref+0x208c:   	ld	[%g2 + 8], %f27
	.word	0xb3a0053d	! t0_kref+0x2090:   	fsqrts	%f29, %f25
	.word	0x96f3400d	! t0_kref+0x2094:   	udivcc	%o5, %o5, %o3
	.word	0xb1a0055e	! t0_kref+0x2098:   	fsqrtd	%f30, %f24
	.word	0xe600a00c	! t0_kref+0x209c:   	ld	[%g2 + 0xc], %l3
	.word	0xaaf3400d	! t0_kref+0x20a0:   	udivcc	%o5, %o5, %l5
	.word	0x9de3bfa0	! t0_kref+0x20a4:   	save	%sp, -0x60, %sp
	.word	0xb456001a	! t0_kref+0x20a8:   	umul	%i0, %i2, %i2
	.word	0x91e82e7e	! t0_kref+0x20ac:   	restore	%g0, 0xe7e, %o0
	.word	0xb5b68979	! t0_kref+0x20b0:   	fpmerge	%f26, %f25, %f26
	.word	0x9533400d	! t0_kref+0x20b4:   	srl	%o5, %o5, %o2
	.word	0xac1b62ab	! t0_kref+0x20b8:   	xor	%o5, 0x2ab, %l6
	.word	0x25800008	! t0_kref+0x20bc:   	fblg,a	_kref+0x20dc
	.word	0xab23400d	! t0_kref+0x20c0:   	mulscc	%o5, %o5, %l5
	.word	0xac1b76c1	! t0_kref+0x20c4:   	xor	%o5, -0x93f, %l6
	.word	0xee4e3fe7	! t0_kref+0x20c8:   	ldsb	[%i0 - 0x19], %l7
	.word	0xd648a015	! t0_kref+0x20cc:   	ldsb	[%g2 + 0x15], %o3
	.word	0xb7a749ba	! t0_kref+0x20d0:   	fdivs	%f29, %f26, %f27
	.word	0xb1b00fc0	! t0_kref+0x20d4:   	fone	%f24
	.word	0xa9b34240	! t0_kref+0x20d8:   	array16	%o5, %g0, %l4
	.word	0xfd00a00c	! t0_kref+0x20dc:   	ld	[%g2 + 0xc], %f30
	.word	0xb5b6c678	! t0_kref+0x20e0:   	fmul8x16au	%f27, %f24, %f26
	.word	0xaca37d94	! t0_kref+0x20e4:   	subcc	%o5, -0x26c, %l6
	.word	0xee50a03e	! t0_kref+0x20e8:   	ldsh	[%g2 + 0x3e], %l7
	.word	0xb9b7cfbd	! t0_kref+0x20ec:   	fors	%f31, %f29, %f28
	.word	0xec1e001d	! t0_kref+0x20f0:   	ldd	[%i0 + %i5], %l6
	.word	0xd24e2013	! t0_kref+0x20f4:   	ldsb	[%i0 + 0x13], %o1
	.word	0xaa83400d	! t0_kref+0x20f8:   	addcc	%o5, %o5, %l5
	.word	0xb1b60c9a	! t0_kref+0x20fc:   	fandnot2	%f24, %f26, %f24
	.word	0xaf400000	! t0_kref+0x2100:   	mov	%y, %l7
	.word	0xb5b78d40	! t0_kref+0x2104:   	fnot1	%f30, %f26
	.word	0xf520a02c	! t0_kref+0x2108:   	st	%f26, [%g2 + 0x2c]
	.word	0xd210a00c	! t0_kref+0x210c:   	lduh	[%g2 + 0xc], %o1
	.word	0xa87b7308	! t0_kref+0x2110:   	sdiv	%o5, -0xcf8, %l4
	.word	0xb1a6c9bb	! t0_kref+0x2114:   	fdivs	%f27, %f27, %f24
	.word	0xf100a008	! t0_kref+0x2118:   	ld	[%g2 + 8], %f24
	.word	0x91b7045a	! t0_kref+0x211c:   	fcmpne16	%f28, %f26, %o0
	.word	0xee4e6006	! t0_kref+0x2120:   	ldsb	[%i1 + 6], %l7
	.word	0xe850a006	! t0_kref+0x2124:   	ldsh	[%g2 + 6], %l4
	.word	0xec080019	! t0_kref+0x2128:   	ldub	[%g0 + %i1], %l6
	.word	0xd010a030	! t0_kref+0x212c:   	lduh	[%g2 + 0x30], %o0
	.word	0xa893400d	! t0_kref+0x2130:   	orcc	%o5, %o5, %l4
	.word	0xea060000	! t0_kref+0x2134:   	ld	[%i0], %l5
	.word	0xb3a649bb	! t0_kref+0x2138:   	fdivs	%f25, %f27, %f25
	.word	0xd400a018	! t0_kref+0x213c:   	ld	[%g2 + 0x18], %o2
	.word	0xec0e7fe3	! t0_kref+0x2140:   	ldub	[%i1 - 0x1d], %l6
	.word	0xee48a011	! t0_kref+0x2144:   	ldsb	[%g2 + 0x11], %l7
	.word	0xbbb60c7a	! t0_kref+0x2148:   	fnors	%f24, %f26, %f29
	.word	0xf96e401c	! t0_kref+0x214c:   	prefetch	%i1 + %i4, 28
	.word	0xf99f1a58	! t0_kref+0x2150:   	ldda	[%i4 + %i0]0xd2, %f28
	.word	0xff00a01c	! t0_kref+0x2154:   	ld	[%g2 + 0x1c], %f31
	.word	0xaebb400d	! t0_kref+0x2158:   	xnorcc	%o5, %o5, %l7
	.word	0xda20a008	! t0_kref+0x215c:   	st	%o5, [%g2 + 8]
	.word	0x949b400d	! t0_kref+0x2160:   	xorcc	%o5, %o5, %o2
	.word	0x9fc00004	! t0_kref+0x2164:   	call	%g0 + %g4
	.word	0xd0000018	! t0_kref+0x2168:   	ld	[%g0 + %i0], %o0
	.word	0xbfa789bd	! t0_kref+0x216c:   	fdivs	%f30, %f29, %f31
	.word	0xaebb400d	! t0_kref+0x2170:   	xnorcc	%o5, %o5, %l7
	.word	0xda20a024	! t0_kref+0x2174:   	st	%o5, [%g2 + 0x24]
	.word	0xdaf65000	! t0_kref+0x2178:   	stxa	%o5, [%i1]0x80
	.word	0xfb00a01c	! t0_kref+0x217c:   	ld	[%g2 + 0x1c], %f29
	.word	0xec10a00a	! t0_kref+0x2180:   	lduh	[%g2 + 0xa], %l6
	.word	0xe80e2005	! t0_kref+0x2184:   	ldub	[%i0 + 5], %l4
	.word	0xda20a02c	! t0_kref+0x2188:   	st	%o5, [%g2 + 0x2c]
	.word	0x97b3432d	! t0_kref+0x218c:   	bmask	%o5, %o5, %o3
	.word	0xe6067ff0	! t0_kref+0x2190:   	ld	[%i1 - 0x10], %l3
	.word	0xd616c019	! t0_kref+0x2194:   	lduh	[%i3 + %i1], %o3
	.word	0xb3a0053e	! t0_kref+0x2198:   	fsqrts	%f30, %f25
	.word	0xad23400d	! t0_kref+0x219c:   	mulscc	%o5, %o5, %l6
	.word	0xfb20a038	! t0_kref+0x21a0:   	st	%f29, [%g2 + 0x38]
	.word	0xd00e4000	! t0_kref+0x21a4:   	ldub	[%i1], %o0
	.word	0xb7a000bc	! t0_kref+0x21a8:   	fnegs	%f28, %f27
	.word	0xad70362c	! t0_kref+0x21ac:   	popc	-0x9d4, %l6
	.word	0x9144c000	! t0_kref+0x21b0:   	mov	%gsr, %o0
	.word	0xda30a000	! t0_kref+0x21b4:   	sth	%o5, [%g2]
	.word	0xb9b68f9c	! t0_kref+0x21b8:   	for	%f26, %f28, %f28
	.word	0xee500019	! t0_kref+0x21bc:   	ldsh	[%g0 + %i1], %l7
	.word	0x33800008	! t0_kref+0x21c0:   	fbe,a	_kref+0x21e0
	.word	0xe43e6008	! t0_kref+0x21c4:   	std	%l2, [%i1 + 8]
	.word	0xd4067fe0	! t0_kref+0x21c8:   	ld	[%i1 - 0x20], %o2
	.word	0xb5b78ed8	! t0_kref+0x21cc:   	fornot2	%f30, %f24, %f26
	.word	0xd4060000	! t0_kref+0x21d0:   	ld	[%i0], %o2
	.word	0xb9a6c9be	! t0_kref+0x21d4:   	fdivs	%f27, %f30, %f28
	.word	0x9013400d	! t0_kref+0x21d8:   	or	%o5, %o5, %o0
	.word	0x8d837c93	! t0_kref+0x21dc:   	wr	%o5, 0xfffffc93, %fprs
	.word	0xe806001c	! t0_kref+0x21e0:   	ld	[%i0 + %i4], %l4
	.word	0xf91e401d	! t0_kref+0x21e4:   	ldd	[%i1 + %i5], %f28
	.word	0x81af4a38	! t0_kref+0x21e8:   	fcmps	%fcc0, %f29, %f24
	.word	0x92e37d17	! t0_kref+0x21ec:   	subccc	%o5, -0x2e9, %o1
	.word	0xadb7051a	! t0_kref+0x21f0:   	fcmpgt16	%f28, %f26, %l6
	.word	0xa87b400d	! t0_kref+0x21f4:   	sdiv	%o5, %o5, %l4
	.word	0x96836383	! t0_kref+0x21f8:   	addcc	%o5, 0x383, %o3
	.word	0xe81e3fe8	! t0_kref+0x21fc:   	ldd	[%i0 - 0x18], %l4
	.word	0xda20a000	! t0_kref+0x2200:   	st	%o5, [%g2]
	.word	0xe850a034	! t0_kref+0x2204:   	ldsh	[%g2 + 0x34], %l4
	.word	0xf1be1a1b	! t0_kref+0x2208:   	stda	%f24, [%i0 + %i3]0xd0
	.word	0xb1a78d39	! t0_kref+0x220c:   	fsmuld	%f30, %f25, %f24
	.word	0xaad3400d	! t0_kref+0x2210:   	umulcc	%o5, %o5, %l5
	.word	0x9013400d	! t0_kref+0x2214:   	or	%o5, %o5, %o0
	.word	0x8d83400d	! t0_kref+0x2218:   	wr	%o5, %o5, %fprs
	.word	0xd050a016	! t0_kref+0x221c:   	ldsh	[%g2 + 0x16], %o0
	.word	0xf76e401b	! t0_kref+0x2220:   	prefetch	%i1 + %i3, 27
	.word	0x001fffff	! t0_kref+0x2224:   	illtrap	0x1fffff
	.word	0xd81f4018	! t0_kref+0x2228:   	ldd	[%i5 + %i0], %o4
	.word	0xe8480018	! t0_kref+0x222c:   	ldsb	[%g0 + %i0], %l4
	.word	0xa8e3400d	! t0_kref+0x2230:   	subccc	%o5, %o5, %l4
	.word	0xb9b78c7c	! t0_kref+0x2234:   	fnors	%f30, %f28, %f28
	.word	0xd000a034	! t0_kref+0x2238:   	ld	[%g2 + 0x34], %o0
	.word	0xe640a018	! t0_kref+0x223c:   	ldsw	[%g2 + 0x18], %l3
	.word	0xd248a004	! t0_kref+0x2240:   	ldsb	[%g2 + 4], %o1
	.word	0xf11f4018	! t0_kref+0x2244:   	ldd	[%i5 + %i0], %f24
	.word	0x91b340cd	! t0_kref+0x2248:   	edge16l	%o5, %o5, %o0
	.word	0xd250a018	! t0_kref+0x224c:   	ldsh	[%g2 + 0x18], %o1
	.word	0xb3a789bf	! t0_kref+0x2250:   	fdivs	%f30, %f31, %f25
	.word	0xb7a01a3f	! t0_kref+0x2254:   	fstoi	%f31, %f27
	.word	0xb5a7c9bb	! t0_kref+0x2258:   	fdivs	%f31, %f27, %f26
	.word	0xe656c018	! t0_kref+0x225c:   	ldsh	[%i3 + %i0], %l3
	.word	0xda28a012	! t0_kref+0x2260:   	stb	%o5, [%g2 + 0x12]
	.word	0xb5a0053a	! t0_kref+0x2264:   	fsqrts	%f26, %f26
	.word	0xd6d65000	! t0_kref+0x2268:   	ldsha	[%i1]0x80, %o3
	.word	0xb9a609bc	! t0_kref+0x226c:   	fdivs	%f24, %f28, %f28
	.word	0xa68376f3	! t0_kref+0x2270:   	addcc	%o5, -0x90d, %l3
	.word	0x81af0a38	! t0_kref+0x2274:   	fcmps	%fcc0, %f28, %f24
	.word	0xa9b34240	! t0_kref+0x2278:   	array16	%o5, %g0, %l4
	.word	0x81da3d1e	! t0_kref+0x227c:   	flush	%o0 - 0x2e2
	.word	0x97b785de	! t0_kref+0x2280:   	fcmpeq32	%f30, %f30, %o3
	.word	0xec4e7ffb	! t0_kref+0x2284:   	ldsb	[%i1 - 5], %l6
	.word	0x97b3432d	! t0_kref+0x2288:   	bmask	%o5, %o5, %o3
	.word	0xd606401c	! t0_kref+0x228c:   	ld	[%i1 + %i4], %o3
	.word	0xbda0191e	! t0_kref+0x2290:   	fitod	%f30, %f30
	.word	0xfb00a004	! t0_kref+0x2294:   	ld	[%g2 + 4], %f29
	.word	0x8610201c	! t0_kref+0x2298:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x229c:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x22a0:   	be,a	_kref+0x22d8
	.word	0xdaf01018	! t0_kref+0x22a4:   	stxa	%o5, [%g0 + %i0]0x80
	.word	0x92d3400d	! t0_kref+0x22a8:   	umulcc	%o5, %o5, %o1
	.word	0xda28a026	! t0_kref+0x22ac:   	stb	%o5, [%g2 + 0x26]
	.word	0xd20e4000	! t0_kref+0x22b0:   	ldub	[%i1], %o1
	.word	0x30800001	! t0_kref+0x22b4:   	ba,a	_kref+0x22b8
	.word	0xd0562018	! t0_kref+0x22b8:   	ldsh	[%i0 + 0x18], %o0
	.word	0xb1a789bb	! t0_kref+0x22bc:   	fdivs	%f30, %f27, %f24
	.word	0xda264000	! t0_kref+0x22c0:   	st	%o5, [%i1]
	.word	0x94db6f05	! t0_kref+0x22c4:   	smulcc	%o5, 0xf05, %o2
	.word	0x9540c000	! t0_kref+0x22c8:   	mov	%asi, %o2
	.word	0xea48a032	! t0_kref+0x22cc:   	ldsb	[%g2 + 0x32], %l5
	.word	0xd040a004	! t0_kref+0x22d0:   	ldsw	[%g2 + 4], %o0
	.word	0xd210a03a	! t0_kref+0x22d4:   	lduh	[%g2 + 0x3a], %o1
	.word	0x37800003	! t0_kref+0x22d8:   	fbge,a	_kref+0x22e4
	.word	0xda20a00c	! t0_kref+0x22dc:   	st	%o5, [%g2 + 0xc]
	.word	0xd00e3fe4	! t0_kref+0x22e0:   	ldub	[%i0 - 0x1c], %o0
	.word	0xafb34240	! t0_kref+0x22e4:   	array16	%o5, %g0, %l7
	.word	0xb3b64a7e	! t0_kref+0x22e8:   	fpadd32s	%f25, %f30, %f25
	.word	0x93b3404d	! t0_kref+0x22ec:   	edge8l	%o5, %o5, %o1
	.word	0x81dc4001	! t0_kref+0x22f0:   	flush	%l1 + %g1
	.word	0xb9a0191b	! t0_kref+0x22f4:   	fitod	%f27, %f28
	.word	0xb9b00fc0	! t0_kref+0x22f8:   	fone	%f28
	.word	0xe43e6008	! t0_kref+0x22fc:   	std	%l2, [%i1 + 8]
	.word	0x81dfb774	! t0_kref+0x2300:   	flush	%fp - 0x88c
	.word	0xee4e7ff9	! t0_kref+0x2304:   	ldsb	[%i1 - 7], %l7
	.word	0xbdb68f9e	! t0_kref+0x2308:   	for	%f26, %f30, %f30
	.word	0xace3771a	! t0_kref+0x230c:   	subccc	%o5, -0x8e6, %l6
	.word	0xe80e200a	! t0_kref+0x2310:   	ldub	[%i0 + 0xa], %l4
	.word	0xd296d059	! t0_kref+0x2314:   	lduha	[%i3 + %i1]0x82, %o1
	.word	0xb7a0053c	! t0_kref+0x2318:   	fsqrts	%f28, %f27
	.word	0xb9a748b9	! t0_kref+0x231c:   	fsubs	%f29, %f25, %f28
	.word	0x9523795d	! t0_kref+0x2320:   	mulscc	%o5, -0x6a3, %o2
	.word	0x92e37325	! t0_kref+0x2324:   	subccc	%o5, -0xcdb, %o1
	.word	0xb5a0055e	! t0_kref+0x2328:   	fsqrtd	%f30, %f26
	.word	0x97b340cd	! t0_kref+0x232c:   	edge16l	%o5, %o5, %o3
	.word	0xc168a003	! t0_kref+0x2330:   	prefetch	%g2 + 3, 0
	.word	0xf1be188d	! t0_kref+0x2334:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xafb68418	! t0_kref+0x2338:   	fcmple16	%f26, %f24, %l7
	.word	0x8d8372e2	! t0_kref+0x233c:   	wr	%o5, 0xfffff2e2, %fprs
	.word	0x81af0a5a	! t0_kref+0x2340:   	fcmpd	%fcc0, %f28, %f26
	.word	0xea48a036	! t0_kref+0x2344:   	ldsb	[%g2 + 0x36], %l5
	.word	0x86102001	! t0_kref+0x2348:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x234c:   	bne,a	_kref+0x234c
	.word	0x86a0e001	! t0_kref+0x2350:   	subcc	%g3, 1, %g3
	.word	0xbda6c83d	! t0_kref+0x2354:   	fadds	%f27, %f29, %f30
	.word	0x81dc400a	! t0_kref+0x2358:   	flush	%l1 + %o2
	.word	0x91b6045a	! t0_kref+0x235c:   	fcmpne16	%f24, %f26, %o0
	.word	0xb7a649bc	! t0_kref+0x2360:   	fdivs	%f25, %f28, %f27
	.word	0xfd1e7ff8	! t0_kref+0x2364:   	ldd	[%i1 - 8], %f30
	.word	0xf3070018	! t0_kref+0x2368:   	ld	[%i4 + %i0], %f25
	.word	0xda363fee	! t0_kref+0x236c:   	sth	%o5, [%i0 - 0x12]
	.word	0xb7a00039	! t0_kref+0x2370:   	fmovs	%f25, %f27
	.word	0xb5b68e80	! t0_kref+0x2374:   	fsrc1	%f26, %f26
	.word	0xb3a0053e	! t0_kref+0x2378:   	fsqrts	%f30, %f25
	.word	0xd64e201f	! t0_kref+0x237c:   	ldsb	[%i0 + 0x1f], %o3
	.word	0xea0e600f	! t0_kref+0x2380:   	ldub	[%i1 + 0xf], %l5
	.word	0x8143e040	! t0_kref+0x2384:   	membar	0x40
	.word	0xe6060000	! t0_kref+0x2388:   	ld	[%i0], %l3
	.word	0xb7a0003e	! t0_kref+0x238c:   	fmovs	%f30, %f27
	.word	0xd89f5040	! t0_kref+0x2390:   	ldda	[%i5]0x82, %o4
	.word	0xb1b70c58	! t0_kref+0x2394:   	fnor	%f28, %f24, %f24
	.word	0xda363ff4	! t0_kref+0x2398:   	sth	%o5, [%i0 - 0xc]
	.word	0xa8b3699c	! t0_kref+0x239c:   	orncc	%o5, 0x99c, %l4
	.word	0x93b6851c	! t0_kref+0x23a0:   	fcmpgt16	%f26, %f28, %o1
	.word	0xda30a032	! t0_kref+0x23a4:   	sth	%o5, [%g2 + 0x32]
	.word	0xd450a00c	! t0_kref+0x23a8:   	ldsh	[%g2 + 0xc], %o2
	.word	0xea480018	! t0_kref+0x23ac:   	ldsb	[%g0 + %i0], %l5
	.word	0x8143c000	! t0_kref+0x23b0:   	stbar
	.word	0xd008a016	! t0_kref+0x23b4:   	ldub	[%g2 + 0x16], %o0
	.word	0xb7a018da	! t0_kref+0x23b8:   	fdtos	%f26, %f27
	.word	0xf51e7fe8	! t0_kref+0x23bc:   	ldd	[%i1 - 0x18], %f26
	.word	0x93b785d8	! t0_kref+0x23c0:   	fcmpeq32	%f30, %f24, %o1
	.word	0xfd20a034	! t0_kref+0x23c4:   	st	%f30, [%g2 + 0x34]
	.word	0xbfb7cdb8	! t0_kref+0x23c8:   	fxors	%f31, %f24, %f31
	.word	0xf720a008	! t0_kref+0x23cc:   	st	%f27, [%g2 + 8]
	.word	0xa823400d	! t0_kref+0x23d0:   	sub	%o5, %o5, %l4
	.word	0xb1a649be	! t0_kref+0x23d4:   	fdivs	%f25, %f30, %f24
	.word	0xe610a018	! t0_kref+0x23d8:   	lduh	[%g2 + 0x18], %l3
	.word	0xf9060000	! t0_kref+0x23dc:   	ld	[%i0], %f28
	.word	0xe60e8018	! t0_kref+0x23e0:   	ldub	[%i2 + %i0], %l3
	.word	0xb1b6c97c	! t0_kref+0x23e4:   	fpmerge	%f27, %f28, %f24
	.word	0xd5f6500d	! t0_kref+0x23e8:   	casxa	[%i1]0x80, %o5, %o2
	.word	0xf11e3fe8	! t0_kref+0x23ec:   	ldd	[%i0 - 0x18], %f24
	.word	0x81da8014	! t0_kref+0x23f0:   	flush	%o2 + %l4
	.word	0x91b6041c	! t0_kref+0x23f4:   	fcmple16	%f24, %f28, %o0
	.word	0xd640a000	! t0_kref+0x23f8:   	ldsw	[%g2], %o3
	.word	0xd648a030	! t0_kref+0x23fc:   	ldsb	[%g2 + 0x30], %o3
	.word	0xbda6895e	! t0_kref+0x2400:   	fmuld	%f26, %f30, %f30
	.word	0xd206001c	! t0_kref+0x2404:   	ld	[%i0 + %i4], %o1
	.word	0xf7063ff0	! t0_kref+0x2408:   	ld	[%i0 - 0x10], %f27
	.word	0xb9a0053c	! t0_kref+0x240c:   	fsqrts	%f28, %f28
	.word	0x96bb400d	! t0_kref+0x2410:   	xnorcc	%o5, %o5, %o3
	.word	0xd00e2016	! t0_kref+0x2414:   	ldub	[%i0 + 0x16], %o0
	.word	0xd09e1000	! t0_kref+0x2418:   	ldda	[%i0]0x80, %o0
	.word	0xf3070018	! t0_kref+0x241c:   	ld	[%i4 + %i0], %f25
	.word	0xf9266000	! t0_kref+0x2420:   	st	%f28, [%i1]
	.word	0xbdb6075e	! t0_kref+0x2424:   	fpack32	%f24, %f30, %f30
	.word	0xd81e3ff0	! t0_kref+0x2428:   	ldd	[%i0 - 0x10], %o4
	.word	0xec08a02b	! t0_kref+0x242c:   	ldub	[%g2 + 0x2b], %l6
	.word	0xb1b00fc0	! t0_kref+0x2430:   	fone	%f24
	.word	0x91b34240	! t0_kref+0x2434:   	array16	%o5, %g0, %o0
	.word	0xfb26001c	! t0_kref+0x2438:   	st	%f29, [%i0 + %i4]
	.word	0xe6062008	! t0_kref+0x243c:   	ld	[%i0 + 8], %l3
	.word	0xa7b3402d	! t0_kref+0x2440:   	edge8n	%o5, %o5, %l3
	.word	0x90c3400d	! t0_kref+0x2444:   	addccc	%o5, %o5, %o0
	.word	0xbdb00fc0	! t0_kref+0x2448:   	fone	%f30
	.word	0xd6000018	! t0_kref+0x244c:   	ld	[%g0 + %i0], %o3
	.word	0xd656c018	! t0_kref+0x2450:   	ldsh	[%i3 + %i0], %o3
	.word	0xea56601c	! t0_kref+0x2454:   	ldsh	[%i1 + 0x1c], %l5
	.word	0x9de3bfa0	! t0_kref+0x2458:   	save	%sp, -0x60, %sp
	.word	0x81c86c34	! t0_kref+0x245c:   	return	%g1 + 0xc34
	.word	0xb9a018de	! t0_kref+0x2460:   	fdtos	%f30, %f28
	.word	0xda28a030	! t0_kref+0x2464:   	stb	%o5, [%g2 + 0x30]
	.word	0xb5b70e5a	! t0_kref+0x2468:   	fxnor	%f28, %f26, %f26
	.word	0xae5b400d	! t0_kref+0x246c:   	smul	%o5, %o5, %l7
	.word	0xb3b70d60	! t0_kref+0x2470:   	fnot1s	%f28, %f25
	.word	0xabb3410d	! t0_kref+0x2474:   	edge32	%o5, %o5, %l5
	.word	0x28800003	! t0_kref+0x2478:   	bleu,a	_kref+0x2484
	.word	0xf700a030	! t0_kref+0x247c:   	ld	[%g2 + 0x30], %f27
	.word	0xd0871018	! t0_kref+0x2480:   	lda	[%i4 + %i0]0x80, %o0
	.word	0xd4563ffe	! t0_kref+0x2484:   	ldsh	[%i0 - 2], %o2
	.word	0xe850a012	! t0_kref+0x2488:   	ldsh	[%g2 + 0x12], %l4
	.word	0xb7a01898	! t0_kref+0x248c:   	fitos	%f24, %f27
	.word	0xf5070018	! t0_kref+0x2490:   	ld	[%i4 + %i0], %f26
	.word	0xb9a689bf	! t0_kref+0x2494:   	fdivs	%f26, %f31, %f28
	.word	0xe850a022	! t0_kref+0x2498:   	ldsh	[%g2 + 0x22], %l4
	.word	0xb3a709bb	! t0_kref+0x249c:   	fdivs	%f28, %f27, %f25
	.word	0xbdb009b9	! t0_kref+0x24a0:   	fexpand	%f25, %f30
	.word	0xb9a6c9bf	! t0_kref+0x24a4:   	fdivs	%f27, %f31, %f28
	.word	0x961b400d	! t0_kref+0x24a8:   	xor	%o5, %o5, %o3
	.word	0xb9b60d9e	! t0_kref+0x24ac:   	fxor	%f24, %f30, %f28
	.word	0xb9b00778	! t0_kref+0x24b0:   	fpack16	%f24, %f28
	.word	0xea4e201f	! t0_kref+0x24b4:   	ldsb	[%i0 + 0x1f], %l5
	.word	0xdaae101a	! t0_kref+0x24b8:   	stba	%o5, [%i0 + %i2]0x80
	.word	0x92bb400d	! t0_kref+0x24bc:   	xnorcc	%o5, %o5, %o1
	.word	0x97b604d8	! t0_kref+0x24c0:   	fcmpne32	%f24, %f24, %o3
	.word	0xd4163ff8	! t0_kref+0x24c4:   	lduh	[%i0 - 8], %o2
	.word	0xda28a01c	! t0_kref+0x24c8:   	stb	%o5, [%g2 + 0x1c]
	.word	0xacd3400d	! t0_kref+0x24cc:   	umulcc	%o5, %o5, %l6
	.word	0xb5b009bb	! t0_kref+0x24d0:   	fexpand	%f27, %f26
	.word	0xabb3404d	! t0_kref+0x24d4:   	edge8l	%o5, %o5, %l5
	.word	0x81ae8a5c	! t0_kref+0x24d8:   	fcmpd	%fcc0, %f26, %f28
	.word	0xb5b74979	! t0_kref+0x24dc:   	fpmerge	%f29, %f25, %f26
	.word	0xd20e001a	! t0_kref+0x24e0:   	ldub	[%i0 + %i2], %o1
	.word	0x86102004	! t0_kref+0x24e4:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x24e8:   	bne,a	_kref+0x24e8
	.word	0x86a0e001	! t0_kref+0x24ec:   	subcc	%g3, 1, %g3
	.word	0xd408a03c	! t0_kref+0x24f0:   	ldub	[%g2 + 0x3c], %o2
	.word	0xda200019	! t0_kref+0x24f4:   	st	%o5, [%g0 + %i1]
	.word	0xf500a030	! t0_kref+0x24f8:   	ld	[%g2 + 0x30], %f26
	.word	0xff00a028	! t0_kref+0x24fc:   	ld	[%g2 + 0x28], %f31
	.word	0x9053400d	! t0_kref+0x2500:   	umul	%o5, %o5, %o0
	.word	0xc168a082	! t0_kref+0x2504:   	prefetch	%g2 + 0x82, 0
	.word	0xb9b68d40	! t0_kref+0x2508:   	fnot1	%f26, %f28
	.word	0xee564000	! t0_kref+0x250c:   	ldsh	[%i1], %l7
	.word	0xe80e4000	! t0_kref+0x2510:   	ldub	[%i1], %l4
	.word	0x969b75eb	! t0_kref+0x2514:   	xorcc	%o5, -0xa15, %o3
	.word	0xd450a038	! t0_kref+0x2518:   	ldsh	[%g2 + 0x38], %o2
	.word	0xf500a010	! t0_kref+0x251c:   	ld	[%g2 + 0x10], %f26
	.word	0xabb785d8	! t0_kref+0x2520:   	fcmpeq32	%f30, %f24, %l5
	.word	0xd0d6d040	! t0_kref+0x2524:   	ldsha	[%i3]0x82, %o0
	.word	0xd0000018	! t0_kref+0x2528:   	ld	[%g0 + %i0], %o0
	.word	0xadb3404d	! t0_kref+0x252c:   	edge8l	%o5, %o5, %l6
	.word	0xafb3434d	! t0_kref+0x2530:   	alignaddrl	%o5, %o5, %l7
	.word	0xda30a03c	! t0_kref+0x2534:   	sth	%o5, [%g2 + 0x3c]
	.word	0xf7063ff0	! t0_kref+0x2538:   	ld	[%i0 - 0x10], %f27
	.word	0xee567fe6	! t0_kref+0x253c:   	ldsh	[%i1 - 0x1a], %l7
	.word	0xd2000018	! t0_kref+0x2540:   	ld	[%g0 + %i0], %o1
	.word	0xe650a024	! t0_kref+0x2544:   	ldsh	[%g2 + 0x24], %l3
	.word	0xe610a026	! t0_kref+0x2548:   	lduh	[%g2 + 0x26], %l3
	.word	0x81b01022	! t0_kref+0x254c:   	siam	0x2
	.word	0xd24e600a	! t0_kref+0x2550:   	ldsb	[%i1 + 0xa], %o1
	.word	0xda28a014	! t0_kref+0x2554:   	stb	%o5, [%g2 + 0x14]
	.word	0xf520a034	! t0_kref+0x2558:   	st	%f26, [%g2 + 0x34]
	.word	0xd4062008	! t0_kref+0x255c:   	ld	[%i0 + 8], %o2
	.word	0xea56401b	! t0_kref+0x2560:   	ldsh	[%i1 + %i3], %l5
	.word	0xea08a01b	! t0_kref+0x2564:   	ldub	[%g2 + 0x1b], %l5
	.word	0xfb00a010	! t0_kref+0x2568:   	ld	[%g2 + 0x10], %f29
	.word	0x86102013	! t0_kref+0x256c:   	mov	0x13, %g3
	.word	0x86a0e001	! t0_kref+0x2570:   	subcc	%g3, 1, %g3
	.word	0x22800009	! t0_kref+0x2574:   	be,a	_kref+0x2598
	.word	0xe6000019	! t0_kref+0x2578:   	ld	[%g0 + %i1], %l3
	.word	0xf506600c	! t0_kref+0x257c:   	ld	[%i1 + 0xc], %f26
	.word	0xd040a018	! t0_kref+0x2580:   	ldsw	[%g2 + 0x18], %o0
	.word	0xd440a02c	! t0_kref+0x2584:   	ldsw	[%g2 + 0x2c], %o2
	.word	0x81ae0a5a	! t0_kref+0x2588:   	fcmpd	%fcc0, %f24, %f26
	.word	0xaf408000	! t0_kref+0x258c:   	mov	%ccr, %l7
	.word	0xb5a0111e	! t0_kref+0x2590:   	fxtod	%f30, %f26
	.word	0xea10a02a	! t0_kref+0x2594:   	lduh	[%g2 + 0x2a], %l5
	.word	0xd00e401a	! t0_kref+0x2598:   	ldub	[%i1 + %i2], %o0
	.word	0xbfa7093a	! t0_kref+0x259c:   	fmuls	%f28, %f26, %f31
	.word	0xbfa7893f	! t0_kref+0x25a0:   	fmuls	%f30, %f31, %f31
	.word	0xb1a7c9be	! t0_kref+0x25a4:   	fdivs	%f31, %f30, %f24
	.word	0xee0e2017	! t0_kref+0x25a8:   	ldub	[%i0 + 0x17], %l7
	.word	0xe848a019	! t0_kref+0x25ac:   	ldsb	[%g2 + 0x19], %l4
	.word	0xb5b009be	! t0_kref+0x25b0:   	fexpand	%f30, %f26
	.word	0xf920a014	! t0_kref+0x25b4:   	st	%f28, [%g2 + 0x14]
	.word	0xda266004	! t0_kref+0x25b8:   	st	%o5, [%i1 + 4]
	.word	0xd44e0000	! t0_kref+0x25bc:   	ldsb	[%i0], %o2
	.word	0xe656001b	! t0_kref+0x25c0:   	ldsh	[%i0 + %i3], %l3
	.word	0xe610a02c	! t0_kref+0x25c4:   	lduh	[%g2 + 0x2c], %l3
	.word	0xe80e6014	! t0_kref+0x25c8:   	ldub	[%i1 + 0x14], %l4
	.word	0xd4063fe8	! t0_kref+0x25cc:   	ld	[%i0 - 0x18], %o2
	.word	0xc568a042	! t0_kref+0x25d0:   	prefetch	%g2 + 0x42, 2
	.word	0xb5b68ede	! t0_kref+0x25d4:   	fornot2	%f26, %f30, %f26
	.word	0xbda0053f	! t0_kref+0x25d8:   	fsqrts	%f31, %f30
	.word	0xfd1e7ff8	! t0_kref+0x25dc:   	ldd	[%i1 - 8], %f30
	.word	0xb9a0055c	! t0_kref+0x25e0:   	fsqrtd	%f28, %f28
	.word	0xbbb64e39	! t0_kref+0x25e4:   	fands	%f25, %f25, %f29
	.word	0xda20a010	! t0_kref+0x25e8:   	st	%o5, [%g2 + 0x10]
	.word	0xd20e0000	! t0_kref+0x25ec:   	ldub	[%i0], %o1
	.word	0xfd1e3ff0	! t0_kref+0x25f0:   	ldd	[%i0 - 0x10], %f30
	.word	0xd648a022	! t0_kref+0x25f4:   	ldsb	[%g2 + 0x22], %o3
	.word	0xb5b009bd	! t0_kref+0x25f8:   	fexpand	%f29, %f26
	.word	0xd448a020	! t0_kref+0x25fc:   	ldsb	[%g2 + 0x20], %o2
	.word	0xd0566014	! t0_kref+0x2600:   	ldsh	[%i1 + 0x14], %o0
	.word	0xb1a0055e	! t0_kref+0x2604:   	fsqrtd	%f30, %f24
	.word	0xda280018	! t0_kref+0x2608:   	stb	%o5, [%g0 + %i0]
	.word	0x8d83400d	! t0_kref+0x260c:   	wr	%o5, %o5, %fprs
	.word	0x81af8adc	! t0_kref+0x2610:   	fcmped	%fcc0, %f30, %f28
	call	SYM(t0_subr0)
	.word	0xbfb70ea0	! t0_kref+0x2618:   	fsrc1s	%f28, %f31
	.word	0xea062008	! t0_kref+0x261c:   	ld	[%i0 + 8], %l5
	.word	0xe84e7fea	! t0_kref+0x2620:   	ldsb	[%i1 - 0x16], %l4
	.word	0xb1b68c9c	! t0_kref+0x2624:   	fandnot2	%f26, %f28, %f24
	.word	0xf91e401d	! t0_kref+0x2628:   	ldd	[%i1 + %i5], %f28
	.word	0xf500a014	! t0_kref+0x262c:   	ld	[%g2 + 0x14], %f26
	.word	0xd450a01e	! t0_kref+0x2630:   	ldsh	[%g2 + 0x1e], %o2
	.word	0xe64e3ffc	! t0_kref+0x2634:   	ldsb	[%i0 - 4], %l3
	.word	0xd2060000	! t0_kref+0x2638:   	ld	[%i0], %o1
	.word	0xa7b3410d	! t0_kref+0x263c:   	edge32	%o5, %o5, %l3
	.word	0xfd1e6000	! t0_kref+0x2640:   	ldd	[%i1], %f30
	.word	0xec0e8019	! t0_kref+0x2644:   	ldub	[%i2 + %i1], %l6
	.word	0xb1b686f8	! t0_kref+0x2648:   	fmul8ulx16	%f26, %f24, %f24
	.word	0xd2162002	! t0_kref+0x264c:   	lduh	[%i0 + 2], %o1
	.word	0xbdb786bd	! t0_kref+0x2650:   	fmul8x16al	%f30, %f29, %f30
	.word	0xad237742	! t0_kref+0x2654:   	mulscc	%o5, -0x8be, %l6
	.word	0xa744c000	! t0_kref+0x2658:   	mov	%gsr, %l3
	.word	0x3e800004	! t0_kref+0x265c:   	bvc,a	_kref+0x266c
	.word	0xf1be5a1d	! t0_kref+0x2660:   	stda	%f24, [%i1 + %i5]0xd0
	.word	0xe840a000	! t0_kref+0x2664:   	ldsw	[%g2], %l4
	.word	0xe6567ffc	! t0_kref+0x2668:   	ldsh	[%i1 - 4], %l3
	.word	0xea56401b	! t0_kref+0x266c:   	ldsh	[%i1 + %i3], %l5
	.word	0xee40a03c	! t0_kref+0x2670:   	ldsw	[%g2 + 0x3c], %l7
	.word	0xda20a00c	! t0_kref+0x2674:   	st	%o5, [%g2 + 0xc]
	.word	0xee567fe8	! t0_kref+0x2678:   	ldsh	[%i1 - 0x18], %l7
	.word	0x91b3406d	! t0_kref+0x267c:   	edge8ln	%o5, %o5, %o0
	.word	0xb3a01a3e	! t0_kref+0x2680:   	fstoi	%f30, %f25
	.word	0xd600a01c	! t0_kref+0x2684:   	ld	[%g2 + 0x1c], %o3
	.word	0xda20a000	! t0_kref+0x2688:   	st	%o5, [%g2]
	.word	0xb1b60ed8	! t0_kref+0x268c:   	fornot2	%f24, %f24, %f24
	.word	0xbda0053c	! t0_kref+0x2690:   	fsqrts	%f28, %f30
	.word	0xbfa0053c	! t0_kref+0x2694:   	fsqrts	%f28, %f31
	.word	0x922b6aa8	! t0_kref+0x2698:   	andn	%o5, 0xaa8, %o1
	.word	0xd6000018	! t0_kref+0x269c:   	ld	[%g0 + %i0], %o3
	.word	0x33800003	! t0_kref+0x26a0:   	fbe,a	_kref+0x26ac
	.word	0xea067ffc	! t0_kref+0x26a4:   	ld	[%i1 - 4], %l5
	.word	0xea56c018	! t0_kref+0x26a8:   	ldsh	[%i3 + %i0], %l5
	.word	0xd2066004	! t0_kref+0x26ac:   	ld	[%i1 + 4], %o1
	.word	0xb7b7ca78	! t0_kref+0x26b0:   	fpadd32s	%f31, %f24, %f27
	.word	0xbfb0077a	! t0_kref+0x26b4:   	fpack16	%f26, %f31
	.word	0xb3a608bc	! t0_kref+0x26b8:   	fsubs	%f24, %f28, %f25
	.word	0xd81e401d	! t0_kref+0x26bc:   	ldd	[%i1 + %i5], %o4
	.word	0xda20a038	! t0_kref+0x26c0:   	st	%o5, [%g2 + 0x38]
	.word	0xee0e6012	! t0_kref+0x26c4:   	ldub	[%i1 + 0x12], %l7
	.word	0xbda68858	! t0_kref+0x26c8:   	faddd	%f26, %f24, %f30
	.word	0xa9b785de	! t0_kref+0x26cc:   	fcmpeq32	%f30, %f30, %l4
	.word	0xda30a010	! t0_kref+0x26d0:   	sth	%o5, [%g2 + 0x10]
	.word	0xe1ee101a	! t0_kref+0x26d4:   	prefetcha	%i0 + %i2, 16
	.word	0x95b3432d	! t0_kref+0x26d8:   	bmask	%o5, %o5, %o2
	.word	0xafb3416d	! t0_kref+0x26dc:   	edge32ln	%o5, %o5, %l7
	.word	0xbda609bf	! t0_kref+0x26e0:   	fdivs	%f24, %f31, %f30
	.word	0xae63660a	! t0_kref+0x26e4:   	subc	%o5, 0x60a, %l7
	.word	0xda2e401a	! t0_kref+0x26e8:   	stb	%o5, [%i1 + %i2]
	.word	0x940b400d	! t0_kref+0x26ec:   	and	%o5, %o5, %o2
	.word	0xb1b009ba	! t0_kref+0x26f0:   	fexpand	%f26, %f24
	.word	0x20800001	! t0_kref+0x26f4:   	bn,a	_kref+0x26f8
	.word	0x95408000	! t0_kref+0x26f8:   	mov	%ccr, %o2
	.word	0xe616001b	! t0_kref+0x26fc:   	lduh	[%i0 + %i3], %l3
	.word	0xec08a002	! t0_kref+0x2700:   	ldub	[%g2 + 2], %l6
	.word	0xfb00a014	! t0_kref+0x2704:   	ld	[%g2 + 0x14], %f29
	.word	0xec167fe6	! t0_kref+0x2708:   	lduh	[%i1 - 0x1a], %l6
	.word	0xb5a708ba	! t0_kref+0x270c:   	fsubs	%f28, %f26, %f26
	.word	0xf700a03c	! t0_kref+0x2710:   	ld	[%g2 + 0x3c], %f27
	.word	0x91b3432d	! t0_kref+0x2714:   	bmask	%o5, %o5, %o0
	.word	0xbda689b9	! t0_kref+0x2718:   	fdivs	%f26, %f25, %f30
	.word	0xe6164000	! t0_kref+0x271c:   	lduh	[%i1], %l3
	.word	0xb7a00538	! t0_kref+0x2720:   	fsqrts	%f24, %f27
	.word	0xda766018	! t0_kref+0x2724:   	stx	%o5, [%i1 + 0x18]
	.word	0xd44e0000	! t0_kref+0x2728:   	ldsb	[%i0], %o2
	.word	0xaf40c000	! t0_kref+0x272c:   	mov	%asi, %l7
	.word	0xbbb007ba	! t0_kref+0x2730:   	fpackfix	%f26, %f29
	.word	0xd24e600f	! t0_kref+0x2734:   	ldsb	[%i1 + 0xf], %o1
	.word	0xe648a014	! t0_kref+0x2738:   	ldsb	[%g2 + 0x14], %l3
	.word	0xb5b78e3d	! t0_kref+0x273c:   	fands	%f30, %f29, %f26
	.word	0xf19f5040	! t0_kref+0x2740:   	ldda	[%i5]0x82, %f24
	.word	0xec070019	! t0_kref+0x2744:   	ld	[%i4 + %i1], %l6
	.word	0xb9b60638	! t0_kref+0x2748:   	fmul8x16	%f24, %f24, %f28
	.word	0xbba649ba	! t0_kref+0x274c:   	fdivs	%f25, %f26, %f29
	.word	0xb5b6891e	! t0_kref+0x2750:   	faligndata	%f26, %f30, %f26
	.word	0xa65b400d	! t0_kref+0x2754:   	smul	%o5, %o5, %l3
	.word	0xa6ab400d	! t0_kref+0x2758:   	andncc	%o5, %o5, %l3
	.word	0xba103ff8	! t0_kref+0x275c:   	mov	0xfffffff8, %i5
	.word	0xb1a01939	! t0_kref+0x2760:   	fstod	%f25, %f24
	.word	0x91b3434d	! t0_kref+0x2764:   	alignaddrl	%o5, %o5, %o0
	.word	0xf11e3fe8	! t0_kref+0x2768:   	ldd	[%i0 - 0x18], %f24
	.word	0xea08a028	! t0_kref+0x276c:   	ldub	[%g2 + 0x28], %l5
	.word	0xb5b60679	! t0_kref+0x2770:   	fmul8x16au	%f24, %f25, %f26
	.word	0xee060000	! t0_kref+0x2774:   	ld	[%i0], %l7
	.word	0xb5a0191b	! t0_kref+0x2778:   	fitod	%f27, %f26
	.word	0xace37294	! t0_kref+0x277c:   	subccc	%o5, -0xd6c, %l6
	.word	0xa8936f54	! t0_kref+0x2780:   	orcc	%o5, 0xf54, %l4
	.word	0xbfb00f3e	! t0_kref+0x2784:   	fsrc2s	%f30, %f31
	.word	0xec16c018	! t0_kref+0x2788:   	lduh	[%i3 + %i0], %l6
	.word	0xd2567fe0	! t0_kref+0x278c:   	ldsh	[%i1 - 0x20], %o1
	.word	0xd256201e	! t0_kref+0x2790:   	ldsh	[%i0 + 0x1e], %o1
	.word	0x23800004	! t0_kref+0x2794:   	fbne,a	_kref+0x27a4
	.word	0xda30a02a	! t0_kref+0x2798:   	sth	%o5, [%g2 + 0x2a]
	.word	0xbfa6c8bf	! t0_kref+0x279c:   	fsubs	%f27, %f31, %f31
	.word	0xd01e4000	! t0_kref+0x27a0:   	ldd	[%i1], %o0
	.word	0xb5b68adc	! t0_kref+0x27a4:   	fpsub32	%f26, %f28, %f26
	.word	0xb1b00fe0	! t0_kref+0x27a8:   	fones	%f24
	.word	0xf9063ff4	! t0_kref+0x27ac:   	ld	[%i0 - 0xc], %f28
	.word	0xec48a02a	! t0_kref+0x27b0:   	ldsb	[%g2 + 0x2a], %l6
	.word	0xb9b60918	! t0_kref+0x27b4:   	faligndata	%f24, %f24, %f28
	.word	0xb9a0193e	! t0_kref+0x27b8:   	fstod	%f30, %f28
	.word	0xb9b70e5c	! t0_kref+0x27bc:   	fxnor	%f28, %f28, %f28
	.word	0xf3263ff0	! t0_kref+0x27c0:   	st	%f25, [%i0 - 0x10]
	.word	0xabb3410d	! t0_kref+0x27c4:   	edge32	%o5, %o5, %l5
	.word	0xda28a02c	! t0_kref+0x27c8:   	stb	%o5, [%g2 + 0x2c]
	.word	0xf300a024	! t0_kref+0x27cc:   	ld	[%g2 + 0x24], %f25
	.word	0xd410a00c	! t0_kref+0x27d0:   	lduh	[%g2 + 0xc], %o2
	.word	0xa783400d	! t0_kref+0x27d4:   	wr	%o5, %o5, %gsr
	.word	0xd40e4000	! t0_kref+0x27d8:   	ldub	[%i1], %o2
	.word	0xeb6e001b	! t0_kref+0x27dc:   	prefetch	%i0 + %i3, 21
	.word	0xa9b604d8	! t0_kref+0x27e0:   	fcmpne32	%f24, %f24, %l4
	.word	0xfd1e4000	! t0_kref+0x27e4:   	ldd	[%i1], %f30
	.word	0xb9a000bf	! t0_kref+0x27e8:   	fnegs	%f31, %f28
	.word	0xbda00539	! t0_kref+0x27ec:   	fsqrts	%f25, %f30
	.word	0xbda01a58	! t0_kref+0x27f0:   	fdtoi	%f24, %f30
	.word	0xd250a028	! t0_kref+0x27f4:   	ldsh	[%g2 + 0x28], %o1
	.word	0xbdb00f1e	! t0_kref+0x27f8:   	fsrc2	%f30, %f30
	.word	0xab33601a	! t0_kref+0x27fc:   	srl	%o5, 0x1a, %l5
	.word	0xf1070019	! t0_kref+0x2800:   	ld	[%i4 + %i1], %f24
	.word	0xee4e3ff0	! t0_kref+0x2804:   	ldsb	[%i0 - 0x10], %l7
	.word	0xab336007	! t0_kref+0x2808:   	srl	%o5, 0x7, %l5
	.word	0xda263fe4	! t0_kref+0x280c:   	st	%o5, [%i0 - 0x1c]
	.word	0xb1b009b8	! t0_kref+0x2810:   	fexpand	%f24, %f24
	.word	0xb9a789b8	! t0_kref+0x2814:   	fdivs	%f30, %f24, %f28
	.word	0xb9b6899e	! t0_kref+0x2818:   	bshuffle	%f26, %f30, %f28
	.word	0xbda789bf	! t0_kref+0x281c:   	fdivs	%f30, %f31, %f30
	.word	0xda20a010	! t0_kref+0x2820:   	st	%o5, [%g2 + 0x10]
	.word	0xb1a01a3f	! t0_kref+0x2824:   	fstoi	%f31, %f24
	.word	0x9544c000	! t0_kref+0x2828:   	mov	%gsr, %o2
	.word	0xf5062000	! t0_kref+0x282c:   	ld	[%i0], %f26
	.word	0xd20e2012	! t0_kref+0x2830:   	ldub	[%i0 + 0x12], %o1
	.word	0xee4e0000	! t0_kref+0x2834:   	ldsb	[%i0], %l7
	.word	0xda28a014	! t0_kref+0x2838:   	stb	%o5, [%g2 + 0x14]
	.word	0x91b34200	! t0_kref+0x283c:   	array8	%o5, %g0, %o0
	.word	0xf1be188d	! t0_kref+0x2840:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xd2070018	! t0_kref+0x2844:   	ld	[%i4 + %i0], %o1
	.word	0xbfa689bf	! t0_kref+0x2848:   	fdivs	%f26, %f31, %f31
	.word	0xf99eda58	! t0_kref+0x284c:   	ldda	[%i3 + %i0]0xd2, %f28
	.word	0xbdb6c67f	! t0_kref+0x2850:   	fmul8x16au	%f27, %f31, %f30
	.word	0xd050a038	! t0_kref+0x2854:   	ldsh	[%g2 + 0x38], %o0
	.word	0xb1a7c9bc	! t0_kref+0x2858:   	fdivs	%f31, %f28, %f24
	.word	0xe848a009	! t0_kref+0x285c:   	ldsb	[%g2 + 9], %l4
	.word	0xae13400d	! t0_kref+0x2860:   	or	%o5, %o5, %l7
	.word	0xbbb6cea0	! t0_kref+0x2864:   	fsrc1s	%f27, %f29
	.word	0xda20a00c	! t0_kref+0x2868:   	st	%o5, [%g2 + 0xc]
	.word	0x9de3bfa0	! t0_kref+0x286c:   	save	%sp, -0x60, %sp
	.word	0x91e8001b	! t0_kref+0x2870:   	restore	%g0, %i3, %o0
	.word	0xd00e2002	! t0_kref+0x2874:   	ldub	[%i0 + 2], %o0
	.word	0xb1a0003c	! t0_kref+0x2878:   	fmovs	%f28, %f24
	.word	0xe810a02e	! t0_kref+0x287c:   	lduh	[%g2 + 0x2e], %l4
	.word	0xd6062018	! t0_kref+0x2880:   	ld	[%i0 + 0x18], %o3
	.word	0xd0063fe8	! t0_kref+0x2884:   	ld	[%i0 - 0x18], %o0
	.word	0xae7b400d	! t0_kref+0x2888:   	sdiv	%o5, %o5, %l7
	.word	0x33800004	! t0_kref+0x288c:   	fbe,a	_kref+0x289c
	.word	0xfd1f4018	! t0_kref+0x2890:   	ldd	[%i5 + %i0], %f30
	.word	0x81dcbc3e	! t0_kref+0x2894:   	flush	%l2 - 0x3c2
	.word	0xd616401b	! t0_kref+0x2898:   	lduh	[%i1 + %i3], %o3
	.word	0xb9a709bb	! t0_kref+0x289c:   	fdivs	%f28, %f27, %f28
	.word	0xa7418000	! t0_kref+0x28a0:   	mov	%fprs, %l3
	.word	0xae93400d	! t0_kref+0x28a4:   	orcc	%o5, %o5, %l7
	.word	0xa8c3400d	! t0_kref+0x28a8:   	addccc	%o5, %o5, %l4
	.word	0xf720a01c	! t0_kref+0x28ac:   	st	%f27, [%g2 + 0x1c]
	.word	0xd4060000	! t0_kref+0x28b0:   	ld	[%i0], %o2
	.word	0xec48a024	! t0_kref+0x28b4:   	ldsb	[%g2 + 0x24], %l6
	.word	0xd6000019	! t0_kref+0x28b8:   	ld	[%g0 + %i1], %o3
	.word	0xbfb68d39	! t0_kref+0x28bc:   	fandnot1s	%f26, %f25, %f31
	.word	0xec066004	! t0_kref+0x28c0:   	ld	[%i1 + 4], %l6
	.word	0xac13400d	! t0_kref+0x28c4:   	or	%o5, %o5, %l6
	.word	0xbda000bf	! t0_kref+0x28c8:   	fnegs	%f31, %f30
	.word	0xea066004	! t0_kref+0x28cc:   	ld	[%i1 + 4], %l5
	.word	0x81af0ada	! t0_kref+0x28d0:   	fcmped	%fcc0, %f28, %f26
	.word	0x2a800007	! t0_kref+0x28d4:   	bcs,a	_kref+0x28f0
	.word	0xd650a000	! t0_kref+0x28d8:   	ldsh	[%g2], %o3
	.word	0xda20a020	! t0_kref+0x28dc:   	st	%o5, [%g2 + 0x20]
	.word	0x38800008	! t0_kref+0x28e0:   	bgu,a	_kref+0x2900
	.word	0xb5a609b9	! t0_kref+0x28e4:   	fdivs	%f24, %f25, %f26
	.word	0xd6160000	! t0_kref+0x28e8:   	lduh	[%i0], %o3
	.word	0xda28a02e	! t0_kref+0x28ec:   	stb	%o5, [%g2 + 0x2e]
	.word	0x8d83400d	! t0_kref+0x28f0:   	wr	%o5, %o5, %fprs
	.word	0xe848a00b	! t0_kref+0x28f4:   	ldsb	[%g2 + 0xb], %l4
	.word	0xb9b60ed8	! t0_kref+0x28f8:   	fornot2	%f24, %f24, %f28
	.word	0xe60e2018	! t0_kref+0x28fc:   	ldub	[%i0 + 0x18], %l3
	.word	0xd4162016	! t0_kref+0x2900:   	lduh	[%i0 + 0x16], %o2
	.word	0xf11fbd60	! t0_kref+0x2904:   	ldd	[%fp - 0x2a0], %f24
	.word	0xd600a01c	! t0_kref+0x2908:   	ld	[%g2 + 0x1c], %o3
	.word	0xa7b340cd	! t0_kref+0x290c:   	edge16l	%o5, %o5, %l3
	.word	0xda20a028	! t0_kref+0x2910:   	st	%o5, [%g2 + 0x28]
	.word	0xd2560000	! t0_kref+0x2914:   	ldsh	[%i0], %o1
	.word	0xff00a038	! t0_kref+0x2918:   	ld	[%g2 + 0x38], %f31
	.word	0xd050a006	! t0_kref+0x291c:   	ldsh	[%g2 + 6], %o0
	.word	0x81ae0adc	! t0_kref+0x2920:   	fcmped	%fcc0, %f24, %f28
	.word	0xbdb00f38	! t0_kref+0x2924:   	fsrc2s	%f24, %f30
	.word	0xda28a005	! t0_kref+0x2928:   	stb	%o5, [%g2 + 5]
	.word	0xd256200e	! t0_kref+0x292c:   	ldsh	[%i0 + 0xe], %o1
	.word	0xb1a00558	! t0_kref+0x2930:   	fsqrtd	%f24, %f24
	.word	0xda2e6011	! t0_kref+0x2934:   	stb	%o5, [%i1 + 0x11]
	.word	0xa7837a2d	! t0_kref+0x2938:   	wr	%o5, 0xfffffa2d, %gsr
	.word	0xf506201c	! t0_kref+0x293c:   	ld	[%i0 + 0x1c], %f26
	.word	0xd0000019	! t0_kref+0x2940:   	ld	[%g0 + %i1], %o0
	.word	0xb5a0191b	! t0_kref+0x2944:   	fitod	%f27, %f26
	.word	0xda30a03a	! t0_kref+0x2948:   	sth	%o5, [%g2 + 0x3a]
	.word	0xda367fe4	! t0_kref+0x294c:   	sth	%o5, [%i1 - 0x1c]
	.word	0xda28a031	! t0_kref+0x2950:   	stb	%o5, [%g2 + 0x31]
	.word	0xb1b74ea0	! t0_kref+0x2954:   	fsrc1s	%f29, %f24
	.word	0xbdb78978	! t0_kref+0x2958:   	fpmerge	%f30, %f24, %f30
	.word	0xb9b009bd	! t0_kref+0x295c:   	fexpand	%f29, %f28
	.word	0xb1b6891e	! t0_kref+0x2960:   	faligndata	%f26, %f30, %f24
	.word	0x9603708e	! t0_kref+0x2964:   	add	%o5, -0xf72, %o3
	.word	0xb7a689be	! t0_kref+0x2968:   	fdivs	%f26, %f30, %f27
	.word	0xda20a004	! t0_kref+0x296c:   	st	%o5, [%g2 + 4]
	.word	0xb5a018d8	! t0_kref+0x2970:   	fdtos	%f24, %f26
	.word	0xff20a010	! t0_kref+0x2974:   	st	%f31, [%g2 + 0x10]
	.word	0x9744c000	! t0_kref+0x2978:   	mov	%gsr, %o3
	.word	0xa63b400d	! t0_kref+0x297c:   	xnor	%o5, %o5, %l3
	.word	0xda20a038	! t0_kref+0x2980:   	st	%o5, [%g2 + 0x38]
	.word	0xe616001b	! t0_kref+0x2984:   	lduh	[%i0 + %i3], %l3
	.word	0xbbb78ea0	! t0_kref+0x2988:   	fsrc1s	%f30, %f29
	.word	0xb1b64978	! t0_kref+0x298c:   	fpmerge	%f25, %f24, %f24
	.word	0xd200a010	! t0_kref+0x2990:   	ld	[%g2 + 0x10], %o1
	.word	0xafb3404d	! t0_kref+0x2994:   	edge8l	%o5, %o5, %l7
	.word	0xaca37342	! t0_kref+0x2998:   	subcc	%o5, -0xcbe, %l6
	.word	0xb7a01899	! t0_kref+0x299c:   	fitos	%f25, %f27
	.word	0xb1b6091c	! t0_kref+0x29a0:   	faligndata	%f24, %f28, %f24
	.word	0xf926401c	! t0_kref+0x29a4:   	st	%f28, [%i1 + %i4]
	.word	0xec064000	! t0_kref+0x29a8:   	ld	[%i1], %l6
	.word	0xd0167fe4	! t0_kref+0x29ac:   	lduh	[%i1 - 0x1c], %o0
	.word	0x113cc260	! t0_kref+0x29b0:   	sethi	%hi(0xf3098000), %o0
	.word	0xec3e7ff8	! t0_kref+0x29b4:   	std	%l6, [%i1 - 8]
	.word	0xfd1e6000	! t0_kref+0x29b8:   	ldd	[%i1], %f30
	.word	0x91408000	! t0_kref+0x29bc:   	mov	%ccr, %o0
	.word	0xbfa0053c	! t0_kref+0x29c0:   	fsqrts	%f28, %f31
	.word	0xe6066018	! t0_kref+0x29c4:   	ld	[%i1 + 0x18], %l3
	.word	0xe7f6500d	! t0_kref+0x29c8:   	casxa	[%i1]0x80, %o5, %l3
	.word	0xb5a7c9b8	! t0_kref+0x29cc:   	fdivs	%f31, %f24, %f26
	.word	0xd4163ff8	! t0_kref+0x29d0:   	lduh	[%i0 - 8], %o2
	.word	0xda20a010	! t0_kref+0x29d4:   	st	%o5, [%g2 + 0x10]
	.word	0xb5b6875e	! t0_kref+0x29d8:   	fpack32	%f26, %f30, %f26
	.word	0xf120a030	! t0_kref+0x29dc:   	st	%f24, [%g2 + 0x30]
	.word	0xda30a016	! t0_kref+0x29e0:   	sth	%o5, [%g2 + 0x16]
	.word	0xbda709b8	! t0_kref+0x29e4:   	fdivs	%f28, %f24, %f30
	.word	0xe640a02c	! t0_kref+0x29e8:   	ldsw	[%g2 + 0x2c], %l3
	.word	0xea063ff8	! t0_kref+0x29ec:   	ld	[%i0 - 8], %l5
	.word	0xb7a789bc	! t0_kref+0x29f0:   	fdivs	%f30, %f28, %f27
	.word	0xa72364b6	! t0_kref+0x29f4:   	mulscc	%o5, 0x4b6, %l3
	.word	0xf926001c	! t0_kref+0x29f8:   	st	%f28, [%i0 + %i4]
	.word	0x2c800008	! t0_kref+0x29fc:   	bneg,a	_kref+0x2a1c
	.word	0xd010a038	! t0_kref+0x2a00:   	lduh	[%g2 + 0x38], %o0
	.word	0xec4e3fe6	! t0_kref+0x2a04:   	ldsb	[%i0 - 0x1a], %l6
	.word	0xac837ccf	! t0_kref+0x2a08:   	addcc	%o5, -0x331, %l6
	.word	0xe8166004	! t0_kref+0x2a0c:   	lduh	[%i1 + 4], %l4
	.word	0xb1b78c9c	! t0_kref+0x2a10:   	fandnot2	%f30, %f28, %f24
	.word	0x923b400d	! t0_kref+0x2a14:   	xnor	%o5, %o5, %o1
	.word	0xaa637f83	! t0_kref+0x2a18:   	subc	%o5, -0x7d, %l5
	.word	0xb9b70679	! t0_kref+0x2a1c:   	fmul8x16au	%f28, %f25, %f28
	.word	0x9443400d	! t0_kref+0x2a20:   	addc	%o5, %o5, %o2
	.word	0xd44e4000	! t0_kref+0x2a24:   	ldsb	[%i1], %o2
	.word	0xb9aa003a	! t0_kref+0x2a28:   	fmovsa	%fcc0, %f26, %f28
	.word	0xb9a6c9be	! t0_kref+0x2a2c:   	fdivs	%f27, %f30, %f28
	.word	0xbba0053a	! t0_kref+0x2a30:   	fsqrts	%f26, %f29
	.word	0xae837710	! t0_kref+0x2a34:   	addcc	%o5, -0x8f0, %l7
	.word	0xec4e8019	! t0_kref+0x2a38:   	ldsb	[%i2 + %i1], %l6
	.word	0xe816c019	! t0_kref+0x2a3c:   	lduh	[%i3 + %i1], %l4
	.word	0xd04e7ff9	! t0_kref+0x2a40:   	ldsb	[%i1 - 7], %o0
	.word	0xec067ff4	! t0_kref+0x2a44:   	ld	[%i1 - 0xc], %l6
	.word	0xb5b60f9c	! t0_kref+0x2a48:   	for	%f24, %f28, %f26
	.word	0xd008a004	! t0_kref+0x2a4c:   	ldub	[%g2 + 4], %o0
	.word	0xe64e3fe4	! t0_kref+0x2a50:   	ldsb	[%i0 - 0x1c], %l3
	.word	0xb5b70d40	! t0_kref+0x2a54:   	fnot1	%f28, %f26
	.word	0x81af8adc	! t0_kref+0x2a58:   	fcmped	%fcc0, %f30, %f28
	.word	0xdaa6501c	! t0_kref+0x2a5c:   	sta	%o5, [%i1 + %i4]0x80
	.word	0xbfb70ea0	! t0_kref+0x2a60:   	fsrc1s	%f28, %f31
	.word	0x917021b0	! t0_kref+0x2a64:   	popc	0x1b0, %o0
	.word	0xf1bf1a19	! t0_kref+0x2a68:   	stda	%f24, [%i4 + %i1]0xd0
	.word	0xa6e37bbd	! t0_kref+0x2a6c:   	subccc	%o5, -0x443, %l3
	.word	0xb9b70ea0	! t0_kref+0x2a70:   	fsrc1s	%f28, %f28
	.word	0xaa23400d	! t0_kref+0x2a74:   	sub	%o5, %o5, %l5
	.word	0xbfa0013e	! t0_kref+0x2a78:   	fabss	%f30, %f31
	.word	0x81dd8013	! t0_kref+0x2a7c:   	flush	%l6 + %l3
	.word	0xac137444	! t0_kref+0x2a80:   	or	%o5, -0xbbc, %l6
	.word	0xadb7845a	! t0_kref+0x2a84:   	fcmpne16	%f30, %f26, %l6
	.word	0xbfa0053f	! t0_kref+0x2a88:   	fsqrts	%f31, %f31
	.word	0xec066008	! t0_kref+0x2a8c:   	ld	[%i1 + 8], %l6
	.word	0xac13400d	! t0_kref+0x2a90:   	or	%o5, %o5, %l6
	.word	0xb9b00fc0	! t0_kref+0x2a94:   	fone	%f28
	.word	0x86102004	! t0_kref+0x2a98:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2a9c:   	bne,a	_kref+0x2a9c
	.word	0x86a0e001	! t0_kref+0x2aa0:   	subcc	%g3, 1, %g3
	.word	0xa944c000	! t0_kref+0x2aa4:   	mov	%gsr, %l4
	.word	0xd00e200f	! t0_kref+0x2aa8:   	ldub	[%i0 + 0xf], %o0
	.word	0xf700a034	! t0_kref+0x2aac:   	ld	[%g2 + 0x34], %f27
	.word	0xd050a00e	! t0_kref+0x2ab0:   	ldsh	[%g2 + 0xe], %o0
	.word	0x86102005	! t0_kref+0x2ab4:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x2ab8:   	subcc	%g3, 1, %g3
	.word	0x22800008	! t0_kref+0x2abc:   	be,a	_kref+0x2adc
	.word	0xec50a008	! t0_kref+0x2ac0:   	ldsh	[%g2 + 8], %l6
	.word	0xee40a000	! t0_kref+0x2ac4:   	ldsw	[%g2], %l7
	.word	0x93b340cd	! t0_kref+0x2ac8:   	edge16l	%o5, %o5, %o1
	.word	0xacdb400d	! t0_kref+0x2acc:   	smulcc	%o5, %o5, %l6
	.word	0xbdb00fc0	! t0_kref+0x2ad0:   	fone	%f30
	.word	0xb9b70f9a	! t0_kref+0x2ad4:   	for	%f28, %f26, %f28
	.word	0x81af8a3b	! t0_kref+0x2ad8:   	fcmps	%fcc0, %f30, %f27
	.word	0xe616401b	! t0_kref+0x2adc:   	lduh	[%i1 + %i3], %l3
	.word	0xe800a004	! t0_kref+0x2ae0:   	ld	[%g2 + 4], %l4
	.word	0xe41e001d	! t0_kref+0x2ae4:   	ldd	[%i0 + %i5], %l2
	.word	0xb5a609b9	! t0_kref+0x2ae8:   	fdivs	%f24, %f25, %f26
	.word	0xb3a789b9	! t0_kref+0x2aec:   	fdivs	%f30, %f25, %f25
	.word	0x2e800007	! t0_kref+0x2af0:   	bvs,a	_kref+0x2b0c
	.word	0xd6067fe4	! t0_kref+0x2af4:   	ld	[%i1 - 0x1c], %o3
	.word	0xda28a012	! t0_kref+0x2af8:   	stb	%o5, [%g2 + 0x12]
	.word	0xf700a02c	! t0_kref+0x2afc:   	ld	[%g2 + 0x2c], %f27
	.word	0xa970000d	! t0_kref+0x2b00:   	popc	%o5, %l4
	.word	0xec0e7ffa	! t0_kref+0x2b04:   	ldub	[%i1 - 6], %l6
	.word	0xbda0053a	! t0_kref+0x2b08:   	fsqrts	%f26, %f30
	.word	0x8610201c	! t0_kref+0x2b0c:   	mov	0x1c, %g3
	.word	0x86a0e001	! t0_kref+0x2b10:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x2b14:   	be,a	_kref+0x2b84
	.word	0xb7a0003b	! t0_kref+0x2b18:   	fmovs	%f27, %f27
	.word	0xb5a68d3d	! t0_kref+0x2b1c:   	fsmuld	%f26, %f29, %f26
	.word	0xe608a005	! t0_kref+0x2b20:   	ldub	[%g2 + 5], %l3
	.word	0x3cbffffb	! t0_kref+0x2b24:   	bpos,a	_kref+0x2b10
	.word	0xbda0053a	! t0_kref+0x2b28:   	fsqrts	%f26, %f30
	.word	0xb3a789ba	! t0_kref+0x2b2c:   	fdivs	%f30, %f26, %f25
	.word	0xfb00a014	! t0_kref+0x2b30:   	ld	[%g2 + 0x14], %f29
	.word	0xac5b7a9e	! t0_kref+0x2b34:   	smul	%o5, -0x562, %l6
	.word	0xd2163fe6	! t0_kref+0x2b38:   	lduh	[%i0 - 0x1a], %o1
	.word	0xb9b00f1c	! t0_kref+0x2b3c:   	fsrc2	%f28, %f28
	.word	0x81df6b6a	! t0_kref+0x2b40:   	flush	%i5 + 0xb6a
	.word	0xb1a6c9b8	! t0_kref+0x2b44:   	fdivs	%f27, %f24, %f24
	.word	0xe8063fe8	! t0_kref+0x2b48:   	ld	[%i0 - 0x18], %l4
	.word	0xfd062000	! t0_kref+0x2b4c:   	ld	[%i0], %f30
	.word	0xadb705dc	! t0_kref+0x2b50:   	fcmpeq32	%f28, %f28, %l6
	.word	0x93b3432d	! t0_kref+0x2b54:   	bmask	%o5, %o5, %o1
	.word	0x8143c000	! t0_kref+0x2b58:   	stbar
	.word	0xa7837943	! t0_kref+0x2b5c:   	wr	%o5, 0xfffff943, %gsr
	.word	0xf51e401d	! t0_kref+0x2b60:   	ldd	[%i1 + %i5], %f26
	.word	0xb5b0077c	! t0_kref+0x2b64:   	fpack16	%f28, %f26
	.word	0xf11e7fe8	! t0_kref+0x2b68:   	ldd	[%i1 - 0x18], %f24
	.word	0xda20a01c	! t0_kref+0x2b6c:   	st	%o5, [%g2 + 0x1c]
	.word	0xb9b00fc0	! t0_kref+0x2b70:   	fone	%f28
	.word	0xb9a0053e	! t0_kref+0x2b74:   	fsqrts	%f30, %f28
	.word	0x900b400d	! t0_kref+0x2b78:   	and	%o5, %o5, %o0
	.word	0xd4180018	! t0_kref+0x2b7c:   	ldd	[%g0 + %i0], %o2
	.word	0xb9a01118	! t0_kref+0x2b80:   	fxtod	%f24, %f28
	.word	0xb1b78e80	! t0_kref+0x2b84:   	fsrc1	%f30, %f24
	.word	0xda20a008	! t0_kref+0x2b88:   	st	%o5, [%g2 + 8]
	.word	0xc168a048	! t0_kref+0x2b8c:   	prefetch	%g2 + 0x48, 0
	.word	0xb3b007b8	! t0_kref+0x2b90:   	fpackfix	%f24, %f25
	.word	0xb3a689b9	! t0_kref+0x2b94:   	fdivs	%f26, %f25, %f25
	.word	0x878020d2	! t0_kref+0x2b98:   	mov	0xd2, %asi
	.word	0xa803400d	! t0_kref+0x2b9c:   	add	%o5, %o5, %l4
	.word	0xbfa018dc	! t0_kref+0x2ba0:   	fdtos	%f28, %f31
	.word	0xa9b34200	! t0_kref+0x2ba4:   	array8	%o5, %g0, %l4
	.word	0xda280019	! t0_kref+0x2ba8:   	stb	%o5, [%g0 + %i1]
	.word	0xec080018	! t0_kref+0x2bac:   	ldub	[%g0 + %i0], %l6
	.word	0xb9a01918	! t0_kref+0x2bb0:   	fitod	%f24, %f28
	.word	0xb1a6cd39	! t0_kref+0x2bb4:   	fsmuld	%f27, %f25, %f24
	.word	0xf9be1a1d	! t0_kref+0x2bb8:   	stda	%f28, [%i0 + %i5]0xd0
	.word	0xafb3412d	! t0_kref+0x2bbc:   	edge32n	%o5, %o5, %l7
	.word	0xda367fe8	! t0_kref+0x2bc0:   	sth	%o5, [%i1 - 0x18]
	.word	0xb1a0055c	! t0_kref+0x2bc4:   	fsqrtd	%f28, %f24
	.word	0xd050a020	! t0_kref+0x2bc8:   	ldsh	[%g2 + 0x20], %o0
	.word	0xa8ab72d3	! t0_kref+0x2bcc:   	andncc	%o5, -0xd2d, %l4
	.word	0xf1bf5a18	! t0_kref+0x2bd0:   	stda	%f24, [%i5 + %i0]0xd0
	.word	0xb9b70c7e	! t0_kref+0x2bd4:   	fnors	%f28, %f30, %f28
	.word	0x81af8adc	! t0_kref+0x2bd8:   	fcmped	%fcc0, %f30, %f28
	.word	0xda28a021	! t0_kref+0x2bdc:   	stb	%o5, [%g2 + 0x21]
	.word	0xfd00a038	! t0_kref+0x2be0:   	ld	[%g2 + 0x38], %f30
	.word	0xd410a004	! t0_kref+0x2be4:   	lduh	[%g2 + 4], %o2
	.word	0xb9b00cde	! t0_kref+0x2be8:   	fnot2	%f30, %f28
	.word	0xf91e3ff0	! t0_kref+0x2bec:   	ldd	[%i0 - 0x10], %f28
	.word	0x3d800007	! t0_kref+0x2bf0:   	fbule,a	_kref+0x2c0c
	.word	0x9433400d	! t0_kref+0x2bf4:   	orn	%o5, %o5, %o2
	.word	0xa65b400d	! t0_kref+0x2bf8:   	smul	%o5, %o5, %l3
	.word	0xea08a033	! t0_kref+0x2bfc:   	ldub	[%g2 + 0x33], %l5
	.word	0xbda649bf	! t0_kref+0x2c00:   	fdivs	%f25, %f31, %f30
	.word	0xe64e8018	! t0_kref+0x2c04:   	ldsb	[%i2 + %i0], %l3
	.word	0x91b7841e	! t0_kref+0x2c08:   	fcmple16	%f30, %f30, %o0
	.word	0xb7a018de	! t0_kref+0x2c0c:   	fdtos	%f30, %f27
	.word	0xf500a018	! t0_kref+0x2c10:   	ld	[%g2 + 0x18], %f26
	.word	0xf1064000	! t0_kref+0x2c14:   	ld	[%i1], %f24
	.word	0xea567fe2	! t0_kref+0x2c18:   	ldsh	[%i1 - 0x1e], %l5
	.word	0xee16c019	! t0_kref+0x2c1c:   	lduh	[%i3 + %i1], %l7
	.word	0xb5a0003a	! t0_kref+0x2c20:   	fmovs	%f26, %f26
	.word	0xd04e3ff2	! t0_kref+0x2c24:   	ldsb	[%i0 - 0xe], %o0
	.word	0x97b3432d	! t0_kref+0x2c28:   	bmask	%o5, %o5, %o3
	.word	0x3b800004	! t0_kref+0x2c2c:   	fble,a	_kref+0x2c3c
	.word	0xda30a000	! t0_kref+0x2c30:   	sth	%o5, [%g2]
	.word	0xec567fec	! t0_kref+0x2c34:   	ldsh	[%i1 - 0x14], %l6
	.word	0xec48a036	! t0_kref+0x2c38:   	ldsb	[%g2 + 0x36], %l6
	.word	0xd00e600d	! t0_kref+0x2c3c:   	ldub	[%i1 + 0xd], %o0
	.word	0xe6164000	! t0_kref+0x2c40:   	lduh	[%i1], %l3
	.word	0xf91e7ff8	! t0_kref+0x2c44:   	ldd	[%i1 - 8], %f28
	.word	0xf1067fec	! t0_kref+0x2c48:   	ld	[%i1 - 0x14], %f24
	.word	0xb7b00c20	! t0_kref+0x2c4c:   	fzeros	%f27
	.word	0xb5a0193c	! t0_kref+0x2c50:   	fstod	%f28, %f26
	.word	0xe60e4000	! t0_kref+0x2c54:   	ldub	[%i1], %l3
	.word	0xd2166018	! t0_kref+0x2c58:   	lduh	[%i1 + 0x18], %o1
	.word	0xafb3416d	! t0_kref+0x2c5c:   	edge32ln	%o5, %o5, %l7
	.word	0xbba0189e	! t0_kref+0x2c60:   	fitos	%f30, %f29
	.word	0xac5b400d	! t0_kref+0x2c64:   	smul	%o5, %o5, %l6
	.word	0xda6e4000	! t0_kref+0x2c68:   	ldstub	[%i1], %o5
	.word	0xff00a00c	! t0_kref+0x2c6c:   	ld	[%g2 + 0xc], %f31
	.word	0xee0e200a	! t0_kref+0x2c70:   	ldub	[%i0 + 0xa], %l7
	.word	0xd41e6000	! t0_kref+0x2c74:   	ldd	[%i1], %o2
	.word	0xa8bb400d	! t0_kref+0x2c78:   	xnorcc	%o5, %o5, %l4
	.word	0x92f37159	! t0_kref+0x2c7c:   	udivcc	%o5, -0xea7, %o1
	.word	0xea062018	! t0_kref+0x2c80:   	ld	[%i0 + 0x18], %l5
	.word	0x81ae8a3f	! t0_kref+0x2c84:   	fcmps	%fcc0, %f26, %f31
	.word	0xf1be188d	! t0_kref+0x2c88:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xe8067ff4	! t0_kref+0x2c8c:   	ld	[%i1 - 0xc], %l4
	.word	0xb9a00558	! t0_kref+0x2c90:   	fsqrtd	%f24, %f28
	.word	0xf1be588d	! t0_kref+0x2c94:   	stda	%f24, [%i1 + %o5]0xc4
	.word	0xffee501d	! t0_kref+0x2c98:   	prefetcha	%i1 + %i5, 31
	.word	0xd650a006	! t0_kref+0x2c9c:   	ldsh	[%g2 + 6], %o3
	.word	0x9423400d	! t0_kref+0x2ca0:   	sub	%o5, %o5, %o2
	.word	0xda20a024	! t0_kref+0x2ca4:   	st	%o5, [%g2 + 0x24]
	.word	0xabb340cd	! t0_kref+0x2ca8:   	edge16l	%o5, %o5, %l5
	.word	0xa803400d	! t0_kref+0x2cac:   	add	%o5, %o5, %l4
	.word	0xfb064000	! t0_kref+0x2cb0:   	ld	[%i1], %f29
	.word	0xd60e4000	! t0_kref+0x2cb4:   	ldub	[%i1], %o3
	.word	0xd44e6002	! t0_kref+0x2cb8:   	ldsb	[%i1 + 2], %o2
	.word	0xb5b7ccbb	! t0_kref+0x2cbc:   	fandnot2s	%f31, %f27, %f26
	.word	0xec080018	! t0_kref+0x2cc0:   	ldub	[%g0 + %i0], %l6
	.word	0xd0480018	! t0_kref+0x2cc4:   	ldsb	[%g0 + %i0], %o0
	.word	0xe84e2007	! t0_kref+0x2cc8:   	ldsb	[%i0 + 7], %l4
	.word	0xec16001b	! t0_kref+0x2ccc:   	lduh	[%i0 + %i3], %l6
	.word	0xda28a009	! t0_kref+0x2cd0:   	stb	%o5, [%g2 + 9]
	.word	0xf9be188d	! t0_kref+0x2cd4:   	stda	%f28, [%i0 + %o5]0xc4
	.word	0xaab3400d	! t0_kref+0x2cd8:   	orncc	%o5, %o5, %l5
	.word	0xe6063ff8	! t0_kref+0x2cdc:   	ld	[%i0 - 8], %l3
	.word	0xe80e8018	! t0_kref+0x2ce0:   	ldub	[%i2 + %i0], %l4
	.word	0xb5b70ea0	! t0_kref+0x2ce4:   	fsrc1s	%f28, %f26
	.word	0xa6836651	! t0_kref+0x2ce8:   	addcc	%o5, 0x651, %l3
	.word	0xd000a03c	! t0_kref+0x2cec:   	ld	[%g2 + 0x3c], %o0
	.word	0xda28a026	! t0_kref+0x2cf0:   	stb	%o5, [%g2 + 0x26]
	.word	0xb5b6899c	! t0_kref+0x2cf4:   	bshuffle	%f26, %f28, %f26
	.word	0xb9a788d8	! t0_kref+0x2cf8:   	fsubd	%f30, %f24, %f28
	.word	0xda30a036	! t0_kref+0x2cfc:   	sth	%o5, [%g2 + 0x36]
	.word	0xd60e8019	! t0_kref+0x2d00:   	ldub	[%i2 + %i1], %o3
	.word	0xec00a03c	! t0_kref+0x2d04:   	ld	[%g2 + 0x3c], %l6
	.word	0xf7064000	! t0_kref+0x2d08:   	ld	[%i1], %f27
	.word	0xbbb00cfa	! t0_kref+0x2d0c:   	fnot2s	%f26, %f29
	.word	0x2f37a616	! t0_kref+0x2d10:   	sethi	%hi(0xde985800), %l7
	.word	0xec4e7ff9	! t0_kref+0x2d14:   	ldsb	[%i1 - 7], %l6
	.word	0xb6103fe2	! t0_kref+0x2d18:   	mov	0xffffffe2, %i3
	.word	0xb3b64fb8	! t0_kref+0x2d1c:   	fors	%f25, %f24, %f25
	.word	0x8610201d	! t0_kref+0x2d20:   	mov	0x1d, %g3
	.word	0x86a0e001	! t0_kref+0x2d24:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x2d28:   	be,a	_kref+0x2d98
	.word	0xbda00538	! t0_kref+0x2d2c:   	fsqrts	%f24, %f30
	.word	0xfd1f4019	! t0_kref+0x2d30:   	ldd	[%i5 + %i1], %f30
	.word	0xafb3410d	! t0_kref+0x2d34:   	edge32	%o5, %o5, %l7
	.word	0xea00a004	! t0_kref+0x2d38:   	ld	[%g2 + 4], %l5
	.word	0xff20a020	! t0_kref+0x2d3c:   	st	%f31, [%g2 + 0x20]
	.word	0xd2066008	! t0_kref+0x2d40:   	ld	[%i1 + 8], %o1
	.word	0x93b3400d	! t0_kref+0x2d44:   	edge8	%o5, %o5, %o1
	.word	0xfb20a004	! t0_kref+0x2d48:   	st	%f29, [%g2 + 4]
	.word	0xda20a03c	! t0_kref+0x2d4c:   	st	%o5, [%g2 + 0x3c]
	.word	0xd40e2001	! t0_kref+0x2d50:   	ldub	[%i0 + 1], %o2
	.word	0xb1a689b9	! t0_kref+0x2d54:   	fdivs	%f26, %f25, %f24
	.word	0xea0e7feb	! t0_kref+0x2d58:   	ldub	[%i1 - 0x15], %l5
	.word	0xee067ff8	! t0_kref+0x2d5c:   	ld	[%i1 - 8], %l7
	.word	0xd416600a	! t0_kref+0x2d60:   	lduh	[%i1 + 0xa], %o2
	.word	0xfd00a034	! t0_kref+0x2d64:   	ld	[%g2 + 0x34], %f30
	.word	0xea4e001a	! t0_kref+0x2d68:   	ldsb	[%i0 + %i2], %l5
	.word	0x920b6421	! t0_kref+0x2d6c:   	and	%o5, 0x421, %o1
	.word	0xa7b3416d	! t0_kref+0x2d70:   	edge32ln	%o5, %o5, %l3
	.word	0xf100a010	! t0_kref+0x2d74:   	ld	[%g2 + 0x10], %f24
	.word	0x9567249b	! t0_kref+0x2d78:   	movgu	%icc, -0x365, %o2
	.word	0xa7336001	! t0_kref+0x2d7c:   	srl	%o5, 0x1, %l3
	.word	0x90a367f5	! t0_kref+0x2d80:   	subcc	%o5, 0x7f5, %o0
	.word	0xb9a788bd	! t0_kref+0x2d84:   	fsubs	%f30, %f29, %f28
	.word	0xd240a038	! t0_kref+0x2d88:   	ldsw	[%g2 + 0x38], %o1
	.word	0xec480019	! t0_kref+0x2d8c:   	ldsb	[%g0 + %i1], %l6
	.word	0xf300a00c	! t0_kref+0x2d90:   	ld	[%g2 + 0xc], %f25
	.word	0xb5b6c71a	! t0_kref+0x2d94:   	fmuld8sux16	%f27, %f26, %f26
	.word	0xec064000	! t0_kref+0x2d98:   	ld	[%i1], %l6
	.word	0xd408a016	! t0_kref+0x2d9c:   	ldub	[%g2 + 0x16], %o2
	.word	0x90a3400d	! t0_kref+0x2da0:   	subcc	%o5, %o5, %o0
	.word	0xbda0053e	! t0_kref+0x2da4:   	fsqrts	%f30, %f30
	.word	0xee067fec	! t0_kref+0x2da8:   	ld	[%i1 - 0x14], %l7
	.word	0xb5a0055c	! t0_kref+0x2dac:   	fsqrtd	%f28, %f26
	.word	0xb5a0189e	! t0_kref+0x2db0:   	fitos	%f30, %f26
	.word	0xea080018	! t0_kref+0x2db4:   	ldub	[%g0 + %i0], %l5
	.word	0xd256001b	! t0_kref+0x2db8:   	ldsh	[%i0 + %i3], %o1
	.word	0xf11f4019	! t0_kref+0x2dbc:   	ldd	[%i5 + %i1], %f24
	.word	0x9de3bfa0	! t0_kref+0x2dc0:   	save	%sp, -0x60, %sp
	.word	0xb8082bdc	! t0_kref+0x2dc4:   	and	%g0, 0xbdc, %i4
	.word	0xa7ee33a8	! t0_kref+0x2dc8:   	restore	%i0, -0xc58, %l3
	.word	0x91b3404d	! t0_kref+0x2dcc:   	edge8l	%o5, %o5, %o0
	.word	0xec4e8018	! t0_kref+0x2dd0:   	ldsb	[%i2 + %i0], %l6
	.word	0xbdb009be	! t0_kref+0x2dd4:   	fexpand	%f30, %f30
	.word	0x81834000	! t0_kref+0x2dd8:   	wr	%o5, %g0, %y
	.word	0xee062004	! t0_kref+0x2ddc:   	ld	[%i0 + 4], %l7
	.word	0xd0100019	! t0_kref+0x2de0:   	lduh	[%g0 + %i1], %o0
	.word	0x91b3412d	! t0_kref+0x2de4:   	edge32n	%o5, %o5, %o0
	.word	0xbfa018dc	! t0_kref+0x2de8:   	fdtos	%f28, %f31
	.word	0xd07e001c	! t0_kref+0x2dec:   	swap	[%i0 + %i4], %o0
	.word	0xf1be1a1d	! t0_kref+0x2df0:   	stda	%f24, [%i0 + %i5]0xd0
	.word	0xb9b00fe0	! t0_kref+0x2df4:   	fones	%f28
	.word	0xda300019	! t0_kref+0x2df8:   	sth	%o5, [%g0 + %i1]
	.word	0xb7a7c9bc	! t0_kref+0x2dfc:   	fdivs	%f31, %f28, %f27
	.word	0x9fc00004	! t0_kref+0x2e00:   	call	%g0 + %g4
	.word	0xda30a012	! t0_kref+0x2e04:   	sth	%o5, [%g2 + 0x12]
	.word	0xd4000019	! t0_kref+0x2e08:   	ld	[%g0 + %i1], %o2
	.word	0xbba649ba	! t0_kref+0x2e0c:   	fdivs	%f25, %f26, %f29
	.word	0xf91f4018	! t0_kref+0x2e10:   	ldd	[%i5 + %i0], %f28
	.word	0xb5a0053a	! t0_kref+0x2e14:   	fsqrts	%f26, %f26
	.word	0xafb3408d	! t0_kref+0x2e18:   	edge16	%o5, %o5, %l7
	.word	0xb5a78d3b	! t0_kref+0x2e1c:   	fsmuld	%f30, %f27, %f26
	.word	0xb3b74e3d	! t0_kref+0x2e20:   	fands	%f29, %f29, %f25
	.word	0x23800004	! t0_kref+0x2e24:   	fbne,a	_kref+0x2e34
	.word	0x81c9401c	! t0_kref+0x2e28:   	return	%g5 + %i4
	.word	0x81834000	! t0_kref+0x2e2c:   	wr	%o5, %g0, %y
	.word	0xf500a000	! t0_kref+0x2e30:   	ld	[%g2], %f26
	.word	0xfd064000	! t0_kref+0x2e34:   	ld	[%i1], %f30
	.word	0xfd1fbe08	! t0_kref+0x2e38:   	ldd	[%fp - 0x1f8], %f30
	.word	0x9613400d	! t0_kref+0x2e3c:   	or	%o5, %o5, %o3
	.word	0xbfa01a5a	! t0_kref+0x2e40:   	fdtoi	%f26, %f31
	.word	0x95703aeb	! t0_kref+0x2e44:   	popc	-0x515, %o2
	.word	0xc36e000d	! t0_kref+0x2e48:   	prefetch	%i0 + %o5, 1
	.word	0x292d66bb	! t0_kref+0x2e4c:   	sethi	%hi(0xb59aec00), %l4
	.word	0xea064000	! t0_kref+0x2e50:   	ld	[%i1], %l5
	.word	0xfb000019	! t0_kref+0x2e54:   	ld	[%g0 + %i1], %f29
	.word	0xda28a018	! t0_kref+0x2e58:   	stb	%o5, [%g2 + 0x18]
	.word	0xf520a02c	! t0_kref+0x2e5c:   	st	%f26, [%g2 + 0x2c]
	.word	0xb1b68f9c	! t0_kref+0x2e60:   	for	%f26, %f28, %f24
	.word	0x90f3400d	! t0_kref+0x2e64:   	udivcc	%o5, %o5, %o0
	.word	0xda28a02a	! t0_kref+0x2e68:   	stb	%o5, [%g2 + 0x2a]
	.word	0x81ae0ad8	! t0_kref+0x2e6c:   	fcmped	%fcc0, %f24, %f24
	.word	0xb9b78c58	! t0_kref+0x2e70:   	fnor	%f30, %f24, %f28
	.word	0xae0b400d	! t0_kref+0x2e74:   	and	%o5, %o5, %l7
	.word	0xbfa709b8	! t0_kref+0x2e78:   	fdivs	%f28, %f24, %f31
	.word	0xff26401c	! t0_kref+0x2e7c:   	st	%f31, [%i1 + %i4]
	.word	0xd406401c	! t0_kref+0x2e80:   	ld	[%i1 + %i4], %o2
	.word	0xd00e200e	! t0_kref+0x2e84:   	ldub	[%i0 + 0xe], %o0
	.word	0xe8560000	! t0_kref+0x2e88:   	ldsh	[%i0], %l4
	.word	0xf120a038	! t0_kref+0x2e8c:   	st	%f24, [%g2 + 0x38]
	.word	0xd6080018	! t0_kref+0x2e90:   	ldub	[%g0 + %i0], %o3
	.word	0xda367ffa	! t0_kref+0x2e94:   	sth	%o5, [%i1 - 6]
	.word	0xafb3416d	! t0_kref+0x2e98:   	edge32ln	%o5, %o5, %l7
	.word	0xa7b3410d	! t0_kref+0x2e9c:   	edge32	%o5, %o5, %l3
	.word	0x95b3416d	! t0_kref+0x2ea0:   	edge32ln	%o5, %o5, %o2
	.word	0xa7b3404d	! t0_kref+0x2ea4:   	edge8l	%o5, %o5, %l3
	.word	0xb5a649bd	! t0_kref+0x2ea8:   	fdivs	%f25, %f29, %f26
	.word	0xaaf364f7	! t0_kref+0x2eac:   	udivcc	%o5, 0x4f7, %l5
	.word	0xda36001b	! t0_kref+0x2eb0:   	sth	%o5, [%i0 + %i3]
	.word	0xb5b7cc7a	! t0_kref+0x2eb4:   	fnors	%f31, %f26, %f26
	.word	0xa60b6b34	! t0_kref+0x2eb8:   	and	%o5, 0xb34, %l3
	.word	0xbdb00f1c	! t0_kref+0x2ebc:   	fsrc2	%f28, %f30
	.word	0xb3b74ef8	! t0_kref+0x2ec0:   	fornot2s	%f29, %f24, %f25
	.word	0xbba0053d	! t0_kref+0x2ec4:   	fsqrts	%f29, %f29
	.word	0xbfa7c9bd	! t0_kref+0x2ec8:   	fdivs	%f31, %f29, %f31
	.word	0xf51f4018	! t0_kref+0x2ecc:   	ldd	[%i5 + %i0], %f26
	.word	0xb9b60e5a	! t0_kref+0x2ed0:   	fxnor	%f24, %f26, %f28
	.word	0xb9a0055e	! t0_kref+0x2ed4:   	fsqrtd	%f30, %f28
	.word	0xf1be188d	! t0_kref+0x2ed8:   	stda	%f24, [%i0 + %o5]0xc4
	.word	0xbdb7c739	! t0_kref+0x2edc:   	fmuld8ulx16	%f31, %f25, %f30
	.word	0xec070018	! t0_kref+0x2ee0:   	ld	[%i4 + %i0], %l6
	.word	0xe608a015	! t0_kref+0x2ee4:   	ldub	[%g2 + 0x15], %l3
	.word	0x9162a365	! t0_kref+0x2ee8:   	movue	%fcc0, 0x365, %o0
	.word	0x9de3bfa0	! t0_kref+0x2eec:   	save	%sp, -0x60, %sp
	.word	0xbaa727cf	! t0_kref+0x2ef0:   	subcc	%i4, 0x7cf, %i5
	.word	0x91eef541	! t0_kref+0x2ef4:   	restore	%i3, -0xabf, %o0
	.word	0xee0e601d	! t0_kref+0x2ef8:   	ldub	[%i1 + 0x1d], %l7
	.word	0xe6563ffa	! t0_kref+0x2efc:   	ldsh	[%i0 - 6], %l3
	.word	0xe60e3fec	! t0_kref+0x2f00:   	ldub	[%i0 - 0x14], %l3
	.word	0xb1a749bf	! t0_kref+0x2f04:   	fdivs	%f29, %f31, %f24
	.word	0xbba7c9bf	! t0_kref+0x2f08:   	fdivs	%f31, %f31, %f29
	.word	0xa9b3430d	! t0_kref+0x2f0c:   	alignaddr	%o5, %o5, %l4
	.word	0xb1b606be	! t0_kref+0x2f10:   	fmul8x16al	%f24, %f30, %f24
	.word	0xa723400d	! t0_kref+0x2f14:   	mulscc	%o5, %o5, %l3
	.word	0x83414000	! t0_kref+0x2f18:   	mov	%pc, %g1
	.word	0xbda649b9	! t0_kref+0x2f1c:   	fdivs	%f25, %f25, %f30
	.word	0xb9b00cdc	! t0_kref+0x2f20:   	fnot2	%f28, %f28
	.word	0x96c3400d	! t0_kref+0x2f24:   	addccc	%o5, %o5, %o3
	.word	0xfd1f4019	! t0_kref+0x2f28:   	ldd	[%i5 + %i1], %f30
	.word	0xee56c019	! t0_kref+0x2f2c:   	ldsh	[%i3 + %i1], %l7
	.word	0xb9b70c5a	! t0_kref+0x2f30:   	fnor	%f28, %f26, %f28
	.word	0xee48a004	! t0_kref+0x2f34:   	ldsb	[%g2 + 4], %l7
	.word	0xee480019	! t0_kref+0x2f38:   	ldsb	[%g0 + %i1], %l7
	.word	0xee10a006	! t0_kref+0x2f3c:   	lduh	[%g2 + 6], %l7
	.word	0xe8067ff0	! t0_kref+0x2f40:   	ld	[%i1 - 0x10], %l4
	.word	0xb5b00f1e	! t0_kref+0x2f44:   	fsrc2	%f30, %f26
	.word	0xd6164000	! t0_kref+0x2f48:   	lduh	[%i1], %o3
	.word	0xadb3404d	! t0_kref+0x2f4c:   	edge8l	%o5, %o5, %l6
	.word	0xae23400d	! t0_kref+0x2f50:   	sub	%o5, %o5, %l7
	.word	0xb1a0055a	! t0_kref+0x2f54:   	fsqrtd	%f26, %f24
	.word	0xef68a04a	! t0_kref+0x2f58:   	prefetch	%g2 + 0x4a, 23
	.word	0xf11e4000	! t0_kref+0x2f5c:   	ldd	[%i1], %f24
	.word	0x93b70418	! t0_kref+0x2f60:   	fcmple16	%f28, %f24, %o1
	.word	0xe6062000	! t0_kref+0x2f64:   	ld	[%i0], %l3
	.word	0xb5a0053e	! t0_kref+0x2f68:   	fsqrts	%f30, %f26
	.word	0xf51fbe10	! t0_kref+0x2f6c:   	ldd	[%fp - 0x1f0], %f26
	.word	0xee56401b	! t0_kref+0x2f70:   	ldsh	[%i1 + %i3], %l7
	.word	0xf91e0000	! t0_kref+0x2f74:   	ldd	[%i0], %f28
	.word	0xbdb60e80	! t0_kref+0x2f78:   	fsrc1	%f24, %f30
	.word	0xb7a689bd	! t0_kref+0x2f7c:   	fdivs	%f26, %f29, %f27
	.word	0xb3a648bf	! t0_kref+0x2f80:   	fsubs	%f25, %f31, %f25
	.word	0xf91e6010	! t0_kref+0x2f84:   	ldd	[%i1 + 0x10], %f28
	.word	0xb5b00cfc	! t0_kref+0x2f88:   	fnot2s	%f28, %f26
	.word	0xd4000018	! t0_kref+0x2f8c:   	ld	[%g0 + %i0], %o2
	.word	0xae036a69	! t0_kref+0x2f90:   	add	%o5, 0xa69, %l7
	.word	0x9123400d	! t0_kref+0x2f94:   	mulscc	%o5, %o5, %o0
	.word	0x921b400d	! t0_kref+0x2f98:   	xor	%o5, %o5, %o1
	.word	0xabb3402d	! t0_kref+0x2f9c:   	edge8n	%o5, %o5, %l5
	.word	0xd0564000	! t0_kref+0x2fa0:   	ldsh	[%i1], %o0
	.word	0xfd1e401d	! t0_kref+0x2fa4:   	ldd	[%i1 + %i5], %f30
	.word	0xb5a0055e	! t0_kref+0x2fa8:   	fsqrtd	%f30, %f26
	.word	0xb1a00558	! t0_kref+0x2fac:   	fsqrtd	%f24, %f24
	.word	0xbdb6091a	! t0_kref+0x2fb0:   	faligndata	%f24, %f26, %f30
	.word	0xbda7c9bb	! t0_kref+0x2fb4:   	fdivs	%f31, %f27, %f30
	.word	0xbfa0053b	! t0_kref+0x2fb8:   	fsqrts	%f27, %f31
	.word	0xa693400d	! t0_kref+0x2fbc:   	orcc	%o5, %o5, %l3
	.word	0xd40e2008	! t0_kref+0x2fc0:   	ldub	[%i0 + 8], %o2
	.word	0xd6063ff4	! t0_kref+0x2fc4:   	ld	[%i0 - 0xc], %o3
	.word	0xbba6c9bb	! t0_kref+0x2fc8:   	fdivs	%f27, %f27, %f29
	.word	0xfd1e2018	! t0_kref+0x2fcc:   	ldd	[%i0 + 0x18], %f30
	.word	0xbfa6483f	! t0_kref+0x2fd0:   	fadds	%f25, %f31, %f31
	.word	0xaa7b400d	! t0_kref+0x2fd4:   	sdiv	%o5, %o5, %l5
	.word	0xb5b686fc	! t0_kref+0x2fd8:   	fmul8ulx16	%f26, %f28, %f26
	.word	0x20800001	! t0_kref+0x2fdc:   	bn,a	_kref+0x2fe0
	.word	0xda266014	! t0_kref+0x2fe0:   	st	%o5, [%i1 + 0x14]
	.word	0xd44e4000	! t0_kref+0x2fe4:   	ldsb	[%i1], %o2
	.word	0xb5b6c67e	! t0_kref+0x2fe8:   	fmul8x16au	%f27, %f30, %f26
	.word	0xb9b78f9a	! t0_kref+0x2fec:   	for	%f30, %f26, %f28
	.word	0xb9b70918	! t0_kref+0x2ff0:   	faligndata	%f28, %f24, %f28
	.word	0xb9b00cd8	! t0_kref+0x2ff4:   	fnot2	%f24, %f28
	.word	0xb1b70918	! t0_kref+0x2ff8:   	faligndata	%f28, %f24, %f24
	.word	0xa783400d	! t0_kref+0x2ffc:   	wr	%o5, %o5, %gsr
	.word	0xf7066008	! t0_kref+0x3000:   	ld	[%i1 + 8], %f27
	.word	0xe606001c	! t0_kref+0x3004:   	ld	[%i0 + %i4], %l3
	.word	0xd640a02c	! t0_kref+0x3008:   	ldsw	[%g2 + 0x2c], %o3
	.word	0xe8064000	! t0_kref+0x300c:   	ld	[%i1], %l4
	.word	0xbda0055c	! t0_kref+0x3010:   	fsqrtd	%f28, %f30
	.word	0x9de3bfa0	! t0_kref+0x3014:   	save	%sp, -0x60, %sp
	.word	0xafee3a74	! t0_kref+0x3018:   	restore	%i0, -0x58c, %l7
	.word	0xe610a036	! t0_kref+0x301c:   	lduh	[%g2 + 0x36], %l3
	.word	0xbda0189f	! t0_kref+0x3020:   	fitos	%f31, %f30
	.word	0xf700a004	! t0_kref+0x3024:   	ld	[%g2 + 4], %f27
	.word	0xfd20a000	! t0_kref+0x3028:   	st	%f30, [%g2]
	.word	0xd2567ffe	! t0_kref+0x302c:   	ldsh	[%i1 - 2], %o1
	.word	0x91b3410d	! t0_kref+0x3030:   	edge32	%o5, %o5, %o0
	.word	0xae7b6842	! t0_kref+0x3034:   	sdiv	%o5, 0x842, %l7
	.word	0xec3e6008	! t0_kref+0x3038:   	std	%l6, [%i1 + 8]
	.word	0xff00a008	! t0_kref+0x303c:   	ld	[%g2 + 8], %f31
	.word	0xec0e2008	! t0_kref+0x3040:   	ldub	[%i0 + 8], %l6
	.word	0xe8067ff0	! t0_kref+0x3044:   	ld	[%i1 - 0x10], %l4
	.word	0xb3b00cff	! t0_kref+0x3048:   	fnot2s	%f31, %f25
	.word	0xda28a002	! t0_kref+0x304c:   	stb	%o5, [%g2 + 2]
	.word	0xbfa000bf	! t0_kref+0x3050:   	fnegs	%f31, %f31
	.word	0xb5a0193a	! t0_kref+0x3054:   	fstod	%f26, %f26
	.word	0xda30a034	! t0_kref+0x3058:   	sth	%o5, [%g2 + 0x34]
	.word	0xa6937d5b	! t0_kref+0x305c:   	orcc	%o5, -0x2a5, %l3
	.word	0xbba789bf	! t0_kref+0x3060:   	fdivs	%f30, %f31, %f29
	.word	0xbda709be	! t0_kref+0x3064:   	fdivs	%f28, %f30, %f30
	.word	0x93b705d8	! t0_kref+0x3068:   	fcmpeq32	%f28, %f24, %o1
	.word	0x95b340cd	! t0_kref+0x306c:   	edge16l	%o5, %o5, %o2
	.word	0xd04e001a	! t0_kref+0x3070:   	ldsb	[%i0 + %i2], %o0
	.word	0xda20a004	! t0_kref+0x3074:   	st	%o5, [%g2 + 4]
	.word	0x81af0ade	! t0_kref+0x3078:   	fcmped	%fcc0, %f28, %f30
	.word	0xf9be584d	! t0_kref+0x307c:   	stda	%f28, [%i1 + %o5]0xc2
	.word	0x25800001	! t0_kref+0x3080:   	fblg,a	_kref+0x3084
	.word	0xbda0013e	! t0_kref+0x3084:   	fabss	%f30, %f30
	.word	0xb9b00fc0	! t0_kref+0x3088:   	fone	%f28
	.word	0xbdb009bc	! t0_kref+0x308c:   	fexpand	%f28, %f30
	.word	0x91b68418	! t0_kref+0x3090:   	fcmple16	%f26, %f24, %o0
	.word	0x91b6841a	! t0_kref+0x3094:   	fcmple16	%f26, %f26, %o0
	.word	0xe64e8018	! t0_kref+0x3098:   	ldsb	[%i2 + %i0], %l3
	.word	0xe60e0000	! t0_kref+0x309c:   	ldub	[%i0], %l3
	.word	0xf1be5a1b	! t0_kref+0x30a0:   	stda	%f24, [%i1 + %i3]0xd0
	.word	0xbda0055a	! t0_kref+0x30a4:   	fsqrtd	%f26, %f30
	.word	0xafb3412d	! t0_kref+0x30a8:   	edge32n	%o5, %o5, %l7
	.word	0xd608a023	! t0_kref+0x30ac:   	ldub	[%g2 + 0x23], %o3
	.word	0xd606401c	! t0_kref+0x30b0:   	ld	[%i1 + %i4], %o3
	.word	0x87802080	! t0_kref+0x30b4:   	mov	0x80, %asi
	.word	0xb5b7c97e	! t0_kref+0x30b8:   	fpmerge	%f31, %f30, %f26
	call	SYM(t0_subr0)
	.word	0x969b7fd8	! t0_kref+0x30c0:   	xorcc	%o5, -0x28, %o3
	.word	0x8d83400d	! t0_kref+0x30c4:   	wr	%o5, %o5, %fprs
	.word	0xdaa8a03c	! t0_kref+0x30c8:   	stba	%o5, [%g2 + 0x3c]%asi
	.word	0xfba0a024	! t0_kref+0x30cc:   	sta	%f29, [%g2 + 0x24]%asi
	.word	0xb3a0053a	! t0_kref+0x30d0:   	fsqrts	%f26, %f25
	.word	0xac036d85	! t0_kref+0x30d4:   	add	%o5, 0xd85, %l6
	.word	0xd40e3ff8	! t0_kref+0x30d8:   	ldub	[%i0 - 8], %o2
	.word	0xa7b340cd	! t0_kref+0x30dc:   	edge16l	%o5, %o5, %l3
	.word	0xab44c000	! t0_kref+0x30e0:   	mov	%gsr, %l5
	.word	0xdaa8a031	! t0_kref+0x30e4:   	stba	%o5, [%g2 + 0x31]%asi
	.word	0xd24e200e	! t0_kref+0x30e8:   	ldsb	[%i0 + 0xe], %o1
	.word	0xea000019	! t0_kref+0x30ec:   	ld	[%g0 + %i1], %l5
	.word	0x901b7987	! t0_kref+0x30f0:   	xor	%o5, -0x679, %o0
	.word	0xecc8a009	! t0_kref+0x30f4:   	ldsba	[%g2 + 9]%asi, %l6
	.word	0xda762010	! t0_kref+0x30f8:   	stx	%o5, [%i0 + 0x10]
	.word	0x3c800004	! t0_kref+0x30fc:   	bpos,a	_kref+0x310c
	.word	0x94b3400d	! t0_kref+0x3100:   	orncc	%o5, %o5, %o2
	.word	0xd04e0000	! t0_kref+0x3104:   	ldsb	[%i0], %o0
	.word	0xb5b70f5a	! t0_kref+0x3108:   	fornot1	%f28, %f26, %f26
	.word	0x97b3416d	! t0_kref+0x310c:   	edge32ln	%o5, %o5, %o3
	.word	0xe608a015	! t0_kref+0x3110:   	ldub	[%g2 + 0x15], %l3
	.word	0xb5b78d9c	! t0_kref+0x3114:   	fxor	%f30, %f28, %f26
	.word	0xb5b6099a	! t0_kref+0x3118:   	bshuffle	%f24, %f26, %f26
	.word	0x91b34240	! t0_kref+0x311c:   	array16	%o5, %g0, %o0
	.word	0xb5a649bb	! t0_kref+0x3120:   	fdivs	%f25, %f27, %f26
	.word	0xd406401c	! t0_kref+0x3124:   	ld	[%i1 + %i4], %o2
	.word	0xfd00a034	! t0_kref+0x3128:   	ld	[%g2 + 0x34], %f30
	.word	0xec062010	! t0_kref+0x312c:   	ld	[%i0 + 0x10], %l6
	.word	0xd090a01a	! t0_kref+0x3130:   	lduha	[%g2 + 0x1a]%asi, %o0
	.word	0xbdb6c67a	! t0_kref+0x3134:   	fmul8x16au	%f27, %f26, %f30
	.word	0xb1b70fb9	! t0_kref+0x3138:   	fors	%f28, %f25, %f24
	.word	0xdaa8a010	! t0_kref+0x313c:   	stba	%o5, [%g2 + 0x10]%asi
	.word	0xb1a0015c	! t0_kref+0x3140:   	fabsd	%f28, %f24
	.word	0x23800005	! t0_kref+0x3144:   	fbne,a	_kref+0x3158
	.word	0xb7a609b8	! t0_kref+0x3148:   	fdivs	%f24, %f24, %f27
	.word	0xbfb007bc	! t0_kref+0x314c:   	fpackfix	%f28, %f31
	.word	0xb1a789bf	! t0_kref+0x3150:   	fdivs	%f30, %f31, %f24
	.word	0xd0066000	! t0_kref+0x3154:   	ld	[%i1], %o0
	.word	0xe84e7fe4	! t0_kref+0x3158:   	ldsb	[%i1 - 0x1c], %l4
	.word	0xec40a00c	! t0_kref+0x315c:   	ldsw	[%g2 + 0xc], %l6
	.word	0xb1b68fbd	! t0_kref+0x3160:   	fors	%f26, %f29, %f24
	.word	0x91b340cd	! t0_kref+0x3164:   	edge16l	%o5, %o5, %o0
	.word	0xb1b687d8	! t0_kref+0x3168:   	pdist	%f26, %f24, %f24
	.word	0xb7a01a5c	! t0_kref+0x316c:   	fdtoi	%f28, %f27
	.word	0xb9b00f1e	! t0_kref+0x3170:   	fsrc2	%f30, %f28
	.word	0x97408000	! t0_kref+0x3174:   	mov	%ccr, %o3
	.word	0xe03e3ff8	! t0_kref+0x3178:   	std	%l0, [%i0 - 8]
	.word	0xb9b60758	! t0_kref+0x317c:   	fpack32	%f24, %f24, %f28
	.word	0x94db400d	! t0_kref+0x3180:   	smulcc	%o5, %o5, %o2
	.word	0xa7b60418	! t0_kref+0x3184:   	fcmple16	%f24, %f24, %l3
	.word	0xf180a02c	! t0_kref+0x3188:   	lda	[%g2 + 0x2c]%asi, %f24
	.word	0xb7b7cfbd	! t0_kref+0x318c:   	fors	%f31, %f29, %f27
	.word	0xee500019	! t0_kref+0x3190:   	ldsh	[%g0 + %i1], %l7
	.word	0xfd070018	! t0_kref+0x3194:   	ld	[%i4 + %i0], %f30
	.word	0xf780a02c	! t0_kref+0x3198:   	lda	[%g2 + 0x2c]%asi, %f27
	.word	0xbda64d3d	! t0_kref+0x319c:   	fsmuld	%f25, %f29, %f30
	.word	0x92937b39	! t0_kref+0x31a0:   	orcc	%o5, -0x4c7, %o1
	.word	0xbdb78e5a	! t0_kref+0x31a4:   	fxnor	%f30, %f26, %f30
	.word	0xadb3410d	! t0_kref+0x31a8:   	edge32	%o5, %o5, %l6
	.word	0xfb80a018	! t0_kref+0x31ac:   	lda	[%g2 + 0x18]%asi, %f29
	.word	0xdaa8a00e	! t0_kref+0x31b0:   	stba	%o5, [%g2 + 0xe]%asi
	.word	0xaf336004	! t0_kref+0x31b4:   	srl	%o5, 0x4, %l7
	.word	0x8583400d	! t0_kref+0x31b8:   	wr	%o5, %o5, %ccr
	.word	0xfb20a020	! t0_kref+0x31bc:   	st	%f29, [%g2 + 0x20]
	.word	0x20800006	! t0_kref+0x31c0:   	bn,a	_kref+0x31d8
	.word	0x96f3400d	! t0_kref+0x31c4:   	udivcc	%o5, %o5, %o3
	.word	0xec4e0000	! t0_kref+0x31c8:   	ldsb	[%i0], %l6
	.word	0xbdb00fe0	! t0_kref+0x31cc:   	fones	%f30
	.word	0xf91e001d	! t0_kref+0x31d0:   	ldd	[%i0 + %i5], %f28
	.word	0xbfa0003f	! t0_kref+0x31d4:   	fmovs	%f31, %f31
	.word	0xb5a0193e	! t0_kref+0x31d8:   	fstod	%f30, %f26
	.word	0x95b605d8	! t0_kref+0x31dc:   	fcmpeq32	%f24, %f24, %o2
	.word	0xb5a789b8	! t0_kref+0x31e0:   	fdivs	%f30, %f24, %f26
	.word	0xbda0053f	! t0_kref+0x31e4:   	fsqrts	%f31, %f30
	.word	0xd00e3fff	! t0_kref+0x31e8:   	ldub	[%i0 - 1], %o0
	.word	0xbdb60ede	! t0_kref+0x31ec:   	fornot2	%f24, %f30, %f30
	.word	0xbfa689bd	! t0_kref+0x31f0:   	fdivs	%f26, %f29, %f31
	.word	0x93b3432d	! t0_kref+0x31f4:   	bmask	%o5, %o5, %o1
	.word	0xbda0055c	! t0_kref+0x31f8:   	fsqrtd	%f28, %f30
	.word	0x91b6045e	! t0_kref+0x31fc:   	fcmpne16	%f24, %f30, %o0
	.word	0xbfa00038	! t0_kref+0x3200:   	fmovs	%f24, %f31
	.word	0x878020d0	! t0_kref+0x3204:   	mov	0xd0, %asi
	.word	0x9570000d	! t0_kref+0x3208:   	popc	%o5, %o2
	.word	0x878020e0	! t0_kref+0x320c:   	mov	0xe0, %asi
	.word	0xda20a000	! t0_kref+0x3210:   	st	%o5, [%g2]
	.word	0x913b6013	! t0_kref+0x3214:   	sra	%o5, 0x13, %o0
	.word	0xec0e4000	! t0_kref+0x3218:   	ldub	[%i1], %l6
	.word	0xf9be184d	! t0_kref+0x321c:   	stda	%f28, [%i0 + %o5]0xc2
	.word	0xb1a789b9	! t0_kref+0x3220:   	fdivs	%f30, %f25, %f24
	.word	0xbda018d8	! t0_kref+0x3224:   	fdtos	%f24, %f30
	.word	0x81b01024	! t0_kref+0x3228:   	siam	0x4
	.word	0xb1b70fbe	! t0_kref+0x322c:   	fors	%f28, %f30, %f24
	.word	0xd0567ff4	! t0_kref+0x3230:   	ldsh	[%i1 - 0xc], %o0
	.word	0x81ae0a5c	! t0_kref+0x3234:   	fcmpd	%fcc0, %f24, %f28
	.word	0xec1e6000	! t0_kref+0x3238:   	ldd	[%i1], %l6
	.word	0xb9a68d3e	! t0_kref+0x323c:   	fsmuld	%f26, %f30, %f28
	.word	0xda2e7fe3	! t0_kref+0x3240:   	stb	%o5, [%i1 - 0x1d]
	.word	0x90bb400d	! t0_kref+0x3244:   	xnorcc	%o5, %o5, %o0
	.word	0x35800003	! t0_kref+0x3248:   	fbue,a	_kref+0x3254
	.word	0xd410a022	! t0_kref+0x324c:   	lduh	[%g2 + 0x22], %o2
	.word	0xaef36272	! t0_kref+0x3250:   	udivcc	%o5, 0x272, %l7
	.word	0xb1a689bd	! t0_kref+0x3254:   	fdivs	%f26, %f29, %f24
	.word	0xfba01018	! t0_kref+0x3258:   	sta	%f29, [%g0 + %i0]0x80
	.word	0x97b7845a	! t0_kref+0x325c:   	fcmpne16	%f30, %f26, %o3
	.word	0xf100a010	! t0_kref+0x3260:   	ld	[%g2 + 0x10], %f24
	.word	0x3b800006	! t0_kref+0x3264:   	fble,a	_kref+0x327c
	.word	0xe80e6008	! t0_kref+0x3268:   	ldub	[%i1 + 8], %l4
	.word	0xc568a04f	! t0_kref+0x326c:   	prefetch	%g2 + 0x4f, 2
	.word	0x91b3416d	! t0_kref+0x3270:   	edge32ln	%o5, %o5, %o0
	.word	0x81af8ada	! t0_kref+0x3274:   	fcmped	%fcc0, %f30, %f26
	.word	0xa78374b6	! t0_kref+0x3278:   	wr	%o5, 0xfffff4b6, %gsr
	.word	0x86102002	! t0_kref+0x327c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x3280:   	bne,a	_kref+0x3280
	.word	0x86a0e001	! t0_kref+0x3284:   	subcc	%g3, 1, %g3
	.word	0xd0563ff4	! t0_kref+0x3288:   	ldsh	[%i0 - 0xc], %o0
	.word	0xbdb78f5e	! t0_kref+0x328c:   	fornot1	%f30, %f30, %f30
	.word	0xbfb00f39	! t0_kref+0x3290:   	fsrc2s	%f25, %f31
	.word	0xe43e7fe8	! t0_kref+0x3294:   	std	%l2, [%i1 - 0x18]
	.word	0xb3b0077a	! t0_kref+0x3298:   	fpack16	%f26, %f25
	.word	0xb5b68c9e	! t0_kref+0x329c:   	fandnot2	%f26, %f30, %f26
	.word	0xd008a005	! t0_kref+0x32a0:   	ldub	[%g2 + 5], %o0
	.word	0xa9408000	! t0_kref+0x32a4:   	mov	%ccr, %l4
	.word	0xac0b61b7	! t0_kref+0x32a8:   	and	%o5, 0x1b7, %l6
	.word	0xabb6051c	! t0_kref+0x32ac:   	fcmpgt16	%f24, %f28, %l5
	.word	0xe3f6100d	! t0_kref+0x32b0:   	casxa	[%i0]0x80, %o5, %l1
	.word	0xd050a01c	! t0_kref+0x32b4:   	ldsh	[%g2 + 0x1c], %o0
	.word	0xd040a00c	! t0_kref+0x32b8:   	ldsw	[%g2 + 0xc], %o0
	.word	0xf1be588d	! t0_kref+0x32bc:   	stda	%f24, [%i1 + %o5]0xc4
	.word	0xb1a0055c	! t0_kref+0x32c0:   	fsqrtd	%f28, %f24
	.word	0xe64e6000	! t0_kref+0x32c4:   	ldsb	[%i1], %l3
	.word	0xe8100018	! t0_kref+0x32c8:   	lduh	[%g0 + %i0], %l4
	.word	0xec40a03c	! t0_kref+0x32cc:   	ldsw	[%g2 + 0x3c], %l6
	.word	0xda30a022	! t0_kref+0x32d0:   	sth	%o5, [%g2 + 0x22]
	.word	0xec167ffe	! t0_kref+0x32d4:   	lduh	[%i1 - 2], %l6
	.word	0xda20a03c	! t0_kref+0x32d8:   	st	%o5, [%g2 + 0x3c]
	.word	0x81ae8a58	! t0_kref+0x32dc:   	fcmpd	%fcc0, %f26, %f24
	.word	0xd450a008	! t0_kref+0x32e0:   	ldsh	[%g2 + 8], %o2
	.word	0xb1b70679	! t0_kref+0x32e4:   	fmul8x16au	%f28, %f25, %f24
	.word	0xda28a014	! t0_kref+0x32e8:   	stb	%o5, [%g2 + 0x14]
	.word	0xe606601c	! t0_kref+0x32ec:   	ld	[%i1 + 0x1c], %l3
	.word	0xd048a02d	! t0_kref+0x32f0:   	ldsb	[%g2 + 0x2d], %o0
	.word	0xb9a688d8	! t0_kref+0x32f4:   	fsubd	%f26, %f24, %f28
	.word	0xa82b400d	! t0_kref+0x32f8:   	andn	%o5, %o5, %l4
	.word	0xb3a709b9	! t0_kref+0x32fc:   	fdivs	%f28, %f25, %f25
	.word	0xb5b7891a	! t0_kref+0x3300:   	faligndata	%f30, %f26, %f26
	.word	0xb5b00f1c	! t0_kref+0x3304:   	fsrc2	%f28, %f26
	.word	0x91408000	! t0_kref+0x3308:   	mov	%ccr, %o0
	.word	0xb9a0191e	! t0_kref+0x330c:   	fitod	%f30, %f28
	.word	0xb1b78e80	! t0_kref+0x3310:   	fsrc1	%f30, %f24
	.word	0xee56600c	! t0_kref+0x3314:   	ldsh	[%i1 + 0xc], %l7
	.word	0x9613400d	! t0_kref+0x3318:   	or	%o5, %o5, %o3
	.word	0xfd00a008	! t0_kref+0x331c:   	ld	[%g2 + 8], %f30
	.word	0xa8f3400d	! t0_kref+0x3320:   	udivcc	%o5, %o5, %l4
	.word	0xda30a026	! t0_kref+0x3324:   	sth	%o5, [%g2 + 0x26]
	.word	0xda28a02e	! t0_kref+0x3328:   	stb	%o5, [%g2 + 0x2e]
	.word	0x81af0a3c	! t0_kref+0x332c:   	fcmps	%fcc0, %f28, %f28
	.word	0x90a3400d	! t0_kref+0x3330:   	subcc	%o5, %o5, %o0
	.word	0x93400000	! t0_kref+0x3334:   	mov	%y, %o1
	call	1f
	.empty
	.word	0xe64e3fe5	! t0_kref+0x333c:   	ldsb	[%i0 - 0x1b], %l3
1:	.word	0xb5a0189c	! t0_kref+0x3340:   	fitos	%f28, %f26
	.word	0xb5b60d9c	! t0_kref+0x3344:   	fxor	%f24, %f28, %f26
	.word	0xafb78518	! t0_kref+0x3348:   	fcmpgt16	%f30, %f24, %l7
	.word	0xb5a709b9	! t0_kref+0x334c:   	fdivs	%f28, %f25, %f26
	.word	0xe600a028	! t0_kref+0x3350:   	ld	[%g2 + 0x28], %l3
	.word	0xd04e0000	! t0_kref+0x3354:   	ldsb	[%i0], %o0
	.word	0xadb6859e	! t0_kref+0x3358:   	fcmpgt32	%f26, %f30, %l6
	.word	0xff20a028	! t0_kref+0x335c:   	st	%f31, [%g2 + 0x28]
	.word	0xe600a03c	! t0_kref+0x3360:   	ld	[%g2 + 0x3c], %l3
	.word	0xfd00a014	! t0_kref+0x3364:   	ld	[%g2 + 0x14], %f30
	.word	0xd008a015	! t0_kref+0x3368:   	ldub	[%g2 + 0x15], %o0
	.word	0xc16e7fe0	! t0_kref+0x336c:   	prefetch	%i1 - 0x20, 0
	.word	0xd050a026	! t0_kref+0x3370:   	ldsh	[%g2 + 0x26], %o0
	.word	0xda28a031	! t0_kref+0x3374:   	stb	%o5, [%g2 + 0x31]
	.word	0xee4e201c	! t0_kref+0x3378:   	ldsb	[%i0 + 0x1c], %l7
	.word	0xa813400d	! t0_kref+0x337c:   	or	%o5, %o5, %l4
	.word	0xd048a01e	! t0_kref+0x3380:   	ldsb	[%g2 + 0x1e], %o0
	.word	0xda28a023	! t0_kref+0x3384:   	stb	%o5, [%g2 + 0x23]
	.word	0xff20a024	! t0_kref+0x3388:   	st	%f31, [%g2 + 0x24]
	.word	0xee16c018	! t0_kref+0x338c:   	lduh	[%i3 + %i0], %l7
	.word	0xda28a033	! t0_kref+0x3390:   	stb	%o5, [%g2 + 0x33]
	.word	0xd010a018	! t0_kref+0x3394:   	lduh	[%g2 + 0x18], %o0
	.word	0xacb3400d	! t0_kref+0x3398:   	orncc	%o5, %o5, %l6
	.word	0x81ae0ad8	! t0_kref+0x339c:   	fcmped	%fcc0, %f24, %f24
	.word	0xb9b74fb9	! t0_kref+0x33a0:   	fors	%f29, %f25, %f28
	.word	0xe76e2008	! t0_kref+0x33a4:   	prefetch	%i0 + 8, 19
	.word	0xf9060000	! t0_kref+0x33a8:   	ld	[%i0], %f28
	.word	0xb7a749bb	! t0_kref+0x33ac:   	fdivs	%f29, %f27, %f27
	.word	0xec063ff8	! t0_kref+0x33b0:   	ld	[%i0 - 8], %l6
	.word	0xfb063fe0	! t0_kref+0x33b4:   	ld	[%i0 - 0x20], %f29
	.word	0xee167ff2	! t0_kref+0x33b8:   	lduh	[%i1 - 0xe], %l7
	.word	0xb1a018da	! t0_kref+0x33bc:   	fdtos	%f26, %f24
	.word	0x90b3400d	! t0_kref+0x33c0:   	orncc	%o5, %o5, %o0
	.word	0xea4e401a	! t0_kref+0x33c4:   	ldsb	[%i1 + %i2], %l5
	.word	0xe6080018	! t0_kref+0x33c8:   	ldub	[%g0 + %i0], %l3
	.word	0xf91e401d	! t0_kref+0x33cc:   	ldd	[%i1 + %i5], %f28
	.word	0xb9b6497a	! t0_kref+0x33d0:   	fpmerge	%f25, %f26, %f28
	.word	0xb7b60dba	! t0_kref+0x33d4:   	fxors	%f24, %f26, %f27
	.word	0x91b34280	! t0_kref+0x33d8:   	array32	%o5, %g0, %o0
	.word	0xbda7c9bc	! t0_kref+0x33dc:   	fdivs	%f31, %f28, %f30
	.word	0xabb6045a	! t0_kref+0x33e0:   	fcmpne16	%f24, %f26, %l5
	.word	0x97b3404d	! t0_kref+0x33e4:   	edge8l	%o5, %o5, %o3
	.word	0xb1a789bb	! t0_kref+0x33e8:   	fdivs	%f30, %f27, %f24
	.word	0xf1070018	! t0_kref+0x33ec:   	ld	[%i4 + %i0], %f24
	.word	0xfd1e6008	! t0_kref+0x33f0:   	ldd	[%i1 + 8], %f30
	.word	0xd250a008	! t0_kref+0x33f4:   	ldsh	[%g2 + 8], %o1
	.word	0xad418000	! t0_kref+0x33f8:   	mov	%fprs, %l6
	.word	0xda362008	! t0_kref+0x33fc:   	sth	%o5, [%i0 + 8]
	.word	0xfb064000	! t0_kref+0x3400:   	ld	[%i1], %f29
	.word	0xec08a00a	! t0_kref+0x3404:   	ldub	[%g2 + 0xa], %l6
	.word	0xda28a007	! t0_kref+0x3408:   	stb	%o5, [%g2 + 7]
	.word	0xf500a004	! t0_kref+0x340c:   	ld	[%g2 + 4], %f26
	.word	0xb9a01938	! t0_kref+0x3410:   	fstod	%f24, %f28
	.word	0x93b3410d	! t0_kref+0x3414:   	edge32	%o5, %o5, %o1
	.word	0xbda0055e	! t0_kref+0x3418:   	fsqrtd	%f30, %f30
	.word	0xee4e6007	! t0_kref+0x341c:   	ldsb	[%i1 + 7], %l7
	.word	0xee080019	! t0_kref+0x3420:   	ldub	[%g0 + %i1], %l7
	.word	0x2d800006	! t0_kref+0x3424:   	fbg,a	_kref+0x343c
	.word	0x001fffff	! t0_kref+0x3428:   	illtrap	0x1fffff
	.word	0xbda0053b	! t0_kref+0x342c:   	fsqrts	%f27, %f30
	.word	0xea563ff4	! t0_kref+0x3430:   	ldsh	[%i0 - 0xc], %l5
	.word	0xb1a0055c	! t0_kref+0x3434:   	fsqrtd	%f28, %f24
	.word	0xab70000d	! t0_kref+0x3438:   	popc	%o5, %l5
	.word	0xfb00a024	! t0_kref+0x343c:   	ld	[%g2 + 0x24], %f29
	.word	0xb9a7c9bc	! t0_kref+0x3440:   	fdivs	%f31, %f28, %f28
	.word	0x96db6f4a	! t0_kref+0x3444:   	smulcc	%o5, 0xf4a, %o3
	.word	0xd4567ff2	! t0_kref+0x3448:   	ldsh	[%i1 - 0xe], %o2
	.word	0xb1a01a5a	! t0_kref+0x344c:   	fdtoi	%f26, %f24
	.word	0x38800004	! t0_kref+0x3450:   	bgu,a	_kref+0x3460
	.word	0xda20a028	! t0_kref+0x3454:   	st	%o5, [%g2 + 0x28]
	.word	0xabb3414d	! t0_kref+0x3458:   	edge32l	%o5, %o5, %l5
	.word	0xf100a034	! t0_kref+0x345c:   	ld	[%g2 + 0x34], %f24
	.word	0xbba689bb	! t0_kref+0x3460:   	fdivs	%f26, %f27, %f29
	.word	0x81ae0a5c	! t0_kref+0x3464:   	fcmpd	%fcc0, %f24, %f28
	.word	0xa7b3412d	! t0_kref+0x3468:   	edge32n	%o5, %o5, %l3
	.word	0xda200019	! t0_kref+0x346c:   	st	%o5, [%g0 + %i1]
	.word	0xbda0193b	! t0_kref+0x3470:   	fstod	%f27, %f30
	.word	0xec0e7fe5	! t0_kref+0x3474:   	ldub	[%i1 - 0x1b], %l6
	.word	0xda20a01c	! t0_kref+0x3478:   	st	%o5, [%g2 + 0x1c]
	.word	0xa7b34280	! t0_kref+0x347c:   	array32	%o5, %g0, %l3
	.word	0xfd067fe4	! t0_kref+0x3480:   	ld	[%i1 - 0x1c], %f30
	.word	0xda28a034	! t0_kref+0x3484:   	stb	%o5, [%g2 + 0x34]
	.word	0xda20a010	! t0_kref+0x3488:   	st	%o5, [%g2 + 0x10]
	.word	0xec08a02e	! t0_kref+0x348c:   	ldub	[%g2 + 0x2e], %l6
	.word	0xe808a022	! t0_kref+0x3490:   	ldub	[%g2 + 0x22], %l4
	.word	0xfb20a010	! t0_kref+0x3494:   	st	%f29, [%g2 + 0x10]
	.word	0xf120a028	! t0_kref+0x3498:   	st	%f24, [%g2 + 0x28]
	.word	0xe848a02c	! t0_kref+0x349c:   	ldsb	[%g2 + 0x2c], %l4
	.word	0xa62b640d	! t0_kref+0x34a0:   	andn	%o5, 0x40d, %l3
	.word	0xd250a022	! t0_kref+0x34a4:   	ldsh	[%g2 + 0x22], %o1
	.word	0xf91e3ff8	! t0_kref+0x34a8:   	ldd	[%i0 - 8], %f28
	.word	0x91b34240	! t0_kref+0x34ac:   	array16	%o5, %g0, %o0
	.word	0xbdb60a5c	! t0_kref+0x34b0:   	fpadd32	%f24, %f28, %f30
	.word	0xa7336016	! t0_kref+0x34b4:   	srl	%o5, 0x16, %l3
	.word	0xf51e3ff8	! t0_kref+0x34b8:   	ldd	[%i0 - 8], %f26
	.word	0xbdb646bb	! t0_kref+0x34bc:   	fmul8x16al	%f25, %f27, %f30
	.word	0xd456001b	! t0_kref+0x34c0:   	ldsh	[%i0 + %i3], %o2
	.word	0xb5a0193c	! t0_kref+0x34c4:   	fstod	%f28, %f26
	.word	0xf920a020	! t0_kref+0x34c8:   	st	%f28, [%g2 + 0x20]
	.word	0xf19e9a19	! t0_kref+0x34cc:   	ldda	[%i2 + %i1]0xd0, %f24
	.word	0xf120a004	! t0_kref+0x34d0:   	st	%f24, [%g2 + 4]
	.word	0xee10a018	! t0_kref+0x34d4:   	lduh	[%g2 + 0x18], %l7
	.word	0xd01f4019	! t0_kref+0x34d8:   	ldd	[%i5 + %i1], %o0
	.word	0x91b340cd	! t0_kref+0x34dc:   	edge16l	%o5, %o5, %o0
	.word	0x81834000	! t0_kref+0x34e0:   	wr	%o5, %g0, %y
	.word	0xe80e3fef	! t0_kref+0x34e4:   	ldub	[%i0 - 0x11], %l4
	.word	0xd44e401a	! t0_kref+0x34e8:   	ldsb	[%i1 + %i2], %o2
	.word	0xaae3400d	! t0_kref+0x34ec:   	subccc	%o5, %o5, %l5
	.word	0xd050a004	! t0_kref+0x34f0:   	ldsh	[%g2 + 4], %o0
	.word	0x90c3400d	! t0_kref+0x34f4:   	addccc	%o5, %o5, %o0
	.word	0xbbb70a7c	! t0_kref+0x34f8:   	fpadd32s	%f28, %f28, %f29
	.word	0xbda0055c	! t0_kref+0x34fc:   	fsqrtd	%f28, %f30
	.word	0xd24e8019	! t0_kref+0x3500:   	ldsb	[%i2 + %i1], %o1
	.word	0xe810a018	! t0_kref+0x3504:   	lduh	[%g2 + 0x18], %l4
	.word	0xa6bb7007	! t0_kref+0x3508:   	xnorcc	%o5, -0xff9, %l3
	.word	0xb5b68ea0	! t0_kref+0x350c:   	fsrc1s	%f26, %f26
	.word	0xb1b6899a	! t0_kref+0x3510:   	bshuffle	%f26, %f26, %f24
	.word	0xea062010	! t0_kref+0x3514:   	ld	[%i0 + 0x10], %l5
	.word	0xa8bb400d	! t0_kref+0x3518:   	xnorcc	%o5, %o5, %l4
	.word	0xad23400d	! t0_kref+0x351c:   	mulscc	%o5, %o5, %l6
	.word	0xda2e7feb	! t0_kref+0x3520:   	stb	%o5, [%i1 - 0x15]
	.word	0xe8062008	! t0_kref+0x3524:   	ld	[%i0 + 8], %l4
	.word	0xbfa789bf	! t0_kref+0x3528:   	fdivs	%f30, %f31, %f31
	.word	0x37800005	! t0_kref+0x352c:   	fbge,a	_kref+0x3540
	.word	0xabb7841e	! t0_kref+0x3530:   	fcmple16	%f30, %f30, %l5
	.word	0xf726600c	! t0_kref+0x3534:   	st	%f27, [%i1 + 0xc]
	.word	0xd2064000	! t0_kref+0x3538:   	ld	[%i1], %o1
	.word	0xbda01918	! t0_kref+0x353c:   	fitod	%f24, %f30
	.word	0xe8063fe8	! t0_kref+0x3540:   	ld	[%i0 - 0x18], %l4
	.word	0xbfa01a5a	! t0_kref+0x3544:   	fdtoi	%f26, %f31
	.word	0xfb00a020	! t0_kref+0x3548:   	ld	[%g2 + 0x20], %f29
	.word	0xabb3412d	! t0_kref+0x354c:   	edge32n	%o5, %o5, %l5
	.word	0xda20a038	! t0_kref+0x3550:   	st	%o5, [%g2 + 0x38]
	.word	0x81ae8a58	! t0_kref+0x3554:   	fcmpd	%fcc0, %f26, %f24
	.word	0xb3a609bd	! t0_kref+0x3558:   	fdivs	%f24, %f29, %f25
	.word	0xee000018	! t0_kref+0x355c:   	ld	[%g0 + %i0], %l7
	.word	0xd4164000	! t0_kref+0x3560:   	lduh	[%i1], %o2
	.word	0xbdb686bd	! t0_kref+0x3564:   	fmul8x16al	%f26, %f29, %f30
	.word	0xe608a018	! t0_kref+0x3568:   	ldub	[%g2 + 0x18], %l3
	.word	0xb1a608d8	! t0_kref+0x356c:   	fsubd	%f24, %f24, %f24
	.word	0xf920a03c	! t0_kref+0x3570:   	st	%f28, [%g2 + 0x3c]
	.word	0xea4e7fec	! t0_kref+0x3574:   	ldsb	[%i1 - 0x14], %l5
	.word	0xd4080018	! t0_kref+0x3578:   	ldub	[%g0 + %i0], %o2
	.word	0xea08a015	! t0_kref+0x357c:   	ldub	[%g2 + 0x15], %l5
	.word	0xb5a0015a	! t0_kref+0x3580:   	fabsd	%f26, %f26
	.word	0xb5b7067b	! t0_kref+0x3584:   	fmul8x16au	%f28, %f27, %f26
	.word	0xff00a024	! t0_kref+0x3588:   	ld	[%g2 + 0x24], %f31
	.word	0xaa2b400d	! t0_kref+0x358c:   	andn	%o5, %o5, %l5
	.word	0xda28a022	! t0_kref+0x3590:   	stb	%o5, [%g2 + 0x22]
	.word	0xd4060000	! t0_kref+0x3594:   	ld	[%i0], %o2
	.word	0xea500018	! t0_kref+0x3598:   	ldsh	[%g0 + %i0], %l5
	.word	0xe656c018	! t0_kref+0x359c:   	ldsh	[%i3 + %i0], %l3
	.word	0xb5a788de	! t0_kref+0x35a0:   	fsubd	%f30, %f30, %f26
	.word	0x133919bf	! t0_kref+0x35a4:   	sethi	%hi(0xe466fc00), %o1
	.word	0x81af0a5a	! t0_kref+0x35a8:   	fcmpd	%fcc0, %f28, %f26
	.word	0xd6164000	! t0_kref+0x35ac:   	lduh	[%i1], %o3
	.word	0xd2080018	! t0_kref+0x35b0:   	ldub	[%g0 + %i0], %o1
	.word	0xf91e3ff0	! t0_kref+0x35b4:   	ldd	[%i0 - 0x10], %f28
	.word	0xd4d01018	! t0_kref+0x35b8:   	ldsha	[%g0 + %i0]0x80, %o2
	.word	0xb1a0193b	! t0_kref+0x35bc:   	fstod	%f27, %f24
	.word	0xb1b7c6bc	! t0_kref+0x35c0:   	fmul8x16al	%f31, %f28, %f24
	.word	0xb1b00cd8	! t0_kref+0x35c4:   	fnot2	%f24, %f24
	.word	0xd640a014	! t0_kref+0x35c8:   	ldsw	[%g2 + 0x14], %o3
	.word	0xec16001b	! t0_kref+0x35cc:   	lduh	[%i0 + %i3], %l6
	.word	0xb9b7891c	! t0_kref+0x35d0:   	faligndata	%f30, %f28, %f28
	.word	0xd4063fec	! t0_kref+0x35d4:   	ld	[%i0 - 0x14], %o2
	.word	0xa7b3416d	! t0_kref+0x35d8:   	edge32ln	%o5, %o5, %l3
	.word	0xb3b7ccba	! t0_kref+0x35dc:   	fandnot2s	%f31, %f26, %f25
	.word	0xb1b00fc0	! t0_kref+0x35e0:   	fone	%f24
	.word	0xe6000018	! t0_kref+0x35e4:   	ld	[%g0 + %i0], %l3
	.word	0x900b400d	! t0_kref+0x35e8:   	and	%o5, %o5, %o0
	.word	0xec40a02c	! t0_kref+0x35ec:   	ldsw	[%g2 + 0x2c], %l6
	.word	0xf11e401d	! t0_kref+0x35f0:   	ldd	[%i1 + %i5], %f24
	.word	0xbda649bb	! t0_kref+0x35f4:   	fdivs	%f25, %f27, %f30
	.word	0xbdb7067d	! t0_kref+0x35f8:   	fmul8x16au	%f28, %f29, %f30
	.word	0xa8f3400d	! t0_kref+0x35fc:   	udivcc	%o5, %o5, %l4
	.word	0xbfb6cdfd	! t0_kref+0x3600:   	fnands	%f27, %f29, %f31
	.word	0xda367ff0	! t0_kref+0x3604:   	sth	%o5, [%i1 - 0x10]
	.word	0xda28a01a	! t0_kref+0x3608:   	stb	%o5, [%g2 + 0x1a]
	.word	0xc368a089	! t0_kref+0x360c:   	prefetch	%g2 + 0x89, 1
	.word	0xe8be501d	! t0_kref+0x3610:   	stda	%l4, [%i1 + %i5]0x80
	.word	0xb5a0053a	! t0_kref+0x3614:   	fsqrts	%f26, %f26
	.word	0xda270018	! t0_kref+0x3618:   	st	%o5, [%i4 + %i0]
	.word	0xe806200c	! t0_kref+0x361c:   	ld	[%i0 + 0xc], %l4
	.word	0x97b3408d	! t0_kref+0x3620:   	edge16	%o5, %o5, %o3
	.word	0x81da000d	! t0_kref+0x3624:   	flush	%o0 + %o5
	.word	0x97b3432d	! t0_kref+0x3628:   	bmask	%o5, %o5, %o3
	.word	0xafb705da	! t0_kref+0x362c:   	fcmpeq32	%f28, %f26, %l7
	.word	0xb5b00fe0	! t0_kref+0x3630:   	fones	%f26
	.word	0xc807bfec	! t0_kref+0x3634:   	ld	[%fp - 0x14], %g4
	.word	0xf320a02c	! t0_kref+0x3638:   	st	%f25, [%g2 + 0x2c]
	.word	0xd2067fe4	! t0_kref+0x363c:   	ld	[%i1 - 0x1c], %o1
	.word	0xbfa01a3d	! t0_kref+0x3640:   	fstoi	%f29, %f31
	.word	0xae23400d	! t0_kref+0x3644:   	sub	%o5, %o5, %l7
	.word	0xe81f4018	! t0_kref+0x3648:   	ldd	[%i5 + %i0], %l4
	.word	0xf1be184d	! t0_kref+0x364c:   	stda	%f24, [%i0 + %o5]0xc2
	.word	0xae5b400d	! t0_kref+0x3650:   	smul	%o5, %o5, %l7
	.word	0xb5b60c58	! t0_kref+0x3654:   	fnor	%f24, %f24, %f26
	.word	0xb1b68a7f	! t0_kref+0x3658:   	fpadd32s	%f26, %f31, %f24
	.word	0xe01e7ff8	! t0_kref+0x365c:   	ldd	[%i1 - 8], %l0
	.word	0xe6066014	! t0_kref+0x3660:   	ld	[%i1 + 0x14], %l3
	.word	0xf51e001d	! t0_kref+0x3664:   	ldd	[%i0 + %i5], %f26
	.word	0xd2067fe8	! t0_kref+0x3668:   	ld	[%i1 - 0x18], %o1
	.word	0xda30a012	! t0_kref+0x366c:   	sth	%o5, [%g2 + 0x12]
	.word	0xb9a0055c	! t0_kref+0x3670:   	fsqrtd	%f28, %f28
	.word	0xd240a01c	! t0_kref+0x3674:   	ldsw	[%g2 + 0x1c], %o1
	.word	0xb5a00039	! t0_kref+0x3678:   	fmovs	%f25, %f26
	.word	0xbda0055c	! t0_kref+0x367c:   	fsqrtd	%f28, %f30
	.word	0xbdb70db8	! t0_kref+0x3680:   	fxors	%f28, %f24, %f30
	.word	0xf1180019	! t0_kref+0x3684:   	ldd	[%g0 + %i1], %f24
	.word	0x93400000	! t0_kref+0x3688:   	mov	%y, %o1
	.word	0xf99f1a18	! t0_kref+0x368c:   	ldda	[%i4 + %i0]0xd0, %f28
	.word	0xea06401c	! t0_kref+0x3690:   	ld	[%i1 + %i4], %l5
	.word	0xb1a68d3f	! t0_kref+0x3694:   	fsmuld	%f26, %f31, %f24
	.word	0x95408000	! t0_kref+0x3698:   	mov	%ccr, %o2
	.word	0xd6500018	! t0_kref+0x369c:   	ldsh	[%g0 + %i0], %o3
	.word	0xd44e001a	! t0_kref+0x36a0:   	ldsb	[%i0 + %i2], %o2
	.word	0xbfa01899	! t0_kref+0x36a4:   	fitos	%f25, %f31
	.word	0xda30a014	! t0_kref+0x36a8:   	sth	%o5, [%g2 + 0x14]
	.word	0x95b3434d	! t0_kref+0x36ac:   	alignaddrl	%o5, %o5, %o2
	.word	0xfb00a000	! t0_kref+0x36b0:   	ld	[%g2], %f29
	.word	0xda20a008	! t0_kref+0x36b4:   	st	%o5, [%g2 + 8]
	.word	0xd64e3ff8	! t0_kref+0x36b8:   	ldsb	[%i0 - 8], %o3
	.word	0xaa5b6885	! t0_kref+0x36bc:   	smul	%o5, 0x885, %l5
	.word	0xd2080018	! t0_kref+0x36c0:   	ldub	[%g0 + %i0], %o1
	.word	0xbfa7083d	! t0_kref+0x36c4:   	fadds	%f28, %f29, %f31
	.word	0xbbb70cb9	! t0_kref+0x36c8:   	fandnot2s	%f28, %f25, %f29
	.word	0xfd00a004	! t0_kref+0x36cc:   	ld	[%g2 + 4], %f30
	.word	0x9744c000	! t0_kref+0x36d0:   	mov	%gsr, %o3
	.word	0xd610a010	! t0_kref+0x36d4:   	lduh	[%g2 + 0x10], %o3
	.word	0xa9b340cd	! t0_kref+0x36d8:   	edge16l	%o5, %o5, %l4
	.word	0xd0ce9018	! t0_kref+0x36dc:   	ldsba	[%i2 + %i0]0x80, %o0
	.word	0xee06601c	! t0_kref+0x36e0:   	ld	[%i1 + 0x1c], %l7
	.word	0xec0e401a	! t0_kref+0x36e4:   	ldub	[%i1 + %i2], %l6
	.word	0x290d2f66	! t0_kref+0x36e8:   	sethi	%hi(0x34bd9800), %l4
	.word	0xb3a709b8	! t0_kref+0x36ec:   	fdivs	%f28, %f24, %f25
	.word	0xf9000018	! t0_kref+0x36f0:   	ld	[%g0 + %i0], %f28
	.word	0xbdb6899a	! t0_kref+0x36f4:   	bshuffle	%f26, %f26, %f30
	.word	0xb3b60a7f	! t0_kref+0x36f8:   	fpadd32s	%f24, %f31, %f25
	.word	0xe8080019	! t0_kref+0x36fc:   	ldub	[%g0 + %i1], %l4
	.word	0xd00e8019	! t0_kref+0x3700:   	ldub	[%i2 + %i1], %o0
	.word	0xbba00538	! t0_kref+0x3704:   	fsqrts	%f24, %f29
	.word	0xab44c000	! t0_kref+0x3708:   	mov	%gsr, %l5
	.word	0xd0062010	! t0_kref+0x370c:   	ld	[%i0 + 0x10], %o0
	.word	0xec160000	! t0_kref+0x3710:   	lduh	[%i0], %l6
	.word	0xb1b6091e	! t0_kref+0x3714:   	faligndata	%f24, %f30, %f24
	.word	0xb9b009bd	! t0_kref+0x3718:   	fexpand	%f29, %f28
	.word	0xa7837642	! t0_kref+0x371c:   	wr	%o5, 0xfffff642, %gsr
	.word	0xb5a0055a	! t0_kref+0x3720:   	fsqrtd	%f26, %f26
	.word	0xda30a038	! t0_kref+0x3724:   	sth	%o5, [%g2 + 0x38]
	.word	0xd00e7fef	! t0_kref+0x3728:   	ldub	[%i1 - 0x11], %o0
	.word	0xae7b400d	! t0_kref+0x372c:   	sdiv	%o5, %o5, %l7
	.word	0x93b3412d	! t0_kref+0x3730:   	edge32n	%o5, %o5, %o1
	.word	0xf900a000	! t0_kref+0x3734:   	ld	[%g2], %f28
	.word	0xbfa6c9b9	! t0_kref+0x3738:   	fdivs	%f27, %f25, %f31
	.word	0xa8f3691e	! t0_kref+0x373c:   	udivcc	%o5, 0x91e, %l4
	.word	0xb5b60ad8	! t0_kref+0x3740:   	fpsub32	%f24, %f24, %f26
	.word	0x81dc0005	! t0_kref+0x3744:   	flush	%l0 + %g5
	.word	0xff20a01c	! t0_kref+0x3748:   	st	%f31, [%g2 + 0x1c]
	.word	0xec48a031	! t0_kref+0x374c:   	ldsb	[%g2 + 0x31], %l6
	.word	0xaebb7442	! t0_kref+0x3750:   	xnorcc	%o5, -0xbbe, %l7
	.word	0xd250a032	! t0_kref+0x3754:   	ldsh	[%g2 + 0x32], %o1
	.word	0x90f36734	! t0_kref+0x3758:   	udivcc	%o5, 0x734, %o0
	.word	0xecee101a	! t0_kref+0x375c:   	ldstuba	[%i0 + %i2]0x80, %l6
	.word	0x97b3410d	! t0_kref+0x3760:   	edge32	%o5, %o5, %o3
	.word	0xb5b78f58	! t0_kref+0x3764:   	fornot1	%f30, %f24, %f26
	.word	0xe8063ff8	! t0_kref+0x3768:   	ld	[%i0 - 8], %l4
	.word	0xe64e6018	! t0_kref+0x376c:   	ldsb	[%i1 + 0x18], %l3
	.word	0xee0e4000	! t0_kref+0x3770:   	ldub	[%i1], %l7
	.word	0xbda01a3e	! t0_kref+0x3774:   	fstoi	%f30, %f30
	.word	0xf700a00c	! t0_kref+0x3778:   	ld	[%g2 + 0xc], %f27
	.word	0xb1b78ad8	! t0_kref+0x377c:   	fpsub32	%f30, %f24, %f24
	.word	0x29800006	! t0_kref+0x3780:   	fbl,a	_kref+0x3798
	.word	0xb3a7083c	! t0_kref+0x3784:   	fadds	%f28, %f28, %f25
	.word	0xf1200018	! t0_kref+0x3788:   	st	%f24, [%g0 + %i0]
	.word	0xda28a031	! t0_kref+0x378c:   	stb	%o5, [%g2 + 0x31]
	.word	0xd610a034	! t0_kref+0x3790:   	lduh	[%g2 + 0x34], %o3
	.word	0xe6062000	! t0_kref+0x3794:   	ld	[%i0], %l3
	.word	0xd2567fea	! t0_kref+0x3798:   	ldsh	[%i1 - 0x16], %o1
	.word	0xadb3408d	! t0_kref+0x379c:   	edge16	%o5, %o5, %l6
	.word	0xee40a010	! t0_kref+0x37a0:   	ldsw	[%g2 + 0x10], %l7
	.word	0x85837c9d	! t0_kref+0x37a4:   	wr	%o5, 0xfffffc9d, %ccr
	.word	0xab418000	! t0_kref+0x37a8:   	mov	%fprs, %l5
	.word	0xb3a709bf	! t0_kref+0x37ac:   	fdivs	%f28, %f31, %f25
	.word	0xb5a708da	! t0_kref+0x37b0:   	fsubd	%f28, %f26, %f26
	.word	0xd410a028	! t0_kref+0x37b4:   	lduh	[%g2 + 0x28], %o2
	.word	0xbba018da	! t0_kref+0x37b8:   	fdtos	%f26, %f29
	.word	0xb1b64a78	! t0_kref+0x37bc:   	fpadd32s	%f25, %f24, %f24
	.word	0xbda78d38	! t0_kref+0x37c0:   	fsmuld	%f30, %f24, %f30
	.word	0xba102008	! t0_kref+0x37c4:   	mov	0x8, %i5
	.word	0xda20a028	! t0_kref+0x37c8:   	st	%o5, [%g2 + 0x28]
	.word	0xea0e7fe0	! t0_kref+0x37cc:   	ldub	[%i1 - 0x20], %l5
	.word	0xfd1e001d	! t0_kref+0x37d0:   	ldd	[%i0 + %i5], %f30
	.word	0xda28a000	! t0_kref+0x37d4:   	stb	%o5, [%g2]
	.word	0xe6067fe8	! t0_kref+0x37d8:   	ld	[%i1 - 0x18], %l3
	.word	0xbba00538	! t0_kref+0x37dc:   	fsqrts	%f24, %f29
	.word	0x91b78458	! t0_kref+0x37e0:   	fcmpne16	%f30, %f24, %o0
	.word	0xdaf6101d	! t0_kref+0x37e4:   	stxa	%o5, [%i0 + %i5]0x80
	.word	0xf706601c	! t0_kref+0x37e8:   	ld	[%i1 + 0x1c], %f27
	.word	0xbfa0053d	! t0_kref+0x37ec:   	fsqrts	%f29, %f31
	.word	0xd60e4000	! t0_kref+0x37f0:   	ldub	[%i1], %o3
	.word	0xd0067fe4	! t0_kref+0x37f4:   	ld	[%i1 - 0x1c], %o0
	.word	0xda30a02e	! t0_kref+0x37f8:   	sth	%o5, [%g2 + 0x2e]
	.word	0xc12e6004	! t0_kref+0x37fc:   	st	%fsr, [%i1 + 4]
	.word	0xee50a00a	! t0_kref+0x3800:   	ldsh	[%g2 + 0xa], %l7
	.word	0xd2067ff4	! t0_kref+0x3804:   	ld	[%i1 - 0xc], %o1
	.word	0xee50a00e	! t0_kref+0x3808:   	ldsh	[%g2 + 0xe], %l7
	.word	0x21800004	! t0_kref+0x380c:   	fbn,a	_kref+0x381c
	.word	0xea060000	! t0_kref+0x3810:   	ld	[%i0], %l5
	.word	0xea0e0000	! t0_kref+0x3814:   	ldub	[%i0], %l5
	.word	0xfb063ff8	! t0_kref+0x3818:   	ld	[%i0 - 8], %f29
	.word	0xd44e001a	! t0_kref+0x381c:   	ldsb	[%i0 + %i2], %o2
	.word	0xee4e7fff	! t0_kref+0x3820:   	ldsb	[%i1 - 1], %l7
	.word	0xb9a70d3f	! t0_kref+0x3824:   	fsmuld	%f28, %f31, %f28
	.word	0xe60e001a	! t0_kref+0x3828:   	ldub	[%i0 + %i2], %l3
	.word	0xb5b7cdbb	! t0_kref+0x382c:   	fxors	%f31, %f27, %f26
	.word	0xd04e0000	! t0_kref+0x3830:   	ldsb	[%i0], %o0
	.word	0xfd063ff4	! t0_kref+0x3834:   	ld	[%i0 - 0xc], %f30
	.word	0xffa61000	! t0_kref+0x3838:   	sta	%f31, [%i0]0x80
	.word	0x81dd4005	! t0_kref+0x383c:   	flush	%l5 + %g5
	.word	0xb9a0055a	! t0_kref+0x3840:   	fsqrtd	%f26, %f28
	.word	0xb1a7c9b8	! t0_kref+0x3844:   	fdivs	%f31, %f24, %f24
	.word	0xe640a004	! t0_kref+0x3848:   	ldsw	[%g2 + 4], %l3
	.word	0xdaf75019	! t0_kref+0x384c:   	stxa	%o5, [%i5 + %i1]0x80
	.word	0xf1be5a1c	! t0_kref+0x3850:   	stda	%f24, [%i1 + %i4]0xd0
	.word	0xe656001b	! t0_kref+0x3854:   	ldsh	[%i0 + %i3], %l3
	.word	0xb7a0053d	! t0_kref+0x3858:   	fsqrts	%f29, %f27
	.word	0xbba000ba	! t0_kref+0x385c:   	fnegs	%f26, %f29
	.word	0xda20a02c	! t0_kref+0x3860:   	st	%o5, [%g2 + 0x2c]
	.word	0xd456c019	! t0_kref+0x3864:   	ldsh	[%i3 + %i1], %o2
	.word	0xee4e8019	! t0_kref+0x3868:   	ldsb	[%i2 + %i1], %l7
	.word	0xfbee501b	! t0_kref+0x386c:   	prefetcha	%i1 + %i3, 29
	.word	0xb7b00778	! t0_kref+0x3870:   	fpack16	%f24, %f27
	.word	0xbfa6c9b8	! t0_kref+0x3874:   	fdivs	%f27, %f24, %f31
	.word	0xf9bf5a58	! t0_kref+0x3878:   	stda	%f28, [%i5 + %i0]0xd2
	.word	0xe80e4000	! t0_kref+0x387c:   	ldub	[%i1], %l4
	.word	0xee4e4000	! t0_kref+0x3880:   	ldsb	[%i1], %l7
	.word	0xbdb60a7b	! t0_kref+0x3884:   	fpadd32s	%f24, %f27, %f30
	.word	0x24800006	! t0_kref+0x3888:   	ble,a	_kref+0x38a0
	.word	0xec560000	! t0_kref+0x388c:   	ldsh	[%i0], %l6
	.word	0x81af0a38	! t0_kref+0x3890:   	fcmps	%fcc0, %f28, %f24
	.word	0xbdb70e1a	! t0_kref+0x3894:   	fand	%f28, %f26, %f30
	.word	0xee0e7fee	! t0_kref+0x3898:   	ldub	[%i1 - 0x12], %l7
	.word	0xbfa789bb	! t0_kref+0x389c:   	fdivs	%f30, %f27, %f31
	.word	0xd40e001a	! t0_kref+0x38a0:   	ldub	[%i0 + %i2], %o2
	.word	0x35480002	! t0_kref+0x38a4:   	fbue,a,pt	%fcc0, _kref+0x38ac
	.word	0x95b3412d	! t0_kref+0x38a8:   	edge32n	%o5, %o5, %o2
	.word	0xf3200019	! t0_kref+0x38ac:   	st	%f25, [%g0 + %i1]
	.word	0xead6d018	! t0_kref+0x38b0:   	ldsha	[%i3 + %i0]0x80, %l5
	.word	0xb1a00539	! t0_kref+0x38b4:   	fsqrts	%f25, %f24
	.word	0xbda6cd3b	! t0_kref+0x38b8:   	fsmuld	%f27, %f27, %f30
	.word	0x933b600b	! t0_kref+0x38bc:   	sra	%o5, 0xb, %o1
	.word	0xb7a0189b	! t0_kref+0x38c0:   	fitos	%f27, %f27
	.word	0x92bb677f	! t0_kref+0x38c4:   	xnorcc	%o5, 0x77f, %o1
	.word	0xf1bf5a19	! t0_kref+0x38c8:   	stda	%f24, [%i5 + %i1]0xd0
	.word	0xf720a018	! t0_kref+0x38cc:   	st	%f27, [%g2 + 0x18]
	.word	0xd00e8019	! t0_kref+0x38d0:   	ldub	[%i2 + %i1], %o0
	.word	0xfd1f4019	! t0_kref+0x38d4:   	ldd	[%i5 + %i1], %f30
	.word	0xbba0053f	! t0_kref+0x38d8:   	fsqrts	%f31, %f29
	.word	0xda764000	! t0_kref+0x38dc:   	stx	%o5, [%i1]
	.word	0x91b3430d	! t0_kref+0x38e0:   	alignaddr	%o5, %o5, %o0
	.word	0xd44e6000	! t0_kref+0x38e4:   	ldsb	[%i1], %o2
	.word	0xb9b78abd	! t0_kref+0x38e8:   	fpsub16s	%f30, %f29, %f28
	.word	0x131222e5	! t0_kref+0x38ec:   	sethi	%hi(0x488b9400), %o1
	.word	0xb1a709b8	! t0_kref+0x38f0:   	fdivs	%f28, %f24, %f24
	.word	0xb5b7cd60	! t0_kref+0x38f4:   	fnot1s	%f31, %f26
	.word	0xb1a0055a	! t0_kref+0x38f8:   	fsqrtd	%f26, %f24
	.word	0xf91e0000	! t0_kref+0x38fc:   	ldd	[%i0], %f28
	.word	0xa83b400d	! t0_kref+0x3900:   	xnor	%o5, %o5, %l4
	.word	0x81ae8a5e	! t0_kref+0x3904:   	fcmpd	%fcc0, %f26, %f30
	.word	0xda28a027	! t0_kref+0x3908:   	stb	%o5, [%g2 + 0x27]
	.word	0xb1b60918	! t0_kref+0x390c:   	faligndata	%f24, %f24, %f24
	.word	0xda20a008	! t0_kref+0x3910:   	st	%o5, [%g2 + 8]
	.word	0x9de3bfa0	! t0_kref+0x3914:   	save	%sp, -0x60, %sp
	.word	0xb0defb93	! t0_kref+0x3918:   	smulcc	%i3, -0x46d, %i0
	.word	0xafef26bb	! t0_kref+0x391c:   	restore	%i4, 0x6bb, %l7
	.word	0xd6070019	! t0_kref+0x3920:   	ld	[%i4 + %i1], %o3
	.word	0xd440a018	! t0_kref+0x3924:   	ldsw	[%g2 + 0x18], %o2
	.word	0x95b3404d	! t0_kref+0x3928:   	edge8l	%o5, %o5, %o2
	.word	0xd600a03c	! t0_kref+0x392c:   	ld	[%g2 + 0x3c], %o3
	.word	0xb5a7c9ba	! t0_kref+0x3930:   	fdivs	%f31, %f26, %f26
	.word	0xb9a0191b	! t0_kref+0x3934:   	fitod	%f27, %f28
	.word	0xb1b70678	! t0_kref+0x3938:   	fmul8x16au	%f28, %f24, %f24
	.word	0xb9b60918	! t0_kref+0x393c:   	faligndata	%f24, %f24, %f28
	.word	0xb5a0193c	! t0_kref+0x3940:   	fstod	%f28, %f26
	.word	0x95b34240	! t0_kref+0x3944:   	array16	%o5, %g0, %o2
	.word	0xda30a01e	! t0_kref+0x3948:   	sth	%o5, [%g2 + 0x1e]
	.word	0xaa1b400d	! t0_kref+0x394c:   	xor	%o5, %o5, %l5
	.word	0x36800004	! t0_kref+0x3950:   	bge,a	_kref+0x3960
	.word	0xb4103ff7	! t0_kref+0x3954:   	mov	0xfffffff7, %i2
	.word	0xb9a0053e	! t0_kref+0x3958:   	fsqrts	%f30, %f28
	.word	0xf91e3ff8	! t0_kref+0x395c:   	ldd	[%i0 - 8], %f28
	.word	0xb5b78db9	! t0_kref+0x3960:   	fxors	%f30, %f25, %f26
	.word	0xee4e3ff1	! t0_kref+0x3964:   	ldsb	[%i0 - 0xf], %l7
	.word	0xac336a0d	! t0_kref+0x3968:   	orn	%o5, 0xa0d, %l6
	.word	0x81af0a5c	! t0_kref+0x396c:   	fcmpd	%fcc0, %f28, %f28
	.word	0x97703e44	! t0_kref+0x3970:   	popc	-0x1bc, %o3
	.word	0xadb34280	! t0_kref+0x3974:   	array32	%o5, %g0, %l6
	.word	0xd44e7fe8	! t0_kref+0x3978:   	ldsb	[%i1 - 0x18], %o2
	.word	0xe3b8a080	! t0_kref+0x397c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xb5a608dc	! t0_kref+0x3980:   	fsubd	%f24, %f28, %f26
	.word	0xf9be180d	! t0_kref+0x3984:   	stda	%f28, [%i0 + %o5]0xc0
	.word	0xd60e001a	! t0_kref+0x3988:   	ldub	[%i0 + %i2], %o3
	.word	0xfd1fbf78	! t0_kref+0x398c:   	ldd	[%fp - 0x88], %f30
	.word	0x81b01020	! t0_kref+0x3990:   	siam	0x0
	.word	0xd016401b	! t0_kref+0x3994:   	lduh	[%i1 + %i3], %o0
	.word	0xbfa01a3a	! t0_kref+0x3998:   	fstoi	%f26, %f31
	.word	0x30480003	! t0_kref+0x399c:   	ba,a,pt	%icc, _kref+0x39a8
	.word	0xaf408000	! t0_kref+0x39a0:   	mov	%ccr, %l7
	.word	0x93400000	! t0_kref+0x39a4:   	mov	%y, %o1
	.word	0xec56600e	! t0_kref+0x39a8:   	ldsh	[%i1 + 0xe], %l6
	.word	0xaae3400d	! t0_kref+0x39ac:   	subccc	%o5, %o5, %l5
	.word	0xb9b78e80	! t0_kref+0x39b0:   	fsrc1	%f30, %f28
	.word	0xb5a00558	! t0_kref+0x39b4:   	fsqrtd	%f24, %f26
	.word	0xf11e001d	! t0_kref+0x39b8:   	ldd	[%i0 + %i5], %f24
	.word	0xd40e8018	! t0_kref+0x39bc:   	ldub	[%i2 + %i0], %o2
	.word	0xd44e600e	! t0_kref+0x39c0:   	ldsb	[%i1 + 0xe], %o2
	.word	0xe0b81018	! t0_kref+0x39c4:   	stda	%l0, [%g0 + %i0]0x80
	.word	0xd6070019	! t0_kref+0x39c8:   	ld	[%i4 + %i1], %o3
	.word	0xaabb400d	! t0_kref+0x39cc:   	xnorcc	%o5, %o5, %l5
	.word	0xa9b34200	! t0_kref+0x39d0:   	array8	%o5, %g0, %l4
	.word	0xbda0005e	! t0_kref+0x39d4:   	fmovd	%f30, %f30
	.word	0xd410a014	! t0_kref+0x39d8:   	lduh	[%g2 + 0x14], %o2
	.word	0xab2b400d	! t0_kref+0x39dc:   	sll	%o5, %o5, %l5
	.word	0x9083400d	! t0_kref+0x39e0:   	addcc	%o5, %o5, %o0
	.word	0x173526b3	! t0_kref+0x39e4:   	sethi	%hi(0xd49acc00), %o3
	.word	0xb9b70e3f	! t0_kref+0x39e8:   	fands	%f28, %f31, %f28
	.word	0xd456c018	! t0_kref+0x39ec:   	ldsh	[%i3 + %i0], %o2
	.word	0xf11e2018	! t0_kref+0x39f0:   	ldd	[%i0 + 0x18], %f24
	.word	0xaadb400d	! t0_kref+0x39f4:   	smulcc	%o5, %o5, %l5
	.word	0xee08a005	! t0_kref+0x39f8:   	ldub	[%g2 + 5], %l7
	.word	0xee50a02e	! t0_kref+0x39fc:   	ldsh	[%g2 + 0x2e], %l7
	.word	0xb9b6467d	! t0_kref+0x3a00:   	fmul8x16au	%f25, %f29, %f28
	.word	0xe9ee101c	! t0_kref+0x3a04:   	prefetcha	%i0 + %i4, 20
	.word	0xd2066010	! t0_kref+0x3a08:   	ld	[%i1 + 0x10], %o1
	.word	0xb3a688b9	! t0_kref+0x3a0c:   	fsubs	%f26, %f25, %f25
	.word	0xb1a000b8	! t0_kref+0x3a10:   	fnegs	%f24, %f24
	.word	0xee56001b	! t0_kref+0x3a14:   	ldsh	[%i0 + %i3], %l7
	.word	0xfd1e6010	! t0_kref+0x3a18:   	ldd	[%i1 + 0x10], %f30
	.word	0xb1b68f9a	! t0_kref+0x3a1c:   	for	%f26, %f26, %f24
	.word	0xee063ff8	! t0_kref+0x3a20:   	ld	[%i0 - 8], %l7
	.word	0xb5a608dc	! t0_kref+0x3a24:   	fsubd	%f24, %f28, %f26
	.word	0xf36e7fe0	! t0_kref+0x3a28:   	prefetch	%i1 - 0x20, 25
	.word	0xee0e4000	! t0_kref+0x3a2c:   	ldub	[%i1], %l7
	.word	0xf51e7fe8	! t0_kref+0x3a30:   	ldd	[%i1 - 0x18], %f26
	.word	0xaa13400d	! t0_kref+0x3a34:   	or	%o5, %o5, %l5
	.word	0xee50a028	! t0_kref+0x3a38:   	ldsh	[%g2 + 0x28], %l7
	.word	0xbda00539	! t0_kref+0x3a3c:   	fsqrts	%f25, %f30
	.word	0x2d800003	! t0_kref+0x3a40:   	fbg,a	_kref+0x3a4c
	.word	0xd4067fe4	! t0_kref+0x3a44:   	ld	[%i1 - 0x1c], %o2
	.word	0xbbb00c20	! t0_kref+0x3a48:   	fzeros	%f29
	.word	0xb1a018d8	! t0_kref+0x3a4c:   	fdtos	%f24, %f24
	.word	0xb5b706da	! t0_kref+0x3a50:   	fmul8sux16	%f28, %f26, %f26
	.word	0xd440a038	! t0_kref+0x3a54:   	ldsw	[%g2 + 0x38], %o2
	.word	0xb5b6091a	! t0_kref+0x3a58:   	faligndata	%f24, %f26, %f26
	sethi	%hi(1f), %o7
	save	%sp,-0x60,%sp
	return	%i7+%lo(1f)
	.empty
	.word	0xb1a748be	! t0_kref+0x3a68:   	fsubs	%f29, %f30, %f24
	.word	0x93b6045a	! t0_kref+0x3a6c:   	fcmpne16	%f24, %f26, %o1
	.word	0xd64e8019	! t0_kref+0x3a70:   	ldsb	[%i2 + %i1], %o3
	.word	0x36800008	! t0_kref+0x3a74:   	bge,a	_kref+0x3a94
1:	.word	0xb1a01a58	! t0_kref+0x3a78:   	fdtoi	%f24, %f24
	.word	0xda30a02e	! t0_kref+0x3a7c:   	sth	%o5, [%g2 + 0x2e]
	.word	0xb5b00f1a	! t0_kref+0x3a80:   	fsrc2	%f26, %f26
	.word	0xa70b67d0	! t0_kref+0x3a84:   	tsubcc	%o5, 0x7d0, %l3
	.word	0xd256c019	! t0_kref+0x3a88:   	ldsh	[%i3 + %i1], %o1
	.word	0xb5b00fc0	! t0_kref+0x3a8c:   	fone	%f26
	.word	0xad408000	! t0_kref+0x3a90:   	mov	%ccr, %l6
	.word	0xd010a030	! t0_kref+0x3a94:   	lduh	[%g2 + 0x30], %o0
	call	SYM(t0_subr2)
	.word	0xd448a027	! t0_kref+0x3a9c:   	ldsb	[%g2 + 0x27], %o2
	.word	0xadb3408d	! t0_kref+0x3aa0:   	edge16	%o5, %o5, %l6
	.word	0x3a800006	! t0_kref+0x3aa4:   	bcc,a	_kref+0x3abc
	.word	0xff070018	! t0_kref+0x3aa8:   	ld	[%i4 + %i0], %f31
	.word	0xb9b00fc0	! t0_kref+0x3aac:   	fone	%f28
	.word	0xd6480018	! t0_kref+0x3ab0:   	ldsb	[%g0 + %i0], %o3
	.word	0xa92b400d	! t0_kref+0x3ab4:   	sll	%o5, %o5, %l4
	.word	0xbdb60e80	! t0_kref+0x3ab8:   	fsrc1	%f24, %f30
	.word	0x8610201b	! t0_kref+0x3abc:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x3ac0:   	subcc	%g3, 1, %g3
	.word	0x2280000d	! t0_kref+0x3ac4:   	be,a	_kref+0x3af8
	.word	0xe6100019	! t0_kref+0x3ac8:   	lduh	[%g0 + %i1], %l3
	.word	0xb5b0077e	! t0_kref+0x3acc:   	fpack16	%f30, %f26
	.word	0x95b340cd	! t0_kref+0x3ad0:   	edge16l	%o5, %o5, %o2
	.word	0xc96e3fe0	! t0_kref+0x3ad4:   	prefetch	%i0 - 0x20, 4
	.word	0xb9b00cda	! t0_kref+0x3ad8:   	fnot2	%f26, %f28
	.word	0xd478a000	! t0_kref+0x3adc:   	swap	[%g2], %o2
	.word	0xda30a02a	! t0_kref+0x3ae0:   	sth	%o5, [%g2 + 0x2a]
	.word	0x93b34240	! t0_kref+0x3ae4:   	array16	%o5, %g0, %o1
	.word	0xf19e5a1a	! t0_kref+0x3ae8:   	ldda	[%i1 + %i2]0xd0, %f24
	.word	0xf9000019	! t0_kref+0x3aec:   	ld	[%g0 + %i1], %f28
	.word	0xb1b7497c	! t0_kref+0x3af0:   	fpmerge	%f29, %f28, %f24
	.word	0xb5b60a7b	! t0_kref+0x3af4:   	fpadd32s	%f24, %f27, %f26
	.word	0xd64e0000	! t0_kref+0x3af8:   	ldsb	[%i0], %o3
	.word	0xd20e7fe4	! t0_kref+0x3afc:   	ldub	[%i1 - 0x1c], %o1
	.word	0xb7a648bd	! t0_kref+0x3b00:   	fsubs	%f25, %f29, %f27
	.word	0xd60e7fea	! t0_kref+0x3b04:   	ldub	[%i1 - 0x16], %o3
	.word	0x91b704dc	! t0_kref+0x3b08:   	fcmpne32	%f28, %f28, %o0
	.word	0xf19e1a5c	! t0_kref+0x3b0c:   	ldda	[%i0 + %i4]0xd2, %f24
	.word	0xf500a01c	! t0_kref+0x3b10:   	ld	[%g2 + 0x1c], %f26
	.word	0xee500018	! t0_kref+0x3b14:   	ldsh	[%g0 + %i0], %l7
	.word	0xec16601e	! t0_kref+0x3b18:   	lduh	[%i1 + 0x1e], %l6
	.word	0xbdb009b9	! t0_kref+0x3b1c:   	fexpand	%f25, %f30
	.word	0x9de3bfa0	! t0_kref+0x3b20:   	save	%sp, -0x60, %sp
	.word	0xadee2f4c	! t0_kref+0x3b24:   	restore	%i0, 0xf4c, %l6
	.word	0xea50a030	! t0_kref+0x3b28:   	ldsh	[%g2 + 0x30], %l5
	.word	0xda30a01c	! t0_kref+0x3b2c:   	sth	%o5, [%g2 + 0x1c]
	.word	0x95237d0a	! t0_kref+0x3b30:   	mulscc	%o5, -0x2f6, %o2
	.word	0xb7a609b9	! t0_kref+0x3b34:   	fdivs	%f24, %f25, %f27
	.word	0xaa9b400d	! t0_kref+0x3b38:   	xorcc	%o5, %o5, %l5
	.word	0x9fc10000	! t0_kref+0x3b3c:   	call	%g4
	.word	0xb3a688b9	! t0_kref+0x3b40:   	fsubs	%f26, %f25, %f25
	.word	0xda2e8019	! t0_kref+0x3b44:   	stb	%o5, [%i2 + %i1]
	.word	0x97b3416d	! t0_kref+0x3b48:   	edge32ln	%o5, %o5, %o3
	.word	0x81ae8ad8	! t0_kref+0x3b4c:   	fcmped	%fcc0, %f26, %f24
	.word	0xaf23400d	! t0_kref+0x3b50:   	mulscc	%o5, %o5, %l7
	.word	0xd450a030	! t0_kref+0x3b54:   	ldsh	[%g2 + 0x30], %o2
	.word	0xd2064000	! t0_kref+0x3b58:   	ld	[%i1], %o1
	.word	0xf500a034	! t0_kref+0x3b5c:   	ld	[%g2 + 0x34], %f26
	.word	0x91b340cd	! t0_kref+0x3b60:   	edge16l	%o5, %o5, %o0
	.word	0xda2e001a	! t0_kref+0x3b64:   	stb	%o5, [%i0 + %i2]
	.word	0xda20a000	! t0_kref+0x3b68:   	st	%o5, [%g2]
	.word	0xf1be588d	! t0_kref+0x3b6c:   	stda	%f24, [%i1 + %o5]0xc4
	.word	0xfb00a018	! t0_kref+0x3b70:   	ld	[%g2 + 0x18], %f29
	.word	0xd4000019	! t0_kref+0x3b74:   	ld	[%g0 + %i1], %o2
	.word	0xd200a000	! t0_kref+0x3b78:   	ld	[%g2], %o1
	.word	0xf9be584d	! t0_kref+0x3b7c:   	stda	%f28, [%i1 + %o5]0xc2
	.word	0xec10a026	! t0_kref+0x3b80:   	lduh	[%g2 + 0x26], %l6
	.word	0xf9be188d	! t0_kref+0x3b84:   	stda	%f28, [%i0 + %o5]0xc4
	.word	0x960b7713	! t0_kref+0x3b88:   	and	%o5, -0x8ed, %o3
	.word	0x945b400d	! t0_kref+0x3b8c:   	smul	%o5, %o5, %o2
	.word	0xa73b600e	! t0_kref+0x3b90:   	sra	%o5, 0xe, %l3
	.word	0xfb20a02c	! t0_kref+0x3b94:   	st	%f29, [%g2 + 0x2c]
	.word	0xe648a018	! t0_kref+0x3b98:   	ldsb	[%g2 + 0x18], %l3
	.word	0xa783400d	! t0_kref+0x3b9c:   	wr	%o5, %o5, %gsr
	.word	0x9623400d	! t0_kref+0x3ba0:   	sub	%o5, %o5, %o3
	.word	0xa733400d	! t0_kref+0x3ba4:   	srl	%o5, %o5, %l3
	.word	0x8583400d	! t0_kref+0x3ba8:   	wr	%o5, %o5, %ccr
	.word	0xb1a01938	! t0_kref+0x3bac:   	fstod	%f24, %f24
	.word	0xf99e5a1a	! t0_kref+0x3bb0:   	ldda	[%i1 + %i2]0xd0, %f28
	.word	0xbdb6891e	! t0_kref+0x3bb4:   	faligndata	%f26, %f30, %f30
	.word	0xd416001b	! t0_kref+0x3bb8:   	lduh	[%i0 + %i3], %o2
	.word	0x8143c000	! t0_kref+0x3bbc:   	stbar
	.word	0xbfa0053d	! t0_kref+0x3bc0:   	fsqrts	%f29, %f31
	.word	0xf51e4000	! t0_kref+0x3bc4:   	ldd	[%i1], %f26
	.word	0xa863400d	! t0_kref+0x3bc8:   	subc	%o5, %o5, %l4
	.word	0xda30a038	! t0_kref+0x3bcc:   	sth	%o5, [%g2 + 0x38]
	.word	0x31800005	! t0_kref+0x3bd0:   	fba,a	_kref+0x3be4
	.word	0xad33400d	! t0_kref+0x3bd4:   	srl	%o5, %o5, %l6
	.word	0xec56601c	! t0_kref+0x3bd8:   	ldsh	[%i1 + 0x1c], %l6
	.word	0xda30a008	! t0_kref+0x3bdc:   	sth	%o5, [%g2 + 8]
	.word	0xda20a030	! t0_kref+0x3be0:   	st	%o5, [%g2 + 0x30]
	.word	0xb9b60a1c	! t0_kref+0x3be4:   	fpadd16	%f24, %f28, %f28
	.word	0xdab6101b	! t0_kref+0x3be8:   	stha	%o5, [%i0 + %i3]0x80
	.word	0xd4060000	! t0_kref+0x3bec:   	ld	[%i0], %o2
	.word	0xd050a008	! t0_kref+0x3bf0:   	ldsh	[%g2 + 8], %o0
	.word	0xe810a036	! t0_kref+0x3bf4:   	lduh	[%g2 + 0x36], %l4
	.word	0xef68a04a	! t0_kref+0x3bf8:   	prefetch	%g2 + 0x4a, 23
	.word	0xea48a024	! t0_kref+0x3bfc:   	ldsb	[%g2 + 0x24], %l5
	.word	0xda280019	! t0_kref+0x3c00:   	stb	%o5, [%g0 + %i1]
	.word	0xda20a028	! t0_kref+0x3c04:   	st	%o5, [%g2 + 0x28]
	.word	0xe640a014	! t0_kref+0x3c08:   	ldsw	[%g2 + 0x14], %l3
	.word	0xabb605d8	! t0_kref+0x3c0c:   	fcmpeq32	%f24, %f24, %l5
	.word	0xe6080018	! t0_kref+0x3c10:   	ldub	[%g0 + %i0], %l3
	.word	0xf520a038	! t0_kref+0x3c14:   	st	%f26, [%g2 + 0x38]
	.word	0x37480006	! t0_kref+0x3c18:   	fbge,a,pt	%fcc0, _kref+0x3c30
	.word	0xa7b3430d	! t0_kref+0x3c1c:   	alignaddr	%o5, %o5, %l3
	.word	0x91b340cd	! t0_kref+0x3c20:   	edge16l	%o5, %o5, %o0
	.word	0xb7b64abb	! t0_kref+0x3c24:   	fpsub16s	%f25, %f27, %f27
	.word	0x92b36b4b	! t0_kref+0x3c28:   	orncc	%o5, 0xb4b, %o1
	.word	0xb1b70d9c	! t0_kref+0x3c2c:   	fxor	%f28, %f28, %f24
	.word	0xd2066008	! t0_kref+0x3c30:   	ld	[%i1 + 8], %o1
	.word	0xabb3432d	! t0_kref+0x3c34:   	bmask	%o5, %o5, %l5
	.word	0xb1b74ea0	! t0_kref+0x3c38:   	fsrc1s	%f29, %f24
	.word	0xbba00539	! t0_kref+0x3c3c:   	fsqrts	%f25, %f29
	.word	0xd210a014	! t0_kref+0x3c40:   	lduh	[%g2 + 0x14], %o1
	.word	0xe64e6017	! t0_kref+0x3c44:   	ldsb	[%i1 + 0x17], %l3
	.word	0xd41e7fe0	! t0_kref+0x3c48:   	ldd	[%i1 - 0x20], %o2
	.word	0xee162002	! t0_kref+0x3c4c:   	lduh	[%i0 + 2], %l7
	.word	0xf5180019	! t0_kref+0x3c50:   	ldd	[%g0 + %i1], %f26
	.word	0xe6564000	! t0_kref+0x3c54:   	ldsh	[%i1], %l3
	.word	0xda2e601f	! t0_kref+0x3c58:   	stb	%o5, [%i1 + 0x1f]
	.word	0xe6080019	! t0_kref+0x3c5c:   	ldub	[%g0 + %i1], %l3
	.word	0xb9b70a1c	! t0_kref+0x3c60:   	fpadd16	%f28, %f28, %f28
	.word	0xb5b7cefb	! t0_kref+0x3c64:   	fornot2s	%f31, %f27, %f26
	.word	0xfd180018	! t0_kref+0x3c68:   	ldd	[%g0 + %i0], %f30
	.word	0xf100a038	! t0_kref+0x3c6c:   	ld	[%g2 + 0x38], %f24
	.word	0xd2063ff8	! t0_kref+0x3c70:   	ld	[%i0 - 8], %o1
	.word	0xabb704da	! t0_kref+0x3c74:   	fcmpne32	%f28, %f26, %l5
	.word	0xb9b686bc	! t0_kref+0x3c78:   	fmul8x16al	%f26, %f28, %f28
	.word	0xea4e0000	! t0_kref+0x3c7c:   	ldsb	[%i0], %l5
	.word	0xe816001b	! t0_kref+0x3c80:   	lduh	[%i0 + %i3], %l4
	.word	0xbdb74dbe	! t0_kref+0x3c84:   	fxors	%f29, %f30, %f30
	.word	0xf300a028	! t0_kref+0x3c88:   	ld	[%g2 + 0x28], %f25
	.word	0xb9b78f5a	! t0_kref+0x3c8c:   	fornot1	%f30, %f26, %f28
	.word	0xea10a024	! t0_kref+0x3c90:   	lduh	[%g2 + 0x24], %l5
	.word	0x2d0c4453	! t0_kref+0x3c94:   	sethi	%hi(0x31114c00), %l6
	.word	0xabb340cd	! t0_kref+0x3c98:   	edge16l	%o5, %o5, %l5
	.word	0xea4e001a	! t0_kref+0x3c9c:   	ldsb	[%i0 + %i2], %l5
	.word	0x9de3bfa0	! t0_kref+0x3ca0:   	save	%sp, -0x60, %sp
	.word	0xb8274019	! t0_kref+0x3ca4:   	sub	%i5, %i1, %i4
	.word	0xadee7870	! t0_kref+0x3ca8:   	restore	%i1, -0x790, %l6
	.word	0xb5b606de	! t0_kref+0x3cac:   	fmul8sux16	%f24, %f30, %f26
	.word	0xd4067fe8	! t0_kref+0x3cb0:   	ld	[%i1 - 0x18], %o2
	.word	0xb9a709bc	! t0_kref+0x3cb4:   	fdivs	%f28, %f28, %f28
	.word	0xaf13400d	! t0_kref+0x3cb8:   	taddcctv	%o5, %o5, %l7
	.word	0xe650a03c	! t0_kref+0x3cbc:   	ldsh	[%g2 + 0x3c], %l3
	.word	0xda200019	! t0_kref+0x3cc0:   	st	%o5, [%g0 + %i1]
	.word	0xda28a009	! t0_kref+0x3cc4:   	stb	%o5, [%g2 + 9]
	.word	0xbdb00fc0	! t0_kref+0x3cc8:   	fone	%f30
	.word	0xb5b60e1c	! t0_kref+0x3ccc:   	fand	%f24, %f28, %f26
	.word	0x942b7118	! t0_kref+0x3cd0:   	andn	%o5, -0xee8, %o2
	.word	0xf520a01c	! t0_kref+0x3cd4:   	st	%f26, [%g2 + 0x1c]
	.word	0xee0e7ffd	! t0_kref+0x3cd8:   	ldub	[%i1 - 3], %l7
	.word	0xd00e4000	! t0_kref+0x3cdc:   	ldub	[%i1], %o0
	.word	0x81af0a58	! t0_kref+0x3ce0:   	fcmpd	%fcc0, %f28, %f24
	.word	0xda20a038	! t0_kref+0x3ce4:   	st	%o5, [%g2 + 0x38]
	.word	0x9de3bfa0	! t0_kref+0x3ce8:   	save	%sp, -0x60, %sp
	.word	0x808f401b	! t0_kref+0x3cec:   	btst	%i3, %i5
	.word	0xa7ee4018	! t0_kref+0x3cf0:   	restore	%i1, %i0, %l3
	.word	0x91418000	! t0_kref+0x3cf4:   	mov	%fprs, %o0
	.word	0xb9b78dd8	! t0_kref+0x3cf8:   	fnand	%f30, %f24, %f28
	.word	0xb1b7cd60	! t0_kref+0x3cfc:   	fnot1s	%f31, %f24
	.word	0xbda018dc	! t0_kref+0x3d00:   	fdtos	%f28, %f30
	.word	0xbba709bc	! t0_kref+0x3d04:   	fdivs	%f28, %f28, %f29
	.word	0xee4e001a	! t0_kref+0x3d08:   	ldsb	[%i0 + %i2], %l7
	.word	0xd60e6011	! t0_kref+0x3d0c:   	ldub	[%i1 + 0x11], %o3
	.word	0xb5b007bc	! t0_kref+0x3d10:   	fpackfix	%f28, %f26
	.word	0x8d83400d	! t0_kref+0x3d14:   	wr	%o5, %o5, %fprs
	.word	0xadb3404d	! t0_kref+0x3d18:   	edge8l	%o5, %o5, %l6
	.word	0xea060000	! t0_kref+0x3d1c:   	ld	[%i0], %l5
	.word	0x23800007	! t0_kref+0x3d20:   	fbne,a	_kref+0x3d3c
	.word	0xbda74d3a	! t0_kref+0x3d24:   	fsmuld	%f29, %f26, %f30
	.word	0xfb063ff4	! t0_kref+0x3d28:   	ld	[%i0 - 0xc], %f29
	.word	0xd256600c	! t0_kref+0x3d2c:   	ldsh	[%i1 + 0xc], %o1
	.word	0xe8063fe0	! t0_kref+0x3d30:   	ld	[%i0 - 0x20], %l4
	.word	0x94db400d	! t0_kref+0x3d34:   	smulcc	%o5, %o5, %o2
	.word	0xfb20a018	! t0_kref+0x3d38:   	st	%f29, [%g2 + 0x18]
	.word	0xbda7cd3c	! t0_kref+0x3d3c:   	fsmuld	%f31, %f28, %f30
	.word	0xb7b7cea0	! t0_kref+0x3d40:   	fsrc1s	%f31, %f27
	.word	0xd40e001a	! t0_kref+0x3d44:   	ldub	[%i0 + %i2], %o2
	.word	0xda2e3ffd	! t0_kref+0x3d48:   	stb	%o5, [%i0 - 3]
	.word	0xb5a6083e	! t0_kref+0x3d4c:   	fadds	%f24, %f30, %f26
	.word	0xf11fbfa8	! t0_kref+0x3d50:   	ldd	[%fp - 0x58], %f24
	.word	0xe8070019	! t0_kref+0x3d54:   	ld	[%i4 + %i1], %l4
	.word	0x9144c000	! t0_kref+0x3d58:   	mov	%gsr, %o0
	.word	0x96ab400d	! t0_kref+0x3d5c:   	andncc	%o5, %o5, %o3
	.word	0xb5b78a1a	! t0_kref+0x3d60:   	fpadd16	%f30, %f26, %f26
	.word	0xc568a08f	! t0_kref+0x3d64:   	prefetch	%g2 + 0x8f, 2
	.word	0xec16401b	! t0_kref+0x3d68:   	lduh	[%i1 + %i3], %l6
	.word	0x92137b58	! t0_kref+0x3d6c:   	or	%o5, -0x4a8, %o1
	.word	0xf9bf1a19	! t0_kref+0x3d70:   	stda	%f28, [%i4 + %i1]0xd0
	.word	0x95b3404d	! t0_kref+0x3d74:   	edge8l	%o5, %o5, %o2
	.word	0xb1a000b9	! t0_kref+0x3d78:   	fnegs	%f25, %f24
	.word	0xf19f5a59	! t0_kref+0x3d7c:   	ldda	[%i5 + %i1]0xd2, %f24
	.word	0xb1b70e5c	! t0_kref+0x3d80:   	fxnor	%f28, %f28, %f24
	.word	0x93b605da	! t0_kref+0x3d84:   	fcmpeq32	%f24, %f26, %o1
	call	SYM(t0_subr3)
	.word	0xe6000018	! t0_kref+0x3d8c:   	ld	[%g0 + %i0], %l3
	.word	0x86102004	! t0_kref+0x3d90:   	mov	0x4, %g3
	.word	0x86a0e001	! t0_kref+0x3d94:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x3d98:   	be,a	_kref+0x3e08
	.word	0xbda648b8	! t0_kref+0x3d9c:   	fsubs	%f25, %f24, %f30
	.word	0xb1a0015c	! t0_kref+0x3da0:   	fabsd	%f28, %f24
	.word	0xe800a020	! t0_kref+0x3da4:   	ld	[%g2 + 0x20], %l4
	.word	0x8d83400d	! t0_kref+0x3da8:   	wr	%o5, %o5, %fprs
	.word	0xda20a018	! t0_kref+0x3dac:   	st	%o5, [%g2 + 0x18]
	.word	0xf51e401d	! t0_kref+0x3db0:   	ldd	[%i1 + %i5], %f26
	.word	0xb3a749b8	! t0_kref+0x3db4:   	fdivs	%f29, %f24, %f25
	.word	0xe80e6004	! t0_kref+0x3db8:   	ldub	[%i1 + 4], %l4
	.word	0xf51e6018	! t0_kref+0x3dbc:   	ldd	[%i1 + 0x18], %f26
	.word	0x3e800006	! t0_kref+0x3dc0:   	bvc,a	_kref+0x3dd8
	.word	0xf9be1a5b	! t0_kref+0x3dc4:   	stda	%f28, [%i0 + %i3]0xd2
	.word	0xafb3410d	! t0_kref+0x3dc8:   	edge32	%o5, %o5, %l7
	.word	0xe650a01a	! t0_kref+0x3dcc:   	ldsh	[%g2 + 0x1a], %l3
	.word	0xda2e7fe3	! t0_kref+0x3dd0:   	stb	%o5, [%i1 - 0x1d]
	.word	0x81df4009	! t0_kref+0x3dd4:   	flush	%i5 + %o1
	.word	0xd200a030	! t0_kref+0x3dd8:   	ld	[%g2 + 0x30], %o1
	.word	0xd60e6019	! t0_kref+0x3ddc:   	ldub	[%i1 + 0x19], %o3
	.word	0xe83e3fe8	! t0_kref+0x3de0:   	std	%l4, [%i0 - 0x18]
	.word	0x81af8ada	! t0_kref+0x3de4:   	fcmped	%fcc0, %f30, %f26
	.word	0x81dc4011	! t0_kref+0x3de8:   	flush	%l1 + %l1
	.word	0xea48a035	! t0_kref+0x3dec:   	ldsb	[%g2 + 0x35], %l5
	.word	0xae2b400d	! t0_kref+0x3df0:   	andn	%o5, %o5, %l7
	.word	0x8d83400d	! t0_kref+0x3df4:   	wr	%o5, %o5, %fprs
	.word	0xb5b78c5c	! t0_kref+0x3df8:   	fnor	%f30, %f28, %f26
	.word	0xe8100019	! t0_kref+0x3dfc:   	lduh	[%g0 + %i1], %l4
	.word	0xf1066008	! t0_kref+0x3e00:   	ld	[%i1 + 8], %f24
	.word	0xb1b009bd	! t0_kref+0x3e04:   	fexpand	%f29, %f24
	.word	0xac63400d	! t0_kref+0x3e08:   	subc	%o5, %o5, %l6
	.word	0xb9a0053c	! t0_kref+0x3e0c:   	fsqrts	%f28, %f28
	.word	0xb9b7891e	! t0_kref+0x3e10:   	faligndata	%f30, %f30, %f28
	.word	0xe850a03c	! t0_kref+0x3e14:   	ldsh	[%g2 + 0x3c], %l4
	.word	0xee08a006	! t0_kref+0x3e18:   	ldub	[%g2 + 6], %l7
	.word	0xd448a03c	! t0_kref+0x3e1c:   	ldsb	[%g2 + 0x3c], %o2
	.word	0xee901018	! t0_kref+0x3e20:   	lduha	[%g0 + %i0]0x80, %l7
	.word	0xd4067fec	! t0_kref+0x3e24:   	ld	[%i1 - 0x14], %o2
	call	SYM(t0_subr1)
	.word	0xb3a01a3f	! t0_kref+0x3e2c:   	fstoi	%f31, %f25
	.word	0xb1b60c98	! t0_kref+0x3e30:   	fandnot2	%f24, %f24, %f24
	.word	0xf11e6000	! t0_kref+0x3e34:   	ldd	[%i1], %f24
	.word	0xd0500018	! t0_kref+0x3e38:   	ldsh	[%g0 + %i0], %o0
	.word	0x81ae8a5c	! t0_kref+0x3e3c:   	fcmpd	%fcc0, %f26, %f28
	.word	0xea4e3fe0	! t0_kref+0x3e40:   	ldsb	[%i0 - 0x20], %l5
	.word	0xe60e200f	! t0_kref+0x3e44:   	ldub	[%i0 + 0xf], %l3
	.word	0xe8480019	! t0_kref+0x3e48:   	ldsb	[%g0 + %i1], %l4
	.word	0xb9b009b8	! t0_kref+0x3e4c:   	fexpand	%f24, %f28
	.word	0xda28a002	! t0_kref+0x3e50:   	stb	%o5, [%g2 + 2]
	.word	0xb5a0003c	! t0_kref+0x3e54:   	fmovs	%f28, %f26
	.word	0xb5b78cbb	! t0_kref+0x3e58:   	fandnot2s	%f30, %f27, %f26
	.word	0xb9a708d8	! t0_kref+0x3e5c:   	fsubd	%f28, %f24, %f28
	.word	0xb7a749bd	! t0_kref+0x3e60:   	fdivs	%f29, %f29, %f27
	.word	0xb3a689b9	! t0_kref+0x3e64:   	fdivs	%f26, %f25, %f25
	.word	0xb9b606ba	! t0_kref+0x3e68:   	fmul8x16al	%f24, %f26, %f28
	.word	0x95408000	! t0_kref+0x3e6c:   	mov	%ccr, %o2
	.word	0xb7a0053f	! t0_kref+0x3e70:   	fsqrts	%f31, %f27
	.word	0xd600a010	! t0_kref+0x3e74:   	ld	[%g2 + 0x10], %o3
	.word	0xb5a709bb	! t0_kref+0x3e78:   	fdivs	%f28, %f27, %f26
	.word	0xe6080018	! t0_kref+0x3e7c:   	ldub	[%g0 + %i0], %l3
	.word	0xea0e3fe0	! t0_kref+0x3e80:   	ldub	[%i0 - 0x20], %l5
	.word	0xd4560000	! t0_kref+0x3e84:   	ldsh	[%i0], %o2
	.word	0x81834000	! t0_kref+0x3e88:   	wr	%o5, %g0, %y
	.word	0xa9b340cd	! t0_kref+0x3e8c:   	edge16l	%o5, %o5, %l4
	.word	0x94e3400d	! t0_kref+0x3e90:   	subccc	%o5, %o5, %o2
	.word	0xfd060000	! t0_kref+0x3e94:   	ld	[%i0], %f30
	.word	0xfd00a010	! t0_kref+0x3e98:   	ld	[%g2 + 0x10], %f30
	.word	0x97b68458	! t0_kref+0x3e9c:   	fcmpne16	%f26, %f24, %o3
	.word	0x9144c000	! t0_kref+0x3ea0:   	mov	%gsr, %o0
	.word	0xec070018	! t0_kref+0x3ea4:   	ld	[%i4 + %i0], %l6
	.word	0xb9b706fa	! t0_kref+0x3ea8:   	fmul8ulx16	%f28, %f26, %f28
	.word	0xea10a00c	! t0_kref+0x3eac:   	lduh	[%g2 + 0xc], %l5
	.word	0xee0e7feb	! t0_kref+0x3eb0:   	ldub	[%i1 - 0x15], %l7
	.word	0xa883400d	! t0_kref+0x3eb4:   	addcc	%o5, %o5, %l4
	.word	0xda30a008	! t0_kref+0x3eb8:   	sth	%o5, [%g2 + 8]
	.word	0xa82b6778	! t0_kref+0x3ebc:   	andn	%o5, 0x778, %l4
	.word	0xbdb7cefc	! t0_kref+0x3ec0:   	fornot2s	%f31, %f28, %f30
	.word	0xae137fe6	! t0_kref+0x3ec4:   	or	%o5, -0x1a, %l7
	.word	0xd600a00c	! t0_kref+0x3ec8:   	ld	[%g2 + 0xc], %o3
	.word	0xbdb686bc	! t0_kref+0x3ecc:   	fmul8x16al	%f26, %f28, %f30
	.word	0xf1be584d	! t0_kref+0x3ed0:   	stda	%f24, [%i1 + %o5]0xc2
	.word	0xadb7845a	! t0_kref+0x3ed4:   	fcmpne16	%f30, %f26, %l6
	.word	0xe840a014	! t0_kref+0x3ed8:   	ldsw	[%g2 + 0x14], %l4
	.word	0xaee37172	! t0_kref+0x3edc:   	subccc	%o5, -0xe8e, %l7
	.word	0xf920a010	! t0_kref+0x3ee0:   	st	%f28, [%g2 + 0x10]
	.word	0xb1b7073e	! t0_kref+0x3ee4:   	fmuld8ulx16	%f28, %f30, %f24
	.word	0xe60e7fe4	! t0_kref+0x3ee8:   	ldub	[%i1 - 0x1c], %l3
	.word	0xe64e2011	! t0_kref+0x3eec:   	ldsb	[%i0 + 0x11], %l3
	.word	0xb5a789ba	! t0_kref+0x3ef0:   	fdivs	%f30, %f26, %f26
	.word	0xbda7c9bd	! t0_kref+0x3ef4:   	fdivs	%f31, %f29, %f30
	.word	0xbda0055a	! t0_kref+0x3ef8:   	fsqrtd	%f26, %f30
	.word	0xbdb78e80	! t0_kref+0x3efc:   	fsrc1	%f30, %f30
	.word	0xb3a649be	! t0_kref+0x3f00:   	fdivs	%f25, %f30, %f25
	.word	0xb7a689be	! t0_kref+0x3f04:   	fdivs	%f26, %f30, %f27
	.word	0xda30a002	! t0_kref+0x3f08:   	sth	%o5, [%g2 + 2]
	.word	0x93b340cd	! t0_kref+0x3f0c:   	edge16l	%o5, %o5, %o1
	.word	0xf11e7fe0	! t0_kref+0x3f10:   	ldd	[%i1 - 0x20], %f24
	.word	0xf706401c	! t0_kref+0x3f14:   	ld	[%i1 + %i4], %f27
	.word	0xb5b7073c	! t0_kref+0x3f18:   	fmuld8ulx16	%f28, %f28, %f26
	.word	0xe648a038	! t0_kref+0x3f1c:   	ldsb	[%g2 + 0x38], %l3
	.word	0xb5a6895e	! t0_kref+0x3f20:   	fmuld	%f26, %f30, %f26
	.word	0xb7a689bc	! t0_kref+0x3f24:   	fdivs	%f26, %f28, %f27
	.word	0xda360000	! t0_kref+0x3f28:   	sth	%o5, [%i0]
	.word	0xd600a00c	! t0_kref+0x3f2c:   	ld	[%g2 + 0xc], %o3
	.word	0xee08a029	! t0_kref+0x3f30:   	ldub	[%g2 + 0x29], %l7
	.word	0xe640a004	! t0_kref+0x3f34:   	ldsw	[%g2 + 4], %l3
	.word	0xaf33400d	! t0_kref+0x3f38:   	srl	%o5, %o5, %l7
	.word	0xf1be584d	! t0_kref+0x3f3c:   	stda	%f24, [%i1 + %o5]0xc2
	.word	0xee06001c	! t0_kref+0x3f40:   	ld	[%i0 + %i4], %l7
	.word	0xb1a688bb	! t0_kref+0x3f44:   	fsubs	%f26, %f27, %f24
	.word	0xa80b769e	! t0_kref+0x3f48:   	and	%o5, -0x962, %l4
	.word	0xe80e3fe8	! t0_kref+0x3f4c:   	ldub	[%i0 - 0x18], %l4
	.word	0xe816201c	! t0_kref+0x3f50:   	lduh	[%i0 + 0x1c], %l4
	.word	0xb7b74d60	! t0_kref+0x3f54:   	fnot1s	%f29, %f27
	.word	0x97b3430d	! t0_kref+0x3f58:   	alignaddr	%o5, %o5, %o3
	.word	0xb1b0077c	! t0_kref+0x3f5c:   	fpack16	%f28, %f24
	.word	0xb5b607d8	! t0_kref+0x3f60:   	pdist	%f24, %f24, %f26
	.word	0xbda0055e	! t0_kref+0x3f64:   	fsqrtd	%f30, %f30
	.word	0xd20e4000	! t0_kref+0x3f68:   	ldub	[%i1], %o1
	.word	0x3a800007	! t0_kref+0x3f6c:   	bcc,a	_kref+0x3f88
	.word	0xb9a6c83b	! t0_kref+0x3f70:   	fadds	%f27, %f27, %f28
	.word	0xbdb78a5e	! t0_kref+0x3f74:   	fpadd32	%f30, %f30, %f30
	.word	0x111e2f31	! t0_kref+0x3f78:   	sethi	%hi(0x78bcc400), %o0
	.word	0xb9b7097b	! t0_kref+0x3f7c:   	fpmerge	%f28, %f27, %f28
	.word	0x921b661d	! t0_kref+0x3f80:   	xor	%o5, 0x61d, %o1
	.word	0xb5b64678	! t0_kref+0x3f84:   	fmul8x16au	%f25, %f24, %f26
	.word	0xd20e4000	! t0_kref+0x3f88:   	ldub	[%i1], %o1
	.word	0xbbb64ef8	! t0_kref+0x3f8c:   	fornot2s	%f25, %f24, %f29
	.word	0xbfb6cfbf	! t0_kref+0x3f90:   	fors	%f27, %f31, %f31
	.word	0xb9a0193e	! t0_kref+0x3f94:   	fstod	%f30, %f28
	.word	0xd440a024	! t0_kref+0x3f98:   	ldsw	[%g2 + 0x24], %o2
	.word	0xf920a020	! t0_kref+0x3f9c:   	st	%f28, [%g2 + 0x20]
	.word	0xa7b3410d	! t0_kref+0x3fa0:   	edge32	%o5, %o5, %l3
	.word	0xea0e3fee	! t0_kref+0x3fa4:   	ldub	[%i0 - 0x12], %l5
	.word	0xd40e3fff	! t0_kref+0x3fa8:   	ldub	[%i0 - 1], %o2
	.word	0xea4e200b	! t0_kref+0x3fac:   	ldsb	[%i0 + 0xb], %l5
	.word	0xd608a036	! t0_kref+0x3fb0:   	ldub	[%g2 + 0x36], %o3
	.word	0xda28a00e	! t0_kref+0x3fb4:   	stb	%o5, [%g2 + 0xe]
	call	1f
	.empty
	.word	0xf3ee501c	! t0_kref+0x3fbc:   	prefetcha	%i1 + %i4, 25
	.word	0xb9a0053f	! t0_kref+0x3fc0:   	fsqrts	%f31, %f28
1:	.word	0x90f3659f	! t0_kref+0x3fc4:   	udivcc	%o5, 0x59f, %o0
	.word	0xd00e8019	! t0_kref+0x3fc8:   	ldub	[%i2 + %i1], %o0
	.word	0x95237b5b	! t0_kref+0x3fcc:   	mulscc	%o5, -0x4a5, %o2
	.word	0xaf3b6013	! t0_kref+0x3fd0:   	sra	%o5, 0x13, %l7
	.word	0x9fc10000	! t0_kref+0x3fd4:   	call	%g4
	.word	0xf100a024	! t0_kref+0x3fd8:   	ld	[%g2 + 0x24], %f24
	.word	0xf96e001b	! t0_kref+0x3fdc:   	prefetch	%i0 + %i3, 28
	.word	0xf520a004	! t0_kref+0x3fe0:   	st	%f26, [%g2 + 4]
	.word	0x8143e062	! t0_kref+0x3fe4:   	membar	0x62
	.word	0xbba6c9bb	! t0_kref+0x3fe8:   	fdivs	%f27, %f27, %f29
	.word	0xee0e7ff1	! t0_kref+0x3fec:   	ldub	[%i1 - 0xf], %l7
	.word	0xe648a03e	! t0_kref+0x3ff0:   	ldsb	[%g2 + 0x3e], %l3
	.word	0xaf036df3	! t0_kref+0x3ff4:   	taddcc	%o5, 0xdf3, %l7
	.word	0xf300a03c	! t0_kref+0x3ff8:   	ld	[%g2 + 0x3c], %f25
	.word	0xb7a789b8	! t0_kref+0x3ffc:   	fdivs	%f30, %f24, %f27
	.word	0xee567ffe	! t0_kref+0x4000:   	ldsh	[%i1 - 2], %l7
	.word	0xf520a018	! t0_kref+0x4004:   	st	%f26, [%g2 + 0x18]
	.word	0xbdb00f3b	! t0_kref+0x4008:   	fsrc2s	%f27, %f30
	.word	0xe6062010	! t0_kref+0x400c:   	ld	[%i0 + 0x10], %l3
	.word	0x29480003	! t0_kref+0x4010:   	fbl,a,pt	%fcc0, _kref+0x401c
	.word	0xbfb70d60	! t0_kref+0x4014:   	fnot1s	%f28, %f31
	.word	0xb5b68e3d	! t0_kref+0x4018:   	fands	%f26, %f29, %f26
	.word	0xeb6e001b	! t0_kref+0x401c:   	prefetch	%i0 + %i3, 21
	.word	0xb5b607dc	! t0_kref+0x4020:   	pdist	%f24, %f28, %f26
	.word	0xd200a004	! t0_kref+0x4024:   	ld	[%g2 + 4], %o1
	.word	0xec063fe8	! t0_kref+0x4028:   	ld	[%i0 - 0x18], %l6
	.word	0xd650a018	! t0_kref+0x402c:   	ldsh	[%g2 + 0x18], %o3
	.word	0x36800001	! t0_kref+0x4030:   	bge,a	_kref+0x4034
	.word	0xe850a012	! t0_kref+0x4034:   	ldsh	[%g2 + 0x12], %l4
	.word	0xda30a020	! t0_kref+0x4038:   	sth	%o5, [%g2 + 0x20]
	.word	0xd00e3fe0	! t0_kref+0x403c:   	ldub	[%i0 - 0x20], %o0
	.word	0x2d800008	! t0_kref+0x4040:   	fbg,a	_kref+0x4060
	.word	0xb1b78dba	! t0_kref+0x4044:   	fxors	%f30, %f26, %f24
	.word	0xb5a709bf	! t0_kref+0x4048:   	fdivs	%f28, %f31, %f26
	.word	0xd2881018	! t0_kref+0x404c:   	lduba	[%g0 + %i0]0x80, %o1
	.word	0xf300a038	! t0_kref+0x4050:   	ld	[%g2 + 0x38], %f25
	.word	0xd2067ff8	! t0_kref+0x4054:   	ld	[%i1 - 8], %o1
	.word	0xae13400d	! t0_kref+0x4058:   	or	%o5, %o5, %l7
	.word	0xda2e6005	! t0_kref+0x405c:   	stb	%o5, [%i1 + 5]
	.word	0xb1b00fc0	! t0_kref+0x4060:   	fone	%f24
	.word	0x9093400d	! t0_kref+0x4064:   	orcc	%o5, %o5, %o0
	.word	0x97b3410d	! t0_kref+0x4068:   	edge32	%o5, %o5, %o3
	.word	0xe80e0000	! t0_kref+0x406c:   	ldub	[%i0], %l4
	.word	0xe8562014	! t0_kref+0x4070:   	ldsh	[%i0 + 0x14], %l4
	.word	0x81af0a58	! t0_kref+0x4074:   	fcmpd	%fcc0, %f28, %f24
	.word	0xbba0053b	! t0_kref+0x4078:   	fsqrts	%f27, %f29
	.word	0xbfa01899	! t0_kref+0x407c:   	fitos	%f25, %f31
	.word	0xb9b6891c	! t0_kref+0x4080:   	faligndata	%f26, %f28, %f28
	.word	0xda30a00e	! t0_kref+0x4084:   	sth	%o5, [%g2 + 0xe]
	.word	0xda28a011	! t0_kref+0x4088:   	stb	%o5, [%g2 + 0x11]
	.word	0xe81e0000	! t0_kref+0x408c:   	ldd	[%i0], %l4
	.word	0xee000019	! t0_kref+0x4090:   	ld	[%g0 + %i1], %l7
	.word	0xda20a014	! t0_kref+0x4094:   	st	%o5, [%g2 + 0x14]
	.word	0x81aeca3f	! t0_kref+0x4098:   	fcmps	%fcc0, %f27, %f31
	.word	0xa9b78518	! t0_kref+0x409c:   	fcmpgt16	%f30, %f24, %l4
	.word	0xb1a018da	! t0_kref+0x40a0:   	fdtos	%f26, %f24
	.word	0x9de3bfa0	! t0_kref+0x40a4:   	save	%sp, -0x60, %sp
	.word	0x93ee801b	! t0_kref+0x40a8:   	restore	%i2, %i3, %o1
	.word	0xb7a8c03d	! t0_kref+0x40ac:   	fmovsul	%fcc0, %f29, %f27
	.word	0x95418000	! t0_kref+0x40b0:   	mov	%fprs, %o2
	.word	0xa9b6045a	! t0_kref+0x40b4:   	fcmpne16	%f24, %f26, %l4
	.word	0xe01e0000	! t0_kref+0x40b8:   	ldd	[%i0], %l0
	.word	0xe8166008	! t0_kref+0x40bc:   	lduh	[%i1 + 8], %l4
	.word	0xd40e0000	! t0_kref+0x40c0:   	ldub	[%i0], %o2
	.word	0xb9a0193b	! t0_kref+0x40c4:   	fstod	%f27, %f28
	.word	0xee062010	! t0_kref+0x40c8:   	ld	[%i0 + 0x10], %l7
	.word	0xf700a038	! t0_kref+0x40cc:   	ld	[%g2 + 0x38], %f27
	.word	0xf700a038	! t0_kref+0x40d0:   	ld	[%g2 + 0x38], %f27
	.word	0x81ae0a3e	! t0_kref+0x40d4:   	fcmps	%fcc0, %f24, %f30
	.word	0xb1b68f98	! t0_kref+0x40d8:   	for	%f26, %f24, %f24
	.word	0xf3063ff4	! t0_kref+0x40dc:   	ld	[%i0 - 0xc], %f25
	.word	0xd216001b	! t0_kref+0x40e0:   	lduh	[%i0 + %i3], %o1
	.word	0xe60e7fee	! t0_kref+0x40e4:   	ldub	[%i1 - 0x12], %l3
	.word	0xda2e7fff	! t0_kref+0x40e8:   	stb	%o5, [%i1 - 1]
	.word	0xd2563ffe	! t0_kref+0x40ec:   	ldsh	[%i0 - 2], %o1
	.word	0xd0562000	! t0_kref+0x40f0:   	ldsh	[%i0], %o0
	.word	0xd4067fe4	! t0_kref+0x40f4:   	ld	[%i1 - 0x1c], %o2
	.word	0xbda0191a	! t0_kref+0x40f8:   	fitod	%f26, %f30
	.word	0xf1bf5a59	! t0_kref+0x40fc:   	stda	%f24, [%i5 + %i1]0xd2
	.word	0xaf418000	! t0_kref+0x4100:   	mov	%fprs, %l7
	.word	0xf500a034	! t0_kref+0x4104:   	ld	[%g2 + 0x34], %f26
	.word	0xae1b400d	! t0_kref+0x4108:   	xor	%o5, %o5, %l7
	.word	0xae2b400d	! t0_kref+0x410c:   	andn	%o5, %o5, %l7
	.word	0xbdb70a18	! t0_kref+0x4110:   	fpadd16	%f28, %f24, %f30
	.word	0xb9b64e3e	! t0_kref+0x4114:   	fands	%f25, %f30, %f28
	.word	0xd64e0000	! t0_kref+0x4118:   	ldsb	[%i0], %o3
	.word	0xb9b68cbe	! t0_kref+0x411c:   	fandnot2s	%f26, %f30, %f28
	.word	0xea00a004	! t0_kref+0x4120:   	ld	[%g2 + 4], %l5
	.word	0xac63400d	! t0_kref+0x4124:   	subc	%o5, %o5, %l6
	.word	0xff00a020	! t0_kref+0x4128:   	ld	[%g2 + 0x20], %f31
	.word	0xee50a01c	! t0_kref+0x412c:   	ldsh	[%g2 + 0x1c], %l7
	.word	0xf506600c	! t0_kref+0x4130:   	ld	[%i1 + 0xc], %f26
	.word	0xb3b00fe0	! t0_kref+0x4134:   	fones	%f25
	.word	0xda30a00a	! t0_kref+0x4138:   	sth	%o5, [%g2 + 0xa]
	.word	0x2f800008	! t0_kref+0x413c:   	fbu,a	_kref+0x415c
	.word	0xa770000d	! t0_kref+0x4140:   	popc	%o5, %l3
	.word	0xb9b68db8	! t0_kref+0x4144:   	fxors	%f26, %f24, %f28
	.word	0x95b34240	! t0_kref+0x4148:   	array16	%o5, %g0, %o2
	.word	0xe60e600e	! t0_kref+0x414c:   	ldub	[%i1 + 0xe], %l3
	.word	0xec08a00a	! t0_kref+0x4150:   	ldub	[%g2 + 0xa], %l6
	.word	0xa944c000	! t0_kref+0x4154:   	mov	%gsr, %l4
	.word	0xb1b6ca7e	! t0_kref+0x4158:   	fpadd32s	%f27, %f30, %f24
	.word	0xaee3400d	! t0_kref+0x415c:   	subccc	%o5, %o5, %l7
	.word	0xd20e001a	! t0_kref+0x4160:   	ldub	[%i0 + %i2], %o1
	.word	0xf1be588d	! t0_kref+0x4164:   	stda	%f24, [%i1 + %o5]0xc4
	.word	0xec4e3fe1	! t0_kref+0x4168:   	ldsb	[%i0 - 0x1f], %l6
	.word	0xee50a020	! t0_kref+0x416c:   	ldsh	[%g2 + 0x20], %l7
	.word	0xabb3432d	! t0_kref+0x4170:   	bmask	%o5, %o5, %l5
	.word	0xd2067ffc	! t0_kref+0x4174:   	ld	[%i1 - 4], %o1
	.word	0xf11e3ff0	! t0_kref+0x4178:   	ldd	[%i0 - 0x10], %f24
	.word	0x95400000	! t0_kref+0x417c:   	mov	%y, %o2
	.word	0xea0e7fe0	! t0_kref+0x4180:   	ldub	[%i1 - 0x20], %l5
	.word	0x91b7841a	! t0_kref+0x4184:   	fcmple16	%f30, %f26, %o0
	.word	0xda30a03c	! t0_kref+0x4188:   	sth	%o5, [%g2 + 0x3c]
	.word	0xf5063ff0	! t0_kref+0x418c:   	ld	[%i0 - 0x10], %f26
	.word	0xb7a609bf	! t0_kref+0x4190:   	fdivs	%f24, %f31, %f27
	.word	0x20800004	! t0_kref+0x4194:   	bn,a	_kref+0x41a4
	.word	0x97408000	! t0_kref+0x4198:   	mov	%ccr, %o3
	.word	0xea56c019	! t0_kref+0x419c:   	ldsh	[%i3 + %i1], %l5
	.word	0xbdb60e5e	! t0_kref+0x41a0:   	fxnor	%f24, %f30, %f30
	.word	0xee062018	! t0_kref+0x41a4:   	ld	[%i0 + 0x18], %l7
	.word	0xda30a024	! t0_kref+0x41a8:   	sth	%o5, [%g2 + 0x24]
	.word	0xbbb00f3e	! t0_kref+0x41ac:   	fsrc2s	%f30, %f29
	.word	0xf9be588d	! t0_kref+0x41b0:   	stda	%f28, [%i1 + %o5]0xc4
	.word	0xacbb7fba	! t0_kref+0x41b4:   	xnorcc	%o5, -0x46, %l6
	.word	0xbda0055c	! t0_kref+0x41b8:   	fsqrtd	%f28, %f30
	.word	0xda2e3ffb	! t0_kref+0x41bc:   	stb	%o5, [%i0 - 5]
	.word	0xda30a01a	! t0_kref+0x41c0:   	sth	%o5, [%g2 + 0x1a]
	.word	0x91b3408d	! t0_kref+0x41c4:   	edge16	%o5, %o5, %o0
	.word	0xf3000018	! t0_kref+0x41c8:   	ld	[%g0 + %i0], %f25
	.word	0xb5a0013c	! t0_kref+0x41cc:   	fabss	%f28, %f26
	.word	0xbba709bc	! t0_kref+0x41d0:   	fdivs	%f28, %f28, %f29
	.word	0xb9b7471f	! t0_kref+0x41d4:   	fmuld8sux16	%f29, %f31, %f28
	.word	0xbdb00cda	! t0_kref+0x41d8:   	fnot2	%f26, %f30
	.word	0xe606401c	! t0_kref+0x41dc:   	ld	[%i1 + %i4], %l3
	.word	0x95b7851e	! t0_kref+0x41e0:   	fcmpgt16	%f30, %f30, %o2
	.word	0xa9b3432d	! t0_kref+0x41e4:   	bmask	%o5, %o5, %l4
	.word	0xb610201c	! t0_kref+0x41e8:   	mov	0x1c, %i3
	.word	0x969361f5	! t0_kref+0x41ec:   	orcc	%o5, 0x1f5, %o3
	.word	0xec0e0000	! t0_kref+0x41f0:   	ldub	[%i0], %l6
	.word	0x92b37a78	! t0_kref+0x41f4:   	orncc	%o5, -0x588, %o1
	.word	0xf11e3ff8	! t0_kref+0x41f8:   	ldd	[%i0 - 8], %f24
	.word	0xbfa0003b	! t0_kref+0x41fc:   	fmovs	%f27, %f31
	.word	0xb7a609bf	! t0_kref+0x4200:   	fdivs	%f24, %f31, %f27
	.word	0xbfb78d3c	! t0_kref+0x4204:   	fandnot1s	%f30, %f28, %f31
	.word	0xb1b68d98	! t0_kref+0x4208:   	fxor	%f26, %f24, %f24
	.word	0xe64e8019	! t0_kref+0x420c:   	ldsb	[%i2 + %i1], %l3
	.word	0xb5a649b9	! t0_kref+0x4210:   	fdivs	%f25, %f25, %f26
	.word	0xe5ee501c	! t0_kref+0x4214:   	prefetcha	%i1 + %i4, 18
	.word	0xb6102004	! t0_kref+0x4218:   	mov	0x4, %i3
	.word	0xaa0b6271	! t0_kref+0x421c:   	and	%o5, 0x271, %l5
	.word	0xac9b737e	! t0_kref+0x4220:   	xorcc	%o5, -0xc82, %l6
	.word	0x91b3432d	! t0_kref+0x4224:   	bmask	%o5, %o5, %o0
	.word	0xd200a00c	! t0_kref+0x4228:   	ld	[%g2 + 0xc], %o1
	.word	0xd6080019	! t0_kref+0x422c:   	ldub	[%g0 + %i1], %o3
	.word	0xab33400d	! t0_kref+0x4230:   	srl	%o5, %o5, %l5
	.word	0xb5a01a3e	! t0_kref+0x4234:   	fstoi	%f30, %f26
	.word	0xbdb64ef8	! t0_kref+0x4238:   	fornot2s	%f25, %f24, %f30
	.word	0xfb20a024	! t0_kref+0x423c:   	st	%f29, [%g2 + 0x24]
	.word	0xd60e4000	! t0_kref+0x4240:   	ldub	[%i1], %o3
	.word	0xda30a016	! t0_kref+0x4244:   	sth	%o5, [%g2 + 0x16]
	.word	0x93b340cd	! t0_kref+0x4248:   	edge16l	%o5, %o5, %o1
	.word	0xbdb6073f	! t0_kref+0x424c:   	fmuld8ulx16	%f24, %f31, %f30
	.word	0xb1a0055c	! t0_kref+0x4250:   	fsqrtd	%f28, %f24
	.word	0xa7b340cd	! t0_kref+0x4254:   	edge16l	%o5, %o5, %l3
	.word	0xb1b00c00	! t0_kref+0x4258:   	fzero	%f24
	.word	0xbba0189b	! t0_kref+0x425c:   	fitos	%f27, %f29
	.word	0xbfa789be	! t0_kref+0x4260:   	fdivs	%f30, %f30, %f31
	.word	0x8143c000	! t0_kref+0x4264:   	stbar
	.word	0xa7836be4	! t0_kref+0x4268:   	wr	%o5, 0xbe4, %gsr
	.word	0xf1be9a19	! t0_kref+0x426c:   	stda	%f24, [%i2 + %i1]0xd0
	.word	0xda260000	! t0_kref+0x4270:   	st	%o5, [%i0]
	.word	0xa9b605d8	! t0_kref+0x4274:   	fcmpeq32	%f24, %f24, %l4
	.word	0xbba789b9	! t0_kref+0x4278:   	fdivs	%f30, %f25, %f29
	.word	0xe84e0000	! t0_kref+0x427c:   	ldsb	[%i0], %l4
	.word	0xd210a00c	! t0_kref+0x4280:   	lduh	[%g2 + 0xc], %o1
	.word	0xb5a689ba	! t0_kref+0x4284:   	fdivs	%f26, %f26, %f26
	.word	0xff00a034	! t0_kref+0x4288:   	ld	[%g2 + 0x34], %f31
	.word	0xbdb64979	! t0_kref+0x428c:   	fpmerge	%f25, %f25, %f30
	.word	0xab2366c3	! t0_kref+0x4290:   	mulscc	%o5, 0x6c3, %l5
	.word	0x913b400d	! t0_kref+0x4294:   	sra	%o5, %o5, %o0
	.word	0xb5b6473e	! t0_kref+0x4298:   	fmuld8ulx16	%f25, %f30, %f26
	.word	0x292d8046	! t0_kref+0x429c:   	sethi	%hi(0xb6011800), %l4
	.word	0xb9b78a1a	! t0_kref+0x42a0:   	fpadd16	%f30, %f26, %f28
	.word	0xda20a02c	! t0_kref+0x42a4:   	st	%o5, [%g2 + 0x2c]
	.word	0xd4560000	! t0_kref+0x42a8:   	ldsh	[%i0], %o2
	.word	0xb5a0053c	! t0_kref+0x42ac:   	fsqrts	%f28, %f26
	.word	0x2e800002	! t0_kref+0x42b0:   	bvs,a	_kref+0x42b8
	.word	0xb5b60d9c	! t0_kref+0x42b4:   	fxor	%f24, %f28, %f26
	.word	0x9fc00004	! t0_kref+0x42b8:   	call	%g0 + %g4
	.word	0xda366002	! t0_kref+0x42bc:   	sth	%o5, [%i1 + 2]
	.word	0xbdb64efd	! t0_kref+0x42c0:   	fornot2s	%f25, %f29, %f30
	.word	0x3a800001	! t0_kref+0x42c4:   	bcc,a	_kref+0x42c8
	.word	0xe6000019	! t0_kref+0x42c8:   	ld	[%g0 + %i1], %l3
	.word	0xacab68bb	! t0_kref+0x42cc:   	andncc	%o5, 0x8bb, %l6
	.word	0xee961000	! t0_kref+0x42d0:   	lduha	[%i0]0x80, %l7
	.word	0x97b34240	! t0_kref+0x42d4:   	array16	%o5, %g0, %o3
	.word	0xadb3430d	! t0_kref+0x42d8:   	alignaddr	%o5, %o5, %l6
	.word	0xb9a7c9bd	! t0_kref+0x42dc:   	fdivs	%f31, %f29, %f28
	.word	0xb1b00c20	! t0_kref+0x42e0:   	fzeros	%f24
	.word	0xe8564000	! t0_kref+0x42e4:   	ldsh	[%i1], %l4
	.word	0xae8360c7	! t0_kref+0x42e8:   	addcc	%o5, 0xc7, %l7
	.word	0xbfa7c9ba	! t0_kref+0x42ec:   	fdivs	%f31, %f26, %f31
	.word	0xe8164000	! t0_kref+0x42f0:   	lduh	[%i1], %l4
	.word	0xe656c018	! t0_kref+0x42f4:   	ldsh	[%i3 + %i0], %l3
	.word	0xb1b60e18	! t0_kref+0x42f8:   	fand	%f24, %f24, %f24
	.word	0xb5b70c7d	! t0_kref+0x42fc:   	fnors	%f28, %f29, %f26
	.word	0xb7a0053b	! t0_kref+0x4300:   	fsqrts	%f27, %f27
	.word	0xb1b68edc	! t0_kref+0x4304:   	fornot2	%f26, %f28, %f24
	.word	0xb5a0053a	! t0_kref+0x4308:   	fsqrts	%f26, %f26
	.word	0xa813400d	! t0_kref+0x430c:   	or	%o5, %o5, %l4
	.word	0xb5b60c5c	! t0_kref+0x4310:   	fnor	%f24, %f28, %f26
	.word	0x91b3434d	! t0_kref+0x4314:   	alignaddrl	%o5, %o5, %o0
	.word	0x94bb61c5	! t0_kref+0x4318:   	xnorcc	%o5, 0x1c5, %o2
	.word	0xb1b60d98	! t0_kref+0x431c:   	fxor	%f24, %f24, %f24
	.word	0xd6162006	! t0_kref+0x4320:   	lduh	[%i0 + 6], %o3
	.word	0xb1b64979	! t0_kref+0x4324:   	fpmerge	%f25, %f25, %f24
	.word	0x8583400d	! t0_kref+0x4328:   	wr	%o5, %o5, %ccr
	.word	0xe808a003	! t0_kref+0x432c:   	ldub	[%g2 + 3], %l4
	.word	0x91b3410d	! t0_kref+0x4330:   	edge32	%o5, %o5, %o0
	.word	0xa85b691f	! t0_kref+0x4334:   	smul	%o5, 0x91f, %l4
	.word	0x9123400d	! t0_kref+0x4338:   	mulscc	%o5, %o5, %o0
	.word	0xec560000	! t0_kref+0x433c:   	ldsh	[%i0], %l6
	.word	0xadb340cd	! t0_kref+0x4340:   	edge16l	%o5, %o5, %l6
	.word	0xadb3432d	! t0_kref+0x4344:   	bmask	%o5, %o5, %l6
	.word	0xe6164000	! t0_kref+0x4348:   	lduh	[%i1], %l3
	.word	0xea164000	! t0_kref+0x434c:   	lduh	[%i1], %l5
	.word	0xbda609ba	! t0_kref+0x4350:   	fdivs	%f24, %f26, %f30
	.word	0xb5b68ab8	! t0_kref+0x4354:   	fpsub16s	%f26, %f24, %f26
	.word	0xbdb78c58	! t0_kref+0x4358:   	fnor	%f30, %f24, %f30
	.word	0xb9b78d98	! t0_kref+0x435c:   	fxor	%f30, %f24, %f28
	.word	0xb7a609bb	! t0_kref+0x4360:   	fdivs	%f24, %f27, %f27
	.word	0x9de3bfa0	! t0_kref+0x4364:   	save	%sp, -0x60, %sp
	.word	0xb48e4000	! t0_kref+0x4368:   	andcc	%i1, %g0, %i2
	.word	0xa7ee4019	! t0_kref+0x436c:   	restore	%i1, %i1, %l3
	.word	0xa7b340cd	! t0_kref+0x4370:   	edge16l	%o5, %o5, %l3
	.word	0xe60e2013	! t0_kref+0x4374:   	ldub	[%i0 + 0x13], %l3
	.word	0xb5b60d98	! t0_kref+0x4378:   	fxor	%f24, %f24, %f26
	.word	0xd04e7fea	! t0_kref+0x437c:   	ldsb	[%i1 - 0x16], %o0
	.word	0xa9b3416d	! t0_kref+0x4380:   	edge32ln	%o5, %o5, %l4
	.word	0xe816201a	! t0_kref+0x4384:   	lduh	[%i0 + 0x1a], %l4
	.word	0xd0480019	! t0_kref+0x4388:   	ldsb	[%g0 + %i1], %o0
	.word	0xb5a6c9b8	! t0_kref+0x438c:   	fdivs	%f27, %f24, %f26
	.word	0xda30a00a	! t0_kref+0x4390:   	sth	%o5, [%g2 + 0xa]
	.word	0xae63400d	! t0_kref+0x4394:   	subc	%o5, %o5, %l7
	.word	0xaab3687d	! t0_kref+0x4398:   	orncc	%o5, 0x87d, %l5
	.word	0xd2167fe6	! t0_kref+0x439c:   	lduh	[%i1 - 0x1a], %o1
	.word	0xd40e7ffd	! t0_kref+0x43a0:   	ldub	[%i1 - 3], %o2
	.word	0xae737e41	! t0_kref+0x43a4:   	udiv	%o5, -0x1bf, %l7
	.word	0xfb066014	! t0_kref+0x43a8:   	ld	[%i1 + 0x14], %f29
	.word	0xb5b78ada	! t0_kref+0x43ac:   	fpsub32	%f30, %f26, %f26
	.word	0xb9b6091e	! t0_kref+0x43b0:   	faligndata	%f24, %f30, %f28
	.word	0xbdb70e5c	! t0_kref+0x43b4:   	fxnor	%f28, %f28, %f30
	.word	0xb5b686fa	! t0_kref+0x43b8:   	fmul8ulx16	%f26, %f26, %f26
	.word	0xda28a012	! t0_kref+0x43bc:   	stb	%o5, [%g2 + 0x12]
	.word	0xd6163ff2	! t0_kref+0x43c0:   	lduh	[%i0 - 0xe], %o3
	.word	0xa78372e8	! t0_kref+0x43c4:   	wr	%o5, 0xfffff2e8, %gsr
	.word	0xda30a036	! t0_kref+0x43c8:   	sth	%o5, [%g2 + 0x36]
	.word	0x92f37c07	! t0_kref+0x43cc:   	udivcc	%o5, -0x3f9, %o1
	.word	0xd000a014	! t0_kref+0x43d0:   	ld	[%g2 + 0x14], %o0
	.word	0xc078a02c	! t0_kref+0x43d4:   	swap	[%g2 + 0x2c], %g0
	.word	0xadb340ed	! t0_kref+0x43d8:   	edge16ln	%o5, %o5, %l6
	.word	0xef68a00b	! t0_kref+0x43dc:   	prefetch	%g2 + 0xb, 23
	.word	0xd200a004	! t0_kref+0x43e0:   	ld	[%g2 + 4], %o1
	.word	0xad44c000	! t0_kref+0x43e4:   	mov	%gsr, %l6
	.word	0x97b3404d	! t0_kref+0x43e8:   	edge8l	%o5, %o5, %o3
	.word	0xf300a020	! t0_kref+0x43ec:   	ld	[%g2 + 0x20], %f25
	.word	0xbda709da	! t0_kref+0x43f0:   	fdivd	%f28, %f26, %f30
	.word	0xb7a749bf	! t0_kref+0x43f4:   	fdivs	%f29, %f31, %f27
	.word	0xb9b00f3f	! t0_kref+0x43f8:   	fsrc2s	%f31, %f28
	.word	0xf3070018	! t0_kref+0x43fc:   	ld	[%i4 + %i0], %f25
	.word	0xb7a0053d	! t0_kref+0x4400:   	fsqrts	%f29, %f27
	.word	0xee50a002	! t0_kref+0x4404:   	ldsh	[%g2 + 2], %l7
	.word	0xb7a649bd	! t0_kref+0x4408:   	fdivs	%f25, %f29, %f27
	.word	0xb1a6c9bc	! t0_kref+0x440c:   	fdivs	%f27, %f28, %f24
	.word	0x27800005	! t0_kref+0x4410:   	fbul,a	_kref+0x4424
	.word	0xf300a014	! t0_kref+0x4414:   	ld	[%g2 + 0x14], %f25
	.word	0x92f3759a	! t0_kref+0x4418:   	udivcc	%o5, -0xa66, %o1
	.word	0xda28a02a	! t0_kref+0x441c:   	stb	%o5, [%g2 + 0x2a]
	.word	0x90bb400d	! t0_kref+0x4420:   	xnorcc	%o5, %o5, %o0
	.word	0xf9be1a1c	! t0_kref+0x4424:   	stda	%f28, [%i0 + %i4]0xd0
	.word	0xb9b68e5a	! t0_kref+0x4428:   	fxnor	%f26, %f26, %f28
	.word	0xe4680019	! t0_kref+0x442c:   	ldstub	[%g0 + %i1], %l2
	.word	0xda20a018	! t0_kref+0x4430:   	st	%o5, [%g2 + 0x18]
	.word	0xd640a034	! t0_kref+0x4434:   	ldsw	[%g2 + 0x34], %o3
	.word	0xd6567fe6	! t0_kref+0x4438:   	ldsh	[%i1 - 0x1a], %o3
	.word	0xf720a030	! t0_kref+0x443c:   	st	%f27, [%g2 + 0x30]
	.word	0xbfb00fe0	! t0_kref+0x4440:   	fones	%f31
	.word	0xbdb7497b	! t0_kref+0x4444:   	fpmerge	%f29, %f27, %f30
	.word	0xb1b78e80	! t0_kref+0x4448:   	fsrc1	%f30, %f24
	.word	0xec0e8018	! t0_kref+0x444c:   	ldub	[%i2 + %i0], %l6
	.word	0xaa3b400d	! t0_kref+0x4450:   	xnor	%o5, %o5, %l5
	.word	0x81834000	! t0_kref+0x4454:   	wr	%o5, %g0, %y
	.word	0xec066008	! t0_kref+0x4458:   	ld	[%i1 + 8], %l6
	.word	0x95408000	! t0_kref+0x445c:   	mov	%ccr, %o2
	.word	0xbdb00cda	! t0_kref+0x4460:   	fnot2	%f26, %f30
	.word	0xd04e601d	! t0_kref+0x4464:   	ldsb	[%i1 + 0x1d], %o0
	.word	0xe610a02c	! t0_kref+0x4468:   	lduh	[%g2 + 0x2c], %l3
	.word	0xb9b7497d	! t0_kref+0x446c:   	fpmerge	%f29, %f29, %f28
	.word	0xf11e001d	! t0_kref+0x4470:   	ldd	[%i0 + %i5], %f24
	.word	0xe816c019	! t0_kref+0x4474:   	lduh	[%i3 + %i1], %l4
	.word	0xb1a0053c	! t0_kref+0x4478:   	fsqrts	%f28, %f24
	.word	0xbfa689ba	! t0_kref+0x447c:   	fdivs	%f26, %f26, %f31
	.word	0xd64e4000	! t0_kref+0x4480:   	ldsb	[%i1], %o3
	.word	0xb1b009b9	! t0_kref+0x4484:   	fexpand	%f25, %f24
	.word	0xbfa00539	! t0_kref+0x4488:   	fsqrts	%f25, %f31
	.word	0xac1b6822	! t0_kref+0x448c:   	xor	%o5, 0x822, %l6
	.word	0xa7b7041a	! t0_kref+0x4490:   	fcmple16	%f28, %f26, %l3
	.word	0xd44e8018	! t0_kref+0x4494:   	ldsb	[%i2 + %i0], %o2
	.word	0xea563fe6	! t0_kref+0x4498:   	ldsh	[%i0 - 0x1a], %l5
	.word	0xbdb7063c	! t0_kref+0x449c:   	fmul8x16	%f28, %f28, %f30
	.word	0x2a800008	! t0_kref+0x44a0:   	bcs,a	_kref+0x44c0
	.word	0xd60e001a	! t0_kref+0x44a4:   	ldub	[%i0 + %i2], %o3
	.word	0xd4080018	! t0_kref+0x44a8:   	ldub	[%g0 + %i0], %o2
	.word	0xf900a028	! t0_kref+0x44ac:   	ld	[%g2 + 0x28], %f28
	.word	0xe2ee5000	! t0_kref+0x44b0:   	ldstuba	[%i1]0x80, %l1
	.word	0xd448a01a	! t0_kref+0x44b4:   	ldsb	[%g2 + 0x1a], %o2
	.word	0xda26401c	! t0_kref+0x44b8:   	st	%o5, [%i1 + %i4]
	.word	0x85837eb8	! t0_kref+0x44bc:   	wr	%o5, 0xfffffeb8, %ccr
	.word	0xe650a02c	! t0_kref+0x44c0:   	ldsh	[%g2 + 0x2c], %l3
	.word	0xda30a018	! t0_kref+0x44c4:   	sth	%o5, [%g2 + 0x18]
	.word	0x95b34280	! t0_kref+0x44c8:   	array32	%o5, %g0, %o2
	.word	0xdaf61000	! t0_kref+0x44cc:   	stxa	%o5, [%i0]0x80
	.word	0xbda01a3d	! t0_kref+0x44d0:   	fstoi	%f29, %f30
	.word	0xf7066010	! t0_kref+0x44d4:   	ld	[%i1 + 0x10], %f27
	.word	0xb7a0189d	! t0_kref+0x44d8:   	fitos	%f29, %f27
	.word	0xafb3404d	! t0_kref+0x44dc:   	edge8l	%o5, %o5, %l7
	.word	0xda28a034	! t0_kref+0x44e0:   	stb	%o5, [%g2 + 0x34]
	.word	0xb5a60858	! t0_kref+0x44e4:   	faddd	%f24, %f24, %f26
	.word	0xa7b7045c	! t0_kref+0x44e8:   	fcmpne16	%f28, %f28, %l3
	.word	0xda30a02c	! t0_kref+0x44ec:   	sth	%o5, [%g2 + 0x2c]
	.word	0xb5a0053b	! t0_kref+0x44f0:   	fsqrts	%f27, %f26
	.word	0xb5a7083b	! t0_kref+0x44f4:   	fadds	%f28, %f27, %f26
	.word	0xee00a010	! t0_kref+0x44f8:   	ld	[%g2 + 0x10], %l7
	.word	0xd2062014	! t0_kref+0x44fc:   	ld	[%i0 + 0x14], %o1
	.word	0xda362016	! t0_kref+0x4500:   	sth	%o5, [%i0 + 0x16]
	.word	0xd20e3ffb	! t0_kref+0x4504:   	ldub	[%i0 - 5], %o1
	.word	0xf11f4019	! t0_kref+0x4508:   	ldd	[%i5 + %i1], %f24
	.word	0xda26401c	! t0_kref+0x450c:   	st	%o5, [%i1 + %i4]
	.word	0xa73b400d	! t0_kref+0x4510:   	sra	%o5, %o5, %l3
	.word	0xabb7841e	! t0_kref+0x4514:   	fcmple16	%f30, %f30, %l5
	.word	0x9de3bfa0	! t0_kref+0x4518:   	save	%sp, -0x60, %sp
	.word	0xade8001a	! t0_kref+0x451c:   	restore	%g0, %i2, %l6
	.word	0xc07e2004	! t0_kref+0x4520:   	swap	[%i0 + 4], %g0
	.word	0xe8166000	! t0_kref+0x4524:   	lduh	[%i1], %l4
	.word	0x33800001	! t0_kref+0x4528:   	fbe,a	_kref+0x452c
	.word	0xd450a03e	! t0_kref+0x452c:   	ldsh	[%g2 + 0x3e], %o2
	.word	0xbda01058	! t0_kref+0x4530:   	fdtox	%f24, %f30
	.word	0x81af8a5e	! t0_kref+0x4534:   	fcmpd	%fcc0, %f30, %f30
	.word	0xabb34240	! t0_kref+0x4538:   	array16	%o5, %g0, %l5
	.word	0x8583400d	! t0_kref+0x453c:   	wr	%o5, %o5, %ccr
	.word	0xb1b7863e	! t0_kref+0x4540:   	fmul8x16	%f30, %f30, %f24
	.word	0xe84e600c	! t0_kref+0x4544:   	ldsb	[%i1 + 0xc], %l4
	.word	0xbfa01a5e	! t0_kref+0x4548:   	fdtoi	%f30, %f31
	.word	0xee567ff6	! t0_kref+0x454c:   	ldsh	[%i1 - 0xa], %l7
	.word	0xb5b707dc	! t0_kref+0x4550:   	pdist	%f28, %f28, %f26
	.word	0xb7b78fb9	! t0_kref+0x4554:   	fors	%f30, %f25, %f27
	.word	0xa7b3412d	! t0_kref+0x4558:   	edge32n	%o5, %o5, %l3
	.word	0xa93b400d	! t0_kref+0x455c:   	sra	%o5, %o5, %l4
	.word	0x941b400d	! t0_kref+0x4560:   	xor	%o5, %o5, %o2
	.word	0xff00a014	! t0_kref+0x4564:   	ld	[%g2 + 0x14], %f31
	.word	0x9013752b	! t0_kref+0x4568:   	or	%o5, -0xad5, %o0
	.word	0xd256001b	! t0_kref+0x456c:   	ldsh	[%i0 + %i3], %o1
	.word	0xda2e601c	! t0_kref+0x4570:   	stb	%o5, [%i1 + 0x1c]
	.word	0x952b400d	! t0_kref+0x4574:   	sll	%o5, %o5, %o2
	.word	0xea0e7ff3	! t0_kref+0x4578:   	ldub	[%i1 - 0xd], %l5
	.word	0xa9b6845e	! t0_kref+0x457c:   	fcmpne16	%f26, %f30, %l4
	.word	0xb7b74db9	! t0_kref+0x4580:   	fxors	%f29, %f25, %f27
	.word	0xb7a0053b	! t0_kref+0x4584:   	fsqrts	%f27, %f27
	.word	0x8583400d	! t0_kref+0x4588:   	wr	%o5, %o5, %ccr
	.word	0xa970000d	! t0_kref+0x458c:   	popc	%o5, %l4
	.word	0xf300a014	! t0_kref+0x4590:   	ld	[%g2 + 0x14], %f25
	.word	0xbbb78d60	! t0_kref+0x4594:   	fnot1s	%f30, %f29
	.word	0xb3a0053a	! t0_kref+0x4598:   	fsqrts	%f26, %f25
	.word	0xb5a0055e	! t0_kref+0x459c:   	fsqrtd	%f30, %f26
	.word	0x949b400d	! t0_kref+0x45a0:   	xorcc	%o5, %o5, %o2
	.word	0xbdb00fc0	! t0_kref+0x45a4:   	fone	%f30
	.word	0xd050a028	! t0_kref+0x45a8:   	ldsh	[%g2 + 0x28], %o0
	.word	0xb7a608bd	! t0_kref+0x45ac:   	fsubs	%f24, %f29, %f27
	.word	0xda20a034	! t0_kref+0x45b0:   	st	%o5, [%g2 + 0x34]
	.word	0xaa9b400d	! t0_kref+0x45b4:   	xorcc	%o5, %o5, %l5
	.word	0xb9b7c67a	! t0_kref+0x45b8:   	fmul8x16au	%f31, %f26, %f28
	.word	0xbfa609bd	! t0_kref+0x45bc:   	fdivs	%f24, %f29, %f31
	.word	0xb5a0053a	! t0_kref+0x45c0:   	fsqrts	%f26, %f26
	.word	0xbdb68d9c	! t0_kref+0x45c4:   	fxor	%f26, %f28, %f30
	.word	0x8d8369b3	! t0_kref+0x45c8:   	wr	%o5, 0x9b3, %fprs
	.word	0xa783400d	! t0_kref+0x45cc:   	wr	%o5, %o5, %gsr
	.word	0xb5b707de	! t0_kref+0x45d0:   	pdist	%f28, %f30, %f26
	.word	0x9770000d	! t0_kref+0x45d4:   	popc	%o5, %o3
	.word	0xb9a0053c	! t0_kref+0x45d8:   	fsqrts	%f28, %f28
	.word	0xf19e5a1b	! t0_kref+0x45dc:   	ldda	[%i1 + %i3]0xd0, %f24
	.word	0xa7b3404d	! t0_kref+0x45e0:   	edge8l	%o5, %o5, %l3
	.word	0xe8480018	! t0_kref+0x45e4:   	ldsb	[%g0 + %i0], %l4
	.word	0xe8166016	! t0_kref+0x45e8:   	lduh	[%i1 + 0x16], %l4
	.word	0xb1b68a1e	! t0_kref+0x45ec:   	fpadd16	%f26, %f30, %f24
	.word	0xabb3430d	! t0_kref+0x45f0:   	alignaddr	%o5, %o5, %l5
	.word	0xf51e6010	! t0_kref+0x45f4:   	ldd	[%i1 + 0x10], %f26
	.word	0xd256201c	! t0_kref+0x45f8:   	ldsh	[%i0 + 0x1c], %o1
	.word	0xb5a0055c	! t0_kref+0x45fc:   	fsqrtd	%f28, %f26
	.word	0xf720a000	! t0_kref+0x4600:   	st	%f27, [%g2]
	.word	0xadb3410d	! t0_kref+0x4604:   	edge32	%o5, %o5, %l6
	.word	0xfd000019	! t0_kref+0x4608:   	ld	[%g0 + %i1], %f30
	.word	0x81db8009	! t0_kref+0x460c:   	flush	%sp + %o1
	.word	0xd250a032	! t0_kref+0x4610:   	ldsh	[%g2 + 0x32], %o1
	.word	0xec06001c	! t0_kref+0x4614:   	ld	[%i0 + %i4], %l6
	.word	0xb1a0053b	! t0_kref+0x4618:   	fsqrts	%f27, %f24
	.word	0xb9a688ba	! t0_kref+0x461c:   	fsubs	%f26, %f26, %f28
	.word	0xbbb60fbc	! t0_kref+0x4620:   	fors	%f24, %f28, %f29
	.word	0xbda0053a	! t0_kref+0x4624:   	fsqrts	%f26, %f30
	.word	0xb9b00fe0	! t0_kref+0x4628:   	fones	%f28
	.word	0xa744c000	! t0_kref+0x462c:   	mov	%gsr, %l3
	.word	0xb9b70e5e	! t0_kref+0x4630:   	fxnor	%f28, %f30, %f28
	.word	0xc16e000d	! t0_kref+0x4634:   	prefetch	%i0 + %o5, 0
	.word	0x31800002	! t0_kref+0x4638:   	fba,a	_kref+0x4640
	.word	0xda300019	! t0_kref+0x463c:   	sth	%o5, [%g0 + %i1]
	.word	0xbba689bd	! t0_kref+0x4640:   	fdivs	%f26, %f29, %f29
	.word	0xd6563fea	! t0_kref+0x4644:   	ldsh	[%i0 - 0x16], %o3
	.word	0xbfa0053c	! t0_kref+0x4648:   	fsqrts	%f28, %f31
	.word	0xbdb6091a	! t0_kref+0x464c:   	faligndata	%f24, %f26, %f30
	call	1f
	.empty
	.word	0xbbb60fb8	! t0_kref+0x4654:   	fors	%f24, %f24, %f29
	.word	0xad33600a	! t0_kref+0x4658:   	srl	%o5, 0xa, %l6
	.word	0xb1a0053d	! t0_kref+0x465c:   	fsqrts	%f29, %f24
	.word	0xb9b74fb8	! t0_kref+0x4660:   	fors	%f29, %f24, %f28
	.word	0xee560000	! t0_kref+0x4664:   	ldsh	[%i0], %l7
	.word	0x95b3404d	! t0_kref+0x4668:   	edge8l	%o5, %o5, %o2
1:	.word	0xb9b00fc0	! t0_kref+0x466c:   	fone	%f28
	.word	0xe816401b	! t0_kref+0x4670:   	lduh	[%i1 + %i3], %l4
	.word	0xd20e6004	! t0_kref+0x4674:   	ldub	[%i1 + 4], %o1
	.word	0xa91b400d	! t0_kref+0x4678:   	tsubcctv	%o5, %o5, %l4
	.word	0x81de401e	! t0_kref+0x467c:   	flush	%i1 + %fp
	.word	0xb9a0189d	! t0_kref+0x4680:   	fitos	%f29, %f28
	.word	0xf51fbc50	! t0_kref+0x4684:   	ldd	[%fp - 0x3b0], %f26
	.word	0xe64e3fee	! t0_kref+0x4688:   	ldsb	[%i0 - 0x12], %l3
	.word	0xbbb64cba	! t0_kref+0x468c:   	fandnot2s	%f25, %f26, %f29
	.word	0xbda789bf	! t0_kref+0x4690:   	fdivs	%f30, %f31, %f30
	.word	0xbba0003b	! t0_kref+0x4694:   	fmovs	%f27, %f29
	.word	0xee067fe8	! t0_kref+0x4698:   	ld	[%i1 - 0x18], %l7
	.word	0xe800a000	! t0_kref+0x469c:   	ld	[%g2], %l4
	.word	0xbbb00f3d	! t0_kref+0x46a0:   	fsrc2s	%f29, %f29
	.word	0x24800003	! t0_kref+0x46a4:   	ble,a	_kref+0x46b0
	.word	0xbda0193e	! t0_kref+0x46a8:   	fstod	%f30, %f30
	.word	0xf91e6010	! t0_kref+0x46ac:   	ldd	[%i1 + 0x10], %f28
	.word	0x91b3434d	! t0_kref+0x46b0:   	alignaddrl	%o5, %o5, %o0
	.word	0x8d83400d	! t0_kref+0x46b4:   	wr	%o5, %o5, %fprs
	.word	0x90ab400d	! t0_kref+0x46b8:   	andncc	%o5, %o5, %o0
	.word	0xbfb60e3d	! t0_kref+0x46bc:   	fands	%f24, %f29, %f31
	.word	0xf99f1a19	! t0_kref+0x46c0:   	ldda	[%i4 + %i1]0xd0, %f28
	.word	0xad3b600d	! t0_kref+0x46c4:   	sra	%o5, 0xd, %l6
	.word	0xd24e401a	! t0_kref+0x46c8:   	ldsb	[%i1 + %i2], %o1
	.word	0x93703365	! t0_kref+0x46cc:   	popc	-0xc9b, %o1
	.word	0xa783783e	! t0_kref+0x46d0:   	wr	%o5, 0xfffff83e, %gsr
	.word	0xb6103ff4	! t0_kref+0x46d4:   	mov	0xfffffff4, %i3
	.word	0xf3264000	! t0_kref+0x46d8:   	st	%f25, [%i1]
	.word	0xf9062004	! t0_kref+0x46dc:   	ld	[%i0 + 4], %f28
	.word	0x9fc00004	! t0_kref+0x46e0:   	call	%g0 + %g4
	.word	0xb9b7ca7b	! t0_kref+0x46e4:   	fpadd32s	%f31, %f27, %f28
	.word	0xf700a010	! t0_kref+0x46e8:   	ld	[%g2 + 0x10], %f27
	.word	0xee4e001a	! t0_kref+0x46ec:   	ldsb	[%i0 + %i2], %l7
	.word	0xee00a000	! t0_kref+0x46f0:   	ld	[%g2], %l7
	.word	0xe6167ff8	! t0_kref+0x46f4:   	lduh	[%i1 - 8], %l3
	.word	0x21800002	! t0_kref+0x46f8:   	fbn,a	_kref+0x4700
	.word	0xee562010	! t0_kref+0x46fc:   	ldsh	[%i0 + 0x10], %l7
	.word	0x97b705d8	! t0_kref+0x4700:   	fcmpeq32	%f28, %f24, %o3
	.word	0xf5067ffc	! t0_kref+0x4704:   	ld	[%i1 - 4], %f26
	.word	0xb1a749be	! t0_kref+0x4708:   	fdivs	%f29, %f30, %f24
	.word	0xea08a009	! t0_kref+0x470c:   	ldub	[%g2 + 9], %l5
	.word	0x81ddbffe	! t0_kref+0x4710:   	flush	%l6 - 2
	.word	0xb9b00fc0	! t0_kref+0x4714:   	fone	%f28
	.word	0xaa3b78d1	! t0_kref+0x4718:   	xnor	%o5, -0x72f, %l5
	.word	0xfb00a018	! t0_kref+0x471c:   	ld	[%g2 + 0x18], %f29
	.word	0xf100a038	! t0_kref+0x4720:   	ld	[%g2 + 0x38], %f24
	.word	0xbdb68c58	! t0_kref+0x4724:   	fnor	%f26, %f24, %f30
	.word	0x95b3404d	! t0_kref+0x4728:   	edge8l	%o5, %o5, %o2
	.word	0xb810201c	! t0_kref+0x472c:   	mov	0x1c, %i4
	.word	0xea080018	! t0_kref+0x4730:   	ldub	[%g0 + %i0], %l5
	.word	0xbba7c9b9	! t0_kref+0x4734:   	fdivs	%f31, %f25, %f29
	.word	0xec4e2010	! t0_kref+0x4738:   	ldsb	[%i0 + 0x10], %l6
	.word	0xd250a016	! t0_kref+0x473c:   	ldsh	[%g2 + 0x16], %o1
	.word	0xa82372ae	! t0_kref+0x4740:   	sub	%o5, -0xd52, %l4
	.word	0xe60e3fef	! t0_kref+0x4744:   	ldub	[%i0 - 0x11], %l3
	.word	0x32800008	! t0_kref+0x4748:   	bne,a	_kref+0x4768
	.word	0xb5b78d98	! t0_kref+0x474c:   	fxor	%f30, %f24, %f26
	.word	0xacf371dc	! t0_kref+0x4750:   	udivcc	%o5, -0xe24, %l6
	.word	0xea063fe4	! t0_kref+0x4754:   	ld	[%i0 - 0x1c], %l5
	.word	0xea000018	! t0_kref+0x4758:   	ld	[%g0 + %i0], %l5
	.word	0xd44e001a	! t0_kref+0x475c:   	ldsb	[%i0 + %i2], %o2
	.word	0xd448a02d	! t0_kref+0x4760:   	ldsb	[%g2 + 0x2d], %o2
	.word	0xf920a03c	! t0_kref+0x4764:   	st	%f28, [%g2 + 0x3c]
	.word	0xb9a00539	! t0_kref+0x4768:   	fsqrts	%f25, %f28
	.word	0xd040a034	! t0_kref+0x476c:   	ldsw	[%g2 + 0x34], %o0
	.word	0xb1b70738	! t0_kref+0x4770:   	fmuld8ulx16	%f28, %f24, %f24
	.word	0xb5a0189c	! t0_kref+0x4774:   	fitos	%f28, %f26
	.word	0xec56401b	! t0_kref+0x4778:   	ldsh	[%i1 + %i3], %l6
	.word	0xec50a01a	! t0_kref+0x477c:   	ldsh	[%g2 + 0x1a], %l6
	.word	0xb5b6097a	! t0_kref+0x4780:   	fpmerge	%f24, %f26, %f26
	.word	0xb1b686fc	! t0_kref+0x4784:   	fmul8ulx16	%f26, %f28, %f24
	.word	0xb7b00f3f	! t0_kref+0x4788:   	fsrc2s	%f31, %f27
	.word	0xe41f4019	! t0_kref+0x478c:   	ldd	[%i5 + %i1], %l2
	.word	0xabb340ed	! t0_kref+0x4790:   	edge16ln	%o5, %o5, %l5
	.word	0xb5b00cdc	! t0_kref+0x4794:   	fnot2	%f28, %f26
	.word	0x81af8a3b	! t0_kref+0x4798:   	fcmps	%fcc0, %f30, %f27
	.word	0x90c362d3	! t0_kref+0x479c:   	addccc	%o5, 0x2d3, %o0
	.word	0xe64e0000	! t0_kref+0x47a0:   	ldsb	[%i0], %l3
	.word	0xee564000	! t0_kref+0x47a4:   	ldsh	[%i1], %l7
	.word	0xd24e8018	! t0_kref+0x47a8:   	ldsb	[%i2 + %i0], %o1
	.word	0xda28a027	! t0_kref+0x47ac:   	stb	%o5, [%g2 + 0x27]
	.word	0xd648a026	! t0_kref+0x47b0:   	ldsb	[%g2 + 0x26], %o3
	.word	0xda20a018	! t0_kref+0x47b4:   	st	%o5, [%g2 + 0x18]
	.word	0x90f3640c	! t0_kref+0x47b8:   	udivcc	%o5, 0x40c, %o0
	.word	0xb5b00f1e	! t0_kref+0x47bc:   	fsrc2	%f30, %f26
	.word	0xd0780019	! t0_kref+0x47c0:   	swap	[%g0 + %i1], %o0
	.word	0xd410a028	! t0_kref+0x47c4:   	lduh	[%g2 + 0x28], %o2
	.word	0xacf37072	! t0_kref+0x47c8:   	udivcc	%o5, -0xf8e, %l6
	.word	0xac2b400d	! t0_kref+0x47cc:   	andn	%o5, %o5, %l6
	.word	0xb1a709b8	! t0_kref+0x47d0:   	fdivs	%f28, %f24, %f24
	.word	0xf5067fe0	! t0_kref+0x47d4:   	ld	[%i1 - 0x20], %f26
	.word	0x29800007	! t0_kref+0x47d8:   	fbl,a	_kref+0x47f4
	.word	0xff20a038	! t0_kref+0x47dc:   	st	%f31, [%g2 + 0x38]
	.word	0xe656601e	! t0_kref+0x47e0:   	ldsh	[%i1 + 0x1e], %l3
	.word	0xd496d019	! t0_kref+0x47e4:   	lduha	[%i3 + %i1]0x80, %o2
	.word	0xf7060000	! t0_kref+0x47e8:   	ld	[%i0], %f27
	.word	0xea16401b	! t0_kref+0x47ec:   	lduh	[%i1 + %i3], %l5
	.word	0xbba00538	! t0_kref+0x47f0:   	fsqrts	%f24, %f29
	.word	0xbfb74ea0	! t0_kref+0x47f4:   	fsrc1s	%f29, %f31
	.word	0xbbb6ceff	! t0_kref+0x47f8:   	fornot2s	%f27, %f31, %f29
	.word	0xb1b68e5e	! t0_kref+0x47fc:   	fxnor	%f26, %f30, %f24
	.word	0xda20a034	! t0_kref+0x4800:   	st	%o5, [%g2 + 0x34]
	.word	0xb1a0003b	! t0_kref+0x4804:   	fmovs	%f27, %f24
	.word	0xdaf75019	! t0_kref+0x4808:   	stxa	%o5, [%i5 + %i1]0x80
	.word	0x93b3402d	! t0_kref+0x480c:   	edge8n	%o5, %o5, %o1
	.word	0xb1b60c9e	! t0_kref+0x4810:   	fandnot2	%f24, %f30, %f24
	.word	0xf320a038	! t0_kref+0x4814:   	st	%f25, [%g2 + 0x38]
	.word	0x3c800003	! t0_kref+0x4818:   	bpos,a	_kref+0x4824
	.word	0xbda688dc	! t0_kref+0x481c:   	fsubd	%f26, %f28, %f30
	.word	0x81db001c	! t0_kref+0x4820:   	flush	%o4 + %i4
	.word	0xb1b6c97d	! t0_kref+0x4824:   	fpmerge	%f27, %f29, %f24
	.word	0xda300018	! t0_kref+0x4828:   	sth	%o5, [%g0 + %i0]
	.word	0xf51e6008	! t0_kref+0x482c:   	ldd	[%i1 + 8], %f26
	.word	0xea50a016	! t0_kref+0x4830:   	ldsh	[%g2 + 0x16], %l5
	.word	0xbda0111e	! t0_kref+0x4834:   	fxtod	%f30, %f30
	.word	0xf1be584d	! t0_kref+0x4838:   	stda	%f24, [%i1 + %o5]0xc2
	.word	0xea0e3ff2	! t0_kref+0x483c:   	ldub	[%i0 - 0xe], %l5
	.word	0xb5a788d8	! t0_kref+0x4840:   	fsubd	%f30, %f24, %f26
	.word	0x34800002	! t0_kref+0x4844:   	bg,a	_kref+0x484c
	.word	0xda30a028	! t0_kref+0x4848:   	sth	%o5, [%g2 + 0x28]
	.word	0xfd06001c	! t0_kref+0x484c:   	ld	[%i0 + %i4], %f30
	.word	0xb3b74dbf	! t0_kref+0x4850:   	fxors	%f29, %f31, %f25
	.word	0xd4064000	! t0_kref+0x4854:   	ld	[%i1], %o2
	.word	0xf1066010	! t0_kref+0x4858:   	ld	[%i1 + 0x10], %f24
	.word	0xd000a014	! t0_kref+0x485c:   	ld	[%g2 + 0x14], %o0
	.word	0x1527f77d	! t0_kref+0x4860:   	sethi	%hi(0x9fddf400), %o2
	.word	0xd0100019	! t0_kref+0x4864:   	lduh	[%g0 + %i1], %o0
	.word	0xd486501c	! t0_kref+0x4868:   	lda	[%i1 + %i4]0x80, %o2
	.word	0xe6564000	! t0_kref+0x486c:   	ldsh	[%i1], %l3
	.word	0xda30a028	! t0_kref+0x4870:   	sth	%o5, [%g2 + 0x28]
	.word	0xdab61000	! t0_kref+0x4874:   	stha	%o5, [%i0]0x80
	.word	0xd210a01c	! t0_kref+0x4878:   	lduh	[%g2 + 0x1c], %o1
	.word	0xd448a012	! t0_kref+0x487c:   	ldsb	[%g2 + 0x12], %o2
	.word	0x27800006	! t0_kref+0x4880:   	fbul,a	_kref+0x4898
	.word	0x90636ffb	! t0_kref+0x4884:   	subc	%o5, 0xffb, %o0
	.word	0xbdb60a7e	! t0_kref+0x4888:   	fpadd32s	%f24, %f30, %f30
	.word	0xbda000b8	! t0_kref+0x488c:   	fnegs	%f24, %f30
	.word	0xf1bf5a58	! t0_kref+0x4890:   	stda	%f24, [%i5 + %i0]0xd2
	.word	0xadb340cd	! t0_kref+0x4894:   	edge16l	%o5, %o5, %l6
	.word	0x23480002	! t0_kref+0x4898:   	fbne,a,pt	%fcc0, _kref+0x48a0
	.word	0xec0e7fe7	! t0_kref+0x489c:   	ldub	[%i1 - 0x19], %l6
	.word	0x2f800002	! t0_kref+0x48a0:   	fbu,a	_kref+0x48a8
	.word	0xd210a02a	! t0_kref+0x48a4:   	lduh	[%g2 + 0x2a], %o1
	.word	0xe6480018	! t0_kref+0x48a8:   	ldsb	[%g0 + %i0], %l3
	.word	0xb3b7ccbe	! t0_kref+0x48ac:   	fandnot2s	%f31, %f30, %f25
	.word	0xa7636156	! t0_kref+0x48b0:   	movle	%fcc0, 0x156, %l3
	.word	0xbdb00f1e	! t0_kref+0x48b4:   	fsrc2	%f30, %f30
	.word	0xea080019	! t0_kref+0x48b8:   	ldub	[%g0 + %i1], %l5
	.word	0xd4080018	! t0_kref+0x48bc:   	ldub	[%g0 + %i0], %o2
	.word	0xf9be188d	! t0_kref+0x48c0:   	stda	%f28, [%i0 + %o5]0xc4
	.word	0xc12e401c	! t0_kref+0x48c4:   	st	%fsr, [%i1 + %i4]
	.word	0xaafb400d	! t0_kref+0x48c8:   	sdivcc	%o5, %o5, %l5
	.word	0xb7a00538	! t0_kref+0x48cc:   	fsqrts	%f24, %f27
	.word	0xbba0053a	! t0_kref+0x48d0:   	fsqrts	%f26, %f29
	.word	0xb1a00558	! t0_kref+0x48d4:   	fsqrtd	%f24, %f24
	.word	0xfd1e6018	! t0_kref+0x48d8:   	ldd	[%i1 + 0x18], %f30
	.word	0xe616c019	! t0_kref+0x48dc:   	lduh	[%i3 + %i1], %l3
	.word	0xf900a030	! t0_kref+0x48e0:   	ld	[%g2 + 0x30], %f28
	.word	0xa893400d	! t0_kref+0x48e4:   	orcc	%o5, %o5, %l4
	.word	0xda28a015	! t0_kref+0x48e8:   	stb	%o5, [%g2 + 0x15]
	.word	0xb9b70c7c	! t0_kref+0x48ec:   	fnors	%f28, %f28, %f28
	.word	0x81ae0a5e	! t0_kref+0x48f0:   	fcmpd	%fcc0, %f24, %f30
	.word	0xb5a0053a	! t0_kref+0x48f4:   	fsqrts	%f26, %f26
	.word	0x9de3bfa0	! t0_kref+0x48f8:   	save	%sp, -0x60, %sp
	.word	0xa7ee660f	! t0_kref+0x48fc:   	restore	%i1, 0x60f, %l3
	.word	0xda30a038	! t0_kref+0x4900:   	sth	%o5, [%g2 + 0x38]
	.word	0xf11e7fe8	! t0_kref+0x4904:   	ldd	[%i1 - 0x18], %f24
	.word	0xb9a7c9bb	! t0_kref+0x4908:   	fdivs	%f31, %f27, %f28
	.word	0xe8400019	! t0_kref+0x490c:   	ldsw	[%g0 + %i1], %l4
	.word	0xda20a004	! t0_kref+0x4910:   	st	%o5, [%g2 + 4]
	.word	0xd20e2019	! t0_kref+0x4914:   	ldub	[%i0 + 0x19], %o1
	.word	0xda30a01c	! t0_kref+0x4918:   	sth	%o5, [%g2 + 0x1c]
	.word	0x8d837be1	! t0_kref+0x491c:   	wr	%o5, 0xfffffbe1, %fprs
	.word	0xb9b6899c	! t0_kref+0x4920:   	bshuffle	%f26, %f28, %f28
	.word	0xd656c018	! t0_kref+0x4924:   	ldsh	[%i3 + %i0], %o3
	.word	0xb3a0053c	! t0_kref+0x4928:   	fsqrts	%f28, %f25
	.word	0x81834000	! t0_kref+0x492c:   	wr	%o5, %g0, %y
	.word	0xe64e6016	! t0_kref+0x4930:   	ldsb	[%i1 + 0x16], %l3
	.word	0x81af8a5a	! t0_kref+0x4934:   	fcmpd	%fcc0, %f30, %f26
	.word	0x85837067	! t0_kref+0x4938:   	wr	%o5, 0xfffff067, %ccr
	.word	0xe8100019	! t0_kref+0x493c:   	lduh	[%g0 + %i1], %l4
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xb9a00558	! t0_kref+0x4948:   	fsqrtd	%f24, %f28
	.word	0xafb7041e	! t0_kref+0x494c:   	fcmple16	%f28, %f30, %l7
	.word	0xd6062000	! t0_kref+0x4950:   	ld	[%i0], %o3
	.word	0xee16c019	! t0_kref+0x4954:   	lduh	[%i3 + %i1], %l7
	.word	0xda20a03c	! t0_kref+0x4958:   	st	%o5, [%g2 + 0x3c]
	.word	0xa9b6051a	! t0_kref+0x495c:   	fcmpgt16	%f24, %f26, %l4
1:	.word	0xfd06401c	! t0_kref+0x4960:   	ld	[%i1 + %i4], %f30
	.word	0xadb3404d	! t0_kref+0x4964:   	edge8l	%o5, %o5, %l6
	.word	0xad70000d	! t0_kref+0x4968:   	popc	%o5, %l6
	.word	0xfb070019	! t0_kref+0x496c:   	ld	[%i4 + %i1], %f29
	.word	0xaae3765b	! t0_kref+0x4970:   	subccc	%o5, -0x9a5, %l5
	.word	0xb5b64ea0	! t0_kref+0x4974:   	fsrc1s	%f25, %f26
	.word	0xb3a00538	! t0_kref+0x4978:   	fsqrts	%f24, %f25
	.word	0xfb000019	! t0_kref+0x497c:   	ld	[%g0 + %i1], %f29
	.word	0xd006001c	! t0_kref+0x4980:   	ld	[%i0 + %i4], %o0
	.word	0xe84e6017	! t0_kref+0x4984:   	ldsb	[%i1 + 0x17], %l4
	.word	0xf19f1a18	! t0_kref+0x4988:   	ldda	[%i4 + %i0]0xd0, %f24
	.word	0xb7a6c9bc	! t0_kref+0x498c:   	fdivs	%f27, %f28, %f27
	.word	0xb5a608bc	! t0_kref+0x4990:   	fsubs	%f24, %f28, %f26
	.word	0xda28a00d	! t0_kref+0x4994:   	stb	%o5, [%g2 + 0xd]
	.word	0xb5b6c67e	! t0_kref+0x4998:   	fmul8x16au	%f27, %f30, %f26
	.word	0x20800005	! t0_kref+0x499c:   	bn,a	_kref+0x49b0
	.word	0xe640a00c	! t0_kref+0x49a0:   	ldsw	[%g2 + 0xc], %l3
	.word	0xd456601a	! t0_kref+0x49a4:   	ldsh	[%i1 + 0x1a], %o2
	.word	0x96137839	! t0_kref+0x49a8:   	or	%o5, -0x7c7, %o3
	.word	0xda28a034	! t0_kref+0x49ac:   	stb	%o5, [%g2 + 0x34]
	.word	0xea000019	! t0_kref+0x49b0:   	ld	[%g0 + %i1], %l5
	.word	0x8d837c70	! t0_kref+0x49b4:   	wr	%o5, 0xfffffc70, %fprs
	.word	0xd60e3ffe	! t0_kref+0x49b8:   	ldub	[%i0 - 2], %o3
	.word	0xf100a02c	! t0_kref+0x49bc:   	ld	[%g2 + 0x2c], %f24
	.word	0xb8102004	! t0_kref+0x49c0:   	mov	0x4, %i4
	.word	0xd406401c	! t0_kref+0x49c4:   	ld	[%i1 + %i4], %o2
	.word	0xda20a038	! t0_kref+0x49c8:   	st	%o5, [%g2 + 0x38]
	.word	0xb9a0191e	! t0_kref+0x49cc:   	fitod	%f30, %f28
	.word	0xa8a3400d	! t0_kref+0x49d0:   	subcc	%o5, %o5, %l4
	.word	0xbda0193a	! t0_kref+0x49d4:   	fstod	%f26, %f30
	.word	0xb1b7073a	! t0_kref+0x49d8:   	fmuld8ulx16	%f28, %f26, %f24
	.word	0xb5a709be	! t0_kref+0x49dc:   	fdivs	%f28, %f30, %f26
	.word	0xe6563fe0	! t0_kref+0x49e0:   	ldsh	[%i0 - 0x20], %l3
	.word	0xbbb60db8	! t0_kref+0x49e4:   	fxors	%f24, %f24, %f29
	.word	0xec08a015	! t0_kref+0x49e8:   	ldub	[%g2 + 0x15], %l6
	.word	0xda30a03a	! t0_kref+0x49ec:   	sth	%o5, [%g2 + 0x3a]
	.word	0xb5a709b8	! t0_kref+0x49f0:   	fdivs	%f28, %f24, %f26
	.word	0xb5b60ea0	! t0_kref+0x49f4:   	fsrc1s	%f24, %f26
	.word	0xea562018	! t0_kref+0x49f8:   	ldsh	[%i0 + 0x18], %l5
	.word	0x92137d73	! t0_kref+0x49fc:   	or	%o5, -0x28d, %o1
	.word	0xd000a010	! t0_kref+0x4a00:   	ld	[%g2 + 0x10], %o0
	.word	0xb7a0053a	! t0_kref+0x4a04:   	fsqrts	%f26, %f27
	.word	0xda28a029	! t0_kref+0x4a08:   	stb	%o5, [%g2 + 0x29]
	.word	0xd40e3fe2	! t0_kref+0x4a0c:   	ldub	[%i0 - 0x1e], %o2
	.word	0xb9b78e58	! t0_kref+0x4a10:   	fxnor	%f30, %f24, %f28
	.word	0xa9b7845e	! t0_kref+0x4a14:   	fcmpne16	%f30, %f30, %l4
	.word	0xb1b00f1a	! t0_kref+0x4a18:   	fsrc2	%f26, %f24
	.word	0xe840a010	! t0_kref+0x4a1c:   	ldsw	[%g2 + 0x10], %l4
	.word	0xd4ce9018	! t0_kref+0x4a20:   	ldsba	[%i2 + %i0]0x80, %o2
	.word	0xb9a00558	! t0_kref+0x4a24:   	fsqrtd	%f24, %f28
	.word	0xb7a6c9bb	! t0_kref+0x4a28:   	fdivs	%f27, %f27, %f27
	.word	0xac1b61b1	! t0_kref+0x4a2c:   	xor	%o5, 0x1b1, %l6
	.word	0xda20a028	! t0_kref+0x4a30:   	st	%o5, [%g2 + 0x28]
	.word	0xb9b60d9e	! t0_kref+0x4a34:   	fxor	%f24, %f30, %f28
	.word	0x81ae0adc	! t0_kref+0x4a38:   	fcmped	%fcc0, %f24, %f28
	.word	0xb1b68d9e	! t0_kref+0x4a3c:   	fxor	%f26, %f30, %f24
	.word	0x37800001	! t0_kref+0x4a40:   	fbge,a	_kref+0x4a44
	.word	0xd24e8019	! t0_kref+0x4a44:   	ldsb	[%i2 + %i1], %o1
	.word	0xf99eda59	! t0_kref+0x4a48:   	ldda	[%i3 + %i1]0xd2, %f28
	.word	0xa60b60cd	! t0_kref+0x4a4c:   	and	%o5, 0xcd, %l3
	.word	0xd610a008	! t0_kref+0x4a50:   	lduh	[%g2 + 8], %o3
	.word	0xf7060000	! t0_kref+0x4a54:   	ld	[%i0], %f27
	.word	0x9fc10000	! t0_kref+0x4a58:   	call	%g4
	.word	0xf99e5a5d	! t0_kref+0x4a5c:   	ldda	[%i1 + %i5]0xd2, %f28
	.word	0xb1b686b8	! t0_kref+0x4a60:   	fmul8x16al	%f26, %f24, %f24
	.word	0xff00a024	! t0_kref+0x4a64:   	ld	[%g2 + 0x24], %f31
	.word	0xb1a0053f	! t0_kref+0x4a68:   	fsqrts	%f31, %f24
	.word	0xe84e4000	! t0_kref+0x4a6c:   	ldsb	[%i1], %l4
	.word	0xb1a7c9be	! t0_kref+0x4a70:   	fdivs	%f31, %f30, %f24
	.word	0xe80e001a	! t0_kref+0x4a74:   	ldub	[%i0 + %i2], %l4
	.word	0xb1b7c67a	! t0_kref+0x4a78:   	fmul8x16au	%f31, %f26, %f24
	.word	0xda20a018	! t0_kref+0x4a7c:   	st	%o5, [%g2 + 0x18]
	.word	0x927b62ba	! t0_kref+0x4a80:   	sdiv	%o5, 0x2ba, %o1
	.word	0xd2100019	! t0_kref+0x4a84:   	lduh	[%g0 + %i1], %o1
	.word	0xae2b400d	! t0_kref+0x4a88:   	andn	%o5, %o5, %l7
	.word	0xf326001c	! t0_kref+0x4a8c:   	st	%f25, [%i0 + %i4]
	.word	0xd00e6014	! t0_kref+0x4a90:   	ldub	[%i1 + 0x14], %o0
	.word	0x97b705d8	! t0_kref+0x4a94:   	fcmpeq32	%f28, %f24, %o3
	.word	0xee48a03b	! t0_kref+0x4a98:   	ldsb	[%g2 + 0x3b], %l7
	.word	0xe806200c	! t0_kref+0x4a9c:   	ld	[%i0 + 0xc], %l4
	.word	0xb7a608bc	! t0_kref+0x4aa0:   	fsubs	%f24, %f28, %f27
	.word	0xbdb78f9c	! t0_kref+0x4aa4:   	for	%f30, %f28, %f30
	.word	0xb5a709bd	! t0_kref+0x4aa8:   	fdivs	%f28, %f29, %f26
	.word	0xb5b009ba	! t0_kref+0x4aac:   	fexpand	%f26, %f26
	.word	0xda30a022	! t0_kref+0x4ab0:   	sth	%o5, [%g2 + 0x22]
	.word	0x30800005	! t0_kref+0x4ab4:   	ba,a	_kref+0x4ac8
	.word	0xb7b68e3a	! t0_kref+0x4ab8:   	fands	%f26, %f26, %f27
	.word	0xf51e2008	! t0_kref+0x4abc:   	ldd	[%i0 + 8], %f26
	.word	0xbfa649ba	! t0_kref+0x4ac0:   	fdivs	%f25, %f26, %f31
	.word	0xb9b6cea0	! t0_kref+0x4ac4:   	fsrc1s	%f27, %f28
	.word	0xd4000018	! t0_kref+0x4ac8:   	ld	[%g0 + %i0], %o2
	.word	0xa9b3404d	! t0_kref+0x4acc:   	edge8l	%o5, %o5, %l4
	.word	0xee4e3ffb	! t0_kref+0x4ad0:   	ldsb	[%i0 - 5], %l7
	.word	0x91b3434d	! t0_kref+0x4ad4:   	alignaddrl	%o5, %o5, %o0
	.word	0xbdb00c00	! t0_kref+0x4ad8:   	fzero	%f30
	.word	0xb9a0053e	! t0_kref+0x4adc:   	fsqrts	%f30, %f28
	.word	0xb3a000bf	! t0_kref+0x4ae0:   	fnegs	%f31, %f25
	.word	0xe6067fe0	! t0_kref+0x4ae4:   	ld	[%i1 - 0x20], %l3
	.word	0xd2070019	! t0_kref+0x4ae8:   	ld	[%i4 + %i1], %o1
	.word	0xea567fe6	! t0_kref+0x4aec:   	ldsh	[%i1 - 0x1a], %l5
	.word	0xee10a010	! t0_kref+0x4af0:   	lduh	[%g2 + 0x10], %l7
	.word	0xf91e0000	! t0_kref+0x4af4:   	ldd	[%i0], %f28
	.word	0xa9b3430d	! t0_kref+0x4af8:   	alignaddr	%o5, %o5, %l4
	.word	0xbda78d3a	! t0_kref+0x4afc:   	fsmuld	%f30, %f26, %f30
	.word	0xb7a6c838	! t0_kref+0x4b00:   	fadds	%f27, %f24, %f27
	.word	0xa733400d	! t0_kref+0x4b04:   	srl	%o5, %o5, %l3
	call	SYM(t0_subr0)
	.word	0xbdb606fc	! t0_kref+0x4b0c:   	fmul8ulx16	%f24, %f28, %f30
	.word	0xb3b00778	! t0_kref+0x4b10:   	fpack16	%f24, %f25
	.word	0xe80e7fef	! t0_kref+0x4b14:   	ldub	[%i1 - 0x11], %l4
	.word	0x8d83400d	! t0_kref+0x4b18:   	wr	%o5, %o5, %fprs
	.word	0xda30a02e	! t0_kref+0x4b1c:   	sth	%o5, [%g2 + 0x2e]
	.word	0xfb067ff4	! t0_kref+0x4b20:   	ld	[%i1 - 0xc], %f29
	.word	0xd008a023	! t0_kref+0x4b24:   	ldub	[%g2 + 0x23], %o0
	.word	0xe6067ff4	! t0_kref+0x4b28:   	ld	[%i1 - 0xc], %l3
	.word	0xda267fe4	! t0_kref+0x4b2c:   	st	%o5, [%i1 - 0x1c]
	.word	0xadb34280	! t0_kref+0x4b30:   	array32	%o5, %g0, %l6
	.word	0xb7a789b8	! t0_kref+0x4b34:   	fdivs	%f30, %f24, %f27
	.word	0x29800004	! t0_kref+0x4b38:   	fbl,a	_kref+0x4b48
	.word	0xb1b00fc0	! t0_kref+0x4b3c:   	fone	%f24
	.word	0xfb063ff8	! t0_kref+0x4b40:   	ld	[%i0 - 8], %f29
	.word	0xd608a030	! t0_kref+0x4b44:   	ldub	[%g2 + 0x30], %o3
	.word	0xea6e600f	! t0_kref+0x4b48:   	ldstub	[%i1 + 0xf], %l5
	.word	0xb5a689ba	! t0_kref+0x4b4c:   	fdivs	%f26, %f26, %f26
	.word	0x90b3651c	! t0_kref+0x4b50:   	orncc	%o5, 0x51c, %o0
	.word	0xdaa81019	! t0_kref+0x4b54:   	stba	%o5, [%g0 + %i1]0x80
	.word	0xe80e6010	! t0_kref+0x4b58:   	ldub	[%i1 + 0x10], %l4
	.word	0xd056601e	! t0_kref+0x4b5c:   	ldsh	[%i1 + 0x1e], %o0
	.word	0xb5a0193c	! t0_kref+0x4b60:   	fstod	%f28, %f26
	.word	0xd2780018	! t0_kref+0x4b64:   	swap	[%g0 + %i0], %o1
	.word	0xff26601c	! t0_kref+0x4b68:   	st	%f31, [%i1 + 0x1c]
	.word	0xfb20a000	! t0_kref+0x4b6c:   	st	%f29, [%g2]
	.word	0xd4060000	! t0_kref+0x4b70:   	ld	[%i0], %o2
	.word	0x94637c61	! t0_kref+0x4b74:   	subc	%o5, -0x39f, %o2
	call	SYM(t0_subr0)
	.word	0xb1a0055a	! t0_kref+0x4b7c:   	fsqrtd	%f26, %f24
	.word	0xb1a0055a	! t0_kref+0x4b80:   	fsqrtd	%f26, %f24
	.word	0xea4e3fe6	! t0_kref+0x4b84:   	ldsb	[%i0 - 0x1a], %l5
	.word	0xd6560000	! t0_kref+0x4b88:   	ldsh	[%i0], %o3
	.word	0x94137c8f	! t0_kref+0x4b8c:   	or	%o5, -0x371, %o2
	.word	0xec063ffc	! t0_kref+0x4b90:   	ld	[%i0 - 4], %l6
	.word	0x9de3bfa0	! t0_kref+0x4b94:   	save	%sp, -0x60, %sp
	.word	0x97eec01d	! t0_kref+0x4b98:   	restore	%i3, %i5, %o3
	.word	0xb7a0053b	! t0_kref+0x4b9c:   	fsqrts	%f27, %f27
	.word	0xe60e8019	! t0_kref+0x4ba0:   	ldub	[%i2 + %i1], %l3
	.word	0xda20a028	! t0_kref+0x4ba4:   	st	%o5, [%g2 + 0x28]
	.word	0xbdb78f58	! t0_kref+0x4ba8:   	fornot1	%f30, %f24, %f30
	.word	0xbba01a3e	! t0_kref+0x4bac:   	fstoi	%f30, %f29
	.word	0xe8563ff0	! t0_kref+0x4bb0:   	ldsh	[%i0 - 0x10], %l4
	.word	0xbdb787d8	! t0_kref+0x4bb4:   	pdist	%f30, %f24, %f30
	.word	0x91408000	! t0_kref+0x4bb8:   	mov	%ccr, %o0
	.word	0xee567fe0	! t0_kref+0x4bbc:   	ldsh	[%i1 - 0x20], %l7
	.word	0x921b65f9	! t0_kref+0x4bc0:   	xor	%o5, 0x5f9, %o1
	.word	0xa7b7845e	! t0_kref+0x4bc4:   	fcmpne16	%f30, %f30, %l3
	.word	0xa6c3400d	! t0_kref+0x4bc8:   	addccc	%o5, %o5, %l3
	.word	0xe840a018	! t0_kref+0x4bcc:   	ldsw	[%g2 + 0x18], %l4
	.word	0xa744c000	! t0_kref+0x4bd0:   	mov	%gsr, %l3
	.word	0xb1a0055a	! t0_kref+0x4bd4:   	fsqrtd	%f26, %f24
	.word	0xd440a00c	! t0_kref+0x4bd8:   	ldsw	[%g2 + 0xc], %o2
	.word	0xf11e6008	! t0_kref+0x4bdc:   	ldd	[%i1 + 8], %f24
	.word	0xb9a688be	! t0_kref+0x4be0:   	fsubs	%f26, %f30, %f28
	.word	0xee4e001a	! t0_kref+0x4be4:   	ldsb	[%i0 + %i2], %l7
	.word	0xda30a01c	! t0_kref+0x4be8:   	sth	%o5, [%g2 + 0x1c]
	.word	0xbdb60e3d	! t0_kref+0x4bec:   	fands	%f24, %f29, %f30
	.word	0xb1a0053a	! t0_kref+0x4bf0:   	fsqrts	%f26, %f24
	.word	0xf900a018	! t0_kref+0x4bf4:   	ld	[%g2 + 0x18], %f28
	.word	0xa7b685da	! t0_kref+0x4bf8:   	fcmpeq32	%f26, %f26, %l3
	.word	0xe608a025	! t0_kref+0x4bfc:   	ldub	[%g2 + 0x25], %l3
	.word	0xb3a7c9bc	! t0_kref+0x4c00:   	fdivs	%f31, %f28, %f25
	.word	0x9523400d	! t0_kref+0x4c04:   	mulscc	%o5, %o5, %o2
	.word	0xea4e6011	! t0_kref+0x4c08:   	ldsb	[%i1 + 0x11], %l5
	.word	0xd00e8018	! t0_kref+0x4c0c:   	ldub	[%i2 + %i0], %o0
	.word	0xb3b6ca3d	! t0_kref+0x4c10:   	fpadd16s	%f27, %f29, %f25
	.word	0xaadb400d	! t0_kref+0x4c14:   	smulcc	%o5, %o5, %l5
	.word	0xa7b3404d	! t0_kref+0x4c18:   	edge8l	%o5, %o5, %l3
	.word	0xdaf75019	! t0_kref+0x4c1c:   	stxa	%o5, [%i5 + %i1]0x80
	.word	0xa7b7841e	! t0_kref+0x4c20:   	fcmple16	%f30, %f30, %l3
	.word	0xa653400d	! t0_kref+0x4c24:   	umul	%o5, %o5, %l3
	.word	0xafb3432d	! t0_kref+0x4c28:   	bmask	%o5, %o5, %l7
	.word	0xb9b70d60	! t0_kref+0x4c2c:   	fnot1s	%f28, %f28
	.word	0x858374e9	! t0_kref+0x4c30:   	wr	%o5, 0xfffff4e9, %ccr
	.word	0xd206601c	! t0_kref+0x4c34:   	ld	[%i1 + 0x1c], %o1
	.word	0xe80e001a	! t0_kref+0x4c38:   	ldub	[%i0 + %i2], %l4
	.word	0xb1a0053f	! t0_kref+0x4c3c:   	fsqrts	%f31, %f24
	.word	0xb9a00538	! t0_kref+0x4c40:   	fsqrts	%f24, %f28
	.word	0xee0e7fed	! t0_kref+0x4c44:   	ldub	[%i1 - 0x13], %l7
	.word	0xbdb6c6bf	! t0_kref+0x4c48:   	fmul8x16al	%f27, %f31, %f30
	.word	0xee00a020	! t0_kref+0x4c4c:   	ld	[%g2 + 0x20], %l7
	.word	0xd3f6100d	! t0_kref+0x4c50:   	casxa	[%i0]0x80, %o5, %o1
	.word	0xb5b7897a	! t0_kref+0x4c54:   	fpmerge	%f30, %f26, %f26
	.word	0xd44e2011	! t0_kref+0x4c58:   	ldsb	[%i0 + 0x11], %o2
	.word	0xfb00a004	! t0_kref+0x4c5c:   	ld	[%g2 + 4], %f29
	.word	0xd00e8018	! t0_kref+0x4c60:   	ldub	[%i2 + %i0], %o0
	.word	0xf900a038	! t0_kref+0x4c64:   	ld	[%g2 + 0x38], %f28
	.word	0x81ae8a5c	! t0_kref+0x4c68:   	fcmpd	%fcc0, %f26, %f28
	.word	0xfd20a038	! t0_kref+0x4c6c:   	st	%f30, [%g2 + 0x38]
	.word	0xb7a00539	! t0_kref+0x4c70:   	fsqrts	%f25, %f27
	.word	0xd64e3fee	! t0_kref+0x4c74:   	ldsb	[%i0 - 0x12], %o3
	.word	0xab408000	! t0_kref+0x4c78:   	mov	%ccr, %l5
	.word	0xbda0003c	! t0_kref+0x4c7c:   	fmovs	%f28, %f30
	.word	0xe608a029	! t0_kref+0x4c80:   	ldub	[%g2 + 0x29], %l3
	.word	0xb9a649bf	! t0_kref+0x4c84:   	fdivs	%f25, %f31, %f28
	.word	0xda28a010	! t0_kref+0x4c88:   	stb	%o5, [%g2 + 0x10]
	.word	0xee070019	! t0_kref+0x4c8c:   	ld	[%i4 + %i1], %l7
	.word	0xb1a708dc	! t0_kref+0x4c90:   	fsubd	%f28, %f28, %f24
	.word	0xbdb6cab8	! t0_kref+0x4c94:   	fpsub16s	%f27, %f24, %f30
	.word	0xb9b78f5c	! t0_kref+0x4c98:   	fornot1	%f30, %f28, %f28
	.word	0xd000a00c	! t0_kref+0x4c9c:   	ld	[%g2 + 0xc], %o0
	.word	0xda30a01e	! t0_kref+0x4ca0:   	sth	%o5, [%g2 + 0x1e]
	.word	0x922b400d	! t0_kref+0x4ca4:   	andn	%o5, %o5, %o1
	.word	0xabb6859a	! t0_kref+0x4ca8:   	fcmpgt32	%f26, %f26, %l5
	.word	0x25800007	! t0_kref+0x4cac:   	fblg,a	_kref+0x4cc8
	.word	0xec50a004	! t0_kref+0x4cb0:   	ldsh	[%g2 + 4], %l6
	.word	0xec062010	! t0_kref+0x4cb4:   	ld	[%i0 + 0x10], %l6
	.word	0xbbb6ce3a	! t0_kref+0x4cb8:   	fands	%f27, %f26, %f29
	.word	0x130b47a3	! t0_kref+0x4cbc:   	sethi	%hi(0x2d1e8c00), %o1
	.word	0xace37614	! t0_kref+0x4cc0:   	subccc	%o5, -0x9ec, %l6
	.word	0xd040a01c	! t0_kref+0x4cc4:   	ldsw	[%g2 + 0x1c], %o0
	.word	0xd00e8018	! t0_kref+0x4cc8:   	ldub	[%i2 + %i0], %o0
	.word	0xe800a00c	! t0_kref+0x4ccc:   	ld	[%g2 + 0xc], %l4
	.word	0xe41f4018	! t0_kref+0x4cd0:   	ldd	[%i5 + %i0], %l2
	.word	0xf1bf1a19	! t0_kref+0x4cd4:   	stda	%f24, [%i4 + %i1]0xd0
	.word	0xe60e8018	! t0_kref+0x4cd8:   	ldub	[%i2 + %i0], %l3
	.word	0x35800006	! t0_kref+0x4cdc:   	fbue,a	_kref+0x4cf4
	.word	0xee08a030	! t0_kref+0x4ce0:   	ldub	[%g2 + 0x30], %l7
	.word	0xea167fe2	! t0_kref+0x4ce4:   	lduh	[%i1 - 0x1e], %l5
	.word	0xb1b74efa	! t0_kref+0x4ce8:   	fornot2s	%f29, %f26, %f24
	.word	0xf11e7fe0	! t0_kref+0x4cec:   	ldd	[%i1 - 0x20], %f24
	.word	0xb1a0055c	! t0_kref+0x4cf0:   	fsqrtd	%f28, %f24
	.word	0xbda608ba	! t0_kref+0x4cf4:   	fsubs	%f24, %f26, %f30
	.word	0xa883400d	! t0_kref+0x4cf8:   	addcc	%o5, %o5, %l4
	.word	0xb9b60f9e	! t0_kref+0x4cfc:   	for	%f24, %f30, %f28
	.word	0xda263ffc	! t0_kref+0x4d00:   	st	%o5, [%i0 - 4]
	.word	0xd000a004	! t0_kref+0x4d04:   	ld	[%g2 + 4], %o0
	.word	0xb5b7cd39	! t0_kref+0x4d08:   	fandnot1s	%f31, %f25, %f26
	.word	0xb5b7091a	! t0_kref+0x4d0c:   	faligndata	%f28, %f26, %f26
	.word	0xec060000	! t0_kref+0x4d10:   	ld	[%i0], %l6
	.word	0xe4180018	! t0_kref+0x4d14:   	ldd	[%g0 + %i0], %l2
	.word	0xf9be101d	! t0_kref+0x4d18:   	stda	%f28, [%i0 + %i5]0x80
	.word	0xda267ff0	! t0_kref+0x4d1c:   	st	%o5, [%i1 - 0x10]
	.word	0xe8063ff0	! t0_kref+0x4d20:   	ld	[%i0 - 0x10], %l4
	.word	0xf500a010	! t0_kref+0x4d24:   	ld	[%g2 + 0x10], %f26
	.word	0xf700a02c	! t0_kref+0x4d28:   	ld	[%g2 + 0x2c], %f27
	.word	0xd4162016	! t0_kref+0x4d2c:   	lduh	[%i0 + 0x16], %o2
	.word	0xd2064000	! t0_kref+0x4d30:   	ld	[%i1], %o1
	.word	0xe8567fe4	! t0_kref+0x4d34:   	ldsh	[%i1 - 0x1c], %l4
	.word	0xf99f5a58	! t0_kref+0x4d38:   	ldda	[%i5 + %i0]0xd2, %f28
	.word	0xac13400d	! t0_kref+0x4d3c:   	or	%o5, %o5, %l6
	.word	0xa783400d	! t0_kref+0x4d40:   	wr	%o5, %o5, %gsr
	.word	0xf500a024	! t0_kref+0x4d44:   	ld	[%g2 + 0x24], %f26
	.word	0xf11e4000	! t0_kref+0x4d48:   	ldd	[%i1], %f24
	.word	0xda267fec	! t0_kref+0x4d4c:   	st	%o5, [%i1 - 0x14]
	.word	0xedee101c	! t0_kref+0x4d50:   	prefetcha	%i0 + %i4, 22
	.word	0xea40a004	! t0_kref+0x4d54:   	ldsw	[%g2 + 4], %l5
	.word	0xb5b68d9a	! t0_kref+0x4d58:   	fxor	%f26, %f26, %f26
	.word	0xea4e601a	! t0_kref+0x4d5c:   	ldsb	[%i1 + 0x1a], %l5
	.word	0x90f368b7	! t0_kref+0x4d60:   	udivcc	%o5, 0x8b7, %o0
	.word	0xee10a002	! t0_kref+0x4d64:   	lduh	[%g2 + 2], %l7
	.word	0xadb3434d	! t0_kref+0x4d68:   	alignaddrl	%o5, %o5, %l6
	.word	0xd6066000	! t0_kref+0x4d6c:   	ld	[%i1], %o3
	.word	0xb9a789b8	! t0_kref+0x4d70:   	fdivs	%f30, %f24, %f28
	.word	0xaaab7bc9	! t0_kref+0x4d74:   	andncc	%o5, -0x437, %l5
	.word	0xb9b60dd8	! t0_kref+0x4d78:   	fnand	%f24, %f24, %f28
	.word	0x9fc00004	! t0_kref+0x4d7c:   	call	%g0 + %g4
	.word	0x963b696c	! t0_kref+0x4d80:   	xnor	%o5, 0x96c, %o3
	.word	0xd2167fee	! t0_kref+0x4d84:   	lduh	[%i1 - 0x12], %o1
	.word	0xe64e401a	! t0_kref+0x4d88:   	ldsb	[%i1 + %i2], %l3
	.word	0xec16401b	! t0_kref+0x4d8c:   	lduh	[%i1 + %i3], %l6
	.word	0xbda6c8bd	! t0_kref+0x4d90:   	fsubs	%f27, %f29, %f30
	.word	0xbdb00f3d	! t0_kref+0x4d94:   	fsrc2s	%f29, %f30
	.word	0xda366012	! t0_kref+0x4d98:   	sth	%o5, [%i1 + 0x12]
	.word	0xb1b78e1a	! t0_kref+0x4d9c:   	fand	%f30, %f26, %f24
	.word	0xb1b70e1a	! t0_kref+0x4da0:   	fand	%f28, %f26, %f24
	.word	0xec0e401a	! t0_kref+0x4da4:   	ldub	[%i1 + %i2], %l6
	.word	0xf9be1a5b	! t0_kref+0x4da8:   	stda	%f28, [%i0 + %i3]0xd2
	.word	0xb5b60dd8	! t0_kref+0x4dac:   	fnand	%f24, %f24, %f26
	.word	0xd64e201a	! t0_kref+0x4db0:   	ldsb	[%i0 + 0x1a], %o3
	.word	0xfb00a02c	! t0_kref+0x4db4:   	ld	[%g2 + 0x2c], %f29
	.word	0xc1082ecc	! t0_kref+0x4db8:   	ld	[%g0 + 0xecc], %fsr
	.word	0x8143e05d	! t0_kref+0x4dbc:   	membar	0x5d
	.word	0xec563ff4	! t0_kref+0x4dc0:   	ldsh	[%i0 - 0xc], %l6
	.word	0xb5b70d9a	! t0_kref+0x4dc4:   	fxor	%f28, %f26, %f26
	.word	0xe810a01c	! t0_kref+0x4dc8:   	lduh	[%g2 + 0x1c], %l4
	.word	0xb3a01a3a	! t0_kref+0x4dcc:   	fstoi	%f26, %f25
	.word	0xda263fec	! t0_kref+0x4dd0:   	st	%o5, [%i0 - 0x14]
	.word	0x92ab6512	! t0_kref+0x4dd4:   	andncc	%o5, 0x512, %o1
	.word	0xbdb70f98	! t0_kref+0x4dd8:   	for	%f28, %f24, %f30
	.word	0xee563fe6	! t0_kref+0x4ddc:   	ldsh	[%i0 - 0x1a], %l7
	.word	0xda28a01d	! t0_kref+0x4de0:   	stb	%o5, [%g2 + 0x1d]
	.word	0x94b3400d	! t0_kref+0x4de4:   	orncc	%o5, %o5, %o2
	.word	0xd0167fe6	! t0_kref+0x4de8:   	lduh	[%i1 - 0x1a], %o0
	.word	0x95b3434d	! t0_kref+0x4dec:   	alignaddrl	%o5, %o5, %o2
	.word	0xf56e7fe0	! t0_kref+0x4df0:   	prefetch	%i1 - 0x20, 26
	.word	0xac1b400d	! t0_kref+0x4df4:   	xor	%o5, %o5, %l6
	.word	0xd00e8018	! t0_kref+0x4df8:   	ldub	[%i2 + %i0], %o0
	.word	0xb5b606f8	! t0_kref+0x4dfc:   	fmul8ulx16	%f24, %f24, %f26
	.word	0xbdb60dbc	! t0_kref+0x4e00:   	fxors	%f24, %f28, %f30
	.word	0xec080019	! t0_kref+0x4e04:   	ldub	[%g0 + %i1], %l6
	.word	0xf11e6018	! t0_kref+0x4e08:   	ldd	[%i1 + 0x18], %f24
	.word	0x86102002	! t0_kref+0x4e0c:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x4e10:   	bne,a	_kref+0x4e10
	.word	0x86a0e001	! t0_kref+0x4e14:   	subcc	%g3, 1, %g3
	.word	0xa7b34240	! t0_kref+0x4e18:   	array16	%o5, %g0, %l3
	.word	0xf100a00c	! t0_kref+0x4e1c:   	ld	[%g2 + 0xc], %f24
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x73344000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x7fb36000)
.seg "text"
t0_subr1_page_begin:
	.skip 8184
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x1544e000)
.seg "text"
t0_subr2_page_begin:
	.skip 8184
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x15944000)
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
!  Total operations: 4941  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              3.10   3.36
!  ldub              4.49   4.63
!  ldsh              2.75   2.89
!  lduh              2.47   2.43
!  ld                4.48   4.80
!  ldd               0.55   0.71
!  swap              0.15   0.16
!  ldstub            0.23   0.14
!  stb               0.51   0.43
!  sth               0.49   0.51
!  st                0.39   0.47
!  std               0.25   0.22
!  add               0.22   0.20
!  addcc             0.53   0.57
!  addx              0.01   0.02
!  addxcc            0.16   0.20
!  taddcc            0.03   0.04
!  taddcctv          0.01   0.02
!  sub               0.34   0.38
!  subcc             0.26   0.16
!  subx              0.20   0.22
!  subxcc            0.53   0.40
!  tsubcc            0.07   0.10
!  tsubcctv          0.08   0.10
!  mulscc            0.30   0.40
!  and               0.35   0.45
!  andcc             0.01   0.00
!  andn              0.39   0.38
!  andncc            0.44   0.20
!  or                0.55   0.71
!  orcc              0.35   0.36
!  orn               0.09   0.08
!  orncc             0.28   0.36
!  xor               0.31   0.28
!  xorcc             0.26   0.20
!  xnor              0.22   0.18
!  xnorcc            0.47   0.43
!  sll               0.18   0.18
!  srl               0.24   0.30
!  sra               0.21   0.28
!  unimp             0.10   0.14
!  umul              0.10   0.08
!  smul              0.40   0.34
!  udiv              0.20   0.06
!  sdiv              0.38   0.26
!  umulcc            0.20   0.20
!  smulcc            0.22   0.30
!  udivcc            0.46   0.59
!  sdivcc            0.05   0.10
!  rdy               0.20   0.20
!  wry               0.23   0.22
!  bicc              1.01   1.07
!  sethi             0.49   0.47
!  jmpl              0.34   0.32
!  call              0.35   0.28
!  ticc              0.00   0.00
!  flush             0.51   0.59
!  save              0.51   0.51
!  restore           0.11   0.00
!  stbar             0.25   0.26
!  ldf               1.83   1.66
!  lddf              2.79   2.55
!  stf               0.30   0.34
!  stdf              0.01   0.00
!  fadds             0.28   0.18
!  fsubs             0.54   0.51
!  fmuls             0.06   0.04
!  fdivs             4.26   4.53
!  faddd             0.09   0.10
!  fsubd             0.50   0.38
!  fmuld             0.15   0.10
!  fdivd             0.08   0.06
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.47   0.36
!  fdmulq            0.00   0.00
!  fitos             0.54   0.59
!  fitod             0.43   0.36
!  fitoq             0.00   0.00
!  fstoi             0.32   0.30
!  fstod             0.33   0.53
!  fstoq             0.00   0.00
!  fdtoi             0.27   0.22
!  fdtos             0.35   0.38
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.28   0.45
!  fnegs             0.34   0.36
!  fabss             0.17   0.14
!  fsqrts            2.24   2.23
!  fsqrtd            1.80   1.48
!  fsqrtq            0.00   0.00
!  fcmps             0.41   0.36
!  fcmpd             0.45   0.57
!  fcmpq             0.00   0.00
!  fcmpes            0.02   0.00
!  fcmped            0.44   0.45
!  fcmpeq            0.00   0.00
!  fbfcc             0.87   1.05
!  ldfsr             0.03   0.00
!  stfsr             0.07   0.04
!  loop              0.49   0.43
!  offset            0.11   0.34
!  area              0.09   0.00
!  target            0.04   0.02
!  goto              0.06   0.08
!  sigsegv           0.04   0.04
!  sigbus            0.07   0.04
!  imodify           0.01   0.00
!  ldfsr_offset      0.04   0.00
!  fpattern          0.28   0.30
!  lbranch           0.01   0.00
!  shmld             8.97   9.86
!  shmst             6.18   6.27
!  shmpf             0.49   0.49
!  shmswap           0.10   0.06
!  shmblkld          0.47   0.00
!  shmblkst          0.30   0.04
!  shmblkchk         0.02   0.04
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
!  return            0.04   0.04
!  casa              0.04   0.04
!  rdasi             0.06   0.04
!  wrasi             0.11   0.14
!  bpcc              0.05   0.02
!  fbpfcc            0.16   0.14
!  fmovscc           0.06   0.06
!  fmovdcc           0.02   0.02
!  fmovqcc           0.00   0.00
!  movcc             0.06   0.08
!  flushw            0.06   0.02
!  membar            0.10   0.06
!  prefetch          0.48   0.34
!  rdpc              0.02   0.04
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.09   0.02
!  lddfa             0.01   0.00
!  ldqfa             0.00   0.00
!  ldsba             0.07   0.06
!  ldsha             0.11   0.08
!  lduba             0.06   0.04
!  lduha             0.09   0.08
!  lda               0.08   0.08
!  ldda              0.03   0.04
!  ldstuba           0.04   0.06
!  prefetcha         0.29   0.28
!  stfa              0.09   0.06
!  stdfa             0.06   0.04
!  stqfa             0.00   0.00
!  stba              0.09   0.04
!  stha              0.10   0.08
!  sta               0.08   0.08
!  stda              0.07   0.06
!  swapa             0.00   0.00
!  fmovd             0.06   0.02
!  fnegd             0.00   0.00
!  fabsd             0.08   0.08
!  fstox             0.00   0.00
!  fdtox             0.04   0.04
!  fxtos             0.01   0.04
!  fxtod             0.05   0.10
!  lds               0.08   0.06
!  ldsa              0.03   0.04
!  ldx               0.03   0.02
!  ldxa              0.03   0.00
!  nofault           0.09   0.18
!  rdgsr             0.44   0.40
!  wrgsr             0.44   0.38
!  fpadd16           0.08   0.16
!  fpadd16s          0.05   0.02
!  fpadd32           0.07   0.04
!  fpadd32s          0.37   0.53
!  fpsub16           0.04   0.00
!  fpsub16s          0.09   0.10
!  fpsub32           0.19   0.20
!  fpsub32s          0.00   0.00
!  fpack16           0.32   0.36
!  fpack32           0.07   0.14
!  fpackfix          0.09   0.14
!  fexpand           0.48   0.47
!  fpmerge           0.37   0.53
!  fmul8x16          0.11   0.10
!  fmul8x16au        0.49   0.51
!  fmul8x16al        0.27   0.26
!  fmul8sux16        0.05   0.06
!  fmul8ulx16        0.34   0.28
!  fmuld8sux16       0.21   0.12
!  fmuld8ulx16       0.28   0.22
!  alignaddr         0.31   0.28
!  alignaddrl        0.20   0.20
!  faligndata        0.47   0.59
!  fzero             0.21   0.10
!  fzeros            0.08   0.06
!  fone              0.49   0.49
!  fones             0.19   0.20
!  fsrc1             0.23   0.26
!  fsrc1s            0.45   0.43
!  fsrc2             0.36   0.36
!  fsrc2s            0.20   0.34
!  fnot1             0.03   0.06
!  fnot1s            0.15   0.20
!  fnot2             0.34   0.30
!  fnot2s            0.11   0.08
!  for               0.27   0.30
!  fors              0.40   0.40
!  fnor              0.33   0.24
!  fnors             0.15   0.22
!  fand              0.26   0.16
!  fands             0.26   0.32
!  fnand             0.11   0.16
!  fnands            0.02   0.06
!  fxor              0.47   0.40
!  fxors             0.28   0.34
!  fxnor             0.40   0.36
!  fxnors            0.08   0.06
!  fornot1           0.24   0.24
!  fornot1s          0.05   0.04
!  fornot2           0.22   0.22
!  fornot2s          0.20   0.20
!  fandnot1          0.01   0.00
!  fandnot1s         0.07   0.10
!  fandnot2          0.11   0.14
!  fandnot2s         0.34   0.24
!  fcmpgt16          0.44   0.32
!  fcmpgt32          0.13   0.08
!  fcmple16          0.51   0.43
!  fcmple32          0.02   0.00
!  fcmpne16          0.37   0.38
!  fcmpne32          0.06   0.12
!  fcmpeq16          0.08   0.02
!  fcmpeq32          0.40   0.55
!  edge8             0.03   0.04
!  edge8l            0.41   0.69
!  edge16            0.24   0.24
!  edge16l           0.41   0.49
!  edge32            0.52   0.55
!  edge32l           0.08   0.04
!  pdist             0.19   0.30
!  partial_st8       0.05   0.04
!  partial_st16      0.33   0.26
!  partial_st32      0.44   0.38
!  short_st8         0.30   0.40
!  short_st16        0.22   0.16
!  short_ld8         0.53   0.38
!  short_ld16        0.22   0.24
!  blkld             0.52   0.00
!  blkst             0.48   0.00
!  blkld_offset      0.14   0.00
!  blkst_offset      0.02   0.00
!  blk_check         0.44   0.49
!  casxa             0.07   0.12
!  rdccr             0.47   0.47
!  rdfprs            0.22   0.20
!  wrccr             0.31   0.38
!  popc              0.31   0.47
!  wrfprs            0.26   0.40
!  stx               0.22   0.14
!  stxa              0.42   0.30
!  cflush            0.00   0.00
!  array8            0.21   0.10
!  array16           0.47   0.45
!  array32           0.09   0.14
!  edge8n            0.21   0.16
!  edge8ln           0.06   0.06
!  edge16n           0.00   0.00
!  edge16ln          0.06   0.04
!  edge32n           0.17   0.18
!  edge32ln          0.33   0.34
!  bmask             0.49   0.51
!  bshuffle          0.39   0.43
!  siam              0.05   0.12
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
KDATA_MODULE(t0_module_offset_table, 0x089b8000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xfffffff8
	.word	0xffffffe0
	.word	0x00000010
	.word	0x00000018
	.word	0x00000000
	.word	0xfffffff0
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

KDATA_MODULE(t0_module_data_in_regs, 0x3308a000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xf2f65cbf          ! %f0
	.word	0xb7ab5db1          ! %f1
	.word	0x9374636d          ! %f2
	.word	0x8f44ac5f          ! %f3
	.word	0x5a7fba80          ! %f4
	.word	0xdb9c27b7          ! %f5
	.word	0xee3073ad          ! %f6
	.word	0x7217d0d1          ! %f7
	.word	0xa25acd76          ! %f8
	.word	0xc3264a7d          ! %f9
	.word	0x61baf069          ! %f10
	.word	0x314d1713          ! %f11
	.word	0xbaa60a7d          ! %f12
	.word	0xc7965cf5          ! %f13
	.word	0x907bfca7          ! %f14
	.word	0x4b4f56b5          ! %f15
	.word	0x722b8f1e          ! %f16
	.word	0xed71ef34          ! %f17
	.word	0xb1f27aef          ! %f18
	.word	0xe8daf73c          ! %f19
	.word	0x075d1bcb          ! %f20
	.word	0xb14a3165          ! %f21
	.word	0x8b545b31          ! %f22
	.word	0x4569f239          ! %f23
	.word	0xea9eee68          ! %f24
	.word	0xeb9d95ff          ! %f25
	.word	0xce4b62e6          ! %f26
	.word	0x5a956296          ! %f27
	.word	0x5707410d          ! %f28
	.word	0xbaf4e33a          ! %f29
	.word	0x93f3d374          ! %f30
	.word	0x24303533          ! %f31
	.word	0x6cd0710a          ! %f32
	.word	0xc53b67be          ! %f33
	.word	0x1cb492d6          ! %f34
	.word	0x3303ceb0          ! %f35
	.word	0xe018122b          ! %f36
	.word	0x0519469d          ! %f37
	.word	0xfcdeba7c          ! %f38
	.word	0x7950ba8c          ! %f39
	.word	0x6765723c          ! %f40
	.word	0x69120e83          ! %f41
	.word	0xd47cb06f          ! %f42
	.word	0x03c2b76f          ! %f43
	.word	0xf41650cf          ! %f44
	.word	0xe799102c          ! %f45
	.word	0x6c972eb8          ! %f46
	.word	0xfca8b4c3          ! %f47
	.word	0x7b78cf3c          ! %f48
	.word	0x28702815          ! %f49
	.word	0x07b8dd02          ! %f50
	.word	0x0b369588          ! %f51
	.word	0x0e45dce8          ! %f52
	.word	0x47bcef75          ! %f53
	.word	0x34df607e          ! %f54
	.word	0x169fcc68          ! %f55
	.word	0x0d9fa3ca          ! %f56
	.word	0x7d8b886e          ! %f57
	.word	0xfd930606          ! %f58
	.word	0x3a372509          ! %f59
	.word	0x1cebb92b          ! %f60
	.word	0x0c357980          ! %f61
	.word	0xb7cc6a84          ! %f62
	.word	0x6db14ea2          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x5bc       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xbd4cd4b9          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x3b7b362b          ! %o0
	.word	0x1a73bb65          ! %o1
	.word	0x70abd2ec          ! %o2
	.word	0x055b7012          ! %o3
	.word	0x6f52a5ca          ! %o4
	.word	0xaf518c2b          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xa71916ac          ! %l0
	.word	0xe4964c3d          ! %l1
	.word	0x9ce1c595          ! %l2
	.word	0x006cfbd0          ! %l3
	.word	0x585e1f8d          ! %l4
	.word	0x075ee342          ! %l5
	.word	0xee2bba68          ! %l6
	.word	0x917cabaa          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffff4          ! %i2 (byte offset)
	.word	0xffffffec          ! %i3 (halfword offset)
	.word	0x00000014          ! %i4 (word offset)
	.word	0xfffffff0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x50fd092a          ! %y
	.word	0x0000000e          ! %icc (nzvc)
	.word	0x000008a2          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x11bde000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x2dabc339
	.word	0xbea17483
	.word	0x1cad966e
	.word	0xbdb7b856
	.word	0x0896a5b1
	.word	0xc17dc926
	.word	0x8465efef
	.word	0xca45554f
	.word	0x56d5b5fc
	.word	0x44c42813
	.word	0x223eb30c
	.word	0xae107b4b
	.word	0x58fb3ae9
	.word	0xef9b1b66
	.word	0x279877b8
	.word	0x635c759b
	.word	0xab2e9784
	.word	0xa3e9213e
	.word	0x856ed9f0
	.word	0xde27b091
	.word	0xde6c28bc
	.word	0xaad7628e
	.word	0xb3b2c9ff
	.word	0x086cfe78
	.word	0xad32d946
	.word	0x23c88335
	.word	0xd9c31cfd
	.word	0x00ffb7c4
	.word	0x4c1c8fc1
	.word	0x0963df4b
	.word	0x6ebf2198
	.word	0xad0d2a8a
	.word	0xff0cdb1b
	.word	0x4986c9bd
	.word	0x31e73d16
	.word	0x7e010d31
	.word	0x70738132
	.word	0x6ff2a01b
	.word	0x5bfbd49a
	.word	0xbf31e86a
	.word	0xefd6d3be
	.word	0x89a7c7b0
	.word	0xd2cb06a5
	.word	0x5b95ac5d
	.word	0x81b3ef6d
	.word	0xcd4ae7d3
	.word	0x6c21f8df
	.word	0xd30de524
	.word	0xbb01494f
	.word	0x6cf2f57c
	.word	0x655ebe17
	.word	0xbbde427c
	.word	0x90822e74
	.word	0xc493e419
	.word	0xdd2c1888
	.word	0x56d766b9
	.word	0x43e019d2
	.word	0xf7230fa2
	.word	0x95c09c5e
	.word	0x46eb30fa
	.word	0x4869046c
	.word	0x68cfb3ea
	.word	0x938ef678
	.word	0xb67ef69e
	.word	0x95a013b1
	.word	0x5f7b0538
	.word	0x56ed5b6e
	.word	0x21235ff6
	.word	0x48c04a21
	.word	0x4140be16
	.word	0xc31662d4
	.word	0x8ea0dc3b
	.word	0x76271e36
	.word	0x549a3668
	.word	0x1245d2c0
	.word	0x77c2e0c2
	.word	0x8a971b81
	.word	0xcbb357bf
	.word	0x11d81f89
	.word	0x6d3b676e
	.word	0xe8a0f212
	.word	0x162a02ef
	.word	0xe27ba3d1
	.word	0x409b6065
	.word	0x7a83981d
	.word	0x96e5bade
	.word	0x7beed4c6
	.word	0x25f40b05
	.word	0x92ba61d9
	.word	0xa83ea89e
	.word	0x99b6f6a4
	.word	0x85806a19
	.word	0xa77a33ab
	.word	0x5c884cbe
	.word	0xa2ef157d
	.word	0xeef54747
	.word	0x95cd3284
	.word	0x458571dd
	.word	0xbb07463c
	.word	0x770979cd
	.word	0x2a0e9686
	.word	0x3790347f
	.word	0xe04873e7
	.word	0x52af646c
	.word	0x937e83ed
	.word	0xfe9a3423
	.word	0xbf713d23
	.word	0x8d93dea3
	.word	0x31c00e2c
	.word	0x30d64194
	.word	0x6604a5fd
	.word	0x8205fd20
	.word	0x4391c956
	.word	0x261e1e7f
	.word	0xf72ba1e7
	.word	0x32ae6d73
	.word	0x78338dbf
	.word	0xe13c2245
	.word	0xf596b9ff
	.word	0xb9b45904
	.word	0x36f251e3
	.word	0xc269d812
	.word	0x17dd5397
	.word	0xc8590347
	.word	0xb47d3e85
	.word	0xd5d1ea2e
	.word	0x38ac5af1
	.word	0x3cf2972d
	.word	0x2235611b
	.word	0xbef4ee93
	.word	0x10ee564a
	.word	0x66c1d7dd
	.word	0x8adba069
	.word	0xb7b5e8be
	.word	0x94332519
	.word	0xdea5a8a3
	.word	0x5016d76b
	.word	0x00cc94c9
	.word	0x0f3def98
	.word	0x546aa028
	.word	0xdf863a77
	.word	0xf6a8cfb9
	.word	0x62040a83
	.word	0x31a41ae3
	.word	0xaab26aa3
	.word	0xd2b3b115
	.word	0xb1cfd31f
	.word	0x0fdf80cf
	.word	0xe571db63
	.word	0xda9029b7
	.word	0xd9e6c77d
	.word	0x3fd9b25e
	.word	0x207b6e76
	.word	0x56c63be5
	.word	0x51425eff
	.word	0xbd69d0ad
	.word	0xbc2c6a03
	.word	0x6d6120a3
	.word	0x96df671b
	.word	0x1753d4f8
	.word	0x08352cfe
	.word	0xccb9ee42
	.word	0xe41fe85e
	.word	0xee68ab4f
	.word	0xf23245d0
	.word	0xa42d943c
	.word	0x91f7d7b4
	.word	0x9380c48a
t0_data_in_sp:
	.word	0x8d6dcf37
	.word	0x85164043
	.word	0x7a5d17e6
	.word	0x03395379
	.word	0xcb5f376a
	.word	0x8b4d8097
	.word	0x9ff78f63
	.word	0x882ba960
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffff8
	.word	0x00000008
	.word	0x00000014
	.word	0xffffffe0
	.word	t0_data_in_fp
	.word	0xfedeb49b
	.word	0xfbbb4087
	.word	0xdaff6cbb
	.word	0x414e201d
	.word	0xe7628600
	.word	0x0bde48a4
	.word	0x26acda73
	.word	0x2e311f2c
	.word	0xa614d883
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
	.word   	0x2b1e9e43	! [%fp - 0xc]
	.word   	0x279a634f	! [%fp - 0x8]
	.word   	0x556687b7	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x21c077d2
	.word	0xff2f5d42
	.word	0x6011d94b
	.word	0x234d08c6
	.word	0x7d13c460
	.word	0x98aa30ff
	.word	0x417cc7c7
	.word	0x0a0705da
	.word	0x4bb63278
	.word	0xdbd267d4
	.word	0x80ac5abe
	.word	0x39c0c00c
	.word	0x364e2695
	.word	0x90773ae5
	.word	0x465c053d
	.word	0xb4cd6d75
	.word	0xf617c2f0
	.word	0xda4c4e18
	.word	0x6b939b11
	.word	0xf273e2d0
	.word	0x21a27a59
	.word	0xeafbac64
	.word	0xfaa4d1c2
	.word	0x05a9b35e
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x75918000)
.seg "data"
t0_data_in_area0_start:
.skip 6272
t0_data_in_area0_begin:
	.word	0xe7547c4a	! t0_data_in_area0-0x20
	.word	0x79a4c44f	! t0_data_in_area0-0x1c
	.word	0x68cb5cc0	! t0_data_in_area0-0x18
	.word	0x1785eb09	! t0_data_in_area0-0x14
	.word	0x14b04e38	! t0_data_in_area0-0x10
	.word	0x94b028b1	! t0_data_in_area0-0xc
	.word	0xd93618dc	! t0_data_in_area0-0x8
	.word	0xd622c6cc	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xcc4a262c	! t0_data_in_area0+0x0
	.word	0x631819bd	! t0_data_in_area0+0x4
	.word	0x5bb2faf9	! t0_data_in_area0+0x8
	.word	0xc2380f51	! t0_data_in_area0+0xc
	.word	0x051fda92	! t0_data_in_area0+0x10
	.word	0x4dc21a41	! t0_data_in_area0+0x14
	.word	0x969eb602	! t0_data_in_area0+0x18
	.word	0x6e2df9db	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 1856
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x518aa000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x65df7b51	! t0_data_in_shm_area+0x0 (t0)
	.word	0x4086152c	! t0_data_in_shm_area+0x4 (t0)
	.word	0xf0544c1e	! t0_data_in_shm_area+0x8 (t0)
	.word	0x5302b366	! t0_data_in_shm_area+0xc (t0)
	.word	0xa2d5e81b	! t0_data_in_shm_area+0x10 (t0)
	.word	0x7143d751	! t0_data_in_shm_area+0x14 (t0)
	.word	0xd767ff22	! t0_data_in_shm_area+0x18 (t0)
	.word	0xc85afa0b	! t0_data_in_shm_area+0x1c (t0)
	.word	0x26fff805	! t0_data_in_shm_area+0x20 (t0)
	.word	0x9a2fe16a	! t0_data_in_shm_area+0x24 (t0)
	.word	0xadbc5447	! t0_data_in_shm_area+0x28 (t0)
	.word	0x7fb868a9	! t0_data_in_shm_area+0x2c (t0)
	.word	0x454e0659	! t0_data_in_shm_area+0x30 (t0)
	.word	0x4f8cd65e	! t0_data_in_shm_area+0x34 (t0)
	.word	0x80371f1c	! t0_data_in_shm_area+0x38 (t0)
	.word	0x155658c1	! t0_data_in_shm_area+0x3c (t0)
	.word	0x4fd2f8ab	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x109709c6	! t0_data_in_shm_area+0x44
	.word	0xb6c7c7be	! t0_data_in_shm_area+0x48
	.word	0x75d87ea2	! t0_data_in_shm_area+0x4c
	.word	0xec95122a	! t0_data_in_shm_area+0x50
	.word	0xabbbf2ad	! t0_data_in_shm_area+0x54
	.word	0x55cf4045	! t0_data_in_shm_area+0x58
	.word	0xfd04a3c5	! t0_data_in_shm_area+0x5c
	.word	0x94482837	! t0_data_in_shm_area+0x60
	.word	0x4f8f8697	! t0_data_in_shm_area+0x64
	.word	0x060d5d81	! t0_data_in_shm_area+0x68
	.word	0xf173237a	! t0_data_in_shm_area+0x6c
	.word	0xeb9e0c3b	! t0_data_in_shm_area+0x70
	.word	0x388dc0c4	! t0_data_in_shm_area+0x74
	.word	0x9a3e86e5	! t0_data_in_shm_area+0x78
	.word	0xe1b80dc3	! t0_data_in_shm_area+0x7c
	.word	0x45533eb5	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xe7d6d9b5	! t0_data_in_shm_area+0x84
	.word	0x1ccff1c3	! t0_data_in_shm_area+0x88
	.word	0x1341147f	! t0_data_in_shm_area+0x8c
	.word	0x0eeb3f91	! t0_data_in_shm_area+0x90
	.word	0x84f8f2ef	! t0_data_in_shm_area+0x94
	.word	0xf3bfdbb9	! t0_data_in_shm_area+0x98
	.word	0xb842a6ca	! t0_data_in_shm_area+0x9c
	.word	0xc5710fc0	! t0_data_in_shm_area+0xa0
	.word	0xd4c23afe	! t0_data_in_shm_area+0xa4
	.word	0x7022786b	! t0_data_in_shm_area+0xa8
	.word	0xb2d0dea3	! t0_data_in_shm_area+0xac
	.word	0xb7c5b804	! t0_data_in_shm_area+0xb0
	.word	0xa542cdbc	! t0_data_in_shm_area+0xb4
	.word	0x311b8671	! t0_data_in_shm_area+0xb8
	.word	0xdde724d0	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x342b4000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xf2f65cbf          ! %f0
	.word	0xb7ab5db1          ! %f1
	.word	0x9374636d          ! %f2
	.word	0x8f44ac5f          ! %f3
	.word	0x5a7fba80          ! %f4
	.word	0xdb9c27b7          ! %f5
	.word	0xee3073ad          ! %f6
	.word	0x7217d0d1          ! %f7
	.word	0xa25acd76          ! %f8
	.word	0xc3264a7d          ! %f9
	.word	0x61baf069          ! %f10
	.word	0x314d1713          ! %f11
	.word	0xbaa60a7d          ! %f12
	.word	0xc7965cf5          ! %f13
	.word	0x907bfca7          ! %f14
	.word	0x4b4f56b5          ! %f15
	.word	0x722b8f1e          ! %f16
	.word	0xed71ef34          ! %f17
	.word	0xb1f27aef          ! %f18
	.word	0xe8daf73c          ! %f19
	.word	0x075d1bcb          ! %f20
	.word	0xb14a3165          ! %f21
	.word	0x8b545b31          ! %f22
	.word	0x4569f239          ! %f23
	.word	0xea9eee68          ! %f24
	.word	0xeb9d95ff          ! %f25
	.word	0xce4b62e6          ! %f26
	.word	0x5a956296          ! %f27
	.word	0x5707410d          ! %f28
	.word	0xbaf4e33a          ! %f29
	.word	0x93f3d374          ! %f30
	.word	0x24303533          ! %f31
	.word	0x6cd0710a          ! %f32
	.word	0xc53b67be          ! %f33
	.word	0x1cb492d6          ! %f34
	.word	0x3303ceb0          ! %f35
	.word	0xe018122b          ! %f36
	.word	0x0519469d          ! %f37
	.word	0xfcdeba7c          ! %f38
	.word	0x7950ba8c          ! %f39
	.word	0x6765723c          ! %f40
	.word	0x69120e83          ! %f41
	.word	0xd47cb06f          ! %f42
	.word	0x03c2b76f          ! %f43
	.word	0xf41650cf          ! %f44
	.word	0xe799102c          ! %f45
	.word	0x6c972eb8          ! %f46
	.word	0xfca8b4c3          ! %f47
	.word	0x7b78cf3c          ! %f48
	.word	0x28702815          ! %f49
	.word	0x07b8dd02          ! %f50
	.word	0x0b369588          ! %f51
	.word	0x0e45dce8          ! %f52
	.word	0x47bcef75          ! %f53
	.word	0x34df607e          ! %f54
	.word	0x169fcc68          ! %f55
	.word	0x0d9fa3ca          ! %f56
	.word	0x7d8b886e          ! %f57
	.word	0xfd930606          ! %f58
	.word	0x3a372509          ! %f59
	.word	0x1cebb92b          ! %f60
	.word	0x0c357980          ! %f61
	.word	0xb7cc6a84          ! %f62
	.word	0x6db14ea2          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x5bc       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xbd4cd4b9          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x3b7b362b          ! %o0
	.word	0x1a73bb65          ! %o1
	.word	0x70abd2ec          ! %o2
	.word	0x055b7012          ! %o3
	.word	0x6f52a5ca          ! %o4
	.word	0xaf518c2b          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xa71916ac          ! %l0
	.word	0xe4964c3d          ! %l1
	.word	0x9ce1c595          ! %l2
	.word	0x006cfbd0          ! %l3
	.word	0x585e1f8d          ! %l4
	.word	0x075ee342          ! %l5
	.word	0xee2bba68          ! %l6
	.word	0x917cabaa          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffff4          ! %i2 (byte offset)
	.word	0xffffffec          ! %i3 (halfword offset)
	.word	0x00000014          ! %i4 (word offset)
	.word	0xfffffff0          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x50fd092a          ! %y
	.word	0x0000000e          ! %icc (nzvc)
	.word	0x000008a2          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x5dd52000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x2dabc339
	.word	0xbea17483
	.word	0x1cad966e
	.word	0xbdb7b856
	.word	0x0896a5b1
	.word	0xc17dc926
	.word	0x8465efef
	.word	0xca45554f
	.word	0x56d5b5fc
	.word	0x44c42813
	.word	0x223eb30c
	.word	0xae107b4b
	.word	0x58fb3ae9
	.word	0xef9b1b66
	.word	0x279877b8
	.word	0x635c759b
	.word	0xab2e9784
	.word	0xa3e9213e
	.word	0x856ed9f0
	.word	0xde27b091
	.word	0xde6c28bc
	.word	0xaad7628e
	.word	0xb3b2c9ff
	.word	0x086cfe78
	.word	0xad32d946
	.word	0x23c88335
	.word	0xd9c31cfd
	.word	0x00ffb7c4
	.word	0x4c1c8fc1
	.word	0x0963df4b
	.word	0x6ebf2198
	.word	0xad0d2a8a
	.word	0xff0cdb1b
	.word	0x4986c9bd
	.word	0x31e73d16
	.word	0x7e010d31
	.word	0x70738132
	.word	0x6ff2a01b
	.word	0x5bfbd49a
	.word	0xbf31e86a
	.word	0xefd6d3be
	.word	0x89a7c7b0
	.word	0xd2cb06a5
	.word	0x5b95ac5d
	.word	0x81b3ef6d
	.word	0xcd4ae7d3
	.word	0x6c21f8df
	.word	0xd30de524
	.word	0xbb01494f
	.word	0x6cf2f57c
	.word	0x655ebe17
	.word	0xbbde427c
	.word	0x90822e74
	.word	0xc493e419
	.word	0xdd2c1888
	.word	0x56d766b9
	.word	0x43e019d2
	.word	0xf7230fa2
	.word	0x95c09c5e
	.word	0x46eb30fa
	.word	0x4869046c
	.word	0x68cfb3ea
	.word	0x938ef678
	.word	0xb67ef69e
	.word	0x95a013b1
	.word	0x5f7b0538
	.word	0x56ed5b6e
	.word	0x21235ff6
	.word	0x48c04a21
	.word	0x4140be16
	.word	0xc31662d4
	.word	0x8ea0dc3b
	.word	0x76271e36
	.word	0x549a3668
	.word	0x1245d2c0
	.word	0x77c2e0c2
	.word	0x8a971b81
	.word	0xcbb357bf
	.word	0x11d81f89
	.word	0x6d3b676e
	.word	0xe8a0f212
	.word	0x162a02ef
	.word	0xe27ba3d1
	.word	0x409b6065
	.word	0x7a83981d
	.word	0x96e5bade
	.word	0x7beed4c6
	.word	0x25f40b05
	.word	0x92ba61d9
	.word	0xa83ea89e
	.word	0x99b6f6a4
	.word	0x85806a19
	.word	0xa77a33ab
	.word	0x5c884cbe
	.word	0xa2ef157d
	.word	0xeef54747
	.word	0x95cd3284
	.word	0x458571dd
	.word	0xbb07463c
	.word	0x770979cd
	.word	0x2a0e9686
	.word	0x3790347f
	.word	0xe04873e7
	.word	0x52af646c
	.word	0x937e83ed
	.word	0xfe9a3423
	.word	0xbf713d23
	.word	0x8d93dea3
	.word	0x31c00e2c
	.word	0x30d64194
	.word	0x6604a5fd
	.word	0x8205fd20
	.word	0x4391c956
	.word	0x261e1e7f
	.word	0xf72ba1e7
	.word	0x32ae6d73
	.word	0x78338dbf
	.word	0xe13c2245
	.word	0xf596b9ff
	.word	0xb9b45904
	.word	0x36f251e3
	.word	0xc269d812
	.word	0x17dd5397
	.word	0xc8590347
	.word	0xb47d3e85
	.word	0xd5d1ea2e
	.word	0x38ac5af1
	.word	0x3cf2972d
	.word	0x2235611b
	.word	0xbef4ee93
	.word	0x10ee564a
	.word	0x66c1d7dd
	.word	0x8adba069
	.word	0xb7b5e8be
	.word	0x94332519
	.word	0xdea5a8a3
	.word	0x5016d76b
	.word	0x00cc94c9
	.word	0x0f3def98
	.word	0x546aa028
	.word	0xdf863a77
	.word	0xf6a8cfb9
	.word	0x62040a83
	.word	0x31a41ae3
	.word	0xaab26aa3
	.word	0xd2b3b115
	.word	0xb1cfd31f
	.word	0x0fdf80cf
	.word	0xe571db63
	.word	0xda9029b7
	.word	0xd9e6c77d
	.word	0x3fd9b25e
	.word	0x207b6e76
	.word	0x56c63be5
	.word	0x51425eff
	.word	0xbd69d0ad
	.word	0xbc2c6a03
	.word	0x6d6120a3
	.word	0x96df671b
	.word	0x1753d4f8
	.word	0x08352cfe
	.word	0xccb9ee42
	.word	0xe41fe85e
	.word	0xee68ab4f
	.word	0xf23245d0
	.word	0xa42d943c
	.word	0x91f7d7b4
	.word	0x9380c48a
t0_data_exp_sp:
	.word	0x8d6dcf37
	.word	0x85164043
	.word	0x7a5d17e6
	.word	0x03395379
	.word	0xcb5f376a
	.word	0x8b4d8097
	.word	0x9ff78f63
	.word	0x882ba960
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffff8
	.word	0x00000008
	.word	0x00000014
	.word	0xffffffe0
	.word	t0_data_exp_fp
	.word	0xfedeb49b
	.word	0xfbbb4087
	.word	0xdaff6cbb
	.word	0x414e201d
	.word	0xe7628600
	.word	0x0bde48a4
	.word	0x26acda73
	.word	0x2e311f2c
	.word	0xa614d883
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
	.word   	0x2b1e9e43	! [%fp - 0xc]
	.word   	0x279a634f	! [%fp - 0x8]
	.word   	0x556687b7	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x21c077d2
	.word	0xff2f5d42
	.word	0x6011d94b
	.word	0x234d08c6
	.word	0x7d13c460
	.word	0x98aa30ff
	.word	0x417cc7c7
	.word	0x0a0705da
	.word	0x4bb63278
	.word	0xdbd267d4
	.word	0x80ac5abe
	.word	0x39c0c00c
	.word	0x364e2695
	.word	0x90773ae5
	.word	0x465c053d
	.word	0xb4cd6d75
	.word	0xf617c2f0
	.word	0xda4c4e18
	.word	0x6b939b11
	.word	0xf273e2d0
	.word	0x21a27a59
	.word	0xeafbac64
	.word	0xfaa4d1c2
	.word	0x05a9b35e
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x1c208000)
.seg "data"
t0_data_exp_area0_start:
.skip 6272
t0_data_exp_area0_begin:
	.word	0xe7547c4a	! t0_data_exp_area0-0x20
	.word	0x79a4c44f	! t0_data_exp_area0-0x1c
	.word	0x68cb5cc0	! t0_data_exp_area0-0x18
	.word	0x1785eb09	! t0_data_exp_area0-0x14
	.word	0x14b04e38	! t0_data_exp_area0-0x10
	.word	0x94b028b1	! t0_data_exp_area0-0xc
	.word	0xd93618dc	! t0_data_exp_area0-0x8
	.word	0xd622c6cc	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xcc4a262c	! t0_data_exp_area0+0x0
	.word	0x631819bd	! t0_data_exp_area0+0x4
	.word	0x5bb2faf9	! t0_data_exp_area0+0x8
	.word	0xc2380f51	! t0_data_exp_area0+0xc
	.word	0x051fda92	! t0_data_exp_area0+0x10
	.word	0x4dc21a41	! t0_data_exp_area0+0x14
	.word	0x969eb602	! t0_data_exp_area0+0x18
	.word	0x6e2df9db	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 1856
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x1da34000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x65df7b51	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x4086152c	! t0_data_exp_shm_area+0x4 (t0)
	.word	0xf0544c1e	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x5302b366	! t0_data_exp_shm_area+0xc (t0)
	.word	0xa2d5e81b	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x7143d751	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xd767ff22	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xc85afa0b	! t0_data_exp_shm_area+0x1c (t0)
	.word	0x26fff805	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x9a2fe16a	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xadbc5447	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x7fb868a9	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x454e0659	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x4f8cd65e	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x80371f1c	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x155658c1	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x4fd2f8ab	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x109709c6	! t0_data_exp_shm_area+0x44
	.word	0xb6c7c7be	! t0_data_exp_shm_area+0x48
	.word	0x75d87ea2	! t0_data_exp_shm_area+0x4c
	.word	0xec95122a	! t0_data_exp_shm_area+0x50
	.word	0xabbbf2ad	! t0_data_exp_shm_area+0x54
	.word	0x55cf4045	! t0_data_exp_shm_area+0x58
	.word	0xfd04a3c5	! t0_data_exp_shm_area+0x5c
	.word	0x94482837	! t0_data_exp_shm_area+0x60
	.word	0x4f8f8697	! t0_data_exp_shm_area+0x64
	.word	0x060d5d81	! t0_data_exp_shm_area+0x68
	.word	0xf173237a	! t0_data_exp_shm_area+0x6c
	.word	0xeb9e0c3b	! t0_data_exp_shm_area+0x70
	.word	0x388dc0c4	! t0_data_exp_shm_area+0x74
	.word	0x9a3e86e5	! t0_data_exp_shm_area+0x78
	.word	0xe1b80dc3	! t0_data_exp_shm_area+0x7c
	.word	0x45533eb5	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xe7d6d9b5	! t0_data_exp_shm_area+0x84
	.word	0x1ccff1c3	! t0_data_exp_shm_area+0x88
	.word	0x1341147f	! t0_data_exp_shm_area+0x8c
	.word	0x0eeb3f91	! t0_data_exp_shm_area+0x90
	.word	0x84f8f2ef	! t0_data_exp_shm_area+0x94
	.word	0xf3bfdbb9	! t0_data_exp_shm_area+0x98
	.word	0xb842a6ca	! t0_data_exp_shm_area+0x9c
	.word	0xc5710fc0	! t0_data_exp_shm_area+0xa0
	.word	0xd4c23afe	! t0_data_exp_shm_area+0xa4
	.word	0x7022786b	! t0_data_exp_shm_area+0xa8
	.word	0xb2d0dea3	! t0_data_exp_shm_area+0xac
	.word	0xb7c5b804	! t0_data_exp_shm_area+0xb0
	.word	0xa542cdbc	! t0_data_exp_shm_area+0xb4
	.word	0x311b8671	! t0_data_exp_shm_area+0xb8
	.word	0xdde724d0	! t0_data_exp_shm_area+0xbc
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



