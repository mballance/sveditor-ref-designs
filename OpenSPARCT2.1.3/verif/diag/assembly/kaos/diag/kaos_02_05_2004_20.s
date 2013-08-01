/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_02_05_2004_20.s
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
#define T0_KAOS_SEED          d29f30763371
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    2944
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x2df28000
#define T0_KAOS_BOOT_PA                  0x000000000140a000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x57cfa000
#define T0_KAOS_STARTUP_PA               0x0000000003de4000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x7905e000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004a42000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x1fe10000
#define T0_KAOS_DONE_PA                  0x0000000006596000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x281c0000
#define T0_KAOS_KTBL_PA                  0x0000000009dbc000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x287d4000
#define T0_KAOS_SUBR0_PA                 0x000000000aede000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x01698000
#define T0_KAOS_SUBR1_PA                 0x000000000ce62000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x280d0000
#define T0_KAOS_SUBR2_PA                 0x000000000f6d0000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x2810a000
#define T0_KAOS_SUBR3_PA                 0x0000000010bac000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x1a698000
#define T0_KAOS_EXP_REGS_PA              0x0000000012c2e000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x3c04e000
#define T0_KAOS_RUN_REGS_PA              0x0000000014b0e000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x570ee000
#define T0_KAOS_EXP_STACK_PA             0x0000000017ce6000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x5575c000
#define T0_KAOS_RUN_STACK_PA             0x00000000181d4000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x48f56000
#define T0_KAOS_EXP_AREA0_PA             0x000000001bdc8000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x26630000
#define T0_KAOS_RUN_AREA0_PA             0x000000001ce0c000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x166ec000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000001340000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x45612000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000014c4000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x8c1bb74e
#define T0_KAOS_RANVAL_01     0x44ba1e3d
#define T0_KAOS_RANVAL_02     0x0ff4cc11
#define T0_KAOS_RANVAL_03     0xcfec3c3a
#define T0_KAOS_RANVAL_04     0x2b4907ef
#define T0_KAOS_RANVAL_05     0xfd7fd704
#define T0_KAOS_RANVAL_06     0x60f43490
#define T0_KAOS_RANVAL_07     0x12b761f6
#define T0_KAOS_RANVAL_08     0xfa3c3c55
#define T0_KAOS_RANVAL_09     0x9e93a402
#define T0_KAOS_RANVAL_0a     0x35f5381f
#define T0_KAOS_RANVAL_0b     0x12f315cc
#define T0_KAOS_RANVAL_0c     0x7fa0d2d0
#define T0_KAOS_RANVAL_0d     0x82f88f40
#define T0_KAOS_RANVAL_0e     0xc8dd3958
#define T0_KAOS_RANVAL_0f     0x562c47c7
#define T0_KAOS_RANVAL_10     0x46d1df47
#define T0_KAOS_RANVAL_11     0xd3a30487
#define T0_KAOS_RANVAL_12     0xf5e5f335
#define T0_KAOS_RANVAL_13     0x1cda824e
#define T0_KAOS_RANVAL_14     0x066e438f
#define T0_KAOS_RANVAL_15     0xe4a04522
#define T0_KAOS_RANVAL_16     0x081bdb7e
#define T0_KAOS_RANVAL_17     0x5b940d84
#define T0_KAOS_RANVAL_18     0xeb879901
#define T0_KAOS_RANVAL_19     0x0a5ad3e7
#define T0_KAOS_RANVAL_1a     0x0c3bb87c
#define T0_KAOS_RANVAL_1b     0x31d664f1
#define T0_KAOS_RANVAL_1c     0xf1dd9f46
#define T0_KAOS_RANVAL_1d     0x93eb1d78
#define T0_KAOS_RANVAL_1e     0xf2e75df2
#define T0_KAOS_RANVAL_1f     0xa52de361
#define T0_KAOS_RANVAL_20     0x66614474
#define T0_KAOS_RANVAL_21     0xe093e0c6
#define T0_KAOS_RANVAL_22     0x4e34c54d
#define T0_KAOS_RANVAL_23     0x4ed1c90c
#define T0_KAOS_RANVAL_24     0xe1579a5e
#define T0_KAOS_RANVAL_25     0x4a7e1bd6
#define T0_KAOS_RANVAL_26     0x5719f51a
#define T0_KAOS_RANVAL_27     0x9377fff7
#define T0_KAOS_RANVAL_28     0x12264d27
#define T0_KAOS_RANVAL_29     0x47c080c7
#define T0_KAOS_RANVAL_2a     0x086b6bb7
#define T0_KAOS_RANVAL_2b     0x2b764299
#define T0_KAOS_RANVAL_2c     0x55586f18
#define T0_KAOS_RANVAL_2d     0x58fab713
#define T0_KAOS_RANVAL_2e     0x564a014d
#define T0_KAOS_RANVAL_2f     0x5a7c88c0
#define T0_KAOS_RANVAL_30     0x0703adb3
#define T0_KAOS_RANVAL_31     0x528ced15
#define T0_KAOS_RANVAL_32     0xe53874fd
#define T0_KAOS_RANVAL_33     0x848edeb5
#define T0_KAOS_RANVAL_34     0xf5a34408
#define T0_KAOS_RANVAL_35     0x36f87dca
#define T0_KAOS_RANVAL_36     0xa2e01959
#define T0_KAOS_RANVAL_37     0x7fa30a9e
#define T0_KAOS_RANVAL_38     0xf4ff3e46
#define T0_KAOS_RANVAL_39     0x2e7eaedb
#define T0_KAOS_RANVAL_3a     0x770f5415
#define T0_KAOS_RANVAL_3b     0x68a8a423
#define T0_KAOS_RANVAL_3c     0xdb0be294
#define T0_KAOS_RANVAL_3d     0x65decada
#define T0_KAOS_RANVAL_3e     0x14f3e4fd
#define T0_KAOS_RANVAL_3f     0x16088254
#define T0_KAOS_RANVAL_40     0xc3165321
#define T0_KAOS_RANVAL_41     0x84651bcc
#define T0_KAOS_RANVAL_42     0x1e3e2829
#define T0_KAOS_RANVAL_43     0xdb12a3ca
#define T0_KAOS_RANVAL_44     0x3b50bd79
#define T0_KAOS_RANVAL_45     0x7c9089e7
#define T0_KAOS_RANVAL_46     0x1af9c770
#define T0_KAOS_RANVAL_47     0xed9ff50b
#define T0_KAOS_RANVAL_48     0x7f21ab1a
#define T0_KAOS_RANVAL_49     0x42ace29c
#define T0_KAOS_RANVAL_4a     0xc4bb8f1a
#define T0_KAOS_RANVAL_4b     0xc39f9933
#define T0_KAOS_RANVAL_4c     0x6abf4747
#define T0_KAOS_RANVAL_4d     0x3e1c0bd7
#define T0_KAOS_RANVAL_4e     0x418b59d8
#define T0_KAOS_RANVAL_4f     0x6f9d98cf
#define T0_KAOS_RANVAL_50     0xd3d8ae1b
#define T0_KAOS_RANVAL_51     0x64e8a784
#define T0_KAOS_RANVAL_52     0xd5ec47f8
#define T0_KAOS_RANVAL_53     0xcbcb1b0c
#define T0_KAOS_RANVAL_54     0x249c98e0
#define T0_KAOS_RANVAL_55     0xf1e0eb55
#define T0_KAOS_RANVAL_56     0x6cd4b5d4
#define T0_KAOS_RANVAL_57     0xf0ee8d10
#define T0_KAOS_RANVAL_58     0xcb8dfba1
#define T0_KAOS_RANVAL_59     0xa420b0c2
#define T0_KAOS_RANVAL_5a     0xeb8aa58b
#define T0_KAOS_RANVAL_5b     0x7c245ba7
#define T0_KAOS_RANVAL_5c     0x708c67fd
#define T0_KAOS_RANVAL_5d     0xcfde0151
#define T0_KAOS_RANVAL_5e     0x65708ff3
#define T0_KAOS_RANVAL_5f     0xd9bf2322
#define T0_KAOS_RANVAL_60     0x1f7f493d
#define T0_KAOS_RANVAL_61     0x1bbba317
#define T0_KAOS_RANVAL_62     0xe419d0ce
#define T0_KAOS_RANVAL_63     0xa720797b
#define T0_KAOS_RANVAL_64     0x48704da9
#define T0_KAOS_RANVAL_65     0x3819697d
#define T0_KAOS_RANVAL_66     0x09bd223b
#define T0_KAOS_RANVAL_67     0x1f51b6bd
#define T0_KAOS_RANVAL_68     0xb4d29116
#define T0_KAOS_RANVAL_69     0xd7124e47
#define T0_KAOS_RANVAL_6a     0x7a8edb6e
#define T0_KAOS_RANVAL_6b     0xf0b65fa2
#define T0_KAOS_RANVAL_6c     0x57795cc3
#define T0_KAOS_RANVAL_6d     0x985496d2
#define T0_KAOS_RANVAL_6e     0xcbf3e6a3
#define T0_KAOS_RANVAL_6f     0x33a8167d
#define T0_KAOS_RANVAL_70     0x319a9066
#define T0_KAOS_RANVAL_71     0xec00899c
#define T0_KAOS_RANVAL_72     0x0219a24f
#define T0_KAOS_RANVAL_73     0x0c66365a
#define T0_KAOS_RANVAL_74     0xc8660881
#define T0_KAOS_RANVAL_75     0x577e7809
#define T0_KAOS_RANVAL_76     0x248e2198
#define T0_KAOS_RANVAL_77     0xbcc17c63
#define T0_KAOS_RANVAL_78     0xc57c95f9
#define T0_KAOS_RANVAL_79     0x3f052064
#define T0_KAOS_RANVAL_7a     0x9c378007
#define T0_KAOS_RANVAL_7b     0x1d8e6384
#define T0_KAOS_RANVAL_7c     0x1e265ae8
#define T0_KAOS_RANVAL_7d     0xda95ac23
#define T0_KAOS_RANVAL_7e     0x47c03c7c
#define T0_KAOS_RANVAL_7f     0x1b6f1652
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
/*#include "red_trap_table.s"*/

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
!    areaoffset     2944
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           281c0000
!    entry          281c0000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d29f30763371
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9.w
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

KTEXT_MODULE(t0_module_ktbl, 0x281c0000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xd816200a	! t0_kref+0x0:   	lduh	[%i0 + 0xa], %o4
	.word	0xaf418000	! t0_kref+0x4:   	mov	%fprs, %l7
	.word	0xa6068000	! t0_kref+0x8:   	add	%i2, %g0, %l3
	.word	0xd848a039	! t0_kref+0xc:   	ldsb	[%g2 + 0x39], %o4
	.word	0x9aa2756c	! t0_kref+0x10:   	subcc	%o1, -0xa94, %o5
	.word	0xe41e4000	! t0_kref+0x14:   	ldd	[%i1], %l2
	.word	0xd04e4000	! t0_kref+0x18:   	ldsb	[%i1], %o0
	.word	0x97368009	! t0_kref+0x1c:   	srl	%i2, %o1, %o3
	.word	0xaa42b4ab	! t0_kref+0x20:   	addc	%o2, -0xb55, %l5
	.word	0xebee101b	! t0_kref+0x24:   	prefetcha	%i0 + %i3, 21
	.word	0x989f2397	! t0_kref+0x28:   	xorcc	%i4, 0x397, %o4
	.word	0xb1a00527	! t0_kref+0x2c:   	fsqrts	%f7, %f24
	.word	0xaa230009	! t0_kref+0x30:   	sub	%o4, %o1, %l5
	.word	0x90034017	! t0_kref+0x34:   	add	%o5, %l7, %o0
	.word	0xae030017	! t0_kref+0x38:   	add	%o4, %l7, %l7
	.word	0x81dec00d	! t0_kref+0x3c:   	flush	%i3 + %o5
	.word	0x23800008	! t0_kref+0x40:   	fbne,a	_kref+0x60
	.word	0x9f400000	! t0_kref+0x44:   	mov	%y, %o7
	.word	0xe96e2010	! t0_kref+0x48:   	prefetch	%i0 + 0x10, 20
	.word	0x9ae26a3c	! t0_kref+0x4c:   	subccc	%o1, 0xa3c, %o5
	.word	0x81a448b2	! t0_kref+0x50:   	fsubs	%f17, %f18, %f0
	.word	0xc986101c	! t0_kref+0x54:   	lda	[%i0 + %i4]0x80, %f4
	.word	0x965ec000	! t0_kref+0x58:   	smul	%i3, %g0, %o3
	.word	0x8da01a5a	! t0_kref+0x5c:   	fdtoi	%f26, %f6
	.word	0x3e480004	! t0_kref+0x60:   	bvc,a,pt	%icc, _kref+0x70
	.word	0x9a12400b	! t0_kref+0x64:   	or	%o1, %o3, %o5
	.word	0x81daf56f	! t0_kref+0x68:   	flush	%o3 - 0xa91
	.word	0x99a000a5	! t0_kref+0x6c:   	fnegs	%f5, %f12
	.word	0x970a801c	! t0_kref+0x70:   	tsubcc	%o2, %i4, %o3
	.word	0x988b401c	! t0_kref+0x74:   	andcc	%o5, %i4, %o4
	.word	0x953ac00c	! t0_kref+0x78:   	sra	%o3, %o4, %o2
	.word	0xe56e6008	! t0_kref+0x7c:   	prefetch	%i1 + 8, 18
	.word	0xef00a02c	! t0_kref+0x80:   	ld	[%g2 + 0x2c], %f23
	.word	0x971f0009	! t0_kref+0x84:   	tsubcctv	%i4, %o1, %o3
	.word	0x22480004	! t0_kref+0x88:   	be,a,pt	%icc, _kref+0x98
	.word	0x9e66afe7	! t0_kref+0x8c:   	subc	%i2, 0xfe7, %o7
	.word	0x30800006	! t0_kref+0x90:   	ba,a	_kref+0xa8
	.word	0xad372019	! t0_kref+0x94:   	srl	%i4, 0x19, %l6
	.word	0x2b0f9647	! t0_kref+0x98:   	sethi	%hi(0x3e591c00), %l5
	.word	0xa8b3400b	! t0_kref+0x9c:   	orncc	%o5, %o3, %l4
	.word	0x9fc00004	! t0_kref+0xa0:   	call	%g0 + %g4
	.word	0x9ba01a2c	! t0_kref+0xa4:   	fstoi	%f12, %f13
	.word	0x9ba489b1	! t0_kref+0xa8:   	fdivs	%f18, %f17, %f13
	.word	0xad280008	! t0_kref+0xac:   	sll	%g0, %o0, %l6
	.word	0x94468017	! t0_kref+0xb0:   	addc	%i2, %l7, %o2
	.word	0xd840a014	! t0_kref+0xb4:   	ldsw	[%g2 + 0x14], %o4
	.word	0x39480008	! t0_kref+0xb8:   	fbuge,a,pt	%fcc0, _kref+0xd8
	.word	0xac8ec01b	! t0_kref+0xbc:   	andcc	%i3, %i3, %l6
	.word	0x965debde	! t0_kref+0xc0:   	smul	%l7, 0xbde, %o3
	.word	0x3f480007	! t0_kref+0xc4:   	fbo,a,pt	%fcc0, _kref+0xe0
	.word	0x9ec323c0	! t0_kref+0xc8:   	addccc	%o4, 0x3c0, %o7
	.word	0xb1a6082a	! t0_kref+0xcc:   	fadds	%f24, %f10, %f24
	.word	0xaa224009	! t0_kref+0xd0:   	sub	%o1, %o1, %l5
	.word	0xafa0188f	! t0_kref+0xd4:   	fitos	%f15, %f23
	.word	0xe498105d	! t0_kref+0xd8:   	ldda	[%g0 + %i5]0x82, %l2
	.word	0x81a88a40	! t0_kref+0xdc:   	fcmpd	%fcc0, %f2, %f0
	.word	0x9e0a62f8	! t0_kref+0xe0:   	and	%o1, 0x2f8, %o7
	.word	0x81ab4ab0	! t0_kref+0xe4:   	fcmpes	%fcc0, %f13, %f16
	.word	0x3c480003	! t0_kref+0xe8:   	bpos,a,pt	%icc, _kref+0xf4
	.word	0xe3270005	! t0_kref+0xec:   	st	%f17, [%i4 + %g5]
	.word	0xd600a024	! t0_kref+0xf0:   	ld	[%g2 + 0x24], %o3
	.word	0xee48a026	! t0_kref+0xf4:   	ldsb	[%g2 + 0x26], %l7
	.word	0x38480004	! t0_kref+0xf8:   	bgu,a,pt	%icc, _kref+0x108
	.word	0xda08a035	! t0_kref+0xfc:   	ldub	[%g2 + 0x35], %o5
	.word	0xc9ee501c	! t0_kref+0x100:   	prefetcha	%i1 + %i4, 4
	.word	0xac06fc64	! t0_kref+0x104:   	add	%i3, -0x39c, %l6
	.word	0xda00a000	! t0_kref+0x108:   	ld	[%g2], %o5
	.word	0xae1a7e12	! t0_kref+0x10c:   	xor	%o1, -0x1ee, %l7
	sethi	%hi(2f), %o7
	.word	0xe40be144	! t0_kref+0x114:   	ldub	[%o7 + 0x144], %l2
	.word	0xa41ca00c	! t0_kref+0x118:   	xor	%l2, 0xc, %l2
	.word	0xe42be144	! t0_kref+0x11c:   	stb	%l2, [%o7 + 0x144]
	.word	0x81dbe144	! t0_kref+0x120:   	flush	%o7 + 0x144
	.word	0x9da00529	! t0_kref+0x124:   	fsqrts	%f9, %f14
	.word	0x81ae8ab7	! t0_kref+0x128:   	fcmpes	%fcc0, %f26, %f23
	.word	0xea40a008	! t0_kref+0x12c:   	ldsw	[%g2 + 8], %l5
	.word	0x29480007	! t0_kref+0x130:   	fbl,a,pt	%fcc0, _kref+0x14c
	.word	0xd4ff1019	! t0_kref+0x134:   	swapa	[%i4 + %i1]0x80, %o2
	.word	0xd02e6004	! t0_kref+0x138:   	stb	%o0, [%i1 + 4]
	.word	0x9066e80a	! t0_kref+0x13c:   	subc	%i3, 0x80a, %o0
	.word	0xacf339a8	! t0_kref+0x140:   	udivcc	%o4, -0x658, %l6
2:	.word	0xda48a03f	! t0_kref+0x144:   	ldsb	[%g2 + 0x3f], %o5
	.word	0x9ec2b518	! t0_kref+0x148:   	addccc	%o2, -0xae8, %o7
	.word	0x98234008	! t0_kref+0x14c:   	sub	%o5, %o0, %o4
	.word	0x27480006	! t0_kref+0x150:   	fbul,a,pt	%fcc0, _kref+0x168
	.word	0xd0ce1000	! t0_kref+0x154:   	ldsba	[%i0]0x80, %o0
	.word	0xaf400000	! t0_kref+0x158:   	mov	%y, %l7
	.word	0x89a0002d	! t0_kref+0x15c:   	fmovs	%f13, %f4
	.word	0x9f3ae01f	! t0_kref+0x160:   	sra	%o3, 0x1f, %o7
	.word	0xe64e7ff3	! t0_kref+0x164:   	ldsb	[%i1 - 0xd], %l3
	.word	0x81dc6310	! t0_kref+0x168:   	flush	%l1 + 0x310
	.word	0x81db8000	! t0_kref+0x16c:   	flush	%sp
	.word	0xc398a040	! t0_kref+0x170:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xb1a9405a	! t0_kref+0x174:   	fmovdug	%fcc0, %f26, %f24
	.word	0xc16e3fe0	! t0_kref+0x178:   	prefetch	%i0 - 0x20, 0
	.word	0x8fa01893	! t0_kref+0x17c:   	fitos	%f19, %f7
	.word	0xe9270019	! t0_kref+0x180:   	st	%f20, [%i4 + %i1]
	.word	0x98568017	! t0_kref+0x184:   	umul	%i2, %l7, %o4
	.word	0xa7a40931	! t0_kref+0x188:   	fmuls	%f16, %f17, %f19
	.word	0x925ef982	! t0_kref+0x18c:   	smul	%i3, -0x67e, %o1
	.word	0xf6b6d018	! t0_kref+0x190:   	stha	%i3, [%i3 + %i0]0x80
	.word	0x38480006	! t0_kref+0x194:   	bgu,a,pt	%icc, _kref+0x1ac
	.word	0x9da04826	! t0_kref+0x198:   	fadds	%f1, %f6, %f14
	.word	0xacaa4017	! t0_kref+0x19c:   	andncc	%o1, %l7, %l6
	.word	0xd628a005	! t0_kref+0x1a0:   	stb	%o3, [%g2 + 5]
	.word	0x913b0008	! t0_kref+0x1a4:   	sra	%o4, %o0, %o0
	.word	0xedee501b	! t0_kref+0x1a8:   	prefetcha	%i1 + %i3, 22
	.word	0x99a288b1	! t0_kref+0x1ac:   	fsubs	%f10, %f17, %f12
	.word	0x908a0000	! t0_kref+0x1b0:   	andcc	%o0, %g0, %o0
	.word	0x81ac0aab	! t0_kref+0x1b4:   	fcmpes	%fcc0, %f16, %f11
	.word	0xf007bfe0	! t0_kref+0x1b8:   	ld	[%fp - 0x20], %i0
	.word	0x9fc10000	! t0_kref+0x1bc:   	call	%g4
	.word	0xd216c019	! t0_kref+0x1c0:   	lduh	[%i3 + %i1], %o1
	.word	0xac3ef2a4	! t0_kref+0x1c4:   	xnor	%i3, -0xd5c, %l6
	.word	0xf700a038	! t0_kref+0x1c8:   	ld	[%g2 + 0x38], %f27
	.word	0xa645c00c	! t0_kref+0x1cc:   	addc	%l7, %o4, %l3
	.word	0xaba00534	! t0_kref+0x1d0:   	fsqrts	%f20, %f21
	.word	0xaba000a6	! t0_kref+0x1d4:   	fnegs	%f6, %f21
	.word	0x86102018	! t0_kref+0x1d8:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0x1dc:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x1e0:   	be,a	_kref+0x1e4
	.word	0xc0680019	! t0_kref+0x1e4:   	ldstub	[%g0 + %i1], %g0
	.word	0xd04e001a	! t0_kref+0x1e8:   	ldsb	[%i0 + %i2], %o0
	.word	0xc51fbeb0	! t0_kref+0x1ec:   	ldd	[%fp - 0x150], %f2
	.word	0x99326013	! t0_kref+0x1f0:   	srl	%o1, 0x13, %o4
	.word	0xe408763c	! t0_kref+0x1f4:   	ldub	[%g1 - 0x9c4], %l2
	.word	0xa41ca00c	! t0_kref+0x1f8:   	xor	%l2, 0xc, %l2
	.word	0xe428763c	! t0_kref+0x1fc:   	stb	%l2, [%g1 - 0x9c4]
	.word	0x81d8763c	! t0_kref+0x200:   	flush	%g1 - 0x9c4
	.word	0xef6e401a	! t0_kref+0x204:   	prefetch	%i1 + %i2, 23
	.word	0xd0861000	! t0_kref+0x208:   	lda	[%i0]0x80, %o0
	.word	0xf7871058	! t0_kref+0x20c:   	lda	[%i4 + %i0]0x82, %f27
	.word	0xd420a000	! t0_kref+0x210:   	st	%o2, [%g2]
	.word	0x2e800006	! t0_kref+0x214:   	bvs,a	_kref+0x22c
	.word	0xd286501c	! t0_kref+0x218:   	lda	[%i1 + %i4]0x80, %o1
	.word	0xda40a020	! t0_kref+0x21c:   	ldsw	[%g2 + 0x20], %o5
2:	.word	0x81a2c836	! t0_kref+0x220:   	fadds	%f11, %f22, %f0
	call	SYM(t0_subr1)
	.word	0xada01883	! t0_kref+0x228:   	fitos	%f3, %f22
	.word	0x81aa4aae	! t0_kref+0x22c:   	fcmpes	%fcc0, %f9, %f14
	.word	0x86102003	! t0_kref+0x230:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x234:   	bne,a	_kref+0x234
	.word	0x86a0e001	! t0_kref+0x238:   	subcc	%g3, 1, %g3
	.word	0x9e7a8000	! t0_kref+0x23c:   	sdiv	%o2, %g0, %o7
	.word	0x20800003	! t0_kref+0x240:   	bn,a	_kref+0x24c
	.word	0x8143c000	! t0_kref+0x244:   	stbar
	call	SYM(t0_subr1)
	.word	0x9840000a	! t0_kref+0x24c:   	addc	%g0, %o2, %o4
	.word	0xada00124	! t0_kref+0x250:   	fabss	%f4, %f22
	.word	0x39480003	! t0_kref+0x254:   	fbuge,a,pt	%fcc0, _kref+0x260
	.word	0x9ba000b4	! t0_kref+0x258:   	fnegs	%f20, %f13
	.word	0x33800005	! t0_kref+0x25c:   	fbe,a	_kref+0x270
	.word	0xd430a000	! t0_kref+0x260:   	sth	%o2, [%g2]
	.word	0xd620a03c	! t0_kref+0x264:   	st	%o3, [%g2 + 0x3c]
	.word	0xdf00a030	! t0_kref+0x268:   	ld	[%g2 + 0x30], %f15
	.word	0x9932e00d	! t0_kref+0x26c:   	srl	%o3, 0xd, %o4
	.word	0x3c480002	! t0_kref+0x270:   	bpos,a,pt	%icc, _kref+0x278
	.word	0x98aea392	! t0_kref+0x274:   	andncc	%i2, 0x392, %o4
	.word	0x9243631c	! t0_kref+0x278:   	addc	%o5, 0x31c, %o1
	.word	0xd03e001d	! t0_kref+0x27c:   	std	%o0, [%i0 + %i5]
	.word	0xec861000	! t0_kref+0x280:   	lda	[%i0]0x80, %l6
	.word	0xd22e7ff7	! t0_kref+0x284:   	stb	%o1, [%i1 - 9]
	.word	0x9855fa87	! t0_kref+0x288:   	umul	%l7, -0x579, %o4
	.word	0xf628a027	! t0_kref+0x28c:   	stb	%i3, [%g2 + 0x27]
	.word	0xefee101a	! t0_kref+0x290:   	prefetcha	%i0 + %i2, 23
	.word	0x2b800003	! t0_kref+0x294:   	fbug,a	_kref+0x2a0
	.word	0xe68e9058	! t0_kref+0x298:   	lduba	[%i2 + %i0]0x82, %l3
	.word	0xa1a00525	! t0_kref+0x29c:   	fsqrts	%f5, %f16
	.word	0xd4be1000	! t0_kref+0x2a0:   	stda	%o2, [%i0]0x80
	.word	0xaba508ad	! t0_kref+0x2a4:   	fsubs	%f20, %f13, %f21
	.word	0x91a01a2f	! t0_kref+0x2a8:   	fstoi	%f15, %f8
	.word	0xe51e3ff0	! t0_kref+0x2ac:   	ldd	[%i0 - 0x10], %f18
	.word	0xe51fbcb8	! t0_kref+0x2b0:   	ldd	[%fp - 0x348], %f18
	.word	0xea00a030	! t0_kref+0x2b4:   	ld	[%g2 + 0x30], %l5
	.word	0xd49e101d	! t0_kref+0x2b8:   	ldda	[%i0 + %i5]0x80, %o2
	.word	0x9812c008	! t0_kref+0x2bc:   	or	%o3, %o0, %o4
	.word	0x31480006	! t0_kref+0x2c0:   	fba,a,pt	%fcc0, _kref+0x2d8
	.word	0x9e12667b	! t0_kref+0x2c4:   	or	%o1, 0x67b, %o7
	.word	0x9a620017	! t0_kref+0x2c8:   	subc	%o0, %l7, %o5
	.word	0xac22001a	! t0_kref+0x2cc:   	sub	%o0, %i2, %l6
	.word	0xf100a01c	! t0_kref+0x2d0:   	ld	[%g2 + 0x1c], %f24
	.word	0xe41e401d	! t0_kref+0x2d4:   	ldd	[%i1 + %i5], %l2
	.word	0xe41e3fe0	! t0_kref+0x2d8:   	ldd	[%i0 - 0x20], %l2
	.word	0xc07f0019	! t0_kref+0x2dc:   	swap	[%i4 + %i1], %g0
	.word	0xa5a018d6	! t0_kref+0x2e0:   	fdtos	%f22, %f18
	.word	0xd1be1849	! t0_kref+0x2e4:   	stda	%f8, [%i0 + %o1]0xc2
	.word	0xe3b8a080	! t0_kref+0x2e8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x965f39ff	! t0_kref+0x2ec:   	smul	%i4, -0x601, %o3
	.word	0xc13e6000	! t0_kref+0x2f0:   	std	%f0, [%i1]
	.word	0xeb20a004	! t0_kref+0x2f4:   	st	%f21, [%g2 + 4]
	.word	0x92c2000c	! t0_kref+0x2f8:   	addccc	%o0, %o4, %o1
	.word	0xed1fbf78	! t0_kref+0x2fc:   	ldd	[%fp - 0x88], %f22
	.word	0x81ad8a42	! t0_kref+0x300:   	fcmpd	%fcc0, %f22, %f2
	.word	0x878020f0	! t0_kref+0x304:   	mov	0xf0, %asi
	.word	0x9da089a3	! t0_kref+0x308:   	fdivs	%f2, %f3, %f14
	.word	0xe1ee101a	! t0_kref+0x30c:   	prefetcha	%i0 + %i2, 16
	.word	0xd030a01e	! t0_kref+0x310:   	sth	%o0, [%g2 + 0x1e]
	.word	0x81a00146	! t0_kref+0x314:   	fabsd	%f6, %f0
	.word	0xda462010	! t0_kref+0x318:   	ldsw	[%i0 + 0x10], %o5
	.word	0xc398a040	! t0_kref+0x31c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa7a289ab	! t0_kref+0x320:   	fdivs	%f10, %f11, %f19
	.word	0xac9724e2	! t0_kref+0x324:   	orcc	%i4, 0x4e2, %l6
	.word	0x81ad8a40	! t0_kref+0x328:   	fcmpd	%fcc0, %f22, %f0
	.word	0x97400000	! t0_kref+0x32c:   	mov	%y, %o3
	.word	0x94c2000a	! t0_kref+0x330:   	addccc	%o0, %o2, %o2
	.word	0xda20a01c	! t0_kref+0x334:   	st	%o5, [%g2 + 0x1c]
	.word	0xa1a00144	! t0_kref+0x338:   	fabsd	%f4, %f16
	.word	0xde40a024	! t0_kref+0x33c:   	ldsw	[%g2 + 0x24], %o7
	.word	0xd230a02c	! t0_kref+0x340:   	sth	%o1, [%g2 + 0x2c]
	.word	0xd6871018	! t0_kref+0x344:   	lda	[%i4 + %i0]0x80, %o3
	.word	0x9646c017	! t0_kref+0x348:   	addc	%i3, %l7, %o3
	.word	0xa8a73e18	! t0_kref+0x34c:   	subcc	%i4, -0x1e8, %l4
	.word	0x87a00135	! t0_kref+0x350:   	fabss	%f21, %f3
	.word	0x3e800003	! t0_kref+0x354:   	bvc,a	_kref+0x360
	.word	0xe848a038	! t0_kref+0x358:   	ldsb	[%g2 + 0x38], %l4
	.word	0xaa02bbb7	! t0_kref+0x35c:   	add	%o2, -0x449, %l5
	.word	0x28800002	! t0_kref+0x360:   	bleu,a	_kref+0x368
	.word	0x95a5894e	! t0_kref+0x364:   	fmuld	%f22, %f14, %f10
	.word	0xe11fbf60	! t0_kref+0x368:   	ldd	[%fp - 0xa0], %f16
	.word	0xd43e2000	! t0_kref+0x36c:   	std	%o2, [%i0]
	.word	0x940238ba	! t0_kref+0x370:   	add	%o0, -0x746, %o2
	.word	0xd100a004	! t0_kref+0x374:   	ld	[%g2 + 4], %f8
	.word	0xf96e7ff8	! t0_kref+0x378:   	prefetch	%i1 - 8, 28
	.word	0x94f5c01a	! t0_kref+0x37c:   	udivcc	%l7, %i2, %o2
	.word	0x81a2cd2e	! t0_kref+0x380:   	fsmuld	%f11, %f14, %f0
	.word	0xb5a34830	! t0_kref+0x384:   	fadds	%f13, %f16, %f26
	.word	0x37800002	! t0_kref+0x388:   	fbge,a	_kref+0x390
	.word	0x92c2b3d1	! t0_kref+0x38c:   	addccc	%o2, -0xc2f, %o1
	.word	0x29480003	! t0_kref+0x390:   	fbl,a,pt	%fcc0, _kref+0x39c
	.word	0x988a3131	! t0_kref+0x394:   	andcc	%o0, -0xecf, %o4
	.word	0xa7a3083a	! t0_kref+0x398:   	fadds	%f12, %f26, %f19
	.word	0x81a00533	! t0_kref+0x39c:   	fsqrts	%f19, %f0
	.word	0xdd1fbfa0	! t0_kref+0x3a0:   	ldd	[%fp - 0x60], %f14
	.word	0x99a208c4	! t0_kref+0x3a4:   	fsubd	%f8, %f4, %f12
	.word	0xcd266008	! t0_kref+0x3a8:   	st	%f6, [%i1 + 8]
	.word	0xa6aa8017	! t0_kref+0x3ac:   	andncc	%o2, %l7, %l3
	.word	0xa846e2cf	! t0_kref+0x3b0:   	addc	%i3, 0x2cf, %l4
	.word	0xda260000	! t0_kref+0x3b4:   	st	%o5, [%i0]
	.word	0xe36e7ff8	! t0_kref+0x3b8:   	prefetch	%i1 - 8, 17
	.word	0x35480004	! t0_kref+0x3bc:   	fbue,a,pt	%fcc0, _kref+0x3cc
	.word	0xae62c00b	! t0_kref+0x3c0:   	subc	%o3, %o3, %l7
	.word	0x35480004	! t0_kref+0x3c4:   	fbue,a,pt	%fcc0, _kref+0x3d4
	.word	0xd410a02a	! t0_kref+0x3c8:   	lduh	[%g2 + 0x2a], %o2
	.word	0xc36e7ff0	! t0_kref+0x3cc:   	prefetch	%i1 - 0x10, 1
	.word	0xd816001b	! t0_kref+0x3d0:   	lduh	[%i0 + %i3], %o4
	.word	0xada508c4	! t0_kref+0x3d4:   	fsubd	%f20, %f4, %f22
	call	SYM(t0_subr1)
	.word	0x85a018d0	! t0_kref+0x3dc:   	fdtos	%f16, %f2
	.word	0x81a009ab	! t0_kref+0x3e0:   	fdivs	%f0, %f11, %f0
	.word	0xaef6af4a	! t0_kref+0x3e4:   	udivcc	%i2, 0xf4a, %l7
	.word	0x95a01937	! t0_kref+0x3e8:   	fstod	%f23, %f10
	call	SYM(t0_subr2)
	.word	0xe11e401d	! t0_kref+0x3f0:   	ldd	[%i1 + %i5], %f16
	.word	0x95a00137	! t0_kref+0x3f4:   	fabss	%f23, %f10
	.word	0xaa42391f	! t0_kref+0x3f8:   	addc	%o0, -0x6e1, %l5
	.word	0xd0380019	! t0_kref+0x3fc:   	std	%o0, [%g0 + %i1]
	.word	0x97a0053b	! t0_kref+0x400:   	fsqrts	%f27, %f11
	.word	0x963a6f88	! t0_kref+0x404:   	xnor	%o1, 0xf88, %o3
	.word	0xaa92800d	! t0_kref+0x408:   	orcc	%o2, %o5, %l5
	.word	0x952f000c	! t0_kref+0x40c:   	sll	%i4, %o4, %o2
	.word	0x96830008	! t0_kref+0x410:   	addcc	%o4, %o0, %o3
	.word	0x8583356f	! t0_kref+0x414:   	wr	%o4, 0xfffff56f, %ccr
	.word	0xe11e0000	! t0_kref+0x418:   	ldd	[%i0], %f16
	.word	0x96c2ef3e	! t0_kref+0x41c:   	addccc	%o3, 0xf3e, %o3
	.word	0xd050a00a	! t0_kref+0x420:   	ldsh	[%g2 + 0xa], %o0
	.word	0x9890001a	! t0_kref+0x424:   	orcc	%g0, %i2, %o4
	.word	0xe5270019	! t0_kref+0x428:   	st	%f18, [%i4 + %i1]
	.word	0xd0bf5018	! t0_kref+0x42c:   	stda	%o0, [%i5 + %i0]0x80
	sethi	%hi(2f), %o7
	.word	0xe40be078	! t0_kref+0x434:   	ldub	[%o7 + 0x78], %l2
	.word	0xa41ca00c	! t0_kref+0x438:   	xor	%l2, 0xc, %l2
	.word	0xe42be078	! t0_kref+0x43c:   	stb	%l2, [%o7 + 0x78]
	.word	0x81dbe078	! t0_kref+0x440:   	flush	%o7 + 0x78
	.word	0xa5a0189a	! t0_kref+0x444:   	fitos	%f26, %f18
	.word	0xa9400000	! t0_kref+0x448:   	mov	%y, %l4
	.word	0xda167fe8	! t0_kref+0x44c:   	lduh	[%i1 - 0x18], %o5
	.word	0xae62f301	! t0_kref+0x450:   	subc	%o3, -0xcff, %l7
	.word	0x31800007	! t0_kref+0x454:   	fba,a	_kref+0x470
	.word	0xd04e2012	! t0_kref+0x458:   	ldsb	[%i0 + 0x12], %o0
	.word	0x37800001	! t0_kref+0x45c:   	fbge,a	_kref+0x460
	.word	0xaa7271ca	! t0_kref+0x460:   	udiv	%o1, -0xe36, %l5
	.word	0xf420a000	! t0_kref+0x464:   	st	%i2, [%g2]
	.word	0xe84e6002	! t0_kref+0x468:   	ldsb	[%i1 + 2], %l4
	.word	0x3d800007	! t0_kref+0x46c:   	fbule,a	_kref+0x488
	.word	0xa8a22d57	! t0_kref+0x470:   	subcc	%o0, 0xd57, %l4
	.word	0xf6200018	! t0_kref+0x474:   	st	%i3, [%g0 + %i0]
2:	.word	0xace5c01c	! t0_kref+0x478:   	subccc	%l7, %i4, %l6
	.word	0x8da01a22	! t0_kref+0x47c:   	fstoi	%f2, %f6
	.word	0x9a66c01c	! t0_kref+0x480:   	subc	%i3, %i4, %o5
	.word	0x90883a33	! t0_kref+0x484:   	andcc	%g0, -0x5cd, %o0
	.word	0x987a0000	! t0_kref+0x488:   	sdiv	%o0, %g0, %o4
	.word	0x9fc00004	! t0_kref+0x48c:   	call	%g0 + %g4
	.word	0xb1a01052	! t0_kref+0x490:   	fdtox	%f18, %f24
	.word	0x91400000	! t0_kref+0x494:   	mov	%y, %o0
	.word	0x9f22400b	! t0_kref+0x498:   	mulscc	%o1, %o3, %o7
	.word	0xa6d5c000	! t0_kref+0x49c:   	umulcc	%l7, %g0, %l3
	.word	0x87a000ac	! t0_kref+0x4a0:   	fnegs	%f12, %f3
	.word	0xa1a389c0	! t0_kref+0x4a4:   	fdivd	%f14, %f0, %f16
	.word	0x9a16801b	! t0_kref+0x4a8:   	or	%i2, %i3, %o5
	.word	0xe11fbfa8	! t0_kref+0x4ac:   	ldd	[%fp - 0x58], %f16
	.word	0xf8364000	! t0_kref+0x4b0:   	sth	%i4, [%i1]
	.word	0xa68b6233	! t0_kref+0x4b4:   	andcc	%o5, 0x233, %l3
	.word	0xe1be185c	! t0_kref+0x4b8:   	stda	%f16, [%i0 + %i4]0xc2
	call	SYM(t0_subr1)
	.word	0xe3b8a080	! t0_kref+0x4c0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x28800007	! t0_kref+0x4c4:   	bleu,a	_kref+0x4e0
	.word	0xc900a028	! t0_kref+0x4c8:   	ld	[%g2 + 0x28], %f4
	.word	0x81deb3c9	! t0_kref+0x4cc:   	flush	%i2 - 0xc37
	.word	0x8d837b40	! t0_kref+0x4d0:   	wr	%o5, 0xfffffb40, %fprs
	.word	0x31480007	! t0_kref+0x4d4:   	fba,a,pt	%fcc0, _kref+0x4f0
	.word	0xcf20a02c	! t0_kref+0x4d8:   	st	%f7, [%g2 + 0x2c]
	.word	0xe7ee101c	! t0_kref+0x4dc:   	prefetcha	%i0 + %i4, 19
	.word	0xa1a0104e	! t0_kref+0x4e0:   	fdtox	%f14, %f16
	.word	0x98127917	! t0_kref+0x4e4:   	or	%o1, -0x6e9, %o4
	.word	0xc020a038	! t0_kref+0x4e8:   	clr	[%g2 + 0x38]
	.word	0xd7a65000	! t0_kref+0x4ec:   	sta	%f11, [%i1]0x80
	.word	0xe408791c	! t0_kref+0x4f0:   	ldub	[%g1 - 0x6e4], %l2
	.word	0xa41ca00c	! t0_kref+0x4f4:   	xor	%l2, 0xc, %l2
	.word	0xe428791c	! t0_kref+0x4f8:   	stb	%l2, [%g1 - 0x6e4]
	.word	0x81d8791c	! t0_kref+0x4fc:   	flush	%g1 - 0x6e4
2:	.word	0xae12e73c	! t0_kref+0x500:   	or	%o3, 0x73c, %l7
	.word	0xa7400000	! t0_kref+0x504:   	mov	%y, %l3
	.word	0x9da01048	! t0_kref+0x508:   	fdtox	%f8, %f14
	.word	0xb7a4c82f	! t0_kref+0x50c:   	fadds	%f19, %f15, %f27
	.word	0xa6d6800b	! t0_kref+0x510:   	umulcc	%i2, %o3, %l3
	.word	0x9ad37d25	! t0_kref+0x514:   	umulcc	%o5, -0x2db, %o5
	.word	0x90b6c00c	! t0_kref+0x518:   	orncc	%i3, %o4, %o0
	.word	0x83a3c938	! t0_kref+0x51c:   	fmuls	%f15, %f24, %f1
	.word	0xf7ee501d	! t0_kref+0x520:   	prefetcha	%i1 + %i5, 27
	.word	0x9267001a	! t0_kref+0x524:   	subc	%i4, %i2, %o1
	.word	0xc320a014	! t0_kref+0x528:   	st	%f1, [%g2 + 0x14]
	.word	0x99a08832	! t0_kref+0x52c:   	fadds	%f2, %f18, %f12
	.word	0x95a049ad	! t0_kref+0x530:   	fdivs	%f1, %f13, %f10
	.word	0x9de3bfa0	! t0_kref+0x534:   	save	%sp, -0x60, %sp
	.word	0xafee801b	! t0_kref+0x538:   	restore	%i2, %i3, %l7
	.word	0xf420a028	! t0_kref+0x53c:   	st	%i2, [%g2 + 0x28]
	.word	0xafa00523	! t0_kref+0x540:   	fsqrts	%f3, %f23
	.word	0x9de3bfa0	! t0_kref+0x544:   	save	%sp, -0x60, %sp
	.word	0x9fe8001b	! t0_kref+0x548:   	restore	%g0, %i3, %o7
	.word	0x9de3bfa0	! t0_kref+0x54c:   	save	%sp, -0x60, %sp
	.word	0xb88e7973	! t0_kref+0x550:   	andcc	%i1, -0x68d, %i4
	.word	0x91ee001c	! t0_kref+0x554:   	restore	%i0, %i4, %o0
	.word	0x9da6c92d	! t0_kref+0x558:   	fmuls	%f27, %f13, %f14
	.word	0x8ba0002c	! t0_kref+0x55c:   	fmovs	%f12, %f5
	.word	0xae070009	! t0_kref+0x560:   	add	%i4, %o1, %l7
	.word	0xada6c936	! t0_kref+0x564:   	fmuls	%f27, %f22, %f22
	.word	0xd850a01a	! t0_kref+0x568:   	ldsh	[%g2 + 0x1a], %o4
	.word	0xd41e3fe8	! t0_kref+0x56c:   	ldd	[%i0 - 0x18], %o2
	.word	0xde08a03c	! t0_kref+0x570:   	ldub	[%g2 + 0x3c], %o7
	call	SYM(t0_subr3)
	.word	0x99a2483b	! t0_kref+0x578:   	fadds	%f9, %f27, %f12
	.word	0x9ba00034	! t0_kref+0x57c:   	fmovs	%f20, %f13
	.word	0x95a2cd3a	! t0_kref+0x580:   	fsmuld	%f11, %f26, %f10
	.word	0xd426600c	! t0_kref+0x584:   	st	%o2, [%i1 + 0xc]
	.word	0x8da50946	! t0_kref+0x588:   	fmuld	%f20, %f6, %f6
	.word	0x96622a4b	! t0_kref+0x58c:   	subc	%o0, 0xa4b, %o3
	.word	0x9e22f227	! t0_kref+0x590:   	sub	%o3, -0xdd9, %o7
	.word	0xb4103fe8	! t0_kref+0x594:   	mov	0xffffffe8, %i2
	.word	0x38480006	! t0_kref+0x598:   	bgu,a,pt	%icc, _kref+0x5b0
	.word	0xa863000d	! t0_kref+0x59c:   	subc	%o4, %o5, %l4
	.word	0x9a26c00a	! t0_kref+0x5a0:   	sub	%i3, %o2, %o5
	.word	0xcd20a00c	! t0_kref+0x5a4:   	st	%f6, [%g2 + 0xc]
	.word	0x20800001	! t0_kref+0x5a8:   	bn,a	_kref+0x5ac
	.word	0x9ac68017	! t0_kref+0x5ac:   	addccc	%i2, %l7, %o5
	.word	0x26800001	! t0_kref+0x5b0:   	bl,a	_kref+0x5b4
	.word	0x965b000a	! t0_kref+0x5b4:   	smul	%o4, %o2, %o3
	.word	0xa84260a7	! t0_kref+0x5b8:   	addc	%o1, 0xa7, %l4
	.word	0xf828a02d	! t0_kref+0x5bc:   	stb	%i4, [%g2 + 0x2d]
	.word	0xe4087a0c	! t0_kref+0x5c0:   	ldub	[%g1 - 0x5f4], %l2
	.word	0xa41ca00c	! t0_kref+0x5c4:   	xor	%l2, 0xc, %l2
	.word	0xe4287a0c	! t0_kref+0x5c8:   	stb	%l2, [%g1 - 0x5f4]
	.word	0x81d87a0c	! t0_kref+0x5cc:   	flush	%g1 - 0x5f4
	.word	0xaf33201d	! t0_kref+0x5d0:   	srl	%o4, 0x1d, %l7
	.word	0x93a00534	! t0_kref+0x5d4:   	fsqrts	%f20, %f9
	.word	0x83a0052d	! t0_kref+0x5d8:   	fsqrts	%f13, %f1
	.word	0xe41e6000	! t0_kref+0x5dc:   	ldd	[%i1], %l2
	.word	0xe96e401d	! t0_kref+0x5e0:   	prefetch	%i1 + %i5, 20
	.word	0x8da008da	! t0_kref+0x5e4:   	fsubd	%f0, %f26, %f6
	.word	0xd22e3ff6	! t0_kref+0x5e8:   	stb	%o1, [%i0 - 0xa]
	.word	0xe84e8018	! t0_kref+0x5ec:   	ldsb	[%i2 + %i0], %l4
2:	.word	0x83a0c82b	! t0_kref+0x5f0:   	fadds	%f3, %f11, %f1
	.word	0xa7a0013a	! t0_kref+0x5f4:   	fabss	%f26, %f19
	.word	0x992f200e	! t0_kref+0x5f8:   	sll	%i4, 0xe, %o4
	.word	0x9a7a3a80	! t0_kref+0x5fc:   	sdiv	%o0, -0x580, %o5
	.word	0xc76e001c	! t0_kref+0x600:   	prefetch	%i0 + %i4, 3
	.word	0xaa18000c	! t0_kref+0x604:   	xor	%g0, %o4, %l5
	.word	0x9e5eba87	! t0_kref+0x608:   	smul	%i2, -0x579, %o7
	.word	0xd07e6018	! t0_kref+0x60c:   	swap	[%i1 + 0x18], %o0
	.word	0x9e9f001a	! t0_kref+0x610:   	xorcc	%i4, %i2, %o7
	.word	0x9043401b	! t0_kref+0x614:   	addc	%o5, %i3, %o0
	.word	0x3e480002	! t0_kref+0x618:   	bvc,a,pt	%icc, _kref+0x620
	.word	0xaa7aafb7	! t0_kref+0x61c:   	sdiv	%o2, 0xfb7, %l5
	.word	0xaa63364f	! t0_kref+0x620:   	subc	%o4, -0x9b1, %l5
	.word	0x81a00142	! t0_kref+0x624:   	fabsd	%f2, %f0
	.word	0xae60000c	! t0_kref+0x628:   	subc	%g0, %o4, %l7
	.word	0x8143c000	! t0_kref+0x62c:   	stbar
	.word	0x9898000b	! t0_kref+0x630:   	xorcc	%g0, %o3, %o4
	.word	0x2d800008	! t0_kref+0x634:   	fbg,a	_kref+0x654
	.word	0xec00a014	! t0_kref+0x638:   	ld	[%g2 + 0x14], %l6
	.word	0xefee501c	! t0_kref+0x63c:   	prefetcha	%i1 + %i4, 23
	.word	0xe600a02c	! t0_kref+0x640:   	ld	[%g2 + 0x2c], %l3
	.word	0xaa7ef112	! t0_kref+0x644:   	sdiv	%i3, -0xeee, %l5
	.word	0x96034008	! t0_kref+0x648:   	add	%o5, %o0, %o3
	.word	0x9a3ec01b	! t0_kref+0x64c:   	xnor	%i3, %i3, %o5
	.word	0xec166010	! t0_kref+0x650:   	lduh	[%i1 + 0x10], %l6
	.word	0x81ae8a48	! t0_kref+0x654:   	fcmpd	%fcc0, %f26, %f8
	.word	0xe81e7fe0	! t0_kref+0x658:   	ldd	[%i1 - 0x20], %l4
	.word	0xd500a014	! t0_kref+0x65c:   	ld	[%g2 + 0x14], %f10
	.word	0xa647000b	! t0_kref+0x660:   	addc	%i4, %o3, %l3
	.word	0xa63f0008	! t0_kref+0x664:   	xnor	%i4, %o0, %l3
	sethi	%hi(2f), %o7
	.word	0xe40be27c	! t0_kref+0x66c:   	ldub	[%o7 + 0x27c], %l2
	.word	0xa41ca00c	! t0_kref+0x670:   	xor	%l2, 0xc, %l2
	.word	0xe42be27c	! t0_kref+0x674:   	stb	%l2, [%o7 + 0x27c]
	.word	0x81dbe27c	! t0_kref+0x678:   	flush	%o7 + 0x27c
2:	.word	0xa61aa8db	! t0_kref+0x67c:   	xor	%o2, 0x8db, %l3
	.word	0x86102003	! t0_kref+0x680:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x684:   	bne,a	_kref+0x684
	.word	0x86a0e001	! t0_kref+0x688:   	subcc	%g3, 1, %g3
	call	SYM(t0_subr0)
	.word	0x91a00128	! t0_kref+0x690:   	fabss	%f8, %f8
	.word	0x91a488ce	! t0_kref+0x694:   	fsubd	%f18, %f14, %f8
	.word	0xa645ed33	! t0_kref+0x698:   	addc	%l7, 0xd33, %l3
	.word	0xd610a03e	! t0_kref+0x69c:   	lduh	[%g2 + 0x3e], %o3
	.word	0xda50a02e	! t0_kref+0x6a0:   	ldsh	[%g2 + 0x2e], %o5
	.word	0xf53e001d	! t0_kref+0x6a4:   	std	%f26, [%i0 + %i5]
	.word	0x9842f30c	! t0_kref+0x6a8:   	addc	%o3, -0xcf4, %o4
	.word	0x32800005	! t0_kref+0x6ac:   	bne,a	_kref+0x6c0
	.word	0x8ba249ad	! t0_kref+0x6b0:   	fdivs	%f9, %f13, %f5
	.word	0x9ba00525	! t0_kref+0x6b4:   	fsqrts	%f5, %f13
	.word	0xaba189a0	! t0_kref+0x6b8:   	fdivs	%f6, %f0, %f21
	.word	0xaba488b0	! t0_kref+0x6bc:   	fsubs	%f18, %f16, %f21
	.word	0x271497a6	! t0_kref+0x6c0:   	sethi	%hi(0x525e9800), %l3
	.word	0x3f480007	! t0_kref+0x6c4:   	fbo,a,pt	%fcc0, _kref+0x6e0
	.word	0x983b675b	! t0_kref+0x6c8:   	xnor	%o5, 0x75b, %o4
	.word	0x38800001	! t0_kref+0x6cc:   	bgu,a	_kref+0x6d0
	.word	0xe6100019	! t0_kref+0x6d0:   	lduh	[%g0 + %i1], %l3
	.word	0xae1eb917	! t0_kref+0x6d4:   	xor	%i2, -0x6e9, %l7
	.word	0xafa00537	! t0_kref+0x6d8:   	fsqrts	%f23, %f23
	.word	0xb6102004	! t0_kref+0x6dc:   	mov	0x4, %i3
	.word	0x30800003	! t0_kref+0x6e0:   	ba,a	_kref+0x6ec
	.word	0xa3a189a2	! t0_kref+0x6e4:   	fdivs	%f6, %f2, %f17
	.word	0xd700a024	! t0_kref+0x6e8:   	ld	[%g2 + 0x24], %f11
	.word	0xec1e2018	! t0_kref+0x6ec:   	ldd	[%i0 + 0x18], %l6
	.word	0xada00030	! t0_kref+0x6f0:   	fmovs	%f16, %f22
	.word	0x2b480004	! t0_kref+0x6f4:   	fbug,a,pt	%fcc0, _kref+0x704
	.word	0x9e56c000	! t0_kref+0x6f8:   	umul	%i3, %g0, %o7
	.word	0xe850a038	! t0_kref+0x6fc:   	ldsh	[%g2 + 0x38], %l4
	.word	0x81ac0a4a	! t0_kref+0x700:   	fcmpd	%fcc0, %f16, %f10
	.word	0x9612e155	! t0_kref+0x704:   	or	%o3, 0x155, %o3
	.word	0x81ddf69c	! t0_kref+0x708:   	flush	%l7 - 0x964
	.word	0x81a90a46	! t0_kref+0x70c:   	fcmpd	%fcc0, %f4, %f6
	.word	0xc807bfec	! t0_kref+0x710:   	ld	[%fp - 0x14], %g4
	.word	0x23800007	! t0_kref+0x714:   	fbne,a	_kref+0x730
	.word	0x81dec00a	! t0_kref+0x718:   	flush	%i3 + %o2
	.word	0xa3a000a2	! t0_kref+0x71c:   	fnegs	%f2, %f17
	.word	0x93400000	! t0_kref+0x720:   	mov	%y, %o1
	.word	0xda263fe8	! t0_kref+0x724:   	st	%o5, [%i0 - 0x18]
	.word	0x9e433d9a	! t0_kref+0x728:   	addc	%o4, -0x266, %o7
	.word	0x8fa0003a	! t0_kref+0x72c:   	fmovs	%f26, %f7
	.word	0xa85ac01b	! t0_kref+0x730:   	smul	%o3, %i3, %l4
	.word	0x97703e5d	! t0_kref+0x734:   	popc	-0x1a3, %o3
	.word	0x86102004	! t0_kref+0x738:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x73c:   	bne,a	_kref+0x73c
	.word	0x86a0e001	! t0_kref+0x740:   	subcc	%g3, 1, %g3
	.word	0x94028000	! t0_kref+0x744:   	add	%o2, %g0, %o2
	.word	0xe8ce9019	! t0_kref+0x748:   	ldsba	[%i2 + %i1]0x80, %l4
	.word	0x81aa4ab4	! t0_kref+0x74c:   	fcmpes	%fcc0, %f9, %f20
	.word	0x943ef6cf	! t0_kref+0x750:   	xnor	%i3, -0x931, %o2
	.word	0xee364000	! t0_kref+0x754:   	sth	%l7, [%i1]
	.word	0xacb30009	! t0_kref+0x758:   	orncc	%o4, %o1, %l6
	.word	0x92224008	! t0_kref+0x75c:   	sub	%o1, %o0, %o1
	.word	0xe4087b9c	! t0_kref+0x760:   	ldub	[%g1 - 0x464], %l2
	.word	0xa41ca00c	! t0_kref+0x764:   	xor	%l2, 0xc, %l2
	.word	0xe4287b9c	! t0_kref+0x768:   	stb	%l2, [%g1 - 0x464]
	.word	0x81d87b9c	! t0_kref+0x76c:   	flush	%g1 - 0x464
	.word	0xa1a00521	! t0_kref+0x770:   	fsqrts	%f1, %f16
	.word	0xaf703b41	! t0_kref+0x774:   	popc	-0x4bf, %l7
	.word	0xa625c01a	! t0_kref+0x778:   	sub	%l7, %i2, %l3
	.word	0x96c72502	! t0_kref+0x77c:   	addccc	%i4, 0x502, %o3
2:	.word	0xe078a000	! t0_kref+0x780:   	swap	[%g2], %l0
	.word	0x93a00127	! t0_kref+0x784:   	fabss	%f7, %f9
	.word	0xde160000	! t0_kref+0x788:   	lduh	[%i0], %o7
	.word	0xab0eeb3c	! t0_kref+0x78c:   	tsubcc	%i3, 0xb3c, %l5
	.word	0xd420a030	! t0_kref+0x790:   	st	%o2, [%g2 + 0x30]
	.word	0x85a00020	! t0_kref+0x794:   	fmovs	%f0, %f2
	.word	0x93a28935	! t0_kref+0x798:   	fmuls	%f10, %f21, %f9
	.word	0xd2266004	! t0_kref+0x79c:   	st	%o1, [%i1 + 4]
	.word	0x99a01054	! t0_kref+0x7a0:   	fdtox	%f20, %f12
	.word	0xec50a018	! t0_kref+0x7a4:   	ldsh	[%g2 + 0x18], %l6
	.word	0x92200009	! t0_kref+0x7a8:   	neg	%o1
	.word	0xde48a000	! t0_kref+0x7ac:   	ldsb	[%g2], %o7
	.word	0x81a88ab9	! t0_kref+0x7b0:   	fcmpes	%fcc0, %f2, %f25
	.word	0xac926d2e	! t0_kref+0x7b4:   	orcc	%o1, 0xd2e, %l6
	.word	0x8ba00524	! t0_kref+0x7b8:   	fsqrts	%f4, %f5
	.word	0xebee101c	! t0_kref+0x7bc:   	prefetcha	%i0 + %i4, 21
	.word	0xacaa7e3d	! t0_kref+0x7c0:   	andncc	%o1, -0x1c3, %l6
	.word	0xe6fe101c	! t0_kref+0x7c4:   	swapa	[%i0 + %i4]0x80, %l3
	.word	0xa1a488cc	! t0_kref+0x7c8:   	fsubd	%f18, %f12, %f16
	.word	0x9aa224eb	! t0_kref+0x7cc:   	subcc	%o0, 0x4eb, %o5
	.word	0x97a01899	! t0_kref+0x7d0:   	fitos	%f25, %f11
	.word	0x965dc01b	! t0_kref+0x7d4:   	smul	%l7, %i3, %o3
	.word	0xd44e001a	! t0_kref+0x7d8:   	ldsb	[%i0 + %i2], %o2
	.word	0xec1e0000	! t0_kref+0x7dc:   	ldd	[%i0], %l6
	.word	0x9fa01899	! t0_kref+0x7e0:   	fitos	%f25, %f15
	.word	0x942e8009	! t0_kref+0x7e4:   	andn	%i2, %o1, %o2
	.word	0x9e780017	! t0_kref+0x7e8:   	sdiv	%g0, %l7, %o7
	.word	0x81a6c926	! t0_kref+0x7ec:   	fmuls	%f27, %f6, %f0
	.word	0x35480004	! t0_kref+0x7f0:   	fbue,a,pt	%fcc0, _kref+0x800
	.word	0x81a00126	! t0_kref+0x7f4:   	fabss	%f6, %f0
	.word	0x20800001	! t0_kref+0x7f8:   	bn,a	_kref+0x7fc
	.word	0x900ac00a	! t0_kref+0x7fc:   	and	%o3, %o2, %o0
	.word	0x9ec32a28	! t0_kref+0x800:   	addccc	%o4, 0xa28, %o7
	.word	0xc1be185b	! t0_kref+0x804:   	stda	%f0, [%i0 + %i3]0xc2
	.word	0xee270018	! t0_kref+0x808:   	st	%l7, [%i4 + %i0]
	.word	0x91664008	! t0_kref+0x80c:   	movne	%icc, %o0, %o0
	.word	0x89a01a22	! t0_kref+0x810:   	fstoi	%f2, %f4
	.word	0x2d800008	! t0_kref+0x814:   	fbg,a	_kref+0x834
	.word	0x9ba00038	! t0_kref+0x818:   	fmovs	%f24, %f13
	.word	0x9046c01b	! t0_kref+0x81c:   	addc	%i3, %i3, %o0
	.word	0xc11fbca0	! t0_kref+0x820:   	ldd	[%fp - 0x360], %f0
	.word	0x9fa01884	! t0_kref+0x824:   	fitos	%f4, %f15
	.word	0x93a01897	! t0_kref+0x828:   	fitos	%f23, %f9
	.word	0x8585f889	! t0_kref+0x82c:   	wr	%l7, 0xfffff889, %ccr
	.word	0xd2801019	! t0_kref+0x830:   	lda	[%g0 + %i1]0x80, %o1
	.word	0x001fffff	! t0_kref+0x834:   	illtrap	0x1fffff
	.word	0xd91e3ff0	! t0_kref+0x838:   	ldd	[%i0 - 0x10], %f12
	.word	0x9fa01883	! t0_kref+0x83c:   	fitos	%f3, %f15
	.word	0x3e480003	! t0_kref+0x840:   	bvc,a,pt	%icc, _kref+0x84c
	.word	0xc5260000	! t0_kref+0x844:   	st	%f2, [%i0]
	.word	0xc0ff1018	! t0_kref+0x848:   	swapa	[%i4 + %i0]0x80, %g0
	.word	0x81ac0a40	! t0_kref+0x84c:   	fcmpd	%fcc0, %f16, %f0
	.word	0xaa236c3b	! t0_kref+0x850:   	sub	%o5, 0xc3b, %l5
	.word	0x81db6d72	! t0_kref+0x854:   	flush	%o5 + 0xd72
	.word	0xc398a040	! t0_kref+0x858:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xd208a023	! t0_kref+0x85c:   	ldub	[%g2 + 0x23], %o1
	.word	0x29008f19	! t0_kref+0x860:   	sethi	%hi(0x23c6400), %l4
	.word	0x92b26a50	! t0_kref+0x864:   	orncc	%o1, 0xa50, %o1
	.word	0x89a1cd2d	! t0_kref+0x868:   	fsmuld	%f7, %f13, %f4
	.word	0x31800007	! t0_kref+0x86c:   	fba,a	_kref+0x888
	.word	0xc11fbcc0	! t0_kref+0x870:   	ldd	[%fp - 0x340], %f0
	.word	0xcd1fbce8	! t0_kref+0x874:   	ldd	[%fp - 0x318], %f6
	.word	0xc51fbd30	! t0_kref+0x878:   	ldd	[%fp - 0x2d0], %f2
	.word	0x81adca38	! t0_kref+0x87c:   	fcmps	%fcc0, %f23, %f24
	.word	0x81a149a7	! t0_kref+0x880:   	fdivs	%f5, %f7, %f0
	.word	0xafa01a4e	! t0_kref+0x884:   	fdtoi	%f14, %f23
	.word	0xa9a00526	! t0_kref+0x888:   	fsqrts	%f6, %f20
	call	SYM(t0_subr0)
	.word	0xda2e7fef	! t0_kref+0x890:   	stb	%o5, [%i1 - 0x11]
	.word	0xa85a0017	! t0_kref+0x894:   	smul	%o0, %l7, %l4
	.word	0x3f480008	! t0_kref+0x898:   	fbo,a,pt	%fcc0, _kref+0x8b8
	.word	0xd4262000	! t0_kref+0x89c:   	st	%o2, [%i0]
	.word	0xaeb2a63a	! t0_kref+0x8a0:   	orncc	%o2, 0x63a, %l7
	.word	0x8143c000	! t0_kref+0x8a4:   	stbar
	.word	0xa9a3894c	! t0_kref+0x8a8:   	fmuld	%f14, %f12, %f20
	.word	0x94528000	! t0_kref+0x8ac:   	umul	%o2, %g0, %o2
	call	SYM(t0_subr2)
	.word	0xe1be5a1a	! t0_kref+0x8b4:   	stda	%f16, [%i1 + %i2]0xd0
	.word	0xe9ee501b	! t0_kref+0x8b8:   	prefetcha	%i1 + %i3, 20
	call	SYM(t0_subr1)
	.word	0xe9bf1a19	! t0_kref+0x8c0:   	stda	%f20, [%i4 + %i1]0xd0
	.word	0xa61ec00d	! t0_kref+0x8c4:   	xor	%i3, %o5, %l3
	.word	0xa69b6866	! t0_kref+0x8c8:   	xorcc	%o5, 0x866, %l3
	.word	0xaaa2e819	! t0_kref+0x8cc:   	subcc	%o3, 0x819, %l5
	.word	0xee10a03c	! t0_kref+0x8d0:   	lduh	[%g2 + 0x3c], %l7
	.word	0xae13001b	! t0_kref+0x8d4:   	or	%o4, %i3, %l7
	.word	0xd830a000	! t0_kref+0x8d8:   	sth	%o4, [%g2]
	.word	0xac5b7717	! t0_kref+0x8dc:   	smul	%o5, -0x8e9, %l6
	.word	0xa6230009	! t0_kref+0x8e0:   	sub	%o4, %o1, %l3
	.word	0x8143e003	! t0_kref+0x8e4:   	membar	0x3
	.word	0x28800003	! t0_kref+0x8e8:   	bleu,a	_kref+0x8f4
	.word	0xc76e7ff0	! t0_kref+0x8ec:   	prefetch	%i1 - 0x10, 3
	.word	0xd700a008	! t0_kref+0x8f0:   	ld	[%g2 + 8], %f11
	.word	0x9ba01892	! t0_kref+0x8f4:   	fitos	%f18, %f13
	.word	0x90e2401b	! t0_kref+0x8f8:   	subccc	%o1, %i3, %o0
	.word	0xae226d35	! t0_kref+0x8fc:   	sub	%o1, 0xd35, %l7
	.word	0x944724e7	! t0_kref+0x900:   	addc	%i4, 0x4e7, %o2
	.word	0x9a5269b9	! t0_kref+0x904:   	umul	%o1, 0x9b9, %o5
	.word	0xdb266000	! t0_kref+0x908:   	st	%f13, [%i1]
	.word	0xa842800a	! t0_kref+0x90c:   	addc	%o2, %o2, %l4
	.word	0x92632e89	! t0_kref+0x910:   	subc	%o4, 0xe89, %o1
	.word	0x86102020	! t0_kref+0x914:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0x918:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x91c:   	be,a	_kref+0x948
	.word	0xada10956	! t0_kref+0x920:   	fmuld	%f4, %f22, %f22
	.word	0xa1a000ca	! t0_kref+0x924:   	fnegd	%f10, %f16
	.word	0xe9be184d	! t0_kref+0x928:   	stda	%f20, [%i0 + %o5]0xc2
	.word	0xacd2c00c	! t0_kref+0x92c:   	umulcc	%o3, %o4, %l6
	.word	0xaf2b000a	! t0_kref+0x930:   	sll	%o4, %o2, %l7
	.word	0x91a24822	! t0_kref+0x934:   	fadds	%f9, %f2, %f8
	.word	0x89a1882f	! t0_kref+0x938:   	fadds	%f6, %f15, %f4
	.word	0xc807bfec	! t0_kref+0x93c:   	ld	[%fp - 0x14], %g4
	.word	0xd720a028	! t0_kref+0x940:   	st	%f11, [%g2 + 0x28]
	.word	0xb7a0053a	! t0_kref+0x944:   	fsqrts	%f26, %f27
	.word	0x986260f4	! t0_kref+0x948:   	subc	%o1, 0xf4, %o4
	.word	0x92f6c01b	! t0_kref+0x94c:   	udivcc	%i3, %i3, %o1
	.word	0xf430a03a	! t0_kref+0x950:   	sth	%i2, [%g2 + 0x3a]
	.word	0xda50a038	! t0_kref+0x954:   	ldsh	[%g2 + 0x38], %o5
	.word	0xaa3f3b16	! t0_kref+0x958:   	xnor	%i4, -0x4ea, %l5
	.word	0x90873f9a	! t0_kref+0x95c:   	addcc	%i4, -0x66, %o0
	.word	0xf96e001a	! t0_kref+0x960:   	prefetch	%i0 + %i2, 28
	.word	0x9422400c	! t0_kref+0x964:   	sub	%o1, %o4, %o2
	.word	0x91372002	! t0_kref+0x968:   	srl	%i4, 0x2, %o0
	.word	0x9a55c00b	! t0_kref+0x96c:   	umul	%l7, %o3, %o5
	.word	0x92122874	! t0_kref+0x970:   	or	%o0, 0x874, %o1
	.word	0x9e3b400b	! t0_kref+0x974:   	xnor	%o5, %o3, %o7
	.word	0xf62e001a	! t0_kref+0x978:   	stb	%i3, [%i0 + %i2]
	.word	0x933a6000	! t0_kref+0x97c:   	sra	%o1, 0x0, %o1
	.word	0xb1a00033	! t0_kref+0x980:   	fmovs	%f19, %f24
	.word	0xac92ab64	! t0_kref+0x984:   	orcc	%o2, 0xb64, %l6
	.word	0xaa62801a	! t0_kref+0x988:   	subc	%o2, %i2, %l5
	.word	0x3f480007	! t0_kref+0x98c:   	fbo,a,pt	%fcc0, _kref+0x9a8
	.word	0x9022000d	! t0_kref+0x990:   	sub	%o0, %o5, %o0
	.word	0x9856c00b	! t0_kref+0x994:   	umul	%i3, %o3, %o4
	.word	0xea4e4000	! t0_kref+0x998:   	ldsb	[%i1], %l5
	call	SYM(t0_subr0)
	.word	0xa0a2001b	! t0_kref+0x9a0:   	subcc	%o0, %i3, %l0
	.word	0xd0861000	! t0_kref+0x9a4:   	lda	[%i0]0x80, %o0
	.word	0xa802801b	! t0_kref+0x9a8:   	add	%o2, %i3, %l4
	.word	0x98b5e490	! t0_kref+0x9ac:   	orncc	%l7, 0x490, %o4
	.word	0x81aa0ab9	! t0_kref+0x9b0:   	fcmpes	%fcc0, %f8, %f25
	.word	0x9006c009	! t0_kref+0x9b4:   	add	%i3, %o1, %o0
	.word	0x8fa249b9	! t0_kref+0x9b8:   	fdivs	%f9, %f25, %f7
	.word	0xd4480019	! t0_kref+0x9bc:   	ldsb	[%g0 + %i1], %o2
	.word	0xb1a5c93b	! t0_kref+0x9c0:   	fmuls	%f23, %f27, %f24
	.word	0xba103fe8	! t0_kref+0x9c4:   	mov	0xffffffe8, %i5
	.word	0x8fa00535	! t0_kref+0x9c8:   	fsqrts	%f21, %f7
	.word	0xea48a02d	! t0_kref+0x9cc:   	ldsb	[%g2 + 0x2d], %l5
	.word	0xafa00124	! t0_kref+0x9d0:   	fabss	%f4, %f23
	.word	0xd7a61000	! t0_kref+0x9d4:   	sta	%f11, [%i0]0x80
	.word	0x81aa0a56	! t0_kref+0x9d8:   	fcmpd	%fcc0, %f8, %f22
	.word	0x97a000a8	! t0_kref+0x9dc:   	fnegs	%f8, %f11
	.word	0xa6434008	! t0_kref+0x9e0:   	addc	%o5, %o0, %l3
	.word	0x96602770	! t0_kref+0x9e4:   	subc	%g0, 0x770, %o3
	.word	0x81dd8019	! t0_kref+0x9e8:   	flush	%l6 + %i1
	.word	0x89a01939	! t0_kref+0x9ec:   	fstod	%f25, %f4
	.word	0xaba000a2	! t0_kref+0x9f0:   	fnegs	%f2, %f21
	.word	0x98b27d32	! t0_kref+0x9f4:   	orncc	%o1, -0x2ce, %o4
	.word	0x949e801c	! t0_kref+0x9f8:   	xorcc	%i2, %i4, %o2
	.word	0x29480002	! t0_kref+0x9fc:   	fbl,a,pt	%fcc0, _kref+0xa04
	.word	0x98e3400b	! t0_kref+0xa00:   	subccc	%o5, %o3, %o4
	.word	0x87a01a3b	! t0_kref+0xa04:   	fstoi	%f27, %f3
	.word	0xc900a034	! t0_kref+0xa08:   	ld	[%g2 + 0x34], %f4
	.word	0xe900a004	! t0_kref+0xa0c:   	ld	[%g2 + 4], %f20
	.word	0xa7a00536	! t0_kref+0xa10:   	fsqrts	%f22, %f19
	.word	0x23800007	! t0_kref+0xa14:   	fbne,a	_kref+0xa30
	.word	0xae922391	! t0_kref+0xa18:   	orcc	%o0, 0x391, %l7
	.word	0xa9324009	! t0_kref+0xa1c:   	srl	%o1, %o1, %l4
	.word	0xae96fb34	! t0_kref+0xa20:   	orcc	%i3, -0x4cc, %l7
	.word	0xd500a030	! t0_kref+0xa24:   	ld	[%g2 + 0x30], %f10
	.word	0x9a8b400d	! t0_kref+0xa28:   	andcc	%o5, %o5, %o5
	.word	0xd0200019	! t0_kref+0xa2c:   	st	%o0, [%g0 + %i1]
	.word	0xd700a024	! t0_kref+0xa30:   	ld	[%g2 + 0x24], %f11
	.word	0x99a01924	! t0_kref+0xa34:   	fstod	%f4, %f12
	.word	0xd120a000	! t0_kref+0xa38:   	st	%f8, [%g2]
	.word	0xacd6b5c9	! t0_kref+0xa3c:   	umulcc	%i2, -0xa37, %l6
	.word	0xa6700008	! t0_kref+0xa40:   	udiv	%g0, %o0, %l3
	.word	0x8da00127	! t0_kref+0xa44:   	fabss	%f7, %f6
	.word	0x928b62b8	! t0_kref+0xa48:   	andcc	%o5, 0x2b8, %o1
	.word	0x90068000	! t0_kref+0xa4c:   	add	%i2, %g0, %o0
	.word	0x27800002	! t0_kref+0xa50:   	fbul,a	_kref+0xa58
	.word	0xd2c81018	! t0_kref+0xa54:   	ldsba	[%g0 + %i0]0x80, %o1
	.word	0xda564000	! t0_kref+0xa58:   	ldsh	[%i1], %o5
	.word	0xed20a020	! t0_kref+0xa5c:   	st	%f22, [%g2 + 0x20]
	.word	0x3f800002	! t0_kref+0xa60:   	fbo,a	_kref+0xa68
	.word	0x94f00009	! t0_kref+0xa64:   	udivcc	%g0, %o1, %o2
	.word	0x86102003	! t0_kref+0xa68:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xa6c:   	bne,a	_kref+0xa6c
	.word	0x86a0e001	! t0_kref+0xa70:   	subcc	%g3, 1, %g3
	.word	0x9ba0012a	! t0_kref+0xa74:   	fabss	%f10, %f13
	.word	0xa6120008	! t0_kref+0xa78:   	or	%o0, %o0, %l3
	.word	0xc11fbfa0	! t0_kref+0xa7c:   	ldd	[%fp - 0x60], %f0
	.word	0xe3b8a080	! t0_kref+0xa80:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x2f800001	! t0_kref+0xa84:   	fbu,a	_kref+0xa88
	.word	0xb1a008c2	! t0_kref+0xa88:   	fsubd	%f0, %f2, %f24
	.word	0x99a0192f	! t0_kref+0xa8c:   	fstod	%f15, %f12
	call	SYM(t0_subr1)
	.word	0xb1a6c8b2	! t0_kref+0xa94:   	fsubs	%f27, %f18, %f24
	.word	0xc1263fec	! t0_kref+0xa98:   	st	%f0, [%i0 - 0x14]
	.word	0xaa726a5c	! t0_kref+0xa9c:   	udiv	%o1, 0xa5c, %l5
	.word	0xd03f4019	! t0_kref+0xaa0:   	std	%o0, [%i5 + %i1]
	.word	0x81a98a2c	! t0_kref+0xaa4:   	fcmps	%fcc0, %f6, %f12
	.word	0xb3a018da	! t0_kref+0xaa8:   	fdtos	%f26, %f25
	.word	0x9062a28f	! t0_kref+0xaac:   	subc	%o2, 0x28f, %o0
	.word	0xb7a00131	! t0_kref+0xab0:   	fabss	%f17, %f27
	.word	0x9a3e801b	! t0_kref+0xab4:   	xnor	%i2, %i3, %o5
	.word	0xd43e3ff0	! t0_kref+0xab8:   	std	%o2, [%i0 - 0x10]
	.word	0x89a000ae	! t0_kref+0xabc:   	fnegs	%f14, %f4
	.word	0x99400000	! t0_kref+0xac0:   	mov	%y, %o4
	.word	0x90b727ed	! t0_kref+0xac4:   	orncc	%i4, 0x7ed, %o0
	.word	0xe89e1000	! t0_kref+0xac8:   	ldda	[%i0]0x80, %l4
	.word	0x99a489d2	! t0_kref+0xacc:   	fdivd	%f18, %f18, %f12
	.word	0xa6b735a8	! t0_kref+0xad0:   	orncc	%i4, -0xa58, %l3
	.word	0xd840a030	! t0_kref+0xad4:   	ldsw	[%g2 + 0x30], %o4
	.word	0x98b03755	! t0_kref+0xad8:   	orncc	%g0, -0x8ab, %o4
	.word	0x293de0cb	! t0_kref+0xadc:   	sethi	%hi(0xf7832c00), %l4
	.word	0xd41e6010	! t0_kref+0xae0:   	ldd	[%i1 + 0x10], %o2
	.word	0x9ad7000b	! t0_kref+0xae4:   	umulcc	%i4, %o3, %o5
	.word	0xa9a10956	! t0_kref+0xae8:   	fmuld	%f4, %f22, %f20
	.word	0xd020a008	! t0_kref+0xaec:   	st	%o0, [%g2 + 8]
	.word	0xde48a018	! t0_kref+0xaf0:   	ldsb	[%g2 + 0x18], %o7
	.word	0x90427310	! t0_kref+0xaf4:   	addc	%o1, -0xcf0, %o0
	.word	0x9206800c	! t0_kref+0xaf8:   	add	%i2, %o4, %o1
	.word	0xae926c40	! t0_kref+0xafc:   	orcc	%o1, 0xc40, %l7
	.word	0xa85361cd	! t0_kref+0xb00:   	umul	%o5, 0x1cd, %l4
	.word	0x94fa6825	! t0_kref+0xb04:   	sdivcc	%o1, 0x825, %o2
	.word	0xd06e2009	! t0_kref+0xb08:   	ldstub	[%i0 + 9], %o0
	.word	0x8143e022	! t0_kref+0xb0c:   	membar	0x22
	.word	0x81a94ab8	! t0_kref+0xb10:   	fcmpes	%fcc0, %f5, %f24
	.word	0xaa8a7a1a	! t0_kref+0xb14:   	andcc	%o1, -0x5e6, %l5
	.word	0x89a589bb	! t0_kref+0xb18:   	fdivs	%f22, %f27, %f4
	.word	0xc398a040	! t0_kref+0xb1c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xaa932b70	! t0_kref+0xb20:   	orcc	%o4, 0xb70, %l5
	.word	0x9e007f44	! t0_kref+0xb24:   	add	%g1, -0xbc, %o7
!	.word	0x24bd2d30	! t0_kref+0xb28:   	ble,a	SYM(t0_subr3)
	   	ble,a	SYM(t0_subr3)
	.word	0x9627001b	! t0_kref+0xb2c:   	sub	%i4, %i3, %o3
	.word	0x97400000	! t0_kref+0xb30:   	mov	%y, %o3
	.word	0x9a65ee5e	! t0_kref+0xb34:   	subc	%l7, 0xe5e, %o5
	.word	0x85a01058	! t0_kref+0xb38:   	fdtox	%f24, %f2
	.word	0xae36f267	! t0_kref+0xb3c:   	orn	%i3, -0xd99, %l7
	.word	0x2c800003	! t0_kref+0xb40:   	bneg,a	_kref+0xb4c
	.word	0xa6b738e3	! t0_kref+0xb44:   	orncc	%i4, -0x71d, %l3
	.word	0xb1a608c6	! t0_kref+0xb48:   	fsubd	%f24, %f6, %f24
	.word	0xe3b8a080	! t0_kref+0xb4c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xee10a020	! t0_kref+0xb50:   	lduh	[%g2 + 0x20], %l7
	.word	0xa68af469	! t0_kref+0xb54:   	andcc	%o3, -0xb97, %l3
	.word	0x3a800007	! t0_kref+0xb58:   	bcc,a	_kref+0xb74
	.word	0xa5a688d4	! t0_kref+0xb5c:   	fsubd	%f26, %f20, %f18
	.word	0xa6a6fc11	! t0_kref+0xb60:   	subcc	%i3, -0x3ef, %l3
	.word	0x9e5f2cef	! t0_kref+0xb64:   	smul	%i4, 0xcef, %o7
	.word	0x81aa8a21	! t0_kref+0xb68:   	fcmps	%fcc0, %f10, %f1
	.word	0xacd23802	! t0_kref+0xb6c:   	umulcc	%o0, -0x7fe, %l6
	.word	0xae62c00a	! t0_kref+0xb70:   	subc	%o3, %o2, %l7
	.word	0xd13e6018	! t0_kref+0xb74:   	std	%f8, [%i1 + 0x18]
	.word	0x973ec00b	! t0_kref+0xb78:   	sra	%i3, %o3, %o3
	.word	0x8da24d25	! t0_kref+0xb7c:   	fsmuld	%f9, %f5, %f6
	.word	0x99a30856	! t0_kref+0xb80:   	faddd	%f12, %f22, %f12
	.word	0xac936ca5	! t0_kref+0xb84:   	orcc	%o5, 0xca5, %l6
	.word	0x81a01887	! t0_kref+0xb88:   	fitos	%f7, %f0
	.word	0xb5a34d38	! t0_kref+0xb8c:   	fsmuld	%f13, %f24, %f26
	.word	0x81de0018	! t0_kref+0xb90:   	flush	%i0 + %i0
	.word	0x33480002	! t0_kref+0xb94:   	fbe,a,pt	%fcc0, _kref+0xb9c
	.word	0x98c6bd5e	! t0_kref+0xb98:   	addccc	%i2, -0x2a2, %o4
	.word	0x972ec017	! t0_kref+0xb9c:   	sll	%i3, %l7, %o3
	.word	0xacda6403	! t0_kref+0xba0:   	smulcc	%o1, 0x403, %l6
	.word	0xc900a03c	! t0_kref+0xba4:   	ld	[%g2 + 0x3c], %f4
	.word	0x9fc10000	! t0_kref+0xba8:   	call	%g4
	.word	0xd0200018	! t0_kref+0xbac:   	st	%o0, [%g0 + %i0]
	.word	0x95a008c6	! t0_kref+0xbb0:   	fsubd	%f0, %f6, %f10
	.word	0x81d927cb	! t0_kref+0xbb4:   	flush	%g4 + 0x7cb
	.word	0x36480001	! t0_kref+0xbb8:   	bge,a,pt	%icc, _kref+0xbbc
	.word	0x9ee3250e	! t0_kref+0xbbc:   	subccc	%o4, 0x50e, %o7
	.word	0xa3a3c83a	! t0_kref+0xbc0:   	fadds	%f15, %f26, %f17
	.word	0x8143c000	! t0_kref+0xbc4:   	stbar
	.word	0xe600a03c	! t0_kref+0xbc8:   	ld	[%g2 + 0x3c], %l3
	.word	0x9fa01a23	! t0_kref+0xbcc:   	fstoi	%f3, %f15
	.word	0xa6b2400b	! t0_kref+0xbd0:   	orncc	%o1, %o3, %l3
	.word	0x901275bd	! t0_kref+0xbd4:   	or	%o1, -0xa43, %o0
	.word	0x29800002	! t0_kref+0xbd8:   	fbl,a	_kref+0xbe0
	.word	0x920ec01c	! t0_kref+0xbdc:   	and	%i3, %i4, %o1
	.word	0xe408601c	! t0_kref+0xbe0:   	ldub	[%g1 + 0x1c], %l2
	.word	0xa41ca00c	! t0_kref+0xbe4:   	xor	%l2, 0xc, %l2
	.word	0xe428601c	! t0_kref+0xbe8:   	stb	%l2, [%g1 + 0x1c]
	.word	0x81d8601c	! t0_kref+0xbec:   	flush	%g1 + 0x1c
	.word	0x98b00000	! t0_kref+0xbf0:   	orncc	%g0, %g0, %o4
	.word	0xae7b2822	! t0_kref+0xbf4:   	sdiv	%o4, 0x822, %l7
	.word	0xaba60832	! t0_kref+0xbf8:   	fadds	%f24, %f18, %f21
	.word	0x9b400000	! t0_kref+0xbfc:   	mov	%y, %o5
2:	.word	0x87a28924	! t0_kref+0xc00:   	fmuls	%f10, %f4, %f3
	.word	0x9fc10000	! t0_kref+0xc04:   	call	%g4
	.word	0xd028a020	! t0_kref+0xc08:   	stb	%o0, [%g2 + 0x20]
	.word	0x27480001	! t0_kref+0xc0c:   	fbul,a,pt	%fcc0, _kref+0xc10
	.word	0x920a2513	! t0_kref+0xc10:   	and	%o0, 0x513, %o1
	.word	0x9e42000c	! t0_kref+0xc14:   	addc	%o0, %o4, %o7
	.word	0x9da018d6	! t0_kref+0xc18:   	fdtos	%f22, %f14
	.word	0xe84e8019	! t0_kref+0xc1c:   	ldsb	[%i2 + %i1], %l4
	.word	0x81a98a21	! t0_kref+0xc20:   	fcmps	%fcc0, %f6, %f1
	.word	0x99a00532	! t0_kref+0xc24:   	fsqrts	%f18, %f12
	.word	0xf19e5a5d	! t0_kref+0xc28:   	ldda	[%i1 + %i5]0xd2, %f24
	.word	0xd840a00c	! t0_kref+0xc2c:   	ldsw	[%g2 + 0xc], %o4
	.word	0xda6e001a	! t0_kref+0xc30:   	ldstub	[%i0 + %i2], %o5
	.word	0x81ad0a48	! t0_kref+0xc34:   	fcmpd	%fcc0, %f20, %f8
	.word	0xcd3e4000	! t0_kref+0xc38:   	std	%f6, [%i1]
	.word	0xda50a012	! t0_kref+0xc3c:   	ldsh	[%g2 + 0x12], %o5
	.word	0x9336c000	! t0_kref+0xc40:   	srl	%i3, %g0, %o1
	.word	0x9e05c008	! t0_kref+0xc44:   	add	%l7, %o0, %o7
	.word	0xd51fbd70	! t0_kref+0xc48:   	ldd	[%fp - 0x290], %f10
	.word	0xd03e2018	! t0_kref+0xc4c:   	std	%o0, [%i0 + 0x18]
	.word	0xe3b8a080	! t0_kref+0xc50:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x87802080	! t0_kref+0xc54:   	mov	0x80, %asi
	.word	0xe64e401a	! t0_kref+0xc58:   	ldsb	[%i1 + %i2], %l3
	.word	0x8ba1492f	! t0_kref+0xc5c:   	fmuls	%f5, %f15, %f5
	.word	0xa83a6845	! t0_kref+0xc60:   	xnor	%o1, 0x845, %l4
	.word	0x36800008	! t0_kref+0xc64:   	bge,a	_kref+0xc84
	.word	0xa67aa3ad	! t0_kref+0xc68:   	sdiv	%o2, 0x3ad, %l3
	.word	0x9ef68017	! t0_kref+0xc6c:   	udivcc	%i2, %l7, %o7
	.word	0xb3a58837	! t0_kref+0xc70:   	fadds	%f22, %f23, %f25
	.word	0x95a0053b	! t0_kref+0xc74:   	fsqrts	%f27, %f10
	.word	0x35800001	! t0_kref+0xc78:   	fbue,a	_kref+0xc7c
	.word	0xda28a00f	! t0_kref+0xc7c:   	stb	%o5, [%g2 + 0xf]
	.word	0x8da6c8b5	! t0_kref+0xc80:   	fsubs	%f27, %f21, %f6
	.word	0x9846c01b	! t0_kref+0xc84:   	addc	%i3, %i3, %o4
	.word	0xb1a089a1	! t0_kref+0xc88:   	fdivs	%f2, %f1, %f24
	.word	0x81a01a2c	! t0_kref+0xc8c:   	fstoi	%f12, %f0
	.word	0x91a01890	! t0_kref+0xc90:   	fitos	%f16, %f8
	.word	0x9a66c017	! t0_kref+0xc94:   	subc	%i3, %l7, %o5
	.word	0x89a00537	! t0_kref+0xc98:   	fsqrts	%f23, %f4
	.word	0xee28a018	! t0_kref+0xc9c:   	stb	%l7, [%g2 + 0x18]
	.word	0x9fc10000	! t0_kref+0xca0:   	call	%g4
	.word	0x9236b16d	! t0_kref+0xca4:   	orn	%i2, -0xe93, %o1
	.word	0x9fc10000	! t0_kref+0xca8:   	call	%g4
	.word	0x9236e042	! t0_kref+0xcac:   	orn	%i3, 0x42, %o1
	.word	0x32800001	! t0_kref+0xcb0:   	bne,a	_kref+0xcb4
	.word	0xf42e6001	! t0_kref+0xcb4:   	stb	%i2, [%i1 + 1]
	.word	0x192a3fcb	! t0_kref+0xcb8:   	sethi	%hi(0xa8ff2c00), %o4
	.word	0x99702427	! t0_kref+0xcbc:   	popc	0x427, %o4
	.word	0x86102011	! t0_kref+0xcc0:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0xcc4:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0xcc8:   	be,a	_kref+0xcf4
	.word	0xc9ee501b	! t0_kref+0xccc:   	prefetcha	%i1 + %i3, 4
	.word	0xda16c019	! t0_kref+0xcd0:   	lduh	[%i3 + %i1], %o5
	.word	0xa85ee46a	! t0_kref+0xcd4:   	smul	%i3, 0x46a, %l4
	.word	0x81ac8a58	! t0_kref+0xcd8:   	fcmpd	%fcc0, %f18, %f24
	.word	0xd02e601b	! t0_kref+0xcdc:   	stb	%o0, [%i1 + 0x1b]
	.word	0xa87f000b	! t0_kref+0xce0:   	sdiv	%i4, %o3, %l4
	.word	0x91a609ce	! t0_kref+0xce4:   	fdivd	%f24, %f14, %f8
	.word	0xaaa3401b	! t0_kref+0xce8:   	subcc	%o5, %i3, %l5
	.word	0xb1a000a2	! t0_kref+0xcec:   	fnegs	%f2, %f24
	.word	0xee566012	! t0_kref+0xcf0:   	ldsh	[%i1 + 0x12], %l7
	.word	0xc76e0017	! t0_kref+0xcf4:   	prefetch	%i0 + %l7, 3
	.word	0xe91e7fe8	! t0_kref+0xcf8:   	ldd	[%i1 - 0x18], %f20
	.word	0xf7ee101d	! t0_kref+0xcfc:   	prefetcha	%i0 + %i5, 27
	.word	0xd01e2010	! t0_kref+0xd00:   	ldd	[%i0 + 0x10], %o0
	.word	0xf7ee501a	! t0_kref+0xd04:   	prefetcha	%i1 + %i2, 27
	.word	0x83a0189b	! t0_kref+0xd08:   	fitos	%f27, %f1
	call	SYM(t0_subr0)
	.word	0xd8c8a01c	! t0_kref+0xd10:   	ldsba	[%g2 + 0x1c]%asi, %o4
	.word	0x33800002	! t0_kref+0xd14:   	fbe,a	_kref+0xd1c
	.word	0x9246effe	! t0_kref+0xd18:   	addc	%i3, 0xffe, %o1
	.word	0xb1a0492b	! t0_kref+0xd1c:   	fmuls	%f1, %f11, %f24
	.word	0x9e3a7fa4	! t0_kref+0xd20:   	xnor	%o1, -0x5c, %o7
	.word	0x93a00525	! t0_kref+0xd24:   	fsqrts	%f5, %f9
	.word	0xda20a034	! t0_kref+0xd28:   	st	%o5, [%g2 + 0x34]
	.word	0x81ad8abb	! t0_kref+0xd2c:   	fcmpes	%fcc0, %f22, %f27
	.word	0x9fc00004	! t0_kref+0xd30:   	call	%g0 + %g4
	.word	0x96d30017	! t0_kref+0xd34:   	umulcc	%o4, %l7, %o3
	.word	0x9426800b	! t0_kref+0xd38:   	sub	%i2, %o3, %o2
	.word	0x9412001c	! t0_kref+0xd3c:   	or	%o0, %i4, %o2
	.word	0xda16600a	! t0_kref+0xd40:   	lduh	[%i1 + 0xa], %o5
	.word	0x83a64927	! t0_kref+0xd44:   	fmuls	%f25, %f7, %f1
	.word	0xa7a2c831	! t0_kref+0xd48:   	fadds	%f11, %f17, %f19
	.word	0xad400000	! t0_kref+0xd4c:   	mov	%y, %l6
	.word	0x9ba01887	! t0_kref+0xd50:   	fitos	%f7, %f13
	.word	0xe8866004	! t0_kref+0xd54:   	lda	[%i1 + 4]%asi, %l4
	.word	0xd09e1000	! t0_kref+0xd58:   	ldda	[%i0]0x80, %o0
	.word	0x8da000a2	! t0_kref+0xd5c:   	fnegs	%f2, %f6
	.word	0xea86601c	! t0_kref+0xd60:   	lda	[%i1 + 0x1c]%asi, %l5
	.word	0x9da18944	! t0_kref+0xd64:   	fmuld	%f6, %f4, %f14
	.word	0x905b000d	! t0_kref+0xd68:   	smul	%o4, %o5, %o0
	.word	0xa88a8009	! t0_kref+0xd6c:   	andcc	%o2, %o1, %l4
	.word	0xda80a000	! t0_kref+0xd70:   	lda	[%g2]%asi, %o5
	.word	0xe4180019	! t0_kref+0xd74:   	ldd	[%g0 + %i1], %l2
	.word	0xd8d0a03a	! t0_kref+0xd78:   	ldsha	[%g2 + 0x3a]%asi, %o4
	.word	0x81ad0a48	! t0_kref+0xd7c:   	fcmpd	%fcc0, %f20, %f8
	.word	0x87a68938	! t0_kref+0xd80:   	fmuls	%f26, %f24, %f3
	.word	0x87a2c833	! t0_kref+0xd84:   	fadds	%f11, %f19, %f3
	.word	0xf5ee101a	! t0_kref+0xd88:   	prefetcha	%i0 + %i2, 26
	.word	0x8ba40823	! t0_kref+0xd8c:   	fadds	%f16, %f3, %f5
	.word	0xa696c008	! t0_kref+0xd90:   	orcc	%i3, %o0, %l3
	.word	0xb1a01920	! t0_kref+0xd94:   	fstod	%f0, %f24
	.word	0x93a089a9	! t0_kref+0xd98:   	fdivs	%f2, %f9, %f9
	.word	0xaf400000	! t0_kref+0xd9c:   	mov	%y, %l7
	.word	0x35480001	! t0_kref+0xda0:   	fbue,a,pt	%fcc0, _kref+0xda4
	.word	0xb5a0189b	! t0_kref+0xda4:   	fitos	%f27, %f26
	.word	0xead0a004	! t0_kref+0xda8:   	ldsha	[%g2 + 4]%asi, %l5
	.word	0xeb68a005	! t0_kref+0xdac:   	prefetch	%g2 + 5, 21
	.word	0x38800001	! t0_kref+0xdb0:   	bgu,a	_kref+0xdb4
	.word	0x933a6001	! t0_kref+0xdb4:   	sra	%o1, 0x1, %o1
	.word	0x8143c000	! t0_kref+0xdb8:   	stbar
	.word	0xd2a0a01c	! t0_kref+0xdbc:   	sta	%o1, [%g2 + 0x1c]%asi
	.word	0x90b2ee1c	! t0_kref+0xdc0:   	orncc	%o3, 0xe1c, %o0
	.word	0x20800007	! t0_kref+0xdc4:   	bn,a	_kref+0xde0
	.word	0xd8c0a020	! t0_kref+0xdc8:   	ldswa	[%g2 + 0x20]%asi, %o4
	.word	0x37800003	! t0_kref+0xdcc:   	fbge,a	_kref+0xdd8
	.word	0xed3e0000	! t0_kref+0xdd0:   	std	%f22, [%i0]
	.word	0x8586c00d	! t0_kref+0xdd4:   	wr	%i3, %o5, %ccr
	.word	0x81a88abb	! t0_kref+0xdd8:   	fcmpes	%fcc0, %f2, %f27
	.word	0x9226801a	! t0_kref+0xddc:   	sub	%i2, %i2, %o1
	.word	0xaca2801b	! t0_kref+0xde0:   	subcc	%o2, %i3, %l6
	.word	0x9a18251d	! t0_kref+0xde4:   	xor	%g0, 0x51d, %o5
	.word	0x9fa018c2	! t0_kref+0xde8:   	fdtos	%f2, %f15
	.word	0x29800004	! t0_kref+0xdec:   	fbl,a	_kref+0xdfc
	.word	0x9eb23a19	! t0_kref+0xdf0:   	orncc	%o0, -0x5e7, %o7
	.word	0xa5a0084c	! t0_kref+0xdf4:   	faddd	%f0, %f12, %f18
	.word	0x90932229	! t0_kref+0xdf8:   	orcc	%o4, 0x229, %o0
	.word	0x86102004	! t0_kref+0xdfc:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0xe00:   	bne,a	_kref+0xe00
	.word	0x86a0e001	! t0_kref+0xe04:   	subcc	%g3, 1, %g3
	.word	0xff6e3fe8	! t0_kref+0xe08:   	prefetch	%i0 - 0x18, 31
	.word	0x98437e9a	! t0_kref+0xe0c:   	addc	%o5, -0x166, %o4
	.word	0x9fc10000	! t0_kref+0xe10:   	call	%g4
	.word	0xa5a01884	! t0_kref+0xe14:   	fitos	%f4, %f18
	.word	0x86102002	! t0_kref+0xe18:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xe1c:   	bne,a	_kref+0xe1c
	.word	0x86a0e001	! t0_kref+0xe20:   	subcc	%g3, 1, %g3
	.word	0xd8e8a030	! t0_kref+0xe24:   	ldstuba	[%g2 + 0x30]%asi, %o4
	.word	0x961a800c	! t0_kref+0xe28:   	xor	%o2, %o4, %o3
	.word	0xaf400000	! t0_kref+0xe2c:   	mov	%y, %l7
	.word	0x99a00123	! t0_kref+0xe30:   	fabss	%f3, %f12
	.word	0xe8180019	! t0_kref+0xe34:   	ldd	[%g0 + %i1], %l4
	.word	0x81ab0a58	! t0_kref+0xe38:   	fcmpd	%fcc0, %f12, %f24
	.word	0xeb6e6000	! t0_kref+0xe3c:   	prefetch	%i1, 21
	.word	0x24800008	! t0_kref+0xe40:   	ble,a	_kref+0xe60
	.word	0xefee501a	! t0_kref+0xe44:   	prefetcha	%i1 + %i2, 23
	.word	0x83a000a0	! t0_kref+0xe48:   	fnegs	%f0, %f1
	.word	0xb1a00534	! t0_kref+0xe4c:   	fsqrts	%f20, %f24
	.word	0x97a0013a	! t0_kref+0xe50:   	fabss	%f26, %f11
	.word	0x97700017	! t0_kref+0xe54:   	popc	%l7, %o3
	.word	0xd020a028	! t0_kref+0xe58:   	st	%o0, [%g2 + 0x28]
	.word	0xb7a048a7	! t0_kref+0xe5c:   	fsubs	%f1, %f7, %f27
	.word	0xd0fe7ff4	! t0_kref+0xe60:   	swapa	[%i1 - 0xc]%asi, %o0
	.word	0x35800008	! t0_kref+0xe64:   	fbue,a	_kref+0xe84
	.word	0x17327e2e	! t0_kref+0xe68:   	sethi	%hi(0xc9f8b800), %o3
	.word	0x949ea9d3	! t0_kref+0xe6c:   	xorcc	%i2, 0x9d3, %o2
	.word	0xc53e7ff8	! t0_kref+0xe70:   	std	%f2, [%i1 - 8]
	.word	0xf42e7fe9	! t0_kref+0xe74:   	stb	%i2, [%i1 - 0x17]
	.word	0x963b2529	! t0_kref+0xe78:   	xnor	%o4, 0x529, %o3
	.word	0x96fa2082	! t0_kref+0xe7c:   	sdivcc	%o0, 0x82, %o3
	.word	0x8fa609b5	! t0_kref+0xe80:   	fdivs	%f24, %f21, %f7
	.word	0x9ec24008	! t0_kref+0xe84:   	addccc	%o1, %o0, %o7
	.word	0xf8280019	! t0_kref+0xe88:   	stb	%i4, [%g0 + %i1]
	.word	0xac16c01b	! t0_kref+0xe8c:   	or	%i3, %i3, %l6
	sethi	%hi(2f), %o7
	.word	0xe40be2cc	! t0_kref+0xe94:   	ldub	[%o7 + 0x2cc], %l2
	.word	0xa41ca00c	! t0_kref+0xe98:   	xor	%l2, 0xc, %l2
	.word	0xe42be2cc	! t0_kref+0xe9c:   	stb	%l2, [%o7 + 0x2cc]
	.word	0x81dbe2cc	! t0_kref+0xea0:   	flush	%o7 + 0x2cc
	.word	0x901b001a	! t0_kref+0xea4:   	xor	%o4, %i2, %o0
	.word	0xc9ee1000	! t0_kref+0xea8:   	prefetcha	%i0, 4
	.word	0xa1a00131	! t0_kref+0xeac:   	fabss	%f17, %f16
	.word	0x9da018d6	! t0_kref+0xeb0:   	fdtos	%f22, %f14
	.word	0xfbee101c	! t0_kref+0xeb4:   	prefetcha	%i0 + %i4, 29
	.word	0xa816c00b	! t0_kref+0xeb8:   	or	%i3, %o3, %l4
	.word	0x81a20921	! t0_kref+0xebc:   	fmuls	%f8, %f1, %f0
	.word	0x87a01887	! t0_kref+0xec0:   	fitos	%f7, %f3
	.word	0xd51fbf48	! t0_kref+0xec4:   	ldd	[%fp - 0xb8], %f10
	.word	0xd216c018	! t0_kref+0xec8:   	lduh	[%i3 + %i0], %o1
2:	.word	0xada01893	! t0_kref+0xecc:   	fitos	%f19, %f22
	.word	0xd11e6010	! t0_kref+0xed0:   	ldd	[%i1 + 0x10], %f8
	.word	0x85a01a2d	! t0_kref+0xed4:   	fstoi	%f13, %f2
	.word	0xf207bfe0	! t0_kref+0xed8:   	ld	[%fp - 0x20], %i1
	.word	0xaf674000	! t0_kref+0xedc:   	movcc	%icc, %g0, %l7
	.word	0xac40359c	! t0_kref+0xee0:   	addc	%g0, -0xa64, %l6
	.word	0xec3e001d	! t0_kref+0xee4:   	std	%l6, [%i0 + %i5]
	.word	0xc9200019	! t0_kref+0xee8:   	st	%f4, [%g0 + %i1]
	.word	0xc0a8a01e	! t0_kref+0xeec:   	stba	%g0, [%g2 + 0x1e]%asi
	.word	0x967f000c	! t0_kref+0xef0:   	sdiv	%i4, %o4, %o3
	.word	0xd028a010	! t0_kref+0xef4:   	stb	%o0, [%g2 + 0x10]
	.word	0x90127d86	! t0_kref+0xef8:   	or	%o1, -0x27a, %o0
	.word	0xe91f4019	! t0_kref+0xefc:   	ldd	[%i5 + %i1], %f20
	.word	0x98d33f71	! t0_kref+0xf00:   	umulcc	%o4, -0x8f, %o4
	.word	0xe9ee501a	! t0_kref+0xf04:   	prefetcha	%i1 + %i2, 20
	.word	0xada489a4	! t0_kref+0xf08:   	fdivs	%f18, %f4, %f22
	.word	0x949b4009	! t0_kref+0xf0c:   	xorcc	%o5, %o1, %o2
	.word	0xec3e3fe0	! t0_kref+0xf10:   	std	%l6, [%i0 - 0x20]
	.word	0x89a018c2	! t0_kref+0xf14:   	fdtos	%f2, %f4
	.word	0xe4086374	! t0_kref+0xf18:   	ldub	[%g1 + 0x374], %l2
	.word	0xa41ca00c	! t0_kref+0xf1c:   	xor	%l2, 0xc, %l2
	.word	0xe4286374	! t0_kref+0xf20:   	stb	%l2, [%g1 + 0x374]
	.word	0x81d86374	! t0_kref+0xf24:   	flush	%g1 + 0x374
	.word	0x903eabf7	! t0_kref+0xf28:   	xnor	%i2, 0xbf7, %o0
	.word	0x921df163	! t0_kref+0xf2c:   	xor	%l7, -0xe9d, %o1
	.word	0x85a01a21	! t0_kref+0xf30:   	fstoi	%f1, %f2
	.word	0x8fa4c921	! t0_kref+0xf34:   	fmuls	%f19, %f1, %f7
	.word	0x9635c000	! t0_kref+0xf38:   	orn	%l7, %g0, %o3
	.word	0xf59e3fe8	! t0_kref+0xf3c:   	ldda	[%i0 - 0x18]%asi, %f26
	.word	0xa7a00034	! t0_kref+0xf40:   	fmovs	%f20, %f19
	.word	0xec9e101d	! t0_kref+0xf44:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0x9055efc4	! t0_kref+0xf48:   	umul	%l7, 0xfc4, %o0
	.word	0x948b634f	! t0_kref+0xf4c:   	andcc	%o5, 0x34f, %o2
	.word	0x29480002	! t0_kref+0xf50:   	fbl,a,pt	%fcc0, _kref+0xf58
	.word	0xa8c2801c	! t0_kref+0xf54:   	addccc	%o2, %i4, %l4
2:	.word	0xaec6c000	! t0_kref+0xf58:   	addccc	%i3, %g0, %l7
	.word	0xc11fbe10	! t0_kref+0xf5c:   	ldd	[%fp - 0x1f0], %f0
	.word	0x86102006	! t0_kref+0xf60:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0xf64:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t0_kref+0xf68:   	be,a	_kref+0xfac
	.word	0xea801019	! t0_kref+0xf6c:   	lda	[%g0 + %i1]0x80, %l5
	.word	0xaa1ebbff	! t0_kref+0xf70:   	xor	%i2, -0x401, %l5
	.word	0x945b4008	! t0_kref+0xf74:   	smul	%o5, %o0, %o2
	.word	0x9a803ed8	! t0_kref+0xf78:   	addcc	%g0, -0x128, %o5
	.word	0xba103fe0	! t0_kref+0xf7c:   	mov	0xffffffe0, %i5
	.word	0xa3a349a3	! t0_kref+0xf80:   	fdivs	%f13, %f3, %f17
	.word	0xe7ee501c	! t0_kref+0xf84:   	prefetcha	%i1 + %i4, 19
	.word	0x99400000	! t0_kref+0xf88:   	mov	%y, %o4
	.word	0x9fc00004	! t0_kref+0xf8c:   	call	%g0 + %g4
	.word	0xac05fc8f	! t0_kref+0xf90:   	add	%l7, -0x371, %l6
	.word	0xb5a18852	! t0_kref+0xf94:   	faddd	%f6, %f18, %f26
	.word	0x90fb400d	! t0_kref+0xf98:   	sdivcc	%o5, %o5, %o0
	.word	0x98e36755	! t0_kref+0xf9c:   	subccc	%o5, 0x755, %o4
	.word	0xac530000	! t0_kref+0xfa0:   	umul	%o4, %g0, %l6
	.word	0x23bffff0	! t0_kref+0xfa4:   	fbne,a	_kref+0xf64
	.word	0xe700a028	! t0_kref+0xfa8:   	ld	[%g2 + 0x28], %f19
	.word	0x30800004	! t0_kref+0xfac:   	ba,a	_kref+0xfbc
	.word	0x9aa80009	! t0_kref+0xfb0:   	andncc	%g0, %o1, %o5
	.word	0x81a00026	! t0_kref+0xfb4:   	fmovs	%f6, %f0
	.word	0x9b1735e0	! t0_kref+0xfb8:   	taddcctv	%i4, -0xa20, %o5
	.word	0x81ad8a56	! t0_kref+0xfbc:   	fcmpd	%fcc0, %f22, %f22
	.word	0xc700a000	! t0_kref+0xfc0:   	ld	[%g2], %f3
	.word	0x85a2094e	! t0_kref+0xfc4:   	fmuld	%f8, %f14, %f2
	.word	0x92b2213c	! t0_kref+0xfc8:   	orncc	%o0, 0x13c, %o1
	.word	0xd99f5a58	! t0_kref+0xfcc:   	ldda	[%i5 + %i0]0xd2, %f12
	.word	0xae1b2e29	! t0_kref+0xfd0:   	xor	%o4, 0xe29, %l7
	.word	0x22800005	! t0_kref+0xfd4:   	be,a	_kref+0xfe8
	.word	0x98d8000a	! t0_kref+0xfd8:   	smulcc	%g0, %o2, %o4
	.word	0xd8d0a02a	! t0_kref+0xfdc:   	ldsha	[%g2 + 0x2a]%asi, %o4
	.word	0x81ae8a56	! t0_kref+0xfe0:   	fcmpd	%fcc0, %f26, %f22
	.word	0xd0262014	! t0_kref+0xfe4:   	st	%o0, [%i0 + 0x14]
	.word	0xe36e401a	! t0_kref+0xfe8:   	prefetch	%i1 + %i2, 17
	.word	0xaa02401c	! t0_kref+0xfec:   	add	%o1, %i4, %l5
	.word	0x86102002	! t0_kref+0xff0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xff4:   	bne,a	_kref+0xff4
	.word	0x86a0e001	! t0_kref+0xff8:   	subcc	%g3, 1, %g3
	.word	0x943b2066	! t0_kref+0xffc:   	xnor	%o4, 0x66, %o2
	.word	0xdfa0a03c	! t0_kref+0x1000:   	sta	%f15, [%g2 + 0x3c]%asi
	.word	0xd01e401d	! t0_kref+0x1004:   	ldd	[%i1 + %i5], %o0
	.word	0x93a00033	! t0_kref+0x1008:   	fmovs	%f19, %f9
	.word	0x87a3492c	! t0_kref+0x100c:   	fmuls	%f13, %f12, %f3
	.word	0xb5a00039	! t0_kref+0x1010:   	fmovs	%f25, %f26
	.word	0x2d480008	! t0_kref+0x1014:   	fbg,a,pt	%fcc0, _kref+0x1034
	.word	0x8143c000	! t0_kref+0x1018:   	stbar
	call	SYM(t0_subr3)
	.word	0xac66c01b	! t0_kref+0x1020:   	subc	%i3, %i3, %l6
	.word	0xc368a004	! t0_kref+0x1024:   	prefetch	%g2 + 4, 1
	.word	0x81aa8a48	! t0_kref+0x1028:   	fcmpd	%fcc0, %f10, %f8
	.word	0x9e82e52e	! t0_kref+0x102c:   	addcc	%o3, 0x52e, %o7
	.word	0x2b800005	! t0_kref+0x1030:   	fbug,a	_kref+0x1044
	.word	0x9fa01a2e	! t0_kref+0x1034:   	fstoi	%f14, %f15
	.word	0xa9a58d35	! t0_kref+0x1038:   	fsmuld	%f22, %f21, %f20
	.word	0x83a148a1	! t0_kref+0x103c:   	fsubs	%f5, %f1, %f1
	.word	0x97a00524	! t0_kref+0x1040:   	fsqrts	%f4, %f11
	.word	0x966728af	! t0_kref+0x1044:   	subc	%i4, 0x8af, %o3
	.word	0x9adf000d	! t0_kref+0x1048:   	smulcc	%i4, %o5, %o5
	.word	0xe5264000	! t0_kref+0x104c:   	st	%f18, [%i1]
	.word	0xda16c018	! t0_kref+0x1050:   	lduh	[%i3 + %i0], %o5
	.word	0x940ea908	! t0_kref+0x1054:   	and	%i2, 0x908, %o2
	.word	0x9fa000ab	! t0_kref+0x1058:   	fnegs	%f11, %f15
	.word	0x99a04d37	! t0_kref+0x105c:   	fsmuld	%f1, %f23, %f12
	.word	0xaec6ba1c	! t0_kref+0x1060:   	addccc	%i2, -0x5e4, %l7
	.word	0xec302446	! t0_kref+0x1064:   	sth	%l6, [%g0 + 0x446]
	.word	0x8fa000b2	! t0_kref+0x1068:   	fnegs	%f18, %f7
	.word	0x9e5f001b	! t0_kref+0x106c:   	smul	%i4, %i3, %o7
	.word	0x8143e056	! t0_kref+0x1070:   	membar	0x56
	.word	0xae0721cc	! t0_kref+0x1074:   	add	%i4, 0x1cc, %l7
	.word	0xae43620d	! t0_kref+0x1078:   	addc	%o5, 0x20d, %l7
	.word	0xaeda001a	! t0_kref+0x107c:   	smulcc	%o0, %i2, %l7
	.word	0x9da44825	! t0_kref+0x1080:   	fadds	%f17, %f5, %f14
	.word	0x2a800001	! t0_kref+0x1084:   	bcs,a	_kref+0x1088
	.word	0xb5a588c8	! t0_kref+0x1088:   	fsubd	%f22, %f8, %f26
	.word	0x8583772c	! t0_kref+0x108c:   	wr	%o5, 0xfffff72c, %ccr
	.word	0xd87e2010	! t0_kref+0x1090:   	swap	[%i0 + 0x10], %o4
	.word	0x81ae8a54	! t0_kref+0x1094:   	fcmpd	%fcc0, %f26, %f20
	.word	0x24800004	! t0_kref+0x1098:   	ble,a	_kref+0x10a8
	.word	0xd216c019	! t0_kref+0x109c:   	lduh	[%i3 + %i1], %o1
	.word	0x2b480004	! t0_kref+0x10a0:   	fbug,a,pt	%fcc0, _kref+0x10b0
	.word	0xe808a014	! t0_kref+0x10a4:   	ldub	[%g2 + 0x14], %l4
	.word	0xa80ae47c	! t0_kref+0x10a8:   	and	%o3, 0x47c, %l4
	.word	0x91a2c8ba	! t0_kref+0x10ac:   	fsubs	%f11, %f26, %f8
	.word	0x3f800006	! t0_kref+0x10b0:   	fbo,a	_kref+0x10c8
	.word	0x81df401c	! t0_kref+0x10b4:   	flush	%i5 + %i4
	.word	0x9046fc39	! t0_kref+0x10b8:   	addc	%i3, -0x3c7, %o0
	.word	0x8fa048a8	! t0_kref+0x10bc:   	fsubs	%f1, %f8, %f7
	.word	0xaba00532	! t0_kref+0x10c0:   	fsqrts	%f18, %f21
	.word	0x23480007	! t0_kref+0x10c4:   	fbne,a,pt	%fcc0, _kref+0x10e0
	.word	0x9a80000d	! t0_kref+0x10c8:   	addcc	%g0, %o5, %o5
	.word	0xa88df291	! t0_kref+0x10cc:   	andcc	%l7, -0xd6f, %l4
	.word	0xda2e0000	! t0_kref+0x10d0:   	stb	%o5, [%i0]
	.word	0xa812b647	! t0_kref+0x10d4:   	or	%o2, -0x9b9, %l4
	.word	0xaa25f148	! t0_kref+0x10d8:   	sub	%l7, -0xeb8, %l5
	.word	0x9fc00004	! t0_kref+0x10dc:   	call	%g0 + %g4
	.word	0xf3a0a000	! t0_kref+0x10e0:   	sta	%f25, [%g2]%asi
	.word	0xf51fbef8	! t0_kref+0x10e4:   	ldd	[%fp - 0x108], %f26
	.word	0xb5a00531	! t0_kref+0x10e8:   	fsqrts	%f17, %f26
	.word	0x94ae8008	! t0_kref+0x10ec:   	andncc	%i2, %o0, %o2
	.word	0x2d480005	! t0_kref+0x10f0:   	fbg,a,pt	%fcc0, _kref+0x1104
	.word	0x81dde6b3	! t0_kref+0x10f4:   	flush	%l7 + 0x6b3
	.word	0x96c6b291	! t0_kref+0x10f8:   	addccc	%i2, -0xd6f, %o3
	.word	0x9e183756	! t0_kref+0x10fc:   	xor	%g0, -0x8aa, %o7
	.word	0xa5a01894	! t0_kref+0x1100:   	fitos	%f20, %f18
	.word	0x28480005	! t0_kref+0x1104:   	bleu,a,pt	%icc, _kref+0x1118
	.word	0xa802000d	! t0_kref+0x1108:   	add	%o0, %o5, %l4
	.word	0x89a00032	! t0_kref+0x110c:   	fmovs	%f18, %f4
	.word	0x90aa400c	! t0_kref+0x1110:   	andncc	%o1, %o4, %o0
	.word	0xed80a00c	! t0_kref+0x1114:   	lda	[%g2 + 0xc]%asi, %f22
	.word	0x85a01a2f	! t0_kref+0x1118:   	fstoi	%f15, %f2
	.word	0x9800000c	! t0_kref+0x111c:   	add	%g0, %o4, %o4
	.word	0x290d891a	! t0_kref+0x1120:   	sethi	%hi(0x36246800), %l4
	.word	0x96a32c82	! t0_kref+0x1124:   	subcc	%o4, 0xc82, %o3
	.word	0x87a01a29	! t0_kref+0x1128:   	fstoi	%f9, %f3
	.word	0xd830a02c	! t0_kref+0x112c:   	sth	%o4, [%g2 + 0x2c]
	.word	0x3d800008	! t0_kref+0x1130:   	fbule,a	_kref+0x1150
	.word	0x9e3222a7	! t0_kref+0x1134:   	orn	%o0, 0x2a7, %o7
	.word	0xaa46b9d9	! t0_kref+0x1138:   	addc	%i2, -0x627, %l5
	.word	0xda4e7fe9	! t0_kref+0x113c:   	ldsb	[%i1 - 0x17], %o5
	.word	0x22800004	! t0_kref+0x1140:   	be,a	_kref+0x1150
	.word	0x908a000b	! t0_kref+0x1144:   	andcc	%o0, %o3, %o0
	.word	0xc126600c	! t0_kref+0x1148:   	st	%f0, [%i1 + 0xc]
	.word	0xb7a508b1	! t0_kref+0x114c:   	fsubs	%f20, %f17, %f27
	call	SYM(t0_subr1)
	.word	0xedee101c	! t0_kref+0x1154:   	prefetcha	%i0 + %i4, 22
	.word	0x94df001c	! t0_kref+0x1158:   	smulcc	%i4, %i4, %o2
	.word	0x9e12800a	! t0_kref+0x115c:   	or	%o2, %o2, %o7
	.word	0xc36e2008	! t0_kref+0x1160:   	prefetch	%i0 + 8, 1
	.word	0x9f2dc01a	! t0_kref+0x1164:   	sll	%l7, %i2, %o7
	.word	0x8da3895a	! t0_kref+0x1168:   	fmuld	%f14, %f26, %f6
	.word	0x9a0a801b	! t0_kref+0x116c:   	and	%o2, %i3, %o5
	.word	0x96526472	! t0_kref+0x1170:   	umul	%o1, 0x472, %o3
	.word	0x968b7743	! t0_kref+0x1174:   	andcc	%o5, -0x8bd, %o3
	.word	0x27480002	! t0_kref+0x1178:   	fbul,a,pt	%fcc0, _kref+0x1180
	.word	0x96126085	! t0_kref+0x117c:   	or	%o1, 0x85, %o3
	.word	0xa3a01098	! t0_kref+0x1180:   	fxtos	%f24, %f17
	.word	0x37480005	! t0_kref+0x1184:   	fbge,a,pt	%fcc0, _kref+0x1198
	.word	0x96c2401c	! t0_kref+0x1188:   	addccc	%o1, %i4, %o3
	.word	0xac32c009	! t0_kref+0x118c:   	orn	%o3, %o1, %l6
	.word	0xa5a01048	! t0_kref+0x1190:   	fdtox	%f8, %f18
	.word	0x2931db91	! t0_kref+0x1194:   	sethi	%hi(0xc76e4400), %l4
	.word	0x8143e040	! t0_kref+0x1198:   	membar	0x40
	.word	0x928a8009	! t0_kref+0x119c:   	andcc	%o2, %o1, %o1
	.word	0x9da01891	! t0_kref+0x11a0:   	fitos	%f17, %f14
	.word	0x901a4000	! t0_kref+0x11a4:   	xor	%o1, %g0, %o0
	.word	0x96b6c008	! t0_kref+0x11a8:   	orncc	%i3, %o0, %o3
	.word	0xa7400000	! t0_kref+0x11ac:   	mov	%y, %l3
	.word	0xc920a000	! t0_kref+0x11b0:   	st	%f4, [%g2]
	.word	0xb7a000a8	! t0_kref+0x11b4:   	fnegs	%f8, %f27
	.word	0x921a390c	! t0_kref+0x11b8:   	xor	%o0, -0x6f4, %o1
	.word	0xcfa0a00c	! t0_kref+0x11bc:   	sta	%f7, [%g2 + 0xc]%asi
	.word	0x9698001b	! t0_kref+0x11c0:   	xorcc	%g0, %i3, %o3
	.word	0xaa42c01c	! t0_kref+0x11c4:   	addc	%o3, %i4, %l5
	.word	0xde86200c	! t0_kref+0x11c8:   	lda	[%i0 + 0xc]%asi, %o7
	.word	0xaa8b400a	! t0_kref+0x11cc:   	andcc	%o5, %o2, %l5
	.word	0xadaa4042	! t0_kref+0x11d0:   	fmovde	%fcc0, %f2, %f22
	.word	0x8143c000	! t0_kref+0x11d4:   	stbar
	.word	0xa89a8017	! t0_kref+0x11d8:   	xorcc	%o2, %l7, %l4
	sethi	%hi(2f), %o7
	.word	0xe40be1f8	! t0_kref+0x11e0:   	ldub	[%o7 + 0x1f8], %l2
	.word	0xa41ca00c	! t0_kref+0x11e4:   	xor	%l2, 0xc, %l2
	.word	0xe42be1f8	! t0_kref+0x11e8:   	stb	%l2, [%o7 + 0x1f8]
	.word	0x81dbe1f8	! t0_kref+0x11ec:   	flush	%o7 + 0x1f8
	.word	0xa843000b	! t0_kref+0x11f0:   	addc	%o4, %o3, %l4
	call	SYM(t0_subr1)
2:	.word	0x9e8a801c	! t0_kref+0x11f8:   	andcc	%o2, %i4, %o7
	.word	0x9e003c95	! t0_kref+0x11fc:   	add	%g0, -0x36b, %o7
	.word	0xaac6fe9a	! t0_kref+0x1200:   	addccc	%i3, -0x166, %l5
	.word	0xa1a00535	! t0_kref+0x1204:   	fsqrts	%f21, %f16
	.word	0xeed0a008	! t0_kref+0x1208:   	ldsha	[%g2 + 8]%asi, %l7
	.word	0xacd28008	! t0_kref+0x120c:   	umulcc	%o2, %o0, %l6
	.word	0xc11e6008	! t0_kref+0x1210:   	ldd	[%i1 + 8], %f0
	.word	0xa7a18932	! t0_kref+0x1214:   	fmuls	%f6, %f18, %f19
	.word	0x9af2f9a2	! t0_kref+0x1218:   	udivcc	%o3, -0x65e, %o5
	.word	0x9da08842	! t0_kref+0x121c:   	faddd	%f2, %f2, %f14
	.word	0x923e8000	! t0_kref+0x1220:   	not	%i2, %o1
	.word	0xcfa61000	! t0_kref+0x1224:   	sta	%f7, [%i0]0x80
	.word	0xa6a24008	! t0_kref+0x1228:   	subcc	%o1, %o0, %l3
	.word	0x2e800005	! t0_kref+0x122c:   	bvs,a	_kref+0x1240
	.word	0x9a52f509	! t0_kref+0x1230:   	umul	%o3, -0xaf7, %o5
	.word	0xa818389a	! t0_kref+0x1234:   	xor	%g0, -0x766, %l4
	.word	0x968034d3	! t0_kref+0x1238:   	addcc	%g0, -0xb2d, %o3
	.word	0x945a672b	! t0_kref+0x123c:   	smul	%o1, 0x72b, %o2
	.word	0x81da400b	! t0_kref+0x1240:   	flush	%o1 + %o3
	.word	0xa93b001c	! t0_kref+0x1244:   	sra	%o4, %i4, %l4
	.word	0xa6b26dcf	! t0_kref+0x1248:   	orncc	%o1, 0xdcf, %l3
	.word	0xa1a00025	! t0_kref+0x124c:   	fmovs	%f5, %f16
	.word	0x929a8017	! t0_kref+0x1250:   	xorcc	%o2, %l7, %o1
	.word	0xaf336004	! t0_kref+0x1254:   	srl	%o5, 0x4, %l7
	.word	0x95a34927	! t0_kref+0x1258:   	fmuls	%f13, %f7, %f10
	.word	0x92c373a0	! t0_kref+0x125c:   	addccc	%o5, -0xc60, %o1
	.word	0xd600a034	! t0_kref+0x1260:   	ld	[%g2 + 0x34], %o3
	.word	0xd208a01e	! t0_kref+0x1264:   	ldub	[%g2 + 0x1e], %o1
	.word	0xd64e3fe8	! t0_kref+0x1268:   	ldsb	[%i0 - 0x18], %o3
	.word	0x2b480005	! t0_kref+0x126c:   	fbug,a,pt	%fcc0, _kref+0x1280
	.word	0xee163ff4	! t0_kref+0x1270:   	lduh	[%i0 - 0xc], %l7
	.word	0xd4380019	! t0_kref+0x1274:   	std	%o2, [%g0 + %i1]
	.word	0x9252c00d	! t0_kref+0x1278:   	umul	%o3, %o5, %o1
	.word	0x9825c01b	! t0_kref+0x127c:   	sub	%l7, %i3, %o4
	.word	0xa6b24017	! t0_kref+0x1280:   	orncc	%o1, %l7, %l3
	.word	0xf4a0a004	! t0_kref+0x1284:   	sta	%i2, [%g2 + 4]%asi
	.word	0x98f2c000	! t0_kref+0x1288:   	udivcc	%o3, %g0, %o4
	.word	0x9fc00004	! t0_kref+0x128c:   	call	%g0 + %g4
	.word	0x85a588cc	! t0_kref+0x1290:   	fsubd	%f22, %f12, %f2
	.word	0x2e800002	! t0_kref+0x1294:   	bvs,a	_kref+0x129c
	.word	0x945ee0ee	! t0_kref+0x1298:   	smul	%i3, 0xee, %o2
	.word	0xab400000	! t0_kref+0x129c:   	mov	%y, %l5
	.word	0x9a40000b	! t0_kref+0x12a0:   	addc	%g0, %o3, %o5
	.word	0xdac8a034	! t0_kref+0x12a4:   	ldsba	[%g2 + 0x34]%asi, %o5
	.word	0xd43e2010	! t0_kref+0x12a8:   	std	%o2, [%i0 + 0x10]
	.word	0xc99e5a1a	! t0_kref+0x12ac:   	ldda	[%i1 + %i2]0xd0, %f4
	.word	0xc1e8a009	! t0_kref+0x12b0:   	prefetcha	%g2 + 9, 0
	.word	0x9fc00004	! t0_kref+0x12b4:   	call	%g0 + %g4
	.word	0xa88af709	! t0_kref+0x12b8:   	andcc	%o3, -0x8f7, %l4
	.word	0x94defc70	! t0_kref+0x12bc:   	smulcc	%i3, -0x390, %o2
	.word	0x91a58956	! t0_kref+0x12c0:   	fmuld	%f22, %f22, %f8
	.word	0xae13400b	! t0_kref+0x12c4:   	or	%o5, %o3, %l7
	.word	0xa3a01887	! t0_kref+0x12c8:   	fitos	%f7, %f17
	.word	0xee7e7ff0	! t0_kref+0x12cc:   	swap	[%i1 - 0x10], %l7
	.word	0x91a01880	! t0_kref+0x12d0:   	fitos	%f0, %f8
	.word	0x96b33d6a	! t0_kref+0x12d4:   	orncc	%o4, -0x296, %o3
	.word	0xcd1f4019	! t0_kref+0x12d8:   	ldd	[%i5 + %i1], %f6
	.word	0x9da188d6	! t0_kref+0x12dc:   	fsubd	%f6, %f22, %f14
	.word	0x9fc10000	! t0_kref+0x12e0:   	call	%g4
	.word	0x8ba4c920	! t0_kref+0x12e4:   	fmuls	%f19, %f0, %f5
	.word	0x87a00038	! t0_kref+0x12e8:   	fmovs	%f24, %f3
	.word	0xee20a014	! t0_kref+0x12ec:   	st	%l7, [%g2 + 0x14]
	.word	0xe07e001c	! t0_kref+0x12f0:   	swap	[%i0 + %i4], %l0
	.word	0xc0264000	! t0_kref+0x12f4:   	clr	[%i1]
	.word	0x23800007	! t0_kref+0x12f8:   	fbne,a	_kref+0x1314
	.word	0xf428a011	! t0_kref+0x12fc:   	stb	%i2, [%g2 + 0x11]
	.word	0x9242ec46	! t0_kref+0x1300:   	addc	%o3, 0xc46, %o1
	.word	0xaa883c5c	! t0_kref+0x1304:   	andcc	%g0, -0x3a4, %l5
	.word	0xac5b4017	! t0_kref+0x1308:   	smul	%o5, %l7, %l6
	.word	0xdac0a01c	! t0_kref+0x130c:   	ldswa	[%g2 + 0x1c]%asi, %o5
	.word	0x21800004	! t0_kref+0x1310:   	fbn,a	_kref+0x1320
	.word	0xa5a2cd34	! t0_kref+0x1314:   	fsmuld	%f11, %f20, %f18
	.word	0xc51fbc68	! t0_kref+0x1318:   	ldd	[%fp - 0x398], %f2
	.word	0xb1a109ca	! t0_kref+0x131c:   	fdivd	%f4, %f10, %f24
	.word	0x9055f281	! t0_kref+0x1320:   	umul	%l7, -0xd7f, %o0
	.word	0x927a800a	! t0_kref+0x1324:   	sdiv	%o2, %o2, %o1
	.word	0xd1be501d	! t0_kref+0x1328:   	stda	%f8, [%i1 + %i5]0x80
	.word	0x903b4008	! t0_kref+0x132c:   	xnor	%o5, %o0, %o0
	.word	0x21800006	! t0_kref+0x1330:   	fbn,a	_kref+0x1348
	.word	0xd67e3ffc	! t0_kref+0x1334:   	swap	[%i0 - 4], %o3
	.word	0x90036cbe	! t0_kref+0x1338:   	add	%o5, 0xcbe, %o0
	.word	0x9056ef86	! t0_kref+0x133c:   	umul	%i3, 0xf86, %o0
	.word	0xa722f136	! t0_kref+0x1340:   	mulscc	%o3, -0xeca, %l3
	.word	0xd2c0a02c	! t0_kref+0x1344:   	ldswa	[%g2 + 0x2c]%asi, %o1
	.word	0x81ac0aa9	! t0_kref+0x1348:   	fcmpes	%fcc0, %f16, %f9
	.word	0xc900a038	! t0_kref+0x134c:   	ld	[%g2 + 0x38], %f4
	.word	0x81aa0aaf	! t0_kref+0x1350:   	fcmpes	%fcc0, %f8, %f15
	.word	0xf6b01019	! t0_kref+0x1354:   	stha	%i3, [%g0 + %i1]0x80
	.word	0xae95f1d3	! t0_kref+0x1358:   	orcc	%l7, -0xe2d, %l7
	.word	0xab6767b9	! t0_kref+0x135c:   	movcc	%icc, -0x47, %l5
	.word	0xc9ee501c	! t0_kref+0x1360:   	prefetcha	%i1 + %i4, 4
	.word	0xd216401b	! t0_kref+0x1364:   	lduh	[%i1 + %i3], %o1
	.word	0xa6e6c00c	! t0_kref+0x1368:   	subccc	%i3, %o4, %l3
	.word	0x8da00528	! t0_kref+0x136c:   	fsqrts	%f8, %f6
	.word	0x85a01898	! t0_kref+0x1370:   	fitos	%f24, %f2
	.word	0x8143e041	! t0_kref+0x1374:   	membar	0x41
	.word	0x96c2400a	! t0_kref+0x1378:   	addccc	%o1, %o2, %o3
	.word	0xf7ee101b	! t0_kref+0x137c:   	prefetcha	%i0 + %i3, 27
	.word	0x9ba0002e	! t0_kref+0x1380:   	fmovs	%f14, %f13
	.word	0x9ba0013b	! t0_kref+0x1384:   	fabss	%f27, %f13
	.word	0xacd2c00c	! t0_kref+0x1388:   	umulcc	%o3, %o4, %l6
	.word	0x95a0102b	! t0_kref+0x138c:   	fstox	%f11, %f10
	.word	0x9a76800a	! t0_kref+0x1390:   	udiv	%i2, %o2, %o5
	.word	0x81a80a29	! t0_kref+0x1394:   	fcmps	%fcc0, %f0, %f9
	.word	0xb3a6483a	! t0_kref+0x1398:   	fadds	%f25, %f26, %f25
	.word	0x93a000b2	! t0_kref+0x139c:   	fnegs	%f18, %f9
	.word	0xa9a5c82f	! t0_kref+0x13a0:   	fadds	%f23, %f15, %f20
	.word	0x90f27856	! t0_kref+0x13a4:   	udivcc	%o1, -0x7aa, %o0
	.word	0x943ac009	! t0_kref+0x13a8:   	xnor	%o3, %o1, %o2
	.word	0xd616c019	! t0_kref+0x13ac:   	lduh	[%i3 + %i1], %o3
	.word	0xe99f1a58	! t0_kref+0x13b0:   	ldda	[%i4 + %i0]0xd2, %f20
	.word	0x8143c000	! t0_kref+0x13b4:   	stbar
	.word	0xaeb22b9b	! t0_kref+0x13b8:   	orncc	%o0, 0xb9b, %l7
	.word	0x9937200c	! t0_kref+0x13bc:   	srl	%i4, 0xc, %o4
	.word	0xb3a688a1	! t0_kref+0x13c0:   	fsubs	%f26, %f1, %f25
	.word	0x8d83401c	! t0_kref+0x13c4:   	wr	%o5, %i4, %fprs
	.word	0xd9be588c	! t0_kref+0x13c8:   	stda	%f12, [%i1 + %o4]0xc4
	.word	0x96f8001a	! t0_kref+0x13cc:   	sdivcc	%g0, %i2, %o3
	.word	0x90534008	! t0_kref+0x13d0:   	umul	%o5, %o0, %o0
	.word	0x9423000c	! t0_kref+0x13d4:   	sub	%o4, %o4, %o2
	.word	0xc120a028	! t0_kref+0x13d8:   	st	%f0, [%g2 + 0x28]
	.word	0x9e1727b0	! t0_kref+0x13dc:   	or	%i4, 0x7b0, %o7
	.word	0xed3e3ff8	! t0_kref+0x13e0:   	std	%f22, [%i0 - 8]
	.word	0xf7a0a020	! t0_kref+0x13e4:   	sta	%f27, [%g2 + 0x20]%asi
	.word	0x39800003	! t0_kref+0x13e8:   	fbuge,a	_kref+0x13f4
	.word	0x91a0012c	! t0_kref+0x13ec:   	fabss	%f12, %f8
	.word	0xf3ee101d	! t0_kref+0x13f0:   	prefetcha	%i0 + %i5, 25
	.word	0x27480006	! t0_kref+0x13f4:   	fbul,a,pt	%fcc0, _kref+0x140c
	.word	0x171925ad	! t0_kref+0x13f8:   	sethi	%hi(0x6496b400), %o3
	.word	0x87a00529	! t0_kref+0x13fc:   	fsqrts	%f9, %f3
	.word	0x83a00033	! t0_kref+0x1400:   	fmovs	%f19, %f1
	.word	0xd380a014	! t0_kref+0x1404:   	lda	[%g2 + 0x14]%asi, %f9
	call	SYM(t0_subr3)
	.word	0x9846a7e7	! t0_kref+0x140c:   	addc	%i2, 0x7e7, %o4
	.word	0x9656c00a	! t0_kref+0x1410:   	umul	%i3, %o2, %o3
	.word	0xa642400b	! t0_kref+0x1414:   	addc	%o1, %o3, %l3
	.word	0xd8363fe4	! t0_kref+0x1418:   	sth	%o4, [%i0 - 0x1c]
	.word	0x81a98aad	! t0_kref+0x141c:   	fcmpes	%fcc0, %f6, %f13
	.word	0xa9a0012e	! t0_kref+0x1420:   	fabss	%f14, %f20
	.word	0xd050a02a	! t0_kref+0x1424:   	ldsh	[%g2 + 0x2a], %o0
	.word	0x9257000a	! t0_kref+0x1428:   	umul	%i4, %o2, %o1
	.word	0x98f3300f	! t0_kref+0x142c:   	udivcc	%o4, -0xff1, %o4
	.word	0xdda0a020	! t0_kref+0x1430:   	sta	%f14, [%g2 + 0x20]%asi
	.word	0xec4e7fe0	! t0_kref+0x1434:   	ldsb	[%i1 - 0x20], %l6
	.word	0xdd1fbd60	! t0_kref+0x1438:   	ldd	[%fp - 0x2a0], %f14
	.word	0xa866c00c	! t0_kref+0x143c:   	subc	%i3, %o4, %l4
	.word	0x9da00158	! t0_kref+0x1440:   	fabsd	%f24, %f14
	.word	0x9322f2eb	! t0_kref+0x1444:   	mulscc	%o3, -0xd15, %o1
	.word	0xac86c00a	! t0_kref+0x1448:   	addcc	%i3, %o2, %l6
	.word	0xe84e0000	! t0_kref+0x144c:   	ldsb	[%i0], %l4
	.word	0x2f800006	! t0_kref+0x1450:   	fbu,a	_kref+0x1468
	.word	0xec062000	! t0_kref+0x1454:   	ld	[%i0], %l6
	.word	0xe686501c	! t0_kref+0x1458:   	lda	[%i1 + %i4]0x80, %l3
	.word	0x81a8caa6	! t0_kref+0x145c:   	fcmpes	%fcc0, %f3, %f6
	.word	0x96aef492	! t0_kref+0x1460:   	andncc	%i3, -0xb6e, %o3
	.word	0xb5a4093a	! t0_kref+0x1464:   	fmuls	%f16, %f26, %f26
	.word	0xe5380019	! t0_kref+0x1468:   	std	%f18, [%g0 + %i1]
	.word	0xdec0a010	! t0_kref+0x146c:   	ldswa	[%g2 + 0x10]%asi, %o7
	.word	0xd43e4000	! t0_kref+0x1470:   	std	%o2, [%i1]
	.word	0x925b299f	! t0_kref+0x1474:   	smul	%o4, 0x99f, %o1
	.word	0x9ef7001b	! t0_kref+0x1478:   	udivcc	%i4, %i3, %o7
	.word	0x20800002	! t0_kref+0x147c:   	bn,a	_kref+0x1484
	.word	0x9b372011	! t0_kref+0x1480:   	srl	%i4, 0x11, %o5
	.word	0xacadc00d	! t0_kref+0x1484:   	andncc	%l7, %o5, %l6
	.word	0x33480004	! t0_kref+0x1488:   	fbe,a,pt	%fcc0, _kref+0x1498
	.word	0xe13e7ff0	! t0_kref+0x148c:   	std	%f16, [%i1 - 0x10]
	.word	0x27800008	! t0_kref+0x1490:   	fbul,a	_kref+0x14b0
	.word	0x9e9e801b	! t0_kref+0x1494:   	xorcc	%i2, %i3, %o7
	.word	0xcba0a004	! t0_kref+0x1498:   	sta	%f5, [%g2 + 4]%asi
	.word	0xaec037cd	! t0_kref+0x149c:   	addccc	%g0, -0x833, %l7
	.word	0x9042b557	! t0_kref+0x14a0:   	addc	%o2, -0xaa9, %o0
	.word	0x92573a96	! t0_kref+0x14a4:   	umul	%i4, -0x56a, %o1
	.word	0xd488a03a	! t0_kref+0x14a8:   	lduba	[%g2 + 0x3a]%asi, %o2
	.word	0x901e8017	! t0_kref+0x14ac:   	xor	%i2, %l7, %o0
!	.word	0x334c42d4	! t0_kref+0x14b0:   	fbe,a,pt	%fcc0, SYM(t0_subr2)
	   	fbe,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9e0068cc	! t0_kref+0x14b4:   	add	%g1, 0x8cc, %o7
	.word	0xa961259f	! t0_kref+0x14b8:   	movl	%fcc0, -0x261, %l4
	.word	0xaa0aab80	! t0_kref+0x14bc:   	and	%o2, 0xb80, %l5
	.word	0xc9be180b	! t0_kref+0x14c0:   	stda	%f4, [%i0 + %o3]0xc0
	.word	0xa812c017	! t0_kref+0x14c4:   	or	%o3, %l7, %l4
	.word	0x96fa400c	! t0_kref+0x14c8:   	sdivcc	%o1, %o4, %o3
	.word	0x9666c017	! t0_kref+0x14cc:   	subc	%i3, %l7, %o3
	.word	0x9422a766	! t0_kref+0x14d0:   	sub	%o2, 0x766, %o2
	.word	0xaa233566	! t0_kref+0x14d4:   	sub	%o4, -0xa9a, %l5
	.word	0xe5ee501c	! t0_kref+0x14d8:   	prefetcha	%i1 + %i4, 18
	.word	0xa6e00017	! t0_kref+0x14dc:   	subccc	%g0, %l7, %l3
	.word	0x9852801b	! t0_kref+0x14e0:   	umul	%o2, %i3, %o4
	.word	0xeac0a010	! t0_kref+0x14e4:   	ldswa	[%g2 + 0x10]%asi, %l5
	.word	0x9b400000	! t0_kref+0x14e8:   	mov	%y, %o5
	.word	0x3d480008	! t0_kref+0x14ec:   	fbule,a,pt	%fcc0, _kref+0x150c
	.word	0xd41e0000	! t0_kref+0x14f0:   	ldd	[%i0], %o2
	.word	0x89a01885	! t0_kref+0x14f4:   	fitos	%f5, %f4
	.word	0x001fffff	! t0_kref+0x14f8:   	illtrap	0x1fffff
	.word	0xa8d2a6ca	! t0_kref+0x14fc:   	umulcc	%o2, 0x6ca, %l4
	.word	0xa5a308ca	! t0_kref+0x1500:   	fsubd	%f12, %f10, %f18
	.word	0xafa01a21	! t0_kref+0x1504:   	fstoi	%f1, %f23
	.word	0xaab6a6cb	! t0_kref+0x1508:   	orncc	%i2, 0x6cb, %l5
	.word	0x26800002	! t0_kref+0x150c:   	bl,a	_kref+0x1514
	.word	0xe91fbe18	! t0_kref+0x1510:   	ldd	[%fp - 0x1e8], %f20
	.word	0xf11fbed8	! t0_kref+0x1514:   	ldd	[%fp - 0x128], %f24
	.word	0x2f800006	! t0_kref+0x1518:   	fbu,a	_kref+0x1530
	.word	0xd5be2008	! t0_kref+0x151c:   	stda	%f10, [%i0 + 8]%asi
	.word	0xa81b742e	! t0_kref+0x1520:   	xor	%o5, -0xbd2, %l4
	.word	0x9fc10000	! t0_kref+0x1524:   	call	%g4
	.word	0x8143c000	! t0_kref+0x1528:   	stbar
	.word	0xb7a00529	! t0_kref+0x152c:   	fsqrts	%f9, %f27
	.word	0xc300a020	! t0_kref+0x1530:   	ld	[%g2 + 0x20], %f1
	.word	0x90568008	! t0_kref+0x1534:   	umul	%i2, %o0, %o0
	.word	0x35480008	! t0_kref+0x1538:   	fbue,a,pt	%fcc0, _kref+0x1558
	.word	0xebe6100d	! t0_kref+0x153c:   	casa	[%i0]0x80, %o5, %l5
	.word	0xa622a0c4	! t0_kref+0x1540:   	sub	%o2, 0xc4, %l3
	.word	0x21480008	! t0_kref+0x1544:   	fbn,a,pt	%fcc0, _kref+0x1564
	.word	0xa88b0000	! t0_kref+0x1548:   	andcc	%o4, %g0, %l4
	.word	0xa846ec4a	! t0_kref+0x154c:   	addc	%i3, 0xc4a, %l4
	.word	0xe47e3fec	! t0_kref+0x1550:   	swap	[%i0 - 0x14], %l2
	.word	0xe1be1857	! t0_kref+0x1554:   	stda	%f16, [%i0 + %l7]0xc2
	.word	0xd6b66012	! t0_kref+0x1558:   	stha	%o3, [%i1 + 0x12]%asi
	.word	0x9fc10000	! t0_kref+0x155c:   	call	%g4
	.word	0xd688a02a	! t0_kref+0x1560:   	lduba	[%g2 + 0x2a]%asi, %o3
	.word	0x99a54d2f	! t0_kref+0x1564:   	fsmuld	%f21, %f15, %f12
	.word	0x91a5c8ad	! t0_kref+0x1568:   	fsubs	%f23, %f13, %f8
	.word	0x9006800a	! t0_kref+0x156c:   	add	%i2, %o2, %o0
	.word	0xd6a0a03c	! t0_kref+0x1570:   	sta	%o3, [%g2 + 0x3c]%asi
	.word	0xaba648b7	! t0_kref+0x1574:   	fsubs	%f25, %f23, %f21
	.word	0x9ba148b4	! t0_kref+0x1578:   	fsubs	%f5, %f20, %f13
	.word	0xae45c00d	! t0_kref+0x157c:   	addc	%l7, %o5, %l7
	.word	0xa88224df	! t0_kref+0x1580:   	addcc	%o0, 0x4df, %l4
	.word	0x8da01040	! t0_kref+0x1584:   	fdtox	%f0, %f6
	.word	0xd8f8a03c	! t0_kref+0x1588:   	swapa	[%g2 + 0x3c]%asi, %o4
	.word	0x35480008	! t0_kref+0x158c:   	fbue,a,pt	%fcc0, _kref+0x15ac
	.word	0xe81e0000	! t0_kref+0x1590:   	ldd	[%i0], %l4
	.word	0xec3f4018	! t0_kref+0x1594:   	std	%l6, [%i5 + %i0]
	.word	0x9fc00004	! t0_kref+0x1598:   	call	%g0 + %g4
	.word	0x95a1c821	! t0_kref+0x159c:   	fadds	%f7, %f1, %f10
	.word	0x37800004	! t0_kref+0x15a0:   	fbge,a	_kref+0x15b0
	.word	0x90b27829	! t0_kref+0x15a4:   	orncc	%o1, -0x7d7, %o0
	.word	0x9615ec7e	! t0_kref+0x15a8:   	or	%l7, 0xc7e, %o3
	.word	0xa6924000	! t0_kref+0x15ac:   	orcc	%o1, %g0, %l3
	.word	0xf4b0a022	! t0_kref+0x15b0:   	stha	%i2, [%g2 + 0x22]%asi
	.word	0xd0264000	! t0_kref+0x15b4:   	st	%o0, [%i1]
	.word	0x81a000a0	! t0_kref+0x15b8:   	fnegs	%f0, %f0
	.word	0xe4086a18	! t0_kref+0x15bc:   	ldub	[%g1 + 0xa18], %l2
	.word	0xa41ca00c	! t0_kref+0x15c0:   	xor	%l2, 0xc, %l2
	.word	0xe4286a18	! t0_kref+0x15c4:   	stb	%l2, [%g1 + 0xa18]
	.word	0x81d86a18	! t0_kref+0x15c8:   	flush	%g1 + 0xa18
	.word	0xd630a01c	! t0_kref+0x15cc:   	sth	%o3, [%g2 + 0x1c]
	.word	0xaa8ac01c	! t0_kref+0x15d0:   	andcc	%o3, %i4, %l5
	.word	0x96d724be	! t0_kref+0x15d4:   	umulcc	%i4, 0x4be, %o3
	.word	0xd43e2008	! t0_kref+0x15d8:   	std	%o2, [%i0 + 8]
	.word	0x85a01040	! t0_kref+0x15dc:   	fdtox	%f0, %f2
	.word	0x9ea321f3	! t0_kref+0x15e0:   	subcc	%o4, 0x1f3, %o7
	.word	0xe67e3ff4	! t0_kref+0x15e4:   	swap	[%i0 - 0xc], %l3
	.word	0xd42e8019	! t0_kref+0x15e8:   	stb	%o2, [%i2 + %i1]
	.word	0xeed0a01e	! t0_kref+0x15ec:   	ldsha	[%g2 + 0x1e]%asi, %l7
	.word	0x903aaea0	! t0_kref+0x15f0:   	xnor	%o2, 0xea0, %o0
	.word	0x8143c000	! t0_kref+0x15f4:   	stbar
	.word	0xeac8a027	! t0_kref+0x15f8:   	ldsba	[%g2 + 0x27]%asi, %l5
2:	.word	0xe01e401d	! t0_kref+0x15fc:   	ldd	[%i1 + %i5], %l0
	.word	0xd24e4000	! t0_kref+0x1600:   	ldsb	[%i1], %o1
	call	SYM(t0_subr2)
	.word	0xd05e7fe8	! t0_kref+0x1608:   	ldx	[%i1 - 0x18], %o0
	.word	0xaa3a0000	! t0_kref+0x160c:   	not	%o0, %l5
	.word	0xa5a0015a	! t0_kref+0x1610:   	fabsd	%f26, %f18
	.word	0xa9a208b7	! t0_kref+0x1614:   	fsubs	%f8, %f23, %f20
	.word	0xec3e4000	! t0_kref+0x1618:   	std	%l6, [%i1]
	.word	0x962832f7	! t0_kref+0x161c:   	andn	%g0, -0xd09, %o3
	.word	0xae96c000	! t0_kref+0x1620:   	orcc	%i3, %g0, %l7
	.word	0x91a0103b	! t0_kref+0x1624:   	fstox	%f27, %f8
	.word	0x96c5e65c	! t0_kref+0x1628:   	addccc	%l7, 0x65c, %o3
	.word	0xacaa3753	! t0_kref+0x162c:   	andncc	%o0, -0x8ad, %l6
	.word	0x2b800008	! t0_kref+0x1630:   	fbug,a	_kref+0x1650
	.word	0x94424008	! t0_kref+0x1634:   	addc	%o1, %o0, %o2
	.word	0xa5a018d2	! t0_kref+0x1638:   	fdtos	%f18, %f18
	.word	0xed180019	! t0_kref+0x163c:   	ldd	[%g0 + %i1], %f22
	.word	0x9612001c	! t0_kref+0x1640:   	or	%o0, %i4, %o3
	.word	0x97a409b0	! t0_kref+0x1644:   	fdivs	%f16, %f16, %f11
	.word	0x9e3b6281	! t0_kref+0x1648:   	xnor	%o5, 0x281, %o7
	.word	0x92db62f1	! t0_kref+0x164c:   	smulcc	%o5, 0x2f1, %o1
	.word	0x99227674	! t0_kref+0x1650:   	mulscc	%o1, -0x98c, %o4
	.word	0xd0270019	! t0_kref+0x1654:   	st	%o0, [%i4 + %i1]
	.word	0xd610a01e	! t0_kref+0x1658:   	lduh	[%g2 + 0x1e], %o3
	.word	0x29480001	! t0_kref+0x165c:   	fbl,a,pt	%fcc0, _kref+0x1660
	.word	0xc13e6010	! t0_kref+0x1660:   	std	%f0, [%i1 + 0x10]
	.word	0x9f400000	! t0_kref+0x1664:   	mov	%y, %o7
	.word	0x1f354773	! t0_kref+0x1668:   	sethi	%hi(0xd51dcc00), %o7
	.word	0x2f480006	! t0_kref+0x166c:   	fbu,a,pt	%fcc0, _kref+0x1684
	.word	0xa842400d	! t0_kref+0x1670:   	addc	%o1, %o5, %l4
	.word	0xee26401c	! t0_kref+0x1674:   	st	%l7, [%i1 + %i4]
	.word	0xac22401a	! t0_kref+0x1678:   	sub	%o1, %i2, %l6
	.word	0xecde1000	! t0_kref+0x167c:   	ldxa	[%i0]0x80, %l6
	.word	0xd0100018	! t0_kref+0x1680:   	lduh	[%g0 + %i0], %o0
	.word	0xafa0c92a	! t0_kref+0x1684:   	fmuls	%f3, %f10, %f23
	.word	0xd0a0a034	! t0_kref+0x1688:   	sta	%o0, [%g2 + 0x34]%asi
	.word	0x8143c000	! t0_kref+0x168c:   	stbar
	.word	0x99a01092	! t0_kref+0x1690:   	fxtos	%f18, %f12
	.word	0xd6a8a018	! t0_kref+0x1694:   	stba	%o3, [%g2 + 0x18]%asi
	.word	0x98a02b21	! t0_kref+0x1698:   	subcc	%g0, 0xb21, %o4
	.word	0xec3e3ff8	! t0_kref+0x169c:   	std	%l6, [%i0 - 8]
	.word	0x9fc10000	! t0_kref+0x16a0:   	call	%g4
	.word	0xee7f0018	! t0_kref+0x16a4:   	swap	[%i4 + %i0], %l7
	.word	0x988af8df	! t0_kref+0x16a8:   	andcc	%o3, -0x721, %o4
	.word	0x9a7f2442	! t0_kref+0x16ac:   	sdiv	%i4, 0x442, %o5
	.word	0xa68b6ec6	! t0_kref+0x16b0:   	andcc	%o5, 0xec6, %l3
	.word	0x89a40828	! t0_kref+0x16b4:   	fadds	%f16, %f8, %f4
	.word	0x99400000	! t0_kref+0x16b8:   	mov	%y, %o4
	.word	0xc807bff0	! t0_kref+0x16bc:   	ld	[%fp - 0x10], %g4
	.word	0x81db400f	! t0_kref+0x16c0:   	flush	%o5 + %o7
	.word	0x9a45e934	! t0_kref+0x16c4:   	addc	%l7, 0x934, %o5
	.word	0xd43e3ff8	! t0_kref+0x16c8:   	std	%o2, [%i0 - 8]
	.word	0x9e92668d	! t0_kref+0x16cc:   	orcc	%o1, 0x68d, %o7
	.word	0xde166018	! t0_kref+0x16d0:   	lduh	[%i1 + 0x18], %o7
	.word	0xd00e8018	! t0_kref+0x16d4:   	ldub	[%i2 + %i0], %o0
	.word	0xad0a800c	! t0_kref+0x16d8:   	tsubcc	%o2, %o4, %l6
	.word	0xada00142	! t0_kref+0x16dc:   	fabsd	%f2, %f22
	.word	0x9ba0012e	! t0_kref+0x16e0:   	fabss	%f14, %f13
	.word	0x273a8b76	! t0_kref+0x16e4:   	sethi	%hi(0xea2dd800), %l3
	.word	0x3e800004	! t0_kref+0x16e8:   	bvc,a	_kref+0x16f8
	.word	0xd84e001a	! t0_kref+0x16ec:   	ldsb	[%i0 + %i2], %o4
	.word	0x951730ce	! t0_kref+0x16f0:   	taddcctv	%i4, -0xf32, %o2
	.word	0xc0b0a020	! t0_kref+0x16f4:   	stha	%g0, [%g2 + 0x20]%asi
	.word	0x96603be7	! t0_kref+0x16f8:   	subc	%g0, -0x419, %o3
	.word	0x81a98a54	! t0_kref+0x16fc:   	fcmpd	%fcc0, %f6, %f20
	call	SYM(t0_subr2)
	.word	0xe8de2010	! t0_kref+0x1704:   	ldxa	[%i0 + 0x10]%asi, %l4
	.word	0x291b3506	! t0_kref+0x1708:   	sethi	%hi(0x6cd41800), %l4
	.word	0xea070019	! t0_kref+0x170c:   	ld	[%i4 + %i1], %l5
	.word	0xae7b3e4d	! t0_kref+0x1710:   	sdiv	%o4, -0x1b3, %l7
	.word	0xaba000af	! t0_kref+0x1714:   	fnegs	%f15, %f21
	.word	0x85830009	! t0_kref+0x1718:   	wr	%o4, %o1, %ccr
	.word	0xaefa2cfa	! t0_kref+0x171c:   	sdivcc	%o0, 0xcfa, %l7
	.word	0x97a000b2	! t0_kref+0x1720:   	fnegs	%f18, %f11
	.word	0x9642c000	! t0_kref+0x1724:   	addc	%o3, %g0, %o3
	.word	0x9a172d67	! t0_kref+0x1728:   	or	%i4, 0xd67, %o5
	.word	0xdaa8a01f	! t0_kref+0x172c:   	stba	%o5, [%g2 + 0x1f]%asi
	.word	0x963b001c	! t0_kref+0x1730:   	xnor	%o4, %i4, %o3
	.word	0x34800008	! t0_kref+0x1734:   	bg,a	_kref+0x1754
	.word	0x9872e589	! t0_kref+0x1738:   	udiv	%o3, 0x589, %o4
	.word	0x947a4017	! t0_kref+0x173c:   	sdiv	%o1, %l7, %o2
	.word	0x9e32379b	! t0_kref+0x1740:   	orn	%o0, -0x865, %o7
	.word	0x85a309b7	! t0_kref+0x1744:   	fdivs	%f12, %f23, %f2
	.word	0xe320a008	! t0_kref+0x1748:   	st	%f17, [%g2 + 8]
	.word	0x83a68921	! t0_kref+0x174c:   	fmuls	%f26, %f1, %f1
	.word	0xaf400000	! t0_kref+0x1750:   	mov	%y, %l7
	.word	0x90c2c009	! t0_kref+0x1754:   	addccc	%o3, %o1, %o0
	.word	0xc126001c	! t0_kref+0x1758:   	st	%f0, [%i0 + %i4]
	.word	0x99a0002a	! t0_kref+0x175c:   	fmovs	%f10, %f12
	.word	0xa6b2800b	! t0_kref+0x1760:   	orncc	%o2, %o3, %l3
	.word	0x95a01884	! t0_kref+0x1764:   	fitos	%f4, %f10
	.word	0xd03e7fe0	! t0_kref+0x1768:   	std	%o0, [%i1 - 0x20]
	.word	0x8da01884	! t0_kref+0x176c:   	fitos	%f4, %f6
	.word	0xf51fbe80	! t0_kref+0x1770:   	ldd	[%fp - 0x180], %f26
	.word	0x9a12801a	! t0_kref+0x1774:   	or	%o2, %i2, %o5
	.word	0xaa3b6193	! t0_kref+0x1778:   	xnor	%o5, 0x193, %l5
	.word	0xd048a015	! t0_kref+0x177c:   	ldsb	[%g2 + 0x15], %o0
	.word	0xc3a67fe0	! t0_kref+0x1780:   	sta	%f1, [%i1 - 0x20]%asi
	.word	0xc1ee1017	! t0_kref+0x1784:   	prefetcha	%i0 + %l7, 0
	.word	0xf6a8a00d	! t0_kref+0x1788:   	stba	%i3, [%g2 + 0xd]%asi
	.word	0xb1a38924	! t0_kref+0x178c:   	fmuls	%f14, %f4, %f24
	.word	0x90b729ad	! t0_kref+0x1790:   	orncc	%i4, 0x9ad, %o0
	.word	0xde88a007	! t0_kref+0x1794:   	lduba	[%g2 + 7]%asi, %o7
	.word	0x83a00536	! t0_kref+0x1798:   	fsqrts	%f22, %f1
	.word	0xa9a4082b	! t0_kref+0x179c:   	fadds	%f16, %f11, %f20
	.word	0x83a0002b	! t0_kref+0x17a0:   	fmovs	%f11, %f1
	.word	0xac8eaa23	! t0_kref+0x17a4:   	andcc	%i2, 0xa23, %l6
	.word	0xd720a010	! t0_kref+0x17a8:   	st	%f11, [%g2 + 0x10]
	.word	0x91a01883	! t0_kref+0x17ac:   	fitos	%f3, %f8
	.word	0xee270019	! t0_kref+0x17b0:   	st	%l7, [%i4 + %i1]
	.word	0xd6270019	! t0_kref+0x17b4:   	st	%o3, [%i4 + %i1]
	.word	0xaba448a2	! t0_kref+0x17b8:   	fsubs	%f17, %f2, %f21
	.word	0x96f8001b	! t0_kref+0x17bc:   	sdivcc	%g0, %i3, %o3
	.word	0x940735d4	! t0_kref+0x17c0:   	add	%i4, -0xa2c, %o2
	.word	0xd400a024	! t0_kref+0x17c4:   	ld	[%g2 + 0x24], %o2
	.word	0x87a01888	! t0_kref+0x17c8:   	fitos	%f8, %f3
	.word	0x9072800b	! t0_kref+0x17cc:   	udiv	%o2, %o3, %o0
	.word	0x86102001	! t0_kref+0x17d0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x17d4:   	bne,a	_kref+0x17d4
	.word	0x86a0e001	! t0_kref+0x17d8:   	subcc	%g3, 1, %g3
	.word	0xf620a004	! t0_kref+0x17dc:   	st	%i3, [%g2 + 4]
	.word	0xae630000	! t0_kref+0x17e0:   	subc	%o4, %g0, %l7
	.word	0xaa9ea38d	! t0_kref+0x17e4:   	xorcc	%i2, 0x38d, %l5
	.word	0x9f418000	! t0_kref+0x17e8:   	mov	%fprs, %o7
	.word	0xf380a004	! t0_kref+0x17ec:   	lda	[%g2 + 4]%asi, %f25
	.word	0xd7a63fe8	! t0_kref+0x17f0:   	sta	%f11, [%i0 - 0x18]%asi
	.word	0x9875c009	! t0_kref+0x17f4:   	udiv	%l7, %o1, %o4
	.word	0xec3e0000	! t0_kref+0x17f8:   	std	%l6, [%i0]
	.word	0xd8a8a00c	! t0_kref+0x17fc:   	stba	%o4, [%g2 + 0xc]%asi
	.word	0xd6160000	! t0_kref+0x1800:   	lduh	[%i0], %o3
	.word	0x81abca23	! t0_kref+0x1804:   	fcmps	%fcc0, %f15, %f3
	.word	0xa65f000a	! t0_kref+0x1808:   	smul	%i4, %o2, %l3
	.word	0xae1ec009	! t0_kref+0x180c:   	xor	%i3, %o1, %l7
	.word	0x81ae0a4e	! t0_kref+0x1810:   	fcmpd	%fcc0, %f24, %f14
	.word	0x25480001	! t0_kref+0x1814:   	fblg,a,pt	%fcc0, _kref+0x1818
	.word	0x9f132045	! t0_kref+0x1818:   	taddcctv	%o4, 0x45, %o7
	.word	0x30480008	! t0_kref+0x181c:   	ba,a,pt	%icc, _kref+0x183c
	.word	0xc91fbe60	! t0_kref+0x1820:   	ldd	[%fp - 0x1a0], %f4
	.word	0x9fa00539	! t0_kref+0x1824:   	fsqrts	%f25, %f15
	.word	0xac3b001b	! t0_kref+0x1828:   	xnor	%o4, %i3, %l6
	.word	0x20800007	! t0_kref+0x182c:   	bn,a	_kref+0x1848
	.word	0xe99f5058	! t0_kref+0x1830:   	ldda	[%i5 + %i0]0x82, %f20
	.word	0x945b0009	! t0_kref+0x1834:   	smul	%o4, %o1, %o2
	.word	0x95a64937	! t0_kref+0x1838:   	fmuls	%f25, %f23, %f10
	.word	0x9e630000	! t0_kref+0x183c:   	subc	%o4, %g0, %o7
	.word	0xa8302535	! t0_kref+0x1840:   	orn	%g0, 0x535, %l4
	.word	0xae380008	! t0_kref+0x1844:   	xnor	%g0, %o0, %l7
	.word	0xd2164000	! t0_kref+0x1848:   	lduh	[%i1], %o1
	.word	0x81adca26	! t0_kref+0x184c:   	fcmps	%fcc0, %f23, %f6
	.word	0xafa249a8	! t0_kref+0x1850:   	fdivs	%f9, %f8, %f23
	.word	0xa5a01896	! t0_kref+0x1854:   	fitos	%f22, %f18
	.word	0x9fc00004	! t0_kref+0x1858:   	call	%g0 + %g4
	.word	0xa9a00526	! t0_kref+0x185c:   	fsqrts	%f6, %f20
	.word	0x93a00125	! t0_kref+0x1860:   	fabss	%f5, %f9
	.word	0x913b2015	! t0_kref+0x1864:   	sra	%o4, 0x15, %o0
	.word	0xaf400000	! t0_kref+0x1868:   	mov	%y, %l7
	.word	0x98a72bf5	! t0_kref+0x186c:   	subcc	%i4, 0xbf5, %o4
	.word	0x9a5a800a	! t0_kref+0x1870:   	smul	%o2, %o2, %o5
	.word	0x36800008	! t0_kref+0x1874:   	bge,a	_kref+0x1894
	.word	0xa61e800a	! t0_kref+0x1878:   	xor	%i2, %o2, %l3
	.word	0x8da2c9b7	! t0_kref+0x187c:   	fdivs	%f11, %f23, %f6
	.word	0x89a089c6	! t0_kref+0x1880:   	fdivd	%f2, %f6, %f4
	.word	0xd62e401a	! t0_kref+0x1884:   	stb	%o3, [%i1 + %i2]
	.word	0x90600017	! t0_kref+0x1888:   	subc	%g0, %l7, %o0
	.word	0xe656c019	! t0_kref+0x188c:   	ldsh	[%i3 + %i1], %l3
	.word	0xd648a000	! t0_kref+0x1890:   	ldsb	[%g2], %o3
	.word	0xda270019	! t0_kref+0x1894:   	st	%o5, [%i4 + %i1]
	.word	0xa8623d67	! t0_kref+0x1898:   	subc	%o0, -0x299, %l4
	.word	0xdd00a038	! t0_kref+0x189c:   	ld	[%g2 + 0x38], %f14
	.word	0xee4e401a	! t0_kref+0x18a0:   	ldsb	[%i1 + %i2], %l7
	.word	0xc807bfe8	! t0_kref+0x18a4:   	ld	[%fp - 0x18], %g4
	.word	0xa83a7dd9	! t0_kref+0x18a8:   	xnor	%o1, -0x227, %l4
	.word	0xf4360000	! t0_kref+0x18ac:   	sth	%i2, [%i0]
	.word	0xf6a0a038	! t0_kref+0x18b0:   	sta	%i3, [%g2 + 0x38]%asi
	.word	0xe8ce105a	! t0_kref+0x18b4:   	ldsba	[%i0 + %i2]0x82, %l4
	.word	0xdaa8a028	! t0_kref+0x18b8:   	stba	%o5, [%g2 + 0x28]%asi
	.word	0xd288a008	! t0_kref+0x18bc:   	lduba	[%g2 + 8]%asi, %o1
	.word	0x2a800001	! t0_kref+0x18c0:   	bcs,a	_kref+0x18c4
	.word	0x9eb20000	! t0_kref+0x18c4:   	orncc	%o0, %g0, %o7
	.word	0x23480006	! t0_kref+0x18c8:   	fbne,a,pt	%fcc0, _kref+0x18e0
	.word	0x9ba0052b	! t0_kref+0x18cc:   	fsqrts	%f11, %f13
	.word	0x81a1c8b4	! t0_kref+0x18d0:   	fsubs	%f7, %f20, %f0
	.word	0xd0a6101c	! t0_kref+0x18d4:   	sta	%o0, [%i0 + %i4]0x80
	.word	0x81a01a22	! t0_kref+0x18d8:   	fstoi	%f2, %f0
	.word	0xef00a008	! t0_kref+0x18dc:   	ld	[%g2 + 8], %f23
	.word	0x81a10840	! t0_kref+0x18e0:   	faddd	%f4, %f0, %f0
	.word	0xb7a01881	! t0_kref+0x18e4:   	fitos	%f1, %f27
	.word	0xa7003ebb	! t0_kref+0x18e8:   	taddcc	%g0, -0x145, %l3
	.word	0xf82e8019	! t0_kref+0x18ec:   	stb	%i4, [%i2 + %i1]
	.word	0xd91fbc48	! t0_kref+0x18f0:   	ldd	[%fp - 0x3b8], %f12
	.word	0xd44e7feb	! t0_kref+0x18f4:   	ldsb	[%i1 - 0x15], %o2
	.word	0xb7a2c9aa	! t0_kref+0x18f8:   	fdivs	%f11, %f10, %f27
	.word	0x1529dffd	! t0_kref+0x18fc:   	sethi	%hi(0xa77ff400), %o2
	.word	0x81daf376	! t0_kref+0x1900:   	flush	%o3 - 0xc8a
	.word	0x81ab8a48	! t0_kref+0x1904:   	fcmpd	%fcc0, %f14, %f8
	.word	0xc807bfe8	! t0_kref+0x1908:   	ld	[%fp - 0x18], %g4
	.word	0xf007bfe0	! t0_kref+0x190c:   	ld	[%fp - 0x20], %i0
	.word	0x99a6c8a5	! t0_kref+0x1910:   	fsubs	%f27, %f5, %f12
	.word	0x1102a988	! t0_kref+0x1914:   	sethi	%hi(0xaa62000), %o0
	.word	0xd6c0a004	! t0_kref+0x1918:   	ldswa	[%g2 + 4]%asi, %o3
	.word	0x97a00521	! t0_kref+0x191c:   	fsqrts	%f1, %f11
	.word	0x9a06e110	! t0_kref+0x1920:   	add	%i3, 0x110, %o5
	.word	0x87a01a32	! t0_kref+0x1924:   	fstoi	%f18, %f3
	call	SYM(t0_subr1)
	.word	0x94d36d8b	! t0_kref+0x192c:   	umulcc	%o5, 0xd8b, %o2
	.word	0xf8264000	! t0_kref+0x1930:   	st	%i4, [%i1]
	.word	0xed1fbd30	! t0_kref+0x1934:   	ldd	[%fp - 0x2d0], %f22
	.word	0x9a9b677a	! t0_kref+0x1938:   	xorcc	%o5, 0x77a, %o5
	.word	0x8610201f	! t0_kref+0x193c:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x1940:   	subcc	%g3, 1, %g3
	.word	0x22800005	! t0_kref+0x1944:   	be,a	_kref+0x1958
	.word	0xa6ddfd28	! t0_kref+0x1948:   	smulcc	%l7, -0x2d8, %l3
	.word	0xa88e800d	! t0_kref+0x194c:   	andcc	%i2, %o5, %l4
	.word	0x3dbffffc	! t0_kref+0x1950:   	fbule,a	_kref+0x1940
	.word	0xd810a000	! t0_kref+0x1954:   	lduh	[%g2], %o4
	.word	0xe4180019	! t0_kref+0x1958:   	ldd	[%g0 + %i1], %l2
	.word	0x9da088da	! t0_kref+0x195c:   	fsubd	%f2, %f26, %f14
	.word	0x92c5c00d	! t0_kref+0x1960:   	addccc	%l7, %o5, %o1
	.word	0x29480008	! t0_kref+0x1964:   	fbl,a,pt	%fcc0, _kref+0x1984
	.word	0x9a3dc01a	! t0_kref+0x1968:   	xnor	%l7, %i2, %o5
	.word	0xd86e3fe2	! t0_kref+0x196c:   	ldstub	[%i0 - 0x1e], %o4
	.word	0x97a01a34	! t0_kref+0x1970:   	fstoi	%f20, %f11
	.word	0xf207bfe0	! t0_kref+0x1974:   	ld	[%fp - 0x20], %i1
	.word	0x9652fc63	! t0_kref+0x1978:   	umul	%o3, -0x39d, %o3
	.word	0xc1ee500d	! t0_kref+0x197c:   	prefetcha	%i1 + %o5, 0
	.word	0xae420000	! t0_kref+0x1980:   	addc	%o0, %g0, %l7
	.word	0xa8aebeb8	! t0_kref+0x1984:   	andncc	%i2, -0x148, %l4
	.word	0x90fac00c	! t0_kref+0x1988:   	sdivcc	%o3, %o4, %o0
	.word	0x81a509a9	! t0_kref+0x198c:   	fdivs	%f20, %f9, %f0
	.word	0x37480005	! t0_kref+0x1990:   	fbge,a,pt	%fcc0, _kref+0x19a4
	.word	0x8fa288a7	! t0_kref+0x1994:   	fsubs	%f10, %f7, %f7
	.word	0xd4767ff0	! t0_kref+0x1998:   	stx	%o2, [%i1 - 0x10]
	.word	0x9fc00004	! t0_kref+0x199c:   	call	%g0 + %g4
	.word	0xc700a024	! t0_kref+0x19a0:   	ld	[%g2 + 0x24], %f3
	.word	0x29800004	! t0_kref+0x19a4:   	fbl,a	_kref+0x19b4
	.word	0x9b12654d	! t0_kref+0x19a8:   	taddcctv	%o1, 0x54d, %o5
	.word	0x89a01a42	! t0_kref+0x19ac:   	fdtoi	%f2, %f4
	.word	0xb5a01885	! t0_kref+0x19b0:   	fitos	%f5, %f26
	.word	0x9a72401c	! t0_kref+0x19b4:   	udiv	%o1, %i4, %o5
	.word	0xa65a400d	! t0_kref+0x19b8:   	smul	%o1, %o5, %l3
	.word	0x95400000	! t0_kref+0x19bc:   	mov	%y, %o2
	.word	0x13305683	! t0_kref+0x19c0:   	sethi	%hi(0xc15a0c00), %o1
	.word	0xd228a000	! t0_kref+0x19c4:   	stb	%o1, [%g2]
	.word	0xac9ac01c	! t0_kref+0x19c8:   	xorcc	%o3, %i4, %l6
	.word	0x31480002	! t0_kref+0x19cc:   	fba,a,pt	%fcc0, _kref+0x19d4
	.word	0xe580a028	! t0_kref+0x19d0:   	lda	[%g2 + 0x28]%asi, %f18
	.word	0xa63eff3e	! t0_kref+0x19d4:   	xnor	%i3, -0xc2, %l3
	.word	0xae5823f1	! t0_kref+0x19d8:   	smul	%g0, 0x3f1, %l7
	.word	0x39480002	! t0_kref+0x19dc:   	fbuge,a,pt	%fcc0, _kref+0x19e4
	.word	0xe11fbd20	! t0_kref+0x19e0:   	ldd	[%fp - 0x2e0], %f16
	.word	0x2d800004	! t0_kref+0x19e4:   	fbg,a	_kref+0x19f4
	.word	0xaba188af	! t0_kref+0x19e8:   	fsubs	%f6, %f15, %f21
	.word	0x85a50858	! t0_kref+0x19ec:   	faddd	%f20, %f24, %f2
	.word	0x85a0884a	! t0_kref+0x19f0:   	faddd	%f2, %f10, %f2
	.word	0xd43e7fe0	! t0_kref+0x19f4:   	std	%o2, [%i1 - 0x20]
	.word	0x9eb22acb	! t0_kref+0x19f8:   	orncc	%o0, 0xacb, %o7
	.word	0xa7a18829	! t0_kref+0x19fc:   	fadds	%f6, %f9, %f19
	.word	0x9da01a3a	! t0_kref+0x1a00:   	fstoi	%f26, %f14
	.word	0xed1e401d	! t0_kref+0x1a04:   	ldd	[%i1 + %i5], %f22
	.word	0xaba08936	! t0_kref+0x1a08:   	fmuls	%f2, %f22, %f21
	.word	0xeb00a000	! t0_kref+0x1a0c:   	ld	[%g2], %f21
	.word	0xac1b000c	! t0_kref+0x1a10:   	xor	%o4, %o4, %l6
	.word	0xd1bf5a19	! t0_kref+0x1a14:   	stda	%f8, [%i5 + %i1]0xd0
	.word	0x81ad0a42	! t0_kref+0x1a18:   	fcmpd	%fcc0, %f20, %f2
	.word	0xec90a004	! t0_kref+0x1a1c:   	lduha	[%g2 + 4]%asi, %l6
	.word	0xd6266014	! t0_kref+0x1a20:   	st	%o3, [%i1 + 0x14]
	.word	0x3f480001	! t0_kref+0x1a24:   	fbo,a,pt	%fcc0, _kref+0x1a28
	.word	0xa68335a3	! t0_kref+0x1a28:   	addcc	%o4, -0xa5d, %l3
	.word	0xb7a0188c	! t0_kref+0x1a2c:   	fitos	%f12, %f27
	.word	0xec88a028	! t0_kref+0x1a30:   	lduba	[%g2 + 0x28]%asi, %l6
	.word	0x81ae4ab5	! t0_kref+0x1a34:   	fcmpes	%fcc0, %f25, %f21
	.word	0x9ba01a39	! t0_kref+0x1a38:   	fstoi	%f25, %f13
	.word	0xa9a4483b	! t0_kref+0x1a3c:   	fadds	%f17, %f27, %f20
	.word	0x2d480001	! t0_kref+0x1a40:   	fbg,a,pt	%fcc0, _kref+0x1a44
	.word	0xa5a4c9b9	! t0_kref+0x1a44:   	fdivs	%f19, %f25, %f18
	.word	0x96d2296b	! t0_kref+0x1a48:   	umulcc	%o0, 0x96b, %o3
	.word	0xa85b26be	! t0_kref+0x1a4c:   	smul	%o4, 0x6be, %l4
	.word	0x81aa0a4a	! t0_kref+0x1a50:   	fcmpd	%fcc0, %f8, %f10
	.word	0xd0763ff8	! t0_kref+0x1a54:   	stx	%o0, [%i0 - 8]
	.word	0xa5a60846	! t0_kref+0x1a58:   	faddd	%f24, %f6, %f18
	.word	0xae034009	! t0_kref+0x1a5c:   	add	%o5, %o1, %l7
	.word	0xd0be3ff8	! t0_kref+0x1a60:   	stda	%o0, [%i0 - 8]%asi
	.word	0x8da188d8	! t0_kref+0x1a64:   	fsubd	%f6, %f24, %f6
	.word	0xc5380018	! t0_kref+0x1a68:   	std	%f2, [%g0 + %i0]
	.word	0x925f2fcc	! t0_kref+0x1a6c:   	smul	%i4, 0xfcc, %o1
	.word	0xb8103fe8	! t0_kref+0x1a70:   	mov	0xffffffe8, %i4
	.word	0x89a0053a	! t0_kref+0x1a74:   	fsqrts	%f26, %f4
	.word	0xd91fbee0	! t0_kref+0x1a78:   	ldd	[%fp - 0x120], %f12
	.word	0xab702487	! t0_kref+0x1a7c:   	popc	0x487, %l5
	.word	0x81ab8a50	! t0_kref+0x1a80:   	fcmpd	%fcc0, %f14, %f16
	.word	0x9225e9b8	! t0_kref+0x1a84:   	sub	%l7, 0x9b8, %o1
	.word	0x81a88a40	! t0_kref+0x1a88:   	fcmpd	%fcc0, %f2, %f0
	.word	0x27480003	! t0_kref+0x1a8c:   	fbul,a,pt	%fcc0, _kref+0x1a98
	.word	0xf628a029	! t0_kref+0x1a90:   	stb	%i3, [%g2 + 0x29]
	.word	0x9ba00525	! t0_kref+0x1a94:   	fsqrts	%f5, %f13
	.word	0xaf36c01b	! t0_kref+0x1a98:   	srl	%i3, %i3, %l7
	.word	0xdd9e101d	! t0_kref+0x1a9c:   	ldda	[%i0 + %i5]0x80, %f14
	.word	0xa3a3c931	! t0_kref+0x1aa0:   	fmuls	%f15, %f17, %f17
	.word	0xee2e600a	! t0_kref+0x1aa4:   	stb	%l7, [%i1 + 0xa]
	.word	0xeeae7fe3	! t0_kref+0x1aa8:   	stba	%l7, [%i1 - 0x1d]%asi
	.word	0xf420a030	! t0_kref+0x1aac:   	st	%i2, [%g2 + 0x30]
	.word	0xd090a012	! t0_kref+0x1ab0:   	lduha	[%g2 + 0x12]%asi, %o0
	.word	0x9b65a45d	! t0_kref+0x1ab4:   	movneg	%icc, -0x3a3, %o5
	.word	0x38480005	! t0_kref+0x1ab8:   	bgu,a,pt	%icc, _kref+0x1acc
	.word	0x9da01893	! t0_kref+0x1abc:   	fitos	%f19, %f14
	.word	0xba103ff8	! t0_kref+0x1ac0:   	mov	0xfffffff8, %i5
	.word	0x9da308d6	! t0_kref+0x1ac4:   	fsubd	%f12, %f22, %f14
	.word	0x8fa488bb	! t0_kref+0x1ac8:   	fsubs	%f18, %f27, %f7
	.word	0xe36e401d	! t0_kref+0x1acc:   	prefetch	%i1 + %i5, 17
	.word	0xa1a0012e	! t0_kref+0x1ad0:   	fabss	%f14, %f16
	.word	0xaee5c00b	! t0_kref+0x1ad4:   	subccc	%l7, %o3, %l7
	.word	0x3c800001	! t0_kref+0x1ad8:   	bpos,a	_kref+0x1adc
	.word	0x9a1730f5	! t0_kref+0x1adc:   	or	%i4, -0xf0b, %o5
	.word	0xa61a401b	! t0_kref+0x1ae0:   	xor	%o1, %i3, %l3
	.word	0x81a44839	! t0_kref+0x1ae4:   	fadds	%f17, %f25, %f0
	.word	0xb1a00526	! t0_kref+0x1ae8:   	fsqrts	%f6, %f24
	.word	0xc9be584b	! t0_kref+0x1aec:   	stda	%f4, [%i1 + %o3]0xc2
	.word	0x37800003	! t0_kref+0x1af0:   	fbge,a	_kref+0x1afc
	.word	0xcd1fbd00	! t0_kref+0x1af4:   	ldd	[%fp - 0x300], %f6
	.word	0x81ac0a40	! t0_kref+0x1af8:   	fcmpd	%fcc0, %f16, %f0
	.word	0xec4e3fe0	! t0_kref+0x1afc:   	ldsb	[%i0 - 0x20], %l6
	.word	0xa5a64923	! t0_kref+0x1b00:   	fmuls	%f25, %f3, %f18
	.word	0xac423fc5	! t0_kref+0x1b04:   	addc	%o0, -0x3b, %l6
	.word	0x94400009	! t0_kref+0x1b08:   	addc	%g0, %o1, %o2
	.word	0xae527424	! t0_kref+0x1b0c:   	umul	%o1, -0xbdc, %l7
	.word	0xa673401b	! t0_kref+0x1b10:   	udiv	%o5, %i3, %l3
	.word	0xac96801a	! t0_kref+0x1b14:   	orcc	%i2, %i2, %l6
	.word	0xaa16c008	! t0_kref+0x1b18:   	or	%i3, %o0, %l5
	.word	0xeb6e401a	! t0_kref+0x1b1c:   	prefetch	%i1 + %i2, 21
	.word	0x9495e572	! t0_kref+0x1b20:   	orcc	%l7, 0x572, %o2
	.word	0xab370000	! t0_kref+0x1b24:   	srl	%i4, %g0, %l5
	.word	0xa9a00131	! t0_kref+0x1b28:   	fabss	%f17, %f20
	.word	0xd6a0a038	! t0_kref+0x1b2c:   	sta	%o3, [%g2 + 0x38]%asi
	call	SYM(t0_subr2)
	.word	0xe850a016	! t0_kref+0x1b34:   	ldsh	[%g2 + 0x16], %l4
	.word	0x96e2aec7	! t0_kref+0x1b38:   	subccc	%o2, 0xec7, %o3
	.word	0x92b24008	! t0_kref+0x1b3c:   	orncc	%o1, %o0, %o1
	.word	0x81de0017	! t0_kref+0x1b40:   	flush	%i0 + %l7
	.word	0x9642a58c	! t0_kref+0x1b44:   	addc	%o2, 0x58c, %o3
	.word	0x9216c00a	! t0_kref+0x1b48:   	or	%i3, %o2, %o1
	.word	0xa8428009	! t0_kref+0x1b4c:   	addc	%o2, %o1, %l4
	.word	0x8fa000b5	! t0_kref+0x1b50:   	fnegs	%f21, %f7
	.word	0xd688a02f	! t0_kref+0x1b54:   	lduba	[%g2 + 0x2f]%asi, %o3
	.word	0xee16c019	! t0_kref+0x1b58:   	lduh	[%i3 + %i1], %l7
	.word	0xa8983fb1	! t0_kref+0x1b5c:   	xorcc	%g0, -0x4f, %l4
	.word	0xacd5f7a8	! t0_kref+0x1b60:   	umulcc	%l7, -0x858, %l6
	.word	0x9672e7d6	! t0_kref+0x1b64:   	udiv	%o3, 0x7d6, %o3
	.word	0xd4be7ff0	! t0_kref+0x1b68:   	stda	%o2, [%i1 - 0x10]%asi
	.word	0x81dd8004	! t0_kref+0x1b6c:   	flush	%l6 + %g4
	.word	0xb4102010	! t0_kref+0x1b70:   	mov	0x10, %i2
	.word	0x9070001c	! t0_kref+0x1b74:   	udiv	%g0, %i4, %o0
	.word	0xa642c01b	! t0_kref+0x1b78:   	addc	%o3, %i3, %l3
	.word	0x9022c009	! t0_kref+0x1b7c:   	sub	%o3, %o1, %o0
	.word	0xcba0a038	! t0_kref+0x1b80:   	sta	%f5, [%g2 + 0x38]%asi
	.word	0xd8fe7ffc	! t0_kref+0x1b84:   	swapa	[%i1 - 4]%asi, %o4
	.word	0xa875c01a	! t0_kref+0x1b88:   	udiv	%l7, %i2, %l4
	.word	0xc51fbca8	! t0_kref+0x1b8c:   	ldd	[%fp - 0x358], %f2
	.word	0xe11fbd38	! t0_kref+0x1b90:   	ldd	[%fp - 0x2c8], %f16
	.word	0x91a01a2c	! t0_kref+0x1b94:   	fstoi	%f12, %f8
	.word	0x9fa00525	! t0_kref+0x1b98:   	fsqrts	%f5, %f15
	.word	0xd0a8a025	! t0_kref+0x1b9c:   	stba	%o0, [%g2 + 0x25]%asi
	.word	0x91a0003b	! t0_kref+0x1ba0:   	fmovs	%f27, %f8
	.word	0xda90a02e	! t0_kref+0x1ba4:   	lduha	[%g2 + 0x2e]%asi, %o5
	.word	0x86102003	! t0_kref+0x1ba8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1bac:   	bne,a	_kref+0x1bac
	.word	0x86a0e001	! t0_kref+0x1bb0:   	subcc	%g3, 1, %g3
	.word	0xa8c70017	! t0_kref+0x1bb4:   	addccc	%i4, %l7, %l4
	.word	0x98aae317	! t0_kref+0x1bb8:   	andncc	%o3, 0x317, %o4
	.word	0xd0b0a036	! t0_kref+0x1bbc:   	stha	%o0, [%g2 + 0x36]%asi
	.word	0xd2267fec	! t0_kref+0x1bc0:   	st	%o1, [%i1 - 0x14]
	.word	0x988b000a	! t0_kref+0x1bc4:   	andcc	%o4, %o2, %o4
	.word	0x8da00152	! t0_kref+0x1bc8:   	fabsd	%f18, %f6
	.word	0xac26b9e6	! t0_kref+0x1bcc:   	sub	%i2, -0x61a, %l6
	.word	0x95a6894e	! t0_kref+0x1bd0:   	fmuld	%f26, %f14, %f10
	.word	0x2e480002	! t0_kref+0x1bd4:   	bvs,a,pt	%icc, _kref+0x1bdc
	.word	0xed6e401b	! t0_kref+0x1bd8:   	prefetch	%i1 + %i3, 22
	.word	0xf428a006	! t0_kref+0x1bdc:   	stb	%i2, [%g2 + 6]
	.word	0x2c480001	! t0_kref+0x1be0:   	bneg,a,pt	%icc, _kref+0x1be4
	.word	0xe41e7ff0	! t0_kref+0x1be4:   	ldd	[%i1 - 0x10], %l2
	.word	0x94b269ab	! t0_kref+0x1be8:   	orncc	%o1, 0x9ab, %o2
	.word	0x95a00528	! t0_kref+0x1bec:   	fsqrts	%f8, %f10
	.word	0x9fc10000	! t0_kref+0x1bf0:   	call	%g4
	.word	0xea48a032	! t0_kref+0x1bf4:   	ldsb	[%g2 + 0x32], %l5
	.word	0x30480002	! t0_kref+0x1bf8:   	ba,a,pt	%icc, _kref+0x1c00
	.word	0xa682401a	! t0_kref+0x1bfc:   	addcc	%o1, %i2, %l3
	.word	0xab37001a	! t0_kref+0x1c00:   	srl	%i4, %i2, %l5
	.word	0x1f0daf7d	! t0_kref+0x1c04:   	sethi	%hi(0x36bdf400), %o7
	.word	0x93a00020	! t0_kref+0x1c08:   	fmovs	%f0, %f9
	.word	0xa1a01a3a	! t0_kref+0x1c0c:   	fstoi	%f26, %f16
	.word	0x99a000a4	! t0_kref+0x1c10:   	fnegs	%f4, %f12
	.word	0xa9ab8056	! t0_kref+0x1c14:   	fmovdule	%fcc0, %f22, %f20
	.word	0x86102021	! t0_kref+0x1c18:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x1c1c:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x1c20:   	be,a	_kref+0x1c3c
	.word	0xe816600a	! t0_kref+0x1c24:   	lduh	[%i1 + 0xa], %l4
	.word	0xd980a038	! t0_kref+0x1c28:   	lda	[%g2 + 0x38]%asi, %f12
	.word	0xd6266000	! t0_kref+0x1c2c:   	st	%o3, [%i1]
	.word	0xe91fbcf8	! t0_kref+0x1c30:   	ldd	[%fp - 0x308], %f20
	.word	0xb3a5c821	! t0_kref+0x1c34:   	fadds	%f23, %f1, %f25
	.word	0x97614008	! t0_kref+0x1c38:   	movug	%fcc0, %o0, %o3
	.word	0x98b03f95	! t0_kref+0x1c3c:   	orncc	%g0, -0x6b, %o4
	.word	0x922aeaeb	! t0_kref+0x1c40:   	andn	%o3, 0xaeb, %o1
	.word	0xad16800b	! t0_kref+0x1c44:   	taddcctv	%i2, %o3, %l6
	.word	0xec48a01b	! t0_kref+0x1c48:   	ldsb	[%g2 + 0x1b], %l6
	.word	0xa6b2001c	! t0_kref+0x1c4c:   	orncc	%o0, %i4, %l3
	.word	0x9e96f2cc	! t0_kref+0x1c50:   	orcc	%i3, -0xd34, %o7
	.word	0x9ba00520	! t0_kref+0x1c54:   	fsqrts	%f0, %f13
	.word	0xd2866004	! t0_kref+0x1c58:   	lda	[%i1 + 4]%asi, %o1
	.word	0x3f480005	! t0_kref+0x1c5c:   	fbo,a,pt	%fcc0, _kref+0x1c70
	.word	0xd0260000	! t0_kref+0x1c60:   	st	%o0, [%i0]
	.word	0xd3264000	! t0_kref+0x1c64:   	st	%f9, [%i1]
	.word	0xc900a01c	! t0_kref+0x1c68:   	ld	[%g2 + 0x1c], %f4
	.word	0xf11fbfb0	! t0_kref+0x1c6c:   	ldd	[%fp - 0x50], %f24
	.word	0x85a10940	! t0_kref+0x1c70:   	fmuld	%f4, %f0, %f2
	.word	0xb7a0052a	! t0_kref+0x1c74:   	fsqrts	%f10, %f27
	.word	0x9496b595	! t0_kref+0x1c78:   	orcc	%i2, -0xa6b, %o2
	.word	0x33800002	! t0_kref+0x1c7c:   	fbe,a	_kref+0x1c84
	.word	0xaee24000	! t0_kref+0x1c80:   	subccc	%o1, %g0, %l7
	.word	0xaee7001a	! t0_kref+0x1c84:   	subccc	%i4, %i2, %l7
	.word	0xd406201c	! t0_kref+0x1c88:   	ld	[%i0 + 0x1c], %o2
	.word	0xd87e600c	! t0_kref+0x1c8c:   	swap	[%i1 + 0xc], %o4
	.word	0xda48a00a	! t0_kref+0x1c90:   	ldsb	[%g2 + 0xa], %o5
	.word	0xf7a0a018	! t0_kref+0x1c94:   	sta	%f27, [%g2 + 0x18]%asi
	.word	0xada188c4	! t0_kref+0x1c98:   	fsubd	%f6, %f4, %f22
	.word	0x3f800005	! t0_kref+0x1c9c:   	fbo,a	_kref+0x1cb0
	.word	0x9fa00033	! t0_kref+0x1ca0:   	fmovs	%f19, %f15
	.word	0xb1a01893	! t0_kref+0x1ca4:   	fitos	%f19, %f24
	.word	0x1129f9f6	! t0_kref+0x1ca8:   	sethi	%hi(0xa7e7d800), %o0
	.word	0x9a582c11	! t0_kref+0x1cac:   	smul	%g0, 0xc11, %o5
	.word	0x878020d0	! t0_kref+0x1cb0:   	mov	0xd0, %asi
	.word	0x9e46bac1	! t0_kref+0x1cb4:   	addc	%i2, -0x53f, %o7
	.word	0xf207bfe0	! t0_kref+0x1cb8:   	ld	[%fp - 0x20], %i1
	.word	0x29800006	! t0_kref+0x1cbc:   	fbl,a	_kref+0x1cd4
	.word	0xd476401d	! t0_kref+0x1cc0:   	stx	%o2, [%i1 + %i5]
	.word	0xd8262014	! t0_kref+0x1cc4:   	st	%o4, [%i0 + 0x14]
	.word	0xa88ac00b	! t0_kref+0x1cc8:   	andcc	%o3, %o3, %l4
	.word	0x9ba01a40	! t0_kref+0x1ccc:   	fdtoi	%f0, %f13
	.word	0xa1a01a37	! t0_kref+0x1cd0:   	fstoi	%f23, %f16
	.word	0xd1262018	! t0_kref+0x1cd4:   	st	%f8, [%i0 + 0x18]
	.word	0x1b3c58a7	! t0_kref+0x1cd8:   	sethi	%hi(0xf1629c00), %o5
	.word	0x9632c008	! t0_kref+0x1cdc:   	orn	%o3, %o0, %o3
	.word	0x2b800001	! t0_kref+0x1ce0:   	fbug,a	_kref+0x1ce4
	.word	0xdd3e6000	! t0_kref+0x1ce4:   	std	%f14, [%i1]
	.word	0x81ae0a58	! t0_kref+0x1ce8:   	fcmpd	%fcc0, %f24, %f24
	sethi	%hi(2f), %o7
	.word	0xe40be10c	! t0_kref+0x1cf0:   	ldub	[%o7 + 0x10c], %l2
	.word	0xa41ca00c	! t0_kref+0x1cf4:   	xor	%l2, 0xc, %l2
	.word	0xe42be10c	! t0_kref+0x1cf8:   	stb	%l2, [%o7 + 0x10c]
	.word	0x81dbe10c	! t0_kref+0x1cfc:   	flush	%o7 + 0x10c
	.word	0x81a4492c	! t0_kref+0x1d00:   	fmuls	%f17, %f12, %f0
	call	SYM(t0_subr2)
	.word	0xa623401a	! t0_kref+0x1d08:   	sub	%o5, %i2, %l3
2:	.word	0x9a5f26a9	! t0_kref+0x1d0c:   	smul	%i4, 0x6a9, %o5
	.word	0xda164000	! t0_kref+0x1d10:   	lduh	[%i1], %o5
	.word	0x81aa8aa6	! t0_kref+0x1d14:   	fcmpes	%fcc0, %f10, %f6
	.word	0xa9a50d27	! t0_kref+0x1d18:   	fsmuld	%f20, %f7, %f20
	.word	0x9615c00a	! t0_kref+0x1d1c:   	or	%l7, %o2, %o3
	sethi	%hi(2f), %o7
	.word	0xe40be138	! t0_kref+0x1d24:   	ldub	[%o7 + 0x138], %l2
	.word	0xa41ca00c	! t0_kref+0x1d28:   	xor	%l2, 0xc, %l2
	.word	0xe42be138	! t0_kref+0x1d2c:   	stb	%l2, [%o7 + 0x138]
	.word	0x81dbe138	! t0_kref+0x1d30:   	flush	%o7 + 0x138
	.word	0x25800008	! t0_kref+0x1d34:   	fblg,a	_kref+0x1d54
2:	.word	0x83a5c830	! t0_kref+0x1d38:   	fadds	%f23, %f16, %f1
	.word	0x95a0188c	! t0_kref+0x1d3c:   	fitos	%f12, %f10
	.word	0xb7a20832	! t0_kref+0x1d40:   	fadds	%f8, %f18, %f27
	.word	0xe36e401a	! t0_kref+0x1d44:   	prefetch	%i1 + %i2, 17
	.word	0x3d800005	! t0_kref+0x1d48:   	fbule,a	_kref+0x1d5c
	.word	0xd000a038	! t0_kref+0x1d4c:   	ld	[%g2 + 0x38], %o0
	.word	0x91a01885	! t0_kref+0x1d50:   	fitos	%f5, %f8
	.word	0xec3e7fe0	! t0_kref+0x1d54:   	std	%l6, [%i1 - 0x20]
	.word	0xa81f27a1	! t0_kref+0x1d58:   	xor	%i4, 0x7a1, %l4
	.word	0xd3801019	! t0_kref+0x1d5c:   	lda	[%g0 + %i1]0x80, %f9
	.word	0x30800002	! t0_kref+0x1d60:   	ba,a	_kref+0x1d68
	.word	0xd410a008	! t0_kref+0x1d64:   	lduh	[%g2 + 8], %o2
	.word	0x27800006	! t0_kref+0x1d68:   	fbul,a	_kref+0x1d80
	.word	0xa8aebacd	! t0_kref+0x1d6c:   	andncc	%i2, -0x533, %l4
	.word	0x85a2093b	! t0_kref+0x1d70:   	fmuls	%f8, %f27, %f2
	.word	0xd2480018	! t0_kref+0x1d74:   	ldsb	[%g0 + %i0], %o1
	.word	0x961b400a	! t0_kref+0x1d78:   	xor	%o5, %o2, %o3
	.word	0x83a649b6	! t0_kref+0x1d7c:   	fdivs	%f25, %f22, %f1
	.word	0x2a480001	! t0_kref+0x1d80:   	bcs,a,pt	%icc, _kref+0x1d84
	.word	0x91400000	! t0_kref+0x1d84:   	mov	%y, %o0
	.word	0x933aa01e	! t0_kref+0x1d88:   	sra	%o2, 0x1e, %o1
	.word	0x25480004	! t0_kref+0x1d8c:   	fblg,a,pt	%fcc0, _kref+0x1d9c
	.word	0xd436401b	! t0_kref+0x1d90:   	sth	%o2, [%i1 + %i3]
	.word	0xda10a030	! t0_kref+0x1d94:   	lduh	[%g2 + 0x30], %o5
	.word	0x925eaff5	! t0_kref+0x1d98:   	smul	%i2, 0xff5, %o1
	.word	0xf007bfe0	! t0_kref+0x1d9c:   	ld	[%fp - 0x20], %i0
	.word	0xae8aed2d	! t0_kref+0x1da0:   	andcc	%o3, 0xd2d, %l7
	.word	0xf6b65000	! t0_kref+0x1da4:   	stha	%i3, [%i1]0x80
	.word	0xa63367c2	! t0_kref+0x1da8:   	orn	%o5, 0x7c2, %l3
	.word	0xc07e3ff8	! t0_kref+0x1dac:   	swap	[%i0 - 8], %g0
	.word	0xa7a01887	! t0_kref+0x1db0:   	fitos	%f7, %f19
	.word	0x2b056eda	! t0_kref+0x1db4:   	sethi	%hi(0x15bb6800), %l5
	.word	0x81ac8ab4	! t0_kref+0x1db8:   	fcmpes	%fcc0, %f18, %f20
	.word	0xea40a030	! t0_kref+0x1dbc:   	ldsw	[%g2 + 0x30], %l5
	.word	0x9da68d37	! t0_kref+0x1dc0:   	fsmuld	%f26, %f23, %f14
	.word	0x38800007	! t0_kref+0x1dc4:   	bgu,a	_kref+0x1de0
	.word	0xa692401b	! t0_kref+0x1dc8:   	orcc	%o1, %i3, %l3
	.word	0xa1a688d4	! t0_kref+0x1dcc:   	fsubd	%f26, %f20, %f16
	.word	0x85a388c8	! t0_kref+0x1dd0:   	fsubd	%f14, %f8, %f2
	.word	0x9215f148	! t0_kref+0x1dd4:   	or	%l7, -0xeb8, %o1
	.word	0xa8580008	! t0_kref+0x1dd8:   	smul	%g0, %o0, %l4
	.word	0xe1264000	! t0_kref+0x1ddc:   	st	%f16, [%i1]
	.word	0xba103ff8	! t0_kref+0x1de0:   	mov	0xfffffff8, %i5
	.word	0x9133201a	! t0_kref+0x1de4:   	srl	%o4, 0x1a, %o0
	.word	0x9f400000	! t0_kref+0x1de8:   	mov	%y, %o7
	.word	0x151afe5a	! t0_kref+0x1dec:   	sethi	%hi(0x6bf96800), %o2
	.word	0x91a00526	! t0_kref+0x1df0:   	fsqrts	%f6, %f8
	.word	0x8143c000	! t0_kref+0x1df4:   	stbar
	.word	0xe9f65008	! t0_kref+0x1df8:   	casxa	[%i1]0x80, %o0, %l4
	.word	0x8143c000	! t0_kref+0x1dfc:   	stbar
	.word	0xe840a00c	! t0_kref+0x1e00:   	ldsw	[%g2 + 0xc], %l4
	.word	0x81a80a58	! t0_kref+0x1e04:   	fcmpd	%fcc0, %f0, %f24
	.word	0xafa018c0	! t0_kref+0x1e08:   	fdtos	%f0, %f23
	.word	0xec163ffc	! t0_kref+0x1e0c:   	lduh	[%i0 - 4], %l6
	.word	0x963b2b16	! t0_kref+0x1e10:   	xnor	%o4, 0xb16, %o3
	.word	0xa876801c	! t0_kref+0x1e14:   	udiv	%i2, %i4, %l4
	.word	0xada28954	! t0_kref+0x1e18:   	fmuld	%f10, %f20, %f22
	.word	0x90972bc9	! t0_kref+0x1e1c:   	orcc	%i4, 0xbc9, %o0
	.word	0xc9ee501c	! t0_kref+0x1e20:   	prefetcha	%i1 + %i4, 4
	.word	0x925df7ad	! t0_kref+0x1e24:   	smul	%l7, -0x853, %o1
	.word	0x81a589b9	! t0_kref+0x1e28:   	fdivs	%f22, %f25, %f0
	.word	0x39480008	! t0_kref+0x1e2c:   	fbuge,a,pt	%fcc0, _kref+0x1e4c
	.word	0xcb262004	! t0_kref+0x1e30:   	st	%f5, [%i0 + 4]
	.word	0x29800007	! t0_kref+0x1e34:   	fbl,a	_kref+0x1e50
	.word	0x97400000	! t0_kref+0x1e38:   	mov	%y, %o3
	.word	0x943b401b	! t0_kref+0x1e3c:   	xnor	%o5, %i3, %o2
	.word	0x81ab8a54	! t0_kref+0x1e40:   	fcmpd	%fcc0, %f14, %f20
	.word	0xc900a038	! t0_kref+0x1e44:   	ld	[%g2 + 0x38], %f4
	.word	0x90427b39	! t0_kref+0x1e48:   	addc	%o1, -0x4c7, %o0
	.word	0x25800007	! t0_kref+0x1e4c:   	fblg,a	_kref+0x1e68
	.word	0x2f319b17	! t0_kref+0x1e50:   	sethi	%hi(0xc66c5c00), %l7
	.word	0xea08a035	! t0_kref+0x1e54:   	ldub	[%g2 + 0x35], %l5
	.word	0xa9a0104a	! t0_kref+0x1e58:   	fdtox	%f10, %f20
	.word	0x81ae8a5a	! t0_kref+0x1e5c:   	fcmpd	%fcc0, %f26, %f26
	.word	0x9e8dc00d	! t0_kref+0x1e60:   	andcc	%l7, %o5, %o7
	.word	0xd630a020	! t0_kref+0x1e64:   	sth	%o3, [%g2 + 0x20]
	.word	0xd02e8018	! t0_kref+0x1e68:   	stb	%o0, [%i2 + %i0]
	.word	0xebee501b	! t0_kref+0x1e6c:   	prefetcha	%i1 + %i3, 21
	.word	0x989abbad	! t0_kref+0x1e70:   	xorcc	%o2, -0x453, %o4
	.word	0xada08927	! t0_kref+0x1e74:   	fmuls	%f2, %f7, %f22
	.word	0x9de3bfa0	! t0_kref+0x1e78:   	save	%sp, -0x60, %sp
	.word	0xb6b64000	! t0_kref+0x1e7c:   	orncc	%i1, %g0, %i3
	.word	0x97eef2c5	! t0_kref+0x1e80:   	restore	%i3, -0xd3b, %o3
	.word	0x26800004	! t0_kref+0x1e84:   	bl,a	_kref+0x1e94
	.word	0x96c6801b	! t0_kref+0x1e88:   	addccc	%i2, %i3, %o3
	.word	0xd400a028	! t0_kref+0x1e8c:   	ld	[%g2 + 0x28], %o2
	.word	0x94e2c01a	! t0_kref+0x1e90:   	subccc	%o3, %i2, %o2
	.word	0xa61a74bf	! t0_kref+0x1e94:   	xor	%o1, -0xb41, %l3
	.word	0x21800005	! t0_kref+0x1e98:   	fbn,a	_kref+0x1eac
	.word	0x9da149ba	! t0_kref+0x1e9c:   	fdivs	%f5, %f26, %f14
	.word	0x8da388c8	! t0_kref+0x1ea0:   	fsubd	%f14, %f8, %f6
	.word	0xac67228d	! t0_kref+0x1ea4:   	subc	%i4, 0x28d, %l6
	.word	0x99a00030	! t0_kref+0x1ea8:   	fmovs	%f16, %f12
	.word	0xa9a01a3a	! t0_kref+0x1eac:   	fstoi	%f26, %f20
	.word	0xa862e76b	! t0_kref+0x1eb0:   	subc	%o3, 0x76b, %l4
	.word	0xafa01096	! t0_kref+0x1eb4:   	fxtos	%f22, %f23
	.word	0xd220a000	! t0_kref+0x1eb8:   	st	%o1, [%g2]
	.word	0xe51e4000	! t0_kref+0x1ebc:   	ldd	[%i1], %f18
	.word	0x9e6325ff	! t0_kref+0x1ec0:   	subc	%o4, 0x5ff, %o7
	.word	0xd600a008	! t0_kref+0x1ec4:   	ld	[%g2 + 8], %o3
	.word	0x9a12800b	! t0_kref+0x1ec8:   	or	%o2, %o3, %o5
	.word	0xa5a68844	! t0_kref+0x1ecc:   	faddd	%f26, %f4, %f18
	.word	0x31800004	! t0_kref+0x1ed0:   	fba,a	_kref+0x1ee0
	.word	0x95a01080	! t0_kref+0x1ed4:   	fxtos	%f0, %f10
	.word	0xd11e3fe8	! t0_kref+0x1ed8:   	ldd	[%i0 - 0x18], %f8
	.word	0xa8fb7272	! t0_kref+0x1edc:   	sdivcc	%o5, -0xd8e, %l4
	.word	0xd428a004	! t0_kref+0x1ee0:   	stb	%o2, [%g2 + 4]
	.word	0x928ac00c	! t0_kref+0x1ee4:   	andcc	%o3, %o4, %o1
	.word	0xae9333c3	! t0_kref+0x1ee8:   	orcc	%o4, -0xc3d, %l7
	.word	0xe7262000	! t0_kref+0x1eec:   	st	%f19, [%i0]
	.word	0x9e924017	! t0_kref+0x1ef0:   	orcc	%o1, %l7, %o7
	.word	0x22800008	! t0_kref+0x1ef4:   	be,a	_kref+0x1f14
	.word	0x89a0104a	! t0_kref+0x1ef8:   	fdtox	%f10, %f4
	.word	0x3f480001	! t0_kref+0x1efc:   	fbo,a,pt	%fcc0, _kref+0x1f00
	.word	0x96a00008	! t0_kref+0x1f00:   	subcc	%g0, %o0, %o3
	.word	0xc807bff0	! t0_kref+0x1f04:   	ld	[%fp - 0x10], %g4
	.word	0xac42c00c	! t0_kref+0x1f08:   	addc	%o3, %o4, %l6
	.word	0x20800002	! t0_kref+0x1f0c:   	bn,a	_kref+0x1f14
	.word	0x94122bd0	! t0_kref+0x1f10:   	or	%o0, 0xbd0, %o2
	.word	0xab3ac01a	! t0_kref+0x1f14:   	sra	%o3, %i2, %l5
	.word	0xd830a032	! t0_kref+0x1f18:   	sth	%o4, [%g2 + 0x32]
	.word	0xe16e001a	! t0_kref+0x1f1c:   	prefetch	%i0 + %i2, 16
	.word	0x31800005	! t0_kref+0x1f20:   	fba,a	_kref+0x1f34
	.word	0xcf86105c	! t0_kref+0x1f24:   	lda	[%i0 + %i4]0x82, %f7
	.word	0xa822c01b	! t0_kref+0x1f28:   	sub	%o3, %i3, %l4
	.word	0x95a01040	! t0_kref+0x1f2c:   	fdtox	%f0, %f10
	.word	0x81da2444	! t0_kref+0x1f30:   	flush	%o0 + 0x444
	.word	0xee56001b	! t0_kref+0x1f34:   	ldsh	[%i0 + %i3], %l7
	.word	0x85a0192f	! t0_kref+0x1f38:   	fstod	%f15, %f2
	.word	0x9412001c	! t0_kref+0x1f3c:   	or	%o0, %i4, %o2
	.word	0xda5e2018	! t0_kref+0x1f40:   	ldx	[%i0 + 0x18], %o5
	.word	0x2712c37b	! t0_kref+0x1f44:   	sethi	%hi(0x4b0dec00), %l3
	.word	0x90af000b	! t0_kref+0x1f48:   	andncc	%i4, %o3, %o0
	.word	0xa842a047	! t0_kref+0x1f4c:   	addc	%o2, 0x47, %l4
	.word	0xd99e5a5c	! t0_kref+0x1f50:   	ldda	[%i1 + %i4]0xd2, %f12
	.word	0xada0188b	! t0_kref+0x1f54:   	fitos	%f11, %f22
	.word	0x9e26800c	! t0_kref+0x1f58:   	sub	%i2, %o4, %o7
	.word	0xd51e001d	! t0_kref+0x1f5c:   	ldd	[%i0 + %i5], %f10
	call	SYM(t0_subr3)
	.word	0x1108b250	! t0_kref+0x1f64:   	sethi	%hi(0x22c94000), %o0
	.word	0xd11fbd50	! t0_kref+0x1f68:   	ldd	[%fp - 0x2b0], %f8
	.word	0xafa648b9	! t0_kref+0x1f6c:   	fsubs	%f25, %f25, %f23
	.word	0xf820a03c	! t0_kref+0x1f70:   	st	%i4, [%g2 + 0x3c]
	.word	0x27480001	! t0_kref+0x1f74:   	fbul,a,pt	%fcc0, _kref+0x1f78
	.word	0x9442c01b	! t0_kref+0x1f78:   	addc	%o3, %i3, %o2
	.word	0x95400000	! t0_kref+0x1f7c:   	mov	%y, %o2
	.word	0xd43e6000	! t0_kref+0x1f80:   	std	%o2, [%i1]
	.word	0xa1a01033	! t0_kref+0x1f84:   	fstox	%f19, %f16
	.word	0xa8c3001c	! t0_kref+0x1f88:   	addccc	%o4, %i4, %l4
	.word	0xd4366004	! t0_kref+0x1f8c:   	sth	%o2, [%i1 + 4]
	.word	0xd0767ff0	! t0_kref+0x1f90:   	stx	%o0, [%i1 - 0x10]
	.word	0xe01f4005	! t0_kref+0x1f94:   	ldd	[%i5 + %g5], %l0
	.word	0x9e63401a	! t0_kref+0x1f98:   	subc	%o5, %i2, %o7
	.word	0xde066004	! t0_kref+0x1f9c:   	ld	[%i1 + 4], %o7
	.word	0xd51e0000	! t0_kref+0x1fa0:   	ldd	[%i0], %f10
	.word	0xa8568000	! t0_kref+0x1fa4:   	umul	%i2, %g0, %l4
	.word	0x968b4017	! t0_kref+0x1fa8:   	andcc	%o5, %l7, %o3
	.word	0xa68e800b	! t0_kref+0x1fac:   	andcc	%i2, %o3, %l3
	sethi	%hi(2f), %o7
	.word	0xe40be3c8	! t0_kref+0x1fb4:   	ldub	[%o7 + 0x3c8], %l2
	.word	0xa41ca00c	! t0_kref+0x1fb8:   	xor	%l2, 0xc, %l2
	.word	0xe42be3c8	! t0_kref+0x1fbc:   	stb	%l2, [%o7 + 0x3c8]
	.word	0x81dbe3c8	! t0_kref+0x1fc0:   	flush	%o7 + 0x3c8
	.word	0xa3a01a33	! t0_kref+0x1fc4:   	fstoi	%f19, %f17
2:	.word	0x96d826c0	! t0_kref+0x1fc8:   	smulcc	%g0, 0x6c0, %o3
	.word	0xe64e7fed	! t0_kref+0x1fcc:   	ldsb	[%i1 - 0x13], %l3
	.word	0x81a94aa6	! t0_kref+0x1fd0:   	fcmpes	%fcc0, %f5, %f6
	.word	0xae8deec1	! t0_kref+0x1fd4:   	andcc	%l7, 0xec1, %l7
	.word	0xac05c00c	! t0_kref+0x1fd8:   	add	%l7, %o4, %l6
	.word	0x001fffff	! t0_kref+0x1fdc:   	illtrap	0x1fffff
	.word	0xd6080019	! t0_kref+0x1fe0:   	ldub	[%g0 + %i1], %o3
	.word	0xd210a004	! t0_kref+0x1fe4:   	lduh	[%g2 + 4], %o1
	.word	0xa646801c	! t0_kref+0x1fe8:   	addc	%i2, %i4, %l3
	.word	0x8582800d	! t0_kref+0x1fec:   	wr	%o2, %o5, %ccr
	.word	0xe64e7ff5	! t0_kref+0x1ff0:   	ldsb	[%i1 - 0xb], %l3
	.word	0x90c34008	! t0_kref+0x1ff4:   	addccc	%o5, %o0, %o0
	.word	0xf700a014	! t0_kref+0x1ff8:   	ld	[%g2 + 0x14], %f27
	.word	0xf428a03d	! t0_kref+0x1ffc:   	stb	%i2, [%g2 + 0x3d]
	.word	0xee10a030	! t0_kref+0x2000:   	lduh	[%g2 + 0x30], %l7
	.word	0x99a38854	! t0_kref+0x2004:   	faddd	%f14, %f20, %f12
	.word	0x81da400b	! t0_kref+0x2008:   	flush	%o1 + %o3
	.word	0xa9120017	! t0_kref+0x200c:   	taddcctv	%o0, %l7, %l4
	.word	0x9fc00004	! t0_kref+0x2010:   	call	%g0 + %g4
	.word	0x93a1c92f	! t0_kref+0x2014:   	fmuls	%f7, %f15, %f9
	.word	0xec164000	! t0_kref+0x2018:   	lduh	[%i1], %l6
	.word	0x86102003	! t0_kref+0x201c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2020:   	bne,a	_kref+0x2020
	.word	0x86a0e001	! t0_kref+0x2024:   	subcc	%g3, 1, %g3
	.word	0xb7a00130	! t0_kref+0x2028:   	fabss	%f16, %f27
	.word	0xd620a03c	! t0_kref+0x202c:   	st	%o3, [%g2 + 0x3c]
	.word	0xa65f27f1	! t0_kref+0x2030:   	smul	%i4, 0x7f1, %l3
	.word	0xc9be1840	! t0_kref+0x2034:   	stda	%f4, [%i0]0xc2
	.word	0x95a018d2	! t0_kref+0x2038:   	fdtos	%f18, %f10
	.word	0xae1365c6	! t0_kref+0x203c:   	or	%o5, 0x5c6, %l7
	.word	0xd100a008	! t0_kref+0x2040:   	ld	[%g2 + 8], %f8
	.word	0x9fc10000	! t0_kref+0x2044:   	call	%g4
	.word	0xcd380019	! t0_kref+0x2048:   	std	%f6, [%g0 + %i1]
	.word	0xd040a030	! t0_kref+0x204c:   	ldsw	[%g2 + 0x30], %o0
	.word	0xae9f263c	! t0_kref+0x2050:   	xorcc	%i4, 0x63c, %l7
	.word	0xae42401b	! t0_kref+0x2054:   	addc	%o1, %i3, %l7
	.word	0xd608a031	! t0_kref+0x2058:   	ldub	[%g2 + 0x31], %o3
	.word	0xda280018	! t0_kref+0x205c:   	stb	%o5, [%g0 + %i0]
	.word	0x960374c5	! t0_kref+0x2060:   	add	%o5, -0xb3b, %o3
	.word	0xd828a029	! t0_kref+0x2064:   	stb	%o4, [%g2 + 0x29]
	.word	0x923df112	! t0_kref+0x2068:   	xnor	%l7, -0xeee, %o1
	.word	0x23480008	! t0_kref+0x206c:   	fbne,a,pt	%fcc0, _kref+0x208c
	.word	0xc020a030	! t0_kref+0x2070:   	clr	[%g2 + 0x30]
	.word	0xd220a02c	! t0_kref+0x2074:   	st	%o1, [%g2 + 0x2c]
	.word	0xac62edb6	! t0_kref+0x2078:   	subc	%o3, 0xdb6, %l6
	.word	0xd65e7fe8	! t0_kref+0x207c:   	ldx	[%i1 - 0x18], %o3
	.word	0x9ba018d8	! t0_kref+0x2080:   	fdtos	%f24, %f13
	.word	0x81a000ac	! t0_kref+0x2084:   	fnegs	%f12, %f0
	.word	0xa606c008	! t0_kref+0x2088:   	add	%i3, %o0, %l3
	.word	0xcd262014	! t0_kref+0x208c:   	st	%f6, [%i0 + 0x14]
	.word	0x99a0104a	! t0_kref+0x2090:   	fdtox	%f10, %f12
	.word	0xc0280018	! t0_kref+0x2094:   	clrb	[%g0 + %i0]
	.word	0x81ad4aa5	! t0_kref+0x2098:   	fcmpes	%fcc0, %f21, %f5
	.word	0x24480005	! t0_kref+0x209c:   	ble,a,pt	%icc, _kref+0x20b0
	.word	0x963dfb5b	! t0_kref+0x20a0:   	xnor	%l7, -0x4a5, %o3
	.word	0x81aa0aaf	! t0_kref+0x20a4:   	fcmpes	%fcc0, %f8, %f15
	.word	0x27480006	! t0_kref+0x20a8:   	fbul,a,pt	%fcc0, _kref+0x20c0
	.word	0xd800a030	! t0_kref+0x20ac:   	ld	[%g2 + 0x30], %o4
	.word	0x968b400c	! t0_kref+0x20b0:   	andcc	%o5, %o4, %o3
	.word	0x31800002	! t0_kref+0x20b4:   	fba,a	_kref+0x20bc
	.word	0x89a048b8	! t0_kref+0x20b8:   	fsubs	%f1, %f24, %f4
	.word	0xc807bfe8	! t0_kref+0x20bc:   	ld	[%fp - 0x18], %g4
	.word	0xc5b81019	! t0_kref+0x20c0:   	stda	%f2, [%g0 + %i1]0x80
	.word	0x81dc0015	! t0_kref+0x20c4:   	flush	%l0 + %l5
	.word	0x9da58940	! t0_kref+0x20c8:   	fmuld	%f22, %f0, %f14
	.word	0xa9a00525	! t0_kref+0x20cc:   	fsqrts	%f5, %f20
	.word	0x81aacab8	! t0_kref+0x20d0:   	fcmpes	%fcc0, %f11, %f24
	.word	0xc1be6000	! t0_kref+0x20d4:   	stda	%f0, [%i1]%asi
	.word	0xae0371bb	! t0_kref+0x20d8:   	add	%o5, -0xe45, %l7
	.word	0xa80ab38e	! t0_kref+0x20dc:   	and	%o2, -0xc72, %l4
	.word	0x9fc10000	! t0_kref+0x20e0:   	call	%g4
	.word	0xd028a032	! t0_kref+0x20e4:   	stb	%o0, [%g2 + 0x32]
	.word	0xe96e6018	! t0_kref+0x20e8:   	prefetch	%i1 + 0x18, 20
	.word	0xac46801a	! t0_kref+0x20ec:   	addc	%i2, %i2, %l6
	.word	0x81d80009	! t0_kref+0x20f0:   	flush	%g0 + %o1
	.word	0xee08a03f	! t0_kref+0x20f4:   	ldub	[%g2 + 0x3f], %l7
	.word	0x9a500017	! t0_kref+0x20f8:   	umul	%g0, %l7, %o5
	.word	0xda7e001c	! t0_kref+0x20fc:   	swap	[%i0 + %i4], %o5
	.word	0xa5a01886	! t0_kref+0x2100:   	fitos	%f6, %f18
	.word	0x9da000b8	! t0_kref+0x2104:   	fnegs	%f24, %f14
	.word	0x985328b7	! t0_kref+0x2108:   	umul	%o4, 0x8b7, %o4
	.word	0xd808a00f	! t0_kref+0x210c:   	ldub	[%g2 + 0xf], %o4
	.word	0x89a01935	! t0_kref+0x2110:   	fstod	%f21, %f4
	.word	0x96f2a5a6	! t0_kref+0x2114:   	udivcc	%o2, 0x5a6, %o3
	.word	0x9a52b9fc	! t0_kref+0x2118:   	umul	%o2, -0x604, %o5
	.word	0xd430a030	! t0_kref+0x211c:   	sth	%o2, [%g2 + 0x30]
	.word	0x22800007	! t0_kref+0x2120:   	be,a	_kref+0x213c
	.word	0xb5a01a36	! t0_kref+0x2124:   	fstoi	%f22, %f26
	.word	0xa93a2011	! t0_kref+0x2128:   	sra	%o0, 0x11, %l4
	.word	0x9fc70000	! t0_kref+0x212c:   	call	%i4
	.word	0xa1a000ab	! t0_kref+0x2130:   	fnegs	%f11, %f16
	.word	0xa87b70b7	! t0_kref+0x2134:   	sdiv	%o5, -0xf49, %l4
	.word	0x9da389c8	! t0_kref+0x2138:   	fdivd	%f14, %f8, %f14
	.word	0xf6a6501c	! t0_kref+0x213c:   	sta	%i3, [%i1 + %i4]0x80
	.word	0xf628a028	! t0_kref+0x2140:   	stb	%i3, [%g2 + 0x28]
	.word	0x25480005	! t0_kref+0x2144:   	fblg,a,pt	%fcc0, _kref+0x2158
	.word	0xc93e3ff8	! t0_kref+0x2148:   	std	%f4, [%i0 - 8]
	.word	0xb5a00032	! t0_kref+0x214c:   	fmovs	%f18, %f26
	.word	0x94c2ff3e	! t0_kref+0x2150:   	addccc	%o3, -0xc2, %o2
	.word	0xada00140	! t0_kref+0x2154:   	fabsd	%f0, %f22
	.word	0x900ac000	! t0_kref+0x2158:   	and	%o3, %g0, %o0
	.word	0x9ec6c01b	! t0_kref+0x215c:   	addccc	%i3, %i3, %o7
	.word	0x90434008	! t0_kref+0x2160:   	addc	%o5, %o0, %o0
	.word	0xe51fbf90	! t0_kref+0x2164:   	ldd	[%fp - 0x70], %f18
	.word	0xa3a01a52	! t0_kref+0x2168:   	fdtoi	%f18, %f17
	.word	0x87a00535	! t0_kref+0x216c:   	fsqrts	%f21, %f3
	.word	0xb1a01a22	! t0_kref+0x2170:   	fstoi	%f2, %f24
	.word	0x9a5223d0	! t0_kref+0x2174:   	umul	%o0, 0x3d0, %o5
	.word	0xae72800d	! t0_kref+0x2178:   	udiv	%o2, %o5, %l7
	.word	0xde48a000	! t0_kref+0x217c:   	ldsb	[%g2], %o7
	.word	0xc3267ff8	! t0_kref+0x2180:   	st	%f1, [%i1 - 8]
	.word	0xe6560000	! t0_kref+0x2184:   	ldsh	[%i0], %l3
	.word	0xa7a54838	! t0_kref+0x2188:   	fadds	%f21, %f24, %f19
	.word	0x99a00030	! t0_kref+0x218c:   	fmovs	%f16, %f12
	.word	0xa8f6acf3	! t0_kref+0x2190:   	udivcc	%i2, 0xcf3, %l4
	.word	0xd43e3ff0	! t0_kref+0x2194:   	std	%o2, [%i0 - 0x10]
	.word	0x9333000c	! t0_kref+0x2198:   	srl	%o4, %o4, %o1
	.word	0xa882800b	! t0_kref+0x219c:   	addcc	%o2, %o3, %l4
	.word	0xda28a032	! t0_kref+0x21a0:   	stb	%o5, [%g2 + 0x32]
	.word	0xada08850	! t0_kref+0x21a4:   	faddd	%f2, %f16, %f22
	.word	0x81ac8ab7	! t0_kref+0x21a8:   	fcmpes	%fcc0, %f18, %f23
	.word	0xa5a10d2d	! t0_kref+0x21ac:   	fsmuld	%f4, %f13, %f18
	.word	0x96fec00a	! t0_kref+0x21b0:   	sdivcc	%i3, %o2, %o3
	.word	0x95a009b4	! t0_kref+0x21b4:   	fdivs	%f0, %f20, %f10
	.word	0x86102003	! t0_kref+0x21b8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x21bc:   	bne,a	_kref+0x21bc
	.word	0x86a0e001	! t0_kref+0x21c0:   	subcc	%g3, 1, %g3
	.word	0xa5a000ca	! t0_kref+0x21c4:   	fnegd	%f10, %f18
	.word	0x9fa189af	! t0_kref+0x21c8:   	fdivs	%f6, %f15, %f15
	.word	0xe850a00c	! t0_kref+0x21cc:   	ldsh	[%g2 + 0xc], %l4
	.word	0x81ad0a42	! t0_kref+0x21d0:   	fcmpd	%fcc0, %f20, %f2
	.word	0xaaf331a9	! t0_kref+0x21d4:   	udivcc	%o4, -0xe57, %l5
	.word	0xaeab3f17	! t0_kref+0x21d8:   	andncc	%o4, -0xe9, %l7
	.word	0xdd1fbf20	! t0_kref+0x21dc:   	ldd	[%fp - 0xe0], %f14
	.word	0x9852400c	! t0_kref+0x21e0:   	umul	%o1, %o4, %o4
	.word	0xb3a6c839	! t0_kref+0x21e4:   	fadds	%f27, %f25, %f25
	.word	0x96d6e64f	! t0_kref+0x21e8:   	umulcc	%i3, 0x64f, %o3
	.word	0x90782da2	! t0_kref+0x21ec:   	sdiv	%g0, 0xda2, %o0
	.word	0x921a400d	! t0_kref+0x21f0:   	xor	%o1, %o5, %o1
	.word	0x81ab8a54	! t0_kref+0x21f4:   	fcmpd	%fcc0, %f14, %f20
	.word	0x81da8000	! t0_kref+0x21f8:   	flush	%o2
	.word	0x963a715b	! t0_kref+0x21fc:   	xnor	%o1, -0xea5, %o3
	.word	0x25480005	! t0_kref+0x2200:   	fblg,a,pt	%fcc0, _kref+0x2214
	.word	0x99a0105a	! t0_kref+0x2204:   	fdtox	%f26, %f12
	.word	0x81a9cabb	! t0_kref+0x2208:   	fcmpes	%fcc0, %f7, %f27
	.word	0xacb34008	! t0_kref+0x220c:   	orncc	%o5, %o0, %l6
	.word	0x9692a0ef	! t0_kref+0x2210:   	orcc	%o2, 0xef, %o3
	.word	0x9406801c	! t0_kref+0x2214:   	add	%i2, %i4, %o2
	.word	0xaef374d8	! t0_kref+0x2218:   	udivcc	%o5, -0xb28, %l7
	.word	0x8143c000	! t0_kref+0x221c:   	stbar
	.word	0x20480001	! t0_kref+0x2220:   	bn,a,pt	%icc, _kref+0x2224
	.word	0xd100a03c	! t0_kref+0x2224:   	ld	[%g2 + 0x3c], %f8
	.word	0xe47f0018	! t0_kref+0x2228:   	swap	[%i4 + %i0], %l2
	.word	0xc9a65000	! t0_kref+0x222c:   	sta	%f4, [%i1]0x80
	.word	0x9fa3c9b5	! t0_kref+0x2230:   	fdivs	%f15, %f21, %f15
	.word	0x9b400000	! t0_kref+0x2234:   	mov	%y, %o5
	.word	0xae92e701	! t0_kref+0x2238:   	orcc	%o3, 0x701, %l7
	.word	0xe608a019	! t0_kref+0x223c:   	ldub	[%g2 + 0x19], %l3
	.word	0x37480008	! t0_kref+0x2240:   	fbge,a,pt	%fcc0, _kref+0x2260
	.word	0xd800a028	! t0_kref+0x2244:   	ld	[%g2 + 0x28], %o4
	.word	0xe810a022	! t0_kref+0x2248:   	lduh	[%g2 + 0x22], %l4
	.word	0xf76e2018	! t0_kref+0x224c:   	prefetch	%i0 + 0x18, 27
	.word	0xd626001c	! t0_kref+0x2250:   	st	%o3, [%i0 + %i4]
	.word	0x90220017	! t0_kref+0x2254:   	sub	%o0, %l7, %o0
	.word	0x91a01929	! t0_kref+0x2258:   	fstod	%f9, %f8
	.word	0xd51fbd40	! t0_kref+0x225c:   	ldd	[%fp - 0x2c0], %f10
	.word	0xecbe501d	! t0_kref+0x2260:   	stda	%l6, [%i1 + %i5]0x80
	.word	0xd208a010	! t0_kref+0x2264:   	ldub	[%g2 + 0x10], %o1
	.word	0x92103e2c	! t0_kref+0x2268:   	mov	0xfffffe2c, %o1
	.word	0xd4367ffc	! t0_kref+0x226c:   	sth	%o2, [%i1 - 4]
	.word	0xe9be588b	! t0_kref+0x2270:   	stda	%f20, [%i1 + %o3]0xc4
	.word	0xcb00a03c	! t0_kref+0x2274:   	ld	[%g2 + 0x3c], %f5
	.word	0x39480001	! t0_kref+0x2278:   	fbuge,a,pt	%fcc0, _kref+0x227c
	.word	0xb5a18842	! t0_kref+0x227c:   	faddd	%f6, %f2, %f26
	.word	0x8610200c	! t0_kref+0x2280:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0x2284:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x2288:   	be,a	_kref+0x22f8
	.word	0xa87abc65	! t0_kref+0x228c:   	sdiv	%o2, -0x39b, %l4
	.word	0x8da018c8	! t0_kref+0x2290:   	fdtos	%f8, %f6
	.word	0xf100a008	! t0_kref+0x2294:   	ld	[%g2 + 8], %f24
	.word	0xf62e0000	! t0_kref+0x2298:   	stb	%i3, [%i0]
	.word	0xec40a024	! t0_kref+0x229c:   	ldsw	[%g2 + 0x24], %l6
	.word	0x96c027d1	! t0_kref+0x22a0:   	addccc	%g0, 0x7d1, %o3
	.word	0x33800002	! t0_kref+0x22a4:   	fbe,a	_kref+0x22ac
	.word	0xd04e6002	! t0_kref+0x22a8:   	ldsb	[%i1 + 2], %o0
	.word	0x9fc00004	! t0_kref+0x22ac:   	call	%g0 + %g4
	.word	0xa656f203	! t0_kref+0x22b0:   	umul	%i3, -0xdfd, %l3
	.word	0x94adc000	! t0_kref+0x22b4:   	andncc	%l7, %g0, %o2
	.word	0xaf322017	! t0_kref+0x22b8:   	srl	%o0, 0x17, %l7
	.word	0x81a80a20	! t0_kref+0x22bc:   	fcmps	%fcc0, %f0, %f0
	.word	0x9b2ae012	! t0_kref+0x22c0:   	sll	%o3, 0x12, %o5
	.word	0xd87f0018	! t0_kref+0x22c4:   	swap	[%i4 + %i0], %o4
	.word	0x9002f844	! t0_kref+0x22c8:   	add	%o3, -0x7bc, %o0
	.word	0xaa1ec00c	! t0_kref+0x22cc:   	xor	%i3, %o4, %l5
	.word	0x9427000b	! t0_kref+0x22d0:   	sub	%i4, %o3, %o2
	.word	0xd43e001d	! t0_kref+0x22d4:   	std	%o2, [%i0 + %i5]
	.word	0xb1a10944	! t0_kref+0x22d8:   	fmuld	%f4, %f4, %f24
	.word	0x234fffea	! t0_kref+0x22dc:   	fbne,a,pt	%fcc0, _kref+0x2284
	.word	0xd2263fec	! t0_kref+0x22e0:   	st	%o1, [%i0 - 0x14]
	.word	0x98e27cf9	! t0_kref+0x22e4:   	subccc	%o1, -0x307, %o4
	.word	0x89a0052c	! t0_kref+0x22e8:   	fsqrts	%f12, %f4
	.word	0x9882401c	! t0_kref+0x22ec:   	addcc	%o1, %i4, %o4
	.word	0xb7a00031	! t0_kref+0x22f0:   	fmovs	%f17, %f27
	.word	0x81aa0aa3	! t0_kref+0x22f4:   	fcmpes	%fcc0, %f8, %f3
	.word	0xde167ff2	! t0_kref+0x22f8:   	lduh	[%i1 - 0xe], %o7
	.word	0x25800001	! t0_kref+0x22fc:   	fblg,a	_kref+0x2300
	.word	0xec00a000	! t0_kref+0x2300:   	ld	[%g2], %l6
	.word	0x93a20837	! t0_kref+0x2304:   	fadds	%f8, %f23, %f9
	.word	0xe81e7fe8	! t0_kref+0x2308:   	ldd	[%i1 - 0x18], %l4
	.word	0x8143c000	! t0_kref+0x230c:   	stbar
	.word	0x81ad0aba	! t0_kref+0x2310:   	fcmpes	%fcc0, %f20, %f26
	.word	0xd04e0000	! t0_kref+0x2314:   	ldsb	[%i0], %o0
	.word	0x81a94aa8	! t0_kref+0x2318:   	fcmpes	%fcc0, %f5, %f8
	.word	0xe268a018	! t0_kref+0x231c:   	ldstub	[%g2 + 0x18], %l1
	.word	0xa1a38d31	! t0_kref+0x2320:   	fsmuld	%f14, %f17, %f16
	.word	0x2f800002	! t0_kref+0x2324:   	fbu,a	_kref+0x232c
	.word	0x8143c000	! t0_kref+0x2328:   	stbar
	call	SYM(t0_subr1)
	.word	0xe67f0018	! t0_kref+0x2330:   	swap	[%i4 + %i0], %l3
	.word	0x90432169	! t0_kref+0x2334:   	addc	%o4, 0x169, %o0
	.word	0x32800008	! t0_kref+0x2338:   	bne,a	_kref+0x2358
	.word	0x961ec008	! t0_kref+0x233c:   	xor	%i3, %o0, %o3
	.word	0x8fa00033	! t0_kref+0x2340:   	fmovs	%f19, %f7
	.word	0x37480003	! t0_kref+0x2344:   	fbge,a,pt	%fcc0, _kref+0x2350
	.word	0x9ba00021	! t0_kref+0x2348:   	fmovs	%f1, %f13
	.word	0xa893400a	! t0_kref+0x234c:   	orcc	%o5, %o2, %l4
	.word	0x95a0188e	! t0_kref+0x2350:   	fitos	%f14, %f10
	.word	0xaf400000	! t0_kref+0x2354:   	mov	%y, %l7
	.word	0xa61b4000	! t0_kref+0x2358:   	xor	%o5, %g0, %l3
	.word	0xac323383	! t0_kref+0x235c:   	orn	%o0, -0xc7d, %l6
	.word	0xad418000	! t0_kref+0x2360:   	mov	%fprs, %l6
	.word	0xa6b2ef2f	! t0_kref+0x2364:   	orncc	%o3, 0xf2f, %l3
	.word	0x95a00536	! t0_kref+0x2368:   	fsqrts	%f22, %f10
	.word	0x91a00527	! t0_kref+0x236c:   	fsqrts	%f7, %f8
	.word	0xd6f61000	! t0_kref+0x2370:   	stxa	%o3, [%i0]0x80
	.word	0xa67a000c	! t0_kref+0x2374:   	sdiv	%o0, %o4, %l3
	.word	0x81ae4aa8	! t0_kref+0x2378:   	fcmpes	%fcc0, %f25, %f8
	.word	0xd216c018	! t0_kref+0x237c:   	lduh	[%i3 + %i0], %o1
	.word	0xee2e4000	! t0_kref+0x2380:   	stb	%l7, [%i1]
	.word	0x92d329c4	! t0_kref+0x2384:   	umulcc	%o4, 0x9c4, %o1
	.word	0x25480005	! t0_kref+0x2388:   	fblg,a,pt	%fcc0, _kref+0x239c
	.word	0x97a01a20	! t0_kref+0x238c:   	fstoi	%f0, %f11
	.word	0xa9a6893b	! t0_kref+0x2390:   	fmuls	%f26, %f27, %f20
	.word	0xf96e001c	! t0_kref+0x2394:   	prefetch	%i0 + %i4, 28
	.word	0x9da649ab	! t0_kref+0x2398:   	fdivs	%f25, %f11, %f14
	.word	0xd228a00e	! t0_kref+0x239c:   	stb	%o1, [%g2 + 0xe]
	.word	0x32800002	! t0_kref+0x23a0:   	bne,a	_kref+0x23a8
	.word	0xe920a024	! t0_kref+0x23a4:   	st	%f20, [%g2 + 0x24]
	.word	0xd8166014	! t0_kref+0x23a8:   	lduh	[%i1 + 0x14], %o4
	.word	0xa696a133	! t0_kref+0x23ac:   	orcc	%i2, 0x133, %l3
	.word	0xae223466	! t0_kref+0x23b0:   	sub	%o0, -0xb9a, %l7
	.word	0xe11fbc60	! t0_kref+0x23b4:   	ldd	[%fp - 0x3a0], %f16
	.word	0x8143c000	! t0_kref+0x23b8:   	stbar
	.word	0x81ae0a37	! t0_kref+0x23bc:   	fcmps	%fcc0, %f24, %f23
	.word	0x87a64831	! t0_kref+0x23c0:   	fadds	%f25, %f17, %f3
	.word	0xde4e4000	! t0_kref+0x23c4:   	ldsb	[%i1], %o7
	.word	0xa866b691	! t0_kref+0x23c8:   	subc	%i2, -0x96f, %l4
	.word	0x93a01a30	! t0_kref+0x23cc:   	fstoi	%f16, %f9
	.word	0xae63000b	! t0_kref+0x23d0:   	subc	%o4, %o3, %l7
	.word	0xc93e2018	! t0_kref+0x23d4:   	std	%f4, [%i0 + 0x18]
	.word	0x1523f64c	! t0_kref+0x23d8:   	sethi	%hi(0x8fd93000), %o2
	.word	0xec1e0000	! t0_kref+0x23dc:   	ldd	[%i0], %l6
	.word	0xec871019	! t0_kref+0x23e0:   	lda	[%i4 + %i1]0x80, %l6
	.word	0x99a00828	! t0_kref+0x23e4:   	fadds	%f0, %f8, %f12
	.word	0x9e7aa494	! t0_kref+0x23e8:   	sdiv	%o2, 0x494, %o7
	.word	0x96526a46	! t0_kref+0x23ec:   	umul	%o1, 0xa46, %o3
	.word	0x961a31ca	! t0_kref+0x23f0:   	xor	%o0, -0xe36, %o3
	.word	0x9fc00004	! t0_kref+0x23f4:   	call	%g0 + %g4
	.word	0x91a000b6	! t0_kref+0x23f8:   	fnegs	%f22, %f8
	.word	0x81a1892c	! t0_kref+0x23fc:   	fmuls	%f6, %f12, %f0
	.word	0x980272cb	! t0_kref+0x2400:   	add	%o1, -0xd35, %o4
	.word	0xc300a028	! t0_kref+0x2404:   	ld	[%g2 + 0x28], %f1
	.word	0x90c2c01b	! t0_kref+0x2408:   	addccc	%o3, %i3, %o0
	.word	0xac55c00b	! t0_kref+0x240c:   	umul	%l7, %o3, %l6
	call	SYM(t0_subr1)
	.word	0x923df67a	! t0_kref+0x2414:   	xnor	%l7, -0x986, %o1
	.word	0xb3a009b7	! t0_kref+0x2418:   	fdivs	%f0, %f23, %f25
	.word	0x9a6363fe	! t0_kref+0x241c:   	subc	%o5, 0x3fe, %o5
	.word	0x31800002	! t0_kref+0x2420:   	fba,a	_kref+0x2428
	.word	0xda00a02c	! t0_kref+0x2424:   	ld	[%g2 + 0x2c], %o5
	.word	0x85a48950	! t0_kref+0x2428:   	fmuld	%f18, %f16, %f2
	.word	0xaa227e28	! t0_kref+0x242c:   	sub	%o1, -0x1d8, %l5
	.word	0x948f39ea	! t0_kref+0x2430:   	andcc	%i4, -0x616, %o2
	.word	0xd830a03a	! t0_kref+0x2434:   	sth	%o4, [%g2 + 0x3a]
	.word	0x81dc0005	! t0_kref+0x2438:   	flush	%l0 + %g5
	.word	0xb5a0188f	! t0_kref+0x243c:   	fitos	%f15, %f26
	.word	0xea100019	! t0_kref+0x2440:   	lduh	[%g0 + %i1], %l5
	.word	0xae100009	! t0_kref+0x2444:   	mov	%o1, %l7
	.word	0x81a90a58	! t0_kref+0x2448:   	fcmpd	%fcc0, %f4, %f24
	.word	0x2a480002	! t0_kref+0x244c:   	bcs,a,pt	%icc, _kref+0x2454
	.word	0x85a0188f	! t0_kref+0x2450:   	fitos	%f15, %f2
	.word	0x9816c009	! t0_kref+0x2454:   	or	%i3, %o1, %o4
	.word	0x89a0052e	! t0_kref+0x2458:   	fsqrts	%f14, %f4
	.word	0xed68a042	! t0_kref+0x245c:   	prefetch	%g2 + 0x42, 22
	.word	0x8143c000	! t0_kref+0x2460:   	stbar
	.word	0xf500a03c	! t0_kref+0x2464:   	ld	[%g2 + 0x3c], %f26
	.word	0xaca23fd6	! t0_kref+0x2468:   	subcc	%o0, -0x2a, %l6
	.word	0xaada401a	! t0_kref+0x246c:   	smulcc	%o1, %i2, %l5
	.word	0xaa46b2df	! t0_kref+0x2470:   	addc	%i2, -0xd21, %l5
	.word	0xa7a01a48	! t0_kref+0x2474:   	fdtoi	%f8, %f19
	.word	0x86102001	! t0_kref+0x2478:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x247c:   	bne,a	_kref+0x247c
	.word	0x86a0e001	! t0_kref+0x2480:   	subcc	%g3, 1, %g3
	.word	0xd4262010	! t0_kref+0x2484:   	st	%o2, [%i0 + 0x10]
	.word	0xaf0ebf58	! t0_kref+0x2488:   	tsubcc	%i2, -0xa8, %l7
	.word	0x95a01a36	! t0_kref+0x248c:   	fstoi	%f22, %f10
	.word	0x2b480007	! t0_kref+0x2490:   	fbug,a,pt	%fcc0, _kref+0x24ac
	.word	0xd03e6018	! t0_kref+0x2494:   	std	%o0, [%i1 + 0x18]
	.word	0xe100a008	! t0_kref+0x2498:   	ld	[%g2 + 8], %f16
	.word	0x27800007	! t0_kref+0x249c:   	fbul,a	_kref+0x24b8
	.word	0x8da01a2a	! t0_kref+0x24a0:   	fstoi	%f10, %f6
	.word	0xa85eb0e6	! t0_kref+0x24a4:   	smul	%i2, -0xf1a, %l4
	.word	0xa73a400b	! t0_kref+0x24a8:   	sra	%o1, %o3, %l3
	.word	0xf828a03f	! t0_kref+0x24ac:   	stb	%i4, [%g2 + 0x3f]
	.word	0xac45faaa	! t0_kref+0x24b0:   	addc	%l7, -0x556, %l6
	.word	0x9605ef7f	! t0_kref+0x24b4:   	add	%l7, 0xf7f, %o3
	.word	0xd648a03b	! t0_kref+0x24b8:   	ldsb	[%g2 + 0x3b], %o3
	.word	0x97a01a2c	! t0_kref+0x24bc:   	fstoi	%f12, %f11
	.word	0x83a389b8	! t0_kref+0x24c0:   	fdivs	%f14, %f24, %f1
	.word	0x9ba00024	! t0_kref+0x24c4:   	fmovs	%f4, %f13
	.word	0xd600a038	! t0_kref+0x24c8:   	ld	[%g2 + 0x38], %o3
	.word	0x81db401e	! t0_kref+0x24cc:   	flush	%o5 + %fp
	.word	0x8143c000	! t0_kref+0x24d0:   	stbar
	.word	0x85a0002c	! t0_kref+0x24d4:   	fmovs	%f12, %f2
	.word	0xda86101c	! t0_kref+0x24d8:   	lda	[%i0 + %i4]0x80, %o5
	.word	0x2d800003	! t0_kref+0x24dc:   	fbg,a	_kref+0x24e8
	.word	0x8143c000	! t0_kref+0x24e0:   	stbar
	.word	0xae0a801a	! t0_kref+0x24e4:   	and	%o2, %i2, %l7
	.word	0x90b2c008	! t0_kref+0x24e8:   	orncc	%o3, %o0, %o0
	.word	0x990f0000	! t0_kref+0x24ec:   	tsubcc	%i4, %g0, %o4
	.word	0xc11fbf68	! t0_kref+0x24f0:   	ldd	[%fp - 0x98], %f0
	.word	0xa80a4017	! t0_kref+0x24f4:   	and	%o1, %l7, %l4
	.word	0xd440a028	! t0_kref+0x24f8:   	ldsw	[%g2 + 0x28], %o2
	.word	0x3f800001	! t0_kref+0x24fc:   	fbo,a	_kref+0x2500
	.word	0xe5203588	! t0_kref+0x2500:   	st	%f18, [%g0 - 0xa78]
	.word	0x9da000a1	! t0_kref+0x2504:   	fnegs	%f1, %f14
	.word	0xafa01a50	! t0_kref+0x2508:   	fdtoi	%f16, %f23
	.word	0xa835f93a	! t0_kref+0x250c:   	orn	%l7, -0x6c6, %l4
	.word	0x9ba0052e	! t0_kref+0x2510:   	fsqrts	%f14, %f13
	.word	0xa6aa4009	! t0_kref+0x2514:   	andncc	%o1, %o1, %l3
	.word	0xd9be1a1c	! t0_kref+0x2518:   	stda	%f12, [%i0 + %i4]0xd0
	.word	0x26800008	! t0_kref+0x251c:   	bl,a	_kref+0x253c
	.word	0xa7400000	! t0_kref+0x2520:   	mov	%y, %l3
	.word	0xc0363fec	! t0_kref+0x2524:   	clrh	[%i0 - 0x14]
	.word	0x89a01887	! t0_kref+0x2528:   	fitos	%f7, %f4
	.word	0xda50a008	! t0_kref+0x252c:   	ldsh	[%g2 + 8], %o5
	.word	0xae66ab11	! t0_kref+0x2530:   	subc	%i2, 0xb11, %l7
	.word	0x9ec271d7	! t0_kref+0x2534:   	addccc	%o1, -0xe29, %o7
	.word	0xd6363ffa	! t0_kref+0x2538:   	sth	%o3, [%i0 - 6]
	.word	0x89a000da	! t0_kref+0x253c:   	fnegd	%f26, %f4
	.word	0x3c480006	! t0_kref+0x2540:   	bpos,a,pt	%icc, _kref+0x2558
	.word	0xe320a010	! t0_kref+0x2544:   	st	%f17, [%g2 + 0x10]
	.word	0xb3a24931	! t0_kref+0x2548:   	fmuls	%f9, %f17, %f25
	.word	0xac926d65	! t0_kref+0x254c:   	orcc	%o1, 0xd65, %l6
	.word	0xd04e600d	! t0_kref+0x2550:   	ldsb	[%i1 + 0xd], %o0
	.word	0x9a25c00a	! t0_kref+0x2554:   	sub	%l7, %o2, %o5
	.word	0x1f0044ad	! t0_kref+0x2558:   	sethi	%hi(0x112b400), %o7
	.word	0xa9a01054	! t0_kref+0x255c:   	fdtox	%f20, %f20
	.word	0x94a2c01c	! t0_kref+0x2560:   	subcc	%o3, %i4, %o2
	.word	0xee08a017	! t0_kref+0x2564:   	ldub	[%g2 + 0x17], %l7
	.word	0xe96e3ff8	! t0_kref+0x2568:   	prefetch	%i0 - 8, 20
	.word	0x81aa4aac	! t0_kref+0x256c:   	fcmpes	%fcc0, %f9, %f12
	.word	0x878020e0	! t0_kref+0x2570:   	mov	0xe0, %asi
	.word	0xf51fbec0	! t0_kref+0x2574:   	ldd	[%fp - 0x140], %f26
	.word	0x8ba20838	! t0_kref+0x2578:   	fadds	%f8, %f24, %f5
	.word	0xda50a016	! t0_kref+0x257c:   	ldsh	[%g2 + 0x16], %o5
	.word	0xde50a026	! t0_kref+0x2580:   	ldsh	[%g2 + 0x26], %o7
	.word	0x9a520000	! t0_kref+0x2584:   	umul	%o0, %g0, %o5
	.word	0xc807bff0	! t0_kref+0x2588:   	ld	[%fp - 0x10], %g4
	.word	0x85a5493a	! t0_kref+0x258c:   	fmuls	%f21, %f26, %f2
	.word	0x9053001a	! t0_kref+0x2590:   	umul	%o4, %i2, %o0
	.word	0xd84e8019	! t0_kref+0x2594:   	ldsb	[%i2 + %i1], %o4
	.word	0xaa42b82c	! t0_kref+0x2598:   	addc	%o2, -0x7d4, %l5
	.word	0x983a4017	! t0_kref+0x259c:   	xnor	%o1, %l7, %o4
	.word	0x2b1d1070	! t0_kref+0x25a0:   	sethi	%hi(0x7441c000), %l5
	.word	0x963b6499	! t0_kref+0x25a4:   	xnor	%o5, 0x499, %o3
	.word	0x909f000b	! t0_kref+0x25a8:   	xorcc	%i4, %o3, %o0
	.word	0xb3a488a2	! t0_kref+0x25ac:   	fsubs	%f18, %f2, %f25
	.word	0xa85a38fe	! t0_kref+0x25b0:   	smul	%o0, -0x702, %l4
	.word	0xeefe501c	! t0_kref+0x25b4:   	swapa	[%i1 + %i4]0x80, %l7
	.word	0x81ab4aa1	! t0_kref+0x25b8:   	fcmpes	%fcc0, %f13, %f1
	.word	0x31480007	! t0_kref+0x25bc:   	fba,a,pt	%fcc0, _kref+0x25d8
	.word	0x9b3a001a	! t0_kref+0x25c0:   	sra	%o0, %i2, %o5
	.word	0x8da01881	! t0_kref+0x25c4:   	fitos	%f1, %f6
	.word	0xc9801019	! t0_kref+0x25c8:   	lda	[%g0 + %i1]0x80, %f4
	.word	0xac02001b	! t0_kref+0x25cc:   	add	%o0, %i3, %l6
	.word	0x9fc0001c	! t0_kref+0x25d0:   	call	%g0 + %i4
	.word	0xf51fbd10	! t0_kref+0x25d4:   	ldd	[%fp - 0x2f0], %f26
	.word	0xacaa000b	! t0_kref+0x25d8:   	andncc	%o0, %o3, %l6
	.word	0xaba54921	! t0_kref+0x25dc:   	fmuls	%f21, %f1, %f21
	.word	0xd828a004	! t0_kref+0x25e0:   	stb	%o4, [%g2 + 4]
	.word	0x96b235a8	! t0_kref+0x25e4:   	orncc	%o0, -0xa58, %o3
	.word	0xa9a0108e	! t0_kref+0x25e8:   	fxtos	%f14, %f20
	.word	0xae9233b6	! t0_kref+0x25ec:   	orcc	%o0, -0xc4a, %l7
	.word	0xe3b8a040	! t0_kref+0x25f0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xada01881	! t0_kref+0x25f4:   	fitos	%f1, %f22
	.word	0xec163fe2	! t0_kref+0x25f8:   	lduh	[%i0 - 0x1e], %l6
	.word	0x97a48839	! t0_kref+0x25fc:   	fadds	%f18, %f25, %f11
	.word	0xaa56f79d	! t0_kref+0x2600:   	umul	%i3, -0x863, %l5
	.word	0xd41e7fe8	! t0_kref+0x2604:   	ldd	[%i1 - 0x18], %o2
	.word	0x8da44d2a	! t0_kref+0x2608:   	fsmuld	%f17, %f10, %f6
	.word	0xb5a18952	! t0_kref+0x260c:   	fmuld	%f6, %f18, %f26
	.word	0xf42e8018	! t0_kref+0x2610:   	stb	%i2, [%i2 + %i0]
	.word	0x8143e06b	! t0_kref+0x2614:   	membar	0x6b
	.word	0xd030a026	! t0_kref+0x2618:   	sth	%o0, [%g2 + 0x26]
	.word	0xe51fbc60	! t0_kref+0x261c:   	ldd	[%fp - 0x3a0], %f18
	.word	0xc568a043	! t0_kref+0x2620:   	prefetch	%g2 + 0x43, 2
	.word	0xa6c00017	! t0_kref+0x2624:   	addccc	%g0, %l7, %l3
	.word	0x9015f096	! t0_kref+0x2628:   	or	%l7, -0xf6a, %o0
	.word	0xf700a034	! t0_kref+0x262c:   	ld	[%g2 + 0x34], %f27
	.word	0xb1a4084a	! t0_kref+0x2630:   	faddd	%f16, %f10, %f24
	.word	0xa682c01a	! t0_kref+0x2634:   	addcc	%o3, %i2, %l3
	.word	0x9a1ab6fb	! t0_kref+0x2638:   	xor	%o2, -0x905, %o5
	sethi	%hi(2f), %o7
	.word	0xe40be264	! t0_kref+0x2640:   	ldub	[%o7 + 0x264], %l2
	.word	0xa41ca00c	! t0_kref+0x2644:   	xor	%l2, 0xc, %l2
	.word	0xe42be264	! t0_kref+0x2648:   	stb	%l2, [%o7 + 0x264]
	.word	0x81dbe264	! t0_kref+0x264c:   	flush	%o7 + 0x264
	.word	0xde16c019	! t0_kref+0x2650:   	lduh	[%i3 + %i1], %o7
	.word	0x9ea0000a	! t0_kref+0x2654:   	subcc	%g0, %o2, %o7
	.word	0xa60ac00d	! t0_kref+0x2658:   	and	%o3, %o5, %l3
	.word	0x99a00535	! t0_kref+0x265c:   	fsqrts	%f21, %f12
	.word	0xc0f81019	! t0_kref+0x2660:   	swapa	[%g0 + %i1]0x80, %g0
2:	.word	0xd6fe1000	! t0_kref+0x2664:   	swapa	[%i0]0x80, %o3
	.word	0x9436afd1	! t0_kref+0x2668:   	orn	%i2, 0xfd1, %o2
	.word	0xa6aee120	! t0_kref+0x266c:   	andncc	%i3, 0x120, %l3
	.word	0xdf00a038	! t0_kref+0x2670:   	ld	[%g2 + 0x38], %f15
	call	SYM(t0_subr0)
	.word	0xee7e3fe8	! t0_kref+0x2678:   	swap	[%i0 - 0x18], %l7
	.word	0xa1a00029	! t0_kref+0x267c:   	fmovs	%f9, %f16
	.word	0x98ab29cd	! t0_kref+0x2680:   	andncc	%o4, 0x9cd, %o4
	.word	0xe900a01c	! t0_kref+0x2684:   	ld	[%g2 + 0x1c], %f20
	.word	0xf36e401c	! t0_kref+0x2688:   	prefetch	%i1 + %i4, 25
	.word	0x9efb4000	! t0_kref+0x268c:   	sdivcc	%o5, %g0, %o7
	.word	0xd91fbdc0	! t0_kref+0x2690:   	ldd	[%fp - 0x240], %f12
	sethi	%hi(2f), %o7
	.word	0xe40be2e0	! t0_kref+0x2698:   	ldub	[%o7 + 0x2e0], %l2
	.word	0xa41ca00c	! t0_kref+0x269c:   	xor	%l2, 0xc, %l2
	.word	0xe42be2e0	! t0_kref+0x26a0:   	stb	%l2, [%o7 + 0x2e0]
	.word	0x81dbe2e0	! t0_kref+0x26a4:   	flush	%o7 + 0x2e0
	.word	0x8da48948	! t0_kref+0x26a8:   	fmuld	%f18, %f8, %f6
	.word	0xee4e001a	! t0_kref+0x26ac:   	ldsb	[%i0 + %i2], %l7
	.word	0xa61dc01a	! t0_kref+0x26b0:   	xor	%l7, %i2, %l3
	.word	0x99400000	! t0_kref+0x26b4:   	mov	%y, %o4
	.word	0xa8630000	! t0_kref+0x26b8:   	subc	%o4, %g0, %l4
	.word	0x965de1cc	! t0_kref+0x26bc:   	smul	%l7, 0x1cc, %o3
	.word	0xae1e8017	! t0_kref+0x26c0:   	xor	%i2, %l7, %l7
	.word	0x81a88a48	! t0_kref+0x26c4:   	fcmpd	%fcc0, %f2, %f8
	.word	0x9622bf37	! t0_kref+0x26c8:   	sub	%o2, -0xc9, %o3
	.word	0xd9262000	! t0_kref+0x26cc:   	st	%f12, [%i0]
	.word	0xe300a02c	! t0_kref+0x26d0:   	ld	[%g2 + 0x2c], %f17
	.word	0xd406601c	! t0_kref+0x26d4:   	ld	[%i1 + 0x1c], %o2
	.word	0x81ae0aa1	! t0_kref+0x26d8:   	fcmpes	%fcc0, %f24, %f1
	.word	0xb6103ff8	! t0_kref+0x26dc:   	mov	0xfffffff8, %i3
2:	.word	0xe03e3ff8	! t0_kref+0x26e0:   	std	%l0, [%i0 - 8]
	.word	0xd030a028	! t0_kref+0x26e4:   	sth	%o0, [%g2 + 0x28]
	.word	0x97a00037	! t0_kref+0x26e8:   	fmovs	%f23, %f11
	.word	0x9a3b401c	! t0_kref+0x26ec:   	xnor	%o5, %i4, %o5
	.word	0xee50a030	! t0_kref+0x26f0:   	ldsh	[%g2 + 0x30], %l7
	.word	0xac82355b	! t0_kref+0x26f4:   	addcc	%o0, -0xaa5, %l6
	.word	0x29480005	! t0_kref+0x26f8:   	fbl,a,pt	%fcc0, _kref+0x270c
	.word	0xf3ee101a	! t0_kref+0x26fc:   	prefetcha	%i0 + %i2, 25
	.word	0x9da00128	! t0_kref+0x2700:   	fabss	%f8, %f14
	.word	0xaeda66ca	! t0_kref+0x2704:   	smulcc	%o1, 0x6ca, %l7
	.word	0xb1a00530	! t0_kref+0x2708:   	fsqrts	%f16, %f24
	.word	0x81a189c6	! t0_kref+0x270c:   	fdivd	%f6, %f6, %f0
	.word	0x97a000b6	! t0_kref+0x2710:   	fnegs	%f22, %f11
	.word	0x9707000c	! t0_kref+0x2714:   	taddcc	%i4, %o4, %o3
	.word	0xdaa71018	! t0_kref+0x2718:   	sta	%o5, [%i4 + %i0]0x80
	.word	0x9a82c00c	! t0_kref+0x271c:   	addcc	%o3, %o4, %o5
	.word	0xda26201c	! t0_kref+0x2720:   	st	%o5, [%i0 + 0x1c]
	call	SYM(t0_subr3)
	.word	0xf16e001b	! t0_kref+0x2728:   	prefetch	%i0 + %i3, 24
	.word	0x9de3bfa0	! t0_kref+0x272c:   	save	%sp, -0x60, %sp
	.word	0xb25e3d3f	! t0_kref+0x2730:   	smul	%i0, -0x2c1, %i1
	.word	0x9fee233e	! t0_kref+0x2734:   	restore	%i0, 0x33e, %o7
	call	SYM(t0_subr1)
	.word	0xcf20a014	! t0_kref+0x273c:   	st	%f7, [%g2 + 0x14]
	.word	0xda2e8018	! t0_kref+0x2740:   	stb	%o5, [%i2 + %i0]
	.word	0xd276401d	! t0_kref+0x2744:   	stx	%o1, [%i1 + %i5]
	.word	0x9652bc78	! t0_kref+0x2748:   	umul	%o2, -0x388, %o3
	.word	0xc030a02a	! t0_kref+0x274c:   	clrh	[%g2 + 0x2a]
	.word	0x8182c000	! t0_kref+0x2750:   	wr	%o3, %g0, %y
	.word	0xb7a68828	! t0_kref+0x2754:   	fadds	%f26, %f8, %f27
	.word	0xd020a010	! t0_kref+0x2758:   	st	%o0, [%g2 + 0x10]
	.word	0xa9a01895	! t0_kref+0x275c:   	fitos	%f21, %f20
	.word	0x83a388b4	! t0_kref+0x2760:   	fsubs	%f14, %f20, %f1
	.word	0xa9a009ac	! t0_kref+0x2764:   	fdivs	%f0, %f12, %f20
	.word	0x94e02b9b	! t0_kref+0x2768:   	subccc	%g0, 0xb9b, %o2
	.word	0x26800005	! t0_kref+0x276c:   	bl,a	_kref+0x2780
	.word	0xe96e3fe0	! t0_kref+0x2770:   	prefetch	%i0 - 0x20, 20
	.word	0x8143c000	! t0_kref+0x2774:   	stbar
	.word	0xa9a0188f	! t0_kref+0x2778:   	fitos	%f15, %f20
	.word	0xa67ac017	! t0_kref+0x277c:   	sdiv	%o3, %l7, %l3
	.word	0x29480008	! t0_kref+0x2780:   	fbl,a,pt	%fcc0, _kref+0x27a0
	.word	0x9a233d87	! t0_kref+0x2784:   	sub	%o4, -0x279, %o5
	.word	0xb5a3083b	! t0_kref+0x2788:   	fadds	%f12, %f27, %f26
	.word	0xaea3001b	! t0_kref+0x278c:   	subcc	%o4, %i3, %l7
	.word	0xc028a010	! t0_kref+0x2790:   	clrb	[%g2 + 0x10]
	.word	0xae86e6c9	! t0_kref+0x2794:   	addcc	%i3, 0x6c9, %l7
	.word	0xf630a02e	! t0_kref+0x2798:   	sth	%i3, [%g2 + 0x2e]
	.word	0x8143c000	! t0_kref+0x279c:   	stbar
	.word	0x99a0885a	! t0_kref+0x27a0:   	faddd	%f2, %f26, %f12
	.word	0x9ec7000c	! t0_kref+0x27a4:   	addccc	%i4, %o4, %o7
	.word	0x81a1c8a0	! t0_kref+0x27a8:   	fsubs	%f7, %f0, %f0
	.word	0xae670008	! t0_kref+0x27ac:   	subc	%i4, %o0, %l7
	.word	0xec3e0000	! t0_kref+0x27b0:   	std	%l6, [%i0]
	.word	0x81a90a4c	! t0_kref+0x27b4:   	fcmpd	%fcc0, %f4, %f12
	.word	0x8da01a23	! t0_kref+0x27b8:   	fstoi	%f3, %f6
	.word	0xf1180019	! t0_kref+0x27bc:   	ldd	[%g0 + %i1], %f24
	.word	0xecf81019	! t0_kref+0x27c0:   	swapa	[%g0 + %i1]0x80, %l6
	.word	0x99a2c92b	! t0_kref+0x27c4:   	fmuls	%f11, %f11, %f12
	.word	0x91a5c9b9	! t0_kref+0x27c8:   	fdivs	%f23, %f25, %f8
	.word	0x91a01a32	! t0_kref+0x27cc:   	fstoi	%f18, %f8
	.word	0x983b7cf3	! t0_kref+0x27d0:   	xnor	%o5, -0x30d, %o4
	.word	0x90972ebd	! t0_kref+0x27d4:   	orcc	%i4, 0xebd, %o0
	call	SYM(t0_subr2)
	.word	0x96802199	! t0_kref+0x27dc:   	addcc	%g0, 0x199, %o3
	.word	0x907b001c	! t0_kref+0x27e0:   	sdiv	%o4, %i4, %o0
	.word	0xd44e7ff2	! t0_kref+0x27e4:   	ldsb	[%i1 - 0xe], %o2
	.word	0xc93f4018	! t0_kref+0x27e8:   	std	%f4, [%i5 + %i0]
	.word	0x3d480008	! t0_kref+0x27ec:   	fbule,a,pt	%fcc0, _kref+0x280c
	.word	0x8fa1c8b7	! t0_kref+0x27f0:   	fsubs	%f7, %f23, %f7
	.word	0xc030a024	! t0_kref+0x27f4:   	clrh	[%g2 + 0x24]
	.word	0x8143c000	! t0_kref+0x27f8:   	stbar
	.word	0xff6e001b	! t0_kref+0x27fc:   	prefetch	%i0 + %i3, 31
	.word	0x81ac0aac	! t0_kref+0x2800:   	fcmpes	%fcc0, %f16, %f12
	.word	0xb5a01885	! t0_kref+0x2804:   	fitos	%f5, %f26
	.word	0xa8e6bf05	! t0_kref+0x2808:   	subccc	%i2, -0xfb, %l4
	call	SYM(t0_subr1)
	.word	0xd2b6101b	! t0_kref+0x2810:   	stha	%o1, [%i0 + %i3]0x80
	.word	0xe81e0000	! t0_kref+0x2814:   	ldd	[%i0], %l4
	.word	0x925b6710	! t0_kref+0x2818:   	smul	%o5, 0x710, %o1
	.word	0x967b75cf	! t0_kref+0x281c:   	sdiv	%o5, -0xa31, %o3
	.word	0x3d800005	! t0_kref+0x2820:   	fbule,a	_kref+0x2834
	.word	0x89a01a32	! t0_kref+0x2824:   	fstoi	%f18, %f4
	.word	0x9fc00004	! t0_kref+0x2828:   	call	%g0 + %g4
	.word	0xa1a000b6	! t0_kref+0x282c:   	fnegs	%f22, %f16
	.word	0xc91fbc60	! t0_kref+0x2830:   	ldd	[%fp - 0x3a0], %f4
	.word	0xf430a006	! t0_kref+0x2834:   	sth	%i2, [%g2 + 6]
	.word	0xae3a000b	! t0_kref+0x2838:   	xnor	%o0, %o3, %l7
	.word	0xe320a00c	! t0_kref+0x283c:   	st	%f17, [%g2 + 0xc]
	.word	0xd300a00c	! t0_kref+0x2840:   	ld	[%g2 + 0xc], %f9
	sethi	%hi(2f), %o7
	.word	0xe40be080	! t0_kref+0x2848:   	ldub	[%o7 + 0x80], %l2
	.word	0xa41ca00c	! t0_kref+0x284c:   	xor	%l2, 0xc, %l2
	.word	0xe42be080	! t0_kref+0x2850:   	stb	%l2, [%o7 + 0x80]
	.word	0x81dbe080	! t0_kref+0x2854:   	flush	%o7 + 0x80
	.word	0xae9b3c7e	! t0_kref+0x2858:   	xorcc	%o4, -0x382, %l7
	.word	0xe600a000	! t0_kref+0x285c:   	ld	[%g2], %l3
	.word	0xd41f4019	! t0_kref+0x2860:   	ldd	[%i5 + %i1], %o2
	.word	0x21480001	! t0_kref+0x2864:   	fbn,a,pt	%fcc0, _kref+0x2868
	.word	0x9e7a4008	! t0_kref+0x2868:   	sdiv	%o1, %o0, %o7
	.word	0xd51fbf78	! t0_kref+0x286c:   	ldd	[%fp - 0x88], %f10
	.word	0x9a76c000	! t0_kref+0x2870:   	udiv	%i3, %g0, %o5
	.word	0xa62320e5	! t0_kref+0x2874:   	sub	%o4, 0xe5, %l3
	.word	0xda063ffc	! t0_kref+0x2878:   	ld	[%i0 - 4], %o5
	.word	0x9e8df6a6	! t0_kref+0x287c:   	andcc	%l7, -0x95a, %o7
2:	.word	0x85a20956	! t0_kref+0x2880:   	fmuld	%f8, %f22, %f2
	.word	0x2f480001	! t0_kref+0x2884:   	fbu,a,pt	%fcc0, _kref+0x2888
	.word	0x8583400d	! t0_kref+0x2888:   	wr	%o5, %o5, %ccr
	.word	0x9a56eaa4	! t0_kref+0x288c:   	umul	%i3, 0xaa4, %o5
	.word	0x9462e950	! t0_kref+0x2890:   	subc	%o3, 0x950, %o2
	call	SYM(t0_subr0)
	.word	0xd8166004	! t0_kref+0x2898:   	lduh	[%i1 + 4], %o4
	.word	0xf207bfe0	! t0_kref+0x289c:   	ld	[%fp - 0x20], %i1
	.word	0xf300a008	! t0_kref+0x28a0:   	ld	[%g2 + 8], %f25
	.word	0xe76e3fe0	! t0_kref+0x28a4:   	prefetch	%i0 - 0x20, 19
	.word	0xae528000	! t0_kref+0x28a8:   	umul	%o2, %g0, %l7
	.word	0xaef2619d	! t0_kref+0x28ac:   	udivcc	%o1, 0x19d, %l7
	.word	0x9a1dc009	! t0_kref+0x28b0:   	xor	%l7, %o1, %o5
	.word	0x24800003	! t0_kref+0x28b4:   	ble,a	_kref+0x28c0
	.word	0xee0e4000	! t0_kref+0x28b8:   	ldub	[%i1], %l7
	.word	0xb7a00123	! t0_kref+0x28bc:   	fabss	%f3, %f27
	.word	0xa9a4c820	! t0_kref+0x28c0:   	fadds	%f19, %f0, %f20
	.word	0xf4762000	! t0_kref+0x28c4:   	stx	%i2, [%i0]
	.word	0x96b37677	! t0_kref+0x28c8:   	orncc	%o5, -0x989, %o3
	.word	0xc1be184b	! t0_kref+0x28cc:   	stda	%f0, [%i0 + %o3]0xc2
	.word	0x8143c000	! t0_kref+0x28d0:   	stbar
	.word	0x9e7aef1c	! t0_kref+0x28d4:   	sdiv	%o3, 0xf1c, %o7
	.word	0x9238000c	! t0_kref+0x28d8:   	xnor	%g0, %o4, %o1
	.word	0xac22e211	! t0_kref+0x28dc:   	sub	%o3, 0x211, %l6
	.word	0xe93e001d	! t0_kref+0x28e0:   	std	%f20, [%i0 + %i5]
	sethi	%hi(2f), %o7
	.word	0xe40be114	! t0_kref+0x28e8:   	ldub	[%o7 + 0x114], %l2
	.word	0xa41ca00c	! t0_kref+0x28ec:   	xor	%l2, 0xc, %l2
	.word	0xe42be114	! t0_kref+0x28f0:   	stb	%l2, [%o7 + 0x114]
	.word	0x81dbe114	! t0_kref+0x28f4:   	flush	%o7 + 0x114
	.word	0x91a00154	! t0_kref+0x28f8:   	fabsd	%f20, %f8
	.word	0x8ba409a1	! t0_kref+0x28fc:   	fdivs	%f16, %f1, %f5
	.word	0xdf262008	! t0_kref+0x2900:   	st	%f15, [%i0 + 8]
	.word	0x9472f8ee	! t0_kref+0x2904:   	udiv	%o3, -0x712, %o2
	.word	0xe5ee101a	! t0_kref+0x2908:   	prefetcha	%i0 + %i2, 18
	.word	0xda00a014	! t0_kref+0x290c:   	ld	[%g2 + 0x14], %o5
	.word	0x97a20926	! t0_kref+0x2910:   	fmuls	%f8, %f6, %f11
2:	.word	0x9af2a19e	! t0_kref+0x2914:   	udivcc	%o2, 0x19e, %o5
	.word	0x8ba0188d	! t0_kref+0x2918:   	fitos	%f13, %f5
	.word	0xc7a6101c	! t0_kref+0x291c:   	sta	%f3, [%i0 + %i4]0x80
	.word	0xa9a608ba	! t0_kref+0x2920:   	fsubs	%f24, %f26, %f20
	.word	0x9f2aa00b	! t0_kref+0x2924:   	sll	%o2, 0xb, %o7
	.word	0xc43f4005	! t0_kref+0x2928:   	std	%g2, [%i5 + %g5]
	.word	0xb3a00534	! t0_kref+0x292c:   	fsqrts	%f20, %f25
	.word	0x9a6225f8	! t0_kref+0x2930:   	subc	%o0, 0x5f8, %o5
	.word	0x85a28940	! t0_kref+0x2934:   	fmuld	%f10, %f0, %f2
	.word	0xa63ac008	! t0_kref+0x2938:   	xnor	%o3, %o0, %l3
	.word	0xa822e564	! t0_kref+0x293c:   	sub	%o3, 0x564, %l4
	.word	0xf420a03c	! t0_kref+0x2940:   	st	%i2, [%g2 + 0x3c]
	.word	0xd68e1000	! t0_kref+0x2944:   	lduba	[%i0]0x80, %o3
	.word	0xe81e6010	! t0_kref+0x2948:   	ldd	[%i1 + 0x10], %l4
	.word	0xaa8af784	! t0_kref+0x294c:   	andcc	%o3, -0x87c, %l5
	.word	0xde10a03e	! t0_kref+0x2950:   	lduh	[%g2 + 0x3e], %o7
	.word	0xdb20a008	! t0_kref+0x2954:   	st	%f13, [%g2 + 8]
	.word	0xf13e7fe8	! t0_kref+0x2958:   	std	%f24, [%i1 - 0x18]
	.word	0xdf00a038	! t0_kref+0x295c:   	ld	[%g2 + 0x38], %f15
	.word	0xaa26c008	! t0_kref+0x2960:   	sub	%i3, %o0, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be1ac	! t0_kref+0x2968:   	ldub	[%o7 + 0x1ac], %l2
	.word	0xa41ca00c	! t0_kref+0x296c:   	xor	%l2, 0xc, %l2
	.word	0xe42be1ac	! t0_kref+0x2970:   	stb	%l2, [%o7 + 0x1ac]
	.word	0x81dbe1ac	! t0_kref+0x2974:   	flush	%o7 + 0x1ac
	.word	0xae226db1	! t0_kref+0x2978:   	sub	%o1, 0xdb1, %l7
	.word	0xee50a008	! t0_kref+0x297c:   	ldsh	[%g2 + 8], %l7
	.word	0x89a01084	! t0_kref+0x2980:   	fxtos	%f4, %f4
	.word	0xd5be1000	! t0_kref+0x2984:   	stda	%f10, [%i0]0x80
	.word	0xa65229ca	! t0_kref+0x2988:   	umul	%o0, 0x9ca, %l3
	.word	0x2f800004	! t0_kref+0x298c:   	fbu,a	_kref+0x299c
	.word	0xafa018c2	! t0_kref+0x2990:   	fdtos	%f2, %f23
	.word	0x9402c01c	! t0_kref+0x2994:   	add	%o3, %i4, %o2
	.word	0xf1ee501a	! t0_kref+0x2998:   	prefetcha	%i1 + %i2, 24
	.word	0xd4360000	! t0_kref+0x299c:   	sth	%o2, [%i0]
	.word	0x980a001c	! t0_kref+0x29a0:   	and	%o0, %i4, %o4
	.word	0x25480002	! t0_kref+0x29a4:   	fblg,a,pt	%fcc0, _kref+0x29ac
	.word	0x8ba01a24	! t0_kref+0x29a8:   	fstoi	%f4, %f5
2:	.word	0xa722aab7	! t0_kref+0x29ac:   	mulscc	%o2, 0xab7, %l3
	.word	0xecbe1000	! t0_kref+0x29b0:   	stda	%l6, [%i0]0x80
	.word	0xac222891	! t0_kref+0x29b4:   	sub	%o0, 0x891, %l6
	.word	0x8143c000	! t0_kref+0x29b8:   	stbar
	.word	0x9561c00c	! t0_kref+0x29bc:   	movu	%fcc0, %o4, %o2
	.word	0xf7ee101b	! t0_kref+0x29c0:   	prefetcha	%i0 + %i3, 27
	.word	0xc19e1a5b	! t0_kref+0x29c4:   	ldda	[%i0 + %i3]0xd2, %f0
	.word	0x81ae8aab	! t0_kref+0x29c8:   	fcmpes	%fcc0, %f26, %f11
	.word	0xc3ee500c	! t0_kref+0x29cc:   	prefetcha	%i1 + %o4, 1
	.word	0x9fa6c9b7	! t0_kref+0x29d0:   	fdivs	%f27, %f23, %f15
	.word	0xdd1fbd98	! t0_kref+0x29d4:   	ldd	[%fp - 0x268], %f14
	.word	0x98c20000	! t0_kref+0x29d8:   	addccc	%o0, %g0, %o4
	.word	0x1b24ccc4	! t0_kref+0x29dc:   	sethi	%hi(0x93331000), %o5
	.word	0xa1a40835	! t0_kref+0x29e0:   	fadds	%f16, %f21, %f16
	.word	0x8da00537	! t0_kref+0x29e4:   	fsqrts	%f23, %f6
	.word	0x1720284e	! t0_kref+0x29e8:   	sethi	%hi(0x80a13800), %o3
	.word	0x99a2c9a2	! t0_kref+0x29ec:   	fdivs	%f11, %f2, %f12
	.word	0x9222c00c	! t0_kref+0x29f0:   	sub	%o3, %o4, %o1
	.word	0x21480006	! t0_kref+0x29f4:   	fbn,a,pt	%fcc0, _kref+0x2a0c
	.word	0x9ba40834	! t0_kref+0x29f8:   	fadds	%f16, %f20, %f13
	.word	0xd4774019	! t0_kref+0x29fc:   	stx	%o2, [%i5 + %i1]
	.word	0xb1a0895a	! t0_kref+0x2a00:   	fmuld	%f2, %f26, %f24
	.word	0x15245479	! t0_kref+0x2a04:   	sethi	%hi(0x9151e400), %o2
	.word	0x9e0af9bc	! t0_kref+0x2a08:   	and	%o3, -0x644, %o7
	.word	0xe9be1a1d	! t0_kref+0x2a0c:   	stda	%f20, [%i0 + %i5]0xd0
	.word	0xe84e7ff0	! t0_kref+0x2a10:   	ldsb	[%i1 - 0x10], %l4
	.word	0xdd1fbed8	! t0_kref+0x2a14:   	ldd	[%fp - 0x128], %f14
	.word	0xd4200019	! t0_kref+0x2a18:   	st	%o2, [%g0 + %i1]
	.word	0xb7a00123	! t0_kref+0x2a1c:   	fabss	%f3, %f27
	.word	0xa88b0017	! t0_kref+0x2a20:   	andcc	%o4, %l7, %l4
	.word	0x9e96c01b	! t0_kref+0x2a24:   	orcc	%i3, %i3, %o7
	.word	0xada000a4	! t0_kref+0x2a28:   	fnegs	%f4, %f22
	.word	0xf6262004	! t0_kref+0x2a2c:   	st	%i3, [%i0 + 4]
	.word	0xac5af081	! t0_kref+0x2a30:   	smul	%o3, -0xf7f, %l6
	.word	0xb1a01a2d	! t0_kref+0x2a34:   	fstoi	%f13, %f24
	.word	0xa5a589d6	! t0_kref+0x2a38:   	fdivd	%f22, %f22, %f18
	.word	0x9fa01a46	! t0_kref+0x2a3c:   	fdtoi	%f6, %f15
	.word	0x33480008	! t0_kref+0x2a40:   	fbe,a,pt	%fcc0, _kref+0x2a60
	.word	0x8fa54931	! t0_kref+0x2a44:   	fmuls	%f21, %f17, %f7
	.word	0x29480008	! t0_kref+0x2a48:   	fbl,a,pt	%fcc0, _kref+0x2a68
	.word	0x9a8b3ffb	! t0_kref+0x2a4c:   	andcc	%o4, -0x5, %o5
	.word	0x96428017	! t0_kref+0x2a50:   	addc	%o2, %l7, %o3
	.word	0xd01e6008	! t0_kref+0x2a54:   	ldd	[%i1 + 8], %o0
	.word	0xb5a0013b	! t0_kref+0x2a58:   	fabss	%f27, %f26
	.word	0x9296c00b	! t0_kref+0x2a5c:   	orcc	%i3, %o3, %o1
	.word	0xa5a00126	! t0_kref+0x2a60:   	fabss	%f6, %f18
	.word	0x2e800005	! t0_kref+0x2a64:   	bvs,a	_kref+0x2a78
	.word	0x960a400b	! t0_kref+0x2a68:   	and	%o1, %o3, %o3
	call	SYM(t0_subr3)
	.word	0xada1c9b1	! t0_kref+0x2a70:   	fdivs	%f7, %f17, %f22
	.word	0x2b800006	! t0_kref+0x2a74:   	fbug,a	_kref+0x2a8c
	.word	0xf76e2018	! t0_kref+0x2a78:   	prefetch	%i0 + 0x18, 27
	.word	0xa81f25eb	! t0_kref+0x2a7c:   	xor	%i4, 0x5eb, %l4
	.word	0x98a6a03a	! t0_kref+0x2a80:   	subcc	%i2, 0x3a, %o4
	.word	0xa822800a	! t0_kref+0x2a84:   	sub	%o2, %o2, %l4
	call	SYM(t0_subr1)
	.word	0xae702e86	! t0_kref+0x2a8c:   	udiv	%g0, 0xe86, %l7
	.word	0xe3b8a040	! t0_kref+0x2a90:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xb3a00537	! t0_kref+0x2a94:   	fsqrts	%f23, %f25
	.word	0xaef32331	! t0_kref+0x2a98:   	udivcc	%o4, 0x331, %l7
	call	SYM(t0_subr0)
	.word	0xd9b81019	! t0_kref+0x2aa0:   	stda	%f12, [%g0 + %i1]0x80
	.word	0xea4e8018	! t0_kref+0x2aa4:   	ldsb	[%i2 + %i0], %l5
	.word	0x1108d057	! t0_kref+0x2aa8:   	sethi	%hi(0x23415c00), %o0
	.word	0xe91fbc90	! t0_kref+0x2aac:   	ldd	[%fp - 0x370], %f20
	.word	0x93a608ac	! t0_kref+0x2ab0:   	fsubs	%f24, %f12, %f9
	.word	0xd020a028	! t0_kref+0x2ab4:   	st	%o0, [%g2 + 0x28]
	.word	0xac5a800c	! t0_kref+0x2ab8:   	smul	%o2, %o4, %l6
	.word	0xd6560000	! t0_kref+0x2abc:   	ldsh	[%i0], %o3
	.word	0xac7e801a	! t0_kref+0x2ac0:   	sdiv	%i2, %i2, %l6
	call	SYM(t0_subr1)
	.word	0xe81e7ff8	! t0_kref+0x2ac8:   	ldd	[%i1 - 8], %l4
	.word	0xf1ee101d	! t0_kref+0x2acc:   	prefetcha	%i0 + %i5, 24
	.word	0x94b7000c	! t0_kref+0x2ad0:   	orncc	%i4, %o4, %o2
	.word	0xaab367a2	! t0_kref+0x2ad4:   	orncc	%o5, 0x7a2, %l5
	.word	0xd048a00d	! t0_kref+0x2ad8:   	ldsb	[%g2 + 0xd], %o0
	.word	0xaac234e6	! t0_kref+0x2adc:   	addccc	%o0, -0xb1a, %l5
	.word	0xde08a02b	! t0_kref+0x2ae0:   	ldub	[%g2 + 0x2b], %o7
	.word	0x37480002	! t0_kref+0x2ae4:   	fbge,a,pt	%fcc0, _kref+0x2aec
	.word	0xc5b81019	! t0_kref+0x2ae8:   	stda	%f2, [%g0 + %i1]0x80
	.word	0x97a01887	! t0_kref+0x2aec:   	fitos	%f7, %f11
	.word	0xa6b5f383	! t0_kref+0x2af0:   	orncc	%l7, -0xc7d, %l3
	.word	0x9da489af	! t0_kref+0x2af4:   	fdivs	%f18, %f15, %f14
	.word	0x9da0882c	! t0_kref+0x2af8:   	fadds	%f2, %f12, %f14
	.word	0x9296c00b	! t0_kref+0x2afc:   	orcc	%i3, %o3, %o1
	.word	0xd810a03a	! t0_kref+0x2b00:   	lduh	[%g2 + 0x3a], %o4
	.word	0x9de3bfa0	! t0_kref+0x2b04:   	save	%sp, -0x60, %sp
	.word	0x97ee7e10	! t0_kref+0x2b08:   	restore	%i1, -0x1f0, %o3
	.word	0x9656c008	! t0_kref+0x2b0c:   	umul	%i3, %o0, %o3
	.word	0xe11fbf98	! t0_kref+0x2b10:   	ldd	[%fp - 0x68], %f16
	.word	0xc13e3fe0	! t0_kref+0x2b14:   	std	%f0, [%i0 - 0x20]
	.word	0xd0b81019	! t0_kref+0x2b18:   	stda	%o0, [%g0 + %i1]0x80
	.word	0x86102004	! t0_kref+0x2b1c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2b20:   	bne,a	_kref+0x2b20
	.word	0x86a0e001	! t0_kref+0x2b24:   	subcc	%g3, 1, %g3
	.word	0xc51fbf98	! t0_kref+0x2b28:   	ldd	[%fp - 0x68], %f2
	.word	0x90103093	! t0_kref+0x2b2c:   	mov	0xfffff093, %o0
	.word	0xd420a008	! t0_kref+0x2b30:   	st	%o2, [%g2 + 8]
	.word	0x87a01881	! t0_kref+0x2b34:   	fitos	%f1, %f3
	.word	0x9f25c00b	! t0_kref+0x2b38:   	mulscc	%l7, %o3, %o7
	.word	0x39800003	! t0_kref+0x2b3c:   	fbuge,a	_kref+0x2b48
	.word	0xa612a691	! t0_kref+0x2b40:   	or	%o2, 0x691, %l3
	.word	0x81a9ca2f	! t0_kref+0x2b44:   	fcmps	%fcc0, %f7, %f15
	.word	0xb8103ff0	! t0_kref+0x2b48:   	mov	0xfffffff0, %i4
	.word	0x9fc00004	! t0_kref+0x2b4c:   	call	%g0 + %g4
	.word	0x95a04839	! t0_kref+0x2b50:   	fadds	%f1, %f25, %f10
	.word	0x9a2de3df	! t0_kref+0x2b54:   	andn	%l7, 0x3df, %o5
	.word	0x929b4000	! t0_kref+0x2b58:   	xorcc	%o5, %g0, %o1
	.word	0x9aa82da6	! t0_kref+0x2b5c:   	andncc	%g0, 0xda6, %o5
	.word	0x9b418000	! t0_kref+0x2b60:   	mov	%fprs, %o5
	.word	0xb1a38950	! t0_kref+0x2b64:   	fmuld	%f14, %f16, %f24
	.word	0xc5267ff0	! t0_kref+0x2b68:   	st	%f2, [%i1 - 0x10]
	.word	0x81da380c	! t0_kref+0x2b6c:   	flush	%o0 - 0x7f4
	.word	0x27800001	! t0_kref+0x2b70:   	fbul,a	_kref+0x2b74
	.word	0xa61b4017	! t0_kref+0x2b74:   	xor	%o5, %l7, %l3
	.word	0xd628a03a	! t0_kref+0x2b78:   	stb	%o3, [%g2 + 0x3a]
	.word	0x2d09c639	! t0_kref+0x2b7c:   	sethi	%hi(0x2718e400), %l6
	.word	0xf56e7fe8	! t0_kref+0x2b80:   	prefetch	%i1 - 0x18, 26
	.word	0xe64e3fe7	! t0_kref+0x2b84:   	ldsb	[%i0 - 0x19], %l3
	.word	0x908b614e	! t0_kref+0x2b88:   	andcc	%o5, 0x14e, %o0
	.word	0xab400000	! t0_kref+0x2b8c:   	mov	%y, %l5
	.word	0x9ba00529	! t0_kref+0x2b90:   	fsqrts	%f9, %f13
	.word	0xae103643	! t0_kref+0x2b94:   	mov	0xfffff643, %l7
	.word	0x35800008	! t0_kref+0x2b98:   	fbue,a	_kref+0x2bb8
	.word	0xe41e401d	! t0_kref+0x2b9c:   	ldd	[%i1 + %i5], %l2
	.word	0xee48a01a	! t0_kref+0x2ba0:   	ldsb	[%g2 + 0x1a], %l7
	.word	0x21800002	! t0_kref+0x2ba4:   	fbn,a	_kref+0x2bac
	.word	0xda40a024	! t0_kref+0x2ba8:   	ldsw	[%g2 + 0x24], %o5
	.word	0x81a94aad	! t0_kref+0x2bac:   	fcmpes	%fcc0, %f5, %f13
	.word	0xd010a038	! t0_kref+0x2bb0:   	lduh	[%g2 + 0x38], %o0
	.word	0xd24e6016	! t0_kref+0x2bb4:   	ldsb	[%i1 + 0x16], %o1
	.word	0xb5a01915	! t0_kref+0x2bb8:   	fitod	%f21, %f26
	.word	0xda280019	! t0_kref+0x2bbc:   	stb	%o5, [%g0 + %i1]
	.word	0xd64e8018	! t0_kref+0x2bc0:   	ldsb	[%i2 + %i0], %o3
	.word	0x11226ac7	! t0_kref+0x2bc4:   	sethi	%hi(0x89ab1c00), %o0
	.word	0xf5ee101c	! t0_kref+0x2bc8:   	prefetcha	%i0 + %i4, 26
	.word	0xe600a008	! t0_kref+0x2bcc:   	ld	[%g2 + 8], %l3
	.word	0xacb2b233	! t0_kref+0x2bd0:   	orncc	%o2, -0xdcd, %l6
	.word	0x92b2800c	! t0_kref+0x2bd4:   	orncc	%o2, %o4, %o1
	.word	0x001fffff	! t0_kref+0x2bd8:   	illtrap	0x1fffff
	.word	0x85a50944	! t0_kref+0x2bdc:   	fmuld	%f20, %f4, %f2
	.word	0xd6064000	! t0_kref+0x2be0:   	ld	[%i1], %o3
	call	SYM(t0_subr2)
	.word	0x97400000	! t0_kref+0x2be8:   	mov	%y, %o3
	.word	0x981b0000	! t0_kref+0x2bec:   	xor	%o4, %g0, %o4
	.word	0x86102006	! t0_kref+0x2bf0:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x2bf4:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x2bf8:   	be,a	_kref+0x2c24
	.word	0x948f0000	! t0_kref+0x2bfc:   	andcc	%i4, %g0, %o2
	.word	0xac26f224	! t0_kref+0x2c00:   	sub	%i3, -0xddc, %l6
	.word	0x960dc000	! t0_kref+0x2c04:   	and	%l7, %g0, %o3
	.word	0xada0052c	! t0_kref+0x2c08:   	fsqrts	%f12, %f22
	.word	0x9ac33656	! t0_kref+0x2c0c:   	addccc	%o4, -0x9aa, %o5
	.word	0xe520a00c	! t0_kref+0x2c10:   	st	%f18, [%g2 + 0xc]
	.word	0x9f28001a	! t0_kref+0x2c14:   	sll	%g0, %i2, %o7
	.word	0xe11fbd80	! t0_kref+0x2c18:   	ldd	[%fp - 0x280], %f16
	.word	0xa8fab6cb	! t0_kref+0x2c1c:   	sdivcc	%o2, -0x935, %l4
	.word	0xe3b8a040	! t0_kref+0x2c20:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81ab8a54	! t0_kref+0x2c24:   	fcmpd	%fcc0, %f14, %f20
	.word	0x86102003	! t0_kref+0x2c28:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x2c2c:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x2c30:   	be,a	_kref+0x2ca4
	.word	0xb1a01a2a	! t0_kref+0x2c34:   	fstoi	%f10, %f24
	.word	0xf1ee101c	! t0_kref+0x2c38:   	prefetcha	%i0 + %i4, 24
	.word	0x9133600f	! t0_kref+0x2c3c:   	srl	%o5, 0xf, %o0
	.word	0xc030a012	! t0_kref+0x2c40:   	clrh	[%g2 + 0x12]
	.word	0x254ffffa	! t0_kref+0x2c44:   	fblg,a,pt	%fcc0, _kref+0x2c2c
	.word	0xada01a48	! t0_kref+0x2c48:   	fdtoi	%f8, %f22
	.word	0xba103fe0	! t0_kref+0x2c4c:   	mov	0xffffffe0, %i5
	.word	0xafa189a3	! t0_kref+0x2c50:   	fdivs	%f6, %f3, %f23
	.word	0x99a01a3b	! t0_kref+0x2c54:   	fstoi	%f27, %f12
	.word	0xeec6101c	! t0_kref+0x2c58:   	ldswa	[%i0 + %i4]0x80, %l7
	call	SYM(t0_subr2)
	.word	0xf007bfe0	! t0_kref+0x2c60:   	ld	[%fp - 0x20], %i0
	.word	0xee48a03e	! t0_kref+0x2c64:   	ldsb	[%g2 + 0x3e], %l7
	.word	0x81a0012f	! t0_kref+0x2c68:   	fabss	%f15, %f0
	.word	0x9b33400b	! t0_kref+0x2c6c:   	srl	%o5, %o3, %o5
	.word	0x9eb5c00a	! t0_kref+0x2c70:   	orncc	%l7, %o2, %o7
	.word	0xa5a01a39	! t0_kref+0x2c74:   	fstoi	%f25, %f18
	.word	0x8da508d6	! t0_kref+0x2c78:   	fsubd	%f20, %f22, %f6
	.word	0x39bfffec	! t0_kref+0x2c7c:   	fbuge,a	_kref+0x2c2c
	.word	0x900b2f0e	! t0_kref+0x2c80:   	and	%o4, 0xf0e, %o0
	.word	0xc56e3ff8	! t0_kref+0x2c84:   	prefetch	%i0 - 8, 2
	.word	0x81da314f	! t0_kref+0x2c88:   	flush	%o0 - 0xeb1
	.word	0x99a64d21	! t0_kref+0x2c8c:   	fsmuld	%f25, %f1, %f12
	.word	0xae3b27d5	! t0_kref+0x2c90:   	xnor	%o4, 0x7d5, %l7
	.word	0xd67e6008	! t0_kref+0x2c94:   	swap	[%i1 + 8], %o3
	.word	0xc807bfec	! t0_kref+0x2c98:   	ld	[%fp - 0x14], %g4
	.word	0xf828a02e	! t0_kref+0x2c9c:   	stb	%i4, [%g2 + 0x2e]
	.word	0xac5b626d	! t0_kref+0x2ca0:   	smul	%o5, 0x26d, %l6
	.word	0x9e427845	! t0_kref+0x2ca4:   	addc	%o1, -0x7bb, %o7
	.word	0xd608a015	! t0_kref+0x2ca8:   	ldub	[%g2 + 0x15], %o3
	.word	0x9896c01c	! t0_kref+0x2cac:   	orcc	%i3, %i4, %o4
	.word	0x85a08d3a	! t0_kref+0x2cb0:   	fsmuld	%f2, %f26, %f2
	.word	0xa823000a	! t0_kref+0x2cb4:   	sub	%o4, %o2, %l4
	.word	0x962a400d	! t0_kref+0x2cb8:   	andn	%o1, %o5, %o3
	.word	0x30800005	! t0_kref+0x2cbc:   	ba,a	_kref+0x2cd0
	.word	0xec0e401a	! t0_kref+0x2cc0:   	ldub	[%i1 + %i2], %l6
	.word	0xf36e401c	! t0_kref+0x2cc4:   	prefetch	%i1 + %i4, 25
	.word	0x906229df	! t0_kref+0x2cc8:   	subc	%o0, 0x9df, %o0
	.word	0xd078001c	! t0_kref+0x2ccc:   	swap	[%g0 + %i4], %o0
	.word	0xac82c00a	! t0_kref+0x2cd0:   	addcc	%o3, %o2, %l6
	.word	0x36800004	! t0_kref+0x2cd4:   	bge,a	_kref+0x2ce4
	.word	0xa3a34933	! t0_kref+0x2cd8:   	fmuls	%f13, %f19, %f17
	.word	0xa7400000	! t0_kref+0x2cdc:   	mov	%y, %l3
	call	SYM(t0_subr1)
	.word	0xd24e001a	! t0_kref+0x2ce4:   	ldsb	[%i0 + %i2], %o1
	.word	0xc900a000	! t0_kref+0x2ce8:   	ld	[%g2], %f4
	.word	0x81a9ca25	! t0_kref+0x2cec:   	fcmps	%fcc0, %f7, %f5
	.word	0x81accaac	! t0_kref+0x2cf0:   	fcmpes	%fcc0, %f19, %f12
	.word	0x81a0104e	! t0_kref+0x2cf4:   	fdtox	%f14, %f0
	.word	0xa6fb3b18	! t0_kref+0x2cf8:   	sdivcc	%o4, -0x4e8, %l3
	.word	0xacdb001c	! t0_kref+0x2cfc:   	smulcc	%o4, %i4, %l6
	.word	0x39480002	! t0_kref+0x2d00:   	fbuge,a,pt	%fcc0, _kref+0x2d08
	.word	0x983ec00a	! t0_kref+0x2d04:   	xnor	%i3, %o2, %o4
	.word	0xee4e3ffa	! t0_kref+0x2d08:   	ldsb	[%i0 - 6], %l7
	.word	0xe16e2000	! t0_kref+0x2d0c:   	prefetch	%i0, 16
	.word	0xb1a4085a	! t0_kref+0x2d10:   	faddd	%f16, %f26, %f24
	.word	0xd91f4019	! t0_kref+0x2d14:   	ldd	[%i5 + %i1], %f12
	.word	0xa88ea843	! t0_kref+0x2d18:   	andcc	%i2, 0x843, %l4
	.word	0xe3b8a040	! t0_kref+0x2d1c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd6767fe0	! t0_kref+0x2d20:   	stx	%o3, [%i1 - 0x20]
	.word	0xaa9f001b	! t0_kref+0x2d24:   	xorcc	%i4, %i3, %l5
	.word	0xe11fbe70	! t0_kref+0x2d28:   	ldd	[%fp - 0x190], %f16
	.word	0xa8083235	! t0_kref+0x2d2c:   	and	%g0, -0xdcb, %l4
	.word	0x27480007	! t0_kref+0x2d30:   	fbul,a,pt	%fcc0, _kref+0x2d4c
	.word	0xd8163fec	! t0_kref+0x2d34:   	lduh	[%i0 - 0x14], %o4
	.word	0x9646a7e0	! t0_kref+0x2d38:   	addc	%i2, 0x7e0, %o3
	.word	0x81a00038	! t0_kref+0x2d3c:   	fmovs	%f24, %f0
	.word	0xf16e6018	! t0_kref+0x2d40:   	prefetch	%i1 + 0x18, 24
	.word	0xd808a022	! t0_kref+0x2d44:   	ldub	[%g2 + 0x22], %o4
	.word	0x9a1b0008	! t0_kref+0x2d48:   	xor	%o4, %o0, %o5
	.word	0xd6100018	! t0_kref+0x2d4c:   	lduh	[%g0 + %i0], %o3
	.word	0x81aa0a5a	! t0_kref+0x2d50:   	fcmpd	%fcc0, %f8, %f26
	.word	0x81a00536	! t0_kref+0x2d54:   	fsqrts	%f22, %f0
	.word	0xd9be501d	! t0_kref+0x2d58:   	stda	%f12, [%i1 + %i5]0x80
	.word	0x87a00021	! t0_kref+0x2d5c:   	fmovs	%f1, %f3
	.word	0x33800002	! t0_kref+0x2d60:   	fbe,a	_kref+0x2d68
	.word	0x9026fd60	! t0_kref+0x2d64:   	sub	%i3, -0x2a0, %o0
	.word	0x8da01885	! t0_kref+0x2d68:   	fitos	%f5, %f6
	.word	0xd93e3fe8	! t0_kref+0x2d6c:   	std	%f12, [%i0 - 0x18]
	.word	0x3b800004	! t0_kref+0x2d70:   	fble,a	_kref+0x2d80
	.word	0xa6e6f248	! t0_kref+0x2d74:   	subccc	%i3, -0xdb8, %l3
	.word	0xada0105a	! t0_kref+0x2d78:   	fdtox	%f26, %f22
	.word	0xab400000	! t0_kref+0x2d7c:   	mov	%y, %l5
	.word	0x85a00527	! t0_kref+0x2d80:   	fsqrts	%f7, %f2
	.word	0xb7a189ad	! t0_kref+0x2d84:   	fdivs	%f6, %f13, %f27
	.word	0xea48a02f	! t0_kref+0x2d88:   	ldsb	[%g2 + 0x2f], %l5
	.word	0xee7e7fe8	! t0_kref+0x2d8c:   	swap	[%i1 - 0x18], %l7
	.word	0x94034009	! t0_kref+0x2d90:   	add	%o5, %o1, %o2
	.word	0xc0ae1000	! t0_kref+0x2d94:   	stba	%g0, [%i0]0x80
	.word	0x9e56f333	! t0_kref+0x2d98:   	umul	%i3, -0xccd, %o7
	.word	0x988ac00d	! t0_kref+0x2d9c:   	andcc	%o3, %o5, %o4
	.word	0xaa15c017	! t0_kref+0x2da0:   	or	%l7, %l7, %l5
	.word	0x9aadc00c	! t0_kref+0x2da4:   	andncc	%l7, %o4, %o5
	.word	0x87a000bb	! t0_kref+0x2da8:   	fnegs	%f27, %f3
	.word	0x9a8a2e0b	! t0_kref+0x2dac:   	andcc	%o0, 0xe0b, %o5
	.word	0xee881018	! t0_kref+0x2db0:   	lduba	[%g0 + %i0]0x80, %l7
	.word	0xa1a01918	! t0_kref+0x2db4:   	fitod	%f24, %f16
	.word	0xa9400000	! t0_kref+0x2db8:   	mov	%y, %l4
	.word	0xd8a65000	! t0_kref+0x2dbc:   	sta	%o4, [%i1]0x80
	.word	0xec48a02c	! t0_kref+0x2dc0:   	ldsb	[%g2 + 0x2c], %l6
	.word	0xa9a018da	! t0_kref+0x2dc4:   	fdtos	%f26, %f20
	.word	0xb1a4894e	! t0_kref+0x2dc8:   	fmuld	%f18, %f14, %f24
	.word	0x91a60931	! t0_kref+0x2dcc:   	fmuls	%f24, %f17, %f8
	.word	0xaf22800c	! t0_kref+0x2dd0:   	mulscc	%o2, %o4, %l7
	.word	0x9fa01a36	! t0_kref+0x2dd4:   	fstoi	%f22, %f15
	.word	0x87a1883b	! t0_kref+0x2dd8:   	fadds	%f6, %f27, %f3
	.word	0x9222b8f6	! t0_kref+0x2ddc:   	sub	%o2, -0x70a, %o1
	.word	0xdb26600c	! t0_kref+0x2de0:   	st	%f13, [%i1 + 0xc]
	.word	0x989b3a82	! t0_kref+0x2de4:   	xorcc	%o4, -0x57e, %o4
	.word	0xa5a0052d	! t0_kref+0x2de8:   	fsqrts	%f13, %f18
	.word	0x9e12c000	! t0_kref+0x2dec:   	or	%o3, %g0, %o7
	.word	0x925eb838	! t0_kref+0x2df0:   	smul	%i2, -0x7c8, %o1
	.word	0x908a801c	! t0_kref+0x2df4:   	andcc	%o2, %i4, %o0
	.word	0x9de3bfa0	! t0_kref+0x2df8:   	save	%sp, -0x60, %sp
	.word	0xb2aef423	! t0_kref+0x2dfc:   	andncc	%i3, -0xbdd, %i1
	.word	0xafef732b	! t0_kref+0x2e00:   	restore	%i5, -0xcd5, %l7
	.word	0x30800003	! t0_kref+0x2e04:   	ba,a	_kref+0x2e10
	.word	0x8da109b6	! t0_kref+0x2e08:   	fdivs	%f4, %f22, %f6
	.word	0xc807bfe4	! t0_kref+0x2e0c:   	ld	[%fp - 0x1c], %g4
	.word	0xae56800c	! t0_kref+0x2e10:   	umul	%i2, %o4, %l7
	.word	0xc568a00a	! t0_kref+0x2e14:   	prefetch	%g2 + 0xa, 2
	.word	0xd440a004	! t0_kref+0x2e18:   	ldsw	[%g2 + 4], %o2
	.word	0xe8180019	! t0_kref+0x2e1c:   	ldd	[%g0 + %i1], %l4
	.word	0xac7a800a	! t0_kref+0x2e20:   	sdiv	%o2, %o2, %l6
	.word	0x81ae0aa3	! t0_kref+0x2e24:   	fcmpes	%fcc0, %f24, %f3
	.word	0xae72000d	! t0_kref+0x2e28:   	udiv	%o0, %o5, %l7
	.word	0x8610200d	! t0_kref+0x2e2c:   	mov	0xd, %g3
	.word	0x86a0e001	! t0_kref+0x2e30:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x2e34:   	be,a	_kref+0x2e60
	.word	0x9b32a01b	! t0_kref+0x2e38:   	srl	%o2, 0x1b, %o5
	.word	0x19116037	! t0_kref+0x2e3c:   	sethi	%hi(0x4580dc00), %o4
	.word	0x9226c01b	! t0_kref+0x2e40:   	sub	%i3, %i3, %o1
	.word	0x2bbffffb	! t0_kref+0x2e44:   	fbug,a	_kref+0x2e30
	.word	0x81dbea9e	! t0_kref+0x2e48:   	flush	%o7 + 0xa9e
	.word	0x81ac8a4a	! t0_kref+0x2e4c:   	fcmpd	%fcc0, %f18, %f10
	.word	0xaba0012a	! t0_kref+0x2e50:   	fabss	%f10, %f21
	.word	0x91400000	! t0_kref+0x2e54:   	mov	%y, %o0
	.word	0xd636401b	! t0_kref+0x2e58:   	sth	%o3, [%i1 + %i3]
	.word	0xe6167ffc	! t0_kref+0x2e5c:   	lduh	[%i1 - 4], %l3
	.word	0x8da01040	! t0_kref+0x2e60:   	fdtox	%f0, %f6
	.word	0x9292000b	! t0_kref+0x2e64:   	orcc	%o0, %o3, %o1
	.word	0xb5a018c4	! t0_kref+0x2e68:   	fdtos	%f4, %f26
	.word	0x39800005	! t0_kref+0x2e6c:   	fbuge,a	_kref+0x2e80
	.word	0x81a4492f	! t0_kref+0x2e70:   	fmuls	%f17, %f15, %f0
	.word	0x31480007	! t0_kref+0x2e74:   	fba,a,pt	%fcc0, _kref+0x2e90
	.word	0xd41e401d	! t0_kref+0x2e78:   	ldd	[%i1 + %i5], %o2
	.word	0x81aa4ab2	! t0_kref+0x2e7c:   	fcmpes	%fcc0, %f9, %f18
	.word	0xde4e2019	! t0_kref+0x2e80:   	ldsb	[%i0 + 0x19], %o7
	.word	0xca20001c	! t0_kref+0x2e84:   	st	%g5, [%g0 + %i4]
	.word	0x1319ae47	! t0_kref+0x2e88:   	sethi	%hi(0x66b91c00), %o1
	.word	0xac52a032	! t0_kref+0x2e8c:   	umul	%o2, 0x32, %l6
	.word	0x95400000	! t0_kref+0x2e90:   	mov	%y, %o2
	.word	0xb5a6884a	! t0_kref+0x2e94:   	faddd	%f26, %f10, %f26
	.word	0xee30a028	! t0_kref+0x2e98:   	sth	%l7, [%g2 + 0x28]
	.word	0x89a109ac	! t0_kref+0x2e9c:   	fdivs	%f4, %f12, %f4
	.word	0x961b2b54	! t0_kref+0x2ea0:   	xor	%o4, 0xb54, %o3
	.word	0xa656801b	! t0_kref+0x2ea4:   	umul	%i2, %i3, %l3
	.word	0x9ba000af	! t0_kref+0x2ea8:   	fnegs	%f15, %f13
	.word	0x93400000	! t0_kref+0x2eac:   	mov	%y, %o1
	.word	0xab2f0008	! t0_kref+0x2eb0:   	sll	%i4, %o0, %l5
	.word	0x191ee6a5	! t0_kref+0x2eb4:   	sethi	%hi(0x7b9a9400), %o4
	.word	0xa5a648a3	! t0_kref+0x2eb8:   	fsubs	%f25, %f3, %f18
	.word	0xacab72bc	! t0_kref+0x2ebc:   	andncc	%o5, -0xd44, %l6
	.word	0xe64e4000	! t0_kref+0x2ec0:   	ldsb	[%i1], %l3
	.word	0xf207bfe0	! t0_kref+0x2ec4:   	ld	[%fp - 0x20], %i1
	.word	0xeeae1000	! t0_kref+0x2ec8:   	stba	%l7, [%i0]0x80
	.word	0xa9a008d6	! t0_kref+0x2ecc:   	fsubd	%f0, %f22, %f20
	.word	0xd220a028	! t0_kref+0x2ed0:   	st	%o1, [%g2 + 0x28]
	.word	0x9495f00b	! t0_kref+0x2ed4:   	orcc	%l7, -0xff5, %o2
	.word	0x9ba609b2	! t0_kref+0x2ed8:   	fdivs	%f24, %f18, %f13
	.word	0xec50a01e	! t0_kref+0x2edc:   	ldsh	[%g2 + 0x1e], %l6
	.word	0xaf2a0008	! t0_kref+0x2ee0:   	sll	%o0, %o0, %l7
	.word	0x35480007	! t0_kref+0x2ee4:   	fbue,a,pt	%fcc0, _kref+0x2f00
	.word	0xd60e2013	! t0_kref+0x2ee8:   	ldub	[%i0 + 0x13], %o3
	.word	0x91a488da	! t0_kref+0x2eec:   	fsubd	%f18, %f26, %f8
	.word	0xac5dc00b	! t0_kref+0x2ef0:   	smul	%l7, %o3, %l6
	.word	0xe51fbe48	! t0_kref+0x2ef4:   	ldd	[%fp - 0x1b8], %f18
	.word	0x94dae74a	! t0_kref+0x2ef8:   	smulcc	%o3, 0x74a, %o2
	.word	0xd0470018	! t0_kref+0x2efc:   	ldsw	[%i4 + %i0], %o0
	.word	0xae0b2ace	! t0_kref+0x2f00:   	and	%o4, 0xace, %l7
	.word	0xab22f30c	! t0_kref+0x2f04:   	mulscc	%o3, -0xcf4, %l5
	.word	0xab400000	! t0_kref+0x2f08:   	mov	%y, %l5
	.word	0x8da00536	! t0_kref+0x2f0c:   	fsqrts	%f22, %f6
	.word	0x95a508c0	! t0_kref+0x2f10:   	fsubd	%f20, %f0, %f10
	.word	0xd51fbc68	! t0_kref+0x2f14:   	ldd	[%fp - 0x398], %f10
	.word	0x96468000	! t0_kref+0x2f18:   	addc	%i2, %g0, %o3
	.word	0xaa222082	! t0_kref+0x2f1c:   	sub	%o0, 0x82, %l5
	.word	0xa8923d4e	! t0_kref+0x2f20:   	orcc	%o0, -0x2b2, %l4
	.word	0x988a215a	! t0_kref+0x2f24:   	andcc	%o0, 0x15a, %o4
	.word	0xaaaa6151	! t0_kref+0x2f28:   	andncc	%o1, 0x151, %l5
	.word	0x9a726629	! t0_kref+0x2f2c:   	udiv	%o1, 0x629, %o5
	.word	0xaec276e4	! t0_kref+0x2f30:   	addccc	%o1, -0x91c, %l7
	.word	0x9643001a	! t0_kref+0x2f34:   	addc	%o4, %i2, %o3
	.word	0xd11fbf00	! t0_kref+0x2f38:   	ldd	[%fp - 0x100], %f8
	.word	0x81ab8a4a	! t0_kref+0x2f3c:   	fcmpd	%fcc0, %f14, %f10
	.word	0xb1a6c822	! t0_kref+0x2f40:   	fadds	%f27, %f2, %f24
	.word	0xeb262014	! t0_kref+0x2f44:   	st	%f21, [%i0 + 0x14]
	.word	0x8da68821	! t0_kref+0x2f48:   	fadds	%f26, %f1, %f6
	.word	0x31480006	! t0_kref+0x2f4c:   	fba,a,pt	%fcc0, _kref+0x2f64
	.word	0xb5a608d0	! t0_kref+0x2f50:   	fsubd	%f24, %f16, %f26
	.word	0x81ab0aa5	! t0_kref+0x2f54:   	fcmpes	%fcc0, %f12, %f5
	.word	0x988a2475	! t0_kref+0x2f58:   	andcc	%o0, 0x475, %o4
	.word	0xf4262000	! t0_kref+0x2f5c:   	st	%i2, [%i0]
	.word	0xc320a00c	! t0_kref+0x2f60:   	st	%f1, [%g2 + 0xc]
	.word	0xaba00521	! t0_kref+0x2f64:   	fsqrts	%f1, %f21
	.word	0x31800005	! t0_kref+0x2f68:   	fba,a	_kref+0x2f7c
	.word	0x932dc00b	! t0_kref+0x2f6c:   	sll	%l7, %o3, %o1
	.word	0x8185c000	! t0_kref+0x2f70:   	wr	%l7, %g0, %y
	.word	0xab06b424	! t0_kref+0x2f74:   	taddcc	%i2, -0xbdc, %l5
	.word	0xb1a109b4	! t0_kref+0x2f78:   	fdivs	%f4, %f20, %f24
	call	SYM(t0_subr0)
	.word	0xda267fe4	! t0_kref+0x2f80:   	st	%o5, [%i1 - 0x1c]
	.word	0xa8626a7a	! t0_kref+0x2f84:   	subc	%o1, 0xa7a, %l4
	.word	0x83a54821	! t0_kref+0x2f88:   	fadds	%f21, %f1, %f1
	.word	0x926034fd	! t0_kref+0x2f8c:   	subc	%g0, -0xb03, %o1
	.word	0xe91e4000	! t0_kref+0x2f90:   	ldd	[%i1], %f20
	.word	0x001fffff	! t0_kref+0x2f94:   	illtrap	0x1fffff
	.word	0xf36e6018	! t0_kref+0x2f98:   	prefetch	%i1 + 0x18, 25
	.word	0xc0f65000	! t0_kref+0x2f9c:   	stxa	%g0, [%i1]0x80
	.word	0x89a209a7	! t0_kref+0x2fa0:   	fdivs	%f8, %f7, %f4
	.word	0x3d800003	! t0_kref+0x2fa4:   	fbule,a	_kref+0x2fb0
	.word	0xf630a038	! t0_kref+0x2fa8:   	sth	%i3, [%g2 + 0x38]
	.word	0xd810a03c	! t0_kref+0x2fac:   	lduh	[%g2 + 0x3c], %o4
	.word	0x85a01881	! t0_kref+0x2fb0:   	fitos	%f1, %f2
	.word	0x92e0001c	! t0_kref+0x2fb4:   	subccc	%g0, %i4, %o1
	.word	0xab2b600c	! t0_kref+0x2fb8:   	sll	%o5, 0xc, %l5
	.word	0xa5a00130	! t0_kref+0x2fbc:   	fabss	%f16, %f18
	.word	0x9b400000	! t0_kref+0x2fc0:   	mov	%y, %o5
	.word	0xf100a024	! t0_kref+0x2fc4:   	ld	[%g2 + 0x24], %f24
	.word	0xd228a00b	! t0_kref+0x2fc8:   	stb	%o1, [%g2 + 0xb]
	.word	0xea164000	! t0_kref+0x2fcc:   	lduh	[%i1], %l5
	.word	0x81ac8a5a	! t0_kref+0x2fd0:   	fcmpd	%fcc0, %f18, %f26
	.word	0xaa1aa63f	! t0_kref+0x2fd4:   	xor	%o2, 0x63f, %l5
	.word	0x37480002	! t0_kref+0x2fd8:   	fbge,a,pt	%fcc0, _kref+0x2fe0
	.word	0xa7a01084	! t0_kref+0x2fdc:   	fxtos	%f4, %f19
	.word	0x31480005	! t0_kref+0x2fe0:   	fba,a,pt	%fcc0, _kref+0x2ff4
	.word	0xd91fbd90	! t0_kref+0x2fe4:   	ldd	[%fp - 0x270], %f12
	.word	0xb3a000ba	! t0_kref+0x2fe8:   	fnegs	%f26, %f25
	.word	0xee262000	! t0_kref+0x2fec:   	st	%l7, [%i0]
	.word	0xaed3001a	! t0_kref+0x2ff0:   	umulcc	%o4, %i2, %l7
	.word	0x989a000d	! t0_kref+0x2ff4:   	xorcc	%o0, %o5, %o4
	.word	0x87a01a34	! t0_kref+0x2ff8:   	fstoi	%f20, %f3
	.word	0x9602c017	! t0_kref+0x2ffc:   	add	%o3, %l7, %o3
	.word	0x39480001	! t0_kref+0x3000:   	fbuge,a,pt	%fcc0, _kref+0x3004
	.word	0xa3a000af	! t0_kref+0x3004:   	fnegs	%f15, %f17
	.word	0xafa60928	! t0_kref+0x3008:   	fmuls	%f24, %f8, %f23
	.word	0xedee101b	! t0_kref+0x300c:   	prefetcha	%i0 + %i3, 22
	.word	0xae8f3515	! t0_kref+0x3010:   	andcc	%i4, -0xaeb, %l7
	.word	0x92936c32	! t0_kref+0x3014:   	orcc	%o5, 0xc32, %o1
	.word	0xd850a030	! t0_kref+0x3018:   	ldsh	[%g2 + 0x30], %o4
	.word	0xd9be584d	! t0_kref+0x301c:   	stda	%f12, [%i1 + %o5]0xc2
	.word	0xa9a44931	! t0_kref+0x3020:   	fmuls	%f17, %f17, %f20
	.word	0xec96d019	! t0_kref+0x3024:   	lduha	[%i3 + %i1]0x80, %l6
	.word	0xda080019	! t0_kref+0x3028:   	ldub	[%g0 + %i1], %o5
	.word	0xaa96800d	! t0_kref+0x302c:   	orcc	%i2, %o5, %l5
	.word	0xa1a6894a	! t0_kref+0x3030:   	fmuld	%f26, %f10, %f16
	.word	0x112b2715	! t0_kref+0x3034:   	sethi	%hi(0xac9c5400), %o0
	.word	0xf207bfe0	! t0_kref+0x3038:   	ld	[%fp - 0x20], %i1
	.word	0xda762000	! t0_kref+0x303c:   	stx	%o5, [%i0]
	.word	0xe6166002	! t0_kref+0x3040:   	lduh	[%i1 + 2], %l3
	.word	0x99a6c922	! t0_kref+0x3044:   	fmuls	%f27, %f2, %f12
	.word	0x9293000a	! t0_kref+0x3048:   	orcc	%o4, %o2, %o1
	.word	0x988ec00d	! t0_kref+0x304c:   	andcc	%i3, %o5, %o4
	.word	0x99a018d8	! t0_kref+0x3050:   	fdtos	%f24, %f12
	.word	0xa6d32681	! t0_kref+0x3054:   	umulcc	%o4, 0x681, %l3
	.word	0xe64e3ff5	! t0_kref+0x3058:   	ldsb	[%i0 - 0xb], %l3
	.word	0xa87a401a	! t0_kref+0x305c:   	sdiv	%o1, %i2, %l4
	.word	0xed6e7fe0	! t0_kref+0x3060:   	prefetch	%i1 - 0x20, 22
	.word	0x85a208c4	! t0_kref+0x3064:   	fsubd	%f8, %f4, %f2
	.word	0x81ad4a36	! t0_kref+0x3068:   	fcmps	%fcc0, %f21, %f22
	.word	0x91a188da	! t0_kref+0x306c:   	fsubd	%f6, %f26, %f8
	.word	0xde10a022	! t0_kref+0x3070:   	lduh	[%g2 + 0x22], %o7
	.word	0x94c72350	! t0_kref+0x3074:   	addccc	%i4, 0x350, %o2
	.word	0xaa95f398	! t0_kref+0x3078:   	orcc	%l7, -0xc68, %l5
	.word	0xf826001c	! t0_kref+0x307c:   	st	%i4, [%i0 + %i4]
	.word	0xe1ee101a	! t0_kref+0x3080:   	prefetcha	%i0 + %i2, 16
	.word	0x85a689c4	! t0_kref+0x3084:   	fdivd	%f26, %f4, %f2
	.word	0x2c480002	! t0_kref+0x3088:   	bneg,a,pt	%icc, _kref+0x3090
	.word	0xd640a03c	! t0_kref+0x308c:   	ldsw	[%g2 + 0x3c], %o3
	.word	0xaca228f2	! t0_kref+0x3090:   	subcc	%o0, 0x8f2, %l6
	.word	0x35480003	! t0_kref+0x3094:   	fbue,a,pt	%fcc0, _kref+0x30a0
	.word	0x9da4c9ab	! t0_kref+0x3098:   	fdivs	%f19, %f11, %f14
	.word	0x98230009	! t0_kref+0x309c:   	sub	%o4, %o1, %o4
	.word	0xb7a24824	! t0_kref+0x30a0:   	fadds	%f9, %f4, %f27
	.word	0xe41f4019	! t0_kref+0x30a4:   	ldd	[%i5 + %i1], %l2
	.word	0x81ae0a46	! t0_kref+0x30a8:   	fcmpd	%fcc0, %f24, %f6
	.word	0xaa8b001c	! t0_kref+0x30ac:   	andcc	%o4, %i4, %l5
	.word	0x9a62bd7a	! t0_kref+0x30b0:   	subc	%o2, -0x286, %o5
	.word	0x37480008	! t0_kref+0x30b4:   	fbge,a,pt	%fcc0, _kref+0x30d4
	.word	0xd48e1000	! t0_kref+0x30b8:   	lduba	[%i0]0x80, %o2
	.word	0xe7ee101b	! t0_kref+0x30bc:   	prefetcha	%i0 + %i3, 19
	.word	0x9fa608ad	! t0_kref+0x30c0:   	fsubs	%f24, %f13, %f15
	.word	0x33480006	! t0_kref+0x30c4:   	fbe,a,pt	%fcc0, _kref+0x30dc
	.word	0xea6e7fe8	! t0_kref+0x30c8:   	ldstub	[%i1 - 0x18], %l5
	.word	0xd468a02d	! t0_kref+0x30cc:   	ldstub	[%g2 + 0x2d], %o2
	.word	0x192514cf	! t0_kref+0x30d0:   	sethi	%hi(0x94533c00), %o4
	.word	0x91a008d4	! t0_kref+0x30d4:   	fsubd	%f0, %f20, %f8
	.word	0xc126401c	! t0_kref+0x30d8:   	st	%f0, [%i1 + %i4]
	.word	0x83a00131	! t0_kref+0x30dc:   	fabss	%f17, %f1
	.word	0x9e07000a	! t0_kref+0x30e0:   	add	%i4, %o2, %o7
	.word	0x8da408c0	! t0_kref+0x30e4:   	fsubd	%f16, %f0, %f6
	.word	0xe1be185a	! t0_kref+0x30e8:   	stda	%f16, [%i0 + %i2]0xc2
	.word	0xa8e24017	! t0_kref+0x30ec:   	subccc	%o1, %l7, %l4
	.word	0x23480006	! t0_kref+0x30f0:   	fbne,a,pt	%fcc0, _kref+0x3108
	.word	0xada349ab	! t0_kref+0x30f4:   	fdivs	%f13, %f11, %f22
	.word	0x32800005	! t0_kref+0x30f8:   	bne,a	_kref+0x310c
	.word	0x87a01a2b	! t0_kref+0x30fc:   	fstoi	%f11, %f3
	.word	0xcb00a034	! t0_kref+0x3100:   	ld	[%g2 + 0x34], %f5
	.word	0x92520017	! t0_kref+0x3104:   	umul	%o0, %l7, %o1
	.word	0xa8983ebb	! t0_kref+0x3108:   	xorcc	%g0, -0x145, %l4
	.word	0x91a00129	! t0_kref+0x310c:   	fabss	%f9, %f8
	.word	0x81aa0aa4	! t0_kref+0x3110:   	fcmpes	%fcc0, %f8, %f4
	.word	0x1933ddeb	! t0_kref+0x3114:   	sethi	%hi(0xcf77ac00), %o4
	.word	0xab70289a	! t0_kref+0x3118:   	popc	0x89a, %l5
	.word	0x91a6cd32	! t0_kref+0x311c:   	fsmuld	%f27, %f18, %f8
	.word	0x924329c8	! t0_kref+0x3120:   	addc	%o4, 0x9c8, %o1
	.word	0x83a018c4	! t0_kref+0x3124:   	fdtos	%f4, %f1
	.word	0x25480005	! t0_kref+0x3128:   	fblg,a,pt	%fcc0, _kref+0x313c
	.word	0xec1e0000	! t0_kref+0x312c:   	ldd	[%i0], %l6
	.word	0xb1a44836	! t0_kref+0x3130:   	fadds	%f17, %f22, %f24
	.word	0xaba01a25	! t0_kref+0x3134:   	fstoi	%f5, %f21
	.word	0x9693000c	! t0_kref+0x3138:   	orcc	%o4, %o4, %o3
	.word	0xee780018	! t0_kref+0x313c:   	swap	[%g0 + %i0], %l7
	.word	0xaaf0000c	! t0_kref+0x3140:   	udivcc	%g0, %o4, %l5
	.word	0x30800004	! t0_kref+0x3144:   	ba,a	_kref+0x3154
	.word	0xa1a689c8	! t0_kref+0x3148:   	fdivd	%f26, %f8, %f16
	.word	0x912f2019	! t0_kref+0x314c:   	sll	%i4, 0x19, %o0
	.word	0x2b800008	! t0_kref+0x3150:   	fbug,a	_kref+0x3170
	.word	0x9236800d	! t0_kref+0x3154:   	orn	%i2, %o5, %o1
	.word	0xd41e401d	! t0_kref+0x3158:   	ldd	[%i1 + %i5], %o2
	.word	0xee40a020	! t0_kref+0x315c:   	ldsw	[%g2 + 0x20], %l7
	.word	0xe3b8a040	! t0_kref+0x3160:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xf007bfe0	! t0_kref+0x3164:   	ld	[%fp - 0x20], %i0
	.word	0xd200a028	! t0_kref+0x3168:   	ld	[%g2 + 0x28], %o1
	.word	0x3d480008	! t0_kref+0x316c:   	fbule,a,pt	%fcc0, _kref+0x318c
	.word	0xa3a5c930	! t0_kref+0x3170:   	fmuls	%f23, %f16, %f17
	call	SYM(t0_subr1)
	.word	0x9fa00521	! t0_kref+0x3178:   	fsqrts	%f1, %f15
	.word	0xd200a034	! t0_kref+0x317c:   	ld	[%g2 + 0x34], %o1
	.word	0xf720a038	! t0_kref+0x3180:   	st	%f27, [%g2 + 0x38]
	.word	0x9ba189b7	! t0_kref+0x3184:   	fdivs	%f6, %f23, %f13
	.word	0x9f32a015	! t0_kref+0x3188:   	srl	%o2, 0x15, %o7
	.word	0x93418000	! t0_kref+0x318c:   	mov	%fprs, %o1
	sethi	%hi(2f), %o7
	.word	0xe40be1dc	! t0_kref+0x3194:   	ldub	[%o7 + 0x1dc], %l2
	.word	0xa41ca00c	! t0_kref+0x3198:   	xor	%l2, 0xc, %l2
	.word	0xe42be1dc	! t0_kref+0x319c:   	stb	%l2, [%o7 + 0x1dc]
	.word	0x81dbe1dc	! t0_kref+0x31a0:   	flush	%o7 + 0x1dc
	.word	0x33800004	! t0_kref+0x31a4:   	fbe,a	_kref+0x31b4
	.word	0xb1a1884c	! t0_kref+0x31a8:   	faddd	%f6, %f12, %f24
	.word	0x9606a0ad	! t0_kref+0x31ac:   	add	%i2, 0xad, %o3
	.word	0xc91fbc78	! t0_kref+0x31b0:   	ldd	[%fp - 0x388], %f4
	.word	0x81a98aab	! t0_kref+0x31b4:   	fcmpes	%fcc0, %f6, %f11
	.word	0x81aa0ab4	! t0_kref+0x31b8:   	fcmpes	%fcc0, %f8, %f20
	.word	0xd608a001	! t0_kref+0x31bc:   	ldub	[%g2 + 1], %o3
	.word	0xac9a000c	! t0_kref+0x31c0:   	xorcc	%o0, %o4, %l6
	.word	0x912e800b	! t0_kref+0x31c4:   	sll	%i2, %o3, %o0
	.word	0xc9be181c	! t0_kref+0x31c8:   	stda	%f4, [%i0 + %i4]0xc0
	.word	0xa876ae79	! t0_kref+0x31cc:   	udiv	%i2, 0xe79, %l4
	.word	0xd6280018	! t0_kref+0x31d0:   	stb	%o3, [%g0 + %i0]
	.word	0x87a489af	! t0_kref+0x31d4:   	fdivs	%f18, %f15, %f3
	.word	0x98ddc017	! t0_kref+0x31d8:   	smulcc	%l7, %l7, %o4
2:	.word	0xe03e001d	! t0_kref+0x31dc:   	std	%l0, [%i0 + %i5]
	.word	0xc9be1889	! t0_kref+0x31e0:   	stda	%f4, [%i0 + %o1]0xc4
	.word	0xde16401b	! t0_kref+0x31e4:   	lduh	[%i1 + %i3], %o7
	.word	0xa7a109a9	! t0_kref+0x31e8:   	fdivs	%f4, %f9, %f19
	sethi	%hi(2f), %o7
	.word	0xe40be218	! t0_kref+0x31f0:   	ldub	[%o7 + 0x218], %l2
	.word	0xa41ca00c	! t0_kref+0x31f4:   	xor	%l2, 0xc, %l2
	.word	0xe42be218	! t0_kref+0x31f8:   	stb	%l2, [%o7 + 0x218]
	.word	0x81dbe218	! t0_kref+0x31fc:   	flush	%o7 + 0x218
	.word	0x81580000	! t0_kref+0x3200:   	flushw
	.word	0xd11fbef8	! t0_kref+0x3204:   	ldd	[%fp - 0x108], %f8
	.word	0x97a549a1	! t0_kref+0x3208:   	fdivs	%f21, %f1, %f11
	.word	0xd650a014	! t0_kref+0x320c:   	ldsh	[%g2 + 0x14], %o3
	.word	0xb3a00536	! t0_kref+0x3210:   	fsqrts	%f22, %f25
	.word	0x27480003	! t0_kref+0x3214:   	fbul,a,pt	%fcc0, _kref+0x3220
2:	.word	0xa852f439	! t0_kref+0x3218:   	umul	%o3, -0xbc7, %l4
	.word	0xea16001b	! t0_kref+0x321c:   	lduh	[%i0 + %i3], %l5
	.word	0xada6c9a3	! t0_kref+0x3220:   	fdivs	%f27, %f3, %f22
	.word	0xd400a01c	! t0_kref+0x3224:   	ld	[%g2 + 0x1c], %o2
	.word	0x9da388d8	! t0_kref+0x3228:   	fsubd	%f14, %f24, %f14
	.word	0x85a00528	! t0_kref+0x322c:   	fsqrts	%f8, %f2
	.word	0xaa1a400c	! t0_kref+0x3230:   	xor	%o1, %o4, %l5
	.word	0x9de3bfa0	! t0_kref+0x3234:   	save	%sp, -0x60, %sp
	.word	0xa7ee4019	! t0_kref+0x3238:   	restore	%i1, %i1, %l3
	.word	0xdb200019	! t0_kref+0x323c:   	st	%f13, [%g0 + %i1]
	.word	0xe1260000	! t0_kref+0x3240:   	st	%f16, [%i0]
	.word	0x9da18929	! t0_kref+0x3244:   	fmuls	%f6, %f9, %f14
	.word	0xd810a022	! t0_kref+0x3248:   	lduh	[%g2 + 0x22], %o4
	.word	0x94603b2e	! t0_kref+0x324c:   	subc	%g0, -0x4d2, %o2
	.word	0xaa93001b	! t0_kref+0x3250:   	orcc	%o4, %i3, %l5
	.word	0xf1ee101b	! t0_kref+0x3254:   	prefetcha	%i0 + %i3, 24
	.word	0x8143c000	! t0_kref+0x3258:   	stbar
	.word	0x98d3000c	! t0_kref+0x325c:   	umulcc	%o4, %o4, %o4
	.word	0xd11fbc08	! t0_kref+0x3260:   	ldd	[%fp - 0x3f8], %f8
	.word	0x923a6104	! t0_kref+0x3264:   	xnor	%o1, 0x104, %o1
	.word	0x9006800c	! t0_kref+0x3268:   	add	%i2, %o4, %o0
	sethi	%hi(2f), %o7
	.word	0xe40be288	! t0_kref+0x3270:   	ldub	[%o7 + 0x288], %l2
	.word	0xa41ca00c	! t0_kref+0x3274:   	xor	%l2, 0xc, %l2
	.word	0xe42be288	! t0_kref+0x3278:   	stb	%l2, [%o7 + 0x288]
	.word	0x81dbe288	! t0_kref+0x327c:   	flush	%o7 + 0x288
	.word	0xd4871040	! t0_kref+0x3280:   	lda	[%i4]0x82, %o2
	.word	0xf62e3fef	! t0_kref+0x3284:   	stb	%i3, [%i0 - 0x11]
2:	.word	0xaa180008	! t0_kref+0x3288:   	xor	%g0, %o0, %l5
	.word	0x21800002	! t0_kref+0x328c:   	fbn,a	_kref+0x3294
	.word	0xa5a549b5	! t0_kref+0x3290:   	fdivs	%f21, %f21, %f18
	.word	0x9da00031	! t0_kref+0x3294:   	fmovs	%f17, %f14
	.word	0x99400000	! t0_kref+0x3298:   	mov	%y, %o4
	.word	0x98036d31	! t0_kref+0x329c:   	add	%o5, 0xd31, %o4
	.word	0xf630a006	! t0_kref+0x32a0:   	sth	%i3, [%g2 + 6]
	.word	0xd0bf5018	! t0_kref+0x32a4:   	stda	%o0, [%i5 + %i0]0x80
	.word	0xed00a000	! t0_kref+0x32a8:   	ld	[%g2], %f22
	.word	0xe3b8a040	! t0_kref+0x32ac:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe8ee101a	! t0_kref+0x32b0:   	ldstuba	[%i0 + %i2]0x80, %l4
	.word	0xae65e932	! t0_kref+0x32b4:   	subc	%l7, 0x932, %l7
	.word	0xed00a02c	! t0_kref+0x32b8:   	ld	[%g2 + 0x2c], %f22
	.word	0xace6b251	! t0_kref+0x32bc:   	subccc	%i2, -0xdaf, %l6
	.word	0x91a2c831	! t0_kref+0x32c0:   	fadds	%f11, %f17, %f8
	.word	0x20800002	! t0_kref+0x32c4:   	bn,a	_kref+0x32cc
	.word	0x81dc401f	! t0_kref+0x32c8:   	flush	%l1 + %i7
	.word	0x81ad8aa8	! t0_kref+0x32cc:   	fcmpes	%fcc0, %f22, %f8
	.word	0xf626001c	! t0_kref+0x32d0:   	st	%i3, [%i0 + %i4]
	.word	0x8da00132	! t0_kref+0x32d4:   	fabss	%f18, %f6
	.word	0x81acca25	! t0_kref+0x32d8:   	fcmps	%fcc0, %f19, %f5
	.word	0x9fa4c82e	! t0_kref+0x32dc:   	fadds	%f19, %f14, %f15
	.word	0x87a00821	! t0_kref+0x32e0:   	fadds	%f0, %f1, %f3
	.word	0xa3a018d6	! t0_kref+0x32e4:   	fdtos	%f22, %f17
	.word	0xd53e0000	! t0_kref+0x32e8:   	std	%f10, [%i0]
	.word	0xde4e8018	! t0_kref+0x32ec:   	ldsb	[%i2 + %i0], %o7
	.word	0x81ad0ac0	! t0_kref+0x32f0:   	fcmped	%fcc0, %f20, %f0
	.word	0xeb68a04c	! t0_kref+0x32f4:   	prefetch	%g2 + 0x4c, 21
	.word	0x96a27c1e	! t0_kref+0x32f8:   	subcc	%o1, -0x3e2, %o3
	.word	0x980a400b	! t0_kref+0x32fc:   	and	%o1, %o3, %o4
	.word	0x95a088ca	! t0_kref+0x3300:   	fsubd	%f2, %f10, %f10
	.word	0xd82e3ff1	! t0_kref+0x3304:   	stb	%o4, [%i0 - 0xf]
	.word	0xaf418000	! t0_kref+0x3308:   	mov	%fprs, %l7
	.word	0xee5e0000	! t0_kref+0x330c:   	ldx	[%i0], %l7
	.word	0xac55c017	! t0_kref+0x3310:   	umul	%l7, %l7, %l6
	.word	0x945f2841	! t0_kref+0x3314:   	smul	%i4, 0x841, %o2
	sethi	%hi(2f), %o7
	.word	0xe40be360	! t0_kref+0x331c:   	ldub	[%o7 + 0x360], %l2
	.word	0xa41ca00c	! t0_kref+0x3320:   	xor	%l2, 0xc, %l2
	.word	0xe42be360	! t0_kref+0x3324:   	stb	%l2, [%o7 + 0x360]
	.word	0x81dbe360	! t0_kref+0x3328:   	flush	%o7 + 0x360
	.word	0xec567fee	! t0_kref+0x332c:   	ldsh	[%i1 - 0x12], %l6
	.word	0xd2861000	! t0_kref+0x3330:   	lda	[%i0]0x80, %o1
	.word	0x8da01a30	! t0_kref+0x3334:   	fstoi	%f16, %f6
	.word	0xf3a71018	! t0_kref+0x3338:   	sta	%f25, [%i4 + %i0]0x80
	.word	0xf42e4000	! t0_kref+0x333c:   	stb	%i2, [%i1]
	.word	0x1137c07a	! t0_kref+0x3340:   	sethi	%hi(0xdf01e800), %o0
	.word	0x9292fcce	! t0_kref+0x3344:   	orcc	%o3, -0x332, %o1
	.word	0x901ec00d	! t0_kref+0x3348:   	xor	%i3, %o5, %o0
	.word	0xada00535	! t0_kref+0x334c:   	fsqrts	%f21, %f22
	.word	0x2e800004	! t0_kref+0x3350:   	bvs,a	_kref+0x3360
	.word	0xe6064000	! t0_kref+0x3354:   	ld	[%i1], %l3
	.word	0x8586c017	! t0_kref+0x3358:   	wr	%i3, %l7, %ccr
	.word	0xa8273a54	! t0_kref+0x335c:   	sub	%i4, -0x5ac, %l4
2:	.word	0xd200a010	! t0_kref+0x3360:   	ld	[%g2 + 0x10], %o1
	.word	0xada60858	! t0_kref+0x3364:   	faddd	%f24, %f24, %f22
	.word	0xea4e8019	! t0_kref+0x3368:   	ldsb	[%i2 + %i1], %l5
	.word	0x97a388a5	! t0_kref+0x336c:   	fsubs	%f14, %f5, %f11
	.word	0xf7263ff4	! t0_kref+0x3370:   	st	%f27, [%i0 - 0xc]
	.word	0xafa609b1	! t0_kref+0x3374:   	fdivs	%f24, %f17, %f23
	.word	0x9eaf21b0	! t0_kref+0x3378:   	andncc	%i4, 0x1b0, %o7
	.word	0xaedf3bf3	! t0_kref+0x337c:   	smulcc	%i4, -0x40d, %l7
	.word	0xae7f2876	! t0_kref+0x3380:   	sdiv	%i4, 0x876, %l7
	.word	0x8da3c9b8	! t0_kref+0x3384:   	fdivs	%f15, %f24, %f6
	.word	0x8143c000	! t0_kref+0x3388:   	stbar
	.word	0x9615f0ad	! t0_kref+0x338c:   	or	%l7, -0xf53, %o3
	.word	0x9426f307	! t0_kref+0x3390:   	sub	%i3, -0xcf9, %o2
	.word	0xa7a4c822	! t0_kref+0x3394:   	fadds	%f19, %f2, %f19
	.word	0x930ac01a	! t0_kref+0x3398:   	tsubcc	%o3, %i2, %o1
	.word	0xd25e2010	! t0_kref+0x339c:   	ldx	[%i0 + 0x10], %o1
	.word	0xfb6e001b	! t0_kref+0x33a0:   	prefetch	%i0 + %i3, 29
	.word	0xe4180018	! t0_kref+0x33a4:   	ldd	[%g0 + %i0], %l2
	.word	0x9266e62e	! t0_kref+0x33a8:   	subc	%i3, 0x62e, %o1
	.word	0x23480006	! t0_kref+0x33ac:   	fbne,a,pt	%fcc0, _kref+0x33c4
	.word	0xd43e7ff8	! t0_kref+0x33b0:   	std	%o2, [%i1 - 8]
	.word	0xae5ec01a	! t0_kref+0x33b4:   	smul	%i3, %i2, %l7
	.word	0xa5a018d4	! t0_kref+0x33b8:   	fdtos	%f20, %f18
	.word	0xef6e3fe0	! t0_kref+0x33bc:   	prefetch	%i0 - 0x20, 23
	.word	0x8fa01a24	! t0_kref+0x33c0:   	fstoi	%f4, %f7
	.word	0xa6b30009	! t0_kref+0x33c4:   	orncc	%o4, %o1, %l3
	.word	0xa6d02313	! t0_kref+0x33c8:   	umulcc	%g0, 0x313, %l3
	.word	0x1530a052	! t0_kref+0x33cc:   	sethi	%hi(0xc2814800), %o2
	.word	0x81ad8a4e	! t0_kref+0x33d0:   	fcmpd	%fcc0, %f22, %f14
	.word	0xeb267fe8	! t0_kref+0x33d4:   	st	%f21, [%i1 - 0x18]
	.word	0x29480007	! t0_kref+0x33d8:   	fbl,a,pt	%fcc0, _kref+0x33f4
	.word	0xb5a24828	! t0_kref+0x33dc:   	fadds	%f9, %f8, %f26
	.word	0xef00a030	! t0_kref+0x33e0:   	ld	[%g2 + 0x30], %f23
	.word	0x908ac000	! t0_kref+0x33e4:   	andcc	%o3, %g0, %o0
	.word	0xaba018d8	! t0_kref+0x33e8:   	fdtos	%f24, %f21
	.word	0xe87e7ff4	! t0_kref+0x33ec:   	swap	[%i1 - 0xc], %l4
	.word	0x9a500000	! t0_kref+0x33f0:   	umul	%g0, %g0, %o5
	.word	0xd19f1a59	! t0_kref+0x33f4:   	ldda	[%i4 + %i1]0xd2, %f8
	.word	0x26800002	! t0_kref+0x33f8:   	bl,a	_kref+0x3400
	.word	0x85a0188e	! t0_kref+0x33fc:   	fitos	%f14, %f2
	.word	0xafa00036	! t0_kref+0x3400:   	fmovs	%f22, %f23
	.word	0xb3a000ba	! t0_kref+0x3404:   	fnegs	%f26, %f25
	.word	0xafa0052f	! t0_kref+0x3408:   	fsqrts	%f15, %f23
	.word	0x86102003	! t0_kref+0x340c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3410:   	bne,a	_kref+0x3410
	.word	0x86a0e001	! t0_kref+0x3414:   	subcc	%g3, 1, %g3
	.word	0x92c263e1	! t0_kref+0x3418:   	addccc	%o1, 0x3e1, %o1
	.word	0x81a90aa3	! t0_kref+0x341c:   	fcmpes	%fcc0, %f4, %f3
	.word	0xb1a14828	! t0_kref+0x3420:   	fadds	%f5, %f8, %f24
	.word	0x81a94a32	! t0_kref+0x3424:   	fcmps	%fcc0, %f5, %f18
	.word	0xd11fbd20	! t0_kref+0x3428:   	ldd	[%fp - 0x2e0], %f8
	.word	0xafa3c9b7	! t0_kref+0x342c:   	fdivs	%f15, %f23, %f23
	.word	0xb3a00534	! t0_kref+0x3430:   	fsqrts	%f20, %f25
	.word	0x9536a00c	! t0_kref+0x3434:   	srl	%i2, 0xc, %o2
	.word	0x001fffff	! t0_kref+0x3438:   	illtrap	0x1fffff
	.word	0x9af2c00b	! t0_kref+0x343c:   	udivcc	%o3, %o3, %o5
	.word	0x81dac01e	! t0_kref+0x3440:   	flush	%o3 + %fp
	.word	0x97280000	! t0_kref+0x3444:   	sll	%g0, %g0, %o3
	.word	0xada1c82a	! t0_kref+0x3448:   	fadds	%f7, %f10, %f22
	sethi	%hi(2f), %o7
	.word	0xe40be088	! t0_kref+0x3450:   	ldub	[%o7 + 0x88], %l2
	.word	0xa41ca00c	! t0_kref+0x3454:   	xor	%l2, 0xc, %l2
	.word	0xe42be088	! t0_kref+0x3458:   	stb	%l2, [%o7 + 0x88]
	.word	0x81dbe088	! t0_kref+0x345c:   	flush	%o7 + 0x88
	.word	0x928a400d	! t0_kref+0x3460:   	andcc	%o1, %o5, %o1
	.word	0xb7a00529	! t0_kref+0x3464:   	fsqrts	%f9, %f27
	.word	0xa7a0053b	! t0_kref+0x3468:   	fsqrts	%f27, %f19
	.word	0x2d15b1b8	! t0_kref+0x346c:   	sethi	%hi(0x56c6e000), %l6
	.word	0xd000a03c	! t0_kref+0x3470:   	ld	[%g2 + 0x3c], %o0
	.word	0x81ae0ab0	! t0_kref+0x3474:   	fcmpes	%fcc0, %f24, %f16
	.word	0xd5f61008	! t0_kref+0x3478:   	casxa	[%i0]0x80, %o0, %o2
	.word	0xaa227fdb	! t0_kref+0x347c:   	sub	%o1, -0x25, %l5
	.word	0x87a01a39	! t0_kref+0x3480:   	fstoi	%f25, %f3
	.word	0xaeab3602	! t0_kref+0x3484:   	andncc	%o4, -0x9fe, %l7
2:	.word	0xa892800a	! t0_kref+0x3488:   	orcc	%o2, %o2, %l4
	call	SYM(t0_subr0)
	.word	0xada01893	! t0_kref+0x3490:   	fitos	%f19, %f22
	.word	0x37480002	! t0_kref+0x3494:   	fbge,a,pt	%fcc0, _kref+0x349c
	.word	0xda30a036	! t0_kref+0x3498:   	sth	%o5, [%g2 + 0x36]
	.word	0xae9b0000	! t0_kref+0x349c:   	xorcc	%o4, %g0, %l7
	.word	0x81aa0a58	! t0_kref+0x34a0:   	fcmpd	%fcc0, %f8, %f24
	.word	0x9fc00004	! t0_kref+0x34a4:   	call	%g0 + %g4
	.word	0xd420a01c	! t0_kref+0x34a8:   	st	%o2, [%g2 + 0x1c]
	.word	0xaab6eee4	! t0_kref+0x34ac:   	orncc	%i3, 0xee4, %l5
	.word	0xf36e001c	! t0_kref+0x34b0:   	prefetch	%i0 + %i4, 25
	.word	0xb5a04927	! t0_kref+0x34b4:   	fmuls	%f1, %f7, %f26
	call	1f
	.empty
	.word	0x91a04d23	! t0_kref+0x34bc:   	fsmuld	%f1, %f3, %f8
	.word	0xd430a038	! t0_kref+0x34c0:   	sth	%o2, [%g2 + 0x38]
	.word	0x27480008	! t0_kref+0x34c4:   	fbul,a,pt	%fcc0, _kref+0x34e4
	.word	0x93400000	! t0_kref+0x34c8:   	mov	%y, %o1
	.word	0xe700a030	! t0_kref+0x34cc:   	ld	[%g2 + 0x30], %f19
1:	.word	0x9e637a0a	! t0_kref+0x34d0:   	subc	%o5, -0x5f6, %o7
	.word	0x87a549ba	! t0_kref+0x34d4:   	fdivs	%f21, %f26, %f3
	.word	0x81a98a42	! t0_kref+0x34d8:   	fcmpd	%fcc0, %f6, %f2
	.word	0xe51fbf58	! t0_kref+0x34dc:   	ldd	[%fp - 0xa8], %f18
	.word	0x9602f4c1	! t0_kref+0x34e0:   	add	%o3, -0xb3f, %o3
	.word	0x2b480008	! t0_kref+0x34e4:   	fbug,a,pt	%fcc0, _kref+0x3504
	.word	0x94a3000a	! t0_kref+0x34e8:   	subcc	%o4, %o2, %o2
	.word	0xf8774019	! t0_kref+0x34ec:   	stx	%i4, [%i5 + %i1]
	.word	0x92c72181	! t0_kref+0x34f0:   	addccc	%i4, 0x181, %o1
	.word	0xe96e3fe8	! t0_kref+0x34f4:   	prefetch	%i0 - 0x18, 20
	.word	0xd030a03a	! t0_kref+0x34f8:   	sth	%o0, [%g2 + 0x3a]
	.word	0xc500a020	! t0_kref+0x34fc:   	ld	[%g2 + 0x20], %f2
	.word	0x96ab2011	! t0_kref+0x3500:   	andncc	%o4, 0x11, %o3
	.word	0xd41f4019	! t0_kref+0x3504:   	ldd	[%i5 + %i1], %o2
	.word	0xd4270018	! t0_kref+0x3508:   	st	%o2, [%i4 + %i0]
	.word	0x39480004	! t0_kref+0x350c:   	fbuge,a,pt	%fcc0, _kref+0x351c
	.word	0x9f224000	! t0_kref+0x3510:   	mulscc	%o1, %g0, %o7
	.word	0x2b800007	! t0_kref+0x3514:   	fbug,a	_kref+0x3530
	.word	0xd420a00c	! t0_kref+0x3518:   	st	%o2, [%g2 + 0xc]
	.word	0x9a02401b	! t0_kref+0x351c:   	add	%o1, %i3, %o5
	.word	0x9aa5c009	! t0_kref+0x3520:   	subcc	%l7, %o1, %o5
	.word	0xe6100018	! t0_kref+0x3524:   	lduh	[%g0 + %i0], %l3
	.word	0xa83829b3	! t0_kref+0x3528:   	xnor	%g0, 0x9b3, %l4
	.word	0x91a2c8b6	! t0_kref+0x352c:   	fsubs	%f11, %f22, %f8
	.word	0x9e26f60d	! t0_kref+0x3530:   	sub	%i3, -0x9f3, %o7
	.word	0xde4e0000	! t0_kref+0x3534:   	ldsb	[%i0], %o7
	.word	0x965f2e17	! t0_kref+0x3538:   	smul	%i4, 0xe17, %o3
	.word	0xacfaac9a	! t0_kref+0x353c:   	sdivcc	%o2, 0xc9a, %l6
	.word	0x96c6a42b	! t0_kref+0x3540:   	addccc	%i2, 0x42b, %o3
	.word	0x95a14830	! t0_kref+0x3544:   	fadds	%f5, %f16, %f10
	.word	0x9de3bfa0	! t0_kref+0x3548:   	save	%sp, -0x60, %sp
	.word	0xa9ef4019	! t0_kref+0x354c:   	restore	%i5, %i1, %l4
	.word	0xc030a004	! t0_kref+0x3550:   	clrh	[%g2 + 4]
	.word	0xc32031bc	! t0_kref+0x3554:   	st	%f1, [%g0 - 0xe44]
	.word	0xab3b401c	! t0_kref+0x3558:   	sra	%o5, %i4, %l5
	.word	0xed1fbda0	! t0_kref+0x355c:   	ldd	[%fp - 0x260], %f22
	.word	0xa6c5c00a	! t0_kref+0x3560:   	addccc	%l7, %o2, %l3
	.word	0xd2200019	! t0_kref+0x3564:   	st	%o1, [%g0 + %i1]
	.word	0x96830009	! t0_kref+0x3568:   	addcc	%o4, %o1, %o3
	.word	0x25480004	! t0_kref+0x356c:   	fblg,a,pt	%fcc0, _kref+0x357c
	.word	0x85a000c2	! t0_kref+0x3570:   	fnegd	%f2, %f2
	.word	0xee160000	! t0_kref+0x3574:   	lduh	[%i0], %l7
	.word	0xe3b8a040	! t0_kref+0x3578:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd6000019	! t0_kref+0x357c:   	ld	[%g0 + %i1], %o3
	sethi	%hi(2f), %o7
	.word	0xe40be1cc	! t0_kref+0x3584:   	ldub	[%o7 + 0x1cc], %l2
	.word	0xa41ca00c	! t0_kref+0x3588:   	xor	%l2, 0xc, %l2
	.word	0xe42be1cc	! t0_kref+0x358c:   	stb	%l2, [%o7 + 0x1cc]
	.word	0x81dbe1cc	! t0_kref+0x3590:   	flush	%o7 + 0x1cc
	.word	0xb3a0c839	! t0_kref+0x3594:   	fadds	%f3, %f25, %f25
	.word	0xa8d0000d	! t0_kref+0x3598:   	umulcc	%g0, %o5, %l4
	.word	0xd820a01c	! t0_kref+0x359c:   	st	%o4, [%g2 + 0x1c]
	.word	0xb1a289ad	! t0_kref+0x35a0:   	fdivs	%f10, %f13, %f24
	.word	0x9662c01c	! t0_kref+0x35a4:   	subc	%o3, %i4, %o3
	.word	0xb5a589c0	! t0_kref+0x35a8:   	fdivd	%f22, %f0, %f26
	call	SYM(t0_subr0)
	.word	0xe5ee501a	! t0_kref+0x35b0:   	prefetcha	%i1 + %i2, 18
	.word	0xd43e2000	! t0_kref+0x35b4:   	std	%o2, [%i0]
	.word	0xf6260000	! t0_kref+0x35b8:   	st	%i3, [%i0]
	.word	0xaa15e226	! t0_kref+0x35bc:   	or	%l7, 0x226, %l5
	.word	0xc53e401d	! t0_kref+0x35c0:   	std	%f2, [%i1 + %i5]
	.word	0x9da00531	! t0_kref+0x35c4:   	fsqrts	%f17, %f14
	.word	0xf520a000	! t0_kref+0x35c8:   	st	%f26, [%g2]
2:	.word	0xf700a028	! t0_kref+0x35cc:   	ld	[%g2 + 0x28], %f27
	.word	0x9de3bfa0	! t0_kref+0x35d0:   	save	%sp, -0x60, %sp
	.word	0x99ee33b3	! t0_kref+0x35d4:   	restore	%i0, -0xc4d, %o4
	.word	0x81aacab9	! t0_kref+0x35d8:   	fcmpes	%fcc0, %f11, %f25
	.word	0x99a000b1	! t0_kref+0x35dc:   	fnegs	%f17, %f12
	.word	0x97a00136	! t0_kref+0x35e0:   	fabss	%f22, %f11
	.word	0x987af051	! t0_kref+0x35e4:   	sdiv	%o3, -0xfaf, %o4
	.word	0xab400000	! t0_kref+0x35e8:   	mov	%y, %l5
	.word	0xaa426050	! t0_kref+0x35ec:   	addc	%o1, 0x50, %l5
	.word	0xe816001b	! t0_kref+0x35f0:   	lduh	[%i0 + %i3], %l4
	.word	0xaf13217a	! t0_kref+0x35f4:   	taddcctv	%o4, 0x17a, %l7
	.word	0x933aa01f	! t0_kref+0x35f8:   	sra	%o2, 0x1f, %o1
	.word	0xa6ab400a	! t0_kref+0x35fc:   	andncc	%o5, %o2, %l3
	.word	0xacd321f5	! t0_kref+0x3600:   	umulcc	%o4, 0x1f5, %l6
	.word	0xe07e7fe4	! t0_kref+0x3604:   	swap	[%i1 - 0x1c], %l0
	.word	0xfd6e2018	! t0_kref+0x3608:   	prefetch	%i0 + 0x18, 30
	.word	0xd650a010	! t0_kref+0x360c:   	ldsh	[%g2 + 0x10], %o3
	.word	0x3e480008	! t0_kref+0x3610:   	bvc,a,pt	%icc, _kref+0x3630
	.word	0xd050a014	! t0_kref+0x3614:   	ldsh	[%g2 + 0x14], %o0
	.word	0xd628a01f	! t0_kref+0x3618:   	stb	%o3, [%g2 + 0x1f]
	.word	0x3c480007	! t0_kref+0x361c:   	bpos,a,pt	%icc, _kref+0x3638
	.word	0x9260288f	! t0_kref+0x3620:   	subc	%g0, 0x88f, %o1
	.word	0xfbee501b	! t0_kref+0x3624:   	prefetcha	%i1 + %i3, 29
	.word	0xee28a039	! t0_kref+0x3628:   	stb	%l7, [%g2 + 0x39]
	.word	0xee266008	! t0_kref+0x362c:   	st	%l7, [%i1 + 8]
	.word	0xf3ee501a	! t0_kref+0x3630:   	prefetcha	%i1 + %i2, 25
	.word	0xac1ebe1f	! t0_kref+0x3634:   	xor	%i2, -0x1e1, %l6
	.word	0xad3b200a	! t0_kref+0x3638:   	sra	%o4, 0xa, %l6
	.word	0x9e06ffea	! t0_kref+0x363c:   	add	%i3, -0x16, %o7
	.word	0xa68de115	! t0_kref+0x3640:   	andcc	%l7, 0x115, %l3
	.word	0xd43e2008	! t0_kref+0x3644:   	std	%o2, [%i0 + 8]
	.word	0x90b3401a	! t0_kref+0x3648:   	orncc	%o5, %i2, %o0
	.word	0xc0767fe8	! t0_kref+0x364c:   	stx	%g0, [%i1 - 0x18]
	.word	0xe5bf5019	! t0_kref+0x3650:   	stda	%f18, [%i5 + %i1]0x80
	.word	0xebe6101a	! t0_kref+0x3654:   	casa	[%i0]0x80, %i2, %l5
	.word	0xa71a000b	! t0_kref+0x3658:   	tsubcctv	%o0, %o3, %l3
	.word	0x81ad8a50	! t0_kref+0x365c:   	fcmpd	%fcc0, %f22, %f16
	.word	0xecd65000	! t0_kref+0x3660:   	ldsha	[%i1]0x80, %l6
	.word	0xaaf5c01c	! t0_kref+0x3664:   	udivcc	%l7, %i4, %l5
	.word	0xa87ac009	! t0_kref+0x3668:   	sdiv	%o3, %o1, %l4
	.word	0xa8c5f242	! t0_kref+0x366c:   	addccc	%l7, -0xdbe, %l4
	.word	0x2c480003	! t0_kref+0x3670:   	bneg,a,pt	%icc, _kref+0x367c
	.word	0xe968a00e	! t0_kref+0x3674:   	prefetch	%g2 + 0xe, 20
	.word	0x9a43400d	! t0_kref+0x3678:   	addc	%o5, %o5, %o5
	.word	0x32480005	! t0_kref+0x367c:   	bne,a,pt	%icc, _kref+0x3690
	.word	0xb3a0188d	! t0_kref+0x3680:   	fitos	%f13, %f25
	.word	0xec1e4000	! t0_kref+0x3684:   	ldd	[%i1], %l6
	.word	0xd0362008	! t0_kref+0x3688:   	sth	%o0, [%i0 + 8]
	.word	0xac26c01b	! t0_kref+0x368c:   	sub	%i3, %i3, %l6
	.word	0xa68aa04c	! t0_kref+0x3690:   	andcc	%o2, 0x4c, %l3
	.word	0x9e9b3a80	! t0_kref+0x3694:   	xorcc	%o4, -0x580, %o7
	.word	0xaa7ae75e	! t0_kref+0x3698:   	sdiv	%o3, 0x75e, %l5
	.word	0xae7a801a	! t0_kref+0x369c:   	sdiv	%o2, %i2, %l7
	.word	0x9e22c00b	! t0_kref+0x36a0:   	sub	%o3, %o3, %o7
	.word	0x9f36e001	! t0_kref+0x36a4:   	srl	%i3, 0x1, %o7
	sethi	%hi(2f), %o7
	.word	0xe40be2dc	! t0_kref+0x36ac:   	ldub	[%o7 + 0x2dc], %l2
	.word	0xa41ca00c	! t0_kref+0x36b0:   	xor	%l2, 0xc, %l2
	.word	0xe42be2dc	! t0_kref+0x36b4:   	stb	%l2, [%o7 + 0x2dc]
	.word	0x81dbe2dc	! t0_kref+0x36b8:   	flush	%o7 + 0x2dc
	.word	0xa87ac017	! t0_kref+0x36bc:   	sdiv	%o3, %l7, %l4
	.word	0xafa0052e	! t0_kref+0x36c0:   	fsqrts	%f14, %f23
	.word	0x99a0192b	! t0_kref+0x36c4:   	fstod	%f11, %f12
	.word	0x9ba01a30	! t0_kref+0x36c8:   	fstoi	%f16, %f13
	.word	0xcd1fbd20	! t0_kref+0x36cc:   	ldd	[%fp - 0x2e0], %f6
	.word	0x95a289b6	! t0_kref+0x36d0:   	fdivs	%f10, %f22, %f10
	.word	0xa8fa801b	! t0_kref+0x36d4:   	sdivcc	%o2, %i3, %l4
	.word	0x81dd4017	! t0_kref+0x36d8:   	flush	%l5 + %l7
2:	.word	0xac268000	! t0_kref+0x36dc:   	sub	%i2, %g0, %l6
	.word	0x81aa8ab1	! t0_kref+0x36e0:   	fcmpes	%fcc0, %f10, %f17
	.word	0x9872401a	! t0_kref+0x36e4:   	udiv	%o1, %i2, %o4
	.word	0x9412800b	! t0_kref+0x36e8:   	or	%o2, %o3, %o2
	.word	0xa8672570	! t0_kref+0x36ec:   	subc	%i4, 0x570, %l4
	.word	0x8fa000a9	! t0_kref+0x36f0:   	fnegs	%f9, %f7
	.word	0xac82801a	! t0_kref+0x36f4:   	addcc	%o2, %i2, %l6
	.word	0xeaff1018	! t0_kref+0x36f8:   	swapa	[%i4 + %i0]0x80, %l5
	.word	0xae76fcd7	! t0_kref+0x36fc:   	udiv	%i3, -0x329, %l7
	.word	0xf62e3fee	! t0_kref+0x3700:   	stb	%i3, [%i0 - 0x12]
	.word	0x96d2400a	! t0_kref+0x3704:   	umulcc	%o1, %o2, %o3
	.word	0xa65ec00a	! t0_kref+0x3708:   	smul	%i3, %o2, %l3
	.word	0x93a1c92a	! t0_kref+0x370c:   	fmuls	%f7, %f10, %f9
	.word	0xee48a03f	! t0_kref+0x3710:   	ldsb	[%g2 + 0x3f], %l7
	.word	0xd03e4000	! t0_kref+0x3714:   	std	%o0, [%i1]
	.word	0xc807bfec	! t0_kref+0x3718:   	ld	[%fp - 0x14], %g4
	.word	0xd9be5857	! t0_kref+0x371c:   	stda	%f12, [%i1 + %l7]0xc2
	.word	0x81aa4aac	! t0_kref+0x3720:   	fcmpes	%fcc0, %f9, %f12
	.word	0xaa52001b	! t0_kref+0x3724:   	umul	%o0, %i3, %l5
	.word	0x9da4082f	! t0_kref+0x3728:   	fadds	%f16, %f15, %f14
	.word	0x37800004	! t0_kref+0x372c:   	fbge,a	_kref+0x373c
	.word	0xd210a024	! t0_kref+0x3730:   	lduh	[%g2 + 0x24], %o1
	.word	0xa88a3a8e	! t0_kref+0x3734:   	andcc	%o0, -0x572, %l4
	.word	0x91a6084e	! t0_kref+0x3738:   	faddd	%f24, %f14, %f8
	.word	0x95a01a2d	! t0_kref+0x373c:   	fstoi	%f13, %f10
	.word	0xe688105a	! t0_kref+0x3740:   	lduba	[%g0 + %i2]0x82, %l3
	.word	0xa6132ec0	! t0_kref+0x3744:   	or	%o4, 0xec0, %l3
	.word	0x86102002	! t0_kref+0x3748:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x374c:   	bne,a	_kref+0x374c
	.word	0x86a0e001	! t0_kref+0x3750:   	subcc	%g3, 1, %g3
	.word	0xda4e200d	! t0_kref+0x3754:   	ldsb	[%i0 + 0xd], %o5
	.word	0xf4267fe4	! t0_kref+0x3758:   	st	%i2, [%i1 - 0x1c]
	.word	0xe64e4000	! t0_kref+0x375c:   	ldsb	[%i1], %l3
	.word	0x9e1e800c	! t0_kref+0x3760:   	xor	%i2, %o4, %o7
	.word	0x9856fe1d	! t0_kref+0x3764:   	umul	%i3, -0x1e3, %o4
	.word	0x89a01898	! t0_kref+0x3768:   	fitos	%f24, %f4
	.word	0x83a01a2f	! t0_kref+0x376c:   	fstoi	%f15, %f1
	.word	0x89a01937	! t0_kref+0x3770:   	fstod	%f23, %f4
	.word	0x9f65a286	! t0_kref+0x3774:   	movneg	%icc, 0x286, %o7
	.word	0x85a000d6	! t0_kref+0x3778:   	fnegd	%f22, %f2
	.word	0xac62400c	! t0_kref+0x377c:   	subc	%o1, %o4, %l6
	.word	0xaa82000a	! t0_kref+0x3780:   	addcc	%o0, %o2, %l5
	.word	0xaf2a6006	! t0_kref+0x3784:   	sll	%o1, 0x6, %l7
	.word	0xa72234f3	! t0_kref+0x3788:   	mulscc	%o0, -0xb0d, %l3
	.word	0xd920a02c	! t0_kref+0x378c:   	st	%f12, [%g2 + 0x2c]
	.word	0x965b2988	! t0_kref+0x3790:   	smul	%o4, 0x988, %o3
	.word	0x9b2aa00b	! t0_kref+0x3794:   	sll	%o2, 0xb, %o5
	.word	0xd250a026	! t0_kref+0x3798:   	ldsh	[%g2 + 0x26], %o1
	.word	0x900a3c87	! t0_kref+0x379c:   	and	%o0, -0x379, %o0
	.word	0x8ba449a1	! t0_kref+0x37a0:   	fdivs	%f17, %f1, %f5
	.word	0x9813400c	! t0_kref+0x37a4:   	or	%o5, %o4, %o4
	.word	0x89a000da	! t0_kref+0x37a8:   	fnegd	%f26, %f4
	.word	0x9272bac2	! t0_kref+0x37ac:   	udiv	%o2, -0x53e, %o1
	.word	0xd620a03c	! t0_kref+0x37b0:   	st	%o3, [%g2 + 0x3c]
	.word	0x81df7191	! t0_kref+0x37b4:   	flush	%i5 - 0xe6f
	.word	0x92b26e76	! t0_kref+0x37b8:   	orncc	%o1, 0xe76, %o1
	.word	0xada0052b	! t0_kref+0x37bc:   	fsqrts	%f11, %f22
	.word	0xd02e2007	! t0_kref+0x37c0:   	stb	%o0, [%i0 + 7]
	.word	0xd450a012	! t0_kref+0x37c4:   	ldsh	[%g2 + 0x12], %o2
	.word	0xe41e7fe8	! t0_kref+0x37c8:   	ldd	[%i1 - 0x18], %l2
	.word	0x191d8976	! t0_kref+0x37cc:   	sethi	%hi(0x7625d800), %o4
	.word	0x81dc67a9	! t0_kref+0x37d0:   	flush	%l1 + 0x7a9
	.word	0x9eb6c00b	! t0_kref+0x37d4:   	orncc	%i3, %o3, %o7
	.word	0x85a489d2	! t0_kref+0x37d8:   	fdivd	%f18, %f18, %f2
	.word	0xdd1fbed0	! t0_kref+0x37dc:   	ldd	[%fp - 0x130], %f14
	.word	0x81ab8ab9	! t0_kref+0x37e0:   	fcmpes	%fcc0, %f14, %f25
	.word	0x927aa378	! t0_kref+0x37e4:   	sdiv	%o2, 0x378, %o1
	.word	0x27071ccc	! t0_kref+0x37e8:   	sethi	%hi(0x1c733000), %l3
	.word	0x83a00139	! t0_kref+0x37ec:   	fabss	%f25, %f1
	.word	0xda267fe4	! t0_kref+0x37f0:   	st	%o5, [%i1 - 0x1c]
	.word	0xea40a00c	! t0_kref+0x37f4:   	ldsw	[%g2 + 0xc], %l5
	.word	0xd2d65000	! t0_kref+0x37f8:   	ldsha	[%i1]0x80, %o1
	sethi	%hi(2f), %o7
	.word	0xe40be044	! t0_kref+0x3800:   	ldub	[%o7 + 0x44], %l2
	.word	0xa41ca00c	! t0_kref+0x3804:   	xor	%l2, 0xc, %l2
	.word	0xe42be044	! t0_kref+0x3808:   	stb	%l2, [%o7 + 0x44]
	.word	0x81dbe044	! t0_kref+0x380c:   	flush	%o7 + 0x44
	.word	0x941a728a	! t0_kref+0x3810:   	xor	%o1, -0xd76, %o2
	.word	0x9a22800d	! t0_kref+0x3814:   	sub	%o2, %o5, %o5
	.word	0x8fa018d8	! t0_kref+0x3818:   	fdtos	%f24, %f7
	.word	0x92f2000b	! t0_kref+0x381c:   	udivcc	%o0, %o3, %o1
	.word	0xa7a1492a	! t0_kref+0x3820:   	fmuls	%f5, %f10, %f19
	.word	0xd630a034	! t0_kref+0x3824:   	sth	%o3, [%g2 + 0x34]
	.word	0xaa06c008	! t0_kref+0x3828:   	add	%i3, %o0, %l5
	.word	0xc51fbc18	! t0_kref+0x382c:   	ldd	[%fp - 0x3e8], %f2
	.word	0x9ed6c009	! t0_kref+0x3830:   	umulcc	%i3, %o1, %o7
	.word	0x29480006	! t0_kref+0x3834:   	fbl,a,pt	%fcc0, _kref+0x384c
	.word	0xc0200019	! t0_kref+0x3838:   	clr	[%g0 + %i1]
	.word	0xd9be5a1b	! t0_kref+0x383c:   	stda	%f12, [%i1 + %i3]0xd0
	.word	0xea4e7fe1	! t0_kref+0x3840:   	ldsb	[%i1 - 0x1f], %l5
2:	.word	0xa1400000	! t0_kref+0x3844:   	mov	%y, %l0
	.word	0x9058000a	! t0_kref+0x3848:   	smul	%g0, %o2, %o0
	.word	0x2d480008	! t0_kref+0x384c:   	fbg,a,pt	%fcc0, _kref+0x386c
	.word	0x91a508a3	! t0_kref+0x3850:   	fsubs	%f20, %f3, %f8
	.word	0xae122383	! t0_kref+0x3854:   	or	%o0, 0x383, %l7
	.word	0x2d3e01b5	! t0_kref+0x3858:   	sethi	%hi(0xf806d400), %l6
	.word	0xda48a01a	! t0_kref+0x385c:   	ldsb	[%g2 + 0x1a], %o5
	.word	0xec4e001a	! t0_kref+0x3860:   	ldsb	[%i0 + %i2], %l6
	.word	0x3e800004	! t0_kref+0x3864:   	bvc,a	_kref+0x3874
	.word	0xe84e200a	! t0_kref+0x3868:   	ldsb	[%i0 + 0xa], %l4
	.word	0xd010a010	! t0_kref+0x386c:   	lduh	[%g2 + 0x10], %o0
	.word	0x9da2c9a7	! t0_kref+0x3870:   	fdivs	%f11, %f7, %f14
	.word	0xe81e001d	! t0_kref+0x3874:   	ldd	[%i0 + %i5], %l4
	.word	0xf62e8018	! t0_kref+0x3878:   	stb	%i3, [%i2 + %i0]
	.word	0x81adcaa9	! t0_kref+0x387c:   	fcmpes	%fcc0, %f23, %f9
	.word	0x9a12801a	! t0_kref+0x3880:   	or	%o2, %i2, %o5
	.word	0xac437671	! t0_kref+0x3884:   	addc	%o5, -0x98f, %l6
	.word	0x113b5ae1	! t0_kref+0x3888:   	sethi	%hi(0xed6b8400), %o0
	.word	0xd64e3fff	! t0_kref+0x388c:   	ldsb	[%i0 - 1], %o3
	.word	0xd03f4019	! t0_kref+0x3890:   	std	%o0, [%i5 + %i1]
	.word	0xda30a00a	! t0_kref+0x3894:   	sth	%o5, [%g2 + 0xa]
	.word	0x81ae8a52	! t0_kref+0x3898:   	fcmpd	%fcc0, %f26, %f18
	.word	0xa643285c	! t0_kref+0x389c:   	addc	%o4, 0x85c, %l3
	.word	0xa5a01096	! t0_kref+0x38a0:   	fxtos	%f22, %f18
	.word	0x9fc10000	! t0_kref+0x38a4:   	call	%g4
	.word	0xea08a008	! t0_kref+0x38a8:   	ldub	[%g2 + 8], %l5
	.word	0xfc19401d	! t0_kref+0x38ac:   	ldd	[%g5 + %i5], %fp
	.word	0x3c800008	! t0_kref+0x38b0:   	bpos,a	_kref+0x38d0
	.word	0x89a01052	! t0_kref+0x38b4:   	fdtox	%f18, %f4
	.word	0x85800009	! t0_kref+0x38b8:   	mov	%o1, %ccr
	.word	0x91a08d38	! t0_kref+0x38bc:   	fsmuld	%f2, %f24, %f8
	.word	0x85a00158	! t0_kref+0x38c0:   	fabsd	%f24, %f2
	.word	0xe3b8a040	! t0_kref+0x38c4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x34800006	! t0_kref+0x38c8:   	bg,a	_kref+0x38e0
	.word	0x9a270008	! t0_kref+0x38cc:   	sub	%i4, %o0, %o5
	.word	0x93a01a21	! t0_kref+0x38d0:   	fstoi	%f1, %f9
	.word	0xaedebca9	! t0_kref+0x38d4:   	smulcc	%i2, -0x357, %l7
	.word	0x85a01a29	! t0_kref+0x38d8:   	fstoi	%f9, %f2
	.word	0xa81f0008	! t0_kref+0x38dc:   	xor	%i4, %o0, %l4
	.word	0xa825c009	! t0_kref+0x38e0:   	sub	%l7, %o1, %l4
	.word	0xaa5f36df	! t0_kref+0x38e4:   	smul	%i4, -0x921, %l5
	.word	0xac2dc008	! t0_kref+0x38e8:   	andn	%l7, %o0, %l6
	.word	0x21480001	! t0_kref+0x38ec:   	fbn,a,pt	%fcc0, _kref+0x38f0
	.word	0xa862b3df	! t0_kref+0x38f0:   	subc	%o2, -0xc21, %l4
	.word	0xa65dc000	! t0_kref+0x38f4:   	smul	%l7, %g0, %l3
	.word	0x9e1dc00c	! t0_kref+0x38f8:   	xor	%l7, %o4, %o7
	.word	0x9896ef2c	! t0_kref+0x38fc:   	orcc	%i3, 0xf2c, %o4
	.word	0xae85fbda	! t0_kref+0x3900:   	addcc	%l7, -0x426, %l7
	.word	0x9825c01b	! t0_kref+0x3904:   	sub	%l7, %i3, %o4
	.word	0x9de3bfa0	! t0_kref+0x3908:   	save	%sp, -0x60, %sp
	.word	0xb6ae001b	! t0_kref+0x390c:   	andncc	%i0, %i3, %i3
	.word	0xabeec01c	! t0_kref+0x3910:   	restore	%i3, %i4, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be154	! t0_kref+0x3918:   	ldub	[%o7 + 0x154], %l2
	.word	0xa41ca00c	! t0_kref+0x391c:   	xor	%l2, 0xc, %l2
	.word	0xe42be154	! t0_kref+0x3920:   	stb	%l2, [%o7 + 0x154]
	.word	0x81dbe154	! t0_kref+0x3924:   	flush	%o7 + 0x154
	.word	0x9da01a39	! t0_kref+0x3928:   	fstoi	%f25, %f14
	.word	0xada00156	! t0_kref+0x392c:   	fabsd	%f22, %f22
	.word	0x9fc00004	! t0_kref+0x3930:   	call	%g0 + %g4
	.word	0xaf2a2014	! t0_kref+0x3934:   	sll	%o0, 0x14, %l7
	.word	0x99a0012f	! t0_kref+0x3938:   	fabss	%f15, %f12
	.word	0xe8162012	! t0_kref+0x393c:   	lduh	[%i0 + 0x12], %l4
	.word	0xc51fbfc0	! t0_kref+0x3940:   	ldd	[%fp - 0x40], %f2
	.word	0xaf400000	! t0_kref+0x3944:   	mov	%y, %l7
	.word	0x96c3000a	! t0_kref+0x3948:   	addccc	%o4, %o2, %o3
	.word	0x95a00523	! t0_kref+0x394c:   	fsqrts	%f3, %f10
	.word	0xa9a0012b	! t0_kref+0x3950:   	fabss	%f11, %f20
2:	.word	0x83a18825	! t0_kref+0x3954:   	fadds	%f6, %f5, %f1
	.word	0xa5a01889	! t0_kref+0x3958:   	fitos	%f9, %f18
	.word	0xae1b001b	! t0_kref+0x395c:   	xor	%o4, %i3, %l7
	.word	0x81ac8a44	! t0_kref+0x3960:   	fcmpd	%fcc0, %f18, %f4
	.word	0xa9a01892	! t0_kref+0x3964:   	fitos	%f18, %f20
	.word	0xa5a609ca	! t0_kref+0x3968:   	fdivd	%f24, %f10, %f18
	.word	0xa1a000a2	! t0_kref+0x396c:   	fnegs	%f2, %f16
	.word	0x3f480007	! t0_kref+0x3970:   	fbo,a,pt	%fcc0, _kref+0x398c
	.word	0x9b67800b	! t0_kref+0x3974:   	movpos	%icc, %o3, %o5
	.word	0x9fc00004	! t0_kref+0x3978:   	call	%g0 + %g4
	.word	0x92224017	! t0_kref+0x397c:   	sub	%o1, %l7, %o1
	.word	0xa9a089b4	! t0_kref+0x3980:   	fdivs	%f2, %f20, %f20
	.word	0x24800007	! t0_kref+0x3984:   	ble,a	_kref+0x39a0
	.word	0xac8dc01b	! t0_kref+0x3988:   	andcc	%l7, %i3, %l6
	.word	0x81d83af7	! t0_kref+0x398c:   	flush	%g0 - 0x509
	.word	0xda08a039	! t0_kref+0x3990:   	ldub	[%g2 + 0x39], %o5
	.word	0xd43e7fe8	! t0_kref+0x3994:   	std	%o2, [%i1 - 0x18]
	.word	0xd04e7fe9	! t0_kref+0x3998:   	ldsb	[%i1 - 0x17], %o0
	.word	0x988b3a05	! t0_kref+0x399c:   	andcc	%o4, -0x5fb, %o4
	.word	0x22800001	! t0_kref+0x39a0:   	be,a	_kref+0x39a4
	.word	0x81d8401d	! t0_kref+0x39a4:   	flush	%g1 + %i5
	.word	0xa3a2c9ba	! t0_kref+0x39a8:   	fdivs	%f11, %f26, %f17
	.word	0xacadc008	! t0_kref+0x39ac:   	andncc	%l7, %o0, %l6
	.word	0x99a01888	! t0_kref+0x39b0:   	fitos	%f8, %f12
	.word	0xde16c019	! t0_kref+0x39b4:   	lduh	[%i3 + %i1], %o7
	.word	0x38800001	! t0_kref+0x39b8:   	bgu,a	_kref+0x39bc
	.word	0x9e202bbb	! t0_kref+0x39bc:   	sub	%g0, 0xbbb, %o7
	.word	0xd24e200d	! t0_kref+0x39c0:   	ldsb	[%i0 + 0xd], %o1
	.word	0xee2e7ffe	! t0_kref+0x39c4:   	stb	%l7, [%i1 - 2]
	.word	0xae8ab744	! t0_kref+0x39c8:   	andcc	%o2, -0x8bc, %l7
	.word	0xc9be181c	! t0_kref+0x39cc:   	stda	%f4, [%i0 + %i4]0xc0
	.word	0x85a000b1	! t0_kref+0x39d0:   	fnegs	%f17, %f2
	.word	0x172c2d16	! t0_kref+0x39d4:   	sethi	%hi(0xb0b45800), %o3
	.word	0x9066c009	! t0_kref+0x39d8:   	subc	%i3, %o1, %o0
	.word	0xaec28009	! t0_kref+0x39dc:   	addccc	%o2, %o1, %l7
	.word	0x9676c01b	! t0_kref+0x39e0:   	udiv	%i3, %i3, %o3
	.word	0xe26e8018	! t0_kref+0x39e4:   	ldstub	[%i2 + %i0], %l1
	.word	0xb7a5c8af	! t0_kref+0x39e8:   	fsubs	%f23, %f15, %f27
	.word	0xa7a5c838	! t0_kref+0x39ec:   	fadds	%f23, %f24, %f19
	.word	0xfc3f4005	! t0_kref+0x39f0:   	std	%fp, [%i5 + %g5]
	.word	0xed1e7ff0	! t0_kref+0x39f4:   	ldd	[%i1 - 0x10], %f22
	.word	0x23480007	! t0_kref+0x39f8:   	fbne,a,pt	%fcc0, _kref+0x3a14
	.word	0xe7ee101d	! t0_kref+0x39fc:   	prefetcha	%i0 + %i5, 19
	.word	0xc11e4000	! t0_kref+0x3a00:   	ldd	[%i1], %f0
	.word	0x9e7a800b	! t0_kref+0x3a04:   	sdiv	%o2, %o3, %o7
	.word	0xd320a038	! t0_kref+0x3a08:   	st	%f9, [%g2 + 0x38]
	.word	0xaed33d82	! t0_kref+0x3a0c:   	umulcc	%o4, -0x27e, %l7
	.word	0x9406f188	! t0_kref+0x3a10:   	add	%i3, -0xe78, %o2
	.word	0xf520a038	! t0_kref+0x3a14:   	st	%f26, [%g2 + 0x38]
	.word	0xa9a60825	! t0_kref+0x3a18:   	fadds	%f24, %f5, %f20
	.word	0xde40a034	! t0_kref+0x3a1c:   	ldsw	[%g2 + 0x34], %o7
	.word	0xa696b12d	! t0_kref+0x3a20:   	orcc	%i2, -0xed3, %l3
	.word	0xd018001d	! t0_kref+0x3a24:   	ldd	[%g0 + %i5], %o0
	.word	0xdaff1018	! t0_kref+0x3a28:   	swapa	[%i4 + %i0]0x80, %o5
	.word	0xec50a026	! t0_kref+0x3a2c:   	ldsh	[%g2 + 0x26], %l6
	.word	0x86102019	! t0_kref+0x3a30:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x3a34:   	subcc	%g3, 1, %g3
	.word	0x22800004	! t0_kref+0x3a38:   	be,a	_kref+0x3a48
	.word	0xf620a03c	! t0_kref+0x3a3c:   	st	%i3, [%g2 + 0x3c]
	.word	0xe91e7fe8	! t0_kref+0x3a40:   	ldd	[%i1 - 0x18], %f20
	.word	0x36800003	! t0_kref+0x3a44:   	bge,a	_kref+0x3a50
	.word	0xf1be181b	! t0_kref+0x3a48:   	stda	%f24, [%i0 + %i3]0xc0
	.word	0xf3ee501c	! t0_kref+0x3a4c:   	prefetcha	%i1 + %i4, 25
	.word	0xb3a289b6	! t0_kref+0x3a50:   	fdivs	%f10, %f22, %f25
	.word	0xa692000c	! t0_kref+0x3a54:   	orcc	%o0, %o4, %l3
	.word	0xaefb7042	! t0_kref+0x3a58:   	sdivcc	%o5, -0xfbe, %l7
	.word	0x9da00123	! t0_kref+0x3a5c:   	fabss	%f3, %f14
	.word	0xea08a00b	! t0_kref+0x3a60:   	ldub	[%g2 + 0xb], %l5
	.word	0x98236731	! t0_kref+0x3a64:   	sub	%o5, 0x731, %o4
	.word	0x9013001c	! t0_kref+0x3a68:   	or	%o4, %i4, %o0
	.word	0x96c33d07	! t0_kref+0x3a6c:   	addccc	%o4, -0x2f9, %o3
	.word	0xb3a00537	! t0_kref+0x3a70:   	fsqrts	%f23, %f25
	.word	0xd830a00c	! t0_kref+0x3a74:   	sth	%o4, [%g2 + 0xc]
	.word	0xb7a2c9b6	! t0_kref+0x3a78:   	fdivs	%f11, %f22, %f27
	.word	0x96e37ab7	! t0_kref+0x3a7c:   	subccc	%o5, -0x549, %o3
	.word	0x96b6aeca	! t0_kref+0x3a80:   	orncc	%i2, 0xeca, %o3
	.word	0xc91fbc30	! t0_kref+0x3a84:   	ldd	[%fp - 0x3d0], %f4
	.word	0xd67e2014	! t0_kref+0x3a88:   	swap	[%i0 + 0x14], %o3
	.word	0x31480008	! t0_kref+0x3a8c:   	fba,a,pt	%fcc0, _kref+0x3aac
	.word	0x8fa1c9a1	! t0_kref+0x3a90:   	fdivs	%f7, %f1, %f7
	.word	0x95a01888	! t0_kref+0x3a94:   	fitos	%f8, %f10
	.word	0x2e480002	! t0_kref+0x3a98:   	bvs,a,pt	%icc, _kref+0x3aa0
	.word	0xda363ffa	! t0_kref+0x3a9c:   	sth	%o5, [%i0 - 6]
	.word	0xd43e7fe8	! t0_kref+0x3aa0:   	std	%o2, [%i1 - 0x18]
	.word	0xaa9a0017	! t0_kref+0x3aa4:   	xorcc	%o0, %l7, %l5
	.word	0xa3a00126	! t0_kref+0x3aa8:   	fabss	%f6, %f17
	.word	0x8da249b9	! t0_kref+0x3aac:   	fdivs	%f9, %f25, %f6
	.word	0x27480004	! t0_kref+0x3ab0:   	fbul,a,pt	%fcc0, _kref+0x3ac0
	.word	0xdd20a030	! t0_kref+0x3ab4:   	st	%f14, [%g2 + 0x30]
	.word	0xd628a005	! t0_kref+0x3ab8:   	stb	%o3, [%g2 + 5]
	.word	0xaba018d8	! t0_kref+0x3abc:   	fdtos	%f24, %f21
	.word	0xd42e7ff5	! t0_kref+0x3ac0:   	stb	%o2, [%i1 - 0xb]
	sethi	%hi(2f), %o7
	.word	0xe40be2f4	! t0_kref+0x3ac8:   	ldub	[%o7 + 0x2f4], %l2
	.word	0xa41ca00c	! t0_kref+0x3acc:   	xor	%l2, 0xc, %l2
	.word	0xe42be2f4	! t0_kref+0x3ad0:   	stb	%l2, [%o7 + 0x2f4]
	.word	0x81dbe2f4	! t0_kref+0x3ad4:   	flush	%o7 + 0x2f4
	.word	0xd848a00b	! t0_kref+0x3ad8:   	ldsb	[%g2 + 0xb], %o4
	.word	0xe81e2018	! t0_kref+0x3adc:   	ldd	[%i0 + 0x18], %l4
	.word	0xa9a0108a	! t0_kref+0x3ae0:   	fxtos	%f10, %f20
	.word	0x97a000a2	! t0_kref+0x3ae4:   	fnegs	%f2, %f11
	.word	0x94034008	! t0_kref+0x3ae8:   	add	%o5, %o0, %o2
	.word	0xea00a020	! t0_kref+0x3aec:   	ld	[%g2 + 0x20], %l5
	.word	0xf6364000	! t0_kref+0x3af0:   	sth	%i3, [%i1]
2:	.word	0xaa1dc008	! t0_kref+0x3af4:   	xor	%l7, %o0, %l5
	.word	0x29800002	! t0_kref+0x3af8:   	fbl,a	_kref+0x3b00
	.word	0x953a4000	! t0_kref+0x3afc:   	sra	%o1, %g0, %o2
	.word	0xd0167ff4	! t0_kref+0x3b00:   	lduh	[%i1 - 0xc], %o0
	.word	0x2f800003	! t0_kref+0x3b04:   	fbu,a	_kref+0x3b10
	.word	0xaa3b6e5d	! t0_kref+0x3b08:   	xnor	%o5, 0xe5d, %l5
	.word	0xaf400000	! t0_kref+0x3b0c:   	mov	%y, %l7
	.word	0x81ae4ab8	! t0_kref+0x3b10:   	fcmpes	%fcc0, %f25, %f24
	.word	0xe120a038	! t0_kref+0x3b14:   	st	%f16, [%g2 + 0x38]
	.word	0xd430a026	! t0_kref+0x3b18:   	sth	%o2, [%g2 + 0x26]
	.word	0xab2a400a	! t0_kref+0x3b1c:   	sll	%o1, %o2, %l5
	call	SYM(t0_subr1)
	.word	0x9046b26b	! t0_kref+0x3b24:   	addc	%i2, -0xd95, %o0
	.word	0x2a800008	! t0_kref+0x3b28:   	bcs,a	_kref+0x3b48
	.word	0x85a000a9	! t0_kref+0x3b2c:   	fnegs	%f9, %f2
	.word	0xad400000	! t0_kref+0x3b30:   	mov	%y, %l6
	.word	0x35480005	! t0_kref+0x3b34:   	fbue,a,pt	%fcc0, _kref+0x3b48
	.word	0xd04e601d	! t0_kref+0x3b38:   	ldsb	[%i1 + 0x1d], %o0
	.word	0x905deeca	! t0_kref+0x3b3c:   	smul	%l7, 0xeca, %o0
	.word	0xf13e6008	! t0_kref+0x3b40:   	std	%f24, [%i1 + 8]
	.word	0xaedee71f	! t0_kref+0x3b44:   	smulcc	%i3, 0x71f, %l7
	.word	0xa7a249ae	! t0_kref+0x3b48:   	fdivs	%f9, %f14, %f19
	.word	0x19330344	! t0_kref+0x3b4c:   	sethi	%hi(0xcc0d1000), %o4
	.word	0xed1f4019	! t0_kref+0x3b50:   	ldd	[%i5 + %i1], %f22
	.word	0xe300a01c	! t0_kref+0x3b54:   	ld	[%g2 + 0x1c], %f17
	.word	0xd4a6101c	! t0_kref+0x3b58:   	sta	%o2, [%i0 + %i4]0x80
	.word	0xaeaa71c4	! t0_kref+0x3b5c:   	andncc	%o1, -0xe3c, %l7
	.word	0xb1a309ac	! t0_kref+0x3b60:   	fdivs	%f12, %f12, %f24
	.word	0xada01a40	! t0_kref+0x3b64:   	fdtoi	%f0, %f22
	.word	0x3f800007	! t0_kref+0x3b68:   	fbo,a	_kref+0x3b84
	.word	0xae3a62b5	! t0_kref+0x3b6c:   	xnor	%o1, 0x2b5, %l7
	.word	0x21480007	! t0_kref+0x3b70:   	fbn,a,pt	%fcc0, _kref+0x3b8c
	.word	0x9856aa3f	! t0_kref+0x3b74:   	umul	%i2, 0xa3f, %o4
	.word	0x81a5094e	! t0_kref+0x3b78:   	fmuld	%f20, %f14, %f0
	.word	0x9890001b	! t0_kref+0x3b7c:   	orcc	%g0, %i3, %o4
	.word	0xae07001c	! t0_kref+0x3b80:   	add	%i4, %i4, %l7
	.word	0x993a6005	! t0_kref+0x3b84:   	sra	%o1, 0x5, %o4
	.word	0x89a148a8	! t0_kref+0x3b88:   	fsubs	%f5, %f8, %f4
	.word	0xa61b75f2	! t0_kref+0x3b8c:   	xor	%o5, -0xa0e, %l3
	.word	0xe96e401a	! t0_kref+0x3b90:   	prefetch	%i1 + %i2, 20
	.word	0xfd6e001b	! t0_kref+0x3b94:   	prefetch	%i0 + %i3, 30
	.word	0xaa45c01c	! t0_kref+0x3b98:   	addc	%l7, %i4, %l5
	.word	0x81ab0046	! t0_kref+0x3b9c:   	fmovduge	%fcc0, %f6, %f0
	.word	0xea48a008	! t0_kref+0x3ba0:   	ldsb	[%g2 + 8], %l5
	.word	0x9b70000a	! t0_kref+0x3ba4:   	popc	%o2, %o5
	.word	0x8d82f9f2	! t0_kref+0x3ba8:   	wr	%o3, 0xfffff9f2, %fprs
	.word	0xafa000a5	! t0_kref+0x3bac:   	fnegs	%f5, %f23
	call	SYM(t0_subr3)
	.word	0xe608a02b	! t0_kref+0x3bb4:   	ldub	[%g2 + 0x2b], %l3
	.word	0xd11fbf48	! t0_kref+0x3bb8:   	ldd	[%fp - 0xb8], %f8
	.word	0xa3a6c920	! t0_kref+0x3bbc:   	fmuls	%f27, %f0, %f17
	.word	0xd0163fe2	! t0_kref+0x3bc0:   	lduh	[%i0 - 0x1e], %o0
	.word	0x9eb3400b	! t0_kref+0x3bc4:   	orncc	%o5, %o3, %o7
	.word	0x93a5883b	! t0_kref+0x3bc8:   	fadds	%f22, %f27, %f9
	.word	0xd450a038	! t0_kref+0x3bcc:   	ldsh	[%g2 + 0x38], %o2
	.word	0xee20a014	! t0_kref+0x3bd0:   	st	%l7, [%g2 + 0x14]
	.word	0xd920a028	! t0_kref+0x3bd4:   	st	%f12, [%g2 + 0x28]
	sethi	%hi(2f), %o7
	.word	0xe40be3f8	! t0_kref+0x3bdc:   	ldub	[%o7 + 0x3f8], %l2
	.word	0xa41ca00c	! t0_kref+0x3be0:   	xor	%l2, 0xc, %l2
	.word	0xe42be3f8	! t0_kref+0x3be4:   	stb	%l2, [%o7 + 0x3f8]
	.word	0x81dbe3f8	! t0_kref+0x3be8:   	flush	%o7 + 0x3f8
	.word	0x91332015	! t0_kref+0x3bec:   	srl	%o4, 0x15, %o0
	.word	0x94a3000b	! t0_kref+0x3bf0:   	subcc	%o4, %o3, %o2
	.word	0xaafdf2df	! t0_kref+0x3bf4:   	sdivcc	%l7, -0xd21, %l5
2:	.word	0x94d5e3bf	! t0_kref+0x3bf8:   	umulcc	%l7, 0x3bf, %o2
	.word	0xaba0002a	! t0_kref+0x3bfc:   	fmovs	%f10, %f21
	.word	0xe8871018	! t0_kref+0x3c00:   	lda	[%i4 + %i0]0x80, %l4
	.word	0xec08a016	! t0_kref+0x3c04:   	ldub	[%g2 + 0x16], %l6
	.word	0xd428a03b	! t0_kref+0x3c08:   	stb	%o2, [%g2 + 0x3b]
	.word	0x81dc400e	! t0_kref+0x3c0c:   	flush	%l1 + %sp
	.word	0xa9a14d26	! t0_kref+0x3c10:   	fsmuld	%f5, %f6, %f20
	.word	0x21480008	! t0_kref+0x3c14:   	fbn,a,pt	%fcc0, _kref+0x3c34
	.word	0xb5a50944	! t0_kref+0x3c18:   	fmuld	%f20, %f4, %f26
	.word	0x81ad0a48	! t0_kref+0x3c1c:   	fcmpd	%fcc0, %f20, %f8
	.word	0x95a508ce	! t0_kref+0x3c20:   	fsubd	%f20, %f14, %f10
	.word	0x9062f24b	! t0_kref+0x3c24:   	subc	%o3, -0xdb5, %o0
	.word	0x963eb100	! t0_kref+0x3c28:   	xnor	%i2, -0xf00, %o3
	.word	0x9da01a2b	! t0_kref+0x3c2c:   	fstoi	%f11, %f14
	.word	0x8143c000	! t0_kref+0x3c30:   	stbar
	.word	0xa87ac00a	! t0_kref+0x3c34:   	sdiv	%o3, %o2, %l4
	.word	0x91a08820	! t0_kref+0x3c38:   	fadds	%f2, %f0, %f8
	.word	0xa5a00531	! t0_kref+0x3c3c:   	fsqrts	%f17, %f18
	.word	0xa6da2967	! t0_kref+0x3c40:   	smulcc	%o0, 0x967, %l3
	.word	0xa856800b	! t0_kref+0x3c44:   	umul	%i2, %o3, %l4
	.word	0xec30001b	! t0_kref+0x3c48:   	sth	%l6, [%g0 + %i3]
	.word	0xd24e3ff8	! t0_kref+0x3c4c:   	ldsb	[%i0 - 8], %o1
	.word	0x9e8b401c	! t0_kref+0x3c50:   	andcc	%o5, %i4, %o7
	.word	0x2d800007	! t0_kref+0x3c54:   	fbg,a	_kref+0x3c70
	.word	0xac56ff72	! t0_kref+0x3c58:   	umul	%i3, -0x8e, %l6
	.word	0x98973ae5	! t0_kref+0x3c5c:   	orcc	%i4, -0x51b, %o4
	.word	0xd840a034	! t0_kref+0x3c60:   	ldsw	[%g2 + 0x34], %o4
	.word	0x9213001a	! t0_kref+0x3c64:   	or	%o4, %i2, %o1
	.word	0xee700018	! t0_kref+0x3c68:   	stx	%l7, [%g0 + %i0]
	.word	0x9ba01a32	! t0_kref+0x3c6c:   	fstoi	%f18, %f13
	.word	0x81a98a58	! t0_kref+0x3c70:   	fcmpd	%fcc0, %f6, %f24
	.word	0x8143e040	! t0_kref+0x3c74:   	membar	0x40
	.word	0xe640a010	! t0_kref+0x3c78:   	ldsw	[%g2 + 0x10], %l3
	.word	0x81ac0a46	! t0_kref+0x3c7c:   	fcmpd	%fcc0, %f16, %f6
	.word	0xd11e2010	! t0_kref+0x3c80:   	ldd	[%i0 + 0x10], %f8
	.word	0xda480019	! t0_kref+0x3c84:   	ldsb	[%g0 + %i1], %o5
	.word	0xf620a038	! t0_kref+0x3c88:   	st	%i3, [%g2 + 0x38]
	.word	0x95a109a5	! t0_kref+0x3c8c:   	fdivs	%f4, %f5, %f10
	.word	0x81ab0aa0	! t0_kref+0x3c90:   	fcmpes	%fcc0, %f12, %f0
	call	SYM(t0_subr1)
	.word	0x9203400c	! t0_kref+0x3c98:   	add	%o5, %o4, %o1
	.word	0xaac03b60	! t0_kref+0x3c9c:   	addccc	%g0, -0x4a0, %l5
	.word	0xed1fbe88	! t0_kref+0x3ca0:   	ldd	[%fp - 0x178], %f22
	.word	0xa7400000	! t0_kref+0x3ca4:   	mov	%y, %l3
	.word	0xde00a010	! t0_kref+0x3ca8:   	ld	[%g2 + 0x10], %o7
	.word	0x2b234671	! t0_kref+0x3cac:   	sethi	%hi(0x8d19c400), %l5
	.word	0xd300a00c	! t0_kref+0x3cb0:   	ld	[%g2 + 0xc], %f9
	.word	0x8fa0012f	! t0_kref+0x3cb4:   	fabss	%f15, %f7
	.word	0x28800002	! t0_kref+0x3cb8:   	bleu,a	_kref+0x3cc0
	.word	0xe848a037	! t0_kref+0x3cbc:   	ldsb	[%g2 + 0x37], %l4
	.word	0x8143c000	! t0_kref+0x3cc0:   	stbar
	.word	0x3b800006	! t0_kref+0x3cc4:   	fble,a	_kref+0x3cdc
	.word	0x9e7b36b9	! t0_kref+0x3cc8:   	sdiv	%o4, -0x947, %o7
	.word	0xf620a000	! t0_kref+0x3ccc:   	st	%i3, [%g2]
	.word	0xef6e401c	! t0_kref+0x3cd0:   	prefetch	%i1 + %i4, 23
	.word	0xa7a000ad	! t0_kref+0x3cd4:   	fnegs	%f13, %f19
	.word	0x930af95a	! t0_kref+0x3cd8:   	tsubcc	%o3, -0x6a6, %o1
	.word	0xd610a012	! t0_kref+0x3cdc:   	lduh	[%g2 + 0x12], %o3
	.word	0xa5a40920	! t0_kref+0x3ce0:   	fmuls	%f16, %f0, %f18
	.word	0x27480004	! t0_kref+0x3ce4:   	fbul,a,pt	%fcc0, _kref+0x3cf4
	.word	0xb8102010	! t0_kref+0x3ce8:   	mov	0x10, %i4
	.word	0xa63a401a	! t0_kref+0x3cec:   	xnor	%o1, %i2, %l3
	.word	0xada208d4	! t0_kref+0x3cf0:   	fsubd	%f8, %f20, %f22
	.word	0xd848a028	! t0_kref+0x3cf4:   	ldsb	[%g2 + 0x28], %o4
	.word	0x96b6a6ac	! t0_kref+0x3cf8:   	orncc	%i2, 0x6ac, %o3
	.word	0xb6102018	! t0_kref+0x3cfc:   	mov	0x18, %i3
	.word	0x2f800001	! t0_kref+0x3d00:   	fbu,a	_kref+0x3d04
	.word	0xc51f4019	! t0_kref+0x3d04:   	ldd	[%i5 + %i1], %f2
	.word	0xde070019	! t0_kref+0x3d08:   	ld	[%i4 + %i1], %o7
	sethi	%hi(2f), %o7
	.word	0xe40be148	! t0_kref+0x3d10:   	ldub	[%o7 + 0x148], %l2
	.word	0xa41ca00c	! t0_kref+0x3d14:   	xor	%l2, 0xc, %l2
	.word	0xe42be148	! t0_kref+0x3d18:   	stb	%l2, [%o7 + 0x148]
	.word	0x81dbe148	! t0_kref+0x3d1c:   	flush	%o7 + 0x148
	.word	0x3b800006	! t0_kref+0x3d20:   	fble,a	_kref+0x3d38
	.word	0xa5a000b4	! t0_kref+0x3d24:   	fnegs	%f20, %f18
	.word	0xe278a00c	! t0_kref+0x3d28:   	swap	[%g2 + 0xc], %l1
	.word	0xc020a00c	! t0_kref+0x3d2c:   	clr	[%g2 + 0xc]
	.word	0xee30a02c	! t0_kref+0x3d30:   	sth	%l7, [%g2 + 0x2c]
	.word	0xa6323ffc	! t0_kref+0x3d34:   	orn	%o0, -0x4, %l3
	.word	0xd848a01e	! t0_kref+0x3d38:   	ldsb	[%g2 + 0x1e], %o4
	.word	0x9e8a401c	! t0_kref+0x3d3c:   	andcc	%o1, %i4, %o7
	.word	0xb1a01a2e	! t0_kref+0x3d40:   	fstoi	%f14, %f24
	.word	0xa7322003	! t0_kref+0x3d44:   	srl	%o0, 0x3, %l3
2:	.word	0xaa75c01b	! t0_kref+0x3d48:   	udiv	%l7, %i3, %l5
	.word	0x29480005	! t0_kref+0x3d4c:   	fbl,a,pt	%fcc0, _kref+0x3d60
	.word	0xa6134009	! t0_kref+0x3d50:   	or	%o5, %o1, %l3
	.word	0x8fa00123	! t0_kref+0x3d54:   	fabss	%f3, %f7
	.word	0x39480003	! t0_kref+0x3d58:   	fbuge,a,pt	%fcc0, _kref+0x3d64
	.word	0xd04e401a	! t0_kref+0x3d5c:   	ldsb	[%i1 + %i2], %o0
	.word	0x81a00021	! t0_kref+0x3d60:   	fmovs	%f1, %f0
	.word	0xac6361e2	! t0_kref+0x3d64:   	subc	%o5, 0x1e2, %l6
	.word	0xda801019	! t0_kref+0x3d68:   	lda	[%g0 + %i1]0x80, %o5
	.word	0x81dea8fb	! t0_kref+0x3d6c:   	flush	%i2 + 0x8fb
	.word	0xdede101d	! t0_kref+0x3d70:   	ldxa	[%i0 + %i5]0x80, %o7
	.word	0x97a288b5	! t0_kref+0x3d74:   	fsubs	%f10, %f21, %f11
	.word	0x94180008	! t0_kref+0x3d78:   	xor	%g0, %o0, %o2
	.word	0x81ac4a28	! t0_kref+0x3d7c:   	fcmps	%fcc0, %f17, %f8
	.word	0xe3b8a080	! t0_kref+0x3d80:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xc030a03c	! t0_kref+0x3d84:   	clrh	[%g2 + 0x3c]
	.word	0x9ade801b	! t0_kref+0x3d88:   	smulcc	%i2, %i3, %o5
	.word	0x91a01a34	! t0_kref+0x3d8c:   	fstoi	%f20, %f8
	.word	0xdc216bf0	! t0_kref+0x3d90:   	st	%sp, [%g5 + 0xbf0]
	.word	0x33480003	! t0_kref+0x3d94:   	fbe,a,pt	%fcc0, _kref+0x3da0
	.word	0xac93401c	! t0_kref+0x3d98:   	orcc	%o5, %i4, %l6
	call	SYM(t0_subr1)
	.word	0x94b6801a	! t0_kref+0x3da0:   	orncc	%i2, %i2, %o2
	.word	0x2d480006	! t0_kref+0x3da4:   	fbg,a,pt	%fcc0, _kref+0x3dbc
	.word	0x9f65801a	! t0_kref+0x3da8:   	movneg	%icc, %i2, %o7
	.word	0xa63f001a	! t0_kref+0x3dac:   	xnor	%i4, %i2, %l3
	.word	0xd03e001d	! t0_kref+0x3db0:   	std	%o0, [%i0 + %i5]
	.word	0xaba34921	! t0_kref+0x3db4:   	fmuls	%f13, %f1, %f21
	.word	0xc51fbf08	! t0_kref+0x3db8:   	ldd	[%fp - 0xf8], %f2
	.word	0xc91e3ff8	! t0_kref+0x3dbc:   	ldd	[%i0 - 8], %f4
	call	SYM(t0_subr3)
	.word	0x8da00131	! t0_kref+0x3dc4:   	fabss	%f17, %f6
	.word	0xac324008	! t0_kref+0x3dc8:   	orn	%o1, %o0, %l6
	.word	0x8143c000	! t0_kref+0x3dcc:   	stbar
	.word	0xecdf5018	! t0_kref+0x3dd0:   	ldxa	[%i5 + %i0]0x80, %l6
	.word	0x98fdfd26	! t0_kref+0x3dd4:   	sdivcc	%l7, -0x2da, %o4
	call	SYM(t0_subr3)
	.word	0x96fb29b3	! t0_kref+0x3ddc:   	sdivcc	%o4, 0x9b3, %o3
	.word	0x9e5b374f	! t0_kref+0x3de0:   	smul	%o4, -0x8b1, %o7
	.word	0xa5a50929	! t0_kref+0x3de4:   	fmuls	%f20, %f9, %f18
	.word	0x35480001	! t0_kref+0x3de8:   	fbue,a,pt	%fcc0, _kref+0x3dec
	.word	0xd850a026	! t0_kref+0x3dec:   	ldsh	[%g2 + 0x26], %o4
	.word	0x81a88a48	! t0_kref+0x3df0:   	fcmpd	%fcc0, %f2, %f8
	.word	0xe6ce5000	! t0_kref+0x3df4:   	ldsba	[%i1]0x80, %l3
	.word	0x81ddebfb	! t0_kref+0x3df8:   	flush	%l7 + 0xbfb
	.word	0x95a488c2	! t0_kref+0x3dfc:   	fsubd	%f18, %f2, %f10
	.word	0x923e8000	! t0_kref+0x3e00:   	not	%i2, %o1
	.word	0xe99e1000	! t0_kref+0x3e04:   	ldda	[%i0]0x80, %f20
	.word	0xa9a688c6	! t0_kref+0x3e08:   	fsubd	%f26, %f6, %f20
	.word	0x81a90a46	! t0_kref+0x3e0c:   	fcmpd	%fcc0, %f4, %f6
	.word	0x93a649ab	! t0_kref+0x3e10:   	fdivs	%f25, %f11, %f9
	.word	0x99a009c2	! t0_kref+0x3e14:   	fdivd	%f0, %f2, %f12
	.word	0xab36a01f	! t0_kref+0x3e18:   	srl	%i2, 0x1f, %l5
	.word	0x9a76eda3	! t0_kref+0x3e1c:   	udiv	%i3, 0xda3, %o5
	.word	0xb3a00532	! t0_kref+0x3e20:   	fsqrts	%f18, %f25
	.word	0xd40e3fff	! t0_kref+0x3e24:   	ldub	[%i0 - 1], %o2
	.word	0xac45f860	! t0_kref+0x3e28:   	addc	%l7, -0x7a0, %l6
	.word	0x9966801a	! t0_kref+0x3e2c:   	movg	%icc, %i2, %o4
	.word	0xe848a020	! t0_kref+0x3e30:   	ldsb	[%g2 + 0x20], %l4
	.word	0xe9ee101c	! t0_kref+0x3e34:   	prefetcha	%i0 + %i4, 20
	.word	0xdd3e401d	! t0_kref+0x3e38:   	std	%f14, [%i1 + %i5]
	.word	0x9215c000	! t0_kref+0x3e3c:   	or	%l7, %g0, %o1
	.word	0x93a0012e	! t0_kref+0x3e40:   	fabss	%f14, %f9
	.word	0xaa330017	! t0_kref+0x3e44:   	orn	%o4, %l7, %l5
	.word	0x9335e01d	! t0_kref+0x3e48:   	srl	%l7, 0x1d, %o1
	.word	0xaa0a24ba	! t0_kref+0x3e4c:   	and	%o0, 0x4ba, %l5
	.word	0x9e5a4009	! t0_kref+0x3e50:   	smul	%o1, %o1, %o7
	.word	0xa6326516	! t0_kref+0x3e54:   	orn	%o1, 0x516, %l3
	.word	0x942739a8	! t0_kref+0x3e58:   	sub	%i4, -0x658, %o2
	.word	0xa7a00538	! t0_kref+0x3e5c:   	fsqrts	%f24, %f19
	.word	0x85872df4	! t0_kref+0x3e60:   	wr	%i4, 0xdf4, %ccr
	.word	0x98af3314	! t0_kref+0x3e64:   	andncc	%i4, -0xcec, %o4
	.word	0x99a04d2b	! t0_kref+0x3e68:   	fsmuld	%f1, %f11, %f12
	.word	0xeeb6101b	! t0_kref+0x3e6c:   	stha	%l7, [%i0 + %i3]0x80
	.word	0x9a8b3877	! t0_kref+0x3e70:   	andcc	%o4, -0x789, %o5
	.word	0xa856f8ea	! t0_kref+0x3e74:   	umul	%i3, -0x716, %l4
	.word	0x89a01920	! t0_kref+0x3e78:   	fstod	%f0, %f4
	.word	0xec3f4018	! t0_kref+0x3e7c:   	std	%l6, [%i5 + %i0]
	.word	0xcd1fbe58	! t0_kref+0x3e80:   	ldd	[%fp - 0x1a8], %f6
	.word	0x31480006	! t0_kref+0x3e84:   	fba,a,pt	%fcc0, _kref+0x3e9c
	.word	0x9026c01b	! t0_kref+0x3e88:   	sub	%i3, %i3, %o0
	.word	0x983b000c	! t0_kref+0x3e8c:   	xnor	%o4, %o4, %o4
	.word	0xe51fbde8	! t0_kref+0x3e90:   	ldd	[%fp - 0x218], %f18
	.word	0xe49e1000	! t0_kref+0x3e94:   	ldda	[%i0]0x80, %l2
	.word	0x9e1a001c	! t0_kref+0x3e98:   	xor	%o0, %i4, %o7
	.word	0x9a96c008	! t0_kref+0x3e9c:   	orcc	%i3, %o0, %o5
	.word	0xa9a01a2a	! t0_kref+0x3ea0:   	fstoi	%f10, %f20
	.word	0xa9a549aa	! t0_kref+0x3ea4:   	fdivs	%f21, %f10, %f20
	.word	0xa81b001c	! t0_kref+0x3ea8:   	xor	%o4, %i4, %l4
	.word	0x001fffff	! t0_kref+0x3eac:   	illtrap	0x1fffff
	.word	0x81ac0a5a	! t0_kref+0x3eb0:   	fcmpd	%fcc0, %f16, %f26
	.word	0xafa148b5	! t0_kref+0x3eb4:   	fsubs	%f5, %f21, %f23
	.word	0x37480002	! t0_kref+0x3eb8:   	fbge,a,pt	%fcc0, _kref+0x3ec0
	.word	0xf8b61000	! t0_kref+0x3ebc:   	stha	%i4, [%i0]0x80
	.word	0xd000a03c	! t0_kref+0x3ec0:   	ld	[%g2 + 0x3c], %o0
	.word	0xe616c018	! t0_kref+0x3ec4:   	lduh	[%i3 + %i0], %l3
	.word	0xa1a01924	! t0_kref+0x3ec8:   	fstod	%f4, %f16
	.word	0x91400000	! t0_kref+0x3ecc:   	mov	%y, %o0
	.word	0x9af68017	! t0_kref+0x3ed0:   	udivcc	%i2, %l7, %o5
	.word	0xf9ee101a	! t0_kref+0x3ed4:   	prefetcha	%i0 + %i2, 28
	.word	0x907aa04c	! t0_kref+0x3ed8:   	sdiv	%o2, 0x4c, %o0
	.word	0xada01a2a	! t0_kref+0x3edc:   	fstoi	%f10, %f22
	.word	0xa832ae80	! t0_kref+0x3ee0:   	orn	%o2, 0xe80, %l4
	.word	0x9da01888	! t0_kref+0x3ee4:   	fitos	%f8, %f14
	.word	0x89a01920	! t0_kref+0x3ee8:   	fstod	%f0, %f4
	.word	0x9022c01b	! t0_kref+0x3eec:   	sub	%o3, %i3, %o0
	.word	0xacfa737f	! t0_kref+0x3ef0:   	sdivcc	%o1, -0xc81, %l6
	.word	0xd0d6d019	! t0_kref+0x3ef4:   	ldsha	[%i3 + %i1]0x80, %o0
	.word	0x37480005	! t0_kref+0x3ef8:   	fbge,a,pt	%fcc0, _kref+0x3f0c
	.word	0x8ba00028	! t0_kref+0x3efc:   	fmovs	%f8, %f5
	.word	0x9b30201d	! t0_kref+0x3f00:   	srl	%g0, 0x1d, %o5
	.word	0xd03e7fe0	! t0_kref+0x3f04:   	std	%o0, [%i1 - 0x20]
	.word	0xd27f0019	! t0_kref+0x3f08:   	swap	[%i4 + %i1], %o1
	.word	0xda16401b	! t0_kref+0x3f0c:   	lduh	[%i1 + %i3], %o5
	.word	0xe36e001b	! t0_kref+0x3f10:   	prefetch	%i0 + %i3, 17
	.word	0x2c800004	! t0_kref+0x3f14:   	bneg,a	_kref+0x3f24
	.word	0x9ae7245e	! t0_kref+0x3f18:   	subccc	%i4, 0x45e, %o5
	.word	0x941b64e8	! t0_kref+0x3f1c:   	xor	%o5, 0x4e8, %o2
	.word	0x9fc10000	! t0_kref+0x3f20:   	call	%g4
	.word	0xd6ae1000	! t0_kref+0x3f24:   	stba	%o3, [%i0]0x80
	.word	0xab12c00c	! t0_kref+0x3f28:   	taddcctv	%o3, %o4, %l5
	.word	0xda965000	! t0_kref+0x3f2c:   	lduha	[%i1]0x80, %o5
	.word	0xcd26001c	! t0_kref+0x3f30:   	st	%f6, [%i0 + %i4]
	.word	0x3f480003	! t0_kref+0x3f34:   	fbo,a,pt	%fcc0, _kref+0x3f40
	.word	0xd210a000	! t0_kref+0x3f38:   	lduh	[%g2], %o1
	.word	0xda4e2009	! t0_kref+0x3f3c:   	ldsb	[%i0 + 9], %o5
	.word	0x93a548bb	! t0_kref+0x3f40:   	fsubs	%f21, %f27, %f9
	.word	0x8143c000	! t0_kref+0x3f44:   	stbar
	.word	0xe848a00b	! t0_kref+0x3f48:   	ldsb	[%g2 + 0xb], %l4
	.word	0xa7418000	! t0_kref+0x3f4c:   	mov	%fprs, %l3
	.word	0xd400a028	! t0_kref+0x3f50:   	ld	[%g2 + 0x28], %o2
	.word	0x81ae8a54	! t0_kref+0x3f54:   	fcmpd	%fcc0, %f26, %f20
	.word	0x97a00520	! t0_kref+0x3f58:   	fsqrts	%f0, %f11
	sethi	%hi(2f), %o7
	.word	0xe40be3ac	! t0_kref+0x3f60:   	ldub	[%o7 + 0x3ac], %l2
	.word	0xa41ca00c	! t0_kref+0x3f64:   	xor	%l2, 0xc, %l2
	.word	0xe42be3ac	! t0_kref+0x3f68:   	stb	%l2, [%o7 + 0x3ac]
	.word	0x81dbe3ac	! t0_kref+0x3f6c:   	flush	%o7 + 0x3ac
	.word	0x92fa4008	! t0_kref+0x3f70:   	sdivcc	%o1, %o0, %o1
	.word	0x9e26e049	! t0_kref+0x3f74:   	sub	%i3, 0x49, %o7
	.word	0xa69a8000	! t0_kref+0x3f78:   	xorcc	%o2, %g0, %l3
	.word	0x965b000c	! t0_kref+0x3f7c:   	smul	%o4, %o4, %o3
	.word	0x981a800b	! t0_kref+0x3f80:   	xor	%o2, %o3, %o4
	.word	0xaa7f001b	! t0_kref+0x3f84:   	sdiv	%i4, %i3, %l5
	.word	0x2b800004	! t0_kref+0x3f88:   	fbug,a	_kref+0x3f98
	.word	0xd640a028	! t0_kref+0x3f8c:   	ldsw	[%g2 + 0x28], %o3
	.word	0x9e45c00a	! t0_kref+0x3f90:   	addc	%l7, %o2, %o7
	.word	0x960a33e2	! t0_kref+0x3f94:   	and	%o0, -0xc1e, %o3
	.word	0x87a01887	! t0_kref+0x3f98:   	fitos	%f7, %f3
	.word	0xaba589a5	! t0_kref+0x3f9c:   	fdivs	%f22, %f5, %f21
	.word	0x35800003	! t0_kref+0x3fa0:   	fbue,a	_kref+0x3fac
	.word	0x89a389b9	! t0_kref+0x3fa4:   	fdivs	%f14, %f25, %f4
	.word	0x928239c1	! t0_kref+0x3fa8:   	addcc	%o0, -0x63f, %o1
2:	.word	0x9a0ec01b	! t0_kref+0x3fac:   	and	%i3, %i3, %o5
	.word	0x22480005	! t0_kref+0x3fb0:   	be,a,pt	%icc, _kref+0x3fc4
	.word	0xe53e0000	! t0_kref+0x3fb4:   	std	%f18, [%i0]
	.word	0x91a188cc	! t0_kref+0x3fb8:   	fsubd	%f6, %f12, %f8
	.word	0x81a50930	! t0_kref+0x3fbc:   	fmuls	%f20, %f16, %f0
	.word	0x949aadb0	! t0_kref+0x3fc0:   	xorcc	%o2, 0xdb0, %o2
	.word	0x172fb476	! t0_kref+0x3fc4:   	sethi	%hi(0xbed1d800), %o3
	.word	0x81ae8a4e	! t0_kref+0x3fc8:   	fcmpd	%fcc0, %f26, %f14
	.word	0x9fc00004	! t0_kref+0x3fcc:   	call	%g0 + %g4
	.word	0xe8d6101b	! t0_kref+0x3fd0:   	ldsha	[%i0 + %i3]0x80, %l4
	.word	0x81a409c4	! t0_kref+0x3fd4:   	fdivd	%f16, %f4, %f0
	.word	0xda016864	! t0_kref+0x3fd8:   	ld	[%g5 + 0x864], %o5
	.word	0xd816c018	! t0_kref+0x3fdc:   	lduh	[%i3 + %i0], %o4
	.word	0x24800003	! t0_kref+0x3fe0:   	ble,a	_kref+0x3fec
	.word	0xf4264000	! t0_kref+0x3fe4:   	st	%i2, [%i1]
	.word	0xdfa65000	! t0_kref+0x3fe8:   	sta	%f15, [%i1]0x80
	.word	0x83a00129	! t0_kref+0x3fec:   	fabss	%f9, %f1
	.word	0x94b3400b	! t0_kref+0x3ff0:   	orncc	%o5, %o3, %o2
	.word	0xc07e4000	! t0_kref+0x3ff4:   	swap	[%i1], %g0
	.word	0x96aac01c	! t0_kref+0x3ff8:   	andncc	%o3, %i4, %o3
	.word	0x91a3c934	! t0_kref+0x3ffc:   	fmuls	%f15, %f20, %f8
	.word	0xa8403a32	! t0_kref+0x4000:   	addc	%g0, -0x5ce, %l4
	.word	0x8143c000	! t0_kref+0x4004:   	stbar
	.word	0x8143c000	! t0_kref+0x4008:   	stbar
	.word	0xae9a3778	! t0_kref+0x400c:   	xorcc	%o0, -0x888, %l7
	.word	0x9f418000	! t0_kref+0x4010:   	mov	%fprs, %o7
	.word	0xa3a00823	! t0_kref+0x4014:   	fadds	%f0, %f3, %f17
	.word	0xac8ef3d1	! t0_kref+0x4018:   	andcc	%i3, -0xc2f, %l6
	.word	0x8143e040	! t0_kref+0x401c:   	membar	0x40
	.word	0xfb6e001b	! t0_kref+0x4020:   	prefetch	%i0 + %i3, 29
	.word	0x9aadc00a	! t0_kref+0x4024:   	andncc	%l7, %o2, %o5
	.word	0x83a68830	! t0_kref+0x4028:   	fadds	%f26, %f16, %f1
	.word	0xd24e401a	! t0_kref+0x402c:   	ldsb	[%i1 + %i2], %o1
	.word	0xd900a03c	! t0_kref+0x4030:   	ld	[%g2 + 0x3c], %f12
	.word	0xd42e200f	! t0_kref+0x4034:   	stb	%o2, [%i0 + 0xf]
	.word	0x81aa8a46	! t0_kref+0x4038:   	fcmpd	%fcc0, %f10, %f6
	.word	0x9e8df429	! t0_kref+0x403c:   	andcc	%l7, -0xbd7, %o7
	call	SYM(t0_subr1)
	.word	0x96fa401c	! t0_kref+0x4044:   	sdivcc	%o1, %i4, %o3
	.word	0xec3e3fe8	! t0_kref+0x4048:   	std	%l6, [%i0 - 0x18]
	.word	0xe9180019	! t0_kref+0x404c:   	ldd	[%g0 + %i1], %f20
	.word	0x99a00528	! t0_kref+0x4050:   	fsqrts	%f8, %f12
	.word	0x8da0188a	! t0_kref+0x4054:   	fitos	%f10, %f6
	.word	0x9aa2c017	! t0_kref+0x4058:   	subcc	%o3, %l7, %o5
	call	SYM(t0_subr1)
	.word	0x9416801b	! t0_kref+0x4060:   	or	%i2, %i3, %o2
	.word	0xd24e8018	! t0_kref+0x4064:   	ldsb	[%i2 + %i0], %o1
	.word	0x85a0012b	! t0_kref+0x4068:   	fabss	%f11, %f2
	.word	0xda26401c	! t0_kref+0x406c:   	st	%o5, [%i1 + %i4]
	.word	0xafa6882d	! t0_kref+0x4070:   	fadds	%f26, %f13, %f23
	.word	0xae1ec00b	! t0_kref+0x4074:   	xor	%i3, %o3, %l7
	.word	0x33800007	! t0_kref+0x4078:   	fbe,a	_kref+0x4094
	.word	0x001fffff	! t0_kref+0x407c:   	illtrap	0x1fffff
	.word	0xb3a00537	! t0_kref+0x4080:   	fsqrts	%f23, %f25
	.word	0x95a00523	! t0_kref+0x4084:   	fsqrts	%f3, %f10
	.word	0x81ab0a44	! t0_kref+0x4088:   	fcmpd	%fcc0, %f12, %f4
	.word	0x992a600c	! t0_kref+0x408c:   	sll	%o1, 0xc, %o4
	call	SYM(t0_subr2)
	.word	0xd248a01d	! t0_kref+0x4094:   	ldsb	[%g2 + 0x1d], %o1
	.word	0xa1a01048	! t0_kref+0x4098:   	fdtox	%f8, %f16
	.word	0x81a688b6	! t0_kref+0x409c:   	fsubs	%f26, %f22, %f0
	.word	0x9245e0c2	! t0_kref+0x40a0:   	addc	%l7, 0xc2, %o1
	.word	0xcd1fbf38	! t0_kref+0x40a4:   	ldd	[%fp - 0xc8], %f6
	.word	0x2f480003	! t0_kref+0x40a8:   	fbu,a,pt	%fcc0, _kref+0x40b4
	.word	0xd9be5a1b	! t0_kref+0x40ac:   	stda	%f12, [%i1 + %i3]0xd0
	.word	0x9246fbb1	! t0_kref+0x40b0:   	addc	%i3, -0x44f, %o1
	.word	0xe53f4018	! t0_kref+0x40b4:   	std	%f18, [%i5 + %i0]
	.word	0xa60a8017	! t0_kref+0x40b8:   	and	%o2, %l7, %l3
	.word	0xafa0c8a4	! t0_kref+0x40bc:   	fsubs	%f3, %f4, %f23
	.word	0x92fe8000	! t0_kref+0x40c0:   	sdivcc	%i2, %g0, %o1
	.word	0xe76e401a	! t0_kref+0x40c4:   	prefetch	%i1 + %i2, 19
	call	SYM(t0_subr3)
	.word	0x81800000	! t0_kref+0x40cc:   	mov	%g0, %y
	.word	0x81ae8a48	! t0_kref+0x40d0:   	fcmpd	%fcc0, %f26, %f8
	.word	0xab3ee011	! t0_kref+0x40d4:   	sra	%i3, 0x11, %l5
	.word	0xa63ee676	! t0_kref+0x40d8:   	xnor	%i3, 0x676, %l3
	.word	0xf6b01018	! t0_kref+0x40dc:   	stha	%i3, [%g0 + %i0]0x80
	.word	0xa83f0000	! t0_kref+0x40e0:   	not	%i4, %l4
	.word	0xc0fe5000	! t0_kref+0x40e4:   	swapa	[%i1]0x80, %g0
	.word	0x9a1f22f3	! t0_kref+0x40e8:   	xor	%i4, 0x2f3, %o5
	.word	0xdd270018	! t0_kref+0x40ec:   	st	%f14, [%i4 + %i0]
	.word	0xd2270018	! t0_kref+0x40f0:   	st	%o1, [%i4 + %i0]
	.word	0x9da00525	! t0_kref+0x40f4:   	fsqrts	%f5, %f14
	.word	0xf11fbd30	! t0_kref+0x40f8:   	ldd	[%fp - 0x2d0], %f24
	.word	0xada01a2b	! t0_kref+0x40fc:   	fstoi	%f11, %f22
	.word	0x9ba00520	! t0_kref+0x4100:   	fsqrts	%f0, %f13
	.word	0x987a400a	! t0_kref+0x4104:   	sdiv	%o1, %o2, %o4
	.word	0xd620a024	! t0_kref+0x4108:   	st	%o3, [%g2 + 0x24]
	.word	0x8582800d	! t0_kref+0x410c:   	wr	%o2, %o5, %ccr
	.word	0xee7e6004	! t0_kref+0x4110:   	swap	[%i1 + 4], %l7
	.word	0xe320a034	! t0_kref+0x4114:   	st	%f17, [%g2 + 0x34]
	.word	0x23480003	! t0_kref+0x4118:   	fbne,a,pt	%fcc0, _kref+0x4124
	.word	0x921f2837	! t0_kref+0x411c:   	xor	%i4, 0x837, %o1
	.word	0x24800006	! t0_kref+0x4120:   	ble,a	_kref+0x4138
	.word	0xde00a028	! t0_kref+0x4124:   	ld	[%g2 + 0x28], %o7
	.word	0xa5a489c2	! t0_kref+0x4128:   	fdivd	%f18, %f2, %f18
	.word	0xd448a022	! t0_kref+0x412c:   	ldsb	[%g2 + 0x22], %o2
	.word	0x92af001a	! t0_kref+0x4130:   	andncc	%i4, %i2, %o1
	.word	0x81a409d2	! t0_kref+0x4134:   	fdivd	%f16, %f18, %f0
	.word	0xd830a024	! t0_kref+0x4138:   	sth	%o4, [%g2 + 0x24]
	.word	0xada049a7	! t0_kref+0x413c:   	fdivs	%f1, %f7, %f22
	.word	0xd80e201b	! t0_kref+0x4140:   	ldub	[%i0 + 0x1b], %o4
	.word	0x92032a71	! t0_kref+0x4144:   	add	%o4, 0xa71, %o1
	.word	0x97a088a6	! t0_kref+0x4148:   	fsubs	%f2, %f6, %f11
	.word	0x9ed5e48b	! t0_kref+0x414c:   	umulcc	%l7, 0x48b, %o7
	.word	0xd01e6018	! t0_kref+0x4150:   	ldd	[%i1 + 0x18], %o0
	.word	0xd8b6101b	! t0_kref+0x4154:   	stha	%o4, [%i0 + %i3]0x80
	.word	0x81def3c3	! t0_kref+0x4158:   	flush	%i3 - 0xc3d
	.word	0x91a24924	! t0_kref+0x415c:   	fmuls	%f9, %f4, %f8
	.word	0xa3a3c830	! t0_kref+0x4160:   	fadds	%f15, %f16, %f17
	.word	0xaa9ea736	! t0_kref+0x4164:   	xorcc	%i2, 0x736, %l5
	.word	0xe8163fec	! t0_kref+0x4168:   	lduh	[%i0 - 0x14], %l4
	.word	0x29800006	! t0_kref+0x416c:   	fbl,a	_kref+0x4184
	.word	0xa692321c	! t0_kref+0x4170:   	orcc	%o0, -0xde4, %l3
	.word	0xa3a1c9b1	! t0_kref+0x4174:   	fdivs	%f7, %f17, %f17
	.word	0x33800005	! t0_kref+0x4178:   	fbe,a	_kref+0x418c
	.word	0xdb20a02c	! t0_kref+0x417c:   	st	%f13, [%g2 + 0x2c]
	.word	0x93a00522	! t0_kref+0x4180:   	fsqrts	%f2, %f9
	.word	0x9fa00123	! t0_kref+0x4184:   	fabss	%f3, %f15
	.word	0xf6774018	! t0_kref+0x4188:   	stx	%i3, [%i5 + %i0]
	.word	0xd100a000	! t0_kref+0x418c:   	ld	[%g2], %f8
	.word	0xa6fa401a	! t0_kref+0x4190:   	sdivcc	%o1, %i2, %l3
	.word	0x3b480005	! t0_kref+0x4194:   	fble,a,pt	%fcc0, _kref+0x41a8
	.word	0x9892a5ae	! t0_kref+0x4198:   	orcc	%o2, 0x5ae, %o4
	.word	0x11185b72	! t0_kref+0x419c:   	sethi	%hi(0x616dc800), %o0
	.word	0xf420a018	! t0_kref+0x41a0:   	st	%i2, [%g2 + 0x18]
	.word	0xa5a00021	! t0_kref+0x41a4:   	fmovs	%f1, %f18
	.word	0x81adcab9	! t0_kref+0x41a8:   	fcmpes	%fcc0, %f23, %f25
	.word	0xaed3401a	! t0_kref+0x41ac:   	umulcc	%o5, %i2, %l7
	.word	0xa69229ba	! t0_kref+0x41b0:   	orcc	%o0, 0x9ba, %l3
	.word	0x3d480003	! t0_kref+0x41b4:   	fbule,a,pt	%fcc0, _kref+0x41c0
	.word	0xee28a011	! t0_kref+0x41b8:   	stb	%l7, [%g2 + 0x11]
	.word	0xa862c01a	! t0_kref+0x41bc:   	subc	%o3, %i2, %l4
	.word	0xc7270019	! t0_kref+0x41c0:   	st	%f3, [%i4 + %i1]
	.word	0x9de3bfa0	! t0_kref+0x41c4:   	save	%sp, -0x60, %sp
	.word	0xba5f6b67	! t0_kref+0x41c8:   	smul	%i5, 0xb67, %i5
	.word	0xafef2053	! t0_kref+0x41cc:   	restore	%i4, 0x53, %l7
	.word	0xa8d332fe	! t0_kref+0x41d0:   	umulcc	%o4, -0xd02, %l4
	.word	0x39800003	! t0_kref+0x41d4:   	fbuge,a	_kref+0x41e0
	.word	0xa9a5094a	! t0_kref+0x41d8:   	fmuld	%f20, %f10, %f20
	.word	0x1108f58e	! t0_kref+0x41dc:   	sethi	%hi(0x23d63800), %o0
	.word	0xc0f65000	! t0_kref+0x41e0:   	stxa	%g0, [%i1]0x80
	.word	0xafa089a5	! t0_kref+0x41e4:   	fdivs	%f2, %f5, %f23
	.word	0xd9be5857	! t0_kref+0x41e8:   	stda	%f12, [%i1 + %l7]0xc2
	.word	0xa7a01a2c	! t0_kref+0x41ec:   	fstoi	%f12, %f19
	.word	0x21480002	! t0_kref+0x41f0:   	fbn,a,pt	%fcc0, _kref+0x41f8
	.word	0x9ae0000b	! t0_kref+0x41f4:   	subccc	%g0, %o3, %o5
	.word	0xdb20a004	! t0_kref+0x41f8:   	st	%f13, [%g2 + 4]
	.word	0xa7a00023	! t0_kref+0x41fc:   	fmovs	%f3, %f19
	.word	0x81ab4aa0	! t0_kref+0x4200:   	fcmpes	%fcc0, %f13, %f0
	.word	0xa1a90030	! t0_kref+0x4204:   	fmovsl	%fcc0, %f16, %f16
	.word	0xac632f04	! t0_kref+0x4208:   	subc	%o4, 0xf04, %l6
	.word	0xa8372479	! t0_kref+0x420c:   	orn	%i4, 0x479, %l4
	.word	0xd720a038	! t0_kref+0x4210:   	st	%f11, [%g2 + 0x38]
	.word	0x83a00528	! t0_kref+0x4214:   	fsqrts	%f8, %f1
	.word	0xd8a65000	! t0_kref+0x4218:   	sta	%o4, [%i1]0x80
	sethi	%hi(2f), %o7
	.word	0xe40be26c	! t0_kref+0x4220:   	ldub	[%o7 + 0x26c], %l2
	.word	0xa41ca00c	! t0_kref+0x4224:   	xor	%l2, 0xc, %l2
	.word	0xe42be26c	! t0_kref+0x4228:   	stb	%l2, [%o7 + 0x26c]
	.word	0x81dbe26c	! t0_kref+0x422c:   	flush	%o7 + 0x26c
	.word	0xc300a014	! t0_kref+0x4230:   	ld	[%g2 + 0x14], %f1
	call	SYM(t0_subr3)
	.word	0xd03e7fe0	! t0_kref+0x4238:   	std	%o0, [%i1 - 0x20]
	.word	0xd51e6010	! t0_kref+0x423c:   	ldd	[%i1 + 0x10], %f10
	.word	0xb3a34930	! t0_kref+0x4240:   	fmuls	%f13, %f16, %f25
	.word	0x3f480008	! t0_kref+0x4244:   	fbo,a,pt	%fcc0, _kref+0x4264
	.word	0xb5a3c92c	! t0_kref+0x4248:   	fmuls	%f15, %f12, %f26
	.word	0x37480006	! t0_kref+0x424c:   	fbge,a,pt	%fcc0, _kref+0x4264
	.word	0xd4981018	! t0_kref+0x4250:   	ldda	[%g0 + %i0]0x80, %o2
	.word	0xa87b0000	! t0_kref+0x4254:   	sdiv	%o4, %g0, %l4
	.word	0x94130008	! t0_kref+0x4258:   	or	%o4, %o0, %o2
	.word	0xaa0f000c	! t0_kref+0x425c:   	and	%i4, %o4, %l5
	.word	0x9fc10000	! t0_kref+0x4260:   	call	%g4
	.word	0xd8c01019	! t0_kref+0x4264:   	ldswa	[%g0 + %i1]0x80, %o4
	.word	0xe3b8a040	! t0_kref+0x4268:   	stda	%f48, [%g2 + 0x40]%asi
2:	.word	0xee260000	! t0_kref+0x426c:   	st	%l7, [%i0]
	.word	0x81aa8a44	! t0_kref+0x4270:   	fcmpd	%fcc0, %f10, %f4
	.word	0x9fa00025	! t0_kref+0x4274:   	fmovs	%f5, %f15
	.word	0xdad6d018	! t0_kref+0x4278:   	ldsha	[%i3 + %i0]0x80, %o5
	.word	0x9fc00004	! t0_kref+0x427c:   	call	%g0 + %g4
	.word	0xe1be5800	! t0_kref+0x4280:   	stda	%f16, [%i1]0xc0
	.word	0x9835c00c	! t0_kref+0x4284:   	orn	%l7, %o4, %o4
	.word	0xaaab400d	! t0_kref+0x4288:   	andncc	%o5, %o5, %l5
	.word	0xaba248b8	! t0_kref+0x428c:   	fsubs	%f9, %f24, %f21
	.word	0x99a58858	! t0_kref+0x4290:   	faddd	%f22, %f24, %f12
	.word	0xa6902303	! t0_kref+0x4294:   	orcc	%g0, 0x303, %l3
	.word	0xa602aac7	! t0_kref+0x4298:   	add	%o2, 0xac7, %l3
	.word	0x89a2094c	! t0_kref+0x429c:   	fmuld	%f8, %f12, %f4
	.word	0xd650a004	! t0_kref+0x42a0:   	ldsh	[%g2 + 4], %o3
	.word	0x961ea9d1	! t0_kref+0x42a4:   	xor	%i2, 0x9d1, %o3
	.word	0x2f480002	! t0_kref+0x42a8:   	fbu,a,pt	%fcc0, _kref+0x42b0
	.word	0x9e52a43d	! t0_kref+0x42ac:   	umul	%o2, 0x43d, %o7
	.word	0xada2c820	! t0_kref+0x42b0:   	fadds	%f11, %f0, %f22
	.word	0x9da01a29	! t0_kref+0x42b4:   	fstoi	%f9, %f14
	.word	0x81df0019	! t0_kref+0x42b8:   	flush	%i4 + %i1
	.word	0x21800006	! t0_kref+0x42bc:   	fbn,a	_kref+0x42d4
	.word	0xee28a001	! t0_kref+0x42c0:   	stb	%l7, [%g2 + 1]
	.word	0x9e8ec008	! t0_kref+0x42c4:   	andcc	%i3, %o0, %o7
	.word	0x99a1c93b	! t0_kref+0x42c8:   	fmuls	%f7, %f27, %f12
	.word	0xd43e0000	! t0_kref+0x42cc:   	std	%o2, [%i0]
	.word	0x9025c017	! t0_kref+0x42d0:   	sub	%l7, %l7, %o0
	.word	0x9027001a	! t0_kref+0x42d4:   	sub	%i4, %i2, %o0
	.word	0xed00a034	! t0_kref+0x42d8:   	ld	[%g2 + 0x34], %f22
	.word	0xd8580019	! t0_kref+0x42dc:   	ldx	[%g0 + %i1], %o4
	.word	0xb6103ffc	! t0_kref+0x42e0:   	mov	0xfffffffc, %i3
	.word	0xee2e4000	! t0_kref+0x42e4:   	stb	%l7, [%i1]
	.word	0xad70000d	! t0_kref+0x42e8:   	popc	%o5, %l6
	.word	0xa68df843	! t0_kref+0x42ec:   	andcc	%l7, -0x7bd, %l3
	call	1f
	.empty
	.word	0xd240a004	! t0_kref+0x42f4:   	ldsw	[%g2 + 4], %o1
	.word	0xb1a01888	! t0_kref+0x42f8:   	fitos	%f8, %f24
	.word	0x20800004	! t0_kref+0x42fc:   	bn,a	_kref+0x430c
	.word	0xada00138	! t0_kref+0x4300:   	fabss	%f24, %f22
1:	.word	0xa633400a	! t0_kref+0x4304:   	orn	%o5, %o2, %l3
	.word	0xa65f2ff3	! t0_kref+0x4308:   	smul	%i4, 0xff3, %l3
	.word	0xa8c273c9	! t0_kref+0x430c:   	addccc	%o1, -0xc37, %l4
	.word	0x91a01898	! t0_kref+0x4310:   	fitos	%f24, %f8
	.word	0xd03e6008	! t0_kref+0x4314:   	std	%o0, [%i1 + 8]
	.word	0x92c232f0	! t0_kref+0x4318:   	addccc	%o0, -0xd10, %o1
	.word	0x23800002	! t0_kref+0x431c:   	fbne,a	_kref+0x4324
	.word	0xd41e6010	! t0_kref+0x4320:   	ldd	[%i1 + 0x10], %o2
	.word	0x32800001	! t0_kref+0x4324:   	bne,a	_kref+0x4328
	.word	0x9002800a	! t0_kref+0x4328:   	add	%o2, %o2, %o0
	call	SYM(t0_subr1)
	.word	0xb7a2c8aa	! t0_kref+0x4330:   	fsubs	%f11, %f10, %f27
	.word	0x1b306f27	! t0_kref+0x4334:   	sethi	%hi(0xc1bc9c00), %o5
	.word	0xb5a10958	! t0_kref+0x4338:   	fmuld	%f4, %f24, %f26
	.word	0x920b0008	! t0_kref+0x433c:   	and	%o4, %o0, %o1
	.word	0xac02332d	! t0_kref+0x4340:   	add	%o0, -0xcd3, %l6
	.word	0xd828a029	! t0_kref+0x4344:   	stb	%o4, [%g2 + 0x29]
	.word	0x26800006	! t0_kref+0x4348:   	bl,a	_kref+0x4360
	.word	0xd030a03a	! t0_kref+0x434c:   	sth	%o0, [%g2 + 0x3a]
	.word	0xa3a00534	! t0_kref+0x4350:   	fsqrts	%f20, %f17
	.word	0x85a01900	! t0_kref+0x4354:   	fitod	%f0, %f2
	.word	0xaf2f2005	! t0_kref+0x4358:   	sll	%i4, 0x5, %l7
	.word	0x81ab8a4c	! t0_kref+0x435c:   	fcmpd	%fcc0, %f14, %f12
	.word	0x965eaabc	! t0_kref+0x4360:   	smul	%i2, 0xabc, %o3
	.word	0xa65f2a59	! t0_kref+0x4364:   	smul	%i4, 0xa59, %l3
	.word	0xa65a800c	! t0_kref+0x4368:   	smul	%o2, %o4, %l3
	.word	0xa9a01892	! t0_kref+0x436c:   	fitos	%f18, %f20
	.word	0xb7a0188f	! t0_kref+0x4370:   	fitos	%f15, %f27
	.word	0x83a00033	! t0_kref+0x4374:   	fmovs	%f19, %f1
	.word	0xda260000	! t0_kref+0x4378:   	st	%o5, [%i0]
	.word	0xd640a000	! t0_kref+0x437c:   	ldsw	[%g2], %o3
	.word	0x21480006	! t0_kref+0x4380:   	fbn,a,pt	%fcc0, _kref+0x4398
	.word	0xd24e3ff6	! t0_kref+0x4384:   	ldsb	[%i0 - 0xa], %o1
	.word	0xd43f4018	! t0_kref+0x4388:   	std	%o2, [%i5 + %i0]
	.word	0x8ba01a26	! t0_kref+0x438c:   	fstoi	%f6, %f5
	.word	0xada64d3a	! t0_kref+0x4390:   	fsmuld	%f25, %f26, %f22
	.word	0xa3a5093a	! t0_kref+0x4394:   	fmuls	%f20, %f26, %f17
	.word	0x95a009c8	! t0_kref+0x4398:   	fdivd	%f0, %f8, %f10
	.word	0xa8c6e9c3	! t0_kref+0x439c:   	addccc	%i3, 0x9c3, %l4
	.word	0x99a209d8	! t0_kref+0x43a0:   	fdivd	%f8, %f24, %f12
	.word	0x81ab8a32	! t0_kref+0x43a4:   	fcmps	%fcc0, %f14, %f18
	.word	0x9846ed99	! t0_kref+0x43a8:   	addc	%i3, 0xd99, %o4
	.word	0xa8f330d6	! t0_kref+0x43ac:   	udivcc	%o4, -0xf2a, %l4
	.word	0x9de3bfa0	! t0_kref+0x43b0:   	save	%sp, -0x60, %sp
	.word	0x93ee3ceb	! t0_kref+0x43b4:   	restore	%i0, -0x315, %o1
	.word	0x9de3bfa0	! t0_kref+0x43b8:   	save	%sp, -0x60, %sp
	.word	0xb410001a	! t0_kref+0x43bc:   	mov	%i2, %i2
	.word	0x97ef001b	! t0_kref+0x43c0:   	restore	%i4, %i3, %o3
	.word	0x92236967	! t0_kref+0x43c4:   	sub	%o5, 0x967, %o1
	.word	0x8da609da	! t0_kref+0x43c8:   	fdivd	%f24, %f26, %f6
	.word	0xae182ba7	! t0_kref+0x43cc:   	xor	%g0, 0xba7, %l7
	.word	0xe11f4018	! t0_kref+0x43d0:   	ldd	[%i5 + %i0], %f16
	.word	0x9a4029aa	! t0_kref+0x43d4:   	addc	%g0, 0x9aa, %o5
	.word	0x9e1af078	! t0_kref+0x43d8:   	xor	%o3, -0xf88, %o7
	.word	0xe610a028	! t0_kref+0x43dc:   	lduh	[%g2 + 0x28], %l3
	.word	0x9f2dc00b	! t0_kref+0x43e0:   	sll	%l7, %o3, %o7
	.word	0x9ef32032	! t0_kref+0x43e4:   	udivcc	%o4, 0x32, %o7
	.word	0xe64e8018	! t0_kref+0x43e8:   	ldsb	[%i2 + %i0], %l3
	.word	0xda28a022	! t0_kref+0x43ec:   	stb	%o5, [%g2 + 0x22]
	.word	0x980ee37b	! t0_kref+0x43f0:   	and	%i3, 0x37b, %o4
	.word	0xd51fbf28	! t0_kref+0x43f4:   	ldd	[%fp - 0xd8], %f10
	.word	0xf8300018	! t0_kref+0x43f8:   	sth	%i4, [%g0 + %i0]
	.word	0x21800002	! t0_kref+0x43fc:   	fbn,a	_kref+0x4404
	.word	0x9b2e800a	! t0_kref+0x4400:   	sll	%i2, %o2, %o5
	.word	0x83a2092f	! t0_kref+0x4404:   	fmuls	%f8, %f15, %f1
	.word	0xa81f000c	! t0_kref+0x4408:   	xor	%i4, %o4, %l4
	.word	0x949a0017	! t0_kref+0x440c:   	xorcc	%o0, %l7, %o2
	.word	0xaa9b2949	! t0_kref+0x4410:   	xorcc	%o4, 0x949, %l5
	.word	0x99a349bb	! t0_kref+0x4414:   	fdivs	%f13, %f27, %f12
	.word	0xcd00a024	! t0_kref+0x4418:   	ld	[%g2 + 0x24], %f6
	.word	0xad17292c	! t0_kref+0x441c:   	taddcctv	%i4, 0x92c, %l6
	.word	0xd410a006	! t0_kref+0x4420:   	lduh	[%g2 + 6], %o2
	.word	0xf836200a	! t0_kref+0x4424:   	sth	%i4, [%i0 + 0xa]
	.word	0x95418000	! t0_kref+0x4428:   	mov	%fprs, %o2
	.word	0x947ef97a	! t0_kref+0x442c:   	sdiv	%i3, -0x686, %o2
	.word	0xe51fbf68	! t0_kref+0x4430:   	ldd	[%fp - 0x98], %f18
	.word	0x9e5b000a	! t0_kref+0x4434:   	smul	%o4, %o2, %o7
	.word	0xe7801019	! t0_kref+0x4438:   	lda	[%g0 + %i1]0x80, %f19
	.word	0xb3a01094	! t0_kref+0x443c:   	fxtos	%f20, %f25
	.word	0xaad2ef8a	! t0_kref+0x4440:   	umulcc	%o3, 0xf8a, %l5
	.word	0xc807bfe4	! t0_kref+0x4444:   	ld	[%fp - 0x1c], %g4
	.word	0x8da188cc	! t0_kref+0x4448:   	fsubd	%f6, %f12, %f6
	.word	0xe300a028	! t0_kref+0x444c:   	ld	[%g2 + 0x28], %f17
	.word	0x9da388c4	! t0_kref+0x4450:   	fsubd	%f14, %f4, %f14
	.word	0x95a01a21	! t0_kref+0x4454:   	fstoi	%f1, %f10
	.word	0xd03e7fe8	! t0_kref+0x4458:   	std	%o0, [%i1 - 0x18]
	.word	0xd9be1809	! t0_kref+0x445c:   	stda	%f12, [%i0 + %o1]0xc0
	.word	0xacaec00d	! t0_kref+0x4460:   	andncc	%i3, %o5, %l6
	.word	0x2d800006	! t0_kref+0x4464:   	fbg,a	_kref+0x447c
	.word	0x9f32a010	! t0_kref+0x4468:   	srl	%o2, 0x10, %o7
	.word	0xaa8b4017	! t0_kref+0x446c:   	andcc	%o5, %l7, %l5
	.word	0xd096501b	! t0_kref+0x4470:   	lduha	[%i1 + %i3]0x80, %o0
	.word	0x96a80009	! t0_kref+0x4474:   	andncc	%g0, %o1, %o3
	.word	0x94c7000d	! t0_kref+0x4478:   	addccc	%i4, %o5, %o2
	.word	0x83a048af	! t0_kref+0x447c:   	fsubs	%f1, %f15, %f1
	.word	0xa60731f6	! t0_kref+0x4480:   	add	%i4, -0xe0a, %l3
	.word	0x94c5fdff	! t0_kref+0x4484:   	addccc	%l7, -0x201, %o2
	.word	0x32800005	! t0_kref+0x4488:   	bne,a	_kref+0x449c
	.word	0xb3a68826	! t0_kref+0x448c:   	fadds	%f26, %f6, %f25
	.word	0x8ba4c938	! t0_kref+0x4490:   	fmuls	%f19, %f24, %f5
	.word	0x9666800a	! t0_kref+0x4494:   	subc	%i2, %o2, %o3
	.word	0x91a1c9ac	! t0_kref+0x4498:   	fdivs	%f7, %f12, %f8
	.word	0x90c68009	! t0_kref+0x449c:   	addccc	%i2, %o1, %o0
	.word	0xad202314	! t0_kref+0x44a0:   	mulscc	%g0, 0x314, %l6
	.word	0xaafe8017	! t0_kref+0x44a4:   	sdivcc	%i2, %l7, %l5
	.word	0xda16001b	! t0_kref+0x44a8:   	lduh	[%i0 + %i3], %o5
	.word	0x8fa00534	! t0_kref+0x44ac:   	fsqrts	%f20, %f7
	.word	0xd43e4000	! t0_kref+0x44b0:   	std	%o2, [%i1]
	.word	0x3a480004	! t0_kref+0x44b4:   	bcc,a,pt	%icc, _kref+0x44c4
	.word	0x9a8dc01b	! t0_kref+0x44b8:   	andcc	%l7, %i3, %o5
	.word	0x39480002	! t0_kref+0x44bc:   	fbuge,a,pt	%fcc0, _kref+0x44c4
	.word	0x94182895	! t0_kref+0x44c0:   	xor	%g0, 0x895, %o2
	.word	0xee30a008	! t0_kref+0x44c4:   	sth	%l7, [%g2 + 8]
	.word	0xf7ee501b	! t0_kref+0x44c8:   	prefetcha	%i1 + %i3, 27
	sethi	%hi(2f), %o7
	.word	0xe40be110	! t0_kref+0x44d0:   	ldub	[%o7 + 0x110], %l2
	.word	0xa41ca00c	! t0_kref+0x44d4:   	xor	%l2, 0xc, %l2
	.word	0xe42be110	! t0_kref+0x44d8:   	stb	%l2, [%o7 + 0x110]
	.word	0x81dbe110	! t0_kref+0x44dc:   	flush	%o7 + 0x110
	.word	0xa1a208c8	! t0_kref+0x44e0:   	fsubd	%f8, %f8, %f16
	.word	0x33800007	! t0_kref+0x44e4:   	fbe,a	_kref+0x4500
	.word	0xec3e2000	! t0_kref+0x44e8:   	std	%l6, [%i0]
	.word	0xc36e2010	! t0_kref+0x44ec:   	prefetch	%i0 + 0x10, 1
	.word	0xac02f9a7	! t0_kref+0x44f0:   	add	%o3, -0x659, %l6
	.word	0x9a52c01c	! t0_kref+0x44f4:   	umul	%o3, %i4, %o5
	.word	0x3f480001	! t0_kref+0x44f8:   	fbo,a,pt	%fcc0, _kref+0x44fc
	.word	0xaf400000	! t0_kref+0x44fc:   	mov	%y, %l7
	.word	0x9075f25c	! t0_kref+0x4500:   	udiv	%l7, -0xda4, %o0
	.word	0xd0380019	! t0_kref+0x4504:   	std	%o0, [%g0 + %i1]
	.word	0xa5a00035	! t0_kref+0x4508:   	fmovs	%f21, %f18
	.word	0x81ae8a22	! t0_kref+0x450c:   	fcmps	%fcc0, %f26, %f2
2:	.word	0xaba00137	! t0_kref+0x4510:   	fabss	%f23, %f21
	.word	0xac3b64bf	! t0_kref+0x4514:   	xnor	%o5, 0x4bf, %l6
	.word	0x23480003	! t0_kref+0x4518:   	fbne,a,pt	%fcc0, _kref+0x4524
	.word	0x95a489b1	! t0_kref+0x451c:   	fdivs	%f18, %f17, %f10
	.word	0x9fc00004	! t0_kref+0x4520:   	call	%g0 + %g4
	.word	0xea4e600c	! t0_kref+0x4524:   	ldsb	[%i1 + 0xc], %l5
	.word	0xaba00135	! t0_kref+0x4528:   	fabss	%f21, %f21
	.word	0xa83df189	! t0_kref+0x452c:   	xnor	%l7, -0xe77, %l4
	.word	0xa8c3001b	! t0_kref+0x4530:   	addccc	%o4, %i3, %l4
	.word	0x81820000	! t0_kref+0x4534:   	wr	%o0, %g0, %y
	.word	0x94936e45	! t0_kref+0x4538:   	orcc	%o5, 0xe45, %o2
	sethi	%hi(2f), %o7
	.word	0xe40be174	! t0_kref+0x4540:   	ldub	[%o7 + 0x174], %l2
	.word	0xa41ca00c	! t0_kref+0x4544:   	xor	%l2, 0xc, %l2
	.word	0xe42be174	! t0_kref+0x4548:   	stb	%l2, [%o7 + 0x174]
	.word	0x81dbe174	! t0_kref+0x454c:   	flush	%o7 + 0x174
	.word	0x28480005	! t0_kref+0x4550:   	bleu,a,pt	%icc, _kref+0x4564
	.word	0xde4e0000	! t0_kref+0x4554:   	ldsb	[%i0], %o7
	.word	0x2e800008	! t0_kref+0x4558:   	bvs,a	_kref+0x4578
	.word	0xae92801b	! t0_kref+0x455c:   	orcc	%o2, %i3, %l7
	.word	0xb5a60d34	! t0_kref+0x4560:   	fsmuld	%f24, %f20, %f26
	.word	0x2e800005	! t0_kref+0x4564:   	bvs,a	_kref+0x4578
	.word	0x9a9732b1	! t0_kref+0x4568:   	orcc	%i4, -0xd4f, %o5
	.word	0xafa01a24	! t0_kref+0x456c:   	fstoi	%f4, %f23
	.word	0x81db0004	! t0_kref+0x4570:   	flush	%o4 + %g4
2:	.word	0x8da04d2f	! t0_kref+0x4574:   	fsmuld	%f1, %f15, %f6
	.word	0xee28a007	! t0_kref+0x4578:   	stb	%l7, [%g2 + 7]
	.word	0xe9380019	! t0_kref+0x457c:   	std	%f20, [%g0 + %i1]
	.word	0x99a10952	! t0_kref+0x4580:   	fmuld	%f4, %f18, %f12
	.word	0xada0014a	! t0_kref+0x4584:   	fabsd	%f10, %f22
	.word	0xd5871018	! t0_kref+0x4588:   	lda	[%i4 + %i0]0x80, %f10
	.word	0x29480008	! t0_kref+0x458c:   	fbl,a,pt	%fcc0, _kref+0x45ac
	.word	0x99a48d33	! t0_kref+0x4590:   	fsmuld	%f18, %f19, %f12
	.word	0x96d2ec5e	! t0_kref+0x4594:   	umulcc	%o3, 0xc5e, %o3
	.word	0xae00000d	! t0_kref+0x4598:   	add	%g0, %o5, %l7
	.word	0xaadec009	! t0_kref+0x459c:   	smulcc	%i3, %o1, %l5
	.word	0xac16bf60	! t0_kref+0x45a0:   	or	%i2, -0xa0, %l6
	.word	0x8ba01a2b	! t0_kref+0x45a4:   	fstoi	%f11, %f5
	.word	0xdd00a018	! t0_kref+0x45a8:   	ld	[%g2 + 0x18], %f14
	.word	0x8610200f	! t0_kref+0x45ac:   	mov	0xf, %g3
	.word	0x86a0e001	! t0_kref+0x45b0:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x45b4:   	be,a	_kref+0x4624
	.word	0xac12fd94	! t0_kref+0x45b8:   	or	%o3, -0x26c, %l6
	.word	0x93a3482d	! t0_kref+0x45bc:   	fadds	%f13, %f13, %f9
	.word	0x2ebffffc	! t0_kref+0x45c0:   	bvs,a	_kref+0x45b0
	.word	0xada01a2c	! t0_kref+0x45c4:   	fstoi	%f12, %f22
	.word	0xe8871059	! t0_kref+0x45c8:   	lda	[%i4 + %i1]0x82, %l4
	.word	0xaf400000	! t0_kref+0x45cc:   	mov	%y, %l7
	.word	0xa1a30956	! t0_kref+0x45d0:   	fmuld	%f12, %f22, %f16
	.word	0xae98001a	! t0_kref+0x45d4:   	xorcc	%g0, %i2, %l7
	.word	0xb3a68929	! t0_kref+0x45d8:   	fmuls	%f26, %f9, %f25
	.word	0x274ffff5	! t0_kref+0x45dc:   	fbul,a,pt	%fcc0, _kref+0x45b0
	.word	0x85a50956	! t0_kref+0x45e0:   	fmuld	%f20, %f22, %f2
	.word	0x8da188cc	! t0_kref+0x45e4:   	fsubd	%f6, %f12, %f6
	.word	0xaf3a6009	! t0_kref+0x45e8:   	sra	%o1, 0x9, %l7
	.word	0x89a00152	! t0_kref+0x45ec:   	fabsd	%f18, %f4
	.word	0xacdaf85b	! t0_kref+0x45f0:   	smulcc	%o3, -0x7a5, %l6
	.word	0xa5a34931	! t0_kref+0x45f4:   	fmuls	%f13, %f17, %f18
	.word	0xd87e6014	! t0_kref+0x45f8:   	swap	[%i1 + 0x14], %o4
	.word	0x9602fb69	! t0_kref+0x45fc:   	add	%o3, -0x497, %o3
	.word	0xd11fbf40	! t0_kref+0x4600:   	ldd	[%fp - 0xc0], %f8
	.word	0xec1e4000	! t0_kref+0x4604:   	ldd	[%i1], %l6
	.word	0xc96e000b	! t0_kref+0x4608:   	prefetch	%i0 + %o3, 4
	.word	0xc5260000	! t0_kref+0x460c:   	st	%f2, [%i0]
	.word	0xd03e4000	! t0_kref+0x4610:   	std	%o0, [%i1]
	.word	0x22bfffe7	! t0_kref+0x4614:   	be,a	_kref+0x45b0
	.word	0xe41e6018	! t0_kref+0x4618:   	ldd	[%i1 + 0x18], %l2
	.word	0x9fc10000	! t0_kref+0x461c:   	call	%g4
	.word	0xaab6a6ad	! t0_kref+0x4620:   	orncc	%i2, 0x6ad, %l5
	.word	0xaeb325ba	! t0_kref+0x4624:   	orncc	%o4, 0x5ba, %l7
	.word	0x86102021	! t0_kref+0x4628:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x462c:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x4630:   	be,a	_kref+0x464c
	.word	0xe16e2010	! t0_kref+0x4634:   	prefetch	%i0 + 0x10, 16
	.word	0xa653400a	! t0_kref+0x4638:   	umul	%o5, %o2, %l3
	.word	0x21bffffc	! t0_kref+0x463c:   	fbn,a	_kref+0x462c
	.word	0x81db400c	! t0_kref+0x4640:   	flush	%o5 + %o4
	.word	0xef68a009	! t0_kref+0x4644:   	prefetch	%g2 + 9, 23
	.word	0xee20a038	! t0_kref+0x4648:   	st	%l7, [%g2 + 0x38]
	.word	0x8ba6c924	! t0_kref+0x464c:   	fmuls	%f27, %f4, %f5
	.word	0xaba00533	! t0_kref+0x4650:   	fsqrts	%f19, %f21
	.word	0x39480003	! t0_kref+0x4654:   	fbuge,a,pt	%fcc0, _kref+0x4660
	.word	0x929f2b9b	! t0_kref+0x4658:   	xorcc	%i4, 0xb9b, %o1
	.word	0xe850a032	! t0_kref+0x465c:   	ldsh	[%g2 + 0x32], %l4
	.word	0xb5a208da	! t0_kref+0x4660:   	fsubd	%f8, %f26, %f26
	.word	0xf8367fee	! t0_kref+0x4664:   	sth	%i4, [%i1 - 0x12]
	.word	0xd11fbfc0	! t0_kref+0x4668:   	ldd	[%fp - 0x40], %f8
	.word	0x9f30201a	! t0_kref+0x466c:   	srl	%g0, 0x1a, %o7
	.word	0xc5180019	! t0_kref+0x4670:   	ldd	[%g0 + %i1], %f2
	.word	0x81ae8a4a	! t0_kref+0x4674:   	fcmpd	%fcc0, %f26, %f10
	.word	0x9462c01c	! t0_kref+0x4678:   	subc	%o3, %i4, %o2
	.word	0x95a6094c	! t0_kref+0x467c:   	fmuld	%f24, %f12, %f10
	.word	0x3e480006	! t0_kref+0x4680:   	bvc,a,pt	%icc, _kref+0x4698
	.word	0x9fa018d6	! t0_kref+0x4684:   	fdtos	%f22, %f15
	.word	0x905b23c3	! t0_kref+0x4688:   	smul	%o4, 0x3c3, %o0
	.word	0xec08a033	! t0_kref+0x468c:   	ldub	[%g2 + 0x33], %l6
	.word	0xf7ee101b	! t0_kref+0x4690:   	prefetcha	%i0 + %i3, 27
	.word	0x9ba018d0	! t0_kref+0x4694:   	fdtos	%f16, %f13
	.word	0xb1a58925	! t0_kref+0x4698:   	fmuls	%f22, %f5, %f24
	.word	0xe3f6501c	! t0_kref+0x469c:   	casxa	[%i1]0x80, %i4, %l1
	.word	0x9b37001b	! t0_kref+0x46a0:   	srl	%i4, %i3, %o5
	.word	0x81ae8a31	! t0_kref+0x46a4:   	fcmps	%fcc0, %f26, %f17
	call	SYM(t0_subr1)
	.word	0xd8364000	! t0_kref+0x46ac:   	sth	%o4, [%i1]
	.word	0x81dc401c	! t0_kref+0x46b0:   	flush	%l1 + %i4
	.word	0xf8280018	! t0_kref+0x46b4:   	stb	%i4, [%g0 + %i0]
	.word	0x81dd6b08	! t0_kref+0x46b8:   	flush	%l5 + 0xb08
	.word	0xd03e4000	! t0_kref+0x46bc:   	std	%o0, [%i1]
	.word	0xd11fbe88	! t0_kref+0x46c0:   	ldd	[%fp - 0x178], %f8
	.word	0xa818000c	! t0_kref+0x46c4:   	xor	%g0, %o4, %l4
	.word	0xda00a020	! t0_kref+0x46c8:   	ld	[%g2 + 0x20], %o5
	.word	0x92023347	! t0_kref+0x46cc:   	add	%o0, -0xcb9, %o1
	.word	0xb5a40958	! t0_kref+0x46d0:   	fmuld	%f16, %f24, %f26
	.word	0x9da588d0	! t0_kref+0x46d4:   	fsubd	%f22, %f16, %f14
	sethi	%hi(2f), %o7
	.word	0xe40be318	! t0_kref+0x46dc:   	ldub	[%o7 + 0x318], %l2
	.word	0xa41ca00c	! t0_kref+0x46e0:   	xor	%l2, 0xc, %l2
	.word	0xe42be318	! t0_kref+0x46e4:   	stb	%l2, [%o7 + 0x318]
	.word	0x81dbe318	! t0_kref+0x46e8:   	flush	%o7 + 0x318
	.word	0x99a000ab	! t0_kref+0x46ec:   	fnegs	%f11, %f12
	.word	0xaf37201e	! t0_kref+0x46f0:   	srl	%i4, 0x1e, %l7
	.word	0x2f800003	! t0_kref+0x46f4:   	fbu,a	_kref+0x4700
	.word	0x9ee7001a	! t0_kref+0x46f8:   	subccc	%i4, %i2, %o7
	.word	0x9e636a8a	! t0_kref+0x46fc:   	subc	%o5, 0xa8a, %o7
	.word	0xe3b8a040	! t0_kref+0x4700:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xeb00a020	! t0_kref+0x4704:   	ld	[%g2 + 0x20], %f21
	.word	0x96223327	! t0_kref+0x4708:   	sub	%o0, -0xcd9, %o3
	.word	0xaf60000a	! t0_kref+0x470c:   	movn	%fcc0, %o2, %l7
	.word	0x32800006	! t0_kref+0x4710:   	bne,a	_kref+0x4728
	.word	0x9522001b	! t0_kref+0x4714:   	mulscc	%o0, %i3, %o2
2:	.word	0x9a5ac009	! t0_kref+0x4718:   	smul	%o3, %o1, %o5
	.word	0xea8e1000	! t0_kref+0x471c:   	lduba	[%i0]0x80, %l5
	.word	0xaac5e314	! t0_kref+0x4720:   	addccc	%l7, 0x314, %l5
	.word	0xecfe1000	! t0_kref+0x4724:   	swapa	[%i0]0x80, %l6
	.word	0xb610200e	! t0_kref+0x4728:   	mov	0xe, %i3
	.word	0xec1e2018	! t0_kref+0x472c:   	ldd	[%i0 + 0x18], %l6
	.word	0x912b2014	! t0_kref+0x4730:   	sll	%o4, 0x14, %o0
	.word	0x81aa4a35	! t0_kref+0x4734:   	fcmps	%fcc0, %f9, %f21
	.word	0xd6a71018	! t0_kref+0x4738:   	sta	%o3, [%i4 + %i0]0x80
	.word	0x93a000b7	! t0_kref+0x473c:   	fnegs	%f23, %f9
	.word	0xa60dc00d	! t0_kref+0x4740:   	and	%l7, %o5, %l3
	.word	0x151a8c4f	! t0_kref+0x4744:   	sethi	%hi(0x6a313c00), %o2
	.word	0xa6503d21	! t0_kref+0x4748:   	umul	%g0, -0x2df, %l3
	.word	0xac66800a	! t0_kref+0x474c:   	subc	%i2, %o2, %l6
	.word	0xa65b637d	! t0_kref+0x4750:   	smul	%o5, 0x37d, %l3
	.word	0xaba01a33	! t0_kref+0x4754:   	fstoi	%f19, %f21
	.word	0xaeaec009	! t0_kref+0x4758:   	andncc	%i3, %o1, %l7
	.word	0xb3a01885	! t0_kref+0x475c:   	fitos	%f5, %f25
	.word	0x98da6bbe	! t0_kref+0x4760:   	smulcc	%o1, 0xbbe, %o4
	.word	0xafa28823	! t0_kref+0x4764:   	fadds	%f10, %f3, %f23
	.word	0xaeda249a	! t0_kref+0x4768:   	smulcc	%o0, 0x49a, %l7
	.word	0xd06e2000	! t0_kref+0x476c:   	ldstub	[%i0], %o0
	.word	0xaba00037	! t0_kref+0x4770:   	fmovs	%f23, %f21
	.word	0xf828a027	! t0_kref+0x4774:   	stb	%i4, [%g2 + 0x27]
	.word	0xf11e7ff0	! t0_kref+0x4778:   	ldd	[%i1 - 0x10], %f24
	.word	0x81ae8a42	! t0_kref+0x477c:   	fcmpd	%fcc0, %f26, %f2
	.word	0xaa02000c	! t0_kref+0x4780:   	add	%o0, %o4, %l5
	.word	0xaba01a37	! t0_kref+0x4784:   	fstoi	%f23, %f21
	.word	0xa8637d79	! t0_kref+0x4788:   	subc	%o5, -0x287, %l4
	.word	0x9425c01a	! t0_kref+0x478c:   	sub	%l7, %i2, %o2
	.word	0x9a7ac00a	! t0_kref+0x4790:   	sdiv	%o3, %o2, %o5
	.word	0x91a00023	! t0_kref+0x4794:   	fmovs	%f3, %f8
	.word	0x8610201b	! t0_kref+0x4798:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x479c:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x47a0:   	be,a	_kref+0x47e0
	.word	0xae8aa6eb	! t0_kref+0x47a4:   	andcc	%o2, 0x6eb, %l7
	.word	0x90122163	! t0_kref+0x47a8:   	or	%o0, 0x163, %o0
	.word	0xe848a01d	! t0_kref+0x47ac:   	ldsb	[%g2 + 0x1d], %l4
	.word	0x91a109c0	! t0_kref+0x47b0:   	fdivd	%f4, %f0, %f8
	.word	0xd240a014	! t0_kref+0x47b4:   	ldsw	[%g2 + 0x14], %o1
	.word	0xee48a00f	! t0_kref+0x47b8:   	ldsb	[%g2 + 0xf], %l7
	.word	0x9443001a	! t0_kref+0x47bc:   	addc	%o4, %i2, %o2
	.word	0xd620a02c	! t0_kref+0x47c0:   	st	%o3, [%g2 + 0x2c]
	.word	0x81ae8a2c	! t0_kref+0x47c4:   	fcmps	%fcc0, %f26, %f12
	.word	0x8ba10920	! t0_kref+0x47c8:   	fmuls	%f4, %f0, %f5
	.word	0x9ba3c8b1	! t0_kref+0x47cc:   	fsubs	%f15, %f17, %f13
	.word	0x9ea36fef	! t0_kref+0x47d0:   	subcc	%o5, 0xfef, %o7
	.word	0x99a01a28	! t0_kref+0x47d4:   	fstoi	%f8, %f12
	.word	0x9ada8008	! t0_kref+0x47d8:   	smulcc	%o2, %o0, %o5
	.word	0xe610a014	! t0_kref+0x47dc:   	lduh	[%g2 + 0x14], %l3
	.word	0x953ee007	! t0_kref+0x47e0:   	sra	%i3, 0x7, %o2
	.word	0x941af3e3	! t0_kref+0x47e4:   	xor	%o3, -0xc1d, %o2
	.word	0x9e02e069	! t0_kref+0x47e8:   	add	%o3, 0x69, %o7
	.word	0xe648a024	! t0_kref+0x47ec:   	ldsb	[%g2 + 0x24], %l3
	.word	0xb7a00534	! t0_kref+0x47f0:   	fsqrts	%f20, %f27
	.word	0xa6feb994	! t0_kref+0x47f4:   	sdivcc	%i2, -0x66c, %l3
	.word	0x81a88aa8	! t0_kref+0x47f8:   	fcmpes	%fcc0, %f2, %f8
	.word	0xd020a010	! t0_kref+0x47fc:   	st	%o0, [%g2 + 0x10]
	.word	0xa9a0053b	! t0_kref+0x4800:   	fsqrts	%f27, %f20
	.word	0xacf26f2b	! t0_kref+0x4804:   	udivcc	%o1, 0xf2b, %l6
	.word	0x947eb148	! t0_kref+0x4808:   	sdiv	%i2, -0xeb8, %o2
	.word	0xa5a01890	! t0_kref+0x480c:   	fitos	%f16, %f18
	.word	0x81a00523	! t0_kref+0x4810:   	fsqrts	%f3, %f0
	.word	0x8fa488a0	! t0_kref+0x4814:   	fsubs	%f18, %f0, %f7
	.word	0xaef2401c	! t0_kref+0x4818:   	udivcc	%o1, %i4, %l7
	.word	0x28480005	! t0_kref+0x481c:   	bleu,a,pt	%icc, _kref+0x4830
	.word	0xaeda3fd4	! t0_kref+0x4820:   	smulcc	%o0, -0x2c, %l7
	.word	0xb3a0002a	! t0_kref+0x4824:   	fmovs	%f10, %f25
	.word	0xee16600c	! t0_kref+0x4828:   	lduh	[%i1 + 0xc], %l7
	.word	0xd700a030	! t0_kref+0x482c:   	ld	[%g2 + 0x30], %f11
	.word	0xd2162014	! t0_kref+0x4830:   	lduh	[%i0 + 0x14], %o1
	.word	0x35800002	! t0_kref+0x4834:   	fbue,a	_kref+0x483c
	.word	0x9da48830	! t0_kref+0x4838:   	fadds	%f18, %f16, %f14
	.word	0xa602e0d7	! t0_kref+0x483c:   	add	%o3, 0xd7, %l3
	.word	0x90432c57	! t0_kref+0x4840:   	addc	%o4, 0xc57, %o0
	.word	0xf6ae501a	! t0_kref+0x4844:   	stba	%i3, [%i1 + %i2]0x80
	.word	0x9fc00004	! t0_kref+0x4848:   	call	%g0 + %g4
	.word	0xf628a03f	! t0_kref+0x484c:   	stb	%i3, [%g2 + 0x3f]
	.word	0x39480004	! t0_kref+0x4850:   	fbuge,a,pt	%fcc0, _kref+0x4860
	.word	0x81db000a	! t0_kref+0x4854:   	flush	%o4 + %o2
	.word	0x9ba2c8ab	! t0_kref+0x4858:   	fsubs	%f11, %f11, %f13
	.word	0xb1a00528	! t0_kref+0x485c:   	fsqrts	%f8, %f24
	.word	0x9fa00530	! t0_kref+0x4860:   	fsqrts	%f16, %f15
	.word	0x3e800001	! t0_kref+0x4864:   	bvc,a	_kref+0x4868
	.word	0x96c28000	! t0_kref+0x4868:   	addccc	%o2, %g0, %o3
	.word	0x9f400000	! t0_kref+0x486c:   	mov	%y, %o7
	call	SYM(t0_subr2)
	.word	0xd2871018	! t0_kref+0x4874:   	lda	[%i4 + %i0]0x80, %o1
	.word	0x9fc00004	! t0_kref+0x4878:   	call	%g0 + %g4
	.word	0xa06232ee	! t0_kref+0x487c:   	subc	%o0, -0xd12, %l0
	.word	0x93282012	! t0_kref+0x4880:   	sll	%g0, 0x12, %o1
	.word	0x81a84a2b	! t0_kref+0x4884:   	fcmps	%fcc0, %f1, %f11
	.word	0xae1a001b	! t0_kref+0x4888:   	xor	%o0, %i3, %l7
	.word	0x8fa01a5a	! t0_kref+0x488c:   	fdtoi	%f26, %f7
	.word	0xeb68a00a	! t0_kref+0x4890:   	prefetch	%g2 + 0xa, 21
	.word	0xb1a208b4	! t0_kref+0x4894:   	fsubs	%f8, %f20, %f24
	.word	0x3b800007	! t0_kref+0x4898:   	fble,a	_kref+0x48b4
	.word	0xb5a0053b	! t0_kref+0x489c:   	fsqrts	%f27, %f26
	.word	0xee364000	! t0_kref+0x48a0:   	sth	%l7, [%i1]
	.word	0x85a10d2e	! t0_kref+0x48a4:   	fsmuld	%f4, %f14, %f2
	.word	0x9ba01a25	! t0_kref+0x48a8:   	fstoi	%f5, %f13
	call	SYM(t0_subr0)
	.word	0x992a801c	! t0_kref+0x48b0:   	sll	%o2, %i4, %o4
	.word	0xafa6c8a3	! t0_kref+0x48b4:   	fsubs	%f27, %f3, %f23
	.word	0xb1a01897	! t0_kref+0x48b8:   	fitos	%f23, %f24
	.word	0xaa9abd3c	! t0_kref+0x48bc:   	xorcc	%o2, -0x2c4, %l5
	.word	0x81ab4ab0	! t0_kref+0x48c0:   	fcmpes	%fcc0, %f13, %f16
	.word	0xf320a01c	! t0_kref+0x48c4:   	st	%f25, [%g2 + 0x1c]
	.word	0xada58942	! t0_kref+0x48c8:   	fmuld	%f22, %f2, %f22
	.word	0x85a149b1	! t0_kref+0x48cc:   	fdivs	%f5, %f17, %f2
	.word	0x2f480003	! t0_kref+0x48d0:   	fbu,a,pt	%fcc0, _kref+0x48dc
	.word	0xaa1f000c	! t0_kref+0x48d4:   	xor	%i4, %o4, %l5
	.word	0xe3b8a040	! t0_kref+0x48d8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9a55c008	! t0_kref+0x48dc:   	umul	%l7, %o0, %o5
	.word	0xda96d018	! t0_kref+0x48e0:   	lduha	[%i3 + %i0]0x80, %o5
	.word	0x89a108c6	! t0_kref+0x48e4:   	fsubd	%f4, %f6, %f4
	call	SYM(t0_subr0)
	.word	0x99400000	! t0_kref+0x48ec:   	mov	%y, %o4
	.word	0xd0871019	! t0_kref+0x48f0:   	lda	[%i4 + %i1]0x80, %o0
	.word	0x9edaf824	! t0_kref+0x48f4:   	smulcc	%o3, -0x7dc, %o7
	.word	0xd1981018	! t0_kref+0x48f8:   	ldda	[%g0 + %i0]0x80, %f8
	.word	0x153df94d	! t0_kref+0x48fc:   	sethi	%hi(0xf7e53400), %o2
	.word	0xa3a408a3	! t0_kref+0x4900:   	fsubs	%f16, %f3, %f17
	.word	0x34480003	! t0_kref+0x4904:   	bg,a,pt	%icc, _kref+0x4910
	.word	0xae634017	! t0_kref+0x4908:   	subc	%o5, %l7, %l7
	.word	0xa9a389cc	! t0_kref+0x490c:   	fdivd	%f14, %f12, %f20
	.word	0xd05e6010	! t0_kref+0x4910:   	ldx	[%i1 + 0x10], %o0
	.word	0x81dd760f	! t0_kref+0x4914:   	flush	%l5 - 0x9f1
	sethi	%hi(2f), %o7
	.word	0xe40be14c	! t0_kref+0x491c:   	ldub	[%o7 + 0x14c], %l2
	.word	0xa41ca00c	! t0_kref+0x4920:   	xor	%l2, 0xc, %l2
	.word	0xe42be14c	! t0_kref+0x4924:   	stb	%l2, [%o7 + 0x14c]
	.word	0x81dbe14c	! t0_kref+0x4928:   	flush	%o7 + 0x14c
	.word	0xe3b8a040	! t0_kref+0x492c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x95a188c8	! t0_kref+0x4930:   	fsubd	%f6, %f8, %f10
	.word	0xada64d2e	! t0_kref+0x4934:   	fsmuld	%f25, %f14, %f22
	.word	0xc16e3fe8	! t0_kref+0x4938:   	prefetch	%i0 - 0x18, 0
	.word	0x33800005	! t0_kref+0x493c:   	fbe,a	_kref+0x4950
	.word	0xd11fbe38	! t0_kref+0x4940:   	ldd	[%fp - 0x1c8], %f8
	.word	0x21800007	! t0_kref+0x4944:   	fbn,a	_kref+0x4960
	.word	0xb3a000b3	! t0_kref+0x4948:   	fnegs	%f19, %f25
2:	.word	0xee06401c	! t0_kref+0x494c:   	ld	[%i1 + %i4], %l7
	.word	0xa6aa000a	! t0_kref+0x4950:   	andncc	%o0, %o2, %l3
	.word	0xd048a016	! t0_kref+0x4954:   	ldsb	[%g2 + 0x16], %o0
	.word	0x9a07000a	! t0_kref+0x4958:   	add	%i4, %o2, %o5
	.word	0x2a800007	! t0_kref+0x495c:   	bcs,a	_kref+0x4978
	.word	0x94e20000	! t0_kref+0x4960:   	subccc	%o0, %g0, %o2
	.word	0xf1ee101b	! t0_kref+0x4964:   	prefetcha	%i0 + %i3, 24
	.word	0x33800003	! t0_kref+0x4968:   	fbe,a	_kref+0x4974
	.word	0x9e42e025	! t0_kref+0x496c:   	addc	%o3, 0x25, %o7
	.word	0xd4f01018	! t0_kref+0x4970:   	stxa	%o2, [%g0 + %i0]0x80
	.word	0x36800002	! t0_kref+0x4974:   	bge,a	_kref+0x497c
	.word	0xd230a02c	! t0_kref+0x4978:   	sth	%o1, [%g2 + 0x2c]
	.word	0xc93e6000	! t0_kref+0x497c:   	std	%f4, [%i1]
	.word	0xb1a188b0	! t0_kref+0x4980:   	fsubs	%f6, %f16, %f24
	.word	0xac43400b	! t0_kref+0x4984:   	addc	%o5, %o3, %l6
	.word	0x81dfbcd0	! t0_kref+0x4988:   	flush	%fp - 0x330
	.word	0x9ab2faca	! t0_kref+0x498c:   	orncc	%o3, -0x536, %o5
	.word	0xda50a01c	! t0_kref+0x4990:   	ldsh	[%g2 + 0x1c], %o5
	.word	0x81a98ab1	! t0_kref+0x4994:   	fcmpes	%fcc0, %f6, %f17
	.word	0xac17000d	! t0_kref+0x4998:   	or	%i4, %o5, %l6
	.word	0x34800007	! t0_kref+0x499c:   	bg,a	_kref+0x49b8
	.word	0xe11fbdf8	! t0_kref+0x49a0:   	ldd	[%fp - 0x208], %f16
	.word	0x8da3c82d	! t0_kref+0x49a4:   	fadds	%f15, %f13, %f6
	.word	0xe3b8a040	! t0_kref+0x49a8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81a489ba	! t0_kref+0x49ac:   	fdivs	%f18, %f26, %f0
	.word	0x9da000b5	! t0_kref+0x49b0:   	fnegs	%f21, %f14
	.word	0xd228a010	! t0_kref+0x49b4:   	stb	%o1, [%g2 + 0x10]
	.word	0x99a08921	! t0_kref+0x49b8:   	fmuls	%f2, %f1, %f12
	.word	0xaadec01b	! t0_kref+0x49bc:   	smulcc	%i3, %i3, %l5
	.word	0xaa3dc01b	! t0_kref+0x49c0:   	xnor	%l7, %i3, %l5
	.word	0xae97001c	! t0_kref+0x49c4:   	orcc	%i4, %i4, %l7
	.word	0xec3e2010	! t0_kref+0x49c8:   	std	%l6, [%i0 + 0x10]
	.word	0x90830009	! t0_kref+0x49cc:   	addcc	%o4, %o1, %o0
	.word	0xdd1fbfd0	! t0_kref+0x49d0:   	ldd	[%fp - 0x30], %f14
	.word	0x81ad0a58	! t0_kref+0x49d4:   	fcmpd	%fcc0, %f20, %f24
	.word	0xada28852	! t0_kref+0x49d8:   	faddd	%f10, %f18, %f22
	.word	0x81dec00c	! t0_kref+0x49dc:   	flush	%i3 + %o4
	.word	0x968b000d	! t0_kref+0x49e0:   	andcc	%o4, %o5, %o3
	.word	0x858233ec	! t0_kref+0x49e4:   	wr	%o0, 0xfffff3ec, %ccr
	.word	0xda20a010	! t0_kref+0x49e8:   	st	%o5, [%g2 + 0x10]
	.word	0xdd20a03c	! t0_kref+0x49ec:   	st	%f14, [%g2 + 0x3c]
	.word	0x33800007	! t0_kref+0x49f0:   	fbe,a	_kref+0x4a0c
	.word	0xc020a01c	! t0_kref+0x49f4:   	clr	[%g2 + 0x1c]
	.word	0x3d800003	! t0_kref+0x49f8:   	fbule,a	_kref+0x4a04
	.word	0xa806e4d0	! t0_kref+0x49fc:   	add	%i3, 0x4d0, %l4
	.word	0x968f3646	! t0_kref+0x4a00:   	andcc	%i4, -0x9ba, %o3
	.word	0xb5a01040	! t0_kref+0x4a04:   	fdtox	%f0, %f26
	.word	0xada54828	! t0_kref+0x4a08:   	fadds	%f21, %f8, %f22
	.word	0xc11fbfb8	! t0_kref+0x4a0c:   	ldd	[%fp - 0x48], %f0
	.word	0xa732400a	! t0_kref+0x4a10:   	srl	%o1, %o2, %l3
	.word	0x91a000c6	! t0_kref+0x4a14:   	fnegd	%f6, %f8
	.word	0xf830a00e	! t0_kref+0x4a18:   	sth	%i4, [%g2 + 0xe]
	.word	0x87a01898	! t0_kref+0x4a1c:   	fitos	%f24, %f3
	.word	0xd11fbc18	! t0_kref+0x4a20:   	ldd	[%fp - 0x3e8], %f8
	.word	0xde10a02a	! t0_kref+0x4a24:   	lduh	[%g2 + 0x2a], %o7
	.word	0x96c6a154	! t0_kref+0x4a28:   	addccc	%i2, 0x154, %o3
	.word	0xeb68a004	! t0_kref+0x4a2c:   	prefetch	%g2 + 4, 21
	.word	0x29800001	! t0_kref+0x4a30:   	fbl,a	_kref+0x4a34
	.word	0xf96e7fe0	! t0_kref+0x4a34:   	prefetch	%i1 - 0x20, 28
	.word	0x23800008	! t0_kref+0x4a38:   	fbne,a	_kref+0x4a58
	.word	0x8da01042	! t0_kref+0x4a3c:   	fdtox	%f2, %f6
	.word	0xa6b68017	! t0_kref+0x4a40:   	orncc	%i2, %l7, %l3
	.word	0xc51fbcc0	! t0_kref+0x4a44:   	ldd	[%fp - 0x340], %f2
	.word	0xf8767fe0	! t0_kref+0x4a48:   	stx	%i4, [%i1 - 0x20]
	.word	0x9e3ec00d	! t0_kref+0x4a4c:   	xnor	%i3, %o5, %o7
	.word	0x31800001	! t0_kref+0x4a50:   	fba,a	_kref+0x4a54
	.word	0x9016801b	! t0_kref+0x4a54:   	or	%i2, %i3, %o0
	.word	0xaa880008	! t0_kref+0x4a58:   	andcc	%g0, %o0, %l5
	.word	0x90673fbb	! t0_kref+0x4a5c:   	subc	%i4, -0x45, %o0
	.word	0x9afb7a0a	! t0_kref+0x4a60:   	sdivcc	%o5, -0x5f6, %o5
	.word	0x39480007	! t0_kref+0x4a64:   	fbuge,a,pt	%fcc0, _kref+0x4a80
	.word	0x9422c017	! t0_kref+0x4a68:   	sub	%o3, %l7, %o2
	.word	0xffee501a	! t0_kref+0x4a6c:   	prefetcha	%i1 + %i2, 31
	.word	0x8fa309a6	! t0_kref+0x4a70:   	fdivs	%f12, %f6, %f7
	.word	0x3f480004	! t0_kref+0x4a74:   	fbo,a,pt	%fcc0, _kref+0x4a84
	.word	0xedee501b	! t0_kref+0x4a78:   	prefetcha	%i1 + %i3, 22
	.word	0x31480005	! t0_kref+0x4a7c:   	fba,a,pt	%fcc0, _kref+0x4a90
	.word	0x9a53400c	! t0_kref+0x4a80:   	umul	%o5, %o4, %o5
	.word	0xd99e5a5d	! t0_kref+0x4a84:   	ldda	[%i1 + %i5]0xd2, %f12
	.word	0xacb27db4	! t0_kref+0x4a88:   	orncc	%o1, -0x24c, %l6
	.word	0xd040a010	! t0_kref+0x4a8c:   	ldsw	[%g2 + 0x10], %o0
	.word	0xae52b839	! t0_kref+0x4a90:   	umul	%o2, -0x7c7, %l7
	.word	0x99a08956	! t0_kref+0x4a94:   	fmuld	%f2, %f22, %f12
	.word	0xd500a014	! t0_kref+0x4a98:   	ld	[%g2 + 0x14], %f10
	.word	0x81dec017	! t0_kref+0x4a9c:   	flush	%i3 + %l7
	.word	0xec00a014	! t0_kref+0x4aa0:   	ld	[%g2 + 0x14], %l6
	.word	0x9a933801	! t0_kref+0x4aa4:   	orcc	%o4, -0x7ff, %o5
	.word	0x980b400b	! t0_kref+0x4aa8:   	and	%o5, %o3, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be2c8	! t0_kref+0x4ab0:   	ldub	[%o7 + 0x2c8], %l2
	.word	0xa41ca00c	! t0_kref+0x4ab4:   	xor	%l2, 0xc, %l2
	.word	0xe42be2c8	! t0_kref+0x4ab8:   	stb	%l2, [%o7 + 0x2c8]
	.word	0x81dbe2c8	! t0_kref+0x4abc:   	flush	%o7 + 0x2c8
	.word	0x85a0013b	! t0_kref+0x4ac0:   	fabss	%f27, %f2
	.word	0xa85a000c	! t0_kref+0x4ac4:   	smul	%o0, %o4, %l4
2:	.word	0x92230017	! t0_kref+0x4ac8:   	sub	%o4, %l7, %o1
	.word	0xee48a00f	! t0_kref+0x4acc:   	ldsb	[%g2 + 0xf], %l7
	.word	0x2f480008	! t0_kref+0x4ad0:   	fbu,a,pt	%fcc0, _kref+0x4af0
	.word	0x2f09d942	! t0_kref+0x4ad4:   	sethi	%hi(0x27650800), %l7
	.word	0xae337dce	! t0_kref+0x4ad8:   	orn	%o5, -0x232, %l7
	.word	0x92a371a0	! t0_kref+0x4adc:   	subcc	%o5, -0xe60, %o1
	.word	0xec1e3ff0	! t0_kref+0x4ae0:   	ldd	[%i0 - 0x10], %l6
	.word	0xa6930000	! t0_kref+0x4ae4:   	orcc	%o4, %g0, %l3
	.word	0x94fb001b	! t0_kref+0x4ae8:   	sdivcc	%o4, %i3, %o2
	.word	0x9a25c00d	! t0_kref+0x4aec:   	sub	%l7, %o5, %o5
	.word	0xa6fdc008	! t0_kref+0x4af0:   	sdivcc	%l7, %o0, %l3
	.word	0xedf6101a	! t0_kref+0x4af4:   	casxa	[%i0]0x80, %i2, %l6
	.word	0xea16201c	! t0_kref+0x4af8:   	lduh	[%i0 + 0x1c], %l5
	.word	0xf828a014	! t0_kref+0x4afc:   	stb	%i4, [%g2 + 0x14]
	.word	0xde16001b	! t0_kref+0x4b00:   	lduh	[%i0 + %i3], %o7
	.word	0x3b800002	! t0_kref+0x4b04:   	fble,a	_kref+0x4b0c
	.word	0x9066aa26	! t0_kref+0x4b08:   	subc	%i2, 0xa26, %o0
	.word	0xb4103ffc	! t0_kref+0x4b0c:   	mov	0xfffffffc, %i2
	.word	0x93a00138	! t0_kref+0x4b10:   	fabss	%f24, %f9
	.word	0x3b800001	! t0_kref+0x4b14:   	fble,a	_kref+0x4b18
	.word	0xafa000b2	! t0_kref+0x4b18:   	fnegs	%f18, %f23
	.word	0x81adca3b	! t0_kref+0x4b1c:   	fcmps	%fcc0, %f23, %f27
	.word	0x9300000c	! t0_kref+0x4b20:   	taddcc	%g0, %o4, %o1
	.word	0x93703982	! t0_kref+0x4b24:   	popc	-0x67e, %o1
	.word	0x9e8831ac	! t0_kref+0x4b28:   	andcc	%g0, -0xe54, %o7
	.word	0xc02e3ff1	! t0_kref+0x4b2c:   	clrb	[%i0 - 0xf]
	.word	0xada00534	! t0_kref+0x4b30:   	fsqrts	%f20, %f22
	.word	0xb1a00528	! t0_kref+0x4b34:   	fsqrts	%f8, %f24
	.word	0xe808a00e	! t0_kref+0x4b38:   	ldub	[%g2 + 0xe], %l4
	.word	0xa1a000ab	! t0_kref+0x4b3c:   	fnegs	%f11, %f16
	.word	0x8143e040	! t0_kref+0x4b40:   	membar	0x40
	.word	0xb1a308c0	! t0_kref+0x4b44:   	fsubd	%f12, %f0, %f24
	.word	0xfdee101d	! t0_kref+0x4b48:   	prefetcha	%i0 + %i5, 30
	.word	0x9a830017	! t0_kref+0x4b4c:   	addcc	%o4, %l7, %o5
	.word	0x9e5ab674	! t0_kref+0x4b50:   	smul	%o2, -0x98c, %o7
	.word	0x9a1aa804	! t0_kref+0x4b54:   	xor	%o2, 0x804, %o5
	.word	0xa9a00533	! t0_kref+0x4b58:   	fsqrts	%f19, %f20
	.word	0x99a50d30	! t0_kref+0x4b5c:   	fsmuld	%f20, %f16, %f12
	.word	0xb5a58952	! t0_kref+0x4b60:   	fmuld	%f22, %f18, %f26
	.word	0xeea81018	! t0_kref+0x4b64:   	stba	%l7, [%g0 + %i0]0x80
	.word	0xe51fbef8	! t0_kref+0x4b68:   	ldd	[%fp - 0x108], %f18
	call	SYM(t0_subr2)
	.word	0xd11e2000	! t0_kref+0x4b70:   	ldd	[%i0], %f8
	.word	0xaea6a0f7	! t0_kref+0x4b74:   	subcc	%i2, 0xf7, %l7
	.word	0xaa56c008	! t0_kref+0x4b78:   	umul	%i3, %o0, %l5
	.word	0xec08a039	! t0_kref+0x4b7c:   	ldub	[%g2 + 0x39], %l6
	.word	0x8da308c0	! t0_kref+0x4b80:   	fsubd	%f12, %f0, %f6
	.word	0xb1a01a24	! t0_kref+0x4b84:   	fstoi	%f4, %f24
	.word	0xac82c009	! t0_kref+0x4b88:   	addcc	%o3, %o1, %l6
	.word	0x9ba01094	! t0_kref+0x4b8c:   	fxtos	%f20, %f13
	.word	0xcb270019	! t0_kref+0x4b90:   	st	%f5, [%i4 + %i1]
	.word	0xec50a036	! t0_kref+0x4b94:   	ldsh	[%g2 + 0x36], %l6
	.word	0xd500a020	! t0_kref+0x4b98:   	ld	[%g2 + 0x20], %f10
	.word	0x85a54d22	! t0_kref+0x4b9c:   	fsmuld	%f21, %f2, %f2
	.word	0xec00a034	! t0_kref+0x4ba0:   	ld	[%g2 + 0x34], %l6
	.word	0x3b800006	! t0_kref+0x4ba4:   	fble,a	_kref+0x4bbc
	.word	0x9a5a2050	! t0_kref+0x4ba8:   	smul	%o0, 0x50, %o5
	.word	0xae35fab8	! t0_kref+0x4bac:   	orn	%l7, -0x548, %l7
	.word	0x91a088d0	! t0_kref+0x4bb0:   	fsubd	%f2, %f16, %f8
	.word	0x9a92400d	! t0_kref+0x4bb4:   	orcc	%o1, %o5, %o5
	.word	0xc5ee100b	! t0_kref+0x4bb8:   	prefetcha	%i0 + %o3, 2
	.word	0xd64e201f	! t0_kref+0x4bbc:   	ldsb	[%i0 + 0x1f], %o3
	.word	0xd026001c	! t0_kref+0x4bc0:   	st	%o0, [%i0 + %i4]
	.word	0xa9a01a21	! t0_kref+0x4bc4:   	fstoi	%f1, %f20
	.word	0x9607001c	! t0_kref+0x4bc8:   	add	%i4, %i4, %o3
	.word	0xd82e3fe0	! t0_kref+0x4bcc:   	stb	%o4, [%i0 - 0x20]
	.word	0xf42e001a	! t0_kref+0x4bd0:   	stb	%i2, [%i0 + %i2]
	.word	0x24800001	! t0_kref+0x4bd4:   	ble,a	_kref+0x4bd8
	.word	0xcd1fbe40	! t0_kref+0x4bd8:   	ldd	[%fp - 0x1c0], %f6
	.word	0x9422ea76	! t0_kref+0x4bdc:   	sub	%o3, 0xa76, %o2
	.word	0x95a24d32	! t0_kref+0x4be0:   	fsmuld	%f9, %f18, %f10
	.word	0x83a00535	! t0_kref+0x4be4:   	fsqrts	%f21, %f1
	.word	0xda40a014	! t0_kref+0x4be8:   	ldsw	[%g2 + 0x14], %o5
	.word	0x26480006	! t0_kref+0x4bec:   	bl,a,pt	%icc, _kref+0x4c04
	.word	0xd228a007	! t0_kref+0x4bf0:   	stb	%o1, [%g2 + 7]
	.word	0xb5a58d38	! t0_kref+0x4bf4:   	fsmuld	%f22, %f24, %f26
	.word	0xae5b000c	! t0_kref+0x4bf8:   	smul	%o4, %o4, %l7
	.word	0x9802801a	! t0_kref+0x4bfc:   	add	%o2, %i2, %o4
	.word	0xb7a0053b	! t0_kref+0x4c00:   	fsqrts	%f27, %f27
	.word	0x91a01928	! t0_kref+0x4c04:   	fstod	%f8, %f8
	.word	0x9b63e2c3	! t0_kref+0x4c08:   	movo	%fcc0, 0x2c3, %o5
	.word	0xada98042	! t0_kref+0x4c0c:   	fmovdg	%fcc0, %f2, %f22
	.word	0x9eaf28e7	! t0_kref+0x4c10:   	andncc	%i4, 0x8e7, %o7
	.word	0x9242400a	! t0_kref+0x4c14:   	addc	%o1, %o2, %o1
	.word	0x9da00033	! t0_kref+0x4c18:   	fmovs	%f19, %f14
	.word	0x3d800005	! t0_kref+0x4c1c:   	fbule,a	_kref+0x4c30
	.word	0x965aec3e	! t0_kref+0x4c20:   	smul	%o3, 0xc3e, %o3
	.word	0x36480005	! t0_kref+0x4c24:   	bge,a,pt	%icc, _kref+0x4c38
	.word	0x29022c10	! t0_kref+0x4c28:   	sethi	%hi(0x8b04000), %l4
	.word	0xd8d01019	! t0_kref+0x4c2c:   	ldsha	[%g0 + %i1]0x80, %o4
	.word	0xc11fbd68	! t0_kref+0x4c30:   	ldd	[%fp - 0x298], %f0
	.word	0xc06e2008	! t0_kref+0x4c34:   	ldstub	[%i0 + 8], %g0
	.word	0xde466010	! t0_kref+0x4c38:   	ldsw	[%i1 + 0x10], %o7
	.word	0xa6634017	! t0_kref+0x4c3c:   	subc	%o5, %l7, %l3
	.word	0x9e9e800d	! t0_kref+0x4c40:   	xorcc	%i2, %o5, %o7
	.word	0x81da0011	! t0_kref+0x4c44:   	flush	%o0 + %l1
	.word	0x9163001c	! t0_kref+0x4c48:   	movuge	%fcc0, %i4, %o0
	.word	0x86102012	! t0_kref+0x4c4c:   	mov	0x12, %g3
	.word	0x86a0e001	! t0_kref+0x4c50:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x4c54:   	be,a	_kref+0x4cb8
	.word	0xd43e3fe8	! t0_kref+0x4c58:   	std	%o2, [%i0 - 0x18]
	.word	0x314ffffd	! t0_kref+0x4c5c:   	fba,a,pt	%fcc0, _kref+0x4c50
	.word	0xa72a2000	! t0_kref+0x4c60:   	sll	%o0, 0x0, %l3
	.word	0xaf703bda	! t0_kref+0x4c64:   	popc	-0x426, %l7
	.word	0x95a008c6	! t0_kref+0x4c68:   	fsubd	%f0, %f6, %f10
	.word	0xd44e7ff4	! t0_kref+0x4c6c:   	ldsb	[%i1 - 0xc], %o2
	.word	0x22800008	! t0_kref+0x4c70:   	be,a	_kref+0x4c90
	.word	0xe84e600d	! t0_kref+0x4c74:   	ldsb	[%i1 + 0xd], %l4
	.word	0x941a400a	! t0_kref+0x4c78:   	xor	%o1, %o2, %o2
	.word	0x83a18830	! t0_kref+0x4c7c:   	fadds	%f6, %f16, %f1
	.word	0x96726f7d	! t0_kref+0x4c80:   	udiv	%o1, 0xf7d, %o3
	.word	0x9f400000	! t0_kref+0x4c84:   	mov	%y, %o7
	.word	0x89a01a4c	! t0_kref+0x4c88:   	fdtoi	%f12, %f4
	.word	0x83a0052e	! t0_kref+0x4c8c:   	fsqrts	%f14, %f1
	.word	0xdd00a03c	! t0_kref+0x4c90:   	ld	[%g2 + 0x3c], %f14
	.word	0x37800002	! t0_kref+0x4c94:   	fbge,a	_kref+0x4c9c
	.word	0x9e1337ac	! t0_kref+0x4c98:   	or	%o4, -0x854, %o7
	.word	0xae534009	! t0_kref+0x4c9c:   	umul	%o5, %o1, %l7
	.word	0x9e223375	! t0_kref+0x4ca0:   	sub	%o0, -0xc8b, %o7
	.word	0x81a408d8	! t0_kref+0x4ca4:   	fsubd	%f16, %f24, %f0
	.word	0x9e12c000	! t0_kref+0x4ca8:   	or	%o3, %g0, %o7
	.word	0x91a01932	! t0_kref+0x4cac:   	fstod	%f18, %f8
	.word	0x30800002	! t0_kref+0x4cb0:   	ba,a	_kref+0x4cb8
	.word	0x8ba689ad	! t0_kref+0x4cb4:   	fdivs	%f26, %f13, %f5
	.word	0xc9be581a	! t0_kref+0x4cb8:   	stda	%f4, [%i1 + %i2]0xc0
	.word	0x99a01080	! t0_kref+0x4cbc:   	fxtos	%f0, %f12
	.word	0x89a08d34	! t0_kref+0x4cc0:   	fsmuld	%f2, %f20, %f4
	.word	0xac3a663e	! t0_kref+0x4cc4:   	xnor	%o1, 0x63e, %l6
	.word	0xa8fe8008	! t0_kref+0x4cc8:   	sdivcc	%i2, %o0, %l4
	.word	0xaa8f35c4	! t0_kref+0x4ccc:   	andcc	%i4, -0xa3c, %l5
	.word	0xd030a030	! t0_kref+0x4cd0:   	sth	%o0, [%g2 + 0x30]
	.word	0x878020f0	! t0_kref+0x4cd4:   	mov	0xf0, %asi
	.word	0xd9871059	! t0_kref+0x4cd8:   	lda	[%i4 + %i1]0x82, %f12
	.word	0xec3e7ff0	! t0_kref+0x4cdc:   	std	%l6, [%i1 - 0x10]
	.word	0xaa9028e4	! t0_kref+0x4ce0:   	orcc	%g0, 0x8e4, %l5
	.word	0xaa67226f	! t0_kref+0x4ce4:   	subc	%i4, 0x26f, %l5
	.word	0x8143e014	! t0_kref+0x4ce8:   	membar	0x14
	.word	0x90500008	! t0_kref+0x4cec:   	umul	%g0, %o0, %o0
	.word	0x96432faa	! t0_kref+0x4cf0:   	addc	%o4, 0xfaa, %o3
	.word	0xaa827ca7	! t0_kref+0x4cf4:   	addcc	%o1, -0x359, %l5
	.word	0x9466c01c	! t0_kref+0x4cf8:   	subc	%i3, %i4, %o2
	.word	0x81a0002e	! t0_kref+0x4cfc:   	fmovs	%f14, %f0
	.word	0xd9be181c	! t0_kref+0x4d00:   	stda	%f12, [%i0 + %i4]0xc0
	.word	0xd6262014	! t0_kref+0x4d04:   	st	%o3, [%i0 + 0x14]
	.word	0xa6b33011	! t0_kref+0x4d08:   	orncc	%o4, -0xfef, %l3
	.word	0xd0d6d018	! t0_kref+0x4d0c:   	ldsha	[%i3 + %i0]0x80, %o0
	.word	0xd03e7ff8	! t0_kref+0x4d10:   	std	%o0, [%i1 - 8]
	sethi	%hi(2f), %o7
	.word	0xe40be150	! t0_kref+0x4d18:   	ldub	[%o7 + 0x150], %l2
	.word	0xa41ca00c	! t0_kref+0x4d1c:   	xor	%l2, 0xc, %l2
	.word	0xe42be150	! t0_kref+0x4d20:   	stb	%l2, [%o7 + 0x150]
	.word	0x81dbe150	! t0_kref+0x4d24:   	flush	%o7 + 0x150
	.word	0x9276f1ad	! t0_kref+0x4d28:   	udiv	%i3, -0xe53, %o1
	.word	0x961b3680	! t0_kref+0x4d2c:   	xor	%o4, -0x980, %o3
	.word	0xac62f976	! t0_kref+0x4d30:   	subc	%o3, -0x68a, %l6
	.word	0xec180018	! t0_kref+0x4d34:   	ldd	[%g0 + %i0], %l6
	.word	0xf8263ff0	! t0_kref+0x4d38:   	st	%i4, [%i0 - 0x10]
	.word	0xee10a022	! t0_kref+0x4d3c:   	lduh	[%g2 + 0x22], %l7
	.word	0x81a0052a	! t0_kref+0x4d40:   	fsqrts	%f10, %f0
	.word	0x96e24000	! t0_kref+0x4d44:   	subccc	%o1, %g0, %o3
	.word	0xc19f1a58	! t0_kref+0x4d48:   	ldda	[%i4 + %i0]0xd2, %f0
	.word	0x95a01a21	! t0_kref+0x4d4c:   	fstoi	%f1, %f10
2:	.word	0xec08a02d	! t0_kref+0x4d50:   	ldub	[%g2 + 0x2d], %l6
	.word	0x3d800001	! t0_kref+0x4d54:   	fbule,a	_kref+0x4d58
	.word	0x933f201f	! t0_kref+0x4d58:   	sra	%i4, 0x1f, %o1
	.word	0x9ba000b2	! t0_kref+0x4d5c:   	fnegs	%f18, %f13
	.word	0xea5e401d	! t0_kref+0x4d60:   	ldx	[%i1 + %i5], %l5
	.word	0xb7a000a3	! t0_kref+0x4d64:   	fnegs	%f3, %f27
	.word	0xaafb000b	! t0_kref+0x4d68:   	sdivcc	%o4, %o3, %l5
	.word	0x94ab401b	! t0_kref+0x4d6c:   	andncc	%o5, %i3, %o2
	.word	0xa9a38952	! t0_kref+0x4d70:   	fmuld	%f14, %f18, %f20
	.word	0xa5a6cd23	! t0_kref+0x4d74:   	fsmuld	%f27, %f3, %f18
	.word	0xc5801018	! t0_kref+0x4d78:   	lda	[%g0 + %i0]0x80, %f2
	.word	0xd93e2010	! t0_kref+0x4d7c:   	std	%f12, [%i0 + 0x10]
	.word	0x96e73529	! t0_kref+0x4d80:   	subccc	%i4, -0xad7, %o3
	.word	0xd91fbf68	! t0_kref+0x4d84:   	ldd	[%fp - 0x98], %f12
	.word	0xe608a022	! t0_kref+0x4d88:   	ldub	[%g2 + 0x22], %l3
	.word	0xa8972a1a	! t0_kref+0x4d8c:   	orcc	%i4, 0xa1a, %l4
	.word	0xa89b7339	! t0_kref+0x4d90:   	xorcc	%o5, -0xcc7, %l4
	.word	0x96524009	! t0_kref+0x4d94:   	umul	%o1, %o1, %o3
	.word	0x22800002	! t0_kref+0x4d98:   	be,a	_kref+0x4da0
	.word	0x9da00135	! t0_kref+0x4d9c:   	fabss	%f21, %f14
	.word	0xe8580018	! t0_kref+0x4da0:   	ldx	[%g0 + %i0], %l4
	.word	0xacc3000c	! t0_kref+0x4da4:   	addccc	%o4, %o4, %l6
	.word	0x81dee409	! t0_kref+0x4da8:   	flush	%i3 + 0x409
	.word	0xa5a04d34	! t0_kref+0x4dac:   	fsmuld	%f1, %f20, %f18
	.word	0xc91fbe08	! t0_kref+0x4db0:   	ldd	[%fp - 0x1f8], %f4
	.word	0xd4263ffc	! t0_kref+0x4db4:   	st	%o2, [%i0 - 4]
	.word	0xa5a01a22	! t0_kref+0x4db8:   	fstoi	%f2, %f18
	.word	0xac0ea637	! t0_kref+0x4dbc:   	and	%i2, 0x637, %l6
	.word	0xa6280017	! t0_kref+0x4dc0:   	andn	%g0, %l7, %l3
	.word	0x81aaca30	! t0_kref+0x4dc4:   	fcmps	%fcc0, %f11, %f16
	.word	0x9656c01b	! t0_kref+0x4dc8:   	umul	%i3, %i3, %o3
	.word	0xd0a01018	! t0_kref+0x4dcc:   	sta	%o0, [%g0 + %i0]0x80
	.word	0xaa7a2859	! t0_kref+0x4dd0:   	sdiv	%o0, 0x859, %l5
	.word	0xb5a2894e	! t0_kref+0x4dd4:   	fmuld	%f10, %f14, %f26
	.word	0xd4ce5000	! t0_kref+0x4dd8:   	ldsba	[%i1]0x80, %o2
	.word	0x9fc00004	! t0_kref+0x4ddc:   	call	%g0 + %g4
	.word	0xec3e6010	! t0_kref+0x4de0:   	std	%l6, [%i1 + 0x10]
	.word	0xa3a00133	! t0_kref+0x4de4:   	fabss	%f19, %f17
	.word	0xa61e801c	! t0_kref+0x4de8:   	xor	%i2, %i4, %l3
	.word	0x9ba0052d	! t0_kref+0x4dec:   	fsqrts	%f13, %f13
	call	SYM(t0_subr0)
	.word	0x9a3eabf1	! t0_kref+0x4df4:   	xnor	%i2, 0xbf1, %o5
	.word	0x9a922cc9	! t0_kref+0x4df8:   	orcc	%o0, 0xcc9, %o5
	.word	0x26800003	! t0_kref+0x4dfc:   	bl,a	_kref+0x4e08
	.word	0xaba01a39	! t0_kref+0x4e00:   	fstoi	%f25, %f21
	.word	0xd03e401d	! t0_kref+0x4e04:   	std	%o0, [%i1 + %i5]
	.word	0x9f418000	! t0_kref+0x4e08:   	mov	%fprs, %o7
	.word	0xac527ba3	! t0_kref+0x4e0c:   	umul	%o1, -0x45d, %l6
	.word	0x9de3bfa0	! t0_kref+0x4e10:   	save	%sp, -0x60, %sp
	.word	0xb8477de3	! t0_kref+0x4e14:   	addc	%i5, -0x21d, %i4
	.word	0x9fee0018	! t0_kref+0x4e18:   	restore	%i0, %i0, %o7
	.word	0x9b368017	! t0_kref+0x4e1c:   	srl	%i2, %l7, %o5
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x287d4000)
.seg "text"
t0_subr0_page_begin:
	.skip 8184
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x01698000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x280d0000)
.seg "text"
t0_subr2_page_begin:
	.skip 8192
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x2810a000)
.seg "text"
t0_subr3_page_begin:
	.skip 8168
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
!  Total operations: 4766  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.15   1.36
!  ldub              0.21   0.17
!  ldsh              0.15   0.15
!  lduh              1.18   1.13
!  ld                0.29   0.23
!  ldd               0.99   0.94
!  swap              0.67   0.55
!  ldstub            0.25   0.17
!  stb               0.57   0.78
!  sth               0.44   0.40
!  st                1.04   1.05
!  std               1.09   1.13
!  add               1.28   1.36
!  addcc             0.68   0.57
!  addx              1.50   1.76
!  addxcc            1.39   1.24
!  taddcc            0.06   0.08
!  taddcctv          0.12   0.19
!  sub               1.41   1.68
!  subcc             0.75   0.61
!  subx              1.37   1.51
!  subxcc            0.34   0.57
!  tsubcc            0.13   0.15
!  tsubcctv          0.07   0.04
!  mulscc            0.22   0.25
!  and               1.06   0.67
!  andcc             1.45   1.55
!  andn              0.07   0.15
!  andncc            0.70   0.86
!  or                1.29   1.32
!  orcc              1.46   1.41
!  orn               0.59   0.50
!  orncc             0.95   1.22
!  xor               1.39   1.49
!  xorcc             0.67   0.82
!  xnor              0.97   1.24
!  xnorcc            0.02   0.00
!  sll               0.71   0.59
!  srl               0.56   0.71
!  sra               0.42   0.46
!  unimp             0.14   0.17
!  umul              1.20   1.41
!  smul              1.25   1.38
!  udiv              0.64   0.61
!  sdiv              0.82   0.94
!  umulcc            0.70   0.69
!  smulcc            0.39   0.57
!  udivcc            0.39   0.57
!  sdivcc            0.53   0.65
!  rdy               1.20   1.13
!  wry               0.06   0.08
!  bicc              2.03   1.78
!  sethi             1.00   1.17
!  jmpl              0.94   0.86
!  call              1.39   1.26
!  ticc              0.00   0.00
!  flush             1.42   1.07
!  save              0.48   0.31
!  restore           0.06   0.00
!  stbar             0.64   0.69
!  ldf               0.01   0.00
!  lddf              0.51   0.65
!  stf               0.63   0.67
!  stdf              0.60   0.61
!  fadds             1.44   1.59
!  fsubs             1.12   1.11
!  fmuls             1.21   1.43
!  fdivs             1.34   1.78
!  faddd             0.41   0.44
!  fsubd             0.71   1.03
!  fmuld             0.71   0.82
!  fdivd             0.42   0.46
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.85   0.71
!  fdmulq            0.00   0.00
!  fitos             1.43   1.51
!  fitod             0.07   0.06
!  fitoq             0.00   0.00
!  fstoi             1.14   1.55
!  fstod             0.35   0.31
!  fstoq             0.00   0.00
!  fdtoi             0.17   0.25
!  fdtos             0.71   0.50
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.04   1.03
!  fnegs             0.90   1.05
!  fabss             0.90   1.11
!  fsqrts            2.19   2.14
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.69   0.48
!  fcmpd             1.15   1.28
!  fcmpq             0.00   0.00
!  fcmpes            1.36   1.15
!  fcmped            0.04   0.02
!  fcmpeq            0.00   0.00
!  fbfcc             2.69   2.37
!  ldfsr             0.11   0.00
!  stfsr             0.00   0.00
!  loop              1.07   0.63
!  offset            0.27   0.34
!  area              0.18   0.23
!  target            0.25   0.25
!  goto              0.08   0.04
!  sigsegv           0.18   0.19
!  sigbus            0.05   0.15
!  imodify           1.05   0.84
!  ldfsr_offset      0.26   0.00
!  fpattern          1.48   1.83
!  lbranch           0.12   0.04
!  shmld             5.88   5.54
!  shmst             3.55   3.57
!  shmpf             0.21   0.23
!  shmswap           0.10   0.13
!  shmblkld          0.85   0.08
!  shmblkst          0.52   0.40
!  shmblkchk         0.05   0.08
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
!  casa              0.10   0.04
!  rdasi             0.00   0.00
!  wrasi             0.07   0.10
!  bpcc              0.83   0.73
!  fbpfcc            3.14   2.83
!  fmovscc           0.02   0.02
!  fmovdcc           0.11   0.10
!  fmovqcc           0.00   0.00
!  movcc             0.19   0.29
!  flushw            0.03   0.02
!  membar            0.28   0.13
!  prefetch          0.79   1.13
!  rdpc              0.00   0.00
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.24   0.13
!  lddfa             0.11   0.08
!  ldqfa             0.00   0.00
!  ldsba             0.11   0.10
!  ldsha             0.10   0.15
!  lduba             0.06   0.08
!  lduha             0.09   0.08
!  lda               0.28   0.40
!  ldda              0.21   0.13
!  ldstuba           0.08   0.02
!  prefetcha         1.14   1.13
!  stfa              0.23   0.19
!  stdfa             0.14   0.17
!  stqfa             0.00   0.00
!  stba              0.13   0.13
!  stha              0.20   0.19
!  sta               0.25   0.17
!  stda              0.14   0.17
!  swapa             0.23   0.27
!  fmovd             0.00   0.00
!  fnegd             0.08   0.15
!  fabsd             0.29   0.27
!  fstox             0.05   0.06
!  fdtox             0.28   0.44
!  fxtos             0.26   0.25
!  fxtod             0.00   0.00
!  lds               0.05   0.06
!  ldsa              0.04   0.04
!  ldx               0.27   0.19
!  ldxa              0.13   0.08
!  nofault           0.29   0.21
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
!  partial_st8       0.12   0.17
!  partial_st16      0.29   0.25
!  partial_st32      0.06   0.06
!  short_st8         0.22   0.17
!  short_st16        0.01   0.00
!  short_ld8         0.05   0.02
!  short_ld16        0.29   0.17
!  blkld             0.15   0.00
!  blkst             0.19   0.00
!  blkld_offset      0.20   0.00
!  blkst_offset      0.00   0.00
!  blk_check         0.16   0.08
!  casxa             0.05   0.08
!  rdccr             0.02   0.00
!  rdfprs            0.24   0.21
!  wrccr             0.27   0.25
!  popc              0.27   0.21
!  wrfprs            0.06   0.06
!  stx               0.16   0.29
!  stxa              0.16   0.08
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
KDATA_MODULE(t0_module_offset_table, 0x7905e000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000010
	.word	0xfffffff8
	.word	0x00000008
	.word	0xfffffff0
	.word	0x00000000
	.word	0xffffffe0
	.word	0xffffffe8
	.word	0x00000018
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

KDATA_MODULE(t0_module_data_in_regs, 0x3c04e000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x74a554c7          ! %f0
	.word	0x70925cfb          ! %f1
	.word	0x6a4b5b94          ! %f2
	.word	0x1bdf9979          ! %f3
	.word	0xb83623b9          ! %f4
	.word	0xcdd9c41f          ! %f5
	.word	0x774638f3          ! %f6
	.word	0x71739f9f          ! %f7
	.word	0x3f6ff2e5          ! %f8
	.word	0xed45ec0f          ! %f9
	.word	0xdfecdec6          ! %f10
	.word	0x861dbd17          ! %f11
	.word	0x17ecbb67          ! %f12
	.word	0xa917afbe          ! %f13
	.word	0xc6311f5d          ! %f14
	.word	0x1c9ecfee          ! %f15
	.word	0xdb6e5a5e          ! %f16
	.word	0xe60c1e2a          ! %f17
	.word	0xb8c15e0b          ! %f18
	.word	0x6ec96011          ! %f19
	.word	0xc4f047bd          ! %f20
	.word	0xd999ca9b          ! %f21
	.word	0xa7f0d418          ! %f22
	.word	0x4b4a3336          ! %f23
	.word	0xa21d6663          ! %f24
	.word	0xdc7c5d2c          ! %f25
	.word	0xa0aab0fb          ! %f26
	.word	0xe60bbafc          ! %f27
	.word	0xa3ca4168          ! %f28
	.word	0x634a278a          ! %f29
	.word	0x247a89c8          ! %f30
	.word	0x3edfc150          ! %f31
	.word	0x29454ab9          ! %f32
	.word	0xb047c1fb          ! %f33
	.word	0x3767cbe7          ! %f34
	.word	0x06ecf713          ! %f35
	.word	0x9553eee6          ! %f36
	.word	0x0269f4a2          ! %f37
	.word	0x1e092706          ! %f38
	.word	0x451448f9          ! %f39
	.word	0x51cc923a          ! %f40
	.word	0x1db67100          ! %f41
	.word	0xd3102250          ! %f42
	.word	0x6e5c1eb4          ! %f43
	.word	0xfd2acb0b          ! %f44
	.word	0x7d381fbe          ! %f45
	.word	0x72dc50de          ! %f46
	.word	0x67ade850          ! %f47
	.word	0x857c6d54          ! %f48
	.word	0xc6c406a9          ! %f49
	.word	0xf0a8d96d          ! %f50
	.word	0xc4149de0          ! %f51
	.word	0xb2db3b80          ! %f52
	.word	0xf1180afd          ! %f53
	.word	0x02de4552          ! %f54
	.word	0x4471155a          ! %f55
	.word	0x72905088          ! %f56
	.word	0x35ad13e5          ! %f57
	.word	0x2e3dcaaa          ! %f58
	.word	0xfd8352bf          ! %f59
	.word	0x803b973f          ! %f60
	.word	0x652a5142          ! %f61
	.word	0x813a85d5          ! %f62
	.word	0xd576367f          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xbe4       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x879d833c          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x080a3caa          ! %o0
	.word	0xc180fa73          ! %o1
	.word	0x266e052d          ! %o2
	.word	0x9a5963df          ! %o3
	.word	0x525b7a30          ! %o4
	.word	0xd69d813f          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xd52ae2ec          ! %l0
	.word	0x8fffaaab          ! %l1
	.word	0xed285624          ! %l2
	.word	0x250d2e1a          ! %l3
	.word	0x64b17d19          ! %l4
	.word	0x78899ab4          ! %l5
	.word	0x312f51d0          ! %l6
	.word	0xf869cb0a          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x0000001b          ! %i2 (byte offset)
	.word	0xffffffea          ! %i3 (halfword offset)
	.word	0xffffffe0          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8ca3f120          ! %y
	.word	0x0000000c          ! %icc (nzvc)
	.word	0xc0000040          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x5575c000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x20b8bde9
	.word	0x2b6b6849
	.word	0xaef76bd1
	.word	0x0b35c372
	.word	0x96b7d497
	.word	0xa964dfba
	.word	0x10218f9f
	.word	0xf873ecf8
	.word	0x95721459
	.word	0x9cf5b21d
	.word	0xf01dae2e
	.word	0x0e804d87
	.word	0x26d6dba3
	.word	0xce2e9f3d
	.word	0x50a78e8b
	.word	0x670700cb
	.word	0x0c8ab988
	.word	0x545747c7
	.word	0x210a1728
	.word	0x73772b55
	.word	0x2338315c
	.word	0x0246d21c
	.word	0xcf63f424
	.word	0xc34edd8d
	.word	0xcfb6949a
	.word	0x5de18868
	.word	0x9799ddce
	.word	0xc64db1e6
	.word	0x18aa1708
	.word	0x2489c3f3
	.word	0x2448436b
	.word	0xd7769a54
	.word	0xf3ce8118
	.word	0x7c63b9b6
	.word	0x62de5e37
	.word	0xdf5c90fa
	.word	0x45502491
	.word	0x5830fc31
	.word	0xc628f0a9
	.word	0x9bbd2028
	.word	0x1facf76e
	.word	0x6a81c67b
	.word	0xaa3335fb
	.word	0x8326f584
	.word	0x25d1f906
	.word	0xca47649a
	.word	0xf5c8c5e9
	.word	0x2c99f486
	.word	0x15c7456c
	.word	0x2fb44d14
	.word	0x494b70b8
	.word	0xaff17c29
	.word	0xaa7f7b18
	.word	0x5a0bbfc6
	.word	0x243c5779
	.word	0x23c0d3df
	.word	0x458556c6
	.word	0xb6cbfdf3
	.word	0x0b07c48e
	.word	0xeb54f3c4
	.word	0x678ca99e
	.word	0x15bb6f9f
	.word	0x4197886d
	.word	0x230e1c16
	.word	0x879a0d94
	.word	0xf5124a1e
	.word	0x8d27dea4
	.word	0x0576efe5
	.word	0x95c6fc11
	.word	0x727f8be7
	.word	0x4d171f1c
	.word	0x77a60706
	.word	0x8ede2ad3
	.word	0xfa6161ad
	.word	0x4728bfa1
	.word	0x12d22b4d
	.word	0x43665310
	.word	0x837648b0
	.word	0xb43869a1
	.word	0x7ad0b4fa
	.word	0x856fc6e1
	.word	0x33cd824f
	.word	0x66e22833
	.word	0xd0b8ba73
	.word	0xa6db78de
	.word	0x3912ace2
	.word	0x8a70f25b
	.word	0xbd5d0733
	.word	0xc4185a05
	.word	0x03b995c6
	.word	0x35b5158c
	.word	0x43fa0e02
	.word	0x1fbe31df
	.word	0xdf4c98b8
	.word	0x6778446d
	.word	0x19944a66
	.word	0x903b54e5
	.word	0x93712066
	.word	0x815d4ddf
	.word	0x2456c559
	.word	0x143cdd1f
	.word	0xa65b1c43
	.word	0xc655c03f
	.word	0x7f08b13b
	.word	0x52cf490d
	.word	0x6ba17f9a
	.word	0x13b7fce8
	.word	0x92ac5109
	.word	0x83afa4cb
	.word	0xfef31de6
	.word	0x13a47ffb
	.word	0xaac89ecf
	.word	0xc923a16f
	.word	0xf24c7860
	.word	0x9d116061
	.word	0xab02655b
	.word	0xd9313eb5
	.word	0xf84450d8
	.word	0x35bf4c11
	.word	0x05c0c133
	.word	0x4674eade
	.word	0x660e15c8
	.word	0x94cb848e
	.word	0xbee43cc8
	.word	0x435f3cd4
	.word	0x9b2e7ba5
	.word	0x3dc69fb3
	.word	0x9256fbea
	.word	0x3b91ac91
	.word	0x4fcfd778
	.word	0x7c7010b2
	.word	0x67afaa7e
	.word	0x98a3edc2
	.word	0x73690ead
	.word	0x1cb2bd59
	.word	0x2988226f
	.word	0xe011d0a7
	.word	0xad43302b
	.word	0xa17f2397
	.word	0x2bc3fce2
	.word	0x99abcd3c
	.word	0x14970aa4
	.word	0xabe3d33f
	.word	0x471282ad
	.word	0x06e29c9d
	.word	0x47bd542d
	.word	0xf28d400b
	.word	0x24bab008
	.word	0x35e884a6
	.word	0x6e813710
	.word	0x14e22fe2
	.word	0x4b773f85
	.word	0xde2939d9
	.word	0xc44e57e1
	.word	0xbc82495d
	.word	0xf013f03d
	.word	0x50437b84
	.word	0x30f0a8cf
	.word	0xa8408687
	.word	0x69dc7b4b
	.word	0x98bdce23
	.word	0xfb2d9e3b
	.word	0x2d0b8fe4
	.word	0x3700ec7e
	.word	0x6461f802
	.word	0x54e3988e
	.word	0x7fd243b4
	.word	0x6f1a5249
t0_data_in_sp:
	.word	0xc5c12426
	.word	0x0dd59747
	.word	0x4792ed78
	.word	0x4535f8fe
	.word	0x571ccf6d
	.word	0x1e168952
	.word	0xdca7f1b5
	.word	0x2e7ca53b
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000003
	.word	0x00000016
	.word	0x00000018
	.word	0x00000000
	.word	t0_data_in_fp
	.word	0x8d1bbef3
	.word	0x0d83ad18
	.word	0xa803b3d2
	.word	0xbd8e5b7f
	.word	0x743a49f9
	.word	0x21301fc2
	.word	0xd98ccc8a
	.word	0x6c53c2f8
	.word	0x477b049c
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
	.word   	0xceb7a931	! [%fp - 0xc]
	.word   	0xeb2d8731	! [%fp - 0x8]
	.word   	0xe8a3d721	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x52933798
	.word	0xcce7383d
	.word	0xa97f8c7f
	.word	0xb8f269e8
	.word	0x7093c34d
	.word	0x80a0c497
	.word	0x50922c73
	.word	0xcc448a15
	.word	0xa00fecd6
	.word	0x54109852
	.word	0xcb574386
	.word	0xb56ad266
	.word	0xcb3b6859
	.word	0x462f2da5
	.word	0xe3dcbf23
	.word	0x936f06fb
	.word	0x0a2e34a0
	.word	0xdd5ca4ef
	.word	0x7f357555
	.word	0xb773a4f4
	.word	0xc1521be8
	.word	0x192f16fa
	.word	0xbeeb43c2
	.word	0x8b0a4858
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x26630000)
.seg "data"
t0_data_in_area0_start:
.skip 2944
t0_data_in_area0_begin:
	.word	0xf9e6edf9	! t0_data_in_area0-0x20
	.word	0xd15d4783	! t0_data_in_area0-0x1c
	.word	0x50ffa9d7	! t0_data_in_area0-0x18
	.word	0x6af00c38	! t0_data_in_area0-0x14
	.word	0x9bc7c776	! t0_data_in_area0-0x10
	.word	0x26437bf9	! t0_data_in_area0-0xc
	.word	0xa61f5244	! t0_data_in_area0-0x8
	.word	0x576d4913	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xc76cfa76	! t0_data_in_area0+0x0
	.word	0x4b187a85	! t0_data_in_area0+0x4
	.word	0x37003fab	! t0_data_in_area0+0x8
	.word	0x6788557c	! t0_data_in_area0+0xc
	.word	0x4acb6c52	! t0_data_in_area0+0x10
	.word	0x4ec4f54a	! t0_data_in_area0+0x14
	.word	0x6d299093	! t0_data_in_area0+0x18
	.word	0x9d112cfa	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 5184
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x45612000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xf46b7cc0	! t0_data_in_shm_area+0x0 (t0)
	.word	0x6eafe5ed	! t0_data_in_shm_area+0x4 (t0)
	.word	0x53df0ea2	! t0_data_in_shm_area+0x8 (t0)
	.word	0xf786212f	! t0_data_in_shm_area+0xc (t0)
	.word	0x9b1eca20	! t0_data_in_shm_area+0x10 (t0)
	.word	0x82f69d57	! t0_data_in_shm_area+0x14 (t0)
	.word	0x8ad9fd0b	! t0_data_in_shm_area+0x18 (t0)
	.word	0xc12ff93b	! t0_data_in_shm_area+0x1c (t0)
	.word	0xdf5d6716	! t0_data_in_shm_area+0x20 (t0)
	.word	0xcdaf8bb9	! t0_data_in_shm_area+0x24 (t0)
	.word	0x611bda44	! t0_data_in_shm_area+0x28 (t0)
	.word	0xfed62362	! t0_data_in_shm_area+0x2c (t0)
	.word	0x9ac85558	! t0_data_in_shm_area+0x30 (t0)
	.word	0xc34304d0	! t0_data_in_shm_area+0x34 (t0)
	.word	0xc9bf08fc	! t0_data_in_shm_area+0x38 (t0)
	.word	0x7d51dceb	! t0_data_in_shm_area+0x3c (t0)
	.word	0x5bd859c8	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xa0d5846a	! t0_data_in_shm_area+0x44
	.word	0x8274944c	! t0_data_in_shm_area+0x48
	.word	0x2b51744b	! t0_data_in_shm_area+0x4c
	.word	0x3c9d7dc4	! t0_data_in_shm_area+0x50
	.word	0xfb733728	! t0_data_in_shm_area+0x54
	.word	0x329d832c	! t0_data_in_shm_area+0x58
	.word	0x9f0b0983	! t0_data_in_shm_area+0x5c
	.word	0x7ce4d1bd	! t0_data_in_shm_area+0x60
	.word	0x0764cb84	! t0_data_in_shm_area+0x64
	.word	0x25e16f28	! t0_data_in_shm_area+0x68
	.word	0xd9b070c5	! t0_data_in_shm_area+0x6c
	.word	0xff5f4506	! t0_data_in_shm_area+0x70
	.word	0x9711cf15	! t0_data_in_shm_area+0x74
	.word	0x250b5252	! t0_data_in_shm_area+0x78
	.word	0x736c1b5d	! t0_data_in_shm_area+0x7c
	.word	0xa7bda6ee	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xac551c11	! t0_data_in_shm_area+0x84
	.word	0x9f10c07a	! t0_data_in_shm_area+0x88
	.word	0x64c92ace	! t0_data_in_shm_area+0x8c
	.word	0x7a632510	! t0_data_in_shm_area+0x90
	.word	0xa26c1b14	! t0_data_in_shm_area+0x94
	.word	0x11b6ff9c	! t0_data_in_shm_area+0x98
	.word	0x0be7123b	! t0_data_in_shm_area+0x9c
	.word	0xb690dae8	! t0_data_in_shm_area+0xa0
	.word	0x29f1dd1f	! t0_data_in_shm_area+0xa4
	.word	0x608cb399	! t0_data_in_shm_area+0xa8
	.word	0xe6fb6a09	! t0_data_in_shm_area+0xac
	.word	0x370246aa	! t0_data_in_shm_area+0xb0
	.word	0x87e351e2	! t0_data_in_shm_area+0xb4
	.word	0x7126112a	! t0_data_in_shm_area+0xb8
	.word	0xc0aad9c1	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x1a698000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x74a554c7          ! %f0
	.word	0x70925cfb          ! %f1
	.word	0x6a4b5b94          ! %f2
	.word	0x1bdf9979          ! %f3
	.word	0xb83623b9          ! %f4
	.word	0xcdd9c41f          ! %f5
	.word	0x774638f3          ! %f6
	.word	0x71739f9f          ! %f7
	.word	0x3f6ff2e5          ! %f8
	.word	0xed45ec0f          ! %f9
	.word	0xdfecdec6          ! %f10
	.word	0x861dbd17          ! %f11
	.word	0x17ecbb67          ! %f12
	.word	0xa917afbe          ! %f13
	.word	0xc6311f5d          ! %f14
	.word	0x1c9ecfee          ! %f15
	.word	0xdb6e5a5e          ! %f16
	.word	0xe60c1e2a          ! %f17
	.word	0xb8c15e0b          ! %f18
	.word	0x6ec96011          ! %f19
	.word	0xc4f047bd          ! %f20
	.word	0xd999ca9b          ! %f21
	.word	0xa7f0d418          ! %f22
	.word	0x4b4a3336          ! %f23
	.word	0xa21d6663          ! %f24
	.word	0xdc7c5d2c          ! %f25
	.word	0xa0aab0fb          ! %f26
	.word	0xe60bbafc          ! %f27
	.word	0xa3ca4168          ! %f28
	.word	0x634a278a          ! %f29
	.word	0x247a89c8          ! %f30
	.word	0x3edfc150          ! %f31
	.word	0x29454ab9          ! %f32
	.word	0xb047c1fb          ! %f33
	.word	0x3767cbe7          ! %f34
	.word	0x06ecf713          ! %f35
	.word	0x9553eee6          ! %f36
	.word	0x0269f4a2          ! %f37
	.word	0x1e092706          ! %f38
	.word	0x451448f9          ! %f39
	.word	0x51cc923a          ! %f40
	.word	0x1db67100          ! %f41
	.word	0xd3102250          ! %f42
	.word	0x6e5c1eb4          ! %f43
	.word	0xfd2acb0b          ! %f44
	.word	0x7d381fbe          ! %f45
	.word	0x72dc50de          ! %f46
	.word	0x67ade850          ! %f47
	.word	0x857c6d54          ! %f48
	.word	0xc6c406a9          ! %f49
	.word	0xf0a8d96d          ! %f50
	.word	0xc4149de0          ! %f51
	.word	0xb2db3b80          ! %f52
	.word	0xf1180afd          ! %f53
	.word	0x02de4552          ! %f54
	.word	0x4471155a          ! %f55
	.word	0x72905088          ! %f56
	.word	0x35ad13e5          ! %f57
	.word	0x2e3dcaaa          ! %f58
	.word	0xfd8352bf          ! %f59
	.word	0x803b973f          ! %f60
	.word	0x652a5142          ! %f61
	.word	0x813a85d5          ! %f62
	.word	0xd576367f          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xbe4       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x879d833c          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x080a3caa          ! %o0
	.word	0xc180fa73          ! %o1
	.word	0x266e052d          ! %o2
	.word	0x9a5963df          ! %o3
	.word	0x525b7a30          ! %o4
	.word	0xd69d813f          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xd52ae2ec          ! %l0
	.word	0x8fffaaab          ! %l1
	.word	0xed285624          ! %l2
	.word	0x250d2e1a          ! %l3
	.word	0x64b17d19          ! %l4
	.word	0x78899ab4          ! %l5
	.word	0x312f51d0          ! %l6
	.word	0xf869cb0a          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x0000001b          ! %i2 (byte offset)
	.word	0xffffffea          ! %i3 (halfword offset)
	.word	0xffffffe0          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8ca3f120          ! %y
	.word	0x0000000c          ! %icc (nzvc)
	.word	0xc0000040          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x570ee000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x20b8bde9
	.word	0x2b6b6849
	.word	0xaef76bd1
	.word	0x0b35c372
	.word	0x96b7d497
	.word	0xa964dfba
	.word	0x10218f9f
	.word	0xf873ecf8
	.word	0x95721459
	.word	0x9cf5b21d
	.word	0xf01dae2e
	.word	0x0e804d87
	.word	0x26d6dba3
	.word	0xce2e9f3d
	.word	0x50a78e8b
	.word	0x670700cb
	.word	0x0c8ab988
	.word	0x545747c7
	.word	0x210a1728
	.word	0x73772b55
	.word	0x2338315c
	.word	0x0246d21c
	.word	0xcf63f424
	.word	0xc34edd8d
	.word	0xcfb6949a
	.word	0x5de18868
	.word	0x9799ddce
	.word	0xc64db1e6
	.word	0x18aa1708
	.word	0x2489c3f3
	.word	0x2448436b
	.word	0xd7769a54
	.word	0xf3ce8118
	.word	0x7c63b9b6
	.word	0x62de5e37
	.word	0xdf5c90fa
	.word	0x45502491
	.word	0x5830fc31
	.word	0xc628f0a9
	.word	0x9bbd2028
	.word	0x1facf76e
	.word	0x6a81c67b
	.word	0xaa3335fb
	.word	0x8326f584
	.word	0x25d1f906
	.word	0xca47649a
	.word	0xf5c8c5e9
	.word	0x2c99f486
	.word	0x15c7456c
	.word	0x2fb44d14
	.word	0x494b70b8
	.word	0xaff17c29
	.word	0xaa7f7b18
	.word	0x5a0bbfc6
	.word	0x243c5779
	.word	0x23c0d3df
	.word	0x458556c6
	.word	0xb6cbfdf3
	.word	0x0b07c48e
	.word	0xeb54f3c4
	.word	0x678ca99e
	.word	0x15bb6f9f
	.word	0x4197886d
	.word	0x230e1c16
	.word	0x879a0d94
	.word	0xf5124a1e
	.word	0x8d27dea4
	.word	0x0576efe5
	.word	0x95c6fc11
	.word	0x727f8be7
	.word	0x4d171f1c
	.word	0x77a60706
	.word	0x8ede2ad3
	.word	0xfa6161ad
	.word	0x4728bfa1
	.word	0x12d22b4d
	.word	0x43665310
	.word	0x837648b0
	.word	0xb43869a1
	.word	0x7ad0b4fa
	.word	0x856fc6e1
	.word	0x33cd824f
	.word	0x66e22833
	.word	0xd0b8ba73
	.word	0xa6db78de
	.word	0x3912ace2
	.word	0x8a70f25b
	.word	0xbd5d0733
	.word	0xc4185a05
	.word	0x03b995c6
	.word	0x35b5158c
	.word	0x43fa0e02
	.word	0x1fbe31df
	.word	0xdf4c98b8
	.word	0x6778446d
	.word	0x19944a66
	.word	0x903b54e5
	.word	0x93712066
	.word	0x815d4ddf
	.word	0x2456c559
	.word	0x143cdd1f
	.word	0xa65b1c43
	.word	0xc655c03f
	.word	0x7f08b13b
	.word	0x52cf490d
	.word	0x6ba17f9a
	.word	0x13b7fce8
	.word	0x92ac5109
	.word	0x83afa4cb
	.word	0xfef31de6
	.word	0x13a47ffb
	.word	0xaac89ecf
	.word	0xc923a16f
	.word	0xf24c7860
	.word	0x9d116061
	.word	0xab02655b
	.word	0xd9313eb5
	.word	0xf84450d8
	.word	0x35bf4c11
	.word	0x05c0c133
	.word	0x4674eade
	.word	0x660e15c8
	.word	0x94cb848e
	.word	0xbee43cc8
	.word	0x435f3cd4
	.word	0x9b2e7ba5
	.word	0x3dc69fb3
	.word	0x9256fbea
	.word	0x3b91ac91
	.word	0x4fcfd778
	.word	0x7c7010b2
	.word	0x67afaa7e
	.word	0x98a3edc2
	.word	0x73690ead
	.word	0x1cb2bd59
	.word	0x2988226f
	.word	0xe011d0a7
	.word	0xad43302b
	.word	0xa17f2397
	.word	0x2bc3fce2
	.word	0x99abcd3c
	.word	0x14970aa4
	.word	0xabe3d33f
	.word	0x471282ad
	.word	0x06e29c9d
	.word	0x47bd542d
	.word	0xf28d400b
	.word	0x24bab008
	.word	0x35e884a6
	.word	0x6e813710
	.word	0x14e22fe2
	.word	0x4b773f85
	.word	0xde2939d9
	.word	0xc44e57e1
	.word	0xbc82495d
	.word	0xf013f03d
	.word	0x50437b84
	.word	0x30f0a8cf
	.word	0xa8408687
	.word	0x69dc7b4b
	.word	0x98bdce23
	.word	0xfb2d9e3b
	.word	0x2d0b8fe4
	.word	0x3700ec7e
	.word	0x6461f802
	.word	0x54e3988e
	.word	0x7fd243b4
	.word	0x6f1a5249
t0_data_exp_sp:
	.word	0xc5c12426
	.word	0x0dd59747
	.word	0x4792ed78
	.word	0x4535f8fe
	.word	0x571ccf6d
	.word	0x1e168952
	.word	0xdca7f1b5
	.word	0x2e7ca53b
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000003
	.word	0x00000016
	.word	0x00000018
	.word	0x00000000
	.word	t0_data_exp_fp
	.word	0x8d1bbef3
	.word	0x0d83ad18
	.word	0xa803b3d2
	.word	0xbd8e5b7f
	.word	0x743a49f9
	.word	0x21301fc2
	.word	0xd98ccc8a
	.word	0x6c53c2f8
	.word	0x477b049c
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
	.word   	0xceb7a931	! [%fp - 0xc]
	.word   	0xeb2d8731	! [%fp - 0x8]
	.word   	0xe8a3d721	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x52933798
	.word	0xcce7383d
	.word	0xa97f8c7f
	.word	0xb8f269e8
	.word	0x7093c34d
	.word	0x80a0c497
	.word	0x50922c73
	.word	0xcc448a15
	.word	0xa00fecd6
	.word	0x54109852
	.word	0xcb574386
	.word	0xb56ad266
	.word	0xcb3b6859
	.word	0x462f2da5
	.word	0xe3dcbf23
	.word	0x936f06fb
	.word	0x0a2e34a0
	.word	0xdd5ca4ef
	.word	0x7f357555
	.word	0xb773a4f4
	.word	0xc1521be8
	.word	0x192f16fa
	.word	0xbeeb43c2
	.word	0x8b0a4858
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x48f56000)
.seg "data"
t0_data_exp_area0_start:
.skip 2944
t0_data_exp_area0_begin:
	.word	0xf9e6edf9	! t0_data_exp_area0-0x20
	.word	0xd15d4783	! t0_data_exp_area0-0x1c
	.word	0x50ffa9d7	! t0_data_exp_area0-0x18
	.word	0x6af00c38	! t0_data_exp_area0-0x14
	.word	0x9bc7c776	! t0_data_exp_area0-0x10
	.word	0x26437bf9	! t0_data_exp_area0-0xc
	.word	0xa61f5244	! t0_data_exp_area0-0x8
	.word	0x576d4913	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xc76cfa76	! t0_data_exp_area0+0x0
	.word	0x4b187a85	! t0_data_exp_area0+0x4
	.word	0x37003fab	! t0_data_exp_area0+0x8
	.word	0x6788557c	! t0_data_exp_area0+0xc
	.word	0x4acb6c52	! t0_data_exp_area0+0x10
	.word	0x4ec4f54a	! t0_data_exp_area0+0x14
	.word	0x6d299093	! t0_data_exp_area0+0x18
	.word	0x9d112cfa	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 5184
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x166ec000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xf46b7cc0	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x6eafe5ed	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x53df0ea2	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xf786212f	! t0_data_exp_shm_area+0xc (t0)
	.word	0x9b1eca20	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x82f69d57	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x8ad9fd0b	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xc12ff93b	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xdf5d6716	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xcdaf8bb9	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x611bda44	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xfed62362	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x9ac85558	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xc34304d0	! t0_data_exp_shm_area+0x34 (t0)
	.word	0xc9bf08fc	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x7d51dceb	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x5bd859c8	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xa0d5846a	! t0_data_exp_shm_area+0x44
	.word	0x8274944c	! t0_data_exp_shm_area+0x48
	.word	0x2b51744b	! t0_data_exp_shm_area+0x4c
	.word	0x3c9d7dc4	! t0_data_exp_shm_area+0x50
	.word	0xfb733728	! t0_data_exp_shm_area+0x54
	.word	0x329d832c	! t0_data_exp_shm_area+0x58
	.word	0x9f0b0983	! t0_data_exp_shm_area+0x5c
	.word	0x7ce4d1bd	! t0_data_exp_shm_area+0x60
	.word	0x0764cb84	! t0_data_exp_shm_area+0x64
	.word	0x25e16f28	! t0_data_exp_shm_area+0x68
	.word	0xd9b070c5	! t0_data_exp_shm_area+0x6c
	.word	0xff5f4506	! t0_data_exp_shm_area+0x70
	.word	0x9711cf15	! t0_data_exp_shm_area+0x74
	.word	0x250b5252	! t0_data_exp_shm_area+0x78
	.word	0x736c1b5d	! t0_data_exp_shm_area+0x7c
	.word	0xa7bda6ee	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xac551c11	! t0_data_exp_shm_area+0x84
	.word	0x9f10c07a	! t0_data_exp_shm_area+0x88
	.word	0x64c92ace	! t0_data_exp_shm_area+0x8c
	.word	0x7a632510	! t0_data_exp_shm_area+0x90
	.word	0xa26c1b14	! t0_data_exp_shm_area+0x94
	.word	0x11b6ff9c	! t0_data_exp_shm_area+0x98
	.word	0x0be7123b	! t0_data_exp_shm_area+0x9c
	.word	0xb690dae8	! t0_data_exp_shm_area+0xa0
	.word	0x29f1dd1f	! t0_data_exp_shm_area+0xa4
	.word	0x608cb399	! t0_data_exp_shm_area+0xa8
	.word	0xe6fb6a09	! t0_data_exp_shm_area+0xac
	.word	0x370246aa	! t0_data_exp_shm_area+0xb0
	.word	0x87e351e2	! t0_data_exp_shm_area+0xb4
	.word	0x7126112a	! t0_data_exp_shm_area+0xb8
	.word	0xc0aad9c1	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d29f30763371
#define T0_KAOS_ICOUNT        5000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    2944
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     5002

#define T0_KAOS_BOOT_VA                  0x2df28000
#define T0_KAOS_BOOT_PA                  0x000000000140a000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x57cfa000
#define T0_KAOS_STARTUP_PA               0x0000000003de4000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x7905e000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004a42000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x1fe10000
#define T0_KAOS_DONE_PA                  0x0000000006596000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x281c0000
#define T0_KAOS_KTBL_PA                  0x0000000009dbc000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x287d4000
#define T0_KAOS_SUBR0_PA                 0x000000000aede000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x01698000
#define T0_KAOS_SUBR1_PA                 0x000000000ce62000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x280d0000
#define T0_KAOS_SUBR2_PA                 0x000000000f6d0000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x2810a000
#define T0_KAOS_SUBR3_PA                 0x0000000010bac000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x1a698000
#define T0_KAOS_EXP_REGS_PA              0x0000000012c2e000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x3c04e000
#define T0_KAOS_RUN_REGS_PA              0x0000000014b0e000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x570ee000
#define T0_KAOS_EXP_STACK_PA             0x0000000017ce6000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x5575c000
#define T0_KAOS_RUN_STACK_PA             0x00000000181d4000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x48f56000
#define T0_KAOS_EXP_AREA0_PA             0x000000001bdc8000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x26630000
#define T0_KAOS_RUN_AREA0_PA             0x000000001ce0c000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x166ec000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000001340000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x45612000
#define T0_KAOS_RUN_SHM_AREA_PA          0x00000000014c4000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x8c1bb74e
#define T0_KAOS_RANVAL_01     0x44ba1e3d
#define T0_KAOS_RANVAL_02     0x0ff4cc11
#define T0_KAOS_RANVAL_03     0xcfec3c3a
#define T0_KAOS_RANVAL_04     0x2b4907ef
#define T0_KAOS_RANVAL_05     0xfd7fd704
#define T0_KAOS_RANVAL_06     0x60f43490
#define T0_KAOS_RANVAL_07     0x12b761f6
#define T0_KAOS_RANVAL_08     0xfa3c3c55
#define T0_KAOS_RANVAL_09     0x9e93a402
#define T0_KAOS_RANVAL_0a     0x35f5381f
#define T0_KAOS_RANVAL_0b     0x12f315cc
#define T0_KAOS_RANVAL_0c     0x7fa0d2d0
#define T0_KAOS_RANVAL_0d     0x82f88f40
#define T0_KAOS_RANVAL_0e     0xc8dd3958
#define T0_KAOS_RANVAL_0f     0x562c47c7
#define T0_KAOS_RANVAL_10     0x46d1df47
#define T0_KAOS_RANVAL_11     0xd3a30487
#define T0_KAOS_RANVAL_12     0xf5e5f335
#define T0_KAOS_RANVAL_13     0x1cda824e
#define T0_KAOS_RANVAL_14     0x066e438f
#define T0_KAOS_RANVAL_15     0xe4a04522
#define T0_KAOS_RANVAL_16     0x081bdb7e
#define T0_KAOS_RANVAL_17     0x5b940d84
#define T0_KAOS_RANVAL_18     0xeb879901
#define T0_KAOS_RANVAL_19     0x0a5ad3e7
#define T0_KAOS_RANVAL_1a     0x0c3bb87c
#define T0_KAOS_RANVAL_1b     0x31d664f1
#define T0_KAOS_RANVAL_1c     0xf1dd9f46
#define T0_KAOS_RANVAL_1d     0x93eb1d78
#define T0_KAOS_RANVAL_1e     0xf2e75df2
#define T0_KAOS_RANVAL_1f     0xa52de361
#define T0_KAOS_RANVAL_20     0x66614474
#define T0_KAOS_RANVAL_21     0xe093e0c6
#define T0_KAOS_RANVAL_22     0x4e34c54d
#define T0_KAOS_RANVAL_23     0x4ed1c90c
#define T0_KAOS_RANVAL_24     0xe1579a5e
#define T0_KAOS_RANVAL_25     0x4a7e1bd6
#define T0_KAOS_RANVAL_26     0x5719f51a
#define T0_KAOS_RANVAL_27     0x9377fff7
#define T0_KAOS_RANVAL_28     0x12264d27
#define T0_KAOS_RANVAL_29     0x47c080c7
#define T0_KAOS_RANVAL_2a     0x086b6bb7
#define T0_KAOS_RANVAL_2b     0x2b764299
#define T0_KAOS_RANVAL_2c     0x55586f18
#define T0_KAOS_RANVAL_2d     0x58fab713
#define T0_KAOS_RANVAL_2e     0x564a014d
#define T0_KAOS_RANVAL_2f     0x5a7c88c0
#define T0_KAOS_RANVAL_30     0x0703adb3
#define T0_KAOS_RANVAL_31     0x528ced15
#define T0_KAOS_RANVAL_32     0xe53874fd
#define T0_KAOS_RANVAL_33     0x848edeb5
#define T0_KAOS_RANVAL_34     0xf5a34408
#define T0_KAOS_RANVAL_35     0x36f87dca
#define T0_KAOS_RANVAL_36     0xa2e01959
#define T0_KAOS_RANVAL_37     0x7fa30a9e
#define T0_KAOS_RANVAL_38     0xf4ff3e46
#define T0_KAOS_RANVAL_39     0x2e7eaedb
#define T0_KAOS_RANVAL_3a     0x770f5415
#define T0_KAOS_RANVAL_3b     0x68a8a423
#define T0_KAOS_RANVAL_3c     0xdb0be294
#define T0_KAOS_RANVAL_3d     0x65decada
#define T0_KAOS_RANVAL_3e     0x14f3e4fd
#define T0_KAOS_RANVAL_3f     0x16088254
#define T0_KAOS_RANVAL_40     0xc3165321
#define T0_KAOS_RANVAL_41     0x84651bcc
#define T0_KAOS_RANVAL_42     0x1e3e2829
#define T0_KAOS_RANVAL_43     0xdb12a3ca
#define T0_KAOS_RANVAL_44     0x3b50bd79
#define T0_KAOS_RANVAL_45     0x7c9089e7
#define T0_KAOS_RANVAL_46     0x1af9c770
#define T0_KAOS_RANVAL_47     0xed9ff50b
#define T0_KAOS_RANVAL_48     0x7f21ab1a
#define T0_KAOS_RANVAL_49     0x42ace29c
#define T0_KAOS_RANVAL_4a     0xc4bb8f1a
#define T0_KAOS_RANVAL_4b     0xc39f9933
#define T0_KAOS_RANVAL_4c     0x6abf4747
#define T0_KAOS_RANVAL_4d     0x3e1c0bd7
#define T0_KAOS_RANVAL_4e     0x418b59d8
#define T0_KAOS_RANVAL_4f     0x6f9d98cf
#define T0_KAOS_RANVAL_50     0xd3d8ae1b
#define T0_KAOS_RANVAL_51     0x64e8a784
#define T0_KAOS_RANVAL_52     0xd5ec47f8
#define T0_KAOS_RANVAL_53     0xcbcb1b0c
#define T0_KAOS_RANVAL_54     0x249c98e0
#define T0_KAOS_RANVAL_55     0xf1e0eb55
#define T0_KAOS_RANVAL_56     0x6cd4b5d4
#define T0_KAOS_RANVAL_57     0xf0ee8d10
#define T0_KAOS_RANVAL_58     0xcb8dfba1
#define T0_KAOS_RANVAL_59     0xa420b0c2
#define T0_KAOS_RANVAL_5a     0xeb8aa58b
#define T0_KAOS_RANVAL_5b     0x7c245ba7
#define T0_KAOS_RANVAL_5c     0x708c67fd
#define T0_KAOS_RANVAL_5d     0xcfde0151
#define T0_KAOS_RANVAL_5e     0x65708ff3
#define T0_KAOS_RANVAL_5f     0xd9bf2322
#define T0_KAOS_RANVAL_60     0x1f7f493d
#define T0_KAOS_RANVAL_61     0x1bbba317
#define T0_KAOS_RANVAL_62     0xe419d0ce
#define T0_KAOS_RANVAL_63     0xa720797b
#define T0_KAOS_RANVAL_64     0x48704da9
#define T0_KAOS_RANVAL_65     0x3819697d
#define T0_KAOS_RANVAL_66     0x09bd223b
#define T0_KAOS_RANVAL_67     0x1f51b6bd
#define T0_KAOS_RANVAL_68     0xb4d29116
#define T0_KAOS_RANVAL_69     0xd7124e47
#define T0_KAOS_RANVAL_6a     0x7a8edb6e
#define T0_KAOS_RANVAL_6b     0xf0b65fa2
#define T0_KAOS_RANVAL_6c     0x57795cc3
#define T0_KAOS_RANVAL_6d     0x985496d2
#define T0_KAOS_RANVAL_6e     0xcbf3e6a3
#define T0_KAOS_RANVAL_6f     0x33a8167d
#define T0_KAOS_RANVAL_70     0x319a9066
#define T0_KAOS_RANVAL_71     0xec00899c
#define T0_KAOS_RANVAL_72     0x0219a24f
#define T0_KAOS_RANVAL_73     0x0c66365a
#define T0_KAOS_RANVAL_74     0xc8660881
#define T0_KAOS_RANVAL_75     0x577e7809
#define T0_KAOS_RANVAL_76     0x248e2198
#define T0_KAOS_RANVAL_77     0xbcc17c63
#define T0_KAOS_RANVAL_78     0xc57c95f9
#define T0_KAOS_RANVAL_79     0x3f052064
#define T0_KAOS_RANVAL_7a     0x9c378007
#define T0_KAOS_RANVAL_7b     0x1d8e6384
#define T0_KAOS_RANVAL_7c     0x1e265ae8
#define T0_KAOS_RANVAL_7d     0xda95ac23
#define T0_KAOS_RANVAL_7e     0x47c03c7c
#define T0_KAOS_RANVAL_7f     0x1b6f1652
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
!    areaoffset     2944
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      5002
!    code           281c0000
!    entry          281c0000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d29f30763371
!    va_map         0000000000400000,000000007fffffff
!    pa_cached      0000000000400000,000000007fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9.w
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

KTEXT_MODULE(t0_module_ktbl, 0x281c0000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0xd816200a	! t0_kref+0x0:   	lduh	[%i0 + 0xa], %o4
	.word	0xaf418000	! t0_kref+0x4:   	mov	%fprs, %l7
	.word	0xa6068000	! t0_kref+0x8:   	add	%i2, %g0, %l3
	.word	0xd848a039	! t0_kref+0xc:   	ldsb	[%g2 + 0x39], %o4
	.word	0x9aa2756c	! t0_kref+0x10:   	subcc	%o1, -0xa94, %o5
	.word	0xe41e4000	! t0_kref+0x14:   	ldd	[%i1], %l2
	.word	0xd04e4000	! t0_kref+0x18:   	ldsb	[%i1], %o0
	.word	0x97368009	! t0_kref+0x1c:   	srl	%i2, %o1, %o3
	.word	0xaa42b4ab	! t0_kref+0x20:   	addc	%o2, -0xb55, %l5
	.word	0xebee101b	! t0_kref+0x24:   	prefetcha	%i0 + %i3, 21
	.word	0x989f2397	! t0_kref+0x28:   	xorcc	%i4, 0x397, %o4
	.word	0xb1a00527	! t0_kref+0x2c:   	fsqrts	%f7, %f24
	.word	0xaa230009	! t0_kref+0x30:   	sub	%o4, %o1, %l5
	.word	0x90034017	! t0_kref+0x34:   	add	%o5, %l7, %o0
	.word	0xae030017	! t0_kref+0x38:   	add	%o4, %l7, %l7
	.word	0x81dec00d	! t0_kref+0x3c:   	flush	%i3 + %o5
	.word	0x23800008	! t0_kref+0x40:   	fbne,a	_kref+0x60
	.word	0x9f400000	! t0_kref+0x44:   	mov	%y, %o7
	.word	0xe96e2010	! t0_kref+0x48:   	prefetch	%i0 + 0x10, 20
	.word	0x9ae26a3c	! t0_kref+0x4c:   	subccc	%o1, 0xa3c, %o5
	.word	0x81a448b2	! t0_kref+0x50:   	fsubs	%f17, %f18, %f0
	.word	0xc986101c	! t0_kref+0x54:   	lda	[%i0 + %i4]0x80, %f4
	.word	0x965ec000	! t0_kref+0x58:   	smul	%i3, %g0, %o3
	.word	0x8da01a5a	! t0_kref+0x5c:   	fdtoi	%f26, %f6
	.word	0x3e480004	! t0_kref+0x60:   	bvc,a,pt	%icc, _kref+0x70
	.word	0x9a12400b	! t0_kref+0x64:   	or	%o1, %o3, %o5
	.word	0x81daf56f	! t0_kref+0x68:   	flush	%o3 - 0xa91
	.word	0x99a000a5	! t0_kref+0x6c:   	fnegs	%f5, %f12
	.word	0x970a801c	! t0_kref+0x70:   	tsubcc	%o2, %i4, %o3
	.word	0x988b401c	! t0_kref+0x74:   	andcc	%o5, %i4, %o4
	.word	0x953ac00c	! t0_kref+0x78:   	sra	%o3, %o4, %o2
	.word	0xe56e6008	! t0_kref+0x7c:   	prefetch	%i1 + 8, 18
	.word	0xef00a02c	! t0_kref+0x80:   	ld	[%g2 + 0x2c], %f23
	.word	0x971f0009	! t0_kref+0x84:   	tsubcctv	%i4, %o1, %o3
	.word	0x22480004	! t0_kref+0x88:   	be,a,pt	%icc, _kref+0x98
	.word	0x9e66afe7	! t0_kref+0x8c:   	subc	%i2, 0xfe7, %o7
	.word	0x30800006	! t0_kref+0x90:   	ba,a	_kref+0xa8
	.word	0xad372019	! t0_kref+0x94:   	srl	%i4, 0x19, %l6
	.word	0x2b0f9647	! t0_kref+0x98:   	sethi	%hi(0x3e591c00), %l5
	.word	0xa8b3400b	! t0_kref+0x9c:   	orncc	%o5, %o3, %l4
	.word	0x9fc00004	! t0_kref+0xa0:   	call	%g0 + %g4
	.word	0x9ba01a2c	! t0_kref+0xa4:   	fstoi	%f12, %f13
	.word	0x9ba489b1	! t0_kref+0xa8:   	fdivs	%f18, %f17, %f13
	.word	0xad280008	! t0_kref+0xac:   	sll	%g0, %o0, %l6
	.word	0x94468017	! t0_kref+0xb0:   	addc	%i2, %l7, %o2
	.word	0xd840a014	! t0_kref+0xb4:   	ldsw	[%g2 + 0x14], %o4
	.word	0x39480008	! t0_kref+0xb8:   	fbuge,a,pt	%fcc0, _kref+0xd8
	.word	0xac8ec01b	! t0_kref+0xbc:   	andcc	%i3, %i3, %l6
	.word	0x965debde	! t0_kref+0xc0:   	smul	%l7, 0xbde, %o3
	.word	0x3f480007	! t0_kref+0xc4:   	fbo,a,pt	%fcc0, _kref+0xe0
	.word	0x9ec323c0	! t0_kref+0xc8:   	addccc	%o4, 0x3c0, %o7
	.word	0xb1a6082a	! t0_kref+0xcc:   	fadds	%f24, %f10, %f24
	.word	0xaa224009	! t0_kref+0xd0:   	sub	%o1, %o1, %l5
	.word	0xafa0188f	! t0_kref+0xd4:   	fitos	%f15, %f23
	.word	0xe498105d	! t0_kref+0xd8:   	ldda	[%g0 + %i5]0x82, %l2
	.word	0x81a88a40	! t0_kref+0xdc:   	fcmpd	%fcc0, %f2, %f0
	.word	0x9e0a62f8	! t0_kref+0xe0:   	and	%o1, 0x2f8, %o7
	.word	0x81ab4ab0	! t0_kref+0xe4:   	fcmpes	%fcc0, %f13, %f16
	.word	0x3c480003	! t0_kref+0xe8:   	bpos,a,pt	%icc, _kref+0xf4
	.word	0xe3270005	! t0_kref+0xec:   	st	%f17, [%i4 + %g5]
	.word	0xd600a024	! t0_kref+0xf0:   	ld	[%g2 + 0x24], %o3
	.word	0xee48a026	! t0_kref+0xf4:   	ldsb	[%g2 + 0x26], %l7
	.word	0x38480004	! t0_kref+0xf8:   	bgu,a,pt	%icc, _kref+0x108
	.word	0xda08a035	! t0_kref+0xfc:   	ldub	[%g2 + 0x35], %o5
	.word	0xc9ee501c	! t0_kref+0x100:   	prefetcha	%i1 + %i4, 4
	.word	0xac06fc64	! t0_kref+0x104:   	add	%i3, -0x39c, %l6
	.word	0xda00a000	! t0_kref+0x108:   	ld	[%g2], %o5
	.word	0xae1a7e12	! t0_kref+0x10c:   	xor	%o1, -0x1ee, %l7
	sethi	%hi(2f), %o7
	.word	0xe40be144	! t0_kref+0x114:   	ldub	[%o7 + 0x144], %l2
	.word	0xa41ca00c	! t0_kref+0x118:   	xor	%l2, 0xc, %l2
	.word	0xe42be144	! t0_kref+0x11c:   	stb	%l2, [%o7 + 0x144]
	.word	0x81dbe144	! t0_kref+0x120:   	flush	%o7 + 0x144
	.word	0x9da00529	! t0_kref+0x124:   	fsqrts	%f9, %f14
	.word	0x81ae8ab7	! t0_kref+0x128:   	fcmpes	%fcc0, %f26, %f23
	.word	0xea40a008	! t0_kref+0x12c:   	ldsw	[%g2 + 8], %l5
	.word	0x29480007	! t0_kref+0x130:   	fbl,a,pt	%fcc0, _kref+0x14c
	.word	0xd4ff1019	! t0_kref+0x134:   	swapa	[%i4 + %i1]0x80, %o2
	.word	0xd02e6004	! t0_kref+0x138:   	stb	%o0, [%i1 + 4]
	.word	0x9066e80a	! t0_kref+0x13c:   	subc	%i3, 0x80a, %o0
	.word	0xacf339a8	! t0_kref+0x140:   	udivcc	%o4, -0x658, %l6
2:	.word	0xda48a03f	! t0_kref+0x144:   	ldsb	[%g2 + 0x3f], %o5
	.word	0x9ec2b518	! t0_kref+0x148:   	addccc	%o2, -0xae8, %o7
	.word	0x98234008	! t0_kref+0x14c:   	sub	%o5, %o0, %o4
	.word	0x27480006	! t0_kref+0x150:   	fbul,a,pt	%fcc0, _kref+0x168
	.word	0xd0ce1000	! t0_kref+0x154:   	ldsba	[%i0]0x80, %o0
	.word	0xaf400000	! t0_kref+0x158:   	mov	%y, %l7
	.word	0x89a0002d	! t0_kref+0x15c:   	fmovs	%f13, %f4
	.word	0x9f3ae01f	! t0_kref+0x160:   	sra	%o3, 0x1f, %o7
	.word	0xe64e7ff3	! t0_kref+0x164:   	ldsb	[%i1 - 0xd], %l3
	.word	0x81dc6310	! t0_kref+0x168:   	flush	%l1 + 0x310
	.word	0x81db8000	! t0_kref+0x16c:   	flush	%sp
	.word	0xc398a040	! t0_kref+0x170:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xb1a9405a	! t0_kref+0x174:   	fmovdug	%fcc0, %f26, %f24
	.word	0xc16e3fe0	! t0_kref+0x178:   	prefetch	%i0 - 0x20, 0
	.word	0x8fa01893	! t0_kref+0x17c:   	fitos	%f19, %f7
	.word	0xe9270019	! t0_kref+0x180:   	st	%f20, [%i4 + %i1]
	.word	0x98568017	! t0_kref+0x184:   	umul	%i2, %l7, %o4
	.word	0xa7a40931	! t0_kref+0x188:   	fmuls	%f16, %f17, %f19
	.word	0x925ef982	! t0_kref+0x18c:   	smul	%i3, -0x67e, %o1
	.word	0xf6b6d018	! t0_kref+0x190:   	stha	%i3, [%i3 + %i0]0x80
	.word	0x38480006	! t0_kref+0x194:   	bgu,a,pt	%icc, _kref+0x1ac
	.word	0x9da04826	! t0_kref+0x198:   	fadds	%f1, %f6, %f14
	.word	0xacaa4017	! t0_kref+0x19c:   	andncc	%o1, %l7, %l6
	.word	0xd628a005	! t0_kref+0x1a0:   	stb	%o3, [%g2 + 5]
	.word	0x913b0008	! t0_kref+0x1a4:   	sra	%o4, %o0, %o0
	.word	0xedee501b	! t0_kref+0x1a8:   	prefetcha	%i1 + %i3, 22
	.word	0x99a288b1	! t0_kref+0x1ac:   	fsubs	%f10, %f17, %f12
	.word	0x908a0000	! t0_kref+0x1b0:   	andcc	%o0, %g0, %o0
	.word	0x81ac0aab	! t0_kref+0x1b4:   	fcmpes	%fcc0, %f16, %f11
	.word	0xf007bfe0	! t0_kref+0x1b8:   	ld	[%fp - 0x20], %i0
	.word	0x9fc10000	! t0_kref+0x1bc:   	call	%g4
	.word	0xd216c019	! t0_kref+0x1c0:   	lduh	[%i3 + %i1], %o1
	.word	0xac3ef2a4	! t0_kref+0x1c4:   	xnor	%i3, -0xd5c, %l6
	.word	0xf700a038	! t0_kref+0x1c8:   	ld	[%g2 + 0x38], %f27
	.word	0xa645c00c	! t0_kref+0x1cc:   	addc	%l7, %o4, %l3
	.word	0xaba00534	! t0_kref+0x1d0:   	fsqrts	%f20, %f21
	.word	0xaba000a6	! t0_kref+0x1d4:   	fnegs	%f6, %f21
	.word	0x86102018	! t0_kref+0x1d8:   	mov	0x18, %g3
	.word	0x86a0e001	! t0_kref+0x1dc:   	subcc	%g3, 1, %g3
	.word	0x22800001	! t0_kref+0x1e0:   	be,a	_kref+0x1e4
	.word	0xc0680019	! t0_kref+0x1e4:   	ldstub	[%g0 + %i1], %g0
	.word	0xd04e001a	! t0_kref+0x1e8:   	ldsb	[%i0 + %i2], %o0
	.word	0xc51fbeb0	! t0_kref+0x1ec:   	ldd	[%fp - 0x150], %f2
	.word	0x99326013	! t0_kref+0x1f0:   	srl	%o1, 0x13, %o4
	.word	0xe408763c	! t0_kref+0x1f4:   	ldub	[%g1 - 0x9c4], %l2
	.word	0xa41ca00c	! t0_kref+0x1f8:   	xor	%l2, 0xc, %l2
	.word	0xe428763c	! t0_kref+0x1fc:   	stb	%l2, [%g1 - 0x9c4]
	.word	0x81d8763c	! t0_kref+0x200:   	flush	%g1 - 0x9c4
	.word	0xef6e401a	! t0_kref+0x204:   	prefetch	%i1 + %i2, 23
	.word	0xd0861000	! t0_kref+0x208:   	lda	[%i0]0x80, %o0
	.word	0xf7871058	! t0_kref+0x20c:   	lda	[%i4 + %i0]0x82, %f27
	.word	0xd420a000	! t0_kref+0x210:   	st	%o2, [%g2]
	.word	0x2e800006	! t0_kref+0x214:   	bvs,a	_kref+0x22c
	.word	0xd286501c	! t0_kref+0x218:   	lda	[%i1 + %i4]0x80, %o1
	.word	0xda40a020	! t0_kref+0x21c:   	ldsw	[%g2 + 0x20], %o5
2:	.word	0x81a2c836	! t0_kref+0x220:   	fadds	%f11, %f22, %f0
	call	SYM(t0_subr1)
	.word	0xada01883	! t0_kref+0x228:   	fitos	%f3, %f22
	.word	0x81aa4aae	! t0_kref+0x22c:   	fcmpes	%fcc0, %f9, %f14
	.word	0x86102003	! t0_kref+0x230:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x234:   	bne,a	_kref+0x234
	.word	0x86a0e001	! t0_kref+0x238:   	subcc	%g3, 1, %g3
	.word	0x9e7a8000	! t0_kref+0x23c:   	sdiv	%o2, %g0, %o7
	.word	0x20800003	! t0_kref+0x240:   	bn,a	_kref+0x24c
	.word	0x8143c000	! t0_kref+0x244:   	stbar
	call	SYM(t0_subr1)
	.word	0x9840000a	! t0_kref+0x24c:   	addc	%g0, %o2, %o4
	.word	0xada00124	! t0_kref+0x250:   	fabss	%f4, %f22
	.word	0x39480003	! t0_kref+0x254:   	fbuge,a,pt	%fcc0, _kref+0x260
	.word	0x9ba000b4	! t0_kref+0x258:   	fnegs	%f20, %f13
	.word	0x33800005	! t0_kref+0x25c:   	fbe,a	_kref+0x270
	.word	0xd430a000	! t0_kref+0x260:   	sth	%o2, [%g2]
	.word	0xd620a03c	! t0_kref+0x264:   	st	%o3, [%g2 + 0x3c]
	.word	0xdf00a030	! t0_kref+0x268:   	ld	[%g2 + 0x30], %f15
	.word	0x9932e00d	! t0_kref+0x26c:   	srl	%o3, 0xd, %o4
	.word	0x3c480002	! t0_kref+0x270:   	bpos,a,pt	%icc, _kref+0x278
	.word	0x98aea392	! t0_kref+0x274:   	andncc	%i2, 0x392, %o4
	.word	0x9243631c	! t0_kref+0x278:   	addc	%o5, 0x31c, %o1
	.word	0xd03e001d	! t0_kref+0x27c:   	std	%o0, [%i0 + %i5]
	.word	0xec861000	! t0_kref+0x280:   	lda	[%i0]0x80, %l6
	.word	0xd22e7ff7	! t0_kref+0x284:   	stb	%o1, [%i1 - 9]
	.word	0x9855fa87	! t0_kref+0x288:   	umul	%l7, -0x579, %o4
	.word	0xf628a027	! t0_kref+0x28c:   	stb	%i3, [%g2 + 0x27]
	.word	0xefee101a	! t0_kref+0x290:   	prefetcha	%i0 + %i2, 23
	.word	0x2b800003	! t0_kref+0x294:   	fbug,a	_kref+0x2a0
	.word	0xe68e9058	! t0_kref+0x298:   	lduba	[%i2 + %i0]0x82, %l3
	.word	0xa1a00525	! t0_kref+0x29c:   	fsqrts	%f5, %f16
	.word	0xd4be1000	! t0_kref+0x2a0:   	stda	%o2, [%i0]0x80
	.word	0xaba508ad	! t0_kref+0x2a4:   	fsubs	%f20, %f13, %f21
	.word	0x91a01a2f	! t0_kref+0x2a8:   	fstoi	%f15, %f8
	.word	0xe51e3ff0	! t0_kref+0x2ac:   	ldd	[%i0 - 0x10], %f18
	.word	0xe51fbcb8	! t0_kref+0x2b0:   	ldd	[%fp - 0x348], %f18
	.word	0xea00a030	! t0_kref+0x2b4:   	ld	[%g2 + 0x30], %l5
	.word	0xd49e101d	! t0_kref+0x2b8:   	ldda	[%i0 + %i5]0x80, %o2
	.word	0x9812c008	! t0_kref+0x2bc:   	or	%o3, %o0, %o4
	.word	0x31480006	! t0_kref+0x2c0:   	fba,a,pt	%fcc0, _kref+0x2d8
	.word	0x9e12667b	! t0_kref+0x2c4:   	or	%o1, 0x67b, %o7
	.word	0x9a620017	! t0_kref+0x2c8:   	subc	%o0, %l7, %o5
	.word	0xac22001a	! t0_kref+0x2cc:   	sub	%o0, %i2, %l6
	.word	0xf100a01c	! t0_kref+0x2d0:   	ld	[%g2 + 0x1c], %f24
	.word	0xe41e401d	! t0_kref+0x2d4:   	ldd	[%i1 + %i5], %l2
	.word	0xe41e3fe0	! t0_kref+0x2d8:   	ldd	[%i0 - 0x20], %l2
	.word	0xc07f0019	! t0_kref+0x2dc:   	swap	[%i4 + %i1], %g0
	.word	0xa5a018d6	! t0_kref+0x2e0:   	fdtos	%f22, %f18
	.word	0xd1be1849	! t0_kref+0x2e4:   	stda	%f8, [%i0 + %o1]0xc2
	.word	0xe3b8a080	! t0_kref+0x2e8:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x965f39ff	! t0_kref+0x2ec:   	smul	%i4, -0x601, %o3
	.word	0xc13e6000	! t0_kref+0x2f0:   	std	%f0, [%i1]
	.word	0xeb20a004	! t0_kref+0x2f4:   	st	%f21, [%g2 + 4]
	.word	0x92c2000c	! t0_kref+0x2f8:   	addccc	%o0, %o4, %o1
	.word	0xed1fbf78	! t0_kref+0x2fc:   	ldd	[%fp - 0x88], %f22
	.word	0x81ad8a42	! t0_kref+0x300:   	fcmpd	%fcc0, %f22, %f2
	.word	0x878020f0	! t0_kref+0x304:   	mov	0xf0, %asi
	.word	0x9da089a3	! t0_kref+0x308:   	fdivs	%f2, %f3, %f14
	.word	0xe1ee101a	! t0_kref+0x30c:   	prefetcha	%i0 + %i2, 16
	.word	0xd030a01e	! t0_kref+0x310:   	sth	%o0, [%g2 + 0x1e]
	.word	0x81a00146	! t0_kref+0x314:   	fabsd	%f6, %f0
	.word	0xda462010	! t0_kref+0x318:   	ldsw	[%i0 + 0x10], %o5
	.word	0xc398a040	! t0_kref+0x31c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xa7a289ab	! t0_kref+0x320:   	fdivs	%f10, %f11, %f19
	.word	0xac9724e2	! t0_kref+0x324:   	orcc	%i4, 0x4e2, %l6
	.word	0x81ad8a40	! t0_kref+0x328:   	fcmpd	%fcc0, %f22, %f0
	.word	0x97400000	! t0_kref+0x32c:   	mov	%y, %o3
	.word	0x94c2000a	! t0_kref+0x330:   	addccc	%o0, %o2, %o2
	.word	0xda20a01c	! t0_kref+0x334:   	st	%o5, [%g2 + 0x1c]
	.word	0xa1a00144	! t0_kref+0x338:   	fabsd	%f4, %f16
	.word	0xde40a024	! t0_kref+0x33c:   	ldsw	[%g2 + 0x24], %o7
	.word	0xd230a02c	! t0_kref+0x340:   	sth	%o1, [%g2 + 0x2c]
	.word	0xd6871018	! t0_kref+0x344:   	lda	[%i4 + %i0]0x80, %o3
	.word	0x9646c017	! t0_kref+0x348:   	addc	%i3, %l7, %o3
	.word	0xa8a73e18	! t0_kref+0x34c:   	subcc	%i4, -0x1e8, %l4
	.word	0x87a00135	! t0_kref+0x350:   	fabss	%f21, %f3
	.word	0x3e800003	! t0_kref+0x354:   	bvc,a	_kref+0x360
	.word	0xe848a038	! t0_kref+0x358:   	ldsb	[%g2 + 0x38], %l4
	.word	0xaa02bbb7	! t0_kref+0x35c:   	add	%o2, -0x449, %l5
	.word	0x28800002	! t0_kref+0x360:   	bleu,a	_kref+0x368
	.word	0x95a5894e	! t0_kref+0x364:   	fmuld	%f22, %f14, %f10
	.word	0xe11fbf60	! t0_kref+0x368:   	ldd	[%fp - 0xa0], %f16
	.word	0xd43e2000	! t0_kref+0x36c:   	std	%o2, [%i0]
	.word	0x940238ba	! t0_kref+0x370:   	add	%o0, -0x746, %o2
	.word	0xd100a004	! t0_kref+0x374:   	ld	[%g2 + 4], %f8
	.word	0xf96e7ff8	! t0_kref+0x378:   	prefetch	%i1 - 8, 28
	.word	0x94f5c01a	! t0_kref+0x37c:   	udivcc	%l7, %i2, %o2
	.word	0x81a2cd2e	! t0_kref+0x380:   	fsmuld	%f11, %f14, %f0
	.word	0xb5a34830	! t0_kref+0x384:   	fadds	%f13, %f16, %f26
	.word	0x37800002	! t0_kref+0x388:   	fbge,a	_kref+0x390
	.word	0x92c2b3d1	! t0_kref+0x38c:   	addccc	%o2, -0xc2f, %o1
	.word	0x29480003	! t0_kref+0x390:   	fbl,a,pt	%fcc0, _kref+0x39c
	.word	0x988a3131	! t0_kref+0x394:   	andcc	%o0, -0xecf, %o4
	.word	0xa7a3083a	! t0_kref+0x398:   	fadds	%f12, %f26, %f19
	.word	0x81a00533	! t0_kref+0x39c:   	fsqrts	%f19, %f0
	.word	0xdd1fbfa0	! t0_kref+0x3a0:   	ldd	[%fp - 0x60], %f14
	.word	0x99a208c4	! t0_kref+0x3a4:   	fsubd	%f8, %f4, %f12
	.word	0xcd266008	! t0_kref+0x3a8:   	st	%f6, [%i1 + 8]
	.word	0xa6aa8017	! t0_kref+0x3ac:   	andncc	%o2, %l7, %l3
	.word	0xa846e2cf	! t0_kref+0x3b0:   	addc	%i3, 0x2cf, %l4
	.word	0xda260000	! t0_kref+0x3b4:   	st	%o5, [%i0]
	.word	0xe36e7ff8	! t0_kref+0x3b8:   	prefetch	%i1 - 8, 17
	.word	0x35480004	! t0_kref+0x3bc:   	fbue,a,pt	%fcc0, _kref+0x3cc
	.word	0xae62c00b	! t0_kref+0x3c0:   	subc	%o3, %o3, %l7
	.word	0x35480004	! t0_kref+0x3c4:   	fbue,a,pt	%fcc0, _kref+0x3d4
	.word	0xd410a02a	! t0_kref+0x3c8:   	lduh	[%g2 + 0x2a], %o2
	.word	0xc36e7ff0	! t0_kref+0x3cc:   	prefetch	%i1 - 0x10, 1
	.word	0xd816001b	! t0_kref+0x3d0:   	lduh	[%i0 + %i3], %o4
	.word	0xada508c4	! t0_kref+0x3d4:   	fsubd	%f20, %f4, %f22
	call	SYM(t0_subr1)
	.word	0x85a018d0	! t0_kref+0x3dc:   	fdtos	%f16, %f2
	.word	0x81a009ab	! t0_kref+0x3e0:   	fdivs	%f0, %f11, %f0
	.word	0xaef6af4a	! t0_kref+0x3e4:   	udivcc	%i2, 0xf4a, %l7
	.word	0x95a01937	! t0_kref+0x3e8:   	fstod	%f23, %f10
	call	SYM(t0_subr2)
	.word	0xe11e401d	! t0_kref+0x3f0:   	ldd	[%i1 + %i5], %f16
	.word	0x95a00137	! t0_kref+0x3f4:   	fabss	%f23, %f10
	.word	0xaa42391f	! t0_kref+0x3f8:   	addc	%o0, -0x6e1, %l5
	.word	0xd0380019	! t0_kref+0x3fc:   	std	%o0, [%g0 + %i1]
	.word	0x97a0053b	! t0_kref+0x400:   	fsqrts	%f27, %f11
	.word	0x963a6f88	! t0_kref+0x404:   	xnor	%o1, 0xf88, %o3
	.word	0xaa92800d	! t0_kref+0x408:   	orcc	%o2, %o5, %l5
	.word	0x952f000c	! t0_kref+0x40c:   	sll	%i4, %o4, %o2
	.word	0x96830008	! t0_kref+0x410:   	addcc	%o4, %o0, %o3
	.word	0x8583356f	! t0_kref+0x414:   	wr	%o4, 0xfffff56f, %ccr
	.word	0xe11e0000	! t0_kref+0x418:   	ldd	[%i0], %f16
	.word	0x96c2ef3e	! t0_kref+0x41c:   	addccc	%o3, 0xf3e, %o3
	.word	0xd050a00a	! t0_kref+0x420:   	ldsh	[%g2 + 0xa], %o0
	.word	0x9890001a	! t0_kref+0x424:   	orcc	%g0, %i2, %o4
	.word	0xe5270019	! t0_kref+0x428:   	st	%f18, [%i4 + %i1]
	.word	0xd0bf5018	! t0_kref+0x42c:   	stda	%o0, [%i5 + %i0]0x80
	sethi	%hi(2f), %o7
	.word	0xe40be078	! t0_kref+0x434:   	ldub	[%o7 + 0x78], %l2
	.word	0xa41ca00c	! t0_kref+0x438:   	xor	%l2, 0xc, %l2
	.word	0xe42be078	! t0_kref+0x43c:   	stb	%l2, [%o7 + 0x78]
	.word	0x81dbe078	! t0_kref+0x440:   	flush	%o7 + 0x78
	.word	0xa5a0189a	! t0_kref+0x444:   	fitos	%f26, %f18
	.word	0xa9400000	! t0_kref+0x448:   	mov	%y, %l4
	.word	0xda167fe8	! t0_kref+0x44c:   	lduh	[%i1 - 0x18], %o5
	.word	0xae62f301	! t0_kref+0x450:   	subc	%o3, -0xcff, %l7
	.word	0x31800007	! t0_kref+0x454:   	fba,a	_kref+0x470
	.word	0xd04e2012	! t0_kref+0x458:   	ldsb	[%i0 + 0x12], %o0
	.word	0x37800001	! t0_kref+0x45c:   	fbge,a	_kref+0x460
	.word	0xaa7271ca	! t0_kref+0x460:   	udiv	%o1, -0xe36, %l5
	.word	0xf420a000	! t0_kref+0x464:   	st	%i2, [%g2]
	.word	0xe84e6002	! t0_kref+0x468:   	ldsb	[%i1 + 2], %l4
	.word	0x3d800007	! t0_kref+0x46c:   	fbule,a	_kref+0x488
	.word	0xa8a22d57	! t0_kref+0x470:   	subcc	%o0, 0xd57, %l4
	.word	0xf6200018	! t0_kref+0x474:   	st	%i3, [%g0 + %i0]
2:	.word	0xace5c01c	! t0_kref+0x478:   	subccc	%l7, %i4, %l6
	.word	0x8da01a22	! t0_kref+0x47c:   	fstoi	%f2, %f6
	.word	0x9a66c01c	! t0_kref+0x480:   	subc	%i3, %i4, %o5
	.word	0x90883a33	! t0_kref+0x484:   	andcc	%g0, -0x5cd, %o0
	.word	0x987a0000	! t0_kref+0x488:   	sdiv	%o0, %g0, %o4
	.word	0x9fc00004	! t0_kref+0x48c:   	call	%g0 + %g4
	.word	0xb1a01052	! t0_kref+0x490:   	fdtox	%f18, %f24
	.word	0x91400000	! t0_kref+0x494:   	mov	%y, %o0
	.word	0x9f22400b	! t0_kref+0x498:   	mulscc	%o1, %o3, %o7
	.word	0xa6d5c000	! t0_kref+0x49c:   	umulcc	%l7, %g0, %l3
	.word	0x87a000ac	! t0_kref+0x4a0:   	fnegs	%f12, %f3
	.word	0xa1a389c0	! t0_kref+0x4a4:   	fdivd	%f14, %f0, %f16
	.word	0x9a16801b	! t0_kref+0x4a8:   	or	%i2, %i3, %o5
	.word	0xe11fbfa8	! t0_kref+0x4ac:   	ldd	[%fp - 0x58], %f16
	.word	0xf8364000	! t0_kref+0x4b0:   	sth	%i4, [%i1]
	.word	0xa68b6233	! t0_kref+0x4b4:   	andcc	%o5, 0x233, %l3
	.word	0xe1be185c	! t0_kref+0x4b8:   	stda	%f16, [%i0 + %i4]0xc2
	call	SYM(t0_subr1)
	.word	0xe3b8a080	! t0_kref+0x4c0:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x28800007	! t0_kref+0x4c4:   	bleu,a	_kref+0x4e0
	.word	0xc900a028	! t0_kref+0x4c8:   	ld	[%g2 + 0x28], %f4
	.word	0x81deb3c9	! t0_kref+0x4cc:   	flush	%i2 - 0xc37
	.word	0x8d837b40	! t0_kref+0x4d0:   	wr	%o5, 0xfffffb40, %fprs
	.word	0x31480007	! t0_kref+0x4d4:   	fba,a,pt	%fcc0, _kref+0x4f0
	.word	0xcf20a02c	! t0_kref+0x4d8:   	st	%f7, [%g2 + 0x2c]
	.word	0xe7ee101c	! t0_kref+0x4dc:   	prefetcha	%i0 + %i4, 19
	.word	0xa1a0104e	! t0_kref+0x4e0:   	fdtox	%f14, %f16
	.word	0x98127917	! t0_kref+0x4e4:   	or	%o1, -0x6e9, %o4
	.word	0xc020a038	! t0_kref+0x4e8:   	clr	[%g2 + 0x38]
	.word	0xd7a65000	! t0_kref+0x4ec:   	sta	%f11, [%i1]0x80
	.word	0xe408791c	! t0_kref+0x4f0:   	ldub	[%g1 - 0x6e4], %l2
	.word	0xa41ca00c	! t0_kref+0x4f4:   	xor	%l2, 0xc, %l2
	.word	0xe428791c	! t0_kref+0x4f8:   	stb	%l2, [%g1 - 0x6e4]
	.word	0x81d8791c	! t0_kref+0x4fc:   	flush	%g1 - 0x6e4
2:	.word	0xae12e73c	! t0_kref+0x500:   	or	%o3, 0x73c, %l7
	.word	0xa7400000	! t0_kref+0x504:   	mov	%y, %l3
	.word	0x9da01048	! t0_kref+0x508:   	fdtox	%f8, %f14
	.word	0xb7a4c82f	! t0_kref+0x50c:   	fadds	%f19, %f15, %f27
	.word	0xa6d6800b	! t0_kref+0x510:   	umulcc	%i2, %o3, %l3
	.word	0x9ad37d25	! t0_kref+0x514:   	umulcc	%o5, -0x2db, %o5
	.word	0x90b6c00c	! t0_kref+0x518:   	orncc	%i3, %o4, %o0
	.word	0x83a3c938	! t0_kref+0x51c:   	fmuls	%f15, %f24, %f1
	.word	0xf7ee501d	! t0_kref+0x520:   	prefetcha	%i1 + %i5, 27
	.word	0x9267001a	! t0_kref+0x524:   	subc	%i4, %i2, %o1
	.word	0xc320a014	! t0_kref+0x528:   	st	%f1, [%g2 + 0x14]
	.word	0x99a08832	! t0_kref+0x52c:   	fadds	%f2, %f18, %f12
	.word	0x95a049ad	! t0_kref+0x530:   	fdivs	%f1, %f13, %f10
	.word	0x9de3bfa0	! t0_kref+0x534:   	save	%sp, -0x60, %sp
	.word	0xafee801b	! t0_kref+0x538:   	restore	%i2, %i3, %l7
	.word	0xf420a028	! t0_kref+0x53c:   	st	%i2, [%g2 + 0x28]
	.word	0xafa00523	! t0_kref+0x540:   	fsqrts	%f3, %f23
	.word	0x9de3bfa0	! t0_kref+0x544:   	save	%sp, -0x60, %sp
	.word	0x9fe8001b	! t0_kref+0x548:   	restore	%g0, %i3, %o7
	.word	0x9de3bfa0	! t0_kref+0x54c:   	save	%sp, -0x60, %sp
	.word	0xb88e7973	! t0_kref+0x550:   	andcc	%i1, -0x68d, %i4
	.word	0x91ee001c	! t0_kref+0x554:   	restore	%i0, %i4, %o0
	.word	0x9da6c92d	! t0_kref+0x558:   	fmuls	%f27, %f13, %f14
	.word	0x8ba0002c	! t0_kref+0x55c:   	fmovs	%f12, %f5
	.word	0xae070009	! t0_kref+0x560:   	add	%i4, %o1, %l7
	.word	0xada6c936	! t0_kref+0x564:   	fmuls	%f27, %f22, %f22
	.word	0xd850a01a	! t0_kref+0x568:   	ldsh	[%g2 + 0x1a], %o4
	.word	0xd41e3fe8	! t0_kref+0x56c:   	ldd	[%i0 - 0x18], %o2
	.word	0xde08a03c	! t0_kref+0x570:   	ldub	[%g2 + 0x3c], %o7
	call	SYM(t0_subr3)
	.word	0x99a2483b	! t0_kref+0x578:   	fadds	%f9, %f27, %f12
	.word	0x9ba00034	! t0_kref+0x57c:   	fmovs	%f20, %f13
	.word	0x95a2cd3a	! t0_kref+0x580:   	fsmuld	%f11, %f26, %f10
	.word	0xd426600c	! t0_kref+0x584:   	st	%o2, [%i1 + 0xc]
	.word	0x8da50946	! t0_kref+0x588:   	fmuld	%f20, %f6, %f6
	.word	0x96622a4b	! t0_kref+0x58c:   	subc	%o0, 0xa4b, %o3
	.word	0x9e22f227	! t0_kref+0x590:   	sub	%o3, -0xdd9, %o7
	.word	0xb4103fe8	! t0_kref+0x594:   	mov	0xffffffe8, %i2
	.word	0x38480006	! t0_kref+0x598:   	bgu,a,pt	%icc, _kref+0x5b0
	.word	0xa863000d	! t0_kref+0x59c:   	subc	%o4, %o5, %l4
	.word	0x9a26c00a	! t0_kref+0x5a0:   	sub	%i3, %o2, %o5
	.word	0xcd20a00c	! t0_kref+0x5a4:   	st	%f6, [%g2 + 0xc]
	.word	0x20800001	! t0_kref+0x5a8:   	bn,a	_kref+0x5ac
	.word	0x9ac68017	! t0_kref+0x5ac:   	addccc	%i2, %l7, %o5
	.word	0x26800001	! t0_kref+0x5b0:   	bl,a	_kref+0x5b4
	.word	0x965b000a	! t0_kref+0x5b4:   	smul	%o4, %o2, %o3
	.word	0xa84260a7	! t0_kref+0x5b8:   	addc	%o1, 0xa7, %l4
	.word	0xf828a02d	! t0_kref+0x5bc:   	stb	%i4, [%g2 + 0x2d]
	.word	0xe4087a0c	! t0_kref+0x5c0:   	ldub	[%g1 - 0x5f4], %l2
	.word	0xa41ca00c	! t0_kref+0x5c4:   	xor	%l2, 0xc, %l2
	.word	0xe4287a0c	! t0_kref+0x5c8:   	stb	%l2, [%g1 - 0x5f4]
	.word	0x81d87a0c	! t0_kref+0x5cc:   	flush	%g1 - 0x5f4
	.word	0xaf33201d	! t0_kref+0x5d0:   	srl	%o4, 0x1d, %l7
	.word	0x93a00534	! t0_kref+0x5d4:   	fsqrts	%f20, %f9
	.word	0x83a0052d	! t0_kref+0x5d8:   	fsqrts	%f13, %f1
	.word	0xe41e6000	! t0_kref+0x5dc:   	ldd	[%i1], %l2
	.word	0xe96e401d	! t0_kref+0x5e0:   	prefetch	%i1 + %i5, 20
	.word	0x8da008da	! t0_kref+0x5e4:   	fsubd	%f0, %f26, %f6
	.word	0xd22e3ff6	! t0_kref+0x5e8:   	stb	%o1, [%i0 - 0xa]
	.word	0xe84e8018	! t0_kref+0x5ec:   	ldsb	[%i2 + %i0], %l4
2:	.word	0x83a0c82b	! t0_kref+0x5f0:   	fadds	%f3, %f11, %f1
	.word	0xa7a0013a	! t0_kref+0x5f4:   	fabss	%f26, %f19
	.word	0x992f200e	! t0_kref+0x5f8:   	sll	%i4, 0xe, %o4
	.word	0x9a7a3a80	! t0_kref+0x5fc:   	sdiv	%o0, -0x580, %o5
	.word	0xc76e001c	! t0_kref+0x600:   	prefetch	%i0 + %i4, 3
	.word	0xaa18000c	! t0_kref+0x604:   	xor	%g0, %o4, %l5
	.word	0x9e5eba87	! t0_kref+0x608:   	smul	%i2, -0x579, %o7
	.word	0xd07e6018	! t0_kref+0x60c:   	swap	[%i1 + 0x18], %o0
	.word	0x9e9f001a	! t0_kref+0x610:   	xorcc	%i4, %i2, %o7
	.word	0x9043401b	! t0_kref+0x614:   	addc	%o5, %i3, %o0
	.word	0x3e480002	! t0_kref+0x618:   	bvc,a,pt	%icc, _kref+0x620
	.word	0xaa7aafb7	! t0_kref+0x61c:   	sdiv	%o2, 0xfb7, %l5
	.word	0xaa63364f	! t0_kref+0x620:   	subc	%o4, -0x9b1, %l5
	.word	0x81a00142	! t0_kref+0x624:   	fabsd	%f2, %f0
	.word	0xae60000c	! t0_kref+0x628:   	subc	%g0, %o4, %l7
	.word	0x8143c000	! t0_kref+0x62c:   	stbar
	.word	0x9898000b	! t0_kref+0x630:   	xorcc	%g0, %o3, %o4
	.word	0x2d800008	! t0_kref+0x634:   	fbg,a	_kref+0x654
	.word	0xec00a014	! t0_kref+0x638:   	ld	[%g2 + 0x14], %l6
	.word	0xefee501c	! t0_kref+0x63c:   	prefetcha	%i1 + %i4, 23
	.word	0xe600a02c	! t0_kref+0x640:   	ld	[%g2 + 0x2c], %l3
	.word	0xaa7ef112	! t0_kref+0x644:   	sdiv	%i3, -0xeee, %l5
	.word	0x96034008	! t0_kref+0x648:   	add	%o5, %o0, %o3
	.word	0x9a3ec01b	! t0_kref+0x64c:   	xnor	%i3, %i3, %o5
	.word	0xec166010	! t0_kref+0x650:   	lduh	[%i1 + 0x10], %l6
	.word	0x81ae8a48	! t0_kref+0x654:   	fcmpd	%fcc0, %f26, %f8
	.word	0xe81e7fe0	! t0_kref+0x658:   	ldd	[%i1 - 0x20], %l4
	.word	0xd500a014	! t0_kref+0x65c:   	ld	[%g2 + 0x14], %f10
	.word	0xa647000b	! t0_kref+0x660:   	addc	%i4, %o3, %l3
	.word	0xa63f0008	! t0_kref+0x664:   	xnor	%i4, %o0, %l3
	sethi	%hi(2f), %o7
	.word	0xe40be27c	! t0_kref+0x66c:   	ldub	[%o7 + 0x27c], %l2
	.word	0xa41ca00c	! t0_kref+0x670:   	xor	%l2, 0xc, %l2
	.word	0xe42be27c	! t0_kref+0x674:   	stb	%l2, [%o7 + 0x27c]
	.word	0x81dbe27c	! t0_kref+0x678:   	flush	%o7 + 0x27c
2:	.word	0xa61aa8db	! t0_kref+0x67c:   	xor	%o2, 0x8db, %l3
	.word	0x86102003	! t0_kref+0x680:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x684:   	bne,a	_kref+0x684
	.word	0x86a0e001	! t0_kref+0x688:   	subcc	%g3, 1, %g3
	call	SYM(t0_subr0)
	.word	0x91a00128	! t0_kref+0x690:   	fabss	%f8, %f8
	.word	0x91a488ce	! t0_kref+0x694:   	fsubd	%f18, %f14, %f8
	.word	0xa645ed33	! t0_kref+0x698:   	addc	%l7, 0xd33, %l3
	.word	0xd610a03e	! t0_kref+0x69c:   	lduh	[%g2 + 0x3e], %o3
	.word	0xda50a02e	! t0_kref+0x6a0:   	ldsh	[%g2 + 0x2e], %o5
	.word	0xf53e001d	! t0_kref+0x6a4:   	std	%f26, [%i0 + %i5]
	.word	0x9842f30c	! t0_kref+0x6a8:   	addc	%o3, -0xcf4, %o4
	.word	0x32800005	! t0_kref+0x6ac:   	bne,a	_kref+0x6c0
	.word	0x8ba249ad	! t0_kref+0x6b0:   	fdivs	%f9, %f13, %f5
	.word	0x9ba00525	! t0_kref+0x6b4:   	fsqrts	%f5, %f13
	.word	0xaba189a0	! t0_kref+0x6b8:   	fdivs	%f6, %f0, %f21
	.word	0xaba488b0	! t0_kref+0x6bc:   	fsubs	%f18, %f16, %f21
	.word	0x271497a6	! t0_kref+0x6c0:   	sethi	%hi(0x525e9800), %l3
	.word	0x3f480007	! t0_kref+0x6c4:   	fbo,a,pt	%fcc0, _kref+0x6e0
	.word	0x983b675b	! t0_kref+0x6c8:   	xnor	%o5, 0x75b, %o4
	.word	0x38800001	! t0_kref+0x6cc:   	bgu,a	_kref+0x6d0
	.word	0xe6100019	! t0_kref+0x6d0:   	lduh	[%g0 + %i1], %l3
	.word	0xae1eb917	! t0_kref+0x6d4:   	xor	%i2, -0x6e9, %l7
	.word	0xafa00537	! t0_kref+0x6d8:   	fsqrts	%f23, %f23
	.word	0xb6102004	! t0_kref+0x6dc:   	mov	0x4, %i3
	.word	0x30800003	! t0_kref+0x6e0:   	ba,a	_kref+0x6ec
	.word	0xa3a189a2	! t0_kref+0x6e4:   	fdivs	%f6, %f2, %f17
	.word	0xd700a024	! t0_kref+0x6e8:   	ld	[%g2 + 0x24], %f11
	.word	0xec1e2018	! t0_kref+0x6ec:   	ldd	[%i0 + 0x18], %l6
	.word	0xada00030	! t0_kref+0x6f0:   	fmovs	%f16, %f22
	.word	0x2b480004	! t0_kref+0x6f4:   	fbug,a,pt	%fcc0, _kref+0x704
	.word	0x9e56c000	! t0_kref+0x6f8:   	umul	%i3, %g0, %o7
	.word	0xe850a038	! t0_kref+0x6fc:   	ldsh	[%g2 + 0x38], %l4
	.word	0x81ac0a4a	! t0_kref+0x700:   	fcmpd	%fcc0, %f16, %f10
	.word	0x9612e155	! t0_kref+0x704:   	or	%o3, 0x155, %o3
	.word	0x81ddf69c	! t0_kref+0x708:   	flush	%l7 - 0x964
	.word	0x81a90a46	! t0_kref+0x70c:   	fcmpd	%fcc0, %f4, %f6
	.word	0xc807bfec	! t0_kref+0x710:   	ld	[%fp - 0x14], %g4
	.word	0x23800007	! t0_kref+0x714:   	fbne,a	_kref+0x730
	.word	0x81dec00a	! t0_kref+0x718:   	flush	%i3 + %o2
	.word	0xa3a000a2	! t0_kref+0x71c:   	fnegs	%f2, %f17
	.word	0x93400000	! t0_kref+0x720:   	mov	%y, %o1
	.word	0xda263fe8	! t0_kref+0x724:   	st	%o5, [%i0 - 0x18]
	.word	0x9e433d9a	! t0_kref+0x728:   	addc	%o4, -0x266, %o7
	.word	0x8fa0003a	! t0_kref+0x72c:   	fmovs	%f26, %f7
	.word	0xa85ac01b	! t0_kref+0x730:   	smul	%o3, %i3, %l4
	.word	0x97703e5d	! t0_kref+0x734:   	popc	-0x1a3, %o3
	.word	0x86102004	! t0_kref+0x738:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x73c:   	bne,a	_kref+0x73c
	.word	0x86a0e001	! t0_kref+0x740:   	subcc	%g3, 1, %g3
	.word	0x94028000	! t0_kref+0x744:   	add	%o2, %g0, %o2
	.word	0xe8ce9019	! t0_kref+0x748:   	ldsba	[%i2 + %i1]0x80, %l4
	.word	0x81aa4ab4	! t0_kref+0x74c:   	fcmpes	%fcc0, %f9, %f20
	.word	0x943ef6cf	! t0_kref+0x750:   	xnor	%i3, -0x931, %o2
	.word	0xee364000	! t0_kref+0x754:   	sth	%l7, [%i1]
	.word	0xacb30009	! t0_kref+0x758:   	orncc	%o4, %o1, %l6
	.word	0x92224008	! t0_kref+0x75c:   	sub	%o1, %o0, %o1
	.word	0xe4087b9c	! t0_kref+0x760:   	ldub	[%g1 - 0x464], %l2
	.word	0xa41ca00c	! t0_kref+0x764:   	xor	%l2, 0xc, %l2
	.word	0xe4287b9c	! t0_kref+0x768:   	stb	%l2, [%g1 - 0x464]
	.word	0x81d87b9c	! t0_kref+0x76c:   	flush	%g1 - 0x464
	.word	0xa1a00521	! t0_kref+0x770:   	fsqrts	%f1, %f16
	.word	0xaf703b41	! t0_kref+0x774:   	popc	-0x4bf, %l7
	.word	0xa625c01a	! t0_kref+0x778:   	sub	%l7, %i2, %l3
	.word	0x96c72502	! t0_kref+0x77c:   	addccc	%i4, 0x502, %o3
2:	.word	0xe078a000	! t0_kref+0x780:   	swap	[%g2], %l0
	.word	0x93a00127	! t0_kref+0x784:   	fabss	%f7, %f9
	.word	0xde160000	! t0_kref+0x788:   	lduh	[%i0], %o7
	.word	0xab0eeb3c	! t0_kref+0x78c:   	tsubcc	%i3, 0xb3c, %l5
	.word	0xd420a030	! t0_kref+0x790:   	st	%o2, [%g2 + 0x30]
	.word	0x85a00020	! t0_kref+0x794:   	fmovs	%f0, %f2
	.word	0x93a28935	! t0_kref+0x798:   	fmuls	%f10, %f21, %f9
	.word	0xd2266004	! t0_kref+0x79c:   	st	%o1, [%i1 + 4]
	.word	0x99a01054	! t0_kref+0x7a0:   	fdtox	%f20, %f12
	.word	0xec50a018	! t0_kref+0x7a4:   	ldsh	[%g2 + 0x18], %l6
	.word	0x92200009	! t0_kref+0x7a8:   	neg	%o1
	.word	0xde48a000	! t0_kref+0x7ac:   	ldsb	[%g2], %o7
	.word	0x81a88ab9	! t0_kref+0x7b0:   	fcmpes	%fcc0, %f2, %f25
	.word	0xac926d2e	! t0_kref+0x7b4:   	orcc	%o1, 0xd2e, %l6
	.word	0x8ba00524	! t0_kref+0x7b8:   	fsqrts	%f4, %f5
	.word	0xebee101c	! t0_kref+0x7bc:   	prefetcha	%i0 + %i4, 21
	.word	0xacaa7e3d	! t0_kref+0x7c0:   	andncc	%o1, -0x1c3, %l6
	.word	0xe6fe101c	! t0_kref+0x7c4:   	swapa	[%i0 + %i4]0x80, %l3
	.word	0xa1a488cc	! t0_kref+0x7c8:   	fsubd	%f18, %f12, %f16
	.word	0x9aa224eb	! t0_kref+0x7cc:   	subcc	%o0, 0x4eb, %o5
	.word	0x97a01899	! t0_kref+0x7d0:   	fitos	%f25, %f11
	.word	0x965dc01b	! t0_kref+0x7d4:   	smul	%l7, %i3, %o3
	.word	0xd44e001a	! t0_kref+0x7d8:   	ldsb	[%i0 + %i2], %o2
	.word	0xec1e0000	! t0_kref+0x7dc:   	ldd	[%i0], %l6
	.word	0x9fa01899	! t0_kref+0x7e0:   	fitos	%f25, %f15
	.word	0x942e8009	! t0_kref+0x7e4:   	andn	%i2, %o1, %o2
	.word	0x9e780017	! t0_kref+0x7e8:   	sdiv	%g0, %l7, %o7
	.word	0x81a6c926	! t0_kref+0x7ec:   	fmuls	%f27, %f6, %f0
	.word	0x35480004	! t0_kref+0x7f0:   	fbue,a,pt	%fcc0, _kref+0x800
	.word	0x81a00126	! t0_kref+0x7f4:   	fabss	%f6, %f0
	.word	0x20800001	! t0_kref+0x7f8:   	bn,a	_kref+0x7fc
	.word	0x900ac00a	! t0_kref+0x7fc:   	and	%o3, %o2, %o0
	.word	0x9ec32a28	! t0_kref+0x800:   	addccc	%o4, 0xa28, %o7
	.word	0xc1be185b	! t0_kref+0x804:   	stda	%f0, [%i0 + %i3]0xc2
	.word	0xee270018	! t0_kref+0x808:   	st	%l7, [%i4 + %i0]
	.word	0x91664008	! t0_kref+0x80c:   	movne	%icc, %o0, %o0
	.word	0x89a01a22	! t0_kref+0x810:   	fstoi	%f2, %f4
	.word	0x2d800008	! t0_kref+0x814:   	fbg,a	_kref+0x834
	.word	0x9ba00038	! t0_kref+0x818:   	fmovs	%f24, %f13
	.word	0x9046c01b	! t0_kref+0x81c:   	addc	%i3, %i3, %o0
	.word	0xc11fbca0	! t0_kref+0x820:   	ldd	[%fp - 0x360], %f0
	.word	0x9fa01884	! t0_kref+0x824:   	fitos	%f4, %f15
	.word	0x93a01897	! t0_kref+0x828:   	fitos	%f23, %f9
	.word	0x8585f889	! t0_kref+0x82c:   	wr	%l7, 0xfffff889, %ccr
	.word	0xd2801019	! t0_kref+0x830:   	lda	[%g0 + %i1]0x80, %o1
	.word	0x001fffff	! t0_kref+0x834:   	illtrap	0x1fffff
	.word	0xd91e3ff0	! t0_kref+0x838:   	ldd	[%i0 - 0x10], %f12
	.word	0x9fa01883	! t0_kref+0x83c:   	fitos	%f3, %f15
	.word	0x3e480003	! t0_kref+0x840:   	bvc,a,pt	%icc, _kref+0x84c
	.word	0xc5260000	! t0_kref+0x844:   	st	%f2, [%i0]
	.word	0xc0ff1018	! t0_kref+0x848:   	swapa	[%i4 + %i0]0x80, %g0
	.word	0x81ac0a40	! t0_kref+0x84c:   	fcmpd	%fcc0, %f16, %f0
	.word	0xaa236c3b	! t0_kref+0x850:   	sub	%o5, 0xc3b, %l5
	.word	0x81db6d72	! t0_kref+0x854:   	flush	%o5 + 0xd72
	.word	0xc398a040	! t0_kref+0x858:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xd208a023	! t0_kref+0x85c:   	ldub	[%g2 + 0x23], %o1
	.word	0x29008f19	! t0_kref+0x860:   	sethi	%hi(0x23c6400), %l4
	.word	0x92b26a50	! t0_kref+0x864:   	orncc	%o1, 0xa50, %o1
	.word	0x89a1cd2d	! t0_kref+0x868:   	fsmuld	%f7, %f13, %f4
	.word	0x31800007	! t0_kref+0x86c:   	fba,a	_kref+0x888
	.word	0xc11fbcc0	! t0_kref+0x870:   	ldd	[%fp - 0x340], %f0
	.word	0xcd1fbce8	! t0_kref+0x874:   	ldd	[%fp - 0x318], %f6
	.word	0xc51fbd30	! t0_kref+0x878:   	ldd	[%fp - 0x2d0], %f2
	.word	0x81adca38	! t0_kref+0x87c:   	fcmps	%fcc0, %f23, %f24
	.word	0x81a149a7	! t0_kref+0x880:   	fdivs	%f5, %f7, %f0
	.word	0xafa01a4e	! t0_kref+0x884:   	fdtoi	%f14, %f23
	.word	0xa9a00526	! t0_kref+0x888:   	fsqrts	%f6, %f20
	call	SYM(t0_subr0)
	.word	0xda2e7fef	! t0_kref+0x890:   	stb	%o5, [%i1 - 0x11]
	.word	0xa85a0017	! t0_kref+0x894:   	smul	%o0, %l7, %l4
	.word	0x3f480008	! t0_kref+0x898:   	fbo,a,pt	%fcc0, _kref+0x8b8
	.word	0xd4262000	! t0_kref+0x89c:   	st	%o2, [%i0]
	.word	0xaeb2a63a	! t0_kref+0x8a0:   	orncc	%o2, 0x63a, %l7
	.word	0x8143c000	! t0_kref+0x8a4:   	stbar
	.word	0xa9a3894c	! t0_kref+0x8a8:   	fmuld	%f14, %f12, %f20
	.word	0x94528000	! t0_kref+0x8ac:   	umul	%o2, %g0, %o2
	call	SYM(t0_subr2)
	.word	0xe1be5a1a	! t0_kref+0x8b4:   	stda	%f16, [%i1 + %i2]0xd0
	.word	0xe9ee501b	! t0_kref+0x8b8:   	prefetcha	%i1 + %i3, 20
	call	SYM(t0_subr1)
	.word	0xe9bf1a19	! t0_kref+0x8c0:   	stda	%f20, [%i4 + %i1]0xd0
	.word	0xa61ec00d	! t0_kref+0x8c4:   	xor	%i3, %o5, %l3
	.word	0xa69b6866	! t0_kref+0x8c8:   	xorcc	%o5, 0x866, %l3
	.word	0xaaa2e819	! t0_kref+0x8cc:   	subcc	%o3, 0x819, %l5
	.word	0xee10a03c	! t0_kref+0x8d0:   	lduh	[%g2 + 0x3c], %l7
	.word	0xae13001b	! t0_kref+0x8d4:   	or	%o4, %i3, %l7
	.word	0xd830a000	! t0_kref+0x8d8:   	sth	%o4, [%g2]
	.word	0xac5b7717	! t0_kref+0x8dc:   	smul	%o5, -0x8e9, %l6
	.word	0xa6230009	! t0_kref+0x8e0:   	sub	%o4, %o1, %l3
	.word	0x8143e003	! t0_kref+0x8e4:   	membar	0x3
	.word	0x28800003	! t0_kref+0x8e8:   	bleu,a	_kref+0x8f4
	.word	0xc76e7ff0	! t0_kref+0x8ec:   	prefetch	%i1 - 0x10, 3
	.word	0xd700a008	! t0_kref+0x8f0:   	ld	[%g2 + 8], %f11
	.word	0x9ba01892	! t0_kref+0x8f4:   	fitos	%f18, %f13
	.word	0x90e2401b	! t0_kref+0x8f8:   	subccc	%o1, %i3, %o0
	.word	0xae226d35	! t0_kref+0x8fc:   	sub	%o1, 0xd35, %l7
	.word	0x944724e7	! t0_kref+0x900:   	addc	%i4, 0x4e7, %o2
	.word	0x9a5269b9	! t0_kref+0x904:   	umul	%o1, 0x9b9, %o5
	.word	0xdb266000	! t0_kref+0x908:   	st	%f13, [%i1]
	.word	0xa842800a	! t0_kref+0x90c:   	addc	%o2, %o2, %l4
	.word	0x92632e89	! t0_kref+0x910:   	subc	%o4, 0xe89, %o1
	.word	0x86102020	! t0_kref+0x914:   	mov	0x20, %g3
	.word	0x86a0e001	! t0_kref+0x918:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x91c:   	be,a	_kref+0x948
	.word	0xada10956	! t0_kref+0x920:   	fmuld	%f4, %f22, %f22
	.word	0xa1a000ca	! t0_kref+0x924:   	fnegd	%f10, %f16
	.word	0xe9be184d	! t0_kref+0x928:   	stda	%f20, [%i0 + %o5]0xc2
	.word	0xacd2c00c	! t0_kref+0x92c:   	umulcc	%o3, %o4, %l6
	.word	0xaf2b000a	! t0_kref+0x930:   	sll	%o4, %o2, %l7
	.word	0x91a24822	! t0_kref+0x934:   	fadds	%f9, %f2, %f8
	.word	0x89a1882f	! t0_kref+0x938:   	fadds	%f6, %f15, %f4
	.word	0xc807bfec	! t0_kref+0x93c:   	ld	[%fp - 0x14], %g4
	.word	0xd720a028	! t0_kref+0x940:   	st	%f11, [%g2 + 0x28]
	.word	0xb7a0053a	! t0_kref+0x944:   	fsqrts	%f26, %f27
	.word	0x986260f4	! t0_kref+0x948:   	subc	%o1, 0xf4, %o4
	.word	0x92f6c01b	! t0_kref+0x94c:   	udivcc	%i3, %i3, %o1
	.word	0xf430a03a	! t0_kref+0x950:   	sth	%i2, [%g2 + 0x3a]
	.word	0xda50a038	! t0_kref+0x954:   	ldsh	[%g2 + 0x38], %o5
	.word	0xaa3f3b16	! t0_kref+0x958:   	xnor	%i4, -0x4ea, %l5
	.word	0x90873f9a	! t0_kref+0x95c:   	addcc	%i4, -0x66, %o0
	.word	0xf96e001a	! t0_kref+0x960:   	prefetch	%i0 + %i2, 28
	.word	0x9422400c	! t0_kref+0x964:   	sub	%o1, %o4, %o2
	.word	0x91372002	! t0_kref+0x968:   	srl	%i4, 0x2, %o0
	.word	0x9a55c00b	! t0_kref+0x96c:   	umul	%l7, %o3, %o5
	.word	0x92122874	! t0_kref+0x970:   	or	%o0, 0x874, %o1
	.word	0x9e3b400b	! t0_kref+0x974:   	xnor	%o5, %o3, %o7
	.word	0xf62e001a	! t0_kref+0x978:   	stb	%i3, [%i0 + %i2]
	.word	0x933a6000	! t0_kref+0x97c:   	sra	%o1, 0x0, %o1
	.word	0xb1a00033	! t0_kref+0x980:   	fmovs	%f19, %f24
	.word	0xac92ab64	! t0_kref+0x984:   	orcc	%o2, 0xb64, %l6
	.word	0xaa62801a	! t0_kref+0x988:   	subc	%o2, %i2, %l5
	.word	0x3f480007	! t0_kref+0x98c:   	fbo,a,pt	%fcc0, _kref+0x9a8
	.word	0x9022000d	! t0_kref+0x990:   	sub	%o0, %o5, %o0
	.word	0x9856c00b	! t0_kref+0x994:   	umul	%i3, %o3, %o4
	.word	0xea4e4000	! t0_kref+0x998:   	ldsb	[%i1], %l5
	call	SYM(t0_subr0)
	.word	0xa0a2001b	! t0_kref+0x9a0:   	subcc	%o0, %i3, %l0
	.word	0xd0861000	! t0_kref+0x9a4:   	lda	[%i0]0x80, %o0
	.word	0xa802801b	! t0_kref+0x9a8:   	add	%o2, %i3, %l4
	.word	0x98b5e490	! t0_kref+0x9ac:   	orncc	%l7, 0x490, %o4
	.word	0x81aa0ab9	! t0_kref+0x9b0:   	fcmpes	%fcc0, %f8, %f25
	.word	0x9006c009	! t0_kref+0x9b4:   	add	%i3, %o1, %o0
	.word	0x8fa249b9	! t0_kref+0x9b8:   	fdivs	%f9, %f25, %f7
	.word	0xd4480019	! t0_kref+0x9bc:   	ldsb	[%g0 + %i1], %o2
	.word	0xb1a5c93b	! t0_kref+0x9c0:   	fmuls	%f23, %f27, %f24
	.word	0xba103fe8	! t0_kref+0x9c4:   	mov	0xffffffe8, %i5
	.word	0x8fa00535	! t0_kref+0x9c8:   	fsqrts	%f21, %f7
	.word	0xea48a02d	! t0_kref+0x9cc:   	ldsb	[%g2 + 0x2d], %l5
	.word	0xafa00124	! t0_kref+0x9d0:   	fabss	%f4, %f23
	.word	0xd7a61000	! t0_kref+0x9d4:   	sta	%f11, [%i0]0x80
	.word	0x81aa0a56	! t0_kref+0x9d8:   	fcmpd	%fcc0, %f8, %f22
	.word	0x97a000a8	! t0_kref+0x9dc:   	fnegs	%f8, %f11
	.word	0xa6434008	! t0_kref+0x9e0:   	addc	%o5, %o0, %l3
	.word	0x96602770	! t0_kref+0x9e4:   	subc	%g0, 0x770, %o3
	.word	0x81dd8019	! t0_kref+0x9e8:   	flush	%l6 + %i1
	.word	0x89a01939	! t0_kref+0x9ec:   	fstod	%f25, %f4
	.word	0xaba000a2	! t0_kref+0x9f0:   	fnegs	%f2, %f21
	.word	0x98b27d32	! t0_kref+0x9f4:   	orncc	%o1, -0x2ce, %o4
	.word	0x949e801c	! t0_kref+0x9f8:   	xorcc	%i2, %i4, %o2
	.word	0x29480002	! t0_kref+0x9fc:   	fbl,a,pt	%fcc0, _kref+0xa04
	.word	0x98e3400b	! t0_kref+0xa00:   	subccc	%o5, %o3, %o4
	.word	0x87a01a3b	! t0_kref+0xa04:   	fstoi	%f27, %f3
	.word	0xc900a034	! t0_kref+0xa08:   	ld	[%g2 + 0x34], %f4
	.word	0xe900a004	! t0_kref+0xa0c:   	ld	[%g2 + 4], %f20
	.word	0xa7a00536	! t0_kref+0xa10:   	fsqrts	%f22, %f19
	.word	0x23800007	! t0_kref+0xa14:   	fbne,a	_kref+0xa30
	.word	0xae922391	! t0_kref+0xa18:   	orcc	%o0, 0x391, %l7
	.word	0xa9324009	! t0_kref+0xa1c:   	srl	%o1, %o1, %l4
	.word	0xae96fb34	! t0_kref+0xa20:   	orcc	%i3, -0x4cc, %l7
	.word	0xd500a030	! t0_kref+0xa24:   	ld	[%g2 + 0x30], %f10
	.word	0x9a8b400d	! t0_kref+0xa28:   	andcc	%o5, %o5, %o5
	.word	0xd0200019	! t0_kref+0xa2c:   	st	%o0, [%g0 + %i1]
	.word	0xd700a024	! t0_kref+0xa30:   	ld	[%g2 + 0x24], %f11
	.word	0x99a01924	! t0_kref+0xa34:   	fstod	%f4, %f12
	.word	0xd120a000	! t0_kref+0xa38:   	st	%f8, [%g2]
	.word	0xacd6b5c9	! t0_kref+0xa3c:   	umulcc	%i2, -0xa37, %l6
	.word	0xa6700008	! t0_kref+0xa40:   	udiv	%g0, %o0, %l3
	.word	0x8da00127	! t0_kref+0xa44:   	fabss	%f7, %f6
	.word	0x928b62b8	! t0_kref+0xa48:   	andcc	%o5, 0x2b8, %o1
	.word	0x90068000	! t0_kref+0xa4c:   	add	%i2, %g0, %o0
	.word	0x27800002	! t0_kref+0xa50:   	fbul,a	_kref+0xa58
	.word	0xd2c81018	! t0_kref+0xa54:   	ldsba	[%g0 + %i0]0x80, %o1
	.word	0xda564000	! t0_kref+0xa58:   	ldsh	[%i1], %o5
	.word	0xed20a020	! t0_kref+0xa5c:   	st	%f22, [%g2 + 0x20]
	.word	0x3f800002	! t0_kref+0xa60:   	fbo,a	_kref+0xa68
	.word	0x94f00009	! t0_kref+0xa64:   	udivcc	%g0, %o1, %o2
	.word	0x86102003	! t0_kref+0xa68:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0xa6c:   	bne,a	_kref+0xa6c
	.word	0x86a0e001	! t0_kref+0xa70:   	subcc	%g3, 1, %g3
	.word	0x9ba0012a	! t0_kref+0xa74:   	fabss	%f10, %f13
	.word	0xa6120008	! t0_kref+0xa78:   	or	%o0, %o0, %l3
	.word	0xc11fbfa0	! t0_kref+0xa7c:   	ldd	[%fp - 0x60], %f0
	.word	0xe3b8a080	! t0_kref+0xa80:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x2f800001	! t0_kref+0xa84:   	fbu,a	_kref+0xa88
	.word	0xb1a008c2	! t0_kref+0xa88:   	fsubd	%f0, %f2, %f24
	.word	0x99a0192f	! t0_kref+0xa8c:   	fstod	%f15, %f12
	call	SYM(t0_subr1)
	.word	0xb1a6c8b2	! t0_kref+0xa94:   	fsubs	%f27, %f18, %f24
	.word	0xc1263fec	! t0_kref+0xa98:   	st	%f0, [%i0 - 0x14]
	.word	0xaa726a5c	! t0_kref+0xa9c:   	udiv	%o1, 0xa5c, %l5
	.word	0xd03f4019	! t0_kref+0xaa0:   	std	%o0, [%i5 + %i1]
	.word	0x81a98a2c	! t0_kref+0xaa4:   	fcmps	%fcc0, %f6, %f12
	.word	0xb3a018da	! t0_kref+0xaa8:   	fdtos	%f26, %f25
	.word	0x9062a28f	! t0_kref+0xaac:   	subc	%o2, 0x28f, %o0
	.word	0xb7a00131	! t0_kref+0xab0:   	fabss	%f17, %f27
	.word	0x9a3e801b	! t0_kref+0xab4:   	xnor	%i2, %i3, %o5
	.word	0xd43e3ff0	! t0_kref+0xab8:   	std	%o2, [%i0 - 0x10]
	.word	0x89a000ae	! t0_kref+0xabc:   	fnegs	%f14, %f4
	.word	0x99400000	! t0_kref+0xac0:   	mov	%y, %o4
	.word	0x90b727ed	! t0_kref+0xac4:   	orncc	%i4, 0x7ed, %o0
	.word	0xe89e1000	! t0_kref+0xac8:   	ldda	[%i0]0x80, %l4
	.word	0x99a489d2	! t0_kref+0xacc:   	fdivd	%f18, %f18, %f12
	.word	0xa6b735a8	! t0_kref+0xad0:   	orncc	%i4, -0xa58, %l3
	.word	0xd840a030	! t0_kref+0xad4:   	ldsw	[%g2 + 0x30], %o4
	.word	0x98b03755	! t0_kref+0xad8:   	orncc	%g0, -0x8ab, %o4
	.word	0x293de0cb	! t0_kref+0xadc:   	sethi	%hi(0xf7832c00), %l4
	.word	0xd41e6010	! t0_kref+0xae0:   	ldd	[%i1 + 0x10], %o2
	.word	0x9ad7000b	! t0_kref+0xae4:   	umulcc	%i4, %o3, %o5
	.word	0xa9a10956	! t0_kref+0xae8:   	fmuld	%f4, %f22, %f20
	.word	0xd020a008	! t0_kref+0xaec:   	st	%o0, [%g2 + 8]
	.word	0xde48a018	! t0_kref+0xaf0:   	ldsb	[%g2 + 0x18], %o7
	.word	0x90427310	! t0_kref+0xaf4:   	addc	%o1, -0xcf0, %o0
	.word	0x9206800c	! t0_kref+0xaf8:   	add	%i2, %o4, %o1
	.word	0xae926c40	! t0_kref+0xafc:   	orcc	%o1, 0xc40, %l7
	.word	0xa85361cd	! t0_kref+0xb00:   	umul	%o5, 0x1cd, %l4
	.word	0x94fa6825	! t0_kref+0xb04:   	sdivcc	%o1, 0x825, %o2
	.word	0xd06e2009	! t0_kref+0xb08:   	ldstub	[%i0 + 9], %o0
	.word	0x8143e022	! t0_kref+0xb0c:   	membar	0x22
	.word	0x81a94ab8	! t0_kref+0xb10:   	fcmpes	%fcc0, %f5, %f24
	.word	0xaa8a7a1a	! t0_kref+0xb14:   	andcc	%o1, -0x5e6, %l5
	.word	0x89a589bb	! t0_kref+0xb18:   	fdivs	%f22, %f27, %f4
	.word	0xc398a040	! t0_kref+0xb1c:   	ldda	[%g2 + 0x40]%asi, %f32
	.word	0xaa932b70	! t0_kref+0xb20:   	orcc	%o4, 0xb70, %l5
	.word	0x9e007f44	! t0_kref+0xb24:   	add	%g1, -0xbc, %o7
!	.word	0x24bd2d30	! t0_kref+0xb28:   	ble,a	SYM(t0_subr3)
	   	ble,a	SYM(t0_subr3)
	.word	0x9627001b	! t0_kref+0xb2c:   	sub	%i4, %i3, %o3
	.word	0x97400000	! t0_kref+0xb30:   	mov	%y, %o3
	.word	0x9a65ee5e	! t0_kref+0xb34:   	subc	%l7, 0xe5e, %o5
	.word	0x85a01058	! t0_kref+0xb38:   	fdtox	%f24, %f2
	.word	0xae36f267	! t0_kref+0xb3c:   	orn	%i3, -0xd99, %l7
	.word	0x2c800003	! t0_kref+0xb40:   	bneg,a	_kref+0xb4c
	.word	0xa6b738e3	! t0_kref+0xb44:   	orncc	%i4, -0x71d, %l3
	.word	0xb1a608c6	! t0_kref+0xb48:   	fsubd	%f24, %f6, %f24
	.word	0xe3b8a080	! t0_kref+0xb4c:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xee10a020	! t0_kref+0xb50:   	lduh	[%g2 + 0x20], %l7
	.word	0xa68af469	! t0_kref+0xb54:   	andcc	%o3, -0xb97, %l3
	.word	0x3a800007	! t0_kref+0xb58:   	bcc,a	_kref+0xb74
	.word	0xa5a688d4	! t0_kref+0xb5c:   	fsubd	%f26, %f20, %f18
	.word	0xa6a6fc11	! t0_kref+0xb60:   	subcc	%i3, -0x3ef, %l3
	.word	0x9e5f2cef	! t0_kref+0xb64:   	smul	%i4, 0xcef, %o7
	.word	0x81aa8a21	! t0_kref+0xb68:   	fcmps	%fcc0, %f10, %f1
	.word	0xacd23802	! t0_kref+0xb6c:   	umulcc	%o0, -0x7fe, %l6
	.word	0xae62c00a	! t0_kref+0xb70:   	subc	%o3, %o2, %l7
	.word	0xd13e6018	! t0_kref+0xb74:   	std	%f8, [%i1 + 0x18]
	.word	0x973ec00b	! t0_kref+0xb78:   	sra	%i3, %o3, %o3
	.word	0x8da24d25	! t0_kref+0xb7c:   	fsmuld	%f9, %f5, %f6
	.word	0x99a30856	! t0_kref+0xb80:   	faddd	%f12, %f22, %f12
	.word	0xac936ca5	! t0_kref+0xb84:   	orcc	%o5, 0xca5, %l6
	.word	0x81a01887	! t0_kref+0xb88:   	fitos	%f7, %f0
	.word	0xb5a34d38	! t0_kref+0xb8c:   	fsmuld	%f13, %f24, %f26
	.word	0x81de0018	! t0_kref+0xb90:   	flush	%i0 + %i0
	.word	0x33480002	! t0_kref+0xb94:   	fbe,a,pt	%fcc0, _kref+0xb9c
	.word	0x98c6bd5e	! t0_kref+0xb98:   	addccc	%i2, -0x2a2, %o4
	.word	0x972ec017	! t0_kref+0xb9c:   	sll	%i3, %l7, %o3
	.word	0xacda6403	! t0_kref+0xba0:   	smulcc	%o1, 0x403, %l6
	.word	0xc900a03c	! t0_kref+0xba4:   	ld	[%g2 + 0x3c], %f4
	.word	0x9fc10000	! t0_kref+0xba8:   	call	%g4
	.word	0xd0200018	! t0_kref+0xbac:   	st	%o0, [%g0 + %i0]
	.word	0x95a008c6	! t0_kref+0xbb0:   	fsubd	%f0, %f6, %f10
	.word	0x81d927cb	! t0_kref+0xbb4:   	flush	%g4 + 0x7cb
	.word	0x36480001	! t0_kref+0xbb8:   	bge,a,pt	%icc, _kref+0xbbc
	.word	0x9ee3250e	! t0_kref+0xbbc:   	subccc	%o4, 0x50e, %o7
	.word	0xa3a3c83a	! t0_kref+0xbc0:   	fadds	%f15, %f26, %f17
	.word	0x8143c000	! t0_kref+0xbc4:   	stbar
	.word	0xe600a03c	! t0_kref+0xbc8:   	ld	[%g2 + 0x3c], %l3
	.word	0x9fa01a23	! t0_kref+0xbcc:   	fstoi	%f3, %f15
	.word	0xa6b2400b	! t0_kref+0xbd0:   	orncc	%o1, %o3, %l3
	.word	0x901275bd	! t0_kref+0xbd4:   	or	%o1, -0xa43, %o0
	.word	0x29800002	! t0_kref+0xbd8:   	fbl,a	_kref+0xbe0
	.word	0x920ec01c	! t0_kref+0xbdc:   	and	%i3, %i4, %o1
	.word	0xe408601c	! t0_kref+0xbe0:   	ldub	[%g1 + 0x1c], %l2
	.word	0xa41ca00c	! t0_kref+0xbe4:   	xor	%l2, 0xc, %l2
	.word	0xe428601c	! t0_kref+0xbe8:   	stb	%l2, [%g1 + 0x1c]
	.word	0x81d8601c	! t0_kref+0xbec:   	flush	%g1 + 0x1c
	.word	0x98b00000	! t0_kref+0xbf0:   	orncc	%g0, %g0, %o4
	.word	0xae7b2822	! t0_kref+0xbf4:   	sdiv	%o4, 0x822, %l7
	.word	0xaba60832	! t0_kref+0xbf8:   	fadds	%f24, %f18, %f21
	.word	0x9b400000	! t0_kref+0xbfc:   	mov	%y, %o5
2:	.word	0x87a28924	! t0_kref+0xc00:   	fmuls	%f10, %f4, %f3
	.word	0x9fc10000	! t0_kref+0xc04:   	call	%g4
	.word	0xd028a020	! t0_kref+0xc08:   	stb	%o0, [%g2 + 0x20]
	.word	0x27480001	! t0_kref+0xc0c:   	fbul,a,pt	%fcc0, _kref+0xc10
	.word	0x920a2513	! t0_kref+0xc10:   	and	%o0, 0x513, %o1
	.word	0x9e42000c	! t0_kref+0xc14:   	addc	%o0, %o4, %o7
	.word	0x9da018d6	! t0_kref+0xc18:   	fdtos	%f22, %f14
	.word	0xe84e8019	! t0_kref+0xc1c:   	ldsb	[%i2 + %i1], %l4
	.word	0x81a98a21	! t0_kref+0xc20:   	fcmps	%fcc0, %f6, %f1
	.word	0x99a00532	! t0_kref+0xc24:   	fsqrts	%f18, %f12
	.word	0xf19e5a5d	! t0_kref+0xc28:   	ldda	[%i1 + %i5]0xd2, %f24
	.word	0xd840a00c	! t0_kref+0xc2c:   	ldsw	[%g2 + 0xc], %o4
	.word	0xda6e001a	! t0_kref+0xc30:   	ldstub	[%i0 + %i2], %o5
	.word	0x81ad0a48	! t0_kref+0xc34:   	fcmpd	%fcc0, %f20, %f8
	.word	0xcd3e4000	! t0_kref+0xc38:   	std	%f6, [%i1]
	.word	0xda50a012	! t0_kref+0xc3c:   	ldsh	[%g2 + 0x12], %o5
	.word	0x9336c000	! t0_kref+0xc40:   	srl	%i3, %g0, %o1
	.word	0x9e05c008	! t0_kref+0xc44:   	add	%l7, %o0, %o7
	.word	0xd51fbd70	! t0_kref+0xc48:   	ldd	[%fp - 0x290], %f10
	.word	0xd03e2018	! t0_kref+0xc4c:   	std	%o0, [%i0 + 0x18]
	.word	0xe3b8a080	! t0_kref+0xc50:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x87802080	! t0_kref+0xc54:   	mov	0x80, %asi
	.word	0xe64e401a	! t0_kref+0xc58:   	ldsb	[%i1 + %i2], %l3
	.word	0x8ba1492f	! t0_kref+0xc5c:   	fmuls	%f5, %f15, %f5
	.word	0xa83a6845	! t0_kref+0xc60:   	xnor	%o1, 0x845, %l4
	.word	0x36800008	! t0_kref+0xc64:   	bge,a	_kref+0xc84
	.word	0xa67aa3ad	! t0_kref+0xc68:   	sdiv	%o2, 0x3ad, %l3
	.word	0x9ef68017	! t0_kref+0xc6c:   	udivcc	%i2, %l7, %o7
	.word	0xb3a58837	! t0_kref+0xc70:   	fadds	%f22, %f23, %f25
	.word	0x95a0053b	! t0_kref+0xc74:   	fsqrts	%f27, %f10
	.word	0x35800001	! t0_kref+0xc78:   	fbue,a	_kref+0xc7c
	.word	0xda28a00f	! t0_kref+0xc7c:   	stb	%o5, [%g2 + 0xf]
	.word	0x8da6c8b5	! t0_kref+0xc80:   	fsubs	%f27, %f21, %f6
	.word	0x9846c01b	! t0_kref+0xc84:   	addc	%i3, %i3, %o4
	.word	0xb1a089a1	! t0_kref+0xc88:   	fdivs	%f2, %f1, %f24
	.word	0x81a01a2c	! t0_kref+0xc8c:   	fstoi	%f12, %f0
	.word	0x91a01890	! t0_kref+0xc90:   	fitos	%f16, %f8
	.word	0x9a66c017	! t0_kref+0xc94:   	subc	%i3, %l7, %o5
	.word	0x89a00537	! t0_kref+0xc98:   	fsqrts	%f23, %f4
	.word	0xee28a018	! t0_kref+0xc9c:   	stb	%l7, [%g2 + 0x18]
	.word	0x9fc10000	! t0_kref+0xca0:   	call	%g4
	.word	0x9236b16d	! t0_kref+0xca4:   	orn	%i2, -0xe93, %o1
	.word	0x9fc10000	! t0_kref+0xca8:   	call	%g4
	.word	0x9236e042	! t0_kref+0xcac:   	orn	%i3, 0x42, %o1
	.word	0x32800001	! t0_kref+0xcb0:   	bne,a	_kref+0xcb4
	.word	0xf42e6001	! t0_kref+0xcb4:   	stb	%i2, [%i1 + 1]
	.word	0x192a3fcb	! t0_kref+0xcb8:   	sethi	%hi(0xa8ff2c00), %o4
	.word	0x99702427	! t0_kref+0xcbc:   	popc	0x427, %o4
	.word	0x86102011	! t0_kref+0xcc0:   	mov	0x11, %g3
	.word	0x86a0e001	! t0_kref+0xcc4:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0xcc8:   	be,a	_kref+0xcf4
	.word	0xc9ee501b	! t0_kref+0xccc:   	prefetcha	%i1 + %i3, 4
	.word	0xda16c019	! t0_kref+0xcd0:   	lduh	[%i3 + %i1], %o5
	.word	0xa85ee46a	! t0_kref+0xcd4:   	smul	%i3, 0x46a, %l4
	.word	0x81ac8a58	! t0_kref+0xcd8:   	fcmpd	%fcc0, %f18, %f24
	.word	0xd02e601b	! t0_kref+0xcdc:   	stb	%o0, [%i1 + 0x1b]
	.word	0xa87f000b	! t0_kref+0xce0:   	sdiv	%i4, %o3, %l4
	.word	0x91a609ce	! t0_kref+0xce4:   	fdivd	%f24, %f14, %f8
	.word	0xaaa3401b	! t0_kref+0xce8:   	subcc	%o5, %i3, %l5
	.word	0xb1a000a2	! t0_kref+0xcec:   	fnegs	%f2, %f24
	.word	0xee566012	! t0_kref+0xcf0:   	ldsh	[%i1 + 0x12], %l7
	.word	0xc76e0017	! t0_kref+0xcf4:   	prefetch	%i0 + %l7, 3
	.word	0xe91e7fe8	! t0_kref+0xcf8:   	ldd	[%i1 - 0x18], %f20
	.word	0xf7ee101d	! t0_kref+0xcfc:   	prefetcha	%i0 + %i5, 27
	.word	0xd01e2010	! t0_kref+0xd00:   	ldd	[%i0 + 0x10], %o0
	.word	0xf7ee501a	! t0_kref+0xd04:   	prefetcha	%i1 + %i2, 27
	.word	0x83a0189b	! t0_kref+0xd08:   	fitos	%f27, %f1
	call	SYM(t0_subr0)
	.word	0xd8c8a01c	! t0_kref+0xd10:   	ldsba	[%g2 + 0x1c]%asi, %o4
	.word	0x33800002	! t0_kref+0xd14:   	fbe,a	_kref+0xd1c
	.word	0x9246effe	! t0_kref+0xd18:   	addc	%i3, 0xffe, %o1
	.word	0xb1a0492b	! t0_kref+0xd1c:   	fmuls	%f1, %f11, %f24
	.word	0x9e3a7fa4	! t0_kref+0xd20:   	xnor	%o1, -0x5c, %o7
	.word	0x93a00525	! t0_kref+0xd24:   	fsqrts	%f5, %f9
	.word	0xda20a034	! t0_kref+0xd28:   	st	%o5, [%g2 + 0x34]
	.word	0x81ad8abb	! t0_kref+0xd2c:   	fcmpes	%fcc0, %f22, %f27
	.word	0x9fc00004	! t0_kref+0xd30:   	call	%g0 + %g4
	.word	0x96d30017	! t0_kref+0xd34:   	umulcc	%o4, %l7, %o3
	.word	0x9426800b	! t0_kref+0xd38:   	sub	%i2, %o3, %o2
	.word	0x9412001c	! t0_kref+0xd3c:   	or	%o0, %i4, %o2
	.word	0xda16600a	! t0_kref+0xd40:   	lduh	[%i1 + 0xa], %o5
	.word	0x83a64927	! t0_kref+0xd44:   	fmuls	%f25, %f7, %f1
	.word	0xa7a2c831	! t0_kref+0xd48:   	fadds	%f11, %f17, %f19
	.word	0xad400000	! t0_kref+0xd4c:   	mov	%y, %l6
	.word	0x9ba01887	! t0_kref+0xd50:   	fitos	%f7, %f13
	.word	0xe8866004	! t0_kref+0xd54:   	lda	[%i1 + 4]%asi, %l4
	.word	0xd09e1000	! t0_kref+0xd58:   	ldda	[%i0]0x80, %o0
	.word	0x8da000a2	! t0_kref+0xd5c:   	fnegs	%f2, %f6
	.word	0xea86601c	! t0_kref+0xd60:   	lda	[%i1 + 0x1c]%asi, %l5
	.word	0x9da18944	! t0_kref+0xd64:   	fmuld	%f6, %f4, %f14
	.word	0x905b000d	! t0_kref+0xd68:   	smul	%o4, %o5, %o0
	.word	0xa88a8009	! t0_kref+0xd6c:   	andcc	%o2, %o1, %l4
	.word	0xda80a000	! t0_kref+0xd70:   	lda	[%g2]%asi, %o5
	.word	0xe4180019	! t0_kref+0xd74:   	ldd	[%g0 + %i1], %l2
	.word	0xd8d0a03a	! t0_kref+0xd78:   	ldsha	[%g2 + 0x3a]%asi, %o4
	.word	0x81ad0a48	! t0_kref+0xd7c:   	fcmpd	%fcc0, %f20, %f8
	.word	0x87a68938	! t0_kref+0xd80:   	fmuls	%f26, %f24, %f3
	.word	0x87a2c833	! t0_kref+0xd84:   	fadds	%f11, %f19, %f3
	.word	0xf5ee101a	! t0_kref+0xd88:   	prefetcha	%i0 + %i2, 26
	.word	0x8ba40823	! t0_kref+0xd8c:   	fadds	%f16, %f3, %f5
	.word	0xa696c008	! t0_kref+0xd90:   	orcc	%i3, %o0, %l3
	.word	0xb1a01920	! t0_kref+0xd94:   	fstod	%f0, %f24
	.word	0x93a089a9	! t0_kref+0xd98:   	fdivs	%f2, %f9, %f9
	.word	0xaf400000	! t0_kref+0xd9c:   	mov	%y, %l7
	.word	0x35480001	! t0_kref+0xda0:   	fbue,a,pt	%fcc0, _kref+0xda4
	.word	0xb5a0189b	! t0_kref+0xda4:   	fitos	%f27, %f26
	.word	0xead0a004	! t0_kref+0xda8:   	ldsha	[%g2 + 4]%asi, %l5
	.word	0xeb68a005	! t0_kref+0xdac:   	prefetch	%g2 + 5, 21
	.word	0x38800001	! t0_kref+0xdb0:   	bgu,a	_kref+0xdb4
	.word	0x933a6001	! t0_kref+0xdb4:   	sra	%o1, 0x1, %o1
	.word	0x8143c000	! t0_kref+0xdb8:   	stbar
	.word	0xd2a0a01c	! t0_kref+0xdbc:   	sta	%o1, [%g2 + 0x1c]%asi
	.word	0x90b2ee1c	! t0_kref+0xdc0:   	orncc	%o3, 0xe1c, %o0
	.word	0x20800007	! t0_kref+0xdc4:   	bn,a	_kref+0xde0
	.word	0xd8c0a020	! t0_kref+0xdc8:   	ldswa	[%g2 + 0x20]%asi, %o4
	.word	0x37800003	! t0_kref+0xdcc:   	fbge,a	_kref+0xdd8
	.word	0xed3e0000	! t0_kref+0xdd0:   	std	%f22, [%i0]
	.word	0x8586c00d	! t0_kref+0xdd4:   	wr	%i3, %o5, %ccr
	.word	0x81a88abb	! t0_kref+0xdd8:   	fcmpes	%fcc0, %f2, %f27
	.word	0x9226801a	! t0_kref+0xddc:   	sub	%i2, %i2, %o1
	.word	0xaca2801b	! t0_kref+0xde0:   	subcc	%o2, %i3, %l6
	.word	0x9a18251d	! t0_kref+0xde4:   	xor	%g0, 0x51d, %o5
	.word	0x9fa018c2	! t0_kref+0xde8:   	fdtos	%f2, %f15
	.word	0x29800004	! t0_kref+0xdec:   	fbl,a	_kref+0xdfc
	.word	0x9eb23a19	! t0_kref+0xdf0:   	orncc	%o0, -0x5e7, %o7
	.word	0xa5a0084c	! t0_kref+0xdf4:   	faddd	%f0, %f12, %f18
	.word	0x90932229	! t0_kref+0xdf8:   	orcc	%o4, 0x229, %o0
	.word	0x86102004	! t0_kref+0xdfc:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0xe00:   	bne,a	_kref+0xe00
	.word	0x86a0e001	! t0_kref+0xe04:   	subcc	%g3, 1, %g3
	.word	0xff6e3fe8	! t0_kref+0xe08:   	prefetch	%i0 - 0x18, 31
	.word	0x98437e9a	! t0_kref+0xe0c:   	addc	%o5, -0x166, %o4
	.word	0x9fc10000	! t0_kref+0xe10:   	call	%g4
	.word	0xa5a01884	! t0_kref+0xe14:   	fitos	%f4, %f18
	.word	0x86102002	! t0_kref+0xe18:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xe1c:   	bne,a	_kref+0xe1c
	.word	0x86a0e001	! t0_kref+0xe20:   	subcc	%g3, 1, %g3
	.word	0xd8e8a030	! t0_kref+0xe24:   	ldstuba	[%g2 + 0x30]%asi, %o4
	.word	0x961a800c	! t0_kref+0xe28:   	xor	%o2, %o4, %o3
	.word	0xaf400000	! t0_kref+0xe2c:   	mov	%y, %l7
	.word	0x99a00123	! t0_kref+0xe30:   	fabss	%f3, %f12
	.word	0xe8180019	! t0_kref+0xe34:   	ldd	[%g0 + %i1], %l4
	.word	0x81ab0a58	! t0_kref+0xe38:   	fcmpd	%fcc0, %f12, %f24
	.word	0xeb6e6000	! t0_kref+0xe3c:   	prefetch	%i1, 21
	.word	0x24800008	! t0_kref+0xe40:   	ble,a	_kref+0xe60
	.word	0xefee501a	! t0_kref+0xe44:   	prefetcha	%i1 + %i2, 23
	.word	0x83a000a0	! t0_kref+0xe48:   	fnegs	%f0, %f1
	.word	0xb1a00534	! t0_kref+0xe4c:   	fsqrts	%f20, %f24
	.word	0x97a0013a	! t0_kref+0xe50:   	fabss	%f26, %f11
	.word	0x97700017	! t0_kref+0xe54:   	popc	%l7, %o3
	.word	0xd020a028	! t0_kref+0xe58:   	st	%o0, [%g2 + 0x28]
	.word	0xb7a048a7	! t0_kref+0xe5c:   	fsubs	%f1, %f7, %f27
	.word	0xd0fe7ff4	! t0_kref+0xe60:   	swapa	[%i1 - 0xc]%asi, %o0
	.word	0x35800008	! t0_kref+0xe64:   	fbue,a	_kref+0xe84
	.word	0x17327e2e	! t0_kref+0xe68:   	sethi	%hi(0xc9f8b800), %o3
	.word	0x949ea9d3	! t0_kref+0xe6c:   	xorcc	%i2, 0x9d3, %o2
	.word	0xc53e7ff8	! t0_kref+0xe70:   	std	%f2, [%i1 - 8]
	.word	0xf42e7fe9	! t0_kref+0xe74:   	stb	%i2, [%i1 - 0x17]
	.word	0x963b2529	! t0_kref+0xe78:   	xnor	%o4, 0x529, %o3
	.word	0x96fa2082	! t0_kref+0xe7c:   	sdivcc	%o0, 0x82, %o3
	.word	0x8fa609b5	! t0_kref+0xe80:   	fdivs	%f24, %f21, %f7
	.word	0x9ec24008	! t0_kref+0xe84:   	addccc	%o1, %o0, %o7
	.word	0xf8280019	! t0_kref+0xe88:   	stb	%i4, [%g0 + %i1]
	.word	0xac16c01b	! t0_kref+0xe8c:   	or	%i3, %i3, %l6
	sethi	%hi(2f), %o7
	.word	0xe40be2cc	! t0_kref+0xe94:   	ldub	[%o7 + 0x2cc], %l2
	.word	0xa41ca00c	! t0_kref+0xe98:   	xor	%l2, 0xc, %l2
	.word	0xe42be2cc	! t0_kref+0xe9c:   	stb	%l2, [%o7 + 0x2cc]
	.word	0x81dbe2cc	! t0_kref+0xea0:   	flush	%o7 + 0x2cc
	.word	0x901b001a	! t0_kref+0xea4:   	xor	%o4, %i2, %o0
	.word	0xc9ee1000	! t0_kref+0xea8:   	prefetcha	%i0, 4
	.word	0xa1a00131	! t0_kref+0xeac:   	fabss	%f17, %f16
	.word	0x9da018d6	! t0_kref+0xeb0:   	fdtos	%f22, %f14
	.word	0xfbee101c	! t0_kref+0xeb4:   	prefetcha	%i0 + %i4, 29
	.word	0xa816c00b	! t0_kref+0xeb8:   	or	%i3, %o3, %l4
	.word	0x81a20921	! t0_kref+0xebc:   	fmuls	%f8, %f1, %f0
	.word	0x87a01887	! t0_kref+0xec0:   	fitos	%f7, %f3
	.word	0xd51fbf48	! t0_kref+0xec4:   	ldd	[%fp - 0xb8], %f10
	.word	0xd216c018	! t0_kref+0xec8:   	lduh	[%i3 + %i0], %o1
2:	.word	0xada01893	! t0_kref+0xecc:   	fitos	%f19, %f22
	.word	0xd11e6010	! t0_kref+0xed0:   	ldd	[%i1 + 0x10], %f8
	.word	0x85a01a2d	! t0_kref+0xed4:   	fstoi	%f13, %f2
	.word	0xf207bfe0	! t0_kref+0xed8:   	ld	[%fp - 0x20], %i1
	.word	0xaf674000	! t0_kref+0xedc:   	movcc	%icc, %g0, %l7
	.word	0xac40359c	! t0_kref+0xee0:   	addc	%g0, -0xa64, %l6
	.word	0xec3e001d	! t0_kref+0xee4:   	std	%l6, [%i0 + %i5]
	.word	0xc9200019	! t0_kref+0xee8:   	st	%f4, [%g0 + %i1]
	.word	0xc0a8a01e	! t0_kref+0xeec:   	stba	%g0, [%g2 + 0x1e]%asi
	.word	0x967f000c	! t0_kref+0xef0:   	sdiv	%i4, %o4, %o3
	.word	0xd028a010	! t0_kref+0xef4:   	stb	%o0, [%g2 + 0x10]
	.word	0x90127d86	! t0_kref+0xef8:   	or	%o1, -0x27a, %o0
	.word	0xe91f4019	! t0_kref+0xefc:   	ldd	[%i5 + %i1], %f20
	.word	0x98d33f71	! t0_kref+0xf00:   	umulcc	%o4, -0x8f, %o4
	.word	0xe9ee501a	! t0_kref+0xf04:   	prefetcha	%i1 + %i2, 20
	.word	0xada489a4	! t0_kref+0xf08:   	fdivs	%f18, %f4, %f22
	.word	0x949b4009	! t0_kref+0xf0c:   	xorcc	%o5, %o1, %o2
	.word	0xec3e3fe0	! t0_kref+0xf10:   	std	%l6, [%i0 - 0x20]
	.word	0x89a018c2	! t0_kref+0xf14:   	fdtos	%f2, %f4
	.word	0xe4086374	! t0_kref+0xf18:   	ldub	[%g1 + 0x374], %l2
	.word	0xa41ca00c	! t0_kref+0xf1c:   	xor	%l2, 0xc, %l2
	.word	0xe4286374	! t0_kref+0xf20:   	stb	%l2, [%g1 + 0x374]
	.word	0x81d86374	! t0_kref+0xf24:   	flush	%g1 + 0x374
	.word	0x903eabf7	! t0_kref+0xf28:   	xnor	%i2, 0xbf7, %o0
	.word	0x921df163	! t0_kref+0xf2c:   	xor	%l7, -0xe9d, %o1
	.word	0x85a01a21	! t0_kref+0xf30:   	fstoi	%f1, %f2
	.word	0x8fa4c921	! t0_kref+0xf34:   	fmuls	%f19, %f1, %f7
	.word	0x9635c000	! t0_kref+0xf38:   	orn	%l7, %g0, %o3
	.word	0xf59e3fe8	! t0_kref+0xf3c:   	ldda	[%i0 - 0x18]%asi, %f26
	.word	0xa7a00034	! t0_kref+0xf40:   	fmovs	%f20, %f19
	.word	0xec9e101d	! t0_kref+0xf44:   	ldda	[%i0 + %i5]0x80, %l6
	.word	0x9055efc4	! t0_kref+0xf48:   	umul	%l7, 0xfc4, %o0
	.word	0x948b634f	! t0_kref+0xf4c:   	andcc	%o5, 0x34f, %o2
	.word	0x29480002	! t0_kref+0xf50:   	fbl,a,pt	%fcc0, _kref+0xf58
	.word	0xa8c2801c	! t0_kref+0xf54:   	addccc	%o2, %i4, %l4
2:	.word	0xaec6c000	! t0_kref+0xf58:   	addccc	%i3, %g0, %l7
	.word	0xc11fbe10	! t0_kref+0xf5c:   	ldd	[%fp - 0x1f0], %f0
	.word	0x86102006	! t0_kref+0xf60:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0xf64:   	subcc	%g3, 1, %g3
	.word	0x22800011	! t0_kref+0xf68:   	be,a	_kref+0xfac
	.word	0xea801019	! t0_kref+0xf6c:   	lda	[%g0 + %i1]0x80, %l5
	.word	0xaa1ebbff	! t0_kref+0xf70:   	xor	%i2, -0x401, %l5
	.word	0x945b4008	! t0_kref+0xf74:   	smul	%o5, %o0, %o2
	.word	0x9a803ed8	! t0_kref+0xf78:   	addcc	%g0, -0x128, %o5
	.word	0xba103fe0	! t0_kref+0xf7c:   	mov	0xffffffe0, %i5
	.word	0xa3a349a3	! t0_kref+0xf80:   	fdivs	%f13, %f3, %f17
	.word	0xe7ee501c	! t0_kref+0xf84:   	prefetcha	%i1 + %i4, 19
	.word	0x99400000	! t0_kref+0xf88:   	mov	%y, %o4
	.word	0x9fc00004	! t0_kref+0xf8c:   	call	%g0 + %g4
	.word	0xac05fc8f	! t0_kref+0xf90:   	add	%l7, -0x371, %l6
	.word	0xb5a18852	! t0_kref+0xf94:   	faddd	%f6, %f18, %f26
	.word	0x90fb400d	! t0_kref+0xf98:   	sdivcc	%o5, %o5, %o0
	.word	0x98e36755	! t0_kref+0xf9c:   	subccc	%o5, 0x755, %o4
	.word	0xac530000	! t0_kref+0xfa0:   	umul	%o4, %g0, %l6
	.word	0x23bffff0	! t0_kref+0xfa4:   	fbne,a	_kref+0xf64
	.word	0xe700a028	! t0_kref+0xfa8:   	ld	[%g2 + 0x28], %f19
	.word	0x30800004	! t0_kref+0xfac:   	ba,a	_kref+0xfbc
	.word	0x9aa80009	! t0_kref+0xfb0:   	andncc	%g0, %o1, %o5
	.word	0x81a00026	! t0_kref+0xfb4:   	fmovs	%f6, %f0
	.word	0x9b1735e0	! t0_kref+0xfb8:   	taddcctv	%i4, -0xa20, %o5
	.word	0x81ad8a56	! t0_kref+0xfbc:   	fcmpd	%fcc0, %f22, %f22
	.word	0xc700a000	! t0_kref+0xfc0:   	ld	[%g2], %f3
	.word	0x85a2094e	! t0_kref+0xfc4:   	fmuld	%f8, %f14, %f2
	.word	0x92b2213c	! t0_kref+0xfc8:   	orncc	%o0, 0x13c, %o1
	.word	0xd99f5a58	! t0_kref+0xfcc:   	ldda	[%i5 + %i0]0xd2, %f12
	.word	0xae1b2e29	! t0_kref+0xfd0:   	xor	%o4, 0xe29, %l7
	.word	0x22800005	! t0_kref+0xfd4:   	be,a	_kref+0xfe8
	.word	0x98d8000a	! t0_kref+0xfd8:   	smulcc	%g0, %o2, %o4
	.word	0xd8d0a02a	! t0_kref+0xfdc:   	ldsha	[%g2 + 0x2a]%asi, %o4
	.word	0x81ae8a56	! t0_kref+0xfe0:   	fcmpd	%fcc0, %f26, %f22
	.word	0xd0262014	! t0_kref+0xfe4:   	st	%o0, [%i0 + 0x14]
	.word	0xe36e401a	! t0_kref+0xfe8:   	prefetch	%i1 + %i2, 17
	.word	0xaa02401c	! t0_kref+0xfec:   	add	%o1, %i4, %l5
	.word	0x86102002	! t0_kref+0xff0:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0xff4:   	bne,a	_kref+0xff4
	.word	0x86a0e001	! t0_kref+0xff8:   	subcc	%g3, 1, %g3
	.word	0x943b2066	! t0_kref+0xffc:   	xnor	%o4, 0x66, %o2
	.word	0xdfa0a03c	! t0_kref+0x1000:   	sta	%f15, [%g2 + 0x3c]%asi
	.word	0xd01e401d	! t0_kref+0x1004:   	ldd	[%i1 + %i5], %o0
	.word	0x93a00033	! t0_kref+0x1008:   	fmovs	%f19, %f9
	.word	0x87a3492c	! t0_kref+0x100c:   	fmuls	%f13, %f12, %f3
	.word	0xb5a00039	! t0_kref+0x1010:   	fmovs	%f25, %f26
	.word	0x2d480008	! t0_kref+0x1014:   	fbg,a,pt	%fcc0, _kref+0x1034
	.word	0x8143c000	! t0_kref+0x1018:   	stbar
	call	SYM(t0_subr3)
	.word	0xac66c01b	! t0_kref+0x1020:   	subc	%i3, %i3, %l6
	.word	0xc368a004	! t0_kref+0x1024:   	prefetch	%g2 + 4, 1
	.word	0x81aa8a48	! t0_kref+0x1028:   	fcmpd	%fcc0, %f10, %f8
	.word	0x9e82e52e	! t0_kref+0x102c:   	addcc	%o3, 0x52e, %o7
	.word	0x2b800005	! t0_kref+0x1030:   	fbug,a	_kref+0x1044
	.word	0x9fa01a2e	! t0_kref+0x1034:   	fstoi	%f14, %f15
	.word	0xa9a58d35	! t0_kref+0x1038:   	fsmuld	%f22, %f21, %f20
	.word	0x83a148a1	! t0_kref+0x103c:   	fsubs	%f5, %f1, %f1
	.word	0x97a00524	! t0_kref+0x1040:   	fsqrts	%f4, %f11
	.word	0x966728af	! t0_kref+0x1044:   	subc	%i4, 0x8af, %o3
	.word	0x9adf000d	! t0_kref+0x1048:   	smulcc	%i4, %o5, %o5
	.word	0xe5264000	! t0_kref+0x104c:   	st	%f18, [%i1]
	.word	0xda16c018	! t0_kref+0x1050:   	lduh	[%i3 + %i0], %o5
	.word	0x940ea908	! t0_kref+0x1054:   	and	%i2, 0x908, %o2
	.word	0x9fa000ab	! t0_kref+0x1058:   	fnegs	%f11, %f15
	.word	0x99a04d37	! t0_kref+0x105c:   	fsmuld	%f1, %f23, %f12
	.word	0xaec6ba1c	! t0_kref+0x1060:   	addccc	%i2, -0x5e4, %l7
	.word	0xec302446	! t0_kref+0x1064:   	sth	%l6, [%g0 + 0x446]
	.word	0x8fa000b2	! t0_kref+0x1068:   	fnegs	%f18, %f7
	.word	0x9e5f001b	! t0_kref+0x106c:   	smul	%i4, %i3, %o7
	.word	0x8143e056	! t0_kref+0x1070:   	membar	0x56
	.word	0xae0721cc	! t0_kref+0x1074:   	add	%i4, 0x1cc, %l7
	.word	0xae43620d	! t0_kref+0x1078:   	addc	%o5, 0x20d, %l7
	.word	0xaeda001a	! t0_kref+0x107c:   	smulcc	%o0, %i2, %l7
	.word	0x9da44825	! t0_kref+0x1080:   	fadds	%f17, %f5, %f14
	.word	0x2a800001	! t0_kref+0x1084:   	bcs,a	_kref+0x1088
	.word	0xb5a588c8	! t0_kref+0x1088:   	fsubd	%f22, %f8, %f26
	.word	0x8583772c	! t0_kref+0x108c:   	wr	%o5, 0xfffff72c, %ccr
	.word	0xd87e2010	! t0_kref+0x1090:   	swap	[%i0 + 0x10], %o4
	.word	0x81ae8a54	! t0_kref+0x1094:   	fcmpd	%fcc0, %f26, %f20
	.word	0x24800004	! t0_kref+0x1098:   	ble,a	_kref+0x10a8
	.word	0xd216c019	! t0_kref+0x109c:   	lduh	[%i3 + %i1], %o1
	.word	0x2b480004	! t0_kref+0x10a0:   	fbug,a,pt	%fcc0, _kref+0x10b0
	.word	0xe808a014	! t0_kref+0x10a4:   	ldub	[%g2 + 0x14], %l4
	.word	0xa80ae47c	! t0_kref+0x10a8:   	and	%o3, 0x47c, %l4
	.word	0x91a2c8ba	! t0_kref+0x10ac:   	fsubs	%f11, %f26, %f8
	.word	0x3f800006	! t0_kref+0x10b0:   	fbo,a	_kref+0x10c8
	.word	0x81df401c	! t0_kref+0x10b4:   	flush	%i5 + %i4
	.word	0x9046fc39	! t0_kref+0x10b8:   	addc	%i3, -0x3c7, %o0
	.word	0x8fa048a8	! t0_kref+0x10bc:   	fsubs	%f1, %f8, %f7
	.word	0xaba00532	! t0_kref+0x10c0:   	fsqrts	%f18, %f21
	.word	0x23480007	! t0_kref+0x10c4:   	fbne,a,pt	%fcc0, _kref+0x10e0
	.word	0x9a80000d	! t0_kref+0x10c8:   	addcc	%g0, %o5, %o5
	.word	0xa88df291	! t0_kref+0x10cc:   	andcc	%l7, -0xd6f, %l4
	.word	0xda2e0000	! t0_kref+0x10d0:   	stb	%o5, [%i0]
	.word	0xa812b647	! t0_kref+0x10d4:   	or	%o2, -0x9b9, %l4
	.word	0xaa25f148	! t0_kref+0x10d8:   	sub	%l7, -0xeb8, %l5
	.word	0x9fc00004	! t0_kref+0x10dc:   	call	%g0 + %g4
	.word	0xf3a0a000	! t0_kref+0x10e0:   	sta	%f25, [%g2]%asi
	.word	0xf51fbef8	! t0_kref+0x10e4:   	ldd	[%fp - 0x108], %f26
	.word	0xb5a00531	! t0_kref+0x10e8:   	fsqrts	%f17, %f26
	.word	0x94ae8008	! t0_kref+0x10ec:   	andncc	%i2, %o0, %o2
	.word	0x2d480005	! t0_kref+0x10f0:   	fbg,a,pt	%fcc0, _kref+0x1104
	.word	0x81dde6b3	! t0_kref+0x10f4:   	flush	%l7 + 0x6b3
	.word	0x96c6b291	! t0_kref+0x10f8:   	addccc	%i2, -0xd6f, %o3
	.word	0x9e183756	! t0_kref+0x10fc:   	xor	%g0, -0x8aa, %o7
	.word	0xa5a01894	! t0_kref+0x1100:   	fitos	%f20, %f18
	.word	0x28480005	! t0_kref+0x1104:   	bleu,a,pt	%icc, _kref+0x1118
	.word	0xa802000d	! t0_kref+0x1108:   	add	%o0, %o5, %l4
	.word	0x89a00032	! t0_kref+0x110c:   	fmovs	%f18, %f4
	.word	0x90aa400c	! t0_kref+0x1110:   	andncc	%o1, %o4, %o0
	.word	0xed80a00c	! t0_kref+0x1114:   	lda	[%g2 + 0xc]%asi, %f22
	.word	0x85a01a2f	! t0_kref+0x1118:   	fstoi	%f15, %f2
	.word	0x9800000c	! t0_kref+0x111c:   	add	%g0, %o4, %o4
	.word	0x290d891a	! t0_kref+0x1120:   	sethi	%hi(0x36246800), %l4
	.word	0x96a32c82	! t0_kref+0x1124:   	subcc	%o4, 0xc82, %o3
	.word	0x87a01a29	! t0_kref+0x1128:   	fstoi	%f9, %f3
	.word	0xd830a02c	! t0_kref+0x112c:   	sth	%o4, [%g2 + 0x2c]
	.word	0x3d800008	! t0_kref+0x1130:   	fbule,a	_kref+0x1150
	.word	0x9e3222a7	! t0_kref+0x1134:   	orn	%o0, 0x2a7, %o7
	.word	0xaa46b9d9	! t0_kref+0x1138:   	addc	%i2, -0x627, %l5
	.word	0xda4e7fe9	! t0_kref+0x113c:   	ldsb	[%i1 - 0x17], %o5
	.word	0x22800004	! t0_kref+0x1140:   	be,a	_kref+0x1150
	.word	0x908a000b	! t0_kref+0x1144:   	andcc	%o0, %o3, %o0
	.word	0xc126600c	! t0_kref+0x1148:   	st	%f0, [%i1 + 0xc]
	.word	0xb7a508b1	! t0_kref+0x114c:   	fsubs	%f20, %f17, %f27
	call	SYM(t0_subr1)
	.word	0xedee101c	! t0_kref+0x1154:   	prefetcha	%i0 + %i4, 22
	.word	0x94df001c	! t0_kref+0x1158:   	smulcc	%i4, %i4, %o2
	.word	0x9e12800a	! t0_kref+0x115c:   	or	%o2, %o2, %o7
	.word	0xc36e2008	! t0_kref+0x1160:   	prefetch	%i0 + 8, 1
	.word	0x9f2dc01a	! t0_kref+0x1164:   	sll	%l7, %i2, %o7
	.word	0x8da3895a	! t0_kref+0x1168:   	fmuld	%f14, %f26, %f6
	.word	0x9a0a801b	! t0_kref+0x116c:   	and	%o2, %i3, %o5
	.word	0x96526472	! t0_kref+0x1170:   	umul	%o1, 0x472, %o3
	.word	0x968b7743	! t0_kref+0x1174:   	andcc	%o5, -0x8bd, %o3
	.word	0x27480002	! t0_kref+0x1178:   	fbul,a,pt	%fcc0, _kref+0x1180
	.word	0x96126085	! t0_kref+0x117c:   	or	%o1, 0x85, %o3
	.word	0xa3a01098	! t0_kref+0x1180:   	fxtos	%f24, %f17
	.word	0x37480005	! t0_kref+0x1184:   	fbge,a,pt	%fcc0, _kref+0x1198
	.word	0x96c2401c	! t0_kref+0x1188:   	addccc	%o1, %i4, %o3
	.word	0xac32c009	! t0_kref+0x118c:   	orn	%o3, %o1, %l6
	.word	0xa5a01048	! t0_kref+0x1190:   	fdtox	%f8, %f18
	.word	0x2931db91	! t0_kref+0x1194:   	sethi	%hi(0xc76e4400), %l4
	.word	0x8143e040	! t0_kref+0x1198:   	membar	0x40
	.word	0x928a8009	! t0_kref+0x119c:   	andcc	%o2, %o1, %o1
	.word	0x9da01891	! t0_kref+0x11a0:   	fitos	%f17, %f14
	.word	0x901a4000	! t0_kref+0x11a4:   	xor	%o1, %g0, %o0
	.word	0x96b6c008	! t0_kref+0x11a8:   	orncc	%i3, %o0, %o3
	.word	0xa7400000	! t0_kref+0x11ac:   	mov	%y, %l3
	.word	0xc920a000	! t0_kref+0x11b0:   	st	%f4, [%g2]
	.word	0xb7a000a8	! t0_kref+0x11b4:   	fnegs	%f8, %f27
	.word	0x921a390c	! t0_kref+0x11b8:   	xor	%o0, -0x6f4, %o1
	.word	0xcfa0a00c	! t0_kref+0x11bc:   	sta	%f7, [%g2 + 0xc]%asi
	.word	0x9698001b	! t0_kref+0x11c0:   	xorcc	%g0, %i3, %o3
	.word	0xaa42c01c	! t0_kref+0x11c4:   	addc	%o3, %i4, %l5
	.word	0xde86200c	! t0_kref+0x11c8:   	lda	[%i0 + 0xc]%asi, %o7
	.word	0xaa8b400a	! t0_kref+0x11cc:   	andcc	%o5, %o2, %l5
	.word	0xadaa4042	! t0_kref+0x11d0:   	fmovde	%fcc0, %f2, %f22
	.word	0x8143c000	! t0_kref+0x11d4:   	stbar
	.word	0xa89a8017	! t0_kref+0x11d8:   	xorcc	%o2, %l7, %l4
	sethi	%hi(2f), %o7
	.word	0xe40be1f8	! t0_kref+0x11e0:   	ldub	[%o7 + 0x1f8], %l2
	.word	0xa41ca00c	! t0_kref+0x11e4:   	xor	%l2, 0xc, %l2
	.word	0xe42be1f8	! t0_kref+0x11e8:   	stb	%l2, [%o7 + 0x1f8]
	.word	0x81dbe1f8	! t0_kref+0x11ec:   	flush	%o7 + 0x1f8
	.word	0xa843000b	! t0_kref+0x11f0:   	addc	%o4, %o3, %l4
	call	SYM(t0_subr1)
2:	.word	0x9e8a801c	! t0_kref+0x11f8:   	andcc	%o2, %i4, %o7
	.word	0x9e003c95	! t0_kref+0x11fc:   	add	%g0, -0x36b, %o7
	.word	0xaac6fe9a	! t0_kref+0x1200:   	addccc	%i3, -0x166, %l5
	.word	0xa1a00535	! t0_kref+0x1204:   	fsqrts	%f21, %f16
	.word	0xeed0a008	! t0_kref+0x1208:   	ldsha	[%g2 + 8]%asi, %l7
	.word	0xacd28008	! t0_kref+0x120c:   	umulcc	%o2, %o0, %l6
	.word	0xc11e6008	! t0_kref+0x1210:   	ldd	[%i1 + 8], %f0
	.word	0xa7a18932	! t0_kref+0x1214:   	fmuls	%f6, %f18, %f19
	.word	0x9af2f9a2	! t0_kref+0x1218:   	udivcc	%o3, -0x65e, %o5
	.word	0x9da08842	! t0_kref+0x121c:   	faddd	%f2, %f2, %f14
	.word	0x923e8000	! t0_kref+0x1220:   	not	%i2, %o1
	.word	0xcfa61000	! t0_kref+0x1224:   	sta	%f7, [%i0]0x80
	.word	0xa6a24008	! t0_kref+0x1228:   	subcc	%o1, %o0, %l3
	.word	0x2e800005	! t0_kref+0x122c:   	bvs,a	_kref+0x1240
	.word	0x9a52f509	! t0_kref+0x1230:   	umul	%o3, -0xaf7, %o5
	.word	0xa818389a	! t0_kref+0x1234:   	xor	%g0, -0x766, %l4
	.word	0x968034d3	! t0_kref+0x1238:   	addcc	%g0, -0xb2d, %o3
	.word	0x945a672b	! t0_kref+0x123c:   	smul	%o1, 0x72b, %o2
	.word	0x81da400b	! t0_kref+0x1240:   	flush	%o1 + %o3
	.word	0xa93b001c	! t0_kref+0x1244:   	sra	%o4, %i4, %l4
	.word	0xa6b26dcf	! t0_kref+0x1248:   	orncc	%o1, 0xdcf, %l3
	.word	0xa1a00025	! t0_kref+0x124c:   	fmovs	%f5, %f16
	.word	0x929a8017	! t0_kref+0x1250:   	xorcc	%o2, %l7, %o1
	.word	0xaf336004	! t0_kref+0x1254:   	srl	%o5, 0x4, %l7
	.word	0x95a34927	! t0_kref+0x1258:   	fmuls	%f13, %f7, %f10
	.word	0x92c373a0	! t0_kref+0x125c:   	addccc	%o5, -0xc60, %o1
	.word	0xd600a034	! t0_kref+0x1260:   	ld	[%g2 + 0x34], %o3
	.word	0xd208a01e	! t0_kref+0x1264:   	ldub	[%g2 + 0x1e], %o1
	.word	0xd64e3fe8	! t0_kref+0x1268:   	ldsb	[%i0 - 0x18], %o3
	.word	0x2b480005	! t0_kref+0x126c:   	fbug,a,pt	%fcc0, _kref+0x1280
	.word	0xee163ff4	! t0_kref+0x1270:   	lduh	[%i0 - 0xc], %l7
	.word	0xd4380019	! t0_kref+0x1274:   	std	%o2, [%g0 + %i1]
	.word	0x9252c00d	! t0_kref+0x1278:   	umul	%o3, %o5, %o1
	.word	0x9825c01b	! t0_kref+0x127c:   	sub	%l7, %i3, %o4
	.word	0xa6b24017	! t0_kref+0x1280:   	orncc	%o1, %l7, %l3
	.word	0xf4a0a004	! t0_kref+0x1284:   	sta	%i2, [%g2 + 4]%asi
	.word	0x98f2c000	! t0_kref+0x1288:   	udivcc	%o3, %g0, %o4
	.word	0x9fc00004	! t0_kref+0x128c:   	call	%g0 + %g4
	.word	0x85a588cc	! t0_kref+0x1290:   	fsubd	%f22, %f12, %f2
	.word	0x2e800002	! t0_kref+0x1294:   	bvs,a	_kref+0x129c
	.word	0x945ee0ee	! t0_kref+0x1298:   	smul	%i3, 0xee, %o2
	.word	0xab400000	! t0_kref+0x129c:   	mov	%y, %l5
	.word	0x9a40000b	! t0_kref+0x12a0:   	addc	%g0, %o3, %o5
	.word	0xdac8a034	! t0_kref+0x12a4:   	ldsba	[%g2 + 0x34]%asi, %o5
	.word	0xd43e2010	! t0_kref+0x12a8:   	std	%o2, [%i0 + 0x10]
	.word	0xc99e5a1a	! t0_kref+0x12ac:   	ldda	[%i1 + %i2]0xd0, %f4
	.word	0xc1e8a009	! t0_kref+0x12b0:   	prefetcha	%g2 + 9, 0
	.word	0x9fc00004	! t0_kref+0x12b4:   	call	%g0 + %g4
	.word	0xa88af709	! t0_kref+0x12b8:   	andcc	%o3, -0x8f7, %l4
	.word	0x94defc70	! t0_kref+0x12bc:   	smulcc	%i3, -0x390, %o2
	.word	0x91a58956	! t0_kref+0x12c0:   	fmuld	%f22, %f22, %f8
	.word	0xae13400b	! t0_kref+0x12c4:   	or	%o5, %o3, %l7
	.word	0xa3a01887	! t0_kref+0x12c8:   	fitos	%f7, %f17
	.word	0xee7e7ff0	! t0_kref+0x12cc:   	swap	[%i1 - 0x10], %l7
	.word	0x91a01880	! t0_kref+0x12d0:   	fitos	%f0, %f8
	.word	0x96b33d6a	! t0_kref+0x12d4:   	orncc	%o4, -0x296, %o3
	.word	0xcd1f4019	! t0_kref+0x12d8:   	ldd	[%i5 + %i1], %f6
	.word	0x9da188d6	! t0_kref+0x12dc:   	fsubd	%f6, %f22, %f14
	.word	0x9fc10000	! t0_kref+0x12e0:   	call	%g4
	.word	0x8ba4c920	! t0_kref+0x12e4:   	fmuls	%f19, %f0, %f5
	.word	0x87a00038	! t0_kref+0x12e8:   	fmovs	%f24, %f3
	.word	0xee20a014	! t0_kref+0x12ec:   	st	%l7, [%g2 + 0x14]
	.word	0xe07e001c	! t0_kref+0x12f0:   	swap	[%i0 + %i4], %l0
	.word	0xc0264000	! t0_kref+0x12f4:   	clr	[%i1]
	.word	0x23800007	! t0_kref+0x12f8:   	fbne,a	_kref+0x1314
	.word	0xf428a011	! t0_kref+0x12fc:   	stb	%i2, [%g2 + 0x11]
	.word	0x9242ec46	! t0_kref+0x1300:   	addc	%o3, 0xc46, %o1
	.word	0xaa883c5c	! t0_kref+0x1304:   	andcc	%g0, -0x3a4, %l5
	.word	0xac5b4017	! t0_kref+0x1308:   	smul	%o5, %l7, %l6
	.word	0xdac0a01c	! t0_kref+0x130c:   	ldswa	[%g2 + 0x1c]%asi, %o5
	.word	0x21800004	! t0_kref+0x1310:   	fbn,a	_kref+0x1320
	.word	0xa5a2cd34	! t0_kref+0x1314:   	fsmuld	%f11, %f20, %f18
	.word	0xc51fbc68	! t0_kref+0x1318:   	ldd	[%fp - 0x398], %f2
	.word	0xb1a109ca	! t0_kref+0x131c:   	fdivd	%f4, %f10, %f24
	.word	0x9055f281	! t0_kref+0x1320:   	umul	%l7, -0xd7f, %o0
	.word	0x927a800a	! t0_kref+0x1324:   	sdiv	%o2, %o2, %o1
	.word	0xd1be501d	! t0_kref+0x1328:   	stda	%f8, [%i1 + %i5]0x80
	.word	0x903b4008	! t0_kref+0x132c:   	xnor	%o5, %o0, %o0
	.word	0x21800006	! t0_kref+0x1330:   	fbn,a	_kref+0x1348
	.word	0xd67e3ffc	! t0_kref+0x1334:   	swap	[%i0 - 4], %o3
	.word	0x90036cbe	! t0_kref+0x1338:   	add	%o5, 0xcbe, %o0
	.word	0x9056ef86	! t0_kref+0x133c:   	umul	%i3, 0xf86, %o0
	.word	0xa722f136	! t0_kref+0x1340:   	mulscc	%o3, -0xeca, %l3
	.word	0xd2c0a02c	! t0_kref+0x1344:   	ldswa	[%g2 + 0x2c]%asi, %o1
	.word	0x81ac0aa9	! t0_kref+0x1348:   	fcmpes	%fcc0, %f16, %f9
	.word	0xc900a038	! t0_kref+0x134c:   	ld	[%g2 + 0x38], %f4
	.word	0x81aa0aaf	! t0_kref+0x1350:   	fcmpes	%fcc0, %f8, %f15
	.word	0xf6b01019	! t0_kref+0x1354:   	stha	%i3, [%g0 + %i1]0x80
	.word	0xae95f1d3	! t0_kref+0x1358:   	orcc	%l7, -0xe2d, %l7
	.word	0xab6767b9	! t0_kref+0x135c:   	movcc	%icc, -0x47, %l5
	.word	0xc9ee501c	! t0_kref+0x1360:   	prefetcha	%i1 + %i4, 4
	.word	0xd216401b	! t0_kref+0x1364:   	lduh	[%i1 + %i3], %o1
	.word	0xa6e6c00c	! t0_kref+0x1368:   	subccc	%i3, %o4, %l3
	.word	0x8da00528	! t0_kref+0x136c:   	fsqrts	%f8, %f6
	.word	0x85a01898	! t0_kref+0x1370:   	fitos	%f24, %f2
	.word	0x8143e041	! t0_kref+0x1374:   	membar	0x41
	.word	0x96c2400a	! t0_kref+0x1378:   	addccc	%o1, %o2, %o3
	.word	0xf7ee101b	! t0_kref+0x137c:   	prefetcha	%i0 + %i3, 27
	.word	0x9ba0002e	! t0_kref+0x1380:   	fmovs	%f14, %f13
	.word	0x9ba0013b	! t0_kref+0x1384:   	fabss	%f27, %f13
	.word	0xacd2c00c	! t0_kref+0x1388:   	umulcc	%o3, %o4, %l6
	.word	0x95a0102b	! t0_kref+0x138c:   	fstox	%f11, %f10
	.word	0x9a76800a	! t0_kref+0x1390:   	udiv	%i2, %o2, %o5
	.word	0x81a80a29	! t0_kref+0x1394:   	fcmps	%fcc0, %f0, %f9
	.word	0xb3a6483a	! t0_kref+0x1398:   	fadds	%f25, %f26, %f25
	.word	0x93a000b2	! t0_kref+0x139c:   	fnegs	%f18, %f9
	.word	0xa9a5c82f	! t0_kref+0x13a0:   	fadds	%f23, %f15, %f20
	.word	0x90f27856	! t0_kref+0x13a4:   	udivcc	%o1, -0x7aa, %o0
	.word	0x943ac009	! t0_kref+0x13a8:   	xnor	%o3, %o1, %o2
	.word	0xd616c019	! t0_kref+0x13ac:   	lduh	[%i3 + %i1], %o3
	.word	0xe99f1a58	! t0_kref+0x13b0:   	ldda	[%i4 + %i0]0xd2, %f20
	.word	0x8143c000	! t0_kref+0x13b4:   	stbar
	.word	0xaeb22b9b	! t0_kref+0x13b8:   	orncc	%o0, 0xb9b, %l7
	.word	0x9937200c	! t0_kref+0x13bc:   	srl	%i4, 0xc, %o4
	.word	0xb3a688a1	! t0_kref+0x13c0:   	fsubs	%f26, %f1, %f25
	.word	0x8d83401c	! t0_kref+0x13c4:   	wr	%o5, %i4, %fprs
	.word	0xd9be588c	! t0_kref+0x13c8:   	stda	%f12, [%i1 + %o4]0xc4
	.word	0x96f8001a	! t0_kref+0x13cc:   	sdivcc	%g0, %i2, %o3
	.word	0x90534008	! t0_kref+0x13d0:   	umul	%o5, %o0, %o0
	.word	0x9423000c	! t0_kref+0x13d4:   	sub	%o4, %o4, %o2
	.word	0xc120a028	! t0_kref+0x13d8:   	st	%f0, [%g2 + 0x28]
	.word	0x9e1727b0	! t0_kref+0x13dc:   	or	%i4, 0x7b0, %o7
	.word	0xed3e3ff8	! t0_kref+0x13e0:   	std	%f22, [%i0 - 8]
	.word	0xf7a0a020	! t0_kref+0x13e4:   	sta	%f27, [%g2 + 0x20]%asi
	.word	0x39800003	! t0_kref+0x13e8:   	fbuge,a	_kref+0x13f4
	.word	0x91a0012c	! t0_kref+0x13ec:   	fabss	%f12, %f8
	.word	0xf3ee101d	! t0_kref+0x13f0:   	prefetcha	%i0 + %i5, 25
	.word	0x27480006	! t0_kref+0x13f4:   	fbul,a,pt	%fcc0, _kref+0x140c
	.word	0x171925ad	! t0_kref+0x13f8:   	sethi	%hi(0x6496b400), %o3
	.word	0x87a00529	! t0_kref+0x13fc:   	fsqrts	%f9, %f3
	.word	0x83a00033	! t0_kref+0x1400:   	fmovs	%f19, %f1
	.word	0xd380a014	! t0_kref+0x1404:   	lda	[%g2 + 0x14]%asi, %f9
	call	SYM(t0_subr3)
	.word	0x9846a7e7	! t0_kref+0x140c:   	addc	%i2, 0x7e7, %o4
	.word	0x9656c00a	! t0_kref+0x1410:   	umul	%i3, %o2, %o3
	.word	0xa642400b	! t0_kref+0x1414:   	addc	%o1, %o3, %l3
	.word	0xd8363fe4	! t0_kref+0x1418:   	sth	%o4, [%i0 - 0x1c]
	.word	0x81a98aad	! t0_kref+0x141c:   	fcmpes	%fcc0, %f6, %f13
	.word	0xa9a0012e	! t0_kref+0x1420:   	fabss	%f14, %f20
	.word	0xd050a02a	! t0_kref+0x1424:   	ldsh	[%g2 + 0x2a], %o0
	.word	0x9257000a	! t0_kref+0x1428:   	umul	%i4, %o2, %o1
	.word	0x98f3300f	! t0_kref+0x142c:   	udivcc	%o4, -0xff1, %o4
	.word	0xdda0a020	! t0_kref+0x1430:   	sta	%f14, [%g2 + 0x20]%asi
	.word	0xec4e7fe0	! t0_kref+0x1434:   	ldsb	[%i1 - 0x20], %l6
	.word	0xdd1fbd60	! t0_kref+0x1438:   	ldd	[%fp - 0x2a0], %f14
	.word	0xa866c00c	! t0_kref+0x143c:   	subc	%i3, %o4, %l4
	.word	0x9da00158	! t0_kref+0x1440:   	fabsd	%f24, %f14
	.word	0x9322f2eb	! t0_kref+0x1444:   	mulscc	%o3, -0xd15, %o1
	.word	0xac86c00a	! t0_kref+0x1448:   	addcc	%i3, %o2, %l6
	.word	0xe84e0000	! t0_kref+0x144c:   	ldsb	[%i0], %l4
	.word	0x2f800006	! t0_kref+0x1450:   	fbu,a	_kref+0x1468
	.word	0xec062000	! t0_kref+0x1454:   	ld	[%i0], %l6
	.word	0xe686501c	! t0_kref+0x1458:   	lda	[%i1 + %i4]0x80, %l3
	.word	0x81a8caa6	! t0_kref+0x145c:   	fcmpes	%fcc0, %f3, %f6
	.word	0x96aef492	! t0_kref+0x1460:   	andncc	%i3, -0xb6e, %o3
	.word	0xb5a4093a	! t0_kref+0x1464:   	fmuls	%f16, %f26, %f26
	.word	0xe5380019	! t0_kref+0x1468:   	std	%f18, [%g0 + %i1]
	.word	0xdec0a010	! t0_kref+0x146c:   	ldswa	[%g2 + 0x10]%asi, %o7
	.word	0xd43e4000	! t0_kref+0x1470:   	std	%o2, [%i1]
	.word	0x925b299f	! t0_kref+0x1474:   	smul	%o4, 0x99f, %o1
	.word	0x9ef7001b	! t0_kref+0x1478:   	udivcc	%i4, %i3, %o7
	.word	0x20800002	! t0_kref+0x147c:   	bn,a	_kref+0x1484
	.word	0x9b372011	! t0_kref+0x1480:   	srl	%i4, 0x11, %o5
	.word	0xacadc00d	! t0_kref+0x1484:   	andncc	%l7, %o5, %l6
	.word	0x33480004	! t0_kref+0x1488:   	fbe,a,pt	%fcc0, _kref+0x1498
	.word	0xe13e7ff0	! t0_kref+0x148c:   	std	%f16, [%i1 - 0x10]
	.word	0x27800008	! t0_kref+0x1490:   	fbul,a	_kref+0x14b0
	.word	0x9e9e801b	! t0_kref+0x1494:   	xorcc	%i2, %i3, %o7
	.word	0xcba0a004	! t0_kref+0x1498:   	sta	%f5, [%g2 + 4]%asi
	.word	0xaec037cd	! t0_kref+0x149c:   	addccc	%g0, -0x833, %l7
	.word	0x9042b557	! t0_kref+0x14a0:   	addc	%o2, -0xaa9, %o0
	.word	0x92573a96	! t0_kref+0x14a4:   	umul	%i4, -0x56a, %o1
	.word	0xd488a03a	! t0_kref+0x14a8:   	lduba	[%g2 + 0x3a]%asi, %o2
	.word	0x901e8017	! t0_kref+0x14ac:   	xor	%i2, %l7, %o0
!	.word	0x334c42d4	! t0_kref+0x14b0:   	fbe,a,pt	%fcc0, SYM(t0_subr2)
	   	fbe,a,pt	%fcc0, SYM(t0_subr2)
	.word	0x9e0068cc	! t0_kref+0x14b4:   	add	%g1, 0x8cc, %o7
	.word	0xa961259f	! t0_kref+0x14b8:   	movl	%fcc0, -0x261, %l4
	.word	0xaa0aab80	! t0_kref+0x14bc:   	and	%o2, 0xb80, %l5
	.word	0xc9be180b	! t0_kref+0x14c0:   	stda	%f4, [%i0 + %o3]0xc0
	.word	0xa812c017	! t0_kref+0x14c4:   	or	%o3, %l7, %l4
	.word	0x96fa400c	! t0_kref+0x14c8:   	sdivcc	%o1, %o4, %o3
	.word	0x9666c017	! t0_kref+0x14cc:   	subc	%i3, %l7, %o3
	.word	0x9422a766	! t0_kref+0x14d0:   	sub	%o2, 0x766, %o2
	.word	0xaa233566	! t0_kref+0x14d4:   	sub	%o4, -0xa9a, %l5
	.word	0xe5ee501c	! t0_kref+0x14d8:   	prefetcha	%i1 + %i4, 18
	.word	0xa6e00017	! t0_kref+0x14dc:   	subccc	%g0, %l7, %l3
	.word	0x9852801b	! t0_kref+0x14e0:   	umul	%o2, %i3, %o4
	.word	0xeac0a010	! t0_kref+0x14e4:   	ldswa	[%g2 + 0x10]%asi, %l5
	.word	0x9b400000	! t0_kref+0x14e8:   	mov	%y, %o5
	.word	0x3d480008	! t0_kref+0x14ec:   	fbule,a,pt	%fcc0, _kref+0x150c
	.word	0xd41e0000	! t0_kref+0x14f0:   	ldd	[%i0], %o2
	.word	0x89a01885	! t0_kref+0x14f4:   	fitos	%f5, %f4
	.word	0x001fffff	! t0_kref+0x14f8:   	illtrap	0x1fffff
	.word	0xa8d2a6ca	! t0_kref+0x14fc:   	umulcc	%o2, 0x6ca, %l4
	.word	0xa5a308ca	! t0_kref+0x1500:   	fsubd	%f12, %f10, %f18
	.word	0xafa01a21	! t0_kref+0x1504:   	fstoi	%f1, %f23
	.word	0xaab6a6cb	! t0_kref+0x1508:   	orncc	%i2, 0x6cb, %l5
	.word	0x26800002	! t0_kref+0x150c:   	bl,a	_kref+0x1514
	.word	0xe91fbe18	! t0_kref+0x1510:   	ldd	[%fp - 0x1e8], %f20
	.word	0xf11fbed8	! t0_kref+0x1514:   	ldd	[%fp - 0x128], %f24
	.word	0x2f800006	! t0_kref+0x1518:   	fbu,a	_kref+0x1530
	.word	0xd5be2008	! t0_kref+0x151c:   	stda	%f10, [%i0 + 8]%asi
	.word	0xa81b742e	! t0_kref+0x1520:   	xor	%o5, -0xbd2, %l4
	.word	0x9fc10000	! t0_kref+0x1524:   	call	%g4
	.word	0x8143c000	! t0_kref+0x1528:   	stbar
	.word	0xb7a00529	! t0_kref+0x152c:   	fsqrts	%f9, %f27
	.word	0xc300a020	! t0_kref+0x1530:   	ld	[%g2 + 0x20], %f1
	.word	0x90568008	! t0_kref+0x1534:   	umul	%i2, %o0, %o0
	.word	0x35480008	! t0_kref+0x1538:   	fbue,a,pt	%fcc0, _kref+0x1558
	.word	0xebe6100d	! t0_kref+0x153c:   	casa	[%i0]0x80, %o5, %l5
	.word	0xa622a0c4	! t0_kref+0x1540:   	sub	%o2, 0xc4, %l3
	.word	0x21480008	! t0_kref+0x1544:   	fbn,a,pt	%fcc0, _kref+0x1564
	.word	0xa88b0000	! t0_kref+0x1548:   	andcc	%o4, %g0, %l4
	.word	0xa846ec4a	! t0_kref+0x154c:   	addc	%i3, 0xc4a, %l4
	.word	0xe47e3fec	! t0_kref+0x1550:   	swap	[%i0 - 0x14], %l2
	.word	0xe1be1857	! t0_kref+0x1554:   	stda	%f16, [%i0 + %l7]0xc2
	.word	0xd6b66012	! t0_kref+0x1558:   	stha	%o3, [%i1 + 0x12]%asi
	.word	0x9fc10000	! t0_kref+0x155c:   	call	%g4
	.word	0xd688a02a	! t0_kref+0x1560:   	lduba	[%g2 + 0x2a]%asi, %o3
	.word	0x99a54d2f	! t0_kref+0x1564:   	fsmuld	%f21, %f15, %f12
	.word	0x91a5c8ad	! t0_kref+0x1568:   	fsubs	%f23, %f13, %f8
	.word	0x9006800a	! t0_kref+0x156c:   	add	%i2, %o2, %o0
	.word	0xd6a0a03c	! t0_kref+0x1570:   	sta	%o3, [%g2 + 0x3c]%asi
	.word	0xaba648b7	! t0_kref+0x1574:   	fsubs	%f25, %f23, %f21
	.word	0x9ba148b4	! t0_kref+0x1578:   	fsubs	%f5, %f20, %f13
	.word	0xae45c00d	! t0_kref+0x157c:   	addc	%l7, %o5, %l7
	.word	0xa88224df	! t0_kref+0x1580:   	addcc	%o0, 0x4df, %l4
	.word	0x8da01040	! t0_kref+0x1584:   	fdtox	%f0, %f6
	.word	0xd8f8a03c	! t0_kref+0x1588:   	swapa	[%g2 + 0x3c]%asi, %o4
	.word	0x35480008	! t0_kref+0x158c:   	fbue,a,pt	%fcc0, _kref+0x15ac
	.word	0xe81e0000	! t0_kref+0x1590:   	ldd	[%i0], %l4
	.word	0xec3f4018	! t0_kref+0x1594:   	std	%l6, [%i5 + %i0]
	.word	0x9fc00004	! t0_kref+0x1598:   	call	%g0 + %g4
	.word	0x95a1c821	! t0_kref+0x159c:   	fadds	%f7, %f1, %f10
	.word	0x37800004	! t0_kref+0x15a0:   	fbge,a	_kref+0x15b0
	.word	0x90b27829	! t0_kref+0x15a4:   	orncc	%o1, -0x7d7, %o0
	.word	0x9615ec7e	! t0_kref+0x15a8:   	or	%l7, 0xc7e, %o3
	.word	0xa6924000	! t0_kref+0x15ac:   	orcc	%o1, %g0, %l3
	.word	0xf4b0a022	! t0_kref+0x15b0:   	stha	%i2, [%g2 + 0x22]%asi
	.word	0xd0264000	! t0_kref+0x15b4:   	st	%o0, [%i1]
	.word	0x81a000a0	! t0_kref+0x15b8:   	fnegs	%f0, %f0
	.word	0xe4086a18	! t0_kref+0x15bc:   	ldub	[%g1 + 0xa18], %l2
	.word	0xa41ca00c	! t0_kref+0x15c0:   	xor	%l2, 0xc, %l2
	.word	0xe4286a18	! t0_kref+0x15c4:   	stb	%l2, [%g1 + 0xa18]
	.word	0x81d86a18	! t0_kref+0x15c8:   	flush	%g1 + 0xa18
	.word	0xd630a01c	! t0_kref+0x15cc:   	sth	%o3, [%g2 + 0x1c]
	.word	0xaa8ac01c	! t0_kref+0x15d0:   	andcc	%o3, %i4, %l5
	.word	0x96d724be	! t0_kref+0x15d4:   	umulcc	%i4, 0x4be, %o3
	.word	0xd43e2008	! t0_kref+0x15d8:   	std	%o2, [%i0 + 8]
	.word	0x85a01040	! t0_kref+0x15dc:   	fdtox	%f0, %f2
	.word	0x9ea321f3	! t0_kref+0x15e0:   	subcc	%o4, 0x1f3, %o7
	.word	0xe67e3ff4	! t0_kref+0x15e4:   	swap	[%i0 - 0xc], %l3
	.word	0xd42e8019	! t0_kref+0x15e8:   	stb	%o2, [%i2 + %i1]
	.word	0xeed0a01e	! t0_kref+0x15ec:   	ldsha	[%g2 + 0x1e]%asi, %l7
	.word	0x903aaea0	! t0_kref+0x15f0:   	xnor	%o2, 0xea0, %o0
	.word	0x8143c000	! t0_kref+0x15f4:   	stbar
	.word	0xeac8a027	! t0_kref+0x15f8:   	ldsba	[%g2 + 0x27]%asi, %l5
2:	.word	0xe01e401d	! t0_kref+0x15fc:   	ldd	[%i1 + %i5], %l0
	.word	0xd24e4000	! t0_kref+0x1600:   	ldsb	[%i1], %o1
	call	SYM(t0_subr2)
	.word	0xd05e7fe8	! t0_kref+0x1608:   	ldx	[%i1 - 0x18], %o0
	.word	0xaa3a0000	! t0_kref+0x160c:   	not	%o0, %l5
	.word	0xa5a0015a	! t0_kref+0x1610:   	fabsd	%f26, %f18
	.word	0xa9a208b7	! t0_kref+0x1614:   	fsubs	%f8, %f23, %f20
	.word	0xec3e4000	! t0_kref+0x1618:   	std	%l6, [%i1]
	.word	0x962832f7	! t0_kref+0x161c:   	andn	%g0, -0xd09, %o3
	.word	0xae96c000	! t0_kref+0x1620:   	orcc	%i3, %g0, %l7
	.word	0x91a0103b	! t0_kref+0x1624:   	fstox	%f27, %f8
	.word	0x96c5e65c	! t0_kref+0x1628:   	addccc	%l7, 0x65c, %o3
	.word	0xacaa3753	! t0_kref+0x162c:   	andncc	%o0, -0x8ad, %l6
	.word	0x2b800008	! t0_kref+0x1630:   	fbug,a	_kref+0x1650
	.word	0x94424008	! t0_kref+0x1634:   	addc	%o1, %o0, %o2
	.word	0xa5a018d2	! t0_kref+0x1638:   	fdtos	%f18, %f18
	.word	0xed180019	! t0_kref+0x163c:   	ldd	[%g0 + %i1], %f22
	.word	0x9612001c	! t0_kref+0x1640:   	or	%o0, %i4, %o3
	.word	0x97a409b0	! t0_kref+0x1644:   	fdivs	%f16, %f16, %f11
	.word	0x9e3b6281	! t0_kref+0x1648:   	xnor	%o5, 0x281, %o7
	.word	0x92db62f1	! t0_kref+0x164c:   	smulcc	%o5, 0x2f1, %o1
	.word	0x99227674	! t0_kref+0x1650:   	mulscc	%o1, -0x98c, %o4
	.word	0xd0270019	! t0_kref+0x1654:   	st	%o0, [%i4 + %i1]
	.word	0xd610a01e	! t0_kref+0x1658:   	lduh	[%g2 + 0x1e], %o3
	.word	0x29480001	! t0_kref+0x165c:   	fbl,a,pt	%fcc0, _kref+0x1660
	.word	0xc13e6010	! t0_kref+0x1660:   	std	%f0, [%i1 + 0x10]
	.word	0x9f400000	! t0_kref+0x1664:   	mov	%y, %o7
	.word	0x1f354773	! t0_kref+0x1668:   	sethi	%hi(0xd51dcc00), %o7
	.word	0x2f480006	! t0_kref+0x166c:   	fbu,a,pt	%fcc0, _kref+0x1684
	.word	0xa842400d	! t0_kref+0x1670:   	addc	%o1, %o5, %l4
	.word	0xee26401c	! t0_kref+0x1674:   	st	%l7, [%i1 + %i4]
	.word	0xac22401a	! t0_kref+0x1678:   	sub	%o1, %i2, %l6
	.word	0xecde1000	! t0_kref+0x167c:   	ldxa	[%i0]0x80, %l6
	.word	0xd0100018	! t0_kref+0x1680:   	lduh	[%g0 + %i0], %o0
	.word	0xafa0c92a	! t0_kref+0x1684:   	fmuls	%f3, %f10, %f23
	.word	0xd0a0a034	! t0_kref+0x1688:   	sta	%o0, [%g2 + 0x34]%asi
	.word	0x8143c000	! t0_kref+0x168c:   	stbar
	.word	0x99a01092	! t0_kref+0x1690:   	fxtos	%f18, %f12
	.word	0xd6a8a018	! t0_kref+0x1694:   	stba	%o3, [%g2 + 0x18]%asi
	.word	0x98a02b21	! t0_kref+0x1698:   	subcc	%g0, 0xb21, %o4
	.word	0xec3e3ff8	! t0_kref+0x169c:   	std	%l6, [%i0 - 8]
	.word	0x9fc10000	! t0_kref+0x16a0:   	call	%g4
	.word	0xee7f0018	! t0_kref+0x16a4:   	swap	[%i4 + %i0], %l7
	.word	0x988af8df	! t0_kref+0x16a8:   	andcc	%o3, -0x721, %o4
	.word	0x9a7f2442	! t0_kref+0x16ac:   	sdiv	%i4, 0x442, %o5
	.word	0xa68b6ec6	! t0_kref+0x16b0:   	andcc	%o5, 0xec6, %l3
	.word	0x89a40828	! t0_kref+0x16b4:   	fadds	%f16, %f8, %f4
	.word	0x99400000	! t0_kref+0x16b8:   	mov	%y, %o4
	.word	0xc807bff0	! t0_kref+0x16bc:   	ld	[%fp - 0x10], %g4
	.word	0x81db400f	! t0_kref+0x16c0:   	flush	%o5 + %o7
	.word	0x9a45e934	! t0_kref+0x16c4:   	addc	%l7, 0x934, %o5
	.word	0xd43e3ff8	! t0_kref+0x16c8:   	std	%o2, [%i0 - 8]
	.word	0x9e92668d	! t0_kref+0x16cc:   	orcc	%o1, 0x68d, %o7
	.word	0xde166018	! t0_kref+0x16d0:   	lduh	[%i1 + 0x18], %o7
	.word	0xd00e8018	! t0_kref+0x16d4:   	ldub	[%i2 + %i0], %o0
	.word	0xad0a800c	! t0_kref+0x16d8:   	tsubcc	%o2, %o4, %l6
	.word	0xada00142	! t0_kref+0x16dc:   	fabsd	%f2, %f22
	.word	0x9ba0012e	! t0_kref+0x16e0:   	fabss	%f14, %f13
	.word	0x273a8b76	! t0_kref+0x16e4:   	sethi	%hi(0xea2dd800), %l3
	.word	0x3e800004	! t0_kref+0x16e8:   	bvc,a	_kref+0x16f8
	.word	0xd84e001a	! t0_kref+0x16ec:   	ldsb	[%i0 + %i2], %o4
	.word	0x951730ce	! t0_kref+0x16f0:   	taddcctv	%i4, -0xf32, %o2
	.word	0xc0b0a020	! t0_kref+0x16f4:   	stha	%g0, [%g2 + 0x20]%asi
	.word	0x96603be7	! t0_kref+0x16f8:   	subc	%g0, -0x419, %o3
	.word	0x81a98a54	! t0_kref+0x16fc:   	fcmpd	%fcc0, %f6, %f20
	call	SYM(t0_subr2)
	.word	0xe8de2010	! t0_kref+0x1704:   	ldxa	[%i0 + 0x10]%asi, %l4
	.word	0x291b3506	! t0_kref+0x1708:   	sethi	%hi(0x6cd41800), %l4
	.word	0xea070019	! t0_kref+0x170c:   	ld	[%i4 + %i1], %l5
	.word	0xae7b3e4d	! t0_kref+0x1710:   	sdiv	%o4, -0x1b3, %l7
	.word	0xaba000af	! t0_kref+0x1714:   	fnegs	%f15, %f21
	.word	0x85830009	! t0_kref+0x1718:   	wr	%o4, %o1, %ccr
	.word	0xaefa2cfa	! t0_kref+0x171c:   	sdivcc	%o0, 0xcfa, %l7
	.word	0x97a000b2	! t0_kref+0x1720:   	fnegs	%f18, %f11
	.word	0x9642c000	! t0_kref+0x1724:   	addc	%o3, %g0, %o3
	.word	0x9a172d67	! t0_kref+0x1728:   	or	%i4, 0xd67, %o5
	.word	0xdaa8a01f	! t0_kref+0x172c:   	stba	%o5, [%g2 + 0x1f]%asi
	.word	0x963b001c	! t0_kref+0x1730:   	xnor	%o4, %i4, %o3
	.word	0x34800008	! t0_kref+0x1734:   	bg,a	_kref+0x1754
	.word	0x9872e589	! t0_kref+0x1738:   	udiv	%o3, 0x589, %o4
	.word	0x947a4017	! t0_kref+0x173c:   	sdiv	%o1, %l7, %o2
	.word	0x9e32379b	! t0_kref+0x1740:   	orn	%o0, -0x865, %o7
	.word	0x85a309b7	! t0_kref+0x1744:   	fdivs	%f12, %f23, %f2
	.word	0xe320a008	! t0_kref+0x1748:   	st	%f17, [%g2 + 8]
	.word	0x83a68921	! t0_kref+0x174c:   	fmuls	%f26, %f1, %f1
	.word	0xaf400000	! t0_kref+0x1750:   	mov	%y, %l7
	.word	0x90c2c009	! t0_kref+0x1754:   	addccc	%o3, %o1, %o0
	.word	0xc126001c	! t0_kref+0x1758:   	st	%f0, [%i0 + %i4]
	.word	0x99a0002a	! t0_kref+0x175c:   	fmovs	%f10, %f12
	.word	0xa6b2800b	! t0_kref+0x1760:   	orncc	%o2, %o3, %l3
	.word	0x95a01884	! t0_kref+0x1764:   	fitos	%f4, %f10
	.word	0xd03e7fe0	! t0_kref+0x1768:   	std	%o0, [%i1 - 0x20]
	.word	0x8da01884	! t0_kref+0x176c:   	fitos	%f4, %f6
	.word	0xf51fbe80	! t0_kref+0x1770:   	ldd	[%fp - 0x180], %f26
	.word	0x9a12801a	! t0_kref+0x1774:   	or	%o2, %i2, %o5
	.word	0xaa3b6193	! t0_kref+0x1778:   	xnor	%o5, 0x193, %l5
	.word	0xd048a015	! t0_kref+0x177c:   	ldsb	[%g2 + 0x15], %o0
	.word	0xc3a67fe0	! t0_kref+0x1780:   	sta	%f1, [%i1 - 0x20]%asi
	.word	0xc1ee1017	! t0_kref+0x1784:   	prefetcha	%i0 + %l7, 0
	.word	0xf6a8a00d	! t0_kref+0x1788:   	stba	%i3, [%g2 + 0xd]%asi
	.word	0xb1a38924	! t0_kref+0x178c:   	fmuls	%f14, %f4, %f24
	.word	0x90b729ad	! t0_kref+0x1790:   	orncc	%i4, 0x9ad, %o0
	.word	0xde88a007	! t0_kref+0x1794:   	lduba	[%g2 + 7]%asi, %o7
	.word	0x83a00536	! t0_kref+0x1798:   	fsqrts	%f22, %f1
	.word	0xa9a4082b	! t0_kref+0x179c:   	fadds	%f16, %f11, %f20
	.word	0x83a0002b	! t0_kref+0x17a0:   	fmovs	%f11, %f1
	.word	0xac8eaa23	! t0_kref+0x17a4:   	andcc	%i2, 0xa23, %l6
	.word	0xd720a010	! t0_kref+0x17a8:   	st	%f11, [%g2 + 0x10]
	.word	0x91a01883	! t0_kref+0x17ac:   	fitos	%f3, %f8
	.word	0xee270019	! t0_kref+0x17b0:   	st	%l7, [%i4 + %i1]
	.word	0xd6270019	! t0_kref+0x17b4:   	st	%o3, [%i4 + %i1]
	.word	0xaba448a2	! t0_kref+0x17b8:   	fsubs	%f17, %f2, %f21
	.word	0x96f8001b	! t0_kref+0x17bc:   	sdivcc	%g0, %i3, %o3
	.word	0x940735d4	! t0_kref+0x17c0:   	add	%i4, -0xa2c, %o2
	.word	0xd400a024	! t0_kref+0x17c4:   	ld	[%g2 + 0x24], %o2
	.word	0x87a01888	! t0_kref+0x17c8:   	fitos	%f8, %f3
	.word	0x9072800b	! t0_kref+0x17cc:   	udiv	%o2, %o3, %o0
	.word	0x86102001	! t0_kref+0x17d0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x17d4:   	bne,a	_kref+0x17d4
	.word	0x86a0e001	! t0_kref+0x17d8:   	subcc	%g3, 1, %g3
	.word	0xf620a004	! t0_kref+0x17dc:   	st	%i3, [%g2 + 4]
	.word	0xae630000	! t0_kref+0x17e0:   	subc	%o4, %g0, %l7
	.word	0xaa9ea38d	! t0_kref+0x17e4:   	xorcc	%i2, 0x38d, %l5
	.word	0x9f418000	! t0_kref+0x17e8:   	mov	%fprs, %o7
	.word	0xf380a004	! t0_kref+0x17ec:   	lda	[%g2 + 4]%asi, %f25
	.word	0xd7a63fe8	! t0_kref+0x17f0:   	sta	%f11, [%i0 - 0x18]%asi
	.word	0x9875c009	! t0_kref+0x17f4:   	udiv	%l7, %o1, %o4
	.word	0xec3e0000	! t0_kref+0x17f8:   	std	%l6, [%i0]
	.word	0xd8a8a00c	! t0_kref+0x17fc:   	stba	%o4, [%g2 + 0xc]%asi
	.word	0xd6160000	! t0_kref+0x1800:   	lduh	[%i0], %o3
	.word	0x81abca23	! t0_kref+0x1804:   	fcmps	%fcc0, %f15, %f3
	.word	0xa65f000a	! t0_kref+0x1808:   	smul	%i4, %o2, %l3
	.word	0xae1ec009	! t0_kref+0x180c:   	xor	%i3, %o1, %l7
	.word	0x81ae0a4e	! t0_kref+0x1810:   	fcmpd	%fcc0, %f24, %f14
	.word	0x25480001	! t0_kref+0x1814:   	fblg,a,pt	%fcc0, _kref+0x1818
	.word	0x9f132045	! t0_kref+0x1818:   	taddcctv	%o4, 0x45, %o7
	.word	0x30480008	! t0_kref+0x181c:   	ba,a,pt	%icc, _kref+0x183c
	.word	0xc91fbe60	! t0_kref+0x1820:   	ldd	[%fp - 0x1a0], %f4
	.word	0x9fa00539	! t0_kref+0x1824:   	fsqrts	%f25, %f15
	.word	0xac3b001b	! t0_kref+0x1828:   	xnor	%o4, %i3, %l6
	.word	0x20800007	! t0_kref+0x182c:   	bn,a	_kref+0x1848
	.word	0xe99f5058	! t0_kref+0x1830:   	ldda	[%i5 + %i0]0x82, %f20
	.word	0x945b0009	! t0_kref+0x1834:   	smul	%o4, %o1, %o2
	.word	0x95a64937	! t0_kref+0x1838:   	fmuls	%f25, %f23, %f10
	.word	0x9e630000	! t0_kref+0x183c:   	subc	%o4, %g0, %o7
	.word	0xa8302535	! t0_kref+0x1840:   	orn	%g0, 0x535, %l4
	.word	0xae380008	! t0_kref+0x1844:   	xnor	%g0, %o0, %l7
	.word	0xd2164000	! t0_kref+0x1848:   	lduh	[%i1], %o1
	.word	0x81adca26	! t0_kref+0x184c:   	fcmps	%fcc0, %f23, %f6
	.word	0xafa249a8	! t0_kref+0x1850:   	fdivs	%f9, %f8, %f23
	.word	0xa5a01896	! t0_kref+0x1854:   	fitos	%f22, %f18
	.word	0x9fc00004	! t0_kref+0x1858:   	call	%g0 + %g4
	.word	0xa9a00526	! t0_kref+0x185c:   	fsqrts	%f6, %f20
	.word	0x93a00125	! t0_kref+0x1860:   	fabss	%f5, %f9
	.word	0x913b2015	! t0_kref+0x1864:   	sra	%o4, 0x15, %o0
	.word	0xaf400000	! t0_kref+0x1868:   	mov	%y, %l7
	.word	0x98a72bf5	! t0_kref+0x186c:   	subcc	%i4, 0xbf5, %o4
	.word	0x9a5a800a	! t0_kref+0x1870:   	smul	%o2, %o2, %o5
	.word	0x36800008	! t0_kref+0x1874:   	bge,a	_kref+0x1894
	.word	0xa61e800a	! t0_kref+0x1878:   	xor	%i2, %o2, %l3
	.word	0x8da2c9b7	! t0_kref+0x187c:   	fdivs	%f11, %f23, %f6
	.word	0x89a089c6	! t0_kref+0x1880:   	fdivd	%f2, %f6, %f4
	.word	0xd62e401a	! t0_kref+0x1884:   	stb	%o3, [%i1 + %i2]
	.word	0x90600017	! t0_kref+0x1888:   	subc	%g0, %l7, %o0
	.word	0xe656c019	! t0_kref+0x188c:   	ldsh	[%i3 + %i1], %l3
	.word	0xd648a000	! t0_kref+0x1890:   	ldsb	[%g2], %o3
	.word	0xda270019	! t0_kref+0x1894:   	st	%o5, [%i4 + %i1]
	.word	0xa8623d67	! t0_kref+0x1898:   	subc	%o0, -0x299, %l4
	.word	0xdd00a038	! t0_kref+0x189c:   	ld	[%g2 + 0x38], %f14
	.word	0xee4e401a	! t0_kref+0x18a0:   	ldsb	[%i1 + %i2], %l7
	.word	0xc807bfe8	! t0_kref+0x18a4:   	ld	[%fp - 0x18], %g4
	.word	0xa83a7dd9	! t0_kref+0x18a8:   	xnor	%o1, -0x227, %l4
	.word	0xf4360000	! t0_kref+0x18ac:   	sth	%i2, [%i0]
	.word	0xf6a0a038	! t0_kref+0x18b0:   	sta	%i3, [%g2 + 0x38]%asi
	.word	0xe8ce105a	! t0_kref+0x18b4:   	ldsba	[%i0 + %i2]0x82, %l4
	.word	0xdaa8a028	! t0_kref+0x18b8:   	stba	%o5, [%g2 + 0x28]%asi
	.word	0xd288a008	! t0_kref+0x18bc:   	lduba	[%g2 + 8]%asi, %o1
	.word	0x2a800001	! t0_kref+0x18c0:   	bcs,a	_kref+0x18c4
	.word	0x9eb20000	! t0_kref+0x18c4:   	orncc	%o0, %g0, %o7
	.word	0x23480006	! t0_kref+0x18c8:   	fbne,a,pt	%fcc0, _kref+0x18e0
	.word	0x9ba0052b	! t0_kref+0x18cc:   	fsqrts	%f11, %f13
	.word	0x81a1c8b4	! t0_kref+0x18d0:   	fsubs	%f7, %f20, %f0
	.word	0xd0a6101c	! t0_kref+0x18d4:   	sta	%o0, [%i0 + %i4]0x80
	.word	0x81a01a22	! t0_kref+0x18d8:   	fstoi	%f2, %f0
	.word	0xef00a008	! t0_kref+0x18dc:   	ld	[%g2 + 8], %f23
	.word	0x81a10840	! t0_kref+0x18e0:   	faddd	%f4, %f0, %f0
	.word	0xb7a01881	! t0_kref+0x18e4:   	fitos	%f1, %f27
	.word	0xa7003ebb	! t0_kref+0x18e8:   	taddcc	%g0, -0x145, %l3
	.word	0xf82e8019	! t0_kref+0x18ec:   	stb	%i4, [%i2 + %i1]
	.word	0xd91fbc48	! t0_kref+0x18f0:   	ldd	[%fp - 0x3b8], %f12
	.word	0xd44e7feb	! t0_kref+0x18f4:   	ldsb	[%i1 - 0x15], %o2
	.word	0xb7a2c9aa	! t0_kref+0x18f8:   	fdivs	%f11, %f10, %f27
	.word	0x1529dffd	! t0_kref+0x18fc:   	sethi	%hi(0xa77ff400), %o2
	.word	0x81daf376	! t0_kref+0x1900:   	flush	%o3 - 0xc8a
	.word	0x81ab8a48	! t0_kref+0x1904:   	fcmpd	%fcc0, %f14, %f8
	.word	0xc807bfe8	! t0_kref+0x1908:   	ld	[%fp - 0x18], %g4
	.word	0xf007bfe0	! t0_kref+0x190c:   	ld	[%fp - 0x20], %i0
	.word	0x99a6c8a5	! t0_kref+0x1910:   	fsubs	%f27, %f5, %f12
	.word	0x1102a988	! t0_kref+0x1914:   	sethi	%hi(0xaa62000), %o0
	.word	0xd6c0a004	! t0_kref+0x1918:   	ldswa	[%g2 + 4]%asi, %o3
	.word	0x97a00521	! t0_kref+0x191c:   	fsqrts	%f1, %f11
	.word	0x9a06e110	! t0_kref+0x1920:   	add	%i3, 0x110, %o5
	.word	0x87a01a32	! t0_kref+0x1924:   	fstoi	%f18, %f3
	call	SYM(t0_subr1)
	.word	0x94d36d8b	! t0_kref+0x192c:   	umulcc	%o5, 0xd8b, %o2
	.word	0xf8264000	! t0_kref+0x1930:   	st	%i4, [%i1]
	.word	0xed1fbd30	! t0_kref+0x1934:   	ldd	[%fp - 0x2d0], %f22
	.word	0x9a9b677a	! t0_kref+0x1938:   	xorcc	%o5, 0x77a, %o5
	.word	0x8610201f	! t0_kref+0x193c:   	mov	0x1f, %g3
	.word	0x86a0e001	! t0_kref+0x1940:   	subcc	%g3, 1, %g3
	.word	0x22800005	! t0_kref+0x1944:   	be,a	_kref+0x1958
	.word	0xa6ddfd28	! t0_kref+0x1948:   	smulcc	%l7, -0x2d8, %l3
	.word	0xa88e800d	! t0_kref+0x194c:   	andcc	%i2, %o5, %l4
	.word	0x3dbffffc	! t0_kref+0x1950:   	fbule,a	_kref+0x1940
	.word	0xd810a000	! t0_kref+0x1954:   	lduh	[%g2], %o4
	.word	0xe4180019	! t0_kref+0x1958:   	ldd	[%g0 + %i1], %l2
	.word	0x9da088da	! t0_kref+0x195c:   	fsubd	%f2, %f26, %f14
	.word	0x92c5c00d	! t0_kref+0x1960:   	addccc	%l7, %o5, %o1
	.word	0x29480008	! t0_kref+0x1964:   	fbl,a,pt	%fcc0, _kref+0x1984
	.word	0x9a3dc01a	! t0_kref+0x1968:   	xnor	%l7, %i2, %o5
	.word	0xd86e3fe2	! t0_kref+0x196c:   	ldstub	[%i0 - 0x1e], %o4
	.word	0x97a01a34	! t0_kref+0x1970:   	fstoi	%f20, %f11
	.word	0xf207bfe0	! t0_kref+0x1974:   	ld	[%fp - 0x20], %i1
	.word	0x9652fc63	! t0_kref+0x1978:   	umul	%o3, -0x39d, %o3
	.word	0xc1ee500d	! t0_kref+0x197c:   	prefetcha	%i1 + %o5, 0
	.word	0xae420000	! t0_kref+0x1980:   	addc	%o0, %g0, %l7
	.word	0xa8aebeb8	! t0_kref+0x1984:   	andncc	%i2, -0x148, %l4
	.word	0x90fac00c	! t0_kref+0x1988:   	sdivcc	%o3, %o4, %o0
	.word	0x81a509a9	! t0_kref+0x198c:   	fdivs	%f20, %f9, %f0
	.word	0x37480005	! t0_kref+0x1990:   	fbge,a,pt	%fcc0, _kref+0x19a4
	.word	0x8fa288a7	! t0_kref+0x1994:   	fsubs	%f10, %f7, %f7
	.word	0xd4767ff0	! t0_kref+0x1998:   	stx	%o2, [%i1 - 0x10]
	.word	0x9fc00004	! t0_kref+0x199c:   	call	%g0 + %g4
	.word	0xc700a024	! t0_kref+0x19a0:   	ld	[%g2 + 0x24], %f3
	.word	0x29800004	! t0_kref+0x19a4:   	fbl,a	_kref+0x19b4
	.word	0x9b12654d	! t0_kref+0x19a8:   	taddcctv	%o1, 0x54d, %o5
	.word	0x89a01a42	! t0_kref+0x19ac:   	fdtoi	%f2, %f4
	.word	0xb5a01885	! t0_kref+0x19b0:   	fitos	%f5, %f26
	.word	0x9a72401c	! t0_kref+0x19b4:   	udiv	%o1, %i4, %o5
	.word	0xa65a400d	! t0_kref+0x19b8:   	smul	%o1, %o5, %l3
	.word	0x95400000	! t0_kref+0x19bc:   	mov	%y, %o2
	.word	0x13305683	! t0_kref+0x19c0:   	sethi	%hi(0xc15a0c00), %o1
	.word	0xd228a000	! t0_kref+0x19c4:   	stb	%o1, [%g2]
	.word	0xac9ac01c	! t0_kref+0x19c8:   	xorcc	%o3, %i4, %l6
	.word	0x31480002	! t0_kref+0x19cc:   	fba,a,pt	%fcc0, _kref+0x19d4
	.word	0xe580a028	! t0_kref+0x19d0:   	lda	[%g2 + 0x28]%asi, %f18
	.word	0xa63eff3e	! t0_kref+0x19d4:   	xnor	%i3, -0xc2, %l3
	.word	0xae5823f1	! t0_kref+0x19d8:   	smul	%g0, 0x3f1, %l7
	.word	0x39480002	! t0_kref+0x19dc:   	fbuge,a,pt	%fcc0, _kref+0x19e4
	.word	0xe11fbd20	! t0_kref+0x19e0:   	ldd	[%fp - 0x2e0], %f16
	.word	0x2d800004	! t0_kref+0x19e4:   	fbg,a	_kref+0x19f4
	.word	0xaba188af	! t0_kref+0x19e8:   	fsubs	%f6, %f15, %f21
	.word	0x85a50858	! t0_kref+0x19ec:   	faddd	%f20, %f24, %f2
	.word	0x85a0884a	! t0_kref+0x19f0:   	faddd	%f2, %f10, %f2
	.word	0xd43e7fe0	! t0_kref+0x19f4:   	std	%o2, [%i1 - 0x20]
	.word	0x9eb22acb	! t0_kref+0x19f8:   	orncc	%o0, 0xacb, %o7
	.word	0xa7a18829	! t0_kref+0x19fc:   	fadds	%f6, %f9, %f19
	.word	0x9da01a3a	! t0_kref+0x1a00:   	fstoi	%f26, %f14
	.word	0xed1e401d	! t0_kref+0x1a04:   	ldd	[%i1 + %i5], %f22
	.word	0xaba08936	! t0_kref+0x1a08:   	fmuls	%f2, %f22, %f21
	.word	0xeb00a000	! t0_kref+0x1a0c:   	ld	[%g2], %f21
	.word	0xac1b000c	! t0_kref+0x1a10:   	xor	%o4, %o4, %l6
	.word	0xd1bf5a19	! t0_kref+0x1a14:   	stda	%f8, [%i5 + %i1]0xd0
	.word	0x81ad0a42	! t0_kref+0x1a18:   	fcmpd	%fcc0, %f20, %f2
	.word	0xec90a004	! t0_kref+0x1a1c:   	lduha	[%g2 + 4]%asi, %l6
	.word	0xd6266014	! t0_kref+0x1a20:   	st	%o3, [%i1 + 0x14]
	.word	0x3f480001	! t0_kref+0x1a24:   	fbo,a,pt	%fcc0, _kref+0x1a28
	.word	0xa68335a3	! t0_kref+0x1a28:   	addcc	%o4, -0xa5d, %l3
	.word	0xb7a0188c	! t0_kref+0x1a2c:   	fitos	%f12, %f27
	.word	0xec88a028	! t0_kref+0x1a30:   	lduba	[%g2 + 0x28]%asi, %l6
	.word	0x81ae4ab5	! t0_kref+0x1a34:   	fcmpes	%fcc0, %f25, %f21
	.word	0x9ba01a39	! t0_kref+0x1a38:   	fstoi	%f25, %f13
	.word	0xa9a4483b	! t0_kref+0x1a3c:   	fadds	%f17, %f27, %f20
	.word	0x2d480001	! t0_kref+0x1a40:   	fbg,a,pt	%fcc0, _kref+0x1a44
	.word	0xa5a4c9b9	! t0_kref+0x1a44:   	fdivs	%f19, %f25, %f18
	.word	0x96d2296b	! t0_kref+0x1a48:   	umulcc	%o0, 0x96b, %o3
	.word	0xa85b26be	! t0_kref+0x1a4c:   	smul	%o4, 0x6be, %l4
	.word	0x81aa0a4a	! t0_kref+0x1a50:   	fcmpd	%fcc0, %f8, %f10
	.word	0xd0763ff8	! t0_kref+0x1a54:   	stx	%o0, [%i0 - 8]
	.word	0xa5a60846	! t0_kref+0x1a58:   	faddd	%f24, %f6, %f18
	.word	0xae034009	! t0_kref+0x1a5c:   	add	%o5, %o1, %l7
	.word	0xd0be3ff8	! t0_kref+0x1a60:   	stda	%o0, [%i0 - 8]%asi
	.word	0x8da188d8	! t0_kref+0x1a64:   	fsubd	%f6, %f24, %f6
	.word	0xc5380018	! t0_kref+0x1a68:   	std	%f2, [%g0 + %i0]
	.word	0x925f2fcc	! t0_kref+0x1a6c:   	smul	%i4, 0xfcc, %o1
	.word	0xb8103fe8	! t0_kref+0x1a70:   	mov	0xffffffe8, %i4
	.word	0x89a0053a	! t0_kref+0x1a74:   	fsqrts	%f26, %f4
	.word	0xd91fbee0	! t0_kref+0x1a78:   	ldd	[%fp - 0x120], %f12
	.word	0xab702487	! t0_kref+0x1a7c:   	popc	0x487, %l5
	.word	0x81ab8a50	! t0_kref+0x1a80:   	fcmpd	%fcc0, %f14, %f16
	.word	0x9225e9b8	! t0_kref+0x1a84:   	sub	%l7, 0x9b8, %o1
	.word	0x81a88a40	! t0_kref+0x1a88:   	fcmpd	%fcc0, %f2, %f0
	.word	0x27480003	! t0_kref+0x1a8c:   	fbul,a,pt	%fcc0, _kref+0x1a98
	.word	0xf628a029	! t0_kref+0x1a90:   	stb	%i3, [%g2 + 0x29]
	.word	0x9ba00525	! t0_kref+0x1a94:   	fsqrts	%f5, %f13
	.word	0xaf36c01b	! t0_kref+0x1a98:   	srl	%i3, %i3, %l7
	.word	0xdd9e101d	! t0_kref+0x1a9c:   	ldda	[%i0 + %i5]0x80, %f14
	.word	0xa3a3c931	! t0_kref+0x1aa0:   	fmuls	%f15, %f17, %f17
	.word	0xee2e600a	! t0_kref+0x1aa4:   	stb	%l7, [%i1 + 0xa]
	.word	0xeeae7fe3	! t0_kref+0x1aa8:   	stba	%l7, [%i1 - 0x1d]%asi
	.word	0xf420a030	! t0_kref+0x1aac:   	st	%i2, [%g2 + 0x30]
	.word	0xd090a012	! t0_kref+0x1ab0:   	lduha	[%g2 + 0x12]%asi, %o0
	.word	0x9b65a45d	! t0_kref+0x1ab4:   	movneg	%icc, -0x3a3, %o5
	.word	0x38480005	! t0_kref+0x1ab8:   	bgu,a,pt	%icc, _kref+0x1acc
	.word	0x9da01893	! t0_kref+0x1abc:   	fitos	%f19, %f14
	.word	0xba103ff8	! t0_kref+0x1ac0:   	mov	0xfffffff8, %i5
	.word	0x9da308d6	! t0_kref+0x1ac4:   	fsubd	%f12, %f22, %f14
	.word	0x8fa488bb	! t0_kref+0x1ac8:   	fsubs	%f18, %f27, %f7
	.word	0xe36e401d	! t0_kref+0x1acc:   	prefetch	%i1 + %i5, 17
	.word	0xa1a0012e	! t0_kref+0x1ad0:   	fabss	%f14, %f16
	.word	0xaee5c00b	! t0_kref+0x1ad4:   	subccc	%l7, %o3, %l7
	.word	0x3c800001	! t0_kref+0x1ad8:   	bpos,a	_kref+0x1adc
	.word	0x9a1730f5	! t0_kref+0x1adc:   	or	%i4, -0xf0b, %o5
	.word	0xa61a401b	! t0_kref+0x1ae0:   	xor	%o1, %i3, %l3
	.word	0x81a44839	! t0_kref+0x1ae4:   	fadds	%f17, %f25, %f0
	.word	0xb1a00526	! t0_kref+0x1ae8:   	fsqrts	%f6, %f24
	.word	0xc9be584b	! t0_kref+0x1aec:   	stda	%f4, [%i1 + %o3]0xc2
	.word	0x37800003	! t0_kref+0x1af0:   	fbge,a	_kref+0x1afc
	.word	0xcd1fbd00	! t0_kref+0x1af4:   	ldd	[%fp - 0x300], %f6
	.word	0x81ac0a40	! t0_kref+0x1af8:   	fcmpd	%fcc0, %f16, %f0
	.word	0xec4e3fe0	! t0_kref+0x1afc:   	ldsb	[%i0 - 0x20], %l6
	.word	0xa5a64923	! t0_kref+0x1b00:   	fmuls	%f25, %f3, %f18
	.word	0xac423fc5	! t0_kref+0x1b04:   	addc	%o0, -0x3b, %l6
	.word	0x94400009	! t0_kref+0x1b08:   	addc	%g0, %o1, %o2
	.word	0xae527424	! t0_kref+0x1b0c:   	umul	%o1, -0xbdc, %l7
	.word	0xa673401b	! t0_kref+0x1b10:   	udiv	%o5, %i3, %l3
	.word	0xac96801a	! t0_kref+0x1b14:   	orcc	%i2, %i2, %l6
	.word	0xaa16c008	! t0_kref+0x1b18:   	or	%i3, %o0, %l5
	.word	0xeb6e401a	! t0_kref+0x1b1c:   	prefetch	%i1 + %i2, 21
	.word	0x9495e572	! t0_kref+0x1b20:   	orcc	%l7, 0x572, %o2
	.word	0xab370000	! t0_kref+0x1b24:   	srl	%i4, %g0, %l5
	.word	0xa9a00131	! t0_kref+0x1b28:   	fabss	%f17, %f20
	.word	0xd6a0a038	! t0_kref+0x1b2c:   	sta	%o3, [%g2 + 0x38]%asi
	call	SYM(t0_subr2)
	.word	0xe850a016	! t0_kref+0x1b34:   	ldsh	[%g2 + 0x16], %l4
	.word	0x96e2aec7	! t0_kref+0x1b38:   	subccc	%o2, 0xec7, %o3
	.word	0x92b24008	! t0_kref+0x1b3c:   	orncc	%o1, %o0, %o1
	.word	0x81de0017	! t0_kref+0x1b40:   	flush	%i0 + %l7
	.word	0x9642a58c	! t0_kref+0x1b44:   	addc	%o2, 0x58c, %o3
	.word	0x9216c00a	! t0_kref+0x1b48:   	or	%i3, %o2, %o1
	.word	0xa8428009	! t0_kref+0x1b4c:   	addc	%o2, %o1, %l4
	.word	0x8fa000b5	! t0_kref+0x1b50:   	fnegs	%f21, %f7
	.word	0xd688a02f	! t0_kref+0x1b54:   	lduba	[%g2 + 0x2f]%asi, %o3
	.word	0xee16c019	! t0_kref+0x1b58:   	lduh	[%i3 + %i1], %l7
	.word	0xa8983fb1	! t0_kref+0x1b5c:   	xorcc	%g0, -0x4f, %l4
	.word	0xacd5f7a8	! t0_kref+0x1b60:   	umulcc	%l7, -0x858, %l6
	.word	0x9672e7d6	! t0_kref+0x1b64:   	udiv	%o3, 0x7d6, %o3
	.word	0xd4be7ff0	! t0_kref+0x1b68:   	stda	%o2, [%i1 - 0x10]%asi
	.word	0x81dd8004	! t0_kref+0x1b6c:   	flush	%l6 + %g4
	.word	0xb4102010	! t0_kref+0x1b70:   	mov	0x10, %i2
	.word	0x9070001c	! t0_kref+0x1b74:   	udiv	%g0, %i4, %o0
	.word	0xa642c01b	! t0_kref+0x1b78:   	addc	%o3, %i3, %l3
	.word	0x9022c009	! t0_kref+0x1b7c:   	sub	%o3, %o1, %o0
	.word	0xcba0a038	! t0_kref+0x1b80:   	sta	%f5, [%g2 + 0x38]%asi
	.word	0xd8fe7ffc	! t0_kref+0x1b84:   	swapa	[%i1 - 4]%asi, %o4
	.word	0xa875c01a	! t0_kref+0x1b88:   	udiv	%l7, %i2, %l4
	.word	0xc51fbca8	! t0_kref+0x1b8c:   	ldd	[%fp - 0x358], %f2
	.word	0xe11fbd38	! t0_kref+0x1b90:   	ldd	[%fp - 0x2c8], %f16
	.word	0x91a01a2c	! t0_kref+0x1b94:   	fstoi	%f12, %f8
	.word	0x9fa00525	! t0_kref+0x1b98:   	fsqrts	%f5, %f15
	.word	0xd0a8a025	! t0_kref+0x1b9c:   	stba	%o0, [%g2 + 0x25]%asi
	.word	0x91a0003b	! t0_kref+0x1ba0:   	fmovs	%f27, %f8
	.word	0xda90a02e	! t0_kref+0x1ba4:   	lduha	[%g2 + 0x2e]%asi, %o5
	.word	0x86102003	! t0_kref+0x1ba8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1bac:   	bne,a	_kref+0x1bac
	.word	0x86a0e001	! t0_kref+0x1bb0:   	subcc	%g3, 1, %g3
	.word	0xa8c70017	! t0_kref+0x1bb4:   	addccc	%i4, %l7, %l4
	.word	0x98aae317	! t0_kref+0x1bb8:   	andncc	%o3, 0x317, %o4
	.word	0xd0b0a036	! t0_kref+0x1bbc:   	stha	%o0, [%g2 + 0x36]%asi
	.word	0xd2267fec	! t0_kref+0x1bc0:   	st	%o1, [%i1 - 0x14]
	.word	0x988b000a	! t0_kref+0x1bc4:   	andcc	%o4, %o2, %o4
	.word	0x8da00152	! t0_kref+0x1bc8:   	fabsd	%f18, %f6
	.word	0xac26b9e6	! t0_kref+0x1bcc:   	sub	%i2, -0x61a, %l6
	.word	0x95a6894e	! t0_kref+0x1bd0:   	fmuld	%f26, %f14, %f10
	.word	0x2e480002	! t0_kref+0x1bd4:   	bvs,a,pt	%icc, _kref+0x1bdc
	.word	0xed6e401b	! t0_kref+0x1bd8:   	prefetch	%i1 + %i3, 22
	.word	0xf428a006	! t0_kref+0x1bdc:   	stb	%i2, [%g2 + 6]
	.word	0x2c480001	! t0_kref+0x1be0:   	bneg,a,pt	%icc, _kref+0x1be4
	.word	0xe41e7ff0	! t0_kref+0x1be4:   	ldd	[%i1 - 0x10], %l2
	.word	0x94b269ab	! t0_kref+0x1be8:   	orncc	%o1, 0x9ab, %o2
	.word	0x95a00528	! t0_kref+0x1bec:   	fsqrts	%f8, %f10
	.word	0x9fc10000	! t0_kref+0x1bf0:   	call	%g4
	.word	0xea48a032	! t0_kref+0x1bf4:   	ldsb	[%g2 + 0x32], %l5
	.word	0x30480002	! t0_kref+0x1bf8:   	ba,a,pt	%icc, _kref+0x1c00
	.word	0xa682401a	! t0_kref+0x1bfc:   	addcc	%o1, %i2, %l3
	.word	0xab37001a	! t0_kref+0x1c00:   	srl	%i4, %i2, %l5
	.word	0x1f0daf7d	! t0_kref+0x1c04:   	sethi	%hi(0x36bdf400), %o7
	.word	0x93a00020	! t0_kref+0x1c08:   	fmovs	%f0, %f9
	.word	0xa1a01a3a	! t0_kref+0x1c0c:   	fstoi	%f26, %f16
	.word	0x99a000a4	! t0_kref+0x1c10:   	fnegs	%f4, %f12
	.word	0xa9ab8056	! t0_kref+0x1c14:   	fmovdule	%fcc0, %f22, %f20
	.word	0x86102021	! t0_kref+0x1c18:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x1c1c:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x1c20:   	be,a	_kref+0x1c3c
	.word	0xe816600a	! t0_kref+0x1c24:   	lduh	[%i1 + 0xa], %l4
	.word	0xd980a038	! t0_kref+0x1c28:   	lda	[%g2 + 0x38]%asi, %f12
	.word	0xd6266000	! t0_kref+0x1c2c:   	st	%o3, [%i1]
	.word	0xe91fbcf8	! t0_kref+0x1c30:   	ldd	[%fp - 0x308], %f20
	.word	0xb3a5c821	! t0_kref+0x1c34:   	fadds	%f23, %f1, %f25
	.word	0x97614008	! t0_kref+0x1c38:   	movug	%fcc0, %o0, %o3
	.word	0x98b03f95	! t0_kref+0x1c3c:   	orncc	%g0, -0x6b, %o4
	.word	0x922aeaeb	! t0_kref+0x1c40:   	andn	%o3, 0xaeb, %o1
	.word	0xad16800b	! t0_kref+0x1c44:   	taddcctv	%i2, %o3, %l6
	.word	0xec48a01b	! t0_kref+0x1c48:   	ldsb	[%g2 + 0x1b], %l6
	.word	0xa6b2001c	! t0_kref+0x1c4c:   	orncc	%o0, %i4, %l3
	.word	0x9e96f2cc	! t0_kref+0x1c50:   	orcc	%i3, -0xd34, %o7
	.word	0x9ba00520	! t0_kref+0x1c54:   	fsqrts	%f0, %f13
	.word	0xd2866004	! t0_kref+0x1c58:   	lda	[%i1 + 4]%asi, %o1
	.word	0x3f480005	! t0_kref+0x1c5c:   	fbo,a,pt	%fcc0, _kref+0x1c70
	.word	0xd0260000	! t0_kref+0x1c60:   	st	%o0, [%i0]
	.word	0xd3264000	! t0_kref+0x1c64:   	st	%f9, [%i1]
	.word	0xc900a01c	! t0_kref+0x1c68:   	ld	[%g2 + 0x1c], %f4
	.word	0xf11fbfb0	! t0_kref+0x1c6c:   	ldd	[%fp - 0x50], %f24
	.word	0x85a10940	! t0_kref+0x1c70:   	fmuld	%f4, %f0, %f2
	.word	0xb7a0052a	! t0_kref+0x1c74:   	fsqrts	%f10, %f27
	.word	0x9496b595	! t0_kref+0x1c78:   	orcc	%i2, -0xa6b, %o2
	.word	0x33800002	! t0_kref+0x1c7c:   	fbe,a	_kref+0x1c84
	.word	0xaee24000	! t0_kref+0x1c80:   	subccc	%o1, %g0, %l7
	.word	0xaee7001a	! t0_kref+0x1c84:   	subccc	%i4, %i2, %l7
	.word	0xd406201c	! t0_kref+0x1c88:   	ld	[%i0 + 0x1c], %o2
	.word	0xd87e600c	! t0_kref+0x1c8c:   	swap	[%i1 + 0xc], %o4
	.word	0xda48a00a	! t0_kref+0x1c90:   	ldsb	[%g2 + 0xa], %o5
	.word	0xf7a0a018	! t0_kref+0x1c94:   	sta	%f27, [%g2 + 0x18]%asi
	.word	0xada188c4	! t0_kref+0x1c98:   	fsubd	%f6, %f4, %f22
	.word	0x3f800005	! t0_kref+0x1c9c:   	fbo,a	_kref+0x1cb0
	.word	0x9fa00033	! t0_kref+0x1ca0:   	fmovs	%f19, %f15
	.word	0xb1a01893	! t0_kref+0x1ca4:   	fitos	%f19, %f24
	.word	0x1129f9f6	! t0_kref+0x1ca8:   	sethi	%hi(0xa7e7d800), %o0
	.word	0x9a582c11	! t0_kref+0x1cac:   	smul	%g0, 0xc11, %o5
	.word	0x878020d0	! t0_kref+0x1cb0:   	mov	0xd0, %asi
	.word	0x9e46bac1	! t0_kref+0x1cb4:   	addc	%i2, -0x53f, %o7
	.word	0xf207bfe0	! t0_kref+0x1cb8:   	ld	[%fp - 0x20], %i1
	.word	0x29800006	! t0_kref+0x1cbc:   	fbl,a	_kref+0x1cd4
	.word	0xd476401d	! t0_kref+0x1cc0:   	stx	%o2, [%i1 + %i5]
	.word	0xd8262014	! t0_kref+0x1cc4:   	st	%o4, [%i0 + 0x14]
	.word	0xa88ac00b	! t0_kref+0x1cc8:   	andcc	%o3, %o3, %l4
	.word	0x9ba01a40	! t0_kref+0x1ccc:   	fdtoi	%f0, %f13
	.word	0xa1a01a37	! t0_kref+0x1cd0:   	fstoi	%f23, %f16
	.word	0xd1262018	! t0_kref+0x1cd4:   	st	%f8, [%i0 + 0x18]
	.word	0x1b3c58a7	! t0_kref+0x1cd8:   	sethi	%hi(0xf1629c00), %o5
	.word	0x9632c008	! t0_kref+0x1cdc:   	orn	%o3, %o0, %o3
	.word	0x2b800001	! t0_kref+0x1ce0:   	fbug,a	_kref+0x1ce4
	.word	0xdd3e6000	! t0_kref+0x1ce4:   	std	%f14, [%i1]
	.word	0x81ae0a58	! t0_kref+0x1ce8:   	fcmpd	%fcc0, %f24, %f24
	sethi	%hi(2f), %o7
	.word	0xe40be10c	! t0_kref+0x1cf0:   	ldub	[%o7 + 0x10c], %l2
	.word	0xa41ca00c	! t0_kref+0x1cf4:   	xor	%l2, 0xc, %l2
	.word	0xe42be10c	! t0_kref+0x1cf8:   	stb	%l2, [%o7 + 0x10c]
	.word	0x81dbe10c	! t0_kref+0x1cfc:   	flush	%o7 + 0x10c
	.word	0x81a4492c	! t0_kref+0x1d00:   	fmuls	%f17, %f12, %f0
	call	SYM(t0_subr2)
	.word	0xa623401a	! t0_kref+0x1d08:   	sub	%o5, %i2, %l3
2:	.word	0x9a5f26a9	! t0_kref+0x1d0c:   	smul	%i4, 0x6a9, %o5
	.word	0xda164000	! t0_kref+0x1d10:   	lduh	[%i1], %o5
	.word	0x81aa8aa6	! t0_kref+0x1d14:   	fcmpes	%fcc0, %f10, %f6
	.word	0xa9a50d27	! t0_kref+0x1d18:   	fsmuld	%f20, %f7, %f20
	.word	0x9615c00a	! t0_kref+0x1d1c:   	or	%l7, %o2, %o3
	sethi	%hi(2f), %o7
	.word	0xe40be138	! t0_kref+0x1d24:   	ldub	[%o7 + 0x138], %l2
	.word	0xa41ca00c	! t0_kref+0x1d28:   	xor	%l2, 0xc, %l2
	.word	0xe42be138	! t0_kref+0x1d2c:   	stb	%l2, [%o7 + 0x138]
	.word	0x81dbe138	! t0_kref+0x1d30:   	flush	%o7 + 0x138
	.word	0x25800008	! t0_kref+0x1d34:   	fblg,a	_kref+0x1d54
2:	.word	0x83a5c830	! t0_kref+0x1d38:   	fadds	%f23, %f16, %f1
	.word	0x95a0188c	! t0_kref+0x1d3c:   	fitos	%f12, %f10
	.word	0xb7a20832	! t0_kref+0x1d40:   	fadds	%f8, %f18, %f27
	.word	0xe36e401a	! t0_kref+0x1d44:   	prefetch	%i1 + %i2, 17
	.word	0x3d800005	! t0_kref+0x1d48:   	fbule,a	_kref+0x1d5c
	.word	0xd000a038	! t0_kref+0x1d4c:   	ld	[%g2 + 0x38], %o0
	.word	0x91a01885	! t0_kref+0x1d50:   	fitos	%f5, %f8
	.word	0xec3e7fe0	! t0_kref+0x1d54:   	std	%l6, [%i1 - 0x20]
	.word	0xa81f27a1	! t0_kref+0x1d58:   	xor	%i4, 0x7a1, %l4
	.word	0xd3801019	! t0_kref+0x1d5c:   	lda	[%g0 + %i1]0x80, %f9
	.word	0x30800002	! t0_kref+0x1d60:   	ba,a	_kref+0x1d68
	.word	0xd410a008	! t0_kref+0x1d64:   	lduh	[%g2 + 8], %o2
	.word	0x27800006	! t0_kref+0x1d68:   	fbul,a	_kref+0x1d80
	.word	0xa8aebacd	! t0_kref+0x1d6c:   	andncc	%i2, -0x533, %l4
	.word	0x85a2093b	! t0_kref+0x1d70:   	fmuls	%f8, %f27, %f2
	.word	0xd2480018	! t0_kref+0x1d74:   	ldsb	[%g0 + %i0], %o1
	.word	0x961b400a	! t0_kref+0x1d78:   	xor	%o5, %o2, %o3
	.word	0x83a649b6	! t0_kref+0x1d7c:   	fdivs	%f25, %f22, %f1
	.word	0x2a480001	! t0_kref+0x1d80:   	bcs,a,pt	%icc, _kref+0x1d84
	.word	0x91400000	! t0_kref+0x1d84:   	mov	%y, %o0
	.word	0x933aa01e	! t0_kref+0x1d88:   	sra	%o2, 0x1e, %o1
	.word	0x25480004	! t0_kref+0x1d8c:   	fblg,a,pt	%fcc0, _kref+0x1d9c
	.word	0xd436401b	! t0_kref+0x1d90:   	sth	%o2, [%i1 + %i3]
	.word	0xda10a030	! t0_kref+0x1d94:   	lduh	[%g2 + 0x30], %o5
	.word	0x925eaff5	! t0_kref+0x1d98:   	smul	%i2, 0xff5, %o1
	.word	0xf007bfe0	! t0_kref+0x1d9c:   	ld	[%fp - 0x20], %i0
	.word	0xae8aed2d	! t0_kref+0x1da0:   	andcc	%o3, 0xd2d, %l7
	.word	0xf6b65000	! t0_kref+0x1da4:   	stha	%i3, [%i1]0x80
	.word	0xa63367c2	! t0_kref+0x1da8:   	orn	%o5, 0x7c2, %l3
	.word	0xc07e3ff8	! t0_kref+0x1dac:   	swap	[%i0 - 8], %g0
	.word	0xa7a01887	! t0_kref+0x1db0:   	fitos	%f7, %f19
	.word	0x2b056eda	! t0_kref+0x1db4:   	sethi	%hi(0x15bb6800), %l5
	.word	0x81ac8ab4	! t0_kref+0x1db8:   	fcmpes	%fcc0, %f18, %f20
	.word	0xea40a030	! t0_kref+0x1dbc:   	ldsw	[%g2 + 0x30], %l5
	.word	0x9da68d37	! t0_kref+0x1dc0:   	fsmuld	%f26, %f23, %f14
	.word	0x38800007	! t0_kref+0x1dc4:   	bgu,a	_kref+0x1de0
	.word	0xa692401b	! t0_kref+0x1dc8:   	orcc	%o1, %i3, %l3
	.word	0xa1a688d4	! t0_kref+0x1dcc:   	fsubd	%f26, %f20, %f16
	.word	0x85a388c8	! t0_kref+0x1dd0:   	fsubd	%f14, %f8, %f2
	.word	0x9215f148	! t0_kref+0x1dd4:   	or	%l7, -0xeb8, %o1
	.word	0xa8580008	! t0_kref+0x1dd8:   	smul	%g0, %o0, %l4
	.word	0xe1264000	! t0_kref+0x1ddc:   	st	%f16, [%i1]
	.word	0xba103ff8	! t0_kref+0x1de0:   	mov	0xfffffff8, %i5
	.word	0x9133201a	! t0_kref+0x1de4:   	srl	%o4, 0x1a, %o0
	.word	0x9f400000	! t0_kref+0x1de8:   	mov	%y, %o7
	.word	0x151afe5a	! t0_kref+0x1dec:   	sethi	%hi(0x6bf96800), %o2
	.word	0x91a00526	! t0_kref+0x1df0:   	fsqrts	%f6, %f8
	.word	0x8143c000	! t0_kref+0x1df4:   	stbar
	.word	0xe9f65008	! t0_kref+0x1df8:   	casxa	[%i1]0x80, %o0, %l4
	.word	0x8143c000	! t0_kref+0x1dfc:   	stbar
	.word	0xe840a00c	! t0_kref+0x1e00:   	ldsw	[%g2 + 0xc], %l4
	.word	0x81a80a58	! t0_kref+0x1e04:   	fcmpd	%fcc0, %f0, %f24
	.word	0xafa018c0	! t0_kref+0x1e08:   	fdtos	%f0, %f23
	.word	0xec163ffc	! t0_kref+0x1e0c:   	lduh	[%i0 - 4], %l6
	.word	0x963b2b16	! t0_kref+0x1e10:   	xnor	%o4, 0xb16, %o3
	.word	0xa876801c	! t0_kref+0x1e14:   	udiv	%i2, %i4, %l4
	.word	0xada28954	! t0_kref+0x1e18:   	fmuld	%f10, %f20, %f22
	.word	0x90972bc9	! t0_kref+0x1e1c:   	orcc	%i4, 0xbc9, %o0
	.word	0xc9ee501c	! t0_kref+0x1e20:   	prefetcha	%i1 + %i4, 4
	.word	0x925df7ad	! t0_kref+0x1e24:   	smul	%l7, -0x853, %o1
	.word	0x81a589b9	! t0_kref+0x1e28:   	fdivs	%f22, %f25, %f0
	.word	0x39480008	! t0_kref+0x1e2c:   	fbuge,a,pt	%fcc0, _kref+0x1e4c
	.word	0xcb262004	! t0_kref+0x1e30:   	st	%f5, [%i0 + 4]
	.word	0x29800007	! t0_kref+0x1e34:   	fbl,a	_kref+0x1e50
	.word	0x97400000	! t0_kref+0x1e38:   	mov	%y, %o3
	.word	0x943b401b	! t0_kref+0x1e3c:   	xnor	%o5, %i3, %o2
	.word	0x81ab8a54	! t0_kref+0x1e40:   	fcmpd	%fcc0, %f14, %f20
	.word	0xc900a038	! t0_kref+0x1e44:   	ld	[%g2 + 0x38], %f4
	.word	0x90427b39	! t0_kref+0x1e48:   	addc	%o1, -0x4c7, %o0
	.word	0x25800007	! t0_kref+0x1e4c:   	fblg,a	_kref+0x1e68
	.word	0x2f319b17	! t0_kref+0x1e50:   	sethi	%hi(0xc66c5c00), %l7
	.word	0xea08a035	! t0_kref+0x1e54:   	ldub	[%g2 + 0x35], %l5
	.word	0xa9a0104a	! t0_kref+0x1e58:   	fdtox	%f10, %f20
	.word	0x81ae8a5a	! t0_kref+0x1e5c:   	fcmpd	%fcc0, %f26, %f26
	.word	0x9e8dc00d	! t0_kref+0x1e60:   	andcc	%l7, %o5, %o7
	.word	0xd630a020	! t0_kref+0x1e64:   	sth	%o3, [%g2 + 0x20]
	.word	0xd02e8018	! t0_kref+0x1e68:   	stb	%o0, [%i2 + %i0]
	.word	0xebee501b	! t0_kref+0x1e6c:   	prefetcha	%i1 + %i3, 21
	.word	0x989abbad	! t0_kref+0x1e70:   	xorcc	%o2, -0x453, %o4
	.word	0xada08927	! t0_kref+0x1e74:   	fmuls	%f2, %f7, %f22
	.word	0x9de3bfa0	! t0_kref+0x1e78:   	save	%sp, -0x60, %sp
	.word	0xb6b64000	! t0_kref+0x1e7c:   	orncc	%i1, %g0, %i3
	.word	0x97eef2c5	! t0_kref+0x1e80:   	restore	%i3, -0xd3b, %o3
	.word	0x26800004	! t0_kref+0x1e84:   	bl,a	_kref+0x1e94
	.word	0x96c6801b	! t0_kref+0x1e88:   	addccc	%i2, %i3, %o3
	.word	0xd400a028	! t0_kref+0x1e8c:   	ld	[%g2 + 0x28], %o2
	.word	0x94e2c01a	! t0_kref+0x1e90:   	subccc	%o3, %i2, %o2
	.word	0xa61a74bf	! t0_kref+0x1e94:   	xor	%o1, -0xb41, %l3
	.word	0x21800005	! t0_kref+0x1e98:   	fbn,a	_kref+0x1eac
	.word	0x9da149ba	! t0_kref+0x1e9c:   	fdivs	%f5, %f26, %f14
	.word	0x8da388c8	! t0_kref+0x1ea0:   	fsubd	%f14, %f8, %f6
	.word	0xac67228d	! t0_kref+0x1ea4:   	subc	%i4, 0x28d, %l6
	.word	0x99a00030	! t0_kref+0x1ea8:   	fmovs	%f16, %f12
	.word	0xa9a01a3a	! t0_kref+0x1eac:   	fstoi	%f26, %f20
	.word	0xa862e76b	! t0_kref+0x1eb0:   	subc	%o3, 0x76b, %l4
	.word	0xafa01096	! t0_kref+0x1eb4:   	fxtos	%f22, %f23
	.word	0xd220a000	! t0_kref+0x1eb8:   	st	%o1, [%g2]
	.word	0xe51e4000	! t0_kref+0x1ebc:   	ldd	[%i1], %f18
	.word	0x9e6325ff	! t0_kref+0x1ec0:   	subc	%o4, 0x5ff, %o7
	.word	0xd600a008	! t0_kref+0x1ec4:   	ld	[%g2 + 8], %o3
	.word	0x9a12800b	! t0_kref+0x1ec8:   	or	%o2, %o3, %o5
	.word	0xa5a68844	! t0_kref+0x1ecc:   	faddd	%f26, %f4, %f18
	.word	0x31800004	! t0_kref+0x1ed0:   	fba,a	_kref+0x1ee0
	.word	0x95a01080	! t0_kref+0x1ed4:   	fxtos	%f0, %f10
	.word	0xd11e3fe8	! t0_kref+0x1ed8:   	ldd	[%i0 - 0x18], %f8
	.word	0xa8fb7272	! t0_kref+0x1edc:   	sdivcc	%o5, -0xd8e, %l4
	.word	0xd428a004	! t0_kref+0x1ee0:   	stb	%o2, [%g2 + 4]
	.word	0x928ac00c	! t0_kref+0x1ee4:   	andcc	%o3, %o4, %o1
	.word	0xae9333c3	! t0_kref+0x1ee8:   	orcc	%o4, -0xc3d, %l7
	.word	0xe7262000	! t0_kref+0x1eec:   	st	%f19, [%i0]
	.word	0x9e924017	! t0_kref+0x1ef0:   	orcc	%o1, %l7, %o7
	.word	0x22800008	! t0_kref+0x1ef4:   	be,a	_kref+0x1f14
	.word	0x89a0104a	! t0_kref+0x1ef8:   	fdtox	%f10, %f4
	.word	0x3f480001	! t0_kref+0x1efc:   	fbo,a,pt	%fcc0, _kref+0x1f00
	.word	0x96a00008	! t0_kref+0x1f00:   	subcc	%g0, %o0, %o3
	.word	0xc807bff0	! t0_kref+0x1f04:   	ld	[%fp - 0x10], %g4
	.word	0xac42c00c	! t0_kref+0x1f08:   	addc	%o3, %o4, %l6
	.word	0x20800002	! t0_kref+0x1f0c:   	bn,a	_kref+0x1f14
	.word	0x94122bd0	! t0_kref+0x1f10:   	or	%o0, 0xbd0, %o2
	.word	0xab3ac01a	! t0_kref+0x1f14:   	sra	%o3, %i2, %l5
	.word	0xd830a032	! t0_kref+0x1f18:   	sth	%o4, [%g2 + 0x32]
	.word	0xe16e001a	! t0_kref+0x1f1c:   	prefetch	%i0 + %i2, 16
	.word	0x31800005	! t0_kref+0x1f20:   	fba,a	_kref+0x1f34
	.word	0xcf86105c	! t0_kref+0x1f24:   	lda	[%i0 + %i4]0x82, %f7
	.word	0xa822c01b	! t0_kref+0x1f28:   	sub	%o3, %i3, %l4
	.word	0x95a01040	! t0_kref+0x1f2c:   	fdtox	%f0, %f10
	.word	0x81da2444	! t0_kref+0x1f30:   	flush	%o0 + 0x444
	.word	0xee56001b	! t0_kref+0x1f34:   	ldsh	[%i0 + %i3], %l7
	.word	0x85a0192f	! t0_kref+0x1f38:   	fstod	%f15, %f2
	.word	0x9412001c	! t0_kref+0x1f3c:   	or	%o0, %i4, %o2
	.word	0xda5e2018	! t0_kref+0x1f40:   	ldx	[%i0 + 0x18], %o5
	.word	0x2712c37b	! t0_kref+0x1f44:   	sethi	%hi(0x4b0dec00), %l3
	.word	0x90af000b	! t0_kref+0x1f48:   	andncc	%i4, %o3, %o0
	.word	0xa842a047	! t0_kref+0x1f4c:   	addc	%o2, 0x47, %l4
	.word	0xd99e5a5c	! t0_kref+0x1f50:   	ldda	[%i1 + %i4]0xd2, %f12
	.word	0xada0188b	! t0_kref+0x1f54:   	fitos	%f11, %f22
	.word	0x9e26800c	! t0_kref+0x1f58:   	sub	%i2, %o4, %o7
	.word	0xd51e001d	! t0_kref+0x1f5c:   	ldd	[%i0 + %i5], %f10
	call	SYM(t0_subr3)
	.word	0x1108b250	! t0_kref+0x1f64:   	sethi	%hi(0x22c94000), %o0
	.word	0xd11fbd50	! t0_kref+0x1f68:   	ldd	[%fp - 0x2b0], %f8
	.word	0xafa648b9	! t0_kref+0x1f6c:   	fsubs	%f25, %f25, %f23
	.word	0xf820a03c	! t0_kref+0x1f70:   	st	%i4, [%g2 + 0x3c]
	.word	0x27480001	! t0_kref+0x1f74:   	fbul,a,pt	%fcc0, _kref+0x1f78
	.word	0x9442c01b	! t0_kref+0x1f78:   	addc	%o3, %i3, %o2
	.word	0x95400000	! t0_kref+0x1f7c:   	mov	%y, %o2
	.word	0xd43e6000	! t0_kref+0x1f80:   	std	%o2, [%i1]
	.word	0xa1a01033	! t0_kref+0x1f84:   	fstox	%f19, %f16
	.word	0xa8c3001c	! t0_kref+0x1f88:   	addccc	%o4, %i4, %l4
	.word	0xd4366004	! t0_kref+0x1f8c:   	sth	%o2, [%i1 + 4]
	.word	0xd0767ff0	! t0_kref+0x1f90:   	stx	%o0, [%i1 - 0x10]
	.word	0xe01f4005	! t0_kref+0x1f94:   	ldd	[%i5 + %g5], %l0
	.word	0x9e63401a	! t0_kref+0x1f98:   	subc	%o5, %i2, %o7
	.word	0xde066004	! t0_kref+0x1f9c:   	ld	[%i1 + 4], %o7
	.word	0xd51e0000	! t0_kref+0x1fa0:   	ldd	[%i0], %f10
	.word	0xa8568000	! t0_kref+0x1fa4:   	umul	%i2, %g0, %l4
	.word	0x968b4017	! t0_kref+0x1fa8:   	andcc	%o5, %l7, %o3
	.word	0xa68e800b	! t0_kref+0x1fac:   	andcc	%i2, %o3, %l3
	sethi	%hi(2f), %o7
	.word	0xe40be3c8	! t0_kref+0x1fb4:   	ldub	[%o7 + 0x3c8], %l2
	.word	0xa41ca00c	! t0_kref+0x1fb8:   	xor	%l2, 0xc, %l2
	.word	0xe42be3c8	! t0_kref+0x1fbc:   	stb	%l2, [%o7 + 0x3c8]
	.word	0x81dbe3c8	! t0_kref+0x1fc0:   	flush	%o7 + 0x3c8
	.word	0xa3a01a33	! t0_kref+0x1fc4:   	fstoi	%f19, %f17
2:	.word	0x96d826c0	! t0_kref+0x1fc8:   	smulcc	%g0, 0x6c0, %o3
	.word	0xe64e7fed	! t0_kref+0x1fcc:   	ldsb	[%i1 - 0x13], %l3
	.word	0x81a94aa6	! t0_kref+0x1fd0:   	fcmpes	%fcc0, %f5, %f6
	.word	0xae8deec1	! t0_kref+0x1fd4:   	andcc	%l7, 0xec1, %l7
	.word	0xac05c00c	! t0_kref+0x1fd8:   	add	%l7, %o4, %l6
	.word	0x001fffff	! t0_kref+0x1fdc:   	illtrap	0x1fffff
	.word	0xd6080019	! t0_kref+0x1fe0:   	ldub	[%g0 + %i1], %o3
	.word	0xd210a004	! t0_kref+0x1fe4:   	lduh	[%g2 + 4], %o1
	.word	0xa646801c	! t0_kref+0x1fe8:   	addc	%i2, %i4, %l3
	.word	0x8582800d	! t0_kref+0x1fec:   	wr	%o2, %o5, %ccr
	.word	0xe64e7ff5	! t0_kref+0x1ff0:   	ldsb	[%i1 - 0xb], %l3
	.word	0x90c34008	! t0_kref+0x1ff4:   	addccc	%o5, %o0, %o0
	.word	0xf700a014	! t0_kref+0x1ff8:   	ld	[%g2 + 0x14], %f27
	.word	0xf428a03d	! t0_kref+0x1ffc:   	stb	%i2, [%g2 + 0x3d]
	.word	0xee10a030	! t0_kref+0x2000:   	lduh	[%g2 + 0x30], %l7
	.word	0x99a38854	! t0_kref+0x2004:   	faddd	%f14, %f20, %f12
	.word	0x81da400b	! t0_kref+0x2008:   	flush	%o1 + %o3
	.word	0xa9120017	! t0_kref+0x200c:   	taddcctv	%o0, %l7, %l4
	.word	0x9fc00004	! t0_kref+0x2010:   	call	%g0 + %g4
	.word	0x93a1c92f	! t0_kref+0x2014:   	fmuls	%f7, %f15, %f9
	.word	0xec164000	! t0_kref+0x2018:   	lduh	[%i1], %l6
	.word	0x86102003	! t0_kref+0x201c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x2020:   	bne,a	_kref+0x2020
	.word	0x86a0e001	! t0_kref+0x2024:   	subcc	%g3, 1, %g3
	.word	0xb7a00130	! t0_kref+0x2028:   	fabss	%f16, %f27
	.word	0xd620a03c	! t0_kref+0x202c:   	st	%o3, [%g2 + 0x3c]
	.word	0xa65f27f1	! t0_kref+0x2030:   	smul	%i4, 0x7f1, %l3
	.word	0xc9be1840	! t0_kref+0x2034:   	stda	%f4, [%i0]0xc2
	.word	0x95a018d2	! t0_kref+0x2038:   	fdtos	%f18, %f10
	.word	0xae1365c6	! t0_kref+0x203c:   	or	%o5, 0x5c6, %l7
	.word	0xd100a008	! t0_kref+0x2040:   	ld	[%g2 + 8], %f8
	.word	0x9fc10000	! t0_kref+0x2044:   	call	%g4
	.word	0xcd380019	! t0_kref+0x2048:   	std	%f6, [%g0 + %i1]
	.word	0xd040a030	! t0_kref+0x204c:   	ldsw	[%g2 + 0x30], %o0
	.word	0xae9f263c	! t0_kref+0x2050:   	xorcc	%i4, 0x63c, %l7
	.word	0xae42401b	! t0_kref+0x2054:   	addc	%o1, %i3, %l7
	.word	0xd608a031	! t0_kref+0x2058:   	ldub	[%g2 + 0x31], %o3
	.word	0xda280018	! t0_kref+0x205c:   	stb	%o5, [%g0 + %i0]
	.word	0x960374c5	! t0_kref+0x2060:   	add	%o5, -0xb3b, %o3
	.word	0xd828a029	! t0_kref+0x2064:   	stb	%o4, [%g2 + 0x29]
	.word	0x923df112	! t0_kref+0x2068:   	xnor	%l7, -0xeee, %o1
	.word	0x23480008	! t0_kref+0x206c:   	fbne,a,pt	%fcc0, _kref+0x208c
	.word	0xc020a030	! t0_kref+0x2070:   	clr	[%g2 + 0x30]
	.word	0xd220a02c	! t0_kref+0x2074:   	st	%o1, [%g2 + 0x2c]
	.word	0xac62edb6	! t0_kref+0x2078:   	subc	%o3, 0xdb6, %l6
	.word	0xd65e7fe8	! t0_kref+0x207c:   	ldx	[%i1 - 0x18], %o3
	.word	0x9ba018d8	! t0_kref+0x2080:   	fdtos	%f24, %f13
	.word	0x81a000ac	! t0_kref+0x2084:   	fnegs	%f12, %f0
	.word	0xa606c008	! t0_kref+0x2088:   	add	%i3, %o0, %l3
	.word	0xcd262014	! t0_kref+0x208c:   	st	%f6, [%i0 + 0x14]
	.word	0x99a0104a	! t0_kref+0x2090:   	fdtox	%f10, %f12
	.word	0xc0280018	! t0_kref+0x2094:   	clrb	[%g0 + %i0]
	.word	0x81ad4aa5	! t0_kref+0x2098:   	fcmpes	%fcc0, %f21, %f5
	.word	0x24480005	! t0_kref+0x209c:   	ble,a,pt	%icc, _kref+0x20b0
	.word	0x963dfb5b	! t0_kref+0x20a0:   	xnor	%l7, -0x4a5, %o3
	.word	0x81aa0aaf	! t0_kref+0x20a4:   	fcmpes	%fcc0, %f8, %f15
	.word	0x27480006	! t0_kref+0x20a8:   	fbul,a,pt	%fcc0, _kref+0x20c0
	.word	0xd800a030	! t0_kref+0x20ac:   	ld	[%g2 + 0x30], %o4
	.word	0x968b400c	! t0_kref+0x20b0:   	andcc	%o5, %o4, %o3
	.word	0x31800002	! t0_kref+0x20b4:   	fba,a	_kref+0x20bc
	.word	0x89a048b8	! t0_kref+0x20b8:   	fsubs	%f1, %f24, %f4
	.word	0xc807bfe8	! t0_kref+0x20bc:   	ld	[%fp - 0x18], %g4
	.word	0xc5b81019	! t0_kref+0x20c0:   	stda	%f2, [%g0 + %i1]0x80
	.word	0x81dc0015	! t0_kref+0x20c4:   	flush	%l0 + %l5
	.word	0x9da58940	! t0_kref+0x20c8:   	fmuld	%f22, %f0, %f14
	.word	0xa9a00525	! t0_kref+0x20cc:   	fsqrts	%f5, %f20
	.word	0x81aacab8	! t0_kref+0x20d0:   	fcmpes	%fcc0, %f11, %f24
	.word	0xc1be6000	! t0_kref+0x20d4:   	stda	%f0, [%i1]%asi
	.word	0xae0371bb	! t0_kref+0x20d8:   	add	%o5, -0xe45, %l7
	.word	0xa80ab38e	! t0_kref+0x20dc:   	and	%o2, -0xc72, %l4
	.word	0x9fc10000	! t0_kref+0x20e0:   	call	%g4
	.word	0xd028a032	! t0_kref+0x20e4:   	stb	%o0, [%g2 + 0x32]
	.word	0xe96e6018	! t0_kref+0x20e8:   	prefetch	%i1 + 0x18, 20
	.word	0xac46801a	! t0_kref+0x20ec:   	addc	%i2, %i2, %l6
	.word	0x81d80009	! t0_kref+0x20f0:   	flush	%g0 + %o1
	.word	0xee08a03f	! t0_kref+0x20f4:   	ldub	[%g2 + 0x3f], %l7
	.word	0x9a500017	! t0_kref+0x20f8:   	umul	%g0, %l7, %o5
	.word	0xda7e001c	! t0_kref+0x20fc:   	swap	[%i0 + %i4], %o5
	.word	0xa5a01886	! t0_kref+0x2100:   	fitos	%f6, %f18
	.word	0x9da000b8	! t0_kref+0x2104:   	fnegs	%f24, %f14
	.word	0x985328b7	! t0_kref+0x2108:   	umul	%o4, 0x8b7, %o4
	.word	0xd808a00f	! t0_kref+0x210c:   	ldub	[%g2 + 0xf], %o4
	.word	0x89a01935	! t0_kref+0x2110:   	fstod	%f21, %f4
	.word	0x96f2a5a6	! t0_kref+0x2114:   	udivcc	%o2, 0x5a6, %o3
	.word	0x9a52b9fc	! t0_kref+0x2118:   	umul	%o2, -0x604, %o5
	.word	0xd430a030	! t0_kref+0x211c:   	sth	%o2, [%g2 + 0x30]
	.word	0x22800007	! t0_kref+0x2120:   	be,a	_kref+0x213c
	.word	0xb5a01a36	! t0_kref+0x2124:   	fstoi	%f22, %f26
	.word	0xa93a2011	! t0_kref+0x2128:   	sra	%o0, 0x11, %l4
	.word	0x9fc70000	! t0_kref+0x212c:   	call	%i4
	.word	0xa1a000ab	! t0_kref+0x2130:   	fnegs	%f11, %f16
	.word	0xa87b70b7	! t0_kref+0x2134:   	sdiv	%o5, -0xf49, %l4
	.word	0x9da389c8	! t0_kref+0x2138:   	fdivd	%f14, %f8, %f14
	.word	0xf6a6501c	! t0_kref+0x213c:   	sta	%i3, [%i1 + %i4]0x80
	.word	0xf628a028	! t0_kref+0x2140:   	stb	%i3, [%g2 + 0x28]
	.word	0x25480005	! t0_kref+0x2144:   	fblg,a,pt	%fcc0, _kref+0x2158
	.word	0xc93e3ff8	! t0_kref+0x2148:   	std	%f4, [%i0 - 8]
	.word	0xb5a00032	! t0_kref+0x214c:   	fmovs	%f18, %f26
	.word	0x94c2ff3e	! t0_kref+0x2150:   	addccc	%o3, -0xc2, %o2
	.word	0xada00140	! t0_kref+0x2154:   	fabsd	%f0, %f22
	.word	0x900ac000	! t0_kref+0x2158:   	and	%o3, %g0, %o0
	.word	0x9ec6c01b	! t0_kref+0x215c:   	addccc	%i3, %i3, %o7
	.word	0x90434008	! t0_kref+0x2160:   	addc	%o5, %o0, %o0
	.word	0xe51fbf90	! t0_kref+0x2164:   	ldd	[%fp - 0x70], %f18
	.word	0xa3a01a52	! t0_kref+0x2168:   	fdtoi	%f18, %f17
	.word	0x87a00535	! t0_kref+0x216c:   	fsqrts	%f21, %f3
	.word	0xb1a01a22	! t0_kref+0x2170:   	fstoi	%f2, %f24
	.word	0x9a5223d0	! t0_kref+0x2174:   	umul	%o0, 0x3d0, %o5
	.word	0xae72800d	! t0_kref+0x2178:   	udiv	%o2, %o5, %l7
	.word	0xde48a000	! t0_kref+0x217c:   	ldsb	[%g2], %o7
	.word	0xc3267ff8	! t0_kref+0x2180:   	st	%f1, [%i1 - 8]
	.word	0xe6560000	! t0_kref+0x2184:   	ldsh	[%i0], %l3
	.word	0xa7a54838	! t0_kref+0x2188:   	fadds	%f21, %f24, %f19
	.word	0x99a00030	! t0_kref+0x218c:   	fmovs	%f16, %f12
	.word	0xa8f6acf3	! t0_kref+0x2190:   	udivcc	%i2, 0xcf3, %l4
	.word	0xd43e3ff0	! t0_kref+0x2194:   	std	%o2, [%i0 - 0x10]
	.word	0x9333000c	! t0_kref+0x2198:   	srl	%o4, %o4, %o1
	.word	0xa882800b	! t0_kref+0x219c:   	addcc	%o2, %o3, %l4
	.word	0xda28a032	! t0_kref+0x21a0:   	stb	%o5, [%g2 + 0x32]
	.word	0xada08850	! t0_kref+0x21a4:   	faddd	%f2, %f16, %f22
	.word	0x81ac8ab7	! t0_kref+0x21a8:   	fcmpes	%fcc0, %f18, %f23
	.word	0xa5a10d2d	! t0_kref+0x21ac:   	fsmuld	%f4, %f13, %f18
	.word	0x96fec00a	! t0_kref+0x21b0:   	sdivcc	%i3, %o2, %o3
	.word	0x95a009b4	! t0_kref+0x21b4:   	fdivs	%f0, %f20, %f10
	.word	0x86102003	! t0_kref+0x21b8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x21bc:   	bne,a	_kref+0x21bc
	.word	0x86a0e001	! t0_kref+0x21c0:   	subcc	%g3, 1, %g3
	.word	0xa5a000ca	! t0_kref+0x21c4:   	fnegd	%f10, %f18
	.word	0x9fa189af	! t0_kref+0x21c8:   	fdivs	%f6, %f15, %f15
	.word	0xe850a00c	! t0_kref+0x21cc:   	ldsh	[%g2 + 0xc], %l4
	.word	0x81ad0a42	! t0_kref+0x21d0:   	fcmpd	%fcc0, %f20, %f2
	.word	0xaaf331a9	! t0_kref+0x21d4:   	udivcc	%o4, -0xe57, %l5
	.word	0xaeab3f17	! t0_kref+0x21d8:   	andncc	%o4, -0xe9, %l7
	.word	0xdd1fbf20	! t0_kref+0x21dc:   	ldd	[%fp - 0xe0], %f14
	.word	0x9852400c	! t0_kref+0x21e0:   	umul	%o1, %o4, %o4
	.word	0xb3a6c839	! t0_kref+0x21e4:   	fadds	%f27, %f25, %f25
	.word	0x96d6e64f	! t0_kref+0x21e8:   	umulcc	%i3, 0x64f, %o3
	.word	0x90782da2	! t0_kref+0x21ec:   	sdiv	%g0, 0xda2, %o0
	.word	0x921a400d	! t0_kref+0x21f0:   	xor	%o1, %o5, %o1
	.word	0x81ab8a54	! t0_kref+0x21f4:   	fcmpd	%fcc0, %f14, %f20
	.word	0x81da8000	! t0_kref+0x21f8:   	flush	%o2
	.word	0x963a715b	! t0_kref+0x21fc:   	xnor	%o1, -0xea5, %o3
	.word	0x25480005	! t0_kref+0x2200:   	fblg,a,pt	%fcc0, _kref+0x2214
	.word	0x99a0105a	! t0_kref+0x2204:   	fdtox	%f26, %f12
	.word	0x81a9cabb	! t0_kref+0x2208:   	fcmpes	%fcc0, %f7, %f27
	.word	0xacb34008	! t0_kref+0x220c:   	orncc	%o5, %o0, %l6
	.word	0x9692a0ef	! t0_kref+0x2210:   	orcc	%o2, 0xef, %o3
	.word	0x9406801c	! t0_kref+0x2214:   	add	%i2, %i4, %o2
	.word	0xaef374d8	! t0_kref+0x2218:   	udivcc	%o5, -0xb28, %l7
	.word	0x8143c000	! t0_kref+0x221c:   	stbar
	.word	0x20480001	! t0_kref+0x2220:   	bn,a,pt	%icc, _kref+0x2224
	.word	0xd100a03c	! t0_kref+0x2224:   	ld	[%g2 + 0x3c], %f8
	.word	0xe47f0018	! t0_kref+0x2228:   	swap	[%i4 + %i0], %l2
	.word	0xc9a65000	! t0_kref+0x222c:   	sta	%f4, [%i1]0x80
	.word	0x9fa3c9b5	! t0_kref+0x2230:   	fdivs	%f15, %f21, %f15
	.word	0x9b400000	! t0_kref+0x2234:   	mov	%y, %o5
	.word	0xae92e701	! t0_kref+0x2238:   	orcc	%o3, 0x701, %l7
	.word	0xe608a019	! t0_kref+0x223c:   	ldub	[%g2 + 0x19], %l3
	.word	0x37480008	! t0_kref+0x2240:   	fbge,a,pt	%fcc0, _kref+0x2260
	.word	0xd800a028	! t0_kref+0x2244:   	ld	[%g2 + 0x28], %o4
	.word	0xe810a022	! t0_kref+0x2248:   	lduh	[%g2 + 0x22], %l4
	.word	0xf76e2018	! t0_kref+0x224c:   	prefetch	%i0 + 0x18, 27
	.word	0xd626001c	! t0_kref+0x2250:   	st	%o3, [%i0 + %i4]
	.word	0x90220017	! t0_kref+0x2254:   	sub	%o0, %l7, %o0
	.word	0x91a01929	! t0_kref+0x2258:   	fstod	%f9, %f8
	.word	0xd51fbd40	! t0_kref+0x225c:   	ldd	[%fp - 0x2c0], %f10
	.word	0xecbe501d	! t0_kref+0x2260:   	stda	%l6, [%i1 + %i5]0x80
	.word	0xd208a010	! t0_kref+0x2264:   	ldub	[%g2 + 0x10], %o1
	.word	0x92103e2c	! t0_kref+0x2268:   	mov	0xfffffe2c, %o1
	.word	0xd4367ffc	! t0_kref+0x226c:   	sth	%o2, [%i1 - 4]
	.word	0xe9be588b	! t0_kref+0x2270:   	stda	%f20, [%i1 + %o3]0xc4
	.word	0xcb00a03c	! t0_kref+0x2274:   	ld	[%g2 + 0x3c], %f5
	.word	0x39480001	! t0_kref+0x2278:   	fbuge,a,pt	%fcc0, _kref+0x227c
	.word	0xb5a18842	! t0_kref+0x227c:   	faddd	%f6, %f2, %f26
	.word	0x8610200c	! t0_kref+0x2280:   	mov	0xc, %g3
	.word	0x86a0e001	! t0_kref+0x2284:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x2288:   	be,a	_kref+0x22f8
	.word	0xa87abc65	! t0_kref+0x228c:   	sdiv	%o2, -0x39b, %l4
	.word	0x8da018c8	! t0_kref+0x2290:   	fdtos	%f8, %f6
	.word	0xf100a008	! t0_kref+0x2294:   	ld	[%g2 + 8], %f24
	.word	0xf62e0000	! t0_kref+0x2298:   	stb	%i3, [%i0]
	.word	0xec40a024	! t0_kref+0x229c:   	ldsw	[%g2 + 0x24], %l6
	.word	0x96c027d1	! t0_kref+0x22a0:   	addccc	%g0, 0x7d1, %o3
	.word	0x33800002	! t0_kref+0x22a4:   	fbe,a	_kref+0x22ac
	.word	0xd04e6002	! t0_kref+0x22a8:   	ldsb	[%i1 + 2], %o0
	.word	0x9fc00004	! t0_kref+0x22ac:   	call	%g0 + %g4
	.word	0xa656f203	! t0_kref+0x22b0:   	umul	%i3, -0xdfd, %l3
	.word	0x94adc000	! t0_kref+0x22b4:   	andncc	%l7, %g0, %o2
	.word	0xaf322017	! t0_kref+0x22b8:   	srl	%o0, 0x17, %l7
	.word	0x81a80a20	! t0_kref+0x22bc:   	fcmps	%fcc0, %f0, %f0
	.word	0x9b2ae012	! t0_kref+0x22c0:   	sll	%o3, 0x12, %o5
	.word	0xd87f0018	! t0_kref+0x22c4:   	swap	[%i4 + %i0], %o4
	.word	0x9002f844	! t0_kref+0x22c8:   	add	%o3, -0x7bc, %o0
	.word	0xaa1ec00c	! t0_kref+0x22cc:   	xor	%i3, %o4, %l5
	.word	0x9427000b	! t0_kref+0x22d0:   	sub	%i4, %o3, %o2
	.word	0xd43e001d	! t0_kref+0x22d4:   	std	%o2, [%i0 + %i5]
	.word	0xb1a10944	! t0_kref+0x22d8:   	fmuld	%f4, %f4, %f24
	.word	0x234fffea	! t0_kref+0x22dc:   	fbne,a,pt	%fcc0, _kref+0x2284
	.word	0xd2263fec	! t0_kref+0x22e0:   	st	%o1, [%i0 - 0x14]
	.word	0x98e27cf9	! t0_kref+0x22e4:   	subccc	%o1, -0x307, %o4
	.word	0x89a0052c	! t0_kref+0x22e8:   	fsqrts	%f12, %f4
	.word	0x9882401c	! t0_kref+0x22ec:   	addcc	%o1, %i4, %o4
	.word	0xb7a00031	! t0_kref+0x22f0:   	fmovs	%f17, %f27
	.word	0x81aa0aa3	! t0_kref+0x22f4:   	fcmpes	%fcc0, %f8, %f3
	.word	0xde167ff2	! t0_kref+0x22f8:   	lduh	[%i1 - 0xe], %o7
	.word	0x25800001	! t0_kref+0x22fc:   	fblg,a	_kref+0x2300
	.word	0xec00a000	! t0_kref+0x2300:   	ld	[%g2], %l6
	.word	0x93a20837	! t0_kref+0x2304:   	fadds	%f8, %f23, %f9
	.word	0xe81e7fe8	! t0_kref+0x2308:   	ldd	[%i1 - 0x18], %l4
	.word	0x8143c000	! t0_kref+0x230c:   	stbar
	.word	0x81ad0aba	! t0_kref+0x2310:   	fcmpes	%fcc0, %f20, %f26
	.word	0xd04e0000	! t0_kref+0x2314:   	ldsb	[%i0], %o0
	.word	0x81a94aa8	! t0_kref+0x2318:   	fcmpes	%fcc0, %f5, %f8
	.word	0xe268a018	! t0_kref+0x231c:   	ldstub	[%g2 + 0x18], %l1
	.word	0xa1a38d31	! t0_kref+0x2320:   	fsmuld	%f14, %f17, %f16
	.word	0x2f800002	! t0_kref+0x2324:   	fbu,a	_kref+0x232c
	.word	0x8143c000	! t0_kref+0x2328:   	stbar
	call	SYM(t0_subr1)
	.word	0xe67f0018	! t0_kref+0x2330:   	swap	[%i4 + %i0], %l3
	.word	0x90432169	! t0_kref+0x2334:   	addc	%o4, 0x169, %o0
	.word	0x32800008	! t0_kref+0x2338:   	bne,a	_kref+0x2358
	.word	0x961ec008	! t0_kref+0x233c:   	xor	%i3, %o0, %o3
	.word	0x8fa00033	! t0_kref+0x2340:   	fmovs	%f19, %f7
	.word	0x37480003	! t0_kref+0x2344:   	fbge,a,pt	%fcc0, _kref+0x2350
	.word	0x9ba00021	! t0_kref+0x2348:   	fmovs	%f1, %f13
	.word	0xa893400a	! t0_kref+0x234c:   	orcc	%o5, %o2, %l4
	.word	0x95a0188e	! t0_kref+0x2350:   	fitos	%f14, %f10
	.word	0xaf400000	! t0_kref+0x2354:   	mov	%y, %l7
	.word	0xa61b4000	! t0_kref+0x2358:   	xor	%o5, %g0, %l3
	.word	0xac323383	! t0_kref+0x235c:   	orn	%o0, -0xc7d, %l6
	.word	0xad418000	! t0_kref+0x2360:   	mov	%fprs, %l6
	.word	0xa6b2ef2f	! t0_kref+0x2364:   	orncc	%o3, 0xf2f, %l3
	.word	0x95a00536	! t0_kref+0x2368:   	fsqrts	%f22, %f10
	.word	0x91a00527	! t0_kref+0x236c:   	fsqrts	%f7, %f8
	.word	0xd6f61000	! t0_kref+0x2370:   	stxa	%o3, [%i0]0x80
	.word	0xa67a000c	! t0_kref+0x2374:   	sdiv	%o0, %o4, %l3
	.word	0x81ae4aa8	! t0_kref+0x2378:   	fcmpes	%fcc0, %f25, %f8
	.word	0xd216c018	! t0_kref+0x237c:   	lduh	[%i3 + %i0], %o1
	.word	0xee2e4000	! t0_kref+0x2380:   	stb	%l7, [%i1]
	.word	0x92d329c4	! t0_kref+0x2384:   	umulcc	%o4, 0x9c4, %o1
	.word	0x25480005	! t0_kref+0x2388:   	fblg,a,pt	%fcc0, _kref+0x239c
	.word	0x97a01a20	! t0_kref+0x238c:   	fstoi	%f0, %f11
	.word	0xa9a6893b	! t0_kref+0x2390:   	fmuls	%f26, %f27, %f20
	.word	0xf96e001c	! t0_kref+0x2394:   	prefetch	%i0 + %i4, 28
	.word	0x9da649ab	! t0_kref+0x2398:   	fdivs	%f25, %f11, %f14
	.word	0xd228a00e	! t0_kref+0x239c:   	stb	%o1, [%g2 + 0xe]
	.word	0x32800002	! t0_kref+0x23a0:   	bne,a	_kref+0x23a8
	.word	0xe920a024	! t0_kref+0x23a4:   	st	%f20, [%g2 + 0x24]
	.word	0xd8166014	! t0_kref+0x23a8:   	lduh	[%i1 + 0x14], %o4
	.word	0xa696a133	! t0_kref+0x23ac:   	orcc	%i2, 0x133, %l3
	.word	0xae223466	! t0_kref+0x23b0:   	sub	%o0, -0xb9a, %l7
	.word	0xe11fbc60	! t0_kref+0x23b4:   	ldd	[%fp - 0x3a0], %f16
	.word	0x8143c000	! t0_kref+0x23b8:   	stbar
	.word	0x81ae0a37	! t0_kref+0x23bc:   	fcmps	%fcc0, %f24, %f23
	.word	0x87a64831	! t0_kref+0x23c0:   	fadds	%f25, %f17, %f3
	.word	0xde4e4000	! t0_kref+0x23c4:   	ldsb	[%i1], %o7
	.word	0xa866b691	! t0_kref+0x23c8:   	subc	%i2, -0x96f, %l4
	.word	0x93a01a30	! t0_kref+0x23cc:   	fstoi	%f16, %f9
	.word	0xae63000b	! t0_kref+0x23d0:   	subc	%o4, %o3, %l7
	.word	0xc93e2018	! t0_kref+0x23d4:   	std	%f4, [%i0 + 0x18]
	.word	0x1523f64c	! t0_kref+0x23d8:   	sethi	%hi(0x8fd93000), %o2
	.word	0xec1e0000	! t0_kref+0x23dc:   	ldd	[%i0], %l6
	.word	0xec871019	! t0_kref+0x23e0:   	lda	[%i4 + %i1]0x80, %l6
	.word	0x99a00828	! t0_kref+0x23e4:   	fadds	%f0, %f8, %f12
	.word	0x9e7aa494	! t0_kref+0x23e8:   	sdiv	%o2, 0x494, %o7
	.word	0x96526a46	! t0_kref+0x23ec:   	umul	%o1, 0xa46, %o3
	.word	0x961a31ca	! t0_kref+0x23f0:   	xor	%o0, -0xe36, %o3
	.word	0x9fc00004	! t0_kref+0x23f4:   	call	%g0 + %g4
	.word	0x91a000b6	! t0_kref+0x23f8:   	fnegs	%f22, %f8
	.word	0x81a1892c	! t0_kref+0x23fc:   	fmuls	%f6, %f12, %f0
	.word	0x980272cb	! t0_kref+0x2400:   	add	%o1, -0xd35, %o4
	.word	0xc300a028	! t0_kref+0x2404:   	ld	[%g2 + 0x28], %f1
	.word	0x90c2c01b	! t0_kref+0x2408:   	addccc	%o3, %i3, %o0
	.word	0xac55c00b	! t0_kref+0x240c:   	umul	%l7, %o3, %l6
	call	SYM(t0_subr1)
	.word	0x923df67a	! t0_kref+0x2414:   	xnor	%l7, -0x986, %o1
	.word	0xb3a009b7	! t0_kref+0x2418:   	fdivs	%f0, %f23, %f25
	.word	0x9a6363fe	! t0_kref+0x241c:   	subc	%o5, 0x3fe, %o5
	.word	0x31800002	! t0_kref+0x2420:   	fba,a	_kref+0x2428
	.word	0xda00a02c	! t0_kref+0x2424:   	ld	[%g2 + 0x2c], %o5
	.word	0x85a48950	! t0_kref+0x2428:   	fmuld	%f18, %f16, %f2
	.word	0xaa227e28	! t0_kref+0x242c:   	sub	%o1, -0x1d8, %l5
	.word	0x948f39ea	! t0_kref+0x2430:   	andcc	%i4, -0x616, %o2
	.word	0xd830a03a	! t0_kref+0x2434:   	sth	%o4, [%g2 + 0x3a]
	.word	0x81dc0005	! t0_kref+0x2438:   	flush	%l0 + %g5
	.word	0xb5a0188f	! t0_kref+0x243c:   	fitos	%f15, %f26
	.word	0xea100019	! t0_kref+0x2440:   	lduh	[%g0 + %i1], %l5
	.word	0xae100009	! t0_kref+0x2444:   	mov	%o1, %l7
	.word	0x81a90a58	! t0_kref+0x2448:   	fcmpd	%fcc0, %f4, %f24
	.word	0x2a480002	! t0_kref+0x244c:   	bcs,a,pt	%icc, _kref+0x2454
	.word	0x85a0188f	! t0_kref+0x2450:   	fitos	%f15, %f2
	.word	0x9816c009	! t0_kref+0x2454:   	or	%i3, %o1, %o4
	.word	0x89a0052e	! t0_kref+0x2458:   	fsqrts	%f14, %f4
	.word	0xed68a042	! t0_kref+0x245c:   	prefetch	%g2 + 0x42, 22
	.word	0x8143c000	! t0_kref+0x2460:   	stbar
	.word	0xf500a03c	! t0_kref+0x2464:   	ld	[%g2 + 0x3c], %f26
	.word	0xaca23fd6	! t0_kref+0x2468:   	subcc	%o0, -0x2a, %l6
	.word	0xaada401a	! t0_kref+0x246c:   	smulcc	%o1, %i2, %l5
	.word	0xaa46b2df	! t0_kref+0x2470:   	addc	%i2, -0xd21, %l5
	.word	0xa7a01a48	! t0_kref+0x2474:   	fdtoi	%f8, %f19
	.word	0x86102001	! t0_kref+0x2478:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x247c:   	bne,a	_kref+0x247c
	.word	0x86a0e001	! t0_kref+0x2480:   	subcc	%g3, 1, %g3
	.word	0xd4262010	! t0_kref+0x2484:   	st	%o2, [%i0 + 0x10]
	.word	0xaf0ebf58	! t0_kref+0x2488:   	tsubcc	%i2, -0xa8, %l7
	.word	0x95a01a36	! t0_kref+0x248c:   	fstoi	%f22, %f10
	.word	0x2b480007	! t0_kref+0x2490:   	fbug,a,pt	%fcc0, _kref+0x24ac
	.word	0xd03e6018	! t0_kref+0x2494:   	std	%o0, [%i1 + 0x18]
	.word	0xe100a008	! t0_kref+0x2498:   	ld	[%g2 + 8], %f16
	.word	0x27800007	! t0_kref+0x249c:   	fbul,a	_kref+0x24b8
	.word	0x8da01a2a	! t0_kref+0x24a0:   	fstoi	%f10, %f6
	.word	0xa85eb0e6	! t0_kref+0x24a4:   	smul	%i2, -0xf1a, %l4
	.word	0xa73a400b	! t0_kref+0x24a8:   	sra	%o1, %o3, %l3
	.word	0xf828a03f	! t0_kref+0x24ac:   	stb	%i4, [%g2 + 0x3f]
	.word	0xac45faaa	! t0_kref+0x24b0:   	addc	%l7, -0x556, %l6
	.word	0x9605ef7f	! t0_kref+0x24b4:   	add	%l7, 0xf7f, %o3
	.word	0xd648a03b	! t0_kref+0x24b8:   	ldsb	[%g2 + 0x3b], %o3
	.word	0x97a01a2c	! t0_kref+0x24bc:   	fstoi	%f12, %f11
	.word	0x83a389b8	! t0_kref+0x24c0:   	fdivs	%f14, %f24, %f1
	.word	0x9ba00024	! t0_kref+0x24c4:   	fmovs	%f4, %f13
	.word	0xd600a038	! t0_kref+0x24c8:   	ld	[%g2 + 0x38], %o3
	.word	0x81db401e	! t0_kref+0x24cc:   	flush	%o5 + %fp
	.word	0x8143c000	! t0_kref+0x24d0:   	stbar
	.word	0x85a0002c	! t0_kref+0x24d4:   	fmovs	%f12, %f2
	.word	0xda86101c	! t0_kref+0x24d8:   	lda	[%i0 + %i4]0x80, %o5
	.word	0x2d800003	! t0_kref+0x24dc:   	fbg,a	_kref+0x24e8
	.word	0x8143c000	! t0_kref+0x24e0:   	stbar
	.word	0xae0a801a	! t0_kref+0x24e4:   	and	%o2, %i2, %l7
	.word	0x90b2c008	! t0_kref+0x24e8:   	orncc	%o3, %o0, %o0
	.word	0x990f0000	! t0_kref+0x24ec:   	tsubcc	%i4, %g0, %o4
	.word	0xc11fbf68	! t0_kref+0x24f0:   	ldd	[%fp - 0x98], %f0
	.word	0xa80a4017	! t0_kref+0x24f4:   	and	%o1, %l7, %l4
	.word	0xd440a028	! t0_kref+0x24f8:   	ldsw	[%g2 + 0x28], %o2
	.word	0x3f800001	! t0_kref+0x24fc:   	fbo,a	_kref+0x2500
	.word	0xe5203588	! t0_kref+0x2500:   	st	%f18, [%g0 - 0xa78]
	.word	0x9da000a1	! t0_kref+0x2504:   	fnegs	%f1, %f14
	.word	0xafa01a50	! t0_kref+0x2508:   	fdtoi	%f16, %f23
	.word	0xa835f93a	! t0_kref+0x250c:   	orn	%l7, -0x6c6, %l4
	.word	0x9ba0052e	! t0_kref+0x2510:   	fsqrts	%f14, %f13
	.word	0xa6aa4009	! t0_kref+0x2514:   	andncc	%o1, %o1, %l3
	.word	0xd9be1a1c	! t0_kref+0x2518:   	stda	%f12, [%i0 + %i4]0xd0
	.word	0x26800008	! t0_kref+0x251c:   	bl,a	_kref+0x253c
	.word	0xa7400000	! t0_kref+0x2520:   	mov	%y, %l3
	.word	0xc0363fec	! t0_kref+0x2524:   	clrh	[%i0 - 0x14]
	.word	0x89a01887	! t0_kref+0x2528:   	fitos	%f7, %f4
	.word	0xda50a008	! t0_kref+0x252c:   	ldsh	[%g2 + 8], %o5
	.word	0xae66ab11	! t0_kref+0x2530:   	subc	%i2, 0xb11, %l7
	.word	0x9ec271d7	! t0_kref+0x2534:   	addccc	%o1, -0xe29, %o7
	.word	0xd6363ffa	! t0_kref+0x2538:   	sth	%o3, [%i0 - 6]
	.word	0x89a000da	! t0_kref+0x253c:   	fnegd	%f26, %f4
	.word	0x3c480006	! t0_kref+0x2540:   	bpos,a,pt	%icc, _kref+0x2558
	.word	0xe320a010	! t0_kref+0x2544:   	st	%f17, [%g2 + 0x10]
	.word	0xb3a24931	! t0_kref+0x2548:   	fmuls	%f9, %f17, %f25
	.word	0xac926d65	! t0_kref+0x254c:   	orcc	%o1, 0xd65, %l6
	.word	0xd04e600d	! t0_kref+0x2550:   	ldsb	[%i1 + 0xd], %o0
	.word	0x9a25c00a	! t0_kref+0x2554:   	sub	%l7, %o2, %o5
	.word	0x1f0044ad	! t0_kref+0x2558:   	sethi	%hi(0x112b400), %o7
	.word	0xa9a01054	! t0_kref+0x255c:   	fdtox	%f20, %f20
	.word	0x94a2c01c	! t0_kref+0x2560:   	subcc	%o3, %i4, %o2
	.word	0xee08a017	! t0_kref+0x2564:   	ldub	[%g2 + 0x17], %l7
	.word	0xe96e3ff8	! t0_kref+0x2568:   	prefetch	%i0 - 8, 20
	.word	0x81aa4aac	! t0_kref+0x256c:   	fcmpes	%fcc0, %f9, %f12
	.word	0x878020e0	! t0_kref+0x2570:   	mov	0xe0, %asi
	.word	0xf51fbec0	! t0_kref+0x2574:   	ldd	[%fp - 0x140], %f26
	.word	0x8ba20838	! t0_kref+0x2578:   	fadds	%f8, %f24, %f5
	.word	0xda50a016	! t0_kref+0x257c:   	ldsh	[%g2 + 0x16], %o5
	.word	0xde50a026	! t0_kref+0x2580:   	ldsh	[%g2 + 0x26], %o7
	.word	0x9a520000	! t0_kref+0x2584:   	umul	%o0, %g0, %o5
	.word	0xc807bff0	! t0_kref+0x2588:   	ld	[%fp - 0x10], %g4
	.word	0x85a5493a	! t0_kref+0x258c:   	fmuls	%f21, %f26, %f2
	.word	0x9053001a	! t0_kref+0x2590:   	umul	%o4, %i2, %o0
	.word	0xd84e8019	! t0_kref+0x2594:   	ldsb	[%i2 + %i1], %o4
	.word	0xaa42b82c	! t0_kref+0x2598:   	addc	%o2, -0x7d4, %l5
	.word	0x983a4017	! t0_kref+0x259c:   	xnor	%o1, %l7, %o4
	.word	0x2b1d1070	! t0_kref+0x25a0:   	sethi	%hi(0x7441c000), %l5
	.word	0x963b6499	! t0_kref+0x25a4:   	xnor	%o5, 0x499, %o3
	.word	0x909f000b	! t0_kref+0x25a8:   	xorcc	%i4, %o3, %o0
	.word	0xb3a488a2	! t0_kref+0x25ac:   	fsubs	%f18, %f2, %f25
	.word	0xa85a38fe	! t0_kref+0x25b0:   	smul	%o0, -0x702, %l4
	.word	0xeefe501c	! t0_kref+0x25b4:   	swapa	[%i1 + %i4]0x80, %l7
	.word	0x81ab4aa1	! t0_kref+0x25b8:   	fcmpes	%fcc0, %f13, %f1
	.word	0x31480007	! t0_kref+0x25bc:   	fba,a,pt	%fcc0, _kref+0x25d8
	.word	0x9b3a001a	! t0_kref+0x25c0:   	sra	%o0, %i2, %o5
	.word	0x8da01881	! t0_kref+0x25c4:   	fitos	%f1, %f6
	.word	0xc9801019	! t0_kref+0x25c8:   	lda	[%g0 + %i1]0x80, %f4
	.word	0xac02001b	! t0_kref+0x25cc:   	add	%o0, %i3, %l6
	.word	0x9fc0001c	! t0_kref+0x25d0:   	call	%g0 + %i4
	.word	0xf51fbd10	! t0_kref+0x25d4:   	ldd	[%fp - 0x2f0], %f26
	.word	0xacaa000b	! t0_kref+0x25d8:   	andncc	%o0, %o3, %l6
	.word	0xaba54921	! t0_kref+0x25dc:   	fmuls	%f21, %f1, %f21
	.word	0xd828a004	! t0_kref+0x25e0:   	stb	%o4, [%g2 + 4]
	.word	0x96b235a8	! t0_kref+0x25e4:   	orncc	%o0, -0xa58, %o3
	.word	0xa9a0108e	! t0_kref+0x25e8:   	fxtos	%f14, %f20
	.word	0xae9233b6	! t0_kref+0x25ec:   	orcc	%o0, -0xc4a, %l7
	.word	0xe3b8a040	! t0_kref+0x25f0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xada01881	! t0_kref+0x25f4:   	fitos	%f1, %f22
	.word	0xec163fe2	! t0_kref+0x25f8:   	lduh	[%i0 - 0x1e], %l6
	.word	0x97a48839	! t0_kref+0x25fc:   	fadds	%f18, %f25, %f11
	.word	0xaa56f79d	! t0_kref+0x2600:   	umul	%i3, -0x863, %l5
	.word	0xd41e7fe8	! t0_kref+0x2604:   	ldd	[%i1 - 0x18], %o2
	.word	0x8da44d2a	! t0_kref+0x2608:   	fsmuld	%f17, %f10, %f6
	.word	0xb5a18952	! t0_kref+0x260c:   	fmuld	%f6, %f18, %f26
	.word	0xf42e8018	! t0_kref+0x2610:   	stb	%i2, [%i2 + %i0]
	.word	0x8143e06b	! t0_kref+0x2614:   	membar	0x6b
	.word	0xd030a026	! t0_kref+0x2618:   	sth	%o0, [%g2 + 0x26]
	.word	0xe51fbc60	! t0_kref+0x261c:   	ldd	[%fp - 0x3a0], %f18
	.word	0xc568a043	! t0_kref+0x2620:   	prefetch	%g2 + 0x43, 2
	.word	0xa6c00017	! t0_kref+0x2624:   	addccc	%g0, %l7, %l3
	.word	0x9015f096	! t0_kref+0x2628:   	or	%l7, -0xf6a, %o0
	.word	0xf700a034	! t0_kref+0x262c:   	ld	[%g2 + 0x34], %f27
	.word	0xb1a4084a	! t0_kref+0x2630:   	faddd	%f16, %f10, %f24
	.word	0xa682c01a	! t0_kref+0x2634:   	addcc	%o3, %i2, %l3
	.word	0x9a1ab6fb	! t0_kref+0x2638:   	xor	%o2, -0x905, %o5
	sethi	%hi(2f), %o7
	.word	0xe40be264	! t0_kref+0x2640:   	ldub	[%o7 + 0x264], %l2
	.word	0xa41ca00c	! t0_kref+0x2644:   	xor	%l2, 0xc, %l2
	.word	0xe42be264	! t0_kref+0x2648:   	stb	%l2, [%o7 + 0x264]
	.word	0x81dbe264	! t0_kref+0x264c:   	flush	%o7 + 0x264
	.word	0xde16c019	! t0_kref+0x2650:   	lduh	[%i3 + %i1], %o7
	.word	0x9ea0000a	! t0_kref+0x2654:   	subcc	%g0, %o2, %o7
	.word	0xa60ac00d	! t0_kref+0x2658:   	and	%o3, %o5, %l3
	.word	0x99a00535	! t0_kref+0x265c:   	fsqrts	%f21, %f12
	.word	0xc0f81019	! t0_kref+0x2660:   	swapa	[%g0 + %i1]0x80, %g0
2:	.word	0xd6fe1000	! t0_kref+0x2664:   	swapa	[%i0]0x80, %o3
	.word	0x9436afd1	! t0_kref+0x2668:   	orn	%i2, 0xfd1, %o2
	.word	0xa6aee120	! t0_kref+0x266c:   	andncc	%i3, 0x120, %l3
	.word	0xdf00a038	! t0_kref+0x2670:   	ld	[%g2 + 0x38], %f15
	call	SYM(t0_subr0)
	.word	0xee7e3fe8	! t0_kref+0x2678:   	swap	[%i0 - 0x18], %l7
	.word	0xa1a00029	! t0_kref+0x267c:   	fmovs	%f9, %f16
	.word	0x98ab29cd	! t0_kref+0x2680:   	andncc	%o4, 0x9cd, %o4
	.word	0xe900a01c	! t0_kref+0x2684:   	ld	[%g2 + 0x1c], %f20
	.word	0xf36e401c	! t0_kref+0x2688:   	prefetch	%i1 + %i4, 25
	.word	0x9efb4000	! t0_kref+0x268c:   	sdivcc	%o5, %g0, %o7
	.word	0xd91fbdc0	! t0_kref+0x2690:   	ldd	[%fp - 0x240], %f12
	sethi	%hi(2f), %o7
	.word	0xe40be2e0	! t0_kref+0x2698:   	ldub	[%o7 + 0x2e0], %l2
	.word	0xa41ca00c	! t0_kref+0x269c:   	xor	%l2, 0xc, %l2
	.word	0xe42be2e0	! t0_kref+0x26a0:   	stb	%l2, [%o7 + 0x2e0]
	.word	0x81dbe2e0	! t0_kref+0x26a4:   	flush	%o7 + 0x2e0
	.word	0x8da48948	! t0_kref+0x26a8:   	fmuld	%f18, %f8, %f6
	.word	0xee4e001a	! t0_kref+0x26ac:   	ldsb	[%i0 + %i2], %l7
	.word	0xa61dc01a	! t0_kref+0x26b0:   	xor	%l7, %i2, %l3
	.word	0x99400000	! t0_kref+0x26b4:   	mov	%y, %o4
	.word	0xa8630000	! t0_kref+0x26b8:   	subc	%o4, %g0, %l4
	.word	0x965de1cc	! t0_kref+0x26bc:   	smul	%l7, 0x1cc, %o3
	.word	0xae1e8017	! t0_kref+0x26c0:   	xor	%i2, %l7, %l7
	.word	0x81a88a48	! t0_kref+0x26c4:   	fcmpd	%fcc0, %f2, %f8
	.word	0x9622bf37	! t0_kref+0x26c8:   	sub	%o2, -0xc9, %o3
	.word	0xd9262000	! t0_kref+0x26cc:   	st	%f12, [%i0]
	.word	0xe300a02c	! t0_kref+0x26d0:   	ld	[%g2 + 0x2c], %f17
	.word	0xd406601c	! t0_kref+0x26d4:   	ld	[%i1 + 0x1c], %o2
	.word	0x81ae0aa1	! t0_kref+0x26d8:   	fcmpes	%fcc0, %f24, %f1
	.word	0xb6103ff8	! t0_kref+0x26dc:   	mov	0xfffffff8, %i3
2:	.word	0xe03e3ff8	! t0_kref+0x26e0:   	std	%l0, [%i0 - 8]
	.word	0xd030a028	! t0_kref+0x26e4:   	sth	%o0, [%g2 + 0x28]
	.word	0x97a00037	! t0_kref+0x26e8:   	fmovs	%f23, %f11
	.word	0x9a3b401c	! t0_kref+0x26ec:   	xnor	%o5, %i4, %o5
	.word	0xee50a030	! t0_kref+0x26f0:   	ldsh	[%g2 + 0x30], %l7
	.word	0xac82355b	! t0_kref+0x26f4:   	addcc	%o0, -0xaa5, %l6
	.word	0x29480005	! t0_kref+0x26f8:   	fbl,a,pt	%fcc0, _kref+0x270c
	.word	0xf3ee101a	! t0_kref+0x26fc:   	prefetcha	%i0 + %i2, 25
	.word	0x9da00128	! t0_kref+0x2700:   	fabss	%f8, %f14
	.word	0xaeda66ca	! t0_kref+0x2704:   	smulcc	%o1, 0x6ca, %l7
	.word	0xb1a00530	! t0_kref+0x2708:   	fsqrts	%f16, %f24
	.word	0x81a189c6	! t0_kref+0x270c:   	fdivd	%f6, %f6, %f0
	.word	0x97a000b6	! t0_kref+0x2710:   	fnegs	%f22, %f11
	.word	0x9707000c	! t0_kref+0x2714:   	taddcc	%i4, %o4, %o3
	.word	0xdaa71018	! t0_kref+0x2718:   	sta	%o5, [%i4 + %i0]0x80
	.word	0x9a82c00c	! t0_kref+0x271c:   	addcc	%o3, %o4, %o5
	.word	0xda26201c	! t0_kref+0x2720:   	st	%o5, [%i0 + 0x1c]
	call	SYM(t0_subr3)
	.word	0xf16e001b	! t0_kref+0x2728:   	prefetch	%i0 + %i3, 24
	.word	0x9de3bfa0	! t0_kref+0x272c:   	save	%sp, -0x60, %sp
	.word	0xb25e3d3f	! t0_kref+0x2730:   	smul	%i0, -0x2c1, %i1
	.word	0x9fee233e	! t0_kref+0x2734:   	restore	%i0, 0x33e, %o7
	call	SYM(t0_subr1)
	.word	0xcf20a014	! t0_kref+0x273c:   	st	%f7, [%g2 + 0x14]
	.word	0xda2e8018	! t0_kref+0x2740:   	stb	%o5, [%i2 + %i0]
	.word	0xd276401d	! t0_kref+0x2744:   	stx	%o1, [%i1 + %i5]
	.word	0x9652bc78	! t0_kref+0x2748:   	umul	%o2, -0x388, %o3
	.word	0xc030a02a	! t0_kref+0x274c:   	clrh	[%g2 + 0x2a]
	.word	0x8182c000	! t0_kref+0x2750:   	wr	%o3, %g0, %y
	.word	0xb7a68828	! t0_kref+0x2754:   	fadds	%f26, %f8, %f27
	.word	0xd020a010	! t0_kref+0x2758:   	st	%o0, [%g2 + 0x10]
	.word	0xa9a01895	! t0_kref+0x275c:   	fitos	%f21, %f20
	.word	0x83a388b4	! t0_kref+0x2760:   	fsubs	%f14, %f20, %f1
	.word	0xa9a009ac	! t0_kref+0x2764:   	fdivs	%f0, %f12, %f20
	.word	0x94e02b9b	! t0_kref+0x2768:   	subccc	%g0, 0xb9b, %o2
	.word	0x26800005	! t0_kref+0x276c:   	bl,a	_kref+0x2780
	.word	0xe96e3fe0	! t0_kref+0x2770:   	prefetch	%i0 - 0x20, 20
	.word	0x8143c000	! t0_kref+0x2774:   	stbar
	.word	0xa9a0188f	! t0_kref+0x2778:   	fitos	%f15, %f20
	.word	0xa67ac017	! t0_kref+0x277c:   	sdiv	%o3, %l7, %l3
	.word	0x29480008	! t0_kref+0x2780:   	fbl,a,pt	%fcc0, _kref+0x27a0
	.word	0x9a233d87	! t0_kref+0x2784:   	sub	%o4, -0x279, %o5
	.word	0xb5a3083b	! t0_kref+0x2788:   	fadds	%f12, %f27, %f26
	.word	0xaea3001b	! t0_kref+0x278c:   	subcc	%o4, %i3, %l7
	.word	0xc028a010	! t0_kref+0x2790:   	clrb	[%g2 + 0x10]
	.word	0xae86e6c9	! t0_kref+0x2794:   	addcc	%i3, 0x6c9, %l7
	.word	0xf630a02e	! t0_kref+0x2798:   	sth	%i3, [%g2 + 0x2e]
	.word	0x8143c000	! t0_kref+0x279c:   	stbar
	.word	0x99a0885a	! t0_kref+0x27a0:   	faddd	%f2, %f26, %f12
	.word	0x9ec7000c	! t0_kref+0x27a4:   	addccc	%i4, %o4, %o7
	.word	0x81a1c8a0	! t0_kref+0x27a8:   	fsubs	%f7, %f0, %f0
	.word	0xae670008	! t0_kref+0x27ac:   	subc	%i4, %o0, %l7
	.word	0xec3e0000	! t0_kref+0x27b0:   	std	%l6, [%i0]
	.word	0x81a90a4c	! t0_kref+0x27b4:   	fcmpd	%fcc0, %f4, %f12
	.word	0x8da01a23	! t0_kref+0x27b8:   	fstoi	%f3, %f6
	.word	0xf1180019	! t0_kref+0x27bc:   	ldd	[%g0 + %i1], %f24
	.word	0xecf81019	! t0_kref+0x27c0:   	swapa	[%g0 + %i1]0x80, %l6
	.word	0x99a2c92b	! t0_kref+0x27c4:   	fmuls	%f11, %f11, %f12
	.word	0x91a5c9b9	! t0_kref+0x27c8:   	fdivs	%f23, %f25, %f8
	.word	0x91a01a32	! t0_kref+0x27cc:   	fstoi	%f18, %f8
	.word	0x983b7cf3	! t0_kref+0x27d0:   	xnor	%o5, -0x30d, %o4
	.word	0x90972ebd	! t0_kref+0x27d4:   	orcc	%i4, 0xebd, %o0
	call	SYM(t0_subr2)
	.word	0x96802199	! t0_kref+0x27dc:   	addcc	%g0, 0x199, %o3
	.word	0x907b001c	! t0_kref+0x27e0:   	sdiv	%o4, %i4, %o0
	.word	0xd44e7ff2	! t0_kref+0x27e4:   	ldsb	[%i1 - 0xe], %o2
	.word	0xc93f4018	! t0_kref+0x27e8:   	std	%f4, [%i5 + %i0]
	.word	0x3d480008	! t0_kref+0x27ec:   	fbule,a,pt	%fcc0, _kref+0x280c
	.word	0x8fa1c8b7	! t0_kref+0x27f0:   	fsubs	%f7, %f23, %f7
	.word	0xc030a024	! t0_kref+0x27f4:   	clrh	[%g2 + 0x24]
	.word	0x8143c000	! t0_kref+0x27f8:   	stbar
	.word	0xff6e001b	! t0_kref+0x27fc:   	prefetch	%i0 + %i3, 31
	.word	0x81ac0aac	! t0_kref+0x2800:   	fcmpes	%fcc0, %f16, %f12
	.word	0xb5a01885	! t0_kref+0x2804:   	fitos	%f5, %f26
	.word	0xa8e6bf05	! t0_kref+0x2808:   	subccc	%i2, -0xfb, %l4
	call	SYM(t0_subr1)
	.word	0xd2b6101b	! t0_kref+0x2810:   	stha	%o1, [%i0 + %i3]0x80
	.word	0xe81e0000	! t0_kref+0x2814:   	ldd	[%i0], %l4
	.word	0x925b6710	! t0_kref+0x2818:   	smul	%o5, 0x710, %o1
	.word	0x967b75cf	! t0_kref+0x281c:   	sdiv	%o5, -0xa31, %o3
	.word	0x3d800005	! t0_kref+0x2820:   	fbule,a	_kref+0x2834
	.word	0x89a01a32	! t0_kref+0x2824:   	fstoi	%f18, %f4
	.word	0x9fc00004	! t0_kref+0x2828:   	call	%g0 + %g4
	.word	0xa1a000b6	! t0_kref+0x282c:   	fnegs	%f22, %f16
	.word	0xc91fbc60	! t0_kref+0x2830:   	ldd	[%fp - 0x3a0], %f4
	.word	0xf430a006	! t0_kref+0x2834:   	sth	%i2, [%g2 + 6]
	.word	0xae3a000b	! t0_kref+0x2838:   	xnor	%o0, %o3, %l7
	.word	0xe320a00c	! t0_kref+0x283c:   	st	%f17, [%g2 + 0xc]
	.word	0xd300a00c	! t0_kref+0x2840:   	ld	[%g2 + 0xc], %f9
	sethi	%hi(2f), %o7
	.word	0xe40be080	! t0_kref+0x2848:   	ldub	[%o7 + 0x80], %l2
	.word	0xa41ca00c	! t0_kref+0x284c:   	xor	%l2, 0xc, %l2
	.word	0xe42be080	! t0_kref+0x2850:   	stb	%l2, [%o7 + 0x80]
	.word	0x81dbe080	! t0_kref+0x2854:   	flush	%o7 + 0x80
	.word	0xae9b3c7e	! t0_kref+0x2858:   	xorcc	%o4, -0x382, %l7
	.word	0xe600a000	! t0_kref+0x285c:   	ld	[%g2], %l3
	.word	0xd41f4019	! t0_kref+0x2860:   	ldd	[%i5 + %i1], %o2
	.word	0x21480001	! t0_kref+0x2864:   	fbn,a,pt	%fcc0, _kref+0x2868
	.word	0x9e7a4008	! t0_kref+0x2868:   	sdiv	%o1, %o0, %o7
	.word	0xd51fbf78	! t0_kref+0x286c:   	ldd	[%fp - 0x88], %f10
	.word	0x9a76c000	! t0_kref+0x2870:   	udiv	%i3, %g0, %o5
	.word	0xa62320e5	! t0_kref+0x2874:   	sub	%o4, 0xe5, %l3
	.word	0xda063ffc	! t0_kref+0x2878:   	ld	[%i0 - 4], %o5
	.word	0x9e8df6a6	! t0_kref+0x287c:   	andcc	%l7, -0x95a, %o7
2:	.word	0x85a20956	! t0_kref+0x2880:   	fmuld	%f8, %f22, %f2
	.word	0x2f480001	! t0_kref+0x2884:   	fbu,a,pt	%fcc0, _kref+0x2888
	.word	0x8583400d	! t0_kref+0x2888:   	wr	%o5, %o5, %ccr
	.word	0x9a56eaa4	! t0_kref+0x288c:   	umul	%i3, 0xaa4, %o5
	.word	0x9462e950	! t0_kref+0x2890:   	subc	%o3, 0x950, %o2
	call	SYM(t0_subr0)
	.word	0xd8166004	! t0_kref+0x2898:   	lduh	[%i1 + 4], %o4
	.word	0xf207bfe0	! t0_kref+0x289c:   	ld	[%fp - 0x20], %i1
	.word	0xf300a008	! t0_kref+0x28a0:   	ld	[%g2 + 8], %f25
	.word	0xe76e3fe0	! t0_kref+0x28a4:   	prefetch	%i0 - 0x20, 19
	.word	0xae528000	! t0_kref+0x28a8:   	umul	%o2, %g0, %l7
	.word	0xaef2619d	! t0_kref+0x28ac:   	udivcc	%o1, 0x19d, %l7
	.word	0x9a1dc009	! t0_kref+0x28b0:   	xor	%l7, %o1, %o5
	.word	0x24800003	! t0_kref+0x28b4:   	ble,a	_kref+0x28c0
	.word	0xee0e4000	! t0_kref+0x28b8:   	ldub	[%i1], %l7
	.word	0xb7a00123	! t0_kref+0x28bc:   	fabss	%f3, %f27
	.word	0xa9a4c820	! t0_kref+0x28c0:   	fadds	%f19, %f0, %f20
	.word	0xf4762000	! t0_kref+0x28c4:   	stx	%i2, [%i0]
	.word	0x96b37677	! t0_kref+0x28c8:   	orncc	%o5, -0x989, %o3
	.word	0xc1be184b	! t0_kref+0x28cc:   	stda	%f0, [%i0 + %o3]0xc2
	.word	0x8143c000	! t0_kref+0x28d0:   	stbar
	.word	0x9e7aef1c	! t0_kref+0x28d4:   	sdiv	%o3, 0xf1c, %o7
	.word	0x9238000c	! t0_kref+0x28d8:   	xnor	%g0, %o4, %o1
	.word	0xac22e211	! t0_kref+0x28dc:   	sub	%o3, 0x211, %l6
	.word	0xe93e001d	! t0_kref+0x28e0:   	std	%f20, [%i0 + %i5]
	sethi	%hi(2f), %o7
	.word	0xe40be114	! t0_kref+0x28e8:   	ldub	[%o7 + 0x114], %l2
	.word	0xa41ca00c	! t0_kref+0x28ec:   	xor	%l2, 0xc, %l2
	.word	0xe42be114	! t0_kref+0x28f0:   	stb	%l2, [%o7 + 0x114]
	.word	0x81dbe114	! t0_kref+0x28f4:   	flush	%o7 + 0x114
	.word	0x91a00154	! t0_kref+0x28f8:   	fabsd	%f20, %f8
	.word	0x8ba409a1	! t0_kref+0x28fc:   	fdivs	%f16, %f1, %f5
	.word	0xdf262008	! t0_kref+0x2900:   	st	%f15, [%i0 + 8]
	.word	0x9472f8ee	! t0_kref+0x2904:   	udiv	%o3, -0x712, %o2
	.word	0xe5ee101a	! t0_kref+0x2908:   	prefetcha	%i0 + %i2, 18
	.word	0xda00a014	! t0_kref+0x290c:   	ld	[%g2 + 0x14], %o5
	.word	0x97a20926	! t0_kref+0x2910:   	fmuls	%f8, %f6, %f11
2:	.word	0x9af2a19e	! t0_kref+0x2914:   	udivcc	%o2, 0x19e, %o5
	.word	0x8ba0188d	! t0_kref+0x2918:   	fitos	%f13, %f5
	.word	0xc7a6101c	! t0_kref+0x291c:   	sta	%f3, [%i0 + %i4]0x80
	.word	0xa9a608ba	! t0_kref+0x2920:   	fsubs	%f24, %f26, %f20
	.word	0x9f2aa00b	! t0_kref+0x2924:   	sll	%o2, 0xb, %o7
	.word	0xc43f4005	! t0_kref+0x2928:   	std	%g2, [%i5 + %g5]
	.word	0xb3a00534	! t0_kref+0x292c:   	fsqrts	%f20, %f25
	.word	0x9a6225f8	! t0_kref+0x2930:   	subc	%o0, 0x5f8, %o5
	.word	0x85a28940	! t0_kref+0x2934:   	fmuld	%f10, %f0, %f2
	.word	0xa63ac008	! t0_kref+0x2938:   	xnor	%o3, %o0, %l3
	.word	0xa822e564	! t0_kref+0x293c:   	sub	%o3, 0x564, %l4
	.word	0xf420a03c	! t0_kref+0x2940:   	st	%i2, [%g2 + 0x3c]
	.word	0xd68e1000	! t0_kref+0x2944:   	lduba	[%i0]0x80, %o3
	.word	0xe81e6010	! t0_kref+0x2948:   	ldd	[%i1 + 0x10], %l4
	.word	0xaa8af784	! t0_kref+0x294c:   	andcc	%o3, -0x87c, %l5
	.word	0xde10a03e	! t0_kref+0x2950:   	lduh	[%g2 + 0x3e], %o7
	.word	0xdb20a008	! t0_kref+0x2954:   	st	%f13, [%g2 + 8]
	.word	0xf13e7fe8	! t0_kref+0x2958:   	std	%f24, [%i1 - 0x18]
	.word	0xdf00a038	! t0_kref+0x295c:   	ld	[%g2 + 0x38], %f15
	.word	0xaa26c008	! t0_kref+0x2960:   	sub	%i3, %o0, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be1ac	! t0_kref+0x2968:   	ldub	[%o7 + 0x1ac], %l2
	.word	0xa41ca00c	! t0_kref+0x296c:   	xor	%l2, 0xc, %l2
	.word	0xe42be1ac	! t0_kref+0x2970:   	stb	%l2, [%o7 + 0x1ac]
	.word	0x81dbe1ac	! t0_kref+0x2974:   	flush	%o7 + 0x1ac
	.word	0xae226db1	! t0_kref+0x2978:   	sub	%o1, 0xdb1, %l7
	.word	0xee50a008	! t0_kref+0x297c:   	ldsh	[%g2 + 8], %l7
	.word	0x89a01084	! t0_kref+0x2980:   	fxtos	%f4, %f4
	.word	0xd5be1000	! t0_kref+0x2984:   	stda	%f10, [%i0]0x80
	.word	0xa65229ca	! t0_kref+0x2988:   	umul	%o0, 0x9ca, %l3
	.word	0x2f800004	! t0_kref+0x298c:   	fbu,a	_kref+0x299c
	.word	0xafa018c2	! t0_kref+0x2990:   	fdtos	%f2, %f23
	.word	0x9402c01c	! t0_kref+0x2994:   	add	%o3, %i4, %o2
	.word	0xf1ee501a	! t0_kref+0x2998:   	prefetcha	%i1 + %i2, 24
	.word	0xd4360000	! t0_kref+0x299c:   	sth	%o2, [%i0]
	.word	0x980a001c	! t0_kref+0x29a0:   	and	%o0, %i4, %o4
	.word	0x25480002	! t0_kref+0x29a4:   	fblg,a,pt	%fcc0, _kref+0x29ac
	.word	0x8ba01a24	! t0_kref+0x29a8:   	fstoi	%f4, %f5
2:	.word	0xa722aab7	! t0_kref+0x29ac:   	mulscc	%o2, 0xab7, %l3
	.word	0xecbe1000	! t0_kref+0x29b0:   	stda	%l6, [%i0]0x80
	.word	0xac222891	! t0_kref+0x29b4:   	sub	%o0, 0x891, %l6
	.word	0x8143c000	! t0_kref+0x29b8:   	stbar
	.word	0x9561c00c	! t0_kref+0x29bc:   	movu	%fcc0, %o4, %o2
	.word	0xf7ee101b	! t0_kref+0x29c0:   	prefetcha	%i0 + %i3, 27
	.word	0xc19e1a5b	! t0_kref+0x29c4:   	ldda	[%i0 + %i3]0xd2, %f0
	.word	0x81ae8aab	! t0_kref+0x29c8:   	fcmpes	%fcc0, %f26, %f11
	.word	0xc3ee500c	! t0_kref+0x29cc:   	prefetcha	%i1 + %o4, 1
	.word	0x9fa6c9b7	! t0_kref+0x29d0:   	fdivs	%f27, %f23, %f15
	.word	0xdd1fbd98	! t0_kref+0x29d4:   	ldd	[%fp - 0x268], %f14
	.word	0x98c20000	! t0_kref+0x29d8:   	addccc	%o0, %g0, %o4
	.word	0x1b24ccc4	! t0_kref+0x29dc:   	sethi	%hi(0x93331000), %o5
	.word	0xa1a40835	! t0_kref+0x29e0:   	fadds	%f16, %f21, %f16
	.word	0x8da00537	! t0_kref+0x29e4:   	fsqrts	%f23, %f6
	.word	0x1720284e	! t0_kref+0x29e8:   	sethi	%hi(0x80a13800), %o3
	.word	0x99a2c9a2	! t0_kref+0x29ec:   	fdivs	%f11, %f2, %f12
	.word	0x9222c00c	! t0_kref+0x29f0:   	sub	%o3, %o4, %o1
	.word	0x21480006	! t0_kref+0x29f4:   	fbn,a,pt	%fcc0, _kref+0x2a0c
	.word	0x9ba40834	! t0_kref+0x29f8:   	fadds	%f16, %f20, %f13
	.word	0xd4774019	! t0_kref+0x29fc:   	stx	%o2, [%i5 + %i1]
	.word	0xb1a0895a	! t0_kref+0x2a00:   	fmuld	%f2, %f26, %f24
	.word	0x15245479	! t0_kref+0x2a04:   	sethi	%hi(0x9151e400), %o2
	.word	0x9e0af9bc	! t0_kref+0x2a08:   	and	%o3, -0x644, %o7
	.word	0xe9be1a1d	! t0_kref+0x2a0c:   	stda	%f20, [%i0 + %i5]0xd0
	.word	0xe84e7ff0	! t0_kref+0x2a10:   	ldsb	[%i1 - 0x10], %l4
	.word	0xdd1fbed8	! t0_kref+0x2a14:   	ldd	[%fp - 0x128], %f14
	.word	0xd4200019	! t0_kref+0x2a18:   	st	%o2, [%g0 + %i1]
	.word	0xb7a00123	! t0_kref+0x2a1c:   	fabss	%f3, %f27
	.word	0xa88b0017	! t0_kref+0x2a20:   	andcc	%o4, %l7, %l4
	.word	0x9e96c01b	! t0_kref+0x2a24:   	orcc	%i3, %i3, %o7
	.word	0xada000a4	! t0_kref+0x2a28:   	fnegs	%f4, %f22
	.word	0xf6262004	! t0_kref+0x2a2c:   	st	%i3, [%i0 + 4]
	.word	0xac5af081	! t0_kref+0x2a30:   	smul	%o3, -0xf7f, %l6
	.word	0xb1a01a2d	! t0_kref+0x2a34:   	fstoi	%f13, %f24
	.word	0xa5a589d6	! t0_kref+0x2a38:   	fdivd	%f22, %f22, %f18
	.word	0x9fa01a46	! t0_kref+0x2a3c:   	fdtoi	%f6, %f15
	.word	0x33480008	! t0_kref+0x2a40:   	fbe,a,pt	%fcc0, _kref+0x2a60
	.word	0x8fa54931	! t0_kref+0x2a44:   	fmuls	%f21, %f17, %f7
	.word	0x29480008	! t0_kref+0x2a48:   	fbl,a,pt	%fcc0, _kref+0x2a68
	.word	0x9a8b3ffb	! t0_kref+0x2a4c:   	andcc	%o4, -0x5, %o5
	.word	0x96428017	! t0_kref+0x2a50:   	addc	%o2, %l7, %o3
	.word	0xd01e6008	! t0_kref+0x2a54:   	ldd	[%i1 + 8], %o0
	.word	0xb5a0013b	! t0_kref+0x2a58:   	fabss	%f27, %f26
	.word	0x9296c00b	! t0_kref+0x2a5c:   	orcc	%i3, %o3, %o1
	.word	0xa5a00126	! t0_kref+0x2a60:   	fabss	%f6, %f18
	.word	0x2e800005	! t0_kref+0x2a64:   	bvs,a	_kref+0x2a78
	.word	0x960a400b	! t0_kref+0x2a68:   	and	%o1, %o3, %o3
	call	SYM(t0_subr3)
	.word	0xada1c9b1	! t0_kref+0x2a70:   	fdivs	%f7, %f17, %f22
	.word	0x2b800006	! t0_kref+0x2a74:   	fbug,a	_kref+0x2a8c
	.word	0xf76e2018	! t0_kref+0x2a78:   	prefetch	%i0 + 0x18, 27
	.word	0xa81f25eb	! t0_kref+0x2a7c:   	xor	%i4, 0x5eb, %l4
	.word	0x98a6a03a	! t0_kref+0x2a80:   	subcc	%i2, 0x3a, %o4
	.word	0xa822800a	! t0_kref+0x2a84:   	sub	%o2, %o2, %l4
	call	SYM(t0_subr1)
	.word	0xae702e86	! t0_kref+0x2a8c:   	udiv	%g0, 0xe86, %l7
	.word	0xe3b8a040	! t0_kref+0x2a90:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xb3a00537	! t0_kref+0x2a94:   	fsqrts	%f23, %f25
	.word	0xaef32331	! t0_kref+0x2a98:   	udivcc	%o4, 0x331, %l7
	call	SYM(t0_subr0)
	.word	0xd9b81019	! t0_kref+0x2aa0:   	stda	%f12, [%g0 + %i1]0x80
	.word	0xea4e8018	! t0_kref+0x2aa4:   	ldsb	[%i2 + %i0], %l5
	.word	0x1108d057	! t0_kref+0x2aa8:   	sethi	%hi(0x23415c00), %o0
	.word	0xe91fbc90	! t0_kref+0x2aac:   	ldd	[%fp - 0x370], %f20
	.word	0x93a608ac	! t0_kref+0x2ab0:   	fsubs	%f24, %f12, %f9
	.word	0xd020a028	! t0_kref+0x2ab4:   	st	%o0, [%g2 + 0x28]
	.word	0xac5a800c	! t0_kref+0x2ab8:   	smul	%o2, %o4, %l6
	.word	0xd6560000	! t0_kref+0x2abc:   	ldsh	[%i0], %o3
	.word	0xac7e801a	! t0_kref+0x2ac0:   	sdiv	%i2, %i2, %l6
	call	SYM(t0_subr1)
	.word	0xe81e7ff8	! t0_kref+0x2ac8:   	ldd	[%i1 - 8], %l4
	.word	0xf1ee101d	! t0_kref+0x2acc:   	prefetcha	%i0 + %i5, 24
	.word	0x94b7000c	! t0_kref+0x2ad0:   	orncc	%i4, %o4, %o2
	.word	0xaab367a2	! t0_kref+0x2ad4:   	orncc	%o5, 0x7a2, %l5
	.word	0xd048a00d	! t0_kref+0x2ad8:   	ldsb	[%g2 + 0xd], %o0
	.word	0xaac234e6	! t0_kref+0x2adc:   	addccc	%o0, -0xb1a, %l5
	.word	0xde08a02b	! t0_kref+0x2ae0:   	ldub	[%g2 + 0x2b], %o7
	.word	0x37480002	! t0_kref+0x2ae4:   	fbge,a,pt	%fcc0, _kref+0x2aec
	.word	0xc5b81019	! t0_kref+0x2ae8:   	stda	%f2, [%g0 + %i1]0x80
	.word	0x97a01887	! t0_kref+0x2aec:   	fitos	%f7, %f11
	.word	0xa6b5f383	! t0_kref+0x2af0:   	orncc	%l7, -0xc7d, %l3
	.word	0x9da489af	! t0_kref+0x2af4:   	fdivs	%f18, %f15, %f14
	.word	0x9da0882c	! t0_kref+0x2af8:   	fadds	%f2, %f12, %f14
	.word	0x9296c00b	! t0_kref+0x2afc:   	orcc	%i3, %o3, %o1
	.word	0xd810a03a	! t0_kref+0x2b00:   	lduh	[%g2 + 0x3a], %o4
	.word	0x9de3bfa0	! t0_kref+0x2b04:   	save	%sp, -0x60, %sp
	.word	0x97ee7e10	! t0_kref+0x2b08:   	restore	%i1, -0x1f0, %o3
	.word	0x9656c008	! t0_kref+0x2b0c:   	umul	%i3, %o0, %o3
	.word	0xe11fbf98	! t0_kref+0x2b10:   	ldd	[%fp - 0x68], %f16
	.word	0xc13e3fe0	! t0_kref+0x2b14:   	std	%f0, [%i0 - 0x20]
	.word	0xd0b81019	! t0_kref+0x2b18:   	stda	%o0, [%g0 + %i1]0x80
	.word	0x86102004	! t0_kref+0x2b1c:   	mov	0x4, %g3
	.word	0x32800000	! t0_kref+0x2b20:   	bne,a	_kref+0x2b20
	.word	0x86a0e001	! t0_kref+0x2b24:   	subcc	%g3, 1, %g3
	.word	0xc51fbf98	! t0_kref+0x2b28:   	ldd	[%fp - 0x68], %f2
	.word	0x90103093	! t0_kref+0x2b2c:   	mov	0xfffff093, %o0
	.word	0xd420a008	! t0_kref+0x2b30:   	st	%o2, [%g2 + 8]
	.word	0x87a01881	! t0_kref+0x2b34:   	fitos	%f1, %f3
	.word	0x9f25c00b	! t0_kref+0x2b38:   	mulscc	%l7, %o3, %o7
	.word	0x39800003	! t0_kref+0x2b3c:   	fbuge,a	_kref+0x2b48
	.word	0xa612a691	! t0_kref+0x2b40:   	or	%o2, 0x691, %l3
	.word	0x81a9ca2f	! t0_kref+0x2b44:   	fcmps	%fcc0, %f7, %f15
	.word	0xb8103ff0	! t0_kref+0x2b48:   	mov	0xfffffff0, %i4
	.word	0x9fc00004	! t0_kref+0x2b4c:   	call	%g0 + %g4
	.word	0x95a04839	! t0_kref+0x2b50:   	fadds	%f1, %f25, %f10
	.word	0x9a2de3df	! t0_kref+0x2b54:   	andn	%l7, 0x3df, %o5
	.word	0x929b4000	! t0_kref+0x2b58:   	xorcc	%o5, %g0, %o1
	.word	0x9aa82da6	! t0_kref+0x2b5c:   	andncc	%g0, 0xda6, %o5
	.word	0x9b418000	! t0_kref+0x2b60:   	mov	%fprs, %o5
	.word	0xb1a38950	! t0_kref+0x2b64:   	fmuld	%f14, %f16, %f24
	.word	0xc5267ff0	! t0_kref+0x2b68:   	st	%f2, [%i1 - 0x10]
	.word	0x81da380c	! t0_kref+0x2b6c:   	flush	%o0 - 0x7f4
	.word	0x27800001	! t0_kref+0x2b70:   	fbul,a	_kref+0x2b74
	.word	0xa61b4017	! t0_kref+0x2b74:   	xor	%o5, %l7, %l3
	.word	0xd628a03a	! t0_kref+0x2b78:   	stb	%o3, [%g2 + 0x3a]
	.word	0x2d09c639	! t0_kref+0x2b7c:   	sethi	%hi(0x2718e400), %l6
	.word	0xf56e7fe8	! t0_kref+0x2b80:   	prefetch	%i1 - 0x18, 26
	.word	0xe64e3fe7	! t0_kref+0x2b84:   	ldsb	[%i0 - 0x19], %l3
	.word	0x908b614e	! t0_kref+0x2b88:   	andcc	%o5, 0x14e, %o0
	.word	0xab400000	! t0_kref+0x2b8c:   	mov	%y, %l5
	.word	0x9ba00529	! t0_kref+0x2b90:   	fsqrts	%f9, %f13
	.word	0xae103643	! t0_kref+0x2b94:   	mov	0xfffff643, %l7
	.word	0x35800008	! t0_kref+0x2b98:   	fbue,a	_kref+0x2bb8
	.word	0xe41e401d	! t0_kref+0x2b9c:   	ldd	[%i1 + %i5], %l2
	.word	0xee48a01a	! t0_kref+0x2ba0:   	ldsb	[%g2 + 0x1a], %l7
	.word	0x21800002	! t0_kref+0x2ba4:   	fbn,a	_kref+0x2bac
	.word	0xda40a024	! t0_kref+0x2ba8:   	ldsw	[%g2 + 0x24], %o5
	.word	0x81a94aad	! t0_kref+0x2bac:   	fcmpes	%fcc0, %f5, %f13
	.word	0xd010a038	! t0_kref+0x2bb0:   	lduh	[%g2 + 0x38], %o0
	.word	0xd24e6016	! t0_kref+0x2bb4:   	ldsb	[%i1 + 0x16], %o1
	.word	0xb5a01915	! t0_kref+0x2bb8:   	fitod	%f21, %f26
	.word	0xda280019	! t0_kref+0x2bbc:   	stb	%o5, [%g0 + %i1]
	.word	0xd64e8018	! t0_kref+0x2bc0:   	ldsb	[%i2 + %i0], %o3
	.word	0x11226ac7	! t0_kref+0x2bc4:   	sethi	%hi(0x89ab1c00), %o0
	.word	0xf5ee101c	! t0_kref+0x2bc8:   	prefetcha	%i0 + %i4, 26
	.word	0xe600a008	! t0_kref+0x2bcc:   	ld	[%g2 + 8], %l3
	.word	0xacb2b233	! t0_kref+0x2bd0:   	orncc	%o2, -0xdcd, %l6
	.word	0x92b2800c	! t0_kref+0x2bd4:   	orncc	%o2, %o4, %o1
	.word	0x001fffff	! t0_kref+0x2bd8:   	illtrap	0x1fffff
	.word	0x85a50944	! t0_kref+0x2bdc:   	fmuld	%f20, %f4, %f2
	.word	0xd6064000	! t0_kref+0x2be0:   	ld	[%i1], %o3
	call	SYM(t0_subr2)
	.word	0x97400000	! t0_kref+0x2be8:   	mov	%y, %o3
	.word	0x981b0000	! t0_kref+0x2bec:   	xor	%o4, %g0, %o4
	.word	0x86102006	! t0_kref+0x2bf0:   	mov	0x6, %g3
	.word	0x86a0e001	! t0_kref+0x2bf4:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x2bf8:   	be,a	_kref+0x2c24
	.word	0x948f0000	! t0_kref+0x2bfc:   	andcc	%i4, %g0, %o2
	.word	0xac26f224	! t0_kref+0x2c00:   	sub	%i3, -0xddc, %l6
	.word	0x960dc000	! t0_kref+0x2c04:   	and	%l7, %g0, %o3
	.word	0xada0052c	! t0_kref+0x2c08:   	fsqrts	%f12, %f22
	.word	0x9ac33656	! t0_kref+0x2c0c:   	addccc	%o4, -0x9aa, %o5
	.word	0xe520a00c	! t0_kref+0x2c10:   	st	%f18, [%g2 + 0xc]
	.word	0x9f28001a	! t0_kref+0x2c14:   	sll	%g0, %i2, %o7
	.word	0xe11fbd80	! t0_kref+0x2c18:   	ldd	[%fp - 0x280], %f16
	.word	0xa8fab6cb	! t0_kref+0x2c1c:   	sdivcc	%o2, -0x935, %l4
	.word	0xe3b8a040	! t0_kref+0x2c20:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81ab8a54	! t0_kref+0x2c24:   	fcmpd	%fcc0, %f14, %f20
	.word	0x86102003	! t0_kref+0x2c28:   	mov	0x3, %g3
	.word	0x86a0e001	! t0_kref+0x2c2c:   	subcc	%g3, 1, %g3
	.word	0x2280001d	! t0_kref+0x2c30:   	be,a	_kref+0x2ca4
	.word	0xb1a01a2a	! t0_kref+0x2c34:   	fstoi	%f10, %f24
	.word	0xf1ee101c	! t0_kref+0x2c38:   	prefetcha	%i0 + %i4, 24
	.word	0x9133600f	! t0_kref+0x2c3c:   	srl	%o5, 0xf, %o0
	.word	0xc030a012	! t0_kref+0x2c40:   	clrh	[%g2 + 0x12]
	.word	0x254ffffa	! t0_kref+0x2c44:   	fblg,a,pt	%fcc0, _kref+0x2c2c
	.word	0xada01a48	! t0_kref+0x2c48:   	fdtoi	%f8, %f22
	.word	0xba103fe0	! t0_kref+0x2c4c:   	mov	0xffffffe0, %i5
	.word	0xafa189a3	! t0_kref+0x2c50:   	fdivs	%f6, %f3, %f23
	.word	0x99a01a3b	! t0_kref+0x2c54:   	fstoi	%f27, %f12
	.word	0xeec6101c	! t0_kref+0x2c58:   	ldswa	[%i0 + %i4]0x80, %l7
	call	SYM(t0_subr2)
	.word	0xf007bfe0	! t0_kref+0x2c60:   	ld	[%fp - 0x20], %i0
	.word	0xee48a03e	! t0_kref+0x2c64:   	ldsb	[%g2 + 0x3e], %l7
	.word	0x81a0012f	! t0_kref+0x2c68:   	fabss	%f15, %f0
	.word	0x9b33400b	! t0_kref+0x2c6c:   	srl	%o5, %o3, %o5
	.word	0x9eb5c00a	! t0_kref+0x2c70:   	orncc	%l7, %o2, %o7
	.word	0xa5a01a39	! t0_kref+0x2c74:   	fstoi	%f25, %f18
	.word	0x8da508d6	! t0_kref+0x2c78:   	fsubd	%f20, %f22, %f6
	.word	0x39bfffec	! t0_kref+0x2c7c:   	fbuge,a	_kref+0x2c2c
	.word	0x900b2f0e	! t0_kref+0x2c80:   	and	%o4, 0xf0e, %o0
	.word	0xc56e3ff8	! t0_kref+0x2c84:   	prefetch	%i0 - 8, 2
	.word	0x81da314f	! t0_kref+0x2c88:   	flush	%o0 - 0xeb1
	.word	0x99a64d21	! t0_kref+0x2c8c:   	fsmuld	%f25, %f1, %f12
	.word	0xae3b27d5	! t0_kref+0x2c90:   	xnor	%o4, 0x7d5, %l7
	.word	0xd67e6008	! t0_kref+0x2c94:   	swap	[%i1 + 8], %o3
	.word	0xc807bfec	! t0_kref+0x2c98:   	ld	[%fp - 0x14], %g4
	.word	0xf828a02e	! t0_kref+0x2c9c:   	stb	%i4, [%g2 + 0x2e]
	.word	0xac5b626d	! t0_kref+0x2ca0:   	smul	%o5, 0x26d, %l6
	.word	0x9e427845	! t0_kref+0x2ca4:   	addc	%o1, -0x7bb, %o7
	.word	0xd608a015	! t0_kref+0x2ca8:   	ldub	[%g2 + 0x15], %o3
	.word	0x9896c01c	! t0_kref+0x2cac:   	orcc	%i3, %i4, %o4
	.word	0x85a08d3a	! t0_kref+0x2cb0:   	fsmuld	%f2, %f26, %f2
	.word	0xa823000a	! t0_kref+0x2cb4:   	sub	%o4, %o2, %l4
	.word	0x962a400d	! t0_kref+0x2cb8:   	andn	%o1, %o5, %o3
	.word	0x30800005	! t0_kref+0x2cbc:   	ba,a	_kref+0x2cd0
	.word	0xec0e401a	! t0_kref+0x2cc0:   	ldub	[%i1 + %i2], %l6
	.word	0xf36e401c	! t0_kref+0x2cc4:   	prefetch	%i1 + %i4, 25
	.word	0x906229df	! t0_kref+0x2cc8:   	subc	%o0, 0x9df, %o0
	.word	0xd078001c	! t0_kref+0x2ccc:   	swap	[%g0 + %i4], %o0
	.word	0xac82c00a	! t0_kref+0x2cd0:   	addcc	%o3, %o2, %l6
	.word	0x36800004	! t0_kref+0x2cd4:   	bge,a	_kref+0x2ce4
	.word	0xa3a34933	! t0_kref+0x2cd8:   	fmuls	%f13, %f19, %f17
	.word	0xa7400000	! t0_kref+0x2cdc:   	mov	%y, %l3
	call	SYM(t0_subr1)
	.word	0xd24e001a	! t0_kref+0x2ce4:   	ldsb	[%i0 + %i2], %o1
	.word	0xc900a000	! t0_kref+0x2ce8:   	ld	[%g2], %f4
	.word	0x81a9ca25	! t0_kref+0x2cec:   	fcmps	%fcc0, %f7, %f5
	.word	0x81accaac	! t0_kref+0x2cf0:   	fcmpes	%fcc0, %f19, %f12
	.word	0x81a0104e	! t0_kref+0x2cf4:   	fdtox	%f14, %f0
	.word	0xa6fb3b18	! t0_kref+0x2cf8:   	sdivcc	%o4, -0x4e8, %l3
	.word	0xacdb001c	! t0_kref+0x2cfc:   	smulcc	%o4, %i4, %l6
	.word	0x39480002	! t0_kref+0x2d00:   	fbuge,a,pt	%fcc0, _kref+0x2d08
	.word	0x983ec00a	! t0_kref+0x2d04:   	xnor	%i3, %o2, %o4
	.word	0xee4e3ffa	! t0_kref+0x2d08:   	ldsb	[%i0 - 6], %l7
	.word	0xe16e2000	! t0_kref+0x2d0c:   	prefetch	%i0, 16
	.word	0xb1a4085a	! t0_kref+0x2d10:   	faddd	%f16, %f26, %f24
	.word	0xd91f4019	! t0_kref+0x2d14:   	ldd	[%i5 + %i1], %f12
	.word	0xa88ea843	! t0_kref+0x2d18:   	andcc	%i2, 0x843, %l4
	.word	0xe3b8a040	! t0_kref+0x2d1c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd6767fe0	! t0_kref+0x2d20:   	stx	%o3, [%i1 - 0x20]
	.word	0xaa9f001b	! t0_kref+0x2d24:   	xorcc	%i4, %i3, %l5
	.word	0xe11fbe70	! t0_kref+0x2d28:   	ldd	[%fp - 0x190], %f16
	.word	0xa8083235	! t0_kref+0x2d2c:   	and	%g0, -0xdcb, %l4
	.word	0x27480007	! t0_kref+0x2d30:   	fbul,a,pt	%fcc0, _kref+0x2d4c
	.word	0xd8163fec	! t0_kref+0x2d34:   	lduh	[%i0 - 0x14], %o4
	.word	0x9646a7e0	! t0_kref+0x2d38:   	addc	%i2, 0x7e0, %o3
	.word	0x81a00038	! t0_kref+0x2d3c:   	fmovs	%f24, %f0
	.word	0xf16e6018	! t0_kref+0x2d40:   	prefetch	%i1 + 0x18, 24
	.word	0xd808a022	! t0_kref+0x2d44:   	ldub	[%g2 + 0x22], %o4
	.word	0x9a1b0008	! t0_kref+0x2d48:   	xor	%o4, %o0, %o5
	.word	0xd6100018	! t0_kref+0x2d4c:   	lduh	[%g0 + %i0], %o3
	.word	0x81aa0a5a	! t0_kref+0x2d50:   	fcmpd	%fcc0, %f8, %f26
	.word	0x81a00536	! t0_kref+0x2d54:   	fsqrts	%f22, %f0
	.word	0xd9be501d	! t0_kref+0x2d58:   	stda	%f12, [%i1 + %i5]0x80
	.word	0x87a00021	! t0_kref+0x2d5c:   	fmovs	%f1, %f3
	.word	0x33800002	! t0_kref+0x2d60:   	fbe,a	_kref+0x2d68
	.word	0x9026fd60	! t0_kref+0x2d64:   	sub	%i3, -0x2a0, %o0
	.word	0x8da01885	! t0_kref+0x2d68:   	fitos	%f5, %f6
	.word	0xd93e3fe8	! t0_kref+0x2d6c:   	std	%f12, [%i0 - 0x18]
	.word	0x3b800004	! t0_kref+0x2d70:   	fble,a	_kref+0x2d80
	.word	0xa6e6f248	! t0_kref+0x2d74:   	subccc	%i3, -0xdb8, %l3
	.word	0xada0105a	! t0_kref+0x2d78:   	fdtox	%f26, %f22
	.word	0xab400000	! t0_kref+0x2d7c:   	mov	%y, %l5
	.word	0x85a00527	! t0_kref+0x2d80:   	fsqrts	%f7, %f2
	.word	0xb7a189ad	! t0_kref+0x2d84:   	fdivs	%f6, %f13, %f27
	.word	0xea48a02f	! t0_kref+0x2d88:   	ldsb	[%g2 + 0x2f], %l5
	.word	0xee7e7fe8	! t0_kref+0x2d8c:   	swap	[%i1 - 0x18], %l7
	.word	0x94034009	! t0_kref+0x2d90:   	add	%o5, %o1, %o2
	.word	0xc0ae1000	! t0_kref+0x2d94:   	stba	%g0, [%i0]0x80
	.word	0x9e56f333	! t0_kref+0x2d98:   	umul	%i3, -0xccd, %o7
	.word	0x988ac00d	! t0_kref+0x2d9c:   	andcc	%o3, %o5, %o4
	.word	0xaa15c017	! t0_kref+0x2da0:   	or	%l7, %l7, %l5
	.word	0x9aadc00c	! t0_kref+0x2da4:   	andncc	%l7, %o4, %o5
	.word	0x87a000bb	! t0_kref+0x2da8:   	fnegs	%f27, %f3
	.word	0x9a8a2e0b	! t0_kref+0x2dac:   	andcc	%o0, 0xe0b, %o5
	.word	0xee881018	! t0_kref+0x2db0:   	lduba	[%g0 + %i0]0x80, %l7
	.word	0xa1a01918	! t0_kref+0x2db4:   	fitod	%f24, %f16
	.word	0xa9400000	! t0_kref+0x2db8:   	mov	%y, %l4
	.word	0xd8a65000	! t0_kref+0x2dbc:   	sta	%o4, [%i1]0x80
	.word	0xec48a02c	! t0_kref+0x2dc0:   	ldsb	[%g2 + 0x2c], %l6
	.word	0xa9a018da	! t0_kref+0x2dc4:   	fdtos	%f26, %f20
	.word	0xb1a4894e	! t0_kref+0x2dc8:   	fmuld	%f18, %f14, %f24
	.word	0x91a60931	! t0_kref+0x2dcc:   	fmuls	%f24, %f17, %f8
	.word	0xaf22800c	! t0_kref+0x2dd0:   	mulscc	%o2, %o4, %l7
	.word	0x9fa01a36	! t0_kref+0x2dd4:   	fstoi	%f22, %f15
	.word	0x87a1883b	! t0_kref+0x2dd8:   	fadds	%f6, %f27, %f3
	.word	0x9222b8f6	! t0_kref+0x2ddc:   	sub	%o2, -0x70a, %o1
	.word	0xdb26600c	! t0_kref+0x2de0:   	st	%f13, [%i1 + 0xc]
	.word	0x989b3a82	! t0_kref+0x2de4:   	xorcc	%o4, -0x57e, %o4
	.word	0xa5a0052d	! t0_kref+0x2de8:   	fsqrts	%f13, %f18
	.word	0x9e12c000	! t0_kref+0x2dec:   	or	%o3, %g0, %o7
	.word	0x925eb838	! t0_kref+0x2df0:   	smul	%i2, -0x7c8, %o1
	.word	0x908a801c	! t0_kref+0x2df4:   	andcc	%o2, %i4, %o0
	.word	0x9de3bfa0	! t0_kref+0x2df8:   	save	%sp, -0x60, %sp
	.word	0xb2aef423	! t0_kref+0x2dfc:   	andncc	%i3, -0xbdd, %i1
	.word	0xafef732b	! t0_kref+0x2e00:   	restore	%i5, -0xcd5, %l7
	.word	0x30800003	! t0_kref+0x2e04:   	ba,a	_kref+0x2e10
	.word	0x8da109b6	! t0_kref+0x2e08:   	fdivs	%f4, %f22, %f6
	.word	0xc807bfe4	! t0_kref+0x2e0c:   	ld	[%fp - 0x1c], %g4
	.word	0xae56800c	! t0_kref+0x2e10:   	umul	%i2, %o4, %l7
	.word	0xc568a00a	! t0_kref+0x2e14:   	prefetch	%g2 + 0xa, 2
	.word	0xd440a004	! t0_kref+0x2e18:   	ldsw	[%g2 + 4], %o2
	.word	0xe8180019	! t0_kref+0x2e1c:   	ldd	[%g0 + %i1], %l4
	.word	0xac7a800a	! t0_kref+0x2e20:   	sdiv	%o2, %o2, %l6
	.word	0x81ae0aa3	! t0_kref+0x2e24:   	fcmpes	%fcc0, %f24, %f3
	.word	0xae72000d	! t0_kref+0x2e28:   	udiv	%o0, %o5, %l7
	.word	0x8610200d	! t0_kref+0x2e2c:   	mov	0xd, %g3
	.word	0x86a0e001	! t0_kref+0x2e30:   	subcc	%g3, 1, %g3
	.word	0x2280000b	! t0_kref+0x2e34:   	be,a	_kref+0x2e60
	.word	0x9b32a01b	! t0_kref+0x2e38:   	srl	%o2, 0x1b, %o5
	.word	0x19116037	! t0_kref+0x2e3c:   	sethi	%hi(0x4580dc00), %o4
	.word	0x9226c01b	! t0_kref+0x2e40:   	sub	%i3, %i3, %o1
	.word	0x2bbffffb	! t0_kref+0x2e44:   	fbug,a	_kref+0x2e30
	.word	0x81dbea9e	! t0_kref+0x2e48:   	flush	%o7 + 0xa9e
	.word	0x81ac8a4a	! t0_kref+0x2e4c:   	fcmpd	%fcc0, %f18, %f10
	.word	0xaba0012a	! t0_kref+0x2e50:   	fabss	%f10, %f21
	.word	0x91400000	! t0_kref+0x2e54:   	mov	%y, %o0
	.word	0xd636401b	! t0_kref+0x2e58:   	sth	%o3, [%i1 + %i3]
	.word	0xe6167ffc	! t0_kref+0x2e5c:   	lduh	[%i1 - 4], %l3
	.word	0x8da01040	! t0_kref+0x2e60:   	fdtox	%f0, %f6
	.word	0x9292000b	! t0_kref+0x2e64:   	orcc	%o0, %o3, %o1
	.word	0xb5a018c4	! t0_kref+0x2e68:   	fdtos	%f4, %f26
	.word	0x39800005	! t0_kref+0x2e6c:   	fbuge,a	_kref+0x2e80
	.word	0x81a4492f	! t0_kref+0x2e70:   	fmuls	%f17, %f15, %f0
	.word	0x31480007	! t0_kref+0x2e74:   	fba,a,pt	%fcc0, _kref+0x2e90
	.word	0xd41e401d	! t0_kref+0x2e78:   	ldd	[%i1 + %i5], %o2
	.word	0x81aa4ab2	! t0_kref+0x2e7c:   	fcmpes	%fcc0, %f9, %f18
	.word	0xde4e2019	! t0_kref+0x2e80:   	ldsb	[%i0 + 0x19], %o7
	.word	0xca20001c	! t0_kref+0x2e84:   	st	%g5, [%g0 + %i4]
	.word	0x1319ae47	! t0_kref+0x2e88:   	sethi	%hi(0x66b91c00), %o1
	.word	0xac52a032	! t0_kref+0x2e8c:   	umul	%o2, 0x32, %l6
	.word	0x95400000	! t0_kref+0x2e90:   	mov	%y, %o2
	.word	0xb5a6884a	! t0_kref+0x2e94:   	faddd	%f26, %f10, %f26
	.word	0xee30a028	! t0_kref+0x2e98:   	sth	%l7, [%g2 + 0x28]
	.word	0x89a109ac	! t0_kref+0x2e9c:   	fdivs	%f4, %f12, %f4
	.word	0x961b2b54	! t0_kref+0x2ea0:   	xor	%o4, 0xb54, %o3
	.word	0xa656801b	! t0_kref+0x2ea4:   	umul	%i2, %i3, %l3
	.word	0x9ba000af	! t0_kref+0x2ea8:   	fnegs	%f15, %f13
	.word	0x93400000	! t0_kref+0x2eac:   	mov	%y, %o1
	.word	0xab2f0008	! t0_kref+0x2eb0:   	sll	%i4, %o0, %l5
	.word	0x191ee6a5	! t0_kref+0x2eb4:   	sethi	%hi(0x7b9a9400), %o4
	.word	0xa5a648a3	! t0_kref+0x2eb8:   	fsubs	%f25, %f3, %f18
	.word	0xacab72bc	! t0_kref+0x2ebc:   	andncc	%o5, -0xd44, %l6
	.word	0xe64e4000	! t0_kref+0x2ec0:   	ldsb	[%i1], %l3
	.word	0xf207bfe0	! t0_kref+0x2ec4:   	ld	[%fp - 0x20], %i1
	.word	0xeeae1000	! t0_kref+0x2ec8:   	stba	%l7, [%i0]0x80
	.word	0xa9a008d6	! t0_kref+0x2ecc:   	fsubd	%f0, %f22, %f20
	.word	0xd220a028	! t0_kref+0x2ed0:   	st	%o1, [%g2 + 0x28]
	.word	0x9495f00b	! t0_kref+0x2ed4:   	orcc	%l7, -0xff5, %o2
	.word	0x9ba609b2	! t0_kref+0x2ed8:   	fdivs	%f24, %f18, %f13
	.word	0xec50a01e	! t0_kref+0x2edc:   	ldsh	[%g2 + 0x1e], %l6
	.word	0xaf2a0008	! t0_kref+0x2ee0:   	sll	%o0, %o0, %l7
	.word	0x35480007	! t0_kref+0x2ee4:   	fbue,a,pt	%fcc0, _kref+0x2f00
	.word	0xd60e2013	! t0_kref+0x2ee8:   	ldub	[%i0 + 0x13], %o3
	.word	0x91a488da	! t0_kref+0x2eec:   	fsubd	%f18, %f26, %f8
	.word	0xac5dc00b	! t0_kref+0x2ef0:   	smul	%l7, %o3, %l6
	.word	0xe51fbe48	! t0_kref+0x2ef4:   	ldd	[%fp - 0x1b8], %f18
	.word	0x94dae74a	! t0_kref+0x2ef8:   	smulcc	%o3, 0x74a, %o2
	.word	0xd0470018	! t0_kref+0x2efc:   	ldsw	[%i4 + %i0], %o0
	.word	0xae0b2ace	! t0_kref+0x2f00:   	and	%o4, 0xace, %l7
	.word	0xab22f30c	! t0_kref+0x2f04:   	mulscc	%o3, -0xcf4, %l5
	.word	0xab400000	! t0_kref+0x2f08:   	mov	%y, %l5
	.word	0x8da00536	! t0_kref+0x2f0c:   	fsqrts	%f22, %f6
	.word	0x95a508c0	! t0_kref+0x2f10:   	fsubd	%f20, %f0, %f10
	.word	0xd51fbc68	! t0_kref+0x2f14:   	ldd	[%fp - 0x398], %f10
	.word	0x96468000	! t0_kref+0x2f18:   	addc	%i2, %g0, %o3
	.word	0xaa222082	! t0_kref+0x2f1c:   	sub	%o0, 0x82, %l5
	.word	0xa8923d4e	! t0_kref+0x2f20:   	orcc	%o0, -0x2b2, %l4
	.word	0x988a215a	! t0_kref+0x2f24:   	andcc	%o0, 0x15a, %o4
	.word	0xaaaa6151	! t0_kref+0x2f28:   	andncc	%o1, 0x151, %l5
	.word	0x9a726629	! t0_kref+0x2f2c:   	udiv	%o1, 0x629, %o5
	.word	0xaec276e4	! t0_kref+0x2f30:   	addccc	%o1, -0x91c, %l7
	.word	0x9643001a	! t0_kref+0x2f34:   	addc	%o4, %i2, %o3
	.word	0xd11fbf00	! t0_kref+0x2f38:   	ldd	[%fp - 0x100], %f8
	.word	0x81ab8a4a	! t0_kref+0x2f3c:   	fcmpd	%fcc0, %f14, %f10
	.word	0xb1a6c822	! t0_kref+0x2f40:   	fadds	%f27, %f2, %f24
	.word	0xeb262014	! t0_kref+0x2f44:   	st	%f21, [%i0 + 0x14]
	.word	0x8da68821	! t0_kref+0x2f48:   	fadds	%f26, %f1, %f6
	.word	0x31480006	! t0_kref+0x2f4c:   	fba,a,pt	%fcc0, _kref+0x2f64
	.word	0xb5a608d0	! t0_kref+0x2f50:   	fsubd	%f24, %f16, %f26
	.word	0x81ab0aa5	! t0_kref+0x2f54:   	fcmpes	%fcc0, %f12, %f5
	.word	0x988a2475	! t0_kref+0x2f58:   	andcc	%o0, 0x475, %o4
	.word	0xf4262000	! t0_kref+0x2f5c:   	st	%i2, [%i0]
	.word	0xc320a00c	! t0_kref+0x2f60:   	st	%f1, [%g2 + 0xc]
	.word	0xaba00521	! t0_kref+0x2f64:   	fsqrts	%f1, %f21
	.word	0x31800005	! t0_kref+0x2f68:   	fba,a	_kref+0x2f7c
	.word	0x932dc00b	! t0_kref+0x2f6c:   	sll	%l7, %o3, %o1
	.word	0x8185c000	! t0_kref+0x2f70:   	wr	%l7, %g0, %y
	.word	0xab06b424	! t0_kref+0x2f74:   	taddcc	%i2, -0xbdc, %l5
	.word	0xb1a109b4	! t0_kref+0x2f78:   	fdivs	%f4, %f20, %f24
	call	SYM(t0_subr0)
	.word	0xda267fe4	! t0_kref+0x2f80:   	st	%o5, [%i1 - 0x1c]
	.word	0xa8626a7a	! t0_kref+0x2f84:   	subc	%o1, 0xa7a, %l4
	.word	0x83a54821	! t0_kref+0x2f88:   	fadds	%f21, %f1, %f1
	.word	0x926034fd	! t0_kref+0x2f8c:   	subc	%g0, -0xb03, %o1
	.word	0xe91e4000	! t0_kref+0x2f90:   	ldd	[%i1], %f20
	.word	0x001fffff	! t0_kref+0x2f94:   	illtrap	0x1fffff
	.word	0xf36e6018	! t0_kref+0x2f98:   	prefetch	%i1 + 0x18, 25
	.word	0xc0f65000	! t0_kref+0x2f9c:   	stxa	%g0, [%i1]0x80
	.word	0x89a209a7	! t0_kref+0x2fa0:   	fdivs	%f8, %f7, %f4
	.word	0x3d800003	! t0_kref+0x2fa4:   	fbule,a	_kref+0x2fb0
	.word	0xf630a038	! t0_kref+0x2fa8:   	sth	%i3, [%g2 + 0x38]
	.word	0xd810a03c	! t0_kref+0x2fac:   	lduh	[%g2 + 0x3c], %o4
	.word	0x85a01881	! t0_kref+0x2fb0:   	fitos	%f1, %f2
	.word	0x92e0001c	! t0_kref+0x2fb4:   	subccc	%g0, %i4, %o1
	.word	0xab2b600c	! t0_kref+0x2fb8:   	sll	%o5, 0xc, %l5
	.word	0xa5a00130	! t0_kref+0x2fbc:   	fabss	%f16, %f18
	.word	0x9b400000	! t0_kref+0x2fc0:   	mov	%y, %o5
	.word	0xf100a024	! t0_kref+0x2fc4:   	ld	[%g2 + 0x24], %f24
	.word	0xd228a00b	! t0_kref+0x2fc8:   	stb	%o1, [%g2 + 0xb]
	.word	0xea164000	! t0_kref+0x2fcc:   	lduh	[%i1], %l5
	.word	0x81ac8a5a	! t0_kref+0x2fd0:   	fcmpd	%fcc0, %f18, %f26
	.word	0xaa1aa63f	! t0_kref+0x2fd4:   	xor	%o2, 0x63f, %l5
	.word	0x37480002	! t0_kref+0x2fd8:   	fbge,a,pt	%fcc0, _kref+0x2fe0
	.word	0xa7a01084	! t0_kref+0x2fdc:   	fxtos	%f4, %f19
	.word	0x31480005	! t0_kref+0x2fe0:   	fba,a,pt	%fcc0, _kref+0x2ff4
	.word	0xd91fbd90	! t0_kref+0x2fe4:   	ldd	[%fp - 0x270], %f12
	.word	0xb3a000ba	! t0_kref+0x2fe8:   	fnegs	%f26, %f25
	.word	0xee262000	! t0_kref+0x2fec:   	st	%l7, [%i0]
	.word	0xaed3001a	! t0_kref+0x2ff0:   	umulcc	%o4, %i2, %l7
	.word	0x989a000d	! t0_kref+0x2ff4:   	xorcc	%o0, %o5, %o4
	.word	0x87a01a34	! t0_kref+0x2ff8:   	fstoi	%f20, %f3
	.word	0x9602c017	! t0_kref+0x2ffc:   	add	%o3, %l7, %o3
	.word	0x39480001	! t0_kref+0x3000:   	fbuge,a,pt	%fcc0, _kref+0x3004
	.word	0xa3a000af	! t0_kref+0x3004:   	fnegs	%f15, %f17
	.word	0xafa60928	! t0_kref+0x3008:   	fmuls	%f24, %f8, %f23
	.word	0xedee101b	! t0_kref+0x300c:   	prefetcha	%i0 + %i3, 22
	.word	0xae8f3515	! t0_kref+0x3010:   	andcc	%i4, -0xaeb, %l7
	.word	0x92936c32	! t0_kref+0x3014:   	orcc	%o5, 0xc32, %o1
	.word	0xd850a030	! t0_kref+0x3018:   	ldsh	[%g2 + 0x30], %o4
	.word	0xd9be584d	! t0_kref+0x301c:   	stda	%f12, [%i1 + %o5]0xc2
	.word	0xa9a44931	! t0_kref+0x3020:   	fmuls	%f17, %f17, %f20
	.word	0xec96d019	! t0_kref+0x3024:   	lduha	[%i3 + %i1]0x80, %l6
	.word	0xda080019	! t0_kref+0x3028:   	ldub	[%g0 + %i1], %o5
	.word	0xaa96800d	! t0_kref+0x302c:   	orcc	%i2, %o5, %l5
	.word	0xa1a6894a	! t0_kref+0x3030:   	fmuld	%f26, %f10, %f16
	.word	0x112b2715	! t0_kref+0x3034:   	sethi	%hi(0xac9c5400), %o0
	.word	0xf207bfe0	! t0_kref+0x3038:   	ld	[%fp - 0x20], %i1
	.word	0xda762000	! t0_kref+0x303c:   	stx	%o5, [%i0]
	.word	0xe6166002	! t0_kref+0x3040:   	lduh	[%i1 + 2], %l3
	.word	0x99a6c922	! t0_kref+0x3044:   	fmuls	%f27, %f2, %f12
	.word	0x9293000a	! t0_kref+0x3048:   	orcc	%o4, %o2, %o1
	.word	0x988ec00d	! t0_kref+0x304c:   	andcc	%i3, %o5, %o4
	.word	0x99a018d8	! t0_kref+0x3050:   	fdtos	%f24, %f12
	.word	0xa6d32681	! t0_kref+0x3054:   	umulcc	%o4, 0x681, %l3
	.word	0xe64e3ff5	! t0_kref+0x3058:   	ldsb	[%i0 - 0xb], %l3
	.word	0xa87a401a	! t0_kref+0x305c:   	sdiv	%o1, %i2, %l4
	.word	0xed6e7fe0	! t0_kref+0x3060:   	prefetch	%i1 - 0x20, 22
	.word	0x85a208c4	! t0_kref+0x3064:   	fsubd	%f8, %f4, %f2
	.word	0x81ad4a36	! t0_kref+0x3068:   	fcmps	%fcc0, %f21, %f22
	.word	0x91a188da	! t0_kref+0x306c:   	fsubd	%f6, %f26, %f8
	.word	0xde10a022	! t0_kref+0x3070:   	lduh	[%g2 + 0x22], %o7
	.word	0x94c72350	! t0_kref+0x3074:   	addccc	%i4, 0x350, %o2
	.word	0xaa95f398	! t0_kref+0x3078:   	orcc	%l7, -0xc68, %l5
	.word	0xf826001c	! t0_kref+0x307c:   	st	%i4, [%i0 + %i4]
	.word	0xe1ee101a	! t0_kref+0x3080:   	prefetcha	%i0 + %i2, 16
	.word	0x85a689c4	! t0_kref+0x3084:   	fdivd	%f26, %f4, %f2
	.word	0x2c480002	! t0_kref+0x3088:   	bneg,a,pt	%icc, _kref+0x3090
	.word	0xd640a03c	! t0_kref+0x308c:   	ldsw	[%g2 + 0x3c], %o3
	.word	0xaca228f2	! t0_kref+0x3090:   	subcc	%o0, 0x8f2, %l6
	.word	0x35480003	! t0_kref+0x3094:   	fbue,a,pt	%fcc0, _kref+0x30a0
	.word	0x9da4c9ab	! t0_kref+0x3098:   	fdivs	%f19, %f11, %f14
	.word	0x98230009	! t0_kref+0x309c:   	sub	%o4, %o1, %o4
	.word	0xb7a24824	! t0_kref+0x30a0:   	fadds	%f9, %f4, %f27
	.word	0xe41f4019	! t0_kref+0x30a4:   	ldd	[%i5 + %i1], %l2
	.word	0x81ae0a46	! t0_kref+0x30a8:   	fcmpd	%fcc0, %f24, %f6
	.word	0xaa8b001c	! t0_kref+0x30ac:   	andcc	%o4, %i4, %l5
	.word	0x9a62bd7a	! t0_kref+0x30b0:   	subc	%o2, -0x286, %o5
	.word	0x37480008	! t0_kref+0x30b4:   	fbge,a,pt	%fcc0, _kref+0x30d4
	.word	0xd48e1000	! t0_kref+0x30b8:   	lduba	[%i0]0x80, %o2
	.word	0xe7ee101b	! t0_kref+0x30bc:   	prefetcha	%i0 + %i3, 19
	.word	0x9fa608ad	! t0_kref+0x30c0:   	fsubs	%f24, %f13, %f15
	.word	0x33480006	! t0_kref+0x30c4:   	fbe,a,pt	%fcc0, _kref+0x30dc
	.word	0xea6e7fe8	! t0_kref+0x30c8:   	ldstub	[%i1 - 0x18], %l5
	.word	0xd468a02d	! t0_kref+0x30cc:   	ldstub	[%g2 + 0x2d], %o2
	.word	0x192514cf	! t0_kref+0x30d0:   	sethi	%hi(0x94533c00), %o4
	.word	0x91a008d4	! t0_kref+0x30d4:   	fsubd	%f0, %f20, %f8
	.word	0xc126401c	! t0_kref+0x30d8:   	st	%f0, [%i1 + %i4]
	.word	0x83a00131	! t0_kref+0x30dc:   	fabss	%f17, %f1
	.word	0x9e07000a	! t0_kref+0x30e0:   	add	%i4, %o2, %o7
	.word	0x8da408c0	! t0_kref+0x30e4:   	fsubd	%f16, %f0, %f6
	.word	0xe1be185a	! t0_kref+0x30e8:   	stda	%f16, [%i0 + %i2]0xc2
	.word	0xa8e24017	! t0_kref+0x30ec:   	subccc	%o1, %l7, %l4
	.word	0x23480006	! t0_kref+0x30f0:   	fbne,a,pt	%fcc0, _kref+0x3108
	.word	0xada349ab	! t0_kref+0x30f4:   	fdivs	%f13, %f11, %f22
	.word	0x32800005	! t0_kref+0x30f8:   	bne,a	_kref+0x310c
	.word	0x87a01a2b	! t0_kref+0x30fc:   	fstoi	%f11, %f3
	.word	0xcb00a034	! t0_kref+0x3100:   	ld	[%g2 + 0x34], %f5
	.word	0x92520017	! t0_kref+0x3104:   	umul	%o0, %l7, %o1
	.word	0xa8983ebb	! t0_kref+0x3108:   	xorcc	%g0, -0x145, %l4
	.word	0x91a00129	! t0_kref+0x310c:   	fabss	%f9, %f8
	.word	0x81aa0aa4	! t0_kref+0x3110:   	fcmpes	%fcc0, %f8, %f4
	.word	0x1933ddeb	! t0_kref+0x3114:   	sethi	%hi(0xcf77ac00), %o4
	.word	0xab70289a	! t0_kref+0x3118:   	popc	0x89a, %l5
	.word	0x91a6cd32	! t0_kref+0x311c:   	fsmuld	%f27, %f18, %f8
	.word	0x924329c8	! t0_kref+0x3120:   	addc	%o4, 0x9c8, %o1
	.word	0x83a018c4	! t0_kref+0x3124:   	fdtos	%f4, %f1
	.word	0x25480005	! t0_kref+0x3128:   	fblg,a,pt	%fcc0, _kref+0x313c
	.word	0xec1e0000	! t0_kref+0x312c:   	ldd	[%i0], %l6
	.word	0xb1a44836	! t0_kref+0x3130:   	fadds	%f17, %f22, %f24
	.word	0xaba01a25	! t0_kref+0x3134:   	fstoi	%f5, %f21
	.word	0x9693000c	! t0_kref+0x3138:   	orcc	%o4, %o4, %o3
	.word	0xee780018	! t0_kref+0x313c:   	swap	[%g0 + %i0], %l7
	.word	0xaaf0000c	! t0_kref+0x3140:   	udivcc	%g0, %o4, %l5
	.word	0x30800004	! t0_kref+0x3144:   	ba,a	_kref+0x3154
	.word	0xa1a689c8	! t0_kref+0x3148:   	fdivd	%f26, %f8, %f16
	.word	0x912f2019	! t0_kref+0x314c:   	sll	%i4, 0x19, %o0
	.word	0x2b800008	! t0_kref+0x3150:   	fbug,a	_kref+0x3170
	.word	0x9236800d	! t0_kref+0x3154:   	orn	%i2, %o5, %o1
	.word	0xd41e401d	! t0_kref+0x3158:   	ldd	[%i1 + %i5], %o2
	.word	0xee40a020	! t0_kref+0x315c:   	ldsw	[%g2 + 0x20], %l7
	.word	0xe3b8a040	! t0_kref+0x3160:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xf007bfe0	! t0_kref+0x3164:   	ld	[%fp - 0x20], %i0
	.word	0xd200a028	! t0_kref+0x3168:   	ld	[%g2 + 0x28], %o1
	.word	0x3d480008	! t0_kref+0x316c:   	fbule,a,pt	%fcc0, _kref+0x318c
	.word	0xa3a5c930	! t0_kref+0x3170:   	fmuls	%f23, %f16, %f17
	call	SYM(t0_subr1)
	.word	0x9fa00521	! t0_kref+0x3178:   	fsqrts	%f1, %f15
	.word	0xd200a034	! t0_kref+0x317c:   	ld	[%g2 + 0x34], %o1
	.word	0xf720a038	! t0_kref+0x3180:   	st	%f27, [%g2 + 0x38]
	.word	0x9ba189b7	! t0_kref+0x3184:   	fdivs	%f6, %f23, %f13
	.word	0x9f32a015	! t0_kref+0x3188:   	srl	%o2, 0x15, %o7
	.word	0x93418000	! t0_kref+0x318c:   	mov	%fprs, %o1
	sethi	%hi(2f), %o7
	.word	0xe40be1dc	! t0_kref+0x3194:   	ldub	[%o7 + 0x1dc], %l2
	.word	0xa41ca00c	! t0_kref+0x3198:   	xor	%l2, 0xc, %l2
	.word	0xe42be1dc	! t0_kref+0x319c:   	stb	%l2, [%o7 + 0x1dc]
	.word	0x81dbe1dc	! t0_kref+0x31a0:   	flush	%o7 + 0x1dc
	.word	0x33800004	! t0_kref+0x31a4:   	fbe,a	_kref+0x31b4
	.word	0xb1a1884c	! t0_kref+0x31a8:   	faddd	%f6, %f12, %f24
	.word	0x9606a0ad	! t0_kref+0x31ac:   	add	%i2, 0xad, %o3
	.word	0xc91fbc78	! t0_kref+0x31b0:   	ldd	[%fp - 0x388], %f4
	.word	0x81a98aab	! t0_kref+0x31b4:   	fcmpes	%fcc0, %f6, %f11
	.word	0x81aa0ab4	! t0_kref+0x31b8:   	fcmpes	%fcc0, %f8, %f20
	.word	0xd608a001	! t0_kref+0x31bc:   	ldub	[%g2 + 1], %o3
	.word	0xac9a000c	! t0_kref+0x31c0:   	xorcc	%o0, %o4, %l6
	.word	0x912e800b	! t0_kref+0x31c4:   	sll	%i2, %o3, %o0
	.word	0xc9be181c	! t0_kref+0x31c8:   	stda	%f4, [%i0 + %i4]0xc0
	.word	0xa876ae79	! t0_kref+0x31cc:   	udiv	%i2, 0xe79, %l4
	.word	0xd6280018	! t0_kref+0x31d0:   	stb	%o3, [%g0 + %i0]
	.word	0x87a489af	! t0_kref+0x31d4:   	fdivs	%f18, %f15, %f3
	.word	0x98ddc017	! t0_kref+0x31d8:   	smulcc	%l7, %l7, %o4
2:	.word	0xe03e001d	! t0_kref+0x31dc:   	std	%l0, [%i0 + %i5]
	.word	0xc9be1889	! t0_kref+0x31e0:   	stda	%f4, [%i0 + %o1]0xc4
	.word	0xde16401b	! t0_kref+0x31e4:   	lduh	[%i1 + %i3], %o7
	.word	0xa7a109a9	! t0_kref+0x31e8:   	fdivs	%f4, %f9, %f19
	sethi	%hi(2f), %o7
	.word	0xe40be218	! t0_kref+0x31f0:   	ldub	[%o7 + 0x218], %l2
	.word	0xa41ca00c	! t0_kref+0x31f4:   	xor	%l2, 0xc, %l2
	.word	0xe42be218	! t0_kref+0x31f8:   	stb	%l2, [%o7 + 0x218]
	.word	0x81dbe218	! t0_kref+0x31fc:   	flush	%o7 + 0x218
	.word	0x81580000	! t0_kref+0x3200:   	flushw
	.word	0xd11fbef8	! t0_kref+0x3204:   	ldd	[%fp - 0x108], %f8
	.word	0x97a549a1	! t0_kref+0x3208:   	fdivs	%f21, %f1, %f11
	.word	0xd650a014	! t0_kref+0x320c:   	ldsh	[%g2 + 0x14], %o3
	.word	0xb3a00536	! t0_kref+0x3210:   	fsqrts	%f22, %f25
	.word	0x27480003	! t0_kref+0x3214:   	fbul,a,pt	%fcc0, _kref+0x3220
2:	.word	0xa852f439	! t0_kref+0x3218:   	umul	%o3, -0xbc7, %l4
	.word	0xea16001b	! t0_kref+0x321c:   	lduh	[%i0 + %i3], %l5
	.word	0xada6c9a3	! t0_kref+0x3220:   	fdivs	%f27, %f3, %f22
	.word	0xd400a01c	! t0_kref+0x3224:   	ld	[%g2 + 0x1c], %o2
	.word	0x9da388d8	! t0_kref+0x3228:   	fsubd	%f14, %f24, %f14
	.word	0x85a00528	! t0_kref+0x322c:   	fsqrts	%f8, %f2
	.word	0xaa1a400c	! t0_kref+0x3230:   	xor	%o1, %o4, %l5
	.word	0x9de3bfa0	! t0_kref+0x3234:   	save	%sp, -0x60, %sp
	.word	0xa7ee4019	! t0_kref+0x3238:   	restore	%i1, %i1, %l3
	.word	0xdb200019	! t0_kref+0x323c:   	st	%f13, [%g0 + %i1]
	.word	0xe1260000	! t0_kref+0x3240:   	st	%f16, [%i0]
	.word	0x9da18929	! t0_kref+0x3244:   	fmuls	%f6, %f9, %f14
	.word	0xd810a022	! t0_kref+0x3248:   	lduh	[%g2 + 0x22], %o4
	.word	0x94603b2e	! t0_kref+0x324c:   	subc	%g0, -0x4d2, %o2
	.word	0xaa93001b	! t0_kref+0x3250:   	orcc	%o4, %i3, %l5
	.word	0xf1ee101b	! t0_kref+0x3254:   	prefetcha	%i0 + %i3, 24
	.word	0x8143c000	! t0_kref+0x3258:   	stbar
	.word	0x98d3000c	! t0_kref+0x325c:   	umulcc	%o4, %o4, %o4
	.word	0xd11fbc08	! t0_kref+0x3260:   	ldd	[%fp - 0x3f8], %f8
	.word	0x923a6104	! t0_kref+0x3264:   	xnor	%o1, 0x104, %o1
	.word	0x9006800c	! t0_kref+0x3268:   	add	%i2, %o4, %o0
	sethi	%hi(2f), %o7
	.word	0xe40be288	! t0_kref+0x3270:   	ldub	[%o7 + 0x288], %l2
	.word	0xa41ca00c	! t0_kref+0x3274:   	xor	%l2, 0xc, %l2
	.word	0xe42be288	! t0_kref+0x3278:   	stb	%l2, [%o7 + 0x288]
	.word	0x81dbe288	! t0_kref+0x327c:   	flush	%o7 + 0x288
	.word	0xd4871040	! t0_kref+0x3280:   	lda	[%i4]0x82, %o2
	.word	0xf62e3fef	! t0_kref+0x3284:   	stb	%i3, [%i0 - 0x11]
2:	.word	0xaa180008	! t0_kref+0x3288:   	xor	%g0, %o0, %l5
	.word	0x21800002	! t0_kref+0x328c:   	fbn,a	_kref+0x3294
	.word	0xa5a549b5	! t0_kref+0x3290:   	fdivs	%f21, %f21, %f18
	.word	0x9da00031	! t0_kref+0x3294:   	fmovs	%f17, %f14
	.word	0x99400000	! t0_kref+0x3298:   	mov	%y, %o4
	.word	0x98036d31	! t0_kref+0x329c:   	add	%o5, 0xd31, %o4
	.word	0xf630a006	! t0_kref+0x32a0:   	sth	%i3, [%g2 + 6]
	.word	0xd0bf5018	! t0_kref+0x32a4:   	stda	%o0, [%i5 + %i0]0x80
	.word	0xed00a000	! t0_kref+0x32a8:   	ld	[%g2], %f22
	.word	0xe3b8a040	! t0_kref+0x32ac:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xe8ee101a	! t0_kref+0x32b0:   	ldstuba	[%i0 + %i2]0x80, %l4
	.word	0xae65e932	! t0_kref+0x32b4:   	subc	%l7, 0x932, %l7
	.word	0xed00a02c	! t0_kref+0x32b8:   	ld	[%g2 + 0x2c], %f22
	.word	0xace6b251	! t0_kref+0x32bc:   	subccc	%i2, -0xdaf, %l6
	.word	0x91a2c831	! t0_kref+0x32c0:   	fadds	%f11, %f17, %f8
	.word	0x20800002	! t0_kref+0x32c4:   	bn,a	_kref+0x32cc
	.word	0x81dc401f	! t0_kref+0x32c8:   	flush	%l1 + %i7
	.word	0x81ad8aa8	! t0_kref+0x32cc:   	fcmpes	%fcc0, %f22, %f8
	.word	0xf626001c	! t0_kref+0x32d0:   	st	%i3, [%i0 + %i4]
	.word	0x8da00132	! t0_kref+0x32d4:   	fabss	%f18, %f6
	.word	0x81acca25	! t0_kref+0x32d8:   	fcmps	%fcc0, %f19, %f5
	.word	0x9fa4c82e	! t0_kref+0x32dc:   	fadds	%f19, %f14, %f15
	.word	0x87a00821	! t0_kref+0x32e0:   	fadds	%f0, %f1, %f3
	.word	0xa3a018d6	! t0_kref+0x32e4:   	fdtos	%f22, %f17
	.word	0xd53e0000	! t0_kref+0x32e8:   	std	%f10, [%i0]
	.word	0xde4e8018	! t0_kref+0x32ec:   	ldsb	[%i2 + %i0], %o7
	.word	0x81ad0ac0	! t0_kref+0x32f0:   	fcmped	%fcc0, %f20, %f0
	.word	0xeb68a04c	! t0_kref+0x32f4:   	prefetch	%g2 + 0x4c, 21
	.word	0x96a27c1e	! t0_kref+0x32f8:   	subcc	%o1, -0x3e2, %o3
	.word	0x980a400b	! t0_kref+0x32fc:   	and	%o1, %o3, %o4
	.word	0x95a088ca	! t0_kref+0x3300:   	fsubd	%f2, %f10, %f10
	.word	0xd82e3ff1	! t0_kref+0x3304:   	stb	%o4, [%i0 - 0xf]
	.word	0xaf418000	! t0_kref+0x3308:   	mov	%fprs, %l7
	.word	0xee5e0000	! t0_kref+0x330c:   	ldx	[%i0], %l7
	.word	0xac55c017	! t0_kref+0x3310:   	umul	%l7, %l7, %l6
	.word	0x945f2841	! t0_kref+0x3314:   	smul	%i4, 0x841, %o2
	sethi	%hi(2f), %o7
	.word	0xe40be360	! t0_kref+0x331c:   	ldub	[%o7 + 0x360], %l2
	.word	0xa41ca00c	! t0_kref+0x3320:   	xor	%l2, 0xc, %l2
	.word	0xe42be360	! t0_kref+0x3324:   	stb	%l2, [%o7 + 0x360]
	.word	0x81dbe360	! t0_kref+0x3328:   	flush	%o7 + 0x360
	.word	0xec567fee	! t0_kref+0x332c:   	ldsh	[%i1 - 0x12], %l6
	.word	0xd2861000	! t0_kref+0x3330:   	lda	[%i0]0x80, %o1
	.word	0x8da01a30	! t0_kref+0x3334:   	fstoi	%f16, %f6
	.word	0xf3a71018	! t0_kref+0x3338:   	sta	%f25, [%i4 + %i0]0x80
	.word	0xf42e4000	! t0_kref+0x333c:   	stb	%i2, [%i1]
	.word	0x1137c07a	! t0_kref+0x3340:   	sethi	%hi(0xdf01e800), %o0
	.word	0x9292fcce	! t0_kref+0x3344:   	orcc	%o3, -0x332, %o1
	.word	0x901ec00d	! t0_kref+0x3348:   	xor	%i3, %o5, %o0
	.word	0xada00535	! t0_kref+0x334c:   	fsqrts	%f21, %f22
	.word	0x2e800004	! t0_kref+0x3350:   	bvs,a	_kref+0x3360
	.word	0xe6064000	! t0_kref+0x3354:   	ld	[%i1], %l3
	.word	0x8586c017	! t0_kref+0x3358:   	wr	%i3, %l7, %ccr
	.word	0xa8273a54	! t0_kref+0x335c:   	sub	%i4, -0x5ac, %l4
2:	.word	0xd200a010	! t0_kref+0x3360:   	ld	[%g2 + 0x10], %o1
	.word	0xada60858	! t0_kref+0x3364:   	faddd	%f24, %f24, %f22
	.word	0xea4e8019	! t0_kref+0x3368:   	ldsb	[%i2 + %i1], %l5
	.word	0x97a388a5	! t0_kref+0x336c:   	fsubs	%f14, %f5, %f11
	.word	0xf7263ff4	! t0_kref+0x3370:   	st	%f27, [%i0 - 0xc]
	.word	0xafa609b1	! t0_kref+0x3374:   	fdivs	%f24, %f17, %f23
	.word	0x9eaf21b0	! t0_kref+0x3378:   	andncc	%i4, 0x1b0, %o7
	.word	0xaedf3bf3	! t0_kref+0x337c:   	smulcc	%i4, -0x40d, %l7
	.word	0xae7f2876	! t0_kref+0x3380:   	sdiv	%i4, 0x876, %l7
	.word	0x8da3c9b8	! t0_kref+0x3384:   	fdivs	%f15, %f24, %f6
	.word	0x8143c000	! t0_kref+0x3388:   	stbar
	.word	0x9615f0ad	! t0_kref+0x338c:   	or	%l7, -0xf53, %o3
	.word	0x9426f307	! t0_kref+0x3390:   	sub	%i3, -0xcf9, %o2
	.word	0xa7a4c822	! t0_kref+0x3394:   	fadds	%f19, %f2, %f19
	.word	0x930ac01a	! t0_kref+0x3398:   	tsubcc	%o3, %i2, %o1
	.word	0xd25e2010	! t0_kref+0x339c:   	ldx	[%i0 + 0x10], %o1
	.word	0xfb6e001b	! t0_kref+0x33a0:   	prefetch	%i0 + %i3, 29
	.word	0xe4180018	! t0_kref+0x33a4:   	ldd	[%g0 + %i0], %l2
	.word	0x9266e62e	! t0_kref+0x33a8:   	subc	%i3, 0x62e, %o1
	.word	0x23480006	! t0_kref+0x33ac:   	fbne,a,pt	%fcc0, _kref+0x33c4
	.word	0xd43e7ff8	! t0_kref+0x33b0:   	std	%o2, [%i1 - 8]
	.word	0xae5ec01a	! t0_kref+0x33b4:   	smul	%i3, %i2, %l7
	.word	0xa5a018d4	! t0_kref+0x33b8:   	fdtos	%f20, %f18
	.word	0xef6e3fe0	! t0_kref+0x33bc:   	prefetch	%i0 - 0x20, 23
	.word	0x8fa01a24	! t0_kref+0x33c0:   	fstoi	%f4, %f7
	.word	0xa6b30009	! t0_kref+0x33c4:   	orncc	%o4, %o1, %l3
	.word	0xa6d02313	! t0_kref+0x33c8:   	umulcc	%g0, 0x313, %l3
	.word	0x1530a052	! t0_kref+0x33cc:   	sethi	%hi(0xc2814800), %o2
	.word	0x81ad8a4e	! t0_kref+0x33d0:   	fcmpd	%fcc0, %f22, %f14
	.word	0xeb267fe8	! t0_kref+0x33d4:   	st	%f21, [%i1 - 0x18]
	.word	0x29480007	! t0_kref+0x33d8:   	fbl,a,pt	%fcc0, _kref+0x33f4
	.word	0xb5a24828	! t0_kref+0x33dc:   	fadds	%f9, %f8, %f26
	.word	0xef00a030	! t0_kref+0x33e0:   	ld	[%g2 + 0x30], %f23
	.word	0x908ac000	! t0_kref+0x33e4:   	andcc	%o3, %g0, %o0
	.word	0xaba018d8	! t0_kref+0x33e8:   	fdtos	%f24, %f21
	.word	0xe87e7ff4	! t0_kref+0x33ec:   	swap	[%i1 - 0xc], %l4
	.word	0x9a500000	! t0_kref+0x33f0:   	umul	%g0, %g0, %o5
	.word	0xd19f1a59	! t0_kref+0x33f4:   	ldda	[%i4 + %i1]0xd2, %f8
	.word	0x26800002	! t0_kref+0x33f8:   	bl,a	_kref+0x3400
	.word	0x85a0188e	! t0_kref+0x33fc:   	fitos	%f14, %f2
	.word	0xafa00036	! t0_kref+0x3400:   	fmovs	%f22, %f23
	.word	0xb3a000ba	! t0_kref+0x3404:   	fnegs	%f26, %f25
	.word	0xafa0052f	! t0_kref+0x3408:   	fsqrts	%f15, %f23
	.word	0x86102003	! t0_kref+0x340c:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x3410:   	bne,a	_kref+0x3410
	.word	0x86a0e001	! t0_kref+0x3414:   	subcc	%g3, 1, %g3
	.word	0x92c263e1	! t0_kref+0x3418:   	addccc	%o1, 0x3e1, %o1
	.word	0x81a90aa3	! t0_kref+0x341c:   	fcmpes	%fcc0, %f4, %f3
	.word	0xb1a14828	! t0_kref+0x3420:   	fadds	%f5, %f8, %f24
	.word	0x81a94a32	! t0_kref+0x3424:   	fcmps	%fcc0, %f5, %f18
	.word	0xd11fbd20	! t0_kref+0x3428:   	ldd	[%fp - 0x2e0], %f8
	.word	0xafa3c9b7	! t0_kref+0x342c:   	fdivs	%f15, %f23, %f23
	.word	0xb3a00534	! t0_kref+0x3430:   	fsqrts	%f20, %f25
	.word	0x9536a00c	! t0_kref+0x3434:   	srl	%i2, 0xc, %o2
	.word	0x001fffff	! t0_kref+0x3438:   	illtrap	0x1fffff
	.word	0x9af2c00b	! t0_kref+0x343c:   	udivcc	%o3, %o3, %o5
	.word	0x81dac01e	! t0_kref+0x3440:   	flush	%o3 + %fp
	.word	0x97280000	! t0_kref+0x3444:   	sll	%g0, %g0, %o3
	.word	0xada1c82a	! t0_kref+0x3448:   	fadds	%f7, %f10, %f22
	sethi	%hi(2f), %o7
	.word	0xe40be088	! t0_kref+0x3450:   	ldub	[%o7 + 0x88], %l2
	.word	0xa41ca00c	! t0_kref+0x3454:   	xor	%l2, 0xc, %l2
	.word	0xe42be088	! t0_kref+0x3458:   	stb	%l2, [%o7 + 0x88]
	.word	0x81dbe088	! t0_kref+0x345c:   	flush	%o7 + 0x88
	.word	0x928a400d	! t0_kref+0x3460:   	andcc	%o1, %o5, %o1
	.word	0xb7a00529	! t0_kref+0x3464:   	fsqrts	%f9, %f27
	.word	0xa7a0053b	! t0_kref+0x3468:   	fsqrts	%f27, %f19
	.word	0x2d15b1b8	! t0_kref+0x346c:   	sethi	%hi(0x56c6e000), %l6
	.word	0xd000a03c	! t0_kref+0x3470:   	ld	[%g2 + 0x3c], %o0
	.word	0x81ae0ab0	! t0_kref+0x3474:   	fcmpes	%fcc0, %f24, %f16
	.word	0xd5f61008	! t0_kref+0x3478:   	casxa	[%i0]0x80, %o0, %o2
	.word	0xaa227fdb	! t0_kref+0x347c:   	sub	%o1, -0x25, %l5
	.word	0x87a01a39	! t0_kref+0x3480:   	fstoi	%f25, %f3
	.word	0xaeab3602	! t0_kref+0x3484:   	andncc	%o4, -0x9fe, %l7
2:	.word	0xa892800a	! t0_kref+0x3488:   	orcc	%o2, %o2, %l4
	call	SYM(t0_subr0)
	.word	0xada01893	! t0_kref+0x3490:   	fitos	%f19, %f22
	.word	0x37480002	! t0_kref+0x3494:   	fbge,a,pt	%fcc0, _kref+0x349c
	.word	0xda30a036	! t0_kref+0x3498:   	sth	%o5, [%g2 + 0x36]
	.word	0xae9b0000	! t0_kref+0x349c:   	xorcc	%o4, %g0, %l7
	.word	0x81aa0a58	! t0_kref+0x34a0:   	fcmpd	%fcc0, %f8, %f24
	.word	0x9fc00004	! t0_kref+0x34a4:   	call	%g0 + %g4
	.word	0xd420a01c	! t0_kref+0x34a8:   	st	%o2, [%g2 + 0x1c]
	.word	0xaab6eee4	! t0_kref+0x34ac:   	orncc	%i3, 0xee4, %l5
	.word	0xf36e001c	! t0_kref+0x34b0:   	prefetch	%i0 + %i4, 25
	.word	0xb5a04927	! t0_kref+0x34b4:   	fmuls	%f1, %f7, %f26
	call	1f
	.empty
	.word	0x91a04d23	! t0_kref+0x34bc:   	fsmuld	%f1, %f3, %f8
	.word	0xd430a038	! t0_kref+0x34c0:   	sth	%o2, [%g2 + 0x38]
	.word	0x27480008	! t0_kref+0x34c4:   	fbul,a,pt	%fcc0, _kref+0x34e4
	.word	0x93400000	! t0_kref+0x34c8:   	mov	%y, %o1
	.word	0xe700a030	! t0_kref+0x34cc:   	ld	[%g2 + 0x30], %f19
1:	.word	0x9e637a0a	! t0_kref+0x34d0:   	subc	%o5, -0x5f6, %o7
	.word	0x87a549ba	! t0_kref+0x34d4:   	fdivs	%f21, %f26, %f3
	.word	0x81a98a42	! t0_kref+0x34d8:   	fcmpd	%fcc0, %f6, %f2
	.word	0xe51fbf58	! t0_kref+0x34dc:   	ldd	[%fp - 0xa8], %f18
	.word	0x9602f4c1	! t0_kref+0x34e0:   	add	%o3, -0xb3f, %o3
	.word	0x2b480008	! t0_kref+0x34e4:   	fbug,a,pt	%fcc0, _kref+0x3504
	.word	0x94a3000a	! t0_kref+0x34e8:   	subcc	%o4, %o2, %o2
	.word	0xf8774019	! t0_kref+0x34ec:   	stx	%i4, [%i5 + %i1]
	.word	0x92c72181	! t0_kref+0x34f0:   	addccc	%i4, 0x181, %o1
	.word	0xe96e3fe8	! t0_kref+0x34f4:   	prefetch	%i0 - 0x18, 20
	.word	0xd030a03a	! t0_kref+0x34f8:   	sth	%o0, [%g2 + 0x3a]
	.word	0xc500a020	! t0_kref+0x34fc:   	ld	[%g2 + 0x20], %f2
	.word	0x96ab2011	! t0_kref+0x3500:   	andncc	%o4, 0x11, %o3
	.word	0xd41f4019	! t0_kref+0x3504:   	ldd	[%i5 + %i1], %o2
	.word	0xd4270018	! t0_kref+0x3508:   	st	%o2, [%i4 + %i0]
	.word	0x39480004	! t0_kref+0x350c:   	fbuge,a,pt	%fcc0, _kref+0x351c
	.word	0x9f224000	! t0_kref+0x3510:   	mulscc	%o1, %g0, %o7
	.word	0x2b800007	! t0_kref+0x3514:   	fbug,a	_kref+0x3530
	.word	0xd420a00c	! t0_kref+0x3518:   	st	%o2, [%g2 + 0xc]
	.word	0x9a02401b	! t0_kref+0x351c:   	add	%o1, %i3, %o5
	.word	0x9aa5c009	! t0_kref+0x3520:   	subcc	%l7, %o1, %o5
	.word	0xe6100018	! t0_kref+0x3524:   	lduh	[%g0 + %i0], %l3
	.word	0xa83829b3	! t0_kref+0x3528:   	xnor	%g0, 0x9b3, %l4
	.word	0x91a2c8b6	! t0_kref+0x352c:   	fsubs	%f11, %f22, %f8
	.word	0x9e26f60d	! t0_kref+0x3530:   	sub	%i3, -0x9f3, %o7
	.word	0xde4e0000	! t0_kref+0x3534:   	ldsb	[%i0], %o7
	.word	0x965f2e17	! t0_kref+0x3538:   	smul	%i4, 0xe17, %o3
	.word	0xacfaac9a	! t0_kref+0x353c:   	sdivcc	%o2, 0xc9a, %l6
	.word	0x96c6a42b	! t0_kref+0x3540:   	addccc	%i2, 0x42b, %o3
	.word	0x95a14830	! t0_kref+0x3544:   	fadds	%f5, %f16, %f10
	.word	0x9de3bfa0	! t0_kref+0x3548:   	save	%sp, -0x60, %sp
	.word	0xa9ef4019	! t0_kref+0x354c:   	restore	%i5, %i1, %l4
	.word	0xc030a004	! t0_kref+0x3550:   	clrh	[%g2 + 4]
	.word	0xc32031bc	! t0_kref+0x3554:   	st	%f1, [%g0 - 0xe44]
	.word	0xab3b401c	! t0_kref+0x3558:   	sra	%o5, %i4, %l5
	.word	0xed1fbda0	! t0_kref+0x355c:   	ldd	[%fp - 0x260], %f22
	.word	0xa6c5c00a	! t0_kref+0x3560:   	addccc	%l7, %o2, %l3
	.word	0xd2200019	! t0_kref+0x3564:   	st	%o1, [%g0 + %i1]
	.word	0x96830009	! t0_kref+0x3568:   	addcc	%o4, %o1, %o3
	.word	0x25480004	! t0_kref+0x356c:   	fblg,a,pt	%fcc0, _kref+0x357c
	.word	0x85a000c2	! t0_kref+0x3570:   	fnegd	%f2, %f2
	.word	0xee160000	! t0_kref+0x3574:   	lduh	[%i0], %l7
	.word	0xe3b8a040	! t0_kref+0x3578:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd6000019	! t0_kref+0x357c:   	ld	[%g0 + %i1], %o3
	sethi	%hi(2f), %o7
	.word	0xe40be1cc	! t0_kref+0x3584:   	ldub	[%o7 + 0x1cc], %l2
	.word	0xa41ca00c	! t0_kref+0x3588:   	xor	%l2, 0xc, %l2
	.word	0xe42be1cc	! t0_kref+0x358c:   	stb	%l2, [%o7 + 0x1cc]
	.word	0x81dbe1cc	! t0_kref+0x3590:   	flush	%o7 + 0x1cc
	.word	0xb3a0c839	! t0_kref+0x3594:   	fadds	%f3, %f25, %f25
	.word	0xa8d0000d	! t0_kref+0x3598:   	umulcc	%g0, %o5, %l4
	.word	0xd820a01c	! t0_kref+0x359c:   	st	%o4, [%g2 + 0x1c]
	.word	0xb1a289ad	! t0_kref+0x35a0:   	fdivs	%f10, %f13, %f24
	.word	0x9662c01c	! t0_kref+0x35a4:   	subc	%o3, %i4, %o3
	.word	0xb5a589c0	! t0_kref+0x35a8:   	fdivd	%f22, %f0, %f26
	call	SYM(t0_subr0)
	.word	0xe5ee501a	! t0_kref+0x35b0:   	prefetcha	%i1 + %i2, 18
	.word	0xd43e2000	! t0_kref+0x35b4:   	std	%o2, [%i0]
	.word	0xf6260000	! t0_kref+0x35b8:   	st	%i3, [%i0]
	.word	0xaa15e226	! t0_kref+0x35bc:   	or	%l7, 0x226, %l5
	.word	0xc53e401d	! t0_kref+0x35c0:   	std	%f2, [%i1 + %i5]
	.word	0x9da00531	! t0_kref+0x35c4:   	fsqrts	%f17, %f14
	.word	0xf520a000	! t0_kref+0x35c8:   	st	%f26, [%g2]
2:	.word	0xf700a028	! t0_kref+0x35cc:   	ld	[%g2 + 0x28], %f27
	.word	0x9de3bfa0	! t0_kref+0x35d0:   	save	%sp, -0x60, %sp
	.word	0x99ee33b3	! t0_kref+0x35d4:   	restore	%i0, -0xc4d, %o4
	.word	0x81aacab9	! t0_kref+0x35d8:   	fcmpes	%fcc0, %f11, %f25
	.word	0x99a000b1	! t0_kref+0x35dc:   	fnegs	%f17, %f12
	.word	0x97a00136	! t0_kref+0x35e0:   	fabss	%f22, %f11
	.word	0x987af051	! t0_kref+0x35e4:   	sdiv	%o3, -0xfaf, %o4
	.word	0xab400000	! t0_kref+0x35e8:   	mov	%y, %l5
	.word	0xaa426050	! t0_kref+0x35ec:   	addc	%o1, 0x50, %l5
	.word	0xe816001b	! t0_kref+0x35f0:   	lduh	[%i0 + %i3], %l4
	.word	0xaf13217a	! t0_kref+0x35f4:   	taddcctv	%o4, 0x17a, %l7
	.word	0x933aa01f	! t0_kref+0x35f8:   	sra	%o2, 0x1f, %o1
	.word	0xa6ab400a	! t0_kref+0x35fc:   	andncc	%o5, %o2, %l3
	.word	0xacd321f5	! t0_kref+0x3600:   	umulcc	%o4, 0x1f5, %l6
	.word	0xe07e7fe4	! t0_kref+0x3604:   	swap	[%i1 - 0x1c], %l0
	.word	0xfd6e2018	! t0_kref+0x3608:   	prefetch	%i0 + 0x18, 30
	.word	0xd650a010	! t0_kref+0x360c:   	ldsh	[%g2 + 0x10], %o3
	.word	0x3e480008	! t0_kref+0x3610:   	bvc,a,pt	%icc, _kref+0x3630
	.word	0xd050a014	! t0_kref+0x3614:   	ldsh	[%g2 + 0x14], %o0
	.word	0xd628a01f	! t0_kref+0x3618:   	stb	%o3, [%g2 + 0x1f]
	.word	0x3c480007	! t0_kref+0x361c:   	bpos,a,pt	%icc, _kref+0x3638
	.word	0x9260288f	! t0_kref+0x3620:   	subc	%g0, 0x88f, %o1
	.word	0xfbee501b	! t0_kref+0x3624:   	prefetcha	%i1 + %i3, 29
	.word	0xee28a039	! t0_kref+0x3628:   	stb	%l7, [%g2 + 0x39]
	.word	0xee266008	! t0_kref+0x362c:   	st	%l7, [%i1 + 8]
	.word	0xf3ee501a	! t0_kref+0x3630:   	prefetcha	%i1 + %i2, 25
	.word	0xac1ebe1f	! t0_kref+0x3634:   	xor	%i2, -0x1e1, %l6
	.word	0xad3b200a	! t0_kref+0x3638:   	sra	%o4, 0xa, %l6
	.word	0x9e06ffea	! t0_kref+0x363c:   	add	%i3, -0x16, %o7
	.word	0xa68de115	! t0_kref+0x3640:   	andcc	%l7, 0x115, %l3
	.word	0xd43e2008	! t0_kref+0x3644:   	std	%o2, [%i0 + 8]
	.word	0x90b3401a	! t0_kref+0x3648:   	orncc	%o5, %i2, %o0
	.word	0xc0767fe8	! t0_kref+0x364c:   	stx	%g0, [%i1 - 0x18]
	.word	0xe5bf5019	! t0_kref+0x3650:   	stda	%f18, [%i5 + %i1]0x80
	.word	0xebe6101a	! t0_kref+0x3654:   	casa	[%i0]0x80, %i2, %l5
	.word	0xa71a000b	! t0_kref+0x3658:   	tsubcctv	%o0, %o3, %l3
	.word	0x81ad8a50	! t0_kref+0x365c:   	fcmpd	%fcc0, %f22, %f16
	.word	0xecd65000	! t0_kref+0x3660:   	ldsha	[%i1]0x80, %l6
	.word	0xaaf5c01c	! t0_kref+0x3664:   	udivcc	%l7, %i4, %l5
	.word	0xa87ac009	! t0_kref+0x3668:   	sdiv	%o3, %o1, %l4
	.word	0xa8c5f242	! t0_kref+0x366c:   	addccc	%l7, -0xdbe, %l4
	.word	0x2c480003	! t0_kref+0x3670:   	bneg,a,pt	%icc, _kref+0x367c
	.word	0xe968a00e	! t0_kref+0x3674:   	prefetch	%g2 + 0xe, 20
	.word	0x9a43400d	! t0_kref+0x3678:   	addc	%o5, %o5, %o5
	.word	0x32480005	! t0_kref+0x367c:   	bne,a,pt	%icc, _kref+0x3690
	.word	0xb3a0188d	! t0_kref+0x3680:   	fitos	%f13, %f25
	.word	0xec1e4000	! t0_kref+0x3684:   	ldd	[%i1], %l6
	.word	0xd0362008	! t0_kref+0x3688:   	sth	%o0, [%i0 + 8]
	.word	0xac26c01b	! t0_kref+0x368c:   	sub	%i3, %i3, %l6
	.word	0xa68aa04c	! t0_kref+0x3690:   	andcc	%o2, 0x4c, %l3
	.word	0x9e9b3a80	! t0_kref+0x3694:   	xorcc	%o4, -0x580, %o7
	.word	0xaa7ae75e	! t0_kref+0x3698:   	sdiv	%o3, 0x75e, %l5
	.word	0xae7a801a	! t0_kref+0x369c:   	sdiv	%o2, %i2, %l7
	.word	0x9e22c00b	! t0_kref+0x36a0:   	sub	%o3, %o3, %o7
	.word	0x9f36e001	! t0_kref+0x36a4:   	srl	%i3, 0x1, %o7
	sethi	%hi(2f), %o7
	.word	0xe40be2dc	! t0_kref+0x36ac:   	ldub	[%o7 + 0x2dc], %l2
	.word	0xa41ca00c	! t0_kref+0x36b0:   	xor	%l2, 0xc, %l2
	.word	0xe42be2dc	! t0_kref+0x36b4:   	stb	%l2, [%o7 + 0x2dc]
	.word	0x81dbe2dc	! t0_kref+0x36b8:   	flush	%o7 + 0x2dc
	.word	0xa87ac017	! t0_kref+0x36bc:   	sdiv	%o3, %l7, %l4
	.word	0xafa0052e	! t0_kref+0x36c0:   	fsqrts	%f14, %f23
	.word	0x99a0192b	! t0_kref+0x36c4:   	fstod	%f11, %f12
	.word	0x9ba01a30	! t0_kref+0x36c8:   	fstoi	%f16, %f13
	.word	0xcd1fbd20	! t0_kref+0x36cc:   	ldd	[%fp - 0x2e0], %f6
	.word	0x95a289b6	! t0_kref+0x36d0:   	fdivs	%f10, %f22, %f10
	.word	0xa8fa801b	! t0_kref+0x36d4:   	sdivcc	%o2, %i3, %l4
	.word	0x81dd4017	! t0_kref+0x36d8:   	flush	%l5 + %l7
2:	.word	0xac268000	! t0_kref+0x36dc:   	sub	%i2, %g0, %l6
	.word	0x81aa8ab1	! t0_kref+0x36e0:   	fcmpes	%fcc0, %f10, %f17
	.word	0x9872401a	! t0_kref+0x36e4:   	udiv	%o1, %i2, %o4
	.word	0x9412800b	! t0_kref+0x36e8:   	or	%o2, %o3, %o2
	.word	0xa8672570	! t0_kref+0x36ec:   	subc	%i4, 0x570, %l4
	.word	0x8fa000a9	! t0_kref+0x36f0:   	fnegs	%f9, %f7
	.word	0xac82801a	! t0_kref+0x36f4:   	addcc	%o2, %i2, %l6
	.word	0xeaff1018	! t0_kref+0x36f8:   	swapa	[%i4 + %i0]0x80, %l5
	.word	0xae76fcd7	! t0_kref+0x36fc:   	udiv	%i3, -0x329, %l7
	.word	0xf62e3fee	! t0_kref+0x3700:   	stb	%i3, [%i0 - 0x12]
	.word	0x96d2400a	! t0_kref+0x3704:   	umulcc	%o1, %o2, %o3
	.word	0xa65ec00a	! t0_kref+0x3708:   	smul	%i3, %o2, %l3
	.word	0x93a1c92a	! t0_kref+0x370c:   	fmuls	%f7, %f10, %f9
	.word	0xee48a03f	! t0_kref+0x3710:   	ldsb	[%g2 + 0x3f], %l7
	.word	0xd03e4000	! t0_kref+0x3714:   	std	%o0, [%i1]
	.word	0xc807bfec	! t0_kref+0x3718:   	ld	[%fp - 0x14], %g4
	.word	0xd9be5857	! t0_kref+0x371c:   	stda	%f12, [%i1 + %l7]0xc2
	.word	0x81aa4aac	! t0_kref+0x3720:   	fcmpes	%fcc0, %f9, %f12
	.word	0xaa52001b	! t0_kref+0x3724:   	umul	%o0, %i3, %l5
	.word	0x9da4082f	! t0_kref+0x3728:   	fadds	%f16, %f15, %f14
	.word	0x37800004	! t0_kref+0x372c:   	fbge,a	_kref+0x373c
	.word	0xd210a024	! t0_kref+0x3730:   	lduh	[%g2 + 0x24], %o1
	.word	0xa88a3a8e	! t0_kref+0x3734:   	andcc	%o0, -0x572, %l4
	.word	0x91a6084e	! t0_kref+0x3738:   	faddd	%f24, %f14, %f8
	.word	0x95a01a2d	! t0_kref+0x373c:   	fstoi	%f13, %f10
	.word	0xe688105a	! t0_kref+0x3740:   	lduba	[%g0 + %i2]0x82, %l3
	.word	0xa6132ec0	! t0_kref+0x3744:   	or	%o4, 0xec0, %l3
	.word	0x86102002	! t0_kref+0x3748:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x374c:   	bne,a	_kref+0x374c
	.word	0x86a0e001	! t0_kref+0x3750:   	subcc	%g3, 1, %g3
	.word	0xda4e200d	! t0_kref+0x3754:   	ldsb	[%i0 + 0xd], %o5
	.word	0xf4267fe4	! t0_kref+0x3758:   	st	%i2, [%i1 - 0x1c]
	.word	0xe64e4000	! t0_kref+0x375c:   	ldsb	[%i1], %l3
	.word	0x9e1e800c	! t0_kref+0x3760:   	xor	%i2, %o4, %o7
	.word	0x9856fe1d	! t0_kref+0x3764:   	umul	%i3, -0x1e3, %o4
	.word	0x89a01898	! t0_kref+0x3768:   	fitos	%f24, %f4
	.word	0x83a01a2f	! t0_kref+0x376c:   	fstoi	%f15, %f1
	.word	0x89a01937	! t0_kref+0x3770:   	fstod	%f23, %f4
	.word	0x9f65a286	! t0_kref+0x3774:   	movneg	%icc, 0x286, %o7
	.word	0x85a000d6	! t0_kref+0x3778:   	fnegd	%f22, %f2
	.word	0xac62400c	! t0_kref+0x377c:   	subc	%o1, %o4, %l6
	.word	0xaa82000a	! t0_kref+0x3780:   	addcc	%o0, %o2, %l5
	.word	0xaf2a6006	! t0_kref+0x3784:   	sll	%o1, 0x6, %l7
	.word	0xa72234f3	! t0_kref+0x3788:   	mulscc	%o0, -0xb0d, %l3
	.word	0xd920a02c	! t0_kref+0x378c:   	st	%f12, [%g2 + 0x2c]
	.word	0x965b2988	! t0_kref+0x3790:   	smul	%o4, 0x988, %o3
	.word	0x9b2aa00b	! t0_kref+0x3794:   	sll	%o2, 0xb, %o5
	.word	0xd250a026	! t0_kref+0x3798:   	ldsh	[%g2 + 0x26], %o1
	.word	0x900a3c87	! t0_kref+0x379c:   	and	%o0, -0x379, %o0
	.word	0x8ba449a1	! t0_kref+0x37a0:   	fdivs	%f17, %f1, %f5
	.word	0x9813400c	! t0_kref+0x37a4:   	or	%o5, %o4, %o4
	.word	0x89a000da	! t0_kref+0x37a8:   	fnegd	%f26, %f4
	.word	0x9272bac2	! t0_kref+0x37ac:   	udiv	%o2, -0x53e, %o1
	.word	0xd620a03c	! t0_kref+0x37b0:   	st	%o3, [%g2 + 0x3c]
	.word	0x81df7191	! t0_kref+0x37b4:   	flush	%i5 - 0xe6f
	.word	0x92b26e76	! t0_kref+0x37b8:   	orncc	%o1, 0xe76, %o1
	.word	0xada0052b	! t0_kref+0x37bc:   	fsqrts	%f11, %f22
	.word	0xd02e2007	! t0_kref+0x37c0:   	stb	%o0, [%i0 + 7]
	.word	0xd450a012	! t0_kref+0x37c4:   	ldsh	[%g2 + 0x12], %o2
	.word	0xe41e7fe8	! t0_kref+0x37c8:   	ldd	[%i1 - 0x18], %l2
	.word	0x191d8976	! t0_kref+0x37cc:   	sethi	%hi(0x7625d800), %o4
	.word	0x81dc67a9	! t0_kref+0x37d0:   	flush	%l1 + 0x7a9
	.word	0x9eb6c00b	! t0_kref+0x37d4:   	orncc	%i3, %o3, %o7
	.word	0x85a489d2	! t0_kref+0x37d8:   	fdivd	%f18, %f18, %f2
	.word	0xdd1fbed0	! t0_kref+0x37dc:   	ldd	[%fp - 0x130], %f14
	.word	0x81ab8ab9	! t0_kref+0x37e0:   	fcmpes	%fcc0, %f14, %f25
	.word	0x927aa378	! t0_kref+0x37e4:   	sdiv	%o2, 0x378, %o1
	.word	0x27071ccc	! t0_kref+0x37e8:   	sethi	%hi(0x1c733000), %l3
	.word	0x83a00139	! t0_kref+0x37ec:   	fabss	%f25, %f1
	.word	0xda267fe4	! t0_kref+0x37f0:   	st	%o5, [%i1 - 0x1c]
	.word	0xea40a00c	! t0_kref+0x37f4:   	ldsw	[%g2 + 0xc], %l5
	.word	0xd2d65000	! t0_kref+0x37f8:   	ldsha	[%i1]0x80, %o1
	sethi	%hi(2f), %o7
	.word	0xe40be044	! t0_kref+0x3800:   	ldub	[%o7 + 0x44], %l2
	.word	0xa41ca00c	! t0_kref+0x3804:   	xor	%l2, 0xc, %l2
	.word	0xe42be044	! t0_kref+0x3808:   	stb	%l2, [%o7 + 0x44]
	.word	0x81dbe044	! t0_kref+0x380c:   	flush	%o7 + 0x44
	.word	0x941a728a	! t0_kref+0x3810:   	xor	%o1, -0xd76, %o2
	.word	0x9a22800d	! t0_kref+0x3814:   	sub	%o2, %o5, %o5
	.word	0x8fa018d8	! t0_kref+0x3818:   	fdtos	%f24, %f7
	.word	0x92f2000b	! t0_kref+0x381c:   	udivcc	%o0, %o3, %o1
	.word	0xa7a1492a	! t0_kref+0x3820:   	fmuls	%f5, %f10, %f19
	.word	0xd630a034	! t0_kref+0x3824:   	sth	%o3, [%g2 + 0x34]
	.word	0xaa06c008	! t0_kref+0x3828:   	add	%i3, %o0, %l5
	.word	0xc51fbc18	! t0_kref+0x382c:   	ldd	[%fp - 0x3e8], %f2
	.word	0x9ed6c009	! t0_kref+0x3830:   	umulcc	%i3, %o1, %o7
	.word	0x29480006	! t0_kref+0x3834:   	fbl,a,pt	%fcc0, _kref+0x384c
	.word	0xc0200019	! t0_kref+0x3838:   	clr	[%g0 + %i1]
	.word	0xd9be5a1b	! t0_kref+0x383c:   	stda	%f12, [%i1 + %i3]0xd0
	.word	0xea4e7fe1	! t0_kref+0x3840:   	ldsb	[%i1 - 0x1f], %l5
2:	.word	0xa1400000	! t0_kref+0x3844:   	mov	%y, %l0
	.word	0x9058000a	! t0_kref+0x3848:   	smul	%g0, %o2, %o0
	.word	0x2d480008	! t0_kref+0x384c:   	fbg,a,pt	%fcc0, _kref+0x386c
	.word	0x91a508a3	! t0_kref+0x3850:   	fsubs	%f20, %f3, %f8
	.word	0xae122383	! t0_kref+0x3854:   	or	%o0, 0x383, %l7
	.word	0x2d3e01b5	! t0_kref+0x3858:   	sethi	%hi(0xf806d400), %l6
	.word	0xda48a01a	! t0_kref+0x385c:   	ldsb	[%g2 + 0x1a], %o5
	.word	0xec4e001a	! t0_kref+0x3860:   	ldsb	[%i0 + %i2], %l6
	.word	0x3e800004	! t0_kref+0x3864:   	bvc,a	_kref+0x3874
	.word	0xe84e200a	! t0_kref+0x3868:   	ldsb	[%i0 + 0xa], %l4
	.word	0xd010a010	! t0_kref+0x386c:   	lduh	[%g2 + 0x10], %o0
	.word	0x9da2c9a7	! t0_kref+0x3870:   	fdivs	%f11, %f7, %f14
	.word	0xe81e001d	! t0_kref+0x3874:   	ldd	[%i0 + %i5], %l4
	.word	0xf62e8018	! t0_kref+0x3878:   	stb	%i3, [%i2 + %i0]
	.word	0x81adcaa9	! t0_kref+0x387c:   	fcmpes	%fcc0, %f23, %f9
	.word	0x9a12801a	! t0_kref+0x3880:   	or	%o2, %i2, %o5
	.word	0xac437671	! t0_kref+0x3884:   	addc	%o5, -0x98f, %l6
	.word	0x113b5ae1	! t0_kref+0x3888:   	sethi	%hi(0xed6b8400), %o0
	.word	0xd64e3fff	! t0_kref+0x388c:   	ldsb	[%i0 - 1], %o3
	.word	0xd03f4019	! t0_kref+0x3890:   	std	%o0, [%i5 + %i1]
	.word	0xda30a00a	! t0_kref+0x3894:   	sth	%o5, [%g2 + 0xa]
	.word	0x81ae8a52	! t0_kref+0x3898:   	fcmpd	%fcc0, %f26, %f18
	.word	0xa643285c	! t0_kref+0x389c:   	addc	%o4, 0x85c, %l3
	.word	0xa5a01096	! t0_kref+0x38a0:   	fxtos	%f22, %f18
	.word	0x9fc10000	! t0_kref+0x38a4:   	call	%g4
	.word	0xea08a008	! t0_kref+0x38a8:   	ldub	[%g2 + 8], %l5
	.word	0xfc19401d	! t0_kref+0x38ac:   	ldd	[%g5 + %i5], %fp
	.word	0x3c800008	! t0_kref+0x38b0:   	bpos,a	_kref+0x38d0
	.word	0x89a01052	! t0_kref+0x38b4:   	fdtox	%f18, %f4
	.word	0x85800009	! t0_kref+0x38b8:   	mov	%o1, %ccr
	.word	0x91a08d38	! t0_kref+0x38bc:   	fsmuld	%f2, %f24, %f8
	.word	0x85a00158	! t0_kref+0x38c0:   	fabsd	%f24, %f2
	.word	0xe3b8a040	! t0_kref+0x38c4:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x34800006	! t0_kref+0x38c8:   	bg,a	_kref+0x38e0
	.word	0x9a270008	! t0_kref+0x38cc:   	sub	%i4, %o0, %o5
	.word	0x93a01a21	! t0_kref+0x38d0:   	fstoi	%f1, %f9
	.word	0xaedebca9	! t0_kref+0x38d4:   	smulcc	%i2, -0x357, %l7
	.word	0x85a01a29	! t0_kref+0x38d8:   	fstoi	%f9, %f2
	.word	0xa81f0008	! t0_kref+0x38dc:   	xor	%i4, %o0, %l4
	.word	0xa825c009	! t0_kref+0x38e0:   	sub	%l7, %o1, %l4
	.word	0xaa5f36df	! t0_kref+0x38e4:   	smul	%i4, -0x921, %l5
	.word	0xac2dc008	! t0_kref+0x38e8:   	andn	%l7, %o0, %l6
	.word	0x21480001	! t0_kref+0x38ec:   	fbn,a,pt	%fcc0, _kref+0x38f0
	.word	0xa862b3df	! t0_kref+0x38f0:   	subc	%o2, -0xc21, %l4
	.word	0xa65dc000	! t0_kref+0x38f4:   	smul	%l7, %g0, %l3
	.word	0x9e1dc00c	! t0_kref+0x38f8:   	xor	%l7, %o4, %o7
	.word	0x9896ef2c	! t0_kref+0x38fc:   	orcc	%i3, 0xf2c, %o4
	.word	0xae85fbda	! t0_kref+0x3900:   	addcc	%l7, -0x426, %l7
	.word	0x9825c01b	! t0_kref+0x3904:   	sub	%l7, %i3, %o4
	.word	0x9de3bfa0	! t0_kref+0x3908:   	save	%sp, -0x60, %sp
	.word	0xb6ae001b	! t0_kref+0x390c:   	andncc	%i0, %i3, %i3
	.word	0xabeec01c	! t0_kref+0x3910:   	restore	%i3, %i4, %l5
	sethi	%hi(2f), %o7
	.word	0xe40be154	! t0_kref+0x3918:   	ldub	[%o7 + 0x154], %l2
	.word	0xa41ca00c	! t0_kref+0x391c:   	xor	%l2, 0xc, %l2
	.word	0xe42be154	! t0_kref+0x3920:   	stb	%l2, [%o7 + 0x154]
	.word	0x81dbe154	! t0_kref+0x3924:   	flush	%o7 + 0x154
	.word	0x9da01a39	! t0_kref+0x3928:   	fstoi	%f25, %f14
	.word	0xada00156	! t0_kref+0x392c:   	fabsd	%f22, %f22
	.word	0x9fc00004	! t0_kref+0x3930:   	call	%g0 + %g4
	.word	0xaf2a2014	! t0_kref+0x3934:   	sll	%o0, 0x14, %l7
	.word	0x99a0012f	! t0_kref+0x3938:   	fabss	%f15, %f12
	.word	0xe8162012	! t0_kref+0x393c:   	lduh	[%i0 + 0x12], %l4
	.word	0xc51fbfc0	! t0_kref+0x3940:   	ldd	[%fp - 0x40], %f2
	.word	0xaf400000	! t0_kref+0x3944:   	mov	%y, %l7
	.word	0x96c3000a	! t0_kref+0x3948:   	addccc	%o4, %o2, %o3
	.word	0x95a00523	! t0_kref+0x394c:   	fsqrts	%f3, %f10
	.word	0xa9a0012b	! t0_kref+0x3950:   	fabss	%f11, %f20
2:	.word	0x83a18825	! t0_kref+0x3954:   	fadds	%f6, %f5, %f1
	.word	0xa5a01889	! t0_kref+0x3958:   	fitos	%f9, %f18
	.word	0xae1b001b	! t0_kref+0x395c:   	xor	%o4, %i3, %l7
	.word	0x81ac8a44	! t0_kref+0x3960:   	fcmpd	%fcc0, %f18, %f4
	.word	0xa9a01892	! t0_kref+0x3964:   	fitos	%f18, %f20
	.word	0xa5a609ca	! t0_kref+0x3968:   	fdivd	%f24, %f10, %f18
	.word	0xa1a000a2	! t0_kref+0x396c:   	fnegs	%f2, %f16
	.word	0x3f480007	! t0_kref+0x3970:   	fbo,a,pt	%fcc0, _kref+0x398c
	.word	0x9b67800b	! t0_kref+0x3974:   	movpos	%icc, %o3, %o5
	.word	0x9fc00004	! t0_kref+0x3978:   	call	%g0 + %g4
	.word	0x92224017	! t0_kref+0x397c:   	sub	%o1, %l7, %o1
	.word	0xa9a089b4	! t0_kref+0x3980:   	fdivs	%f2, %f20, %f20
	.word	0x24800007	! t0_kref+0x3984:   	ble,a	_kref+0x39a0
	.word	0xac8dc01b	! t0_kref+0x3988:   	andcc	%l7, %i3, %l6
	.word	0x81d83af7	! t0_kref+0x398c:   	flush	%g0 - 0x509
	.word	0xda08a039	! t0_kref+0x3990:   	ldub	[%g2 + 0x39], %o5
	.word	0xd43e7fe8	! t0_kref+0x3994:   	std	%o2, [%i1 - 0x18]
	.word	0xd04e7fe9	! t0_kref+0x3998:   	ldsb	[%i1 - 0x17], %o0
	.word	0x988b3a05	! t0_kref+0x399c:   	andcc	%o4, -0x5fb, %o4
	.word	0x22800001	! t0_kref+0x39a0:   	be,a	_kref+0x39a4
	.word	0x81d8401d	! t0_kref+0x39a4:   	flush	%g1 + %i5
	.word	0xa3a2c9ba	! t0_kref+0x39a8:   	fdivs	%f11, %f26, %f17
	.word	0xacadc008	! t0_kref+0x39ac:   	andncc	%l7, %o0, %l6
	.word	0x99a01888	! t0_kref+0x39b0:   	fitos	%f8, %f12
	.word	0xde16c019	! t0_kref+0x39b4:   	lduh	[%i3 + %i1], %o7
	.word	0x38800001	! t0_kref+0x39b8:   	bgu,a	_kref+0x39bc
	.word	0x9e202bbb	! t0_kref+0x39bc:   	sub	%g0, 0xbbb, %o7
	.word	0xd24e200d	! t0_kref+0x39c0:   	ldsb	[%i0 + 0xd], %o1
	.word	0xee2e7ffe	! t0_kref+0x39c4:   	stb	%l7, [%i1 - 2]
	.word	0xae8ab744	! t0_kref+0x39c8:   	andcc	%o2, -0x8bc, %l7
	.word	0xc9be181c	! t0_kref+0x39cc:   	stda	%f4, [%i0 + %i4]0xc0
	.word	0x85a000b1	! t0_kref+0x39d0:   	fnegs	%f17, %f2
	.word	0x172c2d16	! t0_kref+0x39d4:   	sethi	%hi(0xb0b45800), %o3
	.word	0x9066c009	! t0_kref+0x39d8:   	subc	%i3, %o1, %o0
	.word	0xaec28009	! t0_kref+0x39dc:   	addccc	%o2, %o1, %l7
	.word	0x9676c01b	! t0_kref+0x39e0:   	udiv	%i3, %i3, %o3
	.word	0xe26e8018	! t0_kref+0x39e4:   	ldstub	[%i2 + %i0], %l1
	.word	0xb7a5c8af	! t0_kref+0x39e8:   	fsubs	%f23, %f15, %f27
	.word	0xa7a5c838	! t0_kref+0x39ec:   	fadds	%f23, %f24, %f19
	.word	0xfc3f4005	! t0_kref+0x39f0:   	std	%fp, [%i5 + %g5]
	.word	0xed1e7ff0	! t0_kref+0x39f4:   	ldd	[%i1 - 0x10], %f22
	.word	0x23480007	! t0_kref+0x39f8:   	fbne,a,pt	%fcc0, _kref+0x3a14
	.word	0xe7ee101d	! t0_kref+0x39fc:   	prefetcha	%i0 + %i5, 19
	.word	0xc11e4000	! t0_kref+0x3a00:   	ldd	[%i1], %f0
	.word	0x9e7a800b	! t0_kref+0x3a04:   	sdiv	%o2, %o3, %o7
	.word	0xd320a038	! t0_kref+0x3a08:   	st	%f9, [%g2 + 0x38]
	.word	0xaed33d82	! t0_kref+0x3a0c:   	umulcc	%o4, -0x27e, %l7
	.word	0x9406f188	! t0_kref+0x3a10:   	add	%i3, -0xe78, %o2
	.word	0xf520a038	! t0_kref+0x3a14:   	st	%f26, [%g2 + 0x38]
	.word	0xa9a60825	! t0_kref+0x3a18:   	fadds	%f24, %f5, %f20
	.word	0xde40a034	! t0_kref+0x3a1c:   	ldsw	[%g2 + 0x34], %o7
	.word	0xa696b12d	! t0_kref+0x3a20:   	orcc	%i2, -0xed3, %l3
	.word	0xd018001d	! t0_kref+0x3a24:   	ldd	[%g0 + %i5], %o0
	.word	0xdaff1018	! t0_kref+0x3a28:   	swapa	[%i4 + %i0]0x80, %o5
	.word	0xec50a026	! t0_kref+0x3a2c:   	ldsh	[%g2 + 0x26], %l6
	.word	0x86102019	! t0_kref+0x3a30:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x3a34:   	subcc	%g3, 1, %g3
	.word	0x22800004	! t0_kref+0x3a38:   	be,a	_kref+0x3a48
	.word	0xf620a03c	! t0_kref+0x3a3c:   	st	%i3, [%g2 + 0x3c]
	.word	0xe91e7fe8	! t0_kref+0x3a40:   	ldd	[%i1 - 0x18], %f20
	.word	0x36800003	! t0_kref+0x3a44:   	bge,a	_kref+0x3a50
	.word	0xf1be181b	! t0_kref+0x3a48:   	stda	%f24, [%i0 + %i3]0xc0
	.word	0xf3ee501c	! t0_kref+0x3a4c:   	prefetcha	%i1 + %i4, 25
	.word	0xb3a289b6	! t0_kref+0x3a50:   	fdivs	%f10, %f22, %f25
	.word	0xa692000c	! t0_kref+0x3a54:   	orcc	%o0, %o4, %l3
	.word	0xaefb7042	! t0_kref+0x3a58:   	sdivcc	%o5, -0xfbe, %l7
	.word	0x9da00123	! t0_kref+0x3a5c:   	fabss	%f3, %f14
	.word	0xea08a00b	! t0_kref+0x3a60:   	ldub	[%g2 + 0xb], %l5
	.word	0x98236731	! t0_kref+0x3a64:   	sub	%o5, 0x731, %o4
	.word	0x9013001c	! t0_kref+0x3a68:   	or	%o4, %i4, %o0
	.word	0x96c33d07	! t0_kref+0x3a6c:   	addccc	%o4, -0x2f9, %o3
	.word	0xb3a00537	! t0_kref+0x3a70:   	fsqrts	%f23, %f25
	.word	0xd830a00c	! t0_kref+0x3a74:   	sth	%o4, [%g2 + 0xc]
	.word	0xb7a2c9b6	! t0_kref+0x3a78:   	fdivs	%f11, %f22, %f27
	.word	0x96e37ab7	! t0_kref+0x3a7c:   	subccc	%o5, -0x549, %o3
	.word	0x96b6aeca	! t0_kref+0x3a80:   	orncc	%i2, 0xeca, %o3
	.word	0xc91fbc30	! t0_kref+0x3a84:   	ldd	[%fp - 0x3d0], %f4
	.word	0xd67e2014	! t0_kref+0x3a88:   	swap	[%i0 + 0x14], %o3
	.word	0x31480008	! t0_kref+0x3a8c:   	fba,a,pt	%fcc0, _kref+0x3aac
	.word	0x8fa1c9a1	! t0_kref+0x3a90:   	fdivs	%f7, %f1, %f7
	.word	0x95a01888	! t0_kref+0x3a94:   	fitos	%f8, %f10
	.word	0x2e480002	! t0_kref+0x3a98:   	bvs,a,pt	%icc, _kref+0x3aa0
	.word	0xda363ffa	! t0_kref+0x3a9c:   	sth	%o5, [%i0 - 6]
	.word	0xd43e7fe8	! t0_kref+0x3aa0:   	std	%o2, [%i1 - 0x18]
	.word	0xaa9a0017	! t0_kref+0x3aa4:   	xorcc	%o0, %l7, %l5
	.word	0xa3a00126	! t0_kref+0x3aa8:   	fabss	%f6, %f17
	.word	0x8da249b9	! t0_kref+0x3aac:   	fdivs	%f9, %f25, %f6
	.word	0x27480004	! t0_kref+0x3ab0:   	fbul,a,pt	%fcc0, _kref+0x3ac0
	.word	0xdd20a030	! t0_kref+0x3ab4:   	st	%f14, [%g2 + 0x30]
	.word	0xd628a005	! t0_kref+0x3ab8:   	stb	%o3, [%g2 + 5]
	.word	0xaba018d8	! t0_kref+0x3abc:   	fdtos	%f24, %f21
	.word	0xd42e7ff5	! t0_kref+0x3ac0:   	stb	%o2, [%i1 - 0xb]
	sethi	%hi(2f), %o7
	.word	0xe40be2f4	! t0_kref+0x3ac8:   	ldub	[%o7 + 0x2f4], %l2
	.word	0xa41ca00c	! t0_kref+0x3acc:   	xor	%l2, 0xc, %l2
	.word	0xe42be2f4	! t0_kref+0x3ad0:   	stb	%l2, [%o7 + 0x2f4]
	.word	0x81dbe2f4	! t0_kref+0x3ad4:   	flush	%o7 + 0x2f4
	.word	0xd848a00b	! t0_kref+0x3ad8:   	ldsb	[%g2 + 0xb], %o4
	.word	0xe81e2018	! t0_kref+0x3adc:   	ldd	[%i0 + 0x18], %l4
	.word	0xa9a0108a	! t0_kref+0x3ae0:   	fxtos	%f10, %f20
	.word	0x97a000a2	! t0_kref+0x3ae4:   	fnegs	%f2, %f11
	.word	0x94034008	! t0_kref+0x3ae8:   	add	%o5, %o0, %o2
	.word	0xea00a020	! t0_kref+0x3aec:   	ld	[%g2 + 0x20], %l5
	.word	0xf6364000	! t0_kref+0x3af0:   	sth	%i3, [%i1]
2:	.word	0xaa1dc008	! t0_kref+0x3af4:   	xor	%l7, %o0, %l5
	.word	0x29800002	! t0_kref+0x3af8:   	fbl,a	_kref+0x3b00
	.word	0x953a4000	! t0_kref+0x3afc:   	sra	%o1, %g0, %o2
	.word	0xd0167ff4	! t0_kref+0x3b00:   	lduh	[%i1 - 0xc], %o0
	.word	0x2f800003	! t0_kref+0x3b04:   	fbu,a	_kref+0x3b10
	.word	0xaa3b6e5d	! t0_kref+0x3b08:   	xnor	%o5, 0xe5d, %l5
	.word	0xaf400000	! t0_kref+0x3b0c:   	mov	%y, %l7
	.word	0x81ae4ab8	! t0_kref+0x3b10:   	fcmpes	%fcc0, %f25, %f24
	.word	0xe120a038	! t0_kref+0x3b14:   	st	%f16, [%g2 + 0x38]
	.word	0xd430a026	! t0_kref+0x3b18:   	sth	%o2, [%g2 + 0x26]
	.word	0xab2a400a	! t0_kref+0x3b1c:   	sll	%o1, %o2, %l5
	call	SYM(t0_subr1)
	.word	0x9046b26b	! t0_kref+0x3b24:   	addc	%i2, -0xd95, %o0
	.word	0x2a800008	! t0_kref+0x3b28:   	bcs,a	_kref+0x3b48
	.word	0x85a000a9	! t0_kref+0x3b2c:   	fnegs	%f9, %f2
	.word	0xad400000	! t0_kref+0x3b30:   	mov	%y, %l6
	.word	0x35480005	! t0_kref+0x3b34:   	fbue,a,pt	%fcc0, _kref+0x3b48
	.word	0xd04e601d	! t0_kref+0x3b38:   	ldsb	[%i1 + 0x1d], %o0
	.word	0x905deeca	! t0_kref+0x3b3c:   	smul	%l7, 0xeca, %o0
	.word	0xf13e6008	! t0_kref+0x3b40:   	std	%f24, [%i1 + 8]
	.word	0xaedee71f	! t0_kref+0x3b44:   	smulcc	%i3, 0x71f, %l7
	.word	0xa7a249ae	! t0_kref+0x3b48:   	fdivs	%f9, %f14, %f19
	.word	0x19330344	! t0_kref+0x3b4c:   	sethi	%hi(0xcc0d1000), %o4
	.word	0xed1f4019	! t0_kref+0x3b50:   	ldd	[%i5 + %i1], %f22
	.word	0xe300a01c	! t0_kref+0x3b54:   	ld	[%g2 + 0x1c], %f17
	.word	0xd4a6101c	! t0_kref+0x3b58:   	sta	%o2, [%i0 + %i4]0x80
	.word	0xaeaa71c4	! t0_kref+0x3b5c:   	andncc	%o1, -0xe3c, %l7
	.word	0xb1a309ac	! t0_kref+0x3b60:   	fdivs	%f12, %f12, %f24
	.word	0xada01a40	! t0_kref+0x3b64:   	fdtoi	%f0, %f22
	.word	0x3f800007	! t0_kref+0x3b68:   	fbo,a	_kref+0x3b84
	.word	0xae3a62b5	! t0_kref+0x3b6c:   	xnor	%o1, 0x2b5, %l7
	.word	0x21480007	! t0_kref+0x3b70:   	fbn,a,pt	%fcc0, _kref+0x3b8c
	.word	0x9856aa3f	! t0_kref+0x3b74:   	umul	%i2, 0xa3f, %o4
	.word	0x81a5094e	! t0_kref+0x3b78:   	fmuld	%f20, %f14, %f0
	.word	0x9890001b	! t0_kref+0x3b7c:   	orcc	%g0, %i3, %o4
	.word	0xae07001c	! t0_kref+0x3b80:   	add	%i4, %i4, %l7
	.word	0x993a6005	! t0_kref+0x3b84:   	sra	%o1, 0x5, %o4
	.word	0x89a148a8	! t0_kref+0x3b88:   	fsubs	%f5, %f8, %f4
	.word	0xa61b75f2	! t0_kref+0x3b8c:   	xor	%o5, -0xa0e, %l3
	.word	0xe96e401a	! t0_kref+0x3b90:   	prefetch	%i1 + %i2, 20
	.word	0xfd6e001b	! t0_kref+0x3b94:   	prefetch	%i0 + %i3, 30
	.word	0xaa45c01c	! t0_kref+0x3b98:   	addc	%l7, %i4, %l5
	.word	0x81ab0046	! t0_kref+0x3b9c:   	fmovduge	%fcc0, %f6, %f0
	.word	0xea48a008	! t0_kref+0x3ba0:   	ldsb	[%g2 + 8], %l5
	.word	0x9b70000a	! t0_kref+0x3ba4:   	popc	%o2, %o5
	.word	0x8d82f9f2	! t0_kref+0x3ba8:   	wr	%o3, 0xfffff9f2, %fprs
	.word	0xafa000a5	! t0_kref+0x3bac:   	fnegs	%f5, %f23
	call	SYM(t0_subr3)
	.word	0xe608a02b	! t0_kref+0x3bb4:   	ldub	[%g2 + 0x2b], %l3
	.word	0xd11fbf48	! t0_kref+0x3bb8:   	ldd	[%fp - 0xb8], %f8
	.word	0xa3a6c920	! t0_kref+0x3bbc:   	fmuls	%f27, %f0, %f17
	.word	0xd0163fe2	! t0_kref+0x3bc0:   	lduh	[%i0 - 0x1e], %o0
	.word	0x9eb3400b	! t0_kref+0x3bc4:   	orncc	%o5, %o3, %o7
	.word	0x93a5883b	! t0_kref+0x3bc8:   	fadds	%f22, %f27, %f9
	.word	0xd450a038	! t0_kref+0x3bcc:   	ldsh	[%g2 + 0x38], %o2
	.word	0xee20a014	! t0_kref+0x3bd0:   	st	%l7, [%g2 + 0x14]
	.word	0xd920a028	! t0_kref+0x3bd4:   	st	%f12, [%g2 + 0x28]
	sethi	%hi(2f), %o7
	.word	0xe40be3f8	! t0_kref+0x3bdc:   	ldub	[%o7 + 0x3f8], %l2
	.word	0xa41ca00c	! t0_kref+0x3be0:   	xor	%l2, 0xc, %l2
	.word	0xe42be3f8	! t0_kref+0x3be4:   	stb	%l2, [%o7 + 0x3f8]
	.word	0x81dbe3f8	! t0_kref+0x3be8:   	flush	%o7 + 0x3f8
	.word	0x91332015	! t0_kref+0x3bec:   	srl	%o4, 0x15, %o0
	.word	0x94a3000b	! t0_kref+0x3bf0:   	subcc	%o4, %o3, %o2
	.word	0xaafdf2df	! t0_kref+0x3bf4:   	sdivcc	%l7, -0xd21, %l5
2:	.word	0x94d5e3bf	! t0_kref+0x3bf8:   	umulcc	%l7, 0x3bf, %o2
	.word	0xaba0002a	! t0_kref+0x3bfc:   	fmovs	%f10, %f21
	.word	0xe8871018	! t0_kref+0x3c00:   	lda	[%i4 + %i0]0x80, %l4
	.word	0xec08a016	! t0_kref+0x3c04:   	ldub	[%g2 + 0x16], %l6
	.word	0xd428a03b	! t0_kref+0x3c08:   	stb	%o2, [%g2 + 0x3b]
	.word	0x81dc400e	! t0_kref+0x3c0c:   	flush	%l1 + %sp
	.word	0xa9a14d26	! t0_kref+0x3c10:   	fsmuld	%f5, %f6, %f20
	.word	0x21480008	! t0_kref+0x3c14:   	fbn,a,pt	%fcc0, _kref+0x3c34
	.word	0xb5a50944	! t0_kref+0x3c18:   	fmuld	%f20, %f4, %f26
	.word	0x81ad0a48	! t0_kref+0x3c1c:   	fcmpd	%fcc0, %f20, %f8
	.word	0x95a508ce	! t0_kref+0x3c20:   	fsubd	%f20, %f14, %f10
	.word	0x9062f24b	! t0_kref+0x3c24:   	subc	%o3, -0xdb5, %o0
	.word	0x963eb100	! t0_kref+0x3c28:   	xnor	%i2, -0xf00, %o3
	.word	0x9da01a2b	! t0_kref+0x3c2c:   	fstoi	%f11, %f14
	.word	0x8143c000	! t0_kref+0x3c30:   	stbar
	.word	0xa87ac00a	! t0_kref+0x3c34:   	sdiv	%o3, %o2, %l4
	.word	0x91a08820	! t0_kref+0x3c38:   	fadds	%f2, %f0, %f8
	.word	0xa5a00531	! t0_kref+0x3c3c:   	fsqrts	%f17, %f18
	.word	0xa6da2967	! t0_kref+0x3c40:   	smulcc	%o0, 0x967, %l3
	.word	0xa856800b	! t0_kref+0x3c44:   	umul	%i2, %o3, %l4
	.word	0xec30001b	! t0_kref+0x3c48:   	sth	%l6, [%g0 + %i3]
	.word	0xd24e3ff8	! t0_kref+0x3c4c:   	ldsb	[%i0 - 8], %o1
	.word	0x9e8b401c	! t0_kref+0x3c50:   	andcc	%o5, %i4, %o7
	.word	0x2d800007	! t0_kref+0x3c54:   	fbg,a	_kref+0x3c70
	.word	0xac56ff72	! t0_kref+0x3c58:   	umul	%i3, -0x8e, %l6
	.word	0x98973ae5	! t0_kref+0x3c5c:   	orcc	%i4, -0x51b, %o4
	.word	0xd840a034	! t0_kref+0x3c60:   	ldsw	[%g2 + 0x34], %o4
	.word	0x9213001a	! t0_kref+0x3c64:   	or	%o4, %i2, %o1
	.word	0xee700018	! t0_kref+0x3c68:   	stx	%l7, [%g0 + %i0]
	.word	0x9ba01a32	! t0_kref+0x3c6c:   	fstoi	%f18, %f13
	.word	0x81a98a58	! t0_kref+0x3c70:   	fcmpd	%fcc0, %f6, %f24
	.word	0x8143e040	! t0_kref+0x3c74:   	membar	0x40
	.word	0xe640a010	! t0_kref+0x3c78:   	ldsw	[%g2 + 0x10], %l3
	.word	0x81ac0a46	! t0_kref+0x3c7c:   	fcmpd	%fcc0, %f16, %f6
	.word	0xd11e2010	! t0_kref+0x3c80:   	ldd	[%i0 + 0x10], %f8
	.word	0xda480019	! t0_kref+0x3c84:   	ldsb	[%g0 + %i1], %o5
	.word	0xf620a038	! t0_kref+0x3c88:   	st	%i3, [%g2 + 0x38]
	.word	0x95a109a5	! t0_kref+0x3c8c:   	fdivs	%f4, %f5, %f10
	.word	0x81ab0aa0	! t0_kref+0x3c90:   	fcmpes	%fcc0, %f12, %f0
	call	SYM(t0_subr1)
	.word	0x9203400c	! t0_kref+0x3c98:   	add	%o5, %o4, %o1
	.word	0xaac03b60	! t0_kref+0x3c9c:   	addccc	%g0, -0x4a0, %l5
	.word	0xed1fbe88	! t0_kref+0x3ca0:   	ldd	[%fp - 0x178], %f22
	.word	0xa7400000	! t0_kref+0x3ca4:   	mov	%y, %l3
	.word	0xde00a010	! t0_kref+0x3ca8:   	ld	[%g2 + 0x10], %o7
	.word	0x2b234671	! t0_kref+0x3cac:   	sethi	%hi(0x8d19c400), %l5
	.word	0xd300a00c	! t0_kref+0x3cb0:   	ld	[%g2 + 0xc], %f9
	.word	0x8fa0012f	! t0_kref+0x3cb4:   	fabss	%f15, %f7
	.word	0x28800002	! t0_kref+0x3cb8:   	bleu,a	_kref+0x3cc0
	.word	0xe848a037	! t0_kref+0x3cbc:   	ldsb	[%g2 + 0x37], %l4
	.word	0x8143c000	! t0_kref+0x3cc0:   	stbar
	.word	0x3b800006	! t0_kref+0x3cc4:   	fble,a	_kref+0x3cdc
	.word	0x9e7b36b9	! t0_kref+0x3cc8:   	sdiv	%o4, -0x947, %o7
	.word	0xf620a000	! t0_kref+0x3ccc:   	st	%i3, [%g2]
	.word	0xef6e401c	! t0_kref+0x3cd0:   	prefetch	%i1 + %i4, 23
	.word	0xa7a000ad	! t0_kref+0x3cd4:   	fnegs	%f13, %f19
	.word	0x930af95a	! t0_kref+0x3cd8:   	tsubcc	%o3, -0x6a6, %o1
	.word	0xd610a012	! t0_kref+0x3cdc:   	lduh	[%g2 + 0x12], %o3
	.word	0xa5a40920	! t0_kref+0x3ce0:   	fmuls	%f16, %f0, %f18
	.word	0x27480004	! t0_kref+0x3ce4:   	fbul,a,pt	%fcc0, _kref+0x3cf4
	.word	0xb8102010	! t0_kref+0x3ce8:   	mov	0x10, %i4
	.word	0xa63a401a	! t0_kref+0x3cec:   	xnor	%o1, %i2, %l3
	.word	0xada208d4	! t0_kref+0x3cf0:   	fsubd	%f8, %f20, %f22
	.word	0xd848a028	! t0_kref+0x3cf4:   	ldsb	[%g2 + 0x28], %o4
	.word	0x96b6a6ac	! t0_kref+0x3cf8:   	orncc	%i2, 0x6ac, %o3
	.word	0xb6102018	! t0_kref+0x3cfc:   	mov	0x18, %i3
	.word	0x2f800001	! t0_kref+0x3d00:   	fbu,a	_kref+0x3d04
	.word	0xc51f4019	! t0_kref+0x3d04:   	ldd	[%i5 + %i1], %f2
	.word	0xde070019	! t0_kref+0x3d08:   	ld	[%i4 + %i1], %o7
	sethi	%hi(2f), %o7
	.word	0xe40be148	! t0_kref+0x3d10:   	ldub	[%o7 + 0x148], %l2
	.word	0xa41ca00c	! t0_kref+0x3d14:   	xor	%l2, 0xc, %l2
	.word	0xe42be148	! t0_kref+0x3d18:   	stb	%l2, [%o7 + 0x148]
	.word	0x81dbe148	! t0_kref+0x3d1c:   	flush	%o7 + 0x148
	.word	0x3b800006	! t0_kref+0x3d20:   	fble,a	_kref+0x3d38
	.word	0xa5a000b4	! t0_kref+0x3d24:   	fnegs	%f20, %f18
	.word	0xe278a00c	! t0_kref+0x3d28:   	swap	[%g2 + 0xc], %l1
	.word	0xc020a00c	! t0_kref+0x3d2c:   	clr	[%g2 + 0xc]
	.word	0xee30a02c	! t0_kref+0x3d30:   	sth	%l7, [%g2 + 0x2c]
	.word	0xa6323ffc	! t0_kref+0x3d34:   	orn	%o0, -0x4, %l3
	.word	0xd848a01e	! t0_kref+0x3d38:   	ldsb	[%g2 + 0x1e], %o4
	.word	0x9e8a401c	! t0_kref+0x3d3c:   	andcc	%o1, %i4, %o7
	.word	0xb1a01a2e	! t0_kref+0x3d40:   	fstoi	%f14, %f24
	.word	0xa7322003	! t0_kref+0x3d44:   	srl	%o0, 0x3, %l3
2:	.word	0xaa75c01b	! t0_kref+0x3d48:   	udiv	%l7, %i3, %l5
	.word	0x29480005	! t0_kref+0x3d4c:   	fbl,a,pt	%fcc0, _kref+0x3d60
	.word	0xa6134009	! t0_kref+0x3d50:   	or	%o5, %o1, %l3
	.word	0x8fa00123	! t0_kref+0x3d54:   	fabss	%f3, %f7
	.word	0x39480003	! t0_kref+0x3d58:   	fbuge,a,pt	%fcc0, _kref+0x3d64
	.word	0xd04e401a	! t0_kref+0x3d5c:   	ldsb	[%i1 + %i2], %o0
	.word	0x81a00021	! t0_kref+0x3d60:   	fmovs	%f1, %f0
	.word	0xac6361e2	! t0_kref+0x3d64:   	subc	%o5, 0x1e2, %l6
	.word	0xda801019	! t0_kref+0x3d68:   	lda	[%g0 + %i1]0x80, %o5
	.word	0x81dea8fb	! t0_kref+0x3d6c:   	flush	%i2 + 0x8fb
	.word	0xdede101d	! t0_kref+0x3d70:   	ldxa	[%i0 + %i5]0x80, %o7
	.word	0x97a288b5	! t0_kref+0x3d74:   	fsubs	%f10, %f21, %f11
	.word	0x94180008	! t0_kref+0x3d78:   	xor	%g0, %o0, %o2
	.word	0x81ac4a28	! t0_kref+0x3d7c:   	fcmps	%fcc0, %f17, %f8
	.word	0xe3b8a080	! t0_kref+0x3d80:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xc030a03c	! t0_kref+0x3d84:   	clrh	[%g2 + 0x3c]
	.word	0x9ade801b	! t0_kref+0x3d88:   	smulcc	%i2, %i3, %o5
	.word	0x91a01a34	! t0_kref+0x3d8c:   	fstoi	%f20, %f8
	.word	0xdc216bf0	! t0_kref+0x3d90:   	st	%sp, [%g5 + 0xbf0]
	.word	0x33480003	! t0_kref+0x3d94:   	fbe,a,pt	%fcc0, _kref+0x3da0
	.word	0xac93401c	! t0_kref+0x3d98:   	orcc	%o5, %i4, %l6
	call	SYM(t0_subr1)
	.word	0x94b6801a	! t0_kref+0x3da0:   	orncc	%i2, %i2, %o2
	.word	0x2d480006	! t0_kref+0x3da4:   	fbg,a,pt	%fcc0, _kref+0x3dbc
	.word	0x9f65801a	! t0_kref+0x3da8:   	movneg	%icc, %i2, %o7
	.word	0xa63f001a	! t0_kref+0x3dac:   	xnor	%i4, %i2, %l3
	.word	0xd03e001d	! t0_kref+0x3db0:   	std	%o0, [%i0 + %i5]
	.word	0xaba34921	! t0_kref+0x3db4:   	fmuls	%f13, %f1, %f21
	.word	0xc51fbf08	! t0_kref+0x3db8:   	ldd	[%fp - 0xf8], %f2
	.word	0xc91e3ff8	! t0_kref+0x3dbc:   	ldd	[%i0 - 8], %f4
	call	SYM(t0_subr3)
	.word	0x8da00131	! t0_kref+0x3dc4:   	fabss	%f17, %f6
	.word	0xac324008	! t0_kref+0x3dc8:   	orn	%o1, %o0, %l6
	.word	0x8143c000	! t0_kref+0x3dcc:   	stbar
	.word	0xecdf5018	! t0_kref+0x3dd0:   	ldxa	[%i5 + %i0]0x80, %l6
	.word	0x98fdfd26	! t0_kref+0x3dd4:   	sdivcc	%l7, -0x2da, %o4
	call	SYM(t0_subr3)
	.word	0x96fb29b3	! t0_kref+0x3ddc:   	sdivcc	%o4, 0x9b3, %o3
	.word	0x9e5b374f	! t0_kref+0x3de0:   	smul	%o4, -0x8b1, %o7
	.word	0xa5a50929	! t0_kref+0x3de4:   	fmuls	%f20, %f9, %f18
	.word	0x35480001	! t0_kref+0x3de8:   	fbue,a,pt	%fcc0, _kref+0x3dec
	.word	0xd850a026	! t0_kref+0x3dec:   	ldsh	[%g2 + 0x26], %o4
	.word	0x81a88a48	! t0_kref+0x3df0:   	fcmpd	%fcc0, %f2, %f8
	.word	0xe6ce5000	! t0_kref+0x3df4:   	ldsba	[%i1]0x80, %l3
	.word	0x81ddebfb	! t0_kref+0x3df8:   	flush	%l7 + 0xbfb
	.word	0x95a488c2	! t0_kref+0x3dfc:   	fsubd	%f18, %f2, %f10
	.word	0x923e8000	! t0_kref+0x3e00:   	not	%i2, %o1
	.word	0xe99e1000	! t0_kref+0x3e04:   	ldda	[%i0]0x80, %f20
	.word	0xa9a688c6	! t0_kref+0x3e08:   	fsubd	%f26, %f6, %f20
	.word	0x81a90a46	! t0_kref+0x3e0c:   	fcmpd	%fcc0, %f4, %f6
	.word	0x93a649ab	! t0_kref+0x3e10:   	fdivs	%f25, %f11, %f9
	.word	0x99a009c2	! t0_kref+0x3e14:   	fdivd	%f0, %f2, %f12
	.word	0xab36a01f	! t0_kref+0x3e18:   	srl	%i2, 0x1f, %l5
	.word	0x9a76eda3	! t0_kref+0x3e1c:   	udiv	%i3, 0xda3, %o5
	.word	0xb3a00532	! t0_kref+0x3e20:   	fsqrts	%f18, %f25
	.word	0xd40e3fff	! t0_kref+0x3e24:   	ldub	[%i0 - 1], %o2
	.word	0xac45f860	! t0_kref+0x3e28:   	addc	%l7, -0x7a0, %l6
	.word	0x9966801a	! t0_kref+0x3e2c:   	movg	%icc, %i2, %o4
	.word	0xe848a020	! t0_kref+0x3e30:   	ldsb	[%g2 + 0x20], %l4
	.word	0xe9ee101c	! t0_kref+0x3e34:   	prefetcha	%i0 + %i4, 20
	.word	0xdd3e401d	! t0_kref+0x3e38:   	std	%f14, [%i1 + %i5]
	.word	0x9215c000	! t0_kref+0x3e3c:   	or	%l7, %g0, %o1
	.word	0x93a0012e	! t0_kref+0x3e40:   	fabss	%f14, %f9
	.word	0xaa330017	! t0_kref+0x3e44:   	orn	%o4, %l7, %l5
	.word	0x9335e01d	! t0_kref+0x3e48:   	srl	%l7, 0x1d, %o1
	.word	0xaa0a24ba	! t0_kref+0x3e4c:   	and	%o0, 0x4ba, %l5
	.word	0x9e5a4009	! t0_kref+0x3e50:   	smul	%o1, %o1, %o7
	.word	0xa6326516	! t0_kref+0x3e54:   	orn	%o1, 0x516, %l3
	.word	0x942739a8	! t0_kref+0x3e58:   	sub	%i4, -0x658, %o2
	.word	0xa7a00538	! t0_kref+0x3e5c:   	fsqrts	%f24, %f19
	.word	0x85872df4	! t0_kref+0x3e60:   	wr	%i4, 0xdf4, %ccr
	.word	0x98af3314	! t0_kref+0x3e64:   	andncc	%i4, -0xcec, %o4
	.word	0x99a04d2b	! t0_kref+0x3e68:   	fsmuld	%f1, %f11, %f12
	.word	0xeeb6101b	! t0_kref+0x3e6c:   	stha	%l7, [%i0 + %i3]0x80
	.word	0x9a8b3877	! t0_kref+0x3e70:   	andcc	%o4, -0x789, %o5
	.word	0xa856f8ea	! t0_kref+0x3e74:   	umul	%i3, -0x716, %l4
	.word	0x89a01920	! t0_kref+0x3e78:   	fstod	%f0, %f4
	.word	0xec3f4018	! t0_kref+0x3e7c:   	std	%l6, [%i5 + %i0]
	.word	0xcd1fbe58	! t0_kref+0x3e80:   	ldd	[%fp - 0x1a8], %f6
	.word	0x31480006	! t0_kref+0x3e84:   	fba,a,pt	%fcc0, _kref+0x3e9c
	.word	0x9026c01b	! t0_kref+0x3e88:   	sub	%i3, %i3, %o0
	.word	0x983b000c	! t0_kref+0x3e8c:   	xnor	%o4, %o4, %o4
	.word	0xe51fbde8	! t0_kref+0x3e90:   	ldd	[%fp - 0x218], %f18
	.word	0xe49e1000	! t0_kref+0x3e94:   	ldda	[%i0]0x80, %l2
	.word	0x9e1a001c	! t0_kref+0x3e98:   	xor	%o0, %i4, %o7
	.word	0x9a96c008	! t0_kref+0x3e9c:   	orcc	%i3, %o0, %o5
	.word	0xa9a01a2a	! t0_kref+0x3ea0:   	fstoi	%f10, %f20
	.word	0xa9a549aa	! t0_kref+0x3ea4:   	fdivs	%f21, %f10, %f20
	.word	0xa81b001c	! t0_kref+0x3ea8:   	xor	%o4, %i4, %l4
	.word	0x001fffff	! t0_kref+0x3eac:   	illtrap	0x1fffff
	.word	0x81ac0a5a	! t0_kref+0x3eb0:   	fcmpd	%fcc0, %f16, %f26
	.word	0xafa148b5	! t0_kref+0x3eb4:   	fsubs	%f5, %f21, %f23
	.word	0x37480002	! t0_kref+0x3eb8:   	fbge,a,pt	%fcc0, _kref+0x3ec0
	.word	0xf8b61000	! t0_kref+0x3ebc:   	stha	%i4, [%i0]0x80
	.word	0xd000a03c	! t0_kref+0x3ec0:   	ld	[%g2 + 0x3c], %o0
	.word	0xe616c018	! t0_kref+0x3ec4:   	lduh	[%i3 + %i0], %l3
	.word	0xa1a01924	! t0_kref+0x3ec8:   	fstod	%f4, %f16
	.word	0x91400000	! t0_kref+0x3ecc:   	mov	%y, %o0
	.word	0x9af68017	! t0_kref+0x3ed0:   	udivcc	%i2, %l7, %o5
	.word	0xf9ee101a	! t0_kref+0x3ed4:   	prefetcha	%i0 + %i2, 28
	.word	0x907aa04c	! t0_kref+0x3ed8:   	sdiv	%o2, 0x4c, %o0
	.word	0xada01a2a	! t0_kref+0x3edc:   	fstoi	%f10, %f22
	.word	0xa832ae80	! t0_kref+0x3ee0:   	orn	%o2, 0xe80, %l4
	.word	0x9da01888	! t0_kref+0x3ee4:   	fitos	%f8, %f14
	.word	0x89a01920	! t0_kref+0x3ee8:   	fstod	%f0, %f4
	.word	0x9022c01b	! t0_kref+0x3eec:   	sub	%o3, %i3, %o0
	.word	0xacfa737f	! t0_kref+0x3ef0:   	sdivcc	%o1, -0xc81, %l6
	.word	0xd0d6d019	! t0_kref+0x3ef4:   	ldsha	[%i3 + %i1]0x80, %o0
	.word	0x37480005	! t0_kref+0x3ef8:   	fbge,a,pt	%fcc0, _kref+0x3f0c
	.word	0x8ba00028	! t0_kref+0x3efc:   	fmovs	%f8, %f5
	.word	0x9b30201d	! t0_kref+0x3f00:   	srl	%g0, 0x1d, %o5
	.word	0xd03e7fe0	! t0_kref+0x3f04:   	std	%o0, [%i1 - 0x20]
	.word	0xd27f0019	! t0_kref+0x3f08:   	swap	[%i4 + %i1], %o1
	.word	0xda16401b	! t0_kref+0x3f0c:   	lduh	[%i1 + %i3], %o5
	.word	0xe36e001b	! t0_kref+0x3f10:   	prefetch	%i0 + %i3, 17
	.word	0x2c800004	! t0_kref+0x3f14:   	bneg,a	_kref+0x3f24
	.word	0x9ae7245e	! t0_kref+0x3f18:   	subccc	%i4, 0x45e, %o5
	.word	0x941b64e8	! t0_kref+0x3f1c:   	xor	%o5, 0x4e8, %o2
	.word	0x9fc10000	! t0_kref+0x3f20:   	call	%g4
	.word	0xd6ae1000	! t0_kref+0x3f24:   	stba	%o3, [%i0]0x80
	.word	0xab12c00c	! t0_kref+0x3f28:   	taddcctv	%o3, %o4, %l5
	.word	0xda965000	! t0_kref+0x3f2c:   	lduha	[%i1]0x80, %o5
	.word	0xcd26001c	! t0_kref+0x3f30:   	st	%f6, [%i0 + %i4]
	.word	0x3f480003	! t0_kref+0x3f34:   	fbo,a,pt	%fcc0, _kref+0x3f40
	.word	0xd210a000	! t0_kref+0x3f38:   	lduh	[%g2], %o1
	.word	0xda4e2009	! t0_kref+0x3f3c:   	ldsb	[%i0 + 9], %o5
	.word	0x93a548bb	! t0_kref+0x3f40:   	fsubs	%f21, %f27, %f9
	.word	0x8143c000	! t0_kref+0x3f44:   	stbar
	.word	0xe848a00b	! t0_kref+0x3f48:   	ldsb	[%g2 + 0xb], %l4
	.word	0xa7418000	! t0_kref+0x3f4c:   	mov	%fprs, %l3
	.word	0xd400a028	! t0_kref+0x3f50:   	ld	[%g2 + 0x28], %o2
	.word	0x81ae8a54	! t0_kref+0x3f54:   	fcmpd	%fcc0, %f26, %f20
	.word	0x97a00520	! t0_kref+0x3f58:   	fsqrts	%f0, %f11
	sethi	%hi(2f), %o7
	.word	0xe40be3ac	! t0_kref+0x3f60:   	ldub	[%o7 + 0x3ac], %l2
	.word	0xa41ca00c	! t0_kref+0x3f64:   	xor	%l2, 0xc, %l2
	.word	0xe42be3ac	! t0_kref+0x3f68:   	stb	%l2, [%o7 + 0x3ac]
	.word	0x81dbe3ac	! t0_kref+0x3f6c:   	flush	%o7 + 0x3ac
	.word	0x92fa4008	! t0_kref+0x3f70:   	sdivcc	%o1, %o0, %o1
	.word	0x9e26e049	! t0_kref+0x3f74:   	sub	%i3, 0x49, %o7
	.word	0xa69a8000	! t0_kref+0x3f78:   	xorcc	%o2, %g0, %l3
	.word	0x965b000c	! t0_kref+0x3f7c:   	smul	%o4, %o4, %o3
	.word	0x981a800b	! t0_kref+0x3f80:   	xor	%o2, %o3, %o4
	.word	0xaa7f001b	! t0_kref+0x3f84:   	sdiv	%i4, %i3, %l5
	.word	0x2b800004	! t0_kref+0x3f88:   	fbug,a	_kref+0x3f98
	.word	0xd640a028	! t0_kref+0x3f8c:   	ldsw	[%g2 + 0x28], %o3
	.word	0x9e45c00a	! t0_kref+0x3f90:   	addc	%l7, %o2, %o7
	.word	0x960a33e2	! t0_kref+0x3f94:   	and	%o0, -0xc1e, %o3
	.word	0x87a01887	! t0_kref+0x3f98:   	fitos	%f7, %f3
	.word	0xaba589a5	! t0_kref+0x3f9c:   	fdivs	%f22, %f5, %f21
	.word	0x35800003	! t0_kref+0x3fa0:   	fbue,a	_kref+0x3fac
	.word	0x89a389b9	! t0_kref+0x3fa4:   	fdivs	%f14, %f25, %f4
	.word	0x928239c1	! t0_kref+0x3fa8:   	addcc	%o0, -0x63f, %o1
2:	.word	0x9a0ec01b	! t0_kref+0x3fac:   	and	%i3, %i3, %o5
	.word	0x22480005	! t0_kref+0x3fb0:   	be,a,pt	%icc, _kref+0x3fc4
	.word	0xe53e0000	! t0_kref+0x3fb4:   	std	%f18, [%i0]
	.word	0x91a188cc	! t0_kref+0x3fb8:   	fsubd	%f6, %f12, %f8
	.word	0x81a50930	! t0_kref+0x3fbc:   	fmuls	%f20, %f16, %f0
	.word	0x949aadb0	! t0_kref+0x3fc0:   	xorcc	%o2, 0xdb0, %o2
	.word	0x172fb476	! t0_kref+0x3fc4:   	sethi	%hi(0xbed1d800), %o3
	.word	0x81ae8a4e	! t0_kref+0x3fc8:   	fcmpd	%fcc0, %f26, %f14
	.word	0x9fc00004	! t0_kref+0x3fcc:   	call	%g0 + %g4
	.word	0xe8d6101b	! t0_kref+0x3fd0:   	ldsha	[%i0 + %i3]0x80, %l4
	.word	0x81a409c4	! t0_kref+0x3fd4:   	fdivd	%f16, %f4, %f0
	.word	0xda016864	! t0_kref+0x3fd8:   	ld	[%g5 + 0x864], %o5
	.word	0xd816c018	! t0_kref+0x3fdc:   	lduh	[%i3 + %i0], %o4
	.word	0x24800003	! t0_kref+0x3fe0:   	ble,a	_kref+0x3fec
	.word	0xf4264000	! t0_kref+0x3fe4:   	st	%i2, [%i1]
	.word	0xdfa65000	! t0_kref+0x3fe8:   	sta	%f15, [%i1]0x80
	.word	0x83a00129	! t0_kref+0x3fec:   	fabss	%f9, %f1
	.word	0x94b3400b	! t0_kref+0x3ff0:   	orncc	%o5, %o3, %o2
	.word	0xc07e4000	! t0_kref+0x3ff4:   	swap	[%i1], %g0
	.word	0x96aac01c	! t0_kref+0x3ff8:   	andncc	%o3, %i4, %o3
	.word	0x91a3c934	! t0_kref+0x3ffc:   	fmuls	%f15, %f20, %f8
	.word	0xa8403a32	! t0_kref+0x4000:   	addc	%g0, -0x5ce, %l4
	.word	0x8143c000	! t0_kref+0x4004:   	stbar
	.word	0x8143c000	! t0_kref+0x4008:   	stbar
	.word	0xae9a3778	! t0_kref+0x400c:   	xorcc	%o0, -0x888, %l7
	.word	0x9f418000	! t0_kref+0x4010:   	mov	%fprs, %o7
	.word	0xa3a00823	! t0_kref+0x4014:   	fadds	%f0, %f3, %f17
	.word	0xac8ef3d1	! t0_kref+0x4018:   	andcc	%i3, -0xc2f, %l6
	.word	0x8143e040	! t0_kref+0x401c:   	membar	0x40
	.word	0xfb6e001b	! t0_kref+0x4020:   	prefetch	%i0 + %i3, 29
	.word	0x9aadc00a	! t0_kref+0x4024:   	andncc	%l7, %o2, %o5
	.word	0x83a68830	! t0_kref+0x4028:   	fadds	%f26, %f16, %f1
	.word	0xd24e401a	! t0_kref+0x402c:   	ldsb	[%i1 + %i2], %o1
	.word	0xd900a03c	! t0_kref+0x4030:   	ld	[%g2 + 0x3c], %f12
	.word	0xd42e200f	! t0_kref+0x4034:   	stb	%o2, [%i0 + 0xf]
	.word	0x81aa8a46	! t0_kref+0x4038:   	fcmpd	%fcc0, %f10, %f6
	.word	0x9e8df429	! t0_kref+0x403c:   	andcc	%l7, -0xbd7, %o7
	call	SYM(t0_subr1)
	.word	0x96fa401c	! t0_kref+0x4044:   	sdivcc	%o1, %i4, %o3
	.word	0xec3e3fe8	! t0_kref+0x4048:   	std	%l6, [%i0 - 0x18]
	.word	0xe9180019	! t0_kref+0x404c:   	ldd	[%g0 + %i1], %f20
	.word	0x99a00528	! t0_kref+0x4050:   	fsqrts	%f8, %f12
	.word	0x8da0188a	! t0_kref+0x4054:   	fitos	%f10, %f6
	.word	0x9aa2c017	! t0_kref+0x4058:   	subcc	%o3, %l7, %o5
	call	SYM(t0_subr1)
	.word	0x9416801b	! t0_kref+0x4060:   	or	%i2, %i3, %o2
	.word	0xd24e8018	! t0_kref+0x4064:   	ldsb	[%i2 + %i0], %o1
	.word	0x85a0012b	! t0_kref+0x4068:   	fabss	%f11, %f2
	.word	0xda26401c	! t0_kref+0x406c:   	st	%o5, [%i1 + %i4]
	.word	0xafa6882d	! t0_kref+0x4070:   	fadds	%f26, %f13, %f23
	.word	0xae1ec00b	! t0_kref+0x4074:   	xor	%i3, %o3, %l7
	.word	0x33800007	! t0_kref+0x4078:   	fbe,a	_kref+0x4094
	.word	0x001fffff	! t0_kref+0x407c:   	illtrap	0x1fffff
	.word	0xb3a00537	! t0_kref+0x4080:   	fsqrts	%f23, %f25
	.word	0x95a00523	! t0_kref+0x4084:   	fsqrts	%f3, %f10
	.word	0x81ab0a44	! t0_kref+0x4088:   	fcmpd	%fcc0, %f12, %f4
	.word	0x992a600c	! t0_kref+0x408c:   	sll	%o1, 0xc, %o4
	call	SYM(t0_subr2)
	.word	0xd248a01d	! t0_kref+0x4094:   	ldsb	[%g2 + 0x1d], %o1
	.word	0xa1a01048	! t0_kref+0x4098:   	fdtox	%f8, %f16
	.word	0x81a688b6	! t0_kref+0x409c:   	fsubs	%f26, %f22, %f0
	.word	0x9245e0c2	! t0_kref+0x40a0:   	addc	%l7, 0xc2, %o1
	.word	0xcd1fbf38	! t0_kref+0x40a4:   	ldd	[%fp - 0xc8], %f6
	.word	0x2f480003	! t0_kref+0x40a8:   	fbu,a,pt	%fcc0, _kref+0x40b4
	.word	0xd9be5a1b	! t0_kref+0x40ac:   	stda	%f12, [%i1 + %i3]0xd0
	.word	0x9246fbb1	! t0_kref+0x40b0:   	addc	%i3, -0x44f, %o1
	.word	0xe53f4018	! t0_kref+0x40b4:   	std	%f18, [%i5 + %i0]
	.word	0xa60a8017	! t0_kref+0x40b8:   	and	%o2, %l7, %l3
	.word	0xafa0c8a4	! t0_kref+0x40bc:   	fsubs	%f3, %f4, %f23
	.word	0x92fe8000	! t0_kref+0x40c0:   	sdivcc	%i2, %g0, %o1
	.word	0xe76e401a	! t0_kref+0x40c4:   	prefetch	%i1 + %i2, 19
	call	SYM(t0_subr3)
	.word	0x81800000	! t0_kref+0x40cc:   	mov	%g0, %y
	.word	0x81ae8a48	! t0_kref+0x40d0:   	fcmpd	%fcc0, %f26, %f8
	.word	0xab3ee011	! t0_kref+0x40d4:   	sra	%i3, 0x11, %l5
	.word	0xa63ee676	! t0_kref+0x40d8:   	xnor	%i3, 0x676, %l3
	.word	0xf6b01018	! t0_kref+0x40dc:   	stha	%i3, [%g0 + %i0]0x80
	.word	0xa83f0000	! t0_kref+0x40e0:   	not	%i4, %l4
	.word	0xc0fe5000	! t0_kref+0x40e4:   	swapa	[%i1]0x80, %g0
	.word	0x9a1f22f3	! t0_kref+0x40e8:   	xor	%i4, 0x2f3, %o5
	.word	0xdd270018	! t0_kref+0x40ec:   	st	%f14, [%i4 + %i0]
	.word	0xd2270018	! t0_kref+0x40f0:   	st	%o1, [%i4 + %i0]
	.word	0x9da00525	! t0_kref+0x40f4:   	fsqrts	%f5, %f14
	.word	0xf11fbd30	! t0_kref+0x40f8:   	ldd	[%fp - 0x2d0], %f24
	.word	0xada01a2b	! t0_kref+0x40fc:   	fstoi	%f11, %f22
	.word	0x9ba00520	! t0_kref+0x4100:   	fsqrts	%f0, %f13
	.word	0x987a400a	! t0_kref+0x4104:   	sdiv	%o1, %o2, %o4
	.word	0xd620a024	! t0_kref+0x4108:   	st	%o3, [%g2 + 0x24]
	.word	0x8582800d	! t0_kref+0x410c:   	wr	%o2, %o5, %ccr
	.word	0xee7e6004	! t0_kref+0x4110:   	swap	[%i1 + 4], %l7
	.word	0xe320a034	! t0_kref+0x4114:   	st	%f17, [%g2 + 0x34]
	.word	0x23480003	! t0_kref+0x4118:   	fbne,a,pt	%fcc0, _kref+0x4124
	.word	0x921f2837	! t0_kref+0x411c:   	xor	%i4, 0x837, %o1
	.word	0x24800006	! t0_kref+0x4120:   	ble,a	_kref+0x4138
	.word	0xde00a028	! t0_kref+0x4124:   	ld	[%g2 + 0x28], %o7
	.word	0xa5a489c2	! t0_kref+0x4128:   	fdivd	%f18, %f2, %f18
	.word	0xd448a022	! t0_kref+0x412c:   	ldsb	[%g2 + 0x22], %o2
	.word	0x92af001a	! t0_kref+0x4130:   	andncc	%i4, %i2, %o1
	.word	0x81a409d2	! t0_kref+0x4134:   	fdivd	%f16, %f18, %f0
	.word	0xd830a024	! t0_kref+0x4138:   	sth	%o4, [%g2 + 0x24]
	.word	0xada049a7	! t0_kref+0x413c:   	fdivs	%f1, %f7, %f22
	.word	0xd80e201b	! t0_kref+0x4140:   	ldub	[%i0 + 0x1b], %o4
	.word	0x92032a71	! t0_kref+0x4144:   	add	%o4, 0xa71, %o1
	.word	0x97a088a6	! t0_kref+0x4148:   	fsubs	%f2, %f6, %f11
	.word	0x9ed5e48b	! t0_kref+0x414c:   	umulcc	%l7, 0x48b, %o7
	.word	0xd01e6018	! t0_kref+0x4150:   	ldd	[%i1 + 0x18], %o0
	.word	0xd8b6101b	! t0_kref+0x4154:   	stha	%o4, [%i0 + %i3]0x80
	.word	0x81def3c3	! t0_kref+0x4158:   	flush	%i3 - 0xc3d
	.word	0x91a24924	! t0_kref+0x415c:   	fmuls	%f9, %f4, %f8
	.word	0xa3a3c830	! t0_kref+0x4160:   	fadds	%f15, %f16, %f17
	.word	0xaa9ea736	! t0_kref+0x4164:   	xorcc	%i2, 0x736, %l5
	.word	0xe8163fec	! t0_kref+0x4168:   	lduh	[%i0 - 0x14], %l4
	.word	0x29800006	! t0_kref+0x416c:   	fbl,a	_kref+0x4184
	.word	0xa692321c	! t0_kref+0x4170:   	orcc	%o0, -0xde4, %l3
	.word	0xa3a1c9b1	! t0_kref+0x4174:   	fdivs	%f7, %f17, %f17
	.word	0x33800005	! t0_kref+0x4178:   	fbe,a	_kref+0x418c
	.word	0xdb20a02c	! t0_kref+0x417c:   	st	%f13, [%g2 + 0x2c]
	.word	0x93a00522	! t0_kref+0x4180:   	fsqrts	%f2, %f9
	.word	0x9fa00123	! t0_kref+0x4184:   	fabss	%f3, %f15
	.word	0xf6774018	! t0_kref+0x4188:   	stx	%i3, [%i5 + %i0]
	.word	0xd100a000	! t0_kref+0x418c:   	ld	[%g2], %f8
	.word	0xa6fa401a	! t0_kref+0x4190:   	sdivcc	%o1, %i2, %l3
	.word	0x3b480005	! t0_kref+0x4194:   	fble,a,pt	%fcc0, _kref+0x41a8
	.word	0x9892a5ae	! t0_kref+0x4198:   	orcc	%o2, 0x5ae, %o4
	.word	0x11185b72	! t0_kref+0x419c:   	sethi	%hi(0x616dc800), %o0
	.word	0xf420a018	! t0_kref+0x41a0:   	st	%i2, [%g2 + 0x18]
	.word	0xa5a00021	! t0_kref+0x41a4:   	fmovs	%f1, %f18
	.word	0x81adcab9	! t0_kref+0x41a8:   	fcmpes	%fcc0, %f23, %f25
	.word	0xaed3401a	! t0_kref+0x41ac:   	umulcc	%o5, %i2, %l7
	.word	0xa69229ba	! t0_kref+0x41b0:   	orcc	%o0, 0x9ba, %l3
	.word	0x3d480003	! t0_kref+0x41b4:   	fbule,a,pt	%fcc0, _kref+0x41c0
	.word	0xee28a011	! t0_kref+0x41b8:   	stb	%l7, [%g2 + 0x11]
	.word	0xa862c01a	! t0_kref+0x41bc:   	subc	%o3, %i2, %l4
	.word	0xc7270019	! t0_kref+0x41c0:   	st	%f3, [%i4 + %i1]
	.word	0x9de3bfa0	! t0_kref+0x41c4:   	save	%sp, -0x60, %sp
	.word	0xba5f6b67	! t0_kref+0x41c8:   	smul	%i5, 0xb67, %i5
	.word	0xafef2053	! t0_kref+0x41cc:   	restore	%i4, 0x53, %l7
	.word	0xa8d332fe	! t0_kref+0x41d0:   	umulcc	%o4, -0xd02, %l4
	.word	0x39800003	! t0_kref+0x41d4:   	fbuge,a	_kref+0x41e0
	.word	0xa9a5094a	! t0_kref+0x41d8:   	fmuld	%f20, %f10, %f20
	.word	0x1108f58e	! t0_kref+0x41dc:   	sethi	%hi(0x23d63800), %o0
	.word	0xc0f65000	! t0_kref+0x41e0:   	stxa	%g0, [%i1]0x80
	.word	0xafa089a5	! t0_kref+0x41e4:   	fdivs	%f2, %f5, %f23
	.word	0xd9be5857	! t0_kref+0x41e8:   	stda	%f12, [%i1 + %l7]0xc2
	.word	0xa7a01a2c	! t0_kref+0x41ec:   	fstoi	%f12, %f19
	.word	0x21480002	! t0_kref+0x41f0:   	fbn,a,pt	%fcc0, _kref+0x41f8
	.word	0x9ae0000b	! t0_kref+0x41f4:   	subccc	%g0, %o3, %o5
	.word	0xdb20a004	! t0_kref+0x41f8:   	st	%f13, [%g2 + 4]
	.word	0xa7a00023	! t0_kref+0x41fc:   	fmovs	%f3, %f19
	.word	0x81ab4aa0	! t0_kref+0x4200:   	fcmpes	%fcc0, %f13, %f0
	.word	0xa1a90030	! t0_kref+0x4204:   	fmovsl	%fcc0, %f16, %f16
	.word	0xac632f04	! t0_kref+0x4208:   	subc	%o4, 0xf04, %l6
	.word	0xa8372479	! t0_kref+0x420c:   	orn	%i4, 0x479, %l4
	.word	0xd720a038	! t0_kref+0x4210:   	st	%f11, [%g2 + 0x38]
	.word	0x83a00528	! t0_kref+0x4214:   	fsqrts	%f8, %f1
	.word	0xd8a65000	! t0_kref+0x4218:   	sta	%o4, [%i1]0x80
	sethi	%hi(2f), %o7
	.word	0xe40be26c	! t0_kref+0x4220:   	ldub	[%o7 + 0x26c], %l2
	.word	0xa41ca00c	! t0_kref+0x4224:   	xor	%l2, 0xc, %l2
	.word	0xe42be26c	! t0_kref+0x4228:   	stb	%l2, [%o7 + 0x26c]
	.word	0x81dbe26c	! t0_kref+0x422c:   	flush	%o7 + 0x26c
	.word	0xc300a014	! t0_kref+0x4230:   	ld	[%g2 + 0x14], %f1
	call	SYM(t0_subr3)
	.word	0xd03e7fe0	! t0_kref+0x4238:   	std	%o0, [%i1 - 0x20]
	.word	0xd51e6010	! t0_kref+0x423c:   	ldd	[%i1 + 0x10], %f10
	.word	0xb3a34930	! t0_kref+0x4240:   	fmuls	%f13, %f16, %f25
	.word	0x3f480008	! t0_kref+0x4244:   	fbo,a,pt	%fcc0, _kref+0x4264
	.word	0xb5a3c92c	! t0_kref+0x4248:   	fmuls	%f15, %f12, %f26
	.word	0x37480006	! t0_kref+0x424c:   	fbge,a,pt	%fcc0, _kref+0x4264
	.word	0xd4981018	! t0_kref+0x4250:   	ldda	[%g0 + %i0]0x80, %o2
	.word	0xa87b0000	! t0_kref+0x4254:   	sdiv	%o4, %g0, %l4
	.word	0x94130008	! t0_kref+0x4258:   	or	%o4, %o0, %o2
	.word	0xaa0f000c	! t0_kref+0x425c:   	and	%i4, %o4, %l5
	.word	0x9fc10000	! t0_kref+0x4260:   	call	%g4
	.word	0xd8c01019	! t0_kref+0x4264:   	ldswa	[%g0 + %i1]0x80, %o4
	.word	0xe3b8a040	! t0_kref+0x4268:   	stda	%f48, [%g2 + 0x40]%asi
2:	.word	0xee260000	! t0_kref+0x426c:   	st	%l7, [%i0]
	.word	0x81aa8a44	! t0_kref+0x4270:   	fcmpd	%fcc0, %f10, %f4
	.word	0x9fa00025	! t0_kref+0x4274:   	fmovs	%f5, %f15
	.word	0xdad6d018	! t0_kref+0x4278:   	ldsha	[%i3 + %i0]0x80, %o5
	.word	0x9fc00004	! t0_kref+0x427c:   	call	%g0 + %g4
	.word	0xe1be5800	! t0_kref+0x4280:   	stda	%f16, [%i1]0xc0
	.word	0x9835c00c	! t0_kref+0x4284:   	orn	%l7, %o4, %o4
	.word	0xaaab400d	! t0_kref+0x4288:   	andncc	%o5, %o5, %l5
	.word	0xaba248b8	! t0_kref+0x428c:   	fsubs	%f9, %f24, %f21
	.word	0x99a58858	! t0_kref+0x4290:   	faddd	%f22, %f24, %f12
	.word	0xa6902303	! t0_kref+0x4294:   	orcc	%g0, 0x303, %l3
	.word	0xa602aac7	! t0_kref+0x4298:   	add	%o2, 0xac7, %l3
	.word	0x89a2094c	! t0_kref+0x429c:   	fmuld	%f8, %f12, %f4
	.word	0xd650a004	! t0_kref+0x42a0:   	ldsh	[%g2 + 4], %o3
	.word	0x961ea9d1	! t0_kref+0x42a4:   	xor	%i2, 0x9d1, %o3
	.word	0x2f480002	! t0_kref+0x42a8:   	fbu,a,pt	%fcc0, _kref+0x42b0
	.word	0x9e52a43d	! t0_kref+0x42ac:   	umul	%o2, 0x43d, %o7
	.word	0xada2c820	! t0_kref+0x42b0:   	fadds	%f11, %f0, %f22
	.word	0x9da01a29	! t0_kref+0x42b4:   	fstoi	%f9, %f14
	.word	0x81df0019	! t0_kref+0x42b8:   	flush	%i4 + %i1
	.word	0x21800006	! t0_kref+0x42bc:   	fbn,a	_kref+0x42d4
	.word	0xee28a001	! t0_kref+0x42c0:   	stb	%l7, [%g2 + 1]
	.word	0x9e8ec008	! t0_kref+0x42c4:   	andcc	%i3, %o0, %o7
	.word	0x99a1c93b	! t0_kref+0x42c8:   	fmuls	%f7, %f27, %f12
	.word	0xd43e0000	! t0_kref+0x42cc:   	std	%o2, [%i0]
	.word	0x9025c017	! t0_kref+0x42d0:   	sub	%l7, %l7, %o0
	.word	0x9027001a	! t0_kref+0x42d4:   	sub	%i4, %i2, %o0
	.word	0xed00a034	! t0_kref+0x42d8:   	ld	[%g2 + 0x34], %f22
	.word	0xd8580019	! t0_kref+0x42dc:   	ldx	[%g0 + %i1], %o4
	.word	0xb6103ffc	! t0_kref+0x42e0:   	mov	0xfffffffc, %i3
	.word	0xee2e4000	! t0_kref+0x42e4:   	stb	%l7, [%i1]
	.word	0xad70000d	! t0_kref+0x42e8:   	popc	%o5, %l6
	.word	0xa68df843	! t0_kref+0x42ec:   	andcc	%l7, -0x7bd, %l3
	call	1f
	.empty
	.word	0xd240a004	! t0_kref+0x42f4:   	ldsw	[%g2 + 4], %o1
	.word	0xb1a01888	! t0_kref+0x42f8:   	fitos	%f8, %f24
	.word	0x20800004	! t0_kref+0x42fc:   	bn,a	_kref+0x430c
	.word	0xada00138	! t0_kref+0x4300:   	fabss	%f24, %f22
1:	.word	0xa633400a	! t0_kref+0x4304:   	orn	%o5, %o2, %l3
	.word	0xa65f2ff3	! t0_kref+0x4308:   	smul	%i4, 0xff3, %l3
	.word	0xa8c273c9	! t0_kref+0x430c:   	addccc	%o1, -0xc37, %l4
	.word	0x91a01898	! t0_kref+0x4310:   	fitos	%f24, %f8
	.word	0xd03e6008	! t0_kref+0x4314:   	std	%o0, [%i1 + 8]
	.word	0x92c232f0	! t0_kref+0x4318:   	addccc	%o0, -0xd10, %o1
	.word	0x23800002	! t0_kref+0x431c:   	fbne,a	_kref+0x4324
	.word	0xd41e6010	! t0_kref+0x4320:   	ldd	[%i1 + 0x10], %o2
	.word	0x32800001	! t0_kref+0x4324:   	bne,a	_kref+0x4328
	.word	0x9002800a	! t0_kref+0x4328:   	add	%o2, %o2, %o0
	call	SYM(t0_subr1)
	.word	0xb7a2c8aa	! t0_kref+0x4330:   	fsubs	%f11, %f10, %f27
	.word	0x1b306f27	! t0_kref+0x4334:   	sethi	%hi(0xc1bc9c00), %o5
	.word	0xb5a10958	! t0_kref+0x4338:   	fmuld	%f4, %f24, %f26
	.word	0x920b0008	! t0_kref+0x433c:   	and	%o4, %o0, %o1
	.word	0xac02332d	! t0_kref+0x4340:   	add	%o0, -0xcd3, %l6
	.word	0xd828a029	! t0_kref+0x4344:   	stb	%o4, [%g2 + 0x29]
	.word	0x26800006	! t0_kref+0x4348:   	bl,a	_kref+0x4360
	.word	0xd030a03a	! t0_kref+0x434c:   	sth	%o0, [%g2 + 0x3a]
	.word	0xa3a00534	! t0_kref+0x4350:   	fsqrts	%f20, %f17
	.word	0x85a01900	! t0_kref+0x4354:   	fitod	%f0, %f2
	.word	0xaf2f2005	! t0_kref+0x4358:   	sll	%i4, 0x5, %l7
	.word	0x81ab8a4c	! t0_kref+0x435c:   	fcmpd	%fcc0, %f14, %f12
	.word	0x965eaabc	! t0_kref+0x4360:   	smul	%i2, 0xabc, %o3
	.word	0xa65f2a59	! t0_kref+0x4364:   	smul	%i4, 0xa59, %l3
	.word	0xa65a800c	! t0_kref+0x4368:   	smul	%o2, %o4, %l3
	.word	0xa9a01892	! t0_kref+0x436c:   	fitos	%f18, %f20
	.word	0xb7a0188f	! t0_kref+0x4370:   	fitos	%f15, %f27
	.word	0x83a00033	! t0_kref+0x4374:   	fmovs	%f19, %f1
	.word	0xda260000	! t0_kref+0x4378:   	st	%o5, [%i0]
	.word	0xd640a000	! t0_kref+0x437c:   	ldsw	[%g2], %o3
	.word	0x21480006	! t0_kref+0x4380:   	fbn,a,pt	%fcc0, _kref+0x4398
	.word	0xd24e3ff6	! t0_kref+0x4384:   	ldsb	[%i0 - 0xa], %o1
	.word	0xd43f4018	! t0_kref+0x4388:   	std	%o2, [%i5 + %i0]
	.word	0x8ba01a26	! t0_kref+0x438c:   	fstoi	%f6, %f5
	.word	0xada64d3a	! t0_kref+0x4390:   	fsmuld	%f25, %f26, %f22
	.word	0xa3a5093a	! t0_kref+0x4394:   	fmuls	%f20, %f26, %f17
	.word	0x95a009c8	! t0_kref+0x4398:   	fdivd	%f0, %f8, %f10
	.word	0xa8c6e9c3	! t0_kref+0x439c:   	addccc	%i3, 0x9c3, %l4
	.word	0x99a209d8	! t0_kref+0x43a0:   	fdivd	%f8, %f24, %f12
	.word	0x81ab8a32	! t0_kref+0x43a4:   	fcmps	%fcc0, %f14, %f18
	.word	0x9846ed99	! t0_kref+0x43a8:   	addc	%i3, 0xd99, %o4
	.word	0xa8f330d6	! t0_kref+0x43ac:   	udivcc	%o4, -0xf2a, %l4
	.word	0x9de3bfa0	! t0_kref+0x43b0:   	save	%sp, -0x60, %sp
	.word	0x93ee3ceb	! t0_kref+0x43b4:   	restore	%i0, -0x315, %o1
	.word	0x9de3bfa0	! t0_kref+0x43b8:   	save	%sp, -0x60, %sp
	.word	0xb410001a	! t0_kref+0x43bc:   	mov	%i2, %i2
	.word	0x97ef001b	! t0_kref+0x43c0:   	restore	%i4, %i3, %o3
	.word	0x92236967	! t0_kref+0x43c4:   	sub	%o5, 0x967, %o1
	.word	0x8da609da	! t0_kref+0x43c8:   	fdivd	%f24, %f26, %f6
	.word	0xae182ba7	! t0_kref+0x43cc:   	xor	%g0, 0xba7, %l7
	.word	0xe11f4018	! t0_kref+0x43d0:   	ldd	[%i5 + %i0], %f16
	.word	0x9a4029aa	! t0_kref+0x43d4:   	addc	%g0, 0x9aa, %o5
	.word	0x9e1af078	! t0_kref+0x43d8:   	xor	%o3, -0xf88, %o7
	.word	0xe610a028	! t0_kref+0x43dc:   	lduh	[%g2 + 0x28], %l3
	.word	0x9f2dc00b	! t0_kref+0x43e0:   	sll	%l7, %o3, %o7
	.word	0x9ef32032	! t0_kref+0x43e4:   	udivcc	%o4, 0x32, %o7
	.word	0xe64e8018	! t0_kref+0x43e8:   	ldsb	[%i2 + %i0], %l3
	.word	0xda28a022	! t0_kref+0x43ec:   	stb	%o5, [%g2 + 0x22]
	.word	0x980ee37b	! t0_kref+0x43f0:   	and	%i3, 0x37b, %o4
	.word	0xd51fbf28	! t0_kref+0x43f4:   	ldd	[%fp - 0xd8], %f10
	.word	0xf8300018	! t0_kref+0x43f8:   	sth	%i4, [%g0 + %i0]
	.word	0x21800002	! t0_kref+0x43fc:   	fbn,a	_kref+0x4404
	.word	0x9b2e800a	! t0_kref+0x4400:   	sll	%i2, %o2, %o5
	.word	0x83a2092f	! t0_kref+0x4404:   	fmuls	%f8, %f15, %f1
	.word	0xa81f000c	! t0_kref+0x4408:   	xor	%i4, %o4, %l4
	.word	0x949a0017	! t0_kref+0x440c:   	xorcc	%o0, %l7, %o2
	.word	0xaa9b2949	! t0_kref+0x4410:   	xorcc	%o4, 0x949, %l5
	.word	0x99a349bb	! t0_kref+0x4414:   	fdivs	%f13, %f27, %f12
	.word	0xcd00a024	! t0_kref+0x4418:   	ld	[%g2 + 0x24], %f6
	.word	0xad17292c	! t0_kref+0x441c:   	taddcctv	%i4, 0x92c, %l6
	.word	0xd410a006	! t0_kref+0x4420:   	lduh	[%g2 + 6], %o2
	.word	0xf836200a	! t0_kref+0x4424:   	sth	%i4, [%i0 + 0xa]
	.word	0x95418000	! t0_kref+0x4428:   	mov	%fprs, %o2
	.word	0x947ef97a	! t0_kref+0x442c:   	sdiv	%i3, -0x686, %o2
	.word	0xe51fbf68	! t0_kref+0x4430:   	ldd	[%fp - 0x98], %f18
	.word	0x9e5b000a	! t0_kref+0x4434:   	smul	%o4, %o2, %o7
	.word	0xe7801019	! t0_kref+0x4438:   	lda	[%g0 + %i1]0x80, %f19
	.word	0xb3a01094	! t0_kref+0x443c:   	fxtos	%f20, %f25
	.word	0xaad2ef8a	! t0_kref+0x4440:   	umulcc	%o3, 0xf8a, %l5
	.word	0xc807bfe4	! t0_kref+0x4444:   	ld	[%fp - 0x1c], %g4
	.word	0x8da188cc	! t0_kref+0x4448:   	fsubd	%f6, %f12, %f6
	.word	0xe300a028	! t0_kref+0x444c:   	ld	[%g2 + 0x28], %f17
	.word	0x9da388c4	! t0_kref+0x4450:   	fsubd	%f14, %f4, %f14
	.word	0x95a01a21	! t0_kref+0x4454:   	fstoi	%f1, %f10
	.word	0xd03e7fe8	! t0_kref+0x4458:   	std	%o0, [%i1 - 0x18]
	.word	0xd9be1809	! t0_kref+0x445c:   	stda	%f12, [%i0 + %o1]0xc0
	.word	0xacaec00d	! t0_kref+0x4460:   	andncc	%i3, %o5, %l6
	.word	0x2d800006	! t0_kref+0x4464:   	fbg,a	_kref+0x447c
	.word	0x9f32a010	! t0_kref+0x4468:   	srl	%o2, 0x10, %o7
	.word	0xaa8b4017	! t0_kref+0x446c:   	andcc	%o5, %l7, %l5
	.word	0xd096501b	! t0_kref+0x4470:   	lduha	[%i1 + %i3]0x80, %o0
	.word	0x96a80009	! t0_kref+0x4474:   	andncc	%g0, %o1, %o3
	.word	0x94c7000d	! t0_kref+0x4478:   	addccc	%i4, %o5, %o2
	.word	0x83a048af	! t0_kref+0x447c:   	fsubs	%f1, %f15, %f1
	.word	0xa60731f6	! t0_kref+0x4480:   	add	%i4, -0xe0a, %l3
	.word	0x94c5fdff	! t0_kref+0x4484:   	addccc	%l7, -0x201, %o2
	.word	0x32800005	! t0_kref+0x4488:   	bne,a	_kref+0x449c
	.word	0xb3a68826	! t0_kref+0x448c:   	fadds	%f26, %f6, %f25
	.word	0x8ba4c938	! t0_kref+0x4490:   	fmuls	%f19, %f24, %f5
	.word	0x9666800a	! t0_kref+0x4494:   	subc	%i2, %o2, %o3
	.word	0x91a1c9ac	! t0_kref+0x4498:   	fdivs	%f7, %f12, %f8
	.word	0x90c68009	! t0_kref+0x449c:   	addccc	%i2, %o1, %o0
	.word	0xad202314	! t0_kref+0x44a0:   	mulscc	%g0, 0x314, %l6
	.word	0xaafe8017	! t0_kref+0x44a4:   	sdivcc	%i2, %l7, %l5
	.word	0xda16001b	! t0_kref+0x44a8:   	lduh	[%i0 + %i3], %o5
	.word	0x8fa00534	! t0_kref+0x44ac:   	fsqrts	%f20, %f7
	.word	0xd43e4000	! t0_kref+0x44b0:   	std	%o2, [%i1]
	.word	0x3a480004	! t0_kref+0x44b4:   	bcc,a,pt	%icc, _kref+0x44c4
	.word	0x9a8dc01b	! t0_kref+0x44b8:   	andcc	%l7, %i3, %o5
	.word	0x39480002	! t0_kref+0x44bc:   	fbuge,a,pt	%fcc0, _kref+0x44c4
	.word	0x94182895	! t0_kref+0x44c0:   	xor	%g0, 0x895, %o2
	.word	0xee30a008	! t0_kref+0x44c4:   	sth	%l7, [%g2 + 8]
	.word	0xf7ee501b	! t0_kref+0x44c8:   	prefetcha	%i1 + %i3, 27
	sethi	%hi(2f), %o7
	.word	0xe40be110	! t0_kref+0x44d0:   	ldub	[%o7 + 0x110], %l2
	.word	0xa41ca00c	! t0_kref+0x44d4:   	xor	%l2, 0xc, %l2
	.word	0xe42be110	! t0_kref+0x44d8:   	stb	%l2, [%o7 + 0x110]
	.word	0x81dbe110	! t0_kref+0x44dc:   	flush	%o7 + 0x110
	.word	0xa1a208c8	! t0_kref+0x44e0:   	fsubd	%f8, %f8, %f16
	.word	0x33800007	! t0_kref+0x44e4:   	fbe,a	_kref+0x4500
	.word	0xec3e2000	! t0_kref+0x44e8:   	std	%l6, [%i0]
	.word	0xc36e2010	! t0_kref+0x44ec:   	prefetch	%i0 + 0x10, 1
	.word	0xac02f9a7	! t0_kref+0x44f0:   	add	%o3, -0x659, %l6
	.word	0x9a52c01c	! t0_kref+0x44f4:   	umul	%o3, %i4, %o5
	.word	0x3f480001	! t0_kref+0x44f8:   	fbo,a,pt	%fcc0, _kref+0x44fc
	.word	0xaf400000	! t0_kref+0x44fc:   	mov	%y, %l7
	.word	0x9075f25c	! t0_kref+0x4500:   	udiv	%l7, -0xda4, %o0
	.word	0xd0380019	! t0_kref+0x4504:   	std	%o0, [%g0 + %i1]
	.word	0xa5a00035	! t0_kref+0x4508:   	fmovs	%f21, %f18
	.word	0x81ae8a22	! t0_kref+0x450c:   	fcmps	%fcc0, %f26, %f2
2:	.word	0xaba00137	! t0_kref+0x4510:   	fabss	%f23, %f21
	.word	0xac3b64bf	! t0_kref+0x4514:   	xnor	%o5, 0x4bf, %l6
	.word	0x23480003	! t0_kref+0x4518:   	fbne,a,pt	%fcc0, _kref+0x4524
	.word	0x95a489b1	! t0_kref+0x451c:   	fdivs	%f18, %f17, %f10
	.word	0x9fc00004	! t0_kref+0x4520:   	call	%g0 + %g4
	.word	0xea4e600c	! t0_kref+0x4524:   	ldsb	[%i1 + 0xc], %l5
	.word	0xaba00135	! t0_kref+0x4528:   	fabss	%f21, %f21
	.word	0xa83df189	! t0_kref+0x452c:   	xnor	%l7, -0xe77, %l4
	.word	0xa8c3001b	! t0_kref+0x4530:   	addccc	%o4, %i3, %l4
	.word	0x81820000	! t0_kref+0x4534:   	wr	%o0, %g0, %y
	.word	0x94936e45	! t0_kref+0x4538:   	orcc	%o5, 0xe45, %o2
	sethi	%hi(2f), %o7
	.word	0xe40be174	! t0_kref+0x4540:   	ldub	[%o7 + 0x174], %l2
	.word	0xa41ca00c	! t0_kref+0x4544:   	xor	%l2, 0xc, %l2
	.word	0xe42be174	! t0_kref+0x4548:   	stb	%l2, [%o7 + 0x174]
	.word	0x81dbe174	! t0_kref+0x454c:   	flush	%o7 + 0x174
	.word	0x28480005	! t0_kref+0x4550:   	bleu,a,pt	%icc, _kref+0x4564
	.word	0xde4e0000	! t0_kref+0x4554:   	ldsb	[%i0], %o7
	.word	0x2e800008	! t0_kref+0x4558:   	bvs,a	_kref+0x4578
	.word	0xae92801b	! t0_kref+0x455c:   	orcc	%o2, %i3, %l7
	.word	0xb5a60d34	! t0_kref+0x4560:   	fsmuld	%f24, %f20, %f26
	.word	0x2e800005	! t0_kref+0x4564:   	bvs,a	_kref+0x4578
	.word	0x9a9732b1	! t0_kref+0x4568:   	orcc	%i4, -0xd4f, %o5
	.word	0xafa01a24	! t0_kref+0x456c:   	fstoi	%f4, %f23
	.word	0x81db0004	! t0_kref+0x4570:   	flush	%o4 + %g4
2:	.word	0x8da04d2f	! t0_kref+0x4574:   	fsmuld	%f1, %f15, %f6
	.word	0xee28a007	! t0_kref+0x4578:   	stb	%l7, [%g2 + 7]
	.word	0xe9380019	! t0_kref+0x457c:   	std	%f20, [%g0 + %i1]
	.word	0x99a10952	! t0_kref+0x4580:   	fmuld	%f4, %f18, %f12
	.word	0xada0014a	! t0_kref+0x4584:   	fabsd	%f10, %f22
	.word	0xd5871018	! t0_kref+0x4588:   	lda	[%i4 + %i0]0x80, %f10
	.word	0x29480008	! t0_kref+0x458c:   	fbl,a,pt	%fcc0, _kref+0x45ac
	.word	0x99a48d33	! t0_kref+0x4590:   	fsmuld	%f18, %f19, %f12
	.word	0x96d2ec5e	! t0_kref+0x4594:   	umulcc	%o3, 0xc5e, %o3
	.word	0xae00000d	! t0_kref+0x4598:   	add	%g0, %o5, %l7
	.word	0xaadec009	! t0_kref+0x459c:   	smulcc	%i3, %o1, %l5
	.word	0xac16bf60	! t0_kref+0x45a0:   	or	%i2, -0xa0, %l6
	.word	0x8ba01a2b	! t0_kref+0x45a4:   	fstoi	%f11, %f5
	.word	0xdd00a018	! t0_kref+0x45a8:   	ld	[%g2 + 0x18], %f14
	.word	0x8610200f	! t0_kref+0x45ac:   	mov	0xf, %g3
	.word	0x86a0e001	! t0_kref+0x45b0:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x45b4:   	be,a	_kref+0x4624
	.word	0xac12fd94	! t0_kref+0x45b8:   	or	%o3, -0x26c, %l6
	.word	0x93a3482d	! t0_kref+0x45bc:   	fadds	%f13, %f13, %f9
	.word	0x2ebffffc	! t0_kref+0x45c0:   	bvs,a	_kref+0x45b0
	.word	0xada01a2c	! t0_kref+0x45c4:   	fstoi	%f12, %f22
	.word	0xe8871059	! t0_kref+0x45c8:   	lda	[%i4 + %i1]0x82, %l4
	.word	0xaf400000	! t0_kref+0x45cc:   	mov	%y, %l7
	.word	0xa1a30956	! t0_kref+0x45d0:   	fmuld	%f12, %f22, %f16
	.word	0xae98001a	! t0_kref+0x45d4:   	xorcc	%g0, %i2, %l7
	.word	0xb3a68929	! t0_kref+0x45d8:   	fmuls	%f26, %f9, %f25
	.word	0x274ffff5	! t0_kref+0x45dc:   	fbul,a,pt	%fcc0, _kref+0x45b0
	.word	0x85a50956	! t0_kref+0x45e0:   	fmuld	%f20, %f22, %f2
	.word	0x8da188cc	! t0_kref+0x45e4:   	fsubd	%f6, %f12, %f6
	.word	0xaf3a6009	! t0_kref+0x45e8:   	sra	%o1, 0x9, %l7
	.word	0x89a00152	! t0_kref+0x45ec:   	fabsd	%f18, %f4
	.word	0xacdaf85b	! t0_kref+0x45f0:   	smulcc	%o3, -0x7a5, %l6
	.word	0xa5a34931	! t0_kref+0x45f4:   	fmuls	%f13, %f17, %f18
	.word	0xd87e6014	! t0_kref+0x45f8:   	swap	[%i1 + 0x14], %o4
	.word	0x9602fb69	! t0_kref+0x45fc:   	add	%o3, -0x497, %o3
	.word	0xd11fbf40	! t0_kref+0x4600:   	ldd	[%fp - 0xc0], %f8
	.word	0xec1e4000	! t0_kref+0x4604:   	ldd	[%i1], %l6
	.word	0xc96e000b	! t0_kref+0x4608:   	prefetch	%i0 + %o3, 4
	.word	0xc5260000	! t0_kref+0x460c:   	st	%f2, [%i0]
	.word	0xd03e4000	! t0_kref+0x4610:   	std	%o0, [%i1]
	.word	0x22bfffe7	! t0_kref+0x4614:   	be,a	_kref+0x45b0
	.word	0xe41e6018	! t0_kref+0x4618:   	ldd	[%i1 + 0x18], %l2
	.word	0x9fc10000	! t0_kref+0x461c:   	call	%g4
	.word	0xaab6a6ad	! t0_kref+0x4620:   	orncc	%i2, 0x6ad, %l5
	.word	0xaeb325ba	! t0_kref+0x4624:   	orncc	%o4, 0x5ba, %l7
	.word	0x86102021	! t0_kref+0x4628:   	mov	0x21, %g3
	.word	0x86a0e001	! t0_kref+0x462c:   	subcc	%g3, 1, %g3
	.word	0x22800007	! t0_kref+0x4630:   	be,a	_kref+0x464c
	.word	0xe16e2010	! t0_kref+0x4634:   	prefetch	%i0 + 0x10, 16
	.word	0xa653400a	! t0_kref+0x4638:   	umul	%o5, %o2, %l3
	.word	0x21bffffc	! t0_kref+0x463c:   	fbn,a	_kref+0x462c
	.word	0x81db400c	! t0_kref+0x4640:   	flush	%o5 + %o4
	.word	0xef68a009	! t0_kref+0x4644:   	prefetch	%g2 + 9, 23
	.word	0xee20a038	! t0_kref+0x4648:   	st	%l7, [%g2 + 0x38]
	.word	0x8ba6c924	! t0_kref+0x464c:   	fmuls	%f27, %f4, %f5
	.word	0xaba00533	! t0_kref+0x4650:   	fsqrts	%f19, %f21
	.word	0x39480003	! t0_kref+0x4654:   	fbuge,a,pt	%fcc0, _kref+0x4660
	.word	0x929f2b9b	! t0_kref+0x4658:   	xorcc	%i4, 0xb9b, %o1
	.word	0xe850a032	! t0_kref+0x465c:   	ldsh	[%g2 + 0x32], %l4
	.word	0xb5a208da	! t0_kref+0x4660:   	fsubd	%f8, %f26, %f26
	.word	0xf8367fee	! t0_kref+0x4664:   	sth	%i4, [%i1 - 0x12]
	.word	0xd11fbfc0	! t0_kref+0x4668:   	ldd	[%fp - 0x40], %f8
	.word	0x9f30201a	! t0_kref+0x466c:   	srl	%g0, 0x1a, %o7
	.word	0xc5180019	! t0_kref+0x4670:   	ldd	[%g0 + %i1], %f2
	.word	0x81ae8a4a	! t0_kref+0x4674:   	fcmpd	%fcc0, %f26, %f10
	.word	0x9462c01c	! t0_kref+0x4678:   	subc	%o3, %i4, %o2
	.word	0x95a6094c	! t0_kref+0x467c:   	fmuld	%f24, %f12, %f10
	.word	0x3e480006	! t0_kref+0x4680:   	bvc,a,pt	%icc, _kref+0x4698
	.word	0x9fa018d6	! t0_kref+0x4684:   	fdtos	%f22, %f15
	.word	0x905b23c3	! t0_kref+0x4688:   	smul	%o4, 0x3c3, %o0
	.word	0xec08a033	! t0_kref+0x468c:   	ldub	[%g2 + 0x33], %l6
	.word	0xf7ee101b	! t0_kref+0x4690:   	prefetcha	%i0 + %i3, 27
	.word	0x9ba018d0	! t0_kref+0x4694:   	fdtos	%f16, %f13
	.word	0xb1a58925	! t0_kref+0x4698:   	fmuls	%f22, %f5, %f24
	.word	0xe3f6501c	! t0_kref+0x469c:   	casxa	[%i1]0x80, %i4, %l1
	.word	0x9b37001b	! t0_kref+0x46a0:   	srl	%i4, %i3, %o5
	.word	0x81ae8a31	! t0_kref+0x46a4:   	fcmps	%fcc0, %f26, %f17
	call	SYM(t0_subr1)
	.word	0xd8364000	! t0_kref+0x46ac:   	sth	%o4, [%i1]
	.word	0x81dc401c	! t0_kref+0x46b0:   	flush	%l1 + %i4
	.word	0xf8280018	! t0_kref+0x46b4:   	stb	%i4, [%g0 + %i0]
	.word	0x81dd6b08	! t0_kref+0x46b8:   	flush	%l5 + 0xb08
	.word	0xd03e4000	! t0_kref+0x46bc:   	std	%o0, [%i1]
	.word	0xd11fbe88	! t0_kref+0x46c0:   	ldd	[%fp - 0x178], %f8
	.word	0xa818000c	! t0_kref+0x46c4:   	xor	%g0, %o4, %l4
	.word	0xda00a020	! t0_kref+0x46c8:   	ld	[%g2 + 0x20], %o5
	.word	0x92023347	! t0_kref+0x46cc:   	add	%o0, -0xcb9, %o1
	.word	0xb5a40958	! t0_kref+0x46d0:   	fmuld	%f16, %f24, %f26
	.word	0x9da588d0	! t0_kref+0x46d4:   	fsubd	%f22, %f16, %f14
	sethi	%hi(2f), %o7
	.word	0xe40be318	! t0_kref+0x46dc:   	ldub	[%o7 + 0x318], %l2
	.word	0xa41ca00c	! t0_kref+0x46e0:   	xor	%l2, 0xc, %l2
	.word	0xe42be318	! t0_kref+0x46e4:   	stb	%l2, [%o7 + 0x318]
	.word	0x81dbe318	! t0_kref+0x46e8:   	flush	%o7 + 0x318
	.word	0x99a000ab	! t0_kref+0x46ec:   	fnegs	%f11, %f12
	.word	0xaf37201e	! t0_kref+0x46f0:   	srl	%i4, 0x1e, %l7
	.word	0x2f800003	! t0_kref+0x46f4:   	fbu,a	_kref+0x4700
	.word	0x9ee7001a	! t0_kref+0x46f8:   	subccc	%i4, %i2, %o7
	.word	0x9e636a8a	! t0_kref+0x46fc:   	subc	%o5, 0xa8a, %o7
	.word	0xe3b8a040	! t0_kref+0x4700:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xeb00a020	! t0_kref+0x4704:   	ld	[%g2 + 0x20], %f21
	.word	0x96223327	! t0_kref+0x4708:   	sub	%o0, -0xcd9, %o3
	.word	0xaf60000a	! t0_kref+0x470c:   	movn	%fcc0, %o2, %l7
	.word	0x32800006	! t0_kref+0x4710:   	bne,a	_kref+0x4728
	.word	0x9522001b	! t0_kref+0x4714:   	mulscc	%o0, %i3, %o2
2:	.word	0x9a5ac009	! t0_kref+0x4718:   	smul	%o3, %o1, %o5
	.word	0xea8e1000	! t0_kref+0x471c:   	lduba	[%i0]0x80, %l5
	.word	0xaac5e314	! t0_kref+0x4720:   	addccc	%l7, 0x314, %l5
	.word	0xecfe1000	! t0_kref+0x4724:   	swapa	[%i0]0x80, %l6
	.word	0xb610200e	! t0_kref+0x4728:   	mov	0xe, %i3
	.word	0xec1e2018	! t0_kref+0x472c:   	ldd	[%i0 + 0x18], %l6
	.word	0x912b2014	! t0_kref+0x4730:   	sll	%o4, 0x14, %o0
	.word	0x81aa4a35	! t0_kref+0x4734:   	fcmps	%fcc0, %f9, %f21
	.word	0xd6a71018	! t0_kref+0x4738:   	sta	%o3, [%i4 + %i0]0x80
	.word	0x93a000b7	! t0_kref+0x473c:   	fnegs	%f23, %f9
	.word	0xa60dc00d	! t0_kref+0x4740:   	and	%l7, %o5, %l3
	.word	0x151a8c4f	! t0_kref+0x4744:   	sethi	%hi(0x6a313c00), %o2
	.word	0xa6503d21	! t0_kref+0x4748:   	umul	%g0, -0x2df, %l3
	.word	0xac66800a	! t0_kref+0x474c:   	subc	%i2, %o2, %l6
	.word	0xa65b637d	! t0_kref+0x4750:   	smul	%o5, 0x37d, %l3
	.word	0xaba01a33	! t0_kref+0x4754:   	fstoi	%f19, %f21
	.word	0xaeaec009	! t0_kref+0x4758:   	andncc	%i3, %o1, %l7
	.word	0xb3a01885	! t0_kref+0x475c:   	fitos	%f5, %f25
	.word	0x98da6bbe	! t0_kref+0x4760:   	smulcc	%o1, 0xbbe, %o4
	.word	0xafa28823	! t0_kref+0x4764:   	fadds	%f10, %f3, %f23
	.word	0xaeda249a	! t0_kref+0x4768:   	smulcc	%o0, 0x49a, %l7
	.word	0xd06e2000	! t0_kref+0x476c:   	ldstub	[%i0], %o0
	.word	0xaba00037	! t0_kref+0x4770:   	fmovs	%f23, %f21
	.word	0xf828a027	! t0_kref+0x4774:   	stb	%i4, [%g2 + 0x27]
	.word	0xf11e7ff0	! t0_kref+0x4778:   	ldd	[%i1 - 0x10], %f24
	.word	0x81ae8a42	! t0_kref+0x477c:   	fcmpd	%fcc0, %f26, %f2
	.word	0xaa02000c	! t0_kref+0x4780:   	add	%o0, %o4, %l5
	.word	0xaba01a37	! t0_kref+0x4784:   	fstoi	%f23, %f21
	.word	0xa8637d79	! t0_kref+0x4788:   	subc	%o5, -0x287, %l4
	.word	0x9425c01a	! t0_kref+0x478c:   	sub	%l7, %i2, %o2
	.word	0x9a7ac00a	! t0_kref+0x4790:   	sdiv	%o3, %o2, %o5
	.word	0x91a00023	! t0_kref+0x4794:   	fmovs	%f3, %f8
	.word	0x8610201b	! t0_kref+0x4798:   	mov	0x1b, %g3
	.word	0x86a0e001	! t0_kref+0x479c:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x47a0:   	be,a	_kref+0x47e0
	.word	0xae8aa6eb	! t0_kref+0x47a4:   	andcc	%o2, 0x6eb, %l7
	.word	0x90122163	! t0_kref+0x47a8:   	or	%o0, 0x163, %o0
	.word	0xe848a01d	! t0_kref+0x47ac:   	ldsb	[%g2 + 0x1d], %l4
	.word	0x91a109c0	! t0_kref+0x47b0:   	fdivd	%f4, %f0, %f8
	.word	0xd240a014	! t0_kref+0x47b4:   	ldsw	[%g2 + 0x14], %o1
	.word	0xee48a00f	! t0_kref+0x47b8:   	ldsb	[%g2 + 0xf], %l7
	.word	0x9443001a	! t0_kref+0x47bc:   	addc	%o4, %i2, %o2
	.word	0xd620a02c	! t0_kref+0x47c0:   	st	%o3, [%g2 + 0x2c]
	.word	0x81ae8a2c	! t0_kref+0x47c4:   	fcmps	%fcc0, %f26, %f12
	.word	0x8ba10920	! t0_kref+0x47c8:   	fmuls	%f4, %f0, %f5
	.word	0x9ba3c8b1	! t0_kref+0x47cc:   	fsubs	%f15, %f17, %f13
	.word	0x9ea36fef	! t0_kref+0x47d0:   	subcc	%o5, 0xfef, %o7
	.word	0x99a01a28	! t0_kref+0x47d4:   	fstoi	%f8, %f12
	.word	0x9ada8008	! t0_kref+0x47d8:   	smulcc	%o2, %o0, %o5
	.word	0xe610a014	! t0_kref+0x47dc:   	lduh	[%g2 + 0x14], %l3
	.word	0x953ee007	! t0_kref+0x47e0:   	sra	%i3, 0x7, %o2
	.word	0x941af3e3	! t0_kref+0x47e4:   	xor	%o3, -0xc1d, %o2
	.word	0x9e02e069	! t0_kref+0x47e8:   	add	%o3, 0x69, %o7
	.word	0xe648a024	! t0_kref+0x47ec:   	ldsb	[%g2 + 0x24], %l3
	.word	0xb7a00534	! t0_kref+0x47f0:   	fsqrts	%f20, %f27
	.word	0xa6feb994	! t0_kref+0x47f4:   	sdivcc	%i2, -0x66c, %l3
	.word	0x81a88aa8	! t0_kref+0x47f8:   	fcmpes	%fcc0, %f2, %f8
	.word	0xd020a010	! t0_kref+0x47fc:   	st	%o0, [%g2 + 0x10]
	.word	0xa9a0053b	! t0_kref+0x4800:   	fsqrts	%f27, %f20
	.word	0xacf26f2b	! t0_kref+0x4804:   	udivcc	%o1, 0xf2b, %l6
	.word	0x947eb148	! t0_kref+0x4808:   	sdiv	%i2, -0xeb8, %o2
	.word	0xa5a01890	! t0_kref+0x480c:   	fitos	%f16, %f18
	.word	0x81a00523	! t0_kref+0x4810:   	fsqrts	%f3, %f0
	.word	0x8fa488a0	! t0_kref+0x4814:   	fsubs	%f18, %f0, %f7
	.word	0xaef2401c	! t0_kref+0x4818:   	udivcc	%o1, %i4, %l7
	.word	0x28480005	! t0_kref+0x481c:   	bleu,a,pt	%icc, _kref+0x4830
	.word	0xaeda3fd4	! t0_kref+0x4820:   	smulcc	%o0, -0x2c, %l7
	.word	0xb3a0002a	! t0_kref+0x4824:   	fmovs	%f10, %f25
	.word	0xee16600c	! t0_kref+0x4828:   	lduh	[%i1 + 0xc], %l7
	.word	0xd700a030	! t0_kref+0x482c:   	ld	[%g2 + 0x30], %f11
	.word	0xd2162014	! t0_kref+0x4830:   	lduh	[%i0 + 0x14], %o1
	.word	0x35800002	! t0_kref+0x4834:   	fbue,a	_kref+0x483c
	.word	0x9da48830	! t0_kref+0x4838:   	fadds	%f18, %f16, %f14
	.word	0xa602e0d7	! t0_kref+0x483c:   	add	%o3, 0xd7, %l3
	.word	0x90432c57	! t0_kref+0x4840:   	addc	%o4, 0xc57, %o0
	.word	0xf6ae501a	! t0_kref+0x4844:   	stba	%i3, [%i1 + %i2]0x80
	.word	0x9fc00004	! t0_kref+0x4848:   	call	%g0 + %g4
	.word	0xf628a03f	! t0_kref+0x484c:   	stb	%i3, [%g2 + 0x3f]
	.word	0x39480004	! t0_kref+0x4850:   	fbuge,a,pt	%fcc0, _kref+0x4860
	.word	0x81db000a	! t0_kref+0x4854:   	flush	%o4 + %o2
	.word	0x9ba2c8ab	! t0_kref+0x4858:   	fsubs	%f11, %f11, %f13
	.word	0xb1a00528	! t0_kref+0x485c:   	fsqrts	%f8, %f24
	.word	0x9fa00530	! t0_kref+0x4860:   	fsqrts	%f16, %f15
	.word	0x3e800001	! t0_kref+0x4864:   	bvc,a	_kref+0x4868
	.word	0x96c28000	! t0_kref+0x4868:   	addccc	%o2, %g0, %o3
	.word	0x9f400000	! t0_kref+0x486c:   	mov	%y, %o7
	call	SYM(t0_subr2)
	.word	0xd2871018	! t0_kref+0x4874:   	lda	[%i4 + %i0]0x80, %o1
	.word	0x9fc00004	! t0_kref+0x4878:   	call	%g0 + %g4
	.word	0xa06232ee	! t0_kref+0x487c:   	subc	%o0, -0xd12, %l0
	.word	0x93282012	! t0_kref+0x4880:   	sll	%g0, 0x12, %o1
	.word	0x81a84a2b	! t0_kref+0x4884:   	fcmps	%fcc0, %f1, %f11
	.word	0xae1a001b	! t0_kref+0x4888:   	xor	%o0, %i3, %l7
	.word	0x8fa01a5a	! t0_kref+0x488c:   	fdtoi	%f26, %f7
	.word	0xeb68a00a	! t0_kref+0x4890:   	prefetch	%g2 + 0xa, 21
	.word	0xb1a208b4	! t0_kref+0x4894:   	fsubs	%f8, %f20, %f24
	.word	0x3b800007	! t0_kref+0x4898:   	fble,a	_kref+0x48b4
	.word	0xb5a0053b	! t0_kref+0x489c:   	fsqrts	%f27, %f26
	.word	0xee364000	! t0_kref+0x48a0:   	sth	%l7, [%i1]
	.word	0x85a10d2e	! t0_kref+0x48a4:   	fsmuld	%f4, %f14, %f2
	.word	0x9ba01a25	! t0_kref+0x48a8:   	fstoi	%f5, %f13
	call	SYM(t0_subr0)
	.word	0x992a801c	! t0_kref+0x48b0:   	sll	%o2, %i4, %o4
	.word	0xafa6c8a3	! t0_kref+0x48b4:   	fsubs	%f27, %f3, %f23
	.word	0xb1a01897	! t0_kref+0x48b8:   	fitos	%f23, %f24
	.word	0xaa9abd3c	! t0_kref+0x48bc:   	xorcc	%o2, -0x2c4, %l5
	.word	0x81ab4ab0	! t0_kref+0x48c0:   	fcmpes	%fcc0, %f13, %f16
	.word	0xf320a01c	! t0_kref+0x48c4:   	st	%f25, [%g2 + 0x1c]
	.word	0xada58942	! t0_kref+0x48c8:   	fmuld	%f22, %f2, %f22
	.word	0x85a149b1	! t0_kref+0x48cc:   	fdivs	%f5, %f17, %f2
	.word	0x2f480003	! t0_kref+0x48d0:   	fbu,a,pt	%fcc0, _kref+0x48dc
	.word	0xaa1f000c	! t0_kref+0x48d4:   	xor	%i4, %o4, %l5
	.word	0xe3b8a040	! t0_kref+0x48d8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9a55c008	! t0_kref+0x48dc:   	umul	%l7, %o0, %o5
	.word	0xda96d018	! t0_kref+0x48e0:   	lduha	[%i3 + %i0]0x80, %o5
	.word	0x89a108c6	! t0_kref+0x48e4:   	fsubd	%f4, %f6, %f4
	call	SYM(t0_subr0)
	.word	0x99400000	! t0_kref+0x48ec:   	mov	%y, %o4
	.word	0xd0871019	! t0_kref+0x48f0:   	lda	[%i4 + %i1]0x80, %o0
	.word	0x9edaf824	! t0_kref+0x48f4:   	smulcc	%o3, -0x7dc, %o7
	.word	0xd1981018	! t0_kref+0x48f8:   	ldda	[%g0 + %i0]0x80, %f8
	.word	0x153df94d	! t0_kref+0x48fc:   	sethi	%hi(0xf7e53400), %o2
	.word	0xa3a408a3	! t0_kref+0x4900:   	fsubs	%f16, %f3, %f17
	.word	0x34480003	! t0_kref+0x4904:   	bg,a,pt	%icc, _kref+0x4910
	.word	0xae634017	! t0_kref+0x4908:   	subc	%o5, %l7, %l7
	.word	0xa9a389cc	! t0_kref+0x490c:   	fdivd	%f14, %f12, %f20
	.word	0xd05e6010	! t0_kref+0x4910:   	ldx	[%i1 + 0x10], %o0
	.word	0x81dd760f	! t0_kref+0x4914:   	flush	%l5 - 0x9f1
	sethi	%hi(2f), %o7
	.word	0xe40be14c	! t0_kref+0x491c:   	ldub	[%o7 + 0x14c], %l2
	.word	0xa41ca00c	! t0_kref+0x4920:   	xor	%l2, 0xc, %l2
	.word	0xe42be14c	! t0_kref+0x4924:   	stb	%l2, [%o7 + 0x14c]
	.word	0x81dbe14c	! t0_kref+0x4928:   	flush	%o7 + 0x14c
	.word	0xe3b8a040	! t0_kref+0x492c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x95a188c8	! t0_kref+0x4930:   	fsubd	%f6, %f8, %f10
	.word	0xada64d2e	! t0_kref+0x4934:   	fsmuld	%f25, %f14, %f22
	.word	0xc16e3fe8	! t0_kref+0x4938:   	prefetch	%i0 - 0x18, 0
	.word	0x33800005	! t0_kref+0x493c:   	fbe,a	_kref+0x4950
	.word	0xd11fbe38	! t0_kref+0x4940:   	ldd	[%fp - 0x1c8], %f8
	.word	0x21800007	! t0_kref+0x4944:   	fbn,a	_kref+0x4960
	.word	0xb3a000b3	! t0_kref+0x4948:   	fnegs	%f19, %f25
2:	.word	0xee06401c	! t0_kref+0x494c:   	ld	[%i1 + %i4], %l7
	.word	0xa6aa000a	! t0_kref+0x4950:   	andncc	%o0, %o2, %l3
	.word	0xd048a016	! t0_kref+0x4954:   	ldsb	[%g2 + 0x16], %o0
	.word	0x9a07000a	! t0_kref+0x4958:   	add	%i4, %o2, %o5
	.word	0x2a800007	! t0_kref+0x495c:   	bcs,a	_kref+0x4978
	.word	0x94e20000	! t0_kref+0x4960:   	subccc	%o0, %g0, %o2
	.word	0xf1ee101b	! t0_kref+0x4964:   	prefetcha	%i0 + %i3, 24
	.word	0x33800003	! t0_kref+0x4968:   	fbe,a	_kref+0x4974
	.word	0x9e42e025	! t0_kref+0x496c:   	addc	%o3, 0x25, %o7
	.word	0xd4f01018	! t0_kref+0x4970:   	stxa	%o2, [%g0 + %i0]0x80
	.word	0x36800002	! t0_kref+0x4974:   	bge,a	_kref+0x497c
	.word	0xd230a02c	! t0_kref+0x4978:   	sth	%o1, [%g2 + 0x2c]
	.word	0xc93e6000	! t0_kref+0x497c:   	std	%f4, [%i1]
	.word	0xb1a188b0	! t0_kref+0x4980:   	fsubs	%f6, %f16, %f24
	.word	0xac43400b	! t0_kref+0x4984:   	addc	%o5, %o3, %l6
	.word	0x81dfbcd0	! t0_kref+0x4988:   	flush	%fp - 0x330
	.word	0x9ab2faca	! t0_kref+0x498c:   	orncc	%o3, -0x536, %o5
	.word	0xda50a01c	! t0_kref+0x4990:   	ldsh	[%g2 + 0x1c], %o5
	.word	0x81a98ab1	! t0_kref+0x4994:   	fcmpes	%fcc0, %f6, %f17
	.word	0xac17000d	! t0_kref+0x4998:   	or	%i4, %o5, %l6
	.word	0x34800007	! t0_kref+0x499c:   	bg,a	_kref+0x49b8
	.word	0xe11fbdf8	! t0_kref+0x49a0:   	ldd	[%fp - 0x208], %f16
	.word	0x8da3c82d	! t0_kref+0x49a4:   	fadds	%f15, %f13, %f6
	.word	0xe3b8a040	! t0_kref+0x49a8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x81a489ba	! t0_kref+0x49ac:   	fdivs	%f18, %f26, %f0
	.word	0x9da000b5	! t0_kref+0x49b0:   	fnegs	%f21, %f14
	.word	0xd228a010	! t0_kref+0x49b4:   	stb	%o1, [%g2 + 0x10]
	.word	0x99a08921	! t0_kref+0x49b8:   	fmuls	%f2, %f1, %f12
	.word	0xaadec01b	! t0_kref+0x49bc:   	smulcc	%i3, %i3, %l5
	.word	0xaa3dc01b	! t0_kref+0x49c0:   	xnor	%l7, %i3, %l5
	.word	0xae97001c	! t0_kref+0x49c4:   	orcc	%i4, %i4, %l7
	.word	0xec3e2010	! t0_kref+0x49c8:   	std	%l6, [%i0 + 0x10]
	.word	0x90830009	! t0_kref+0x49cc:   	addcc	%o4, %o1, %o0
	.word	0xdd1fbfd0	! t0_kref+0x49d0:   	ldd	[%fp - 0x30], %f14
	.word	0x81ad0a58	! t0_kref+0x49d4:   	fcmpd	%fcc0, %f20, %f24
	.word	0xada28852	! t0_kref+0x49d8:   	faddd	%f10, %f18, %f22
	.word	0x81dec00c	! t0_kref+0x49dc:   	flush	%i3 + %o4
	.word	0x968b000d	! t0_kref+0x49e0:   	andcc	%o4, %o5, %o3
	.word	0x858233ec	! t0_kref+0x49e4:   	wr	%o0, 0xfffff3ec, %ccr
	.word	0xda20a010	! t0_kref+0x49e8:   	st	%o5, [%g2 + 0x10]
	.word	0xdd20a03c	! t0_kref+0x49ec:   	st	%f14, [%g2 + 0x3c]
	.word	0x33800007	! t0_kref+0x49f0:   	fbe,a	_kref+0x4a0c
	.word	0xc020a01c	! t0_kref+0x49f4:   	clr	[%g2 + 0x1c]
	.word	0x3d800003	! t0_kref+0x49f8:   	fbule,a	_kref+0x4a04
	.word	0xa806e4d0	! t0_kref+0x49fc:   	add	%i3, 0x4d0, %l4
	.word	0x968f3646	! t0_kref+0x4a00:   	andcc	%i4, -0x9ba, %o3
	.word	0xb5a01040	! t0_kref+0x4a04:   	fdtox	%f0, %f26
	.word	0xada54828	! t0_kref+0x4a08:   	fadds	%f21, %f8, %f22
	.word	0xc11fbfb8	! t0_kref+0x4a0c:   	ldd	[%fp - 0x48], %f0
	.word	0xa732400a	! t0_kref+0x4a10:   	srl	%o1, %o2, %l3
	.word	0x91a000c6	! t0_kref+0x4a14:   	fnegd	%f6, %f8
	.word	0xf830a00e	! t0_kref+0x4a18:   	sth	%i4, [%g2 + 0xe]
	.word	0x87a01898	! t0_kref+0x4a1c:   	fitos	%f24, %f3
	.word	0xd11fbc18	! t0_kref+0x4a20:   	ldd	[%fp - 0x3e8], %f8
	.word	0xde10a02a	! t0_kref+0x4a24:   	lduh	[%g2 + 0x2a], %o7
	.word	0x96c6a154	! t0_kref+0x4a28:   	addccc	%i2, 0x154, %o3
	.word	0xeb68a004	! t0_kref+0x4a2c:   	prefetch	%g2 + 4, 21
	.word	0x29800001	! t0_kref+0x4a30:   	fbl,a	_kref+0x4a34
	.word	0xf96e7fe0	! t0_kref+0x4a34:   	prefetch	%i1 - 0x20, 28
	.word	0x23800008	! t0_kref+0x4a38:   	fbne,a	_kref+0x4a58
	.word	0x8da01042	! t0_kref+0x4a3c:   	fdtox	%f2, %f6
	.word	0xa6b68017	! t0_kref+0x4a40:   	orncc	%i2, %l7, %l3
	.word	0xc51fbcc0	! t0_kref+0x4a44:   	ldd	[%fp - 0x340], %f2
	.word	0xf8767fe0	! t0_kref+0x4a48:   	stx	%i4, [%i1 - 0x20]
	.word	0x9e3ec00d	! t0_kref+0x4a4c:   	xnor	%i3, %o5, %o7
	.word	0x31800001	! t0_kref+0x4a50:   	fba,a	_kref+0x4a54
	.word	0x9016801b	! t0_kref+0x4a54:   	or	%i2, %i3, %o0
	.word	0xaa880008	! t0_kref+0x4a58:   	andcc	%g0, %o0, %l5
	.word	0x90673fbb	! t0_kref+0x4a5c:   	subc	%i4, -0x45, %o0
	.word	0x9afb7a0a	! t0_kref+0x4a60:   	sdivcc	%o5, -0x5f6, %o5
	.word	0x39480007	! t0_kref+0x4a64:   	fbuge,a,pt	%fcc0, _kref+0x4a80
	.word	0x9422c017	! t0_kref+0x4a68:   	sub	%o3, %l7, %o2
	.word	0xffee501a	! t0_kref+0x4a6c:   	prefetcha	%i1 + %i2, 31
	.word	0x8fa309a6	! t0_kref+0x4a70:   	fdivs	%f12, %f6, %f7
	.word	0x3f480004	! t0_kref+0x4a74:   	fbo,a,pt	%fcc0, _kref+0x4a84
	.word	0xedee501b	! t0_kref+0x4a78:   	prefetcha	%i1 + %i3, 22
	.word	0x31480005	! t0_kref+0x4a7c:   	fba,a,pt	%fcc0, _kref+0x4a90
	.word	0x9a53400c	! t0_kref+0x4a80:   	umul	%o5, %o4, %o5
	.word	0xd99e5a5d	! t0_kref+0x4a84:   	ldda	[%i1 + %i5]0xd2, %f12
	.word	0xacb27db4	! t0_kref+0x4a88:   	orncc	%o1, -0x24c, %l6
	.word	0xd040a010	! t0_kref+0x4a8c:   	ldsw	[%g2 + 0x10], %o0
	.word	0xae52b839	! t0_kref+0x4a90:   	umul	%o2, -0x7c7, %l7
	.word	0x99a08956	! t0_kref+0x4a94:   	fmuld	%f2, %f22, %f12
	.word	0xd500a014	! t0_kref+0x4a98:   	ld	[%g2 + 0x14], %f10
	.word	0x81dec017	! t0_kref+0x4a9c:   	flush	%i3 + %l7
	.word	0xec00a014	! t0_kref+0x4aa0:   	ld	[%g2 + 0x14], %l6
	.word	0x9a933801	! t0_kref+0x4aa4:   	orcc	%o4, -0x7ff, %o5
	.word	0x980b400b	! t0_kref+0x4aa8:   	and	%o5, %o3, %o4
	sethi	%hi(2f), %o7
	.word	0xe40be2c8	! t0_kref+0x4ab0:   	ldub	[%o7 + 0x2c8], %l2
	.word	0xa41ca00c	! t0_kref+0x4ab4:   	xor	%l2, 0xc, %l2
	.word	0xe42be2c8	! t0_kref+0x4ab8:   	stb	%l2, [%o7 + 0x2c8]
	.word	0x81dbe2c8	! t0_kref+0x4abc:   	flush	%o7 + 0x2c8
	.word	0x85a0013b	! t0_kref+0x4ac0:   	fabss	%f27, %f2
	.word	0xa85a000c	! t0_kref+0x4ac4:   	smul	%o0, %o4, %l4
2:	.word	0x92230017	! t0_kref+0x4ac8:   	sub	%o4, %l7, %o1
	.word	0xee48a00f	! t0_kref+0x4acc:   	ldsb	[%g2 + 0xf], %l7
	.word	0x2f480008	! t0_kref+0x4ad0:   	fbu,a,pt	%fcc0, _kref+0x4af0
	.word	0x2f09d942	! t0_kref+0x4ad4:   	sethi	%hi(0x27650800), %l7
	.word	0xae337dce	! t0_kref+0x4ad8:   	orn	%o5, -0x232, %l7
	.word	0x92a371a0	! t0_kref+0x4adc:   	subcc	%o5, -0xe60, %o1
	.word	0xec1e3ff0	! t0_kref+0x4ae0:   	ldd	[%i0 - 0x10], %l6
	.word	0xa6930000	! t0_kref+0x4ae4:   	orcc	%o4, %g0, %l3
	.word	0x94fb001b	! t0_kref+0x4ae8:   	sdivcc	%o4, %i3, %o2
	.word	0x9a25c00d	! t0_kref+0x4aec:   	sub	%l7, %o5, %o5
	.word	0xa6fdc008	! t0_kref+0x4af0:   	sdivcc	%l7, %o0, %l3
	.word	0xedf6101a	! t0_kref+0x4af4:   	casxa	[%i0]0x80, %i2, %l6
	.word	0xea16201c	! t0_kref+0x4af8:   	lduh	[%i0 + 0x1c], %l5
	.word	0xf828a014	! t0_kref+0x4afc:   	stb	%i4, [%g2 + 0x14]
	.word	0xde16001b	! t0_kref+0x4b00:   	lduh	[%i0 + %i3], %o7
	.word	0x3b800002	! t0_kref+0x4b04:   	fble,a	_kref+0x4b0c
	.word	0x9066aa26	! t0_kref+0x4b08:   	subc	%i2, 0xa26, %o0
	.word	0xb4103ffc	! t0_kref+0x4b0c:   	mov	0xfffffffc, %i2
	.word	0x93a00138	! t0_kref+0x4b10:   	fabss	%f24, %f9
	.word	0x3b800001	! t0_kref+0x4b14:   	fble,a	_kref+0x4b18
	.word	0xafa000b2	! t0_kref+0x4b18:   	fnegs	%f18, %f23
	.word	0x81adca3b	! t0_kref+0x4b1c:   	fcmps	%fcc0, %f23, %f27
	.word	0x9300000c	! t0_kref+0x4b20:   	taddcc	%g0, %o4, %o1
	.word	0x93703982	! t0_kref+0x4b24:   	popc	-0x67e, %o1
	.word	0x9e8831ac	! t0_kref+0x4b28:   	andcc	%g0, -0xe54, %o7
	.word	0xc02e3ff1	! t0_kref+0x4b2c:   	clrb	[%i0 - 0xf]
	.word	0xada00534	! t0_kref+0x4b30:   	fsqrts	%f20, %f22
	.word	0xb1a00528	! t0_kref+0x4b34:   	fsqrts	%f8, %f24
	.word	0xe808a00e	! t0_kref+0x4b38:   	ldub	[%g2 + 0xe], %l4
	.word	0xa1a000ab	! t0_kref+0x4b3c:   	fnegs	%f11, %f16
	.word	0x8143e040	! t0_kref+0x4b40:   	membar	0x40
	.word	0xb1a308c0	! t0_kref+0x4b44:   	fsubd	%f12, %f0, %f24
	.word	0xfdee101d	! t0_kref+0x4b48:   	prefetcha	%i0 + %i5, 30
	.word	0x9a830017	! t0_kref+0x4b4c:   	addcc	%o4, %l7, %o5
	.word	0x9e5ab674	! t0_kref+0x4b50:   	smul	%o2, -0x98c, %o7
	.word	0x9a1aa804	! t0_kref+0x4b54:   	xor	%o2, 0x804, %o5
	.word	0xa9a00533	! t0_kref+0x4b58:   	fsqrts	%f19, %f20
	.word	0x99a50d30	! t0_kref+0x4b5c:   	fsmuld	%f20, %f16, %f12
	.word	0xb5a58952	! t0_kref+0x4b60:   	fmuld	%f22, %f18, %f26
	.word	0xeea81018	! t0_kref+0x4b64:   	stba	%l7, [%g0 + %i0]0x80
	.word	0xe51fbef8	! t0_kref+0x4b68:   	ldd	[%fp - 0x108], %f18
	call	SYM(t0_subr2)
	.word	0xd11e2000	! t0_kref+0x4b70:   	ldd	[%i0], %f8
	.word	0xaea6a0f7	! t0_kref+0x4b74:   	subcc	%i2, 0xf7, %l7
	.word	0xaa56c008	! t0_kref+0x4b78:   	umul	%i3, %o0, %l5
	.word	0xec08a039	! t0_kref+0x4b7c:   	ldub	[%g2 + 0x39], %l6
	.word	0x8da308c0	! t0_kref+0x4b80:   	fsubd	%f12, %f0, %f6
	.word	0xb1a01a24	! t0_kref+0x4b84:   	fstoi	%f4, %f24
	.word	0xac82c009	! t0_kref+0x4b88:   	addcc	%o3, %o1, %l6
	.word	0x9ba01094	! t0_kref+0x4b8c:   	fxtos	%f20, %f13
	.word	0xcb270019	! t0_kref+0x4b90:   	st	%f5, [%i4 + %i1]
	.word	0xec50a036	! t0_kref+0x4b94:   	ldsh	[%g2 + 0x36], %l6
	.word	0xd500a020	! t0_kref+0x4b98:   	ld	[%g2 + 0x20], %f10
	.word	0x85a54d22	! t0_kref+0x4b9c:   	fsmuld	%f21, %f2, %f2
	.word	0xec00a034	! t0_kref+0x4ba0:   	ld	[%g2 + 0x34], %l6
	.word	0x3b800006	! t0_kref+0x4ba4:   	fble,a	_kref+0x4bbc
	.word	0x9a5a2050	! t0_kref+0x4ba8:   	smul	%o0, 0x50, %o5
	.word	0xae35fab8	! t0_kref+0x4bac:   	orn	%l7, -0x548, %l7
	.word	0x91a088d0	! t0_kref+0x4bb0:   	fsubd	%f2, %f16, %f8
	.word	0x9a92400d	! t0_kref+0x4bb4:   	orcc	%o1, %o5, %o5
	.word	0xc5ee100b	! t0_kref+0x4bb8:   	prefetcha	%i0 + %o3, 2
	.word	0xd64e201f	! t0_kref+0x4bbc:   	ldsb	[%i0 + 0x1f], %o3
	.word	0xd026001c	! t0_kref+0x4bc0:   	st	%o0, [%i0 + %i4]
	.word	0xa9a01a21	! t0_kref+0x4bc4:   	fstoi	%f1, %f20
	.word	0x9607001c	! t0_kref+0x4bc8:   	add	%i4, %i4, %o3
	.word	0xd82e3fe0	! t0_kref+0x4bcc:   	stb	%o4, [%i0 - 0x20]
	.word	0xf42e001a	! t0_kref+0x4bd0:   	stb	%i2, [%i0 + %i2]
	.word	0x24800001	! t0_kref+0x4bd4:   	ble,a	_kref+0x4bd8
	.word	0xcd1fbe40	! t0_kref+0x4bd8:   	ldd	[%fp - 0x1c0], %f6
	.word	0x9422ea76	! t0_kref+0x4bdc:   	sub	%o3, 0xa76, %o2
	.word	0x95a24d32	! t0_kref+0x4be0:   	fsmuld	%f9, %f18, %f10
	.word	0x83a00535	! t0_kref+0x4be4:   	fsqrts	%f21, %f1
	.word	0xda40a014	! t0_kref+0x4be8:   	ldsw	[%g2 + 0x14], %o5
	.word	0x26480006	! t0_kref+0x4bec:   	bl,a,pt	%icc, _kref+0x4c04
	.word	0xd228a007	! t0_kref+0x4bf0:   	stb	%o1, [%g2 + 7]
	.word	0xb5a58d38	! t0_kref+0x4bf4:   	fsmuld	%f22, %f24, %f26
	.word	0xae5b000c	! t0_kref+0x4bf8:   	smul	%o4, %o4, %l7
	.word	0x9802801a	! t0_kref+0x4bfc:   	add	%o2, %i2, %o4
	.word	0xb7a0053b	! t0_kref+0x4c00:   	fsqrts	%f27, %f27
	.word	0x91a01928	! t0_kref+0x4c04:   	fstod	%f8, %f8
	.word	0x9b63e2c3	! t0_kref+0x4c08:   	movo	%fcc0, 0x2c3, %o5
	.word	0xada98042	! t0_kref+0x4c0c:   	fmovdg	%fcc0, %f2, %f22
	.word	0x9eaf28e7	! t0_kref+0x4c10:   	andncc	%i4, 0x8e7, %o7
	.word	0x9242400a	! t0_kref+0x4c14:   	addc	%o1, %o2, %o1
	.word	0x9da00033	! t0_kref+0x4c18:   	fmovs	%f19, %f14
	.word	0x3d800005	! t0_kref+0x4c1c:   	fbule,a	_kref+0x4c30
	.word	0x965aec3e	! t0_kref+0x4c20:   	smul	%o3, 0xc3e, %o3
	.word	0x36480005	! t0_kref+0x4c24:   	bge,a,pt	%icc, _kref+0x4c38
	.word	0x29022c10	! t0_kref+0x4c28:   	sethi	%hi(0x8b04000), %l4
	.word	0xd8d01019	! t0_kref+0x4c2c:   	ldsha	[%g0 + %i1]0x80, %o4
	.word	0xc11fbd68	! t0_kref+0x4c30:   	ldd	[%fp - 0x298], %f0
	.word	0xc06e2008	! t0_kref+0x4c34:   	ldstub	[%i0 + 8], %g0
	.word	0xde466010	! t0_kref+0x4c38:   	ldsw	[%i1 + 0x10], %o7
	.word	0xa6634017	! t0_kref+0x4c3c:   	subc	%o5, %l7, %l3
	.word	0x9e9e800d	! t0_kref+0x4c40:   	xorcc	%i2, %o5, %o7
	.word	0x81da0011	! t0_kref+0x4c44:   	flush	%o0 + %l1
	.word	0x9163001c	! t0_kref+0x4c48:   	movuge	%fcc0, %i4, %o0
	.word	0x86102012	! t0_kref+0x4c4c:   	mov	0x12, %g3
	.word	0x86a0e001	! t0_kref+0x4c50:   	subcc	%g3, 1, %g3
	.word	0x22800019	! t0_kref+0x4c54:   	be,a	_kref+0x4cb8
	.word	0xd43e3fe8	! t0_kref+0x4c58:   	std	%o2, [%i0 - 0x18]
	.word	0x314ffffd	! t0_kref+0x4c5c:   	fba,a,pt	%fcc0, _kref+0x4c50
	.word	0xa72a2000	! t0_kref+0x4c60:   	sll	%o0, 0x0, %l3
	.word	0xaf703bda	! t0_kref+0x4c64:   	popc	-0x426, %l7
	.word	0x95a008c6	! t0_kref+0x4c68:   	fsubd	%f0, %f6, %f10
	.word	0xd44e7ff4	! t0_kref+0x4c6c:   	ldsb	[%i1 - 0xc], %o2
	.word	0x22800008	! t0_kref+0x4c70:   	be,a	_kref+0x4c90
	.word	0xe84e600d	! t0_kref+0x4c74:   	ldsb	[%i1 + 0xd], %l4
	.word	0x941a400a	! t0_kref+0x4c78:   	xor	%o1, %o2, %o2
	.word	0x83a18830	! t0_kref+0x4c7c:   	fadds	%f6, %f16, %f1
	.word	0x96726f7d	! t0_kref+0x4c80:   	udiv	%o1, 0xf7d, %o3
	.word	0x9f400000	! t0_kref+0x4c84:   	mov	%y, %o7
	.word	0x89a01a4c	! t0_kref+0x4c88:   	fdtoi	%f12, %f4
	.word	0x83a0052e	! t0_kref+0x4c8c:   	fsqrts	%f14, %f1
	.word	0xdd00a03c	! t0_kref+0x4c90:   	ld	[%g2 + 0x3c], %f14
	.word	0x37800002	! t0_kref+0x4c94:   	fbge,a	_kref+0x4c9c
	.word	0x9e1337ac	! t0_kref+0x4c98:   	or	%o4, -0x854, %o7
	.word	0xae534009	! t0_kref+0x4c9c:   	umul	%o5, %o1, %l7
	.word	0x9e223375	! t0_kref+0x4ca0:   	sub	%o0, -0xc8b, %o7
	.word	0x81a408d8	! t0_kref+0x4ca4:   	fsubd	%f16, %f24, %f0
	.word	0x9e12c000	! t0_kref+0x4ca8:   	or	%o3, %g0, %o7
	.word	0x91a01932	! t0_kref+0x4cac:   	fstod	%f18, %f8
	.word	0x30800002	! t0_kref+0x4cb0:   	ba,a	_kref+0x4cb8
	.word	0x8ba689ad	! t0_kref+0x4cb4:   	fdivs	%f26, %f13, %f5
	.word	0xc9be581a	! t0_kref+0x4cb8:   	stda	%f4, [%i1 + %i2]0xc0
	.word	0x99a01080	! t0_kref+0x4cbc:   	fxtos	%f0, %f12
	.word	0x89a08d34	! t0_kref+0x4cc0:   	fsmuld	%f2, %f20, %f4
	.word	0xac3a663e	! t0_kref+0x4cc4:   	xnor	%o1, 0x63e, %l6
	.word	0xa8fe8008	! t0_kref+0x4cc8:   	sdivcc	%i2, %o0, %l4
	.word	0xaa8f35c4	! t0_kref+0x4ccc:   	andcc	%i4, -0xa3c, %l5
	.word	0xd030a030	! t0_kref+0x4cd0:   	sth	%o0, [%g2 + 0x30]
	.word	0x878020f0	! t0_kref+0x4cd4:   	mov	0xf0, %asi
	.word	0xd9871059	! t0_kref+0x4cd8:   	lda	[%i4 + %i1]0x82, %f12
	.word	0xec3e7ff0	! t0_kref+0x4cdc:   	std	%l6, [%i1 - 0x10]
	.word	0xaa9028e4	! t0_kref+0x4ce0:   	orcc	%g0, 0x8e4, %l5
	.word	0xaa67226f	! t0_kref+0x4ce4:   	subc	%i4, 0x26f, %l5
	.word	0x8143e014	! t0_kref+0x4ce8:   	membar	0x14
	.word	0x90500008	! t0_kref+0x4cec:   	umul	%g0, %o0, %o0
	.word	0x96432faa	! t0_kref+0x4cf0:   	addc	%o4, 0xfaa, %o3
	.word	0xaa827ca7	! t0_kref+0x4cf4:   	addcc	%o1, -0x359, %l5
	.word	0x9466c01c	! t0_kref+0x4cf8:   	subc	%i3, %i4, %o2
	.word	0x81a0002e	! t0_kref+0x4cfc:   	fmovs	%f14, %f0
	.word	0xd9be181c	! t0_kref+0x4d00:   	stda	%f12, [%i0 + %i4]0xc0
	.word	0xd6262014	! t0_kref+0x4d04:   	st	%o3, [%i0 + 0x14]
	.word	0xa6b33011	! t0_kref+0x4d08:   	orncc	%o4, -0xfef, %l3
	.word	0xd0d6d018	! t0_kref+0x4d0c:   	ldsha	[%i3 + %i0]0x80, %o0
	.word	0xd03e7ff8	! t0_kref+0x4d10:   	std	%o0, [%i1 - 8]
	sethi	%hi(2f), %o7
	.word	0xe40be150	! t0_kref+0x4d18:   	ldub	[%o7 + 0x150], %l2
	.word	0xa41ca00c	! t0_kref+0x4d1c:   	xor	%l2, 0xc, %l2
	.word	0xe42be150	! t0_kref+0x4d20:   	stb	%l2, [%o7 + 0x150]
	.word	0x81dbe150	! t0_kref+0x4d24:   	flush	%o7 + 0x150
	.word	0x9276f1ad	! t0_kref+0x4d28:   	udiv	%i3, -0xe53, %o1
	.word	0x961b3680	! t0_kref+0x4d2c:   	xor	%o4, -0x980, %o3
	.word	0xac62f976	! t0_kref+0x4d30:   	subc	%o3, -0x68a, %l6
	.word	0xec180018	! t0_kref+0x4d34:   	ldd	[%g0 + %i0], %l6
	.word	0xf8263ff0	! t0_kref+0x4d38:   	st	%i4, [%i0 - 0x10]
	.word	0xee10a022	! t0_kref+0x4d3c:   	lduh	[%g2 + 0x22], %l7
	.word	0x81a0052a	! t0_kref+0x4d40:   	fsqrts	%f10, %f0
	.word	0x96e24000	! t0_kref+0x4d44:   	subccc	%o1, %g0, %o3
	.word	0xc19f1a58	! t0_kref+0x4d48:   	ldda	[%i4 + %i0]0xd2, %f0
	.word	0x95a01a21	! t0_kref+0x4d4c:   	fstoi	%f1, %f10
2:	.word	0xec08a02d	! t0_kref+0x4d50:   	ldub	[%g2 + 0x2d], %l6
	.word	0x3d800001	! t0_kref+0x4d54:   	fbule,a	_kref+0x4d58
	.word	0x933f201f	! t0_kref+0x4d58:   	sra	%i4, 0x1f, %o1
	.word	0x9ba000b2	! t0_kref+0x4d5c:   	fnegs	%f18, %f13
	.word	0xea5e401d	! t0_kref+0x4d60:   	ldx	[%i1 + %i5], %l5
	.word	0xb7a000a3	! t0_kref+0x4d64:   	fnegs	%f3, %f27
	.word	0xaafb000b	! t0_kref+0x4d68:   	sdivcc	%o4, %o3, %l5
	.word	0x94ab401b	! t0_kref+0x4d6c:   	andncc	%o5, %i3, %o2
	.word	0xa9a38952	! t0_kref+0x4d70:   	fmuld	%f14, %f18, %f20
	.word	0xa5a6cd23	! t0_kref+0x4d74:   	fsmuld	%f27, %f3, %f18
	.word	0xc5801018	! t0_kref+0x4d78:   	lda	[%g0 + %i0]0x80, %f2
	.word	0xd93e2010	! t0_kref+0x4d7c:   	std	%f12, [%i0 + 0x10]
	.word	0x96e73529	! t0_kref+0x4d80:   	subccc	%i4, -0xad7, %o3
	.word	0xd91fbf68	! t0_kref+0x4d84:   	ldd	[%fp - 0x98], %f12
	.word	0xe608a022	! t0_kref+0x4d88:   	ldub	[%g2 + 0x22], %l3
	.word	0xa8972a1a	! t0_kref+0x4d8c:   	orcc	%i4, 0xa1a, %l4
	.word	0xa89b7339	! t0_kref+0x4d90:   	xorcc	%o5, -0xcc7, %l4
	.word	0x96524009	! t0_kref+0x4d94:   	umul	%o1, %o1, %o3
	.word	0x22800002	! t0_kref+0x4d98:   	be,a	_kref+0x4da0
	.word	0x9da00135	! t0_kref+0x4d9c:   	fabss	%f21, %f14
	.word	0xe8580018	! t0_kref+0x4da0:   	ldx	[%g0 + %i0], %l4
	.word	0xacc3000c	! t0_kref+0x4da4:   	addccc	%o4, %o4, %l6
	.word	0x81dee409	! t0_kref+0x4da8:   	flush	%i3 + 0x409
	.word	0xa5a04d34	! t0_kref+0x4dac:   	fsmuld	%f1, %f20, %f18
	.word	0xc91fbe08	! t0_kref+0x4db0:   	ldd	[%fp - 0x1f8], %f4
	.word	0xd4263ffc	! t0_kref+0x4db4:   	st	%o2, [%i0 - 4]
	.word	0xa5a01a22	! t0_kref+0x4db8:   	fstoi	%f2, %f18
	.word	0xac0ea637	! t0_kref+0x4dbc:   	and	%i2, 0x637, %l6
	.word	0xa6280017	! t0_kref+0x4dc0:   	andn	%g0, %l7, %l3
	.word	0x81aaca30	! t0_kref+0x4dc4:   	fcmps	%fcc0, %f11, %f16
	.word	0x9656c01b	! t0_kref+0x4dc8:   	umul	%i3, %i3, %o3
	.word	0xd0a01018	! t0_kref+0x4dcc:   	sta	%o0, [%g0 + %i0]0x80
	.word	0xaa7a2859	! t0_kref+0x4dd0:   	sdiv	%o0, 0x859, %l5
	.word	0xb5a2894e	! t0_kref+0x4dd4:   	fmuld	%f10, %f14, %f26
	.word	0xd4ce5000	! t0_kref+0x4dd8:   	ldsba	[%i1]0x80, %o2
	.word	0x9fc00004	! t0_kref+0x4ddc:   	call	%g0 + %g4
	.word	0xec3e6010	! t0_kref+0x4de0:   	std	%l6, [%i1 + 0x10]
	.word	0xa3a00133	! t0_kref+0x4de4:   	fabss	%f19, %f17
	.word	0xa61e801c	! t0_kref+0x4de8:   	xor	%i2, %i4, %l3
	.word	0x9ba0052d	! t0_kref+0x4dec:   	fsqrts	%f13, %f13
	call	SYM(t0_subr0)
	.word	0x9a3eabf1	! t0_kref+0x4df4:   	xnor	%i2, 0xbf1, %o5
	.word	0x9a922cc9	! t0_kref+0x4df8:   	orcc	%o0, 0xcc9, %o5
	.word	0x26800003	! t0_kref+0x4dfc:   	bl,a	_kref+0x4e08
	.word	0xaba01a39	! t0_kref+0x4e00:   	fstoi	%f25, %f21
	.word	0xd03e401d	! t0_kref+0x4e04:   	std	%o0, [%i1 + %i5]
	.word	0x9f418000	! t0_kref+0x4e08:   	mov	%fprs, %o7
	.word	0xac527ba3	! t0_kref+0x4e0c:   	umul	%o1, -0x45d, %l6
	.word	0x9de3bfa0	! t0_kref+0x4e10:   	save	%sp, -0x60, %sp
	.word	0xb8477de3	! t0_kref+0x4e14:   	addc	%i5, -0x21d, %i4
	.word	0x9fee0018	! t0_kref+0x4e18:   	restore	%i0, %i0, %o7
	.word	0x9b368017	! t0_kref+0x4e1c:   	srl	%i2, %l7, %o5
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x4e24:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x287d4000)
.seg "text"
t0_subr0_page_begin:
	.skip 8184
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x01698000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x280d0000)
.seg "text"
t0_subr2_page_begin:
	.skip 8192
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x2810a000)
.seg "text"
t0_subr3_page_begin:
	.skip 8168
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
!  Total operations: 4766  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.15   1.36
!  ldub              0.21   0.17
!  ldsh              0.15   0.15
!  lduh              1.18   1.13
!  ld                0.29   0.23
!  ldd               0.99   0.94
!  swap              0.67   0.55
!  ldstub            0.25   0.17
!  stb               0.57   0.78
!  sth               0.44   0.40
!  st                1.04   1.05
!  std               1.09   1.13
!  add               1.28   1.36
!  addcc             0.68   0.57
!  addx              1.50   1.76
!  addxcc            1.39   1.24
!  taddcc            0.06   0.08
!  taddcctv          0.12   0.19
!  sub               1.41   1.68
!  subcc             0.75   0.61
!  subx              1.37   1.51
!  subxcc            0.34   0.57
!  tsubcc            0.13   0.15
!  tsubcctv          0.07   0.04
!  mulscc            0.22   0.25
!  and               1.06   0.67
!  andcc             1.45   1.55
!  andn              0.07   0.15
!  andncc            0.70   0.86
!  or                1.29   1.32
!  orcc              1.46   1.41
!  orn               0.59   0.50
!  orncc             0.95   1.22
!  xor               1.39   1.49
!  xorcc             0.67   0.82
!  xnor              0.97   1.24
!  xnorcc            0.02   0.00
!  sll               0.71   0.59
!  srl               0.56   0.71
!  sra               0.42   0.46
!  unimp             0.14   0.17
!  umul              1.20   1.41
!  smul              1.25   1.38
!  udiv              0.64   0.61
!  sdiv              0.82   0.94
!  umulcc            0.70   0.69
!  smulcc            0.39   0.57
!  udivcc            0.39   0.57
!  sdivcc            0.53   0.65
!  rdy               1.20   1.13
!  wry               0.06   0.08
!  bicc              2.03   1.78
!  sethi             1.00   1.17
!  jmpl              0.94   0.86
!  call              1.39   1.26
!  ticc              0.00   0.00
!  flush             1.42   1.07
!  save              0.48   0.31
!  restore           0.06   0.00
!  stbar             0.64   0.69
!  ldf               0.01   0.00
!  lddf              0.51   0.65
!  stf               0.63   0.67
!  stdf              0.60   0.61
!  fadds             1.44   1.59
!  fsubs             1.12   1.11
!  fmuls             1.21   1.43
!  fdivs             1.34   1.78
!  faddd             0.41   0.44
!  fsubd             0.71   1.03
!  fmuld             0.71   0.82
!  fdivd             0.42   0.46
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.85   0.71
!  fdmulq            0.00   0.00
!  fitos             1.43   1.51
!  fitod             0.07   0.06
!  fitoq             0.00   0.00
!  fstoi             1.14   1.55
!  fstod             0.35   0.31
!  fstoq             0.00   0.00
!  fdtoi             0.17   0.25
!  fdtos             0.71   0.50
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.04   1.03
!  fnegs             0.90   1.05
!  fabss             0.90   1.11
!  fsqrts            2.19   2.14
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.69   0.48
!  fcmpd             1.15   1.28
!  fcmpq             0.00   0.00
!  fcmpes            1.36   1.15
!  fcmped            0.04   0.02
!  fcmpeq            0.00   0.00
!  fbfcc             2.69   2.37
!  ldfsr             0.11   0.00
!  stfsr             0.00   0.00
!  loop              1.07   0.63
!  offset            0.27   0.34
!  area              0.18   0.23
!  target            0.25   0.25
!  goto              0.08   0.04
!  sigsegv           0.18   0.19
!  sigbus            0.05   0.15
!  imodify           1.05   0.84
!  ldfsr_offset      0.26   0.00
!  fpattern          1.48   1.83
!  lbranch           0.12   0.04
!  shmld             5.88   5.54
!  shmst             3.55   3.57
!  shmpf             0.21   0.23
!  shmswap           0.10   0.13
!  shmblkld          0.85   0.08
!  shmblkst          0.52   0.40
!  shmblkchk         0.05   0.08
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
!  casa              0.10   0.04
!  rdasi             0.00   0.00
!  wrasi             0.07   0.10
!  bpcc              0.83   0.73
!  fbpfcc            3.14   2.83
!  fmovscc           0.02   0.02
!  fmovdcc           0.11   0.10
!  fmovqcc           0.00   0.00
!  movcc             0.19   0.29
!  flushw            0.03   0.02
!  membar            0.28   0.13
!  prefetch          0.79   1.13
!  rdpc              0.00   0.00
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.24   0.13
!  lddfa             0.11   0.08
!  ldqfa             0.00   0.00
!  ldsba             0.11   0.10
!  ldsha             0.10   0.15
!  lduba             0.06   0.08
!  lduha             0.09   0.08
!  lda               0.28   0.40
!  ldda              0.21   0.13
!  ldstuba           0.08   0.02
!  prefetcha         1.14   1.13
!  stfa              0.23   0.19
!  stdfa             0.14   0.17
!  stqfa             0.00   0.00
!  stba              0.13   0.13
!  stha              0.20   0.19
!  sta               0.25   0.17
!  stda              0.14   0.17
!  swapa             0.23   0.27
!  fmovd             0.00   0.00
!  fnegd             0.08   0.15
!  fabsd             0.29   0.27
!  fstox             0.05   0.06
!  fdtox             0.28   0.44
!  fxtos             0.26   0.25
!  fxtod             0.00   0.00
!  lds               0.05   0.06
!  ldsa              0.04   0.04
!  ldx               0.27   0.19
!  ldxa              0.13   0.08
!  nofault           0.29   0.21
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
!  partial_st8       0.12   0.17
!  partial_st16      0.29   0.25
!  partial_st32      0.06   0.06
!  short_st8         0.22   0.17
!  short_st16        0.01   0.00
!  short_ld8         0.05   0.02
!  short_ld16        0.29   0.17
!  blkld             0.15   0.00
!  blkst             0.19   0.00
!  blkld_offset      0.20   0.00
!  blkst_offset      0.00   0.00
!  blk_check         0.16   0.08
!  casxa             0.05   0.08
!  rdccr             0.02   0.00
!  rdfprs            0.24   0.21
!  wrccr             0.27   0.25
!  popc              0.27   0.21
!  wrfprs            0.06   0.06
!  stx               0.16   0.29
!  stxa              0.16   0.08
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
KDATA_MODULE(t0_module_offset_table, 0x7905e000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000010
	.word	0xfffffff8
	.word	0x00000008
	.word	0xfffffff0
	.word	0x00000000
	.word	0xffffffe0
	.word	0xffffffe8
	.word	0x00000018
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

KDATA_MODULE(t0_module_data_in_regs, 0x3c04e000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x74a554c7          ! %f0
	.word	0x70925cfb          ! %f1
	.word	0x6a4b5b94          ! %f2
	.word	0x1bdf9979          ! %f3
	.word	0xb83623b9          ! %f4
	.word	0xcdd9c41f          ! %f5
	.word	0x774638f3          ! %f6
	.word	0x71739f9f          ! %f7
	.word	0x3f6ff2e5          ! %f8
	.word	0xed45ec0f          ! %f9
	.word	0xdfecdec6          ! %f10
	.word	0x861dbd17          ! %f11
	.word	0x17ecbb67          ! %f12
	.word	0xa917afbe          ! %f13
	.word	0xc6311f5d          ! %f14
	.word	0x1c9ecfee          ! %f15
	.word	0xdb6e5a5e          ! %f16
	.word	0xe60c1e2a          ! %f17
	.word	0xb8c15e0b          ! %f18
	.word	0x6ec96011          ! %f19
	.word	0xc4f047bd          ! %f20
	.word	0xd999ca9b          ! %f21
	.word	0xa7f0d418          ! %f22
	.word	0x4b4a3336          ! %f23
	.word	0xa21d6663          ! %f24
	.word	0xdc7c5d2c          ! %f25
	.word	0xa0aab0fb          ! %f26
	.word	0xe60bbafc          ! %f27
	.word	0xa3ca4168          ! %f28
	.word	0x634a278a          ! %f29
	.word	0x247a89c8          ! %f30
	.word	0x3edfc150          ! %f31
	.word	0x29454ab9          ! %f32
	.word	0xb047c1fb          ! %f33
	.word	0x3767cbe7          ! %f34
	.word	0x06ecf713          ! %f35
	.word	0x9553eee6          ! %f36
	.word	0x0269f4a2          ! %f37
	.word	0x1e092706          ! %f38
	.word	0x451448f9          ! %f39
	.word	0x51cc923a          ! %f40
	.word	0x1db67100          ! %f41
	.word	0xd3102250          ! %f42
	.word	0x6e5c1eb4          ! %f43
	.word	0xfd2acb0b          ! %f44
	.word	0x7d381fbe          ! %f45
	.word	0x72dc50de          ! %f46
	.word	0x67ade850          ! %f47
	.word	0x857c6d54          ! %f48
	.word	0xc6c406a9          ! %f49
	.word	0xf0a8d96d          ! %f50
	.word	0xc4149de0          ! %f51
	.word	0xb2db3b80          ! %f52
	.word	0xf1180afd          ! %f53
	.word	0x02de4552          ! %f54
	.word	0x4471155a          ! %f55
	.word	0x72905088          ! %f56
	.word	0x35ad13e5          ! %f57
	.word	0x2e3dcaaa          ! %f58
	.word	0xfd8352bf          ! %f59
	.word	0x803b973f          ! %f60
	.word	0x652a5142          ! %f61
	.word	0x813a85d5          ! %f62
	.word	0xd576367f          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xbe4       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x879d833c          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x080a3caa          ! %o0
	.word	0xc180fa73          ! %o1
	.word	0x266e052d          ! %o2
	.word	0x9a5963df          ! %o3
	.word	0x525b7a30          ! %o4
	.word	0xd69d813f          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xd52ae2ec          ! %l0
	.word	0x8fffaaab          ! %l1
	.word	0xed285624          ! %l2
	.word	0x250d2e1a          ! %l3
	.word	0x64b17d19          ! %l4
	.word	0x78899ab4          ! %l5
	.word	0x312f51d0          ! %l6
	.word	0xf869cb0a          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x0000001b          ! %i2 (byte offset)
	.word	0xffffffea          ! %i3 (halfword offset)
	.word	0xffffffe0          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8ca3f120          ! %y
	.word	0x0000000c          ! %icc (nzvc)
	.word	0xc0000040          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x5575c000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x20b8bde9
	.word	0x2b6b6849
	.word	0xaef76bd1
	.word	0x0b35c372
	.word	0x96b7d497
	.word	0xa964dfba
	.word	0x10218f9f
	.word	0xf873ecf8
	.word	0x95721459
	.word	0x9cf5b21d
	.word	0xf01dae2e
	.word	0x0e804d87
	.word	0x26d6dba3
	.word	0xce2e9f3d
	.word	0x50a78e8b
	.word	0x670700cb
	.word	0x0c8ab988
	.word	0x545747c7
	.word	0x210a1728
	.word	0x73772b55
	.word	0x2338315c
	.word	0x0246d21c
	.word	0xcf63f424
	.word	0xc34edd8d
	.word	0xcfb6949a
	.word	0x5de18868
	.word	0x9799ddce
	.word	0xc64db1e6
	.word	0x18aa1708
	.word	0x2489c3f3
	.word	0x2448436b
	.word	0xd7769a54
	.word	0xf3ce8118
	.word	0x7c63b9b6
	.word	0x62de5e37
	.word	0xdf5c90fa
	.word	0x45502491
	.word	0x5830fc31
	.word	0xc628f0a9
	.word	0x9bbd2028
	.word	0x1facf76e
	.word	0x6a81c67b
	.word	0xaa3335fb
	.word	0x8326f584
	.word	0x25d1f906
	.word	0xca47649a
	.word	0xf5c8c5e9
	.word	0x2c99f486
	.word	0x15c7456c
	.word	0x2fb44d14
	.word	0x494b70b8
	.word	0xaff17c29
	.word	0xaa7f7b18
	.word	0x5a0bbfc6
	.word	0x243c5779
	.word	0x23c0d3df
	.word	0x458556c6
	.word	0xb6cbfdf3
	.word	0x0b07c48e
	.word	0xeb54f3c4
	.word	0x678ca99e
	.word	0x15bb6f9f
	.word	0x4197886d
	.word	0x230e1c16
	.word	0x879a0d94
	.word	0xf5124a1e
	.word	0x8d27dea4
	.word	0x0576efe5
	.word	0x95c6fc11
	.word	0x727f8be7
	.word	0x4d171f1c
	.word	0x77a60706
	.word	0x8ede2ad3
	.word	0xfa6161ad
	.word	0x4728bfa1
	.word	0x12d22b4d
	.word	0x43665310
	.word	0x837648b0
	.word	0xb43869a1
	.word	0x7ad0b4fa
	.word	0x856fc6e1
	.word	0x33cd824f
	.word	0x66e22833
	.word	0xd0b8ba73
	.word	0xa6db78de
	.word	0x3912ace2
	.word	0x8a70f25b
	.word	0xbd5d0733
	.word	0xc4185a05
	.word	0x03b995c6
	.word	0x35b5158c
	.word	0x43fa0e02
	.word	0x1fbe31df
	.word	0xdf4c98b8
	.word	0x6778446d
	.word	0x19944a66
	.word	0x903b54e5
	.word	0x93712066
	.word	0x815d4ddf
	.word	0x2456c559
	.word	0x143cdd1f
	.word	0xa65b1c43
	.word	0xc655c03f
	.word	0x7f08b13b
	.word	0x52cf490d
	.word	0x6ba17f9a
	.word	0x13b7fce8
	.word	0x92ac5109
	.word	0x83afa4cb
	.word	0xfef31de6
	.word	0x13a47ffb
	.word	0xaac89ecf
	.word	0xc923a16f
	.word	0xf24c7860
	.word	0x9d116061
	.word	0xab02655b
	.word	0xd9313eb5
	.word	0xf84450d8
	.word	0x35bf4c11
	.word	0x05c0c133
	.word	0x4674eade
	.word	0x660e15c8
	.word	0x94cb848e
	.word	0xbee43cc8
	.word	0x435f3cd4
	.word	0x9b2e7ba5
	.word	0x3dc69fb3
	.word	0x9256fbea
	.word	0x3b91ac91
	.word	0x4fcfd778
	.word	0x7c7010b2
	.word	0x67afaa7e
	.word	0x98a3edc2
	.word	0x73690ead
	.word	0x1cb2bd59
	.word	0x2988226f
	.word	0xe011d0a7
	.word	0xad43302b
	.word	0xa17f2397
	.word	0x2bc3fce2
	.word	0x99abcd3c
	.word	0x14970aa4
	.word	0xabe3d33f
	.word	0x471282ad
	.word	0x06e29c9d
	.word	0x47bd542d
	.word	0xf28d400b
	.word	0x24bab008
	.word	0x35e884a6
	.word	0x6e813710
	.word	0x14e22fe2
	.word	0x4b773f85
	.word	0xde2939d9
	.word	0xc44e57e1
	.word	0xbc82495d
	.word	0xf013f03d
	.word	0x50437b84
	.word	0x30f0a8cf
	.word	0xa8408687
	.word	0x69dc7b4b
	.word	0x98bdce23
	.word	0xfb2d9e3b
	.word	0x2d0b8fe4
	.word	0x3700ec7e
	.word	0x6461f802
	.word	0x54e3988e
	.word	0x7fd243b4
	.word	0x6f1a5249
t0_data_in_sp:
	.word	0xc5c12426
	.word	0x0dd59747
	.word	0x4792ed78
	.word	0x4535f8fe
	.word	0x571ccf6d
	.word	0x1e168952
	.word	0xdca7f1b5
	.word	0x2e7ca53b
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0x00000003
	.word	0x00000016
	.word	0x00000018
	.word	0x00000000
	.word	t0_data_in_fp
	.word	0x8d1bbef3
	.word	0x0d83ad18
	.word	0xa803b3d2
	.word	0xbd8e5b7f
	.word	0x743a49f9
	.word	0x21301fc2
	.word	0xd98ccc8a
	.word	0x6c53c2f8
	.word	0x477b049c
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
	.word   	0xceb7a931	! [%fp - 0xc]
	.word   	0xeb2d8731	! [%fp - 0x8]
	.word   	0xe8a3d721	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x52933798
	.word	0xcce7383d
	.word	0xa97f8c7f
	.word	0xb8f269e8
	.word	0x7093c34d
	.word	0x80a0c497
	.word	0x50922c73
	.word	0xcc448a15
	.word	0xa00fecd6
	.word	0x54109852
	.word	0xcb574386
	.word	0xb56ad266
	.word	0xcb3b6859
	.word	0x462f2da5
	.word	0xe3dcbf23
	.word	0x936f06fb
	.word	0x0a2e34a0
	.word	0xdd5ca4ef
	.word	0x7f357555
	.word	0xb773a4f4
	.word	0xc1521be8
	.word	0x192f16fa
	.word	0xbeeb43c2
	.word	0x8b0a4858
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x26630000)
.seg "data"
t0_data_in_area0_start:
.skip 2944
t0_data_in_area0_begin:
	.word	0xf9e6edf9	! t0_data_in_area0-0x20
	.word	0xd15d4783	! t0_data_in_area0-0x1c
	.word	0x50ffa9d7	! t0_data_in_area0-0x18
	.word	0x6af00c38	! t0_data_in_area0-0x14
	.word	0x9bc7c776	! t0_data_in_area0-0x10
	.word	0x26437bf9	! t0_data_in_area0-0xc
	.word	0xa61f5244	! t0_data_in_area0-0x8
	.word	0x576d4913	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0xc76cfa76	! t0_data_in_area0+0x0
	.word	0x4b187a85	! t0_data_in_area0+0x4
	.word	0x37003fab	! t0_data_in_area0+0x8
	.word	0x6788557c	! t0_data_in_area0+0xc
	.word	0x4acb6c52	! t0_data_in_area0+0x10
	.word	0x4ec4f54a	! t0_data_in_area0+0x14
	.word	0x6d299093	! t0_data_in_area0+0x18
	.word	0x9d112cfa	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 5184
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x45612000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0xf46b7cc0	! t0_data_in_shm_area+0x0 (t0)
	.word	0x6eafe5ed	! t0_data_in_shm_area+0x4 (t0)
	.word	0x53df0ea2	! t0_data_in_shm_area+0x8 (t0)
	.word	0xf786212f	! t0_data_in_shm_area+0xc (t0)
	.word	0x9b1eca20	! t0_data_in_shm_area+0x10 (t0)
	.word	0x82f69d57	! t0_data_in_shm_area+0x14 (t0)
	.word	0x8ad9fd0b	! t0_data_in_shm_area+0x18 (t0)
	.word	0xc12ff93b	! t0_data_in_shm_area+0x1c (t0)
	.word	0xdf5d6716	! t0_data_in_shm_area+0x20 (t0)
	.word	0xcdaf8bb9	! t0_data_in_shm_area+0x24 (t0)
	.word	0x611bda44	! t0_data_in_shm_area+0x28 (t0)
	.word	0xfed62362	! t0_data_in_shm_area+0x2c (t0)
	.word	0x9ac85558	! t0_data_in_shm_area+0x30 (t0)
	.word	0xc34304d0	! t0_data_in_shm_area+0x34 (t0)
	.word	0xc9bf08fc	! t0_data_in_shm_area+0x38 (t0)
	.word	0x7d51dceb	! t0_data_in_shm_area+0x3c (t0)
	.word	0x5bd859c8	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0xa0d5846a	! t0_data_in_shm_area+0x44
	.word	0x8274944c	! t0_data_in_shm_area+0x48
	.word	0x2b51744b	! t0_data_in_shm_area+0x4c
	.word	0x3c9d7dc4	! t0_data_in_shm_area+0x50
	.word	0xfb733728	! t0_data_in_shm_area+0x54
	.word	0x329d832c	! t0_data_in_shm_area+0x58
	.word	0x9f0b0983	! t0_data_in_shm_area+0x5c
	.word	0x7ce4d1bd	! t0_data_in_shm_area+0x60
	.word	0x0764cb84	! t0_data_in_shm_area+0x64
	.word	0x25e16f28	! t0_data_in_shm_area+0x68
	.word	0xd9b070c5	! t0_data_in_shm_area+0x6c
	.word	0xff5f4506	! t0_data_in_shm_area+0x70
	.word	0x9711cf15	! t0_data_in_shm_area+0x74
	.word	0x250b5252	! t0_data_in_shm_area+0x78
	.word	0x736c1b5d	! t0_data_in_shm_area+0x7c
	.word	0xa7bda6ee	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xac551c11	! t0_data_in_shm_area+0x84
	.word	0x9f10c07a	! t0_data_in_shm_area+0x88
	.word	0x64c92ace	! t0_data_in_shm_area+0x8c
	.word	0x7a632510	! t0_data_in_shm_area+0x90
	.word	0xa26c1b14	! t0_data_in_shm_area+0x94
	.word	0x11b6ff9c	! t0_data_in_shm_area+0x98
	.word	0x0be7123b	! t0_data_in_shm_area+0x9c
	.word	0xb690dae8	! t0_data_in_shm_area+0xa0
	.word	0x29f1dd1f	! t0_data_in_shm_area+0xa4
	.word	0x608cb399	! t0_data_in_shm_area+0xa8
	.word	0xe6fb6a09	! t0_data_in_shm_area+0xac
	.word	0x370246aa	! t0_data_in_shm_area+0xb0
	.word	0x87e351e2	! t0_data_in_shm_area+0xb4
	.word	0x7126112a	! t0_data_in_shm_area+0xb8
	.word	0xc0aad9c1	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x1a698000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x74a554c7          ! %f0
	.word	0x70925cfb          ! %f1
	.word	0x6a4b5b94          ! %f2
	.word	0x1bdf9979          ! %f3
	.word	0xb83623b9          ! %f4
	.word	0xcdd9c41f          ! %f5
	.word	0x774638f3          ! %f6
	.word	0x71739f9f          ! %f7
	.word	0x3f6ff2e5          ! %f8
	.word	0xed45ec0f          ! %f9
	.word	0xdfecdec6          ! %f10
	.word	0x861dbd17          ! %f11
	.word	0x17ecbb67          ! %f12
	.word	0xa917afbe          ! %f13
	.word	0xc6311f5d          ! %f14
	.word	0x1c9ecfee          ! %f15
	.word	0xdb6e5a5e          ! %f16
	.word	0xe60c1e2a          ! %f17
	.word	0xb8c15e0b          ! %f18
	.word	0x6ec96011          ! %f19
	.word	0xc4f047bd          ! %f20
	.word	0xd999ca9b          ! %f21
	.word	0xa7f0d418          ! %f22
	.word	0x4b4a3336          ! %f23
	.word	0xa21d6663          ! %f24
	.word	0xdc7c5d2c          ! %f25
	.word	0xa0aab0fb          ! %f26
	.word	0xe60bbafc          ! %f27
	.word	0xa3ca4168          ! %f28
	.word	0x634a278a          ! %f29
	.word	0x247a89c8          ! %f30
	.word	0x3edfc150          ! %f31
	.word	0x29454ab9          ! %f32
	.word	0xb047c1fb          ! %f33
	.word	0x3767cbe7          ! %f34
	.word	0x06ecf713          ! %f35
	.word	0x9553eee6          ! %f36
	.word	0x0269f4a2          ! %f37
	.word	0x1e092706          ! %f38
	.word	0x451448f9          ! %f39
	.word	0x51cc923a          ! %f40
	.word	0x1db67100          ! %f41
	.word	0xd3102250          ! %f42
	.word	0x6e5c1eb4          ! %f43
	.word	0xfd2acb0b          ! %f44
	.word	0x7d381fbe          ! %f45
	.word	0x72dc50de          ! %f46
	.word	0x67ade850          ! %f47
	.word	0x857c6d54          ! %f48
	.word	0xc6c406a9          ! %f49
	.word	0xf0a8d96d          ! %f50
	.word	0xc4149de0          ! %f51
	.word	0xb2db3b80          ! %f52
	.word	0xf1180afd          ! %f53
	.word	0x02de4552          ! %f54
	.word	0x4471155a          ! %f55
	.word	0x72905088          ! %f56
	.word	0x35ad13e5          ! %f57
	.word	0x2e3dcaaa          ! %f58
	.word	0xfd8352bf          ! %f59
	.word	0x803b973f          ! %f60
	.word	0x652a5142          ! %f61
	.word	0x813a85d5          ! %f62
	.word	0xd576367f          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0xbe4       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x879d833c          ! %g3 (loop index)
	.word	SYM(t0_subr3)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x080a3caa          ! %o0
	.word	0xc180fa73          ! %o1
	.word	0x266e052d          ! %o2
	.word	0x9a5963df          ! %o3
	.word	0x525b7a30          ! %o4
	.word	0xd69d813f          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0xd52ae2ec          ! %l0
	.word	0x8fffaaab          ! %l1
	.word	0xed285624          ! %l2
	.word	0x250d2e1a          ! %l3
	.word	0x64b17d19          ! %l4
	.word	0x78899ab4          ! %l5
	.word	0x312f51d0          ! %l6
	.word	0xf869cb0a          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x0000001b          ! %i2 (byte offset)
	.word	0xffffffea          ! %i3 (halfword offset)
	.word	0xffffffe0          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8ca3f120          ! %y
	.word	0x0000000c          ! %icc (nzvc)
	.word	0xc0000040          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x570ee000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x20b8bde9
	.word	0x2b6b6849
	.word	0xaef76bd1
	.word	0x0b35c372
	.word	0x96b7d497
	.word	0xa964dfba
	.word	0x10218f9f
	.word	0xf873ecf8
	.word	0x95721459
	.word	0x9cf5b21d
	.word	0xf01dae2e
	.word	0x0e804d87
	.word	0x26d6dba3
	.word	0xce2e9f3d
	.word	0x50a78e8b
	.word	0x670700cb
	.word	0x0c8ab988
	.word	0x545747c7
	.word	0x210a1728
	.word	0x73772b55
	.word	0x2338315c
	.word	0x0246d21c
	.word	0xcf63f424
	.word	0xc34edd8d
	.word	0xcfb6949a
	.word	0x5de18868
	.word	0x9799ddce
	.word	0xc64db1e6
	.word	0x18aa1708
	.word	0x2489c3f3
	.word	0x2448436b
	.word	0xd7769a54
	.word	0xf3ce8118
	.word	0x7c63b9b6
	.word	0x62de5e37
	.word	0xdf5c90fa
	.word	0x45502491
	.word	0x5830fc31
	.word	0xc628f0a9
	.word	0x9bbd2028
	.word	0x1facf76e
	.word	0x6a81c67b
	.word	0xaa3335fb
	.word	0x8326f584
	.word	0x25d1f906
	.word	0xca47649a
	.word	0xf5c8c5e9
	.word	0x2c99f486
	.word	0x15c7456c
	.word	0x2fb44d14
	.word	0x494b70b8
	.word	0xaff17c29
	.word	0xaa7f7b18
	.word	0x5a0bbfc6
	.word	0x243c5779
	.word	0x23c0d3df
	.word	0x458556c6
	.word	0xb6cbfdf3
	.word	0x0b07c48e
	.word	0xeb54f3c4
	.word	0x678ca99e
	.word	0x15bb6f9f
	.word	0x4197886d
	.word	0x230e1c16
	.word	0x879a0d94
	.word	0xf5124a1e
	.word	0x8d27dea4
	.word	0x0576efe5
	.word	0x95c6fc11
	.word	0x727f8be7
	.word	0x4d171f1c
	.word	0x77a60706
	.word	0x8ede2ad3
	.word	0xfa6161ad
	.word	0x4728bfa1
	.word	0x12d22b4d
	.word	0x43665310
	.word	0x837648b0
	.word	0xb43869a1
	.word	0x7ad0b4fa
	.word	0x856fc6e1
	.word	0x33cd824f
	.word	0x66e22833
	.word	0xd0b8ba73
	.word	0xa6db78de
	.word	0x3912ace2
	.word	0x8a70f25b
	.word	0xbd5d0733
	.word	0xc4185a05
	.word	0x03b995c6
	.word	0x35b5158c
	.word	0x43fa0e02
	.word	0x1fbe31df
	.word	0xdf4c98b8
	.word	0x6778446d
	.word	0x19944a66
	.word	0x903b54e5
	.word	0x93712066
	.word	0x815d4ddf
	.word	0x2456c559
	.word	0x143cdd1f
	.word	0xa65b1c43
	.word	0xc655c03f
	.word	0x7f08b13b
	.word	0x52cf490d
	.word	0x6ba17f9a
	.word	0x13b7fce8
	.word	0x92ac5109
	.word	0x83afa4cb
	.word	0xfef31de6
	.word	0x13a47ffb
	.word	0xaac89ecf
	.word	0xc923a16f
	.word	0xf24c7860
	.word	0x9d116061
	.word	0xab02655b
	.word	0xd9313eb5
	.word	0xf84450d8
	.word	0x35bf4c11
	.word	0x05c0c133
	.word	0x4674eade
	.word	0x660e15c8
	.word	0x94cb848e
	.word	0xbee43cc8
	.word	0x435f3cd4
	.word	0x9b2e7ba5
	.word	0x3dc69fb3
	.word	0x9256fbea
	.word	0x3b91ac91
	.word	0x4fcfd778
	.word	0x7c7010b2
	.word	0x67afaa7e
	.word	0x98a3edc2
	.word	0x73690ead
	.word	0x1cb2bd59
	.word	0x2988226f
	.word	0xe011d0a7
	.word	0xad43302b
	.word	0xa17f2397
	.word	0x2bc3fce2
	.word	0x99abcd3c
	.word	0x14970aa4
	.word	0xabe3d33f
	.word	0x471282ad
	.word	0x06e29c9d
	.word	0x47bd542d
	.word	0xf28d400b
	.word	0x24bab008
	.word	0x35e884a6
	.word	0x6e813710
	.word	0x14e22fe2
	.word	0x4b773f85
	.word	0xde2939d9
	.word	0xc44e57e1
	.word	0xbc82495d
	.word	0xf013f03d
	.word	0x50437b84
	.word	0x30f0a8cf
	.word	0xa8408687
	.word	0x69dc7b4b
	.word	0x98bdce23
	.word	0xfb2d9e3b
	.word	0x2d0b8fe4
	.word	0x3700ec7e
	.word	0x6461f802
	.word	0x54e3988e
	.word	0x7fd243b4
	.word	0x6f1a5249
t0_data_exp_sp:
	.word	0xc5c12426
	.word	0x0dd59747
	.word	0x4792ed78
	.word	0x4535f8fe
	.word	0x571ccf6d
	.word	0x1e168952
	.word	0xdca7f1b5
	.word	0x2e7ca53b
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0x00000003
	.word	0x00000016
	.word	0x00000018
	.word	0x00000000
	.word	t0_data_exp_fp
	.word	0x8d1bbef3
	.word	0x0d83ad18
	.word	0xa803b3d2
	.word	0xbd8e5b7f
	.word	0x743a49f9
	.word	0x21301fc2
	.word	0xd98ccc8a
	.word	0x6c53c2f8
	.word	0x477b049c
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
	.word   	0xceb7a931	! [%fp - 0xc]
	.word   	0xeb2d8731	! [%fp - 0x8]
	.word   	0xe8a3d721	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x52933798
	.word	0xcce7383d
	.word	0xa97f8c7f
	.word	0xb8f269e8
	.word	0x7093c34d
	.word	0x80a0c497
	.word	0x50922c73
	.word	0xcc448a15
	.word	0xa00fecd6
	.word	0x54109852
	.word	0xcb574386
	.word	0xb56ad266
	.word	0xcb3b6859
	.word	0x462f2da5
	.word	0xe3dcbf23
	.word	0x936f06fb
	.word	0x0a2e34a0
	.word	0xdd5ca4ef
	.word	0x7f357555
	.word	0xb773a4f4
	.word	0xc1521be8
	.word	0x192f16fa
	.word	0xbeeb43c2
	.word	0x8b0a4858
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x48f56000)
.seg "data"
t0_data_exp_area0_start:
.skip 2944
t0_data_exp_area0_begin:
	.word	0xf9e6edf9	! t0_data_exp_area0-0x20
	.word	0xd15d4783	! t0_data_exp_area0-0x1c
	.word	0x50ffa9d7	! t0_data_exp_area0-0x18
	.word	0x6af00c38	! t0_data_exp_area0-0x14
	.word	0x9bc7c776	! t0_data_exp_area0-0x10
	.word	0x26437bf9	! t0_data_exp_area0-0xc
	.word	0xa61f5244	! t0_data_exp_area0-0x8
	.word	0x576d4913	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0xc76cfa76	! t0_data_exp_area0+0x0
	.word	0x4b187a85	! t0_data_exp_area0+0x4
	.word	0x37003fab	! t0_data_exp_area0+0x8
	.word	0x6788557c	! t0_data_exp_area0+0xc
	.word	0x4acb6c52	! t0_data_exp_area0+0x10
	.word	0x4ec4f54a	! t0_data_exp_area0+0x14
	.word	0x6d299093	! t0_data_exp_area0+0x18
	.word	0x9d112cfa	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 5184
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x166ec000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0xf46b7cc0	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x6eafe5ed	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x53df0ea2	! t0_data_exp_shm_area+0x8 (t0)
	.word	0xf786212f	! t0_data_exp_shm_area+0xc (t0)
	.word	0x9b1eca20	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x82f69d57	! t0_data_exp_shm_area+0x14 (t0)
	.word	0x8ad9fd0b	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xc12ff93b	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xdf5d6716	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xcdaf8bb9	! t0_data_exp_shm_area+0x24 (t0)
	.word	0x611bda44	! t0_data_exp_shm_area+0x28 (t0)
	.word	0xfed62362	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x9ac85558	! t0_data_exp_shm_area+0x30 (t0)
	.word	0xc34304d0	! t0_data_exp_shm_area+0x34 (t0)
	.word	0xc9bf08fc	! t0_data_exp_shm_area+0x38 (t0)
	.word	0x7d51dceb	! t0_data_exp_shm_area+0x3c (t0)
	.word	0x5bd859c8	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0xa0d5846a	! t0_data_exp_shm_area+0x44
	.word	0x8274944c	! t0_data_exp_shm_area+0x48
	.word	0x2b51744b	! t0_data_exp_shm_area+0x4c
	.word	0x3c9d7dc4	! t0_data_exp_shm_area+0x50
	.word	0xfb733728	! t0_data_exp_shm_area+0x54
	.word	0x329d832c	! t0_data_exp_shm_area+0x58
	.word	0x9f0b0983	! t0_data_exp_shm_area+0x5c
	.word	0x7ce4d1bd	! t0_data_exp_shm_area+0x60
	.word	0x0764cb84	! t0_data_exp_shm_area+0x64
	.word	0x25e16f28	! t0_data_exp_shm_area+0x68
	.word	0xd9b070c5	! t0_data_exp_shm_area+0x6c
	.word	0xff5f4506	! t0_data_exp_shm_area+0x70
	.word	0x9711cf15	! t0_data_exp_shm_area+0x74
	.word	0x250b5252	! t0_data_exp_shm_area+0x78
	.word	0x736c1b5d	! t0_data_exp_shm_area+0x7c
	.word	0xa7bda6ee	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xac551c11	! t0_data_exp_shm_area+0x84
	.word	0x9f10c07a	! t0_data_exp_shm_area+0x88
	.word	0x64c92ace	! t0_data_exp_shm_area+0x8c
	.word	0x7a632510	! t0_data_exp_shm_area+0x90
	.word	0xa26c1b14	! t0_data_exp_shm_area+0x94
	.word	0x11b6ff9c	! t0_data_exp_shm_area+0x98
	.word	0x0be7123b	! t0_data_exp_shm_area+0x9c
	.word	0xb690dae8	! t0_data_exp_shm_area+0xa0
	.word	0x29f1dd1f	! t0_data_exp_shm_area+0xa4
	.word	0x608cb399	! t0_data_exp_shm_area+0xa8
	.word	0xe6fb6a09	! t0_data_exp_shm_area+0xac
	.word	0x370246aa	! t0_data_exp_shm_area+0xb0
	.word	0x87e351e2	! t0_data_exp_shm_area+0xb4
	.word	0x7126112a	! t0_data_exp_shm_area+0xb8
	.word	0xc0aad9c1	! t0_data_exp_shm_area+0xbc
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



