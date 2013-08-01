/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_27_1_2004_0_22.s
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
#define T0_KAOS_SEED          d1e9ab174e57
#define T0_KAOS_ICOUNT        2513
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    4288
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2515

#define T0_KAOS_BOOT_VA                  0x2f4f4000
#define T0_KAOS_BOOT_PA                  0x000000000142a000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x34d9c000
#define T0_KAOS_STARTUP_PA               0x0000000002f3a000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x6e7de000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000005c9c000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x41312000
#define T0_KAOS_DONE_PA                  0x0000000006e5c000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x10320000
#define T0_KAOS_KTBL_PA                  0x0000000009576000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x10308000
#define T0_KAOS_SUBR0_PA                 0x000000000a2d2000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x258aa000
#define T0_KAOS_SUBR1_PA                 0x000000000cb84000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x1035c000
#define T0_KAOS_SUBR2_PA                 0x000000000ea5c000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x10266000
#define T0_KAOS_SUBR3_PA                 0x0000000010374000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x4eb86000
#define T0_KAOS_EXP_REGS_PA              0x000000001387a000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x29e62000
#define T0_KAOS_RUN_REGS_PA              0x0000000015976000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x67b38000
#define T0_KAOS_EXP_STACK_PA             0x0000000017a10000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x1497e000
#define T0_KAOS_RUN_STACK_PA             0x0000000018092000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x48be8000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a470000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x47378000
#define T0_KAOS_RUN_AREA0_PA             0x000000001df86000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x7ba76000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000480000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x6898a000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000f6a000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xce37968e
#define T0_KAOS_RANVAL_01     0x7793e544
#define T0_KAOS_RANVAL_02     0x2c1e8097
#define T0_KAOS_RANVAL_03     0x0399de4d
#define T0_KAOS_RANVAL_04     0x8923f0c7
#define T0_KAOS_RANVAL_05     0x46aa2347
#define T0_KAOS_RANVAL_06     0xc3463a66
#define T0_KAOS_RANVAL_07     0x03a593c2
#define T0_KAOS_RANVAL_08     0x03255c37
#define T0_KAOS_RANVAL_09     0x5f7fae91
#define T0_KAOS_RANVAL_0a     0xd9d4cef4
#define T0_KAOS_RANVAL_0b     0xfb5b74bf
#define T0_KAOS_RANVAL_0c     0x431648b9
#define T0_KAOS_RANVAL_0d     0x702de9b3
#define T0_KAOS_RANVAL_0e     0x1b920e02
#define T0_KAOS_RANVAL_0f     0x3a322012
#define T0_KAOS_RANVAL_10     0x1bf5fd1f
#define T0_KAOS_RANVAL_11     0x5baf6227
#define T0_KAOS_RANVAL_12     0x5b5fcf48
#define T0_KAOS_RANVAL_13     0x3b5fd5dc
#define T0_KAOS_RANVAL_14     0x9018a2bd
#define T0_KAOS_RANVAL_15     0xb55d4f80
#define T0_KAOS_RANVAL_16     0x43e1d398
#define T0_KAOS_RANVAL_17     0x76cbabef
#define T0_KAOS_RANVAL_18     0x924e052e
#define T0_KAOS_RANVAL_19     0x8f6951e1
#define T0_KAOS_RANVAL_1a     0xcd601442
#define T0_KAOS_RANVAL_1b     0xcded335f
#define T0_KAOS_RANVAL_1c     0x4c4e0a52
#define T0_KAOS_RANVAL_1d     0x069023b3
#define T0_KAOS_RANVAL_1e     0x2e7424ba
#define T0_KAOS_RANVAL_1f     0x06886353
#define T0_KAOS_RANVAL_20     0x89262695
#define T0_KAOS_RANVAL_21     0x0fd93292
#define T0_KAOS_RANVAL_22     0x32f88a78
#define T0_KAOS_RANVAL_23     0x95bcdd1b
#define T0_KAOS_RANVAL_24     0xfc535177
#define T0_KAOS_RANVAL_25     0xf2025387
#define T0_KAOS_RANVAL_26     0xeabb2f1f
#define T0_KAOS_RANVAL_27     0xc5bcdd87
#define T0_KAOS_RANVAL_28     0xfee83e47
#define T0_KAOS_RANVAL_29     0x7276067c
#define T0_KAOS_RANVAL_2a     0xd5e250e1
#define T0_KAOS_RANVAL_2b     0xa0f16f76
#define T0_KAOS_RANVAL_2c     0x2bd7dd31
#define T0_KAOS_RANVAL_2d     0xb89dfcec
#define T0_KAOS_RANVAL_2e     0x1a059521
#define T0_KAOS_RANVAL_2f     0x7b96b3ad
#define T0_KAOS_RANVAL_30     0x6f78687b
#define T0_KAOS_RANVAL_31     0xd94ad7d9
#define T0_KAOS_RANVAL_32     0xc6f32159
#define T0_KAOS_RANVAL_33     0xfa3451e9
#define T0_KAOS_RANVAL_34     0x94d3820b
#define T0_KAOS_RANVAL_35     0xaa055103
#define T0_KAOS_RANVAL_36     0xcf32de3d
#define T0_KAOS_RANVAL_37     0xed036736
#define T0_KAOS_RANVAL_38     0xd19c252c
#define T0_KAOS_RANVAL_39     0x28ac4356
#define T0_KAOS_RANVAL_3a     0x84d84920
#define T0_KAOS_RANVAL_3b     0xb7948581
#define T0_KAOS_RANVAL_3c     0xffeb7091
#define T0_KAOS_RANVAL_3d     0x620646a3
#define T0_KAOS_RANVAL_3e     0x39557797
#define T0_KAOS_RANVAL_3f     0x861d986c
#define T0_KAOS_RANVAL_40     0x17718c99
#define T0_KAOS_RANVAL_41     0x3924d293
#define T0_KAOS_RANVAL_42     0x0508315b
#define T0_KAOS_RANVAL_43     0xa000c361
#define T0_KAOS_RANVAL_44     0x8ed831d4
#define T0_KAOS_RANVAL_45     0xdce21cd7
#define T0_KAOS_RANVAL_46     0xd3644473
#define T0_KAOS_RANVAL_47     0x669a8ce9
#define T0_KAOS_RANVAL_48     0xdde893c5
#define T0_KAOS_RANVAL_49     0xa7a226a4
#define T0_KAOS_RANVAL_4a     0x192c7792
#define T0_KAOS_RANVAL_4b     0x4176eb3e
#define T0_KAOS_RANVAL_4c     0xa9deb3e9
#define T0_KAOS_RANVAL_4d     0xdb12ad5e
#define T0_KAOS_RANVAL_4e     0x355dbebd
#define T0_KAOS_RANVAL_4f     0xf2f2061e
#define T0_KAOS_RANVAL_50     0xc37060f8
#define T0_KAOS_RANVAL_51     0x5d2cf293
#define T0_KAOS_RANVAL_52     0x71869630
#define T0_KAOS_RANVAL_53     0xbb42c1e1
#define T0_KAOS_RANVAL_54     0x19ae666a
#define T0_KAOS_RANVAL_55     0xb8778f2a
#define T0_KAOS_RANVAL_56     0x0d7ea782
#define T0_KAOS_RANVAL_57     0xc93a67ce
#define T0_KAOS_RANVAL_58     0xf24ab03c
#define T0_KAOS_RANVAL_59     0x06b5c5db
#define T0_KAOS_RANVAL_5a     0x4b111d07
#define T0_KAOS_RANVAL_5b     0xd0e5ffa9
#define T0_KAOS_RANVAL_5c     0xef3666f3
#define T0_KAOS_RANVAL_5d     0xae1508e2
#define T0_KAOS_RANVAL_5e     0x3a6e4775
#define T0_KAOS_RANVAL_5f     0x1df32e90
#define T0_KAOS_RANVAL_60     0xc73747e0
#define T0_KAOS_RANVAL_61     0x7cc0a6ee
#define T0_KAOS_RANVAL_62     0x2e5f79c9
#define T0_KAOS_RANVAL_63     0x1383af06
#define T0_KAOS_RANVAL_64     0xbb43bda6
#define T0_KAOS_RANVAL_65     0x70ced35f
#define T0_KAOS_RANVAL_66     0x79823f6b
#define T0_KAOS_RANVAL_67     0x1237b650
#define T0_KAOS_RANVAL_68     0x21697cf9
#define T0_KAOS_RANVAL_69     0x89f97db1
#define T0_KAOS_RANVAL_6a     0x027e5090
#define T0_KAOS_RANVAL_6b     0x10e8daff
#define T0_KAOS_RANVAL_6c     0x3ffaa9a8
#define T0_KAOS_RANVAL_6d     0x42c8ac32
#define T0_KAOS_RANVAL_6e     0x9e7be8df
#define T0_KAOS_RANVAL_6f     0x8a1450ce
#define T0_KAOS_RANVAL_70     0xd4f9c7dc
#define T0_KAOS_RANVAL_71     0x96fb4dfb
#define T0_KAOS_RANVAL_72     0x1d566456
#define T0_KAOS_RANVAL_73     0x808c8dad
#define T0_KAOS_RANVAL_74     0x367cfda1
#define T0_KAOS_RANVAL_75     0xd856b81d
#define T0_KAOS_RANVAL_76     0xd461466f
#define T0_KAOS_RANVAL_77     0x66f7ac1d
#define T0_KAOS_RANVAL_78     0xed4568a6
#define T0_KAOS_RANVAL_79     0x80d44219
#define T0_KAOS_RANVAL_7a     0xe9540f7e
#define T0_KAOS_RANVAL_7b     0x58211ebe
#define T0_KAOS_RANVAL_7c     0xfb4f8c40
#define T0_KAOS_RANVAL_7d     0xe4a7b596
#define T0_KAOS_RANVAL_7e     0xf953845c
#define T0_KAOS_RANVAL_7f     0xcf7a8926
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
!    areaoffset     4288
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2515
!    code           10320000
!    entry          10320000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d1e9ab174e57
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

KTEXT_MODULE(t0_module_ktbl, 0x10320000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xc048a038	! t0_kref+0x0:   	ldsb	[%g2 + 0x38], %g0
	.word	0x81ae8a5a	! t0_kref+0x4:   	fcmpd	%fcc0, %f26, %f26
	.word	0xf1be5a5b	! t0_kref+0x8:   	stda	%f24, [%i1 + %i3]0xd2
	.word	0x80b6ac11	! t0_kref+0xc:   	orncc	%i2, 0xc11, %g0
	.word	0xee6e7fe6	! t0_kref+0x10:   	ldstub	[%i1 - 0x1a], %l7
	.word	0xd4167fe8	! t0_kref+0x14:   	lduh	[%i1 - 0x18], %o2
	.word	0xb7a01a3b	! t0_kref+0x18:   	fstoi	%f27, %f27
	call	1f
	.empty
	.word	0xa438000d	! t0_kref+0x20:   	xnor	%g0, %o5, %l2
	.word	0xb7a01a3b	! t0_kref+0x24:   	fstoi	%f27, %f27
	.word	0xf706601c	! t0_kref+0x28:   	ld	[%i1 + 0x1c], %f27
	.word	0xd5e61000	! t0_kref+0x2c:   	casa	[%i0]0x80, %g0, %o2
	.word	0x8083620b	! t0_kref+0x30:   	addcc	%o5, 0x20b, %g0
	.word	0xb7a000bb	! t0_kref+0x34:   	fnegs	%f27, %f27
	.word	0x9245c013	! t0_kref+0x38:   	addc	%l7, %l3, %o1
1:	.word	0x92dac009	! t0_kref+0x3c:   	smulcc	%o3, %o1, %o1
	.word	0x9b408000	! t0_kref+0x40:   	mov	%ccr, %o5
	.word	0xac5d4013	! t0_kref+0x44:   	smul	%l5, %l3, %l6
	.word	0xee2e7fed	! t0_kref+0x48:   	stb	%l7, [%i1 - 0x13]
	.word	0xe56e2008	! t0_kref+0x4c:   	prefetch	%i0 + 8, 18
	.word	0xa252c013	! t0_kref+0x50:   	umul	%o3, %l3, %l1
	.word	0xaa26a175	! t0_kref+0x54:   	sub	%i2, 0x175, %l5
	.word	0x231c032b	! t0_kref+0x58:   	sethi	%hi(0x700cac00), %l1
	.word	0x96d03a04	! t0_kref+0x5c:   	umulcc	%g0, -0x5fc, %o3
	.word	0x81df800f	! t0_kref+0x60:   	flush	%fp + %o7
	.word	0xb7a0053b	! t0_kref+0x64:   	fsqrts	%f27, %f27
	.word	0xacdd8000	! t0_kref+0x68:   	smulcc	%l6, %g0, %l6
	.word	0xf7067fe0	! t0_kref+0x6c:   	ld	[%i1 - 0x20], %f27
	.word	0xe20e3fed	! t0_kref+0x70:   	ldub	[%i0 - 0x13], %l1
	.word	0x2327dc34	! t0_kref+0x74:   	sethi	%hi(0x9f70d000), %l1
	.word	0x9ebe8009	! t0_kref+0x78:   	xnorcc	%i2, %o1, %o7
	.word	0x36800006	! t0_kref+0x7c:   	bge,a	_kref+0x94
	.word	0x992de00b	! t0_kref+0x80:   	sll	%l7, 0xb, %o4
	.word	0xb7a0053b	! t0_kref+0x84:   	fsqrts	%f27, %f27
	.word	0x2b800006	! t0_kref+0x88:   	fbug,a	_kref+0xa0
	.word	0x9b400000	! t0_kref+0x8c:   	mov	%y, %o5
	.word	0xb7a0053b	! t0_kref+0x90:   	fsqrts	%f27, %f27
	.word	0xf5380018	! t0_kref+0x94:   	std	%f26, [%g0 + %i0]
	.word	0x23480006	! t0_kref+0x98:   	fbne,a,pt	%fcc0, _kref+0xb0
	.word	0xec08a037	! t0_kref+0x9c:   	ldub	[%g2 + 0x37], %l6
	.word	0xf53e001d	! t0_kref+0xa0:   	std	%f26, [%i0 + %i5]
	.word	0xe840a038	! t0_kref+0xa4:   	ldsw	[%g2 + 0x38], %l4
	.word	0xba103ff8	! t0_kref+0xa8:   	mov	0xfffffff8, %i5
	.word	0xda28a02a	! t0_kref+0xac:   	stb	%o5, [%g2 + 0x2a]
	.word	0xb5a6cd3b	! t0_kref+0xb0:   	fsmuld	%f27, %f27, %f26
	.word	0xa255b311	! t0_kref+0xb4:   	umul	%l6, -0xcef, %l1
	.word	0xf426401c	! t0_kref+0xb8:   	st	%i2, [%i1 + %i4]
	.word	0xb5ab405a	! t0_kref+0xbc:   	fmovdle	%fcc0, %f26, %f26
	.word	0x86102018	! t0_kref+0xc0:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0xc4:   	subcc	%g3, 1, %g3
	.word	0x2280001b	! t0_kref+0xc8:   	be,a	_kref+0x134
	.word	0xf700a004	! t0_kref+0xcc:   	ld	[%g2 + 4], %f27
	.word	0x2e800007	! t0_kref+0xd0:   	bvs,a	_kref+0xec
	.word	0xae5d0000	! t0_kref+0xd4:   	smul	%l4, %g0, %l7
	.word	0xb7a6c93b	! t0_kref+0xd8:   	fmuls	%f27, %f27, %f27
	.word	0xf700a020	! t0_kref+0xdc:   	ld	[%g2 + 0x20], %f27
	.word	0xb7a6c93b	! t0_kref+0xe0:   	fmuls	%f27, %f27, %f27
	.word	0xc807bfec	! t0_kref+0xe4:   	ld	[%fp - 0x14], %g4
	.word	0x81ae8ada	! t0_kref+0xe8:   	fcmped	%fcc0, %f26, %f26
	.word	0xb7a6c93b	! t0_kref+0xec:   	fmuls	%f27, %f27, %f27
	.word	0x81ae8ada	! t0_kref+0xf0:   	fcmped	%fcc0, %f26, %f26
	.word	0x81dd0019	! t0_kref+0xf4:   	flush	%l4 + %i1
	.word	0x9ea56c2d	! t0_kref+0xf8:   	subcc	%l5, 0xc2d, %o7
	.word	0x97400000	! t0_kref+0xfc:   	mov	%y, %o3
	.word	0x32bffff1	! t0_kref+0x100:   	bne,a	_kref+0xc4
	.word	0x8074fff7	! t0_kref+0x104:   	udiv	%l3, -0x9, %g0
	.word	0xee2e201d	! t0_kref+0x108:   	stb	%l7, [%i0 + 0x1d]
	.word	0xb5a689da	! t0_kref+0x10c:   	fdivd	%f26, %f26, %f26
	.word	0xae5a400d	! t0_kref+0x110:   	smul	%o1, %o5, %l7
	.word	0xd440a010	! t0_kref+0x114:   	ldsw	[%g2 + 0x10], %o2
	.word	0xe88e9040	! t0_kref+0x118:   	lduba	[%i2]0x82, %l4
	.word	0xb7a000bb	! t0_kref+0x11c:   	fnegs	%f27, %f27
	.word	0x81aeca3b	! t0_kref+0x120:   	fcmps	%fcc0, %f27, %f27
	.word	0xd0de1000	! t0_kref+0x124:   	ldxa	[%i0]0x80, %o0
	.word	0xe80e0000	! t0_kref+0x128:   	ldub	[%i0], %l4
	.word	0xb7a0053b	! t0_kref+0x12c:   	fsqrts	%f27, %f27
	.word	0x920b0000	! t0_kref+0x130:   	and	%o4, %g0, %o1
	.word	0x20480008	! t0_kref+0x134:   	bn,a,pt	%icc, _kref+0x154
	.word	0x9415bb17	! t0_kref+0x138:   	or	%l6, -0x4e9, %o2
	.word	0xa88cf8ea	! t0_kref+0x13c:   	andcc	%l3, -0x716, %l4
	.word	0xb5a689da	! t0_kref+0x140:   	fdivd	%f26, %f26, %f26
	.word	0xf53e6008	! t0_kref+0x144:   	std	%f26, [%i1 + 8]
	.word	0xe87e001c	! t0_kref+0x148:   	swap	[%i0 + %i4], %l4
	.word	0xb7a018da	! t0_kref+0x14c:   	fdtos	%f26, %f27
	.word	0xb7a6c8bb	! t0_kref+0x150:   	fsubs	%f27, %f27, %f27
	.word	0xae9a000a	! t0_kref+0x154:   	xorcc	%o0, %o2, %l7
	.word	0xe44e3ff5	! t0_kref+0x158:   	ldsb	[%i0 - 0xb], %l2
	.word	0xb7a0003b	! t0_kref+0x15c:   	fmovs	%f27, %f27
	call	SYM(t0_subr2)
	.word	0xb7a0053b	! t0_kref+0x164:   	fsqrts	%f27, %f27
	.word	0xb7a01a5a	! t0_kref+0x168:   	fdtoi	%f26, %f27
	.word	0x38480008	! t0_kref+0x16c:   	bgu,a,pt	%icc, _kref+0x18c
	.word	0x92b3751e	! t0_kref+0x170:   	orncc	%o5, -0xae2, %o1
	.word	0x96f5c009	! t0_kref+0x174:   	udivcc	%l7, %o1, %o3
	.word	0xb7a000bb	! t0_kref+0x178:   	fnegs	%f27, %f27
	.word	0x3c800007	! t0_kref+0x17c:   	bpos,a	_kref+0x198
	.word	0xe400a01c	! t0_kref+0x180:   	ld	[%g2 + 0x1c], %l2
	.word	0xa53a8014	! t0_kref+0x184:   	sra	%o2, %l4, %l2
	.word	0xa605000b	! t0_kref+0x188:   	add	%l4, %o3, %l3
	.word	0x9060331a	! t0_kref+0x18c:   	subc	%g0, -0xce6, %o0
	.word	0x9455000a	! t0_kref+0x190:   	umul	%l4, %o2, %o2
	.word	0xf53e7fe0	! t0_kref+0x194:   	std	%f26, [%i1 - 0x20]
	.word	0xb7a6c9bb	! t0_kref+0x198:   	fdivs	%f27, %f27, %f27
	.word	0xad32a017	! t0_kref+0x19c:   	srl	%o2, 0x17, %l6
	.word	0xd03e3ff8	! t0_kref+0x1a0:   	std	%o0, [%i0 - 8]
	.word	0x963b7053	! t0_kref+0x1a4:   	xnor	%o5, -0xfad, %o3
	.word	0xde0e6019	! t0_kref+0x1a8:   	ldub	[%i1 + 0x19], %o7
	call	SYM(t0_subr0)
	.word	0x9482000a	! t0_kref+0x1b0:   	addcc	%o0, %o2, %o2
	.word	0xaf16800a	! t0_kref+0x1b4:   	taddcctv	%i2, %o2, %l7
	.word	0x81d83e73	! t0_kref+0x1b8:   	flush	%g0 - 0x18d
	.word	0x9044c017	! t0_kref+0x1bc:   	addc	%l3, %l7, %o0
	.word	0xd03e2000	! t0_kref+0x1c0:   	std	%o0, [%i0]
	.word	0x81aeca3b	! t0_kref+0x1c4:   	fcmps	%fcc0, %f27, %f27
	.word	0x92733ea4	! t0_kref+0x1c8:   	udiv	%o4, -0x15c, %o1
	.word	0xb7a0053b	! t0_kref+0x1cc:   	fsqrts	%f27, %f27
	.word	0x9ea57912	! t0_kref+0x1d0:   	subcc	%l5, -0x6ee, %o7
	.word	0xaaaa4013	! t0_kref+0x1d4:   	andncc	%o1, %l3, %l5
	.word	0xb7a018da	! t0_kref+0x1d8:   	fdtos	%f26, %f27
	.word	0xe830a03e	! t0_kref+0x1dc:   	sth	%l4, [%g2 + 0x3e]
	.word	0x969dc014	! t0_kref+0x1e0:   	xorcc	%l7, %l4, %o3
	.word	0x29800007	! t0_kref+0x1e4:   	fbl,a	_kref+0x200
	.word	0xd810a032	! t0_kref+0x1e8:   	lduh	[%g2 + 0x32], %o4
	.word	0xd020a010	! t0_kref+0x1ec:   	st	%o0, [%g2 + 0x10]
	.word	0x32800004	! t0_kref+0x1f0:   	bne,a	_kref+0x200
	.word	0xac62000b	! t0_kref+0x1f4:   	subc	%o0, %o3, %l6
	.word	0x95352007	! t0_kref+0x1f8:   	srl	%l4, 0x7, %o2
	.word	0xb7a01a5a	! t0_kref+0x1fc:   	fdtoi	%f26, %f27
	.word	0xd600a03c	! t0_kref+0x200:   	ld	[%g2 + 0x3c], %o3
	.word	0x9b15e05b	! t0_kref+0x204:   	taddcctv	%l7, 0x5b, %o5
	.word	0xd068a024	! t0_kref+0x208:   	ldstub	[%g2 + 0x24], %o0
	.word	0xaa3a7557	! t0_kref+0x20c:   	xnor	%o1, -0xaa9, %l5
	.word	0xb7a0189b	! t0_kref+0x210:   	fitos	%f27, %f27
	.word	0xf706401c	! t0_kref+0x214:   	ld	[%i1 + %i4], %f27
	.word	0xe47e3fe0	! t0_kref+0x218:   	swap	[%i0 - 0x20], %l2
	.word	0x81ae8a5a	! t0_kref+0x21c:   	fcmpd	%fcc0, %f26, %f26
	.word	0xb5a688da	! t0_kref+0x220:   	fsubd	%f26, %f26, %f26
	.word	0xacd5b11e	! t0_kref+0x224:   	umulcc	%l6, -0xee2, %l6
	.word	0xf53f4019	! t0_kref+0x228:   	std	%f26, [%i5 + %i1]
	.word	0xea50a03e	! t0_kref+0x22c:   	ldsh	[%g2 + 0x3e], %l5
	.word	0x9ea27365	! t0_kref+0x230:   	subcc	%o1, -0xc9b, %o7
	.word	0xa6ba000b	! t0_kref+0x234:   	xnorcc	%o0, %o3, %l3
	.word	0xf706601c	! t0_kref+0x238:   	ld	[%i1 + 0x1c], %f27
	.word	0x81ae8ada	! t0_kref+0x23c:   	fcmped	%fcc0, %f26, %f26
	.word	0x9834c009	! t0_kref+0x240:   	orn	%l3, %o1, %o4
	.word	0x8135800a	! t0_kref+0x244:   	srl	%l6, %o2, %g0
	.word	0xb7a000bb	! t0_kref+0x248:   	fnegs	%f27, %f27
	.word	0x9b320015	! t0_kref+0x24c:   	srl	%o0, %l5, %o5
	.word	0xa8b20009	! t0_kref+0x250:   	orncc	%o0, %o1, %l4
	.word	0xac822017	! t0_kref+0x254:   	addcc	%o0, 0x17, %l6
	.word	0x3a800001	! t0_kref+0x258:   	bcc,a	_kref+0x25c
	.word	0xf1be580a	! t0_kref+0x25c:   	stda	%f24, [%i1 + %o2]0xc0
	.word	0xf51e6010	! t0_kref+0x260:   	ldd	[%i1 + 0x10], %f26
	.word	0xf7067ff0	! t0_kref+0x264:   	ld	[%i1 - 0x10], %f27
	.word	0x22480002	! t0_kref+0x268:   	be,a,pt	%icc, _kref+0x270
	.word	0xb7a018da	! t0_kref+0x26c:   	fdtos	%f26, %f27
	.word	0x3c480001	! t0_kref+0x270:   	bpos,a,pt	%icc, _kref+0x274
	.word	0xb7a6c93b	! t0_kref+0x274:   	fmuls	%f27, %f27, %f27
	.word	0xa8d54000	! t0_kref+0x278:   	umulcc	%l5, %g0, %l4
	.word	0xaaf2c015	! t0_kref+0x27c:   	udivcc	%o3, %l5, %l5
	.word	0x9e434016	! t0_kref+0x280:   	addc	%o5, %l6, %o7
	.word	0xec080019	! t0_kref+0x284:   	ldub	[%g0 + %i1], %l6
	.word	0xd03e7fe8	! t0_kref+0x288:   	std	%o0, [%i1 - 0x18]
	.word	0xb5a6895a	! t0_kref+0x28c:   	fmuld	%f26, %f26, %f26
	.word	0x90d5c000	! t0_kref+0x290:   	umulcc	%l7, %g0, %o0
	.word	0xf59f5059	! t0_kref+0x294:   	ldda	[%i5 + %i1]0x82, %f26
	.word	0x933b400c	! t0_kref+0x298:   	sra	%o5, %o4, %o1
	.word	0xda20a030	! t0_kref+0x29c:   	st	%o5, [%g2 + 0x30]
	.word	0xf51e3fe8	! t0_kref+0x2a0:   	ldd	[%i0 - 0x18], %f26
	.word	0x9eaa800b	! t0_kref+0x2a4:   	andncc	%o2, %o3, %o7
	.word	0xee16c019	! t0_kref+0x2a8:   	lduh	[%i3 + %i1], %l7
	.word	0xa305800c	! t0_kref+0x2ac:   	taddcc	%l6, %o4, %l1
	.word	0x81aeca3b	! t0_kref+0x2b0:   	fcmps	%fcc0, %f27, %f27
	.word	0xb7a000bb	! t0_kref+0x2b4:   	fnegs	%f27, %f27
	.word	0xd430a002	! t0_kref+0x2b8:   	sth	%o2, [%g2 + 2]
	.word	0xf720a00c	! t0_kref+0x2bc:   	st	%f27, [%g2 + 0xc]
	.word	0x80b57d34	! t0_kref+0x2c0:   	orncc	%l5, -0x2cc, %g0
	.word	0xe968a04d	! t0_kref+0x2c4:   	prefetch	%g2 + 0x4d, 20
	.word	0x36800001	! t0_kref+0x2c8:   	bge,a	_kref+0x2cc
	.word	0xec7f0019	! t0_kref+0x2cc:   	swap	[%i4 + %i1], %l6
	.word	0xf51e3ff8	! t0_kref+0x2d0:   	ldd	[%i0 - 8], %f26
	.word	0x9b400000	! t0_kref+0x2d4:   	mov	%y, %o5
	.word	0x81aecabb	! t0_kref+0x2d8:   	fcmpes	%fcc0, %f27, %f27
	.word	0xec40a014	! t0_kref+0x2dc:   	ldsw	[%g2 + 0x14], %l6
	.word	0xf700a000	! t0_kref+0x2e0:   	ld	[%g2], %f27
	.word	0xb5a6895a	! t0_kref+0x2e4:   	fmuld	%f26, %f26, %f26
	.word	0x28800008	! t0_kref+0x2e8:   	bleu,a	_kref+0x308
	.word	0xb7ab003b	! t0_kref+0x2ec:   	fmovsuge	%fcc0, %f27, %f27
	.word	0x9eb30017	! t0_kref+0x2f0:   	orncc	%o4, %l7, %o7
	.word	0x3a480007	! t0_kref+0x2f4:   	bcc,a,pt	%icc, _kref+0x310
	.word	0x90a56c5a	! t0_kref+0x2f8:   	subcc	%l5, 0xc5a, %o0
	.word	0xf700a008	! t0_kref+0x2fc:   	ld	[%g2 + 8], %f27
	.word	0xb7a01a3b	! t0_kref+0x300:   	fstoi	%f27, %f27
	.word	0xb7a6c93b	! t0_kref+0x304:   	fmuls	%f27, %f27, %f27
	.word	0xb7a0189b	! t0_kref+0x308:   	fitos	%f27, %f27
	.word	0x80bcfe20	! t0_kref+0x30c:   	xnorcc	%l3, -0x1e0, %g0
	.word	0xd2f81018	! t0_kref+0x310:   	swapa	[%g0 + %i0]0x80, %o1
	.word	0xb7a6c9bb	! t0_kref+0x314:   	fdivs	%f27, %f27, %f27
	.word	0xad3d201b	! t0_kref+0x318:   	sra	%l4, 0x1b, %l6
	.word	0xd808a009	! t0_kref+0x31c:   	ldub	[%g2 + 9], %o4
	.word	0x81580000	! t0_kref+0x320:   	flushw
	.word	0xd240a030	! t0_kref+0x324:   	ldsw	[%g2 + 0x30], %o1
	.word	0xb7a6c83b	! t0_kref+0x328:   	fadds	%f27, %f27, %f27
	.word	0x949a8016	! t0_kref+0x32c:   	xorcc	%o2, %l6, %o2
	.word	0xb6102008	! t0_kref+0x330:   	mov	0x8, %i3
	.word	0x953a6005	! t0_kref+0x334:   	sra	%o1, 0x5, %o2
	.word	0xeefe501c	! t0_kref+0x338:   	swapa	[%i1 + %i4]0x80, %l7
	.word	0x9abe8017	! t0_kref+0x33c:   	xnorcc	%i2, %l7, %o5
	.word	0xf53e6008	! t0_kref+0x340:   	std	%f26, [%i1 + 8]
	.word	0x81ae8a5a	! t0_kref+0x344:   	fcmpd	%fcc0, %f26, %f26
	.word	0xf7063fec	! t0_kref+0x348:   	ld	[%i0 - 0x14], %f27
	.word	0xa3400000	! t0_kref+0x34c:   	mov	%y, %l1
	.word	0xf59e5000	! t0_kref+0x350:   	ldda	[%i1]0x80, %f26
	.word	0xec6e2012	! t0_kref+0x354:   	ldstub	[%i0 + 0x12], %l6
	.word	0xc56e7ff0	! t0_kref+0x358:   	prefetch	%i1 - 0x10, 2
	.word	0xee30a018	! t0_kref+0x35c:   	sth	%l7, [%g2 + 0x18]
	.word	0xea50a010	! t0_kref+0x360:   	ldsh	[%g2 + 0x10], %l5
	.word	0xb7a01a5a	! t0_kref+0x364:   	fdtoi	%f26, %f27
	.word	0x9214e989	! t0_kref+0x368:   	or	%l3, 0x989, %o1
	.word	0xd448a006	! t0_kref+0x36c:   	ldsb	[%g2 + 6], %o2
	.word	0xa2400015	! t0_kref+0x370:   	addc	%g0, %l5, %l1
	.word	0xda463fe8	! t0_kref+0x374:   	ldsw	[%i0 - 0x18], %o5
	.word	0xf700a01c	! t0_kref+0x378:   	ld	[%g2 + 0x1c], %f27
	.word	0x28800008	! t0_kref+0x37c:   	bleu,a	_kref+0x39c
	.word	0xda00a03c	! t0_kref+0x380:   	ld	[%g2 + 0x3c], %o5
	call	SYM(t0_subr3)
	.word	0xea7e600c	! t0_kref+0x388:   	swap	[%i1 + 0xc], %l5
	.word	0x9846800d	! t0_kref+0x38c:   	addc	%i2, %o5, %o4
	.word	0xae6568ed	! t0_kref+0x390:   	subc	%l5, 0x8ed, %l7
	.word	0xa6adaf0b	! t0_kref+0x394:   	andncc	%l6, 0xf0b, %l3
	.word	0xa6a27505	! t0_kref+0x398:   	subcc	%o1, -0xafb, %l3
	.word	0xf726001c	! t0_kref+0x39c:   	st	%f27, [%i0 + %i4]
	sethi	%hi(2f), %o7
	.word	0xe40be3ec	! t0_kref+0x3a4:   	ldub	[%o7 + 0x3ec], %l2
	.word	0xa41ca00c	! t0_kref+0x3a8:   	xor	%l2, 0xc, %l2
	.word	0xe42be3ec	! t0_kref+0x3ac:   	stb	%l2, [%o7 + 0x3ec]
	.word	0x81dbe3ec	! t0_kref+0x3b0:   	flush	%o7 + 0x3ec
	.word	0xb7a0013b	! t0_kref+0x3b4:   	fabss	%f27, %f27
	.word	0xb7a0003b	! t0_kref+0x3b8:   	fmovs	%f27, %f27
	.word	0xd09e101d	! t0_kref+0x3bc:   	ldda	[%i0 + %i5]0x80, %o0
	.word	0xc048a034	! t0_kref+0x3c0:   	ldsb	[%g2 + 0x34], %g0
	.word	0x33800008	! t0_kref+0x3c4:   	fbe,a	_kref+0x3e4
	.word	0xb7a000bb	! t0_kref+0x3c8:   	fnegs	%f27, %f27
	.word	0xb7a018da	! t0_kref+0x3cc:   	fdtos	%f26, %f27
	.word	0x9eddc00b	! t0_kref+0x3d0:   	smulcc	%l7, %o3, %o7
	.word	0xec2e7ff2	! t0_kref+0x3d4:   	stb	%l6, [%i1 - 0xe]
	.word	0xf53e3fe8	! t0_kref+0x3d8:   	std	%f26, [%i0 - 0x18]
	.word	0x32800006	! t0_kref+0x3dc:   	bne,a	_kref+0x3f4
	.word	0xb5a6895a	! t0_kref+0x3e0:   	fmuld	%f26, %f26, %f26
	.word	0xb5a689da	! t0_kref+0x3e4:   	fdivd	%f26, %f26, %f26
	.word	0xb5a688da	! t0_kref+0x3e8:   	fsubd	%f26, %f26, %f26
2:	.word	0xb7a01a5a	! t0_kref+0x3ec:   	fdtoi	%f26, %f27
	.word	0xac52bd97	! t0_kref+0x3f0:   	umul	%o2, -0x269, %l6
	.word	0xd6d6101b	! t0_kref+0x3f4:   	ldsha	[%i0 + %i3]0x80, %o3
	.word	0x38800001	! t0_kref+0x3f8:   	bgu,a	_kref+0x3fc
	.word	0xa20cf097	! t0_kref+0x3fc:   	and	%l3, -0xf69, %l1
	.word	0xda56001b	! t0_kref+0x400:   	ldsh	[%i0 + %i3], %o5
	.word	0xb5a6885a	! t0_kref+0x404:   	faddd	%f26, %f26, %f26
	.word	0xb5a688da	! t0_kref+0x408:   	fsubd	%f26, %f26, %f26
	.word	0x81dd23e8	! t0_kref+0x40c:   	flush	%l4 + 0x3e8
	.word	0xb7a01a3b	! t0_kref+0x410:   	fstoi	%f27, %f27
	.word	0xb5a6cd3b	! t0_kref+0x414:   	fsmuld	%f27, %f27, %f26
	.word	0xc1ee1013	! t0_kref+0x418:   	prefetcha	%i0 + %l3, 0
	.word	0xe87f0019	! t0_kref+0x41c:   	swap	[%i4 + %i1], %l4
	.word	0xb5a0193b	! t0_kref+0x420:   	fstod	%f27, %f26
	.word	0xb7a0013b	! t0_kref+0x424:   	fabss	%f27, %f27
	.word	0x98424015	! t0_kref+0x428:   	addc	%o1, %l5, %o4
	.word	0xa852c000	! t0_kref+0x42c:   	umul	%o3, %g0, %l4
	.word	0x98832f84	! t0_kref+0x430:   	addcc	%o4, 0xf84, %o4
	.word	0x2d800006	! t0_kref+0x434:   	fbg,a	_kref+0x44c
	.word	0xb5a6cd3b	! t0_kref+0x438:   	fsmuld	%f27, %f27, %f26
	.word	0xaa3a4014	! t0_kref+0x43c:   	xnor	%o1, %l4, %l5
	.word	0xd228a005	! t0_kref+0x440:   	stb	%o1, [%g2 + 5]
	.word	0x90bdf868	! t0_kref+0x444:   	xnorcc	%l7, -0x798, %o0
	.word	0xa2037467	! t0_kref+0x448:   	add	%o5, -0xb99, %l1
	.word	0xa2ba8009	! t0_kref+0x44c:   	xnorcc	%o2, %o1, %l1
	.word	0x23800002	! t0_kref+0x450:   	fbne,a	_kref+0x458
	.word	0x2f025e07	! t0_kref+0x454:   	sethi	%hi(0x9781c00), %l7
	.word	0x9abe800c	! t0_kref+0x458:   	xnorcc	%i2, %o4, %o5
	.word	0xc36e0000	! t0_kref+0x45c:   	prefetch	%i0, 1
	.word	0xe44e4000	! t0_kref+0x460:   	ldsb	[%i1], %l2
	.word	0xa6feb856	! t0_kref+0x464:   	sdivcc	%i2, -0x7aa, %l3
	.word	0xd0163ffe	! t0_kref+0x468:   	lduh	[%i0 - 2], %o0
	.word	0xf720a01c	! t0_kref+0x46c:   	st	%f27, [%g2 + 0x1c]
	.word	0x24800005	! t0_kref+0x470:   	ble,a	_kref+0x484
	.word	0x8143c000	! t0_kref+0x474:   	stbar
	.word	0xf720a020	! t0_kref+0x478:   	st	%f27, [%g2 + 0x20]
	.word	0xb7a6c9bb	! t0_kref+0x47c:   	fdivs	%f27, %f27, %f27
	.word	0xa2e30009	! t0_kref+0x480:   	subccc	%o4, %o1, %l1
	.word	0xda4e600c	! t0_kref+0x484:   	ldsb	[%i1 + 0xc], %o5
	.word	0xb7a0003b	! t0_kref+0x488:   	fmovs	%f27, %f27
	.word	0xd40e7ff7	! t0_kref+0x48c:   	ldub	[%i1 - 9], %o2
	.word	0x80f2aadb	! t0_kref+0x490:   	udivcc	%o2, 0xadb, %g0
	.word	0xb7a01a3b	! t0_kref+0x494:   	fstoi	%f27, %f27
	.word	0x9fc10000	! t0_kref+0x498:   	call	%g4
	.word	0xa93a6005	! t0_kref+0x49c:   	sra	%o1, 0x5, %l4
	.word	0xb7a01a3b	! t0_kref+0x4a0:   	fstoi	%f27, %f27
	.word	0xaa2e800d	! t0_kref+0x4a4:   	andn	%i2, %o5, %l5
	.word	0xc568a006	! t0_kref+0x4a8:   	prefetch	%g2 + 6, 2
	.word	0x94dd6736	! t0_kref+0x4ac:   	smulcc	%l5, 0x736, %o2
	.word	0x110b113a	! t0_kref+0x4b0:   	sethi	%hi(0x2c44e800), %o0
	.word	0x9b400000	! t0_kref+0x4b4:   	mov	%y, %o5
	.word	0xa8068017	! t0_kref+0x4b8:   	add	%i2, %l7, %l4
	.word	0xaa320008	! t0_kref+0x4bc:   	orn	%o0, %o0, %l5
	.word	0x80334008	! t0_kref+0x4c0:   	orn	%o5, %o0, %g0
	.word	0xb7a0189b	! t0_kref+0x4c4:   	fitos	%f27, %f27
	.word	0x9675f610	! t0_kref+0x4c8:   	udiv	%l7, -0x9f0, %o3
	.word	0xd0262018	! t0_kref+0x4cc:   	st	%o0, [%i0 + 0x18]
	.word	0xe96e401b	! t0_kref+0x4d0:   	prefetch	%i1 + %i3, 20
	.word	0xaf03000b	! t0_kref+0x4d4:   	taddcc	%o4, %o3, %l7
	.word	0x92bd8013	! t0_kref+0x4d8:   	xnorcc	%l6, %l3, %o1
	.word	0xf726001c	! t0_kref+0x4dc:   	st	%f27, [%i0 + %i4]
	.word	0x001fffff	! t0_kref+0x4e0:   	illtrap	0x1fffff
	.word	0x31800005	! t0_kref+0x4e4:   	fba,a	_kref+0x4f8
	.word	0xd43e001d	! t0_kref+0x4e8:   	std	%o2, [%i0 + %i5]
	.word	0xb7a6c9bb	! t0_kref+0x4ec:   	fdivs	%f27, %f27, %f27
	.word	0xf51e4000	! t0_kref+0x4f0:   	ldd	[%i1], %f26
	.word	0xe8200019	! t0_kref+0x4f4:   	st	%l4, [%g0 + %i1]
	.word	0x9a334013	! t0_kref+0x4f8:   	orn	%o5, %l3, %o5
	.word	0x90723157	! t0_kref+0x4fc:   	udiv	%o0, -0xea9, %o0
	.word	0xc0f6501d	! t0_kref+0x500:   	stxa	%g0, [%i1 + %i5]0x80
	.word	0xc04e601a	! t0_kref+0x504:   	ldsb	[%i1 + 0x1a], %g0
	.word	0xb7a01a5a	! t0_kref+0x508:   	fdtoi	%f26, %f27
	.word	0xee48a015	! t0_kref+0x50c:   	ldsb	[%g2 + 0x15], %l7
	.word	0x9902800c	! t0_kref+0x510:   	taddcc	%o2, %o4, %o4
	.word	0x8143c000	! t0_kref+0x514:   	stbar
	.word	0xec6e001a	! t0_kref+0x518:   	ldstub	[%i0 + %i2], %l6
	.word	0x96582326	! t0_kref+0x51c:   	smul	%g0, 0x326, %o3
	.word	0xf7262014	! t0_kref+0x520:   	st	%f27, [%i0 + 0x14]
	.word	0x2c480004	! t0_kref+0x524:   	bneg,a,pt	%icc, _kref+0x534
	.word	0xf53e401d	! t0_kref+0x528:   	std	%f26, [%i1 + %i5]
	.word	0x9a92401a	! t0_kref+0x52c:   	orcc	%o1, %i2, %o5
	.word	0xee067ff4	! t0_kref+0x530:   	ld	[%i1 - 0xc], %l7
	.word	0x9a0b6c31	! t0_kref+0x534:   	and	%o5, 0xc31, %o5
	.word	0xaa82c00a	! t0_kref+0x538:   	addcc	%o3, %o2, %l5
	.word	0xe456201e	! t0_kref+0x53c:   	ldsh	[%i0 + 0x1e], %l2
	.word	0x20480007	! t0_kref+0x540:   	bn,a,pt	%icc, _kref+0x55c
	.word	0xc12e401c	! t0_kref+0x544:   	st	%fsr, [%i1 + %i4]
	.word	0xd20e7ff2	! t0_kref+0x548:   	ldub	[%i1 - 0xe], %o1
	.word	0xd9f6100d	! t0_kref+0x54c:   	casxa	[%i0]0x80, %o5, %o4
	.word	0x9080000d	! t0_kref+0x550:   	addcc	%g0, %o5, %o0
	.word	0x9a4277fd	! t0_kref+0x554:   	addc	%o1, -0x803, %o5
	.word	0xb7abc03b	! t0_kref+0x558:   	fmovso	%fcc0, %f27, %f27
	.word	0x9eb5ac75	! t0_kref+0x55c:   	orncc	%l6, 0xc75, %o7
	.word	0x9698294a	! t0_kref+0x560:   	xorcc	%g0, 0x94a, %o3
	.word	0x9433000d	! t0_kref+0x564:   	orn	%o4, %o5, %o2
	.word	0xb7a0189b	! t0_kref+0x568:   	fitos	%f27, %f27
	.word	0xa8d3001a	! t0_kref+0x56c:   	umulcc	%o4, %i2, %l4
	.word	0xac63221f	! t0_kref+0x570:   	subc	%o4, 0x21f, %l6
	.word	0x28800001	! t0_kref+0x574:   	bleu,a	_kref+0x578
	.word	0xb5ab805a	! t0_kref+0x578:   	fmovdule	%fcc0, %f26, %f26
	.word	0xb7a0053b	! t0_kref+0x57c:   	fsqrts	%f27, %f27
	.word	0xaaada88a	! t0_kref+0x580:   	andncc	%l6, 0x88a, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be1c0	! t0_kref+0x588:   	ldub	[%o7 + 0x1c0], %l2
	.word	0xa41ca00c	! t0_kref+0x58c:   	xor	%l2, 0xc, %l2
	.word	0xe42be1c0	! t0_kref+0x590:   	stb	%l2, [%o7 + 0x1c0]
	.word	0x81dbe1c0	! t0_kref+0x594:   	flush	%o7 + 0x1c0
	.word	0xb7a000bb	! t0_kref+0x598:   	fnegs	%f27, %f27
	.word	0xec0e001a	! t0_kref+0x59c:   	ldub	[%i0 + %i2], %l6
	.word	0xd410a012	! t0_kref+0x5a0:   	lduh	[%g2 + 0x12], %o2
	.word	0xb5a688da	! t0_kref+0x5a4:   	fsubd	%f26, %f26, %f26
	.word	0x98558009	! t0_kref+0x5a8:   	umul	%l6, %o1, %o4
	.word	0xa53b2008	! t0_kref+0x5ac:   	sra	%o4, 0x8, %l2
	.word	0xb7a0189b	! t0_kref+0x5b0:   	fitos	%f27, %f27
	.word	0xb7a6c93b	! t0_kref+0x5b4:   	fmuls	%f27, %f27, %f27
	.word	0xa65a7e9e	! t0_kref+0x5b8:   	smul	%o1, -0x162, %l3
	.word	0x2d800004	! t0_kref+0x5bc:   	fbg,a	_kref+0x5cc
2:	.word	0xea564000	! t0_kref+0x5c0:   	ldsh	[%i1], %l5
	.word	0x39800005	! t0_kref+0x5c4:   	fbuge,a	_kref+0x5d8
	.word	0x980d4017	! t0_kref+0x5c8:   	and	%l5, %l7, %o4
	.word	0xb7a6c93b	! t0_kref+0x5cc:   	fmuls	%f27, %f27, %f27
	call	SYM(t0_subr1)
	.word	0xa53d000b	! t0_kref+0x5d4:   	sra	%l4, %o3, %l2
	.word	0x92526e33	! t0_kref+0x5d8:   	umul	%o1, 0xe33, %o1
	.word	0xb7a6c9bb	! t0_kref+0x5dc:   	fdivs	%f27, %f27, %f27
	.word	0xd010a030	! t0_kref+0x5e0:   	lduh	[%g2 + 0x30], %o0
	call	SYM(t0_subr0)
	.word	0xf51e401d	! t0_kref+0x5e8:   	ldd	[%i1 + %i5], %f26
	.word	0xa66375d2	! t0_kref+0x5ec:   	subc	%o5, -0xa2e, %l3
	.word	0xe62e4000	! t0_kref+0x5f0:   	stb	%l3, [%i1]
	.word	0x24800005	! t0_kref+0x5f4:   	ble,a	_kref+0x608
	.word	0x969b67d3	! t0_kref+0x5f8:   	xorcc	%o5, 0x7d3, %o3
	.word	0xd43e0000	! t0_kref+0x5fc:   	std	%o2, [%i0]
	.word	0xd01e401d	! t0_kref+0x600:   	ldd	[%i1 + %i5], %o0
	.word	0xf7066000	! t0_kref+0x604:   	ld	[%i1], %f27
	.word	0xe24e3fe6	! t0_kref+0x608:   	ldsb	[%i0 - 0x1a], %l1
	.word	0xfb6e7ff8	! t0_kref+0x60c:   	prefetch	%i1 - 8, 29
	.word	0xb6103ff2	! t0_kref+0x610:   	mov	0xfffffff2, %i3
	.word	0xa48db45f	! t0_kref+0x614:   	andcc	%l6, -0xba1, %l2
	.word	0xaca03a61	! t0_kref+0x618:   	subcc	%g0, -0x59f, %l6
	.word	0xf7067ffc	! t0_kref+0x61c:   	ld	[%i1 - 4], %f27
	.word	0xae52000c	! t0_kref+0x620:   	umul	%o0, %o4, %l7
	.word	0x943e800b	! t0_kref+0x624:   	xnor	%i2, %o3, %o2
	.word	0xd4563fe0	! t0_kref+0x628:   	ldsh	[%i0 - 0x20], %o2
	.word	0xb7a0053b	! t0_kref+0x62c:   	fsqrts	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x630:   	fitos	%f27, %f27
	.word	0x9de3bfa0	! t0_kref+0x634:   	save	%sp, -0x60, %sp
	.word	0x9bee316c	! t0_kref+0x638:   	restore	%i0, -0xe94, %o5
	.word	0x27480008	! t0_kref+0x63c:   	fbul,a,pt	%fcc0, _kref+0x65c
	.word	0xb7a018da	! t0_kref+0x640:   	fdtos	%f26, %f27
	.word	0xab34c013	! t0_kref+0x644:   	srl	%l3, %l3, %l5
	.word	0xa29b4013	! t0_kref+0x648:   	xorcc	%o5, %l3, %l1
	.word	0xe27e600c	! t0_kref+0x64c:   	swap	[%i1 + 0xc], %l1
	.word	0xae46b8e5	! t0_kref+0x650:   	addc	%i2, -0x71b, %l7
	.word	0xb7a0189b	! t0_kref+0x654:   	fitos	%f27, %f27
	.word	0xee20a034	! t0_kref+0x658:   	st	%l7, [%g2 + 0x34]
	.word	0x9a0df0cc	! t0_kref+0x65c:   	and	%l7, -0xf34, %o5
	.word	0x983dae53	! t0_kref+0x660:   	xnor	%l6, 0xe53, %o4
	.word	0xf700a028	! t0_kref+0x664:   	ld	[%g2 + 0x28], %f27
	.word	0xee00a020	! t0_kref+0x668:   	ld	[%g2 + 0x20], %l7
	.word	0xb7a0053b	! t0_kref+0x66c:   	fsqrts	%f27, %f27
	.word	0xaab02e7a	! t0_kref+0x670:   	orncc	%g0, 0xe7a, %l5
	.word	0xaaaa4016	! t0_kref+0x674:   	andncc	%o1, %l6, %l5
	.word	0x94f58008	! t0_kref+0x678:   	udivcc	%l6, %o0, %o2
	.word	0xb5a688da	! t0_kref+0x67c:   	fsubd	%f26, %f26, %f26
	.word	0xfd6e6018	! t0_kref+0x680:   	prefetch	%i1 + 0x18, 30
	.word	0x9a16b98d	! t0_kref+0x684:   	or	%i2, -0x673, %o5
	.word	0xb7a018da	! t0_kref+0x688:   	fdtos	%f26, %f27
	.word	0x2e480001	! t0_kref+0x68c:   	bvs,a,pt	%icc, _kref+0x690
	.word	0xb7a6c9bb	! t0_kref+0x690:   	fdivs	%f27, %f27, %f27
	.word	0xb7a6c8bb	! t0_kref+0x694:   	fsubs	%f27, %f27, %f27
	.word	0xa3150008	! t0_kref+0x698:   	taddcctv	%l4, %o0, %l1
	.word	0xd5f6500a	! t0_kref+0x69c:   	casxa	[%i1]0x80, %o2, %o2
	.word	0xea28a02f	! t0_kref+0x6a0:   	stb	%l5, [%g2 + 0x2f]
	.word	0x9252001a	! t0_kref+0x6a4:   	umul	%o0, %i2, %o1
	.word	0xa40b6a0d	! t0_kref+0x6a8:   	and	%o5, 0xa0d, %l2
	.word	0xf700a01c	! t0_kref+0x6ac:   	ld	[%g2 + 0x1c], %f27
	.word	0xb7a0053b	! t0_kref+0x6b0:   	fsqrts	%f27, %f27
	.word	0x81aecabb	! t0_kref+0x6b4:   	fcmpes	%fcc0, %f27, %f27
	.word	0x92300009	! t0_kref+0x6b8:   	orn	%g0, %o1, %o1
	.word	0xb7a0053b	! t0_kref+0x6bc:   	fsqrts	%f27, %f27
	.word	0x9aa83464	! t0_kref+0x6c0:   	andncc	%g0, -0xb9c, %o5
	.word	0x9483759b	! t0_kref+0x6c4:   	addcc	%o5, -0xa65, %o2
	.word	0x81dbc01e	! t0_kref+0x6c8:   	flush	%o7 + %fp
	.word	0xaab2400c	! t0_kref+0x6cc:   	orncc	%o1, %o4, %l5
	.word	0xae150014	! t0_kref+0x6d0:   	or	%l4, %l4, %l7
	.word	0xee28a004	! t0_kref+0x6d4:   	stb	%l7, [%g2 + 4]
	.word	0x3f800008	! t0_kref+0x6d8:   	fbo,a	_kref+0x6f8
	.word	0xea10a014	! t0_kref+0x6dc:   	lduh	[%g2 + 0x14], %l5
	.word	0xa89a726e	! t0_kref+0x6e0:   	xorcc	%o1, -0xd92, %l4
	.word	0xd64e6018	! t0_kref+0x6e4:   	ldsb	[%i1 + 0x18], %o3
	.word	0xb7a0003b	! t0_kref+0x6e8:   	fmovs	%f27, %f27
	.word	0xc0fe101c	! t0_kref+0x6ec:   	swapa	[%i0 + %i4]0x80, %g0
	.word	0x81ae8a5a	! t0_kref+0x6f0:   	fcmpd	%fcc0, %f26, %f26
	.word	0xb7a6c8bb	! t0_kref+0x6f4:   	fsubs	%f27, %f27, %f27
	.word	0xf36e6008	! t0_kref+0x6f8:   	prefetch	%i1 + 8, 25
	.word	0x80d5f94a	! t0_kref+0x6fc:   	umulcc	%l7, -0x6b6, %g0
	.word	0x3c800007	! t0_kref+0x700:   	bpos,a	_kref+0x71c
	.word	0xd0200018	! t0_kref+0x704:   	st	%o0, [%g0 + %i0]
	.word	0xa6323057	! t0_kref+0x708:   	orn	%o0, -0xfa9, %l3
	.word	0x32800003	! t0_kref+0x70c:   	bne,a	_kref+0x718
	.word	0xf51f4019	! t0_kref+0x710:   	ldd	[%i5 + %i1], %f26
	.word	0xb7a0003b	! t0_kref+0x714:   	fmovs	%f27, %f27
	.word	0xae120015	! t0_kref+0x718:   	or	%o0, %l5, %l7
	.word	0xe400a014	! t0_kref+0x71c:   	ld	[%g2 + 0x14], %l2
	.word	0xab35a00a	! t0_kref+0x720:   	srl	%l6, 0xa, %l5
	.word	0xa6f34017	! t0_kref+0x724:   	udivcc	%o5, %l7, %l3
	.word	0xd0871019	! t0_kref+0x728:   	lda	[%i4 + %i1]0x80, %o0
	.word	0x81ae8a5a	! t0_kref+0x72c:   	fcmpd	%fcc0, %f26, %f26
	.word	0x9b04c017	! t0_kref+0x730:   	taddcc	%l3, %l7, %o5
	.word	0xda20a014	! t0_kref+0x734:   	st	%o5, [%g2 + 0x14]
	.word	0x8012c017	! t0_kref+0x738:   	or	%o3, %l7, %g0
	.word	0xb7a0189b	! t0_kref+0x73c:   	fitos	%f27, %f27
	.word	0x83c07e94	! t0_kref+0x740:   	jmpl	%g1 - 0x16c, %g1
	.word	0xd036401b	! t0_kref+0x744:   	sth	%o0, [%i1 + %i3]
	.word	0xd43e7ff0	! t0_kref+0x748:   	std	%o2, [%i1 - 0x10]
	.word	0x9e2b0009	! t0_kref+0x74c:   	andn	%o4, %o1, %o7
	.word	0x81ae8a5a	! t0_kref+0x750:   	fcmpd	%fcc0, %f26, %f26
	.word	0xb7a6c83b	! t0_kref+0x754:   	fadds	%f27, %f27, %f27
	.word	0xf19f5a58	! t0_kref+0x758:   	ldda	[%i5 + %i0]0xd2, %f24
	.word	0xb7a6c93b	! t0_kref+0x75c:   	fmuls	%f27, %f27, %f27
	.word	0x8143c000	! t0_kref+0x760:   	stbar
	.word	0xc04e200e	! t0_kref+0x764:   	ldsb	[%i0 + 0xe], %g0
	.word	0xe808a003	! t0_kref+0x768:   	ldub	[%g2 + 3], %l4
	.word	0x9022400a	! t0_kref+0x76c:   	sub	%o1, %o2, %o0
	.word	0xd428a024	! t0_kref+0x770:   	stb	%o2, [%g2 + 0x24]
	.word	0x81de0009	! t0_kref+0x774:   	flush	%i0 + %o1
	.word	0xa4fb0015	! t0_kref+0x778:   	sdivcc	%o4, %l5, %l2
	.word	0x983a8015	! t0_kref+0x77c:   	xnor	%o2, %l5, %o4
	.word	0xf51e7ff0	! t0_kref+0x780:   	ldd	[%i1 - 0x10], %f26
	.word	0xe2d6d018	! t0_kref+0x784:   	ldsha	[%i3 + %i0]0x80, %l1
	.word	0xe620a014	! t0_kref+0x788:   	st	%l3, [%g2 + 0x14]
	.word	0x9a83001a	! t0_kref+0x78c:   	addcc	%o4, %i2, %o5
	.word	0xee270018	! t0_kref+0x790:   	st	%l7, [%i4 + %i0]
	.word	0x81ae8a5a	! t0_kref+0x794:   	fcmpd	%fcc0, %f26, %f26
	.word	0xe44e6001	! t0_kref+0x798:   	ldsb	[%i1 + 1], %l2
	.word	0xa65df5e1	! t0_kref+0x79c:   	smul	%l7, -0xa1f, %l3
	.word	0x85828008	! t0_kref+0x7a0:   	wr	%o2, %o0, %ccr
	.word	0xd630a024	! t0_kref+0x7a4:   	sth	%o3, [%g2 + 0x24]
	.word	0x24800006	! t0_kref+0x7a8:   	ble,a	_kref+0x7c0
	.word	0xac95c00c	! t0_kref+0x7ac:   	orcc	%l7, %o4, %l6
	.word	0xb7a0189b	! t0_kref+0x7b0:   	fitos	%f27, %f27
	.word	0xb7a000bb	! t0_kref+0x7b4:   	fnegs	%f27, %f27
	.word	0xf720a00c	! t0_kref+0x7b8:   	st	%f27, [%g2 + 0xc]
	.word	0xf19e2010	! t0_kref+0x7bc:   	ldda	[%i0 + 0x10]%asi, %f24
	.word	0xc12e600c	! t0_kref+0x7c0:   	st	%fsr, [%i1 + 0xc]
	call	SYM(t0_subr3)
	.word	0x9252c00d	! t0_kref+0x7c8:   	umul	%o3, %o5, %o1
	.word	0xb7a0189b	! t0_kref+0x7cc:   	fitos	%f27, %f27
	.word	0xf700a004	! t0_kref+0x7d0:   	ld	[%g2 + 4], %f27
	.word	0xd40e6015	! t0_kref+0x7d4:   	ldub	[%i1 + 0x15], %o2
	.word	0x81de3992	! t0_kref+0x7d8:   	flush	%i0 - 0x66e
	.word	0xe41e7ff0	! t0_kref+0x7dc:   	ldd	[%i1 - 0x10], %l2
	.word	0xb5a688da	! t0_kref+0x7e0:   	fsubd	%f26, %f26, %f26
	.word	0xd420a018	! t0_kref+0x7e4:   	st	%o2, [%g2 + 0x18]
	.word	0xb7a6c9bb	! t0_kref+0x7e8:   	fdivs	%f27, %f27, %f27
	.word	0xec180019	! t0_kref+0x7ec:   	ldd	[%g0 + %i1], %l6
	.word	0xb7a0053b	! t0_kref+0x7f0:   	fsqrts	%f27, %f27
	.word	0xa62a73c9	! t0_kref+0x7f4:   	andn	%o1, -0xc37, %l3
	.word	0x9e2ea987	! t0_kref+0x7f8:   	andn	%i2, 0x987, %o7
	.word	0xb7a01a5a	! t0_kref+0x7fc:   	fdtoi	%f26, %f27
	.word	0xa7400000	! t0_kref+0x800:   	mov	%y, %l3
	.word	0x94157887	! t0_kref+0x804:   	or	%l5, -0x779, %o2
	.word	0x34480004	! t0_kref+0x808:   	bg,a,pt	%icc, _kref+0x818
	.word	0xb7a018da	! t0_kref+0x80c:   	fdtos	%f26, %f27
	.word	0xb7a0053b	! t0_kref+0x810:   	fsqrts	%f27, %f27
	.word	0xd0680019	! t0_kref+0x814:   	ldstub	[%g0 + %i1], %o0
	.word	0xb5a688da	! t0_kref+0x818:   	fsubd	%f26, %f26, %f26
	.word	0xb7a01a5a	! t0_kref+0x81c:   	fdtoi	%f26, %f27
	.word	0xf720a02c	! t0_kref+0x820:   	st	%f27, [%g2 + 0x2c]
	.word	0xa6fb0008	! t0_kref+0x824:   	sdivcc	%o4, %o0, %l3
	.word	0xb5a8405a	! t0_kref+0x828:   	fmovdne	%fcc0, %f26, %f26
	.word	0x2a480006	! t0_kref+0x82c:   	bcs,a,pt	%icc, _kref+0x844
	.word	0xa8d34008	! t0_kref+0x830:   	umulcc	%o5, %o0, %l4
	.word	0xf51fbf40	! t0_kref+0x834:   	ldd	[%fp - 0xc0], %f26
	.word	0x3d800002	! t0_kref+0x838:   	fbule,a	_kref+0x840
	.word	0xd67e2008	! t0_kref+0x83c:   	swap	[%i0 + 8], %o3
	.word	0x90b5c00b	! t0_kref+0x840:   	orncc	%l7, %o3, %o0
	.word	0xb7a6c93b	! t0_kref+0x844:   	fmuls	%f27, %f27, %f27
	.word	0xb5a6895a	! t0_kref+0x848:   	fmuld	%f26, %f26, %f26
	.word	0xb7a000bb	! t0_kref+0x84c:   	fnegs	%f27, %f27
	.word	0x90f53fed	! t0_kref+0x850:   	udivcc	%l4, -0x13, %o0
	.word	0xb7a0189b	! t0_kref+0x854:   	fitos	%f27, %f27
	.word	0xa8627c64	! t0_kref+0x858:   	subc	%o1, -0x39c, %l4
	.word	0x81aecabb	! t0_kref+0x85c:   	fcmpes	%fcc0, %f27, %f27
	.word	0x8012a46e	! t0_kref+0x860:   	or	%o2, 0x46e, %g0
	.word	0x9246a846	! t0_kref+0x864:   	addc	%i2, 0x846, %o1
	.word	0x9ed366aa	! t0_kref+0x868:   	umulcc	%o5, 0x6aa, %o7
	.word	0x81aeca3b	! t0_kref+0x86c:   	fcmps	%fcc0, %f27, %f27
	.word	0xb7a018da	! t0_kref+0x870:   	fdtos	%f26, %f27
	.word	0x3f800007	! t0_kref+0x874:   	fbo,a	_kref+0x890
	.word	0xa93ac00d	! t0_kref+0x878:   	sra	%o3, %o5, %l4
	.word	0xe168a08d	! t0_kref+0x87c:   	prefetch	%g2 + 0x8d, 16
	.word	0xde40a02c	! t0_kref+0x880:   	ldsw	[%g2 + 0x2c], %o7
	.word	0xd220a01c	! t0_kref+0x884:   	st	%o1, [%g2 + 0x1c]
	.word	0xec20a02c	! t0_kref+0x888:   	st	%l6, [%g2 + 0x2c]
	.word	0xa2a4c00c	! t0_kref+0x88c:   	subcc	%l3, %o4, %l1
	.word	0x80120015	! t0_kref+0x890:   	or	%o0, %l5, %g0
	.word	0xb7a0053b	! t0_kref+0x894:   	fsqrts	%f27, %f27
	.word	0xb7a6c9bb	! t0_kref+0x898:   	fdivs	%f27, %f27, %f27
	.word	0x86102019	! t0_kref+0x89c:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x8a0:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x8a4:   	be,a	_kref+0x8d0
	.word	0x29255c23	! t0_kref+0x8a8:   	sethi	%hi(0x95708c00), %l4
	.word	0xc12e401c	! t0_kref+0x8ac:   	st	%fsr, [%i1 + %i4]
	.word	0xa2868016	! t0_kref+0x8b0:   	addcc	%i2, %l6, %l1
	.word	0xa4c54014	! t0_kref+0x8b4:   	addccc	%l5, %l4, %l2
	.word	0xb5a0193b	! t0_kref+0x8b8:   	fstod	%f27, %f26
	.word	0x8143c000	! t0_kref+0x8bc:   	stbar
	.word	0x80ae800c	! t0_kref+0x8c0:   	andncc	%i2, %o4, %g0
	call	SYM(t0_subr2)
	.word	0xea30a01a	! t0_kref+0x8c8:   	sth	%l5, [%g2 + 0x1a]
	.word	0x90f68009	! t0_kref+0x8cc:   	udivcc	%i2, %o1, %o0
	.word	0x9695621f	! t0_kref+0x8d0:   	orcc	%l5, 0x21f, %o3
	.word	0x30480003	! t0_kref+0x8d4:   	ba,a,pt	%icc, _kref+0x8e0
	.word	0xa845c00a	! t0_kref+0x8d8:   	addc	%l7, %o2, %l4
	.word	0xd420a014	! t0_kref+0x8dc:   	st	%o2, [%g2 + 0x14]
	.word	0xb5a0193b	! t0_kref+0x8e0:   	fstod	%f27, %f26
	.word	0xde40a02c	! t0_kref+0x8e4:   	ldsw	[%g2 + 0x2c], %o7
	.word	0x32800002	! t0_kref+0x8e8:   	bne,a	_kref+0x8f0
	.word	0xaad4c009	! t0_kref+0x8ec:   	umulcc	%l3, %o1, %l5
	.word	0x9ab58017	! t0_kref+0x8f0:   	orncc	%l6, %l7, %o5
	.word	0xf700a030	! t0_kref+0x8f4:   	ld	[%g2 + 0x30], %f27
	.word	0xf7200018	! t0_kref+0x8f8:   	st	%f27, [%g0 + %i0]
	.word	0xe800a03c	! t0_kref+0x8fc:   	ld	[%g2 + 0x3c], %l4
	.word	0xf5bf5019	! t0_kref+0x900:   	stda	%f26, [%i5 + %i1]0x80
	.word	0xd80e8018	! t0_kref+0x904:   	ldub	[%i2 + %i0], %o4
	.word	0xd6280019	! t0_kref+0x908:   	stb	%o3, [%g0 + %i1]
	.word	0xb7a018da	! t0_kref+0x90c:   	fdtos	%f26, %f27
	.word	0x9de3bfa0	! t0_kref+0x910:   	save	%sp, -0x60, %sp
	.word	0xabee3043	! t0_kref+0x914:   	restore	%i0, -0xfbd, %l5
	.word	0xb7a6c93b	! t0_kref+0x918:   	fmuls	%f27, %f27, %f27
	.word	0xf420a008	! t0_kref+0x91c:   	st	%i2, [%g2 + 8]
	.word	0xe286101c	! t0_kref+0x920:   	lda	[%i0 + %i4]0x80, %l1
	.word	0xea7f0018	! t0_kref+0x924:   	swap	[%i4 + %i0], %l5
	.word	0x985d68d4	! t0_kref+0x928:   	smul	%l5, 0x8d4, %o4
	.word	0x3c800008	! t0_kref+0x92c:   	bpos,a	_kref+0x94c
	.word	0xc000a018	! t0_kref+0x930:   	ld	[%g2 + 0x18], %g0
	.word	0xb7a0053b	! t0_kref+0x934:   	fsqrts	%f27, %f27
	.word	0xaa8270e9	! t0_kref+0x938:   	addcc	%o1, -0xf17, %l5
	.word	0x81dc3bff	! t0_kref+0x93c:   	flush	%l0 - 0x401
	.word	0x24800008	! t0_kref+0x940:   	ble,a	_kref+0x960
	.word	0xa6f22e26	! t0_kref+0x944:   	udivcc	%o0, 0xe26, %l3
	.word	0x9fc10000	! t0_kref+0x948:   	call	%g4
	.word	0xd43f4019	! t0_kref+0x94c:   	std	%o2, [%i5 + %i1]
	call	SYM(t0_subr2)
	.word	0xb7a000bb	! t0_kref+0x954:   	fnegs	%f27, %f27
	.word	0xa483774f	! t0_kref+0x958:   	addcc	%o5, -0x8b1, %l2
	.word	0xe830a028	! t0_kref+0x95c:   	sth	%l4, [%g2 + 0x28]
	.word	0x81df62d1	! t0_kref+0x960:   	flush	%i5 + 0x2d1
	.word	0x96da66c4	! t0_kref+0x964:   	smulcc	%o1, 0x6c4, %o3
	.word	0xf51e2000	! t0_kref+0x968:   	ldd	[%i0], %f26
	.word	0x36800002	! t0_kref+0x96c:   	bge,a	_kref+0x974
	.word	0xf700a010	! t0_kref+0x970:   	ld	[%g2 + 0x10], %f27
	.word	0xb7a0003b	! t0_kref+0x974:   	fmovs	%f27, %f27
	.word	0x3d800006	! t0_kref+0x978:   	fbule,a	_kref+0x990
	.word	0xd848a02c	! t0_kref+0x97c:   	ldsb	[%g2 + 0x2c], %o4
	.word	0x8d802c9b	! t0_kref+0x980:   	mov	0xc9b, %fprs
	.word	0x9ac52957	! t0_kref+0x984:   	addccc	%l4, 0x957, %o5
	.word	0xad400000	! t0_kref+0x988:   	mov	%y, %l6
	.word	0x3b800005	! t0_kref+0x98c:   	fble,a	_kref+0x9a0
	.word	0xee767fe0	! t0_kref+0x990:   	stx	%l7, [%i1 - 0x20]
	.word	0x96a2401a	! t0_kref+0x994:   	subcc	%o1, %i2, %o3
	.word	0xaea54008	! t0_kref+0x998:   	subcc	%l5, %o0, %l7
	.word	0xd6d81018	! t0_kref+0x99c:   	ldxa	[%g0 + %i0]0x80, %o3
	.word	0x90fa0016	! t0_kref+0x9a0:   	sdivcc	%o0, %l6, %o0
	.word	0xee300018	! t0_kref+0x9a4:   	sth	%l7, [%g0 + %i0]
	.word	0xd6ee501a	! t0_kref+0x9a8:   	ldstuba	[%i1 + %i2]0x80, %o3
	.word	0x36800001	! t0_kref+0x9ac:   	bge,a	_kref+0x9b0
	.word	0xb7a0003b	! t0_kref+0x9b0:   	fmovs	%f27, %f27
	.word	0x9eb5001a	! t0_kref+0x9b4:   	orncc	%l4, %i2, %o7
	.word	0xd6d0105b	! t0_kref+0x9b8:   	ldsha	[%g0 + %i3]0x82, %o3
	.word	0xec0e3fe7	! t0_kref+0x9bc:   	ldub	[%i0 - 0x19], %l6
	.word	0x90d5bb47	! t0_kref+0x9c0:   	umulcc	%l6, -0x4b9, %o0
	.word	0x96aaa84e	! t0_kref+0x9c4:   	andncc	%o2, 0x84e, %o3
	.word	0xf19e1a1a	! t0_kref+0x9c8:   	ldda	[%i0 + %i2]0xd0, %f24
	.word	0xb5a0005a	! t0_kref+0x9cc:   	fmovd	%f26, %f26
	call	SYM(t0_subr2)
	.word	0xf4266000	! t0_kref+0x9d4:   	st	%i2, [%i1]
	.word	0xf7062000	! t0_kref+0x9d8:   	ld	[%i0], %f27
	.word	0xa4f57f7d	! t0_kref+0x9dc:   	udivcc	%l5, -0x83, %l2
	.word	0x968a8000	! t0_kref+0x9e0:   	andcc	%o2, %g0, %o3
	.word	0xf76e3ff0	! t0_kref+0x9e4:   	prefetch	%i0 - 0x10, 27
	.word	0x9a580017	! t0_kref+0x9e8:   	smul	%g0, %l7, %o5
	.word	0x9e1320fa	! t0_kref+0x9ec:   	or	%o4, 0xfa, %o7
	.word	0xf5be5000	! t0_kref+0x9f0:   	stda	%f26, [%i1]0x80
	.word	0xaadd0000	! t0_kref+0x9f4:   	smulcc	%l4, %g0, %l5
	.word	0xf706401c	! t0_kref+0x9f8:   	ld	[%i1 + %i4], %f27
	.word	0xf7066004	! t0_kref+0x9fc:   	ld	[%i1 + 4], %f27
	.word	0xb7a0003b	! t0_kref+0xa00:   	fmovs	%f27, %f27
	.word	0xad32a015	! t0_kref+0xa04:   	srl	%o2, 0x15, %l6
	.word	0xd650a038	! t0_kref+0xa08:   	ldsh	[%g2 + 0x38], %o3
	.word	0x923d2ca3	! t0_kref+0xa0c:   	xnor	%l4, 0xca3, %o1
	.word	0x81aecabb	! t0_kref+0xa10:   	fcmpes	%fcc0, %f27, %f27
	.word	0x96db269f	! t0_kref+0xa14:   	smulcc	%o4, 0x69f, %o3
	.word	0x94383dce	! t0_kref+0xa18:   	xnor	%g0, -0x232, %o2
	.word	0xee56c018	! t0_kref+0xa1c:   	ldsh	[%i3 + %i0], %l7
	.word	0x98f20017	! t0_kref+0xa20:   	udivcc	%o0, %l7, %o4
	.word	0x81ae8ada	! t0_kref+0xa24:   	fcmped	%fcc0, %f26, %f26
	.word	0xde080018	! t0_kref+0xa28:   	ldub	[%g0 + %i0], %o7
	.word	0xf53e3ff8	! t0_kref+0xa2c:   	std	%f26, [%i0 - 8]
	.word	0x9845e97b	! t0_kref+0xa30:   	addc	%l7, 0x97b, %o4
	.word	0x923d4014	! t0_kref+0xa34:   	xnor	%l5, %l4, %o1
	.word	0xea00a000	! t0_kref+0xa38:   	ld	[%g2], %l5
	.word	0xee56c018	! t0_kref+0xa3c:   	ldsh	[%i3 + %i0], %l7
	.word	0xd43e6018	! t0_kref+0xa40:   	std	%o2, [%i1 + 0x18]
	.word	0xb5a6cd3b	! t0_kref+0xa44:   	fsmuld	%f27, %f27, %f26
	.word	0xd4780019	! t0_kref+0xa48:   	swap	[%g0 + %i1], %o2
	.word	0xb5a688da	! t0_kref+0xa4c:   	fsubd	%f26, %f26, %f26
	.word	0xb7a6c9bb	! t0_kref+0xa50:   	fdivs	%f27, %f27, %f27
	.word	0x9fc10000	! t0_kref+0xa54:   	call	%g4
	.word	0xd03e3fe0	! t0_kref+0xa58:   	std	%o0, [%i0 - 0x20]
	.word	0x949a401a	! t0_kref+0xa5c:   	xorcc	%o1, %i2, %o2
	.word	0xee26001c	! t0_kref+0xa60:   	st	%l7, [%i0 + %i4]
	.word	0x9fc10000	! t0_kref+0xa64:   	call	%g4
	.word	0xd8467fe4	! t0_kref+0xa68:   	ldsw	[%i1 - 0x1c], %o4
	.word	0xd208a037	! t0_kref+0xa6c:   	ldub	[%g2 + 0x37], %o1
	.word	0xf7200019	! t0_kref+0xa70:   	st	%f27, [%g0 + %i1]
	.word	0xda28a02f	! t0_kref+0xa74:   	stb	%o5, [%g2 + 0x2f]
	.word	0x989df1da	! t0_kref+0xa78:   	xorcc	%l7, -0xe26, %o4
	.word	0xb7a0013b	! t0_kref+0xa7c:   	fabss	%f27, %f27
	.word	0x2f480008	! t0_kref+0xa80:   	fbu,a,pt	%fcc0, _kref+0xaa0
	.word	0xf19e9a18	! t0_kref+0xa84:   	ldda	[%i2 + %i0]0xd0, %f24
	.word	0x81ae8a5a	! t0_kref+0xa88:   	fcmpd	%fcc0, %f26, %f26
	.word	0x96f32254	! t0_kref+0xa8c:   	udivcc	%o4, 0x254, %o3
	.word	0xd43e001d	! t0_kref+0xa90:   	std	%o2, [%i0 + %i5]
	.word	0x911b4015	! t0_kref+0xa94:   	tsubcctv	%o5, %l5, %o0
	.word	0xb5a0191b	! t0_kref+0xa98:   	fitod	%f27, %f26
	.word	0x9e85636e	! t0_kref+0xa9c:   	addcc	%l5, 0x36e, %o7
	.word	0xf7067ff0	! t0_kref+0xaa0:   	ld	[%i1 - 0x10], %f27
	.word	0xb7a0053b	! t0_kref+0xaa4:   	fsqrts	%f27, %f27
	.word	0xb5a689da	! t0_kref+0xaa8:   	fdivd	%f26, %f26, %f26
	call	SYM(t0_subr1)
	.word	0xad12e80a	! t0_kref+0xab0:   	taddcctv	%o3, 0x80a, %l6
	.word	0x98252111	! t0_kref+0xab4:   	sub	%l4, 0x111, %o4
	.word	0x32800005	! t0_kref+0xab8:   	bne,a	_kref+0xacc
	.word	0xd406001c	! t0_kref+0xabc:   	ld	[%i0 + %i4], %o2
	.word	0xb7a0003b	! t0_kref+0xac0:   	fmovs	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0xac4:   	fsqrts	%f27, %f27
	.word	0xd03e001d	! t0_kref+0xac8:   	std	%o0, [%i0 + %i5]
	.word	0xf7067ff8	! t0_kref+0xacc:   	ld	[%i1 - 8], %f27
	.word	0xb7a6c93b	! t0_kref+0xad0:   	fmuls	%f27, %f27, %f27
	.word	0x9a45f8b5	! t0_kref+0xad4:   	addc	%l7, -0x74b, %o5
	.word	0xb7a6c9bb	! t0_kref+0xad8:   	fdivs	%f27, %f27, %f27
	.word	0xb7a01a5a	! t0_kref+0xadc:   	fdtoi	%f26, %f27
	.word	0xaf3b0009	! t0_kref+0xae0:   	sra	%o4, %o1, %l7
	.word	0x9eadc00d	! t0_kref+0xae4:   	andncc	%l7, %o5, %o7
	.word	0xd4801019	! t0_kref+0xae8:   	lda	[%g0 + %i1]0x80, %o2
	call	SYM(t0_subr2)
	.word	0xf7070018	! t0_kref+0xaf0:   	ld	[%i4 + %i0], %f27
	.word	0xf700a024	! t0_kref+0xaf4:   	ld	[%g2 + 0x24], %f27
	.word	0xb7a0053b	! t0_kref+0xaf8:   	fsqrts	%f27, %f27
	.word	0xecf65000	! t0_kref+0xafc:   	stxa	%l6, [%i1]0x80
	.word	0x31800008	! t0_kref+0xb00:   	fba,a	_kref+0xb20
	.word	0xd0070019	! t0_kref+0xb04:   	ld	[%i4 + %i1], %o0
	.word	0xf700a010	! t0_kref+0xb08:   	ld	[%g2 + 0x10], %f27
	.word	0xb7a000bb	! t0_kref+0xb0c:   	fnegs	%f27, %f27
	.word	0xb5a0193b	! t0_kref+0xb10:   	fstod	%f27, %f26
	.word	0xaf127942	! t0_kref+0xb14:   	taddcctv	%o1, -0x6be, %l7
	.word	0xf51fbd98	! t0_kref+0xb18:   	ldd	[%fp - 0x268], %f26
	.word	0xab35601a	! t0_kref+0xb1c:   	srl	%l5, 0x1a, %l5
	.word	0xb5a6895a	! t0_kref+0xb20:   	fmuld	%f26, %f26, %f26
	.word	0xd408a015	! t0_kref+0xb24:   	ldub	[%g2 + 0x15], %o2
	.word	0xa42834ca	! t0_kref+0xb28:   	andn	%g0, -0xb36, %l2
	.word	0x9de3bfa0	! t0_kref+0xb2c:   	save	%sp, -0x60, %sp
	.word	0xb4a6c01c	! t0_kref+0xb30:   	subcc	%i3, %i4, %i2
	.word	0x95ef35e8	! t0_kref+0xb34:   	restore	%i4, -0xa18, %o2
	.word	0xf8203470	! t0_kref+0xb38:   	st	%i4, [%g0 - 0xb90]
	.word	0xae55c008	! t0_kref+0xb3c:   	umul	%l7, %o0, %l7
	.word	0xaec2c016	! t0_kref+0xb40:   	addccc	%o3, %l6, %l7
	.word	0xf53e001d	! t0_kref+0xb44:   	std	%f26, [%i0 + %i5]
	.word	0x3b800008	! t0_kref+0xb48:   	fble,a	_kref+0xb68
	.word	0xa8d03b2a	! t0_kref+0xb4c:   	umulcc	%g0, -0x4d6, %l4
	.word	0x969b2270	! t0_kref+0xb50:   	xorcc	%o4, 0x270, %o3
	.word	0x81aecabb	! t0_kref+0xb54:   	fcmpes	%fcc0, %f27, %f27
	.word	0xb7a018da	! t0_kref+0xb58:   	fdtos	%f26, %f27
	call	SYM(t0_subr1)
	.word	0xb5a689da	! t0_kref+0xb60:   	fdivd	%f26, %f26, %f26
	.word	0xab3ce018	! t0_kref+0xb64:   	sra	%l3, 0x18, %l5
	.word	0x9aa54014	! t0_kref+0xb68:   	subcc	%l5, %l4, %o5
	.word	0x982e8015	! t0_kref+0xb6c:   	andn	%i2, %l5, %o4
	.word	0x81580000	! t0_kref+0xb70:   	flushw
	.word	0x94a34013	! t0_kref+0xb74:   	subcc	%o5, %l3, %o2
	.word	0xd03e7fe0	! t0_kref+0xb78:   	std	%o0, [%i1 - 0x20]
	.word	0xf7270018	! t0_kref+0xb7c:   	st	%f27, [%i4 + %i0]
	.word	0xf7066004	! t0_kref+0xb80:   	ld	[%i1 + 4], %f27
	.word	0x80622a5e	! t0_kref+0xb84:   	subc	%o0, 0xa5e, %g0
	.word	0xb5a689da	! t0_kref+0xb88:   	fdivd	%f26, %f26, %f26
	.word	0x81ae8a5a	! t0_kref+0xb8c:   	fcmpd	%fcc0, %f26, %f26
	.word	0x81aecabb	! t0_kref+0xb90:   	fcmpes	%fcc0, %f27, %f27
	.word	0xae3df4dd	! t0_kref+0xb94:   	xnor	%l7, -0xb23, %l7
	.word	0x9fc00004	! t0_kref+0xb98:   	call	%g0 + %g4
	.word	0xb7a6c8bb	! t0_kref+0xb9c:   	fsubs	%f27, %f27, %f27
	.word	0x90bdf3d6	! t0_kref+0xba0:   	xnorcc	%l7, -0xc2a, %o0
	.word	0x9a523128	! t0_kref+0xba4:   	umul	%o0, -0xed8, %o5
	.word	0xf700a008	! t0_kref+0xba8:   	ld	[%g2 + 8], %f27
	.word	0xda20a02c	! t0_kref+0xbac:   	st	%o5, [%g2 + 0x2c]
	.word	0x96b33507	! t0_kref+0xbb0:   	orncc	%o4, -0xaf9, %o3
	.word	0xf53e7fe8	! t0_kref+0xbb4:   	std	%f26, [%i1 - 0x18]
	.word	0xd43e6018	! t0_kref+0xbb8:   	std	%o2, [%i1 + 0x18]
	.word	0xe36e401b	! t0_kref+0xbbc:   	prefetch	%i1 + %i3, 17
	.word	0xb5a689da	! t0_kref+0xbc0:   	fdivd	%f26, %f26, %f26
	.word	0x81da400b	! t0_kref+0xbc4:   	flush	%o1 + %o3
	.word	0xb5a0105a	! t0_kref+0xbc8:   	fdtox	%f26, %f26
	.word	0xad33200e	! t0_kref+0xbcc:   	srl	%o4, 0xe, %l6
	.word	0x81ae8a5a	! t0_kref+0xbd0:   	fcmpd	%fcc0, %f26, %f26
	.word	0xa2c2233d	! t0_kref+0xbd4:   	addccc	%o0, 0x33d, %l1
	.word	0x98150016	! t0_kref+0xbd8:   	or	%l4, %l6, %o4
	.word	0xf7801019	! t0_kref+0xbdc:   	lda	[%g0 + %i1]0x80, %f27
	.word	0xf700a038	! t0_kref+0xbe0:   	ld	[%g2 + 0x38], %f27
	.word	0x27800001	! t0_kref+0xbe4:   	fbul,a	_kref+0xbe8
	.word	0xaf32c000	! t0_kref+0xbe8:   	srl	%o3, %g0, %l7
	.word	0x98b5e748	! t0_kref+0xbec:   	orncc	%l7, 0x748, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be024	! t0_kref+0xbf4:   	ldub	[%o7 + 0x24], %l2
	.word	0xa41ca00c	! t0_kref+0xbf8:   	xor	%l2, 0xc, %l2
	.word	0xe42be024	! t0_kref+0xbfc:   	stb	%l2, [%o7 + 0x24]
	.word	0x81dbe024	! t0_kref+0xc00:   	flush	%o7 + 0x24
	.word	0xf720a03c	! t0_kref+0xc04:   	st	%f27, [%g2 + 0x3c]
	.word	0x8143c000	! t0_kref+0xc08:   	stbar
	.word	0x98803fe7	! t0_kref+0xc0c:   	addcc	%g0, -0x19, %o4
	.word	0xec30a022	! t0_kref+0xc10:   	sth	%l6, [%g2 + 0x22]
	.word	0x980cc014	! t0_kref+0xc14:   	and	%l3, %l4, %o4
	.word	0xb7ab803b	! t0_kref+0xc18:   	fmovsule	%fcc0, %f27, %f27
	.word	0x32800003	! t0_kref+0xc1c:   	bne,a	_kref+0xc28
	.word	0xde56401b	! t0_kref+0xc20:   	ldsh	[%i1 + %i3], %o7
2:	.word	0xee10a01a	! t0_kref+0xc24:   	lduh	[%g2 + 0x1a], %l7
	.word	0xe6300019	! t0_kref+0xc28:   	sth	%l3, [%g0 + %i1]
	.word	0x38480007	! t0_kref+0xc2c:   	bgu,a,pt	%icc, _kref+0xc48
	.word	0xf7070018	! t0_kref+0xc30:   	ld	[%i4 + %i0], %f27
	.word	0x92dcc014	! t0_kref+0xc34:   	smulcc	%l3, %l4, %o1
	.word	0x23480006	! t0_kref+0xc38:   	fbne,a,pt	%fcc0, _kref+0xc50
	.word	0xf5be1000	! t0_kref+0xc3c:   	stda	%f26, [%i0]0x80
	.word	0xb7a0003b	! t0_kref+0xc40:   	fmovs	%f27, %f27
	.word	0xf59f5018	! t0_kref+0xc44:   	ldda	[%i5 + %i0]0x80, %f26
	call	SYM(t0_subr2)
	.word	0xb5a6895a	! t0_kref+0xc4c:   	fmuld	%f26, %f26, %f26
	.word	0x2d800008	! t0_kref+0xc50:   	fbg,a	_kref+0xc70
	.word	0xea462018	! t0_kref+0xc54:   	ldsw	[%i0 + 0x18], %l5
	.word	0xaaf23f7e	! t0_kref+0xc58:   	udivcc	%o0, -0x82, %l5
	.word	0x81ae8ada	! t0_kref+0xc5c:   	fcmped	%fcc0, %f26, %f26
	.word	0xc81f4005	! t0_kref+0xc60:   	ldd	[%i5 + %g5], %g4
	.word	0xb7a01a3b	! t0_kref+0xc64:   	fstoi	%f27, %f27
	.word	0x34800007	! t0_kref+0xc68:   	bg,a	_kref+0xc84
	.word	0xb7a000bb	! t0_kref+0xc6c:   	fnegs	%f27, %f27
	.word	0xea563ff2	! t0_kref+0xc70:   	ldsh	[%i0 - 0xe], %l5
	.word	0xb7a0013b	! t0_kref+0xc74:   	fabss	%f27, %f27
	.word	0xb7a6c9bb	! t0_kref+0xc78:   	fdivs	%f27, %f27, %f27
	.word	0xf53e401d	! t0_kref+0xc7c:   	std	%f26, [%i1 + %i5]
	.word	0x2a480002	! t0_kref+0xc80:   	bcs,a,pt	%icc, _kref+0xc88
	.word	0xb5a0193b	! t0_kref+0xc84:   	fstod	%f27, %f26
	.word	0x9ad5c014	! t0_kref+0xc88:   	umulcc	%l7, %l4, %o5
	.word	0xa455c00a	! t0_kref+0xc8c:   	umul	%l7, %o2, %l2
	.word	0xb7a0003b	! t0_kref+0xc90:   	fmovs	%f27, %f27
	.word	0x20800002	! t0_kref+0xc94:   	bn,a	_kref+0xc9c
	.word	0xab32c000	! t0_kref+0xc98:   	srl	%o3, %g0, %l5
	.word	0xb5a6cd3b	! t0_kref+0xc9c:   	fsmuld	%f27, %f27, %f26
!	.word	0x39bd1cd3	! t0_kref+0xca0:   	fbuge,a	SYM(t0_subr3)
	   	fbuge,a	SYM(t0_subr3)
	.word	0x9e006560	! t0_kref+0xca4:   	add	%g1, 0x560, %o7
	.word	0x981cea1f	! t0_kref+0xca8:   	xor	%l3, 0xa1f, %o4
	.word	0x81580000	! t0_kref+0xcac:   	flushw
	.word	0x9a9a4017	! t0_kref+0xcb0:   	xorcc	%o1, %l7, %o5
	.word	0x20800001	! t0_kref+0xcb4:   	bn,a	_kref+0xcb8
	.word	0xb7a0189b	! t0_kref+0xcb8:   	fitos	%f27, %f27
	.word	0xb7a01a5a	! t0_kref+0xcbc:   	fdtoi	%f26, %f27
	.word	0xf19e1a5d	! t0_kref+0xcc0:   	ldda	[%i0 + %i5]0xd2, %f24
	.word	0x973b0015	! t0_kref+0xcc4:   	sra	%o4, %l5, %o3
	.word	0xd428a020	! t0_kref+0xcc8:   	stb	%o2, [%g2 + 0x20]
	.word	0xf53e3ff8	! t0_kref+0xccc:   	std	%f26, [%i0 - 8]
	.word	0xa8ddf7a6	! t0_kref+0xcd0:   	smulcc	%l7, -0x85a, %l4
	.word	0xb7a0003b	! t0_kref+0xcd4:   	fmovs	%f27, %f27
	.word	0xa48d000b	! t0_kref+0xcd8:   	andcc	%l4, %o3, %l2
	.word	0xb7a0053b	! t0_kref+0xcdc:   	fsqrts	%f27, %f27
	.word	0xe2680019	! t0_kref+0xce0:   	ldstub	[%g0 + %i1], %l1
	.word	0x905ac000	! t0_kref+0xce4:   	smul	%o3, %g0, %o0
	.word	0xb7a0003b	! t0_kref+0xce8:   	fmovs	%f27, %f27
	.word	0x2d800005	! t0_kref+0xcec:   	fbg,a	_kref+0xd00
	.word	0xb7a018da	! t0_kref+0xcf0:   	fdtos	%f26, %f27
	.word	0xee263ff0	! t0_kref+0xcf4:   	st	%l7, [%i0 - 0x10]
	.word	0xf96e7ff0	! t0_kref+0xcf8:   	prefetch	%i1 - 0x10, 28
	.word	0xb7a018da	! t0_kref+0xcfc:   	fdtos	%f26, %f27
	.word	0xb7a6c8bb	! t0_kref+0xd00:   	fsubs	%f27, %f27, %f27
	.word	0xee28a003	! t0_kref+0xd04:   	stb	%l7, [%g2 + 3]
	.word	0x3e800002	! t0_kref+0xd08:   	bvc,a	_kref+0xd10
	.word	0xf1be180a	! t0_kref+0xd0c:   	stda	%f24, [%i0 + %o2]0xc0
	.word	0x81aecabb	! t0_kref+0xd10:   	fcmpes	%fcc0, %f27, %f27
	.word	0xd028a010	! t0_kref+0xd14:   	stb	%o0, [%g2 + 0x10]
	.word	0x93400000	! t0_kref+0xd18:   	mov	%y, %o1
	.word	0xa87227aa	! t0_kref+0xd1c:   	udiv	%o0, 0x7aa, %l4
	.word	0xb7a01a3b	! t0_kref+0xd20:   	fstoi	%f27, %f27
	.word	0xd6563fe4	! t0_kref+0xd24:   	ldsh	[%i0 - 0x1c], %o3
	.word	0xb5a6895a	! t0_kref+0xd28:   	fmuld	%f26, %f26, %f26
	.word	0xc76e3fe0	! t0_kref+0xd2c:   	prefetch	%i0 - 0x20, 3
	.word	0xdbe65014	! t0_kref+0xd30:   	casa	[%i1]0x80, %l4, %o5
	.word	0x9a62c013	! t0_kref+0xd34:   	subc	%o3, %l3, %o5
	.word	0xda40a02c	! t0_kref+0xd38:   	ldsw	[%g2 + 0x2c], %o5
	.word	0xf5180019	! t0_kref+0xd3c:   	ldd	[%g0 + %i1], %f26
	.word	0xb7a6c8bb	! t0_kref+0xd40:   	fsubs	%f27, %f27, %f27
	.word	0x35800001	! t0_kref+0xd44:   	fbue,a	_kref+0xd48
	.word	0x920a3653	! t0_kref+0xd48:   	and	%o0, -0x9ad, %o1
	.word	0xe07e201c	! t0_kref+0xd4c:   	swap	[%i0 + 0x1c], %l0
	.word	0x33800003	! t0_kref+0xd50:   	fbe,a	_kref+0xd5c
	.word	0x98e34009	! t0_kref+0xd54:   	subccc	%o5, %o1, %o4
	.word	0xd2080019	! t0_kref+0xd58:   	ldub	[%g0 + %i1], %o1
	.word	0xc0070018	! t0_kref+0xd5c:   	ld	[%i4 + %i0], %g0
	.word	0xee50a014	! t0_kref+0xd60:   	ldsh	[%g2 + 0x14], %l7
	.word	0x8d850014	! t0_kref+0xd64:   	wr	%l4, %l4, %fprs
	.word	0xaeb6b1f5	! t0_kref+0xd68:   	orncc	%i2, -0xe0b, %l7
	.word	0xf7070019	! t0_kref+0xd6c:   	ld	[%i4 + %i1], %f27
	.word	0x8d830000	! t0_kref+0xd70:   	wr	%o4, %g0, %fprs
	.word	0x27800004	! t0_kref+0xd74:   	fbul,a	_kref+0xd84
	.word	0x9e2dc01a	! t0_kref+0xd78:   	andn	%l7, %i2, %o7
	.word	0x36480002	! t0_kref+0xd7c:   	bge,a,pt	%icc, _kref+0xd84
	.word	0xd420a030	! t0_kref+0xd80:   	st	%o2, [%g2 + 0x30]
	.word	0x2e800003	! t0_kref+0xd84:   	bvs,a	_kref+0xd90
	.word	0x98fb7826	! t0_kref+0xd88:   	sdivcc	%o5, -0x7da, %o4
	.word	0xaa35001a	! t0_kref+0xd8c:   	orn	%l4, %i2, %l5
	.word	0x94a5400d	! t0_kref+0xd90:   	subcc	%l5, %o5, %o2
	.word	0xb7a0053b	! t0_kref+0xd94:   	fsqrts	%f27, %f27
	.word	0x8143c000	! t0_kref+0xd98:   	stbar
	.word	0xb7a0003b	! t0_kref+0xd9c:   	fmovs	%f27, %f27
	.word	0xb7a000bb	! t0_kref+0xda0:   	fnegs	%f27, %f27
	.word	0x3c800003	! t0_kref+0xda4:   	bpos,a	_kref+0xdb0
	.word	0xea10a00c	! t0_kref+0xda8:   	lduh	[%g2 + 0xc], %l5
	.word	0xd250a036	! t0_kref+0xdac:   	ldsh	[%g2 + 0x36], %o1
	.word	0x9b00000a	! t0_kref+0xdb0:   	taddcc	%g0, %o2, %o5
	.word	0x9abd2f03	! t0_kref+0xdb4:   	xnorcc	%l4, 0xf03, %o5
	.word	0xb7a000bb	! t0_kref+0xdb8:   	fnegs	%f27, %f27
	.word	0x33480001	! t0_kref+0xdbc:   	fbe,a,pt	%fcc0, _kref+0xdc0
	.word	0xae8e800a	! t0_kref+0xdc0:   	andcc	%i2, %o2, %l7
	.word	0xa2134014	! t0_kref+0xdc4:   	or	%o5, %l4, %l1
	.word	0x29480004	! t0_kref+0xdc8:   	fbl,a,pt	%fcc0, _kref+0xdd8
	.word	0xf7000019	! t0_kref+0xdcc:   	ld	[%g0 + %i1], %f27
	.word	0xe07e0000	! t0_kref+0xdd0:   	swap	[%i0], %l0
	.word	0xb7a018da	! t0_kref+0xdd4:   	fdtos	%f26, %f27
	.word	0xa82d4013	! t0_kref+0xdd8:   	andn	%l5, %l3, %l4
	.word	0xb7a0053b	! t0_kref+0xddc:   	fsqrts	%f27, %f27
	.word	0xd448a001	! t0_kref+0xde0:   	ldsb	[%g2 + 1], %o2
	.word	0xe8762018	! t0_kref+0xde4:   	stx	%l4, [%i0 + 0x18]
	.word	0x813a8008	! t0_kref+0xde8:   	sra	%o2, %o0, %g0
	.word	0xf51fbea8	! t0_kref+0xdec:   	ldd	[%fp - 0x158], %f26
	.word	0x9fc00004	! t0_kref+0xdf0:   	call	%g0 + %g4
	.word	0xb7a01a5a	! t0_kref+0xdf4:   	fdtoi	%f26, %f27
	.word	0xb7a01a5a	! t0_kref+0xdf8:   	fdtoi	%f26, %f27
	.word	0xac52c017	! t0_kref+0xdfc:   	umul	%o3, %l7, %l6
	.word	0xe6264000	! t0_kref+0xe00:   	st	%l3, [%i1]
	.word	0xb7a018da	! t0_kref+0xe04:   	fdtos	%f26, %f27
	.word	0xb5a688da	! t0_kref+0xe08:   	fsubd	%f26, %f26, %f26
	.word	0xa7400000	! t0_kref+0xe0c:   	mov	%y, %l3
	.word	0xe8564000	! t0_kref+0xe10:   	ldsh	[%i1], %l4
!	.word	0x2748f47b	! t0_kref+0xe14:   	fbul,a,pt	%fcc0, SYM(t0_subr2)
	   	fbul,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9e0066d4	! t0_kref+0xe18:   	add	%g1, 0x6d4, %o7
	.word	0x8143c000	! t0_kref+0xe1c:   	stbar
	.word	0xae82800c	! t0_kref+0xe20:   	addcc	%o2, %o4, %l7
	.word	0xea0e6004	! t0_kref+0xe24:   	ldub	[%i1 + 4], %l5
	.word	0xb7a0053b	! t0_kref+0xe28:   	fsqrts	%f27, %f27
	.word	0xb5a689da	! t0_kref+0xe2c:   	fdivd	%f26, %f26, %f26
	.word	0x80400013	! t0_kref+0xe30:   	addc	%g0, %l3, %g0
	.word	0x81db3ed2	! t0_kref+0xe34:   	flush	%o4 - 0x12e
	.word	0x9fc10000	! t0_kref+0xe38:   	call	%g4
	.word	0xf7070018	! t0_kref+0xe3c:   	ld	[%i4 + %i0], %f27
	.word	0xb5a688da	! t0_kref+0xe40:   	fsubd	%f26, %f26, %f26
	.word	0xb7a0189b	! t0_kref+0xe44:   	fitos	%f27, %f27
	.word	0xa93a800c	! t0_kref+0xe48:   	sra	%o2, %o4, %l4
	.word	0x949a801a	! t0_kref+0xe4c:   	xorcc	%o2, %i2, %o2
	.word	0xb7a000bb	! t0_kref+0xe50:   	fnegs	%f27, %f27
	.word	0xf720a038	! t0_kref+0xe54:   	st	%f27, [%g2 + 0x38]
	.word	0x81ae8ada	! t0_kref+0xe58:   	fcmped	%fcc0, %f26, %f26
	.word	0x22800006	! t0_kref+0xe5c:   	be,a	_kref+0xe74
	.word	0xb5a0105a	! t0_kref+0xe60:   	fdtox	%f26, %f26
	.word	0xec7e7fe4	! t0_kref+0xe64:   	swap	[%i1 - 0x1c], %l6
	.word	0xaa8a24cd	! t0_kref+0xe68:   	andcc	%o0, 0x4cd, %l5
	.word	0x3a800002	! t0_kref+0xe6c:   	bcc,a	_kref+0xe74
	.word	0xa6b68008	! t0_kref+0xe70:   	orncc	%i2, %o0, %l3
	.word	0x9685677d	! t0_kref+0xe74:   	addcc	%l5, 0x77d, %o3
	.word	0xb7a018da	! t0_kref+0xe78:   	fdtos	%f26, %f27
	.word	0xaea0000c	! t0_kref+0xe7c:   	subcc	%g0, %o4, %l7
	.word	0xf7070018	! t0_kref+0xe80:   	ld	[%i4 + %i0], %f27
	.word	0xd606600c	! t0_kref+0xe84:   	ld	[%i1 + 0xc], %o3
	.word	0x96d02aa5	! t0_kref+0xe88:   	umulcc	%g0, 0xaa5, %o3
	.word	0x9fc00004	! t0_kref+0xe8c:   	call	%g0 + %g4
	.word	0xf786101c	! t0_kref+0xe90:   	lda	[%i0 + %i4]0x80, %f27
	.word	0xb7a0053b	! t0_kref+0xe94:   	fsqrts	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0xe98:   	fsqrts	%f27, %f27
	.word	0xb5a0191b	! t0_kref+0xe9c:   	fitod	%f27, %f26
	.word	0xb7a6c93b	! t0_kref+0xea0:   	fmuls	%f27, %f27, %f27
	.word	0x80ab391a	! t0_kref+0xea4:   	andncc	%o4, -0x6e6, %g0
	.word	0xb5a6895a	! t0_kref+0xea8:   	fmuld	%f26, %f26, %f26
	.word	0xb7a0053b	! t0_kref+0xeac:   	fsqrts	%f27, %f27
	.word	0xa2ad2e4c	! t0_kref+0xeb0:   	andncc	%l4, 0xe4c, %l1
	.word	0xb5a6cd3b	! t0_kref+0xeb4:   	fsmuld	%f27, %f27, %f26
	.word	0x80ba4008	! t0_kref+0xeb8:   	xnorcc	%o1, %o0, %g0
	.word	0xb7a9803b	! t0_kref+0xebc:   	fmovsg	%fcc0, %f27, %f27
	.word	0xeb68a08b	! t0_kref+0xec0:   	prefetch	%g2 + 0x8b, 21
	.word	0x942a6623	! t0_kref+0xec4:   	andn	%o1, 0x623, %o2
	.word	0xeac81019	! t0_kref+0xec8:   	ldsba	[%g0 + %i1]0x80, %l5
	call	SYM(t0_subr1)
	.word	0xa89ab163	! t0_kref+0xed0:   	xorcc	%o2, -0xe9d, %l4
	.word	0xa2580000	! t0_kref+0xed4:   	smul	%g0, %g0, %l1
	.word	0xaafa400b	! t0_kref+0xed8:   	sdivcc	%o1, %o3, %l5
	.word	0x81580000	! t0_kref+0xedc:   	flushw
	.word	0xe248a00d	! t0_kref+0xee0:   	ldsb	[%g2 + 0xd], %l1
	.word	0xb7a6c9bb	! t0_kref+0xee4:   	fdivs	%f27, %f27, %f27
	.word	0xb7a6c83b	! t0_kref+0xee8:   	fadds	%f27, %f27, %f27
	.word	0x80fa368e	! t0_kref+0xeec:   	sdivcc	%o0, -0x972, %g0
	.word	0xac15aa9f	! t0_kref+0xef0:   	or	%l6, 0xa9f, %l6
	.word	0xd2ff1018	! t0_kref+0xef4:   	swapa	[%i4 + %i0]0x80, %o1
	.word	0xd67e6008	! t0_kref+0xef8:   	swap	[%i1 + 8], %o3
	.word	0xa206a73a	! t0_kref+0xefc:   	add	%i2, 0x73a, %l1
	.word	0xb7a000bb	! t0_kref+0xf00:   	fnegs	%f27, %f27
	.word	0x81ae8ada	! t0_kref+0xf04:   	fcmped	%fcc0, %f26, %f26
	.word	0xf700a038	! t0_kref+0xf08:   	ld	[%g2 + 0x38], %f27
	.word	0x91408000	! t0_kref+0xf0c:   	mov	%ccr, %o0
	.word	0xb7a000bb	! t0_kref+0xf10:   	fnegs	%f27, %f27
	.word	0x92bac015	! t0_kref+0xf14:   	xnorcc	%o3, %l5, %o1
	.word	0xb5a0193b	! t0_kref+0xf18:   	fstod	%f27, %f26
	.word	0xe27e3fe0	! t0_kref+0xf1c:   	swap	[%i0 - 0x20], %l1
	.word	0xecce105a	! t0_kref+0xf20:   	ldsba	[%i0 + %i2]0x82, %l6
	.word	0xe8000019	! t0_kref+0xf24:   	ld	[%g0 + %i1], %l4
	.word	0x9fc10000	! t0_kref+0xf28:   	call	%g4
	.word	0xc168a083	! t0_kref+0xf2c:   	prefetch	%g2 + 0x83, 0
	.word	0xa6f00016	! t0_kref+0xf30:   	udivcc	%g0, %l6, %l3
	.word	0xaa93001a	! t0_kref+0xf34:   	orcc	%o4, %i2, %l5
	.word	0x98754008	! t0_kref+0xf38:   	udiv	%l5, %o0, %o4
	.word	0x29800002	! t0_kref+0xf3c:   	fbl,a	_kref+0xf44
	.word	0xaead63cb	! t0_kref+0xf40:   	andncc	%l5, 0x3cb, %l7
	.word	0xd840a014	! t0_kref+0xf44:   	ldsw	[%g2 + 0x14], %o4
	.word	0x94a80013	! t0_kref+0xf48:   	andncc	%g0, %l3, %o2
	.word	0xb5a6895a	! t0_kref+0xf4c:   	fmuld	%f26, %f26, %f26
	.word	0xb7a0013b	! t0_kref+0xf50:   	fabss	%f27, %f27
	.word	0xaaf4f15b	! t0_kref+0xf54:   	udivcc	%l3, -0xea5, %l5
	.word	0xb5a6895a	! t0_kref+0xf58:   	fmuld	%f26, %f26, %f26
	.word	0x813a400d	! t0_kref+0xf5c:   	sra	%o1, %o5, %g0
	.word	0x81dc001f	! t0_kref+0xf60:   	flush	%l0 + %i7
	.word	0xb7a0053b	! t0_kref+0xf64:   	fsqrts	%f27, %f27
	.word	0x2d800004	! t0_kref+0xf68:   	fbg,a	_kref+0xf78
	.word	0xda00a004	! t0_kref+0xf6c:   	ld	[%g2 + 4], %o5
	.word	0xa2354009	! t0_kref+0xf70:   	orn	%l5, %o1, %l1
	.word	0xb7a000bb	! t0_kref+0xf74:   	fnegs	%f27, %f27
	.word	0x86102004	! t0_kref+0xf78:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0xf7c:   	bne,a	_kref+0xf7c
	.word	0x86a0e001	! t0_kref+0xf80:   	subcc	%g3, 1, %g3
	.word	0x3f480002	! t0_kref+0xf84:   	fbo,a,pt	%fcc0, _kref+0xf8c
	.word	0xa4c58008	! t0_kref+0xf88:   	addccc	%l6, %o0, %l2
	.word	0x36480005	! t0_kref+0xf8c:   	bge,a,pt	%icc, _kref+0xfa0
	.word	0x9ac50008	! t0_kref+0xf90:   	addccc	%l4, %o0, %o5
	.word	0xaa65000c	! t0_kref+0xf94:   	subc	%l4, %o4, %l5
	.word	0x92a260cf	! t0_kref+0xf98:   	subcc	%o1, 0xcf, %o1
	.word	0xf720a03c	! t0_kref+0xf9c:   	st	%f27, [%g2 + 0x3c]
	sethi	%hi(2f), %o7
	.word	0xe40be3c8	! t0_kref+0xfa4:   	ldub	[%o7 + 0x3c8], %l2
	.word	0xa41ca00c	! t0_kref+0xfa8:   	xor	%l2, 0xc, %l2
	.word	0xe42be3c8	! t0_kref+0xfac:   	stb	%l2, [%o7 + 0x3c8]
	.word	0x81dbe3c8	! t0_kref+0xfb0:   	flush	%o7 + 0x3c8
	.word	0xb7a8c03b	! t0_kref+0xfb4:   	fmovsul	%fcc0, %f27, %f27
	.word	0xe168a049	! t0_kref+0xfb8:   	prefetch	%g2 + 0x49, 16
	.word	0x81dcc001	! t0_kref+0xfbc:   	flush	%l3 + %g1
	.word	0xb7a0053b	! t0_kref+0xfc0:   	fsqrts	%f27, %f27
	.word	0xac626c8e	! t0_kref+0xfc4:   	subc	%o1, 0xc8e, %l6
2:	.word	0xf1be5854	! t0_kref+0xfc8:   	stda	%f24, [%i1 + %l4]0xc2
	.word	0x22480007	! t0_kref+0xfcc:   	be,a,pt	%icc, _kref+0xfe8
	.word	0xda06201c	! t0_kref+0xfd0:   	ld	[%i0 + 0x1c], %o5
	.word	0x96b2243a	! t0_kref+0xfd4:   	orncc	%o0, 0x43a, %o3
	.word	0xea20a008	! t0_kref+0xfd8:   	st	%l5, [%g2 + 8]
	.word	0x983ab2b8	! t0_kref+0xfdc:   	xnor	%o2, -0xd48, %o4
	.word	0xd01e2008	! t0_kref+0xfe0:   	ldd	[%i0 + 8], %o0
	.word	0x33800005	! t0_kref+0xfe4:   	fbe,a	_kref+0xff8
	.word	0xa853000c	! t0_kref+0xfe8:   	umul	%o4, %o4, %l4
	.word	0xec56201a	! t0_kref+0xfec:   	ldsh	[%i0 + 0x1a], %l6
	.word	0x1f1ccd2a	! t0_kref+0xff0:   	sethi	%hi(0x7334a800), %o7
	.word	0x96adc016	! t0_kref+0xff4:   	andncc	%l7, %l6, %o3
	.word	0x8072669e	! t0_kref+0xff8:   	udiv	%o1, 0x69e, %g0
	.word	0xb7a6c9bb	! t0_kref+0xffc:   	fdivs	%f27, %f27, %f27
	.word	0xc168a088	! t0_kref+0x1000:   	prefetch	%g2 + 0x88, 0
	.word	0xc168a045	! t0_kref+0x1004:   	prefetch	%g2 + 0x45, 0
	.word	0x9ec2c00a	! t0_kref+0x1008:   	addccc	%o3, %o2, %o7
	.word	0xb5a0111a	! t0_kref+0x100c:   	fxtod	%f26, %f26
	.word	0x36800002	! t0_kref+0x1010:   	bge,a	_kref+0x1018
	.word	0xa7702af0	! t0_kref+0x1014:   	popc	0xaf0, %l3
	.word	0xf7000019	! t0_kref+0x1018:   	ld	[%g0 + %i1], %f27
	.word	0xec266000	! t0_kref+0x101c:   	st	%l6, [%i1]
	.word	0xb7a0013b	! t0_kref+0x1020:   	fabss	%f27, %f27
	.word	0xb5a688da	! t0_kref+0x1024:   	fsubd	%f26, %f26, %f26
	.word	0xf56e001b	! t0_kref+0x1028:   	prefetch	%i0 + %i3, 26
	.word	0xa8ab0000	! t0_kref+0x102c:   	andncc	%o4, %g0, %l4
	.word	0xee166010	! t0_kref+0x1030:   	lduh	[%i1 + 0x10], %l7
	.word	0xe1f6500c	! t0_kref+0x1034:   	casxa	[%i1]0x80, %o4, %l0
	.word	0x92580016	! t0_kref+0x1038:   	smul	%g0, %l6, %o1
	.word	0xa6c0301d	! t0_kref+0x103c:   	addccc	%g0, -0xfe3, %l3
	.word	0x908d2350	! t0_kref+0x1040:   	andcc	%l4, 0x350, %o0
	.word	0xb7a000bb	! t0_kref+0x1044:   	fnegs	%f27, %f27
	.word	0xaa0d6b3a	! t0_kref+0x1048:   	and	%l5, 0xb3a, %l5
	.word	0xaaa28017	! t0_kref+0x104c:   	subcc	%o2, %l7, %l5
	.word	0xa2f3400b	! t0_kref+0x1050:   	udivcc	%o5, %o3, %l1
	.word	0x36800007	! t0_kref+0x1054:   	bge,a	_kref+0x1070
	.word	0xc040a014	! t0_kref+0x1058:   	ldsw	[%g2 + 0x14], %g0
	.word	0xe648a030	! t0_kref+0x105c:   	ldsb	[%g2 + 0x30], %l3
	.word	0xb7a0053b	! t0_kref+0x1060:   	fsqrts	%f27, %f27
	.word	0x81580000	! t0_kref+0x1064:   	flushw
	call	SYM(t0_subr2)
	.word	0xf7270018	! t0_kref+0x106c:   	st	%f27, [%i4 + %i0]
	.word	0xf7266004	! t0_kref+0x1070:   	st	%f27, [%i1 + 4]
	.word	0xf53e7fe8	! t0_kref+0x1074:   	std	%f26, [%i1 - 0x18]
	.word	0xec98105d	! t0_kref+0x1078:   	ldda	[%g0 + %i5]0x82, %l6
	call	SYM(t0_subr3)
	.word	0x9a724014	! t0_kref+0x1080:   	udiv	%o1, %l4, %o5
	.word	0xb7a01a3b	! t0_kref+0x1084:   	fstoi	%f27, %f27
	.word	0x9ab3000b	! t0_kref+0x1088:   	orncc	%o4, %o3, %o5
	.word	0xa6b6b026	! t0_kref+0x108c:   	orncc	%i2, -0xfda, %l3
	.word	0x81aecabb	! t0_kref+0x1090:   	fcmpes	%fcc0, %f27, %f27
	.word	0xea7e6000	! t0_kref+0x1094:   	swap	[%i1], %l5
	.word	0x37800006	! t0_kref+0x1098:   	fbge,a	_kref+0x10b0
	.word	0xb5a689da	! t0_kref+0x109c:   	fdivd	%f26, %f26, %f26
	.word	0xd0b01019	! t0_kref+0x10a0:   	stha	%o0, [%g0 + %i1]0x80
	call	SYM(t0_subr1)
	.word	0xa6f2400a	! t0_kref+0x10a8:   	udivcc	%o1, %o2, %l3
	.word	0xf706601c	! t0_kref+0x10ac:   	ld	[%i1 + 0x1c], %f27
	.word	0xd84e4000	! t0_kref+0x10b0:   	ldsb	[%i1], %o4
	.word	0xa932c014	! t0_kref+0x10b4:   	srl	%o3, %l4, %l4
	.word	0x90454000	! t0_kref+0x10b8:   	addc	%l5, %g0, %o0
	.word	0xb7a018da	! t0_kref+0x10bc:   	fdtos	%f26, %f27
	.word	0x94ab4000	! t0_kref+0x10c0:   	andncc	%o5, %g0, %o2
	.word	0xaaa5aa52	! t0_kref+0x10c4:   	subcc	%l6, 0xa52, %l5
	.word	0x9fc10000	! t0_kref+0x10c8:   	call	%g4
	.word	0xe6070019	! t0_kref+0x10cc:   	ld	[%i4 + %i1], %l3
	.word	0xb7a0053b	! t0_kref+0x10d0:   	fsqrts	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0x10d4:   	fsqrts	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x10d8:   	fitos	%f27, %f27
	.word	0xf51e7fe0	! t0_kref+0x10dc:   	ldd	[%i1 - 0x20], %f26
	.word	0x3d480003	! t0_kref+0x10e0:   	fbule,a,pt	%fcc0, _kref+0x10ec
	.word	0xd40e7ff8	! t0_kref+0x10e4:   	ldub	[%i1 - 8], %o2
	.word	0xb7a0189b	! t0_kref+0x10e8:   	fitos	%f27, %f27
	.word	0x909aedce	! t0_kref+0x10ec:   	xorcc	%o3, 0xdce, %o0
	.word	0xb5a0193b	! t0_kref+0x10f0:   	fstod	%f27, %f26
	.word	0xee48a02c	! t0_kref+0x10f4:   	ldsb	[%g2 + 0x2c], %l7
	.word	0x152f1c82	! t0_kref+0x10f8:   	sethi	%hi(0xbc720800), %o2
	.word	0x81aecabb	! t0_kref+0x10fc:   	fcmpes	%fcc0, %f27, %f27
	.word	0x803ae4fd	! t0_kref+0x1100:   	xnor	%o3, 0x4fd, %g0
	.word	0xa6baf110	! t0_kref+0x1104:   	xnorcc	%o3, -0xef0, %l3
	.word	0xed6e7fe8	! t0_kref+0x1108:   	prefetch	%i1 - 0x18, 22
	.word	0x9ed34000	! t0_kref+0x110c:   	umulcc	%o5, %g0, %o7
	.word	0x98126c82	! t0_kref+0x1110:   	or	%o1, 0xc82, %o4
	.word	0x9005b7ad	! t0_kref+0x1114:   	add	%l6, -0x853, %o0
	.word	0xf700a004	! t0_kref+0x1118:   	ld	[%g2 + 4], %f27
	.word	0x96adc00b	! t0_kref+0x111c:   	andncc	%l7, %o3, %o3
	.word	0xb5a0193b	! t0_kref+0x1120:   	fstod	%f27, %f26
	.word	0xe8ce5000	! t0_kref+0x1124:   	ldsba	[%i1]0x80, %l4
	.word	0xf51e401d	! t0_kref+0x1128:   	ldd	[%i1 + %i5], %f26
	.word	0x31480005	! t0_kref+0x112c:   	fba,a,pt	%fcc0, _kref+0x1140
	.word	0x8074c00d	! t0_kref+0x1130:   	udiv	%l3, %o5, %g0
	.word	0xacb57964	! t0_kref+0x1134:   	orncc	%l5, -0x69c, %l6
	.word	0xe6c61000	! t0_kref+0x1138:   	ldswa	[%i0]0x80, %l3
	.word	0x80ad801a	! t0_kref+0x113c:   	andncc	%l6, %i2, %g0
	.word	0x8143c000	! t0_kref+0x1140:   	stbar
	.word	0xaa856718	! t0_kref+0x1144:   	addcc	%l5, 0x718, %l5
	.word	0x942d6053	! t0_kref+0x1148:   	andn	%l5, 0x53, %o2
	.word	0xc12e7fec	! t0_kref+0x114c:   	st	%fsr, [%i1 - 0x14]
	.word	0x94402544	! t0_kref+0x1150:   	addc	%g0, 0x544, %o2
	.word	0xa4ad4014	! t0_kref+0x1154:   	andncc	%l5, %l4, %l2
	.word	0xac0d776a	! t0_kref+0x1158:   	and	%l5, -0x896, %l6
	.word	0xe86e4000	! t0_kref+0x115c:   	ldstub	[%i1], %l4
	.word	0xd416401b	! t0_kref+0x1160:   	lduh	[%i1 + %i3], %o2
	.word	0xf53f4018	! t0_kref+0x1164:   	std	%f26, [%i5 + %i0]
	.word	0x81dc0013	! t0_kref+0x1168:   	flush	%l0 + %l3
	.word	0xd830a000	! t0_kref+0x116c:   	sth	%o4, [%g2]
	.word	0x81aecabb	! t0_kref+0x1170:   	fcmpes	%fcc0, %f27, %f27
	.word	0xe2066018	! t0_kref+0x1174:   	ld	[%i1 + 0x18], %l1
	.word	0x98dd8017	! t0_kref+0x1178:   	smulcc	%l6, %l7, %o4
	call	SYM(t0_subr0)
	.word	0xd6d6d040	! t0_kref+0x1180:   	ldsha	[%i3]0x82, %o3
	.word	0xf700a004	! t0_kref+0x1184:   	ld	[%g2 + 4], %f27
	.word	0xd44e8018	! t0_kref+0x1188:   	ldsb	[%i2 + %i0], %o2
	.word	0xa8520014	! t0_kref+0x118c:   	umul	%o0, %l4, %l4
	.word	0xe600a004	! t0_kref+0x1190:   	ld	[%g2 + 4], %l3
	.word	0xa83578e3	! t0_kref+0x1194:   	orn	%l5, -0x71d, %l4
	.word	0xb5a688da	! t0_kref+0x1198:   	fsubd	%f26, %f26, %f26
	sethi	%hi(2f), %o7
	.word	0xe40be1c4	! t0_kref+0x11a0:   	ldub	[%o7 + 0x1c4], %l2
	.word	0xa41ca00c	! t0_kref+0x11a4:   	xor	%l2, 0xc, %l2
	.word	0xe42be1c4	! t0_kref+0x11a8:   	stb	%l2, [%o7 + 0x1c4]
	.word	0x81dbe1c4	! t0_kref+0x11ac:   	flush	%o7 + 0x1c4
	.word	0x28480008	! t0_kref+0x11b0:   	bleu,a,pt	%icc, _kref+0x11d0
	.word	0xe48e101a	! t0_kref+0x11b4:   	lduba	[%i0 + %i2]0x80, %l2
	.word	0xa83a800d	! t0_kref+0x11b8:   	xnor	%o2, %o5, %l4
	.word	0xf720a00c	! t0_kref+0x11bc:   	st	%f27, [%g2 + 0xc]
	.word	0x81df3b58	! t0_kref+0x11c0:   	flush	%i4 - 0x4a8
2:	.word	0xf706401c	! t0_kref+0x11c4:   	ld	[%i1 + %i4], %f27
	.word	0xe630a03c	! t0_kref+0x11c8:   	sth	%l3, [%g2 + 0x3c]
	.word	0xb5a6895a	! t0_kref+0x11cc:   	fmuld	%f26, %f26, %f26
	.word	0x9fc10000	! t0_kref+0x11d0:   	call	%g4
	.word	0xa8a5be9d	! t0_kref+0x11d4:   	subcc	%l6, -0x163, %l4
	.word	0xf7067ffc	! t0_kref+0x11d8:   	ld	[%i1 - 4], %f27
	.word	0x28800001	! t0_kref+0x11dc:   	bleu,a	_kref+0x11e0
	.word	0x9a8ce8f9	! t0_kref+0x11e0:   	andcc	%l3, 0x8f9, %o5
	.word	0x81aecabb	! t0_kref+0x11e4:   	fcmpes	%fcc0, %f27, %f27
	.word	0x803cc01a	! t0_kref+0x11e8:   	xnor	%l3, %i2, %g0
	.word	0xd03e2000	! t0_kref+0x11ec:   	std	%o0, [%i0]
	.word	0x8143e040	! t0_kref+0x11f0:   	membar	0x40
	.word	0x193dc4b4	! t0_kref+0x11f4:   	sethi	%hi(0xf712d000), %o4
	.word	0x30800006	! t0_kref+0x11f8:   	ba,a	_kref+0x1210
	.word	0xf700a02c	! t0_kref+0x11fc:   	ld	[%g2 + 0x2c], %f27
	.word	0x94a5ec46	! t0_kref+0x1200:   	subcc	%l7, 0xc46, %o2
	.word	0xb5a6895a	! t0_kref+0x1204:   	fmuld	%f26, %f26, %f26
	.word	0xf7062000	! t0_kref+0x1208:   	ld	[%i0], %f27
	.word	0x949b3c01	! t0_kref+0x120c:   	xorcc	%o4, -0x3ff, %o2
	.word	0x2b800008	! t0_kref+0x1210:   	fbug,a	_kref+0x1230
	.word	0xa4f20000	! t0_kref+0x1214:   	udivcc	%o0, %g0, %l2
	.word	0xe6262000	! t0_kref+0x1218:   	st	%l3, [%i0]
	.word	0x22800005	! t0_kref+0x121c:   	be,a	_kref+0x1230
	.word	0xb7a6c8bb	! t0_kref+0x1220:   	fsubs	%f27, %f27, %f27
	.word	0x96bb7b90	! t0_kref+0x1224:   	xnorcc	%o5, -0x470, %o3
	.word	0x96a3392f	! t0_kref+0x1228:   	subcc	%o4, -0x6d1, %o3
	.word	0x28800007	! t0_kref+0x122c:   	bleu,a	_kref+0x1248
	.word	0xf51e2018	! t0_kref+0x1230:   	ldd	[%i0 + 0x18], %f26
	.word	0xe0680018	! t0_kref+0x1234:   	ldstub	[%g0 + %i0], %l0
	.word	0xb7a0053b	! t0_kref+0x1238:   	fsqrts	%f27, %f27
	.word	0xfc56c000	! t0_kref+0x123c:   	ldsh	[%i3], %fp
	.word	0x9a3d66c1	! t0_kref+0x1240:   	xnor	%l5, 0x6c1, %o5
	.word	0xd216401b	! t0_kref+0x1244:   	lduh	[%i1 + %i3], %o1
	.word	0xb7a0003b	! t0_kref+0x1248:   	fmovs	%f27, %f27
	.word	0xde50a034	! t0_kref+0x124c:   	ldsh	[%g2 + 0x34], %o7
	.word	0xb7a0189b	! t0_kref+0x1250:   	fitos	%f27, %f27
	.word	0xea00a000	! t0_kref+0x1254:   	ld	[%g2], %l5
	.word	0xec46200c	! t0_kref+0x1258:   	ldsw	[%i0 + 0xc], %l6
	.word	0x9a424000	! t0_kref+0x125c:   	addc	%o1, %g0, %o5
	call	SYM(t0_subr1)
	.word	0x96d56de4	! t0_kref+0x1264:   	umulcc	%l5, 0xde4, %o3
	.word	0xf700a008	! t0_kref+0x1268:   	ld	[%g2 + 8], %f27
	.word	0xf51e2000	! t0_kref+0x126c:   	ldd	[%i0], %f26
	.word	0xee300018	! t0_kref+0x1270:   	sth	%l7, [%g0 + %i0]
	.word	0xb7a0003b	! t0_kref+0x1274:   	fmovs	%f27, %f27
	.word	0xf51e2018	! t0_kref+0x1278:   	ldd	[%i0 + 0x18], %f26
	.word	0xf51fbec0	! t0_kref+0x127c:   	ldd	[%fp - 0x140], %f26
	.word	0xea6e001a	! t0_kref+0x1280:   	ldstub	[%i0 + %i2], %l5
	.word	0xe1e6100c	! t0_kref+0x1284:   	casa	[%i0]0x80, %o4, %l0
	.word	0xaf32200c	! t0_kref+0x1288:   	srl	%o0, 0xc, %l7
	.word	0xef6e2000	! t0_kref+0x128c:   	prefetch	%i0, 23
	.word	0xb5ab805a	! t0_kref+0x1290:   	fmovdule	%fcc0, %f26, %f26
	.word	0x3f800004	! t0_kref+0x1294:   	fbo,a	_kref+0x12a4
	.word	0xb7a6c93b	! t0_kref+0x1298:   	fmuls	%f27, %f27, %f27
	.word	0xd400a000	! t0_kref+0x129c:   	ld	[%g2], %o2
	.word	0xf51f4018	! t0_kref+0x12a0:   	ldd	[%i5 + %i0], %f26
	.word	0xe840a02c	! t0_kref+0x12a4:   	ldsw	[%g2 + 0x2c], %l4
	.word	0x3a800008	! t0_kref+0x12a8:   	bcc,a	_kref+0x12c8
	.word	0xf51e001d	! t0_kref+0x12ac:   	ldd	[%i0 + %i5], %f26
	.word	0xb7a01a5a	! t0_kref+0x12b0:   	fdtoi	%f26, %f27
	.word	0x95400000	! t0_kref+0x12b4:   	mov	%y, %o2
	.word	0xe210a03e	! t0_kref+0x12b8:   	lduh	[%g2 + 0x3e], %l1
	.word	0xb7a0003b	! t0_kref+0x12bc:   	fmovs	%f27, %f27
	.word	0xf51e7fe0	! t0_kref+0x12c0:   	ldd	[%i1 - 0x20], %f26
	.word	0x81aeca3b	! t0_kref+0x12c4:   	fcmps	%fcc0, %f27, %f27
	.word	0xf7070019	! t0_kref+0x12c8:   	ld	[%i4 + %i1], %f27
	.word	0x3f800007	! t0_kref+0x12cc:   	fbo,a	_kref+0x12e8
	.word	0xb7a6c93b	! t0_kref+0x12d0:   	fmuls	%f27, %f27, %f27
	.word	0x94b34008	! t0_kref+0x12d4:   	orncc	%o5, %o0, %o2
	.word	0x39480003	! t0_kref+0x12d8:   	fbuge,a,pt	%fcc0, _kref+0x12e4
	.word	0xe4000018	! t0_kref+0x12dc:   	ld	[%g0 + %i0], %l2
	.word	0xee10a020	! t0_kref+0x12e0:   	lduh	[%g2 + 0x20], %l7
	.word	0x2d800004	! t0_kref+0x12e4:   	fbg,a	_kref+0x12f4
	.word	0xe6162008	! t0_kref+0x12e8:   	lduh	[%i0 + 8], %l3
	.word	0xa3400000	! t0_kref+0x12ec:   	mov	%y, %l1
	.word	0xf700a00c	! t0_kref+0x12f0:   	ld	[%g2 + 0xc], %f27
	.word	0xd8767ff0	! t0_kref+0x12f4:   	stx	%o4, [%i1 - 0x10]
	.word	0xee20a030	! t0_kref+0x12f8:   	st	%l7, [%g2 + 0x30]
	.word	0x24800008	! t0_kref+0x12fc:   	ble,a	_kref+0x131c
	.word	0xd4380018	! t0_kref+0x1300:   	std	%o2, [%g0 + %i0]
	.word	0xd630a032	! t0_kref+0x1304:   	sth	%o3, [%g2 + 0x32]
	.word	0xe20e401a	! t0_kref+0x1308:   	ldub	[%i1 + %i2], %l1
	.word	0xe27f0019	! t0_kref+0x130c:   	swap	[%i4 + %i1], %l1
	.word	0xe1e6100b	! t0_kref+0x1310:   	casa	[%i0]0x80, %o3, %l0
	.word	0xf207bfe0	! t0_kref+0x1314:   	ld	[%fp - 0x20], %i1
	.word	0xf706001c	! t0_kref+0x1318:   	ld	[%i0 + %i4], %f27
	.word	0xb7a0013b	! t0_kref+0x131c:   	fabss	%f27, %f27
	.word	0x9fc10000	! t0_kref+0x1320:   	call	%g4
	.word	0xb5a0193b	! t0_kref+0x1324:   	fstod	%f27, %f26
	.word	0x9fc00004	! t0_kref+0x1328:   	call	%g0 + %g4
	.word	0xb7a000bb	! t0_kref+0x132c:   	fnegs	%f27, %f27
	.word	0x3c800005	! t0_kref+0x1330:   	bpos,a	_kref+0x1344
	.word	0xd86e2002	! t0_kref+0x1334:   	ldstub	[%i0 + 2], %o4
	.word	0xaa16a342	! t0_kref+0x1338:   	or	%i2, 0x342, %l5
	.word	0x24800005	! t0_kref+0x133c:   	ble,a	_kref+0x1350
	.word	0xb7a6c9bb	! t0_kref+0x1340:   	fdivs	%f27, %f27, %f27
	.word	0x9fc10000	! t0_kref+0x1344:   	call	%g4
	.word	0xb7a0003b	! t0_kref+0x1348:   	fmovs	%f27, %f27
	.word	0xb5a6cd3b	! t0_kref+0x134c:   	fsmuld	%f27, %f27, %f26
	.word	0x2b800006	! t0_kref+0x1350:   	fbug,a	_kref+0x1368
	.word	0xec50a026	! t0_kref+0x1354:   	ldsh	[%g2 + 0x26], %l6
	.word	0xf53f4018	! t0_kref+0x1358:   	std	%f26, [%i5 + %i0]
	.word	0xb7a9003b	! t0_kref+0x135c:   	fmovsl	%fcc0, %f27, %f27
	.word	0xd848a034	! t0_kref+0x1360:   	ldsb	[%g2 + 0x34], %o4
	.word	0xb5a6895a	! t0_kref+0x1364:   	fmuld	%f26, %f26, %f26
	.word	0x31800002	! t0_kref+0x1368:   	fba,a	_kref+0x1370
	.word	0xa615c000	! t0_kref+0x136c:   	or	%l7, %g0, %l3
	.word	0xa9400000	! t0_kref+0x1370:   	mov	%y, %l4
	.word	0x3e800003	! t0_kref+0x1374:   	bvc,a	_kref+0x1380
	.word	0x81580000	! t0_kref+0x1378:   	flushw
	.word	0xb7a0053b	! t0_kref+0x137c:   	fsqrts	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0x1380:   	fsqrts	%f27, %f27
	.word	0x98da4009	! t0_kref+0x1384:   	smulcc	%o1, %o1, %o4
	.word	0xaed26324	! t0_kref+0x1388:   	umulcc	%o1, 0x324, %l7
	.word	0xa446a5b3	! t0_kref+0x138c:   	addc	%i2, 0x5b3, %l2
	.word	0xd4063ff0	! t0_kref+0x1390:   	ld	[%i0 - 0x10], %o2
	.word	0x81ae8ada	! t0_kref+0x1394:   	fcmped	%fcc0, %f26, %f26
	.word	0xb7a6c93b	! t0_kref+0x1398:   	fmuls	%f27, %f27, %f27
	.word	0x9ad4c009	! t0_kref+0x139c:   	umulcc	%l3, %o1, %o5
	.word	0x81580000	! t0_kref+0x13a0:   	flushw
	.word	0xd40e7ff6	! t0_kref+0x13a4:   	ldub	[%i1 - 0xa], %o2
	.word	0xd86e001a	! t0_kref+0x13a8:   	ldstub	[%i0 + %i2], %o4
	.word	0x20480006	! t0_kref+0x13ac:   	bn,a,pt	%icc, _kref+0x13c4
	.word	0xd0080019	! t0_kref+0x13b0:   	ldub	[%g0 + %i1], %o0
	.word	0x98aeb7d7	! t0_kref+0x13b4:   	andncc	%i2, -0x829, %o4
	.word	0xed68a04a	! t0_kref+0x13b8:   	prefetch	%g2 + 0x4a, 22
	.word	0xa27a8016	! t0_kref+0x13bc:   	sdiv	%o2, %l6, %l1
	.word	0xd03f4018	! t0_kref+0x13c0:   	std	%o0, [%i5 + %i0]
	.word	0x30800005	! t0_kref+0x13c4:   	ba,a	_kref+0x13d8
	.word	0xe600a014	! t0_kref+0x13c8:   	ld	[%g2 + 0x14], %l3
	.word	0x2a480004	! t0_kref+0x13cc:   	bcs,a,pt	%icc, _kref+0x13dc
	.word	0xb7a6c9bb	! t0_kref+0x13d0:   	fdivs	%f27, %f27, %f27
	.word	0xf720a038	! t0_kref+0x13d4:   	st	%f27, [%g2 + 0x38]
	.word	0x3f480003	! t0_kref+0x13d8:   	fbo,a,pt	%fcc0, _kref+0x13e4
	.word	0xba103fe8	! t0_kref+0x13dc:   	mov	0xffffffe8, %i5
	.word	0xaaf27673	! t0_kref+0x13e0:   	udivcc	%o1, -0x98d, %l5
	.word	0x24800002	! t0_kref+0x13e4:   	ble,a	_kref+0x13ec
	.word	0x96327844	! t0_kref+0x13e8:   	orn	%o1, -0x7bc, %o3
	.word	0xb7a0053b	! t0_kref+0x13ec:   	fsqrts	%f27, %f27
	.word	0xec9e501d	! t0_kref+0x13f0:   	ldda	[%i1 + %i5]0x80, %l6
	.word	0x28800005	! t0_kref+0x13f4:   	bleu,a	_kref+0x1408
	.word	0xf7070018	! t0_kref+0x13f8:   	ld	[%i4 + %i0], %f27
	.word	0x2c480003	! t0_kref+0x13fc:   	bneg,a,pt	%icc, _kref+0x1408
	.word	0xb7a0189b	! t0_kref+0x1400:   	fitos	%f27, %f27
	.word	0x81830000	! t0_kref+0x1404:   	wr	%o4, %g0, %y
	.word	0x36800005	! t0_kref+0x1408:   	bge,a	_kref+0x141c
	.word	0x965a3618	! t0_kref+0x140c:   	smul	%o0, -0x9e8, %o3
	.word	0xd2c01018	! t0_kref+0x1410:   	ldswa	[%g0 + %i0]0x80, %o1
	.word	0xb7a0003b	! t0_kref+0x1414:   	fmovs	%f27, %f27
	.word	0x98b2e9bd	! t0_kref+0x1418:   	orncc	%o3, 0x9bd, %o4
	.word	0xd4567ffa	! t0_kref+0x141c:   	ldsh	[%i1 - 6], %o2
	.word	0x9f400000	! t0_kref+0x1420:   	mov	%y, %o7
	.word	0xb7a0003b	! t0_kref+0x1424:   	fmovs	%f27, %f27
	.word	0x9b2dc008	! t0_kref+0x1428:   	sll	%l7, %o0, %o5
	.word	0xf5be5000	! t0_kref+0x142c:   	stda	%f26, [%i1]0x80
	.word	0xda780018	! t0_kref+0x1430:   	swap	[%g0 + %i0], %o5
	.word	0x92d5800b	! t0_kref+0x1434:   	umulcc	%l6, %o3, %o1
	.word	0x80d24013	! t0_kref+0x1438:   	umulcc	%o1, %l3, %g0
	.word	0xad38201f	! t0_kref+0x143c:   	sra	%g0, 0x1f, %l6
	.word	0x9415fa27	! t0_kref+0x1440:   	or	%l7, -0x5d9, %o2
	.word	0xaabd0013	! t0_kref+0x1444:   	xnorcc	%l4, %l3, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be084	! t0_kref+0x144c:   	ldub	[%o7 + 0x84], %l2
	.word	0xa41ca00c	! t0_kref+0x1450:   	xor	%l2, 0xc, %l2
	.word	0xe42be084	! t0_kref+0x1454:   	stb	%l2, [%o7 + 0x84]
	.word	0x81dbe084	! t0_kref+0x1458:   	flush	%o7 + 0x84
	.word	0xae624015	! t0_kref+0x145c:   	subc	%o1, %l5, %l7
	.word	0x35800008	! t0_kref+0x1460:   	fbue,a	_kref+0x1480
	.word	0xf59e105d	! t0_kref+0x1464:   	ldda	[%i0 + %i5]0x82, %f26
	.word	0xf786501c	! t0_kref+0x1468:   	lda	[%i1 + %i4]0x80, %f27
	.word	0xa855b04b	! t0_kref+0x146c:   	umul	%l6, -0xfb5, %l4
	.word	0xe82e4000	! t0_kref+0x1470:   	stb	%l4, [%i1]
	.word	0xd8a6101c	! t0_kref+0x1474:   	sta	%o4, [%i0 + %i4]0x80
	.word	0x27480002	! t0_kref+0x1478:   	fbul,a,pt	%fcc0, _kref+0x1480
	.word	0xda00a038	! t0_kref+0x147c:   	ld	[%g2 + 0x38], %o5
	.word	0x94fd3ab7	! t0_kref+0x1480:   	sdivcc	%l4, -0x549, %o2
2:	.word	0xea267fe4	! t0_kref+0x1484:   	st	%l5, [%i1 - 0x1c]
	.word	0x96f3000a	! t0_kref+0x1488:   	udivcc	%o4, %o2, %o3
	.word	0x9e080008	! t0_kref+0x148c:   	and	%g0, %o0, %o7
	.word	0xb7a6c93b	! t0_kref+0x1490:   	fmuls	%f27, %f27, %f27
	.word	0xb7a6c9bb	! t0_kref+0x1494:   	fdivs	%f27, %f27, %f27
	.word	0xaef526ab	! t0_kref+0x1498:   	udivcc	%l4, 0x6ab, %l7
	.word	0x3a800008	! t0_kref+0x149c:   	bcc,a	_kref+0x14bc
	.word	0x81dff677	! t0_kref+0x14a0:   	flush	%i7 - 0x989
	.word	0xb7a01a3b	! t0_kref+0x14a4:   	fstoi	%f27, %f27
	.word	0xee500018	! t0_kref+0x14a8:   	ldsh	[%g0 + %i0], %l7
	.word	0x81ae8a5a	! t0_kref+0x14ac:   	fcmpd	%fcc0, %f26, %f26
	.word	0xd0ce101a	! t0_kref+0x14b0:   	ldsba	[%i0 + %i2]0x80, %o0
	.word	0xb7a6c9bb	! t0_kref+0x14b4:   	fdivs	%f27, %f27, %f27
	.word	0x9f414000	! t0_kref+0x14b8:   	mov	%pc, %o7
	.word	0xb7a0053b	! t0_kref+0x14bc:   	fsqrts	%f27, %f27
	.word	0xc0363ff0	! t0_kref+0x14c0:   	clrh	[%i0 - 0x10]
	.word	0xb7a01a5a	! t0_kref+0x14c4:   	fdtoi	%f26, %f27
	.word	0xc06e401a	! t0_kref+0x14c8:   	ldstub	[%i1 + %i2], %g0
	.word	0xf7063ff8	! t0_kref+0x14cc:   	ld	[%i0 - 8], %f27
	.word	0xb7a6c9bb	! t0_kref+0x14d0:   	fdivs	%f27, %f27, %f27
	.word	0x9e46ad6e	! t0_kref+0x14d4:   	addc	%i2, 0xd6e, %o7
	.word	0xf7067fe4	! t0_kref+0x14d8:   	ld	[%i1 - 0x1c], %f27
	.word	0xc05e6010	! t0_kref+0x14dc:   	ldx	[%i1 + 0x10], %g0
	.word	0xb7a6c93b	! t0_kref+0x14e0:   	fmuls	%f27, %f27, %f27
	.word	0xb5a0193b	! t0_kref+0x14e4:   	fstod	%f27, %f26
	.word	0xac2b621c	! t0_kref+0x14e8:   	andn	%o5, 0x21c, %l6
	.word	0xf700a034	! t0_kref+0x14ec:   	ld	[%g2 + 0x34], %f27
	.word	0xf1be1815	! t0_kref+0x14f0:   	stda	%f24, [%i0 + %l5]0xc0
	.word	0x36480001	! t0_kref+0x14f4:   	bge,a,pt	%icc, _kref+0x14f8
	.word	0xb7a0189b	! t0_kref+0x14f8:   	fitos	%f27, %f27
	.word	0xf700a01c	! t0_kref+0x14fc:   	ld	[%g2 + 0x1c], %f27
	.word	0xa884e381	! t0_kref+0x1500:   	addcc	%l3, 0x381, %l4
	.word	0xb7a0053b	! t0_kref+0x1504:   	fsqrts	%f27, %f27
	.word	0xb7a6c8bb	! t0_kref+0x1508:   	fsubs	%f27, %f27, %f27
	.word	0x3d480007	! t0_kref+0x150c:   	fbule,a,pt	%fcc0, _kref+0x1528
	.word	0x9644c008	! t0_kref+0x1510:   	addc	%l3, %o0, %o3
	.word	0xe06e6002	! t0_kref+0x1514:   	ldstub	[%i1 + 2], %l0
	call	SYM(t0_subr1)
	.word	0xb7a6c93b	! t0_kref+0x151c:   	fmuls	%f27, %f27, %f27
	.word	0xaca03ead	! t0_kref+0x1520:   	subcc	%g0, -0x153, %l6
	.word	0x92c4e612	! t0_kref+0x1524:   	addccc	%l3, 0x612, %o1
	.word	0x9642f00a	! t0_kref+0x1528:   	addc	%o3, -0xff6, %o3
	.word	0xa9400000	! t0_kref+0x152c:   	mov	%y, %l4
	.word	0xc0c65000	! t0_kref+0x1530:   	ldswa	[%i1]0x80, %g0
	.word	0x34800001	! t0_kref+0x1534:   	bg,a	_kref+0x1538
	.word	0x81580000	! t0_kref+0x1538:   	flushw
	.word	0xf53e401d	! t0_kref+0x153c:   	std	%f26, [%i1 + %i5]
	.word	0xf700a004	! t0_kref+0x1540:   	ld	[%g2 + 4], %f27
	.word	0x9138201d	! t0_kref+0x1544:   	sra	%g0, 0x1d, %o0
	.word	0x92a5a7b7	! t0_kref+0x1548:   	subcc	%l6, 0x7b7, %o1
	.word	0xd400a028	! t0_kref+0x154c:   	ld	[%g2 + 0x28], %o2
	.word	0x96f53779	! t0_kref+0x1550:   	udivcc	%l4, -0x887, %o3
	.word	0xaaf36775	! t0_kref+0x1554:   	udivcc	%o5, 0x775, %l5
	.word	0x20800004	! t0_kref+0x1558:   	bn,a	_kref+0x1568
	.word	0x81dc4009	! t0_kref+0x155c:   	flush	%l1 + %o1
	.word	0xe26e601c	! t0_kref+0x1560:   	ldstub	[%i1 + 0x1c], %l1
	.word	0xf7062014	! t0_kref+0x1564:   	ld	[%i0 + 0x14], %f27
	.word	0x22800001	! t0_kref+0x1568:   	be,a	_kref+0x156c
	.word	0x9e2d800b	! t0_kref+0x156c:   	andn	%l6, %o3, %o7
	.word	0x93352017	! t0_kref+0x1570:   	srl	%l4, 0x17, %o1
	.word	0x9a8ac015	! t0_kref+0x1574:   	andcc	%o3, %l5, %o5
	.word	0xec466014	! t0_kref+0x1578:   	ldsw	[%i1 + 0x14], %l6
	.word	0xb5a0193b	! t0_kref+0x157c:   	fstod	%f27, %f26
	.word	0xda566018	! t0_kref+0x1580:   	ldsh	[%i1 + 0x18], %o5
	.word	0xb5a0193b	! t0_kref+0x1584:   	fstod	%f27, %f26
	.word	0x9ab6800c	! t0_kref+0x1588:   	orncc	%i2, %o4, %o5
	.word	0x9eba33d7	! t0_kref+0x158c:   	xnorcc	%o0, -0xc29, %o7
	.word	0xe4086e88	! t0_kref+0x1590:   	ldub	[%g1 + 0xe88], %l2
	.word	0xa41ca00c	! t0_kref+0x1594:   	xor	%l2, 0xc, %l2
	.word	0xe4286e88	! t0_kref+0x1598:   	stb	%l2, [%g1 + 0xe88]
	.word	0x81d86e88	! t0_kref+0x159c:   	flush	%g1 + 0xe88
	.word	0xe6362000	! t0_kref+0x15a0:   	sth	%l3, [%i0]
	.word	0x20480006	! t0_kref+0x15a4:   	bn,a,pt	%icc, _kref+0x15bc
	.word	0xace2c00d	! t0_kref+0x15a8:   	subccc	%o3, %o5, %l6
	.word	0xa4d4c000	! t0_kref+0x15ac:   	umulcc	%l3, %g0, %l2
	call	SYM(t0_subr0)
	.word	0x9252c00b	! t0_kref+0x15b4:   	umul	%o3, %o3, %o1
	.word	0xa23e8017	! t0_kref+0x15b8:   	xnor	%i2, %l7, %l1
	.word	0xf720a02c	! t0_kref+0x15bc:   	st	%f27, [%g2 + 0x2c]
	call	SYM(t0_subr2)
	.word	0xb7a01a5a	! t0_kref+0x15c4:   	fdtoi	%f26, %f27
2:	.word	0xa88273aa	! t0_kref+0x15c8:   	addcc	%o1, -0xc56, %l4
	.word	0x99302013	! t0_kref+0x15cc:   	srl	%g0, 0x13, %o4
	call	SYM(t0_subr0)
	.word	0xf1be580b	! t0_kref+0x15d4:   	stda	%f24, [%i1 + %o3]0xc0
	.word	0xd26e0000	! t0_kref+0x15d8:   	ldstub	[%i0], %o1
	.word	0x2e800005	! t0_kref+0x15dc:   	bvs,a	_kref+0x15f0
	.word	0xb7a0053b	! t0_kref+0x15e0:   	fsqrts	%f27, %f27
	.word	0x96156346	! t0_kref+0x15e4:   	or	%l5, 0x346, %o3
	.word	0x9abd0013	! t0_kref+0x15e8:   	xnorcc	%l4, %l3, %o5
	.word	0x933b4016	! t0_kref+0x15ec:   	sra	%o5, %l6, %o1
	.word	0xb5a688da	! t0_kref+0x15f0:   	fsubd	%f26, %f26, %f26
	.word	0xd43e3ff0	! t0_kref+0x15f4:   	std	%o2, [%i0 - 0x10]
	.word	0xd028a00b	! t0_kref+0x15f8:   	stb	%o0, [%g2 + 0xb]
	.word	0x2a800006	! t0_kref+0x15fc:   	bcs,a	_kref+0x1614
	.word	0x98b2369e	! t0_kref+0x1600:   	orncc	%o0, -0x962, %o4
	call	SYM(t0_subr0)
	.word	0xa8bd6ea1	! t0_kref+0x1608:   	xnorcc	%l5, 0xea1, %l4
	.word	0x9ea4e03b	! t0_kref+0x160c:   	subcc	%l3, 0x3b, %o7
	.word	0xda20a024	! t0_kref+0x1610:   	st	%o5, [%g2 + 0x24]
	.word	0xd0f61000	! t0_kref+0x1614:   	stxa	%o0, [%i0]0x80
	.word	0xa8f54014	! t0_kref+0x1618:   	udivcc	%l5, %l4, %l4
	.word	0xa4f58008	! t0_kref+0x161c:   	udivcc	%l6, %o0, %l2
	.word	0xab408000	! t0_kref+0x1620:   	mov	%ccr, %l5
	.word	0xec00a000	! t0_kref+0x1624:   	ld	[%g2], %l6
	.word	0x81aecabb	! t0_kref+0x1628:   	fcmpes	%fcc0, %f27, %f27
	.word	0xc12f0000	! t0_kref+0x162c:   	st	%fsr, [%i4]
	.word	0xa254ef42	! t0_kref+0x1630:   	umul	%l3, 0xf42, %l1
	.word	0xf720a008	! t0_kref+0x1634:   	st	%f27, [%g2 + 8]
	.word	0x24480008	! t0_kref+0x1638:   	ble,a,pt	%icc, _kref+0x1658
	.word	0xe86e8018	! t0_kref+0x163c:   	ldstub	[%i2 + %i0], %l4
	.word	0x94056b91	! t0_kref+0x1640:   	add	%l5, 0xb91, %o2
	.word	0x96b5aeaf	! t0_kref+0x1644:   	orncc	%l6, 0xeaf, %o3
	.word	0xb7a0189b	! t0_kref+0x1648:   	fitos	%f27, %f27
	.word	0xe4167fee	! t0_kref+0x164c:   	lduh	[%i1 - 0x12], %l2
	.word	0x81ae8a5a	! t0_kref+0x1650:   	fcmpd	%fcc0, %f26, %f26
	.word	0x81ae8ada	! t0_kref+0x1654:   	fcmped	%fcc0, %f26, %f26
	.word	0xa256b38f	! t0_kref+0x1658:   	umul	%i2, -0xc71, %l1
	.word	0x8d837f85	! t0_kref+0x165c:   	wr	%o5, 0xffffff85, %fprs
	.word	0xe4086f5c	! t0_kref+0x1660:   	ldub	[%g1 + 0xf5c], %l2
	.word	0xa41ca00c	! t0_kref+0x1664:   	xor	%l2, 0xc, %l2
	.word	0xe4286f5c	! t0_kref+0x1668:   	stb	%l2, [%g1 + 0xf5c]
	.word	0x81d86f5c	! t0_kref+0x166c:   	flush	%g1 + 0xf5c
	.word	0x81ae8a5a	! t0_kref+0x1670:   	fcmpd	%fcc0, %f26, %f26
	.word	0xe44e401a	! t0_kref+0x1674:   	ldsb	[%i1 + %i2], %l2
	.word	0x81ae8a5a	! t0_kref+0x1678:   	fcmpd	%fcc0, %f26, %f26
	.word	0x9f3d8015	! t0_kref+0x167c:   	sra	%l6, %l5, %o7
	.word	0x2a800003	! t0_kref+0x1680:   	bcs,a	_kref+0x168c
	.word	0xea060000	! t0_kref+0x1684:   	ld	[%i0], %l5
	.word	0xe24e200f	! t0_kref+0x1688:   	ldsb	[%i0 + 0xf], %l1
	.word	0x80358000	! t0_kref+0x168c:   	orn	%l6, %g0, %g0
	.word	0xec6e8018	! t0_kref+0x1690:   	ldstub	[%i2 + %i0], %l6
	.word	0xd4380018	! t0_kref+0x1694:   	std	%o2, [%g0 + %i0]
	.word	0x9332000b	! t0_kref+0x1698:   	srl	%o0, %o3, %o1
2:	.word	0xf780105c	! t0_kref+0x169c:   	lda	[%g0 + %i4]0x82, %f27
	.word	0xd02e401a	! t0_kref+0x16a0:   	stb	%o0, [%i1 + %i2]
	.word	0xd810a036	! t0_kref+0x16a4:   	lduh	[%g2 + 0x36], %o4
	.word	0x97368013	! t0_kref+0x16a8:   	srl	%i2, %l3, %o3
	.word	0xe208a016	! t0_kref+0x16ac:   	ldub	[%g2 + 0x16], %l1
	.word	0xb7a018da	! t0_kref+0x16b0:   	fdtos	%f26, %f27
	.word	0xec56c019	! t0_kref+0x16b4:   	ldsh	[%i3 + %i1], %l6
	.word	0x965dc00b	! t0_kref+0x16b8:   	smul	%l7, %o3, %o3
	.word	0xac283343	! t0_kref+0x16bc:   	andn	%g0, -0xcbd, %l6
	.word	0xf720a018	! t0_kref+0x16c0:   	st	%f27, [%g2 + 0x18]
	.word	0xf1be188a	! t0_kref+0x16c4:   	stda	%f24, [%i0 + %o2]0xc4
	.word	0xe448a015	! t0_kref+0x16c8:   	ldsb	[%g2 + 0x15], %l2
	.word	0x81df61b8	! t0_kref+0x16cc:   	flush	%i5 + 0x1b8
	.word	0xf19e5a1d	! t0_kref+0x16d0:   	ldda	[%i1 + %i5]0xd0, %f24
	.word	0xe6480018	! t0_kref+0x16d4:   	ldsb	[%g0 + %i0], %l3
	.word	0x81dbfb13	! t0_kref+0x16d8:   	flush	%o7 - 0x4ed
	.word	0xe86e401a	! t0_kref+0x16dc:   	ldstub	[%i1 + %i2], %l4
	.word	0x98750017	! t0_kref+0x16e0:   	udiv	%l4, %l7, %o4
	.word	0xd610a006	! t0_kref+0x16e4:   	lduh	[%g2 + 6], %o3
	.word	0x81de8019	! t0_kref+0x16e8:   	flush	%i2 + %i1
	.word	0xf76e7ff8	! t0_kref+0x16ec:   	prefetch	%i1 - 8, 27
	.word	0x37480001	! t0_kref+0x16f0:   	fbge,a,pt	%fcc0, _kref+0x16f4
	.word	0xb7a6c9bb	! t0_kref+0x16f4:   	fdivs	%f27, %f27, %f27
	.word	0xc36e4000	! t0_kref+0x16f8:   	prefetch	%i1, 1
	.word	0xb5a689da	! t0_kref+0x16fc:   	fdivd	%f26, %f26, %f26
	.word	0x94d68008	! t0_kref+0x1700:   	umulcc	%i2, %o0, %o2
	.word	0x81380009	! t0_kref+0x1704:   	sra	%g0, %o1, %g0
	.word	0x900aaec5	! t0_kref+0x1708:   	and	%o2, 0xec5, %o0
	.word	0x9fc10000	! t0_kref+0x170c:   	call	%g4
	.word	0xec9e5000	! t0_kref+0x1710:   	ldda	[%i1]0x80, %l6
	.word	0xb5a6895a	! t0_kref+0x1714:   	fmuld	%f26, %f26, %f26
	.word	0xb5a6cd3b	! t0_kref+0x1718:   	fsmuld	%f27, %f27, %f26
	.word	0x3e800006	! t0_kref+0x171c:   	bvc,a	_kref+0x1734
	.word	0xb7a6c8bb	! t0_kref+0x1720:   	fsubs	%f27, %f27, %f27
	.word	0x22800006	! t0_kref+0x1724:   	be,a	_kref+0x173c
	.word	0xe648a033	! t0_kref+0x1728:   	ldsb	[%g2 + 0x33], %l3
	.word	0x9822400c	! t0_kref+0x172c:   	sub	%o1, %o4, %o4
	.word	0x98532b9a	! t0_kref+0x1730:   	umul	%o4, 0xb9a, %o4
	.word	0x9fc10000	! t0_kref+0x1734:   	call	%g4
	.word	0xe216c018	! t0_kref+0x1738:   	lduh	[%i3 + %i0], %l1
	.word	0xe9e6100c	! t0_kref+0x173c:   	casa	[%i0]0x80, %o4, %l4
	.word	0xc020a028	! t0_kref+0x1740:   	clr	[%g2 + 0x28]
	.word	0x91418000	! t0_kref+0x1744:   	mov	%fprs, %o0
	.word	0x81aecabb	! t0_kref+0x1748:   	fcmpes	%fcc0, %f27, %f27
	.word	0xb5a688da	! t0_kref+0x174c:   	fsubd	%f26, %f26, %f26
	.word	0xf7267fe4	! t0_kref+0x1750:   	st	%f27, [%i1 - 0x1c]
	.word	0x9fc10000	! t0_kref+0x1754:   	call	%g4
	.word	0xa80aebe4	! t0_kref+0x1758:   	and	%o3, 0xbe4, %l4
	.word	0x81aecabb	! t0_kref+0x175c:   	fcmpes	%fcc0, %f27, %f27
	.word	0xb7a0053b	! t0_kref+0x1760:   	fsqrts	%f27, %f27
	.word	0xdad01018	! t0_kref+0x1764:   	ldsha	[%g0 + %i0]0x80, %o5
	.word	0xf1be600a	! t0_kref+0x1768:   	stda	%f24, [%i1 + 0xa]%asi
	.word	0xa4430016	! t0_kref+0x176c:   	addc	%o4, %l6, %l2
	.word	0xf19f1a18	! t0_kref+0x1770:   	ldda	[%i4 + %i0]0xd0, %f24
	.word	0x30800004	! t0_kref+0x1774:   	ba,a	_kref+0x1784
	.word	0xb7a0053b	! t0_kref+0x1778:   	fsqrts	%f27, %f27
	.word	0xc807bfe8	! t0_kref+0x177c:   	ld	[%fp - 0x18], %g4
	.word	0xf7263fe8	! t0_kref+0x1780:   	st	%f27, [%i0 - 0x18]
	.word	0xf53e3fe8	! t0_kref+0x1784:   	std	%f26, [%i0 - 0x18]
	.word	0x9a65800d	! t0_kref+0x1788:   	subc	%l6, %o5, %o5
	.word	0xb7a6c83b	! t0_kref+0x178c:   	fadds	%f27, %f27, %f27
	.word	0xde40a014	! t0_kref+0x1790:   	ldsw	[%g2 + 0x14], %o7
	.word	0xe87e6014	! t0_kref+0x1794:   	swap	[%i1 + 0x14], %l4
	.word	0xe8263ffc	! t0_kref+0x1798:   	st	%l4, [%i0 - 4]
	.word	0x38800002	! t0_kref+0x179c:   	bgu,a	_kref+0x17a4
	.word	0xf700a004	! t0_kref+0x17a0:   	ld	[%g2 + 4], %f27
	sethi	%hi(2f), %o7
	.word	0xe40be3bc	! t0_kref+0x17a8:   	ldub	[%o7 + 0x3bc], %l2
	.word	0xa41ca00c	! t0_kref+0x17ac:   	xor	%l2, 0xc, %l2
	.word	0xe42be3bc	! t0_kref+0x17b0:   	stb	%l2, [%o7 + 0x3bc]
	.word	0x81dbe3bc	! t0_kref+0x17b4:   	flush	%o7 + 0x3bc
	.word	0xf1be7fe4	! t0_kref+0x17b8:   	stda	%f24, [%i1 - 0x1c]%asi
2:	.word	0xe60e0000	! t0_kref+0x17bc:   	ldub	[%i0], %l3
	.word	0xf5bf5018	! t0_kref+0x17c0:   	stda	%f26, [%i5 + %i0]0x80
	.word	0xf51f4018	! t0_kref+0x17c4:   	ldd	[%i5 + %i0], %f26
	.word	0xf7067fe0	! t0_kref+0x17c8:   	ld	[%i1 - 0x20], %f27
	.word	0xf726600c	! t0_kref+0x17cc:   	st	%f27, [%i1 + 0xc]
	.word	0x9335800d	! t0_kref+0x17d0:   	srl	%l6, %o5, %o1
	.word	0x969db603	! t0_kref+0x17d4:   	xorcc	%l6, -0x9fd, %o3
	.word	0x81ae8ada	! t0_kref+0x17d8:   	fcmped	%fcc0, %f26, %f26
	.word	0xf53e4000	! t0_kref+0x17dc:   	std	%f26, [%i1]
	.word	0x9fc00004	! t0_kref+0x17e0:   	call	%g0 + %g4
	.word	0xd848a036	! t0_kref+0x17e4:   	ldsb	[%g2 + 0x36], %o4
	.word	0x908a801a	! t0_kref+0x17e8:   	andcc	%o2, %i2, %o0
	.word	0xf426401c	! t0_kref+0x17ec:   	st	%i2, [%i1 + %i4]
	.word	0x940abe33	! t0_kref+0x17f0:   	and	%o2, -0x1cd, %o2
	.word	0x172c4a7c	! t0_kref+0x17f4:   	sethi	%hi(0xb129f000), %o3
	.word	0xf7064000	! t0_kref+0x17f8:   	ld	[%i1], %f27
	.word	0xf700a024	! t0_kref+0x17fc:   	ld	[%g2 + 0x24], %f27
	.word	0x36800005	! t0_kref+0x1800:   	bge,a	_kref+0x1814
	.word	0xf59f5018	! t0_kref+0x1804:   	ldda	[%i5 + %i0]0x80, %f26
	.word	0x80f5000c	! t0_kref+0x1808:   	udivcc	%l4, %o4, %g0
	.word	0xb7a018da	! t0_kref+0x180c:   	fdtos	%f26, %f27
	.word	0xe4c71019	! t0_kref+0x1810:   	ldswa	[%i4 + %i1]0x80, %l2
	.word	0x97302008	! t0_kref+0x1814:   	srl	%g0, 0x8, %o3
	.word	0x80acebd9	! t0_kref+0x1818:   	andncc	%l3, 0xbd9, %g0
	.word	0x9b34e00f	! t0_kref+0x181c:   	srl	%l3, 0xf, %o5
	.word	0x9665ba27	! t0_kref+0x1820:   	subc	%l6, -0x5d9, %o3
	.word	0xb7a0013b	! t0_kref+0x1824:   	fabss	%f27, %f27
	.word	0xd278a018	! t0_kref+0x1828:   	swap	[%g2 + 0x18], %o1
	.word	0x37480003	! t0_kref+0x182c:   	fbge,a,pt	%fcc0, _kref+0x1838
	.word	0xd0563fe8	! t0_kref+0x1830:   	ldsh	[%i0 - 0x18], %o0
	.word	0x81df000a	! t0_kref+0x1834:   	flush	%i4 + %o2
	.word	0xa4f22712	! t0_kref+0x1838:   	udivcc	%o0, 0x712, %l2
	.word	0x9fc00004	! t0_kref+0x183c:   	call	%g0 + %g4
	.word	0xb7a01a3b	! t0_kref+0x1840:   	fstoi	%f27, %f27
	.word	0x27800006	! t0_kref+0x1844:   	fbul,a	_kref+0x185c
	.word	0xaada000d	! t0_kref+0x1848:   	smulcc	%o0, %o5, %l5
	.word	0xaaf34000	! t0_kref+0x184c:   	udivcc	%o5, %g0, %l5
	.word	0x99326003	! t0_kref+0x1850:   	srl	%o1, 0x3, %o4
	.word	0xaa3dc008	! t0_kref+0x1854:   	xnor	%l7, %o0, %l5
	.word	0xf7062010	! t0_kref+0x1858:   	ld	[%i0 + 0x10], %f27
	.word	0xe8500019	! t0_kref+0x185c:   	ldsh	[%g0 + %i1], %l4
	.word	0xaf3b2005	! t0_kref+0x1860:   	sra	%o4, 0x5, %l7
	.word	0x20800003	! t0_kref+0x1864:   	bn,a	_kref+0x1870
	.word	0xb7a6c9bb	! t0_kref+0x1868:   	fdivs	%f27, %f27, %f27
	.word	0xda28a011	! t0_kref+0x186c:   	stb	%o5, [%g2 + 0x11]
	.word	0x9644c017	! t0_kref+0x1870:   	addc	%l3, %l7, %o3
	.word	0x81ae8ada	! t0_kref+0x1874:   	fcmped	%fcc0, %f26, %f26
	.word	0xf51fbd60	! t0_kref+0x1878:   	ldd	[%fp - 0x2a0], %f26
	.word	0xd04e8019	! t0_kref+0x187c:   	ldsb	[%i2 + %i1], %o0
	.word	0xf5981019	! t0_kref+0x1880:   	ldda	[%g0 + %i1]0x80, %f26
	.word	0x80c2800d	! t0_kref+0x1884:   	addccc	%o2, %o5, %g0
	.word	0xaea27dbd	! t0_kref+0x1888:   	subcc	%o1, -0x243, %l7
	.word	0x911b401a	! t0_kref+0x188c:   	tsubcctv	%o5, %i2, %o0
	.word	0x8143c000	! t0_kref+0x1890:   	stbar
	.word	0xa9670014	! t0_kref+0x1894:   	movgu	%icc, %l4, %l4
	.word	0xb5a0193b	! t0_kref+0x1898:   	fstod	%f27, %f26
	.word	0xda270018	! t0_kref+0x189c:   	st	%o5, [%i4 + %i0]
	.word	0x36480001	! t0_kref+0x18a0:   	bge,a,pt	%icc, _kref+0x18a4
	.word	0xf700a014	! t0_kref+0x18a4:   	ld	[%g2 + 0x14], %f27
	.word	0xb7a01a3b	! t0_kref+0x18a8:   	fstoi	%f27, %f27
	.word	0x900d7d37	! t0_kref+0x18ac:   	and	%l5, -0x2c9, %o0
	.word	0xf700a038	! t0_kref+0x18b0:   	ld	[%g2 + 0x38], %f27
	.word	0x3c480003	! t0_kref+0x18b4:   	bpos,a,pt	%icc, _kref+0x18c0
	.word	0xd01e3ff8	! t0_kref+0x18b8:   	ldd	[%i0 - 8], %o0
	.word	0xee28a015	! t0_kref+0x18bc:   	stb	%l7, [%g2 + 0x15]
	.word	0xb7a6c93b	! t0_kref+0x18c0:   	fmuls	%f27, %f27, %f27
	.word	0xd616201e	! t0_kref+0x18c4:   	lduh	[%i0 + 0x1e], %o3
	.word	0x36800008	! t0_kref+0x18c8:   	bge,a	_kref+0x18e8
	.word	0xb5a6895a	! t0_kref+0x18cc:   	fmuld	%f26, %f26, %f26
	.word	0x30800007	! t0_kref+0x18d0:   	ba,a	_kref+0x18ec
	.word	0x9ab2a13c	! t0_kref+0x18d4:   	orncc	%o2, 0x13c, %o5
	.word	0x81aecabb	! t0_kref+0x18d8:   	fcmpes	%fcc0, %f27, %f27
	.word	0x9a532392	! t0_kref+0x18dc:   	umul	%o4, 0x392, %o5
	.word	0xe47e601c	! t0_kref+0x18e0:   	swap	[%i1 + 0x1c], %l2
	.word	0x91400000	! t0_kref+0x18e4:   	mov	%y, %o0
	.word	0x9855400d	! t0_kref+0x18e8:   	umul	%l5, %o5, %o4
	.word	0xa91836e7	! t0_kref+0x18ec:   	tsubcctv	%g0, -0x919, %l4
	call	SYM(t0_subr2)
	.word	0x9ac30016	! t0_kref+0x18f4:   	addccc	%o4, %l6, %o5
	.word	0xb5a688da	! t0_kref+0x18f8:   	fsubd	%f26, %f26, %f26
	.word	0x81aeca3b	! t0_kref+0x18fc:   	fcmps	%fcc0, %f27, %f27
	.word	0xe4ff1018	! t0_kref+0x1900:   	swapa	[%i4 + %i0]0x80, %l2
	.word	0xa2c00008	! t0_kref+0x1904:   	addccc	%g0, %o0, %l1
	.word	0xd8871019	! t0_kref+0x1908:   	lda	[%i4 + %i1]0x80, %o4
	.word	0x96527fc8	! t0_kref+0x190c:   	umul	%o1, -0x38, %o3
	.word	0xb7a6c93b	! t0_kref+0x1910:   	fmuls	%f27, %f27, %f27
	.word	0xd240a030	! t0_kref+0x1914:   	ldsw	[%g2 + 0x30], %o1
	.word	0xaa5b64ab	! t0_kref+0x1918:   	smul	%o5, 0x4ab, %l5
	.word	0xb5a689da	! t0_kref+0x191c:   	fdivd	%f26, %f26, %f26
	.word	0x8143c000	! t0_kref+0x1920:   	stbar
	.word	0xaab6afbc	! t0_kref+0x1924:   	orncc	%i2, 0xfbc, %l5
	.word	0xb7a0013b	! t0_kref+0x1928:   	fabss	%f27, %f27
	.word	0xf700a014	! t0_kref+0x192c:   	ld	[%g2 + 0x14], %f27
	.word	0xe8000018	! t0_kref+0x1930:   	ld	[%g0 + %i0], %l4
	.word	0xee00a00c	! t0_kref+0x1934:   	ld	[%g2 + 0xc], %l7
	.word	0xf706401c	! t0_kref+0x1938:   	ld	[%i1 + %i4], %f27
	.word	0x8143c000	! t0_kref+0x193c:   	stbar
	.word	0xe600a028	! t0_kref+0x1940:   	ld	[%g2 + 0x28], %l3
	.word	0xb7a0013b	! t0_kref+0x1944:   	fabss	%f27, %f27
	.word	0xae62e660	! t0_kref+0x1948:   	subc	%o3, 0x660, %l7
	.word	0xde0e401a	! t0_kref+0x194c:   	ldub	[%i1 + %i2], %o7
	.word	0xa82aa281	! t0_kref+0x1950:   	andn	%o2, 0x281, %l4
	.word	0x81aecabb	! t0_kref+0x1954:   	fcmpes	%fcc0, %f27, %f27
	.word	0x81dd8017	! t0_kref+0x1958:   	flush	%l6 + %l7
	.word	0xaa4325f7	! t0_kref+0x195c:   	addc	%o4, 0x5f7, %l5
	.word	0x80bb0015	! t0_kref+0x1960:   	xnorcc	%o4, %l5, %g0
	.word	0xe450a03a	! t0_kref+0x1964:   	ldsh	[%g2 + 0x3a], %l2
	.word	0x90b5aad5	! t0_kref+0x1968:   	orncc	%l6, 0xad5, %o0
	.word	0xa63b001a	! t0_kref+0x196c:   	xnor	%o4, %i2, %l3
	.word	0x9aae800a	! t0_kref+0x1970:   	andncc	%i2, %o2, %o5
	.word	0xd03e7ff0	! t0_kref+0x1974:   	std	%o0, [%i1 - 0x10]
	.word	0xf5380019	! t0_kref+0x1978:   	std	%f26, [%g0 + %i1]
	.word	0xb7a000bb	! t0_kref+0x197c:   	fnegs	%f27, %f27
	.word	0xaca20016	! t0_kref+0x1980:   	subcc	%o0, %l6, %l6
	.word	0xf51fbe58	! t0_kref+0x1984:   	ldd	[%fp - 0x1a8], %f26
	.word	0xda564000	! t0_kref+0x1988:   	ldsh	[%i1], %o5
	.word	0x96d33170	! t0_kref+0x198c:   	umulcc	%o4, -0xe90, %o3
	.word	0xb7a6c93b	! t0_kref+0x1990:   	fmuls	%f27, %f27, %f27
	.word	0xf7200019	! t0_kref+0x1994:   	st	%f27, [%g0 + %i1]
	.word	0xda6e0000	! t0_kref+0x1998:   	ldstub	[%i0], %o5
	sethi	%hi(2f), %o7
	.word	0xe40be1e8	! t0_kref+0x19a0:   	ldub	[%o7 + 0x1e8], %l2
	.word	0xa41ca00c	! t0_kref+0x19a4:   	xor	%l2, 0xc, %l2
	.word	0xe42be1e8	! t0_kref+0x19a8:   	stb	%l2, [%o7 + 0x1e8]
	.word	0x81dbe1e8	! t0_kref+0x19ac:   	flush	%o7 + 0x1e8
	.word	0xf51fbec0	! t0_kref+0x19b0:   	ldd	[%fp - 0x140], %f26
	.word	0xf7067ff0	! t0_kref+0x19b4:   	ld	[%i1 - 0x10], %f27
	.word	0x29480005	! t0_kref+0x19b8:   	fbl,a,pt	%fcc0, _kref+0x19cc
	.word	0xe656600c	! t0_kref+0x19bc:   	ldsh	[%i1 + 0xc], %l3
	.word	0x8d85b9b2	! t0_kref+0x19c0:   	wr	%l6, 0xfffff9b2, %fprs
	.word	0xf5180018	! t0_kref+0x19c4:   	ldd	[%g0 + %i0], %f26
	.word	0x2e800001	! t0_kref+0x19c8:   	bvs,a	_kref+0x19cc
	.word	0xae8de770	! t0_kref+0x19cc:   	andcc	%l7, 0x770, %l7
	.word	0xfc3f4005	! t0_kref+0x19d0:   	std	%fp, [%i5 + %g5]
	.word	0xb7a018da	! t0_kref+0x19d4:   	fdtos	%f26, %f27
	.word	0xf3ee101c	! t0_kref+0x19d8:   	prefetcha	%i0 + %i4, 25
	.word	0x81dd273c	! t0_kref+0x19dc:   	flush	%l4 + 0x73c
	.word	0xb5a689da	! t0_kref+0x19e0:   	fdivd	%f26, %f26, %f26
	.word	0x3f800007	! t0_kref+0x19e4:   	fbo,a	_kref+0x1a00
2:	.word	0xa0a575e2	! t0_kref+0x19e8:   	subcc	%l5, -0xa1e, %l0
	.word	0xb7a000bb	! t0_kref+0x19ec:   	fnegs	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0x19f0:   	fsqrts	%f27, %f27
	.word	0xae280013	! t0_kref+0x19f4:   	andn	%g0, %l3, %l7
	.word	0x81aeca3b	! t0_kref+0x19f8:   	fcmps	%fcc0, %f27, %f27
	.word	0xe616401b	! t0_kref+0x19fc:   	lduh	[%i1 + %i3], %l3
	.word	0xf1be5888	! t0_kref+0x1a00:   	stda	%f24, [%i1 + %o0]0xc4
	.word	0x9b3a0015	! t0_kref+0x1a04:   	sra	%o0, %l5, %o5
	.word	0xb5a6cd3b	! t0_kref+0x1a08:   	fsmuld	%f27, %f27, %f26
	.word	0xad3a2009	! t0_kref+0x1a0c:   	sra	%o0, 0x9, %l6
	.word	0xa6bd286a	! t0_kref+0x1a10:   	xnorcc	%l4, 0x86a, %l3
	.word	0xf700a03c	! t0_kref+0x1a14:   	ld	[%g2 + 0x3c], %f27
	.word	0x33480007	! t0_kref+0x1a18:   	fbe,a,pt	%fcc0, _kref+0x1a34
	.word	0xdac6101c	! t0_kref+0x1a1c:   	ldswa	[%i0 + %i4]0x80, %o5
	.word	0xe4070019	! t0_kref+0x1a20:   	ld	[%i4 + %i1], %l2
	.word	0xb7a6c9bb	! t0_kref+0x1a24:   	fdivs	%f27, %f27, %f27
	.word	0x96a5c013	! t0_kref+0x1a28:   	subcc	%l7, %l3, %o3
	.word	0x24800007	! t0_kref+0x1a2c:   	ble,a	_kref+0x1a48
	.word	0xe8063fe4	! t0_kref+0x1a30:   	ld	[%i0 - 0x1c], %l4
	.word	0x9b400000	! t0_kref+0x1a34:   	mov	%y, %o5
	.word	0xeeb6101b	! t0_kref+0x1a38:   	stha	%l7, [%i0 + %i3]0x80
	.word	0xb7a0013b	! t0_kref+0x1a3c:   	fabss	%f27, %f27
	.word	0xd4066014	! t0_kref+0x1a40:   	ld	[%i1 + 0x14], %o2
	.word	0xec0e201b	! t0_kref+0x1a44:   	ldub	[%i0 + 0x1b], %l6
	.word	0x2f800003	! t0_kref+0x1a48:   	fbu,a	_kref+0x1a54
	.word	0xe27e2004	! t0_kref+0x1a4c:   	swap	[%i0 + 4], %l1
	.word	0x907e800b	! t0_kref+0x1a50:   	sdiv	%i2, %o3, %o0
	.word	0xb7a0013b	! t0_kref+0x1a54:   	fabss	%f27, %f27
	.word	0xb7a018da	! t0_kref+0x1a58:   	fdtos	%f26, %f27
	.word	0xae522a21	! t0_kref+0x1a5c:   	umul	%o0, 0xa21, %l7
	.word	0xf720a02c	! t0_kref+0x1a60:   	st	%f27, [%g2 + 0x2c]
	.word	0xde50a00e	! t0_kref+0x1a64:   	ldsh	[%g2 + 0xe], %o7
	.word	0xb7a01a5a	! t0_kref+0x1a68:   	fdtoi	%f26, %f27
	.word	0x8143e064	! t0_kref+0x1a6c:   	membar	0x64
	.word	0x3b480004	! t0_kref+0x1a70:   	fble,a,pt	%fcc0, _kref+0x1a80
	.word	0xb7a0003b	! t0_kref+0x1a74:   	fmovs	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0x1a78:   	fsqrts	%f27, %f27
	.word	0x31800008	! t0_kref+0x1a7c:   	fba,a	_kref+0x1a9c
	.word	0xf19f1a59	! t0_kref+0x1a80:   	ldda	[%i4 + %i1]0xd2, %f24
	.word	0xb7a018da	! t0_kref+0x1a84:   	fdtos	%f26, %f27
	.word	0xe628a028	! t0_kref+0x1a88:   	stb	%l3, [%g2 + 0x28]
	.word	0xf51fbce0	! t0_kref+0x1a8c:   	ldd	[%fp - 0x320], %f26
	.word	0xa8458015	! t0_kref+0x1a90:   	addc	%l6, %l5, %l4
	.word	0xe9e65014	! t0_kref+0x1a94:   	casa	[%i1]0x80, %l4, %l4
	.word	0xb7a01a5a	! t0_kref+0x1a98:   	fdtoi	%f26, %f27
	.word	0x96ab3378	! t0_kref+0x1a9c:   	andncc	%o4, -0xc88, %o3
	.word	0xb7a0053b	! t0_kref+0x1aa0:   	fsqrts	%f27, %f27
	.word	0xc048a03e	! t0_kref+0x1aa4:   	ldsb	[%g2 + 0x3e], %g0
	.word	0xc07e0000	! t0_kref+0x1aa8:   	swap	[%i0], %g0
	.word	0xb7a0053b	! t0_kref+0x1aac:   	fsqrts	%f27, %f27
	.word	0xb7a018da	! t0_kref+0x1ab0:   	fdtos	%f26, %f27
	.word	0x9e3dfa10	! t0_kref+0x1ab4:   	xnor	%l7, -0x5f0, %o7
	.word	0xb7a6c8bb	! t0_kref+0x1ab8:   	fsubs	%f27, %f27, %f27
	.word	0xf700a020	! t0_kref+0x1abc:   	ld	[%g2 + 0x20], %f27
	.word	0x929dedc7	! t0_kref+0x1ac0:   	xorcc	%l7, 0xdc7, %o1
	.word	0xf7262008	! t0_kref+0x1ac4:   	st	%f27, [%i0 + 8]
	.word	0xb7a0003b	! t0_kref+0x1ac8:   	fmovs	%f27, %f27
	.word	0xf7066014	! t0_kref+0x1acc:   	ld	[%i1 + 0x14], %f27
	.word	0x81aeca3b	! t0_kref+0x1ad0:   	fcmps	%fcc0, %f27, %f27
	.word	0xb7a0189b	! t0_kref+0x1ad4:   	fitos	%f27, %f27
	.word	0xb7a0003b	! t0_kref+0x1ad8:   	fmovs	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x1adc:   	fitos	%f27, %f27
	.word	0x2d800005	! t0_kref+0x1ae0:   	fbg,a	_kref+0x1af4
	.word	0xb7a0013b	! t0_kref+0x1ae4:   	fabss	%f27, %f27
	.word	0x21480005	! t0_kref+0x1ae8:   	fbn,a,pt	%fcc0, _kref+0x1afc
	.word	0xb7a6c93b	! t0_kref+0x1aec:   	fmuls	%f27, %f27, %f27
	.word	0xd000a028	! t0_kref+0x1af0:   	ld	[%g2 + 0x28], %o0
	.word	0xf53e7fe8	! t0_kref+0x1af4:   	std	%f26, [%i1 - 0x18]
	.word	0xee30a022	! t0_kref+0x1af8:   	sth	%l7, [%g2 + 0x22]
	.word	0xb5a688da	! t0_kref+0x1afc:   	fsubd	%f26, %f26, %f26
	.word	0xd856200c	! t0_kref+0x1b00:   	ldsh	[%i0 + 0xc], %o4
	.word	0x962a800b	! t0_kref+0x1b04:   	andn	%o2, %o3, %o3
	.word	0xaef5b8d2	! t0_kref+0x1b08:   	udivcc	%l6, -0x72e, %l7
	.word	0x94dafce6	! t0_kref+0x1b0c:   	smulcc	%o3, -0x31a, %o2
	.word	0x9f3a4014	! t0_kref+0x1b10:   	sra	%o1, %l4, %o7
	.word	0xb7a0189b	! t0_kref+0x1b14:   	fitos	%f27, %f27
	.word	0xda200019	! t0_kref+0x1b18:   	st	%o5, [%g0 + %i1]
	.word	0x36800008	! t0_kref+0x1b1c:   	bge,a	_kref+0x1b3c
	.word	0xa83d3d19	! t0_kref+0x1b20:   	xnor	%l4, -0x2e7, %l4
	.word	0xd24e2001	! t0_kref+0x1b24:   	ldsb	[%i0 + 1], %o1
	.word	0x9b300017	! t0_kref+0x1b28:   	srl	%g0, %l7, %o5
	.word	0xea36001b	! t0_kref+0x1b2c:   	sth	%l5, [%i0 + %i3]
	.word	0x34800001	! t0_kref+0x1b30:   	bg,a	_kref+0x1b34
	.word	0xea264000	! t0_kref+0x1b34:   	st	%l5, [%i1]
	.word	0xee20a028	! t0_kref+0x1b38:   	st	%l7, [%g2 + 0x28]
	.word	0xd868a006	! t0_kref+0x1b3c:   	ldstub	[%g2 + 6], %o4
	.word	0xf51e3fe0	! t0_kref+0x1b40:   	ldd	[%i0 - 0x20], %f26
	.word	0xa816a3ee	! t0_kref+0x1b44:   	or	%i2, 0x3ee, %l4
	.word	0xab3d6008	! t0_kref+0x1b48:   	sra	%l5, 0x8, %l5
	.word	0xe8567fe6	! t0_kref+0x1b4c:   	ldsh	[%i1 - 0x1a], %l4
	.word	0x8143c000	! t0_kref+0x1b50:   	stbar
	.word	0xa60b000b	! t0_kref+0x1b54:   	and	%o4, %o3, %l3
	.word	0x81aeca3b	! t0_kref+0x1b58:   	fcmps	%fcc0, %f27, %f27
	.word	0x81de401e	! t0_kref+0x1b5c:   	flush	%i1 + %fp
	.word	0x9835aa7b	! t0_kref+0x1b60:   	orn	%l6, 0xa7b, %o4
	.word	0xb7a6c93b	! t0_kref+0x1b64:   	fmuls	%f27, %f27, %f27
	.word	0xd4780019	! t0_kref+0x1b68:   	swap	[%g0 + %i1], %o2
	.word	0x982d8014	! t0_kref+0x1b6c:   	andn	%l6, %l4, %o4
	.word	0xfb6e3fe0	! t0_kref+0x1b70:   	prefetch	%i0 - 0x20, 29
	.word	0xb7a000bb	! t0_kref+0x1b74:   	fnegs	%f27, %f27
	.word	0xf1be5897	! t0_kref+0x1b78:   	stda	%f24, [%i1 + %l7]0xc4
	.word	0xb7a6c8bb	! t0_kref+0x1b7c:   	fsubs	%f27, %f27, %f27
	.word	0xa852f17b	! t0_kref+0x1b80:   	umul	%o3, -0xe85, %l4
	.word	0x8d85c016	! t0_kref+0x1b84:   	wr	%l7, %l6, %fprs
	.word	0xb5a6895a	! t0_kref+0x1b88:   	fmuld	%f26, %f26, %f26
	.word	0xf7067fe4	! t0_kref+0x1b8c:   	ld	[%i1 - 0x1c], %f27
	.word	0xf7067ff4	! t0_kref+0x1b90:   	ld	[%i1 - 0xc], %f27
	.word	0x993da00f	! t0_kref+0x1b94:   	sra	%l6, 0xf, %o4
	.word	0x9ea2f6d8	! t0_kref+0x1b98:   	subcc	%o3, -0x928, %o7
	call	SYM(t0_subr2)
	.word	0xd248a004	! t0_kref+0x1ba0:   	ldsb	[%g2 + 4], %o1
	.word	0xb5a689da	! t0_kref+0x1ba4:   	fdivd	%f26, %f26, %f26
	.word	0x953d2007	! t0_kref+0x1ba8:   	sra	%l4, 0x7, %o2
	.word	0xe47f0018	! t0_kref+0x1bac:   	swap	[%i4 + %i0], %l2
	.word	0xb7a0053b	! t0_kref+0x1bb0:   	fsqrts	%f27, %f27
	call	SYM(t0_subr3)
	.word	0xec30a01e	! t0_kref+0x1bb8:   	sth	%l6, [%g2 + 0x1e]
	.word	0x3f800006	! t0_kref+0x1bbc:   	fbo,a	_kref+0x1bd4
	.word	0xf51e3fe0	! t0_kref+0x1bc0:   	ldd	[%i0 - 0x20], %f26
	.word	0xf19e7fe4	! t0_kref+0x1bc4:   	ldda	[%i1 - 0x1c]%asi, %f24
	.word	0x81ae8a5a	! t0_kref+0x1bc8:   	fcmpd	%fcc0, %f26, %f26
	.word	0xec08a015	! t0_kref+0x1bcc:   	ldub	[%g2 + 0x15], %l6
	.word	0x9fc00004	! t0_kref+0x1bd0:   	call	%g0 + %g4
	.word	0xab400000	! t0_kref+0x1bd4:   	mov	%y, %l5
	.word	0x80524000	! t0_kref+0x1bd8:   	umul	%o1, %g0, %g0
	.word	0xb7a6c8bb	! t0_kref+0x1bdc:   	fsubs	%f27, %f27, %f27
	.word	0x80880017	! t0_kref+0x1be0:   	btst	%l7, %g0
	sethi	%hi(2f), %o7
	.word	0xe40be024	! t0_kref+0x1be8:   	ldub	[%o7 + 0x24], %l2
	.word	0xa41ca00c	! t0_kref+0x1bec:   	xor	%l2, 0xc, %l2
	.word	0xe42be024	! t0_kref+0x1bf0:   	stb	%l2, [%o7 + 0x24]
	.word	0x81dbe024	! t0_kref+0x1bf4:   	flush	%o7 + 0x24
	.word	0xb7a000bb	! t0_kref+0x1bf8:   	fnegs	%f27, %f27
	.word	0x2c800007	! t0_kref+0x1bfc:   	bneg,a	_kref+0x1c18
	.word	0x9a882584	! t0_kref+0x1c00:   	andcc	%g0, 0x584, %o5
	.word	0x9fc10000	! t0_kref+0x1c04:   	call	%g4
	.word	0xb7a0053b	! t0_kref+0x1c08:   	fsqrts	%f27, %f27
	.word	0x2a480004	! t0_kref+0x1c0c:   	bcs,a,pt	%icc, _kref+0x1c1c
	.word	0xe808a00d	! t0_kref+0x1c10:   	ldub	[%g2 + 0xd], %l4
	.word	0xf720a028	! t0_kref+0x1c14:   	st	%f27, [%g2 + 0x28]
	.word	0xb7a0003b	! t0_kref+0x1c18:   	fmovs	%f27, %f27
	.word	0xb5a688da	! t0_kref+0x1c1c:   	fsubd	%f26, %f26, %f26
	.word	0xb7a0013b	! t0_kref+0x1c20:   	fabss	%f27, %f27
2:	.word	0xa0b3683e	! t0_kref+0x1c24:   	orncc	%o5, 0x83e, %l0
	.word	0xe810a026	! t0_kref+0x1c28:   	lduh	[%g2 + 0x26], %l4
	.word	0x29800001	! t0_kref+0x1c2c:   	fbl,a	_kref+0x1c30
	.word	0xee7e7ff4	! t0_kref+0x1c30:   	swap	[%i1 - 0xc], %l7
	.word	0xae2d27f8	! t0_kref+0x1c34:   	andn	%l4, 0x7f8, %l7
	.word	0xb5a6cd3b	! t0_kref+0x1c38:   	fsmuld	%f27, %f27, %f26
	.word	0xeb68a000	! t0_kref+0x1c3c:   	prefetch	%g2, 21
	.word	0x3e480006	! t0_kref+0x1c40:   	bvc,a,pt	%icc, _kref+0x1c58
	.word	0xd820a010	! t0_kref+0x1c44:   	st	%o4, [%g2 + 0x10]
	.word	0x35480008	! t0_kref+0x1c48:   	fbue,a,pt	%fcc0, _kref+0x1c68
	.word	0xb7a0053b	! t0_kref+0x1c4c:   	fsqrts	%f27, %f27
	.word	0xf53e401d	! t0_kref+0x1c50:   	std	%f26, [%i1 + %i5]
	.word	0x90f2725c	! t0_kref+0x1c54:   	udivcc	%o1, -0xda4, %o0
	.word	0x9245c008	! t0_kref+0x1c58:   	addc	%l7, %o0, %o1
	.word	0xba102000	! t0_kref+0x1c5c:   	mov	0x0, %i5
	.word	0xf51e2008	! t0_kref+0x1c60:   	ldd	[%i0 + 8], %f26
	.word	0x2b480003	! t0_kref+0x1c64:   	fbug,a,pt	%fcc0, _kref+0x1c70
	.word	0xe486501c	! t0_kref+0x1c68:   	lda	[%i1 + %i4]0x80, %l2
	.word	0xb7a0003b	! t0_kref+0x1c6c:   	fmovs	%f27, %f27
	.word	0x21800006	! t0_kref+0x1c70:   	fbn,a	_kref+0x1c88
	.word	0xd02e3ffd	! t0_kref+0x1c74:   	stb	%o0, [%i0 - 3]
	.word	0x8143c000	! t0_kref+0x1c78:   	stbar
	.word	0xd2871058	! t0_kref+0x1c7c:   	lda	[%i4 + %i0]0x82, %o1
	.word	0xb7a0189b	! t0_kref+0x1c80:   	fitos	%f27, %f27
	.word	0x81ae8ada	! t0_kref+0x1c84:   	fcmped	%fcc0, %f26, %f26
	.word	0xb7a01a3b	! t0_kref+0x1c88:   	fstoi	%f27, %f27
	.word	0x805530cb	! t0_kref+0x1c8c:   	umul	%l4, -0xf35, %g0
	.word	0x26800008	! t0_kref+0x1c90:   	bl,a	_kref+0x1cb0
	.word	0xf7000019	! t0_kref+0x1c94:   	ld	[%g0 + %i1], %f27
	.word	0xc07e7ff0	! t0_kref+0x1c98:   	swap	[%i1 - 0x10], %g0
	.word	0xa4d68017	! t0_kref+0x1c9c:   	umulcc	%i2, %l7, %l2
	.word	0x3e480004	! t0_kref+0x1ca0:   	bvc,a,pt	%icc, _kref+0x1cb0
	.word	0xa73b6005	! t0_kref+0x1ca4:   	sra	%o5, 0x5, %l3
	.word	0xb7a0053b	! t0_kref+0x1ca8:   	fsqrts	%f27, %f27
	call	SYM(t0_subr1)
	.word	0x8143c000	! t0_kref+0x1cb0:   	stbar
	.word	0xb7a6c9bb	! t0_kref+0x1cb4:   	fdivs	%f27, %f27, %f27
	.word	0xe856001b	! t0_kref+0x1cb8:   	ldsh	[%i0 + %i3], %l4
	.word	0x925de33e	! t0_kref+0x1cbc:   	smul	%l7, 0x33e, %o1
	.word	0xb7a0189b	! t0_kref+0x1cc0:   	fitos	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x1cc4:   	fitos	%f27, %f27
	.word	0x9e32f897	! t0_kref+0x1cc8:   	orn	%o3, -0x769, %o7
	.word	0x81ae8a5a	! t0_kref+0x1ccc:   	fcmpd	%fcc0, %f26, %f26
	.word	0xe4066008	! t0_kref+0x1cd0:   	ld	[%i1 + 8], %l2
	call	SYM(t0_subr1)
	.word	0xf5bf5018	! t0_kref+0x1cd8:   	stda	%f26, [%i5 + %i0]0x80
	.word	0x97336007	! t0_kref+0x1cdc:   	srl	%o5, 0x7, %o3
	.word	0x96aac016	! t0_kref+0x1ce0:   	andncc	%o3, %l6, %o3
	.word	0xae2a74e4	! t0_kref+0x1ce4:   	andn	%o1, -0xb1c, %l7
	.word	0x80753a76	! t0_kref+0x1ce8:   	udiv	%l4, -0x58a, %g0
	.word	0xa6b5ed80	! t0_kref+0x1cec:   	orncc	%l7, 0xd80, %l3
	.word	0x94d68014	! t0_kref+0x1cf0:   	umulcc	%i2, %l4, %o2
	.word	0xd43e401d	! t0_kref+0x1cf4:   	std	%o2, [%i1 + %i5]
	.word	0xe4de5000	! t0_kref+0x1cf8:   	ldxa	[%i1]0x80, %l2
	.word	0xf4b61000	! t0_kref+0x1cfc:   	stha	%i2, [%i0]0x80
	.word	0x39480005	! t0_kref+0x1d00:   	fbuge,a,pt	%fcc0, _kref+0x1d14
	.word	0xd2f6101d	! t0_kref+0x1d04:   	stxa	%o1, [%i0 + %i5]0x80
	.word	0xf706401c	! t0_kref+0x1d08:   	ld	[%i1 + %i4], %f27
	.word	0x2f800002	! t0_kref+0x1d0c:   	fbu,a	_kref+0x1d14
	.word	0xb7a0003b	! t0_kref+0x1d10:   	fmovs	%f27, %f27
	.word	0x25800004	! t0_kref+0x1d14:   	fblg,a	_kref+0x1d24
	.word	0xb7a0003b	! t0_kref+0x1d18:   	fmovs	%f27, %f27
	.word	0xf7062008	! t0_kref+0x1d1c:   	ld	[%i0 + 8], %f27
	.word	0x3e480001	! t0_kref+0x1d20:   	bvc,a,pt	%icc, _kref+0x1d24
	.word	0x8583400a	! t0_kref+0x1d24:   	wr	%o5, %o2, %ccr
	.word	0x3d480007	! t0_kref+0x1d28:   	fbule,a,pt	%fcc0, _kref+0x1d44
	.word	0x81d8400e	! t0_kref+0x1d2c:   	flush	%g1 + %sp
	.word	0xb7a01a5a	! t0_kref+0x1d30:   	fdtoi	%f26, %f27
	.word	0xda7e3ff8	! t0_kref+0x1d34:   	swap	[%i0 - 8], %o5
	.word	0xf7262014	! t0_kref+0x1d38:   	st	%f27, [%i0 + 0x14]
	.word	0x81aecabb	! t0_kref+0x1d3c:   	fcmpes	%fcc0, %f27, %f27
	.word	0xf007bfe0	! t0_kref+0x1d40:   	ld	[%fp - 0x20], %i0
	.word	0x81aecabb	! t0_kref+0x1d44:   	fcmpes	%fcc0, %f27, %f27
	.word	0x8143e04f	! t0_kref+0x1d48:   	membar	0x4f
	.word	0xa8d0000b	! t0_kref+0x1d4c:   	umulcc	%g0, %o3, %l4
	.word	0x23480003	! t0_kref+0x1d50:   	fbne,a,pt	%fcc0, _kref+0x1d5c
	.word	0xb7a000bb	! t0_kref+0x1d54:   	fnegs	%f27, %f27
	.word	0xac56801a	! t0_kref+0x1d58:   	umul	%i2, %i2, %l6
	.word	0xf706001c	! t0_kref+0x1d5c:   	ld	[%i0 + %i4], %f27
	.word	0x81db4004	! t0_kref+0x1d60:   	flush	%o5 + %g4
	.word	0x9ec4fdbc	! t0_kref+0x1d64:   	addccc	%l3, -0x244, %o7
	.word	0xf51e2008	! t0_kref+0x1d68:   	ldd	[%i0 + 8], %f26
	.word	0xb7a6c83b	! t0_kref+0x1d6c:   	fadds	%f27, %f27, %f27
	.word	0xf53f4018	! t0_kref+0x1d70:   	std	%f26, [%i5 + %i0]
	.word	0x973ea003	! t0_kref+0x1d74:   	sra	%i2, 0x3, %o3
	.word	0x81aecabb	! t0_kref+0x1d78:   	fcmpes	%fcc0, %f27, %f27
	.word	0xd0c71019	! t0_kref+0x1d7c:   	ldswa	[%i4 + %i1]0x80, %o0
	.word	0x8143c000	! t0_kref+0x1d80:   	stbar
	.word	0x24800003	! t0_kref+0x1d84:   	ble,a	_kref+0x1d90
	.word	0xa462eb0c	! t0_kref+0x1d88:   	subc	%o3, 0xb0c, %l2
	.word	0xf5be1000	! t0_kref+0x1d8c:   	stda	%f26, [%i0]0x80
	.word	0xd020a018	! t0_kref+0x1d90:   	st	%o0, [%g2 + 0x18]
	.word	0x32800003	! t0_kref+0x1d94:   	bne,a	_kref+0x1da0
	.word	0x9e2b3d58	! t0_kref+0x1d98:   	andn	%o4, -0x2a8, %o7
	.word	0xc00e3ff6	! t0_kref+0x1d9c:   	ldub	[%i0 - 0xa], %g0
	.word	0xad400000	! t0_kref+0x1da0:   	mov	%y, %l6
	.word	0xb7a0189b	! t0_kref+0x1da4:   	fitos	%f27, %f27
	.word	0xb5a0193b	! t0_kref+0x1da8:   	fstod	%f27, %f26
	.word	0x37800003	! t0_kref+0x1dac:   	fbge,a	_kref+0x1db8
	.word	0xb7a0189b	! t0_kref+0x1db0:   	fitos	%f27, %f27
	.word	0xea0e401a	! t0_kref+0x1db4:   	ldub	[%i1 + %i2], %l5
	.word	0xab382005	! t0_kref+0x1db8:   	sra	%g0, 0x5, %l5
	.word	0x26800006	! t0_kref+0x1dbc:   	bl,a	_kref+0x1dd4
	.word	0x902a0016	! t0_kref+0x1dc0:   	andn	%o0, %l6, %o0
	.word	0x38800005	! t0_kref+0x1dc4:   	bgu,a	_kref+0x1dd8
	.word	0xb5a689da	! t0_kref+0x1dc8:   	fdivd	%f26, %f26, %f26
	.word	0xd430a004	! t0_kref+0x1dcc:   	sth	%o2, [%g2 + 4]
	.word	0x32800003	! t0_kref+0x1dd0:   	bne,a	_kref+0x1ddc
	.word	0xaa05f086	! t0_kref+0x1dd4:   	add	%l7, -0xf7a, %l5
	.word	0xf53e7fe8	! t0_kref+0x1dd8:   	std	%f26, [%i1 - 0x18]
	.word	0x81aecabb	! t0_kref+0x1ddc:   	fcmpes	%fcc0, %f27, %f27
	.word	0xb7a01a5a	! t0_kref+0x1de0:   	fdtoi	%f26, %f27
	.word	0xf51f4019	! t0_kref+0x1de4:   	ldd	[%i5 + %i1], %f26
	.word	0xb7a0013b	! t0_kref+0x1de8:   	fabss	%f27, %f27
	.word	0xb7a0013b	! t0_kref+0x1dec:   	fabss	%f27, %f27
	.word	0xa9400000	! t0_kref+0x1df0:   	mov	%y, %l4
	.word	0xff6e001a	! t0_kref+0x1df4:   	prefetch	%i0 + %i2, 31
	.word	0x38800001	! t0_kref+0x1df8:   	bgu,a	_kref+0x1dfc
	.word	0xf7267ffc	! t0_kref+0x1dfc:   	st	%f27, [%i1 - 4]
	.word	0x96a2b775	! t0_kref+0x1e00:   	subcc	%o2, -0x88b, %o3
	.word	0x3c480002	! t0_kref+0x1e04:   	bpos,a,pt	%icc, _kref+0x1e0c
	.word	0xb7a6c9bb	! t0_kref+0x1e08:   	fdivs	%f27, %f27, %f27
	.word	0xf7801019	! t0_kref+0x1e0c:   	lda	[%g0 + %i1]0x80, %f27
	.word	0xab3ce014	! t0_kref+0x1e10:   	sra	%l3, 0x14, %l5
	.word	0xda68a024	! t0_kref+0x1e14:   	ldstub	[%g2 + 0x24], %o5
	call	SYM(t0_subr1)
	.word	0xf7861000	! t0_kref+0x1e1c:   	lda	[%i0]0x80, %f27
	.word	0xe60e3fe0	! t0_kref+0x1e20:   	ldub	[%i0 - 0x20], %l3
	.word	0x86102001	! t0_kref+0x1e24:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1e28:   	bne,a	_kref+0x1e28
	.word	0x86a0e001	! t0_kref+0x1e2c:   	subcc	%g3, 1, %g3
	.word	0xf1be5888	! t0_kref+0x1e30:   	stda	%f24, [%i1 + %o0]0xc4
	.word	0xd210a01e	! t0_kref+0x1e34:   	lduh	[%g2 + 0x1e], %o1
	.word	0xd028a020	! t0_kref+0x1e38:   	stb	%o0, [%g2 + 0x20]
	.word	0xb7a0003b	! t0_kref+0x1e3c:   	fmovs	%f27, %f27
	.word	0x931d6d40	! t0_kref+0x1e40:   	tsubcctv	%l5, 0xd40, %o1
	.word	0xe800a000	! t0_kref+0x1e44:   	ld	[%g2], %l4
	.word	0xee28a012	! t0_kref+0x1e48:   	stb	%l7, [%g2 + 0x12]
	.word	0x9734e00f	! t0_kref+0x1e4c:   	srl	%l3, 0xf, %o3
	.word	0xea801019	! t0_kref+0x1e50:   	lda	[%g0 + %i1]0x80, %l5
	.word	0x34800002	! t0_kref+0x1e54:   	bg,a	_kref+0x1e5c
	.word	0xaa080008	! t0_kref+0x1e58:   	and	%g0, %o0, %l5
	.word	0xd46e3ff9	! t0_kref+0x1e5c:   	ldstub	[%i0 - 7], %o2
	.word	0xb7a018da	! t0_kref+0x1e60:   	fdtos	%f26, %f27
	.word	0xf720a010	! t0_kref+0x1e64:   	st	%f27, [%g2 + 0x10]
	.word	0x9fc10000	! t0_kref+0x1e68:   	call	%g4
	.word	0xb7a01a5a	! t0_kref+0x1e6c:   	fdtoi	%f26, %f27
	.word	0x92f2c00a	! t0_kref+0x1e70:   	udivcc	%o3, %o2, %o1
	.word	0xa29a8000	! t0_kref+0x1e74:   	xorcc	%o2, %g0, %l1
	.word	0x80f26b14	! t0_kref+0x1e78:   	udivcc	%o1, 0xb14, %g0
	call	SYM(t0_subr2)
	.word	0xe168a00e	! t0_kref+0x1e80:   	prefetch	%g2 + 0xe, 16
	.word	0x9282bca1	! t0_kref+0x1e84:   	addcc	%o2, -0x35f, %o1
	.word	0x3a480007	! t0_kref+0x1e88:   	bcc,a,pt	%icc, _kref+0x1ea4
	.word	0xf53e4000	! t0_kref+0x1e8c:   	std	%f26, [%i1]
	.word	0xda40a028	! t0_kref+0x1e90:   	ldsw	[%g2 + 0x28], %o5
	.word	0x9228248f	! t0_kref+0x1e94:   	andn	%g0, 0x48f, %o1
	.word	0xd810a018	! t0_kref+0x1e98:   	lduh	[%g2 + 0x18], %o4
	.word	0x98330014	! t0_kref+0x1e9c:   	orn	%o4, %l4, %o4
	.word	0xec2e200f	! t0_kref+0x1ea0:   	stb	%l6, [%i0 + 0xf]
	.word	0xb8102014	! t0_kref+0x1ea4:   	mov	0x14, %i4
	.word	0xd4562008	! t0_kref+0x1ea8:   	ldsh	[%i0 + 8], %o2
	.word	0x34800003	! t0_kref+0x1eac:   	bg,a	_kref+0x1eb8
	.word	0xc0562006	! t0_kref+0x1eb0:   	ldsh	[%i0 + 6], %g0
	.word	0x9fc00004	! t0_kref+0x1eb4:   	call	%g0 + %g4
	.word	0xf4262000	! t0_kref+0x1eb8:   	st	%i2, [%i0]
	.word	0xb5a0193b	! t0_kref+0x1ebc:   	fstod	%f27, %f26
	sethi	%hi(2f), %o7
	.word	0xe40be2dc	! t0_kref+0x1ec4:   	ldub	[%o7 + 0x2dc], %l2
	.word	0xa41ca00c	! t0_kref+0x1ec8:   	xor	%l2, 0xc, %l2
	.word	0xe42be2dc	! t0_kref+0x1ecc:   	stb	%l2, [%o7 + 0x2dc]
	.word	0x81dbe2dc	! t0_kref+0x1ed0:   	flush	%o7 + 0x2dc
	.word	0xf51e7fe0	! t0_kref+0x1ed4:   	ldd	[%i1 - 0x20], %f26
	.word	0xac80000d	! t0_kref+0x1ed8:   	addcc	%g0, %o5, %l6
2:	.word	0xa4fa0015	! t0_kref+0x1edc:   	sdivcc	%o0, %l5, %l2
	.word	0xb7a6c9bb	! t0_kref+0x1ee0:   	fdivs	%f27, %f27, %f27
	.word	0xe26e7ff0	! t0_kref+0x1ee4:   	ldstub	[%i1 - 0x10], %l1
	.word	0x94c27a83	! t0_kref+0x1ee8:   	addccc	%o1, -0x57d, %o2
	.word	0x35800001	! t0_kref+0x1eec:   	fbue,a	_kref+0x1ef0
	.word	0xea562010	! t0_kref+0x1ef0:   	ldsh	[%i0 + 0x10], %l5
	.word	0xa7400000	! t0_kref+0x1ef4:   	mov	%y, %l3
	.word	0xd226001c	! t0_kref+0x1ef8:   	st	%o1, [%i0 + %i4]
	.word	0x81ae8ada	! t0_kref+0x1efc:   	fcmped	%fcc0, %f26, %f26
	.word	0xb7a0003b	! t0_kref+0x1f00:   	fmovs	%f27, %f27
	.word	0xda7f0018	! t0_kref+0x1f04:   	swap	[%i4 + %i0], %o5
	.word	0xb7a01a5a	! t0_kref+0x1f08:   	fdtoi	%f26, %f27
	.word	0xda262008	! t0_kref+0x1f0c:   	st	%o5, [%i0 + 8]
	.word	0xb7a6c8bb	! t0_kref+0x1f10:   	fsubs	%f27, %f27, %f27
	.word	0xa8a6bfa7	! t0_kref+0x1f14:   	subcc	%i2, -0x59, %l4
	.word	0x27480004	! t0_kref+0x1f18:   	fbul,a,pt	%fcc0, _kref+0x1f28
	.word	0xa8b4c016	! t0_kref+0x1f1c:   	orncc	%l3, %l6, %l4
	.word	0xaa74c014	! t0_kref+0x1f20:   	udiv	%l3, %l4, %l5
	.word	0xb7a0053b	! t0_kref+0x1f24:   	fsqrts	%f27, %f27
	.word	0xf1be188c	! t0_kref+0x1f28:   	stda	%f24, [%i0 + %o4]0xc4
	.word	0xb5a6cd3b	! t0_kref+0x1f2c:   	fsmuld	%f27, %f27, %f26
	.word	0xacddfdc2	! t0_kref+0x1f30:   	smulcc	%l7, -0x23e, %l6
	.word	0x38480005	! t0_kref+0x1f34:   	bgu,a,pt	%icc, _kref+0x1f48
	.word	0xe27e0000	! t0_kref+0x1f38:   	swap	[%i0], %l1
	.word	0xf700a024	! t0_kref+0x1f3c:   	ld	[%g2 + 0x24], %f27
	.word	0xd810a022	! t0_kref+0x1f40:   	lduh	[%g2 + 0x22], %o4
	.word	0x9934e004	! t0_kref+0x1f44:   	srl	%l3, 0x4, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be38c	! t0_kref+0x1f4c:   	ldub	[%o7 + 0x38c], %l2
	.word	0xa41ca00c	! t0_kref+0x1f50:   	xor	%l2, 0xc, %l2
	.word	0xe42be38c	! t0_kref+0x1f54:   	stb	%l2, [%o7 + 0x38c]
	.word	0x81dbe38c	! t0_kref+0x1f58:   	flush	%o7 + 0x38c
	.word	0xb7a018da	! t0_kref+0x1f5c:   	fdtos	%f26, %f27
	.word	0xb7a0053b	! t0_kref+0x1f60:   	fsqrts	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x1f64:   	fitos	%f27, %f27
	.word	0xb7a0109a	! t0_kref+0x1f68:   	fxtos	%f26, %f27
	.word	0x93400000	! t0_kref+0x1f6c:   	mov	%y, %o1
	.word	0x22480007	! t0_kref+0x1f70:   	be,a,pt	%icc, _kref+0x1f8c
	.word	0xaa45fb10	! t0_kref+0x1f74:   	addc	%l7, -0x4f0, %l5
	.word	0xb7a6c9bb	! t0_kref+0x1f78:   	fdivs	%f27, %f27, %f27
	.word	0xb5a689da	! t0_kref+0x1f7c:   	fdivd	%f26, %f26, %f26
	.word	0xaa8b2b0a	! t0_kref+0x1f80:   	andcc	%o4, 0xb0a, %l5
	.word	0xe4080019	! t0_kref+0x1f84:   	ldub	[%g0 + %i1], %l2
	.word	0xf7263fe0	! t0_kref+0x1f88:   	st	%f27, [%i0 - 0x20]
2:	.word	0xb7a6c93b	! t0_kref+0x1f8c:   	fmuls	%f27, %f27, %f27
	.word	0xf706001c	! t0_kref+0x1f90:   	ld	[%i0 + %i4], %f27
	.word	0x9815b296	! t0_kref+0x1f94:   	or	%l6, -0xd6a, %o4
	.word	0xa80cc015	! t0_kref+0x1f98:   	and	%l3, %l5, %l4
	.word	0xb7a0053b	! t0_kref+0x1f9c:   	fsqrts	%f27, %f27
	.word	0xea00a008	! t0_kref+0x1fa0:   	ld	[%g2 + 8], %l5
	.word	0xb7a01a3b	! t0_kref+0x1fa4:   	fstoi	%f27, %f27
	.word	0xd9e6500b	! t0_kref+0x1fa8:   	casa	[%i1]0x80, %o3, %o4
	.word	0x2a800008	! t0_kref+0x1fac:   	bcs,a	_kref+0x1fcc
	.word	0x94a5c014	! t0_kref+0x1fb0:   	subcc	%l7, %l4, %o2
	.word	0x81aecabb	! t0_kref+0x1fb4:   	fcmpes	%fcc0, %f27, %f27
	.word	0xf76e3ff0	! t0_kref+0x1fb8:   	prefetch	%i0 - 0x10, 27
	.word	0x22480003	! t0_kref+0x1fbc:   	be,a,pt	%icc, _kref+0x1fc8
	.word	0xb7a018da	! t0_kref+0x1fc0:   	fdtos	%f26, %f27
	.word	0x9f35000d	! t0_kref+0x1fc4:   	srl	%l4, %o5, %o7
	.word	0xb7a0013b	! t0_kref+0x1fc8:   	fabss	%f27, %f27
	.word	0x3a480007	! t0_kref+0x1fcc:   	bcc,a,pt	%icc, _kref+0x1fe8
	.word	0xf4263fe8	! t0_kref+0x1fd0:   	st	%i2, [%i0 - 0x18]
	.word	0xb7a0053b	! t0_kref+0x1fd4:   	fsqrts	%f27, %f27
	.word	0xd03e0000	! t0_kref+0x1fd8:   	std	%o0, [%i0]
	.word	0x27480003	! t0_kref+0x1fdc:   	fbul,a,pt	%fcc0, _kref+0x1fe8
	.word	0xf7200018	! t0_kref+0x1fe0:   	st	%f27, [%g0 + %i0]
	.word	0xb7a6c9bb	! t0_kref+0x1fe4:   	fdivs	%f27, %f27, %f27
	.word	0xad3ae011	! t0_kref+0x1fe8:   	sra	%o3, 0x11, %l6
	.word	0x32800008	! t0_kref+0x1fec:   	bne,a	_kref+0x200c
	.word	0x9053401a	! t0_kref+0x1ff0:   	umul	%o5, %i2, %o0
	call	SYM(t0_subr0)
	.word	0xda6e401a	! t0_kref+0x1ff8:   	ldstub	[%i1 + %i2], %o5
	.word	0xaabb000b	! t0_kref+0x1ffc:   	xnorcc	%o4, %o3, %l5
	.word	0xb7a0053b	! t0_kref+0x2000:   	fsqrts	%f27, %f27
	.word	0x3c480005	! t0_kref+0x2004:   	bpos,a,pt	%icc, _kref+0x2018
	.word	0x8143c000	! t0_kref+0x2008:   	stbar
	.word	0x9eb5e079	! t0_kref+0x200c:   	orncc	%l7, 0x79, %o7
	.word	0xe8160000	! t0_kref+0x2010:   	lduh	[%i0], %l4
	.word	0xe640a010	! t0_kref+0x2014:   	ldsw	[%g2 + 0x10], %l3
	sethi	%hi(2f), %o7
	.word	0xe40be060	! t0_kref+0x201c:   	ldub	[%o7 + 0x60], %l2
	.word	0xa41ca00c	! t0_kref+0x2020:   	xor	%l2, 0xc, %l2
	.word	0xe42be060	! t0_kref+0x2024:   	stb	%l2, [%o7 + 0x60]
	.word	0x81dbe060	! t0_kref+0x2028:   	flush	%o7 + 0x60
	.word	0xc06e600c	! t0_kref+0x202c:   	ldstub	[%i1 + 0xc], %g0
	.word	0xb7a0053b	! t0_kref+0x2030:   	fsqrts	%f27, %f27
	.word	0xf7200019	! t0_kref+0x2034:   	st	%f27, [%g0 + %i1]
	.word	0xb8103ff8	! t0_kref+0x2038:   	mov	0xfffffff8, %i4
	.word	0xfd6e401a	! t0_kref+0x203c:   	prefetch	%i1 + %i2, 30
	.word	0xd4d01018	! t0_kref+0x2040:   	ldsha	[%g0 + %i0]0x80, %o2
	.word	0xb7a01a3b	! t0_kref+0x2044:   	fstoi	%f27, %f27
	.word	0xae836912	! t0_kref+0x2048:   	addcc	%o5, 0x912, %l7
	.word	0x32480002	! t0_kref+0x204c:   	bne,a,pt	%icc, _kref+0x2054
	.word	0x9714c016	! t0_kref+0x2050:   	taddcctv	%l3, %l6, %o3
	.word	0x34800006	! t0_kref+0x2054:   	bg,a	_kref+0x206c
	.word	0xaca3284b	! t0_kref+0x2058:   	subcc	%o4, 0x84b, %l6
	.word	0xb7a0013b	! t0_kref+0x205c:   	fabss	%f27, %f27
2:	.word	0xb7a018da	! t0_kref+0x2060:   	fdtos	%f26, %f27
	.word	0xa204c013	! t0_kref+0x2064:   	add	%l3, %l3, %l1
	.word	0xf7267fe0	! t0_kref+0x2068:   	st	%f27, [%i1 - 0x20]
	.word	0x9ad3000b	! t0_kref+0x206c:   	umulcc	%o4, %o3, %o5
	.word	0xe410a018	! t0_kref+0x2070:   	lduh	[%g2 + 0x18], %l2
	.word	0xde08a003	! t0_kref+0x2074:   	ldub	[%g2 + 3], %o7
	.word	0x37480003	! t0_kref+0x2078:   	fbge,a,pt	%fcc0, _kref+0x2084
	.word	0xec0e2003	! t0_kref+0x207c:   	ldub	[%i0 + 3], %l6
	.word	0xee680018	! t0_kref+0x2080:   	ldstub	[%g0 + %i0], %l7
	.word	0xb7a6c93b	! t0_kref+0x2084:   	fmuls	%f27, %f27, %f27
	.word	0x86102001	! t0_kref+0x2088:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x208c:   	bne,a	_kref+0x208c
	.word	0x86a0e001	! t0_kref+0x2090:   	subcc	%g3, 1, %g3
	call	SYM(t0_subr2)
	.word	0xee7e0000	! t0_kref+0x2098:   	swap	[%i0], %l7
	.word	0x2f800007	! t0_kref+0x209c:   	fbu,a	_kref+0x20b8
	.word	0xa9418000	! t0_kref+0x20a0:   	mov	%fprs, %l4
	.word	0xe4ee1000	! t0_kref+0x20a4:   	ldstuba	[%i0]0x80, %l2
	.word	0x9ada65ff	! t0_kref+0x20a8:   	smulcc	%o1, 0x5ff, %o5
	call	SYM(t0_subr0)
	.word	0x9ab5401a	! t0_kref+0x20b0:   	orncc	%l5, %i2, %o5
	.word	0xd0566002	! t0_kref+0x20b4:   	ldsh	[%i1 + 2], %o0
	.word	0xb5a0193b	! t0_kref+0x20b8:   	fstod	%f27, %f26
	.word	0xa8f54016	! t0_kref+0x20bc:   	udivcc	%l5, %l6, %l4
	.word	0x37480002	! t0_kref+0x20c0:   	fbge,a,pt	%fcc0, _kref+0x20c8
	.word	0x925deed0	! t0_kref+0x20c4:   	smul	%l7, 0xed0, %o1
	.word	0x22800002	! t0_kref+0x20c8:   	be,a	_kref+0x20d0
	.word	0xa33b0014	! t0_kref+0x20cc:   	sra	%o4, %l4, %l1
	.word	0xacaaf546	! t0_kref+0x20d0:   	andncc	%o3, -0xaba, %l6
	.word	0xa93ce011	! t0_kref+0x20d4:   	sra	%l3, 0x11, %l4
	.word	0xf53e001d	! t0_kref+0x20d8:   	std	%f26, [%i0 + %i5]
	.word	0xf51e3fe8	! t0_kref+0x20dc:   	ldd	[%i0 - 0x18], %f26
	.word	0xda366012	! t0_kref+0x20e0:   	sth	%o5, [%i1 + 0x12]
	.word	0xb5a8c05a	! t0_kref+0x20e4:   	fmovdul	%fcc0, %f26, %f26
	.word	0xec1e6018	! t0_kref+0x20e8:   	ldd	[%i1 + 0x18], %l6
	.word	0xea7e4000	! t0_kref+0x20ec:   	swap	[%i1], %l5
	.word	0xda0e3fec	! t0_kref+0x20f0:   	ldub	[%i0 - 0x14], %o5
	.word	0xa6c00015	! t0_kref+0x20f4:   	addccc	%g0, %l5, %l3
	.word	0x9de3bfa0	! t0_kref+0x20f8:   	save	%sp, -0x60, %sp
	.word	0xbb06801c	! t0_kref+0x20fc:   	taddcc	%i2, %i4, %i5
	.word	0x9fee7e00	! t0_kref+0x2100:   	restore	%i1, -0x200, %o7
	.word	0xa2ba2700	! t0_kref+0x2104:   	xnorcc	%o0, 0x700, %l1
	.word	0xb5a688da	! t0_kref+0x2108:   	fsubd	%f26, %f26, %f26
	.word	0xc020a014	! t0_kref+0x210c:   	clr	[%g2 + 0x14]
	.word	0xb5a688da	! t0_kref+0x2110:   	fsubd	%f26, %f26, %f26
	.word	0xb6103fee	! t0_kref+0x2114:   	mov	0xffffffee, %i3
	.word	0xa610000a	! t0_kref+0x2118:   	mov	%o2, %l3
	.word	0x80aae365	! t0_kref+0x211c:   	andncc	%o3, 0x365, %g0
	.word	0xa7628000	! t0_kref+0x2120:   	movue	%fcc0, %g0, %l3
	.word	0x8143e040	! t0_kref+0x2124:   	membar	0x40
	.word	0x9a0b755d	! t0_kref+0x2128:   	and	%o5, -0xaa3, %o5
	.word	0x86102005	! t0_kref+0x212c:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x2130:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t0_kref+0x2134:   	be,a	_kref+0x2180
	.word	0xd8500018	! t0_kref+0x2138:   	ldsh	[%g0 + %i0], %o4
	.word	0xb7a0053b	! t0_kref+0x213c:   	fsqrts	%f27, %f27
	.word	0x3d480007	! t0_kref+0x2140:   	fbule,a,pt	%fcc0, _kref+0x215c
	.word	0xde0e6018	! t0_kref+0x2144:   	ldub	[%i1 + 0x18], %o7
	.word	0xea26601c	! t0_kref+0x2148:   	st	%l5, [%i1 + 0x1c]
	.word	0xd0466004	! t0_kref+0x214c:   	ldsw	[%i1 + 4], %o0
	.word	0xd2063ff4	! t0_kref+0x2150:   	ld	[%i0 - 0xc], %o1
	.word	0x38800003	! t0_kref+0x2154:   	bgu,a	_kref+0x2160
	.word	0xea6e3ffe	! t0_kref+0x2158:   	ldstub	[%i0 - 2], %l5
	.word	0xa2d58017	! t0_kref+0x215c:   	umulcc	%l6, %l7, %l1
	.word	0xb7a0053b	! t0_kref+0x2160:   	fsqrts	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x2164:   	fitos	%f27, %f27
	.word	0xa645401a	! t0_kref+0x2168:   	addc	%l5, %i2, %l3
	.word	0x90703575	! t0_kref+0x216c:   	udiv	%g0, -0xa8b, %o0
	.word	0xa2828015	! t0_kref+0x2170:   	addcc	%o2, %l5, %l1
	call	SYM(t0_subr2)
	.word	0x90a83fe6	! t0_kref+0x2178:   	andncc	%g0, -0x1a, %o0
	.word	0xa4c24000	! t0_kref+0x217c:   	addccc	%o1, %g0, %l2
	.word	0xb5a6885a	! t0_kref+0x2180:   	faddd	%f26, %f26, %f26
	.word	0x21800001	! t0_kref+0x2184:   	fbn,a	_kref+0x2188
	.word	0xb5a6cd3b	! t0_kref+0x2188:   	fsmuld	%f27, %f27, %f26
	.word	0x81ae8ada	! t0_kref+0x218c:   	fcmped	%fcc0, %f26, %f26
	.word	0x92b68013	! t0_kref+0x2190:   	orncc	%i2, %l3, %o1
	.word	0xa4a3400b	! t0_kref+0x2194:   	subcc	%o5, %o3, %l2
	.word	0xaab24016	! t0_kref+0x2198:   	orncc	%o1, %l6, %l5
	.word	0xf720a03c	! t0_kref+0x219c:   	st	%f27, [%g2 + 0x3c]
	.word	0x923b3bf4	! t0_kref+0x21a0:   	xnor	%o4, -0x40c, %o1
	.word	0xb5a6895a	! t0_kref+0x21a4:   	fmuld	%f26, %f26, %f26
	.word	0xa874c013	! t0_kref+0x21a8:   	udiv	%l3, %l3, %l4
	.word	0xec00a004	! t0_kref+0x21ac:   	ld	[%g2 + 4], %l6
	.word	0xc368a047	! t0_kref+0x21b0:   	prefetch	%g2 + 0x47, 1
	.word	0xb5a689da	! t0_kref+0x21b4:   	fdivd	%f26, %f26, %f26
	.word	0x9a15a4ac	! t0_kref+0x21b8:   	or	%l6, 0x4ac, %o5
	.word	0xee28a002	! t0_kref+0x21bc:   	stb	%l7, [%g2 + 2]
	.word	0xb7a6c9bb	! t0_kref+0x21c0:   	fdivs	%f27, %f27, %f27
	.word	0xd2f01019	! t0_kref+0x21c4:   	stxa	%o1, [%g0 + %i1]0x80
	.word	0xf720a008	! t0_kref+0x21c8:   	st	%f27, [%g2 + 8]
	.word	0x30800001	! t0_kref+0x21cc:   	ba,a	_kref+0x21d0
	.word	0x81580000	! t0_kref+0x21d0:   	flushw
	.word	0x2a800006	! t0_kref+0x21d4:   	bcs,a	_kref+0x21ec
	.word	0xf51e6018	! t0_kref+0x21d8:   	ldd	[%i1 + 0x18], %f26
	.word	0x800de795	! t0_kref+0x21dc:   	and	%l7, 0x795, %g0
	.word	0x9865400b	! t0_kref+0x21e0:   	subc	%l5, %o3, %o4
	.word	0xf5be1000	! t0_kref+0x21e4:   	stda	%f26, [%i0]0x80
	.word	0x90f82c40	! t0_kref+0x21e8:   	sdivcc	%g0, 0xc40, %o0
	.word	0xaebda759	! t0_kref+0x21ec:   	xnorcc	%l6, 0x759, %l7
	.word	0x3d480007	! t0_kref+0x21f0:   	fbule,a,pt	%fcc0, _kref+0x220c
	.word	0xb7a01a3b	! t0_kref+0x21f4:   	fstoi	%f27, %f27
	.word	0xc0b6501b	! t0_kref+0x21f8:   	stha	%g0, [%i1 + %i3]0x80
	.word	0x3b800004	! t0_kref+0x21fc:   	fble,a	_kref+0x220c
	.word	0x9edd2afc	! t0_kref+0x2200:   	smulcc	%l4, 0xafc, %o7
	.word	0xa6c2000c	! t0_kref+0x2204:   	addccc	%o0, %o4, %l3
	.word	0x28480008	! t0_kref+0x2208:   	bleu,a,pt	%icc, _kref+0x2228
	.word	0xb7a01a3b	! t0_kref+0x220c:   	fstoi	%f27, %f27
	.word	0x9eb5400d	! t0_kref+0x2210:   	orncc	%l5, %o5, %o7
	.word	0xad32c016	! t0_kref+0x2214:   	srl	%o3, %l6, %l6
	.word	0x8082efb2	! t0_kref+0x2218:   	addcc	%o3, 0xfb2, %g0
	.word	0xb5a688da	! t0_kref+0x221c:   	fsubd	%f26, %f26, %f26
	.word	0xd2567ffa	! t0_kref+0x2220:   	ldsh	[%i1 - 6], %o1
	.word	0xee20a010	! t0_kref+0x2224:   	st	%l7, [%g2 + 0x10]
	.word	0xe4180018	! t0_kref+0x2228:   	ldd	[%g0 + %i0], %l2
	.word	0xe40e4000	! t0_kref+0x222c:   	ldub	[%i1], %l2
	.word	0xb7a0053b	! t0_kref+0x2230:   	fsqrts	%f27, %f27
	.word	0xb5a688da	! t0_kref+0x2234:   	fsubd	%f26, %f26, %f26
	.word	0xaea4c009	! t0_kref+0x2238:   	subcc	%l3, %o1, %l7
	.word	0xe24e401a	! t0_kref+0x223c:   	ldsb	[%i1 + %i2], %l1
	.word	0x8143e02c	! t0_kref+0x2240:   	membar	0x2c
	.word	0xb7a000bb	! t0_kref+0x2244:   	fnegs	%f27, %f27
	.word	0x24800005	! t0_kref+0x2248:   	ble,a	_kref+0x225c
	.word	0x96e367ab	! t0_kref+0x224c:   	subccc	%o5, 0x7ab, %o3
	.word	0xae0a4013	! t0_kref+0x2250:   	and	%o1, %l3, %l7
	.word	0xf53e6008	! t0_kref+0x2254:   	std	%f26, [%i1 + 8]
	.word	0x9ab5c000	! t0_kref+0x2258:   	orncc	%l7, %g0, %o5
	.word	0x23480008	! t0_kref+0x225c:   	fbne,a,pt	%fcc0, _kref+0x227c
	.word	0x920eb6db	! t0_kref+0x2260:   	and	%i2, -0x925, %o1
	.word	0xee28a006	! t0_kref+0x2264:   	stb	%l7, [%g2 + 6]
	.word	0xf700a010	! t0_kref+0x2268:   	ld	[%g2 + 0x10], %f27
	.word	0xaadb400c	! t0_kref+0x226c:   	smulcc	%o5, %o4, %l5
	.word	0xa2530013	! t0_kref+0x2270:   	umul	%o4, %l3, %l1
	.word	0xd250a02c	! t0_kref+0x2274:   	ldsh	[%g2 + 0x2c], %o1
	.word	0x9664ecb8	! t0_kref+0x2278:   	subc	%l3, 0xcb8, %o3
	call	SYM(t0_subr1)
	.word	0xd00e0000	! t0_kref+0x2280:   	ldub	[%i0], %o0
	.word	0xb7a6c8bb	! t0_kref+0x2284:   	fsubs	%f27, %f27, %f27
	.word	0xd44e001a	! t0_kref+0x2288:   	ldsb	[%i0 + %i2], %o2
	.word	0xb5a6cd3b	! t0_kref+0x228c:   	fsmuld	%f27, %f27, %f26
	.word	0xb7a6c83b	! t0_kref+0x2290:   	fadds	%f27, %f27, %f27
	.word	0xe2d6d018	! t0_kref+0x2294:   	ldsha	[%i3 + %i0]0x80, %l1
	.word	0xb7a0053b	! t0_kref+0x2298:   	fsqrts	%f27, %f27
	.word	0xb7a018da	! t0_kref+0x229c:   	fdtos	%f26, %f27
	.word	0xb7a6c93b	! t0_kref+0x22a0:   	fmuls	%f27, %f27, %f27
	.word	0xb7a01a3b	! t0_kref+0x22a4:   	fstoi	%f27, %f27
	.word	0x3f480006	! t0_kref+0x22a8:   	fbo,a,pt	%fcc0, _kref+0x22c0
	.word	0xa33aa003	! t0_kref+0x22ac:   	sra	%o2, 0x3, %l1
	.word	0xa235401a	! t0_kref+0x22b0:   	orn	%l5, %i2, %l1
	.word	0xa2d28009	! t0_kref+0x22b4:   	umulcc	%o2, %o1, %l1
	.word	0xf5380018	! t0_kref+0x22b8:   	std	%f26, [%g0 + %i0]
	.word	0xea066014	! t0_kref+0x22bc:   	ld	[%i1 + 0x14], %l5
	.word	0xc0564000	! t0_kref+0x22c0:   	ldsh	[%i1], %g0
	.word	0xb7a0053b	! t0_kref+0x22c4:   	fsqrts	%f27, %f27
	.word	0xb5a6885a	! t0_kref+0x22c8:   	faddd	%f26, %f26, %f26
	.word	0xe450a034	! t0_kref+0x22cc:   	ldsh	[%g2 + 0x34], %l2
	.word	0xa22a23c5	! t0_kref+0x22d0:   	andn	%o0, 0x3c5, %l1
	.word	0x81aecabb	! t0_kref+0x22d4:   	fcmpes	%fcc0, %f27, %f27
	.word	0x91400000	! t0_kref+0x22d8:   	mov	%y, %o0
	.word	0xb7a0053b	! t0_kref+0x22dc:   	fsqrts	%f27, %f27
	.word	0xe6070018	! t0_kref+0x22e0:   	ld	[%i4 + %i0], %l3
	.word	0xe67e7fe0	! t0_kref+0x22e4:   	swap	[%i1 - 0x20], %l3
	.word	0x9e52e02b	! t0_kref+0x22e8:   	umul	%o3, 0x2b, %o7
	.word	0xd6000018	! t0_kref+0x22ec:   	ld	[%g0 + %i0], %o3
	.word	0x29800004	! t0_kref+0x22f0:   	fbl,a	_kref+0x2300
	.word	0xd828a019	! t0_kref+0x22f4:   	stb	%o4, [%g2 + 0x19]
	.word	0xf19eda59	! t0_kref+0x22f8:   	ldda	[%i3 + %i1]0xd2, %f24
	.word	0xd0566010	! t0_kref+0x22fc:   	ldsh	[%i1 + 0x10], %o0
	.word	0xf51e2018	! t0_kref+0x2300:   	ldd	[%i0 + 0x18], %f26
	.word	0x948dfda7	! t0_kref+0x2304:   	andcc	%l7, -0x259, %o2
	.word	0xf51e7fe8	! t0_kref+0x2308:   	ldd	[%i1 - 0x18], %f26
	.word	0xd216001b	! t0_kref+0x230c:   	lduh	[%i0 + %i3], %o1
	.word	0xc768a084	! t0_kref+0x2310:   	prefetch	%g2 + 0x84, 3
	.word	0xe36e2018	! t0_kref+0x2314:   	prefetch	%i0 + 0x18, 17
	.word	0x9f35e014	! t0_kref+0x2318:   	srl	%l7, 0x14, %o7
	.word	0x953ea007	! t0_kref+0x231c:   	sra	%i2, 0x7, %o2
	.word	0xb7a0053b	! t0_kref+0x2320:   	fsqrts	%f27, %f27
	.word	0xf700a028	! t0_kref+0x2324:   	ld	[%g2 + 0x28], %f27
	.word	0xb7a018da	! t0_kref+0x2328:   	fdtos	%f26, %f27
	.word	0x81ae8ada	! t0_kref+0x232c:   	fcmped	%fcc0, %f26, %f26
	.word	0xab380016	! t0_kref+0x2330:   	sra	%g0, %l6, %l5
	.word	0x94fd400a	! t0_kref+0x2334:   	sdivcc	%l5, %o2, %o2
	.word	0xb7a01a5a	! t0_kref+0x2338:   	fdtoi	%f26, %f27
	call	SYM(t0_subr2)
	.word	0xb7a6c93b	! t0_kref+0x2340:   	fmuls	%f27, %f27, %f27
	.word	0xa8f5ad69	! t0_kref+0x2344:   	udivcc	%l6, 0xd69, %l4
	.word	0xb7a0189b	! t0_kref+0x2348:   	fitos	%f27, %f27
	.word	0xf7060000	! t0_kref+0x234c:   	ld	[%i0], %f27
	.word	0x81ae8a5a	! t0_kref+0x2350:   	fcmpd	%fcc0, %f26, %f26
	.word	0x983d6ed8	! t0_kref+0x2354:   	xnor	%l5, 0xed8, %o4
	.word	0xaad57b54	! t0_kref+0x2358:   	umulcc	%l5, -0x4ac, %l5
	.word	0xeb68a005	! t0_kref+0x235c:   	prefetch	%g2 + 5, 21
	.word	0xa5334014	! t0_kref+0x2360:   	srl	%o5, %l4, %l2
	.word	0x96c34017	! t0_kref+0x2364:   	addccc	%o5, %l7, %o3
	.word	0xb7a6c93b	! t0_kref+0x2368:   	fmuls	%f27, %f27, %f27
	.word	0xec260000	! t0_kref+0x236c:   	st	%l6, [%i0]
	.word	0xee68a000	! t0_kref+0x2370:   	ldstub	[%g2], %l7
	.word	0x92ad7a57	! t0_kref+0x2374:   	andncc	%l5, -0x5a9, %o1
	.word	0xc06e200e	! t0_kref+0x2378:   	ldstub	[%i0 + 0xe], %g0
	.word	0xb5a6885a	! t0_kref+0x237c:   	faddd	%f26, %f26, %f26
	.word	0x29800001	! t0_kref+0x2380:   	fbl,a	_kref+0x2384
	.word	0xb5a688da	! t0_kref+0x2384:   	fsubd	%f26, %f26, %f26
	.word	0xacd30008	! t0_kref+0x2388:   	umulcc	%o4, %o0, %l6
	.word	0x36800003	! t0_kref+0x238c:   	bge,a	_kref+0x2398
	.word	0xa62a4014	! t0_kref+0x2390:   	andn	%o1, %l4, %l3
	.word	0x9a62801a	! t0_kref+0x2394:   	subc	%o2, %i2, %o5
	.word	0xea200018	! t0_kref+0x2398:   	st	%l5, [%g0 + %i0]
	.word	0xb5a6cd3b	! t0_kref+0x239c:   	fsmuld	%f27, %f27, %f26
	.word	0xd4680019	! t0_kref+0x23a0:   	ldstub	[%g0 + %i1], %o2
	.word	0x81aeca3b	! t0_kref+0x23a4:   	fcmps	%fcc0, %f27, %f27
	.word	0xb7a0053b	! t0_kref+0x23a8:   	fsqrts	%f27, %f27
	.word	0xa28b4009	! t0_kref+0x23ac:   	andcc	%o5, %o1, %l1
	.word	0xa9400000	! t0_kref+0x23b0:   	mov	%y, %l4
	.word	0xa255e3c9	! t0_kref+0x23b4:   	umul	%l7, 0x3c9, %l1
	.word	0xf7263fe0	! t0_kref+0x23b8:   	st	%f27, [%i0 - 0x20]
	.word	0xd20e3ff8	! t0_kref+0x23bc:   	ldub	[%i0 - 8], %o1
	.word	0x81aecabb	! t0_kref+0x23c0:   	fcmpes	%fcc0, %f27, %f27
	sethi	%hi(2f), %o7
	.word	0xe40be3f8	! t0_kref+0x23c8:   	ldub	[%o7 + 0x3f8], %l2
	.word	0xa41ca00c	! t0_kref+0x23cc:   	xor	%l2, 0xc, %l2
	.word	0xe42be3f8	! t0_kref+0x23d0:   	stb	%l2, [%o7 + 0x3f8]
	.word	0x81dbe3f8	! t0_kref+0x23d4:   	flush	%o7 + 0x3f8
	.word	0xa42d800a	! t0_kref+0x23d8:   	andn	%l6, %o2, %l2
	.word	0x3f480007	! t0_kref+0x23dc:   	fbo,a,pt	%fcc0, _kref+0x23f8
	.word	0xb5a8405a	! t0_kref+0x23e0:   	fmovdne	%fcc0, %f26, %f26
	.word	0xf56e6018	! t0_kref+0x23e4:   	prefetch	%i1 + 0x18, 26
	.word	0xf51e2008	! t0_kref+0x23e8:   	ldd	[%i0 + 8], %f26
	.word	0x81ae8a5a	! t0_kref+0x23ec:   	fcmpd	%fcc0, %f26, %f26
	.word	0xb7a0013b	! t0_kref+0x23f0:   	fabss	%f27, %f27
	.word	0x9042e6d8	! t0_kref+0x23f4:   	addc	%o3, 0x6d8, %o0
2:	.word	0xf53e0000	! t0_kref+0x23f8:   	std	%f26, [%i0]
	.word	0xa73ac015	! t0_kref+0x23fc:   	sra	%o3, %l5, %l3
	.word	0x81024014	! t0_kref+0x2400:   	taddcc	%o1, %l4, %g0
	.word	0xa454e27b	! t0_kref+0x2404:   	umul	%l3, 0x27b, %l2
	.word	0xa91cc013	! t0_kref+0x2408:   	tsubcctv	%l3, %l3, %l4
	.word	0x8d85400b	! t0_kref+0x240c:   	wr	%l5, %o3, %fprs
	.word	0x20480006	! t0_kref+0x2410:   	bn,a,pt	%icc, _kref+0x2428
	.word	0x945dab68	! t0_kref+0x2414:   	smul	%l6, 0xb68, %o2
	.word	0xf700a028	! t0_kref+0x2418:   	ld	[%g2 + 0x28], %f27
	.word	0xd03f4018	! t0_kref+0x241c:   	std	%o0, [%i5 + %i0]
	.word	0xb5a0193b	! t0_kref+0x2420:   	fstod	%f27, %f26
	.word	0xf53e7ff8	! t0_kref+0x2424:   	std	%f26, [%i1 - 8]
	.word	0x80f20009	! t0_kref+0x2428:   	udivcc	%o0, %o1, %g0
	.word	0xb5a6885a	! t0_kref+0x242c:   	faddd	%f26, %f26, %f26
	.word	0xf7060000	! t0_kref+0x2430:   	ld	[%i0], %f27
	.word	0x9652400c	! t0_kref+0x2434:   	umul	%o1, %o4, %o3
	.word	0xb7a0053b	! t0_kref+0x2438:   	fsqrts	%f27, %f27
	.word	0xab25c013	! t0_kref+0x243c:   	mulscc	%l7, %l3, %l5
	.word	0x3f480006	! t0_kref+0x2440:   	fbo,a,pt	%fcc0, _kref+0x2458
	.word	0xab408000	! t0_kref+0x2444:   	mov	%ccr, %l5
	.word	0x90b2c00b	! t0_kref+0x2448:   	orncc	%o3, %o3, %o0
	.word	0x29800002	! t0_kref+0x244c:   	fbl,a	_kref+0x2454
	.word	0xf51e6010	! t0_kref+0x2450:   	ldd	[%i1 + 0x10], %f26
	.word	0xb5a6885a	! t0_kref+0x2454:   	faddd	%f26, %f26, %f26
	.word	0x9116bdf0	! t0_kref+0x2458:   	taddcctv	%i2, -0x210, %o0
	.word	0x98f2c00b	! t0_kref+0x245c:   	udivcc	%o3, %o3, %o4
	.word	0x81aeca3b	! t0_kref+0x2460:   	fcmps	%fcc0, %f27, %f27
	.word	0xb5a688da	! t0_kref+0x2464:   	fsubd	%f26, %f26, %f26
	.word	0x9052b60c	! t0_kref+0x2468:   	umul	%o2, -0x9f4, %o0
	.word	0x23480004	! t0_kref+0x246c:   	fbne,a,pt	%fcc0, _kref+0x247c
	.word	0xaa2b0009	! t0_kref+0x2470:   	andn	%o4, %o1, %l5
	.word	0xd03f4019	! t0_kref+0x2474:   	std	%o0, [%i5 + %i1]
	.word	0xe6ee1000	! t0_kref+0x2478:   	ldstuba	[%i0]0x80, %l3
	.word	0xb7a0053b	! t0_kref+0x247c:   	fsqrts	%f27, %f27
	.word	0xa4ade660	! t0_kref+0x2480:   	andncc	%l7, 0x660, %l2
	.word	0xf19e1a1b	! t0_kref+0x2484:   	ldda	[%i0 + %i3]0xd0, %f24
	.word	0xaad22742	! t0_kref+0x2488:   	umulcc	%o0, 0x742, %l5
	.word	0xf53f4019	! t0_kref+0x248c:   	std	%f26, [%i5 + %i1]
	.word	0xaf3a201a	! t0_kref+0x2490:   	sra	%o0, 0x1a, %l7
	.word	0xb5a6895a	! t0_kref+0x2494:   	fmuld	%f26, %f26, %f26
	.word	0xd6367ffa	! t0_kref+0x2498:   	sth	%o3, [%i1 - 6]
	.word	0x24800007	! t0_kref+0x249c:   	ble,a	_kref+0x24b8
	.word	0xf19e9a19	! t0_kref+0x24a0:   	ldda	[%i2 + %i1]0xd0, %f24
	.word	0x9e9d3443	! t0_kref+0x24a4:   	xorcc	%l4, -0xbbd, %o7
	.word	0x985aacd4	! t0_kref+0x24a8:   	smul	%o2, 0xcd4, %o4
	.word	0x92568015	! t0_kref+0x24ac:   	umul	%i2, %l5, %o1
	.word	0xb7a01a3b	! t0_kref+0x24b0:   	fstoi	%f27, %f27
	.word	0xa23b400a	! t0_kref+0x24b4:   	xnor	%o5, %o2, %l1
	.word	0xd848a008	! t0_kref+0x24b8:   	ldsb	[%g2 + 8], %o4
	.word	0xb5a688da	! t0_kref+0x24bc:   	fsubd	%f26, %f26, %f26
	sethi	%hi(2f), %o7
	.word	0xe40be100	! t0_kref+0x24c4:   	ldub	[%o7 + 0x100], %l2
	.word	0xa41ca00c	! t0_kref+0x24c8:   	xor	%l2, 0xc, %l2
	.word	0xe42be100	! t0_kref+0x24cc:   	stb	%l2, [%o7 + 0x100]
	.word	0x81dbe100	! t0_kref+0x24d0:   	flush	%o7 + 0x100
	.word	0xe830a03a	! t0_kref+0x24d4:   	sth	%l4, [%g2 + 0x3a]
	.word	0xb7a0003b	! t0_kref+0x24d8:   	fmovs	%f27, %f27
	.word	0xd600a010	! t0_kref+0x24dc:   	ld	[%g2 + 0x10], %o3
	.word	0x9ad36c33	! t0_kref+0x24e0:   	umulcc	%o5, 0xc33, %o5
	.word	0xa6a4c00a	! t0_kref+0x24e4:   	subcc	%l3, %o2, %l3
	.word	0xee08a015	! t0_kref+0x24e8:   	ldub	[%g2 + 0x15], %l7
	.word	0xe86e2004	! t0_kref+0x24ec:   	ldstub	[%i0 + 4], %l4
	.word	0xb7a018da	! t0_kref+0x24f0:   	fdtos	%f26, %f27
	.word	0xae9b0016	! t0_kref+0x24f4:   	xorcc	%o4, %l6, %l7
	.word	0xb7a8803b	! t0_kref+0x24f8:   	fmovslg	%fcc0, %f27, %f27
	.word	0x9335c009	! t0_kref+0x24fc:   	srl	%l7, %o1, %o1
2:	.word	0xf7270019	! t0_kref+0x2500:   	st	%f27, [%i4 + %i1]
	.word	0xc07f0018	! t0_kref+0x2504:   	swap	[%i4 + %i0], %g0
	.word	0xe4567ffc	! t0_kref+0x2508:   	ldsh	[%i1 - 4], %l2
	.word	0xf1be5a5d	! t0_kref+0x250c:   	stda	%f24, [%i1 + %i5]0xd2
	.word	0x98630014	! t0_kref+0x2510:   	subc	%o4, %l4, %o4
	.word	0x8d826ccc	! t0_kref+0x2514:   	wr	%o1, 0xccc, %fprs
	.word	0xb7a01a5a	! t0_kref+0x2518:   	fdtoi	%f26, %f27
	.word	0xb7a0013b	! t0_kref+0x251c:   	fabss	%f27, %f27
	.word	0xd2ee9018	! t0_kref+0x2520:   	ldstuba	[%i2 + %i0]0x80, %o1
	.word	0xf700a00c	! t0_kref+0x2524:   	ld	[%g2 + 0xc], %f27
	.word	0xb7a0053b	! t0_kref+0x2528:   	fsqrts	%f27, %f27
	.word	0xe80e001a	! t0_kref+0x252c:   	ldub	[%i0 + %i2], %l4
	.word	0x95400000	! t0_kref+0x2530:   	mov	%y, %o2
	.word	0xea30a032	! t0_kref+0x2534:   	sth	%l5, [%g2 + 0x32]
	.word	0xc07e601c	! t0_kref+0x2538:   	swap	[%i1 + 0x1c], %g0
	.word	0xf7063fe0	! t0_kref+0x253c:   	ld	[%i0 - 0x20], %f27
	.word	0xb7a6c93b	! t0_kref+0x2540:   	fmuls	%f27, %f27, %f27
!	call	0xfffff8b8
	.word	0xaaab0009	! t0_kref+0x2548:   	andncc	%o4, %o1, %l5
	.word	0xac64c014	! t0_kref+0x254c:   	subc	%l3, %l4, %l6
	.word	0x9265f9df	! t0_kref+0x2550:   	subc	%l7, -0x621, %o1
	.word	0xb7a6c93b	! t0_kref+0x2554:   	fmuls	%f27, %f27, %f27
	call	SYM(t0_subr2)
	.word	0xb5a689da	! t0_kref+0x255c:   	fdivd	%f26, %f26, %f26
	.word	0x81580000	! t0_kref+0x2560:   	flushw
	.word	0xee480019	! t0_kref+0x2564:   	ldsb	[%g0 + %i1], %l7
	.word	0x94d5c00c	! t0_kref+0x2568:   	umulcc	%l7, %o4, %o2
	.word	0xee10a02e	! t0_kref+0x256c:   	lduh	[%g2 + 0x2e], %l7
	.word	0x942b4014	! t0_kref+0x2570:   	andn	%o5, %l4, %o2
	.word	0xd430a010	! t0_kref+0x2574:   	sth	%o2, [%g2 + 0x10]
	.word	0xa415e9ff	! t0_kref+0x2578:   	or	%l7, 0x9ff, %l2
	.word	0x3b800008	! t0_kref+0x257c:   	fble,a	_kref+0x259c
	.word	0x803cc016	! t0_kref+0x2580:   	xnor	%l3, %l6, %g0
	.word	0xb7a000bb	! t0_kref+0x2584:   	fnegs	%f27, %f27
	.word	0xe826200c	! t0_kref+0x2588:   	st	%l4, [%i0 + 0xc]
	.word	0xb7a6c93b	! t0_kref+0x258c:   	fmuls	%f27, %f27, %f27
	.word	0x9fc10000	! t0_kref+0x2590:   	call	%g4
	.word	0xb7a000bb	! t0_kref+0x2594:   	fnegs	%f27, %f27
	.word	0xa22da7bf	! t0_kref+0x2598:   	andn	%l6, 0x7bf, %l1
	.word	0x33800003	! t0_kref+0x259c:   	fbe,a	_kref+0x25a8
	.word	0xea36001b	! t0_kref+0x25a0:   	sth	%l5, [%i0 + %i3]
	.word	0xf51fbe48	! t0_kref+0x25a4:   	ldd	[%fp - 0x1b8], %f26
	.word	0xf5bf5018	! t0_kref+0x25a8:   	stda	%f26, [%i5 + %i0]0x80
	.word	0xeb68a042	! t0_kref+0x25ac:   	prefetch	%g2 + 0x42, 21
	sethi	%hi(2f), %o7
	.word	0xe40be1cc	! t0_kref+0x25b4:   	ldub	[%o7 + 0x1cc], %l2
	.word	0xa41ca00c	! t0_kref+0x25b8:   	xor	%l2, 0xc, %l2
	.word	0xe42be1cc	! t0_kref+0x25bc:   	stb	%l2, [%o7 + 0x1cc]
	.word	0x81dbe1cc	! t0_kref+0x25c0:   	flush	%o7 + 0x1cc
	.word	0xa8082019	! t0_kref+0x25c4:   	and	%g0, 0x19, %l4
	.word	0xf7000018	! t0_kref+0x25c8:   	ld	[%g0 + %i0], %f27
2:	.word	0xd4e81018	! t0_kref+0x25cc:   	ldstuba	[%g0 + %i0]0x80, %o2
	.word	0xb7a018da	! t0_kref+0x25d0:   	fdtos	%f26, %f27
	.word	0xda56401b	! t0_kref+0x25d4:   	ldsh	[%i1 + %i3], %o5
	.word	0xf53e001d	! t0_kref+0x25d8:   	std	%f26, [%i0 + %i5]
	.word	0xb7a0053b	! t0_kref+0x25dc:   	fsqrts	%f27, %f27
	.word	0xc5ee1013	! t0_kref+0x25e0:   	prefetcha	%i0 + %l3, 2
	.word	0xb7a6c8bb	! t0_kref+0x25e4:   	fsubs	%f27, %f27, %f27
	.word	0xf19e1a1a	! t0_kref+0x25e8:   	ldda	[%i0 + %i2]0xd0, %f24
	.word	0xa63d0017	! t0_kref+0x25ec:   	xnor	%l4, %l7, %l3
	.word	0xed68a082	! t0_kref+0x25f0:   	prefetch	%g2 + 0x82, 22
	.word	0xaca30014	! t0_kref+0x25f4:   	subcc	%o4, %l4, %l6
	sethi	%hi(2f), %o7
	.word	0xe40be23c	! t0_kref+0x25fc:   	ldub	[%o7 + 0x23c], %l2
	.word	0xa41ca00c	! t0_kref+0x2600:   	xor	%l2, 0xc, %l2
	.word	0xe42be23c	! t0_kref+0x2604:   	stb	%l2, [%o7 + 0x23c]
	.word	0x81dbe23c	! t0_kref+0x2608:   	flush	%o7 + 0x23c
	.word	0x9e137630	! t0_kref+0x260c:   	or	%o5, -0x9d0, %o7
	.word	0x33800008	! t0_kref+0x2610:   	fbe,a	_kref+0x2630
	.word	0x85824014	! t0_kref+0x2614:   	wr	%o1, %l4, %ccr
	.word	0xaadb6bb3	! t0_kref+0x2618:   	smulcc	%o5, 0xbb3, %l5
	.word	0x8143c000	! t0_kref+0x261c:   	stbar
	.word	0xda10a00e	! t0_kref+0x2620:   	lduh	[%g2 + 0xe], %o5
	.word	0x900b0008	! t0_kref+0x2624:   	and	%o4, %o0, %o0
	.word	0x9532000a	! t0_kref+0x2628:   	srl	%o0, %o2, %o2
	.word	0xd2d81018	! t0_kref+0x262c:   	ldxa	[%g0 + %i0]0x80, %o1
	call	SYM(t0_subr3)
	.word	0xb7a0013b	! t0_kref+0x2634:   	fabss	%f27, %f27
	.word	0xd4380019	! t0_kref+0x2638:   	std	%o2, [%g0 + %i1]
2:	.word	0xde00a02c	! t0_kref+0x263c:   	ld	[%g2 + 0x2c], %o7
	.word	0x97644016	! t0_kref+0x2640:   	move	%icc, %l6, %o3
	.word	0xf51e3fe0	! t0_kref+0x2644:   	ldd	[%i0 - 0x20], %f26
	.word	0x81aecabb	! t0_kref+0x2648:   	fcmpes	%fcc0, %f27, %f27
	.word	0xa3418000	! t0_kref+0x264c:   	mov	%fprs, %l1
	.word	0xa60d8015	! t0_kref+0x2650:   	and	%l6, %l5, %l3
	.word	0xd228a01d	! t0_kref+0x2654:   	stb	%o1, [%g2 + 0x1d]
	.word	0x96868014	! t0_kref+0x2658:   	addcc	%i2, %l4, %o3
	.word	0x81ae8ada	! t0_kref+0x265c:   	fcmped	%fcc0, %f26, %f26
	.word	0xb7a6c9bb	! t0_kref+0x2660:   	fdivs	%f27, %f27, %f27
	.word	0xb7a018da	! t0_kref+0x2664:   	fdtos	%f26, %f27
	.word	0x9e12c01a	! t0_kref+0x2668:   	or	%o3, %i2, %o7
	.word	0x9e35c017	! t0_kref+0x266c:   	orn	%l7, %l7, %o7
	.word	0x38800004	! t0_kref+0x2670:   	bgu,a	_kref+0x2680
	.word	0xa2ddc013	! t0_kref+0x2674:   	smulcc	%l7, %l3, %l1
	.word	0x801326b1	! t0_kref+0x2678:   	or	%o4, 0x6b1, %g0
	.word	0xd40e7feb	! t0_kref+0x267c:   	ldub	[%i1 - 0x15], %o2
	.word	0x3a800002	! t0_kref+0x2680:   	bcc,a	_kref+0x2688
	.word	0xe7002ab0	! t0_kref+0x2684:   	ld	[%g0 + 0xab0], %f19
	.word	0xf1be7fe0	! t0_kref+0x2688:   	stda	%f24, [%i1 - 0x20]%asi
	.word	0xf5380018	! t0_kref+0x268c:   	std	%f26, [%g0 + %i0]
	.word	0xf700a03c	! t0_kref+0x2690:   	ld	[%g2 + 0x3c], %f27
	.word	0xff6e7fe8	! t0_kref+0x2694:   	prefetch	%i1 - 0x18, 31
	.word	0xb5a688da	! t0_kref+0x2698:   	fsubd	%f26, %f26, %f26
	.word	0x81dac019	! t0_kref+0x269c:   	flush	%o3 + %i1
	.word	0xb5a689da	! t0_kref+0x26a0:   	fdivd	%f26, %f26, %f26
	.word	0xb7a6c9bb	! t0_kref+0x26a4:   	fdivs	%f27, %f27, %f27
	.word	0x81ae8a5a	! t0_kref+0x26a8:   	fcmpd	%fcc0, %f26, %f26
	.word	0xa6d4fb9f	! t0_kref+0x26ac:   	umulcc	%l3, -0x461, %l3
	.word	0x3c800005	! t0_kref+0x26b0:   	bpos,a	_kref+0x26c4
	.word	0x9e828009	! t0_kref+0x26b4:   	addcc	%o2, %o1, %o7
	.word	0x9e124016	! t0_kref+0x26b8:   	or	%o1, %l6, %o7
	.word	0xea28a031	! t0_kref+0x26bc:   	stb	%l5, [%g2 + 0x31]
	.word	0xb7a0053b	! t0_kref+0x26c0:   	fsqrts	%f27, %f27
	.word	0xc368a08f	! t0_kref+0x26c4:   	prefetch	%g2 + 0x8f, 1
	.word	0x2b800007	! t0_kref+0x26c8:   	fbug,a	_kref+0x26e4
	.word	0x992576e0	! t0_kref+0x26cc:   	mulscc	%l5, -0x920, %o4
	.word	0xe24e601a	! t0_kref+0x26d0:   	ldsb	[%i1 + 0x1a], %l1
	.word	0x94656b49	! t0_kref+0x26d4:   	subc	%l5, 0xb49, %o2
	.word	0xb7a01a5a	! t0_kref+0x26d8:   	fdtoi	%f26, %f27
	.word	0x30480006	! t0_kref+0x26dc:   	ba,a,pt	%icc, _kref+0x26f4
	.word	0x9e123cef	! t0_kref+0x26e0:   	or	%o0, -0x311, %o7
	.word	0xa212ae13	! t0_kref+0x26e4:   	or	%o2, 0xe13, %l1
	.word	0xa23b31f5	! t0_kref+0x26e8:   	xnor	%o4, -0xe0b, %l1
	.word	0x9fc10000	! t0_kref+0x26ec:   	call	%g4
	.word	0x9644c01a	! t0_kref+0x26f0:   	addc	%l3, %i2, %o3
	.word	0xb7a000bb	! t0_kref+0x26f4:   	fnegs	%f27, %f27
	.word	0xd400a02c	! t0_kref+0x26f8:   	ld	[%g2 + 0x2c], %o2
	.word	0xb7a01a3b	! t0_kref+0x26fc:   	fstoi	%f27, %f27
	.word	0xd4160000	! t0_kref+0x2700:   	lduh	[%i0], %o2
	.word	0xaa7da213	! t0_kref+0x2704:   	sdiv	%l6, 0x213, %l5
	.word	0xeeb01018	! t0_kref+0x2708:   	stha	%l7, [%g0 + %i0]0x80
	.word	0xea6e3fe3	! t0_kref+0x270c:   	ldstub	[%i0 - 0x1d], %l5
	.word	0xa2a8000b	! t0_kref+0x2710:   	andncc	%g0, %o3, %l1
	.word	0xac350014	! t0_kref+0x2714:   	orn	%l4, %l4, %l6
	.word	0x31800001	! t0_kref+0x2718:   	fba,a	_kref+0x271c
	.word	0xe628a037	! t0_kref+0x271c:   	stb	%l3, [%g2 + 0x37]
	.word	0x96b6bdac	! t0_kref+0x2720:   	orncc	%i2, -0x254, %o3
	.word	0xe830a016	! t0_kref+0x2724:   	sth	%l4, [%g2 + 0x16]
	.word	0xba102018	! t0_kref+0x2728:   	mov	0x18, %i5
	.word	0x9415e0b5	! t0_kref+0x272c:   	or	%l7, 0xb5, %o2
	.word	0xb7a6c8bb	! t0_kref+0x2730:   	fsubs	%f27, %f27, %f27
	.word	0x92134017	! t0_kref+0x2734:   	or	%o5, %l7, %o1
	.word	0xaeab34ff	! t0_kref+0x2738:   	andncc	%o4, -0xb01, %l7
	.word	0x9816b5e2	! t0_kref+0x273c:   	or	%i2, -0xa1e, %o4
	.word	0xf7266018	! t0_kref+0x2740:   	st	%f27, [%i1 + 0x18]
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x2748:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x10308000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x258aa000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x1035c000)
.seg "text"
t0_subr2_page_begin:
	.skip 8192
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x10266000)
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
!  Total operations: 2423  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.73   0.78
!  ldub              0.85   1.32
!  ldsh              1.48   1.32
!  lduh              0.56   0.58
!  ld                1.11   0.87
!  ldd               0.28   0.29
!  swap              1.32   1.36
!  ldstub            1.11   1.16
!  stb               0.21   0.37
!  sth               0.32   0.41
!  st                0.77   1.03
!  std               1.13   0.99
!  add               0.24   0.33
!  addcc             0.89   1.03
!  addx              1.25   1.20
!  addxcc            0.72   0.74
!  taddcc            0.27   0.25
!  taddcctv          0.17   0.29
!  sub               0.50   0.17
!  subcc             1.46   1.44
!  subx              0.96   0.91
!  subxcc            0.19   0.17
!  tsubcc            0.03   0.00
!  tsubcctv          0.18   0.21
!  mulscc            0.18   0.08
!  and               1.14   1.03
!  andcc             0.75   0.66
!  andn              0.92   1.16
!  andncc            1.06   1.32
!  or                1.08   1.32
!  orcc              0.28   0.17
!  orn               0.60   0.74
!  orncc             1.23   1.57
!  xor               0.06   0.04
!  xorcc             0.60   0.83
!  xnor              1.04   1.11
!  xnorcc            1.11   0.95
!  sll               0.12   0.08
!  srl               1.07   1.28
!  sra               1.20   1.57
!  unimp             0.02   0.04
!  umul              1.21   1.53
!  smul              1.03   0.74
!  udiv              0.42   0.58
!  sdiv              0.02   0.12
!  umulcc            1.40   1.40
!  smulcc            0.58   0.78
!  udivcc            1.19   1.44
!  sdivcc            0.47   0.45
!  rdy               0.89   0.99
!  wry               0.02   0.04
!  bicc              3.22   3.67
!  sethi             0.33   0.37
!  jmpl              1.05   1.03
!  call              1.30   1.61
!  ticc              0.00   0.00
!  flush             1.07   1.11
!  save              0.65   0.17
!  restore           1.51   0.00
!  stbar             0.90   0.70
!  ldf               1.43   1.98
!  lddf              1.08   1.32
!  stf               1.00   0.91
!  stdf              1.06   1.36
!  fadds             0.12   0.25
!  fsubs             0.75   0.66
!  fmuls             1.31   1.28
!  fdivs             1.21   1.20
!  faddd             0.40   0.25
!  fsubd             0.85   1.03
!  fmuld             0.79   0.74
!  fdivd             1.11   0.74
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.47   0.58
!  fdmulq            0.00   0.00
!  fitos             1.15   1.24
!  fitod             0.07   0.08
!  fitoq             0.00   0.00
!  fstoi             0.81   0.83
!  fstod             0.64   0.70
!  fstoq             0.00   0.00
!  fdtoi             0.91   0.95
!  fdtos             1.32   1.28
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.10   1.24
!  fnegs             1.17   1.20
!  fabss             0.81   0.87
!  fsqrts            2.44   2.72
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.47   0.45
!  fcmpd             0.67   0.78
!  fcmpq             0.00   0.00
!  fcmpes            1.15   0.99
!  fcmped            0.97   0.66
!  fcmpeq            0.00   0.00
!  fbfcc             2.11   2.27
!  ldfsr             0.05   0.00
!  stfsr             0.30   0.17
!  loop              0.36   0.25
!  offset            0.28   0.37
!  area              0.10   0.08
!  target            0.08   0.08
!  goto              0.10   0.08
!  sigsegv           0.25   0.21
!  sigbus            0.08   0.08
!  imodify           1.03   0.74
!  ldfsr_offset      0.21   0.00
!  fpattern          0.43   0.37
!  lbranch           0.19   0.08
!  shmld             4.97   5.32
!  shmst             2.78   3.18
!  shmpf             0.52   0.70
!  shmswap           0.10   0.21
!  shmblkld          0.71   0.00
!  shmblkst          1.10   0.00
!  shmblkchk         0.24   0.08
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
!  casa              0.22   0.29
!  rdasi             0.02   0.00
!  wrasi             0.12   0.00
!  bpcc              1.63   1.65
!  fbpfcc            1.38   1.44
!  fmovscc           0.14   0.29
!  fmovdcc           0.13   0.25
!  fmovqcc           0.00   0.00
!  movcc             0.23   0.12
!  flushw            0.24   0.41
!  membar            0.22   0.12
!  prefetch          0.97   0.95
!  rdpc              0.13   0.04
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.28   0.21
!  lddfa             0.11   0.17
!  ldqfa             0.00   0.00
!  ldsba             0.08   0.12
!  ldsha             0.20   0.21
!  lduba             0.04   0.04
!  lduha             0.04   0.00
!  lda               0.17   0.25
!  ldda              0.10   0.12
!  ldstuba           0.08   0.21
!  prefetcha         0.14   0.12
!  stfa              0.10   0.00
!  stdfa             0.24   0.37
!  stqfa             0.00   0.00
!  stba              0.06   0.00
!  stha              0.27   0.21
!  sta               0.22   0.04
!  stda              0.00   0.00
!  swapa             0.20   0.21
!  fmovd             0.03   0.04
!  fnegd             0.07   0.00
!  fabsd             0.06   0.00
!  fstox             0.06   0.00
!  fdtox             0.19   0.08
!  fxtos             0.04   0.04
!  fxtod             0.10   0.04
!  lds               0.15   0.25
!  ldsa              0.26   0.25
!  ldx               0.17   0.04
!  ldxa              0.17   0.17
!  nofault           0.25   0.37
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
!  partial_st8       0.15   0.17
!  partial_st16      0.06   0.04
!  partial_st32      0.30   0.21
!  short_st8         0.06   0.00
!  short_st16        0.18   0.21
!  short_ld8         0.17   0.29
!  short_ld16        0.29   0.25
!  blkld             0.07   0.00
!  blkst             0.16   0.00
!  blkld_offset      0.01   0.00
!  blkst_offset      0.08   0.00
!  blk_check         0.04   0.00
!  casxa             0.23   0.12
!  rdccr             0.27   0.17
!  rdfprs            0.17   0.12
!  wrccr             0.12   0.12
!  popc              0.06   0.04
!  wrfprs            0.27   0.33
!  stx               0.13   0.12
!  stxa              0.17   0.21
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
KDATA_MODULE(t0_module_offset_table, 0x6e7de000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xffffffe8
	.word	0x00000000
	.word	0xffffffe0
	.word	0xfffffff0
	.word	0x00000018
	.word	0x00000008
	.word	0x00000010
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

KDATA_MODULE(t0_module_data_in_regs, 0x29e62000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x76dbbf33          ! %f0
	.word	0x6c6be260          ! %f1
	.word	0xc1afc996          ! %f2
	.word	0xf312e9e9          ! %f3
	.word	0xfc6bc9ca          ! %f4
	.word	0x3784fb72          ! %f5
	.word	0xd8c21e39          ! %f6
	.word	0x93ea362d          ! %f7
	.word	0xddbdd6fb          ! %f8
	.word	0xa96db99b          ! %f9
	.word	0xdcff3d10          ! %f10
	.word	0x033671ed          ! %f11
	.word	0x74435a62          ! %f12
	.word	0xd26a9d15          ! %f13
	.word	0x9b972b35          ! %f14
	.word	0x112ffa6a          ! %f15
	.word	0x0170e8aa          ! %f16
	.word	0x4f57ed17          ! %f17
	.word	0x49051582          ! %f18
	.word	0x8a6db9ab          ! %f19
	.word	0xdd93f143          ! %f20
	.word	0x8971817d          ! %f21
	.word	0x43798368          ! %f22
	.word	0x1c3742c8          ! %f23
	.word	0x7adddf51          ! %f24
	.word	0xfa9b02a8          ! %f25
	.word	0xad3462ff          ! %f26
	.word	0x6e25ee64          ! %f27
	.word	0xd04bd5e7          ! %f28
	.word	0x7d11c3a2          ! %f29
	.word	0x766b425f          ! %f30
	.word	0xe21cbb7a          ! %f31
	.word	0xf6d17b74          ! %f32
	.word	0xd05f9a86          ! %f33
	.word	0x5b494a2d          ! %f34
	.word	0x0dd6f85d          ! %f35
	.word	0x5ea0887d          ! %f36
	.word	0x38f85b1e          ! %f37
	.word	0x9d5bcd78          ! %f38
	.word	0xa6c9f7f9          ! %f39
	.word	0x19ce0d8c          ! %f40
	.word	0xda61d7cd          ! %f41
	.word	0xe19782c5          ! %f42
	.word	0xb216575e          ! %f43
	.word	0x9831a468          ! %f44
	.word	0xaf608caf          ! %f45
	.word	0xfa4fba68          ! %f46
	.word	0x8b09977f          ! %f47
	.word	0x956a0085          ! %f48
	.word	0xbea158fe          ! %f49
	.word	0x703a2615          ! %f50
	.word	0xf3790f36          ! %f51
	.word	0x58b592bd          ! %f52
	.word	0xeefaeab7          ! %f53
	.word	0x1c2f05b6          ! %f54
	.word	0x5e4b798a          ! %f55
	.word	0x26053440          ! %f56
	.word	0x22e7c07d          ! %f57
	.word	0xedfecd7e          ! %f58
	.word	0xfe16a434          ! %f59
	.word	0x7b9a0cc9          ! %f60
	.word	0xa183e5bc          ! %f61
	.word	0x40b3993d          ! %f62
	.word	0x9c0b025f          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x8c4       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x028b11ab          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x21d7f544          ! %o0
	.word	0x41f70266          ! %o1
	.word	0x0952f586          ! %o2
	.word	0xd7365480          ! %o3
	.word	0x5dcdd931          ! %o4
	.word	0xef331e89          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x7edf2812          ! %l0
	.word	0x4a67cd10          ! %l1
	.word	0x9b2600f5          ! %l2
	.word	0x9ebf27b0          ! %l3
	.word	0x91426e8a          ! %l4
	.word	0x436bece8          ! %l5
	.word	0x0a3222ae          ! %l6
	.word	0x01096f85          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000006          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000010          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x2c373a0b          ! %y
	.word	0x00000006          ! %icc (nzvc)
	.word	0x80000e7b          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x1497e000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xb8ac1d40
	.word	0x3d64e19b
	.word	0x9bd0c3b5
	.word	0x870ad787
	.word	0xd7e3f0d7
	.word	0x5b8f24a9
	.word	0x7e3dbd18
	.word	0xf3e15ed7
	.word	0xdab76742
	.word	0xfc254e19
	.word	0xf599b9ca
	.word	0x8e3ebfee
	.word	0x25e60d3a
	.word	0x9a07e71b
	.word	0xebcc36e6
	.word	0xf958b9ab
	.word	0x8aa8b887
	.word	0xed147b07
	.word	0x3b4e2c75
	.word	0x08d8564e
	.word	0x87690392
	.word	0x95bc2d5c
	.word	0xccbf8524
	.word	0x14f99b17
	.word	0xb43c6e37
	.word	0x085f2c04
	.word	0x442fdd37
	.word	0xbf040e2d
	.word	0xd8b037e0
	.word	0x5d7681dc
	.word	0xbfbfbcbe
	.word	0xb62b36c1
	.word	0xcbb046cf
	.word	0x342a0d74
	.word	0x81dec105
	.word	0xdc347b73
	.word	0xd024b0ba
	.word	0xea88a012
	.word	0x5cbe6950
	.word	0xf73202f4
	.word	0x7686b89c
	.word	0x5d7488fd
	.word	0x49d87ac7
	.word	0xb0787aec
	.word	0x0e6755c9
	.word	0xfab710f7
	.word	0xf2e32faf
	.word	0xe2efe91d
	.word	0x9fee9843
	.word	0xc5d1aa0a
	.word	0xb07ca5da
	.word	0x7a3deac7
	.word	0x0dfc7e4c
	.word	0x9c4bd787
	.word	0xf97a4060
	.word	0x534a064e
	.word	0x0b090f3c
	.word	0x64a9124b
	.word	0xb35ff08f
	.word	0x8382f31a
	.word	0xae6acf94
	.word	0x44222d44
	.word	0xc44e9a1f
	.word	0x2155fbbe
	.word	0xc287e252
	.word	0x9ef1fe33
	.word	0x9ff806aa
	.word	0x7bb7de5b
	.word	0xf7e76b86
	.word	0xadbd4eb3
	.word	0xef1a1c5a
	.word	0xa2b0cf46
	.word	0x7a5e0825
	.word	0x449a5979
	.word	0x7aea4be3
	.word	0x1dd381e8
	.word	0x7de96f1c
	.word	0xf5bc57dc
	.word	0xfef569b4
	.word	0xb9a15be5
	.word	0x157c8fa8
	.word	0xb70be397
	.word	0xab876668
	.word	0xe05c3680
	.word	0x783ec0e4
	.word	0x573d30ce
	.word	0xebf19a82
	.word	0x0fe8523e
	.word	0x06d5d6a3
	.word	0x5881644e
	.word	0x563d995a
	.word	0xa36760c8
	.word	0x437c2f7f
	.word	0xb5008a19
	.word	0xa045bf51
	.word	0x6e5fc915
	.word	0x32211031
	.word	0xe81df020
	.word	0xa00bef4b
	.word	0x0ed189c8
	.word	0x7ae2e023
	.word	0x9f60e952
	.word	0xfdba335e
	.word	0x85cc5dd6
	.word	0x46181b43
	.word	0x3af83cd5
	.word	0x8c4034c6
	.word	0x9931076b
	.word	0x47150d1a
	.word	0xd86ec592
	.word	0xa53bbf1c
	.word	0xe781e50e
	.word	0x4729a91c
	.word	0xd68c05f7
	.word	0x4509c2c7
	.word	0xfe453502
	.word	0xce341441
	.word	0x6fc3b3f7
	.word	0x8fc08ab2
	.word	0x5ebdaaef
	.word	0x26d9b3d4
	.word	0x4d438155
	.word	0x66ab193f
	.word	0x41e43bc2
	.word	0xeb41d58a
	.word	0x6fdea422
	.word	0x82e8e07a
	.word	0x55d843d1
	.word	0xd14a44d5
	.word	0xe20ae384
	.word	0x54544992
	.word	0x3aa96b41
	.word	0x73df617a
	.word	0xbf1b2cb8
	.word	0x8f05bf84
	.word	0x74b0ecab
	.word	0x0fa68b61
	.word	0xe41ff459
	.word	0xb4f03118
	.word	0x05e621fd
	.word	0x5cc2f7ab
	.word	0x4695e7e1
	.word	0x0f6f3e11
	.word	0x2ff47b9e
	.word	0xfb6a4309
	.word	0x688fb370
	.word	0xf56e839f
	.word	0xb49745d5
	.word	0xfe7f554b
	.word	0xa98fdfcc
	.word	0x1954bc18
	.word	0x9321e06b
	.word	0x83bf6a37
	.word	0x83140ca9
	.word	0x1554a5e7
	.word	0xf7614c8e
	.word	0x9576539c
	.word	0xd8230b29
	.word	0xe070e5c4
	.word	0x296e34f7
	.word	0xb36c48a6
	.word	0xe4439ca5
	.word	0x119f5825
	.word	0x8dd4d44f
	.word	0xd910d672
	.word	0x9059d9ad
	.word	0x5c4b85f3
	.word	0x8bea5dce
t0_data_in_sp:
	.word	0xfb0bc5e4
	.word	0xcf45854d
	.word	0xf93f3081
	.word	0xc37dcc25
	.word	0x2f960ab8
	.word	0x70fbd092
	.word	0x63f328b9
	.word	0xc58c3a9e
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffffe
	.word	0x00000018
	.word	0xfffffff8
	.word	0xffffffe8
	.word	t0_data_in_fp
	.word	0x99a13714
	.word	0x89588ddb
	.word	0x6ffd66b7
	.word	0xda1f9135
	.word	0x22d2ed90
	.word	0x99ba68fa
	.word	0xa1bd3fb4
	.word	0xc64b4f9d
	.word	0xf3dfd2f5
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
	.word   	0x38b5eb55	! [%fp - 0xc]
	.word   	0x26518992	! [%fp - 0x8]
	.word   	0x6844380a	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x69b2a3cd
	.word	0xf699d1ac
	.word	0x56d87a79
	.word	0x9d70b9f3
	.word	0x29a2b4f9
	.word	0x03abffd5
	.word	0xad063747
	.word	0xb7550c36
	.word	0xe9b138f9
	.word	0x512b16a8
	.word	0x127ae46c
	.word	0xe0953628
	.word	0xfcff156b
	.word	0x8afef53d
	.word	0xf8ee6115
	.word	0x6ee615ec
	.word	0x708c0cd1
	.word	0x8d539959
	.word	0x15ba108c
	.word	0xe7d7f808
	.word	0x2e184097
	.word	0x2d1d1324
	.word	0x10eb55de
	.word	0x59fa9435
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x47378000)
.seg "data"
t0_data_in_area0_start:
.skip 4288
t0_data_in_area0_begin:
	.word	0x310d4f53	! t0_data_in_area0-0x20
	.word	0x0f3a8020	! t0_data_in_area0-0x1c
	.word	0x7d8fa5bd	! t0_data_in_area0-0x18
	.word	0xa3838376	! t0_data_in_area0-0x14
	.word	0x5be4934e	! t0_data_in_area0-0x10
	.word	0x7ad94156	! t0_data_in_area0-0xc
	.word	0xa09552a8	! t0_data_in_area0-0x8
	.word	0x809d836b	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xafd44542	! t0_data_in_area0+0x0
	.word	0xa018e0d1	! t0_data_in_area0+0x4
	.word	0xe3aa7748	! t0_data_in_area0+0x8
	.word	0x87181ae6	! t0_data_in_area0+0xc
	.word	0x54e58765	! t0_data_in_area0+0x10
	.word	0x77035a50	! t0_data_in_area0+0x14
	.word	0xf435a31d	! t0_data_in_area0+0x18
	.word	0x209473be	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 3840
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x6898a000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x12319ca6	! t0_data_in_shm_area+0x0 (t0)
	.word	0xdbf4bb36	! t0_data_in_shm_area+0x4 (t0)
	.word	0x021a2d59	! t0_data_in_shm_area+0x8 (t0)
	.word	0xc8c57de3	! t0_data_in_shm_area+0xc (t0)
	.word	0x1d24d035	! t0_data_in_shm_area+0x10 (t0)
	.word	0xd0c84dc5	! t0_data_in_shm_area+0x14 (t0)
	.word	0x00b4520b	! t0_data_in_shm_area+0x18 (t0)
	.word	0x5026afb2	! t0_data_in_shm_area+0x1c (t0)
	.word	0xd789d149	! t0_data_in_shm_area+0x20 (t0)
	.word	0x2cd0c38b	! t0_data_in_shm_area+0x24 (t0)
	.word	0x44977d80	! t0_data_in_shm_area+0x28 (t0)
	.word	0x35edf78b	! t0_data_in_shm_area+0x2c (t0)
	.word	0x8708871d	! t0_data_in_shm_area+0x30 (t0)
	.word	0x9c04131b	! t0_data_in_shm_area+0x34 (t0)
	.word	0x0c5b69e6	! t0_data_in_shm_area+0x38 (t0)
	.word	0xbb32b29f	! t0_data_in_shm_area+0x3c (t0)
	.word	0xe1efa13a	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x9f1afd00	! t0_data_in_shm_area+0x44
	.word	0x086af331	! t0_data_in_shm_area+0x48
	.word	0x968cbd0e	! t0_data_in_shm_area+0x4c
	.word	0x9cd067fc	! t0_data_in_shm_area+0x50
	.word	0x85ef6bee	! t0_data_in_shm_area+0x54
	.word	0x8791c541	! t0_data_in_shm_area+0x58
	.word	0xf80bef30	! t0_data_in_shm_area+0x5c
	.word	0xd6e8914e	! t0_data_in_shm_area+0x60
	.word	0xca64243b	! t0_data_in_shm_area+0x64
	.word	0xaa344844	! t0_data_in_shm_area+0x68
	.word	0x3a999c32	! t0_data_in_shm_area+0x6c
	.word	0x40ce1db7	! t0_data_in_shm_area+0x70
	.word	0x27d3768d	! t0_data_in_shm_area+0x74
	.word	0xa6ef6f59	! t0_data_in_shm_area+0x78
	.word	0x66dae5e5	! t0_data_in_shm_area+0x7c
	.word	0x4d8d819a	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xa0a9e9d3	! t0_data_in_shm_area+0x84
	.word	0x67144d75	! t0_data_in_shm_area+0x88
	.word	0xd5c3f9d2	! t0_data_in_shm_area+0x8c
	.word	0x5aaa9eb9	! t0_data_in_shm_area+0x90
	.word	0xe4ad1078	! t0_data_in_shm_area+0x94
	.word	0x5a4d948a	! t0_data_in_shm_area+0x98
	.word	0x6b798b91	! t0_data_in_shm_area+0x9c
	.word	0xf37951fa	! t0_data_in_shm_area+0xa0
	.word	0x35bdfcd6	! t0_data_in_shm_area+0xa4
	.word	0x84fb62e5	! t0_data_in_shm_area+0xa8
	.word	0x3f1f205a	! t0_data_in_shm_area+0xac
	.word	0xa04a996e	! t0_data_in_shm_area+0xb0
	.word	0xb1ea08e8	! t0_data_in_shm_area+0xb4
	.word	0x4eb402d7	! t0_data_in_shm_area+0xb8
	.word	0x1705ffdc	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x4eb86000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x76dbbf33          ! %f0
	.word	0x6c6be260          ! %f1
	.word	0xc1afc996          ! %f2
	.word	0xf312e9e9          ! %f3
	.word	0xfc6bc9ca          ! %f4
	.word	0x3784fb72          ! %f5
	.word	0xd8c21e39          ! %f6
	.word	0x93ea362d          ! %f7
	.word	0xddbdd6fb          ! %f8
	.word	0xa96db99b          ! %f9
	.word	0xdcff3d10          ! %f10
	.word	0x033671ed          ! %f11
	.word	0x74435a62          ! %f12
	.word	0xd26a9d15          ! %f13
	.word	0x9b972b35          ! %f14
	.word	0x112ffa6a          ! %f15
	.word	0x0170e8aa          ! %f16
	.word	0x4f57ed17          ! %f17
	.word	0x49051582          ! %f18
	.word	0x8a6db9ab          ! %f19
	.word	0xdd93f143          ! %f20
	.word	0x8971817d          ! %f21
	.word	0x43798368          ! %f22
	.word	0x1c3742c8          ! %f23
	.word	0x7adddf51          ! %f24
	.word	0xfa9b02a8          ! %f25
	.word	0xad3462ff          ! %f26
	.word	0x6e25ee64          ! %f27
	.word	0xd04bd5e7          ! %f28
	.word	0x7d11c3a2          ! %f29
	.word	0x766b425f          ! %f30
	.word	0xe21cbb7a          ! %f31
	.word	0xf6d17b74          ! %f32
	.word	0xd05f9a86          ! %f33
	.word	0x5b494a2d          ! %f34
	.word	0x0dd6f85d          ! %f35
	.word	0x5ea0887d          ! %f36
	.word	0x38f85b1e          ! %f37
	.word	0x9d5bcd78          ! %f38
	.word	0xa6c9f7f9          ! %f39
	.word	0x19ce0d8c          ! %f40
	.word	0xda61d7cd          ! %f41
	.word	0xe19782c5          ! %f42
	.word	0xb216575e          ! %f43
	.word	0x9831a468          ! %f44
	.word	0xaf608caf          ! %f45
	.word	0xfa4fba68          ! %f46
	.word	0x8b09977f          ! %f47
	.word	0x956a0085          ! %f48
	.word	0xbea158fe          ! %f49
	.word	0x703a2615          ! %f50
	.word	0xf3790f36          ! %f51
	.word	0x58b592bd          ! %f52
	.word	0xeefaeab7          ! %f53
	.word	0x1c2f05b6          ! %f54
	.word	0x5e4b798a          ! %f55
	.word	0x26053440          ! %f56
	.word	0x22e7c07d          ! %f57
	.word	0xedfecd7e          ! %f58
	.word	0xfe16a434          ! %f59
	.word	0x7b9a0cc9          ! %f60
	.word	0xa183e5bc          ! %f61
	.word	0x40b3993d          ! %f62
	.word	0x9c0b025f          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x8c4       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x028b11ab          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x21d7f544          ! %o0
	.word	0x41f70266          ! %o1
	.word	0x0952f586          ! %o2
	.word	0xd7365480          ! %o3
	.word	0x5dcdd931          ! %o4
	.word	0xef331e89          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x7edf2812          ! %l0
	.word	0x4a67cd10          ! %l1
	.word	0x9b2600f5          ! %l2
	.word	0x9ebf27b0          ! %l3
	.word	0x91426e8a          ! %l4
	.word	0x436bece8          ! %l5
	.word	0x0a3222ae          ! %l6
	.word	0x01096f85          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000006          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000010          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x2c373a0b          ! %y
	.word	0x00000006          ! %icc (nzvc)
	.word	0x80000e7b          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x67b38000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xb8ac1d40
	.word	0x3d64e19b
	.word	0x9bd0c3b5
	.word	0x870ad787
	.word	0xd7e3f0d7
	.word	0x5b8f24a9
	.word	0x7e3dbd18
	.word	0xf3e15ed7
	.word	0xdab76742
	.word	0xfc254e19
	.word	0xf599b9ca
	.word	0x8e3ebfee
	.word	0x25e60d3a
	.word	0x9a07e71b
	.word	0xebcc36e6
	.word	0xf958b9ab
	.word	0x8aa8b887
	.word	0xed147b07
	.word	0x3b4e2c75
	.word	0x08d8564e
	.word	0x87690392
	.word	0x95bc2d5c
	.word	0xccbf8524
	.word	0x14f99b17
	.word	0xb43c6e37
	.word	0x085f2c04
	.word	0x442fdd37
	.word	0xbf040e2d
	.word	0xd8b037e0
	.word	0x5d7681dc
	.word	0xbfbfbcbe
	.word	0xb62b36c1
	.word	0xcbb046cf
	.word	0x342a0d74
	.word	0x81dec105
	.word	0xdc347b73
	.word	0xd024b0ba
	.word	0xea88a012
	.word	0x5cbe6950
	.word	0xf73202f4
	.word	0x7686b89c
	.word	0x5d7488fd
	.word	0x49d87ac7
	.word	0xb0787aec
	.word	0x0e6755c9
	.word	0xfab710f7
	.word	0xf2e32faf
	.word	0xe2efe91d
	.word	0x9fee9843
	.word	0xc5d1aa0a
	.word	0xb07ca5da
	.word	0x7a3deac7
	.word	0x0dfc7e4c
	.word	0x9c4bd787
	.word	0xf97a4060
	.word	0x534a064e
	.word	0x0b090f3c
	.word	0x64a9124b
	.word	0xb35ff08f
	.word	0x8382f31a
	.word	0xae6acf94
	.word	0x44222d44
	.word	0xc44e9a1f
	.word	0x2155fbbe
	.word	0xc287e252
	.word	0x9ef1fe33
	.word	0x9ff806aa
	.word	0x7bb7de5b
	.word	0xf7e76b86
	.word	0xadbd4eb3
	.word	0xef1a1c5a
	.word	0xa2b0cf46
	.word	0x7a5e0825
	.word	0x449a5979
	.word	0x7aea4be3
	.word	0x1dd381e8
	.word	0x7de96f1c
	.word	0xf5bc57dc
	.word	0xfef569b4
	.word	0xb9a15be5
	.word	0x157c8fa8
	.word	0xb70be397
	.word	0xab876668
	.word	0xe05c3680
	.word	0x783ec0e4
	.word	0x573d30ce
	.word	0xebf19a82
	.word	0x0fe8523e
	.word	0x06d5d6a3
	.word	0x5881644e
	.word	0x563d995a
	.word	0xa36760c8
	.word	0x437c2f7f
	.word	0xb5008a19
	.word	0xa045bf51
	.word	0x6e5fc915
	.word	0x32211031
	.word	0xe81df020
	.word	0xa00bef4b
	.word	0x0ed189c8
	.word	0x7ae2e023
	.word	0x9f60e952
	.word	0xfdba335e
	.word	0x85cc5dd6
	.word	0x46181b43
	.word	0x3af83cd5
	.word	0x8c4034c6
	.word	0x9931076b
	.word	0x47150d1a
	.word	0xd86ec592
	.word	0xa53bbf1c
	.word	0xe781e50e
	.word	0x4729a91c
	.word	0xd68c05f7
	.word	0x4509c2c7
	.word	0xfe453502
	.word	0xce341441
	.word	0x6fc3b3f7
	.word	0x8fc08ab2
	.word	0x5ebdaaef
	.word	0x26d9b3d4
	.word	0x4d438155
	.word	0x66ab193f
	.word	0x41e43bc2
	.word	0xeb41d58a
	.word	0x6fdea422
	.word	0x82e8e07a
	.word	0x55d843d1
	.word	0xd14a44d5
	.word	0xe20ae384
	.word	0x54544992
	.word	0x3aa96b41
	.word	0x73df617a
	.word	0xbf1b2cb8
	.word	0x8f05bf84
	.word	0x74b0ecab
	.word	0x0fa68b61
	.word	0xe41ff459
	.word	0xb4f03118
	.word	0x05e621fd
	.word	0x5cc2f7ab
	.word	0x4695e7e1
	.word	0x0f6f3e11
	.word	0x2ff47b9e
	.word	0xfb6a4309
	.word	0x688fb370
	.word	0xf56e839f
	.word	0xb49745d5
	.word	0xfe7f554b
	.word	0xa98fdfcc
	.word	0x1954bc18
	.word	0x9321e06b
	.word	0x83bf6a37
	.word	0x83140ca9
	.word	0x1554a5e7
	.word	0xf7614c8e
	.word	0x9576539c
	.word	0xd8230b29
	.word	0xe070e5c4
	.word	0x296e34f7
	.word	0xb36c48a6
	.word	0xe4439ca5
	.word	0x119f5825
	.word	0x8dd4d44f
	.word	0xd910d672
	.word	0x9059d9ad
	.word	0x5c4b85f3
	.word	0x8bea5dce
t0_data_exp_sp:
	.word	0xfb0bc5e4
	.word	0xcf45854d
	.word	0xf93f3081
	.word	0xc37dcc25
	.word	0x2f960ab8
	.word	0x70fbd092
	.word	0x63f328b9
	.word	0xc58c3a9e
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffffe
	.word	0x00000018
	.word	0xfffffff8
	.word	0xffffffe8
	.word	t0_data_exp_fp
	.word	0x99a13714
	.word	0x89588ddb
	.word	0x6ffd66b7
	.word	0xda1f9135
	.word	0x22d2ed90
	.word	0x99ba68fa
	.word	0xa1bd3fb4
	.word	0xc64b4f9d
	.word	0xf3dfd2f5
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
	.word   	0x38b5eb55	! [%fp - 0xc]
	.word   	0x26518992	! [%fp - 0x8]
	.word   	0x6844380a	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x69b2a3cd
	.word	0xf699d1ac
	.word	0x56d87a79
	.word	0x9d70b9f3
	.word	0x29a2b4f9
	.word	0x03abffd5
	.word	0xad063747
	.word	0xb7550c36
	.word	0xe9b138f9
	.word	0x512b16a8
	.word	0x127ae46c
	.word	0xe0953628
	.word	0xfcff156b
	.word	0x8afef53d
	.word	0xf8ee6115
	.word	0x6ee615ec
	.word	0x708c0cd1
	.word	0x8d539959
	.word	0x15ba108c
	.word	0xe7d7f808
	.word	0x2e184097
	.word	0x2d1d1324
	.word	0x10eb55de
	.word	0x59fa9435
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x48be8000)
.seg "data"
t0_data_exp_area0_start:
.skip 4288
t0_data_exp_area0_begin:
	.word	0x310d4f53	! t0_data_exp_area0-0x20
	.word	0x0f3a8020	! t0_data_exp_area0-0x1c
	.word	0x7d8fa5bd	! t0_data_exp_area0-0x18
	.word	0xa3838376	! t0_data_exp_area0-0x14
	.word	0x5be4934e	! t0_data_exp_area0-0x10
	.word	0x7ad94156	! t0_data_exp_area0-0xc
	.word	0xa09552a8	! t0_data_exp_area0-0x8
	.word	0x809d836b	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xafd44542	! t0_data_exp_area0+0x0
	.word	0xa018e0d1	! t0_data_exp_area0+0x4
	.word	0xe3aa7748	! t0_data_exp_area0+0x8
	.word	0x87181ae6	! t0_data_exp_area0+0xc
	.word	0x54e58765	! t0_data_exp_area0+0x10
	.word	0x77035a50	! t0_data_exp_area0+0x14
	.word	0xf435a31d	! t0_data_exp_area0+0x18
	.word	0x209473be	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 3840
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x7ba76000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x12319ca6	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xdbf4bb36	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x021a2d59	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xc8c57de3	! t0_data_exp_shm_area+0xc (t0)
	.word	0x1d24d035	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xd0c84dc5	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x00b4520b	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x5026afb2	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xd789d149	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x2cd0c38b	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x44977d80	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x35edf78b	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x8708871d	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x9c04131b	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x0c5b69e6	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xbb32b29f	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xe1efa13a	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x9f1afd00	! t0_data_exp_shm_area+0x44
	.word	0x086af331	! t0_data_exp_shm_area+0x48
	.word	0x968cbd0e	! t0_data_exp_shm_area+0x4c
	.word	0x9cd067fc	! t0_data_exp_shm_area+0x50
	.word	0x85ef6bee	! t0_data_exp_shm_area+0x54
	.word	0x8791c541	! t0_data_exp_shm_area+0x58
	.word	0xf80bef30	! t0_data_exp_shm_area+0x5c
	.word	0xd6e8914e	! t0_data_exp_shm_area+0x60
	.word	0xca64243b	! t0_data_exp_shm_area+0x64
	.word	0xaa344844	! t0_data_exp_shm_area+0x68
	.word	0x3a999c32	! t0_data_exp_shm_area+0x6c
	.word	0x40ce1db7	! t0_data_exp_shm_area+0x70
	.word	0x27d3768d	! t0_data_exp_shm_area+0x74
	.word	0xa6ef6f59	! t0_data_exp_shm_area+0x78
	.word	0x66dae5e5	! t0_data_exp_shm_area+0x7c
	.word	0x4d8d819a	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xa0a9e9d3	! t0_data_exp_shm_area+0x84
	.word	0x67144d75	! t0_data_exp_shm_area+0x88
	.word	0xd5c3f9d2	! t0_data_exp_shm_area+0x8c
	.word	0x5aaa9eb9	! t0_data_exp_shm_area+0x90
	.word	0xe4ad1078	! t0_data_exp_shm_area+0x94
	.word	0x5a4d948a	! t0_data_exp_shm_area+0x98
	.word	0x6b798b91	! t0_data_exp_shm_area+0x9c
	.word	0xf37951fa	! t0_data_exp_shm_area+0xa0
	.word	0x35bdfcd6	! t0_data_exp_shm_area+0xa4
	.word	0x84fb62e5	! t0_data_exp_shm_area+0xa8
	.word	0x3f1f205a	! t0_data_exp_shm_area+0xac
	.word	0xa04a996e	! t0_data_exp_shm_area+0xb0
	.word	0xb1ea08e8	! t0_data_exp_shm_area+0xb4
	.word	0x4eb402d7	! t0_data_exp_shm_area+0xb8
	.word	0x1705ffdc	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d1e9ab174e57
#define T0_KAOS_ICOUNT        2513
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    4288
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     2515

#define T0_KAOS_BOOT_VA                  0x2f4f4000
#define T0_KAOS_BOOT_PA                  0x000000000142a000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x34d9c000
#define T0_KAOS_STARTUP_PA               0x0000000002f3a000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x6e7de000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000005c9c000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x41312000
#define T0_KAOS_DONE_PA                  0x0000000006e5c000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x10320000
#define T0_KAOS_KTBL_PA                  0x0000000009576000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x10308000
#define T0_KAOS_SUBR0_PA                 0x000000000a2d2000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x258aa000
#define T0_KAOS_SUBR1_PA                 0x000000000cb84000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x1035c000
#define T0_KAOS_SUBR2_PA                 0x000000000ea5c000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x10266000
#define T0_KAOS_SUBR3_PA                 0x0000000010374000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x4eb86000
#define T0_KAOS_EXP_REGS_PA              0x000000001387a000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x29e62000
#define T0_KAOS_RUN_REGS_PA              0x0000000015976000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x67b38000
#define T0_KAOS_EXP_STACK_PA             0x0000000017a10000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x1497e000
#define T0_KAOS_RUN_STACK_PA             0x0000000018092000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x48be8000
#define T0_KAOS_EXP_AREA0_PA             0x000000001a470000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x47378000
#define T0_KAOS_RUN_AREA0_PA             0x000000001df86000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x7ba76000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000480000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x6898a000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000f6a000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xce37968e
#define T0_KAOS_RANVAL_01     0x7793e544
#define T0_KAOS_RANVAL_02     0x2c1e8097
#define T0_KAOS_RANVAL_03     0x0399de4d
#define T0_KAOS_RANVAL_04     0x8923f0c7
#define T0_KAOS_RANVAL_05     0x46aa2347
#define T0_KAOS_RANVAL_06     0xc3463a66
#define T0_KAOS_RANVAL_07     0x03a593c2
#define T0_KAOS_RANVAL_08     0x03255c37
#define T0_KAOS_RANVAL_09     0x5f7fae91
#define T0_KAOS_RANVAL_0a     0xd9d4cef4
#define T0_KAOS_RANVAL_0b     0xfb5b74bf
#define T0_KAOS_RANVAL_0c     0x431648b9
#define T0_KAOS_RANVAL_0d     0x702de9b3
#define T0_KAOS_RANVAL_0e     0x1b920e02
#define T0_KAOS_RANVAL_0f     0x3a322012
#define T0_KAOS_RANVAL_10     0x1bf5fd1f
#define T0_KAOS_RANVAL_11     0x5baf6227
#define T0_KAOS_RANVAL_12     0x5b5fcf48
#define T0_KAOS_RANVAL_13     0x3b5fd5dc
#define T0_KAOS_RANVAL_14     0x9018a2bd
#define T0_KAOS_RANVAL_15     0xb55d4f80
#define T0_KAOS_RANVAL_16     0x43e1d398
#define T0_KAOS_RANVAL_17     0x76cbabef
#define T0_KAOS_RANVAL_18     0x924e052e
#define T0_KAOS_RANVAL_19     0x8f6951e1
#define T0_KAOS_RANVAL_1a     0xcd601442
#define T0_KAOS_RANVAL_1b     0xcded335f
#define T0_KAOS_RANVAL_1c     0x4c4e0a52
#define T0_KAOS_RANVAL_1d     0x069023b3
#define T0_KAOS_RANVAL_1e     0x2e7424ba
#define T0_KAOS_RANVAL_1f     0x06886353
#define T0_KAOS_RANVAL_20     0x89262695
#define T0_KAOS_RANVAL_21     0x0fd93292
#define T0_KAOS_RANVAL_22     0x32f88a78
#define T0_KAOS_RANVAL_23     0x95bcdd1b
#define T0_KAOS_RANVAL_24     0xfc535177
#define T0_KAOS_RANVAL_25     0xf2025387
#define T0_KAOS_RANVAL_26     0xeabb2f1f
#define T0_KAOS_RANVAL_27     0xc5bcdd87
#define T0_KAOS_RANVAL_28     0xfee83e47
#define T0_KAOS_RANVAL_29     0x7276067c
#define T0_KAOS_RANVAL_2a     0xd5e250e1
#define T0_KAOS_RANVAL_2b     0xa0f16f76
#define T0_KAOS_RANVAL_2c     0x2bd7dd31
#define T0_KAOS_RANVAL_2d     0xb89dfcec
#define T0_KAOS_RANVAL_2e     0x1a059521
#define T0_KAOS_RANVAL_2f     0x7b96b3ad
#define T0_KAOS_RANVAL_30     0x6f78687b
#define T0_KAOS_RANVAL_31     0xd94ad7d9
#define T0_KAOS_RANVAL_32     0xc6f32159
#define T0_KAOS_RANVAL_33     0xfa3451e9
#define T0_KAOS_RANVAL_34     0x94d3820b
#define T0_KAOS_RANVAL_35     0xaa055103
#define T0_KAOS_RANVAL_36     0xcf32de3d
#define T0_KAOS_RANVAL_37     0xed036736
#define T0_KAOS_RANVAL_38     0xd19c252c
#define T0_KAOS_RANVAL_39     0x28ac4356
#define T0_KAOS_RANVAL_3a     0x84d84920
#define T0_KAOS_RANVAL_3b     0xb7948581
#define T0_KAOS_RANVAL_3c     0xffeb7091
#define T0_KAOS_RANVAL_3d     0x620646a3
#define T0_KAOS_RANVAL_3e     0x39557797
#define T0_KAOS_RANVAL_3f     0x861d986c
#define T0_KAOS_RANVAL_40     0x17718c99
#define T0_KAOS_RANVAL_41     0x3924d293
#define T0_KAOS_RANVAL_42     0x0508315b
#define T0_KAOS_RANVAL_43     0xa000c361
#define T0_KAOS_RANVAL_44     0x8ed831d4
#define T0_KAOS_RANVAL_45     0xdce21cd7
#define T0_KAOS_RANVAL_46     0xd3644473
#define T0_KAOS_RANVAL_47     0x669a8ce9
#define T0_KAOS_RANVAL_48     0xdde893c5
#define T0_KAOS_RANVAL_49     0xa7a226a4
#define T0_KAOS_RANVAL_4a     0x192c7792
#define T0_KAOS_RANVAL_4b     0x4176eb3e
#define T0_KAOS_RANVAL_4c     0xa9deb3e9
#define T0_KAOS_RANVAL_4d     0xdb12ad5e
#define T0_KAOS_RANVAL_4e     0x355dbebd
#define T0_KAOS_RANVAL_4f     0xf2f2061e
#define T0_KAOS_RANVAL_50     0xc37060f8
#define T0_KAOS_RANVAL_51     0x5d2cf293
#define T0_KAOS_RANVAL_52     0x71869630
#define T0_KAOS_RANVAL_53     0xbb42c1e1
#define T0_KAOS_RANVAL_54     0x19ae666a
#define T0_KAOS_RANVAL_55     0xb8778f2a
#define T0_KAOS_RANVAL_56     0x0d7ea782
#define T0_KAOS_RANVAL_57     0xc93a67ce
#define T0_KAOS_RANVAL_58     0xf24ab03c
#define T0_KAOS_RANVAL_59     0x06b5c5db
#define T0_KAOS_RANVAL_5a     0x4b111d07
#define T0_KAOS_RANVAL_5b     0xd0e5ffa9
#define T0_KAOS_RANVAL_5c     0xef3666f3
#define T0_KAOS_RANVAL_5d     0xae1508e2
#define T0_KAOS_RANVAL_5e     0x3a6e4775
#define T0_KAOS_RANVAL_5f     0x1df32e90
#define T0_KAOS_RANVAL_60     0xc73747e0
#define T0_KAOS_RANVAL_61     0x7cc0a6ee
#define T0_KAOS_RANVAL_62     0x2e5f79c9
#define T0_KAOS_RANVAL_63     0x1383af06
#define T0_KAOS_RANVAL_64     0xbb43bda6
#define T0_KAOS_RANVAL_65     0x70ced35f
#define T0_KAOS_RANVAL_66     0x79823f6b
#define T0_KAOS_RANVAL_67     0x1237b650
#define T0_KAOS_RANVAL_68     0x21697cf9
#define T0_KAOS_RANVAL_69     0x89f97db1
#define T0_KAOS_RANVAL_6a     0x027e5090
#define T0_KAOS_RANVAL_6b     0x10e8daff
#define T0_KAOS_RANVAL_6c     0x3ffaa9a8
#define T0_KAOS_RANVAL_6d     0x42c8ac32
#define T0_KAOS_RANVAL_6e     0x9e7be8df
#define T0_KAOS_RANVAL_6f     0x8a1450ce
#define T0_KAOS_RANVAL_70     0xd4f9c7dc
#define T0_KAOS_RANVAL_71     0x96fb4dfb
#define T0_KAOS_RANVAL_72     0x1d566456
#define T0_KAOS_RANVAL_73     0x808c8dad
#define T0_KAOS_RANVAL_74     0x367cfda1
#define T0_KAOS_RANVAL_75     0xd856b81d
#define T0_KAOS_RANVAL_76     0xd461466f
#define T0_KAOS_RANVAL_77     0x66f7ac1d
#define T0_KAOS_RANVAL_78     0xed4568a6
#define T0_KAOS_RANVAL_79     0x80d44219
#define T0_KAOS_RANVAL_7a     0xe9540f7e
#define T0_KAOS_RANVAL_7b     0x58211ebe
#define T0_KAOS_RANVAL_7c     0xfb4f8c40
#define T0_KAOS_RANVAL_7d     0xe4a7b596
#define T0_KAOS_RANVAL_7e     0xf953845c
#define T0_KAOS_RANVAL_7f     0xcf7a8926
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
!    areaoffset     4288
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      2515
!    code           10320000
!    entry          10320000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d1e9ab174e57
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

KTEXT_MODULE(t0_module_ktbl, 0x10320000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xc048a038	! t0_kref+0x0:   	ldsb	[%g2 + 0x38], %g0
	.word	0x81ae8a5a	! t0_kref+0x4:   	fcmpd	%fcc0, %f26, %f26
	.word	0xf1be5a5b	! t0_kref+0x8:   	stda	%f24, [%i1 + %i3]0xd2
	.word	0x80b6ac11	! t0_kref+0xc:   	orncc	%i2, 0xc11, %g0
	.word	0xee6e7fe6	! t0_kref+0x10:   	ldstub	[%i1 - 0x1a], %l7
	.word	0xd4167fe8	! t0_kref+0x14:   	lduh	[%i1 - 0x18], %o2
	.word	0xb7a01a3b	! t0_kref+0x18:   	fstoi	%f27, %f27
	call	1f
	.empty
	.word	0xa438000d	! t0_kref+0x20:   	xnor	%g0, %o5, %l2
	.word	0xb7a01a3b	! t0_kref+0x24:   	fstoi	%f27, %f27
	.word	0xf706601c	! t0_kref+0x28:   	ld	[%i1 + 0x1c], %f27
	.word	0xd5e61000	! t0_kref+0x2c:   	casa	[%i0]0x80, %g0, %o2
	.word	0x8083620b	! t0_kref+0x30:   	addcc	%o5, 0x20b, %g0
	.word	0xb7a000bb	! t0_kref+0x34:   	fnegs	%f27, %f27
	.word	0x9245c013	! t0_kref+0x38:   	addc	%l7, %l3, %o1
1:	.word	0x92dac009	! t0_kref+0x3c:   	smulcc	%o3, %o1, %o1
	.word	0x9b408000	! t0_kref+0x40:   	mov	%ccr, %o5
	.word	0xac5d4013	! t0_kref+0x44:   	smul	%l5, %l3, %l6
	.word	0xee2e7fed	! t0_kref+0x48:   	stb	%l7, [%i1 - 0x13]
	.word	0xe56e2008	! t0_kref+0x4c:   	prefetch	%i0 + 8, 18
	.word	0xa252c013	! t0_kref+0x50:   	umul	%o3, %l3, %l1
	.word	0xaa26a175	! t0_kref+0x54:   	sub	%i2, 0x175, %l5
	.word	0x231c032b	! t0_kref+0x58:   	sethi	%hi(0x700cac00), %l1
	.word	0x96d03a04	! t0_kref+0x5c:   	umulcc	%g0, -0x5fc, %o3
	.word	0x81df800f	! t0_kref+0x60:   	flush	%fp + %o7
	.word	0xb7a0053b	! t0_kref+0x64:   	fsqrts	%f27, %f27
	.word	0xacdd8000	! t0_kref+0x68:   	smulcc	%l6, %g0, %l6
	.word	0xf7067fe0	! t0_kref+0x6c:   	ld	[%i1 - 0x20], %f27
	.word	0xe20e3fed	! t0_kref+0x70:   	ldub	[%i0 - 0x13], %l1
	.word	0x2327dc34	! t0_kref+0x74:   	sethi	%hi(0x9f70d000), %l1
	.word	0x9ebe8009	! t0_kref+0x78:   	xnorcc	%i2, %o1, %o7
	.word	0x36800006	! t0_kref+0x7c:   	bge,a	_kref+0x94
	.word	0x992de00b	! t0_kref+0x80:   	sll	%l7, 0xb, %o4
	.word	0xb7a0053b	! t0_kref+0x84:   	fsqrts	%f27, %f27
	.word	0x2b800006	! t0_kref+0x88:   	fbug,a	_kref+0xa0
	.word	0x9b400000	! t0_kref+0x8c:   	mov	%y, %o5
	.word	0xb7a0053b	! t0_kref+0x90:   	fsqrts	%f27, %f27
	.word	0xf5380018	! t0_kref+0x94:   	std	%f26, [%g0 + %i0]
	.word	0x23480006	! t0_kref+0x98:   	fbne,a,pt	%fcc0, _kref+0xb0
	.word	0xec08a037	! t0_kref+0x9c:   	ldub	[%g2 + 0x37], %l6
	.word	0xf53e001d	! t0_kref+0xa0:   	std	%f26, [%i0 + %i5]
	.word	0xe840a038	! t0_kref+0xa4:   	ldsw	[%g2 + 0x38], %l4
	.word	0xba103ff8	! t0_kref+0xa8:   	mov	0xfffffff8, %i5
	.word	0xda28a02a	! t0_kref+0xac:   	stb	%o5, [%g2 + 0x2a]
	.word	0xb5a6cd3b	! t0_kref+0xb0:   	fsmuld	%f27, %f27, %f26
	.word	0xa255b311	! t0_kref+0xb4:   	umul	%l6, -0xcef, %l1
	.word	0xf426401c	! t0_kref+0xb8:   	st	%i2, [%i1 + %i4]
	.word	0xb5ab405a	! t0_kref+0xbc:   	fmovdle	%fcc0, %f26, %f26
	.word	0x86102018	! t0_kref+0xc0:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0xc4:   	subcc	%g3, 1, %g3
	.word	0x2280001b	! t0_kref+0xc8:   	be,a	_kref+0x134
	.word	0xf700a004	! t0_kref+0xcc:   	ld	[%g2 + 4], %f27
	.word	0x2e800007	! t0_kref+0xd0:   	bvs,a	_kref+0xec
	.word	0xae5d0000	! t0_kref+0xd4:   	smul	%l4, %g0, %l7
	.word	0xb7a6c93b	! t0_kref+0xd8:   	fmuls	%f27, %f27, %f27
	.word	0xf700a020	! t0_kref+0xdc:   	ld	[%g2 + 0x20], %f27
	.word	0xb7a6c93b	! t0_kref+0xe0:   	fmuls	%f27, %f27, %f27
	.word	0xc807bfec	! t0_kref+0xe4:   	ld	[%fp - 0x14], %g4
	.word	0x81ae8ada	! t0_kref+0xe8:   	fcmped	%fcc0, %f26, %f26
	.word	0xb7a6c93b	! t0_kref+0xec:   	fmuls	%f27, %f27, %f27
	.word	0x81ae8ada	! t0_kref+0xf0:   	fcmped	%fcc0, %f26, %f26
	.word	0x81dd0019	! t0_kref+0xf4:   	flush	%l4 + %i1
	.word	0x9ea56c2d	! t0_kref+0xf8:   	subcc	%l5, 0xc2d, %o7
	.word	0x97400000	! t0_kref+0xfc:   	mov	%y, %o3
	.word	0x32bffff1	! t0_kref+0x100:   	bne,a	_kref+0xc4
	.word	0x8074fff7	! t0_kref+0x104:   	udiv	%l3, -0x9, %g0
	.word	0xee2e201d	! t0_kref+0x108:   	stb	%l7, [%i0 + 0x1d]
	.word	0xb5a689da	! t0_kref+0x10c:   	fdivd	%f26, %f26, %f26
	.word	0xae5a400d	! t0_kref+0x110:   	smul	%o1, %o5, %l7
	.word	0xd440a010	! t0_kref+0x114:   	ldsw	[%g2 + 0x10], %o2
	.word	0xe88e9040	! t0_kref+0x118:   	lduba	[%i2]0x82, %l4
	.word	0xb7a000bb	! t0_kref+0x11c:   	fnegs	%f27, %f27
	.word	0x81aeca3b	! t0_kref+0x120:   	fcmps	%fcc0, %f27, %f27
	.word	0xd0de1000	! t0_kref+0x124:   	ldxa	[%i0]0x80, %o0
	.word	0xe80e0000	! t0_kref+0x128:   	ldub	[%i0], %l4
	.word	0xb7a0053b	! t0_kref+0x12c:   	fsqrts	%f27, %f27
	.word	0x920b0000	! t0_kref+0x130:   	and	%o4, %g0, %o1
	.word	0x20480008	! t0_kref+0x134:   	bn,a,pt	%icc, _kref+0x154
	.word	0x9415bb17	! t0_kref+0x138:   	or	%l6, -0x4e9, %o2
	.word	0xa88cf8ea	! t0_kref+0x13c:   	andcc	%l3, -0x716, %l4
	.word	0xb5a689da	! t0_kref+0x140:   	fdivd	%f26, %f26, %f26
	.word	0xf53e6008	! t0_kref+0x144:   	std	%f26, [%i1 + 8]
	.word	0xe87e001c	! t0_kref+0x148:   	swap	[%i0 + %i4], %l4
	.word	0xb7a018da	! t0_kref+0x14c:   	fdtos	%f26, %f27
	.word	0xb7a6c8bb	! t0_kref+0x150:   	fsubs	%f27, %f27, %f27
	.word	0xae9a000a	! t0_kref+0x154:   	xorcc	%o0, %o2, %l7
	.word	0xe44e3ff5	! t0_kref+0x158:   	ldsb	[%i0 - 0xb], %l2
	.word	0xb7a0003b	! t0_kref+0x15c:   	fmovs	%f27, %f27
	call	SYM(t0_subr2)
	.word	0xb7a0053b	! t0_kref+0x164:   	fsqrts	%f27, %f27
	.word	0xb7a01a5a	! t0_kref+0x168:   	fdtoi	%f26, %f27
	.word	0x38480008	! t0_kref+0x16c:   	bgu,a,pt	%icc, _kref+0x18c
	.word	0x92b3751e	! t0_kref+0x170:   	orncc	%o5, -0xae2, %o1
	.word	0x96f5c009	! t0_kref+0x174:   	udivcc	%l7, %o1, %o3
	.word	0xb7a000bb	! t0_kref+0x178:   	fnegs	%f27, %f27
	.word	0x3c800007	! t0_kref+0x17c:   	bpos,a	_kref+0x198
	.word	0xe400a01c	! t0_kref+0x180:   	ld	[%g2 + 0x1c], %l2
	.word	0xa53a8014	! t0_kref+0x184:   	sra	%o2, %l4, %l2
	.word	0xa605000b	! t0_kref+0x188:   	add	%l4, %o3, %l3
	.word	0x9060331a	! t0_kref+0x18c:   	subc	%g0, -0xce6, %o0
	.word	0x9455000a	! t0_kref+0x190:   	umul	%l4, %o2, %o2
	.word	0xf53e7fe0	! t0_kref+0x194:   	std	%f26, [%i1 - 0x20]
	.word	0xb7a6c9bb	! t0_kref+0x198:   	fdivs	%f27, %f27, %f27
	.word	0xad32a017	! t0_kref+0x19c:   	srl	%o2, 0x17, %l6
	.word	0xd03e3ff8	! t0_kref+0x1a0:   	std	%o0, [%i0 - 8]
	.word	0x963b7053	! t0_kref+0x1a4:   	xnor	%o5, -0xfad, %o3
	.word	0xde0e6019	! t0_kref+0x1a8:   	ldub	[%i1 + 0x19], %o7
	call	SYM(t0_subr0)
	.word	0x9482000a	! t0_kref+0x1b0:   	addcc	%o0, %o2, %o2
	.word	0xaf16800a	! t0_kref+0x1b4:   	taddcctv	%i2, %o2, %l7
	.word	0x81d83e73	! t0_kref+0x1b8:   	flush	%g0 - 0x18d
	.word	0x9044c017	! t0_kref+0x1bc:   	addc	%l3, %l7, %o0
	.word	0xd03e2000	! t0_kref+0x1c0:   	std	%o0, [%i0]
	.word	0x81aeca3b	! t0_kref+0x1c4:   	fcmps	%fcc0, %f27, %f27
	.word	0x92733ea4	! t0_kref+0x1c8:   	udiv	%o4, -0x15c, %o1
	.word	0xb7a0053b	! t0_kref+0x1cc:   	fsqrts	%f27, %f27
	.word	0x9ea57912	! t0_kref+0x1d0:   	subcc	%l5, -0x6ee, %o7
	.word	0xaaaa4013	! t0_kref+0x1d4:   	andncc	%o1, %l3, %l5
	.word	0xb7a018da	! t0_kref+0x1d8:   	fdtos	%f26, %f27
	.word	0xe830a03e	! t0_kref+0x1dc:   	sth	%l4, [%g2 + 0x3e]
	.word	0x969dc014	! t0_kref+0x1e0:   	xorcc	%l7, %l4, %o3
	.word	0x29800007	! t0_kref+0x1e4:   	fbl,a	_kref+0x200
	.word	0xd810a032	! t0_kref+0x1e8:   	lduh	[%g2 + 0x32], %o4
	.word	0xd020a010	! t0_kref+0x1ec:   	st	%o0, [%g2 + 0x10]
	.word	0x32800004	! t0_kref+0x1f0:   	bne,a	_kref+0x200
	.word	0xac62000b	! t0_kref+0x1f4:   	subc	%o0, %o3, %l6
	.word	0x95352007	! t0_kref+0x1f8:   	srl	%l4, 0x7, %o2
	.word	0xb7a01a5a	! t0_kref+0x1fc:   	fdtoi	%f26, %f27
	.word	0xd600a03c	! t0_kref+0x200:   	ld	[%g2 + 0x3c], %o3
	.word	0x9b15e05b	! t0_kref+0x204:   	taddcctv	%l7, 0x5b, %o5
	.word	0xd068a024	! t0_kref+0x208:   	ldstub	[%g2 + 0x24], %o0
	.word	0xaa3a7557	! t0_kref+0x20c:   	xnor	%o1, -0xaa9, %l5
	.word	0xb7a0189b	! t0_kref+0x210:   	fitos	%f27, %f27
	.word	0xf706401c	! t0_kref+0x214:   	ld	[%i1 + %i4], %f27
	.word	0xe47e3fe0	! t0_kref+0x218:   	swap	[%i0 - 0x20], %l2
	.word	0x81ae8a5a	! t0_kref+0x21c:   	fcmpd	%fcc0, %f26, %f26
	.word	0xb5a688da	! t0_kref+0x220:   	fsubd	%f26, %f26, %f26
	.word	0xacd5b11e	! t0_kref+0x224:   	umulcc	%l6, -0xee2, %l6
	.word	0xf53f4019	! t0_kref+0x228:   	std	%f26, [%i5 + %i1]
	.word	0xea50a03e	! t0_kref+0x22c:   	ldsh	[%g2 + 0x3e], %l5
	.word	0x9ea27365	! t0_kref+0x230:   	subcc	%o1, -0xc9b, %o7
	.word	0xa6ba000b	! t0_kref+0x234:   	xnorcc	%o0, %o3, %l3
	.word	0xf706601c	! t0_kref+0x238:   	ld	[%i1 + 0x1c], %f27
	.word	0x81ae8ada	! t0_kref+0x23c:   	fcmped	%fcc0, %f26, %f26
	.word	0x9834c009	! t0_kref+0x240:   	orn	%l3, %o1, %o4
	.word	0x8135800a	! t0_kref+0x244:   	srl	%l6, %o2, %g0
	.word	0xb7a000bb	! t0_kref+0x248:   	fnegs	%f27, %f27
	.word	0x9b320015	! t0_kref+0x24c:   	srl	%o0, %l5, %o5
	.word	0xa8b20009	! t0_kref+0x250:   	orncc	%o0, %o1, %l4
	.word	0xac822017	! t0_kref+0x254:   	addcc	%o0, 0x17, %l6
	.word	0x3a800001	! t0_kref+0x258:   	bcc,a	_kref+0x25c
	.word	0xf1be580a	! t0_kref+0x25c:   	stda	%f24, [%i1 + %o2]0xc0
	.word	0xf51e6010	! t0_kref+0x260:   	ldd	[%i1 + 0x10], %f26
	.word	0xf7067ff0	! t0_kref+0x264:   	ld	[%i1 - 0x10], %f27
	.word	0x22480002	! t0_kref+0x268:   	be,a,pt	%icc, _kref+0x270
	.word	0xb7a018da	! t0_kref+0x26c:   	fdtos	%f26, %f27
	.word	0x3c480001	! t0_kref+0x270:   	bpos,a,pt	%icc, _kref+0x274
	.word	0xb7a6c93b	! t0_kref+0x274:   	fmuls	%f27, %f27, %f27
	.word	0xa8d54000	! t0_kref+0x278:   	umulcc	%l5, %g0, %l4
	.word	0xaaf2c015	! t0_kref+0x27c:   	udivcc	%o3, %l5, %l5
	.word	0x9e434016	! t0_kref+0x280:   	addc	%o5, %l6, %o7
	.word	0xec080019	! t0_kref+0x284:   	ldub	[%g0 + %i1], %l6
	.word	0xd03e7fe8	! t0_kref+0x288:   	std	%o0, [%i1 - 0x18]
	.word	0xb5a6895a	! t0_kref+0x28c:   	fmuld	%f26, %f26, %f26
	.word	0x90d5c000	! t0_kref+0x290:   	umulcc	%l7, %g0, %o0
	.word	0xf59f5059	! t0_kref+0x294:   	ldda	[%i5 + %i1]0x82, %f26
	.word	0x933b400c	! t0_kref+0x298:   	sra	%o5, %o4, %o1
	.word	0xda20a030	! t0_kref+0x29c:   	st	%o5, [%g2 + 0x30]
	.word	0xf51e3fe8	! t0_kref+0x2a0:   	ldd	[%i0 - 0x18], %f26
	.word	0x9eaa800b	! t0_kref+0x2a4:   	andncc	%o2, %o3, %o7
	.word	0xee16c019	! t0_kref+0x2a8:   	lduh	[%i3 + %i1], %l7
	.word	0xa305800c	! t0_kref+0x2ac:   	taddcc	%l6, %o4, %l1
	.word	0x81aeca3b	! t0_kref+0x2b0:   	fcmps	%fcc0, %f27, %f27
	.word	0xb7a000bb	! t0_kref+0x2b4:   	fnegs	%f27, %f27
	.word	0xd430a002	! t0_kref+0x2b8:   	sth	%o2, [%g2 + 2]
	.word	0xf720a00c	! t0_kref+0x2bc:   	st	%f27, [%g2 + 0xc]
	.word	0x80b57d34	! t0_kref+0x2c0:   	orncc	%l5, -0x2cc, %g0
	.word	0xe968a04d	! t0_kref+0x2c4:   	prefetch	%g2 + 0x4d, 20
	.word	0x36800001	! t0_kref+0x2c8:   	bge,a	_kref+0x2cc
	.word	0xec7f0019	! t0_kref+0x2cc:   	swap	[%i4 + %i1], %l6
	.word	0xf51e3ff8	! t0_kref+0x2d0:   	ldd	[%i0 - 8], %f26
	.word	0x9b400000	! t0_kref+0x2d4:   	mov	%y, %o5
	.word	0x81aecabb	! t0_kref+0x2d8:   	fcmpes	%fcc0, %f27, %f27
	.word	0xec40a014	! t0_kref+0x2dc:   	ldsw	[%g2 + 0x14], %l6
	.word	0xf700a000	! t0_kref+0x2e0:   	ld	[%g2], %f27
	.word	0xb5a6895a	! t0_kref+0x2e4:   	fmuld	%f26, %f26, %f26
	.word	0x28800008	! t0_kref+0x2e8:   	bleu,a	_kref+0x308
	.word	0xb7ab003b	! t0_kref+0x2ec:   	fmovsuge	%fcc0, %f27, %f27
	.word	0x9eb30017	! t0_kref+0x2f0:   	orncc	%o4, %l7, %o7
	.word	0x3a480007	! t0_kref+0x2f4:   	bcc,a,pt	%icc, _kref+0x310
	.word	0x90a56c5a	! t0_kref+0x2f8:   	subcc	%l5, 0xc5a, %o0
	.word	0xf700a008	! t0_kref+0x2fc:   	ld	[%g2 + 8], %f27
	.word	0xb7a01a3b	! t0_kref+0x300:   	fstoi	%f27, %f27
	.word	0xb7a6c93b	! t0_kref+0x304:   	fmuls	%f27, %f27, %f27
	.word	0xb7a0189b	! t0_kref+0x308:   	fitos	%f27, %f27
	.word	0x80bcfe20	! t0_kref+0x30c:   	xnorcc	%l3, -0x1e0, %g0
	.word	0xd2f81018	! t0_kref+0x310:   	swapa	[%g0 + %i0]0x80, %o1
	.word	0xb7a6c9bb	! t0_kref+0x314:   	fdivs	%f27, %f27, %f27
	.word	0xad3d201b	! t0_kref+0x318:   	sra	%l4, 0x1b, %l6
	.word	0xd808a009	! t0_kref+0x31c:   	ldub	[%g2 + 9], %o4
	.word	0x81580000	! t0_kref+0x320:   	flushw
	.word	0xd240a030	! t0_kref+0x324:   	ldsw	[%g2 + 0x30], %o1
	.word	0xb7a6c83b	! t0_kref+0x328:   	fadds	%f27, %f27, %f27
	.word	0x949a8016	! t0_kref+0x32c:   	xorcc	%o2, %l6, %o2
	.word	0xb6102008	! t0_kref+0x330:   	mov	0x8, %i3
	.word	0x953a6005	! t0_kref+0x334:   	sra	%o1, 0x5, %o2
	.word	0xeefe501c	! t0_kref+0x338:   	swapa	[%i1 + %i4]0x80, %l7
	.word	0x9abe8017	! t0_kref+0x33c:   	xnorcc	%i2, %l7, %o5
	.word	0xf53e6008	! t0_kref+0x340:   	std	%f26, [%i1 + 8]
	.word	0x81ae8a5a	! t0_kref+0x344:   	fcmpd	%fcc0, %f26, %f26
	.word	0xf7063fec	! t0_kref+0x348:   	ld	[%i0 - 0x14], %f27
	.word	0xa3400000	! t0_kref+0x34c:   	mov	%y, %l1
	.word	0xf59e5000	! t0_kref+0x350:   	ldda	[%i1]0x80, %f26
	.word	0xec6e2012	! t0_kref+0x354:   	ldstub	[%i0 + 0x12], %l6
	.word	0xc56e7ff0	! t0_kref+0x358:   	prefetch	%i1 - 0x10, 2
	.word	0xee30a018	! t0_kref+0x35c:   	sth	%l7, [%g2 + 0x18]
	.word	0xea50a010	! t0_kref+0x360:   	ldsh	[%g2 + 0x10], %l5
	.word	0xb7a01a5a	! t0_kref+0x364:   	fdtoi	%f26, %f27
	.word	0x9214e989	! t0_kref+0x368:   	or	%l3, 0x989, %o1
	.word	0xd448a006	! t0_kref+0x36c:   	ldsb	[%g2 + 6], %o2
	.word	0xa2400015	! t0_kref+0x370:   	addc	%g0, %l5, %l1
	.word	0xda463fe8	! t0_kref+0x374:   	ldsw	[%i0 - 0x18], %o5
	.word	0xf700a01c	! t0_kref+0x378:   	ld	[%g2 + 0x1c], %f27
	.word	0x28800008	! t0_kref+0x37c:   	bleu,a	_kref+0x39c
	.word	0xda00a03c	! t0_kref+0x380:   	ld	[%g2 + 0x3c], %o5
	call	SYM(t0_subr3)
	.word	0xea7e600c	! t0_kref+0x388:   	swap	[%i1 + 0xc], %l5
	.word	0x9846800d	! t0_kref+0x38c:   	addc	%i2, %o5, %o4
	.word	0xae6568ed	! t0_kref+0x390:   	subc	%l5, 0x8ed, %l7
	.word	0xa6adaf0b	! t0_kref+0x394:   	andncc	%l6, 0xf0b, %l3
	.word	0xa6a27505	! t0_kref+0x398:   	subcc	%o1, -0xafb, %l3
	.word	0xf726001c	! t0_kref+0x39c:   	st	%f27, [%i0 + %i4]
	sethi	%hi(2f), %o7
	.word	0xe40be3ec	! t0_kref+0x3a4:   	ldub	[%o7 + 0x3ec], %l2
	.word	0xa41ca00c	! t0_kref+0x3a8:   	xor	%l2, 0xc, %l2
	.word	0xe42be3ec	! t0_kref+0x3ac:   	stb	%l2, [%o7 + 0x3ec]
	.word	0x81dbe3ec	! t0_kref+0x3b0:   	flush	%o7 + 0x3ec
	.word	0xb7a0013b	! t0_kref+0x3b4:   	fabss	%f27, %f27
	.word	0xb7a0003b	! t0_kref+0x3b8:   	fmovs	%f27, %f27
	.word	0xd09e101d	! t0_kref+0x3bc:   	ldda	[%i0 + %i5]0x80, %o0
	.word	0xc048a034	! t0_kref+0x3c0:   	ldsb	[%g2 + 0x34], %g0
	.word	0x33800008	! t0_kref+0x3c4:   	fbe,a	_kref+0x3e4
	.word	0xb7a000bb	! t0_kref+0x3c8:   	fnegs	%f27, %f27
	.word	0xb7a018da	! t0_kref+0x3cc:   	fdtos	%f26, %f27
	.word	0x9eddc00b	! t0_kref+0x3d0:   	smulcc	%l7, %o3, %o7
	.word	0xec2e7ff2	! t0_kref+0x3d4:   	stb	%l6, [%i1 - 0xe]
	.word	0xf53e3fe8	! t0_kref+0x3d8:   	std	%f26, [%i0 - 0x18]
	.word	0x32800006	! t0_kref+0x3dc:   	bne,a	_kref+0x3f4
	.word	0xb5a6895a	! t0_kref+0x3e0:   	fmuld	%f26, %f26, %f26
	.word	0xb5a689da	! t0_kref+0x3e4:   	fdivd	%f26, %f26, %f26
	.word	0xb5a688da	! t0_kref+0x3e8:   	fsubd	%f26, %f26, %f26
2:	.word	0xb7a01a5a	! t0_kref+0x3ec:   	fdtoi	%f26, %f27
	.word	0xac52bd97	! t0_kref+0x3f0:   	umul	%o2, -0x269, %l6
	.word	0xd6d6101b	! t0_kref+0x3f4:   	ldsha	[%i0 + %i3]0x80, %o3
	.word	0x38800001	! t0_kref+0x3f8:   	bgu,a	_kref+0x3fc
	.word	0xa20cf097	! t0_kref+0x3fc:   	and	%l3, -0xf69, %l1
	.word	0xda56001b	! t0_kref+0x400:   	ldsh	[%i0 + %i3], %o5
	.word	0xb5a6885a	! t0_kref+0x404:   	faddd	%f26, %f26, %f26
	.word	0xb5a688da	! t0_kref+0x408:   	fsubd	%f26, %f26, %f26
	.word	0x81dd23e8	! t0_kref+0x40c:   	flush	%l4 + 0x3e8
	.word	0xb7a01a3b	! t0_kref+0x410:   	fstoi	%f27, %f27
	.word	0xb5a6cd3b	! t0_kref+0x414:   	fsmuld	%f27, %f27, %f26
	.word	0xc1ee1013	! t0_kref+0x418:   	prefetcha	%i0 + %l3, 0
	.word	0xe87f0019	! t0_kref+0x41c:   	swap	[%i4 + %i1], %l4
	.word	0xb5a0193b	! t0_kref+0x420:   	fstod	%f27, %f26
	.word	0xb7a0013b	! t0_kref+0x424:   	fabss	%f27, %f27
	.word	0x98424015	! t0_kref+0x428:   	addc	%o1, %l5, %o4
	.word	0xa852c000	! t0_kref+0x42c:   	umul	%o3, %g0, %l4
	.word	0x98832f84	! t0_kref+0x430:   	addcc	%o4, 0xf84, %o4
	.word	0x2d800006	! t0_kref+0x434:   	fbg,a	_kref+0x44c
	.word	0xb5a6cd3b	! t0_kref+0x438:   	fsmuld	%f27, %f27, %f26
	.word	0xaa3a4014	! t0_kref+0x43c:   	xnor	%o1, %l4, %l5
	.word	0xd228a005	! t0_kref+0x440:   	stb	%o1, [%g2 + 5]
	.word	0x90bdf868	! t0_kref+0x444:   	xnorcc	%l7, -0x798, %o0
	.word	0xa2037467	! t0_kref+0x448:   	add	%o5, -0xb99, %l1
	.word	0xa2ba8009	! t0_kref+0x44c:   	xnorcc	%o2, %o1, %l1
	.word	0x23800002	! t0_kref+0x450:   	fbne,a	_kref+0x458
	.word	0x2f025e07	! t0_kref+0x454:   	sethi	%hi(0x9781c00), %l7
	.word	0x9abe800c	! t0_kref+0x458:   	xnorcc	%i2, %o4, %o5
	.word	0xc36e0000	! t0_kref+0x45c:   	prefetch	%i0, 1
	.word	0xe44e4000	! t0_kref+0x460:   	ldsb	[%i1], %l2
	.word	0xa6feb856	! t0_kref+0x464:   	sdivcc	%i2, -0x7aa, %l3
	.word	0xd0163ffe	! t0_kref+0x468:   	lduh	[%i0 - 2], %o0
	.word	0xf720a01c	! t0_kref+0x46c:   	st	%f27, [%g2 + 0x1c]
	.word	0x24800005	! t0_kref+0x470:   	ble,a	_kref+0x484
	.word	0x8143c000	! t0_kref+0x474:   	stbar
	.word	0xf720a020	! t0_kref+0x478:   	st	%f27, [%g2 + 0x20]
	.word	0xb7a6c9bb	! t0_kref+0x47c:   	fdivs	%f27, %f27, %f27
	.word	0xa2e30009	! t0_kref+0x480:   	subccc	%o4, %o1, %l1
	.word	0xda4e600c	! t0_kref+0x484:   	ldsb	[%i1 + 0xc], %o5
	.word	0xb7a0003b	! t0_kref+0x488:   	fmovs	%f27, %f27
	.word	0xd40e7ff7	! t0_kref+0x48c:   	ldub	[%i1 - 9], %o2
	.word	0x80f2aadb	! t0_kref+0x490:   	udivcc	%o2, 0xadb, %g0
	.word	0xb7a01a3b	! t0_kref+0x494:   	fstoi	%f27, %f27
	.word	0x9fc10000	! t0_kref+0x498:   	call	%g4
	.word	0xa93a6005	! t0_kref+0x49c:   	sra	%o1, 0x5, %l4
	.word	0xb7a01a3b	! t0_kref+0x4a0:   	fstoi	%f27, %f27
	.word	0xaa2e800d	! t0_kref+0x4a4:   	andn	%i2, %o5, %l5
	.word	0xc568a006	! t0_kref+0x4a8:   	prefetch	%g2 + 6, 2
	.word	0x94dd6736	! t0_kref+0x4ac:   	smulcc	%l5, 0x736, %o2
	.word	0x110b113a	! t0_kref+0x4b0:   	sethi	%hi(0x2c44e800), %o0
	.word	0x9b400000	! t0_kref+0x4b4:   	mov	%y, %o5
	.word	0xa8068017	! t0_kref+0x4b8:   	add	%i2, %l7, %l4
	.word	0xaa320008	! t0_kref+0x4bc:   	orn	%o0, %o0, %l5
	.word	0x80334008	! t0_kref+0x4c0:   	orn	%o5, %o0, %g0
	.word	0xb7a0189b	! t0_kref+0x4c4:   	fitos	%f27, %f27
	.word	0x9675f610	! t0_kref+0x4c8:   	udiv	%l7, -0x9f0, %o3
	.word	0xd0262018	! t0_kref+0x4cc:   	st	%o0, [%i0 + 0x18]
	.word	0xe96e401b	! t0_kref+0x4d0:   	prefetch	%i1 + %i3, 20
	.word	0xaf03000b	! t0_kref+0x4d4:   	taddcc	%o4, %o3, %l7
	.word	0x92bd8013	! t0_kref+0x4d8:   	xnorcc	%l6, %l3, %o1
	.word	0xf726001c	! t0_kref+0x4dc:   	st	%f27, [%i0 + %i4]
	.word	0x001fffff	! t0_kref+0x4e0:   	illtrap	0x1fffff
	.word	0x31800005	! t0_kref+0x4e4:   	fba,a	_kref+0x4f8
	.word	0xd43e001d	! t0_kref+0x4e8:   	std	%o2, [%i0 + %i5]
	.word	0xb7a6c9bb	! t0_kref+0x4ec:   	fdivs	%f27, %f27, %f27
	.word	0xf51e4000	! t0_kref+0x4f0:   	ldd	[%i1], %f26
	.word	0xe8200019	! t0_kref+0x4f4:   	st	%l4, [%g0 + %i1]
	.word	0x9a334013	! t0_kref+0x4f8:   	orn	%o5, %l3, %o5
	.word	0x90723157	! t0_kref+0x4fc:   	udiv	%o0, -0xea9, %o0
	.word	0xc0f6501d	! t0_kref+0x500:   	stxa	%g0, [%i1 + %i5]0x80
	.word	0xc04e601a	! t0_kref+0x504:   	ldsb	[%i1 + 0x1a], %g0
	.word	0xb7a01a5a	! t0_kref+0x508:   	fdtoi	%f26, %f27
	.word	0xee48a015	! t0_kref+0x50c:   	ldsb	[%g2 + 0x15], %l7
	.word	0x9902800c	! t0_kref+0x510:   	taddcc	%o2, %o4, %o4
	.word	0x8143c000	! t0_kref+0x514:   	stbar
	.word	0xec6e001a	! t0_kref+0x518:   	ldstub	[%i0 + %i2], %l6
	.word	0x96582326	! t0_kref+0x51c:   	smul	%g0, 0x326, %o3
	.word	0xf7262014	! t0_kref+0x520:   	st	%f27, [%i0 + 0x14]
	.word	0x2c480004	! t0_kref+0x524:   	bneg,a,pt	%icc, _kref+0x534
	.word	0xf53e401d	! t0_kref+0x528:   	std	%f26, [%i1 + %i5]
	.word	0x9a92401a	! t0_kref+0x52c:   	orcc	%o1, %i2, %o5
	.word	0xee067ff4	! t0_kref+0x530:   	ld	[%i1 - 0xc], %l7
	.word	0x9a0b6c31	! t0_kref+0x534:   	and	%o5, 0xc31, %o5
	.word	0xaa82c00a	! t0_kref+0x538:   	addcc	%o3, %o2, %l5
	.word	0xe456201e	! t0_kref+0x53c:   	ldsh	[%i0 + 0x1e], %l2
	.word	0x20480007	! t0_kref+0x540:   	bn,a,pt	%icc, _kref+0x55c
	.word	0xc12e401c	! t0_kref+0x544:   	st	%fsr, [%i1 + %i4]
	.word	0xd20e7ff2	! t0_kref+0x548:   	ldub	[%i1 - 0xe], %o1
	.word	0xd9f6100d	! t0_kref+0x54c:   	casxa	[%i0]0x80, %o5, %o4
	.word	0x9080000d	! t0_kref+0x550:   	addcc	%g0, %o5, %o0
	.word	0x9a4277fd	! t0_kref+0x554:   	addc	%o1, -0x803, %o5
	.word	0xb7abc03b	! t0_kref+0x558:   	fmovso	%fcc0, %f27, %f27
	.word	0x9eb5ac75	! t0_kref+0x55c:   	orncc	%l6, 0xc75, %o7
	.word	0x9698294a	! t0_kref+0x560:   	xorcc	%g0, 0x94a, %o3
	.word	0x9433000d	! t0_kref+0x564:   	orn	%o4, %o5, %o2
	.word	0xb7a0189b	! t0_kref+0x568:   	fitos	%f27, %f27
	.word	0xa8d3001a	! t0_kref+0x56c:   	umulcc	%o4, %i2, %l4
	.word	0xac63221f	! t0_kref+0x570:   	subc	%o4, 0x21f, %l6
	.word	0x28800001	! t0_kref+0x574:   	bleu,a	_kref+0x578
	.word	0xb5ab805a	! t0_kref+0x578:   	fmovdule	%fcc0, %f26, %f26
	.word	0xb7a0053b	! t0_kref+0x57c:   	fsqrts	%f27, %f27
	.word	0xaaada88a	! t0_kref+0x580:   	andncc	%l6, 0x88a, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be1c0	! t0_kref+0x588:   	ldub	[%o7 + 0x1c0], %l2
	.word	0xa41ca00c	! t0_kref+0x58c:   	xor	%l2, 0xc, %l2
	.word	0xe42be1c0	! t0_kref+0x590:   	stb	%l2, [%o7 + 0x1c0]
	.word	0x81dbe1c0	! t0_kref+0x594:   	flush	%o7 + 0x1c0
	.word	0xb7a000bb	! t0_kref+0x598:   	fnegs	%f27, %f27
	.word	0xec0e001a	! t0_kref+0x59c:   	ldub	[%i0 + %i2], %l6
	.word	0xd410a012	! t0_kref+0x5a0:   	lduh	[%g2 + 0x12], %o2
	.word	0xb5a688da	! t0_kref+0x5a4:   	fsubd	%f26, %f26, %f26
	.word	0x98558009	! t0_kref+0x5a8:   	umul	%l6, %o1, %o4
	.word	0xa53b2008	! t0_kref+0x5ac:   	sra	%o4, 0x8, %l2
	.word	0xb7a0189b	! t0_kref+0x5b0:   	fitos	%f27, %f27
	.word	0xb7a6c93b	! t0_kref+0x5b4:   	fmuls	%f27, %f27, %f27
	.word	0xa65a7e9e	! t0_kref+0x5b8:   	smul	%o1, -0x162, %l3
	.word	0x2d800004	! t0_kref+0x5bc:   	fbg,a	_kref+0x5cc
2:	.word	0xea564000	! t0_kref+0x5c0:   	ldsh	[%i1], %l5
	.word	0x39800005	! t0_kref+0x5c4:   	fbuge,a	_kref+0x5d8
	.word	0x980d4017	! t0_kref+0x5c8:   	and	%l5, %l7, %o4
	.word	0xb7a6c93b	! t0_kref+0x5cc:   	fmuls	%f27, %f27, %f27
	call	SYM(t0_subr1)
	.word	0xa53d000b	! t0_kref+0x5d4:   	sra	%l4, %o3, %l2
	.word	0x92526e33	! t0_kref+0x5d8:   	umul	%o1, 0xe33, %o1
	.word	0xb7a6c9bb	! t0_kref+0x5dc:   	fdivs	%f27, %f27, %f27
	.word	0xd010a030	! t0_kref+0x5e0:   	lduh	[%g2 + 0x30], %o0
	call	SYM(t0_subr0)
	.word	0xf51e401d	! t0_kref+0x5e8:   	ldd	[%i1 + %i5], %f26
	.word	0xa66375d2	! t0_kref+0x5ec:   	subc	%o5, -0xa2e, %l3
	.word	0xe62e4000	! t0_kref+0x5f0:   	stb	%l3, [%i1]
	.word	0x24800005	! t0_kref+0x5f4:   	ble,a	_kref+0x608
	.word	0x969b67d3	! t0_kref+0x5f8:   	xorcc	%o5, 0x7d3, %o3
	.word	0xd43e0000	! t0_kref+0x5fc:   	std	%o2, [%i0]
	.word	0xd01e401d	! t0_kref+0x600:   	ldd	[%i1 + %i5], %o0
	.word	0xf7066000	! t0_kref+0x604:   	ld	[%i1], %f27
	.word	0xe24e3fe6	! t0_kref+0x608:   	ldsb	[%i0 - 0x1a], %l1
	.word	0xfb6e7ff8	! t0_kref+0x60c:   	prefetch	%i1 - 8, 29
	.word	0xb6103ff2	! t0_kref+0x610:   	mov	0xfffffff2, %i3
	.word	0xa48db45f	! t0_kref+0x614:   	andcc	%l6, -0xba1, %l2
	.word	0xaca03a61	! t0_kref+0x618:   	subcc	%g0, -0x59f, %l6
	.word	0xf7067ffc	! t0_kref+0x61c:   	ld	[%i1 - 4], %f27
	.word	0xae52000c	! t0_kref+0x620:   	umul	%o0, %o4, %l7
	.word	0x943e800b	! t0_kref+0x624:   	xnor	%i2, %o3, %o2
	.word	0xd4563fe0	! t0_kref+0x628:   	ldsh	[%i0 - 0x20], %o2
	.word	0xb7a0053b	! t0_kref+0x62c:   	fsqrts	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x630:   	fitos	%f27, %f27
	.word	0x9de3bfa0	! t0_kref+0x634:   	save	%sp, -0x60, %sp
	.word	0x9bee316c	! t0_kref+0x638:   	restore	%i0, -0xe94, %o5
	.word	0x27480008	! t0_kref+0x63c:   	fbul,a,pt	%fcc0, _kref+0x65c
	.word	0xb7a018da	! t0_kref+0x640:   	fdtos	%f26, %f27
	.word	0xab34c013	! t0_kref+0x644:   	srl	%l3, %l3, %l5
	.word	0xa29b4013	! t0_kref+0x648:   	xorcc	%o5, %l3, %l1
	.word	0xe27e600c	! t0_kref+0x64c:   	swap	[%i1 + 0xc], %l1
	.word	0xae46b8e5	! t0_kref+0x650:   	addc	%i2, -0x71b, %l7
	.word	0xb7a0189b	! t0_kref+0x654:   	fitos	%f27, %f27
	.word	0xee20a034	! t0_kref+0x658:   	st	%l7, [%g2 + 0x34]
	.word	0x9a0df0cc	! t0_kref+0x65c:   	and	%l7, -0xf34, %o5
	.word	0x983dae53	! t0_kref+0x660:   	xnor	%l6, 0xe53, %o4
	.word	0xf700a028	! t0_kref+0x664:   	ld	[%g2 + 0x28], %f27
	.word	0xee00a020	! t0_kref+0x668:   	ld	[%g2 + 0x20], %l7
	.word	0xb7a0053b	! t0_kref+0x66c:   	fsqrts	%f27, %f27
	.word	0xaab02e7a	! t0_kref+0x670:   	orncc	%g0, 0xe7a, %l5
	.word	0xaaaa4016	! t0_kref+0x674:   	andncc	%o1, %l6, %l5
	.word	0x94f58008	! t0_kref+0x678:   	udivcc	%l6, %o0, %o2
	.word	0xb5a688da	! t0_kref+0x67c:   	fsubd	%f26, %f26, %f26
	.word	0xfd6e6018	! t0_kref+0x680:   	prefetch	%i1 + 0x18, 30
	.word	0x9a16b98d	! t0_kref+0x684:   	or	%i2, -0x673, %o5
	.word	0xb7a018da	! t0_kref+0x688:   	fdtos	%f26, %f27
	.word	0x2e480001	! t0_kref+0x68c:   	bvs,a,pt	%icc, _kref+0x690
	.word	0xb7a6c9bb	! t0_kref+0x690:   	fdivs	%f27, %f27, %f27
	.word	0xb7a6c8bb	! t0_kref+0x694:   	fsubs	%f27, %f27, %f27
	.word	0xa3150008	! t0_kref+0x698:   	taddcctv	%l4, %o0, %l1
	.word	0xd5f6500a	! t0_kref+0x69c:   	casxa	[%i1]0x80, %o2, %o2
	.word	0xea28a02f	! t0_kref+0x6a0:   	stb	%l5, [%g2 + 0x2f]
	.word	0x9252001a	! t0_kref+0x6a4:   	umul	%o0, %i2, %o1
	.word	0xa40b6a0d	! t0_kref+0x6a8:   	and	%o5, 0xa0d, %l2
	.word	0xf700a01c	! t0_kref+0x6ac:   	ld	[%g2 + 0x1c], %f27
	.word	0xb7a0053b	! t0_kref+0x6b0:   	fsqrts	%f27, %f27
	.word	0x81aecabb	! t0_kref+0x6b4:   	fcmpes	%fcc0, %f27, %f27
	.word	0x92300009	! t0_kref+0x6b8:   	orn	%g0, %o1, %o1
	.word	0xb7a0053b	! t0_kref+0x6bc:   	fsqrts	%f27, %f27
	.word	0x9aa83464	! t0_kref+0x6c0:   	andncc	%g0, -0xb9c, %o5
	.word	0x9483759b	! t0_kref+0x6c4:   	addcc	%o5, -0xa65, %o2
	.word	0x81dbc01e	! t0_kref+0x6c8:   	flush	%o7 + %fp
	.word	0xaab2400c	! t0_kref+0x6cc:   	orncc	%o1, %o4, %l5
	.word	0xae150014	! t0_kref+0x6d0:   	or	%l4, %l4, %l7
	.word	0xee28a004	! t0_kref+0x6d4:   	stb	%l7, [%g2 + 4]
	.word	0x3f800008	! t0_kref+0x6d8:   	fbo,a	_kref+0x6f8
	.word	0xea10a014	! t0_kref+0x6dc:   	lduh	[%g2 + 0x14], %l5
	.word	0xa89a726e	! t0_kref+0x6e0:   	xorcc	%o1, -0xd92, %l4
	.word	0xd64e6018	! t0_kref+0x6e4:   	ldsb	[%i1 + 0x18], %o3
	.word	0xb7a0003b	! t0_kref+0x6e8:   	fmovs	%f27, %f27
	.word	0xc0fe101c	! t0_kref+0x6ec:   	swapa	[%i0 + %i4]0x80, %g0
	.word	0x81ae8a5a	! t0_kref+0x6f0:   	fcmpd	%fcc0, %f26, %f26
	.word	0xb7a6c8bb	! t0_kref+0x6f4:   	fsubs	%f27, %f27, %f27
	.word	0xf36e6008	! t0_kref+0x6f8:   	prefetch	%i1 + 8, 25
	.word	0x80d5f94a	! t0_kref+0x6fc:   	umulcc	%l7, -0x6b6, %g0
	.word	0x3c800007	! t0_kref+0x700:   	bpos,a	_kref+0x71c
	.word	0xd0200018	! t0_kref+0x704:   	st	%o0, [%g0 + %i0]
	.word	0xa6323057	! t0_kref+0x708:   	orn	%o0, -0xfa9, %l3
	.word	0x32800003	! t0_kref+0x70c:   	bne,a	_kref+0x718
	.word	0xf51f4019	! t0_kref+0x710:   	ldd	[%i5 + %i1], %f26
	.word	0xb7a0003b	! t0_kref+0x714:   	fmovs	%f27, %f27
	.word	0xae120015	! t0_kref+0x718:   	or	%o0, %l5, %l7
	.word	0xe400a014	! t0_kref+0x71c:   	ld	[%g2 + 0x14], %l2
	.word	0xab35a00a	! t0_kref+0x720:   	srl	%l6, 0xa, %l5
	.word	0xa6f34017	! t0_kref+0x724:   	udivcc	%o5, %l7, %l3
	.word	0xd0871019	! t0_kref+0x728:   	lda	[%i4 + %i1]0x80, %o0
	.word	0x81ae8a5a	! t0_kref+0x72c:   	fcmpd	%fcc0, %f26, %f26
	.word	0x9b04c017	! t0_kref+0x730:   	taddcc	%l3, %l7, %o5
	.word	0xda20a014	! t0_kref+0x734:   	st	%o5, [%g2 + 0x14]
	.word	0x8012c017	! t0_kref+0x738:   	or	%o3, %l7, %g0
	.word	0xb7a0189b	! t0_kref+0x73c:   	fitos	%f27, %f27
	.word	0x83c07e94	! t0_kref+0x740:   	jmpl	%g1 - 0x16c, %g1
	.word	0xd036401b	! t0_kref+0x744:   	sth	%o0, [%i1 + %i3]
	.word	0xd43e7ff0	! t0_kref+0x748:   	std	%o2, [%i1 - 0x10]
	.word	0x9e2b0009	! t0_kref+0x74c:   	andn	%o4, %o1, %o7
	.word	0x81ae8a5a	! t0_kref+0x750:   	fcmpd	%fcc0, %f26, %f26
	.word	0xb7a6c83b	! t0_kref+0x754:   	fadds	%f27, %f27, %f27
	.word	0xf19f5a58	! t0_kref+0x758:   	ldda	[%i5 + %i0]0xd2, %f24
	.word	0xb7a6c93b	! t0_kref+0x75c:   	fmuls	%f27, %f27, %f27
	.word	0x8143c000	! t0_kref+0x760:   	stbar
	.word	0xc04e200e	! t0_kref+0x764:   	ldsb	[%i0 + 0xe], %g0
	.word	0xe808a003	! t0_kref+0x768:   	ldub	[%g2 + 3], %l4
	.word	0x9022400a	! t0_kref+0x76c:   	sub	%o1, %o2, %o0
	.word	0xd428a024	! t0_kref+0x770:   	stb	%o2, [%g2 + 0x24]
	.word	0x81de0009	! t0_kref+0x774:   	flush	%i0 + %o1
	.word	0xa4fb0015	! t0_kref+0x778:   	sdivcc	%o4, %l5, %l2
	.word	0x983a8015	! t0_kref+0x77c:   	xnor	%o2, %l5, %o4
	.word	0xf51e7ff0	! t0_kref+0x780:   	ldd	[%i1 - 0x10], %f26
	.word	0xe2d6d018	! t0_kref+0x784:   	ldsha	[%i3 + %i0]0x80, %l1
	.word	0xe620a014	! t0_kref+0x788:   	st	%l3, [%g2 + 0x14]
	.word	0x9a83001a	! t0_kref+0x78c:   	addcc	%o4, %i2, %o5
	.word	0xee270018	! t0_kref+0x790:   	st	%l7, [%i4 + %i0]
	.word	0x81ae8a5a	! t0_kref+0x794:   	fcmpd	%fcc0, %f26, %f26
	.word	0xe44e6001	! t0_kref+0x798:   	ldsb	[%i1 + 1], %l2
	.word	0xa65df5e1	! t0_kref+0x79c:   	smul	%l7, -0xa1f, %l3
	.word	0x85828008	! t0_kref+0x7a0:   	wr	%o2, %o0, %ccr
	.word	0xd630a024	! t0_kref+0x7a4:   	sth	%o3, [%g2 + 0x24]
	.word	0x24800006	! t0_kref+0x7a8:   	ble,a	_kref+0x7c0
	.word	0xac95c00c	! t0_kref+0x7ac:   	orcc	%l7, %o4, %l6
	.word	0xb7a0189b	! t0_kref+0x7b0:   	fitos	%f27, %f27
	.word	0xb7a000bb	! t0_kref+0x7b4:   	fnegs	%f27, %f27
	.word	0xf720a00c	! t0_kref+0x7b8:   	st	%f27, [%g2 + 0xc]
	.word	0xf19e2010	! t0_kref+0x7bc:   	ldda	[%i0 + 0x10]%asi, %f24
	.word	0xc12e600c	! t0_kref+0x7c0:   	st	%fsr, [%i1 + 0xc]
	call	SYM(t0_subr3)
	.word	0x9252c00d	! t0_kref+0x7c8:   	umul	%o3, %o5, %o1
	.word	0xb7a0189b	! t0_kref+0x7cc:   	fitos	%f27, %f27
	.word	0xf700a004	! t0_kref+0x7d0:   	ld	[%g2 + 4], %f27
	.word	0xd40e6015	! t0_kref+0x7d4:   	ldub	[%i1 + 0x15], %o2
	.word	0x81de3992	! t0_kref+0x7d8:   	flush	%i0 - 0x66e
	.word	0xe41e7ff0	! t0_kref+0x7dc:   	ldd	[%i1 - 0x10], %l2
	.word	0xb5a688da	! t0_kref+0x7e0:   	fsubd	%f26, %f26, %f26
	.word	0xd420a018	! t0_kref+0x7e4:   	st	%o2, [%g2 + 0x18]
	.word	0xb7a6c9bb	! t0_kref+0x7e8:   	fdivs	%f27, %f27, %f27
	.word	0xec180019	! t0_kref+0x7ec:   	ldd	[%g0 + %i1], %l6
	.word	0xb7a0053b	! t0_kref+0x7f0:   	fsqrts	%f27, %f27
	.word	0xa62a73c9	! t0_kref+0x7f4:   	andn	%o1, -0xc37, %l3
	.word	0x9e2ea987	! t0_kref+0x7f8:   	andn	%i2, 0x987, %o7
	.word	0xb7a01a5a	! t0_kref+0x7fc:   	fdtoi	%f26, %f27
	.word	0xa7400000	! t0_kref+0x800:   	mov	%y, %l3
	.word	0x94157887	! t0_kref+0x804:   	or	%l5, -0x779, %o2
	.word	0x34480004	! t0_kref+0x808:   	bg,a,pt	%icc, _kref+0x818
	.word	0xb7a018da	! t0_kref+0x80c:   	fdtos	%f26, %f27
	.word	0xb7a0053b	! t0_kref+0x810:   	fsqrts	%f27, %f27
	.word	0xd0680019	! t0_kref+0x814:   	ldstub	[%g0 + %i1], %o0
	.word	0xb5a688da	! t0_kref+0x818:   	fsubd	%f26, %f26, %f26
	.word	0xb7a01a5a	! t0_kref+0x81c:   	fdtoi	%f26, %f27
	.word	0xf720a02c	! t0_kref+0x820:   	st	%f27, [%g2 + 0x2c]
	.word	0xa6fb0008	! t0_kref+0x824:   	sdivcc	%o4, %o0, %l3
	.word	0xb5a8405a	! t0_kref+0x828:   	fmovdne	%fcc0, %f26, %f26
	.word	0x2a480006	! t0_kref+0x82c:   	bcs,a,pt	%icc, _kref+0x844
	.word	0xa8d34008	! t0_kref+0x830:   	umulcc	%o5, %o0, %l4
	.word	0xf51fbf40	! t0_kref+0x834:   	ldd	[%fp - 0xc0], %f26
	.word	0x3d800002	! t0_kref+0x838:   	fbule,a	_kref+0x840
	.word	0xd67e2008	! t0_kref+0x83c:   	swap	[%i0 + 8], %o3
	.word	0x90b5c00b	! t0_kref+0x840:   	orncc	%l7, %o3, %o0
	.word	0xb7a6c93b	! t0_kref+0x844:   	fmuls	%f27, %f27, %f27
	.word	0xb5a6895a	! t0_kref+0x848:   	fmuld	%f26, %f26, %f26
	.word	0xb7a000bb	! t0_kref+0x84c:   	fnegs	%f27, %f27
	.word	0x90f53fed	! t0_kref+0x850:   	udivcc	%l4, -0x13, %o0
	.word	0xb7a0189b	! t0_kref+0x854:   	fitos	%f27, %f27
	.word	0xa8627c64	! t0_kref+0x858:   	subc	%o1, -0x39c, %l4
	.word	0x81aecabb	! t0_kref+0x85c:   	fcmpes	%fcc0, %f27, %f27
	.word	0x8012a46e	! t0_kref+0x860:   	or	%o2, 0x46e, %g0
	.word	0x9246a846	! t0_kref+0x864:   	addc	%i2, 0x846, %o1
	.word	0x9ed366aa	! t0_kref+0x868:   	umulcc	%o5, 0x6aa, %o7
	.word	0x81aeca3b	! t0_kref+0x86c:   	fcmps	%fcc0, %f27, %f27
	.word	0xb7a018da	! t0_kref+0x870:   	fdtos	%f26, %f27
	.word	0x3f800007	! t0_kref+0x874:   	fbo,a	_kref+0x890
	.word	0xa93ac00d	! t0_kref+0x878:   	sra	%o3, %o5, %l4
	.word	0xe168a08d	! t0_kref+0x87c:   	prefetch	%g2 + 0x8d, 16
	.word	0xde40a02c	! t0_kref+0x880:   	ldsw	[%g2 + 0x2c], %o7
	.word	0xd220a01c	! t0_kref+0x884:   	st	%o1, [%g2 + 0x1c]
	.word	0xec20a02c	! t0_kref+0x888:   	st	%l6, [%g2 + 0x2c]
	.word	0xa2a4c00c	! t0_kref+0x88c:   	subcc	%l3, %o4, %l1
	.word	0x80120015	! t0_kref+0x890:   	or	%o0, %l5, %g0
	.word	0xb7a0053b	! t0_kref+0x894:   	fsqrts	%f27, %f27
	.word	0xb7a6c9bb	! t0_kref+0x898:   	fdivs	%f27, %f27, %f27
	.word	0x86102019	! t0_kref+0x89c:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x8a0:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x8a4:   	be,a	_kref+0x8d0
	.word	0x29255c23	! t0_kref+0x8a8:   	sethi	%hi(0x95708c00), %l4
	.word	0xc12e401c	! t0_kref+0x8ac:   	st	%fsr, [%i1 + %i4]
	.word	0xa2868016	! t0_kref+0x8b0:   	addcc	%i2, %l6, %l1
	.word	0xa4c54014	! t0_kref+0x8b4:   	addccc	%l5, %l4, %l2
	.word	0xb5a0193b	! t0_kref+0x8b8:   	fstod	%f27, %f26
	.word	0x8143c000	! t0_kref+0x8bc:   	stbar
	.word	0x80ae800c	! t0_kref+0x8c0:   	andncc	%i2, %o4, %g0
	call	SYM(t0_subr2)
	.word	0xea30a01a	! t0_kref+0x8c8:   	sth	%l5, [%g2 + 0x1a]
	.word	0x90f68009	! t0_kref+0x8cc:   	udivcc	%i2, %o1, %o0
	.word	0x9695621f	! t0_kref+0x8d0:   	orcc	%l5, 0x21f, %o3
	.word	0x30480003	! t0_kref+0x8d4:   	ba,a,pt	%icc, _kref+0x8e0
	.word	0xa845c00a	! t0_kref+0x8d8:   	addc	%l7, %o2, %l4
	.word	0xd420a014	! t0_kref+0x8dc:   	st	%o2, [%g2 + 0x14]
	.word	0xb5a0193b	! t0_kref+0x8e0:   	fstod	%f27, %f26
	.word	0xde40a02c	! t0_kref+0x8e4:   	ldsw	[%g2 + 0x2c], %o7
	.word	0x32800002	! t0_kref+0x8e8:   	bne,a	_kref+0x8f0
	.word	0xaad4c009	! t0_kref+0x8ec:   	umulcc	%l3, %o1, %l5
	.word	0x9ab58017	! t0_kref+0x8f0:   	orncc	%l6, %l7, %o5
	.word	0xf700a030	! t0_kref+0x8f4:   	ld	[%g2 + 0x30], %f27
	.word	0xf7200018	! t0_kref+0x8f8:   	st	%f27, [%g0 + %i0]
	.word	0xe800a03c	! t0_kref+0x8fc:   	ld	[%g2 + 0x3c], %l4
	.word	0xf5bf5019	! t0_kref+0x900:   	stda	%f26, [%i5 + %i1]0x80
	.word	0xd80e8018	! t0_kref+0x904:   	ldub	[%i2 + %i0], %o4
	.word	0xd6280019	! t0_kref+0x908:   	stb	%o3, [%g0 + %i1]
	.word	0xb7a018da	! t0_kref+0x90c:   	fdtos	%f26, %f27
	.word	0x9de3bfa0	! t0_kref+0x910:   	save	%sp, -0x60, %sp
	.word	0xabee3043	! t0_kref+0x914:   	restore	%i0, -0xfbd, %l5
	.word	0xb7a6c93b	! t0_kref+0x918:   	fmuls	%f27, %f27, %f27
	.word	0xf420a008	! t0_kref+0x91c:   	st	%i2, [%g2 + 8]
	.word	0xe286101c	! t0_kref+0x920:   	lda	[%i0 + %i4]0x80, %l1
	.word	0xea7f0018	! t0_kref+0x924:   	swap	[%i4 + %i0], %l5
	.word	0x985d68d4	! t0_kref+0x928:   	smul	%l5, 0x8d4, %o4
	.word	0x3c800008	! t0_kref+0x92c:   	bpos,a	_kref+0x94c
	.word	0xc000a018	! t0_kref+0x930:   	ld	[%g2 + 0x18], %g0
	.word	0xb7a0053b	! t0_kref+0x934:   	fsqrts	%f27, %f27
	.word	0xaa8270e9	! t0_kref+0x938:   	addcc	%o1, -0xf17, %l5
	.word	0x81dc3bff	! t0_kref+0x93c:   	flush	%l0 - 0x401
	.word	0x24800008	! t0_kref+0x940:   	ble,a	_kref+0x960
	.word	0xa6f22e26	! t0_kref+0x944:   	udivcc	%o0, 0xe26, %l3
	.word	0x9fc10000	! t0_kref+0x948:   	call	%g4
	.word	0xd43f4019	! t0_kref+0x94c:   	std	%o2, [%i5 + %i1]
	call	SYM(t0_subr2)
	.word	0xb7a000bb	! t0_kref+0x954:   	fnegs	%f27, %f27
	.word	0xa483774f	! t0_kref+0x958:   	addcc	%o5, -0x8b1, %l2
	.word	0xe830a028	! t0_kref+0x95c:   	sth	%l4, [%g2 + 0x28]
	.word	0x81df62d1	! t0_kref+0x960:   	flush	%i5 + 0x2d1
	.word	0x96da66c4	! t0_kref+0x964:   	smulcc	%o1, 0x6c4, %o3
	.word	0xf51e2000	! t0_kref+0x968:   	ldd	[%i0], %f26
	.word	0x36800002	! t0_kref+0x96c:   	bge,a	_kref+0x974
	.word	0xf700a010	! t0_kref+0x970:   	ld	[%g2 + 0x10], %f27
	.word	0xb7a0003b	! t0_kref+0x974:   	fmovs	%f27, %f27
	.word	0x3d800006	! t0_kref+0x978:   	fbule,a	_kref+0x990
	.word	0xd848a02c	! t0_kref+0x97c:   	ldsb	[%g2 + 0x2c], %o4
	.word	0x8d802c9b	! t0_kref+0x980:   	mov	0xc9b, %fprs
	.word	0x9ac52957	! t0_kref+0x984:   	addccc	%l4, 0x957, %o5
	.word	0xad400000	! t0_kref+0x988:   	mov	%y, %l6
	.word	0x3b800005	! t0_kref+0x98c:   	fble,a	_kref+0x9a0
	.word	0xee767fe0	! t0_kref+0x990:   	stx	%l7, [%i1 - 0x20]
	.word	0x96a2401a	! t0_kref+0x994:   	subcc	%o1, %i2, %o3
	.word	0xaea54008	! t0_kref+0x998:   	subcc	%l5, %o0, %l7
	.word	0xd6d81018	! t0_kref+0x99c:   	ldxa	[%g0 + %i0]0x80, %o3
	.word	0x90fa0016	! t0_kref+0x9a0:   	sdivcc	%o0, %l6, %o0
	.word	0xee300018	! t0_kref+0x9a4:   	sth	%l7, [%g0 + %i0]
	.word	0xd6ee501a	! t0_kref+0x9a8:   	ldstuba	[%i1 + %i2]0x80, %o3
	.word	0x36800001	! t0_kref+0x9ac:   	bge,a	_kref+0x9b0
	.word	0xb7a0003b	! t0_kref+0x9b0:   	fmovs	%f27, %f27
	.word	0x9eb5001a	! t0_kref+0x9b4:   	orncc	%l4, %i2, %o7
	.word	0xd6d0105b	! t0_kref+0x9b8:   	ldsha	[%g0 + %i3]0x82, %o3
	.word	0xec0e3fe7	! t0_kref+0x9bc:   	ldub	[%i0 - 0x19], %l6
	.word	0x90d5bb47	! t0_kref+0x9c0:   	umulcc	%l6, -0x4b9, %o0
	.word	0x96aaa84e	! t0_kref+0x9c4:   	andncc	%o2, 0x84e, %o3
	.word	0xf19e1a1a	! t0_kref+0x9c8:   	ldda	[%i0 + %i2]0xd0, %f24
	.word	0xb5a0005a	! t0_kref+0x9cc:   	fmovd	%f26, %f26
	call	SYM(t0_subr2)
	.word	0xf4266000	! t0_kref+0x9d4:   	st	%i2, [%i1]
	.word	0xf7062000	! t0_kref+0x9d8:   	ld	[%i0], %f27
	.word	0xa4f57f7d	! t0_kref+0x9dc:   	udivcc	%l5, -0x83, %l2
	.word	0x968a8000	! t0_kref+0x9e0:   	andcc	%o2, %g0, %o3
	.word	0xf76e3ff0	! t0_kref+0x9e4:   	prefetch	%i0 - 0x10, 27
	.word	0x9a580017	! t0_kref+0x9e8:   	smul	%g0, %l7, %o5
	.word	0x9e1320fa	! t0_kref+0x9ec:   	or	%o4, 0xfa, %o7
	.word	0xf5be5000	! t0_kref+0x9f0:   	stda	%f26, [%i1]0x80
	.word	0xaadd0000	! t0_kref+0x9f4:   	smulcc	%l4, %g0, %l5
	.word	0xf706401c	! t0_kref+0x9f8:   	ld	[%i1 + %i4], %f27
	.word	0xf7066004	! t0_kref+0x9fc:   	ld	[%i1 + 4], %f27
	.word	0xb7a0003b	! t0_kref+0xa00:   	fmovs	%f27, %f27
	.word	0xad32a015	! t0_kref+0xa04:   	srl	%o2, 0x15, %l6
	.word	0xd650a038	! t0_kref+0xa08:   	ldsh	[%g2 + 0x38], %o3
	.word	0x923d2ca3	! t0_kref+0xa0c:   	xnor	%l4, 0xca3, %o1
	.word	0x81aecabb	! t0_kref+0xa10:   	fcmpes	%fcc0, %f27, %f27
	.word	0x96db269f	! t0_kref+0xa14:   	smulcc	%o4, 0x69f, %o3
	.word	0x94383dce	! t0_kref+0xa18:   	xnor	%g0, -0x232, %o2
	.word	0xee56c018	! t0_kref+0xa1c:   	ldsh	[%i3 + %i0], %l7
	.word	0x98f20017	! t0_kref+0xa20:   	udivcc	%o0, %l7, %o4
	.word	0x81ae8ada	! t0_kref+0xa24:   	fcmped	%fcc0, %f26, %f26
	.word	0xde080018	! t0_kref+0xa28:   	ldub	[%g0 + %i0], %o7
	.word	0xf53e3ff8	! t0_kref+0xa2c:   	std	%f26, [%i0 - 8]
	.word	0x9845e97b	! t0_kref+0xa30:   	addc	%l7, 0x97b, %o4
	.word	0x923d4014	! t0_kref+0xa34:   	xnor	%l5, %l4, %o1
	.word	0xea00a000	! t0_kref+0xa38:   	ld	[%g2], %l5
	.word	0xee56c018	! t0_kref+0xa3c:   	ldsh	[%i3 + %i0], %l7
	.word	0xd43e6018	! t0_kref+0xa40:   	std	%o2, [%i1 + 0x18]
	.word	0xb5a6cd3b	! t0_kref+0xa44:   	fsmuld	%f27, %f27, %f26
	.word	0xd4780019	! t0_kref+0xa48:   	swap	[%g0 + %i1], %o2
	.word	0xb5a688da	! t0_kref+0xa4c:   	fsubd	%f26, %f26, %f26
	.word	0xb7a6c9bb	! t0_kref+0xa50:   	fdivs	%f27, %f27, %f27
	.word	0x9fc10000	! t0_kref+0xa54:   	call	%g4
	.word	0xd03e3fe0	! t0_kref+0xa58:   	std	%o0, [%i0 - 0x20]
	.word	0x949a401a	! t0_kref+0xa5c:   	xorcc	%o1, %i2, %o2
	.word	0xee26001c	! t0_kref+0xa60:   	st	%l7, [%i0 + %i4]
	.word	0x9fc10000	! t0_kref+0xa64:   	call	%g4
	.word	0xd8467fe4	! t0_kref+0xa68:   	ldsw	[%i1 - 0x1c], %o4
	.word	0xd208a037	! t0_kref+0xa6c:   	ldub	[%g2 + 0x37], %o1
	.word	0xf7200019	! t0_kref+0xa70:   	st	%f27, [%g0 + %i1]
	.word	0xda28a02f	! t0_kref+0xa74:   	stb	%o5, [%g2 + 0x2f]
	.word	0x989df1da	! t0_kref+0xa78:   	xorcc	%l7, -0xe26, %o4
	.word	0xb7a0013b	! t0_kref+0xa7c:   	fabss	%f27, %f27
	.word	0x2f480008	! t0_kref+0xa80:   	fbu,a,pt	%fcc0, _kref+0xaa0
	.word	0xf19e9a18	! t0_kref+0xa84:   	ldda	[%i2 + %i0]0xd0, %f24
	.word	0x81ae8a5a	! t0_kref+0xa88:   	fcmpd	%fcc0, %f26, %f26
	.word	0x96f32254	! t0_kref+0xa8c:   	udivcc	%o4, 0x254, %o3
	.word	0xd43e001d	! t0_kref+0xa90:   	std	%o2, [%i0 + %i5]
	.word	0x911b4015	! t0_kref+0xa94:   	tsubcctv	%o5, %l5, %o0
	.word	0xb5a0191b	! t0_kref+0xa98:   	fitod	%f27, %f26
	.word	0x9e85636e	! t0_kref+0xa9c:   	addcc	%l5, 0x36e, %o7
	.word	0xf7067ff0	! t0_kref+0xaa0:   	ld	[%i1 - 0x10], %f27
	.word	0xb7a0053b	! t0_kref+0xaa4:   	fsqrts	%f27, %f27
	.word	0xb5a689da	! t0_kref+0xaa8:   	fdivd	%f26, %f26, %f26
	call	SYM(t0_subr1)
	.word	0xad12e80a	! t0_kref+0xab0:   	taddcctv	%o3, 0x80a, %l6
	.word	0x98252111	! t0_kref+0xab4:   	sub	%l4, 0x111, %o4
	.word	0x32800005	! t0_kref+0xab8:   	bne,a	_kref+0xacc
	.word	0xd406001c	! t0_kref+0xabc:   	ld	[%i0 + %i4], %o2
	.word	0xb7a0003b	! t0_kref+0xac0:   	fmovs	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0xac4:   	fsqrts	%f27, %f27
	.word	0xd03e001d	! t0_kref+0xac8:   	std	%o0, [%i0 + %i5]
	.word	0xf7067ff8	! t0_kref+0xacc:   	ld	[%i1 - 8], %f27
	.word	0xb7a6c93b	! t0_kref+0xad0:   	fmuls	%f27, %f27, %f27
	.word	0x9a45f8b5	! t0_kref+0xad4:   	addc	%l7, -0x74b, %o5
	.word	0xb7a6c9bb	! t0_kref+0xad8:   	fdivs	%f27, %f27, %f27
	.word	0xb7a01a5a	! t0_kref+0xadc:   	fdtoi	%f26, %f27
	.word	0xaf3b0009	! t0_kref+0xae0:   	sra	%o4, %o1, %l7
	.word	0x9eadc00d	! t0_kref+0xae4:   	andncc	%l7, %o5, %o7
	.word	0xd4801019	! t0_kref+0xae8:   	lda	[%g0 + %i1]0x80, %o2
	call	SYM(t0_subr2)
	.word	0xf7070018	! t0_kref+0xaf0:   	ld	[%i4 + %i0], %f27
	.word	0xf700a024	! t0_kref+0xaf4:   	ld	[%g2 + 0x24], %f27
	.word	0xb7a0053b	! t0_kref+0xaf8:   	fsqrts	%f27, %f27
	.word	0xecf65000	! t0_kref+0xafc:   	stxa	%l6, [%i1]0x80
	.word	0x31800008	! t0_kref+0xb00:   	fba,a	_kref+0xb20
	.word	0xd0070019	! t0_kref+0xb04:   	ld	[%i4 + %i1], %o0
	.word	0xf700a010	! t0_kref+0xb08:   	ld	[%g2 + 0x10], %f27
	.word	0xb7a000bb	! t0_kref+0xb0c:   	fnegs	%f27, %f27
	.word	0xb5a0193b	! t0_kref+0xb10:   	fstod	%f27, %f26
	.word	0xaf127942	! t0_kref+0xb14:   	taddcctv	%o1, -0x6be, %l7
	.word	0xf51fbd98	! t0_kref+0xb18:   	ldd	[%fp - 0x268], %f26
	.word	0xab35601a	! t0_kref+0xb1c:   	srl	%l5, 0x1a, %l5
	.word	0xb5a6895a	! t0_kref+0xb20:   	fmuld	%f26, %f26, %f26
	.word	0xd408a015	! t0_kref+0xb24:   	ldub	[%g2 + 0x15], %o2
	.word	0xa42834ca	! t0_kref+0xb28:   	andn	%g0, -0xb36, %l2
	.word	0x9de3bfa0	! t0_kref+0xb2c:   	save	%sp, -0x60, %sp
	.word	0xb4a6c01c	! t0_kref+0xb30:   	subcc	%i3, %i4, %i2
	.word	0x95ef35e8	! t0_kref+0xb34:   	restore	%i4, -0xa18, %o2
	.word	0xf8203470	! t0_kref+0xb38:   	st	%i4, [%g0 - 0xb90]
	.word	0xae55c008	! t0_kref+0xb3c:   	umul	%l7, %o0, %l7
	.word	0xaec2c016	! t0_kref+0xb40:   	addccc	%o3, %l6, %l7
	.word	0xf53e001d	! t0_kref+0xb44:   	std	%f26, [%i0 + %i5]
	.word	0x3b800008	! t0_kref+0xb48:   	fble,a	_kref+0xb68
	.word	0xa8d03b2a	! t0_kref+0xb4c:   	umulcc	%g0, -0x4d6, %l4
	.word	0x969b2270	! t0_kref+0xb50:   	xorcc	%o4, 0x270, %o3
	.word	0x81aecabb	! t0_kref+0xb54:   	fcmpes	%fcc0, %f27, %f27
	.word	0xb7a018da	! t0_kref+0xb58:   	fdtos	%f26, %f27
	call	SYM(t0_subr1)
	.word	0xb5a689da	! t0_kref+0xb60:   	fdivd	%f26, %f26, %f26
	.word	0xab3ce018	! t0_kref+0xb64:   	sra	%l3, 0x18, %l5
	.word	0x9aa54014	! t0_kref+0xb68:   	subcc	%l5, %l4, %o5
	.word	0x982e8015	! t0_kref+0xb6c:   	andn	%i2, %l5, %o4
	.word	0x81580000	! t0_kref+0xb70:   	flushw
	.word	0x94a34013	! t0_kref+0xb74:   	subcc	%o5, %l3, %o2
	.word	0xd03e7fe0	! t0_kref+0xb78:   	std	%o0, [%i1 - 0x20]
	.word	0xf7270018	! t0_kref+0xb7c:   	st	%f27, [%i4 + %i0]
	.word	0xf7066004	! t0_kref+0xb80:   	ld	[%i1 + 4], %f27
	.word	0x80622a5e	! t0_kref+0xb84:   	subc	%o0, 0xa5e, %g0
	.word	0xb5a689da	! t0_kref+0xb88:   	fdivd	%f26, %f26, %f26
	.word	0x81ae8a5a	! t0_kref+0xb8c:   	fcmpd	%fcc0, %f26, %f26
	.word	0x81aecabb	! t0_kref+0xb90:   	fcmpes	%fcc0, %f27, %f27
	.word	0xae3df4dd	! t0_kref+0xb94:   	xnor	%l7, -0xb23, %l7
	.word	0x9fc00004	! t0_kref+0xb98:   	call	%g0 + %g4
	.word	0xb7a6c8bb	! t0_kref+0xb9c:   	fsubs	%f27, %f27, %f27
	.word	0x90bdf3d6	! t0_kref+0xba0:   	xnorcc	%l7, -0xc2a, %o0
	.word	0x9a523128	! t0_kref+0xba4:   	umul	%o0, -0xed8, %o5
	.word	0xf700a008	! t0_kref+0xba8:   	ld	[%g2 + 8], %f27
	.word	0xda20a02c	! t0_kref+0xbac:   	st	%o5, [%g2 + 0x2c]
	.word	0x96b33507	! t0_kref+0xbb0:   	orncc	%o4, -0xaf9, %o3
	.word	0xf53e7fe8	! t0_kref+0xbb4:   	std	%f26, [%i1 - 0x18]
	.word	0xd43e6018	! t0_kref+0xbb8:   	std	%o2, [%i1 + 0x18]
	.word	0xe36e401b	! t0_kref+0xbbc:   	prefetch	%i1 + %i3, 17
	.word	0xb5a689da	! t0_kref+0xbc0:   	fdivd	%f26, %f26, %f26
	.word	0x81da400b	! t0_kref+0xbc4:   	flush	%o1 + %o3
	.word	0xb5a0105a	! t0_kref+0xbc8:   	fdtox	%f26, %f26
	.word	0xad33200e	! t0_kref+0xbcc:   	srl	%o4, 0xe, %l6
	.word	0x81ae8a5a	! t0_kref+0xbd0:   	fcmpd	%fcc0, %f26, %f26
	.word	0xa2c2233d	! t0_kref+0xbd4:   	addccc	%o0, 0x33d, %l1
	.word	0x98150016	! t0_kref+0xbd8:   	or	%l4, %l6, %o4
	.word	0xf7801019	! t0_kref+0xbdc:   	lda	[%g0 + %i1]0x80, %f27
	.word	0xf700a038	! t0_kref+0xbe0:   	ld	[%g2 + 0x38], %f27
	.word	0x27800001	! t0_kref+0xbe4:   	fbul,a	_kref+0xbe8
	.word	0xaf32c000	! t0_kref+0xbe8:   	srl	%o3, %g0, %l7
	.word	0x98b5e748	! t0_kref+0xbec:   	orncc	%l7, 0x748, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be024	! t0_kref+0xbf4:   	ldub	[%o7 + 0x24], %l2
	.word	0xa41ca00c	! t0_kref+0xbf8:   	xor	%l2, 0xc, %l2
	.word	0xe42be024	! t0_kref+0xbfc:   	stb	%l2, [%o7 + 0x24]
	.word	0x81dbe024	! t0_kref+0xc00:   	flush	%o7 + 0x24
	.word	0xf720a03c	! t0_kref+0xc04:   	st	%f27, [%g2 + 0x3c]
	.word	0x8143c000	! t0_kref+0xc08:   	stbar
	.word	0x98803fe7	! t0_kref+0xc0c:   	addcc	%g0, -0x19, %o4
	.word	0xec30a022	! t0_kref+0xc10:   	sth	%l6, [%g2 + 0x22]
	.word	0x980cc014	! t0_kref+0xc14:   	and	%l3, %l4, %o4
	.word	0xb7ab803b	! t0_kref+0xc18:   	fmovsule	%fcc0, %f27, %f27
	.word	0x32800003	! t0_kref+0xc1c:   	bne,a	_kref+0xc28
	.word	0xde56401b	! t0_kref+0xc20:   	ldsh	[%i1 + %i3], %o7
2:	.word	0xee10a01a	! t0_kref+0xc24:   	lduh	[%g2 + 0x1a], %l7
	.word	0xe6300019	! t0_kref+0xc28:   	sth	%l3, [%g0 + %i1]
	.word	0x38480007	! t0_kref+0xc2c:   	bgu,a,pt	%icc, _kref+0xc48
	.word	0xf7070018	! t0_kref+0xc30:   	ld	[%i4 + %i0], %f27
	.word	0x92dcc014	! t0_kref+0xc34:   	smulcc	%l3, %l4, %o1
	.word	0x23480006	! t0_kref+0xc38:   	fbne,a,pt	%fcc0, _kref+0xc50
	.word	0xf5be1000	! t0_kref+0xc3c:   	stda	%f26, [%i0]0x80
	.word	0xb7a0003b	! t0_kref+0xc40:   	fmovs	%f27, %f27
	.word	0xf59f5018	! t0_kref+0xc44:   	ldda	[%i5 + %i0]0x80, %f26
	call	SYM(t0_subr2)
	.word	0xb5a6895a	! t0_kref+0xc4c:   	fmuld	%f26, %f26, %f26
	.word	0x2d800008	! t0_kref+0xc50:   	fbg,a	_kref+0xc70
	.word	0xea462018	! t0_kref+0xc54:   	ldsw	[%i0 + 0x18], %l5
	.word	0xaaf23f7e	! t0_kref+0xc58:   	udivcc	%o0, -0x82, %l5
	.word	0x81ae8ada	! t0_kref+0xc5c:   	fcmped	%fcc0, %f26, %f26
	.word	0xc81f4005	! t0_kref+0xc60:   	ldd	[%i5 + %g5], %g4
	.word	0xb7a01a3b	! t0_kref+0xc64:   	fstoi	%f27, %f27
	.word	0x34800007	! t0_kref+0xc68:   	bg,a	_kref+0xc84
	.word	0xb7a000bb	! t0_kref+0xc6c:   	fnegs	%f27, %f27
	.word	0xea563ff2	! t0_kref+0xc70:   	ldsh	[%i0 - 0xe], %l5
	.word	0xb7a0013b	! t0_kref+0xc74:   	fabss	%f27, %f27
	.word	0xb7a6c9bb	! t0_kref+0xc78:   	fdivs	%f27, %f27, %f27
	.word	0xf53e401d	! t0_kref+0xc7c:   	std	%f26, [%i1 + %i5]
	.word	0x2a480002	! t0_kref+0xc80:   	bcs,a,pt	%icc, _kref+0xc88
	.word	0xb5a0193b	! t0_kref+0xc84:   	fstod	%f27, %f26
	.word	0x9ad5c014	! t0_kref+0xc88:   	umulcc	%l7, %l4, %o5
	.word	0xa455c00a	! t0_kref+0xc8c:   	umul	%l7, %o2, %l2
	.word	0xb7a0003b	! t0_kref+0xc90:   	fmovs	%f27, %f27
	.word	0x20800002	! t0_kref+0xc94:   	bn,a	_kref+0xc9c
	.word	0xab32c000	! t0_kref+0xc98:   	srl	%o3, %g0, %l5
	.word	0xb5a6cd3b	! t0_kref+0xc9c:   	fsmuld	%f27, %f27, %f26
!	.word	0x39bd1cd3	! t0_kref+0xca0:   	fbuge,a	SYM(t0_subr3)
	   	fbuge,a	SYM(t0_subr3)
	.word	0x9e006560	! t0_kref+0xca4:   	add	%g1, 0x560, %o7
	.word	0x981cea1f	! t0_kref+0xca8:   	xor	%l3, 0xa1f, %o4
	.word	0x81580000	! t0_kref+0xcac:   	flushw
	.word	0x9a9a4017	! t0_kref+0xcb0:   	xorcc	%o1, %l7, %o5
	.word	0x20800001	! t0_kref+0xcb4:   	bn,a	_kref+0xcb8
	.word	0xb7a0189b	! t0_kref+0xcb8:   	fitos	%f27, %f27
	.word	0xb7a01a5a	! t0_kref+0xcbc:   	fdtoi	%f26, %f27
	.word	0xf19e1a5d	! t0_kref+0xcc0:   	ldda	[%i0 + %i5]0xd2, %f24
	.word	0x973b0015	! t0_kref+0xcc4:   	sra	%o4, %l5, %o3
	.word	0xd428a020	! t0_kref+0xcc8:   	stb	%o2, [%g2 + 0x20]
	.word	0xf53e3ff8	! t0_kref+0xccc:   	std	%f26, [%i0 - 8]
	.word	0xa8ddf7a6	! t0_kref+0xcd0:   	smulcc	%l7, -0x85a, %l4
	.word	0xb7a0003b	! t0_kref+0xcd4:   	fmovs	%f27, %f27
	.word	0xa48d000b	! t0_kref+0xcd8:   	andcc	%l4, %o3, %l2
	.word	0xb7a0053b	! t0_kref+0xcdc:   	fsqrts	%f27, %f27
	.word	0xe2680019	! t0_kref+0xce0:   	ldstub	[%g0 + %i1], %l1
	.word	0x905ac000	! t0_kref+0xce4:   	smul	%o3, %g0, %o0
	.word	0xb7a0003b	! t0_kref+0xce8:   	fmovs	%f27, %f27
	.word	0x2d800005	! t0_kref+0xcec:   	fbg,a	_kref+0xd00
	.word	0xb7a018da	! t0_kref+0xcf0:   	fdtos	%f26, %f27
	.word	0xee263ff0	! t0_kref+0xcf4:   	st	%l7, [%i0 - 0x10]
	.word	0xf96e7ff0	! t0_kref+0xcf8:   	prefetch	%i1 - 0x10, 28
	.word	0xb7a018da	! t0_kref+0xcfc:   	fdtos	%f26, %f27
	.word	0xb7a6c8bb	! t0_kref+0xd00:   	fsubs	%f27, %f27, %f27
	.word	0xee28a003	! t0_kref+0xd04:   	stb	%l7, [%g2 + 3]
	.word	0x3e800002	! t0_kref+0xd08:   	bvc,a	_kref+0xd10
	.word	0xf1be180a	! t0_kref+0xd0c:   	stda	%f24, [%i0 + %o2]0xc0
	.word	0x81aecabb	! t0_kref+0xd10:   	fcmpes	%fcc0, %f27, %f27
	.word	0xd028a010	! t0_kref+0xd14:   	stb	%o0, [%g2 + 0x10]
	.word	0x93400000	! t0_kref+0xd18:   	mov	%y, %o1
	.word	0xa87227aa	! t0_kref+0xd1c:   	udiv	%o0, 0x7aa, %l4
	.word	0xb7a01a3b	! t0_kref+0xd20:   	fstoi	%f27, %f27
	.word	0xd6563fe4	! t0_kref+0xd24:   	ldsh	[%i0 - 0x1c], %o3
	.word	0xb5a6895a	! t0_kref+0xd28:   	fmuld	%f26, %f26, %f26
	.word	0xc76e3fe0	! t0_kref+0xd2c:   	prefetch	%i0 - 0x20, 3
	.word	0xdbe65014	! t0_kref+0xd30:   	casa	[%i1]0x80, %l4, %o5
	.word	0x9a62c013	! t0_kref+0xd34:   	subc	%o3, %l3, %o5
	.word	0xda40a02c	! t0_kref+0xd38:   	ldsw	[%g2 + 0x2c], %o5
	.word	0xf5180019	! t0_kref+0xd3c:   	ldd	[%g0 + %i1], %f26
	.word	0xb7a6c8bb	! t0_kref+0xd40:   	fsubs	%f27, %f27, %f27
	.word	0x35800001	! t0_kref+0xd44:   	fbue,a	_kref+0xd48
	.word	0x920a3653	! t0_kref+0xd48:   	and	%o0, -0x9ad, %o1
	.word	0xe07e201c	! t0_kref+0xd4c:   	swap	[%i0 + 0x1c], %l0
	.word	0x33800003	! t0_kref+0xd50:   	fbe,a	_kref+0xd5c
	.word	0x98e34009	! t0_kref+0xd54:   	subccc	%o5, %o1, %o4
	.word	0xd2080019	! t0_kref+0xd58:   	ldub	[%g0 + %i1], %o1
	.word	0xc0070018	! t0_kref+0xd5c:   	ld	[%i4 + %i0], %g0
	.word	0xee50a014	! t0_kref+0xd60:   	ldsh	[%g2 + 0x14], %l7
	.word	0x8d850014	! t0_kref+0xd64:   	wr	%l4, %l4, %fprs
	.word	0xaeb6b1f5	! t0_kref+0xd68:   	orncc	%i2, -0xe0b, %l7
	.word	0xf7070019	! t0_kref+0xd6c:   	ld	[%i4 + %i1], %f27
	.word	0x8d830000	! t0_kref+0xd70:   	wr	%o4, %g0, %fprs
	.word	0x27800004	! t0_kref+0xd74:   	fbul,a	_kref+0xd84
	.word	0x9e2dc01a	! t0_kref+0xd78:   	andn	%l7, %i2, %o7
	.word	0x36480002	! t0_kref+0xd7c:   	bge,a,pt	%icc, _kref+0xd84
	.word	0xd420a030	! t0_kref+0xd80:   	st	%o2, [%g2 + 0x30]
	.word	0x2e800003	! t0_kref+0xd84:   	bvs,a	_kref+0xd90
	.word	0x98fb7826	! t0_kref+0xd88:   	sdivcc	%o5, -0x7da, %o4
	.word	0xaa35001a	! t0_kref+0xd8c:   	orn	%l4, %i2, %l5
	.word	0x94a5400d	! t0_kref+0xd90:   	subcc	%l5, %o5, %o2
	.word	0xb7a0053b	! t0_kref+0xd94:   	fsqrts	%f27, %f27
	.word	0x8143c000	! t0_kref+0xd98:   	stbar
	.word	0xb7a0003b	! t0_kref+0xd9c:   	fmovs	%f27, %f27
	.word	0xb7a000bb	! t0_kref+0xda0:   	fnegs	%f27, %f27
	.word	0x3c800003	! t0_kref+0xda4:   	bpos,a	_kref+0xdb0
	.word	0xea10a00c	! t0_kref+0xda8:   	lduh	[%g2 + 0xc], %l5
	.word	0xd250a036	! t0_kref+0xdac:   	ldsh	[%g2 + 0x36], %o1
	.word	0x9b00000a	! t0_kref+0xdb0:   	taddcc	%g0, %o2, %o5
	.word	0x9abd2f03	! t0_kref+0xdb4:   	xnorcc	%l4, 0xf03, %o5
	.word	0xb7a000bb	! t0_kref+0xdb8:   	fnegs	%f27, %f27
	.word	0x33480001	! t0_kref+0xdbc:   	fbe,a,pt	%fcc0, _kref+0xdc0
	.word	0xae8e800a	! t0_kref+0xdc0:   	andcc	%i2, %o2, %l7
	.word	0xa2134014	! t0_kref+0xdc4:   	or	%o5, %l4, %l1
	.word	0x29480004	! t0_kref+0xdc8:   	fbl,a,pt	%fcc0, _kref+0xdd8
	.word	0xf7000019	! t0_kref+0xdcc:   	ld	[%g0 + %i1], %f27
	.word	0xe07e0000	! t0_kref+0xdd0:   	swap	[%i0], %l0
	.word	0xb7a018da	! t0_kref+0xdd4:   	fdtos	%f26, %f27
	.word	0xa82d4013	! t0_kref+0xdd8:   	andn	%l5, %l3, %l4
	.word	0xb7a0053b	! t0_kref+0xddc:   	fsqrts	%f27, %f27
	.word	0xd448a001	! t0_kref+0xde0:   	ldsb	[%g2 + 1], %o2
	.word	0xe8762018	! t0_kref+0xde4:   	stx	%l4, [%i0 + 0x18]
	.word	0x813a8008	! t0_kref+0xde8:   	sra	%o2, %o0, %g0
	.word	0xf51fbea8	! t0_kref+0xdec:   	ldd	[%fp - 0x158], %f26
	.word	0x9fc00004	! t0_kref+0xdf0:   	call	%g0 + %g4
	.word	0xb7a01a5a	! t0_kref+0xdf4:   	fdtoi	%f26, %f27
	.word	0xb7a01a5a	! t0_kref+0xdf8:   	fdtoi	%f26, %f27
	.word	0xac52c017	! t0_kref+0xdfc:   	umul	%o3, %l7, %l6
	.word	0xe6264000	! t0_kref+0xe00:   	st	%l3, [%i1]
	.word	0xb7a018da	! t0_kref+0xe04:   	fdtos	%f26, %f27
	.word	0xb5a688da	! t0_kref+0xe08:   	fsubd	%f26, %f26, %f26
	.word	0xa7400000	! t0_kref+0xe0c:   	mov	%y, %l3
	.word	0xe8564000	! t0_kref+0xe10:   	ldsh	[%i1], %l4
!	.word	0x2748f47b	! t0_kref+0xe14:   	fbul,a,pt	%fcc0, SYM(t0_subr2)
	   	fbul,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9e0066d4	! t0_kref+0xe18:   	add	%g1, 0x6d4, %o7
	.word	0x8143c000	! t0_kref+0xe1c:   	stbar
	.word	0xae82800c	! t0_kref+0xe20:   	addcc	%o2, %o4, %l7
	.word	0xea0e6004	! t0_kref+0xe24:   	ldub	[%i1 + 4], %l5
	.word	0xb7a0053b	! t0_kref+0xe28:   	fsqrts	%f27, %f27
	.word	0xb5a689da	! t0_kref+0xe2c:   	fdivd	%f26, %f26, %f26
	.word	0x80400013	! t0_kref+0xe30:   	addc	%g0, %l3, %g0
	.word	0x81db3ed2	! t0_kref+0xe34:   	flush	%o4 - 0x12e
	.word	0x9fc10000	! t0_kref+0xe38:   	call	%g4
	.word	0xf7070018	! t0_kref+0xe3c:   	ld	[%i4 + %i0], %f27
	.word	0xb5a688da	! t0_kref+0xe40:   	fsubd	%f26, %f26, %f26
	.word	0xb7a0189b	! t0_kref+0xe44:   	fitos	%f27, %f27
	.word	0xa93a800c	! t0_kref+0xe48:   	sra	%o2, %o4, %l4
	.word	0x949a801a	! t0_kref+0xe4c:   	xorcc	%o2, %i2, %o2
	.word	0xb7a000bb	! t0_kref+0xe50:   	fnegs	%f27, %f27
	.word	0xf720a038	! t0_kref+0xe54:   	st	%f27, [%g2 + 0x38]
	.word	0x81ae8ada	! t0_kref+0xe58:   	fcmped	%fcc0, %f26, %f26
	.word	0x22800006	! t0_kref+0xe5c:   	be,a	_kref+0xe74
	.word	0xb5a0105a	! t0_kref+0xe60:   	fdtox	%f26, %f26
	.word	0xec7e7fe4	! t0_kref+0xe64:   	swap	[%i1 - 0x1c], %l6
	.word	0xaa8a24cd	! t0_kref+0xe68:   	andcc	%o0, 0x4cd, %l5
	.word	0x3a800002	! t0_kref+0xe6c:   	bcc,a	_kref+0xe74
	.word	0xa6b68008	! t0_kref+0xe70:   	orncc	%i2, %o0, %l3
	.word	0x9685677d	! t0_kref+0xe74:   	addcc	%l5, 0x77d, %o3
	.word	0xb7a018da	! t0_kref+0xe78:   	fdtos	%f26, %f27
	.word	0xaea0000c	! t0_kref+0xe7c:   	subcc	%g0, %o4, %l7
	.word	0xf7070018	! t0_kref+0xe80:   	ld	[%i4 + %i0], %f27
	.word	0xd606600c	! t0_kref+0xe84:   	ld	[%i1 + 0xc], %o3
	.word	0x96d02aa5	! t0_kref+0xe88:   	umulcc	%g0, 0xaa5, %o3
	.word	0x9fc00004	! t0_kref+0xe8c:   	call	%g0 + %g4
	.word	0xf786101c	! t0_kref+0xe90:   	lda	[%i0 + %i4]0x80, %f27
	.word	0xb7a0053b	! t0_kref+0xe94:   	fsqrts	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0xe98:   	fsqrts	%f27, %f27
	.word	0xb5a0191b	! t0_kref+0xe9c:   	fitod	%f27, %f26
	.word	0xb7a6c93b	! t0_kref+0xea0:   	fmuls	%f27, %f27, %f27
	.word	0x80ab391a	! t0_kref+0xea4:   	andncc	%o4, -0x6e6, %g0
	.word	0xb5a6895a	! t0_kref+0xea8:   	fmuld	%f26, %f26, %f26
	.word	0xb7a0053b	! t0_kref+0xeac:   	fsqrts	%f27, %f27
	.word	0xa2ad2e4c	! t0_kref+0xeb0:   	andncc	%l4, 0xe4c, %l1
	.word	0xb5a6cd3b	! t0_kref+0xeb4:   	fsmuld	%f27, %f27, %f26
	.word	0x80ba4008	! t0_kref+0xeb8:   	xnorcc	%o1, %o0, %g0
	.word	0xb7a9803b	! t0_kref+0xebc:   	fmovsg	%fcc0, %f27, %f27
	.word	0xeb68a08b	! t0_kref+0xec0:   	prefetch	%g2 + 0x8b, 21
	.word	0x942a6623	! t0_kref+0xec4:   	andn	%o1, 0x623, %o2
	.word	0xeac81019	! t0_kref+0xec8:   	ldsba	[%g0 + %i1]0x80, %l5
	call	SYM(t0_subr1)
	.word	0xa89ab163	! t0_kref+0xed0:   	xorcc	%o2, -0xe9d, %l4
	.word	0xa2580000	! t0_kref+0xed4:   	smul	%g0, %g0, %l1
	.word	0xaafa400b	! t0_kref+0xed8:   	sdivcc	%o1, %o3, %l5
	.word	0x81580000	! t0_kref+0xedc:   	flushw
	.word	0xe248a00d	! t0_kref+0xee0:   	ldsb	[%g2 + 0xd], %l1
	.word	0xb7a6c9bb	! t0_kref+0xee4:   	fdivs	%f27, %f27, %f27
	.word	0xb7a6c83b	! t0_kref+0xee8:   	fadds	%f27, %f27, %f27
	.word	0x80fa368e	! t0_kref+0xeec:   	sdivcc	%o0, -0x972, %g0
	.word	0xac15aa9f	! t0_kref+0xef0:   	or	%l6, 0xa9f, %l6
	.word	0xd2ff1018	! t0_kref+0xef4:   	swapa	[%i4 + %i0]0x80, %o1
	.word	0xd67e6008	! t0_kref+0xef8:   	swap	[%i1 + 8], %o3
	.word	0xa206a73a	! t0_kref+0xefc:   	add	%i2, 0x73a, %l1
	.word	0xb7a000bb	! t0_kref+0xf00:   	fnegs	%f27, %f27
	.word	0x81ae8ada	! t0_kref+0xf04:   	fcmped	%fcc0, %f26, %f26
	.word	0xf700a038	! t0_kref+0xf08:   	ld	[%g2 + 0x38], %f27
	.word	0x91408000	! t0_kref+0xf0c:   	mov	%ccr, %o0
	.word	0xb7a000bb	! t0_kref+0xf10:   	fnegs	%f27, %f27
	.word	0x92bac015	! t0_kref+0xf14:   	xnorcc	%o3, %l5, %o1
	.word	0xb5a0193b	! t0_kref+0xf18:   	fstod	%f27, %f26
	.word	0xe27e3fe0	! t0_kref+0xf1c:   	swap	[%i0 - 0x20], %l1
	.word	0xecce105a	! t0_kref+0xf20:   	ldsba	[%i0 + %i2]0x82, %l6
	.word	0xe8000019	! t0_kref+0xf24:   	ld	[%g0 + %i1], %l4
	.word	0x9fc10000	! t0_kref+0xf28:   	call	%g4
	.word	0xc168a083	! t0_kref+0xf2c:   	prefetch	%g2 + 0x83, 0
	.word	0xa6f00016	! t0_kref+0xf30:   	udivcc	%g0, %l6, %l3
	.word	0xaa93001a	! t0_kref+0xf34:   	orcc	%o4, %i2, %l5
	.word	0x98754008	! t0_kref+0xf38:   	udiv	%l5, %o0, %o4
	.word	0x29800002	! t0_kref+0xf3c:   	fbl,a	_kref+0xf44
	.word	0xaead63cb	! t0_kref+0xf40:   	andncc	%l5, 0x3cb, %l7
	.word	0xd840a014	! t0_kref+0xf44:   	ldsw	[%g2 + 0x14], %o4
	.word	0x94a80013	! t0_kref+0xf48:   	andncc	%g0, %l3, %o2
	.word	0xb5a6895a	! t0_kref+0xf4c:   	fmuld	%f26, %f26, %f26
	.word	0xb7a0013b	! t0_kref+0xf50:   	fabss	%f27, %f27
	.word	0xaaf4f15b	! t0_kref+0xf54:   	udivcc	%l3, -0xea5, %l5
	.word	0xb5a6895a	! t0_kref+0xf58:   	fmuld	%f26, %f26, %f26
	.word	0x813a400d	! t0_kref+0xf5c:   	sra	%o1, %o5, %g0
	.word	0x81dc001f	! t0_kref+0xf60:   	flush	%l0 + %i7
	.word	0xb7a0053b	! t0_kref+0xf64:   	fsqrts	%f27, %f27
	.word	0x2d800004	! t0_kref+0xf68:   	fbg,a	_kref+0xf78
	.word	0xda00a004	! t0_kref+0xf6c:   	ld	[%g2 + 4], %o5
	.word	0xa2354009	! t0_kref+0xf70:   	orn	%l5, %o1, %l1
	.word	0xb7a000bb	! t0_kref+0xf74:   	fnegs	%f27, %f27
	.word	0x86102004	! t0_kref+0xf78:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0xf7c:   	bne,a	_kref+0xf7c
	.word	0x86a0e001	! t0_kref+0xf80:   	subcc	%g3, 1, %g3
	.word	0x3f480002	! t0_kref+0xf84:   	fbo,a,pt	%fcc0, _kref+0xf8c
	.word	0xa4c58008	! t0_kref+0xf88:   	addccc	%l6, %o0, %l2
	.word	0x36480005	! t0_kref+0xf8c:   	bge,a,pt	%icc, _kref+0xfa0
	.word	0x9ac50008	! t0_kref+0xf90:   	addccc	%l4, %o0, %o5
	.word	0xaa65000c	! t0_kref+0xf94:   	subc	%l4, %o4, %l5
	.word	0x92a260cf	! t0_kref+0xf98:   	subcc	%o1, 0xcf, %o1
	.word	0xf720a03c	! t0_kref+0xf9c:   	st	%f27, [%g2 + 0x3c]
	sethi	%hi(2f), %o7
	.word	0xe40be3c8	! t0_kref+0xfa4:   	ldub	[%o7 + 0x3c8], %l2
	.word	0xa41ca00c	! t0_kref+0xfa8:   	xor	%l2, 0xc, %l2
	.word	0xe42be3c8	! t0_kref+0xfac:   	stb	%l2, [%o7 + 0x3c8]
	.word	0x81dbe3c8	! t0_kref+0xfb0:   	flush	%o7 + 0x3c8
	.word	0xb7a8c03b	! t0_kref+0xfb4:   	fmovsul	%fcc0, %f27, %f27
	.word	0xe168a049	! t0_kref+0xfb8:   	prefetch	%g2 + 0x49, 16
	.word	0x81dcc001	! t0_kref+0xfbc:   	flush	%l3 + %g1
	.word	0xb7a0053b	! t0_kref+0xfc0:   	fsqrts	%f27, %f27
	.word	0xac626c8e	! t0_kref+0xfc4:   	subc	%o1, 0xc8e, %l6
2:	.word	0xf1be5854	! t0_kref+0xfc8:   	stda	%f24, [%i1 + %l4]0xc2
	.word	0x22480007	! t0_kref+0xfcc:   	be,a,pt	%icc, _kref+0xfe8
	.word	0xda06201c	! t0_kref+0xfd0:   	ld	[%i0 + 0x1c], %o5
	.word	0x96b2243a	! t0_kref+0xfd4:   	orncc	%o0, 0x43a, %o3
	.word	0xea20a008	! t0_kref+0xfd8:   	st	%l5, [%g2 + 8]
	.word	0x983ab2b8	! t0_kref+0xfdc:   	xnor	%o2, -0xd48, %o4
	.word	0xd01e2008	! t0_kref+0xfe0:   	ldd	[%i0 + 8], %o0
	.word	0x33800005	! t0_kref+0xfe4:   	fbe,a	_kref+0xff8
	.word	0xa853000c	! t0_kref+0xfe8:   	umul	%o4, %o4, %l4
	.word	0xec56201a	! t0_kref+0xfec:   	ldsh	[%i0 + 0x1a], %l6
	.word	0x1f1ccd2a	! t0_kref+0xff0:   	sethi	%hi(0x7334a800), %o7
	.word	0x96adc016	! t0_kref+0xff4:   	andncc	%l7, %l6, %o3
	.word	0x8072669e	! t0_kref+0xff8:   	udiv	%o1, 0x69e, %g0
	.word	0xb7a6c9bb	! t0_kref+0xffc:   	fdivs	%f27, %f27, %f27
	.word	0xc168a088	! t0_kref+0x1000:   	prefetch	%g2 + 0x88, 0
	.word	0xc168a045	! t0_kref+0x1004:   	prefetch	%g2 + 0x45, 0
	.word	0x9ec2c00a	! t0_kref+0x1008:   	addccc	%o3, %o2, %o7
	.word	0xb5a0111a	! t0_kref+0x100c:   	fxtod	%f26, %f26
	.word	0x36800002	! t0_kref+0x1010:   	bge,a	_kref+0x1018
	.word	0xa7702af0	! t0_kref+0x1014:   	popc	0xaf0, %l3
	.word	0xf7000019	! t0_kref+0x1018:   	ld	[%g0 + %i1], %f27
	.word	0xec266000	! t0_kref+0x101c:   	st	%l6, [%i1]
	.word	0xb7a0013b	! t0_kref+0x1020:   	fabss	%f27, %f27
	.word	0xb5a688da	! t0_kref+0x1024:   	fsubd	%f26, %f26, %f26
	.word	0xf56e001b	! t0_kref+0x1028:   	prefetch	%i0 + %i3, 26
	.word	0xa8ab0000	! t0_kref+0x102c:   	andncc	%o4, %g0, %l4
	.word	0xee166010	! t0_kref+0x1030:   	lduh	[%i1 + 0x10], %l7
	.word	0xe1f6500c	! t0_kref+0x1034:   	casxa	[%i1]0x80, %o4, %l0
	.word	0x92580016	! t0_kref+0x1038:   	smul	%g0, %l6, %o1
	.word	0xa6c0301d	! t0_kref+0x103c:   	addccc	%g0, -0xfe3, %l3
	.word	0x908d2350	! t0_kref+0x1040:   	andcc	%l4, 0x350, %o0
	.word	0xb7a000bb	! t0_kref+0x1044:   	fnegs	%f27, %f27
	.word	0xaa0d6b3a	! t0_kref+0x1048:   	and	%l5, 0xb3a, %l5
	.word	0xaaa28017	! t0_kref+0x104c:   	subcc	%o2, %l7, %l5
	.word	0xa2f3400b	! t0_kref+0x1050:   	udivcc	%o5, %o3, %l1
	.word	0x36800007	! t0_kref+0x1054:   	bge,a	_kref+0x1070
	.word	0xc040a014	! t0_kref+0x1058:   	ldsw	[%g2 + 0x14], %g0
	.word	0xe648a030	! t0_kref+0x105c:   	ldsb	[%g2 + 0x30], %l3
	.word	0xb7a0053b	! t0_kref+0x1060:   	fsqrts	%f27, %f27
	.word	0x81580000	! t0_kref+0x1064:   	flushw
	call	SYM(t0_subr2)
	.word	0xf7270018	! t0_kref+0x106c:   	st	%f27, [%i4 + %i0]
	.word	0xf7266004	! t0_kref+0x1070:   	st	%f27, [%i1 + 4]
	.word	0xf53e7fe8	! t0_kref+0x1074:   	std	%f26, [%i1 - 0x18]
	.word	0xec98105d	! t0_kref+0x1078:   	ldda	[%g0 + %i5]0x82, %l6
	call	SYM(t0_subr3)
	.word	0x9a724014	! t0_kref+0x1080:   	udiv	%o1, %l4, %o5
	.word	0xb7a01a3b	! t0_kref+0x1084:   	fstoi	%f27, %f27
	.word	0x9ab3000b	! t0_kref+0x1088:   	orncc	%o4, %o3, %o5
	.word	0xa6b6b026	! t0_kref+0x108c:   	orncc	%i2, -0xfda, %l3
	.word	0x81aecabb	! t0_kref+0x1090:   	fcmpes	%fcc0, %f27, %f27
	.word	0xea7e6000	! t0_kref+0x1094:   	swap	[%i1], %l5
	.word	0x37800006	! t0_kref+0x1098:   	fbge,a	_kref+0x10b0
	.word	0xb5a689da	! t0_kref+0x109c:   	fdivd	%f26, %f26, %f26
	.word	0xd0b01019	! t0_kref+0x10a0:   	stha	%o0, [%g0 + %i1]0x80
	call	SYM(t0_subr1)
	.word	0xa6f2400a	! t0_kref+0x10a8:   	udivcc	%o1, %o2, %l3
	.word	0xf706601c	! t0_kref+0x10ac:   	ld	[%i1 + 0x1c], %f27
	.word	0xd84e4000	! t0_kref+0x10b0:   	ldsb	[%i1], %o4
	.word	0xa932c014	! t0_kref+0x10b4:   	srl	%o3, %l4, %l4
	.word	0x90454000	! t0_kref+0x10b8:   	addc	%l5, %g0, %o0
	.word	0xb7a018da	! t0_kref+0x10bc:   	fdtos	%f26, %f27
	.word	0x94ab4000	! t0_kref+0x10c0:   	andncc	%o5, %g0, %o2
	.word	0xaaa5aa52	! t0_kref+0x10c4:   	subcc	%l6, 0xa52, %l5
	.word	0x9fc10000	! t0_kref+0x10c8:   	call	%g4
	.word	0xe6070019	! t0_kref+0x10cc:   	ld	[%i4 + %i1], %l3
	.word	0xb7a0053b	! t0_kref+0x10d0:   	fsqrts	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0x10d4:   	fsqrts	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x10d8:   	fitos	%f27, %f27
	.word	0xf51e7fe0	! t0_kref+0x10dc:   	ldd	[%i1 - 0x20], %f26
	.word	0x3d480003	! t0_kref+0x10e0:   	fbule,a,pt	%fcc0, _kref+0x10ec
	.word	0xd40e7ff8	! t0_kref+0x10e4:   	ldub	[%i1 - 8], %o2
	.word	0xb7a0189b	! t0_kref+0x10e8:   	fitos	%f27, %f27
	.word	0x909aedce	! t0_kref+0x10ec:   	xorcc	%o3, 0xdce, %o0
	.word	0xb5a0193b	! t0_kref+0x10f0:   	fstod	%f27, %f26
	.word	0xee48a02c	! t0_kref+0x10f4:   	ldsb	[%g2 + 0x2c], %l7
	.word	0x152f1c82	! t0_kref+0x10f8:   	sethi	%hi(0xbc720800), %o2
	.word	0x81aecabb	! t0_kref+0x10fc:   	fcmpes	%fcc0, %f27, %f27
	.word	0x803ae4fd	! t0_kref+0x1100:   	xnor	%o3, 0x4fd, %g0
	.word	0xa6baf110	! t0_kref+0x1104:   	xnorcc	%o3, -0xef0, %l3
	.word	0xed6e7fe8	! t0_kref+0x1108:   	prefetch	%i1 - 0x18, 22
	.word	0x9ed34000	! t0_kref+0x110c:   	umulcc	%o5, %g0, %o7
	.word	0x98126c82	! t0_kref+0x1110:   	or	%o1, 0xc82, %o4
	.word	0x9005b7ad	! t0_kref+0x1114:   	add	%l6, -0x853, %o0
	.word	0xf700a004	! t0_kref+0x1118:   	ld	[%g2 + 4], %f27
	.word	0x96adc00b	! t0_kref+0x111c:   	andncc	%l7, %o3, %o3
	.word	0xb5a0193b	! t0_kref+0x1120:   	fstod	%f27, %f26
	.word	0xe8ce5000	! t0_kref+0x1124:   	ldsba	[%i1]0x80, %l4
	.word	0xf51e401d	! t0_kref+0x1128:   	ldd	[%i1 + %i5], %f26
	.word	0x31480005	! t0_kref+0x112c:   	fba,a,pt	%fcc0, _kref+0x1140
	.word	0x8074c00d	! t0_kref+0x1130:   	udiv	%l3, %o5, %g0
	.word	0xacb57964	! t0_kref+0x1134:   	orncc	%l5, -0x69c, %l6
	.word	0xe6c61000	! t0_kref+0x1138:   	ldswa	[%i0]0x80, %l3
	.word	0x80ad801a	! t0_kref+0x113c:   	andncc	%l6, %i2, %g0
	.word	0x8143c000	! t0_kref+0x1140:   	stbar
	.word	0xaa856718	! t0_kref+0x1144:   	addcc	%l5, 0x718, %l5
	.word	0x942d6053	! t0_kref+0x1148:   	andn	%l5, 0x53, %o2
	.word	0xc12e7fec	! t0_kref+0x114c:   	st	%fsr, [%i1 - 0x14]
	.word	0x94402544	! t0_kref+0x1150:   	addc	%g0, 0x544, %o2
	.word	0xa4ad4014	! t0_kref+0x1154:   	andncc	%l5, %l4, %l2
	.word	0xac0d776a	! t0_kref+0x1158:   	and	%l5, -0x896, %l6
	.word	0xe86e4000	! t0_kref+0x115c:   	ldstub	[%i1], %l4
	.word	0xd416401b	! t0_kref+0x1160:   	lduh	[%i1 + %i3], %o2
	.word	0xf53f4018	! t0_kref+0x1164:   	std	%f26, [%i5 + %i0]
	.word	0x81dc0013	! t0_kref+0x1168:   	flush	%l0 + %l3
	.word	0xd830a000	! t0_kref+0x116c:   	sth	%o4, [%g2]
	.word	0x81aecabb	! t0_kref+0x1170:   	fcmpes	%fcc0, %f27, %f27
	.word	0xe2066018	! t0_kref+0x1174:   	ld	[%i1 + 0x18], %l1
	.word	0x98dd8017	! t0_kref+0x1178:   	smulcc	%l6, %l7, %o4
	call	SYM(t0_subr0)
	.word	0xd6d6d040	! t0_kref+0x1180:   	ldsha	[%i3]0x82, %o3
	.word	0xf700a004	! t0_kref+0x1184:   	ld	[%g2 + 4], %f27
	.word	0xd44e8018	! t0_kref+0x1188:   	ldsb	[%i2 + %i0], %o2
	.word	0xa8520014	! t0_kref+0x118c:   	umul	%o0, %l4, %l4
	.word	0xe600a004	! t0_kref+0x1190:   	ld	[%g2 + 4], %l3
	.word	0xa83578e3	! t0_kref+0x1194:   	orn	%l5, -0x71d, %l4
	.word	0xb5a688da	! t0_kref+0x1198:   	fsubd	%f26, %f26, %f26
	sethi	%hi(2f), %o7
	.word	0xe40be1c4	! t0_kref+0x11a0:   	ldub	[%o7 + 0x1c4], %l2
	.word	0xa41ca00c	! t0_kref+0x11a4:   	xor	%l2, 0xc, %l2
	.word	0xe42be1c4	! t0_kref+0x11a8:   	stb	%l2, [%o7 + 0x1c4]
	.word	0x81dbe1c4	! t0_kref+0x11ac:   	flush	%o7 + 0x1c4
	.word	0x28480008	! t0_kref+0x11b0:   	bleu,a,pt	%icc, _kref+0x11d0
	.word	0xe48e101a	! t0_kref+0x11b4:   	lduba	[%i0 + %i2]0x80, %l2
	.word	0xa83a800d	! t0_kref+0x11b8:   	xnor	%o2, %o5, %l4
	.word	0xf720a00c	! t0_kref+0x11bc:   	st	%f27, [%g2 + 0xc]
	.word	0x81df3b58	! t0_kref+0x11c0:   	flush	%i4 - 0x4a8
2:	.word	0xf706401c	! t0_kref+0x11c4:   	ld	[%i1 + %i4], %f27
	.word	0xe630a03c	! t0_kref+0x11c8:   	sth	%l3, [%g2 + 0x3c]
	.word	0xb5a6895a	! t0_kref+0x11cc:   	fmuld	%f26, %f26, %f26
	.word	0x9fc10000	! t0_kref+0x11d0:   	call	%g4
	.word	0xa8a5be9d	! t0_kref+0x11d4:   	subcc	%l6, -0x163, %l4
	.word	0xf7067ffc	! t0_kref+0x11d8:   	ld	[%i1 - 4], %f27
	.word	0x28800001	! t0_kref+0x11dc:   	bleu,a	_kref+0x11e0
	.word	0x9a8ce8f9	! t0_kref+0x11e0:   	andcc	%l3, 0x8f9, %o5
	.word	0x81aecabb	! t0_kref+0x11e4:   	fcmpes	%fcc0, %f27, %f27
	.word	0x803cc01a	! t0_kref+0x11e8:   	xnor	%l3, %i2, %g0
	.word	0xd03e2000	! t0_kref+0x11ec:   	std	%o0, [%i0]
	.word	0x8143e040	! t0_kref+0x11f0:   	membar	0x40
	.word	0x193dc4b4	! t0_kref+0x11f4:   	sethi	%hi(0xf712d000), %o4
	.word	0x30800006	! t0_kref+0x11f8:   	ba,a	_kref+0x1210
	.word	0xf700a02c	! t0_kref+0x11fc:   	ld	[%g2 + 0x2c], %f27
	.word	0x94a5ec46	! t0_kref+0x1200:   	subcc	%l7, 0xc46, %o2
	.word	0xb5a6895a	! t0_kref+0x1204:   	fmuld	%f26, %f26, %f26
	.word	0xf7062000	! t0_kref+0x1208:   	ld	[%i0], %f27
	.word	0x949b3c01	! t0_kref+0x120c:   	xorcc	%o4, -0x3ff, %o2
	.word	0x2b800008	! t0_kref+0x1210:   	fbug,a	_kref+0x1230
	.word	0xa4f20000	! t0_kref+0x1214:   	udivcc	%o0, %g0, %l2
	.word	0xe6262000	! t0_kref+0x1218:   	st	%l3, [%i0]
	.word	0x22800005	! t0_kref+0x121c:   	be,a	_kref+0x1230
	.word	0xb7a6c8bb	! t0_kref+0x1220:   	fsubs	%f27, %f27, %f27
	.word	0x96bb7b90	! t0_kref+0x1224:   	xnorcc	%o5, -0x470, %o3
	.word	0x96a3392f	! t0_kref+0x1228:   	subcc	%o4, -0x6d1, %o3
	.word	0x28800007	! t0_kref+0x122c:   	bleu,a	_kref+0x1248
	.word	0xf51e2018	! t0_kref+0x1230:   	ldd	[%i0 + 0x18], %f26
	.word	0xe0680018	! t0_kref+0x1234:   	ldstub	[%g0 + %i0], %l0
	.word	0xb7a0053b	! t0_kref+0x1238:   	fsqrts	%f27, %f27
	.word	0xfc56c000	! t0_kref+0x123c:   	ldsh	[%i3], %fp
	.word	0x9a3d66c1	! t0_kref+0x1240:   	xnor	%l5, 0x6c1, %o5
	.word	0xd216401b	! t0_kref+0x1244:   	lduh	[%i1 + %i3], %o1
	.word	0xb7a0003b	! t0_kref+0x1248:   	fmovs	%f27, %f27
	.word	0xde50a034	! t0_kref+0x124c:   	ldsh	[%g2 + 0x34], %o7
	.word	0xb7a0189b	! t0_kref+0x1250:   	fitos	%f27, %f27
	.word	0xea00a000	! t0_kref+0x1254:   	ld	[%g2], %l5
	.word	0xec46200c	! t0_kref+0x1258:   	ldsw	[%i0 + 0xc], %l6
	.word	0x9a424000	! t0_kref+0x125c:   	addc	%o1, %g0, %o5
	call	SYM(t0_subr1)
	.word	0x96d56de4	! t0_kref+0x1264:   	umulcc	%l5, 0xde4, %o3
	.word	0xf700a008	! t0_kref+0x1268:   	ld	[%g2 + 8], %f27
	.word	0xf51e2000	! t0_kref+0x126c:   	ldd	[%i0], %f26
	.word	0xee300018	! t0_kref+0x1270:   	sth	%l7, [%g0 + %i0]
	.word	0xb7a0003b	! t0_kref+0x1274:   	fmovs	%f27, %f27
	.word	0xf51e2018	! t0_kref+0x1278:   	ldd	[%i0 + 0x18], %f26
	.word	0xf51fbec0	! t0_kref+0x127c:   	ldd	[%fp - 0x140], %f26
	.word	0xea6e001a	! t0_kref+0x1280:   	ldstub	[%i0 + %i2], %l5
	.word	0xe1e6100c	! t0_kref+0x1284:   	casa	[%i0]0x80, %o4, %l0
	.word	0xaf32200c	! t0_kref+0x1288:   	srl	%o0, 0xc, %l7
	.word	0xef6e2000	! t0_kref+0x128c:   	prefetch	%i0, 23
	.word	0xb5ab805a	! t0_kref+0x1290:   	fmovdule	%fcc0, %f26, %f26
	.word	0x3f800004	! t0_kref+0x1294:   	fbo,a	_kref+0x12a4
	.word	0xb7a6c93b	! t0_kref+0x1298:   	fmuls	%f27, %f27, %f27
	.word	0xd400a000	! t0_kref+0x129c:   	ld	[%g2], %o2
	.word	0xf51f4018	! t0_kref+0x12a0:   	ldd	[%i5 + %i0], %f26
	.word	0xe840a02c	! t0_kref+0x12a4:   	ldsw	[%g2 + 0x2c], %l4
	.word	0x3a800008	! t0_kref+0x12a8:   	bcc,a	_kref+0x12c8
	.word	0xf51e001d	! t0_kref+0x12ac:   	ldd	[%i0 + %i5], %f26
	.word	0xb7a01a5a	! t0_kref+0x12b0:   	fdtoi	%f26, %f27
	.word	0x95400000	! t0_kref+0x12b4:   	mov	%y, %o2
	.word	0xe210a03e	! t0_kref+0x12b8:   	lduh	[%g2 + 0x3e], %l1
	.word	0xb7a0003b	! t0_kref+0x12bc:   	fmovs	%f27, %f27
	.word	0xf51e7fe0	! t0_kref+0x12c0:   	ldd	[%i1 - 0x20], %f26
	.word	0x81aeca3b	! t0_kref+0x12c4:   	fcmps	%fcc0, %f27, %f27
	.word	0xf7070019	! t0_kref+0x12c8:   	ld	[%i4 + %i1], %f27
	.word	0x3f800007	! t0_kref+0x12cc:   	fbo,a	_kref+0x12e8
	.word	0xb7a6c93b	! t0_kref+0x12d0:   	fmuls	%f27, %f27, %f27
	.word	0x94b34008	! t0_kref+0x12d4:   	orncc	%o5, %o0, %o2
	.word	0x39480003	! t0_kref+0x12d8:   	fbuge,a,pt	%fcc0, _kref+0x12e4
	.word	0xe4000018	! t0_kref+0x12dc:   	ld	[%g0 + %i0], %l2
	.word	0xee10a020	! t0_kref+0x12e0:   	lduh	[%g2 + 0x20], %l7
	.word	0x2d800004	! t0_kref+0x12e4:   	fbg,a	_kref+0x12f4
	.word	0xe6162008	! t0_kref+0x12e8:   	lduh	[%i0 + 8], %l3
	.word	0xa3400000	! t0_kref+0x12ec:   	mov	%y, %l1
	.word	0xf700a00c	! t0_kref+0x12f0:   	ld	[%g2 + 0xc], %f27
	.word	0xd8767ff0	! t0_kref+0x12f4:   	stx	%o4, [%i1 - 0x10]
	.word	0xee20a030	! t0_kref+0x12f8:   	st	%l7, [%g2 + 0x30]
	.word	0x24800008	! t0_kref+0x12fc:   	ble,a	_kref+0x131c
	.word	0xd4380018	! t0_kref+0x1300:   	std	%o2, [%g0 + %i0]
	.word	0xd630a032	! t0_kref+0x1304:   	sth	%o3, [%g2 + 0x32]
	.word	0xe20e401a	! t0_kref+0x1308:   	ldub	[%i1 + %i2], %l1
	.word	0xe27f0019	! t0_kref+0x130c:   	swap	[%i4 + %i1], %l1
	.word	0xe1e6100b	! t0_kref+0x1310:   	casa	[%i0]0x80, %o3, %l0
	.word	0xf207bfe0	! t0_kref+0x1314:   	ld	[%fp - 0x20], %i1
	.word	0xf706001c	! t0_kref+0x1318:   	ld	[%i0 + %i4], %f27
	.word	0xb7a0013b	! t0_kref+0x131c:   	fabss	%f27, %f27
	.word	0x9fc10000	! t0_kref+0x1320:   	call	%g4
	.word	0xb5a0193b	! t0_kref+0x1324:   	fstod	%f27, %f26
	.word	0x9fc00004	! t0_kref+0x1328:   	call	%g0 + %g4
	.word	0xb7a000bb	! t0_kref+0x132c:   	fnegs	%f27, %f27
	.word	0x3c800005	! t0_kref+0x1330:   	bpos,a	_kref+0x1344
	.word	0xd86e2002	! t0_kref+0x1334:   	ldstub	[%i0 + 2], %o4
	.word	0xaa16a342	! t0_kref+0x1338:   	or	%i2, 0x342, %l5
	.word	0x24800005	! t0_kref+0x133c:   	ble,a	_kref+0x1350
	.word	0xb7a6c9bb	! t0_kref+0x1340:   	fdivs	%f27, %f27, %f27
	.word	0x9fc10000	! t0_kref+0x1344:   	call	%g4
	.word	0xb7a0003b	! t0_kref+0x1348:   	fmovs	%f27, %f27
	.word	0xb5a6cd3b	! t0_kref+0x134c:   	fsmuld	%f27, %f27, %f26
	.word	0x2b800006	! t0_kref+0x1350:   	fbug,a	_kref+0x1368
	.word	0xec50a026	! t0_kref+0x1354:   	ldsh	[%g2 + 0x26], %l6
	.word	0xf53f4018	! t0_kref+0x1358:   	std	%f26, [%i5 + %i0]
	.word	0xb7a9003b	! t0_kref+0x135c:   	fmovsl	%fcc0, %f27, %f27
	.word	0xd848a034	! t0_kref+0x1360:   	ldsb	[%g2 + 0x34], %o4
	.word	0xb5a6895a	! t0_kref+0x1364:   	fmuld	%f26, %f26, %f26
	.word	0x31800002	! t0_kref+0x1368:   	fba,a	_kref+0x1370
	.word	0xa615c000	! t0_kref+0x136c:   	or	%l7, %g0, %l3
	.word	0xa9400000	! t0_kref+0x1370:   	mov	%y, %l4
	.word	0x3e800003	! t0_kref+0x1374:   	bvc,a	_kref+0x1380
	.word	0x81580000	! t0_kref+0x1378:   	flushw
	.word	0xb7a0053b	! t0_kref+0x137c:   	fsqrts	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0x1380:   	fsqrts	%f27, %f27
	.word	0x98da4009	! t0_kref+0x1384:   	smulcc	%o1, %o1, %o4
	.word	0xaed26324	! t0_kref+0x1388:   	umulcc	%o1, 0x324, %l7
	.word	0xa446a5b3	! t0_kref+0x138c:   	addc	%i2, 0x5b3, %l2
	.word	0xd4063ff0	! t0_kref+0x1390:   	ld	[%i0 - 0x10], %o2
	.word	0x81ae8ada	! t0_kref+0x1394:   	fcmped	%fcc0, %f26, %f26
	.word	0xb7a6c93b	! t0_kref+0x1398:   	fmuls	%f27, %f27, %f27
	.word	0x9ad4c009	! t0_kref+0x139c:   	umulcc	%l3, %o1, %o5
	.word	0x81580000	! t0_kref+0x13a0:   	flushw
	.word	0xd40e7ff6	! t0_kref+0x13a4:   	ldub	[%i1 - 0xa], %o2
	.word	0xd86e001a	! t0_kref+0x13a8:   	ldstub	[%i0 + %i2], %o4
	.word	0x20480006	! t0_kref+0x13ac:   	bn,a,pt	%icc, _kref+0x13c4
	.word	0xd0080019	! t0_kref+0x13b0:   	ldub	[%g0 + %i1], %o0
	.word	0x98aeb7d7	! t0_kref+0x13b4:   	andncc	%i2, -0x829, %o4
	.word	0xed68a04a	! t0_kref+0x13b8:   	prefetch	%g2 + 0x4a, 22
	.word	0xa27a8016	! t0_kref+0x13bc:   	sdiv	%o2, %l6, %l1
	.word	0xd03f4018	! t0_kref+0x13c0:   	std	%o0, [%i5 + %i0]
	.word	0x30800005	! t0_kref+0x13c4:   	ba,a	_kref+0x13d8
	.word	0xe600a014	! t0_kref+0x13c8:   	ld	[%g2 + 0x14], %l3
	.word	0x2a480004	! t0_kref+0x13cc:   	bcs,a,pt	%icc, _kref+0x13dc
	.word	0xb7a6c9bb	! t0_kref+0x13d0:   	fdivs	%f27, %f27, %f27
	.word	0xf720a038	! t0_kref+0x13d4:   	st	%f27, [%g2 + 0x38]
	.word	0x3f480003	! t0_kref+0x13d8:   	fbo,a,pt	%fcc0, _kref+0x13e4
	.word	0xba103fe8	! t0_kref+0x13dc:   	mov	0xffffffe8, %i5
	.word	0xaaf27673	! t0_kref+0x13e0:   	udivcc	%o1, -0x98d, %l5
	.word	0x24800002	! t0_kref+0x13e4:   	ble,a	_kref+0x13ec
	.word	0x96327844	! t0_kref+0x13e8:   	orn	%o1, -0x7bc, %o3
	.word	0xb7a0053b	! t0_kref+0x13ec:   	fsqrts	%f27, %f27
	.word	0xec9e501d	! t0_kref+0x13f0:   	ldda	[%i1 + %i5]0x80, %l6
	.word	0x28800005	! t0_kref+0x13f4:   	bleu,a	_kref+0x1408
	.word	0xf7070018	! t0_kref+0x13f8:   	ld	[%i4 + %i0], %f27
	.word	0x2c480003	! t0_kref+0x13fc:   	bneg,a,pt	%icc, _kref+0x1408
	.word	0xb7a0189b	! t0_kref+0x1400:   	fitos	%f27, %f27
	.word	0x81830000	! t0_kref+0x1404:   	wr	%o4, %g0, %y
	.word	0x36800005	! t0_kref+0x1408:   	bge,a	_kref+0x141c
	.word	0x965a3618	! t0_kref+0x140c:   	smul	%o0, -0x9e8, %o3
	.word	0xd2c01018	! t0_kref+0x1410:   	ldswa	[%g0 + %i0]0x80, %o1
	.word	0xb7a0003b	! t0_kref+0x1414:   	fmovs	%f27, %f27
	.word	0x98b2e9bd	! t0_kref+0x1418:   	orncc	%o3, 0x9bd, %o4
	.word	0xd4567ffa	! t0_kref+0x141c:   	ldsh	[%i1 - 6], %o2
	.word	0x9f400000	! t0_kref+0x1420:   	mov	%y, %o7
	.word	0xb7a0003b	! t0_kref+0x1424:   	fmovs	%f27, %f27
	.word	0x9b2dc008	! t0_kref+0x1428:   	sll	%l7, %o0, %o5
	.word	0xf5be5000	! t0_kref+0x142c:   	stda	%f26, [%i1]0x80
	.word	0xda780018	! t0_kref+0x1430:   	swap	[%g0 + %i0], %o5
	.word	0x92d5800b	! t0_kref+0x1434:   	umulcc	%l6, %o3, %o1
	.word	0x80d24013	! t0_kref+0x1438:   	umulcc	%o1, %l3, %g0
	.word	0xad38201f	! t0_kref+0x143c:   	sra	%g0, 0x1f, %l6
	.word	0x9415fa27	! t0_kref+0x1440:   	or	%l7, -0x5d9, %o2
	.word	0xaabd0013	! t0_kref+0x1444:   	xnorcc	%l4, %l3, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be084	! t0_kref+0x144c:   	ldub	[%o7 + 0x84], %l2
	.word	0xa41ca00c	! t0_kref+0x1450:   	xor	%l2, 0xc, %l2
	.word	0xe42be084	! t0_kref+0x1454:   	stb	%l2, [%o7 + 0x84]
	.word	0x81dbe084	! t0_kref+0x1458:   	flush	%o7 + 0x84
	.word	0xae624015	! t0_kref+0x145c:   	subc	%o1, %l5, %l7
	.word	0x35800008	! t0_kref+0x1460:   	fbue,a	_kref+0x1480
	.word	0xf59e105d	! t0_kref+0x1464:   	ldda	[%i0 + %i5]0x82, %f26
	.word	0xf786501c	! t0_kref+0x1468:   	lda	[%i1 + %i4]0x80, %f27
	.word	0xa855b04b	! t0_kref+0x146c:   	umul	%l6, -0xfb5, %l4
	.word	0xe82e4000	! t0_kref+0x1470:   	stb	%l4, [%i1]
	.word	0xd8a6101c	! t0_kref+0x1474:   	sta	%o4, [%i0 + %i4]0x80
	.word	0x27480002	! t0_kref+0x1478:   	fbul,a,pt	%fcc0, _kref+0x1480
	.word	0xda00a038	! t0_kref+0x147c:   	ld	[%g2 + 0x38], %o5
	.word	0x94fd3ab7	! t0_kref+0x1480:   	sdivcc	%l4, -0x549, %o2
2:	.word	0xea267fe4	! t0_kref+0x1484:   	st	%l5, [%i1 - 0x1c]
	.word	0x96f3000a	! t0_kref+0x1488:   	udivcc	%o4, %o2, %o3
	.word	0x9e080008	! t0_kref+0x148c:   	and	%g0, %o0, %o7
	.word	0xb7a6c93b	! t0_kref+0x1490:   	fmuls	%f27, %f27, %f27
	.word	0xb7a6c9bb	! t0_kref+0x1494:   	fdivs	%f27, %f27, %f27
	.word	0xaef526ab	! t0_kref+0x1498:   	udivcc	%l4, 0x6ab, %l7
	.word	0x3a800008	! t0_kref+0x149c:   	bcc,a	_kref+0x14bc
	.word	0x81dff677	! t0_kref+0x14a0:   	flush	%i7 - 0x989
	.word	0xb7a01a3b	! t0_kref+0x14a4:   	fstoi	%f27, %f27
	.word	0xee500018	! t0_kref+0x14a8:   	ldsh	[%g0 + %i0], %l7
	.word	0x81ae8a5a	! t0_kref+0x14ac:   	fcmpd	%fcc0, %f26, %f26
	.word	0xd0ce101a	! t0_kref+0x14b0:   	ldsba	[%i0 + %i2]0x80, %o0
	.word	0xb7a6c9bb	! t0_kref+0x14b4:   	fdivs	%f27, %f27, %f27
	.word	0x9f414000	! t0_kref+0x14b8:   	mov	%pc, %o7
	.word	0xb7a0053b	! t0_kref+0x14bc:   	fsqrts	%f27, %f27
	.word	0xc0363ff0	! t0_kref+0x14c0:   	clrh	[%i0 - 0x10]
	.word	0xb7a01a5a	! t0_kref+0x14c4:   	fdtoi	%f26, %f27
	.word	0xc06e401a	! t0_kref+0x14c8:   	ldstub	[%i1 + %i2], %g0
	.word	0xf7063ff8	! t0_kref+0x14cc:   	ld	[%i0 - 8], %f27
	.word	0xb7a6c9bb	! t0_kref+0x14d0:   	fdivs	%f27, %f27, %f27
	.word	0x9e46ad6e	! t0_kref+0x14d4:   	addc	%i2, 0xd6e, %o7
	.word	0xf7067fe4	! t0_kref+0x14d8:   	ld	[%i1 - 0x1c], %f27
	.word	0xc05e6010	! t0_kref+0x14dc:   	ldx	[%i1 + 0x10], %g0
	.word	0xb7a6c93b	! t0_kref+0x14e0:   	fmuls	%f27, %f27, %f27
	.word	0xb5a0193b	! t0_kref+0x14e4:   	fstod	%f27, %f26
	.word	0xac2b621c	! t0_kref+0x14e8:   	andn	%o5, 0x21c, %l6
	.word	0xf700a034	! t0_kref+0x14ec:   	ld	[%g2 + 0x34], %f27
	.word	0xf1be1815	! t0_kref+0x14f0:   	stda	%f24, [%i0 + %l5]0xc0
	.word	0x36480001	! t0_kref+0x14f4:   	bge,a,pt	%icc, _kref+0x14f8
	.word	0xb7a0189b	! t0_kref+0x14f8:   	fitos	%f27, %f27
	.word	0xf700a01c	! t0_kref+0x14fc:   	ld	[%g2 + 0x1c], %f27
	.word	0xa884e381	! t0_kref+0x1500:   	addcc	%l3, 0x381, %l4
	.word	0xb7a0053b	! t0_kref+0x1504:   	fsqrts	%f27, %f27
	.word	0xb7a6c8bb	! t0_kref+0x1508:   	fsubs	%f27, %f27, %f27
	.word	0x3d480007	! t0_kref+0x150c:   	fbule,a,pt	%fcc0, _kref+0x1528
	.word	0x9644c008	! t0_kref+0x1510:   	addc	%l3, %o0, %o3
	.word	0xe06e6002	! t0_kref+0x1514:   	ldstub	[%i1 + 2], %l0
	call	SYM(t0_subr1)
	.word	0xb7a6c93b	! t0_kref+0x151c:   	fmuls	%f27, %f27, %f27
	.word	0xaca03ead	! t0_kref+0x1520:   	subcc	%g0, -0x153, %l6
	.word	0x92c4e612	! t0_kref+0x1524:   	addccc	%l3, 0x612, %o1
	.word	0x9642f00a	! t0_kref+0x1528:   	addc	%o3, -0xff6, %o3
	.word	0xa9400000	! t0_kref+0x152c:   	mov	%y, %l4
	.word	0xc0c65000	! t0_kref+0x1530:   	ldswa	[%i1]0x80, %g0
	.word	0x34800001	! t0_kref+0x1534:   	bg,a	_kref+0x1538
	.word	0x81580000	! t0_kref+0x1538:   	flushw
	.word	0xf53e401d	! t0_kref+0x153c:   	std	%f26, [%i1 + %i5]
	.word	0xf700a004	! t0_kref+0x1540:   	ld	[%g2 + 4], %f27
	.word	0x9138201d	! t0_kref+0x1544:   	sra	%g0, 0x1d, %o0
	.word	0x92a5a7b7	! t0_kref+0x1548:   	subcc	%l6, 0x7b7, %o1
	.word	0xd400a028	! t0_kref+0x154c:   	ld	[%g2 + 0x28], %o2
	.word	0x96f53779	! t0_kref+0x1550:   	udivcc	%l4, -0x887, %o3
	.word	0xaaf36775	! t0_kref+0x1554:   	udivcc	%o5, 0x775, %l5
	.word	0x20800004	! t0_kref+0x1558:   	bn,a	_kref+0x1568
	.word	0x81dc4009	! t0_kref+0x155c:   	flush	%l1 + %o1
	.word	0xe26e601c	! t0_kref+0x1560:   	ldstub	[%i1 + 0x1c], %l1
	.word	0xf7062014	! t0_kref+0x1564:   	ld	[%i0 + 0x14], %f27
	.word	0x22800001	! t0_kref+0x1568:   	be,a	_kref+0x156c
	.word	0x9e2d800b	! t0_kref+0x156c:   	andn	%l6, %o3, %o7
	.word	0x93352017	! t0_kref+0x1570:   	srl	%l4, 0x17, %o1
	.word	0x9a8ac015	! t0_kref+0x1574:   	andcc	%o3, %l5, %o5
	.word	0xec466014	! t0_kref+0x1578:   	ldsw	[%i1 + 0x14], %l6
	.word	0xb5a0193b	! t0_kref+0x157c:   	fstod	%f27, %f26
	.word	0xda566018	! t0_kref+0x1580:   	ldsh	[%i1 + 0x18], %o5
	.word	0xb5a0193b	! t0_kref+0x1584:   	fstod	%f27, %f26
	.word	0x9ab6800c	! t0_kref+0x1588:   	orncc	%i2, %o4, %o5
	.word	0x9eba33d7	! t0_kref+0x158c:   	xnorcc	%o0, -0xc29, %o7
	.word	0xe4086e88	! t0_kref+0x1590:   	ldub	[%g1 + 0xe88], %l2
	.word	0xa41ca00c	! t0_kref+0x1594:   	xor	%l2, 0xc, %l2
	.word	0xe4286e88	! t0_kref+0x1598:   	stb	%l2, [%g1 + 0xe88]
	.word	0x81d86e88	! t0_kref+0x159c:   	flush	%g1 + 0xe88
	.word	0xe6362000	! t0_kref+0x15a0:   	sth	%l3, [%i0]
	.word	0x20480006	! t0_kref+0x15a4:   	bn,a,pt	%icc, _kref+0x15bc
	.word	0xace2c00d	! t0_kref+0x15a8:   	subccc	%o3, %o5, %l6
	.word	0xa4d4c000	! t0_kref+0x15ac:   	umulcc	%l3, %g0, %l2
	call	SYM(t0_subr0)
	.word	0x9252c00b	! t0_kref+0x15b4:   	umul	%o3, %o3, %o1
	.word	0xa23e8017	! t0_kref+0x15b8:   	xnor	%i2, %l7, %l1
	.word	0xf720a02c	! t0_kref+0x15bc:   	st	%f27, [%g2 + 0x2c]
	call	SYM(t0_subr2)
	.word	0xb7a01a5a	! t0_kref+0x15c4:   	fdtoi	%f26, %f27
2:	.word	0xa88273aa	! t0_kref+0x15c8:   	addcc	%o1, -0xc56, %l4
	.word	0x99302013	! t0_kref+0x15cc:   	srl	%g0, 0x13, %o4
	call	SYM(t0_subr0)
	.word	0xf1be580b	! t0_kref+0x15d4:   	stda	%f24, [%i1 + %o3]0xc0
	.word	0xd26e0000	! t0_kref+0x15d8:   	ldstub	[%i0], %o1
	.word	0x2e800005	! t0_kref+0x15dc:   	bvs,a	_kref+0x15f0
	.word	0xb7a0053b	! t0_kref+0x15e0:   	fsqrts	%f27, %f27
	.word	0x96156346	! t0_kref+0x15e4:   	or	%l5, 0x346, %o3
	.word	0x9abd0013	! t0_kref+0x15e8:   	xnorcc	%l4, %l3, %o5
	.word	0x933b4016	! t0_kref+0x15ec:   	sra	%o5, %l6, %o1
	.word	0xb5a688da	! t0_kref+0x15f0:   	fsubd	%f26, %f26, %f26
	.word	0xd43e3ff0	! t0_kref+0x15f4:   	std	%o2, [%i0 - 0x10]
	.word	0xd028a00b	! t0_kref+0x15f8:   	stb	%o0, [%g2 + 0xb]
	.word	0x2a800006	! t0_kref+0x15fc:   	bcs,a	_kref+0x1614
	.word	0x98b2369e	! t0_kref+0x1600:   	orncc	%o0, -0x962, %o4
	call	SYM(t0_subr0)
	.word	0xa8bd6ea1	! t0_kref+0x1608:   	xnorcc	%l5, 0xea1, %l4
	.word	0x9ea4e03b	! t0_kref+0x160c:   	subcc	%l3, 0x3b, %o7
	.word	0xda20a024	! t0_kref+0x1610:   	st	%o5, [%g2 + 0x24]
	.word	0xd0f61000	! t0_kref+0x1614:   	stxa	%o0, [%i0]0x80
	.word	0xa8f54014	! t0_kref+0x1618:   	udivcc	%l5, %l4, %l4
	.word	0xa4f58008	! t0_kref+0x161c:   	udivcc	%l6, %o0, %l2
	.word	0xab408000	! t0_kref+0x1620:   	mov	%ccr, %l5
	.word	0xec00a000	! t0_kref+0x1624:   	ld	[%g2], %l6
	.word	0x81aecabb	! t0_kref+0x1628:   	fcmpes	%fcc0, %f27, %f27
	.word	0xc12f0000	! t0_kref+0x162c:   	st	%fsr, [%i4]
	.word	0xa254ef42	! t0_kref+0x1630:   	umul	%l3, 0xf42, %l1
	.word	0xf720a008	! t0_kref+0x1634:   	st	%f27, [%g2 + 8]
	.word	0x24480008	! t0_kref+0x1638:   	ble,a,pt	%icc, _kref+0x1658
	.word	0xe86e8018	! t0_kref+0x163c:   	ldstub	[%i2 + %i0], %l4
	.word	0x94056b91	! t0_kref+0x1640:   	add	%l5, 0xb91, %o2
	.word	0x96b5aeaf	! t0_kref+0x1644:   	orncc	%l6, 0xeaf, %o3
	.word	0xb7a0189b	! t0_kref+0x1648:   	fitos	%f27, %f27
	.word	0xe4167fee	! t0_kref+0x164c:   	lduh	[%i1 - 0x12], %l2
	.word	0x81ae8a5a	! t0_kref+0x1650:   	fcmpd	%fcc0, %f26, %f26
	.word	0x81ae8ada	! t0_kref+0x1654:   	fcmped	%fcc0, %f26, %f26
	.word	0xa256b38f	! t0_kref+0x1658:   	umul	%i2, -0xc71, %l1
	.word	0x8d837f85	! t0_kref+0x165c:   	wr	%o5, 0xffffff85, %fprs
	.word	0xe4086f5c	! t0_kref+0x1660:   	ldub	[%g1 + 0xf5c], %l2
	.word	0xa41ca00c	! t0_kref+0x1664:   	xor	%l2, 0xc, %l2
	.word	0xe4286f5c	! t0_kref+0x1668:   	stb	%l2, [%g1 + 0xf5c]
	.word	0x81d86f5c	! t0_kref+0x166c:   	flush	%g1 + 0xf5c
	.word	0x81ae8a5a	! t0_kref+0x1670:   	fcmpd	%fcc0, %f26, %f26
	.word	0xe44e401a	! t0_kref+0x1674:   	ldsb	[%i1 + %i2], %l2
	.word	0x81ae8a5a	! t0_kref+0x1678:   	fcmpd	%fcc0, %f26, %f26
	.word	0x9f3d8015	! t0_kref+0x167c:   	sra	%l6, %l5, %o7
	.word	0x2a800003	! t0_kref+0x1680:   	bcs,a	_kref+0x168c
	.word	0xea060000	! t0_kref+0x1684:   	ld	[%i0], %l5
	.word	0xe24e200f	! t0_kref+0x1688:   	ldsb	[%i0 + 0xf], %l1
	.word	0x80358000	! t0_kref+0x168c:   	orn	%l6, %g0, %g0
	.word	0xec6e8018	! t0_kref+0x1690:   	ldstub	[%i2 + %i0], %l6
	.word	0xd4380018	! t0_kref+0x1694:   	std	%o2, [%g0 + %i0]
	.word	0x9332000b	! t0_kref+0x1698:   	srl	%o0, %o3, %o1
2:	.word	0xf780105c	! t0_kref+0x169c:   	lda	[%g0 + %i4]0x82, %f27
	.word	0xd02e401a	! t0_kref+0x16a0:   	stb	%o0, [%i1 + %i2]
	.word	0xd810a036	! t0_kref+0x16a4:   	lduh	[%g2 + 0x36], %o4
	.word	0x97368013	! t0_kref+0x16a8:   	srl	%i2, %l3, %o3
	.word	0xe208a016	! t0_kref+0x16ac:   	ldub	[%g2 + 0x16], %l1
	.word	0xb7a018da	! t0_kref+0x16b0:   	fdtos	%f26, %f27
	.word	0xec56c019	! t0_kref+0x16b4:   	ldsh	[%i3 + %i1], %l6
	.word	0x965dc00b	! t0_kref+0x16b8:   	smul	%l7, %o3, %o3
	.word	0xac283343	! t0_kref+0x16bc:   	andn	%g0, -0xcbd, %l6
	.word	0xf720a018	! t0_kref+0x16c0:   	st	%f27, [%g2 + 0x18]
	.word	0xf1be188a	! t0_kref+0x16c4:   	stda	%f24, [%i0 + %o2]0xc4
	.word	0xe448a015	! t0_kref+0x16c8:   	ldsb	[%g2 + 0x15], %l2
	.word	0x81df61b8	! t0_kref+0x16cc:   	flush	%i5 + 0x1b8
	.word	0xf19e5a1d	! t0_kref+0x16d0:   	ldda	[%i1 + %i5]0xd0, %f24
	.word	0xe6480018	! t0_kref+0x16d4:   	ldsb	[%g0 + %i0], %l3
	.word	0x81dbfb13	! t0_kref+0x16d8:   	flush	%o7 - 0x4ed
	.word	0xe86e401a	! t0_kref+0x16dc:   	ldstub	[%i1 + %i2], %l4
	.word	0x98750017	! t0_kref+0x16e0:   	udiv	%l4, %l7, %o4
	.word	0xd610a006	! t0_kref+0x16e4:   	lduh	[%g2 + 6], %o3
	.word	0x81de8019	! t0_kref+0x16e8:   	flush	%i2 + %i1
	.word	0xf76e7ff8	! t0_kref+0x16ec:   	prefetch	%i1 - 8, 27
	.word	0x37480001	! t0_kref+0x16f0:   	fbge,a,pt	%fcc0, _kref+0x16f4
	.word	0xb7a6c9bb	! t0_kref+0x16f4:   	fdivs	%f27, %f27, %f27
	.word	0xc36e4000	! t0_kref+0x16f8:   	prefetch	%i1, 1
	.word	0xb5a689da	! t0_kref+0x16fc:   	fdivd	%f26, %f26, %f26
	.word	0x94d68008	! t0_kref+0x1700:   	umulcc	%i2, %o0, %o2
	.word	0x81380009	! t0_kref+0x1704:   	sra	%g0, %o1, %g0
	.word	0x900aaec5	! t0_kref+0x1708:   	and	%o2, 0xec5, %o0
	.word	0x9fc10000	! t0_kref+0x170c:   	call	%g4
	.word	0xec9e5000	! t0_kref+0x1710:   	ldda	[%i1]0x80, %l6
	.word	0xb5a6895a	! t0_kref+0x1714:   	fmuld	%f26, %f26, %f26
	.word	0xb5a6cd3b	! t0_kref+0x1718:   	fsmuld	%f27, %f27, %f26
	.word	0x3e800006	! t0_kref+0x171c:   	bvc,a	_kref+0x1734
	.word	0xb7a6c8bb	! t0_kref+0x1720:   	fsubs	%f27, %f27, %f27
	.word	0x22800006	! t0_kref+0x1724:   	be,a	_kref+0x173c
	.word	0xe648a033	! t0_kref+0x1728:   	ldsb	[%g2 + 0x33], %l3
	.word	0x9822400c	! t0_kref+0x172c:   	sub	%o1, %o4, %o4
	.word	0x98532b9a	! t0_kref+0x1730:   	umul	%o4, 0xb9a, %o4
	.word	0x9fc10000	! t0_kref+0x1734:   	call	%g4
	.word	0xe216c018	! t0_kref+0x1738:   	lduh	[%i3 + %i0], %l1
	.word	0xe9e6100c	! t0_kref+0x173c:   	casa	[%i0]0x80, %o4, %l4
	.word	0xc020a028	! t0_kref+0x1740:   	clr	[%g2 + 0x28]
	.word	0x91418000	! t0_kref+0x1744:   	mov	%fprs, %o0
	.word	0x81aecabb	! t0_kref+0x1748:   	fcmpes	%fcc0, %f27, %f27
	.word	0xb5a688da	! t0_kref+0x174c:   	fsubd	%f26, %f26, %f26
	.word	0xf7267fe4	! t0_kref+0x1750:   	st	%f27, [%i1 - 0x1c]
	.word	0x9fc10000	! t0_kref+0x1754:   	call	%g4
	.word	0xa80aebe4	! t0_kref+0x1758:   	and	%o3, 0xbe4, %l4
	.word	0x81aecabb	! t0_kref+0x175c:   	fcmpes	%fcc0, %f27, %f27
	.word	0xb7a0053b	! t0_kref+0x1760:   	fsqrts	%f27, %f27
	.word	0xdad01018	! t0_kref+0x1764:   	ldsha	[%g0 + %i0]0x80, %o5
	.word	0xf1be600a	! t0_kref+0x1768:   	stda	%f24, [%i1 + 0xa]%asi
	.word	0xa4430016	! t0_kref+0x176c:   	addc	%o4, %l6, %l2
	.word	0xf19f1a18	! t0_kref+0x1770:   	ldda	[%i4 + %i0]0xd0, %f24
	.word	0x30800004	! t0_kref+0x1774:   	ba,a	_kref+0x1784
	.word	0xb7a0053b	! t0_kref+0x1778:   	fsqrts	%f27, %f27
	.word	0xc807bfe8	! t0_kref+0x177c:   	ld	[%fp - 0x18], %g4
	.word	0xf7263fe8	! t0_kref+0x1780:   	st	%f27, [%i0 - 0x18]
	.word	0xf53e3fe8	! t0_kref+0x1784:   	std	%f26, [%i0 - 0x18]
	.word	0x9a65800d	! t0_kref+0x1788:   	subc	%l6, %o5, %o5
	.word	0xb7a6c83b	! t0_kref+0x178c:   	fadds	%f27, %f27, %f27
	.word	0xde40a014	! t0_kref+0x1790:   	ldsw	[%g2 + 0x14], %o7
	.word	0xe87e6014	! t0_kref+0x1794:   	swap	[%i1 + 0x14], %l4
	.word	0xe8263ffc	! t0_kref+0x1798:   	st	%l4, [%i0 - 4]
	.word	0x38800002	! t0_kref+0x179c:   	bgu,a	_kref+0x17a4
	.word	0xf700a004	! t0_kref+0x17a0:   	ld	[%g2 + 4], %f27
	sethi	%hi(2f), %o7
	.word	0xe40be3bc	! t0_kref+0x17a8:   	ldub	[%o7 + 0x3bc], %l2
	.word	0xa41ca00c	! t0_kref+0x17ac:   	xor	%l2, 0xc, %l2
	.word	0xe42be3bc	! t0_kref+0x17b0:   	stb	%l2, [%o7 + 0x3bc]
	.word	0x81dbe3bc	! t0_kref+0x17b4:   	flush	%o7 + 0x3bc
	.word	0xf1be7fe4	! t0_kref+0x17b8:   	stda	%f24, [%i1 - 0x1c]%asi
2:	.word	0xe60e0000	! t0_kref+0x17bc:   	ldub	[%i0], %l3
	.word	0xf5bf5018	! t0_kref+0x17c0:   	stda	%f26, [%i5 + %i0]0x80
	.word	0xf51f4018	! t0_kref+0x17c4:   	ldd	[%i5 + %i0], %f26
	.word	0xf7067fe0	! t0_kref+0x17c8:   	ld	[%i1 - 0x20], %f27
	.word	0xf726600c	! t0_kref+0x17cc:   	st	%f27, [%i1 + 0xc]
	.word	0x9335800d	! t0_kref+0x17d0:   	srl	%l6, %o5, %o1
	.word	0x969db603	! t0_kref+0x17d4:   	xorcc	%l6, -0x9fd, %o3
	.word	0x81ae8ada	! t0_kref+0x17d8:   	fcmped	%fcc0, %f26, %f26
	.word	0xf53e4000	! t0_kref+0x17dc:   	std	%f26, [%i1]
	.word	0x9fc00004	! t0_kref+0x17e0:   	call	%g0 + %g4
	.word	0xd848a036	! t0_kref+0x17e4:   	ldsb	[%g2 + 0x36], %o4
	.word	0x908a801a	! t0_kref+0x17e8:   	andcc	%o2, %i2, %o0
	.word	0xf426401c	! t0_kref+0x17ec:   	st	%i2, [%i1 + %i4]
	.word	0x940abe33	! t0_kref+0x17f0:   	and	%o2, -0x1cd, %o2
	.word	0x172c4a7c	! t0_kref+0x17f4:   	sethi	%hi(0xb129f000), %o3
	.word	0xf7064000	! t0_kref+0x17f8:   	ld	[%i1], %f27
	.word	0xf700a024	! t0_kref+0x17fc:   	ld	[%g2 + 0x24], %f27
	.word	0x36800005	! t0_kref+0x1800:   	bge,a	_kref+0x1814
	.word	0xf59f5018	! t0_kref+0x1804:   	ldda	[%i5 + %i0]0x80, %f26
	.word	0x80f5000c	! t0_kref+0x1808:   	udivcc	%l4, %o4, %g0
	.word	0xb7a018da	! t0_kref+0x180c:   	fdtos	%f26, %f27
	.word	0xe4c71019	! t0_kref+0x1810:   	ldswa	[%i4 + %i1]0x80, %l2
	.word	0x97302008	! t0_kref+0x1814:   	srl	%g0, 0x8, %o3
	.word	0x80acebd9	! t0_kref+0x1818:   	andncc	%l3, 0xbd9, %g0
	.word	0x9b34e00f	! t0_kref+0x181c:   	srl	%l3, 0xf, %o5
	.word	0x9665ba27	! t0_kref+0x1820:   	subc	%l6, -0x5d9, %o3
	.word	0xb7a0013b	! t0_kref+0x1824:   	fabss	%f27, %f27
	.word	0xd278a018	! t0_kref+0x1828:   	swap	[%g2 + 0x18], %o1
	.word	0x37480003	! t0_kref+0x182c:   	fbge,a,pt	%fcc0, _kref+0x1838
	.word	0xd0563fe8	! t0_kref+0x1830:   	ldsh	[%i0 - 0x18], %o0
	.word	0x81df000a	! t0_kref+0x1834:   	flush	%i4 + %o2
	.word	0xa4f22712	! t0_kref+0x1838:   	udivcc	%o0, 0x712, %l2
	.word	0x9fc00004	! t0_kref+0x183c:   	call	%g0 + %g4
	.word	0xb7a01a3b	! t0_kref+0x1840:   	fstoi	%f27, %f27
	.word	0x27800006	! t0_kref+0x1844:   	fbul,a	_kref+0x185c
	.word	0xaada000d	! t0_kref+0x1848:   	smulcc	%o0, %o5, %l5
	.word	0xaaf34000	! t0_kref+0x184c:   	udivcc	%o5, %g0, %l5
	.word	0x99326003	! t0_kref+0x1850:   	srl	%o1, 0x3, %o4
	.word	0xaa3dc008	! t0_kref+0x1854:   	xnor	%l7, %o0, %l5
	.word	0xf7062010	! t0_kref+0x1858:   	ld	[%i0 + 0x10], %f27
	.word	0xe8500019	! t0_kref+0x185c:   	ldsh	[%g0 + %i1], %l4
	.word	0xaf3b2005	! t0_kref+0x1860:   	sra	%o4, 0x5, %l7
	.word	0x20800003	! t0_kref+0x1864:   	bn,a	_kref+0x1870
	.word	0xb7a6c9bb	! t0_kref+0x1868:   	fdivs	%f27, %f27, %f27
	.word	0xda28a011	! t0_kref+0x186c:   	stb	%o5, [%g2 + 0x11]
	.word	0x9644c017	! t0_kref+0x1870:   	addc	%l3, %l7, %o3
	.word	0x81ae8ada	! t0_kref+0x1874:   	fcmped	%fcc0, %f26, %f26
	.word	0xf51fbd60	! t0_kref+0x1878:   	ldd	[%fp - 0x2a0], %f26
	.word	0xd04e8019	! t0_kref+0x187c:   	ldsb	[%i2 + %i1], %o0
	.word	0xf5981019	! t0_kref+0x1880:   	ldda	[%g0 + %i1]0x80, %f26
	.word	0x80c2800d	! t0_kref+0x1884:   	addccc	%o2, %o5, %g0
	.word	0xaea27dbd	! t0_kref+0x1888:   	subcc	%o1, -0x243, %l7
	.word	0x911b401a	! t0_kref+0x188c:   	tsubcctv	%o5, %i2, %o0
	.word	0x8143c000	! t0_kref+0x1890:   	stbar
	.word	0xa9670014	! t0_kref+0x1894:   	movgu	%icc, %l4, %l4
	.word	0xb5a0193b	! t0_kref+0x1898:   	fstod	%f27, %f26
	.word	0xda270018	! t0_kref+0x189c:   	st	%o5, [%i4 + %i0]
	.word	0x36480001	! t0_kref+0x18a0:   	bge,a,pt	%icc, _kref+0x18a4
	.word	0xf700a014	! t0_kref+0x18a4:   	ld	[%g2 + 0x14], %f27
	.word	0xb7a01a3b	! t0_kref+0x18a8:   	fstoi	%f27, %f27
	.word	0x900d7d37	! t0_kref+0x18ac:   	and	%l5, -0x2c9, %o0
	.word	0xf700a038	! t0_kref+0x18b0:   	ld	[%g2 + 0x38], %f27
	.word	0x3c480003	! t0_kref+0x18b4:   	bpos,a,pt	%icc, _kref+0x18c0
	.word	0xd01e3ff8	! t0_kref+0x18b8:   	ldd	[%i0 - 8], %o0
	.word	0xee28a015	! t0_kref+0x18bc:   	stb	%l7, [%g2 + 0x15]
	.word	0xb7a6c93b	! t0_kref+0x18c0:   	fmuls	%f27, %f27, %f27
	.word	0xd616201e	! t0_kref+0x18c4:   	lduh	[%i0 + 0x1e], %o3
	.word	0x36800008	! t0_kref+0x18c8:   	bge,a	_kref+0x18e8
	.word	0xb5a6895a	! t0_kref+0x18cc:   	fmuld	%f26, %f26, %f26
	.word	0x30800007	! t0_kref+0x18d0:   	ba,a	_kref+0x18ec
	.word	0x9ab2a13c	! t0_kref+0x18d4:   	orncc	%o2, 0x13c, %o5
	.word	0x81aecabb	! t0_kref+0x18d8:   	fcmpes	%fcc0, %f27, %f27
	.word	0x9a532392	! t0_kref+0x18dc:   	umul	%o4, 0x392, %o5
	.word	0xe47e601c	! t0_kref+0x18e0:   	swap	[%i1 + 0x1c], %l2
	.word	0x91400000	! t0_kref+0x18e4:   	mov	%y, %o0
	.word	0x9855400d	! t0_kref+0x18e8:   	umul	%l5, %o5, %o4
	.word	0xa91836e7	! t0_kref+0x18ec:   	tsubcctv	%g0, -0x919, %l4
	call	SYM(t0_subr2)
	.word	0x9ac30016	! t0_kref+0x18f4:   	addccc	%o4, %l6, %o5
	.word	0xb5a688da	! t0_kref+0x18f8:   	fsubd	%f26, %f26, %f26
	.word	0x81aeca3b	! t0_kref+0x18fc:   	fcmps	%fcc0, %f27, %f27
	.word	0xe4ff1018	! t0_kref+0x1900:   	swapa	[%i4 + %i0]0x80, %l2
	.word	0xa2c00008	! t0_kref+0x1904:   	addccc	%g0, %o0, %l1
	.word	0xd8871019	! t0_kref+0x1908:   	lda	[%i4 + %i1]0x80, %o4
	.word	0x96527fc8	! t0_kref+0x190c:   	umul	%o1, -0x38, %o3
	.word	0xb7a6c93b	! t0_kref+0x1910:   	fmuls	%f27, %f27, %f27
	.word	0xd240a030	! t0_kref+0x1914:   	ldsw	[%g2 + 0x30], %o1
	.word	0xaa5b64ab	! t0_kref+0x1918:   	smul	%o5, 0x4ab, %l5
	.word	0xb5a689da	! t0_kref+0x191c:   	fdivd	%f26, %f26, %f26
	.word	0x8143c000	! t0_kref+0x1920:   	stbar
	.word	0xaab6afbc	! t0_kref+0x1924:   	orncc	%i2, 0xfbc, %l5
	.word	0xb7a0013b	! t0_kref+0x1928:   	fabss	%f27, %f27
	.word	0xf700a014	! t0_kref+0x192c:   	ld	[%g2 + 0x14], %f27
	.word	0xe8000018	! t0_kref+0x1930:   	ld	[%g0 + %i0], %l4
	.word	0xee00a00c	! t0_kref+0x1934:   	ld	[%g2 + 0xc], %l7
	.word	0xf706401c	! t0_kref+0x1938:   	ld	[%i1 + %i4], %f27
	.word	0x8143c000	! t0_kref+0x193c:   	stbar
	.word	0xe600a028	! t0_kref+0x1940:   	ld	[%g2 + 0x28], %l3
	.word	0xb7a0013b	! t0_kref+0x1944:   	fabss	%f27, %f27
	.word	0xae62e660	! t0_kref+0x1948:   	subc	%o3, 0x660, %l7
	.word	0xde0e401a	! t0_kref+0x194c:   	ldub	[%i1 + %i2], %o7
	.word	0xa82aa281	! t0_kref+0x1950:   	andn	%o2, 0x281, %l4
	.word	0x81aecabb	! t0_kref+0x1954:   	fcmpes	%fcc0, %f27, %f27
	.word	0x81dd8017	! t0_kref+0x1958:   	flush	%l6 + %l7
	.word	0xaa4325f7	! t0_kref+0x195c:   	addc	%o4, 0x5f7, %l5
	.word	0x80bb0015	! t0_kref+0x1960:   	xnorcc	%o4, %l5, %g0
	.word	0xe450a03a	! t0_kref+0x1964:   	ldsh	[%g2 + 0x3a], %l2
	.word	0x90b5aad5	! t0_kref+0x1968:   	orncc	%l6, 0xad5, %o0
	.word	0xa63b001a	! t0_kref+0x196c:   	xnor	%o4, %i2, %l3
	.word	0x9aae800a	! t0_kref+0x1970:   	andncc	%i2, %o2, %o5
	.word	0xd03e7ff0	! t0_kref+0x1974:   	std	%o0, [%i1 - 0x10]
	.word	0xf5380019	! t0_kref+0x1978:   	std	%f26, [%g0 + %i1]
	.word	0xb7a000bb	! t0_kref+0x197c:   	fnegs	%f27, %f27
	.word	0xaca20016	! t0_kref+0x1980:   	subcc	%o0, %l6, %l6
	.word	0xf51fbe58	! t0_kref+0x1984:   	ldd	[%fp - 0x1a8], %f26
	.word	0xda564000	! t0_kref+0x1988:   	ldsh	[%i1], %o5
	.word	0x96d33170	! t0_kref+0x198c:   	umulcc	%o4, -0xe90, %o3
	.word	0xb7a6c93b	! t0_kref+0x1990:   	fmuls	%f27, %f27, %f27
	.word	0xf7200019	! t0_kref+0x1994:   	st	%f27, [%g0 + %i1]
	.word	0xda6e0000	! t0_kref+0x1998:   	ldstub	[%i0], %o5
	sethi	%hi(2f), %o7
	.word	0xe40be1e8	! t0_kref+0x19a0:   	ldub	[%o7 + 0x1e8], %l2
	.word	0xa41ca00c	! t0_kref+0x19a4:   	xor	%l2, 0xc, %l2
	.word	0xe42be1e8	! t0_kref+0x19a8:   	stb	%l2, [%o7 + 0x1e8]
	.word	0x81dbe1e8	! t0_kref+0x19ac:   	flush	%o7 + 0x1e8
	.word	0xf51fbec0	! t0_kref+0x19b0:   	ldd	[%fp - 0x140], %f26
	.word	0xf7067ff0	! t0_kref+0x19b4:   	ld	[%i1 - 0x10], %f27
	.word	0x29480005	! t0_kref+0x19b8:   	fbl,a,pt	%fcc0, _kref+0x19cc
	.word	0xe656600c	! t0_kref+0x19bc:   	ldsh	[%i1 + 0xc], %l3
	.word	0x8d85b9b2	! t0_kref+0x19c0:   	wr	%l6, 0xfffff9b2, %fprs
	.word	0xf5180018	! t0_kref+0x19c4:   	ldd	[%g0 + %i0], %f26
	.word	0x2e800001	! t0_kref+0x19c8:   	bvs,a	_kref+0x19cc
	.word	0xae8de770	! t0_kref+0x19cc:   	andcc	%l7, 0x770, %l7
	.word	0xfc3f4005	! t0_kref+0x19d0:   	std	%fp, [%i5 + %g5]
	.word	0xb7a018da	! t0_kref+0x19d4:   	fdtos	%f26, %f27
	.word	0xf3ee101c	! t0_kref+0x19d8:   	prefetcha	%i0 + %i4, 25
	.word	0x81dd273c	! t0_kref+0x19dc:   	flush	%l4 + 0x73c
	.word	0xb5a689da	! t0_kref+0x19e0:   	fdivd	%f26, %f26, %f26
	.word	0x3f800007	! t0_kref+0x19e4:   	fbo,a	_kref+0x1a00
2:	.word	0xa0a575e2	! t0_kref+0x19e8:   	subcc	%l5, -0xa1e, %l0
	.word	0xb7a000bb	! t0_kref+0x19ec:   	fnegs	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0x19f0:   	fsqrts	%f27, %f27
	.word	0xae280013	! t0_kref+0x19f4:   	andn	%g0, %l3, %l7
	.word	0x81aeca3b	! t0_kref+0x19f8:   	fcmps	%fcc0, %f27, %f27
	.word	0xe616401b	! t0_kref+0x19fc:   	lduh	[%i1 + %i3], %l3
	.word	0xf1be5888	! t0_kref+0x1a00:   	stda	%f24, [%i1 + %o0]0xc4
	.word	0x9b3a0015	! t0_kref+0x1a04:   	sra	%o0, %l5, %o5
	.word	0xb5a6cd3b	! t0_kref+0x1a08:   	fsmuld	%f27, %f27, %f26
	.word	0xad3a2009	! t0_kref+0x1a0c:   	sra	%o0, 0x9, %l6
	.word	0xa6bd286a	! t0_kref+0x1a10:   	xnorcc	%l4, 0x86a, %l3
	.word	0xf700a03c	! t0_kref+0x1a14:   	ld	[%g2 + 0x3c], %f27
	.word	0x33480007	! t0_kref+0x1a18:   	fbe,a,pt	%fcc0, _kref+0x1a34
	.word	0xdac6101c	! t0_kref+0x1a1c:   	ldswa	[%i0 + %i4]0x80, %o5
	.word	0xe4070019	! t0_kref+0x1a20:   	ld	[%i4 + %i1], %l2
	.word	0xb7a6c9bb	! t0_kref+0x1a24:   	fdivs	%f27, %f27, %f27
	.word	0x96a5c013	! t0_kref+0x1a28:   	subcc	%l7, %l3, %o3
	.word	0x24800007	! t0_kref+0x1a2c:   	ble,a	_kref+0x1a48
	.word	0xe8063fe4	! t0_kref+0x1a30:   	ld	[%i0 - 0x1c], %l4
	.word	0x9b400000	! t0_kref+0x1a34:   	mov	%y, %o5
	.word	0xeeb6101b	! t0_kref+0x1a38:   	stha	%l7, [%i0 + %i3]0x80
	.word	0xb7a0013b	! t0_kref+0x1a3c:   	fabss	%f27, %f27
	.word	0xd4066014	! t0_kref+0x1a40:   	ld	[%i1 + 0x14], %o2
	.word	0xec0e201b	! t0_kref+0x1a44:   	ldub	[%i0 + 0x1b], %l6
	.word	0x2f800003	! t0_kref+0x1a48:   	fbu,a	_kref+0x1a54
	.word	0xe27e2004	! t0_kref+0x1a4c:   	swap	[%i0 + 4], %l1
	.word	0x907e800b	! t0_kref+0x1a50:   	sdiv	%i2, %o3, %o0
	.word	0xb7a0013b	! t0_kref+0x1a54:   	fabss	%f27, %f27
	.word	0xb7a018da	! t0_kref+0x1a58:   	fdtos	%f26, %f27
	.word	0xae522a21	! t0_kref+0x1a5c:   	umul	%o0, 0xa21, %l7
	.word	0xf720a02c	! t0_kref+0x1a60:   	st	%f27, [%g2 + 0x2c]
	.word	0xde50a00e	! t0_kref+0x1a64:   	ldsh	[%g2 + 0xe], %o7
	.word	0xb7a01a5a	! t0_kref+0x1a68:   	fdtoi	%f26, %f27
	.word	0x8143e064	! t0_kref+0x1a6c:   	membar	0x64
	.word	0x3b480004	! t0_kref+0x1a70:   	fble,a,pt	%fcc0, _kref+0x1a80
	.word	0xb7a0003b	! t0_kref+0x1a74:   	fmovs	%f27, %f27
	.word	0xb7a0053b	! t0_kref+0x1a78:   	fsqrts	%f27, %f27
	.word	0x31800008	! t0_kref+0x1a7c:   	fba,a	_kref+0x1a9c
	.word	0xf19f1a59	! t0_kref+0x1a80:   	ldda	[%i4 + %i1]0xd2, %f24
	.word	0xb7a018da	! t0_kref+0x1a84:   	fdtos	%f26, %f27
	.word	0xe628a028	! t0_kref+0x1a88:   	stb	%l3, [%g2 + 0x28]
	.word	0xf51fbce0	! t0_kref+0x1a8c:   	ldd	[%fp - 0x320], %f26
	.word	0xa8458015	! t0_kref+0x1a90:   	addc	%l6, %l5, %l4
	.word	0xe9e65014	! t0_kref+0x1a94:   	casa	[%i1]0x80, %l4, %l4
	.word	0xb7a01a5a	! t0_kref+0x1a98:   	fdtoi	%f26, %f27
	.word	0x96ab3378	! t0_kref+0x1a9c:   	andncc	%o4, -0xc88, %o3
	.word	0xb7a0053b	! t0_kref+0x1aa0:   	fsqrts	%f27, %f27
	.word	0xc048a03e	! t0_kref+0x1aa4:   	ldsb	[%g2 + 0x3e], %g0
	.word	0xc07e0000	! t0_kref+0x1aa8:   	swap	[%i0], %g0
	.word	0xb7a0053b	! t0_kref+0x1aac:   	fsqrts	%f27, %f27
	.word	0xb7a018da	! t0_kref+0x1ab0:   	fdtos	%f26, %f27
	.word	0x9e3dfa10	! t0_kref+0x1ab4:   	xnor	%l7, -0x5f0, %o7
	.word	0xb7a6c8bb	! t0_kref+0x1ab8:   	fsubs	%f27, %f27, %f27
	.word	0xf700a020	! t0_kref+0x1abc:   	ld	[%g2 + 0x20], %f27
	.word	0x929dedc7	! t0_kref+0x1ac0:   	xorcc	%l7, 0xdc7, %o1
	.word	0xf7262008	! t0_kref+0x1ac4:   	st	%f27, [%i0 + 8]
	.word	0xb7a0003b	! t0_kref+0x1ac8:   	fmovs	%f27, %f27
	.word	0xf7066014	! t0_kref+0x1acc:   	ld	[%i1 + 0x14], %f27
	.word	0x81aeca3b	! t0_kref+0x1ad0:   	fcmps	%fcc0, %f27, %f27
	.word	0xb7a0189b	! t0_kref+0x1ad4:   	fitos	%f27, %f27
	.word	0xb7a0003b	! t0_kref+0x1ad8:   	fmovs	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x1adc:   	fitos	%f27, %f27
	.word	0x2d800005	! t0_kref+0x1ae0:   	fbg,a	_kref+0x1af4
	.word	0xb7a0013b	! t0_kref+0x1ae4:   	fabss	%f27, %f27
	.word	0x21480005	! t0_kref+0x1ae8:   	fbn,a,pt	%fcc0, _kref+0x1afc
	.word	0xb7a6c93b	! t0_kref+0x1aec:   	fmuls	%f27, %f27, %f27
	.word	0xd000a028	! t0_kref+0x1af0:   	ld	[%g2 + 0x28], %o0
	.word	0xf53e7fe8	! t0_kref+0x1af4:   	std	%f26, [%i1 - 0x18]
	.word	0xee30a022	! t0_kref+0x1af8:   	sth	%l7, [%g2 + 0x22]
	.word	0xb5a688da	! t0_kref+0x1afc:   	fsubd	%f26, %f26, %f26
	.word	0xd856200c	! t0_kref+0x1b00:   	ldsh	[%i0 + 0xc], %o4
	.word	0x962a800b	! t0_kref+0x1b04:   	andn	%o2, %o3, %o3
	.word	0xaef5b8d2	! t0_kref+0x1b08:   	udivcc	%l6, -0x72e, %l7
	.word	0x94dafce6	! t0_kref+0x1b0c:   	smulcc	%o3, -0x31a, %o2
	.word	0x9f3a4014	! t0_kref+0x1b10:   	sra	%o1, %l4, %o7
	.word	0xb7a0189b	! t0_kref+0x1b14:   	fitos	%f27, %f27
	.word	0xda200019	! t0_kref+0x1b18:   	st	%o5, [%g0 + %i1]
	.word	0x36800008	! t0_kref+0x1b1c:   	bge,a	_kref+0x1b3c
	.word	0xa83d3d19	! t0_kref+0x1b20:   	xnor	%l4, -0x2e7, %l4
	.word	0xd24e2001	! t0_kref+0x1b24:   	ldsb	[%i0 + 1], %o1
	.word	0x9b300017	! t0_kref+0x1b28:   	srl	%g0, %l7, %o5
	.word	0xea36001b	! t0_kref+0x1b2c:   	sth	%l5, [%i0 + %i3]
	.word	0x34800001	! t0_kref+0x1b30:   	bg,a	_kref+0x1b34
	.word	0xea264000	! t0_kref+0x1b34:   	st	%l5, [%i1]
	.word	0xee20a028	! t0_kref+0x1b38:   	st	%l7, [%g2 + 0x28]
	.word	0xd868a006	! t0_kref+0x1b3c:   	ldstub	[%g2 + 6], %o4
	.word	0xf51e3fe0	! t0_kref+0x1b40:   	ldd	[%i0 - 0x20], %f26
	.word	0xa816a3ee	! t0_kref+0x1b44:   	or	%i2, 0x3ee, %l4
	.word	0xab3d6008	! t0_kref+0x1b48:   	sra	%l5, 0x8, %l5
	.word	0xe8567fe6	! t0_kref+0x1b4c:   	ldsh	[%i1 - 0x1a], %l4
	.word	0x8143c000	! t0_kref+0x1b50:   	stbar
	.word	0xa60b000b	! t0_kref+0x1b54:   	and	%o4, %o3, %l3
	.word	0x81aeca3b	! t0_kref+0x1b58:   	fcmps	%fcc0, %f27, %f27
	.word	0x81de401e	! t0_kref+0x1b5c:   	flush	%i1 + %fp
	.word	0x9835aa7b	! t0_kref+0x1b60:   	orn	%l6, 0xa7b, %o4
	.word	0xb7a6c93b	! t0_kref+0x1b64:   	fmuls	%f27, %f27, %f27
	.word	0xd4780019	! t0_kref+0x1b68:   	swap	[%g0 + %i1], %o2
	.word	0x982d8014	! t0_kref+0x1b6c:   	andn	%l6, %l4, %o4
	.word	0xfb6e3fe0	! t0_kref+0x1b70:   	prefetch	%i0 - 0x20, 29
	.word	0xb7a000bb	! t0_kref+0x1b74:   	fnegs	%f27, %f27
	.word	0xf1be5897	! t0_kref+0x1b78:   	stda	%f24, [%i1 + %l7]0xc4
	.word	0xb7a6c8bb	! t0_kref+0x1b7c:   	fsubs	%f27, %f27, %f27
	.word	0xa852f17b	! t0_kref+0x1b80:   	umul	%o3, -0xe85, %l4
	.word	0x8d85c016	! t0_kref+0x1b84:   	wr	%l7, %l6, %fprs
	.word	0xb5a6895a	! t0_kref+0x1b88:   	fmuld	%f26, %f26, %f26
	.word	0xf7067fe4	! t0_kref+0x1b8c:   	ld	[%i1 - 0x1c], %f27
	.word	0xf7067ff4	! t0_kref+0x1b90:   	ld	[%i1 - 0xc], %f27
	.word	0x993da00f	! t0_kref+0x1b94:   	sra	%l6, 0xf, %o4
	.word	0x9ea2f6d8	! t0_kref+0x1b98:   	subcc	%o3, -0x928, %o7
	call	SYM(t0_subr2)
	.word	0xd248a004	! t0_kref+0x1ba0:   	ldsb	[%g2 + 4], %o1
	.word	0xb5a689da	! t0_kref+0x1ba4:   	fdivd	%f26, %f26, %f26
	.word	0x953d2007	! t0_kref+0x1ba8:   	sra	%l4, 0x7, %o2
	.word	0xe47f0018	! t0_kref+0x1bac:   	swap	[%i4 + %i0], %l2
	.word	0xb7a0053b	! t0_kref+0x1bb0:   	fsqrts	%f27, %f27
	call	SYM(t0_subr3)
	.word	0xec30a01e	! t0_kref+0x1bb8:   	sth	%l6, [%g2 + 0x1e]
	.word	0x3f800006	! t0_kref+0x1bbc:   	fbo,a	_kref+0x1bd4
	.word	0xf51e3fe0	! t0_kref+0x1bc0:   	ldd	[%i0 - 0x20], %f26
	.word	0xf19e7fe4	! t0_kref+0x1bc4:   	ldda	[%i1 - 0x1c]%asi, %f24
	.word	0x81ae8a5a	! t0_kref+0x1bc8:   	fcmpd	%fcc0, %f26, %f26
	.word	0xec08a015	! t0_kref+0x1bcc:   	ldub	[%g2 + 0x15], %l6
	.word	0x9fc00004	! t0_kref+0x1bd0:   	call	%g0 + %g4
	.word	0xab400000	! t0_kref+0x1bd4:   	mov	%y, %l5
	.word	0x80524000	! t0_kref+0x1bd8:   	umul	%o1, %g0, %g0
	.word	0xb7a6c8bb	! t0_kref+0x1bdc:   	fsubs	%f27, %f27, %f27
	.word	0x80880017	! t0_kref+0x1be0:   	btst	%l7, %g0
	sethi	%hi(2f), %o7
	.word	0xe40be024	! t0_kref+0x1be8:   	ldub	[%o7 + 0x24], %l2
	.word	0xa41ca00c	! t0_kref+0x1bec:   	xor	%l2, 0xc, %l2
	.word	0xe42be024	! t0_kref+0x1bf0:   	stb	%l2, [%o7 + 0x24]
	.word	0x81dbe024	! t0_kref+0x1bf4:   	flush	%o7 + 0x24
	.word	0xb7a000bb	! t0_kref+0x1bf8:   	fnegs	%f27, %f27
	.word	0x2c800007	! t0_kref+0x1bfc:   	bneg,a	_kref+0x1c18
	.word	0x9a882584	! t0_kref+0x1c00:   	andcc	%g0, 0x584, %o5
	.word	0x9fc10000	! t0_kref+0x1c04:   	call	%g4
	.word	0xb7a0053b	! t0_kref+0x1c08:   	fsqrts	%f27, %f27
	.word	0x2a480004	! t0_kref+0x1c0c:   	bcs,a,pt	%icc, _kref+0x1c1c
	.word	0xe808a00d	! t0_kref+0x1c10:   	ldub	[%g2 + 0xd], %l4
	.word	0xf720a028	! t0_kref+0x1c14:   	st	%f27, [%g2 + 0x28]
	.word	0xb7a0003b	! t0_kref+0x1c18:   	fmovs	%f27, %f27
	.word	0xb5a688da	! t0_kref+0x1c1c:   	fsubd	%f26, %f26, %f26
	.word	0xb7a0013b	! t0_kref+0x1c20:   	fabss	%f27, %f27
2:	.word	0xa0b3683e	! t0_kref+0x1c24:   	orncc	%o5, 0x83e, %l0
	.word	0xe810a026	! t0_kref+0x1c28:   	lduh	[%g2 + 0x26], %l4
	.word	0x29800001	! t0_kref+0x1c2c:   	fbl,a	_kref+0x1c30
	.word	0xee7e7ff4	! t0_kref+0x1c30:   	swap	[%i1 - 0xc], %l7
	.word	0xae2d27f8	! t0_kref+0x1c34:   	andn	%l4, 0x7f8, %l7
	.word	0xb5a6cd3b	! t0_kref+0x1c38:   	fsmuld	%f27, %f27, %f26
	.word	0xeb68a000	! t0_kref+0x1c3c:   	prefetch	%g2, 21
	.word	0x3e480006	! t0_kref+0x1c40:   	bvc,a,pt	%icc, _kref+0x1c58
	.word	0xd820a010	! t0_kref+0x1c44:   	st	%o4, [%g2 + 0x10]
	.word	0x35480008	! t0_kref+0x1c48:   	fbue,a,pt	%fcc0, _kref+0x1c68
	.word	0xb7a0053b	! t0_kref+0x1c4c:   	fsqrts	%f27, %f27
	.word	0xf53e401d	! t0_kref+0x1c50:   	std	%f26, [%i1 + %i5]
	.word	0x90f2725c	! t0_kref+0x1c54:   	udivcc	%o1, -0xda4, %o0
	.word	0x9245c008	! t0_kref+0x1c58:   	addc	%l7, %o0, %o1
	.word	0xba102000	! t0_kref+0x1c5c:   	mov	0x0, %i5
	.word	0xf51e2008	! t0_kref+0x1c60:   	ldd	[%i0 + 8], %f26
	.word	0x2b480003	! t0_kref+0x1c64:   	fbug,a,pt	%fcc0, _kref+0x1c70
	.word	0xe486501c	! t0_kref+0x1c68:   	lda	[%i1 + %i4]0x80, %l2
	.word	0xb7a0003b	! t0_kref+0x1c6c:   	fmovs	%f27, %f27
	.word	0x21800006	! t0_kref+0x1c70:   	fbn,a	_kref+0x1c88
	.word	0xd02e3ffd	! t0_kref+0x1c74:   	stb	%o0, [%i0 - 3]
	.word	0x8143c000	! t0_kref+0x1c78:   	stbar
	.word	0xd2871058	! t0_kref+0x1c7c:   	lda	[%i4 + %i0]0x82, %o1
	.word	0xb7a0189b	! t0_kref+0x1c80:   	fitos	%f27, %f27
	.word	0x81ae8ada	! t0_kref+0x1c84:   	fcmped	%fcc0, %f26, %f26
	.word	0xb7a01a3b	! t0_kref+0x1c88:   	fstoi	%f27, %f27
	.word	0x805530cb	! t0_kref+0x1c8c:   	umul	%l4, -0xf35, %g0
	.word	0x26800008	! t0_kref+0x1c90:   	bl,a	_kref+0x1cb0
	.word	0xf7000019	! t0_kref+0x1c94:   	ld	[%g0 + %i1], %f27
	.word	0xc07e7ff0	! t0_kref+0x1c98:   	swap	[%i1 - 0x10], %g0
	.word	0xa4d68017	! t0_kref+0x1c9c:   	umulcc	%i2, %l7, %l2
	.word	0x3e480004	! t0_kref+0x1ca0:   	bvc,a,pt	%icc, _kref+0x1cb0
	.word	0xa73b6005	! t0_kref+0x1ca4:   	sra	%o5, 0x5, %l3
	.word	0xb7a0053b	! t0_kref+0x1ca8:   	fsqrts	%f27, %f27
	call	SYM(t0_subr1)
	.word	0x8143c000	! t0_kref+0x1cb0:   	stbar
	.word	0xb7a6c9bb	! t0_kref+0x1cb4:   	fdivs	%f27, %f27, %f27
	.word	0xe856001b	! t0_kref+0x1cb8:   	ldsh	[%i0 + %i3], %l4
	.word	0x925de33e	! t0_kref+0x1cbc:   	smul	%l7, 0x33e, %o1
	.word	0xb7a0189b	! t0_kref+0x1cc0:   	fitos	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x1cc4:   	fitos	%f27, %f27
	.word	0x9e32f897	! t0_kref+0x1cc8:   	orn	%o3, -0x769, %o7
	.word	0x81ae8a5a	! t0_kref+0x1ccc:   	fcmpd	%fcc0, %f26, %f26
	.word	0xe4066008	! t0_kref+0x1cd0:   	ld	[%i1 + 8], %l2
	call	SYM(t0_subr1)
	.word	0xf5bf5018	! t0_kref+0x1cd8:   	stda	%f26, [%i5 + %i0]0x80
	.word	0x97336007	! t0_kref+0x1cdc:   	srl	%o5, 0x7, %o3
	.word	0x96aac016	! t0_kref+0x1ce0:   	andncc	%o3, %l6, %o3
	.word	0xae2a74e4	! t0_kref+0x1ce4:   	andn	%o1, -0xb1c, %l7
	.word	0x80753a76	! t0_kref+0x1ce8:   	udiv	%l4, -0x58a, %g0
	.word	0xa6b5ed80	! t0_kref+0x1cec:   	orncc	%l7, 0xd80, %l3
	.word	0x94d68014	! t0_kref+0x1cf0:   	umulcc	%i2, %l4, %o2
	.word	0xd43e401d	! t0_kref+0x1cf4:   	std	%o2, [%i1 + %i5]
	.word	0xe4de5000	! t0_kref+0x1cf8:   	ldxa	[%i1]0x80, %l2
	.word	0xf4b61000	! t0_kref+0x1cfc:   	stha	%i2, [%i0]0x80
	.word	0x39480005	! t0_kref+0x1d00:   	fbuge,a,pt	%fcc0, _kref+0x1d14
	.word	0xd2f6101d	! t0_kref+0x1d04:   	stxa	%o1, [%i0 + %i5]0x80
	.word	0xf706401c	! t0_kref+0x1d08:   	ld	[%i1 + %i4], %f27
	.word	0x2f800002	! t0_kref+0x1d0c:   	fbu,a	_kref+0x1d14
	.word	0xb7a0003b	! t0_kref+0x1d10:   	fmovs	%f27, %f27
	.word	0x25800004	! t0_kref+0x1d14:   	fblg,a	_kref+0x1d24
	.word	0xb7a0003b	! t0_kref+0x1d18:   	fmovs	%f27, %f27
	.word	0xf7062008	! t0_kref+0x1d1c:   	ld	[%i0 + 8], %f27
	.word	0x3e480001	! t0_kref+0x1d20:   	bvc,a,pt	%icc, _kref+0x1d24
	.word	0x8583400a	! t0_kref+0x1d24:   	wr	%o5, %o2, %ccr
	.word	0x3d480007	! t0_kref+0x1d28:   	fbule,a,pt	%fcc0, _kref+0x1d44
	.word	0x81d8400e	! t0_kref+0x1d2c:   	flush	%g1 + %sp
	.word	0xb7a01a5a	! t0_kref+0x1d30:   	fdtoi	%f26, %f27
	.word	0xda7e3ff8	! t0_kref+0x1d34:   	swap	[%i0 - 8], %o5
	.word	0xf7262014	! t0_kref+0x1d38:   	st	%f27, [%i0 + 0x14]
	.word	0x81aecabb	! t0_kref+0x1d3c:   	fcmpes	%fcc0, %f27, %f27
	.word	0xf007bfe0	! t0_kref+0x1d40:   	ld	[%fp - 0x20], %i0
	.word	0x81aecabb	! t0_kref+0x1d44:   	fcmpes	%fcc0, %f27, %f27
	.word	0x8143e04f	! t0_kref+0x1d48:   	membar	0x4f
	.word	0xa8d0000b	! t0_kref+0x1d4c:   	umulcc	%g0, %o3, %l4
	.word	0x23480003	! t0_kref+0x1d50:   	fbne,a,pt	%fcc0, _kref+0x1d5c
	.word	0xb7a000bb	! t0_kref+0x1d54:   	fnegs	%f27, %f27
	.word	0xac56801a	! t0_kref+0x1d58:   	umul	%i2, %i2, %l6
	.word	0xf706001c	! t0_kref+0x1d5c:   	ld	[%i0 + %i4], %f27
	.word	0x81db4004	! t0_kref+0x1d60:   	flush	%o5 + %g4
	.word	0x9ec4fdbc	! t0_kref+0x1d64:   	addccc	%l3, -0x244, %o7
	.word	0xf51e2008	! t0_kref+0x1d68:   	ldd	[%i0 + 8], %f26
	.word	0xb7a6c83b	! t0_kref+0x1d6c:   	fadds	%f27, %f27, %f27
	.word	0xf53f4018	! t0_kref+0x1d70:   	std	%f26, [%i5 + %i0]
	.word	0x973ea003	! t0_kref+0x1d74:   	sra	%i2, 0x3, %o3
	.word	0x81aecabb	! t0_kref+0x1d78:   	fcmpes	%fcc0, %f27, %f27
	.word	0xd0c71019	! t0_kref+0x1d7c:   	ldswa	[%i4 + %i1]0x80, %o0
	.word	0x8143c000	! t0_kref+0x1d80:   	stbar
	.word	0x24800003	! t0_kref+0x1d84:   	ble,a	_kref+0x1d90
	.word	0xa462eb0c	! t0_kref+0x1d88:   	subc	%o3, 0xb0c, %l2
	.word	0xf5be1000	! t0_kref+0x1d8c:   	stda	%f26, [%i0]0x80
	.word	0xd020a018	! t0_kref+0x1d90:   	st	%o0, [%g2 + 0x18]
	.word	0x32800003	! t0_kref+0x1d94:   	bne,a	_kref+0x1da0
	.word	0x9e2b3d58	! t0_kref+0x1d98:   	andn	%o4, -0x2a8, %o7
	.word	0xc00e3ff6	! t0_kref+0x1d9c:   	ldub	[%i0 - 0xa], %g0
	.word	0xad400000	! t0_kref+0x1da0:   	mov	%y, %l6
	.word	0xb7a0189b	! t0_kref+0x1da4:   	fitos	%f27, %f27
	.word	0xb5a0193b	! t0_kref+0x1da8:   	fstod	%f27, %f26
	.word	0x37800003	! t0_kref+0x1dac:   	fbge,a	_kref+0x1db8
	.word	0xb7a0189b	! t0_kref+0x1db0:   	fitos	%f27, %f27
	.word	0xea0e401a	! t0_kref+0x1db4:   	ldub	[%i1 + %i2], %l5
	.word	0xab382005	! t0_kref+0x1db8:   	sra	%g0, 0x5, %l5
	.word	0x26800006	! t0_kref+0x1dbc:   	bl,a	_kref+0x1dd4
	.word	0x902a0016	! t0_kref+0x1dc0:   	andn	%o0, %l6, %o0
	.word	0x38800005	! t0_kref+0x1dc4:   	bgu,a	_kref+0x1dd8
	.word	0xb5a689da	! t0_kref+0x1dc8:   	fdivd	%f26, %f26, %f26
	.word	0xd430a004	! t0_kref+0x1dcc:   	sth	%o2, [%g2 + 4]
	.word	0x32800003	! t0_kref+0x1dd0:   	bne,a	_kref+0x1ddc
	.word	0xaa05f086	! t0_kref+0x1dd4:   	add	%l7, -0xf7a, %l5
	.word	0xf53e7fe8	! t0_kref+0x1dd8:   	std	%f26, [%i1 - 0x18]
	.word	0x81aecabb	! t0_kref+0x1ddc:   	fcmpes	%fcc0, %f27, %f27
	.word	0xb7a01a5a	! t0_kref+0x1de0:   	fdtoi	%f26, %f27
	.word	0xf51f4019	! t0_kref+0x1de4:   	ldd	[%i5 + %i1], %f26
	.word	0xb7a0013b	! t0_kref+0x1de8:   	fabss	%f27, %f27
	.word	0xb7a0013b	! t0_kref+0x1dec:   	fabss	%f27, %f27
	.word	0xa9400000	! t0_kref+0x1df0:   	mov	%y, %l4
	.word	0xff6e001a	! t0_kref+0x1df4:   	prefetch	%i0 + %i2, 31
	.word	0x38800001	! t0_kref+0x1df8:   	bgu,a	_kref+0x1dfc
	.word	0xf7267ffc	! t0_kref+0x1dfc:   	st	%f27, [%i1 - 4]
	.word	0x96a2b775	! t0_kref+0x1e00:   	subcc	%o2, -0x88b, %o3
	.word	0x3c480002	! t0_kref+0x1e04:   	bpos,a,pt	%icc, _kref+0x1e0c
	.word	0xb7a6c9bb	! t0_kref+0x1e08:   	fdivs	%f27, %f27, %f27
	.word	0xf7801019	! t0_kref+0x1e0c:   	lda	[%g0 + %i1]0x80, %f27
	.word	0xab3ce014	! t0_kref+0x1e10:   	sra	%l3, 0x14, %l5
	.word	0xda68a024	! t0_kref+0x1e14:   	ldstub	[%g2 + 0x24], %o5
	call	SYM(t0_subr1)
	.word	0xf7861000	! t0_kref+0x1e1c:   	lda	[%i0]0x80, %f27
	.word	0xe60e3fe0	! t0_kref+0x1e20:   	ldub	[%i0 - 0x20], %l3
	.word	0x86102001	! t0_kref+0x1e24:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x1e28:   	bne,a	_kref+0x1e28
	.word	0x86a0e001	! t0_kref+0x1e2c:   	subcc	%g3, 1, %g3
	.word	0xf1be5888	! t0_kref+0x1e30:   	stda	%f24, [%i1 + %o0]0xc4
	.word	0xd210a01e	! t0_kref+0x1e34:   	lduh	[%g2 + 0x1e], %o1
	.word	0xd028a020	! t0_kref+0x1e38:   	stb	%o0, [%g2 + 0x20]
	.word	0xb7a0003b	! t0_kref+0x1e3c:   	fmovs	%f27, %f27
	.word	0x931d6d40	! t0_kref+0x1e40:   	tsubcctv	%l5, 0xd40, %o1
	.word	0xe800a000	! t0_kref+0x1e44:   	ld	[%g2], %l4
	.word	0xee28a012	! t0_kref+0x1e48:   	stb	%l7, [%g2 + 0x12]
	.word	0x9734e00f	! t0_kref+0x1e4c:   	srl	%l3, 0xf, %o3
	.word	0xea801019	! t0_kref+0x1e50:   	lda	[%g0 + %i1]0x80, %l5
	.word	0x34800002	! t0_kref+0x1e54:   	bg,a	_kref+0x1e5c
	.word	0xaa080008	! t0_kref+0x1e58:   	and	%g0, %o0, %l5
	.word	0xd46e3ff9	! t0_kref+0x1e5c:   	ldstub	[%i0 - 7], %o2
	.word	0xb7a018da	! t0_kref+0x1e60:   	fdtos	%f26, %f27
	.word	0xf720a010	! t0_kref+0x1e64:   	st	%f27, [%g2 + 0x10]
	.word	0x9fc10000	! t0_kref+0x1e68:   	call	%g4
	.word	0xb7a01a5a	! t0_kref+0x1e6c:   	fdtoi	%f26, %f27
	.word	0x92f2c00a	! t0_kref+0x1e70:   	udivcc	%o3, %o2, %o1
	.word	0xa29a8000	! t0_kref+0x1e74:   	xorcc	%o2, %g0, %l1
	.word	0x80f26b14	! t0_kref+0x1e78:   	udivcc	%o1, 0xb14, %g0
	call	SYM(t0_subr2)
	.word	0xe168a00e	! t0_kref+0x1e80:   	prefetch	%g2 + 0xe, 16
	.word	0x9282bca1	! t0_kref+0x1e84:   	addcc	%o2, -0x35f, %o1
	.word	0x3a480007	! t0_kref+0x1e88:   	bcc,a,pt	%icc, _kref+0x1ea4
	.word	0xf53e4000	! t0_kref+0x1e8c:   	std	%f26, [%i1]
	.word	0xda40a028	! t0_kref+0x1e90:   	ldsw	[%g2 + 0x28], %o5
	.word	0x9228248f	! t0_kref+0x1e94:   	andn	%g0, 0x48f, %o1
	.word	0xd810a018	! t0_kref+0x1e98:   	lduh	[%g2 + 0x18], %o4
	.word	0x98330014	! t0_kref+0x1e9c:   	orn	%o4, %l4, %o4
	.word	0xec2e200f	! t0_kref+0x1ea0:   	stb	%l6, [%i0 + 0xf]
	.word	0xb8102014	! t0_kref+0x1ea4:   	mov	0x14, %i4
	.word	0xd4562008	! t0_kref+0x1ea8:   	ldsh	[%i0 + 8], %o2
	.word	0x34800003	! t0_kref+0x1eac:   	bg,a	_kref+0x1eb8
	.word	0xc0562006	! t0_kref+0x1eb0:   	ldsh	[%i0 + 6], %g0
	.word	0x9fc00004	! t0_kref+0x1eb4:   	call	%g0 + %g4
	.word	0xf4262000	! t0_kref+0x1eb8:   	st	%i2, [%i0]
	.word	0xb5a0193b	! t0_kref+0x1ebc:   	fstod	%f27, %f26
	sethi	%hi(2f), %o7
	.word	0xe40be2dc	! t0_kref+0x1ec4:   	ldub	[%o7 + 0x2dc], %l2
	.word	0xa41ca00c	! t0_kref+0x1ec8:   	xor	%l2, 0xc, %l2
	.word	0xe42be2dc	! t0_kref+0x1ecc:   	stb	%l2, [%o7 + 0x2dc]
	.word	0x81dbe2dc	! t0_kref+0x1ed0:   	flush	%o7 + 0x2dc
	.word	0xf51e7fe0	! t0_kref+0x1ed4:   	ldd	[%i1 - 0x20], %f26
	.word	0xac80000d	! t0_kref+0x1ed8:   	addcc	%g0, %o5, %l6
2:	.word	0xa4fa0015	! t0_kref+0x1edc:   	sdivcc	%o0, %l5, %l2
	.word	0xb7a6c9bb	! t0_kref+0x1ee0:   	fdivs	%f27, %f27, %f27
	.word	0xe26e7ff0	! t0_kref+0x1ee4:   	ldstub	[%i1 - 0x10], %l1
	.word	0x94c27a83	! t0_kref+0x1ee8:   	addccc	%o1, -0x57d, %o2
	.word	0x35800001	! t0_kref+0x1eec:   	fbue,a	_kref+0x1ef0
	.word	0xea562010	! t0_kref+0x1ef0:   	ldsh	[%i0 + 0x10], %l5
	.word	0xa7400000	! t0_kref+0x1ef4:   	mov	%y, %l3
	.word	0xd226001c	! t0_kref+0x1ef8:   	st	%o1, [%i0 + %i4]
	.word	0x81ae8ada	! t0_kref+0x1efc:   	fcmped	%fcc0, %f26, %f26
	.word	0xb7a0003b	! t0_kref+0x1f00:   	fmovs	%f27, %f27
	.word	0xda7f0018	! t0_kref+0x1f04:   	swap	[%i4 + %i0], %o5
	.word	0xb7a01a5a	! t0_kref+0x1f08:   	fdtoi	%f26, %f27
	.word	0xda262008	! t0_kref+0x1f0c:   	st	%o5, [%i0 + 8]
	.word	0xb7a6c8bb	! t0_kref+0x1f10:   	fsubs	%f27, %f27, %f27
	.word	0xa8a6bfa7	! t0_kref+0x1f14:   	subcc	%i2, -0x59, %l4
	.word	0x27480004	! t0_kref+0x1f18:   	fbul,a,pt	%fcc0, _kref+0x1f28
	.word	0xa8b4c016	! t0_kref+0x1f1c:   	orncc	%l3, %l6, %l4
	.word	0xaa74c014	! t0_kref+0x1f20:   	udiv	%l3, %l4, %l5
	.word	0xb7a0053b	! t0_kref+0x1f24:   	fsqrts	%f27, %f27
	.word	0xf1be188c	! t0_kref+0x1f28:   	stda	%f24, [%i0 + %o4]0xc4
	.word	0xb5a6cd3b	! t0_kref+0x1f2c:   	fsmuld	%f27, %f27, %f26
	.word	0xacddfdc2	! t0_kref+0x1f30:   	smulcc	%l7, -0x23e, %l6
	.word	0x38480005	! t0_kref+0x1f34:   	bgu,a,pt	%icc, _kref+0x1f48
	.word	0xe27e0000	! t0_kref+0x1f38:   	swap	[%i0], %l1
	.word	0xf700a024	! t0_kref+0x1f3c:   	ld	[%g2 + 0x24], %f27
	.word	0xd810a022	! t0_kref+0x1f40:   	lduh	[%g2 + 0x22], %o4
	.word	0x9934e004	! t0_kref+0x1f44:   	srl	%l3, 0x4, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be38c	! t0_kref+0x1f4c:   	ldub	[%o7 + 0x38c], %l2
	.word	0xa41ca00c	! t0_kref+0x1f50:   	xor	%l2, 0xc, %l2
	.word	0xe42be38c	! t0_kref+0x1f54:   	stb	%l2, [%o7 + 0x38c]
	.word	0x81dbe38c	! t0_kref+0x1f58:   	flush	%o7 + 0x38c
	.word	0xb7a018da	! t0_kref+0x1f5c:   	fdtos	%f26, %f27
	.word	0xb7a0053b	! t0_kref+0x1f60:   	fsqrts	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x1f64:   	fitos	%f27, %f27
	.word	0xb7a0109a	! t0_kref+0x1f68:   	fxtos	%f26, %f27
	.word	0x93400000	! t0_kref+0x1f6c:   	mov	%y, %o1
	.word	0x22480007	! t0_kref+0x1f70:   	be,a,pt	%icc, _kref+0x1f8c
	.word	0xaa45fb10	! t0_kref+0x1f74:   	addc	%l7, -0x4f0, %l5
	.word	0xb7a6c9bb	! t0_kref+0x1f78:   	fdivs	%f27, %f27, %f27
	.word	0xb5a689da	! t0_kref+0x1f7c:   	fdivd	%f26, %f26, %f26
	.word	0xaa8b2b0a	! t0_kref+0x1f80:   	andcc	%o4, 0xb0a, %l5
	.word	0xe4080019	! t0_kref+0x1f84:   	ldub	[%g0 + %i1], %l2
	.word	0xf7263fe0	! t0_kref+0x1f88:   	st	%f27, [%i0 - 0x20]
2:	.word	0xb7a6c93b	! t0_kref+0x1f8c:   	fmuls	%f27, %f27, %f27
	.word	0xf706001c	! t0_kref+0x1f90:   	ld	[%i0 + %i4], %f27
	.word	0x9815b296	! t0_kref+0x1f94:   	or	%l6, -0xd6a, %o4
	.word	0xa80cc015	! t0_kref+0x1f98:   	and	%l3, %l5, %l4
	.word	0xb7a0053b	! t0_kref+0x1f9c:   	fsqrts	%f27, %f27
	.word	0xea00a008	! t0_kref+0x1fa0:   	ld	[%g2 + 8], %l5
	.word	0xb7a01a3b	! t0_kref+0x1fa4:   	fstoi	%f27, %f27
	.word	0xd9e6500b	! t0_kref+0x1fa8:   	casa	[%i1]0x80, %o3, %o4
	.word	0x2a800008	! t0_kref+0x1fac:   	bcs,a	_kref+0x1fcc
	.word	0x94a5c014	! t0_kref+0x1fb0:   	subcc	%l7, %l4, %o2
	.word	0x81aecabb	! t0_kref+0x1fb4:   	fcmpes	%fcc0, %f27, %f27
	.word	0xf76e3ff0	! t0_kref+0x1fb8:   	prefetch	%i0 - 0x10, 27
	.word	0x22480003	! t0_kref+0x1fbc:   	be,a,pt	%icc, _kref+0x1fc8
	.word	0xb7a018da	! t0_kref+0x1fc0:   	fdtos	%f26, %f27
	.word	0x9f35000d	! t0_kref+0x1fc4:   	srl	%l4, %o5, %o7
	.word	0xb7a0013b	! t0_kref+0x1fc8:   	fabss	%f27, %f27
	.word	0x3a480007	! t0_kref+0x1fcc:   	bcc,a,pt	%icc, _kref+0x1fe8
	.word	0xf4263fe8	! t0_kref+0x1fd0:   	st	%i2, [%i0 - 0x18]
	.word	0xb7a0053b	! t0_kref+0x1fd4:   	fsqrts	%f27, %f27
	.word	0xd03e0000	! t0_kref+0x1fd8:   	std	%o0, [%i0]
	.word	0x27480003	! t0_kref+0x1fdc:   	fbul,a,pt	%fcc0, _kref+0x1fe8
	.word	0xf7200018	! t0_kref+0x1fe0:   	st	%f27, [%g0 + %i0]
	.word	0xb7a6c9bb	! t0_kref+0x1fe4:   	fdivs	%f27, %f27, %f27
	.word	0xad3ae011	! t0_kref+0x1fe8:   	sra	%o3, 0x11, %l6
	.word	0x32800008	! t0_kref+0x1fec:   	bne,a	_kref+0x200c
	.word	0x9053401a	! t0_kref+0x1ff0:   	umul	%o5, %i2, %o0
	call	SYM(t0_subr0)
	.word	0xda6e401a	! t0_kref+0x1ff8:   	ldstub	[%i1 + %i2], %o5
	.word	0xaabb000b	! t0_kref+0x1ffc:   	xnorcc	%o4, %o3, %l5
	.word	0xb7a0053b	! t0_kref+0x2000:   	fsqrts	%f27, %f27
	.word	0x3c480005	! t0_kref+0x2004:   	bpos,a,pt	%icc, _kref+0x2018
	.word	0x8143c000	! t0_kref+0x2008:   	stbar
	.word	0x9eb5e079	! t0_kref+0x200c:   	orncc	%l7, 0x79, %o7
	.word	0xe8160000	! t0_kref+0x2010:   	lduh	[%i0], %l4
	.word	0xe640a010	! t0_kref+0x2014:   	ldsw	[%g2 + 0x10], %l3
	sethi	%hi(2f), %o7
	.word	0xe40be060	! t0_kref+0x201c:   	ldub	[%o7 + 0x60], %l2
	.word	0xa41ca00c	! t0_kref+0x2020:   	xor	%l2, 0xc, %l2
	.word	0xe42be060	! t0_kref+0x2024:   	stb	%l2, [%o7 + 0x60]
	.word	0x81dbe060	! t0_kref+0x2028:   	flush	%o7 + 0x60
	.word	0xc06e600c	! t0_kref+0x202c:   	ldstub	[%i1 + 0xc], %g0
	.word	0xb7a0053b	! t0_kref+0x2030:   	fsqrts	%f27, %f27
	.word	0xf7200019	! t0_kref+0x2034:   	st	%f27, [%g0 + %i1]
	.word	0xb8103ff8	! t0_kref+0x2038:   	mov	0xfffffff8, %i4
	.word	0xfd6e401a	! t0_kref+0x203c:   	prefetch	%i1 + %i2, 30
	.word	0xd4d01018	! t0_kref+0x2040:   	ldsha	[%g0 + %i0]0x80, %o2
	.word	0xb7a01a3b	! t0_kref+0x2044:   	fstoi	%f27, %f27
	.word	0xae836912	! t0_kref+0x2048:   	addcc	%o5, 0x912, %l7
	.word	0x32480002	! t0_kref+0x204c:   	bne,a,pt	%icc, _kref+0x2054
	.word	0x9714c016	! t0_kref+0x2050:   	taddcctv	%l3, %l6, %o3
	.word	0x34800006	! t0_kref+0x2054:   	bg,a	_kref+0x206c
	.word	0xaca3284b	! t0_kref+0x2058:   	subcc	%o4, 0x84b, %l6
	.word	0xb7a0013b	! t0_kref+0x205c:   	fabss	%f27, %f27
2:	.word	0xb7a018da	! t0_kref+0x2060:   	fdtos	%f26, %f27
	.word	0xa204c013	! t0_kref+0x2064:   	add	%l3, %l3, %l1
	.word	0xf7267fe0	! t0_kref+0x2068:   	st	%f27, [%i1 - 0x20]
	.word	0x9ad3000b	! t0_kref+0x206c:   	umulcc	%o4, %o3, %o5
	.word	0xe410a018	! t0_kref+0x2070:   	lduh	[%g2 + 0x18], %l2
	.word	0xde08a003	! t0_kref+0x2074:   	ldub	[%g2 + 3], %o7
	.word	0x37480003	! t0_kref+0x2078:   	fbge,a,pt	%fcc0, _kref+0x2084
	.word	0xec0e2003	! t0_kref+0x207c:   	ldub	[%i0 + 3], %l6
	.word	0xee680018	! t0_kref+0x2080:   	ldstub	[%g0 + %i0], %l7
	.word	0xb7a6c93b	! t0_kref+0x2084:   	fmuls	%f27, %f27, %f27
	.word	0x86102001	! t0_kref+0x2088:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x208c:   	bne,a	_kref+0x208c
	.word	0x86a0e001	! t0_kref+0x2090:   	subcc	%g3, 1, %g3
	call	SYM(t0_subr2)
	.word	0xee7e0000	! t0_kref+0x2098:   	swap	[%i0], %l7
	.word	0x2f800007	! t0_kref+0x209c:   	fbu,a	_kref+0x20b8
	.word	0xa9418000	! t0_kref+0x20a0:   	mov	%fprs, %l4
	.word	0xe4ee1000	! t0_kref+0x20a4:   	ldstuba	[%i0]0x80, %l2
	.word	0x9ada65ff	! t0_kref+0x20a8:   	smulcc	%o1, 0x5ff, %o5
	call	SYM(t0_subr0)
	.word	0x9ab5401a	! t0_kref+0x20b0:   	orncc	%l5, %i2, %o5
	.word	0xd0566002	! t0_kref+0x20b4:   	ldsh	[%i1 + 2], %o0
	.word	0xb5a0193b	! t0_kref+0x20b8:   	fstod	%f27, %f26
	.word	0xa8f54016	! t0_kref+0x20bc:   	udivcc	%l5, %l6, %l4
	.word	0x37480002	! t0_kref+0x20c0:   	fbge,a,pt	%fcc0, _kref+0x20c8
	.word	0x925deed0	! t0_kref+0x20c4:   	smul	%l7, 0xed0, %o1
	.word	0x22800002	! t0_kref+0x20c8:   	be,a	_kref+0x20d0
	.word	0xa33b0014	! t0_kref+0x20cc:   	sra	%o4, %l4, %l1
	.word	0xacaaf546	! t0_kref+0x20d0:   	andncc	%o3, -0xaba, %l6
	.word	0xa93ce011	! t0_kref+0x20d4:   	sra	%l3, 0x11, %l4
	.word	0xf53e001d	! t0_kref+0x20d8:   	std	%f26, [%i0 + %i5]
	.word	0xf51e3fe8	! t0_kref+0x20dc:   	ldd	[%i0 - 0x18], %f26
	.word	0xda366012	! t0_kref+0x20e0:   	sth	%o5, [%i1 + 0x12]
	.word	0xb5a8c05a	! t0_kref+0x20e4:   	fmovdul	%fcc0, %f26, %f26
	.word	0xec1e6018	! t0_kref+0x20e8:   	ldd	[%i1 + 0x18], %l6
	.word	0xea7e4000	! t0_kref+0x20ec:   	swap	[%i1], %l5
	.word	0xda0e3fec	! t0_kref+0x20f0:   	ldub	[%i0 - 0x14], %o5
	.word	0xa6c00015	! t0_kref+0x20f4:   	addccc	%g0, %l5, %l3
	.word	0x9de3bfa0	! t0_kref+0x20f8:   	save	%sp, -0x60, %sp
	.word	0xbb06801c	! t0_kref+0x20fc:   	taddcc	%i2, %i4, %i5
	.word	0x9fee7e00	! t0_kref+0x2100:   	restore	%i1, -0x200, %o7
	.word	0xa2ba2700	! t0_kref+0x2104:   	xnorcc	%o0, 0x700, %l1
	.word	0xb5a688da	! t0_kref+0x2108:   	fsubd	%f26, %f26, %f26
	.word	0xc020a014	! t0_kref+0x210c:   	clr	[%g2 + 0x14]
	.word	0xb5a688da	! t0_kref+0x2110:   	fsubd	%f26, %f26, %f26
	.word	0xb6103fee	! t0_kref+0x2114:   	mov	0xffffffee, %i3
	.word	0xa610000a	! t0_kref+0x2118:   	mov	%o2, %l3
	.word	0x80aae365	! t0_kref+0x211c:   	andncc	%o3, 0x365, %g0
	.word	0xa7628000	! t0_kref+0x2120:   	movue	%fcc0, %g0, %l3
	.word	0x8143e040	! t0_kref+0x2124:   	membar	0x40
	.word	0x9a0b755d	! t0_kref+0x2128:   	and	%o5, -0xaa3, %o5
	.word	0x86102005	! t0_kref+0x212c:   	mov	0x5, %g3
	.word	0x86a0e001	! t0_kref+0x2130:   	subcc	%g3, 1, %g3
	.word	0x22800013	! t0_kref+0x2134:   	be,a	_kref+0x2180
	.word	0xd8500018	! t0_kref+0x2138:   	ldsh	[%g0 + %i0], %o4
	.word	0xb7a0053b	! t0_kref+0x213c:   	fsqrts	%f27, %f27
	.word	0x3d480007	! t0_kref+0x2140:   	fbule,a,pt	%fcc0, _kref+0x215c
	.word	0xde0e6018	! t0_kref+0x2144:   	ldub	[%i1 + 0x18], %o7
	.word	0xea26601c	! t0_kref+0x2148:   	st	%l5, [%i1 + 0x1c]
	.word	0xd0466004	! t0_kref+0x214c:   	ldsw	[%i1 + 4], %o0
	.word	0xd2063ff4	! t0_kref+0x2150:   	ld	[%i0 - 0xc], %o1
	.word	0x38800003	! t0_kref+0x2154:   	bgu,a	_kref+0x2160
	.word	0xea6e3ffe	! t0_kref+0x2158:   	ldstub	[%i0 - 2], %l5
	.word	0xa2d58017	! t0_kref+0x215c:   	umulcc	%l6, %l7, %l1
	.word	0xb7a0053b	! t0_kref+0x2160:   	fsqrts	%f27, %f27
	.word	0xb7a0189b	! t0_kref+0x2164:   	fitos	%f27, %f27
	.word	0xa645401a	! t0_kref+0x2168:   	addc	%l5, %i2, %l3
	.word	0x90703575	! t0_kref+0x216c:   	udiv	%g0, -0xa8b, %o0
	.word	0xa2828015	! t0_kref+0x2170:   	addcc	%o2, %l5, %l1
	call	SYM(t0_subr2)
	.word	0x90a83fe6	! t0_kref+0x2178:   	andncc	%g0, -0x1a, %o0
	.word	0xa4c24000	! t0_kref+0x217c:   	addccc	%o1, %g0, %l2
	.word	0xb5a6885a	! t0_kref+0x2180:   	faddd	%f26, %f26, %f26
	.word	0x21800001	! t0_kref+0x2184:   	fbn,a	_kref+0x2188
	.word	0xb5a6cd3b	! t0_kref+0x2188:   	fsmuld	%f27, %f27, %f26
	.word	0x81ae8ada	! t0_kref+0x218c:   	fcmped	%fcc0, %f26, %f26
	.word	0x92b68013	! t0_kref+0x2190:   	orncc	%i2, %l3, %o1
	.word	0xa4a3400b	! t0_kref+0x2194:   	subcc	%o5, %o3, %l2
	.word	0xaab24016	! t0_kref+0x2198:   	orncc	%o1, %l6, %l5
	.word	0xf720a03c	! t0_kref+0x219c:   	st	%f27, [%g2 + 0x3c]
	.word	0x923b3bf4	! t0_kref+0x21a0:   	xnor	%o4, -0x40c, %o1
	.word	0xb5a6895a	! t0_kref+0x21a4:   	fmuld	%f26, %f26, %f26
	.word	0xa874c013	! t0_kref+0x21a8:   	udiv	%l3, %l3, %l4
	.word	0xec00a004	! t0_kref+0x21ac:   	ld	[%g2 + 4], %l6
	.word	0xc368a047	! t0_kref+0x21b0:   	prefetch	%g2 + 0x47, 1
	.word	0xb5a689da	! t0_kref+0x21b4:   	fdivd	%f26, %f26, %f26
	.word	0x9a15a4ac	! t0_kref+0x21b8:   	or	%l6, 0x4ac, %o5
	.word	0xee28a002	! t0_kref+0x21bc:   	stb	%l7, [%g2 + 2]
	.word	0xb7a6c9bb	! t0_kref+0x21c0:   	fdivs	%f27, %f27, %f27
	.word	0xd2f01019	! t0_kref+0x21c4:   	stxa	%o1, [%g0 + %i1]0x80
	.word	0xf720a008	! t0_kref+0x21c8:   	st	%f27, [%g2 + 8]
	.word	0x30800001	! t0_kref+0x21cc:   	ba,a	_kref+0x21d0
	.word	0x81580000	! t0_kref+0x21d0:   	flushw
	.word	0x2a800006	! t0_kref+0x21d4:   	bcs,a	_kref+0x21ec
	.word	0xf51e6018	! t0_kref+0x21d8:   	ldd	[%i1 + 0x18], %f26
	.word	0x800de795	! t0_kref+0x21dc:   	and	%l7, 0x795, %g0
	.word	0x9865400b	! t0_kref+0x21e0:   	subc	%l5, %o3, %o4
	.word	0xf5be1000	! t0_kref+0x21e4:   	stda	%f26, [%i0]0x80
	.word	0x90f82c40	! t0_kref+0x21e8:   	sdivcc	%g0, 0xc40, %o0
	.word	0xaebda759	! t0_kref+0x21ec:   	xnorcc	%l6, 0x759, %l7
	.word	0x3d480007	! t0_kref+0x21f0:   	fbule,a,pt	%fcc0, _kref+0x220c
	.word	0xb7a01a3b	! t0_kref+0x21f4:   	fstoi	%f27, %f27
	.word	0xc0b6501b	! t0_kref+0x21f8:   	stha	%g0, [%i1 + %i3]0x80
	.word	0x3b800004	! t0_kref+0x21fc:   	fble,a	_kref+0x220c
	.word	0x9edd2afc	! t0_kref+0x2200:   	smulcc	%l4, 0xafc, %o7
	.word	0xa6c2000c	! t0_kref+0x2204:   	addccc	%o0, %o4, %l3
	.word	0x28480008	! t0_kref+0x2208:   	bleu,a,pt	%icc, _kref+0x2228
	.word	0xb7a01a3b	! t0_kref+0x220c:   	fstoi	%f27, %f27
	.word	0x9eb5400d	! t0_kref+0x2210:   	orncc	%l5, %o5, %o7
	.word	0xad32c016	! t0_kref+0x2214:   	srl	%o3, %l6, %l6
	.word	0x8082efb2	! t0_kref+0x2218:   	addcc	%o3, 0xfb2, %g0
	.word	0xb5a688da	! t0_kref+0x221c:   	fsubd	%f26, %f26, %f26
	.word	0xd2567ffa	! t0_kref+0x2220:   	ldsh	[%i1 - 6], %o1
	.word	0xee20a010	! t0_kref+0x2224:   	st	%l7, [%g2 + 0x10]
	.word	0xe4180018	! t0_kref+0x2228:   	ldd	[%g0 + %i0], %l2
	.word	0xe40e4000	! t0_kref+0x222c:   	ldub	[%i1], %l2
	.word	0xb7a0053b	! t0_kref+0x2230:   	fsqrts	%f27, %f27
	.word	0xb5a688da	! t0_kref+0x2234:   	fsubd	%f26, %f26, %f26
	.word	0xaea4c009	! t0_kref+0x2238:   	subcc	%l3, %o1, %l7
	.word	0xe24e401a	! t0_kref+0x223c:   	ldsb	[%i1 + %i2], %l1
	.word	0x8143e02c	! t0_kref+0x2240:   	membar	0x2c
	.word	0xb7a000bb	! t0_kref+0x2244:   	fnegs	%f27, %f27
	.word	0x24800005	! t0_kref+0x2248:   	ble,a	_kref+0x225c
	.word	0x96e367ab	! t0_kref+0x224c:   	subccc	%o5, 0x7ab, %o3
	.word	0xae0a4013	! t0_kref+0x2250:   	and	%o1, %l3, %l7
	.word	0xf53e6008	! t0_kref+0x2254:   	std	%f26, [%i1 + 8]
	.word	0x9ab5c000	! t0_kref+0x2258:   	orncc	%l7, %g0, %o5
	.word	0x23480008	! t0_kref+0x225c:   	fbne,a,pt	%fcc0, _kref+0x227c
	.word	0x920eb6db	! t0_kref+0x2260:   	and	%i2, -0x925, %o1
	.word	0xee28a006	! t0_kref+0x2264:   	stb	%l7, [%g2 + 6]
	.word	0xf700a010	! t0_kref+0x2268:   	ld	[%g2 + 0x10], %f27
	.word	0xaadb400c	! t0_kref+0x226c:   	smulcc	%o5, %o4, %l5
	.word	0xa2530013	! t0_kref+0x2270:   	umul	%o4, %l3, %l1
	.word	0xd250a02c	! t0_kref+0x2274:   	ldsh	[%g2 + 0x2c], %o1
	.word	0x9664ecb8	! t0_kref+0x2278:   	subc	%l3, 0xcb8, %o3
	call	SYM(t0_subr1)
	.word	0xd00e0000	! t0_kref+0x2280:   	ldub	[%i0], %o0
	.word	0xb7a6c8bb	! t0_kref+0x2284:   	fsubs	%f27, %f27, %f27
	.word	0xd44e001a	! t0_kref+0x2288:   	ldsb	[%i0 + %i2], %o2
	.word	0xb5a6cd3b	! t0_kref+0x228c:   	fsmuld	%f27, %f27, %f26
	.word	0xb7a6c83b	! t0_kref+0x2290:   	fadds	%f27, %f27, %f27
	.word	0xe2d6d018	! t0_kref+0x2294:   	ldsha	[%i3 + %i0]0x80, %l1
	.word	0xb7a0053b	! t0_kref+0x2298:   	fsqrts	%f27, %f27
	.word	0xb7a018da	! t0_kref+0x229c:   	fdtos	%f26, %f27
	.word	0xb7a6c93b	! t0_kref+0x22a0:   	fmuls	%f27, %f27, %f27
	.word	0xb7a01a3b	! t0_kref+0x22a4:   	fstoi	%f27, %f27
	.word	0x3f480006	! t0_kref+0x22a8:   	fbo,a,pt	%fcc0, _kref+0x22c0
	.word	0xa33aa003	! t0_kref+0x22ac:   	sra	%o2, 0x3, %l1
	.word	0xa235401a	! t0_kref+0x22b0:   	orn	%l5, %i2, %l1
	.word	0xa2d28009	! t0_kref+0x22b4:   	umulcc	%o2, %o1, %l1
	.word	0xf5380018	! t0_kref+0x22b8:   	std	%f26, [%g0 + %i0]
	.word	0xea066014	! t0_kref+0x22bc:   	ld	[%i1 + 0x14], %l5
	.word	0xc0564000	! t0_kref+0x22c0:   	ldsh	[%i1], %g0
	.word	0xb7a0053b	! t0_kref+0x22c4:   	fsqrts	%f27, %f27
	.word	0xb5a6885a	! t0_kref+0x22c8:   	faddd	%f26, %f26, %f26
	.word	0xe450a034	! t0_kref+0x22cc:   	ldsh	[%g2 + 0x34], %l2
	.word	0xa22a23c5	! t0_kref+0x22d0:   	andn	%o0, 0x3c5, %l1
	.word	0x81aecabb	! t0_kref+0x22d4:   	fcmpes	%fcc0, %f27, %f27
	.word	0x91400000	! t0_kref+0x22d8:   	mov	%y, %o0
	.word	0xb7a0053b	! t0_kref+0x22dc:   	fsqrts	%f27, %f27
	.word	0xe6070018	! t0_kref+0x22e0:   	ld	[%i4 + %i0], %l3
	.word	0xe67e7fe0	! t0_kref+0x22e4:   	swap	[%i1 - 0x20], %l3
	.word	0x9e52e02b	! t0_kref+0x22e8:   	umul	%o3, 0x2b, %o7
	.word	0xd6000018	! t0_kref+0x22ec:   	ld	[%g0 + %i0], %o3
	.word	0x29800004	! t0_kref+0x22f0:   	fbl,a	_kref+0x2300
	.word	0xd828a019	! t0_kref+0x22f4:   	stb	%o4, [%g2 + 0x19]
	.word	0xf19eda59	! t0_kref+0x22f8:   	ldda	[%i3 + %i1]0xd2, %f24
	.word	0xd0566010	! t0_kref+0x22fc:   	ldsh	[%i1 + 0x10], %o0
	.word	0xf51e2018	! t0_kref+0x2300:   	ldd	[%i0 + 0x18], %f26
	.word	0x948dfda7	! t0_kref+0x2304:   	andcc	%l7, -0x259, %o2
	.word	0xf51e7fe8	! t0_kref+0x2308:   	ldd	[%i1 - 0x18], %f26
	.word	0xd216001b	! t0_kref+0x230c:   	lduh	[%i0 + %i3], %o1
	.word	0xc768a084	! t0_kref+0x2310:   	prefetch	%g2 + 0x84, 3
	.word	0xe36e2018	! t0_kref+0x2314:   	prefetch	%i0 + 0x18, 17
	.word	0x9f35e014	! t0_kref+0x2318:   	srl	%l7, 0x14, %o7
	.word	0x953ea007	! t0_kref+0x231c:   	sra	%i2, 0x7, %o2
	.word	0xb7a0053b	! t0_kref+0x2320:   	fsqrts	%f27, %f27
	.word	0xf700a028	! t0_kref+0x2324:   	ld	[%g2 + 0x28], %f27
	.word	0xb7a018da	! t0_kref+0x2328:   	fdtos	%f26, %f27
	.word	0x81ae8ada	! t0_kref+0x232c:   	fcmped	%fcc0, %f26, %f26
	.word	0xab380016	! t0_kref+0x2330:   	sra	%g0, %l6, %l5
	.word	0x94fd400a	! t0_kref+0x2334:   	sdivcc	%l5, %o2, %o2
	.word	0xb7a01a5a	! t0_kref+0x2338:   	fdtoi	%f26, %f27
	call	SYM(t0_subr2)
	.word	0xb7a6c93b	! t0_kref+0x2340:   	fmuls	%f27, %f27, %f27
	.word	0xa8f5ad69	! t0_kref+0x2344:   	udivcc	%l6, 0xd69, %l4
	.word	0xb7a0189b	! t0_kref+0x2348:   	fitos	%f27, %f27
	.word	0xf7060000	! t0_kref+0x234c:   	ld	[%i0], %f27
	.word	0x81ae8a5a	! t0_kref+0x2350:   	fcmpd	%fcc0, %f26, %f26
	.word	0x983d6ed8	! t0_kref+0x2354:   	xnor	%l5, 0xed8, %o4
	.word	0xaad57b54	! t0_kref+0x2358:   	umulcc	%l5, -0x4ac, %l5
	.word	0xeb68a005	! t0_kref+0x235c:   	prefetch	%g2 + 5, 21
	.word	0xa5334014	! t0_kref+0x2360:   	srl	%o5, %l4, %l2
	.word	0x96c34017	! t0_kref+0x2364:   	addccc	%o5, %l7, %o3
	.word	0xb7a6c93b	! t0_kref+0x2368:   	fmuls	%f27, %f27, %f27
	.word	0xec260000	! t0_kref+0x236c:   	st	%l6, [%i0]
	.word	0xee68a000	! t0_kref+0x2370:   	ldstub	[%g2], %l7
	.word	0x92ad7a57	! t0_kref+0x2374:   	andncc	%l5, -0x5a9, %o1
	.word	0xc06e200e	! t0_kref+0x2378:   	ldstub	[%i0 + 0xe], %g0
	.word	0xb5a6885a	! t0_kref+0x237c:   	faddd	%f26, %f26, %f26
	.word	0x29800001	! t0_kref+0x2380:   	fbl,a	_kref+0x2384
	.word	0xb5a688da	! t0_kref+0x2384:   	fsubd	%f26, %f26, %f26
	.word	0xacd30008	! t0_kref+0x2388:   	umulcc	%o4, %o0, %l6
	.word	0x36800003	! t0_kref+0x238c:   	bge,a	_kref+0x2398
	.word	0xa62a4014	! t0_kref+0x2390:   	andn	%o1, %l4, %l3
	.word	0x9a62801a	! t0_kref+0x2394:   	subc	%o2, %i2, %o5
	.word	0xea200018	! t0_kref+0x2398:   	st	%l5, [%g0 + %i0]
	.word	0xb5a6cd3b	! t0_kref+0x239c:   	fsmuld	%f27, %f27, %f26
	.word	0xd4680019	! t0_kref+0x23a0:   	ldstub	[%g0 + %i1], %o2
	.word	0x81aeca3b	! t0_kref+0x23a4:   	fcmps	%fcc0, %f27, %f27
	.word	0xb7a0053b	! t0_kref+0x23a8:   	fsqrts	%f27, %f27
	.word	0xa28b4009	! t0_kref+0x23ac:   	andcc	%o5, %o1, %l1
	.word	0xa9400000	! t0_kref+0x23b0:   	mov	%y, %l4
	.word	0xa255e3c9	! t0_kref+0x23b4:   	umul	%l7, 0x3c9, %l1
	.word	0xf7263fe0	! t0_kref+0x23b8:   	st	%f27, [%i0 - 0x20]
	.word	0xd20e3ff8	! t0_kref+0x23bc:   	ldub	[%i0 - 8], %o1
	.word	0x81aecabb	! t0_kref+0x23c0:   	fcmpes	%fcc0, %f27, %f27
	sethi	%hi(2f), %o7
	.word	0xe40be3f8	! t0_kref+0x23c8:   	ldub	[%o7 + 0x3f8], %l2
	.word	0xa41ca00c	! t0_kref+0x23cc:   	xor	%l2, 0xc, %l2
	.word	0xe42be3f8	! t0_kref+0x23d0:   	stb	%l2, [%o7 + 0x3f8]
	.word	0x81dbe3f8	! t0_kref+0x23d4:   	flush	%o7 + 0x3f8
	.word	0xa42d800a	! t0_kref+0x23d8:   	andn	%l6, %o2, %l2
	.word	0x3f480007	! t0_kref+0x23dc:   	fbo,a,pt	%fcc0, _kref+0x23f8
	.word	0xb5a8405a	! t0_kref+0x23e0:   	fmovdne	%fcc0, %f26, %f26
	.word	0xf56e6018	! t0_kref+0x23e4:   	prefetch	%i1 + 0x18, 26
	.word	0xf51e2008	! t0_kref+0x23e8:   	ldd	[%i0 + 8], %f26
	.word	0x81ae8a5a	! t0_kref+0x23ec:   	fcmpd	%fcc0, %f26, %f26
	.word	0xb7a0013b	! t0_kref+0x23f0:   	fabss	%f27, %f27
	.word	0x9042e6d8	! t0_kref+0x23f4:   	addc	%o3, 0x6d8, %o0
2:	.word	0xf53e0000	! t0_kref+0x23f8:   	std	%f26, [%i0]
	.word	0xa73ac015	! t0_kref+0x23fc:   	sra	%o3, %l5, %l3
	.word	0x81024014	! t0_kref+0x2400:   	taddcc	%o1, %l4, %g0
	.word	0xa454e27b	! t0_kref+0x2404:   	umul	%l3, 0x27b, %l2
	.word	0xa91cc013	! t0_kref+0x2408:   	tsubcctv	%l3, %l3, %l4
	.word	0x8d85400b	! t0_kref+0x240c:   	wr	%l5, %o3, %fprs
	.word	0x20480006	! t0_kref+0x2410:   	bn,a,pt	%icc, _kref+0x2428
	.word	0x945dab68	! t0_kref+0x2414:   	smul	%l6, 0xb68, %o2
	.word	0xf700a028	! t0_kref+0x2418:   	ld	[%g2 + 0x28], %f27
	.word	0xd03f4018	! t0_kref+0x241c:   	std	%o0, [%i5 + %i0]
	.word	0xb5a0193b	! t0_kref+0x2420:   	fstod	%f27, %f26
	.word	0xf53e7ff8	! t0_kref+0x2424:   	std	%f26, [%i1 - 8]
	.word	0x80f20009	! t0_kref+0x2428:   	udivcc	%o0, %o1, %g0
	.word	0xb5a6885a	! t0_kref+0x242c:   	faddd	%f26, %f26, %f26
	.word	0xf7060000	! t0_kref+0x2430:   	ld	[%i0], %f27
	.word	0x9652400c	! t0_kref+0x2434:   	umul	%o1, %o4, %o3
	.word	0xb7a0053b	! t0_kref+0x2438:   	fsqrts	%f27, %f27
	.word	0xab25c013	! t0_kref+0x243c:   	mulscc	%l7, %l3, %l5
	.word	0x3f480006	! t0_kref+0x2440:   	fbo,a,pt	%fcc0, _kref+0x2458
	.word	0xab408000	! t0_kref+0x2444:   	mov	%ccr, %l5
	.word	0x90b2c00b	! t0_kref+0x2448:   	orncc	%o3, %o3, %o0
	.word	0x29800002	! t0_kref+0x244c:   	fbl,a	_kref+0x2454
	.word	0xf51e6010	! t0_kref+0x2450:   	ldd	[%i1 + 0x10], %f26
	.word	0xb5a6885a	! t0_kref+0x2454:   	faddd	%f26, %f26, %f26
	.word	0x9116bdf0	! t0_kref+0x2458:   	taddcctv	%i2, -0x210, %o0
	.word	0x98f2c00b	! t0_kref+0x245c:   	udivcc	%o3, %o3, %o4
	.word	0x81aeca3b	! t0_kref+0x2460:   	fcmps	%fcc0, %f27, %f27
	.word	0xb5a688da	! t0_kref+0x2464:   	fsubd	%f26, %f26, %f26
	.word	0x9052b60c	! t0_kref+0x2468:   	umul	%o2, -0x9f4, %o0
	.word	0x23480004	! t0_kref+0x246c:   	fbne,a,pt	%fcc0, _kref+0x247c
	.word	0xaa2b0009	! t0_kref+0x2470:   	andn	%o4, %o1, %l5
	.word	0xd03f4019	! t0_kref+0x2474:   	std	%o0, [%i5 + %i1]
	.word	0xe6ee1000	! t0_kref+0x2478:   	ldstuba	[%i0]0x80, %l3
	.word	0xb7a0053b	! t0_kref+0x247c:   	fsqrts	%f27, %f27
	.word	0xa4ade660	! t0_kref+0x2480:   	andncc	%l7, 0x660, %l2
	.word	0xf19e1a1b	! t0_kref+0x2484:   	ldda	[%i0 + %i3]0xd0, %f24
	.word	0xaad22742	! t0_kref+0x2488:   	umulcc	%o0, 0x742, %l5
	.word	0xf53f4019	! t0_kref+0x248c:   	std	%f26, [%i5 + %i1]
	.word	0xaf3a201a	! t0_kref+0x2490:   	sra	%o0, 0x1a, %l7
	.word	0xb5a6895a	! t0_kref+0x2494:   	fmuld	%f26, %f26, %f26
	.word	0xd6367ffa	! t0_kref+0x2498:   	sth	%o3, [%i1 - 6]
	.word	0x24800007	! t0_kref+0x249c:   	ble,a	_kref+0x24b8
	.word	0xf19e9a19	! t0_kref+0x24a0:   	ldda	[%i2 + %i1]0xd0, %f24
	.word	0x9e9d3443	! t0_kref+0x24a4:   	xorcc	%l4, -0xbbd, %o7
	.word	0x985aacd4	! t0_kref+0x24a8:   	smul	%o2, 0xcd4, %o4
	.word	0x92568015	! t0_kref+0x24ac:   	umul	%i2, %l5, %o1
	.word	0xb7a01a3b	! t0_kref+0x24b0:   	fstoi	%f27, %f27
	.word	0xa23b400a	! t0_kref+0x24b4:   	xnor	%o5, %o2, %l1
	.word	0xd848a008	! t0_kref+0x24b8:   	ldsb	[%g2 + 8], %o4
	.word	0xb5a688da	! t0_kref+0x24bc:   	fsubd	%f26, %f26, %f26
	sethi	%hi(2f), %o7
	.word	0xe40be100	! t0_kref+0x24c4:   	ldub	[%o7 + 0x100], %l2
	.word	0xa41ca00c	! t0_kref+0x24c8:   	xor	%l2, 0xc, %l2
	.word	0xe42be100	! t0_kref+0x24cc:   	stb	%l2, [%o7 + 0x100]
	.word	0x81dbe100	! t0_kref+0x24d0:   	flush	%o7 + 0x100
	.word	0xe830a03a	! t0_kref+0x24d4:   	sth	%l4, [%g2 + 0x3a]
	.word	0xb7a0003b	! t0_kref+0x24d8:   	fmovs	%f27, %f27
	.word	0xd600a010	! t0_kref+0x24dc:   	ld	[%g2 + 0x10], %o3
	.word	0x9ad36c33	! t0_kref+0x24e0:   	umulcc	%o5, 0xc33, %o5
	.word	0xa6a4c00a	! t0_kref+0x24e4:   	subcc	%l3, %o2, %l3
	.word	0xee08a015	! t0_kref+0x24e8:   	ldub	[%g2 + 0x15], %l7
	.word	0xe86e2004	! t0_kref+0x24ec:   	ldstub	[%i0 + 4], %l4
	.word	0xb7a018da	! t0_kref+0x24f0:   	fdtos	%f26, %f27
	.word	0xae9b0016	! t0_kref+0x24f4:   	xorcc	%o4, %l6, %l7
	.word	0xb7a8803b	! t0_kref+0x24f8:   	fmovslg	%fcc0, %f27, %f27
	.word	0x9335c009	! t0_kref+0x24fc:   	srl	%l7, %o1, %o1
2:	.word	0xf7270019	! t0_kref+0x2500:   	st	%f27, [%i4 + %i1]
	.word	0xc07f0018	! t0_kref+0x2504:   	swap	[%i4 + %i0], %g0
	.word	0xe4567ffc	! t0_kref+0x2508:   	ldsh	[%i1 - 4], %l2
	.word	0xf1be5a5d	! t0_kref+0x250c:   	stda	%f24, [%i1 + %i5]0xd2
	.word	0x98630014	! t0_kref+0x2510:   	subc	%o4, %l4, %o4
	.word	0x8d826ccc	! t0_kref+0x2514:   	wr	%o1, 0xccc, %fprs
	.word	0xb7a01a5a	! t0_kref+0x2518:   	fdtoi	%f26, %f27
	.word	0xb7a0013b	! t0_kref+0x251c:   	fabss	%f27, %f27
	.word	0xd2ee9018	! t0_kref+0x2520:   	ldstuba	[%i2 + %i0]0x80, %o1
	.word	0xf700a00c	! t0_kref+0x2524:   	ld	[%g2 + 0xc], %f27
	.word	0xb7a0053b	! t0_kref+0x2528:   	fsqrts	%f27, %f27
	.word	0xe80e001a	! t0_kref+0x252c:   	ldub	[%i0 + %i2], %l4
	.word	0x95400000	! t0_kref+0x2530:   	mov	%y, %o2
	.word	0xea30a032	! t0_kref+0x2534:   	sth	%l5, [%g2 + 0x32]
	.word	0xc07e601c	! t0_kref+0x2538:   	swap	[%i1 + 0x1c], %g0
	.word	0xf7063fe0	! t0_kref+0x253c:   	ld	[%i0 - 0x20], %f27
	.word	0xb7a6c93b	! t0_kref+0x2540:   	fmuls	%f27, %f27, %f27
!	call	0xfffff8b8
	.word	0xaaab0009	! t0_kref+0x2548:   	andncc	%o4, %o1, %l5
	.word	0xac64c014	! t0_kref+0x254c:   	subc	%l3, %l4, %l6
	.word	0x9265f9df	! t0_kref+0x2550:   	subc	%l7, -0x621, %o1
	.word	0xb7a6c93b	! t0_kref+0x2554:   	fmuls	%f27, %f27, %f27
	call	SYM(t0_subr2)
	.word	0xb5a689da	! t0_kref+0x255c:   	fdivd	%f26, %f26, %f26
	.word	0x81580000	! t0_kref+0x2560:   	flushw
	.word	0xee480019	! t0_kref+0x2564:   	ldsb	[%g0 + %i1], %l7
	.word	0x94d5c00c	! t0_kref+0x2568:   	umulcc	%l7, %o4, %o2
	.word	0xee10a02e	! t0_kref+0x256c:   	lduh	[%g2 + 0x2e], %l7
	.word	0x942b4014	! t0_kref+0x2570:   	andn	%o5, %l4, %o2
	.word	0xd430a010	! t0_kref+0x2574:   	sth	%o2, [%g2 + 0x10]
	.word	0xa415e9ff	! t0_kref+0x2578:   	or	%l7, 0x9ff, %l2
	.word	0x3b800008	! t0_kref+0x257c:   	fble,a	_kref+0x259c
	.word	0x803cc016	! t0_kref+0x2580:   	xnor	%l3, %l6, %g0
	.word	0xb7a000bb	! t0_kref+0x2584:   	fnegs	%f27, %f27
	.word	0xe826200c	! t0_kref+0x2588:   	st	%l4, [%i0 + 0xc]
	.word	0xb7a6c93b	! t0_kref+0x258c:   	fmuls	%f27, %f27, %f27
	.word	0x9fc10000	! t0_kref+0x2590:   	call	%g4
	.word	0xb7a000bb	! t0_kref+0x2594:   	fnegs	%f27, %f27
	.word	0xa22da7bf	! t0_kref+0x2598:   	andn	%l6, 0x7bf, %l1
	.word	0x33800003	! t0_kref+0x259c:   	fbe,a	_kref+0x25a8
	.word	0xea36001b	! t0_kref+0x25a0:   	sth	%l5, [%i0 + %i3]
	.word	0xf51fbe48	! t0_kref+0x25a4:   	ldd	[%fp - 0x1b8], %f26
	.word	0xf5bf5018	! t0_kref+0x25a8:   	stda	%f26, [%i5 + %i0]0x80
	.word	0xeb68a042	! t0_kref+0x25ac:   	prefetch	%g2 + 0x42, 21
	sethi	%hi(2f), %o7
	.word	0xe40be1cc	! t0_kref+0x25b4:   	ldub	[%o7 + 0x1cc], %l2
	.word	0xa41ca00c	! t0_kref+0x25b8:   	xor	%l2, 0xc, %l2
	.word	0xe42be1cc	! t0_kref+0x25bc:   	stb	%l2, [%o7 + 0x1cc]
	.word	0x81dbe1cc	! t0_kref+0x25c0:   	flush	%o7 + 0x1cc
	.word	0xa8082019	! t0_kref+0x25c4:   	and	%g0, 0x19, %l4
	.word	0xf7000018	! t0_kref+0x25c8:   	ld	[%g0 + %i0], %f27
2:	.word	0xd4e81018	! t0_kref+0x25cc:   	ldstuba	[%g0 + %i0]0x80, %o2
	.word	0xb7a018da	! t0_kref+0x25d0:   	fdtos	%f26, %f27
	.word	0xda56401b	! t0_kref+0x25d4:   	ldsh	[%i1 + %i3], %o5
	.word	0xf53e001d	! t0_kref+0x25d8:   	std	%f26, [%i0 + %i5]
	.word	0xb7a0053b	! t0_kref+0x25dc:   	fsqrts	%f27, %f27
	.word	0xc5ee1013	! t0_kref+0x25e0:   	prefetcha	%i0 + %l3, 2
	.word	0xb7a6c8bb	! t0_kref+0x25e4:   	fsubs	%f27, %f27, %f27
	.word	0xf19e1a1a	! t0_kref+0x25e8:   	ldda	[%i0 + %i2]0xd0, %f24
	.word	0xa63d0017	! t0_kref+0x25ec:   	xnor	%l4, %l7, %l3
	.word	0xed68a082	! t0_kref+0x25f0:   	prefetch	%g2 + 0x82, 22
	.word	0xaca30014	! t0_kref+0x25f4:   	subcc	%o4, %l4, %l6
	sethi	%hi(2f), %o7
	.word	0xe40be23c	! t0_kref+0x25fc:   	ldub	[%o7 + 0x23c], %l2
	.word	0xa41ca00c	! t0_kref+0x2600:   	xor	%l2, 0xc, %l2
	.word	0xe42be23c	! t0_kref+0x2604:   	stb	%l2, [%o7 + 0x23c]
	.word	0x81dbe23c	! t0_kref+0x2608:   	flush	%o7 + 0x23c
	.word	0x9e137630	! t0_kref+0x260c:   	or	%o5, -0x9d0, %o7
	.word	0x33800008	! t0_kref+0x2610:   	fbe,a	_kref+0x2630
	.word	0x85824014	! t0_kref+0x2614:   	wr	%o1, %l4, %ccr
	.word	0xaadb6bb3	! t0_kref+0x2618:   	smulcc	%o5, 0xbb3, %l5
	.word	0x8143c000	! t0_kref+0x261c:   	stbar
	.word	0xda10a00e	! t0_kref+0x2620:   	lduh	[%g2 + 0xe], %o5
	.word	0x900b0008	! t0_kref+0x2624:   	and	%o4, %o0, %o0
	.word	0x9532000a	! t0_kref+0x2628:   	srl	%o0, %o2, %o2
	.word	0xd2d81018	! t0_kref+0x262c:   	ldxa	[%g0 + %i0]0x80, %o1
	call	SYM(t0_subr3)
	.word	0xb7a0013b	! t0_kref+0x2634:   	fabss	%f27, %f27
	.word	0xd4380019	! t0_kref+0x2638:   	std	%o2, [%g0 + %i1]
2:	.word	0xde00a02c	! t0_kref+0x263c:   	ld	[%g2 + 0x2c], %o7
	.word	0x97644016	! t0_kref+0x2640:   	move	%icc, %l6, %o3
	.word	0xf51e3fe0	! t0_kref+0x2644:   	ldd	[%i0 - 0x20], %f26
	.word	0x81aecabb	! t0_kref+0x2648:   	fcmpes	%fcc0, %f27, %f27
	.word	0xa3418000	! t0_kref+0x264c:   	mov	%fprs, %l1
	.word	0xa60d8015	! t0_kref+0x2650:   	and	%l6, %l5, %l3
	.word	0xd228a01d	! t0_kref+0x2654:   	stb	%o1, [%g2 + 0x1d]
	.word	0x96868014	! t0_kref+0x2658:   	addcc	%i2, %l4, %o3
	.word	0x81ae8ada	! t0_kref+0x265c:   	fcmped	%fcc0, %f26, %f26
	.word	0xb7a6c9bb	! t0_kref+0x2660:   	fdivs	%f27, %f27, %f27
	.word	0xb7a018da	! t0_kref+0x2664:   	fdtos	%f26, %f27
	.word	0x9e12c01a	! t0_kref+0x2668:   	or	%o3, %i2, %o7
	.word	0x9e35c017	! t0_kref+0x266c:   	orn	%l7, %l7, %o7
	.word	0x38800004	! t0_kref+0x2670:   	bgu,a	_kref+0x2680
	.word	0xa2ddc013	! t0_kref+0x2674:   	smulcc	%l7, %l3, %l1
	.word	0x801326b1	! t0_kref+0x2678:   	or	%o4, 0x6b1, %g0
	.word	0xd40e7feb	! t0_kref+0x267c:   	ldub	[%i1 - 0x15], %o2
	.word	0x3a800002	! t0_kref+0x2680:   	bcc,a	_kref+0x2688
	.word	0xe7002ab0	! t0_kref+0x2684:   	ld	[%g0 + 0xab0], %f19
	.word	0xf1be7fe0	! t0_kref+0x2688:   	stda	%f24, [%i1 - 0x20]%asi
	.word	0xf5380018	! t0_kref+0x268c:   	std	%f26, [%g0 + %i0]
	.word	0xf700a03c	! t0_kref+0x2690:   	ld	[%g2 + 0x3c], %f27
	.word	0xff6e7fe8	! t0_kref+0x2694:   	prefetch	%i1 - 0x18, 31
	.word	0xb5a688da	! t0_kref+0x2698:   	fsubd	%f26, %f26, %f26
	.word	0x81dac019	! t0_kref+0x269c:   	flush	%o3 + %i1
	.word	0xb5a689da	! t0_kref+0x26a0:   	fdivd	%f26, %f26, %f26
	.word	0xb7a6c9bb	! t0_kref+0x26a4:   	fdivs	%f27, %f27, %f27
	.word	0x81ae8a5a	! t0_kref+0x26a8:   	fcmpd	%fcc0, %f26, %f26
	.word	0xa6d4fb9f	! t0_kref+0x26ac:   	umulcc	%l3, -0x461, %l3
	.word	0x3c800005	! t0_kref+0x26b0:   	bpos,a	_kref+0x26c4
	.word	0x9e828009	! t0_kref+0x26b4:   	addcc	%o2, %o1, %o7
	.word	0x9e124016	! t0_kref+0x26b8:   	or	%o1, %l6, %o7
	.word	0xea28a031	! t0_kref+0x26bc:   	stb	%l5, [%g2 + 0x31]
	.word	0xb7a0053b	! t0_kref+0x26c0:   	fsqrts	%f27, %f27
	.word	0xc368a08f	! t0_kref+0x26c4:   	prefetch	%g2 + 0x8f, 1
	.word	0x2b800007	! t0_kref+0x26c8:   	fbug,a	_kref+0x26e4
	.word	0x992576e0	! t0_kref+0x26cc:   	mulscc	%l5, -0x920, %o4
	.word	0xe24e601a	! t0_kref+0x26d0:   	ldsb	[%i1 + 0x1a], %l1
	.word	0x94656b49	! t0_kref+0x26d4:   	subc	%l5, 0xb49, %o2
	.word	0xb7a01a5a	! t0_kref+0x26d8:   	fdtoi	%f26, %f27
	.word	0x30480006	! t0_kref+0x26dc:   	ba,a,pt	%icc, _kref+0x26f4
	.word	0x9e123cef	! t0_kref+0x26e0:   	or	%o0, -0x311, %o7
	.word	0xa212ae13	! t0_kref+0x26e4:   	or	%o2, 0xe13, %l1
	.word	0xa23b31f5	! t0_kref+0x26e8:   	xnor	%o4, -0xe0b, %l1
	.word	0x9fc10000	! t0_kref+0x26ec:   	call	%g4
	.word	0x9644c01a	! t0_kref+0x26f0:   	addc	%l3, %i2, %o3
	.word	0xb7a000bb	! t0_kref+0x26f4:   	fnegs	%f27, %f27
	.word	0xd400a02c	! t0_kref+0x26f8:   	ld	[%g2 + 0x2c], %o2
	.word	0xb7a01a3b	! t0_kref+0x26fc:   	fstoi	%f27, %f27
	.word	0xd4160000	! t0_kref+0x2700:   	lduh	[%i0], %o2
	.word	0xaa7da213	! t0_kref+0x2704:   	sdiv	%l6, 0x213, %l5
	.word	0xeeb01018	! t0_kref+0x2708:   	stha	%l7, [%g0 + %i0]0x80
	.word	0xea6e3fe3	! t0_kref+0x270c:   	ldstub	[%i0 - 0x1d], %l5
	.word	0xa2a8000b	! t0_kref+0x2710:   	andncc	%g0, %o3, %l1
	.word	0xac350014	! t0_kref+0x2714:   	orn	%l4, %l4, %l6
	.word	0x31800001	! t0_kref+0x2718:   	fba,a	_kref+0x271c
	.word	0xe628a037	! t0_kref+0x271c:   	stb	%l3, [%g2 + 0x37]
	.word	0x96b6bdac	! t0_kref+0x2720:   	orncc	%i2, -0x254, %o3
	.word	0xe830a016	! t0_kref+0x2724:   	sth	%l4, [%g2 + 0x16]
	.word	0xba102018	! t0_kref+0x2728:   	mov	0x18, %i5
	.word	0x9415e0b5	! t0_kref+0x272c:   	or	%l7, 0xb5, %o2
	.word	0xb7a6c8bb	! t0_kref+0x2730:   	fsubs	%f27, %f27, %f27
	.word	0x92134017	! t0_kref+0x2734:   	or	%o5, %l7, %o1
	.word	0xaeab34ff	! t0_kref+0x2738:   	andncc	%o4, -0xb01, %l7
	.word	0x9816b5e2	! t0_kref+0x273c:   	or	%i2, -0xa1e, %o4
	.word	0xf7266018	! t0_kref+0x2740:   	st	%f27, [%i1 + 0x18]
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x2748:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x10308000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x258aa000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x1035c000)
.seg "text"
t0_subr2_page_begin:
	.skip 8192
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x10266000)
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
!  Total operations: 2423  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.73   0.78
!  ldub              0.85   1.32
!  ldsh              1.48   1.32
!  lduh              0.56   0.58
!  ld                1.11   0.87
!  ldd               0.28   0.29
!  swap              1.32   1.36
!  ldstub            1.11   1.16
!  stb               0.21   0.37
!  sth               0.32   0.41
!  st                0.77   1.03
!  std               1.13   0.99
!  add               0.24   0.33
!  addcc             0.89   1.03
!  addx              1.25   1.20
!  addxcc            0.72   0.74
!  taddcc            0.27   0.25
!  taddcctv          0.17   0.29
!  sub               0.50   0.17
!  subcc             1.46   1.44
!  subx              0.96   0.91
!  subxcc            0.19   0.17
!  tsubcc            0.03   0.00
!  tsubcctv          0.18   0.21
!  mulscc            0.18   0.08
!  and               1.14   1.03
!  andcc             0.75   0.66
!  andn              0.92   1.16
!  andncc            1.06   1.32
!  or                1.08   1.32
!  orcc              0.28   0.17
!  orn               0.60   0.74
!  orncc             1.23   1.57
!  xor               0.06   0.04
!  xorcc             0.60   0.83
!  xnor              1.04   1.11
!  xnorcc            1.11   0.95
!  sll               0.12   0.08
!  srl               1.07   1.28
!  sra               1.20   1.57
!  unimp             0.02   0.04
!  umul              1.21   1.53
!  smul              1.03   0.74
!  udiv              0.42   0.58
!  sdiv              0.02   0.12
!  umulcc            1.40   1.40
!  smulcc            0.58   0.78
!  udivcc            1.19   1.44
!  sdivcc            0.47   0.45
!  rdy               0.89   0.99
!  wry               0.02   0.04
!  bicc              3.22   3.67
!  sethi             0.33   0.37
!  jmpl              1.05   1.03
!  call              1.30   1.61
!  ticc              0.00   0.00
!  flush             1.07   1.11
!  save              0.65   0.17
!  restore           1.51   0.00
!  stbar             0.90   0.70
!  ldf               1.43   1.98
!  lddf              1.08   1.32
!  stf               1.00   0.91
!  stdf              1.06   1.36
!  fadds             0.12   0.25
!  fsubs             0.75   0.66
!  fmuls             1.31   1.28
!  fdivs             1.21   1.20
!  faddd             0.40   0.25
!  fsubd             0.85   1.03
!  fmuld             0.79   0.74
!  fdivd             1.11   0.74
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.47   0.58
!  fdmulq            0.00   0.00
!  fitos             1.15   1.24
!  fitod             0.07   0.08
!  fitoq             0.00   0.00
!  fstoi             0.81   0.83
!  fstod             0.64   0.70
!  fstoq             0.00   0.00
!  fdtoi             0.91   0.95
!  fdtos             1.32   1.28
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.10   1.24
!  fnegs             1.17   1.20
!  fabss             0.81   0.87
!  fsqrts            2.44   2.72
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.47   0.45
!  fcmpd             0.67   0.78
!  fcmpq             0.00   0.00
!  fcmpes            1.15   0.99
!  fcmped            0.97   0.66
!  fcmpeq            0.00   0.00
!  fbfcc             2.11   2.27
!  ldfsr             0.05   0.00
!  stfsr             0.30   0.17
!  loop              0.36   0.25
!  offset            0.28   0.37
!  area              0.10   0.08
!  target            0.08   0.08
!  goto              0.10   0.08
!  sigsegv           0.25   0.21
!  sigbus            0.08   0.08
!  imodify           1.03   0.74
!  ldfsr_offset      0.21   0.00
!  fpattern          0.43   0.37
!  lbranch           0.19   0.08
!  shmld             4.97   5.32
!  shmst             2.78   3.18
!  shmpf             0.52   0.70
!  shmswap           0.10   0.21
!  shmblkld          0.71   0.00
!  shmblkst          1.10   0.00
!  shmblkchk         0.24   0.08
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
!  casa              0.22   0.29
!  rdasi             0.02   0.00
!  wrasi             0.12   0.00
!  bpcc              1.63   1.65
!  fbpfcc            1.38   1.44
!  fmovscc           0.14   0.29
!  fmovdcc           0.13   0.25
!  fmovqcc           0.00   0.00
!  movcc             0.23   0.12
!  flushw            0.24   0.41
!  membar            0.22   0.12
!  prefetch          0.97   0.95
!  rdpc              0.13   0.04
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.28   0.21
!  lddfa             0.11   0.17
!  ldqfa             0.00   0.00
!  ldsba             0.08   0.12
!  ldsha             0.20   0.21
!  lduba             0.04   0.04
!  lduha             0.04   0.00
!  lda               0.17   0.25
!  ldda              0.10   0.12
!  ldstuba           0.08   0.21
!  prefetcha         0.14   0.12
!  stfa              0.10   0.00
!  stdfa             0.24   0.37
!  stqfa             0.00   0.00
!  stba              0.06   0.00
!  stha              0.27   0.21
!  sta               0.22   0.04
!  stda              0.00   0.00
!  swapa             0.20   0.21
!  fmovd             0.03   0.04
!  fnegd             0.07   0.00
!  fabsd             0.06   0.00
!  fstox             0.06   0.00
!  fdtox             0.19   0.08
!  fxtos             0.04   0.04
!  fxtod             0.10   0.04
!  lds               0.15   0.25
!  ldsa              0.26   0.25
!  ldx               0.17   0.04
!  ldxa              0.17   0.17
!  nofault           0.25   0.37
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
!  partial_st8       0.15   0.17
!  partial_st16      0.06   0.04
!  partial_st32      0.30   0.21
!  short_st8         0.06   0.00
!  short_st16        0.18   0.21
!  short_ld8         0.17   0.29
!  short_ld16        0.29   0.25
!  blkld             0.07   0.00
!  blkst             0.16   0.00
!  blkld_offset      0.01   0.00
!  blkst_offset      0.08   0.00
!  blk_check         0.04   0.00
!  casxa             0.23   0.12
!  rdccr             0.27   0.17
!  rdfprs            0.17   0.12
!  wrccr             0.12   0.12
!  popc              0.06   0.04
!  wrfprs            0.27   0.33
!  stx               0.13   0.12
!  stxa              0.17   0.21
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
KDATA_MODULE(t0_module_offset_table, 0x6e7de000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xffffffe8
	.word	0x00000000
	.word	0xffffffe0
	.word	0xfffffff0
	.word	0x00000018
	.word	0x00000008
	.word	0x00000010
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

KDATA_MODULE(t0_module_data_in_regs, 0x29e62000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x76dbbf33          ! %f0
	.word	0x6c6be260          ! %f1
	.word	0xc1afc996          ! %f2
	.word	0xf312e9e9          ! %f3
	.word	0xfc6bc9ca          ! %f4
	.word	0x3784fb72          ! %f5
	.word	0xd8c21e39          ! %f6
	.word	0x93ea362d          ! %f7
	.word	0xddbdd6fb          ! %f8
	.word	0xa96db99b          ! %f9
	.word	0xdcff3d10          ! %f10
	.word	0x033671ed          ! %f11
	.word	0x74435a62          ! %f12
	.word	0xd26a9d15          ! %f13
	.word	0x9b972b35          ! %f14
	.word	0x112ffa6a          ! %f15
	.word	0x0170e8aa          ! %f16
	.word	0x4f57ed17          ! %f17
	.word	0x49051582          ! %f18
	.word	0x8a6db9ab          ! %f19
	.word	0xdd93f143          ! %f20
	.word	0x8971817d          ! %f21
	.word	0x43798368          ! %f22
	.word	0x1c3742c8          ! %f23
	.word	0x7adddf51          ! %f24
	.word	0xfa9b02a8          ! %f25
	.word	0xad3462ff          ! %f26
	.word	0x6e25ee64          ! %f27
	.word	0xd04bd5e7          ! %f28
	.word	0x7d11c3a2          ! %f29
	.word	0x766b425f          ! %f30
	.word	0xe21cbb7a          ! %f31
	.word	0xf6d17b74          ! %f32
	.word	0xd05f9a86          ! %f33
	.word	0x5b494a2d          ! %f34
	.word	0x0dd6f85d          ! %f35
	.word	0x5ea0887d          ! %f36
	.word	0x38f85b1e          ! %f37
	.word	0x9d5bcd78          ! %f38
	.word	0xa6c9f7f9          ! %f39
	.word	0x19ce0d8c          ! %f40
	.word	0xda61d7cd          ! %f41
	.word	0xe19782c5          ! %f42
	.word	0xb216575e          ! %f43
	.word	0x9831a468          ! %f44
	.word	0xaf608caf          ! %f45
	.word	0xfa4fba68          ! %f46
	.word	0x8b09977f          ! %f47
	.word	0x956a0085          ! %f48
	.word	0xbea158fe          ! %f49
	.word	0x703a2615          ! %f50
	.word	0xf3790f36          ! %f51
	.word	0x58b592bd          ! %f52
	.word	0xeefaeab7          ! %f53
	.word	0x1c2f05b6          ! %f54
	.word	0x5e4b798a          ! %f55
	.word	0x26053440          ! %f56
	.word	0x22e7c07d          ! %f57
	.word	0xedfecd7e          ! %f58
	.word	0xfe16a434          ! %f59
	.word	0x7b9a0cc9          ! %f60
	.word	0xa183e5bc          ! %f61
	.word	0x40b3993d          ! %f62
	.word	0x9c0b025f          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x8c4       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x028b11ab          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x21d7f544          ! %o0
	.word	0x41f70266          ! %o1
	.word	0x0952f586          ! %o2
	.word	0xd7365480          ! %o3
	.word	0x5dcdd931          ! %o4
	.word	0xef331e89          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x7edf2812          ! %l0
	.word	0x4a67cd10          ! %l1
	.word	0x9b2600f5          ! %l2
	.word	0x9ebf27b0          ! %l3
	.word	0x91426e8a          ! %l4
	.word	0x436bece8          ! %l5
	.word	0x0a3222ae          ! %l6
	.word	0x01096f85          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000006          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000010          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x2c373a0b          ! %y
	.word	0x00000006          ! %icc (nzvc)
	.word	0x80000e7b          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x1497e000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xb8ac1d40
	.word	0x3d64e19b
	.word	0x9bd0c3b5
	.word	0x870ad787
	.word	0xd7e3f0d7
	.word	0x5b8f24a9
	.word	0x7e3dbd18
	.word	0xf3e15ed7
	.word	0xdab76742
	.word	0xfc254e19
	.word	0xf599b9ca
	.word	0x8e3ebfee
	.word	0x25e60d3a
	.word	0x9a07e71b
	.word	0xebcc36e6
	.word	0xf958b9ab
	.word	0x8aa8b887
	.word	0xed147b07
	.word	0x3b4e2c75
	.word	0x08d8564e
	.word	0x87690392
	.word	0x95bc2d5c
	.word	0xccbf8524
	.word	0x14f99b17
	.word	0xb43c6e37
	.word	0x085f2c04
	.word	0x442fdd37
	.word	0xbf040e2d
	.word	0xd8b037e0
	.word	0x5d7681dc
	.word	0xbfbfbcbe
	.word	0xb62b36c1
	.word	0xcbb046cf
	.word	0x342a0d74
	.word	0x81dec105
	.word	0xdc347b73
	.word	0xd024b0ba
	.word	0xea88a012
	.word	0x5cbe6950
	.word	0xf73202f4
	.word	0x7686b89c
	.word	0x5d7488fd
	.word	0x49d87ac7
	.word	0xb0787aec
	.word	0x0e6755c9
	.word	0xfab710f7
	.word	0xf2e32faf
	.word	0xe2efe91d
	.word	0x9fee9843
	.word	0xc5d1aa0a
	.word	0xb07ca5da
	.word	0x7a3deac7
	.word	0x0dfc7e4c
	.word	0x9c4bd787
	.word	0xf97a4060
	.word	0x534a064e
	.word	0x0b090f3c
	.word	0x64a9124b
	.word	0xb35ff08f
	.word	0x8382f31a
	.word	0xae6acf94
	.word	0x44222d44
	.word	0xc44e9a1f
	.word	0x2155fbbe
	.word	0xc287e252
	.word	0x9ef1fe33
	.word	0x9ff806aa
	.word	0x7bb7de5b
	.word	0xf7e76b86
	.word	0xadbd4eb3
	.word	0xef1a1c5a
	.word	0xa2b0cf46
	.word	0x7a5e0825
	.word	0x449a5979
	.word	0x7aea4be3
	.word	0x1dd381e8
	.word	0x7de96f1c
	.word	0xf5bc57dc
	.word	0xfef569b4
	.word	0xb9a15be5
	.word	0x157c8fa8
	.word	0xb70be397
	.word	0xab876668
	.word	0xe05c3680
	.word	0x783ec0e4
	.word	0x573d30ce
	.word	0xebf19a82
	.word	0x0fe8523e
	.word	0x06d5d6a3
	.word	0x5881644e
	.word	0x563d995a
	.word	0xa36760c8
	.word	0x437c2f7f
	.word	0xb5008a19
	.word	0xa045bf51
	.word	0x6e5fc915
	.word	0x32211031
	.word	0xe81df020
	.word	0xa00bef4b
	.word	0x0ed189c8
	.word	0x7ae2e023
	.word	0x9f60e952
	.word	0xfdba335e
	.word	0x85cc5dd6
	.word	0x46181b43
	.word	0x3af83cd5
	.word	0x8c4034c6
	.word	0x9931076b
	.word	0x47150d1a
	.word	0xd86ec592
	.word	0xa53bbf1c
	.word	0xe781e50e
	.word	0x4729a91c
	.word	0xd68c05f7
	.word	0x4509c2c7
	.word	0xfe453502
	.word	0xce341441
	.word	0x6fc3b3f7
	.word	0x8fc08ab2
	.word	0x5ebdaaef
	.word	0x26d9b3d4
	.word	0x4d438155
	.word	0x66ab193f
	.word	0x41e43bc2
	.word	0xeb41d58a
	.word	0x6fdea422
	.word	0x82e8e07a
	.word	0x55d843d1
	.word	0xd14a44d5
	.word	0xe20ae384
	.word	0x54544992
	.word	0x3aa96b41
	.word	0x73df617a
	.word	0xbf1b2cb8
	.word	0x8f05bf84
	.word	0x74b0ecab
	.word	0x0fa68b61
	.word	0xe41ff459
	.word	0xb4f03118
	.word	0x05e621fd
	.word	0x5cc2f7ab
	.word	0x4695e7e1
	.word	0x0f6f3e11
	.word	0x2ff47b9e
	.word	0xfb6a4309
	.word	0x688fb370
	.word	0xf56e839f
	.word	0xb49745d5
	.word	0xfe7f554b
	.word	0xa98fdfcc
	.word	0x1954bc18
	.word	0x9321e06b
	.word	0x83bf6a37
	.word	0x83140ca9
	.word	0x1554a5e7
	.word	0xf7614c8e
	.word	0x9576539c
	.word	0xd8230b29
	.word	0xe070e5c4
	.word	0x296e34f7
	.word	0xb36c48a6
	.word	0xe4439ca5
	.word	0x119f5825
	.word	0x8dd4d44f
	.word	0xd910d672
	.word	0x9059d9ad
	.word	0x5c4b85f3
	.word	0x8bea5dce
t0_data_in_sp:
	.word	0xfb0bc5e4
	.word	0xcf45854d
	.word	0xf93f3081
	.word	0xc37dcc25
	.word	0x2f960ab8
	.word	0x70fbd092
	.word	0x63f328b9
	.word	0xc58c3a9e
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffffe
	.word	0x00000018
	.word	0xfffffff8
	.word	0xffffffe8
	.word	t0_data_in_fp
	.word	0x99a13714
	.word	0x89588ddb
	.word	0x6ffd66b7
	.word	0xda1f9135
	.word	0x22d2ed90
	.word	0x99ba68fa
	.word	0xa1bd3fb4
	.word	0xc64b4f9d
	.word	0xf3dfd2f5
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
	.word   	0x38b5eb55	! [%fp - 0xc]
	.word   	0x26518992	! [%fp - 0x8]
	.word   	0x6844380a	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x69b2a3cd
	.word	0xf699d1ac
	.word	0x56d87a79
	.word	0x9d70b9f3
	.word	0x29a2b4f9
	.word	0x03abffd5
	.word	0xad063747
	.word	0xb7550c36
	.word	0xe9b138f9
	.word	0x512b16a8
	.word	0x127ae46c
	.word	0xe0953628
	.word	0xfcff156b
	.word	0x8afef53d
	.word	0xf8ee6115
	.word	0x6ee615ec
	.word	0x708c0cd1
	.word	0x8d539959
	.word	0x15ba108c
	.word	0xe7d7f808
	.word	0x2e184097
	.word	0x2d1d1324
	.word	0x10eb55de
	.word	0x59fa9435
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x47378000)
.seg "data"
t0_data_in_area0_start:
.skip 4288
t0_data_in_area0_begin:
	.word	0x310d4f53	! t0_data_in_area0-0x20
	.word	0x0f3a8020	! t0_data_in_area0-0x1c
	.word	0x7d8fa5bd	! t0_data_in_area0-0x18
	.word	0xa3838376	! t0_data_in_area0-0x14
	.word	0x5be4934e	! t0_data_in_area0-0x10
	.word	0x7ad94156	! t0_data_in_area0-0xc
	.word	0xa09552a8	! t0_data_in_area0-0x8
	.word	0x809d836b	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xafd44542	! t0_data_in_area0+0x0
	.word	0xa018e0d1	! t0_data_in_area0+0x4
	.word	0xe3aa7748	! t0_data_in_area0+0x8
	.word	0x87181ae6	! t0_data_in_area0+0xc
	.word	0x54e58765	! t0_data_in_area0+0x10
	.word	0x77035a50	! t0_data_in_area0+0x14
	.word	0xf435a31d	! t0_data_in_area0+0x18
	.word	0x209473be	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 3840
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x6898a000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x12319ca6	! t0_data_in_shm_area+0x0 (t0)
	.word	0xdbf4bb36	! t0_data_in_shm_area+0x4 (t0)
	.word	0x021a2d59	! t0_data_in_shm_area+0x8 (t0)
	.word	0xc8c57de3	! t0_data_in_shm_area+0xc (t0)
	.word	0x1d24d035	! t0_data_in_shm_area+0x10 (t0)
	.word	0xd0c84dc5	! t0_data_in_shm_area+0x14 (t0)
	.word	0x00b4520b	! t0_data_in_shm_area+0x18 (t0)
	.word	0x5026afb2	! t0_data_in_shm_area+0x1c (t0)
	.word	0xd789d149	! t0_data_in_shm_area+0x20 (t0)
	.word	0x2cd0c38b	! t0_data_in_shm_area+0x24 (t0)
	.word	0x44977d80	! t0_data_in_shm_area+0x28 (t0)
	.word	0x35edf78b	! t0_data_in_shm_area+0x2c (t0)
	.word	0x8708871d	! t0_data_in_shm_area+0x30 (t0)
	.word	0x9c04131b	! t0_data_in_shm_area+0x34 (t0)
	.word	0x0c5b69e6	! t0_data_in_shm_area+0x38 (t0)
	.word	0xbb32b29f	! t0_data_in_shm_area+0x3c (t0)
	.word	0xe1efa13a	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x9f1afd00	! t0_data_in_shm_area+0x44
	.word	0x086af331	! t0_data_in_shm_area+0x48
	.word	0x968cbd0e	! t0_data_in_shm_area+0x4c
	.word	0x9cd067fc	! t0_data_in_shm_area+0x50
	.word	0x85ef6bee	! t0_data_in_shm_area+0x54
	.word	0x8791c541	! t0_data_in_shm_area+0x58
	.word	0xf80bef30	! t0_data_in_shm_area+0x5c
	.word	0xd6e8914e	! t0_data_in_shm_area+0x60
	.word	0xca64243b	! t0_data_in_shm_area+0x64
	.word	0xaa344844	! t0_data_in_shm_area+0x68
	.word	0x3a999c32	! t0_data_in_shm_area+0x6c
	.word	0x40ce1db7	! t0_data_in_shm_area+0x70
	.word	0x27d3768d	! t0_data_in_shm_area+0x74
	.word	0xa6ef6f59	! t0_data_in_shm_area+0x78
	.word	0x66dae5e5	! t0_data_in_shm_area+0x7c
	.word	0x4d8d819a	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xa0a9e9d3	! t0_data_in_shm_area+0x84
	.word	0x67144d75	! t0_data_in_shm_area+0x88
	.word	0xd5c3f9d2	! t0_data_in_shm_area+0x8c
	.word	0x5aaa9eb9	! t0_data_in_shm_area+0x90
	.word	0xe4ad1078	! t0_data_in_shm_area+0x94
	.word	0x5a4d948a	! t0_data_in_shm_area+0x98
	.word	0x6b798b91	! t0_data_in_shm_area+0x9c
	.word	0xf37951fa	! t0_data_in_shm_area+0xa0
	.word	0x35bdfcd6	! t0_data_in_shm_area+0xa4
	.word	0x84fb62e5	! t0_data_in_shm_area+0xa8
	.word	0x3f1f205a	! t0_data_in_shm_area+0xac
	.word	0xa04a996e	! t0_data_in_shm_area+0xb0
	.word	0xb1ea08e8	! t0_data_in_shm_area+0xb4
	.word	0x4eb402d7	! t0_data_in_shm_area+0xb8
	.word	0x1705ffdc	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x4eb86000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x76dbbf33          ! %f0
	.word	0x6c6be260          ! %f1
	.word	0xc1afc996          ! %f2
	.word	0xf312e9e9          ! %f3
	.word	0xfc6bc9ca          ! %f4
	.word	0x3784fb72          ! %f5
	.word	0xd8c21e39          ! %f6
	.word	0x93ea362d          ! %f7
	.word	0xddbdd6fb          ! %f8
	.word	0xa96db99b          ! %f9
	.word	0xdcff3d10          ! %f10
	.word	0x033671ed          ! %f11
	.word	0x74435a62          ! %f12
	.word	0xd26a9d15          ! %f13
	.word	0x9b972b35          ! %f14
	.word	0x112ffa6a          ! %f15
	.word	0x0170e8aa          ! %f16
	.word	0x4f57ed17          ! %f17
	.word	0x49051582          ! %f18
	.word	0x8a6db9ab          ! %f19
	.word	0xdd93f143          ! %f20
	.word	0x8971817d          ! %f21
	.word	0x43798368          ! %f22
	.word	0x1c3742c8          ! %f23
	.word	0x7adddf51          ! %f24
	.word	0xfa9b02a8          ! %f25
	.word	0xad3462ff          ! %f26
	.word	0x6e25ee64          ! %f27
	.word	0xd04bd5e7          ! %f28
	.word	0x7d11c3a2          ! %f29
	.word	0x766b425f          ! %f30
	.word	0xe21cbb7a          ! %f31
	.word	0xf6d17b74          ! %f32
	.word	0xd05f9a86          ! %f33
	.word	0x5b494a2d          ! %f34
	.word	0x0dd6f85d          ! %f35
	.word	0x5ea0887d          ! %f36
	.word	0x38f85b1e          ! %f37
	.word	0x9d5bcd78          ! %f38
	.word	0xa6c9f7f9          ! %f39
	.word	0x19ce0d8c          ! %f40
	.word	0xda61d7cd          ! %f41
	.word	0xe19782c5          ! %f42
	.word	0xb216575e          ! %f43
	.word	0x9831a468          ! %f44
	.word	0xaf608caf          ! %f45
	.word	0xfa4fba68          ! %f46
	.word	0x8b09977f          ! %f47
	.word	0x956a0085          ! %f48
	.word	0xbea158fe          ! %f49
	.word	0x703a2615          ! %f50
	.word	0xf3790f36          ! %f51
	.word	0x58b592bd          ! %f52
	.word	0xeefaeab7          ! %f53
	.word	0x1c2f05b6          ! %f54
	.word	0x5e4b798a          ! %f55
	.word	0x26053440          ! %f56
	.word	0x22e7c07d          ! %f57
	.word	0xedfecd7e          ! %f58
	.word	0xfe16a434          ! %f59
	.word	0x7b9a0cc9          ! %f60
	.word	0xa183e5bc          ! %f61
	.word	0x40b3993d          ! %f62
	.word	0x9c0b025f          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x8c4       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x028b11ab          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x21d7f544          ! %o0
	.word	0x41f70266          ! %o1
	.word	0x0952f586          ! %o2
	.word	0xd7365480          ! %o3
	.word	0x5dcdd931          ! %o4
	.word	0xef331e89          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x7edf2812          ! %l0
	.word	0x4a67cd10          ! %l1
	.word	0x9b2600f5          ! %l2
	.word	0x9ebf27b0          ! %l3
	.word	0x91426e8a          ! %l4
	.word	0x436bece8          ! %l5
	.word	0x0a3222ae          ! %l6
	.word	0x01096f85          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000006          ! %i2 (byte offset)
	.word	0x0000001e          ! %i3 (halfword offset)
	.word	0x00000010          ! %i4 (word offset)
	.word	0x00000008          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x2c373a0b          ! %y
	.word	0x00000006          ! %icc (nzvc)
	.word	0x80000e7b          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x67b38000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xb8ac1d40
	.word	0x3d64e19b
	.word	0x9bd0c3b5
	.word	0x870ad787
	.word	0xd7e3f0d7
	.word	0x5b8f24a9
	.word	0x7e3dbd18
	.word	0xf3e15ed7
	.word	0xdab76742
	.word	0xfc254e19
	.word	0xf599b9ca
	.word	0x8e3ebfee
	.word	0x25e60d3a
	.word	0x9a07e71b
	.word	0xebcc36e6
	.word	0xf958b9ab
	.word	0x8aa8b887
	.word	0xed147b07
	.word	0x3b4e2c75
	.word	0x08d8564e
	.word	0x87690392
	.word	0x95bc2d5c
	.word	0xccbf8524
	.word	0x14f99b17
	.word	0xb43c6e37
	.word	0x085f2c04
	.word	0x442fdd37
	.word	0xbf040e2d
	.word	0xd8b037e0
	.word	0x5d7681dc
	.word	0xbfbfbcbe
	.word	0xb62b36c1
	.word	0xcbb046cf
	.word	0x342a0d74
	.word	0x81dec105
	.word	0xdc347b73
	.word	0xd024b0ba
	.word	0xea88a012
	.word	0x5cbe6950
	.word	0xf73202f4
	.word	0x7686b89c
	.word	0x5d7488fd
	.word	0x49d87ac7
	.word	0xb0787aec
	.word	0x0e6755c9
	.word	0xfab710f7
	.word	0xf2e32faf
	.word	0xe2efe91d
	.word	0x9fee9843
	.word	0xc5d1aa0a
	.word	0xb07ca5da
	.word	0x7a3deac7
	.word	0x0dfc7e4c
	.word	0x9c4bd787
	.word	0xf97a4060
	.word	0x534a064e
	.word	0x0b090f3c
	.word	0x64a9124b
	.word	0xb35ff08f
	.word	0x8382f31a
	.word	0xae6acf94
	.word	0x44222d44
	.word	0xc44e9a1f
	.word	0x2155fbbe
	.word	0xc287e252
	.word	0x9ef1fe33
	.word	0x9ff806aa
	.word	0x7bb7de5b
	.word	0xf7e76b86
	.word	0xadbd4eb3
	.word	0xef1a1c5a
	.word	0xa2b0cf46
	.word	0x7a5e0825
	.word	0x449a5979
	.word	0x7aea4be3
	.word	0x1dd381e8
	.word	0x7de96f1c
	.word	0xf5bc57dc
	.word	0xfef569b4
	.word	0xb9a15be5
	.word	0x157c8fa8
	.word	0xb70be397
	.word	0xab876668
	.word	0xe05c3680
	.word	0x783ec0e4
	.word	0x573d30ce
	.word	0xebf19a82
	.word	0x0fe8523e
	.word	0x06d5d6a3
	.word	0x5881644e
	.word	0x563d995a
	.word	0xa36760c8
	.word	0x437c2f7f
	.word	0xb5008a19
	.word	0xa045bf51
	.word	0x6e5fc915
	.word	0x32211031
	.word	0xe81df020
	.word	0xa00bef4b
	.word	0x0ed189c8
	.word	0x7ae2e023
	.word	0x9f60e952
	.word	0xfdba335e
	.word	0x85cc5dd6
	.word	0x46181b43
	.word	0x3af83cd5
	.word	0x8c4034c6
	.word	0x9931076b
	.word	0x47150d1a
	.word	0xd86ec592
	.word	0xa53bbf1c
	.word	0xe781e50e
	.word	0x4729a91c
	.word	0xd68c05f7
	.word	0x4509c2c7
	.word	0xfe453502
	.word	0xce341441
	.word	0x6fc3b3f7
	.word	0x8fc08ab2
	.word	0x5ebdaaef
	.word	0x26d9b3d4
	.word	0x4d438155
	.word	0x66ab193f
	.word	0x41e43bc2
	.word	0xeb41d58a
	.word	0x6fdea422
	.word	0x82e8e07a
	.word	0x55d843d1
	.word	0xd14a44d5
	.word	0xe20ae384
	.word	0x54544992
	.word	0x3aa96b41
	.word	0x73df617a
	.word	0xbf1b2cb8
	.word	0x8f05bf84
	.word	0x74b0ecab
	.word	0x0fa68b61
	.word	0xe41ff459
	.word	0xb4f03118
	.word	0x05e621fd
	.word	0x5cc2f7ab
	.word	0x4695e7e1
	.word	0x0f6f3e11
	.word	0x2ff47b9e
	.word	0xfb6a4309
	.word	0x688fb370
	.word	0xf56e839f
	.word	0xb49745d5
	.word	0xfe7f554b
	.word	0xa98fdfcc
	.word	0x1954bc18
	.word	0x9321e06b
	.word	0x83bf6a37
	.word	0x83140ca9
	.word	0x1554a5e7
	.word	0xf7614c8e
	.word	0x9576539c
	.word	0xd8230b29
	.word	0xe070e5c4
	.word	0x296e34f7
	.word	0xb36c48a6
	.word	0xe4439ca5
	.word	0x119f5825
	.word	0x8dd4d44f
	.word	0xd910d672
	.word	0x9059d9ad
	.word	0x5c4b85f3
	.word	0x8bea5dce
t0_data_exp_sp:
	.word	0xfb0bc5e4
	.word	0xcf45854d
	.word	0xf93f3081
	.word	0xc37dcc25
	.word	0x2f960ab8
	.word	0x70fbd092
	.word	0x63f328b9
	.word	0xc58c3a9e
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffffe
	.word	0x00000018
	.word	0xfffffff8
	.word	0xffffffe8
	.word	t0_data_exp_fp
	.word	0x99a13714
	.word	0x89588ddb
	.word	0x6ffd66b7
	.word	0xda1f9135
	.word	0x22d2ed90
	.word	0x99ba68fa
	.word	0xa1bd3fb4
	.word	0xc64b4f9d
	.word	0xf3dfd2f5
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
	.word   	0x38b5eb55	! [%fp - 0xc]
	.word   	0x26518992	! [%fp - 0x8]
	.word   	0x6844380a	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x69b2a3cd
	.word	0xf699d1ac
	.word	0x56d87a79
	.word	0x9d70b9f3
	.word	0x29a2b4f9
	.word	0x03abffd5
	.word	0xad063747
	.word	0xb7550c36
	.word	0xe9b138f9
	.word	0x512b16a8
	.word	0x127ae46c
	.word	0xe0953628
	.word	0xfcff156b
	.word	0x8afef53d
	.word	0xf8ee6115
	.word	0x6ee615ec
	.word	0x708c0cd1
	.word	0x8d539959
	.word	0x15ba108c
	.word	0xe7d7f808
	.word	0x2e184097
	.word	0x2d1d1324
	.word	0x10eb55de
	.word	0x59fa9435
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x48be8000)
.seg "data"
t0_data_exp_area0_start:
.skip 4288
t0_data_exp_area0_begin:
	.word	0x310d4f53	! t0_data_exp_area0-0x20
	.word	0x0f3a8020	! t0_data_exp_area0-0x1c
	.word	0x7d8fa5bd	! t0_data_exp_area0-0x18
	.word	0xa3838376	! t0_data_exp_area0-0x14
	.word	0x5be4934e	! t0_data_exp_area0-0x10
	.word	0x7ad94156	! t0_data_exp_area0-0xc
	.word	0xa09552a8	! t0_data_exp_area0-0x8
	.word	0x809d836b	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xafd44542	! t0_data_exp_area0+0x0
	.word	0xa018e0d1	! t0_data_exp_area0+0x4
	.word	0xe3aa7748	! t0_data_exp_area0+0x8
	.word	0x87181ae6	! t0_data_exp_area0+0xc
	.word	0x54e58765	! t0_data_exp_area0+0x10
	.word	0x77035a50	! t0_data_exp_area0+0x14
	.word	0xf435a31d	! t0_data_exp_area0+0x18
	.word	0x209473be	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 3840
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x7ba76000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x12319ca6	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xdbf4bb36	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x021a2d59	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xc8c57de3	! t0_data_exp_shm_area+0xc (t0)
	.word	0x1d24d035	! t0_data_exp_shm_area+0x10 (t0)
	.word	0xd0c84dc5	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x00b4520b	! t0_data_exp_shm_area+0x18 (t0)
	.word	0x5026afb2	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xd789d149	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x2cd0c38b	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x44977d80	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x35edf78b	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x8708871d	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x9c04131b	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x0c5b69e6	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xbb32b29f	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xe1efa13a	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x9f1afd00	! t0_data_exp_shm_area+0x44
	.word	0x086af331	! t0_data_exp_shm_area+0x48
	.word	0x968cbd0e	! t0_data_exp_shm_area+0x4c
	.word	0x9cd067fc	! t0_data_exp_shm_area+0x50
	.word	0x85ef6bee	! t0_data_exp_shm_area+0x54
	.word	0x8791c541	! t0_data_exp_shm_area+0x58
	.word	0xf80bef30	! t0_data_exp_shm_area+0x5c
	.word	0xd6e8914e	! t0_data_exp_shm_area+0x60
	.word	0xca64243b	! t0_data_exp_shm_area+0x64
	.word	0xaa344844	! t0_data_exp_shm_area+0x68
	.word	0x3a999c32	! t0_data_exp_shm_area+0x6c
	.word	0x40ce1db7	! t0_data_exp_shm_area+0x70
	.word	0x27d3768d	! t0_data_exp_shm_area+0x74
	.word	0xa6ef6f59	! t0_data_exp_shm_area+0x78
	.word	0x66dae5e5	! t0_data_exp_shm_area+0x7c
	.word	0x4d8d819a	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xa0a9e9d3	! t0_data_exp_shm_area+0x84
	.word	0x67144d75	! t0_data_exp_shm_area+0x88
	.word	0xd5c3f9d2	! t0_data_exp_shm_area+0x8c
	.word	0x5aaa9eb9	! t0_data_exp_shm_area+0x90
	.word	0xe4ad1078	! t0_data_exp_shm_area+0x94
	.word	0x5a4d948a	! t0_data_exp_shm_area+0x98
	.word	0x6b798b91	! t0_data_exp_shm_area+0x9c
	.word	0xf37951fa	! t0_data_exp_shm_area+0xa0
	.word	0x35bdfcd6	! t0_data_exp_shm_area+0xa4
	.word	0x84fb62e5	! t0_data_exp_shm_area+0xa8
	.word	0x3f1f205a	! t0_data_exp_shm_area+0xac
	.word	0xa04a996e	! t0_data_exp_shm_area+0xb0
	.word	0xb1ea08e8	! t0_data_exp_shm_area+0xb4
	.word	0x4eb402d7	! t0_data_exp_shm_area+0xb8
	.word	0x1705ffdc	! t0_data_exp_shm_area+0xbc
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



