/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_27_1_2004_0_13.s
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
#define T0_KAOS_SEED          d1e996d0b103
#define T0_KAOS_ICOUNT        2513
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    5376
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2519

#define T0_KAOS_BOOT_VA                  0x69a1a000
#define T0_KAOS_BOOT_PA                  0x0000000000a04000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x22908000
#define T0_KAOS_STARTUP_PA               0x00000000031b6000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x35072000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004bdc000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x6c9c4000
#define T0_KAOS_DONE_PA                  0x0000000007720000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x0c5da000
#define T0_KAOS_KTBL_PA                  0x0000000008a80000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x1e408000
#define T0_KAOS_SUBR0_PA                 0x000000000ab38000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x1d604000
#define T0_KAOS_SUBR1_PA                 0x000000000c2da000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x0c73a000
#define T0_KAOS_SUBR2_PA                 0x000000000eeee000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x0c544000
#define T0_KAOS_SUBR3_PA                 0x0000000010f16000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x0434a000
#define T0_KAOS_EXP_REGS_PA              0x0000000013ae2000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x0ee86000
#define T0_KAOS_RUN_REGS_PA              0x0000000014da8000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x3637a000
#define T0_KAOS_EXP_STACK_PA             0x000000001743e000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x365ca000
#define T0_KAOS_RUN_STACK_PA             0x0000000018900000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x6a9f4000
#define T0_KAOS_EXP_AREA0_PA             0x000000001b22c000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x76c50000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d892000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x19a50000
#define T0_KAOS_EXP_SHM_AREA_PA          0x00000000001fa000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x2919a000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000962000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x1c7297f6
#define T0_KAOS_RANVAL_01     0x92fc8b6c
#define T0_KAOS_RANVAL_02     0x66090a62
#define T0_KAOS_RANVAL_03     0x9d4e59c6
#define T0_KAOS_RANVAL_04     0xf30907ea
#define T0_KAOS_RANVAL_05     0xa9d49c6f
#define T0_KAOS_RANVAL_06     0x67b81ba2
#define T0_KAOS_RANVAL_07     0x7bf3fc26
#define T0_KAOS_RANVAL_08     0x833fbf7d
#define T0_KAOS_RANVAL_09     0xee1c0c3e
#define T0_KAOS_RANVAL_0a     0xefe2ad53
#define T0_KAOS_RANVAL_0b     0x62d1fe25
#define T0_KAOS_RANVAL_0c     0x061142d2
#define T0_KAOS_RANVAL_0d     0x023351ce
#define T0_KAOS_RANVAL_0e     0xa099eaa6
#define T0_KAOS_RANVAL_0f     0x2ff05ba7
#define T0_KAOS_RANVAL_10     0x456bba56
#define T0_KAOS_RANVAL_11     0xe3250d15
#define T0_KAOS_RANVAL_12     0x5f4013b4
#define T0_KAOS_RANVAL_13     0x5253ba83
#define T0_KAOS_RANVAL_14     0x4207e9cc
#define T0_KAOS_RANVAL_15     0xc5993287
#define T0_KAOS_RANVAL_16     0x76da9cb1
#define T0_KAOS_RANVAL_17     0x0aed6bab
#define T0_KAOS_RANVAL_18     0xbfd004a5
#define T0_KAOS_RANVAL_19     0xd5d0eadd
#define T0_KAOS_RANVAL_1a     0xe20a8c62
#define T0_KAOS_RANVAL_1b     0xbb27da90
#define T0_KAOS_RANVAL_1c     0x4beef394
#define T0_KAOS_RANVAL_1d     0x011a2b17
#define T0_KAOS_RANVAL_1e     0x8787cdcc
#define T0_KAOS_RANVAL_1f     0xdac00ec4
#define T0_KAOS_RANVAL_20     0x1015df62
#define T0_KAOS_RANVAL_21     0x389648c4
#define T0_KAOS_RANVAL_22     0xb893692d
#define T0_KAOS_RANVAL_23     0x868323e0
#define T0_KAOS_RANVAL_24     0x110f14fe
#define T0_KAOS_RANVAL_25     0xa91f0e81
#define T0_KAOS_RANVAL_26     0x2f9fd82f
#define T0_KAOS_RANVAL_27     0xe190dba7
#define T0_KAOS_RANVAL_28     0x589296d7
#define T0_KAOS_RANVAL_29     0x56ca14be
#define T0_KAOS_RANVAL_2a     0x15ade95b
#define T0_KAOS_RANVAL_2b     0x1932ae6b
#define T0_KAOS_RANVAL_2c     0xa4c1ef6e
#define T0_KAOS_RANVAL_2d     0x8c4262c7
#define T0_KAOS_RANVAL_2e     0xd9cfe6cb
#define T0_KAOS_RANVAL_2f     0xc268fdaf
#define T0_KAOS_RANVAL_30     0xfff61926
#define T0_KAOS_RANVAL_31     0x0b2c9c02
#define T0_KAOS_RANVAL_32     0x7f2bf423
#define T0_KAOS_RANVAL_33     0x66464d0d
#define T0_KAOS_RANVAL_34     0xa2e38f5e
#define T0_KAOS_RANVAL_35     0xd34a3d75
#define T0_KAOS_RANVAL_36     0x3df1d7c1
#define T0_KAOS_RANVAL_37     0x714aa55a
#define T0_KAOS_RANVAL_38     0x96c5dcc1
#define T0_KAOS_RANVAL_39     0x5e54af8b
#define T0_KAOS_RANVAL_3a     0x2a47a333
#define T0_KAOS_RANVAL_3b     0xc86f8607
#define T0_KAOS_RANVAL_3c     0x26853adc
#define T0_KAOS_RANVAL_3d     0x0ed13017
#define T0_KAOS_RANVAL_3e     0xfc73eee9
#define T0_KAOS_RANVAL_3f     0x16b708ca
#define T0_KAOS_RANVAL_40     0x91de16f0
#define T0_KAOS_RANVAL_41     0x44aad899
#define T0_KAOS_RANVAL_42     0xf6c39d2b
#define T0_KAOS_RANVAL_43     0x6e171b7c
#define T0_KAOS_RANVAL_44     0xfdbb9009
#define T0_KAOS_RANVAL_45     0x937044bf
#define T0_KAOS_RANVAL_46     0x5b14584c
#define T0_KAOS_RANVAL_47     0x30c3f444
#define T0_KAOS_RANVAL_48     0xf673424f
#define T0_KAOS_RANVAL_49     0x37e69d2d
#define T0_KAOS_RANVAL_4a     0x7acc4020
#define T0_KAOS_RANVAL_4b     0xe26b23f5
#define T0_KAOS_RANVAL_4c     0x44a1f39b
#define T0_KAOS_RANVAL_4d     0x6d7c0a80
#define T0_KAOS_RANVAL_4e     0x6b9a7aaa
#define T0_KAOS_RANVAL_4f     0x9e22eab4
#define T0_KAOS_RANVAL_50     0x694df54c
#define T0_KAOS_RANVAL_51     0x343fd490
#define T0_KAOS_RANVAL_52     0x08e39c1a
#define T0_KAOS_RANVAL_53     0x83e7b2de
#define T0_KAOS_RANVAL_54     0xfaed4f5b
#define T0_KAOS_RANVAL_55     0x85a6b1f5
#define T0_KAOS_RANVAL_56     0x907819f5
#define T0_KAOS_RANVAL_57     0xa9bbd628
#define T0_KAOS_RANVAL_58     0xd03b08ad
#define T0_KAOS_RANVAL_59     0xb5c60bcc
#define T0_KAOS_RANVAL_5a     0xb8623d95
#define T0_KAOS_RANVAL_5b     0x871c1106
#define T0_KAOS_RANVAL_5c     0x78a820a8
#define T0_KAOS_RANVAL_5d     0xa81939bb
#define T0_KAOS_RANVAL_5e     0x267c49d4
#define T0_KAOS_RANVAL_5f     0x9fbd4851
#define T0_KAOS_RANVAL_60     0xd9ea0e08
#define T0_KAOS_RANVAL_61     0xae8ffa31
#define T0_KAOS_RANVAL_62     0x4056c804
#define T0_KAOS_RANVAL_63     0x7aae8523
#define T0_KAOS_RANVAL_64     0xdff1d6f3
#define T0_KAOS_RANVAL_65     0xffd5aaf2
#define T0_KAOS_RANVAL_66     0x16023021
#define T0_KAOS_RANVAL_67     0xef444b05
#define T0_KAOS_RANVAL_68     0x4db4164a
#define T0_KAOS_RANVAL_69     0x12b505d2
#define T0_KAOS_RANVAL_6a     0xe3ce6049
#define T0_KAOS_RANVAL_6b     0x1fe0ac4c
#define T0_KAOS_RANVAL_6c     0xcadb8241
#define T0_KAOS_RANVAL_6d     0x407465c0
#define T0_KAOS_RANVAL_6e     0x3145976c
#define T0_KAOS_RANVAL_6f     0x5dfdc0bf
#define T0_KAOS_RANVAL_70     0xfa04c831
#define T0_KAOS_RANVAL_71     0x8342d806
#define T0_KAOS_RANVAL_72     0xc5cfe73f
#define T0_KAOS_RANVAL_73     0xd116627d
#define T0_KAOS_RANVAL_74     0x7dbbd1ac
#define T0_KAOS_RANVAL_75     0x288e7dce
#define T0_KAOS_RANVAL_76     0x90c75175
#define T0_KAOS_RANVAL_77     0x5d63551d
#define T0_KAOS_RANVAL_78     0x755fc6d2
#define T0_KAOS_RANVAL_79     0xd5a101e7
#define T0_KAOS_RANVAL_7a     0xba940431
#define T0_KAOS_RANVAL_7b     0x9e213b17
#define T0_KAOS_RANVAL_7c     0xd79461e2
#define T0_KAOS_RANVAL_7d     0x3f6726c9
#define T0_KAOS_RANVAL_7e     0x91eb69b5
#define T0_KAOS_RANVAL_7f     0x2375fd61
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
!    areaoffset     5376
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2519
!    code           0c5da000
!    entry          0c5da000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d1e996d0b103
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

KTEXT_MODULE(t0_module_ktbl, 0x0c5da000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xaba000af	! t0_kref+0x0:   	fnegs	%f15, %f21
	.word	0xe7000018	! t0_kref+0x4:   	ld	[%g0 + %i0], %f19
	.word	0xa29034a4	! t0_kref+0x8:   	orcc	%g0, -0xb5c, %l1
	.word	0xa5a0002d	! t0_kref+0xc:   	fmovs	%f13, %f18
	.word	0xe278a034	! t0_kref+0x10:   	swap	[%g2 + 0x34], %l1
	.word	0x25480008	! t0_kref+0x14:   	fblg,a,pt	%fcc0, _kref+0x34
	.word	0x99a0052b	! t0_kref+0x18:   	fsqrts	%f11, %f12
	.word	0x81ac8a31	! t0_kref+0x1c:   	fcmps	%fcc0, %f18, %f17
	.word	0xa40b74ef	! t0_kref+0x20:   	and	%o5, -0xb11, %l2
	.word	0xa80d0010	! t0_kref+0x24:   	and	%l4, %l0, %l4
	.word	0xe420a020	! t0_kref+0x28:   	st	%l2, [%g2 + 0x20]
	.word	0xf43f4019	! t0_kref+0x2c:   	std	%i2, [%i5 + %i1]
	.word	0x9da00536	! t0_kref+0x30:   	fsqrts	%f22, %f14
	.word	0xe4f65000	! t0_kref+0x34:   	stxa	%l2, [%i1]0x80
	.word	0xe36e3ff0	! t0_kref+0x38:   	prefetch	%i0 - 0x10, 17
	.word	0xc807bfec	! t0_kref+0x3c:   	ld	[%fp - 0x14], %g4
	.word	0xa4be801b	! t0_kref+0x40:   	xnorcc	%i2, %i3, %l2
	.word	0xa6954011	! t0_kref+0x44:   	orcc	%l5, %l1, %l3
	.word	0x2a480003	! t0_kref+0x48:   	bcs,a,pt	%icc, _kref+0x54
	.word	0xe610a004	! t0_kref+0x4c:   	lduh	[%g2 + 4], %l3
	.word	0xa60eb1af	! t0_kref+0x50:   	and	%i2, -0xe51, %l3
	.word	0xa9380014	! t0_kref+0x54:   	sra	%g0, %l4, %l4
	.word	0xa0a2f00f	! t0_kref+0x58:   	subcc	%o3, -0xff1, %l0
	.word	0xeb6e3ff8	! t0_kref+0x5c:   	prefetch	%i0 - 8, 21
	.word	0x81ab8a35	! t0_kref+0x60:   	fcmps	%fcc0, %f14, %f21
	.word	0xa5a01a4a	! t0_kref+0x64:   	fdtoi	%f10, %f18
	.word	0xa8d2346b	! t0_kref+0x68:   	umulcc	%o0, -0xb95, %l4
	.word	0xa9a01934	! t0_kref+0x6c:   	fstod	%f20, %f20
	.word	0xe8070019	! t0_kref+0x70:   	ld	[%i4 + %i1], %l4
	.word	0x95a0188a	! t0_kref+0x74:   	fitos	%f10, %f10
	.word	0xe096101b	! t0_kref+0x78:   	lduha	[%i0 + %i3]0x80, %l0
	.word	0xdf060000	! t0_kref+0x7c:   	ld	[%i0], %f15
	.word	0x22800006	! t0_kref+0x80:   	be,a	_kref+0x98
	.word	0xd8a81019	! t0_kref+0x84:   	stba	%o4, [%g0 + %i1]0x80
	.word	0x81d82fd6	! t0_kref+0x88:   	flush	%g0 + 0xfd6
	.word	0xe000a038	! t0_kref+0x8c:   	ld	[%g2 + 0x38], %l0
	.word	0xada589ad	! t0_kref+0x90:   	fdivs	%f22, %f13, %f22
	.word	0xa53a601e	! t0_kref+0x94:   	sra	%o1, 0x1e, %l2
	.word	0xa03b3913	! t0_kref+0x98:   	xnor	%o4, -0x6ed, %l0
	.word	0x93a54836	! t0_kref+0x9c:   	fadds	%f21, %f22, %f9
	.word	0xdf20a018	! t0_kref+0xa0:   	st	%f15, [%g2 + 0x18]
	.word	0xa8144017	! t0_kref+0xa4:   	or	%l1, %l7, %l4
	.word	0x30800008	! t0_kref+0xa8:   	ba,a	_kref+0xc8
	.word	0xe84e0000	! t0_kref+0xac:   	ldsb	[%i0], %l4
	.word	0x81580000	! t0_kref+0xb0:   	flushw
	.word	0x95a0190c	! t0_kref+0xb4:   	fitod	%f12, %f10
	.word	0xa6282b20	! t0_kref+0xb8:   	andn	%g0, 0xb20, %l3
	.word	0xa6b68015	! t0_kref+0xbc:   	orncc	%i2, %l5, %l3
	.word	0xa80af6e4	! t0_kref+0xc0:   	and	%o3, -0x91c, %l4
	.word	0x39480008	! t0_kref+0xc4:   	fbuge,a,pt	%fcc0, _kref+0xe4
	.word	0xe3b8a080	! t0_kref+0xc8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe85e7fe8	! t0_kref+0xcc:   	ldx	[%i1 - 0x18], %l4
	.word	0xa2e4f96d	! t0_kref+0xd0:   	subccc	%l3, -0x693, %l1
	.word	0xa6d27eb0	! t0_kref+0xd4:   	umulcc	%o1, -0x150, %l3
	.word	0xe89e501d	! t0_kref+0xd8:   	ldda	[%i1 + %i5]0x80, %l4
	.word	0xc568a04c	! t0_kref+0xdc:   	prefetch	%g2 + 0x4c, 2
	.word	0xd430a00e	! t0_kref+0xe0:   	sth	%o2, [%g2 + 0xe]
	.word	0x2b28dc85	! t0_kref+0xe4:   	sethi	%hi(0xa3721400), %l5
	.word	0xa8903c01	! t0_kref+0xe8:   	orcc	%g0, -0x3ff, %l4
	.word	0xa920000c	! t0_kref+0xec:   	mulscc	%g0, %o4, %l4
	.word	0xdd20a010	! t0_kref+0xf0:   	st	%f14, [%g2 + 0x10]
	.word	0x81ac8a4c	! t0_kref+0xf4:   	fcmpd	%fcc0, %f18, %f12
	.word	0xa492401a	! t0_kref+0xf8:   	orcc	%o1, %i2, %l2
	.word	0xa82e8014	! t0_kref+0xfc:   	andn	%i2, %l4, %l4
	.word	0xab382013	! t0_kref+0x100:   	sra	%g0, 0x13, %l5
	.word	0xe0de5000	! t0_kref+0x104:   	ldxa	[%i1]0x80, %l0
	.word	0xa1400000	! t0_kref+0x108:   	mov	%y, %l0
	.word	0xaafee740	! t0_kref+0x10c:   	sdivcc	%i3, 0x740, %l5
	.word	0xe84e8018	! t0_kref+0x110:   	ldsb	[%i2 + %i0], %l4
	.word	0x81de8005	! t0_kref+0x114:   	flush	%i2 + %g5
	.word	0xe200a01c	! t0_kref+0x118:   	ld	[%g2 + 0x1c], %l1
	.word	0xa5a38d2c	! t0_kref+0x11c:   	fsmuld	%f14, %f12, %f18
	.word	0x2302d962	! t0_kref+0x120:   	sethi	%hi(0xb658800), %l1
	.word	0xea48a02e	! t0_kref+0x124:   	ldsb	[%g2 + 0x2e], %l5
	.word	0x99a0190f	! t0_kref+0x128:   	fitod	%f15, %f12
	.word	0xa2a4f734	! t0_kref+0x12c:   	subcc	%l3, -0x8cc, %l1
	.word	0xa9a209ac	! t0_kref+0x130:   	fdivs	%f8, %f12, %f20
	.word	0x38800006	! t0_kref+0x134:   	bgu,a	_kref+0x14c
	.word	0x91a34928	! t0_kref+0x138:   	fmuls	%f13, %f8, %f8
	.word	0x2d480002	! t0_kref+0x13c:   	fbg,a,pt	%fcc0, _kref+0x144
	.word	0xada01a50	! t0_kref+0x140:   	fdtoi	%f16, %f22
	.word	0xa452c00b	! t0_kref+0x144:   	umul	%o3, %o3, %l2
	.word	0x91a44d2a	! t0_kref+0x148:   	fsmuld	%f17, %f10, %f8
	.word	0xd506201c	! t0_kref+0x14c:   	ld	[%i0 + 0x1c], %f10
	.word	0xd700a02c	! t0_kref+0x150:   	ld	[%g2 + 0x2c], %f11
	.word	0xa1a01a36	! t0_kref+0x154:   	fstoi	%f22, %f16
	.word	0xa5a000b3	! t0_kref+0x158:   	fnegs	%f19, %f18
	.word	0x99a01a4e	! t0_kref+0x15c:   	fdtoi	%f14, %f12
	.word	0xd820a014	! t0_kref+0x160:   	st	%o4, [%g2 + 0x14]
	.word	0x81aaca34	! t0_kref+0x164:   	fcmps	%fcc0, %f11, %f20
	.word	0xc12e3fe0	! t0_kref+0x168:   	st	%fsr, [%i0 - 0x20]
	.word	0x24480001	! t0_kref+0x16c:   	ble,a,pt	%icc, _kref+0x170
	.word	0xd920a03c	! t0_kref+0x170:   	st	%f12, [%g2 + 0x3c]
	.word	0xa6a4000d	! t0_kref+0x174:   	subcc	%l0, %o5, %l3
	.word	0xa4b2247e	! t0_kref+0x178:   	orncc	%o0, 0x47e, %l2
	.word	0x97a2c8b5	! t0_kref+0x17c:   	fsubs	%f11, %f21, %f11
	.word	0x81ab8a2a	! t0_kref+0x180:   	fcmps	%fcc0, %f14, %f10
	.word	0xa9a000d0	! t0_kref+0x184:   	fnegd	%f16, %f20
	.word	0x3b480005	! t0_kref+0x188:   	fble,a,pt	%fcc0, _kref+0x19c
	.word	0xa83b6191	! t0_kref+0x18c:   	xnor	%o5, 0x191, %l4
	.word	0xdb264000	! t0_kref+0x190:   	st	%f13, [%i1]
	.word	0xab3ee007	! t0_kref+0x194:   	sra	%i3, 0x7, %l5
	.word	0xc568a004	! t0_kref+0x198:   	prefetch	%g2 + 4, 2
	.word	0xe6070018	! t0_kref+0x19c:   	ld	[%i4 + %i0], %l3
	.word	0x2f480008	! t0_kref+0x1a0:   	fbu,a,pt	%fcc0, _kref+0x1c0
	.word	0xaa34af29	! t0_kref+0x1a4:   	orn	%l2, 0xf29, %l5
	.word	0xa212801a	! t0_kref+0x1a8:   	or	%o2, %i2, %l1
	.word	0x9fa0052a	! t0_kref+0x1ac:   	fsqrts	%f10, %f15
	.word	0xa80ac012	! t0_kref+0x1b0:   	and	%o3, %l2, %l4
	.word	0x22480006	! t0_kref+0x1b4:   	be,a,pt	%icc, _kref+0x1cc
	.word	0xd66e0000	! t0_kref+0x1b8:   	ldstub	[%i0], %o3
	.word	0xa2e2c012	! t0_kref+0x1bc:   	subccc	%o3, %l2, %l1
	.word	0x97a0188a	! t0_kref+0x1c0:   	fitos	%f10, %f11
	.word	0xa9328010	! t0_kref+0x1c4:   	srl	%o2, %l0, %l4
	.word	0xe59e1000	! t0_kref+0x1c8:   	ldda	[%i0]0x80, %f18
	.word	0xa25a401b	! t0_kref+0x1cc:   	smul	%o1, %i3, %l1
	.word	0x95a01933	! t0_kref+0x1d0:   	fstod	%f19, %f10
	.word	0xa81af96c	! t0_kref+0x1d4:   	xor	%o3, -0x694, %l4
	.word	0xa63ec016	! t0_kref+0x1d8:   	xnor	%i3, %l6, %l3
	.word	0x91a0192c	! t0_kref+0x1dc:   	fstod	%f12, %f8
	.word	0xa2ad29c7	! t0_kref+0x1e0:   	andncc	%l4, 0x9c7, %l1
	.word	0xf1ee101d	! t0_kref+0x1e4:   	prefetcha	%i0 + %i5, 24
	.word	0xf36e401d	! t0_kref+0x1e8:   	prefetch	%i1 + %i5, 25
	.word	0xa85ee34d	! t0_kref+0x1ec:   	smul	%i3, 0x34d, %l4
	.word	0xaba8402a	! t0_kref+0x1f0:   	fmovsne	%fcc0, %f10, %f21
	.word	0xa874a4e3	! t0_kref+0x1f4:   	udiv	%l2, 0x4e3, %l4
	.word	0xdb264000	! t0_kref+0x1f8:   	st	%f13, [%i1]
	.word	0xa1a01a29	! t0_kref+0x1fc:   	fstoi	%f9, %f16
	.word	0xa6143b09	! t0_kref+0x200:   	or	%l0, -0x4f7, %l3
	.word	0x3e800007	! t0_kref+0x204:   	bvc,a	_kref+0x220
	.word	0xea48a036	! t0_kref+0x208:   	ldsb	[%g2 + 0x36], %l5
	.word	0xaa0af319	! t0_kref+0x20c:   	and	%o3, -0xce7, %l5
	.word	0x9da28d32	! t0_kref+0x210:   	fsmuld	%f10, %f18, %f14
	.word	0xa73ea013	! t0_kref+0x214:   	sra	%i2, 0x13, %l3
	.word	0x21480004	! t0_kref+0x218:   	fbn,a,pt	%fcc0, _kref+0x228
	.word	0xa4b6e2f9	! t0_kref+0x21c:   	orncc	%i3, 0x2f9, %l2
	.word	0xe40e200b	! t0_kref+0x220:   	ldub	[%i0 + 0xb], %l2
	.word	0xe440a00c	! t0_kref+0x224:   	ldsw	[%g2 + 0xc], %l2
	.word	0xaa0d000d	! t0_kref+0x228:   	and	%l4, %o5, %l5
	.word	0xa1246082	! t0_kref+0x22c:   	mulscc	%l1, 0x82, %l0
	.word	0xe8d01018	! t0_kref+0x230:   	ldsha	[%g0 + %i0]0x80, %l4
	.word	0x81ab0aa8	! t0_kref+0x234:   	fcmpes	%fcc0, %f12, %f8
	.word	0x81aa0aa8	! t0_kref+0x238:   	fcmpes	%fcc0, %f8, %f8
	.word	0xa876c014	! t0_kref+0x23c:   	udiv	%i3, %l4, %l4
	.word	0xa1258009	! t0_kref+0x240:   	mulscc	%l6, %o1, %l0
	.word	0xe816c018	! t0_kref+0x244:   	lduh	[%i3 + %i0], %l4
	.word	0x81df68c9	! t0_kref+0x248:   	flush	%i5 + 0x8c9
	.word	0xec20a008	! t0_kref+0x24c:   	st	%l6, [%g2 + 8]
	.word	0xe120a024	! t0_kref+0x250:   	st	%f16, [%g2 + 0x24]
	.word	0xa6d36554	! t0_kref+0x254:   	umulcc	%o5, 0x554, %l3
	.word	0x99a0190a	! t0_kref+0x258:   	fitod	%f10, %f12
	.word	0x28480006	! t0_kref+0x25c:   	bleu,a,pt	%icc, _kref+0x274
	.word	0xa27eefc7	! t0_kref+0x260:   	sdiv	%i3, 0xfc7, %l1
	.word	0xa32d201b	! t0_kref+0x264:   	sll	%l4, 0x1b, %l1
	.word	0x81ad8a4a	! t0_kref+0x268:   	fcmpd	%fcc0, %f22, %f10
	.word	0xa9418000	! t0_kref+0x26c:   	mov	%fprs, %l4
	.word	0xe4563fe2	! t0_kref+0x270:   	ldsh	[%i0 - 0x1e], %l2
	.word	0xe6267fe8	! t0_kref+0x274:   	st	%l3, [%i1 - 0x18]
	.word	0xda7e7ff4	! t0_kref+0x278:   	swap	[%i1 - 0xc], %o5
	.word	0x95a00135	! t0_kref+0x27c:   	fabss	%f21, %f10
	.word	0xa2644017	! t0_kref+0x280:   	subc	%l1, %l7, %l1
	.word	0xe2965000	! t0_kref+0x284:   	lduha	[%i1]0x80, %l1
	.word	0xc5ee1014	! t0_kref+0x288:   	prefetcha	%i0 + %l4, 2
	.word	0xe926200c	! t0_kref+0x28c:   	st	%f20, [%i0 + 0xc]
	.word	0xa5382009	! t0_kref+0x290:   	sra	%g0, 0x9, %l2
	.word	0xc807bfec	! t0_kref+0x294:   	ld	[%fp - 0x14], %g4
	.word	0xea4e8018	! t0_kref+0x298:   	ldsb	[%i2 + %i0], %l5
	.word	0xa22c37b8	! t0_kref+0x29c:   	andn	%l0, -0x848, %l1
	.word	0xe168a001	! t0_kref+0x2a0:   	prefetch	%g2 + 1, 16
	.word	0x95a01a56	! t0_kref+0x2a4:   	fdtoi	%f22, %f10
	.word	0xc168a085	! t0_kref+0x2a8:   	prefetch	%g2 + 0x85, 0
	.word	0xc36e4000	! t0_kref+0x2ac:   	prefetch	%i1, 1
	.word	0x38480008	! t0_kref+0x2b0:   	bgu,a,pt	%icc, _kref+0x2d0
	.word	0xe1ee501b	! t0_kref+0x2b4:   	prefetcha	%i1 + %i3, 16
	.word	0x95a01933	! t0_kref+0x2b8:   	fstod	%f19, %f10
	.word	0xa83ac014	! t0_kref+0x2bc:   	xnor	%o3, %l4, %l4
	.word	0xa80dc015	! t0_kref+0x2c0:   	and	%l7, %l5, %l4
	.word	0x81ad0ad2	! t0_kref+0x2c4:   	fcmped	%fcc0, %f20, %f18
	.word	0xa466c00b	! t0_kref+0x2c8:   	subc	%i3, %o3, %l2
	.word	0xe4500018	! t0_kref+0x2cc:   	ldsh	[%g0 + %i0], %l2
	.word	0x95a01888	! t0_kref+0x2d0:   	fitos	%f8, %f10
	.word	0xea40a018	! t0_kref+0x2d4:   	ldsw	[%g2 + 0x18], %l5
	.word	0x9de3bfa0	! t0_kref+0x2d8:   	save	%sp, -0x60, %sp
	.word	0xbb002d01	! t0_kref+0x2dc:   	taddcc	%g0, 0xd01, %i5
	.word	0xa1ee0018	! t0_kref+0x2e0:   	restore	%i0, %i0, %l0
	.word	0xab3d0008	! t0_kref+0x2e4:   	sra	%l4, %o0, %l5
	.word	0xea163ff4	! t0_kref+0x2e8:   	lduh	[%i0 - 0xc], %l5
	.word	0x81accaa9	! t0_kref+0x2ec:   	fcmpes	%fcc0, %f19, %f9
	.word	0x97a00028	! t0_kref+0x2f0:   	fmovs	%f8, %f11
	.word	0x25218ef9	! t0_kref+0x2f4:   	sethi	%hi(0x863be400), %l2
	.word	0x31480004	! t0_kref+0x2f8:   	fba,a,pt	%fcc0, _kref+0x308
	.word	0xe9200019	! t0_kref+0x2fc:   	st	%f20, [%g0 + %i1]
	.word	0xa0746e15	! t0_kref+0x300:   	udiv	%l1, 0xe15, %l0
	.word	0xa6bec010	! t0_kref+0x304:   	xnorcc	%i3, %l0, %l3
	.word	0xa3408000	! t0_kref+0x308:   	mov	%ccr, %l1
	.word	0x81dfeab6	! t0_kref+0x30c:   	flush	%i7 + 0xab6
	.word	0xa80b203a	! t0_kref+0x310:   	and	%o4, 0x3a, %l4
	.word	0xaba549af	! t0_kref+0x314:   	fdivs	%f21, %f15, %f21
	.word	0xa2e23f47	! t0_kref+0x318:   	subccc	%o0, -0xb9, %l1
	.word	0x99a488b1	! t0_kref+0x31c:   	fsubs	%f18, %f17, %f12
	.word	0xa4fec014	! t0_kref+0x320:   	sdivcc	%i3, %l4, %l2
	.word	0xa322a590	! t0_kref+0x324:   	mulscc	%o2, 0x590, %l1
	.word	0xe850a034	! t0_kref+0x328:   	ldsh	[%g2 + 0x34], %l4
	.word	0x81580000	! t0_kref+0x32c:   	flushw
	.word	0xa81b73d4	! t0_kref+0x330:   	xor	%o5, -0xc2c, %l4
	.word	0xa2f2c01b	! t0_kref+0x334:   	udivcc	%o3, %i3, %l1
	.word	0xda28a003	! t0_kref+0x338:   	stb	%o5, [%g2 + 3]
	.word	0x81ad0ab1	! t0_kref+0x33c:   	fcmpes	%fcc0, %f20, %f17
	.word	0xa5a509d2	! t0_kref+0x340:   	fdivd	%f20, %f18, %f18
	.word	0xaba4c8b4	! t0_kref+0x344:   	fsubs	%f19, %f20, %f21
	.word	0xa03a6fa6	! t0_kref+0x348:   	xnor	%o1, 0xfa6, %l0
	.word	0xea08a017	! t0_kref+0x34c:   	ldub	[%g2 + 0x17], %l5
	.word	0xd9be9a19	! t0_kref+0x350:   	stda	%f12, [%i2 + %i1]0xd0
	.word	0x2126a1ef	! t0_kref+0x354:   	sethi	%hi(0x9a87bc00), %l0
	.word	0xeb6e7fe8	! t0_kref+0x358:   	prefetch	%i1 - 0x18, 21
	.word	0xa0c4400c	! t0_kref+0x35c:   	addccc	%l1, %o4, %l0
	.word	0xe050a03e	! t0_kref+0x360:   	ldsh	[%g2 + 0x3e], %l0
	.word	0x9da00534	! t0_kref+0x364:   	fsqrts	%f20, %f14
	.word	0xa85c8016	! t0_kref+0x368:   	smul	%l2, %l6, %l4
	.word	0xe406401c	! t0_kref+0x36c:   	ld	[%i1 + %i4], %l2
	.word	0x9da01a2f	! t0_kref+0x370:   	fstoi	%f15, %f14
	.word	0xa5400000	! t0_kref+0x374:   	mov	%y, %l2
	.word	0xf1ee501d	! t0_kref+0x378:   	prefetcha	%i1 + %i5, 24
	.word	0x81580000	! t0_kref+0x37c:   	flushw
	.word	0xa5a01933	! t0_kref+0x380:   	fstod	%f19, %f18
	.word	0xab2b6019	! t0_kref+0x384:   	sll	%o5, 0x19, %l5
	.word	0xc028a01b	! t0_kref+0x388:   	clrb	[%g2 + 0x1b]
	.word	0xa064401b	! t0_kref+0x38c:   	subc	%l1, %i3, %l0
	.word	0x2a800003	! t0_kref+0x390:   	bcs,a	_kref+0x39c
	.word	0x9ba0002b	! t0_kref+0x394:   	fmovs	%f11, %f13
	.word	0x81ac8a56	! t0_kref+0x398:   	fcmpd	%fcc0, %f18, %f22
	.word	0x81ad0a4a	! t0_kref+0x39c:   	fcmpd	%fcc0, %f20, %f10
	.word	0xec1e0000	! t0_kref+0x3a0:   	ldd	[%i0], %l6
	.word	0xa825a79a	! t0_kref+0x3a4:   	sub	%l6, 0x79a, %l4
	.word	0xa62b4000	! t0_kref+0x3a8:   	andn	%o5, %g0, %l3
	.word	0xa4930000	! t0_kref+0x3ac:   	orcc	%o4, %g0, %l2
	.word	0xc0ee101a	! t0_kref+0x3b0:   	ldstuba	[%i0 + %i2]0x80, %g0
	.word	0x23480004	! t0_kref+0x3b4:   	fbne,a,pt	%fcc0, _kref+0x3c4
	.word	0xa65ea74f	! t0_kref+0x3b8:   	smul	%i2, 0x74f, %l3
	.word	0xe320a028	! t0_kref+0x3bc:   	st	%f17, [%g2 + 0x28]
	.word	0xa3228009	! t0_kref+0x3c0:   	mulscc	%o2, %o1, %l1
	.word	0xa222280b	! t0_kref+0x3c4:   	sub	%o0, 0x80b, %l1
	.word	0x81ab0a4e	! t0_kref+0x3c8:   	fcmpd	%fcc0, %f12, %f14
	.word	0xa524a079	! t0_kref+0x3cc:   	mulscc	%l2, 0x79, %l2
	.word	0xe8267ff0	! t0_kref+0x3d0:   	st	%l4, [%i1 - 0x10]
	.word	0x95a0192d	! t0_kref+0x3d4:   	fstod	%f13, %f10
	.word	0xa6748010	! t0_kref+0x3d8:   	udiv	%l2, %l0, %l3
	.word	0xe1bf5a19	! t0_kref+0x3dc:   	stda	%f16, [%i5 + %i1]0xd0
	.word	0x3a800006	! t0_kref+0x3e0:   	bcc,a	_kref+0x3f8
	.word	0x99a01910	! t0_kref+0x3e4:   	fitod	%f16, %f12
	.word	0x9da000b2	! t0_kref+0x3e8:   	fnegs	%f18, %f14
	.word	0xa29d74e7	! t0_kref+0x3ec:   	xorcc	%l5, -0xb19, %l1
	.word	0x81ac0ab1	! t0_kref+0x3f0:   	fcmpes	%fcc0, %f16, %f17
	.word	0xa49b7421	! t0_kref+0x3f4:   	xorcc	%o5, -0xbdf, %l2
	.word	0xec9e1000	! t0_kref+0x3f8:   	ldda	[%i0]0x80, %l6
	.word	0xea162000	! t0_kref+0x3fc:   	lduh	[%i0], %l5
	.word	0x3b480003	! t0_kref+0x400:   	fble,a,pt	%fcc0, _kref+0x40c
	.word	0xa9400000	! t0_kref+0x404:   	mov	%y, %l4
	.word	0xa47b240e	! t0_kref+0x408:   	sdiv	%o4, 0x40e, %l2
	.word	0xee7e2000	! t0_kref+0x40c:   	swap	[%i0], %l7
	.word	0x81ad0ab2	! t0_kref+0x410:   	fcmpes	%fcc0, %f20, %f18
	.word	0xc16e2000	! t0_kref+0x414:   	prefetch	%i0, 0
	.word	0x9fa4c9ad	! t0_kref+0x418:   	fdivs	%f19, %f13, %f15
	.word	0xe2680018	! t0_kref+0x41c:   	ldstub	[%g0 + %i0], %l1
	.word	0xd900a038	! t0_kref+0x420:   	ld	[%g2 + 0x38], %f12
	.word	0x27480002	! t0_kref+0x424:   	fbul,a,pt	%fcc0, _kref+0x42c
	.word	0xee267fe4	! t0_kref+0x428:   	st	%l7, [%i1 - 0x1c]
	.word	0xd09e101d	! t0_kref+0x42c:   	ldda	[%i0 + %i5]0x80, %o0
	.word	0xaac6c014	! t0_kref+0x430:   	addccc	%i3, %l4, %l5
	.word	0x3d480008	! t0_kref+0x434:   	fbule,a,pt	%fcc0, _kref+0x454
	.word	0xa49d800b	! t0_kref+0x438:   	xorcc	%l6, %o3, %l2
	.word	0x95a408c8	! t0_kref+0x43c:   	fsubd	%f16, %f8, %f10
	.word	0xa92de007	! t0_kref+0x440:   	sll	%l7, 0x7, %l4
	.word	0xe4466008	! t0_kref+0x444:   	ldsw	[%i1 + 8], %l2
	.word	0xe8470018	! t0_kref+0x448:   	ldsw	[%i4 + %i0], %l4
	.word	0x30480008	! t0_kref+0x44c:   	ba,a,pt	%icc, _kref+0x46c
	.word	0xa33ca015	! t0_kref+0x450:   	sra	%l2, 0x15, %l1
	.word	0xa0adc012	! t0_kref+0x454:   	andncc	%l7, %l2, %l0
	.word	0xedee501c	! t0_kref+0x458:   	prefetcha	%i1 + %i4, 22
	.word	0xa65b000c	! t0_kref+0x45c:   	smul	%o4, %o4, %l3
	.word	0xa1a408b0	! t0_kref+0x460:   	fsubs	%f16, %f16, %f16
	.word	0xec20a024	! t0_kref+0x464:   	st	%l6, [%g2 + 0x24]
	.word	0x3c800001	! t0_kref+0x468:   	bpos,a	_kref+0x46c
	.word	0xc5ee5013	! t0_kref+0x46c:   	prefetcha	%i1 + %l3, 2
	.word	0x81ab4ab1	! t0_kref+0x470:   	fcmpes	%fcc0, %f13, %f17
	.word	0xe99e101d	! t0_kref+0x474:   	ldda	[%i0 + %i5]0x80, %f20
	.word	0x81ab8a48	! t0_kref+0x478:   	fcmpd	%fcc0, %f14, %f8
	.word	0x81ad0a33	! t0_kref+0x47c:   	fcmps	%fcc0, %f20, %f19
	.word	0x81580000	! t0_kref+0x480:   	flushw
	.word	0xa2d24009	! t0_kref+0x484:   	umulcc	%o1, %o1, %l1
	.word	0xa5a01a50	! t0_kref+0x488:   	fdtoi	%f16, %f18
	.word	0x9da409d2	! t0_kref+0x48c:   	fdivd	%f16, %f18, %f14
	.word	0x99a5082b	! t0_kref+0x490:   	fadds	%f20, %f11, %f12
	.word	0x91a0190d	! t0_kref+0x494:   	fitod	%f13, %f8
	.word	0xe81f4018	! t0_kref+0x498:   	ldd	[%i5 + %i0], %l4
	.word	0x81accaac	! t0_kref+0x49c:   	fcmpes	%fcc0, %f19, %f12
	.word	0xa33ae00b	! t0_kref+0x4a0:   	sra	%o3, 0xb, %l1
	.word	0xe610a016	! t0_kref+0x4a4:   	lduh	[%g2 + 0x16], %l3
	.word	0xa2923240	! t0_kref+0x4a8:   	orcc	%o0, -0xdc0, %l1
	.word	0x2a800002	! t0_kref+0x4ac:   	bcs,a	_kref+0x4b4
	.word	0x81dbe964	! t0_kref+0x4b0:   	flush	%o7 + 0x964
	.word	0xaa626ecb	! t0_kref+0x4b4:   	subc	%o1, 0xecb, %l5
	.word	0xe8871019	! t0_kref+0x4b8:   	lda	[%i4 + %i1]0x80, %l4
	.word	0x93a589b2	! t0_kref+0x4bc:   	fdivs	%f22, %f18, %f9
	.word	0xb6102006	! t0_kref+0x4c0:   	mov	0x6, %i3
	.word	0xa024c01a	! t0_kref+0x4c4:   	sub	%l3, %i2, %l0
	.word	0xa006800c	! t0_kref+0x4c8:   	add	%i2, %o4, %l0
	.word	0xa8352844	! t0_kref+0x4cc:   	orn	%l4, 0x844, %l4
	.word	0xa5a00536	! t0_kref+0x4d0:   	fsqrts	%f22, %f18
	.word	0xaa7aefb2	! t0_kref+0x4d4:   	sdiv	%o3, 0xfb2, %l5
	.word	0xaa146736	! t0_kref+0x4d8:   	or	%l1, 0x736, %l5
	.word	0xa8fc6084	! t0_kref+0x4dc:   	sdivcc	%l1, 0x84, %l4
	.word	0xa0bd4000	! t0_kref+0x4e0:   	xnorcc	%l5, %g0, %l0
	.word	0xa052c009	! t0_kref+0x4e4:   	umul	%o3, %o1, %l0
	.word	0x95a01909	! t0_kref+0x4e8:   	fitod	%f9, %f10
	.word	0xe6400019	! t0_kref+0x4ec:   	ldsw	[%g0 + %i1], %l3
	.word	0xe8400018	! t0_kref+0x4f0:   	ldsw	[%g0 + %i0], %l4
	.word	0xa9a0188e	! t0_kref+0x4f4:   	fitos	%f14, %f20
	.word	0x9de3bfa0	! t0_kref+0x4f8:   	save	%sp, -0x60, %sp
	.word	0xa5ef6233	! t0_kref+0x4fc:   	restore	%i5, 0x233, %l2
	.word	0xa0948013	! t0_kref+0x500:   	orcc	%l2, %l3, %l0
	.word	0xa65d363e	! t0_kref+0x504:   	smul	%l4, -0x9c2, %l3
	.word	0xe456001b	! t0_kref+0x508:   	ldsh	[%i0 + %i3], %l2
	.word	0xa476f1fd	! t0_kref+0x50c:   	udiv	%i3, -0xe03, %l2
	.word	0xed20a028	! t0_kref+0x510:   	st	%f22, [%g2 + 0x28]
	.word	0xe600a008	! t0_kref+0x514:   	ld	[%g2 + 8], %l3
	.word	0xa4b0001a	! t0_kref+0x518:   	orncc	%g0, %i2, %l2
	.word	0xe4062014	! t0_kref+0x51c:   	ld	[%i0 + 0x14], %l2
	.word	0xa33b4010	! t0_kref+0x520:   	sra	%o5, %l0, %l1
	.word	0xa2bac01b	! t0_kref+0x524:   	xnorcc	%o3, %i3, %l1
	.word	0x9fa389aa	! t0_kref+0x528:   	fdivs	%f14, %f10, %f15
	.word	0xa9a01a48	! t0_kref+0x52c:   	fdtoi	%f8, %f20
	.word	0x33480007	! t0_kref+0x530:   	fbe,a,pt	%fcc0, _kref+0x54c
	.word	0xd87e601c	! t0_kref+0x534:   	swap	[%i1 + 0x1c], %o4
	.word	0xe3ee101a	! t0_kref+0x538:   	prefetcha	%i0 + %i2, 17
	.word	0x39480005	! t0_kref+0x53c:   	fbuge,a,pt	%fcc0, _kref+0x550
	.word	0xe45e401d	! t0_kref+0x540:   	ldx	[%i1 + %i5], %l2
	.word	0xa0358016	! t0_kref+0x544:   	orn	%l6, %l6, %l0
	.word	0xd520a034	! t0_kref+0x548:   	st	%f10, [%g2 + 0x34]
	.word	0x91a01a4a	! t0_kref+0x54c:   	fdtoi	%f10, %f8
	.word	0xda6e001a	! t0_kref+0x550:   	ldstub	[%i0 + %i2], %o5
	.word	0xed68a080	! t0_kref+0x554:   	prefetch	%g2 + 0x80, 22
	.word	0xaa5d801a	! t0_kref+0x558:   	smul	%l6, %i2, %l5
	.word	0xe000a01c	! t0_kref+0x55c:   	ld	[%g2 + 0x1c], %l0
	.word	0xef68a00b	! t0_kref+0x560:   	prefetch	%g2 + 0xb, 23
	.word	0x2503a581	! t0_kref+0x564:   	sethi	%hi(0xe960400), %l2
	.word	0xa655e689	! t0_kref+0x568:   	umul	%l7, 0x689, %l3
	.word	0x8610200a	! t0_kref+0x56c:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x570:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t0_kref+0x574:   	be,a	_kref+0x5d0
	.word	0xab400000	! t0_kref+0x578:   	mov	%y, %l5
	.word	0x9ba00529	! t0_kref+0x57c:   	fsqrts	%f9, %f13
	.word	0xa6802f2e	! t0_kref+0x580:   	addcc	%g0, 0xf2e, %l3
	.word	0xa63b6433	! t0_kref+0x584:   	xnor	%o5, 0x433, %l3
	.word	0xe230a02e	! t0_kref+0x588:   	sth	%l1, [%g2 + 0x2e]
	.word	0x3d480002	! t0_kref+0x58c:   	fbule,a,pt	%fcc0, _kref+0x594
	.word	0xd4682b22	! t0_kref+0x590:   	ldstub	[%g0 + 0xb22], %o2
	.word	0xf76e401c	! t0_kref+0x594:   	prefetch	%i1 + %i4, 27
	.word	0xa4fe800c	! t0_kref+0x598:   	sdivcc	%i2, %o4, %l2
	.word	0xd5267ff4	! t0_kref+0x59c:   	st	%f10, [%i1 - 0xc]
	.word	0xaac4e7b8	! t0_kref+0x5a0:   	addccc	%l3, 0x7b8, %l5
	.word	0xd3000018	! t0_kref+0x5a4:   	ld	[%g0 + %i0], %f9
	.word	0xa696801a	! t0_kref+0x5a8:   	orcc	%i2, %i2, %l3
	.word	0xaba01a48	! t0_kref+0x5ac:   	fdtoi	%f8, %f21
	.word	0xeeae1000	! t0_kref+0x5b0:   	stba	%l7, [%i0]0x80
	.word	0xca116960	! t0_kref+0x5b4:   	lduh	[%g5 + 0x960], %g5
	.word	0xaaab354c	! t0_kref+0x5b8:   	andncc	%o4, -0xab4, %l5
	.word	0xa0bc77e2	! t0_kref+0x5bc:   	xnorcc	%l1, -0x81e, %l0
	.word	0xe450a036	! t0_kref+0x5c0:   	ldsh	[%g2 + 0x36], %l2
	.word	0xa86523d2	! t0_kref+0x5c4:   	subc	%l4, 0x3d2, %l4
	.word	0xe80e3fe3	! t0_kref+0x5c8:   	ldub	[%i0 - 0x1d], %l4
	.word	0xa1a58d36	! t0_kref+0x5cc:   	fsmuld	%f22, %f22, %f16
	.word	0xd920a01c	! t0_kref+0x5d0:   	st	%f12, [%g2 + 0x1c]
	.word	0xa835f38d	! t0_kref+0x5d4:   	orn	%l7, -0xc73, %l4
	.word	0xa4734009	! t0_kref+0x5d8:   	udiv	%o5, %o1, %l2
	.word	0xe206600c	! t0_kref+0x5dc:   	ld	[%i1 + 0xc], %l1
	.word	0x26800001	! t0_kref+0x5e0:   	bl,a	_kref+0x5e4
	.word	0xa9a209ab	! t0_kref+0x5e4:   	fdivs	%f8, %f11, %f20
	.word	0x81ab0a54	! t0_kref+0x5e8:   	fcmpd	%fcc0, %f12, %f20
	.word	0xea4e3fea	! t0_kref+0x5ec:   	ldsb	[%i0 - 0x16], %l5
	.word	0xe1063fe0	! t0_kref+0x5f0:   	ld	[%i0 - 0x20], %f16
	.word	0x81ac4a33	! t0_kref+0x5f4:   	fcmps	%fcc0, %f17, %f19
	.word	0xe168a04f	! t0_kref+0x5f8:   	prefetch	%g2 + 0x4f, 16
	.word	0xaa74eae6	! t0_kref+0x5fc:   	udiv	%l3, 0xae6, %l5
	.word	0xa9a01110	! t0_kref+0x600:   	fxtod	%f16, %f20
	.word	0xeea81018	! t0_kref+0x604:   	stba	%l7, [%g0 + %i0]0x80
	.word	0x23480006	! t0_kref+0x608:   	fbne,a,pt	%fcc0, _kref+0x620
	.word	0xaba00528	! t0_kref+0x60c:   	fsqrts	%f8, %f21
	.word	0xaa5b7889	! t0_kref+0x610:   	smul	%o5, -0x777, %l5
	.word	0xa340c000	! t0_kref+0x614:   	mov	%asi, %l1
	.word	0x81d87316	! t0_kref+0x618:   	flush	%g1 - 0xcea
	.word	0xa03a3903	! t0_kref+0x61c:   	xnor	%o0, -0x6fd, %l0
	.word	0xaabd801a	! t0_kref+0x620:   	xnorcc	%l6, %i2, %l5
	.word	0xe24e0000	! t0_kref+0x624:   	ldsb	[%i0], %l1
	.word	0xe0680018	! t0_kref+0x628:   	ldstub	[%g0 + %i0], %l0
	.word	0xa65b0017	! t0_kref+0x62c:   	smul	%o4, %l7, %l3
	.word	0xa89ac015	! t0_kref+0x630:   	xorcc	%o3, %l5, %l4
	.word	0xa6f6f1f7	! t0_kref+0x634:   	udivcc	%i3, -0xe09, %l3
	.word	0xe00e3feb	! t0_kref+0x638:   	ldub	[%i0 - 0x15], %l0
	.word	0xa2acb492	! t0_kref+0x63c:   	andncc	%l2, -0xb6e, %l1
	.word	0xe430a00e	! t0_kref+0x640:   	sth	%l2, [%g2 + 0xe]
	.word	0xd1981018	! t0_kref+0x644:   	ldda	[%g0 + %i0]0x80, %f8
	.word	0xd100a028	! t0_kref+0x648:   	ld	[%g2 + 0x28], %f8
	.word	0xe76e001d	! t0_kref+0x64c:   	prefetch	%i0 + %i5, 19
	.word	0xf628a03e	! t0_kref+0x650:   	stb	%i3, [%g2 + 0x3e]
	.word	0xb410200f	! t0_kref+0x654:   	mov	0xf, %i2
	.word	0x8182c000	! t0_kref+0x658:   	wr	%o3, %g0, %y
	.word	0x9ba409ae	! t0_kref+0x65c:   	fdivs	%f16, %f14, %f13
	.word	0xa6947095	! t0_kref+0x660:   	orcc	%l1, -0xf6b, %l3
	.word	0xa7a00535	! t0_kref+0x664:   	fsqrts	%f21, %f19
	.word	0xe80e3ff7	! t0_kref+0x668:   	ldub	[%i0 - 9], %l4
	.word	0xe8163ffe	! t0_kref+0x66c:   	lduh	[%i0 - 2], %l4
	.word	0xa1a00533	! t0_kref+0x670:   	fsqrts	%f19, %f16
	.word	0x250b3660	! t0_kref+0x674:   	sethi	%hi(0x2cd98000), %l2
	.word	0xe4562016	! t0_kref+0x678:   	ldsh	[%i0 + 0x16], %l2
	.word	0xd3266008	! t0_kref+0x67c:   	st	%f9, [%i1 + 8]
	.word	0xeb68a082	! t0_kref+0x680:   	prefetch	%g2 + 0x82, 21
	.word	0xa6958010	! t0_kref+0x684:   	orcc	%l6, %l0, %l3
	.word	0xe3ee101d	! t0_kref+0x688:   	prefetcha	%i0 + %i5, 17
	.word	0x9de3bfa0	! t0_kref+0x68c:   	save	%sp, -0x60, %sp
	.word	0xb6964019	! t0_kref+0x690:   	orcc	%i1, %i1, %i3
	.word	0xa5ee22a5	! t0_kref+0x694:   	restore	%i0, 0x2a5, %l2
	.word	0x3f480002	! t0_kref+0x698:   	fbo,a,pt	%fcc0, _kref+0x6a0
	.word	0xd1260000	! t0_kref+0x69c:   	st	%f8, [%i0]
	.word	0xe9ee501c	! t0_kref+0x6a0:   	prefetcha	%i1 + %i4, 20
	.word	0xa32c000c	! t0_kref+0x6a4:   	sll	%l0, %o4, %l1
	.word	0xa23c7df4	! t0_kref+0x6a8:   	xnor	%l1, -0x20c, %l1
	.word	0xa72ae005	! t0_kref+0x6ac:   	sll	%o3, 0x5, %l3
	.word	0x99a44d31	! t0_kref+0x6b0:   	fsmuld	%f17, %f17, %f12
	.word	0xa5a01914	! t0_kref+0x6b4:   	fitod	%f20, %f18
	.word	0xe900a020	! t0_kref+0x6b8:   	ld	[%g2 + 0x20], %f20
	.word	0xe408a027	! t0_kref+0x6bc:   	ldub	[%g2 + 0x27], %l2
	.word	0xe100a020	! t0_kref+0x6c0:   	ld	[%g2 + 0x20], %f16
	.word	0xab25800c	! t0_kref+0x6c4:   	mulscc	%l6, %o4, %l5
	.word	0xa4723208	! t0_kref+0x6c8:   	udiv	%o0, -0xdf8, %l2
	.word	0x32480008	! t0_kref+0x6cc:   	bne,a,pt	%icc, _kref+0x6ec
	.word	0xd120a000	! t0_kref+0x6d0:   	st	%f8, [%g2]
	.word	0xaad225c4	! t0_kref+0x6d4:   	umulcc	%o0, 0x5c4, %l5
	.word	0xa5a24d2f	! t0_kref+0x6d8:   	fsmuld	%f9, %f15, %f18
	.word	0xab3c8012	! t0_kref+0x6dc:   	sra	%l2, %l2, %l5
	.word	0x81ad4aab	! t0_kref+0x6e0:   	fcmpes	%fcc0, %f21, %f11
	.word	0xe3b8a080	! t0_kref+0x6e4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x99a01a54	! t0_kref+0x6e8:   	fdtoi	%f20, %f12
	.word	0xa5a01a4c	! t0_kref+0x6ec:   	fdtoi	%f12, %f18
	.word	0xa85ce3f3	! t0_kref+0x6f0:   	smul	%l3, 0x3f3, %l4
	.word	0x9e006250	! t0_kref+0x6f4:   	add	%g1, 0x250, %o7
!	.word	0x3d85863f	! t0_kref+0x6f8:   	fbule,a	SYM(t0_subr2)
	   	fbule,a	SYM(t0_subr2)
	.word	0xe64e6007	! t0_kref+0x6fc:   	ldsb	[%i1 + 7], %l3
	.word	0x9de3bfa0	! t0_kref+0x700:   	save	%sp, -0x60, %sp
	.word	0xb856c01a	! t0_kref+0x704:   	umul	%i3, %i2, %i4
	.word	0xa7ee401b	! t0_kref+0x708:   	restore	%i1, %i3, %l3
	.word	0xa2a4b1ac	! t0_kref+0x70c:   	subcc	%l2, -0xe54, %l1
	.word	0x81ac8ab2	! t0_kref+0x710:   	fcmpes	%fcc0, %f18, %f18
	.word	0xe408627c	! t0_kref+0x714:   	ldub	[%g1 + 0x27c], %l2
	.word	0xa41ca00c	! t0_kref+0x718:   	xor	%l2, 0xc, %l2
	.word	0xe428627c	! t0_kref+0x71c:   	stb	%l2, [%g1 + 0x27c]
	.word	0x81d8627c	! t0_kref+0x720:   	flush	%g1 + 0x27c
2:	.word	0x2b34cb54	! t0_kref+0x724:   	sethi	%hi(0xd32d5000), %l5
	.word	0xeeff1019	! t0_kref+0x728:   	swapa	[%i4 + %i1]0x80, %l7
	.word	0xe6567ffc	! t0_kref+0x72c:   	ldsh	[%i1 - 4], %l3
	.word	0xa8bdb741	! t0_kref+0x730:   	xnorcc	%l6, -0x8bf, %l4
	.word	0xa8433f2c	! t0_kref+0x734:   	addc	%o4, -0xd4, %l4
	.word	0xff6e7ff0	! t0_kref+0x738:   	prefetch	%i1 - 0x10, 31
	.word	0xa5a20932	! t0_kref+0x73c:   	fmuls	%f8, %f18, %f18
	.word	0xaa42f640	! t0_kref+0x740:   	addc	%o3, -0x9c0, %l5
	.word	0x83414000	! t0_kref+0x744:   	mov	%pc, %g1
	.word	0x91a0192e	! t0_kref+0x748:   	fstod	%f14, %f8
	.word	0xd67e2018	! t0_kref+0x74c:   	swap	[%i0 + 0x18], %o3
	.word	0xe19e5a5d	! t0_kref+0x750:   	ldda	[%i1 + %i5]0xd2, %f16
	.word	0x97a000af	! t0_kref+0x754:   	fnegs	%f15, %f11
	.word	0xe04e7ffd	! t0_kref+0x758:   	ldsb	[%i1 - 3], %l0
	.word	0x91a488d6	! t0_kref+0x75c:   	fsubd	%f18, %f22, %f8
	.word	0xe6480019	! t0_kref+0x760:   	ldsb	[%g0 + %i1], %l3
	.word	0xea6e001a	! t0_kref+0x764:   	ldstub	[%i0 + %i2], %l5
	.word	0x95a00535	! t0_kref+0x768:   	fsqrts	%f21, %f10
	.word	0xa8e2c012	! t0_kref+0x76c:   	subccc	%o3, %l2, %l4
	.word	0x2e480006	! t0_kref+0x770:   	bvs,a,pt	%icc, _kref+0x788
	.word	0xa0ad27e5	! t0_kref+0x774:   	andncc	%l4, 0x7e5, %l0
	.word	0xea166006	! t0_kref+0x778:   	lduh	[%i1 + 6], %l5
	.word	0x9da01933	! t0_kref+0x77c:   	fstod	%f19, %f14
	.word	0x95a000b1	! t0_kref+0x780:   	fnegs	%f17, %f10
	.word	0xa6252d55	! t0_kref+0x784:   	sub	%l4, 0xd55, %l3
	.word	0x35480003	! t0_kref+0x788:   	fbue,a,pt	%fcc0, _kref+0x794
	.word	0xa6ac229d	! t0_kref+0x78c:   	andncc	%l0, 0x29d, %l3
	.word	0x2f480008	! t0_kref+0x790:   	fbu,a,pt	%fcc0, _kref+0x7b0
	.word	0xe4070019	! t0_kref+0x794:   	ld	[%i4 + %i1], %l2
	.word	0xd9be1a1b	! t0_kref+0x798:   	stda	%f12, [%i0 + %i3]0xd0
	.word	0xada0108a	! t0_kref+0x79c:   	fxtos	%f10, %f22
	.word	0xe640a01c	! t0_kref+0x7a0:   	ldsw	[%g2 + 0x1c], %l3
	.word	0xa3400000	! t0_kref+0x7a4:   	mov	%y, %l1
	.word	0x3e480004	! t0_kref+0x7a8:   	bvc,a,pt	%icc, _kref+0x7b8
	.word	0xa8ac801b	! t0_kref+0x7ac:   	andncc	%l2, %i3, %l4
	.word	0xa0e5b7db	! t0_kref+0x7b0:   	subccc	%l6, -0x825, %l0
	.word	0xa3a0052a	! t0_kref+0x7b4:   	fsqrts	%f10, %f17
	.word	0xe60e4000	! t0_kref+0x7b8:   	ldub	[%i1], %l3
	.word	0xa23b79a8	! t0_kref+0x7bc:   	xnor	%o5, -0x658, %l1
	.word	0xa5418000	! t0_kref+0x7c0:   	mov	%fprs, %l2
	.word	0xe9ee101b	! t0_kref+0x7c4:   	prefetcha	%i0 + %i3, 20
	.word	0xe40860b0	! t0_kref+0x7c8:   	ldub	[%g1 + 0xb0], %l2
	.word	0xa41ca00c	! t0_kref+0x7cc:   	xor	%l2, 0xc, %l2
	.word	0xe42860b0	! t0_kref+0x7d0:   	stb	%l2, [%g1 + 0xb0]
	.word	0x81d860b0	! t0_kref+0x7d4:   	flush	%g1 + 0xb0
	.word	0xa123000a	! t0_kref+0x7d8:   	mulscc	%o4, %o2, %l0
	.word	0xa1418000	! t0_kref+0x7dc:   	mov	%fprs, %l0
	.word	0xa8ab7e33	! t0_kref+0x7e0:   	andncc	%o5, -0x1cd, %l4
	.word	0xa262e48a	! t0_kref+0x7e4:   	subc	%o3, 0x48a, %l1
	.word	0xa5254010	! t0_kref+0x7e8:   	mulscc	%l5, %l0, %l2
	.word	0x81ab4ab2	! t0_kref+0x7ec:   	fcmpes	%fcc0, %f13, %f18
	.word	0xa2e32ede	! t0_kref+0x7f0:   	subccc	%o4, 0xede, %l1
2:	.word	0xa1a01912	! t0_kref+0x7f4:   	fitod	%f18, %f16
	.word	0x99a000b0	! t0_kref+0x7f8:   	fnegs	%f16, %f12
	.word	0xa7244015	! t0_kref+0x7fc:   	mulscc	%l1, %l5, %l3
	.word	0xe26e2003	! t0_kref+0x800:   	ldstub	[%i0 + 3], %l1
	.word	0xa45a61a3	! t0_kref+0x804:   	smul	%o1, 0x1a3, %l2
	.word	0x2c800007	! t0_kref+0x808:   	bneg,a	_kref+0x824
	.word	0xe06e200d	! t0_kref+0x80c:   	ldstub	[%i0 + 0xd], %l0
	.word	0x91a01909	! t0_kref+0x810:   	fitod	%f9, %f8
	.word	0xa9a4c933	! t0_kref+0x814:   	fmuls	%f19, %f19, %f20
	.word	0xa8e4e493	! t0_kref+0x818:   	subccc	%l3, 0x493, %l4
	.word	0xa82dfb47	! t0_kref+0x81c:   	andn	%l7, -0x4b9, %l4
	.word	0xd5067ff0	! t0_kref+0x820:   	ld	[%i1 - 0x10], %f10
	.word	0xa69b4000	! t0_kref+0x824:   	xorcc	%o5, %g0, %l3
	.word	0xa89d0010	! t0_kref+0x828:   	xorcc	%l4, %l0, %l4
	.word	0xa0654013	! t0_kref+0x82c:   	subc	%l5, %l3, %l0
	.word	0xd628a00f	! t0_kref+0x830:   	stb	%o3, [%g2 + 0xf]
	.word	0xe920a03c	! t0_kref+0x834:   	st	%f20, [%g2 + 0x3c]
	.word	0xe19e5a1c	! t0_kref+0x838:   	ldda	[%i1 + %i4]0xd0, %f16
	.word	0xf428a02c	! t0_kref+0x83c:   	stb	%i2, [%g2 + 0x2c]
	.word	0xe320a01c	! t0_kref+0x840:   	st	%f17, [%g2 + 0x1c]
	.word	0xa8e48017	! t0_kref+0x844:   	subccc	%l2, %l7, %l4
	.word	0xd8270018	! t0_kref+0x848:   	st	%o4, [%i4 + %i0]
	.word	0xa3344012	! t0_kref+0x84c:   	srl	%l1, %l2, %l1
	.word	0xe700a014	! t0_kref+0x850:   	ld	[%g2 + 0x14], %f19
	.word	0x97a01092	! t0_kref+0x854:   	fxtos	%f18, %f11
	.word	0xa73cc01b	! t0_kref+0x858:   	sra	%l3, %i3, %l3
	.word	0x32480004	! t0_kref+0x85c:   	bne,a,pt	%icc, _kref+0x86c
	.word	0xe8167ffc	! t0_kref+0x860:   	lduh	[%i1 - 4], %l4
	.word	0x93a000b0	! t0_kref+0x864:   	fnegs	%f16, %f9
	.word	0xd900a018	! t0_kref+0x868:   	ld	[%g2 + 0x18], %f12
	call	SYM(t0_subr2)
	.word	0x2703c802	! t0_kref+0x870:   	sethi	%hi(0xf200800), %l3
	.word	0xec1e3fe0	! t0_kref+0x874:   	ldd	[%i0 - 0x20], %l6
	.word	0xa5a2c929	! t0_kref+0x878:   	fmuls	%f11, %f9, %f18
	.word	0xea160000	! t0_kref+0x87c:   	lduh	[%i0], %l5
	.word	0xe46e2013	! t0_kref+0x880:   	ldstub	[%i0 + 0x13], %l2
	.word	0xea464000	! t0_kref+0x884:   	ldsw	[%i1], %l5
	.word	0xa5a000b5	! t0_kref+0x888:   	fnegs	%f21, %f18
	.word	0xa4983e14	! t0_kref+0x88c:   	xorcc	%g0, -0x1ec, %l2
	.word	0xa615f042	! t0_kref+0x890:   	or	%l7, -0xfbe, %l3
	.word	0xd278a01c	! t0_kref+0x894:   	swap	[%g2 + 0x1c], %o1
	.word	0xa62a35cd	! t0_kref+0x898:   	andn	%o0, -0xa33, %l3
	.word	0xada94048	! t0_kref+0x89c:   	fmovdug	%fcc0, %f8, %f22
	.word	0xd100a020	! t0_kref+0x8a0:   	ld	[%g2 + 0x20], %f8
	.word	0xaa256bd6	! t0_kref+0x8a4:   	sub	%l5, 0xbd6, %l5
	.word	0x23480001	! t0_kref+0x8a8:   	fbne,a,pt	%fcc0, _kref+0x8ac
	.word	0xe0ce9019	! t0_kref+0x8ac:   	ldsba	[%i2 + %i1]0x80, %l0
	.word	0xa1400000	! t0_kref+0x8b0:   	mov	%y, %l0
	.word	0xe0063ffc	! t0_kref+0x8b4:   	ld	[%i0 - 4], %l0
	.word	0xaa12400d	! t0_kref+0x8b8:   	or	%o1, %o5, %l5
	.word	0x9fa000a9	! t0_kref+0x8bc:   	fnegs	%f9, %f15
	.word	0xa52b0000	! t0_kref+0x8c0:   	sll	%o4, %g0, %l2
	.word	0xe56e2008	! t0_kref+0x8c4:   	prefetch	%i0 + 8, 18
	.word	0xe8067fe8	! t0_kref+0x8c8:   	ld	[%i1 - 0x18], %l4
	.word	0xe0263ff4	! t0_kref+0x8cc:   	st	%l0, [%i0 - 0xc]
	.word	0x81aa4a36	! t0_kref+0x8d0:   	fcmps	%fcc0, %f9, %f22
	.word	0xa1a24830	! t0_kref+0x8d4:   	fadds	%f9, %f16, %f16
	.word	0x36800006	! t0_kref+0x8d8:   	bge,a	_kref+0x8f0
	.word	0xe87e3ff8	! t0_kref+0x8dc:   	swap	[%i0 - 8], %l4
	.word	0x93a9002d	! t0_kref+0x8e0:   	fmovsl	%fcc0, %f13, %f9
	.word	0xe0500018	! t0_kref+0x8e4:   	ldsh	[%g0 + %i0], %l0
	.word	0xab25c00c	! t0_kref+0x8e8:   	mulscc	%l7, %o4, %l5
	.word	0xaa3db607	! t0_kref+0x8ec:   	xnor	%l6, -0x9f9, %l5
	.word	0xa2faf87b	! t0_kref+0x8f0:   	sdivcc	%o3, -0x785, %l1
	.word	0x2a800008	! t0_kref+0x8f4:   	bcs,a	_kref+0x914
	.word	0xec1e3ff8	! t0_kref+0x8f8:   	ldd	[%i0 - 8], %l6
	.word	0x95a20d31	! t0_kref+0x8fc:   	fsmuld	%f8, %f17, %f10
	.word	0xd120a000	! t0_kref+0x900:   	st	%f8, [%g2]
	.word	0xf207bfe0	! t0_kref+0x904:   	ld	[%fp - 0x20], %i1
	.word	0x2e480002	! t0_kref+0x908:   	bvs,a,pt	%icc, _kref+0x910
	.word	0xa1a4cd29	! t0_kref+0x90c:   	fsmuld	%f19, %f9, %f16
	.word	0xa3400000	! t0_kref+0x910:   	mov	%y, %l1
	.word	0xd828a03a	! t0_kref+0x914:   	stb	%o4, [%g2 + 0x3a]
	.word	0x9de3bfa0	! t0_kref+0x918:   	save	%sp, -0x60, %sp
	.word	0xb6980019	! t0_kref+0x91c:   	xorcc	%g0, %i1, %i3
	.word	0xa7ef0018	! t0_kref+0x920:   	restore	%i4, %i0, %l3
	.word	0xa5254012	! t0_kref+0x924:   	mulscc	%l5, %l2, %l2
	.word	0xe2564000	! t0_kref+0x928:   	ldsh	[%i1], %l1
	.word	0x9f414000	! t0_kref+0x92c:   	mov	%pc, %o7
	.word	0xea4e200b	! t0_kref+0x930:   	ldsb	[%i0 + 0xb], %l5
	.word	0xe3b8a080	! t0_kref+0x934:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x99a01a2f	! t0_kref+0x938:   	fstoi	%f15, %f12
	.word	0x81ab8a48	! t0_kref+0x93c:   	fcmpd	%fcc0, %f14, %f8
	.word	0x3e480003	! t0_kref+0x940:   	bvc,a,pt	%icc, _kref+0x94c
	.word	0xe900a00c	! t0_kref+0x944:   	ld	[%g2 + 0xc], %f20
	.word	0x20800006	! t0_kref+0x948:   	bn,a	_kref+0x960
	.word	0xa5a000b3	! t0_kref+0x94c:   	fnegs	%f19, %f18
	.word	0x250cb473	! t0_kref+0x950:   	sethi	%hi(0x32d1cc00), %l2
	.word	0xa8644013	! t0_kref+0x954:   	subc	%l1, %l3, %l4
	.word	0xe8164000	! t0_kref+0x958:   	lduh	[%i1], %l4
	.word	0x3e800004	! t0_kref+0x95c:   	bvc,a	_kref+0x96c
	.word	0xa5a00530	! t0_kref+0x960:   	fsqrts	%f16, %f18
	.word	0xefee101c	! t0_kref+0x964:   	prefetcha	%i0 + %i4, 23
	.word	0xa7a409b1	! t0_kref+0x968:   	fdivs	%f16, %f17, %f19
	.word	0xe76e2018	! t0_kref+0x96c:   	prefetch	%i0 + 0x18, 19
	.word	0xf7ee101d	! t0_kref+0x970:   	prefetcha	%i0 + %i5, 27
	.word	0xa9a01909	! t0_kref+0x974:   	fitod	%f9, %f20
	.word	0x81ad8a2f	! t0_kref+0x978:   	fcmps	%fcc0, %f22, %f15
	.word	0xe51fbf08	! t0_kref+0x97c:   	ldd	[%fp - 0xf8], %f18
	.word	0xa1a588a9	! t0_kref+0x980:   	fsubs	%f22, %f9, %f16
	.word	0xaa62801a	! t0_kref+0x984:   	subc	%o2, %i2, %l5
	.word	0xaa5a2844	! t0_kref+0x988:   	smul	%o0, 0x844, %l5
	.word	0xe24e401a	! t0_kref+0x98c:   	ldsb	[%i1 + %i2], %l1
	.word	0xa8202a9b	! t0_kref+0x990:   	sub	%g0, 0xa9b, %l4
	.word	0x32480005	! t0_kref+0x994:   	bne,a,pt	%icc, _kref+0x9a8
	.word	0x95a01932	! t0_kref+0x998:   	fstod	%f18, %f10
	.word	0x9f414000	! t0_kref+0x99c:   	mov	%pc, %o7
	.word	0xa0d36cfd	! t0_kref+0x9a0:   	umulcc	%o5, 0xcfd, %l0
	.word	0x3f800005	! t0_kref+0x9a4:   	fbo,a	_kref+0x9b8
	.word	0xa00cc000	! t0_kref+0x9a8:   	and	%l3, %g0, %l0
	.word	0xe04e6017	! t0_kref+0x9ac:   	ldsb	[%i1 + 0x17], %l0
	.word	0xa1a01912	! t0_kref+0x9b0:   	fitod	%f18, %f16
	.word	0xda28a036	! t0_kref+0x9b4:   	stb	%o5, [%g2 + 0x36]
	.word	0xa854c009	! t0_kref+0x9b8:   	umul	%l3, %o1, %l4
	.word	0x81ab8a50	! t0_kref+0x9bc:   	fcmpd	%fcc0, %f14, %f16
	.word	0x2712b713	! t0_kref+0x9c0:   	sethi	%hi(0x4adc4c00), %l3
	.word	0xa4f24014	! t0_kref+0x9c4:   	udivcc	%o1, %l4, %l2
	.word	0xa05dc012	! t0_kref+0x9c8:   	smul	%l7, %l2, %l0
	.word	0xeca6101c	! t0_kref+0x9cc:   	sta	%l6, [%i0 + %i4]0x80
	.word	0xfdee101a	! t0_kref+0x9d0:   	prefetcha	%i0 + %i2, 30
	.word	0x95a0052a	! t0_kref+0x9d4:   	fsqrts	%f10, %f10
	.word	0xe53e0000	! t0_kref+0x9d8:   	std	%f18, [%i0]
	.word	0xc807bff0	! t0_kref+0x9dc:   	ld	[%fp - 0x10], %g4
	sethi	%hi(2f), %o7
	.word	0xe40be214	! t0_kref+0x9e4:   	ldub	[%o7 + 0x214], %l2
	.word	0xa41ca00c	! t0_kref+0x9e8:   	xor	%l2, 0xc, %l2
	.word	0xe42be214	! t0_kref+0x9ec:   	stb	%l2, [%o7 + 0x214]
	.word	0x81dbe214	! t0_kref+0x9f0:   	flush	%o7 + 0x214
	.word	0x2b07a6fe	! t0_kref+0x9f4:   	sethi	%hi(0x1e9bf800), %l5
	.word	0xa8a4a1cb	! t0_kref+0x9f8:   	subcc	%l2, 0x1cb, %l4
	.word	0xeb20a02c	! t0_kref+0x9fc:   	st	%f21, [%g2 + 0x2c]
	.word	0xa9a48d32	! t0_kref+0xa00:   	fsmuld	%f18, %f18, %f20
	.word	0x99a58d32	! t0_kref+0xa04:   	fsmuld	%f22, %f18, %f12
	.word	0x99a28d2f	! t0_kref+0xa08:   	fsmuld	%f10, %f15, %f12
	.word	0xaa7eb1af	! t0_kref+0xa0c:   	sdiv	%i2, -0xe51, %l5
	.word	0xa874800c	! t0_kref+0xa10:   	udiv	%l2, %o4, %l4
2:	.word	0xaa75aa56	! t0_kref+0xa14:   	udiv	%l6, 0xa56, %l5
	.word	0x24800002	! t0_kref+0xa18:   	ble,a	_kref+0xa20
	.word	0x91a01a2a	! t0_kref+0xa1c:   	fstoi	%f10, %f8
	.word	0x81ad0ab6	! t0_kref+0xa20:   	fcmpes	%fcc0, %f20, %f22
	.word	0xe8060000	! t0_kref+0xa24:   	ld	[%i0], %l4
	.word	0x97a00536	! t0_kref+0xa28:   	fsqrts	%f22, %f11
	.word	0xa45d2803	! t0_kref+0xa2c:   	smul	%l4, 0x803, %l2
	.word	0x81aa0a50	! t0_kref+0xa30:   	fcmpd	%fcc0, %f8, %f16
	.word	0x2d480003	! t0_kref+0xa34:   	fbg,a,pt	%fcc0, _kref+0xa40
	.word	0x91a0192c	! t0_kref+0xa38:   	fstod	%f12, %f8
	.word	0xd09f5018	! t0_kref+0xa3c:   	ldda	[%i5 + %i0]0x80, %o0
	.word	0xa612767b	! t0_kref+0xa40:   	or	%o1, -0x985, %l3
	.word	0x86102002	! t0_kref+0xa44:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xa48:   	bne,a	_kref+0xa48
	.word	0x86a0e001	! t0_kref+0xa4c:   	subcc	%g3, 1, %g3
	.word	0xa7a0052d	! t0_kref+0xa50:   	fsqrts	%f13, %f19
	.word	0x9da0190f	! t0_kref+0xa54:   	fitod	%f15, %f14
	.word	0xe44e8019	! t0_kref+0xa58:   	ldsb	[%i2 + %i1], %l2
	.word	0x81ac8a2c	! t0_kref+0xa5c:   	fcmps	%fcc0, %f18, %f12
	.word	0xa0724010	! t0_kref+0xa60:   	udiv	%o1, %l0, %l0
	.word	0x95a0052a	! t0_kref+0xa64:   	fsqrts	%f10, %f10
	.word	0xda20a030	! t0_kref+0xa68:   	st	%o5, [%g2 + 0x30]
	.word	0x81ad0aac	! t0_kref+0xa6c:   	fcmpes	%fcc0, %f20, %f12
	.word	0xa062afc2	! t0_kref+0xa70:   	subc	%o2, 0xfc2, %l0
	.word	0xa725791e	! t0_kref+0xa74:   	mulscc	%l5, -0x6e2, %l3
	.word	0x22800004	! t0_kref+0xa78:   	be,a	_kref+0xa88
	.word	0xa6232282	! t0_kref+0xa7c:   	sub	%o4, 0x282, %l3
	.word	0xa11cc00a	! t0_kref+0xa80:   	tsubcctv	%l3, %o2, %l0
	.word	0xd9be5809	! t0_kref+0xa84:   	stda	%f12, [%i1 + %o1]0xc0
	.word	0xe500a028	! t0_kref+0xa88:   	ld	[%g2 + 0x28], %f18
	.word	0xe84e4000	! t0_kref+0xa8c:   	ldsb	[%i1], %l4
	.word	0x81aaca28	! t0_kref+0xa90:   	fcmps	%fcc0, %f11, %f8
	.word	0x81aa0ace	! t0_kref+0xa94:   	fcmped	%fcc0, %f8, %f14
	.word	0xa1a00136	! t0_kref+0xa98:   	fabss	%f22, %f16
	.word	0x83414000	! t0_kref+0xa9c:   	mov	%pc, %g1
	.word	0x95a000b6	! t0_kref+0xaa0:   	fnegs	%f22, %f10
	.word	0xa0b5800c	! t0_kref+0xaa4:   	orncc	%l6, %o4, %l0
	.word	0xe6562018	! t0_kref+0xaa8:   	ldsh	[%i0 + 0x18], %l3
	.word	0xd66e7fe9	! t0_kref+0xaac:   	ldstub	[%i1 - 0x17], %o3
	.word	0xa65ae956	! t0_kref+0xab0:   	smul	%o3, 0x956, %l3
	.word	0xe1062004	! t0_kref+0xab4:   	ld	[%i0 + 4], %f16
	.word	0xe408603c	! t0_kref+0xab8:   	ldub	[%g1 + 0x3c], %l2
	.word	0xa41ca00c	! t0_kref+0xabc:   	xor	%l2, 0xc, %l2
	.word	0xe428603c	! t0_kref+0xac0:   	stb	%l2, [%g1 + 0x3c]
	.word	0x81d8603c	! t0_kref+0xac4:   	flush	%g1 + 0x3c
	.word	0x99a01a2d	! t0_kref+0xac8:   	fstoi	%f13, %f12
	.word	0xea8e501a	! t0_kref+0xacc:   	lduba	[%i1 + %i2]0x80, %l5
	.word	0x2f480008	! t0_kref+0xad0:   	fbu,a,pt	%fcc0, _kref+0xaf0
	.word	0xed00a02c	! t0_kref+0xad4:   	ld	[%g2 + 0x2c], %f22
2:	.word	0x91a0052f	! t0_kref+0xad8:   	fsqrts	%f15, %f8
	.word	0x81ab4a36	! t0_kref+0xadc:   	fcmps	%fcc0, %f13, %f22
	.word	0x81dd401d	! t0_kref+0xae0:   	flush	%l5 + %i5
	.word	0xe2567fe0	! t0_kref+0xae4:   	ldsh	[%i1 - 0x20], %l1
	.word	0x9da01a36	! t0_kref+0xae8:   	fstoi	%f22, %f14
	.word	0xa47d8016	! t0_kref+0xaec:   	sdiv	%l6, %l6, %l2
	.word	0xe878a014	! t0_kref+0xaf0:   	swap	[%g2 + 0x14], %l4
	.word	0xc807bff0	! t0_kref+0xaf4:   	ld	[%fp - 0x10], %g4
	.word	0xe296505b	! t0_kref+0xaf8:   	lduha	[%i1 + %i3]0x82, %l1
	.word	0xaaf6e791	! t0_kref+0xafc:   	udivcc	%i3, 0x791, %l5
	.word	0xa5a0052c	! t0_kref+0xb00:   	fsqrts	%f12, %f18
	.word	0xaba000b0	! t0_kref+0xb04:   	fnegs	%f16, %f21
	.word	0xd9200018	! t0_kref+0xb08:   	st	%f12, [%g0 + %i0]
	.word	0xd020a018	! t0_kref+0xb0c:   	st	%o0, [%g2 + 0x18]
	.word	0xaba3082c	! t0_kref+0xb10:   	fadds	%f12, %f12, %f21
	.word	0xe6901019	! t0_kref+0xb14:   	lduha	[%g0 + %i1]0x80, %l3
	.word	0xa025000d	! t0_kref+0xb18:   	sub	%l4, %o5, %l0
	.word	0xe6280018	! t0_kref+0xb1c:   	stb	%l3, [%g0 + %i0]
	.word	0x97a01a2e	! t0_kref+0xb20:   	fstoi	%f14, %f11
	.word	0xe250a00c	! t0_kref+0xb24:   	ldsh	[%g2 + 0xc], %l1
	.word	0x8143e040	! t0_kref+0xb28:   	membar	0x40
	.word	0xa3a509b2	! t0_kref+0xb2c:   	fdivs	%f20, %f18, %f17
	.word	0xa6246480	! t0_kref+0xb30:   	sub	%l1, 0x480, %l3
	.word	0xa9380016	! t0_kref+0xb34:   	sra	%g0, %l6, %l4
	.word	0xa652f43b	! t0_kref+0xb38:   	umul	%o3, -0xbc5, %l3
	.word	0xeeae9019	! t0_kref+0xb3c:   	stba	%l7, [%i2 + %i1]0x80
	.word	0x99a01934	! t0_kref+0xb40:   	fstod	%f20, %f12
	.word	0xe4064000	! t0_kref+0xb44:   	ld	[%i1], %l2
	.word	0xab334012	! t0_kref+0xb48:   	srl	%o5, %l2, %l5
	.word	0xe9262008	! t0_kref+0xb4c:   	st	%f20, [%i0 + 8]
	.word	0xea06401c	! t0_kref+0xb50:   	ld	[%i1 + %i4], %l5
	.word	0xada4092d	! t0_kref+0xb54:   	fmuls	%f16, %f13, %f22
	.word	0x34800003	! t0_kref+0xb58:   	bg,a	_kref+0xb64
	.word	0xa5258012	! t0_kref+0xb5c:   	mulscc	%l6, %l2, %l2
	.word	0xea262008	! t0_kref+0xb60:   	st	%l5, [%i0 + 8]
	.word	0x81ad0aaf	! t0_kref+0xb64:   	fcmpes	%fcc0, %f20, %f15
	.word	0xa6652400	! t0_kref+0xb68:   	subc	%l4, 0x400, %l3
	.word	0x91a00528	! t0_kref+0xb6c:   	fsqrts	%f8, %f8
	.word	0xe1200018	! t0_kref+0xb70:   	st	%f16, [%g0 + %i0]
	.word	0xa624ae78	! t0_kref+0xb74:   	sub	%l2, 0xe78, %l3
	.word	0xaba20828	! t0_kref+0xb78:   	fadds	%f8, %f8, %f21
	.word	0xa9a30d33	! t0_kref+0xb7c:   	fsmuld	%f12, %f19, %f20
	.word	0x86102003	! t0_kref+0xb80:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xb84:   	bne,a	_kref+0xb84
	.word	0x86a0e001	! t0_kref+0xb88:   	subcc	%g3, 1, %g3
	.word	0xab342018	! t0_kref+0xb8c:   	srl	%l0, 0x18, %l5
	.word	0xa1a30d33	! t0_kref+0xb90:   	fsmuld	%f12, %f19, %f16
	.word	0xa1a0014a	! t0_kref+0xb94:   	fabsd	%f10, %f16
	.word	0xa6aa7721	! t0_kref+0xb98:   	andncc	%o1, -0x8df, %l3
	.word	0xe6de1000	! t0_kref+0xb9c:   	ldxa	[%i0]0x80, %l3
	.word	0x91a00534	! t0_kref+0xba0:   	fsqrts	%f20, %f8
	.word	0xefee501b	! t0_kref+0xba4:   	prefetcha	%i1 + %i3, 23
	.word	0xe05f4019	! t0_kref+0xba8:   	ldx	[%i5 + %i1], %l0
	.word	0xa00ae08e	! t0_kref+0xbac:   	and	%o3, 0x8e, %l0
	.word	0x30480001	! t0_kref+0xbb0:   	ba,a,pt	%icc, _kref+0xbb4
	.word	0xc36e3fe0	! t0_kref+0xbb4:   	prefetch	%i0 - 0x20, 1
	.word	0xe28e1000	! t0_kref+0xbb8:   	lduba	[%i0]0x80, %l1
	.word	0xa40ac00c	! t0_kref+0xbbc:   	and	%o3, %o4, %l2
	.word	0xa1a01a36	! t0_kref+0xbc0:   	fstoi	%f22, %f16
	.word	0xa696e1a3	! t0_kref+0xbc4:   	orcc	%i3, 0x1a3, %l3
	.word	0x22480008	! t0_kref+0xbc8:   	be,a,pt	%icc, _kref+0xbe8
	.word	0xe89e1000	! t0_kref+0xbcc:   	ldda	[%i0]0x80, %l4
	.word	0x39480005	! t0_kref+0xbd0:   	fbuge,a,pt	%fcc0, _kref+0xbe4
	.word	0xa935e00d	! t0_kref+0xbd4:   	srl	%l7, 0xd, %l4
	.word	0xed6e6018	! t0_kref+0xbd8:   	prefetch	%i1 + 0x18, 22
	.word	0xe250a038	! t0_kref+0xbdc:   	ldsh	[%g2 + 0x38], %l1
	.word	0x2f480003	! t0_kref+0xbe0:   	fbu,a,pt	%fcc0, _kref+0xbec
	.word	0xa4368010	! t0_kref+0xbe4:   	orn	%i2, %l0, %l2
	.word	0x81acca2d	! t0_kref+0xbe8:   	fcmps	%fcc0, %f19, %f13
	.word	0x34800006	! t0_kref+0xbec:   	bg,a	_kref+0xc04
	.word	0xa45c6987	! t0_kref+0xbf0:   	smul	%l1, 0x987, %l2
	.word	0x20800001	! t0_kref+0xbf4:   	bn,a	_kref+0xbf8
	.word	0xa8730000	! t0_kref+0xbf8:   	udiv	%o4, %g0, %l4
	.word	0x30480008	! t0_kref+0xbfc:   	ba,a,pt	%icc, _kref+0xc1c
	.word	0xea566012	! t0_kref+0xc00:   	ldsh	[%i1 + 0x12], %l5
	.word	0xa6e20015	! t0_kref+0xc04:   	subccc	%o0, %l5, %l3
	.word	0x81dec01b	! t0_kref+0xc08:   	flush	%i3 + %i3
	.word	0xa7a000b2	! t0_kref+0xc0c:   	fnegs	%f18, %f19
	.word	0xc0262014	! t0_kref+0xc10:   	clr	[%i0 + 0x14]
	.word	0x81ad0ad4	! t0_kref+0xc14:   	fcmped	%fcc0, %f20, %f20
	.word	0xa9a20931	! t0_kref+0xc18:   	fmuls	%f8, %f17, %f20
	.word	0xe168a08b	! t0_kref+0xc1c:   	prefetch	%g2 + 0x8b, 16
	.word	0xa60debfc	! t0_kref+0xc20:   	and	%l7, 0xbfc, %l3
	.word	0xd6ae9018	! t0_kref+0xc24:   	stba	%o3, [%i2 + %i0]0x80
	.word	0x81dc0005	! t0_kref+0xc28:   	flush	%l0 + %g5
	.word	0xab1b7830	! t0_kref+0xc2c:   	tsubcctv	%o5, -0x7d0, %l5
	.word	0x81ab8a52	! t0_kref+0xc30:   	fcmpd	%fcc0, %f14, %f18
	.word	0x9ba00033	! t0_kref+0xc34:   	fmovs	%f19, %f13
	.word	0xe80e8019	! t0_kref+0xc38:   	ldub	[%i2 + %i1], %l4
	.word	0xe03e7ff0	! t0_kref+0xc3c:   	std	%l0, [%i1 - 0x10]
	.word	0xe640a004	! t0_kref+0xc40:   	ldsw	[%g2 + 4], %l3
	.word	0xa4a478b5	! t0_kref+0xc44:   	subcc	%l1, -0x74b, %l2
	.word	0x3a480002	! t0_kref+0xc48:   	bcc,a,pt	%icc, _kref+0xc50
	.word	0xe84e401a	! t0_kref+0xc4c:   	ldsb	[%i1 + %i2], %l4
	.word	0xf96e2000	! t0_kref+0xc50:   	prefetch	%i0, 28
	.word	0xa8b2c01a	! t0_kref+0xc54:   	orncc	%o3, %i2, %l4
	.word	0xa92d8014	! t0_kref+0xc58:   	sll	%l6, %l4, %l4
	.word	0xda20a028	! t0_kref+0xc5c:   	st	%o5, [%g2 + 0x28]
	.word	0x81df4000	! t0_kref+0xc60:   	flush	%i5
	.word	0xa83da20e	! t0_kref+0xc64:   	xnor	%l6, 0x20e, %l4
	.word	0xd26e2001	! t0_kref+0xc68:   	ldstub	[%i0 + 1], %o1
	.word	0x9fc10000	! t0_kref+0xc6c:   	call	%g4
	.word	0xaaf37497	! t0_kref+0xc70:   	udivcc	%o5, -0xb69, %l5
	.word	0xd13f4018	! t0_kref+0xc74:   	std	%f8, [%i5 + %i0]
	.word	0xa80ca104	! t0_kref+0xc78:   	and	%l2, 0x104, %l4
	.word	0xe0167ff6	! t0_kref+0xc7c:   	lduh	[%i1 - 0xa], %l0
	.word	0x25239afc	! t0_kref+0xc80:   	sethi	%hi(0x8e6bf000), %l2
	.word	0x26480001	! t0_kref+0xc84:   	bl,a,pt	%icc, _kref+0xc88
	.word	0xd5981018	! t0_kref+0xc88:   	ldda	[%g0 + %i0]0x80, %f10
	.word	0xa9a01a31	! t0_kref+0xc8c:   	fstoi	%f17, %f20
	.word	0xa21eb7bf	! t0_kref+0xc90:   	xor	%i2, -0x841, %l1
	.word	0xa8328012	! t0_kref+0xc94:   	orn	%o2, %l2, %l4
	.word	0x81aa0a48	! t0_kref+0xc98:   	fcmpd	%fcc0, %f8, %f8
	.word	0x9fc00004	! t0_kref+0xc9c:   	call	%g0 + %g4
	.word	0xa1322014	! t0_kref+0xca0:   	srl	%o0, 0x14, %l0
	.word	0x9da409c8	! t0_kref+0xca4:   	fdivd	%f16, %f8, %f14
	.word	0xe7ee501a	! t0_kref+0xca8:   	prefetcha	%i1 + %i2, 19
	.word	0x001fffff	! t0_kref+0xcac:   	illtrap	0x1fffff
	.word	0xe99e5a1c	! t0_kref+0xcb0:   	ldda	[%i1 + %i4]0xd0, %f20
	.word	0x81ad8a54	! t0_kref+0xcb4:   	fcmpd	%fcc0, %f22, %f20
	.word	0x95a24d2a	! t0_kref+0xcb8:   	fsmuld	%f9, %f10, %f10
	.word	0xa2aaea52	! t0_kref+0xcbc:   	andncc	%o3, 0xa52, %l1
	.word	0xa5a309cc	! t0_kref+0xcc0:   	fdivd	%f12, %f12, %f18
	.word	0xa4244017	! t0_kref+0xcc4:   	sub	%l1, %l7, %l2
	.word	0xe19f5018	! t0_kref+0xcc8:   	ldda	[%i5 + %i0]0x80, %f16
	.word	0x26800006	! t0_kref+0xccc:   	bl,a	_kref+0xce4
	.word	0xa22265d8	! t0_kref+0xcd0:   	sub	%o1, 0x5d8, %l1
	.word	0xa6244017	! t0_kref+0xcd4:   	sub	%l1, %l7, %l3
	.word	0xe5180018	! t0_kref+0xcd8:   	ldd	[%g0 + %i0], %f18
	.word	0xada01894	! t0_kref+0xcdc:   	fitos	%f20, %f22
	.word	0xdd1fbdc0	! t0_kref+0xce0:   	ldd	[%fp - 0x240], %f14
	.word	0x81854000	! t0_kref+0xce4:   	wr	%l5, %g0, %y
	sethi	%hi(2f), %o7
	.word	0xe40be128	! t0_kref+0xcec:   	ldub	[%o7 + 0x128], %l2
	.word	0xa41ca00c	! t0_kref+0xcf0:   	xor	%l2, 0xc, %l2
	.word	0xe42be128	! t0_kref+0xcf4:   	stb	%l2, [%o7 + 0x128]
	.word	0x81dbe128	! t0_kref+0xcf8:   	flush	%o7 + 0x128
	.word	0x9ba5892c	! t0_kref+0xcfc:   	fmuls	%f22, %f12, %f13
	.word	0xa6648017	! t0_kref+0xd00:   	subc	%l2, %l7, %l3
	.word	0xe6063ffc	! t0_kref+0xd04:   	ld	[%i0 - 4], %l3
	.word	0x97a58831	! t0_kref+0xd08:   	fadds	%f22, %f17, %f11
	.word	0x97a30929	! t0_kref+0xd0c:   	fmuls	%f12, %f9, %f11
	.word	0xabc1401c	! t0_kref+0xd10:   	jmpl	%g5 + %i4, %l5
	.word	0x95a0192c	! t0_kref+0xd14:   	fstod	%f12, %f10
	.word	0x9da0190b	! t0_kref+0xd18:   	fitod	%f11, %f14
	.word	0xe7801019	! t0_kref+0xd1c:   	lda	[%g0 + %i1]0x80, %f19
	.word	0xa7a000b4	! t0_kref+0xd20:   	fnegs	%f20, %f19
	.word	0xaa2b7d75	! t0_kref+0xd24:   	andn	%o5, -0x28b, %l5
2:	.word	0x9ba00529	! t0_kref+0xd28:   	fsqrts	%f9, %f13
	.word	0xeb066000	! t0_kref+0xd2c:   	ld	[%i1], %f21
	.word	0xab3dc000	! t0_kref+0xd30:   	sra	%l7, %g0, %l5
	.word	0xe6861000	! t0_kref+0xd34:   	lda	[%i0]0x80, %l3
	.word	0xa2aec008	! t0_kref+0xd38:   	andncc	%i3, %o0, %l1
	.word	0xa025b180	! t0_kref+0xd3c:   	sub	%l6, -0xe80, %l0
	.word	0xa9a00529	! t0_kref+0xd40:   	fsqrts	%f9, %f20
	.word	0xa89d7f1d	! t0_kref+0xd44:   	xorcc	%l5, -0xe3, %l4
	.word	0xa7408000	! t0_kref+0xd48:   	mov	%ccr, %l3
	.word	0xd9bf1a59	! t0_kref+0xd4c:   	stda	%f12, [%i4 + %i1]0xd2
	.word	0xa5418000	! t0_kref+0xd50:   	mov	%fprs, %l2
	.word	0x2b480007	! t0_kref+0xd54:   	fbug,a,pt	%fcc0, _kref+0xd70
	.word	0xa9a4882d	! t0_kref+0xd58:   	fadds	%f18, %f13, %f20
	.word	0xaaf68010	! t0_kref+0xd5c:   	udivcc	%i2, %l0, %l5
	.word	0xaa2eeb31	! t0_kref+0xd60:   	andn	%i3, 0xb31, %l5
	.word	0x34800006	! t0_kref+0xd64:   	bg,a	_kref+0xd7c
	.word	0xfbee101d	! t0_kref+0xd68:   	prefetcha	%i0 + %i5, 29
	.word	0xa9400000	! t0_kref+0xd6c:   	mov	%y, %l4
	.word	0x9fa00533	! t0_kref+0xd70:   	fsqrts	%f19, %f15
	.word	0x20480003	! t0_kref+0xd74:   	bn,a,pt	%icc, _kref+0xd80
	.word	0xa32525d6	! t0_kref+0xd78:   	mulscc	%l4, 0x5d6, %l1
	.word	0x81ab8a52	! t0_kref+0xd7c:   	fcmpd	%fcc0, %f14, %f18
	.word	0xa42ec00a	! t0_kref+0xd80:   	andn	%i3, %o2, %l2
	.word	0xa1a0188b	! t0_kref+0xd84:   	fitos	%f11, %f16
	.word	0xe2070018	! t0_kref+0xd88:   	ld	[%i4 + %i0], %l1
	.word	0x99a000b2	! t0_kref+0xd8c:   	fnegs	%f18, %f12
	.word	0xe840a014	! t0_kref+0xd90:   	ldsw	[%g2 + 0x14], %l4
	.word	0xc12e3fe0	! t0_kref+0xd94:   	st	%fsr, [%i0 - 0x20]
	.word	0x9da00529	! t0_kref+0xd98:   	fsqrts	%f9, %f14
	.word	0x81aa0aaa	! t0_kref+0xd9c:   	fcmpes	%fcc0, %f8, %f10
	.word	0xa065667a	! t0_kref+0xda0:   	subc	%l5, 0x67a, %l0
	.word	0xa07c0016	! t0_kref+0xda4:   	sdiv	%l0, %l6, %l0
	.word	0xe016c019	! t0_kref+0xda8:   	lduh	[%i3 + %i1], %l0
	.word	0xd4ae1000	! t0_kref+0xdac:   	stba	%o2, [%i0]0x80
	.word	0xea10a032	! t0_kref+0xdb0:   	lduh	[%g2 + 0x32], %l5
	.word	0xa3a00034	! t0_kref+0xdb4:   	fmovs	%f20, %f17
	.word	0x9fa40934	! t0_kref+0xdb8:   	fmuls	%f16, %f20, %f15
	.word	0x81acca35	! t0_kref+0xdbc:   	fcmps	%fcc0, %f19, %f21
	.word	0xe19f1a58	! t0_kref+0xdc0:   	ldda	[%i4 + %i0]0xd2, %f16
	.word	0xa4adade9	! t0_kref+0xdc4:   	andncc	%l6, 0xde9, %l2
	.word	0x81ac0a33	! t0_kref+0xdc8:   	fcmps	%fcc0, %f16, %f19
	.word	0xa6bb3a9a	! t0_kref+0xdcc:   	xnorcc	%o4, -0x566, %l3
	.word	0xa73dc010	! t0_kref+0xdd0:   	sra	%l7, %l0, %l3
	.word	0xf430a014	! t0_kref+0xdd4:   	sth	%i2, [%g2 + 0x14]
	.word	0x95a00532	! t0_kref+0xdd8:   	fsqrts	%f18, %f10
	.word	0x2136992d	! t0_kref+0xddc:   	sethi	%hi(0xda64b400), %l0
	.word	0x93a0052b	! t0_kref+0xde0:   	fsqrts	%f11, %f9
	.word	0x32800006	! t0_kref+0xde4:   	bne,a	_kref+0xdfc
	.word	0xa8d20009	! t0_kref+0xde8:   	umulcc	%o0, %o1, %l4
	.word	0xe9ee501d	! t0_kref+0xdec:   	prefetcha	%i1 + %i5, 20
	.word	0xa4da4000	! t0_kref+0xdf0:   	smulcc	%o1, %g0, %l2
	.word	0xa32d600c	! t0_kref+0xdf4:   	sll	%l5, 0xc, %l1
	.word	0xe056c019	! t0_kref+0xdf8:   	ldsh	[%i3 + %i1], %l0
	.word	0xa5a309d0	! t0_kref+0xdfc:   	fdivd	%f12, %f16, %f18
	.word	0xa93dc014	! t0_kref+0xe00:   	sra	%l7, %l4, %l4
	.word	0xaa7221dc	! t0_kref+0xe04:   	udiv	%o0, 0x1dc, %l5
	.word	0xa5a3cd2d	! t0_kref+0xe08:   	fsmuld	%f15, %f13, %f18
	.word	0xa665c00c	! t0_kref+0xe0c:   	subc	%l7, %o4, %l3
	.word	0xa664c015	! t0_kref+0xe10:   	subc	%l3, %l5, %l3
	.word	0xe6100018	! t0_kref+0xe14:   	lduh	[%g0 + %i0], %l3
	.word	0xa05ce286	! t0_kref+0xe18:   	smul	%l3, 0x286, %l0
	.word	0xe1be180b	! t0_kref+0xe1c:   	stda	%f16, [%i0 + %o3]0xc0
	.word	0x9fa01893	! t0_kref+0xe20:   	fitos	%f19, %f15
	.word	0xd7a6101c	! t0_kref+0xe24:   	sta	%f11, [%i0 + %i4]0x80
	.word	0xc07e2008	! t0_kref+0xe28:   	swap	[%i0 + 8], %g0
	.word	0xe8162010	! t0_kref+0xe2c:   	lduh	[%i0 + 0x10], %l4
	.word	0xa12c8000	! t0_kref+0xe30:   	sll	%l2, %g0, %l0
	.word	0x8143e040	! t0_kref+0xe34:   	membar	0x40
	.word	0xa3a0012c	! t0_kref+0xe38:   	fabss	%f12, %f17
	.word	0xa3a000ac	! t0_kref+0xe3c:   	fnegs	%f12, %f17
	.word	0xe0167ff6	! t0_kref+0xe40:   	lduh	[%i1 - 0xa], %l0
	.word	0xea4e3fe6	! t0_kref+0xe44:   	ldsb	[%i0 - 0x1a], %l5
	.word	0xaa74c011	! t0_kref+0xe48:   	udiv	%l3, %l1, %l5
	.word	0xd7a65000	! t0_kref+0xe4c:   	sta	%f11, [%i1]0x80
	.word	0xa62d0014	! t0_kref+0xe50:   	andn	%l4, %l4, %l3
	.word	0x81dd8013	! t0_kref+0xe54:   	flush	%l6 + %l3
	.word	0x3a480006	! t0_kref+0xe58:   	bcc,a,pt	%icc, _kref+0xe70
	.word	0xdb067ff0	! t0_kref+0xe5c:   	ld	[%i1 - 0x10], %f13
	.word	0xa2e6c016	! t0_kref+0xe60:   	subccc	%i3, %l6, %l1
	.word	0x9da01931	! t0_kref+0xe64:   	fstod	%f17, %f14
	.word	0x81abca35	! t0_kref+0xe68:   	fcmps	%fcc0, %f15, %f21
	.word	0xa7a348aa	! t0_kref+0xe6c:   	fsubs	%f13, %f10, %f19
	.word	0x9da40832	! t0_kref+0xe70:   	fadds	%f16, %f18, %f14
	.word	0x3f480007	! t0_kref+0xe74:   	fbo,a,pt	%fcc0, _kref+0xe90
	.word	0xe5200019	! t0_kref+0xe78:   	st	%f18, [%g0 + %i1]
	.word	0xa5700017	! t0_kref+0xe7c:   	popc	%l7, %l2
	.word	0xa02dc013	! t0_kref+0xe80:   	andn	%l7, %l3, %l0
	.word	0xa2aaacca	! t0_kref+0xe84:   	andncc	%o2, 0xcca, %l1
	.word	0xa6d2801a	! t0_kref+0xe88:   	umulcc	%o2, %i2, %l3
	.word	0x20800008	! t0_kref+0xe8c:   	bn,a	_kref+0xeac
	.word	0xabc06c66	! t0_kref+0xe90:   	jmpl	%g1 + 0xc66, %l5
	.word	0xc0262014	! t0_kref+0xe94:   	clr	[%i0 + 0x14]
	.word	0xd99f5a18	! t0_kref+0xe98:   	ldda	[%i5 + %i0]0xd0, %f12
	.word	0xa00a8015	! t0_kref+0xe9c:   	and	%o2, %l5, %l0
	.word	0xa9702f62	! t0_kref+0xea0:   	popc	0xf62, %l4
	.word	0xab3c0011	! t0_kref+0xea4:   	sra	%l0, %l1, %l5
	.word	0xa5a01909	! t0_kref+0xea8:   	fitod	%f9, %f18
	.word	0xa6556186	! t0_kref+0xeac:   	umul	%l5, 0x186, %l3
	.word	0xd5262008	! t0_kref+0xeb0:   	st	%f10, [%i0 + 8]
	.word	0xe0564000	! t0_kref+0xeb4:   	ldsh	[%i1], %l0
	.word	0xe6560000	! t0_kref+0xeb8:   	ldsh	[%i0], %l3
	.word	0x3b480008	! t0_kref+0xebc:   	fble,a,pt	%fcc0, _kref+0xedc
	.word	0xc1ee5012	! t0_kref+0xec0:   	prefetcha	%i1 + %l2, 0
	.word	0x81800000	! t0_kref+0xec4:   	mov	%g0, %y
	.word	0xa660213c	! t0_kref+0xec8:   	subc	%g0, 0x13c, %l3
	.word	0x81dce75f	! t0_kref+0xecc:   	flush	%l3 + 0x75f
	.word	0xa662663f	! t0_kref+0xed0:   	subc	%o1, 0x63f, %l3
	.word	0xa53da013	! t0_kref+0xed4:   	sra	%l6, 0x13, %l2
	.word	0x91a0052f	! t0_kref+0xed8:   	fsqrts	%f15, %f8
	.word	0xa85aa038	! t0_kref+0xedc:   	smul	%o2, 0x38, %l4
	.word	0x2301deae	! t0_kref+0xee0:   	sethi	%hi(0x77ab800), %l1
	.word	0xa0ba8009	! t0_kref+0xee4:   	xnorcc	%o2, %o1, %l0
	.word	0xa2520013	! t0_kref+0xee8:   	umul	%o0, %l3, %l1
	.word	0xa03a401b	! t0_kref+0xeec:   	xnor	%o1, %i3, %l0
	.word	0xc398a040	! t0_kref+0xef0:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xe256c018	! t0_kref+0xef4:   	ldsh	[%i3 + %i0], %l1
	.word	0xeace9018	! t0_kref+0xef8:   	ldsba	[%i2 + %i0]0x80, %l5
	.word	0xaba01a2b	! t0_kref+0xefc:   	fstoi	%f11, %f21
	sethi	%hi(2f), %o7
	.word	0xe40be330	! t0_kref+0xf04:   	ldub	[%o7 + 0x330], %l2
	.word	0xa41ca00c	! t0_kref+0xf08:   	xor	%l2, 0xc, %l2
	.word	0xe42be330	! t0_kref+0xf0c:   	stb	%l2, [%o7 + 0x330]
	.word	0x81dbe330	! t0_kref+0xf10:   	flush	%o7 + 0x330
	.word	0xa7000016	! t0_kref+0xf14:   	taddcc	%g0, %l6, %l3
	.word	0x2e480004	! t0_kref+0xf18:   	bvs,a,pt	%icc, _kref+0xf28
	.word	0xc1ee500c	! t0_kref+0xf1c:   	prefetcha	%i1 + %o4, 0
	.word	0xaa64c017	! t0_kref+0xf20:   	subc	%l3, %l7, %l5
	.word	0xab0b401a	! t0_kref+0xf24:   	tsubcc	%o5, %i2, %l5
	.word	0xa2ba400d	! t0_kref+0xf28:   	xnorcc	%o1, %o5, %l1
	.word	0xa51d3abd	! t0_kref+0xf2c:   	tsubcctv	%l4, -0x543, %l2
2:	.word	0xe000a034	! t0_kref+0xf30:   	ld	[%g2 + 0x34], %l0
	.word	0xa6e6bf01	! t0_kref+0xf34:   	subccc	%i2, -0xff, %l3
	.word	0xc398a040	! t0_kref+0xf38:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa2a5800a	! t0_kref+0xf3c:   	subcc	%l6, %o2, %l1
	.word	0xa8d20008	! t0_kref+0xf40:   	umulcc	%o0, %o0, %l4
	.word	0xa0a82472	! t0_kref+0xf44:   	andncc	%g0, 0x472, %l0
	.word	0xe4380018	! t0_kref+0xf48:   	std	%l2, [%g0 + %i0]
	.word	0xf6262018	! t0_kref+0xf4c:   	st	%i3, [%i0 + 0x18]
	.word	0xaba4492d	! t0_kref+0xf50:   	fmuls	%f17, %f13, %f21
	.word	0xaad68011	! t0_kref+0xf54:   	umulcc	%i2, %l1, %l5
	.word	0x9fa0052c	! t0_kref+0xf58:   	fsqrts	%f12, %f15
	.word	0xa932e013	! t0_kref+0xf5c:   	srl	%o3, 0x13, %l4
	.word	0xe300a02c	! t0_kref+0xf60:   	ld	[%g2 + 0x2c], %f17
	.word	0x93a30830	! t0_kref+0xf64:   	fadds	%f12, %f16, %f9
	.word	0xf83e2000	! t0_kref+0xf68:   	std	%i4, [%i0]
	.word	0xe6a6501c	! t0_kref+0xf6c:   	sta	%l3, [%i1 + %i4]0x80
	.word	0x95ab8030	! t0_kref+0xf70:   	fmovsule	%fcc0, %f16, %f10
	.word	0x9da4084a	! t0_kref+0xf74:   	faddd	%f16, %f10, %f14
	.word	0xaba5882a	! t0_kref+0xf78:   	fadds	%f22, %f10, %f21
	.word	0xff6e2018	! t0_kref+0xf7c:   	prefetch	%i0 + 0x18, 31
	.word	0xa20db2bd	! t0_kref+0xf80:   	and	%l6, -0xd43, %l1
	.word	0xa2fca9c4	! t0_kref+0xf84:   	sdivcc	%l2, 0x9c4, %l1
	.word	0xe00e7fed	! t0_kref+0xf88:   	ldub	[%i1 - 0x13], %l0
	.word	0xa0f4a927	! t0_kref+0xf8c:   	udivcc	%l2, 0x927, %l0
	.word	0x858330f4	! t0_kref+0xf90:   	wr	%o4, 0xfffff0f4, %ccr
	.word	0xa87d4010	! t0_kref+0xf94:   	sdiv	%l5, %l0, %l4
	.word	0x81abca29	! t0_kref+0xf98:   	fcmps	%fcc0, %f15, %f9
	.word	0xe5070019	! t0_kref+0xf9c:   	ld	[%i4 + %i1], %f18
	.word	0xe8263fec	! t0_kref+0xfa0:   	st	%l4, [%i0 - 0x14]
	.word	0xa69aa249	! t0_kref+0xfa4:   	xorcc	%o2, 0x249, %l3
	.word	0x81accab2	! t0_kref+0xfa8:   	fcmpes	%fcc0, %f19, %f18
	.word	0x81ab8ab3	! t0_kref+0xfac:   	fcmpes	%fcc0, %f14, %f19
	.word	0xaba000ac	! t0_kref+0xfb0:   	fnegs	%f12, %f21
	.word	0xd6264000	! t0_kref+0xfb4:   	st	%o3, [%i1]
	.word	0x81da000c	! t0_kref+0xfb8:   	flush	%o0 + %o4
	.word	0xe06e6001	! t0_kref+0xfbc:   	ldstub	[%i1 + 1], %l0
	.word	0xa33ea002	! t0_kref+0xfc0:   	sra	%i2, 0x2, %l1
	.word	0x9da209ca	! t0_kref+0xfc4:   	fdivd	%f8, %f10, %f14
	.word	0x95a40935	! t0_kref+0xfc8:   	fmuls	%f16, %f21, %f10
	.word	0xd526001c	! t0_kref+0xfcc:   	st	%f10, [%i0 + %i4]
	.word	0x32480008	! t0_kref+0xfd0:   	bne,a,pt	%icc, _kref+0xff0
	.word	0xc807bff0	! t0_kref+0xfd4:   	ld	[%fp - 0x10], %g4
	.word	0x81dd6793	! t0_kref+0xfd8:   	flush	%l5 + 0x793
	.word	0xe056c019	! t0_kref+0xfdc:   	ldsh	[%i3 + %i1], %l0
	.word	0x25480003	! t0_kref+0xfe0:   	fblg,a,pt	%fcc0, _kref+0xfec
	.word	0xd51fbc70	! t0_kref+0xfe4:   	ldd	[%fp - 0x390], %f10
	.word	0xe028a017	! t0_kref+0xfe8:   	stb	%l0, [%g2 + 0x17]
	.word	0xab350009	! t0_kref+0xfec:   	srl	%l4, %o1, %l5
	.word	0xa9a0192c	! t0_kref+0xff0:   	fstod	%f12, %f20
	.word	0xec263ff4	! t0_kref+0xff4:   	st	%l6, [%i0 - 0xc]
	.word	0xab400000	! t0_kref+0xff8:   	mov	%y, %l5
	.word	0x95a01a48	! t0_kref+0xffc:   	fdtoi	%f8, %f10
	.word	0xd3266010	! t0_kref+0x1000:   	st	%f9, [%i1 + 0x10]
	.word	0xa5a01914	! t0_kref+0x1004:   	fitod	%f20, %f18
	.word	0xe0070018	! t0_kref+0x1008:   	ld	[%i4 + %i0], %l0
	.word	0x99a0192a	! t0_kref+0x100c:   	fstod	%f10, %f12
	.word	0xa60a6c77	! t0_kref+0x1010:   	and	%o1, 0xc77, %l3
	.word	0xeb6e2018	! t0_kref+0x1014:   	prefetch	%i0 + 0x18, 21
	.word	0x24480002	! t0_kref+0x1018:   	ble,a,pt	%icc, _kref+0x1020
	.word	0xa60a2a41	! t0_kref+0x101c:   	and	%o0, 0xa41, %l3
	.word	0x81dfa3bb	! t0_kref+0x1020:   	flush	%fp + 0x3bb
	.word	0x26800002	! t0_kref+0x1024:   	bl,a	_kref+0x102c
	.word	0xee6e7fe1	! t0_kref+0x1028:   	ldstub	[%i1 - 0x1f], %l7
	.word	0xe6480018	! t0_kref+0x102c:   	ldsb	[%g0 + %i0], %l3
	.word	0xea066014	! t0_kref+0x1030:   	ld	[%i1 + 0x14], %l5
	.word	0xa424800d	! t0_kref+0x1034:   	sub	%l2, %o5, %l2
	.word	0x9ba000ac	! t0_kref+0x1038:   	fnegs	%f12, %f13
	.word	0xada000b5	! t0_kref+0x103c:   	fnegs	%f21, %f22
	.word	0xa1a01933	! t0_kref+0x1040:   	fstod	%f19, %f16
	.word	0x99a01a33	! t0_kref+0x1044:   	fstoi	%f19, %f12
	.word	0xa8de800c	! t0_kref+0x1048:   	smulcc	%i2, %o4, %l4
	.word	0x26800008	! t0_kref+0x104c:   	bl,a	_kref+0x106c
	.word	0xa1a489ad	! t0_kref+0x1050:   	fdivs	%f18, %f13, %f16
	.word	0x27480005	! t0_kref+0x1054:   	fbul,a,pt	%fcc0, _kref+0x1068
	.word	0xab23400b	! t0_kref+0x1058:   	mulscc	%o5, %o3, %l5
	.word	0xa093001a	! t0_kref+0x105c:   	orcc	%o4, %i2, %l0
	.word	0xa0537732	! t0_kref+0x1060:   	umul	%o5, -0x8ce, %l0
	.word	0xa69ef09e	! t0_kref+0x1064:   	xorcc	%i3, -0xf62, %l3
	.word	0x3b480007	! t0_kref+0x1068:   	fble,a,pt	%fcc0, _kref+0x1084
	.word	0xa7a00533	! t0_kref+0x106c:   	fsqrts	%f19, %f19
	.word	0xa33b6015	! t0_kref+0x1070:   	sra	%o5, 0x15, %l1
	.word	0xa272000b	! t0_kref+0x1074:   	udiv	%o0, %o3, %l1
	.word	0xa00ac008	! t0_kref+0x1078:   	and	%o3, %o0, %l0
	.word	0xa1a00532	! t0_kref+0x107c:   	fsqrts	%f18, %f16
	.word	0xe86e3fec	! t0_kref+0x1080:   	ldstub	[%i0 - 0x14], %l4
	.word	0x81ad8a2c	! t0_kref+0x1084:   	fcmps	%fcc0, %f22, %f12
	.word	0x2f480003	! t0_kref+0x1088:   	fbu,a,pt	%fcc0, _kref+0x1094
	.word	0xa8950000	! t0_kref+0x108c:   	orcc	%l4, %g0, %l4
	.word	0xe4067fe8	! t0_kref+0x1090:   	ld	[%i1 - 0x18], %l2
	.word	0xe8500018	! t0_kref+0x1094:   	ldsh	[%g0 + %i0], %l4
	.word	0x2e480002	! t0_kref+0x1098:   	bvs,a,pt	%icc, _kref+0x10a0
	.word	0xa7400000	! t0_kref+0x109c:   	mov	%y, %l3
	.word	0xaba50935	! t0_kref+0x10a0:   	fmuls	%f20, %f21, %f21
	.word	0xaaf2c000	! t0_kref+0x10a4:   	udivcc	%o3, %g0, %l5
	.word	0xc07f0005	! t0_kref+0x10a8:   	swap	[%i4 + %g5], %g0
	.word	0xe4086628	! t0_kref+0x10ac:   	ldub	[%g1 + 0x628], %l2
	.word	0xa41ca00c	! t0_kref+0x10b0:   	xor	%l2, 0xc, %l2
	.word	0xe4286628	! t0_kref+0x10b4:   	stb	%l2, [%g1 + 0x628]
	.word	0x81d86628	! t0_kref+0x10b8:   	flush	%g1 + 0x628
	.word	0x9ba348ab	! t0_kref+0x10bc:   	fsubs	%f13, %f11, %f13
	.word	0x9fa00534	! t0_kref+0x10c0:   	fsqrts	%f20, %f15
2:	.word	0xa2934013	! t0_kref+0x10c4:   	orcc	%o5, %l3, %l1
	.word	0xe4086648	! t0_kref+0x10c8:   	ldub	[%g1 + 0x648], %l2
	.word	0xa41ca00c	! t0_kref+0x10cc:   	xor	%l2, 0xc, %l2
	.word	0xe4286648	! t0_kref+0x10d0:   	stb	%l2, [%g1 + 0x648]
	.word	0x81d86648	! t0_kref+0x10d4:   	flush	%g1 + 0x648
	.word	0xa254000b	! t0_kref+0x10d8:   	umul	%l0, %o3, %l1
	.word	0x91aac035	! t0_kref+0x10dc:   	fmovsge	%fcc0, %f21, %f8
	.word	0xaa94af0c	! t0_kref+0x10e0:   	orcc	%l2, 0xf0c, %l5
2:	.word	0x230deda6	! t0_kref+0x10e4:   	sethi	%hi(0x37b69800), %l1
	.word	0xa6a5000b	! t0_kref+0x10e8:   	subcc	%l4, %o3, %l3
	.word	0x9da508b6	! t0_kref+0x10ec:   	fsubs	%f20, %f22, %f14
	.word	0x91a3082d	! t0_kref+0x10f0:   	fadds	%f12, %f13, %f8
	.word	0xd6270019	! t0_kref+0x10f4:   	st	%o3, [%i4 + %i1]
	.word	0xa53a401a	! t0_kref+0x10f8:   	sra	%o1, %i2, %l2
	.word	0xaa634009	! t0_kref+0x10fc:   	subc	%o5, %o1, %l5
	.word	0xa0202bcc	! t0_kref+0x1100:   	sub	%g0, 0xbcc, %l0
	.word	0xa40cc01a	! t0_kref+0x1104:   	and	%l3, %i2, %l2
	.word	0x9da01928	! t0_kref+0x1108:   	fstod	%f8, %f14
	.word	0x81ac0a50	! t0_kref+0x110c:   	fcmpd	%fcc0, %f16, %f16
	.word	0xa2903c20	! t0_kref+0x1110:   	orcc	%g0, -0x3e0, %l1
	.word	0xa5a508d0	! t0_kref+0x1114:   	fsubd	%f20, %f16, %f18
	.word	0x81ad4aaf	! t0_kref+0x1118:   	fcmpes	%fcc0, %f21, %f15
	.word	0xaa65f1fe	! t0_kref+0x111c:   	subc	%l7, -0xe02, %l5
	.word	0xe4070018	! t0_kref+0x1120:   	ld	[%i4 + %i0], %l2
	.word	0xada3cd28	! t0_kref+0x1124:   	fsmuld	%f15, %f8, %f22
	.word	0x95a48930	! t0_kref+0x1128:   	fmuls	%f18, %f16, %f10
	.word	0x97a0052f	! t0_kref+0x112c:   	fsqrts	%f15, %f11
	.word	0x81ab0a4c	! t0_kref+0x1130:   	fcmpd	%fcc0, %f12, %f12
	.word	0xa2b30017	! t0_kref+0x1134:   	orncc	%o4, %l7, %l1
	.word	0x21480006	! t0_kref+0x1138:   	fbn,a,pt	%fcc0, _kref+0x1150
	.word	0xaa5ab46b	! t0_kref+0x113c:   	smul	%o2, -0xb95, %l5
	.word	0xc7ee100a	! t0_kref+0x1140:   	prefetcha	%i0 + %o2, 3
	.word	0xa09437fc	! t0_kref+0x1144:   	orcc	%l0, -0x804, %l0
	.word	0x3f480004	! t0_kref+0x1148:   	fbo,a,pt	%fcc0, _kref+0x1158
	.word	0x9da01933	! t0_kref+0x114c:   	fstod	%f19, %f14
	.word	0xaa5a8015	! t0_kref+0x1150:   	smul	%o2, %l5, %l5
	.word	0xa9a018d2	! t0_kref+0x1154:   	fdtos	%f18, %f20
	.word	0xa33ca004	! t0_kref+0x1158:   	sra	%l2, 0x4, %l1
	.word	0xa9a000d4	! t0_kref+0x115c:   	fnegd	%f20, %f20
	.word	0x29480002	! t0_kref+0x1160:   	fbl,a,pt	%fcc0, _kref+0x1168
	.word	0xd068a000	! t0_kref+0x1164:   	ldstub	[%g2], %o0
	.word	0xa91c400c	! t0_kref+0x1168:   	tsubcctv	%l1, %o4, %l4
	.word	0xa1a58d2d	! t0_kref+0x116c:   	fsmuld	%f22, %f13, %f16
	.word	0xa8d5acf1	! t0_kref+0x1170:   	umulcc	%l6, 0xcf1, %l4
	.word	0xda7e2014	! t0_kref+0x1174:   	swap	[%i0 + 0x14], %o5
	.word	0xa45c36dc	! t0_kref+0x1178:   	smul	%l0, -0x924, %l2
	.word	0xa422c014	! t0_kref+0x117c:   	sub	%o3, %l4, %l2
	.word	0xead81019	! t0_kref+0x1180:   	ldxa	[%g0 + %i1]0x80, %l5
	.word	0xe4df5018	! t0_kref+0x1184:   	ldxa	[%i5 + %i0]0x80, %l2
	.word	0x37480006	! t0_kref+0x1188:   	fbge,a,pt	%fcc0, _kref+0x11a0
	.word	0xaa74a5b7	! t0_kref+0x118c:   	udiv	%l2, 0x5b7, %l5
	.word	0xec20a02c	! t0_kref+0x1190:   	st	%l6, [%g2 + 0x2c]
	.word	0x93a0052e	! t0_kref+0x1194:   	fsqrts	%f14, %f9
	.word	0xef68a00a	! t0_kref+0x1198:   	prefetch	%g2 + 0xa, 23
	.word	0x91a01915	! t0_kref+0x119c:   	fitod	%f21, %f8
	.word	0xa6b4c014	! t0_kref+0x11a0:   	orncc	%l3, %l4, %l3
	.word	0x35480001	! t0_kref+0x11a4:   	fbue,a,pt	%fcc0, _kref+0x11a8
	.word	0xe0f65000	! t0_kref+0x11a8:   	stxa	%l0, [%i1]0x80
	.word	0x97a0052b	! t0_kref+0x11ac:   	fsqrts	%f11, %f11
	.word	0xe0160000	! t0_kref+0x11b0:   	lduh	[%i0], %l0
	.word	0x9de3bfa0	! t0_kref+0x11b4:   	save	%sp, -0x60, %sp
	.word	0xa1e80000	! t0_kref+0x11b8:   	restore	%g0, %g0, %l0
	.word	0x9da018d6	! t0_kref+0x11bc:   	fdtos	%f22, %f14
	.word	0xeaa6101c	! t0_kref+0x11c0:   	sta	%l5, [%i0 + %i4]0x80
	.word	0x211ab969	! t0_kref+0x11c4:   	sethi	%hi(0x6ae5a400), %l0
	.word	0x8610201a	! t0_kref+0x11c8:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0x11cc:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x11d0:   	be,a	_kref+0x1230
	.word	0xa072f040	! t0_kref+0x11d4:   	udiv	%o3, -0xfc0, %l0
	.word	0xe3b8a080	! t0_kref+0x11d8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe44e8019	! t0_kref+0x11dc:   	ldsb	[%i2 + %i1], %l2
	.word	0xa9400000	! t0_kref+0x11e0:   	mov	%y, %l4
	.word	0x9da38d29	! t0_kref+0x11e4:   	fsmuld	%f14, %f9, %f14
	.word	0xe100a024	! t0_kref+0x11e8:   	ld	[%g2 + 0x24], %f16
	call	SYM(t0_subr3)
	.word	0xe720a014	! t0_kref+0x11f0:   	st	%f19, [%g2 + 0x14]
	.word	0xa1a0102b	! t0_kref+0x11f4:   	fstox	%f11, %f16
	.word	0xa245401a	! t0_kref+0x11f8:   	addc	%l5, %i2, %l1
	.word	0xd630a03a	! t0_kref+0x11fc:   	sth	%o3, [%g2 + 0x3a]
	.word	0xe9b81019	! t0_kref+0x1200:   	stda	%f20, [%g0 + %i1]0x80
	.word	0xa9200011	! t0_kref+0x1204:   	mulscc	%g0, %l1, %l4
	.word	0xaaf2c000	! t0_kref+0x1208:   	udivcc	%o3, %g0, %l5
	.word	0xd2270018	! t0_kref+0x120c:   	st	%o1, [%i4 + %i0]
	.word	0xe8064000	! t0_kref+0x1210:   	ld	[%i1], %l4
	.word	0x81830000	! t0_kref+0x1214:   	wr	%o4, %g0, %y
	.word	0x81da0013	! t0_kref+0x1218:   	flush	%o0 + %l3
	.word	0x30480008	! t0_kref+0x121c:   	ba,a,pt	%icc, _kref+0x123c
	.word	0xa71b2a68	! t0_kref+0x1220:   	tsubcctv	%o4, 0xa68, %l3
	.word	0xe410a02e	! t0_kref+0x1224:   	lduh	[%g2 + 0x2e], %l2
	.word	0x91a01a48	! t0_kref+0x1228:   	fdtoi	%f8, %f8
	.word	0xe410a024	! t0_kref+0x122c:   	lduh	[%g2 + 0x24], %l2
	.word	0xab400000	! t0_kref+0x1230:   	mov	%y, %l5
	.word	0xc768a004	! t0_kref+0x1234:   	prefetch	%g2 + 4, 3
	.word	0xa2e4401a	! t0_kref+0x1238:   	subccc	%l1, %i2, %l1
	.word	0xe1ee101b	! t0_kref+0x123c:   	prefetcha	%i0 + %i3, 16
	.word	0x9fa01a4c	! t0_kref+0x1240:   	fdtoi	%f12, %f15
	.word	0xe0871018	! t0_kref+0x1244:   	lda	[%i4 + %i0]0x80, %l0
	.word	0xe968a081	! t0_kref+0x1248:   	prefetch	%g2 + 0x81, 20
	.word	0x32800005	! t0_kref+0x124c:   	bne,a	_kref+0x1260
	.word	0xed262018	! t0_kref+0x1250:   	st	%f22, [%i0 + 0x18]
	.word	0x9f414000	! t0_kref+0x1254:   	mov	%pc, %o7
	.word	0xe2ff1018	! t0_kref+0x1258:   	swapa	[%i4 + %i0]0x80, %l1
	.word	0xee28a029	! t0_kref+0x125c:   	stb	%l7, [%g2 + 0x29]
	.word	0xe8981019	! t0_kref+0x1260:   	ldda	[%g0 + %i1]0x80, %l4
	.word	0xa0e3401b	! t0_kref+0x1264:   	subccc	%o5, %i3, %l0
	.word	0xa5346002	! t0_kref+0x1268:   	srl	%l1, 0x2, %l2
	.word	0xd02e3fee	! t0_kref+0x126c:   	stb	%o0, [%i0 - 0x12]
	.word	0xa3a000b6	! t0_kref+0x1270:   	fnegs	%f22, %f17
	.word	0xf007bfe0	! t0_kref+0x1274:   	ld	[%fp - 0x20], %i0
	.word	0xe968a081	! t0_kref+0x1278:   	prefetch	%g2 + 0x81, 20
	.word	0xa035400d	! t0_kref+0x127c:   	orn	%l5, %o5, %l0
	.word	0xa2a30016	! t0_kref+0x1280:   	subcc	%o4, %l6, %l1
	.word	0xd906401c	! t0_kref+0x1284:   	ld	[%i1 + %i4], %f12
	.word	0xa2fb0008	! t0_kref+0x1288:   	sdivcc	%o4, %o0, %l1
	.word	0x83c06808	! t0_kref+0x128c:   	jmpl	%g1 + 0x808, %g1
	.word	0xe44e001a	! t0_kref+0x1290:   	ldsb	[%i0 + %i2], %l2
	.word	0xee20a020	! t0_kref+0x1294:   	st	%l7, [%g2 + 0x20]
	.word	0x97a01a30	! t0_kref+0x1298:   	fstoi	%f16, %f11
	.word	0xd1be580d	! t0_kref+0x129c:   	stda	%f8, [%i1 + %o5]0xc0
	.word	0x2c800002	! t0_kref+0x12a0:   	bneg,a	_kref+0x12a8
	.word	0xa9a0192a	! t0_kref+0x12a4:   	fstod	%f10, %f20
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xee28a014	! t0_kref+0x12b0:   	stb	%l7, [%g2 + 0x14]
	.word	0xa2434016	! t0_kref+0x12b4:   	addc	%o5, %l6, %l1
	.word	0x27480003	! t0_kref+0x12b8:   	fbul,a,pt	%fcc0, _kref+0x12c4
	.word	0x9fa00029	! t0_kref+0x12bc:   	fmovs	%f9, %f15
	.word	0x93a00531	! t0_kref+0x12c0:   	fsqrts	%f17, %f9
	.word	0xaa2a000c	! t0_kref+0x12c4:   	andn	%o0, %o4, %l5
1:	.word	0x95a01a2e	! t0_kref+0x12c8:   	fstoi	%f14, %f10
	.word	0xeb262014	! t0_kref+0x12cc:   	st	%f21, [%i0 + 0x14]
	.word	0xe9bf5a19	! t0_kref+0x12d0:   	stda	%f20, [%i5 + %i1]0xd0
	.word	0xda20a024	! t0_kref+0x12d4:   	st	%o5, [%g2 + 0x24]
	.word	0xa47ef98f	! t0_kref+0x12d8:   	sdiv	%i3, -0x671, %l2
	.word	0xa8b463b5	! t0_kref+0x12dc:   	orncc	%l1, 0x3b5, %l4
	.word	0xec20a028	! t0_kref+0x12e0:   	st	%l6, [%g2 + 0x28]
	.word	0xd9bf1a19	! t0_kref+0x12e4:   	stda	%f12, [%i4 + %i1]0xd0
	.word	0xa462f512	! t0_kref+0x12e8:   	subc	%o3, -0xaee, %l2
	.word	0x22800008	! t0_kref+0x12ec:   	be,a	_kref+0x130c
	.word	0xe440a028	! t0_kref+0x12f0:   	ldsw	[%g2 + 0x28], %l2
	.word	0xa2e6a5f1	! t0_kref+0x12f4:   	subccc	%i2, 0x5f1, %l1
	.word	0xab408000	! t0_kref+0x12f8:   	mov	%ccr, %l5
	.word	0xd87f0019	! t0_kref+0x12fc:   	swap	[%i4 + %i1], %o4
	.word	0x2f480002	! t0_kref+0x1300:   	fbu,a,pt	%fcc0, _kref+0x1308
	.word	0xa82a2f32	! t0_kref+0x1304:   	andn	%o0, 0xf32, %l4
	.word	0x28480005	! t0_kref+0x1308:   	bleu,a,pt	%icc, _kref+0x131c
	.word	0xe4100019	! t0_kref+0x130c:   	lduh	[%g0 + %i1], %l2
	.word	0xd0f01018	! t0_kref+0x1310:   	stxa	%o0, [%g0 + %i0]0x80
	.word	0xc9ee101a	! t0_kref+0x1314:   	prefetcha	%i0 + %i2, 4
	.word	0xc0262010	! t0_kref+0x1318:   	clr	[%i0 + 0x10]
	.word	0xa475a199	! t0_kref+0x131c:   	udiv	%l6, 0x199, %l2
	.word	0x81ad0a52	! t0_kref+0x1320:   	fcmpd	%fcc0, %f20, %f18
	.word	0xe56e401d	! t0_kref+0x1324:   	prefetch	%i1 + %i5, 18
	.word	0xa65a400b	! t0_kref+0x1328:   	smul	%o1, %o3, %l3
	.word	0xa1230008	! t0_kref+0x132c:   	mulscc	%o4, %o0, %l0
	.word	0x2d480007	! t0_kref+0x1330:   	fbg,a,pt	%fcc0, _kref+0x134c
	.word	0xea567ff0	! t0_kref+0x1334:   	ldsh	[%i1 - 0x10], %l5
	.word	0xa5400000	! t0_kref+0x1338:   	mov	%y, %l2
	.word	0x91a000cc	! t0_kref+0x133c:   	fnegd	%f12, %f8
	.word	0xa2b28000	! t0_kref+0x1340:   	orncc	%o2, %g0, %l1
	.word	0x81828000	! t0_kref+0x1344:   	wr	%o2, %g0, %y
	.word	0xea861000	! t0_kref+0x1348:   	lda	[%i0]0x80, %l5
	.word	0xa2500008	! t0_kref+0x134c:   	umul	%g0, %o0, %l1
	.word	0x99a00533	! t0_kref+0x1350:   	fsqrts	%f19, %f12
	.word	0xab400000	! t0_kref+0x1354:   	mov	%y, %l5
	.word	0xec1e3ff8	! t0_kref+0x1358:   	ldd	[%i0 - 8], %l6
	.word	0xe606600c	! t0_kref+0x135c:   	ld	[%i1 + 0xc], %l3
	.word	0xec9e101d	! t0_kref+0x1360:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0xa426c009	! t0_kref+0x1364:   	sub	%i3, %o1, %l2
	.word	0xa7400000	! t0_kref+0x1368:   	mov	%y, %l3
	.word	0xe816c018	! t0_kref+0x136c:   	lduh	[%i3 + %i0], %l4
	.word	0xa9354014	! t0_kref+0x1370:   	srl	%l5, %l4, %l4
	.word	0x99a30848	! t0_kref+0x1374:   	faddd	%f12, %f8, %f12
	.word	0xe616c018	! t0_kref+0x1378:   	lduh	[%i3 + %i0], %l3
	.word	0xec6e2007	! t0_kref+0x137c:   	ldstub	[%i0 + 7], %l6
	.word	0xaab4800d	! t0_kref+0x1380:   	orncc	%l2, %o5, %l5
	.word	0xe6070019	! t0_kref+0x1384:   	ld	[%i4 + %i1], %l3
	.word	0xa60ac015	! t0_kref+0x1388:   	and	%o3, %l5, %l3
	.word	0x3c480005	! t0_kref+0x138c:   	bpos,a,pt	%icc, _kref+0x13a0
	.word	0xf4380019	! t0_kref+0x1390:   	std	%i2, [%g0 + %i1]
	.word	0xaae68008	! t0_kref+0x1394:   	subccc	%i2, %o0, %l5
	.word	0xee2e7fff	! t0_kref+0x1398:   	stb	%l7, [%i1 - 1]
	.word	0xef6e3fe0	! t0_kref+0x139c:   	prefetch	%i0 - 0x20, 23
	.word	0xaba00536	! t0_kref+0x13a0:   	fsqrts	%f22, %f21
	.word	0xa02e8000	! t0_kref+0x13a4:   	andn	%i2, %g0, %l0
	.word	0x9da58d31	! t0_kref+0x13a8:   	fsmuld	%f22, %f17, %f14
	.word	0xa5a0052f	! t0_kref+0x13ac:   	fsqrts	%f15, %f18
	.word	0xe0063fe0	! t0_kref+0x13b0:   	ld	[%i0 - 0x20], %l0
	.word	0xed000019	! t0_kref+0x13b4:   	ld	[%g0 + %i1], %f22
	.word	0xe9be5a1d	! t0_kref+0x13b8:   	stda	%f20, [%i1 + %i5]0xd0
	.word	0x99a30833	! t0_kref+0x13bc:   	fadds	%f12, %f19, %f12
	.word	0x8182c000	! t0_kref+0x13c0:   	wr	%o3, %g0, %y
	sethi	%hi(2f), %o7
	.word	0xe40be000	! t0_kref+0x13c8:   	ldub	[%o7], %l2
	.word	0xa41ca00c	! t0_kref+0x13cc:   	xor	%l2, 0xc, %l2
	.word	0xe42be000	! t0_kref+0x13d0:   	stb	%l2, [%o7]
	.word	0x81dbe000	! t0_kref+0x13d4:   	flush	%o7
	.word	0xa0248014	! t0_kref+0x13d8:   	sub	%l2, %l4, %l0
	.word	0xab418000	! t0_kref+0x13dc:   	mov	%fprs, %l5
	.word	0x93a4c82a	! t0_kref+0x13e0:   	fadds	%f19, %f10, %f9
	.word	0x99a01a28	! t0_kref+0x13e4:   	fstoi	%f8, %f12
	.word	0xe2460000	! t0_kref+0x13e8:   	ldsw	[%i0], %l1
	.word	0x91a01a2a	! t0_kref+0x13ec:   	fstoi	%f10, %f8
	.word	0x9da0102a	! t0_kref+0x13f0:   	fstox	%f10, %f14
	.word	0x23480004	! t0_kref+0x13f4:   	fbne,a,pt	%fcc0, _kref+0x1404
	.word	0xa495800a	! t0_kref+0x13f8:   	orcc	%l6, %o2, %l2
	.word	0xa4d30015	! t0_kref+0x13fc:   	umulcc	%o4, %l5, %l2
2:	.word	0xa626fa55	! t0_kref+0x1400:   	sub	%i3, -0x5ab, %l3
	.word	0xa932201b	! t0_kref+0x1404:   	srl	%o0, 0x1b, %l4
	.word	0xd428a026	! t0_kref+0x1408:   	stb	%o2, [%g2 + 0x26]
	.word	0x35480005	! t0_kref+0x140c:   	fbue,a,pt	%fcc0, _kref+0x1420
	.word	0xa12d0016	! t0_kref+0x1410:   	sll	%l4, %l6, %l0
	.word	0xe606600c	! t0_kref+0x1414:   	ld	[%i1 + 0xc], %l3
	.word	0xa1232eba	! t0_kref+0x1418:   	mulscc	%o4, 0xeba, %l0
	.word	0x95a01a48	! t0_kref+0x141c:   	fdtoi	%f8, %f10
	.word	0xa22ac00c	! t0_kref+0x1420:   	andn	%o3, %o4, %l1
	.word	0xe1be185a	! t0_kref+0x1424:   	stda	%f16, [%i0 + %i2]0xc2
	.word	0xe3b8a080	! t0_kref+0x1428:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x3c480006	! t0_kref+0x142c:   	bpos,a,pt	%icc, _kref+0x1444
	.word	0xa416a1a5	! t0_kref+0x1430:   	or	%i2, 0x1a5, %l2
	.word	0x95a94035	! t0_kref+0x1434:   	fmovsug	%fcc0, %f21, %f10
	.word	0xab3e800b	! t0_kref+0x1438:   	sra	%i2, %o3, %l5
	.word	0x2b480003	! t0_kref+0x143c:   	fbug,a,pt	%fcc0, _kref+0x1448
	.word	0x9ba01a48	! t0_kref+0x1440:   	fdtoi	%f8, %f13
	.word	0x3d480003	! t0_kref+0x1444:   	fbule,a,pt	%fcc0, _kref+0x1450
	.word	0x2339b604	! t0_kref+0x1448:   	sethi	%hi(0xe6d81000), %l1
	.word	0x34800001	! t0_kref+0x144c:   	bg,a	_kref+0x1450
	.word	0xec180019	! t0_kref+0x1450:   	ldd	[%g0 + %i1], %l6
	.word	0xa1700010	! t0_kref+0x1454:   	popc	%l0, %l0
	.word	0x2c480007	! t0_kref+0x1458:   	bneg,a,pt	%icc, _kref+0x1474
	.word	0xa4340009	! t0_kref+0x145c:   	orn	%l0, %o1, %l2
	.word	0xe4100018	! t0_kref+0x1460:   	lduh	[%g0 + %i0], %l2
	.word	0xea7e7ff4	! t0_kref+0x1464:   	swap	[%i1 - 0xc], %l5
	.word	0xa2140011	! t0_kref+0x1468:   	or	%l0, %l1, %l1
	.word	0xe416401b	! t0_kref+0x146c:   	lduh	[%i1 + %i3], %l2
	.word	0xa094c00d	! t0_kref+0x1470:   	orcc	%l3, %o5, %l0
	.word	0xe168a009	! t0_kref+0x1474:   	prefetch	%g2 + 9, 16
	.word	0xd230a02a	! t0_kref+0x1478:   	sth	%o1, [%g2 + 0x2a]
	.word	0xa895c017	! t0_kref+0x147c:   	orcc	%l7, %l7, %l4
	.word	0xa53a6005	! t0_kref+0x1480:   	sra	%o1, 0x5, %l2
	.word	0xa6dd2644	! t0_kref+0x1484:   	smulcc	%l4, 0x644, %l3
	.word	0xa4d68011	! t0_kref+0x1488:   	umulcc	%i2, %l1, %l2
	.word	0x9ba0052c	! t0_kref+0x148c:   	fsqrts	%f12, %f13
	.word	0x91a3892e	! t0_kref+0x1490:   	fmuls	%f14, %f14, %f8
	.word	0xe02e6003	! t0_kref+0x1494:   	stb	%l0, [%i1 + 3]
	.word	0xe400a00c	! t0_kref+0x1498:   	ld	[%g2 + 0xc], %l2
	.word	0xfb6e001a	! t0_kref+0x149c:   	prefetch	%i0 + %i2, 29
	.word	0x95a0192f	! t0_kref+0x14a0:   	fstod	%f15, %f10
	.word	0x81ab0a28	! t0_kref+0x14a4:   	fcmps	%fcc0, %f12, %f8
	.word	0xc3ee5013	! t0_kref+0x14a8:   	prefetcha	%i1 + %l3, 1
	.word	0xe6167fea	! t0_kref+0x14ac:   	lduh	[%i1 - 0x16], %l3
	.word	0xa49b000a	! t0_kref+0x14b0:   	xorcc	%o4, %o2, %l2
	.word	0x91a018c8	! t0_kref+0x14b4:   	fdtos	%f8, %f8
	.word	0x26480008	! t0_kref+0x14b8:   	bl,a,pt	%icc, _kref+0x14d8
	.word	0xa2d28011	! t0_kref+0x14bc:   	umulcc	%o2, %l1, %l1
	.word	0xe016001b	! t0_kref+0x14c0:   	lduh	[%i0 + %i3], %l0
	.word	0x20800004	! t0_kref+0x14c4:   	bn,a	_kref+0x14d4
	.word	0xaae48017	! t0_kref+0x14c8:   	subccc	%l2, %l7, %l5
	.word	0xaa580013	! t0_kref+0x14cc:   	smul	%g0, %l3, %l5
	.word	0xd1be1813	! t0_kref+0x14d0:   	stda	%f8, [%i0 + %l3]0xc0
	.word	0x95a00128	! t0_kref+0x14d4:   	fabss	%f8, %f10
	.word	0xa5a01932	! t0_kref+0x14d8:   	fstod	%f18, %f18
	.word	0x29480002	! t0_kref+0x14dc:   	fbl,a,pt	%fcc0, _kref+0x14e4
	.word	0xa87232ae	! t0_kref+0x14e0:   	udiv	%o0, -0xd52, %l4
	.word	0xa93ca001	! t0_kref+0x14e4:   	sra	%l2, 0x1, %l4
	.word	0x001fffff	! t0_kref+0x14e8:   	illtrap	0x1fffff
	.word	0xe920a014	! t0_kref+0x14ec:   	st	%f20, [%g2 + 0x14]
	.word	0xe4167ff2	! t0_kref+0x14f0:   	lduh	[%i1 - 0xe], %l2
	.word	0x3e800001	! t0_kref+0x14f4:   	bvc,a	_kref+0x14f8
	.word	0xa8d5a814	! t0_kref+0x14f8:   	umulcc	%l6, 0x814, %l4
	.word	0xa0ab001b	! t0_kref+0x14fc:   	andncc	%o4, %i3, %l0
	.word	0x9fa01a52	! t0_kref+0x1500:   	fdtoi	%f18, %f15
	.word	0x95a508ae	! t0_kref+0x1504:   	fsubs	%f20, %f14, %f10
	.word	0xa4500016	! t0_kref+0x1508:   	umul	%g0, %l6, %l2
	.word	0xa0dcc00c	! t0_kref+0x150c:   	smulcc	%l3, %o4, %l0
	.word	0xa1a000c8	! t0_kref+0x1510:   	fnegd	%f8, %f16
	.word	0xe800a000	! t0_kref+0x1514:   	ld	[%g2], %l4
	.word	0xa662631c	! t0_kref+0x1518:   	subc	%o1, 0x31c, %l3
	.word	0xe96e2008	! t0_kref+0x151c:   	prefetch	%i0 + 8, 20
	.word	0xdf066010	! t0_kref+0x1520:   	ld	[%i1 + 0x10], %f15
	.word	0x34800001	! t0_kref+0x1524:   	bg,a	_kref+0x1528
	.word	0xd7063ff0	! t0_kref+0x1528:   	ld	[%i0 - 0x10], %f11
	.word	0xa09523c8	! t0_kref+0x152c:   	orcc	%l4, 0x3c8, %l0
	.word	0xa1a58935	! t0_kref+0x1530:   	fmuls	%f22, %f21, %f16
	.word	0x81580000	! t0_kref+0x1534:   	flushw
	.word	0xa9a4084c	! t0_kref+0x1538:   	faddd	%f16, %f12, %f20
	.word	0xe120a004	! t0_kref+0x153c:   	st	%f16, [%g2 + 4]
	.word	0xab33600d	! t0_kref+0x1540:   	srl	%o5, 0xd, %l5
	.word	0xea6e3fe9	! t0_kref+0x1544:   	ldstub	[%i0 - 0x17], %l5
	.word	0xaba01a32	! t0_kref+0x1548:   	fstoi	%f18, %f21
	.word	0xe2100018	! t0_kref+0x154c:   	lduh	[%g0 + %i0], %l1
	.word	0x253ae665	! t0_kref+0x1550:   	sethi	%hi(0xeb999400), %l2
	.word	0xa4953d85	! t0_kref+0x1554:   	orcc	%l4, -0x27b, %l2
	.word	0xa274e559	! t0_kref+0x1558:   	udiv	%l3, 0x559, %l1
	.word	0xd428a036	! t0_kref+0x155c:   	stb	%o2, [%g2 + 0x36]
	.word	0xa0ac8010	! t0_kref+0x1560:   	andncc	%l2, %l0, %l0
	.word	0xaba4c929	! t0_kref+0x1564:   	fmuls	%f19, %f9, %f21
	.word	0xa6e6800a	! t0_kref+0x1568:   	subccc	%i2, %o2, %l3
	.word	0x24480001	! t0_kref+0x156c:   	ble,a,pt	%icc, _kref+0x1570
	.word	0xaba018cc	! t0_kref+0x1570:   	fdtos	%f12, %f21
	.word	0x81820000	! t0_kref+0x1574:   	wr	%o0, %g0, %y
	.word	0xda6e3fec	! t0_kref+0x1578:   	ldstub	[%i0 - 0x14], %o5
	.word	0xdf263ff0	! t0_kref+0x157c:   	st	%f15, [%i0 - 0x10]
	.word	0xe840a010	! t0_kref+0x1580:   	ldsw	[%g2 + 0x10], %l4
	.word	0xe3b8a080	! t0_kref+0x1584:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa40e800d	! t0_kref+0x1588:   	and	%i2, %o5, %l2
	.word	0x2e800008	! t0_kref+0x158c:   	bvs,a	_kref+0x15ac
	.word	0xa7400000	! t0_kref+0x1590:   	mov	%y, %l3
	.word	0xe2560000	! t0_kref+0x1594:   	ldsh	[%i0], %l1
	.word	0xa244c00c	! t0_kref+0x1598:   	addc	%l3, %o4, %l1
	.word	0x24480002	! t0_kref+0x159c:   	ble,a,pt	%icc, _kref+0x15a4
	.word	0xa4ad4011	! t0_kref+0x15a0:   	andncc	%l5, %l1, %l2
	.word	0xa01c7be0	! t0_kref+0x15a4:   	xor	%l1, -0x420, %l0
	.word	0xd220a010	! t0_kref+0x15a8:   	st	%o1, [%g2 + 0x10]
	.word	0xe03e2000	! t0_kref+0x15ac:   	std	%l0, [%i0]
	.word	0xaa3ce8c8	! t0_kref+0x15b0:   	xnor	%l3, 0x8c8, %l5
	.word	0xa1a01929	! t0_kref+0x15b4:   	fstod	%f9, %f16
	.word	0xc1ee100a	! t0_kref+0x15b8:   	prefetcha	%i0 + %o2, 0
	.word	0xa2bdbdcb	! t0_kref+0x15bc:   	xnorcc	%l6, -0x235, %l1
	.word	0x93a01092	! t0_kref+0x15c0:   	fxtos	%f18, %f9
	.word	0x99a2cd2a	! t0_kref+0x15c4:   	fsmuld	%f11, %f10, %f12
	.word	0x24480007	! t0_kref+0x15c8:   	ble,a,pt	%icc, _kref+0x15e4
	.word	0xab400000	! t0_kref+0x15cc:   	mov	%y, %l5
	.word	0x81acca2a	! t0_kref+0x15d0:   	fcmps	%fcc0, %f19, %f10
	.word	0xa52b001a	! t0_kref+0x15d4:   	sll	%o4, %i2, %l2
	.word	0xd4ee9019	! t0_kref+0x15d8:   	ldstuba	[%i2 + %i1]0x80, %o2
	.word	0xec30a00c	! t0_kref+0x15dc:   	sth	%l6, [%g2 + 0xc]
	.word	0xa5a000d4	! t0_kref+0x15e0:   	fnegd	%f20, %f18
	.word	0xa6b53501	! t0_kref+0x15e4:   	orncc	%l4, -0xaff, %l3
	.word	0xc0200018	! t0_kref+0x15e8:   	clr	[%g0 + %i0]
	.word	0xc0ff1018	! t0_kref+0x15ec:   	swapa	[%i4 + %i0]0x80, %g0
	.word	0xea7e7ffc	! t0_kref+0x15f0:   	swap	[%i1 - 4], %l5
	.word	0xa7a01a50	! t0_kref+0x15f4:   	fdtoi	%f16, %f19
	.word	0xaa644011	! t0_kref+0x15f8:   	subc	%l1, %l1, %l5
	.word	0xaa6428f8	! t0_kref+0x15fc:   	subc	%l0, 0x8f8, %l5
	.word	0xc96e2008	! t0_kref+0x1600:   	prefetch	%i0 + 8, 4
	.word	0xe656c019	! t0_kref+0x1604:   	ldsh	[%i3 + %i1], %l3
	.word	0xe9be5888	! t0_kref+0x1608:   	stda	%f20, [%i1 + %o0]0xc4
	.word	0xd8263ffc	! t0_kref+0x160c:   	st	%o4, [%i0 - 4]
	.word	0xa71b28fe	! t0_kref+0x1610:   	tsubcctv	%o4, 0x8fe, %l3
	.word	0x99a01a50	! t0_kref+0x1614:   	fdtoi	%f16, %f12
	.word	0x9da000ce	! t0_kref+0x1618:   	fnegd	%f14, %f14
	.word	0xa533601d	! t0_kref+0x161c:   	srl	%o5, 0x1d, %l2
	.word	0x3a480004	! t0_kref+0x1620:   	bcc,a,pt	%icc, _kref+0x1630
	.word	0xa32ae01f	! t0_kref+0x1624:   	sll	%o3, 0x1f, %l1
	.word	0xe93e3ff0	! t0_kref+0x1628:   	std	%f20, [%i0 - 0x10]
	.word	0xa9a38d29	! t0_kref+0x162c:   	fsmuld	%f14, %f9, %f20
	.word	0xa8243bcd	! t0_kref+0x1630:   	sub	%l0, -0x433, %l4
	.word	0xf3ee101b	! t0_kref+0x1634:   	prefetcha	%i0 + %i3, 25
	.word	0xd2e81018	! t0_kref+0x1638:   	ldstuba	[%g0 + %i0]0x80, %o1
	.word	0xa80c0011	! t0_kref+0x163c:   	and	%l0, %l1, %l4
	.word	0x9ba000aa	! t0_kref+0x1640:   	fnegs	%f10, %f13
	.word	0x32480001	! t0_kref+0x1644:   	bne,a,pt	%icc, _kref+0x1648
	.word	0xa42dad6f	! t0_kref+0x1648:   	andn	%l6, 0xd6f, %l2
	.word	0x95a01092	! t0_kref+0x164c:   	fxtos	%f18, %f10
	.word	0x39480008	! t0_kref+0x1650:   	fbuge,a,pt	%fcc0, _kref+0x1670
	.word	0x97a489af	! t0_kref+0x1654:   	fdivs	%f18, %f15, %f11
	.word	0xe8500019	! t0_kref+0x1658:   	ldsh	[%g0 + %i1], %l4
	.word	0xa612c01a	! t0_kref+0x165c:   	or	%o3, %i2, %l3
	.word	0xe6901018	! t0_kref+0x1660:   	lduha	[%g0 + %i0]0x80, %l3
	.word	0x29480005	! t0_kref+0x1664:   	fbl,a,pt	%fcc0, _kref+0x1678
	.word	0xa2256515	! t0_kref+0x1668:   	sub	%l5, 0x515, %l1
	.word	0xc16e000d	! t0_kref+0x166c:   	prefetch	%i0 + %o5, 0
	.word	0xe900a034	! t0_kref+0x1670:   	ld	[%g2 + 0x34], %f20
	.word	0xe0000019	! t0_kref+0x1674:   	ld	[%g0 + %i1], %l0
	.word	0xab400000	! t0_kref+0x1678:   	mov	%y, %l5
	.word	0x3c800005	! t0_kref+0x167c:   	bpos,a	_kref+0x1690
	.word	0xa1232c13	! t0_kref+0x1680:   	mulscc	%o4, 0xc13, %l0
	.word	0xe26e601b	! t0_kref+0x1684:   	ldstub	[%i1 + 0x1b], %l1
	.word	0x20800007	! t0_kref+0x1688:   	bn,a	_kref+0x16a4
	.word	0xa8a4c00c	! t0_kref+0x168c:   	subcc	%l3, %o4, %l4
	.word	0x8182c000	! t0_kref+0x1690:   	wr	%o3, %g0, %y
	.word	0xa1a24d2d	! t0_kref+0x1694:   	fsmuld	%f9, %f13, %f16
	.word	0xa895801b	! t0_kref+0x1698:   	orcc	%l6, %i3, %l4
	.word	0xa2e2bc83	! t0_kref+0x169c:   	subccc	%o2, -0x37d, %l1
	.word	0xdd00a03c	! t0_kref+0x16a0:   	ld	[%g2 + 0x3c], %f14
	.word	0xa0924017	! t0_kref+0x16a4:   	orcc	%o1, %l7, %l0
	.word	0xa7a28831	! t0_kref+0x16a8:   	fadds	%f10, %f17, %f19
	.word	0x2a480001	! t0_kref+0x16ac:   	bcs,a,pt	%icc, _kref+0x16b0
	.word	0xaa22ed12	! t0_kref+0x16b0:   	sub	%o3, 0xd12, %l5
	.word	0xc96e400b	! t0_kref+0x16b4:   	prefetch	%i1 + %o3, 4
	.word	0xa42d800c	! t0_kref+0x16b8:   	andn	%l6, %o4, %l2
	.word	0x91a509d6	! t0_kref+0x16bc:   	fdivd	%f20, %f22, %f8
	.word	0x81ad4aad	! t0_kref+0x16c0:   	fcmpes	%fcc0, %f21, %f13
	.word	0x95a000b1	! t0_kref+0x16c4:   	fnegs	%f17, %f10
	.word	0xc3ee5011	! t0_kref+0x16c8:   	prefetcha	%i1 + %l1, 1
	.word	0xed871019	! t0_kref+0x16cc:   	lda	[%i4 + %i1]0x80, %f22
	.word	0x2c480005	! t0_kref+0x16d0:   	bneg,a,pt	%icc, _kref+0x16e4
	.word	0xe448a039	! t0_kref+0x16d4:   	ldsb	[%g2 + 0x39], %l2
	.word	0xa2d6c00c	! t0_kref+0x16d8:   	umulcc	%i3, %o4, %l1
	.word	0xf16e7ff0	! t0_kref+0x16dc:   	prefetch	%i1 - 0x10, 24
	.word	0xa0240009	! t0_kref+0x16e0:   	sub	%l0, %o1, %l0
	.word	0x9da308b1	! t0_kref+0x16e4:   	fsubs	%f12, %f17, %f14
	call	SYM(t0_subr3)
	.word	0xaa5b4017	! t0_kref+0x16ec:   	smul	%o5, %l7, %l5
	.word	0x9de3bfa0	! t0_kref+0x16f0:   	save	%sp, -0x60, %sp
	.word	0xb6172a26	! t0_kref+0x16f4:   	or	%i4, 0xa26, %i3
	.word	0xa5ef3e8b	! t0_kref+0x16f8:   	restore	%i4, -0x175, %l2
	.word	0xa1a01916	! t0_kref+0x16fc:   	fitod	%f22, %f16
	.word	0xa5326009	! t0_kref+0x1700:   	srl	%o1, 0x9, %l2
	.word	0x9de3bfa0	! t0_kref+0x1704:   	save	%sp, -0x60, %sp
	.word	0xb446401c	! t0_kref+0x1708:   	addc	%i1, %i4, %i2
	.word	0xa7eeb51d	! t0_kref+0x170c:   	restore	%i2, -0xae3, %l3
	.word	0xab2e8008	! t0_kref+0x1710:   	sll	%i2, %o0, %l5
	.word	0xe7262008	! t0_kref+0x1714:   	st	%f19, [%i0 + 8]
	.word	0xfdee101a	! t0_kref+0x1718:   	prefetcha	%i0 + %i2, 30
	.word	0xa9400000	! t0_kref+0x171c:   	mov	%y, %l4
	.word	0x81ab8a52	! t0_kref+0x1720:   	fcmpd	%fcc0, %f14, %f18
	.word	0xeb070018	! t0_kref+0x1724:   	ld	[%i4 + %i0], %f21
	.word	0xf630a00c	! t0_kref+0x1728:   	sth	%i3, [%g2 + 0xc]
	.word	0xd720a018	! t0_kref+0x172c:   	st	%f11, [%g2 + 0x18]
	.word	0xe210a02e	! t0_kref+0x1730:   	lduh	[%g2 + 0x2e], %l1
	.word	0xea7e7ff0	! t0_kref+0x1734:   	swap	[%i1 - 0x10], %l5
	.word	0x81ad4aab	! t0_kref+0x1738:   	fcmpes	%fcc0, %f21, %f11
	.word	0xa32a0010	! t0_kref+0x173c:   	sll	%o0, %l0, %l1
	.word	0x38800002	! t0_kref+0x1740:   	bgu,a	_kref+0x1748
	.word	0xf62e3ff6	! t0_kref+0x1744:   	stb	%i3, [%i0 - 0xa]
	.word	0xe99f1a19	! t0_kref+0x1748:   	ldda	[%i4 + %i1]0xd0, %f20
	.word	0xe0680018	! t0_kref+0x174c:   	ldstub	[%g0 + %i0], %l0
	.word	0xa60d4000	! t0_kref+0x1750:   	and	%l5, %g0, %l3
	.word	0xa20d8012	! t0_kref+0x1754:   	and	%l6, %l2, %l1
	.word	0xa53a2005	! t0_kref+0x1758:   	sra	%o0, 0x5, %l2
	.word	0xa092800c	! t0_kref+0x175c:   	orcc	%o2, %o4, %l0
	.word	0xe84e2010	! t0_kref+0x1760:   	ldsb	[%i0 + 0x10], %l4
	.word	0xa5a2c92d	! t0_kref+0x1764:   	fmuls	%f11, %f13, %f18
	.word	0xe64e6013	! t0_kref+0x1768:   	ldsb	[%i1 + 0x13], %l3
	.word	0x97a01a2c	! t0_kref+0x176c:   	fstoi	%f12, %f11
	.word	0xa236c017	! t0_kref+0x1770:   	orn	%i3, %l7, %l1
	.word	0x2b480002	! t0_kref+0x1774:   	fbug,a,pt	%fcc0, _kref+0x177c
	.word	0xaba00532	! t0_kref+0x1778:   	fsqrts	%f18, %f21
	.word	0xa1a54d32	! t0_kref+0x177c:   	fsmuld	%f21, %f18, %f16
	.word	0xe8162000	! t0_kref+0x1780:   	lduh	[%i0], %l4
	.word	0x91a01913	! t0_kref+0x1784:   	fitod	%f19, %f8
	.word	0xe08e9018	! t0_kref+0x1788:   	lduba	[%i2 + %i0]0x80, %l0
	.word	0xe416c018	! t0_kref+0x178c:   	lduh	[%i3 + %i0], %l2
	.word	0xe3b8a080	! t0_kref+0x1790:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe850a00c	! t0_kref+0x1794:   	ldsh	[%g2 + 0xc], %l4
	.word	0xa2f5801a	! t0_kref+0x1798:   	udivcc	%l6, %i2, %l1
	.word	0xe19e5a1a	! t0_kref+0x179c:   	ldda	[%i1 + %i2]0xd0, %f16
	.word	0x93a248ae	! t0_kref+0x17a0:   	fsubs	%f9, %f14, %f9
	.word	0xaaf4f23e	! t0_kref+0x17a4:   	udivcc	%l3, -0xdc2, %l5
	.word	0xa125e005	! t0_kref+0x17a8:   	mulscc	%l7, 5, %l0
	.word	0xe408653c	! t0_kref+0x17ac:   	ldub	[%g1 + 0x53c], %l2
	.word	0xa41ca00c	! t0_kref+0x17b0:   	xor	%l2, 0xc, %l2
	.word	0xe428653c	! t0_kref+0x17b4:   	stb	%l2, [%g1 + 0x53c]
	.word	0x81d8653c	! t0_kref+0x17b8:   	flush	%g1 + 0x53c
	.word	0xa9a28950	! t0_kref+0x17bc:   	fmuld	%f10, %f16, %f20
	.word	0xd67e401c	! t0_kref+0x17c0:   	swap	[%i1 + %i4], %o3
	.word	0xfd6e6010	! t0_kref+0x17c4:   	prefetch	%i1 + 0x10, 30
	.word	0xec1e3ff0	! t0_kref+0x17c8:   	ldd	[%i0 - 0x10], %l6
	.word	0xa7a449ae	! t0_kref+0x17cc:   	fdivs	%f17, %f14, %f19
	.word	0x9da54d31	! t0_kref+0x17d0:   	fsmuld	%f21, %f17, %f14
	.word	0x91a01a29	! t0_kref+0x17d4:   	fstoi	%f9, %f8
	.word	0x81ad0a50	! t0_kref+0x17d8:   	fcmpd	%fcc0, %f20, %f16
	.word	0xa9a489d2	! t0_kref+0x17dc:   	fdivd	%f18, %f18, %f20
	.word	0x93a00030	! t0_kref+0x17e0:   	fmovs	%f16, %f9
	.word	0xa8f6ff2a	! t0_kref+0x17e4:   	udivcc	%i3, -0xd6, %l4
2:	.word	0x95a509d4	! t0_kref+0x17e8:   	fdivd	%f20, %f20, %f10
	.word	0xe6763fe8	! t0_kref+0x17ec:   	stx	%l3, [%i0 - 0x18]
	.word	0x97a01a2b	! t0_kref+0x17f0:   	fstoi	%f11, %f11
	.word	0x21172484	! t0_kref+0x17f4:   	sethi	%hi(0x5c921000), %l0
	.word	0xa69c401b	! t0_kref+0x17f8:   	xorcc	%l1, %i3, %l3
	.word	0xa1a01a48	! t0_kref+0x17fc:   	fdtoi	%f8, %f16
	.word	0xa276eca0	! t0_kref+0x1800:   	udiv	%i3, 0xca0, %l1
	.word	0xd1be1a1c	! t0_kref+0x1804:   	stda	%f8, [%i0 + %i4]0xd0
	.word	0xa33b6005	! t0_kref+0x1808:   	sra	%o5, 0x5, %l1
	.word	0xe8070019	! t0_kref+0x180c:   	ld	[%i4 + %i1], %l4
	.word	0xa9a3c92a	! t0_kref+0x1810:   	fmuls	%f15, %f10, %f20
	.word	0x3b480008	! t0_kref+0x1814:   	fble,a,pt	%fcc0, _kref+0x1834
	.word	0xa096af43	! t0_kref+0x1818:   	orcc	%i2, 0xf43, %l0
	.word	0xd1be1a1d	! t0_kref+0x181c:   	stda	%f8, [%i0 + %i5]0xd0
	.word	0xa83ef045	! t0_kref+0x1820:   	xnor	%i3, -0xfbb, %l4
	.word	0x91a3cd2a	! t0_kref+0x1824:   	fsmuld	%f15, %f10, %f8
	.word	0x2f480001	! t0_kref+0x1828:   	fbu,a,pt	%fcc0, _kref+0x182c
	.word	0xa9418000	! t0_kref+0x182c:   	mov	%fprs, %l4
	.word	0xe1067fe4	! t0_kref+0x1830:   	ld	[%i1 - 0x1c], %f16
	.word	0xa4532482	! t0_kref+0x1834:   	umul	%o4, 0x482, %l2
	.word	0xea28a037	! t0_kref+0x1838:   	stb	%l5, [%g2 + 0x37]
	.word	0xba103fe8	! t0_kref+0x183c:   	mov	0xffffffe8, %i5
	.word	0xdd20a014	! t0_kref+0x1840:   	st	%f14, [%g2 + 0x14]
	.word	0xe44e6007	! t0_kref+0x1844:   	ldsb	[%i1 + 7], %l2
	.word	0xed380019	! t0_kref+0x1848:   	std	%f22, [%g0 + %i1]
	.word	0xe8ce101a	! t0_kref+0x184c:   	ldsba	[%i0 + %i2]0x80, %l4
	.word	0xa426c016	! t0_kref+0x1850:   	sub	%i3, %l6, %l2
	.word	0xe3b8a080	! t0_kref+0x1854:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa5418000	! t0_kref+0x1858:   	mov	%fprs, %l2
	.word	0xa8b40009	! t0_kref+0x185c:   	orncc	%l0, %o1, %l4
	.word	0x9fa01a2e	! t0_kref+0x1860:   	fstoi	%f14, %f15
	.word	0xa825280a	! t0_kref+0x1864:   	sub	%l4, 0x80a, %l4
	.word	0x81ab0a48	! t0_kref+0x1868:   	fcmpd	%fcc0, %f12, %f8
	.word	0xa4fb2dd7	! t0_kref+0x186c:   	sdivcc	%o4, 0xdd7, %l2
	.word	0x9da20848	! t0_kref+0x1870:   	faddd	%f8, %f8, %f14
	.word	0xaba01a4c	! t0_kref+0x1874:   	fdtoi	%f12, %f21
	.word	0xa4e24008	! t0_kref+0x1878:   	subccc	%o1, %o0, %l2
	.word	0xa858000c	! t0_kref+0x187c:   	smul	%g0, %o4, %l4
	.word	0x9da28d2b	! t0_kref+0x1880:   	fsmuld	%f10, %f11, %f14
	.word	0xe04e600c	! t0_kref+0x1884:   	ldsb	[%i1 + 0xc], %l0
	.word	0x9fc00004	! t0_kref+0x1888:   	call	%g0 + %g4
	.word	0xe920a014	! t0_kref+0x188c:   	st	%f20, [%g2 + 0x14]
	.word	0xa8780000	! t0_kref+0x1890:   	sdiv	%g0, %g0, %l4
	.word	0xa3418000	! t0_kref+0x1894:   	mov	%fprs, %l1
	.word	0xa1a2882d	! t0_kref+0x1898:   	fadds	%f10, %f13, %f16
	.word	0xf007bfe0	! t0_kref+0x189c:   	ld	[%fp - 0x20], %i0
	.word	0xa0a34008	! t0_kref+0x18a0:   	subcc	%o5, %o0, %l0
	.word	0xa7222943	! t0_kref+0x18a4:   	mulscc	%o0, 0x943, %l3
	.word	0xd02e401a	! t0_kref+0x18a8:   	stb	%o0, [%i1 + %i2]
	.word	0xd83f4019	! t0_kref+0x18ac:   	std	%o4, [%i5 + %i1]
	.word	0xa0d58014	! t0_kref+0x18b0:   	umulcc	%l6, %l4, %l0
	.word	0xa8aa800c	! t0_kref+0x18b4:   	andncc	%o2, %o4, %l4
	.word	0x9da01909	! t0_kref+0x18b8:   	fitod	%f9, %f14
	.word	0xa0d0000c	! t0_kref+0x18bc:   	umulcc	%g0, %o4, %l0
	.word	0xe428a004	! t0_kref+0x18c0:   	stb	%l2, [%g2 + 4]
	.word	0xe850a002	! t0_kref+0x18c4:   	ldsh	[%g2 + 2], %l4
	.word	0xea50a022	! t0_kref+0x18c8:   	ldsh	[%g2 + 0x22], %l5
	.word	0xe04e0000	! t0_kref+0x18cc:   	ldsb	[%i0], %l0
	.word	0xaa72bfda	! t0_kref+0x18d0:   	udiv	%o2, -0x26, %l5
	.word	0xec9e101d	! t0_kref+0x18d4:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0xa736c00c	! t0_kref+0x18d8:   	srl	%i3, %o4, %l3
	.word	0xd068a022	! t0_kref+0x18dc:   	ldstub	[%g2 + 0x22], %o0
	.word	0xa3400000	! t0_kref+0x18e0:   	mov	%y, %l1
	.word	0x38480001	! t0_kref+0x18e4:   	bgu,a,pt	%icc, _kref+0x18e8
	.word	0xa5a01910	! t0_kref+0x18e8:   	fitod	%f16, %f18
	.word	0x81d94010	! t0_kref+0x18ec:   	flush	%g5 + %l0
	.word	0xa8602403	! t0_kref+0x18f0:   	subc	%g0, 0x403, %l4
	.word	0xa82a401a	! t0_kref+0x18f4:   	andn	%o1, %i2, %l4
	.word	0x33480001	! t0_kref+0x18f8:   	fbe,a,pt	%fcc0, _kref+0x18fc
	.word	0xa25ec012	! t0_kref+0x18fc:   	smul	%i3, %l2, %l1
	.word	0xe648a011	! t0_kref+0x1900:   	ldsb	[%g2 + 0x11], %l3
	.word	0x81da0013	! t0_kref+0x1904:   	flush	%o0 + %l3
	.word	0xe986501c	! t0_kref+0x1908:   	lda	[%i1 + %i4]0x80, %f20
	.word	0x91a0190a	! t0_kref+0x190c:   	fitod	%f10, %f8
	.word	0xa865f41b	! t0_kref+0x1910:   	subc	%l7, -0xbe5, %l4
	.word	0xa6600012	! t0_kref+0x1914:   	subc	%g0, %l2, %l3
	.word	0xa3380012	! t0_kref+0x1918:   	sra	%g0, %l2, %l1
	.word	0xa8980008	! t0_kref+0x191c:   	xorcc	%g0, %o0, %l4
	.word	0x24480002	! t0_kref+0x1920:   	ble,a,pt	%icc, _kref+0x1928
	.word	0xe84e8018	! t0_kref+0x1924:   	ldsb	[%i2 + %i0], %l4
	.word	0xa4fb682d	! t0_kref+0x1928:   	sdivcc	%o5, 0x82d, %l2
	.word	0xd420a030	! t0_kref+0x192c:   	st	%o2, [%g2 + 0x30]
	.word	0x91a01912	! t0_kref+0x1930:   	fitod	%f18, %f8
	.word	0xa07a800c	! t0_kref+0x1934:   	sdiv	%o2, %o4, %l0
	.word	0x95a44d2f	! t0_kref+0x1938:   	fsmuld	%f17, %f15, %f10
	.word	0xa8f28017	! t0_kref+0x193c:   	udivcc	%o2, %l7, %l4
	.word	0xa2927858	! t0_kref+0x1940:   	orcc	%o1, -0x7a8, %l1
	.word	0x001fffff	! t0_kref+0x1944:   	illtrap	0x1fffff
	.word	0xa5400000	! t0_kref+0x1948:   	mov	%y, %l2
	.word	0xe56e6000	! t0_kref+0x194c:   	prefetch	%i1, 18
	.word	0x91a0192e	! t0_kref+0x1950:   	fstod	%f14, %f8
	.word	0xf83e0000	! t0_kref+0x1954:   	std	%i4, [%i0]
	call	SYM(t0_subr2)
	.word	0xe64e7fff	! t0_kref+0x195c:   	ldsb	[%i1 - 1], %l3
	.word	0x81ab8a4e	! t0_kref+0x1960:   	fcmpd	%fcc0, %f14, %f14
	.word	0x99a00536	! t0_kref+0x1964:   	fsqrts	%f22, %f12
	.word	0xd700a010	! t0_kref+0x1968:   	ld	[%g2 + 0x10], %f11
	.word	0xdbf6100b	! t0_kref+0x196c:   	casxa	[%i0]0x80, %o3, %o5
	.word	0xe27e201c	! t0_kref+0x1970:   	swap	[%i0 + 0x1c], %l1
	.word	0xd620a024	! t0_kref+0x1974:   	st	%o3, [%g2 + 0x24]
	.word	0x95a01a4e	! t0_kref+0x1978:   	fdtoi	%f14, %f10
	.word	0xa40a0012	! t0_kref+0x197c:   	and	%o0, %l2, %l2
	.word	0xf36e7ff8	! t0_kref+0x1980:   	prefetch	%i1 - 8, 25
	.word	0x21480008	! t0_kref+0x1984:   	fbn,a,pt	%fcc0, _kref+0x19a4
	.word	0xa1a01a30	! t0_kref+0x1988:   	fstoi	%f16, %f16
	.word	0xe606401c	! t0_kref+0x198c:   	ld	[%i1 + %i4], %l3
	.word	0xa2aa4016	! t0_kref+0x1990:   	andncc	%o1, %l6, %l1
	.word	0xa8a2c008	! t0_kref+0x1994:   	subcc	%o3, %o0, %l4
	.word	0x2902015f	! t0_kref+0x1998:   	sethi	%hi(0x8057c00), %l4
	.word	0xa4228008	! t0_kref+0x199c:   	sub	%o2, %o0, %l2
	.word	0xe2280019	! t0_kref+0x19a0:   	stb	%l1, [%g0 + %i1]
	.word	0xd1be181a	! t0_kref+0x19a4:   	stda	%f8, [%i0 + %i2]0xc0
	.word	0xa80da0d8	! t0_kref+0x19a8:   	and	%l6, 0xd8, %l4
	.word	0xa5a0192f	! t0_kref+0x19ac:   	fstod	%f15, %f18
	.word	0x81ad0a4a	! t0_kref+0x19b0:   	fcmpd	%fcc0, %f20, %f10
	.word	0xa3a3092c	! t0_kref+0x19b4:   	fmuls	%f12, %f12, %f17
	.word	0xfbee101a	! t0_kref+0x19b8:   	prefetcha	%i0 + %i2, 29
	.word	0xff6e401d	! t0_kref+0x19bc:   	prefetch	%i1 + %i5, 31
	.word	0xd82e6011	! t0_kref+0x19c0:   	stb	%o4, [%i1 + 0x11]
	.word	0xa05339d0	! t0_kref+0x19c4:   	umul	%o4, -0x630, %l0
	.word	0x91a409b1	! t0_kref+0x19c8:   	fdivs	%f16, %f17, %f8
	.word	0xab24f92e	! t0_kref+0x19cc:   	mulscc	%l3, -0x6d2, %l5
	.word	0xa932e004	! t0_kref+0x19d0:   	srl	%o3, 0x4, %l4
	.word	0xa8aa400d	! t0_kref+0x19d4:   	andncc	%o1, %o5, %l4
	.word	0xe420a03c	! t0_kref+0x19d8:   	st	%l2, [%g2 + 0x3c]
	.word	0xa9400000	! t0_kref+0x19dc:   	mov	%y, %l4
	.word	0x81acca32	! t0_kref+0x19e0:   	fcmps	%fcc0, %f19, %f18
	.word	0xada01a4c	! t0_kref+0x19e4:   	fdtoi	%f12, %f22
	.word	0xa9a48828	! t0_kref+0x19e8:   	fadds	%f18, %f8, %f20
	.word	0x91a0052a	! t0_kref+0x19ec:   	fsqrts	%f10, %f8
	.word	0xaa12400c	! t0_kref+0x19f0:   	or	%o1, %o4, %l5
	.word	0xa7418000	! t0_kref+0x19f4:   	mov	%fprs, %l3
	.word	0x99a54d2d	! t0_kref+0x19f8:   	fsmuld	%f21, %f13, %f12
	.word	0xe0763ff0	! t0_kref+0x19fc:   	stx	%l0, [%i0 - 0x10]
	.word	0xf428a020	! t0_kref+0x1a00:   	stb	%i2, [%g2 + 0x20]
	.word	0xa0d3603e	! t0_kref+0x1a04:   	umulcc	%o5, 0x3e, %l0
	.word	0xa2e376cc	! t0_kref+0x1a08:   	subccc	%o5, -0x934, %l1
	.word	0xe1ee501a	! t0_kref+0x1a0c:   	prefetcha	%i1 + %i2, 16
	.word	0xe620a010	! t0_kref+0x1a10:   	st	%l3, [%g2 + 0x10]
	.word	0xa5a01034	! t0_kref+0x1a14:   	fstox	%f20, %f18
	.word	0x2c800008	! t0_kref+0x1a18:   	bneg,a	_kref+0x1a38
	.word	0xea7e601c	! t0_kref+0x1a1c:   	swap	[%i1 + 0x1c], %l5
	.word	0xa9a0190e	! t0_kref+0x1a20:   	fitod	%f14, %f20
	.word	0xa626e55f	! t0_kref+0x1a24:   	sub	%i3, 0x55f, %l3
	.word	0x26480003	! t0_kref+0x1a28:   	bl,a,pt	%icc, _kref+0x1a34
	.word	0xa0722d57	! t0_kref+0x1a2c:   	udiv	%o0, 0xd57, %l0
	.word	0xa1a01913	! t0_kref+0x1a30:   	fitod	%f19, %f16
	.word	0xa02c0012	! t0_kref+0x1a34:   	andn	%l0, %l2, %l0
	.word	0xaa7dbcdc	! t0_kref+0x1a38:   	sdiv	%l6, -0x324, %l5
	.word	0xe87e3ff4	! t0_kref+0x1a3c:   	swap	[%i0 - 0xc], %l4
	.word	0xa2e6800b	! t0_kref+0x1a40:   	subccc	%i2, %o3, %l1
	.word	0x9ba00533	! t0_kref+0x1a44:   	fsqrts	%f19, %f13
	.word	0xe120a01c	! t0_kref+0x1a48:   	st	%f16, [%g2 + 0x1c]
	.word	0xa6034011	! t0_kref+0x1a4c:   	add	%o5, %l1, %l3
	.word	0x32480005	! t0_kref+0x1a50:   	bne,a,pt	%icc, _kref+0x1a64
	.word	0xa370000a	! t0_kref+0x1a54:   	popc	%o2, %l1
	.word	0xa02dbba6	! t0_kref+0x1a58:   	andn	%l6, -0x45a, %l0
	.word	0xa73cc016	! t0_kref+0x1a5c:   	sra	%l3, %l6, %l3
	.word	0xd26e601d	! t0_kref+0x1a60:   	ldstub	[%i1 + 0x1d], %o1
	.word	0xd7070018	! t0_kref+0x1a64:   	ld	[%i4 + %i0], %f11
	.word	0x99a00531	! t0_kref+0x1a68:   	fsqrts	%f17, %f12
	.word	0xa6f3001a	! t0_kref+0x1a6c:   	udivcc	%o4, %i2, %l3
	.word	0x81ab8a4c	! t0_kref+0x1a70:   	fcmpd	%fcc0, %f14, %f12
	.word	0xa71c30fb	! t0_kref+0x1a74:   	tsubcctv	%l0, -0xf05, %l3
	.word	0xaae2c012	! t0_kref+0x1a78:   	subccc	%o3, %l2, %l5
	.word	0xe616401b	! t0_kref+0x1a7c:   	lduh	[%i1 + %i3], %l3
	.word	0x30480006	! t0_kref+0x1a80:   	ba,a,pt	%icc, _kref+0x1a98
	.word	0x9fa0052c	! t0_kref+0x1a84:   	fsqrts	%f12, %f15
	.word	0x91a00531	! t0_kref+0x1a88:   	fsqrts	%f17, %f8
	.word	0x36800002	! t0_kref+0x1a8c:   	bge,a	_kref+0x1a94
	.word	0x91a01908	! t0_kref+0x1a90:   	fitod	%f8, %f8
	.word	0xaba01a4a	! t0_kref+0x1a94:   	fdtoi	%f10, %f21
	.word	0x8184c000	! t0_kref+0x1a98:   	wr	%l3, %g0, %y
	.word	0xa6b53443	! t0_kref+0x1a9c:   	orncc	%l4, -0xbbd, %l3
	.word	0xe700a024	! t0_kref+0x1aa0:   	ld	[%g2 + 0x24], %f19
	.word	0xe406601c	! t0_kref+0x1aa4:   	ld	[%i1 + 0x1c], %l2
	.word	0xa3a388a9	! t0_kref+0x1aa8:   	fsubs	%f14, %f9, %f17
	.word	0xa68b401a	! t0_kref+0x1aac:   	andcc	%o5, %i2, %l3
	.word	0xfbee501c	! t0_kref+0x1ab0:   	prefetcha	%i1 + %i4, 29
	.word	0xa6730017	! t0_kref+0x1ab4:   	udiv	%o4, %l7, %l3
	.word	0x9da01936	! t0_kref+0x1ab8:   	fstod	%f22, %f14
	.word	0xada01a4a	! t0_kref+0x1abc:   	fdtoi	%f10, %f22
	.word	0xa5400000	! t0_kref+0x1ac0:   	mov	%y, %l2
	.word	0xa3400000	! t0_kref+0x1ac4:   	mov	%y, %l1
	.word	0xa49eaefd	! t0_kref+0x1ac8:   	xorcc	%i2, 0xefd, %l2
	.word	0x93a4492a	! t0_kref+0x1acc:   	fmuls	%f17, %f10, %f9
	.word	0xa5a0192f	! t0_kref+0x1ad0:   	fstod	%f15, %f18
	.word	0xa524c013	! t0_kref+0x1ad4:   	mulscc	%l3, %l3, %l2
	.word	0xd0680019	! t0_kref+0x1ad8:   	ldstub	[%g0 + %i1], %o0
	.word	0x33480003	! t0_kref+0x1adc:   	fbe,a,pt	%fcc0, _kref+0x1ae8
	.word	0x9fa0012d	! t0_kref+0x1ae0:   	fabss	%f13, %f15
	.word	0xe600a00c	! t0_kref+0x1ae4:   	ld	[%g2 + 0xc], %l3
	.word	0xe6064000	! t0_kref+0x1ae8:   	ld	[%i1], %l3
	.word	0xa612e592	! t0_kref+0x1aec:   	or	%o3, 0x592, %l3
	.word	0xa9a0002a	! t0_kref+0x1af0:   	fmovs	%f10, %f20
	.word	0x9fc10000	! t0_kref+0x1af4:   	call	%g4
	.word	0xd220a000	! t0_kref+0x1af8:   	st	%o1, [%g2]
	.word	0xa3380010	! t0_kref+0x1afc:   	sra	%g0, %l0, %l1
	.word	0xec20623e	! t0_kref+0x1b00:   	st	%l6, [%g1 + 0x23e]
	.word	0xa614acd2	! t0_kref+0x1b04:   	or	%l2, 0xcd2, %l3
	.word	0xec30a032	! t0_kref+0x1b08:   	sth	%l6, [%g2 + 0x32]
	.word	0x27480005	! t0_kref+0x1b0c:   	fbul,a,pt	%fcc0, _kref+0x1b20
	.word	0x95a0190b	! t0_kref+0x1b10:   	fitod	%f11, %f10
	.word	0xd4263fec	! t0_kref+0x1b14:   	st	%o2, [%i0 - 0x14]
	.word	0x9ba28828	! t0_kref+0x1b18:   	fadds	%f10, %f8, %f13
	.word	0x3e480007	! t0_kref+0x1b1c:   	bvc,a,pt	%icc, _kref+0x1b38
	.word	0xe848a000	! t0_kref+0x1b20:   	ldsb	[%g2], %l4
	.word	0x3e800002	! t0_kref+0x1b24:   	bvc,a	_kref+0x1b2c
	.word	0xf9ee501d	! t0_kref+0x1b28:   	prefetcha	%i1 + %i5, 28
	.word	0xaab2b511	! t0_kref+0x1b2c:   	orncc	%o2, -0xaef, %l5
	.word	0xa425a381	! t0_kref+0x1b30:   	sub	%l6, 0x381, %l2
	.word	0xab358012	! t0_kref+0x1b34:   	srl	%l6, %l2, %l5
	.word	0x81da4015	! t0_kref+0x1b38:   	flush	%o1 + %l5
	.word	0x95a0190d	! t0_kref+0x1b3c:   	fitod	%f13, %f10
	.word	0x99a000ab	! t0_kref+0x1b40:   	fnegs	%f11, %f12
	.word	0xa0e20009	! t0_kref+0x1b44:   	subccc	%o0, %o1, %l0
	.word	0xea7e3fe0	! t0_kref+0x1b48:   	swap	[%i0 - 0x20], %l5
	.word	0xd430a000	! t0_kref+0x1b4c:   	sth	%o2, [%g2]
	.word	0xab3d600c	! t0_kref+0x1b50:   	sra	%l5, 0xc, %l5
	.word	0x9de3bfa0	! t0_kref+0x1b54:   	save	%sp, -0x60, %sp
	.word	0xba57401c	! t0_kref+0x1b58:   	umul	%i5, %i4, %i5
	.word	0xabee8018	! t0_kref+0x1b5c:   	restore	%i2, %i0, %l5
	.word	0x25480001	! t0_kref+0x1b60:   	fblg,a,pt	%fcc0, _kref+0x1b64
	.word	0xd01e001d	! t0_kref+0x1b64:   	ldd	[%i0 + %i5], %o0
	.word	0xa1a01908	! t0_kref+0x1b68:   	fitod	%f8, %f16
	.word	0xa73c4016	! t0_kref+0x1b6c:   	sra	%l1, %l6, %l3
	.word	0xe96e6000	! t0_kref+0x1b70:   	prefetch	%i1, 20
	.word	0xe4167ff4	! t0_kref+0x1b74:   	lduh	[%i1 - 0xc], %l2
	.word	0x81d9400d	! t0_kref+0x1b78:   	flush	%g5 + %o5
	.word	0x9ba01a32	! t0_kref+0x1b7c:   	fstoi	%f18, %f13
	.word	0xe630a032	! t0_kref+0x1b80:   	sth	%l3, [%g2 + 0x32]
	.word	0xab32c01b	! t0_kref+0x1b84:   	srl	%o3, %i3, %l5
	.word	0x95a00536	! t0_kref+0x1b88:   	fsqrts	%f22, %f10
	.word	0xada0190f	! t0_kref+0x1b8c:   	fitod	%f15, %f22
	.word	0x28800007	! t0_kref+0x1b90:   	bleu,a	_kref+0x1bac
	.word	0xa6a02d79	! t0_kref+0x1b94:   	subcc	%g0, 0xd79, %l3
	.word	0xa3a44830	! t0_kref+0x1b98:   	fadds	%f17, %f16, %f17
	.word	0x81dd7562	! t0_kref+0x1b9c:   	flush	%l5 - 0xa9e
	.word	0xa460000c	! t0_kref+0x1ba0:   	subc	%g0, %o4, %l2
	.word	0xe4060000	! t0_kref+0x1ba4:   	ld	[%i0], %l2
	.word	0xe24e2016	! t0_kref+0x1ba8:   	ldsb	[%i0 + 0x16], %l1
	.word	0xe44e7ffb	! t0_kref+0x1bac:   	ldsb	[%i1 - 5], %l2
	.word	0xee263fe8	! t0_kref+0x1bb0:   	st	%l7, [%i0 - 0x18]
	call	SYM(t0_subr1)
	.word	0xeb062004	! t0_kref+0x1bb8:   	ld	[%i0 + 4], %f21
	.word	0xa2e68000	! t0_kref+0x1bbc:   	subccc	%i2, %g0, %l1
	.word	0xa865a9f8	! t0_kref+0x1bc0:   	subc	%l6, 0x9f8, %l4
	.word	0x81ad8a4a	! t0_kref+0x1bc4:   	fcmpd	%fcc0, %f22, %f10
	.word	0x99a01929	! t0_kref+0x1bc8:   	fstod	%f9, %f12
	.word	0x91a01931	! t0_kref+0x1bcc:   	fstod	%f17, %f8
	.word	0xa0aac008	! t0_kref+0x1bd0:   	andncc	%o3, %o0, %l0
	.word	0x95a0188a	! t0_kref+0x1bd4:   	fitos	%f10, %f10
	.word	0x8186c000	! t0_kref+0x1bd8:   	wr	%i3, %g0, %y
	.word	0x91a34d2f	! t0_kref+0x1bdc:   	fsmuld	%f13, %f15, %f8
	.word	0x95a548b1	! t0_kref+0x1be0:   	fsubs	%f21, %f17, %f10
	.word	0xa33ce01e	! t0_kref+0x1be4:   	sra	%l3, 0x1e, %l1
	.word	0x81ab4ab6	! t0_kref+0x1be8:   	fcmpes	%fcc0, %f13, %f22
	.word	0xe8380019	! t0_kref+0x1bec:   	std	%l4, [%g0 + %i1]
	.word	0xf7ee501b	! t0_kref+0x1bf0:   	prefetcha	%i1 + %i3, 27
	.word	0xa5a549ae	! t0_kref+0x1bf4:   	fdivs	%f21, %f14, %f18
	.word	0xa9a4cd33	! t0_kref+0x1bf8:   	fsmuld	%f19, %f19, %f20
	.word	0x210ae01e	! t0_kref+0x1bfc:   	sethi	%hi(0x2b807800), %l0
	.word	0xd6ee101a	! t0_kref+0x1c00:   	ldstuba	[%i0 + %i2]0x80, %o3
	.word	0xa132800d	! t0_kref+0x1c04:   	srl	%o2, %o5, %l0
	.word	0x2f480005	! t0_kref+0x1c08:   	fbu,a,pt	%fcc0, _kref+0x1c1c
	.word	0xa852ee04	! t0_kref+0x1c0c:   	umul	%o3, 0xe04, %l4
	.word	0xa9a01a50	! t0_kref+0x1c10:   	fdtoi	%f16, %f20
	.word	0x9fa0108a	! t0_kref+0x1c14:   	fxtos	%f10, %f15
	.word	0x2c480007	! t0_kref+0x1c18:   	bneg,a,pt	%icc, _kref+0x1c34
	.word	0xa1a000b4	! t0_kref+0x1c1c:   	fnegs	%f20, %f16
	.word	0xe408a039	! t0_kref+0x1c20:   	ldub	[%g2 + 0x39], %l2
	.word	0xa85c0008	! t0_kref+0x1c24:   	smul	%l0, %o0, %l4
	.word	0xda262004	! t0_kref+0x1c28:   	st	%o5, [%i0 + 4]
	.word	0xd07f0019	! t0_kref+0x1c2c:   	swap	[%i4 + %i1], %o0
	.word	0xea06001c	! t0_kref+0x1c30:   	ld	[%i0 + %i4], %l5
	.word	0xa2fd4010	! t0_kref+0x1c34:   	sdivcc	%l5, %l0, %l1
	.word	0xe81e001d	! t0_kref+0x1c38:   	ldd	[%i0 + %i5], %l4
	.word	0xa3a01a29	! t0_kref+0x1c3c:   	fstoi	%f9, %f17
	.word	0xea30a01c	! t0_kref+0x1c40:   	sth	%l5, [%g2 + 0x1c]
	.word	0x99a00536	! t0_kref+0x1c44:   	fsqrts	%f22, %f12
	.word	0xa51eb716	! t0_kref+0x1c48:   	tsubcctv	%i2, -0x8ea, %l2
	.word	0xa25aeb8e	! t0_kref+0x1c4c:   	smul	%o3, 0xb8e, %l1
	.word	0xf628a012	! t0_kref+0x1c50:   	stb	%i3, [%g2 + 0x12]
	.word	0xe2562008	! t0_kref+0x1c54:   	ldsh	[%i0 + 8], %l1
	.word	0xa8aa4000	! t0_kref+0x1c58:   	andncc	%o1, %g0, %l4
	.word	0xa465800c	! t0_kref+0x1c5c:   	subc	%l6, %o4, %l2
	.word	0xefee501b	! t0_kref+0x1c60:   	prefetcha	%i1 + %i3, 23
	.word	0xa4e364a8	! t0_kref+0x1c64:   	subccc	%o5, 0x4a8, %l2
	.word	0xe8162018	! t0_kref+0x1c68:   	lduh	[%i0 + 0x18], %l4
	.word	0xa48ec00c	! t0_kref+0x1c6c:   	andcc	%i3, %o4, %l2
	.word	0xa8fceb26	! t0_kref+0x1c70:   	sdivcc	%l3, 0xb26, %l4
	.word	0xa522c016	! t0_kref+0x1c74:   	mulscc	%o3, %l6, %l2
	.word	0xa622624e	! t0_kref+0x1c78:   	sub	%o1, 0x24e, %l3
	.word	0x97a0052b	! t0_kref+0x1c7c:   	fsqrts	%f11, %f11
	.word	0x33480008	! t0_kref+0x1c80:   	fbe,a,pt	%fcc0, _kref+0x1ca0
	.word	0xed68a00b	! t0_kref+0x1c84:   	prefetch	%g2 + 0xb, 22
	.word	0xeb20a020	! t0_kref+0x1c88:   	st	%f21, [%g2 + 0x20]
	.word	0x3a480006	! t0_kref+0x1c8c:   	bcc,a,pt	%icc, _kref+0x1ca4
	.word	0xa2120017	! t0_kref+0x1c90:   	or	%o0, %l7, %l1
	.word	0xa3a0012f	! t0_kref+0x1c94:   	fabss	%f15, %f17
	.word	0x34480008	! t0_kref+0x1c98:   	bg,a,pt	%icc, _kref+0x1cb8
	.word	0xa122b268	! t0_kref+0x1c9c:   	mulscc	%o2, -0xd98, %l0
	.word	0xa29c0011	! t0_kref+0x1ca0:   	xorcc	%l0, %l1, %l1
	.word	0xe040a034	! t0_kref+0x1ca4:   	ldsw	[%g2 + 0x34], %l0
	.word	0xe1be1a1a	! t0_kref+0x1ca8:   	stda	%f16, [%i0 + %i2]0xd0
	.word	0x2715ec8e	! t0_kref+0x1cac:   	sethi	%hi(0x57b23800), %l3
	.word	0xa092801a	! t0_kref+0x1cb0:   	orcc	%o2, %i2, %l0
	.word	0xa69b2b18	! t0_kref+0x1cb4:   	xorcc	%o4, 0xb18, %l3
	.word	0xd87e6010	! t0_kref+0x1cb8:   	swap	[%i1 + 0x10], %o4
	.word	0xec20a034	! t0_kref+0x1cbc:   	st	%l6, [%g2 + 0x34]
	.word	0x81ac4ab0	! t0_kref+0x1cc0:   	fcmpes	%fcc0, %f17, %f16
	.word	0x32480003	! t0_kref+0x1cc4:   	bne,a,pt	%icc, _kref+0x1cd0
	.word	0xd230a02a	! t0_kref+0x1cc8:   	sth	%o1, [%g2 + 0x2a]
	.word	0x95a409cc	! t0_kref+0x1ccc:   	fdivd	%f16, %f12, %f10
	.word	0xa424a824	! t0_kref+0x1cd0:   	sub	%l2, 0x824, %l2
	.word	0xa1a01a4c	! t0_kref+0x1cd4:   	fdtoi	%f12, %f16
	.word	0xa9248012	! t0_kref+0x1cd8:   	mulscc	%l2, %l2, %l4
	.word	0xd46e601d	! t0_kref+0x1cdc:   	ldstub	[%i1 + 0x1d], %o2
	.word	0xab1eb59c	! t0_kref+0x1ce0:   	tsubcctv	%i2, -0xa64, %l5
	.word	0x9fa01a34	! t0_kref+0x1ce4:   	fstoi	%f20, %f15
	.word	0x24480004	! t0_kref+0x1ce8:   	ble,a,pt	%icc, _kref+0x1cf8
	.word	0xa29ebc3b	! t0_kref+0x1cec:   	xorcc	%i2, -0x3c5, %l1
	.word	0xf36e001c	! t0_kref+0x1cf0:   	prefetch	%i0 + %i4, 25
	.word	0xa1a00534	! t0_kref+0x1cf4:   	fsqrts	%f20, %f16
	.word	0xa5268014	! t0_kref+0x1cf8:   	mulscc	%i2, %l4, %l2
	.word	0x2c480005	! t0_kref+0x1cfc:   	bneg,a,pt	%icc, _kref+0x1d10
	.word	0xa262a0a5	! t0_kref+0x1d00:   	subc	%o2, 0xa5, %l1
	.word	0x32480007	! t0_kref+0x1d04:   	bne,a,pt	%icc, _kref+0x1d20
	.word	0xa254f7da	! t0_kref+0x1d08:   	umul	%l3, -0x826, %l1
	.word	0xa45c8011	! t0_kref+0x1d0c:   	smul	%l2, %l1, %l2
	.word	0xada01912	! t0_kref+0x1d10:   	fitod	%f18, %f22
	.word	0xd030a038	! t0_kref+0x1d14:   	sth	%o0, [%g2 + 0x38]
	.word	0x36800004	! t0_kref+0x1d18:   	bge,a	_kref+0x1d28
	.word	0xa71d3014	! t0_kref+0x1d1c:   	tsubcctv	%l4, -0xfec, %l3
	.word	0xa0b34011	! t0_kref+0x1d20:   	orncc	%o5, %l1, %l0
	.word	0xa45c0015	! t0_kref+0x1d24:   	smul	%l0, %l5, %l2
	.word	0xa2f439ee	! t0_kref+0x1d28:   	udivcc	%l0, -0x612, %l1
	.word	0xd86e6000	! t0_kref+0x1d2c:   	ldstub	[%i1], %o4
	.word	0x97a0188a	! t0_kref+0x1d30:   	fitos	%f10, %f11
	.word	0xe2780019	! t0_kref+0x1d34:   	swap	[%g0 + %i1], %l1
	.word	0x9fc10000	! t0_kref+0x1d38:   	call	%g4
	.word	0xaad0328e	! t0_kref+0x1d3c:   	umulcc	%g0, -0xd72, %l5
	.word	0x32800003	! t0_kref+0x1d40:   	bne,a	_kref+0x1d4c
	.word	0xd46e0000	! t0_kref+0x1d44:   	ldstub	[%i0], %o2
	.word	0xdd1fbd60	! t0_kref+0x1d48:   	ldd	[%fp - 0x2a0], %f14
	.word	0x001fffff	! t0_kref+0x1d4c:   	illtrap	0x1fffff
	.word	0xe81e6010	! t0_kref+0x1d50:   	ldd	[%i1 + 0x10], %l4
	.word	0xd91f4019	! t0_kref+0x1d54:   	ldd	[%i5 + %i1], %f12
	.word	0x95a54d2d	! t0_kref+0x1d58:   	fsmuld	%f21, %f13, %f10
	.word	0xa63a7648	! t0_kref+0x1d5c:   	xnor	%o1, -0x9b8, %l3
	.word	0xaad43ae1	! t0_kref+0x1d60:   	umulcc	%l0, -0x51f, %l5
	.word	0xa1a01908	! t0_kref+0x1d64:   	fitod	%f8, %f16
	.word	0x31480005	! t0_kref+0x1d68:   	fba,a,pt	%fcc0, _kref+0x1d7c
	.word	0xa2268014	! t0_kref+0x1d6c:   	sub	%i2, %l4, %l1
	.word	0xe016001b	! t0_kref+0x1d70:   	lduh	[%i0 + %i3], %l0
	.word	0xa4d523b8	! t0_kref+0x1d74:   	umulcc	%l4, 0x3b8, %l2
	.word	0xa1334016	! t0_kref+0x1d78:   	srl	%o5, %l6, %l0
	.word	0x99a01889	! t0_kref+0x1d7c:   	fitos	%f9, %f12
	.word	0x81dbc010	! t0_kref+0x1d80:   	flush	%o7 + %l0
	.word	0xe2000018	! t0_kref+0x1d84:   	ld	[%g0 + %i0], %l1
	.word	0xe630a008	! t0_kref+0x1d88:   	sth	%l3, [%g2 + 8]
	.word	0x2d480002	! t0_kref+0x1d8c:   	fbg,a,pt	%fcc0, _kref+0x1d94
	.word	0xe46e601a	! t0_kref+0x1d90:   	ldstub	[%i1 + 0x1a], %l2
	.word	0x95a3c832	! t0_kref+0x1d94:   	fadds	%f15, %f18, %f10
	.word	0x99a01888	! t0_kref+0x1d98:   	fitos	%f8, %f12
	.word	0xd87e4000	! t0_kref+0x1d9c:   	swap	[%i1], %o4
	.word	0x32800005	! t0_kref+0x1da0:   	bne,a	_kref+0x1db4
	.word	0xa73da00e	! t0_kref+0x1da4:   	sra	%l6, 0xe, %l3
	.word	0xa3400000	! t0_kref+0x1da8:   	mov	%y, %l1
	.word	0xa47c800d	! t0_kref+0x1dac:   	sdiv	%l2, %o5, %l2
	.word	0xada00136	! t0_kref+0x1db0:   	fabss	%f22, %f22
	.word	0xa733000c	! t0_kref+0x1db4:   	srl	%o4, %o4, %l3
	.word	0xe4067fec	! t0_kref+0x1db8:   	ld	[%i1 - 0x14], %l2
	.word	0xe81e6008	! t0_kref+0x1dbc:   	ldd	[%i1 + 8], %l4
	.word	0xab702793	! t0_kref+0x1dc0:   	popc	0x793, %l5
	.word	0xe0163fec	! t0_kref+0x1dc4:   	lduh	[%i0 - 0x14], %l0
	.word	0x91a2cd30	! t0_kref+0x1dc8:   	fsmuld	%f11, %f16, %f8
	.word	0x91a0052b	! t0_kref+0x1dcc:   	fsqrts	%f11, %f8
	.word	0x9de3bfa0	! t0_kref+0x1dd0:   	save	%sp, -0x60, %sp
	.word	0xb05e001a	! t0_kref+0x1dd4:   	smul	%i0, %i2, %i0
	.word	0xabeec018	! t0_kref+0x1dd8:   	restore	%i3, %i0, %l5
	.word	0xdf20a034	! t0_kref+0x1ddc:   	st	%f15, [%g2 + 0x34]
	.word	0xa8240016	! t0_kref+0x1de0:   	sub	%l0, %l6, %l4
	.word	0x2f480002	! t0_kref+0x1de4:   	fbu,a,pt	%fcc0, _kref+0x1dec
	.word	0xa52ee018	! t0_kref+0x1de8:   	sll	%i3, 0x18, %l2
	.word	0xa9344015	! t0_kref+0x1dec:   	srl	%l1, %l5, %l4
	.word	0xa45ea86e	! t0_kref+0x1df0:   	smul	%i2, 0x86e, %l2
	.word	0xd100a03c	! t0_kref+0x1df4:   	ld	[%g2 + 0x3c], %f8
	.word	0xda20a004	! t0_kref+0x1df8:   	st	%o5, [%g2 + 4]
	.word	0xc1ee500b	! t0_kref+0x1dfc:   	prefetcha	%i1 + %o3, 0
	.word	0x99a01908	! t0_kref+0x1e00:   	fitod	%f8, %f12
	.word	0xe0167ff2	! t0_kref+0x1e04:   	lduh	[%i1 - 0xe], %l0
	.word	0xa1a00534	! t0_kref+0x1e08:   	fsqrts	%f20, %f16
	.word	0xe60e3fe9	! t0_kref+0x1e0c:   	ldub	[%i0 - 0x17], %l3
	.word	0x2a800001	! t0_kref+0x1e10:   	bcs,a	_kref+0x1e14
	.word	0xa25dfc65	! t0_kref+0x1e14:   	smul	%l7, -0x39b, %l1
	.word	0xe8563ffc	! t0_kref+0x1e18:   	ldsh	[%i0 - 4], %l4
	.word	0xe9e65013	! t0_kref+0x1e1c:   	casa	[%i1]0x80, %l3, %l4
	.word	0xa8750012	! t0_kref+0x1e20:   	udiv	%l4, %l2, %l4
	.word	0xa6b6c013	! t0_kref+0x1e24:   	orncc	%i3, %l3, %l3
	.word	0xf96e001b	! t0_kref+0x1e28:   	prefetch	%i0 + %i3, 28
	.word	0x93a01a50	! t0_kref+0x1e2c:   	fdtoi	%f16, %f9
	.word	0xe820a02c	! t0_kref+0x1e30:   	st	%l4, [%g2 + 0x2c]
	.word	0x81854000	! t0_kref+0x1e34:   	wr	%l5, %g0, %y
	.word	0xa85a0012	! t0_kref+0x1e38:   	smul	%o0, %l2, %l4
	.word	0xd0763ff8	! t0_kref+0x1e3c:   	stx	%o0, [%i0 - 8]
	.word	0x22800003	! t0_kref+0x1e40:   	be,a	_kref+0x1e4c
	.word	0xaa5cc000	! t0_kref+0x1e44:   	smul	%l3, %g0, %l5
	.word	0xaabe800d	! t0_kref+0x1e48:   	xnorcc	%i2, %o5, %l5
	.word	0xd230a010	! t0_kref+0x1e4c:   	sth	%o1, [%g2 + 0x10]
	.word	0xed067ff4	! t0_kref+0x1e50:   	ld	[%i1 - 0xc], %f22
	.word	0xe87e4000	! t0_kref+0x1e54:   	swap	[%i1], %l4
	.word	0x2b480003	! t0_kref+0x1e58:   	fbug,a,pt	%fcc0, _kref+0x1e64
	.word	0xe408a033	! t0_kref+0x1e5c:   	ldub	[%g2 + 0x33], %l2
	.word	0xe4563fea	! t0_kref+0x1e60:   	ldsh	[%i0 - 0x16], %l2
	.word	0x81dfbb3d	! t0_kref+0x1e64:   	flush	%fp - 0x4c3
	.word	0xa6ac0000	! t0_kref+0x1e68:   	andncc	%l0, %g0, %l3
	.word	0xada000d4	! t0_kref+0x1e6c:   	fnegd	%f20, %f22
	.word	0xa256c00c	! t0_kref+0x1e70:   	umul	%i3, %o4, %l1
	.word	0xf628a014	! t0_kref+0x1e74:   	stb	%i3, [%g2 + 0x14]
	.word	0x81df001d	! t0_kref+0x1e78:   	flush	%i4 + %i5
	.word	0xe640a018	! t0_kref+0x1e7c:   	ldsw	[%g2 + 0x18], %l3
	.word	0xa40d6e58	! t0_kref+0x1e80:   	and	%l5, 0xe58, %l2
	.word	0x33480004	! t0_kref+0x1e84:   	fbe,a,pt	%fcc0, _kref+0x1e94
	.word	0xa866f288	! t0_kref+0x1e88:   	subc	%i3, -0xd78, %l4
	.word	0x95a5892c	! t0_kref+0x1e8c:   	fmuls	%f22, %f12, %f10
	.word	0xf5ee501c	! t0_kref+0x1e90:   	prefetcha	%i1 + %i4, 26
	.word	0xd9bf5a59	! t0_kref+0x1e94:   	stda	%f12, [%i5 + %i1]0xd2
	.word	0xa5a5892e	! t0_kref+0x1e98:   	fmuls	%f22, %f14, %f18
	.word	0xa0a429a4	! t0_kref+0x1e9c:   	subcc	%l0, 0x9a4, %l0
	.word	0xa124fd7e	! t0_kref+0x1ea0:   	mulscc	%l3, -0x282, %l0
	.word	0xaa75c00a	! t0_kref+0x1ea4:   	udiv	%l7, %o2, %l5
	.word	0xa80dad09	! t0_kref+0x1ea8:   	and	%l6, 0xd09, %l4
	.word	0xa5a0012d	! t0_kref+0x1eac:   	fabss	%f13, %f18
	.word	0xa8b2400c	! t0_kref+0x1eb0:   	orncc	%o1, %o4, %l4
	.word	0xdf00a01c	! t0_kref+0x1eb4:   	ld	[%g2 + 0x1c], %f15
	.word	0xdb00a000	! t0_kref+0x1eb8:   	ld	[%g2], %f13
	.word	0xa8a44015	! t0_kref+0x1ebc:   	subcc	%l1, %l5, %l4
	.word	0xd828a031	! t0_kref+0x1ec0:   	stb	%o4, [%g2 + 0x31]
	.word	0xc06e4000	! t0_kref+0x1ec4:   	ldstub	[%i1], %g0
	.word	0x8143e040	! t0_kref+0x1ec8:   	membar	0x40
	.word	0xe230a012	! t0_kref+0x1ecc:   	sth	%l1, [%g2 + 0x12]
	.word	0xea160000	! t0_kref+0x1ed0:   	lduh	[%i0], %l5
	.word	0xa85a3b4c	! t0_kref+0x1ed4:   	smul	%o0, -0x4b4, %l4
	.word	0xaae5801a	! t0_kref+0x1ed8:   	subccc	%l6, %i2, %l5
	.word	0xa29b2ffc	! t0_kref+0x1edc:   	xorcc	%o4, 0xffc, %l1
	.word	0xa80cc009	! t0_kref+0x1ee0:   	and	%l3, %o1, %l4
	.word	0x26480003	! t0_kref+0x1ee4:   	bl,a,pt	%icc, _kref+0x1ef0
	.word	0xa29539cf	! t0_kref+0x1ee8:   	orcc	%l4, -0x631, %l1
	.word	0x95a389d6	! t0_kref+0x1eec:   	fdivd	%f14, %f22, %f10
	.word	0xaa2ea32c	! t0_kref+0x1ef0:   	andn	%i2, 0x32c, %l5
	.word	0x97a00535	! t0_kref+0x1ef4:   	fsqrts	%f21, %f11
	.word	0x99a5092c	! t0_kref+0x1ef8:   	fmuls	%f20, %f12, %f12
	.word	0xa3400000	! t0_kref+0x1efc:   	mov	%y, %l1
	.word	0xa49d4009	! t0_kref+0x1f00:   	xorcc	%l5, %o1, %l2
	.word	0xa2d2ea7e	! t0_kref+0x1f04:   	umulcc	%o3, 0xa7e, %l1
	.word	0x9ba018d4	! t0_kref+0x1f08:   	fdtos	%f20, %f13
	.word	0x29480007	! t0_kref+0x1f0c:   	fbl,a,pt	%fcc0, _kref+0x1f28
	.word	0x2b3a55bb	! t0_kref+0x1f10:   	sethi	%hi(0xe956ec00), %l5
	.word	0xaba01a54	! t0_kref+0x1f14:   	fdtoi	%f20, %f21
	.word	0x2e800003	! t0_kref+0x1f18:   	bvs,a	_kref+0x1f24
	.word	0xe86e8019	! t0_kref+0x1f1c:   	ldstub	[%i2 + %i1], %l4
	.word	0x293f65fc	! t0_kref+0x1f20:   	sethi	%hi(0xfd97f000), %l4
	.word	0xa5400000	! t0_kref+0x1f24:   	mov	%y, %l2
	.word	0xa37036ca	! t0_kref+0x1f28:   	popc	-0x936, %l1
	.word	0x26800004	! t0_kref+0x1f2c:   	bl,a	_kref+0x1f3c
	.word	0xe26e2009	! t0_kref+0x1f30:   	ldstub	[%i0 + 9], %l1
	.word	0x81d8791d	! t0_kref+0x1f34:   	flush	%g1 - 0x6e3
	.word	0x34800002	! t0_kref+0x1f38:   	bg,a	_kref+0x1f40
	.word	0xd59f5019	! t0_kref+0x1f3c:   	ldda	[%i5 + %i1]0x80, %f10
	.word	0xe016c018	! t0_kref+0x1f40:   	lduh	[%i3 + %i0], %l0
	.word	0xeb865000	! t0_kref+0x1f44:   	lda	[%i1]0x80, %f21
	.word	0xa026c00d	! t0_kref+0x1f48:   	sub	%i3, %o5, %l0
	.word	0xa7ab4036	! t0_kref+0x1f4c:   	fmovsle	%fcc0, %f22, %f19
	.word	0x34800007	! t0_kref+0x1f50:   	bg,a	_kref+0x1f6c
	.word	0xe420a038	! t0_kref+0x1f54:   	st	%l2, [%g2 + 0x38]
	.word	0xa7400000	! t0_kref+0x1f58:   	mov	%y, %l3
	.word	0xab408000	! t0_kref+0x1f5c:   	mov	%ccr, %l5
	.word	0x9da209b5	! t0_kref+0x1f60:   	fdivs	%f8, %f21, %f14
	.word	0x37480005	! t0_kref+0x1f64:   	fbge,a,pt	%fcc0, _kref+0x1f78
	.word	0xd66e8019	! t0_kref+0x1f68:   	ldstub	[%i2 + %i1], %o3
	.word	0xdb263ffc	! t0_kref+0x1f6c:   	st	%f13, [%i0 - 4]
	.word	0x81aa8a2a	! t0_kref+0x1f70:   	fcmps	%fcc0, %f10, %f10
	.word	0x001fffff	! t0_kref+0x1f74:   	illtrap	0x1fffff
	.word	0xaae4ad19	! t0_kref+0x1f78:   	subccc	%l2, 0xd19, %l5
	.word	0xe0c81018	! t0_kref+0x1f7c:   	ldsba	[%g0 + %i0]0x80, %l0
	.word	0xa223671a	! t0_kref+0x1f80:   	sub	%o5, 0x71a, %l1
	.word	0x91a50d32	! t0_kref+0x1f84:   	fsmuld	%f20, %f18, %f8
	.word	0xe51f4019	! t0_kref+0x1f88:   	ldd	[%i5 + %i1], %f18
	.word	0xe9be581b	! t0_kref+0x1f8c:   	stda	%f20, [%i1 + %i3]0xc0
	.word	0xaab53ae9	! t0_kref+0x1f90:   	orncc	%l4, -0x517, %l5
	.word	0xaba000b6	! t0_kref+0x1f94:   	fnegs	%f22, %f21
	.word	0xf6267ff8	! t0_kref+0x1f98:   	st	%i3, [%i1 - 8]
	.word	0x25480002	! t0_kref+0x1f9c:   	fblg,a,pt	%fcc0, _kref+0x1fa4
	.word	0xc06e6014	! t0_kref+0x1fa0:   	ldstub	[%i1 + 0x14], %g0
	.word	0x81aa0a48	! t0_kref+0x1fa4:   	fcmpd	%fcc0, %f8, %f8
	.word	0x9da00533	! t0_kref+0x1fa8:   	fsqrts	%f19, %f14
	.word	0xada01a50	! t0_kref+0x1fac:   	fdtoi	%f16, %f22
	.word	0xd2263ff4	! t0_kref+0x1fb0:   	st	%o1, [%i0 - 0xc]
	.word	0x32480004	! t0_kref+0x1fb4:   	bne,a,pt	%icc, _kref+0x1fc4
	.word	0xd1000018	! t0_kref+0x1fb8:   	ld	[%g0 + %i0], %f8
	.word	0xe1070019	! t0_kref+0x1fbc:   	ld	[%i4 + %i1], %f16
	.word	0xaba01a54	! t0_kref+0x1fc0:   	fdtoi	%f20, %f21
	.word	0xa1a0012a	! t0_kref+0x1fc4:   	fabss	%f10, %f16
	.word	0xa6444012	! t0_kref+0x1fc8:   	addc	%l1, %l2, %l3
	.word	0xaa55b471	! t0_kref+0x1fcc:   	umul	%l6, -0xb8f, %l5
	.word	0xd220a02c	! t0_kref+0x1fd0:   	st	%o1, [%g2 + 0x2c]
	.word	0xa07aeb8d	! t0_kref+0x1fd4:   	sdiv	%o3, 0xb8d, %l0
	.word	0xa274efc8	! t0_kref+0x1fd8:   	udiv	%l3, 0xfc8, %l1
	.word	0x3c480004	! t0_kref+0x1fdc:   	bpos,a,pt	%icc, _kref+0x1fec
	.word	0xd620a034	! t0_kref+0x1fe0:   	st	%o3, [%g2 + 0x34]
	.word	0x81dbc014	! t0_kref+0x1fe4:   	flush	%o7 + %l4
	.word	0xee6e401a	! t0_kref+0x1fe8:   	ldstub	[%i1 + %i2], %l7
	.word	0x20480003	! t0_kref+0x1fec:   	bn,a,pt	%icc, _kref+0x1ff8
	.word	0xe628a031	! t0_kref+0x1ff0:   	stb	%l3, [%g2 + 0x31]
	.word	0xada00534	! t0_kref+0x1ff4:   	fsqrts	%f20, %f22
	.word	0x81aa0ab4	! t0_kref+0x1ff8:   	fcmpes	%fcc0, %f8, %f20
	.word	0xe2d6d019	! t0_kref+0x1ffc:   	ldsha	[%i3 + %i1]0x80, %l1
	.word	0xa266801b	! t0_kref+0x2000:   	subc	%i2, %i3, %l1
	.word	0xec28a024	! t0_kref+0x2004:   	stb	%l6, [%g2 + 0x24]
	.word	0xd1be1815	! t0_kref+0x2008:   	stda	%f8, [%i0 + %l5]0xc0
	.word	0xa325e6b4	! t0_kref+0x200c:   	mulscc	%l7, 0x6b4, %l1
	.word	0x9ba0052d	! t0_kref+0x2010:   	fsqrts	%f13, %f13
	.word	0x9fa01a31	! t0_kref+0x2014:   	fstoi	%f17, %f15
	.word	0xe00e7fe5	! t0_kref+0x2018:   	ldub	[%i1 - 0x1b], %l0
	.word	0xe4166002	! t0_kref+0x201c:   	lduh	[%i1 + 2], %l2
	.word	0xe700a01c	! t0_kref+0x2020:   	ld	[%g2 + 0x1c], %f19
	.word	0xaa730010	! t0_kref+0x2024:   	udiv	%o4, %l0, %l5
	.word	0xa23d000c	! t0_kref+0x2028:   	xnor	%l4, %o4, %l1
	.word	0xe1270019	! t0_kref+0x202c:   	st	%f16, [%i4 + %i1]
	.word	0xe27e7ff4	! t0_kref+0x2030:   	swap	[%i1 - 0xc], %l1
	.word	0xd926401c	! t0_kref+0x2034:   	st	%f12, [%i1 + %i4]
	.word	0xa89d800d	! t0_kref+0x2038:   	xorcc	%l6, %o5, %l4
	.word	0xa4d4ebf7	! t0_kref+0x203c:   	umulcc	%l3, 0xbf7, %l2
	.word	0xa92c601a	! t0_kref+0x2040:   	sll	%l1, 0x1a, %l4
	.word	0x9fa000a9	! t0_kref+0x2044:   	fnegs	%f9, %f15
	.word	0xe648a01e	! t0_kref+0x2048:   	ldsb	[%g2 + 0x1e], %l3
	.word	0xe06e3ff9	! t0_kref+0x204c:   	ldstub	[%i0 - 7], %l0
	.word	0xe030a028	! t0_kref+0x2050:   	sth	%l0, [%g2 + 0x28]
	.word	0x99a00528	! t0_kref+0x2054:   	fsqrts	%f8, %f12
	.word	0xa7a01a33	! t0_kref+0x2058:   	fstoi	%f19, %f19
	.word	0xa8fde5a5	! t0_kref+0x205c:   	sdivcc	%l7, 0x5a5, %l4
	.word	0xa0b2eb4b	! t0_kref+0x2060:   	orncc	%o3, 0xb4b, %l0
	.word	0xea260000	! t0_kref+0x2064:   	st	%l5, [%i0]
	.word	0xea162012	! t0_kref+0x2068:   	lduh	[%i0 + 0x12], %l5
	.word	0xa1a30d2e	! t0_kref+0x206c:   	fsmuld	%f12, %f14, %f16
	.word	0x9de3bfa0	! t0_kref+0x2070:   	save	%sp, -0x60, %sp
	.word	0xa7eef776	! t0_kref+0x2074:   	restore	%i3, -0x88a, %l3
	.word	0xe5266004	! t0_kref+0x2078:   	st	%f18, [%i1 + 4]
	.word	0xe53e3ff0	! t0_kref+0x207c:   	std	%f18, [%i0 - 0x10]
	.word	0x2d480006	! t0_kref+0x2080:   	fbg,a,pt	%fcc0, _kref+0x2098
	.word	0xaa620011	! t0_kref+0x2084:   	subc	%o0, %l1, %l5
	.word	0x81aa8a4a	! t0_kref+0x2088:   	fcmpd	%fcc0, %f10, %f10
	.word	0x81ad8a35	! t0_kref+0x208c:   	fcmps	%fcc0, %f22, %f21
	.word	0x99a44d28	! t0_kref+0x2090:   	fsmuld	%f17, %f8, %f12
	.word	0xdd20a028	! t0_kref+0x2094:   	st	%f14, [%g2 + 0x28]
	.word	0xaa2b0011	! t0_kref+0x2098:   	andn	%o4, %l1, %l5
	.word	0xe76e401d	! t0_kref+0x209c:   	prefetch	%i1 + %i5, 19
	.word	0xa9a01a54	! t0_kref+0x20a0:   	fdtoi	%f20, %f20
	.word	0xa4aec00a	! t0_kref+0x20a4:   	andncc	%i3, %o2, %l2
	.word	0xc1ee5014	! t0_kref+0x20a8:   	prefetcha	%i1 + %l4, 0
	.word	0xa47b0017	! t0_kref+0x20ac:   	sdiv	%o4, %l7, %l2
	.word	0xa6e6800c	! t0_kref+0x20b0:   	subccc	%i2, %o4, %l3
	.word	0xee7e4000	! t0_kref+0x20b4:   	swap	[%i1], %l7
	.word	0x39480001	! t0_kref+0x20b8:   	fbuge,a,pt	%fcc0, _kref+0x20bc
	.word	0xe64e3ff8	! t0_kref+0x20bc:   	ldsb	[%i0 - 8], %l3
	.word	0xa1a0052e	! t0_kref+0x20c0:   	fsqrts	%f14, %f16
	.word	0x81ad4ab5	! t0_kref+0x20c4:   	fcmpes	%fcc0, %f21, %f21
	.word	0xd7067fec	! t0_kref+0x20c8:   	ld	[%i1 - 0x14], %f11
	.word	0x30480006	! t0_kref+0x20cc:   	ba,a,pt	%icc, _kref+0x20e4
	.word	0xaa9b4009	! t0_kref+0x20d0:   	xorcc	%o5, %o1, %l5
	.word	0x26480005	! t0_kref+0x20d4:   	bl,a,pt	%icc, _kref+0x20e8
	.word	0xd028a017	! t0_kref+0x20d8:   	stb	%o0, [%g2 + 0x17]
	.word	0xab2c6003	! t0_kref+0x20dc:   	sll	%l1, 0x3, %l5
	.word	0x32800003	! t0_kref+0x20e0:   	bne,a	_kref+0x20ec
	.word	0xd3262010	! t0_kref+0x20e4:   	st	%f9, [%i0 + 0x10]
	.word	0xa875c00a	! t0_kref+0x20e8:   	udiv	%l7, %o2, %l4
	.word	0xa73ec015	! t0_kref+0x20ec:   	sra	%i3, %l5, %l3
	.word	0xa93da00a	! t0_kref+0x20f0:   	sra	%l6, 0xa, %l4
	.word	0xa92de006	! t0_kref+0x20f4:   	sll	%l7, 0x6, %l4
	.word	0xe2ce1000	! t0_kref+0x20f8:   	ldsba	[%i0]0x80, %l1
	.word	0x81dc801b	! t0_kref+0x20fc:   	flush	%l2 + %i3
	.word	0xa1124008	! t0_kref+0x2100:   	taddcctv	%o1, %o0, %l0
	.word	0xa0d6a192	! t0_kref+0x2104:   	umulcc	%i2, 0x192, %l0
	.word	0x21480003	! t0_kref+0x2108:   	fbn,a,pt	%fcc0, _kref+0x2114
	.word	0xa62d8012	! t0_kref+0x210c:   	andn	%l6, %l2, %l3
	.word	0x81ab8ab4	! t0_kref+0x2110:   	fcmpes	%fcc0, %f14, %f20
	.word	0x97a2c9b0	! t0_kref+0x2114:   	fdivs	%f11, %f16, %f11
	.word	0x81da801b	! t0_kref+0x2118:   	flush	%o2 + %i3
	.word	0xa2634011	! t0_kref+0x211c:   	subc	%o5, %l1, %l1
	.word	0xa3ab4034	! t0_kref+0x2120:   	fmovsle	%fcc0, %f20, %f17
	.word	0x81da6e02	! t0_kref+0x2124:   	flush	%o1 + 0xe02
	.word	0xaaba400a	! t0_kref+0x2128:   	xnorcc	%o1, %o2, %l5
	.word	0xaa5cfafd	! t0_kref+0x212c:   	smul	%l3, -0x503, %l5
	.word	0xa724b476	! t0_kref+0x2130:   	mulscc	%l2, -0xb8a, %l3
	.word	0x29480001	! t0_kref+0x2134:   	fbl,a,pt	%fcc0, _kref+0x2138
	.word	0xa40a400c	! t0_kref+0x2138:   	and	%o1, %o4, %l2
	.word	0xeb00a010	! t0_kref+0x213c:   	ld	[%g2 + 0x10], %f21
	.word	0x9ba0052c	! t0_kref+0x2140:   	fsqrts	%f12, %f13
	.word	0x81ab8a2a	! t0_kref+0x2144:   	fcmps	%fcc0, %f14, %f10
	.word	0xa422eb71	! t0_kref+0x2148:   	sub	%o3, 0xb71, %l2
	.word	0xaa5aa511	! t0_kref+0x214c:   	smul	%o2, 0x511, %l5
	.word	0xa922b99c	! t0_kref+0x2150:   	mulscc	%o2, -0x664, %l4
	.word	0xe448a01b	! t0_kref+0x2154:   	ldsb	[%g2 + 0x1b], %l2
	.word	0xc368a08a	! t0_kref+0x2158:   	prefetch	%g2 + 0x8a, 1
	.word	0xaa64800d	! t0_kref+0x215c:   	subc	%l2, %o5, %l5
	.word	0xe80e0000	! t0_kref+0x2160:   	ldub	[%i0], %l4
	.word	0xeeee1000	! t0_kref+0x2164:   	ldstuba	[%i0]0x80, %l7
	.word	0xa056c014	! t0_kref+0x2168:   	umul	%i3, %l4, %l0
	.word	0xea96d019	! t0_kref+0x216c:   	lduha	[%i3 + %i1]0x80, %l5
	.word	0xa254374a	! t0_kref+0x2170:   	umul	%l0, -0x8b6, %l1
	.word	0xada3cd33	! t0_kref+0x2174:   	fsmuld	%f15, %f19, %f22
	.word	0x9ba01a56	! t0_kref+0x2178:   	fdtoi	%f22, %f13
	.word	0xa2d37be6	! t0_kref+0x217c:   	umulcc	%o5, -0x41a, %l1
	.word	0xa8aa801b	! t0_kref+0x2180:   	andncc	%o2, %i3, %l4
	.word	0xe84e201a	! t0_kref+0x2184:   	ldsb	[%i0 + 0x1a], %l4
	.word	0xa1a01a48	! t0_kref+0x2188:   	fdtoi	%f8, %f16
	.word	0x3c480001	! t0_kref+0x218c:   	bpos,a,pt	%icc, _kref+0x2190
	.word	0xa20d328d	! t0_kref+0x2190:   	and	%l4, -0xd73, %l1
	.word	0xa8e58012	! t0_kref+0x2194:   	subccc	%l6, %l2, %l4
	.word	0xe25e401d	! t0_kref+0x2198:   	ldx	[%i1 + %i5], %l1
	.word	0xa2e5c014	! t0_kref+0x219c:   	subccc	%l7, %l4, %l1
	.word	0xa52ee019	! t0_kref+0x21a0:   	sll	%i3, 0x19, %l2
	.word	0x20480008	! t0_kref+0x21a4:   	bn,a,pt	%icc, _kref+0x21c4
	.word	0xd9be588a	! t0_kref+0x21a8:   	stda	%f12, [%i1 + %o2]0xc4
	.word	0xea0e001a	! t0_kref+0x21ac:   	ldub	[%i0 + %i2], %l5
	.word	0xea06601c	! t0_kref+0x21b0:   	ld	[%i1 + 0x1c], %l5
	.word	0x272514f9	! t0_kref+0x21b4:   	sethi	%hi(0x9453e400), %l3
	.word	0xa63de306	! t0_kref+0x21b8:   	xnor	%l7, 0x306, %l3
	.word	0x39480006	! t0_kref+0x21bc:   	fbuge,a,pt	%fcc0, _kref+0x21d4
	.word	0xa3a01a4c	! t0_kref+0x21c0:   	fdtoi	%f12, %f17
	.word	0x2c800008	! t0_kref+0x21c4:   	bneg,a	_kref+0x21e4
	.word	0xe228a03b	! t0_kref+0x21c8:   	stb	%l1, [%g2 + 0x3b]
	.word	0xa1a01910	! t0_kref+0x21cc:   	fitod	%f16, %f16
	.word	0x81ac8a34	! t0_kref+0x21d0:   	fcmps	%fcc0, %f18, %f20
	.word	0xa1a01913	! t0_kref+0x21d4:   	fitod	%f19, %f16
	.word	0xd428a023	! t0_kref+0x21d8:   	stb	%o2, [%g2 + 0x23]
	.word	0xa00d32df	! t0_kref+0x21dc:   	and	%l4, -0xd21, %l0
	.word	0xea50a016	! t0_kref+0x21e0:   	ldsh	[%g2 + 0x16], %l5
	.word	0xe056401b	! t0_kref+0x21e4:   	ldsh	[%i1 + %i3], %l0
	.word	0xa9a01a4a	! t0_kref+0x21e8:   	fdtoi	%f10, %f20
	.word	0x38480002	! t0_kref+0x21ec:   	bgu,a,pt	%icc, _kref+0x21f4
	.word	0xe848a001	! t0_kref+0x21f0:   	ldsb	[%g2 + 1], %l4
	.word	0x9fa01a52	! t0_kref+0x21f4:   	fdtoi	%f18, %f15
	.word	0x99a50d30	! t0_kref+0x21f8:   	fsmuld	%f20, %f16, %f12
	.word	0xd630a01e	! t0_kref+0x21fc:   	sth	%o3, [%g2 + 0x1e]
	.word	0x36480005	! t0_kref+0x2200:   	bge,a,pt	%icc, _kref+0x2214
	.word	0x91a01910	! t0_kref+0x2204:   	fitod	%f16, %f8
	.word	0xea28a01f	! t0_kref+0x2208:   	stb	%l5, [%g2 + 0x1f]
	.word	0xe19e5a1d	! t0_kref+0x220c:   	ldda	[%i1 + %i5]0xd0, %f16
	.word	0xa8d68017	! t0_kref+0x2210:   	umulcc	%i2, %l7, %l4
	.word	0xe008a013	! t0_kref+0x2214:   	ldub	[%g2 + 0x13], %l0
	.word	0xa3400000	! t0_kref+0x2218:   	mov	%y, %l1
	.word	0xa094400c	! t0_kref+0x221c:   	orcc	%l1, %o4, %l0
	.word	0xa0aab66d	! t0_kref+0x2220:   	andncc	%o2, -0x993, %l0
	.word	0xa5a01a33	! t0_kref+0x2224:   	fstoi	%f19, %f18
	.word	0xa06563b6	! t0_kref+0x2228:   	subc	%l5, 0x3b6, %l0
	.word	0xa72436f3	! t0_kref+0x222c:   	mulscc	%l0, -0x90d, %l3
	.word	0xa2e3000d	! t0_kref+0x2230:   	subccc	%o4, %o5, %l1
	.word	0xa9a01a4a	! t0_kref+0x2234:   	fdtoi	%f10, %f20
	.word	0xe4086fbc	! t0_kref+0x2238:   	ldub	[%g1 + 0xfbc], %l2
	.word	0xa41ca00c	! t0_kref+0x223c:   	xor	%l2, 0xc, %l2
	.word	0xe4286fbc	! t0_kref+0x2240:   	stb	%l2, [%g1 + 0xfbc]
	.word	0x81d86fbc	! t0_kref+0x2244:   	flush	%g1 + 0xfbc
	.word	0xc168a00d	! t0_kref+0x2248:   	prefetch	%g2 + 0xd, 0
	.word	0x2730dd28	! t0_kref+0x224c:   	sethi	%hi(0xc374a000), %l3
	.word	0xa025a600	! t0_kref+0x2250:   	sub	%l6, 0x600, %l0
	.word	0x81aa0a52	! t0_kref+0x2254:   	fcmpd	%fcc0, %f8, %f18
	.word	0xa872c011	! t0_kref+0x2258:   	udiv	%o3, %l1, %l4
	.word	0xc568a008	! t0_kref+0x225c:   	prefetch	%g2 + 8, 2
	.word	0xaaa00015	! t0_kref+0x2260:   	subcc	%g0, %l5, %l5
	.word	0xe1266014	! t0_kref+0x2264:   	st	%f16, [%i1 + 0x14]
2:	.word	0xe2100019	! t0_kref+0x2268:   	lduh	[%g0 + %i1], %l1
	.word	0x37480001	! t0_kref+0x226c:   	fbge,a,pt	%fcc0, _kref+0x2270
	.word	0xd228a000	! t0_kref+0x2270:   	stb	%o1, [%g2]
	.word	0xa4c2801a	! t0_kref+0x2274:   	addccc	%o2, %i2, %l2
	.word	0x81858000	! t0_kref+0x2278:   	wr	%l6, %g0, %y
	.word	0xa5408000	! t0_kref+0x227c:   	mov	%ccr, %l2
	.word	0xa540c000	! t0_kref+0x2280:   	mov	%asi, %l2
	.word	0x99a0190e	! t0_kref+0x2284:   	fitod	%f14, %f12
	.word	0x81ac0aae	! t0_kref+0x2288:   	fcmpes	%fcc0, %f16, %f14
	.word	0xa1a01912	! t0_kref+0x228c:   	fitod	%f18, %f16
	.word	0xa22b7a7a	! t0_kref+0x2290:   	andn	%o5, -0x586, %l1
	.word	0xa0aae441	! t0_kref+0x2294:   	andncc	%o3, 0x441, %l0
	.word	0xf9ee101b	! t0_kref+0x2298:   	prefetcha	%i0 + %i3, 28
	.word	0xa2e22c57	! t0_kref+0x229c:   	subccc	%o0, 0xc57, %l1
	.word	0xab3ce00f	! t0_kref+0x22a0:   	sra	%l3, 0xf, %l5
	.word	0xa22ce795	! t0_kref+0x22a4:   	andn	%l3, 0x795, %l1
	.word	0xe100a010	! t0_kref+0x22a8:   	ld	[%g2 + 0x10], %f16
	.word	0xa324704f	! t0_kref+0x22ac:   	mulscc	%l1, -0xfb1, %l1
	.word	0xe806201c	! t0_kref+0x22b0:   	ld	[%i0 + 0x1c], %l4
	.word	0x81ad4aad	! t0_kref+0x22b4:   	fcmpes	%fcc0, %f21, %f13
	.word	0xa8b28017	! t0_kref+0x22b8:   	orncc	%o2, %l7, %l4
	.word	0x91a489cc	! t0_kref+0x22bc:   	fdivd	%f18, %f12, %f8
	.word	0xef68a04b	! t0_kref+0x22c0:   	prefetch	%g2 + 0x4b, 23
	.word	0x22480005	! t0_kref+0x22c4:   	be,a,pt	%icc, _kref+0x22d8
	.word	0xdf00a00c	! t0_kref+0x22c8:   	ld	[%g2 + 0xc], %f15
	.word	0xa5a00535	! t0_kref+0x22cc:   	fsqrts	%f21, %f18
	.word	0xea10a02c	! t0_kref+0x22d0:   	lduh	[%g2 + 0x2c], %l5
	.word	0xaaf5b676	! t0_kref+0x22d4:   	udivcc	%l6, -0x98a, %l5
	.word	0xaa5dc00d	! t0_kref+0x22d8:   	smul	%l7, %o5, %l5
	.word	0xe808a003	! t0_kref+0x22dc:   	ldub	[%g2 + 3], %l4
	.word	0xc807bfec	! t0_kref+0x22e0:   	ld	[%fp - 0x14], %g4
	.word	0x9ba00529	! t0_kref+0x22e4:   	fsqrts	%f9, %f13
	.word	0xee7e201c	! t0_kref+0x22e8:   	swap	[%i0 + 0x1c], %l7
	.word	0x9da34d30	! t0_kref+0x22ec:   	fsmuld	%f13, %f16, %f14
	.word	0xa33a601c	! t0_kref+0x22f0:   	sra	%o1, 0x1c, %l1
	.word	0x9de3bfa0	! t0_kref+0x22f4:   	save	%sp, -0x60, %sp
	.word	0xabee0018	! t0_kref+0x22f8:   	restore	%i0, %i0, %l5
	.word	0xaa0a0009	! t0_kref+0x22fc:   	and	%o0, %o1, %l5
	.word	0xa1a549ab	! t0_kref+0x2300:   	fdivs	%f21, %f11, %f16
	.word	0x2f480003	! t0_kref+0x2304:   	fbu,a,pt	%fcc0, _kref+0x2310
	.word	0xe46e001a	! t0_kref+0x2308:   	ldstub	[%i0 + %i2], %l2
	.word	0xd19e1000	! t0_kref+0x230c:   	ldda	[%i0]0x80, %f8
	.word	0xaa957544	! t0_kref+0x2310:   	orcc	%l5, -0xabc, %l5
	.word	0xa12ac013	! t0_kref+0x2314:   	sll	%o3, %l3, %l0
	.word	0xa62d800a	! t0_kref+0x2318:   	andn	%l6, %o2, %l3
	.word	0xaba4c9a8	! t0_kref+0x231c:   	fdivs	%f19, %f8, %f21
	.word	0xaae4c013	! t0_kref+0x2320:   	subccc	%l3, %l3, %l5
	.word	0x91a01a4c	! t0_kref+0x2324:   	fdtoi	%f12, %f8
	.word	0xd7262014	! t0_kref+0x2328:   	st	%f11, [%i0 + 0x14]
	.word	0xe4a71019	! t0_kref+0x232c:   	sta	%l2, [%i4 + %i1]0x80
	.word	0xa6aac012	! t0_kref+0x2330:   	andncc	%o3, %l2, %l3
	.word	0xd47e7fe0	! t0_kref+0x2334:   	swap	[%i1 - 0x20], %o2
	.word	0xe296d019	! t0_kref+0x2338:   	lduha	[%i3 + %i1]0x80, %l1
	.word	0xa5a488a9	! t0_kref+0x233c:   	fsubs	%f18, %f9, %f18
	.word	0xe2961000	! t0_kref+0x2340:   	lduha	[%i0]0x80, %l1
	.word	0xff6e001d	! t0_kref+0x2344:   	prefetch	%i0 + %i5, 31
	.word	0xea40a008	! t0_kref+0x2348:   	ldsw	[%g2 + 8], %l5
	.word	0xaa7c8009	! t0_kref+0x234c:   	sdiv	%l2, %o1, %l5
	.word	0x9da01932	! t0_kref+0x2350:   	fstod	%f18, %f14
	.word	0xa8ae8012	! t0_kref+0x2354:   	andncc	%i2, %l2, %l4
	.word	0xea060000	! t0_kref+0x2358:   	ld	[%i0], %l5
	.word	0xa9a000d6	! t0_kref+0x235c:   	fnegd	%f22, %f20
	.word	0xa672fb98	! t0_kref+0x2360:   	udiv	%o3, -0x468, %l3
	.word	0x81dd281e	! t0_kref+0x2364:   	flush	%l4 + 0x81e
	call	SYM(t0_subr2)
	.word	0xaaa2f42c	! t0_kref+0x236c:   	subcc	%o3, -0xbd4, %l5
	.word	0xa93ae01f	! t0_kref+0x2370:   	sra	%o3, 0x1f, %l4
	.word	0xc078a030	! t0_kref+0x2374:   	swap	[%g2 + 0x30], %g0
	.word	0xde3068a3	! t0_kref+0x2378:   	sth	%o7, [%g1 + 0x8a3]
	.word	0x99a01a56	! t0_kref+0x237c:   	fdtoi	%f22, %f12
	.word	0x8143e040	! t0_kref+0x2380:   	membar	0x40
	.word	0xa8d2c014	! t0_kref+0x2384:   	umulcc	%o3, %l4, %l4
	.word	0xed1fbc48	! t0_kref+0x2388:   	ldd	[%fp - 0x3b8], %f22
	.word	0xaa1a7849	! t0_kref+0x238c:   	xor	%o1, -0x7b7, %l5
	.word	0x3f480003	! t0_kref+0x2390:   	fbo,a,pt	%fcc0, _kref+0x239c
	.word	0xea562018	! t0_kref+0x2394:   	ldsh	[%i0 + 0x18], %l5
	.word	0xa225800d	! t0_kref+0x2398:   	sub	%l6, %o5, %l1
	.word	0x83414000	! t0_kref+0x239c:   	mov	%pc, %g1
	.word	0x9ba01a28	! t0_kref+0x23a0:   	fstoi	%f8, %f13
	.word	0x3e480005	! t0_kref+0x23a4:   	bvc,a,pt	%icc, _kref+0x23b8
	.word	0xe1be580b	! t0_kref+0x23a8:   	stda	%f16, [%i1 + %o3]0xc0
	.word	0x2b3bb8c4	! t0_kref+0x23ac:   	sethi	%hi(0xeee31000), %l5
	.word	0x3b480002	! t0_kref+0x23b0:   	fble,a,pt	%fcc0, _kref+0x23b8
	.word	0xa52de01c	! t0_kref+0x23b4:   	sll	%l7, 0x1c, %l2
	.word	0xa65aabe5	! t0_kref+0x23b8:   	smul	%o2, 0xbe5, %l3
	.word	0x32480004	! t0_kref+0x23bc:   	bne,a,pt	%icc, _kref+0x23cc
	.word	0xa1a0188d	! t0_kref+0x23c0:   	fitos	%f13, %f16
	.word	0xa9a288a9	! t0_kref+0x23c4:   	fsubs	%f10, %f9, %f20
	.word	0xa274e745	! t0_kref+0x23c8:   	udiv	%l3, 0x745, %l1
	.word	0x26480005	! t0_kref+0x23cc:   	bl,a,pt	%icc, _kref+0x23e0
	.word	0xf007bfe0	! t0_kref+0x23d0:   	ld	[%fp - 0x20], %i0
	.word	0xaba01090	! t0_kref+0x23d4:   	fxtos	%f16, %f21
	.word	0xa32d8016	! t0_kref+0x23d8:   	sll	%l6, %l6, %l1
	.word	0x22480007	! t0_kref+0x23dc:   	be,a,pt	%icc, _kref+0x23f8
	.word	0xa29a400b	! t0_kref+0x23e0:   	xorcc	%o1, %o3, %l1
	.word	0xea30a024	! t0_kref+0x23e4:   	sth	%l5, [%g2 + 0x24]
	.word	0xa3368016	! t0_kref+0x23e8:   	srl	%i2, %l6, %l1
	.word	0xe920a034	! t0_kref+0x23ec:   	st	%f20, [%g2 + 0x34]
	.word	0x24800003	! t0_kref+0x23f0:   	ble,a	_kref+0x23fc
	.word	0x93a0002f	! t0_kref+0x23f4:   	fmovs	%f15, %f9
	.word	0xc168a002	! t0_kref+0x23f8:   	prefetch	%g2 + 2, 0
	.word	0xe9070018	! t0_kref+0x23fc:   	ld	[%i4 + %i0], %f20
	.word	0xa09d000c	! t0_kref+0x2400:   	xorcc	%l4, %o4, %l0
	.word	0x81800000	! t0_kref+0x2404:   	mov	%g0, %y
	.word	0xa87a400a	! t0_kref+0x2408:   	sdiv	%o1, %o2, %l4
	.word	0x272bbe0b	! t0_kref+0x240c:   	sethi	%hi(0xaef82c00), %l3
	.word	0xe80e3ffd	! t0_kref+0x2410:   	ldub	[%i0 - 3], %l4
	.word	0xe608a017	! t0_kref+0x2414:   	ldub	[%g2 + 0x17], %l3
	.word	0x9da01a30	! t0_kref+0x2418:   	fstoi	%f16, %f14
	.word	0x8184c000	! t0_kref+0x241c:   	wr	%l3, %g0, %y
	.word	0xa0e5401b	! t0_kref+0x2420:   	subccc	%l5, %i3, %l0
	.word	0x95a20854	! t0_kref+0x2424:   	faddd	%f8, %f20, %f10
	.word	0xa485c010	! t0_kref+0x2428:   	addcc	%l7, %l0, %l2
	.word	0xa5224013	! t0_kref+0x242c:   	mulscc	%o1, %l3, %l2
	.word	0xeda61000	! t0_kref+0x2430:   	sta	%f22, [%i0]0x80
	.word	0xd66e6002	! t0_kref+0x2434:   	ldstub	[%i1 + 2], %o3
	.word	0xa6aec017	! t0_kref+0x2438:   	andncc	%i3, %l7, %l3
	.word	0xda28a01e	! t0_kref+0x243c:   	stb	%o5, [%g2 + 0x1e]
	.word	0xa5a58d29	! t0_kref+0x2440:   	fsmuld	%f22, %f9, %f18
	.word	0xe8ce1000	! t0_kref+0x2444:   	ldsba	[%i0]0x80, %l4
	.word	0xba103fe8	! t0_kref+0x2448:   	mov	0xffffffe8, %i5
	.word	0xaad57130	! t0_kref+0x244c:   	umulcc	%l5, -0xed0, %l5
	.word	0xa2d2800b	! t0_kref+0x2450:   	umulcc	%o2, %o3, %l1
	.word	0xaa620009	! t0_kref+0x2454:   	subc	%o0, %o1, %l5
	.word	0x9ba4c933	! t0_kref+0x2458:   	fmuls	%f19, %f19, %f13
	.word	0xe630a008	! t0_kref+0x245c:   	sth	%l3, [%g2 + 8]
	.word	0x8143c000	! t0_kref+0x2460:   	stbar
	.word	0xe62e401a	! t0_kref+0x2464:   	stb	%l3, [%i1 + %i2]
	.word	0xd07e201c	! t0_kref+0x2468:   	swap	[%i0 + 0x1c], %o0
	.word	0x39480002	! t0_kref+0x246c:   	fbuge,a,pt	%fcc0, _kref+0x2474
	.word	0xe848a020	! t0_kref+0x2470:   	ldsb	[%g2 + 0x20], %l4
	.word	0xd9260000	! t0_kref+0x2474:   	st	%f12, [%i0]
	.word	0xd83e7ff0	! t0_kref+0x2478:   	std	%o4, [%i1 - 0x10]
	.word	0x95a01a52	! t0_kref+0x247c:   	fdtoi	%f18, %f10
	.word	0x81ad0a32	! t0_kref+0x2480:   	fcmps	%fcc0, %f20, %f18
	.word	0xa85d6117	! t0_kref+0x2484:   	smul	%l5, 0x117, %l4
	.word	0xa1418000	! t0_kref+0x2488:   	mov	%fprs, %l0
	.word	0xa9a0102f	! t0_kref+0x248c:   	fstox	%f15, %f20
	.word	0xea16200a	! t0_kref+0x2490:   	lduh	[%i0 + 0xa], %l5
	.word	0xa5a20d28	! t0_kref+0x2494:   	fsmuld	%f8, %f8, %f18
	.word	0xf007bfe0	! t0_kref+0x2498:   	ld	[%fp - 0x20], %i0
	.word	0xa9400000	! t0_kref+0x249c:   	mov	%y, %l4
	.word	0x81ab8a4c	! t0_kref+0x24a0:   	fcmpd	%fcc0, %f14, %f12
	.word	0x86102003	! t0_kref+0x24a4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x24a8:   	bne,a	_kref+0x24a8
	.word	0x86a0e001	! t0_kref+0x24ac:   	subcc	%g3, 1, %g3
	.word	0xe0567ffe	! t0_kref+0x24b0:   	ldsh	[%i1 - 2], %l0
	.word	0xaba0052a	! t0_kref+0x24b4:   	fsqrts	%f10, %f21
	.word	0xea164000	! t0_kref+0x24b8:   	lduh	[%i1], %l5
	.word	0x9fc10000	! t0_kref+0x24bc:   	call	%g4
	.word	0xa2d24008	! t0_kref+0x24c0:   	umulcc	%o1, %o0, %l1
	.word	0xa1a00533	! t0_kref+0x24c4:   	fsqrts	%f19, %f16
	.word	0xaaf6c017	! t0_kref+0x24c8:   	udivcc	%i3, %l7, %l5
	.word	0xa0934012	! t0_kref+0x24cc:   	orcc	%o5, %l2, %l0
	.word	0xe828a03a	! t0_kref+0x24d0:   	stb	%l4, [%g2 + 0x3a]
	.word	0xe8066014	! t0_kref+0x24d4:   	ld	[%i1 + 0x14], %l4
	.word	0xa4aa0013	! t0_kref+0x24d8:   	andncc	%o0, %l3, %l2
	.word	0xa7a00529	! t0_kref+0x24dc:   	fsqrts	%f9, %f19
	.word	0xc807bfe4	! t0_kref+0x24e0:   	ld	[%fp - 0x1c], %g4
	.word	0xe0567fe2	! t0_kref+0x24e4:   	ldsh	[%i1 - 0x1e], %l0
	.word	0xa2d26488	! t0_kref+0x24e8:   	umulcc	%o1, 0x488, %l1
	.word	0x81acca30	! t0_kref+0x24ec:   	fcmps	%fcc0, %f19, %f16
	.word	0xa40de52d	! t0_kref+0x24f0:   	and	%l7, 0x52d, %l2
	.word	0xa8acc00d	! t0_kref+0x24f4:   	andncc	%l3, %o5, %l4
	.word	0xe2263fe4	! t0_kref+0x24f8:   	st	%l1, [%i0 - 0x1c]
	.word	0xa9a9402e	! t0_kref+0x24fc:   	fmovsug	%fcc0, %f14, %f20
	.word	0xaa14001a	! t0_kref+0x2500:   	or	%l0, %i2, %l5
	.word	0xa9a000ab	! t0_kref+0x2504:   	fnegs	%f11, %f20
	.word	0xa6f50008	! t0_kref+0x2508:   	udivcc	%l4, %o0, %l3
	.word	0x21480003	! t0_kref+0x250c:   	fbn,a,pt	%fcc0, _kref+0x2518
	.word	0xa13c801b	! t0_kref+0x2510:   	sra	%l2, %i3, %l0
	.word	0x95a01a52	! t0_kref+0x2514:   	fdtoi	%f18, %f10
	.word	0xee68a03b	! t0_kref+0x2518:   	ldstub	[%g2 + 0x3b], %l7
	call	SYM(t0_subr2)
	.word	0xe228a001	! t0_kref+0x2520:   	stb	%l1, [%g2 + 1]
	.word	0xd028a017	! t0_kref+0x2524:   	stb	%o0, [%g2 + 0x17]
	.word	0xaa0cfd2c	! t0_kref+0x2528:   	and	%l3, -0x2d4, %l5
	.word	0xe400a004	! t0_kref+0x252c:   	ld	[%g2 + 4], %l2
	.word	0x23151ae9	! t0_kref+0x2530:   	sethi	%hi(0x546ba400), %l1
	.word	0xe9beda58	! t0_kref+0x2534:   	stda	%f20, [%i3 + %i0]0xd2
	.word	0x95a20850	! t0_kref+0x2538:   	faddd	%f8, %f16, %f10
	.word	0x81ad4ab4	! t0_kref+0x253c:   	fcmpes	%fcc0, %f21, %f20
	.word	0xe40861c0	! t0_kref+0x2540:   	ldub	[%g1 + 0x1c0], %l2
	.word	0xa41ca00c	! t0_kref+0x2544:   	xor	%l2, 0xc, %l2
	.word	0xe42861c0	! t0_kref+0x2548:   	stb	%l2, [%g1 + 0x1c0]
	.word	0x81d861c0	! t0_kref+0x254c:   	flush	%g1 + 0x1c0
	.word	0xab243121	! t0_kref+0x2550:   	mulscc	%l0, -0xedf, %l5
	.word	0xaa16c00c	! t0_kref+0x2554:   	or	%i3, %o4, %l5
	.word	0xc3ee5014	! t0_kref+0x2558:   	prefetcha	%i1 + %l4, 1
2:	.word	0x93a000a9	! t0_kref+0x255c:   	fnegs	%f9, %f9
	.word	0xe6560000	! t0_kref+0x2560:   	ldsh	[%i0], %l3
	.word	0x86102002	! t0_kref+0x2564:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x2568:   	bne,a	_kref+0x2568
	.word	0x86a0e001	! t0_kref+0x256c:   	subcc	%g3, 1, %g3
	.word	0xa8150011	! t0_kref+0x2570:   	or	%l4, %l1, %l4
	.word	0xc1ee1010	! t0_kref+0x2574:   	prefetcha	%i0 + %l0, 0
	.word	0xa2623a3a	! t0_kref+0x2578:   	subc	%o0, -0x5c6, %l1
	.word	0xa034ab94	! t0_kref+0x257c:   	orn	%l2, 0xb94, %l0
	.word	0xd43e6010	! t0_kref+0x2580:   	std	%o2, [%i1 + 0x10]
	.word	0x95a30d2c	! t0_kref+0x2584:   	fsmuld	%f12, %f12, %f10
	.word	0x81abcaae	! t0_kref+0x2588:   	fcmpes	%fcc0, %f15, %f14
	.word	0xa5408000	! t0_kref+0x258c:   	mov	%ccr, %l2
	.word	0x26800002	! t0_kref+0x2590:   	bl,a	_kref+0x2598
	.word	0xa8ab0016	! t0_kref+0x2594:   	andncc	%o4, %l6, %l4
	.word	0xa3a000ad	! t0_kref+0x2598:   	fnegs	%f13, %f17
	.word	0xa89c8010	! t0_kref+0x259c:   	xorcc	%l2, %l0, %l4
	.word	0xa5a00530	! t0_kref+0x25a0:   	fsqrts	%f16, %f18
	.word	0xd6266008	! t0_kref+0x25a4:   	st	%o3, [%i1 + 8]
	.word	0xe5ee501c	! t0_kref+0x25a8:   	prefetcha	%i1 + %i4, 18
	.word	0xa72c4014	! t0_kref+0x25ac:   	sll	%l1, %l4, %l3
	.word	0xe3062014	! t0_kref+0x25b0:   	ld	[%i0 + 0x14], %f17
	.word	0xa0254010	! t0_kref+0x25b4:   	sub	%l5, %l0, %l0
	.word	0x9de3bfa0	! t0_kref+0x25b8:   	save	%sp, -0x60, %sp
	.word	0xb0dec000	! t0_kref+0x25bc:   	smulcc	%i3, %g0, %i0
	.word	0xa1e80000	! t0_kref+0x25c0:   	restore	%g0, %g0, %l0
	.word	0x81df0015	! t0_kref+0x25c4:   	flush	%i4 + %l5
	.word	0xeace9018	! t0_kref+0x25c8:   	ldsba	[%i2 + %i0]0x80, %l5
	.word	0xe4066004	! t0_kref+0x25cc:   	ld	[%i1 + 4], %l2
	.word	0xa6f57382	! t0_kref+0x25d0:   	udivcc	%l5, -0xc7e, %l3
	.word	0xd4f81018	! t0_kref+0x25d4:   	swapa	[%g0 + %i0]0x80, %o2
	.word	0xa616f281	! t0_kref+0x25d8:   	or	%i3, -0xd7f, %l3
	.word	0x9f414000	! t0_kref+0x25dc:   	mov	%pc, %o7
	.word	0x81ad0a52	! t0_kref+0x25e0:   	fcmpd	%fcc0, %f20, %f18
	.word	0x9fa01892	! t0_kref+0x25e4:   	fitos	%f18, %f15
	.word	0xa31c000d	! t0_kref+0x25e8:   	tsubcctv	%l0, %o5, %l1
	.word	0xa71c4011	! t0_kref+0x25ec:   	tsubcctv	%l1, %l1, %l3
	.word	0xa2f2b791	! t0_kref+0x25f0:   	udivcc	%o2, -0x86f, %l1
	.word	0xa0e40000	! t0_kref+0x25f4:   	subccc	%l0, %g0, %l0
	.word	0xa1a308b4	! t0_kref+0x25f8:   	fsubs	%f12, %f20, %f16
	.word	0xf420a01c	! t0_kref+0x25fc:   	st	%i2, [%g2 + 0x1c]
	.word	0xab400000	! t0_kref+0x2600:   	mov	%y, %l5
	.word	0xa325b2a4	! t0_kref+0x2604:   	mulscc	%l6, -0xd5c, %l1
	.word	0xe0062008	! t0_kref+0x2608:   	ld	[%i0 + 8], %l0
	.word	0xe4063fec	! t0_kref+0x260c:   	ld	[%i0 - 0x14], %l2
	.word	0xe06e6007	! t0_kref+0x2610:   	ldstub	[%i1 + 7], %l0
	.word	0x9da209cc	! t0_kref+0x2614:   	fdivd	%f8, %f12, %f14
	.word	0x291da37a	! t0_kref+0x2618:   	sethi	%hi(0x768de800), %l4
	.word	0xa5a5092e	! t0_kref+0x261c:   	fmuls	%f20, %f14, %f18
	.word	0xe13f4018	! t0_kref+0x2620:   	std	%f16, [%i5 + %i0]
	.word	0xa2f27fa6	! t0_kref+0x2624:   	udivcc	%o1, -0x5a, %l1
	.word	0xe2063ff0	! t0_kref+0x2628:   	ld	[%i0 - 0x10], %l1
	.word	0x22480001	! t0_kref+0x262c:   	be,a,pt	%icc, _kref+0x2630
	.word	0xc0263ff4	! t0_kref+0x2630:   	clr	[%i0 - 0xc]
	.word	0xa4637c0e	! t0_kref+0x2634:   	subc	%o5, -0x3f2, %l2
	.word	0xe300a010	! t0_kref+0x2638:   	ld	[%g2 + 0x10], %f17
	.word	0x22800002	! t0_kref+0x263c:   	be,a	_kref+0x2644
	.word	0xd26e6012	! t0_kref+0x2640:   	ldstub	[%i1 + 0x12], %o1
	.word	0xeca71018	! t0_kref+0x2644:   	sta	%l6, [%i4 + %i0]0x80
	.word	0xa7418000	! t0_kref+0x2648:   	mov	%fprs, %l3
	.word	0x28800002	! t0_kref+0x264c:   	bleu,a	_kref+0x2654
	.word	0xa4f565f8	! t0_kref+0x2650:   	udivcc	%l5, 0x5f8, %l2
	.word	0xa32322a6	! t0_kref+0x2654:   	mulscc	%o4, 0x2a6, %l1
	.word	0x97a01a2b	! t0_kref+0x2658:   	fstoi	%f11, %f11
	.word	0xa2b2b31e	! t0_kref+0x265c:   	orncc	%o2, -0xce2, %l1
	.word	0xe830a03c	! t0_kref+0x2660:   	sth	%l4, [%g2 + 0x3c]
	.word	0xa7344012	! t0_kref+0x2664:   	srl	%l1, %l2, %l3
	.word	0xaa0ebbe4	! t0_kref+0x2668:   	and	%i2, -0x41c, %l5
	.word	0xe46e4000	! t0_kref+0x266c:   	ldstub	[%i1], %l2
	.word	0xa46368c4	! t0_kref+0x2670:   	subc	%o5, 0x8c4, %l2
	.word	0xa4b54017	! t0_kref+0x2674:   	orncc	%l5, %l7, %l2
	.word	0xc398a040	! t0_kref+0x2678:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x97a00132	! t0_kref+0x267c:   	fabss	%f18, %f11
	.word	0xaa302630	! t0_kref+0x2680:   	orn	%g0, 0x630, %l5
	.word	0x23480003	! t0_kref+0x2684:   	fbne,a,pt	%fcc0, _kref+0x2690
	.word	0xa8b40008	! t0_kref+0x2688:   	orncc	%l0, %o0, %l4
	.word	0xa22dc017	! t0_kref+0x268c:   	andn	%l7, %l7, %l1
	.word	0xa0e6ec23	! t0_kref+0x2690:   	subccc	%i3, 0xc23, %l0
	.word	0xf207bfe0	! t0_kref+0x2694:   	ld	[%fp - 0x20], %i1
	.word	0xea06401c	! t0_kref+0x2698:   	ld	[%i1 + %i4], %l5
	.word	0xa1400000	! t0_kref+0x269c:   	mov	%y, %l0
	.word	0x29480004	! t0_kref+0x26a0:   	fbl,a,pt	%fcc0, _kref+0x26b0
	.word	0xa0dab98b	! t0_kref+0x26a4:   	smulcc	%o2, -0x675, %l0
	.word	0xea48a00c	! t0_kref+0x26a8:   	ldsb	[%g2 + 0xc], %l5
	.word	0xd01e2008	! t0_kref+0x26ac:   	ldd	[%i0 + 8], %o0
	.word	0xe408632c	! t0_kref+0x26b0:   	ldub	[%g1 + 0x32c], %l2
	.word	0xa41ca00c	! t0_kref+0x26b4:   	xor	%l2, 0xc, %l2
	.word	0xe428632c	! t0_kref+0x26b8:   	stb	%l2, [%g1 + 0x32c]
	.word	0x81d8632c	! t0_kref+0x26bc:   	flush	%g1 + 0x32c
	.word	0xe6264000	! t0_kref+0x26c0:   	st	%l3, [%i1]
	.word	0xa066e980	! t0_kref+0x26c4:   	subc	%i3, 0x980, %l0
2:	.word	0xa4db2c95	! t0_kref+0x26c8:   	smulcc	%o4, 0xc95, %l2
	.word	0xda20a02c	! t0_kref+0x26cc:   	st	%o5, [%g2 + 0x2c]
	.word	0x81aa8a4a	! t0_kref+0x26d0:   	fcmpd	%fcc0, %f10, %f10
	.word	0x20480001	! t0_kref+0x26d4:   	bn,a,pt	%icc, _kref+0x26d8
	.word	0xa6b5c014	! t0_kref+0x26d8:   	orncc	%l7, %l4, %l3
	.word	0xa4b58000	! t0_kref+0x26dc:   	orncc	%l6, %g0, %l2
	.word	0xa2f54013	! t0_kref+0x26e0:   	udivcc	%l5, %l3, %l1
	.word	0xe4060000	! t0_kref+0x26e4:   	ld	[%i0], %l2
	.word	0xa533200c	! t0_kref+0x26e8:   	srl	%o4, 0xc, %l2
	.word	0xaa76b5b5	! t0_kref+0x26ec:   	udiv	%i2, -0xa4b, %l5
	.word	0xea260000	! t0_kref+0x26f0:   	st	%l5, [%i0]
	.word	0xab3d4012	! t0_kref+0x26f4:   	sra	%l5, %l2, %l5
	.word	0x8143e040	! t0_kref+0x26f8:   	membar	0x40
	.word	0xa526edb3	! t0_kref+0x26fc:   	mulscc	%i3, 0xdb3, %l2
	.word	0xa9a0052d	! t0_kref+0x2700:   	fsqrts	%f13, %f20
	.word	0x97a2c9b6	! t0_kref+0x2704:   	fdivs	%f11, %f22, %f11
	.word	0xaa2d8016	! t0_kref+0x2708:   	andn	%l6, %l6, %l5
	.word	0xa695800a	! t0_kref+0x270c:   	orcc	%l6, %o2, %l3
	.word	0x3e800003	! t0_kref+0x2710:   	bvc,a	_kref+0x271c
	.word	0xe19e5a5c	! t0_kref+0x2714:   	ldda	[%i1 + %i4]0xd2, %f16
	.word	0xe4567ff0	! t0_kref+0x2718:   	ldsh	[%i1 - 0x10], %l2
	.word	0x99a00535	! t0_kref+0x271c:   	fsqrts	%f21, %f12
	.word	0x3b480004	! t0_kref+0x2720:   	fble,a,pt	%fcc0, _kref+0x2730
	.word	0xa6d5c00b	! t0_kref+0x2724:   	umulcc	%l7, %o3, %l3
	.word	0xa7a388b2	! t0_kref+0x2728:   	fsubs	%f14, %f18, %f19
	.word	0xd2680019	! t0_kref+0x272c:   	ldstub	[%g0 + %i1], %o1
	.word	0xa065c012	! t0_kref+0x2730:   	subc	%l7, %l2, %l0
	.word	0xdf070019	! t0_kref+0x2734:   	ld	[%i4 + %i1], %f15
	.word	0x3b480007	! t0_kref+0x2738:   	fble,a,pt	%fcc0, _kref+0x2754
	.word	0xa4080000	! t0_kref+0x273c:   	and	%g0, %g0, %l2
	.word	0x9da000ab	! t0_kref+0x2740:   	fnegs	%f11, %f14
	.word	0x01000000	! t0_kref+0x2744:   	nop
	.word	0x01000000	! t0_kref+0x2748:   	nop
	.word	0x01000000	! t0_kref+0x274c:   	nop
	.word	0x01000000	! t0_kref+0x2750:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x2758:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x1e408000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x1d604000)
.seg "text"
t0_subr1_page_begin:
	.skip 8184
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x0c73a000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x0c544000)
.seg "text"
t0_subr3_page_begin:
	.skip 8152
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
!  Total operations: 2436  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.14   1.19
!  ldub              0.32   0.49
!  ldsh              1.07   1.19
!  lduh              1.39   1.56
!  ld                1.08   1.68
!  ldd               0.38   0.49
!  swap              1.43   1.07
!  ldstub            1.42   1.52
!  stb               0.64   0.37
!  sth               0.06   0.00
!  st                0.97   1.15
!  std               0.25   0.45
!  add               0.04   0.08
!  addcc             0.27   0.08
!  addx              0.25   0.25
!  addxcc            0.10   0.16
!  taddcc            0.06   0.04
!  taddcctv          0.08   0.04
!  sub               1.15   1.60
!  subcc             0.55   0.70
!  subx              1.13   1.77
!  subxcc            1.31   1.48
!  tsubcc            0.04   0.04
!  tsubcctv          0.26   0.49
!  mulscc            1.18   1.60
!  and               1.41   1.56
!  andcc             0.08   0.08
!  andn              1.49   1.15
!  andncc            1.48   1.35
!  or                1.05   0.74
!  orcc              1.08   1.35
!  orn               0.47   0.45
!  orncc             1.09   1.07
!  xor               0.22   0.21
!  xorcc             0.78   0.99
!  xnor              0.76   0.70
!  xnorcc            0.65   0.53
!  sll               0.91   0.94
!  srl               1.00   1.03
!  sra               1.49   1.68
!  unimp             0.23   0.21
!  umul              1.05   0.78
!  smul              1.35   1.64
!  udiv              1.17   1.35
!  sdiv              0.60   0.66
!  umulcc            1.33   1.35
!  smulcc            0.17   0.25
!  udivcc            1.26   0.94
!  sdivcc            0.46   0.49
!  rdy               1.16   1.31
!  wry               0.82   0.57
!  bicc              2.36   2.30
!  sethi             1.37   1.23
!  jmpl              0.55   0.25
!  call              0.53   0.29
!  ticc              0.00   0.00
!  flush             1.04   1.27
!  save              1.00   0.53
!  restore           1.50   0.00
!  stbar             0.08   0.04
!  ldf               0.91   1.03
!  lddf              0.11   0.12
!  stf               0.92   1.07
!  stdf              0.27   0.25
!  fadds             1.03   0.78
!  fsubs             0.45   0.70
!  fmuls             0.76   1.03
!  fdivs             0.57   0.82
!  faddd             0.44   0.25
!  fsubd             0.10   0.12
!  fmuld             0.04   0.04
!  fdivd             0.52   0.53
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.33   1.68
!  fdmulq            0.00   0.00
!  fitos             0.39   0.53
!  fitod             1.45   1.52
!  fitoq             0.00   0.00
!  fstoi             1.27   1.27
!  fstod             1.04   1.19
!  fstoq             0.00   0.00
!  fdtoi             1.49   1.68
!  fdtos             0.37   0.21
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.29   0.37
!  fnegs             0.96   1.23
!  fabss             0.44   0.41
!  fsqrts            2.50   2.75
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.92   1.07
!  fcmpd             1.45   1.23
!  fcmpq             0.00   0.00
!  fcmpes            1.17   1.19
!  fcmped            0.12   0.12
!  fcmpeq            0.00   0.00
!  fbfcc             0.24   0.04
!  ldfsr             0.26   0.00
!  stfsr             0.23   0.08
!  loop              0.59   0.25
!  offset            0.03   0.16
!  area              0.18   0.25
!  target            0.18   0.29
!  goto              0.22   0.08
!  sigsegv           0.06   0.04
!  sigbus            0.19   0.25
!  imodify           1.12   0.53
!  ldfsr_offset      0.02   0.00
!  fpattern          0.14   0.21
!  lbranch           0.20   0.04
!  shmld             3.64   3.16
!  shmst             3.57   4.11
!  shmpf             0.58   0.82
!  shmswap           0.28   0.29
!  shmblkld          0.09   0.12
!  shmblkst          0.24   0.33
!  shmblkchk         0.21   0.21
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
!  casa              0.03   0.04
!  rdasi             0.04   0.08
!  wrasi             0.11   0.00
!  bpcc              3.78   2.75
!  fbpfcc            3.69   3.20
!  fmovscc           0.26   0.33
!  fmovdcc           0.03   0.04
!  fmovqcc           0.00   0.00
!  movcc             0.01   0.00
!  flushw            0.15   0.21
!  membar            0.01   0.00
!  prefetch          1.15   1.35
!  rdpc              0.29   0.29
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.14   0.16
!  lddfa             0.21   0.29
!  ldqfa             0.00   0.00
!  ldsba             0.20   0.29
!  ldsha             0.07   0.08
!  lduba             0.07   0.12
!  lduha             0.19   0.29
!  lda               0.08   0.16
!  ldda              0.19   0.33
!  ldstuba           0.16   0.21
!  prefetcha         1.32   1.64
!  stfa              0.21   0.12
!  stdfa             0.08   0.04
!  stqfa             0.00   0.00
!  stba              0.29   0.25
!  stha              0.00   0.00
!  sta               0.12   0.21
!  stda              0.04   0.00
!  swapa             0.14   0.16
!  fmovd             0.03   0.00
!  fnegd             0.26   0.33
!  fabsd             0.09   0.04
!  fstox             0.16   0.16
!  fdtox             0.05   0.00
!  fxtos             0.13   0.25
!  fxtod             0.05   0.04
!  lds               0.27   0.25
!  ldsa              0.01   0.00
!  ldx               0.24   0.16
!  ldxa              0.28   0.16
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
!  partial_st8       0.25   0.33
!  partial_st16      0.02   0.04
!  partial_st32      0.12   0.08
!  short_st8         0.23   0.37
!  short_st16        0.16   0.12
!  short_ld8         0.26   0.25
!  short_ld16        0.28   0.12
!  blkld             0.04   0.00
!  blkst             0.29   0.00
!  blkld_offset      0.20   0.00
!  blkst_offset      0.10   0.00
!  blk_check         0.18   0.08
!  casxa             0.01   0.04
!  rdccr             0.16   0.25
!  rdfprs            0.26   0.45
!  wrccr             0.02   0.04
!  popc              0.22   0.25
!  wrfprs            0.07   0.00
!  stx               0.10   0.12
!  stxa              0.21   0.12
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
KDATA_MODULE(t0_module_offset_table, 0x35072000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000010
	.word	0xffffffe0
	.word	0xffffffe8
	.word	0x00000008
	.word	0xfffffff0
	.word	0xfffffff8
	.word	0x00000018
	.word	0x00000000
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

KDATA_MODULE(t0_module_data_in_regs, 0x0ee86000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x9027ce5d          ! %f0
	.word	0xb6942f98          ! %f1
	.word	0x5c13cc66          ! %f2
	.word	0xfa619bed          ! %f3
	.word	0x9902dbf2          ! %f4
	.word	0x4ae032a0          ! %f5
	.word	0x20fe5d2c          ! %f6
	.word	0xcefd3d01          ! %f7
	.word	0x697d4a58          ! %f8
	.word	0xd59b0aac          ! %f9
	.word	0x9311662b          ! %f10
	.word	0x319e19c4          ! %f11
	.word	0x2fda952b          ! %f12
	.word	0xed50a7f8          ! %f13
	.word	0x365037bc          ! %f14
	.word	0x442f94ee          ! %f15
	.word	0x35b7b6cc          ! %f16
	.word	0x81f745cf          ! %f17
	.word	0xcbfecb39          ! %f18
	.word	0xdadc72fb          ! %f19
	.word	0x8f28e865          ! %f20
	.word	0xa2cdc440          ! %f21
	.word	0x20d5ac9b          ! %f22
	.word	0x8742acfb          ! %f23
	.word	0xa2a4de2a          ! %f24
	.word	0x3c596911          ! %f25
	.word	0x66585a64          ! %f26
	.word	0x5a911ca6          ! %f27
	.word	0x72b103e2          ! %f28
	.word	0x76ca3bf3          ! %f29
	.word	0xa6573fbf          ! %f30
	.word	0xabcb55b3          ! %f31
	.word	0x2f767da5          ! %f32
	.word	0x3dcc71f7          ! %f33
	.word	0x6494ace4          ! %f34
	.word	0xd6614069          ! %f35
	.word	0x6a9ff0e7          ! %f36
	.word	0x60409c40          ! %f37
	.word	0xc01671c1          ! %f38
	.word	0x820d4975          ! %f39
	.word	0x3f5c59b4          ! %f40
	.word	0xb7bb8dfa          ! %f41
	.word	0xc223fed6          ! %f42
	.word	0xa0c53afe          ! %f43
	.word	0x4b63703d          ! %f44
	.word	0x304a2d8a          ! %f45
	.word	0x8e8b3060          ! %f46
	.word	0x47b712f6          ! %f47
	.word	0xa89c6292          ! %f48
	.word	0x1804a506          ! %f49
	.word	0xc5c427b9          ! %f50
	.word	0xce0c6ab3          ! %f51
	.word	0x69cfe6b0          ! %f52
	.word	0x46bfa5e7          ! %f53
	.word	0x302ed6fe          ! %f54
	.word	0xf4c443bd          ! %f55
	.word	0xebdae8be          ! %f56
	.word	0xd7e1b3fd          ! %f57
	.word	0x302b22f2          ! %f58
	.word	0x1f9c4de9          ! %f59
	.word	0x98675993          ! %f60
	.word	0xf64daba2          ! %f61
	.word	0x1976bf21          ! %f62
	.word	0x04fffaa6          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x4a8       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xccc415b6          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x078e3b51          ! %o0
	.word	0xe0f3e4ef          ! %o1
	.word	0x74ab5468          ! %o2
	.word	0xcfc4afc4          ! %o3
	.word	0xd4e4c77f          ! %o4
	.word	0xdebf6860          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x4384e17c          ! %l0
	.word	0xabb2f732          ! %l1
	.word	0x654a2848          ! %l2
	.word	0x7384f196          ! %l3
	.word	0xe2d37b3b          ! %l4
	.word	0x84a727ba          ! %l5
	.word	0x6e6060f3          ! %l6
	.word	0x73e1ba60          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xffffffef          ! %i2 (byte offset)
	.word	0xffffffe8          ! %i3 (halfword offset)
	.word	0x00000004          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xc83103c3          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0x40000f2a          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x365ca000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xb33a8847
	.word	0xd3967b3e
	.word	0xc66d2a28
	.word	0xf72efdf2
	.word	0xb3d4dc18
	.word	0xbe17f25d
	.word	0x19a567b6
	.word	0xca8f5635
	.word	0xc15c18cc
	.word	0x9b2e1929
	.word	0xf5d7e076
	.word	0x2b457b32
	.word	0xb2db2d68
	.word	0xb6662ffd
	.word	0x425c58bb
	.word	0x929bd6a3
	.word	0xfcbe58ee
	.word	0xc9ca5a40
	.word	0x336c28fc
	.word	0x21ec7730
	.word	0x765907bb
	.word	0x2cf8b9fa
	.word	0xde2ff3d8
	.word	0x41af2828
	.word	0xae21a330
	.word	0x125830a9
	.word	0x48e4385a
	.word	0x2b24d06e
	.word	0x9fe83794
	.word	0xdb97d955
	.word	0xcf3e447d
	.word	0x62e54cb1
	.word	0x95371439
	.word	0x4be38fe2
	.word	0x4dcf4bf2
	.word	0x2d3438df
	.word	0x295ac9dc
	.word	0xaa0919a4
	.word	0xcebba720
	.word	0x4a545cda
	.word	0xba812b51
	.word	0x946ec338
	.word	0xb2f87e6b
	.word	0xc858b06c
	.word	0xc635345f
	.word	0x45758791
	.word	0x5da265b8
	.word	0x9c6d2a78
	.word	0xb377fae8
	.word	0x8dee1451
	.word	0xcf23ac31
	.word	0x9e80cf73
	.word	0xae150e4d
	.word	0xade93f59
	.word	0xfc096445
	.word	0xc2ddb311
	.word	0x67d2e910
	.word	0x17a1c1a3
	.word	0xdbd267f2
	.word	0x4cd2e142
	.word	0xab0658ba
	.word	0xc5c64b4e
	.word	0x8ef3dd46
	.word	0xaf5f625f
	.word	0xa119fffe
	.word	0x334844fa
	.word	0xb502ff22
	.word	0xd40ccea0
	.word	0xe509571e
	.word	0xd044d256
	.word	0x44ac2e41
	.word	0x301b24d2
	.word	0xefe0ce8d
	.word	0x7ae2e9f6
	.word	0x5b1b8e78
	.word	0x0406d845
	.word	0x0a4af7d5
	.word	0x955a9669
	.word	0x77fbb43f
	.word	0x248d4a0a
	.word	0xbc4cd8ba
	.word	0xa906b48a
	.word	0x2a73266f
	.word	0xfde3215e
	.word	0x21d1cc9f
	.word	0x92a3c316
	.word	0x0ad1b84c
	.word	0x15133760
	.word	0xa9c99829
	.word	0x3af3977f
	.word	0xf82affc6
	.word	0x07b40a0a
	.word	0x8ca19322
	.word	0x3a270bff
	.word	0x712b6bfb
	.word	0x0a8cea5e
	.word	0xd00c0c9f
	.word	0x20ebfaef
	.word	0xc849c000
	.word	0xbba359df
	.word	0x77974d63
	.word	0xc10f1b58
	.word	0x2d4ef5e1
	.word	0x06bc4b42
	.word	0xadc7dc85
	.word	0xc68692ca
	.word	0x9d4acde5
	.word	0x13e43a65
	.word	0x467fea51
	.word	0x69b3506c
	.word	0xceab8e16
	.word	0x294c4f80
	.word	0x23b8056c
	.word	0x79f48554
	.word	0xf593b5ff
	.word	0xf3fa0199
	.word	0x4f2b7e3a
	.word	0x8589ce18
	.word	0x9cf0aab7
	.word	0x60a9ec3d
	.word	0x38dd1c83
	.word	0x5e75e1a5
	.word	0xe7819f1e
	.word	0x971dcc6c
	.word	0x917f0b54
	.word	0xa4dcd94e
	.word	0xf92e3c66
	.word	0x8118d8d4
	.word	0xe3131f23
	.word	0xa3766627
	.word	0x7100ced5
	.word	0xbacce942
	.word	0xf7c6da36
	.word	0x8b5d8794
	.word	0x270ffac8
	.word	0xbfae2155
	.word	0x9160d344
	.word	0xaf0c971c
	.word	0x7be03dfa
	.word	0x73ca1274
	.word	0x10cb625c
	.word	0x89edbd82
	.word	0xa085c106
	.word	0xda1a8901
	.word	0xbfa2b805
	.word	0x47d52516
	.word	0x4c533d2a
	.word	0x5b1b78ce
	.word	0x236ac2a6
	.word	0xcf3b7d48
	.word	0x4e6afa4d
	.word	0xa76ebcd0
	.word	0x6d738628
	.word	0x8f64a37d
	.word	0x8b532942
	.word	0x27cf9e11
	.word	0xf1b8c9d9
	.word	0x1a078525
	.word	0x00ff1e4e
	.word	0x694355eb
	.word	0xec744093
	.word	0xcbc98f0d
	.word	0xe2d32fe7
	.word	0xd992ff72
	.word	0x7fe78f1c
	.word	0xf9313df1
	.word	0x4b413dbe
	.word	0xf7eeac32
t0_data_in_sp:
	.word	0x1c55d4d0
	.word	0x93d8a455
	.word	0x2df823ff
	.word	0x4f609019
	.word	0xb97a9a7d
	.word	0x6ee1f994
	.word	0x74809ed7
	.word	0xcfb278b6
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffffb
	.word	0x00000010
	.word	0x00000018
	.word	0xfffffff0
	.word	t0_data_in_fp
	.word	0x5d71818c
	.word	0x8bb469d6
	.word	0x180b4840
	.word	0xf3a3891d
	.word	0x6089b470
	.word	0x7ef7c57b
	.word	0xb7fce8a1
	.word	0x30ffbb38
	.word	0x9dddf56c
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
	.word   	0xc86c657b	! [%fp - 0xc]
	.word   	0xf98bbdc9	! [%fp - 0x8]
	.word   	0x32159df6	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x9cbbd206
	.word	0x49ebab80
	.word	0x687d9317
	.word	0x945861a0
	.word	0x00f0f957
	.word	0x4d6cc38c
	.word	0xf9eda500
	.word	0xc172a731
	.word	0xe8f93bdb
	.word	0xa1e3093d
	.word	0x78a8d6fe
	.word	0x3ff2b13d
	.word	0xc56c3489
	.word	0x1146fd51
	.word	0xa142d4c7
	.word	0x580e3f0e
	.word	0xb473ef23
	.word	0x18fa8f6d
	.word	0xb7bf92c2
	.word	0x1926760f
	.word	0x3ed71fce
	.word	0x2981c019
	.word	0x5e6fe1b6
	.word	0x44567d6d
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x76c50000)
.seg "data"
t0_data_in_area0_start:
.skip 5376
t0_data_in_area0_begin:
	.word	0x09b6bfe5	! t0_data_in_area0-0x20
	.word	0x1a94df0f	! t0_data_in_area0-0x1c
	.word	0xc45709c4	! t0_data_in_area0-0x18
	.word	0xc7ddaffa	! t0_data_in_area0-0x14
	.word	0x81c82409	! t0_data_in_area0-0x10
	.word	0xf521e9b5	! t0_data_in_area0-0xc
	.word	0x7c5aa097	! t0_data_in_area0-0x8
	.word	0xe8e08855	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xdfd1df7c	! t0_data_in_area0+0x0
	.word	0x7a26cde6	! t0_data_in_area0+0x4
	.word	0x84dd0ed9	! t0_data_in_area0+0x8
	.word	0xf309ab48	! t0_data_in_area0+0xc
	.word	0xebc308af	! t0_data_in_area0+0x10
	.word	0xaba694f8	! t0_data_in_area0+0x14
	.word	0xfc7678e8	! t0_data_in_area0+0x18
	.word	0xea46b470	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 2752
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x2919a000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x2921b319	! t0_data_in_shm_area+0x0 (t0)
	.word	0x2097bafa	! t0_data_in_shm_area+0x4 (t0)
	.word	0x6b86fec9	! t0_data_in_shm_area+0x8 (t0)
	.word	0xd072a923	! t0_data_in_shm_area+0xc (t0)
	.word	0x4606b249	! t0_data_in_shm_area+0x10 (t0)
	.word	0xa5ca363d	! t0_data_in_shm_area+0x14 (t0)
	.word	0x5698875c	! t0_data_in_shm_area+0x18 (t0)
	.word	0x417a358d	! t0_data_in_shm_area+0x1c (t0)
	.word	0xbaa9fa3e	! t0_data_in_shm_area+0x20 (t0)
	.word	0xf0a7f315	! t0_data_in_shm_area+0x24 (t0)
	.word	0x5a358ad1	! t0_data_in_shm_area+0x28 (t0)
	.word	0x82a4181c	! t0_data_in_shm_area+0x2c (t0)
	.word	0x13e430f6	! t0_data_in_shm_area+0x30 (t0)
	.word	0x4d9ac7e0	! t0_data_in_shm_area+0x34 (t0)
	.word	0x713d905a	! t0_data_in_shm_area+0x38 (t0)
	.word	0x576a5f1e	! t0_data_in_shm_area+0x3c (t0)
	.word	0xcc3f4544	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xd70f2547	! t0_data_in_shm_area+0x44
	.word	0x42175322	! t0_data_in_shm_area+0x48
	.word	0x95f75ca7	! t0_data_in_shm_area+0x4c
	.word	0x56791ee6	! t0_data_in_shm_area+0x50
	.word	0x03bb06c3	! t0_data_in_shm_area+0x54
	.word	0xa0abc27c	! t0_data_in_shm_area+0x58
	.word	0x492374b7	! t0_data_in_shm_area+0x5c
	.word	0xdef8bbd6	! t0_data_in_shm_area+0x60
	.word	0x1f44e763	! t0_data_in_shm_area+0x64
	.word	0x8a14515f	! t0_data_in_shm_area+0x68
	.word	0x4bff299c	! t0_data_in_shm_area+0x6c
	.word	0xb0e74ee0	! t0_data_in_shm_area+0x70
	.word	0x6fdebecb	! t0_data_in_shm_area+0x74
	.word	0x1e9a4912	! t0_data_in_shm_area+0x78
	.word	0x75c70a95	! t0_data_in_shm_area+0x7c
	.word	0x4ca43374	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x92254a7f	! t0_data_in_shm_area+0x84
	.word	0xde4c1323	! t0_data_in_shm_area+0x88
	.word	0x4ad568b8	! t0_data_in_shm_area+0x8c
	.word	0x6163cabd	! t0_data_in_shm_area+0x90
	.word	0xa2d42761	! t0_data_in_shm_area+0x94
	.word	0x3748ae9d	! t0_data_in_shm_area+0x98
	.word	0x81fff615	! t0_data_in_shm_area+0x9c
	.word	0xa03695f1	! t0_data_in_shm_area+0xa0
	.word	0x97e37f78	! t0_data_in_shm_area+0xa4
	.word	0x4a30c479	! t0_data_in_shm_area+0xa8
	.word	0xb40db31a	! t0_data_in_shm_area+0xac
	.word	0xf4b721ea	! t0_data_in_shm_area+0xb0
	.word	0x28ac4ff2	! t0_data_in_shm_area+0xb4
	.word	0x5c300f54	! t0_data_in_shm_area+0xb8
	.word	0x0ed3ce38	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x0434a000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x9027ce5d          ! %f0
	.word	0xb6942f98          ! %f1
	.word	0x5c13cc66          ! %f2
	.word	0xfa619bed          ! %f3
	.word	0x9902dbf2          ! %f4
	.word	0x4ae032a0          ! %f5
	.word	0x20fe5d2c          ! %f6
	.word	0xcefd3d01          ! %f7
	.word	0x697d4a58          ! %f8
	.word	0xd59b0aac          ! %f9
	.word	0x9311662b          ! %f10
	.word	0x319e19c4          ! %f11
	.word	0x2fda952b          ! %f12
	.word	0xed50a7f8          ! %f13
	.word	0x365037bc          ! %f14
	.word	0x442f94ee          ! %f15
	.word	0x35b7b6cc          ! %f16
	.word	0x81f745cf          ! %f17
	.word	0xcbfecb39          ! %f18
	.word	0xdadc72fb          ! %f19
	.word	0x8f28e865          ! %f20
	.word	0xa2cdc440          ! %f21
	.word	0x20d5ac9b          ! %f22
	.word	0x8742acfb          ! %f23
	.word	0xa2a4de2a          ! %f24
	.word	0x3c596911          ! %f25
	.word	0x66585a64          ! %f26
	.word	0x5a911ca6          ! %f27
	.word	0x72b103e2          ! %f28
	.word	0x76ca3bf3          ! %f29
	.word	0xa6573fbf          ! %f30
	.word	0xabcb55b3          ! %f31
	.word	0x2f767da5          ! %f32
	.word	0x3dcc71f7          ! %f33
	.word	0x6494ace4          ! %f34
	.word	0xd6614069          ! %f35
	.word	0x6a9ff0e7          ! %f36
	.word	0x60409c40          ! %f37
	.word	0xc01671c1          ! %f38
	.word	0x820d4975          ! %f39
	.word	0x3f5c59b4          ! %f40
	.word	0xb7bb8dfa          ! %f41
	.word	0xc223fed6          ! %f42
	.word	0xa0c53afe          ! %f43
	.word	0x4b63703d          ! %f44
	.word	0x304a2d8a          ! %f45
	.word	0x8e8b3060          ! %f46
	.word	0x47b712f6          ! %f47
	.word	0xa89c6292          ! %f48
	.word	0x1804a506          ! %f49
	.word	0xc5c427b9          ! %f50
	.word	0xce0c6ab3          ! %f51
	.word	0x69cfe6b0          ! %f52
	.word	0x46bfa5e7          ! %f53
	.word	0x302ed6fe          ! %f54
	.word	0xf4c443bd          ! %f55
	.word	0xebdae8be          ! %f56
	.word	0xd7e1b3fd          ! %f57
	.word	0x302b22f2          ! %f58
	.word	0x1f9c4de9          ! %f59
	.word	0x98675993          ! %f60
	.word	0xf64daba2          ! %f61
	.word	0x1976bf21          ! %f62
	.word	0x04fffaa6          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x4a8       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xccc415b6          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x078e3b51          ! %o0
	.word	0xe0f3e4ef          ! %o1
	.word	0x74ab5468          ! %o2
	.word	0xcfc4afc4          ! %o3
	.word	0xd4e4c77f          ! %o4
	.word	0xdebf6860          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x4384e17c          ! %l0
	.word	0xabb2f732          ! %l1
	.word	0x654a2848          ! %l2
	.word	0x7384f196          ! %l3
	.word	0xe2d37b3b          ! %l4
	.word	0x84a727ba          ! %l5
	.word	0x6e6060f3          ! %l6
	.word	0x73e1ba60          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xffffffef          ! %i2 (byte offset)
	.word	0xffffffe8          ! %i3 (halfword offset)
	.word	0x00000004          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xc83103c3          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0x40000f2a          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x3637a000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xb33a8847
	.word	0xd3967b3e
	.word	0xc66d2a28
	.word	0xf72efdf2
	.word	0xb3d4dc18
	.word	0xbe17f25d
	.word	0x19a567b6
	.word	0xca8f5635
	.word	0xc15c18cc
	.word	0x9b2e1929
	.word	0xf5d7e076
	.word	0x2b457b32
	.word	0xb2db2d68
	.word	0xb6662ffd
	.word	0x425c58bb
	.word	0x929bd6a3
	.word	0xfcbe58ee
	.word	0xc9ca5a40
	.word	0x336c28fc
	.word	0x21ec7730
	.word	0x765907bb
	.word	0x2cf8b9fa
	.word	0xde2ff3d8
	.word	0x41af2828
	.word	0xae21a330
	.word	0x125830a9
	.word	0x48e4385a
	.word	0x2b24d06e
	.word	0x9fe83794
	.word	0xdb97d955
	.word	0xcf3e447d
	.word	0x62e54cb1
	.word	0x95371439
	.word	0x4be38fe2
	.word	0x4dcf4bf2
	.word	0x2d3438df
	.word	0x295ac9dc
	.word	0xaa0919a4
	.word	0xcebba720
	.word	0x4a545cda
	.word	0xba812b51
	.word	0x946ec338
	.word	0xb2f87e6b
	.word	0xc858b06c
	.word	0xc635345f
	.word	0x45758791
	.word	0x5da265b8
	.word	0x9c6d2a78
	.word	0xb377fae8
	.word	0x8dee1451
	.word	0xcf23ac31
	.word	0x9e80cf73
	.word	0xae150e4d
	.word	0xade93f59
	.word	0xfc096445
	.word	0xc2ddb311
	.word	0x67d2e910
	.word	0x17a1c1a3
	.word	0xdbd267f2
	.word	0x4cd2e142
	.word	0xab0658ba
	.word	0xc5c64b4e
	.word	0x8ef3dd46
	.word	0xaf5f625f
	.word	0xa119fffe
	.word	0x334844fa
	.word	0xb502ff22
	.word	0xd40ccea0
	.word	0xe509571e
	.word	0xd044d256
	.word	0x44ac2e41
	.word	0x301b24d2
	.word	0xefe0ce8d
	.word	0x7ae2e9f6
	.word	0x5b1b8e78
	.word	0x0406d845
	.word	0x0a4af7d5
	.word	0x955a9669
	.word	0x77fbb43f
	.word	0x248d4a0a
	.word	0xbc4cd8ba
	.word	0xa906b48a
	.word	0x2a73266f
	.word	0xfde3215e
	.word	0x21d1cc9f
	.word	0x92a3c316
	.word	0x0ad1b84c
	.word	0x15133760
	.word	0xa9c99829
	.word	0x3af3977f
	.word	0xf82affc6
	.word	0x07b40a0a
	.word	0x8ca19322
	.word	0x3a270bff
	.word	0x712b6bfb
	.word	0x0a8cea5e
	.word	0xd00c0c9f
	.word	0x20ebfaef
	.word	0xc849c000
	.word	0xbba359df
	.word	0x77974d63
	.word	0xc10f1b58
	.word	0x2d4ef5e1
	.word	0x06bc4b42
	.word	0xadc7dc85
	.word	0xc68692ca
	.word	0x9d4acde5
	.word	0x13e43a65
	.word	0x467fea51
	.word	0x69b3506c
	.word	0xceab8e16
	.word	0x294c4f80
	.word	0x23b8056c
	.word	0x79f48554
	.word	0xf593b5ff
	.word	0xf3fa0199
	.word	0x4f2b7e3a
	.word	0x8589ce18
	.word	0x9cf0aab7
	.word	0x60a9ec3d
	.word	0x38dd1c83
	.word	0x5e75e1a5
	.word	0xe7819f1e
	.word	0x971dcc6c
	.word	0x917f0b54
	.word	0xa4dcd94e
	.word	0xf92e3c66
	.word	0x8118d8d4
	.word	0xe3131f23
	.word	0xa3766627
	.word	0x7100ced5
	.word	0xbacce942
	.word	0xf7c6da36
	.word	0x8b5d8794
	.word	0x270ffac8
	.word	0xbfae2155
	.word	0x9160d344
	.word	0xaf0c971c
	.word	0x7be03dfa
	.word	0x73ca1274
	.word	0x10cb625c
	.word	0x89edbd82
	.word	0xa085c106
	.word	0xda1a8901
	.word	0xbfa2b805
	.word	0x47d52516
	.word	0x4c533d2a
	.word	0x5b1b78ce
	.word	0x236ac2a6
	.word	0xcf3b7d48
	.word	0x4e6afa4d
	.word	0xa76ebcd0
	.word	0x6d738628
	.word	0x8f64a37d
	.word	0x8b532942
	.word	0x27cf9e11
	.word	0xf1b8c9d9
	.word	0x1a078525
	.word	0x00ff1e4e
	.word	0x694355eb
	.word	0xec744093
	.word	0xcbc98f0d
	.word	0xe2d32fe7
	.word	0xd992ff72
	.word	0x7fe78f1c
	.word	0xf9313df1
	.word	0x4b413dbe
	.word	0xf7eeac32
t0_data_exp_sp:
	.word	0x1c55d4d0
	.word	0x93d8a455
	.word	0x2df823ff
	.word	0x4f609019
	.word	0xb97a9a7d
	.word	0x6ee1f994
	.word	0x74809ed7
	.word	0xcfb278b6
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffffb
	.word	0x00000010
	.word	0x00000018
	.word	0xfffffff0
	.word	t0_data_exp_fp
	.word	0x5d71818c
	.word	0x8bb469d6
	.word	0x180b4840
	.word	0xf3a3891d
	.word	0x6089b470
	.word	0x7ef7c57b
	.word	0xb7fce8a1
	.word	0x30ffbb38
	.word	0x9dddf56c
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
	.word   	0xc86c657b	! [%fp - 0xc]
	.word   	0xf98bbdc9	! [%fp - 0x8]
	.word   	0x32159df6	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x9cbbd206
	.word	0x49ebab80
	.word	0x687d9317
	.word	0x945861a0
	.word	0x00f0f957
	.word	0x4d6cc38c
	.word	0xf9eda500
	.word	0xc172a731
	.word	0xe8f93bdb
	.word	0xa1e3093d
	.word	0x78a8d6fe
	.word	0x3ff2b13d
	.word	0xc56c3489
	.word	0x1146fd51
	.word	0xa142d4c7
	.word	0x580e3f0e
	.word	0xb473ef23
	.word	0x18fa8f6d
	.word	0xb7bf92c2
	.word	0x1926760f
	.word	0x3ed71fce
	.word	0x2981c019
	.word	0x5e6fe1b6
	.word	0x44567d6d
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x6a9f4000)
.seg "data"
t0_data_exp_area0_start:
.skip 5376
t0_data_exp_area0_begin:
	.word	0x09b6bfe5	! t0_data_exp_area0-0x20
	.word	0x1a94df0f	! t0_data_exp_area0-0x1c
	.word	0xc45709c4	! t0_data_exp_area0-0x18
	.word	0xc7ddaffa	! t0_data_exp_area0-0x14
	.word	0x81c82409	! t0_data_exp_area0-0x10
	.word	0xf521e9b5	! t0_data_exp_area0-0xc
	.word	0x7c5aa097	! t0_data_exp_area0-0x8
	.word	0xe8e08855	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xdfd1df7c	! t0_data_exp_area0+0x0
	.word	0x7a26cde6	! t0_data_exp_area0+0x4
	.word	0x84dd0ed9	! t0_data_exp_area0+0x8
	.word	0xf309ab48	! t0_data_exp_area0+0xc
	.word	0xebc308af	! t0_data_exp_area0+0x10
	.word	0xaba694f8	! t0_data_exp_area0+0x14
	.word	0xfc7678e8	! t0_data_exp_area0+0x18
	.word	0xea46b470	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 2752
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x19a50000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x2921b319	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x2097bafa	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x6b86fec9	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xd072a923	! t0_data_exp_shm_area+0xc (t0)
	.word	0x4606b249	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xa5ca363d	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x5698875c	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x417a358d	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xbaa9fa3e	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xf0a7f315	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x5a358ad1	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x82a4181c	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x13e430f6	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x4d9ac7e0	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x713d905a	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x576a5f1e	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xcc3f4544	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xd70f2547	! t0_data_exp_shm_area+0x44
	.word	0x42175322	! t0_data_exp_shm_area+0x48
	.word	0x95f75ca7	! t0_data_exp_shm_area+0x4c
	.word	0x56791ee6	! t0_data_exp_shm_area+0x50
	.word	0x03bb06c3	! t0_data_exp_shm_area+0x54
	.word	0xa0abc27c	! t0_data_exp_shm_area+0x58
	.word	0x492374b7	! t0_data_exp_shm_area+0x5c
	.word	0xdef8bbd6	! t0_data_exp_shm_area+0x60
	.word	0x1f44e763	! t0_data_exp_shm_area+0x64
	.word	0x8a14515f	! t0_data_exp_shm_area+0x68
	.word	0x4bff299c	! t0_data_exp_shm_area+0x6c
	.word	0xb0e74ee0	! t0_data_exp_shm_area+0x70
	.word	0x6fdebecb	! t0_data_exp_shm_area+0x74
	.word	0x1e9a4912	! t0_data_exp_shm_area+0x78
	.word	0x75c70a95	! t0_data_exp_shm_area+0x7c
	.word	0x4ca43374	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x92254a7f	! t0_data_exp_shm_area+0x84
	.word	0xde4c1323	! t0_data_exp_shm_area+0x88
	.word	0x4ad568b8	! t0_data_exp_shm_area+0x8c
	.word	0x6163cabd	! t0_data_exp_shm_area+0x90
	.word	0xa2d42761	! t0_data_exp_shm_area+0x94
	.word	0x3748ae9d	! t0_data_exp_shm_area+0x98
	.word	0x81fff615	! t0_data_exp_shm_area+0x9c
	.word	0xa03695f1	! t0_data_exp_shm_area+0xa0
	.word	0x97e37f78	! t0_data_exp_shm_area+0xa4
	.word	0x4a30c479	! t0_data_exp_shm_area+0xa8
	.word	0xb40db31a	! t0_data_exp_shm_area+0xac
	.word	0xf4b721ea	! t0_data_exp_shm_area+0xb0
	.word	0x28ac4ff2	! t0_data_exp_shm_area+0xb4
	.word	0x5c300f54	! t0_data_exp_shm_area+0xb8
	.word	0x0ed3ce38	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d1e996d0b103
#define T0_KAOS_ICOUNT        2513
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    5376
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2519

#define T0_KAOS_BOOT_VA                  0x69a1a000
#define T0_KAOS_BOOT_PA                  0x0000000000a04000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x22908000
#define T0_KAOS_STARTUP_PA               0x00000000031b6000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x35072000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004bdc000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x6c9c4000
#define T0_KAOS_DONE_PA                  0x0000000007720000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x0c5da000
#define T0_KAOS_KTBL_PA                  0x0000000008a80000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x1e408000
#define T0_KAOS_SUBR0_PA                 0x000000000ab38000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x1d604000
#define T0_KAOS_SUBR1_PA                 0x000000000c2da000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x0c73a000
#define T0_KAOS_SUBR2_PA                 0x000000000eeee000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x0c544000
#define T0_KAOS_SUBR3_PA                 0x0000000010f16000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x0434a000
#define T0_KAOS_EXP_REGS_PA              0x0000000013ae2000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x0ee86000
#define T0_KAOS_RUN_REGS_PA              0x0000000014da8000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x3637a000
#define T0_KAOS_EXP_STACK_PA             0x000000001743e000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x365ca000
#define T0_KAOS_RUN_STACK_PA             0x0000000018900000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x6a9f4000
#define T0_KAOS_EXP_AREA0_PA             0x000000001b22c000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x76c50000
#define T0_KAOS_RUN_AREA0_PA             0x000000001d892000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x19a50000
#define T0_KAOS_EXP_SHM_AREA_PA          0x00000000001fa000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x2919a000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000962000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x1c7297f6
#define T0_KAOS_RANVAL_01     0x92fc8b6c
#define T0_KAOS_RANVAL_02     0x66090a62
#define T0_KAOS_RANVAL_03     0x9d4e59c6
#define T0_KAOS_RANVAL_04     0xf30907ea
#define T0_KAOS_RANVAL_05     0xa9d49c6f
#define T0_KAOS_RANVAL_06     0x67b81ba2
#define T0_KAOS_RANVAL_07     0x7bf3fc26
#define T0_KAOS_RANVAL_08     0x833fbf7d
#define T0_KAOS_RANVAL_09     0xee1c0c3e
#define T0_KAOS_RANVAL_0a     0xefe2ad53
#define T0_KAOS_RANVAL_0b     0x62d1fe25
#define T0_KAOS_RANVAL_0c     0x061142d2
#define T0_KAOS_RANVAL_0d     0x023351ce
#define T0_KAOS_RANVAL_0e     0xa099eaa6
#define T0_KAOS_RANVAL_0f     0x2ff05ba7
#define T0_KAOS_RANVAL_10     0x456bba56
#define T0_KAOS_RANVAL_11     0xe3250d15
#define T0_KAOS_RANVAL_12     0x5f4013b4
#define T0_KAOS_RANVAL_13     0x5253ba83
#define T0_KAOS_RANVAL_14     0x4207e9cc
#define T0_KAOS_RANVAL_15     0xc5993287
#define T0_KAOS_RANVAL_16     0x76da9cb1
#define T0_KAOS_RANVAL_17     0x0aed6bab
#define T0_KAOS_RANVAL_18     0xbfd004a5
#define T0_KAOS_RANVAL_19     0xd5d0eadd
#define T0_KAOS_RANVAL_1a     0xe20a8c62
#define T0_KAOS_RANVAL_1b     0xbb27da90
#define T0_KAOS_RANVAL_1c     0x4beef394
#define T0_KAOS_RANVAL_1d     0x011a2b17
#define T0_KAOS_RANVAL_1e     0x8787cdcc
#define T0_KAOS_RANVAL_1f     0xdac00ec4
#define T0_KAOS_RANVAL_20     0x1015df62
#define T0_KAOS_RANVAL_21     0x389648c4
#define T0_KAOS_RANVAL_22     0xb893692d
#define T0_KAOS_RANVAL_23     0x868323e0
#define T0_KAOS_RANVAL_24     0x110f14fe
#define T0_KAOS_RANVAL_25     0xa91f0e81
#define T0_KAOS_RANVAL_26     0x2f9fd82f
#define T0_KAOS_RANVAL_27     0xe190dba7
#define T0_KAOS_RANVAL_28     0x589296d7
#define T0_KAOS_RANVAL_29     0x56ca14be
#define T0_KAOS_RANVAL_2a     0x15ade95b
#define T0_KAOS_RANVAL_2b     0x1932ae6b
#define T0_KAOS_RANVAL_2c     0xa4c1ef6e
#define T0_KAOS_RANVAL_2d     0x8c4262c7
#define T0_KAOS_RANVAL_2e     0xd9cfe6cb
#define T0_KAOS_RANVAL_2f     0xc268fdaf
#define T0_KAOS_RANVAL_30     0xfff61926
#define T0_KAOS_RANVAL_31     0x0b2c9c02
#define T0_KAOS_RANVAL_32     0x7f2bf423
#define T0_KAOS_RANVAL_33     0x66464d0d
#define T0_KAOS_RANVAL_34     0xa2e38f5e
#define T0_KAOS_RANVAL_35     0xd34a3d75
#define T0_KAOS_RANVAL_36     0x3df1d7c1
#define T0_KAOS_RANVAL_37     0x714aa55a
#define T0_KAOS_RANVAL_38     0x96c5dcc1
#define T0_KAOS_RANVAL_39     0x5e54af8b
#define T0_KAOS_RANVAL_3a     0x2a47a333
#define T0_KAOS_RANVAL_3b     0xc86f8607
#define T0_KAOS_RANVAL_3c     0x26853adc
#define T0_KAOS_RANVAL_3d     0x0ed13017
#define T0_KAOS_RANVAL_3e     0xfc73eee9
#define T0_KAOS_RANVAL_3f     0x16b708ca
#define T0_KAOS_RANVAL_40     0x91de16f0
#define T0_KAOS_RANVAL_41     0x44aad899
#define T0_KAOS_RANVAL_42     0xf6c39d2b
#define T0_KAOS_RANVAL_43     0x6e171b7c
#define T0_KAOS_RANVAL_44     0xfdbb9009
#define T0_KAOS_RANVAL_45     0x937044bf
#define T0_KAOS_RANVAL_46     0x5b14584c
#define T0_KAOS_RANVAL_47     0x30c3f444
#define T0_KAOS_RANVAL_48     0xf673424f
#define T0_KAOS_RANVAL_49     0x37e69d2d
#define T0_KAOS_RANVAL_4a     0x7acc4020
#define T0_KAOS_RANVAL_4b     0xe26b23f5
#define T0_KAOS_RANVAL_4c     0x44a1f39b
#define T0_KAOS_RANVAL_4d     0x6d7c0a80
#define T0_KAOS_RANVAL_4e     0x6b9a7aaa
#define T0_KAOS_RANVAL_4f     0x9e22eab4
#define T0_KAOS_RANVAL_50     0x694df54c
#define T0_KAOS_RANVAL_51     0x343fd490
#define T0_KAOS_RANVAL_52     0x08e39c1a
#define T0_KAOS_RANVAL_53     0x83e7b2de
#define T0_KAOS_RANVAL_54     0xfaed4f5b
#define T0_KAOS_RANVAL_55     0x85a6b1f5
#define T0_KAOS_RANVAL_56     0x907819f5
#define T0_KAOS_RANVAL_57     0xa9bbd628
#define T0_KAOS_RANVAL_58     0xd03b08ad
#define T0_KAOS_RANVAL_59     0xb5c60bcc
#define T0_KAOS_RANVAL_5a     0xb8623d95
#define T0_KAOS_RANVAL_5b     0x871c1106
#define T0_KAOS_RANVAL_5c     0x78a820a8
#define T0_KAOS_RANVAL_5d     0xa81939bb
#define T0_KAOS_RANVAL_5e     0x267c49d4
#define T0_KAOS_RANVAL_5f     0x9fbd4851
#define T0_KAOS_RANVAL_60     0xd9ea0e08
#define T0_KAOS_RANVAL_61     0xae8ffa31
#define T0_KAOS_RANVAL_62     0x4056c804
#define T0_KAOS_RANVAL_63     0x7aae8523
#define T0_KAOS_RANVAL_64     0xdff1d6f3
#define T0_KAOS_RANVAL_65     0xffd5aaf2
#define T0_KAOS_RANVAL_66     0x16023021
#define T0_KAOS_RANVAL_67     0xef444b05
#define T0_KAOS_RANVAL_68     0x4db4164a
#define T0_KAOS_RANVAL_69     0x12b505d2
#define T0_KAOS_RANVAL_6a     0xe3ce6049
#define T0_KAOS_RANVAL_6b     0x1fe0ac4c
#define T0_KAOS_RANVAL_6c     0xcadb8241
#define T0_KAOS_RANVAL_6d     0x407465c0
#define T0_KAOS_RANVAL_6e     0x3145976c
#define T0_KAOS_RANVAL_6f     0x5dfdc0bf
#define T0_KAOS_RANVAL_70     0xfa04c831
#define T0_KAOS_RANVAL_71     0x8342d806
#define T0_KAOS_RANVAL_72     0xc5cfe73f
#define T0_KAOS_RANVAL_73     0xd116627d
#define T0_KAOS_RANVAL_74     0x7dbbd1ac
#define T0_KAOS_RANVAL_75     0x288e7dce
#define T0_KAOS_RANVAL_76     0x90c75175
#define T0_KAOS_RANVAL_77     0x5d63551d
#define T0_KAOS_RANVAL_78     0x755fc6d2
#define T0_KAOS_RANVAL_79     0xd5a101e7
#define T0_KAOS_RANVAL_7a     0xba940431
#define T0_KAOS_RANVAL_7b     0x9e213b17
#define T0_KAOS_RANVAL_7c     0xd79461e2
#define T0_KAOS_RANVAL_7d     0x3f6726c9
#define T0_KAOS_RANVAL_7e     0x91eb69b5
#define T0_KAOS_RANVAL_7f     0x2375fd61
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
!    areaoffset     5376
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2519
!    code           0c5da000
!    entry          0c5da000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d1e996d0b103
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

KTEXT_MODULE(t0_module_ktbl, 0x0c5da000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xaba000af	! t0_kref+0x0:   	fnegs	%f15, %f21
	.word	0xe7000018	! t0_kref+0x4:   	ld	[%g0 + %i0], %f19
	.word	0xa29034a4	! t0_kref+0x8:   	orcc	%g0, -0xb5c, %l1
	.word	0xa5a0002d	! t0_kref+0xc:   	fmovs	%f13, %f18
	.word	0xe278a034	! t0_kref+0x10:   	swap	[%g2 + 0x34], %l1
	.word	0x25480008	! t0_kref+0x14:   	fblg,a,pt	%fcc0, _kref+0x34
	.word	0x99a0052b	! t0_kref+0x18:   	fsqrts	%f11, %f12
	.word	0x81ac8a31	! t0_kref+0x1c:   	fcmps	%fcc0, %f18, %f17
	.word	0xa40b74ef	! t0_kref+0x20:   	and	%o5, -0xb11, %l2
	.word	0xa80d0010	! t0_kref+0x24:   	and	%l4, %l0, %l4
	.word	0xe420a020	! t0_kref+0x28:   	st	%l2, [%g2 + 0x20]
	.word	0xf43f4019	! t0_kref+0x2c:   	std	%i2, [%i5 + %i1]
	.word	0x9da00536	! t0_kref+0x30:   	fsqrts	%f22, %f14
	.word	0xe4f65000	! t0_kref+0x34:   	stxa	%l2, [%i1]0x80
	.word	0xe36e3ff0	! t0_kref+0x38:   	prefetch	%i0 - 0x10, 17
	.word	0xc807bfec	! t0_kref+0x3c:   	ld	[%fp - 0x14], %g4
	.word	0xa4be801b	! t0_kref+0x40:   	xnorcc	%i2, %i3, %l2
	.word	0xa6954011	! t0_kref+0x44:   	orcc	%l5, %l1, %l3
	.word	0x2a480003	! t0_kref+0x48:   	bcs,a,pt	%icc, _kref+0x54
	.word	0xe610a004	! t0_kref+0x4c:   	lduh	[%g2 + 4], %l3
	.word	0xa60eb1af	! t0_kref+0x50:   	and	%i2, -0xe51, %l3
	.word	0xa9380014	! t0_kref+0x54:   	sra	%g0, %l4, %l4
	.word	0xa0a2f00f	! t0_kref+0x58:   	subcc	%o3, -0xff1, %l0
	.word	0xeb6e3ff8	! t0_kref+0x5c:   	prefetch	%i0 - 8, 21
	.word	0x81ab8a35	! t0_kref+0x60:   	fcmps	%fcc0, %f14, %f21
	.word	0xa5a01a4a	! t0_kref+0x64:   	fdtoi	%f10, %f18
	.word	0xa8d2346b	! t0_kref+0x68:   	umulcc	%o0, -0xb95, %l4
	.word	0xa9a01934	! t0_kref+0x6c:   	fstod	%f20, %f20
	.word	0xe8070019	! t0_kref+0x70:   	ld	[%i4 + %i1], %l4
	.word	0x95a0188a	! t0_kref+0x74:   	fitos	%f10, %f10
	.word	0xe096101b	! t0_kref+0x78:   	lduha	[%i0 + %i3]0x80, %l0
	.word	0xdf060000	! t0_kref+0x7c:   	ld	[%i0], %f15
	.word	0x22800006	! t0_kref+0x80:   	be,a	_kref+0x98
	.word	0xd8a81019	! t0_kref+0x84:   	stba	%o4, [%g0 + %i1]0x80
	.word	0x81d82fd6	! t0_kref+0x88:   	flush	%g0 + 0xfd6
	.word	0xe000a038	! t0_kref+0x8c:   	ld	[%g2 + 0x38], %l0
	.word	0xada589ad	! t0_kref+0x90:   	fdivs	%f22, %f13, %f22
	.word	0xa53a601e	! t0_kref+0x94:   	sra	%o1, 0x1e, %l2
	.word	0xa03b3913	! t0_kref+0x98:   	xnor	%o4, -0x6ed, %l0
	.word	0x93a54836	! t0_kref+0x9c:   	fadds	%f21, %f22, %f9
	.word	0xdf20a018	! t0_kref+0xa0:   	st	%f15, [%g2 + 0x18]
	.word	0xa8144017	! t0_kref+0xa4:   	or	%l1, %l7, %l4
	.word	0x30800008	! t0_kref+0xa8:   	ba,a	_kref+0xc8
	.word	0xe84e0000	! t0_kref+0xac:   	ldsb	[%i0], %l4
	.word	0x81580000	! t0_kref+0xb0:   	flushw
	.word	0x95a0190c	! t0_kref+0xb4:   	fitod	%f12, %f10
	.word	0xa6282b20	! t0_kref+0xb8:   	andn	%g0, 0xb20, %l3
	.word	0xa6b68015	! t0_kref+0xbc:   	orncc	%i2, %l5, %l3
	.word	0xa80af6e4	! t0_kref+0xc0:   	and	%o3, -0x91c, %l4
	.word	0x39480008	! t0_kref+0xc4:   	fbuge,a,pt	%fcc0, _kref+0xe4
	.word	0xe3b8a080	! t0_kref+0xc8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe85e7fe8	! t0_kref+0xcc:   	ldx	[%i1 - 0x18], %l4
	.word	0xa2e4f96d	! t0_kref+0xd0:   	subccc	%l3, -0x693, %l1
	.word	0xa6d27eb0	! t0_kref+0xd4:   	umulcc	%o1, -0x150, %l3
	.word	0xe89e501d	! t0_kref+0xd8:   	ldda	[%i1 + %i5]0x80, %l4
	.word	0xc568a04c	! t0_kref+0xdc:   	prefetch	%g2 + 0x4c, 2
	.word	0xd430a00e	! t0_kref+0xe0:   	sth	%o2, [%g2 + 0xe]
	.word	0x2b28dc85	! t0_kref+0xe4:   	sethi	%hi(0xa3721400), %l5
	.word	0xa8903c01	! t0_kref+0xe8:   	orcc	%g0, -0x3ff, %l4
	.word	0xa920000c	! t0_kref+0xec:   	mulscc	%g0, %o4, %l4
	.word	0xdd20a010	! t0_kref+0xf0:   	st	%f14, [%g2 + 0x10]
	.word	0x81ac8a4c	! t0_kref+0xf4:   	fcmpd	%fcc0, %f18, %f12
	.word	0xa492401a	! t0_kref+0xf8:   	orcc	%o1, %i2, %l2
	.word	0xa82e8014	! t0_kref+0xfc:   	andn	%i2, %l4, %l4
	.word	0xab382013	! t0_kref+0x100:   	sra	%g0, 0x13, %l5
	.word	0xe0de5000	! t0_kref+0x104:   	ldxa	[%i1]0x80, %l0
	.word	0xa1400000	! t0_kref+0x108:   	mov	%y, %l0
	.word	0xaafee740	! t0_kref+0x10c:   	sdivcc	%i3, 0x740, %l5
	.word	0xe84e8018	! t0_kref+0x110:   	ldsb	[%i2 + %i0], %l4
	.word	0x81de8005	! t0_kref+0x114:   	flush	%i2 + %g5
	.word	0xe200a01c	! t0_kref+0x118:   	ld	[%g2 + 0x1c], %l1
	.word	0xa5a38d2c	! t0_kref+0x11c:   	fsmuld	%f14, %f12, %f18
	.word	0x2302d962	! t0_kref+0x120:   	sethi	%hi(0xb658800), %l1
	.word	0xea48a02e	! t0_kref+0x124:   	ldsb	[%g2 + 0x2e], %l5
	.word	0x99a0190f	! t0_kref+0x128:   	fitod	%f15, %f12
	.word	0xa2a4f734	! t0_kref+0x12c:   	subcc	%l3, -0x8cc, %l1
	.word	0xa9a209ac	! t0_kref+0x130:   	fdivs	%f8, %f12, %f20
	.word	0x38800006	! t0_kref+0x134:   	bgu,a	_kref+0x14c
	.word	0x91a34928	! t0_kref+0x138:   	fmuls	%f13, %f8, %f8
	.word	0x2d480002	! t0_kref+0x13c:   	fbg,a,pt	%fcc0, _kref+0x144
	.word	0xada01a50	! t0_kref+0x140:   	fdtoi	%f16, %f22
	.word	0xa452c00b	! t0_kref+0x144:   	umul	%o3, %o3, %l2
	.word	0x91a44d2a	! t0_kref+0x148:   	fsmuld	%f17, %f10, %f8
	.word	0xd506201c	! t0_kref+0x14c:   	ld	[%i0 + 0x1c], %f10
	.word	0xd700a02c	! t0_kref+0x150:   	ld	[%g2 + 0x2c], %f11
	.word	0xa1a01a36	! t0_kref+0x154:   	fstoi	%f22, %f16
	.word	0xa5a000b3	! t0_kref+0x158:   	fnegs	%f19, %f18
	.word	0x99a01a4e	! t0_kref+0x15c:   	fdtoi	%f14, %f12
	.word	0xd820a014	! t0_kref+0x160:   	st	%o4, [%g2 + 0x14]
	.word	0x81aaca34	! t0_kref+0x164:   	fcmps	%fcc0, %f11, %f20
	.word	0xc12e3fe0	! t0_kref+0x168:   	st	%fsr, [%i0 - 0x20]
	.word	0x24480001	! t0_kref+0x16c:   	ble,a,pt	%icc, _kref+0x170
	.word	0xd920a03c	! t0_kref+0x170:   	st	%f12, [%g2 + 0x3c]
	.word	0xa6a4000d	! t0_kref+0x174:   	subcc	%l0, %o5, %l3
	.word	0xa4b2247e	! t0_kref+0x178:   	orncc	%o0, 0x47e, %l2
	.word	0x97a2c8b5	! t0_kref+0x17c:   	fsubs	%f11, %f21, %f11
	.word	0x81ab8a2a	! t0_kref+0x180:   	fcmps	%fcc0, %f14, %f10
	.word	0xa9a000d0	! t0_kref+0x184:   	fnegd	%f16, %f20
	.word	0x3b480005	! t0_kref+0x188:   	fble,a,pt	%fcc0, _kref+0x19c
	.word	0xa83b6191	! t0_kref+0x18c:   	xnor	%o5, 0x191, %l4
	.word	0xdb264000	! t0_kref+0x190:   	st	%f13, [%i1]
	.word	0xab3ee007	! t0_kref+0x194:   	sra	%i3, 0x7, %l5
	.word	0xc568a004	! t0_kref+0x198:   	prefetch	%g2 + 4, 2
	.word	0xe6070018	! t0_kref+0x19c:   	ld	[%i4 + %i0], %l3
	.word	0x2f480008	! t0_kref+0x1a0:   	fbu,a,pt	%fcc0, _kref+0x1c0
	.word	0xaa34af29	! t0_kref+0x1a4:   	orn	%l2, 0xf29, %l5
	.word	0xa212801a	! t0_kref+0x1a8:   	or	%o2, %i2, %l1
	.word	0x9fa0052a	! t0_kref+0x1ac:   	fsqrts	%f10, %f15
	.word	0xa80ac012	! t0_kref+0x1b0:   	and	%o3, %l2, %l4
	.word	0x22480006	! t0_kref+0x1b4:   	be,a,pt	%icc, _kref+0x1cc
	.word	0xd66e0000	! t0_kref+0x1b8:   	ldstub	[%i0], %o3
	.word	0xa2e2c012	! t0_kref+0x1bc:   	subccc	%o3, %l2, %l1
	.word	0x97a0188a	! t0_kref+0x1c0:   	fitos	%f10, %f11
	.word	0xa9328010	! t0_kref+0x1c4:   	srl	%o2, %l0, %l4
	.word	0xe59e1000	! t0_kref+0x1c8:   	ldda	[%i0]0x80, %f18
	.word	0xa25a401b	! t0_kref+0x1cc:   	smul	%o1, %i3, %l1
	.word	0x95a01933	! t0_kref+0x1d0:   	fstod	%f19, %f10
	.word	0xa81af96c	! t0_kref+0x1d4:   	xor	%o3, -0x694, %l4
	.word	0xa63ec016	! t0_kref+0x1d8:   	xnor	%i3, %l6, %l3
	.word	0x91a0192c	! t0_kref+0x1dc:   	fstod	%f12, %f8
	.word	0xa2ad29c7	! t0_kref+0x1e0:   	andncc	%l4, 0x9c7, %l1
	.word	0xf1ee101d	! t0_kref+0x1e4:   	prefetcha	%i0 + %i5, 24
	.word	0xf36e401d	! t0_kref+0x1e8:   	prefetch	%i1 + %i5, 25
	.word	0xa85ee34d	! t0_kref+0x1ec:   	smul	%i3, 0x34d, %l4
	.word	0xaba8402a	! t0_kref+0x1f0:   	fmovsne	%fcc0, %f10, %f21
	.word	0xa874a4e3	! t0_kref+0x1f4:   	udiv	%l2, 0x4e3, %l4
	.word	0xdb264000	! t0_kref+0x1f8:   	st	%f13, [%i1]
	.word	0xa1a01a29	! t0_kref+0x1fc:   	fstoi	%f9, %f16
	.word	0xa6143b09	! t0_kref+0x200:   	or	%l0, -0x4f7, %l3
	.word	0x3e800007	! t0_kref+0x204:   	bvc,a	_kref+0x220
	.word	0xea48a036	! t0_kref+0x208:   	ldsb	[%g2 + 0x36], %l5
	.word	0xaa0af319	! t0_kref+0x20c:   	and	%o3, -0xce7, %l5
	.word	0x9da28d32	! t0_kref+0x210:   	fsmuld	%f10, %f18, %f14
	.word	0xa73ea013	! t0_kref+0x214:   	sra	%i2, 0x13, %l3
	.word	0x21480004	! t0_kref+0x218:   	fbn,a,pt	%fcc0, _kref+0x228
	.word	0xa4b6e2f9	! t0_kref+0x21c:   	orncc	%i3, 0x2f9, %l2
	.word	0xe40e200b	! t0_kref+0x220:   	ldub	[%i0 + 0xb], %l2
	.word	0xe440a00c	! t0_kref+0x224:   	ldsw	[%g2 + 0xc], %l2
	.word	0xaa0d000d	! t0_kref+0x228:   	and	%l4, %o5, %l5
	.word	0xa1246082	! t0_kref+0x22c:   	mulscc	%l1, 0x82, %l0
	.word	0xe8d01018	! t0_kref+0x230:   	ldsha	[%g0 + %i0]0x80, %l4
	.word	0x81ab0aa8	! t0_kref+0x234:   	fcmpes	%fcc0, %f12, %f8
	.word	0x81aa0aa8	! t0_kref+0x238:   	fcmpes	%fcc0, %f8, %f8
	.word	0xa876c014	! t0_kref+0x23c:   	udiv	%i3, %l4, %l4
	.word	0xa1258009	! t0_kref+0x240:   	mulscc	%l6, %o1, %l0
	.word	0xe816c018	! t0_kref+0x244:   	lduh	[%i3 + %i0], %l4
	.word	0x81df68c9	! t0_kref+0x248:   	flush	%i5 + 0x8c9
	.word	0xec20a008	! t0_kref+0x24c:   	st	%l6, [%g2 + 8]
	.word	0xe120a024	! t0_kref+0x250:   	st	%f16, [%g2 + 0x24]
	.word	0xa6d36554	! t0_kref+0x254:   	umulcc	%o5, 0x554, %l3
	.word	0x99a0190a	! t0_kref+0x258:   	fitod	%f10, %f12
	.word	0x28480006	! t0_kref+0x25c:   	bleu,a,pt	%icc, _kref+0x274
	.word	0xa27eefc7	! t0_kref+0x260:   	sdiv	%i3, 0xfc7, %l1
	.word	0xa32d201b	! t0_kref+0x264:   	sll	%l4, 0x1b, %l1
	.word	0x81ad8a4a	! t0_kref+0x268:   	fcmpd	%fcc0, %f22, %f10
	.word	0xa9418000	! t0_kref+0x26c:   	mov	%fprs, %l4
	.word	0xe4563fe2	! t0_kref+0x270:   	ldsh	[%i0 - 0x1e], %l2
	.word	0xe6267fe8	! t0_kref+0x274:   	st	%l3, [%i1 - 0x18]
	.word	0xda7e7ff4	! t0_kref+0x278:   	swap	[%i1 - 0xc], %o5
	.word	0x95a00135	! t0_kref+0x27c:   	fabss	%f21, %f10
	.word	0xa2644017	! t0_kref+0x280:   	subc	%l1, %l7, %l1
	.word	0xe2965000	! t0_kref+0x284:   	lduha	[%i1]0x80, %l1
	.word	0xc5ee1014	! t0_kref+0x288:   	prefetcha	%i0 + %l4, 2
	.word	0xe926200c	! t0_kref+0x28c:   	st	%f20, [%i0 + 0xc]
	.word	0xa5382009	! t0_kref+0x290:   	sra	%g0, 0x9, %l2
	.word	0xc807bfec	! t0_kref+0x294:   	ld	[%fp - 0x14], %g4
	.word	0xea4e8018	! t0_kref+0x298:   	ldsb	[%i2 + %i0], %l5
	.word	0xa22c37b8	! t0_kref+0x29c:   	andn	%l0, -0x848, %l1
	.word	0xe168a001	! t0_kref+0x2a0:   	prefetch	%g2 + 1, 16
	.word	0x95a01a56	! t0_kref+0x2a4:   	fdtoi	%f22, %f10
	.word	0xc168a085	! t0_kref+0x2a8:   	prefetch	%g2 + 0x85, 0
	.word	0xc36e4000	! t0_kref+0x2ac:   	prefetch	%i1, 1
	.word	0x38480008	! t0_kref+0x2b0:   	bgu,a,pt	%icc, _kref+0x2d0
	.word	0xe1ee501b	! t0_kref+0x2b4:   	prefetcha	%i1 + %i3, 16
	.word	0x95a01933	! t0_kref+0x2b8:   	fstod	%f19, %f10
	.word	0xa83ac014	! t0_kref+0x2bc:   	xnor	%o3, %l4, %l4
	.word	0xa80dc015	! t0_kref+0x2c0:   	and	%l7, %l5, %l4
	.word	0x81ad0ad2	! t0_kref+0x2c4:   	fcmped	%fcc0, %f20, %f18
	.word	0xa466c00b	! t0_kref+0x2c8:   	subc	%i3, %o3, %l2
	.word	0xe4500018	! t0_kref+0x2cc:   	ldsh	[%g0 + %i0], %l2
	.word	0x95a01888	! t0_kref+0x2d0:   	fitos	%f8, %f10
	.word	0xea40a018	! t0_kref+0x2d4:   	ldsw	[%g2 + 0x18], %l5
	.word	0x9de3bfa0	! t0_kref+0x2d8:   	save	%sp, -0x60, %sp
	.word	0xbb002d01	! t0_kref+0x2dc:   	taddcc	%g0, 0xd01, %i5
	.word	0xa1ee0018	! t0_kref+0x2e0:   	restore	%i0, %i0, %l0
	.word	0xab3d0008	! t0_kref+0x2e4:   	sra	%l4, %o0, %l5
	.word	0xea163ff4	! t0_kref+0x2e8:   	lduh	[%i0 - 0xc], %l5
	.word	0x81accaa9	! t0_kref+0x2ec:   	fcmpes	%fcc0, %f19, %f9
	.word	0x97a00028	! t0_kref+0x2f0:   	fmovs	%f8, %f11
	.word	0x25218ef9	! t0_kref+0x2f4:   	sethi	%hi(0x863be400), %l2
	.word	0x31480004	! t0_kref+0x2f8:   	fba,a,pt	%fcc0, _kref+0x308
	.word	0xe9200019	! t0_kref+0x2fc:   	st	%f20, [%g0 + %i1]
	.word	0xa0746e15	! t0_kref+0x300:   	udiv	%l1, 0xe15, %l0
	.word	0xa6bec010	! t0_kref+0x304:   	xnorcc	%i3, %l0, %l3
	.word	0xa3408000	! t0_kref+0x308:   	mov	%ccr, %l1
	.word	0x81dfeab6	! t0_kref+0x30c:   	flush	%i7 + 0xab6
	.word	0xa80b203a	! t0_kref+0x310:   	and	%o4, 0x3a, %l4
	.word	0xaba549af	! t0_kref+0x314:   	fdivs	%f21, %f15, %f21
	.word	0xa2e23f47	! t0_kref+0x318:   	subccc	%o0, -0xb9, %l1
	.word	0x99a488b1	! t0_kref+0x31c:   	fsubs	%f18, %f17, %f12
	.word	0xa4fec014	! t0_kref+0x320:   	sdivcc	%i3, %l4, %l2
	.word	0xa322a590	! t0_kref+0x324:   	mulscc	%o2, 0x590, %l1
	.word	0xe850a034	! t0_kref+0x328:   	ldsh	[%g2 + 0x34], %l4
	.word	0x81580000	! t0_kref+0x32c:   	flushw
	.word	0xa81b73d4	! t0_kref+0x330:   	xor	%o5, -0xc2c, %l4
	.word	0xa2f2c01b	! t0_kref+0x334:   	udivcc	%o3, %i3, %l1
	.word	0xda28a003	! t0_kref+0x338:   	stb	%o5, [%g2 + 3]
	.word	0x81ad0ab1	! t0_kref+0x33c:   	fcmpes	%fcc0, %f20, %f17
	.word	0xa5a509d2	! t0_kref+0x340:   	fdivd	%f20, %f18, %f18
	.word	0xaba4c8b4	! t0_kref+0x344:   	fsubs	%f19, %f20, %f21
	.word	0xa03a6fa6	! t0_kref+0x348:   	xnor	%o1, 0xfa6, %l0
	.word	0xea08a017	! t0_kref+0x34c:   	ldub	[%g2 + 0x17], %l5
	.word	0xd9be9a19	! t0_kref+0x350:   	stda	%f12, [%i2 + %i1]0xd0
	.word	0x2126a1ef	! t0_kref+0x354:   	sethi	%hi(0x9a87bc00), %l0
	.word	0xeb6e7fe8	! t0_kref+0x358:   	prefetch	%i1 - 0x18, 21
	.word	0xa0c4400c	! t0_kref+0x35c:   	addccc	%l1, %o4, %l0
	.word	0xe050a03e	! t0_kref+0x360:   	ldsh	[%g2 + 0x3e], %l0
	.word	0x9da00534	! t0_kref+0x364:   	fsqrts	%f20, %f14
	.word	0xa85c8016	! t0_kref+0x368:   	smul	%l2, %l6, %l4
	.word	0xe406401c	! t0_kref+0x36c:   	ld	[%i1 + %i4], %l2
	.word	0x9da01a2f	! t0_kref+0x370:   	fstoi	%f15, %f14
	.word	0xa5400000	! t0_kref+0x374:   	mov	%y, %l2
	.word	0xf1ee501d	! t0_kref+0x378:   	prefetcha	%i1 + %i5, 24
	.word	0x81580000	! t0_kref+0x37c:   	flushw
	.word	0xa5a01933	! t0_kref+0x380:   	fstod	%f19, %f18
	.word	0xab2b6019	! t0_kref+0x384:   	sll	%o5, 0x19, %l5
	.word	0xc028a01b	! t0_kref+0x388:   	clrb	[%g2 + 0x1b]
	.word	0xa064401b	! t0_kref+0x38c:   	subc	%l1, %i3, %l0
	.word	0x2a800003	! t0_kref+0x390:   	bcs,a	_kref+0x39c
	.word	0x9ba0002b	! t0_kref+0x394:   	fmovs	%f11, %f13
	.word	0x81ac8a56	! t0_kref+0x398:   	fcmpd	%fcc0, %f18, %f22
	.word	0x81ad0a4a	! t0_kref+0x39c:   	fcmpd	%fcc0, %f20, %f10
	.word	0xec1e0000	! t0_kref+0x3a0:   	ldd	[%i0], %l6
	.word	0xa825a79a	! t0_kref+0x3a4:   	sub	%l6, 0x79a, %l4
	.word	0xa62b4000	! t0_kref+0x3a8:   	andn	%o5, %g0, %l3
	.word	0xa4930000	! t0_kref+0x3ac:   	orcc	%o4, %g0, %l2
	.word	0xc0ee101a	! t0_kref+0x3b0:   	ldstuba	[%i0 + %i2]0x80, %g0
	.word	0x23480004	! t0_kref+0x3b4:   	fbne,a,pt	%fcc0, _kref+0x3c4
	.word	0xa65ea74f	! t0_kref+0x3b8:   	smul	%i2, 0x74f, %l3
	.word	0xe320a028	! t0_kref+0x3bc:   	st	%f17, [%g2 + 0x28]
	.word	0xa3228009	! t0_kref+0x3c0:   	mulscc	%o2, %o1, %l1
	.word	0xa222280b	! t0_kref+0x3c4:   	sub	%o0, 0x80b, %l1
	.word	0x81ab0a4e	! t0_kref+0x3c8:   	fcmpd	%fcc0, %f12, %f14
	.word	0xa524a079	! t0_kref+0x3cc:   	mulscc	%l2, 0x79, %l2
	.word	0xe8267ff0	! t0_kref+0x3d0:   	st	%l4, [%i1 - 0x10]
	.word	0x95a0192d	! t0_kref+0x3d4:   	fstod	%f13, %f10
	.word	0xa6748010	! t0_kref+0x3d8:   	udiv	%l2, %l0, %l3
	.word	0xe1bf5a19	! t0_kref+0x3dc:   	stda	%f16, [%i5 + %i1]0xd0
	.word	0x3a800006	! t0_kref+0x3e0:   	bcc,a	_kref+0x3f8
	.word	0x99a01910	! t0_kref+0x3e4:   	fitod	%f16, %f12
	.word	0x9da000b2	! t0_kref+0x3e8:   	fnegs	%f18, %f14
	.word	0xa29d74e7	! t0_kref+0x3ec:   	xorcc	%l5, -0xb19, %l1
	.word	0x81ac0ab1	! t0_kref+0x3f0:   	fcmpes	%fcc0, %f16, %f17
	.word	0xa49b7421	! t0_kref+0x3f4:   	xorcc	%o5, -0xbdf, %l2
	.word	0xec9e1000	! t0_kref+0x3f8:   	ldda	[%i0]0x80, %l6
	.word	0xea162000	! t0_kref+0x3fc:   	lduh	[%i0], %l5
	.word	0x3b480003	! t0_kref+0x400:   	fble,a,pt	%fcc0, _kref+0x40c
	.word	0xa9400000	! t0_kref+0x404:   	mov	%y, %l4
	.word	0xa47b240e	! t0_kref+0x408:   	sdiv	%o4, 0x40e, %l2
	.word	0xee7e2000	! t0_kref+0x40c:   	swap	[%i0], %l7
	.word	0x81ad0ab2	! t0_kref+0x410:   	fcmpes	%fcc0, %f20, %f18
	.word	0xc16e2000	! t0_kref+0x414:   	prefetch	%i0, 0
	.word	0x9fa4c9ad	! t0_kref+0x418:   	fdivs	%f19, %f13, %f15
	.word	0xe2680018	! t0_kref+0x41c:   	ldstub	[%g0 + %i0], %l1
	.word	0xd900a038	! t0_kref+0x420:   	ld	[%g2 + 0x38], %f12
	.word	0x27480002	! t0_kref+0x424:   	fbul,a,pt	%fcc0, _kref+0x42c
	.word	0xee267fe4	! t0_kref+0x428:   	st	%l7, [%i1 - 0x1c]
	.word	0xd09e101d	! t0_kref+0x42c:   	ldda	[%i0 + %i5]0x80, %o0
	.word	0xaac6c014	! t0_kref+0x430:   	addccc	%i3, %l4, %l5
	.word	0x3d480008	! t0_kref+0x434:   	fbule,a,pt	%fcc0, _kref+0x454
	.word	0xa49d800b	! t0_kref+0x438:   	xorcc	%l6, %o3, %l2
	.word	0x95a408c8	! t0_kref+0x43c:   	fsubd	%f16, %f8, %f10
	.word	0xa92de007	! t0_kref+0x440:   	sll	%l7, 0x7, %l4
	.word	0xe4466008	! t0_kref+0x444:   	ldsw	[%i1 + 8], %l2
	.word	0xe8470018	! t0_kref+0x448:   	ldsw	[%i4 + %i0], %l4
	.word	0x30480008	! t0_kref+0x44c:   	ba,a,pt	%icc, _kref+0x46c
	.word	0xa33ca015	! t0_kref+0x450:   	sra	%l2, 0x15, %l1
	.word	0xa0adc012	! t0_kref+0x454:   	andncc	%l7, %l2, %l0
	.word	0xedee501c	! t0_kref+0x458:   	prefetcha	%i1 + %i4, 22
	.word	0xa65b000c	! t0_kref+0x45c:   	smul	%o4, %o4, %l3
	.word	0xa1a408b0	! t0_kref+0x460:   	fsubs	%f16, %f16, %f16
	.word	0xec20a024	! t0_kref+0x464:   	st	%l6, [%g2 + 0x24]
	.word	0x3c800001	! t0_kref+0x468:   	bpos,a	_kref+0x46c
	.word	0xc5ee5013	! t0_kref+0x46c:   	prefetcha	%i1 + %l3, 2
	.word	0x81ab4ab1	! t0_kref+0x470:   	fcmpes	%fcc0, %f13, %f17
	.word	0xe99e101d	! t0_kref+0x474:   	ldda	[%i0 + %i5]0x80, %f20
	.word	0x81ab8a48	! t0_kref+0x478:   	fcmpd	%fcc0, %f14, %f8
	.word	0x81ad0a33	! t0_kref+0x47c:   	fcmps	%fcc0, %f20, %f19
	.word	0x81580000	! t0_kref+0x480:   	flushw
	.word	0xa2d24009	! t0_kref+0x484:   	umulcc	%o1, %o1, %l1
	.word	0xa5a01a50	! t0_kref+0x488:   	fdtoi	%f16, %f18
	.word	0x9da409d2	! t0_kref+0x48c:   	fdivd	%f16, %f18, %f14
	.word	0x99a5082b	! t0_kref+0x490:   	fadds	%f20, %f11, %f12
	.word	0x91a0190d	! t0_kref+0x494:   	fitod	%f13, %f8
	.word	0xe81f4018	! t0_kref+0x498:   	ldd	[%i5 + %i0], %l4
	.word	0x81accaac	! t0_kref+0x49c:   	fcmpes	%fcc0, %f19, %f12
	.word	0xa33ae00b	! t0_kref+0x4a0:   	sra	%o3, 0xb, %l1
	.word	0xe610a016	! t0_kref+0x4a4:   	lduh	[%g2 + 0x16], %l3
	.word	0xa2923240	! t0_kref+0x4a8:   	orcc	%o0, -0xdc0, %l1
	.word	0x2a800002	! t0_kref+0x4ac:   	bcs,a	_kref+0x4b4
	.word	0x81dbe964	! t0_kref+0x4b0:   	flush	%o7 + 0x964
	.word	0xaa626ecb	! t0_kref+0x4b4:   	subc	%o1, 0xecb, %l5
	.word	0xe8871019	! t0_kref+0x4b8:   	lda	[%i4 + %i1]0x80, %l4
	.word	0x93a589b2	! t0_kref+0x4bc:   	fdivs	%f22, %f18, %f9
	.word	0xb6102006	! t0_kref+0x4c0:   	mov	0x6, %i3
	.word	0xa024c01a	! t0_kref+0x4c4:   	sub	%l3, %i2, %l0
	.word	0xa006800c	! t0_kref+0x4c8:   	add	%i2, %o4, %l0
	.word	0xa8352844	! t0_kref+0x4cc:   	orn	%l4, 0x844, %l4
	.word	0xa5a00536	! t0_kref+0x4d0:   	fsqrts	%f22, %f18
	.word	0xaa7aefb2	! t0_kref+0x4d4:   	sdiv	%o3, 0xfb2, %l5
	.word	0xaa146736	! t0_kref+0x4d8:   	or	%l1, 0x736, %l5
	.word	0xa8fc6084	! t0_kref+0x4dc:   	sdivcc	%l1, 0x84, %l4
	.word	0xa0bd4000	! t0_kref+0x4e0:   	xnorcc	%l5, %g0, %l0
	.word	0xa052c009	! t0_kref+0x4e4:   	umul	%o3, %o1, %l0
	.word	0x95a01909	! t0_kref+0x4e8:   	fitod	%f9, %f10
	.word	0xe6400019	! t0_kref+0x4ec:   	ldsw	[%g0 + %i1], %l3
	.word	0xe8400018	! t0_kref+0x4f0:   	ldsw	[%g0 + %i0], %l4
	.word	0xa9a0188e	! t0_kref+0x4f4:   	fitos	%f14, %f20
	.word	0x9de3bfa0	! t0_kref+0x4f8:   	save	%sp, -0x60, %sp
	.word	0xa5ef6233	! t0_kref+0x4fc:   	restore	%i5, 0x233, %l2
	.word	0xa0948013	! t0_kref+0x500:   	orcc	%l2, %l3, %l0
	.word	0xa65d363e	! t0_kref+0x504:   	smul	%l4, -0x9c2, %l3
	.word	0xe456001b	! t0_kref+0x508:   	ldsh	[%i0 + %i3], %l2
	.word	0xa476f1fd	! t0_kref+0x50c:   	udiv	%i3, -0xe03, %l2
	.word	0xed20a028	! t0_kref+0x510:   	st	%f22, [%g2 + 0x28]
	.word	0xe600a008	! t0_kref+0x514:   	ld	[%g2 + 8], %l3
	.word	0xa4b0001a	! t0_kref+0x518:   	orncc	%g0, %i2, %l2
	.word	0xe4062014	! t0_kref+0x51c:   	ld	[%i0 + 0x14], %l2
	.word	0xa33b4010	! t0_kref+0x520:   	sra	%o5, %l0, %l1
	.word	0xa2bac01b	! t0_kref+0x524:   	xnorcc	%o3, %i3, %l1
	.word	0x9fa389aa	! t0_kref+0x528:   	fdivs	%f14, %f10, %f15
	.word	0xa9a01a48	! t0_kref+0x52c:   	fdtoi	%f8, %f20
	.word	0x33480007	! t0_kref+0x530:   	fbe,a,pt	%fcc0, _kref+0x54c
	.word	0xd87e601c	! t0_kref+0x534:   	swap	[%i1 + 0x1c], %o4
	.word	0xe3ee101a	! t0_kref+0x538:   	prefetcha	%i0 + %i2, 17
	.word	0x39480005	! t0_kref+0x53c:   	fbuge,a,pt	%fcc0, _kref+0x550
	.word	0xe45e401d	! t0_kref+0x540:   	ldx	[%i1 + %i5], %l2
	.word	0xa0358016	! t0_kref+0x544:   	orn	%l6, %l6, %l0
	.word	0xd520a034	! t0_kref+0x548:   	st	%f10, [%g2 + 0x34]
	.word	0x91a01a4a	! t0_kref+0x54c:   	fdtoi	%f10, %f8
	.word	0xda6e001a	! t0_kref+0x550:   	ldstub	[%i0 + %i2], %o5
	.word	0xed68a080	! t0_kref+0x554:   	prefetch	%g2 + 0x80, 22
	.word	0xaa5d801a	! t0_kref+0x558:   	smul	%l6, %i2, %l5
	.word	0xe000a01c	! t0_kref+0x55c:   	ld	[%g2 + 0x1c], %l0
	.word	0xef68a00b	! t0_kref+0x560:   	prefetch	%g2 + 0xb, 23
	.word	0x2503a581	! t0_kref+0x564:   	sethi	%hi(0xe960400), %l2
	.word	0xa655e689	! t0_kref+0x568:   	umul	%l7, 0x689, %l3
	.word	0x8610200a	! t0_kref+0x56c:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x570:   	subcc	%g3, 1, %g3
	.word	0x22800017	! t0_kref+0x574:   	be,a	_kref+0x5d0
	.word	0xab400000	! t0_kref+0x578:   	mov	%y, %l5
	.word	0x9ba00529	! t0_kref+0x57c:   	fsqrts	%f9, %f13
	.word	0xa6802f2e	! t0_kref+0x580:   	addcc	%g0, 0xf2e, %l3
	.word	0xa63b6433	! t0_kref+0x584:   	xnor	%o5, 0x433, %l3
	.word	0xe230a02e	! t0_kref+0x588:   	sth	%l1, [%g2 + 0x2e]
	.word	0x3d480002	! t0_kref+0x58c:   	fbule,a,pt	%fcc0, _kref+0x594
	.word	0xd4682b22	! t0_kref+0x590:   	ldstub	[%g0 + 0xb22], %o2
	.word	0xf76e401c	! t0_kref+0x594:   	prefetch	%i1 + %i4, 27
	.word	0xa4fe800c	! t0_kref+0x598:   	sdivcc	%i2, %o4, %l2
	.word	0xd5267ff4	! t0_kref+0x59c:   	st	%f10, [%i1 - 0xc]
	.word	0xaac4e7b8	! t0_kref+0x5a0:   	addccc	%l3, 0x7b8, %l5
	.word	0xd3000018	! t0_kref+0x5a4:   	ld	[%g0 + %i0], %f9
	.word	0xa696801a	! t0_kref+0x5a8:   	orcc	%i2, %i2, %l3
	.word	0xaba01a48	! t0_kref+0x5ac:   	fdtoi	%f8, %f21
	.word	0xeeae1000	! t0_kref+0x5b0:   	stba	%l7, [%i0]0x80
	.word	0xca116960	! t0_kref+0x5b4:   	lduh	[%g5 + 0x960], %g5
	.word	0xaaab354c	! t0_kref+0x5b8:   	andncc	%o4, -0xab4, %l5
	.word	0xa0bc77e2	! t0_kref+0x5bc:   	xnorcc	%l1, -0x81e, %l0
	.word	0xe450a036	! t0_kref+0x5c0:   	ldsh	[%g2 + 0x36], %l2
	.word	0xa86523d2	! t0_kref+0x5c4:   	subc	%l4, 0x3d2, %l4
	.word	0xe80e3fe3	! t0_kref+0x5c8:   	ldub	[%i0 - 0x1d], %l4
	.word	0xa1a58d36	! t0_kref+0x5cc:   	fsmuld	%f22, %f22, %f16
	.word	0xd920a01c	! t0_kref+0x5d0:   	st	%f12, [%g2 + 0x1c]
	.word	0xa835f38d	! t0_kref+0x5d4:   	orn	%l7, -0xc73, %l4
	.word	0xa4734009	! t0_kref+0x5d8:   	udiv	%o5, %o1, %l2
	.word	0xe206600c	! t0_kref+0x5dc:   	ld	[%i1 + 0xc], %l1
	.word	0x26800001	! t0_kref+0x5e0:   	bl,a	_kref+0x5e4
	.word	0xa9a209ab	! t0_kref+0x5e4:   	fdivs	%f8, %f11, %f20
	.word	0x81ab0a54	! t0_kref+0x5e8:   	fcmpd	%fcc0, %f12, %f20
	.word	0xea4e3fea	! t0_kref+0x5ec:   	ldsb	[%i0 - 0x16], %l5
	.word	0xe1063fe0	! t0_kref+0x5f0:   	ld	[%i0 - 0x20], %f16
	.word	0x81ac4a33	! t0_kref+0x5f4:   	fcmps	%fcc0, %f17, %f19
	.word	0xe168a04f	! t0_kref+0x5f8:   	prefetch	%g2 + 0x4f, 16
	.word	0xaa74eae6	! t0_kref+0x5fc:   	udiv	%l3, 0xae6, %l5
	.word	0xa9a01110	! t0_kref+0x600:   	fxtod	%f16, %f20
	.word	0xeea81018	! t0_kref+0x604:   	stba	%l7, [%g0 + %i0]0x80
	.word	0x23480006	! t0_kref+0x608:   	fbne,a,pt	%fcc0, _kref+0x620
	.word	0xaba00528	! t0_kref+0x60c:   	fsqrts	%f8, %f21
	.word	0xaa5b7889	! t0_kref+0x610:   	smul	%o5, -0x777, %l5
	.word	0xa340c000	! t0_kref+0x614:   	mov	%asi, %l1
	.word	0x81d87316	! t0_kref+0x618:   	flush	%g1 - 0xcea
	.word	0xa03a3903	! t0_kref+0x61c:   	xnor	%o0, -0x6fd, %l0
	.word	0xaabd801a	! t0_kref+0x620:   	xnorcc	%l6, %i2, %l5
	.word	0xe24e0000	! t0_kref+0x624:   	ldsb	[%i0], %l1
	.word	0xe0680018	! t0_kref+0x628:   	ldstub	[%g0 + %i0], %l0
	.word	0xa65b0017	! t0_kref+0x62c:   	smul	%o4, %l7, %l3
	.word	0xa89ac015	! t0_kref+0x630:   	xorcc	%o3, %l5, %l4
	.word	0xa6f6f1f7	! t0_kref+0x634:   	udivcc	%i3, -0xe09, %l3
	.word	0xe00e3feb	! t0_kref+0x638:   	ldub	[%i0 - 0x15], %l0
	.word	0xa2acb492	! t0_kref+0x63c:   	andncc	%l2, -0xb6e, %l1
	.word	0xe430a00e	! t0_kref+0x640:   	sth	%l2, [%g2 + 0xe]
	.word	0xd1981018	! t0_kref+0x644:   	ldda	[%g0 + %i0]0x80, %f8
	.word	0xd100a028	! t0_kref+0x648:   	ld	[%g2 + 0x28], %f8
	.word	0xe76e001d	! t0_kref+0x64c:   	prefetch	%i0 + %i5, 19
	.word	0xf628a03e	! t0_kref+0x650:   	stb	%i3, [%g2 + 0x3e]
	.word	0xb410200f	! t0_kref+0x654:   	mov	0xf, %i2
	.word	0x8182c000	! t0_kref+0x658:   	wr	%o3, %g0, %y
	.word	0x9ba409ae	! t0_kref+0x65c:   	fdivs	%f16, %f14, %f13
	.word	0xa6947095	! t0_kref+0x660:   	orcc	%l1, -0xf6b, %l3
	.word	0xa7a00535	! t0_kref+0x664:   	fsqrts	%f21, %f19
	.word	0xe80e3ff7	! t0_kref+0x668:   	ldub	[%i0 - 9], %l4
	.word	0xe8163ffe	! t0_kref+0x66c:   	lduh	[%i0 - 2], %l4
	.word	0xa1a00533	! t0_kref+0x670:   	fsqrts	%f19, %f16
	.word	0x250b3660	! t0_kref+0x674:   	sethi	%hi(0x2cd98000), %l2
	.word	0xe4562016	! t0_kref+0x678:   	ldsh	[%i0 + 0x16], %l2
	.word	0xd3266008	! t0_kref+0x67c:   	st	%f9, [%i1 + 8]
	.word	0xeb68a082	! t0_kref+0x680:   	prefetch	%g2 + 0x82, 21
	.word	0xa6958010	! t0_kref+0x684:   	orcc	%l6, %l0, %l3
	.word	0xe3ee101d	! t0_kref+0x688:   	prefetcha	%i0 + %i5, 17
	.word	0x9de3bfa0	! t0_kref+0x68c:   	save	%sp, -0x60, %sp
	.word	0xb6964019	! t0_kref+0x690:   	orcc	%i1, %i1, %i3
	.word	0xa5ee22a5	! t0_kref+0x694:   	restore	%i0, 0x2a5, %l2
	.word	0x3f480002	! t0_kref+0x698:   	fbo,a,pt	%fcc0, _kref+0x6a0
	.word	0xd1260000	! t0_kref+0x69c:   	st	%f8, [%i0]
	.word	0xe9ee501c	! t0_kref+0x6a0:   	prefetcha	%i1 + %i4, 20
	.word	0xa32c000c	! t0_kref+0x6a4:   	sll	%l0, %o4, %l1
	.word	0xa23c7df4	! t0_kref+0x6a8:   	xnor	%l1, -0x20c, %l1
	.word	0xa72ae005	! t0_kref+0x6ac:   	sll	%o3, 0x5, %l3
	.word	0x99a44d31	! t0_kref+0x6b0:   	fsmuld	%f17, %f17, %f12
	.word	0xa5a01914	! t0_kref+0x6b4:   	fitod	%f20, %f18
	.word	0xe900a020	! t0_kref+0x6b8:   	ld	[%g2 + 0x20], %f20
	.word	0xe408a027	! t0_kref+0x6bc:   	ldub	[%g2 + 0x27], %l2
	.word	0xe100a020	! t0_kref+0x6c0:   	ld	[%g2 + 0x20], %f16
	.word	0xab25800c	! t0_kref+0x6c4:   	mulscc	%l6, %o4, %l5
	.word	0xa4723208	! t0_kref+0x6c8:   	udiv	%o0, -0xdf8, %l2
	.word	0x32480008	! t0_kref+0x6cc:   	bne,a,pt	%icc, _kref+0x6ec
	.word	0xd120a000	! t0_kref+0x6d0:   	st	%f8, [%g2]
	.word	0xaad225c4	! t0_kref+0x6d4:   	umulcc	%o0, 0x5c4, %l5
	.word	0xa5a24d2f	! t0_kref+0x6d8:   	fsmuld	%f9, %f15, %f18
	.word	0xab3c8012	! t0_kref+0x6dc:   	sra	%l2, %l2, %l5
	.word	0x81ad4aab	! t0_kref+0x6e0:   	fcmpes	%fcc0, %f21, %f11
	.word	0xe3b8a080	! t0_kref+0x6e4:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x99a01a54	! t0_kref+0x6e8:   	fdtoi	%f20, %f12
	.word	0xa5a01a4c	! t0_kref+0x6ec:   	fdtoi	%f12, %f18
	.word	0xa85ce3f3	! t0_kref+0x6f0:   	smul	%l3, 0x3f3, %l4
	.word	0x9e006250	! t0_kref+0x6f4:   	add	%g1, 0x250, %o7
!	.word	0x3d85863f	! t0_kref+0x6f8:   	fbule,a	SYM(t0_subr2)
	   	fbule,a	SYM(t0_subr2)
	.word	0xe64e6007	! t0_kref+0x6fc:   	ldsb	[%i1 + 7], %l3
	.word	0x9de3bfa0	! t0_kref+0x700:   	save	%sp, -0x60, %sp
	.word	0xb856c01a	! t0_kref+0x704:   	umul	%i3, %i2, %i4
	.word	0xa7ee401b	! t0_kref+0x708:   	restore	%i1, %i3, %l3
	.word	0xa2a4b1ac	! t0_kref+0x70c:   	subcc	%l2, -0xe54, %l1
	.word	0x81ac8ab2	! t0_kref+0x710:   	fcmpes	%fcc0, %f18, %f18
	.word	0xe408627c	! t0_kref+0x714:   	ldub	[%g1 + 0x27c], %l2
	.word	0xa41ca00c	! t0_kref+0x718:   	xor	%l2, 0xc, %l2
	.word	0xe428627c	! t0_kref+0x71c:   	stb	%l2, [%g1 + 0x27c]
	.word	0x81d8627c	! t0_kref+0x720:   	flush	%g1 + 0x27c
2:	.word	0x2b34cb54	! t0_kref+0x724:   	sethi	%hi(0xd32d5000), %l5
	.word	0xeeff1019	! t0_kref+0x728:   	swapa	[%i4 + %i1]0x80, %l7
	.word	0xe6567ffc	! t0_kref+0x72c:   	ldsh	[%i1 - 4], %l3
	.word	0xa8bdb741	! t0_kref+0x730:   	xnorcc	%l6, -0x8bf, %l4
	.word	0xa8433f2c	! t0_kref+0x734:   	addc	%o4, -0xd4, %l4
	.word	0xff6e7ff0	! t0_kref+0x738:   	prefetch	%i1 - 0x10, 31
	.word	0xa5a20932	! t0_kref+0x73c:   	fmuls	%f8, %f18, %f18
	.word	0xaa42f640	! t0_kref+0x740:   	addc	%o3, -0x9c0, %l5
	.word	0x83414000	! t0_kref+0x744:   	mov	%pc, %g1
	.word	0x91a0192e	! t0_kref+0x748:   	fstod	%f14, %f8
	.word	0xd67e2018	! t0_kref+0x74c:   	swap	[%i0 + 0x18], %o3
	.word	0xe19e5a5d	! t0_kref+0x750:   	ldda	[%i1 + %i5]0xd2, %f16
	.word	0x97a000af	! t0_kref+0x754:   	fnegs	%f15, %f11
	.word	0xe04e7ffd	! t0_kref+0x758:   	ldsb	[%i1 - 3], %l0
	.word	0x91a488d6	! t0_kref+0x75c:   	fsubd	%f18, %f22, %f8
	.word	0xe6480019	! t0_kref+0x760:   	ldsb	[%g0 + %i1], %l3
	.word	0xea6e001a	! t0_kref+0x764:   	ldstub	[%i0 + %i2], %l5
	.word	0x95a00535	! t0_kref+0x768:   	fsqrts	%f21, %f10
	.word	0xa8e2c012	! t0_kref+0x76c:   	subccc	%o3, %l2, %l4
	.word	0x2e480006	! t0_kref+0x770:   	bvs,a,pt	%icc, _kref+0x788
	.word	0xa0ad27e5	! t0_kref+0x774:   	andncc	%l4, 0x7e5, %l0
	.word	0xea166006	! t0_kref+0x778:   	lduh	[%i1 + 6], %l5
	.word	0x9da01933	! t0_kref+0x77c:   	fstod	%f19, %f14
	.word	0x95a000b1	! t0_kref+0x780:   	fnegs	%f17, %f10
	.word	0xa6252d55	! t0_kref+0x784:   	sub	%l4, 0xd55, %l3
	.word	0x35480003	! t0_kref+0x788:   	fbue,a,pt	%fcc0, _kref+0x794
	.word	0xa6ac229d	! t0_kref+0x78c:   	andncc	%l0, 0x29d, %l3
	.word	0x2f480008	! t0_kref+0x790:   	fbu,a,pt	%fcc0, _kref+0x7b0
	.word	0xe4070019	! t0_kref+0x794:   	ld	[%i4 + %i1], %l2
	.word	0xd9be1a1b	! t0_kref+0x798:   	stda	%f12, [%i0 + %i3]0xd0
	.word	0xada0108a	! t0_kref+0x79c:   	fxtos	%f10, %f22
	.word	0xe640a01c	! t0_kref+0x7a0:   	ldsw	[%g2 + 0x1c], %l3
	.word	0xa3400000	! t0_kref+0x7a4:   	mov	%y, %l1
	.word	0x3e480004	! t0_kref+0x7a8:   	bvc,a,pt	%icc, _kref+0x7b8
	.word	0xa8ac801b	! t0_kref+0x7ac:   	andncc	%l2, %i3, %l4
	.word	0xa0e5b7db	! t0_kref+0x7b0:   	subccc	%l6, -0x825, %l0
	.word	0xa3a0052a	! t0_kref+0x7b4:   	fsqrts	%f10, %f17
	.word	0xe60e4000	! t0_kref+0x7b8:   	ldub	[%i1], %l3
	.word	0xa23b79a8	! t0_kref+0x7bc:   	xnor	%o5, -0x658, %l1
	.word	0xa5418000	! t0_kref+0x7c0:   	mov	%fprs, %l2
	.word	0xe9ee101b	! t0_kref+0x7c4:   	prefetcha	%i0 + %i3, 20
	.word	0xe40860b0	! t0_kref+0x7c8:   	ldub	[%g1 + 0xb0], %l2
	.word	0xa41ca00c	! t0_kref+0x7cc:   	xor	%l2, 0xc, %l2
	.word	0xe42860b0	! t0_kref+0x7d0:   	stb	%l2, [%g1 + 0xb0]
	.word	0x81d860b0	! t0_kref+0x7d4:   	flush	%g1 + 0xb0
	.word	0xa123000a	! t0_kref+0x7d8:   	mulscc	%o4, %o2, %l0
	.word	0xa1418000	! t0_kref+0x7dc:   	mov	%fprs, %l0
	.word	0xa8ab7e33	! t0_kref+0x7e0:   	andncc	%o5, -0x1cd, %l4
	.word	0xa262e48a	! t0_kref+0x7e4:   	subc	%o3, 0x48a, %l1
	.word	0xa5254010	! t0_kref+0x7e8:   	mulscc	%l5, %l0, %l2
	.word	0x81ab4ab2	! t0_kref+0x7ec:   	fcmpes	%fcc0, %f13, %f18
	.word	0xa2e32ede	! t0_kref+0x7f0:   	subccc	%o4, 0xede, %l1
2:	.word	0xa1a01912	! t0_kref+0x7f4:   	fitod	%f18, %f16
	.word	0x99a000b0	! t0_kref+0x7f8:   	fnegs	%f16, %f12
	.word	0xa7244015	! t0_kref+0x7fc:   	mulscc	%l1, %l5, %l3
	.word	0xe26e2003	! t0_kref+0x800:   	ldstub	[%i0 + 3], %l1
	.word	0xa45a61a3	! t0_kref+0x804:   	smul	%o1, 0x1a3, %l2
	.word	0x2c800007	! t0_kref+0x808:   	bneg,a	_kref+0x824
	.word	0xe06e200d	! t0_kref+0x80c:   	ldstub	[%i0 + 0xd], %l0
	.word	0x91a01909	! t0_kref+0x810:   	fitod	%f9, %f8
	.word	0xa9a4c933	! t0_kref+0x814:   	fmuls	%f19, %f19, %f20
	.word	0xa8e4e493	! t0_kref+0x818:   	subccc	%l3, 0x493, %l4
	.word	0xa82dfb47	! t0_kref+0x81c:   	andn	%l7, -0x4b9, %l4
	.word	0xd5067ff0	! t0_kref+0x820:   	ld	[%i1 - 0x10], %f10
	.word	0xa69b4000	! t0_kref+0x824:   	xorcc	%o5, %g0, %l3
	.word	0xa89d0010	! t0_kref+0x828:   	xorcc	%l4, %l0, %l4
	.word	0xa0654013	! t0_kref+0x82c:   	subc	%l5, %l3, %l0
	.word	0xd628a00f	! t0_kref+0x830:   	stb	%o3, [%g2 + 0xf]
	.word	0xe920a03c	! t0_kref+0x834:   	st	%f20, [%g2 + 0x3c]
	.word	0xe19e5a1c	! t0_kref+0x838:   	ldda	[%i1 + %i4]0xd0, %f16
	.word	0xf428a02c	! t0_kref+0x83c:   	stb	%i2, [%g2 + 0x2c]
	.word	0xe320a01c	! t0_kref+0x840:   	st	%f17, [%g2 + 0x1c]
	.word	0xa8e48017	! t0_kref+0x844:   	subccc	%l2, %l7, %l4
	.word	0xd8270018	! t0_kref+0x848:   	st	%o4, [%i4 + %i0]
	.word	0xa3344012	! t0_kref+0x84c:   	srl	%l1, %l2, %l1
	.word	0xe700a014	! t0_kref+0x850:   	ld	[%g2 + 0x14], %f19
	.word	0x97a01092	! t0_kref+0x854:   	fxtos	%f18, %f11
	.word	0xa73cc01b	! t0_kref+0x858:   	sra	%l3, %i3, %l3
	.word	0x32480004	! t0_kref+0x85c:   	bne,a,pt	%icc, _kref+0x86c
	.word	0xe8167ffc	! t0_kref+0x860:   	lduh	[%i1 - 4], %l4
	.word	0x93a000b0	! t0_kref+0x864:   	fnegs	%f16, %f9
	.word	0xd900a018	! t0_kref+0x868:   	ld	[%g2 + 0x18], %f12
	call	SYM(t0_subr2)
	.word	0x2703c802	! t0_kref+0x870:   	sethi	%hi(0xf200800), %l3
	.word	0xec1e3fe0	! t0_kref+0x874:   	ldd	[%i0 - 0x20], %l6
	.word	0xa5a2c929	! t0_kref+0x878:   	fmuls	%f11, %f9, %f18
	.word	0xea160000	! t0_kref+0x87c:   	lduh	[%i0], %l5
	.word	0xe46e2013	! t0_kref+0x880:   	ldstub	[%i0 + 0x13], %l2
	.word	0xea464000	! t0_kref+0x884:   	ldsw	[%i1], %l5
	.word	0xa5a000b5	! t0_kref+0x888:   	fnegs	%f21, %f18
	.word	0xa4983e14	! t0_kref+0x88c:   	xorcc	%g0, -0x1ec, %l2
	.word	0xa615f042	! t0_kref+0x890:   	or	%l7, -0xfbe, %l3
	.word	0xd278a01c	! t0_kref+0x894:   	swap	[%g2 + 0x1c], %o1
	.word	0xa62a35cd	! t0_kref+0x898:   	andn	%o0, -0xa33, %l3
	.word	0xada94048	! t0_kref+0x89c:   	fmovdug	%fcc0, %f8, %f22
	.word	0xd100a020	! t0_kref+0x8a0:   	ld	[%g2 + 0x20], %f8
	.word	0xaa256bd6	! t0_kref+0x8a4:   	sub	%l5, 0xbd6, %l5
	.word	0x23480001	! t0_kref+0x8a8:   	fbne,a,pt	%fcc0, _kref+0x8ac
	.word	0xe0ce9019	! t0_kref+0x8ac:   	ldsba	[%i2 + %i1]0x80, %l0
	.word	0xa1400000	! t0_kref+0x8b0:   	mov	%y, %l0
	.word	0xe0063ffc	! t0_kref+0x8b4:   	ld	[%i0 - 4], %l0
	.word	0xaa12400d	! t0_kref+0x8b8:   	or	%o1, %o5, %l5
	.word	0x9fa000a9	! t0_kref+0x8bc:   	fnegs	%f9, %f15
	.word	0xa52b0000	! t0_kref+0x8c0:   	sll	%o4, %g0, %l2
	.word	0xe56e2008	! t0_kref+0x8c4:   	prefetch	%i0 + 8, 18
	.word	0xe8067fe8	! t0_kref+0x8c8:   	ld	[%i1 - 0x18], %l4
	.word	0xe0263ff4	! t0_kref+0x8cc:   	st	%l0, [%i0 - 0xc]
	.word	0x81aa4a36	! t0_kref+0x8d0:   	fcmps	%fcc0, %f9, %f22
	.word	0xa1a24830	! t0_kref+0x8d4:   	fadds	%f9, %f16, %f16
	.word	0x36800006	! t0_kref+0x8d8:   	bge,a	_kref+0x8f0
	.word	0xe87e3ff8	! t0_kref+0x8dc:   	swap	[%i0 - 8], %l4
	.word	0x93a9002d	! t0_kref+0x8e0:   	fmovsl	%fcc0, %f13, %f9
	.word	0xe0500018	! t0_kref+0x8e4:   	ldsh	[%g0 + %i0], %l0
	.word	0xab25c00c	! t0_kref+0x8e8:   	mulscc	%l7, %o4, %l5
	.word	0xaa3db607	! t0_kref+0x8ec:   	xnor	%l6, -0x9f9, %l5
	.word	0xa2faf87b	! t0_kref+0x8f0:   	sdivcc	%o3, -0x785, %l1
	.word	0x2a800008	! t0_kref+0x8f4:   	bcs,a	_kref+0x914
	.word	0xec1e3ff8	! t0_kref+0x8f8:   	ldd	[%i0 - 8], %l6
	.word	0x95a20d31	! t0_kref+0x8fc:   	fsmuld	%f8, %f17, %f10
	.word	0xd120a000	! t0_kref+0x900:   	st	%f8, [%g2]
	.word	0xf207bfe0	! t0_kref+0x904:   	ld	[%fp - 0x20], %i1
	.word	0x2e480002	! t0_kref+0x908:   	bvs,a,pt	%icc, _kref+0x910
	.word	0xa1a4cd29	! t0_kref+0x90c:   	fsmuld	%f19, %f9, %f16
	.word	0xa3400000	! t0_kref+0x910:   	mov	%y, %l1
	.word	0xd828a03a	! t0_kref+0x914:   	stb	%o4, [%g2 + 0x3a]
	.word	0x9de3bfa0	! t0_kref+0x918:   	save	%sp, -0x60, %sp
	.word	0xb6980019	! t0_kref+0x91c:   	xorcc	%g0, %i1, %i3
	.word	0xa7ef0018	! t0_kref+0x920:   	restore	%i4, %i0, %l3
	.word	0xa5254012	! t0_kref+0x924:   	mulscc	%l5, %l2, %l2
	.word	0xe2564000	! t0_kref+0x928:   	ldsh	[%i1], %l1
	.word	0x9f414000	! t0_kref+0x92c:   	mov	%pc, %o7
	.word	0xea4e200b	! t0_kref+0x930:   	ldsb	[%i0 + 0xb], %l5
	.word	0xe3b8a080	! t0_kref+0x934:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x99a01a2f	! t0_kref+0x938:   	fstoi	%f15, %f12
	.word	0x81ab8a48	! t0_kref+0x93c:   	fcmpd	%fcc0, %f14, %f8
	.word	0x3e480003	! t0_kref+0x940:   	bvc,a,pt	%icc, _kref+0x94c
	.word	0xe900a00c	! t0_kref+0x944:   	ld	[%g2 + 0xc], %f20
	.word	0x20800006	! t0_kref+0x948:   	bn,a	_kref+0x960
	.word	0xa5a000b3	! t0_kref+0x94c:   	fnegs	%f19, %f18
	.word	0x250cb473	! t0_kref+0x950:   	sethi	%hi(0x32d1cc00), %l2
	.word	0xa8644013	! t0_kref+0x954:   	subc	%l1, %l3, %l4
	.word	0xe8164000	! t0_kref+0x958:   	lduh	[%i1], %l4
	.word	0x3e800004	! t0_kref+0x95c:   	bvc,a	_kref+0x96c
	.word	0xa5a00530	! t0_kref+0x960:   	fsqrts	%f16, %f18
	.word	0xefee101c	! t0_kref+0x964:   	prefetcha	%i0 + %i4, 23
	.word	0xa7a409b1	! t0_kref+0x968:   	fdivs	%f16, %f17, %f19
	.word	0xe76e2018	! t0_kref+0x96c:   	prefetch	%i0 + 0x18, 19
	.word	0xf7ee101d	! t0_kref+0x970:   	prefetcha	%i0 + %i5, 27
	.word	0xa9a01909	! t0_kref+0x974:   	fitod	%f9, %f20
	.word	0x81ad8a2f	! t0_kref+0x978:   	fcmps	%fcc0, %f22, %f15
	.word	0xe51fbf08	! t0_kref+0x97c:   	ldd	[%fp - 0xf8], %f18
	.word	0xa1a588a9	! t0_kref+0x980:   	fsubs	%f22, %f9, %f16
	.word	0xaa62801a	! t0_kref+0x984:   	subc	%o2, %i2, %l5
	.word	0xaa5a2844	! t0_kref+0x988:   	smul	%o0, 0x844, %l5
	.word	0xe24e401a	! t0_kref+0x98c:   	ldsb	[%i1 + %i2], %l1
	.word	0xa8202a9b	! t0_kref+0x990:   	sub	%g0, 0xa9b, %l4
	.word	0x32480005	! t0_kref+0x994:   	bne,a,pt	%icc, _kref+0x9a8
	.word	0x95a01932	! t0_kref+0x998:   	fstod	%f18, %f10
	.word	0x9f414000	! t0_kref+0x99c:   	mov	%pc, %o7
	.word	0xa0d36cfd	! t0_kref+0x9a0:   	umulcc	%o5, 0xcfd, %l0
	.word	0x3f800005	! t0_kref+0x9a4:   	fbo,a	_kref+0x9b8
	.word	0xa00cc000	! t0_kref+0x9a8:   	and	%l3, %g0, %l0
	.word	0xe04e6017	! t0_kref+0x9ac:   	ldsb	[%i1 + 0x17], %l0
	.word	0xa1a01912	! t0_kref+0x9b0:   	fitod	%f18, %f16
	.word	0xda28a036	! t0_kref+0x9b4:   	stb	%o5, [%g2 + 0x36]
	.word	0xa854c009	! t0_kref+0x9b8:   	umul	%l3, %o1, %l4
	.word	0x81ab8a50	! t0_kref+0x9bc:   	fcmpd	%fcc0, %f14, %f16
	.word	0x2712b713	! t0_kref+0x9c0:   	sethi	%hi(0x4adc4c00), %l3
	.word	0xa4f24014	! t0_kref+0x9c4:   	udivcc	%o1, %l4, %l2
	.word	0xa05dc012	! t0_kref+0x9c8:   	smul	%l7, %l2, %l0
	.word	0xeca6101c	! t0_kref+0x9cc:   	sta	%l6, [%i0 + %i4]0x80
	.word	0xfdee101a	! t0_kref+0x9d0:   	prefetcha	%i0 + %i2, 30
	.word	0x95a0052a	! t0_kref+0x9d4:   	fsqrts	%f10, %f10
	.word	0xe53e0000	! t0_kref+0x9d8:   	std	%f18, [%i0]
	.word	0xc807bff0	! t0_kref+0x9dc:   	ld	[%fp - 0x10], %g4
	sethi	%hi(2f), %o7
	.word	0xe40be214	! t0_kref+0x9e4:   	ldub	[%o7 + 0x214], %l2
	.word	0xa41ca00c	! t0_kref+0x9e8:   	xor	%l2, 0xc, %l2
	.word	0xe42be214	! t0_kref+0x9ec:   	stb	%l2, [%o7 + 0x214]
	.word	0x81dbe214	! t0_kref+0x9f0:   	flush	%o7 + 0x214
	.word	0x2b07a6fe	! t0_kref+0x9f4:   	sethi	%hi(0x1e9bf800), %l5
	.word	0xa8a4a1cb	! t0_kref+0x9f8:   	subcc	%l2, 0x1cb, %l4
	.word	0xeb20a02c	! t0_kref+0x9fc:   	st	%f21, [%g2 + 0x2c]
	.word	0xa9a48d32	! t0_kref+0xa00:   	fsmuld	%f18, %f18, %f20
	.word	0x99a58d32	! t0_kref+0xa04:   	fsmuld	%f22, %f18, %f12
	.word	0x99a28d2f	! t0_kref+0xa08:   	fsmuld	%f10, %f15, %f12
	.word	0xaa7eb1af	! t0_kref+0xa0c:   	sdiv	%i2, -0xe51, %l5
	.word	0xa874800c	! t0_kref+0xa10:   	udiv	%l2, %o4, %l4
2:	.word	0xaa75aa56	! t0_kref+0xa14:   	udiv	%l6, 0xa56, %l5
	.word	0x24800002	! t0_kref+0xa18:   	ble,a	_kref+0xa20
	.word	0x91a01a2a	! t0_kref+0xa1c:   	fstoi	%f10, %f8
	.word	0x81ad0ab6	! t0_kref+0xa20:   	fcmpes	%fcc0, %f20, %f22
	.word	0xe8060000	! t0_kref+0xa24:   	ld	[%i0], %l4
	.word	0x97a00536	! t0_kref+0xa28:   	fsqrts	%f22, %f11
	.word	0xa45d2803	! t0_kref+0xa2c:   	smul	%l4, 0x803, %l2
	.word	0x81aa0a50	! t0_kref+0xa30:   	fcmpd	%fcc0, %f8, %f16
	.word	0x2d480003	! t0_kref+0xa34:   	fbg,a,pt	%fcc0, _kref+0xa40
	.word	0x91a0192c	! t0_kref+0xa38:   	fstod	%f12, %f8
	.word	0xd09f5018	! t0_kref+0xa3c:   	ldda	[%i5 + %i0]0x80, %o0
	.word	0xa612767b	! t0_kref+0xa40:   	or	%o1, -0x985, %l3
	.word	0x86102002	! t0_kref+0xa44:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xa48:   	bne,a	_kref+0xa48
	.word	0x86a0e001	! t0_kref+0xa4c:   	subcc	%g3, 1, %g3
	.word	0xa7a0052d	! t0_kref+0xa50:   	fsqrts	%f13, %f19
	.word	0x9da0190f	! t0_kref+0xa54:   	fitod	%f15, %f14
	.word	0xe44e8019	! t0_kref+0xa58:   	ldsb	[%i2 + %i1], %l2
	.word	0x81ac8a2c	! t0_kref+0xa5c:   	fcmps	%fcc0, %f18, %f12
	.word	0xa0724010	! t0_kref+0xa60:   	udiv	%o1, %l0, %l0
	.word	0x95a0052a	! t0_kref+0xa64:   	fsqrts	%f10, %f10
	.word	0xda20a030	! t0_kref+0xa68:   	st	%o5, [%g2 + 0x30]
	.word	0x81ad0aac	! t0_kref+0xa6c:   	fcmpes	%fcc0, %f20, %f12
	.word	0xa062afc2	! t0_kref+0xa70:   	subc	%o2, 0xfc2, %l0
	.word	0xa725791e	! t0_kref+0xa74:   	mulscc	%l5, -0x6e2, %l3
	.word	0x22800004	! t0_kref+0xa78:   	be,a	_kref+0xa88
	.word	0xa6232282	! t0_kref+0xa7c:   	sub	%o4, 0x282, %l3
	.word	0xa11cc00a	! t0_kref+0xa80:   	tsubcctv	%l3, %o2, %l0
	.word	0xd9be5809	! t0_kref+0xa84:   	stda	%f12, [%i1 + %o1]0xc0
	.word	0xe500a028	! t0_kref+0xa88:   	ld	[%g2 + 0x28], %f18
	.word	0xe84e4000	! t0_kref+0xa8c:   	ldsb	[%i1], %l4
	.word	0x81aaca28	! t0_kref+0xa90:   	fcmps	%fcc0, %f11, %f8
	.word	0x81aa0ace	! t0_kref+0xa94:   	fcmped	%fcc0, %f8, %f14
	.word	0xa1a00136	! t0_kref+0xa98:   	fabss	%f22, %f16
	.word	0x83414000	! t0_kref+0xa9c:   	mov	%pc, %g1
	.word	0x95a000b6	! t0_kref+0xaa0:   	fnegs	%f22, %f10
	.word	0xa0b5800c	! t0_kref+0xaa4:   	orncc	%l6, %o4, %l0
	.word	0xe6562018	! t0_kref+0xaa8:   	ldsh	[%i0 + 0x18], %l3
	.word	0xd66e7fe9	! t0_kref+0xaac:   	ldstub	[%i1 - 0x17], %o3
	.word	0xa65ae956	! t0_kref+0xab0:   	smul	%o3, 0x956, %l3
	.word	0xe1062004	! t0_kref+0xab4:   	ld	[%i0 + 4], %f16
	.word	0xe408603c	! t0_kref+0xab8:   	ldub	[%g1 + 0x3c], %l2
	.word	0xa41ca00c	! t0_kref+0xabc:   	xor	%l2, 0xc, %l2
	.word	0xe428603c	! t0_kref+0xac0:   	stb	%l2, [%g1 + 0x3c]
	.word	0x81d8603c	! t0_kref+0xac4:   	flush	%g1 + 0x3c
	.word	0x99a01a2d	! t0_kref+0xac8:   	fstoi	%f13, %f12
	.word	0xea8e501a	! t0_kref+0xacc:   	lduba	[%i1 + %i2]0x80, %l5
	.word	0x2f480008	! t0_kref+0xad0:   	fbu,a,pt	%fcc0, _kref+0xaf0
	.word	0xed00a02c	! t0_kref+0xad4:   	ld	[%g2 + 0x2c], %f22
2:	.word	0x91a0052f	! t0_kref+0xad8:   	fsqrts	%f15, %f8
	.word	0x81ab4a36	! t0_kref+0xadc:   	fcmps	%fcc0, %f13, %f22
	.word	0x81dd401d	! t0_kref+0xae0:   	flush	%l5 + %i5
	.word	0xe2567fe0	! t0_kref+0xae4:   	ldsh	[%i1 - 0x20], %l1
	.word	0x9da01a36	! t0_kref+0xae8:   	fstoi	%f22, %f14
	.word	0xa47d8016	! t0_kref+0xaec:   	sdiv	%l6, %l6, %l2
	.word	0xe878a014	! t0_kref+0xaf0:   	swap	[%g2 + 0x14], %l4
	.word	0xc807bff0	! t0_kref+0xaf4:   	ld	[%fp - 0x10], %g4
	.word	0xe296505b	! t0_kref+0xaf8:   	lduha	[%i1 + %i3]0x82, %l1
	.word	0xaaf6e791	! t0_kref+0xafc:   	udivcc	%i3, 0x791, %l5
	.word	0xa5a0052c	! t0_kref+0xb00:   	fsqrts	%f12, %f18
	.word	0xaba000b0	! t0_kref+0xb04:   	fnegs	%f16, %f21
	.word	0xd9200018	! t0_kref+0xb08:   	st	%f12, [%g0 + %i0]
	.word	0xd020a018	! t0_kref+0xb0c:   	st	%o0, [%g2 + 0x18]
	.word	0xaba3082c	! t0_kref+0xb10:   	fadds	%f12, %f12, %f21
	.word	0xe6901019	! t0_kref+0xb14:   	lduha	[%g0 + %i1]0x80, %l3
	.word	0xa025000d	! t0_kref+0xb18:   	sub	%l4, %o5, %l0
	.word	0xe6280018	! t0_kref+0xb1c:   	stb	%l3, [%g0 + %i0]
	.word	0x97a01a2e	! t0_kref+0xb20:   	fstoi	%f14, %f11
	.word	0xe250a00c	! t0_kref+0xb24:   	ldsh	[%g2 + 0xc], %l1
	.word	0x8143e040	! t0_kref+0xb28:   	membar	0x40
	.word	0xa3a509b2	! t0_kref+0xb2c:   	fdivs	%f20, %f18, %f17
	.word	0xa6246480	! t0_kref+0xb30:   	sub	%l1, 0x480, %l3
	.word	0xa9380016	! t0_kref+0xb34:   	sra	%g0, %l6, %l4
	.word	0xa652f43b	! t0_kref+0xb38:   	umul	%o3, -0xbc5, %l3
	.word	0xeeae9019	! t0_kref+0xb3c:   	stba	%l7, [%i2 + %i1]0x80
	.word	0x99a01934	! t0_kref+0xb40:   	fstod	%f20, %f12
	.word	0xe4064000	! t0_kref+0xb44:   	ld	[%i1], %l2
	.word	0xab334012	! t0_kref+0xb48:   	srl	%o5, %l2, %l5
	.word	0xe9262008	! t0_kref+0xb4c:   	st	%f20, [%i0 + 8]
	.word	0xea06401c	! t0_kref+0xb50:   	ld	[%i1 + %i4], %l5
	.word	0xada4092d	! t0_kref+0xb54:   	fmuls	%f16, %f13, %f22
	.word	0x34800003	! t0_kref+0xb58:   	bg,a	_kref+0xb64
	.word	0xa5258012	! t0_kref+0xb5c:   	mulscc	%l6, %l2, %l2
	.word	0xea262008	! t0_kref+0xb60:   	st	%l5, [%i0 + 8]
	.word	0x81ad0aaf	! t0_kref+0xb64:   	fcmpes	%fcc0, %f20, %f15
	.word	0xa6652400	! t0_kref+0xb68:   	subc	%l4, 0x400, %l3
	.word	0x91a00528	! t0_kref+0xb6c:   	fsqrts	%f8, %f8
	.word	0xe1200018	! t0_kref+0xb70:   	st	%f16, [%g0 + %i0]
	.word	0xa624ae78	! t0_kref+0xb74:   	sub	%l2, 0xe78, %l3
	.word	0xaba20828	! t0_kref+0xb78:   	fadds	%f8, %f8, %f21
	.word	0xa9a30d33	! t0_kref+0xb7c:   	fsmuld	%f12, %f19, %f20
	.word	0x86102003	! t0_kref+0xb80:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xb84:   	bne,a	_kref+0xb84
	.word	0x86a0e001	! t0_kref+0xb88:   	subcc	%g3, 1, %g3
	.word	0xab342018	! t0_kref+0xb8c:   	srl	%l0, 0x18, %l5
	.word	0xa1a30d33	! t0_kref+0xb90:   	fsmuld	%f12, %f19, %f16
	.word	0xa1a0014a	! t0_kref+0xb94:   	fabsd	%f10, %f16
	.word	0xa6aa7721	! t0_kref+0xb98:   	andncc	%o1, -0x8df, %l3
	.word	0xe6de1000	! t0_kref+0xb9c:   	ldxa	[%i0]0x80, %l3
	.word	0x91a00534	! t0_kref+0xba0:   	fsqrts	%f20, %f8
	.word	0xefee501b	! t0_kref+0xba4:   	prefetcha	%i1 + %i3, 23
	.word	0xe05f4019	! t0_kref+0xba8:   	ldx	[%i5 + %i1], %l0
	.word	0xa00ae08e	! t0_kref+0xbac:   	and	%o3, 0x8e, %l0
	.word	0x30480001	! t0_kref+0xbb0:   	ba,a,pt	%icc, _kref+0xbb4
	.word	0xc36e3fe0	! t0_kref+0xbb4:   	prefetch	%i0 - 0x20, 1
	.word	0xe28e1000	! t0_kref+0xbb8:   	lduba	[%i0]0x80, %l1
	.word	0xa40ac00c	! t0_kref+0xbbc:   	and	%o3, %o4, %l2
	.word	0xa1a01a36	! t0_kref+0xbc0:   	fstoi	%f22, %f16
	.word	0xa696e1a3	! t0_kref+0xbc4:   	orcc	%i3, 0x1a3, %l3
	.word	0x22480008	! t0_kref+0xbc8:   	be,a,pt	%icc, _kref+0xbe8
	.word	0xe89e1000	! t0_kref+0xbcc:   	ldda	[%i0]0x80, %l4
	.word	0x39480005	! t0_kref+0xbd0:   	fbuge,a,pt	%fcc0, _kref+0xbe4
	.word	0xa935e00d	! t0_kref+0xbd4:   	srl	%l7, 0xd, %l4
	.word	0xed6e6018	! t0_kref+0xbd8:   	prefetch	%i1 + 0x18, 22
	.word	0xe250a038	! t0_kref+0xbdc:   	ldsh	[%g2 + 0x38], %l1
	.word	0x2f480003	! t0_kref+0xbe0:   	fbu,a,pt	%fcc0, _kref+0xbec
	.word	0xa4368010	! t0_kref+0xbe4:   	orn	%i2, %l0, %l2
	.word	0x81acca2d	! t0_kref+0xbe8:   	fcmps	%fcc0, %f19, %f13
	.word	0x34800006	! t0_kref+0xbec:   	bg,a	_kref+0xc04
	.word	0xa45c6987	! t0_kref+0xbf0:   	smul	%l1, 0x987, %l2
	.word	0x20800001	! t0_kref+0xbf4:   	bn,a	_kref+0xbf8
	.word	0xa8730000	! t0_kref+0xbf8:   	udiv	%o4, %g0, %l4
	.word	0x30480008	! t0_kref+0xbfc:   	ba,a,pt	%icc, _kref+0xc1c
	.word	0xea566012	! t0_kref+0xc00:   	ldsh	[%i1 + 0x12], %l5
	.word	0xa6e20015	! t0_kref+0xc04:   	subccc	%o0, %l5, %l3
	.word	0x81dec01b	! t0_kref+0xc08:   	flush	%i3 + %i3
	.word	0xa7a000b2	! t0_kref+0xc0c:   	fnegs	%f18, %f19
	.word	0xc0262014	! t0_kref+0xc10:   	clr	[%i0 + 0x14]
	.word	0x81ad0ad4	! t0_kref+0xc14:   	fcmped	%fcc0, %f20, %f20
	.word	0xa9a20931	! t0_kref+0xc18:   	fmuls	%f8, %f17, %f20
	.word	0xe168a08b	! t0_kref+0xc1c:   	prefetch	%g2 + 0x8b, 16
	.word	0xa60debfc	! t0_kref+0xc20:   	and	%l7, 0xbfc, %l3
	.word	0xd6ae9018	! t0_kref+0xc24:   	stba	%o3, [%i2 + %i0]0x80
	.word	0x81dc0005	! t0_kref+0xc28:   	flush	%l0 + %g5
	.word	0xab1b7830	! t0_kref+0xc2c:   	tsubcctv	%o5, -0x7d0, %l5
	.word	0x81ab8a52	! t0_kref+0xc30:   	fcmpd	%fcc0, %f14, %f18
	.word	0x9ba00033	! t0_kref+0xc34:   	fmovs	%f19, %f13
	.word	0xe80e8019	! t0_kref+0xc38:   	ldub	[%i2 + %i1], %l4
	.word	0xe03e7ff0	! t0_kref+0xc3c:   	std	%l0, [%i1 - 0x10]
	.word	0xe640a004	! t0_kref+0xc40:   	ldsw	[%g2 + 4], %l3
	.word	0xa4a478b5	! t0_kref+0xc44:   	subcc	%l1, -0x74b, %l2
	.word	0x3a480002	! t0_kref+0xc48:   	bcc,a,pt	%icc, _kref+0xc50
	.word	0xe84e401a	! t0_kref+0xc4c:   	ldsb	[%i1 + %i2], %l4
	.word	0xf96e2000	! t0_kref+0xc50:   	prefetch	%i0, 28
	.word	0xa8b2c01a	! t0_kref+0xc54:   	orncc	%o3, %i2, %l4
	.word	0xa92d8014	! t0_kref+0xc58:   	sll	%l6, %l4, %l4
	.word	0xda20a028	! t0_kref+0xc5c:   	st	%o5, [%g2 + 0x28]
	.word	0x81df4000	! t0_kref+0xc60:   	flush	%i5
	.word	0xa83da20e	! t0_kref+0xc64:   	xnor	%l6, 0x20e, %l4
	.word	0xd26e2001	! t0_kref+0xc68:   	ldstub	[%i0 + 1], %o1
	.word	0x9fc10000	! t0_kref+0xc6c:   	call	%g4
	.word	0xaaf37497	! t0_kref+0xc70:   	udivcc	%o5, -0xb69, %l5
	.word	0xd13f4018	! t0_kref+0xc74:   	std	%f8, [%i5 + %i0]
	.word	0xa80ca104	! t0_kref+0xc78:   	and	%l2, 0x104, %l4
	.word	0xe0167ff6	! t0_kref+0xc7c:   	lduh	[%i1 - 0xa], %l0
	.word	0x25239afc	! t0_kref+0xc80:   	sethi	%hi(0x8e6bf000), %l2
	.word	0x26480001	! t0_kref+0xc84:   	bl,a,pt	%icc, _kref+0xc88
	.word	0xd5981018	! t0_kref+0xc88:   	ldda	[%g0 + %i0]0x80, %f10
	.word	0xa9a01a31	! t0_kref+0xc8c:   	fstoi	%f17, %f20
	.word	0xa21eb7bf	! t0_kref+0xc90:   	xor	%i2, -0x841, %l1
	.word	0xa8328012	! t0_kref+0xc94:   	orn	%o2, %l2, %l4
	.word	0x81aa0a48	! t0_kref+0xc98:   	fcmpd	%fcc0, %f8, %f8
	.word	0x9fc00004	! t0_kref+0xc9c:   	call	%g0 + %g4
	.word	0xa1322014	! t0_kref+0xca0:   	srl	%o0, 0x14, %l0
	.word	0x9da409c8	! t0_kref+0xca4:   	fdivd	%f16, %f8, %f14
	.word	0xe7ee501a	! t0_kref+0xca8:   	prefetcha	%i1 + %i2, 19
	.word	0x001fffff	! t0_kref+0xcac:   	illtrap	0x1fffff
	.word	0xe99e5a1c	! t0_kref+0xcb0:   	ldda	[%i1 + %i4]0xd0, %f20
	.word	0x81ad8a54	! t0_kref+0xcb4:   	fcmpd	%fcc0, %f22, %f20
	.word	0x95a24d2a	! t0_kref+0xcb8:   	fsmuld	%f9, %f10, %f10
	.word	0xa2aaea52	! t0_kref+0xcbc:   	andncc	%o3, 0xa52, %l1
	.word	0xa5a309cc	! t0_kref+0xcc0:   	fdivd	%f12, %f12, %f18
	.word	0xa4244017	! t0_kref+0xcc4:   	sub	%l1, %l7, %l2
	.word	0xe19f5018	! t0_kref+0xcc8:   	ldda	[%i5 + %i0]0x80, %f16
	.word	0x26800006	! t0_kref+0xccc:   	bl,a	_kref+0xce4
	.word	0xa22265d8	! t0_kref+0xcd0:   	sub	%o1, 0x5d8, %l1
	.word	0xa6244017	! t0_kref+0xcd4:   	sub	%l1, %l7, %l3
	.word	0xe5180018	! t0_kref+0xcd8:   	ldd	[%g0 + %i0], %f18
	.word	0xada01894	! t0_kref+0xcdc:   	fitos	%f20, %f22
	.word	0xdd1fbdc0	! t0_kref+0xce0:   	ldd	[%fp - 0x240], %f14
	.word	0x81854000	! t0_kref+0xce4:   	wr	%l5, %g0, %y
	sethi	%hi(2f), %o7
	.word	0xe40be128	! t0_kref+0xcec:   	ldub	[%o7 + 0x128], %l2
	.word	0xa41ca00c	! t0_kref+0xcf0:   	xor	%l2, 0xc, %l2
	.word	0xe42be128	! t0_kref+0xcf4:   	stb	%l2, [%o7 + 0x128]
	.word	0x81dbe128	! t0_kref+0xcf8:   	flush	%o7 + 0x128
	.word	0x9ba5892c	! t0_kref+0xcfc:   	fmuls	%f22, %f12, %f13
	.word	0xa6648017	! t0_kref+0xd00:   	subc	%l2, %l7, %l3
	.word	0xe6063ffc	! t0_kref+0xd04:   	ld	[%i0 - 4], %l3
	.word	0x97a58831	! t0_kref+0xd08:   	fadds	%f22, %f17, %f11
	.word	0x97a30929	! t0_kref+0xd0c:   	fmuls	%f12, %f9, %f11
	.word	0xabc1401c	! t0_kref+0xd10:   	jmpl	%g5 + %i4, %l5
	.word	0x95a0192c	! t0_kref+0xd14:   	fstod	%f12, %f10
	.word	0x9da0190b	! t0_kref+0xd18:   	fitod	%f11, %f14
	.word	0xe7801019	! t0_kref+0xd1c:   	lda	[%g0 + %i1]0x80, %f19
	.word	0xa7a000b4	! t0_kref+0xd20:   	fnegs	%f20, %f19
	.word	0xaa2b7d75	! t0_kref+0xd24:   	andn	%o5, -0x28b, %l5
2:	.word	0x9ba00529	! t0_kref+0xd28:   	fsqrts	%f9, %f13
	.word	0xeb066000	! t0_kref+0xd2c:   	ld	[%i1], %f21
	.word	0xab3dc000	! t0_kref+0xd30:   	sra	%l7, %g0, %l5
	.word	0xe6861000	! t0_kref+0xd34:   	lda	[%i0]0x80, %l3
	.word	0xa2aec008	! t0_kref+0xd38:   	andncc	%i3, %o0, %l1
	.word	0xa025b180	! t0_kref+0xd3c:   	sub	%l6, -0xe80, %l0
	.word	0xa9a00529	! t0_kref+0xd40:   	fsqrts	%f9, %f20
	.word	0xa89d7f1d	! t0_kref+0xd44:   	xorcc	%l5, -0xe3, %l4
	.word	0xa7408000	! t0_kref+0xd48:   	mov	%ccr, %l3
	.word	0xd9bf1a59	! t0_kref+0xd4c:   	stda	%f12, [%i4 + %i1]0xd2
	.word	0xa5418000	! t0_kref+0xd50:   	mov	%fprs, %l2
	.word	0x2b480007	! t0_kref+0xd54:   	fbug,a,pt	%fcc0, _kref+0xd70
	.word	0xa9a4882d	! t0_kref+0xd58:   	fadds	%f18, %f13, %f20
	.word	0xaaf68010	! t0_kref+0xd5c:   	udivcc	%i2, %l0, %l5
	.word	0xaa2eeb31	! t0_kref+0xd60:   	andn	%i3, 0xb31, %l5
	.word	0x34800006	! t0_kref+0xd64:   	bg,a	_kref+0xd7c
	.word	0xfbee101d	! t0_kref+0xd68:   	prefetcha	%i0 + %i5, 29
	.word	0xa9400000	! t0_kref+0xd6c:   	mov	%y, %l4
	.word	0x9fa00533	! t0_kref+0xd70:   	fsqrts	%f19, %f15
	.word	0x20480003	! t0_kref+0xd74:   	bn,a,pt	%icc, _kref+0xd80
	.word	0xa32525d6	! t0_kref+0xd78:   	mulscc	%l4, 0x5d6, %l1
	.word	0x81ab8a52	! t0_kref+0xd7c:   	fcmpd	%fcc0, %f14, %f18
	.word	0xa42ec00a	! t0_kref+0xd80:   	andn	%i3, %o2, %l2
	.word	0xa1a0188b	! t0_kref+0xd84:   	fitos	%f11, %f16
	.word	0xe2070018	! t0_kref+0xd88:   	ld	[%i4 + %i0], %l1
	.word	0x99a000b2	! t0_kref+0xd8c:   	fnegs	%f18, %f12
	.word	0xe840a014	! t0_kref+0xd90:   	ldsw	[%g2 + 0x14], %l4
	.word	0xc12e3fe0	! t0_kref+0xd94:   	st	%fsr, [%i0 - 0x20]
	.word	0x9da00529	! t0_kref+0xd98:   	fsqrts	%f9, %f14
	.word	0x81aa0aaa	! t0_kref+0xd9c:   	fcmpes	%fcc0, %f8, %f10
	.word	0xa065667a	! t0_kref+0xda0:   	subc	%l5, 0x67a, %l0
	.word	0xa07c0016	! t0_kref+0xda4:   	sdiv	%l0, %l6, %l0
	.word	0xe016c019	! t0_kref+0xda8:   	lduh	[%i3 + %i1], %l0
	.word	0xd4ae1000	! t0_kref+0xdac:   	stba	%o2, [%i0]0x80
	.word	0xea10a032	! t0_kref+0xdb0:   	lduh	[%g2 + 0x32], %l5
	.word	0xa3a00034	! t0_kref+0xdb4:   	fmovs	%f20, %f17
	.word	0x9fa40934	! t0_kref+0xdb8:   	fmuls	%f16, %f20, %f15
	.word	0x81acca35	! t0_kref+0xdbc:   	fcmps	%fcc0, %f19, %f21
	.word	0xe19f1a58	! t0_kref+0xdc0:   	ldda	[%i4 + %i0]0xd2, %f16
	.word	0xa4adade9	! t0_kref+0xdc4:   	andncc	%l6, 0xde9, %l2
	.word	0x81ac0a33	! t0_kref+0xdc8:   	fcmps	%fcc0, %f16, %f19
	.word	0xa6bb3a9a	! t0_kref+0xdcc:   	xnorcc	%o4, -0x566, %l3
	.word	0xa73dc010	! t0_kref+0xdd0:   	sra	%l7, %l0, %l3
	.word	0xf430a014	! t0_kref+0xdd4:   	sth	%i2, [%g2 + 0x14]
	.word	0x95a00532	! t0_kref+0xdd8:   	fsqrts	%f18, %f10
	.word	0x2136992d	! t0_kref+0xddc:   	sethi	%hi(0xda64b400), %l0
	.word	0x93a0052b	! t0_kref+0xde0:   	fsqrts	%f11, %f9
	.word	0x32800006	! t0_kref+0xde4:   	bne,a	_kref+0xdfc
	.word	0xa8d20009	! t0_kref+0xde8:   	umulcc	%o0, %o1, %l4
	.word	0xe9ee501d	! t0_kref+0xdec:   	prefetcha	%i1 + %i5, 20
	.word	0xa4da4000	! t0_kref+0xdf0:   	smulcc	%o1, %g0, %l2
	.word	0xa32d600c	! t0_kref+0xdf4:   	sll	%l5, 0xc, %l1
	.word	0xe056c019	! t0_kref+0xdf8:   	ldsh	[%i3 + %i1], %l0
	.word	0xa5a309d0	! t0_kref+0xdfc:   	fdivd	%f12, %f16, %f18
	.word	0xa93dc014	! t0_kref+0xe00:   	sra	%l7, %l4, %l4
	.word	0xaa7221dc	! t0_kref+0xe04:   	udiv	%o0, 0x1dc, %l5
	.word	0xa5a3cd2d	! t0_kref+0xe08:   	fsmuld	%f15, %f13, %f18
	.word	0xa665c00c	! t0_kref+0xe0c:   	subc	%l7, %o4, %l3
	.word	0xa664c015	! t0_kref+0xe10:   	subc	%l3, %l5, %l3
	.word	0xe6100018	! t0_kref+0xe14:   	lduh	[%g0 + %i0], %l3
	.word	0xa05ce286	! t0_kref+0xe18:   	smul	%l3, 0x286, %l0
	.word	0xe1be180b	! t0_kref+0xe1c:   	stda	%f16, [%i0 + %o3]0xc0
	.word	0x9fa01893	! t0_kref+0xe20:   	fitos	%f19, %f15
	.word	0xd7a6101c	! t0_kref+0xe24:   	sta	%f11, [%i0 + %i4]0x80
	.word	0xc07e2008	! t0_kref+0xe28:   	swap	[%i0 + 8], %g0
	.word	0xe8162010	! t0_kref+0xe2c:   	lduh	[%i0 + 0x10], %l4
	.word	0xa12c8000	! t0_kref+0xe30:   	sll	%l2, %g0, %l0
	.word	0x8143e040	! t0_kref+0xe34:   	membar	0x40
	.word	0xa3a0012c	! t0_kref+0xe38:   	fabss	%f12, %f17
	.word	0xa3a000ac	! t0_kref+0xe3c:   	fnegs	%f12, %f17
	.word	0xe0167ff6	! t0_kref+0xe40:   	lduh	[%i1 - 0xa], %l0
	.word	0xea4e3fe6	! t0_kref+0xe44:   	ldsb	[%i0 - 0x1a], %l5
	.word	0xaa74c011	! t0_kref+0xe48:   	udiv	%l3, %l1, %l5
	.word	0xd7a65000	! t0_kref+0xe4c:   	sta	%f11, [%i1]0x80
	.word	0xa62d0014	! t0_kref+0xe50:   	andn	%l4, %l4, %l3
	.word	0x81dd8013	! t0_kref+0xe54:   	flush	%l6 + %l3
	.word	0x3a480006	! t0_kref+0xe58:   	bcc,a,pt	%icc, _kref+0xe70
	.word	0xdb067ff0	! t0_kref+0xe5c:   	ld	[%i1 - 0x10], %f13
	.word	0xa2e6c016	! t0_kref+0xe60:   	subccc	%i3, %l6, %l1
	.word	0x9da01931	! t0_kref+0xe64:   	fstod	%f17, %f14
	.word	0x81abca35	! t0_kref+0xe68:   	fcmps	%fcc0, %f15, %f21
	.word	0xa7a348aa	! t0_kref+0xe6c:   	fsubs	%f13, %f10, %f19
	.word	0x9da40832	! t0_kref+0xe70:   	fadds	%f16, %f18, %f14
	.word	0x3f480007	! t0_kref+0xe74:   	fbo,a,pt	%fcc0, _kref+0xe90
	.word	0xe5200019	! t0_kref+0xe78:   	st	%f18, [%g0 + %i1]
	.word	0xa5700017	! t0_kref+0xe7c:   	popc	%l7, %l2
	.word	0xa02dc013	! t0_kref+0xe80:   	andn	%l7, %l3, %l0
	.word	0xa2aaacca	! t0_kref+0xe84:   	andncc	%o2, 0xcca, %l1
	.word	0xa6d2801a	! t0_kref+0xe88:   	umulcc	%o2, %i2, %l3
	.word	0x20800008	! t0_kref+0xe8c:   	bn,a	_kref+0xeac
	.word	0xabc06c66	! t0_kref+0xe90:   	jmpl	%g1 + 0xc66, %l5
	.word	0xc0262014	! t0_kref+0xe94:   	clr	[%i0 + 0x14]
	.word	0xd99f5a18	! t0_kref+0xe98:   	ldda	[%i5 + %i0]0xd0, %f12
	.word	0xa00a8015	! t0_kref+0xe9c:   	and	%o2, %l5, %l0
	.word	0xa9702f62	! t0_kref+0xea0:   	popc	0xf62, %l4
	.word	0xab3c0011	! t0_kref+0xea4:   	sra	%l0, %l1, %l5
	.word	0xa5a01909	! t0_kref+0xea8:   	fitod	%f9, %f18
	.word	0xa6556186	! t0_kref+0xeac:   	umul	%l5, 0x186, %l3
	.word	0xd5262008	! t0_kref+0xeb0:   	st	%f10, [%i0 + 8]
	.word	0xe0564000	! t0_kref+0xeb4:   	ldsh	[%i1], %l0
	.word	0xe6560000	! t0_kref+0xeb8:   	ldsh	[%i0], %l3
	.word	0x3b480008	! t0_kref+0xebc:   	fble,a,pt	%fcc0, _kref+0xedc
	.word	0xc1ee5012	! t0_kref+0xec0:   	prefetcha	%i1 + %l2, 0
	.word	0x81800000	! t0_kref+0xec4:   	mov	%g0, %y
	.word	0xa660213c	! t0_kref+0xec8:   	subc	%g0, 0x13c, %l3
	.word	0x81dce75f	! t0_kref+0xecc:   	flush	%l3 + 0x75f
	.word	0xa662663f	! t0_kref+0xed0:   	subc	%o1, 0x63f, %l3
	.word	0xa53da013	! t0_kref+0xed4:   	sra	%l6, 0x13, %l2
	.word	0x91a0052f	! t0_kref+0xed8:   	fsqrts	%f15, %f8
	.word	0xa85aa038	! t0_kref+0xedc:   	smul	%o2, 0x38, %l4
	.word	0x2301deae	! t0_kref+0xee0:   	sethi	%hi(0x77ab800), %l1
	.word	0xa0ba8009	! t0_kref+0xee4:   	xnorcc	%o2, %o1, %l0
	.word	0xa2520013	! t0_kref+0xee8:   	umul	%o0, %l3, %l1
	.word	0xa03a401b	! t0_kref+0xeec:   	xnor	%o1, %i3, %l0
	.word	0xc398a040	! t0_kref+0xef0:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xe256c018	! t0_kref+0xef4:   	ldsh	[%i3 + %i0], %l1
	.word	0xeace9018	! t0_kref+0xef8:   	ldsba	[%i2 + %i0]0x80, %l5
	.word	0xaba01a2b	! t0_kref+0xefc:   	fstoi	%f11, %f21
	sethi	%hi(2f), %o7
	.word	0xe40be330	! t0_kref+0xf04:   	ldub	[%o7 + 0x330], %l2
	.word	0xa41ca00c	! t0_kref+0xf08:   	xor	%l2, 0xc, %l2
	.word	0xe42be330	! t0_kref+0xf0c:   	stb	%l2, [%o7 + 0x330]
	.word	0x81dbe330	! t0_kref+0xf10:   	flush	%o7 + 0x330
	.word	0xa7000016	! t0_kref+0xf14:   	taddcc	%g0, %l6, %l3
	.word	0x2e480004	! t0_kref+0xf18:   	bvs,a,pt	%icc, _kref+0xf28
	.word	0xc1ee500c	! t0_kref+0xf1c:   	prefetcha	%i1 + %o4, 0
	.word	0xaa64c017	! t0_kref+0xf20:   	subc	%l3, %l7, %l5
	.word	0xab0b401a	! t0_kref+0xf24:   	tsubcc	%o5, %i2, %l5
	.word	0xa2ba400d	! t0_kref+0xf28:   	xnorcc	%o1, %o5, %l1
	.word	0xa51d3abd	! t0_kref+0xf2c:   	tsubcctv	%l4, -0x543, %l2
2:	.word	0xe000a034	! t0_kref+0xf30:   	ld	[%g2 + 0x34], %l0
	.word	0xa6e6bf01	! t0_kref+0xf34:   	subccc	%i2, -0xff, %l3
	.word	0xc398a040	! t0_kref+0xf38:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa2a5800a	! t0_kref+0xf3c:   	subcc	%l6, %o2, %l1
	.word	0xa8d20008	! t0_kref+0xf40:   	umulcc	%o0, %o0, %l4
	.word	0xa0a82472	! t0_kref+0xf44:   	andncc	%g0, 0x472, %l0
	.word	0xe4380018	! t0_kref+0xf48:   	std	%l2, [%g0 + %i0]
	.word	0xf6262018	! t0_kref+0xf4c:   	st	%i3, [%i0 + 0x18]
	.word	0xaba4492d	! t0_kref+0xf50:   	fmuls	%f17, %f13, %f21
	.word	0xaad68011	! t0_kref+0xf54:   	umulcc	%i2, %l1, %l5
	.word	0x9fa0052c	! t0_kref+0xf58:   	fsqrts	%f12, %f15
	.word	0xa932e013	! t0_kref+0xf5c:   	srl	%o3, 0x13, %l4
	.word	0xe300a02c	! t0_kref+0xf60:   	ld	[%g2 + 0x2c], %f17
	.word	0x93a30830	! t0_kref+0xf64:   	fadds	%f12, %f16, %f9
	.word	0xf83e2000	! t0_kref+0xf68:   	std	%i4, [%i0]
	.word	0xe6a6501c	! t0_kref+0xf6c:   	sta	%l3, [%i1 + %i4]0x80
	.word	0x95ab8030	! t0_kref+0xf70:   	fmovsule	%fcc0, %f16, %f10
	.word	0x9da4084a	! t0_kref+0xf74:   	faddd	%f16, %f10, %f14
	.word	0xaba5882a	! t0_kref+0xf78:   	fadds	%f22, %f10, %f21
	.word	0xff6e2018	! t0_kref+0xf7c:   	prefetch	%i0 + 0x18, 31
	.word	0xa20db2bd	! t0_kref+0xf80:   	and	%l6, -0xd43, %l1
	.word	0xa2fca9c4	! t0_kref+0xf84:   	sdivcc	%l2, 0x9c4, %l1
	.word	0xe00e7fed	! t0_kref+0xf88:   	ldub	[%i1 - 0x13], %l0
	.word	0xa0f4a927	! t0_kref+0xf8c:   	udivcc	%l2, 0x927, %l0
	.word	0x858330f4	! t0_kref+0xf90:   	wr	%o4, 0xfffff0f4, %ccr
	.word	0xa87d4010	! t0_kref+0xf94:   	sdiv	%l5, %l0, %l4
	.word	0x81abca29	! t0_kref+0xf98:   	fcmps	%fcc0, %f15, %f9
	.word	0xe5070019	! t0_kref+0xf9c:   	ld	[%i4 + %i1], %f18
	.word	0xe8263fec	! t0_kref+0xfa0:   	st	%l4, [%i0 - 0x14]
	.word	0xa69aa249	! t0_kref+0xfa4:   	xorcc	%o2, 0x249, %l3
	.word	0x81accab2	! t0_kref+0xfa8:   	fcmpes	%fcc0, %f19, %f18
	.word	0x81ab8ab3	! t0_kref+0xfac:   	fcmpes	%fcc0, %f14, %f19
	.word	0xaba000ac	! t0_kref+0xfb0:   	fnegs	%f12, %f21
	.word	0xd6264000	! t0_kref+0xfb4:   	st	%o3, [%i1]
	.word	0x81da000c	! t0_kref+0xfb8:   	flush	%o0 + %o4
	.word	0xe06e6001	! t0_kref+0xfbc:   	ldstub	[%i1 + 1], %l0
	.word	0xa33ea002	! t0_kref+0xfc0:   	sra	%i2, 0x2, %l1
	.word	0x9da209ca	! t0_kref+0xfc4:   	fdivd	%f8, %f10, %f14
	.word	0x95a40935	! t0_kref+0xfc8:   	fmuls	%f16, %f21, %f10
	.word	0xd526001c	! t0_kref+0xfcc:   	st	%f10, [%i0 + %i4]
	.word	0x32480008	! t0_kref+0xfd0:   	bne,a,pt	%icc, _kref+0xff0
	.word	0xc807bff0	! t0_kref+0xfd4:   	ld	[%fp - 0x10], %g4
	.word	0x81dd6793	! t0_kref+0xfd8:   	flush	%l5 + 0x793
	.word	0xe056c019	! t0_kref+0xfdc:   	ldsh	[%i3 + %i1], %l0
	.word	0x25480003	! t0_kref+0xfe0:   	fblg,a,pt	%fcc0, _kref+0xfec
	.word	0xd51fbc70	! t0_kref+0xfe4:   	ldd	[%fp - 0x390], %f10
	.word	0xe028a017	! t0_kref+0xfe8:   	stb	%l0, [%g2 + 0x17]
	.word	0xab350009	! t0_kref+0xfec:   	srl	%l4, %o1, %l5
	.word	0xa9a0192c	! t0_kref+0xff0:   	fstod	%f12, %f20
	.word	0xec263ff4	! t0_kref+0xff4:   	st	%l6, [%i0 - 0xc]
	.word	0xab400000	! t0_kref+0xff8:   	mov	%y, %l5
	.word	0x95a01a48	! t0_kref+0xffc:   	fdtoi	%f8, %f10
	.word	0xd3266010	! t0_kref+0x1000:   	st	%f9, [%i1 + 0x10]
	.word	0xa5a01914	! t0_kref+0x1004:   	fitod	%f20, %f18
	.word	0xe0070018	! t0_kref+0x1008:   	ld	[%i4 + %i0], %l0
	.word	0x99a0192a	! t0_kref+0x100c:   	fstod	%f10, %f12
	.word	0xa60a6c77	! t0_kref+0x1010:   	and	%o1, 0xc77, %l3
	.word	0xeb6e2018	! t0_kref+0x1014:   	prefetch	%i0 + 0x18, 21
	.word	0x24480002	! t0_kref+0x1018:   	ble,a,pt	%icc, _kref+0x1020
	.word	0xa60a2a41	! t0_kref+0x101c:   	and	%o0, 0xa41, %l3
	.word	0x81dfa3bb	! t0_kref+0x1020:   	flush	%fp + 0x3bb
	.word	0x26800002	! t0_kref+0x1024:   	bl,a	_kref+0x102c
	.word	0xee6e7fe1	! t0_kref+0x1028:   	ldstub	[%i1 - 0x1f], %l7
	.word	0xe6480018	! t0_kref+0x102c:   	ldsb	[%g0 + %i0], %l3
	.word	0xea066014	! t0_kref+0x1030:   	ld	[%i1 + 0x14], %l5
	.word	0xa424800d	! t0_kref+0x1034:   	sub	%l2, %o5, %l2
	.word	0x9ba000ac	! t0_kref+0x1038:   	fnegs	%f12, %f13
	.word	0xada000b5	! t0_kref+0x103c:   	fnegs	%f21, %f22
	.word	0xa1a01933	! t0_kref+0x1040:   	fstod	%f19, %f16
	.word	0x99a01a33	! t0_kref+0x1044:   	fstoi	%f19, %f12
	.word	0xa8de800c	! t0_kref+0x1048:   	smulcc	%i2, %o4, %l4
	.word	0x26800008	! t0_kref+0x104c:   	bl,a	_kref+0x106c
	.word	0xa1a489ad	! t0_kref+0x1050:   	fdivs	%f18, %f13, %f16
	.word	0x27480005	! t0_kref+0x1054:   	fbul,a,pt	%fcc0, _kref+0x1068
	.word	0xab23400b	! t0_kref+0x1058:   	mulscc	%o5, %o3, %l5
	.word	0xa093001a	! t0_kref+0x105c:   	orcc	%o4, %i2, %l0
	.word	0xa0537732	! t0_kref+0x1060:   	umul	%o5, -0x8ce, %l0
	.word	0xa69ef09e	! t0_kref+0x1064:   	xorcc	%i3, -0xf62, %l3
	.word	0x3b480007	! t0_kref+0x1068:   	fble,a,pt	%fcc0, _kref+0x1084
	.word	0xa7a00533	! t0_kref+0x106c:   	fsqrts	%f19, %f19
	.word	0xa33b6015	! t0_kref+0x1070:   	sra	%o5, 0x15, %l1
	.word	0xa272000b	! t0_kref+0x1074:   	udiv	%o0, %o3, %l1
	.word	0xa00ac008	! t0_kref+0x1078:   	and	%o3, %o0, %l0
	.word	0xa1a00532	! t0_kref+0x107c:   	fsqrts	%f18, %f16
	.word	0xe86e3fec	! t0_kref+0x1080:   	ldstub	[%i0 - 0x14], %l4
	.word	0x81ad8a2c	! t0_kref+0x1084:   	fcmps	%fcc0, %f22, %f12
	.word	0x2f480003	! t0_kref+0x1088:   	fbu,a,pt	%fcc0, _kref+0x1094
	.word	0xa8950000	! t0_kref+0x108c:   	orcc	%l4, %g0, %l4
	.word	0xe4067fe8	! t0_kref+0x1090:   	ld	[%i1 - 0x18], %l2
	.word	0xe8500018	! t0_kref+0x1094:   	ldsh	[%g0 + %i0], %l4
	.word	0x2e480002	! t0_kref+0x1098:   	bvs,a,pt	%icc, _kref+0x10a0
	.word	0xa7400000	! t0_kref+0x109c:   	mov	%y, %l3
	.word	0xaba50935	! t0_kref+0x10a0:   	fmuls	%f20, %f21, %f21
	.word	0xaaf2c000	! t0_kref+0x10a4:   	udivcc	%o3, %g0, %l5
	.word	0xc07f0005	! t0_kref+0x10a8:   	swap	[%i4 + %g5], %g0
	.word	0xe4086628	! t0_kref+0x10ac:   	ldub	[%g1 + 0x628], %l2
	.word	0xa41ca00c	! t0_kref+0x10b0:   	xor	%l2, 0xc, %l2
	.word	0xe4286628	! t0_kref+0x10b4:   	stb	%l2, [%g1 + 0x628]
	.word	0x81d86628	! t0_kref+0x10b8:   	flush	%g1 + 0x628
	.word	0x9ba348ab	! t0_kref+0x10bc:   	fsubs	%f13, %f11, %f13
	.word	0x9fa00534	! t0_kref+0x10c0:   	fsqrts	%f20, %f15
2:	.word	0xa2934013	! t0_kref+0x10c4:   	orcc	%o5, %l3, %l1
	.word	0xe4086648	! t0_kref+0x10c8:   	ldub	[%g1 + 0x648], %l2
	.word	0xa41ca00c	! t0_kref+0x10cc:   	xor	%l2, 0xc, %l2
	.word	0xe4286648	! t0_kref+0x10d0:   	stb	%l2, [%g1 + 0x648]
	.word	0x81d86648	! t0_kref+0x10d4:   	flush	%g1 + 0x648
	.word	0xa254000b	! t0_kref+0x10d8:   	umul	%l0, %o3, %l1
	.word	0x91aac035	! t0_kref+0x10dc:   	fmovsge	%fcc0, %f21, %f8
	.word	0xaa94af0c	! t0_kref+0x10e0:   	orcc	%l2, 0xf0c, %l5
2:	.word	0x230deda6	! t0_kref+0x10e4:   	sethi	%hi(0x37b69800), %l1
	.word	0xa6a5000b	! t0_kref+0x10e8:   	subcc	%l4, %o3, %l3
	.word	0x9da508b6	! t0_kref+0x10ec:   	fsubs	%f20, %f22, %f14
	.word	0x91a3082d	! t0_kref+0x10f0:   	fadds	%f12, %f13, %f8
	.word	0xd6270019	! t0_kref+0x10f4:   	st	%o3, [%i4 + %i1]
	.word	0xa53a401a	! t0_kref+0x10f8:   	sra	%o1, %i2, %l2
	.word	0xaa634009	! t0_kref+0x10fc:   	subc	%o5, %o1, %l5
	.word	0xa0202bcc	! t0_kref+0x1100:   	sub	%g0, 0xbcc, %l0
	.word	0xa40cc01a	! t0_kref+0x1104:   	and	%l3, %i2, %l2
	.word	0x9da01928	! t0_kref+0x1108:   	fstod	%f8, %f14
	.word	0x81ac0a50	! t0_kref+0x110c:   	fcmpd	%fcc0, %f16, %f16
	.word	0xa2903c20	! t0_kref+0x1110:   	orcc	%g0, -0x3e0, %l1
	.word	0xa5a508d0	! t0_kref+0x1114:   	fsubd	%f20, %f16, %f18
	.word	0x81ad4aaf	! t0_kref+0x1118:   	fcmpes	%fcc0, %f21, %f15
	.word	0xaa65f1fe	! t0_kref+0x111c:   	subc	%l7, -0xe02, %l5
	.word	0xe4070018	! t0_kref+0x1120:   	ld	[%i4 + %i0], %l2
	.word	0xada3cd28	! t0_kref+0x1124:   	fsmuld	%f15, %f8, %f22
	.word	0x95a48930	! t0_kref+0x1128:   	fmuls	%f18, %f16, %f10
	.word	0x97a0052f	! t0_kref+0x112c:   	fsqrts	%f15, %f11
	.word	0x81ab0a4c	! t0_kref+0x1130:   	fcmpd	%fcc0, %f12, %f12
	.word	0xa2b30017	! t0_kref+0x1134:   	orncc	%o4, %l7, %l1
	.word	0x21480006	! t0_kref+0x1138:   	fbn,a,pt	%fcc0, _kref+0x1150
	.word	0xaa5ab46b	! t0_kref+0x113c:   	smul	%o2, -0xb95, %l5
	.word	0xc7ee100a	! t0_kref+0x1140:   	prefetcha	%i0 + %o2, 3
	.word	0xa09437fc	! t0_kref+0x1144:   	orcc	%l0, -0x804, %l0
	.word	0x3f480004	! t0_kref+0x1148:   	fbo,a,pt	%fcc0, _kref+0x1158
	.word	0x9da01933	! t0_kref+0x114c:   	fstod	%f19, %f14
	.word	0xaa5a8015	! t0_kref+0x1150:   	smul	%o2, %l5, %l5
	.word	0xa9a018d2	! t0_kref+0x1154:   	fdtos	%f18, %f20
	.word	0xa33ca004	! t0_kref+0x1158:   	sra	%l2, 0x4, %l1
	.word	0xa9a000d4	! t0_kref+0x115c:   	fnegd	%f20, %f20
	.word	0x29480002	! t0_kref+0x1160:   	fbl,a,pt	%fcc0, _kref+0x1168
	.word	0xd068a000	! t0_kref+0x1164:   	ldstub	[%g2], %o0
	.word	0xa91c400c	! t0_kref+0x1168:   	tsubcctv	%l1, %o4, %l4
	.word	0xa1a58d2d	! t0_kref+0x116c:   	fsmuld	%f22, %f13, %f16
	.word	0xa8d5acf1	! t0_kref+0x1170:   	umulcc	%l6, 0xcf1, %l4
	.word	0xda7e2014	! t0_kref+0x1174:   	swap	[%i0 + 0x14], %o5
	.word	0xa45c36dc	! t0_kref+0x1178:   	smul	%l0, -0x924, %l2
	.word	0xa422c014	! t0_kref+0x117c:   	sub	%o3, %l4, %l2
	.word	0xead81019	! t0_kref+0x1180:   	ldxa	[%g0 + %i1]0x80, %l5
	.word	0xe4df5018	! t0_kref+0x1184:   	ldxa	[%i5 + %i0]0x80, %l2
	.word	0x37480006	! t0_kref+0x1188:   	fbge,a,pt	%fcc0, _kref+0x11a0
	.word	0xaa74a5b7	! t0_kref+0x118c:   	udiv	%l2, 0x5b7, %l5
	.word	0xec20a02c	! t0_kref+0x1190:   	st	%l6, [%g2 + 0x2c]
	.word	0x93a0052e	! t0_kref+0x1194:   	fsqrts	%f14, %f9
	.word	0xef68a00a	! t0_kref+0x1198:   	prefetch	%g2 + 0xa, 23
	.word	0x91a01915	! t0_kref+0x119c:   	fitod	%f21, %f8
	.word	0xa6b4c014	! t0_kref+0x11a0:   	orncc	%l3, %l4, %l3
	.word	0x35480001	! t0_kref+0x11a4:   	fbue,a,pt	%fcc0, _kref+0x11a8
	.word	0xe0f65000	! t0_kref+0x11a8:   	stxa	%l0, [%i1]0x80
	.word	0x97a0052b	! t0_kref+0x11ac:   	fsqrts	%f11, %f11
	.word	0xe0160000	! t0_kref+0x11b0:   	lduh	[%i0], %l0
	.word	0x9de3bfa0	! t0_kref+0x11b4:   	save	%sp, -0x60, %sp
	.word	0xa1e80000	! t0_kref+0x11b8:   	restore	%g0, %g0, %l0
	.word	0x9da018d6	! t0_kref+0x11bc:   	fdtos	%f22, %f14
	.word	0xeaa6101c	! t0_kref+0x11c0:   	sta	%l5, [%i0 + %i4]0x80
	.word	0x211ab969	! t0_kref+0x11c4:   	sethi	%hi(0x6ae5a400), %l0
	.word	0x8610201a	! t0_kref+0x11c8:   	mov	0x1a, %g3
	.word	0x86a0e001	! t0_kref+0x11cc:   	subcc	%g3, 1, %g3
	.word	0x22800018	! t0_kref+0x11d0:   	be,a	_kref+0x1230
	.word	0xa072f040	! t0_kref+0x11d4:   	udiv	%o3, -0xfc0, %l0
	.word	0xe3b8a080	! t0_kref+0x11d8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe44e8019	! t0_kref+0x11dc:   	ldsb	[%i2 + %i1], %l2
	.word	0xa9400000	! t0_kref+0x11e0:   	mov	%y, %l4
	.word	0x9da38d29	! t0_kref+0x11e4:   	fsmuld	%f14, %f9, %f14
	.word	0xe100a024	! t0_kref+0x11e8:   	ld	[%g2 + 0x24], %f16
	call	SYM(t0_subr3)
	.word	0xe720a014	! t0_kref+0x11f0:   	st	%f19, [%g2 + 0x14]
	.word	0xa1a0102b	! t0_kref+0x11f4:   	fstox	%f11, %f16
	.word	0xa245401a	! t0_kref+0x11f8:   	addc	%l5, %i2, %l1
	.word	0xd630a03a	! t0_kref+0x11fc:   	sth	%o3, [%g2 + 0x3a]
	.word	0xe9b81019	! t0_kref+0x1200:   	stda	%f20, [%g0 + %i1]0x80
	.word	0xa9200011	! t0_kref+0x1204:   	mulscc	%g0, %l1, %l4
	.word	0xaaf2c000	! t0_kref+0x1208:   	udivcc	%o3, %g0, %l5
	.word	0xd2270018	! t0_kref+0x120c:   	st	%o1, [%i4 + %i0]
	.word	0xe8064000	! t0_kref+0x1210:   	ld	[%i1], %l4
	.word	0x81830000	! t0_kref+0x1214:   	wr	%o4, %g0, %y
	.word	0x81da0013	! t0_kref+0x1218:   	flush	%o0 + %l3
	.word	0x30480008	! t0_kref+0x121c:   	ba,a,pt	%icc, _kref+0x123c
	.word	0xa71b2a68	! t0_kref+0x1220:   	tsubcctv	%o4, 0xa68, %l3
	.word	0xe410a02e	! t0_kref+0x1224:   	lduh	[%g2 + 0x2e], %l2
	.word	0x91a01a48	! t0_kref+0x1228:   	fdtoi	%f8, %f8
	.word	0xe410a024	! t0_kref+0x122c:   	lduh	[%g2 + 0x24], %l2
	.word	0xab400000	! t0_kref+0x1230:   	mov	%y, %l5
	.word	0xc768a004	! t0_kref+0x1234:   	prefetch	%g2 + 4, 3
	.word	0xa2e4401a	! t0_kref+0x1238:   	subccc	%l1, %i2, %l1
	.word	0xe1ee101b	! t0_kref+0x123c:   	prefetcha	%i0 + %i3, 16
	.word	0x9fa01a4c	! t0_kref+0x1240:   	fdtoi	%f12, %f15
	.word	0xe0871018	! t0_kref+0x1244:   	lda	[%i4 + %i0]0x80, %l0
	.word	0xe968a081	! t0_kref+0x1248:   	prefetch	%g2 + 0x81, 20
	.word	0x32800005	! t0_kref+0x124c:   	bne,a	_kref+0x1260
	.word	0xed262018	! t0_kref+0x1250:   	st	%f22, [%i0 + 0x18]
	.word	0x9f414000	! t0_kref+0x1254:   	mov	%pc, %o7
	.word	0xe2ff1018	! t0_kref+0x1258:   	swapa	[%i4 + %i0]0x80, %l1
	.word	0xee28a029	! t0_kref+0x125c:   	stb	%l7, [%g2 + 0x29]
	.word	0xe8981019	! t0_kref+0x1260:   	ldda	[%g0 + %i1]0x80, %l4
	.word	0xa0e3401b	! t0_kref+0x1264:   	subccc	%o5, %i3, %l0
	.word	0xa5346002	! t0_kref+0x1268:   	srl	%l1, 0x2, %l2
	.word	0xd02e3fee	! t0_kref+0x126c:   	stb	%o0, [%i0 - 0x12]
	.word	0xa3a000b6	! t0_kref+0x1270:   	fnegs	%f22, %f17
	.word	0xf007bfe0	! t0_kref+0x1274:   	ld	[%fp - 0x20], %i0
	.word	0xe968a081	! t0_kref+0x1278:   	prefetch	%g2 + 0x81, 20
	.word	0xa035400d	! t0_kref+0x127c:   	orn	%l5, %o5, %l0
	.word	0xa2a30016	! t0_kref+0x1280:   	subcc	%o4, %l6, %l1
	.word	0xd906401c	! t0_kref+0x1284:   	ld	[%i1 + %i4], %f12
	.word	0xa2fb0008	! t0_kref+0x1288:   	sdivcc	%o4, %o0, %l1
	.word	0x83c06808	! t0_kref+0x128c:   	jmpl	%g1 + 0x808, %g1
	.word	0xe44e001a	! t0_kref+0x1290:   	ldsb	[%i0 + %i2], %l2
	.word	0xee20a020	! t0_kref+0x1294:   	st	%l7, [%g2 + 0x20]
	.word	0x97a01a30	! t0_kref+0x1298:   	fstoi	%f16, %f11
	.word	0xd1be580d	! t0_kref+0x129c:   	stda	%f8, [%i1 + %o5]0xc0
	.word	0x2c800002	! t0_kref+0x12a0:   	bneg,a	_kref+0x12a8
	.word	0xa9a0192a	! t0_kref+0x12a4:   	fstod	%f10, %f20
	sethi	%hi(1f), %o7
	jmpl	%o7+%lo(1f), %g1
	.empty
	.word	0xee28a014	! t0_kref+0x12b0:   	stb	%l7, [%g2 + 0x14]
	.word	0xa2434016	! t0_kref+0x12b4:   	addc	%o5, %l6, %l1
	.word	0x27480003	! t0_kref+0x12b8:   	fbul,a,pt	%fcc0, _kref+0x12c4
	.word	0x9fa00029	! t0_kref+0x12bc:   	fmovs	%f9, %f15
	.word	0x93a00531	! t0_kref+0x12c0:   	fsqrts	%f17, %f9
	.word	0xaa2a000c	! t0_kref+0x12c4:   	andn	%o0, %o4, %l5
1:	.word	0x95a01a2e	! t0_kref+0x12c8:   	fstoi	%f14, %f10
	.word	0xeb262014	! t0_kref+0x12cc:   	st	%f21, [%i0 + 0x14]
	.word	0xe9bf5a19	! t0_kref+0x12d0:   	stda	%f20, [%i5 + %i1]0xd0
	.word	0xda20a024	! t0_kref+0x12d4:   	st	%o5, [%g2 + 0x24]
	.word	0xa47ef98f	! t0_kref+0x12d8:   	sdiv	%i3, -0x671, %l2
	.word	0xa8b463b5	! t0_kref+0x12dc:   	orncc	%l1, 0x3b5, %l4
	.word	0xec20a028	! t0_kref+0x12e0:   	st	%l6, [%g2 + 0x28]
	.word	0xd9bf1a19	! t0_kref+0x12e4:   	stda	%f12, [%i4 + %i1]0xd0
	.word	0xa462f512	! t0_kref+0x12e8:   	subc	%o3, -0xaee, %l2
	.word	0x22800008	! t0_kref+0x12ec:   	be,a	_kref+0x130c
	.word	0xe440a028	! t0_kref+0x12f0:   	ldsw	[%g2 + 0x28], %l2
	.word	0xa2e6a5f1	! t0_kref+0x12f4:   	subccc	%i2, 0x5f1, %l1
	.word	0xab408000	! t0_kref+0x12f8:   	mov	%ccr, %l5
	.word	0xd87f0019	! t0_kref+0x12fc:   	swap	[%i4 + %i1], %o4
	.word	0x2f480002	! t0_kref+0x1300:   	fbu,a,pt	%fcc0, _kref+0x1308
	.word	0xa82a2f32	! t0_kref+0x1304:   	andn	%o0, 0xf32, %l4
	.word	0x28480005	! t0_kref+0x1308:   	bleu,a,pt	%icc, _kref+0x131c
	.word	0xe4100019	! t0_kref+0x130c:   	lduh	[%g0 + %i1], %l2
	.word	0xd0f01018	! t0_kref+0x1310:   	stxa	%o0, [%g0 + %i0]0x80
	.word	0xc9ee101a	! t0_kref+0x1314:   	prefetcha	%i0 + %i2, 4
	.word	0xc0262010	! t0_kref+0x1318:   	clr	[%i0 + 0x10]
	.word	0xa475a199	! t0_kref+0x131c:   	udiv	%l6, 0x199, %l2
	.word	0x81ad0a52	! t0_kref+0x1320:   	fcmpd	%fcc0, %f20, %f18
	.word	0xe56e401d	! t0_kref+0x1324:   	prefetch	%i1 + %i5, 18
	.word	0xa65a400b	! t0_kref+0x1328:   	smul	%o1, %o3, %l3
	.word	0xa1230008	! t0_kref+0x132c:   	mulscc	%o4, %o0, %l0
	.word	0x2d480007	! t0_kref+0x1330:   	fbg,a,pt	%fcc0, _kref+0x134c
	.word	0xea567ff0	! t0_kref+0x1334:   	ldsh	[%i1 - 0x10], %l5
	.word	0xa5400000	! t0_kref+0x1338:   	mov	%y, %l2
	.word	0x91a000cc	! t0_kref+0x133c:   	fnegd	%f12, %f8
	.word	0xa2b28000	! t0_kref+0x1340:   	orncc	%o2, %g0, %l1
	.word	0x81828000	! t0_kref+0x1344:   	wr	%o2, %g0, %y
	.word	0xea861000	! t0_kref+0x1348:   	lda	[%i0]0x80, %l5
	.word	0xa2500008	! t0_kref+0x134c:   	umul	%g0, %o0, %l1
	.word	0x99a00533	! t0_kref+0x1350:   	fsqrts	%f19, %f12
	.word	0xab400000	! t0_kref+0x1354:   	mov	%y, %l5
	.word	0xec1e3ff8	! t0_kref+0x1358:   	ldd	[%i0 - 8], %l6
	.word	0xe606600c	! t0_kref+0x135c:   	ld	[%i1 + 0xc], %l3
	.word	0xec9e101d	! t0_kref+0x1360:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0xa426c009	! t0_kref+0x1364:   	sub	%i3, %o1, %l2
	.word	0xa7400000	! t0_kref+0x1368:   	mov	%y, %l3
	.word	0xe816c018	! t0_kref+0x136c:   	lduh	[%i3 + %i0], %l4
	.word	0xa9354014	! t0_kref+0x1370:   	srl	%l5, %l4, %l4
	.word	0x99a30848	! t0_kref+0x1374:   	faddd	%f12, %f8, %f12
	.word	0xe616c018	! t0_kref+0x1378:   	lduh	[%i3 + %i0], %l3
	.word	0xec6e2007	! t0_kref+0x137c:   	ldstub	[%i0 + 7], %l6
	.word	0xaab4800d	! t0_kref+0x1380:   	orncc	%l2, %o5, %l5
	.word	0xe6070019	! t0_kref+0x1384:   	ld	[%i4 + %i1], %l3
	.word	0xa60ac015	! t0_kref+0x1388:   	and	%o3, %l5, %l3
	.word	0x3c480005	! t0_kref+0x138c:   	bpos,a,pt	%icc, _kref+0x13a0
	.word	0xf4380019	! t0_kref+0x1390:   	std	%i2, [%g0 + %i1]
	.word	0xaae68008	! t0_kref+0x1394:   	subccc	%i2, %o0, %l5
	.word	0xee2e7fff	! t0_kref+0x1398:   	stb	%l7, [%i1 - 1]
	.word	0xef6e3fe0	! t0_kref+0x139c:   	prefetch	%i0 - 0x20, 23
	.word	0xaba00536	! t0_kref+0x13a0:   	fsqrts	%f22, %f21
	.word	0xa02e8000	! t0_kref+0x13a4:   	andn	%i2, %g0, %l0
	.word	0x9da58d31	! t0_kref+0x13a8:   	fsmuld	%f22, %f17, %f14
	.word	0xa5a0052f	! t0_kref+0x13ac:   	fsqrts	%f15, %f18
	.word	0xe0063fe0	! t0_kref+0x13b0:   	ld	[%i0 - 0x20], %l0
	.word	0xed000019	! t0_kref+0x13b4:   	ld	[%g0 + %i1], %f22
	.word	0xe9be5a1d	! t0_kref+0x13b8:   	stda	%f20, [%i1 + %i5]0xd0
	.word	0x99a30833	! t0_kref+0x13bc:   	fadds	%f12, %f19, %f12
	.word	0x8182c000	! t0_kref+0x13c0:   	wr	%o3, %g0, %y
	sethi	%hi(2f), %o7
	.word	0xe40be000	! t0_kref+0x13c8:   	ldub	[%o7], %l2
	.word	0xa41ca00c	! t0_kref+0x13cc:   	xor	%l2, 0xc, %l2
	.word	0xe42be000	! t0_kref+0x13d0:   	stb	%l2, [%o7]
	.word	0x81dbe000	! t0_kref+0x13d4:   	flush	%o7
	.word	0xa0248014	! t0_kref+0x13d8:   	sub	%l2, %l4, %l0
	.word	0xab418000	! t0_kref+0x13dc:   	mov	%fprs, %l5
	.word	0x93a4c82a	! t0_kref+0x13e0:   	fadds	%f19, %f10, %f9
	.word	0x99a01a28	! t0_kref+0x13e4:   	fstoi	%f8, %f12
	.word	0xe2460000	! t0_kref+0x13e8:   	ldsw	[%i0], %l1
	.word	0x91a01a2a	! t0_kref+0x13ec:   	fstoi	%f10, %f8
	.word	0x9da0102a	! t0_kref+0x13f0:   	fstox	%f10, %f14
	.word	0x23480004	! t0_kref+0x13f4:   	fbne,a,pt	%fcc0, _kref+0x1404
	.word	0xa495800a	! t0_kref+0x13f8:   	orcc	%l6, %o2, %l2
	.word	0xa4d30015	! t0_kref+0x13fc:   	umulcc	%o4, %l5, %l2
2:	.word	0xa626fa55	! t0_kref+0x1400:   	sub	%i3, -0x5ab, %l3
	.word	0xa932201b	! t0_kref+0x1404:   	srl	%o0, 0x1b, %l4
	.word	0xd428a026	! t0_kref+0x1408:   	stb	%o2, [%g2 + 0x26]
	.word	0x35480005	! t0_kref+0x140c:   	fbue,a,pt	%fcc0, _kref+0x1420
	.word	0xa12d0016	! t0_kref+0x1410:   	sll	%l4, %l6, %l0
	.word	0xe606600c	! t0_kref+0x1414:   	ld	[%i1 + 0xc], %l3
	.word	0xa1232eba	! t0_kref+0x1418:   	mulscc	%o4, 0xeba, %l0
	.word	0x95a01a48	! t0_kref+0x141c:   	fdtoi	%f8, %f10
	.word	0xa22ac00c	! t0_kref+0x1420:   	andn	%o3, %o4, %l1
	.word	0xe1be185a	! t0_kref+0x1424:   	stda	%f16, [%i0 + %i2]0xc2
	.word	0xe3b8a080	! t0_kref+0x1428:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x3c480006	! t0_kref+0x142c:   	bpos,a,pt	%icc, _kref+0x1444
	.word	0xa416a1a5	! t0_kref+0x1430:   	or	%i2, 0x1a5, %l2
	.word	0x95a94035	! t0_kref+0x1434:   	fmovsug	%fcc0, %f21, %f10
	.word	0xab3e800b	! t0_kref+0x1438:   	sra	%i2, %o3, %l5
	.word	0x2b480003	! t0_kref+0x143c:   	fbug,a,pt	%fcc0, _kref+0x1448
	.word	0x9ba01a48	! t0_kref+0x1440:   	fdtoi	%f8, %f13
	.word	0x3d480003	! t0_kref+0x1444:   	fbule,a,pt	%fcc0, _kref+0x1450
	.word	0x2339b604	! t0_kref+0x1448:   	sethi	%hi(0xe6d81000), %l1
	.word	0x34800001	! t0_kref+0x144c:   	bg,a	_kref+0x1450
	.word	0xec180019	! t0_kref+0x1450:   	ldd	[%g0 + %i1], %l6
	.word	0xa1700010	! t0_kref+0x1454:   	popc	%l0, %l0
	.word	0x2c480007	! t0_kref+0x1458:   	bneg,a,pt	%icc, _kref+0x1474
	.word	0xa4340009	! t0_kref+0x145c:   	orn	%l0, %o1, %l2
	.word	0xe4100018	! t0_kref+0x1460:   	lduh	[%g0 + %i0], %l2
	.word	0xea7e7ff4	! t0_kref+0x1464:   	swap	[%i1 - 0xc], %l5
	.word	0xa2140011	! t0_kref+0x1468:   	or	%l0, %l1, %l1
	.word	0xe416401b	! t0_kref+0x146c:   	lduh	[%i1 + %i3], %l2
	.word	0xa094c00d	! t0_kref+0x1470:   	orcc	%l3, %o5, %l0
	.word	0xe168a009	! t0_kref+0x1474:   	prefetch	%g2 + 9, 16
	.word	0xd230a02a	! t0_kref+0x1478:   	sth	%o1, [%g2 + 0x2a]
	.word	0xa895c017	! t0_kref+0x147c:   	orcc	%l7, %l7, %l4
	.word	0xa53a6005	! t0_kref+0x1480:   	sra	%o1, 0x5, %l2
	.word	0xa6dd2644	! t0_kref+0x1484:   	smulcc	%l4, 0x644, %l3
	.word	0xa4d68011	! t0_kref+0x1488:   	umulcc	%i2, %l1, %l2
	.word	0x9ba0052c	! t0_kref+0x148c:   	fsqrts	%f12, %f13
	.word	0x91a3892e	! t0_kref+0x1490:   	fmuls	%f14, %f14, %f8
	.word	0xe02e6003	! t0_kref+0x1494:   	stb	%l0, [%i1 + 3]
	.word	0xe400a00c	! t0_kref+0x1498:   	ld	[%g2 + 0xc], %l2
	.word	0xfb6e001a	! t0_kref+0x149c:   	prefetch	%i0 + %i2, 29
	.word	0x95a0192f	! t0_kref+0x14a0:   	fstod	%f15, %f10
	.word	0x81ab0a28	! t0_kref+0x14a4:   	fcmps	%fcc0, %f12, %f8
	.word	0xc3ee5013	! t0_kref+0x14a8:   	prefetcha	%i1 + %l3, 1
	.word	0xe6167fea	! t0_kref+0x14ac:   	lduh	[%i1 - 0x16], %l3
	.word	0xa49b000a	! t0_kref+0x14b0:   	xorcc	%o4, %o2, %l2
	.word	0x91a018c8	! t0_kref+0x14b4:   	fdtos	%f8, %f8
	.word	0x26480008	! t0_kref+0x14b8:   	bl,a,pt	%icc, _kref+0x14d8
	.word	0xa2d28011	! t0_kref+0x14bc:   	umulcc	%o2, %l1, %l1
	.word	0xe016001b	! t0_kref+0x14c0:   	lduh	[%i0 + %i3], %l0
	.word	0x20800004	! t0_kref+0x14c4:   	bn,a	_kref+0x14d4
	.word	0xaae48017	! t0_kref+0x14c8:   	subccc	%l2, %l7, %l5
	.word	0xaa580013	! t0_kref+0x14cc:   	smul	%g0, %l3, %l5
	.word	0xd1be1813	! t0_kref+0x14d0:   	stda	%f8, [%i0 + %l3]0xc0
	.word	0x95a00128	! t0_kref+0x14d4:   	fabss	%f8, %f10
	.word	0xa5a01932	! t0_kref+0x14d8:   	fstod	%f18, %f18
	.word	0x29480002	! t0_kref+0x14dc:   	fbl,a,pt	%fcc0, _kref+0x14e4
	.word	0xa87232ae	! t0_kref+0x14e0:   	udiv	%o0, -0xd52, %l4
	.word	0xa93ca001	! t0_kref+0x14e4:   	sra	%l2, 0x1, %l4
	.word	0x001fffff	! t0_kref+0x14e8:   	illtrap	0x1fffff
	.word	0xe920a014	! t0_kref+0x14ec:   	st	%f20, [%g2 + 0x14]
	.word	0xe4167ff2	! t0_kref+0x14f0:   	lduh	[%i1 - 0xe], %l2
	.word	0x3e800001	! t0_kref+0x14f4:   	bvc,a	_kref+0x14f8
	.word	0xa8d5a814	! t0_kref+0x14f8:   	umulcc	%l6, 0x814, %l4
	.word	0xa0ab001b	! t0_kref+0x14fc:   	andncc	%o4, %i3, %l0
	.word	0x9fa01a52	! t0_kref+0x1500:   	fdtoi	%f18, %f15
	.word	0x95a508ae	! t0_kref+0x1504:   	fsubs	%f20, %f14, %f10
	.word	0xa4500016	! t0_kref+0x1508:   	umul	%g0, %l6, %l2
	.word	0xa0dcc00c	! t0_kref+0x150c:   	smulcc	%l3, %o4, %l0
	.word	0xa1a000c8	! t0_kref+0x1510:   	fnegd	%f8, %f16
	.word	0xe800a000	! t0_kref+0x1514:   	ld	[%g2], %l4
	.word	0xa662631c	! t0_kref+0x1518:   	subc	%o1, 0x31c, %l3
	.word	0xe96e2008	! t0_kref+0x151c:   	prefetch	%i0 + 8, 20
	.word	0xdf066010	! t0_kref+0x1520:   	ld	[%i1 + 0x10], %f15
	.word	0x34800001	! t0_kref+0x1524:   	bg,a	_kref+0x1528
	.word	0xd7063ff0	! t0_kref+0x1528:   	ld	[%i0 - 0x10], %f11
	.word	0xa09523c8	! t0_kref+0x152c:   	orcc	%l4, 0x3c8, %l0
	.word	0xa1a58935	! t0_kref+0x1530:   	fmuls	%f22, %f21, %f16
	.word	0x81580000	! t0_kref+0x1534:   	flushw
	.word	0xa9a4084c	! t0_kref+0x1538:   	faddd	%f16, %f12, %f20
	.word	0xe120a004	! t0_kref+0x153c:   	st	%f16, [%g2 + 4]
	.word	0xab33600d	! t0_kref+0x1540:   	srl	%o5, 0xd, %l5
	.word	0xea6e3fe9	! t0_kref+0x1544:   	ldstub	[%i0 - 0x17], %l5
	.word	0xaba01a32	! t0_kref+0x1548:   	fstoi	%f18, %f21
	.word	0xe2100018	! t0_kref+0x154c:   	lduh	[%g0 + %i0], %l1
	.word	0x253ae665	! t0_kref+0x1550:   	sethi	%hi(0xeb999400), %l2
	.word	0xa4953d85	! t0_kref+0x1554:   	orcc	%l4, -0x27b, %l2
	.word	0xa274e559	! t0_kref+0x1558:   	udiv	%l3, 0x559, %l1
	.word	0xd428a036	! t0_kref+0x155c:   	stb	%o2, [%g2 + 0x36]
	.word	0xa0ac8010	! t0_kref+0x1560:   	andncc	%l2, %l0, %l0
	.word	0xaba4c929	! t0_kref+0x1564:   	fmuls	%f19, %f9, %f21
	.word	0xa6e6800a	! t0_kref+0x1568:   	subccc	%i2, %o2, %l3
	.word	0x24480001	! t0_kref+0x156c:   	ble,a,pt	%icc, _kref+0x1570
	.word	0xaba018cc	! t0_kref+0x1570:   	fdtos	%f12, %f21
	.word	0x81820000	! t0_kref+0x1574:   	wr	%o0, %g0, %y
	.word	0xda6e3fec	! t0_kref+0x1578:   	ldstub	[%i0 - 0x14], %o5
	.word	0xdf263ff0	! t0_kref+0x157c:   	st	%f15, [%i0 - 0x10]
	.word	0xe840a010	! t0_kref+0x1580:   	ldsw	[%g2 + 0x10], %l4
	.word	0xe3b8a080	! t0_kref+0x1584:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa40e800d	! t0_kref+0x1588:   	and	%i2, %o5, %l2
	.word	0x2e800008	! t0_kref+0x158c:   	bvs,a	_kref+0x15ac
	.word	0xa7400000	! t0_kref+0x1590:   	mov	%y, %l3
	.word	0xe2560000	! t0_kref+0x1594:   	ldsh	[%i0], %l1
	.word	0xa244c00c	! t0_kref+0x1598:   	addc	%l3, %o4, %l1
	.word	0x24480002	! t0_kref+0x159c:   	ble,a,pt	%icc, _kref+0x15a4
	.word	0xa4ad4011	! t0_kref+0x15a0:   	andncc	%l5, %l1, %l2
	.word	0xa01c7be0	! t0_kref+0x15a4:   	xor	%l1, -0x420, %l0
	.word	0xd220a010	! t0_kref+0x15a8:   	st	%o1, [%g2 + 0x10]
	.word	0xe03e2000	! t0_kref+0x15ac:   	std	%l0, [%i0]
	.word	0xaa3ce8c8	! t0_kref+0x15b0:   	xnor	%l3, 0x8c8, %l5
	.word	0xa1a01929	! t0_kref+0x15b4:   	fstod	%f9, %f16
	.word	0xc1ee100a	! t0_kref+0x15b8:   	prefetcha	%i0 + %o2, 0
	.word	0xa2bdbdcb	! t0_kref+0x15bc:   	xnorcc	%l6, -0x235, %l1
	.word	0x93a01092	! t0_kref+0x15c0:   	fxtos	%f18, %f9
	.word	0x99a2cd2a	! t0_kref+0x15c4:   	fsmuld	%f11, %f10, %f12
	.word	0x24480007	! t0_kref+0x15c8:   	ble,a,pt	%icc, _kref+0x15e4
	.word	0xab400000	! t0_kref+0x15cc:   	mov	%y, %l5
	.word	0x81acca2a	! t0_kref+0x15d0:   	fcmps	%fcc0, %f19, %f10
	.word	0xa52b001a	! t0_kref+0x15d4:   	sll	%o4, %i2, %l2
	.word	0xd4ee9019	! t0_kref+0x15d8:   	ldstuba	[%i2 + %i1]0x80, %o2
	.word	0xec30a00c	! t0_kref+0x15dc:   	sth	%l6, [%g2 + 0xc]
	.word	0xa5a000d4	! t0_kref+0x15e0:   	fnegd	%f20, %f18
	.word	0xa6b53501	! t0_kref+0x15e4:   	orncc	%l4, -0xaff, %l3
	.word	0xc0200018	! t0_kref+0x15e8:   	clr	[%g0 + %i0]
	.word	0xc0ff1018	! t0_kref+0x15ec:   	swapa	[%i4 + %i0]0x80, %g0
	.word	0xea7e7ffc	! t0_kref+0x15f0:   	swap	[%i1 - 4], %l5
	.word	0xa7a01a50	! t0_kref+0x15f4:   	fdtoi	%f16, %f19
	.word	0xaa644011	! t0_kref+0x15f8:   	subc	%l1, %l1, %l5
	.word	0xaa6428f8	! t0_kref+0x15fc:   	subc	%l0, 0x8f8, %l5
	.word	0xc96e2008	! t0_kref+0x1600:   	prefetch	%i0 + 8, 4
	.word	0xe656c019	! t0_kref+0x1604:   	ldsh	[%i3 + %i1], %l3
	.word	0xe9be5888	! t0_kref+0x1608:   	stda	%f20, [%i1 + %o0]0xc4
	.word	0xd8263ffc	! t0_kref+0x160c:   	st	%o4, [%i0 - 4]
	.word	0xa71b28fe	! t0_kref+0x1610:   	tsubcctv	%o4, 0x8fe, %l3
	.word	0x99a01a50	! t0_kref+0x1614:   	fdtoi	%f16, %f12
	.word	0x9da000ce	! t0_kref+0x1618:   	fnegd	%f14, %f14
	.word	0xa533601d	! t0_kref+0x161c:   	srl	%o5, 0x1d, %l2
	.word	0x3a480004	! t0_kref+0x1620:   	bcc,a,pt	%icc, _kref+0x1630
	.word	0xa32ae01f	! t0_kref+0x1624:   	sll	%o3, 0x1f, %l1
	.word	0xe93e3ff0	! t0_kref+0x1628:   	std	%f20, [%i0 - 0x10]
	.word	0xa9a38d29	! t0_kref+0x162c:   	fsmuld	%f14, %f9, %f20
	.word	0xa8243bcd	! t0_kref+0x1630:   	sub	%l0, -0x433, %l4
	.word	0xf3ee101b	! t0_kref+0x1634:   	prefetcha	%i0 + %i3, 25
	.word	0xd2e81018	! t0_kref+0x1638:   	ldstuba	[%g0 + %i0]0x80, %o1
	.word	0xa80c0011	! t0_kref+0x163c:   	and	%l0, %l1, %l4
	.word	0x9ba000aa	! t0_kref+0x1640:   	fnegs	%f10, %f13
	.word	0x32480001	! t0_kref+0x1644:   	bne,a,pt	%icc, _kref+0x1648
	.word	0xa42dad6f	! t0_kref+0x1648:   	andn	%l6, 0xd6f, %l2
	.word	0x95a01092	! t0_kref+0x164c:   	fxtos	%f18, %f10
	.word	0x39480008	! t0_kref+0x1650:   	fbuge,a,pt	%fcc0, _kref+0x1670
	.word	0x97a489af	! t0_kref+0x1654:   	fdivs	%f18, %f15, %f11
	.word	0xe8500019	! t0_kref+0x1658:   	ldsh	[%g0 + %i1], %l4
	.word	0xa612c01a	! t0_kref+0x165c:   	or	%o3, %i2, %l3
	.word	0xe6901018	! t0_kref+0x1660:   	lduha	[%g0 + %i0]0x80, %l3
	.word	0x29480005	! t0_kref+0x1664:   	fbl,a,pt	%fcc0, _kref+0x1678
	.word	0xa2256515	! t0_kref+0x1668:   	sub	%l5, 0x515, %l1
	.word	0xc16e000d	! t0_kref+0x166c:   	prefetch	%i0 + %o5, 0
	.word	0xe900a034	! t0_kref+0x1670:   	ld	[%g2 + 0x34], %f20
	.word	0xe0000019	! t0_kref+0x1674:   	ld	[%g0 + %i1], %l0
	.word	0xab400000	! t0_kref+0x1678:   	mov	%y, %l5
	.word	0x3c800005	! t0_kref+0x167c:   	bpos,a	_kref+0x1690
	.word	0xa1232c13	! t0_kref+0x1680:   	mulscc	%o4, 0xc13, %l0
	.word	0xe26e601b	! t0_kref+0x1684:   	ldstub	[%i1 + 0x1b], %l1
	.word	0x20800007	! t0_kref+0x1688:   	bn,a	_kref+0x16a4
	.word	0xa8a4c00c	! t0_kref+0x168c:   	subcc	%l3, %o4, %l4
	.word	0x8182c000	! t0_kref+0x1690:   	wr	%o3, %g0, %y
	.word	0xa1a24d2d	! t0_kref+0x1694:   	fsmuld	%f9, %f13, %f16
	.word	0xa895801b	! t0_kref+0x1698:   	orcc	%l6, %i3, %l4
	.word	0xa2e2bc83	! t0_kref+0x169c:   	subccc	%o2, -0x37d, %l1
	.word	0xdd00a03c	! t0_kref+0x16a0:   	ld	[%g2 + 0x3c], %f14
	.word	0xa0924017	! t0_kref+0x16a4:   	orcc	%o1, %l7, %l0
	.word	0xa7a28831	! t0_kref+0x16a8:   	fadds	%f10, %f17, %f19
	.word	0x2a480001	! t0_kref+0x16ac:   	bcs,a,pt	%icc, _kref+0x16b0
	.word	0xaa22ed12	! t0_kref+0x16b0:   	sub	%o3, 0xd12, %l5
	.word	0xc96e400b	! t0_kref+0x16b4:   	prefetch	%i1 + %o3, 4
	.word	0xa42d800c	! t0_kref+0x16b8:   	andn	%l6, %o4, %l2
	.word	0x91a509d6	! t0_kref+0x16bc:   	fdivd	%f20, %f22, %f8
	.word	0x81ad4aad	! t0_kref+0x16c0:   	fcmpes	%fcc0, %f21, %f13
	.word	0x95a000b1	! t0_kref+0x16c4:   	fnegs	%f17, %f10
	.word	0xc3ee5011	! t0_kref+0x16c8:   	prefetcha	%i1 + %l1, 1
	.word	0xed871019	! t0_kref+0x16cc:   	lda	[%i4 + %i1]0x80, %f22
	.word	0x2c480005	! t0_kref+0x16d0:   	bneg,a,pt	%icc, _kref+0x16e4
	.word	0xe448a039	! t0_kref+0x16d4:   	ldsb	[%g2 + 0x39], %l2
	.word	0xa2d6c00c	! t0_kref+0x16d8:   	umulcc	%i3, %o4, %l1
	.word	0xf16e7ff0	! t0_kref+0x16dc:   	prefetch	%i1 - 0x10, 24
	.word	0xa0240009	! t0_kref+0x16e0:   	sub	%l0, %o1, %l0
	.word	0x9da308b1	! t0_kref+0x16e4:   	fsubs	%f12, %f17, %f14
	call	SYM(t0_subr3)
	.word	0xaa5b4017	! t0_kref+0x16ec:   	smul	%o5, %l7, %l5
	.word	0x9de3bfa0	! t0_kref+0x16f0:   	save	%sp, -0x60, %sp
	.word	0xb6172a26	! t0_kref+0x16f4:   	or	%i4, 0xa26, %i3
	.word	0xa5ef3e8b	! t0_kref+0x16f8:   	restore	%i4, -0x175, %l2
	.word	0xa1a01916	! t0_kref+0x16fc:   	fitod	%f22, %f16
	.word	0xa5326009	! t0_kref+0x1700:   	srl	%o1, 0x9, %l2
	.word	0x9de3bfa0	! t0_kref+0x1704:   	save	%sp, -0x60, %sp
	.word	0xb446401c	! t0_kref+0x1708:   	addc	%i1, %i4, %i2
	.word	0xa7eeb51d	! t0_kref+0x170c:   	restore	%i2, -0xae3, %l3
	.word	0xab2e8008	! t0_kref+0x1710:   	sll	%i2, %o0, %l5
	.word	0xe7262008	! t0_kref+0x1714:   	st	%f19, [%i0 + 8]
	.word	0xfdee101a	! t0_kref+0x1718:   	prefetcha	%i0 + %i2, 30
	.word	0xa9400000	! t0_kref+0x171c:   	mov	%y, %l4
	.word	0x81ab8a52	! t0_kref+0x1720:   	fcmpd	%fcc0, %f14, %f18
	.word	0xeb070018	! t0_kref+0x1724:   	ld	[%i4 + %i0], %f21
	.word	0xf630a00c	! t0_kref+0x1728:   	sth	%i3, [%g2 + 0xc]
	.word	0xd720a018	! t0_kref+0x172c:   	st	%f11, [%g2 + 0x18]
	.word	0xe210a02e	! t0_kref+0x1730:   	lduh	[%g2 + 0x2e], %l1
	.word	0xea7e7ff0	! t0_kref+0x1734:   	swap	[%i1 - 0x10], %l5
	.word	0x81ad4aab	! t0_kref+0x1738:   	fcmpes	%fcc0, %f21, %f11
	.word	0xa32a0010	! t0_kref+0x173c:   	sll	%o0, %l0, %l1
	.word	0x38800002	! t0_kref+0x1740:   	bgu,a	_kref+0x1748
	.word	0xf62e3ff6	! t0_kref+0x1744:   	stb	%i3, [%i0 - 0xa]
	.word	0xe99f1a19	! t0_kref+0x1748:   	ldda	[%i4 + %i1]0xd0, %f20
	.word	0xe0680018	! t0_kref+0x174c:   	ldstub	[%g0 + %i0], %l0
	.word	0xa60d4000	! t0_kref+0x1750:   	and	%l5, %g0, %l3
	.word	0xa20d8012	! t0_kref+0x1754:   	and	%l6, %l2, %l1
	.word	0xa53a2005	! t0_kref+0x1758:   	sra	%o0, 0x5, %l2
	.word	0xa092800c	! t0_kref+0x175c:   	orcc	%o2, %o4, %l0
	.word	0xe84e2010	! t0_kref+0x1760:   	ldsb	[%i0 + 0x10], %l4
	.word	0xa5a2c92d	! t0_kref+0x1764:   	fmuls	%f11, %f13, %f18
	.word	0xe64e6013	! t0_kref+0x1768:   	ldsb	[%i1 + 0x13], %l3
	.word	0x97a01a2c	! t0_kref+0x176c:   	fstoi	%f12, %f11
	.word	0xa236c017	! t0_kref+0x1770:   	orn	%i3, %l7, %l1
	.word	0x2b480002	! t0_kref+0x1774:   	fbug,a,pt	%fcc0, _kref+0x177c
	.word	0xaba00532	! t0_kref+0x1778:   	fsqrts	%f18, %f21
	.word	0xa1a54d32	! t0_kref+0x177c:   	fsmuld	%f21, %f18, %f16
	.word	0xe8162000	! t0_kref+0x1780:   	lduh	[%i0], %l4
	.word	0x91a01913	! t0_kref+0x1784:   	fitod	%f19, %f8
	.word	0xe08e9018	! t0_kref+0x1788:   	lduba	[%i2 + %i0]0x80, %l0
	.word	0xe416c018	! t0_kref+0x178c:   	lduh	[%i3 + %i0], %l2
	.word	0xe3b8a080	! t0_kref+0x1790:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xe850a00c	! t0_kref+0x1794:   	ldsh	[%g2 + 0xc], %l4
	.word	0xa2f5801a	! t0_kref+0x1798:   	udivcc	%l6, %i2, %l1
	.word	0xe19e5a1a	! t0_kref+0x179c:   	ldda	[%i1 + %i2]0xd0, %f16
	.word	0x93a248ae	! t0_kref+0x17a0:   	fsubs	%f9, %f14, %f9
	.word	0xaaf4f23e	! t0_kref+0x17a4:   	udivcc	%l3, -0xdc2, %l5
	.word	0xa125e005	! t0_kref+0x17a8:   	mulscc	%l7, 5, %l0
	.word	0xe408653c	! t0_kref+0x17ac:   	ldub	[%g1 + 0x53c], %l2
	.word	0xa41ca00c	! t0_kref+0x17b0:   	xor	%l2, 0xc, %l2
	.word	0xe428653c	! t0_kref+0x17b4:   	stb	%l2, [%g1 + 0x53c]
	.word	0x81d8653c	! t0_kref+0x17b8:   	flush	%g1 + 0x53c
	.word	0xa9a28950	! t0_kref+0x17bc:   	fmuld	%f10, %f16, %f20
	.word	0xd67e401c	! t0_kref+0x17c0:   	swap	[%i1 + %i4], %o3
	.word	0xfd6e6010	! t0_kref+0x17c4:   	prefetch	%i1 + 0x10, 30
	.word	0xec1e3ff0	! t0_kref+0x17c8:   	ldd	[%i0 - 0x10], %l6
	.word	0xa7a449ae	! t0_kref+0x17cc:   	fdivs	%f17, %f14, %f19
	.word	0x9da54d31	! t0_kref+0x17d0:   	fsmuld	%f21, %f17, %f14
	.word	0x91a01a29	! t0_kref+0x17d4:   	fstoi	%f9, %f8
	.word	0x81ad0a50	! t0_kref+0x17d8:   	fcmpd	%fcc0, %f20, %f16
	.word	0xa9a489d2	! t0_kref+0x17dc:   	fdivd	%f18, %f18, %f20
	.word	0x93a00030	! t0_kref+0x17e0:   	fmovs	%f16, %f9
	.word	0xa8f6ff2a	! t0_kref+0x17e4:   	udivcc	%i3, -0xd6, %l4
2:	.word	0x95a509d4	! t0_kref+0x17e8:   	fdivd	%f20, %f20, %f10
	.word	0xe6763fe8	! t0_kref+0x17ec:   	stx	%l3, [%i0 - 0x18]
	.word	0x97a01a2b	! t0_kref+0x17f0:   	fstoi	%f11, %f11
	.word	0x21172484	! t0_kref+0x17f4:   	sethi	%hi(0x5c921000), %l0
	.word	0xa69c401b	! t0_kref+0x17f8:   	xorcc	%l1, %i3, %l3
	.word	0xa1a01a48	! t0_kref+0x17fc:   	fdtoi	%f8, %f16
	.word	0xa276eca0	! t0_kref+0x1800:   	udiv	%i3, 0xca0, %l1
	.word	0xd1be1a1c	! t0_kref+0x1804:   	stda	%f8, [%i0 + %i4]0xd0
	.word	0xa33b6005	! t0_kref+0x1808:   	sra	%o5, 0x5, %l1
	.word	0xe8070019	! t0_kref+0x180c:   	ld	[%i4 + %i1], %l4
	.word	0xa9a3c92a	! t0_kref+0x1810:   	fmuls	%f15, %f10, %f20
	.word	0x3b480008	! t0_kref+0x1814:   	fble,a,pt	%fcc0, _kref+0x1834
	.word	0xa096af43	! t0_kref+0x1818:   	orcc	%i2, 0xf43, %l0
	.word	0xd1be1a1d	! t0_kref+0x181c:   	stda	%f8, [%i0 + %i5]0xd0
	.word	0xa83ef045	! t0_kref+0x1820:   	xnor	%i3, -0xfbb, %l4
	.word	0x91a3cd2a	! t0_kref+0x1824:   	fsmuld	%f15, %f10, %f8
	.word	0x2f480001	! t0_kref+0x1828:   	fbu,a,pt	%fcc0, _kref+0x182c
	.word	0xa9418000	! t0_kref+0x182c:   	mov	%fprs, %l4
	.word	0xe1067fe4	! t0_kref+0x1830:   	ld	[%i1 - 0x1c], %f16
	.word	0xa4532482	! t0_kref+0x1834:   	umul	%o4, 0x482, %l2
	.word	0xea28a037	! t0_kref+0x1838:   	stb	%l5, [%g2 + 0x37]
	.word	0xba103fe8	! t0_kref+0x183c:   	mov	0xffffffe8, %i5
	.word	0xdd20a014	! t0_kref+0x1840:   	st	%f14, [%g2 + 0x14]
	.word	0xe44e6007	! t0_kref+0x1844:   	ldsb	[%i1 + 7], %l2
	.word	0xed380019	! t0_kref+0x1848:   	std	%f22, [%g0 + %i1]
	.word	0xe8ce101a	! t0_kref+0x184c:   	ldsba	[%i0 + %i2]0x80, %l4
	.word	0xa426c016	! t0_kref+0x1850:   	sub	%i3, %l6, %l2
	.word	0xe3b8a080	! t0_kref+0x1854:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xa5418000	! t0_kref+0x1858:   	mov	%fprs, %l2
	.word	0xa8b40009	! t0_kref+0x185c:   	orncc	%l0, %o1, %l4
	.word	0x9fa01a2e	! t0_kref+0x1860:   	fstoi	%f14, %f15
	.word	0xa825280a	! t0_kref+0x1864:   	sub	%l4, 0x80a, %l4
	.word	0x81ab0a48	! t0_kref+0x1868:   	fcmpd	%fcc0, %f12, %f8
	.word	0xa4fb2dd7	! t0_kref+0x186c:   	sdivcc	%o4, 0xdd7, %l2
	.word	0x9da20848	! t0_kref+0x1870:   	faddd	%f8, %f8, %f14
	.word	0xaba01a4c	! t0_kref+0x1874:   	fdtoi	%f12, %f21
	.word	0xa4e24008	! t0_kref+0x1878:   	subccc	%o1, %o0, %l2
	.word	0xa858000c	! t0_kref+0x187c:   	smul	%g0, %o4, %l4
	.word	0x9da28d2b	! t0_kref+0x1880:   	fsmuld	%f10, %f11, %f14
	.word	0xe04e600c	! t0_kref+0x1884:   	ldsb	[%i1 + 0xc], %l0
	.word	0x9fc00004	! t0_kref+0x1888:   	call	%g0 + %g4
	.word	0xe920a014	! t0_kref+0x188c:   	st	%f20, [%g2 + 0x14]
	.word	0xa8780000	! t0_kref+0x1890:   	sdiv	%g0, %g0, %l4
	.word	0xa3418000	! t0_kref+0x1894:   	mov	%fprs, %l1
	.word	0xa1a2882d	! t0_kref+0x1898:   	fadds	%f10, %f13, %f16
	.word	0xf007bfe0	! t0_kref+0x189c:   	ld	[%fp - 0x20], %i0
	.word	0xa0a34008	! t0_kref+0x18a0:   	subcc	%o5, %o0, %l0
	.word	0xa7222943	! t0_kref+0x18a4:   	mulscc	%o0, 0x943, %l3
	.word	0xd02e401a	! t0_kref+0x18a8:   	stb	%o0, [%i1 + %i2]
	.word	0xd83f4019	! t0_kref+0x18ac:   	std	%o4, [%i5 + %i1]
	.word	0xa0d58014	! t0_kref+0x18b0:   	umulcc	%l6, %l4, %l0
	.word	0xa8aa800c	! t0_kref+0x18b4:   	andncc	%o2, %o4, %l4
	.word	0x9da01909	! t0_kref+0x18b8:   	fitod	%f9, %f14
	.word	0xa0d0000c	! t0_kref+0x18bc:   	umulcc	%g0, %o4, %l0
	.word	0xe428a004	! t0_kref+0x18c0:   	stb	%l2, [%g2 + 4]
	.word	0xe850a002	! t0_kref+0x18c4:   	ldsh	[%g2 + 2], %l4
	.word	0xea50a022	! t0_kref+0x18c8:   	ldsh	[%g2 + 0x22], %l5
	.word	0xe04e0000	! t0_kref+0x18cc:   	ldsb	[%i0], %l0
	.word	0xaa72bfda	! t0_kref+0x18d0:   	udiv	%o2, -0x26, %l5
	.word	0xec9e101d	! t0_kref+0x18d4:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0xa736c00c	! t0_kref+0x18d8:   	srl	%i3, %o4, %l3
	.word	0xd068a022	! t0_kref+0x18dc:   	ldstub	[%g2 + 0x22], %o0
	.word	0xa3400000	! t0_kref+0x18e0:   	mov	%y, %l1
	.word	0x38480001	! t0_kref+0x18e4:   	bgu,a,pt	%icc, _kref+0x18e8
	.word	0xa5a01910	! t0_kref+0x18e8:   	fitod	%f16, %f18
	.word	0x81d94010	! t0_kref+0x18ec:   	flush	%g5 + %l0
	.word	0xa8602403	! t0_kref+0x18f0:   	subc	%g0, 0x403, %l4
	.word	0xa82a401a	! t0_kref+0x18f4:   	andn	%o1, %i2, %l4
	.word	0x33480001	! t0_kref+0x18f8:   	fbe,a,pt	%fcc0, _kref+0x18fc
	.word	0xa25ec012	! t0_kref+0x18fc:   	smul	%i3, %l2, %l1
	.word	0xe648a011	! t0_kref+0x1900:   	ldsb	[%g2 + 0x11], %l3
	.word	0x81da0013	! t0_kref+0x1904:   	flush	%o0 + %l3
	.word	0xe986501c	! t0_kref+0x1908:   	lda	[%i1 + %i4]0x80, %f20
	.word	0x91a0190a	! t0_kref+0x190c:   	fitod	%f10, %f8
	.word	0xa865f41b	! t0_kref+0x1910:   	subc	%l7, -0xbe5, %l4
	.word	0xa6600012	! t0_kref+0x1914:   	subc	%g0, %l2, %l3
	.word	0xa3380012	! t0_kref+0x1918:   	sra	%g0, %l2, %l1
	.word	0xa8980008	! t0_kref+0x191c:   	xorcc	%g0, %o0, %l4
	.word	0x24480002	! t0_kref+0x1920:   	ble,a,pt	%icc, _kref+0x1928
	.word	0xe84e8018	! t0_kref+0x1924:   	ldsb	[%i2 + %i0], %l4
	.word	0xa4fb682d	! t0_kref+0x1928:   	sdivcc	%o5, 0x82d, %l2
	.word	0xd420a030	! t0_kref+0x192c:   	st	%o2, [%g2 + 0x30]
	.word	0x91a01912	! t0_kref+0x1930:   	fitod	%f18, %f8
	.word	0xa07a800c	! t0_kref+0x1934:   	sdiv	%o2, %o4, %l0
	.word	0x95a44d2f	! t0_kref+0x1938:   	fsmuld	%f17, %f15, %f10
	.word	0xa8f28017	! t0_kref+0x193c:   	udivcc	%o2, %l7, %l4
	.word	0xa2927858	! t0_kref+0x1940:   	orcc	%o1, -0x7a8, %l1
	.word	0x001fffff	! t0_kref+0x1944:   	illtrap	0x1fffff
	.word	0xa5400000	! t0_kref+0x1948:   	mov	%y, %l2
	.word	0xe56e6000	! t0_kref+0x194c:   	prefetch	%i1, 18
	.word	0x91a0192e	! t0_kref+0x1950:   	fstod	%f14, %f8
	.word	0xf83e0000	! t0_kref+0x1954:   	std	%i4, [%i0]
	call	SYM(t0_subr2)
	.word	0xe64e7fff	! t0_kref+0x195c:   	ldsb	[%i1 - 1], %l3
	.word	0x81ab8a4e	! t0_kref+0x1960:   	fcmpd	%fcc0, %f14, %f14
	.word	0x99a00536	! t0_kref+0x1964:   	fsqrts	%f22, %f12
	.word	0xd700a010	! t0_kref+0x1968:   	ld	[%g2 + 0x10], %f11
	.word	0xdbf6100b	! t0_kref+0x196c:   	casxa	[%i0]0x80, %o3, %o5
	.word	0xe27e201c	! t0_kref+0x1970:   	swap	[%i0 + 0x1c], %l1
	.word	0xd620a024	! t0_kref+0x1974:   	st	%o3, [%g2 + 0x24]
	.word	0x95a01a4e	! t0_kref+0x1978:   	fdtoi	%f14, %f10
	.word	0xa40a0012	! t0_kref+0x197c:   	and	%o0, %l2, %l2
	.word	0xf36e7ff8	! t0_kref+0x1980:   	prefetch	%i1 - 8, 25
	.word	0x21480008	! t0_kref+0x1984:   	fbn,a,pt	%fcc0, _kref+0x19a4
	.word	0xa1a01a30	! t0_kref+0x1988:   	fstoi	%f16, %f16
	.word	0xe606401c	! t0_kref+0x198c:   	ld	[%i1 + %i4], %l3
	.word	0xa2aa4016	! t0_kref+0x1990:   	andncc	%o1, %l6, %l1
	.word	0xa8a2c008	! t0_kref+0x1994:   	subcc	%o3, %o0, %l4
	.word	0x2902015f	! t0_kref+0x1998:   	sethi	%hi(0x8057c00), %l4
	.word	0xa4228008	! t0_kref+0x199c:   	sub	%o2, %o0, %l2
	.word	0xe2280019	! t0_kref+0x19a0:   	stb	%l1, [%g0 + %i1]
	.word	0xd1be181a	! t0_kref+0x19a4:   	stda	%f8, [%i0 + %i2]0xc0
	.word	0xa80da0d8	! t0_kref+0x19a8:   	and	%l6, 0xd8, %l4
	.word	0xa5a0192f	! t0_kref+0x19ac:   	fstod	%f15, %f18
	.word	0x81ad0a4a	! t0_kref+0x19b0:   	fcmpd	%fcc0, %f20, %f10
	.word	0xa3a3092c	! t0_kref+0x19b4:   	fmuls	%f12, %f12, %f17
	.word	0xfbee101a	! t0_kref+0x19b8:   	prefetcha	%i0 + %i2, 29
	.word	0xff6e401d	! t0_kref+0x19bc:   	prefetch	%i1 + %i5, 31
	.word	0xd82e6011	! t0_kref+0x19c0:   	stb	%o4, [%i1 + 0x11]
	.word	0xa05339d0	! t0_kref+0x19c4:   	umul	%o4, -0x630, %l0
	.word	0x91a409b1	! t0_kref+0x19c8:   	fdivs	%f16, %f17, %f8
	.word	0xab24f92e	! t0_kref+0x19cc:   	mulscc	%l3, -0x6d2, %l5
	.word	0xa932e004	! t0_kref+0x19d0:   	srl	%o3, 0x4, %l4
	.word	0xa8aa400d	! t0_kref+0x19d4:   	andncc	%o1, %o5, %l4
	.word	0xe420a03c	! t0_kref+0x19d8:   	st	%l2, [%g2 + 0x3c]
	.word	0xa9400000	! t0_kref+0x19dc:   	mov	%y, %l4
	.word	0x81acca32	! t0_kref+0x19e0:   	fcmps	%fcc0, %f19, %f18
	.word	0xada01a4c	! t0_kref+0x19e4:   	fdtoi	%f12, %f22
	.word	0xa9a48828	! t0_kref+0x19e8:   	fadds	%f18, %f8, %f20
	.word	0x91a0052a	! t0_kref+0x19ec:   	fsqrts	%f10, %f8
	.word	0xaa12400c	! t0_kref+0x19f0:   	or	%o1, %o4, %l5
	.word	0xa7418000	! t0_kref+0x19f4:   	mov	%fprs, %l3
	.word	0x99a54d2d	! t0_kref+0x19f8:   	fsmuld	%f21, %f13, %f12
	.word	0xe0763ff0	! t0_kref+0x19fc:   	stx	%l0, [%i0 - 0x10]
	.word	0xf428a020	! t0_kref+0x1a00:   	stb	%i2, [%g2 + 0x20]
	.word	0xa0d3603e	! t0_kref+0x1a04:   	umulcc	%o5, 0x3e, %l0
	.word	0xa2e376cc	! t0_kref+0x1a08:   	subccc	%o5, -0x934, %l1
	.word	0xe1ee501a	! t0_kref+0x1a0c:   	prefetcha	%i1 + %i2, 16
	.word	0xe620a010	! t0_kref+0x1a10:   	st	%l3, [%g2 + 0x10]
	.word	0xa5a01034	! t0_kref+0x1a14:   	fstox	%f20, %f18
	.word	0x2c800008	! t0_kref+0x1a18:   	bneg,a	_kref+0x1a38
	.word	0xea7e601c	! t0_kref+0x1a1c:   	swap	[%i1 + 0x1c], %l5
	.word	0xa9a0190e	! t0_kref+0x1a20:   	fitod	%f14, %f20
	.word	0xa626e55f	! t0_kref+0x1a24:   	sub	%i3, 0x55f, %l3
	.word	0x26480003	! t0_kref+0x1a28:   	bl,a,pt	%icc, _kref+0x1a34
	.word	0xa0722d57	! t0_kref+0x1a2c:   	udiv	%o0, 0xd57, %l0
	.word	0xa1a01913	! t0_kref+0x1a30:   	fitod	%f19, %f16
	.word	0xa02c0012	! t0_kref+0x1a34:   	andn	%l0, %l2, %l0
	.word	0xaa7dbcdc	! t0_kref+0x1a38:   	sdiv	%l6, -0x324, %l5
	.word	0xe87e3ff4	! t0_kref+0x1a3c:   	swap	[%i0 - 0xc], %l4
	.word	0xa2e6800b	! t0_kref+0x1a40:   	subccc	%i2, %o3, %l1
	.word	0x9ba00533	! t0_kref+0x1a44:   	fsqrts	%f19, %f13
	.word	0xe120a01c	! t0_kref+0x1a48:   	st	%f16, [%g2 + 0x1c]
	.word	0xa6034011	! t0_kref+0x1a4c:   	add	%o5, %l1, %l3
	.word	0x32480005	! t0_kref+0x1a50:   	bne,a,pt	%icc, _kref+0x1a64
	.word	0xa370000a	! t0_kref+0x1a54:   	popc	%o2, %l1
	.word	0xa02dbba6	! t0_kref+0x1a58:   	andn	%l6, -0x45a, %l0
	.word	0xa73cc016	! t0_kref+0x1a5c:   	sra	%l3, %l6, %l3
	.word	0xd26e601d	! t0_kref+0x1a60:   	ldstub	[%i1 + 0x1d], %o1
	.word	0xd7070018	! t0_kref+0x1a64:   	ld	[%i4 + %i0], %f11
	.word	0x99a00531	! t0_kref+0x1a68:   	fsqrts	%f17, %f12
	.word	0xa6f3001a	! t0_kref+0x1a6c:   	udivcc	%o4, %i2, %l3
	.word	0x81ab8a4c	! t0_kref+0x1a70:   	fcmpd	%fcc0, %f14, %f12
	.word	0xa71c30fb	! t0_kref+0x1a74:   	tsubcctv	%l0, -0xf05, %l3
	.word	0xaae2c012	! t0_kref+0x1a78:   	subccc	%o3, %l2, %l5
	.word	0xe616401b	! t0_kref+0x1a7c:   	lduh	[%i1 + %i3], %l3
	.word	0x30480006	! t0_kref+0x1a80:   	ba,a,pt	%icc, _kref+0x1a98
	.word	0x9fa0052c	! t0_kref+0x1a84:   	fsqrts	%f12, %f15
	.word	0x91a00531	! t0_kref+0x1a88:   	fsqrts	%f17, %f8
	.word	0x36800002	! t0_kref+0x1a8c:   	bge,a	_kref+0x1a94
	.word	0x91a01908	! t0_kref+0x1a90:   	fitod	%f8, %f8
	.word	0xaba01a4a	! t0_kref+0x1a94:   	fdtoi	%f10, %f21
	.word	0x8184c000	! t0_kref+0x1a98:   	wr	%l3, %g0, %y
	.word	0xa6b53443	! t0_kref+0x1a9c:   	orncc	%l4, -0xbbd, %l3
	.word	0xe700a024	! t0_kref+0x1aa0:   	ld	[%g2 + 0x24], %f19
	.word	0xe406601c	! t0_kref+0x1aa4:   	ld	[%i1 + 0x1c], %l2
	.word	0xa3a388a9	! t0_kref+0x1aa8:   	fsubs	%f14, %f9, %f17
	.word	0xa68b401a	! t0_kref+0x1aac:   	andcc	%o5, %i2, %l3
	.word	0xfbee501c	! t0_kref+0x1ab0:   	prefetcha	%i1 + %i4, 29
	.word	0xa6730017	! t0_kref+0x1ab4:   	udiv	%o4, %l7, %l3
	.word	0x9da01936	! t0_kref+0x1ab8:   	fstod	%f22, %f14
	.word	0xada01a4a	! t0_kref+0x1abc:   	fdtoi	%f10, %f22
	.word	0xa5400000	! t0_kref+0x1ac0:   	mov	%y, %l2
	.word	0xa3400000	! t0_kref+0x1ac4:   	mov	%y, %l1
	.word	0xa49eaefd	! t0_kref+0x1ac8:   	xorcc	%i2, 0xefd, %l2
	.word	0x93a4492a	! t0_kref+0x1acc:   	fmuls	%f17, %f10, %f9
	.word	0xa5a0192f	! t0_kref+0x1ad0:   	fstod	%f15, %f18
	.word	0xa524c013	! t0_kref+0x1ad4:   	mulscc	%l3, %l3, %l2
	.word	0xd0680019	! t0_kref+0x1ad8:   	ldstub	[%g0 + %i1], %o0
	.word	0x33480003	! t0_kref+0x1adc:   	fbe,a,pt	%fcc0, _kref+0x1ae8
	.word	0x9fa0012d	! t0_kref+0x1ae0:   	fabss	%f13, %f15
	.word	0xe600a00c	! t0_kref+0x1ae4:   	ld	[%g2 + 0xc], %l3
	.word	0xe6064000	! t0_kref+0x1ae8:   	ld	[%i1], %l3
	.word	0xa612e592	! t0_kref+0x1aec:   	or	%o3, 0x592, %l3
	.word	0xa9a0002a	! t0_kref+0x1af0:   	fmovs	%f10, %f20
	.word	0x9fc10000	! t0_kref+0x1af4:   	call	%g4
	.word	0xd220a000	! t0_kref+0x1af8:   	st	%o1, [%g2]
	.word	0xa3380010	! t0_kref+0x1afc:   	sra	%g0, %l0, %l1
	.word	0xec20623e	! t0_kref+0x1b00:   	st	%l6, [%g1 + 0x23e]
	.word	0xa614acd2	! t0_kref+0x1b04:   	or	%l2, 0xcd2, %l3
	.word	0xec30a032	! t0_kref+0x1b08:   	sth	%l6, [%g2 + 0x32]
	.word	0x27480005	! t0_kref+0x1b0c:   	fbul,a,pt	%fcc0, _kref+0x1b20
	.word	0x95a0190b	! t0_kref+0x1b10:   	fitod	%f11, %f10
	.word	0xd4263fec	! t0_kref+0x1b14:   	st	%o2, [%i0 - 0x14]
	.word	0x9ba28828	! t0_kref+0x1b18:   	fadds	%f10, %f8, %f13
	.word	0x3e480007	! t0_kref+0x1b1c:   	bvc,a,pt	%icc, _kref+0x1b38
	.word	0xe848a000	! t0_kref+0x1b20:   	ldsb	[%g2], %l4
	.word	0x3e800002	! t0_kref+0x1b24:   	bvc,a	_kref+0x1b2c
	.word	0xf9ee501d	! t0_kref+0x1b28:   	prefetcha	%i1 + %i5, 28
	.word	0xaab2b511	! t0_kref+0x1b2c:   	orncc	%o2, -0xaef, %l5
	.word	0xa425a381	! t0_kref+0x1b30:   	sub	%l6, 0x381, %l2
	.word	0xab358012	! t0_kref+0x1b34:   	srl	%l6, %l2, %l5
	.word	0x81da4015	! t0_kref+0x1b38:   	flush	%o1 + %l5
	.word	0x95a0190d	! t0_kref+0x1b3c:   	fitod	%f13, %f10
	.word	0x99a000ab	! t0_kref+0x1b40:   	fnegs	%f11, %f12
	.word	0xa0e20009	! t0_kref+0x1b44:   	subccc	%o0, %o1, %l0
	.word	0xea7e3fe0	! t0_kref+0x1b48:   	swap	[%i0 - 0x20], %l5
	.word	0xd430a000	! t0_kref+0x1b4c:   	sth	%o2, [%g2]
	.word	0xab3d600c	! t0_kref+0x1b50:   	sra	%l5, 0xc, %l5
	.word	0x9de3bfa0	! t0_kref+0x1b54:   	save	%sp, -0x60, %sp
	.word	0xba57401c	! t0_kref+0x1b58:   	umul	%i5, %i4, %i5
	.word	0xabee8018	! t0_kref+0x1b5c:   	restore	%i2, %i0, %l5
	.word	0x25480001	! t0_kref+0x1b60:   	fblg,a,pt	%fcc0, _kref+0x1b64
	.word	0xd01e001d	! t0_kref+0x1b64:   	ldd	[%i0 + %i5], %o0
	.word	0xa1a01908	! t0_kref+0x1b68:   	fitod	%f8, %f16
	.word	0xa73c4016	! t0_kref+0x1b6c:   	sra	%l1, %l6, %l3
	.word	0xe96e6000	! t0_kref+0x1b70:   	prefetch	%i1, 20
	.word	0xe4167ff4	! t0_kref+0x1b74:   	lduh	[%i1 - 0xc], %l2
	.word	0x81d9400d	! t0_kref+0x1b78:   	flush	%g5 + %o5
	.word	0x9ba01a32	! t0_kref+0x1b7c:   	fstoi	%f18, %f13
	.word	0xe630a032	! t0_kref+0x1b80:   	sth	%l3, [%g2 + 0x32]
	.word	0xab32c01b	! t0_kref+0x1b84:   	srl	%o3, %i3, %l5
	.word	0x95a00536	! t0_kref+0x1b88:   	fsqrts	%f22, %f10
	.word	0xada0190f	! t0_kref+0x1b8c:   	fitod	%f15, %f22
	.word	0x28800007	! t0_kref+0x1b90:   	bleu,a	_kref+0x1bac
	.word	0xa6a02d79	! t0_kref+0x1b94:   	subcc	%g0, 0xd79, %l3
	.word	0xa3a44830	! t0_kref+0x1b98:   	fadds	%f17, %f16, %f17
	.word	0x81dd7562	! t0_kref+0x1b9c:   	flush	%l5 - 0xa9e
	.word	0xa460000c	! t0_kref+0x1ba0:   	subc	%g0, %o4, %l2
	.word	0xe4060000	! t0_kref+0x1ba4:   	ld	[%i0], %l2
	.word	0xe24e2016	! t0_kref+0x1ba8:   	ldsb	[%i0 + 0x16], %l1
	.word	0xe44e7ffb	! t0_kref+0x1bac:   	ldsb	[%i1 - 5], %l2
	.word	0xee263fe8	! t0_kref+0x1bb0:   	st	%l7, [%i0 - 0x18]
	call	SYM(t0_subr1)
	.word	0xeb062004	! t0_kref+0x1bb8:   	ld	[%i0 + 4], %f21
	.word	0xa2e68000	! t0_kref+0x1bbc:   	subccc	%i2, %g0, %l1
	.word	0xa865a9f8	! t0_kref+0x1bc0:   	subc	%l6, 0x9f8, %l4
	.word	0x81ad8a4a	! t0_kref+0x1bc4:   	fcmpd	%fcc0, %f22, %f10
	.word	0x99a01929	! t0_kref+0x1bc8:   	fstod	%f9, %f12
	.word	0x91a01931	! t0_kref+0x1bcc:   	fstod	%f17, %f8
	.word	0xa0aac008	! t0_kref+0x1bd0:   	andncc	%o3, %o0, %l0
	.word	0x95a0188a	! t0_kref+0x1bd4:   	fitos	%f10, %f10
	.word	0x8186c000	! t0_kref+0x1bd8:   	wr	%i3, %g0, %y
	.word	0x91a34d2f	! t0_kref+0x1bdc:   	fsmuld	%f13, %f15, %f8
	.word	0x95a548b1	! t0_kref+0x1be0:   	fsubs	%f21, %f17, %f10
	.word	0xa33ce01e	! t0_kref+0x1be4:   	sra	%l3, 0x1e, %l1
	.word	0x81ab4ab6	! t0_kref+0x1be8:   	fcmpes	%fcc0, %f13, %f22
	.word	0xe8380019	! t0_kref+0x1bec:   	std	%l4, [%g0 + %i1]
	.word	0xf7ee501b	! t0_kref+0x1bf0:   	prefetcha	%i1 + %i3, 27
	.word	0xa5a549ae	! t0_kref+0x1bf4:   	fdivs	%f21, %f14, %f18
	.word	0xa9a4cd33	! t0_kref+0x1bf8:   	fsmuld	%f19, %f19, %f20
	.word	0x210ae01e	! t0_kref+0x1bfc:   	sethi	%hi(0x2b807800), %l0
	.word	0xd6ee101a	! t0_kref+0x1c00:   	ldstuba	[%i0 + %i2]0x80, %o3
	.word	0xa132800d	! t0_kref+0x1c04:   	srl	%o2, %o5, %l0
	.word	0x2f480005	! t0_kref+0x1c08:   	fbu,a,pt	%fcc0, _kref+0x1c1c
	.word	0xa852ee04	! t0_kref+0x1c0c:   	umul	%o3, 0xe04, %l4
	.word	0xa9a01a50	! t0_kref+0x1c10:   	fdtoi	%f16, %f20
	.word	0x9fa0108a	! t0_kref+0x1c14:   	fxtos	%f10, %f15
	.word	0x2c480007	! t0_kref+0x1c18:   	bneg,a,pt	%icc, _kref+0x1c34
	.word	0xa1a000b4	! t0_kref+0x1c1c:   	fnegs	%f20, %f16
	.word	0xe408a039	! t0_kref+0x1c20:   	ldub	[%g2 + 0x39], %l2
	.word	0xa85c0008	! t0_kref+0x1c24:   	smul	%l0, %o0, %l4
	.word	0xda262004	! t0_kref+0x1c28:   	st	%o5, [%i0 + 4]
	.word	0xd07f0019	! t0_kref+0x1c2c:   	swap	[%i4 + %i1], %o0
	.word	0xea06001c	! t0_kref+0x1c30:   	ld	[%i0 + %i4], %l5
	.word	0xa2fd4010	! t0_kref+0x1c34:   	sdivcc	%l5, %l0, %l1
	.word	0xe81e001d	! t0_kref+0x1c38:   	ldd	[%i0 + %i5], %l4
	.word	0xa3a01a29	! t0_kref+0x1c3c:   	fstoi	%f9, %f17
	.word	0xea30a01c	! t0_kref+0x1c40:   	sth	%l5, [%g2 + 0x1c]
	.word	0x99a00536	! t0_kref+0x1c44:   	fsqrts	%f22, %f12
	.word	0xa51eb716	! t0_kref+0x1c48:   	tsubcctv	%i2, -0x8ea, %l2
	.word	0xa25aeb8e	! t0_kref+0x1c4c:   	smul	%o3, 0xb8e, %l1
	.word	0xf628a012	! t0_kref+0x1c50:   	stb	%i3, [%g2 + 0x12]
	.word	0xe2562008	! t0_kref+0x1c54:   	ldsh	[%i0 + 8], %l1
	.word	0xa8aa4000	! t0_kref+0x1c58:   	andncc	%o1, %g0, %l4
	.word	0xa465800c	! t0_kref+0x1c5c:   	subc	%l6, %o4, %l2
	.word	0xefee501b	! t0_kref+0x1c60:   	prefetcha	%i1 + %i3, 23
	.word	0xa4e364a8	! t0_kref+0x1c64:   	subccc	%o5, 0x4a8, %l2
	.word	0xe8162018	! t0_kref+0x1c68:   	lduh	[%i0 + 0x18], %l4
	.word	0xa48ec00c	! t0_kref+0x1c6c:   	andcc	%i3, %o4, %l2
	.word	0xa8fceb26	! t0_kref+0x1c70:   	sdivcc	%l3, 0xb26, %l4
	.word	0xa522c016	! t0_kref+0x1c74:   	mulscc	%o3, %l6, %l2
	.word	0xa622624e	! t0_kref+0x1c78:   	sub	%o1, 0x24e, %l3
	.word	0x97a0052b	! t0_kref+0x1c7c:   	fsqrts	%f11, %f11
	.word	0x33480008	! t0_kref+0x1c80:   	fbe,a,pt	%fcc0, _kref+0x1ca0
	.word	0xed68a00b	! t0_kref+0x1c84:   	prefetch	%g2 + 0xb, 22
	.word	0xeb20a020	! t0_kref+0x1c88:   	st	%f21, [%g2 + 0x20]
	.word	0x3a480006	! t0_kref+0x1c8c:   	bcc,a,pt	%icc, _kref+0x1ca4
	.word	0xa2120017	! t0_kref+0x1c90:   	or	%o0, %l7, %l1
	.word	0xa3a0012f	! t0_kref+0x1c94:   	fabss	%f15, %f17
	.word	0x34480008	! t0_kref+0x1c98:   	bg,a,pt	%icc, _kref+0x1cb8
	.word	0xa122b268	! t0_kref+0x1c9c:   	mulscc	%o2, -0xd98, %l0
	.word	0xa29c0011	! t0_kref+0x1ca0:   	xorcc	%l0, %l1, %l1
	.word	0xe040a034	! t0_kref+0x1ca4:   	ldsw	[%g2 + 0x34], %l0
	.word	0xe1be1a1a	! t0_kref+0x1ca8:   	stda	%f16, [%i0 + %i2]0xd0
	.word	0x2715ec8e	! t0_kref+0x1cac:   	sethi	%hi(0x57b23800), %l3
	.word	0xa092801a	! t0_kref+0x1cb0:   	orcc	%o2, %i2, %l0
	.word	0xa69b2b18	! t0_kref+0x1cb4:   	xorcc	%o4, 0xb18, %l3
	.word	0xd87e6010	! t0_kref+0x1cb8:   	swap	[%i1 + 0x10], %o4
	.word	0xec20a034	! t0_kref+0x1cbc:   	st	%l6, [%g2 + 0x34]
	.word	0x81ac4ab0	! t0_kref+0x1cc0:   	fcmpes	%fcc0, %f17, %f16
	.word	0x32480003	! t0_kref+0x1cc4:   	bne,a,pt	%icc, _kref+0x1cd0
	.word	0xd230a02a	! t0_kref+0x1cc8:   	sth	%o1, [%g2 + 0x2a]
	.word	0x95a409cc	! t0_kref+0x1ccc:   	fdivd	%f16, %f12, %f10
	.word	0xa424a824	! t0_kref+0x1cd0:   	sub	%l2, 0x824, %l2
	.word	0xa1a01a4c	! t0_kref+0x1cd4:   	fdtoi	%f12, %f16
	.word	0xa9248012	! t0_kref+0x1cd8:   	mulscc	%l2, %l2, %l4
	.word	0xd46e601d	! t0_kref+0x1cdc:   	ldstub	[%i1 + 0x1d], %o2
	.word	0xab1eb59c	! t0_kref+0x1ce0:   	tsubcctv	%i2, -0xa64, %l5
	.word	0x9fa01a34	! t0_kref+0x1ce4:   	fstoi	%f20, %f15
	.word	0x24480004	! t0_kref+0x1ce8:   	ble,a,pt	%icc, _kref+0x1cf8
	.word	0xa29ebc3b	! t0_kref+0x1cec:   	xorcc	%i2, -0x3c5, %l1
	.word	0xf36e001c	! t0_kref+0x1cf0:   	prefetch	%i0 + %i4, 25
	.word	0xa1a00534	! t0_kref+0x1cf4:   	fsqrts	%f20, %f16
	.word	0xa5268014	! t0_kref+0x1cf8:   	mulscc	%i2, %l4, %l2
	.word	0x2c480005	! t0_kref+0x1cfc:   	bneg,a,pt	%icc, _kref+0x1d10
	.word	0xa262a0a5	! t0_kref+0x1d00:   	subc	%o2, 0xa5, %l1
	.word	0x32480007	! t0_kref+0x1d04:   	bne,a,pt	%icc, _kref+0x1d20
	.word	0xa254f7da	! t0_kref+0x1d08:   	umul	%l3, -0x826, %l1
	.word	0xa45c8011	! t0_kref+0x1d0c:   	smul	%l2, %l1, %l2
	.word	0xada01912	! t0_kref+0x1d10:   	fitod	%f18, %f22
	.word	0xd030a038	! t0_kref+0x1d14:   	sth	%o0, [%g2 + 0x38]
	.word	0x36800004	! t0_kref+0x1d18:   	bge,a	_kref+0x1d28
	.word	0xa71d3014	! t0_kref+0x1d1c:   	tsubcctv	%l4, -0xfec, %l3
	.word	0xa0b34011	! t0_kref+0x1d20:   	orncc	%o5, %l1, %l0
	.word	0xa45c0015	! t0_kref+0x1d24:   	smul	%l0, %l5, %l2
	.word	0xa2f439ee	! t0_kref+0x1d28:   	udivcc	%l0, -0x612, %l1
	.word	0xd86e6000	! t0_kref+0x1d2c:   	ldstub	[%i1], %o4
	.word	0x97a0188a	! t0_kref+0x1d30:   	fitos	%f10, %f11
	.word	0xe2780019	! t0_kref+0x1d34:   	swap	[%g0 + %i1], %l1
	.word	0x9fc10000	! t0_kref+0x1d38:   	call	%g4
	.word	0xaad0328e	! t0_kref+0x1d3c:   	umulcc	%g0, -0xd72, %l5
	.word	0x32800003	! t0_kref+0x1d40:   	bne,a	_kref+0x1d4c
	.word	0xd46e0000	! t0_kref+0x1d44:   	ldstub	[%i0], %o2
	.word	0xdd1fbd60	! t0_kref+0x1d48:   	ldd	[%fp - 0x2a0], %f14
	.word	0x001fffff	! t0_kref+0x1d4c:   	illtrap	0x1fffff
	.word	0xe81e6010	! t0_kref+0x1d50:   	ldd	[%i1 + 0x10], %l4
	.word	0xd91f4019	! t0_kref+0x1d54:   	ldd	[%i5 + %i1], %f12
	.word	0x95a54d2d	! t0_kref+0x1d58:   	fsmuld	%f21, %f13, %f10
	.word	0xa63a7648	! t0_kref+0x1d5c:   	xnor	%o1, -0x9b8, %l3
	.word	0xaad43ae1	! t0_kref+0x1d60:   	umulcc	%l0, -0x51f, %l5
	.word	0xa1a01908	! t0_kref+0x1d64:   	fitod	%f8, %f16
	.word	0x31480005	! t0_kref+0x1d68:   	fba,a,pt	%fcc0, _kref+0x1d7c
	.word	0xa2268014	! t0_kref+0x1d6c:   	sub	%i2, %l4, %l1
	.word	0xe016001b	! t0_kref+0x1d70:   	lduh	[%i0 + %i3], %l0
	.word	0xa4d523b8	! t0_kref+0x1d74:   	umulcc	%l4, 0x3b8, %l2
	.word	0xa1334016	! t0_kref+0x1d78:   	srl	%o5, %l6, %l0
	.word	0x99a01889	! t0_kref+0x1d7c:   	fitos	%f9, %f12
	.word	0x81dbc010	! t0_kref+0x1d80:   	flush	%o7 + %l0
	.word	0xe2000018	! t0_kref+0x1d84:   	ld	[%g0 + %i0], %l1
	.word	0xe630a008	! t0_kref+0x1d88:   	sth	%l3, [%g2 + 8]
	.word	0x2d480002	! t0_kref+0x1d8c:   	fbg,a,pt	%fcc0, _kref+0x1d94
	.word	0xe46e601a	! t0_kref+0x1d90:   	ldstub	[%i1 + 0x1a], %l2
	.word	0x95a3c832	! t0_kref+0x1d94:   	fadds	%f15, %f18, %f10
	.word	0x99a01888	! t0_kref+0x1d98:   	fitos	%f8, %f12
	.word	0xd87e4000	! t0_kref+0x1d9c:   	swap	[%i1], %o4
	.word	0x32800005	! t0_kref+0x1da0:   	bne,a	_kref+0x1db4
	.word	0xa73da00e	! t0_kref+0x1da4:   	sra	%l6, 0xe, %l3
	.word	0xa3400000	! t0_kref+0x1da8:   	mov	%y, %l1
	.word	0xa47c800d	! t0_kref+0x1dac:   	sdiv	%l2, %o5, %l2
	.word	0xada00136	! t0_kref+0x1db0:   	fabss	%f22, %f22
	.word	0xa733000c	! t0_kref+0x1db4:   	srl	%o4, %o4, %l3
	.word	0xe4067fec	! t0_kref+0x1db8:   	ld	[%i1 - 0x14], %l2
	.word	0xe81e6008	! t0_kref+0x1dbc:   	ldd	[%i1 + 8], %l4
	.word	0xab702793	! t0_kref+0x1dc0:   	popc	0x793, %l5
	.word	0xe0163fec	! t0_kref+0x1dc4:   	lduh	[%i0 - 0x14], %l0
	.word	0x91a2cd30	! t0_kref+0x1dc8:   	fsmuld	%f11, %f16, %f8
	.word	0x91a0052b	! t0_kref+0x1dcc:   	fsqrts	%f11, %f8
	.word	0x9de3bfa0	! t0_kref+0x1dd0:   	save	%sp, -0x60, %sp
	.word	0xb05e001a	! t0_kref+0x1dd4:   	smul	%i0, %i2, %i0
	.word	0xabeec018	! t0_kref+0x1dd8:   	restore	%i3, %i0, %l5
	.word	0xdf20a034	! t0_kref+0x1ddc:   	st	%f15, [%g2 + 0x34]
	.word	0xa8240016	! t0_kref+0x1de0:   	sub	%l0, %l6, %l4
	.word	0x2f480002	! t0_kref+0x1de4:   	fbu,a,pt	%fcc0, _kref+0x1dec
	.word	0xa52ee018	! t0_kref+0x1de8:   	sll	%i3, 0x18, %l2
	.word	0xa9344015	! t0_kref+0x1dec:   	srl	%l1, %l5, %l4
	.word	0xa45ea86e	! t0_kref+0x1df0:   	smul	%i2, 0x86e, %l2
	.word	0xd100a03c	! t0_kref+0x1df4:   	ld	[%g2 + 0x3c], %f8
	.word	0xda20a004	! t0_kref+0x1df8:   	st	%o5, [%g2 + 4]
	.word	0xc1ee500b	! t0_kref+0x1dfc:   	prefetcha	%i1 + %o3, 0
	.word	0x99a01908	! t0_kref+0x1e00:   	fitod	%f8, %f12
	.word	0xe0167ff2	! t0_kref+0x1e04:   	lduh	[%i1 - 0xe], %l0
	.word	0xa1a00534	! t0_kref+0x1e08:   	fsqrts	%f20, %f16
	.word	0xe60e3fe9	! t0_kref+0x1e0c:   	ldub	[%i0 - 0x17], %l3
	.word	0x2a800001	! t0_kref+0x1e10:   	bcs,a	_kref+0x1e14
	.word	0xa25dfc65	! t0_kref+0x1e14:   	smul	%l7, -0x39b, %l1
	.word	0xe8563ffc	! t0_kref+0x1e18:   	ldsh	[%i0 - 4], %l4
	.word	0xe9e65013	! t0_kref+0x1e1c:   	casa	[%i1]0x80, %l3, %l4
	.word	0xa8750012	! t0_kref+0x1e20:   	udiv	%l4, %l2, %l4
	.word	0xa6b6c013	! t0_kref+0x1e24:   	orncc	%i3, %l3, %l3
	.word	0xf96e001b	! t0_kref+0x1e28:   	prefetch	%i0 + %i3, 28
	.word	0x93a01a50	! t0_kref+0x1e2c:   	fdtoi	%f16, %f9
	.word	0xe820a02c	! t0_kref+0x1e30:   	st	%l4, [%g2 + 0x2c]
	.word	0x81854000	! t0_kref+0x1e34:   	wr	%l5, %g0, %y
	.word	0xa85a0012	! t0_kref+0x1e38:   	smul	%o0, %l2, %l4
	.word	0xd0763ff8	! t0_kref+0x1e3c:   	stx	%o0, [%i0 - 8]
	.word	0x22800003	! t0_kref+0x1e40:   	be,a	_kref+0x1e4c
	.word	0xaa5cc000	! t0_kref+0x1e44:   	smul	%l3, %g0, %l5
	.word	0xaabe800d	! t0_kref+0x1e48:   	xnorcc	%i2, %o5, %l5
	.word	0xd230a010	! t0_kref+0x1e4c:   	sth	%o1, [%g2 + 0x10]
	.word	0xed067ff4	! t0_kref+0x1e50:   	ld	[%i1 - 0xc], %f22
	.word	0xe87e4000	! t0_kref+0x1e54:   	swap	[%i1], %l4
	.word	0x2b480003	! t0_kref+0x1e58:   	fbug,a,pt	%fcc0, _kref+0x1e64
	.word	0xe408a033	! t0_kref+0x1e5c:   	ldub	[%g2 + 0x33], %l2
	.word	0xe4563fea	! t0_kref+0x1e60:   	ldsh	[%i0 - 0x16], %l2
	.word	0x81dfbb3d	! t0_kref+0x1e64:   	flush	%fp - 0x4c3
	.word	0xa6ac0000	! t0_kref+0x1e68:   	andncc	%l0, %g0, %l3
	.word	0xada000d4	! t0_kref+0x1e6c:   	fnegd	%f20, %f22
	.word	0xa256c00c	! t0_kref+0x1e70:   	umul	%i3, %o4, %l1
	.word	0xf628a014	! t0_kref+0x1e74:   	stb	%i3, [%g2 + 0x14]
	.word	0x81df001d	! t0_kref+0x1e78:   	flush	%i4 + %i5
	.word	0xe640a018	! t0_kref+0x1e7c:   	ldsw	[%g2 + 0x18], %l3
	.word	0xa40d6e58	! t0_kref+0x1e80:   	and	%l5, 0xe58, %l2
	.word	0x33480004	! t0_kref+0x1e84:   	fbe,a,pt	%fcc0, _kref+0x1e94
	.word	0xa866f288	! t0_kref+0x1e88:   	subc	%i3, -0xd78, %l4
	.word	0x95a5892c	! t0_kref+0x1e8c:   	fmuls	%f22, %f12, %f10
	.word	0xf5ee501c	! t0_kref+0x1e90:   	prefetcha	%i1 + %i4, 26
	.word	0xd9bf5a59	! t0_kref+0x1e94:   	stda	%f12, [%i5 + %i1]0xd2
	.word	0xa5a5892e	! t0_kref+0x1e98:   	fmuls	%f22, %f14, %f18
	.word	0xa0a429a4	! t0_kref+0x1e9c:   	subcc	%l0, 0x9a4, %l0
	.word	0xa124fd7e	! t0_kref+0x1ea0:   	mulscc	%l3, -0x282, %l0
	.word	0xaa75c00a	! t0_kref+0x1ea4:   	udiv	%l7, %o2, %l5
	.word	0xa80dad09	! t0_kref+0x1ea8:   	and	%l6, 0xd09, %l4
	.word	0xa5a0012d	! t0_kref+0x1eac:   	fabss	%f13, %f18
	.word	0xa8b2400c	! t0_kref+0x1eb0:   	orncc	%o1, %o4, %l4
	.word	0xdf00a01c	! t0_kref+0x1eb4:   	ld	[%g2 + 0x1c], %f15
	.word	0xdb00a000	! t0_kref+0x1eb8:   	ld	[%g2], %f13
	.word	0xa8a44015	! t0_kref+0x1ebc:   	subcc	%l1, %l5, %l4
	.word	0xd828a031	! t0_kref+0x1ec0:   	stb	%o4, [%g2 + 0x31]
	.word	0xc06e4000	! t0_kref+0x1ec4:   	ldstub	[%i1], %g0
	.word	0x8143e040	! t0_kref+0x1ec8:   	membar	0x40
	.word	0xe230a012	! t0_kref+0x1ecc:   	sth	%l1, [%g2 + 0x12]
	.word	0xea160000	! t0_kref+0x1ed0:   	lduh	[%i0], %l5
	.word	0xa85a3b4c	! t0_kref+0x1ed4:   	smul	%o0, -0x4b4, %l4
	.word	0xaae5801a	! t0_kref+0x1ed8:   	subccc	%l6, %i2, %l5
	.word	0xa29b2ffc	! t0_kref+0x1edc:   	xorcc	%o4, 0xffc, %l1
	.word	0xa80cc009	! t0_kref+0x1ee0:   	and	%l3, %o1, %l4
	.word	0x26480003	! t0_kref+0x1ee4:   	bl,a,pt	%icc, _kref+0x1ef0
	.word	0xa29539cf	! t0_kref+0x1ee8:   	orcc	%l4, -0x631, %l1
	.word	0x95a389d6	! t0_kref+0x1eec:   	fdivd	%f14, %f22, %f10
	.word	0xaa2ea32c	! t0_kref+0x1ef0:   	andn	%i2, 0x32c, %l5
	.word	0x97a00535	! t0_kref+0x1ef4:   	fsqrts	%f21, %f11
	.word	0x99a5092c	! t0_kref+0x1ef8:   	fmuls	%f20, %f12, %f12
	.word	0xa3400000	! t0_kref+0x1efc:   	mov	%y, %l1
	.word	0xa49d4009	! t0_kref+0x1f00:   	xorcc	%l5, %o1, %l2
	.word	0xa2d2ea7e	! t0_kref+0x1f04:   	umulcc	%o3, 0xa7e, %l1
	.word	0x9ba018d4	! t0_kref+0x1f08:   	fdtos	%f20, %f13
	.word	0x29480007	! t0_kref+0x1f0c:   	fbl,a,pt	%fcc0, _kref+0x1f28
	.word	0x2b3a55bb	! t0_kref+0x1f10:   	sethi	%hi(0xe956ec00), %l5
	.word	0xaba01a54	! t0_kref+0x1f14:   	fdtoi	%f20, %f21
	.word	0x2e800003	! t0_kref+0x1f18:   	bvs,a	_kref+0x1f24
	.word	0xe86e8019	! t0_kref+0x1f1c:   	ldstub	[%i2 + %i1], %l4
	.word	0x293f65fc	! t0_kref+0x1f20:   	sethi	%hi(0xfd97f000), %l4
	.word	0xa5400000	! t0_kref+0x1f24:   	mov	%y, %l2
	.word	0xa37036ca	! t0_kref+0x1f28:   	popc	-0x936, %l1
	.word	0x26800004	! t0_kref+0x1f2c:   	bl,a	_kref+0x1f3c
	.word	0xe26e2009	! t0_kref+0x1f30:   	ldstub	[%i0 + 9], %l1
	.word	0x81d8791d	! t0_kref+0x1f34:   	flush	%g1 - 0x6e3
	.word	0x34800002	! t0_kref+0x1f38:   	bg,a	_kref+0x1f40
	.word	0xd59f5019	! t0_kref+0x1f3c:   	ldda	[%i5 + %i1]0x80, %f10
	.word	0xe016c018	! t0_kref+0x1f40:   	lduh	[%i3 + %i0], %l0
	.word	0xeb865000	! t0_kref+0x1f44:   	lda	[%i1]0x80, %f21
	.word	0xa026c00d	! t0_kref+0x1f48:   	sub	%i3, %o5, %l0
	.word	0xa7ab4036	! t0_kref+0x1f4c:   	fmovsle	%fcc0, %f22, %f19
	.word	0x34800007	! t0_kref+0x1f50:   	bg,a	_kref+0x1f6c
	.word	0xe420a038	! t0_kref+0x1f54:   	st	%l2, [%g2 + 0x38]
	.word	0xa7400000	! t0_kref+0x1f58:   	mov	%y, %l3
	.word	0xab408000	! t0_kref+0x1f5c:   	mov	%ccr, %l5
	.word	0x9da209b5	! t0_kref+0x1f60:   	fdivs	%f8, %f21, %f14
	.word	0x37480005	! t0_kref+0x1f64:   	fbge,a,pt	%fcc0, _kref+0x1f78
	.word	0xd66e8019	! t0_kref+0x1f68:   	ldstub	[%i2 + %i1], %o3
	.word	0xdb263ffc	! t0_kref+0x1f6c:   	st	%f13, [%i0 - 4]
	.word	0x81aa8a2a	! t0_kref+0x1f70:   	fcmps	%fcc0, %f10, %f10
	.word	0x001fffff	! t0_kref+0x1f74:   	illtrap	0x1fffff
	.word	0xaae4ad19	! t0_kref+0x1f78:   	subccc	%l2, 0xd19, %l5
	.word	0xe0c81018	! t0_kref+0x1f7c:   	ldsba	[%g0 + %i0]0x80, %l0
	.word	0xa223671a	! t0_kref+0x1f80:   	sub	%o5, 0x71a, %l1
	.word	0x91a50d32	! t0_kref+0x1f84:   	fsmuld	%f20, %f18, %f8
	.word	0xe51f4019	! t0_kref+0x1f88:   	ldd	[%i5 + %i1], %f18
	.word	0xe9be581b	! t0_kref+0x1f8c:   	stda	%f20, [%i1 + %i3]0xc0
	.word	0xaab53ae9	! t0_kref+0x1f90:   	orncc	%l4, -0x517, %l5
	.word	0xaba000b6	! t0_kref+0x1f94:   	fnegs	%f22, %f21
	.word	0xf6267ff8	! t0_kref+0x1f98:   	st	%i3, [%i1 - 8]
	.word	0x25480002	! t0_kref+0x1f9c:   	fblg,a,pt	%fcc0, _kref+0x1fa4
	.word	0xc06e6014	! t0_kref+0x1fa0:   	ldstub	[%i1 + 0x14], %g0
	.word	0x81aa0a48	! t0_kref+0x1fa4:   	fcmpd	%fcc0, %f8, %f8
	.word	0x9da00533	! t0_kref+0x1fa8:   	fsqrts	%f19, %f14
	.word	0xada01a50	! t0_kref+0x1fac:   	fdtoi	%f16, %f22
	.word	0xd2263ff4	! t0_kref+0x1fb0:   	st	%o1, [%i0 - 0xc]
	.word	0x32480004	! t0_kref+0x1fb4:   	bne,a,pt	%icc, _kref+0x1fc4
	.word	0xd1000018	! t0_kref+0x1fb8:   	ld	[%g0 + %i0], %f8
	.word	0xe1070019	! t0_kref+0x1fbc:   	ld	[%i4 + %i1], %f16
	.word	0xaba01a54	! t0_kref+0x1fc0:   	fdtoi	%f20, %f21
	.word	0xa1a0012a	! t0_kref+0x1fc4:   	fabss	%f10, %f16
	.word	0xa6444012	! t0_kref+0x1fc8:   	addc	%l1, %l2, %l3
	.word	0xaa55b471	! t0_kref+0x1fcc:   	umul	%l6, -0xb8f, %l5
	.word	0xd220a02c	! t0_kref+0x1fd0:   	st	%o1, [%g2 + 0x2c]
	.word	0xa07aeb8d	! t0_kref+0x1fd4:   	sdiv	%o3, 0xb8d, %l0
	.word	0xa274efc8	! t0_kref+0x1fd8:   	udiv	%l3, 0xfc8, %l1
	.word	0x3c480004	! t0_kref+0x1fdc:   	bpos,a,pt	%icc, _kref+0x1fec
	.word	0xd620a034	! t0_kref+0x1fe0:   	st	%o3, [%g2 + 0x34]
	.word	0x81dbc014	! t0_kref+0x1fe4:   	flush	%o7 + %l4
	.word	0xee6e401a	! t0_kref+0x1fe8:   	ldstub	[%i1 + %i2], %l7
	.word	0x20480003	! t0_kref+0x1fec:   	bn,a,pt	%icc, _kref+0x1ff8
	.word	0xe628a031	! t0_kref+0x1ff0:   	stb	%l3, [%g2 + 0x31]
	.word	0xada00534	! t0_kref+0x1ff4:   	fsqrts	%f20, %f22
	.word	0x81aa0ab4	! t0_kref+0x1ff8:   	fcmpes	%fcc0, %f8, %f20
	.word	0xe2d6d019	! t0_kref+0x1ffc:   	ldsha	[%i3 + %i1]0x80, %l1
	.word	0xa266801b	! t0_kref+0x2000:   	subc	%i2, %i3, %l1
	.word	0xec28a024	! t0_kref+0x2004:   	stb	%l6, [%g2 + 0x24]
	.word	0xd1be1815	! t0_kref+0x2008:   	stda	%f8, [%i0 + %l5]0xc0
	.word	0xa325e6b4	! t0_kref+0x200c:   	mulscc	%l7, 0x6b4, %l1
	.word	0x9ba0052d	! t0_kref+0x2010:   	fsqrts	%f13, %f13
	.word	0x9fa01a31	! t0_kref+0x2014:   	fstoi	%f17, %f15
	.word	0xe00e7fe5	! t0_kref+0x2018:   	ldub	[%i1 - 0x1b], %l0
	.word	0xe4166002	! t0_kref+0x201c:   	lduh	[%i1 + 2], %l2
	.word	0xe700a01c	! t0_kref+0x2020:   	ld	[%g2 + 0x1c], %f19
	.word	0xaa730010	! t0_kref+0x2024:   	udiv	%o4, %l0, %l5
	.word	0xa23d000c	! t0_kref+0x2028:   	xnor	%l4, %o4, %l1
	.word	0xe1270019	! t0_kref+0x202c:   	st	%f16, [%i4 + %i1]
	.word	0xe27e7ff4	! t0_kref+0x2030:   	swap	[%i1 - 0xc], %l1
	.word	0xd926401c	! t0_kref+0x2034:   	st	%f12, [%i1 + %i4]
	.word	0xa89d800d	! t0_kref+0x2038:   	xorcc	%l6, %o5, %l4
	.word	0xa4d4ebf7	! t0_kref+0x203c:   	umulcc	%l3, 0xbf7, %l2
	.word	0xa92c601a	! t0_kref+0x2040:   	sll	%l1, 0x1a, %l4
	.word	0x9fa000a9	! t0_kref+0x2044:   	fnegs	%f9, %f15
	.word	0xe648a01e	! t0_kref+0x2048:   	ldsb	[%g2 + 0x1e], %l3
	.word	0xe06e3ff9	! t0_kref+0x204c:   	ldstub	[%i0 - 7], %l0
	.word	0xe030a028	! t0_kref+0x2050:   	sth	%l0, [%g2 + 0x28]
	.word	0x99a00528	! t0_kref+0x2054:   	fsqrts	%f8, %f12
	.word	0xa7a01a33	! t0_kref+0x2058:   	fstoi	%f19, %f19
	.word	0xa8fde5a5	! t0_kref+0x205c:   	sdivcc	%l7, 0x5a5, %l4
	.word	0xa0b2eb4b	! t0_kref+0x2060:   	orncc	%o3, 0xb4b, %l0
	.word	0xea260000	! t0_kref+0x2064:   	st	%l5, [%i0]
	.word	0xea162012	! t0_kref+0x2068:   	lduh	[%i0 + 0x12], %l5
	.word	0xa1a30d2e	! t0_kref+0x206c:   	fsmuld	%f12, %f14, %f16
	.word	0x9de3bfa0	! t0_kref+0x2070:   	save	%sp, -0x60, %sp
	.word	0xa7eef776	! t0_kref+0x2074:   	restore	%i3, -0x88a, %l3
	.word	0xe5266004	! t0_kref+0x2078:   	st	%f18, [%i1 + 4]
	.word	0xe53e3ff0	! t0_kref+0x207c:   	std	%f18, [%i0 - 0x10]
	.word	0x2d480006	! t0_kref+0x2080:   	fbg,a,pt	%fcc0, _kref+0x2098
	.word	0xaa620011	! t0_kref+0x2084:   	subc	%o0, %l1, %l5
	.word	0x81aa8a4a	! t0_kref+0x2088:   	fcmpd	%fcc0, %f10, %f10
	.word	0x81ad8a35	! t0_kref+0x208c:   	fcmps	%fcc0, %f22, %f21
	.word	0x99a44d28	! t0_kref+0x2090:   	fsmuld	%f17, %f8, %f12
	.word	0xdd20a028	! t0_kref+0x2094:   	st	%f14, [%g2 + 0x28]
	.word	0xaa2b0011	! t0_kref+0x2098:   	andn	%o4, %l1, %l5
	.word	0xe76e401d	! t0_kref+0x209c:   	prefetch	%i1 + %i5, 19
	.word	0xa9a01a54	! t0_kref+0x20a0:   	fdtoi	%f20, %f20
	.word	0xa4aec00a	! t0_kref+0x20a4:   	andncc	%i3, %o2, %l2
	.word	0xc1ee5014	! t0_kref+0x20a8:   	prefetcha	%i1 + %l4, 0
	.word	0xa47b0017	! t0_kref+0x20ac:   	sdiv	%o4, %l7, %l2
	.word	0xa6e6800c	! t0_kref+0x20b0:   	subccc	%i2, %o4, %l3
	.word	0xee7e4000	! t0_kref+0x20b4:   	swap	[%i1], %l7
	.word	0x39480001	! t0_kref+0x20b8:   	fbuge,a,pt	%fcc0, _kref+0x20bc
	.word	0xe64e3ff8	! t0_kref+0x20bc:   	ldsb	[%i0 - 8], %l3
	.word	0xa1a0052e	! t0_kref+0x20c0:   	fsqrts	%f14, %f16
	.word	0x81ad4ab5	! t0_kref+0x20c4:   	fcmpes	%fcc0, %f21, %f21
	.word	0xd7067fec	! t0_kref+0x20c8:   	ld	[%i1 - 0x14], %f11
	.word	0x30480006	! t0_kref+0x20cc:   	ba,a,pt	%icc, _kref+0x20e4
	.word	0xaa9b4009	! t0_kref+0x20d0:   	xorcc	%o5, %o1, %l5
	.word	0x26480005	! t0_kref+0x20d4:   	bl,a,pt	%icc, _kref+0x20e8
	.word	0xd028a017	! t0_kref+0x20d8:   	stb	%o0, [%g2 + 0x17]
	.word	0xab2c6003	! t0_kref+0x20dc:   	sll	%l1, 0x3, %l5
	.word	0x32800003	! t0_kref+0x20e0:   	bne,a	_kref+0x20ec
	.word	0xd3262010	! t0_kref+0x20e4:   	st	%f9, [%i0 + 0x10]
	.word	0xa875c00a	! t0_kref+0x20e8:   	udiv	%l7, %o2, %l4
	.word	0xa73ec015	! t0_kref+0x20ec:   	sra	%i3, %l5, %l3
	.word	0xa93da00a	! t0_kref+0x20f0:   	sra	%l6, 0xa, %l4
	.word	0xa92de006	! t0_kref+0x20f4:   	sll	%l7, 0x6, %l4
	.word	0xe2ce1000	! t0_kref+0x20f8:   	ldsba	[%i0]0x80, %l1
	.word	0x81dc801b	! t0_kref+0x20fc:   	flush	%l2 + %i3
	.word	0xa1124008	! t0_kref+0x2100:   	taddcctv	%o1, %o0, %l0
	.word	0xa0d6a192	! t0_kref+0x2104:   	umulcc	%i2, 0x192, %l0
	.word	0x21480003	! t0_kref+0x2108:   	fbn,a,pt	%fcc0, _kref+0x2114
	.word	0xa62d8012	! t0_kref+0x210c:   	andn	%l6, %l2, %l3
	.word	0x81ab8ab4	! t0_kref+0x2110:   	fcmpes	%fcc0, %f14, %f20
	.word	0x97a2c9b0	! t0_kref+0x2114:   	fdivs	%f11, %f16, %f11
	.word	0x81da801b	! t0_kref+0x2118:   	flush	%o2 + %i3
	.word	0xa2634011	! t0_kref+0x211c:   	subc	%o5, %l1, %l1
	.word	0xa3ab4034	! t0_kref+0x2120:   	fmovsle	%fcc0, %f20, %f17
	.word	0x81da6e02	! t0_kref+0x2124:   	flush	%o1 + 0xe02
	.word	0xaaba400a	! t0_kref+0x2128:   	xnorcc	%o1, %o2, %l5
	.word	0xaa5cfafd	! t0_kref+0x212c:   	smul	%l3, -0x503, %l5
	.word	0xa724b476	! t0_kref+0x2130:   	mulscc	%l2, -0xb8a, %l3
	.word	0x29480001	! t0_kref+0x2134:   	fbl,a,pt	%fcc0, _kref+0x2138
	.word	0xa40a400c	! t0_kref+0x2138:   	and	%o1, %o4, %l2
	.word	0xeb00a010	! t0_kref+0x213c:   	ld	[%g2 + 0x10], %f21
	.word	0x9ba0052c	! t0_kref+0x2140:   	fsqrts	%f12, %f13
	.word	0x81ab8a2a	! t0_kref+0x2144:   	fcmps	%fcc0, %f14, %f10
	.word	0xa422eb71	! t0_kref+0x2148:   	sub	%o3, 0xb71, %l2
	.word	0xaa5aa511	! t0_kref+0x214c:   	smul	%o2, 0x511, %l5
	.word	0xa922b99c	! t0_kref+0x2150:   	mulscc	%o2, -0x664, %l4
	.word	0xe448a01b	! t0_kref+0x2154:   	ldsb	[%g2 + 0x1b], %l2
	.word	0xc368a08a	! t0_kref+0x2158:   	prefetch	%g2 + 0x8a, 1
	.word	0xaa64800d	! t0_kref+0x215c:   	subc	%l2, %o5, %l5
	.word	0xe80e0000	! t0_kref+0x2160:   	ldub	[%i0], %l4
	.word	0xeeee1000	! t0_kref+0x2164:   	ldstuba	[%i0]0x80, %l7
	.word	0xa056c014	! t0_kref+0x2168:   	umul	%i3, %l4, %l0
	.word	0xea96d019	! t0_kref+0x216c:   	lduha	[%i3 + %i1]0x80, %l5
	.word	0xa254374a	! t0_kref+0x2170:   	umul	%l0, -0x8b6, %l1
	.word	0xada3cd33	! t0_kref+0x2174:   	fsmuld	%f15, %f19, %f22
	.word	0x9ba01a56	! t0_kref+0x2178:   	fdtoi	%f22, %f13
	.word	0xa2d37be6	! t0_kref+0x217c:   	umulcc	%o5, -0x41a, %l1
	.word	0xa8aa801b	! t0_kref+0x2180:   	andncc	%o2, %i3, %l4
	.word	0xe84e201a	! t0_kref+0x2184:   	ldsb	[%i0 + 0x1a], %l4
	.word	0xa1a01a48	! t0_kref+0x2188:   	fdtoi	%f8, %f16
	.word	0x3c480001	! t0_kref+0x218c:   	bpos,a,pt	%icc, _kref+0x2190
	.word	0xa20d328d	! t0_kref+0x2190:   	and	%l4, -0xd73, %l1
	.word	0xa8e58012	! t0_kref+0x2194:   	subccc	%l6, %l2, %l4
	.word	0xe25e401d	! t0_kref+0x2198:   	ldx	[%i1 + %i5], %l1
	.word	0xa2e5c014	! t0_kref+0x219c:   	subccc	%l7, %l4, %l1
	.word	0xa52ee019	! t0_kref+0x21a0:   	sll	%i3, 0x19, %l2
	.word	0x20480008	! t0_kref+0x21a4:   	bn,a,pt	%icc, _kref+0x21c4
	.word	0xd9be588a	! t0_kref+0x21a8:   	stda	%f12, [%i1 + %o2]0xc4
	.word	0xea0e001a	! t0_kref+0x21ac:   	ldub	[%i0 + %i2], %l5
	.word	0xea06601c	! t0_kref+0x21b0:   	ld	[%i1 + 0x1c], %l5
	.word	0x272514f9	! t0_kref+0x21b4:   	sethi	%hi(0x9453e400), %l3
	.word	0xa63de306	! t0_kref+0x21b8:   	xnor	%l7, 0x306, %l3
	.word	0x39480006	! t0_kref+0x21bc:   	fbuge,a,pt	%fcc0, _kref+0x21d4
	.word	0xa3a01a4c	! t0_kref+0x21c0:   	fdtoi	%f12, %f17
	.word	0x2c800008	! t0_kref+0x21c4:   	bneg,a	_kref+0x21e4
	.word	0xe228a03b	! t0_kref+0x21c8:   	stb	%l1, [%g2 + 0x3b]
	.word	0xa1a01910	! t0_kref+0x21cc:   	fitod	%f16, %f16
	.word	0x81ac8a34	! t0_kref+0x21d0:   	fcmps	%fcc0, %f18, %f20
	.word	0xa1a01913	! t0_kref+0x21d4:   	fitod	%f19, %f16
	.word	0xd428a023	! t0_kref+0x21d8:   	stb	%o2, [%g2 + 0x23]
	.word	0xa00d32df	! t0_kref+0x21dc:   	and	%l4, -0xd21, %l0
	.word	0xea50a016	! t0_kref+0x21e0:   	ldsh	[%g2 + 0x16], %l5
	.word	0xe056401b	! t0_kref+0x21e4:   	ldsh	[%i1 + %i3], %l0
	.word	0xa9a01a4a	! t0_kref+0x21e8:   	fdtoi	%f10, %f20
	.word	0x38480002	! t0_kref+0x21ec:   	bgu,a,pt	%icc, _kref+0x21f4
	.word	0xe848a001	! t0_kref+0x21f0:   	ldsb	[%g2 + 1], %l4
	.word	0x9fa01a52	! t0_kref+0x21f4:   	fdtoi	%f18, %f15
	.word	0x99a50d30	! t0_kref+0x21f8:   	fsmuld	%f20, %f16, %f12
	.word	0xd630a01e	! t0_kref+0x21fc:   	sth	%o3, [%g2 + 0x1e]
	.word	0x36480005	! t0_kref+0x2200:   	bge,a,pt	%icc, _kref+0x2214
	.word	0x91a01910	! t0_kref+0x2204:   	fitod	%f16, %f8
	.word	0xea28a01f	! t0_kref+0x2208:   	stb	%l5, [%g2 + 0x1f]
	.word	0xe19e5a1d	! t0_kref+0x220c:   	ldda	[%i1 + %i5]0xd0, %f16
	.word	0xa8d68017	! t0_kref+0x2210:   	umulcc	%i2, %l7, %l4
	.word	0xe008a013	! t0_kref+0x2214:   	ldub	[%g2 + 0x13], %l0
	.word	0xa3400000	! t0_kref+0x2218:   	mov	%y, %l1
	.word	0xa094400c	! t0_kref+0x221c:   	orcc	%l1, %o4, %l0
	.word	0xa0aab66d	! t0_kref+0x2220:   	andncc	%o2, -0x993, %l0
	.word	0xa5a01a33	! t0_kref+0x2224:   	fstoi	%f19, %f18
	.word	0xa06563b6	! t0_kref+0x2228:   	subc	%l5, 0x3b6, %l0
	.word	0xa72436f3	! t0_kref+0x222c:   	mulscc	%l0, -0x90d, %l3
	.word	0xa2e3000d	! t0_kref+0x2230:   	subccc	%o4, %o5, %l1
	.word	0xa9a01a4a	! t0_kref+0x2234:   	fdtoi	%f10, %f20
	.word	0xe4086fbc	! t0_kref+0x2238:   	ldub	[%g1 + 0xfbc], %l2
	.word	0xa41ca00c	! t0_kref+0x223c:   	xor	%l2, 0xc, %l2
	.word	0xe4286fbc	! t0_kref+0x2240:   	stb	%l2, [%g1 + 0xfbc]
	.word	0x81d86fbc	! t0_kref+0x2244:   	flush	%g1 + 0xfbc
	.word	0xc168a00d	! t0_kref+0x2248:   	prefetch	%g2 + 0xd, 0
	.word	0x2730dd28	! t0_kref+0x224c:   	sethi	%hi(0xc374a000), %l3
	.word	0xa025a600	! t0_kref+0x2250:   	sub	%l6, 0x600, %l0
	.word	0x81aa0a52	! t0_kref+0x2254:   	fcmpd	%fcc0, %f8, %f18
	.word	0xa872c011	! t0_kref+0x2258:   	udiv	%o3, %l1, %l4
	.word	0xc568a008	! t0_kref+0x225c:   	prefetch	%g2 + 8, 2
	.word	0xaaa00015	! t0_kref+0x2260:   	subcc	%g0, %l5, %l5
	.word	0xe1266014	! t0_kref+0x2264:   	st	%f16, [%i1 + 0x14]
2:	.word	0xe2100019	! t0_kref+0x2268:   	lduh	[%g0 + %i1], %l1
	.word	0x37480001	! t0_kref+0x226c:   	fbge,a,pt	%fcc0, _kref+0x2270
	.word	0xd228a000	! t0_kref+0x2270:   	stb	%o1, [%g2]
	.word	0xa4c2801a	! t0_kref+0x2274:   	addccc	%o2, %i2, %l2
	.word	0x81858000	! t0_kref+0x2278:   	wr	%l6, %g0, %y
	.word	0xa5408000	! t0_kref+0x227c:   	mov	%ccr, %l2
	.word	0xa540c000	! t0_kref+0x2280:   	mov	%asi, %l2
	.word	0x99a0190e	! t0_kref+0x2284:   	fitod	%f14, %f12
	.word	0x81ac0aae	! t0_kref+0x2288:   	fcmpes	%fcc0, %f16, %f14
	.word	0xa1a01912	! t0_kref+0x228c:   	fitod	%f18, %f16
	.word	0xa22b7a7a	! t0_kref+0x2290:   	andn	%o5, -0x586, %l1
	.word	0xa0aae441	! t0_kref+0x2294:   	andncc	%o3, 0x441, %l0
	.word	0xf9ee101b	! t0_kref+0x2298:   	prefetcha	%i0 + %i3, 28
	.word	0xa2e22c57	! t0_kref+0x229c:   	subccc	%o0, 0xc57, %l1
	.word	0xab3ce00f	! t0_kref+0x22a0:   	sra	%l3, 0xf, %l5
	.word	0xa22ce795	! t0_kref+0x22a4:   	andn	%l3, 0x795, %l1
	.word	0xe100a010	! t0_kref+0x22a8:   	ld	[%g2 + 0x10], %f16
	.word	0xa324704f	! t0_kref+0x22ac:   	mulscc	%l1, -0xfb1, %l1
	.word	0xe806201c	! t0_kref+0x22b0:   	ld	[%i0 + 0x1c], %l4
	.word	0x81ad4aad	! t0_kref+0x22b4:   	fcmpes	%fcc0, %f21, %f13
	.word	0xa8b28017	! t0_kref+0x22b8:   	orncc	%o2, %l7, %l4
	.word	0x91a489cc	! t0_kref+0x22bc:   	fdivd	%f18, %f12, %f8
	.word	0xef68a04b	! t0_kref+0x22c0:   	prefetch	%g2 + 0x4b, 23
	.word	0x22480005	! t0_kref+0x22c4:   	be,a,pt	%icc, _kref+0x22d8
	.word	0xdf00a00c	! t0_kref+0x22c8:   	ld	[%g2 + 0xc], %f15
	.word	0xa5a00535	! t0_kref+0x22cc:   	fsqrts	%f21, %f18
	.word	0xea10a02c	! t0_kref+0x22d0:   	lduh	[%g2 + 0x2c], %l5
	.word	0xaaf5b676	! t0_kref+0x22d4:   	udivcc	%l6, -0x98a, %l5
	.word	0xaa5dc00d	! t0_kref+0x22d8:   	smul	%l7, %o5, %l5
	.word	0xe808a003	! t0_kref+0x22dc:   	ldub	[%g2 + 3], %l4
	.word	0xc807bfec	! t0_kref+0x22e0:   	ld	[%fp - 0x14], %g4
	.word	0x9ba00529	! t0_kref+0x22e4:   	fsqrts	%f9, %f13
	.word	0xee7e201c	! t0_kref+0x22e8:   	swap	[%i0 + 0x1c], %l7
	.word	0x9da34d30	! t0_kref+0x22ec:   	fsmuld	%f13, %f16, %f14
	.word	0xa33a601c	! t0_kref+0x22f0:   	sra	%o1, 0x1c, %l1
	.word	0x9de3bfa0	! t0_kref+0x22f4:   	save	%sp, -0x60, %sp
	.word	0xabee0018	! t0_kref+0x22f8:   	restore	%i0, %i0, %l5
	.word	0xaa0a0009	! t0_kref+0x22fc:   	and	%o0, %o1, %l5
	.word	0xa1a549ab	! t0_kref+0x2300:   	fdivs	%f21, %f11, %f16
	.word	0x2f480003	! t0_kref+0x2304:   	fbu,a,pt	%fcc0, _kref+0x2310
	.word	0xe46e001a	! t0_kref+0x2308:   	ldstub	[%i0 + %i2], %l2
	.word	0xd19e1000	! t0_kref+0x230c:   	ldda	[%i0]0x80, %f8
	.word	0xaa957544	! t0_kref+0x2310:   	orcc	%l5, -0xabc, %l5
	.word	0xa12ac013	! t0_kref+0x2314:   	sll	%o3, %l3, %l0
	.word	0xa62d800a	! t0_kref+0x2318:   	andn	%l6, %o2, %l3
	.word	0xaba4c9a8	! t0_kref+0x231c:   	fdivs	%f19, %f8, %f21
	.word	0xaae4c013	! t0_kref+0x2320:   	subccc	%l3, %l3, %l5
	.word	0x91a01a4c	! t0_kref+0x2324:   	fdtoi	%f12, %f8
	.word	0xd7262014	! t0_kref+0x2328:   	st	%f11, [%i0 + 0x14]
	.word	0xe4a71019	! t0_kref+0x232c:   	sta	%l2, [%i4 + %i1]0x80
	.word	0xa6aac012	! t0_kref+0x2330:   	andncc	%o3, %l2, %l3
	.word	0xd47e7fe0	! t0_kref+0x2334:   	swap	[%i1 - 0x20], %o2
	.word	0xe296d019	! t0_kref+0x2338:   	lduha	[%i3 + %i1]0x80, %l1
	.word	0xa5a488a9	! t0_kref+0x233c:   	fsubs	%f18, %f9, %f18
	.word	0xe2961000	! t0_kref+0x2340:   	lduha	[%i0]0x80, %l1
	.word	0xff6e001d	! t0_kref+0x2344:   	prefetch	%i0 + %i5, 31
	.word	0xea40a008	! t0_kref+0x2348:   	ldsw	[%g2 + 8], %l5
	.word	0xaa7c8009	! t0_kref+0x234c:   	sdiv	%l2, %o1, %l5
	.word	0x9da01932	! t0_kref+0x2350:   	fstod	%f18, %f14
	.word	0xa8ae8012	! t0_kref+0x2354:   	andncc	%i2, %l2, %l4
	.word	0xea060000	! t0_kref+0x2358:   	ld	[%i0], %l5
	.word	0xa9a000d6	! t0_kref+0x235c:   	fnegd	%f22, %f20
	.word	0xa672fb98	! t0_kref+0x2360:   	udiv	%o3, -0x468, %l3
	.word	0x81dd281e	! t0_kref+0x2364:   	flush	%l4 + 0x81e
	call	SYM(t0_subr2)
	.word	0xaaa2f42c	! t0_kref+0x236c:   	subcc	%o3, -0xbd4, %l5
	.word	0xa93ae01f	! t0_kref+0x2370:   	sra	%o3, 0x1f, %l4
	.word	0xc078a030	! t0_kref+0x2374:   	swap	[%g2 + 0x30], %g0
	.word	0xde3068a3	! t0_kref+0x2378:   	sth	%o7, [%g1 + 0x8a3]
	.word	0x99a01a56	! t0_kref+0x237c:   	fdtoi	%f22, %f12
	.word	0x8143e040	! t0_kref+0x2380:   	membar	0x40
	.word	0xa8d2c014	! t0_kref+0x2384:   	umulcc	%o3, %l4, %l4
	.word	0xed1fbc48	! t0_kref+0x2388:   	ldd	[%fp - 0x3b8], %f22
	.word	0xaa1a7849	! t0_kref+0x238c:   	xor	%o1, -0x7b7, %l5
	.word	0x3f480003	! t0_kref+0x2390:   	fbo,a,pt	%fcc0, _kref+0x239c
	.word	0xea562018	! t0_kref+0x2394:   	ldsh	[%i0 + 0x18], %l5
	.word	0xa225800d	! t0_kref+0x2398:   	sub	%l6, %o5, %l1
	.word	0x83414000	! t0_kref+0x239c:   	mov	%pc, %g1
	.word	0x9ba01a28	! t0_kref+0x23a0:   	fstoi	%f8, %f13
	.word	0x3e480005	! t0_kref+0x23a4:   	bvc,a,pt	%icc, _kref+0x23b8
	.word	0xe1be580b	! t0_kref+0x23a8:   	stda	%f16, [%i1 + %o3]0xc0
	.word	0x2b3bb8c4	! t0_kref+0x23ac:   	sethi	%hi(0xeee31000), %l5
	.word	0x3b480002	! t0_kref+0x23b0:   	fble,a,pt	%fcc0, _kref+0x23b8
	.word	0xa52de01c	! t0_kref+0x23b4:   	sll	%l7, 0x1c, %l2
	.word	0xa65aabe5	! t0_kref+0x23b8:   	smul	%o2, 0xbe5, %l3
	.word	0x32480004	! t0_kref+0x23bc:   	bne,a,pt	%icc, _kref+0x23cc
	.word	0xa1a0188d	! t0_kref+0x23c0:   	fitos	%f13, %f16
	.word	0xa9a288a9	! t0_kref+0x23c4:   	fsubs	%f10, %f9, %f20
	.word	0xa274e745	! t0_kref+0x23c8:   	udiv	%l3, 0x745, %l1
	.word	0x26480005	! t0_kref+0x23cc:   	bl,a,pt	%icc, _kref+0x23e0
	.word	0xf007bfe0	! t0_kref+0x23d0:   	ld	[%fp - 0x20], %i0
	.word	0xaba01090	! t0_kref+0x23d4:   	fxtos	%f16, %f21
	.word	0xa32d8016	! t0_kref+0x23d8:   	sll	%l6, %l6, %l1
	.word	0x22480007	! t0_kref+0x23dc:   	be,a,pt	%icc, _kref+0x23f8
	.word	0xa29a400b	! t0_kref+0x23e0:   	xorcc	%o1, %o3, %l1
	.word	0xea30a024	! t0_kref+0x23e4:   	sth	%l5, [%g2 + 0x24]
	.word	0xa3368016	! t0_kref+0x23e8:   	srl	%i2, %l6, %l1
	.word	0xe920a034	! t0_kref+0x23ec:   	st	%f20, [%g2 + 0x34]
	.word	0x24800003	! t0_kref+0x23f0:   	ble,a	_kref+0x23fc
	.word	0x93a0002f	! t0_kref+0x23f4:   	fmovs	%f15, %f9
	.word	0xc168a002	! t0_kref+0x23f8:   	prefetch	%g2 + 2, 0
	.word	0xe9070018	! t0_kref+0x23fc:   	ld	[%i4 + %i0], %f20
	.word	0xa09d000c	! t0_kref+0x2400:   	xorcc	%l4, %o4, %l0
	.word	0x81800000	! t0_kref+0x2404:   	mov	%g0, %y
	.word	0xa87a400a	! t0_kref+0x2408:   	sdiv	%o1, %o2, %l4
	.word	0x272bbe0b	! t0_kref+0x240c:   	sethi	%hi(0xaef82c00), %l3
	.word	0xe80e3ffd	! t0_kref+0x2410:   	ldub	[%i0 - 3], %l4
	.word	0xe608a017	! t0_kref+0x2414:   	ldub	[%g2 + 0x17], %l3
	.word	0x9da01a30	! t0_kref+0x2418:   	fstoi	%f16, %f14
	.word	0x8184c000	! t0_kref+0x241c:   	wr	%l3, %g0, %y
	.word	0xa0e5401b	! t0_kref+0x2420:   	subccc	%l5, %i3, %l0
	.word	0x95a20854	! t0_kref+0x2424:   	faddd	%f8, %f20, %f10
	.word	0xa485c010	! t0_kref+0x2428:   	addcc	%l7, %l0, %l2
	.word	0xa5224013	! t0_kref+0x242c:   	mulscc	%o1, %l3, %l2
	.word	0xeda61000	! t0_kref+0x2430:   	sta	%f22, [%i0]0x80
	.word	0xd66e6002	! t0_kref+0x2434:   	ldstub	[%i1 + 2], %o3
	.word	0xa6aec017	! t0_kref+0x2438:   	andncc	%i3, %l7, %l3
	.word	0xda28a01e	! t0_kref+0x243c:   	stb	%o5, [%g2 + 0x1e]
	.word	0xa5a58d29	! t0_kref+0x2440:   	fsmuld	%f22, %f9, %f18
	.word	0xe8ce1000	! t0_kref+0x2444:   	ldsba	[%i0]0x80, %l4
	.word	0xba103fe8	! t0_kref+0x2448:   	mov	0xffffffe8, %i5
	.word	0xaad57130	! t0_kref+0x244c:   	umulcc	%l5, -0xed0, %l5
	.word	0xa2d2800b	! t0_kref+0x2450:   	umulcc	%o2, %o3, %l1
	.word	0xaa620009	! t0_kref+0x2454:   	subc	%o0, %o1, %l5
	.word	0x9ba4c933	! t0_kref+0x2458:   	fmuls	%f19, %f19, %f13
	.word	0xe630a008	! t0_kref+0x245c:   	sth	%l3, [%g2 + 8]
	.word	0x8143c000	! t0_kref+0x2460:   	stbar
	.word	0xe62e401a	! t0_kref+0x2464:   	stb	%l3, [%i1 + %i2]
	.word	0xd07e201c	! t0_kref+0x2468:   	swap	[%i0 + 0x1c], %o0
	.word	0x39480002	! t0_kref+0x246c:   	fbuge,a,pt	%fcc0, _kref+0x2474
	.word	0xe848a020	! t0_kref+0x2470:   	ldsb	[%g2 + 0x20], %l4
	.word	0xd9260000	! t0_kref+0x2474:   	st	%f12, [%i0]
	.word	0xd83e7ff0	! t0_kref+0x2478:   	std	%o4, [%i1 - 0x10]
	.word	0x95a01a52	! t0_kref+0x247c:   	fdtoi	%f18, %f10
	.word	0x81ad0a32	! t0_kref+0x2480:   	fcmps	%fcc0, %f20, %f18
	.word	0xa85d6117	! t0_kref+0x2484:   	smul	%l5, 0x117, %l4
	.word	0xa1418000	! t0_kref+0x2488:   	mov	%fprs, %l0
	.word	0xa9a0102f	! t0_kref+0x248c:   	fstox	%f15, %f20
	.word	0xea16200a	! t0_kref+0x2490:   	lduh	[%i0 + 0xa], %l5
	.word	0xa5a20d28	! t0_kref+0x2494:   	fsmuld	%f8, %f8, %f18
	.word	0xf007bfe0	! t0_kref+0x2498:   	ld	[%fp - 0x20], %i0
	.word	0xa9400000	! t0_kref+0x249c:   	mov	%y, %l4
	.word	0x81ab8a4c	! t0_kref+0x24a0:   	fcmpd	%fcc0, %f14, %f12
	.word	0x86102003	! t0_kref+0x24a4:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x24a8:   	bne,a	_kref+0x24a8
	.word	0x86a0e001	! t0_kref+0x24ac:   	subcc	%g3, 1, %g3
	.word	0xe0567ffe	! t0_kref+0x24b0:   	ldsh	[%i1 - 2], %l0
	.word	0xaba0052a	! t0_kref+0x24b4:   	fsqrts	%f10, %f21
	.word	0xea164000	! t0_kref+0x24b8:   	lduh	[%i1], %l5
	.word	0x9fc10000	! t0_kref+0x24bc:   	call	%g4
	.word	0xa2d24008	! t0_kref+0x24c0:   	umulcc	%o1, %o0, %l1
	.word	0xa1a00533	! t0_kref+0x24c4:   	fsqrts	%f19, %f16
	.word	0xaaf6c017	! t0_kref+0x24c8:   	udivcc	%i3, %l7, %l5
	.word	0xa0934012	! t0_kref+0x24cc:   	orcc	%o5, %l2, %l0
	.word	0xe828a03a	! t0_kref+0x24d0:   	stb	%l4, [%g2 + 0x3a]
	.word	0xe8066014	! t0_kref+0x24d4:   	ld	[%i1 + 0x14], %l4
	.word	0xa4aa0013	! t0_kref+0x24d8:   	andncc	%o0, %l3, %l2
	.word	0xa7a00529	! t0_kref+0x24dc:   	fsqrts	%f9, %f19
	.word	0xc807bfe4	! t0_kref+0x24e0:   	ld	[%fp - 0x1c], %g4
	.word	0xe0567fe2	! t0_kref+0x24e4:   	ldsh	[%i1 - 0x1e], %l0
	.word	0xa2d26488	! t0_kref+0x24e8:   	umulcc	%o1, 0x488, %l1
	.word	0x81acca30	! t0_kref+0x24ec:   	fcmps	%fcc0, %f19, %f16
	.word	0xa40de52d	! t0_kref+0x24f0:   	and	%l7, 0x52d, %l2
	.word	0xa8acc00d	! t0_kref+0x24f4:   	andncc	%l3, %o5, %l4
	.word	0xe2263fe4	! t0_kref+0x24f8:   	st	%l1, [%i0 - 0x1c]
	.word	0xa9a9402e	! t0_kref+0x24fc:   	fmovsug	%fcc0, %f14, %f20
	.word	0xaa14001a	! t0_kref+0x2500:   	or	%l0, %i2, %l5
	.word	0xa9a000ab	! t0_kref+0x2504:   	fnegs	%f11, %f20
	.word	0xa6f50008	! t0_kref+0x2508:   	udivcc	%l4, %o0, %l3
	.word	0x21480003	! t0_kref+0x250c:   	fbn,a,pt	%fcc0, _kref+0x2518
	.word	0xa13c801b	! t0_kref+0x2510:   	sra	%l2, %i3, %l0
	.word	0x95a01a52	! t0_kref+0x2514:   	fdtoi	%f18, %f10
	.word	0xee68a03b	! t0_kref+0x2518:   	ldstub	[%g2 + 0x3b], %l7
	call	SYM(t0_subr2)
	.word	0xe228a001	! t0_kref+0x2520:   	stb	%l1, [%g2 + 1]
	.word	0xd028a017	! t0_kref+0x2524:   	stb	%o0, [%g2 + 0x17]
	.word	0xaa0cfd2c	! t0_kref+0x2528:   	and	%l3, -0x2d4, %l5
	.word	0xe400a004	! t0_kref+0x252c:   	ld	[%g2 + 4], %l2
	.word	0x23151ae9	! t0_kref+0x2530:   	sethi	%hi(0x546ba400), %l1
	.word	0xe9beda58	! t0_kref+0x2534:   	stda	%f20, [%i3 + %i0]0xd2
	.word	0x95a20850	! t0_kref+0x2538:   	faddd	%f8, %f16, %f10
	.word	0x81ad4ab4	! t0_kref+0x253c:   	fcmpes	%fcc0, %f21, %f20
	.word	0xe40861c0	! t0_kref+0x2540:   	ldub	[%g1 + 0x1c0], %l2
	.word	0xa41ca00c	! t0_kref+0x2544:   	xor	%l2, 0xc, %l2
	.word	0xe42861c0	! t0_kref+0x2548:   	stb	%l2, [%g1 + 0x1c0]
	.word	0x81d861c0	! t0_kref+0x254c:   	flush	%g1 + 0x1c0
	.word	0xab243121	! t0_kref+0x2550:   	mulscc	%l0, -0xedf, %l5
	.word	0xaa16c00c	! t0_kref+0x2554:   	or	%i3, %o4, %l5
	.word	0xc3ee5014	! t0_kref+0x2558:   	prefetcha	%i1 + %l4, 1
2:	.word	0x93a000a9	! t0_kref+0x255c:   	fnegs	%f9, %f9
	.word	0xe6560000	! t0_kref+0x2560:   	ldsh	[%i0], %l3
	.word	0x86102002	! t0_kref+0x2564:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x2568:   	bne,a	_kref+0x2568
	.word	0x86a0e001	! t0_kref+0x256c:   	subcc	%g3, 1, %g3
	.word	0xa8150011	! t0_kref+0x2570:   	or	%l4, %l1, %l4
	.word	0xc1ee1010	! t0_kref+0x2574:   	prefetcha	%i0 + %l0, 0
	.word	0xa2623a3a	! t0_kref+0x2578:   	subc	%o0, -0x5c6, %l1
	.word	0xa034ab94	! t0_kref+0x257c:   	orn	%l2, 0xb94, %l0
	.word	0xd43e6010	! t0_kref+0x2580:   	std	%o2, [%i1 + 0x10]
	.word	0x95a30d2c	! t0_kref+0x2584:   	fsmuld	%f12, %f12, %f10
	.word	0x81abcaae	! t0_kref+0x2588:   	fcmpes	%fcc0, %f15, %f14
	.word	0xa5408000	! t0_kref+0x258c:   	mov	%ccr, %l2
	.word	0x26800002	! t0_kref+0x2590:   	bl,a	_kref+0x2598
	.word	0xa8ab0016	! t0_kref+0x2594:   	andncc	%o4, %l6, %l4
	.word	0xa3a000ad	! t0_kref+0x2598:   	fnegs	%f13, %f17
	.word	0xa89c8010	! t0_kref+0x259c:   	xorcc	%l2, %l0, %l4
	.word	0xa5a00530	! t0_kref+0x25a0:   	fsqrts	%f16, %f18
	.word	0xd6266008	! t0_kref+0x25a4:   	st	%o3, [%i1 + 8]
	.word	0xe5ee501c	! t0_kref+0x25a8:   	prefetcha	%i1 + %i4, 18
	.word	0xa72c4014	! t0_kref+0x25ac:   	sll	%l1, %l4, %l3
	.word	0xe3062014	! t0_kref+0x25b0:   	ld	[%i0 + 0x14], %f17
	.word	0xa0254010	! t0_kref+0x25b4:   	sub	%l5, %l0, %l0
	.word	0x9de3bfa0	! t0_kref+0x25b8:   	save	%sp, -0x60, %sp
	.word	0xb0dec000	! t0_kref+0x25bc:   	smulcc	%i3, %g0, %i0
	.word	0xa1e80000	! t0_kref+0x25c0:   	restore	%g0, %g0, %l0
	.word	0x81df0015	! t0_kref+0x25c4:   	flush	%i4 + %l5
	.word	0xeace9018	! t0_kref+0x25c8:   	ldsba	[%i2 + %i0]0x80, %l5
	.word	0xe4066004	! t0_kref+0x25cc:   	ld	[%i1 + 4], %l2
	.word	0xa6f57382	! t0_kref+0x25d0:   	udivcc	%l5, -0xc7e, %l3
	.word	0xd4f81018	! t0_kref+0x25d4:   	swapa	[%g0 + %i0]0x80, %o2
	.word	0xa616f281	! t0_kref+0x25d8:   	or	%i3, -0xd7f, %l3
	.word	0x9f414000	! t0_kref+0x25dc:   	mov	%pc, %o7
	.word	0x81ad0a52	! t0_kref+0x25e0:   	fcmpd	%fcc0, %f20, %f18
	.word	0x9fa01892	! t0_kref+0x25e4:   	fitos	%f18, %f15
	.word	0xa31c000d	! t0_kref+0x25e8:   	tsubcctv	%l0, %o5, %l1
	.word	0xa71c4011	! t0_kref+0x25ec:   	tsubcctv	%l1, %l1, %l3
	.word	0xa2f2b791	! t0_kref+0x25f0:   	udivcc	%o2, -0x86f, %l1
	.word	0xa0e40000	! t0_kref+0x25f4:   	subccc	%l0, %g0, %l0
	.word	0xa1a308b4	! t0_kref+0x25f8:   	fsubs	%f12, %f20, %f16
	.word	0xf420a01c	! t0_kref+0x25fc:   	st	%i2, [%g2 + 0x1c]
	.word	0xab400000	! t0_kref+0x2600:   	mov	%y, %l5
	.word	0xa325b2a4	! t0_kref+0x2604:   	mulscc	%l6, -0xd5c, %l1
	.word	0xe0062008	! t0_kref+0x2608:   	ld	[%i0 + 8], %l0
	.word	0xe4063fec	! t0_kref+0x260c:   	ld	[%i0 - 0x14], %l2
	.word	0xe06e6007	! t0_kref+0x2610:   	ldstub	[%i1 + 7], %l0
	.word	0x9da209cc	! t0_kref+0x2614:   	fdivd	%f8, %f12, %f14
	.word	0x291da37a	! t0_kref+0x2618:   	sethi	%hi(0x768de800), %l4
	.word	0xa5a5092e	! t0_kref+0x261c:   	fmuls	%f20, %f14, %f18
	.word	0xe13f4018	! t0_kref+0x2620:   	std	%f16, [%i5 + %i0]
	.word	0xa2f27fa6	! t0_kref+0x2624:   	udivcc	%o1, -0x5a, %l1
	.word	0xe2063ff0	! t0_kref+0x2628:   	ld	[%i0 - 0x10], %l1
	.word	0x22480001	! t0_kref+0x262c:   	be,a,pt	%icc, _kref+0x2630
	.word	0xc0263ff4	! t0_kref+0x2630:   	clr	[%i0 - 0xc]
	.word	0xa4637c0e	! t0_kref+0x2634:   	subc	%o5, -0x3f2, %l2
	.word	0xe300a010	! t0_kref+0x2638:   	ld	[%g2 + 0x10], %f17
	.word	0x22800002	! t0_kref+0x263c:   	be,a	_kref+0x2644
	.word	0xd26e6012	! t0_kref+0x2640:   	ldstub	[%i1 + 0x12], %o1
	.word	0xeca71018	! t0_kref+0x2644:   	sta	%l6, [%i4 + %i0]0x80
	.word	0xa7418000	! t0_kref+0x2648:   	mov	%fprs, %l3
	.word	0x28800002	! t0_kref+0x264c:   	bleu,a	_kref+0x2654
	.word	0xa4f565f8	! t0_kref+0x2650:   	udivcc	%l5, 0x5f8, %l2
	.word	0xa32322a6	! t0_kref+0x2654:   	mulscc	%o4, 0x2a6, %l1
	.word	0x97a01a2b	! t0_kref+0x2658:   	fstoi	%f11, %f11
	.word	0xa2b2b31e	! t0_kref+0x265c:   	orncc	%o2, -0xce2, %l1
	.word	0xe830a03c	! t0_kref+0x2660:   	sth	%l4, [%g2 + 0x3c]
	.word	0xa7344012	! t0_kref+0x2664:   	srl	%l1, %l2, %l3
	.word	0xaa0ebbe4	! t0_kref+0x2668:   	and	%i2, -0x41c, %l5
	.word	0xe46e4000	! t0_kref+0x266c:   	ldstub	[%i1], %l2
	.word	0xa46368c4	! t0_kref+0x2670:   	subc	%o5, 0x8c4, %l2
	.word	0xa4b54017	! t0_kref+0x2674:   	orncc	%l5, %l7, %l2
	.word	0xc398a040	! t0_kref+0x2678:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0x97a00132	! t0_kref+0x267c:   	fabss	%f18, %f11
	.word	0xaa302630	! t0_kref+0x2680:   	orn	%g0, 0x630, %l5
	.word	0x23480003	! t0_kref+0x2684:   	fbne,a,pt	%fcc0, _kref+0x2690
	.word	0xa8b40008	! t0_kref+0x2688:   	orncc	%l0, %o0, %l4
	.word	0xa22dc017	! t0_kref+0x268c:   	andn	%l7, %l7, %l1
	.word	0xa0e6ec23	! t0_kref+0x2690:   	subccc	%i3, 0xc23, %l0
	.word	0xf207bfe0	! t0_kref+0x2694:   	ld	[%fp - 0x20], %i1
	.word	0xea06401c	! t0_kref+0x2698:   	ld	[%i1 + %i4], %l5
	.word	0xa1400000	! t0_kref+0x269c:   	mov	%y, %l0
	.word	0x29480004	! t0_kref+0x26a0:   	fbl,a,pt	%fcc0, _kref+0x26b0
	.word	0xa0dab98b	! t0_kref+0x26a4:   	smulcc	%o2, -0x675, %l0
	.word	0xea48a00c	! t0_kref+0x26a8:   	ldsb	[%g2 + 0xc], %l5
	.word	0xd01e2008	! t0_kref+0x26ac:   	ldd	[%i0 + 8], %o0
	.word	0xe408632c	! t0_kref+0x26b0:   	ldub	[%g1 + 0x32c], %l2
	.word	0xa41ca00c	! t0_kref+0x26b4:   	xor	%l2, 0xc, %l2
	.word	0xe428632c	! t0_kref+0x26b8:   	stb	%l2, [%g1 + 0x32c]
	.word	0x81d8632c	! t0_kref+0x26bc:   	flush	%g1 + 0x32c
	.word	0xe6264000	! t0_kref+0x26c0:   	st	%l3, [%i1]
	.word	0xa066e980	! t0_kref+0x26c4:   	subc	%i3, 0x980, %l0
2:	.word	0xa4db2c95	! t0_kref+0x26c8:   	smulcc	%o4, 0xc95, %l2
	.word	0xda20a02c	! t0_kref+0x26cc:   	st	%o5, [%g2 + 0x2c]
	.word	0x81aa8a4a	! t0_kref+0x26d0:   	fcmpd	%fcc0, %f10, %f10
	.word	0x20480001	! t0_kref+0x26d4:   	bn,a,pt	%icc, _kref+0x26d8
	.word	0xa6b5c014	! t0_kref+0x26d8:   	orncc	%l7, %l4, %l3
	.word	0xa4b58000	! t0_kref+0x26dc:   	orncc	%l6, %g0, %l2
	.word	0xa2f54013	! t0_kref+0x26e0:   	udivcc	%l5, %l3, %l1
	.word	0xe4060000	! t0_kref+0x26e4:   	ld	[%i0], %l2
	.word	0xa533200c	! t0_kref+0x26e8:   	srl	%o4, 0xc, %l2
	.word	0xaa76b5b5	! t0_kref+0x26ec:   	udiv	%i2, -0xa4b, %l5
	.word	0xea260000	! t0_kref+0x26f0:   	st	%l5, [%i0]
	.word	0xab3d4012	! t0_kref+0x26f4:   	sra	%l5, %l2, %l5
	.word	0x8143e040	! t0_kref+0x26f8:   	membar	0x40
	.word	0xa526edb3	! t0_kref+0x26fc:   	mulscc	%i3, 0xdb3, %l2
	.word	0xa9a0052d	! t0_kref+0x2700:   	fsqrts	%f13, %f20
	.word	0x97a2c9b6	! t0_kref+0x2704:   	fdivs	%f11, %f22, %f11
	.word	0xaa2d8016	! t0_kref+0x2708:   	andn	%l6, %l6, %l5
	.word	0xa695800a	! t0_kref+0x270c:   	orcc	%l6, %o2, %l3
	.word	0x3e800003	! t0_kref+0x2710:   	bvc,a	_kref+0x271c
	.word	0xe19e5a5c	! t0_kref+0x2714:   	ldda	[%i1 + %i4]0xd2, %f16
	.word	0xe4567ff0	! t0_kref+0x2718:   	ldsh	[%i1 - 0x10], %l2
	.word	0x99a00535	! t0_kref+0x271c:   	fsqrts	%f21, %f12
	.word	0x3b480004	! t0_kref+0x2720:   	fble,a,pt	%fcc0, _kref+0x2730
	.word	0xa6d5c00b	! t0_kref+0x2724:   	umulcc	%l7, %o3, %l3
	.word	0xa7a388b2	! t0_kref+0x2728:   	fsubs	%f14, %f18, %f19
	.word	0xd2680019	! t0_kref+0x272c:   	ldstub	[%g0 + %i1], %o1
	.word	0xa065c012	! t0_kref+0x2730:   	subc	%l7, %l2, %l0
	.word	0xdf070019	! t0_kref+0x2734:   	ld	[%i4 + %i1], %f15
	.word	0x3b480007	! t0_kref+0x2738:   	fble,a,pt	%fcc0, _kref+0x2754
	.word	0xa4080000	! t0_kref+0x273c:   	and	%g0, %g0, %l2
	.word	0x9da000ab	! t0_kref+0x2740:   	fnegs	%f11, %f14
	.word	0x01000000	! t0_kref+0x2744:   	nop
	.word	0x01000000	! t0_kref+0x2748:   	nop
	.word	0x01000000	! t0_kref+0x274c:   	nop
	.word	0x01000000	! t0_kref+0x2750:   	nop
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x2758:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x1e408000)
.seg "text"
t0_subr0_page_begin:
	.skip 8192
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x1d604000)
.seg "text"
t0_subr1_page_begin:
	.skip 8184
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x0c73a000)
.seg "text"
t0_subr2_page_begin:
	.skip 8180
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x0c544000)
.seg "text"
t0_subr3_page_begin:
	.skip 8152
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
!  Total operations: 2436  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.14   1.19
!  ldub              0.32   0.49
!  ldsh              1.07   1.19
!  lduh              1.39   1.56
!  ld                1.08   1.68
!  ldd               0.38   0.49
!  swap              1.43   1.07
!  ldstub            1.42   1.52
!  stb               0.64   0.37
!  sth               0.06   0.00
!  st                0.97   1.15
!  std               0.25   0.45
!  add               0.04   0.08
!  addcc             0.27   0.08
!  addx              0.25   0.25
!  addxcc            0.10   0.16
!  taddcc            0.06   0.04
!  taddcctv          0.08   0.04
!  sub               1.15   1.60
!  subcc             0.55   0.70
!  subx              1.13   1.77
!  subxcc            1.31   1.48
!  tsubcc            0.04   0.04
!  tsubcctv          0.26   0.49
!  mulscc            1.18   1.60
!  and               1.41   1.56
!  andcc             0.08   0.08
!  andn              1.49   1.15
!  andncc            1.48   1.35
!  or                1.05   0.74
!  orcc              1.08   1.35
!  orn               0.47   0.45
!  orncc             1.09   1.07
!  xor               0.22   0.21
!  xorcc             0.78   0.99
!  xnor              0.76   0.70
!  xnorcc            0.65   0.53
!  sll               0.91   0.94
!  srl               1.00   1.03
!  sra               1.49   1.68
!  unimp             0.23   0.21
!  umul              1.05   0.78
!  smul              1.35   1.64
!  udiv              1.17   1.35
!  sdiv              0.60   0.66
!  umulcc            1.33   1.35
!  smulcc            0.17   0.25
!  udivcc            1.26   0.94
!  sdivcc            0.46   0.49
!  rdy               1.16   1.31
!  wry               0.82   0.57
!  bicc              2.36   2.30
!  sethi             1.37   1.23
!  jmpl              0.55   0.25
!  call              0.53   0.29
!  ticc              0.00   0.00
!  flush             1.04   1.27
!  save              1.00   0.53
!  restore           1.50   0.00
!  stbar             0.08   0.04
!  ldf               0.91   1.03
!  lddf              0.11   0.12
!  stf               0.92   1.07
!  stdf              0.27   0.25
!  fadds             1.03   0.78
!  fsubs             0.45   0.70
!  fmuls             0.76   1.03
!  fdivs             0.57   0.82
!  faddd             0.44   0.25
!  fsubd             0.10   0.12
!  fmuld             0.04   0.04
!  fdivd             0.52   0.53
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            1.33   1.68
!  fdmulq            0.00   0.00
!  fitos             0.39   0.53
!  fitod             1.45   1.52
!  fitoq             0.00   0.00
!  fstoi             1.27   1.27
!  fstod             1.04   1.19
!  fstoq             0.00   0.00
!  fdtoi             1.49   1.68
!  fdtos             0.37   0.21
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.29   0.37
!  fnegs             0.96   1.23
!  fabss             0.44   0.41
!  fsqrts            2.50   2.75
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.92   1.07
!  fcmpd             1.45   1.23
!  fcmpq             0.00   0.00
!  fcmpes            1.17   1.19
!  fcmped            0.12   0.12
!  fcmpeq            0.00   0.00
!  fbfcc             0.24   0.04
!  ldfsr             0.26   0.00
!  stfsr             0.23   0.08
!  loop              0.59   0.25
!  offset            0.03   0.16
!  area              0.18   0.25
!  target            0.18   0.29
!  goto              0.22   0.08
!  sigsegv           0.06   0.04
!  sigbus            0.19   0.25
!  imodify           1.12   0.53
!  ldfsr_offset      0.02   0.00
!  fpattern          0.14   0.21
!  lbranch           0.20   0.04
!  shmld             3.64   3.16
!  shmst             3.57   4.11
!  shmpf             0.58   0.82
!  shmswap           0.28   0.29
!  shmblkld          0.09   0.12
!  shmblkst          0.24   0.33
!  shmblkchk         0.21   0.21
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
!  casa              0.03   0.04
!  rdasi             0.04   0.08
!  wrasi             0.11   0.00
!  bpcc              3.78   2.75
!  fbpfcc            3.69   3.20
!  fmovscc           0.26   0.33
!  fmovdcc           0.03   0.04
!  fmovqcc           0.00   0.00
!  movcc             0.01   0.00
!  flushw            0.15   0.21
!  membar            0.01   0.00
!  prefetch          1.15   1.35
!  rdpc              0.29   0.29
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.14   0.16
!  lddfa             0.21   0.29
!  ldqfa             0.00   0.00
!  ldsba             0.20   0.29
!  ldsha             0.07   0.08
!  lduba             0.07   0.12
!  lduha             0.19   0.29
!  lda               0.08   0.16
!  ldda              0.19   0.33
!  ldstuba           0.16   0.21
!  prefetcha         1.32   1.64
!  stfa              0.21   0.12
!  stdfa             0.08   0.04
!  stqfa             0.00   0.00
!  stba              0.29   0.25
!  stha              0.00   0.00
!  sta               0.12   0.21
!  stda              0.04   0.00
!  swapa             0.14   0.16
!  fmovd             0.03   0.00
!  fnegd             0.26   0.33
!  fabsd             0.09   0.04
!  fstox             0.16   0.16
!  fdtox             0.05   0.00
!  fxtos             0.13   0.25
!  fxtod             0.05   0.04
!  lds               0.27   0.25
!  ldsa              0.01   0.00
!  ldx               0.24   0.16
!  ldxa              0.28   0.16
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
!  partial_st8       0.25   0.33
!  partial_st16      0.02   0.04
!  partial_st32      0.12   0.08
!  short_st8         0.23   0.37
!  short_st16        0.16   0.12
!  short_ld8         0.26   0.25
!  short_ld16        0.28   0.12
!  blkld             0.04   0.00
!  blkst             0.29   0.00
!  blkld_offset      0.20   0.00
!  blkst_offset      0.10   0.00
!  blk_check         0.18   0.08
!  casxa             0.01   0.04
!  rdccr             0.16   0.25
!  rdfprs            0.26   0.45
!  wrccr             0.02   0.04
!  popc              0.22   0.25
!  wrfprs            0.07   0.00
!  stx               0.10   0.12
!  stxa              0.21   0.12
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
KDATA_MODULE(t0_module_offset_table, 0x35072000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000010
	.word	0xffffffe0
	.word	0xffffffe8
	.word	0x00000008
	.word	0xfffffff0
	.word	0xfffffff8
	.word	0x00000018
	.word	0x00000000
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

KDATA_MODULE(t0_module_data_in_regs, 0x0ee86000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x9027ce5d          ! %f0
	.word	0xb6942f98          ! %f1
	.word	0x5c13cc66          ! %f2
	.word	0xfa619bed          ! %f3
	.word	0x9902dbf2          ! %f4
	.word	0x4ae032a0          ! %f5
	.word	0x20fe5d2c          ! %f6
	.word	0xcefd3d01          ! %f7
	.word	0x697d4a58          ! %f8
	.word	0xd59b0aac          ! %f9
	.word	0x9311662b          ! %f10
	.word	0x319e19c4          ! %f11
	.word	0x2fda952b          ! %f12
	.word	0xed50a7f8          ! %f13
	.word	0x365037bc          ! %f14
	.word	0x442f94ee          ! %f15
	.word	0x35b7b6cc          ! %f16
	.word	0x81f745cf          ! %f17
	.word	0xcbfecb39          ! %f18
	.word	0xdadc72fb          ! %f19
	.word	0x8f28e865          ! %f20
	.word	0xa2cdc440          ! %f21
	.word	0x20d5ac9b          ! %f22
	.word	0x8742acfb          ! %f23
	.word	0xa2a4de2a          ! %f24
	.word	0x3c596911          ! %f25
	.word	0x66585a64          ! %f26
	.word	0x5a911ca6          ! %f27
	.word	0x72b103e2          ! %f28
	.word	0x76ca3bf3          ! %f29
	.word	0xa6573fbf          ! %f30
	.word	0xabcb55b3          ! %f31
	.word	0x2f767da5          ! %f32
	.word	0x3dcc71f7          ! %f33
	.word	0x6494ace4          ! %f34
	.word	0xd6614069          ! %f35
	.word	0x6a9ff0e7          ! %f36
	.word	0x60409c40          ! %f37
	.word	0xc01671c1          ! %f38
	.word	0x820d4975          ! %f39
	.word	0x3f5c59b4          ! %f40
	.word	0xb7bb8dfa          ! %f41
	.word	0xc223fed6          ! %f42
	.word	0xa0c53afe          ! %f43
	.word	0x4b63703d          ! %f44
	.word	0x304a2d8a          ! %f45
	.word	0x8e8b3060          ! %f46
	.word	0x47b712f6          ! %f47
	.word	0xa89c6292          ! %f48
	.word	0x1804a506          ! %f49
	.word	0xc5c427b9          ! %f50
	.word	0xce0c6ab3          ! %f51
	.word	0x69cfe6b0          ! %f52
	.word	0x46bfa5e7          ! %f53
	.word	0x302ed6fe          ! %f54
	.word	0xf4c443bd          ! %f55
	.word	0xebdae8be          ! %f56
	.word	0xd7e1b3fd          ! %f57
	.word	0x302b22f2          ! %f58
	.word	0x1f9c4de9          ! %f59
	.word	0x98675993          ! %f60
	.word	0xf64daba2          ! %f61
	.word	0x1976bf21          ! %f62
	.word	0x04fffaa6          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x4a8       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xccc415b6          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x078e3b51          ! %o0
	.word	0xe0f3e4ef          ! %o1
	.word	0x74ab5468          ! %o2
	.word	0xcfc4afc4          ! %o3
	.word	0xd4e4c77f          ! %o4
	.word	0xdebf6860          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x4384e17c          ! %l0
	.word	0xabb2f732          ! %l1
	.word	0x654a2848          ! %l2
	.word	0x7384f196          ! %l3
	.word	0xe2d37b3b          ! %l4
	.word	0x84a727ba          ! %l5
	.word	0x6e6060f3          ! %l6
	.word	0x73e1ba60          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xffffffef          ! %i2 (byte offset)
	.word	0xffffffe8          ! %i3 (halfword offset)
	.word	0x00000004          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xc83103c3          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0x40000f2a          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x365ca000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xb33a8847
	.word	0xd3967b3e
	.word	0xc66d2a28
	.word	0xf72efdf2
	.word	0xb3d4dc18
	.word	0xbe17f25d
	.word	0x19a567b6
	.word	0xca8f5635
	.word	0xc15c18cc
	.word	0x9b2e1929
	.word	0xf5d7e076
	.word	0x2b457b32
	.word	0xb2db2d68
	.word	0xb6662ffd
	.word	0x425c58bb
	.word	0x929bd6a3
	.word	0xfcbe58ee
	.word	0xc9ca5a40
	.word	0x336c28fc
	.word	0x21ec7730
	.word	0x765907bb
	.word	0x2cf8b9fa
	.word	0xde2ff3d8
	.word	0x41af2828
	.word	0xae21a330
	.word	0x125830a9
	.word	0x48e4385a
	.word	0x2b24d06e
	.word	0x9fe83794
	.word	0xdb97d955
	.word	0xcf3e447d
	.word	0x62e54cb1
	.word	0x95371439
	.word	0x4be38fe2
	.word	0x4dcf4bf2
	.word	0x2d3438df
	.word	0x295ac9dc
	.word	0xaa0919a4
	.word	0xcebba720
	.word	0x4a545cda
	.word	0xba812b51
	.word	0x946ec338
	.word	0xb2f87e6b
	.word	0xc858b06c
	.word	0xc635345f
	.word	0x45758791
	.word	0x5da265b8
	.word	0x9c6d2a78
	.word	0xb377fae8
	.word	0x8dee1451
	.word	0xcf23ac31
	.word	0x9e80cf73
	.word	0xae150e4d
	.word	0xade93f59
	.word	0xfc096445
	.word	0xc2ddb311
	.word	0x67d2e910
	.word	0x17a1c1a3
	.word	0xdbd267f2
	.word	0x4cd2e142
	.word	0xab0658ba
	.word	0xc5c64b4e
	.word	0x8ef3dd46
	.word	0xaf5f625f
	.word	0xa119fffe
	.word	0x334844fa
	.word	0xb502ff22
	.word	0xd40ccea0
	.word	0xe509571e
	.word	0xd044d256
	.word	0x44ac2e41
	.word	0x301b24d2
	.word	0xefe0ce8d
	.word	0x7ae2e9f6
	.word	0x5b1b8e78
	.word	0x0406d845
	.word	0x0a4af7d5
	.word	0x955a9669
	.word	0x77fbb43f
	.word	0x248d4a0a
	.word	0xbc4cd8ba
	.word	0xa906b48a
	.word	0x2a73266f
	.word	0xfde3215e
	.word	0x21d1cc9f
	.word	0x92a3c316
	.word	0x0ad1b84c
	.word	0x15133760
	.word	0xa9c99829
	.word	0x3af3977f
	.word	0xf82affc6
	.word	0x07b40a0a
	.word	0x8ca19322
	.word	0x3a270bff
	.word	0x712b6bfb
	.word	0x0a8cea5e
	.word	0xd00c0c9f
	.word	0x20ebfaef
	.word	0xc849c000
	.word	0xbba359df
	.word	0x77974d63
	.word	0xc10f1b58
	.word	0x2d4ef5e1
	.word	0x06bc4b42
	.word	0xadc7dc85
	.word	0xc68692ca
	.word	0x9d4acde5
	.word	0x13e43a65
	.word	0x467fea51
	.word	0x69b3506c
	.word	0xceab8e16
	.word	0x294c4f80
	.word	0x23b8056c
	.word	0x79f48554
	.word	0xf593b5ff
	.word	0xf3fa0199
	.word	0x4f2b7e3a
	.word	0x8589ce18
	.word	0x9cf0aab7
	.word	0x60a9ec3d
	.word	0x38dd1c83
	.word	0x5e75e1a5
	.word	0xe7819f1e
	.word	0x971dcc6c
	.word	0x917f0b54
	.word	0xa4dcd94e
	.word	0xf92e3c66
	.word	0x8118d8d4
	.word	0xe3131f23
	.word	0xa3766627
	.word	0x7100ced5
	.word	0xbacce942
	.word	0xf7c6da36
	.word	0x8b5d8794
	.word	0x270ffac8
	.word	0xbfae2155
	.word	0x9160d344
	.word	0xaf0c971c
	.word	0x7be03dfa
	.word	0x73ca1274
	.word	0x10cb625c
	.word	0x89edbd82
	.word	0xa085c106
	.word	0xda1a8901
	.word	0xbfa2b805
	.word	0x47d52516
	.word	0x4c533d2a
	.word	0x5b1b78ce
	.word	0x236ac2a6
	.word	0xcf3b7d48
	.word	0x4e6afa4d
	.word	0xa76ebcd0
	.word	0x6d738628
	.word	0x8f64a37d
	.word	0x8b532942
	.word	0x27cf9e11
	.word	0xf1b8c9d9
	.word	0x1a078525
	.word	0x00ff1e4e
	.word	0x694355eb
	.word	0xec744093
	.word	0xcbc98f0d
	.word	0xe2d32fe7
	.word	0xd992ff72
	.word	0x7fe78f1c
	.word	0xf9313df1
	.word	0x4b413dbe
	.word	0xf7eeac32
t0_data_in_sp:
	.word	0x1c55d4d0
	.word	0x93d8a455
	.word	0x2df823ff
	.word	0x4f609019
	.word	0xb97a9a7d
	.word	0x6ee1f994
	.word	0x74809ed7
	.word	0xcfb278b6
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffffb
	.word	0x00000010
	.word	0x00000018
	.word	0xfffffff0
	.word	t0_data_in_fp
	.word	0x5d71818c
	.word	0x8bb469d6
	.word	0x180b4840
	.word	0xf3a3891d
	.word	0x6089b470
	.word	0x7ef7c57b
	.word	0xb7fce8a1
	.word	0x30ffbb38
	.word	0x9dddf56c
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
	.word   	0xc86c657b	! [%fp - 0xc]
	.word   	0xf98bbdc9	! [%fp - 0x8]
	.word   	0x32159df6	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x9cbbd206
	.word	0x49ebab80
	.word	0x687d9317
	.word	0x945861a0
	.word	0x00f0f957
	.word	0x4d6cc38c
	.word	0xf9eda500
	.word	0xc172a731
	.word	0xe8f93bdb
	.word	0xa1e3093d
	.word	0x78a8d6fe
	.word	0x3ff2b13d
	.word	0xc56c3489
	.word	0x1146fd51
	.word	0xa142d4c7
	.word	0x580e3f0e
	.word	0xb473ef23
	.word	0x18fa8f6d
	.word	0xb7bf92c2
	.word	0x1926760f
	.word	0x3ed71fce
	.word	0x2981c019
	.word	0x5e6fe1b6
	.word	0x44567d6d
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x76c50000)
.seg "data"
t0_data_in_area0_start:
.skip 5376
t0_data_in_area0_begin:
	.word	0x09b6bfe5	! t0_data_in_area0-0x20
	.word	0x1a94df0f	! t0_data_in_area0-0x1c
	.word	0xc45709c4	! t0_data_in_area0-0x18
	.word	0xc7ddaffa	! t0_data_in_area0-0x14
	.word	0x81c82409	! t0_data_in_area0-0x10
	.word	0xf521e9b5	! t0_data_in_area0-0xc
	.word	0x7c5aa097	! t0_data_in_area0-0x8
	.word	0xe8e08855	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xdfd1df7c	! t0_data_in_area0+0x0
	.word	0x7a26cde6	! t0_data_in_area0+0x4
	.word	0x84dd0ed9	! t0_data_in_area0+0x8
	.word	0xf309ab48	! t0_data_in_area0+0xc
	.word	0xebc308af	! t0_data_in_area0+0x10
	.word	0xaba694f8	! t0_data_in_area0+0x14
	.word	0xfc7678e8	! t0_data_in_area0+0x18
	.word	0xea46b470	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 2752
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x2919a000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x2921b319	! t0_data_in_shm_area+0x0 (t0)
	.word	0x2097bafa	! t0_data_in_shm_area+0x4 (t0)
	.word	0x6b86fec9	! t0_data_in_shm_area+0x8 (t0)
	.word	0xd072a923	! t0_data_in_shm_area+0xc (t0)
	.word	0x4606b249	! t0_data_in_shm_area+0x10 (t0)
	.word	0xa5ca363d	! t0_data_in_shm_area+0x14 (t0)
	.word	0x5698875c	! t0_data_in_shm_area+0x18 (t0)
	.word	0x417a358d	! t0_data_in_shm_area+0x1c (t0)
	.word	0xbaa9fa3e	! t0_data_in_shm_area+0x20 (t0)
	.word	0xf0a7f315	! t0_data_in_shm_area+0x24 (t0)
	.word	0x5a358ad1	! t0_data_in_shm_area+0x28 (t0)
	.word	0x82a4181c	! t0_data_in_shm_area+0x2c (t0)
	.word	0x13e430f6	! t0_data_in_shm_area+0x30 (t0)
	.word	0x4d9ac7e0	! t0_data_in_shm_area+0x34 (t0)
	.word	0x713d905a	! t0_data_in_shm_area+0x38 (t0)
	.word	0x576a5f1e	! t0_data_in_shm_area+0x3c (t0)
	.word	0xcc3f4544	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xd70f2547	! t0_data_in_shm_area+0x44
	.word	0x42175322	! t0_data_in_shm_area+0x48
	.word	0x95f75ca7	! t0_data_in_shm_area+0x4c
	.word	0x56791ee6	! t0_data_in_shm_area+0x50
	.word	0x03bb06c3	! t0_data_in_shm_area+0x54
	.word	0xa0abc27c	! t0_data_in_shm_area+0x58
	.word	0x492374b7	! t0_data_in_shm_area+0x5c
	.word	0xdef8bbd6	! t0_data_in_shm_area+0x60
	.word	0x1f44e763	! t0_data_in_shm_area+0x64
	.word	0x8a14515f	! t0_data_in_shm_area+0x68
	.word	0x4bff299c	! t0_data_in_shm_area+0x6c
	.word	0xb0e74ee0	! t0_data_in_shm_area+0x70
	.word	0x6fdebecb	! t0_data_in_shm_area+0x74
	.word	0x1e9a4912	! t0_data_in_shm_area+0x78
	.word	0x75c70a95	! t0_data_in_shm_area+0x7c
	.word	0x4ca43374	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0x92254a7f	! t0_data_in_shm_area+0x84
	.word	0xde4c1323	! t0_data_in_shm_area+0x88
	.word	0x4ad568b8	! t0_data_in_shm_area+0x8c
	.word	0x6163cabd	! t0_data_in_shm_area+0x90
	.word	0xa2d42761	! t0_data_in_shm_area+0x94
	.word	0x3748ae9d	! t0_data_in_shm_area+0x98
	.word	0x81fff615	! t0_data_in_shm_area+0x9c
	.word	0xa03695f1	! t0_data_in_shm_area+0xa0
	.word	0x97e37f78	! t0_data_in_shm_area+0xa4
	.word	0x4a30c479	! t0_data_in_shm_area+0xa8
	.word	0xb40db31a	! t0_data_in_shm_area+0xac
	.word	0xf4b721ea	! t0_data_in_shm_area+0xb0
	.word	0x28ac4ff2	! t0_data_in_shm_area+0xb4
	.word	0x5c300f54	! t0_data_in_shm_area+0xb8
	.word	0x0ed3ce38	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x0434a000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x9027ce5d          ! %f0
	.word	0xb6942f98          ! %f1
	.word	0x5c13cc66          ! %f2
	.word	0xfa619bed          ! %f3
	.word	0x9902dbf2          ! %f4
	.word	0x4ae032a0          ! %f5
	.word	0x20fe5d2c          ! %f6
	.word	0xcefd3d01          ! %f7
	.word	0x697d4a58          ! %f8
	.word	0xd59b0aac          ! %f9
	.word	0x9311662b          ! %f10
	.word	0x319e19c4          ! %f11
	.word	0x2fda952b          ! %f12
	.word	0xed50a7f8          ! %f13
	.word	0x365037bc          ! %f14
	.word	0x442f94ee          ! %f15
	.word	0x35b7b6cc          ! %f16
	.word	0x81f745cf          ! %f17
	.word	0xcbfecb39          ! %f18
	.word	0xdadc72fb          ! %f19
	.word	0x8f28e865          ! %f20
	.word	0xa2cdc440          ! %f21
	.word	0x20d5ac9b          ! %f22
	.word	0x8742acfb          ! %f23
	.word	0xa2a4de2a          ! %f24
	.word	0x3c596911          ! %f25
	.word	0x66585a64          ! %f26
	.word	0x5a911ca6          ! %f27
	.word	0x72b103e2          ! %f28
	.word	0x76ca3bf3          ! %f29
	.word	0xa6573fbf          ! %f30
	.word	0xabcb55b3          ! %f31
	.word	0x2f767da5          ! %f32
	.word	0x3dcc71f7          ! %f33
	.word	0x6494ace4          ! %f34
	.word	0xd6614069          ! %f35
	.word	0x6a9ff0e7          ! %f36
	.word	0x60409c40          ! %f37
	.word	0xc01671c1          ! %f38
	.word	0x820d4975          ! %f39
	.word	0x3f5c59b4          ! %f40
	.word	0xb7bb8dfa          ! %f41
	.word	0xc223fed6          ! %f42
	.word	0xa0c53afe          ! %f43
	.word	0x4b63703d          ! %f44
	.word	0x304a2d8a          ! %f45
	.word	0x8e8b3060          ! %f46
	.word	0x47b712f6          ! %f47
	.word	0xa89c6292          ! %f48
	.word	0x1804a506          ! %f49
	.word	0xc5c427b9          ! %f50
	.word	0xce0c6ab3          ! %f51
	.word	0x69cfe6b0          ! %f52
	.word	0x46bfa5e7          ! %f53
	.word	0x302ed6fe          ! %f54
	.word	0xf4c443bd          ! %f55
	.word	0xebdae8be          ! %f56
	.word	0xd7e1b3fd          ! %f57
	.word	0x302b22f2          ! %f58
	.word	0x1f9c4de9          ! %f59
	.word	0x98675993          ! %f60
	.word	0xf64daba2          ! %f61
	.word	0x1976bf21          ! %f62
	.word	0x04fffaa6          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x4a8       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xccc415b6          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x078e3b51          ! %o0
	.word	0xe0f3e4ef          ! %o1
	.word	0x74ab5468          ! %o2
	.word	0xcfc4afc4          ! %o3
	.word	0xd4e4c77f          ! %o4
	.word	0xdebf6860          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x4384e17c          ! %l0
	.word	0xabb2f732          ! %l1
	.word	0x654a2848          ! %l2
	.word	0x7384f196          ! %l3
	.word	0xe2d37b3b          ! %l4
	.word	0x84a727ba          ! %l5
	.word	0x6e6060f3          ! %l6
	.word	0x73e1ba60          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xffffffef          ! %i2 (byte offset)
	.word	0xffffffe8          ! %i3 (halfword offset)
	.word	0x00000004          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0xc83103c3          ! %y
	.word	0x0000000f          ! %icc (nzvc)
	.word	0x40000f2a          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x3637a000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xb33a8847
	.word	0xd3967b3e
	.word	0xc66d2a28
	.word	0xf72efdf2
	.word	0xb3d4dc18
	.word	0xbe17f25d
	.word	0x19a567b6
	.word	0xca8f5635
	.word	0xc15c18cc
	.word	0x9b2e1929
	.word	0xf5d7e076
	.word	0x2b457b32
	.word	0xb2db2d68
	.word	0xb6662ffd
	.word	0x425c58bb
	.word	0x929bd6a3
	.word	0xfcbe58ee
	.word	0xc9ca5a40
	.word	0x336c28fc
	.word	0x21ec7730
	.word	0x765907bb
	.word	0x2cf8b9fa
	.word	0xde2ff3d8
	.word	0x41af2828
	.word	0xae21a330
	.word	0x125830a9
	.word	0x48e4385a
	.word	0x2b24d06e
	.word	0x9fe83794
	.word	0xdb97d955
	.word	0xcf3e447d
	.word	0x62e54cb1
	.word	0x95371439
	.word	0x4be38fe2
	.word	0x4dcf4bf2
	.word	0x2d3438df
	.word	0x295ac9dc
	.word	0xaa0919a4
	.word	0xcebba720
	.word	0x4a545cda
	.word	0xba812b51
	.word	0x946ec338
	.word	0xb2f87e6b
	.word	0xc858b06c
	.word	0xc635345f
	.word	0x45758791
	.word	0x5da265b8
	.word	0x9c6d2a78
	.word	0xb377fae8
	.word	0x8dee1451
	.word	0xcf23ac31
	.word	0x9e80cf73
	.word	0xae150e4d
	.word	0xade93f59
	.word	0xfc096445
	.word	0xc2ddb311
	.word	0x67d2e910
	.word	0x17a1c1a3
	.word	0xdbd267f2
	.word	0x4cd2e142
	.word	0xab0658ba
	.word	0xc5c64b4e
	.word	0x8ef3dd46
	.word	0xaf5f625f
	.word	0xa119fffe
	.word	0x334844fa
	.word	0xb502ff22
	.word	0xd40ccea0
	.word	0xe509571e
	.word	0xd044d256
	.word	0x44ac2e41
	.word	0x301b24d2
	.word	0xefe0ce8d
	.word	0x7ae2e9f6
	.word	0x5b1b8e78
	.word	0x0406d845
	.word	0x0a4af7d5
	.word	0x955a9669
	.word	0x77fbb43f
	.word	0x248d4a0a
	.word	0xbc4cd8ba
	.word	0xa906b48a
	.word	0x2a73266f
	.word	0xfde3215e
	.word	0x21d1cc9f
	.word	0x92a3c316
	.word	0x0ad1b84c
	.word	0x15133760
	.word	0xa9c99829
	.word	0x3af3977f
	.word	0xf82affc6
	.word	0x07b40a0a
	.word	0x8ca19322
	.word	0x3a270bff
	.word	0x712b6bfb
	.word	0x0a8cea5e
	.word	0xd00c0c9f
	.word	0x20ebfaef
	.word	0xc849c000
	.word	0xbba359df
	.word	0x77974d63
	.word	0xc10f1b58
	.word	0x2d4ef5e1
	.word	0x06bc4b42
	.word	0xadc7dc85
	.word	0xc68692ca
	.word	0x9d4acde5
	.word	0x13e43a65
	.word	0x467fea51
	.word	0x69b3506c
	.word	0xceab8e16
	.word	0x294c4f80
	.word	0x23b8056c
	.word	0x79f48554
	.word	0xf593b5ff
	.word	0xf3fa0199
	.word	0x4f2b7e3a
	.word	0x8589ce18
	.word	0x9cf0aab7
	.word	0x60a9ec3d
	.word	0x38dd1c83
	.word	0x5e75e1a5
	.word	0xe7819f1e
	.word	0x971dcc6c
	.word	0x917f0b54
	.word	0xa4dcd94e
	.word	0xf92e3c66
	.word	0x8118d8d4
	.word	0xe3131f23
	.word	0xa3766627
	.word	0x7100ced5
	.word	0xbacce942
	.word	0xf7c6da36
	.word	0x8b5d8794
	.word	0x270ffac8
	.word	0xbfae2155
	.word	0x9160d344
	.word	0xaf0c971c
	.word	0x7be03dfa
	.word	0x73ca1274
	.word	0x10cb625c
	.word	0x89edbd82
	.word	0xa085c106
	.word	0xda1a8901
	.word	0xbfa2b805
	.word	0x47d52516
	.word	0x4c533d2a
	.word	0x5b1b78ce
	.word	0x236ac2a6
	.word	0xcf3b7d48
	.word	0x4e6afa4d
	.word	0xa76ebcd0
	.word	0x6d738628
	.word	0x8f64a37d
	.word	0x8b532942
	.word	0x27cf9e11
	.word	0xf1b8c9d9
	.word	0x1a078525
	.word	0x00ff1e4e
	.word	0x694355eb
	.word	0xec744093
	.word	0xcbc98f0d
	.word	0xe2d32fe7
	.word	0xd992ff72
	.word	0x7fe78f1c
	.word	0xf9313df1
	.word	0x4b413dbe
	.word	0xf7eeac32
t0_data_exp_sp:
	.word	0x1c55d4d0
	.word	0x93d8a455
	.word	0x2df823ff
	.word	0x4f609019
	.word	0xb97a9a7d
	.word	0x6ee1f994
	.word	0x74809ed7
	.word	0xcfb278b6
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffffb
	.word	0x00000010
	.word	0x00000018
	.word	0xfffffff0
	.word	t0_data_exp_fp
	.word	0x5d71818c
	.word	0x8bb469d6
	.word	0x180b4840
	.word	0xf3a3891d
	.word	0x6089b470
	.word	0x7ef7c57b
	.word	0xb7fce8a1
	.word	0x30ffbb38
	.word	0x9dddf56c
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
	.word   	0xc86c657b	! [%fp - 0xc]
	.word   	0xf98bbdc9	! [%fp - 0x8]
	.word   	0x32159df6	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x9cbbd206
	.word	0x49ebab80
	.word	0x687d9317
	.word	0x945861a0
	.word	0x00f0f957
	.word	0x4d6cc38c
	.word	0xf9eda500
	.word	0xc172a731
	.word	0xe8f93bdb
	.word	0xa1e3093d
	.word	0x78a8d6fe
	.word	0x3ff2b13d
	.word	0xc56c3489
	.word	0x1146fd51
	.word	0xa142d4c7
	.word	0x580e3f0e
	.word	0xb473ef23
	.word	0x18fa8f6d
	.word	0xb7bf92c2
	.word	0x1926760f
	.word	0x3ed71fce
	.word	0x2981c019
	.word	0x5e6fe1b6
	.word	0x44567d6d
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x6a9f4000)
.seg "data"
t0_data_exp_area0_start:
.skip 5376
t0_data_exp_area0_begin:
	.word	0x09b6bfe5	! t0_data_exp_area0-0x20
	.word	0x1a94df0f	! t0_data_exp_area0-0x1c
	.word	0xc45709c4	! t0_data_exp_area0-0x18
	.word	0xc7ddaffa	! t0_data_exp_area0-0x14
	.word	0x81c82409	! t0_data_exp_area0-0x10
	.word	0xf521e9b5	! t0_data_exp_area0-0xc
	.word	0x7c5aa097	! t0_data_exp_area0-0x8
	.word	0xe8e08855	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xdfd1df7c	! t0_data_exp_area0+0x0
	.word	0x7a26cde6	! t0_data_exp_area0+0x4
	.word	0x84dd0ed9	! t0_data_exp_area0+0x8
	.word	0xf309ab48	! t0_data_exp_area0+0xc
	.word	0xebc308af	! t0_data_exp_area0+0x10
	.word	0xaba694f8	! t0_data_exp_area0+0x14
	.word	0xfc7678e8	! t0_data_exp_area0+0x18
	.word	0xea46b470	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 2752
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x19a50000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x2921b319	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x2097bafa	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x6b86fec9	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xd072a923	! t0_data_exp_shm_area+0xc (t0)
	.word	0x4606b249	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xa5ca363d	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x5698875c	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x417a358d	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xbaa9fa3e	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xf0a7f315	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x5a358ad1	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x82a4181c	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x13e430f6	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x4d9ac7e0	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x713d905a	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x576a5f1e	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xcc3f4544	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xd70f2547	! t0_data_exp_shm_area+0x44
	.word	0x42175322	! t0_data_exp_shm_area+0x48
	.word	0x95f75ca7	! t0_data_exp_shm_area+0x4c
	.word	0x56791ee6	! t0_data_exp_shm_area+0x50
	.word	0x03bb06c3	! t0_data_exp_shm_area+0x54
	.word	0xa0abc27c	! t0_data_exp_shm_area+0x58
	.word	0x492374b7	! t0_data_exp_shm_area+0x5c
	.word	0xdef8bbd6	! t0_data_exp_shm_area+0x60
	.word	0x1f44e763	! t0_data_exp_shm_area+0x64
	.word	0x8a14515f	! t0_data_exp_shm_area+0x68
	.word	0x4bff299c	! t0_data_exp_shm_area+0x6c
	.word	0xb0e74ee0	! t0_data_exp_shm_area+0x70
	.word	0x6fdebecb	! t0_data_exp_shm_area+0x74
	.word	0x1e9a4912	! t0_data_exp_shm_area+0x78
	.word	0x75c70a95	! t0_data_exp_shm_area+0x7c
	.word	0x4ca43374	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0x92254a7f	! t0_data_exp_shm_area+0x84
	.word	0xde4c1323	! t0_data_exp_shm_area+0x88
	.word	0x4ad568b8	! t0_data_exp_shm_area+0x8c
	.word	0x6163cabd	! t0_data_exp_shm_area+0x90
	.word	0xa2d42761	! t0_data_exp_shm_area+0x94
	.word	0x3748ae9d	! t0_data_exp_shm_area+0x98
	.word	0x81fff615	! t0_data_exp_shm_area+0x9c
	.word	0xa03695f1	! t0_data_exp_shm_area+0xa0
	.word	0x97e37f78	! t0_data_exp_shm_area+0xa4
	.word	0x4a30c479	! t0_data_exp_shm_area+0xa8
	.word	0xb40db31a	! t0_data_exp_shm_area+0xac
	.word	0xf4b721ea	! t0_data_exp_shm_area+0xb0
	.word	0x28ac4ff2	! t0_data_exp_shm_area+0xb4
	.word	0x5c300f54	! t0_data_exp_shm_area+0xb8
	.word	0x0ed3ce38	! t0_data_exp_shm_area+0xbc
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



