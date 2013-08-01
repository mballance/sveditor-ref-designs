/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: kaos_02_06_2004_11.s
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
#define T0_KAOS_SEED          d2b1f7ffa92e
#define T0_KAOS_ICOUNT        4000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    512
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     4002

#define T0_KAOS_BOOT_VA                  0x0528c000
#define T0_KAOS_BOOT_PA                  0x00000000017b8000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x49636000
#define T0_KAOS_STARTUP_PA               0x000000000395e000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x0748e000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004e00000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x1f0ca000
#define T0_KAOS_DONE_PA                  0x000000000783a000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x5339a000
#define T0_KAOS_KTBL_PA                  0x000000000825c000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x53362000
#define T0_KAOS_SUBR0_PA                 0x000000000b536000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x52cca000
#define T0_KAOS_SUBR1_PA                 0x000000000c0ca000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x5091a000
#define T0_KAOS_SUBR2_PA                 0x000000000f018000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x53434000
#define T0_KAOS_SUBR3_PA                 0x0000000010d8c000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x53336000
#define T0_KAOS_EXP_REGS_PA              0x0000000013c88000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x02c90000
#define T0_KAOS_RUN_REGS_PA              0x00000000155ca000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x1dca4000
#define T0_KAOS_EXP_STACK_PA             0x0000000017ace000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x54c34000
#define T0_KAOS_RUN_STACK_PA             0x000000001839c000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x51360000
#define T0_KAOS_EXP_AREA0_PA             0x000000001bff0000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x190a6000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c410000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x6d884000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000efc000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x10a20000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000920000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xb16b3a53
#define T0_KAOS_RANVAL_01     0x0cb4d9b2
#define T0_KAOS_RANVAL_02     0x3ee7eb4c
#define T0_KAOS_RANVAL_03     0x66722dda
#define T0_KAOS_RANVAL_04     0x17455da3
#define T0_KAOS_RANVAL_05     0xc200dacd
#define T0_KAOS_RANVAL_06     0xb500a5d3
#define T0_KAOS_RANVAL_07     0x51a3f7f3
#define T0_KAOS_RANVAL_08     0xd9e6e334
#define T0_KAOS_RANVAL_09     0x2e9a64d4
#define T0_KAOS_RANVAL_0a     0x5617d657
#define T0_KAOS_RANVAL_0b     0xdbacd301
#define T0_KAOS_RANVAL_0c     0x28110c06
#define T0_KAOS_RANVAL_0d     0xffbef1f2
#define T0_KAOS_RANVAL_0e     0x0a6c9b9a
#define T0_KAOS_RANVAL_0f     0x38dd1a62
#define T0_KAOS_RANVAL_10     0x36687b85
#define T0_KAOS_RANVAL_11     0x8a3525ed
#define T0_KAOS_RANVAL_12     0x0bf1ad41
#define T0_KAOS_RANVAL_13     0xa21f20fe
#define T0_KAOS_RANVAL_14     0xfb8c8a0a
#define T0_KAOS_RANVAL_15     0x5e0d8852
#define T0_KAOS_RANVAL_16     0xb6975bff
#define T0_KAOS_RANVAL_17     0xd9c99898
#define T0_KAOS_RANVAL_18     0xdff2bba7
#define T0_KAOS_RANVAL_19     0xc8782df2
#define T0_KAOS_RANVAL_1a     0x9572eff2
#define T0_KAOS_RANVAL_1b     0xe0609a67
#define T0_KAOS_RANVAL_1c     0x623c5f23
#define T0_KAOS_RANVAL_1d     0xc8c7058c
#define T0_KAOS_RANVAL_1e     0x9393094c
#define T0_KAOS_RANVAL_1f     0xdd0624e5
#define T0_KAOS_RANVAL_20     0xf7989943
#define T0_KAOS_RANVAL_21     0x0afbbbcb
#define T0_KAOS_RANVAL_22     0xe226e736
#define T0_KAOS_RANVAL_23     0x781422e6
#define T0_KAOS_RANVAL_24     0xe025604b
#define T0_KAOS_RANVAL_25     0xccbb6a72
#define T0_KAOS_RANVAL_26     0xff98b8f0
#define T0_KAOS_RANVAL_27     0x8b674feb
#define T0_KAOS_RANVAL_28     0xd5662bc3
#define T0_KAOS_RANVAL_29     0xc87186d5
#define T0_KAOS_RANVAL_2a     0xa2995d3c
#define T0_KAOS_RANVAL_2b     0xec838db7
#define T0_KAOS_RANVAL_2c     0xfd0f5c7e
#define T0_KAOS_RANVAL_2d     0xb10ec38a
#define T0_KAOS_RANVAL_2e     0x131e33fc
#define T0_KAOS_RANVAL_2f     0xd62f7f23
#define T0_KAOS_RANVAL_30     0x40d1a0d8
#define T0_KAOS_RANVAL_31     0xb667d961
#define T0_KAOS_RANVAL_32     0x8837e61a
#define T0_KAOS_RANVAL_33     0xd2ae7c2e
#define T0_KAOS_RANVAL_34     0x74c0d93e
#define T0_KAOS_RANVAL_35     0x72036b90
#define T0_KAOS_RANVAL_36     0x6eb347a7
#define T0_KAOS_RANVAL_37     0x0a9d3358
#define T0_KAOS_RANVAL_38     0xb5a640f2
#define T0_KAOS_RANVAL_39     0x6d657b32
#define T0_KAOS_RANVAL_3a     0x67e3b846
#define T0_KAOS_RANVAL_3b     0x27e68c2f
#define T0_KAOS_RANVAL_3c     0x4745df0f
#define T0_KAOS_RANVAL_3d     0xd0da1df2
#define T0_KAOS_RANVAL_3e     0x5c08a5cb
#define T0_KAOS_RANVAL_3f     0x058b9f29
#define T0_KAOS_RANVAL_40     0x649b83cb
#define T0_KAOS_RANVAL_41     0x4ba86c03
#define T0_KAOS_RANVAL_42     0x0eb6151e
#define T0_KAOS_RANVAL_43     0xb552d6b4
#define T0_KAOS_RANVAL_44     0xd993d5fc
#define T0_KAOS_RANVAL_45     0xb7b1d953
#define T0_KAOS_RANVAL_46     0x47c25565
#define T0_KAOS_RANVAL_47     0xd91f8d8b
#define T0_KAOS_RANVAL_48     0x930a34dd
#define T0_KAOS_RANVAL_49     0x9a116dff
#define T0_KAOS_RANVAL_4a     0x46b94162
#define T0_KAOS_RANVAL_4b     0x57f4be4b
#define T0_KAOS_RANVAL_4c     0x4f1c7211
#define T0_KAOS_RANVAL_4d     0x63919208
#define T0_KAOS_RANVAL_4e     0xebf7b318
#define T0_KAOS_RANVAL_4f     0x5bba9845
#define T0_KAOS_RANVAL_50     0x3971a7e7
#define T0_KAOS_RANVAL_51     0x1e066047
#define T0_KAOS_RANVAL_52     0xbf980db4
#define T0_KAOS_RANVAL_53     0x9e080d95
#define T0_KAOS_RANVAL_54     0x0521afde
#define T0_KAOS_RANVAL_55     0x2205b49e
#define T0_KAOS_RANVAL_56     0xdd8301ab
#define T0_KAOS_RANVAL_57     0x04aeae73
#define T0_KAOS_RANVAL_58     0x44befd6c
#define T0_KAOS_RANVAL_59     0x12556970
#define T0_KAOS_RANVAL_5a     0x4d85ef1f
#define T0_KAOS_RANVAL_5b     0xabd865c8
#define T0_KAOS_RANVAL_5c     0xa0dce0fa
#define T0_KAOS_RANVAL_5d     0xf2fb7852
#define T0_KAOS_RANVAL_5e     0x90828a87
#define T0_KAOS_RANVAL_5f     0xd06beb04
#define T0_KAOS_RANVAL_60     0xaa887733
#define T0_KAOS_RANVAL_61     0xf862f202
#define T0_KAOS_RANVAL_62     0x36e1a78d
#define T0_KAOS_RANVAL_63     0xc365fd2e
#define T0_KAOS_RANVAL_64     0x71cac87e
#define T0_KAOS_RANVAL_65     0x0ac40197
#define T0_KAOS_RANVAL_66     0x52ad4e3a
#define T0_KAOS_RANVAL_67     0xa322bb3c
#define T0_KAOS_RANVAL_68     0x94aedcc8
#define T0_KAOS_RANVAL_69     0xd22c6efa
#define T0_KAOS_RANVAL_6a     0x17547e50
#define T0_KAOS_RANVAL_6b     0x1b73ada4
#define T0_KAOS_RANVAL_6c     0x01aec786
#define T0_KAOS_RANVAL_6d     0x03695494
#define T0_KAOS_RANVAL_6e     0x2c5d44f6
#define T0_KAOS_RANVAL_6f     0xc6145532
#define T0_KAOS_RANVAL_70     0x4516effa
#define T0_KAOS_RANVAL_71     0x1ce9fc48
#define T0_KAOS_RANVAL_72     0x3570089a
#define T0_KAOS_RANVAL_73     0xebd8531c
#define T0_KAOS_RANVAL_74     0x8c1f19b4
#define T0_KAOS_RANVAL_75     0x87bf17a3
#define T0_KAOS_RANVAL_76     0x13712f12
#define T0_KAOS_RANVAL_77     0xa90b7e53
#define T0_KAOS_RANVAL_78     0xf66cf15b
#define T0_KAOS_RANVAL_79     0x5358c752
#define T0_KAOS_RANVAL_7a     0x060c8204
#define T0_KAOS_RANVAL_7b     0xb62d7a1b
#define T0_KAOS_RANVAL_7c     0xbfac21ad
#define T0_KAOS_RANVAL_7d     0x65d925d4
#define T0_KAOS_RANVAL_7e     0x5d67f588
#define T0_KAOS_RANVAL_7f     0x06b7a1dd
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
!    areaoffset     512
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      4002
!    code           5339a000
!    entry          5339a000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2b1f7ffa92e
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

KTEXT_MODULE(t0_module_ktbl, 0x5339a000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x99b009b0	! t0_kref+0x0:   	fexpand	%f16, %f12
	.word	0x90fcade2	! t0_kref+0x4:   	sdivcc	%l2, 0xde2, %o0
	.word	0x9de3bfa0	! t0_kref+0x8:   	save	%sp, -0x60, %sp
	.word	0xb25f7fec	! t0_kref+0xc:   	smul	%i5, -0x14, %i1
	.word	0x91ee001d	! t0_kref+0x10:   	restore	%i0, %i5, %o0
	.word	0x96adc015	! t0_kref+0x14:   	andncc	%l7, %l5, %o3
	.word	0xa60cc008	! t0_kref+0x18:   	and	%l3, %o0, %l3
	.word	0x9da408ce	! t0_kref+0x1c:   	fsubd	%f16, %f14, %f14
	.word	0x99a309d0	! t0_kref+0x20:   	fdivd	%f12, %f16, %f12
	.word	0x99a3c9ae	! t0_kref+0x24:   	fdivs	%f15, %f14, %f12
	.word	0x99a01110	! t0_kref+0x28:   	fxtod	%f16, %f12
	.word	0x9da408ad	! t0_kref+0x2c:   	fsubs	%f16, %f13, %f14
	.word	0x81ab8ace	! t0_kref+0x30:   	fcmped	%fcc0, %f14, %f14
	.word	0x94ad4008	! t0_kref+0x34:   	andncc	%l5, %o0, %o2
	.word	0xae85f1d9	! t0_kref+0x38:   	addcc	%l7, -0xe27, %l7
	.word	0x3f800007	! t0_kref+0x3c:   	fbo,a	_kref+0x58
	.word	0xdd200018	! t0_kref+0x40:   	st	%f14, [%g0 + %i0]
	.word	0xe11e3fe8	! t0_kref+0x44:   	ldd	[%i0 - 0x18], %f16
	.word	0xe120a02c	! t0_kref+0x48:   	st	%f16, [%g2 + 0x2c]
	.word	0xea28a029	! t0_kref+0x4c:   	stb	%l5, [%g2 + 0x29]
	.word	0xa1a40850	! t0_kref+0x50:   	faddd	%f16, %f16, %f16
	.word	0xe648a029	! t0_kref+0x54:   	ldsb	[%g2 + 0x29], %l3
	.word	0xa5400000	! t0_kref+0x58:   	mov	%y, %l2
	.word	0x912d600b	! t0_kref+0x5c:   	sll	%l5, 0xb, %o0
	.word	0xe13e2018	! t0_kref+0x60:   	std	%f16, [%i0 + 0x18]
	.word	0x9da00531	! t0_kref+0x64:   	fsqrts	%f17, %f14
	.word	0xaaad319e	! t0_kref+0x68:   	andncc	%l4, -0xe62, %l5
	.word	0xd9be1812	! t0_kref+0x6c:   	stda	%f12, [%i0 + %l2]0xc0
	.word	0x96c54015	! t0_kref+0x70:   	addccc	%l5, %l5, %o3
	.word	0x2b254752	! t0_kref+0x74:   	sethi	%hi(0x951d4800), %l5
	.word	0x94f4a039	! t0_kref+0x78:   	udivcc	%l2, 0x39, %o2
	.word	0x9fa3092e	! t0_kref+0x7c:   	fmuls	%f12, %f14, %f15
	.word	0x2a800003	! t0_kref+0x80:   	bcs,a	_kref+0x8c
	.word	0x94b5774f	! t0_kref+0x84:   	orncc	%l5, -0x8b1, %o2
	.word	0x26800004	! t0_kref+0x88:   	bl,a	_kref+0x98
	.word	0x94d521b2	! t0_kref+0x8c:   	umulcc	%l4, 0x1b2, %o2
	.word	0x23800002	! t0_kref+0x90:   	fbne,a	_kref+0x98
	.word	0x81580000	! t0_kref+0x94:   	flushw
	.word	0x81ab4ab0	! t0_kref+0x98:   	fcmpes	%fcc0, %f13, %f16
	.word	0xaf35c015	! t0_kref+0x9c:   	srl	%l7, %l5, %l7
	.word	0x943cc016	! t0_kref+0xa0:   	xnor	%l3, %l6, %o2
	.word	0x9ba308ae	! t0_kref+0xa4:   	fsubs	%f12, %f14, %f13
	.word	0x99a44831	! t0_kref+0xa8:   	fadds	%f17, %f17, %f12
	.word	0x90fdc017	! t0_kref+0xac:   	sdivcc	%l7, %l7, %o0
	.word	0xe13e4000	! t0_kref+0xb0:   	std	%f16, [%i1]
	.word	0xaf1a0012	! t0_kref+0xb4:   	tsubcctv	%o0, %l2, %l7
	.word	0xa1a40950	! t0_kref+0xb8:   	fmuld	%f16, %f16, %f16
	.word	0x99a01090	! t0_kref+0xbc:   	fxtos	%f16, %f12
	.word	0xa3b00f2f	! t0_kref+0xc0:   	fsrc2s	%f15, %f17
	.word	0x9fc10000	! t0_kref+0xc4:   	call	%g4
	.word	0x99b30dd0	! t0_kref+0xc8:   	fnand	%f12, %f16, %f12
	.word	0xd83e2008	! t0_kref+0xcc:   	std	%o4, [%i0 + 8]
	.word	0xd91e401d	! t0_kref+0xd0:   	ldd	[%i1 + %i5], %f12
	.word	0xea270019	! t0_kref+0xd4:   	st	%l5, [%i4 + %i1]
	.word	0x9da0110e	! t0_kref+0xd8:   	fxtod	%f14, %f14
	.word	0x8143c000	! t0_kref+0xdc:   	stbar
	.word	0x9da0054e	! t0_kref+0xe0:   	fsqrtd	%f14, %f14
	.word	0x903537d9	! t0_kref+0xe4:   	orn	%l4, -0x827, %o0
	.word	0xa3a389ae	! t0_kref+0xe8:   	fdivs	%f14, %f14, %f17
	.word	0x9da0054e	! t0_kref+0xec:   	fsqrtd	%f14, %f14
	.word	0xecee9018	! t0_kref+0xf0:   	ldstuba	[%i2 + %i0]0x80, %l6
	.word	0xec000019	! t0_kref+0xf4:   	ld	[%g0 + %i1], %l6
	.word	0x878020d2	! t0_kref+0xf8:   	mov	0xd2, %asi
	.word	0x9674f7e7	! t0_kref+0xfc:   	udiv	%l3, -0x819, %o3
	.word	0xd9871019	! t0_kref+0x100:   	lda	[%i4 + %i1]0x80, %f12
	.word	0x81abcab0	! t0_kref+0x104:   	fcmpes	%fcc0, %f15, %f16
	.word	0x8143e040	! t0_kref+0x108:   	membar	0x40
	.word	0x96b5c012	! t0_kref+0x10c:   	orncc	%l7, %l2, %o3
	.word	0x96f4bf97	! t0_kref+0x110:   	udivcc	%l2, -0x69, %o3
	.word	0xaa9d4014	! t0_kref+0x114:   	xorcc	%l5, %l4, %l5
	.word	0x9062355a	! t0_kref+0x118:   	subc	%o0, -0xaa6, %o0
	.word	0xec367ffe	! t0_kref+0x11c:   	sth	%l6, [%i1 - 2]
	.word	0xdd3e7fe8	! t0_kref+0x120:   	std	%f14, [%i1 - 0x18]
	.word	0xdd1e0000	! t0_kref+0x124:   	ldd	[%i0], %f14
	.word	0x921cc017	! t0_kref+0x128:   	xor	%l3, %l7, %o1
	.word	0xa1a0054c	! t0_kref+0x12c:   	fsqrtd	%f12, %f16
	.word	0x9db406ad	! t0_kref+0x130:   	fmul8x16al	%f16, %f13, %f14
	.word	0x9665f02c	! t0_kref+0x134:   	subc	%l7, -0xfd4, %o3
	.word	0xd9be1a1b	! t0_kref+0x138:   	stda	%f12, [%i0 + %i3]0xd0
	.word	0xa1a3c8ac	! t0_kref+0x13c:   	fsubs	%f15, %f12, %f16
	.word	0xc5ee5016	! t0_kref+0x140:   	prefetcha	%i1 + %l6, 2
	.word	0xa1a01090	! t0_kref+0x144:   	fxtos	%f16, %f16
	.word	0xf83e3ff0	! t0_kref+0x148:   	std	%i4, [%i0 - 0x10]
	.word	0x9065e9dc	! t0_kref+0x14c:   	subc	%l7, 0x9dc, %o0
	.word	0xaaf5f727	! t0_kref+0x150:   	udivcc	%l7, -0x8d9, %l5
	.word	0xe62e601a	! t0_kref+0x154:   	stb	%l3, [%i1 + 0x1a]
	.word	0xe46e8019	! t0_kref+0x158:   	ldstub	[%i2 + %i1], %l2
	.word	0xa1a408af	! t0_kref+0x15c:   	fsubs	%f16, %f15, %f16
	.word	0xdc270005	! t0_kref+0x160:   	st	%sp, [%i4 + %g5]
	.word	0x9fa0052e	! t0_kref+0x164:   	fsqrts	%f14, %f15
	.word	0x9da0054e	! t0_kref+0x168:   	fsqrtd	%f14, %f14
	.word	0xd4801019	! t0_kref+0x16c:   	lda	[%g0 + %i1]0x80, %o2
	.word	0xa6da0014	! t0_kref+0x170:   	smulcc	%o0, %l4, %l3
	.word	0xa1a40850	! t0_kref+0x174:   	faddd	%f16, %f16, %f16
	.word	0xadb4c033	! t0_kref+0x178:   	edge8n	%l3, %l3, %l6
	.word	0x9134c013	! t0_kref+0x17c:   	srl	%l3, %l3, %o0
	.word	0xabb58037	! t0_kref+0x180:   	edge8n	%l6, %l7, %l5
	.word	0xa1b40e80	! t0_kref+0x184:   	fsrc1	%f16, %f16
	.word	0x81ab4ab1	! t0_kref+0x188:   	fcmpes	%fcc0, %f13, %f17
	.word	0xefee501b	! t0_kref+0x18c:   	prefetcha	%i1 + %i3, 23
	.word	0xa7b20077	! t0_kref+0x190:   	edge8ln	%o0, %l7, %l3
	.word	0x94fdc008	! t0_kref+0x194:   	sdivcc	%l7, %o0, %o2
	.word	0x99a80031	! t0_kref+0x198:   	fmovsn	%fcc0, %f17, %f12
	.word	0xa41c8015	! t0_kref+0x19c:   	xor	%l2, %l5, %l2
	.word	0x8143c000	! t0_kref+0x1a0:   	stbar
	.word	0xc3ee5012	! t0_kref+0x1a4:   	prefetcha	%i1 + %l2, 1
	.word	0xd020a000	! t0_kref+0x1a8:   	st	%o0, [%g2]
	.word	0xac75c014	! t0_kref+0x1ac:   	udiv	%l7, %l4, %l6
	.word	0x99a0004c	! t0_kref+0x1b0:   	fmovd	%f12, %f12
	.word	0x9ba3492c	! t0_kref+0x1b4:   	fmuls	%f13, %f12, %f13
	.word	0x963ceff9	! t0_kref+0x1b8:   	xnor	%l3, 0xff9, %o3
	.word	0x99a00550	! t0_kref+0x1bc:   	fsqrtd	%f16, %f12
	.word	0x28480003	! t0_kref+0x1c0:   	bleu,a,pt	%icc, _kref+0x1cc
	.word	0xa61ca29f	! t0_kref+0x1c4:   	xor	%l2, 0x29f, %l3
	.word	0xe120a000	! t0_kref+0x1c8:   	st	%f16, [%g2]
	.word	0xd046200c	! t0_kref+0x1cc:   	ldsw	[%i0 + 0xc], %o0
	.word	0x81dae432	! t0_kref+0x1d0:   	flush	%o3 + 0x432
	.word	0xc51f4005	! t0_kref+0x1d4:   	ldd	[%i5 + %g5], %f2
	.word	0xc9ee5014	! t0_kref+0x1d8:   	prefetcha	%i1 + %l4, 4
	.word	0x99a389cc	! t0_kref+0x1dc:   	fdivd	%f14, %f12, %f12
	.word	0x3f800007	! t0_kref+0x1e0:   	fbo,a	_kref+0x1fc
	.word	0x93b3858e	! t0_kref+0x1e4:   	fcmpgt32	%f14, %f14, %o1
	.word	0x29800004	! t0_kref+0x1e8:   	fbl,a	_kref+0x1f8
	.word	0x99a38850	! t0_kref+0x1ec:   	faddd	%f14, %f16, %f12
	.word	0xd026200c	! t0_kref+0x1f0:   	st	%o0, [%i0 + 0xc]
	.word	0xad2d2001	! t0_kref+0x1f4:   	sll	%l4, 0x1, %l6
	.word	0x81dbf7a2	! t0_kref+0x1f8:   	flush	%o7 - 0x85e
	.word	0x96aa0012	! t0_kref+0x1fc:   	andncc	%o0, %l2, %o3
	.word	0x9295229c	! t0_kref+0x200:   	orcc	%l4, 0x29c, %o1
	.word	0x941dc012	! t0_kref+0x204:   	xor	%l7, %l2, %o2
	.word	0x93b20016	! t0_kref+0x208:   	edge8	%o0, %l6, %o1
	.word	0x9fb007ae	! t0_kref+0x20c:   	fpackfix	%f14, %f15
	.word	0xa6657c73	! t0_kref+0x210:   	subc	%l5, -0x38d, %l3
	.word	0x9da0052d	! t0_kref+0x214:   	fsqrts	%f13, %f14
	.word	0xe820a01c	! t0_kref+0x218:   	st	%l4, [%g2 + 0x1c]
	.word	0xaf148014	! t0_kref+0x21c:   	taddcctv	%l2, %l4, %l7
	.word	0x9de3bfa0	! t0_kref+0x220:   	save	%sp, -0x60, %sp
	.word	0xbaaec018	! t0_kref+0x224:   	andncc	%i3, %i0, %i5
	.word	0xa7ee2e6d	! t0_kref+0x228:   	restore	%i0, 0xe6d, %l3
	.word	0x9da0014e	! t0_kref+0x22c:   	fabsd	%f14, %f14
	.word	0xf36e401a	! t0_kref+0x230:   	prefetch	%i1 + %i2, 25
	.word	0x99a40950	! t0_kref+0x234:   	fmuld	%f16, %f16, %f12
	.word	0x9fa018ce	! t0_kref+0x238:   	fdtos	%f14, %f15
	.word	0x9ba018ce	! t0_kref+0x23c:   	fdtos	%f14, %f13
	.word	0xa1a4482e	! t0_kref+0x240:   	fadds	%f17, %f14, %f16
	.word	0xac7db16d	! t0_kref+0x244:   	sdiv	%l6, -0xe93, %l6
	.word	0xaef20012	! t0_kref+0x248:   	udivcc	%o0, %l2, %l7
	.word	0x90420015	! t0_kref+0x24c:   	addc	%o0, %l5, %o0
	.word	0xa1b306cc	! t0_kref+0x250:   	fmul8sux16	%f12, %f12, %f16
	.word	0xa1b30e4c	! t0_kref+0x254:   	fxnor	%f12, %f12, %f16
	.word	0xe1a71019	! t0_kref+0x258:   	sta	%f16, [%i4 + %i1]0x80
	.word	0xeb68a002	! t0_kref+0x25c:   	prefetch	%g2 + 2, 21
	.word	0xe1063fe0	! t0_kref+0x260:   	ld	[%i0 - 0x20], %f16
	.word	0x9ba3c8ac	! t0_kref+0x264:   	fsubs	%f15, %f12, %f13
	.word	0xdb871019	! t0_kref+0x268:   	lda	[%i4 + %i1]0x80, %f13
	.word	0xa1a309ce	! t0_kref+0x26c:   	fdivd	%f12, %f14, %f16
	.word	0x99a00531	! t0_kref+0x270:   	fsqrts	%f17, %f12
	.word	0xa1a30850	! t0_kref+0x274:   	faddd	%f12, %f16, %f16
	.word	0xadb48015	! t0_kref+0x278:   	edge8	%l2, %l5, %l6
	.word	0x99a4092c	! t0_kref+0x27c:   	fmuls	%f16, %f12, %f12
	.word	0x9fa018cc	! t0_kref+0x280:   	fdtos	%f12, %f15
	.word	0xecde5000	! t0_kref+0x284:   	ldxa	[%i1]0x80, %l6
	.word	0x90c4ab98	! t0_kref+0x288:   	addccc	%l2, 0xb98, %o0
	.word	0x99a0054c	! t0_kref+0x28c:   	fsqrtd	%f12, %f12
	.word	0x99a3094c	! t0_kref+0x290:   	fmuld	%f12, %f12, %f12
	.word	0x3e800008	! t0_kref+0x294:   	bvc,a	_kref+0x2b4
	.word	0xac454015	! t0_kref+0x298:   	addc	%l5, %l5, %l6
	.word	0x96622172	! t0_kref+0x29c:   	subc	%o0, 0x172, %o3
	.word	0xe1bf5019	! t0_kref+0x2a0:   	stda	%f16, [%i5 + %i1]0x80
	.word	0xaa74bc29	! t0_kref+0x2a4:   	udiv	%l2, -0x3d7, %l5
	.word	0xdbf61015	! t0_kref+0x2a8:   	casxa	[%i0]0x80, %l5, %o5
	.word	0xa1a40950	! t0_kref+0x2ac:   	fmuld	%f16, %f16, %f16
	.word	0x905cc017	! t0_kref+0x2b0:   	smul	%l3, %l7, %o0
	.word	0xaa048014	! t0_kref+0x2b4:   	add	%l2, %l4, %l5
	.word	0x929cfa18	! t0_kref+0x2b8:   	xorcc	%l3, -0x5e8, %o1
	.word	0x8143e02b	! t0_kref+0x2bc:   	membar	0x2b
	.word	0x8143c000	! t0_kref+0x2c0:   	stbar
	.word	0x9fa3c82e	! t0_kref+0x2c4:   	fadds	%f15, %f14, %f15
	.word	0xa705ebd7	! t0_kref+0x2c8:   	taddcc	%l7, 0xbd7, %l3
	.word	0x908d4012	! t0_kref+0x2cc:   	andcc	%l5, %l2, %o0
	.word	0x3a800008	! t0_kref+0x2d0:   	bcc,a	_kref+0x2f0
	.word	0xdd1fbc60	! t0_kref+0x2d4:   	ldd	[%fp - 0x3a0], %f14
	.word	0xe4263ff4	! t0_kref+0x2d8:   	st	%l2, [%i0 - 0xc]
	.word	0xd83e3ff8	! t0_kref+0x2dc:   	std	%o4, [%i0 - 8]
	.word	0xd83e001d	! t0_kref+0x2e0:   	std	%o4, [%i0 + %i5]
	.word	0xdd3e7ff8	! t0_kref+0x2e4:   	std	%f14, [%i1 - 8]
	.word	0xa3b38eef	! t0_kref+0x2e8:   	fornot2s	%f14, %f15, %f17
	.word	0xe0516adc	! t0_kref+0x2ec:   	ldsh	[%g5 + 0xadc], %l0
	.word	0xa65dc012	! t0_kref+0x2f0:   	smul	%l7, %l2, %l3
	.word	0x35800002	! t0_kref+0x2f4:   	fbue,a	_kref+0x2fc
	.word	0xe968a08a	! t0_kref+0x2f8:   	prefetch	%g2 + 0x8a, 20
	.word	0x81ab8a4c	! t0_kref+0x2fc:   	fcmpd	%fcc0, %f14, %f12
	.word	0xa3b00c20	! t0_kref+0x300:   	fzeros	%f17
	.word	0x99a3882c	! t0_kref+0x304:   	fadds	%f14, %f12, %f12
	.word	0xae5de9ed	! t0_kref+0x308:   	smul	%l7, 0x9ed, %l7
	.word	0xdd380018	! t0_kref+0x30c:   	std	%f14, [%g0 + %i0]
	.word	0x99a388d0	! t0_kref+0x310:   	fsubd	%f14, %f16, %f12
	.word	0xd900a00c	! t0_kref+0x314:   	ld	[%g2 + 0xc], %f12
	.word	0xa81a24a7	! t0_kref+0x318:   	xor	%o0, 0x4a7, %l4
	.word	0x30800008	! t0_kref+0x31c:   	ba,a	_kref+0x33c
	.word	0x8143c000	! t0_kref+0x320:   	stbar
	.word	0x3d800008	! t0_kref+0x324:   	fbule,a	_kref+0x344
	.word	0xa7320015	! t0_kref+0x328:   	srl	%o0, %l5, %l3
	.word	0x9ba0052f	! t0_kref+0x32c:   	fsqrts	%f15, %f13
	.word	0x9db3862c	! t0_kref+0x330:   	fmul8x16	%f14, %f12, %f14
	.word	0xac9c8013	! t0_kref+0x334:   	xorcc	%l2, %l3, %l6
	.word	0xac44b52f	! t0_kref+0x338:   	addc	%l2, -0xad1, %l6
	.word	0x9fa0002d	! t0_kref+0x33c:   	fmovs	%f13, %f15
	.word	0xf83e2000	! t0_kref+0x340:   	std	%i4, [%i0]
	.word	0xebee501d	! t0_kref+0x344:   	prefetcha	%i1 + %i5, 21
	.word	0xa1a0012f	! t0_kref+0x348:   	fabss	%f15, %f16
	.word	0xacfce019	! t0_kref+0x34c:   	sdivcc	%l3, 0x19, %l6
	.word	0xa1a3c931	! t0_kref+0x350:   	fmuls	%f15, %f17, %f16
	.word	0x99a0052f	! t0_kref+0x354:   	fsqrts	%f15, %f12
	.word	0x9075c013	! t0_kref+0x358:   	udiv	%l7, %l3, %o0
	.word	0xe106601c	! t0_kref+0x35c:   	ld	[%i1 + 0x1c], %f16
	.word	0x22480006	! t0_kref+0x360:   	be,a,pt	%icc, _kref+0x378
	.word	0xe9ee101a	! t0_kref+0x364:   	prefetcha	%i0 + %i2, 20
	.word	0xab400000	! t0_kref+0x368:   	mov	%y, %l5
	.word	0x8143c000	! t0_kref+0x36c:   	stbar
	.word	0x3d480003	! t0_kref+0x370:   	fbule,a,pt	%fcc0, _kref+0x37c
	.word	0xd920a034	! t0_kref+0x374:   	st	%f12, [%g2 + 0x34]
	.word	0xdda71018	! t0_kref+0x378:   	sta	%f14, [%i4 + %i0]0x80
	.word	0xd68e9019	! t0_kref+0x37c:   	lduba	[%i2 + %i1]0x80, %o3
	.word	0x9ba00530	! t0_kref+0x380:   	fsqrts	%f16, %f13
	.word	0x35800003	! t0_kref+0x384:   	fbue,a	_kref+0x390
	.word	0xa1a0102d	! t0_kref+0x388:   	fstox	%f13, %f16
	.word	0x32800005	! t0_kref+0x38c:   	bne,a	_kref+0x3a0
	.word	0xe300a03c	! t0_kref+0x390:   	ld	[%g2 + 0x3c], %f17
	.word	0x29800002	! t0_kref+0x394:   	fbl,a	_kref+0x39c
	.word	0xa3b38c70	! t0_kref+0x398:   	fnors	%f14, %f16, %f17
	.word	0x9fa0052d	! t0_kref+0x39c:   	fsqrts	%f13, %f15
	.word	0xb810200c	! t0_kref+0x3a0:   	mov	0xc, %i4
	.word	0xd02e3ffd	! t0_kref+0x3a4:   	stb	%o0, [%i0 - 3]
	.word	0x9ba388af	! t0_kref+0x3a8:   	fsubs	%f14, %f15, %f13
	.word	0xa1a3094e	! t0_kref+0x3ac:   	fmuld	%f12, %f14, %f16
	.word	0xe826401c	! t0_kref+0x3b0:   	st	%l4, [%i1 + %i4]
	.word	0x9da00550	! t0_kref+0x3b4:   	fsqrtd	%f16, %f14
	.word	0xdb801019	! t0_kref+0x3b8:   	lda	[%g0 + %i1]0x80, %f13
	.word	0xa9b480b7	! t0_kref+0x3bc:   	edge16n	%l2, %l7, %l4
	.word	0x9ba000ac	! t0_kref+0x3c0:   	fnegs	%f12, %f13
	.word	0xe808a01b	! t0_kref+0x3c4:   	ldub	[%g2 + 0x1b], %l4
	.word	0xa1a0054c	! t0_kref+0x3c8:   	fsqrtd	%f12, %f16
	.word	0xabb20177	! t0_kref+0x3cc:   	edge32ln	%o0, %l7, %l5
	.word	0xd0360000	! t0_kref+0x3d0:   	sth	%o0, [%i0]
	.word	0x29800002	! t0_kref+0x3d4:   	fbl,a	_kref+0x3dc
	.word	0x9da01090	! t0_kref+0x3d8:   	fxtos	%f16, %f14
	.word	0xae1a0013	! t0_kref+0x3dc:   	xor	%o0, %l3, %l7
	.word	0xd9b81019	! t0_kref+0x3e0:   	stda	%f12, [%g0 + %i1]0x80
	.word	0xebee101c	! t0_kref+0x3e4:   	prefetcha	%i0 + %i4, 21
	.word	0x99a0054c	! t0_kref+0x3e8:   	fsqrtd	%f12, %f12
	.word	0x968d60d7	! t0_kref+0x3ec:   	andcc	%l5, 0xd7, %o3
	.word	0x81ab0ad0	! t0_kref+0x3f0:   	fcmped	%fcc0, %f12, %f16
	.word	0x9db40a50	! t0_kref+0x3f4:   	fpadd32	%f16, %f16, %f14
	.word	0x81ab8aae	! t0_kref+0x3f8:   	fcmpes	%fcc0, %f14, %f14
	.word	0xd026401c	! t0_kref+0x3fc:   	st	%o0, [%i1 + %i4]
	.word	0xa1a0054e	! t0_kref+0x400:   	fsqrtd	%f14, %f16
	.word	0xef68a00a	! t0_kref+0x404:   	prefetch	%g2 + 0xa, 23
	.word	0xc9ee1016	! t0_kref+0x408:   	prefetcha	%i0 + %l6, 4
	.word	0xe1380018	! t0_kref+0x40c:   	std	%f16, [%g0 + %i0]
	.word	0xa51dec93	! t0_kref+0x410:   	tsubcctv	%l7, 0xc93, %l2
	.word	0x32480002	! t0_kref+0x414:   	bne,a,pt	%icc, _kref+0x41c
	.word	0x972a201b	! t0_kref+0x418:   	sll	%o0, 0x1b, %o3
	.word	0x9fa000ad	! t0_kref+0x41c:   	fnegs	%f13, %f15
	.word	0x31480002	! t0_kref+0x420:   	fba,a,pt	%fcc0, _kref+0x428
	.word	0xa52dc017	! t0_kref+0x424:   	sll	%l7, %l7, %l2
	.word	0xd83e6000	! t0_kref+0x428:   	std	%o4, [%i1]
	.word	0xe0ee501a	! t0_kref+0x42c:   	ldstuba	[%i1 + %i2]0x80, %l0
	.word	0x99b38c90	! t0_kref+0x430:   	fandnot2	%f14, %f16, %f12
	.word	0x94fd8013	! t0_kref+0x434:   	sdivcc	%l6, %l3, %o2
	.word	0x81ac0ab1	! t0_kref+0x438:   	fcmpes	%fcc0, %f16, %f17
	.word	0x9105294c	! t0_kref+0x43c:   	taddcc	%l4, 0x94c, %o0
	.word	0x9da409d0	! t0_kref+0x440:   	fdivd	%f16, %f16, %f14
	.word	0x925def5c	! t0_kref+0x444:   	smul	%l7, 0xf5c, %o1
	.word	0xd028a023	! t0_kref+0x448:   	stb	%o0, [%g2 + 0x23]
	.word	0xabb58037	! t0_kref+0x44c:   	edge8n	%l6, %l7, %l5
	.word	0x99a0052e	! t0_kref+0x450:   	fsqrts	%f14, %f12
	.word	0xa3a018cc	! t0_kref+0x454:   	fdtos	%f12, %f17
	.word	0xa474c012	! t0_kref+0x458:   	udiv	%l3, %l2, %l2
	.word	0xa4f235e8	! t0_kref+0x45c:   	udivcc	%o0, -0xa18, %l2
	.word	0x24800002	! t0_kref+0x460:   	ble,a	_kref+0x468
	.word	0xae9cc017	! t0_kref+0x464:   	xorcc	%l3, %l7, %l7
	.word	0xaa9c8017	! t0_kref+0x468:   	xorcc	%l2, %l7, %l5
	.word	0x2e800001	! t0_kref+0x46c:   	bvs,a	_kref+0x470
	.word	0xf96e7fe0	! t0_kref+0x470:   	prefetch	%i1 - 0x20, 28
	.word	0xe6367ff2	! t0_kref+0x474:   	sth	%l3, [%i1 - 0xe]
	.word	0x9ba00031	! t0_kref+0x478:   	fmovs	%f17, %f13
	.word	0xc12e200c	! t0_kref+0x47c:   	st	%fsr, [%i0 + 0xc]
	.word	0xe668a031	! t0_kref+0x480:   	ldstub	[%g2 + 0x31], %l3
	.word	0x99b4472e	! t0_kref+0x484:   	fmuld8ulx16	%f17, %f14, %f12
	.word	0x9244e21d	! t0_kref+0x488:   	addc	%l3, 0x21d, %o1
	.word	0x28800001	! t0_kref+0x48c:   	bleu,a	_kref+0x490
	.word	0x9fa018cc	! t0_kref+0x490:   	fdtos	%f12, %f15
	.word	0xaa92272c	! t0_kref+0x494:   	orcc	%o0, 0x72c, %l5
	.word	0xa7b4040e	! t0_kref+0x498:   	fcmple16	%f16, %f14, %l3
	.word	0xe8364000	! t0_kref+0x49c:   	sth	%l4, [%i1]
	.word	0xaf400000	! t0_kref+0x4a0:   	mov	%y, %l7
	.word	0xa4650013	! t0_kref+0x4a4:   	subc	%l4, %l3, %l2
	.word	0xd9380019	! t0_kref+0x4a8:   	std	%f12, [%g0 + %i1]
	.word	0x2f3b21a2	! t0_kref+0x4ac:   	sethi	%hi(0xec868800), %l7
	.word	0xe6266010	! t0_kref+0x4b0:   	st	%l3, [%i1 + 0x10]
	.word	0x9444e866	! t0_kref+0x4b4:   	addc	%l3, 0x866, %o2
	.word	0xf83e2000	! t0_kref+0x4b8:   	std	%i4, [%i0]
	.word	0x9ba0002f	! t0_kref+0x4bc:   	fmovs	%f15, %f13
	.word	0xec28a033	! t0_kref+0x4c0:   	stb	%l6, [%g2 + 0x33]
	.word	0x8610200e	! t0_kref+0x4c4:   	mov	0xe, %g3
	.word	0x86a0e001	! t0_kref+0x4c8:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t0_kref+0x4cc:   	be,a	_kref+0x4f4
	.word	0xee8e501a	! t0_kref+0x4d0:   	lduba	[%i1 + %i2]0x80, %l7
	.word	0xdf26201c	! t0_kref+0x4d4:   	st	%f15, [%i0 + 0x1c]
	.word	0x99a00550	! t0_kref+0x4d8:   	fsqrtd	%f16, %f12
	.word	0x9fa409ad	! t0_kref+0x4dc:   	fdivs	%f16, %f13, %f15
	.word	0xe300a00c	! t0_kref+0x4e0:   	ld	[%g2 + 0xc], %f17
	.word	0x965d2fca	! t0_kref+0x4e4:   	smul	%l4, 0xfca, %o3
	.word	0xe6262018	! t0_kref+0x4e8:   	st	%l3, [%i0 + 0x18]
	.word	0x25800004	! t0_kref+0x4ec:   	fblg,a	_kref+0x4fc
	.word	0xee767fe8	! t0_kref+0x4f0:   	stx	%l7, [%i1 - 0x18]
	.word	0xd9bf5019	! t0_kref+0x4f4:   	stda	%f12, [%i5 + %i1]0x80
	.word	0xd07e4000	! t0_kref+0x4f8:   	swap	[%i1], %o0
	.word	0x28480008	! t0_kref+0x4fc:   	bleu,a,pt	%icc, _kref+0x51c
	.word	0xd9066018	! t0_kref+0x500:   	ld	[%i1 + 0x18], %f12
	.word	0x25800006	! t0_kref+0x504:   	fblg,a	_kref+0x51c
	.word	0x99b3c6ad	! t0_kref+0x508:   	fmul8x16al	%f15, %f13, %f12
	.word	0x34800008	! t0_kref+0x50c:   	bg,a	_kref+0x52c
	.word	0x9db40e0c	! t0_kref+0x510:   	fand	%f16, %f12, %f14
	.word	0xaab48008	! t0_kref+0x514:   	orncc	%l2, %o0, %l5
	.word	0xd010a02c	! t0_kref+0x518:   	lduh	[%g2 + 0x2c], %o0
	.word	0xa1b30a10	! t0_kref+0x51c:   	fpadd16	%f12, %f16, %f16
	.word	0xe8270019	! t0_kref+0x520:   	st	%l4, [%i4 + %i1]
	.word	0xaead0015	! t0_kref+0x524:   	andncc	%l4, %l5, %l7
	.word	0xd2865000	! t0_kref+0x528:   	lda	[%i1]0x80, %o1
	.word	0x907cc017	! t0_kref+0x52c:   	sdiv	%l3, %l7, %o0
	.word	0x9da018ce	! t0_kref+0x530:   	fdtos	%f14, %f14
	.word	0xa1a4084c	! t0_kref+0x534:   	faddd	%f16, %f12, %f16
	.word	0xa1a3c8b0	! t0_kref+0x538:   	fsubs	%f15, %f16, %f16
	.word	0xea30a026	! t0_kref+0x53c:   	sth	%l5, [%g2 + 0x26]
	.word	0xd86e600d	! t0_kref+0x540:   	ldstub	[%i1 + 0xd], %o4
	.word	0xa6ad3af2	! t0_kref+0x544:   	andncc	%l4, -0x50e, %l3
	.word	0x22800003	! t0_kref+0x548:   	be,a	_kref+0x554
	.word	0xaa8d2299	! t0_kref+0x54c:   	andcc	%l4, 0x299, %l5
	.word	0x9db40af0	! t0_kref+0x550:   	fpsub32s	%f16, %f16, %f14
	.word	0xec367fec	! t0_kref+0x554:   	sth	%l6, [%i1 - 0x14]
	.word	0xae8cb0b4	! t0_kref+0x558:   	andcc	%l2, -0xf4c, %l7
	.word	0xee262010	! t0_kref+0x55c:   	st	%l7, [%i0 + 0x10]
	.word	0xe13e3ff0	! t0_kref+0x560:   	std	%f16, [%i0 - 0x10]
	.word	0xe4a6501c	! t0_kref+0x564:   	sta	%l2, [%i1 + %i4]0x80
	.word	0xac74e610	! t0_kref+0x568:   	udiv	%l3, 0x610, %l6
	.word	0x99a4084e	! t0_kref+0x56c:   	faddd	%f16, %f14, %f12
	.word	0xc5ee5012	! t0_kref+0x570:   	prefetcha	%i1 + %l2, 2
	.word	0xaef50015	! t0_kref+0x574:   	udivcc	%l4, %l5, %l7
	.word	0x99a308ce	! t0_kref+0x578:   	fsubd	%f12, %f14, %f12
	.word	0x9da4084e	! t0_kref+0x57c:   	faddd	%f16, %f14, %f14
	.word	0x2d800006	! t0_kref+0x580:   	fbg,a	_kref+0x598
	.word	0x81dbc010	! t0_kref+0x584:   	flush	%o7 + %l0
	.word	0x27480007	! t0_kref+0x588:   	fbul,a,pt	%fcc0, _kref+0x5a4
	.word	0xae8c8016	! t0_kref+0x58c:   	andcc	%l2, %l6, %l7
	.word	0x95418000	! t0_kref+0x590:   	mov	%fprs, %o2
	.word	0x9ba01a4e	! t0_kref+0x594:   	fdtoi	%f14, %f13
	.word	0x9ba0052f	! t0_kref+0x598:   	fsqrts	%f15, %f13
	.word	0x9da388b1	! t0_kref+0x59c:   	fsubs	%f14, %f17, %f14
	.word	0xa5b3058c	! t0_kref+0x5a0:   	fcmpgt32	%f12, %f12, %l2
	.word	0x1331dcc0	! t0_kref+0x5a4:   	sethi	%hi(0xc7730000), %o1
	.word	0xea280019	! t0_kref+0x5a8:   	stb	%l5, [%g0 + %i1]
	.word	0xf1ee101b	! t0_kref+0x5ac:   	prefetcha	%i0 + %i3, 24
	.word	0xa6acb620	! t0_kref+0x5b0:   	andncc	%l2, -0x9e0, %l3
	.word	0xc368a088	! t0_kref+0x5b4:   	prefetch	%g2 + 0x88, 1
	.word	0x9ba0012e	! t0_kref+0x5b8:   	fabss	%f14, %f13
	.word	0xa1b00cce	! t0_kref+0x5bc:   	fnot2	%f14, %f16
	.word	0x28480005	! t0_kref+0x5c0:   	bleu,a,pt	%icc, _kref+0x5d4
	.word	0xa1b30d0c	! t0_kref+0x5c4:   	fandnot1	%f12, %f12, %f16
	.word	0xa8854008	! t0_kref+0x5c8:   	addcc	%l5, %o0, %l4
	.word	0xaf418000	! t0_kref+0x5cc:   	mov	%fprs, %l7
	.word	0xa8a5c012	! t0_kref+0x5d0:   	subcc	%l7, %l2, %l4
	.word	0x2c800006	! t0_kref+0x5d4:   	bneg,a	_kref+0x5ec
	.word	0xaf400000	! t0_kref+0x5d8:   	mov	%y, %l7
	.word	0x3b480006	! t0_kref+0x5dc:   	fble,a,pt	%fcc0, _kref+0x5f4
	.word	0xad2c8017	! t0_kref+0x5e0:   	sll	%l2, %l7, %l6
	.word	0xd7003f78	! t0_kref+0x5e4:   	ld	[%g0 - 0x88], %f11
	.word	0x948d4014	! t0_kref+0x5e8:   	andcc	%l5, %l4, %o2
	.word	0x8143c000	! t0_kref+0x5ec:   	stbar
	.word	0xd25e4000	! t0_kref+0x5f0:   	ldx	[%i1], %o1
	.word	0xac0dc012	! t0_kref+0x5f4:   	and	%l7, %l2, %l6
	.word	0x91b20032	! t0_kref+0x5f8:   	edge8n	%o0, %l2, %o0
	.word	0x9475abb5	! t0_kref+0x5fc:   	udiv	%l6, 0xbb5, %o2
	.word	0x9db40f8e	! t0_kref+0x600:   	for	%f16, %f14, %f14
	.word	0xe968a04f	! t0_kref+0x604:   	prefetch	%g2 + 0x4f, 20
	.word	0x3f800003	! t0_kref+0x608:   	fbo,a	_kref+0x614
	.word	0xdf20a004	! t0_kref+0x60c:   	st	%f15, [%g2 + 4]
	.word	0xea00a03c	! t0_kref+0x610:   	ld	[%g2 + 0x3c], %l5
	.word	0xe6467ff4	! t0_kref+0x614:   	ldsw	[%i1 - 0xc], %l3
	.word	0xec30a002	! t0_kref+0x618:   	sth	%l6, [%g2 + 2]
	.word	0xe630a026	! t0_kref+0x61c:   	sth	%l3, [%g2 + 0x26]
	.word	0x9fa3882e	! t0_kref+0x620:   	fadds	%f14, %f14, %f15
	.word	0x9ba408ac	! t0_kref+0x624:   	fsubs	%f16, %f12, %f13
	.word	0x9fb0076e	! t0_kref+0x628:   	fpack16	%f14, %f15
	.word	0xd83e7ff0	! t0_kref+0x62c:   	std	%o4, [%i1 - 0x10]
	.word	0x9da389d0	! t0_kref+0x630:   	fdivd	%f14, %f16, %f14
	.word	0x81da24e2	! t0_kref+0x634:   	flush	%o0 + 0x4e2
	.word	0x99a0054e	! t0_kref+0x638:   	fsqrtd	%f14, %f12
	.word	0x99a0052c	! t0_kref+0x63c:   	fsqrts	%f12, %f12
	.word	0x3c480003	! t0_kref+0x640:   	bpos,a,pt	%icc, _kref+0x64c
	.word	0x99a4094e	! t0_kref+0x644:   	fmuld	%f16, %f14, %f12
	.word	0x99b00cce	! t0_kref+0x648:   	fnot2	%f14, %f12
	.word	0x99b3c6ae	! t0_kref+0x64c:   	fmul8x16al	%f15, %f14, %f12
	.word	0xd0263fec	! t0_kref+0x650:   	st	%o0, [%i0 - 0x14]
	.word	0x8143e02c	! t0_kref+0x654:   	membar	0x2c
	.word	0xe2680018	! t0_kref+0x658:   	ldstub	[%g0 + %i0], %l1
	.word	0xe49e501d	! t0_kref+0x65c:   	ldda	[%i1 + %i5]0x80, %l2
	.word	0x903ca9da	! t0_kref+0x660:   	xnor	%l2, 0x9da, %o0
	.word	0xaa5db678	! t0_kref+0x664:   	smul	%l6, -0x988, %l5
	.word	0x27480005	! t0_kref+0x668:   	fbul,a,pt	%fcc0, _kref+0x67c
	.word	0xa1a308ad	! t0_kref+0x66c:   	fsubs	%f12, %f13, %f16
	.word	0xd9e65013	! t0_kref+0x670:   	casa	[%i1]0x80, %l3, %o4
	.word	0x99a409cc	! t0_kref+0x674:   	fdivd	%f16, %f12, %f12
	.word	0xa8f22904	! t0_kref+0x678:   	udivcc	%o0, 0x904, %l4
	.word	0x2f0b7589	! t0_kref+0x67c:   	sethi	%hi(0x2dd62400), %l7
	.word	0xac04c013	! t0_kref+0x680:   	add	%l3, %l3, %l6
	.word	0xdd1f4018	! t0_kref+0x684:   	ldd	[%i5 + %i0], %f14
	.word	0x9da0012c	! t0_kref+0x688:   	fabss	%f12, %f14
	.word	0xee30a006	! t0_kref+0x68c:   	sth	%l7, [%g2 + 6]
	.word	0x9225f5c2	! t0_kref+0x690:   	sub	%l7, -0xa3e, %o1
	.word	0xa3b44dec	! t0_kref+0x694:   	fnands	%f17, %f12, %f17
	.word	0xaa6231ee	! t0_kref+0x698:   	subc	%o0, -0xe12, %l5
	.word	0x945db396	! t0_kref+0x69c:   	smul	%l6, -0xc6a, %o2
	.word	0xa404c013	! t0_kref+0x6a0:   	add	%l3, %l3, %l2
	.word	0x94b22c17	! t0_kref+0x6a4:   	orncc	%o0, 0xc17, %o2
	.word	0xe1380018	! t0_kref+0x6a8:   	std	%f16, [%g0 + %i0]
	.word	0xe830a00c	! t0_kref+0x6ac:   	sth	%l4, [%g2 + 0xc]
	.word	0x25800005	! t0_kref+0x6b0:   	fblg,a	_kref+0x6c4
	.word	0xee4e201f	! t0_kref+0x6b4:   	ldsb	[%i0 + 0x1f], %l7
	.word	0x32800006	! t0_kref+0x6b8:   	bne,a	_kref+0x6d0
	.word	0x92b5e153	! t0_kref+0x6bc:   	orncc	%l7, 0x153, %o1
	.word	0xa1a00530	! t0_kref+0x6c0:   	fsqrts	%f16, %f16
	.word	0xa3a00531	! t0_kref+0x6c4:   	fsqrts	%f17, %f17
	.word	0xe8d81018	! t0_kref+0x6c8:   	ldxa	[%g0 + %i0]0x80, %l4
	.word	0x39800003	! t0_kref+0x6cc:   	fbuge,a	_kref+0x6d8
	.word	0x9db38750	! t0_kref+0x6d0:   	fpack32	%f14, %f16, %f14
	.word	0x9fa00530	! t0_kref+0x6d4:   	fsqrts	%f16, %f15
	.word	0x9405aa78	! t0_kref+0x6d8:   	add	%l6, 0xa78, %o2
	.word	0x9da0002d	! t0_kref+0x6dc:   	fmovs	%f13, %f14
	.word	0xb4102009	! t0_kref+0x6e0:   	mov	0x9, %i2
	.word	0x8143c000	! t0_kref+0x6e4:   	stbar
	.word	0x99a4094c	! t0_kref+0x6e8:   	fmuld	%f16, %f12, %f12
	.word	0xe13e6018	! t0_kref+0x6ec:   	std	%f16, [%i1 + 0x18]
	.word	0xacb5bed9	! t0_kref+0x6f0:   	orncc	%l6, -0x127, %l6
	.word	0x2b800008	! t0_kref+0x6f4:   	fbug,a	_kref+0x714
	.word	0x94154008	! t0_kref+0x6f8:   	or	%l5, %o0, %o2
	.word	0xa3a3492f	! t0_kref+0x6fc:   	fmuls	%f13, %f15, %f17
	.word	0x905a37e8	! t0_kref+0x700:   	smul	%o0, -0x818, %o0
	.word	0xdf060000	! t0_kref+0x704:   	ld	[%i0], %f15
	.word	0x81dc800a	! t0_kref+0x708:   	flush	%l2 + %o2
	.word	0x96348013	! t0_kref+0x70c:   	orn	%l2, %l3, %o3
	.word	0xe01e2000	! t0_kref+0x710:   	ldd	[%i0], %l0
	.word	0xa1b3896e	! t0_kref+0x714:   	fpmerge	%f14, %f14, %f16
	.word	0x99a30830	! t0_kref+0x718:   	fadds	%f12, %f16, %f12
	.word	0x9de3bfa0	! t0_kref+0x71c:   	save	%sp, -0x60, %sp
	.word	0xb4b7347f	! t0_kref+0x720:   	orncc	%i4, -0xb81, %i2
	.word	0x95eec018	! t0_kref+0x724:   	restore	%i3, %i0, %o2
	.word	0x9da3c8af	! t0_kref+0x728:   	fsubs	%f15, %f15, %f14
	.word	0x972d0014	! t0_kref+0x72c:   	sll	%l4, %l4, %o3
	.word	0x9ba00531	! t0_kref+0x730:   	fsqrts	%f17, %f13
	.word	0x2f800002	! t0_kref+0x734:   	fbu,a	_kref+0x73c
	.word	0x99a408cc	! t0_kref+0x738:   	fsubd	%f16, %f12, %f12
	.word	0xaa1d3ff4	! t0_kref+0x73c:   	xor	%l4, -0xc, %l5
	.word	0xe62e7ffd	! t0_kref+0x740:   	stb	%l3, [%i1 - 3]
	.word	0xe3871018	! t0_kref+0x744:   	lda	[%i4 + %i0]0x80, %f17
	.word	0xa1a40950	! t0_kref+0x748:   	fmuld	%f16, %f16, %f16
	.word	0x2a800002	! t0_kref+0x74c:   	bcs,a	_kref+0x754
	.word	0x97b54016	! t0_kref+0x750:   	edge8	%l5, %l6, %o3
	.word	0xa1a308cc	! t0_kref+0x754:   	fsubd	%f12, %f12, %f16
	.word	0xabb3854e	! t0_kref+0x758:   	fcmpeq16	%f14, %f14, %l5
	.word	0xa1a4492c	! t0_kref+0x75c:   	fmuls	%f17, %f12, %f16
	.word	0x9505fda2	! t0_kref+0x760:   	taddcc	%l7, -0x25e, %o2
	.word	0x9db40df0	! t0_kref+0x764:   	fnands	%f16, %f16, %f14
	.word	0xa1a00550	! t0_kref+0x768:   	fsqrtd	%f16, %f16
	.word	0xdd3e401d	! t0_kref+0x76c:   	std	%f14, [%i1 + %i5]
	.word	0x9daa402d	! t0_kref+0x770:   	fmovse	%fcc0, %f13, %f14
	.word	0x9464b8e9	! t0_kref+0x774:   	subc	%l2, -0x717, %o2
	.word	0xdb801018	! t0_kref+0x778:   	lda	[%g0 + %i0]0x80, %f13
	.word	0xa5400000	! t0_kref+0x77c:   	mov	%y, %l2
	.word	0x949cc016	! t0_kref+0x780:   	xorcc	%l3, %l6, %o2
	.word	0xed68a009	! t0_kref+0x784:   	prefetch	%g2 + 9, 22
	.word	0xa67d3da3	! t0_kref+0x788:   	sdiv	%l4, -0x25d, %l3
	.word	0x9da0192f	! t0_kref+0x78c:   	fstod	%f15, %f14
	.word	0xd0200018	! t0_kref+0x790:   	st	%o0, [%g0 + %i0]
	.word	0x3f800003	! t0_kref+0x794:   	fbo,a	_kref+0x7a0
	.word	0xa1a0054c	! t0_kref+0x798:   	fsqrtd	%f12, %f16
	.word	0xa1a308ce	! t0_kref+0x79c:   	fsubd	%f12, %f14, %f16
	.word	0x81da7874	! t0_kref+0x7a0:   	flush	%o1 - 0x78c
	.word	0xf36e001b	! t0_kref+0x7a4:   	prefetch	%i0 + %i3, 25
	.word	0xec36401b	! t0_kref+0x7a8:   	sth	%l6, [%i1 + %i3]
	.word	0x96adb149	! t0_kref+0x7ac:   	andncc	%l6, -0xeb7, %o3
	.word	0xe1bf5019	! t0_kref+0x7b0:   	stda	%f16, [%i5 + %i1]0x80
	.word	0x3e800004	! t0_kref+0x7b4:   	bvc,a	_kref+0x7c4
	.word	0xab2d8014	! t0_kref+0x7b8:   	sll	%l6, %l4, %l5
	.word	0x81ddc013	! t0_kref+0x7bc:   	flush	%l7 + %l3
	.word	0xe448a002	! t0_kref+0x7c0:   	ldsb	[%g2 + 2], %l2
	.word	0xe81f4018	! t0_kref+0x7c4:   	ldd	[%i5 + %i0], %l4
	.word	0x949c8012	! t0_kref+0x7c8:   	xorcc	%l2, %l2, %o2
	.word	0xd9000019	! t0_kref+0x7cc:   	ld	[%g0 + %i1], %f12
	.word	0xafb405cc	! t0_kref+0x7d0:   	fcmpeq32	%f16, %f12, %l7
	.word	0x9da389d0	! t0_kref+0x7d4:   	fdivd	%f14, %f16, %f14
	.word	0x91418000	! t0_kref+0x7d8:   	mov	%fprs, %o0
	.word	0x9fa01a50	! t0_kref+0x7dc:   	fdtoi	%f16, %f15
	.word	0x99b3cef0	! t0_kref+0x7e0:   	fornot2s	%f15, %f16, %f12
	.word	0xa1a00531	! t0_kref+0x7e4:   	fsqrts	%f17, %f16
	.word	0x960ce73a	! t0_kref+0x7e8:   	and	%l3, 0x73a, %o3
	.word	0x961cecc0	! t0_kref+0x7ec:   	xor	%l3, 0xcc0, %o3
	.word	0x9bb44d30	! t0_kref+0x7f0:   	fandnot1s	%f17, %f16, %f13
	.word	0xa1a00550	! t0_kref+0x7f4:   	fsqrtd	%f16, %f16
	.word	0xa6f48008	! t0_kref+0x7f8:   	udivcc	%l2, %o0, %l3
	.word	0x99a00550	! t0_kref+0x7fc:   	fsqrtd	%f16, %f12
	.word	0xf7ee101a	! t0_kref+0x800:   	prefetcha	%i0 + %i2, 27
	.word	0xebee501a	! t0_kref+0x804:   	prefetcha	%i1 + %i2, 21
	.word	0x9ba0012d	! t0_kref+0x808:   	fabss	%f13, %f13
	.word	0x20800008	! t0_kref+0x80c:   	bn,a	_kref+0x82c
	.word	0xd1f61012	! t0_kref+0x810:   	casxa	[%i0]0x80, %l2, %o0
	.word	0x9da0002f	! t0_kref+0x814:   	fmovs	%f15, %f14
	.word	0x94658008	! t0_kref+0x818:   	subc	%l6, %o0, %o2
	.word	0x9fa0108c	! t0_kref+0x81c:   	fxtos	%f12, %f15
	.word	0xd8bf5019	! t0_kref+0x820:   	stda	%o4, [%i5 + %i1]0x80
	.word	0xd9be5896	! t0_kref+0x824:   	stda	%f12, [%i1 + %l6]0xc4
	.word	0xa8b4fa95	! t0_kref+0x828:   	orncc	%l3, -0x56b, %l4
	.word	0x32800004	! t0_kref+0x82c:   	bne,a	_kref+0x83c
	.word	0xe428a00a	! t0_kref+0x830:   	stb	%l2, [%g2 + 0xa]
	.word	0x93b54052	! t0_kref+0x834:   	edge8l	%l5, %l2, %o1
	.word	0xe4480019	! t0_kref+0x838:   	ldsb	[%g0 + %i1], %l2
	.word	0x943d6740	! t0_kref+0x83c:   	xnor	%l5, 0x740, %o2
	.word	0x99b30f8c	! t0_kref+0x840:   	for	%f12, %f12, %f12
	.word	0x9de3bfa0	! t0_kref+0x844:   	save	%sp, -0x60, %sp
	.word	0xb496ba2e	! t0_kref+0x848:   	orcc	%i2, -0x5d2, %i2
	.word	0xafee801c	! t0_kref+0x84c:   	restore	%i2, %i4, %l7
	.word	0xae5d7d43	! t0_kref+0x850:   	smul	%l5, -0x2bd, %l7
	.word	0x99b30cac	! t0_kref+0x854:   	fandnot2s	%f12, %f12, %f12
	.word	0xdd064000	! t0_kref+0x858:   	ld	[%i1], %f14
	.word	0xa1a0052e	! t0_kref+0x85c:   	fsqrts	%f14, %f16
	.word	0x20800006	! t0_kref+0x860:   	bn,a	_kref+0x878
	.word	0xa865fc97	! t0_kref+0x864:   	subc	%l7, -0x369, %l4
	.word	0xae8c8014	! t0_kref+0x868:   	andcc	%l2, %l4, %l7
	.word	0x31800004	! t0_kref+0x86c:   	fba,a	_kref+0x87c
	.word	0xabb58353	! t0_kref+0x870:   	alignaddrl	%l6, %l3, %l5
	.word	0xe8a61000	! t0_kref+0x874:   	sta	%l4, [%i0]0x80
	.word	0xa655c012	! t0_kref+0x878:   	umul	%l7, %l2, %l3
	.word	0xa1a0054e	! t0_kref+0x87c:   	fsqrtd	%f14, %f16
	.word	0xdd3e001d	! t0_kref+0x880:   	std	%f14, [%i0 + %i5]
	.word	0x27800001	! t0_kref+0x884:   	fbul,a	_kref+0x888
	.word	0x99a00550	! t0_kref+0x888:   	fsqrtd	%f16, %f12
	.word	0x9744c000	! t0_kref+0x88c:   	mov	%gsr, %o3
	.word	0x22800007	! t0_kref+0x890:   	be,a	_kref+0x8ac
	.word	0xc0780018	! t0_kref+0x894:   	swap	[%g0 + %i0], %g0
	.word	0x961cc014	! t0_kref+0x898:   	xor	%l3, %l4, %o3
	.word	0xec2e2006	! t0_kref+0x89c:   	stb	%l6, [%i0 + 6]
	.word	0x81dd0001	! t0_kref+0x8a0:   	flush	%l4 + %g1
	.word	0xd4480019	! t0_kref+0x8a4:   	ldsb	[%g0 + %i1], %o2
	.word	0x9fc00004	! t0_kref+0x8a8:   	call	%g0 + %g4
	.word	0xa1b4096c	! t0_kref+0x8ac:   	fpmerge	%f16, %f12, %f16
	.word	0xd9be6010	! t0_kref+0x8b0:   	stda	%f12, [%i1 + 0x10]%asi
	.word	0x9de3bfa0	! t0_kref+0x8b4:   	save	%sp, -0x60, %sp
	.word	0x93ee3281	! t0_kref+0x8b8:   	restore	%i0, -0xd7f, %o1
	.word	0xa6d4fe08	! t0_kref+0x8bc:   	umulcc	%l3, -0x1f8, %l3
	.word	0xdd1e0000	! t0_kref+0x8c0:   	ldd	[%i0], %f14
	.word	0xa1a00031	! t0_kref+0x8c4:   	fmovs	%f17, %f16
	.word	0xe0180019	! t0_kref+0x8c8:   	ldd	[%g0 + %i1], %l0
	.word	0xa1a0054c	! t0_kref+0x8cc:   	fsqrtd	%f12, %f16
	.word	0x29480003	! t0_kref+0x8d0:   	fbl,a,pt	%fcc0, _kref+0x8dc
	.word	0xa40d4012	! t0_kref+0x8d4:   	and	%l5, %l2, %l2
	.word	0xe3f65013	! t0_kref+0x8d8:   	casxa	[%i1]0x80, %l3, %l1
	.word	0x9da0052e	! t0_kref+0x8dc:   	fsqrts	%f14, %f14
	.word	0xaefd8016	! t0_kref+0x8e0:   	sdivcc	%l6, %l6, %l7
	.word	0xa3a408af	! t0_kref+0x8e4:   	fsubs	%f16, %f15, %f17
	.word	0x99a0052c	! t0_kref+0x8e8:   	fsqrts	%f12, %f12
	.word	0xadb384d0	! t0_kref+0x8ec:   	fcmpne32	%f14, %f16, %l6
	.word	0x9ba3892c	! t0_kref+0x8f0:   	fmuls	%f14, %f12, %f13
	.word	0x9da309ce	! t0_kref+0x8f4:   	fdivd	%f12, %f14, %f14
	.word	0xa3a0002e	! t0_kref+0x8f8:   	fmovs	%f14, %f17
	.word	0xa1a309d0	! t0_kref+0x8fc:   	fdivd	%f12, %f16, %f16
	.word	0x27800008	! t0_kref+0x900:   	fbul,a	_kref+0x920
	.word	0xaa623079	! t0_kref+0x904:   	subc	%o0, -0xf87, %l5
	.word	0xe1070019	! t0_kref+0x908:   	ld	[%i4 + %i1], %f16
	.word	0x9db00cd0	! t0_kref+0x90c:   	fnot2	%f16, %f14
	.word	0xdd1e2018	! t0_kref+0x910:   	ldd	[%i0 + 0x18], %f14
	.word	0x9ba0052c	! t0_kref+0x914:   	fsqrts	%f12, %f13
	.word	0x99a018d0	! t0_kref+0x918:   	fdtos	%f16, %f12
	.word	0x99a4094c	! t0_kref+0x91c:   	fmuld	%f16, %f12, %f12
	.word	0xa69dbd3e	! t0_kref+0x920:   	xorcc	%l6, -0x2c2, %l3
	.word	0x99a01a2c	! t0_kref+0x924:   	fstoi	%f12, %f12
	.word	0xe66e0000	! t0_kref+0x928:   	ldstub	[%i0], %l3
	.word	0xa1b30a8c	! t0_kref+0x92c:   	fpsub16	%f12, %f12, %f16
	.word	0x9da00550	! t0_kref+0x930:   	fsqrtd	%f16, %f14
	.word	0xa1a0054e	! t0_kref+0x934:   	fsqrtd	%f14, %f16
	.word	0xdf263fe8	! t0_kref+0x938:   	st	%f15, [%i0 - 0x18]
	.word	0x9da409d0	! t0_kref+0x93c:   	fdivd	%f16, %f16, %f14
	.word	0x9fa349af	! t0_kref+0x940:   	fdivs	%f13, %f15, %f15
	.word	0xdd380018	! t0_kref+0x944:   	std	%f14, [%g0 + %i0]
	.word	0xdd060000	! t0_kref+0x948:   	ld	[%i0], %f14
	.word	0xa1b3ccac	! t0_kref+0x94c:   	fandnot2s	%f15, %f12, %f16
	.word	0xec901019	! t0_kref+0x950:   	lduha	[%g0 + %i1]0x80, %l6
	.word	0xac948016	! t0_kref+0x954:   	orcc	%l2, %l6, %l6
	.word	0x99a3884c	! t0_kref+0x958:   	faddd	%f14, %f12, %f12
	.word	0x32800003	! t0_kref+0x95c:   	bne,a	_kref+0x968
	.word	0x9da4094c	! t0_kref+0x960:   	fmuld	%f16, %f12, %f14
	.word	0xd9be1856	! t0_kref+0x964:   	stda	%f12, [%i0 + %l6]0xc2
	.word	0x9765a498	! t0_kref+0x968:   	movneg	%icc, -0x368, %o3
	.word	0x99a3c931	! t0_kref+0x96c:   	fmuls	%f15, %f17, %f12
	.word	0xdd3e401d	! t0_kref+0x970:   	std	%f14, [%i1 + %i5]
	.word	0xaf354017	! t0_kref+0x974:   	srl	%l5, %l7, %l7
	.word	0x24800005	! t0_kref+0x978:   	ble,a	_kref+0x98c
	.word	0xe320a030	! t0_kref+0x97c:   	st	%f17, [%g2 + 0x30]
	.word	0x9da0002c	! t0_kref+0x980:   	fmovs	%f12, %f14
	.word	0xe168a00e	! t0_kref+0x984:   	prefetch	%g2 + 0xe, 16
	.word	0xe11e2000	! t0_kref+0x988:   	ldd	[%i0], %f16
	.word	0xab418000	! t0_kref+0x98c:   	mov	%fprs, %l5
	.word	0x22480008	! t0_kref+0x990:   	be,a,pt	%icc, _kref+0x9b0
	.word	0x99b00cd0	! t0_kref+0x994:   	fnot2	%f16, %f12
	.word	0x9335200c	! t0_kref+0x998:   	srl	%l4, 0xc, %o1
	.word	0x22800002	! t0_kref+0x99c:   	be,a	_kref+0x9a4
	.word	0xea2e401a	! t0_kref+0x9a0:   	stb	%l5, [%i1 + %i2]
	.word	0xa1a30930	! t0_kref+0x9a4:   	fmuls	%f12, %f16, %f16
	.word	0xa4658008	! t0_kref+0x9a8:   	subc	%l6, %o0, %l2
	.word	0xa3a388b0	! t0_kref+0x9ac:   	fsubs	%f14, %f16, %f17
	.word	0x81abcaae	! t0_kref+0x9b0:   	fcmpes	%fcc0, %f15, %f14
	.word	0x99a0054c	! t0_kref+0x9b4:   	fsqrtd	%f12, %f12
	.word	0xa9b20354	! t0_kref+0x9b8:   	alignaddrl	%o0, %l4, %l4
	.word	0xa3a409ac	! t0_kref+0x9bc:   	fdivs	%f16, %f12, %f17
	.word	0x001fffff	! t0_kref+0x9c0:   	illtrap	0x1fffff
	.word	0xf7ee501d	! t0_kref+0x9c4:   	prefetcha	%i1 + %i5, 27
	.word	0x9505c014	! t0_kref+0x9c8:   	taddcc	%l7, %l4, %o2
	.word	0x9744c000	! t0_kref+0x9cc:   	mov	%gsr, %o3
	.word	0x90854014	! t0_kref+0x9d0:   	addcc	%l5, %l4, %o0
	.word	0xd91fbdc0	! t0_kref+0x9d4:   	ldd	[%fp - 0x240], %f12
	.word	0x81ab8ace	! t0_kref+0x9d8:   	fcmped	%fcc0, %f14, %f14
	.word	0x99a018ce	! t0_kref+0x9dc:   	fdtos	%f14, %f12
	.word	0xee30a032	! t0_kref+0x9e0:   	sth	%l7, [%g2 + 0x32]
	.word	0x9414ed2f	! t0_kref+0x9e4:   	or	%l3, 0xd2f, %o2
	.word	0xa3a000ad	! t0_kref+0x9e8:   	fnegs	%f13, %f17
	.word	0x90b4ebf1	! t0_kref+0x9ec:   	orncc	%l3, 0xbf1, %o0
	.word	0xaa8db893	! t0_kref+0x9f0:   	andcc	%l6, -0x76d, %l5
	.word	0xe1180018	! t0_kref+0x9f4:   	ldd	[%g0 + %i0], %f16
	.word	0x81d94005	! t0_kref+0x9f8:   	flush	%g5 + %g5
	.word	0x2b800008	! t0_kref+0x9fc:   	fbug,a	_kref+0xa1c
	.word	0x9da3092c	! t0_kref+0xa00:   	fmuls	%f12, %f12, %f14
	.word	0x3f480007	! t0_kref+0xa04:   	fbo,a,pt	%fcc0, _kref+0xa20
	.word	0x9ba000af	! t0_kref+0xa08:   	fnegs	%f15, %f13
	.word	0xaa5c8012	! t0_kref+0xa0c:   	smul	%l2, %l2, %l5
	.word	0x9da3884c	! t0_kref+0xa10:   	faddd	%f14, %f12, %f14
	.word	0xdd1f4019	! t0_kref+0xa14:   	ldd	[%i5 + %i1], %f14
	.word	0xe1bf1a19	! t0_kref+0xa18:   	stda	%f16, [%i4 + %i1]0xd0
	.word	0x8143c000	! t0_kref+0xa1c:   	stbar
	.word	0xa1a4084c	! t0_kref+0xa20:   	faddd	%f16, %f12, %f16
	.word	0xea20a004	! t0_kref+0xa24:   	st	%l5, [%g2 + 4]
	.word	0xa1a3c9ae	! t0_kref+0xa28:   	fdivs	%f15, %f14, %f16
	.word	0x99b30a10	! t0_kref+0xa2c:   	fpadd16	%f12, %f16, %f12
	.word	0xa3a01a4c	! t0_kref+0xa30:   	fdtoi	%f12, %f17
	.word	0xd0c81018	! t0_kref+0xa34:   	ldsba	[%g0 + %i0]0x80, %o0
	.word	0xee20a010	! t0_kref+0xa38:   	st	%l7, [%g2 + 0x10]
	.word	0xa1a348b0	! t0_kref+0xa3c:   	fsubs	%f13, %f16, %f16
	.word	0x968dc013	! t0_kref+0xa40:   	andcc	%l7, %l3, %o3
	.word	0xa1b40e0c	! t0_kref+0xa44:   	fand	%f16, %f12, %f16
	.word	0x26800001	! t0_kref+0xa48:   	bl,a	_kref+0xa4c
	.word	0x99a000ce	! t0_kref+0xa4c:   	fnegd	%f14, %f12
	.word	0x26480002	! t0_kref+0xa50:   	bl,a,pt	%icc, _kref+0xa58
	.word	0xa1a408ce	! t0_kref+0xa54:   	fsubd	%f16, %f14, %f16
	.word	0xa6253b8f	! t0_kref+0xa58:   	sub	%l4, -0x471, %l3
	.word	0x81ab0ab0	! t0_kref+0xa5c:   	fcmpes	%fcc0, %f12, %f16
	.word	0xdb20a02c	! t0_kref+0xa60:   	st	%f13, [%g2 + 0x2c]
	.word	0x9044b8f2	! t0_kref+0xa64:   	addc	%l2, -0x70e, %o0
	.word	0xaf35c012	! t0_kref+0xa68:   	srl	%l7, %l2, %l7
	.word	0x912d6016	! t0_kref+0xa6c:   	sll	%l5, 0x16, %o0
	.word	0x29800003	! t0_kref+0xa70:   	fbl,a	_kref+0xa7c
	.word	0xd9180018	! t0_kref+0xa74:   	ldd	[%g0 + %i0], %f12
	.word	0x99a0054e	! t0_kref+0xa78:   	fsqrtd	%f14, %f12
	.word	0xee2e6002	! t0_kref+0xa7c:   	stb	%l7, [%i1 + 2]
	.word	0x001fffff	! t0_kref+0xa80:   	illtrap	0x1fffff
	.word	0x91b20073	! t0_kref+0xa84:   	edge8ln	%o0, %l3, %o0
	.word	0x9da389d0	! t0_kref+0xa88:   	fdivd	%f14, %f16, %f14
	.word	0xa9b58094	! t0_kref+0xa8c:   	edge16	%l6, %l4, %l4
	.word	0xa6e4ff62	! t0_kref+0xa90:   	subccc	%l3, -0x9e, %l3
	.word	0x9fb007b0	! t0_kref+0xa94:   	fpackfix	%f16, %f15
	.word	0xc768a085	! t0_kref+0xa98:   	prefetch	%g2 + 0x85, 3
	.word	0xeb68a086	! t0_kref+0xa9c:   	prefetch	%g2 + 0x86, 21
	.word	0xa40d4013	! t0_kref+0xaa0:   	and	%l5, %l3, %l2
	.word	0xd91f4018	! t0_kref+0xaa4:   	ldd	[%i5 + %i0], %f12
	.word	0x91400000	! t0_kref+0xaa8:   	mov	%y, %o0
	.word	0x9535e006	! t0_kref+0xaac:   	srl	%l7, 0x6, %o2
	.word	0x37800002	! t0_kref+0xab0:   	fbge,a	_kref+0xab8
	.word	0xd268a01b	! t0_kref+0xab4:   	ldstub	[%g2 + 0x1b], %o1
	.word	0x9ba0052c	! t0_kref+0xab8:   	fsqrts	%f12, %f13
	.word	0x99a30850	! t0_kref+0xabc:   	faddd	%f12, %f16, %f12
	.word	0xe6a6501c	! t0_kref+0xac0:   	sta	%l3, [%i1 + %i4]0x80
	.word	0x927cb0b0	! t0_kref+0xac4:   	sdiv	%l2, -0xf50, %o1
	.word	0x81ac0ace	! t0_kref+0xac8:   	fcmped	%fcc0, %f16, %f14
	.word	0xd268a03b	! t0_kref+0xacc:   	ldstub	[%g2 + 0x3b], %o1
	.word	0xd026401c	! t0_kref+0xad0:   	st	%o0, [%i1 + %i4]
	.word	0x94154015	! t0_kref+0xad4:   	or	%l5, %l5, %o2
	.word	0x9da3c830	! t0_kref+0xad8:   	fadds	%f15, %f16, %f14
	.word	0x9da4082d	! t0_kref+0xadc:   	fadds	%f16, %f13, %f14
	.word	0xe8ce9018	! t0_kref+0xae0:   	ldsba	[%i2 + %i0]0x80, %l4
	.word	0xe4262008	! t0_kref+0xae4:   	st	%l2, [%i0 + 8]
	.word	0xd6901019	! t0_kref+0xae8:   	lduha	[%g0 + %i1]0x80, %o3
	.word	0xe620a030	! t0_kref+0xaec:   	st	%l3, [%g2 + 0x30]
	.word	0xd93e2008	! t0_kref+0xaf0:   	std	%f12, [%i0 + 8]
	.word	0xe8a6501c	! t0_kref+0xaf4:   	sta	%l4, [%i1 + %i4]0x80
	.word	0xdb262010	! t0_kref+0xaf8:   	st	%f13, [%i0 + 0x10]
	.word	0x93b54128	! t0_kref+0xafc:   	edge32n	%l5, %o0, %o1
	.word	0x9fb007ae	! t0_kref+0xb00:   	fpackfix	%f14, %f15
	.word	0xaa9d3e92	! t0_kref+0xb04:   	xorcc	%l4, -0x16e, %l5
	.word	0x9de3bfa0	! t0_kref+0xb08:   	save	%sp, -0x60, %sp
	.word	0x91ee4000	! t0_kref+0xb0c:   	restore	%i1, %g0, %o0
	.word	0xd610a008	! t0_kref+0xb10:   	lduh	[%g2 + 8], %o3
	.word	0xa8b54015	! t0_kref+0xb14:   	orncc	%l5, %l5, %l4
	.word	0x22800008	! t0_kref+0xb18:   	be,a	_kref+0xb38
	.word	0xa87df47d	! t0_kref+0xb1c:   	sdiv	%l7, -0xb83, %l4
	.word	0xe430a030	! t0_kref+0xb20:   	sth	%l2, [%g2 + 0x30]
	.word	0xe620a020	! t0_kref+0xb24:   	st	%l3, [%g2 + 0x20]
	.word	0xd9060000	! t0_kref+0xb28:   	ld	[%i0], %f12
	.word	0xa9b54008	! t0_kref+0xb2c:   	edge8	%l5, %o0, %l4
	.word	0xe4300019	! t0_kref+0xb30:   	sth	%l2, [%g0 + %i1]
	.word	0x001fffff	! t0_kref+0xb34:   	illtrap	0x1fffff
	.word	0x9fa01a31	! t0_kref+0xb38:   	fstoi	%f17, %f15
	.word	0x9f414000	! t0_kref+0xb3c:   	mov	%pc, %o7
	.word	0xdd064000	! t0_kref+0xb40:   	ld	[%i1], %f14
	.word	0x99b40a8e	! t0_kref+0xb44:   	fpsub16	%f16, %f14, %f12
	.word	0xdf067ff4	! t0_kref+0xb48:   	ld	[%i1 - 0xc], %f15
	.word	0xee08a005	! t0_kref+0xb4c:   	ldub	[%g2 + 5], %l7
	.word	0xafb200d6	! t0_kref+0xb50:   	edge16l	%o0, %l6, %l7
	.word	0xa89cae1d	! t0_kref+0xb54:   	xorcc	%l2, 0xe1d, %l4
	.word	0xd93e6008	! t0_kref+0xb58:   	std	%f12, [%i1 + 8]
	.word	0x9625751a	! t0_kref+0xb5c:   	sub	%l5, -0xae6, %o3
	.word	0xafb50115	! t0_kref+0xb60:   	edge32	%l4, %l5, %l7
	.word	0xd93e4000	! t0_kref+0xb64:   	std	%f12, [%i1]
	.word	0xa1a01930	! t0_kref+0xb68:   	fstod	%f16, %f16
	.word	0xd0264000	! t0_kref+0xb6c:   	st	%o0, [%i1]
	.word	0xa1b30e80	! t0_kref+0xb70:   	fsrc1	%f12, %f16
	.word	0xaa9dc013	! t0_kref+0xb74:   	xorcc	%l7, %l3, %l5
	.word	0xe1ee101c	! t0_kref+0xb78:   	prefetcha	%i0 + %i4, 16
	.word	0xe06e401a	! t0_kref+0xb7c:   	ldstub	[%i1 + %i2], %l0
	call	SYM(t0_subr3)
	.word	0xa1a0054c	! t0_kref+0xb84:   	fsqrtd	%f12, %f16
	.word	0x2b37156c	! t0_kref+0xb88:   	sethi	%hi(0xdc55b000), %l5
	.word	0x945c8017	! t0_kref+0xb8c:   	smul	%l2, %l7, %o2
	.word	0xd26e7fe5	! t0_kref+0xb90:   	ldstub	[%i1 - 0x1b], %o1
	.word	0xdf00a024	! t0_kref+0xb94:   	ld	[%g2 + 0x24], %f15
	.word	0xa8fdc016	! t0_kref+0xb98:   	sdivcc	%l7, %l6, %l4
	.word	0x39800005	! t0_kref+0xb9c:   	fbuge,a	_kref+0xbb0
	.word	0xa9b48048	! t0_kref+0xba0:   	edge8l	%l2, %o0, %l4
	.word	0xea36401b	! t0_kref+0xba4:   	sth	%l5, [%i1 + %i3]
	.word	0xa1a0054c	! t0_kref+0xba8:   	fsqrtd	%f12, %f16
	.word	0x99b34aad	! t0_kref+0xbac:   	fpsub16s	%f13, %f13, %f12
	.word	0xa3a00530	! t0_kref+0xbb0:   	fsqrts	%f16, %f17
	.word	0xc768a045	! t0_kref+0xbb4:   	prefetch	%g2 + 0x45, 3
	.word	0x90ace279	! t0_kref+0xbb8:   	andncc	%l3, 0x279, %o0
	.word	0xd2d01018	! t0_kref+0xbbc:   	ldsha	[%g0 + %i0]0x80, %o1
	.word	0xc06e001a	! t0_kref+0xbc0:   	ldstub	[%i0 + %i2], %g0
	.word	0xa3a01a4e	! t0_kref+0xbc4:   	fdtoi	%f14, %f17
	.word	0x81ac0ad0	! t0_kref+0xbc8:   	fcmped	%fcc0, %f16, %f16
	.word	0x34800005	! t0_kref+0xbcc:   	bg,a	_kref+0xbe0
	.word	0xa7322017	! t0_kref+0xbd0:   	srl	%o0, 0x17, %l3
	.word	0x965cc017	! t0_kref+0xbd4:   	smul	%l3, %l7, %o3
	.word	0x99b40ad0	! t0_kref+0xbd8:   	fpsub32	%f16, %f16, %f12
	.word	0xd91e3fe0	! t0_kref+0xbdc:   	ldd	[%i0 - 0x20], %f12
	.word	0xa8220012	! t0_kref+0xbe0:   	sub	%o0, %l2, %l4
	.word	0x9ba44831	! t0_kref+0xbe4:   	fadds	%f17, %f17, %f13
	.word	0x3c800001	! t0_kref+0xbe8:   	bpos,a	_kref+0xbec
	.word	0xaf04ff5b	! t0_kref+0xbec:   	taddcc	%l3, -0xa5, %l7
	.word	0xaa9df902	! t0_kref+0xbf0:   	xorcc	%l7, -0x6fe, %l5
	.word	0x2d800006	! t0_kref+0xbf4:   	fbg,a	_kref+0xc0c
	.word	0xad40c000	! t0_kref+0xbf8:   	mov	%asi, %l6
	.word	0x9fa0002e	! t0_kref+0xbfc:   	fmovs	%f14, %f15
	.word	0x94f5c008	! t0_kref+0xc00:   	udivcc	%l7, %o0, %o2
	.word	0x81df6ff7	! t0_kref+0xc04:   	flush	%i5 + 0xff7
	.word	0xe11f4019	! t0_kref+0xc08:   	ldd	[%i5 + %i1], %f16
	.word	0xd9be5854	! t0_kref+0xc0c:   	stda	%f12, [%i1 + %l4]0xc2
	.word	0xe13e6010	! t0_kref+0xc10:   	std	%f16, [%i1 + 0x10]
	.word	0xabb50174	! t0_kref+0xc14:   	edge32ln	%l4, %l4, %l5
	.word	0xec6e4000	! t0_kref+0xc18:   	ldstub	[%i1], %l6
	.word	0x1501bc96	! t0_kref+0xc1c:   	sethi	%hi(0x6f25800), %o2
	.word	0xa6e4a21a	! t0_kref+0xc20:   	subccc	%l2, 0x21a, %l3
	.word	0xa1a01090	! t0_kref+0xc24:   	fxtos	%f16, %f16
	.word	0xa1a0052f	! t0_kref+0xc28:   	fsqrts	%f15, %f16
	.word	0xa3a388ae	! t0_kref+0xc2c:   	fsubs	%f14, %f14, %f17
	.word	0xadb200b3	! t0_kref+0xc30:   	edge16n	%o0, %l3, %l6
	.word	0xc001401c	! t0_kref+0xc34:   	ld	[%g5 + %i4], %g0
	.word	0x94b4fbc1	! t0_kref+0xc38:   	orncc	%l3, -0x43f, %o2
	.word	0x901cc012	! t0_kref+0xc3c:   	xor	%l3, %l2, %o0
	.word	0x9ba000b0	! t0_kref+0xc40:   	fnegs	%f16, %f13
	.word	0xe62e6001	! t0_kref+0xc44:   	stb	%l3, [%i1 + 1]
	.word	0xf007bfe0	! t0_kref+0xc48:   	ld	[%fp - 0x20], %i0
	.word	0x99a01a4e	! t0_kref+0xc4c:   	fdtoi	%f14, %f12
	.word	0x9da0054c	! t0_kref+0xc50:   	fsqrtd	%f12, %f14
	.word	0x99a349b0	! t0_kref+0xc54:   	fdivs	%f13, %f16, %f12
	.word	0xfdee101a	! t0_kref+0xc58:   	prefetcha	%i0 + %i2, 30
	.word	0xf43e7fe0	! t0_kref+0xc5c:   	std	%i2, [%i1 - 0x20]
	.word	0x2c800003	! t0_kref+0xc60:   	bneg,a	_kref+0xc6c
	.word	0xf207bfe0	! t0_kref+0xc64:   	ld	[%fp - 0x20], %i1
	.word	0xea30a012	! t0_kref+0xc68:   	sth	%l5, [%g2 + 0x12]
	.word	0xe8881019	! t0_kref+0xc6c:   	lduba	[%g0 + %i1]0x80, %l4
	.word	0x93b404d0	! t0_kref+0xc70:   	fcmpne32	%f16, %f16, %o1
	.word	0x9fc10000	! t0_kref+0xc74:   	call	%g4
	.word	0x9db38dcc	! t0_kref+0xc78:   	fnand	%f14, %f12, %f14
	.word	0x9db40ea0	! t0_kref+0xc7c:   	fsrc1s	%f16, %f14
	.word	0x99a00550	! t0_kref+0xc80:   	fsqrtd	%f16, %f12
	.word	0xec28a005	! t0_kref+0xc84:   	stb	%l6, [%g2 + 5]
	.word	0x2d800002	! t0_kref+0xc88:   	fbg,a	_kref+0xc90
	.word	0x272dd162	! t0_kref+0xc8c:   	sethi	%hi(0xb7458800), %l3
	.word	0xa7400000	! t0_kref+0xc90:   	mov	%y, %l3
	.word	0xdb264000	! t0_kref+0xc94:   	st	%f13, [%i1]
	.word	0xe0396cb0	! t0_kref+0xc98:   	std	%l0, [%g5 + 0xcb0]
	call	SYM(t0_subr1)
	.word	0x9da00530	! t0_kref+0xca0:   	fsqrts	%f16, %f14
	.word	0xd99eda59	! t0_kref+0xca4:   	ldda	[%i3 + %i1]0xd2, %f12
	.word	0x81ac0aae	! t0_kref+0xca8:   	fcmpes	%fcc0, %f16, %f14
	.word	0x99a0108c	! t0_kref+0xcac:   	fxtos	%f12, %f12
	.word	0x9da00531	! t0_kref+0xcb0:   	fsqrts	%f17, %f14
	.word	0x97054015	! t0_kref+0xcb4:   	taddcc	%l5, %l5, %o3
	.word	0xa1a4094e	! t0_kref+0xcb8:   	fmuld	%f16, %f14, %f16
	.word	0xac35ee29	! t0_kref+0xcbc:   	orn	%l7, 0xe29, %l6
	.word	0xa1a0054c	! t0_kref+0xcc0:   	fsqrtd	%f12, %f16
	.word	0xae14c014	! t0_kref+0xcc4:   	or	%l3, %l4, %l7
	.word	0x972de012	! t0_kref+0xcc8:   	sll	%l7, 0x12, %o3
	.word	0x909cface	! t0_kref+0xccc:   	xorcc	%l3, -0x532, %o0
	.word	0xa1a3c8ae	! t0_kref+0xcd0:   	fsubs	%f15, %f14, %f16
	.word	0xad34e01b	! t0_kref+0xcd4:   	srl	%l3, 0x1b, %l6
	.word	0xae254015	! t0_kref+0xcd8:   	sub	%l5, %l5, %l7
	.word	0x90420016	! t0_kref+0xcdc:   	addc	%o0, %l6, %o0
	.word	0xd93f4019	! t0_kref+0xce0:   	std	%f12, [%i5 + %i1]
	.word	0x24800006	! t0_kref+0xce4:   	ble,a	_kref+0xcfc
	.word	0x81b01025	! t0_kref+0xce8:   	siam	0x5
	.word	0xa484e77c	! t0_kref+0xcec:   	addcc	%l3, 0x77c, %l2
	.word	0xe8df5018	! t0_kref+0xcf0:   	ldxa	[%i5 + %i0]0x80, %l4
	.word	0x94b48008	! t0_kref+0xcf4:   	orncc	%l2, %o0, %o2
	.word	0x96f5f076	! t0_kref+0xcf8:   	udivcc	%l7, -0xf8a, %o3
	.word	0xf5ee101d	! t0_kref+0xcfc:   	prefetcha	%i0 + %i5, 26
	.word	0x17371528	! t0_kref+0xd00:   	sethi	%hi(0xdc54a000), %o3
	.word	0x943c8017	! t0_kref+0xd04:   	xnor	%l2, %l7, %o2
	.word	0xa8920016	! t0_kref+0xd08:   	orcc	%o0, %l6, %l4
	.word	0x9ba0052c	! t0_kref+0xd0c:   	fsqrts	%f12, %f13
	.word	0x87802082	! t0_kref+0xd10:   	mov	0x82, %asi
	.word	0xe1be1853	! t0_kref+0xd14:   	stda	%f16, [%i0 + %l3]0xc2
	.word	0xa7703bfc	! t0_kref+0xd18:   	popc	-0x404, %l3
	.word	0xa72d8013	! t0_kref+0xd1c:   	sll	%l6, %l3, %l3
	.word	0xa4bcf87b	! t0_kref+0xd20:   	xnorcc	%l3, -0x785, %l2
	.word	0x928d0013	! t0_kref+0xd24:   	andcc	%l4, %l3, %o1
	.word	0x3a480001	! t0_kref+0xd28:   	bcc,a,pt	%icc, _kref+0xd2c
	.word	0xec580019	! t0_kref+0xd2c:   	ldx	[%g0 + %i1], %l6
	.word	0x8143c000	! t0_kref+0xd30:   	stbar
	.word	0xe64e4000	! t0_kref+0xd34:   	ldsb	[%i1], %l3
	.word	0x99a0002c	! t0_kref+0xd38:   	fmovs	%f12, %f12
	.word	0xddbe101d	! t0_kref+0xd3c:   	stda	%f14, [%i0 + %i5]0x80
	.word	0x90052020	! t0_kref+0xd40:   	add	%l4, 0x20, %o0
	.word	0xd008a02a	! t0_kref+0xd44:   	ldub	[%g2 + 0x2a], %o0
	.word	0x9db00f0e	! t0_kref+0xd48:   	fsrc2	%f14, %f14
	.word	0xec1e001d	! t0_kref+0xd4c:   	ldd	[%i0 + %i5], %l6
	.word	0x905dc014	! t0_kref+0xd50:   	smul	%l7, %l4, %o0
	.word	0x923d0017	! t0_kref+0xd54:   	xnor	%l4, %l7, %o1
	.word	0xdd067ff4	! t0_kref+0xd58:   	ld	[%i1 - 0xc], %f14
	.word	0xd9070018	! t0_kref+0xd5c:   	ld	[%i4 + %i0], %f12
	.word	0xd93e7ff0	! t0_kref+0xd60:   	std	%f12, [%i1 - 0x10]
	.word	0x32480008	! t0_kref+0xd64:   	bne,a,pt	%icc, _kref+0xd84
	.word	0xac04f0ee	! t0_kref+0xd68:   	add	%l3, -0xf12, %l6
	.word	0xa85da5d0	! t0_kref+0xd6c:   	smul	%l6, 0x5d0, %l4
	.word	0xae5223a2	! t0_kref+0xd70:   	umul	%o0, 0x3a2, %l7
	.word	0x9fa00531	! t0_kref+0xd74:   	fsqrts	%f17, %f15
	.word	0xa4620012	! t0_kref+0xd78:   	subc	%o0, %l2, %l2
	.word	0xe168a007	! t0_kref+0xd7c:   	prefetch	%g2 + 7, 16
	.word	0xd9be1808	! t0_kref+0xd80:   	stda	%f12, [%i0 + %o0]0xc0
	.word	0x81ab0a4e	! t0_kref+0xd84:   	fcmpd	%fcc0, %f12, %f14
	.word	0xe6266018	! t0_kref+0xd88:   	st	%l3, [%i1 + 0x18]
	.word	0x9ba00130	! t0_kref+0xd8c:   	fabss	%f16, %f13
	.word	0x99b00f2f	! t0_kref+0xd90:   	fsrc2s	%f15, %f12
	.word	0x92654008	! t0_kref+0xd94:   	subc	%l5, %o0, %o1
	.word	0x9bb44a31	! t0_kref+0xd98:   	fpadd16s	%f17, %f17, %f13
	.word	0x965c8012	! t0_kref+0xd9c:   	smul	%l2, %l2, %o3
	.word	0x32800004	! t0_kref+0xda0:   	bne,a	_kref+0xdb0
	.word	0x9da00550	! t0_kref+0xda4:   	fsqrtd	%f16, %f14
	.word	0x81b01025	! t0_kref+0xda8:   	siam	0x5
	.word	0x99a00550	! t0_kref+0xdac:   	fsqrtd	%f16, %f12
	.word	0x28480002	! t0_kref+0xdb0:   	bleu,a,pt	%icc, _kref+0xdb8
	.word	0xf83e401d	! t0_kref+0xdb4:   	std	%i4, [%i1 + %i5]
	.word	0x2c800008	! t0_kref+0xdb8:   	bneg,a	_kref+0xdd8
	.word	0x99a0054c	! t0_kref+0xdbc:   	fsqrtd	%f12, %f12
	.word	0xe628a03b	! t0_kref+0xdc0:   	stb	%l3, [%g2 + 0x3b]
	.word	0x99b30d0c	! t0_kref+0xdc4:   	fandnot1	%f12, %f12, %f12
	.word	0x27800004	! t0_kref+0xdc8:   	fbul,a	_kref+0xdd8
	.word	0xa6aa36fa	! t0_kref+0xdcc:   	andncc	%o0, -0x906, %l3
	.word	0xdf270018	! t0_kref+0xdd0:   	st	%f15, [%i4 + %i0]
	.word	0x99a01930	! t0_kref+0xdd4:   	fstod	%f16, %f12
	.word	0x9da0052f	! t0_kref+0xdd8:   	fsqrts	%f15, %f14
	.word	0xe8b01018	! t0_kref+0xddc:   	stha	%l4, [%g0 + %i0]0x80
	.word	0x96fd0013	! t0_kref+0xde0:   	sdivcc	%l4, %l3, %o3
	.word	0xe4d6d018	! t0_kref+0xde4:   	ldsha	[%i3 + %i0]0x80, %l2
	.word	0x27800005	! t0_kref+0xde8:   	fbul,a	_kref+0xdfc
	.word	0xd9be1893	! t0_kref+0xdec:   	stda	%f12, [%i0 + %l3]0xc4
	.word	0x9da3c8ac	! t0_kref+0xdf0:   	fsubs	%f15, %f12, %f14
	.word	0xd20e401a	! t0_kref+0xdf4:   	ldub	[%i1 + %i2], %o1
	.word	0xe968a041	! t0_kref+0xdf8:   	prefetch	%g2 + 0x41, 20
	.word	0xa6ace2eb	! t0_kref+0xdfc:   	andncc	%l3, 0x2eb, %l3
	.word	0x81ab0ad0	! t0_kref+0xe00:   	fcmped	%fcc0, %f12, %f16
	.word	0xf43e0000	! t0_kref+0xe04:   	std	%i2, [%i0]
	.word	0xae65eceb	! t0_kref+0xe08:   	subc	%l7, 0xceb, %l7
	.word	0x39800004	! t0_kref+0xe0c:   	fbuge,a	_kref+0xe1c
	.word	0xee26001c	! t0_kref+0xe10:   	st	%l7, [%i0 + %i4]
	.word	0x9fa00030	! t0_kref+0xe14:   	fmovs	%f16, %f15
	.word	0x81ac0ad0	! t0_kref+0xe18:   	fcmped	%fcc0, %f16, %f16
	.word	0xa6f50015	! t0_kref+0xe1c:   	udivcc	%l4, %l5, %l3
	.word	0x99a01a50	! t0_kref+0xe20:   	fdtoi	%f16, %f12
	.word	0x9ba00030	! t0_kref+0xe24:   	fmovs	%f16, %f13
	.word	0xd0260000	! t0_kref+0xe28:   	st	%o0, [%i0]
	.word	0x99b30ea0	! t0_kref+0xe2c:   	fsrc1s	%f12, %f12
	.word	0xae75baf2	! t0_kref+0xe30:   	udiv	%l6, -0x50e, %l7
	.word	0xad63e4a8	! t0_kref+0xe34:   	movo	%fcc0, -0x358, %l6
	.word	0xa6353f99	! t0_kref+0xe38:   	orn	%l4, -0x67, %l3
	.word	0x93b50335	! t0_kref+0xe3c:   	bmask	%l4, %l5, %o1
	.word	0xa6b48012	! t0_kref+0xe40:   	orncc	%l2, %l2, %l3
	.word	0xee680018	! t0_kref+0xe44:   	ldstub	[%g0 + %i0], %l7
	.word	0xda6e7ff1	! t0_kref+0xe48:   	ldstub	[%i1 - 0xf], %o5
	.word	0x9da409ae	! t0_kref+0xe4c:   	fdivs	%f16, %f14, %f14
	.word	0xa4150012	! t0_kref+0xe50:   	or	%l4, %l2, %l2
	.word	0xea30a026	! t0_kref+0xe54:   	sth	%l5, [%g2 + 0x26]
	.word	0x903d2a0a	! t0_kref+0xe58:   	xnor	%l4, 0xa0a, %o0
	.word	0x9f414000	! t0_kref+0xe5c:   	mov	%pc, %o7
!	.word	0x284f2466	! t0_kref+0xe60:   	bleu,a,pt	%icc, SYM(t0_subr0)
	   	bleu,a,pt	%icc, SYM(t0_subr0)
	.word	0x81854000	! t0_kref+0xe64:   	wr	%l5, %g0, %y
	.word	0x9da00550	! t0_kref+0xe68:   	fsqrtd	%f16, %f14
	.word	0x81ab4aae	! t0_kref+0xe6c:   	fcmpes	%fcc0, %f13, %f14
	.word	0xe9ee501a	! t0_kref+0xe70:   	prefetcha	%i1 + %i2, 20
	.word	0xa85d0013	! t0_kref+0xe74:   	smul	%l4, %l3, %l4
	.word	0x28480007	! t0_kref+0xe78:   	bleu,a,pt	%icc, _kref+0xe94
	.word	0x9db40e0c	! t0_kref+0xe7c:   	fand	%f16, %f12, %f14
	.word	0x94ba0016	! t0_kref+0xe80:   	xnorcc	%o0, %l6, %o2
	.word	0xa3a01a4e	! t0_kref+0xe84:   	fdtoi	%f14, %f17
	.word	0xa83cc014	! t0_kref+0xe88:   	xnor	%l3, %l4, %l4
	.word	0x9fa0052d	! t0_kref+0xe8c:   	fsqrts	%f13, %f15
	.word	0x27800004	! t0_kref+0xe90:   	fbul,a	_kref+0xea0
	.word	0x9da3894c	! t0_kref+0xe94:   	fmuld	%f14, %f12, %f14
	.word	0xd83f4019	! t0_kref+0xe98:   	std	%o4, [%i5 + %i1]
	.word	0xa3a01a50	! t0_kref+0xe9c:   	fdtoi	%f16, %f17
	.word	0xa424ab0e	! t0_kref+0xea0:   	sub	%l2, 0xb0e, %l2
	.word	0xd030a02e	! t0_kref+0xea4:   	sth	%o0, [%g2 + 0x2e]
	.word	0xa732201d	! t0_kref+0xea8:   	srl	%o0, 0x1d, %l3
	.word	0x81ac4aac	! t0_kref+0xeac:   	fcmpes	%fcc0, %f17, %f12
	.word	0xe380105c	! t0_kref+0xeb0:   	lda	[%g0 + %i4]0x82, %f17
	.word	0x9da40950	! t0_kref+0xeb4:   	fmuld	%f16, %f16, %f14
	.word	0xd66e4000	! t0_kref+0xeb8:   	ldstub	[%i1], %o3
	.word	0xabb404d0	! t0_kref+0xebc:   	fcmpne32	%f16, %f16, %l5
	.word	0xdba6501c	! t0_kref+0xec0:   	sta	%f13, [%i1 + %i4]0x80
	.word	0x95400000	! t0_kref+0xec4:   	mov	%y, %o2
	.word	0x90748015	! t0_kref+0xec8:   	udiv	%l2, %l5, %o0
	.word	0x8143e040	! t0_kref+0xecc:   	membar	0x40
	.word	0x22480003	! t0_kref+0xed0:   	be,a,pt	%icc, _kref+0xedc
	.word	0x9db40e0e	! t0_kref+0xed4:   	fand	%f16, %f14, %f14
	.word	0x81ab8ab1	! t0_kref+0xed8:   	fcmpes	%fcc0, %f14, %f17
	.word	0xa80c8014	! t0_kref+0xedc:   	and	%l2, %l4, %l4
	.word	0x2d480004	! t0_kref+0xee0:   	fbg,a,pt	%fcc0, _kref+0xef0
	.word	0xa44224e0	! t0_kref+0xee4:   	addc	%o0, 0x4e0, %l2
	.word	0xa3a00531	! t0_kref+0xee8:   	fsqrts	%f17, %f17
	.word	0x13247a1d	! t0_kref+0xeec:   	sethi	%hi(0x91e87400), %o1
	.word	0xa9400000	! t0_kref+0xef0:   	mov	%y, %l4
	.word	0xe11fbe18	! t0_kref+0xef4:   	ldd	[%fp - 0x1e8], %f16
	.word	0x9de3bfa0	! t0_kref+0xef8:   	save	%sp, -0x60, %sp
	.word	0xa5ef0018	! t0_kref+0xefc:   	restore	%i4, %i0, %l2
	.word	0xa1b446ac	! t0_kref+0xf00:   	fmul8x16al	%f17, %f12, %f16
	.word	0x932cc012	! t0_kref+0xf04:   	sll	%l3, %l2, %o1
	.word	0x33480001	! t0_kref+0xf08:   	fbe,a,pt	%fcc0, _kref+0xf0c
	.word	0xa68d8013	! t0_kref+0xf0c:   	andcc	%l6, %l3, %l3
	.word	0x9db30e0c	! t0_kref+0xf10:   	fand	%f12, %f12, %f14
	.word	0xd93e7fe0	! t0_kref+0xf14:   	std	%f12, [%i1 - 0x20]
	.word	0x9005682f	! t0_kref+0xf18:   	add	%l5, 0x82f, %o0
	.word	0xa1a00550	! t0_kref+0xf1c:   	fsqrtd	%f16, %f16
	.word	0x99a00150	! t0_kref+0xf20:   	fabsd	%f16, %f12
	.word	0x96fd32c1	! t0_kref+0xf24:   	sdivcc	%l4, -0xd3f, %o3
	.word	0x99a0054e	! t0_kref+0xf28:   	fsqrtd	%f14, %f12
	.word	0xae8d4012	! t0_kref+0xf2c:   	andcc	%l5, %l2, %l7
	.word	0xec2e8018	! t0_kref+0xf30:   	stb	%l6, [%i2 + %i0]
	.word	0x99b4090c	! t0_kref+0xf34:   	faligndata	%f16, %f12, %f12
	.word	0xe6b65000	! t0_kref+0xf38:   	stha	%l3, [%i1]0x80
	.word	0x968d0012	! t0_kref+0xf3c:   	andcc	%l4, %l2, %o3
	.word	0x9da018d0	! t0_kref+0xf40:   	fdtos	%f16, %f14
	.word	0xee000019	! t0_kref+0xf44:   	ld	[%g0 + %i1], %l7
	.word	0xacfcc016	! t0_kref+0xf48:   	sdivcc	%l3, %l6, %l6
	.word	0xa4fa2c08	! t0_kref+0xf4c:   	sdivcc	%o0, 0xc08, %l2
	.word	0x90ad3964	! t0_kref+0xf50:   	andncc	%l4, -0x69c, %o0
	.word	0x37480001	! t0_kref+0xf54:   	fbge,a,pt	%fcc0, _kref+0xf58
	.word	0x963d4015	! t0_kref+0xf58:   	xnor	%l5, %l5, %o3
	.word	0xe628a00b	! t0_kref+0xf5c:   	stb	%l3, [%g2 + 0xb]
	.word	0xe628a010	! t0_kref+0xf60:   	stb	%l3, [%g2 + 0x10]
	.word	0x9fb00f31	! t0_kref+0xf64:   	fsrc2s	%f17, %f15
	.word	0xe120a018	! t0_kref+0xf68:   	st	%f16, [%g2 + 0x18]
	.word	0x9bb007ac	! t0_kref+0xf6c:   	fpackfix	%f12, %f13
	.word	0x9da00550	! t0_kref+0xf70:   	fsqrtd	%f16, %f14
	.word	0xc5ee5012	! t0_kref+0xf74:   	prefetcha	%i1 + %l2, 2
	.word	0x96754012	! t0_kref+0xf78:   	udiv	%l5, %l2, %o3
	.word	0xac5ce879	! t0_kref+0xf7c:   	smul	%l3, 0x879, %l6
	.word	0xa69a0013	! t0_kref+0xf80:   	xorcc	%o0, %l3, %l3
	.word	0x21800004	! t0_kref+0xf84:   	fbn,a	_kref+0xf94
	.word	0x99b009b1	! t0_kref+0xf88:   	fexpand	%f17, %f12
	.word	0x99a0002f	! t0_kref+0xf8c:   	fmovs	%f15, %f12
	.word	0x99a00050	! t0_kref+0xf90:   	fmovd	%f16, %f12
	.word	0x99b38e6d	! t0_kref+0xf94:   	fxnors	%f14, %f13, %f12
	.word	0x925cc017	! t0_kref+0xf98:   	smul	%l3, %l7, %o1
	.word	0x9444c014	! t0_kref+0xf9c:   	addc	%l3, %l4, %o2
	.word	0xe13e7ff8	! t0_kref+0xfa0:   	std	%f16, [%i1 - 8]
	.word	0xa7358017	! t0_kref+0xfa4:   	srl	%l6, %l7, %l3
	.word	0xe168a049	! t0_kref+0xfa8:   	prefetch	%g2 + 0x49, 16
	.word	0xd9be1a5d	! t0_kref+0xfac:   	stda	%f12, [%i0 + %i5]0xd2
	.word	0xa8b237bc	! t0_kref+0xfb0:   	orncc	%o0, -0x844, %l4
	.word	0x2d800004	! t0_kref+0xfb4:   	fbg,a	_kref+0xfc4
	.word	0x90c5f81b	! t0_kref+0xfb8:   	addccc	%l7, -0x7e5, %o0
	.word	0x2e800005	! t0_kref+0xfbc:   	bvs,a	_kref+0xfd0
	.word	0x9fa018d0	! t0_kref+0xfc0:   	fdtos	%f16, %f15
	.word	0x81820000	! t0_kref+0xfc4:   	wr	%o0, %g0, %y
	.word	0xae5da7b2	! t0_kref+0xfc8:   	smul	%l6, 0x7b2, %l7
	.word	0xa1b3cdae	! t0_kref+0xfcc:   	fxors	%f15, %f14, %f16
	.word	0x8143e040	! t0_kref+0xfd0:   	membar	0x40
	.word	0x22800008	! t0_kref+0xfd4:   	be,a	_kref+0xff4
	.word	0xa52d0014	! t0_kref+0xfd8:   	sll	%l4, %l4, %l2
	.word	0x95b5c316	! t0_kref+0xfdc:   	alignaddr	%l7, %l6, %o2
	.word	0x81ac0ad0	! t0_kref+0xfe0:   	fcmped	%fcc0, %f16, %f16
	.word	0xa92d2010	! t0_kref+0xfe4:   	sll	%l4, 0x10, %l4
	.word	0x81848000	! t0_kref+0xfe8:   	wr	%l2, %g0, %y
	.word	0x9fb38aad	! t0_kref+0xfec:   	fpsub16s	%f14, %f13, %f15
	.word	0xe3263ff0	! t0_kref+0xff0:   	st	%f17, [%i0 - 0x10]
	.word	0x99a00531	! t0_kref+0xff4:   	fsqrts	%f17, %f12
	.word	0x925d734f	! t0_kref+0xff8:   	smul	%l5, -0xcb1, %o1
	.word	0x9fa018cc	! t0_kref+0xffc:   	fdtos	%f12, %f15
	.word	0x9ba01a2f	! t0_kref+0x1000:   	fstoi	%f15, %f13
	.word	0xd9be1896	! t0_kref+0x1004:   	stda	%f12, [%i0 + %l6]0xc4
	.word	0xd99e501d	! t0_kref+0x1008:   	ldda	[%i1 + %i5]0x80, %f12
	.word	0xa8057bfc	! t0_kref+0x100c:   	add	%l5, -0x404, %l4
	.word	0x96052431	! t0_kref+0x1010:   	add	%l4, 0x431, %o3
	.word	0x9fa0012d	! t0_kref+0x1014:   	fabss	%f13, %f15
	.word	0x97b58114	! t0_kref+0x1018:   	edge32	%l6, %l4, %o3
	.word	0x81b01027	! t0_kref+0x101c:   	siam	0x7
	.word	0xe630a01e	! t0_kref+0x1020:   	sth	%l3, [%g2 + 0x1e]
	.word	0x9fa000ac	! t0_kref+0x1024:   	fnegs	%f12, %f15
	.word	0xae8d4015	! t0_kref+0x1028:   	andcc	%l5, %l5, %l7
	.word	0xe828a02a	! t0_kref+0x102c:   	stb	%l4, [%g2 + 0x2a]
	.word	0x907d0016	! t0_kref+0x1030:   	sdiv	%l4, %l6, %o0
	.word	0x99a448b0	! t0_kref+0x1034:   	fsubs	%f17, %f16, %f12
	.word	0x903d8016	! t0_kref+0x1038:   	xnor	%l6, %l6, %o0
	.word	0xab40c000	! t0_kref+0x103c:   	mov	%asi, %l5
	.word	0x93b5c0f6	! t0_kref+0x1040:   	edge16ln	%l7, %l6, %o1
	.word	0xd448a002	! t0_kref+0x1044:   	ldsb	[%g2 + 2], %o2
	.word	0x2e800006	! t0_kref+0x1048:   	bvs,a	_kref+0x1060
	.word	0x9ba409ac	! t0_kref+0x104c:   	fdivs	%f16, %f12, %f13
	.word	0xee367ffc	! t0_kref+0x1050:   	sth	%l7, [%i1 - 4]
	.word	0x99a0192f	! t0_kref+0x1054:   	fstod	%f15, %f12
	.word	0xa6f5f8b0	! t0_kref+0x1058:   	udivcc	%l7, -0x750, %l3
	.word	0xae2575e9	! t0_kref+0x105c:   	sub	%l5, -0xa17, %l7
	.word	0x921d3156	! t0_kref+0x1060:   	xor	%l4, -0xeaa, %o1
	.word	0xf83e0000	! t0_kref+0x1064:   	std	%i4, [%i0]
	.word	0x908d71a8	! t0_kref+0x1068:   	andcc	%l5, -0xe58, %o0
	.word	0x93b500e8	! t0_kref+0x106c:   	edge16ln	%l4, %o0, %o1
	.word	0x9de3bfa0	! t0_kref+0x1070:   	save	%sp, -0x60, %sp
	.word	0x97eeaca8	! t0_kref+0x1074:   	restore	%i2, 0xca8, %o3
	.word	0xac054017	! t0_kref+0x1078:   	add	%l5, %l7, %l6
	.word	0xaa648016	! t0_kref+0x107c:   	subc	%l2, %l6, %l5
	.word	0xec266014	! t0_kref+0x1080:   	st	%l6, [%i1 + 0x14]
	.word	0xa9358014	! t0_kref+0x1084:   	srl	%l6, %l4, %l4
	.word	0x9445b96d	! t0_kref+0x1088:   	addc	%l6, -0x693, %o2
	.word	0xa1a018cc	! t0_kref+0x108c:   	fdtos	%f12, %f16
	.word	0xe13f4018	! t0_kref+0x1090:   	std	%f16, [%i5 + %i0]
	.word	0x9de3bfa0	! t0_kref+0x1094:   	save	%sp, -0x60, %sp
	.word	0xb8de7be6	! t0_kref+0x1098:   	smulcc	%i1, -0x41a, %i4
	.word	0x91ef401c	! t0_kref+0x109c:   	restore	%i5, %i4, %o0
	.word	0x9da0052d	! t0_kref+0x10a0:   	fsqrts	%f13, %f14
	.word	0xadb5c113	! t0_kref+0x10a4:   	edge32	%l7, %l3, %l6
	.word	0x9fa388b1	! t0_kref+0x10a8:   	fsubs	%f14, %f17, %f15
	.word	0xaa3d0017	! t0_kref+0x10ac:   	xnor	%l4, %l7, %l5
	.word	0x96d22fda	! t0_kref+0x10b0:   	umulcc	%o0, 0xfda, %o3
	.word	0xa4fd4008	! t0_kref+0x10b4:   	sdivcc	%l5, %o0, %l2
	.word	0xa3a0002e	! t0_kref+0x10b8:   	fmovs	%f14, %f17
	.word	0x9daac050	! t0_kref+0x10bc:   	fmovdge	%fcc0, %f16, %f14
	.word	0xd9263ff4	! t0_kref+0x10c0:   	st	%f12, [%i0 - 0xc]
	.word	0x91400000	! t0_kref+0x10c4:   	mov	%y, %o0
	.word	0x2c800004	! t0_kref+0x10c8:   	bneg,a	_kref+0x10d8
	.word	0xa1a0054c	! t0_kref+0x10cc:   	fsqrtd	%f12, %f16
	.word	0xd9000018	! t0_kref+0x10d0:   	ld	[%g0 + %i0], %f12
	.word	0xe430a004	! t0_kref+0x10d4:   	sth	%l2, [%g2 + 4]
	.word	0xe968a04a	! t0_kref+0x10d8:   	prefetch	%g2 + 0x4a, 20
	.word	0xc807bfec	! t0_kref+0x10dc:   	ld	[%fp - 0x14], %g4
	.word	0xac3a34bc	! t0_kref+0x10e0:   	xnor	%o0, -0xb44, %l6
	.word	0xac048008	! t0_kref+0x10e4:   	add	%l2, %o0, %l6
	.word	0xe42e0000	! t0_kref+0x10e8:   	stb	%l2, [%i0]
	.word	0xa1b3090c	! t0_kref+0x10ec:   	faligndata	%f12, %f12, %f16
	.word	0x34800007	! t0_kref+0x10f0:   	bg,a	_kref+0x110c
	.word	0x99a01090	! t0_kref+0x10f4:   	fxtos	%f16, %f12
	.word	0x99a308ce	! t0_kref+0x10f8:   	fsubd	%f12, %f14, %f12
	.word	0x9675a4c5	! t0_kref+0x10fc:   	udiv	%l6, 0x4c5, %o3
	.word	0x8143c000	! t0_kref+0x1100:   	stbar
	.word	0x99a0054c	! t0_kref+0x1104:   	fsqrtd	%f12, %f12
	.word	0xa1a000d0	! t0_kref+0x1108:   	fnegd	%f16, %f16
	.word	0x943dbffe	! t0_kref+0x110c:   	xnor	%l6, -0x2, %o2
	.word	0xa3a3c9ac	! t0_kref+0x1110:   	fdivs	%f15, %f12, %f17
	.word	0xadb200f6	! t0_kref+0x1114:   	edge16ln	%o0, %l6, %l6
	.word	0xa4fd6dbb	! t0_kref+0x1118:   	sdivcc	%l5, 0xdbb, %l2
	.word	0x99a409d0	! t0_kref+0x111c:   	fdivd	%f16, %f16, %f12
	.word	0x925df9ef	! t0_kref+0x1120:   	smul	%l7, -0x611, %o1
	.word	0x9434ad01	! t0_kref+0x1124:   	orn	%l2, 0xd01, %o2
	.word	0xec26200c	! t0_kref+0x1128:   	st	%l6, [%i0 + 0xc]
	.word	0xd9be5855	! t0_kref+0x112c:   	stda	%f12, [%i1 + %l5]0xc2
	.word	0xae8d4015	! t0_kref+0x1130:   	andcc	%l5, %l5, %l7
	.word	0xa3a348b1	! t0_kref+0x1134:   	fsubs	%f13, %f17, %f17
	.word	0x3a480003	! t0_kref+0x1138:   	bcc,a,pt	%icc, _kref+0x1144
	.word	0xee300018	! t0_kref+0x113c:   	sth	%l7, [%g0 + %i0]
	.word	0x99b30d90	! t0_kref+0x1140:   	fxor	%f12, %f16, %f12
	.word	0xa1a0054c	! t0_kref+0x1144:   	fsqrtd	%f12, %f16
	.word	0x9da018d0	! t0_kref+0x1148:   	fdtos	%f16, %f14
	.word	0xa685ecee	! t0_kref+0x114c:   	addcc	%l7, 0xcee, %l3
	.word	0xe800a01c	! t0_kref+0x1150:   	ld	[%g2 + 0x1c], %l4
	.word	0x81da000e	! t0_kref+0x1154:   	flush	%o0 + %sp
	.word	0x9da3084c	! t0_kref+0x1158:   	faddd	%f12, %f12, %f14
	.word	0x3c480002	! t0_kref+0x115c:   	bpos,a,pt	%icc, _kref+0x1164
	.word	0xa535a004	! t0_kref+0x1160:   	srl	%l6, 0x4, %l2
	.word	0x95b58200	! t0_kref+0x1164:   	array8	%l6, %g0, %o2
	.word	0x33800001	! t0_kref+0x1168:   	fbe,a	_kref+0x116c
	.word	0xa65cff72	! t0_kref+0x116c:   	smul	%l3, -0x8e, %l3
	.word	0x2d480001	! t0_kref+0x1170:   	fbg,a,pt	%fcc0, _kref+0x1174
	.word	0xdd067fe0	! t0_kref+0x1174:   	ld	[%i1 - 0x20], %f14
	.word	0xa9700017	! t0_kref+0x1178:   	popc	%l7, %l4
	.word	0xe846401c	! t0_kref+0x117c:   	ldsw	[%i1 + %i4], %l4
	.word	0x3e800003	! t0_kref+0x1180:   	bvc,a	_kref+0x118c
	.word	0x9fa00031	! t0_kref+0x1184:   	fmovs	%f17, %f15
	.word	0xad400000	! t0_kref+0x1188:   	mov	%y, %l6
	.word	0x94d5e8cd	! t0_kref+0x118c:   	umulcc	%l7, 0x8cd, %o2
	.word	0xa1a0014c	! t0_kref+0x1190:   	fabsd	%f12, %f16
	.word	0xdd070018	! t0_kref+0x1194:   	ld	[%i4 + %i0], %f14
	.word	0x99a3894c	! t0_kref+0x1198:   	fmuld	%f14, %f12, %f12
	.word	0x8143c000	! t0_kref+0x119c:   	stbar
	.word	0x9004e96b	! t0_kref+0x11a0:   	add	%l3, 0x96b, %o0
	.word	0xa1a000ac	! t0_kref+0x11a4:   	fnegs	%f12, %f16
	.word	0x81ab8a4e	! t0_kref+0x11a8:   	fcmpd	%fcc0, %f14, %f14
	.word	0xf83e6018	! t0_kref+0x11ac:   	std	%i4, [%i1 + 0x18]
	.word	0xa1b40c50	! t0_kref+0x11b0:   	fnor	%f16, %f16, %f16
	.word	0xa3a3c82d	! t0_kref+0x11b4:   	fadds	%f15, %f13, %f17
	.word	0xec28a007	! t0_kref+0x11b8:   	stb	%l6, [%g2 + 7]
	.word	0x99b3096f	! t0_kref+0x11bc:   	fpmerge	%f12, %f15, %f12
	.word	0xa8b4b4f0	! t0_kref+0x11c0:   	orncc	%l2, -0xb10, %l4
	.word	0xd40e6000	! t0_kref+0x11c4:   	ldub	[%i1], %o2
	.word	0x972d6003	! t0_kref+0x11c8:   	sll	%l5, 0x3, %o3
	.word	0xa1a389d0	! t0_kref+0x11cc:   	fdivd	%f14, %f16, %f16
	.word	0x9da309cc	! t0_kref+0x11d0:   	fdivd	%f12, %f12, %f14
	.word	0xa3a0052f	! t0_kref+0x11d4:   	fsqrts	%f15, %f17
	.word	0x9fc00004	! t0_kref+0x11d8:   	call	%g0 + %g4
	.word	0xa4ba22b6	! t0_kref+0x11dc:   	xnorcc	%o0, 0x2b6, %l2
	.word	0xd99e501d	! t0_kref+0x11e0:   	ldda	[%i1 + %i5]0x80, %f12
	.word	0xe1be5853	! t0_kref+0x11e4:   	stda	%f16, [%i1 + %l3]0xc2
	.word	0xac5a0008	! t0_kref+0x11e8:   	smul	%o0, %o0, %l6
	.word	0x2f18b1c9	! t0_kref+0x11ec:   	sethi	%hi(0x62c72400), %l7
	.word	0x920a0016	! t0_kref+0x11f0:   	and	%o0, %l6, %o1
	.word	0xd4470018	! t0_kref+0x11f4:   	ldsw	[%i4 + %i0], %o2
	.word	0xd2464000	! t0_kref+0x11f8:   	ldsw	[%i1], %o1
	.word	0x9da4094e	! t0_kref+0x11fc:   	fmuld	%f16, %f14, %f14
	.word	0x9da0054c	! t0_kref+0x1200:   	fsqrtd	%f12, %f14
	.word	0x95b5c055	! t0_kref+0x1204:   	edge8l	%l7, %l5, %o2
	.word	0xa3a0052c	! t0_kref+0x1208:   	fsqrts	%f12, %f17
	.word	0x35800004	! t0_kref+0x120c:   	fbue,a	_kref+0x121c
	.word	0xfb6e3fe8	! t0_kref+0x1210:   	prefetch	%i0 - 0x18, 29
	.word	0xa4d20008	! t0_kref+0x1214:   	umulcc	%o0, %o0, %l2
	.word	0xc5ee1012	! t0_kref+0x1218:   	prefetcha	%i0 + %l2, 2
	.word	0x8143e040	! t0_kref+0x121c:   	membar	0x40
	.word	0x8584c008	! t0_kref+0x1220:   	wr	%l3, %o0, %ccr
	.word	0x99a3c8af	! t0_kref+0x1224:   	fsubs	%f15, %f15, %f12
	.word	0x9da00550	! t0_kref+0x1228:   	fsqrtd	%f16, %f14
	.word	0xa1a409ce	! t0_kref+0x122c:   	fdivd	%f16, %f14, %f16
	.word	0x923df497	! t0_kref+0x1230:   	xnor	%l7, -0xb69, %o1
	.word	0x2f3c4397	! t0_kref+0x1234:   	sethi	%hi(0xf10e5c00), %l7
	.word	0x99b40f50	! t0_kref+0x1238:   	fornot1	%f16, %f16, %f12
	.word	0x81daa9dc	! t0_kref+0x123c:   	flush	%o2 + 0x9dc
	.word	0x9205bac3	! t0_kref+0x1240:   	add	%l6, -0x53d, %o1
	.word	0x92656892	! t0_kref+0x1244:   	subc	%l5, 0x892, %o1
	.word	0xf1ee501a	! t0_kref+0x1248:   	prefetcha	%i1 + %i2, 24
	.word	0xdb00a020	! t0_kref+0x124c:   	ld	[%g2 + 0x20], %f13
	.word	0x969d7ab1	! t0_kref+0x1250:   	xorcc	%l5, -0x54f, %o3
	.word	0xea7e2010	! t0_kref+0x1254:   	swap	[%i0 + 0x10], %l5
	.word	0xd83e3fe8	! t0_kref+0x1258:   	std	%o4, [%i0 - 0x18]
	.word	0xd24e6000	! t0_kref+0x125c:   	ldsb	[%i1], %o1
	.word	0x928cc008	! t0_kref+0x1260:   	andcc	%l3, %o0, %o1
	.word	0xadb305cc	! t0_kref+0x1264:   	fcmpeq32	%f12, %f12, %l6
	.word	0xac9cc014	! t0_kref+0x1268:   	xorcc	%l3, %l4, %l6
	.word	0xeff61013	! t0_kref+0x126c:   	casxa	[%i0]0x80, %l3, %l7
	.word	0xf76e2000	! t0_kref+0x1270:   	prefetch	%i0, 27
	.word	0x99a00550	! t0_kref+0x1274:   	fsqrtd	%f16, %f12
	.word	0x9da388d0	! t0_kref+0x1278:   	fsubd	%f14, %f16, %f14
	.word	0xa7b3058c	! t0_kref+0x127c:   	fcmpgt32	%f12, %f12, %l3
	.word	0x8143e040	! t0_kref+0x1280:   	membar	0x40
	.word	0xa3b00f31	! t0_kref+0x1284:   	fsrc2s	%f17, %f17
	.word	0xec20a004	! t0_kref+0x1288:   	st	%l6, [%g2 + 4]
	.word	0xa9b4048e	! t0_kref+0x128c:   	fcmple32	%f16, %f14, %l4
	.word	0xdb063ff8	! t0_kref+0x1290:   	ld	[%i0 - 8], %f13
	.word	0xa6357de6	! t0_kref+0x1294:   	orn	%l5, -0x21a, %l3
	.word	0xe1be1852	! t0_kref+0x1298:   	stda	%f16, [%i0 + %l2]0xc2
	.word	0xd65e3fe8	! t0_kref+0x129c:   	ldx	[%i0 - 0x18], %o3
	.word	0x81df8004	! t0_kref+0x12a0:   	flush	%fp + %g4
	.word	0xe676401d	! t0_kref+0x12a4:   	stx	%l3, [%i1 + %i5]
	.word	0x99aac030	! t0_kref+0x12a8:   	fmovsge	%fcc0, %f16, %f12
	.word	0x9f414000	! t0_kref+0x12ac:   	mov	%pc, %o7
	.word	0x99b40970	! t0_kref+0x12b0:   	fpmerge	%f16, %f16, %f12
	.word	0x8143e00b	! t0_kref+0x12b4:   	membar	0xb
	.word	0x9da0054c	! t0_kref+0x12b8:   	fsqrtd	%f12, %f14
	.word	0x9da0004e	! t0_kref+0x12bc:   	fmovd	%f14, %f14
	.word	0x94f50016	! t0_kref+0x12c0:   	udivcc	%l4, %l6, %o2
	.word	0x97b4044c	! t0_kref+0x12c4:   	fcmpne16	%f16, %f12, %o3
	.word	0xe3070018	! t0_kref+0x12c8:   	ld	[%i4 + %i0], %f17
	.word	0xc16e7ff8	! t0_kref+0x12cc:   	prefetch	%i1 - 8, 0
	.word	0x9da3884e	! t0_kref+0x12d0:   	faddd	%f14, %f14, %f14
	.word	0xa1a38831	! t0_kref+0x12d4:   	fadds	%f14, %f17, %f16
	.word	0x26480003	! t0_kref+0x12d8:   	bl,a,pt	%icc, _kref+0x12e4
	.word	0xaa65b8fc	! t0_kref+0x12dc:   	subc	%l6, -0x704, %l5
	.word	0xa8357efe	! t0_kref+0x12e0:   	orn	%l5, -0x102, %l4
	.word	0x99a0052e	! t0_kref+0x12e4:   	fsqrts	%f14, %f12
	.word	0x99a38950	! t0_kref+0x12e8:   	fmuld	%f14, %f16, %f12
	.word	0x99a0052c	! t0_kref+0x12ec:   	fsqrts	%f12, %f12
	.word	0xa89c8016	! t0_kref+0x12f0:   	xorcc	%l2, %l6, %l4
	.word	0xe26e401a	! t0_kref+0x12f4:   	ldstub	[%i1 + %i2], %l1
	.word	0x001fffff	! t0_kref+0x12f8:   	illtrap	0x1fffff
	.word	0xac248015	! t0_kref+0x12fc:   	sub	%l2, %l5, %l6
	.word	0xddbe101d	! t0_kref+0x1300:   	stda	%f14, [%i0 + %i5]0x80
	.word	0x8143c000	! t0_kref+0x1304:   	stbar
	.word	0x9ba01a4c	! t0_kref+0x1308:   	fdtoi	%f12, %f13
	.word	0x952d4013	! t0_kref+0x130c:   	sll	%l5, %l3, %o2
	.word	0xd9000018	! t0_kref+0x1310:   	ld	[%g0 + %i0], %f12
	.word	0x9da0002f	! t0_kref+0x1314:   	fmovs	%f15, %f14
	.word	0x99a0002f	! t0_kref+0x1318:   	fmovs	%f15, %f12
	.word	0xa425f8ee	! t0_kref+0x131c:   	sub	%l7, -0x712, %l2
	.word	0x95b30490	! t0_kref+0x1320:   	fcmple32	%f12, %f16, %o2
	.word	0xec40a018	! t0_kref+0x1324:   	ldsw	[%g2 + 0x18], %l6
	.word	0x81db8019	! t0_kref+0x1328:   	flush	%sp + %i1
	.word	0x9ba3c8ae	! t0_kref+0x132c:   	fsubs	%f15, %f14, %f13
	.word	0xe4b61000	! t0_kref+0x1330:   	stha	%l2, [%i0]0x80
	.word	0xa1a0052e	! t0_kref+0x1334:   	fsqrts	%f14, %f16
	.word	0x87802080	! t0_kref+0x1338:   	mov	0x80, %asi
	.word	0x97400000	! t0_kref+0x133c:   	mov	%y, %o3
	.word	0x81abcaac	! t0_kref+0x1340:   	fcmpes	%fcc0, %f15, %f12
	.word	0x81ab4ab0	! t0_kref+0x1344:   	fcmpes	%fcc0, %f13, %f16
	.word	0xa68c8014	! t0_kref+0x1348:   	andcc	%l2, %l4, %l3
	.word	0x95418000	! t0_kref+0x134c:   	mov	%fprs, %o2
	.word	0xaed54015	! t0_kref+0x1350:   	umulcc	%l5, %l5, %l7
	.word	0x2d800002	! t0_kref+0x1354:   	fbg,a	_kref+0x135c
	.word	0xaa5da6c6	! t0_kref+0x1358:   	smul	%l6, 0x6c6, %l5
	.word	0xf03f4005	! t0_kref+0x135c:   	std	%i0, [%i5 + %g5]
	.word	0x30480005	! t0_kref+0x1360:   	ba,a,pt	%icc, _kref+0x1374
	.word	0xd0ae6013	! t0_kref+0x1364:   	stba	%o0, [%i1 + 0x13]%asi
	.word	0xa85d8017	! t0_kref+0x1368:   	smul	%l6, %l7, %l4
	.word	0x9bb007b0	! t0_kref+0x136c:   	fpackfix	%f16, %f13
	.word	0xa1a0054c	! t0_kref+0x1370:   	fsqrtd	%f12, %f16
	.word	0x99a3084c	! t0_kref+0x1374:   	faddd	%f12, %f12, %f12
	.word	0x99b40e0e	! t0_kref+0x1378:   	fand	%f16, %f14, %f12
	.word	0x99b407cc	! t0_kref+0x137c:   	pdist	%f16, %f12, %f12
	.word	0x8143c000	! t0_kref+0x1380:   	stbar
	.word	0x36480003	! t0_kref+0x1384:   	bge,a,pt	%icc, _kref+0x1390
	.word	0x9db38990	! t0_kref+0x1388:   	bshuffle	%f14, %f16, %f14
	.word	0xe6967fec	! t0_kref+0x138c:   	lduha	[%i1 - 0x14]%asi, %l3
	.word	0x33480004	! t0_kref+0x1390:   	fbe,a,pt	%fcc0, _kref+0x13a0
	.word	0xd83e7fe0	! t0_kref+0x1394:   	std	%o4, [%i1 - 0x20]
	.word	0x81ab4ab0	! t0_kref+0x1398:   	fcmpes	%fcc0, %f13, %f16
	.word	0xa6b52e28	! t0_kref+0x139c:   	orncc	%l4, 0xe28, %l3
	.word	0xa67c8015	! t0_kref+0x13a0:   	sdiv	%l2, %l5, %l3
	.word	0x9db38d40	! t0_kref+0x13a4:   	fnot1	%f14, %f14
	.word	0xa1a0054e	! t0_kref+0x13a8:   	fsqrtd	%f14, %f16
	.word	0xa1b30c90	! t0_kref+0x13ac:   	fandnot2	%f12, %f16, %f16
	.word	0x99b3874c	! t0_kref+0x13b0:   	fpack32	%f14, %f12, %f12
	.word	0xa1a408d0	! t0_kref+0x13b4:   	fsubd	%f16, %f16, %f16
	.word	0xa1a00550	! t0_kref+0x13b8:   	fsqrtd	%f16, %f16
	.word	0xe320a01c	! t0_kref+0x13bc:   	st	%f17, [%g2 + 0x1c]
	.word	0x2a480005	! t0_kref+0x13c0:   	bcs,a,pt	%icc, _kref+0x13d4
	.word	0xa9400000	! t0_kref+0x13c4:   	mov	%y, %l4
	.word	0xa895b25b	! t0_kref+0x13c8:   	orcc	%l6, -0xda5, %l4
	.word	0xa904fa1f	! t0_kref+0x13cc:   	taddcc	%l3, -0x5e1, %l4
	.word	0x9465a480	! t0_kref+0x13d0:   	subc	%l6, 0x480, %o2
	.word	0xd6462010	! t0_kref+0x13d4:   	ldsw	[%i0 + 0x10], %o3
	.word	0x9da0054c	! t0_kref+0x13d8:   	fsqrtd	%f12, %f14
	.word	0xe11e4000	! t0_kref+0x13dc:   	ldd	[%i1], %f16
	.word	0x97b4c174	! t0_kref+0x13e0:   	edge32ln	%l3, %l4, %o3
	.word	0xa3a44830	! t0_kref+0x13e4:   	fadds	%f17, %f16, %f17
	.word	0xa1b306b0	! t0_kref+0x13e8:   	fmul8x16al	%f12, %f16, %f16
	.word	0x9de3bfa0	! t0_kref+0x13ec:   	save	%sp, -0x60, %sp
	.word	0xabee8018	! t0_kref+0x13f0:   	restore	%i2, %i0, %l5
	.word	0x949dc014	! t0_kref+0x13f4:   	xorcc	%l7, %l4, %o2
	.word	0x94157f08	! t0_kref+0x13f8:   	or	%l5, -0xf8, %o2
	.word	0xac8de382	! t0_kref+0x13fc:   	andcc	%l7, 0x382, %l6
	.word	0x9255b156	! t0_kref+0x1400:   	umul	%l6, -0xeaa, %o1
	.word	0xad2a200b	! t0_kref+0x1404:   	sll	%o0, 0xb, %l6
	.word	0xa1b387ce	! t0_kref+0x1408:   	pdist	%f14, %f14, %f16
	.word	0xac1d0015	! t0_kref+0x140c:   	xor	%l4, %l5, %l6
	.word	0xd9be5895	! t0_kref+0x1410:   	stda	%f12, [%i1 + %l5]0xc4
	.word	0x99a3884c	! t0_kref+0x1414:   	faddd	%f14, %f12, %f12
	.word	0x9fc00004	! t0_kref+0x1418:   	call	%g0 + %g4
	.word	0x9da0002c	! t0_kref+0x141c:   	fmovs	%f12, %f14
	.word	0x27480004	! t0_kref+0x1420:   	fbul,a,pt	%fcc0, _kref+0x1430
	.word	0xd0c8a00f	! t0_kref+0x1424:   	ldsba	[%g2 + 0xf]%asi, %o0
	call	SYM(t0_subr2)
	.word	0xe36e001d	! t0_kref+0x142c:   	prefetch	%i0 + %i5, 17
	.word	0xa68d25e5	! t0_kref+0x1430:   	andcc	%l4, 0x5e5, %l3
	.word	0x9294c015	! t0_kref+0x1434:   	orcc	%l3, %l5, %o1
	.word	0xd920a034	! t0_kref+0x1438:   	st	%f12, [%g2 + 0x34]
	.word	0x81ac0a50	! t0_kref+0x143c:   	fcmpd	%fcc0, %f16, %f16
	.word	0x99b3cfae	! t0_kref+0x1440:   	fors	%f15, %f14, %f12
	.word	0x926237de	! t0_kref+0x1444:   	subc	%o0, -0x822, %o1
	.word	0xd01f4018	! t0_kref+0x1448:   	ldd	[%i5 + %i0], %o0
	.word	0x81b01025	! t0_kref+0x144c:   	siam	0x5
	.word	0xab05fd87	! t0_kref+0x1450:   	taddcc	%l7, -0x279, %l5
	.word	0xaa8a245f	! t0_kref+0x1454:   	andcc	%o0, 0x45f, %l5
	.word	0x26480007	! t0_kref+0x1458:   	bl,a,pt	%icc, _kref+0x1474
	.word	0xafb385d0	! t0_kref+0x145c:   	fcmpeq32	%f14, %f16, %l7
	.word	0x8584c017	! t0_kref+0x1460:   	wr	%l3, %l7, %ccr
	.word	0x99a0002d	! t0_kref+0x1464:   	fmovs	%f13, %f12
	.word	0x38800006	! t0_kref+0x1468:   	bgu,a	_kref+0x1480
	.word	0xa3a018d0	! t0_kref+0x146c:   	fdtos	%f16, %f17
	.word	0x2f800007	! t0_kref+0x1470:   	fbu,a	_kref+0x148c
	.word	0x9ba308b0	! t0_kref+0x1474:   	fsubs	%f12, %f16, %f13
	.word	0x9ba349af	! t0_kref+0x1478:   	fdivs	%f13, %f15, %f13
	.word	0xe890a00a	! t0_kref+0x147c:   	lduha	[%g2 + 0xa]%asi, %l4
	.word	0xe676401d	! t0_kref+0x1480:   	stx	%l3, [%i1 + %i5]
	.word	0xeeb6200e	! t0_kref+0x1484:   	stha	%l7, [%i0 + 0xe]%asi
	.word	0xaf700008	! t0_kref+0x1488:   	popc	%o0, %l7
	.word	0x99a018ce	! t0_kref+0x148c:   	fdtos	%f14, %f12
	.word	0x81ac0aac	! t0_kref+0x1490:   	fcmpes	%fcc0, %f16, %f12
	.word	0x99b306d0	! t0_kref+0x1494:   	fmul8sux16	%f12, %f16, %f12
	.word	0xf5ee101a	! t0_kref+0x1498:   	prefetcha	%i0 + %i2, 26
	.word	0xee260000	! t0_kref+0x149c:   	st	%l7, [%i0]
	.word	0xee28a011	! t0_kref+0x14a0:   	stb	%l7, [%g2 + 0x11]
	.word	0xa1b38630	! t0_kref+0x14a4:   	fmul8x16	%f14, %f16, %f16
	.word	0xdf20a02c	! t0_kref+0x14a8:   	st	%f15, [%g2 + 0x2c]
	.word	0x9fa3c9ae	! t0_kref+0x14ac:   	fdivs	%f15, %f14, %f15
	.word	0x9de3bfa0	! t0_kref+0x14b0:   	save	%sp, -0x60, %sp
	.word	0xb8b636a5	! t0_kref+0x14b4:   	orncc	%i0, -0x95b, %i4
	.word	0x95eec01d	! t0_kref+0x14b8:   	restore	%i3, %i5, %o2
	.word	0x9bb30e70	! t0_kref+0x14bc:   	fxnors	%f12, %f16, %f13
	.word	0x9275c008	! t0_kref+0x14c0:   	udiv	%l7, %o0, %o1
	.word	0x94b52e94	! t0_kref+0x14c4:   	orncc	%l4, 0xe94, %o2
	.word	0x9da0054c	! t0_kref+0x14c8:   	fsqrtd	%f12, %f14
	.word	0x9da0054e	! t0_kref+0x14cc:   	fsqrtd	%f14, %f14
	.word	0x99b40a4c	! t0_kref+0x14d0:   	fpadd32	%f16, %f12, %f12
	.word	0xa1a0012f	! t0_kref+0x14d4:   	fabss	%f15, %f16
	.word	0x9de3bfa0	! t0_kref+0x14d8:   	save	%sp, -0x60, %sp
	.word	0xafef001d	! t0_kref+0x14dc:   	restore	%i4, %i5, %l7
	.word	0xadb58137	! t0_kref+0x14e0:   	edge32n	%l6, %l7, %l6
	.word	0xdf06601c	! t0_kref+0x14e4:   	ld	[%i1 + 0x1c], %f15
	.word	0x948d294a	! t0_kref+0x14e8:   	andcc	%l4, 0x94a, %o2
	.word	0x943ce674	! t0_kref+0x14ec:   	xnor	%l3, 0x674, %o2
	.word	0xeab01019	! t0_kref+0x14f0:   	stha	%l5, [%g0 + %i1]0x80
	.word	0xaa3d0016	! t0_kref+0x14f4:   	xnor	%l4, %l6, %l5
	.word	0x93418000	! t0_kref+0x14f8:   	mov	%fprs, %o1
	.word	0xa1b44eed	! t0_kref+0x14fc:   	fornot2s	%f17, %f13, %f16
	.word	0xe4a8a00c	! t0_kref+0x1500:   	stba	%l2, [%g2 + 0xc]%asi
	.word	0x965d4014	! t0_kref+0x1504:   	smul	%l5, %l4, %o3
	.word	0xf83e001d	! t0_kref+0x1508:   	std	%i4, [%i0 + %i5]
	.word	0x90fd2a3f	! t0_kref+0x150c:   	sdivcc	%l4, 0xa3f, %o0
	.word	0x9db30d10	! t0_kref+0x1510:   	fandnot1	%f12, %f16, %f14
	.word	0xe1066010	! t0_kref+0x1514:   	ld	[%i1 + 0x10], %f16
	.word	0x9484c008	! t0_kref+0x1518:   	addcc	%l3, %o0, %o2
	.word	0xd0ae1000	! t0_kref+0x151c:   	stba	%o0, [%i0]0x80
	.word	0xee5e6000	! t0_kref+0x1520:   	ldx	[%i1], %l7
	.word	0xef6e401d	! t0_kref+0x1524:   	prefetch	%i1 + %i5, 23
	.word	0xa40c8016	! t0_kref+0x1528:   	and	%l2, %l6, %l2
	.word	0xa4058012	! t0_kref+0x152c:   	add	%l6, %l2, %l2
	.word	0xee200018	! t0_kref+0x1530:   	st	%l7, [%g0 + %i0]
	.word	0xdd1e401d	! t0_kref+0x1534:   	ldd	[%i1 + %i5], %f14
	.word	0xea96505b	! t0_kref+0x1538:   	lduha	[%i1 + %i3]0x82, %l5
	.word	0xaafd4013	! t0_kref+0x153c:   	sdivcc	%l5, %l3, %l5
	.word	0x9ba0002f	! t0_kref+0x1540:   	fmovs	%f15, %f13
	.word	0x9da3c82d	! t0_kref+0x1544:   	fadds	%f15, %f13, %f14
	.word	0xf43e4000	! t0_kref+0x1548:   	std	%i2, [%i1]
	.word	0xad418000	! t0_kref+0x154c:   	mov	%fprs, %l6
	.word	0x81da001d	! t0_kref+0x1550:   	flush	%o0 + %i5
	.word	0x9da0052c	! t0_kref+0x1554:   	fsqrts	%f12, %f14
	.word	0xa3a0012e	! t0_kref+0x1558:   	fabss	%f14, %f17
	.word	0xee20a02c	! t0_kref+0x155c:   	st	%l7, [%g2 + 0x2c]
	.word	0x99a40950	! t0_kref+0x1560:   	fmuld	%f16, %f16, %f12
	.word	0x99a40850	! t0_kref+0x1564:   	faddd	%f16, %f16, %f12
	.word	0x24800001	! t0_kref+0x1568:   	ble,a	_kref+0x156c
	.word	0xa1a000ad	! t0_kref+0x156c:   	fnegs	%f13, %f16
	.word	0xee30a01c	! t0_kref+0x1570:   	sth	%l7, [%g2 + 0x1c]
	.word	0xe8c8a03e	! t0_kref+0x1574:   	ldsba	[%g2 + 0x3e]%asi, %l4
	.word	0xd93e0000	! t0_kref+0x1578:   	std	%f12, [%i0]
	.word	0xac348008	! t0_kref+0x157c:   	orn	%l2, %o0, %l6
	.word	0x26480005	! t0_kref+0x1580:   	bl,a,pt	%icc, _kref+0x1594
	.word	0xec30a020	! t0_kref+0x1584:   	sth	%l6, [%g2 + 0x20]
	.word	0x9405c015	! t0_kref+0x1588:   	add	%l7, %l5, %o2
	.word	0x9664b03d	! t0_kref+0x158c:   	subc	%l2, -0xfc3, %o3
	.word	0xa1a0110e	! t0_kref+0x1590:   	fxtod	%f14, %f16
	.word	0xe1863fe8	! t0_kref+0x1594:   	lda	[%i0 - 0x18]%asi, %f16
	.word	0xee8e9018	! t0_kref+0x1598:   	lduba	[%i2 + %i0]0x80, %l7
	.word	0xd2c67ff4	! t0_kref+0x159c:   	ldswa	[%i1 - 0xc]%asi, %o1
	.word	0xa1a408ae	! t0_kref+0x15a0:   	fsubs	%f16, %f14, %f16
	.word	0x94258014	! t0_kref+0x15a4:   	sub	%l6, %l4, %o2
	.word	0xa4950016	! t0_kref+0x15a8:   	orcc	%l4, %l6, %l2
	.word	0xa1b30d10	! t0_kref+0x15ac:   	fandnot1	%f12, %f16, %f16
	.word	0x2f800007	! t0_kref+0x15b0:   	fbu,a	_kref+0x15cc
	.word	0xa1a388b0	! t0_kref+0x15b4:   	fsubs	%f14, %f16, %f16
	.word	0xe8762018	! t0_kref+0x15b8:   	stx	%l4, [%i0 + 0x18]
	.word	0xf9ee101b	! t0_kref+0x15bc:   	prefetcha	%i0 + %i3, 28
	.word	0x39800002	! t0_kref+0x15c0:   	fbuge,a	_kref+0x15c8
	.word	0xe968a042	! t0_kref+0x15c4:   	prefetch	%g2 + 0x42, 20
	.word	0xd81e7fe0	! t0_kref+0x15c8:   	ldd	[%i1 - 0x20], %o4
	.word	0x81580000	! t0_kref+0x15cc:   	flushw
	.word	0xabb384cc	! t0_kref+0x15d0:   	fcmpne32	%f14, %f12, %l5
	.word	0x99a308ae	! t0_kref+0x15d4:   	fsubs	%f12, %f14, %f12
	.word	0x9045c012	! t0_kref+0x15d8:   	addc	%l7, %l2, %o0
	.word	0xdb067ff0	! t0_kref+0x15dc:   	ld	[%i1 - 0x10], %f13
	.word	0xa3a0052f	! t0_kref+0x15e0:   	fsqrts	%f15, %f17
	.word	0x3a480007	! t0_kref+0x15e4:   	bcc,a,pt	%icc, _kref+0x1600
	.word	0x81d9400b	! t0_kref+0x15e8:   	flush	%g5 + %o3
	.word	0xdd180019	! t0_kref+0x15ec:   	ldd	[%g0 + %i1], %f14
	.word	0x9da389ce	! t0_kref+0x15f0:   	fdivd	%f14, %f14, %f14
	.word	0x99a00550	! t0_kref+0x15f4:   	fsqrtd	%f16, %f12
	.word	0x9da3894e	! t0_kref+0x15f8:   	fmuld	%f14, %f14, %f14
	.word	0xeca8a018	! t0_kref+0x15fc:   	stba	%l6, [%g2 + 0x18]%asi
	.word	0x929c8012	! t0_kref+0x1600:   	xorcc	%l2, %l2, %o1
	.word	0xa1a00550	! t0_kref+0x1604:   	fsqrtd	%f16, %f16
	.word	0x963a2d41	! t0_kref+0x1608:   	xnor	%o0, 0xd41, %o3
	.word	0x9ba3492e	! t0_kref+0x160c:   	fmuls	%f13, %f14, %f13
	.word	0x3b800001	! t0_kref+0x1610:   	fble,a	_kref+0x1614
	.word	0x9da3084c	! t0_kref+0x1614:   	faddd	%f12, %f12, %f14
	.word	0x97400000	! t0_kref+0x1618:   	mov	%y, %o3
	.word	0x36480007	! t0_kref+0x161c:   	bge,a,pt	%icc, _kref+0x1638
	.word	0xae74ad80	! t0_kref+0x1620:   	udiv	%l2, 0xd80, %l7
	.word	0x9685c015	! t0_kref+0x1624:   	addcc	%l7, %l5, %o3
	.word	0xc807bfe8	! t0_kref+0x1628:   	ld	[%fp - 0x18], %g4
	.word	0x90920017	! t0_kref+0x162c:   	orcc	%o0, %l7, %o0
	.word	0x9634aa7c	! t0_kref+0x1630:   	orn	%l2, 0xa7c, %o3
	.word	0xe81e6008	! t0_kref+0x1634:   	ldd	[%i1 + 8], %l4
	.word	0x95b4c128	! t0_kref+0x1638:   	edge32n	%l3, %o0, %o2
	.word	0xa1b38c90	! t0_kref+0x163c:   	fandnot2	%f14, %f16, %f16
	.word	0x9044a001	! t0_kref+0x1640:   	addc	%l2, 1, %o0
	.word	0x8143e062	! t0_kref+0x1644:   	membar	0x62
	.word	0xec6e2015	! t0_kref+0x1648:   	ldstub	[%i0 + 0x15], %l6
	.word	0xa1a00531	! t0_kref+0x164c:   	fsqrts	%f17, %f16
	.word	0xa5400000	! t0_kref+0x1650:   	mov	%y, %l2
	.word	0x99a30950	! t0_kref+0x1654:   	fmuld	%f12, %f16, %f12
	.word	0x8143e040	! t0_kref+0x1658:   	membar	0x40
	.word	0x901a0008	! t0_kref+0x165c:   	xor	%o0, %o0, %o0
	.word	0xa1b30d2e	! t0_kref+0x1660:   	fandnot1s	%f12, %f14, %f16
	.word	0xe8d6201e	! t0_kref+0x1664:   	ldsha	[%i0 + 0x1e]%asi, %l4
	.word	0x9224fcc9	! t0_kref+0x1668:   	sub	%l3, -0x337, %o1
	.word	0x9da8c02f	! t0_kref+0x166c:   	fmovsul	%fcc0, %f15, %f14
	.word	0xa1a0002f	! t0_kref+0x1670:   	fmovs	%f15, %f16
	.word	0x81ab0aac	! t0_kref+0x1674:   	fcmpes	%fcc0, %f12, %f12
	.word	0xae658016	! t0_kref+0x1678:   	subc	%l6, %l6, %l7
	.word	0xfd6e6000	! t0_kref+0x167c:   	prefetch	%i1, 30
	.word	0x9de3bfa0	! t0_kref+0x1680:   	save	%sp, -0x60, %sp
	.word	0xa9ee6aba	! t0_kref+0x1684:   	restore	%i1, 0xaba, %l4
	.word	0xd9066004	! t0_kref+0x1688:   	ld	[%i1 + 4], %f12
	.word	0xaa5defce	! t0_kref+0x168c:   	smul	%l7, 0xfce, %l5
	.word	0xa1a0054c	! t0_kref+0x1690:   	fsqrtd	%f12, %f16
	.word	0x9ba38930	! t0_kref+0x1694:   	fmuls	%f14, %f16, %f13
	.word	0x99b38def	! t0_kref+0x1698:   	fnands	%f14, %f15, %f12
	.word	0xa664e574	! t0_kref+0x169c:   	subc	%l3, 0x574, %l3
	.word	0x93b50356	! t0_kref+0x16a0:   	alignaddrl	%l4, %l6, %o1
	.word	0xa624afd0	! t0_kref+0x16a4:   	sub	%l2, 0xfd0, %l3
	.word	0xae650008	! t0_kref+0x16a8:   	subc	%l4, %o0, %l7
	.word	0x81ab0aac	! t0_kref+0x16ac:   	fcmpes	%fcc0, %f12, %f12
	.word	0x96ba2509	! t0_kref+0x16b0:   	xnorcc	%o0, 0x509, %o3
	.word	0x943d7fb0	! t0_kref+0x16b4:   	xnor	%l5, -0x50, %o2
	.word	0x9da0054c	! t0_kref+0x16b8:   	fsqrtd	%f12, %f14
	.word	0xe1be1856	! t0_kref+0x16bc:   	stda	%f16, [%i0 + %l6]0xc2
	.word	0xea260000	! t0_kref+0x16c0:   	st	%l5, [%i0]
	.word	0xaf053186	! t0_kref+0x16c4:   	taddcc	%l4, -0xe7a, %l7
	.word	0x99a01a4e	! t0_kref+0x16c8:   	fdtoi	%f14, %f12
	.word	0x99a00550	! t0_kref+0x16cc:   	fsqrtd	%f16, %f12
	.word	0x99b00ccc	! t0_kref+0x16d0:   	fnot2	%f12, %f12
	.word	0x9de3bfa0	! t0_kref+0x16d4:   	save	%sp, -0x60, %sp
	.word	0xa5e8001a	! t0_kref+0x16d8:   	restore	%g0, %i2, %l2
	.word	0x9fb30cb1	! t0_kref+0x16dc:   	fandnot2s	%f12, %f17, %f15
	.word	0x9135c012	! t0_kref+0x16e0:   	srl	%l7, %l2, %o0
	.word	0xa1b40acc	! t0_kref+0x16e4:   	fpsub32	%f16, %f12, %f16
	.word	0x9265be58	! t0_kref+0x16e8:   	subc	%l6, -0x1a8, %o1
	.word	0xa1a309af	! t0_kref+0x16ec:   	fdivs	%f12, %f15, %f16
	.word	0xa1b009ac	! t0_kref+0x16f0:   	fexpand	%f12, %f16
	.word	0x99b38d8e	! t0_kref+0x16f4:   	fxor	%f14, %f14, %f12
	.word	0xe46e0000	! t0_kref+0x16f8:   	ldstub	[%i0], %l2
	.word	0xaa84f25e	! t0_kref+0x16fc:   	addcc	%l3, -0xda2, %l5
	.word	0x9db30a0c	! t0_kref+0x1700:   	fpadd16	%f12, %f12, %f14
	.word	0x22480006	! t0_kref+0x1704:   	be,a,pt	%icc, _kref+0x171c
	.word	0xae3d20bf	! t0_kref+0x1708:   	xnor	%l4, 0xbf, %l7
	.word	0xe6a0a00c	! t0_kref+0x170c:   	sta	%l3, [%g2 + 0xc]%asi
	.word	0x21800002	! t0_kref+0x1710:   	fbn,a	_kref+0x1718
	.word	0xe420a00c	! t0_kref+0x1714:   	st	%l2, [%g2 + 0xc]
	.word	0xafb4c173	! t0_kref+0x1718:   	edge32ln	%l3, %l3, %l7
	.word	0x8143e040	! t0_kref+0x171c:   	membar	0x40
	.word	0x9da4084e	! t0_kref+0x1720:   	faddd	%f16, %f14, %f14
	.word	0x27800008	! t0_kref+0x1724:   	fbul,a	_kref+0x1744
	.word	0xe1be1892	! t0_kref+0x1728:   	stda	%f16, [%i0 + %l2]0xc4
	.word	0x3f800005	! t0_kref+0x172c:   	fbo,a	_kref+0x1740
	.word	0x99a309b1	! t0_kref+0x1730:   	fdivs	%f12, %f17, %f12
	.word	0xdb00a000	! t0_kref+0x1734:   	ld	[%g2], %f13
	.word	0x9da000af	! t0_kref+0x1738:   	fnegs	%f15, %f14
	.word	0x9da0054e	! t0_kref+0x173c:   	fsqrtd	%f14, %f14
	.word	0xee2e7fff	! t0_kref+0x1740:   	stb	%l7, [%i1 - 1]
	.word	0xacfcc015	! t0_kref+0x1744:   	sdivcc	%l3, %l5, %l6
	.word	0x9faa8031	! t0_kref+0x1748:   	fmovsue	%fcc0, %f17, %f15
	.word	0x8143e040	! t0_kref+0x174c:   	membar	0x40
	.word	0xae5c8015	! t0_kref+0x1750:   	smul	%l2, %l5, %l7
	.word	0xa1b009ad	! t0_kref+0x1754:   	fexpand	%f13, %f16
	.word	0xa1a0054e	! t0_kref+0x1758:   	fsqrtd	%f14, %f16
	.word	0xa1a0054e	! t0_kref+0x175c:   	fsqrtd	%f14, %f16
	.word	0xad1d2d20	! t0_kref+0x1760:   	tsubcctv	%l4, 0xd20, %l6
	.word	0x28800003	! t0_kref+0x1764:   	bleu,a	_kref+0x1770
	.word	0x9fb00fe0	! t0_kref+0x1768:   	fones	%f15
	.word	0x99a30950	! t0_kref+0x176c:   	fmuld	%f12, %f16, %f12
	.word	0x99b00cd0	! t0_kref+0x1770:   	fnot2	%f16, %f12
	.word	0x90654015	! t0_kref+0x1774:   	subc	%l5, %l5, %o0
	.word	0x9da389cc	! t0_kref+0x1778:   	fdivd	%f14, %f12, %f14
	.word	0xddbe1000	! t0_kref+0x177c:   	stda	%f14, [%i0]0x80
	.word	0xe1f61017	! t0_kref+0x1780:   	casxa	[%i0]0x80, %l7, %l0
	.word	0xa8222b0f	! t0_kref+0x1784:   	sub	%o0, 0xb0f, %l4
	.word	0x99b34aae	! t0_kref+0x1788:   	fpsub16s	%f13, %f14, %f12
	.word	0xa1a000b0	! t0_kref+0x178c:   	fnegs	%f16, %f16
	.word	0x27005d8a	! t0_kref+0x1790:   	sethi	%hi(0x1762800), %l3
	.word	0xa4620016	! t0_kref+0x1794:   	subc	%o0, %l6, %l2
	.word	0x95400000	! t0_kref+0x1798:   	mov	%y, %o2
	.word	0x94958014	! t0_kref+0x179c:   	orcc	%l6, %l4, %o2
	.word	0x9db40f8c	! t0_kref+0x17a0:   	for	%f16, %f12, %f14
	.word	0x9484aad2	! t0_kref+0x17a4:   	addcc	%l2, 0xad2, %o2
	.word	0x99a3892d	! t0_kref+0x17a8:   	fmuls	%f14, %f13, %f12
	.word	0x27800007	! t0_kref+0x17ac:   	fbul,a	_kref+0x17c8
	.word	0x8143c000	! t0_kref+0x17b0:   	stbar
	.word	0xe8280019	! t0_kref+0x17b4:   	stb	%l4, [%g0 + %i1]
	.word	0x9bb0076e	! t0_kref+0x17b8:   	fpack16	%f14, %f13
	.word	0xa404bf1a	! t0_kref+0x17bc:   	add	%l2, -0xe6, %l2
	.word	0x9da408b1	! t0_kref+0x17c0:   	fsubs	%f16, %f17, %f14
	.word	0xa1a0054e	! t0_kref+0x17c4:   	fsqrtd	%f14, %f16
	.word	0x99b00f2d	! t0_kref+0x17c8:   	fsrc2s	%f13, %f12
	.word	0xe808a00b	! t0_kref+0x17cc:   	ldub	[%g2 + 0xb], %l4
	.word	0x97418000	! t0_kref+0x17d0:   	mov	%fprs, %o3
	.word	0xee86505c	! t0_kref+0x17d4:   	lda	[%i1 + %i4]0x82, %l7
	.word	0xe06e8019	! t0_kref+0x17d8:   	ldstub	[%i2 + %i1], %l0
	.word	0x9215c015	! t0_kref+0x17dc:   	or	%l7, %l5, %o1
	.word	0x9ba0052d	! t0_kref+0x17e0:   	fsqrts	%f13, %f13
	.word	0x9db38d8c	! t0_kref+0x17e4:   	fxor	%f14, %f12, %f14
	.word	0xe4280018	! t0_kref+0x17e8:   	stb	%l2, [%g0 + %i0]
	.word	0x9ba0002e	! t0_kref+0x17ec:   	fmovs	%f14, %f13
	.word	0x96fcc016	! t0_kref+0x17f0:   	sdivcc	%l3, %l6, %o3
	.word	0xa1a0108c	! t0_kref+0x17f4:   	fxtos	%f12, %f16
	.word	0x81ab4aae	! t0_kref+0x17f8:   	fcmpes	%fcc0, %f13, %f14
	.word	0xeaa0a010	! t0_kref+0x17fc:   	sta	%l5, [%g2 + 0x10]%asi
	.word	0x905d3bf1	! t0_kref+0x1800:   	smul	%l4, -0x40f, %o0
	.word	0x99a30950	! t0_kref+0x1804:   	fmuld	%f12, %f16, %f12
	.word	0xafb5c057	! t0_kref+0x1808:   	edge8l	%l7, %l7, %l7
	.word	0xa1b40d0e	! t0_kref+0x180c:   	fandnot1	%f16, %f14, %f16
	.word	0xa8c48016	! t0_kref+0x1810:   	addccc	%l2, %l6, %l4
	.word	0x2f800005	! t0_kref+0x1814:   	fbu,a	_kref+0x1828
	.word	0xe3063fe8	! t0_kref+0x1818:   	ld	[%i0 - 0x18], %f17
	.word	0xad2d8008	! t0_kref+0x181c:   	sll	%l6, %o0, %l6
	.word	0xa1b00f10	! t0_kref+0x1820:   	fsrc2	%f16, %f16
	.word	0x250608f7	! t0_kref+0x1824:   	sethi	%hi(0x1823dc00), %l2
	.word	0xa3b44e70	! t0_kref+0x1828:   	fxnors	%f17, %f16, %f17
	.word	0xa1a01a4c	! t0_kref+0x182c:   	fdtoi	%f12, %f16
	.word	0xeeb63ff4	! t0_kref+0x1830:   	stha	%l7, [%i0 - 0xc]%asi
	.word	0xd9be1000	! t0_kref+0x1834:   	stda	%f12, [%i0]0x80
	.word	0x92648016	! t0_kref+0x1838:   	subc	%l2, %l6, %o1
	.word	0xae3cc008	! t0_kref+0x183c:   	xnor	%l3, %o0, %l7
	.word	0x99a0054c	! t0_kref+0x1840:   	fsqrtd	%f12, %f12
	.word	0xec2e4000	! t0_kref+0x1844:   	stb	%l6, [%i1]
	.word	0xc807bff0	! t0_kref+0x1848:   	ld	[%fp - 0x10], %g4
	.word	0xee2e7ffa	! t0_kref+0x184c:   	stb	%l7, [%i1 - 6]
	.word	0x90ad4008	! t0_kref+0x1850:   	andncc	%l5, %o0, %o0
	.word	0xe42e601f	! t0_kref+0x1854:   	stb	%l2, [%i1 + 0x1f]
	.word	0xa43dc016	! t0_kref+0x1858:   	xnor	%l7, %l6, %l2
	.word	0x3c480004	! t0_kref+0x185c:   	bpos,a,pt	%icc, _kref+0x186c
	.word	0x9db40d8c	! t0_kref+0x1860:   	fxor	%f16, %f12, %f14
	.word	0x9db30d0e	! t0_kref+0x1864:   	fandnot1	%f12, %f14, %f14
	.word	0xa845346b	! t0_kref+0x1868:   	addc	%l4, -0xb95, %l4
	.word	0xd068a010	! t0_kref+0x186c:   	ldstub	[%g2 + 0x10], %o0
	.word	0xa3a349ae	! t0_kref+0x1870:   	fdivs	%f13, %f14, %f17
	.word	0x93b4058c	! t0_kref+0x1874:   	fcmpgt32	%f16, %f12, %o1
	.word	0xdd1e001d	! t0_kref+0x1878:   	ldd	[%i0 + %i5], %f14
	.word	0x9da0002f	! t0_kref+0x187c:   	fmovs	%f15, %f14
	.word	0xadb4044c	! t0_kref+0x1880:   	fcmpne16	%f16, %f12, %l6
	.word	0xa1a01a4e	! t0_kref+0x1884:   	fdtoi	%f14, %f16
	.word	0xa9b4c048	! t0_kref+0x1888:   	edge8l	%l3, %o0, %l4
	.word	0xe888a03d	! t0_kref+0x188c:   	lduba	[%g2 + 0x3d]%asi, %l4
	.word	0x81b01025	! t0_kref+0x1890:   	siam	0x5
	.word	0xe8362014	! t0_kref+0x1894:   	sth	%l4, [%i0 + 0x14]
	.word	0x90f58015	! t0_kref+0x1898:   	udivcc	%l6, %l5, %o0
	.word	0x9ba4492d	! t0_kref+0x189c:   	fmuls	%f17, %f13, %f13
	.word	0x8143e027	! t0_kref+0x18a0:   	membar	0x27
	.word	0x1127c878	! t0_kref+0x18a4:   	sethi	%hi(0x9f21e000), %o0
	.word	0xd9be5000	! t0_kref+0x18a8:   	stda	%f12, [%i1]0x80
	.word	0xe1180018	! t0_kref+0x18ac:   	ldd	[%g0 + %i0], %f16
	.word	0xa49cc016	! t0_kref+0x18b0:   	xorcc	%l3, %l6, %l2
	.word	0xac9d4016	! t0_kref+0x18b4:   	xorcc	%l5, %l6, %l6
	.word	0xac9cbd5d	! t0_kref+0x18b8:   	xorcc	%l2, -0x2a3, %l6
	.word	0xa9b5c136	! t0_kref+0x18bc:   	edge32n	%l7, %l6, %l4
	.word	0xa1a348af	! t0_kref+0x18c0:   	fsubs	%f13, %f15, %f16
	.word	0x99a409cc	! t0_kref+0x18c4:   	fdivd	%f16, %f12, %f12
	.word	0xd030a01a	! t0_kref+0x18c8:   	sth	%o0, [%g2 + 0x1a]
	.word	0x86102002	! t0_kref+0x18cc:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x18d0:   	bne,a	_kref+0x18d0
	.word	0x86a0e001	! t0_kref+0x18d4:   	subcc	%g3, 1, %g3
	.word	0xfbee101a	! t0_kref+0x18d8:   	prefetcha	%i0 + %i2, 29
	.word	0xa1a0014c	! t0_kref+0x18dc:   	fabsd	%f12, %f16
	.word	0x001fffff	! t0_kref+0x18e0:   	illtrap	0x1fffff
	.word	0xd9be1888	! t0_kref+0x18e4:   	stda	%f12, [%i0 + %o0]0xc4
	.word	0x943dbbed	! t0_kref+0x18e8:   	xnor	%l6, -0x413, %o2
	.word	0x99a38950	! t0_kref+0x18ec:   	fmuld	%f14, %f16, %f12
	.word	0x9de3bfa0	! t0_kref+0x18f0:   	save	%sp, -0x60, %sp
	.word	0xabef001a	! t0_kref+0x18f4:   	restore	%i4, %i2, %l5
	.word	0x99a0054c	! t0_kref+0x18f8:   	fsqrtd	%f12, %f12
	.word	0xe1871018	! t0_kref+0x18fc:   	lda	[%i4 + %i0]0x80, %f16
	.word	0x9fa01a50	! t0_kref+0x1900:   	fdtoi	%f16, %f15
	.word	0xc56e6018	! t0_kref+0x1904:   	prefetch	%i1 + 0x18, 2
	.word	0xe306001c	! t0_kref+0x1908:   	ld	[%i0 + %i4], %f17
	.word	0xac452b6e	! t0_kref+0x190c:   	addc	%l4, 0xb6e, %l6
	.word	0xa1a00030	! t0_kref+0x1910:   	fmovs	%f16, %f16
	.word	0xa63a0008	! t0_kref+0x1914:   	xnor	%o0, %o0, %l3
	.word	0xa1a0012d	! t0_kref+0x1918:   	fabss	%f13, %f16
	.word	0xacf48017	! t0_kref+0x191c:   	udivcc	%l2, %l7, %l6
	.word	0xdd380018	! t0_kref+0x1920:   	std	%f14, [%g0 + %i0]
	.word	0x37800006	! t0_kref+0x1924:   	fbge,a	_kref+0x193c
	.word	0xa1a308d0	! t0_kref+0x1928:   	fsubd	%f12, %f16, %f16
	.word	0xacb5a387	! t0_kref+0x192c:   	orncc	%l6, 0x387, %l6
	.word	0x9fa018d0	! t0_kref+0x1930:   	fdtos	%f16, %f15
	.word	0x001fffff	! t0_kref+0x1934:   	illtrap	0x1fffff
	.word	0xa4f5291c	! t0_kref+0x1938:   	udivcc	%l4, 0x91c, %l2
	.word	0xd0a0a030	! t0_kref+0x193c:   	sta	%o0, [%g2 + 0x30]%asi
	.word	0xd93e001d	! t0_kref+0x1940:   	std	%f12, [%i0 + %i5]
	.word	0xee56c019	! t0_kref+0x1944:   	ldsh	[%i3 + %i1], %l7
	.word	0x903a0016	! t0_kref+0x1948:   	xnor	%o0, %l6, %o0
	.word	0x3d800007	! t0_kref+0x194c:   	fbule,a	_kref+0x1968
	.word	0xa5b500e8	! t0_kref+0x1950:   	edge16ln	%l4, %o0, %l2
	.word	0xa1a00550	! t0_kref+0x1954:   	fsqrtd	%f16, %f16
	.word	0xa1b30d90	! t0_kref+0x1958:   	fxor	%f12, %f16, %f16
	.word	0x99a00530	! t0_kref+0x195c:   	fsqrts	%f16, %f12
	.word	0xe3862008	! t0_kref+0x1960:   	lda	[%i0 + 8]%asi, %f17
	.word	0x9da000ac	! t0_kref+0x1964:   	fnegs	%f12, %f14
	.word	0x9fa0052d	! t0_kref+0x1968:   	fsqrts	%f13, %f15
	.word	0x90b5fe37	! t0_kref+0x196c:   	orncc	%l7, -0x1c9, %o0
	.word	0xa1a000ce	! t0_kref+0x1970:   	fnegd	%f14, %f16
	.word	0x9fa3882d	! t0_kref+0x1974:   	fadds	%f14, %f13, %f15
	.word	0xaa223bf8	! t0_kref+0x1978:   	sub	%o0, -0x408, %l5
	.word	0x81dac00a	! t0_kref+0x197c:   	flush	%o3 + %o2
	.word	0xadb580d3	! t0_kref+0x1980:   	edge16l	%l6, %l3, %l6
	.word	0x9da0052e	! t0_kref+0x1984:   	fsqrts	%f14, %f14
	.word	0xe13e401d	! t0_kref+0x1988:   	std	%f16, [%i1 + %i5]
	.word	0xf83e7ff8	! t0_kref+0x198c:   	std	%i4, [%i1 - 8]
	.word	0xe2e81018	! t0_kref+0x1990:   	ldstuba	[%g0 + %i0]0x80, %l1
	.word	0xeb68a08a	! t0_kref+0x1994:   	prefetch	%g2 + 0x8a, 21
	.word	0x93b384cc	! t0_kref+0x1998:   	fcmpne32	%f14, %f12, %o1
	.word	0xa1a018ce	! t0_kref+0x199c:   	fdtos	%f14, %f16
	.word	0xa1b3098c	! t0_kref+0x19a0:   	bshuffle	%f12, %f12, %f16
	.word	0xe1be5a1d	! t0_kref+0x19a4:   	stda	%f16, [%i1 + %i5]0xd0
	.word	0x93b5c173	! t0_kref+0x19a8:   	edge32ln	%l7, %l3, %o1
	.word	0x99a408ce	! t0_kref+0x19ac:   	fsubd	%f16, %f14, %f12
	.word	0xadb48333	! t0_kref+0x19b0:   	bmask	%l2, %l3, %l6
	.word	0xa1a0054e	! t0_kref+0x19b4:   	fsqrtd	%f14, %f16
	.word	0xa3a308b0	! t0_kref+0x19b8:   	fsubs	%f12, %f16, %f17
	.word	0xba102000	! t0_kref+0x19bc:   	mov	0x0, %i5
	.word	0x99a018d0	! t0_kref+0x19c0:   	fdtos	%f16, %f12
	.word	0x81ac0ace	! t0_kref+0x19c4:   	fcmped	%fcc0, %f16, %f14
	.word	0xa1b00c20	! t0_kref+0x19c8:   	fzeros	%f16
	.word	0x24800001	! t0_kref+0x19cc:   	ble,a	_kref+0x19d0
	.word	0xe66e3ffd	! t0_kref+0x19d0:   	ldstub	[%i0 - 3], %l3
	.word	0xec562002	! t0_kref+0x19d4:   	ldsh	[%i0 + 2], %l6
	.word	0x99a40950	! t0_kref+0x19d8:   	fmuld	%f16, %f16, %f12
	.word	0xea267fec	! t0_kref+0x19dc:   	st	%l5, [%i1 - 0x14]
	.word	0xa4fcc014	! t0_kref+0x19e0:   	sdivcc	%l3, %l4, %l2
	.word	0x9db44e31	! t0_kref+0x19e4:   	fands	%f17, %f17, %f14
	.word	0x8143e040	! t0_kref+0x19e8:   	membar	0x40
	.word	0xa1a30950	! t0_kref+0x19ec:   	fmuld	%f12, %f16, %f16
	.word	0xa1a0054e	! t0_kref+0x19f0:   	fsqrtd	%f14, %f16
	.word	0x8143e073	! t0_kref+0x19f4:   	membar	0x73
	.word	0xd246001c	! t0_kref+0x19f8:   	ldsw	[%i0 + %i4], %o1
	.word	0xeab0a02a	! t0_kref+0x19fc:   	stha	%l5, [%g2 + 0x2a]%asi
	.word	0x99a01891	! t0_kref+0x1a00:   	fitos	%f17, %f12
	.word	0xeeb0a010	! t0_kref+0x1a04:   	stha	%l7, [%g2 + 0x10]%asi
	.word	0xb6102004	! t0_kref+0x1a08:   	mov	0x4, %i3
	.word	0x95320016	! t0_kref+0x1a0c:   	srl	%o0, %l6, %o2
	.word	0x91b404cc	! t0_kref+0x1a10:   	fcmpne32	%f16, %f12, %o0
	.word	0xa1b407cc	! t0_kref+0x1a14:   	pdist	%f16, %f12, %f16
	.word	0x99a4482f	! t0_kref+0x1a18:   	fadds	%f17, %f15, %f12
	.word	0x969d0008	! t0_kref+0x1a1c:   	xorcc	%l4, %o0, %o3
	call	SYM(t0_subr3)
	.word	0xdd3e2008	! t0_kref+0x1a24:   	std	%f14, [%i0 + 8]
	.word	0x9fc00004	! t0_kref+0x1a28:   	call	%g0 + %g4
	.word	0xea2e2019	! t0_kref+0x1a2c:   	stb	%l5, [%i0 + 0x19]
	.word	0xc9ee5015	! t0_kref+0x1a30:   	prefetcha	%i1 + %l5, 4
	.word	0xa45cf925	! t0_kref+0x1a34:   	smul	%l3, -0x6db, %l2
	.word	0xa1a000b1	! t0_kref+0x1a38:   	fnegs	%f17, %f16
	.word	0x2f800007	! t0_kref+0x1a3c:   	fbu,a	_kref+0x1a58
	.word	0x9ba0012c	! t0_kref+0x1a40:   	fabss	%f12, %f13
	.word	0xe3263ff0	! t0_kref+0x1a44:   	st	%f17, [%i0 - 0x10]
	.word	0x969dc017	! t0_kref+0x1a48:   	xorcc	%l7, %l7, %o3
	.word	0xa7b3848e	! t0_kref+0x1a4c:   	fcmple32	%f14, %f14, %l3
	.word	0x9fb40cad	! t0_kref+0x1a50:   	fandnot2s	%f16, %f13, %f15
	.word	0xabb20036	! t0_kref+0x1a54:   	edge8n	%o0, %l6, %l5
	.word	0xa92c8017	! t0_kref+0x1a58:   	sll	%l2, %l7, %l4
	.word	0xa5400000	! t0_kref+0x1a5c:   	mov	%y, %l2
	.word	0x81580000	! t0_kref+0x1a60:   	flushw
	.word	0x86102002	! t0_kref+0x1a64:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1a68:   	bne,a	_kref+0x1a68
	.word	0x86a0e001	! t0_kref+0x1a6c:   	subcc	%g3, 1, %g3
	.word	0x99b44971	! t0_kref+0x1a70:   	fpmerge	%f17, %f17, %f12
	.word	0x9684fd3e	! t0_kref+0x1a74:   	addcc	%l3, -0x2c2, %o3
	.word	0xeb68a046	! t0_kref+0x1a78:   	prefetch	%g2 + 0x46, 21
	.word	0xae252fca	! t0_kref+0x1a7c:   	sub	%l4, 0xfca, %l7
	.word	0x92acc016	! t0_kref+0x1a80:   	andncc	%l3, %l6, %o1
	.word	0xe19e5a5b	! t0_kref+0x1a84:   	ldda	[%i1 + %i3]0xd2, %f16
	.word	0xe3801019	! t0_kref+0x1a88:   	lda	[%g0 + %i1]0x80, %f17
	.word	0xa1a40850	! t0_kref+0x1a8c:   	faddd	%f16, %f16, %f16
	.word	0x96ad373b	! t0_kref+0x1a90:   	andncc	%l4, -0x8c5, %o3
	.word	0xd0700019	! t0_kref+0x1a94:   	stx	%o0, [%g0 + %i1]
	.word	0xa645315f	! t0_kref+0x1a98:   	addc	%l4, -0xea1, %l3
	.word	0xa3a3492e	! t0_kref+0x1a9c:   	fmuls	%f13, %f14, %f17
	.word	0x38800008	! t0_kref+0x1aa0:   	bgu,a	_kref+0x1ac0
	.word	0xa8e4c013	! t0_kref+0x1aa4:   	subccc	%l3, %l3, %l4
	.word	0x25480002	! t0_kref+0x1aa8:   	fblg,a,pt	%fcc0, _kref+0x1ab0
	.word	0xd050a03e	! t0_kref+0x1aac:   	ldsh	[%g2 + 0x3e], %o0
	.word	0xdd070019	! t0_kref+0x1ab0:   	ld	[%i4 + %i1], %f14
	.word	0x99a3084c	! t0_kref+0x1ab4:   	faddd	%f12, %f12, %f12
	.word	0x9da01a30	! t0_kref+0x1ab8:   	fstoi	%f16, %f14
	.word	0x35800003	! t0_kref+0x1abc:   	fbue,a	_kref+0x1ac8
	.word	0xed68a049	! t0_kref+0x1ac0:   	prefetch	%g2 + 0x49, 22
	.word	0xae8dbbfb	! t0_kref+0x1ac4:   	andcc	%l6, -0x405, %l7
	.word	0x3d480007	! t0_kref+0x1ac8:   	fbule,a,pt	%fcc0, _kref+0x1ae4
	.word	0xee563fee	! t0_kref+0x1acc:   	ldsh	[%i0 - 0x12], %l7
	.word	0xa3b34d2f	! t0_kref+0x1ad0:   	fandnot1s	%f13, %f15, %f17
	.word	0x37800002	! t0_kref+0x1ad4:   	fbge,a	_kref+0x1adc
	.word	0x947d6e74	! t0_kref+0x1ad8:   	sdiv	%l5, 0xe74, %o2
	.word	0xa1a01090	! t0_kref+0x1adc:   	fxtos	%f16, %f16
	.word	0x99a4482e	! t0_kref+0x1ae0:   	fadds	%f17, %f14, %f12
	.word	0x9da3884e	! t0_kref+0x1ae4:   	faddd	%f14, %f14, %f14
	.word	0xf83e0000	! t0_kref+0x1ae8:   	std	%i4, [%i0]
	.word	0x900df98a	! t0_kref+0x1aec:   	and	%l7, -0x676, %o0
	.word	0xfdee501a	! t0_kref+0x1af0:   	prefetcha	%i1 + %i2, 30
	.word	0xe26e201a	! t0_kref+0x1af4:   	ldstub	[%i0 + 0x1a], %l1
	.word	0xd686501c	! t0_kref+0x1af8:   	lda	[%i1 + %i4]0x80, %o3
	.word	0xe9ee501c	! t0_kref+0x1afc:   	prefetcha	%i1 + %i4, 20
	.word	0x38800007	! t0_kref+0x1b00:   	bgu,a	_kref+0x1b1c
	.word	0x9da40850	! t0_kref+0x1b04:   	faddd	%f16, %f16, %f14
	.word	0x96f5b52d	! t0_kref+0x1b08:   	udivcc	%l6, -0xad3, %o3
	.word	0xa3a018ce	! t0_kref+0x1b0c:   	fdtos	%f14, %f17
	.word	0x32800002	! t0_kref+0x1b10:   	bne,a	_kref+0x1b18
	.word	0xd048a01b	! t0_kref+0x1b14:   	ldsb	[%g2 + 0x1b], %o0
	.word	0xdf80a018	! t0_kref+0x1b18:   	lda	[%g2 + 0x18]%asi, %f15
	.word	0xe5f65013	! t0_kref+0x1b1c:   	casxa	[%i1]0x80, %l3, %l2
	.word	0xae84a7d7	! t0_kref+0x1b20:   	addcc	%l2, 0x7d7, %l7
	.word	0x25800005	! t0_kref+0x1b24:   	fblg,a	_kref+0x1b38
	.word	0xa1a00531	! t0_kref+0x1b28:   	fsqrts	%f17, %f16
	.word	0xe62e3ff4	! t0_kref+0x1b2c:   	stb	%l3, [%i0 - 0xc]
	.word	0xa6b22a3a	! t0_kref+0x1b30:   	orncc	%o0, 0xa3a, %l3
	.word	0xd090a012	! t0_kref+0x1b34:   	lduha	[%g2 + 0x12]%asi, %o0
	.word	0xd900a004	! t0_kref+0x1b38:   	ld	[%g2 + 4], %f12
	.word	0x93b50132	! t0_kref+0x1b3c:   	edge32n	%l4, %l2, %o1
	.word	0xdd180019	! t0_kref+0x1b40:   	ldd	[%g0 + %i1], %f14
	.word	0xa1a01a4c	! t0_kref+0x1b44:   	fdtoi	%f12, %f16
	.word	0xa5250016	! t0_kref+0x1b48:   	mulscc	%l4, %l6, %l2
	.word	0xede8a00f	! t0_kref+0x1b4c:   	prefetcha	%g2 + 0xf, 22
	.word	0x2c800005	! t0_kref+0x1b50:   	bneg,a	_kref+0x1b64
	.word	0xa8558008	! t0_kref+0x1b54:   	umul	%l6, %o0, %l4
	.word	0x969d2f39	! t0_kref+0x1b58:   	xorcc	%l4, 0xf39, %o3
	.word	0xaf3d0014	! t0_kref+0x1b5c:   	sra	%l4, %l4, %l7
	.word	0xf43e6010	! t0_kref+0x1b60:   	std	%i2, [%i1 + 0x10]
	.word	0x9fa0052c	! t0_kref+0x1b64:   	fsqrts	%f12, %f15
	.word	0x20480008	! t0_kref+0x1b68:   	bn,a,pt	%icc, _kref+0x1b88
	.word	0xe3ee101d	! t0_kref+0x1b6c:   	prefetcha	%i0 + %i5, 17
	.word	0x2e800008	! t0_kref+0x1b70:   	bvs,a	_kref+0x1b90
	.word	0xa1a38950	! t0_kref+0x1b74:   	fmuld	%f14, %f16, %f16
	.word	0x97b50048	! t0_kref+0x1b78:   	edge8l	%l4, %o0, %o3
	.word	0x24480007	! t0_kref+0x1b7c:   	ble,a,pt	%icc, _kref+0x1b98
	.word	0x937026cb	! t0_kref+0x1b80:   	popc	0x6cb, %o1
	.word	0xe19e501d	! t0_kref+0x1b84:   	ldda	[%i1 + %i5]0x80, %f16
	.word	0xa1b4098e	! t0_kref+0x1b88:   	bshuffle	%f16, %f14, %f16
	.word	0x95b40410	! t0_kref+0x1b8c:   	fcmple16	%f16, %f16, %o2
	.word	0xaab50017	! t0_kref+0x1b90:   	orncc	%l4, %l7, %l5
	.word	0xd83e3fe0	! t0_kref+0x1b94:   	std	%o4, [%i0 - 0x20]
	.word	0x9fa018ce	! t0_kref+0x1b98:   	fdtos	%f14, %f15
	.word	0x90854016	! t0_kref+0x1b9c:   	addcc	%l5, %l6, %o0
	.word	0xea26001c	! t0_kref+0x1ba0:   	st	%l5, [%i0 + %i4]
	.word	0x9db386d0	! t0_kref+0x1ba4:   	fmul8sux16	%f14, %f16, %f14
	.word	0x9ba018ce	! t0_kref+0x1ba8:   	fdtos	%f14, %f13
	.word	0x34800001	! t0_kref+0x1bac:   	bg,a	_kref+0x1bb0
	.word	0x99b00c00	! t0_kref+0x1bb0:   	fzero	%f12
	.word	0xa8fd8017	! t0_kref+0x1bb4:   	sdivcc	%l6, %l7, %l4
	.word	0xa1a00550	! t0_kref+0x1bb8:   	fsqrtd	%f16, %f16
	.word	0xae3cc008	! t0_kref+0x1bbc:   	xnor	%l3, %o0, %l7
	.word	0xa1a4482e	! t0_kref+0x1bc0:   	fadds	%f17, %f14, %f16
	.word	0x9da3084c	! t0_kref+0x1bc4:   	faddd	%f12, %f12, %f14
	.word	0xad678016	! t0_kref+0x1bc8:   	movpos	%icc, %l6, %l6
	.word	0xa3b00c20	! t0_kref+0x1bcc:   	fzeros	%f17
	.word	0x95400000	! t0_kref+0x1bd0:   	mov	%y, %o2
	.word	0xe820a038	! t0_kref+0x1bd4:   	st	%l4, [%g2 + 0x38]
	.word	0xa1a40850	! t0_kref+0x1bd8:   	faddd	%f16, %f16, %f16
	.word	0xd9bf5a19	! t0_kref+0x1bdc:   	stda	%f12, [%i5 + %i1]0xd0
	.word	0x928a3212	! t0_kref+0x1be0:   	andcc	%o0, -0xdee, %o1
	.word	0xe42e7ff0	! t0_kref+0x1be4:   	stb	%l2, [%i1 - 0x10]
	.word	0xe4267ff8	! t0_kref+0x1be8:   	st	%l2, [%i1 - 8]
	.word	0xae5db91d	! t0_kref+0x1bec:   	smul	%l6, -0x6e3, %l7
	.word	0x9fa388b0	! t0_kref+0x1bf0:   	fsubs	%f14, %f16, %f15
	.word	0x3e800003	! t0_kref+0x1bf4:   	bvc,a	_kref+0x1c00
	.word	0xee30a03c	! t0_kref+0x1bf8:   	sth	%l7, [%g2 + 0x3c]
	.word	0x90857609	! t0_kref+0x1bfc:   	addcc	%l5, -0x9f7, %o0
	.word	0xe1000019	! t0_kref+0x1c00:   	ld	[%g0 + %i1], %f16
	.word	0x99a388ac	! t0_kref+0x1c04:   	fsubs	%f14, %f12, %f12
	.word	0x81ab4aac	! t0_kref+0x1c08:   	fcmpes	%fcc0, %f13, %f12
	.word	0x81ac4aac	! t0_kref+0x1c0c:   	fcmpes	%fcc0, %f17, %f12
	.word	0x965dab36	! t0_kref+0x1c10:   	smul	%l6, 0xb36, %o3
	.word	0xa3a389b0	! t0_kref+0x1c14:   	fdivs	%f14, %f16, %f17
	.word	0x96756146	! t0_kref+0x1c18:   	udiv	%l5, 0x146, %o3
	.word	0xa43d0008	! t0_kref+0x1c1c:   	xnor	%l4, %o0, %l2
	.word	0xe1380018	! t0_kref+0x1c20:   	std	%f16, [%g0 + %i0]
	.word	0x943a0017	! t0_kref+0x1c24:   	xnor	%o0, %l7, %o2
	.word	0x3f800001	! t0_kref+0x1c28:   	fbo,a	_kref+0x1c2c
	.word	0xad400000	! t0_kref+0x1c2c:   	mov	%y, %l6
	.word	0xae3dc016	! t0_kref+0x1c30:   	xnor	%l7, %l6, %l7
	.word	0x2f0bb31e	! t0_kref+0x1c34:   	sethi	%hi(0x2ecc7800), %l7
	.word	0xd0a8a033	! t0_kref+0x1c38:   	stba	%o0, [%g2 + 0x33]%asi
	.word	0x9da309ce	! t0_kref+0x1c3c:   	fdivd	%f12, %f14, %f14
	.word	0xa71d2b36	! t0_kref+0x1c40:   	tsubcctv	%l4, 0xb36, %l3
	.word	0xdd00a030	! t0_kref+0x1c44:   	ld	[%g2 + 0x30], %f14
	.word	0xa4fdc015	! t0_kref+0x1c48:   	sdivcc	%l7, %l5, %l2
	.word	0x99b40ece	! t0_kref+0x1c4c:   	fornot2	%f16, %f14, %f12
	.word	0x11201173	! t0_kref+0x1c50:   	sethi	%hi(0x8045cc00), %o0
	.word	0xe13e401d	! t0_kref+0x1c54:   	std	%f16, [%i1 + %i5]
	.word	0xe6363fec	! t0_kref+0x1c58:   	sth	%l3, [%i0 - 0x14]
	.word	0x9da3092d	! t0_kref+0x1c5c:   	fmuls	%f12, %f13, %f14
	.word	0xa1a00550	! t0_kref+0x1c60:   	fsqrtd	%f16, %f16
	.word	0xa1b00f10	! t0_kref+0x1c64:   	fsrc2	%f16, %f16
	.word	0xa1b3ccae	! t0_kref+0x1c68:   	fandnot2s	%f15, %f14, %f16
	.word	0xa1a01a50	! t0_kref+0x1c6c:   	fdtoi	%f16, %f16
	.word	0x32800008	! t0_kref+0x1c70:   	bne,a	_kref+0x1c90
	.word	0xe82e6013	! t0_kref+0x1c74:   	stb	%l4, [%i1 + 0x13]
	.word	0xd91e7ff0	! t0_kref+0x1c78:   	ldd	[%i1 - 0x10], %f12
	.word	0x9ba00131	! t0_kref+0x1c7c:   	fabss	%f17, %f13
	.word	0xe6580018	! t0_kref+0x1c80:   	ldx	[%g0 + %i0], %l3
	.word	0xf5ee501b	! t0_kref+0x1c84:   	prefetcha	%i1 + %i3, 26
	.word	0xe11fbe18	! t0_kref+0x1c88:   	ldd	[%fp - 0x1e8], %f16
	.word	0x81ab8aac	! t0_kref+0x1c8c:   	fcmpes	%fcc0, %f14, %f12
	.word	0xa1a388ad	! t0_kref+0x1c90:   	fsubs	%f14, %f13, %f16
	.word	0x878020d2	! t0_kref+0x1c94:   	mov	0xd2, %asi
	.word	0x878020e0	! t0_kref+0x1c98:   	mov	0xe0, %asi
	.word	0x99a4084c	! t0_kref+0x1c9c:   	faddd	%f16, %f12, %f12
	.word	0xe48e9018	! t0_kref+0x1ca0:   	lduba	[%i2 + %i0]0x80, %l2
	.word	0xe48e5000	! t0_kref+0x1ca4:   	lduba	[%i1]0x80, %l2
	.word	0x36800005	! t0_kref+0x1ca8:   	bge,a	_kref+0x1cbc
	.word	0xf007bfe0	! t0_kref+0x1cac:   	ld	[%fp - 0x20], %i0
	.word	0xec8e5000	! t0_kref+0x1cb0:   	lduba	[%i1]0x80, %l6
	.word	0x97400000	! t0_kref+0x1cb4:   	mov	%y, %o3
	.word	0x99a018ce	! t0_kref+0x1cb8:   	fdtos	%f14, %f12
	.word	0x28480002	! t0_kref+0x1cbc:   	bleu,a,pt	%icc, _kref+0x1cc4
	.word	0xa1b38e80	! t0_kref+0x1cc0:   	fsrc1	%f14, %f16
	.word	0x96fcc008	! t0_kref+0x1cc4:   	sdivcc	%l3, %o0, %o3
	.word	0xed68a048	! t0_kref+0x1cc8:   	prefetch	%g2 + 0x48, 22
	.word	0x3e800003	! t0_kref+0x1ccc:   	bvc,a	_kref+0x1cd8
	.word	0x9db4062c	! t0_kref+0x1cd0:   	fmul8x16	%f16, %f12, %f14
	.word	0x9fc10000	! t0_kref+0x1cd4:   	call	%g4
	.word	0xae7d4017	! t0_kref+0x1cd8:   	sdiv	%l5, %l7, %l7
	.word	0xe82e601f	! t0_kref+0x1cdc:   	stb	%l4, [%i1 + 0x1f]
	.word	0xac756df1	! t0_kref+0x1ce0:   	udiv	%l5, 0xdf1, %l6
	.word	0x9bb30cae	! t0_kref+0x1ce4:   	fandnot2s	%f12, %f14, %f13
	.word	0x99a0054c	! t0_kref+0x1ce8:   	fsqrtd	%f12, %f12
	.word	0xa3a0052c	! t0_kref+0x1cec:   	fsqrts	%f12, %f17
	.word	0xd096d019	! t0_kref+0x1cf0:   	lduha	[%i3 + %i1]0x80, %o0
	.word	0x2c800006	! t0_kref+0x1cf4:   	bneg,a	_kref+0x1d0c
	.word	0xaa64a3be	! t0_kref+0x1cf8:   	subc	%l2, 0x3be, %l5
	.word	0x99a000ae	! t0_kref+0x1cfc:   	fnegs	%f14, %f12
	.word	0x9f414000	! t0_kref+0x1d00:   	mov	%pc, %o7
	.word	0x92a2382a	! t0_kref+0x1d04:   	subcc	%o0, -0x7d6, %o1
	.word	0x2b800007	! t0_kref+0x1d08:   	fbug,a	_kref+0x1d24
	.word	0xc12f0005	! t0_kref+0x1d0c:   	st	%fsr, [%i4 + %g5]
	.word	0xa1b40f8c	! t0_kref+0x1d10:   	for	%f16, %f12, %f16
	.word	0x81da2570	! t0_kref+0x1d14:   	flush	%o0 + 0x570
	.word	0xe8266018	! t0_kref+0x1d18:   	st	%l4, [%i1 + 0x18]
	.word	0x9da0054c	! t0_kref+0x1d1c:   	fsqrtd	%f12, %f14
	.word	0x99a0054c	! t0_kref+0x1d20:   	fsqrtd	%f12, %f12
	.word	0x2a480008	! t0_kref+0x1d24:   	bcs,a,pt	%icc, _kref+0x1d44
	.word	0x99a00531	! t0_kref+0x1d28:   	fsqrts	%f17, %f12
	.word	0xab354013	! t0_kref+0x1d2c:   	srl	%l5, %l3, %l5
	.word	0x35800001	! t0_kref+0x1d30:   	fbue,a	_kref+0x1d34
	.word	0x9fb34ea0	! t0_kref+0x1d34:   	fsrc1s	%f13, %f15
	.word	0x9da0052c	! t0_kref+0x1d38:   	fsqrts	%f12, %f14
	.word	0xae8a21fc	! t0_kref+0x1d3c:   	andcc	%o0, 0x1fc, %l7
	.word	0xea260000	! t0_kref+0x1d40:   	st	%l5, [%i0]
	.word	0xab400000	! t0_kref+0x1d44:   	mov	%y, %l5
	.word	0xe828a013	! t0_kref+0x1d48:   	stb	%l4, [%g2 + 0x13]
	.word	0xa1a30850	! t0_kref+0x1d4c:   	faddd	%f12, %f16, %f16
	.word	0xacda0012	! t0_kref+0x1d50:   	smulcc	%o0, %l2, %l6
	.word	0x9da018ce	! t0_kref+0x1d54:   	fdtos	%f14, %f14
	.word	0xeff65017	! t0_kref+0x1d58:   	casxa	[%i1]0x80, %l7, %l7
	.word	0x9da408cc	! t0_kref+0x1d5c:   	fsubd	%f16, %f12, %f14
	.word	0x905d8014	! t0_kref+0x1d60:   	smul	%l6, %l4, %o0
	.word	0xe6a61000	! t0_kref+0x1d64:   	sta	%l3, [%i0]0x80
	.word	0xe66e3fe8	! t0_kref+0x1d68:   	ldstub	[%i0 - 0x18], %l3
	.word	0xf83e7ff0	! t0_kref+0x1d6c:   	std	%i4, [%i1 - 0x10]
	.word	0xafb500c8	! t0_kref+0x1d70:   	edge16l	%l4, %o0, %l7
	.word	0x28800002	! t0_kref+0x1d74:   	bleu,a	_kref+0x1d7c
	.word	0xaa8caf2d	! t0_kref+0x1d78:   	andcc	%l2, 0xf2d, %l5
	.word	0xa7b4050c	! t0_kref+0x1d7c:   	fcmpgt16	%f16, %f12, %l3
	.word	0xa1a00550	! t0_kref+0x1d80:   	fsqrtd	%f16, %f16
	.word	0xa1a388cc	! t0_kref+0x1d84:   	fsubd	%f14, %f12, %f16
	.word	0x25800004	! t0_kref+0x1d88:   	fblg,a	_kref+0x1d98
	.word	0x965d8016	! t0_kref+0x1d8c:   	smul	%l6, %l6, %o3
	.word	0xadb4c352	! t0_kref+0x1d90:   	alignaddrl	%l3, %l2, %l6
	.word	0xa1a0102f	! t0_kref+0x1d94:   	fstox	%f15, %f16
	.word	0xaaf4b332	! t0_kref+0x1d98:   	udivcc	%l2, -0xcce, %l5
	.word	0xa1a3884c	! t0_kref+0x1d9c:   	faddd	%f14, %f12, %f16
	.word	0xabb38510	! t0_kref+0x1da0:   	fcmpgt16	%f14, %f16, %l5
	.word	0x39800003	! t0_kref+0x1da4:   	fbuge,a	_kref+0x1db0
	.word	0xe8080019	! t0_kref+0x1da8:   	ldub	[%g0 + %i1], %l4
	.word	0x9ba44931	! t0_kref+0x1dac:   	fmuls	%f17, %f17, %f13
	.word	0x97b404cc	! t0_kref+0x1db0:   	fcmpne32	%f16, %f12, %o3
	.word	0xd9be1a5c	! t0_kref+0x1db4:   	stda	%f12, [%i0 + %i4]0xd2
	.word	0x9db30f8e	! t0_kref+0x1db8:   	for	%f12, %f14, %f14
	.word	0x97400000	! t0_kref+0x1dbc:   	mov	%y, %o3
	.word	0xe6a65000	! t0_kref+0x1dc0:   	sta	%l3, [%i1]0x80
	.word	0xfbee501b	! t0_kref+0x1dc4:   	prefetcha	%i1 + %i3, 29
	.word	0xa1b38e0e	! t0_kref+0x1dc8:   	fand	%f14, %f14, %f16
	.word	0xa6f5f4db	! t0_kref+0x1dcc:   	udivcc	%l7, -0xb25, %l3
	.word	0xa1a0052c	! t0_kref+0x1dd0:   	fsqrts	%f12, %f16
	.word	0xd91fbf18	! t0_kref+0x1dd4:   	ldd	[%fp - 0xe8], %f12
	.word	0x95b384cc	! t0_kref+0x1dd8:   	fcmpne32	%f14, %f12, %o2
	.word	0x2a800005	! t0_kref+0x1ddc:   	bcs,a	_kref+0x1df0
	.word	0xd86e200f	! t0_kref+0x1de0:   	ldstub	[%i0 + 0xf], %o4
	.word	0x8143c000	! t0_kref+0x1de4:   	stbar
	.word	0xd6871019	! t0_kref+0x1de8:   	lda	[%i4 + %i1]0x80, %o3
	.word	0x81abcaac	! t0_kref+0x1dec:   	fcmpes	%fcc0, %f15, %f12
	.word	0x8143e07b	! t0_kref+0x1df0:   	membar	0x7b
	.word	0xe120a038	! t0_kref+0x1df4:   	st	%f16, [%g2 + 0x38]
	.word	0xa1a389ce	! t0_kref+0x1df8:   	fdivd	%f14, %f14, %f16
	.word	0xa1a4084e	! t0_kref+0x1dfc:   	faddd	%f16, %f14, %f16
	.word	0xd02e401a	! t0_kref+0x1e00:   	stb	%o0, [%i1 + %i2]
	.word	0x923a3e08	! t0_kref+0x1e04:   	xnor	%o0, -0x1f8, %o1
	.word	0x38480007	! t0_kref+0x1e08:   	bgu,a,pt	%icc, _kref+0x1e24
	.word	0xd920a00c	! t0_kref+0x1e0c:   	st	%f12, [%g2 + 0xc]
	.word	0x9db306cc	! t0_kref+0x1e10:   	fmul8sux16	%f12, %f12, %f14
	.word	0xea467ff4	! t0_kref+0x1e14:   	ldsw	[%i1 - 0xc], %l5
	.word	0xd6c01018	! t0_kref+0x1e18:   	ldswa	[%g0 + %i0]0x80, %o3
	.word	0xa7400000	! t0_kref+0x1e1c:   	mov	%y, %l3
	.word	0x9fa0052f	! t0_kref+0x1e20:   	fsqrts	%f15, %f15
	.word	0xa1b40c6e	! t0_kref+0x1e24:   	fnors	%f16, %f14, %f16
	.word	0xa4fa39e7	! t0_kref+0x1e28:   	sdivcc	%o0, -0x619, %l2
	.word	0x9da409ae	! t0_kref+0x1e2c:   	fdivs	%f16, %f14, %f14
	.word	0x99a000af	! t0_kref+0x1e30:   	fnegs	%f15, %f12
	.word	0x87802082	! t0_kref+0x1e34:   	mov	0x82, %asi
	.word	0x99a40850	! t0_kref+0x1e38:   	faddd	%f16, %f16, %f12
	.word	0xd9266000	! t0_kref+0x1e3c:   	st	%f12, [%i1]
	.word	0xa1b406ec	! t0_kref+0x1e40:   	fmul8ulx16	%f16, %f12, %f16
	.word	0xf207bfe0	! t0_kref+0x1e44:   	ld	[%fp - 0x20], %i1
	.word	0x9da408cc	! t0_kref+0x1e48:   	fsubd	%f16, %f12, %f14
	.word	0x907c8014	! t0_kref+0x1e4c:   	sdiv	%l2, %l4, %o0
	.word	0x9ba0052f	! t0_kref+0x1e50:   	fsqrts	%f15, %f13
	.word	0x9de3bfa0	! t0_kref+0x1e54:   	save	%sp, -0x60, %sp
	.word	0x97ef7fd3	! t0_kref+0x1e58:   	restore	%i5, -0x2d, %o3
	.word	0xea2e3ffb	! t0_kref+0x1e5c:   	stb	%l5, [%i0 - 5]
	.word	0xdd1fbde0	! t0_kref+0x1e60:   	ldd	[%fp - 0x220], %f14
	.word	0x9da00130	! t0_kref+0x1e64:   	fabss	%f16, %f14
	.word	0x95400000	! t0_kref+0x1e68:   	mov	%y, %o2
	.word	0xdf00a03c	! t0_kref+0x1e6c:   	ld	[%g2 + 0x3c], %f15
	.word	0x21480008	! t0_kref+0x1e70:   	fbn,a,pt	%fcc0, _kref+0x1e90
	.word	0xee30a008	! t0_kref+0x1e74:   	sth	%l7, [%g2 + 8]
	.word	0xa4354013	! t0_kref+0x1e78:   	orn	%l5, %l3, %l2
	.word	0xa6a4c008	! t0_kref+0x1e7c:   	subcc	%l3, %o0, %l3
	.word	0xec6e200d	! t0_kref+0x1e80:   	ldstub	[%i0 + 0xd], %l6
	.word	0xa834c015	! t0_kref+0x1e84:   	orn	%l3, %l5, %l4
	.word	0x81ac0a50	! t0_kref+0x1e88:   	fcmpd	%fcc0, %f16, %f16
	.word	0xa69d0016	! t0_kref+0x1e8c:   	xorcc	%l4, %l6, %l3
	.word	0xa1a309cc	! t0_kref+0x1e90:   	fdivd	%f12, %f12, %f16
	.word	0x30800008	! t0_kref+0x1e94:   	ba,a	_kref+0x1eb4
	.word	0xa5b58055	! t0_kref+0x1e98:   	edge8l	%l6, %l5, %l2
	.word	0xe840a014	! t0_kref+0x1e9c:   	ldsw	[%g2 + 0x14], %l4
	.word	0xdf000018	! t0_kref+0x1ea0:   	ld	[%g0 + %i0], %f15
	.word	0x3f480002	! t0_kref+0x1ea4:   	fbo,a,pt	%fcc0, _kref+0x1eac
	.word	0x99a40950	! t0_kref+0x1ea8:   	fmuld	%f16, %f16, %f12
	.word	0xe11e7ff0	! t0_kref+0x1eac:   	ldd	[%i1 - 0x10], %f16
	.word	0x96853a7d	! t0_kref+0x1eb0:   	addcc	%l4, -0x583, %o3
	.word	0xa52dc008	! t0_kref+0x1eb4:   	sll	%l7, %o0, %l2
	.word	0x8143c000	! t0_kref+0x1eb8:   	stbar
	.word	0x99a3894e	! t0_kref+0x1ebc:   	fmuld	%f14, %f14, %f12
	.word	0xae8cf3ed	! t0_kref+0x1ec0:   	andcc	%l3, -0xc13, %l7
	.word	0xa92d6011	! t0_kref+0x1ec4:   	sll	%l5, 0x11, %l4
	.word	0x86102003	! t0_kref+0x1ec8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1ecc:   	bne,a	_kref+0x1ecc
	.word	0x86a0e001	! t0_kref+0x1ed0:   	subcc	%g3, 1, %g3
	.word	0xa4054016	! t0_kref+0x1ed4:   	add	%l5, %l6, %l2
	.word	0x9de3bfa0	! t0_kref+0x1ed8:   	save	%sp, -0x60, %sp
	.word	0xa7ee8019	! t0_kref+0x1edc:   	restore	%i2, %i1, %l3
	.word	0x99b007ac	! t0_kref+0x1ee0:   	fpackfix	%f12, %f12
	.word	0xae9d8008	! t0_kref+0x1ee4:   	xorcc	%l6, %o0, %l7
	.word	0xe62e4000	! t0_kref+0x1ee8:   	stb	%l3, [%i1]
	.word	0x94f4b801	! t0_kref+0x1eec:   	udivcc	%l2, -0x7ff, %o2
	.word	0xec30a018	! t0_kref+0x1ef0:   	sth	%l6, [%g2 + 0x18]
	.word	0xa1b44eec	! t0_kref+0x1ef4:   	fornot2s	%f17, %f12, %f16
	.word	0xda6e4000	! t0_kref+0x1ef8:   	ldstub	[%i1], %o5
	.word	0x9db30ad0	! t0_kref+0x1efc:   	fpsub32	%f12, %f16, %f14
	.word	0xa1b306ce	! t0_kref+0x1f00:   	fmul8sux16	%f12, %f14, %f16
	.word	0x3f800005	! t0_kref+0x1f04:   	fbo,a	_kref+0x1f18
	.word	0x99a0054e	! t0_kref+0x1f08:   	fsqrtd	%f14, %f12
	.word	0x30800002	! t0_kref+0x1f0c:   	ba,a	_kref+0x1f14
	.word	0xd83e6000	! t0_kref+0x1f10:   	std	%o4, [%i1]
	.word	0xd02e601c	! t0_kref+0x1f14:   	stb	%o0, [%i1 + 0x1c]
	.word	0xed68a080	! t0_kref+0x1f18:   	prefetch	%g2 + 0x80, 22
	.word	0x34480008	! t0_kref+0x1f1c:   	bg,a,pt	%icc, _kref+0x1f3c
	.word	0xa49dc015	! t0_kref+0x1f20:   	xorcc	%l7, %l5, %l2
	.word	0xee20a038	! t0_kref+0x1f24:   	st	%l7, [%g2 + 0x38]
	.word	0xfd6e6018	! t0_kref+0x1f28:   	prefetch	%i1 + 0x18, 30
	.word	0xe66e8019	! t0_kref+0x1f2c:   	ldstub	[%i2 + %i1], %l3
	.word	0x92acecdc	! t0_kref+0x1f30:   	andncc	%l3, 0xcdc, %o1
	.word	0xc3ee1014	! t0_kref+0x1f34:   	prefetcha	%i0 + %l4, 1
	.word	0xa1a018ce	! t0_kref+0x1f38:   	fdtos	%f14, %f16
	.word	0xea28a039	! t0_kref+0x1f3c:   	stb	%l5, [%g2 + 0x39]
	.word	0xa1b00cce	! t0_kref+0x1f40:   	fnot2	%f14, %f16
	.word	0x81ac0ad0	! t0_kref+0x1f44:   	fcmped	%fcc0, %f16, %f16
	.word	0xa8657081	! t0_kref+0x1f48:   	subc	%l5, -0xf7f, %l4
	.word	0x927d8016	! t0_kref+0x1f4c:   	sdiv	%l6, %l6, %o1
	.word	0x9db38f90	! t0_kref+0x1f50:   	for	%f14, %f16, %f14
	.word	0xae15a413	! t0_kref+0x1f54:   	or	%l6, 0x413, %l7
	.word	0x96fcc013	! t0_kref+0x1f58:   	sdivcc	%l3, %l3, %o3
	.word	0x9205635c	! t0_kref+0x1f5c:   	add	%l5, 0x35c, %o1
	.word	0xa4358008	! t0_kref+0x1f60:   	orn	%l6, %o0, %l2
	.word	0x9ba0012d	! t0_kref+0x1f64:   	fabss	%f13, %f13
	.word	0xd83e3ff8	! t0_kref+0x1f68:   	std	%o4, [%i0 - 8]
	.word	0xa1a309d0	! t0_kref+0x1f6c:   	fdivd	%f12, %f16, %f16
	.word	0xa1a44931	! t0_kref+0x1f70:   	fmuls	%f17, %f17, %f16
	.word	0x8143e05c	! t0_kref+0x1f74:   	membar	0x5c
	.word	0xac023b61	! t0_kref+0x1f78:   	add	%o0, -0x49f, %l6
	.word	0xa40dad98	! t0_kref+0x1f7c:   	and	%l6, 0xd98, %l2
	.word	0xd030a000	! t0_kref+0x1f80:   	sth	%o0, [%g2]
	.word	0x9ba30830	! t0_kref+0x1f84:   	fadds	%f12, %f16, %f13
	.word	0x25800008	! t0_kref+0x1f88:   	fblg,a	_kref+0x1fa8
	.word	0xa63d0016	! t0_kref+0x1f8c:   	xnor	%l4, %l6, %l3
	.word	0x30800006	! t0_kref+0x1f90:   	ba,a	_kref+0x1fa8
	.word	0x9fa0052d	! t0_kref+0x1f94:   	fsqrts	%f13, %f15
	.word	0xa940c000	! t0_kref+0x1f98:   	mov	%asi, %l4
	.word	0x96b48017	! t0_kref+0x1f9c:   	orncc	%l2, %l7, %o3
	.word	0xaa9cbc05	! t0_kref+0x1fa0:   	xorcc	%l2, -0x3fb, %l5
	.word	0xd0562008	! t0_kref+0x1fa4:   	ldsh	[%i0 + 8], %o0
	.word	0xa1a00550	! t0_kref+0x1fa8:   	fsqrtd	%f16, %f16
	.word	0x99b30e80	! t0_kref+0x1fac:   	fsrc1	%f12, %f12
	.word	0xa1a00531	! t0_kref+0x1fb0:   	fsqrts	%f17, %f16
	.word	0xc06e6007	! t0_kref+0x1fb4:   	ldstub	[%i1 + 7], %g0
	.word	0xdf871019	! t0_kref+0x1fb8:   	lda	[%i4 + %i1]0x80, %f15
	.word	0xdb070018	! t0_kref+0x1fbc:   	ld	[%i4 + %i0], %f13
	.word	0xc76e4016	! t0_kref+0x1fc0:   	prefetch	%i1 + %l6, 3
	.word	0x2d1e32fa	! t0_kref+0x1fc4:   	sethi	%hi(0x78cbe800), %l6
	.word	0x928a0012	! t0_kref+0x1fc8:   	andcc	%o0, %l2, %o1
	call	SYM(t0_subr0)
	.word	0x900a0013	! t0_kref+0x1fd0:   	and	%o0, %l3, %o0
	.word	0x94b525aa	! t0_kref+0x1fd4:   	orncc	%l4, 0x5aa, %o2
	.word	0x96054015	! t0_kref+0x1fd8:   	add	%l5, %l5, %o3
	.word	0x99a389b0	! t0_kref+0x1fdc:   	fdivs	%f14, %f16, %f12
	.word	0xee360000	! t0_kref+0x1fe0:   	sth	%l7, [%i0]
	.word	0x81ab0acc	! t0_kref+0x1fe4:   	fcmped	%fcc0, %f12, %f12
	.word	0x9da4084c	! t0_kref+0x1fe8:   	faddd	%f16, %f12, %f14
	.word	0xa1b30e0c	! t0_kref+0x1fec:   	fand	%f12, %f12, %f16
	.word	0x9db40f90	! t0_kref+0x1ff0:   	for	%f16, %f16, %f14
	.word	0x2d800006	! t0_kref+0x1ff4:   	fbg,a	_kref+0x200c
	.word	0x90fcc014	! t0_kref+0x1ff8:   	sdivcc	%l3, %l4, %o0
	.word	0x22800005	! t0_kref+0x1ffc:   	be,a	_kref+0x2010
	.word	0xa1a408cc	! t0_kref+0x2000:   	fsubd	%f16, %f12, %f16
	.word	0xdd981018	! t0_kref+0x2004:   	ldda	[%g0 + %i0]0x80, %f14
	.word	0xe13e7ff0	! t0_kref+0x2008:   	std	%f16, [%i1 - 0x10]
	.word	0x99a01931	! t0_kref+0x200c:   	fstod	%f17, %f12
	.word	0xd920a02c	! t0_kref+0x2010:   	st	%f12, [%g2 + 0x2c]
	.word	0xd6fe1000	! t0_kref+0x2014:   	swapa	[%i0]0x80, %o3
	.word	0x9ba388b0	! t0_kref+0x2018:   	fsubs	%f14, %f16, %f13
	.word	0x81ab4ab0	! t0_kref+0x201c:   	fcmpes	%fcc0, %f13, %f16
	.word	0x9bb30ea0	! t0_kref+0x2020:   	fsrc1s	%f12, %f13
	.word	0x9de3bfa0	! t0_kref+0x2024:   	save	%sp, -0x60, %sp
	.word	0xafeec01d	! t0_kref+0x2028:   	restore	%i3, %i5, %l7
	.word	0x8143c000	! t0_kref+0x202c:   	stbar
	.word	0x9265386e	! t0_kref+0x2030:   	subc	%l4, -0x792, %o1
	.word	0x9db30d0e	! t0_kref+0x2034:   	fandnot1	%f12, %f14, %f14
	.word	0x20800002	! t0_kref+0x2038:   	bn,a	_kref+0x2040
	.word	0x9264c016	! t0_kref+0x203c:   	subc	%l3, %l6, %o1
	.word	0x92748012	! t0_kref+0x2040:   	udiv	%l2, %l2, %o1
	.word	0x9ba348af	! t0_kref+0x2044:   	fsubs	%f13, %f15, %f13
	.word	0xe13e0000	! t0_kref+0x2048:   	std	%f16, [%i0]
	.word	0xa8fa321c	! t0_kref+0x204c:   	sdivcc	%o0, -0xde4, %l4
	.word	0xe19e5a5b	! t0_kref+0x2050:   	ldda	[%i1 + %i3]0xd2, %f16
	.word	0x9da408cc	! t0_kref+0x2054:   	fsubd	%f16, %f12, %f14
	.word	0x91356012	! t0_kref+0x2058:   	srl	%l5, 0x12, %o0
	.word	0xea36200c	! t0_kref+0x205c:   	sth	%l5, [%i0 + 0xc]
	.word	0xdd06001c	! t0_kref+0x2060:   	ld	[%i0 + %i4], %f14
	.word	0x110f9af8	! t0_kref+0x2064:   	sethi	%hi(0x3e6be000), %o0
	.word	0x3d800005	! t0_kref+0x2068:   	fbule,a	_kref+0x207c
	.word	0x9004a534	! t0_kref+0x206c:   	add	%l2, 0x534, %o0
	.word	0xd83e2000	! t0_kref+0x2070:   	std	%o4, [%i0]
	.word	0x9da01a30	! t0_kref+0x2074:   	fstoi	%f16, %f14
	.word	0xae8a2111	! t0_kref+0x2078:   	andcc	%o0, 0x111, %l7
	.word	0x95b4c037	! t0_kref+0x207c:   	edge8n	%l3, %l7, %o2
	.word	0xf16e3fe8	! t0_kref+0x2080:   	prefetch	%i0 - 0x18, 24
	.word	0x9da309ac	! t0_kref+0x2084:   	fdivs	%f12, %f12, %f14
	.word	0x9444a13d	! t0_kref+0x2088:   	addc	%l2, 0x13d, %o2
	.word	0xa3a018cc	! t0_kref+0x208c:   	fdtos	%f12, %f17
	.word	0x97b48008	! t0_kref+0x2090:   	edge8	%l2, %o0, %o3
	.word	0x3e800001	! t0_kref+0x2094:   	bvc,a	_kref+0x2098
	.word	0x9fa0108c	! t0_kref+0x2098:   	fxtos	%f12, %f15
	.word	0x96fca247	! t0_kref+0x209c:   	sdivcc	%l2, 0x247, %o3
	.word	0xa1a00530	! t0_kref+0x20a0:   	fsqrts	%f16, %f16
	.word	0xea763ff8	! t0_kref+0x20a4:   	stx	%l5, [%i0 - 8]
	.word	0xd9be1894	! t0_kref+0x20a8:   	stda	%f12, [%i0 + %l4]0xc4
	.word	0xa1a018ce	! t0_kref+0x20ac:   	fdtos	%f14, %f16
	.word	0x3a800008	! t0_kref+0x20b0:   	bcc,a	_kref+0x20d0
	.word	0x81de22ec	! t0_kref+0x20b4:   	flush	%i0 + 0x2ec
	.word	0xa425a150	! t0_kref+0x20b8:   	sub	%l6, 0x150, %l2
	.word	0x27800003	! t0_kref+0x20bc:   	fbul,a	_kref+0x20c8
	.word	0x9ba0052d	! t0_kref+0x20c0:   	fsqrts	%f13, %f13
	.word	0x932a0013	! t0_kref+0x20c4:   	sll	%o0, %l3, %o1
	.word	0xe168a085	! t0_kref+0x20c8:   	prefetch	%g2 + 0x85, 16
	.word	0xe66e0000	! t0_kref+0x20cc:   	ldstub	[%i0], %l3
	.word	0x99b007ac	! t0_kref+0x20d0:   	fpackfix	%f12, %f12
	.word	0x99a40950	! t0_kref+0x20d4:   	fmuld	%f16, %f16, %f12
	.word	0x926526f7	! t0_kref+0x20d8:   	subc	%l4, 0x6f7, %o1
	.word	0xe4464000	! t0_kref+0x20dc:   	ldsw	[%i1], %l2
	.word	0x8143e05b	! t0_kref+0x20e0:   	membar	0x5b
	.word	0xa1a0192e	! t0_kref+0x20e4:   	fstod	%f14, %f16
	.word	0xac3c8013	! t0_kref+0x20e8:   	xnor	%l2, %l3, %l6
	.word	0x9fa3c9ae	! t0_kref+0x20ec:   	fdivs	%f15, %f14, %f15
	.word	0x81ac4aad	! t0_kref+0x20f0:   	fcmpes	%fcc0, %f17, %f13
	.word	0x9da4482e	! t0_kref+0x20f4:   	fadds	%f17, %f14, %f14
	.word	0x81ab4aad	! t0_kref+0x20f8:   	fcmpes	%fcc0, %f13, %f13
	.word	0xa48d3cfa	! t0_kref+0x20fc:   	andcc	%l4, -0x306, %l2
	.word	0x9da0052e	! t0_kref+0x2100:   	fsqrts	%f14, %f14
	.word	0x9db40a50	! t0_kref+0x2104:   	fpadd32	%f16, %f16, %f14
	.word	0xa3a01a4e	! t0_kref+0x2108:   	fdtoi	%f14, %f17
	.word	0xae3d4016	! t0_kref+0x210c:   	xnor	%l5, %l6, %l7
	.word	0xa1a01110	! t0_kref+0x2110:   	fxtod	%f16, %f16
	.word	0x99a0054e	! t0_kref+0x2114:   	fsqrtd	%f14, %f12
	.word	0x9de3bfa0	! t0_kref+0x2118:   	save	%sp, -0x60, %sp
	.word	0xb83ec019	! t0_kref+0x211c:   	xnor	%i3, %i1, %i4
	.word	0x97ee27b1	! t0_kref+0x2120:   	restore	%i0, 0x7b1, %o3
	.word	0x9ba308ac	! t0_kref+0x2124:   	fsubs	%f12, %f12, %f13
	.word	0x2f480005	! t0_kref+0x2128:   	fbu,a,pt	%fcc0, _kref+0x213c
	.word	0xe1063ffc	! t0_kref+0x212c:   	ld	[%i0 - 4], %f16
	.word	0xaa3cb410	! t0_kref+0x2130:   	xnor	%l2, -0xbf0, %l5
	.word	0xa1a8404c	! t0_kref+0x2134:   	fmovdne	%fcc0, %f12, %f16
	.word	0x9da38950	! t0_kref+0x2138:   	fmuld	%f14, %f16, %f14
	.word	0x878020d0	! t0_kref+0x213c:   	mov	0xd0, %asi
	.word	0x81ac0ace	! t0_kref+0x2140:   	fcmped	%fcc0, %f16, %f14
	.word	0xd9380019	! t0_kref+0x2144:   	std	%f12, [%g0 + %i1]
	.word	0x99a3084e	! t0_kref+0x2148:   	faddd	%f12, %f14, %f12
	.word	0xdf070019	! t0_kref+0x214c:   	ld	[%i4 + %i1], %f15
	.word	0x9db40a4c	! t0_kref+0x2150:   	fpadd32	%f16, %f12, %f14
	.word	0xe89e5000	! t0_kref+0x2154:   	ldda	[%i1]0x80, %l4
	.word	0x2f800005	! t0_kref+0x2158:   	fbu,a	_kref+0x216c
	.word	0xda680018	! t0_kref+0x215c:   	ldstub	[%g0 + %i0], %o5
	.word	0xe968a084	! t0_kref+0x2160:   	prefetch	%g2 + 0x84, 20
	.word	0xaf2de00b	! t0_kref+0x2164:   	sll	%l7, 0xb, %l7
	call	SYM(t0_subr3)
	.word	0xed68a008	! t0_kref+0x216c:   	prefetch	%g2 + 8, 22
	.word	0xa3a3892c	! t0_kref+0x2170:   	fmuls	%f14, %f12, %f17
	.word	0x963d0016	! t0_kref+0x2174:   	xnor	%l4, %l6, %o3
	.word	0xe6d01019	! t0_kref+0x2178:   	ldsha	[%g0 + %i1]0x80, %l3
	.word	0xd2d6101b	! t0_kref+0x217c:   	ldsha	[%i0 + %i3]0x80, %o1
	.word	0xa1a01050	! t0_kref+0x2180:   	fdtox	%f16, %f16
	.word	0x36480002	! t0_kref+0x2184:   	bge,a,pt	%icc, _kref+0x218c
	.word	0xae0d28a5	! t0_kref+0x2188:   	and	%l4, 0x8a5, %l7
	.word	0xe428a037	! t0_kref+0x218c:   	stb	%l2, [%g2 + 0x37]
	.word	0xd93e6008	! t0_kref+0x2190:   	std	%f12, [%i1 + 8]
	.word	0x90b20014	! t0_kref+0x2194:   	orncc	%o0, %l4, %o0
	.word	0xa1b3090e	! t0_kref+0x2198:   	faligndata	%f12, %f14, %f16
	.word	0x9db3074e	! t0_kref+0x219c:   	fpack32	%f12, %f14, %f14
	.word	0xa1b30e80	! t0_kref+0x21a0:   	fsrc1	%f12, %f16
	.word	0x99a01931	! t0_kref+0x21a4:   	fstod	%f17, %f12
	.word	0x86102010	! t0_kref+0x21a8:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x21ac:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x21b0:   	be,a	_kref+0x2220
	.word	0x99a408b1	! t0_kref+0x21b4:   	fsubs	%f16, %f17, %f12
	.word	0x9db38acc	! t0_kref+0x21b8:   	fpsub32	%f14, %f12, %f14
	.word	0x99a389ce	! t0_kref+0x21bc:   	fdivd	%f14, %f14, %f12
	.word	0xa1b30990	! t0_kref+0x21c0:   	bshuffle	%f12, %f16, %f16
	.word	0xa3b3caf1	! t0_kref+0x21c4:   	fpsub32s	%f15, %f17, %f17
	.word	0x29480005	! t0_kref+0x21c8:   	fbl,a,pt	%fcc0, _kref+0x21dc
	.word	0xa1a408ce	! t0_kref+0x21cc:   	fsubd	%f16, %f14, %f16
	.word	0xa1b30c50	! t0_kref+0x21d0:   	fnor	%f12, %f16, %f16
	.word	0x9da409cc	! t0_kref+0x21d4:   	fdivd	%f16, %f12, %f14
	.word	0x940a0008	! t0_kref+0x21d8:   	and	%o0, %o0, %o2
	.word	0xa1a3084e	! t0_kref+0x21dc:   	faddd	%f12, %f14, %f16
	.word	0xd0a01018	! t0_kref+0x21e0:   	sta	%o0, [%g0 + %i0]0x80
	.word	0x99b306ec	! t0_kref+0x21e4:   	fmul8ulx16	%f12, %f12, %f12
	.word	0x36480005	! t0_kref+0x21e8:   	bge,a,pt	%icc, _kref+0x21fc
	.word	0x9ba0052e	! t0_kref+0x21ec:   	fsqrts	%f14, %f13
	.word	0x99b38dce	! t0_kref+0x21f0:   	fnand	%f14, %f14, %f12
	.word	0x9da309b0	! t0_kref+0x21f4:   	fdivs	%f12, %f16, %f14
	.word	0x3d800003	! t0_kref+0x21f8:   	fbule,a	_kref+0x2204
	.word	0xa624b677	! t0_kref+0x21fc:   	sub	%l2, -0x989, %l3
	.word	0xf3ee501a	! t0_kref+0x2200:   	prefetcha	%i1 + %i2, 25
	.word	0x9db3c62e	! t0_kref+0x2204:   	fmul8x16	%f15, %f14, %f14
	.word	0x9da00530	! t0_kref+0x2208:   	fsqrts	%f16, %f14
	.word	0xee264000	! t0_kref+0x220c:   	st	%l7, [%i1]
	.word	0xadb200b5	! t0_kref+0x2210:   	edge16n	%o0, %l5, %l6
	.word	0xd99e1000	! t0_kref+0x2214:   	ldda	[%i0]0x80, %f12
	.word	0xec280018	! t0_kref+0x2218:   	stb	%l6, [%g0 + %i0]
	.word	0x26800002	! t0_kref+0x221c:   	bl,a	_kref+0x2224
	.word	0xa3a3c9ad	! t0_kref+0x2220:   	fdivs	%f15, %f13, %f17
	.word	0x95b200f5	! t0_kref+0x2224:   	edge16ln	%o0, %l5, %o2
	.word	0xabb304ce	! t0_kref+0x2228:   	fcmpne32	%f12, %f14, %l5
	.word	0x9de3bfa0	! t0_kref+0x222c:   	save	%sp, -0x60, %sp
	.word	0x95e80000	! t0_kref+0x2230:   	restore	%g0, %g0, %o2
	.word	0xa1a388cc	! t0_kref+0x2234:   	fsubd	%f14, %f12, %f16
	.word	0x965cf672	! t0_kref+0x2238:   	smul	%l3, -0x98e, %o3
	.word	0xdf00a030	! t0_kref+0x223c:   	ld	[%g2 + 0x30], %f15
	.word	0x8143c000	! t0_kref+0x2240:   	stbar
	.word	0x932de016	! t0_kref+0x2244:   	sll	%l7, 0x16, %o1
	.word	0x22800001	! t0_kref+0x2248:   	be,a	_kref+0x224c
	.word	0xa80dab32	! t0_kref+0x224c:   	and	%l6, 0xb32, %l4
	.word	0xaca48014	! t0_kref+0x2250:   	subcc	%l2, %l4, %l6
	.word	0xdd000019	! t0_kref+0x2254:   	ld	[%g0 + %i1], %f14
	.word	0xac04c012	! t0_kref+0x2258:   	add	%l3, %l2, %l6
	.word	0xe4de101d	! t0_kref+0x225c:   	ldxa	[%i0 + %i5]0x80, %l2
	.word	0x3c800006	! t0_kref+0x2260:   	bpos,a	_kref+0x2278
	.word	0x90f5ff18	! t0_kref+0x2264:   	udivcc	%l7, -0xe8, %o0
	.word	0xe13e3ff8	! t0_kref+0x2268:   	std	%f16, [%i0 - 8]
	.word	0x99a309ce	! t0_kref+0x226c:   	fdivd	%f12, %f14, %f12
	.word	0x8143c000	! t0_kref+0x2270:   	stbar
	.word	0xf43e7ff8	! t0_kref+0x2274:   	std	%i2, [%i1 - 8]
	.word	0x99a01a31	! t0_kref+0x2278:   	fstoi	%f17, %f12
	.word	0x2a800005	! t0_kref+0x227c:   	bcs,a	_kref+0x2290
	.word	0xaa458015	! t0_kref+0x2280:   	addc	%l6, %l5, %l5
	.word	0x92558014	! t0_kref+0x2284:   	umul	%l6, %l4, %o1
	.word	0xa9b200d5	! t0_kref+0x2288:   	edge16l	%o0, %l5, %l4
	.word	0x21800008	! t0_kref+0x228c:   	fbn,a	_kref+0x22ac
	.word	0xea28a00c	! t0_kref+0x2290:   	stb	%l5, [%g2 + 0xc]
	.word	0x001fffff	! t0_kref+0x2294:   	illtrap	0x1fffff
	.word	0x26480002	! t0_kref+0x2298:   	bl,a,pt	%icc, _kref+0x22a0
	.word	0x99a3884c	! t0_kref+0x229c:   	faddd	%f14, %f12, %f12
	.word	0x9735a01f	! t0_kref+0x22a0:   	srl	%l6, 0x1f, %o3
	.word	0xa89c8008	! t0_kref+0x22a4:   	xorcc	%l2, %o0, %l4
	.word	0xe1be1853	! t0_kref+0x22a8:   	stda	%f16, [%i0 + %l3]0xc2
	.word	0x9fc10000	! t0_kref+0x22ac:   	call	%g4
	.word	0x97400000	! t0_kref+0x22b0:   	mov	%y, %o3
	.word	0xab1a0012	! t0_kref+0x22b4:   	tsubcctv	%o0, %l2, %l5
	.word	0x9da3884e	! t0_kref+0x22b8:   	faddd	%f14, %f14, %f14
	.word	0x38800006	! t0_kref+0x22bc:   	bgu,a	_kref+0x22d4
	.word	0x99a388d0	! t0_kref+0x22c0:   	fsubd	%f14, %f16, %f12
	.word	0x9da0014e	! t0_kref+0x22c4:   	fabsd	%f14, %f14
	.word	0xa1b34c6f	! t0_kref+0x22c8:   	fnors	%f13, %f15, %f16
	.word	0x94fd7f16	! t0_kref+0x22cc:   	sdivcc	%l5, -0xea, %o2
	.word	0xaa9a3243	! t0_kref+0x22d0:   	xorcc	%o0, -0xdbd, %l5
	.word	0x8143e040	! t0_kref+0x22d4:   	membar	0x40
	.word	0xae84e070	! t0_kref+0x22d8:   	addcc	%l3, 0x70, %l7
	.word	0xa3a3082d	! t0_kref+0x22dc:   	fadds	%f12, %f13, %f17
	.word	0x99b3074c	! t0_kref+0x22e0:   	fpack32	%f12, %f12, %f12
	.word	0xd028a03d	! t0_kref+0x22e4:   	stb	%o0, [%g2 + 0x3d]
	.word	0xe100a010	! t0_kref+0x22e8:   	ld	[%g2 + 0x10], %f16
	.word	0xe4200019	! t0_kref+0x22ec:   	st	%l2, [%g0 + %i1]
	.word	0x9de3bfa0	! t0_kref+0x22f0:   	save	%sp, -0x60, %sp
	.word	0xba9ef6ee	! t0_kref+0x22f4:   	xorcc	%i3, -0x912, %i5
	.word	0xa7ef4019	! t0_kref+0x22f8:   	restore	%i5, %i1, %l3
	.word	0xa68c8014	! t0_kref+0x22fc:   	andcc	%l2, %l4, %l3
	.word	0x99a0004c	! t0_kref+0x2300:   	fmovd	%f12, %f12
	.word	0xe9e61015	! t0_kref+0x2304:   	casa	[%i0]0x80, %l5, %l4
	.word	0x907cc013	! t0_kref+0x2308:   	sdiv	%l3, %l3, %o0
	.word	0xa65a3592	! t0_kref+0x230c:   	smul	%o0, -0xa6e, %l3
	.word	0xaebceee7	! t0_kref+0x2310:   	xnorcc	%l3, 0xee7, %l7
	.word	0x22480006	! t0_kref+0x2314:   	be,a,pt	%icc, _kref+0x232c
	.word	0xa45dac5f	! t0_kref+0x2318:   	smul	%l6, 0xc5f, %l2
	.word	0xf43e2008	! t0_kref+0x231c:   	std	%i2, [%i0 + 8]
	.word	0x81ab8aac	! t0_kref+0x2320:   	fcmpes	%fcc0, %f14, %f12
	.word	0xac248015	! t0_kref+0x2324:   	sub	%l2, %l5, %l6
	.word	0x8143c000	! t0_kref+0x2328:   	stbar
	.word	0x94822826	! t0_kref+0x232c:   	addcc	%o0, 0x826, %o2
	.word	0x26800004	! t0_kref+0x2330:   	bl,a	_kref+0x2340
	.word	0xaa8d8008	! t0_kref+0x2334:   	andcc	%l6, %o0, %l5
	.word	0x9da0002c	! t0_kref+0x2338:   	fmovs	%f12, %f14
	.word	0x9ba0002d	! t0_kref+0x233c:   	fmovs	%f13, %f13
	.word	0x9424e49b	! t0_kref+0x2340:   	sub	%l3, 0x49b, %o2
	.word	0x2a800002	! t0_kref+0x2344:   	bcs,a	_kref+0x234c
	.word	0xa48c8013	! t0_kref+0x2348:   	andcc	%l2, %l3, %l2
	.word	0xe828a016	! t0_kref+0x234c:   	stb	%l4, [%g2 + 0x16]
	.word	0xac8cc008	! t0_kref+0x2350:   	andcc	%l3, %o0, %l6
	.word	0xe66e6015	! t0_kref+0x2354:   	ldstub	[%i1 + 0x15], %l3
	.word	0x9da0054c	! t0_kref+0x2358:   	fsqrtd	%f12, %f14
	.word	0xa9b38490	! t0_kref+0x235c:   	fcmple32	%f14, %f16, %l4
	.word	0x9de3bfa0	! t0_kref+0x2360:   	save	%sp, -0x60, %sp
	.word	0xadee0018	! t0_kref+0x2364:   	restore	%i0, %i0, %l6
	.word	0xa855c016	! t0_kref+0x2368:   	umul	%l7, %l6, %l4
	.word	0x91418000	! t0_kref+0x236c:   	mov	%fprs, %o0
	.word	0xe36e2010	! t0_kref+0x2370:   	prefetch	%i0 + 0x10, 17
	.word	0xa1a00031	! t0_kref+0x2374:   	fmovs	%f17, %f16
	.word	0x99b30ecc	! t0_kref+0x2378:   	fornot2	%f12, %f12, %f12
	.word	0xa1a388af	! t0_kref+0x237c:   	fsubs	%f14, %f15, %f16
	.word	0x81ab8ab0	! t0_kref+0x2380:   	fcmpes	%fcc0, %f14, %f16
	.word	0x37480001	! t0_kref+0x2384:   	fbge,a,pt	%fcc0, _kref+0x2388
	.word	0x901ca6dd	! t0_kref+0x2388:   	xor	%l2, 0x6dd, %o0
	.word	0x28480006	! t0_kref+0x238c:   	bleu,a,pt	%icc, _kref+0x23a4
	.word	0xe1ee501c	! t0_kref+0x2390:   	prefetcha	%i1 + %i4, 16
	.word	0x99b38d8e	! t0_kref+0x2394:   	fxor	%f14, %f14, %f12
	.word	0x26800007	! t0_kref+0x2398:   	bl,a	_kref+0x23b4
	.word	0xeaa01018	! t0_kref+0x239c:   	sta	%l5, [%g0 + %i0]0x80
	.word	0x923dbe48	! t0_kref+0x23a0:   	xnor	%l6, -0x1b8, %o1
	.word	0xa1b30e80	! t0_kref+0x23a4:   	fsrc1	%f12, %f16
	.word	0xae254012	! t0_kref+0x23a8:   	sub	%l5, %l2, %l7
	.word	0x9fa00531	! t0_kref+0x23ac:   	fsqrts	%f17, %f15
	.word	0x97b385d0	! t0_kref+0x23b0:   	fcmpeq32	%f14, %f16, %o3
	.word	0x9ba018ce	! t0_kref+0x23b4:   	fdtos	%f14, %f13
	.word	0xd99e5a5c	! t0_kref+0x23b8:   	ldda	[%i1 + %i4]0xd2, %f12
	.word	0xd9be1888	! t0_kref+0x23bc:   	stda	%f12, [%i0 + %o0]0xc4
	.word	0x99a0054e	! t0_kref+0x23c0:   	fsqrtd	%f14, %f12
	.word	0x9fb00c20	! t0_kref+0x23c4:   	fzeros	%f15
	.word	0xa9b500d5	! t0_kref+0x23c8:   	edge16l	%l4, %l5, %l4
	.word	0xfdee101b	! t0_kref+0x23cc:   	prefetcha	%i0 + %i3, 30
	.word	0x9da308ce	! t0_kref+0x23d0:   	fsubd	%f12, %f14, %f14
	.word	0xa3b30aaf	! t0_kref+0x23d4:   	fpsub16s	%f12, %f15, %f17
	.word	0x2d0f94d4	! t0_kref+0x23d8:   	sethi	%hi(0x3e535000), %l6
	.word	0xe678a01c	! t0_kref+0x23dc:   	swap	[%g2 + 0x1c], %l3
	.word	0xa805c013	! t0_kref+0x23e0:   	add	%l7, %l3, %l4
	.word	0x99a409cc	! t0_kref+0x23e4:   	fdivd	%f16, %f12, %f12
	.word	0x81dd8011	! t0_kref+0x23e8:   	flush	%l6 + %l1
	.word	0xaa820017	! t0_kref+0x23ec:   	addcc	%o0, %l7, %l5
	.word	0xecce1000	! t0_kref+0x23f0:   	ldsba	[%i0]0x80, %l6
	.word	0x9fa0012e	! t0_kref+0x23f4:   	fabss	%f14, %f15
	.word	0xa9400000	! t0_kref+0x23f8:   	mov	%y, %l4
	.word	0xf4bf5018	! t0_kref+0x23fc:   	stda	%i2, [%i5 + %i0]0x80
	.word	0xacf20013	! t0_kref+0x2400:   	udivcc	%o0, %l3, %l6
	.word	0xa1a388cc	! t0_kref+0x2404:   	fsubd	%f14, %f12, %f16
	.word	0x99a3884c	! t0_kref+0x2408:   	faddd	%f14, %f12, %f12
	.word	0xa6adc016	! t0_kref+0x240c:   	andncc	%l7, %l6, %l3
	.word	0x113c4f42	! t0_kref+0x2410:   	sethi	%hi(0xf13d0800), %o0
	.word	0xa7b3848c	! t0_kref+0x2414:   	fcmple32	%f14, %f12, %l3
	.word	0x24800003	! t0_kref+0x2418:   	ble,a	_kref+0x2424
	.word	0xa6920015	! t0_kref+0x241c:   	orcc	%o0, %l5, %l3
	.word	0xae5d0015	! t0_kref+0x2420:   	smul	%l4, %l5, %l7
	.word	0x9644a260	! t0_kref+0x2424:   	addc	%l2, 0x260, %o3
	.word	0x943a3542	! t0_kref+0x2428:   	xnor	%o0, -0xabe, %o2
	.word	0xf007bfe0	! t0_kref+0x242c:   	ld	[%fp - 0x20], %i0
	.word	0x9da30950	! t0_kref+0x2430:   	fmuld	%f12, %f16, %f14
	.word	0x9db38def	! t0_kref+0x2434:   	fnands	%f14, %f15, %f14
	.word	0x948d6556	! t0_kref+0x2438:   	andcc	%l5, 0x556, %o2
	.word	0x9734a00e	! t0_kref+0x243c:   	srl	%l2, 0xe, %o3
	.word	0x9684e236	! t0_kref+0x2440:   	addcc	%l3, 0x236, %o3
	.word	0x97b5c113	! t0_kref+0x2444:   	edge32	%l7, %l3, %o3
	.word	0x9fc00004	! t0_kref+0x2448:   	call	%g0 + %g4
	.word	0x2b03c3ab	! t0_kref+0x244c:   	sethi	%hi(0xf0eac00), %l5
	.word	0xaaaa0017	! t0_kref+0x2450:   	andncc	%o0, %l7, %l5
	.word	0x2c800004	! t0_kref+0x2454:   	bneg,a	_kref+0x2464
	.word	0x9ba0052c	! t0_kref+0x2458:   	fsqrts	%f12, %f13
	.word	0xe828a001	! t0_kref+0x245c:   	stb	%l4, [%g2 + 1]
	.word	0x2d235c62	! t0_kref+0x2460:   	sethi	%hi(0x8d718800), %l6
	.word	0xf9ee101b	! t0_kref+0x2464:   	prefetcha	%i0 + %i3, 28
	.word	0xd248a009	! t0_kref+0x2468:   	ldsb	[%g2 + 9], %o1
	.word	0xad2c8014	! t0_kref+0x246c:   	sll	%l2, %l4, %l6
	.word	0xa7b20008	! t0_kref+0x2470:   	edge8	%o0, %o0, %l3
	.word	0x99b40d8e	! t0_kref+0x2474:   	fxor	%f16, %f14, %f12
	.word	0x81ab8a4c	! t0_kref+0x2478:   	fcmpd	%fcc0, %f14, %f12
	.word	0x9fb38d30	! t0_kref+0x247c:   	fandnot1s	%f14, %f16, %f15
	.word	0x9ba01090	! t0_kref+0x2480:   	fxtos	%f16, %f13
	.word	0xa1a3884c	! t0_kref+0x2484:   	faddd	%f14, %f12, %f16
	.word	0xdd000018	! t0_kref+0x2488:   	ld	[%g0 + %i0], %f14
	.word	0x23800001	! t0_kref+0x248c:   	fbne,a	_kref+0x2490
	.word	0xa1a000ae	! t0_kref+0x2490:   	fnegs	%f14, %f16
	.word	0x3a800005	! t0_kref+0x2494:   	bcc,a	_kref+0x24a8
	.word	0xa1b3cdef	! t0_kref+0x2498:   	fnands	%f15, %f15, %f16
	.word	0xdb00a004	! t0_kref+0x249c:   	ld	[%g2 + 4], %f13
	.word	0xe320a004	! t0_kref+0x24a0:   	st	%f17, [%g2 + 4]
	.word	0x99b3098c	! t0_kref+0x24a4:   	bshuffle	%f12, %f12, %f12
	.word	0xaa3d70ee	! t0_kref+0x24a8:   	xnor	%l5, -0xf12, %l5
	.word	0x3b800001	! t0_kref+0x24ac:   	fble,a	_kref+0x24b0
	.word	0x9da01931	! t0_kref+0x24b0:   	fstod	%f17, %f14
	.word	0x81dbe36c	! t0_kref+0x24b4:   	flush	%o7 + 0x36c
	.word	0xe1180019	! t0_kref+0x24b8:   	ldd	[%g0 + %i1], %f16
	.word	0x8143c000	! t0_kref+0x24bc:   	stbar
	.word	0xa8c5c015	! t0_kref+0x24c0:   	addccc	%l7, %l5, %l4
	.word	0x3d800006	! t0_kref+0x24c4:   	fbule,a	_kref+0x24dc
	.word	0xa3a4492e	! t0_kref+0x24c8:   	fmuls	%f17, %f14, %f17
	.word	0x948dbef0	! t0_kref+0x24cc:   	andcc	%l6, -0x110, %o2
	.word	0xa7400000	! t0_kref+0x24d0:   	mov	%y, %l3
	.word	0x9ba00130	! t0_kref+0x24d4:   	fabss	%f16, %f13
	.word	0xc1ee5014	! t0_kref+0x24d8:   	prefetcha	%i1 + %l4, 0
	.word	0x99a409cc	! t0_kref+0x24dc:   	fdivd	%f16, %f12, %f12
	.word	0xe19f5a58	! t0_kref+0x24e0:   	ldda	[%i5 + %i0]0xd2, %f16
	.word	0xd48e9058	! t0_kref+0x24e4:   	lduba	[%i2 + %i0]0x82, %o2
	.word	0xe2ee101a	! t0_kref+0x24e8:   	ldstuba	[%i0 + %i2]0x80, %l1
	.word	0x9ba00030	! t0_kref+0x24ec:   	fmovs	%f16, %f13
	.word	0x9da3882c	! t0_kref+0x24f0:   	fadds	%f14, %f12, %f14
	.word	0xac6233de	! t0_kref+0x24f4:   	subc	%o0, -0xc22, %l6
	.word	0x81ab0ace	! t0_kref+0x24f8:   	fcmped	%fcc0, %f12, %f14
	.word	0x95b500a8	! t0_kref+0x24fc:   	edge16n	%l4, %o0, %o2
	.word	0xa1a40850	! t0_kref+0x2500:   	faddd	%f16, %f16, %f16
	.word	0xaafd0013	! t0_kref+0x2504:   	sdivcc	%l4, %l3, %l5
	.word	0xee2e6009	! t0_kref+0x2508:   	stb	%l7, [%i1 + 9]
	.word	0x99a0190c	! t0_kref+0x250c:   	fitod	%f12, %f12
	.word	0x9fa01a4e	! t0_kref+0x2510:   	fdtoi	%f14, %f15
	.word	0x99a018cc	! t0_kref+0x2514:   	fdtos	%f12, %f12
	.word	0x9db30aae	! t0_kref+0x2518:   	fpsub16s	%f12, %f14, %f14
	.word	0x9ba018ce	! t0_kref+0x251c:   	fdtos	%f14, %f13
	.word	0xae5a2b81	! t0_kref+0x2520:   	smul	%o0, 0xb81, %l7
	.word	0x9f414000	! t0_kref+0x2524:   	mov	%pc, %o7
!	.word	0x234f1eb4	! t0_kref+0x2528:   	fbne,a,pt	%fcc0, SYM(t0_subr0)
	   	fbne,a,pt	%fcc0, SYM(t0_subr0)
	.word	0x92ba0013	! t0_kref+0x252c:   	xnorcc	%o0, %l3, %o1
	.word	0x9bb34aee	! t0_kref+0x2530:   	fpsub32s	%f13, %f14, %f13
	.word	0xd9be1000	! t0_kref+0x2534:   	stda	%f12, [%i0]0x80
	.word	0x37800001	! t0_kref+0x2538:   	fbge,a	_kref+0x253c
	.word	0x9db4462c	! t0_kref+0x253c:   	fmul8x16	%f17, %f12, %f14
	.word	0xa3a018ce	! t0_kref+0x2540:   	fdtos	%f14, %f17
	.word	0xa88dc014	! t0_kref+0x2544:   	andcc	%l7, %l4, %l4
	.word	0xef68a04b	! t0_kref+0x2548:   	prefetch	%g2 + 0x4b, 23
	.word	0xa9418000	! t0_kref+0x254c:   	mov	%fprs, %l4
	.word	0x9db30f4e	! t0_kref+0x2550:   	fornot1	%f12, %f14, %f14
	.word	0xe630a00e	! t0_kref+0x2554:   	sth	%l3, [%g2 + 0xe]
	.word	0x95b5c155	! t0_kref+0x2558:   	edge32l	%l7, %l5, %o2
	.word	0x99a00550	! t0_kref+0x255c:   	fsqrtd	%f16, %f12
	.word	0xd91fbd88	! t0_kref+0x2560:   	ldd	[%fp - 0x278], %f12
	.word	0xd920a010	! t0_kref+0x2564:   	st	%f12, [%g2 + 0x10]
	.word	0x81d90016	! t0_kref+0x2568:   	flush	%g4 + %l6
	.word	0xec2e4000	! t0_kref+0x256c:   	stb	%l6, [%i1]
	.word	0x81ab0ab1	! t0_kref+0x2570:   	fcmpes	%fcc0, %f12, %f17
	.word	0xa4fdef6b	! t0_kref+0x2574:   	sdivcc	%l7, 0xf6b, %l2
	.word	0x99a00531	! t0_kref+0x2578:   	fsqrts	%f17, %f12
	.word	0xaefd4008	! t0_kref+0x257c:   	sdivcc	%l5, %o0, %l7
	.word	0x99a308ce	! t0_kref+0x2580:   	fsubd	%f12, %f14, %f12
	.word	0xa1a0054e	! t0_kref+0x2584:   	fsqrtd	%f14, %f16
	.word	0x81ac0ab1	! t0_kref+0x2588:   	fcmpes	%fcc0, %f16, %f17
	.word	0xae957d0e	! t0_kref+0x258c:   	orcc	%l5, -0x2f2, %l7
	.word	0xdb20a028	! t0_kref+0x2590:   	st	%f13, [%g2 + 0x28]
	.word	0xaa64e2f3	! t0_kref+0x2594:   	subc	%l3, 0x2f3, %l5
	.word	0xa1b40a6d	! t0_kref+0x2598:   	fpadd32s	%f16, %f13, %f16
	.word	0x9da3894c	! t0_kref+0x259c:   	fmuld	%f14, %f12, %f14
	.word	0xf3ee501c	! t0_kref+0x25a0:   	prefetcha	%i1 + %i4, 25
	.word	0x33800003	! t0_kref+0x25a4:   	fbe,a	_kref+0x25b0
	.word	0xee28a016	! t0_kref+0x25a8:   	stb	%l7, [%g2 + 0x16]
	.word	0xd83e6010	! t0_kref+0x25ac:   	std	%o4, [%i1 + 0x10]
	.word	0xa1a00031	! t0_kref+0x25b0:   	fmovs	%f17, %f16
	.word	0xec280018	! t0_kref+0x25b4:   	stb	%l6, [%g0 + %i0]
	.word	0xd519401d	! t0_kref+0x25b8:   	ldd	[%g5 + %i5], %f10
	.word	0xe8ce505a	! t0_kref+0x25bc:   	ldsba	[%i1 + %i2]0x82, %l4
	.word	0xee50a022	! t0_kref+0x25c0:   	ldsh	[%g2 + 0x22], %l7
	.word	0xa1a0052d	! t0_kref+0x25c4:   	fsqrts	%f13, %f16
	.word	0x33800007	! t0_kref+0x25c8:   	fbe,a	_kref+0x25e4
	.word	0x9655eeab	! t0_kref+0x25cc:   	umul	%l7, 0xeab, %o3
	.word	0x93418000	! t0_kref+0x25d0:   	mov	%fprs, %o1
	.word	0x9da00531	! t0_kref+0x25d4:   	fsqrts	%f17, %f14
	.word	0xe11e6010	! t0_kref+0x25d8:   	ldd	[%i1 + 0x10], %f16
	.word	0x99a308cc	! t0_kref+0x25dc:   	fsubd	%f12, %f12, %f12
	.word	0x9da389d0	! t0_kref+0x25e0:   	fdivd	%f14, %f16, %f14
	.word	0xa1a0054c	! t0_kref+0x25e4:   	fsqrtd	%f12, %f16
	.word	0x81858000	! t0_kref+0x25e8:   	wr	%l6, %g0, %y
	.word	0x3e800005	! t0_kref+0x25ec:   	bvc,a	_kref+0x2600
	.word	0xea0e6018	! t0_kref+0x25f0:   	ldub	[%i1 + 0x18], %l5
	.word	0x9ba01090	! t0_kref+0x25f4:   	fxtos	%f16, %f13
	.word	0xa3a0052f	! t0_kref+0x25f8:   	fsqrts	%f15, %f17
	.word	0xa9418000	! t0_kref+0x25fc:   	mov	%fprs, %l4
	.word	0xec28a016	! t0_kref+0x2600:   	stb	%l6, [%g2 + 0x16]
	.word	0xe450a02a	! t0_kref+0x2604:   	ldsh	[%g2 + 0x2a], %l2
	.word	0xe620a03c	! t0_kref+0x2608:   	st	%l3, [%g2 + 0x3c]
	.word	0x9da0052d	! t0_kref+0x260c:   	fsqrts	%f13, %f14
	.word	0x33800004	! t0_kref+0x2610:   	fbe,a	_kref+0x2620
	.word	0xd9be1a5b	! t0_kref+0x2614:   	stda	%f12, [%i0 + %i3]0xd2
	.word	0xe41e4000	! t0_kref+0x2618:   	ldd	[%i1], %l2
	.word	0xa1a408ce	! t0_kref+0x261c:   	fsubd	%f16, %f14, %f16
	.word	0xac64b06a	! t0_kref+0x2620:   	subc	%l2, -0xf96, %l6
	.word	0x2b800003	! t0_kref+0x2624:   	fbug,a	_kref+0x2630
	.word	0xea0e8018	! t0_kref+0x2628:   	ldub	[%i2 + %i0], %l5
	.word	0x94b4aa87	! t0_kref+0x262c:   	orncc	%l2, 0xa87, %o2
	.word	0xe11e4000	! t0_kref+0x2630:   	ldd	[%i1], %f16
	.word	0x81db6b59	! t0_kref+0x2634:   	flush	%o5 + 0xb59
	.word	0x9da0012e	! t0_kref+0x2638:   	fabss	%f14, %f14
	.word	0xe320a004	! t0_kref+0x263c:   	st	%f17, [%g2 + 4]
	.word	0x8143c000	! t0_kref+0x2640:   	stbar
	.word	0x99b306ec	! t0_kref+0x2644:   	fmul8ulx16	%f12, %f12, %f12
	.word	0xadb305ce	! t0_kref+0x2648:   	fcmpeq32	%f12, %f14, %l6
	.word	0xe8ce1000	! t0_kref+0x264c:   	ldsba	[%i0]0x80, %l4
	.word	0x2e800007	! t0_kref+0x2650:   	bvs,a	_kref+0x266c
	.word	0xa1a388ce	! t0_kref+0x2654:   	fsubd	%f14, %f14, %f16
	.word	0x9734c008	! t0_kref+0x2658:   	srl	%l3, %o0, %o3
	.word	0xa1b38f4c	! t0_kref+0x265c:   	fornot1	%f14, %f12, %f16
	.word	0xa85d8017	! t0_kref+0x2660:   	smul	%l6, %l7, %l4
	.word	0xad400000	! t0_kref+0x2664:   	mov	%y, %l6
	.word	0xa535e005	! t0_kref+0x2668:   	srl	%l7, 0x5, %l2
	.word	0x9fa3482f	! t0_kref+0x266c:   	fadds	%f13, %f15, %f15
	.word	0x926230cf	! t0_kref+0x2670:   	subc	%o0, -0xf31, %o1
	.word	0xa3a01a4e	! t0_kref+0x2674:   	fdtoi	%f14, %f17
	.word	0xa53d8015	! t0_kref+0x2678:   	sra	%l6, %l5, %l2
	.word	0x81df8010	! t0_kref+0x267c:   	flush	%fp + %l0
	.word	0xacf4f342	! t0_kref+0x2680:   	udivcc	%l3, -0xcbe, %l6
	.word	0xa3a0052e	! t0_kref+0x2684:   	fsqrts	%f14, %f17
	.word	0xaa8c8017	! t0_kref+0x2688:   	andcc	%l2, %l7, %l5
	.word	0x929d4015	! t0_kref+0x268c:   	xorcc	%l5, %l5, %o1
	.word	0x92fcf298	! t0_kref+0x2690:   	sdivcc	%l3, -0xd68, %o1
	.word	0xa415ac3d	! t0_kref+0x2694:   	or	%l6, 0xc3d, %l2
	.word	0xa9b50240	! t0_kref+0x2698:   	array16	%l4, %g0, %l4
	.word	0x99a00531	! t0_kref+0x269c:   	fsqrts	%f17, %f12
	.word	0xea96d018	! t0_kref+0x26a0:   	lduha	[%i3 + %i0]0x80, %l5
	.word	0xa1a389d0	! t0_kref+0x26a4:   	fdivd	%f14, %f16, %f16
	.word	0xa1a00031	! t0_kref+0x26a8:   	fmovs	%f17, %f16
	.word	0x99b406ac	! t0_kref+0x26ac:   	fmul8x16al	%f16, %f12, %f12
	.word	0xa69d3ed2	! t0_kref+0x26b0:   	xorcc	%l4, -0x12e, %l3
	.word	0x81ab8ace	! t0_kref+0x26b4:   	fcmped	%fcc0, %f14, %f14
	.word	0x9444c017	! t0_kref+0x26b8:   	addc	%l3, %l7, %o2
	.word	0x27800004	! t0_kref+0x26bc:   	fbul,a	_kref+0x26cc
	.word	0xd9be1a1c	! t0_kref+0x26c0:   	stda	%f12, [%i0 + %i4]0xd0
	.word	0x923cf77c	! t0_kref+0x26c4:   	xnor	%l3, -0x884, %o1
	.word	0xa1b40e0c	! t0_kref+0x26c8:   	fand	%f16, %f12, %f16
	.word	0xa1a3894e	! t0_kref+0x26cc:   	fmuld	%f14, %f14, %f16
	.word	0x9db30d40	! t0_kref+0x26d0:   	fnot1	%f12, %f14
	.word	0xe26e600a	! t0_kref+0x26d4:   	ldstub	[%i1 + 0xa], %l1
	.word	0xa6d23b98	! t0_kref+0x26d8:   	umulcc	%o0, -0x468, %l3
	.word	0x9ba0052d	! t0_kref+0x26dc:   	fsqrts	%f13, %f13
	.word	0xd200a02c	! t0_kref+0x26e0:   	ld	[%g2 + 0x2c], %o1
	.word	0x81580000	! t0_kref+0x26e4:   	flushw
	.word	0xdd20a028	! t0_kref+0x26e8:   	st	%f14, [%g2 + 0x28]
	.word	0xc768a04b	! t0_kref+0x26ec:   	prefetch	%g2 + 0x4b, 3
	.word	0x113b3854	! t0_kref+0x26f0:   	sethi	%hi(0xece15000), %o0
	.word	0x20800003	! t0_kref+0x26f4:   	bn,a	_kref+0x2700
	.word	0x99a0054e	! t0_kref+0x26f8:   	fsqrtd	%f14, %f12
	.word	0xaf400000	! t0_kref+0x26fc:   	mov	%y, %l7
	.word	0xa9050016	! t0_kref+0x2700:   	taddcc	%l4, %l6, %l4
	.word	0xa6350008	! t0_kref+0x2704:   	orn	%l4, %o0, %l3
	.word	0xacfcf07b	! t0_kref+0x2708:   	sdivcc	%l3, -0xf85, %l6
	.word	0x9da308ae	! t0_kref+0x270c:   	fsubs	%f12, %f14, %f14
	.word	0xa8058014	! t0_kref+0x2710:   	add	%l6, %l4, %l4
	.word	0x81b01024	! t0_kref+0x2714:   	siam	0x4
	.word	0xa415bf9d	! t0_kref+0x2718:   	or	%l6, -0x63, %l2
	.word	0x99a018cc	! t0_kref+0x271c:   	fdtos	%f12, %f12
	.word	0xaa3dc016	! t0_kref+0x2720:   	xnor	%l7, %l6, %l5
	.word	0xed68a040	! t0_kref+0x2724:   	prefetch	%g2 + 0x40, 22
	.word	0x90adb444	! t0_kref+0x2728:   	andncc	%l6, -0xbbc, %o0
	.word	0x9fb34aef	! t0_kref+0x272c:   	fpsub32s	%f13, %f15, %f15
	.word	0x905cf584	! t0_kref+0x2730:   	smul	%l3, -0xa7c, %o0
	.word	0x9de3bfa0	! t0_kref+0x2734:   	save	%sp, -0x60, %sp
	.word	0xb2383445	! t0_kref+0x2738:   	xnor	%g0, -0xbbb, %i1
	.word	0xa9eeadb3	! t0_kref+0x273c:   	restore	%i2, 0xdb3, %l4
	.word	0xd93e4000	! t0_kref+0x2740:   	std	%f12, [%i1]
	.word	0xad348016	! t0_kref+0x2744:   	srl	%l2, %l6, %l6
	.word	0x90adb95f	! t0_kref+0x2748:   	andncc	%l6, -0x6a1, %o0
	.word	0xa1b38cad	! t0_kref+0x274c:   	fandnot2s	%f14, %f13, %f16
	.word	0x99b3c6b1	! t0_kref+0x2750:   	fmul8x16al	%f15, %f17, %f12
	.word	0xe5ee501b	! t0_kref+0x2754:   	prefetcha	%i1 + %i3, 18
	.word	0x96f5e5e1	! t0_kref+0x2758:   	udivcc	%l7, 0x5e1, %o3
	.word	0xe620a024	! t0_kref+0x275c:   	st	%l3, [%g2 + 0x24]
	.word	0xf9ee501d	! t0_kref+0x2760:   	prefetcha	%i1 + %i5, 28
	.word	0xf36e2018	! t0_kref+0x2764:   	prefetch	%i0 + 0x18, 25
	.word	0x99a30850	! t0_kref+0x2768:   	faddd	%f12, %f16, %f12
	.word	0xa1a00550	! t0_kref+0x276c:   	fsqrtd	%f16, %f16
	.word	0x9644c016	! t0_kref+0x2770:   	addc	%l3, %l6, %o3
	.word	0xac9cfb7b	! t0_kref+0x2774:   	xorcc	%l3, -0x485, %l6
	.word	0x99a0052d	! t0_kref+0x2778:   	fsqrts	%f13, %f12
	.word	0xac8d68e1	! t0_kref+0x277c:   	andcc	%l5, 0x8e1, %l6
	.word	0x9da309cc	! t0_kref+0x2780:   	fdivd	%f12, %f12, %f14
	.word	0xfbee501a	! t0_kref+0x2784:   	prefetcha	%i1 + %i2, 29
	.word	0x93b4c177	! t0_kref+0x2788:   	edge32ln	%l3, %l7, %o1
	.word	0xd66e2003	! t0_kref+0x278c:   	ldstub	[%i0 + 3], %o3
	.word	0xa1a3482f	! t0_kref+0x2790:   	fadds	%f13, %f15, %f16
	.word	0x3b800001	! t0_kref+0x2794:   	fble,a	_kref+0x2798
	.word	0xe1000019	! t0_kref+0x2798:   	ld	[%g0 + %i1], %f16
	.word	0x22800006	! t0_kref+0x279c:   	be,a	_kref+0x27b4
	.word	0x9da30950	! t0_kref+0x27a0:   	fmuld	%f12, %f16, %f14
	.word	0xd9be1897	! t0_kref+0x27a4:   	stda	%f12, [%i0 + %l7]0xc4
	.word	0x93b540d6	! t0_kref+0x27a8:   	edge16l	%l5, %l6, %o1
	.word	0xa4f53d62	! t0_kref+0x27ac:   	udivcc	%l4, -0x29e, %l2
	.word	0xa9b4c335	! t0_kref+0x27b0:   	bmask	%l3, %l5, %l4
	.word	0xd998105d	! t0_kref+0x27b4:   	ldda	[%g0 + %i5]0x82, %f12
	.word	0xacd54015	! t0_kref+0x27b8:   	umulcc	%l5, %l5, %l6
	.word	0xa655c015	! t0_kref+0x27bc:   	umul	%l7, %l5, %l3
	.word	0x9fc10000	! t0_kref+0x27c0:   	call	%g4
	.word	0x9fa409ad	! t0_kref+0x27c4:   	fdivs	%f16, %f13, %f15
	.word	0xe430a008	! t0_kref+0x27c8:   	sth	%l2, [%g2 + 8]
	.word	0x87802080	! t0_kref+0x27cc:   	mov	0x80, %asi
	.word	0xa6b52fb5	! t0_kref+0x27d0:   	orncc	%l4, 0xfb5, %l3
	.word	0xf83e4000	! t0_kref+0x27d4:   	std	%i4, [%i1]
	.word	0x99a408d0	! t0_kref+0x27d8:   	fsubd	%f16, %f16, %f12
	.word	0xa5400000	! t0_kref+0x27dc:   	mov	%y, %l2
	.word	0x81580000	! t0_kref+0x27e0:   	flushw
	.word	0x99b40e0c	! t0_kref+0x27e4:   	fand	%f16, %f12, %f12
	.word	0x8143c000	! t0_kref+0x27e8:   	stbar
	.word	0xe48e101a	! t0_kref+0x27ec:   	lduba	[%i0 + %i2]0x80, %l2
	.word	0xf43e7ff0	! t0_kref+0x27f0:   	std	%i2, [%i1 - 0x10]
	.word	0xa9400000	! t0_kref+0x27f4:   	mov	%y, %l4
	.word	0x99b30dce	! t0_kref+0x27f8:   	fnand	%f12, %f14, %f12
	.word	0x3d800004	! t0_kref+0x27fc:   	fbule,a	_kref+0x280c
	.word	0x9da018ce	! t0_kref+0x2800:   	fdtos	%f14, %f14
	.word	0xa1b38eed	! t0_kref+0x2804:   	fornot2s	%f14, %f13, %f16
	.word	0xd608a00b	! t0_kref+0x2808:   	ldub	[%g2 + 0xb], %o3
	.word	0xe636401b	! t0_kref+0x280c:   	sth	%l3, [%i1 + %i3]
	.word	0x9da00530	! t0_kref+0x2810:   	fsqrts	%f16, %f14
	.word	0xea4e4000	! t0_kref+0x2814:   	ldsb	[%i1], %l5
	.word	0xa3a8c031	! t0_kref+0x2818:   	fmovsul	%fcc0, %f17, %f17
	.word	0xe4981018	! t0_kref+0x281c:   	ldda	[%g0 + %i0]0x80, %l2
	.word	0xd83e2010	! t0_kref+0x2820:   	std	%o4, [%i0 + 0x10]
	.word	0x3e800003	! t0_kref+0x2824:   	bvc,a	_kref+0x2830
	.word	0xa41d642c	! t0_kref+0x2828:   	xor	%l5, 0x42c, %l2
	.word	0x9fa00531	! t0_kref+0x282c:   	fsqrts	%f17, %f15
	.word	0x9da01a4e	! t0_kref+0x2830:   	fdtoi	%f14, %f14
	.word	0xecb01019	! t0_kref+0x2834:   	stha	%l6, [%g0 + %i1]0x80
	.word	0x3c480002	! t0_kref+0x2838:   	bpos,a,pt	%icc, _kref+0x2840
	.word	0x99a000ac	! t0_kref+0x283c:   	fnegs	%f12, %f12
	.word	0x81ac0ab0	! t0_kref+0x2840:   	fcmpes	%fcc0, %f16, %f16
	.word	0x9bb40aac	! t0_kref+0x2844:   	fpsub16s	%f16, %f12, %f13
	.word	0x3c800007	! t0_kref+0x2848:   	bpos,a	_kref+0x2864
	.word	0x99b007ac	! t0_kref+0x284c:   	fpackfix	%f12, %f12
	.word	0xe8ee5000	! t0_kref+0x2850:   	ldstuba	[%i1]0x80, %l4
	.word	0x93400000	! t0_kref+0x2854:   	mov	%y, %o1
	.word	0xa1a0054e	! t0_kref+0x2858:   	fsqrtd	%f14, %f16
	.word	0xd99e501d	! t0_kref+0x285c:   	ldda	[%i1 + %i5]0x80, %f12
	.word	0xa3b3cdef	! t0_kref+0x2860:   	fnands	%f15, %f15, %f17
	.word	0x91b48008	! t0_kref+0x2864:   	edge8	%l2, %o0, %o0
	.word	0x3c800006	! t0_kref+0x2868:   	bpos,a	_kref+0x2880
	.word	0x9da449b1	! t0_kref+0x286c:   	fdivs	%f17, %f17, %f14
	.word	0xa1a0012d	! t0_kref+0x2870:   	fabss	%f13, %f16
	.word	0x9fa00030	! t0_kref+0x2874:   	fmovs	%f16, %f15
	.word	0x81ac0ad0	! t0_kref+0x2878:   	fcmped	%fcc0, %f16, %f16
	.word	0x32480003	! t0_kref+0x287c:   	bne,a,pt	%icc, _kref+0x2888
	.word	0xd690a03e	! t0_kref+0x2880:   	lduha	[%g2 + 0x3e]%asi, %o3
	.word	0x9ba0052c	! t0_kref+0x2884:   	fsqrts	%f12, %f13
	.word	0xec270019	! t0_kref+0x2888:   	st	%l6, [%i4 + %i1]
	.word	0xe8362006	! t0_kref+0x288c:   	sth	%l4, [%i0 + 6]
	.word	0x81ab0ab0	! t0_kref+0x2890:   	fcmpes	%fcc0, %f12, %f16
	.word	0x9da0054e	! t0_kref+0x2894:   	fsqrtd	%f14, %f14
	.word	0xd91e3fe8	! t0_kref+0x2898:   	ldd	[%i0 - 0x18], %f12
	.word	0xee30a022	! t0_kref+0x289c:   	sth	%l7, [%g2 + 0x22]
	.word	0xa4050016	! t0_kref+0x28a0:   	add	%l4, %l6, %l2
	.word	0x925c8013	! t0_kref+0x28a4:   	smul	%l2, %l3, %o1
	.word	0xac1cc014	! t0_kref+0x28a8:   	xor	%l3, %l4, %l6
	.word	0x9da388cc	! t0_kref+0x28ac:   	fsubd	%f14, %f12, %f14
	.word	0xa3a0052f	! t0_kref+0x28b0:   	fsqrts	%f15, %f17
	.word	0xa4f52529	! t0_kref+0x28b4:   	udivcc	%l4, 0x529, %l2
	.word	0xa3a0052d	! t0_kref+0x28b8:   	fsqrts	%f13, %f17
	.word	0x9f414000	! t0_kref+0x28bc:   	mov	%pc, %o7
	.word	0xab2dc014	! t0_kref+0x28c0:   	sll	%l7, %l4, %l5
	.word	0xa8fdc017	! t0_kref+0x28c4:   	sdivcc	%l7, %l7, %l4
	.word	0xdd3e7fe0	! t0_kref+0x28c8:   	std	%f14, [%i1 - 0x20]
	.word	0xdd3e0000	! t0_kref+0x28cc:   	std	%f14, [%i0]
	.word	0xa1b3cea0	! t0_kref+0x28d0:   	fsrc1s	%f15, %f16
	.word	0x99b40e0c	! t0_kref+0x28d4:   	fand	%f16, %f12, %f12
	.word	0xe8270019	! t0_kref+0x28d8:   	st	%l4, [%i4 + %i1]
	.word	0x9da3084e	! t0_kref+0x28dc:   	faddd	%f12, %f14, %f14
	.word	0x30800007	! t0_kref+0x28e0:   	ba,a	_kref+0x28fc
	.word	0x9da3094c	! t0_kref+0x28e4:   	fmuld	%f12, %f12, %f14
	.word	0x99b009b0	! t0_kref+0x28e8:   	fexpand	%f16, %f12
	.word	0xa7b20357	! t0_kref+0x28ec:   	alignaddrl	%o0, %l7, %l3
	.word	0xabb20135	! t0_kref+0x28f0:   	edge32n	%o0, %l5, %l5
	.word	0xaa657caa	! t0_kref+0x28f4:   	subc	%l5, -0x356, %l5
	.word	0x9fb38cae	! t0_kref+0x28f8:   	fandnot2s	%f14, %f14, %f15
	.word	0xa1b3ca6d	! t0_kref+0x28fc:   	fpadd32s	%f15, %f13, %f16
	.word	0xa1b40ef1	! t0_kref+0x2900:   	fornot2s	%f16, %f17, %f16
	.word	0x81abcaad	! t0_kref+0x2904:   	fcmpes	%fcc0, %f15, %f13
	.word	0x923ded9c	! t0_kref+0x2908:   	xnor	%l7, 0xd9c, %o1
	.word	0xd6966000	! t0_kref+0x290c:   	lduha	[%i1]%asi, %o3
	.word	0x33800004	! t0_kref+0x2910:   	fbe,a	_kref+0x2920
	.word	0xe4263fec	! t0_kref+0x2914:   	st	%l2, [%i0 - 0x14]
	.word	0xac75c008	! t0_kref+0x2918:   	udiv	%l7, %o0, %l6
	.word	0x21800008	! t0_kref+0x291c:   	fbn,a	_kref+0x293c
	.word	0x925d4008	! t0_kref+0x2920:   	smul	%l5, %o0, %o1
	.word	0xa60d4008	! t0_kref+0x2924:   	and	%l5, %o0, %l3
	.word	0x36800007	! t0_kref+0x2928:   	bge,a	_kref+0x2944
	.word	0x92758017	! t0_kref+0x292c:   	udiv	%l6, %l7, %o1
	.word	0xe306200c	! t0_kref+0x2930:   	ld	[%i0 + 0xc], %f17
	.word	0x9ba018d0	! t0_kref+0x2934:   	fdtos	%f16, %f13
	.word	0x9fa389b1	! t0_kref+0x2938:   	fdivs	%f14, %f17, %f15
	.word	0xa1a018cc	! t0_kref+0x293c:   	fdtos	%f12, %f16
	.word	0xf236c000	! t0_kref+0x2940:   	sth	%i1, [%i3]
	.word	0xd0a0a000	! t0_kref+0x2944:   	sta	%o0, [%g2]%asi
	.word	0xd2d0a02a	! t0_kref+0x2948:   	ldsha	[%g2 + 0x2a]%asi, %o1
	.word	0x20480008	! t0_kref+0x294c:   	bn,a,pt	%icc, _kref+0x296c
	.word	0xd9180019	! t0_kref+0x2950:   	ldd	[%g0 + %i1], %f12
	.word	0xafb5c0b5	! t0_kref+0x2954:   	edge16n	%l7, %l5, %l7
	.word	0x99a3882c	! t0_kref+0x2958:   	fadds	%f14, %f12, %f12
	.word	0xee266000	! t0_kref+0x295c:   	st	%l7, [%i1]
	.word	0xdda0a034	! t0_kref+0x2960:   	sta	%f14, [%g2 + 0x34]%asi
	.word	0x9db34cad	! t0_kref+0x2964:   	fandnot2s	%f13, %f13, %f14
	.word	0xa6d5c012	! t0_kref+0x2968:   	umulcc	%l7, %l2, %l3
	.word	0x99b40ad0	! t0_kref+0x296c:   	fpsub32	%f16, %f16, %f12
	.word	0x99a00531	! t0_kref+0x2970:   	fsqrts	%f17, %f12
	.word	0xafb404ce	! t0_kref+0x2974:   	fcmpne32	%f16, %f14, %l7
	.word	0x9140c000	! t0_kref+0x2978:   	mov	%asi, %o0
	.word	0x99b38ed0	! t0_kref+0x297c:   	fornot2	%f14, %f16, %f12
	.word	0x95b54280	! t0_kref+0x2980:   	array32	%l5, %g0, %o2
	.word	0x99b3466f	! t0_kref+0x2984:   	fmul8x16au	%f13, %f15, %f12
	.word	0x28800001	! t0_kref+0x2988:   	bleu,a	_kref+0x298c
	.word	0x293a96e1	! t0_kref+0x298c:   	sethi	%hi(0xea5b8400), %l4
	.word	0xe410a018	! t0_kref+0x2990:   	lduh	[%g2 + 0x18], %l2
	.word	0x9ba018d0	! t0_kref+0x2994:   	fdtos	%f16, %f13
	.word	0xe4a01018	! t0_kref+0x2998:   	sta	%l2, [%g0 + %i0]0x80
	.word	0xae64f831	! t0_kref+0x299c:   	subc	%l3, -0x7cf, %l7
	.word	0xa1a0052d	! t0_kref+0x29a0:   	fsqrts	%f13, %f16
	.word	0xc96e0015	! t0_kref+0x29a4:   	prefetch	%i0 + %l5, 4
	.word	0xa1a018cc	! t0_kref+0x29a8:   	fdtos	%f12, %f16
	.word	0x908d6b3a	! t0_kref+0x29ac:   	andcc	%l5, 0xb3a, %o0
	.word	0xa1a0002d	! t0_kref+0x29b0:   	fmovs	%f13, %f16
	.word	0x22800008	! t0_kref+0x29b4:   	be,a	_kref+0x29d4
	.word	0x99a00550	! t0_kref+0x29b8:   	fsqrtd	%f16, %f12
	.word	0x9db00770	! t0_kref+0x29bc:   	fpack16	%f16, %f14
	.word	0xabb30490	! t0_kref+0x29c0:   	fcmple32	%f12, %f16, %l5
	.word	0x967a20cf	! t0_kref+0x29c4:   	sdiv	%o0, 0xcf, %o3
	.word	0xd27e3fe0	! t0_kref+0x29c8:   	swap	[%i0 - 0x20], %o1
	.word	0x20800004	! t0_kref+0x29cc:   	bn,a	_kref+0x29dc
	.word	0x931d3758	! t0_kref+0x29d0:   	tsubcctv	%l4, -0x8a8, %o1
	.word	0x99a0052f	! t0_kref+0x29d4:   	fsqrts	%f15, %f12
	.word	0xdd3e2000	! t0_kref+0x29d8:   	std	%f14, [%i0]
	.word	0x8143e040	! t0_kref+0x29dc:   	membar	0x40
	.word	0xa43a0014	! t0_kref+0x29e0:   	xnor	%o0, %l4, %l2
	.word	0x35800007	! t0_kref+0x29e4:   	fbue,a	_kref+0x2a00
	.word	0xa48c8015	! t0_kref+0x29e8:   	andcc	%l2, %l5, %l2
	.word	0x8143c000	! t0_kref+0x29ec:   	stbar
	.word	0x99a01050	! t0_kref+0x29f0:   	fdtox	%f16, %f12
	.word	0xa1a00550	! t0_kref+0x29f4:   	fsqrtd	%f16, %f16
	.word	0xa69a0015	! t0_kref+0x29f8:   	xorcc	%o0, %l5, %l3
	.word	0xdf80a028	! t0_kref+0x29fc:   	lda	[%g2 + 0x28]%asi, %f15
	.word	0xab2d8016	! t0_kref+0x2a00:   	sll	%l6, %l6, %l5
	.word	0xd0a8a013	! t0_kref+0x2a04:   	stba	%o0, [%g2 + 0x13]%asi
	.word	0x99b38990	! t0_kref+0x2a08:   	bshuffle	%f14, %f16, %f12
	.word	0xa88cc017	! t0_kref+0x2a0c:   	andcc	%l3, %l7, %l4
	.word	0xd83e001d	! t0_kref+0x2a10:   	std	%o4, [%i0 + %i5]
	.word	0xe27e2010	! t0_kref+0x2a14:   	swap	[%i0 + 0x10], %l1
	.word	0x35800001	! t0_kref+0x2a18:   	fbue,a	_kref+0x2a1c
	.word	0xefe8a009	! t0_kref+0x2a1c:   	prefetcha	%g2 + 9, 23
	.word	0x99a388af	! t0_kref+0x2a20:   	fsubs	%f14, %f15, %f12
	.word	0xa624a2fa	! t0_kref+0x2a24:   	sub	%l2, 0x2fa, %l3
	.word	0xa5b54174	! t0_kref+0x2a28:   	edge32ln	%l5, %l4, %l2
	.word	0x37800006	! t0_kref+0x2a2c:   	fbge,a	_kref+0x2a44
	.word	0x90b5b04d	! t0_kref+0x2a30:   	orncc	%l6, -0xfb3, %o0
	.word	0xa8f4b705	! t0_kref+0x2a34:   	udivcc	%l2, -0x8fb, %l4
	.word	0x9bb44a6e	! t0_kref+0x2a38:   	fpadd32s	%f17, %f14, %f13
	.word	0xabb3040e	! t0_kref+0x2a3c:   	fcmple16	%f12, %f14, %l5
	.word	0xeab0a016	! t0_kref+0x2a40:   	stha	%l5, [%g2 + 0x16]%asi
	.word	0x99a00550	! t0_kref+0x2a44:   	fsqrtd	%f16, %f12
	.word	0x9da0190f	! t0_kref+0x2a48:   	fitod	%f15, %f14
	.word	0x20800005	! t0_kref+0x2a4c:   	bn,a	_kref+0x2a60
	.word	0xafb48033	! t0_kref+0x2a50:   	edge8n	%l2, %l3, %l7
	.word	0xaaad7b1b	! t0_kref+0x2a54:   	andncc	%l5, -0x4e5, %l5
	.word	0xd906401c	! t0_kref+0x2a58:   	ld	[%i1 + %i4], %f12
	.word	0xe11fbdf0	! t0_kref+0x2a5c:   	ldd	[%fp - 0x210], %f16
	.word	0x95b404cc	! t0_kref+0x2a60:   	fcmpne32	%f16, %f12, %o2
	.word	0x9da01930	! t0_kref+0x2a64:   	fstod	%f16, %f14
	.word	0xeaa8a034	! t0_kref+0x2a68:   	stba	%l5, [%g2 + 0x34]%asi
	.word	0x9da4094e	! t0_kref+0x2a6c:   	fmuld	%f16, %f14, %f14
	.word	0x8143e040	! t0_kref+0x2a70:   	membar	0x40
	.word	0x9734c014	! t0_kref+0x2a74:   	srl	%l3, %l4, %o3
	.word	0x9db3cc70	! t0_kref+0x2a78:   	fnors	%f15, %f16, %f14
	.word	0x9de3bfa0	! t0_kref+0x2a7c:   	save	%sp, -0x60, %sp
	.word	0xadef0018	! t0_kref+0x2a80:   	restore	%i4, %i0, %l6
	.word	0xe1be3ff0	! t0_kref+0x2a84:   	stda	%f16, [%i0 - 0x10]%asi
	.word	0x3d800001	! t0_kref+0x2a88:   	fbule,a	_kref+0x2a8c
	.word	0xa87d7a09	! t0_kref+0x2a8c:   	sdiv	%l5, -0x5f7, %l4
	.word	0x99a3892c	! t0_kref+0x2a90:   	fmuls	%f14, %f12, %f12
	.word	0xf83e0000	! t0_kref+0x2a94:   	std	%i4, [%i0]
	.word	0xeea0a024	! t0_kref+0x2a98:   	sta	%l7, [%g2 + 0x24]%asi
	.word	0x9f414000	! t0_kref+0x2a9c:   	mov	%pc, %o7
!	.word	0x334f1d56	! t0_kref+0x2aa0:   	fbe,a,pt	%fcc0, SYM(t0_subr0)
	   	fbe,a,pt	%fcc0, SYM(t0_subr0)
	.word	0xa83dc016	! t0_kref+0x2aa4:   	xnor	%l7, %l6, %l4
	.word	0x96fda99b	! t0_kref+0x2aa8:   	sdivcc	%l6, 0x99b, %o3
	.word	0x99a4082f	! t0_kref+0x2aac:   	fadds	%f16, %f15, %f12
	.word	0xd8fe101c	! t0_kref+0x2ab0:   	swapa	[%i0 + %i4]0x80, %o4
	.word	0x91b50112	! t0_kref+0x2ab4:   	edge32	%l4, %l2, %o0
	.word	0x9da308ae	! t0_kref+0x2ab8:   	fsubs	%f12, %f14, %f14
	.word	0x905dc015	! t0_kref+0x2abc:   	smul	%l7, %l5, %o0
	.word	0x22480006	! t0_kref+0x2ac0:   	be,a,pt	%icc, _kref+0x2ad8
	.word	0xa1a01a50	! t0_kref+0x2ac4:   	fdtoi	%f16, %f16
	.word	0x81d8323e	! t0_kref+0x2ac8:   	flush	%g0 - 0xdc2
	.word	0x9404f4a6	! t0_kref+0x2acc:   	add	%l3, -0xb5a, %o2
	.word	0x90fd0015	! t0_kref+0x2ad0:   	sdivcc	%l4, %l5, %o0
	.word	0x9db00c20	! t0_kref+0x2ad4:   	fzeros	%f14
	.word	0x99a388ae	! t0_kref+0x2ad8:   	fsubs	%f14, %f14, %f12
	.word	0x99a4094c	! t0_kref+0x2adc:   	fmuld	%f16, %f12, %f12
	.word	0x20480006	! t0_kref+0x2ae0:   	bn,a,pt	%icc, _kref+0x2af8
	.word	0x9da0054e	! t0_kref+0x2ae4:   	fsqrtd	%f14, %f14
	.word	0x99a0014e	! t0_kref+0x2ae8:   	fabsd	%f14, %f12
	.word	0x9db306f0	! t0_kref+0x2aec:   	fmul8ulx16	%f12, %f16, %f14
	.word	0x9fa389ac	! t0_kref+0x2af0:   	fdivs	%f14, %f12, %f15
	.word	0xaa658012	! t0_kref+0x2af4:   	subc	%l6, %l2, %l5
	.word	0x93400000	! t0_kref+0x2af8:   	mov	%y, %o1
	.word	0x8610200a	! t0_kref+0x2afc:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x2b00:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x2b04:   	be,a	_kref+0x2b3c
	.word	0xff6e6010	! t0_kref+0x2b08:   	prefetch	%i1 + 0x10, 31
	.word	0x3d800008	! t0_kref+0x2b0c:   	fbule,a	_kref+0x2b2c
	.word	0x9bb40a6c	! t0_kref+0x2b10:   	fpadd32s	%f16, %f12, %f13
	.word	0xa3a449ae	! t0_kref+0x2b14:   	fdivs	%f17, %f14, %f17
	.word	0xaa44c016	! t0_kref+0x2b18:   	addc	%l3, %l6, %l5
	.word	0xa1a0052f	! t0_kref+0x2b1c:   	fsqrts	%f15, %f16
	.word	0x99a9404e	! t0_kref+0x2b20:   	fmovdug	%fcc0, %f14, %f12
	.word	0x945d4017	! t0_kref+0x2b24:   	smul	%l5, %l7, %o2
	.word	0xa864eabf	! t0_kref+0x2b28:   	subc	%l3, 0xabf, %l4
	.word	0x967dc017	! t0_kref+0x2b2c:   	sdiv	%l7, %l7, %o3
	.word	0xa1b38f8c	! t0_kref+0x2b30:   	for	%f14, %f12, %f16
	.word	0x903d0014	! t0_kref+0x2b34:   	xnor	%l4, %l4, %o0
	.word	0x96fd4015	! t0_kref+0x2b38:   	sdivcc	%l5, %l5, %o3
	.word	0xd9be7fe8	! t0_kref+0x2b3c:   	stda	%f12, [%i1 - 0x18]%asi
	.word	0x9da01a31	! t0_kref+0x2b40:   	fstoi	%f17, %f14
	.word	0xa1b00f0e	! t0_kref+0x2b44:   	fsrc2	%f14, %f16
	.word	0xe4a0a01c	! t0_kref+0x2b48:   	sta	%l2, [%g2 + 0x1c]%asi
	.word	0x9f414000	! t0_kref+0x2b4c:   	mov	%pc, %o7
	.word	0xe300a038	! t0_kref+0x2b50:   	ld	[%g2 + 0x38], %f17
	.word	0xa43cc014	! t0_kref+0x2b54:   	xnor	%l3, %l4, %l2
	.word	0x3f800001	! t0_kref+0x2b58:   	fbo,a	_kref+0x2b5c
	.word	0xe4b6601e	! t0_kref+0x2b5c:   	stha	%l2, [%i1 + 0x1e]%asi
	.word	0x36480003	! t0_kref+0x2b60:   	bge,a,pt	%icc, _kref+0x2b6c
	.word	0xa1a308d0	! t0_kref+0x2b64:   	fsubd	%f12, %f16, %f16
	.word	0x9fa01a4e	! t0_kref+0x2b68:   	fdtoi	%f14, %f15
	.word	0xa4b22c3b	! t0_kref+0x2b6c:   	orncc	%o0, 0xc3b, %l2
	.word	0xa1a3c8b0	! t0_kref+0x2b70:   	fsubs	%f15, %f16, %f16
	.word	0xeeb6d019	! t0_kref+0x2b74:   	stha	%l7, [%i3 + %i1]0x80
	.word	0x91b48053	! t0_kref+0x2b78:   	edge8l	%l2, %l3, %o0
	.word	0xaa3d4015	! t0_kref+0x2b7c:   	xnor	%l5, %l5, %l5
	.word	0x37800003	! t0_kref+0x2b80:   	fbge,a	_kref+0x2b8c
	.word	0xee961000	! t0_kref+0x2b84:   	lduha	[%i0]0x80, %l7
	.word	0x91b54133	! t0_kref+0x2b88:   	edge32n	%l5, %l3, %o0
	.word	0xe1be1848	! t0_kref+0x2b8c:   	stda	%f16, [%i0 + %o0]0xc2
	.word	0xaa8cbae9	! t0_kref+0x2b90:   	andcc	%l2, -0x517, %l5
	.word	0x81ac0a50	! t0_kref+0x2b94:   	fcmpd	%fcc0, %f16, %f16
	.word	0xf43e6010	! t0_kref+0x2b98:   	std	%i2, [%i1 + 0x10]
	.word	0xae5d8008	! t0_kref+0x2b9c:   	smul	%l6, %o0, %l7
	.word	0xea26001c	! t0_kref+0x2ba0:   	st	%l5, [%i0 + %i4]
	.word	0x9da0002f	! t0_kref+0x2ba4:   	fmovs	%f15, %f14
	.word	0xa1a3884e	! t0_kref+0x2ba8:   	faddd	%f14, %f14, %f16
	.word	0x81dec015	! t0_kref+0x2bac:   	flush	%i3 + %l5
	.word	0xae350017	! t0_kref+0x2bb0:   	orn	%l4, %l7, %l7
	.word	0x99a8002e	! t0_kref+0x2bb4:   	fmovsn	%fcc0, %f14, %f12
	.word	0x99a0052d	! t0_kref+0x2bb8:   	fsqrts	%f13, %f12
	.word	0x2f800006	! t0_kref+0x2bbc:   	fbu,a	_kref+0x2bd4
	.word	0xa1b4062c	! t0_kref+0x2bc0:   	fmul8x16	%f16, %f12, %f16
	.word	0xa3a448af	! t0_kref+0x2bc4:   	fsubs	%f17, %f15, %f17
	.word	0xa1b44970	! t0_kref+0x2bc8:   	fpmerge	%f17, %f16, %f16
	.word	0xd93e2000	! t0_kref+0x2bcc:   	std	%f12, [%i0]
	.word	0xf3ee101a	! t0_kref+0x2bd0:   	prefetcha	%i0 + %i2, 25
	.word	0x3f800003	! t0_kref+0x2bd4:   	fbo,a	_kref+0x2be0
	.word	0xa6f521f2	! t0_kref+0x2bd8:   	udivcc	%l4, 0x1f2, %l3
	.word	0xaa3d4017	! t0_kref+0x2bdc:   	xnor	%l5, %l7, %l5
	.word	0x9de3bfa0	! t0_kref+0x2be0:   	save	%sp, -0x60, %sp
	.word	0x95e83e2a	! t0_kref+0x2be4:   	restore	%g0, -0x1d6, %o2
	.word	0x9fb30ea0	! t0_kref+0x2be8:   	fsrc1s	%f12, %f15
	.word	0x99a40850	! t0_kref+0x2bec:   	faddd	%f16, %f16, %f12
	.word	0xa6220008	! t0_kref+0x2bf0:   	sub	%o0, %o0, %l3
	.word	0xd208a03c	! t0_kref+0x2bf4:   	ldub	[%g2 + 0x3c], %o1
	.word	0x9ba018ce	! t0_kref+0x2bf8:   	fdtos	%f14, %f13
	.word	0xa6d5f260	! t0_kref+0x2bfc:   	umulcc	%l7, -0xda0, %l3
	.word	0x878020e0	! t0_kref+0x2c00:   	mov	0xe0, %asi
	.word	0x99a0192e	! t0_kref+0x2c04:   	fstod	%f14, %f12
	.word	0x9ba01a4e	! t0_kref+0x2c08:   	fdtoi	%f14, %f13
	.word	0xc168a048	! t0_kref+0x2c0c:   	prefetch	%g2 + 0x48, 0
	.word	0x37800004	! t0_kref+0x2c10:   	fbge,a	_kref+0x2c20
	.word	0xa4ad8013	! t0_kref+0x2c14:   	andncc	%l6, %l3, %l2
	.word	0xdd3e401d	! t0_kref+0x2c18:   	std	%f14, [%i1 + %i5]
	.word	0xaf154017	! t0_kref+0x2c1c:   	taddcctv	%l5, %l7, %l7
	.word	0xa1a309ce	! t0_kref+0x2c20:   	fdivd	%f12, %f14, %f16
	.word	0x9da0054e	! t0_kref+0x2c24:   	fsqrtd	%f14, %f14
	.word	0xa9048015	! t0_kref+0x2c28:   	taddcc	%l2, %l5, %l4
	.word	0x001fffff	! t0_kref+0x2c2c:   	illtrap	0x1fffff
	.word	0x95b5c168	! t0_kref+0x2c30:   	edge32ln	%l7, %o0, %o2
	.word	0xa1a00550	! t0_kref+0x2c34:   	fsqrtd	%f16, %f16
	.word	0x9da0002e	! t0_kref+0x2c38:   	fmovs	%f14, %f14
	.word	0x9da0052e	! t0_kref+0x2c3c:   	fsqrts	%f14, %f14
	.word	0xa1b44ea0	! t0_kref+0x2c40:   	fsrc1s	%f17, %f16
	.word	0x9de3bfa0	! t0_kref+0x2c44:   	save	%sp, -0x60, %sp
	.word	0xb81ec01a	! t0_kref+0x2c48:   	xor	%i3, %i2, %i4
	.word	0x93ee8018	! t0_kref+0x2c4c:   	restore	%i2, %i0, %o1
	.word	0x97400000	! t0_kref+0x2c50:   	mov	%y, %o3
	.word	0x9da00550	! t0_kref+0x2c54:   	fsqrtd	%f16, %f14
	.word	0xdf00a008	! t0_kref+0x2c58:   	ld	[%g2 + 8], %f15
	.word	0x28800007	! t0_kref+0x2c5c:   	bleu,a	_kref+0x2c78
	.word	0xdb06201c	! t0_kref+0x2c60:   	ld	[%i0 + 0x1c], %f13
	.word	0x81ab4ab1	! t0_kref+0x2c64:   	fcmpes	%fcc0, %f13, %f17
	.word	0x94c5f633	! t0_kref+0x2c68:   	addccc	%l7, -0x9cd, %o2
	.word	0x92f48012	! t0_kref+0x2c6c:   	udivcc	%l2, %l2, %o1
	.word	0x99b0076e	! t0_kref+0x2c70:   	fpack16	%f14, %f12
	.word	0x94fa0016	! t0_kref+0x2c74:   	sdivcc	%o0, %l6, %o2
	.word	0x3f800008	! t0_kref+0x2c78:   	fbo,a	_kref+0x2c98
	.word	0xaa05c016	! t0_kref+0x2c7c:   	add	%l7, %l6, %l5
	.word	0xaafd4014	! t0_kref+0x2c80:   	sdivcc	%l5, %l4, %l5
	.word	0x9fb00c20	! t0_kref+0x2c84:   	fzeros	%f15
	.word	0x925dc013	! t0_kref+0x2c88:   	smul	%l7, %l3, %o1
	.word	0xaa3cc013	! t0_kref+0x2c8c:   	xnor	%l3, %l3, %l5
	.word	0x94254016	! t0_kref+0x2c90:   	sub	%l5, %l6, %o2
	.word	0xae9deae1	! t0_kref+0x2c94:   	xorcc	%l7, 0xae1, %l7
	.word	0x97400000	! t0_kref+0x2c98:   	mov	%y, %o3
	.word	0xd248a03f	! t0_kref+0x2c9c:   	ldsb	[%g2 + 0x3f], %o1
	.word	0x911a0008	! t0_kref+0x2ca0:   	tsubcctv	%o0, %o0, %o0
	.word	0x9244e60c	! t0_kref+0x2ca4:   	addc	%l3, 0x60c, %o1
	.word	0x9da38950	! t0_kref+0x2ca8:   	fmuld	%f14, %f16, %f14
	.word	0x99a40950	! t0_kref+0x2cac:   	fmuld	%f16, %f16, %f12
	.word	0x39800005	! t0_kref+0x2cb0:   	fbuge,a	_kref+0x2cc4
	.word	0x91b38410	! t0_kref+0x2cb4:   	fcmple16	%f14, %f16, %o0
	.word	0x8143c000	! t0_kref+0x2cb8:   	stbar
	.word	0x30800002	! t0_kref+0x2cbc:   	ba,a	_kref+0x2cc4
	.word	0xed68a008	! t0_kref+0x2cc0:   	prefetch	%g2 + 8, 22
	.word	0xa8fcc012	! t0_kref+0x2cc4:   	sdivcc	%l3, %l2, %l4
	.word	0x9bb3ce2c	! t0_kref+0x2cc8:   	fands	%f15, %f12, %f13
	.word	0xab400000	! t0_kref+0x2ccc:   	mov	%y, %l5
	.word	0xa60d6ce2	! t0_kref+0x2cd0:   	and	%l5, 0xce2, %l3
	.word	0x9fa3492e	! t0_kref+0x2cd4:   	fmuls	%f13, %f14, %f15
	.word	0xd020a034	! t0_kref+0x2cd8:   	st	%o0, [%g2 + 0x34]
	.word	0x25800002	! t0_kref+0x2cdc:   	fblg,a	_kref+0x2ce4
	.word	0x99a0054c	! t0_kref+0x2ce0:   	fsqrtd	%f12, %f12
	.word	0xdd000019	! t0_kref+0x2ce4:   	ld	[%g0 + %i1], %f14
	.word	0x9ba00530	! t0_kref+0x2ce8:   	fsqrts	%f16, %f13
	.word	0xe810a01a	! t0_kref+0x2cec:   	lduh	[%g2 + 0x1a], %l4
	.word	0x925cc015	! t0_kref+0x2cf0:   	smul	%l3, %l5, %o1
	.word	0xdb00a034	! t0_kref+0x2cf4:   	ld	[%g2 + 0x34], %f13
	.word	0xd65e3ff0	! t0_kref+0x2cf8:   	ldx	[%i0 - 0x10], %o3
	.word	0xd02e0000	! t0_kref+0x2cfc:   	stb	%o0, [%i0]
	.word	0xa1b38af1	! t0_kref+0x2d00:   	fpsub32s	%f14, %f17, %f16
	.word	0x99a388d0	! t0_kref+0x2d04:   	fsubd	%f14, %f16, %f12
	.word	0xa1b34db0	! t0_kref+0x2d08:   	fxors	%f13, %f16, %f16
	.word	0x9db3090e	! t0_kref+0x2d0c:   	faligndata	%f12, %f14, %f14
	.word	0x92bcb160	! t0_kref+0x2d10:   	xnorcc	%l2, -0xea0, %o1
	.word	0xd020a004	! t0_kref+0x2d14:   	st	%o0, [%g2 + 4]
	.word	0xe1000019	! t0_kref+0x2d18:   	ld	[%g0 + %i1], %f16
	.word	0xe62e001a	! t0_kref+0x2d1c:   	stb	%l3, [%i0 + %i2]
	.word	0x901cc014	! t0_kref+0x2d20:   	xor	%l3, %l4, %o0
	.word	0x91b500f2	! t0_kref+0x2d24:   	edge16ln	%l4, %l2, %o0
	.word	0xec267fec	! t0_kref+0x2d28:   	st	%l6, [%i1 - 0x14]
	.word	0x99a0190e	! t0_kref+0x2d2c:   	fitod	%f14, %f12
	.word	0xee00a014	! t0_kref+0x2d30:   	ld	[%g2 + 0x14], %l7
	.word	0x9fa0052e	! t0_kref+0x2d34:   	fsqrts	%f14, %f15
	.word	0x2b011c52	! t0_kref+0x2d38:   	sethi	%hi(0x4714800), %l5
	.word	0x99a018ce	! t0_kref+0x2d3c:   	fdtos	%f14, %f12
	.word	0x95700017	! t0_kref+0x2d40:   	popc	%l7, %o2
	.word	0xe6263ffc	! t0_kref+0x2d44:   	st	%l3, [%i0 - 4]
	.word	0x972a200a	! t0_kref+0x2d48:   	sll	%o0, 0xa, %o3
	.word	0xec30a002	! t0_kref+0x2d4c:   	sth	%l6, [%g2 + 2]
	.word	0x92020013	! t0_kref+0x2d50:   	add	%o0, %l3, %o1
	.word	0xa3a00030	! t0_kref+0x2d54:   	fmovs	%f16, %f17
	.word	0x9da0054e	! t0_kref+0x2d58:   	fsqrtd	%f14, %f14
	.word	0xa735600a	! t0_kref+0x2d5c:   	srl	%l5, 0xa, %l3
	.word	0x9da000af	! t0_kref+0x2d60:   	fnegs	%f15, %f14
	.word	0xdd20a004	! t0_kref+0x2d64:   	st	%f14, [%g2 + 4]
	.word	0x9de3bfa0	! t0_kref+0x2d68:   	save	%sp, -0x60, %sp
	.word	0xadef2796	! t0_kref+0x2d6c:   	restore	%i4, 0x796, %l6
	.word	0xa68a0008	! t0_kref+0x2d70:   	andcc	%o0, %o0, %l3
	.word	0x2f800001	! t0_kref+0x2d74:   	fbu,a	_kref+0x2d78
	.word	0xa80cbd10	! t0_kref+0x2d78:   	and	%l2, -0x2f0, %l4
	.word	0x91b480f7	! t0_kref+0x2d7c:   	edge16ln	%l2, %l7, %o0
	.word	0xa83ca4fd	! t0_kref+0x2d80:   	xnor	%l2, 0x4fd, %l4
	.word	0x3f800003	! t0_kref+0x2d84:   	fbo,a	_kref+0x2d90
	.word	0xa1a38950	! t0_kref+0x2d88:   	fmuld	%f14, %f16, %f16
	.word	0xa1a00550	! t0_kref+0x2d8c:   	fsqrtd	%f16, %f16
	.word	0xa3a3c82d	! t0_kref+0x2d90:   	fadds	%f15, %f13, %f17
	.word	0x9da38850	! t0_kref+0x2d94:   	faddd	%f14, %f16, %f14
	.word	0xa1a389d0	! t0_kref+0x2d98:   	fdivd	%f14, %f16, %f16
	.word	0x96020015	! t0_kref+0x2d9c:   	add	%o0, %l5, %o3
	.word	0x9db44d2d	! t0_kref+0x2da0:   	fandnot1s	%f17, %f13, %f14
	.word	0xdd206cf2	! t0_kref+0x2da4:   	st	%f14, [%g1 + 0xcf2]
	.word	0x9db30750	! t0_kref+0x2da8:   	fpack32	%f12, %f16, %f14
	.word	0x81b01023	! t0_kref+0x2dac:   	siam	0x3
	.word	0xa3a00530	! t0_kref+0x2db0:   	fsqrts	%f16, %f17
	.word	0x9da4094c	! t0_kref+0x2db4:   	fmuld	%f16, %f12, %f14
	.word	0x968d0015	! t0_kref+0x2db8:   	andcc	%l4, %l5, %o3
	.word	0x9de3bfa0	! t0_kref+0x2dbc:   	save	%sp, -0x60, %sp
	.word	0xb2b621dd	! t0_kref+0x2dc0:   	orncc	%i0, 0x1dd, %i1
	.word	0xa7ee801a	! t0_kref+0x2dc4:   	restore	%i2, %i2, %l3
	.word	0x33800001	! t0_kref+0x2dc8:   	fbe,a	_kref+0x2dcc
	.word	0x95b5c0b4	! t0_kref+0x2dcc:   	edge16n	%l7, %l4, %o2
	.word	0xdb067fe4	! t0_kref+0x2dd0:   	ld	[%i1 - 0x1c], %f13
	.word	0x3e480007	! t0_kref+0x2dd4:   	bvc,a,pt	%icc, _kref+0x2df0
	.word	0x9db38d8e	! t0_kref+0x2dd8:   	fxor	%f14, %f14, %f14
	.word	0x21480004	! t0_kref+0x2ddc:   	fbn,a,pt	%fcc0, _kref+0x2dec
	.word	0x291a37f0	! t0_kref+0x2de0:   	sethi	%hi(0x68dfc000), %l4
	.word	0xa1b406ce	! t0_kref+0x2de4:   	fmul8sux16	%f16, %f14, %f16
	.word	0x2c800008	! t0_kref+0x2de8:   	bneg,a	_kref+0x2e08
	.word	0xa3a448b0	! t0_kref+0x2dec:   	fsubs	%f17, %f16, %f17
	.word	0x949ce697	! t0_kref+0x2df0:   	xorcc	%l3, 0x697, %o2
	.word	0xa3a0002d	! t0_kref+0x2df4:   	fmovs	%f13, %f17
	.word	0x9db40f90	! t0_kref+0x2df8:   	for	%f16, %f16, %f14
	.word	0x99a0052c	! t0_kref+0x2dfc:   	fsqrts	%f12, %f12
	.word	0x9fa018cc	! t0_kref+0x2e00:   	fdtos	%f12, %f15
	.word	0xee30a02c	! t0_kref+0x2e04:   	sth	%l7, [%g2 + 0x2c]
	.word	0xa1a309d0	! t0_kref+0x2e08:   	fdivd	%f12, %f16, %f16
!	.word	0x2d4f1c7b	! t0_kref+0x2e0c:   	fbg,a,pt	%fcc0, SYM(t0_subr0)
	   	fbg,a,pt	%fcc0, SYM(t0_subr0)
	.word	0x9f414000	! t0_kref+0x2e10:   	mov	%pc, %o7
	.word	0xa1b00ccc	! t0_kref+0x2e14:   	fnot2	%f12, %f16
	.word	0xa1a0012d	! t0_kref+0x2e18:   	fabss	%f13, %f16
	.word	0x93350015	! t0_kref+0x2e1c:   	srl	%l4, %l5, %o1
	.word	0xa1a018ce	! t0_kref+0x2e20:   	fdtos	%f14, %f16
	.word	0x95b385d0	! t0_kref+0x2e24:   	fcmpeq32	%f14, %f16, %o2
	.word	0xabb50116	! t0_kref+0x2e28:   	edge32	%l4, %l6, %l5
	.word	0xac34eb9e	! t0_kref+0x2e2c:   	orn	%l3, 0xb9e, %l6
	.word	0xa845ad30	! t0_kref+0x2e30:   	addc	%l6, 0xd30, %l4
	.word	0x32480007	! t0_kref+0x2e34:   	bne,a,pt	%icc, _kref+0x2e50
	.word	0x99a00530	! t0_kref+0x2e38:   	fsqrts	%f16, %f12
	.word	0x81dfc012	! t0_kref+0x2e3c:   	flush	%i7 + %l2
	.word	0x99a4084c	! t0_kref+0x2e40:   	faddd	%f16, %f12, %f12
	.word	0xa89c8012	! t0_kref+0x2e44:   	xorcc	%l2, %l2, %l4
	.word	0x9ba018d0	! t0_kref+0x2e48:   	fdtos	%f16, %f13
	.word	0x9da30850	! t0_kref+0x2e4c:   	faddd	%f12, %f16, %f14
	.word	0xaf418000	! t0_kref+0x2e50:   	mov	%fprs, %l7
	.word	0xc06e7ffe	! t0_kref+0x2e54:   	ldstub	[%i1 - 2], %g0
	.word	0xb410201a	! t0_kref+0x2e58:   	mov	0x1a, %i2
	.word	0x99a4084c	! t0_kref+0x2e5c:   	faddd	%f16, %f12, %f12
	.word	0x2b800006	! t0_kref+0x2e60:   	fbug,a	_kref+0x2e78
	.word	0xe3ee101d	! t0_kref+0x2e64:   	prefetcha	%i0 + %i5, 17
	.word	0xabb50355	! t0_kref+0x2e68:   	alignaddrl	%l4, %l5, %l5
	.word	0xd99e5a5b	! t0_kref+0x2e6c:   	ldda	[%i1 + %i3]0xd2, %f12
	.word	0xd01e4000	! t0_kref+0x2e70:   	ldd	[%i1], %o0
	.word	0xedee501c	! t0_kref+0x2e74:   	prefetcha	%i1 + %i4, 22
	.word	0x28800002	! t0_kref+0x2e78:   	bleu,a	_kref+0x2e80
	.word	0x94858013	! t0_kref+0x2e7c:   	addcc	%l6, %l3, %o2
	.word	0xe898105d	! t0_kref+0x2e80:   	ldda	[%g0 + %i5]0x82, %l4
	.word	0x9ba018d0	! t0_kref+0x2e84:   	fdtos	%f16, %f13
	.word	0x9de3bfa0	! t0_kref+0x2e88:   	save	%sp, -0x60, %sp
	.word	0xb4372815	! t0_kref+0x2e8c:   	orn	%i4, 0x815, %i2
	.word	0xabe8360f	! t0_kref+0x2e90:   	restore	%g0, -0x9f1, %l5
	.word	0x3e480007	! t0_kref+0x2e94:   	bvc,a,pt	%icc, _kref+0x2eb0
	.word	0x9334e00c	! t0_kref+0x2e98:   	srl	%l3, 0xc, %o1
	.word	0xa1b00cce	! t0_kref+0x2e9c:   	fnot2	%f14, %f16
	.word	0xec2e4000	! t0_kref+0x2ea0:   	stb	%l6, [%i1]
	.word	0xa67c8015	! t0_kref+0x2ea4:   	sdiv	%l2, %l5, %l3
	.word	0xa474c012	! t0_kref+0x2ea8:   	udiv	%l3, %l2, %l2
	.word	0x30800005	! t0_kref+0x2eac:   	ba,a	_kref+0x2ec0
	.word	0x909dc015	! t0_kref+0x2eb0:   	xorcc	%l7, %l5, %o0
	.word	0x9ba388af	! t0_kref+0x2eb4:   	fsubs	%f14, %f15, %f13
	.word	0x2a800002	! t0_kref+0x2eb8:   	bcs,a	_kref+0x2ec0
	.word	0xe8767ff8	! t0_kref+0x2ebc:   	stx	%l4, [%i1 - 8]
	.word	0xee300019	! t0_kref+0x2ec0:   	sth	%l7, [%g0 + %i1]
	.word	0x9da388d0	! t0_kref+0x2ec4:   	fsubd	%f14, %f16, %f14
	.word	0xd8fe101c	! t0_kref+0x2ec8:   	swapa	[%i0 + %i4]0x80, %o4
	.word	0x9da409ce	! t0_kref+0x2ecc:   	fdivd	%f16, %f14, %f14
	.word	0x81ac0a50	! t0_kref+0x2ed0:   	fcmpd	%fcc0, %f16, %f16
	.word	0xa5b385ce	! t0_kref+0x2ed4:   	fcmpeq32	%f14, %f14, %l2
	.word	0x8143e040	! t0_kref+0x2ed8:   	membar	0x40
	.word	0x93b4c357	! t0_kref+0x2edc:   	alignaddrl	%l3, %l7, %o1
	.word	0x99b30630	! t0_kref+0x2ee0:   	fmul8x16	%f12, %f16, %f12
	.word	0x9fa01a4c	! t0_kref+0x2ee4:   	fdtoi	%f12, %f15
	.word	0xa1a00550	! t0_kref+0x2ee8:   	fsqrtd	%f16, %f16
	.word	0xd920a038	! t0_kref+0x2eec:   	st	%f12, [%g2 + 0x38]
	.word	0x23800001	! t0_kref+0x2ef0:   	fbne,a	_kref+0x2ef4
	.word	0xee56001b	! t0_kref+0x2ef4:   	ldsh	[%i0 + %i3], %l7
	.word	0xa1a40950	! t0_kref+0x2ef8:   	fmuld	%f16, %f16, %f16
	.word	0xa7b48328	! t0_kref+0x2efc:   	bmask	%l2, %o0, %l3
	.word	0x26480001	! t0_kref+0x2f00:   	bl,a,pt	%icc, _kref+0x2f04
	.word	0xaaf4fb3c	! t0_kref+0x2f04:   	udivcc	%l3, -0x4c4, %l5
	.word	0x99a00550	! t0_kref+0x2f08:   	fsqrtd	%f16, %f12
	.word	0xae8ce041	! t0_kref+0x2f0c:   	andcc	%l3, 0x41, %l7
	.word	0x9fa4482e	! t0_kref+0x2f10:   	fadds	%f17, %f14, %f15
	.word	0x9fa0012e	! t0_kref+0x2f14:   	fabss	%f14, %f15
	.word	0x9735c013	! t0_kref+0x2f18:   	srl	%l7, %l3, %o3
	.word	0xa6b5c016	! t0_kref+0x2f1c:   	orncc	%l7, %l6, %l3
	.word	0xad2d601a	! t0_kref+0x2f20:   	sll	%l5, 0x1a, %l6
	.word	0x909c8008	! t0_kref+0x2f24:   	xorcc	%l2, %o0, %o0
	.word	0x94d5a00d	! t0_kref+0x2f28:   	umulcc	%l6, 0xd, %o2
	.word	0x81ac4ab0	! t0_kref+0x2f2c:   	fcmpes	%fcc0, %f17, %f16
	.word	0x9ba30930	! t0_kref+0x2f30:   	fmuls	%f12, %f16, %f13
	.word	0xa1a00530	! t0_kref+0x2f34:   	fsqrts	%f16, %f16
	.word	0xe6263ff0	! t0_kref+0x2f38:   	st	%l3, [%i0 - 0x10]
	.word	0xe13e3fe8	! t0_kref+0x2f3c:   	std	%f16, [%i0 - 0x18]
	.word	0xac020016	! t0_kref+0x2f40:   	add	%o0, %l6, %l6
	.word	0xa3a01a30	! t0_kref+0x2f44:   	fstoi	%f16, %f17
	.word	0xa69dc017	! t0_kref+0x2f48:   	xorcc	%l7, %l7, %l3
	.word	0x3f800004	! t0_kref+0x2f4c:   	fbo,a	_kref+0x2f5c
	.word	0x9fa4082c	! t0_kref+0x2f50:   	fadds	%f16, %f12, %f15
	.word	0xd9180019	! t0_kref+0x2f54:   	ldd	[%g0 + %i1], %f12
	.word	0xa1a30850	! t0_kref+0x2f58:   	faddd	%f12, %f16, %f16
	.word	0x9da01110	! t0_kref+0x2f5c:   	fxtod	%f16, %f14
	.word	0x3c480001	! t0_kref+0x2f60:   	bpos,a,pt	%icc, _kref+0x2f64
	.word	0xa9400000	! t0_kref+0x2f64:   	mov	%y, %l4
	.word	0xafb20052	! t0_kref+0x2f68:   	edge8l	%o0, %l2, %l7
	.word	0x35800008	! t0_kref+0x2f6c:   	fbue,a	_kref+0x2f8c
	.word	0x96f48008	! t0_kref+0x2f70:   	udivcc	%l2, %o0, %o3
	.word	0x99b306ce	! t0_kref+0x2f74:   	fmul8sux16	%f12, %f14, %f12
	.word	0x81ab8aac	! t0_kref+0x2f78:   	fcmpes	%fcc0, %f14, %f12
	.word	0x9da389d0	! t0_kref+0x2f7c:   	fdivd	%f14, %f16, %f14
	.word	0xa8820014	! t0_kref+0x2f80:   	addcc	%o0, %l4, %l4
	.word	0x25480004	! t0_kref+0x2f84:   	fblg,a,pt	%fcc0, _kref+0x2f94
	.word	0xea28a036	! t0_kref+0x2f88:   	stb	%l5, [%g2 + 0x36]
	.word	0x9da308cc	! t0_kref+0x2f8c:   	fsubd	%f12, %f12, %f14
	.word	0x99a00550	! t0_kref+0x2f90:   	fsqrtd	%f16, %f12
	.word	0x99a00131	! t0_kref+0x2f94:   	fabss	%f17, %f12
	.word	0x3c480002	! t0_kref+0x2f98:   	bpos,a,pt	%icc, _kref+0x2fa0
	.word	0x99a3884c	! t0_kref+0x2f9c:   	faddd	%f14, %f12, %f12
	.word	0x9664b41d	! t0_kref+0x2fa0:   	subc	%l2, -0xbe3, %o3
	.word	0xd66e8019	! t0_kref+0x2fa4:   	ldstub	[%i2 + %i1], %o3
	.word	0xad35c016	! t0_kref+0x2fa8:   	srl	%l7, %l6, %l6
	.word	0x2c480005	! t0_kref+0x2fac:   	bneg,a,pt	%icc, _kref+0x2fc0
	.word	0xd91e7ff8	! t0_kref+0x2fb0:   	ldd	[%i1 - 8], %f12
	.word	0x81d876fc	! t0_kref+0x2fb4:   	flush	%g1 - 0x904
	.word	0xae8d8015	! t0_kref+0x2fb8:   	andcc	%l6, %l5, %l7
	.word	0x9da0054c	! t0_kref+0x2fbc:   	fsqrtd	%f12, %f14
	.word	0x99a4094e	! t0_kref+0x2fc0:   	fmuld	%f16, %f14, %f12
	.word	0xeb68a006	! t0_kref+0x2fc4:   	prefetch	%g2 + 6, 21
	.word	0xe428a036	! t0_kref+0x2fc8:   	stb	%l2, [%g2 + 0x36]
	.word	0x2e800006	! t0_kref+0x2fcc:   	bvs,a	_kref+0x2fe4
	.word	0xa3b30a2d	! t0_kref+0x2fd0:   	fpadd16s	%f12, %f13, %f17
	.word	0xaa0a338a	! t0_kref+0x2fd4:   	and	%o0, -0xc76, %l5
	.word	0xd9be1a1a	! t0_kref+0x2fd8:   	stda	%f12, [%i0 + %i2]0xd0
	.word	0x94650015	! t0_kref+0x2fdc:   	subc	%l4, %l5, %o2
	.word	0xa740c000	! t0_kref+0x2fe0:   	mov	%asi, %l3
	.word	0xacfd8014	! t0_kref+0x2fe4:   	sdivcc	%l6, %l4, %l6
	.word	0xa3a0052c	! t0_kref+0x2fe8:   	fsqrts	%f12, %f17
	.word	0xe07f0018	! t0_kref+0x2fec:   	swap	[%i4 + %i0], %l0
	.word	0x99a00030	! t0_kref+0x2ff0:   	fmovs	%f16, %f12
	.word	0x3b480003	! t0_kref+0x2ff4:   	fble,a,pt	%fcc0, _kref+0x3000
	.word	0xa3a01a4e	! t0_kref+0x2ff8:   	fdtoi	%f14, %f17
	.word	0x9615c016	! t0_kref+0x2ffc:   	or	%l7, %l6, %o3
	.word	0xd020a038	! t0_kref+0x3000:   	st	%o0, [%g2 + 0x38]
	.word	0x9075fd19	! t0_kref+0x3004:   	udiv	%l7, -0x2e7, %o0
	.word	0xae354016	! t0_kref+0x3008:   	orn	%l5, %l6, %l7
	.word	0xea28a010	! t0_kref+0x300c:   	stb	%l5, [%g2 + 0x10]
	.word	0x93320015	! t0_kref+0x3010:   	srl	%o0, %l5, %o1
	.word	0x9fa00530	! t0_kref+0x3014:   	fsqrts	%f16, %f15
	.word	0xa1a0052e	! t0_kref+0x3018:   	fsqrts	%f14, %f16
	.word	0x22800004	! t0_kref+0x301c:   	be,a	_kref+0x302c
	.word	0xa7b5c174	! t0_kref+0x3020:   	edge32ln	%l7, %l4, %l3
	.word	0x912dc008	! t0_kref+0x3024:   	sll	%l7, %o0, %o0
	.word	0x9204c017	! t0_kref+0x3028:   	add	%l3, %l7, %o1
	.word	0x9da40850	! t0_kref+0x302c:   	faddd	%f16, %f16, %f14
	.word	0x2f07732b	! t0_kref+0x3030:   	sethi	%hi(0x1dccac00), %l7
	.word	0xa3a308ac	! t0_kref+0x3034:   	fsubs	%f12, %f12, %f17
	.word	0xd65f4019	! t0_kref+0x3038:   	ldx	[%i5 + %i1], %o3
	.word	0xa73ca00e	! t0_kref+0x303c:   	sra	%l2, 0xe, %l3
	.word	0x9ba00530	! t0_kref+0x3040:   	fsqrts	%f16, %f13
	.word	0x24800001	! t0_kref+0x3044:   	ble,a	_kref+0x3048
	.word	0xa88df78d	! t0_kref+0x3048:   	andcc	%l7, -0x873, %l4
	.word	0xa1a30830	! t0_kref+0x304c:   	fadds	%f12, %f16, %f16
	.word	0x94acea00	! t0_kref+0x3050:   	andncc	%l3, 0xa00, %o2
	.word	0x3e480004	! t0_kref+0x3054:   	bvc,a,pt	%icc, _kref+0x3064
	.word	0x9da408cc	! t0_kref+0x3058:   	fsubd	%f16, %f12, %f14
	.word	0xfd6e7fe8	! t0_kref+0x305c:   	prefetch	%i1 - 0x18, 30
	.word	0x91b58115	! t0_kref+0x3060:   	edge32	%l6, %l5, %o0
	.word	0x9de3bfa0	! t0_kref+0x3064:   	save	%sp, -0x60, %sp
	.word	0x93ef001d	! t0_kref+0x3068:   	restore	%i4, %i5, %o1
	.word	0x9ba0012e	! t0_kref+0x306c:   	fabss	%f14, %f13
	.word	0x2c800003	! t0_kref+0x3070:   	bneg,a	_kref+0x307c
	.word	0x252adb0c	! t0_kref+0x3074:   	sethi	%hi(0xab6c3000), %l2
	.word	0xfdee101c	! t0_kref+0x3078:   	prefetcha	%i0 + %i4, 30
	.word	0xe62e600c	! t0_kref+0x307c:   	stb	%l3, [%i1 + 0xc]
	.word	0xa1a409cc	! t0_kref+0x3080:   	fdivd	%f16, %f12, %f16
	.word	0xa6253d9f	! t0_kref+0x3084:   	sub	%l4, -0x261, %l3
	.word	0x90fcb548	! t0_kref+0x3088:   	sdivcc	%l2, -0xab8, %o0
	.word	0x9fa018ce	! t0_kref+0x308c:   	fdtos	%f14, %f15
	.word	0xe430a01e	! t0_kref+0x3090:   	sth	%l2, [%g2 + 0x1e]
	.word	0x9da0052d	! t0_kref+0x3094:   	fsqrts	%f13, %f14
	.word	0x2b800004	! t0_kref+0x3098:   	fbug,a	_kref+0x30a8
	.word	0xf83e4000	! t0_kref+0x309c:   	std	%i4, [%i1]
	.word	0x99b3caac	! t0_kref+0x30a0:   	fpsub16s	%f15, %f12, %f12
	.word	0xa92ca017	! t0_kref+0x30a4:   	sll	%l2, 0x17, %l4
	.word	0x99b30a70	! t0_kref+0x30a8:   	fpadd32s	%f12, %f16, %f12
	.word	0x9db00cf0	! t0_kref+0x30ac:   	fnot2s	%f16, %f14
	.word	0xdd063ff8	! t0_kref+0x30b0:   	ld	[%i0 - 8], %f14
	.word	0xdd20a030	! t0_kref+0x30b4:   	st	%f14, [%g2 + 0x30]
	.word	0x94850012	! t0_kref+0x30b8:   	addcc	%l4, %l2, %o2
	.word	0xa1a348b1	! t0_kref+0x30bc:   	fsubs	%f13, %f17, %f16
	.word	0x91b54355	! t0_kref+0x30c0:   	alignaddrl	%l5, %l5, %o0
	.word	0xee2e7ff8	! t0_kref+0x30c4:   	stb	%l7, [%i1 - 8]
	.word	0xa88d0016	! t0_kref+0x30c8:   	andcc	%l4, %l6, %l4
	.word	0xdf20a004	! t0_kref+0x30cc:   	st	%f15, [%g2 + 4]
	.word	0x3a800006	! t0_kref+0x30d0:   	bcc,a	_kref+0x30e8
	.word	0xa934a007	! t0_kref+0x30d4:   	srl	%l2, 0x7, %l4
	.word	0x2b26912c	! t0_kref+0x30d8:   	sethi	%hi(0x9a44b000), %l5
	.word	0xa6ac8013	! t0_kref+0x30dc:   	andncc	%l2, %l3, %l3
	.word	0x9da0054e	! t0_kref+0x30e0:   	fsqrtd	%f14, %f14
	.word	0xa1b44a6c	! t0_kref+0x30e4:   	fpadd32s	%f17, %f12, %f16
	.word	0xa4fd79af	! t0_kref+0x30e8:   	sdivcc	%l5, -0x651, %l2
	.word	0xa1b386b0	! t0_kref+0x30ec:   	fmul8x16al	%f14, %f16, %f16
	.word	0x97b5c115	! t0_kref+0x30f0:   	edge32	%l7, %l5, %o3
	.word	0xdf070018	! t0_kref+0x30f4:   	ld	[%i4 + %i0], %f15
	.word	0x99a308b1	! t0_kref+0x30f8:   	fsubs	%f12, %f17, %f12
	.word	0x96fd8017	! t0_kref+0x30fc:   	sdivcc	%l6, %l7, %o3
	.word	0x30800002	! t0_kref+0x3100:   	ba,a	_kref+0x3108
	.word	0xaa5ce668	! t0_kref+0x3104:   	smul	%l3, 0x668, %l5
	.word	0x9da0054c	! t0_kref+0x3108:   	fsqrtd	%f12, %f14
	.word	0xe820a028	! t0_kref+0x310c:   	st	%l4, [%g2 + 0x28]
	.word	0xa1b00cd0	! t0_kref+0x3110:   	fnot2	%f16, %f16
	.word	0x9da0054c	! t0_kref+0x3114:   	fsqrtd	%f12, %f14
	.word	0xa7b58116	! t0_kref+0x3118:   	edge32	%l6, %l6, %l3
	.word	0xef6e001d	! t0_kref+0x311c:   	prefetch	%i0 + %i5, 23
	.word	0x9da0192c	! t0_kref+0x3120:   	fstod	%f12, %f14
	.word	0x95b384d0	! t0_kref+0x3124:   	fcmpne32	%f14, %f16, %o2
	.word	0xec86101c	! t0_kref+0x3128:   	lda	[%i0 + %i4]0x80, %l6
	.word	0xd020a030	! t0_kref+0x312c:   	st	%o0, [%g2 + 0x30]
	.word	0xa9b384ce	! t0_kref+0x3130:   	fcmpne32	%f14, %f14, %l4
	.word	0x921573e1	! t0_kref+0x3134:   	or	%l5, -0xc1f, %o1
	.word	0xa9400000	! t0_kref+0x3138:   	mov	%y, %l4
	.word	0x99a4492f	! t0_kref+0x313c:   	fmuls	%f17, %f15, %f12
	.word	0xd9064000	! t0_kref+0x3140:   	ld	[%i1], %f12
	.word	0xa3a00031	! t0_kref+0x3144:   	fmovs	%f17, %f17
	.word	0xda6e2011	! t0_kref+0x3148:   	ldstub	[%i0 + 0x11], %o5
	.word	0x8143c000	! t0_kref+0x314c:   	stbar
	.word	0x292e44c5	! t0_kref+0x3150:   	sethi	%hi(0xb9131400), %l4
	.word	0xe120a030	! t0_kref+0x3154:   	st	%f16, [%g2 + 0x30]
	.word	0x9db0076c	! t0_kref+0x3158:   	fpack16	%f12, %f14
	.word	0x8143e07e	! t0_kref+0x315c:   	membar	0x7e
	.word	0x25800005	! t0_kref+0x3160:   	fblg,a	_kref+0x3174
	.word	0x99a309d0	! t0_kref+0x3164:   	fdivd	%f12, %f16, %f12
	.word	0xa465ba77	! t0_kref+0x3168:   	subc	%l6, -0x589, %l2
	.word	0xe36e6008	! t0_kref+0x316c:   	prefetch	%i1 + 8, 17
	.word	0xa1a408ce	! t0_kref+0x3170:   	fsubd	%f16, %f14, %f16
	.word	0x9da0192d	! t0_kref+0x3174:   	fstod	%f13, %f14
	.word	0xe3b8a040	! t0_kref+0x3178:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9ba0012c	! t0_kref+0x317c:   	fabss	%f12, %f13
	.word	0xa5b4054e	! t0_kref+0x3180:   	fcmpeq16	%f16, %f14, %l2
	.word	0x9fc00004	! t0_kref+0x3184:   	call	%g0 + %g4
	.word	0xee2e7ff3	! t0_kref+0x3188:   	stb	%l7, [%i1 - 0xd]
	.word	0x9de3bfa0	! t0_kref+0x318c:   	save	%sp, -0x60, %sp
	.word	0xb2e6e7e0	! t0_kref+0x3190:   	subccc	%i3, 0x7e0, %i1
	.word	0xa9ee001c	! t0_kref+0x3194:   	restore	%i0, %i4, %l4
	.word	0xa3a3092e	! t0_kref+0x3198:   	fmuls	%f12, %f14, %f17
	.word	0xea00a034	! t0_kref+0x319c:   	ld	[%g2 + 0x34], %l5
	.word	0x86102001	! t0_kref+0x31a0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x31a4:   	bne,a	_kref+0x31a4
	.word	0x86a0e001	! t0_kref+0x31a8:   	subcc	%g3, 1, %g3
	.word	0x81ab4aaf	! t0_kref+0x31ac:   	fcmpes	%fcc0, %f13, %f15
	.word	0xae84a000	! t0_kref+0x31b0:   	addcc	%l2, 0, %l7
	.word	0x9db38750	! t0_kref+0x31b4:   	fpack32	%f14, %f16, %f14
	.word	0x9da3082f	! t0_kref+0x31b8:   	fadds	%f12, %f15, %f14
	.word	0x9da3c9ae	! t0_kref+0x31bc:   	fdivs	%f15, %f14, %f14
	.word	0xa3a0012e	! t0_kref+0x31c0:   	fabss	%f14, %f17
	.word	0x26480007	! t0_kref+0x31c4:   	bl,a,pt	%icc, _kref+0x31e0
	.word	0x9fa00031	! t0_kref+0x31c8:   	fmovs	%f17, %f15
	.word	0x925dc012	! t0_kref+0x31cc:   	smul	%l7, %l2, %o1
	.word	0xa43ce46a	! t0_kref+0x31d0:   	xnor	%l3, 0x46a, %l2
	.word	0xa435c016	! t0_kref+0x31d4:   	orn	%l7, %l6, %l2
	.word	0x90fcc015	! t0_kref+0x31d8:   	sdivcc	%l3, %l5, %o0
	.word	0x99b30ace	! t0_kref+0x31dc:   	fpsub32	%f12, %f14, %f12
	.word	0x99a0052c	! t0_kref+0x31e0:   	fsqrts	%f12, %f12
	.word	0xe300a03c	! t0_kref+0x31e4:   	ld	[%g2 + 0x3c], %f17
	.word	0xa61cad62	! t0_kref+0x31e8:   	xor	%l2, 0xd62, %l3
	.word	0x81dfc00f	! t0_kref+0x31ec:   	flush	%i7 + %o7
	.word	0xec20a014	! t0_kref+0x31f0:   	st	%l6, [%g2 + 0x14]
	.word	0x9140c000	! t0_kref+0x31f4:   	mov	%asi, %o0
	.word	0xa1a3894e	! t0_kref+0x31f8:   	fmuld	%f14, %f14, %f16
	.word	0xac54c015	! t0_kref+0x31fc:   	umul	%l3, %l5, %l6
	.word	0xeb68a047	! t0_kref+0x3200:   	prefetch	%g2 + 0x47, 21
	.word	0xdd20a02c	! t0_kref+0x3204:   	st	%f14, [%g2 + 0x2c]
	.word	0xea262000	! t0_kref+0x3208:   	st	%l5, [%i0]
	.word	0xe11e3fe8	! t0_kref+0x320c:   	ldd	[%i0 - 0x18], %f16
	.word	0xd02e8018	! t0_kref+0x3210:   	stb	%o0, [%i2 + %i0]
	.word	0xa8950012	! t0_kref+0x3214:   	orcc	%l4, %l2, %l4
	.word	0xac650008	! t0_kref+0x3218:   	subc	%l4, %o0, %l6
	.word	0xea30a038	! t0_kref+0x321c:   	sth	%l5, [%g2 + 0x38]
	.word	0x24800003	! t0_kref+0x3220:   	ble,a	_kref+0x322c
	.word	0x9405a9cd	! t0_kref+0x3224:   	add	%l6, 0x9cd, %o2
	.word	0x92ad0008	! t0_kref+0x3228:   	andncc	%l4, %o0, %o1
	.word	0x29800004	! t0_kref+0x322c:   	fbl,a	_kref+0x323c
	.word	0xac953141	! t0_kref+0x3230:   	orcc	%l4, -0xebf, %l6
	.word	0xa3b40aae	! t0_kref+0x3234:   	fpsub16s	%f16, %f14, %f17
	.word	0x37480002	! t0_kref+0x3238:   	fbge,a,pt	%fcc0, _kref+0x3240
	.word	0xa1a0052e	! t0_kref+0x323c:   	fsqrts	%f14, %f16
	.word	0x8143e071	! t0_kref+0x3240:   	membar	0x71
	.word	0x81dfaba5	! t0_kref+0x3244:   	flush	%fp + 0xba5
	.word	0x9de3bfa0	! t0_kref+0x3248:   	save	%sp, -0x60, %sp
	.word	0x91ee31c4	! t0_kref+0x324c:   	restore	%i0, -0xe3c, %o0
	.word	0x95400000	! t0_kref+0x3250:   	mov	%y, %o2
	.word	0xee20a000	! t0_kref+0x3254:   	st	%l7, [%g2]
	.word	0x905d756c	! t0_kref+0x3258:   	smul	%l5, -0xa94, %o0
	.word	0x99b30e80	! t0_kref+0x325c:   	fsrc1	%f12, %f12
	.word	0xdd20a004	! t0_kref+0x3260:   	st	%f14, [%g2 + 4]
	.word	0x99a4492c	! t0_kref+0x3264:   	fmuls	%f17, %f12, %f12
	.word	0x9de3bfa0	! t0_kref+0x3268:   	save	%sp, -0x60, %sp
	.word	0x97ee0018	! t0_kref+0x326c:   	restore	%i0, %i0, %o3
	.word	0xaa5d8012	! t0_kref+0x3270:   	smul	%l6, %l2, %l5
	.word	0x99a309ce	! t0_kref+0x3274:   	fdivd	%f12, %f14, %f12
	.word	0xa4fdaad0	! t0_kref+0x3278:   	sdivcc	%l6, 0xad0, %l2
	.word	0xa49dc015	! t0_kref+0x327c:   	xorcc	%l7, %l5, %l2
	.word	0x9da0104c	! t0_kref+0x3280:   	fdtox	%f12, %f14
	.word	0x97358016	! t0_kref+0x3284:   	srl	%l6, %l6, %o3
	.word	0xe88e1000	! t0_kref+0x3288:   	lduba	[%i0]0x80, %l4
	.word	0xe76e6010	! t0_kref+0x328c:   	prefetch	%i1 + 0x10, 19
	.word	0x9ba018cc	! t0_kref+0x3290:   	fdtos	%f12, %f13
	.word	0x9da30850	! t0_kref+0x3294:   	faddd	%f12, %f16, %f14
	.word	0x81de709d	! t0_kref+0x3298:   	flush	%i1 - 0xf63
	.word	0xe3b8a040	! t0_kref+0x329c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9ba3c82e	! t0_kref+0x32a0:   	fadds	%f15, %f14, %f13
	.word	0xa1b30c8e	! t0_kref+0x32a4:   	fandnot2	%f12, %f14, %f16
	.word	0xe4363fe2	! t0_kref+0x32a8:   	sth	%l2, [%i0 - 0x1e]
	.word	0x9ba3c9af	! t0_kref+0x32ac:   	fdivs	%f15, %f15, %f13
	.word	0x86102019	! t0_kref+0x32b0:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x32b4:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x32b8:   	be,a	_kref+0x32f8
	.word	0x9da38850	! t0_kref+0x32bc:   	faddd	%f14, %f16, %f14
	.word	0x9340c000	! t0_kref+0x32c0:   	mov	%asi, %o1
	.word	0x95b4044c	! t0_kref+0x32c4:   	fcmpne16	%f16, %f12, %o2
	.word	0x2f4ffffb	! t0_kref+0x32c8:   	fbu,a,pt	%fcc0, _kref+0x32b4
	.word	0x9da448b0	! t0_kref+0x32cc:   	fsubs	%f17, %f16, %f14
	.word	0xe3ee501d	! t0_kref+0x32d0:   	prefetcha	%i1 + %i5, 17
	.word	0x9fa3892e	! t0_kref+0x32d4:   	fmuls	%f14, %f14, %f15
	.word	0x38bffff7	! t0_kref+0x32d8:   	bgu,a	_kref+0x32b4
	.word	0x9635b413	! t0_kref+0x32dc:   	orn	%l6, -0xbed, %o3
	.word	0x9ba01a30	! t0_kref+0x32e0:   	fstoi	%f16, %f13
	.word	0xd93e0000	! t0_kref+0x32e4:   	std	%f12, [%i0]
	.word	0x972da00c	! t0_kref+0x32e8:   	sll	%l6, 0xc, %o3
	.word	0x91b5c356	! t0_kref+0x32ec:   	alignaddrl	%l7, %l6, %o0
	.word	0xd27e3fe0	! t0_kref+0x32f0:   	swap	[%i0 - 0x20], %o1
	.word	0x2c800002	! t0_kref+0x32f4:   	bneg,a	_kref+0x32fc
	.word	0xec26401c	! t0_kref+0x32f8:   	st	%l6, [%i1 + %i4]
	.word	0xe1b81019	! t0_kref+0x32fc:   	stda	%f16, [%g0 + %i1]0x80
	.word	0x9da00530	! t0_kref+0x3300:   	fsqrts	%f16, %f14
	.word	0xa8fa0012	! t0_kref+0x3304:   	sdivcc	%o0, %l2, %l4
	.word	0xac058014	! t0_kref+0x3308:   	add	%l6, %l4, %l6
	.word	0x25800006	! t0_kref+0x330c:   	fblg,a	_kref+0x3324
	.word	0x9da388cc	! t0_kref+0x3310:   	fsubd	%f14, %f12, %f14
	.word	0x9fa018cc	! t0_kref+0x3314:   	fdtos	%f12, %f15
	.word	0x99b38671	! t0_kref+0x3318:   	fmul8x16au	%f14, %f17, %f12
	.word	0x2d800006	! t0_kref+0x331c:   	fbg,a	_kref+0x3334
	.word	0xf43e3ff8	! t0_kref+0x3320:   	std	%i2, [%i0 - 8]
	.word	0xad652454	! t0_kref+0x3324:   	movleu	%icc, -0x3ac, %l6
	.word	0xef68a085	! t0_kref+0x3328:   	prefetch	%g2 + 0x85, 23
	.word	0xc368a00f	! t0_kref+0x332c:   	prefetch	%g2 + 0xf, 1
	.word	0xc1ee5013	! t0_kref+0x3330:   	prefetcha	%i1 + %l3, 0
	.word	0xa7400000	! t0_kref+0x3334:   	mov	%y, %l3
	.word	0xac9d4008	! t0_kref+0x3338:   	xorcc	%l5, %o0, %l6
	.word	0xaa8c8008	! t0_kref+0x333c:   	andcc	%l2, %o0, %l5
	.word	0xa3a0012e	! t0_kref+0x3340:   	fabss	%f14, %f17
	.word	0x9fa0012f	! t0_kref+0x3344:   	fabss	%f15, %f15
	.word	0xab400000	! t0_kref+0x3348:   	mov	%y, %l5
	.word	0xa1b40a10	! t0_kref+0x334c:   	fpadd16	%f16, %f16, %f16
	.word	0x9ba389ac	! t0_kref+0x3350:   	fdivs	%f14, %f12, %f13
	.word	0xaafc8013	! t0_kref+0x3354:   	sdivcc	%l2, %l3, %l5
	.word	0x99a8404c	! t0_kref+0x3358:   	fmovdne	%fcc0, %f12, %f12
	.word	0x3a800008	! t0_kref+0x335c:   	bcc,a	_kref+0x337c
	.word	0xa1a00530	! t0_kref+0x3360:   	fsqrts	%f16, %f16
	.word	0xaafd0012	! t0_kref+0x3364:   	sdivcc	%l4, %l2, %l5
	.word	0x97120014	! t0_kref+0x3368:   	taddcctv	%o0, %l4, %o3
	.word	0xe11e2000	! t0_kref+0x336c:   	ldd	[%i0], %f16
	.word	0x93418000	! t0_kref+0x3370:   	mov	%fprs, %o1
	.word	0xe320a028	! t0_kref+0x3374:   	st	%f17, [%g2 + 0x28]
	.word	0xec2e401a	! t0_kref+0x3378:   	stb	%l6, [%i1 + %i2]
	.word	0x969d6f89	! t0_kref+0x337c:   	xorcc	%l5, 0xf89, %o3
	.word	0xc568a003	! t0_kref+0x3380:   	prefetch	%g2 + 3, 2
	.word	0xdb20a014	! t0_kref+0x3384:   	st	%f13, [%g2 + 0x14]
	.word	0xa4454013	! t0_kref+0x3388:   	addc	%l5, %l3, %l2
	.word	0xc568a044	! t0_kref+0x338c:   	prefetch	%g2 + 0x44, 2
	.word	0x99a0054c	! t0_kref+0x3390:   	fsqrtd	%f12, %f12
	.word	0x91250016	! t0_kref+0x3394:   	mulscc	%l4, %l6, %o0
	.word	0x951561cb	! t0_kref+0x3398:   	taddcctv	%l5, 0x1cb, %o2
	.word	0x99b30990	! t0_kref+0x339c:   	bshuffle	%f12, %f16, %f12
	.word	0x9ba389b0	! t0_kref+0x33a0:   	fdivs	%f14, %f16, %f13
	.word	0x9db38d10	! t0_kref+0x33a4:   	fandnot1	%f14, %f16, %f14
	.word	0xec2e001a	! t0_kref+0x33a8:   	stb	%l6, [%i0 + %i2]
	.word	0x9134c008	! t0_kref+0x33ac:   	srl	%l3, %o0, %o0
	.word	0x93b385cc	! t0_kref+0x33b0:   	fcmpeq32	%f14, %f12, %o1
	.word	0x36480007	! t0_kref+0x33b4:   	bge,a,pt	%icc, _kref+0x33d0
	.word	0x99b40e80	! t0_kref+0x33b8:   	fsrc1	%f16, %f12
	.word	0xea6e401a	! t0_kref+0x33bc:   	ldstub	[%i1 + %i2], %l5
	.word	0x99b00770	! t0_kref+0x33c0:   	fpack16	%f16, %f12
	.word	0xe1070019	! t0_kref+0x33c4:   	ld	[%i4 + %i1], %f16
	.word	0x9da00550	! t0_kref+0x33c8:   	fsqrtd	%f16, %f14
	.word	0xd248a024	! t0_kref+0x33cc:   	ldsb	[%g2 + 0x24], %o1
	.word	0x93b4c014	! t0_kref+0x33d0:   	edge8	%l3, %l4, %o1
	.word	0xddbe1000	! t0_kref+0x33d4:   	stda	%f14, [%i0]0x80
	.word	0xea2e3feb	! t0_kref+0x33d8:   	stb	%l5, [%i0 - 0x15]
	.word	0xa3a409b1	! t0_kref+0x33dc:   	fdivs	%f16, %f17, %f17
	.word	0x9da30950	! t0_kref+0x33e0:   	fmuld	%f12, %f16, %f14
	.word	0xac9d0017	! t0_kref+0x33e4:   	xorcc	%l4, %l7, %l6
	.word	0xac358017	! t0_kref+0x33e8:   	orn	%l6, %l7, %l6
	.word	0xa1a0054e	! t0_kref+0x33ec:   	fsqrtd	%f14, %f16
	.word	0x81dc7939	! t0_kref+0x33f0:   	flush	%l1 - 0x6c7
	.word	0xe62e401a	! t0_kref+0x33f4:   	stb	%l3, [%i1 + %i2]
	.word	0xc768a089	! t0_kref+0x33f8:   	prefetch	%g2 + 0x89, 3
	.word	0x965cb6a2	! t0_kref+0x33fc:   	smul	%l2, -0x95e, %o3
	.word	0xab34a00f	! t0_kref+0x3400:   	srl	%l2, 0xf, %l5
	.word	0x99a0052d	! t0_kref+0x3404:   	fsqrts	%f13, %f12
	.word	0x8143c000	! t0_kref+0x3408:   	stbar
	.word	0x2725947b	! t0_kref+0x340c:   	sethi	%hi(0x9651ec00), %l3
	.word	0xaabd629a	! t0_kref+0x3410:   	xnorcc	%l5, 0x29a, %l5
	.word	0x965a3e85	! t0_kref+0x3414:   	smul	%o0, -0x17b, %o3
	.word	0xafb5c356	! t0_kref+0x3418:   	alignaddrl	%l7, %l6, %l7
	.word	0xee0e6019	! t0_kref+0x341c:   	ldub	[%i1 + 0x19], %l7
	.word	0x26800004	! t0_kref+0x3420:   	bl,a	_kref+0x3430
	.word	0xdd3e2008	! t0_kref+0x3424:   	std	%f14, [%i0 + 8]
	.word	0x8143c000	! t0_kref+0x3428:   	stbar
	.word	0xe1871018	! t0_kref+0x342c:   	lda	[%i4 + %i0]0x80, %f16
	.word	0xa1a0052c	! t0_kref+0x3430:   	fsqrts	%f12, %f16
	.word	0x9fa018ce	! t0_kref+0x3434:   	fdtos	%f14, %f15
	.word	0x9fa01a50	! t0_kref+0x3438:   	fdtoi	%f16, %f15
	.word	0xa3a01a31	! t0_kref+0x343c:   	fstoi	%f17, %f17
	.word	0x963d8012	! t0_kref+0x3440:   	xnor	%l6, %l2, %o3
	.word	0x3c800004	! t0_kref+0x3444:   	bpos,a	_kref+0x3454
	.word	0xa1b00fe0	! t0_kref+0x3448:   	fones	%f16
	.word	0x9da3092d	! t0_kref+0x344c:   	fmuls	%f12, %f13, %f14
	.word	0x29800002	! t0_kref+0x3450:   	fbl,a	_kref+0x3458
	.word	0xa1a00550	! t0_kref+0x3454:   	fsqrtd	%f16, %f16
	.word	0x9da3c8b0	! t0_kref+0x3458:   	fsubs	%f15, %f16, %f14
	.word	0x30800005	! t0_kref+0x345c:   	ba,a	_kref+0x3470
	.word	0x99a0002d	! t0_kref+0x3460:   	fmovs	%f13, %f12
	.word	0xa1a40850	! t0_kref+0x3464:   	faddd	%f16, %f16, %f16
	.word	0x2e800003	! t0_kref+0x3468:   	bvs,a	_kref+0x3474
	.word	0x92b4c015	! t0_kref+0x346c:   	orncc	%l3, %l5, %o1
	.word	0x94ade802	! t0_kref+0x3470:   	andncc	%l7, 0x802, %o2
	.word	0xe3b8a040	! t0_kref+0x3474:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9684f363	! t0_kref+0x3478:   	addcc	%l3, -0xc9d, %o3
	.word	0xa3a3082d	! t0_kref+0x347c:   	fadds	%f12, %f13, %f17
	.word	0xa6256feb	! t0_kref+0x3480:   	sub	%l5, 0xfeb, %l3
	.word	0xe828a01b	! t0_kref+0x3484:   	stb	%l4, [%g2 + 0x1b]
	.word	0xa1b00cce	! t0_kref+0x3488:   	fnot2	%f14, %f16
	.word	0xdd981019	! t0_kref+0x348c:   	ldda	[%g0 + %i1]0x80, %f14
	.word	0xac8a2de2	! t0_kref+0x3490:   	andcc	%o0, 0xde2, %l6
	.word	0xd83e7ff8	! t0_kref+0x3494:   	std	%o4, [%i1 - 8]
	.word	0x97400000	! t0_kref+0x3498:   	mov	%y, %o3
	.word	0xe6680019	! t0_kref+0x349c:   	ldstub	[%g0 + %i1], %l3
	.word	0xe13f4019	! t0_kref+0x34a0:   	std	%f16, [%i5 + %i1]
	.word	0x9da0054e	! t0_kref+0x34a4:   	fsqrtd	%f14, %f14
	.word	0xaa8daddd	! t0_kref+0x34a8:   	andcc	%l6, 0xddd, %l5
	.word	0x13149039	! t0_kref+0x34ac:   	sethi	%hi(0x5240e400), %o1
	.word	0xc16e2018	! t0_kref+0x34b0:   	prefetch	%i0 + 0x18, 0
	.word	0xac9cefb9	! t0_kref+0x34b4:   	xorcc	%l3, 0xfb9, %l6
	.word	0xa684c008	! t0_kref+0x34b8:   	addcc	%l3, %o0, %l3
	.word	0x9da38850	! t0_kref+0x34bc:   	faddd	%f14, %f16, %f14
	.word	0x99a4094e	! t0_kref+0x34c0:   	fmuld	%f16, %f14, %f12
	.word	0x94653f25	! t0_kref+0x34c4:   	subc	%l4, -0xdb, %o2
	.word	0xa845fcd6	! t0_kref+0x34c8:   	addc	%l7, -0x32a, %l4
	.word	0xa3a349b1	! t0_kref+0x34cc:   	fdivs	%f13, %f17, %f17
	.word	0xa464f4a6	! t0_kref+0x34d0:   	subc	%l3, -0xb5a, %l2
	.word	0xd66e201d	! t0_kref+0x34d4:   	ldstub	[%i0 + 0x1d], %o3
	.word	0x99b38a4c	! t0_kref+0x34d8:   	fpadd32	%f14, %f12, %f12
	.word	0x27800007	! t0_kref+0x34dc:   	fbul,a	_kref+0x34f8
	.word	0xa465f77e	! t0_kref+0x34e0:   	subc	%l7, -0x882, %l2
	.word	0x99a00550	! t0_kref+0x34e4:   	fsqrtd	%f16, %f12
	.word	0xa1a4084e	! t0_kref+0x34e8:   	faddd	%f16, %f14, %f16
	.word	0x99a389cc	! t0_kref+0x34ec:   	fdivd	%f14, %f12, %f12
	.word	0xf007bfe0	! t0_kref+0x34f0:   	ld	[%fp - 0x20], %i0
	.word	0x32800003	! t0_kref+0x34f4:   	bne,a	_kref+0x3500
	.word	0x8184c000	! t0_kref+0x34f8:   	wr	%l3, %g0, %y
	.word	0xee08a002	! t0_kref+0x34fc:   	ldub	[%g2 + 2], %l7
	.word	0xd028a028	! t0_kref+0x3500:   	stb	%o0, [%g2 + 0x28]
	.word	0x2a800001	! t0_kref+0x3504:   	bcs,a	_kref+0x3508
	.word	0x9ba348af	! t0_kref+0x3508:   	fsubs	%f13, %f15, %f13
	.word	0x9da44831	! t0_kref+0x350c:   	fadds	%f17, %f17, %f14
	.word	0x9da0054e	! t0_kref+0x3510:   	fsqrtd	%f14, %f14
	.word	0xd9264000	! t0_kref+0x3514:   	st	%f12, [%i1]
	.word	0xeeb01019	! t0_kref+0x3518:   	stha	%l7, [%g0 + %i1]0x80
	.word	0x30480006	! t0_kref+0x351c:   	ba,a,pt	%icc, _kref+0x3534
	.word	0x927d2c3d	! t0_kref+0x3520:   	sdiv	%l4, 0xc3d, %o1
	.word	0xe826200c	! t0_kref+0x3524:   	st	%l4, [%i0 + 0xc]
	.word	0x9fa000ad	! t0_kref+0x3528:   	fnegs	%f13, %f15
	.word	0x22800005	! t0_kref+0x352c:   	be,a	_kref+0x3540
	.word	0xe856200a	! t0_kref+0x3530:   	ldsh	[%i0 + 0xa], %l4
	.word	0xafb5c168	! t0_kref+0x3534:   	edge32ln	%l7, %o0, %l7
	.word	0xa43d3dc4	! t0_kref+0x3538:   	xnor	%l4, -0x23c, %l2
	.word	0x9db30d0e	! t0_kref+0x353c:   	fandnot1	%f12, %f14, %f14
	.word	0xe01f4018	! t0_kref+0x3540:   	ldd	[%i5 + %i0], %l0
	.word	0x9fa0002e	! t0_kref+0x3544:   	fmovs	%f14, %f15
	.word	0x9ba00030	! t0_kref+0x3548:   	fmovs	%f16, %f13
	.word	0x99b34eed	! t0_kref+0x354c:   	fornot2s	%f13, %f13, %f12
	.word	0xac8de04c	! t0_kref+0x3550:   	andcc	%l7, 0x4c, %l6
	.word	0x8143c000	! t0_kref+0x3554:   	stbar
	.word	0x9de3bfa0	! t0_kref+0x3558:   	save	%sp, -0x60, %sp
	.word	0xafe80000	! t0_kref+0x355c:   	restore	%g0, %g0, %l7
	.word	0xa89db289	! t0_kref+0x3560:   	xorcc	%l6, -0xd77, %l4
	.word	0xedee501b	! t0_kref+0x3564:   	prefetcha	%i1 + %i3, 22
	.word	0xa4ade151	! t0_kref+0x3568:   	andncc	%l7, 0x151, %l2
	.word	0x9094e816	! t0_kref+0x356c:   	orcc	%l3, 0x816, %o0
	.word	0xac6223a2	! t0_kref+0x3570:   	subc	%o0, 0x3a2, %l6
	.word	0x9fa0002c	! t0_kref+0x3574:   	fmovs	%f12, %f15
	.word	0xe1ee501d	! t0_kref+0x3578:   	prefetcha	%i1 + %i5, 16
	.word	0x9db00cd0	! t0_kref+0x357c:   	fnot2	%f16, %f14
	.word	0x9bb30ef1	! t0_kref+0x3580:   	fornot2s	%f12, %f17, %f13
	.word	0xa4b5c013	! t0_kref+0x3584:   	orncc	%l7, %l3, %l2
	.word	0xab2a0012	! t0_kref+0x3588:   	sll	%o0, %l2, %l5
	.word	0x2e800007	! t0_kref+0x358c:   	bvs,a	_kref+0x35a8
	.word	0xe4400019	! t0_kref+0x3590:   	ldsw	[%g0 + %i1], %l2
	.word	0x9db38990	! t0_kref+0x3594:   	bshuffle	%f14, %f16, %f14
	.word	0x9da00550	! t0_kref+0x3598:   	fsqrtd	%f16, %f14
	.word	0x99a0012c	! t0_kref+0x359c:   	fabss	%f12, %f12
	call	SYM(t0_subr3)
	.word	0xaa5d30cd	! t0_kref+0x35a4:   	smul	%l4, -0xf33, %l5
	.word	0x9fc10000	! t0_kref+0x35a8:   	call	%g4
	.word	0x81daaaf9	! t0_kref+0x35ac:   	flush	%o2 + 0xaf9
	.word	0xd9be5a5b	! t0_kref+0x35b0:   	stda	%f12, [%i1 + %i3]0xd2
	.word	0xe11e2010	! t0_kref+0x35b4:   	ldd	[%i0 + 0x10], %f16
	.word	0xaa9dc015	! t0_kref+0x35b8:   	xorcc	%l7, %l5, %l5
	.word	0x99a30950	! t0_kref+0x35bc:   	fmuld	%f12, %f16, %f12
	.word	0xd208a027	! t0_kref+0x35c0:   	ldub	[%g2 + 0x27], %o1
	.word	0xee36600e	! t0_kref+0x35c4:   	sth	%l7, [%i1 + 0xe]
	.word	0x31800001	! t0_kref+0x35c8:   	fba,a	_kref+0x35cc
	.word	0xaf358013	! t0_kref+0x35cc:   	srl	%l6, %l3, %l7
	.word	0x99a3894e	! t0_kref+0x35d0:   	fmuld	%f14, %f14, %f12
	.word	0x952233a1	! t0_kref+0x35d4:   	mulscc	%o0, -0xc5f, %o2
	.word	0x92458017	! t0_kref+0x35d8:   	addc	%l6, %l7, %o1
	.word	0x99a018ce	! t0_kref+0x35dc:   	fdtos	%f14, %f12
	.word	0xedee101b	! t0_kref+0x35e0:   	prefetcha	%i0 + %i3, 22
	.word	0x81d932a5	! t0_kref+0x35e4:   	flush	%g4 - 0xd5b
	.word	0x85854008	! t0_kref+0x35e8:   	wr	%l5, %o0, %ccr
	.word	0x99b3098e	! t0_kref+0x35ec:   	bshuffle	%f12, %f14, %f12
	.word	0xa5400000	! t0_kref+0x35f0:   	mov	%y, %l2
	.word	0xa1a4084c	! t0_kref+0x35f4:   	faddd	%f16, %f12, %f16
	.word	0xa61232be	! t0_kref+0x35f8:   	or	%o0, -0xd42, %l3
	.word	0x9fa3c92f	! t0_kref+0x35fc:   	fmuls	%f15, %f15, %f15
	.word	0xa88c8016	! t0_kref+0x3600:   	andcc	%l2, %l6, %l4
	.word	0xeea6101c	! t0_kref+0x3604:   	sta	%l7, [%i0 + %i4]0x80
	.word	0x9da00530	! t0_kref+0x3608:   	fsqrts	%f16, %f14
	.word	0x25800003	! t0_kref+0x360c:   	fblg,a	_kref+0x3618
	.word	0xa1b30a0e	! t0_kref+0x3610:   	fpadd16	%f12, %f14, %f16
	.word	0xe430a01e	! t0_kref+0x3614:   	sth	%l2, [%g2 + 0x1e]
	.word	0x9fb3caef	! t0_kref+0x3618:   	fpsub32s	%f15, %f15, %f15
	.word	0xe3b8a040	! t0_kref+0x361c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x972c8017	! t0_kref+0x3620:   	sll	%l2, %l7, %o3
	.word	0xe76e401a	! t0_kref+0x3624:   	prefetch	%i1 + %i2, 19
	.word	0xeaa71019	! t0_kref+0x3628:   	sta	%l5, [%i4 + %i1]0x80
	.word	0xa1a00550	! t0_kref+0x362c:   	fsqrtd	%f16, %f16
	.word	0x878020e0	! t0_kref+0x3630:   	mov	0xe0, %asi
	.word	0x3c800008	! t0_kref+0x3634:   	bpos,a	_kref+0x3654
	.word	0xec463fe0	! t0_kref+0x3638:   	ldsw	[%i0 - 0x20], %l6
	.word	0xe1180018	! t0_kref+0x363c:   	ldd	[%g0 + %i0], %f16
	.word	0x81abcab0	! t0_kref+0x3640:   	fcmpes	%fcc0, %f15, %f16
	.word	0xa6b4c008	! t0_kref+0x3644:   	orncc	%l3, %o0, %l3
	.word	0xacd53f57	! t0_kref+0x3648:   	umulcc	%l4, -0xa9, %l6
	.word	0x9fa0002f	! t0_kref+0x364c:   	fmovs	%f15, %f15
	.word	0xd030a014	! t0_kref+0x3650:   	sth	%o0, [%g2 + 0x14]
	.word	0xe4ae9019	! t0_kref+0x3654:   	stba	%l2, [%i2 + %i1]0x80
	.word	0x90250008	! t0_kref+0x3658:   	sub	%l4, %o0, %o0
	.word	0x2c480008	! t0_kref+0x365c:   	bneg,a,pt	%icc, _kref+0x367c
	.word	0x9da01a4e	! t0_kref+0x3660:   	fdtoi	%f14, %f14
	.word	0xa8b50017	! t0_kref+0x3664:   	orncc	%l4, %l7, %l4
	.word	0xac7cff11	! t0_kref+0x3668:   	sdiv	%l3, -0xef, %l6
	.word	0x99a01931	! t0_kref+0x366c:   	fstod	%f17, %f12
	.word	0x90053f0e	! t0_kref+0x3670:   	add	%l4, -0xf2, %o0
	.word	0xd99e1a5d	! t0_kref+0x3674:   	ldda	[%i0 + %i5]0xd2, %f12
	.word	0x9ba0002f	! t0_kref+0x3678:   	fmovs	%f15, %f13
	.word	0xa465c015	! t0_kref+0x367c:   	subc	%l7, %l5, %l2
	.word	0x37800003	! t0_kref+0x3680:   	fbge,a	_kref+0x368c
	.word	0xa3a018ce	! t0_kref+0x3684:   	fdtos	%f14, %f17
	.word	0xee2e8018	! t0_kref+0x3688:   	stb	%l7, [%i2 + %i0]
	.word	0x90c4c017	! t0_kref+0x368c:   	addccc	%l3, %l7, %o0
	.word	0xd406001c	! t0_kref+0x3690:   	ld	[%i0 + %i4], %o2
	.word	0x9da00550	! t0_kref+0x3694:   	fsqrtd	%f16, %f14
	.word	0x81ac0acc	! t0_kref+0x3698:   	fcmped	%fcc0, %f16, %f12
	.word	0x93b3844c	! t0_kref+0x369c:   	fcmpne16	%f14, %f12, %o1
	.word	0x928d8017	! t0_kref+0x36a0:   	andcc	%l6, %l7, %o1
	.word	0x2f800007	! t0_kref+0x36a4:   	fbu,a	_kref+0x36c0
	.word	0x001fffff	! t0_kref+0x36a8:   	illtrap	0x1fffff
	.word	0xa5b50315	! t0_kref+0x36ac:   	alignaddr	%l4, %l5, %l2
	.word	0x9db38e4e	! t0_kref+0x36b0:   	fxnor	%f14, %f14, %f14
	.word	0xa1b30c8c	! t0_kref+0x36b4:   	fandnot2	%f12, %f12, %f16
	.word	0xa6748015	! t0_kref+0x36b8:   	udiv	%l2, %l5, %l3
	.word	0xa45da879	! t0_kref+0x36bc:   	smul	%l6, 0x879, %l2
	.word	0x3a480006	! t0_kref+0x36c0:   	bcc,a,pt	%icc, _kref+0x36d8
	.word	0xac258014	! t0_kref+0x36c4:   	sub	%l6, %l4, %l6
	.word	0x9fa449ac	! t0_kref+0x36c8:   	fdivs	%f17, %f12, %f15
	.word	0x2a800006	! t0_kref+0x36cc:   	bcs,a	_kref+0x36e4
	.word	0x9ba018cc	! t0_kref+0x36d0:   	fdtos	%f12, %f13
	call	SYM(t0_subr2)
	.word	0xa535200d	! t0_kref+0x36d8:   	srl	%l4, 0xd, %l2
	.word	0xec881018	! t0_kref+0x36dc:   	lduba	[%g0 + %i0]0x80, %l6
	.word	0xd9180018	! t0_kref+0x36e0:   	ldd	[%g0 + %i0], %f12
	.word	0xe66e0000	! t0_kref+0x36e4:   	ldstub	[%i0], %l3
	.word	0xac022f33	! t0_kref+0x36e8:   	add	%o0, 0xf33, %l6
	.word	0x9664ee4a	! t0_kref+0x36ec:   	subc	%l3, 0xe4a, %o3
	.word	0xa864ac41	! t0_kref+0x36f0:   	subc	%l2, 0xc41, %l4
	.word	0x99a4084e	! t0_kref+0x36f4:   	faddd	%f16, %f14, %f12
	.word	0xf96e2010	! t0_kref+0x36f8:   	prefetch	%i0 + 0x10, 28
	.word	0xec9e1000	! t0_kref+0x36fc:   	ldda	[%i0]0x80, %l6
	.word	0x95b3040c	! t0_kref+0x3700:   	fcmple16	%f12, %f12, %o2
	.word	0xa1b38f50	! t0_kref+0x3704:   	fornot1	%f14, %f16, %f16
	.word	0x93b404ce	! t0_kref+0x3708:   	fcmpne32	%f16, %f14, %o1
	.word	0xa6fdb4bc	! t0_kref+0x370c:   	sdivcc	%l6, -0xb44, %l3
	.word	0x8143c000	! t0_kref+0x3710:   	stbar
	.word	0xe168a082	! t0_kref+0x3714:   	prefetch	%g2 + 0x82, 16
	.word	0x9664ef89	! t0_kref+0x3718:   	subc	%l3, 0xf89, %o3
	.word	0x905a0017	! t0_kref+0x371c:   	smul	%o0, %l7, %o0
	.word	0xe56e3ff8	! t0_kref+0x3720:   	prefetch	%i0 - 8, 18
	.word	0x9fa01a2f	! t0_kref+0x3724:   	fstoi	%f15, %f15
	.word	0x9fa3882f	! t0_kref+0x3728:   	fadds	%f14, %f15, %f15
	.word	0xa4320014	! t0_kref+0x372c:   	orn	%o0, %l4, %l2
	.word	0x9de3bfa0	! t0_kref+0x3730:   	save	%sp, -0x60, %sp
	.word	0xb010330d	! t0_kref+0x3734:   	mov	0xfffff30d, %i0
	.word	0xa5ee6423	! t0_kref+0x3738:   	restore	%i1, 0x423, %l2
	.word	0xa3a409ae	! t0_kref+0x373c:   	fdivs	%f16, %f14, %f17
	.word	0x99b4074c	! t0_kref+0x3740:   	fpack32	%f16, %f12, %f12
	.word	0x9de3bfa0	! t0_kref+0x3744:   	save	%sp, -0x60, %sp
	.word	0x80966314	! t0_kref+0x3748:   	orcc	%i1, 0x314, %g0
	.word	0x93ee001c	! t0_kref+0x374c:   	restore	%i0, %i4, %o1
	.word	0xe8b6101b	! t0_kref+0x3750:   	stha	%l4, [%i0 + %i3]0x80
	.word	0xa3a0002c	! t0_kref+0x3754:   	fmovs	%f12, %f17
	.word	0xaa15c016	! t0_kref+0x3758:   	or	%l7, %l6, %l5
	.word	0xd93e4000	! t0_kref+0x375c:   	std	%f12, [%i1]
	.word	0x9db38ad0	! t0_kref+0x3760:   	fpsub32	%f14, %f16, %f14
	.word	0x2a800003	! t0_kref+0x3764:   	bcs,a	_kref+0x3770
	.word	0xa1a0052c	! t0_kref+0x3768:   	fsqrts	%f12, %f16
	.word	0xaa5d7740	! t0_kref+0x376c:   	smul	%l5, -0x8c0, %l5
	.word	0xa65de100	! t0_kref+0x3770:   	smul	%l7, 0x100, %l3
	.word	0x9fb30aaf	! t0_kref+0x3774:   	fpsub16s	%f12, %f15, %f15
	.word	0x3d800004	! t0_kref+0x3778:   	fbule,a	_kref+0x3788
	.word	0x9da0052e	! t0_kref+0x377c:   	fsqrts	%f14, %f14
	.word	0xd8070000	! t0_kref+0x3780:   	ld	[%i4], %o4
	.word	0xfbee501c	! t0_kref+0x3784:   	prefetcha	%i1 + %i4, 29
	.word	0x001fffff	! t0_kref+0x3788:   	illtrap	0x1fffff
	.word	0x2f367a6e	! t0_kref+0x378c:   	sethi	%hi(0xd9e9b800), %l7
	.word	0x9db40f8c	! t0_kref+0x3790:   	for	%f16, %f12, %f14
	.word	0xc168a008	! t0_kref+0x3794:   	prefetch	%g2 + 8, 0
	.word	0xaf400000	! t0_kref+0x3798:   	mov	%y, %l7
	.word	0x99b38a8c	! t0_kref+0x379c:   	fpsub16	%f14, %f12, %f12
	.word	0x3a800004	! t0_kref+0x37a0:   	bcc,a	_kref+0x37b0
	.word	0x903a0017	! t0_kref+0x37a4:   	xnor	%o0, %l7, %o0
	.word	0xe3b8a040	! t0_kref+0x37a8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9da0052f	! t0_kref+0x37ac:   	fsqrts	%f15, %f14
	.word	0xa1b38e4e	! t0_kref+0x37b0:   	fxnor	%f14, %f14, %f16
	.word	0xa1a388ac	! t0_kref+0x37b4:   	fsubs	%f14, %f12, %f16
	.word	0xe650a03e	! t0_kref+0x37b8:   	ldsh	[%g2 + 0x3e], %l3
	.word	0xe6262008	! t0_kref+0x37bc:   	st	%l3, [%i0 + 8]
	.word	0xa3b44ab0	! t0_kref+0x37c0:   	fpsub16s	%f17, %f16, %f17
	.word	0xa1b30750	! t0_kref+0x37c4:   	fpack32	%f12, %f16, %f16
	.word	0xaef50016	! t0_kref+0x37c8:   	udivcc	%l4, %l6, %l7
	.word	0xe3064000	! t0_kref+0x37cc:   	ld	[%i1], %f17
	.word	0xe19eda59	! t0_kref+0x37d0:   	ldda	[%i3 + %i1]0xd2, %f16
	.word	0xd028a035	! t0_kref+0x37d4:   	stb	%o0, [%g2 + 0x35]
	.word	0xae250016	! t0_kref+0x37d8:   	sub	%l4, %l6, %l7
	.word	0xa72d6001	! t0_kref+0x37dc:   	sll	%l5, 0x1, %l3
	.word	0xe3b8a040	! t0_kref+0x37e0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x31800007	! t0_kref+0x37e4:   	fba,a	_kref+0x3800
	.word	0xf4380019	! t0_kref+0x37e8:   	std	%i2, [%g0 + %i1]
	.word	0xe76e401b	! t0_kref+0x37ec:   	prefetch	%i1 + %i3, 19
	.word	0x3f800003	! t0_kref+0x37f0:   	fbo,a	_kref+0x37fc
	.word	0xa3b0076c	! t0_kref+0x37f4:   	fpack16	%f12, %f17
	.word	0x9da018ce	! t0_kref+0x37f8:   	fdtos	%f14, %f14
	.word	0x99a3094c	! t0_kref+0x37fc:   	fmuld	%f12, %f12, %f12
	.word	0xea68a01e	! t0_kref+0x3800:   	ldstub	[%g2 + 0x1e], %l5
	.word	0x9615b2df	! t0_kref+0x3804:   	or	%l6, -0xd21, %o3
	.word	0x9da0192f	! t0_kref+0x3808:   	fstod	%f15, %f14
	.word	0xae75bff0	! t0_kref+0x380c:   	udiv	%l6, -0x10, %l7
	.word	0x9ba01a30	! t0_kref+0x3810:   	fstoi	%f16, %f13
	.word	0xadb5c008	! t0_kref+0x3814:   	edge8	%l7, %o0, %l6
	.word	0xa1a0002d	! t0_kref+0x3818:   	fmovs	%f13, %f16
	.word	0x9da3094e	! t0_kref+0x381c:   	fmuld	%f12, %f14, %f14
	.word	0x90750017	! t0_kref+0x3820:   	udiv	%l4, %l7, %o0
	.word	0x90ad4015	! t0_kref+0x3824:   	andncc	%l5, %l5, %o0
	.word	0xfd19401d	! t0_kref+0x3828:   	ldd	[%g5 + %i5], %f30
	.word	0x9ba018ce	! t0_kref+0x382c:   	fdtos	%f14, %f13
	.word	0xac9db162	! t0_kref+0x3830:   	xorcc	%l6, -0xe9e, %l6
	.word	0x9db38ab1	! t0_kref+0x3834:   	fpsub16s	%f14, %f17, %f14
	.word	0x9fa0002f	! t0_kref+0x3838:   	fmovs	%f15, %f15
	.word	0x2f1cf226	! t0_kref+0x383c:   	sethi	%hi(0x73c89800), %l7
	.word	0x9fb007ac	! t0_kref+0x3840:   	fpackfix	%f12, %f15
	.word	0x94fa0008	! t0_kref+0x3844:   	sdivcc	%o0, %o0, %o2
	.word	0xf43e4000	! t0_kref+0x3848:   	std	%i2, [%i1]
	.word	0xdd1e2000	! t0_kref+0x384c:   	ldd	[%i0], %f14
	.word	0xa1a409ac	! t0_kref+0x3850:   	fdivs	%f16, %f12, %f16
	.word	0xa1a408d0	! t0_kref+0x3854:   	fsubd	%f16, %f16, %f16
	.word	0xa1b30a10	! t0_kref+0x3858:   	fpadd16	%f12, %f16, %f16
	.word	0x99b30fb1	! t0_kref+0x385c:   	fors	%f12, %f17, %f12
	.word	0x948cc012	! t0_kref+0x3860:   	andcc	%l3, %l2, %o2
	.word	0x99a389d0	! t0_kref+0x3864:   	fdivd	%f14, %f16, %f12
	.word	0x34480004	! t0_kref+0x3868:   	bg,a,pt	%icc, _kref+0x3878
	.word	0xe300a020	! t0_kref+0x386c:   	ld	[%g2 + 0x20], %f17
	.word	0x81d9700e	! t0_kref+0x3870:   	flush	%g5 - 0xff2
	.word	0x97700016	! t0_kref+0x3874:   	popc	%l6, %o3
	.word	0x99a3094c	! t0_kref+0x3878:   	fmuld	%f12, %f12, %f12
	.word	0x38480003	! t0_kref+0x387c:   	bgu,a,pt	%icc, _kref+0x3888
	.word	0x9fa3492d	! t0_kref+0x3880:   	fmuls	%f13, %f13, %f15
	.word	0x2b480003	! t0_kref+0x3884:   	fbug,a,pt	%fcc0, _kref+0x3890
	.word	0xd678a020	! t0_kref+0x3888:   	swap	[%g2 + 0x20], %o3
	.word	0xdd1e7ff8	! t0_kref+0x388c:   	ldd	[%i1 - 8], %f14
	.word	0xac5d7cbc	! t0_kref+0x3890:   	smul	%l5, -0x344, %l6
	.word	0xae7cf162	! t0_kref+0x3894:   	sdiv	%l3, -0xe9e, %l7
	.word	0x2d800007	! t0_kref+0x3898:   	fbg,a	_kref+0x38b4
	.word	0x9db38d0c	! t0_kref+0x389c:   	fandnot1	%f14, %f12, %f14
	.word	0xa1a000af	! t0_kref+0x38a0:   	fnegs	%f15, %f16
	.word	0xe168a04e	! t0_kref+0x38a4:   	prefetch	%g2 + 0x4e, 16
	.word	0xa1a408cc	! t0_kref+0x38a8:   	fsubd	%f16, %f12, %f16
	.word	0x9da0052e	! t0_kref+0x38ac:   	fsqrts	%f14, %f14
	.word	0xa822335f	! t0_kref+0x38b0:   	sub	%o0, -0xca1, %l4
	.word	0xaeb50012	! t0_kref+0x38b4:   	orncc	%l4, %l2, %l7
	.word	0x9db40671	! t0_kref+0x38b8:   	fmul8x16au	%f16, %f17, %f14
	.word	0xa1a01930	! t0_kref+0x38bc:   	fstod	%f16, %f16
	.word	0xa3aac02d	! t0_kref+0x38c0:   	fmovsge	%fcc0, %f13, %f17
	.word	0xea5e7fe0	! t0_kref+0x38c4:   	ldx	[%i1 - 0x20], %l5
	.word	0xab400000	! t0_kref+0x38c8:   	mov	%y, %l5
	.word	0x9db38a0e	! t0_kref+0x38cc:   	fpadd16	%f14, %f14, %f14
	.word	0xe820a020	! t0_kref+0x38d0:   	st	%l4, [%g2 + 0x20]
	.word	0xe3263fe0	! t0_kref+0x38d4:   	st	%f17, [%i0 - 0x20]
	.word	0xac5a3773	! t0_kref+0x38d8:   	smul	%o0, -0x88d, %l6
	.word	0x9fa0108c	! t0_kref+0x38dc:   	fxtos	%f12, %f15
	.word	0x3a800003	! t0_kref+0x38e0:   	bcc,a	_kref+0x38ec
	.word	0xeac61000	! t0_kref+0x38e4:   	ldswa	[%i0]0x80, %l5
	.word	0xe100a02c	! t0_kref+0x38e8:   	ld	[%g2 + 0x2c], %f16
	.word	0x90fcad79	! t0_kref+0x38ec:   	sdivcc	%l2, 0xd79, %o0
	.word	0x9fc00004	! t0_kref+0x38f0:   	call	%g0 + %g4
	.word	0x001fffff	! t0_kref+0x38f4:   	illtrap	0x1fffff
	.word	0xe6871040	! t0_kref+0x38f8:   	lda	[%i4]0x82, %l3
	.word	0x9db30990	! t0_kref+0x38fc:   	bshuffle	%f12, %f16, %f14
	.word	0xa40cb393	! t0_kref+0x3900:   	and	%l2, -0xc6d, %l2
	.word	0xd6680018	! t0_kref+0x3904:   	ldstub	[%g0 + %i0], %o3
	.word	0xa68debe8	! t0_kref+0x3908:   	andcc	%l7, 0xbe8, %l3
	.word	0xe42e6000	! t0_kref+0x390c:   	stb	%l2, [%i1]
	.word	0x943d4012	! t0_kref+0x3910:   	xnor	%l5, %l2, %o2
	.word	0x9da0002e	! t0_kref+0x3914:   	fmovs	%f14, %f14
	.word	0x34800003	! t0_kref+0x3918:   	bg,a	_kref+0x3924
	.word	0x9db3462c	! t0_kref+0x391c:   	fmul8x16	%f13, %f12, %f14
	.word	0x39480001	! t0_kref+0x3920:   	fbuge,a,pt	%fcc0, _kref+0x3924
	.word	0xeab6d019	! t0_kref+0x3924:   	stha	%l5, [%i3 + %i1]0x80
	.word	0x99a4084e	! t0_kref+0x3928:   	faddd	%f16, %f14, %f12
	.word	0x9de3bfa0	! t0_kref+0x392c:   	save	%sp, -0x60, %sp
	.word	0xb8e6ea61	! t0_kref+0x3930:   	subccc	%i3, 0xa61, %i4
	.word	0xafef2dca	! t0_kref+0x3934:   	restore	%i4, 0xdca, %l7
	.word	0x9de3bfa0	! t0_kref+0x3938:   	save	%sp, -0x60, %sp
	.word	0xafef401d	! t0_kref+0x393c:   	restore	%i5, %i5, %l7
	.word	0x97254014	! t0_kref+0x3940:   	mulscc	%l5, %l4, %o3
	.word	0x9144c000	! t0_kref+0x3944:   	mov	%gsr, %o0
	.word	0x9da00150	! t0_kref+0x3948:   	fabsd	%f16, %f14
	.word	0xe810a022	! t0_kref+0x394c:   	lduh	[%g2 + 0x22], %l4
	.word	0xe320a02c	! t0_kref+0x3950:   	st	%f17, [%g2 + 0x2c]
	.word	0xa465e84c	! t0_kref+0x3954:   	subc	%l7, 0x84c, %l2
	.word	0xa1a349af	! t0_kref+0x3958:   	fdivs	%f13, %f15, %f16
	.word	0xedee101c	! t0_kref+0x395c:   	prefetcha	%i0 + %i4, 22
	.word	0x94fdf86b	! t0_kref+0x3960:   	sdivcc	%l7, -0x795, %o2
	.word	0xa1b00cee	! t0_kref+0x3964:   	fnot2s	%f14, %f16
	.word	0x3f800007	! t0_kref+0x3968:   	fbo,a	_kref+0x3984
	.word	0xa842342c	! t0_kref+0x396c:   	addc	%o0, -0xbd4, %l4
	.word	0xf16e001a	! t0_kref+0x3970:   	prefetch	%i0 + %i2, 24
	.word	0xa1a9002f	! t0_kref+0x3974:   	fmovsl	%fcc0, %f15, %f16
	.word	0x2b800004	! t0_kref+0x3978:   	fbug,a	_kref+0x3988
	.word	0xe11fbfa0	! t0_kref+0x397c:   	ldd	[%fp - 0x60], %f16
	.word	0xe8080019	! t0_kref+0x3980:   	ldub	[%g0 + %i1], %l4
	.word	0x9224af3e	! t0_kref+0x3984:   	sub	%l2, 0xf3e, %o1
	.word	0x20800003	! t0_kref+0x3988:   	bn,a	_kref+0x3994
	.word	0x81deb5e0	! t0_kref+0x398c:   	flush	%i2 - 0xa20
	.word	0x2e800006	! t0_kref+0x3990:   	bvs,a	_kref+0x39a8
	.word	0xa50d8017	! t0_kref+0x3994:   	tsubcc	%l6, %l7, %l2
	.word	0x3a800002	! t0_kref+0x3998:   	bcc,a	_kref+0x39a0
	.word	0x9fa0052e	! t0_kref+0x399c:   	fsqrts	%f14, %f15
	.word	0x99b30630	! t0_kref+0x39a0:   	fmul8x16	%f12, %f16, %f12
	.word	0xe320a030	! t0_kref+0x39a4:   	st	%f17, [%g2 + 0x30]
	.word	0xdd20a03c	! t0_kref+0x39a8:   	st	%f14, [%g2 + 0x3c]
	.word	0xec2e7fe2	! t0_kref+0x39ac:   	stb	%l6, [%i1 - 0x1e]
	.word	0xaa65242a	! t0_kref+0x39b0:   	subc	%l4, 0x42a, %l5
	.word	0xaa8a35d8	! t0_kref+0x39b4:   	andcc	%o0, -0xa28, %l5
	.word	0xa1a3884e	! t0_kref+0x39b8:   	faddd	%f14, %f14, %f16
	.word	0x81de8019	! t0_kref+0x39bc:   	flush	%i2 + %i1
	.word	0x91b304d0	! t0_kref+0x39c0:   	fcmpne32	%f12, %f16, %o0
	.word	0x947d4013	! t0_kref+0x39c4:   	sdiv	%l5, %l3, %o2
	.word	0xa1b306b0	! t0_kref+0x39c8:   	fmul8x16al	%f12, %f16, %f16
	.word	0x9fc00004	! t0_kref+0x39cc:   	call	%g0 + %g4
	.word	0xa1a00030	! t0_kref+0x39d0:   	fmovs	%f16, %f16
	.word	0xe8462018	! t0_kref+0x39d4:   	ldsw	[%i0 + 0x18], %l4
	.word	0xa90d221c	! t0_kref+0x39d8:   	tsubcc	%l4, 0x21c, %l4
	.word	0x95b305ce	! t0_kref+0x39dc:   	fcmpeq32	%f12, %f14, %o2
	.word	0xe3b8a040	! t0_kref+0x39e0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd900a038	! t0_kref+0x39e4:   	ld	[%g2 + 0x38], %f12
	.word	0xea30a022	! t0_kref+0x39e8:   	sth	%l5, [%g2 + 0x22]
	.word	0xa71d3c1a	! t0_kref+0x39ec:   	tsubcctv	%l4, -0x3e6, %l3
	.word	0xe100a020	! t0_kref+0x39f0:   	ld	[%g2 + 0x20], %f16
	.word	0xd920a028	! t0_kref+0x39f4:   	st	%f12, [%g2 + 0x28]
	.word	0xa8652327	! t0_kref+0x39f8:   	subc	%l4, 0x327, %l4
	.word	0xa534a019	! t0_kref+0x39fc:   	srl	%l2, 0x19, %l2
	.word	0x99a01a30	! t0_kref+0x3a00:   	fstoi	%f16, %f12
	.word	0xd83f4019	! t0_kref+0x3a04:   	std	%o4, [%i5 + %i1]
	.word	0xa1b30f8e	! t0_kref+0x3a08:   	for	%f12, %f14, %f16
	.word	0x9fa30830	! t0_kref+0x3a0c:   	fadds	%f12, %f16, %f15
	.word	0x34800001	! t0_kref+0x3a10:   	bg,a	_kref+0x3a14
	.word	0xd67e401c	! t0_kref+0x3a14:   	swap	[%i1 + %i4], %o3
	.word	0xadb48116	! t0_kref+0x3a18:   	edge32	%l2, %l6, %l6
	.word	0x29800001	! t0_kref+0x3a1c:   	fbl,a	_kref+0x3a20
	.word	0xa4952e08	! t0_kref+0x3a20:   	orcc	%l4, 0xe08, %l2
	.word	0x929c8017	! t0_kref+0x3a24:   	xorcc	%l2, %l7, %o1
	.word	0xa1b40c90	! t0_kref+0x3a28:   	fandnot2	%f16, %f16, %f16
	.word	0x93400000	! t0_kref+0x3a2c:   	mov	%y, %o1
	.word	0xa1a349ad	! t0_kref+0x3a30:   	fdivs	%f13, %f13, %f16
	.word	0xeb68a08d	! t0_kref+0x3a34:   	prefetch	%g2 + 0x8d, 21
	.word	0x35800006	! t0_kref+0x3a38:   	fbue,a	_kref+0x3a50
	.word	0x9da0054e	! t0_kref+0x3a3c:   	fsqrtd	%f14, %f14
	.word	0xa63d0012	! t0_kref+0x3a40:   	xnor	%l4, %l2, %l3
	.word	0x99b38d0c	! t0_kref+0x3a44:   	fandnot1	%f14, %f12, %f12
	.word	0xd93e3ff0	! t0_kref+0x3a48:   	std	%f12, [%i0 - 0x10]
	.word	0x97b30590	! t0_kref+0x3a4c:   	fcmpgt32	%f12, %f16, %o3
	.word	0x9484c008	! t0_kref+0x3a50:   	addcc	%l3, %o0, %o2
	.word	0xd9be5848	! t0_kref+0x3a54:   	stda	%f12, [%i1 + %o0]0xc2
	.word	0x96bc8017	! t0_kref+0x3a58:   	xnorcc	%l2, %l7, %o3
	.word	0xdd270018	! t0_kref+0x3a5c:   	st	%f14, [%i4 + %i0]
	.word	0x9da0002f	! t0_kref+0x3a60:   	fmovs	%f15, %f14
	.word	0x928d4016	! t0_kref+0x3a64:   	andcc	%l5, %l6, %o1
	.word	0x9fa00530	! t0_kref+0x3a68:   	fsqrts	%f16, %f15
	.word	0xe62e0000	! t0_kref+0x3a6c:   	stb	%l3, [%i0]
	.word	0x81dde522	! t0_kref+0x3a70:   	flush	%l7 + 0x522
	.word	0x93b3848e	! t0_kref+0x3a74:   	fcmple32	%f14, %f14, %o1
	.word	0x9da40950	! t0_kref+0x3a78:   	fmuld	%f16, %f16, %f14
	.word	0xa1b3ce2f	! t0_kref+0x3a7c:   	fands	%f15, %f15, %f16
	.word	0xac858012	! t0_kref+0x3a80:   	addcc	%l6, %l2, %l6
	.word	0xa3a3492e	! t0_kref+0x3a84:   	fmuls	%f13, %f14, %f17
	.word	0x99a0054e	! t0_kref+0x3a88:   	fsqrtd	%f14, %f12
	.word	0x949cb2d0	! t0_kref+0x3a8c:   	xorcc	%l2, -0xd30, %o2
	.word	0x99b30dce	! t0_kref+0x3a90:   	fnand	%f12, %f14, %f12
	.word	0xdd1e001d	! t0_kref+0x3a94:   	ldd	[%i0 + %i5], %f14
	.word	0x9ba00030	! t0_kref+0x3a98:   	fmovs	%f16, %f13
	.word	0x903a0016	! t0_kref+0x3a9c:   	xnor	%o0, %l6, %o0
	.word	0xa824c014	! t0_kref+0x3aa0:   	sub	%l3, %l4, %l4
	.word	0x91b54173	! t0_kref+0x3aa4:   	edge32ln	%l5, %l3, %o0
	.word	0xa1a0054c	! t0_kref+0x3aa8:   	fsqrtd	%f12, %f16
	.word	0xa7400000	! t0_kref+0x3aac:   	mov	%y, %l3
	.word	0xe448a022	! t0_kref+0x3ab0:   	ldsb	[%g2 + 0x22], %l2
	.word	0xe11e0000	! t0_kref+0x3ab4:   	ldd	[%i0], %f16
	.word	0xa424eae4	! t0_kref+0x3ab8:   	sub	%l3, 0xae4, %l2
	.word	0x99a0110c	! t0_kref+0x3abc:   	fxtod	%f12, %f12
	.word	0xac9cc008	! t0_kref+0x3ac0:   	xorcc	%l3, %o0, %l6
	.word	0x8143c000	! t0_kref+0x3ac4:   	stbar
	.word	0xe628a015	! t0_kref+0x3ac8:   	stb	%l3, [%g2 + 0x15]
	.word	0xa1a0052d	! t0_kref+0x3acc:   	fsqrts	%f13, %f16
	.word	0x8143e040	! t0_kref+0x3ad0:   	membar	0x40
	.word	0x963ce4e8	! t0_kref+0x3ad4:   	xnor	%l3, 0x4e8, %o3
	.word	0x969d8016	! t0_kref+0x3ad8:   	xorcc	%l6, %l6, %o3
	.word	0x81ab0acc	! t0_kref+0x3adc:   	fcmped	%fcc0, %f12, %f12
	.word	0xc568a040	! t0_kref+0x3ae0:   	prefetch	%g2 + 0x40, 2
	.word	0x9da30831	! t0_kref+0x3ae4:   	fadds	%f12, %f17, %f14
	.word	0xa65d0016	! t0_kref+0x3ae8:   	smul	%l4, %l6, %l3
	.word	0xc768a088	! t0_kref+0x3aec:   	prefetch	%g2 + 0x88, 3
	.word	0xd4981019	! t0_kref+0x3af0:   	ldda	[%g0 + %i1]0x80, %o2
	.word	0x91b20012	! t0_kref+0x3af4:   	edge8	%o0, %l2, %o0
	.word	0xdf00a008	! t0_kref+0x3af8:   	ld	[%g2 + 8], %f15
	.word	0xd9801019	! t0_kref+0x3afc:   	lda	[%g0 + %i1]0x80, %f12
	.word	0xa684e684	! t0_kref+0x3b00:   	addcc	%l3, 0x684, %l3
	.word	0x9675c015	! t0_kref+0x3b04:   	udiv	%l7, %l5, %o3
	.word	0xa665c017	! t0_kref+0x3b08:   	subc	%l7, %l7, %l3
	.word	0xfbee101b	! t0_kref+0x3b0c:   	prefetcha	%i0 + %i3, 29
	.word	0x905dc012	! t0_kref+0x3b10:   	smul	%l7, %l2, %o0
	.word	0x9ba3892d	! t0_kref+0x3b14:   	fmuls	%f14, %f13, %f13
	.word	0x36800005	! t0_kref+0x3b18:   	bge,a	_kref+0x3b2c
	.word	0xd9063ff0	! t0_kref+0x3b1c:   	ld	[%i0 - 0x10], %f12
	.word	0xd0680018	! t0_kref+0x3b20:   	ldstub	[%g0 + %i0], %o0
	.word	0x9da4084e	! t0_kref+0x3b24:   	faddd	%f16, %f14, %f14
	.word	0x3e800007	! t0_kref+0x3b28:   	bvc,a	_kref+0x3b44
	.word	0x99b44aaf	! t0_kref+0x3b2c:   	fpsub16s	%f17, %f15, %f12
	.word	0xd028a01b	! t0_kref+0x3b30:   	stb	%o0, [%g2 + 0x1b]
	.word	0x97048016	! t0_kref+0x3b34:   	taddcc	%l2, %l6, %o3
	.word	0x35800005	! t0_kref+0x3b38:   	fbue,a	_kref+0x3b4c
	.word	0xe306201c	! t0_kref+0x3b3c:   	ld	[%i0 + 0x1c], %f17
	.word	0xd02e2019	! t0_kref+0x3b40:   	stb	%o0, [%i0 + 0x19]
	.word	0xacc4e197	! t0_kref+0x3b44:   	addccc	%l3, 0x197, %l6
	.word	0xd20e2016	! t0_kref+0x3b48:   	ldub	[%i0 + 0x16], %o1
	.word	0xe826001c	! t0_kref+0x3b4c:   	st	%l4, [%i0 + %i4]
	.word	0x97b5c176	! t0_kref+0x3b50:   	edge32ln	%l7, %l6, %o3
	.word	0xa1a308d0	! t0_kref+0x3b54:   	fsubd	%f12, %f16, %f16
	.word	0xadb5c136	! t0_kref+0x3b58:   	edge32n	%l7, %l6, %l6
	.word	0xe630a036	! t0_kref+0x3b5c:   	sth	%l3, [%g2 + 0x36]
	.word	0x81ab0a4c	! t0_kref+0x3b60:   	fcmpd	%fcc0, %f12, %f12
	.word	0xa3b38e31	! t0_kref+0x3b64:   	fands	%f14, %f17, %f17
	.word	0xa8f5c014	! t0_kref+0x3b68:   	udivcc	%l7, %l4, %l4
	.word	0xa3b3caf1	! t0_kref+0x3b6c:   	fpsub32s	%f15, %f17, %f17
	.word	0xaf34a019	! t0_kref+0x3b70:   	srl	%l2, 0x19, %l7
	.word	0xa925c013	! t0_kref+0x3b74:   	mulscc	%l7, %l3, %l4
	.word	0xa1a000ad	! t0_kref+0x3b78:   	fnegs	%f13, %f16
	.word	0xacb5b13d	! t0_kref+0x3b7c:   	orncc	%l6, -0xec3, %l6
	.word	0x2c800003	! t0_kref+0x3b80:   	bneg,a	_kref+0x3b8c
	.word	0x9ba408b0	! t0_kref+0x3b84:   	fsubs	%f16, %f16, %f13
	.word	0x36480006	! t0_kref+0x3b88:   	bge,a,pt	%icc, _kref+0x3ba0
	.word	0x81dc6ae0	! t0_kref+0x3b8c:   	flush	%l1 + 0xae0
	.word	0xd28e9018	! t0_kref+0x3b90:   	lduba	[%i2 + %i0]0x80, %o1
	.word	0x3f800002	! t0_kref+0x3b94:   	fbo,a	_kref+0x3b9c
	.word	0xa1b38f8c	! t0_kref+0x3b98:   	for	%f14, %f12, %f16
	.word	0xa1a0052f	! t0_kref+0x3b9c:   	fsqrts	%f15, %f16
	.word	0x99a3094e	! t0_kref+0x3ba0:   	fmuld	%f12, %f14, %f12
	.word	0xe1070018	! t0_kref+0x3ba4:   	ld	[%i4 + %i0], %f16
	.word	0xf8380019	! t0_kref+0x3ba8:   	std	%i4, [%g0 + %i1]
	.word	0xac65a81c	! t0_kref+0x3bac:   	subc	%l6, 0x81c, %l6
	.word	0xa1a0052c	! t0_kref+0x3bb0:   	fsqrts	%f12, %f16
	.word	0x96aa0014	! t0_kref+0x3bb4:   	andncc	%o0, %l4, %o3
	.word	0x9da018cc	! t0_kref+0x3bb8:   	fdtos	%f12, %f14
	.word	0x99a388cc	! t0_kref+0x3bbc:   	fsubd	%f14, %f12, %f12
	.word	0x2a800003	! t0_kref+0x3bc0:   	bcs,a	_kref+0x3bcc
	.word	0xa4f5b5d4	! t0_kref+0x3bc4:   	udivcc	%l6, -0xa2c, %l2
	.word	0xec30a008	! t0_kref+0x3bc8:   	sth	%l6, [%g2 + 8]
	.word	0xae8d6e63	! t0_kref+0x3bcc:   	andcc	%l5, 0xe63, %l7
	.word	0xeb68a089	! t0_kref+0x3bd0:   	prefetch	%g2 + 0x89, 21
	.word	0xdf060000	! t0_kref+0x3bd4:   	ld	[%i0], %f15
	.word	0x9db3074e	! t0_kref+0x3bd8:   	fpack32	%f12, %f14, %f14
	.word	0xea2e401a	! t0_kref+0x3bdc:   	stb	%l5, [%i1 + %i2]
	.word	0xe4463fe0	! t0_kref+0x3be0:   	ldsw	[%i0 - 0x20], %l2
	.word	0xac95b0c2	! t0_kref+0x3be4:   	orcc	%l6, -0xf3e, %l6
	.word	0xea30a000	! t0_kref+0x3be8:   	sth	%l5, [%g2]
	.word	0xe16e6000	! t0_kref+0x3bec:   	prefetch	%i1, 16
	.word	0xc1ee1014	! t0_kref+0x3bf0:   	prefetcha	%i0 + %l4, 0
	.word	0xa3b3ca30	! t0_kref+0x3bf4:   	fpadd16s	%f15, %f16, %f17
	.word	0x9da00550	! t0_kref+0x3bf8:   	fsqrtd	%f16, %f14
	.word	0xc7ee5014	! t0_kref+0x3bfc:   	prefetcha	%i1 + %l4, 3
	.word	0xa3a389ae	! t0_kref+0x3c00:   	fdivs	%f14, %f14, %f17
	.word	0x9de3bfa0	! t0_kref+0x3c04:   	save	%sp, -0x60, %sp
	.word	0x80a6c01c	! t0_kref+0x3c08:   	cmp	%i3, %i4
	.word	0xa7ee401d	! t0_kref+0x3c0c:   	restore	%i1, %i5, %l3
	.word	0xaf400000	! t0_kref+0x3c10:   	mov	%y, %l7
	.word	0xa1a38850	! t0_kref+0x3c14:   	faddd	%f14, %f16, %f16
	.word	0xab2a2010	! t0_kref+0x3c18:   	sll	%o0, 0x10, %l5
	.word	0xa1b3062e	! t0_kref+0x3c1c:   	fmul8x16	%f12, %f14, %f16
	.word	0x9274f781	! t0_kref+0x3c20:   	udiv	%l3, -0x87f, %o1
	.word	0xaef5c013	! t0_kref+0x3c24:   	udivcc	%l7, %l3, %l7
	.word	0xe120a020	! t0_kref+0x3c28:   	st	%f16, [%g2 + 0x20]
	.word	0x8143c000	! t0_kref+0x3c2c:   	stbar
	.word	0x27480005	! t0_kref+0x3c30:   	fbul,a,pt	%fcc0, _kref+0x3c44
	.word	0xe120a014	! t0_kref+0x3c34:   	st	%f16, [%g2 + 0x14]
	.word	0xa4acfd00	! t0_kref+0x3c38:   	andncc	%l3, -0x300, %l2
	.word	0xa1b40c8c	! t0_kref+0x3c3c:   	fandnot2	%f16, %f12, %f16
	.word	0x81ab0ace	! t0_kref+0x3c40:   	fcmped	%fcc0, %f12, %f14
	.word	0x20480006	! t0_kref+0x3c44:   	bn,a,pt	%icc, _kref+0x3c5c
	.word	0x9674ffeb	! t0_kref+0x3c48:   	udiv	%l3, -0x15, %o3
	.word	0xa1a38850	! t0_kref+0x3c4c:   	faddd	%f14, %f16, %f16
	.word	0x94158016	! t0_kref+0x3c50:   	or	%l6, %l6, %o2
	.word	0xe48e501a	! t0_kref+0x3c54:   	lduba	[%i1 + %i2]0x80, %l2
	.word	0xa8320008	! t0_kref+0x3c58:   	orn	%o0, %o0, %l4
	.word	0xd91e3ff8	! t0_kref+0x3c5c:   	ldd	[%i0 - 8], %f12
	.word	0x99a018ce	! t0_kref+0x3c60:   	fdtos	%f14, %f12
	.word	0x81db394f	! t0_kref+0x3c64:   	flush	%o4 - 0x6b1
	.word	0x3a800006	! t0_kref+0x3c68:   	bcc,a	_kref+0x3c80
	.word	0x94d52241	! t0_kref+0x3c6c:   	umulcc	%l4, 0x241, %o2
	.word	0xec6e401a	! t0_kref+0x3c70:   	ldstub	[%i1 + %i2], %l6
	.word	0xa1a38850	! t0_kref+0x3c74:   	faddd	%f14, %f16, %f16
	.word	0xd0300018	! t0_kref+0x3c78:   	sth	%o0, [%g0 + %i0]
	.word	0x908c8014	! t0_kref+0x3c7c:   	andcc	%l2, %l4, %o0
	.word	0x99a4084e	! t0_kref+0x3c80:   	faddd	%f16, %f14, %f12
	.word	0xdb20a038	! t0_kref+0x3c84:   	st	%f13, [%g2 + 0x38]
	.word	0x22800007	! t0_kref+0x3c88:   	be,a	_kref+0x3ca4
	.word	0xaa920012	! t0_kref+0x3c8c:   	orcc	%o0, %l2, %l5
	.word	0x94750014	! t0_kref+0x3c90:   	udiv	%l4, %l4, %o2
	.word	0xe8c6101c	! t0_kref+0x3c94:   	ldswa	[%i0 + %i4]0x80, %l4
	.word	0x81abcab1	! t0_kref+0x3c98:   	fcmpes	%fcc0, %f15, %f17
	.word	0xa9b48052	! t0_kref+0x3c9c:   	edge8l	%l2, %l2, %l4
	.word	0x9da0054c	! t0_kref+0x3ca0:   	fsqrtd	%f12, %f14
	.word	0x9bb38a70	! t0_kref+0x3ca4:   	fpadd32s	%f14, %f16, %f13
	.word	0x9de3bfa0	! t0_kref+0x3ca8:   	save	%sp, -0x60, %sp
	.word	0xabef401a	! t0_kref+0x3cac:   	restore	%i5, %i2, %l5
	.word	0x81b01025	! t0_kref+0x3cb0:   	siam	0x5
	.word	0xf76e401a	! t0_kref+0x3cb4:   	prefetch	%i1 + %i2, 27
	.word	0x8143c000	! t0_kref+0x3cb8:   	stbar
	.word	0x9da000af	! t0_kref+0x3cbc:   	fnegs	%f15, %f14
	.word	0x30480002	! t0_kref+0x3cc0:   	ba,a,pt	%icc, _kref+0x3cc8
	.word	0x9db30dce	! t0_kref+0x3cc4:   	fnand	%f12, %f14, %f14
	.word	0xe13e7ff8	! t0_kref+0x3cc8:   	std	%f16, [%i1 - 8]
	.word	0xa6154014	! t0_kref+0x3ccc:   	or	%l5, %l4, %l3
	.word	0xa1b406ac	! t0_kref+0x3cd0:   	fmul8x16al	%f16, %f12, %f16
	.word	0xd2de1000	! t0_kref+0x3cd4:   	ldxa	[%i0]0x80, %o1
	.word	0x9da01a50	! t0_kref+0x3cd8:   	fdtoi	%f16, %f14
	.word	0xe3b8a080	! t0_kref+0x3cdc:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xaeb20015	! t0_kref+0x3ce0:   	orncc	%o0, %l5, %l7
	.word	0x81ab0aae	! t0_kref+0x3ce4:   	fcmpes	%fcc0, %f12, %f14
	.word	0xd400a024	! t0_kref+0x3ce8:   	ld	[%g2 + 0x24], %o2
	.word	0xe3b8a080	! t0_kref+0x3cec:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x24800005	! t0_kref+0x3cf0:   	ble,a	_kref+0x3d04
	.word	0x9db40f4e	! t0_kref+0x3cf4:   	fornot1	%f16, %f14, %f14
	.word	0x30480007	! t0_kref+0x3cf8:   	ba,a,pt	%icc, _kref+0x3d14
	.word	0xea2e8018	! t0_kref+0x3cfc:   	stb	%l5, [%i2 + %i0]
	.word	0xd020a018	! t0_kref+0x3d00:   	st	%o0, [%g2 + 0x18]
	.word	0x9da3894e	! t0_kref+0x3d04:   	fmuld	%f14, %f14, %f14
	.word	0x2b800005	! t0_kref+0x3d08:   	fbug,a	_kref+0x3d1c
	.word	0xe1264000	! t0_kref+0x3d0c:   	st	%f16, [%i1]
	.word	0xaad50017	! t0_kref+0x3d10:   	umulcc	%l4, %l7, %l5
	.word	0x9da00150	! t0_kref+0x3d14:   	fabsd	%f16, %f14
	.word	0xe6c65000	! t0_kref+0x3d18:   	ldswa	[%i1]0x80, %l3
	.word	0xc56e4017	! t0_kref+0x3d1c:   	prefetch	%i1 + %l7, 2
	.word	0xaa9d0012	! t0_kref+0x3d20:   	xorcc	%l4, %l2, %l5
	.word	0x9625c017	! t0_kref+0x3d24:   	sub	%l7, %l7, %o3
	.word	0x9ba0052c	! t0_kref+0x3d28:   	fsqrts	%f12, %f13
	.word	0xec267ff4	! t0_kref+0x3d2c:   	st	%l6, [%i1 - 0xc]
	.word	0xa1b3c62e	! t0_kref+0x3d30:   	fmul8x16	%f15, %f14, %f16
	.word	0x9fa0052f	! t0_kref+0x3d34:   	fsqrts	%f15, %f15
	.word	0xe630a01a	! t0_kref+0x3d38:   	sth	%l3, [%g2 + 0x1a]
	.word	0xdd1e6010	! t0_kref+0x3d3c:   	ldd	[%i1 + 0x10], %f14
	.word	0x99a000b0	! t0_kref+0x3d40:   	fnegs	%f16, %f12
	.word	0x8143e05c	! t0_kref+0x3d44:   	membar	0x5c
	.word	0xec30a006	! t0_kref+0x3d48:   	sth	%l6, [%g2 + 6]
	.word	0xe630a000	! t0_kref+0x3d4c:   	sth	%l3, [%g2]
	.word	0xa1a309d0	! t0_kref+0x3d50:   	fdivd	%f12, %f16, %f16
	.word	0x81ab0acc	! t0_kref+0x3d54:   	fcmped	%fcc0, %f12, %f12
	.word	0x99a01a4c	! t0_kref+0x3d58:   	fdtoi	%f12, %f12
	.word	0x99a389cc	! t0_kref+0x3d5c:   	fdivd	%f14, %f12, %f12
	.word	0x26800007	! t0_kref+0x3d60:   	bl,a	_kref+0x3d7c
	.word	0x99a0052f	! t0_kref+0x3d64:   	fsqrts	%f15, %f12
	.word	0xa1b40ace	! t0_kref+0x3d68:   	fpsub32	%f16, %f14, %f16
	.word	0x9da00550	! t0_kref+0x3d6c:   	fsqrtd	%f16, %f14
	.word	0xa45cb93d	! t0_kref+0x3d70:   	smul	%l2, -0x6c3, %l2
	.word	0x99b40acc	! t0_kref+0x3d74:   	fpsub32	%f16, %f12, %f12
	.word	0xa875ec13	! t0_kref+0x3d78:   	udiv	%l7, 0xc13, %l4
	.word	0xf83e7ff8	! t0_kref+0x3d7c:   	std	%i4, [%i1 - 8]
	.word	0xd9beda58	! t0_kref+0x3d80:   	stda	%f12, [%i3 + %i0]0xd2
	.word	0xdda6101c	! t0_kref+0x3d84:   	sta	%f14, [%i0 + %i4]0x80
	.word	0xa1a409d0	! t0_kref+0x3d88:   	fdivd	%f16, %f16, %f16
	.word	0xd2580019	! t0_kref+0x3d8c:   	ldx	[%g0 + %i1], %o1
	.word	0x945a3a9d	! t0_kref+0x3d90:   	smul	%o0, -0x563, %o2
	.word	0x96fc8014	! t0_kref+0x3d94:   	sdivcc	%l2, %l4, %o3
	.word	0x35800007	! t0_kref+0x3d98:   	fbue,a	_kref+0x3db4
	.word	0x9444f22a	! t0_kref+0x3d9c:   	addc	%l3, -0xdd6, %o2
	.word	0x96b4a632	! t0_kref+0x3da0:   	orncc	%l2, 0x632, %o3
	.word	0xaabd8012	! t0_kref+0x3da4:   	xnorcc	%l6, %l2, %l5
	.word	0x9da0052d	! t0_kref+0x3da8:   	fsqrts	%f13, %f14
	.word	0x34480004	! t0_kref+0x3dac:   	bg,a,pt	%icc, _kref+0x3dbc
	.word	0x965d4016	! t0_kref+0x3db0:   	smul	%l5, %l6, %o3
	.word	0xa1a0054c	! t0_kref+0x3db4:   	fsqrtd	%f12, %f16
	.word	0x92654013	! t0_kref+0x3db8:   	subc	%l5, %l3, %o1
	call	SYM(t0_subr2)
	.word	0x91b54332	! t0_kref+0x3dc0:   	bmask	%l5, %l2, %o0
	.word	0xa1b007ac	! t0_kref+0x3dc4:   	fpackfix	%f12, %f16
	.word	0xdd871019	! t0_kref+0x3dc8:   	lda	[%i4 + %i1]0x80, %f14
	.word	0x99a3084e	! t0_kref+0x3dcc:   	faddd	%f12, %f14, %f12
	.word	0xf43e0000	! t0_kref+0x3dd0:   	std	%i2, [%i0]
	.word	0xe320a018	! t0_kref+0x3dd4:   	st	%f17, [%g2 + 0x18]
	.word	0xd9066008	! t0_kref+0x3dd8:   	ld	[%i1 + 8], %f12
	.word	0xab2d8008	! t0_kref+0x3ddc:   	sll	%l6, %o0, %l5
	.word	0x9fa0108e	! t0_kref+0x3de0:   	fxtos	%f14, %f15
	.word	0x26480001	! t0_kref+0x3de4:   	bl,a,pt	%icc, _kref+0x3de8
	.word	0xd6861000	! t0_kref+0x3de8:   	lda	[%i0]0x80, %o3
	.word	0xab700014	! t0_kref+0x3dec:   	popc	%l4, %l5
	.word	0xebee501c	! t0_kref+0x3df0:   	prefetcha	%i1 + %i4, 21
	.word	0x3c480006	! t0_kref+0x3df4:   	bpos,a,pt	%icc, _kref+0x3e0c
	.word	0xa6153f88	! t0_kref+0x3df8:   	or	%l4, -0x78, %l3
	.word	0x9224eb83	! t0_kref+0x3dfc:   	sub	%l3, 0xb83, %o1
	.word	0xacfc8012	! t0_kref+0x3e00:   	sdivcc	%l2, %l2, %l6
	.word	0xa1b40d40	! t0_kref+0x3e04:   	fnot1	%f16, %f16
	.word	0x3f800006	! t0_kref+0x3e08:   	fbo,a	_kref+0x3e20
	.word	0xd91e0000	! t0_kref+0x3e0c:   	ldd	[%i0], %f12
	.word	0xe2680019	! t0_kref+0x3e10:   	ldstub	[%g0 + %i1], %l1
	.word	0xaa24f8f1	! t0_kref+0x3e14:   	sub	%l3, -0x70f, %l5
	.word	0xa4854016	! t0_kref+0x3e18:   	addcc	%l5, %l6, %l2
	.word	0xae148016	! t0_kref+0x3e1c:   	or	%l2, %l6, %l7
	.word	0xd9380019	! t0_kref+0x3e20:   	std	%f12, [%g0 + %i1]
	.word	0xab400000	! t0_kref+0x3e24:   	mov	%y, %l5
	.word	0xa1a3884e	! t0_kref+0x3e28:   	faddd	%f14, %f14, %f16
	.word	0xa1a0054e	! t0_kref+0x3e2c:   	fsqrtd	%f14, %f16
	.word	0x8143e05c	! t0_kref+0x3e30:   	membar	0x5c
	.word	0xe13e0000	! t0_kref+0x3e34:   	std	%f16, [%i0]
	.word	0x99a3884e	! t0_kref+0x3e38:   	faddd	%f14, %f14, %f12
	.word	0x9bb40cad	! t0_kref+0x3e3c:   	fandnot2s	%f16, %f13, %f13
	call	1f
	.empty
	.word	0xa1a349af	! t0_kref+0x3e44:   	fdivs	%f13, %f15, %f16
	.word	0xa49a0017	! t0_kref+0x3e48:   	xorcc	%o0, %l7, %l2
1:	.word	0xec270018	! t0_kref+0x3e4c:   	st	%l6, [%i4 + %i0]
	.word	0xabb58072	! t0_kref+0x3e50:   	edge8ln	%l6, %l2, %l5
	.word	0x99b4074e	! t0_kref+0x3e54:   	fpack32	%f16, %f14, %f12
	.word	0xa4f58013	! t0_kref+0x3e58:   	udivcc	%l6, %l3, %l2
	.word	0xe120a020	! t0_kref+0x3e5c:   	st	%f16, [%g2 + 0x20]
	.word	0xdd3e401d	! t0_kref+0x3e60:   	std	%f14, [%i1 + %i5]
	.word	0x9db34caf	! t0_kref+0x3e64:   	fandnot2s	%f13, %f15, %f14
	.word	0x9db30f8c	! t0_kref+0x3e68:   	for	%f12, %f12, %f14
	.word	0xac5dc016	! t0_kref+0x3e6c:   	smul	%l7, %l6, %l6
	.word	0xe3064000	! t0_kref+0x3e70:   	ld	[%i1], %f17
	.word	0x92658017	! t0_kref+0x3e74:   	subc	%l6, %l7, %o1
	.word	0x9bb40d60	! t0_kref+0x3e78:   	fnot1s	%f16, %f13
	.word	0xe4467fe0	! t0_kref+0x3e7c:   	ldsw	[%i1 - 0x20], %l2
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x3e84:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x53362000)
.seg "text"
t0_subr0_page_begin:
	.skip 8184
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x52cca000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x5091a000)
.seg "text"
t0_subr2_page_begin:
	.skip 8188
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x53434000)
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
!  Total operations: 3928  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.12   0.15
!  ldub              0.24   0.20
!  ldsh              0.29   0.15
!  lduh              0.01   0.00
!  ld                0.24   0.08
!  ldd               0.21   0.25
!  swap              0.28   0.20
!  ldstub            0.69   0.99
!  stb               1.25   1.20
!  sth               0.39   0.51
!  st                0.83   1.12
!  std               1.19   1.12
!  add               0.79   0.89
!  addcc             0.53   0.71
!  addx              0.61   0.71
!  addxcc            0.22   0.20
!  taddcc            0.26   0.31
!  taddcctv          0.10   0.10
!  sub               0.70   0.89
!  subcc             0.30   0.10
!  subx              1.40   1.53
!  subxcc            0.15   0.08
!  tsubcc            0.14   0.05
!  tsubcctv          0.19   0.20
!  mulscc            0.32   0.13
!  and               0.38   0.48
!  andcc             1.43   1.55
!  andn              0.02   0.00
!  andncc            0.71   0.76
!  or                0.41   0.48
!  orcc              0.76   0.43
!  orn               0.55   0.53
!  orncc             1.07   0.92
!  xor               0.37   0.46
!  xorcc             1.38   1.40
!  xnor              1.42   1.43
!  xnorcc            0.28   0.25
!  sll               0.85   0.92
!  srl               0.84   0.94
!  sra               0.12   0.08
!  unimp             0.16   0.28
!  umul              0.40   0.23
!  smul              1.38   1.71
!  udiv              0.59   0.71
!  sdiv              0.41   0.51
!  umulcc            0.54   0.36
!  smulcc            0.06   0.05
!  udivcc            0.93   0.92
!  sdivcc            1.26   1.37
!  rdy               1.04   1.25
!  wry               0.07   0.13
!  bicc              3.18   3.21
!  sethi             0.76   0.87
!  jmpl              0.38   0.36
!  call              0.23   0.23
!  ticc              0.00   0.00
!  flush             0.80   1.02
!  save              1.29   1.02
!  restore           1.37   0.00
!  stbar             0.55   0.84
!  ldf               1.32   1.32
!  lddf              1.02   1.02
!  stf               0.50   0.36
!  stdf              1.29   1.30
!  fadds             0.75   0.92
!  fsubs             1.18   1.35
!  fmuls             0.98   0.81
!  fdivs             1.06   1.02
!  faddd             1.24   1.65
!  fsubd             0.96   0.99
!  fmuld             1.33   1.35
!  fdivd             1.15   1.09
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.01   0.00
!  fdmulq            0.00   0.00
!  fitos             0.04   0.03
!  fitod             0.13   0.08
!  fitoq             0.00   0.00
!  fstoi             0.31   0.33
!  fstod             0.39   0.38
!  fstoq             0.00   0.00
!  fdtoi             0.67   0.71
!  fdtos             1.29   1.35
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.21   1.32
!  fnegs             0.65   0.56
!  fabss             0.68   0.66
!  fsqrts            2.63   2.85
!  fsqrtd            2.49   2.93
!  fsqrtq            0.00   0.00
!  fcmps             0.07   0.00
!  fcmpd             0.14   0.23
!  fcmpq             0.00   0.00
!  fcmpes            0.81   0.99
!  fcmped            0.68   0.48
!  fcmpeq            0.00   0.00
!  fbfcc             3.46   3.08
!  ldfsr             0.08   0.00
!  stfsr             0.17   0.03
!  loop              0.23   0.20
!  offset            0.11   0.13
!  area              0.10   0.15
!  target            0.13   0.08
!  goto              0.08   0.03
!  sigsegv           0.04   0.08
!  sigbus            0.24   0.25
!  imodify           0.00   0.00
!  ldfsr_offset      0.25   0.00
!  fpattern          0.23   0.23
!  lbranch           0.14   0.10
!  shmld             1.34   1.60
!  shmst             2.78   3.46
!  shmpf             1.01   1.12
!  shmswap           0.13   0.18
!  shmblkld          1.33   0.00
!  shmblkst          0.71   0.23
!  shmblkchk         0.36   0.36
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
!  casa              0.03   0.05
!  rdasi             0.13   0.18
!  wrasi             0.20   0.25
!  bpcc              1.79   1.63
!  fbpfcc            0.47   0.71
!  fmovscc           0.19   0.23
!  fmovdcc           0.14   0.10
!  fmovqcc           0.00   0.00
!  movcc             0.13   0.10
!  flushw            0.08   0.13
!  membar            0.21   0.33
!  prefetch          0.60   0.76
!  rdpc              0.06   0.13
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.28   0.33
!  lddfa             0.21   0.18
!  ldqfa             0.00   0.00
!  ldsba             0.14   0.10
!  ldsha             0.13   0.13
!  lduba             0.24   0.31
!  lduha             0.22   0.18
!  lda               0.08   0.15
!  ldda              0.10   0.13
!  ldstuba           0.09   0.13
!  prefetcha         1.26   1.37
!  stfa              0.23   0.10
!  stdfa             0.19   0.36
!  stqfa             0.00   0.00
!  stba              0.14   0.08
!  stha              0.23   0.31
!  sta               0.20   0.28
!  stda              0.02   0.05
!  swapa             0.11   0.08
!  fmovd             0.17   0.10
!  fnegd             0.16   0.08
!  fabsd             0.22   0.20
!  fstox             0.04   0.05
!  fdtox             0.05   0.08
!  fxtos             0.26   0.36
!  fxtod             0.26   0.15
!  lds               0.26   0.36
!  ldsa              0.09   0.13
!  ldx               0.14   0.23
!  ldxa              0.08   0.13
!  nofault           0.23   0.20
!  rdgsr             0.08   0.08
!  wrgsr             0.01   0.00
!  fpadd16           0.23   0.18
!  fpadd16s          0.07   0.08
!  fpadd32           0.15   0.13
!  fpadd32s          0.12   0.18
!  fpsub16           0.16   0.08
!  fpsub16s          0.19   0.31
!  fpsub32           0.22   0.23
!  fpsub32s          0.20   0.18
!  fpack16           0.20   0.18
!  fpack32           0.16   0.25
!  fpackfix          0.23   0.25
!  fexpand           0.17   0.13
!  fpmerge           0.25   0.15
!  fmul8x16          0.25   0.28
!  fmul8x16au        0.07   0.08
!  fmul8x16al        0.16   0.25
!  fmul8sux16        0.20   0.18
!  fmul8ulx16        0.11   0.10
!  fmuld8sux16       0.00   0.00
!  fmuld8ulx16       0.05   0.03
!  alignaddr         0.09   0.05
!  alignaddrl        0.27   0.25
!  faligndata        0.07   0.10
!  fzero             0.08   0.03
!  fzeros            0.21   0.15
!  fone              0.07   0.00
!  fones             0.07   0.05
!  fsrc1             0.23   0.20
!  fsrc1s            0.11   0.18
!  fsrc2             0.16   0.10
!  fsrc2s            0.07   0.13
!  fnot1             0.08   0.08
!  fnot1s            0.04   0.03
!  fnot2             0.22   0.31
!  fnot2s            0.06   0.05
!  for               0.23   0.33
!  fors              0.10   0.05
!  fnor              0.06   0.05
!  fnors             0.10   0.10
!  fand              0.22   0.28
!  fands             0.09   0.10
!  fnand             0.15   0.15
!  fnands            0.13   0.15
!  fxor              0.13   0.20
!  fxors             0.03   0.05
!  fxnor             0.12   0.08
!  fxnors            0.13   0.08
!  fornot1           0.12   0.13
!  fornot1s          0.03   0.00
!  fornot2           0.04   0.08
!  fornot2s          0.15   0.20
!  fandnot1          0.28   0.28
!  fandnot1s         0.09   0.13
!  fandnot2          0.16   0.18
!  fandnot2s         0.28   0.28
!  fcmpgt16          0.06   0.05
!  fcmpgt32          0.25   0.13
!  fcmple16          0.10   0.13
!  fcmple32          0.27   0.18
!  fcmpne16          0.14   0.10
!  fcmpne32          0.27   0.38
!  fcmpeq16          0.03   0.05
!  fcmpeq32          0.16   0.23
!  edge8             0.20   0.25
!  edge8l            0.26   0.25
!  edge16            0.01   0.03
!  edge16l           0.26   0.15
!  edge32            0.25   0.25
!  edge32l           0.09   0.03
!  pdist             0.13   0.08
!  partial_st8       0.09   0.05
!  partial_st16      0.22   0.25
!  partial_st32      0.20   0.23
!  short_st8         0.09   0.15
!  short_st16        0.11   0.15
!  short_ld8         0.01   0.00
!  short_ld16        0.27   0.20
!  blkld             0.12   0.00
!  blkst             0.24   0.00
!  blkld_offset      0.13   0.00
!  blkst_offset      0.27   0.00
!  blk_check         0.15   0.13
!  casxa             0.27   0.18
!  rdccr             0.01   0.00
!  rdfprs            0.28   0.36
!  wrccr             0.05   0.08
!  popc              0.21   0.18
!  wrfprs            0.08   0.00
!  stx               0.11   0.18
!  stxa              0.05   0.00
!  cflush            0.00   0.00
!  array8            0.05   0.03
!  array16           0.12   0.03
!  array32           0.02   0.03
!  edge8n            0.15   0.18
!  edge8ln           0.07   0.08
!  edge16n           0.14   0.15
!  edge16ln          0.16   0.18
!  edge32n           0.18   0.20
!  edge32ln          0.25   0.31
!  bmask             0.12   0.13
!  bshuffle          0.21   0.25
!  siam              0.14   0.20
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
KDATA_MODULE(t0_module_offset_table, 0x0748e000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xffffffe8
	.word	0x00000010
	.word	0x00000000
	.word	0x00000008
	.word	0xfffffff8
	.word	0xffffffe0
	.word	0xfffffff0
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

KDATA_MODULE(t0_module_data_in_regs, 0x02c90000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x7e260454          ! %f0
	.word	0xeb017be9          ! %f1
	.word	0xd22b7602          ! %f2
	.word	0x1b25144b          ! %f3
	.word	0xb59883f6          ! %f4
	.word	0x90239c26          ! %f5
	.word	0x43905371          ! %f6
	.word	0x224b9c8e          ! %f7
	.word	0xe777d29c          ! %f8
	.word	0x45708506          ! %f9
	.word	0x0debfdb8          ! %f10
	.word	0x2b462a7a          ! %f11
	.word	0x03e401de          ! %f12
	.word	0x72d97ca3          ! %f13
	.word	0x585913e1          ! %f14
	.word	0xbb84f9c9          ! %f15
	.word	0xeeae4912          ! %f16
	.word	0x5075af04          ! %f17
	.word	0xc9cc28ec          ! %f18
	.word	0xf156e369          ! %f19
	.word	0x9b0c5a01          ! %f20
	.word	0xfde6f6c3          ! %f21
	.word	0x3a70899a          ! %f22
	.word	0x999610c8          ! %f23
	.word	0xa9dfccdd          ! %f24
	.word	0x2eb00bef          ! %f25
	.word	0x74ab0b87          ! %f26
	.word	0x22561f51          ! %f27
	.word	0x6773d772          ! %f28
	.word	0xa2843d33          ! %f29
	.word	0xf492397e          ! %f30
	.word	0xce527835          ! %f31
	.word	0xb502c39c          ! %f32
	.word	0x46771737          ! %f33
	.word	0xe1cc7108          ! %f34
	.word	0x4383e06e          ! %f35
	.word	0x5977d8f8          ! %f36
	.word	0x59749e46          ! %f37
	.word	0xf5b9c546          ! %f38
	.word	0x20308500          ! %f39
	.word	0x2af9adde          ! %f40
	.word	0x99d0fe30          ! %f41
	.word	0xd7d8bb00          ! %f42
	.word	0x8d3a0781          ! %f43
	.word	0x7b14138e          ! %f44
	.word	0xd548d471          ! %f45
	.word	0x41b231fd          ! %f46
	.word	0x6ea14edc          ! %f47
	.word	0x991811a8          ! %f48
	.word	0x0eb97892          ! %f49
	.word	0x138a0f94          ! %f50
	.word	0x84702051          ! %f51
	.word	0x3cbba4e1          ! %f52
	.word	0x4f6ae6cf          ! %f53
	.word	0x60d77e83          ! %f54
	.word	0x72b4c4bf          ! %f55
	.word	0x556a34f4          ! %f56
	.word	0x8b3b30f9          ! %f57
	.word	0x6860d7fe          ! %f58
	.word	0xaf3c3e25          ! %f59
	.word	0x5c51f5d5          ! %f60
	.word	0x4995999d          ! %f61
	.word	0xc5048a0b          ! %f62
	.word	0xf37bd166          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x8d8       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x457cfef1          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x9908a0b3          ! %o0
	.word	0xeb2a27bc          ! %o1
	.word	0xa9dddfa0          ! %o2
	.word	0xda481695          ! %o3
	.word	0x5d4df12e          ! %o4
	.word	0x9f91363a          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x9f49a82c          ! %l0
	.word	0xf71dbd66          ! %l1
	.word	0xdaf98f0c          ! %l2
	.word	0x40e2e84b          ! %l3
	.word	0x7c6d6d01          ! %l4
	.word	0x6f996ebf          ! %l5
	.word	0x5ee74a9d          ! %l6
	.word	0x41da8fce          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffffc          ! %i2 (byte offset)
	.word	0xfffffff6          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0x00000000          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8c355395          ! %y
	.word	0x0000000c          ! %icc (nzvc)
	.word	0xc0000041          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x54c34000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x677cf5c8
	.word	0x8795e608
	.word	0x157f96ad
	.word	0x0dd9b9fd
	.word	0x9c2328f6
	.word	0xded876ac
	.word	0x3506c737
	.word	0xdd22899a
	.word	0x156ce2de
	.word	0xa464ec41
	.word	0x09127cc2
	.word	0x947b3632
	.word	0xe936f97e
	.word	0xb02a337e
	.word	0xda89dee5
	.word	0xd0839706
	.word	0x465ffd11
	.word	0x1b1d8cb3
	.word	0x2d47dcd5
	.word	0xad4f95a2
	.word	0xe44796a1
	.word	0xafdec8c5
	.word	0xfc8ac017
	.word	0x15a65c86
	.word	0xbbccbbdf
	.word	0xb0f4d276
	.word	0x08bdb67d
	.word	0xb8b34c08
	.word	0x19dacc36
	.word	0xad7307e9
	.word	0xedfc874f
	.word	0x18d6d978
	.word	0x8402eb1d
	.word	0xbadc2865
	.word	0xd400e7c7
	.word	0x2083bc85
	.word	0x61a02bac
	.word	0x7d1fda58
	.word	0x9f2c22c2
	.word	0x61f70ede
	.word	0xecda6172
	.word	0xa7dc0d9f
	.word	0x465707b5
	.word	0x5260421c
	.word	0xafc4aa85
	.word	0x56dbbe04
	.word	0x2d3d54dd
	.word	0x4af80fde
	.word	0x301206d9
	.word	0xc360da07
	.word	0x6ef910ba
	.word	0x20d3c835
	.word	0x68ab90d5
	.word	0x805f51e1
	.word	0xe25586bd
	.word	0x9934a242
	.word	0x21192b23
	.word	0xd5ab92c5
	.word	0x4a08db3f
	.word	0xa9e8f31e
	.word	0x0066b7c7
	.word	0xd97ef268
	.word	0xc05e6ab5
	.word	0x3e4f6ef9
	.word	0xa13d2c73
	.word	0x1cd8cec3
	.word	0x9fcb6822
	.word	0x6fead885
	.word	0xc0881818
	.word	0xba6b6617
	.word	0x438a6ecc
	.word	0xb776c294
	.word	0x84756dc0
	.word	0x352fab31
	.word	0x43f1fb32
	.word	0x675447ff
	.word	0x8826a89a
	.word	0x33ab99ef
	.word	0xc504ff3c
	.word	0xbc2fddca
	.word	0xde479d56
	.word	0xebaad002
	.word	0xf9fc05b4
	.word	0x5b2fa385
	.word	0x3b308cb3
	.word	0x27e16df5
	.word	0xc97898f5
	.word	0x300bd5f4
	.word	0x637e4b55
	.word	0xa1ed846d
	.word	0x1afbe0e1
	.word	0x2f6947f2
	.word	0x5f6492db
	.word	0xe7ab91b1
	.word	0x9254ac17
	.word	0x94e80592
	.word	0xaaabd031
	.word	0xdf16d36c
	.word	0x98485865
	.word	0x36d68586
	.word	0x168d0322
	.word	0xf03670b2
	.word	0x7bfd4e7c
	.word	0x8d9c0cc4
	.word	0x9ab38330
	.word	0xe524c040
	.word	0x1de504e2
	.word	0x08f32866
	.word	0x3ed5bda7
	.word	0x2d4e2f07
	.word	0x0e4ebe2c
	.word	0x5b3761d1
	.word	0x43d340ef
	.word	0xa6d98aeb
	.word	0xe6ab766b
	.word	0x01979119
	.word	0x0357a922
	.word	0xa803b5c7
	.word	0x281eb3e6
	.word	0xa13071a4
	.word	0xb4e741de
	.word	0x465504b4
	.word	0x4b7f2f09
	.word	0xdb295d0c
	.word	0x9033715b
	.word	0xdb36cf8b
	.word	0x59a5859e
	.word	0x27275049
	.word	0x1be240bf
	.word	0x58d3f4a7
	.word	0x36166d3a
	.word	0xa2089f0f
	.word	0xeed595b0
	.word	0xff9754ef
	.word	0x54f918f9
	.word	0xc11df975
	.word	0xa5b3f12b
	.word	0x88478c13
	.word	0x6721c66d
	.word	0x963ba7d7
	.word	0x483dc793
	.word	0x80ef6914
	.word	0x5703a5d2
	.word	0x014820fc
	.word	0x1f17c60d
	.word	0xcfb6eb0a
	.word	0xeedc9187
	.word	0x6e9b5e7a
	.word	0xec63990a
	.word	0x76c8c621
	.word	0x8ea048b9
	.word	0xd8d49358
	.word	0x4d060824
	.word	0x7b9cb4e4
	.word	0x4e502161
	.word	0xd70228f5
	.word	0x87127b2e
	.word	0x6abf19bd
	.word	0xd2c7656f
	.word	0xd7522629
	.word	0x50c13c85
	.word	0x4bb2b4bc
	.word	0x76d3cf47
	.word	0xf13f64a9
	.word	0xdbd70cac
	.word	0xef117197
	.word	0x6bf4d96c
	.word	0x4a9238b0
t0_data_in_sp:
	.word	0x30b9db18
	.word	0x8fdd91f1
	.word	0x4493d57a
	.word	0x16d16eda
	.word	0x3bd7b847
	.word	0x8844b7df
	.word	0x5031fe59
	.word	0x1b2ac452
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffff5
	.word	0x0000001c
	.word	0x0000001c
	.word	0x00000018
	.word	t0_data_in_fp
	.word	0x34e93fca
	.word	0xf46d7c96
	.word	0xe3f9fd1b
	.word	0x194d6b91
	.word	0x0c117a44
	.word	0x2a8b078f
	.word	0xb8728635
	.word	0x48baec3c
	.word	0x6ed56211
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
	.word   	0xc10aedb5	! [%fp - 0xc]
	.word   	0x6d4d8238	! [%fp - 0x8]
	.word   	0x7ab0d5ec	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x696c59f3
	.word	0xb5e81b35
	.word	0x413779dc
	.word	0x462f38fd
	.word	0xd9672972
	.word	0x4ad44efd
	.word	0x668f1e7c
	.word	0x7ea6385f
	.word	0xd7d79924
	.word	0xd52abbb3
	.word	0x833f09f8
	.word	0xe44395aa
	.word	0xf09f0f2e
	.word	0xacb743e8
	.word	0xf39918dc
	.word	0xff846a74
	.word	0x3d6bf00a
	.word	0x7b38c58d
	.word	0xdb8ac2c1
	.word	0xb018a2e6
	.word	0xf525c789
	.word	0xc1f828a5
	.word	0x651414f3
	.word	0xf1eb0d8d
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x190a6000)
.seg "data"
t0_data_in_area0_start:
.skip 512
t0_data_in_area0_begin:
	.word	0xfe047e1b	! t0_data_in_area0-0x20
	.word	0xfa35253b	! t0_data_in_area0-0x1c
	.word	0x5d613353	! t0_data_in_area0-0x18
	.word	0x34fa146d	! t0_data_in_area0-0x14
	.word	0x018f1e4e	! t0_data_in_area0-0x10
	.word	0x8bc4f497	! t0_data_in_area0-0xc
	.word	0x3d80837f	! t0_data_in_area0-0x8
	.word	0xbada735b	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x9a82ee94	! t0_data_in_area0+0x0
	.word	0xb24e61ac	! t0_data_in_area0+0x4
	.word	0x7eade62f	! t0_data_in_area0+0x8
	.word	0xb07e7f8c	! t0_data_in_area0+0xc
	.word	0xad6be349	! t0_data_in_area0+0x10
	.word	0xc051ecd3	! t0_data_in_area0+0x14
	.word	0x76cda2e2	! t0_data_in_area0+0x18
	.word	0xf171d468	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 7616
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x10a20000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x51c3acf3	! t0_data_in_shm_area+0x0 (t0)
	.word	0x66e3f6be	! t0_data_in_shm_area+0x4 (t0)
	.word	0x5637e9b9	! t0_data_in_shm_area+0x8 (t0)
	.word	0x646279a4	! t0_data_in_shm_area+0xc (t0)
	.word	0xe2fce6ca	! t0_data_in_shm_area+0x10 (t0)
	.word	0x5cea26a6	! t0_data_in_shm_area+0x14 (t0)
	.word	0xd6a00fa1	! t0_data_in_shm_area+0x18 (t0)
	.word	0xdccdd68f	! t0_data_in_shm_area+0x1c (t0)
	.word	0xa334297b	! t0_data_in_shm_area+0x20 (t0)
	.word	0x000c7fc7	! t0_data_in_shm_area+0x24 (t0)
	.word	0xb9f0e8b8	! t0_data_in_shm_area+0x28 (t0)
	.word	0x243906ab	! t0_data_in_shm_area+0x2c (t0)
	.word	0x94990628	! t0_data_in_shm_area+0x30 (t0)
	.word	0x179dda0d	! t0_data_in_shm_area+0x34 (t0)
	.word	0x01a9e4e9	! t0_data_in_shm_area+0x38 (t0)
	.word	0xd3c1637e	! t0_data_in_shm_area+0x3c (t0)
	.word	0xdf3d2db3	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x75c6b20f	! t0_data_in_shm_area+0x44
	.word	0x51ded2d8	! t0_data_in_shm_area+0x48
	.word	0xa64b57aa	! t0_data_in_shm_area+0x4c
	.word	0xcf18483c	! t0_data_in_shm_area+0x50
	.word	0xb878843c	! t0_data_in_shm_area+0x54
	.word	0xe8b66d05	! t0_data_in_shm_area+0x58
	.word	0xe162cf3b	! t0_data_in_shm_area+0x5c
	.word	0x85f340e7	! t0_data_in_shm_area+0x60
	.word	0x415f2753	! t0_data_in_shm_area+0x64
	.word	0x0262152b	! t0_data_in_shm_area+0x68
	.word	0xf041d940	! t0_data_in_shm_area+0x6c
	.word	0x3ed609e2	! t0_data_in_shm_area+0x70
	.word	0xb568da18	! t0_data_in_shm_area+0x74
	.word	0x1c4b61e9	! t0_data_in_shm_area+0x78
	.word	0xb6a74e9c	! t0_data_in_shm_area+0x7c
	.word	0x10bf1ca6	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xf8d4f844	! t0_data_in_shm_area+0x84
	.word	0xe6da62a4	! t0_data_in_shm_area+0x88
	.word	0xf170921d	! t0_data_in_shm_area+0x8c
	.word	0x9d1c3a7c	! t0_data_in_shm_area+0x90
	.word	0xe7448abc	! t0_data_in_shm_area+0x94
	.word	0x8e01bdaa	! t0_data_in_shm_area+0x98
	.word	0xfe86bdcd	! t0_data_in_shm_area+0x9c
	.word	0xe7f03142	! t0_data_in_shm_area+0xa0
	.word	0xa7472706	! t0_data_in_shm_area+0xa4
	.word	0x73ec0c9b	! t0_data_in_shm_area+0xa8
	.word	0xfde0d188	! t0_data_in_shm_area+0xac
	.word	0xa409a86e	! t0_data_in_shm_area+0xb0
	.word	0xd191d1f8	! t0_data_in_shm_area+0xb4
	.word	0x48f81b04	! t0_data_in_shm_area+0xb8
	.word	0x9f61b6ce	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x53336000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x7e260454          ! %f0
	.word	0xeb017be9          ! %f1
	.word	0xd22b7602          ! %f2
	.word	0x1b25144b          ! %f3
	.word	0xb59883f6          ! %f4
	.word	0x90239c26          ! %f5
	.word	0x43905371          ! %f6
	.word	0x224b9c8e          ! %f7
	.word	0xe777d29c          ! %f8
	.word	0x45708506          ! %f9
	.word	0x0debfdb8          ! %f10
	.word	0x2b462a7a          ! %f11
	.word	0x03e401de          ! %f12
	.word	0x72d97ca3          ! %f13
	.word	0x585913e1          ! %f14
	.word	0xbb84f9c9          ! %f15
	.word	0xeeae4912          ! %f16
	.word	0x5075af04          ! %f17
	.word	0xc9cc28ec          ! %f18
	.word	0xf156e369          ! %f19
	.word	0x9b0c5a01          ! %f20
	.word	0xfde6f6c3          ! %f21
	.word	0x3a70899a          ! %f22
	.word	0x999610c8          ! %f23
	.word	0xa9dfccdd          ! %f24
	.word	0x2eb00bef          ! %f25
	.word	0x74ab0b87          ! %f26
	.word	0x22561f51          ! %f27
	.word	0x6773d772          ! %f28
	.word	0xa2843d33          ! %f29
	.word	0xf492397e          ! %f30
	.word	0xce527835          ! %f31
	.word	0xb502c39c          ! %f32
	.word	0x46771737          ! %f33
	.word	0xe1cc7108          ! %f34
	.word	0x4383e06e          ! %f35
	.word	0x5977d8f8          ! %f36
	.word	0x59749e46          ! %f37
	.word	0xf5b9c546          ! %f38
	.word	0x20308500          ! %f39
	.word	0x2af9adde          ! %f40
	.word	0x99d0fe30          ! %f41
	.word	0xd7d8bb00          ! %f42
	.word	0x8d3a0781          ! %f43
	.word	0x7b14138e          ! %f44
	.word	0xd548d471          ! %f45
	.word	0x41b231fd          ! %f46
	.word	0x6ea14edc          ! %f47
	.word	0x991811a8          ! %f48
	.word	0x0eb97892          ! %f49
	.word	0x138a0f94          ! %f50
	.word	0x84702051          ! %f51
	.word	0x3cbba4e1          ! %f52
	.word	0x4f6ae6cf          ! %f53
	.word	0x60d77e83          ! %f54
	.word	0x72b4c4bf          ! %f55
	.word	0x556a34f4          ! %f56
	.word	0x8b3b30f9          ! %f57
	.word	0x6860d7fe          ! %f58
	.word	0xaf3c3e25          ! %f59
	.word	0x5c51f5d5          ! %f60
	.word	0x4995999d          ! %f61
	.word	0xc5048a0b          ! %f62
	.word	0xf37bd166          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x8d8       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x457cfef1          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x9908a0b3          ! %o0
	.word	0xeb2a27bc          ! %o1
	.word	0xa9dddfa0          ! %o2
	.word	0xda481695          ! %o3
	.word	0x5d4df12e          ! %o4
	.word	0x9f91363a          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x9f49a82c          ! %l0
	.word	0xf71dbd66          ! %l1
	.word	0xdaf98f0c          ! %l2
	.word	0x40e2e84b          ! %l3
	.word	0x7c6d6d01          ! %l4
	.word	0x6f996ebf          ! %l5
	.word	0x5ee74a9d          ! %l6
	.word	0x41da8fce          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffffc          ! %i2 (byte offset)
	.word	0xfffffff6          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0x00000000          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8c355395          ! %y
	.word	0x0000000c          ! %icc (nzvc)
	.word	0xc0000041          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x1dca4000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x677cf5c8
	.word	0x8795e608
	.word	0x157f96ad
	.word	0x0dd9b9fd
	.word	0x9c2328f6
	.word	0xded876ac
	.word	0x3506c737
	.word	0xdd22899a
	.word	0x156ce2de
	.word	0xa464ec41
	.word	0x09127cc2
	.word	0x947b3632
	.word	0xe936f97e
	.word	0xb02a337e
	.word	0xda89dee5
	.word	0xd0839706
	.word	0x465ffd11
	.word	0x1b1d8cb3
	.word	0x2d47dcd5
	.word	0xad4f95a2
	.word	0xe44796a1
	.word	0xafdec8c5
	.word	0xfc8ac017
	.word	0x15a65c86
	.word	0xbbccbbdf
	.word	0xb0f4d276
	.word	0x08bdb67d
	.word	0xb8b34c08
	.word	0x19dacc36
	.word	0xad7307e9
	.word	0xedfc874f
	.word	0x18d6d978
	.word	0x8402eb1d
	.word	0xbadc2865
	.word	0xd400e7c7
	.word	0x2083bc85
	.word	0x61a02bac
	.word	0x7d1fda58
	.word	0x9f2c22c2
	.word	0x61f70ede
	.word	0xecda6172
	.word	0xa7dc0d9f
	.word	0x465707b5
	.word	0x5260421c
	.word	0xafc4aa85
	.word	0x56dbbe04
	.word	0x2d3d54dd
	.word	0x4af80fde
	.word	0x301206d9
	.word	0xc360da07
	.word	0x6ef910ba
	.word	0x20d3c835
	.word	0x68ab90d5
	.word	0x805f51e1
	.word	0xe25586bd
	.word	0x9934a242
	.word	0x21192b23
	.word	0xd5ab92c5
	.word	0x4a08db3f
	.word	0xa9e8f31e
	.word	0x0066b7c7
	.word	0xd97ef268
	.word	0xc05e6ab5
	.word	0x3e4f6ef9
	.word	0xa13d2c73
	.word	0x1cd8cec3
	.word	0x9fcb6822
	.word	0x6fead885
	.word	0xc0881818
	.word	0xba6b6617
	.word	0x438a6ecc
	.word	0xb776c294
	.word	0x84756dc0
	.word	0x352fab31
	.word	0x43f1fb32
	.word	0x675447ff
	.word	0x8826a89a
	.word	0x33ab99ef
	.word	0xc504ff3c
	.word	0xbc2fddca
	.word	0xde479d56
	.word	0xebaad002
	.word	0xf9fc05b4
	.word	0x5b2fa385
	.word	0x3b308cb3
	.word	0x27e16df5
	.word	0xc97898f5
	.word	0x300bd5f4
	.word	0x637e4b55
	.word	0xa1ed846d
	.word	0x1afbe0e1
	.word	0x2f6947f2
	.word	0x5f6492db
	.word	0xe7ab91b1
	.word	0x9254ac17
	.word	0x94e80592
	.word	0xaaabd031
	.word	0xdf16d36c
	.word	0x98485865
	.word	0x36d68586
	.word	0x168d0322
	.word	0xf03670b2
	.word	0x7bfd4e7c
	.word	0x8d9c0cc4
	.word	0x9ab38330
	.word	0xe524c040
	.word	0x1de504e2
	.word	0x08f32866
	.word	0x3ed5bda7
	.word	0x2d4e2f07
	.word	0x0e4ebe2c
	.word	0x5b3761d1
	.word	0x43d340ef
	.word	0xa6d98aeb
	.word	0xe6ab766b
	.word	0x01979119
	.word	0x0357a922
	.word	0xa803b5c7
	.word	0x281eb3e6
	.word	0xa13071a4
	.word	0xb4e741de
	.word	0x465504b4
	.word	0x4b7f2f09
	.word	0xdb295d0c
	.word	0x9033715b
	.word	0xdb36cf8b
	.word	0x59a5859e
	.word	0x27275049
	.word	0x1be240bf
	.word	0x58d3f4a7
	.word	0x36166d3a
	.word	0xa2089f0f
	.word	0xeed595b0
	.word	0xff9754ef
	.word	0x54f918f9
	.word	0xc11df975
	.word	0xa5b3f12b
	.word	0x88478c13
	.word	0x6721c66d
	.word	0x963ba7d7
	.word	0x483dc793
	.word	0x80ef6914
	.word	0x5703a5d2
	.word	0x014820fc
	.word	0x1f17c60d
	.word	0xcfb6eb0a
	.word	0xeedc9187
	.word	0x6e9b5e7a
	.word	0xec63990a
	.word	0x76c8c621
	.word	0x8ea048b9
	.word	0xd8d49358
	.word	0x4d060824
	.word	0x7b9cb4e4
	.word	0x4e502161
	.word	0xd70228f5
	.word	0x87127b2e
	.word	0x6abf19bd
	.word	0xd2c7656f
	.word	0xd7522629
	.word	0x50c13c85
	.word	0x4bb2b4bc
	.word	0x76d3cf47
	.word	0xf13f64a9
	.word	0xdbd70cac
	.word	0xef117197
	.word	0x6bf4d96c
	.word	0x4a9238b0
t0_data_exp_sp:
	.word	0x30b9db18
	.word	0x8fdd91f1
	.word	0x4493d57a
	.word	0x16d16eda
	.word	0x3bd7b847
	.word	0x8844b7df
	.word	0x5031fe59
	.word	0x1b2ac452
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffff5
	.word	0x0000001c
	.word	0x0000001c
	.word	0x00000018
	.word	t0_data_exp_fp
	.word	0x34e93fca
	.word	0xf46d7c96
	.word	0xe3f9fd1b
	.word	0x194d6b91
	.word	0x0c117a44
	.word	0x2a8b078f
	.word	0xb8728635
	.word	0x48baec3c
	.word	0x6ed56211
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
	.word   	0xc10aedb5	! [%fp - 0xc]
	.word   	0x6d4d8238	! [%fp - 0x8]
	.word   	0x7ab0d5ec	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x696c59f3
	.word	0xb5e81b35
	.word	0x413779dc
	.word	0x462f38fd
	.word	0xd9672972
	.word	0x4ad44efd
	.word	0x668f1e7c
	.word	0x7ea6385f
	.word	0xd7d79924
	.word	0xd52abbb3
	.word	0x833f09f8
	.word	0xe44395aa
	.word	0xf09f0f2e
	.word	0xacb743e8
	.word	0xf39918dc
	.word	0xff846a74
	.word	0x3d6bf00a
	.word	0x7b38c58d
	.word	0xdb8ac2c1
	.word	0xb018a2e6
	.word	0xf525c789
	.word	0xc1f828a5
	.word	0x651414f3
	.word	0xf1eb0d8d
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x51360000)
.seg "data"
t0_data_exp_area0_start:
.skip 512
t0_data_exp_area0_begin:
	.word	0xfe047e1b	! t0_data_exp_area0-0x20
	.word	0xfa35253b	! t0_data_exp_area0-0x1c
	.word	0x5d613353	! t0_data_exp_area0-0x18
	.word	0x34fa146d	! t0_data_exp_area0-0x14
	.word	0x018f1e4e	! t0_data_exp_area0-0x10
	.word	0x8bc4f497	! t0_data_exp_area0-0xc
	.word	0x3d80837f	! t0_data_exp_area0-0x8
	.word	0xbada735b	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x9a82ee94	! t0_data_exp_area0+0x0
	.word	0xb24e61ac	! t0_data_exp_area0+0x4
	.word	0x7eade62f	! t0_data_exp_area0+0x8
	.word	0xb07e7f8c	! t0_data_exp_area0+0xc
	.word	0xad6be349	! t0_data_exp_area0+0x10
	.word	0xc051ecd3	! t0_data_exp_area0+0x14
	.word	0x76cda2e2	! t0_data_exp_area0+0x18
	.word	0xf171d468	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 7616
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x6d884000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x51c3acf3	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x66e3f6be	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x5637e9b9	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x646279a4	! t0_data_exp_shm_area+0xc (t0)
	.word	0xe2fce6ca	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x5cea26a6	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xd6a00fa1	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xdccdd68f	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xa334297b	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x000c7fc7	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xb9f0e8b8	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x243906ab	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x94990628	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x179dda0d	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x01a9e4e9	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xd3c1637e	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xdf3d2db3	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x75c6b20f	! t0_data_exp_shm_area+0x44
	.word	0x51ded2d8	! t0_data_exp_shm_area+0x48
	.word	0xa64b57aa	! t0_data_exp_shm_area+0x4c
	.word	0xcf18483c	! t0_data_exp_shm_area+0x50
	.word	0xb878843c	! t0_data_exp_shm_area+0x54
	.word	0xe8b66d05	! t0_data_exp_shm_area+0x58
	.word	0xe162cf3b	! t0_data_exp_shm_area+0x5c
	.word	0x85f340e7	! t0_data_exp_shm_area+0x60
	.word	0x415f2753	! t0_data_exp_shm_area+0x64
	.word	0x0262152b	! t0_data_exp_shm_area+0x68
	.word	0xf041d940	! t0_data_exp_shm_area+0x6c
	.word	0x3ed609e2	! t0_data_exp_shm_area+0x70
	.word	0xb568da18	! t0_data_exp_shm_area+0x74
	.word	0x1c4b61e9	! t0_data_exp_shm_area+0x78
	.word	0xb6a74e9c	! t0_data_exp_shm_area+0x7c
	.word	0x10bf1ca6	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xf8d4f844	! t0_data_exp_shm_area+0x84
	.word	0xe6da62a4	! t0_data_exp_shm_area+0x88
	.word	0xf170921d	! t0_data_exp_shm_area+0x8c
	.word	0x9d1c3a7c	! t0_data_exp_shm_area+0x90
	.word	0xe7448abc	! t0_data_exp_shm_area+0x94
	.word	0x8e01bdaa	! t0_data_exp_shm_area+0x98
	.word	0xfe86bdcd	! t0_data_exp_shm_area+0x9c
	.word	0xe7f03142	! t0_data_exp_shm_area+0xa0
	.word	0xa7472706	! t0_data_exp_shm_area+0xa4
	.word	0x73ec0c9b	! t0_data_exp_shm_area+0xa8
	.word	0xfde0d188	! t0_data_exp_shm_area+0xac
	.word	0xa409a86e	! t0_data_exp_shm_area+0xb0
	.word	0xd191d1f8	! t0_data_exp_shm_area+0xb4
	.word	0x48f81b04	! t0_data_exp_shm_area+0xb8
	.word	0x9f61b6ce	! t0_data_exp_shm_area+0xbc
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
#define T0_KAOS_SEED          d2b1f7ffa92e
#define T0_KAOS_ICOUNT        4000
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    512
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     4002

#define T0_KAOS_BOOT_VA                  0x0528c000
#define T0_KAOS_BOOT_PA                  0x00000000017b8000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x49636000
#define T0_KAOS_STARTUP_PA               0x000000000395e000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x0748e000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000004e00000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x1f0ca000
#define T0_KAOS_DONE_PA                  0x000000000783a000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x5339a000
#define T0_KAOS_KTBL_PA                  0x000000000825c000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x53362000
#define T0_KAOS_SUBR0_PA                 0x000000000b536000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x52cca000
#define T0_KAOS_SUBR1_PA                 0x000000000c0ca000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x5091a000
#define T0_KAOS_SUBR2_PA                 0x000000000f018000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x53434000
#define T0_KAOS_SUBR3_PA                 0x0000000010d8c000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x53336000
#define T0_KAOS_EXP_REGS_PA              0x0000000013c88000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x02c90000
#define T0_KAOS_RUN_REGS_PA              0x00000000155ca000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x1dca4000
#define T0_KAOS_EXP_STACK_PA             0x0000000017ace000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x54c34000
#define T0_KAOS_RUN_STACK_PA             0x000000001839c000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x51360000
#define T0_KAOS_EXP_AREA0_PA             0x000000001bff0000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x190a6000
#define T0_KAOS_RUN_AREA0_PA             0x000000001c410000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x6d884000
#define T0_KAOS_EXP_SHM_AREA_PA          0x0000000000efc000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x10a20000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000000920000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0xb16b3a53
#define T0_KAOS_RANVAL_01     0x0cb4d9b2
#define T0_KAOS_RANVAL_02     0x3ee7eb4c
#define T0_KAOS_RANVAL_03     0x66722dda
#define T0_KAOS_RANVAL_04     0x17455da3
#define T0_KAOS_RANVAL_05     0xc200dacd
#define T0_KAOS_RANVAL_06     0xb500a5d3
#define T0_KAOS_RANVAL_07     0x51a3f7f3
#define T0_KAOS_RANVAL_08     0xd9e6e334
#define T0_KAOS_RANVAL_09     0x2e9a64d4
#define T0_KAOS_RANVAL_0a     0x5617d657
#define T0_KAOS_RANVAL_0b     0xdbacd301
#define T0_KAOS_RANVAL_0c     0x28110c06
#define T0_KAOS_RANVAL_0d     0xffbef1f2
#define T0_KAOS_RANVAL_0e     0x0a6c9b9a
#define T0_KAOS_RANVAL_0f     0x38dd1a62
#define T0_KAOS_RANVAL_10     0x36687b85
#define T0_KAOS_RANVAL_11     0x8a3525ed
#define T0_KAOS_RANVAL_12     0x0bf1ad41
#define T0_KAOS_RANVAL_13     0xa21f20fe
#define T0_KAOS_RANVAL_14     0xfb8c8a0a
#define T0_KAOS_RANVAL_15     0x5e0d8852
#define T0_KAOS_RANVAL_16     0xb6975bff
#define T0_KAOS_RANVAL_17     0xd9c99898
#define T0_KAOS_RANVAL_18     0xdff2bba7
#define T0_KAOS_RANVAL_19     0xc8782df2
#define T0_KAOS_RANVAL_1a     0x9572eff2
#define T0_KAOS_RANVAL_1b     0xe0609a67
#define T0_KAOS_RANVAL_1c     0x623c5f23
#define T0_KAOS_RANVAL_1d     0xc8c7058c
#define T0_KAOS_RANVAL_1e     0x9393094c
#define T0_KAOS_RANVAL_1f     0xdd0624e5
#define T0_KAOS_RANVAL_20     0xf7989943
#define T0_KAOS_RANVAL_21     0x0afbbbcb
#define T0_KAOS_RANVAL_22     0xe226e736
#define T0_KAOS_RANVAL_23     0x781422e6
#define T0_KAOS_RANVAL_24     0xe025604b
#define T0_KAOS_RANVAL_25     0xccbb6a72
#define T0_KAOS_RANVAL_26     0xff98b8f0
#define T0_KAOS_RANVAL_27     0x8b674feb
#define T0_KAOS_RANVAL_28     0xd5662bc3
#define T0_KAOS_RANVAL_29     0xc87186d5
#define T0_KAOS_RANVAL_2a     0xa2995d3c
#define T0_KAOS_RANVAL_2b     0xec838db7
#define T0_KAOS_RANVAL_2c     0xfd0f5c7e
#define T0_KAOS_RANVAL_2d     0xb10ec38a
#define T0_KAOS_RANVAL_2e     0x131e33fc
#define T0_KAOS_RANVAL_2f     0xd62f7f23
#define T0_KAOS_RANVAL_30     0x40d1a0d8
#define T0_KAOS_RANVAL_31     0xb667d961
#define T0_KAOS_RANVAL_32     0x8837e61a
#define T0_KAOS_RANVAL_33     0xd2ae7c2e
#define T0_KAOS_RANVAL_34     0x74c0d93e
#define T0_KAOS_RANVAL_35     0x72036b90
#define T0_KAOS_RANVAL_36     0x6eb347a7
#define T0_KAOS_RANVAL_37     0x0a9d3358
#define T0_KAOS_RANVAL_38     0xb5a640f2
#define T0_KAOS_RANVAL_39     0x6d657b32
#define T0_KAOS_RANVAL_3a     0x67e3b846
#define T0_KAOS_RANVAL_3b     0x27e68c2f
#define T0_KAOS_RANVAL_3c     0x4745df0f
#define T0_KAOS_RANVAL_3d     0xd0da1df2
#define T0_KAOS_RANVAL_3e     0x5c08a5cb
#define T0_KAOS_RANVAL_3f     0x058b9f29
#define T0_KAOS_RANVAL_40     0x649b83cb
#define T0_KAOS_RANVAL_41     0x4ba86c03
#define T0_KAOS_RANVAL_42     0x0eb6151e
#define T0_KAOS_RANVAL_43     0xb552d6b4
#define T0_KAOS_RANVAL_44     0xd993d5fc
#define T0_KAOS_RANVAL_45     0xb7b1d953
#define T0_KAOS_RANVAL_46     0x47c25565
#define T0_KAOS_RANVAL_47     0xd91f8d8b
#define T0_KAOS_RANVAL_48     0x930a34dd
#define T0_KAOS_RANVAL_49     0x9a116dff
#define T0_KAOS_RANVAL_4a     0x46b94162
#define T0_KAOS_RANVAL_4b     0x57f4be4b
#define T0_KAOS_RANVAL_4c     0x4f1c7211
#define T0_KAOS_RANVAL_4d     0x63919208
#define T0_KAOS_RANVAL_4e     0xebf7b318
#define T0_KAOS_RANVAL_4f     0x5bba9845
#define T0_KAOS_RANVAL_50     0x3971a7e7
#define T0_KAOS_RANVAL_51     0x1e066047
#define T0_KAOS_RANVAL_52     0xbf980db4
#define T0_KAOS_RANVAL_53     0x9e080d95
#define T0_KAOS_RANVAL_54     0x0521afde
#define T0_KAOS_RANVAL_55     0x2205b49e
#define T0_KAOS_RANVAL_56     0xdd8301ab
#define T0_KAOS_RANVAL_57     0x04aeae73
#define T0_KAOS_RANVAL_58     0x44befd6c
#define T0_KAOS_RANVAL_59     0x12556970
#define T0_KAOS_RANVAL_5a     0x4d85ef1f
#define T0_KAOS_RANVAL_5b     0xabd865c8
#define T0_KAOS_RANVAL_5c     0xa0dce0fa
#define T0_KAOS_RANVAL_5d     0xf2fb7852
#define T0_KAOS_RANVAL_5e     0x90828a87
#define T0_KAOS_RANVAL_5f     0xd06beb04
#define T0_KAOS_RANVAL_60     0xaa887733
#define T0_KAOS_RANVAL_61     0xf862f202
#define T0_KAOS_RANVAL_62     0x36e1a78d
#define T0_KAOS_RANVAL_63     0xc365fd2e
#define T0_KAOS_RANVAL_64     0x71cac87e
#define T0_KAOS_RANVAL_65     0x0ac40197
#define T0_KAOS_RANVAL_66     0x52ad4e3a
#define T0_KAOS_RANVAL_67     0xa322bb3c
#define T0_KAOS_RANVAL_68     0x94aedcc8
#define T0_KAOS_RANVAL_69     0xd22c6efa
#define T0_KAOS_RANVAL_6a     0x17547e50
#define T0_KAOS_RANVAL_6b     0x1b73ada4
#define T0_KAOS_RANVAL_6c     0x01aec786
#define T0_KAOS_RANVAL_6d     0x03695494
#define T0_KAOS_RANVAL_6e     0x2c5d44f6
#define T0_KAOS_RANVAL_6f     0xc6145532
#define T0_KAOS_RANVAL_70     0x4516effa
#define T0_KAOS_RANVAL_71     0x1ce9fc48
#define T0_KAOS_RANVAL_72     0x3570089a
#define T0_KAOS_RANVAL_73     0xebd8531c
#define T0_KAOS_RANVAL_74     0x8c1f19b4
#define T0_KAOS_RANVAL_75     0x87bf17a3
#define T0_KAOS_RANVAL_76     0x13712f12
#define T0_KAOS_RANVAL_77     0xa90b7e53
#define T0_KAOS_RANVAL_78     0xf66cf15b
#define T0_KAOS_RANVAL_79     0x5358c752
#define T0_KAOS_RANVAL_7a     0x060c8204
#define T0_KAOS_RANVAL_7b     0xb62d7a1b
#define T0_KAOS_RANVAL_7c     0xbfac21ad
#define T0_KAOS_RANVAL_7d     0x65d925d4
#define T0_KAOS_RANVAL_7e     0x5d67f588
#define T0_KAOS_RANVAL_7f     0x06b7a1dd
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
!    areaoffset     512
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      4002
!    code           5339a000
!    entry          5339a000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           d2b1f7ffa92e
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

KTEXT_MODULE(t0_module_ktbl, 0x5339a000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x99b009b0	! t0_kref+0x0:   	fexpand	%f16, %f12
	.word	0x90fcade2	! t0_kref+0x4:   	sdivcc	%l2, 0xde2, %o0
	.word	0x9de3bfa0	! t0_kref+0x8:   	save	%sp, -0x60, %sp
	.word	0xb25f7fec	! t0_kref+0xc:   	smul	%i5, -0x14, %i1
	.word	0x91ee001d	! t0_kref+0x10:   	restore	%i0, %i5, %o0
	.word	0x96adc015	! t0_kref+0x14:   	andncc	%l7, %l5, %o3
	.word	0xa60cc008	! t0_kref+0x18:   	and	%l3, %o0, %l3
	.word	0x9da408ce	! t0_kref+0x1c:   	fsubd	%f16, %f14, %f14
	.word	0x99a309d0	! t0_kref+0x20:   	fdivd	%f12, %f16, %f12
	.word	0x99a3c9ae	! t0_kref+0x24:   	fdivs	%f15, %f14, %f12
	.word	0x99a01110	! t0_kref+0x28:   	fxtod	%f16, %f12
	.word	0x9da408ad	! t0_kref+0x2c:   	fsubs	%f16, %f13, %f14
	.word	0x81ab8ace	! t0_kref+0x30:   	fcmped	%fcc0, %f14, %f14
	.word	0x94ad4008	! t0_kref+0x34:   	andncc	%l5, %o0, %o2
	.word	0xae85f1d9	! t0_kref+0x38:   	addcc	%l7, -0xe27, %l7
	.word	0x3f800007	! t0_kref+0x3c:   	fbo,a	_kref+0x58
	.word	0xdd200018	! t0_kref+0x40:   	st	%f14, [%g0 + %i0]
	.word	0xe11e3fe8	! t0_kref+0x44:   	ldd	[%i0 - 0x18], %f16
	.word	0xe120a02c	! t0_kref+0x48:   	st	%f16, [%g2 + 0x2c]
	.word	0xea28a029	! t0_kref+0x4c:   	stb	%l5, [%g2 + 0x29]
	.word	0xa1a40850	! t0_kref+0x50:   	faddd	%f16, %f16, %f16
	.word	0xe648a029	! t0_kref+0x54:   	ldsb	[%g2 + 0x29], %l3
	.word	0xa5400000	! t0_kref+0x58:   	mov	%y, %l2
	.word	0x912d600b	! t0_kref+0x5c:   	sll	%l5, 0xb, %o0
	.word	0xe13e2018	! t0_kref+0x60:   	std	%f16, [%i0 + 0x18]
	.word	0x9da00531	! t0_kref+0x64:   	fsqrts	%f17, %f14
	.word	0xaaad319e	! t0_kref+0x68:   	andncc	%l4, -0xe62, %l5
	.word	0xd9be1812	! t0_kref+0x6c:   	stda	%f12, [%i0 + %l2]0xc0
	.word	0x96c54015	! t0_kref+0x70:   	addccc	%l5, %l5, %o3
	.word	0x2b254752	! t0_kref+0x74:   	sethi	%hi(0x951d4800), %l5
	.word	0x94f4a039	! t0_kref+0x78:   	udivcc	%l2, 0x39, %o2
	.word	0x9fa3092e	! t0_kref+0x7c:   	fmuls	%f12, %f14, %f15
	.word	0x2a800003	! t0_kref+0x80:   	bcs,a	_kref+0x8c
	.word	0x94b5774f	! t0_kref+0x84:   	orncc	%l5, -0x8b1, %o2
	.word	0x26800004	! t0_kref+0x88:   	bl,a	_kref+0x98
	.word	0x94d521b2	! t0_kref+0x8c:   	umulcc	%l4, 0x1b2, %o2
	.word	0x23800002	! t0_kref+0x90:   	fbne,a	_kref+0x98
	.word	0x81580000	! t0_kref+0x94:   	flushw
	.word	0x81ab4ab0	! t0_kref+0x98:   	fcmpes	%fcc0, %f13, %f16
	.word	0xaf35c015	! t0_kref+0x9c:   	srl	%l7, %l5, %l7
	.word	0x943cc016	! t0_kref+0xa0:   	xnor	%l3, %l6, %o2
	.word	0x9ba308ae	! t0_kref+0xa4:   	fsubs	%f12, %f14, %f13
	.word	0x99a44831	! t0_kref+0xa8:   	fadds	%f17, %f17, %f12
	.word	0x90fdc017	! t0_kref+0xac:   	sdivcc	%l7, %l7, %o0
	.word	0xe13e4000	! t0_kref+0xb0:   	std	%f16, [%i1]
	.word	0xaf1a0012	! t0_kref+0xb4:   	tsubcctv	%o0, %l2, %l7
	.word	0xa1a40950	! t0_kref+0xb8:   	fmuld	%f16, %f16, %f16
	.word	0x99a01090	! t0_kref+0xbc:   	fxtos	%f16, %f12
	.word	0xa3b00f2f	! t0_kref+0xc0:   	fsrc2s	%f15, %f17
	.word	0x9fc10000	! t0_kref+0xc4:   	call	%g4
	.word	0x99b30dd0	! t0_kref+0xc8:   	fnand	%f12, %f16, %f12
	.word	0xd83e2008	! t0_kref+0xcc:   	std	%o4, [%i0 + 8]
	.word	0xd91e401d	! t0_kref+0xd0:   	ldd	[%i1 + %i5], %f12
	.word	0xea270019	! t0_kref+0xd4:   	st	%l5, [%i4 + %i1]
	.word	0x9da0110e	! t0_kref+0xd8:   	fxtod	%f14, %f14
	.word	0x8143c000	! t0_kref+0xdc:   	stbar
	.word	0x9da0054e	! t0_kref+0xe0:   	fsqrtd	%f14, %f14
	.word	0x903537d9	! t0_kref+0xe4:   	orn	%l4, -0x827, %o0
	.word	0xa3a389ae	! t0_kref+0xe8:   	fdivs	%f14, %f14, %f17
	.word	0x9da0054e	! t0_kref+0xec:   	fsqrtd	%f14, %f14
	.word	0xecee9018	! t0_kref+0xf0:   	ldstuba	[%i2 + %i0]0x80, %l6
	.word	0xec000019	! t0_kref+0xf4:   	ld	[%g0 + %i1], %l6
	.word	0x878020d2	! t0_kref+0xf8:   	mov	0xd2, %asi
	.word	0x9674f7e7	! t0_kref+0xfc:   	udiv	%l3, -0x819, %o3
	.word	0xd9871019	! t0_kref+0x100:   	lda	[%i4 + %i1]0x80, %f12
	.word	0x81abcab0	! t0_kref+0x104:   	fcmpes	%fcc0, %f15, %f16
	.word	0x8143e040	! t0_kref+0x108:   	membar	0x40
	.word	0x96b5c012	! t0_kref+0x10c:   	orncc	%l7, %l2, %o3
	.word	0x96f4bf97	! t0_kref+0x110:   	udivcc	%l2, -0x69, %o3
	.word	0xaa9d4014	! t0_kref+0x114:   	xorcc	%l5, %l4, %l5
	.word	0x9062355a	! t0_kref+0x118:   	subc	%o0, -0xaa6, %o0
	.word	0xec367ffe	! t0_kref+0x11c:   	sth	%l6, [%i1 - 2]
	.word	0xdd3e7fe8	! t0_kref+0x120:   	std	%f14, [%i1 - 0x18]
	.word	0xdd1e0000	! t0_kref+0x124:   	ldd	[%i0], %f14
	.word	0x921cc017	! t0_kref+0x128:   	xor	%l3, %l7, %o1
	.word	0xa1a0054c	! t0_kref+0x12c:   	fsqrtd	%f12, %f16
	.word	0x9db406ad	! t0_kref+0x130:   	fmul8x16al	%f16, %f13, %f14
	.word	0x9665f02c	! t0_kref+0x134:   	subc	%l7, -0xfd4, %o3
	.word	0xd9be1a1b	! t0_kref+0x138:   	stda	%f12, [%i0 + %i3]0xd0
	.word	0xa1a3c8ac	! t0_kref+0x13c:   	fsubs	%f15, %f12, %f16
	.word	0xc5ee5016	! t0_kref+0x140:   	prefetcha	%i1 + %l6, 2
	.word	0xa1a01090	! t0_kref+0x144:   	fxtos	%f16, %f16
	.word	0xf83e3ff0	! t0_kref+0x148:   	std	%i4, [%i0 - 0x10]
	.word	0x9065e9dc	! t0_kref+0x14c:   	subc	%l7, 0x9dc, %o0
	.word	0xaaf5f727	! t0_kref+0x150:   	udivcc	%l7, -0x8d9, %l5
	.word	0xe62e601a	! t0_kref+0x154:   	stb	%l3, [%i1 + 0x1a]
	.word	0xe46e8019	! t0_kref+0x158:   	ldstub	[%i2 + %i1], %l2
	.word	0xa1a408af	! t0_kref+0x15c:   	fsubs	%f16, %f15, %f16
	.word	0xdc270005	! t0_kref+0x160:   	st	%sp, [%i4 + %g5]
	.word	0x9fa0052e	! t0_kref+0x164:   	fsqrts	%f14, %f15
	.word	0x9da0054e	! t0_kref+0x168:   	fsqrtd	%f14, %f14
	.word	0xd4801019	! t0_kref+0x16c:   	lda	[%g0 + %i1]0x80, %o2
	.word	0xa6da0014	! t0_kref+0x170:   	smulcc	%o0, %l4, %l3
	.word	0xa1a40850	! t0_kref+0x174:   	faddd	%f16, %f16, %f16
	.word	0xadb4c033	! t0_kref+0x178:   	edge8n	%l3, %l3, %l6
	.word	0x9134c013	! t0_kref+0x17c:   	srl	%l3, %l3, %o0
	.word	0xabb58037	! t0_kref+0x180:   	edge8n	%l6, %l7, %l5
	.word	0xa1b40e80	! t0_kref+0x184:   	fsrc1	%f16, %f16
	.word	0x81ab4ab1	! t0_kref+0x188:   	fcmpes	%fcc0, %f13, %f17
	.word	0xefee501b	! t0_kref+0x18c:   	prefetcha	%i1 + %i3, 23
	.word	0xa7b20077	! t0_kref+0x190:   	edge8ln	%o0, %l7, %l3
	.word	0x94fdc008	! t0_kref+0x194:   	sdivcc	%l7, %o0, %o2
	.word	0x99a80031	! t0_kref+0x198:   	fmovsn	%fcc0, %f17, %f12
	.word	0xa41c8015	! t0_kref+0x19c:   	xor	%l2, %l5, %l2
	.word	0x8143c000	! t0_kref+0x1a0:   	stbar
	.word	0xc3ee5012	! t0_kref+0x1a4:   	prefetcha	%i1 + %l2, 1
	.word	0xd020a000	! t0_kref+0x1a8:   	st	%o0, [%g2]
	.word	0xac75c014	! t0_kref+0x1ac:   	udiv	%l7, %l4, %l6
	.word	0x99a0004c	! t0_kref+0x1b0:   	fmovd	%f12, %f12
	.word	0x9ba3492c	! t0_kref+0x1b4:   	fmuls	%f13, %f12, %f13
	.word	0x963ceff9	! t0_kref+0x1b8:   	xnor	%l3, 0xff9, %o3
	.word	0x99a00550	! t0_kref+0x1bc:   	fsqrtd	%f16, %f12
	.word	0x28480003	! t0_kref+0x1c0:   	bleu,a,pt	%icc, _kref+0x1cc
	.word	0xa61ca29f	! t0_kref+0x1c4:   	xor	%l2, 0x29f, %l3
	.word	0xe120a000	! t0_kref+0x1c8:   	st	%f16, [%g2]
	.word	0xd046200c	! t0_kref+0x1cc:   	ldsw	[%i0 + 0xc], %o0
	.word	0x81dae432	! t0_kref+0x1d0:   	flush	%o3 + 0x432
	.word	0xc51f4005	! t0_kref+0x1d4:   	ldd	[%i5 + %g5], %f2
	.word	0xc9ee5014	! t0_kref+0x1d8:   	prefetcha	%i1 + %l4, 4
	.word	0x99a389cc	! t0_kref+0x1dc:   	fdivd	%f14, %f12, %f12
	.word	0x3f800007	! t0_kref+0x1e0:   	fbo,a	_kref+0x1fc
	.word	0x93b3858e	! t0_kref+0x1e4:   	fcmpgt32	%f14, %f14, %o1
	.word	0x29800004	! t0_kref+0x1e8:   	fbl,a	_kref+0x1f8
	.word	0x99a38850	! t0_kref+0x1ec:   	faddd	%f14, %f16, %f12
	.word	0xd026200c	! t0_kref+0x1f0:   	st	%o0, [%i0 + 0xc]
	.word	0xad2d2001	! t0_kref+0x1f4:   	sll	%l4, 0x1, %l6
	.word	0x81dbf7a2	! t0_kref+0x1f8:   	flush	%o7 - 0x85e
	.word	0x96aa0012	! t0_kref+0x1fc:   	andncc	%o0, %l2, %o3
	.word	0x9295229c	! t0_kref+0x200:   	orcc	%l4, 0x29c, %o1
	.word	0x941dc012	! t0_kref+0x204:   	xor	%l7, %l2, %o2
	.word	0x93b20016	! t0_kref+0x208:   	edge8	%o0, %l6, %o1
	.word	0x9fb007ae	! t0_kref+0x20c:   	fpackfix	%f14, %f15
	.word	0xa6657c73	! t0_kref+0x210:   	subc	%l5, -0x38d, %l3
	.word	0x9da0052d	! t0_kref+0x214:   	fsqrts	%f13, %f14
	.word	0xe820a01c	! t0_kref+0x218:   	st	%l4, [%g2 + 0x1c]
	.word	0xaf148014	! t0_kref+0x21c:   	taddcctv	%l2, %l4, %l7
	.word	0x9de3bfa0	! t0_kref+0x220:   	save	%sp, -0x60, %sp
	.word	0xbaaec018	! t0_kref+0x224:   	andncc	%i3, %i0, %i5
	.word	0xa7ee2e6d	! t0_kref+0x228:   	restore	%i0, 0xe6d, %l3
	.word	0x9da0014e	! t0_kref+0x22c:   	fabsd	%f14, %f14
	.word	0xf36e401a	! t0_kref+0x230:   	prefetch	%i1 + %i2, 25
	.word	0x99a40950	! t0_kref+0x234:   	fmuld	%f16, %f16, %f12
	.word	0x9fa018ce	! t0_kref+0x238:   	fdtos	%f14, %f15
	.word	0x9ba018ce	! t0_kref+0x23c:   	fdtos	%f14, %f13
	.word	0xa1a4482e	! t0_kref+0x240:   	fadds	%f17, %f14, %f16
	.word	0xac7db16d	! t0_kref+0x244:   	sdiv	%l6, -0xe93, %l6
	.word	0xaef20012	! t0_kref+0x248:   	udivcc	%o0, %l2, %l7
	.word	0x90420015	! t0_kref+0x24c:   	addc	%o0, %l5, %o0
	.word	0xa1b306cc	! t0_kref+0x250:   	fmul8sux16	%f12, %f12, %f16
	.word	0xa1b30e4c	! t0_kref+0x254:   	fxnor	%f12, %f12, %f16
	.word	0xe1a71019	! t0_kref+0x258:   	sta	%f16, [%i4 + %i1]0x80
	.word	0xeb68a002	! t0_kref+0x25c:   	prefetch	%g2 + 2, 21
	.word	0xe1063fe0	! t0_kref+0x260:   	ld	[%i0 - 0x20], %f16
	.word	0x9ba3c8ac	! t0_kref+0x264:   	fsubs	%f15, %f12, %f13
	.word	0xdb871019	! t0_kref+0x268:   	lda	[%i4 + %i1]0x80, %f13
	.word	0xa1a309ce	! t0_kref+0x26c:   	fdivd	%f12, %f14, %f16
	.word	0x99a00531	! t0_kref+0x270:   	fsqrts	%f17, %f12
	.word	0xa1a30850	! t0_kref+0x274:   	faddd	%f12, %f16, %f16
	.word	0xadb48015	! t0_kref+0x278:   	edge8	%l2, %l5, %l6
	.word	0x99a4092c	! t0_kref+0x27c:   	fmuls	%f16, %f12, %f12
	.word	0x9fa018cc	! t0_kref+0x280:   	fdtos	%f12, %f15
	.word	0xecde5000	! t0_kref+0x284:   	ldxa	[%i1]0x80, %l6
	.word	0x90c4ab98	! t0_kref+0x288:   	addccc	%l2, 0xb98, %o0
	.word	0x99a0054c	! t0_kref+0x28c:   	fsqrtd	%f12, %f12
	.word	0x99a3094c	! t0_kref+0x290:   	fmuld	%f12, %f12, %f12
	.word	0x3e800008	! t0_kref+0x294:   	bvc,a	_kref+0x2b4
	.word	0xac454015	! t0_kref+0x298:   	addc	%l5, %l5, %l6
	.word	0x96622172	! t0_kref+0x29c:   	subc	%o0, 0x172, %o3
	.word	0xe1bf5019	! t0_kref+0x2a0:   	stda	%f16, [%i5 + %i1]0x80
	.word	0xaa74bc29	! t0_kref+0x2a4:   	udiv	%l2, -0x3d7, %l5
	.word	0xdbf61015	! t0_kref+0x2a8:   	casxa	[%i0]0x80, %l5, %o5
	.word	0xa1a40950	! t0_kref+0x2ac:   	fmuld	%f16, %f16, %f16
	.word	0x905cc017	! t0_kref+0x2b0:   	smul	%l3, %l7, %o0
	.word	0xaa048014	! t0_kref+0x2b4:   	add	%l2, %l4, %l5
	.word	0x929cfa18	! t0_kref+0x2b8:   	xorcc	%l3, -0x5e8, %o1
	.word	0x8143e02b	! t0_kref+0x2bc:   	membar	0x2b
	.word	0x8143c000	! t0_kref+0x2c0:   	stbar
	.word	0x9fa3c82e	! t0_kref+0x2c4:   	fadds	%f15, %f14, %f15
	.word	0xa705ebd7	! t0_kref+0x2c8:   	taddcc	%l7, 0xbd7, %l3
	.word	0x908d4012	! t0_kref+0x2cc:   	andcc	%l5, %l2, %o0
	.word	0x3a800008	! t0_kref+0x2d0:   	bcc,a	_kref+0x2f0
	.word	0xdd1fbc60	! t0_kref+0x2d4:   	ldd	[%fp - 0x3a0], %f14
	.word	0xe4263ff4	! t0_kref+0x2d8:   	st	%l2, [%i0 - 0xc]
	.word	0xd83e3ff8	! t0_kref+0x2dc:   	std	%o4, [%i0 - 8]
	.word	0xd83e001d	! t0_kref+0x2e0:   	std	%o4, [%i0 + %i5]
	.word	0xdd3e7ff8	! t0_kref+0x2e4:   	std	%f14, [%i1 - 8]
	.word	0xa3b38eef	! t0_kref+0x2e8:   	fornot2s	%f14, %f15, %f17
	.word	0xe0516adc	! t0_kref+0x2ec:   	ldsh	[%g5 + 0xadc], %l0
	.word	0xa65dc012	! t0_kref+0x2f0:   	smul	%l7, %l2, %l3
	.word	0x35800002	! t0_kref+0x2f4:   	fbue,a	_kref+0x2fc
	.word	0xe968a08a	! t0_kref+0x2f8:   	prefetch	%g2 + 0x8a, 20
	.word	0x81ab8a4c	! t0_kref+0x2fc:   	fcmpd	%fcc0, %f14, %f12
	.word	0xa3b00c20	! t0_kref+0x300:   	fzeros	%f17
	.word	0x99a3882c	! t0_kref+0x304:   	fadds	%f14, %f12, %f12
	.word	0xae5de9ed	! t0_kref+0x308:   	smul	%l7, 0x9ed, %l7
	.word	0xdd380018	! t0_kref+0x30c:   	std	%f14, [%g0 + %i0]
	.word	0x99a388d0	! t0_kref+0x310:   	fsubd	%f14, %f16, %f12
	.word	0xd900a00c	! t0_kref+0x314:   	ld	[%g2 + 0xc], %f12
	.word	0xa81a24a7	! t0_kref+0x318:   	xor	%o0, 0x4a7, %l4
	.word	0x30800008	! t0_kref+0x31c:   	ba,a	_kref+0x33c
	.word	0x8143c000	! t0_kref+0x320:   	stbar
	.word	0x3d800008	! t0_kref+0x324:   	fbule,a	_kref+0x344
	.word	0xa7320015	! t0_kref+0x328:   	srl	%o0, %l5, %l3
	.word	0x9ba0052f	! t0_kref+0x32c:   	fsqrts	%f15, %f13
	.word	0x9db3862c	! t0_kref+0x330:   	fmul8x16	%f14, %f12, %f14
	.word	0xac9c8013	! t0_kref+0x334:   	xorcc	%l2, %l3, %l6
	.word	0xac44b52f	! t0_kref+0x338:   	addc	%l2, -0xad1, %l6
	.word	0x9fa0002d	! t0_kref+0x33c:   	fmovs	%f13, %f15
	.word	0xf83e2000	! t0_kref+0x340:   	std	%i4, [%i0]
	.word	0xebee501d	! t0_kref+0x344:   	prefetcha	%i1 + %i5, 21
	.word	0xa1a0012f	! t0_kref+0x348:   	fabss	%f15, %f16
	.word	0xacfce019	! t0_kref+0x34c:   	sdivcc	%l3, 0x19, %l6
	.word	0xa1a3c931	! t0_kref+0x350:   	fmuls	%f15, %f17, %f16
	.word	0x99a0052f	! t0_kref+0x354:   	fsqrts	%f15, %f12
	.word	0x9075c013	! t0_kref+0x358:   	udiv	%l7, %l3, %o0
	.word	0xe106601c	! t0_kref+0x35c:   	ld	[%i1 + 0x1c], %f16
	.word	0x22480006	! t0_kref+0x360:   	be,a,pt	%icc, _kref+0x378
	.word	0xe9ee101a	! t0_kref+0x364:   	prefetcha	%i0 + %i2, 20
	.word	0xab400000	! t0_kref+0x368:   	mov	%y, %l5
	.word	0x8143c000	! t0_kref+0x36c:   	stbar
	.word	0x3d480003	! t0_kref+0x370:   	fbule,a,pt	%fcc0, _kref+0x37c
	.word	0xd920a034	! t0_kref+0x374:   	st	%f12, [%g2 + 0x34]
	.word	0xdda71018	! t0_kref+0x378:   	sta	%f14, [%i4 + %i0]0x80
	.word	0xd68e9019	! t0_kref+0x37c:   	lduba	[%i2 + %i1]0x80, %o3
	.word	0x9ba00530	! t0_kref+0x380:   	fsqrts	%f16, %f13
	.word	0x35800003	! t0_kref+0x384:   	fbue,a	_kref+0x390
	.word	0xa1a0102d	! t0_kref+0x388:   	fstox	%f13, %f16
	.word	0x32800005	! t0_kref+0x38c:   	bne,a	_kref+0x3a0
	.word	0xe300a03c	! t0_kref+0x390:   	ld	[%g2 + 0x3c], %f17
	.word	0x29800002	! t0_kref+0x394:   	fbl,a	_kref+0x39c
	.word	0xa3b38c70	! t0_kref+0x398:   	fnors	%f14, %f16, %f17
	.word	0x9fa0052d	! t0_kref+0x39c:   	fsqrts	%f13, %f15
	.word	0xb810200c	! t0_kref+0x3a0:   	mov	0xc, %i4
	.word	0xd02e3ffd	! t0_kref+0x3a4:   	stb	%o0, [%i0 - 3]
	.word	0x9ba388af	! t0_kref+0x3a8:   	fsubs	%f14, %f15, %f13
	.word	0xa1a3094e	! t0_kref+0x3ac:   	fmuld	%f12, %f14, %f16
	.word	0xe826401c	! t0_kref+0x3b0:   	st	%l4, [%i1 + %i4]
	.word	0x9da00550	! t0_kref+0x3b4:   	fsqrtd	%f16, %f14
	.word	0xdb801019	! t0_kref+0x3b8:   	lda	[%g0 + %i1]0x80, %f13
	.word	0xa9b480b7	! t0_kref+0x3bc:   	edge16n	%l2, %l7, %l4
	.word	0x9ba000ac	! t0_kref+0x3c0:   	fnegs	%f12, %f13
	.word	0xe808a01b	! t0_kref+0x3c4:   	ldub	[%g2 + 0x1b], %l4
	.word	0xa1a0054c	! t0_kref+0x3c8:   	fsqrtd	%f12, %f16
	.word	0xabb20177	! t0_kref+0x3cc:   	edge32ln	%o0, %l7, %l5
	.word	0xd0360000	! t0_kref+0x3d0:   	sth	%o0, [%i0]
	.word	0x29800002	! t0_kref+0x3d4:   	fbl,a	_kref+0x3dc
	.word	0x9da01090	! t0_kref+0x3d8:   	fxtos	%f16, %f14
	.word	0xae1a0013	! t0_kref+0x3dc:   	xor	%o0, %l3, %l7
	.word	0xd9b81019	! t0_kref+0x3e0:   	stda	%f12, [%g0 + %i1]0x80
	.word	0xebee101c	! t0_kref+0x3e4:   	prefetcha	%i0 + %i4, 21
	.word	0x99a0054c	! t0_kref+0x3e8:   	fsqrtd	%f12, %f12
	.word	0x968d60d7	! t0_kref+0x3ec:   	andcc	%l5, 0xd7, %o3
	.word	0x81ab0ad0	! t0_kref+0x3f0:   	fcmped	%fcc0, %f12, %f16
	.word	0x9db40a50	! t0_kref+0x3f4:   	fpadd32	%f16, %f16, %f14
	.word	0x81ab8aae	! t0_kref+0x3f8:   	fcmpes	%fcc0, %f14, %f14
	.word	0xd026401c	! t0_kref+0x3fc:   	st	%o0, [%i1 + %i4]
	.word	0xa1a0054e	! t0_kref+0x400:   	fsqrtd	%f14, %f16
	.word	0xef68a00a	! t0_kref+0x404:   	prefetch	%g2 + 0xa, 23
	.word	0xc9ee1016	! t0_kref+0x408:   	prefetcha	%i0 + %l6, 4
	.word	0xe1380018	! t0_kref+0x40c:   	std	%f16, [%g0 + %i0]
	.word	0xa51dec93	! t0_kref+0x410:   	tsubcctv	%l7, 0xc93, %l2
	.word	0x32480002	! t0_kref+0x414:   	bne,a,pt	%icc, _kref+0x41c
	.word	0x972a201b	! t0_kref+0x418:   	sll	%o0, 0x1b, %o3
	.word	0x9fa000ad	! t0_kref+0x41c:   	fnegs	%f13, %f15
	.word	0x31480002	! t0_kref+0x420:   	fba,a,pt	%fcc0, _kref+0x428
	.word	0xa52dc017	! t0_kref+0x424:   	sll	%l7, %l7, %l2
	.word	0xd83e6000	! t0_kref+0x428:   	std	%o4, [%i1]
	.word	0xe0ee501a	! t0_kref+0x42c:   	ldstuba	[%i1 + %i2]0x80, %l0
	.word	0x99b38c90	! t0_kref+0x430:   	fandnot2	%f14, %f16, %f12
	.word	0x94fd8013	! t0_kref+0x434:   	sdivcc	%l6, %l3, %o2
	.word	0x81ac0ab1	! t0_kref+0x438:   	fcmpes	%fcc0, %f16, %f17
	.word	0x9105294c	! t0_kref+0x43c:   	taddcc	%l4, 0x94c, %o0
	.word	0x9da409d0	! t0_kref+0x440:   	fdivd	%f16, %f16, %f14
	.word	0x925def5c	! t0_kref+0x444:   	smul	%l7, 0xf5c, %o1
	.word	0xd028a023	! t0_kref+0x448:   	stb	%o0, [%g2 + 0x23]
	.word	0xabb58037	! t0_kref+0x44c:   	edge8n	%l6, %l7, %l5
	.word	0x99a0052e	! t0_kref+0x450:   	fsqrts	%f14, %f12
	.word	0xa3a018cc	! t0_kref+0x454:   	fdtos	%f12, %f17
	.word	0xa474c012	! t0_kref+0x458:   	udiv	%l3, %l2, %l2
	.word	0xa4f235e8	! t0_kref+0x45c:   	udivcc	%o0, -0xa18, %l2
	.word	0x24800002	! t0_kref+0x460:   	ble,a	_kref+0x468
	.word	0xae9cc017	! t0_kref+0x464:   	xorcc	%l3, %l7, %l7
	.word	0xaa9c8017	! t0_kref+0x468:   	xorcc	%l2, %l7, %l5
	.word	0x2e800001	! t0_kref+0x46c:   	bvs,a	_kref+0x470
	.word	0xf96e7fe0	! t0_kref+0x470:   	prefetch	%i1 - 0x20, 28
	.word	0xe6367ff2	! t0_kref+0x474:   	sth	%l3, [%i1 - 0xe]
	.word	0x9ba00031	! t0_kref+0x478:   	fmovs	%f17, %f13
	.word	0xc12e200c	! t0_kref+0x47c:   	st	%fsr, [%i0 + 0xc]
	.word	0xe668a031	! t0_kref+0x480:   	ldstub	[%g2 + 0x31], %l3
	.word	0x99b4472e	! t0_kref+0x484:   	fmuld8ulx16	%f17, %f14, %f12
	.word	0x9244e21d	! t0_kref+0x488:   	addc	%l3, 0x21d, %o1
	.word	0x28800001	! t0_kref+0x48c:   	bleu,a	_kref+0x490
	.word	0x9fa018cc	! t0_kref+0x490:   	fdtos	%f12, %f15
	.word	0xaa92272c	! t0_kref+0x494:   	orcc	%o0, 0x72c, %l5
	.word	0xa7b4040e	! t0_kref+0x498:   	fcmple16	%f16, %f14, %l3
	.word	0xe8364000	! t0_kref+0x49c:   	sth	%l4, [%i1]
	.word	0xaf400000	! t0_kref+0x4a0:   	mov	%y, %l7
	.word	0xa4650013	! t0_kref+0x4a4:   	subc	%l4, %l3, %l2
	.word	0xd9380019	! t0_kref+0x4a8:   	std	%f12, [%g0 + %i1]
	.word	0x2f3b21a2	! t0_kref+0x4ac:   	sethi	%hi(0xec868800), %l7
	.word	0xe6266010	! t0_kref+0x4b0:   	st	%l3, [%i1 + 0x10]
	.word	0x9444e866	! t0_kref+0x4b4:   	addc	%l3, 0x866, %o2
	.word	0xf83e2000	! t0_kref+0x4b8:   	std	%i4, [%i0]
	.word	0x9ba0002f	! t0_kref+0x4bc:   	fmovs	%f15, %f13
	.word	0xec28a033	! t0_kref+0x4c0:   	stb	%l6, [%g2 + 0x33]
	.word	0x8610200e	! t0_kref+0x4c4:   	mov	0xe, %g3
	.word	0x86a0e001	! t0_kref+0x4c8:   	subcc	%g3, 1, %g3
	.word	0x2280000a	! t0_kref+0x4cc:   	be,a	_kref+0x4f4
	.word	0xee8e501a	! t0_kref+0x4d0:   	lduba	[%i1 + %i2]0x80, %l7
	.word	0xdf26201c	! t0_kref+0x4d4:   	st	%f15, [%i0 + 0x1c]
	.word	0x99a00550	! t0_kref+0x4d8:   	fsqrtd	%f16, %f12
	.word	0x9fa409ad	! t0_kref+0x4dc:   	fdivs	%f16, %f13, %f15
	.word	0xe300a00c	! t0_kref+0x4e0:   	ld	[%g2 + 0xc], %f17
	.word	0x965d2fca	! t0_kref+0x4e4:   	smul	%l4, 0xfca, %o3
	.word	0xe6262018	! t0_kref+0x4e8:   	st	%l3, [%i0 + 0x18]
	.word	0x25800004	! t0_kref+0x4ec:   	fblg,a	_kref+0x4fc
	.word	0xee767fe8	! t0_kref+0x4f0:   	stx	%l7, [%i1 - 0x18]
	.word	0xd9bf5019	! t0_kref+0x4f4:   	stda	%f12, [%i5 + %i1]0x80
	.word	0xd07e4000	! t0_kref+0x4f8:   	swap	[%i1], %o0
	.word	0x28480008	! t0_kref+0x4fc:   	bleu,a,pt	%icc, _kref+0x51c
	.word	0xd9066018	! t0_kref+0x500:   	ld	[%i1 + 0x18], %f12
	.word	0x25800006	! t0_kref+0x504:   	fblg,a	_kref+0x51c
	.word	0x99b3c6ad	! t0_kref+0x508:   	fmul8x16al	%f15, %f13, %f12
	.word	0x34800008	! t0_kref+0x50c:   	bg,a	_kref+0x52c
	.word	0x9db40e0c	! t0_kref+0x510:   	fand	%f16, %f12, %f14
	.word	0xaab48008	! t0_kref+0x514:   	orncc	%l2, %o0, %l5
	.word	0xd010a02c	! t0_kref+0x518:   	lduh	[%g2 + 0x2c], %o0
	.word	0xa1b30a10	! t0_kref+0x51c:   	fpadd16	%f12, %f16, %f16
	.word	0xe8270019	! t0_kref+0x520:   	st	%l4, [%i4 + %i1]
	.word	0xaead0015	! t0_kref+0x524:   	andncc	%l4, %l5, %l7
	.word	0xd2865000	! t0_kref+0x528:   	lda	[%i1]0x80, %o1
	.word	0x907cc017	! t0_kref+0x52c:   	sdiv	%l3, %l7, %o0
	.word	0x9da018ce	! t0_kref+0x530:   	fdtos	%f14, %f14
	.word	0xa1a4084c	! t0_kref+0x534:   	faddd	%f16, %f12, %f16
	.word	0xa1a3c8b0	! t0_kref+0x538:   	fsubs	%f15, %f16, %f16
	.word	0xea30a026	! t0_kref+0x53c:   	sth	%l5, [%g2 + 0x26]
	.word	0xd86e600d	! t0_kref+0x540:   	ldstub	[%i1 + 0xd], %o4
	.word	0xa6ad3af2	! t0_kref+0x544:   	andncc	%l4, -0x50e, %l3
	.word	0x22800003	! t0_kref+0x548:   	be,a	_kref+0x554
	.word	0xaa8d2299	! t0_kref+0x54c:   	andcc	%l4, 0x299, %l5
	.word	0x9db40af0	! t0_kref+0x550:   	fpsub32s	%f16, %f16, %f14
	.word	0xec367fec	! t0_kref+0x554:   	sth	%l6, [%i1 - 0x14]
	.word	0xae8cb0b4	! t0_kref+0x558:   	andcc	%l2, -0xf4c, %l7
	.word	0xee262010	! t0_kref+0x55c:   	st	%l7, [%i0 + 0x10]
	.word	0xe13e3ff0	! t0_kref+0x560:   	std	%f16, [%i0 - 0x10]
	.word	0xe4a6501c	! t0_kref+0x564:   	sta	%l2, [%i1 + %i4]0x80
	.word	0xac74e610	! t0_kref+0x568:   	udiv	%l3, 0x610, %l6
	.word	0x99a4084e	! t0_kref+0x56c:   	faddd	%f16, %f14, %f12
	.word	0xc5ee5012	! t0_kref+0x570:   	prefetcha	%i1 + %l2, 2
	.word	0xaef50015	! t0_kref+0x574:   	udivcc	%l4, %l5, %l7
	.word	0x99a308ce	! t0_kref+0x578:   	fsubd	%f12, %f14, %f12
	.word	0x9da4084e	! t0_kref+0x57c:   	faddd	%f16, %f14, %f14
	.word	0x2d800006	! t0_kref+0x580:   	fbg,a	_kref+0x598
	.word	0x81dbc010	! t0_kref+0x584:   	flush	%o7 + %l0
	.word	0x27480007	! t0_kref+0x588:   	fbul,a,pt	%fcc0, _kref+0x5a4
	.word	0xae8c8016	! t0_kref+0x58c:   	andcc	%l2, %l6, %l7
	.word	0x95418000	! t0_kref+0x590:   	mov	%fprs, %o2
	.word	0x9ba01a4e	! t0_kref+0x594:   	fdtoi	%f14, %f13
	.word	0x9ba0052f	! t0_kref+0x598:   	fsqrts	%f15, %f13
	.word	0x9da388b1	! t0_kref+0x59c:   	fsubs	%f14, %f17, %f14
	.word	0xa5b3058c	! t0_kref+0x5a0:   	fcmpgt32	%f12, %f12, %l2
	.word	0x1331dcc0	! t0_kref+0x5a4:   	sethi	%hi(0xc7730000), %o1
	.word	0xea280019	! t0_kref+0x5a8:   	stb	%l5, [%g0 + %i1]
	.word	0xf1ee101b	! t0_kref+0x5ac:   	prefetcha	%i0 + %i3, 24
	.word	0xa6acb620	! t0_kref+0x5b0:   	andncc	%l2, -0x9e0, %l3
	.word	0xc368a088	! t0_kref+0x5b4:   	prefetch	%g2 + 0x88, 1
	.word	0x9ba0012e	! t0_kref+0x5b8:   	fabss	%f14, %f13
	.word	0xa1b00cce	! t0_kref+0x5bc:   	fnot2	%f14, %f16
	.word	0x28480005	! t0_kref+0x5c0:   	bleu,a,pt	%icc, _kref+0x5d4
	.word	0xa1b30d0c	! t0_kref+0x5c4:   	fandnot1	%f12, %f12, %f16
	.word	0xa8854008	! t0_kref+0x5c8:   	addcc	%l5, %o0, %l4
	.word	0xaf418000	! t0_kref+0x5cc:   	mov	%fprs, %l7
	.word	0xa8a5c012	! t0_kref+0x5d0:   	subcc	%l7, %l2, %l4
	.word	0x2c800006	! t0_kref+0x5d4:   	bneg,a	_kref+0x5ec
	.word	0xaf400000	! t0_kref+0x5d8:   	mov	%y, %l7
	.word	0x3b480006	! t0_kref+0x5dc:   	fble,a,pt	%fcc0, _kref+0x5f4
	.word	0xad2c8017	! t0_kref+0x5e0:   	sll	%l2, %l7, %l6
	.word	0xd7003f78	! t0_kref+0x5e4:   	ld	[%g0 - 0x88], %f11
	.word	0x948d4014	! t0_kref+0x5e8:   	andcc	%l5, %l4, %o2
	.word	0x8143c000	! t0_kref+0x5ec:   	stbar
	.word	0xd25e4000	! t0_kref+0x5f0:   	ldx	[%i1], %o1
	.word	0xac0dc012	! t0_kref+0x5f4:   	and	%l7, %l2, %l6
	.word	0x91b20032	! t0_kref+0x5f8:   	edge8n	%o0, %l2, %o0
	.word	0x9475abb5	! t0_kref+0x5fc:   	udiv	%l6, 0xbb5, %o2
	.word	0x9db40f8e	! t0_kref+0x600:   	for	%f16, %f14, %f14
	.word	0xe968a04f	! t0_kref+0x604:   	prefetch	%g2 + 0x4f, 20
	.word	0x3f800003	! t0_kref+0x608:   	fbo,a	_kref+0x614
	.word	0xdf20a004	! t0_kref+0x60c:   	st	%f15, [%g2 + 4]
	.word	0xea00a03c	! t0_kref+0x610:   	ld	[%g2 + 0x3c], %l5
	.word	0xe6467ff4	! t0_kref+0x614:   	ldsw	[%i1 - 0xc], %l3
	.word	0xec30a002	! t0_kref+0x618:   	sth	%l6, [%g2 + 2]
	.word	0xe630a026	! t0_kref+0x61c:   	sth	%l3, [%g2 + 0x26]
	.word	0x9fa3882e	! t0_kref+0x620:   	fadds	%f14, %f14, %f15
	.word	0x9ba408ac	! t0_kref+0x624:   	fsubs	%f16, %f12, %f13
	.word	0x9fb0076e	! t0_kref+0x628:   	fpack16	%f14, %f15
	.word	0xd83e7ff0	! t0_kref+0x62c:   	std	%o4, [%i1 - 0x10]
	.word	0x9da389d0	! t0_kref+0x630:   	fdivd	%f14, %f16, %f14
	.word	0x81da24e2	! t0_kref+0x634:   	flush	%o0 + 0x4e2
	.word	0x99a0054e	! t0_kref+0x638:   	fsqrtd	%f14, %f12
	.word	0x99a0052c	! t0_kref+0x63c:   	fsqrts	%f12, %f12
	.word	0x3c480003	! t0_kref+0x640:   	bpos,a,pt	%icc, _kref+0x64c
	.word	0x99a4094e	! t0_kref+0x644:   	fmuld	%f16, %f14, %f12
	.word	0x99b00cce	! t0_kref+0x648:   	fnot2	%f14, %f12
	.word	0x99b3c6ae	! t0_kref+0x64c:   	fmul8x16al	%f15, %f14, %f12
	.word	0xd0263fec	! t0_kref+0x650:   	st	%o0, [%i0 - 0x14]
	.word	0x8143e02c	! t0_kref+0x654:   	membar	0x2c
	.word	0xe2680018	! t0_kref+0x658:   	ldstub	[%g0 + %i0], %l1
	.word	0xe49e501d	! t0_kref+0x65c:   	ldda	[%i1 + %i5]0x80, %l2
	.word	0x903ca9da	! t0_kref+0x660:   	xnor	%l2, 0x9da, %o0
	.word	0xaa5db678	! t0_kref+0x664:   	smul	%l6, -0x988, %l5
	.word	0x27480005	! t0_kref+0x668:   	fbul,a,pt	%fcc0, _kref+0x67c
	.word	0xa1a308ad	! t0_kref+0x66c:   	fsubs	%f12, %f13, %f16
	.word	0xd9e65013	! t0_kref+0x670:   	casa	[%i1]0x80, %l3, %o4
	.word	0x99a409cc	! t0_kref+0x674:   	fdivd	%f16, %f12, %f12
	.word	0xa8f22904	! t0_kref+0x678:   	udivcc	%o0, 0x904, %l4
	.word	0x2f0b7589	! t0_kref+0x67c:   	sethi	%hi(0x2dd62400), %l7
	.word	0xac04c013	! t0_kref+0x680:   	add	%l3, %l3, %l6
	.word	0xdd1f4018	! t0_kref+0x684:   	ldd	[%i5 + %i0], %f14
	.word	0x9da0012c	! t0_kref+0x688:   	fabss	%f12, %f14
	.word	0xee30a006	! t0_kref+0x68c:   	sth	%l7, [%g2 + 6]
	.word	0x9225f5c2	! t0_kref+0x690:   	sub	%l7, -0xa3e, %o1
	.word	0xa3b44dec	! t0_kref+0x694:   	fnands	%f17, %f12, %f17
	.word	0xaa6231ee	! t0_kref+0x698:   	subc	%o0, -0xe12, %l5
	.word	0x945db396	! t0_kref+0x69c:   	smul	%l6, -0xc6a, %o2
	.word	0xa404c013	! t0_kref+0x6a0:   	add	%l3, %l3, %l2
	.word	0x94b22c17	! t0_kref+0x6a4:   	orncc	%o0, 0xc17, %o2
	.word	0xe1380018	! t0_kref+0x6a8:   	std	%f16, [%g0 + %i0]
	.word	0xe830a00c	! t0_kref+0x6ac:   	sth	%l4, [%g2 + 0xc]
	.word	0x25800005	! t0_kref+0x6b0:   	fblg,a	_kref+0x6c4
	.word	0xee4e201f	! t0_kref+0x6b4:   	ldsb	[%i0 + 0x1f], %l7
	.word	0x32800006	! t0_kref+0x6b8:   	bne,a	_kref+0x6d0
	.word	0x92b5e153	! t0_kref+0x6bc:   	orncc	%l7, 0x153, %o1
	.word	0xa1a00530	! t0_kref+0x6c0:   	fsqrts	%f16, %f16
	.word	0xa3a00531	! t0_kref+0x6c4:   	fsqrts	%f17, %f17
	.word	0xe8d81018	! t0_kref+0x6c8:   	ldxa	[%g0 + %i0]0x80, %l4
	.word	0x39800003	! t0_kref+0x6cc:   	fbuge,a	_kref+0x6d8
	.word	0x9db38750	! t0_kref+0x6d0:   	fpack32	%f14, %f16, %f14
	.word	0x9fa00530	! t0_kref+0x6d4:   	fsqrts	%f16, %f15
	.word	0x9405aa78	! t0_kref+0x6d8:   	add	%l6, 0xa78, %o2
	.word	0x9da0002d	! t0_kref+0x6dc:   	fmovs	%f13, %f14
	.word	0xb4102009	! t0_kref+0x6e0:   	mov	0x9, %i2
	.word	0x8143c000	! t0_kref+0x6e4:   	stbar
	.word	0x99a4094c	! t0_kref+0x6e8:   	fmuld	%f16, %f12, %f12
	.word	0xe13e6018	! t0_kref+0x6ec:   	std	%f16, [%i1 + 0x18]
	.word	0xacb5bed9	! t0_kref+0x6f0:   	orncc	%l6, -0x127, %l6
	.word	0x2b800008	! t0_kref+0x6f4:   	fbug,a	_kref+0x714
	.word	0x94154008	! t0_kref+0x6f8:   	or	%l5, %o0, %o2
	.word	0xa3a3492f	! t0_kref+0x6fc:   	fmuls	%f13, %f15, %f17
	.word	0x905a37e8	! t0_kref+0x700:   	smul	%o0, -0x818, %o0
	.word	0xdf060000	! t0_kref+0x704:   	ld	[%i0], %f15
	.word	0x81dc800a	! t0_kref+0x708:   	flush	%l2 + %o2
	.word	0x96348013	! t0_kref+0x70c:   	orn	%l2, %l3, %o3
	.word	0xe01e2000	! t0_kref+0x710:   	ldd	[%i0], %l0
	.word	0xa1b3896e	! t0_kref+0x714:   	fpmerge	%f14, %f14, %f16
	.word	0x99a30830	! t0_kref+0x718:   	fadds	%f12, %f16, %f12
	.word	0x9de3bfa0	! t0_kref+0x71c:   	save	%sp, -0x60, %sp
	.word	0xb4b7347f	! t0_kref+0x720:   	orncc	%i4, -0xb81, %i2
	.word	0x95eec018	! t0_kref+0x724:   	restore	%i3, %i0, %o2
	.word	0x9da3c8af	! t0_kref+0x728:   	fsubs	%f15, %f15, %f14
	.word	0x972d0014	! t0_kref+0x72c:   	sll	%l4, %l4, %o3
	.word	0x9ba00531	! t0_kref+0x730:   	fsqrts	%f17, %f13
	.word	0x2f800002	! t0_kref+0x734:   	fbu,a	_kref+0x73c
	.word	0x99a408cc	! t0_kref+0x738:   	fsubd	%f16, %f12, %f12
	.word	0xaa1d3ff4	! t0_kref+0x73c:   	xor	%l4, -0xc, %l5
	.word	0xe62e7ffd	! t0_kref+0x740:   	stb	%l3, [%i1 - 3]
	.word	0xe3871018	! t0_kref+0x744:   	lda	[%i4 + %i0]0x80, %f17
	.word	0xa1a40950	! t0_kref+0x748:   	fmuld	%f16, %f16, %f16
	.word	0x2a800002	! t0_kref+0x74c:   	bcs,a	_kref+0x754
	.word	0x97b54016	! t0_kref+0x750:   	edge8	%l5, %l6, %o3
	.word	0xa1a308cc	! t0_kref+0x754:   	fsubd	%f12, %f12, %f16
	.word	0xabb3854e	! t0_kref+0x758:   	fcmpeq16	%f14, %f14, %l5
	.word	0xa1a4492c	! t0_kref+0x75c:   	fmuls	%f17, %f12, %f16
	.word	0x9505fda2	! t0_kref+0x760:   	taddcc	%l7, -0x25e, %o2
	.word	0x9db40df0	! t0_kref+0x764:   	fnands	%f16, %f16, %f14
	.word	0xa1a00550	! t0_kref+0x768:   	fsqrtd	%f16, %f16
	.word	0xdd3e401d	! t0_kref+0x76c:   	std	%f14, [%i1 + %i5]
	.word	0x9daa402d	! t0_kref+0x770:   	fmovse	%fcc0, %f13, %f14
	.word	0x9464b8e9	! t0_kref+0x774:   	subc	%l2, -0x717, %o2
	.word	0xdb801018	! t0_kref+0x778:   	lda	[%g0 + %i0]0x80, %f13
	.word	0xa5400000	! t0_kref+0x77c:   	mov	%y, %l2
	.word	0x949cc016	! t0_kref+0x780:   	xorcc	%l3, %l6, %o2
	.word	0xed68a009	! t0_kref+0x784:   	prefetch	%g2 + 9, 22
	.word	0xa67d3da3	! t0_kref+0x788:   	sdiv	%l4, -0x25d, %l3
	.word	0x9da0192f	! t0_kref+0x78c:   	fstod	%f15, %f14
	.word	0xd0200018	! t0_kref+0x790:   	st	%o0, [%g0 + %i0]
	.word	0x3f800003	! t0_kref+0x794:   	fbo,a	_kref+0x7a0
	.word	0xa1a0054c	! t0_kref+0x798:   	fsqrtd	%f12, %f16
	.word	0xa1a308ce	! t0_kref+0x79c:   	fsubd	%f12, %f14, %f16
	.word	0x81da7874	! t0_kref+0x7a0:   	flush	%o1 - 0x78c
	.word	0xf36e001b	! t0_kref+0x7a4:   	prefetch	%i0 + %i3, 25
	.word	0xec36401b	! t0_kref+0x7a8:   	sth	%l6, [%i1 + %i3]
	.word	0x96adb149	! t0_kref+0x7ac:   	andncc	%l6, -0xeb7, %o3
	.word	0xe1bf5019	! t0_kref+0x7b0:   	stda	%f16, [%i5 + %i1]0x80
	.word	0x3e800004	! t0_kref+0x7b4:   	bvc,a	_kref+0x7c4
	.word	0xab2d8014	! t0_kref+0x7b8:   	sll	%l6, %l4, %l5
	.word	0x81ddc013	! t0_kref+0x7bc:   	flush	%l7 + %l3
	.word	0xe448a002	! t0_kref+0x7c0:   	ldsb	[%g2 + 2], %l2
	.word	0xe81f4018	! t0_kref+0x7c4:   	ldd	[%i5 + %i0], %l4
	.word	0x949c8012	! t0_kref+0x7c8:   	xorcc	%l2, %l2, %o2
	.word	0xd9000019	! t0_kref+0x7cc:   	ld	[%g0 + %i1], %f12
	.word	0xafb405cc	! t0_kref+0x7d0:   	fcmpeq32	%f16, %f12, %l7
	.word	0x9da389d0	! t0_kref+0x7d4:   	fdivd	%f14, %f16, %f14
	.word	0x91418000	! t0_kref+0x7d8:   	mov	%fprs, %o0
	.word	0x9fa01a50	! t0_kref+0x7dc:   	fdtoi	%f16, %f15
	.word	0x99b3cef0	! t0_kref+0x7e0:   	fornot2s	%f15, %f16, %f12
	.word	0xa1a00531	! t0_kref+0x7e4:   	fsqrts	%f17, %f16
	.word	0x960ce73a	! t0_kref+0x7e8:   	and	%l3, 0x73a, %o3
	.word	0x961cecc0	! t0_kref+0x7ec:   	xor	%l3, 0xcc0, %o3
	.word	0x9bb44d30	! t0_kref+0x7f0:   	fandnot1s	%f17, %f16, %f13
	.word	0xa1a00550	! t0_kref+0x7f4:   	fsqrtd	%f16, %f16
	.word	0xa6f48008	! t0_kref+0x7f8:   	udivcc	%l2, %o0, %l3
	.word	0x99a00550	! t0_kref+0x7fc:   	fsqrtd	%f16, %f12
	.word	0xf7ee101a	! t0_kref+0x800:   	prefetcha	%i0 + %i2, 27
	.word	0xebee501a	! t0_kref+0x804:   	prefetcha	%i1 + %i2, 21
	.word	0x9ba0012d	! t0_kref+0x808:   	fabss	%f13, %f13
	.word	0x20800008	! t0_kref+0x80c:   	bn,a	_kref+0x82c
	.word	0xd1f61012	! t0_kref+0x810:   	casxa	[%i0]0x80, %l2, %o0
	.word	0x9da0002f	! t0_kref+0x814:   	fmovs	%f15, %f14
	.word	0x94658008	! t0_kref+0x818:   	subc	%l6, %o0, %o2
	.word	0x9fa0108c	! t0_kref+0x81c:   	fxtos	%f12, %f15
	.word	0xd8bf5019	! t0_kref+0x820:   	stda	%o4, [%i5 + %i1]0x80
	.word	0xd9be5896	! t0_kref+0x824:   	stda	%f12, [%i1 + %l6]0xc4
	.word	0xa8b4fa95	! t0_kref+0x828:   	orncc	%l3, -0x56b, %l4
	.word	0x32800004	! t0_kref+0x82c:   	bne,a	_kref+0x83c
	.word	0xe428a00a	! t0_kref+0x830:   	stb	%l2, [%g2 + 0xa]
	.word	0x93b54052	! t0_kref+0x834:   	edge8l	%l5, %l2, %o1
	.word	0xe4480019	! t0_kref+0x838:   	ldsb	[%g0 + %i1], %l2
	.word	0x943d6740	! t0_kref+0x83c:   	xnor	%l5, 0x740, %o2
	.word	0x99b30f8c	! t0_kref+0x840:   	for	%f12, %f12, %f12
	.word	0x9de3bfa0	! t0_kref+0x844:   	save	%sp, -0x60, %sp
	.word	0xb496ba2e	! t0_kref+0x848:   	orcc	%i2, -0x5d2, %i2
	.word	0xafee801c	! t0_kref+0x84c:   	restore	%i2, %i4, %l7
	.word	0xae5d7d43	! t0_kref+0x850:   	smul	%l5, -0x2bd, %l7
	.word	0x99b30cac	! t0_kref+0x854:   	fandnot2s	%f12, %f12, %f12
	.word	0xdd064000	! t0_kref+0x858:   	ld	[%i1], %f14
	.word	0xa1a0052e	! t0_kref+0x85c:   	fsqrts	%f14, %f16
	.word	0x20800006	! t0_kref+0x860:   	bn,a	_kref+0x878
	.word	0xa865fc97	! t0_kref+0x864:   	subc	%l7, -0x369, %l4
	.word	0xae8c8014	! t0_kref+0x868:   	andcc	%l2, %l4, %l7
	.word	0x31800004	! t0_kref+0x86c:   	fba,a	_kref+0x87c
	.word	0xabb58353	! t0_kref+0x870:   	alignaddrl	%l6, %l3, %l5
	.word	0xe8a61000	! t0_kref+0x874:   	sta	%l4, [%i0]0x80
	.word	0xa655c012	! t0_kref+0x878:   	umul	%l7, %l2, %l3
	.word	0xa1a0054e	! t0_kref+0x87c:   	fsqrtd	%f14, %f16
	.word	0xdd3e001d	! t0_kref+0x880:   	std	%f14, [%i0 + %i5]
	.word	0x27800001	! t0_kref+0x884:   	fbul,a	_kref+0x888
	.word	0x99a00550	! t0_kref+0x888:   	fsqrtd	%f16, %f12
	.word	0x9744c000	! t0_kref+0x88c:   	mov	%gsr, %o3
	.word	0x22800007	! t0_kref+0x890:   	be,a	_kref+0x8ac
	.word	0xc0780018	! t0_kref+0x894:   	swap	[%g0 + %i0], %g0
	.word	0x961cc014	! t0_kref+0x898:   	xor	%l3, %l4, %o3
	.word	0xec2e2006	! t0_kref+0x89c:   	stb	%l6, [%i0 + 6]
	.word	0x81dd0001	! t0_kref+0x8a0:   	flush	%l4 + %g1
	.word	0xd4480019	! t0_kref+0x8a4:   	ldsb	[%g0 + %i1], %o2
	.word	0x9fc00004	! t0_kref+0x8a8:   	call	%g0 + %g4
	.word	0xa1b4096c	! t0_kref+0x8ac:   	fpmerge	%f16, %f12, %f16
	.word	0xd9be6010	! t0_kref+0x8b0:   	stda	%f12, [%i1 + 0x10]%asi
	.word	0x9de3bfa0	! t0_kref+0x8b4:   	save	%sp, -0x60, %sp
	.word	0x93ee3281	! t0_kref+0x8b8:   	restore	%i0, -0xd7f, %o1
	.word	0xa6d4fe08	! t0_kref+0x8bc:   	umulcc	%l3, -0x1f8, %l3
	.word	0xdd1e0000	! t0_kref+0x8c0:   	ldd	[%i0], %f14
	.word	0xa1a00031	! t0_kref+0x8c4:   	fmovs	%f17, %f16
	.word	0xe0180019	! t0_kref+0x8c8:   	ldd	[%g0 + %i1], %l0
	.word	0xa1a0054c	! t0_kref+0x8cc:   	fsqrtd	%f12, %f16
	.word	0x29480003	! t0_kref+0x8d0:   	fbl,a,pt	%fcc0, _kref+0x8dc
	.word	0xa40d4012	! t0_kref+0x8d4:   	and	%l5, %l2, %l2
	.word	0xe3f65013	! t0_kref+0x8d8:   	casxa	[%i1]0x80, %l3, %l1
	.word	0x9da0052e	! t0_kref+0x8dc:   	fsqrts	%f14, %f14
	.word	0xaefd8016	! t0_kref+0x8e0:   	sdivcc	%l6, %l6, %l7
	.word	0xa3a408af	! t0_kref+0x8e4:   	fsubs	%f16, %f15, %f17
	.word	0x99a0052c	! t0_kref+0x8e8:   	fsqrts	%f12, %f12
	.word	0xadb384d0	! t0_kref+0x8ec:   	fcmpne32	%f14, %f16, %l6
	.word	0x9ba3892c	! t0_kref+0x8f0:   	fmuls	%f14, %f12, %f13
	.word	0x9da309ce	! t0_kref+0x8f4:   	fdivd	%f12, %f14, %f14
	.word	0xa3a0002e	! t0_kref+0x8f8:   	fmovs	%f14, %f17
	.word	0xa1a309d0	! t0_kref+0x8fc:   	fdivd	%f12, %f16, %f16
	.word	0x27800008	! t0_kref+0x900:   	fbul,a	_kref+0x920
	.word	0xaa623079	! t0_kref+0x904:   	subc	%o0, -0xf87, %l5
	.word	0xe1070019	! t0_kref+0x908:   	ld	[%i4 + %i1], %f16
	.word	0x9db00cd0	! t0_kref+0x90c:   	fnot2	%f16, %f14
	.word	0xdd1e2018	! t0_kref+0x910:   	ldd	[%i0 + 0x18], %f14
	.word	0x9ba0052c	! t0_kref+0x914:   	fsqrts	%f12, %f13
	.word	0x99a018d0	! t0_kref+0x918:   	fdtos	%f16, %f12
	.word	0x99a4094c	! t0_kref+0x91c:   	fmuld	%f16, %f12, %f12
	.word	0xa69dbd3e	! t0_kref+0x920:   	xorcc	%l6, -0x2c2, %l3
	.word	0x99a01a2c	! t0_kref+0x924:   	fstoi	%f12, %f12
	.word	0xe66e0000	! t0_kref+0x928:   	ldstub	[%i0], %l3
	.word	0xa1b30a8c	! t0_kref+0x92c:   	fpsub16	%f12, %f12, %f16
	.word	0x9da00550	! t0_kref+0x930:   	fsqrtd	%f16, %f14
	.word	0xa1a0054e	! t0_kref+0x934:   	fsqrtd	%f14, %f16
	.word	0xdf263fe8	! t0_kref+0x938:   	st	%f15, [%i0 - 0x18]
	.word	0x9da409d0	! t0_kref+0x93c:   	fdivd	%f16, %f16, %f14
	.word	0x9fa349af	! t0_kref+0x940:   	fdivs	%f13, %f15, %f15
	.word	0xdd380018	! t0_kref+0x944:   	std	%f14, [%g0 + %i0]
	.word	0xdd060000	! t0_kref+0x948:   	ld	[%i0], %f14
	.word	0xa1b3ccac	! t0_kref+0x94c:   	fandnot2s	%f15, %f12, %f16
	.word	0xec901019	! t0_kref+0x950:   	lduha	[%g0 + %i1]0x80, %l6
	.word	0xac948016	! t0_kref+0x954:   	orcc	%l2, %l6, %l6
	.word	0x99a3884c	! t0_kref+0x958:   	faddd	%f14, %f12, %f12
	.word	0x32800003	! t0_kref+0x95c:   	bne,a	_kref+0x968
	.word	0x9da4094c	! t0_kref+0x960:   	fmuld	%f16, %f12, %f14
	.word	0xd9be1856	! t0_kref+0x964:   	stda	%f12, [%i0 + %l6]0xc2
	.word	0x9765a498	! t0_kref+0x968:   	movneg	%icc, -0x368, %o3
	.word	0x99a3c931	! t0_kref+0x96c:   	fmuls	%f15, %f17, %f12
	.word	0xdd3e401d	! t0_kref+0x970:   	std	%f14, [%i1 + %i5]
	.word	0xaf354017	! t0_kref+0x974:   	srl	%l5, %l7, %l7
	.word	0x24800005	! t0_kref+0x978:   	ble,a	_kref+0x98c
	.word	0xe320a030	! t0_kref+0x97c:   	st	%f17, [%g2 + 0x30]
	.word	0x9da0002c	! t0_kref+0x980:   	fmovs	%f12, %f14
	.word	0xe168a00e	! t0_kref+0x984:   	prefetch	%g2 + 0xe, 16
	.word	0xe11e2000	! t0_kref+0x988:   	ldd	[%i0], %f16
	.word	0xab418000	! t0_kref+0x98c:   	mov	%fprs, %l5
	.word	0x22480008	! t0_kref+0x990:   	be,a,pt	%icc, _kref+0x9b0
	.word	0x99b00cd0	! t0_kref+0x994:   	fnot2	%f16, %f12
	.word	0x9335200c	! t0_kref+0x998:   	srl	%l4, 0xc, %o1
	.word	0x22800002	! t0_kref+0x99c:   	be,a	_kref+0x9a4
	.word	0xea2e401a	! t0_kref+0x9a0:   	stb	%l5, [%i1 + %i2]
	.word	0xa1a30930	! t0_kref+0x9a4:   	fmuls	%f12, %f16, %f16
	.word	0xa4658008	! t0_kref+0x9a8:   	subc	%l6, %o0, %l2
	.word	0xa3a388b0	! t0_kref+0x9ac:   	fsubs	%f14, %f16, %f17
	.word	0x81abcaae	! t0_kref+0x9b0:   	fcmpes	%fcc0, %f15, %f14
	.word	0x99a0054c	! t0_kref+0x9b4:   	fsqrtd	%f12, %f12
	.word	0xa9b20354	! t0_kref+0x9b8:   	alignaddrl	%o0, %l4, %l4
	.word	0xa3a409ac	! t0_kref+0x9bc:   	fdivs	%f16, %f12, %f17
	.word	0x001fffff	! t0_kref+0x9c0:   	illtrap	0x1fffff
	.word	0xf7ee501d	! t0_kref+0x9c4:   	prefetcha	%i1 + %i5, 27
	.word	0x9505c014	! t0_kref+0x9c8:   	taddcc	%l7, %l4, %o2
	.word	0x9744c000	! t0_kref+0x9cc:   	mov	%gsr, %o3
	.word	0x90854014	! t0_kref+0x9d0:   	addcc	%l5, %l4, %o0
	.word	0xd91fbdc0	! t0_kref+0x9d4:   	ldd	[%fp - 0x240], %f12
	.word	0x81ab8ace	! t0_kref+0x9d8:   	fcmped	%fcc0, %f14, %f14
	.word	0x99a018ce	! t0_kref+0x9dc:   	fdtos	%f14, %f12
	.word	0xee30a032	! t0_kref+0x9e0:   	sth	%l7, [%g2 + 0x32]
	.word	0x9414ed2f	! t0_kref+0x9e4:   	or	%l3, 0xd2f, %o2
	.word	0xa3a000ad	! t0_kref+0x9e8:   	fnegs	%f13, %f17
	.word	0x90b4ebf1	! t0_kref+0x9ec:   	orncc	%l3, 0xbf1, %o0
	.word	0xaa8db893	! t0_kref+0x9f0:   	andcc	%l6, -0x76d, %l5
	.word	0xe1180018	! t0_kref+0x9f4:   	ldd	[%g0 + %i0], %f16
	.word	0x81d94005	! t0_kref+0x9f8:   	flush	%g5 + %g5
	.word	0x2b800008	! t0_kref+0x9fc:   	fbug,a	_kref+0xa1c
	.word	0x9da3092c	! t0_kref+0xa00:   	fmuls	%f12, %f12, %f14
	.word	0x3f480007	! t0_kref+0xa04:   	fbo,a,pt	%fcc0, _kref+0xa20
	.word	0x9ba000af	! t0_kref+0xa08:   	fnegs	%f15, %f13
	.word	0xaa5c8012	! t0_kref+0xa0c:   	smul	%l2, %l2, %l5
	.word	0x9da3884c	! t0_kref+0xa10:   	faddd	%f14, %f12, %f14
	.word	0xdd1f4019	! t0_kref+0xa14:   	ldd	[%i5 + %i1], %f14
	.word	0xe1bf1a19	! t0_kref+0xa18:   	stda	%f16, [%i4 + %i1]0xd0
	.word	0x8143c000	! t0_kref+0xa1c:   	stbar
	.word	0xa1a4084c	! t0_kref+0xa20:   	faddd	%f16, %f12, %f16
	.word	0xea20a004	! t0_kref+0xa24:   	st	%l5, [%g2 + 4]
	.word	0xa1a3c9ae	! t0_kref+0xa28:   	fdivs	%f15, %f14, %f16
	.word	0x99b30a10	! t0_kref+0xa2c:   	fpadd16	%f12, %f16, %f12
	.word	0xa3a01a4c	! t0_kref+0xa30:   	fdtoi	%f12, %f17
	.word	0xd0c81018	! t0_kref+0xa34:   	ldsba	[%g0 + %i0]0x80, %o0
	.word	0xee20a010	! t0_kref+0xa38:   	st	%l7, [%g2 + 0x10]
	.word	0xa1a348b0	! t0_kref+0xa3c:   	fsubs	%f13, %f16, %f16
	.word	0x968dc013	! t0_kref+0xa40:   	andcc	%l7, %l3, %o3
	.word	0xa1b40e0c	! t0_kref+0xa44:   	fand	%f16, %f12, %f16
	.word	0x26800001	! t0_kref+0xa48:   	bl,a	_kref+0xa4c
	.word	0x99a000ce	! t0_kref+0xa4c:   	fnegd	%f14, %f12
	.word	0x26480002	! t0_kref+0xa50:   	bl,a,pt	%icc, _kref+0xa58
	.word	0xa1a408ce	! t0_kref+0xa54:   	fsubd	%f16, %f14, %f16
	.word	0xa6253b8f	! t0_kref+0xa58:   	sub	%l4, -0x471, %l3
	.word	0x81ab0ab0	! t0_kref+0xa5c:   	fcmpes	%fcc0, %f12, %f16
	.word	0xdb20a02c	! t0_kref+0xa60:   	st	%f13, [%g2 + 0x2c]
	.word	0x9044b8f2	! t0_kref+0xa64:   	addc	%l2, -0x70e, %o0
	.word	0xaf35c012	! t0_kref+0xa68:   	srl	%l7, %l2, %l7
	.word	0x912d6016	! t0_kref+0xa6c:   	sll	%l5, 0x16, %o0
	.word	0x29800003	! t0_kref+0xa70:   	fbl,a	_kref+0xa7c
	.word	0xd9180018	! t0_kref+0xa74:   	ldd	[%g0 + %i0], %f12
	.word	0x99a0054e	! t0_kref+0xa78:   	fsqrtd	%f14, %f12
	.word	0xee2e6002	! t0_kref+0xa7c:   	stb	%l7, [%i1 + 2]
	.word	0x001fffff	! t0_kref+0xa80:   	illtrap	0x1fffff
	.word	0x91b20073	! t0_kref+0xa84:   	edge8ln	%o0, %l3, %o0
	.word	0x9da389d0	! t0_kref+0xa88:   	fdivd	%f14, %f16, %f14
	.word	0xa9b58094	! t0_kref+0xa8c:   	edge16	%l6, %l4, %l4
	.word	0xa6e4ff62	! t0_kref+0xa90:   	subccc	%l3, -0x9e, %l3
	.word	0x9fb007b0	! t0_kref+0xa94:   	fpackfix	%f16, %f15
	.word	0xc768a085	! t0_kref+0xa98:   	prefetch	%g2 + 0x85, 3
	.word	0xeb68a086	! t0_kref+0xa9c:   	prefetch	%g2 + 0x86, 21
	.word	0xa40d4013	! t0_kref+0xaa0:   	and	%l5, %l3, %l2
	.word	0xd91f4018	! t0_kref+0xaa4:   	ldd	[%i5 + %i0], %f12
	.word	0x91400000	! t0_kref+0xaa8:   	mov	%y, %o0
	.word	0x9535e006	! t0_kref+0xaac:   	srl	%l7, 0x6, %o2
	.word	0x37800002	! t0_kref+0xab0:   	fbge,a	_kref+0xab8
	.word	0xd268a01b	! t0_kref+0xab4:   	ldstub	[%g2 + 0x1b], %o1
	.word	0x9ba0052c	! t0_kref+0xab8:   	fsqrts	%f12, %f13
	.word	0x99a30850	! t0_kref+0xabc:   	faddd	%f12, %f16, %f12
	.word	0xe6a6501c	! t0_kref+0xac0:   	sta	%l3, [%i1 + %i4]0x80
	.word	0x927cb0b0	! t0_kref+0xac4:   	sdiv	%l2, -0xf50, %o1
	.word	0x81ac0ace	! t0_kref+0xac8:   	fcmped	%fcc0, %f16, %f14
	.word	0xd268a03b	! t0_kref+0xacc:   	ldstub	[%g2 + 0x3b], %o1
	.word	0xd026401c	! t0_kref+0xad0:   	st	%o0, [%i1 + %i4]
	.word	0x94154015	! t0_kref+0xad4:   	or	%l5, %l5, %o2
	.word	0x9da3c830	! t0_kref+0xad8:   	fadds	%f15, %f16, %f14
	.word	0x9da4082d	! t0_kref+0xadc:   	fadds	%f16, %f13, %f14
	.word	0xe8ce9018	! t0_kref+0xae0:   	ldsba	[%i2 + %i0]0x80, %l4
	.word	0xe4262008	! t0_kref+0xae4:   	st	%l2, [%i0 + 8]
	.word	0xd6901019	! t0_kref+0xae8:   	lduha	[%g0 + %i1]0x80, %o3
	.word	0xe620a030	! t0_kref+0xaec:   	st	%l3, [%g2 + 0x30]
	.word	0xd93e2008	! t0_kref+0xaf0:   	std	%f12, [%i0 + 8]
	.word	0xe8a6501c	! t0_kref+0xaf4:   	sta	%l4, [%i1 + %i4]0x80
	.word	0xdb262010	! t0_kref+0xaf8:   	st	%f13, [%i0 + 0x10]
	.word	0x93b54128	! t0_kref+0xafc:   	edge32n	%l5, %o0, %o1
	.word	0x9fb007ae	! t0_kref+0xb00:   	fpackfix	%f14, %f15
	.word	0xaa9d3e92	! t0_kref+0xb04:   	xorcc	%l4, -0x16e, %l5
	.word	0x9de3bfa0	! t0_kref+0xb08:   	save	%sp, -0x60, %sp
	.word	0x91ee4000	! t0_kref+0xb0c:   	restore	%i1, %g0, %o0
	.word	0xd610a008	! t0_kref+0xb10:   	lduh	[%g2 + 8], %o3
	.word	0xa8b54015	! t0_kref+0xb14:   	orncc	%l5, %l5, %l4
	.word	0x22800008	! t0_kref+0xb18:   	be,a	_kref+0xb38
	.word	0xa87df47d	! t0_kref+0xb1c:   	sdiv	%l7, -0xb83, %l4
	.word	0xe430a030	! t0_kref+0xb20:   	sth	%l2, [%g2 + 0x30]
	.word	0xe620a020	! t0_kref+0xb24:   	st	%l3, [%g2 + 0x20]
	.word	0xd9060000	! t0_kref+0xb28:   	ld	[%i0], %f12
	.word	0xa9b54008	! t0_kref+0xb2c:   	edge8	%l5, %o0, %l4
	.word	0xe4300019	! t0_kref+0xb30:   	sth	%l2, [%g0 + %i1]
	.word	0x001fffff	! t0_kref+0xb34:   	illtrap	0x1fffff
	.word	0x9fa01a31	! t0_kref+0xb38:   	fstoi	%f17, %f15
	.word	0x9f414000	! t0_kref+0xb3c:   	mov	%pc, %o7
	.word	0xdd064000	! t0_kref+0xb40:   	ld	[%i1], %f14
	.word	0x99b40a8e	! t0_kref+0xb44:   	fpsub16	%f16, %f14, %f12
	.word	0xdf067ff4	! t0_kref+0xb48:   	ld	[%i1 - 0xc], %f15
	.word	0xee08a005	! t0_kref+0xb4c:   	ldub	[%g2 + 5], %l7
	.word	0xafb200d6	! t0_kref+0xb50:   	edge16l	%o0, %l6, %l7
	.word	0xa89cae1d	! t0_kref+0xb54:   	xorcc	%l2, 0xe1d, %l4
	.word	0xd93e6008	! t0_kref+0xb58:   	std	%f12, [%i1 + 8]
	.word	0x9625751a	! t0_kref+0xb5c:   	sub	%l5, -0xae6, %o3
	.word	0xafb50115	! t0_kref+0xb60:   	edge32	%l4, %l5, %l7
	.word	0xd93e4000	! t0_kref+0xb64:   	std	%f12, [%i1]
	.word	0xa1a01930	! t0_kref+0xb68:   	fstod	%f16, %f16
	.word	0xd0264000	! t0_kref+0xb6c:   	st	%o0, [%i1]
	.word	0xa1b30e80	! t0_kref+0xb70:   	fsrc1	%f12, %f16
	.word	0xaa9dc013	! t0_kref+0xb74:   	xorcc	%l7, %l3, %l5
	.word	0xe1ee101c	! t0_kref+0xb78:   	prefetcha	%i0 + %i4, 16
	.word	0xe06e401a	! t0_kref+0xb7c:   	ldstub	[%i1 + %i2], %l0
	call	SYM(t0_subr3)
	.word	0xa1a0054c	! t0_kref+0xb84:   	fsqrtd	%f12, %f16
	.word	0x2b37156c	! t0_kref+0xb88:   	sethi	%hi(0xdc55b000), %l5
	.word	0x945c8017	! t0_kref+0xb8c:   	smul	%l2, %l7, %o2
	.word	0xd26e7fe5	! t0_kref+0xb90:   	ldstub	[%i1 - 0x1b], %o1
	.word	0xdf00a024	! t0_kref+0xb94:   	ld	[%g2 + 0x24], %f15
	.word	0xa8fdc016	! t0_kref+0xb98:   	sdivcc	%l7, %l6, %l4
	.word	0x39800005	! t0_kref+0xb9c:   	fbuge,a	_kref+0xbb0
	.word	0xa9b48048	! t0_kref+0xba0:   	edge8l	%l2, %o0, %l4
	.word	0xea36401b	! t0_kref+0xba4:   	sth	%l5, [%i1 + %i3]
	.word	0xa1a0054c	! t0_kref+0xba8:   	fsqrtd	%f12, %f16
	.word	0x99b34aad	! t0_kref+0xbac:   	fpsub16s	%f13, %f13, %f12
	.word	0xa3a00530	! t0_kref+0xbb0:   	fsqrts	%f16, %f17
	.word	0xc768a045	! t0_kref+0xbb4:   	prefetch	%g2 + 0x45, 3
	.word	0x90ace279	! t0_kref+0xbb8:   	andncc	%l3, 0x279, %o0
	.word	0xd2d01018	! t0_kref+0xbbc:   	ldsha	[%g0 + %i0]0x80, %o1
	.word	0xc06e001a	! t0_kref+0xbc0:   	ldstub	[%i0 + %i2], %g0
	.word	0xa3a01a4e	! t0_kref+0xbc4:   	fdtoi	%f14, %f17
	.word	0x81ac0ad0	! t0_kref+0xbc8:   	fcmped	%fcc0, %f16, %f16
	.word	0x34800005	! t0_kref+0xbcc:   	bg,a	_kref+0xbe0
	.word	0xa7322017	! t0_kref+0xbd0:   	srl	%o0, 0x17, %l3
	.word	0x965cc017	! t0_kref+0xbd4:   	smul	%l3, %l7, %o3
	.word	0x99b40ad0	! t0_kref+0xbd8:   	fpsub32	%f16, %f16, %f12
	.word	0xd91e3fe0	! t0_kref+0xbdc:   	ldd	[%i0 - 0x20], %f12
	.word	0xa8220012	! t0_kref+0xbe0:   	sub	%o0, %l2, %l4
	.word	0x9ba44831	! t0_kref+0xbe4:   	fadds	%f17, %f17, %f13
	.word	0x3c800001	! t0_kref+0xbe8:   	bpos,a	_kref+0xbec
	.word	0xaf04ff5b	! t0_kref+0xbec:   	taddcc	%l3, -0xa5, %l7
	.word	0xaa9df902	! t0_kref+0xbf0:   	xorcc	%l7, -0x6fe, %l5
	.word	0x2d800006	! t0_kref+0xbf4:   	fbg,a	_kref+0xc0c
	.word	0xad40c000	! t0_kref+0xbf8:   	mov	%asi, %l6
	.word	0x9fa0002e	! t0_kref+0xbfc:   	fmovs	%f14, %f15
	.word	0x94f5c008	! t0_kref+0xc00:   	udivcc	%l7, %o0, %o2
	.word	0x81df6ff7	! t0_kref+0xc04:   	flush	%i5 + 0xff7
	.word	0xe11f4019	! t0_kref+0xc08:   	ldd	[%i5 + %i1], %f16
	.word	0xd9be5854	! t0_kref+0xc0c:   	stda	%f12, [%i1 + %l4]0xc2
	.word	0xe13e6010	! t0_kref+0xc10:   	std	%f16, [%i1 + 0x10]
	.word	0xabb50174	! t0_kref+0xc14:   	edge32ln	%l4, %l4, %l5
	.word	0xec6e4000	! t0_kref+0xc18:   	ldstub	[%i1], %l6
	.word	0x1501bc96	! t0_kref+0xc1c:   	sethi	%hi(0x6f25800), %o2
	.word	0xa6e4a21a	! t0_kref+0xc20:   	subccc	%l2, 0x21a, %l3
	.word	0xa1a01090	! t0_kref+0xc24:   	fxtos	%f16, %f16
	.word	0xa1a0052f	! t0_kref+0xc28:   	fsqrts	%f15, %f16
	.word	0xa3a388ae	! t0_kref+0xc2c:   	fsubs	%f14, %f14, %f17
	.word	0xadb200b3	! t0_kref+0xc30:   	edge16n	%o0, %l3, %l6
	.word	0xc001401c	! t0_kref+0xc34:   	ld	[%g5 + %i4], %g0
	.word	0x94b4fbc1	! t0_kref+0xc38:   	orncc	%l3, -0x43f, %o2
	.word	0x901cc012	! t0_kref+0xc3c:   	xor	%l3, %l2, %o0
	.word	0x9ba000b0	! t0_kref+0xc40:   	fnegs	%f16, %f13
	.word	0xe62e6001	! t0_kref+0xc44:   	stb	%l3, [%i1 + 1]
	.word	0xf007bfe0	! t0_kref+0xc48:   	ld	[%fp - 0x20], %i0
	.word	0x99a01a4e	! t0_kref+0xc4c:   	fdtoi	%f14, %f12
	.word	0x9da0054c	! t0_kref+0xc50:   	fsqrtd	%f12, %f14
	.word	0x99a349b0	! t0_kref+0xc54:   	fdivs	%f13, %f16, %f12
	.word	0xfdee101a	! t0_kref+0xc58:   	prefetcha	%i0 + %i2, 30
	.word	0xf43e7fe0	! t0_kref+0xc5c:   	std	%i2, [%i1 - 0x20]
	.word	0x2c800003	! t0_kref+0xc60:   	bneg,a	_kref+0xc6c
	.word	0xf207bfe0	! t0_kref+0xc64:   	ld	[%fp - 0x20], %i1
	.word	0xea30a012	! t0_kref+0xc68:   	sth	%l5, [%g2 + 0x12]
	.word	0xe8881019	! t0_kref+0xc6c:   	lduba	[%g0 + %i1]0x80, %l4
	.word	0x93b404d0	! t0_kref+0xc70:   	fcmpne32	%f16, %f16, %o1
	.word	0x9fc10000	! t0_kref+0xc74:   	call	%g4
	.word	0x9db38dcc	! t0_kref+0xc78:   	fnand	%f14, %f12, %f14
	.word	0x9db40ea0	! t0_kref+0xc7c:   	fsrc1s	%f16, %f14
	.word	0x99a00550	! t0_kref+0xc80:   	fsqrtd	%f16, %f12
	.word	0xec28a005	! t0_kref+0xc84:   	stb	%l6, [%g2 + 5]
	.word	0x2d800002	! t0_kref+0xc88:   	fbg,a	_kref+0xc90
	.word	0x272dd162	! t0_kref+0xc8c:   	sethi	%hi(0xb7458800), %l3
	.word	0xa7400000	! t0_kref+0xc90:   	mov	%y, %l3
	.word	0xdb264000	! t0_kref+0xc94:   	st	%f13, [%i1]
	.word	0xe0396cb0	! t0_kref+0xc98:   	std	%l0, [%g5 + 0xcb0]
	call	SYM(t0_subr1)
	.word	0x9da00530	! t0_kref+0xca0:   	fsqrts	%f16, %f14
	.word	0xd99eda59	! t0_kref+0xca4:   	ldda	[%i3 + %i1]0xd2, %f12
	.word	0x81ac0aae	! t0_kref+0xca8:   	fcmpes	%fcc0, %f16, %f14
	.word	0x99a0108c	! t0_kref+0xcac:   	fxtos	%f12, %f12
	.word	0x9da00531	! t0_kref+0xcb0:   	fsqrts	%f17, %f14
	.word	0x97054015	! t0_kref+0xcb4:   	taddcc	%l5, %l5, %o3
	.word	0xa1a4094e	! t0_kref+0xcb8:   	fmuld	%f16, %f14, %f16
	.word	0xac35ee29	! t0_kref+0xcbc:   	orn	%l7, 0xe29, %l6
	.word	0xa1a0054c	! t0_kref+0xcc0:   	fsqrtd	%f12, %f16
	.word	0xae14c014	! t0_kref+0xcc4:   	or	%l3, %l4, %l7
	.word	0x972de012	! t0_kref+0xcc8:   	sll	%l7, 0x12, %o3
	.word	0x909cface	! t0_kref+0xccc:   	xorcc	%l3, -0x532, %o0
	.word	0xa1a3c8ae	! t0_kref+0xcd0:   	fsubs	%f15, %f14, %f16
	.word	0xad34e01b	! t0_kref+0xcd4:   	srl	%l3, 0x1b, %l6
	.word	0xae254015	! t0_kref+0xcd8:   	sub	%l5, %l5, %l7
	.word	0x90420016	! t0_kref+0xcdc:   	addc	%o0, %l6, %o0
	.word	0xd93f4019	! t0_kref+0xce0:   	std	%f12, [%i5 + %i1]
	.word	0x24800006	! t0_kref+0xce4:   	ble,a	_kref+0xcfc
	.word	0x81b01025	! t0_kref+0xce8:   	siam	0x5
	.word	0xa484e77c	! t0_kref+0xcec:   	addcc	%l3, 0x77c, %l2
	.word	0xe8df5018	! t0_kref+0xcf0:   	ldxa	[%i5 + %i0]0x80, %l4
	.word	0x94b48008	! t0_kref+0xcf4:   	orncc	%l2, %o0, %o2
	.word	0x96f5f076	! t0_kref+0xcf8:   	udivcc	%l7, -0xf8a, %o3
	.word	0xf5ee101d	! t0_kref+0xcfc:   	prefetcha	%i0 + %i5, 26
	.word	0x17371528	! t0_kref+0xd00:   	sethi	%hi(0xdc54a000), %o3
	.word	0x943c8017	! t0_kref+0xd04:   	xnor	%l2, %l7, %o2
	.word	0xa8920016	! t0_kref+0xd08:   	orcc	%o0, %l6, %l4
	.word	0x9ba0052c	! t0_kref+0xd0c:   	fsqrts	%f12, %f13
	.word	0x87802082	! t0_kref+0xd10:   	mov	0x82, %asi
	.word	0xe1be1853	! t0_kref+0xd14:   	stda	%f16, [%i0 + %l3]0xc2
	.word	0xa7703bfc	! t0_kref+0xd18:   	popc	-0x404, %l3
	.word	0xa72d8013	! t0_kref+0xd1c:   	sll	%l6, %l3, %l3
	.word	0xa4bcf87b	! t0_kref+0xd20:   	xnorcc	%l3, -0x785, %l2
	.word	0x928d0013	! t0_kref+0xd24:   	andcc	%l4, %l3, %o1
	.word	0x3a480001	! t0_kref+0xd28:   	bcc,a,pt	%icc, _kref+0xd2c
	.word	0xec580019	! t0_kref+0xd2c:   	ldx	[%g0 + %i1], %l6
	.word	0x8143c000	! t0_kref+0xd30:   	stbar
	.word	0xe64e4000	! t0_kref+0xd34:   	ldsb	[%i1], %l3
	.word	0x99a0002c	! t0_kref+0xd38:   	fmovs	%f12, %f12
	.word	0xddbe101d	! t0_kref+0xd3c:   	stda	%f14, [%i0 + %i5]0x80
	.word	0x90052020	! t0_kref+0xd40:   	add	%l4, 0x20, %o0
	.word	0xd008a02a	! t0_kref+0xd44:   	ldub	[%g2 + 0x2a], %o0
	.word	0x9db00f0e	! t0_kref+0xd48:   	fsrc2	%f14, %f14
	.word	0xec1e001d	! t0_kref+0xd4c:   	ldd	[%i0 + %i5], %l6
	.word	0x905dc014	! t0_kref+0xd50:   	smul	%l7, %l4, %o0
	.word	0x923d0017	! t0_kref+0xd54:   	xnor	%l4, %l7, %o1
	.word	0xdd067ff4	! t0_kref+0xd58:   	ld	[%i1 - 0xc], %f14
	.word	0xd9070018	! t0_kref+0xd5c:   	ld	[%i4 + %i0], %f12
	.word	0xd93e7ff0	! t0_kref+0xd60:   	std	%f12, [%i1 - 0x10]
	.word	0x32480008	! t0_kref+0xd64:   	bne,a,pt	%icc, _kref+0xd84
	.word	0xac04f0ee	! t0_kref+0xd68:   	add	%l3, -0xf12, %l6
	.word	0xa85da5d0	! t0_kref+0xd6c:   	smul	%l6, 0x5d0, %l4
	.word	0xae5223a2	! t0_kref+0xd70:   	umul	%o0, 0x3a2, %l7
	.word	0x9fa00531	! t0_kref+0xd74:   	fsqrts	%f17, %f15
	.word	0xa4620012	! t0_kref+0xd78:   	subc	%o0, %l2, %l2
	.word	0xe168a007	! t0_kref+0xd7c:   	prefetch	%g2 + 7, 16
	.word	0xd9be1808	! t0_kref+0xd80:   	stda	%f12, [%i0 + %o0]0xc0
	.word	0x81ab0a4e	! t0_kref+0xd84:   	fcmpd	%fcc0, %f12, %f14
	.word	0xe6266018	! t0_kref+0xd88:   	st	%l3, [%i1 + 0x18]
	.word	0x9ba00130	! t0_kref+0xd8c:   	fabss	%f16, %f13
	.word	0x99b00f2f	! t0_kref+0xd90:   	fsrc2s	%f15, %f12
	.word	0x92654008	! t0_kref+0xd94:   	subc	%l5, %o0, %o1
	.word	0x9bb44a31	! t0_kref+0xd98:   	fpadd16s	%f17, %f17, %f13
	.word	0x965c8012	! t0_kref+0xd9c:   	smul	%l2, %l2, %o3
	.word	0x32800004	! t0_kref+0xda0:   	bne,a	_kref+0xdb0
	.word	0x9da00550	! t0_kref+0xda4:   	fsqrtd	%f16, %f14
	.word	0x81b01025	! t0_kref+0xda8:   	siam	0x5
	.word	0x99a00550	! t0_kref+0xdac:   	fsqrtd	%f16, %f12
	.word	0x28480002	! t0_kref+0xdb0:   	bleu,a,pt	%icc, _kref+0xdb8
	.word	0xf83e401d	! t0_kref+0xdb4:   	std	%i4, [%i1 + %i5]
	.word	0x2c800008	! t0_kref+0xdb8:   	bneg,a	_kref+0xdd8
	.word	0x99a0054c	! t0_kref+0xdbc:   	fsqrtd	%f12, %f12
	.word	0xe628a03b	! t0_kref+0xdc0:   	stb	%l3, [%g2 + 0x3b]
	.word	0x99b30d0c	! t0_kref+0xdc4:   	fandnot1	%f12, %f12, %f12
	.word	0x27800004	! t0_kref+0xdc8:   	fbul,a	_kref+0xdd8
	.word	0xa6aa36fa	! t0_kref+0xdcc:   	andncc	%o0, -0x906, %l3
	.word	0xdf270018	! t0_kref+0xdd0:   	st	%f15, [%i4 + %i0]
	.word	0x99a01930	! t0_kref+0xdd4:   	fstod	%f16, %f12
	.word	0x9da0052f	! t0_kref+0xdd8:   	fsqrts	%f15, %f14
	.word	0xe8b01018	! t0_kref+0xddc:   	stha	%l4, [%g0 + %i0]0x80
	.word	0x96fd0013	! t0_kref+0xde0:   	sdivcc	%l4, %l3, %o3
	.word	0xe4d6d018	! t0_kref+0xde4:   	ldsha	[%i3 + %i0]0x80, %l2
	.word	0x27800005	! t0_kref+0xde8:   	fbul,a	_kref+0xdfc
	.word	0xd9be1893	! t0_kref+0xdec:   	stda	%f12, [%i0 + %l3]0xc4
	.word	0x9da3c8ac	! t0_kref+0xdf0:   	fsubs	%f15, %f12, %f14
	.word	0xd20e401a	! t0_kref+0xdf4:   	ldub	[%i1 + %i2], %o1
	.word	0xe968a041	! t0_kref+0xdf8:   	prefetch	%g2 + 0x41, 20
	.word	0xa6ace2eb	! t0_kref+0xdfc:   	andncc	%l3, 0x2eb, %l3
	.word	0x81ab0ad0	! t0_kref+0xe00:   	fcmped	%fcc0, %f12, %f16
	.word	0xf43e0000	! t0_kref+0xe04:   	std	%i2, [%i0]
	.word	0xae65eceb	! t0_kref+0xe08:   	subc	%l7, 0xceb, %l7
	.word	0x39800004	! t0_kref+0xe0c:   	fbuge,a	_kref+0xe1c
	.word	0xee26001c	! t0_kref+0xe10:   	st	%l7, [%i0 + %i4]
	.word	0x9fa00030	! t0_kref+0xe14:   	fmovs	%f16, %f15
	.word	0x81ac0ad0	! t0_kref+0xe18:   	fcmped	%fcc0, %f16, %f16
	.word	0xa6f50015	! t0_kref+0xe1c:   	udivcc	%l4, %l5, %l3
	.word	0x99a01a50	! t0_kref+0xe20:   	fdtoi	%f16, %f12
	.word	0x9ba00030	! t0_kref+0xe24:   	fmovs	%f16, %f13
	.word	0xd0260000	! t0_kref+0xe28:   	st	%o0, [%i0]
	.word	0x99b30ea0	! t0_kref+0xe2c:   	fsrc1s	%f12, %f12
	.word	0xae75baf2	! t0_kref+0xe30:   	udiv	%l6, -0x50e, %l7
	.word	0xad63e4a8	! t0_kref+0xe34:   	movo	%fcc0, -0x358, %l6
	.word	0xa6353f99	! t0_kref+0xe38:   	orn	%l4, -0x67, %l3
	.word	0x93b50335	! t0_kref+0xe3c:   	bmask	%l4, %l5, %o1
	.word	0xa6b48012	! t0_kref+0xe40:   	orncc	%l2, %l2, %l3
	.word	0xee680018	! t0_kref+0xe44:   	ldstub	[%g0 + %i0], %l7
	.word	0xda6e7ff1	! t0_kref+0xe48:   	ldstub	[%i1 - 0xf], %o5
	.word	0x9da409ae	! t0_kref+0xe4c:   	fdivs	%f16, %f14, %f14
	.word	0xa4150012	! t0_kref+0xe50:   	or	%l4, %l2, %l2
	.word	0xea30a026	! t0_kref+0xe54:   	sth	%l5, [%g2 + 0x26]
	.word	0x903d2a0a	! t0_kref+0xe58:   	xnor	%l4, 0xa0a, %o0
	.word	0x9f414000	! t0_kref+0xe5c:   	mov	%pc, %o7
!	.word	0x284f2466	! t0_kref+0xe60:   	bleu,a,pt	%icc, SYM(t0_subr0)
	   	bleu,a,pt	%icc, SYM(t0_subr0)
	.word	0x81854000	! t0_kref+0xe64:   	wr	%l5, %g0, %y
	.word	0x9da00550	! t0_kref+0xe68:   	fsqrtd	%f16, %f14
	.word	0x81ab4aae	! t0_kref+0xe6c:   	fcmpes	%fcc0, %f13, %f14
	.word	0xe9ee501a	! t0_kref+0xe70:   	prefetcha	%i1 + %i2, 20
	.word	0xa85d0013	! t0_kref+0xe74:   	smul	%l4, %l3, %l4
	.word	0x28480007	! t0_kref+0xe78:   	bleu,a,pt	%icc, _kref+0xe94
	.word	0x9db40e0c	! t0_kref+0xe7c:   	fand	%f16, %f12, %f14
	.word	0x94ba0016	! t0_kref+0xe80:   	xnorcc	%o0, %l6, %o2
	.word	0xa3a01a4e	! t0_kref+0xe84:   	fdtoi	%f14, %f17
	.word	0xa83cc014	! t0_kref+0xe88:   	xnor	%l3, %l4, %l4
	.word	0x9fa0052d	! t0_kref+0xe8c:   	fsqrts	%f13, %f15
	.word	0x27800004	! t0_kref+0xe90:   	fbul,a	_kref+0xea0
	.word	0x9da3894c	! t0_kref+0xe94:   	fmuld	%f14, %f12, %f14
	.word	0xd83f4019	! t0_kref+0xe98:   	std	%o4, [%i5 + %i1]
	.word	0xa3a01a50	! t0_kref+0xe9c:   	fdtoi	%f16, %f17
	.word	0xa424ab0e	! t0_kref+0xea0:   	sub	%l2, 0xb0e, %l2
	.word	0xd030a02e	! t0_kref+0xea4:   	sth	%o0, [%g2 + 0x2e]
	.word	0xa732201d	! t0_kref+0xea8:   	srl	%o0, 0x1d, %l3
	.word	0x81ac4aac	! t0_kref+0xeac:   	fcmpes	%fcc0, %f17, %f12
	.word	0xe380105c	! t0_kref+0xeb0:   	lda	[%g0 + %i4]0x82, %f17
	.word	0x9da40950	! t0_kref+0xeb4:   	fmuld	%f16, %f16, %f14
	.word	0xd66e4000	! t0_kref+0xeb8:   	ldstub	[%i1], %o3
	.word	0xabb404d0	! t0_kref+0xebc:   	fcmpne32	%f16, %f16, %l5
	.word	0xdba6501c	! t0_kref+0xec0:   	sta	%f13, [%i1 + %i4]0x80
	.word	0x95400000	! t0_kref+0xec4:   	mov	%y, %o2
	.word	0x90748015	! t0_kref+0xec8:   	udiv	%l2, %l5, %o0
	.word	0x8143e040	! t0_kref+0xecc:   	membar	0x40
	.word	0x22480003	! t0_kref+0xed0:   	be,a,pt	%icc, _kref+0xedc
	.word	0x9db40e0e	! t0_kref+0xed4:   	fand	%f16, %f14, %f14
	.word	0x81ab8ab1	! t0_kref+0xed8:   	fcmpes	%fcc0, %f14, %f17
	.word	0xa80c8014	! t0_kref+0xedc:   	and	%l2, %l4, %l4
	.word	0x2d480004	! t0_kref+0xee0:   	fbg,a,pt	%fcc0, _kref+0xef0
	.word	0xa44224e0	! t0_kref+0xee4:   	addc	%o0, 0x4e0, %l2
	.word	0xa3a00531	! t0_kref+0xee8:   	fsqrts	%f17, %f17
	.word	0x13247a1d	! t0_kref+0xeec:   	sethi	%hi(0x91e87400), %o1
	.word	0xa9400000	! t0_kref+0xef0:   	mov	%y, %l4
	.word	0xe11fbe18	! t0_kref+0xef4:   	ldd	[%fp - 0x1e8], %f16
	.word	0x9de3bfa0	! t0_kref+0xef8:   	save	%sp, -0x60, %sp
	.word	0xa5ef0018	! t0_kref+0xefc:   	restore	%i4, %i0, %l2
	.word	0xa1b446ac	! t0_kref+0xf00:   	fmul8x16al	%f17, %f12, %f16
	.word	0x932cc012	! t0_kref+0xf04:   	sll	%l3, %l2, %o1
	.word	0x33480001	! t0_kref+0xf08:   	fbe,a,pt	%fcc0, _kref+0xf0c
	.word	0xa68d8013	! t0_kref+0xf0c:   	andcc	%l6, %l3, %l3
	.word	0x9db30e0c	! t0_kref+0xf10:   	fand	%f12, %f12, %f14
	.word	0xd93e7fe0	! t0_kref+0xf14:   	std	%f12, [%i1 - 0x20]
	.word	0x9005682f	! t0_kref+0xf18:   	add	%l5, 0x82f, %o0
	.word	0xa1a00550	! t0_kref+0xf1c:   	fsqrtd	%f16, %f16
	.word	0x99a00150	! t0_kref+0xf20:   	fabsd	%f16, %f12
	.word	0x96fd32c1	! t0_kref+0xf24:   	sdivcc	%l4, -0xd3f, %o3
	.word	0x99a0054e	! t0_kref+0xf28:   	fsqrtd	%f14, %f12
	.word	0xae8d4012	! t0_kref+0xf2c:   	andcc	%l5, %l2, %l7
	.word	0xec2e8018	! t0_kref+0xf30:   	stb	%l6, [%i2 + %i0]
	.word	0x99b4090c	! t0_kref+0xf34:   	faligndata	%f16, %f12, %f12
	.word	0xe6b65000	! t0_kref+0xf38:   	stha	%l3, [%i1]0x80
	.word	0x968d0012	! t0_kref+0xf3c:   	andcc	%l4, %l2, %o3
	.word	0x9da018d0	! t0_kref+0xf40:   	fdtos	%f16, %f14
	.word	0xee000019	! t0_kref+0xf44:   	ld	[%g0 + %i1], %l7
	.word	0xacfcc016	! t0_kref+0xf48:   	sdivcc	%l3, %l6, %l6
	.word	0xa4fa2c08	! t0_kref+0xf4c:   	sdivcc	%o0, 0xc08, %l2
	.word	0x90ad3964	! t0_kref+0xf50:   	andncc	%l4, -0x69c, %o0
	.word	0x37480001	! t0_kref+0xf54:   	fbge,a,pt	%fcc0, _kref+0xf58
	.word	0x963d4015	! t0_kref+0xf58:   	xnor	%l5, %l5, %o3
	.word	0xe628a00b	! t0_kref+0xf5c:   	stb	%l3, [%g2 + 0xb]
	.word	0xe628a010	! t0_kref+0xf60:   	stb	%l3, [%g2 + 0x10]
	.word	0x9fb00f31	! t0_kref+0xf64:   	fsrc2s	%f17, %f15
	.word	0xe120a018	! t0_kref+0xf68:   	st	%f16, [%g2 + 0x18]
	.word	0x9bb007ac	! t0_kref+0xf6c:   	fpackfix	%f12, %f13
	.word	0x9da00550	! t0_kref+0xf70:   	fsqrtd	%f16, %f14
	.word	0xc5ee5012	! t0_kref+0xf74:   	prefetcha	%i1 + %l2, 2
	.word	0x96754012	! t0_kref+0xf78:   	udiv	%l5, %l2, %o3
	.word	0xac5ce879	! t0_kref+0xf7c:   	smul	%l3, 0x879, %l6
	.word	0xa69a0013	! t0_kref+0xf80:   	xorcc	%o0, %l3, %l3
	.word	0x21800004	! t0_kref+0xf84:   	fbn,a	_kref+0xf94
	.word	0x99b009b1	! t0_kref+0xf88:   	fexpand	%f17, %f12
	.word	0x99a0002f	! t0_kref+0xf8c:   	fmovs	%f15, %f12
	.word	0x99a00050	! t0_kref+0xf90:   	fmovd	%f16, %f12
	.word	0x99b38e6d	! t0_kref+0xf94:   	fxnors	%f14, %f13, %f12
	.word	0x925cc017	! t0_kref+0xf98:   	smul	%l3, %l7, %o1
	.word	0x9444c014	! t0_kref+0xf9c:   	addc	%l3, %l4, %o2
	.word	0xe13e7ff8	! t0_kref+0xfa0:   	std	%f16, [%i1 - 8]
	.word	0xa7358017	! t0_kref+0xfa4:   	srl	%l6, %l7, %l3
	.word	0xe168a049	! t0_kref+0xfa8:   	prefetch	%g2 + 0x49, 16
	.word	0xd9be1a5d	! t0_kref+0xfac:   	stda	%f12, [%i0 + %i5]0xd2
	.word	0xa8b237bc	! t0_kref+0xfb0:   	orncc	%o0, -0x844, %l4
	.word	0x2d800004	! t0_kref+0xfb4:   	fbg,a	_kref+0xfc4
	.word	0x90c5f81b	! t0_kref+0xfb8:   	addccc	%l7, -0x7e5, %o0
	.word	0x2e800005	! t0_kref+0xfbc:   	bvs,a	_kref+0xfd0
	.word	0x9fa018d0	! t0_kref+0xfc0:   	fdtos	%f16, %f15
	.word	0x81820000	! t0_kref+0xfc4:   	wr	%o0, %g0, %y
	.word	0xae5da7b2	! t0_kref+0xfc8:   	smul	%l6, 0x7b2, %l7
	.word	0xa1b3cdae	! t0_kref+0xfcc:   	fxors	%f15, %f14, %f16
	.word	0x8143e040	! t0_kref+0xfd0:   	membar	0x40
	.word	0x22800008	! t0_kref+0xfd4:   	be,a	_kref+0xff4
	.word	0xa52d0014	! t0_kref+0xfd8:   	sll	%l4, %l4, %l2
	.word	0x95b5c316	! t0_kref+0xfdc:   	alignaddr	%l7, %l6, %o2
	.word	0x81ac0ad0	! t0_kref+0xfe0:   	fcmped	%fcc0, %f16, %f16
	.word	0xa92d2010	! t0_kref+0xfe4:   	sll	%l4, 0x10, %l4
	.word	0x81848000	! t0_kref+0xfe8:   	wr	%l2, %g0, %y
	.word	0x9fb38aad	! t0_kref+0xfec:   	fpsub16s	%f14, %f13, %f15
	.word	0xe3263ff0	! t0_kref+0xff0:   	st	%f17, [%i0 - 0x10]
	.word	0x99a00531	! t0_kref+0xff4:   	fsqrts	%f17, %f12
	.word	0x925d734f	! t0_kref+0xff8:   	smul	%l5, -0xcb1, %o1
	.word	0x9fa018cc	! t0_kref+0xffc:   	fdtos	%f12, %f15
	.word	0x9ba01a2f	! t0_kref+0x1000:   	fstoi	%f15, %f13
	.word	0xd9be1896	! t0_kref+0x1004:   	stda	%f12, [%i0 + %l6]0xc4
	.word	0xd99e501d	! t0_kref+0x1008:   	ldda	[%i1 + %i5]0x80, %f12
	.word	0xa8057bfc	! t0_kref+0x100c:   	add	%l5, -0x404, %l4
	.word	0x96052431	! t0_kref+0x1010:   	add	%l4, 0x431, %o3
	.word	0x9fa0012d	! t0_kref+0x1014:   	fabss	%f13, %f15
	.word	0x97b58114	! t0_kref+0x1018:   	edge32	%l6, %l4, %o3
	.word	0x81b01027	! t0_kref+0x101c:   	siam	0x7
	.word	0xe630a01e	! t0_kref+0x1020:   	sth	%l3, [%g2 + 0x1e]
	.word	0x9fa000ac	! t0_kref+0x1024:   	fnegs	%f12, %f15
	.word	0xae8d4015	! t0_kref+0x1028:   	andcc	%l5, %l5, %l7
	.word	0xe828a02a	! t0_kref+0x102c:   	stb	%l4, [%g2 + 0x2a]
	.word	0x907d0016	! t0_kref+0x1030:   	sdiv	%l4, %l6, %o0
	.word	0x99a448b0	! t0_kref+0x1034:   	fsubs	%f17, %f16, %f12
	.word	0x903d8016	! t0_kref+0x1038:   	xnor	%l6, %l6, %o0
	.word	0xab40c000	! t0_kref+0x103c:   	mov	%asi, %l5
	.word	0x93b5c0f6	! t0_kref+0x1040:   	edge16ln	%l7, %l6, %o1
	.word	0xd448a002	! t0_kref+0x1044:   	ldsb	[%g2 + 2], %o2
	.word	0x2e800006	! t0_kref+0x1048:   	bvs,a	_kref+0x1060
	.word	0x9ba409ac	! t0_kref+0x104c:   	fdivs	%f16, %f12, %f13
	.word	0xee367ffc	! t0_kref+0x1050:   	sth	%l7, [%i1 - 4]
	.word	0x99a0192f	! t0_kref+0x1054:   	fstod	%f15, %f12
	.word	0xa6f5f8b0	! t0_kref+0x1058:   	udivcc	%l7, -0x750, %l3
	.word	0xae2575e9	! t0_kref+0x105c:   	sub	%l5, -0xa17, %l7
	.word	0x921d3156	! t0_kref+0x1060:   	xor	%l4, -0xeaa, %o1
	.word	0xf83e0000	! t0_kref+0x1064:   	std	%i4, [%i0]
	.word	0x908d71a8	! t0_kref+0x1068:   	andcc	%l5, -0xe58, %o0
	.word	0x93b500e8	! t0_kref+0x106c:   	edge16ln	%l4, %o0, %o1
	.word	0x9de3bfa0	! t0_kref+0x1070:   	save	%sp, -0x60, %sp
	.word	0x97eeaca8	! t0_kref+0x1074:   	restore	%i2, 0xca8, %o3
	.word	0xac054017	! t0_kref+0x1078:   	add	%l5, %l7, %l6
	.word	0xaa648016	! t0_kref+0x107c:   	subc	%l2, %l6, %l5
	.word	0xec266014	! t0_kref+0x1080:   	st	%l6, [%i1 + 0x14]
	.word	0xa9358014	! t0_kref+0x1084:   	srl	%l6, %l4, %l4
	.word	0x9445b96d	! t0_kref+0x1088:   	addc	%l6, -0x693, %o2
	.word	0xa1a018cc	! t0_kref+0x108c:   	fdtos	%f12, %f16
	.word	0xe13f4018	! t0_kref+0x1090:   	std	%f16, [%i5 + %i0]
	.word	0x9de3bfa0	! t0_kref+0x1094:   	save	%sp, -0x60, %sp
	.word	0xb8de7be6	! t0_kref+0x1098:   	smulcc	%i1, -0x41a, %i4
	.word	0x91ef401c	! t0_kref+0x109c:   	restore	%i5, %i4, %o0
	.word	0x9da0052d	! t0_kref+0x10a0:   	fsqrts	%f13, %f14
	.word	0xadb5c113	! t0_kref+0x10a4:   	edge32	%l7, %l3, %l6
	.word	0x9fa388b1	! t0_kref+0x10a8:   	fsubs	%f14, %f17, %f15
	.word	0xaa3d0017	! t0_kref+0x10ac:   	xnor	%l4, %l7, %l5
	.word	0x96d22fda	! t0_kref+0x10b0:   	umulcc	%o0, 0xfda, %o3
	.word	0xa4fd4008	! t0_kref+0x10b4:   	sdivcc	%l5, %o0, %l2
	.word	0xa3a0002e	! t0_kref+0x10b8:   	fmovs	%f14, %f17
	.word	0x9daac050	! t0_kref+0x10bc:   	fmovdge	%fcc0, %f16, %f14
	.word	0xd9263ff4	! t0_kref+0x10c0:   	st	%f12, [%i0 - 0xc]
	.word	0x91400000	! t0_kref+0x10c4:   	mov	%y, %o0
	.word	0x2c800004	! t0_kref+0x10c8:   	bneg,a	_kref+0x10d8
	.word	0xa1a0054c	! t0_kref+0x10cc:   	fsqrtd	%f12, %f16
	.word	0xd9000018	! t0_kref+0x10d0:   	ld	[%g0 + %i0], %f12
	.word	0xe430a004	! t0_kref+0x10d4:   	sth	%l2, [%g2 + 4]
	.word	0xe968a04a	! t0_kref+0x10d8:   	prefetch	%g2 + 0x4a, 20
	.word	0xc807bfec	! t0_kref+0x10dc:   	ld	[%fp - 0x14], %g4
	.word	0xac3a34bc	! t0_kref+0x10e0:   	xnor	%o0, -0xb44, %l6
	.word	0xac048008	! t0_kref+0x10e4:   	add	%l2, %o0, %l6
	.word	0xe42e0000	! t0_kref+0x10e8:   	stb	%l2, [%i0]
	.word	0xa1b3090c	! t0_kref+0x10ec:   	faligndata	%f12, %f12, %f16
	.word	0x34800007	! t0_kref+0x10f0:   	bg,a	_kref+0x110c
	.word	0x99a01090	! t0_kref+0x10f4:   	fxtos	%f16, %f12
	.word	0x99a308ce	! t0_kref+0x10f8:   	fsubd	%f12, %f14, %f12
	.word	0x9675a4c5	! t0_kref+0x10fc:   	udiv	%l6, 0x4c5, %o3
	.word	0x8143c000	! t0_kref+0x1100:   	stbar
	.word	0x99a0054c	! t0_kref+0x1104:   	fsqrtd	%f12, %f12
	.word	0xa1a000d0	! t0_kref+0x1108:   	fnegd	%f16, %f16
	.word	0x943dbffe	! t0_kref+0x110c:   	xnor	%l6, -0x2, %o2
	.word	0xa3a3c9ac	! t0_kref+0x1110:   	fdivs	%f15, %f12, %f17
	.word	0xadb200f6	! t0_kref+0x1114:   	edge16ln	%o0, %l6, %l6
	.word	0xa4fd6dbb	! t0_kref+0x1118:   	sdivcc	%l5, 0xdbb, %l2
	.word	0x99a409d0	! t0_kref+0x111c:   	fdivd	%f16, %f16, %f12
	.word	0x925df9ef	! t0_kref+0x1120:   	smul	%l7, -0x611, %o1
	.word	0x9434ad01	! t0_kref+0x1124:   	orn	%l2, 0xd01, %o2
	.word	0xec26200c	! t0_kref+0x1128:   	st	%l6, [%i0 + 0xc]
	.word	0xd9be5855	! t0_kref+0x112c:   	stda	%f12, [%i1 + %l5]0xc2
	.word	0xae8d4015	! t0_kref+0x1130:   	andcc	%l5, %l5, %l7
	.word	0xa3a348b1	! t0_kref+0x1134:   	fsubs	%f13, %f17, %f17
	.word	0x3a480003	! t0_kref+0x1138:   	bcc,a,pt	%icc, _kref+0x1144
	.word	0xee300018	! t0_kref+0x113c:   	sth	%l7, [%g0 + %i0]
	.word	0x99b30d90	! t0_kref+0x1140:   	fxor	%f12, %f16, %f12
	.word	0xa1a0054c	! t0_kref+0x1144:   	fsqrtd	%f12, %f16
	.word	0x9da018d0	! t0_kref+0x1148:   	fdtos	%f16, %f14
	.word	0xa685ecee	! t0_kref+0x114c:   	addcc	%l7, 0xcee, %l3
	.word	0xe800a01c	! t0_kref+0x1150:   	ld	[%g2 + 0x1c], %l4
	.word	0x81da000e	! t0_kref+0x1154:   	flush	%o0 + %sp
	.word	0x9da3084c	! t0_kref+0x1158:   	faddd	%f12, %f12, %f14
	.word	0x3c480002	! t0_kref+0x115c:   	bpos,a,pt	%icc, _kref+0x1164
	.word	0xa535a004	! t0_kref+0x1160:   	srl	%l6, 0x4, %l2
	.word	0x95b58200	! t0_kref+0x1164:   	array8	%l6, %g0, %o2
	.word	0x33800001	! t0_kref+0x1168:   	fbe,a	_kref+0x116c
	.word	0xa65cff72	! t0_kref+0x116c:   	smul	%l3, -0x8e, %l3
	.word	0x2d480001	! t0_kref+0x1170:   	fbg,a,pt	%fcc0, _kref+0x1174
	.word	0xdd067fe0	! t0_kref+0x1174:   	ld	[%i1 - 0x20], %f14
	.word	0xa9700017	! t0_kref+0x1178:   	popc	%l7, %l4
	.word	0xe846401c	! t0_kref+0x117c:   	ldsw	[%i1 + %i4], %l4
	.word	0x3e800003	! t0_kref+0x1180:   	bvc,a	_kref+0x118c
	.word	0x9fa00031	! t0_kref+0x1184:   	fmovs	%f17, %f15
	.word	0xad400000	! t0_kref+0x1188:   	mov	%y, %l6
	.word	0x94d5e8cd	! t0_kref+0x118c:   	umulcc	%l7, 0x8cd, %o2
	.word	0xa1a0014c	! t0_kref+0x1190:   	fabsd	%f12, %f16
	.word	0xdd070018	! t0_kref+0x1194:   	ld	[%i4 + %i0], %f14
	.word	0x99a3894c	! t0_kref+0x1198:   	fmuld	%f14, %f12, %f12
	.word	0x8143c000	! t0_kref+0x119c:   	stbar
	.word	0x9004e96b	! t0_kref+0x11a0:   	add	%l3, 0x96b, %o0
	.word	0xa1a000ac	! t0_kref+0x11a4:   	fnegs	%f12, %f16
	.word	0x81ab8a4e	! t0_kref+0x11a8:   	fcmpd	%fcc0, %f14, %f14
	.word	0xf83e6018	! t0_kref+0x11ac:   	std	%i4, [%i1 + 0x18]
	.word	0xa1b40c50	! t0_kref+0x11b0:   	fnor	%f16, %f16, %f16
	.word	0xa3a3c82d	! t0_kref+0x11b4:   	fadds	%f15, %f13, %f17
	.word	0xec28a007	! t0_kref+0x11b8:   	stb	%l6, [%g2 + 7]
	.word	0x99b3096f	! t0_kref+0x11bc:   	fpmerge	%f12, %f15, %f12
	.word	0xa8b4b4f0	! t0_kref+0x11c0:   	orncc	%l2, -0xb10, %l4
	.word	0xd40e6000	! t0_kref+0x11c4:   	ldub	[%i1], %o2
	.word	0x972d6003	! t0_kref+0x11c8:   	sll	%l5, 0x3, %o3
	.word	0xa1a389d0	! t0_kref+0x11cc:   	fdivd	%f14, %f16, %f16
	.word	0x9da309cc	! t0_kref+0x11d0:   	fdivd	%f12, %f12, %f14
	.word	0xa3a0052f	! t0_kref+0x11d4:   	fsqrts	%f15, %f17
	.word	0x9fc00004	! t0_kref+0x11d8:   	call	%g0 + %g4
	.word	0xa4ba22b6	! t0_kref+0x11dc:   	xnorcc	%o0, 0x2b6, %l2
	.word	0xd99e501d	! t0_kref+0x11e0:   	ldda	[%i1 + %i5]0x80, %f12
	.word	0xe1be5853	! t0_kref+0x11e4:   	stda	%f16, [%i1 + %l3]0xc2
	.word	0xac5a0008	! t0_kref+0x11e8:   	smul	%o0, %o0, %l6
	.word	0x2f18b1c9	! t0_kref+0x11ec:   	sethi	%hi(0x62c72400), %l7
	.word	0x920a0016	! t0_kref+0x11f0:   	and	%o0, %l6, %o1
	.word	0xd4470018	! t0_kref+0x11f4:   	ldsw	[%i4 + %i0], %o2
	.word	0xd2464000	! t0_kref+0x11f8:   	ldsw	[%i1], %o1
	.word	0x9da4094e	! t0_kref+0x11fc:   	fmuld	%f16, %f14, %f14
	.word	0x9da0054c	! t0_kref+0x1200:   	fsqrtd	%f12, %f14
	.word	0x95b5c055	! t0_kref+0x1204:   	edge8l	%l7, %l5, %o2
	.word	0xa3a0052c	! t0_kref+0x1208:   	fsqrts	%f12, %f17
	.word	0x35800004	! t0_kref+0x120c:   	fbue,a	_kref+0x121c
	.word	0xfb6e3fe8	! t0_kref+0x1210:   	prefetch	%i0 - 0x18, 29
	.word	0xa4d20008	! t0_kref+0x1214:   	umulcc	%o0, %o0, %l2
	.word	0xc5ee1012	! t0_kref+0x1218:   	prefetcha	%i0 + %l2, 2
	.word	0x8143e040	! t0_kref+0x121c:   	membar	0x40
	.word	0x8584c008	! t0_kref+0x1220:   	wr	%l3, %o0, %ccr
	.word	0x99a3c8af	! t0_kref+0x1224:   	fsubs	%f15, %f15, %f12
	.word	0x9da00550	! t0_kref+0x1228:   	fsqrtd	%f16, %f14
	.word	0xa1a409ce	! t0_kref+0x122c:   	fdivd	%f16, %f14, %f16
	.word	0x923df497	! t0_kref+0x1230:   	xnor	%l7, -0xb69, %o1
	.word	0x2f3c4397	! t0_kref+0x1234:   	sethi	%hi(0xf10e5c00), %l7
	.word	0x99b40f50	! t0_kref+0x1238:   	fornot1	%f16, %f16, %f12
	.word	0x81daa9dc	! t0_kref+0x123c:   	flush	%o2 + 0x9dc
	.word	0x9205bac3	! t0_kref+0x1240:   	add	%l6, -0x53d, %o1
	.word	0x92656892	! t0_kref+0x1244:   	subc	%l5, 0x892, %o1
	.word	0xf1ee501a	! t0_kref+0x1248:   	prefetcha	%i1 + %i2, 24
	.word	0xdb00a020	! t0_kref+0x124c:   	ld	[%g2 + 0x20], %f13
	.word	0x969d7ab1	! t0_kref+0x1250:   	xorcc	%l5, -0x54f, %o3
	.word	0xea7e2010	! t0_kref+0x1254:   	swap	[%i0 + 0x10], %l5
	.word	0xd83e3fe8	! t0_kref+0x1258:   	std	%o4, [%i0 - 0x18]
	.word	0xd24e6000	! t0_kref+0x125c:   	ldsb	[%i1], %o1
	.word	0x928cc008	! t0_kref+0x1260:   	andcc	%l3, %o0, %o1
	.word	0xadb305cc	! t0_kref+0x1264:   	fcmpeq32	%f12, %f12, %l6
	.word	0xac9cc014	! t0_kref+0x1268:   	xorcc	%l3, %l4, %l6
	.word	0xeff61013	! t0_kref+0x126c:   	casxa	[%i0]0x80, %l3, %l7
	.word	0xf76e2000	! t0_kref+0x1270:   	prefetch	%i0, 27
	.word	0x99a00550	! t0_kref+0x1274:   	fsqrtd	%f16, %f12
	.word	0x9da388d0	! t0_kref+0x1278:   	fsubd	%f14, %f16, %f14
	.word	0xa7b3058c	! t0_kref+0x127c:   	fcmpgt32	%f12, %f12, %l3
	.word	0x8143e040	! t0_kref+0x1280:   	membar	0x40
	.word	0xa3b00f31	! t0_kref+0x1284:   	fsrc2s	%f17, %f17
	.word	0xec20a004	! t0_kref+0x1288:   	st	%l6, [%g2 + 4]
	.word	0xa9b4048e	! t0_kref+0x128c:   	fcmple32	%f16, %f14, %l4
	.word	0xdb063ff8	! t0_kref+0x1290:   	ld	[%i0 - 8], %f13
	.word	0xa6357de6	! t0_kref+0x1294:   	orn	%l5, -0x21a, %l3
	.word	0xe1be1852	! t0_kref+0x1298:   	stda	%f16, [%i0 + %l2]0xc2
	.word	0xd65e3fe8	! t0_kref+0x129c:   	ldx	[%i0 - 0x18], %o3
	.word	0x81df8004	! t0_kref+0x12a0:   	flush	%fp + %g4
	.word	0xe676401d	! t0_kref+0x12a4:   	stx	%l3, [%i1 + %i5]
	.word	0x99aac030	! t0_kref+0x12a8:   	fmovsge	%fcc0, %f16, %f12
	.word	0x9f414000	! t0_kref+0x12ac:   	mov	%pc, %o7
	.word	0x99b40970	! t0_kref+0x12b0:   	fpmerge	%f16, %f16, %f12
	.word	0x8143e00b	! t0_kref+0x12b4:   	membar	0xb
	.word	0x9da0054c	! t0_kref+0x12b8:   	fsqrtd	%f12, %f14
	.word	0x9da0004e	! t0_kref+0x12bc:   	fmovd	%f14, %f14
	.word	0x94f50016	! t0_kref+0x12c0:   	udivcc	%l4, %l6, %o2
	.word	0x97b4044c	! t0_kref+0x12c4:   	fcmpne16	%f16, %f12, %o3
	.word	0xe3070018	! t0_kref+0x12c8:   	ld	[%i4 + %i0], %f17
	.word	0xc16e7ff8	! t0_kref+0x12cc:   	prefetch	%i1 - 8, 0
	.word	0x9da3884e	! t0_kref+0x12d0:   	faddd	%f14, %f14, %f14
	.word	0xa1a38831	! t0_kref+0x12d4:   	fadds	%f14, %f17, %f16
	.word	0x26480003	! t0_kref+0x12d8:   	bl,a,pt	%icc, _kref+0x12e4
	.word	0xaa65b8fc	! t0_kref+0x12dc:   	subc	%l6, -0x704, %l5
	.word	0xa8357efe	! t0_kref+0x12e0:   	orn	%l5, -0x102, %l4
	.word	0x99a0052e	! t0_kref+0x12e4:   	fsqrts	%f14, %f12
	.word	0x99a38950	! t0_kref+0x12e8:   	fmuld	%f14, %f16, %f12
	.word	0x99a0052c	! t0_kref+0x12ec:   	fsqrts	%f12, %f12
	.word	0xa89c8016	! t0_kref+0x12f0:   	xorcc	%l2, %l6, %l4
	.word	0xe26e401a	! t0_kref+0x12f4:   	ldstub	[%i1 + %i2], %l1
	.word	0x001fffff	! t0_kref+0x12f8:   	illtrap	0x1fffff
	.word	0xac248015	! t0_kref+0x12fc:   	sub	%l2, %l5, %l6
	.word	0xddbe101d	! t0_kref+0x1300:   	stda	%f14, [%i0 + %i5]0x80
	.word	0x8143c000	! t0_kref+0x1304:   	stbar
	.word	0x9ba01a4c	! t0_kref+0x1308:   	fdtoi	%f12, %f13
	.word	0x952d4013	! t0_kref+0x130c:   	sll	%l5, %l3, %o2
	.word	0xd9000018	! t0_kref+0x1310:   	ld	[%g0 + %i0], %f12
	.word	0x9da0002f	! t0_kref+0x1314:   	fmovs	%f15, %f14
	.word	0x99a0002f	! t0_kref+0x1318:   	fmovs	%f15, %f12
	.word	0xa425f8ee	! t0_kref+0x131c:   	sub	%l7, -0x712, %l2
	.word	0x95b30490	! t0_kref+0x1320:   	fcmple32	%f12, %f16, %o2
	.word	0xec40a018	! t0_kref+0x1324:   	ldsw	[%g2 + 0x18], %l6
	.word	0x81db8019	! t0_kref+0x1328:   	flush	%sp + %i1
	.word	0x9ba3c8ae	! t0_kref+0x132c:   	fsubs	%f15, %f14, %f13
	.word	0xe4b61000	! t0_kref+0x1330:   	stha	%l2, [%i0]0x80
	.word	0xa1a0052e	! t0_kref+0x1334:   	fsqrts	%f14, %f16
	.word	0x87802080	! t0_kref+0x1338:   	mov	0x80, %asi
	.word	0x97400000	! t0_kref+0x133c:   	mov	%y, %o3
	.word	0x81abcaac	! t0_kref+0x1340:   	fcmpes	%fcc0, %f15, %f12
	.word	0x81ab4ab0	! t0_kref+0x1344:   	fcmpes	%fcc0, %f13, %f16
	.word	0xa68c8014	! t0_kref+0x1348:   	andcc	%l2, %l4, %l3
	.word	0x95418000	! t0_kref+0x134c:   	mov	%fprs, %o2
	.word	0xaed54015	! t0_kref+0x1350:   	umulcc	%l5, %l5, %l7
	.word	0x2d800002	! t0_kref+0x1354:   	fbg,a	_kref+0x135c
	.word	0xaa5da6c6	! t0_kref+0x1358:   	smul	%l6, 0x6c6, %l5
	.word	0xf03f4005	! t0_kref+0x135c:   	std	%i0, [%i5 + %g5]
	.word	0x30480005	! t0_kref+0x1360:   	ba,a,pt	%icc, _kref+0x1374
	.word	0xd0ae6013	! t0_kref+0x1364:   	stba	%o0, [%i1 + 0x13]%asi
	.word	0xa85d8017	! t0_kref+0x1368:   	smul	%l6, %l7, %l4
	.word	0x9bb007b0	! t0_kref+0x136c:   	fpackfix	%f16, %f13
	.word	0xa1a0054c	! t0_kref+0x1370:   	fsqrtd	%f12, %f16
	.word	0x99a3084c	! t0_kref+0x1374:   	faddd	%f12, %f12, %f12
	.word	0x99b40e0e	! t0_kref+0x1378:   	fand	%f16, %f14, %f12
	.word	0x99b407cc	! t0_kref+0x137c:   	pdist	%f16, %f12, %f12
	.word	0x8143c000	! t0_kref+0x1380:   	stbar
	.word	0x36480003	! t0_kref+0x1384:   	bge,a,pt	%icc, _kref+0x1390
	.word	0x9db38990	! t0_kref+0x1388:   	bshuffle	%f14, %f16, %f14
	.word	0xe6967fec	! t0_kref+0x138c:   	lduha	[%i1 - 0x14]%asi, %l3
	.word	0x33480004	! t0_kref+0x1390:   	fbe,a,pt	%fcc0, _kref+0x13a0
	.word	0xd83e7fe0	! t0_kref+0x1394:   	std	%o4, [%i1 - 0x20]
	.word	0x81ab4ab0	! t0_kref+0x1398:   	fcmpes	%fcc0, %f13, %f16
	.word	0xa6b52e28	! t0_kref+0x139c:   	orncc	%l4, 0xe28, %l3
	.word	0xa67c8015	! t0_kref+0x13a0:   	sdiv	%l2, %l5, %l3
	.word	0x9db38d40	! t0_kref+0x13a4:   	fnot1	%f14, %f14
	.word	0xa1a0054e	! t0_kref+0x13a8:   	fsqrtd	%f14, %f16
	.word	0xa1b30c90	! t0_kref+0x13ac:   	fandnot2	%f12, %f16, %f16
	.word	0x99b3874c	! t0_kref+0x13b0:   	fpack32	%f14, %f12, %f12
	.word	0xa1a408d0	! t0_kref+0x13b4:   	fsubd	%f16, %f16, %f16
	.word	0xa1a00550	! t0_kref+0x13b8:   	fsqrtd	%f16, %f16
	.word	0xe320a01c	! t0_kref+0x13bc:   	st	%f17, [%g2 + 0x1c]
	.word	0x2a480005	! t0_kref+0x13c0:   	bcs,a,pt	%icc, _kref+0x13d4
	.word	0xa9400000	! t0_kref+0x13c4:   	mov	%y, %l4
	.word	0xa895b25b	! t0_kref+0x13c8:   	orcc	%l6, -0xda5, %l4
	.word	0xa904fa1f	! t0_kref+0x13cc:   	taddcc	%l3, -0x5e1, %l4
	.word	0x9465a480	! t0_kref+0x13d0:   	subc	%l6, 0x480, %o2
	.word	0xd6462010	! t0_kref+0x13d4:   	ldsw	[%i0 + 0x10], %o3
	.word	0x9da0054c	! t0_kref+0x13d8:   	fsqrtd	%f12, %f14
	.word	0xe11e4000	! t0_kref+0x13dc:   	ldd	[%i1], %f16
	.word	0x97b4c174	! t0_kref+0x13e0:   	edge32ln	%l3, %l4, %o3
	.word	0xa3a44830	! t0_kref+0x13e4:   	fadds	%f17, %f16, %f17
	.word	0xa1b306b0	! t0_kref+0x13e8:   	fmul8x16al	%f12, %f16, %f16
	.word	0x9de3bfa0	! t0_kref+0x13ec:   	save	%sp, -0x60, %sp
	.word	0xabee8018	! t0_kref+0x13f0:   	restore	%i2, %i0, %l5
	.word	0x949dc014	! t0_kref+0x13f4:   	xorcc	%l7, %l4, %o2
	.word	0x94157f08	! t0_kref+0x13f8:   	or	%l5, -0xf8, %o2
	.word	0xac8de382	! t0_kref+0x13fc:   	andcc	%l7, 0x382, %l6
	.word	0x9255b156	! t0_kref+0x1400:   	umul	%l6, -0xeaa, %o1
	.word	0xad2a200b	! t0_kref+0x1404:   	sll	%o0, 0xb, %l6
	.word	0xa1b387ce	! t0_kref+0x1408:   	pdist	%f14, %f14, %f16
	.word	0xac1d0015	! t0_kref+0x140c:   	xor	%l4, %l5, %l6
	.word	0xd9be5895	! t0_kref+0x1410:   	stda	%f12, [%i1 + %l5]0xc4
	.word	0x99a3884c	! t0_kref+0x1414:   	faddd	%f14, %f12, %f12
	.word	0x9fc00004	! t0_kref+0x1418:   	call	%g0 + %g4
	.word	0x9da0002c	! t0_kref+0x141c:   	fmovs	%f12, %f14
	.word	0x27480004	! t0_kref+0x1420:   	fbul,a,pt	%fcc0, _kref+0x1430
	.word	0xd0c8a00f	! t0_kref+0x1424:   	ldsba	[%g2 + 0xf]%asi, %o0
	call	SYM(t0_subr2)
	.word	0xe36e001d	! t0_kref+0x142c:   	prefetch	%i0 + %i5, 17
	.word	0xa68d25e5	! t0_kref+0x1430:   	andcc	%l4, 0x5e5, %l3
	.word	0x9294c015	! t0_kref+0x1434:   	orcc	%l3, %l5, %o1
	.word	0xd920a034	! t0_kref+0x1438:   	st	%f12, [%g2 + 0x34]
	.word	0x81ac0a50	! t0_kref+0x143c:   	fcmpd	%fcc0, %f16, %f16
	.word	0x99b3cfae	! t0_kref+0x1440:   	fors	%f15, %f14, %f12
	.word	0x926237de	! t0_kref+0x1444:   	subc	%o0, -0x822, %o1
	.word	0xd01f4018	! t0_kref+0x1448:   	ldd	[%i5 + %i0], %o0
	.word	0x81b01025	! t0_kref+0x144c:   	siam	0x5
	.word	0xab05fd87	! t0_kref+0x1450:   	taddcc	%l7, -0x279, %l5
	.word	0xaa8a245f	! t0_kref+0x1454:   	andcc	%o0, 0x45f, %l5
	.word	0x26480007	! t0_kref+0x1458:   	bl,a,pt	%icc, _kref+0x1474
	.word	0xafb385d0	! t0_kref+0x145c:   	fcmpeq32	%f14, %f16, %l7
	.word	0x8584c017	! t0_kref+0x1460:   	wr	%l3, %l7, %ccr
	.word	0x99a0002d	! t0_kref+0x1464:   	fmovs	%f13, %f12
	.word	0x38800006	! t0_kref+0x1468:   	bgu,a	_kref+0x1480
	.word	0xa3a018d0	! t0_kref+0x146c:   	fdtos	%f16, %f17
	.word	0x2f800007	! t0_kref+0x1470:   	fbu,a	_kref+0x148c
	.word	0x9ba308b0	! t0_kref+0x1474:   	fsubs	%f12, %f16, %f13
	.word	0x9ba349af	! t0_kref+0x1478:   	fdivs	%f13, %f15, %f13
	.word	0xe890a00a	! t0_kref+0x147c:   	lduha	[%g2 + 0xa]%asi, %l4
	.word	0xe676401d	! t0_kref+0x1480:   	stx	%l3, [%i1 + %i5]
	.word	0xeeb6200e	! t0_kref+0x1484:   	stha	%l7, [%i0 + 0xe]%asi
	.word	0xaf700008	! t0_kref+0x1488:   	popc	%o0, %l7
	.word	0x99a018ce	! t0_kref+0x148c:   	fdtos	%f14, %f12
	.word	0x81ac0aac	! t0_kref+0x1490:   	fcmpes	%fcc0, %f16, %f12
	.word	0x99b306d0	! t0_kref+0x1494:   	fmul8sux16	%f12, %f16, %f12
	.word	0xf5ee101a	! t0_kref+0x1498:   	prefetcha	%i0 + %i2, 26
	.word	0xee260000	! t0_kref+0x149c:   	st	%l7, [%i0]
	.word	0xee28a011	! t0_kref+0x14a0:   	stb	%l7, [%g2 + 0x11]
	.word	0xa1b38630	! t0_kref+0x14a4:   	fmul8x16	%f14, %f16, %f16
	.word	0xdf20a02c	! t0_kref+0x14a8:   	st	%f15, [%g2 + 0x2c]
	.word	0x9fa3c9ae	! t0_kref+0x14ac:   	fdivs	%f15, %f14, %f15
	.word	0x9de3bfa0	! t0_kref+0x14b0:   	save	%sp, -0x60, %sp
	.word	0xb8b636a5	! t0_kref+0x14b4:   	orncc	%i0, -0x95b, %i4
	.word	0x95eec01d	! t0_kref+0x14b8:   	restore	%i3, %i5, %o2
	.word	0x9bb30e70	! t0_kref+0x14bc:   	fxnors	%f12, %f16, %f13
	.word	0x9275c008	! t0_kref+0x14c0:   	udiv	%l7, %o0, %o1
	.word	0x94b52e94	! t0_kref+0x14c4:   	orncc	%l4, 0xe94, %o2
	.word	0x9da0054c	! t0_kref+0x14c8:   	fsqrtd	%f12, %f14
	.word	0x9da0054e	! t0_kref+0x14cc:   	fsqrtd	%f14, %f14
	.word	0x99b40a4c	! t0_kref+0x14d0:   	fpadd32	%f16, %f12, %f12
	.word	0xa1a0012f	! t0_kref+0x14d4:   	fabss	%f15, %f16
	.word	0x9de3bfa0	! t0_kref+0x14d8:   	save	%sp, -0x60, %sp
	.word	0xafef001d	! t0_kref+0x14dc:   	restore	%i4, %i5, %l7
	.word	0xadb58137	! t0_kref+0x14e0:   	edge32n	%l6, %l7, %l6
	.word	0xdf06601c	! t0_kref+0x14e4:   	ld	[%i1 + 0x1c], %f15
	.word	0x948d294a	! t0_kref+0x14e8:   	andcc	%l4, 0x94a, %o2
	.word	0x943ce674	! t0_kref+0x14ec:   	xnor	%l3, 0x674, %o2
	.word	0xeab01019	! t0_kref+0x14f0:   	stha	%l5, [%g0 + %i1]0x80
	.word	0xaa3d0016	! t0_kref+0x14f4:   	xnor	%l4, %l6, %l5
	.word	0x93418000	! t0_kref+0x14f8:   	mov	%fprs, %o1
	.word	0xa1b44eed	! t0_kref+0x14fc:   	fornot2s	%f17, %f13, %f16
	.word	0xe4a8a00c	! t0_kref+0x1500:   	stba	%l2, [%g2 + 0xc]%asi
	.word	0x965d4014	! t0_kref+0x1504:   	smul	%l5, %l4, %o3
	.word	0xf83e001d	! t0_kref+0x1508:   	std	%i4, [%i0 + %i5]
	.word	0x90fd2a3f	! t0_kref+0x150c:   	sdivcc	%l4, 0xa3f, %o0
	.word	0x9db30d10	! t0_kref+0x1510:   	fandnot1	%f12, %f16, %f14
	.word	0xe1066010	! t0_kref+0x1514:   	ld	[%i1 + 0x10], %f16
	.word	0x9484c008	! t0_kref+0x1518:   	addcc	%l3, %o0, %o2
	.word	0xd0ae1000	! t0_kref+0x151c:   	stba	%o0, [%i0]0x80
	.word	0xee5e6000	! t0_kref+0x1520:   	ldx	[%i1], %l7
	.word	0xef6e401d	! t0_kref+0x1524:   	prefetch	%i1 + %i5, 23
	.word	0xa40c8016	! t0_kref+0x1528:   	and	%l2, %l6, %l2
	.word	0xa4058012	! t0_kref+0x152c:   	add	%l6, %l2, %l2
	.word	0xee200018	! t0_kref+0x1530:   	st	%l7, [%g0 + %i0]
	.word	0xdd1e401d	! t0_kref+0x1534:   	ldd	[%i1 + %i5], %f14
	.word	0xea96505b	! t0_kref+0x1538:   	lduha	[%i1 + %i3]0x82, %l5
	.word	0xaafd4013	! t0_kref+0x153c:   	sdivcc	%l5, %l3, %l5
	.word	0x9ba0002f	! t0_kref+0x1540:   	fmovs	%f15, %f13
	.word	0x9da3c82d	! t0_kref+0x1544:   	fadds	%f15, %f13, %f14
	.word	0xf43e4000	! t0_kref+0x1548:   	std	%i2, [%i1]
	.word	0xad418000	! t0_kref+0x154c:   	mov	%fprs, %l6
	.word	0x81da001d	! t0_kref+0x1550:   	flush	%o0 + %i5
	.word	0x9da0052c	! t0_kref+0x1554:   	fsqrts	%f12, %f14
	.word	0xa3a0012e	! t0_kref+0x1558:   	fabss	%f14, %f17
	.word	0xee20a02c	! t0_kref+0x155c:   	st	%l7, [%g2 + 0x2c]
	.word	0x99a40950	! t0_kref+0x1560:   	fmuld	%f16, %f16, %f12
	.word	0x99a40850	! t0_kref+0x1564:   	faddd	%f16, %f16, %f12
	.word	0x24800001	! t0_kref+0x1568:   	ble,a	_kref+0x156c
	.word	0xa1a000ad	! t0_kref+0x156c:   	fnegs	%f13, %f16
	.word	0xee30a01c	! t0_kref+0x1570:   	sth	%l7, [%g2 + 0x1c]
	.word	0xe8c8a03e	! t0_kref+0x1574:   	ldsba	[%g2 + 0x3e]%asi, %l4
	.word	0xd93e0000	! t0_kref+0x1578:   	std	%f12, [%i0]
	.word	0xac348008	! t0_kref+0x157c:   	orn	%l2, %o0, %l6
	.word	0x26480005	! t0_kref+0x1580:   	bl,a,pt	%icc, _kref+0x1594
	.word	0xec30a020	! t0_kref+0x1584:   	sth	%l6, [%g2 + 0x20]
	.word	0x9405c015	! t0_kref+0x1588:   	add	%l7, %l5, %o2
	.word	0x9664b03d	! t0_kref+0x158c:   	subc	%l2, -0xfc3, %o3
	.word	0xa1a0110e	! t0_kref+0x1590:   	fxtod	%f14, %f16
	.word	0xe1863fe8	! t0_kref+0x1594:   	lda	[%i0 - 0x18]%asi, %f16
	.word	0xee8e9018	! t0_kref+0x1598:   	lduba	[%i2 + %i0]0x80, %l7
	.word	0xd2c67ff4	! t0_kref+0x159c:   	ldswa	[%i1 - 0xc]%asi, %o1
	.word	0xa1a408ae	! t0_kref+0x15a0:   	fsubs	%f16, %f14, %f16
	.word	0x94258014	! t0_kref+0x15a4:   	sub	%l6, %l4, %o2
	.word	0xa4950016	! t0_kref+0x15a8:   	orcc	%l4, %l6, %l2
	.word	0xa1b30d10	! t0_kref+0x15ac:   	fandnot1	%f12, %f16, %f16
	.word	0x2f800007	! t0_kref+0x15b0:   	fbu,a	_kref+0x15cc
	.word	0xa1a388b0	! t0_kref+0x15b4:   	fsubs	%f14, %f16, %f16
	.word	0xe8762018	! t0_kref+0x15b8:   	stx	%l4, [%i0 + 0x18]
	.word	0xf9ee101b	! t0_kref+0x15bc:   	prefetcha	%i0 + %i3, 28
	.word	0x39800002	! t0_kref+0x15c0:   	fbuge,a	_kref+0x15c8
	.word	0xe968a042	! t0_kref+0x15c4:   	prefetch	%g2 + 0x42, 20
	.word	0xd81e7fe0	! t0_kref+0x15c8:   	ldd	[%i1 - 0x20], %o4
	.word	0x81580000	! t0_kref+0x15cc:   	flushw
	.word	0xabb384cc	! t0_kref+0x15d0:   	fcmpne32	%f14, %f12, %l5
	.word	0x99a308ae	! t0_kref+0x15d4:   	fsubs	%f12, %f14, %f12
	.word	0x9045c012	! t0_kref+0x15d8:   	addc	%l7, %l2, %o0
	.word	0xdb067ff0	! t0_kref+0x15dc:   	ld	[%i1 - 0x10], %f13
	.word	0xa3a0052f	! t0_kref+0x15e0:   	fsqrts	%f15, %f17
	.word	0x3a480007	! t0_kref+0x15e4:   	bcc,a,pt	%icc, _kref+0x1600
	.word	0x81d9400b	! t0_kref+0x15e8:   	flush	%g5 + %o3
	.word	0xdd180019	! t0_kref+0x15ec:   	ldd	[%g0 + %i1], %f14
	.word	0x9da389ce	! t0_kref+0x15f0:   	fdivd	%f14, %f14, %f14
	.word	0x99a00550	! t0_kref+0x15f4:   	fsqrtd	%f16, %f12
	.word	0x9da3894e	! t0_kref+0x15f8:   	fmuld	%f14, %f14, %f14
	.word	0xeca8a018	! t0_kref+0x15fc:   	stba	%l6, [%g2 + 0x18]%asi
	.word	0x929c8012	! t0_kref+0x1600:   	xorcc	%l2, %l2, %o1
	.word	0xa1a00550	! t0_kref+0x1604:   	fsqrtd	%f16, %f16
	.word	0x963a2d41	! t0_kref+0x1608:   	xnor	%o0, 0xd41, %o3
	.word	0x9ba3492e	! t0_kref+0x160c:   	fmuls	%f13, %f14, %f13
	.word	0x3b800001	! t0_kref+0x1610:   	fble,a	_kref+0x1614
	.word	0x9da3084c	! t0_kref+0x1614:   	faddd	%f12, %f12, %f14
	.word	0x97400000	! t0_kref+0x1618:   	mov	%y, %o3
	.word	0x36480007	! t0_kref+0x161c:   	bge,a,pt	%icc, _kref+0x1638
	.word	0xae74ad80	! t0_kref+0x1620:   	udiv	%l2, 0xd80, %l7
	.word	0x9685c015	! t0_kref+0x1624:   	addcc	%l7, %l5, %o3
	.word	0xc807bfe8	! t0_kref+0x1628:   	ld	[%fp - 0x18], %g4
	.word	0x90920017	! t0_kref+0x162c:   	orcc	%o0, %l7, %o0
	.word	0x9634aa7c	! t0_kref+0x1630:   	orn	%l2, 0xa7c, %o3
	.word	0xe81e6008	! t0_kref+0x1634:   	ldd	[%i1 + 8], %l4
	.word	0x95b4c128	! t0_kref+0x1638:   	edge32n	%l3, %o0, %o2
	.word	0xa1b38c90	! t0_kref+0x163c:   	fandnot2	%f14, %f16, %f16
	.word	0x9044a001	! t0_kref+0x1640:   	addc	%l2, 1, %o0
	.word	0x8143e062	! t0_kref+0x1644:   	membar	0x62
	.word	0xec6e2015	! t0_kref+0x1648:   	ldstub	[%i0 + 0x15], %l6
	.word	0xa1a00531	! t0_kref+0x164c:   	fsqrts	%f17, %f16
	.word	0xa5400000	! t0_kref+0x1650:   	mov	%y, %l2
	.word	0x99a30950	! t0_kref+0x1654:   	fmuld	%f12, %f16, %f12
	.word	0x8143e040	! t0_kref+0x1658:   	membar	0x40
	.word	0x901a0008	! t0_kref+0x165c:   	xor	%o0, %o0, %o0
	.word	0xa1b30d2e	! t0_kref+0x1660:   	fandnot1s	%f12, %f14, %f16
	.word	0xe8d6201e	! t0_kref+0x1664:   	ldsha	[%i0 + 0x1e]%asi, %l4
	.word	0x9224fcc9	! t0_kref+0x1668:   	sub	%l3, -0x337, %o1
	.word	0x9da8c02f	! t0_kref+0x166c:   	fmovsul	%fcc0, %f15, %f14
	.word	0xa1a0002f	! t0_kref+0x1670:   	fmovs	%f15, %f16
	.word	0x81ab0aac	! t0_kref+0x1674:   	fcmpes	%fcc0, %f12, %f12
	.word	0xae658016	! t0_kref+0x1678:   	subc	%l6, %l6, %l7
	.word	0xfd6e6000	! t0_kref+0x167c:   	prefetch	%i1, 30
	.word	0x9de3bfa0	! t0_kref+0x1680:   	save	%sp, -0x60, %sp
	.word	0xa9ee6aba	! t0_kref+0x1684:   	restore	%i1, 0xaba, %l4
	.word	0xd9066004	! t0_kref+0x1688:   	ld	[%i1 + 4], %f12
	.word	0xaa5defce	! t0_kref+0x168c:   	smul	%l7, 0xfce, %l5
	.word	0xa1a0054c	! t0_kref+0x1690:   	fsqrtd	%f12, %f16
	.word	0x9ba38930	! t0_kref+0x1694:   	fmuls	%f14, %f16, %f13
	.word	0x99b38def	! t0_kref+0x1698:   	fnands	%f14, %f15, %f12
	.word	0xa664e574	! t0_kref+0x169c:   	subc	%l3, 0x574, %l3
	.word	0x93b50356	! t0_kref+0x16a0:   	alignaddrl	%l4, %l6, %o1
	.word	0xa624afd0	! t0_kref+0x16a4:   	sub	%l2, 0xfd0, %l3
	.word	0xae650008	! t0_kref+0x16a8:   	subc	%l4, %o0, %l7
	.word	0x81ab0aac	! t0_kref+0x16ac:   	fcmpes	%fcc0, %f12, %f12
	.word	0x96ba2509	! t0_kref+0x16b0:   	xnorcc	%o0, 0x509, %o3
	.word	0x943d7fb0	! t0_kref+0x16b4:   	xnor	%l5, -0x50, %o2
	.word	0x9da0054c	! t0_kref+0x16b8:   	fsqrtd	%f12, %f14
	.word	0xe1be1856	! t0_kref+0x16bc:   	stda	%f16, [%i0 + %l6]0xc2
	.word	0xea260000	! t0_kref+0x16c0:   	st	%l5, [%i0]
	.word	0xaf053186	! t0_kref+0x16c4:   	taddcc	%l4, -0xe7a, %l7
	.word	0x99a01a4e	! t0_kref+0x16c8:   	fdtoi	%f14, %f12
	.word	0x99a00550	! t0_kref+0x16cc:   	fsqrtd	%f16, %f12
	.word	0x99b00ccc	! t0_kref+0x16d0:   	fnot2	%f12, %f12
	.word	0x9de3bfa0	! t0_kref+0x16d4:   	save	%sp, -0x60, %sp
	.word	0xa5e8001a	! t0_kref+0x16d8:   	restore	%g0, %i2, %l2
	.word	0x9fb30cb1	! t0_kref+0x16dc:   	fandnot2s	%f12, %f17, %f15
	.word	0x9135c012	! t0_kref+0x16e0:   	srl	%l7, %l2, %o0
	.word	0xa1b40acc	! t0_kref+0x16e4:   	fpsub32	%f16, %f12, %f16
	.word	0x9265be58	! t0_kref+0x16e8:   	subc	%l6, -0x1a8, %o1
	.word	0xa1a309af	! t0_kref+0x16ec:   	fdivs	%f12, %f15, %f16
	.word	0xa1b009ac	! t0_kref+0x16f0:   	fexpand	%f12, %f16
	.word	0x99b38d8e	! t0_kref+0x16f4:   	fxor	%f14, %f14, %f12
	.word	0xe46e0000	! t0_kref+0x16f8:   	ldstub	[%i0], %l2
	.word	0xaa84f25e	! t0_kref+0x16fc:   	addcc	%l3, -0xda2, %l5
	.word	0x9db30a0c	! t0_kref+0x1700:   	fpadd16	%f12, %f12, %f14
	.word	0x22480006	! t0_kref+0x1704:   	be,a,pt	%icc, _kref+0x171c
	.word	0xae3d20bf	! t0_kref+0x1708:   	xnor	%l4, 0xbf, %l7
	.word	0xe6a0a00c	! t0_kref+0x170c:   	sta	%l3, [%g2 + 0xc]%asi
	.word	0x21800002	! t0_kref+0x1710:   	fbn,a	_kref+0x1718
	.word	0xe420a00c	! t0_kref+0x1714:   	st	%l2, [%g2 + 0xc]
	.word	0xafb4c173	! t0_kref+0x1718:   	edge32ln	%l3, %l3, %l7
	.word	0x8143e040	! t0_kref+0x171c:   	membar	0x40
	.word	0x9da4084e	! t0_kref+0x1720:   	faddd	%f16, %f14, %f14
	.word	0x27800008	! t0_kref+0x1724:   	fbul,a	_kref+0x1744
	.word	0xe1be1892	! t0_kref+0x1728:   	stda	%f16, [%i0 + %l2]0xc4
	.word	0x3f800005	! t0_kref+0x172c:   	fbo,a	_kref+0x1740
	.word	0x99a309b1	! t0_kref+0x1730:   	fdivs	%f12, %f17, %f12
	.word	0xdb00a000	! t0_kref+0x1734:   	ld	[%g2], %f13
	.word	0x9da000af	! t0_kref+0x1738:   	fnegs	%f15, %f14
	.word	0x9da0054e	! t0_kref+0x173c:   	fsqrtd	%f14, %f14
	.word	0xee2e7fff	! t0_kref+0x1740:   	stb	%l7, [%i1 - 1]
	.word	0xacfcc015	! t0_kref+0x1744:   	sdivcc	%l3, %l5, %l6
	.word	0x9faa8031	! t0_kref+0x1748:   	fmovsue	%fcc0, %f17, %f15
	.word	0x8143e040	! t0_kref+0x174c:   	membar	0x40
	.word	0xae5c8015	! t0_kref+0x1750:   	smul	%l2, %l5, %l7
	.word	0xa1b009ad	! t0_kref+0x1754:   	fexpand	%f13, %f16
	.word	0xa1a0054e	! t0_kref+0x1758:   	fsqrtd	%f14, %f16
	.word	0xa1a0054e	! t0_kref+0x175c:   	fsqrtd	%f14, %f16
	.word	0xad1d2d20	! t0_kref+0x1760:   	tsubcctv	%l4, 0xd20, %l6
	.word	0x28800003	! t0_kref+0x1764:   	bleu,a	_kref+0x1770
	.word	0x9fb00fe0	! t0_kref+0x1768:   	fones	%f15
	.word	0x99a30950	! t0_kref+0x176c:   	fmuld	%f12, %f16, %f12
	.word	0x99b00cd0	! t0_kref+0x1770:   	fnot2	%f16, %f12
	.word	0x90654015	! t0_kref+0x1774:   	subc	%l5, %l5, %o0
	.word	0x9da389cc	! t0_kref+0x1778:   	fdivd	%f14, %f12, %f14
	.word	0xddbe1000	! t0_kref+0x177c:   	stda	%f14, [%i0]0x80
	.word	0xe1f61017	! t0_kref+0x1780:   	casxa	[%i0]0x80, %l7, %l0
	.word	0xa8222b0f	! t0_kref+0x1784:   	sub	%o0, 0xb0f, %l4
	.word	0x99b34aae	! t0_kref+0x1788:   	fpsub16s	%f13, %f14, %f12
	.word	0xa1a000b0	! t0_kref+0x178c:   	fnegs	%f16, %f16
	.word	0x27005d8a	! t0_kref+0x1790:   	sethi	%hi(0x1762800), %l3
	.word	0xa4620016	! t0_kref+0x1794:   	subc	%o0, %l6, %l2
	.word	0x95400000	! t0_kref+0x1798:   	mov	%y, %o2
	.word	0x94958014	! t0_kref+0x179c:   	orcc	%l6, %l4, %o2
	.word	0x9db40f8c	! t0_kref+0x17a0:   	for	%f16, %f12, %f14
	.word	0x9484aad2	! t0_kref+0x17a4:   	addcc	%l2, 0xad2, %o2
	.word	0x99a3892d	! t0_kref+0x17a8:   	fmuls	%f14, %f13, %f12
	.word	0x27800007	! t0_kref+0x17ac:   	fbul,a	_kref+0x17c8
	.word	0x8143c000	! t0_kref+0x17b0:   	stbar
	.word	0xe8280019	! t0_kref+0x17b4:   	stb	%l4, [%g0 + %i1]
	.word	0x9bb0076e	! t0_kref+0x17b8:   	fpack16	%f14, %f13
	.word	0xa404bf1a	! t0_kref+0x17bc:   	add	%l2, -0xe6, %l2
	.word	0x9da408b1	! t0_kref+0x17c0:   	fsubs	%f16, %f17, %f14
	.word	0xa1a0054e	! t0_kref+0x17c4:   	fsqrtd	%f14, %f16
	.word	0x99b00f2d	! t0_kref+0x17c8:   	fsrc2s	%f13, %f12
	.word	0xe808a00b	! t0_kref+0x17cc:   	ldub	[%g2 + 0xb], %l4
	.word	0x97418000	! t0_kref+0x17d0:   	mov	%fprs, %o3
	.word	0xee86505c	! t0_kref+0x17d4:   	lda	[%i1 + %i4]0x82, %l7
	.word	0xe06e8019	! t0_kref+0x17d8:   	ldstub	[%i2 + %i1], %l0
	.word	0x9215c015	! t0_kref+0x17dc:   	or	%l7, %l5, %o1
	.word	0x9ba0052d	! t0_kref+0x17e0:   	fsqrts	%f13, %f13
	.word	0x9db38d8c	! t0_kref+0x17e4:   	fxor	%f14, %f12, %f14
	.word	0xe4280018	! t0_kref+0x17e8:   	stb	%l2, [%g0 + %i0]
	.word	0x9ba0002e	! t0_kref+0x17ec:   	fmovs	%f14, %f13
	.word	0x96fcc016	! t0_kref+0x17f0:   	sdivcc	%l3, %l6, %o3
	.word	0xa1a0108c	! t0_kref+0x17f4:   	fxtos	%f12, %f16
	.word	0x81ab4aae	! t0_kref+0x17f8:   	fcmpes	%fcc0, %f13, %f14
	.word	0xeaa0a010	! t0_kref+0x17fc:   	sta	%l5, [%g2 + 0x10]%asi
	.word	0x905d3bf1	! t0_kref+0x1800:   	smul	%l4, -0x40f, %o0
	.word	0x99a30950	! t0_kref+0x1804:   	fmuld	%f12, %f16, %f12
	.word	0xafb5c057	! t0_kref+0x1808:   	edge8l	%l7, %l7, %l7
	.word	0xa1b40d0e	! t0_kref+0x180c:   	fandnot1	%f16, %f14, %f16
	.word	0xa8c48016	! t0_kref+0x1810:   	addccc	%l2, %l6, %l4
	.word	0x2f800005	! t0_kref+0x1814:   	fbu,a	_kref+0x1828
	.word	0xe3063fe8	! t0_kref+0x1818:   	ld	[%i0 - 0x18], %f17
	.word	0xad2d8008	! t0_kref+0x181c:   	sll	%l6, %o0, %l6
	.word	0xa1b00f10	! t0_kref+0x1820:   	fsrc2	%f16, %f16
	.word	0x250608f7	! t0_kref+0x1824:   	sethi	%hi(0x1823dc00), %l2
	.word	0xa3b44e70	! t0_kref+0x1828:   	fxnors	%f17, %f16, %f17
	.word	0xa1a01a4c	! t0_kref+0x182c:   	fdtoi	%f12, %f16
	.word	0xeeb63ff4	! t0_kref+0x1830:   	stha	%l7, [%i0 - 0xc]%asi
	.word	0xd9be1000	! t0_kref+0x1834:   	stda	%f12, [%i0]0x80
	.word	0x92648016	! t0_kref+0x1838:   	subc	%l2, %l6, %o1
	.word	0xae3cc008	! t0_kref+0x183c:   	xnor	%l3, %o0, %l7
	.word	0x99a0054c	! t0_kref+0x1840:   	fsqrtd	%f12, %f12
	.word	0xec2e4000	! t0_kref+0x1844:   	stb	%l6, [%i1]
	.word	0xc807bff0	! t0_kref+0x1848:   	ld	[%fp - 0x10], %g4
	.word	0xee2e7ffa	! t0_kref+0x184c:   	stb	%l7, [%i1 - 6]
	.word	0x90ad4008	! t0_kref+0x1850:   	andncc	%l5, %o0, %o0
	.word	0xe42e601f	! t0_kref+0x1854:   	stb	%l2, [%i1 + 0x1f]
	.word	0xa43dc016	! t0_kref+0x1858:   	xnor	%l7, %l6, %l2
	.word	0x3c480004	! t0_kref+0x185c:   	bpos,a,pt	%icc, _kref+0x186c
	.word	0x9db40d8c	! t0_kref+0x1860:   	fxor	%f16, %f12, %f14
	.word	0x9db30d0e	! t0_kref+0x1864:   	fandnot1	%f12, %f14, %f14
	.word	0xa845346b	! t0_kref+0x1868:   	addc	%l4, -0xb95, %l4
	.word	0xd068a010	! t0_kref+0x186c:   	ldstub	[%g2 + 0x10], %o0
	.word	0xa3a349ae	! t0_kref+0x1870:   	fdivs	%f13, %f14, %f17
	.word	0x93b4058c	! t0_kref+0x1874:   	fcmpgt32	%f16, %f12, %o1
	.word	0xdd1e001d	! t0_kref+0x1878:   	ldd	[%i0 + %i5], %f14
	.word	0x9da0002f	! t0_kref+0x187c:   	fmovs	%f15, %f14
	.word	0xadb4044c	! t0_kref+0x1880:   	fcmpne16	%f16, %f12, %l6
	.word	0xa1a01a4e	! t0_kref+0x1884:   	fdtoi	%f14, %f16
	.word	0xa9b4c048	! t0_kref+0x1888:   	edge8l	%l3, %o0, %l4
	.word	0xe888a03d	! t0_kref+0x188c:   	lduba	[%g2 + 0x3d]%asi, %l4
	.word	0x81b01025	! t0_kref+0x1890:   	siam	0x5
	.word	0xe8362014	! t0_kref+0x1894:   	sth	%l4, [%i0 + 0x14]
	.word	0x90f58015	! t0_kref+0x1898:   	udivcc	%l6, %l5, %o0
	.word	0x9ba4492d	! t0_kref+0x189c:   	fmuls	%f17, %f13, %f13
	.word	0x8143e027	! t0_kref+0x18a0:   	membar	0x27
	.word	0x1127c878	! t0_kref+0x18a4:   	sethi	%hi(0x9f21e000), %o0
	.word	0xd9be5000	! t0_kref+0x18a8:   	stda	%f12, [%i1]0x80
	.word	0xe1180018	! t0_kref+0x18ac:   	ldd	[%g0 + %i0], %f16
	.word	0xa49cc016	! t0_kref+0x18b0:   	xorcc	%l3, %l6, %l2
	.word	0xac9d4016	! t0_kref+0x18b4:   	xorcc	%l5, %l6, %l6
	.word	0xac9cbd5d	! t0_kref+0x18b8:   	xorcc	%l2, -0x2a3, %l6
	.word	0xa9b5c136	! t0_kref+0x18bc:   	edge32n	%l7, %l6, %l4
	.word	0xa1a348af	! t0_kref+0x18c0:   	fsubs	%f13, %f15, %f16
	.word	0x99a409cc	! t0_kref+0x18c4:   	fdivd	%f16, %f12, %f12
	.word	0xd030a01a	! t0_kref+0x18c8:   	sth	%o0, [%g2 + 0x1a]
	.word	0x86102002	! t0_kref+0x18cc:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x18d0:   	bne,a	_kref+0x18d0
	.word	0x86a0e001	! t0_kref+0x18d4:   	subcc	%g3, 1, %g3
	.word	0xfbee101a	! t0_kref+0x18d8:   	prefetcha	%i0 + %i2, 29
	.word	0xa1a0014c	! t0_kref+0x18dc:   	fabsd	%f12, %f16
	.word	0x001fffff	! t0_kref+0x18e0:   	illtrap	0x1fffff
	.word	0xd9be1888	! t0_kref+0x18e4:   	stda	%f12, [%i0 + %o0]0xc4
	.word	0x943dbbed	! t0_kref+0x18e8:   	xnor	%l6, -0x413, %o2
	.word	0x99a38950	! t0_kref+0x18ec:   	fmuld	%f14, %f16, %f12
	.word	0x9de3bfa0	! t0_kref+0x18f0:   	save	%sp, -0x60, %sp
	.word	0xabef001a	! t0_kref+0x18f4:   	restore	%i4, %i2, %l5
	.word	0x99a0054c	! t0_kref+0x18f8:   	fsqrtd	%f12, %f12
	.word	0xe1871018	! t0_kref+0x18fc:   	lda	[%i4 + %i0]0x80, %f16
	.word	0x9fa01a50	! t0_kref+0x1900:   	fdtoi	%f16, %f15
	.word	0xc56e6018	! t0_kref+0x1904:   	prefetch	%i1 + 0x18, 2
	.word	0xe306001c	! t0_kref+0x1908:   	ld	[%i0 + %i4], %f17
	.word	0xac452b6e	! t0_kref+0x190c:   	addc	%l4, 0xb6e, %l6
	.word	0xa1a00030	! t0_kref+0x1910:   	fmovs	%f16, %f16
	.word	0xa63a0008	! t0_kref+0x1914:   	xnor	%o0, %o0, %l3
	.word	0xa1a0012d	! t0_kref+0x1918:   	fabss	%f13, %f16
	.word	0xacf48017	! t0_kref+0x191c:   	udivcc	%l2, %l7, %l6
	.word	0xdd380018	! t0_kref+0x1920:   	std	%f14, [%g0 + %i0]
	.word	0x37800006	! t0_kref+0x1924:   	fbge,a	_kref+0x193c
	.word	0xa1a308d0	! t0_kref+0x1928:   	fsubd	%f12, %f16, %f16
	.word	0xacb5a387	! t0_kref+0x192c:   	orncc	%l6, 0x387, %l6
	.word	0x9fa018d0	! t0_kref+0x1930:   	fdtos	%f16, %f15
	.word	0x001fffff	! t0_kref+0x1934:   	illtrap	0x1fffff
	.word	0xa4f5291c	! t0_kref+0x1938:   	udivcc	%l4, 0x91c, %l2
	.word	0xd0a0a030	! t0_kref+0x193c:   	sta	%o0, [%g2 + 0x30]%asi
	.word	0xd93e001d	! t0_kref+0x1940:   	std	%f12, [%i0 + %i5]
	.word	0xee56c019	! t0_kref+0x1944:   	ldsh	[%i3 + %i1], %l7
	.word	0x903a0016	! t0_kref+0x1948:   	xnor	%o0, %l6, %o0
	.word	0x3d800007	! t0_kref+0x194c:   	fbule,a	_kref+0x1968
	.word	0xa5b500e8	! t0_kref+0x1950:   	edge16ln	%l4, %o0, %l2
	.word	0xa1a00550	! t0_kref+0x1954:   	fsqrtd	%f16, %f16
	.word	0xa1b30d90	! t0_kref+0x1958:   	fxor	%f12, %f16, %f16
	.word	0x99a00530	! t0_kref+0x195c:   	fsqrts	%f16, %f12
	.word	0xe3862008	! t0_kref+0x1960:   	lda	[%i0 + 8]%asi, %f17
	.word	0x9da000ac	! t0_kref+0x1964:   	fnegs	%f12, %f14
	.word	0x9fa0052d	! t0_kref+0x1968:   	fsqrts	%f13, %f15
	.word	0x90b5fe37	! t0_kref+0x196c:   	orncc	%l7, -0x1c9, %o0
	.word	0xa1a000ce	! t0_kref+0x1970:   	fnegd	%f14, %f16
	.word	0x9fa3882d	! t0_kref+0x1974:   	fadds	%f14, %f13, %f15
	.word	0xaa223bf8	! t0_kref+0x1978:   	sub	%o0, -0x408, %l5
	.word	0x81dac00a	! t0_kref+0x197c:   	flush	%o3 + %o2
	.word	0xadb580d3	! t0_kref+0x1980:   	edge16l	%l6, %l3, %l6
	.word	0x9da0052e	! t0_kref+0x1984:   	fsqrts	%f14, %f14
	.word	0xe13e401d	! t0_kref+0x1988:   	std	%f16, [%i1 + %i5]
	.word	0xf83e7ff8	! t0_kref+0x198c:   	std	%i4, [%i1 - 8]
	.word	0xe2e81018	! t0_kref+0x1990:   	ldstuba	[%g0 + %i0]0x80, %l1
	.word	0xeb68a08a	! t0_kref+0x1994:   	prefetch	%g2 + 0x8a, 21
	.word	0x93b384cc	! t0_kref+0x1998:   	fcmpne32	%f14, %f12, %o1
	.word	0xa1a018ce	! t0_kref+0x199c:   	fdtos	%f14, %f16
	.word	0xa1b3098c	! t0_kref+0x19a0:   	bshuffle	%f12, %f12, %f16
	.word	0xe1be5a1d	! t0_kref+0x19a4:   	stda	%f16, [%i1 + %i5]0xd0
	.word	0x93b5c173	! t0_kref+0x19a8:   	edge32ln	%l7, %l3, %o1
	.word	0x99a408ce	! t0_kref+0x19ac:   	fsubd	%f16, %f14, %f12
	.word	0xadb48333	! t0_kref+0x19b0:   	bmask	%l2, %l3, %l6
	.word	0xa1a0054e	! t0_kref+0x19b4:   	fsqrtd	%f14, %f16
	.word	0xa3a308b0	! t0_kref+0x19b8:   	fsubs	%f12, %f16, %f17
	.word	0xba102000	! t0_kref+0x19bc:   	mov	0x0, %i5
	.word	0x99a018d0	! t0_kref+0x19c0:   	fdtos	%f16, %f12
	.word	0x81ac0ace	! t0_kref+0x19c4:   	fcmped	%fcc0, %f16, %f14
	.word	0xa1b00c20	! t0_kref+0x19c8:   	fzeros	%f16
	.word	0x24800001	! t0_kref+0x19cc:   	ble,a	_kref+0x19d0
	.word	0xe66e3ffd	! t0_kref+0x19d0:   	ldstub	[%i0 - 3], %l3
	.word	0xec562002	! t0_kref+0x19d4:   	ldsh	[%i0 + 2], %l6
	.word	0x99a40950	! t0_kref+0x19d8:   	fmuld	%f16, %f16, %f12
	.word	0xea267fec	! t0_kref+0x19dc:   	st	%l5, [%i1 - 0x14]
	.word	0xa4fcc014	! t0_kref+0x19e0:   	sdivcc	%l3, %l4, %l2
	.word	0x9db44e31	! t0_kref+0x19e4:   	fands	%f17, %f17, %f14
	.word	0x8143e040	! t0_kref+0x19e8:   	membar	0x40
	.word	0xa1a30950	! t0_kref+0x19ec:   	fmuld	%f12, %f16, %f16
	.word	0xa1a0054e	! t0_kref+0x19f0:   	fsqrtd	%f14, %f16
	.word	0x8143e073	! t0_kref+0x19f4:   	membar	0x73
	.word	0xd246001c	! t0_kref+0x19f8:   	ldsw	[%i0 + %i4], %o1
	.word	0xeab0a02a	! t0_kref+0x19fc:   	stha	%l5, [%g2 + 0x2a]%asi
	.word	0x99a01891	! t0_kref+0x1a00:   	fitos	%f17, %f12
	.word	0xeeb0a010	! t0_kref+0x1a04:   	stha	%l7, [%g2 + 0x10]%asi
	.word	0xb6102004	! t0_kref+0x1a08:   	mov	0x4, %i3
	.word	0x95320016	! t0_kref+0x1a0c:   	srl	%o0, %l6, %o2
	.word	0x91b404cc	! t0_kref+0x1a10:   	fcmpne32	%f16, %f12, %o0
	.word	0xa1b407cc	! t0_kref+0x1a14:   	pdist	%f16, %f12, %f16
	.word	0x99a4482f	! t0_kref+0x1a18:   	fadds	%f17, %f15, %f12
	.word	0x969d0008	! t0_kref+0x1a1c:   	xorcc	%l4, %o0, %o3
	call	SYM(t0_subr3)
	.word	0xdd3e2008	! t0_kref+0x1a24:   	std	%f14, [%i0 + 8]
	.word	0x9fc00004	! t0_kref+0x1a28:   	call	%g0 + %g4
	.word	0xea2e2019	! t0_kref+0x1a2c:   	stb	%l5, [%i0 + 0x19]
	.word	0xc9ee5015	! t0_kref+0x1a30:   	prefetcha	%i1 + %l5, 4
	.word	0xa45cf925	! t0_kref+0x1a34:   	smul	%l3, -0x6db, %l2
	.word	0xa1a000b1	! t0_kref+0x1a38:   	fnegs	%f17, %f16
	.word	0x2f800007	! t0_kref+0x1a3c:   	fbu,a	_kref+0x1a58
	.word	0x9ba0012c	! t0_kref+0x1a40:   	fabss	%f12, %f13
	.word	0xe3263ff0	! t0_kref+0x1a44:   	st	%f17, [%i0 - 0x10]
	.word	0x969dc017	! t0_kref+0x1a48:   	xorcc	%l7, %l7, %o3
	.word	0xa7b3848e	! t0_kref+0x1a4c:   	fcmple32	%f14, %f14, %l3
	.word	0x9fb40cad	! t0_kref+0x1a50:   	fandnot2s	%f16, %f13, %f15
	.word	0xabb20036	! t0_kref+0x1a54:   	edge8n	%o0, %l6, %l5
	.word	0xa92c8017	! t0_kref+0x1a58:   	sll	%l2, %l7, %l4
	.word	0xa5400000	! t0_kref+0x1a5c:   	mov	%y, %l2
	.word	0x81580000	! t0_kref+0x1a60:   	flushw
	.word	0x86102002	! t0_kref+0x1a64:   	mov	0x2, %g3
	.word	0x32800000	! t0_kref+0x1a68:   	bne,a	_kref+0x1a68
	.word	0x86a0e001	! t0_kref+0x1a6c:   	subcc	%g3, 1, %g3
	.word	0x99b44971	! t0_kref+0x1a70:   	fpmerge	%f17, %f17, %f12
	.word	0x9684fd3e	! t0_kref+0x1a74:   	addcc	%l3, -0x2c2, %o3
	.word	0xeb68a046	! t0_kref+0x1a78:   	prefetch	%g2 + 0x46, 21
	.word	0xae252fca	! t0_kref+0x1a7c:   	sub	%l4, 0xfca, %l7
	.word	0x92acc016	! t0_kref+0x1a80:   	andncc	%l3, %l6, %o1
	.word	0xe19e5a5b	! t0_kref+0x1a84:   	ldda	[%i1 + %i3]0xd2, %f16
	.word	0xe3801019	! t0_kref+0x1a88:   	lda	[%g0 + %i1]0x80, %f17
	.word	0xa1a40850	! t0_kref+0x1a8c:   	faddd	%f16, %f16, %f16
	.word	0x96ad373b	! t0_kref+0x1a90:   	andncc	%l4, -0x8c5, %o3
	.word	0xd0700019	! t0_kref+0x1a94:   	stx	%o0, [%g0 + %i1]
	.word	0xa645315f	! t0_kref+0x1a98:   	addc	%l4, -0xea1, %l3
	.word	0xa3a3492e	! t0_kref+0x1a9c:   	fmuls	%f13, %f14, %f17
	.word	0x38800008	! t0_kref+0x1aa0:   	bgu,a	_kref+0x1ac0
	.word	0xa8e4c013	! t0_kref+0x1aa4:   	subccc	%l3, %l3, %l4
	.word	0x25480002	! t0_kref+0x1aa8:   	fblg,a,pt	%fcc0, _kref+0x1ab0
	.word	0xd050a03e	! t0_kref+0x1aac:   	ldsh	[%g2 + 0x3e], %o0
	.word	0xdd070019	! t0_kref+0x1ab0:   	ld	[%i4 + %i1], %f14
	.word	0x99a3084c	! t0_kref+0x1ab4:   	faddd	%f12, %f12, %f12
	.word	0x9da01a30	! t0_kref+0x1ab8:   	fstoi	%f16, %f14
	.word	0x35800003	! t0_kref+0x1abc:   	fbue,a	_kref+0x1ac8
	.word	0xed68a049	! t0_kref+0x1ac0:   	prefetch	%g2 + 0x49, 22
	.word	0xae8dbbfb	! t0_kref+0x1ac4:   	andcc	%l6, -0x405, %l7
	.word	0x3d480007	! t0_kref+0x1ac8:   	fbule,a,pt	%fcc0, _kref+0x1ae4
	.word	0xee563fee	! t0_kref+0x1acc:   	ldsh	[%i0 - 0x12], %l7
	.word	0xa3b34d2f	! t0_kref+0x1ad0:   	fandnot1s	%f13, %f15, %f17
	.word	0x37800002	! t0_kref+0x1ad4:   	fbge,a	_kref+0x1adc
	.word	0x947d6e74	! t0_kref+0x1ad8:   	sdiv	%l5, 0xe74, %o2
	.word	0xa1a01090	! t0_kref+0x1adc:   	fxtos	%f16, %f16
	.word	0x99a4482e	! t0_kref+0x1ae0:   	fadds	%f17, %f14, %f12
	.word	0x9da3884e	! t0_kref+0x1ae4:   	faddd	%f14, %f14, %f14
	.word	0xf83e0000	! t0_kref+0x1ae8:   	std	%i4, [%i0]
	.word	0x900df98a	! t0_kref+0x1aec:   	and	%l7, -0x676, %o0
	.word	0xfdee501a	! t0_kref+0x1af0:   	prefetcha	%i1 + %i2, 30
	.word	0xe26e201a	! t0_kref+0x1af4:   	ldstub	[%i0 + 0x1a], %l1
	.word	0xd686501c	! t0_kref+0x1af8:   	lda	[%i1 + %i4]0x80, %o3
	.word	0xe9ee501c	! t0_kref+0x1afc:   	prefetcha	%i1 + %i4, 20
	.word	0x38800007	! t0_kref+0x1b00:   	bgu,a	_kref+0x1b1c
	.word	0x9da40850	! t0_kref+0x1b04:   	faddd	%f16, %f16, %f14
	.word	0x96f5b52d	! t0_kref+0x1b08:   	udivcc	%l6, -0xad3, %o3
	.word	0xa3a018ce	! t0_kref+0x1b0c:   	fdtos	%f14, %f17
	.word	0x32800002	! t0_kref+0x1b10:   	bne,a	_kref+0x1b18
	.word	0xd048a01b	! t0_kref+0x1b14:   	ldsb	[%g2 + 0x1b], %o0
	.word	0xdf80a018	! t0_kref+0x1b18:   	lda	[%g2 + 0x18]%asi, %f15
	.word	0xe5f65013	! t0_kref+0x1b1c:   	casxa	[%i1]0x80, %l3, %l2
	.word	0xae84a7d7	! t0_kref+0x1b20:   	addcc	%l2, 0x7d7, %l7
	.word	0x25800005	! t0_kref+0x1b24:   	fblg,a	_kref+0x1b38
	.word	0xa1a00531	! t0_kref+0x1b28:   	fsqrts	%f17, %f16
	.word	0xe62e3ff4	! t0_kref+0x1b2c:   	stb	%l3, [%i0 - 0xc]
	.word	0xa6b22a3a	! t0_kref+0x1b30:   	orncc	%o0, 0xa3a, %l3
	.word	0xd090a012	! t0_kref+0x1b34:   	lduha	[%g2 + 0x12]%asi, %o0
	.word	0xd900a004	! t0_kref+0x1b38:   	ld	[%g2 + 4], %f12
	.word	0x93b50132	! t0_kref+0x1b3c:   	edge32n	%l4, %l2, %o1
	.word	0xdd180019	! t0_kref+0x1b40:   	ldd	[%g0 + %i1], %f14
	.word	0xa1a01a4c	! t0_kref+0x1b44:   	fdtoi	%f12, %f16
	.word	0xa5250016	! t0_kref+0x1b48:   	mulscc	%l4, %l6, %l2
	.word	0xede8a00f	! t0_kref+0x1b4c:   	prefetcha	%g2 + 0xf, 22
	.word	0x2c800005	! t0_kref+0x1b50:   	bneg,a	_kref+0x1b64
	.word	0xa8558008	! t0_kref+0x1b54:   	umul	%l6, %o0, %l4
	.word	0x969d2f39	! t0_kref+0x1b58:   	xorcc	%l4, 0xf39, %o3
	.word	0xaf3d0014	! t0_kref+0x1b5c:   	sra	%l4, %l4, %l7
	.word	0xf43e6010	! t0_kref+0x1b60:   	std	%i2, [%i1 + 0x10]
	.word	0x9fa0052c	! t0_kref+0x1b64:   	fsqrts	%f12, %f15
	.word	0x20480008	! t0_kref+0x1b68:   	bn,a,pt	%icc, _kref+0x1b88
	.word	0xe3ee101d	! t0_kref+0x1b6c:   	prefetcha	%i0 + %i5, 17
	.word	0x2e800008	! t0_kref+0x1b70:   	bvs,a	_kref+0x1b90
	.word	0xa1a38950	! t0_kref+0x1b74:   	fmuld	%f14, %f16, %f16
	.word	0x97b50048	! t0_kref+0x1b78:   	edge8l	%l4, %o0, %o3
	.word	0x24480007	! t0_kref+0x1b7c:   	ble,a,pt	%icc, _kref+0x1b98
	.word	0x937026cb	! t0_kref+0x1b80:   	popc	0x6cb, %o1
	.word	0xe19e501d	! t0_kref+0x1b84:   	ldda	[%i1 + %i5]0x80, %f16
	.word	0xa1b4098e	! t0_kref+0x1b88:   	bshuffle	%f16, %f14, %f16
	.word	0x95b40410	! t0_kref+0x1b8c:   	fcmple16	%f16, %f16, %o2
	.word	0xaab50017	! t0_kref+0x1b90:   	orncc	%l4, %l7, %l5
	.word	0xd83e3fe0	! t0_kref+0x1b94:   	std	%o4, [%i0 - 0x20]
	.word	0x9fa018ce	! t0_kref+0x1b98:   	fdtos	%f14, %f15
	.word	0x90854016	! t0_kref+0x1b9c:   	addcc	%l5, %l6, %o0
	.word	0xea26001c	! t0_kref+0x1ba0:   	st	%l5, [%i0 + %i4]
	.word	0x9db386d0	! t0_kref+0x1ba4:   	fmul8sux16	%f14, %f16, %f14
	.word	0x9ba018ce	! t0_kref+0x1ba8:   	fdtos	%f14, %f13
	.word	0x34800001	! t0_kref+0x1bac:   	bg,a	_kref+0x1bb0
	.word	0x99b00c00	! t0_kref+0x1bb0:   	fzero	%f12
	.word	0xa8fd8017	! t0_kref+0x1bb4:   	sdivcc	%l6, %l7, %l4
	.word	0xa1a00550	! t0_kref+0x1bb8:   	fsqrtd	%f16, %f16
	.word	0xae3cc008	! t0_kref+0x1bbc:   	xnor	%l3, %o0, %l7
	.word	0xa1a4482e	! t0_kref+0x1bc0:   	fadds	%f17, %f14, %f16
	.word	0x9da3084c	! t0_kref+0x1bc4:   	faddd	%f12, %f12, %f14
	.word	0xad678016	! t0_kref+0x1bc8:   	movpos	%icc, %l6, %l6
	.word	0xa3b00c20	! t0_kref+0x1bcc:   	fzeros	%f17
	.word	0x95400000	! t0_kref+0x1bd0:   	mov	%y, %o2
	.word	0xe820a038	! t0_kref+0x1bd4:   	st	%l4, [%g2 + 0x38]
	.word	0xa1a40850	! t0_kref+0x1bd8:   	faddd	%f16, %f16, %f16
	.word	0xd9bf5a19	! t0_kref+0x1bdc:   	stda	%f12, [%i5 + %i1]0xd0
	.word	0x928a3212	! t0_kref+0x1be0:   	andcc	%o0, -0xdee, %o1
	.word	0xe42e7ff0	! t0_kref+0x1be4:   	stb	%l2, [%i1 - 0x10]
	.word	0xe4267ff8	! t0_kref+0x1be8:   	st	%l2, [%i1 - 8]
	.word	0xae5db91d	! t0_kref+0x1bec:   	smul	%l6, -0x6e3, %l7
	.word	0x9fa388b0	! t0_kref+0x1bf0:   	fsubs	%f14, %f16, %f15
	.word	0x3e800003	! t0_kref+0x1bf4:   	bvc,a	_kref+0x1c00
	.word	0xee30a03c	! t0_kref+0x1bf8:   	sth	%l7, [%g2 + 0x3c]
	.word	0x90857609	! t0_kref+0x1bfc:   	addcc	%l5, -0x9f7, %o0
	.word	0xe1000019	! t0_kref+0x1c00:   	ld	[%g0 + %i1], %f16
	.word	0x99a388ac	! t0_kref+0x1c04:   	fsubs	%f14, %f12, %f12
	.word	0x81ab4aac	! t0_kref+0x1c08:   	fcmpes	%fcc0, %f13, %f12
	.word	0x81ac4aac	! t0_kref+0x1c0c:   	fcmpes	%fcc0, %f17, %f12
	.word	0x965dab36	! t0_kref+0x1c10:   	smul	%l6, 0xb36, %o3
	.word	0xa3a389b0	! t0_kref+0x1c14:   	fdivs	%f14, %f16, %f17
	.word	0x96756146	! t0_kref+0x1c18:   	udiv	%l5, 0x146, %o3
	.word	0xa43d0008	! t0_kref+0x1c1c:   	xnor	%l4, %o0, %l2
	.word	0xe1380018	! t0_kref+0x1c20:   	std	%f16, [%g0 + %i0]
	.word	0x943a0017	! t0_kref+0x1c24:   	xnor	%o0, %l7, %o2
	.word	0x3f800001	! t0_kref+0x1c28:   	fbo,a	_kref+0x1c2c
	.word	0xad400000	! t0_kref+0x1c2c:   	mov	%y, %l6
	.word	0xae3dc016	! t0_kref+0x1c30:   	xnor	%l7, %l6, %l7
	.word	0x2f0bb31e	! t0_kref+0x1c34:   	sethi	%hi(0x2ecc7800), %l7
	.word	0xd0a8a033	! t0_kref+0x1c38:   	stba	%o0, [%g2 + 0x33]%asi
	.word	0x9da309ce	! t0_kref+0x1c3c:   	fdivd	%f12, %f14, %f14
	.word	0xa71d2b36	! t0_kref+0x1c40:   	tsubcctv	%l4, 0xb36, %l3
	.word	0xdd00a030	! t0_kref+0x1c44:   	ld	[%g2 + 0x30], %f14
	.word	0xa4fdc015	! t0_kref+0x1c48:   	sdivcc	%l7, %l5, %l2
	.word	0x99b40ece	! t0_kref+0x1c4c:   	fornot2	%f16, %f14, %f12
	.word	0x11201173	! t0_kref+0x1c50:   	sethi	%hi(0x8045cc00), %o0
	.word	0xe13e401d	! t0_kref+0x1c54:   	std	%f16, [%i1 + %i5]
	.word	0xe6363fec	! t0_kref+0x1c58:   	sth	%l3, [%i0 - 0x14]
	.word	0x9da3092d	! t0_kref+0x1c5c:   	fmuls	%f12, %f13, %f14
	.word	0xa1a00550	! t0_kref+0x1c60:   	fsqrtd	%f16, %f16
	.word	0xa1b00f10	! t0_kref+0x1c64:   	fsrc2	%f16, %f16
	.word	0xa1b3ccae	! t0_kref+0x1c68:   	fandnot2s	%f15, %f14, %f16
	.word	0xa1a01a50	! t0_kref+0x1c6c:   	fdtoi	%f16, %f16
	.word	0x32800008	! t0_kref+0x1c70:   	bne,a	_kref+0x1c90
	.word	0xe82e6013	! t0_kref+0x1c74:   	stb	%l4, [%i1 + 0x13]
	.word	0xd91e7ff0	! t0_kref+0x1c78:   	ldd	[%i1 - 0x10], %f12
	.word	0x9ba00131	! t0_kref+0x1c7c:   	fabss	%f17, %f13
	.word	0xe6580018	! t0_kref+0x1c80:   	ldx	[%g0 + %i0], %l3
	.word	0xf5ee501b	! t0_kref+0x1c84:   	prefetcha	%i1 + %i3, 26
	.word	0xe11fbe18	! t0_kref+0x1c88:   	ldd	[%fp - 0x1e8], %f16
	.word	0x81ab8aac	! t0_kref+0x1c8c:   	fcmpes	%fcc0, %f14, %f12
	.word	0xa1a388ad	! t0_kref+0x1c90:   	fsubs	%f14, %f13, %f16
	.word	0x878020d2	! t0_kref+0x1c94:   	mov	0xd2, %asi
	.word	0x878020e0	! t0_kref+0x1c98:   	mov	0xe0, %asi
	.word	0x99a4084c	! t0_kref+0x1c9c:   	faddd	%f16, %f12, %f12
	.word	0xe48e9018	! t0_kref+0x1ca0:   	lduba	[%i2 + %i0]0x80, %l2
	.word	0xe48e5000	! t0_kref+0x1ca4:   	lduba	[%i1]0x80, %l2
	.word	0x36800005	! t0_kref+0x1ca8:   	bge,a	_kref+0x1cbc
	.word	0xf007bfe0	! t0_kref+0x1cac:   	ld	[%fp - 0x20], %i0
	.word	0xec8e5000	! t0_kref+0x1cb0:   	lduba	[%i1]0x80, %l6
	.word	0x97400000	! t0_kref+0x1cb4:   	mov	%y, %o3
	.word	0x99a018ce	! t0_kref+0x1cb8:   	fdtos	%f14, %f12
	.word	0x28480002	! t0_kref+0x1cbc:   	bleu,a,pt	%icc, _kref+0x1cc4
	.word	0xa1b38e80	! t0_kref+0x1cc0:   	fsrc1	%f14, %f16
	.word	0x96fcc008	! t0_kref+0x1cc4:   	sdivcc	%l3, %o0, %o3
	.word	0xed68a048	! t0_kref+0x1cc8:   	prefetch	%g2 + 0x48, 22
	.word	0x3e800003	! t0_kref+0x1ccc:   	bvc,a	_kref+0x1cd8
	.word	0x9db4062c	! t0_kref+0x1cd0:   	fmul8x16	%f16, %f12, %f14
	.word	0x9fc10000	! t0_kref+0x1cd4:   	call	%g4
	.word	0xae7d4017	! t0_kref+0x1cd8:   	sdiv	%l5, %l7, %l7
	.word	0xe82e601f	! t0_kref+0x1cdc:   	stb	%l4, [%i1 + 0x1f]
	.word	0xac756df1	! t0_kref+0x1ce0:   	udiv	%l5, 0xdf1, %l6
	.word	0x9bb30cae	! t0_kref+0x1ce4:   	fandnot2s	%f12, %f14, %f13
	.word	0x99a0054c	! t0_kref+0x1ce8:   	fsqrtd	%f12, %f12
	.word	0xa3a0052c	! t0_kref+0x1cec:   	fsqrts	%f12, %f17
	.word	0xd096d019	! t0_kref+0x1cf0:   	lduha	[%i3 + %i1]0x80, %o0
	.word	0x2c800006	! t0_kref+0x1cf4:   	bneg,a	_kref+0x1d0c
	.word	0xaa64a3be	! t0_kref+0x1cf8:   	subc	%l2, 0x3be, %l5
	.word	0x99a000ae	! t0_kref+0x1cfc:   	fnegs	%f14, %f12
	.word	0x9f414000	! t0_kref+0x1d00:   	mov	%pc, %o7
	.word	0x92a2382a	! t0_kref+0x1d04:   	subcc	%o0, -0x7d6, %o1
	.word	0x2b800007	! t0_kref+0x1d08:   	fbug,a	_kref+0x1d24
	.word	0xc12f0005	! t0_kref+0x1d0c:   	st	%fsr, [%i4 + %g5]
	.word	0xa1b40f8c	! t0_kref+0x1d10:   	for	%f16, %f12, %f16
	.word	0x81da2570	! t0_kref+0x1d14:   	flush	%o0 + 0x570
	.word	0xe8266018	! t0_kref+0x1d18:   	st	%l4, [%i1 + 0x18]
	.word	0x9da0054c	! t0_kref+0x1d1c:   	fsqrtd	%f12, %f14
	.word	0x99a0054c	! t0_kref+0x1d20:   	fsqrtd	%f12, %f12
	.word	0x2a480008	! t0_kref+0x1d24:   	bcs,a,pt	%icc, _kref+0x1d44
	.word	0x99a00531	! t0_kref+0x1d28:   	fsqrts	%f17, %f12
	.word	0xab354013	! t0_kref+0x1d2c:   	srl	%l5, %l3, %l5
	.word	0x35800001	! t0_kref+0x1d30:   	fbue,a	_kref+0x1d34
	.word	0x9fb34ea0	! t0_kref+0x1d34:   	fsrc1s	%f13, %f15
	.word	0x9da0052c	! t0_kref+0x1d38:   	fsqrts	%f12, %f14
	.word	0xae8a21fc	! t0_kref+0x1d3c:   	andcc	%o0, 0x1fc, %l7
	.word	0xea260000	! t0_kref+0x1d40:   	st	%l5, [%i0]
	.word	0xab400000	! t0_kref+0x1d44:   	mov	%y, %l5
	.word	0xe828a013	! t0_kref+0x1d48:   	stb	%l4, [%g2 + 0x13]
	.word	0xa1a30850	! t0_kref+0x1d4c:   	faddd	%f12, %f16, %f16
	.word	0xacda0012	! t0_kref+0x1d50:   	smulcc	%o0, %l2, %l6
	.word	0x9da018ce	! t0_kref+0x1d54:   	fdtos	%f14, %f14
	.word	0xeff65017	! t0_kref+0x1d58:   	casxa	[%i1]0x80, %l7, %l7
	.word	0x9da408cc	! t0_kref+0x1d5c:   	fsubd	%f16, %f12, %f14
	.word	0x905d8014	! t0_kref+0x1d60:   	smul	%l6, %l4, %o0
	.word	0xe6a61000	! t0_kref+0x1d64:   	sta	%l3, [%i0]0x80
	.word	0xe66e3fe8	! t0_kref+0x1d68:   	ldstub	[%i0 - 0x18], %l3
	.word	0xf83e7ff0	! t0_kref+0x1d6c:   	std	%i4, [%i1 - 0x10]
	.word	0xafb500c8	! t0_kref+0x1d70:   	edge16l	%l4, %o0, %l7
	.word	0x28800002	! t0_kref+0x1d74:   	bleu,a	_kref+0x1d7c
	.word	0xaa8caf2d	! t0_kref+0x1d78:   	andcc	%l2, 0xf2d, %l5
	.word	0xa7b4050c	! t0_kref+0x1d7c:   	fcmpgt16	%f16, %f12, %l3
	.word	0xa1a00550	! t0_kref+0x1d80:   	fsqrtd	%f16, %f16
	.word	0xa1a388cc	! t0_kref+0x1d84:   	fsubd	%f14, %f12, %f16
	.word	0x25800004	! t0_kref+0x1d88:   	fblg,a	_kref+0x1d98
	.word	0x965d8016	! t0_kref+0x1d8c:   	smul	%l6, %l6, %o3
	.word	0xadb4c352	! t0_kref+0x1d90:   	alignaddrl	%l3, %l2, %l6
	.word	0xa1a0102f	! t0_kref+0x1d94:   	fstox	%f15, %f16
	.word	0xaaf4b332	! t0_kref+0x1d98:   	udivcc	%l2, -0xcce, %l5
	.word	0xa1a3884c	! t0_kref+0x1d9c:   	faddd	%f14, %f12, %f16
	.word	0xabb38510	! t0_kref+0x1da0:   	fcmpgt16	%f14, %f16, %l5
	.word	0x39800003	! t0_kref+0x1da4:   	fbuge,a	_kref+0x1db0
	.word	0xe8080019	! t0_kref+0x1da8:   	ldub	[%g0 + %i1], %l4
	.word	0x9ba44931	! t0_kref+0x1dac:   	fmuls	%f17, %f17, %f13
	.word	0x97b404cc	! t0_kref+0x1db0:   	fcmpne32	%f16, %f12, %o3
	.word	0xd9be1a5c	! t0_kref+0x1db4:   	stda	%f12, [%i0 + %i4]0xd2
	.word	0x9db30f8e	! t0_kref+0x1db8:   	for	%f12, %f14, %f14
	.word	0x97400000	! t0_kref+0x1dbc:   	mov	%y, %o3
	.word	0xe6a65000	! t0_kref+0x1dc0:   	sta	%l3, [%i1]0x80
	.word	0xfbee501b	! t0_kref+0x1dc4:   	prefetcha	%i1 + %i3, 29
	.word	0xa1b38e0e	! t0_kref+0x1dc8:   	fand	%f14, %f14, %f16
	.word	0xa6f5f4db	! t0_kref+0x1dcc:   	udivcc	%l7, -0xb25, %l3
	.word	0xa1a0052c	! t0_kref+0x1dd0:   	fsqrts	%f12, %f16
	.word	0xd91fbf18	! t0_kref+0x1dd4:   	ldd	[%fp - 0xe8], %f12
	.word	0x95b384cc	! t0_kref+0x1dd8:   	fcmpne32	%f14, %f12, %o2
	.word	0x2a800005	! t0_kref+0x1ddc:   	bcs,a	_kref+0x1df0
	.word	0xd86e200f	! t0_kref+0x1de0:   	ldstub	[%i0 + 0xf], %o4
	.word	0x8143c000	! t0_kref+0x1de4:   	stbar
	.word	0xd6871019	! t0_kref+0x1de8:   	lda	[%i4 + %i1]0x80, %o3
	.word	0x81abcaac	! t0_kref+0x1dec:   	fcmpes	%fcc0, %f15, %f12
	.word	0x8143e07b	! t0_kref+0x1df0:   	membar	0x7b
	.word	0xe120a038	! t0_kref+0x1df4:   	st	%f16, [%g2 + 0x38]
	.word	0xa1a389ce	! t0_kref+0x1df8:   	fdivd	%f14, %f14, %f16
	.word	0xa1a4084e	! t0_kref+0x1dfc:   	faddd	%f16, %f14, %f16
	.word	0xd02e401a	! t0_kref+0x1e00:   	stb	%o0, [%i1 + %i2]
	.word	0x923a3e08	! t0_kref+0x1e04:   	xnor	%o0, -0x1f8, %o1
	.word	0x38480007	! t0_kref+0x1e08:   	bgu,a,pt	%icc, _kref+0x1e24
	.word	0xd920a00c	! t0_kref+0x1e0c:   	st	%f12, [%g2 + 0xc]
	.word	0x9db306cc	! t0_kref+0x1e10:   	fmul8sux16	%f12, %f12, %f14
	.word	0xea467ff4	! t0_kref+0x1e14:   	ldsw	[%i1 - 0xc], %l5
	.word	0xd6c01018	! t0_kref+0x1e18:   	ldswa	[%g0 + %i0]0x80, %o3
	.word	0xa7400000	! t0_kref+0x1e1c:   	mov	%y, %l3
	.word	0x9fa0052f	! t0_kref+0x1e20:   	fsqrts	%f15, %f15
	.word	0xa1b40c6e	! t0_kref+0x1e24:   	fnors	%f16, %f14, %f16
	.word	0xa4fa39e7	! t0_kref+0x1e28:   	sdivcc	%o0, -0x619, %l2
	.word	0x9da409ae	! t0_kref+0x1e2c:   	fdivs	%f16, %f14, %f14
	.word	0x99a000af	! t0_kref+0x1e30:   	fnegs	%f15, %f12
	.word	0x87802082	! t0_kref+0x1e34:   	mov	0x82, %asi
	.word	0x99a40850	! t0_kref+0x1e38:   	faddd	%f16, %f16, %f12
	.word	0xd9266000	! t0_kref+0x1e3c:   	st	%f12, [%i1]
	.word	0xa1b406ec	! t0_kref+0x1e40:   	fmul8ulx16	%f16, %f12, %f16
	.word	0xf207bfe0	! t0_kref+0x1e44:   	ld	[%fp - 0x20], %i1
	.word	0x9da408cc	! t0_kref+0x1e48:   	fsubd	%f16, %f12, %f14
	.word	0x907c8014	! t0_kref+0x1e4c:   	sdiv	%l2, %l4, %o0
	.word	0x9ba0052f	! t0_kref+0x1e50:   	fsqrts	%f15, %f13
	.word	0x9de3bfa0	! t0_kref+0x1e54:   	save	%sp, -0x60, %sp
	.word	0x97ef7fd3	! t0_kref+0x1e58:   	restore	%i5, -0x2d, %o3
	.word	0xea2e3ffb	! t0_kref+0x1e5c:   	stb	%l5, [%i0 - 5]
	.word	0xdd1fbde0	! t0_kref+0x1e60:   	ldd	[%fp - 0x220], %f14
	.word	0x9da00130	! t0_kref+0x1e64:   	fabss	%f16, %f14
	.word	0x95400000	! t0_kref+0x1e68:   	mov	%y, %o2
	.word	0xdf00a03c	! t0_kref+0x1e6c:   	ld	[%g2 + 0x3c], %f15
	.word	0x21480008	! t0_kref+0x1e70:   	fbn,a,pt	%fcc0, _kref+0x1e90
	.word	0xee30a008	! t0_kref+0x1e74:   	sth	%l7, [%g2 + 8]
	.word	0xa4354013	! t0_kref+0x1e78:   	orn	%l5, %l3, %l2
	.word	0xa6a4c008	! t0_kref+0x1e7c:   	subcc	%l3, %o0, %l3
	.word	0xec6e200d	! t0_kref+0x1e80:   	ldstub	[%i0 + 0xd], %l6
	.word	0xa834c015	! t0_kref+0x1e84:   	orn	%l3, %l5, %l4
	.word	0x81ac0a50	! t0_kref+0x1e88:   	fcmpd	%fcc0, %f16, %f16
	.word	0xa69d0016	! t0_kref+0x1e8c:   	xorcc	%l4, %l6, %l3
	.word	0xa1a309cc	! t0_kref+0x1e90:   	fdivd	%f12, %f12, %f16
	.word	0x30800008	! t0_kref+0x1e94:   	ba,a	_kref+0x1eb4
	.word	0xa5b58055	! t0_kref+0x1e98:   	edge8l	%l6, %l5, %l2
	.word	0xe840a014	! t0_kref+0x1e9c:   	ldsw	[%g2 + 0x14], %l4
	.word	0xdf000018	! t0_kref+0x1ea0:   	ld	[%g0 + %i0], %f15
	.word	0x3f480002	! t0_kref+0x1ea4:   	fbo,a,pt	%fcc0, _kref+0x1eac
	.word	0x99a40950	! t0_kref+0x1ea8:   	fmuld	%f16, %f16, %f12
	.word	0xe11e7ff0	! t0_kref+0x1eac:   	ldd	[%i1 - 0x10], %f16
	.word	0x96853a7d	! t0_kref+0x1eb0:   	addcc	%l4, -0x583, %o3
	.word	0xa52dc008	! t0_kref+0x1eb4:   	sll	%l7, %o0, %l2
	.word	0x8143c000	! t0_kref+0x1eb8:   	stbar
	.word	0x99a3894e	! t0_kref+0x1ebc:   	fmuld	%f14, %f14, %f12
	.word	0xae8cf3ed	! t0_kref+0x1ec0:   	andcc	%l3, -0xc13, %l7
	.word	0xa92d6011	! t0_kref+0x1ec4:   	sll	%l5, 0x11, %l4
	.word	0x86102003	! t0_kref+0x1ec8:   	mov	0x3, %g3
	.word	0x32800000	! t0_kref+0x1ecc:   	bne,a	_kref+0x1ecc
	.word	0x86a0e001	! t0_kref+0x1ed0:   	subcc	%g3, 1, %g3
	.word	0xa4054016	! t0_kref+0x1ed4:   	add	%l5, %l6, %l2
	.word	0x9de3bfa0	! t0_kref+0x1ed8:   	save	%sp, -0x60, %sp
	.word	0xa7ee8019	! t0_kref+0x1edc:   	restore	%i2, %i1, %l3
	.word	0x99b007ac	! t0_kref+0x1ee0:   	fpackfix	%f12, %f12
	.word	0xae9d8008	! t0_kref+0x1ee4:   	xorcc	%l6, %o0, %l7
	.word	0xe62e4000	! t0_kref+0x1ee8:   	stb	%l3, [%i1]
	.word	0x94f4b801	! t0_kref+0x1eec:   	udivcc	%l2, -0x7ff, %o2
	.word	0xec30a018	! t0_kref+0x1ef0:   	sth	%l6, [%g2 + 0x18]
	.word	0xa1b44eec	! t0_kref+0x1ef4:   	fornot2s	%f17, %f12, %f16
	.word	0xda6e4000	! t0_kref+0x1ef8:   	ldstub	[%i1], %o5
	.word	0x9db30ad0	! t0_kref+0x1efc:   	fpsub32	%f12, %f16, %f14
	.word	0xa1b306ce	! t0_kref+0x1f00:   	fmul8sux16	%f12, %f14, %f16
	.word	0x3f800005	! t0_kref+0x1f04:   	fbo,a	_kref+0x1f18
	.word	0x99a0054e	! t0_kref+0x1f08:   	fsqrtd	%f14, %f12
	.word	0x30800002	! t0_kref+0x1f0c:   	ba,a	_kref+0x1f14
	.word	0xd83e6000	! t0_kref+0x1f10:   	std	%o4, [%i1]
	.word	0xd02e601c	! t0_kref+0x1f14:   	stb	%o0, [%i1 + 0x1c]
	.word	0xed68a080	! t0_kref+0x1f18:   	prefetch	%g2 + 0x80, 22
	.word	0x34480008	! t0_kref+0x1f1c:   	bg,a,pt	%icc, _kref+0x1f3c
	.word	0xa49dc015	! t0_kref+0x1f20:   	xorcc	%l7, %l5, %l2
	.word	0xee20a038	! t0_kref+0x1f24:   	st	%l7, [%g2 + 0x38]
	.word	0xfd6e6018	! t0_kref+0x1f28:   	prefetch	%i1 + 0x18, 30
	.word	0xe66e8019	! t0_kref+0x1f2c:   	ldstub	[%i2 + %i1], %l3
	.word	0x92acecdc	! t0_kref+0x1f30:   	andncc	%l3, 0xcdc, %o1
	.word	0xc3ee1014	! t0_kref+0x1f34:   	prefetcha	%i0 + %l4, 1
	.word	0xa1a018ce	! t0_kref+0x1f38:   	fdtos	%f14, %f16
	.word	0xea28a039	! t0_kref+0x1f3c:   	stb	%l5, [%g2 + 0x39]
	.word	0xa1b00cce	! t0_kref+0x1f40:   	fnot2	%f14, %f16
	.word	0x81ac0ad0	! t0_kref+0x1f44:   	fcmped	%fcc0, %f16, %f16
	.word	0xa8657081	! t0_kref+0x1f48:   	subc	%l5, -0xf7f, %l4
	.word	0x927d8016	! t0_kref+0x1f4c:   	sdiv	%l6, %l6, %o1
	.word	0x9db38f90	! t0_kref+0x1f50:   	for	%f14, %f16, %f14
	.word	0xae15a413	! t0_kref+0x1f54:   	or	%l6, 0x413, %l7
	.word	0x96fcc013	! t0_kref+0x1f58:   	sdivcc	%l3, %l3, %o3
	.word	0x9205635c	! t0_kref+0x1f5c:   	add	%l5, 0x35c, %o1
	.word	0xa4358008	! t0_kref+0x1f60:   	orn	%l6, %o0, %l2
	.word	0x9ba0012d	! t0_kref+0x1f64:   	fabss	%f13, %f13
	.word	0xd83e3ff8	! t0_kref+0x1f68:   	std	%o4, [%i0 - 8]
	.word	0xa1a309d0	! t0_kref+0x1f6c:   	fdivd	%f12, %f16, %f16
	.word	0xa1a44931	! t0_kref+0x1f70:   	fmuls	%f17, %f17, %f16
	.word	0x8143e05c	! t0_kref+0x1f74:   	membar	0x5c
	.word	0xac023b61	! t0_kref+0x1f78:   	add	%o0, -0x49f, %l6
	.word	0xa40dad98	! t0_kref+0x1f7c:   	and	%l6, 0xd98, %l2
	.word	0xd030a000	! t0_kref+0x1f80:   	sth	%o0, [%g2]
	.word	0x9ba30830	! t0_kref+0x1f84:   	fadds	%f12, %f16, %f13
	.word	0x25800008	! t0_kref+0x1f88:   	fblg,a	_kref+0x1fa8
	.word	0xa63d0016	! t0_kref+0x1f8c:   	xnor	%l4, %l6, %l3
	.word	0x30800006	! t0_kref+0x1f90:   	ba,a	_kref+0x1fa8
	.word	0x9fa0052d	! t0_kref+0x1f94:   	fsqrts	%f13, %f15
	.word	0xa940c000	! t0_kref+0x1f98:   	mov	%asi, %l4
	.word	0x96b48017	! t0_kref+0x1f9c:   	orncc	%l2, %l7, %o3
	.word	0xaa9cbc05	! t0_kref+0x1fa0:   	xorcc	%l2, -0x3fb, %l5
	.word	0xd0562008	! t0_kref+0x1fa4:   	ldsh	[%i0 + 8], %o0
	.word	0xa1a00550	! t0_kref+0x1fa8:   	fsqrtd	%f16, %f16
	.word	0x99b30e80	! t0_kref+0x1fac:   	fsrc1	%f12, %f12
	.word	0xa1a00531	! t0_kref+0x1fb0:   	fsqrts	%f17, %f16
	.word	0xc06e6007	! t0_kref+0x1fb4:   	ldstub	[%i1 + 7], %g0
	.word	0xdf871019	! t0_kref+0x1fb8:   	lda	[%i4 + %i1]0x80, %f15
	.word	0xdb070018	! t0_kref+0x1fbc:   	ld	[%i4 + %i0], %f13
	.word	0xc76e4016	! t0_kref+0x1fc0:   	prefetch	%i1 + %l6, 3
	.word	0x2d1e32fa	! t0_kref+0x1fc4:   	sethi	%hi(0x78cbe800), %l6
	.word	0x928a0012	! t0_kref+0x1fc8:   	andcc	%o0, %l2, %o1
	call	SYM(t0_subr0)
	.word	0x900a0013	! t0_kref+0x1fd0:   	and	%o0, %l3, %o0
	.word	0x94b525aa	! t0_kref+0x1fd4:   	orncc	%l4, 0x5aa, %o2
	.word	0x96054015	! t0_kref+0x1fd8:   	add	%l5, %l5, %o3
	.word	0x99a389b0	! t0_kref+0x1fdc:   	fdivs	%f14, %f16, %f12
	.word	0xee360000	! t0_kref+0x1fe0:   	sth	%l7, [%i0]
	.word	0x81ab0acc	! t0_kref+0x1fe4:   	fcmped	%fcc0, %f12, %f12
	.word	0x9da4084c	! t0_kref+0x1fe8:   	faddd	%f16, %f12, %f14
	.word	0xa1b30e0c	! t0_kref+0x1fec:   	fand	%f12, %f12, %f16
	.word	0x9db40f90	! t0_kref+0x1ff0:   	for	%f16, %f16, %f14
	.word	0x2d800006	! t0_kref+0x1ff4:   	fbg,a	_kref+0x200c
	.word	0x90fcc014	! t0_kref+0x1ff8:   	sdivcc	%l3, %l4, %o0
	.word	0x22800005	! t0_kref+0x1ffc:   	be,a	_kref+0x2010
	.word	0xa1a408cc	! t0_kref+0x2000:   	fsubd	%f16, %f12, %f16
	.word	0xdd981018	! t0_kref+0x2004:   	ldda	[%g0 + %i0]0x80, %f14
	.word	0xe13e7ff0	! t0_kref+0x2008:   	std	%f16, [%i1 - 0x10]
	.word	0x99a01931	! t0_kref+0x200c:   	fstod	%f17, %f12
	.word	0xd920a02c	! t0_kref+0x2010:   	st	%f12, [%g2 + 0x2c]
	.word	0xd6fe1000	! t0_kref+0x2014:   	swapa	[%i0]0x80, %o3
	.word	0x9ba388b0	! t0_kref+0x2018:   	fsubs	%f14, %f16, %f13
	.word	0x81ab4ab0	! t0_kref+0x201c:   	fcmpes	%fcc0, %f13, %f16
	.word	0x9bb30ea0	! t0_kref+0x2020:   	fsrc1s	%f12, %f13
	.word	0x9de3bfa0	! t0_kref+0x2024:   	save	%sp, -0x60, %sp
	.word	0xafeec01d	! t0_kref+0x2028:   	restore	%i3, %i5, %l7
	.word	0x8143c000	! t0_kref+0x202c:   	stbar
	.word	0x9265386e	! t0_kref+0x2030:   	subc	%l4, -0x792, %o1
	.word	0x9db30d0e	! t0_kref+0x2034:   	fandnot1	%f12, %f14, %f14
	.word	0x20800002	! t0_kref+0x2038:   	bn,a	_kref+0x2040
	.word	0x9264c016	! t0_kref+0x203c:   	subc	%l3, %l6, %o1
	.word	0x92748012	! t0_kref+0x2040:   	udiv	%l2, %l2, %o1
	.word	0x9ba348af	! t0_kref+0x2044:   	fsubs	%f13, %f15, %f13
	.word	0xe13e0000	! t0_kref+0x2048:   	std	%f16, [%i0]
	.word	0xa8fa321c	! t0_kref+0x204c:   	sdivcc	%o0, -0xde4, %l4
	.word	0xe19e5a5b	! t0_kref+0x2050:   	ldda	[%i1 + %i3]0xd2, %f16
	.word	0x9da408cc	! t0_kref+0x2054:   	fsubd	%f16, %f12, %f14
	.word	0x91356012	! t0_kref+0x2058:   	srl	%l5, 0x12, %o0
	.word	0xea36200c	! t0_kref+0x205c:   	sth	%l5, [%i0 + 0xc]
	.word	0xdd06001c	! t0_kref+0x2060:   	ld	[%i0 + %i4], %f14
	.word	0x110f9af8	! t0_kref+0x2064:   	sethi	%hi(0x3e6be000), %o0
	.word	0x3d800005	! t0_kref+0x2068:   	fbule,a	_kref+0x207c
	.word	0x9004a534	! t0_kref+0x206c:   	add	%l2, 0x534, %o0
	.word	0xd83e2000	! t0_kref+0x2070:   	std	%o4, [%i0]
	.word	0x9da01a30	! t0_kref+0x2074:   	fstoi	%f16, %f14
	.word	0xae8a2111	! t0_kref+0x2078:   	andcc	%o0, 0x111, %l7
	.word	0x95b4c037	! t0_kref+0x207c:   	edge8n	%l3, %l7, %o2
	.word	0xf16e3fe8	! t0_kref+0x2080:   	prefetch	%i0 - 0x18, 24
	.word	0x9da309ac	! t0_kref+0x2084:   	fdivs	%f12, %f12, %f14
	.word	0x9444a13d	! t0_kref+0x2088:   	addc	%l2, 0x13d, %o2
	.word	0xa3a018cc	! t0_kref+0x208c:   	fdtos	%f12, %f17
	.word	0x97b48008	! t0_kref+0x2090:   	edge8	%l2, %o0, %o3
	.word	0x3e800001	! t0_kref+0x2094:   	bvc,a	_kref+0x2098
	.word	0x9fa0108c	! t0_kref+0x2098:   	fxtos	%f12, %f15
	.word	0x96fca247	! t0_kref+0x209c:   	sdivcc	%l2, 0x247, %o3
	.word	0xa1a00530	! t0_kref+0x20a0:   	fsqrts	%f16, %f16
	.word	0xea763ff8	! t0_kref+0x20a4:   	stx	%l5, [%i0 - 8]
	.word	0xd9be1894	! t0_kref+0x20a8:   	stda	%f12, [%i0 + %l4]0xc4
	.word	0xa1a018ce	! t0_kref+0x20ac:   	fdtos	%f14, %f16
	.word	0x3a800008	! t0_kref+0x20b0:   	bcc,a	_kref+0x20d0
	.word	0x81de22ec	! t0_kref+0x20b4:   	flush	%i0 + 0x2ec
	.word	0xa425a150	! t0_kref+0x20b8:   	sub	%l6, 0x150, %l2
	.word	0x27800003	! t0_kref+0x20bc:   	fbul,a	_kref+0x20c8
	.word	0x9ba0052d	! t0_kref+0x20c0:   	fsqrts	%f13, %f13
	.word	0x932a0013	! t0_kref+0x20c4:   	sll	%o0, %l3, %o1
	.word	0xe168a085	! t0_kref+0x20c8:   	prefetch	%g2 + 0x85, 16
	.word	0xe66e0000	! t0_kref+0x20cc:   	ldstub	[%i0], %l3
	.word	0x99b007ac	! t0_kref+0x20d0:   	fpackfix	%f12, %f12
	.word	0x99a40950	! t0_kref+0x20d4:   	fmuld	%f16, %f16, %f12
	.word	0x926526f7	! t0_kref+0x20d8:   	subc	%l4, 0x6f7, %o1
	.word	0xe4464000	! t0_kref+0x20dc:   	ldsw	[%i1], %l2
	.word	0x8143e05b	! t0_kref+0x20e0:   	membar	0x5b
	.word	0xa1a0192e	! t0_kref+0x20e4:   	fstod	%f14, %f16
	.word	0xac3c8013	! t0_kref+0x20e8:   	xnor	%l2, %l3, %l6
	.word	0x9fa3c9ae	! t0_kref+0x20ec:   	fdivs	%f15, %f14, %f15
	.word	0x81ac4aad	! t0_kref+0x20f0:   	fcmpes	%fcc0, %f17, %f13
	.word	0x9da4482e	! t0_kref+0x20f4:   	fadds	%f17, %f14, %f14
	.word	0x81ab4aad	! t0_kref+0x20f8:   	fcmpes	%fcc0, %f13, %f13
	.word	0xa48d3cfa	! t0_kref+0x20fc:   	andcc	%l4, -0x306, %l2
	.word	0x9da0052e	! t0_kref+0x2100:   	fsqrts	%f14, %f14
	.word	0x9db40a50	! t0_kref+0x2104:   	fpadd32	%f16, %f16, %f14
	.word	0xa3a01a4e	! t0_kref+0x2108:   	fdtoi	%f14, %f17
	.word	0xae3d4016	! t0_kref+0x210c:   	xnor	%l5, %l6, %l7
	.word	0xa1a01110	! t0_kref+0x2110:   	fxtod	%f16, %f16
	.word	0x99a0054e	! t0_kref+0x2114:   	fsqrtd	%f14, %f12
	.word	0x9de3bfa0	! t0_kref+0x2118:   	save	%sp, -0x60, %sp
	.word	0xb83ec019	! t0_kref+0x211c:   	xnor	%i3, %i1, %i4
	.word	0x97ee27b1	! t0_kref+0x2120:   	restore	%i0, 0x7b1, %o3
	.word	0x9ba308ac	! t0_kref+0x2124:   	fsubs	%f12, %f12, %f13
	.word	0x2f480005	! t0_kref+0x2128:   	fbu,a,pt	%fcc0, _kref+0x213c
	.word	0xe1063ffc	! t0_kref+0x212c:   	ld	[%i0 - 4], %f16
	.word	0xaa3cb410	! t0_kref+0x2130:   	xnor	%l2, -0xbf0, %l5
	.word	0xa1a8404c	! t0_kref+0x2134:   	fmovdne	%fcc0, %f12, %f16
	.word	0x9da38950	! t0_kref+0x2138:   	fmuld	%f14, %f16, %f14
	.word	0x878020d0	! t0_kref+0x213c:   	mov	0xd0, %asi
	.word	0x81ac0ace	! t0_kref+0x2140:   	fcmped	%fcc0, %f16, %f14
	.word	0xd9380019	! t0_kref+0x2144:   	std	%f12, [%g0 + %i1]
	.word	0x99a3084e	! t0_kref+0x2148:   	faddd	%f12, %f14, %f12
	.word	0xdf070019	! t0_kref+0x214c:   	ld	[%i4 + %i1], %f15
	.word	0x9db40a4c	! t0_kref+0x2150:   	fpadd32	%f16, %f12, %f14
	.word	0xe89e5000	! t0_kref+0x2154:   	ldda	[%i1]0x80, %l4
	.word	0x2f800005	! t0_kref+0x2158:   	fbu,a	_kref+0x216c
	.word	0xda680018	! t0_kref+0x215c:   	ldstub	[%g0 + %i0], %o5
	.word	0xe968a084	! t0_kref+0x2160:   	prefetch	%g2 + 0x84, 20
	.word	0xaf2de00b	! t0_kref+0x2164:   	sll	%l7, 0xb, %l7
	call	SYM(t0_subr3)
	.word	0xed68a008	! t0_kref+0x216c:   	prefetch	%g2 + 8, 22
	.word	0xa3a3892c	! t0_kref+0x2170:   	fmuls	%f14, %f12, %f17
	.word	0x963d0016	! t0_kref+0x2174:   	xnor	%l4, %l6, %o3
	.word	0xe6d01019	! t0_kref+0x2178:   	ldsha	[%g0 + %i1]0x80, %l3
	.word	0xd2d6101b	! t0_kref+0x217c:   	ldsha	[%i0 + %i3]0x80, %o1
	.word	0xa1a01050	! t0_kref+0x2180:   	fdtox	%f16, %f16
	.word	0x36480002	! t0_kref+0x2184:   	bge,a,pt	%icc, _kref+0x218c
	.word	0xae0d28a5	! t0_kref+0x2188:   	and	%l4, 0x8a5, %l7
	.word	0xe428a037	! t0_kref+0x218c:   	stb	%l2, [%g2 + 0x37]
	.word	0xd93e6008	! t0_kref+0x2190:   	std	%f12, [%i1 + 8]
	.word	0x90b20014	! t0_kref+0x2194:   	orncc	%o0, %l4, %o0
	.word	0xa1b3090e	! t0_kref+0x2198:   	faligndata	%f12, %f14, %f16
	.word	0x9db3074e	! t0_kref+0x219c:   	fpack32	%f12, %f14, %f14
	.word	0xa1b30e80	! t0_kref+0x21a0:   	fsrc1	%f12, %f16
	.word	0x99a01931	! t0_kref+0x21a4:   	fstod	%f17, %f12
	.word	0x86102010	! t0_kref+0x21a8:   	mov	0x10, %g3
	.word	0x86a0e001	! t0_kref+0x21ac:   	subcc	%g3, 1, %g3
	.word	0x2280001c	! t0_kref+0x21b0:   	be,a	_kref+0x2220
	.word	0x99a408b1	! t0_kref+0x21b4:   	fsubs	%f16, %f17, %f12
	.word	0x9db38acc	! t0_kref+0x21b8:   	fpsub32	%f14, %f12, %f14
	.word	0x99a389ce	! t0_kref+0x21bc:   	fdivd	%f14, %f14, %f12
	.word	0xa1b30990	! t0_kref+0x21c0:   	bshuffle	%f12, %f16, %f16
	.word	0xa3b3caf1	! t0_kref+0x21c4:   	fpsub32s	%f15, %f17, %f17
	.word	0x29480005	! t0_kref+0x21c8:   	fbl,a,pt	%fcc0, _kref+0x21dc
	.word	0xa1a408ce	! t0_kref+0x21cc:   	fsubd	%f16, %f14, %f16
	.word	0xa1b30c50	! t0_kref+0x21d0:   	fnor	%f12, %f16, %f16
	.word	0x9da409cc	! t0_kref+0x21d4:   	fdivd	%f16, %f12, %f14
	.word	0x940a0008	! t0_kref+0x21d8:   	and	%o0, %o0, %o2
	.word	0xa1a3084e	! t0_kref+0x21dc:   	faddd	%f12, %f14, %f16
	.word	0xd0a01018	! t0_kref+0x21e0:   	sta	%o0, [%g0 + %i0]0x80
	.word	0x99b306ec	! t0_kref+0x21e4:   	fmul8ulx16	%f12, %f12, %f12
	.word	0x36480005	! t0_kref+0x21e8:   	bge,a,pt	%icc, _kref+0x21fc
	.word	0x9ba0052e	! t0_kref+0x21ec:   	fsqrts	%f14, %f13
	.word	0x99b38dce	! t0_kref+0x21f0:   	fnand	%f14, %f14, %f12
	.word	0x9da309b0	! t0_kref+0x21f4:   	fdivs	%f12, %f16, %f14
	.word	0x3d800003	! t0_kref+0x21f8:   	fbule,a	_kref+0x2204
	.word	0xa624b677	! t0_kref+0x21fc:   	sub	%l2, -0x989, %l3
	.word	0xf3ee501a	! t0_kref+0x2200:   	prefetcha	%i1 + %i2, 25
	.word	0x9db3c62e	! t0_kref+0x2204:   	fmul8x16	%f15, %f14, %f14
	.word	0x9da00530	! t0_kref+0x2208:   	fsqrts	%f16, %f14
	.word	0xee264000	! t0_kref+0x220c:   	st	%l7, [%i1]
	.word	0xadb200b5	! t0_kref+0x2210:   	edge16n	%o0, %l5, %l6
	.word	0xd99e1000	! t0_kref+0x2214:   	ldda	[%i0]0x80, %f12
	.word	0xec280018	! t0_kref+0x2218:   	stb	%l6, [%g0 + %i0]
	.word	0x26800002	! t0_kref+0x221c:   	bl,a	_kref+0x2224
	.word	0xa3a3c9ad	! t0_kref+0x2220:   	fdivs	%f15, %f13, %f17
	.word	0x95b200f5	! t0_kref+0x2224:   	edge16ln	%o0, %l5, %o2
	.word	0xabb304ce	! t0_kref+0x2228:   	fcmpne32	%f12, %f14, %l5
	.word	0x9de3bfa0	! t0_kref+0x222c:   	save	%sp, -0x60, %sp
	.word	0x95e80000	! t0_kref+0x2230:   	restore	%g0, %g0, %o2
	.word	0xa1a388cc	! t0_kref+0x2234:   	fsubd	%f14, %f12, %f16
	.word	0x965cf672	! t0_kref+0x2238:   	smul	%l3, -0x98e, %o3
	.word	0xdf00a030	! t0_kref+0x223c:   	ld	[%g2 + 0x30], %f15
	.word	0x8143c000	! t0_kref+0x2240:   	stbar
	.word	0x932de016	! t0_kref+0x2244:   	sll	%l7, 0x16, %o1
	.word	0x22800001	! t0_kref+0x2248:   	be,a	_kref+0x224c
	.word	0xa80dab32	! t0_kref+0x224c:   	and	%l6, 0xb32, %l4
	.word	0xaca48014	! t0_kref+0x2250:   	subcc	%l2, %l4, %l6
	.word	0xdd000019	! t0_kref+0x2254:   	ld	[%g0 + %i1], %f14
	.word	0xac04c012	! t0_kref+0x2258:   	add	%l3, %l2, %l6
	.word	0xe4de101d	! t0_kref+0x225c:   	ldxa	[%i0 + %i5]0x80, %l2
	.word	0x3c800006	! t0_kref+0x2260:   	bpos,a	_kref+0x2278
	.word	0x90f5ff18	! t0_kref+0x2264:   	udivcc	%l7, -0xe8, %o0
	.word	0xe13e3ff8	! t0_kref+0x2268:   	std	%f16, [%i0 - 8]
	.word	0x99a309ce	! t0_kref+0x226c:   	fdivd	%f12, %f14, %f12
	.word	0x8143c000	! t0_kref+0x2270:   	stbar
	.word	0xf43e7ff8	! t0_kref+0x2274:   	std	%i2, [%i1 - 8]
	.word	0x99a01a31	! t0_kref+0x2278:   	fstoi	%f17, %f12
	.word	0x2a800005	! t0_kref+0x227c:   	bcs,a	_kref+0x2290
	.word	0xaa458015	! t0_kref+0x2280:   	addc	%l6, %l5, %l5
	.word	0x92558014	! t0_kref+0x2284:   	umul	%l6, %l4, %o1
	.word	0xa9b200d5	! t0_kref+0x2288:   	edge16l	%o0, %l5, %l4
	.word	0x21800008	! t0_kref+0x228c:   	fbn,a	_kref+0x22ac
	.word	0xea28a00c	! t0_kref+0x2290:   	stb	%l5, [%g2 + 0xc]
	.word	0x001fffff	! t0_kref+0x2294:   	illtrap	0x1fffff
	.word	0x26480002	! t0_kref+0x2298:   	bl,a,pt	%icc, _kref+0x22a0
	.word	0x99a3884c	! t0_kref+0x229c:   	faddd	%f14, %f12, %f12
	.word	0x9735a01f	! t0_kref+0x22a0:   	srl	%l6, 0x1f, %o3
	.word	0xa89c8008	! t0_kref+0x22a4:   	xorcc	%l2, %o0, %l4
	.word	0xe1be1853	! t0_kref+0x22a8:   	stda	%f16, [%i0 + %l3]0xc2
	.word	0x9fc10000	! t0_kref+0x22ac:   	call	%g4
	.word	0x97400000	! t0_kref+0x22b0:   	mov	%y, %o3
	.word	0xab1a0012	! t0_kref+0x22b4:   	tsubcctv	%o0, %l2, %l5
	.word	0x9da3884e	! t0_kref+0x22b8:   	faddd	%f14, %f14, %f14
	.word	0x38800006	! t0_kref+0x22bc:   	bgu,a	_kref+0x22d4
	.word	0x99a388d0	! t0_kref+0x22c0:   	fsubd	%f14, %f16, %f12
	.word	0x9da0014e	! t0_kref+0x22c4:   	fabsd	%f14, %f14
	.word	0xa1b34c6f	! t0_kref+0x22c8:   	fnors	%f13, %f15, %f16
	.word	0x94fd7f16	! t0_kref+0x22cc:   	sdivcc	%l5, -0xea, %o2
	.word	0xaa9a3243	! t0_kref+0x22d0:   	xorcc	%o0, -0xdbd, %l5
	.word	0x8143e040	! t0_kref+0x22d4:   	membar	0x40
	.word	0xae84e070	! t0_kref+0x22d8:   	addcc	%l3, 0x70, %l7
	.word	0xa3a3082d	! t0_kref+0x22dc:   	fadds	%f12, %f13, %f17
	.word	0x99b3074c	! t0_kref+0x22e0:   	fpack32	%f12, %f12, %f12
	.word	0xd028a03d	! t0_kref+0x22e4:   	stb	%o0, [%g2 + 0x3d]
	.word	0xe100a010	! t0_kref+0x22e8:   	ld	[%g2 + 0x10], %f16
	.word	0xe4200019	! t0_kref+0x22ec:   	st	%l2, [%g0 + %i1]
	.word	0x9de3bfa0	! t0_kref+0x22f0:   	save	%sp, -0x60, %sp
	.word	0xba9ef6ee	! t0_kref+0x22f4:   	xorcc	%i3, -0x912, %i5
	.word	0xa7ef4019	! t0_kref+0x22f8:   	restore	%i5, %i1, %l3
	.word	0xa68c8014	! t0_kref+0x22fc:   	andcc	%l2, %l4, %l3
	.word	0x99a0004c	! t0_kref+0x2300:   	fmovd	%f12, %f12
	.word	0xe9e61015	! t0_kref+0x2304:   	casa	[%i0]0x80, %l5, %l4
	.word	0x907cc013	! t0_kref+0x2308:   	sdiv	%l3, %l3, %o0
	.word	0xa65a3592	! t0_kref+0x230c:   	smul	%o0, -0xa6e, %l3
	.word	0xaebceee7	! t0_kref+0x2310:   	xnorcc	%l3, 0xee7, %l7
	.word	0x22480006	! t0_kref+0x2314:   	be,a,pt	%icc, _kref+0x232c
	.word	0xa45dac5f	! t0_kref+0x2318:   	smul	%l6, 0xc5f, %l2
	.word	0xf43e2008	! t0_kref+0x231c:   	std	%i2, [%i0 + 8]
	.word	0x81ab8aac	! t0_kref+0x2320:   	fcmpes	%fcc0, %f14, %f12
	.word	0xac248015	! t0_kref+0x2324:   	sub	%l2, %l5, %l6
	.word	0x8143c000	! t0_kref+0x2328:   	stbar
	.word	0x94822826	! t0_kref+0x232c:   	addcc	%o0, 0x826, %o2
	.word	0x26800004	! t0_kref+0x2330:   	bl,a	_kref+0x2340
	.word	0xaa8d8008	! t0_kref+0x2334:   	andcc	%l6, %o0, %l5
	.word	0x9da0002c	! t0_kref+0x2338:   	fmovs	%f12, %f14
	.word	0x9ba0002d	! t0_kref+0x233c:   	fmovs	%f13, %f13
	.word	0x9424e49b	! t0_kref+0x2340:   	sub	%l3, 0x49b, %o2
	.word	0x2a800002	! t0_kref+0x2344:   	bcs,a	_kref+0x234c
	.word	0xa48c8013	! t0_kref+0x2348:   	andcc	%l2, %l3, %l2
	.word	0xe828a016	! t0_kref+0x234c:   	stb	%l4, [%g2 + 0x16]
	.word	0xac8cc008	! t0_kref+0x2350:   	andcc	%l3, %o0, %l6
	.word	0xe66e6015	! t0_kref+0x2354:   	ldstub	[%i1 + 0x15], %l3
	.word	0x9da0054c	! t0_kref+0x2358:   	fsqrtd	%f12, %f14
	.word	0xa9b38490	! t0_kref+0x235c:   	fcmple32	%f14, %f16, %l4
	.word	0x9de3bfa0	! t0_kref+0x2360:   	save	%sp, -0x60, %sp
	.word	0xadee0018	! t0_kref+0x2364:   	restore	%i0, %i0, %l6
	.word	0xa855c016	! t0_kref+0x2368:   	umul	%l7, %l6, %l4
	.word	0x91418000	! t0_kref+0x236c:   	mov	%fprs, %o0
	.word	0xe36e2010	! t0_kref+0x2370:   	prefetch	%i0 + 0x10, 17
	.word	0xa1a00031	! t0_kref+0x2374:   	fmovs	%f17, %f16
	.word	0x99b30ecc	! t0_kref+0x2378:   	fornot2	%f12, %f12, %f12
	.word	0xa1a388af	! t0_kref+0x237c:   	fsubs	%f14, %f15, %f16
	.word	0x81ab8ab0	! t0_kref+0x2380:   	fcmpes	%fcc0, %f14, %f16
	.word	0x37480001	! t0_kref+0x2384:   	fbge,a,pt	%fcc0, _kref+0x2388
	.word	0x901ca6dd	! t0_kref+0x2388:   	xor	%l2, 0x6dd, %o0
	.word	0x28480006	! t0_kref+0x238c:   	bleu,a,pt	%icc, _kref+0x23a4
	.word	0xe1ee501c	! t0_kref+0x2390:   	prefetcha	%i1 + %i4, 16
	.word	0x99b38d8e	! t0_kref+0x2394:   	fxor	%f14, %f14, %f12
	.word	0x26800007	! t0_kref+0x2398:   	bl,a	_kref+0x23b4
	.word	0xeaa01018	! t0_kref+0x239c:   	sta	%l5, [%g0 + %i0]0x80
	.word	0x923dbe48	! t0_kref+0x23a0:   	xnor	%l6, -0x1b8, %o1
	.word	0xa1b30e80	! t0_kref+0x23a4:   	fsrc1	%f12, %f16
	.word	0xae254012	! t0_kref+0x23a8:   	sub	%l5, %l2, %l7
	.word	0x9fa00531	! t0_kref+0x23ac:   	fsqrts	%f17, %f15
	.word	0x97b385d0	! t0_kref+0x23b0:   	fcmpeq32	%f14, %f16, %o3
	.word	0x9ba018ce	! t0_kref+0x23b4:   	fdtos	%f14, %f13
	.word	0xd99e5a5c	! t0_kref+0x23b8:   	ldda	[%i1 + %i4]0xd2, %f12
	.word	0xd9be1888	! t0_kref+0x23bc:   	stda	%f12, [%i0 + %o0]0xc4
	.word	0x99a0054e	! t0_kref+0x23c0:   	fsqrtd	%f14, %f12
	.word	0x9fb00c20	! t0_kref+0x23c4:   	fzeros	%f15
	.word	0xa9b500d5	! t0_kref+0x23c8:   	edge16l	%l4, %l5, %l4
	.word	0xfdee101b	! t0_kref+0x23cc:   	prefetcha	%i0 + %i3, 30
	.word	0x9da308ce	! t0_kref+0x23d0:   	fsubd	%f12, %f14, %f14
	.word	0xa3b30aaf	! t0_kref+0x23d4:   	fpsub16s	%f12, %f15, %f17
	.word	0x2d0f94d4	! t0_kref+0x23d8:   	sethi	%hi(0x3e535000), %l6
	.word	0xe678a01c	! t0_kref+0x23dc:   	swap	[%g2 + 0x1c], %l3
	.word	0xa805c013	! t0_kref+0x23e0:   	add	%l7, %l3, %l4
	.word	0x99a409cc	! t0_kref+0x23e4:   	fdivd	%f16, %f12, %f12
	.word	0x81dd8011	! t0_kref+0x23e8:   	flush	%l6 + %l1
	.word	0xaa820017	! t0_kref+0x23ec:   	addcc	%o0, %l7, %l5
	.word	0xecce1000	! t0_kref+0x23f0:   	ldsba	[%i0]0x80, %l6
	.word	0x9fa0012e	! t0_kref+0x23f4:   	fabss	%f14, %f15
	.word	0xa9400000	! t0_kref+0x23f8:   	mov	%y, %l4
	.word	0xf4bf5018	! t0_kref+0x23fc:   	stda	%i2, [%i5 + %i0]0x80
	.word	0xacf20013	! t0_kref+0x2400:   	udivcc	%o0, %l3, %l6
	.word	0xa1a388cc	! t0_kref+0x2404:   	fsubd	%f14, %f12, %f16
	.word	0x99a3884c	! t0_kref+0x2408:   	faddd	%f14, %f12, %f12
	.word	0xa6adc016	! t0_kref+0x240c:   	andncc	%l7, %l6, %l3
	.word	0x113c4f42	! t0_kref+0x2410:   	sethi	%hi(0xf13d0800), %o0
	.word	0xa7b3848c	! t0_kref+0x2414:   	fcmple32	%f14, %f12, %l3
	.word	0x24800003	! t0_kref+0x2418:   	ble,a	_kref+0x2424
	.word	0xa6920015	! t0_kref+0x241c:   	orcc	%o0, %l5, %l3
	.word	0xae5d0015	! t0_kref+0x2420:   	smul	%l4, %l5, %l7
	.word	0x9644a260	! t0_kref+0x2424:   	addc	%l2, 0x260, %o3
	.word	0x943a3542	! t0_kref+0x2428:   	xnor	%o0, -0xabe, %o2
	.word	0xf007bfe0	! t0_kref+0x242c:   	ld	[%fp - 0x20], %i0
	.word	0x9da30950	! t0_kref+0x2430:   	fmuld	%f12, %f16, %f14
	.word	0x9db38def	! t0_kref+0x2434:   	fnands	%f14, %f15, %f14
	.word	0x948d6556	! t0_kref+0x2438:   	andcc	%l5, 0x556, %o2
	.word	0x9734a00e	! t0_kref+0x243c:   	srl	%l2, 0xe, %o3
	.word	0x9684e236	! t0_kref+0x2440:   	addcc	%l3, 0x236, %o3
	.word	0x97b5c113	! t0_kref+0x2444:   	edge32	%l7, %l3, %o3
	.word	0x9fc00004	! t0_kref+0x2448:   	call	%g0 + %g4
	.word	0x2b03c3ab	! t0_kref+0x244c:   	sethi	%hi(0xf0eac00), %l5
	.word	0xaaaa0017	! t0_kref+0x2450:   	andncc	%o0, %l7, %l5
	.word	0x2c800004	! t0_kref+0x2454:   	bneg,a	_kref+0x2464
	.word	0x9ba0052c	! t0_kref+0x2458:   	fsqrts	%f12, %f13
	.word	0xe828a001	! t0_kref+0x245c:   	stb	%l4, [%g2 + 1]
	.word	0x2d235c62	! t0_kref+0x2460:   	sethi	%hi(0x8d718800), %l6
	.word	0xf9ee101b	! t0_kref+0x2464:   	prefetcha	%i0 + %i3, 28
	.word	0xd248a009	! t0_kref+0x2468:   	ldsb	[%g2 + 9], %o1
	.word	0xad2c8014	! t0_kref+0x246c:   	sll	%l2, %l4, %l6
	.word	0xa7b20008	! t0_kref+0x2470:   	edge8	%o0, %o0, %l3
	.word	0x99b40d8e	! t0_kref+0x2474:   	fxor	%f16, %f14, %f12
	.word	0x81ab8a4c	! t0_kref+0x2478:   	fcmpd	%fcc0, %f14, %f12
	.word	0x9fb38d30	! t0_kref+0x247c:   	fandnot1s	%f14, %f16, %f15
	.word	0x9ba01090	! t0_kref+0x2480:   	fxtos	%f16, %f13
	.word	0xa1a3884c	! t0_kref+0x2484:   	faddd	%f14, %f12, %f16
	.word	0xdd000018	! t0_kref+0x2488:   	ld	[%g0 + %i0], %f14
	.word	0x23800001	! t0_kref+0x248c:   	fbne,a	_kref+0x2490
	.word	0xa1a000ae	! t0_kref+0x2490:   	fnegs	%f14, %f16
	.word	0x3a800005	! t0_kref+0x2494:   	bcc,a	_kref+0x24a8
	.word	0xa1b3cdef	! t0_kref+0x2498:   	fnands	%f15, %f15, %f16
	.word	0xdb00a004	! t0_kref+0x249c:   	ld	[%g2 + 4], %f13
	.word	0xe320a004	! t0_kref+0x24a0:   	st	%f17, [%g2 + 4]
	.word	0x99b3098c	! t0_kref+0x24a4:   	bshuffle	%f12, %f12, %f12
	.word	0xaa3d70ee	! t0_kref+0x24a8:   	xnor	%l5, -0xf12, %l5
	.word	0x3b800001	! t0_kref+0x24ac:   	fble,a	_kref+0x24b0
	.word	0x9da01931	! t0_kref+0x24b0:   	fstod	%f17, %f14
	.word	0x81dbe36c	! t0_kref+0x24b4:   	flush	%o7 + 0x36c
	.word	0xe1180019	! t0_kref+0x24b8:   	ldd	[%g0 + %i1], %f16
	.word	0x8143c000	! t0_kref+0x24bc:   	stbar
	.word	0xa8c5c015	! t0_kref+0x24c0:   	addccc	%l7, %l5, %l4
	.word	0x3d800006	! t0_kref+0x24c4:   	fbule,a	_kref+0x24dc
	.word	0xa3a4492e	! t0_kref+0x24c8:   	fmuls	%f17, %f14, %f17
	.word	0x948dbef0	! t0_kref+0x24cc:   	andcc	%l6, -0x110, %o2
	.word	0xa7400000	! t0_kref+0x24d0:   	mov	%y, %l3
	.word	0x9ba00130	! t0_kref+0x24d4:   	fabss	%f16, %f13
	.word	0xc1ee5014	! t0_kref+0x24d8:   	prefetcha	%i1 + %l4, 0
	.word	0x99a409cc	! t0_kref+0x24dc:   	fdivd	%f16, %f12, %f12
	.word	0xe19f5a58	! t0_kref+0x24e0:   	ldda	[%i5 + %i0]0xd2, %f16
	.word	0xd48e9058	! t0_kref+0x24e4:   	lduba	[%i2 + %i0]0x82, %o2
	.word	0xe2ee101a	! t0_kref+0x24e8:   	ldstuba	[%i0 + %i2]0x80, %l1
	.word	0x9ba00030	! t0_kref+0x24ec:   	fmovs	%f16, %f13
	.word	0x9da3882c	! t0_kref+0x24f0:   	fadds	%f14, %f12, %f14
	.word	0xac6233de	! t0_kref+0x24f4:   	subc	%o0, -0xc22, %l6
	.word	0x81ab0ace	! t0_kref+0x24f8:   	fcmped	%fcc0, %f12, %f14
	.word	0x95b500a8	! t0_kref+0x24fc:   	edge16n	%l4, %o0, %o2
	.word	0xa1a40850	! t0_kref+0x2500:   	faddd	%f16, %f16, %f16
	.word	0xaafd0013	! t0_kref+0x2504:   	sdivcc	%l4, %l3, %l5
	.word	0xee2e6009	! t0_kref+0x2508:   	stb	%l7, [%i1 + 9]
	.word	0x99a0190c	! t0_kref+0x250c:   	fitod	%f12, %f12
	.word	0x9fa01a4e	! t0_kref+0x2510:   	fdtoi	%f14, %f15
	.word	0x99a018cc	! t0_kref+0x2514:   	fdtos	%f12, %f12
	.word	0x9db30aae	! t0_kref+0x2518:   	fpsub16s	%f12, %f14, %f14
	.word	0x9ba018ce	! t0_kref+0x251c:   	fdtos	%f14, %f13
	.word	0xae5a2b81	! t0_kref+0x2520:   	smul	%o0, 0xb81, %l7
	.word	0x9f414000	! t0_kref+0x2524:   	mov	%pc, %o7
!	.word	0x234f1eb4	! t0_kref+0x2528:   	fbne,a,pt	%fcc0, SYM(t0_subr0)
	   	fbne,a,pt	%fcc0, SYM(t0_subr0)
	.word	0x92ba0013	! t0_kref+0x252c:   	xnorcc	%o0, %l3, %o1
	.word	0x9bb34aee	! t0_kref+0x2530:   	fpsub32s	%f13, %f14, %f13
	.word	0xd9be1000	! t0_kref+0x2534:   	stda	%f12, [%i0]0x80
	.word	0x37800001	! t0_kref+0x2538:   	fbge,a	_kref+0x253c
	.word	0x9db4462c	! t0_kref+0x253c:   	fmul8x16	%f17, %f12, %f14
	.word	0xa3a018ce	! t0_kref+0x2540:   	fdtos	%f14, %f17
	.word	0xa88dc014	! t0_kref+0x2544:   	andcc	%l7, %l4, %l4
	.word	0xef68a04b	! t0_kref+0x2548:   	prefetch	%g2 + 0x4b, 23
	.word	0xa9418000	! t0_kref+0x254c:   	mov	%fprs, %l4
	.word	0x9db30f4e	! t0_kref+0x2550:   	fornot1	%f12, %f14, %f14
	.word	0xe630a00e	! t0_kref+0x2554:   	sth	%l3, [%g2 + 0xe]
	.word	0x95b5c155	! t0_kref+0x2558:   	edge32l	%l7, %l5, %o2
	.word	0x99a00550	! t0_kref+0x255c:   	fsqrtd	%f16, %f12
	.word	0xd91fbd88	! t0_kref+0x2560:   	ldd	[%fp - 0x278], %f12
	.word	0xd920a010	! t0_kref+0x2564:   	st	%f12, [%g2 + 0x10]
	.word	0x81d90016	! t0_kref+0x2568:   	flush	%g4 + %l6
	.word	0xec2e4000	! t0_kref+0x256c:   	stb	%l6, [%i1]
	.word	0x81ab0ab1	! t0_kref+0x2570:   	fcmpes	%fcc0, %f12, %f17
	.word	0xa4fdef6b	! t0_kref+0x2574:   	sdivcc	%l7, 0xf6b, %l2
	.word	0x99a00531	! t0_kref+0x2578:   	fsqrts	%f17, %f12
	.word	0xaefd4008	! t0_kref+0x257c:   	sdivcc	%l5, %o0, %l7
	.word	0x99a308ce	! t0_kref+0x2580:   	fsubd	%f12, %f14, %f12
	.word	0xa1a0054e	! t0_kref+0x2584:   	fsqrtd	%f14, %f16
	.word	0x81ac0ab1	! t0_kref+0x2588:   	fcmpes	%fcc0, %f16, %f17
	.word	0xae957d0e	! t0_kref+0x258c:   	orcc	%l5, -0x2f2, %l7
	.word	0xdb20a028	! t0_kref+0x2590:   	st	%f13, [%g2 + 0x28]
	.word	0xaa64e2f3	! t0_kref+0x2594:   	subc	%l3, 0x2f3, %l5
	.word	0xa1b40a6d	! t0_kref+0x2598:   	fpadd32s	%f16, %f13, %f16
	.word	0x9da3894c	! t0_kref+0x259c:   	fmuld	%f14, %f12, %f14
	.word	0xf3ee501c	! t0_kref+0x25a0:   	prefetcha	%i1 + %i4, 25
	.word	0x33800003	! t0_kref+0x25a4:   	fbe,a	_kref+0x25b0
	.word	0xee28a016	! t0_kref+0x25a8:   	stb	%l7, [%g2 + 0x16]
	.word	0xd83e6010	! t0_kref+0x25ac:   	std	%o4, [%i1 + 0x10]
	.word	0xa1a00031	! t0_kref+0x25b0:   	fmovs	%f17, %f16
	.word	0xec280018	! t0_kref+0x25b4:   	stb	%l6, [%g0 + %i0]
	.word	0xd519401d	! t0_kref+0x25b8:   	ldd	[%g5 + %i5], %f10
	.word	0xe8ce505a	! t0_kref+0x25bc:   	ldsba	[%i1 + %i2]0x82, %l4
	.word	0xee50a022	! t0_kref+0x25c0:   	ldsh	[%g2 + 0x22], %l7
	.word	0xa1a0052d	! t0_kref+0x25c4:   	fsqrts	%f13, %f16
	.word	0x33800007	! t0_kref+0x25c8:   	fbe,a	_kref+0x25e4
	.word	0x9655eeab	! t0_kref+0x25cc:   	umul	%l7, 0xeab, %o3
	.word	0x93418000	! t0_kref+0x25d0:   	mov	%fprs, %o1
	.word	0x9da00531	! t0_kref+0x25d4:   	fsqrts	%f17, %f14
	.word	0xe11e6010	! t0_kref+0x25d8:   	ldd	[%i1 + 0x10], %f16
	.word	0x99a308cc	! t0_kref+0x25dc:   	fsubd	%f12, %f12, %f12
	.word	0x9da389d0	! t0_kref+0x25e0:   	fdivd	%f14, %f16, %f14
	.word	0xa1a0054c	! t0_kref+0x25e4:   	fsqrtd	%f12, %f16
	.word	0x81858000	! t0_kref+0x25e8:   	wr	%l6, %g0, %y
	.word	0x3e800005	! t0_kref+0x25ec:   	bvc,a	_kref+0x2600
	.word	0xea0e6018	! t0_kref+0x25f0:   	ldub	[%i1 + 0x18], %l5
	.word	0x9ba01090	! t0_kref+0x25f4:   	fxtos	%f16, %f13
	.word	0xa3a0052f	! t0_kref+0x25f8:   	fsqrts	%f15, %f17
	.word	0xa9418000	! t0_kref+0x25fc:   	mov	%fprs, %l4
	.word	0xec28a016	! t0_kref+0x2600:   	stb	%l6, [%g2 + 0x16]
	.word	0xe450a02a	! t0_kref+0x2604:   	ldsh	[%g2 + 0x2a], %l2
	.word	0xe620a03c	! t0_kref+0x2608:   	st	%l3, [%g2 + 0x3c]
	.word	0x9da0052d	! t0_kref+0x260c:   	fsqrts	%f13, %f14
	.word	0x33800004	! t0_kref+0x2610:   	fbe,a	_kref+0x2620
	.word	0xd9be1a5b	! t0_kref+0x2614:   	stda	%f12, [%i0 + %i3]0xd2
	.word	0xe41e4000	! t0_kref+0x2618:   	ldd	[%i1], %l2
	.word	0xa1a408ce	! t0_kref+0x261c:   	fsubd	%f16, %f14, %f16
	.word	0xac64b06a	! t0_kref+0x2620:   	subc	%l2, -0xf96, %l6
	.word	0x2b800003	! t0_kref+0x2624:   	fbug,a	_kref+0x2630
	.word	0xea0e8018	! t0_kref+0x2628:   	ldub	[%i2 + %i0], %l5
	.word	0x94b4aa87	! t0_kref+0x262c:   	orncc	%l2, 0xa87, %o2
	.word	0xe11e4000	! t0_kref+0x2630:   	ldd	[%i1], %f16
	.word	0x81db6b59	! t0_kref+0x2634:   	flush	%o5 + 0xb59
	.word	0x9da0012e	! t0_kref+0x2638:   	fabss	%f14, %f14
	.word	0xe320a004	! t0_kref+0x263c:   	st	%f17, [%g2 + 4]
	.word	0x8143c000	! t0_kref+0x2640:   	stbar
	.word	0x99b306ec	! t0_kref+0x2644:   	fmul8ulx16	%f12, %f12, %f12
	.word	0xadb305ce	! t0_kref+0x2648:   	fcmpeq32	%f12, %f14, %l6
	.word	0xe8ce1000	! t0_kref+0x264c:   	ldsba	[%i0]0x80, %l4
	.word	0x2e800007	! t0_kref+0x2650:   	bvs,a	_kref+0x266c
	.word	0xa1a388ce	! t0_kref+0x2654:   	fsubd	%f14, %f14, %f16
	.word	0x9734c008	! t0_kref+0x2658:   	srl	%l3, %o0, %o3
	.word	0xa1b38f4c	! t0_kref+0x265c:   	fornot1	%f14, %f12, %f16
	.word	0xa85d8017	! t0_kref+0x2660:   	smul	%l6, %l7, %l4
	.word	0xad400000	! t0_kref+0x2664:   	mov	%y, %l6
	.word	0xa535e005	! t0_kref+0x2668:   	srl	%l7, 0x5, %l2
	.word	0x9fa3482f	! t0_kref+0x266c:   	fadds	%f13, %f15, %f15
	.word	0x926230cf	! t0_kref+0x2670:   	subc	%o0, -0xf31, %o1
	.word	0xa3a01a4e	! t0_kref+0x2674:   	fdtoi	%f14, %f17
	.word	0xa53d8015	! t0_kref+0x2678:   	sra	%l6, %l5, %l2
	.word	0x81df8010	! t0_kref+0x267c:   	flush	%fp + %l0
	.word	0xacf4f342	! t0_kref+0x2680:   	udivcc	%l3, -0xcbe, %l6
	.word	0xa3a0052e	! t0_kref+0x2684:   	fsqrts	%f14, %f17
	.word	0xaa8c8017	! t0_kref+0x2688:   	andcc	%l2, %l7, %l5
	.word	0x929d4015	! t0_kref+0x268c:   	xorcc	%l5, %l5, %o1
	.word	0x92fcf298	! t0_kref+0x2690:   	sdivcc	%l3, -0xd68, %o1
	.word	0xa415ac3d	! t0_kref+0x2694:   	or	%l6, 0xc3d, %l2
	.word	0xa9b50240	! t0_kref+0x2698:   	array16	%l4, %g0, %l4
	.word	0x99a00531	! t0_kref+0x269c:   	fsqrts	%f17, %f12
	.word	0xea96d018	! t0_kref+0x26a0:   	lduha	[%i3 + %i0]0x80, %l5
	.word	0xa1a389d0	! t0_kref+0x26a4:   	fdivd	%f14, %f16, %f16
	.word	0xa1a00031	! t0_kref+0x26a8:   	fmovs	%f17, %f16
	.word	0x99b406ac	! t0_kref+0x26ac:   	fmul8x16al	%f16, %f12, %f12
	.word	0xa69d3ed2	! t0_kref+0x26b0:   	xorcc	%l4, -0x12e, %l3
	.word	0x81ab8ace	! t0_kref+0x26b4:   	fcmped	%fcc0, %f14, %f14
	.word	0x9444c017	! t0_kref+0x26b8:   	addc	%l3, %l7, %o2
	.word	0x27800004	! t0_kref+0x26bc:   	fbul,a	_kref+0x26cc
	.word	0xd9be1a1c	! t0_kref+0x26c0:   	stda	%f12, [%i0 + %i4]0xd0
	.word	0x923cf77c	! t0_kref+0x26c4:   	xnor	%l3, -0x884, %o1
	.word	0xa1b40e0c	! t0_kref+0x26c8:   	fand	%f16, %f12, %f16
	.word	0xa1a3894e	! t0_kref+0x26cc:   	fmuld	%f14, %f14, %f16
	.word	0x9db30d40	! t0_kref+0x26d0:   	fnot1	%f12, %f14
	.word	0xe26e600a	! t0_kref+0x26d4:   	ldstub	[%i1 + 0xa], %l1
	.word	0xa6d23b98	! t0_kref+0x26d8:   	umulcc	%o0, -0x468, %l3
	.word	0x9ba0052d	! t0_kref+0x26dc:   	fsqrts	%f13, %f13
	.word	0xd200a02c	! t0_kref+0x26e0:   	ld	[%g2 + 0x2c], %o1
	.word	0x81580000	! t0_kref+0x26e4:   	flushw
	.word	0xdd20a028	! t0_kref+0x26e8:   	st	%f14, [%g2 + 0x28]
	.word	0xc768a04b	! t0_kref+0x26ec:   	prefetch	%g2 + 0x4b, 3
	.word	0x113b3854	! t0_kref+0x26f0:   	sethi	%hi(0xece15000), %o0
	.word	0x20800003	! t0_kref+0x26f4:   	bn,a	_kref+0x2700
	.word	0x99a0054e	! t0_kref+0x26f8:   	fsqrtd	%f14, %f12
	.word	0xaf400000	! t0_kref+0x26fc:   	mov	%y, %l7
	.word	0xa9050016	! t0_kref+0x2700:   	taddcc	%l4, %l6, %l4
	.word	0xa6350008	! t0_kref+0x2704:   	orn	%l4, %o0, %l3
	.word	0xacfcf07b	! t0_kref+0x2708:   	sdivcc	%l3, -0xf85, %l6
	.word	0x9da308ae	! t0_kref+0x270c:   	fsubs	%f12, %f14, %f14
	.word	0xa8058014	! t0_kref+0x2710:   	add	%l6, %l4, %l4
	.word	0x81b01024	! t0_kref+0x2714:   	siam	0x4
	.word	0xa415bf9d	! t0_kref+0x2718:   	or	%l6, -0x63, %l2
	.word	0x99a018cc	! t0_kref+0x271c:   	fdtos	%f12, %f12
	.word	0xaa3dc016	! t0_kref+0x2720:   	xnor	%l7, %l6, %l5
	.word	0xed68a040	! t0_kref+0x2724:   	prefetch	%g2 + 0x40, 22
	.word	0x90adb444	! t0_kref+0x2728:   	andncc	%l6, -0xbbc, %o0
	.word	0x9fb34aef	! t0_kref+0x272c:   	fpsub32s	%f13, %f15, %f15
	.word	0x905cf584	! t0_kref+0x2730:   	smul	%l3, -0xa7c, %o0
	.word	0x9de3bfa0	! t0_kref+0x2734:   	save	%sp, -0x60, %sp
	.word	0xb2383445	! t0_kref+0x2738:   	xnor	%g0, -0xbbb, %i1
	.word	0xa9eeadb3	! t0_kref+0x273c:   	restore	%i2, 0xdb3, %l4
	.word	0xd93e4000	! t0_kref+0x2740:   	std	%f12, [%i1]
	.word	0xad348016	! t0_kref+0x2744:   	srl	%l2, %l6, %l6
	.word	0x90adb95f	! t0_kref+0x2748:   	andncc	%l6, -0x6a1, %o0
	.word	0xa1b38cad	! t0_kref+0x274c:   	fandnot2s	%f14, %f13, %f16
	.word	0x99b3c6b1	! t0_kref+0x2750:   	fmul8x16al	%f15, %f17, %f12
	.word	0xe5ee501b	! t0_kref+0x2754:   	prefetcha	%i1 + %i3, 18
	.word	0x96f5e5e1	! t0_kref+0x2758:   	udivcc	%l7, 0x5e1, %o3
	.word	0xe620a024	! t0_kref+0x275c:   	st	%l3, [%g2 + 0x24]
	.word	0xf9ee501d	! t0_kref+0x2760:   	prefetcha	%i1 + %i5, 28
	.word	0xf36e2018	! t0_kref+0x2764:   	prefetch	%i0 + 0x18, 25
	.word	0x99a30850	! t0_kref+0x2768:   	faddd	%f12, %f16, %f12
	.word	0xa1a00550	! t0_kref+0x276c:   	fsqrtd	%f16, %f16
	.word	0x9644c016	! t0_kref+0x2770:   	addc	%l3, %l6, %o3
	.word	0xac9cfb7b	! t0_kref+0x2774:   	xorcc	%l3, -0x485, %l6
	.word	0x99a0052d	! t0_kref+0x2778:   	fsqrts	%f13, %f12
	.word	0xac8d68e1	! t0_kref+0x277c:   	andcc	%l5, 0x8e1, %l6
	.word	0x9da309cc	! t0_kref+0x2780:   	fdivd	%f12, %f12, %f14
	.word	0xfbee501a	! t0_kref+0x2784:   	prefetcha	%i1 + %i2, 29
	.word	0x93b4c177	! t0_kref+0x2788:   	edge32ln	%l3, %l7, %o1
	.word	0xd66e2003	! t0_kref+0x278c:   	ldstub	[%i0 + 3], %o3
	.word	0xa1a3482f	! t0_kref+0x2790:   	fadds	%f13, %f15, %f16
	.word	0x3b800001	! t0_kref+0x2794:   	fble,a	_kref+0x2798
	.word	0xe1000019	! t0_kref+0x2798:   	ld	[%g0 + %i1], %f16
	.word	0x22800006	! t0_kref+0x279c:   	be,a	_kref+0x27b4
	.word	0x9da30950	! t0_kref+0x27a0:   	fmuld	%f12, %f16, %f14
	.word	0xd9be1897	! t0_kref+0x27a4:   	stda	%f12, [%i0 + %l7]0xc4
	.word	0x93b540d6	! t0_kref+0x27a8:   	edge16l	%l5, %l6, %o1
	.word	0xa4f53d62	! t0_kref+0x27ac:   	udivcc	%l4, -0x29e, %l2
	.word	0xa9b4c335	! t0_kref+0x27b0:   	bmask	%l3, %l5, %l4
	.word	0xd998105d	! t0_kref+0x27b4:   	ldda	[%g0 + %i5]0x82, %f12
	.word	0xacd54015	! t0_kref+0x27b8:   	umulcc	%l5, %l5, %l6
	.word	0xa655c015	! t0_kref+0x27bc:   	umul	%l7, %l5, %l3
	.word	0x9fc10000	! t0_kref+0x27c0:   	call	%g4
	.word	0x9fa409ad	! t0_kref+0x27c4:   	fdivs	%f16, %f13, %f15
	.word	0xe430a008	! t0_kref+0x27c8:   	sth	%l2, [%g2 + 8]
	.word	0x87802080	! t0_kref+0x27cc:   	mov	0x80, %asi
	.word	0xa6b52fb5	! t0_kref+0x27d0:   	orncc	%l4, 0xfb5, %l3
	.word	0xf83e4000	! t0_kref+0x27d4:   	std	%i4, [%i1]
	.word	0x99a408d0	! t0_kref+0x27d8:   	fsubd	%f16, %f16, %f12
	.word	0xa5400000	! t0_kref+0x27dc:   	mov	%y, %l2
	.word	0x81580000	! t0_kref+0x27e0:   	flushw
	.word	0x99b40e0c	! t0_kref+0x27e4:   	fand	%f16, %f12, %f12
	.word	0x8143c000	! t0_kref+0x27e8:   	stbar
	.word	0xe48e101a	! t0_kref+0x27ec:   	lduba	[%i0 + %i2]0x80, %l2
	.word	0xf43e7ff0	! t0_kref+0x27f0:   	std	%i2, [%i1 - 0x10]
	.word	0xa9400000	! t0_kref+0x27f4:   	mov	%y, %l4
	.word	0x99b30dce	! t0_kref+0x27f8:   	fnand	%f12, %f14, %f12
	.word	0x3d800004	! t0_kref+0x27fc:   	fbule,a	_kref+0x280c
	.word	0x9da018ce	! t0_kref+0x2800:   	fdtos	%f14, %f14
	.word	0xa1b38eed	! t0_kref+0x2804:   	fornot2s	%f14, %f13, %f16
	.word	0xd608a00b	! t0_kref+0x2808:   	ldub	[%g2 + 0xb], %o3
	.word	0xe636401b	! t0_kref+0x280c:   	sth	%l3, [%i1 + %i3]
	.word	0x9da00530	! t0_kref+0x2810:   	fsqrts	%f16, %f14
	.word	0xea4e4000	! t0_kref+0x2814:   	ldsb	[%i1], %l5
	.word	0xa3a8c031	! t0_kref+0x2818:   	fmovsul	%fcc0, %f17, %f17
	.word	0xe4981018	! t0_kref+0x281c:   	ldda	[%g0 + %i0]0x80, %l2
	.word	0xd83e2010	! t0_kref+0x2820:   	std	%o4, [%i0 + 0x10]
	.word	0x3e800003	! t0_kref+0x2824:   	bvc,a	_kref+0x2830
	.word	0xa41d642c	! t0_kref+0x2828:   	xor	%l5, 0x42c, %l2
	.word	0x9fa00531	! t0_kref+0x282c:   	fsqrts	%f17, %f15
	.word	0x9da01a4e	! t0_kref+0x2830:   	fdtoi	%f14, %f14
	.word	0xecb01019	! t0_kref+0x2834:   	stha	%l6, [%g0 + %i1]0x80
	.word	0x3c480002	! t0_kref+0x2838:   	bpos,a,pt	%icc, _kref+0x2840
	.word	0x99a000ac	! t0_kref+0x283c:   	fnegs	%f12, %f12
	.word	0x81ac0ab0	! t0_kref+0x2840:   	fcmpes	%fcc0, %f16, %f16
	.word	0x9bb40aac	! t0_kref+0x2844:   	fpsub16s	%f16, %f12, %f13
	.word	0x3c800007	! t0_kref+0x2848:   	bpos,a	_kref+0x2864
	.word	0x99b007ac	! t0_kref+0x284c:   	fpackfix	%f12, %f12
	.word	0xe8ee5000	! t0_kref+0x2850:   	ldstuba	[%i1]0x80, %l4
	.word	0x93400000	! t0_kref+0x2854:   	mov	%y, %o1
	.word	0xa1a0054e	! t0_kref+0x2858:   	fsqrtd	%f14, %f16
	.word	0xd99e501d	! t0_kref+0x285c:   	ldda	[%i1 + %i5]0x80, %f12
	.word	0xa3b3cdef	! t0_kref+0x2860:   	fnands	%f15, %f15, %f17
	.word	0x91b48008	! t0_kref+0x2864:   	edge8	%l2, %o0, %o0
	.word	0x3c800006	! t0_kref+0x2868:   	bpos,a	_kref+0x2880
	.word	0x9da449b1	! t0_kref+0x286c:   	fdivs	%f17, %f17, %f14
	.word	0xa1a0012d	! t0_kref+0x2870:   	fabss	%f13, %f16
	.word	0x9fa00030	! t0_kref+0x2874:   	fmovs	%f16, %f15
	.word	0x81ac0ad0	! t0_kref+0x2878:   	fcmped	%fcc0, %f16, %f16
	.word	0x32480003	! t0_kref+0x287c:   	bne,a,pt	%icc, _kref+0x2888
	.word	0xd690a03e	! t0_kref+0x2880:   	lduha	[%g2 + 0x3e]%asi, %o3
	.word	0x9ba0052c	! t0_kref+0x2884:   	fsqrts	%f12, %f13
	.word	0xec270019	! t0_kref+0x2888:   	st	%l6, [%i4 + %i1]
	.word	0xe8362006	! t0_kref+0x288c:   	sth	%l4, [%i0 + 6]
	.word	0x81ab0ab0	! t0_kref+0x2890:   	fcmpes	%fcc0, %f12, %f16
	.word	0x9da0054e	! t0_kref+0x2894:   	fsqrtd	%f14, %f14
	.word	0xd91e3fe8	! t0_kref+0x2898:   	ldd	[%i0 - 0x18], %f12
	.word	0xee30a022	! t0_kref+0x289c:   	sth	%l7, [%g2 + 0x22]
	.word	0xa4050016	! t0_kref+0x28a0:   	add	%l4, %l6, %l2
	.word	0x925c8013	! t0_kref+0x28a4:   	smul	%l2, %l3, %o1
	.word	0xac1cc014	! t0_kref+0x28a8:   	xor	%l3, %l4, %l6
	.word	0x9da388cc	! t0_kref+0x28ac:   	fsubd	%f14, %f12, %f14
	.word	0xa3a0052f	! t0_kref+0x28b0:   	fsqrts	%f15, %f17
	.word	0xa4f52529	! t0_kref+0x28b4:   	udivcc	%l4, 0x529, %l2
	.word	0xa3a0052d	! t0_kref+0x28b8:   	fsqrts	%f13, %f17
	.word	0x9f414000	! t0_kref+0x28bc:   	mov	%pc, %o7
	.word	0xab2dc014	! t0_kref+0x28c0:   	sll	%l7, %l4, %l5
	.word	0xa8fdc017	! t0_kref+0x28c4:   	sdivcc	%l7, %l7, %l4
	.word	0xdd3e7fe0	! t0_kref+0x28c8:   	std	%f14, [%i1 - 0x20]
	.word	0xdd3e0000	! t0_kref+0x28cc:   	std	%f14, [%i0]
	.word	0xa1b3cea0	! t0_kref+0x28d0:   	fsrc1s	%f15, %f16
	.word	0x99b40e0c	! t0_kref+0x28d4:   	fand	%f16, %f12, %f12
	.word	0xe8270019	! t0_kref+0x28d8:   	st	%l4, [%i4 + %i1]
	.word	0x9da3084e	! t0_kref+0x28dc:   	faddd	%f12, %f14, %f14
	.word	0x30800007	! t0_kref+0x28e0:   	ba,a	_kref+0x28fc
	.word	0x9da3094c	! t0_kref+0x28e4:   	fmuld	%f12, %f12, %f14
	.word	0x99b009b0	! t0_kref+0x28e8:   	fexpand	%f16, %f12
	.word	0xa7b20357	! t0_kref+0x28ec:   	alignaddrl	%o0, %l7, %l3
	.word	0xabb20135	! t0_kref+0x28f0:   	edge32n	%o0, %l5, %l5
	.word	0xaa657caa	! t0_kref+0x28f4:   	subc	%l5, -0x356, %l5
	.word	0x9fb38cae	! t0_kref+0x28f8:   	fandnot2s	%f14, %f14, %f15
	.word	0xa1b3ca6d	! t0_kref+0x28fc:   	fpadd32s	%f15, %f13, %f16
	.word	0xa1b40ef1	! t0_kref+0x2900:   	fornot2s	%f16, %f17, %f16
	.word	0x81abcaad	! t0_kref+0x2904:   	fcmpes	%fcc0, %f15, %f13
	.word	0x923ded9c	! t0_kref+0x2908:   	xnor	%l7, 0xd9c, %o1
	.word	0xd6966000	! t0_kref+0x290c:   	lduha	[%i1]%asi, %o3
	.word	0x33800004	! t0_kref+0x2910:   	fbe,a	_kref+0x2920
	.word	0xe4263fec	! t0_kref+0x2914:   	st	%l2, [%i0 - 0x14]
	.word	0xac75c008	! t0_kref+0x2918:   	udiv	%l7, %o0, %l6
	.word	0x21800008	! t0_kref+0x291c:   	fbn,a	_kref+0x293c
	.word	0x925d4008	! t0_kref+0x2920:   	smul	%l5, %o0, %o1
	.word	0xa60d4008	! t0_kref+0x2924:   	and	%l5, %o0, %l3
	.word	0x36800007	! t0_kref+0x2928:   	bge,a	_kref+0x2944
	.word	0x92758017	! t0_kref+0x292c:   	udiv	%l6, %l7, %o1
	.word	0xe306200c	! t0_kref+0x2930:   	ld	[%i0 + 0xc], %f17
	.word	0x9ba018d0	! t0_kref+0x2934:   	fdtos	%f16, %f13
	.word	0x9fa389b1	! t0_kref+0x2938:   	fdivs	%f14, %f17, %f15
	.word	0xa1a018cc	! t0_kref+0x293c:   	fdtos	%f12, %f16
	.word	0xf236c000	! t0_kref+0x2940:   	sth	%i1, [%i3]
	.word	0xd0a0a000	! t0_kref+0x2944:   	sta	%o0, [%g2]%asi
	.word	0xd2d0a02a	! t0_kref+0x2948:   	ldsha	[%g2 + 0x2a]%asi, %o1
	.word	0x20480008	! t0_kref+0x294c:   	bn,a,pt	%icc, _kref+0x296c
	.word	0xd9180019	! t0_kref+0x2950:   	ldd	[%g0 + %i1], %f12
	.word	0xafb5c0b5	! t0_kref+0x2954:   	edge16n	%l7, %l5, %l7
	.word	0x99a3882c	! t0_kref+0x2958:   	fadds	%f14, %f12, %f12
	.word	0xee266000	! t0_kref+0x295c:   	st	%l7, [%i1]
	.word	0xdda0a034	! t0_kref+0x2960:   	sta	%f14, [%g2 + 0x34]%asi
	.word	0x9db34cad	! t0_kref+0x2964:   	fandnot2s	%f13, %f13, %f14
	.word	0xa6d5c012	! t0_kref+0x2968:   	umulcc	%l7, %l2, %l3
	.word	0x99b40ad0	! t0_kref+0x296c:   	fpsub32	%f16, %f16, %f12
	.word	0x99a00531	! t0_kref+0x2970:   	fsqrts	%f17, %f12
	.word	0xafb404ce	! t0_kref+0x2974:   	fcmpne32	%f16, %f14, %l7
	.word	0x9140c000	! t0_kref+0x2978:   	mov	%asi, %o0
	.word	0x99b38ed0	! t0_kref+0x297c:   	fornot2	%f14, %f16, %f12
	.word	0x95b54280	! t0_kref+0x2980:   	array32	%l5, %g0, %o2
	.word	0x99b3466f	! t0_kref+0x2984:   	fmul8x16au	%f13, %f15, %f12
	.word	0x28800001	! t0_kref+0x2988:   	bleu,a	_kref+0x298c
	.word	0x293a96e1	! t0_kref+0x298c:   	sethi	%hi(0xea5b8400), %l4
	.word	0xe410a018	! t0_kref+0x2990:   	lduh	[%g2 + 0x18], %l2
	.word	0x9ba018d0	! t0_kref+0x2994:   	fdtos	%f16, %f13
	.word	0xe4a01018	! t0_kref+0x2998:   	sta	%l2, [%g0 + %i0]0x80
	.word	0xae64f831	! t0_kref+0x299c:   	subc	%l3, -0x7cf, %l7
	.word	0xa1a0052d	! t0_kref+0x29a0:   	fsqrts	%f13, %f16
	.word	0xc96e0015	! t0_kref+0x29a4:   	prefetch	%i0 + %l5, 4
	.word	0xa1a018cc	! t0_kref+0x29a8:   	fdtos	%f12, %f16
	.word	0x908d6b3a	! t0_kref+0x29ac:   	andcc	%l5, 0xb3a, %o0
	.word	0xa1a0002d	! t0_kref+0x29b0:   	fmovs	%f13, %f16
	.word	0x22800008	! t0_kref+0x29b4:   	be,a	_kref+0x29d4
	.word	0x99a00550	! t0_kref+0x29b8:   	fsqrtd	%f16, %f12
	.word	0x9db00770	! t0_kref+0x29bc:   	fpack16	%f16, %f14
	.word	0xabb30490	! t0_kref+0x29c0:   	fcmple32	%f12, %f16, %l5
	.word	0x967a20cf	! t0_kref+0x29c4:   	sdiv	%o0, 0xcf, %o3
	.word	0xd27e3fe0	! t0_kref+0x29c8:   	swap	[%i0 - 0x20], %o1
	.word	0x20800004	! t0_kref+0x29cc:   	bn,a	_kref+0x29dc
	.word	0x931d3758	! t0_kref+0x29d0:   	tsubcctv	%l4, -0x8a8, %o1
	.word	0x99a0052f	! t0_kref+0x29d4:   	fsqrts	%f15, %f12
	.word	0xdd3e2000	! t0_kref+0x29d8:   	std	%f14, [%i0]
	.word	0x8143e040	! t0_kref+0x29dc:   	membar	0x40
	.word	0xa43a0014	! t0_kref+0x29e0:   	xnor	%o0, %l4, %l2
	.word	0x35800007	! t0_kref+0x29e4:   	fbue,a	_kref+0x2a00
	.word	0xa48c8015	! t0_kref+0x29e8:   	andcc	%l2, %l5, %l2
	.word	0x8143c000	! t0_kref+0x29ec:   	stbar
	.word	0x99a01050	! t0_kref+0x29f0:   	fdtox	%f16, %f12
	.word	0xa1a00550	! t0_kref+0x29f4:   	fsqrtd	%f16, %f16
	.word	0xa69a0015	! t0_kref+0x29f8:   	xorcc	%o0, %l5, %l3
	.word	0xdf80a028	! t0_kref+0x29fc:   	lda	[%g2 + 0x28]%asi, %f15
	.word	0xab2d8016	! t0_kref+0x2a00:   	sll	%l6, %l6, %l5
	.word	0xd0a8a013	! t0_kref+0x2a04:   	stba	%o0, [%g2 + 0x13]%asi
	.word	0x99b38990	! t0_kref+0x2a08:   	bshuffle	%f14, %f16, %f12
	.word	0xa88cc017	! t0_kref+0x2a0c:   	andcc	%l3, %l7, %l4
	.word	0xd83e001d	! t0_kref+0x2a10:   	std	%o4, [%i0 + %i5]
	.word	0xe27e2010	! t0_kref+0x2a14:   	swap	[%i0 + 0x10], %l1
	.word	0x35800001	! t0_kref+0x2a18:   	fbue,a	_kref+0x2a1c
	.word	0xefe8a009	! t0_kref+0x2a1c:   	prefetcha	%g2 + 9, 23
	.word	0x99a388af	! t0_kref+0x2a20:   	fsubs	%f14, %f15, %f12
	.word	0xa624a2fa	! t0_kref+0x2a24:   	sub	%l2, 0x2fa, %l3
	.word	0xa5b54174	! t0_kref+0x2a28:   	edge32ln	%l5, %l4, %l2
	.word	0x37800006	! t0_kref+0x2a2c:   	fbge,a	_kref+0x2a44
	.word	0x90b5b04d	! t0_kref+0x2a30:   	orncc	%l6, -0xfb3, %o0
	.word	0xa8f4b705	! t0_kref+0x2a34:   	udivcc	%l2, -0x8fb, %l4
	.word	0x9bb44a6e	! t0_kref+0x2a38:   	fpadd32s	%f17, %f14, %f13
	.word	0xabb3040e	! t0_kref+0x2a3c:   	fcmple16	%f12, %f14, %l5
	.word	0xeab0a016	! t0_kref+0x2a40:   	stha	%l5, [%g2 + 0x16]%asi
	.word	0x99a00550	! t0_kref+0x2a44:   	fsqrtd	%f16, %f12
	.word	0x9da0190f	! t0_kref+0x2a48:   	fitod	%f15, %f14
	.word	0x20800005	! t0_kref+0x2a4c:   	bn,a	_kref+0x2a60
	.word	0xafb48033	! t0_kref+0x2a50:   	edge8n	%l2, %l3, %l7
	.word	0xaaad7b1b	! t0_kref+0x2a54:   	andncc	%l5, -0x4e5, %l5
	.word	0xd906401c	! t0_kref+0x2a58:   	ld	[%i1 + %i4], %f12
	.word	0xe11fbdf0	! t0_kref+0x2a5c:   	ldd	[%fp - 0x210], %f16
	.word	0x95b404cc	! t0_kref+0x2a60:   	fcmpne32	%f16, %f12, %o2
	.word	0x9da01930	! t0_kref+0x2a64:   	fstod	%f16, %f14
	.word	0xeaa8a034	! t0_kref+0x2a68:   	stba	%l5, [%g2 + 0x34]%asi
	.word	0x9da4094e	! t0_kref+0x2a6c:   	fmuld	%f16, %f14, %f14
	.word	0x8143e040	! t0_kref+0x2a70:   	membar	0x40
	.word	0x9734c014	! t0_kref+0x2a74:   	srl	%l3, %l4, %o3
	.word	0x9db3cc70	! t0_kref+0x2a78:   	fnors	%f15, %f16, %f14
	.word	0x9de3bfa0	! t0_kref+0x2a7c:   	save	%sp, -0x60, %sp
	.word	0xadef0018	! t0_kref+0x2a80:   	restore	%i4, %i0, %l6
	.word	0xe1be3ff0	! t0_kref+0x2a84:   	stda	%f16, [%i0 - 0x10]%asi
	.word	0x3d800001	! t0_kref+0x2a88:   	fbule,a	_kref+0x2a8c
	.word	0xa87d7a09	! t0_kref+0x2a8c:   	sdiv	%l5, -0x5f7, %l4
	.word	0x99a3892c	! t0_kref+0x2a90:   	fmuls	%f14, %f12, %f12
	.word	0xf83e0000	! t0_kref+0x2a94:   	std	%i4, [%i0]
	.word	0xeea0a024	! t0_kref+0x2a98:   	sta	%l7, [%g2 + 0x24]%asi
	.word	0x9f414000	! t0_kref+0x2a9c:   	mov	%pc, %o7
!	.word	0x334f1d56	! t0_kref+0x2aa0:   	fbe,a,pt	%fcc0, SYM(t0_subr0)
	   	fbe,a,pt	%fcc0, SYM(t0_subr0)
	.word	0xa83dc016	! t0_kref+0x2aa4:   	xnor	%l7, %l6, %l4
	.word	0x96fda99b	! t0_kref+0x2aa8:   	sdivcc	%l6, 0x99b, %o3
	.word	0x99a4082f	! t0_kref+0x2aac:   	fadds	%f16, %f15, %f12
	.word	0xd8fe101c	! t0_kref+0x2ab0:   	swapa	[%i0 + %i4]0x80, %o4
	.word	0x91b50112	! t0_kref+0x2ab4:   	edge32	%l4, %l2, %o0
	.word	0x9da308ae	! t0_kref+0x2ab8:   	fsubs	%f12, %f14, %f14
	.word	0x905dc015	! t0_kref+0x2abc:   	smul	%l7, %l5, %o0
	.word	0x22480006	! t0_kref+0x2ac0:   	be,a,pt	%icc, _kref+0x2ad8
	.word	0xa1a01a50	! t0_kref+0x2ac4:   	fdtoi	%f16, %f16
	.word	0x81d8323e	! t0_kref+0x2ac8:   	flush	%g0 - 0xdc2
	.word	0x9404f4a6	! t0_kref+0x2acc:   	add	%l3, -0xb5a, %o2
	.word	0x90fd0015	! t0_kref+0x2ad0:   	sdivcc	%l4, %l5, %o0
	.word	0x9db00c20	! t0_kref+0x2ad4:   	fzeros	%f14
	.word	0x99a388ae	! t0_kref+0x2ad8:   	fsubs	%f14, %f14, %f12
	.word	0x99a4094c	! t0_kref+0x2adc:   	fmuld	%f16, %f12, %f12
	.word	0x20480006	! t0_kref+0x2ae0:   	bn,a,pt	%icc, _kref+0x2af8
	.word	0x9da0054e	! t0_kref+0x2ae4:   	fsqrtd	%f14, %f14
	.word	0x99a0014e	! t0_kref+0x2ae8:   	fabsd	%f14, %f12
	.word	0x9db306f0	! t0_kref+0x2aec:   	fmul8ulx16	%f12, %f16, %f14
	.word	0x9fa389ac	! t0_kref+0x2af0:   	fdivs	%f14, %f12, %f15
	.word	0xaa658012	! t0_kref+0x2af4:   	subc	%l6, %l2, %l5
	.word	0x93400000	! t0_kref+0x2af8:   	mov	%y, %o1
	.word	0x8610200a	! t0_kref+0x2afc:   	mov	0xa, %g3
	.word	0x86a0e001	! t0_kref+0x2b00:   	subcc	%g3, 1, %g3
	.word	0x2280000e	! t0_kref+0x2b04:   	be,a	_kref+0x2b3c
	.word	0xff6e6010	! t0_kref+0x2b08:   	prefetch	%i1 + 0x10, 31
	.word	0x3d800008	! t0_kref+0x2b0c:   	fbule,a	_kref+0x2b2c
	.word	0x9bb40a6c	! t0_kref+0x2b10:   	fpadd32s	%f16, %f12, %f13
	.word	0xa3a449ae	! t0_kref+0x2b14:   	fdivs	%f17, %f14, %f17
	.word	0xaa44c016	! t0_kref+0x2b18:   	addc	%l3, %l6, %l5
	.word	0xa1a0052f	! t0_kref+0x2b1c:   	fsqrts	%f15, %f16
	.word	0x99a9404e	! t0_kref+0x2b20:   	fmovdug	%fcc0, %f14, %f12
	.word	0x945d4017	! t0_kref+0x2b24:   	smul	%l5, %l7, %o2
	.word	0xa864eabf	! t0_kref+0x2b28:   	subc	%l3, 0xabf, %l4
	.word	0x967dc017	! t0_kref+0x2b2c:   	sdiv	%l7, %l7, %o3
	.word	0xa1b38f8c	! t0_kref+0x2b30:   	for	%f14, %f12, %f16
	.word	0x903d0014	! t0_kref+0x2b34:   	xnor	%l4, %l4, %o0
	.word	0x96fd4015	! t0_kref+0x2b38:   	sdivcc	%l5, %l5, %o3
	.word	0xd9be7fe8	! t0_kref+0x2b3c:   	stda	%f12, [%i1 - 0x18]%asi
	.word	0x9da01a31	! t0_kref+0x2b40:   	fstoi	%f17, %f14
	.word	0xa1b00f0e	! t0_kref+0x2b44:   	fsrc2	%f14, %f16
	.word	0xe4a0a01c	! t0_kref+0x2b48:   	sta	%l2, [%g2 + 0x1c]%asi
	.word	0x9f414000	! t0_kref+0x2b4c:   	mov	%pc, %o7
	.word	0xe300a038	! t0_kref+0x2b50:   	ld	[%g2 + 0x38], %f17
	.word	0xa43cc014	! t0_kref+0x2b54:   	xnor	%l3, %l4, %l2
	.word	0x3f800001	! t0_kref+0x2b58:   	fbo,a	_kref+0x2b5c
	.word	0xe4b6601e	! t0_kref+0x2b5c:   	stha	%l2, [%i1 + 0x1e]%asi
	.word	0x36480003	! t0_kref+0x2b60:   	bge,a,pt	%icc, _kref+0x2b6c
	.word	0xa1a308d0	! t0_kref+0x2b64:   	fsubd	%f12, %f16, %f16
	.word	0x9fa01a4e	! t0_kref+0x2b68:   	fdtoi	%f14, %f15
	.word	0xa4b22c3b	! t0_kref+0x2b6c:   	orncc	%o0, 0xc3b, %l2
	.word	0xa1a3c8b0	! t0_kref+0x2b70:   	fsubs	%f15, %f16, %f16
	.word	0xeeb6d019	! t0_kref+0x2b74:   	stha	%l7, [%i3 + %i1]0x80
	.word	0x91b48053	! t0_kref+0x2b78:   	edge8l	%l2, %l3, %o0
	.word	0xaa3d4015	! t0_kref+0x2b7c:   	xnor	%l5, %l5, %l5
	.word	0x37800003	! t0_kref+0x2b80:   	fbge,a	_kref+0x2b8c
	.word	0xee961000	! t0_kref+0x2b84:   	lduha	[%i0]0x80, %l7
	.word	0x91b54133	! t0_kref+0x2b88:   	edge32n	%l5, %l3, %o0
	.word	0xe1be1848	! t0_kref+0x2b8c:   	stda	%f16, [%i0 + %o0]0xc2
	.word	0xaa8cbae9	! t0_kref+0x2b90:   	andcc	%l2, -0x517, %l5
	.word	0x81ac0a50	! t0_kref+0x2b94:   	fcmpd	%fcc0, %f16, %f16
	.word	0xf43e6010	! t0_kref+0x2b98:   	std	%i2, [%i1 + 0x10]
	.word	0xae5d8008	! t0_kref+0x2b9c:   	smul	%l6, %o0, %l7
	.word	0xea26001c	! t0_kref+0x2ba0:   	st	%l5, [%i0 + %i4]
	.word	0x9da0002f	! t0_kref+0x2ba4:   	fmovs	%f15, %f14
	.word	0xa1a3884e	! t0_kref+0x2ba8:   	faddd	%f14, %f14, %f16
	.word	0x81dec015	! t0_kref+0x2bac:   	flush	%i3 + %l5
	.word	0xae350017	! t0_kref+0x2bb0:   	orn	%l4, %l7, %l7
	.word	0x99a8002e	! t0_kref+0x2bb4:   	fmovsn	%fcc0, %f14, %f12
	.word	0x99a0052d	! t0_kref+0x2bb8:   	fsqrts	%f13, %f12
	.word	0x2f800006	! t0_kref+0x2bbc:   	fbu,a	_kref+0x2bd4
	.word	0xa1b4062c	! t0_kref+0x2bc0:   	fmul8x16	%f16, %f12, %f16
	.word	0xa3a448af	! t0_kref+0x2bc4:   	fsubs	%f17, %f15, %f17
	.word	0xa1b44970	! t0_kref+0x2bc8:   	fpmerge	%f17, %f16, %f16
	.word	0xd93e2000	! t0_kref+0x2bcc:   	std	%f12, [%i0]
	.word	0xf3ee101a	! t0_kref+0x2bd0:   	prefetcha	%i0 + %i2, 25
	.word	0x3f800003	! t0_kref+0x2bd4:   	fbo,a	_kref+0x2be0
	.word	0xa6f521f2	! t0_kref+0x2bd8:   	udivcc	%l4, 0x1f2, %l3
	.word	0xaa3d4017	! t0_kref+0x2bdc:   	xnor	%l5, %l7, %l5
	.word	0x9de3bfa0	! t0_kref+0x2be0:   	save	%sp, -0x60, %sp
	.word	0x95e83e2a	! t0_kref+0x2be4:   	restore	%g0, -0x1d6, %o2
	.word	0x9fb30ea0	! t0_kref+0x2be8:   	fsrc1s	%f12, %f15
	.word	0x99a40850	! t0_kref+0x2bec:   	faddd	%f16, %f16, %f12
	.word	0xa6220008	! t0_kref+0x2bf0:   	sub	%o0, %o0, %l3
	.word	0xd208a03c	! t0_kref+0x2bf4:   	ldub	[%g2 + 0x3c], %o1
	.word	0x9ba018ce	! t0_kref+0x2bf8:   	fdtos	%f14, %f13
	.word	0xa6d5f260	! t0_kref+0x2bfc:   	umulcc	%l7, -0xda0, %l3
	.word	0x878020e0	! t0_kref+0x2c00:   	mov	0xe0, %asi
	.word	0x99a0192e	! t0_kref+0x2c04:   	fstod	%f14, %f12
	.word	0x9ba01a4e	! t0_kref+0x2c08:   	fdtoi	%f14, %f13
	.word	0xc168a048	! t0_kref+0x2c0c:   	prefetch	%g2 + 0x48, 0
	.word	0x37800004	! t0_kref+0x2c10:   	fbge,a	_kref+0x2c20
	.word	0xa4ad8013	! t0_kref+0x2c14:   	andncc	%l6, %l3, %l2
	.word	0xdd3e401d	! t0_kref+0x2c18:   	std	%f14, [%i1 + %i5]
	.word	0xaf154017	! t0_kref+0x2c1c:   	taddcctv	%l5, %l7, %l7
	.word	0xa1a309ce	! t0_kref+0x2c20:   	fdivd	%f12, %f14, %f16
	.word	0x9da0054e	! t0_kref+0x2c24:   	fsqrtd	%f14, %f14
	.word	0xa9048015	! t0_kref+0x2c28:   	taddcc	%l2, %l5, %l4
	.word	0x001fffff	! t0_kref+0x2c2c:   	illtrap	0x1fffff
	.word	0x95b5c168	! t0_kref+0x2c30:   	edge32ln	%l7, %o0, %o2
	.word	0xa1a00550	! t0_kref+0x2c34:   	fsqrtd	%f16, %f16
	.word	0x9da0002e	! t0_kref+0x2c38:   	fmovs	%f14, %f14
	.word	0x9da0052e	! t0_kref+0x2c3c:   	fsqrts	%f14, %f14
	.word	0xa1b44ea0	! t0_kref+0x2c40:   	fsrc1s	%f17, %f16
	.word	0x9de3bfa0	! t0_kref+0x2c44:   	save	%sp, -0x60, %sp
	.word	0xb81ec01a	! t0_kref+0x2c48:   	xor	%i3, %i2, %i4
	.word	0x93ee8018	! t0_kref+0x2c4c:   	restore	%i2, %i0, %o1
	.word	0x97400000	! t0_kref+0x2c50:   	mov	%y, %o3
	.word	0x9da00550	! t0_kref+0x2c54:   	fsqrtd	%f16, %f14
	.word	0xdf00a008	! t0_kref+0x2c58:   	ld	[%g2 + 8], %f15
	.word	0x28800007	! t0_kref+0x2c5c:   	bleu,a	_kref+0x2c78
	.word	0xdb06201c	! t0_kref+0x2c60:   	ld	[%i0 + 0x1c], %f13
	.word	0x81ab4ab1	! t0_kref+0x2c64:   	fcmpes	%fcc0, %f13, %f17
	.word	0x94c5f633	! t0_kref+0x2c68:   	addccc	%l7, -0x9cd, %o2
	.word	0x92f48012	! t0_kref+0x2c6c:   	udivcc	%l2, %l2, %o1
	.word	0x99b0076e	! t0_kref+0x2c70:   	fpack16	%f14, %f12
	.word	0x94fa0016	! t0_kref+0x2c74:   	sdivcc	%o0, %l6, %o2
	.word	0x3f800008	! t0_kref+0x2c78:   	fbo,a	_kref+0x2c98
	.word	0xaa05c016	! t0_kref+0x2c7c:   	add	%l7, %l6, %l5
	.word	0xaafd4014	! t0_kref+0x2c80:   	sdivcc	%l5, %l4, %l5
	.word	0x9fb00c20	! t0_kref+0x2c84:   	fzeros	%f15
	.word	0x925dc013	! t0_kref+0x2c88:   	smul	%l7, %l3, %o1
	.word	0xaa3cc013	! t0_kref+0x2c8c:   	xnor	%l3, %l3, %l5
	.word	0x94254016	! t0_kref+0x2c90:   	sub	%l5, %l6, %o2
	.word	0xae9deae1	! t0_kref+0x2c94:   	xorcc	%l7, 0xae1, %l7
	.word	0x97400000	! t0_kref+0x2c98:   	mov	%y, %o3
	.word	0xd248a03f	! t0_kref+0x2c9c:   	ldsb	[%g2 + 0x3f], %o1
	.word	0x911a0008	! t0_kref+0x2ca0:   	tsubcctv	%o0, %o0, %o0
	.word	0x9244e60c	! t0_kref+0x2ca4:   	addc	%l3, 0x60c, %o1
	.word	0x9da38950	! t0_kref+0x2ca8:   	fmuld	%f14, %f16, %f14
	.word	0x99a40950	! t0_kref+0x2cac:   	fmuld	%f16, %f16, %f12
	.word	0x39800005	! t0_kref+0x2cb0:   	fbuge,a	_kref+0x2cc4
	.word	0x91b38410	! t0_kref+0x2cb4:   	fcmple16	%f14, %f16, %o0
	.word	0x8143c000	! t0_kref+0x2cb8:   	stbar
	.word	0x30800002	! t0_kref+0x2cbc:   	ba,a	_kref+0x2cc4
	.word	0xed68a008	! t0_kref+0x2cc0:   	prefetch	%g2 + 8, 22
	.word	0xa8fcc012	! t0_kref+0x2cc4:   	sdivcc	%l3, %l2, %l4
	.word	0x9bb3ce2c	! t0_kref+0x2cc8:   	fands	%f15, %f12, %f13
	.word	0xab400000	! t0_kref+0x2ccc:   	mov	%y, %l5
	.word	0xa60d6ce2	! t0_kref+0x2cd0:   	and	%l5, 0xce2, %l3
	.word	0x9fa3492e	! t0_kref+0x2cd4:   	fmuls	%f13, %f14, %f15
	.word	0xd020a034	! t0_kref+0x2cd8:   	st	%o0, [%g2 + 0x34]
	.word	0x25800002	! t0_kref+0x2cdc:   	fblg,a	_kref+0x2ce4
	.word	0x99a0054c	! t0_kref+0x2ce0:   	fsqrtd	%f12, %f12
	.word	0xdd000019	! t0_kref+0x2ce4:   	ld	[%g0 + %i1], %f14
	.word	0x9ba00530	! t0_kref+0x2ce8:   	fsqrts	%f16, %f13
	.word	0xe810a01a	! t0_kref+0x2cec:   	lduh	[%g2 + 0x1a], %l4
	.word	0x925cc015	! t0_kref+0x2cf0:   	smul	%l3, %l5, %o1
	.word	0xdb00a034	! t0_kref+0x2cf4:   	ld	[%g2 + 0x34], %f13
	.word	0xd65e3ff0	! t0_kref+0x2cf8:   	ldx	[%i0 - 0x10], %o3
	.word	0xd02e0000	! t0_kref+0x2cfc:   	stb	%o0, [%i0]
	.word	0xa1b38af1	! t0_kref+0x2d00:   	fpsub32s	%f14, %f17, %f16
	.word	0x99a388d0	! t0_kref+0x2d04:   	fsubd	%f14, %f16, %f12
	.word	0xa1b34db0	! t0_kref+0x2d08:   	fxors	%f13, %f16, %f16
	.word	0x9db3090e	! t0_kref+0x2d0c:   	faligndata	%f12, %f14, %f14
	.word	0x92bcb160	! t0_kref+0x2d10:   	xnorcc	%l2, -0xea0, %o1
	.word	0xd020a004	! t0_kref+0x2d14:   	st	%o0, [%g2 + 4]
	.word	0xe1000019	! t0_kref+0x2d18:   	ld	[%g0 + %i1], %f16
	.word	0xe62e001a	! t0_kref+0x2d1c:   	stb	%l3, [%i0 + %i2]
	.word	0x901cc014	! t0_kref+0x2d20:   	xor	%l3, %l4, %o0
	.word	0x91b500f2	! t0_kref+0x2d24:   	edge16ln	%l4, %l2, %o0
	.word	0xec267fec	! t0_kref+0x2d28:   	st	%l6, [%i1 - 0x14]
	.word	0x99a0190e	! t0_kref+0x2d2c:   	fitod	%f14, %f12
	.word	0xee00a014	! t0_kref+0x2d30:   	ld	[%g2 + 0x14], %l7
	.word	0x9fa0052e	! t0_kref+0x2d34:   	fsqrts	%f14, %f15
	.word	0x2b011c52	! t0_kref+0x2d38:   	sethi	%hi(0x4714800), %l5
	.word	0x99a018ce	! t0_kref+0x2d3c:   	fdtos	%f14, %f12
	.word	0x95700017	! t0_kref+0x2d40:   	popc	%l7, %o2
	.word	0xe6263ffc	! t0_kref+0x2d44:   	st	%l3, [%i0 - 4]
	.word	0x972a200a	! t0_kref+0x2d48:   	sll	%o0, 0xa, %o3
	.word	0xec30a002	! t0_kref+0x2d4c:   	sth	%l6, [%g2 + 2]
	.word	0x92020013	! t0_kref+0x2d50:   	add	%o0, %l3, %o1
	.word	0xa3a00030	! t0_kref+0x2d54:   	fmovs	%f16, %f17
	.word	0x9da0054e	! t0_kref+0x2d58:   	fsqrtd	%f14, %f14
	.word	0xa735600a	! t0_kref+0x2d5c:   	srl	%l5, 0xa, %l3
	.word	0x9da000af	! t0_kref+0x2d60:   	fnegs	%f15, %f14
	.word	0xdd20a004	! t0_kref+0x2d64:   	st	%f14, [%g2 + 4]
	.word	0x9de3bfa0	! t0_kref+0x2d68:   	save	%sp, -0x60, %sp
	.word	0xadef2796	! t0_kref+0x2d6c:   	restore	%i4, 0x796, %l6
	.word	0xa68a0008	! t0_kref+0x2d70:   	andcc	%o0, %o0, %l3
	.word	0x2f800001	! t0_kref+0x2d74:   	fbu,a	_kref+0x2d78
	.word	0xa80cbd10	! t0_kref+0x2d78:   	and	%l2, -0x2f0, %l4
	.word	0x91b480f7	! t0_kref+0x2d7c:   	edge16ln	%l2, %l7, %o0
	.word	0xa83ca4fd	! t0_kref+0x2d80:   	xnor	%l2, 0x4fd, %l4
	.word	0x3f800003	! t0_kref+0x2d84:   	fbo,a	_kref+0x2d90
	.word	0xa1a38950	! t0_kref+0x2d88:   	fmuld	%f14, %f16, %f16
	.word	0xa1a00550	! t0_kref+0x2d8c:   	fsqrtd	%f16, %f16
	.word	0xa3a3c82d	! t0_kref+0x2d90:   	fadds	%f15, %f13, %f17
	.word	0x9da38850	! t0_kref+0x2d94:   	faddd	%f14, %f16, %f14
	.word	0xa1a389d0	! t0_kref+0x2d98:   	fdivd	%f14, %f16, %f16
	.word	0x96020015	! t0_kref+0x2d9c:   	add	%o0, %l5, %o3
	.word	0x9db44d2d	! t0_kref+0x2da0:   	fandnot1s	%f17, %f13, %f14
	.word	0xdd206cf2	! t0_kref+0x2da4:   	st	%f14, [%g1 + 0xcf2]
	.word	0x9db30750	! t0_kref+0x2da8:   	fpack32	%f12, %f16, %f14
	.word	0x81b01023	! t0_kref+0x2dac:   	siam	0x3
	.word	0xa3a00530	! t0_kref+0x2db0:   	fsqrts	%f16, %f17
	.word	0x9da4094c	! t0_kref+0x2db4:   	fmuld	%f16, %f12, %f14
	.word	0x968d0015	! t0_kref+0x2db8:   	andcc	%l4, %l5, %o3
	.word	0x9de3bfa0	! t0_kref+0x2dbc:   	save	%sp, -0x60, %sp
	.word	0xb2b621dd	! t0_kref+0x2dc0:   	orncc	%i0, 0x1dd, %i1
	.word	0xa7ee801a	! t0_kref+0x2dc4:   	restore	%i2, %i2, %l3
	.word	0x33800001	! t0_kref+0x2dc8:   	fbe,a	_kref+0x2dcc
	.word	0x95b5c0b4	! t0_kref+0x2dcc:   	edge16n	%l7, %l4, %o2
	.word	0xdb067fe4	! t0_kref+0x2dd0:   	ld	[%i1 - 0x1c], %f13
	.word	0x3e480007	! t0_kref+0x2dd4:   	bvc,a,pt	%icc, _kref+0x2df0
	.word	0x9db38d8e	! t0_kref+0x2dd8:   	fxor	%f14, %f14, %f14
	.word	0x21480004	! t0_kref+0x2ddc:   	fbn,a,pt	%fcc0, _kref+0x2dec
	.word	0x291a37f0	! t0_kref+0x2de0:   	sethi	%hi(0x68dfc000), %l4
	.word	0xa1b406ce	! t0_kref+0x2de4:   	fmul8sux16	%f16, %f14, %f16
	.word	0x2c800008	! t0_kref+0x2de8:   	bneg,a	_kref+0x2e08
	.word	0xa3a448b0	! t0_kref+0x2dec:   	fsubs	%f17, %f16, %f17
	.word	0x949ce697	! t0_kref+0x2df0:   	xorcc	%l3, 0x697, %o2
	.word	0xa3a0002d	! t0_kref+0x2df4:   	fmovs	%f13, %f17
	.word	0x9db40f90	! t0_kref+0x2df8:   	for	%f16, %f16, %f14
	.word	0x99a0052c	! t0_kref+0x2dfc:   	fsqrts	%f12, %f12
	.word	0x9fa018cc	! t0_kref+0x2e00:   	fdtos	%f12, %f15
	.word	0xee30a02c	! t0_kref+0x2e04:   	sth	%l7, [%g2 + 0x2c]
	.word	0xa1a309d0	! t0_kref+0x2e08:   	fdivd	%f12, %f16, %f16
!	.word	0x2d4f1c7b	! t0_kref+0x2e0c:   	fbg,a,pt	%fcc0, SYM(t0_subr0)
	   	fbg,a,pt	%fcc0, SYM(t0_subr0)
	.word	0x9f414000	! t0_kref+0x2e10:   	mov	%pc, %o7
	.word	0xa1b00ccc	! t0_kref+0x2e14:   	fnot2	%f12, %f16
	.word	0xa1a0012d	! t0_kref+0x2e18:   	fabss	%f13, %f16
	.word	0x93350015	! t0_kref+0x2e1c:   	srl	%l4, %l5, %o1
	.word	0xa1a018ce	! t0_kref+0x2e20:   	fdtos	%f14, %f16
	.word	0x95b385d0	! t0_kref+0x2e24:   	fcmpeq32	%f14, %f16, %o2
	.word	0xabb50116	! t0_kref+0x2e28:   	edge32	%l4, %l6, %l5
	.word	0xac34eb9e	! t0_kref+0x2e2c:   	orn	%l3, 0xb9e, %l6
	.word	0xa845ad30	! t0_kref+0x2e30:   	addc	%l6, 0xd30, %l4
	.word	0x32480007	! t0_kref+0x2e34:   	bne,a,pt	%icc, _kref+0x2e50
	.word	0x99a00530	! t0_kref+0x2e38:   	fsqrts	%f16, %f12
	.word	0x81dfc012	! t0_kref+0x2e3c:   	flush	%i7 + %l2
	.word	0x99a4084c	! t0_kref+0x2e40:   	faddd	%f16, %f12, %f12
	.word	0xa89c8012	! t0_kref+0x2e44:   	xorcc	%l2, %l2, %l4
	.word	0x9ba018d0	! t0_kref+0x2e48:   	fdtos	%f16, %f13
	.word	0x9da30850	! t0_kref+0x2e4c:   	faddd	%f12, %f16, %f14
	.word	0xaf418000	! t0_kref+0x2e50:   	mov	%fprs, %l7
	.word	0xc06e7ffe	! t0_kref+0x2e54:   	ldstub	[%i1 - 2], %g0
	.word	0xb410201a	! t0_kref+0x2e58:   	mov	0x1a, %i2
	.word	0x99a4084c	! t0_kref+0x2e5c:   	faddd	%f16, %f12, %f12
	.word	0x2b800006	! t0_kref+0x2e60:   	fbug,a	_kref+0x2e78
	.word	0xe3ee101d	! t0_kref+0x2e64:   	prefetcha	%i0 + %i5, 17
	.word	0xabb50355	! t0_kref+0x2e68:   	alignaddrl	%l4, %l5, %l5
	.word	0xd99e5a5b	! t0_kref+0x2e6c:   	ldda	[%i1 + %i3]0xd2, %f12
	.word	0xd01e4000	! t0_kref+0x2e70:   	ldd	[%i1], %o0
	.word	0xedee501c	! t0_kref+0x2e74:   	prefetcha	%i1 + %i4, 22
	.word	0x28800002	! t0_kref+0x2e78:   	bleu,a	_kref+0x2e80
	.word	0x94858013	! t0_kref+0x2e7c:   	addcc	%l6, %l3, %o2
	.word	0xe898105d	! t0_kref+0x2e80:   	ldda	[%g0 + %i5]0x82, %l4
	.word	0x9ba018d0	! t0_kref+0x2e84:   	fdtos	%f16, %f13
	.word	0x9de3bfa0	! t0_kref+0x2e88:   	save	%sp, -0x60, %sp
	.word	0xb4372815	! t0_kref+0x2e8c:   	orn	%i4, 0x815, %i2
	.word	0xabe8360f	! t0_kref+0x2e90:   	restore	%g0, -0x9f1, %l5
	.word	0x3e480007	! t0_kref+0x2e94:   	bvc,a,pt	%icc, _kref+0x2eb0
	.word	0x9334e00c	! t0_kref+0x2e98:   	srl	%l3, 0xc, %o1
	.word	0xa1b00cce	! t0_kref+0x2e9c:   	fnot2	%f14, %f16
	.word	0xec2e4000	! t0_kref+0x2ea0:   	stb	%l6, [%i1]
	.word	0xa67c8015	! t0_kref+0x2ea4:   	sdiv	%l2, %l5, %l3
	.word	0xa474c012	! t0_kref+0x2ea8:   	udiv	%l3, %l2, %l2
	.word	0x30800005	! t0_kref+0x2eac:   	ba,a	_kref+0x2ec0
	.word	0x909dc015	! t0_kref+0x2eb0:   	xorcc	%l7, %l5, %o0
	.word	0x9ba388af	! t0_kref+0x2eb4:   	fsubs	%f14, %f15, %f13
	.word	0x2a800002	! t0_kref+0x2eb8:   	bcs,a	_kref+0x2ec0
	.word	0xe8767ff8	! t0_kref+0x2ebc:   	stx	%l4, [%i1 - 8]
	.word	0xee300019	! t0_kref+0x2ec0:   	sth	%l7, [%g0 + %i1]
	.word	0x9da388d0	! t0_kref+0x2ec4:   	fsubd	%f14, %f16, %f14
	.word	0xd8fe101c	! t0_kref+0x2ec8:   	swapa	[%i0 + %i4]0x80, %o4
	.word	0x9da409ce	! t0_kref+0x2ecc:   	fdivd	%f16, %f14, %f14
	.word	0x81ac0a50	! t0_kref+0x2ed0:   	fcmpd	%fcc0, %f16, %f16
	.word	0xa5b385ce	! t0_kref+0x2ed4:   	fcmpeq32	%f14, %f14, %l2
	.word	0x8143e040	! t0_kref+0x2ed8:   	membar	0x40
	.word	0x93b4c357	! t0_kref+0x2edc:   	alignaddrl	%l3, %l7, %o1
	.word	0x99b30630	! t0_kref+0x2ee0:   	fmul8x16	%f12, %f16, %f12
	.word	0x9fa01a4c	! t0_kref+0x2ee4:   	fdtoi	%f12, %f15
	.word	0xa1a00550	! t0_kref+0x2ee8:   	fsqrtd	%f16, %f16
	.word	0xd920a038	! t0_kref+0x2eec:   	st	%f12, [%g2 + 0x38]
	.word	0x23800001	! t0_kref+0x2ef0:   	fbne,a	_kref+0x2ef4
	.word	0xee56001b	! t0_kref+0x2ef4:   	ldsh	[%i0 + %i3], %l7
	.word	0xa1a40950	! t0_kref+0x2ef8:   	fmuld	%f16, %f16, %f16
	.word	0xa7b48328	! t0_kref+0x2efc:   	bmask	%l2, %o0, %l3
	.word	0x26480001	! t0_kref+0x2f00:   	bl,a,pt	%icc, _kref+0x2f04
	.word	0xaaf4fb3c	! t0_kref+0x2f04:   	udivcc	%l3, -0x4c4, %l5
	.word	0x99a00550	! t0_kref+0x2f08:   	fsqrtd	%f16, %f12
	.word	0xae8ce041	! t0_kref+0x2f0c:   	andcc	%l3, 0x41, %l7
	.word	0x9fa4482e	! t0_kref+0x2f10:   	fadds	%f17, %f14, %f15
	.word	0x9fa0012e	! t0_kref+0x2f14:   	fabss	%f14, %f15
	.word	0x9735c013	! t0_kref+0x2f18:   	srl	%l7, %l3, %o3
	.word	0xa6b5c016	! t0_kref+0x2f1c:   	orncc	%l7, %l6, %l3
	.word	0xad2d601a	! t0_kref+0x2f20:   	sll	%l5, 0x1a, %l6
	.word	0x909c8008	! t0_kref+0x2f24:   	xorcc	%l2, %o0, %o0
	.word	0x94d5a00d	! t0_kref+0x2f28:   	umulcc	%l6, 0xd, %o2
	.word	0x81ac4ab0	! t0_kref+0x2f2c:   	fcmpes	%fcc0, %f17, %f16
	.word	0x9ba30930	! t0_kref+0x2f30:   	fmuls	%f12, %f16, %f13
	.word	0xa1a00530	! t0_kref+0x2f34:   	fsqrts	%f16, %f16
	.word	0xe6263ff0	! t0_kref+0x2f38:   	st	%l3, [%i0 - 0x10]
	.word	0xe13e3fe8	! t0_kref+0x2f3c:   	std	%f16, [%i0 - 0x18]
	.word	0xac020016	! t0_kref+0x2f40:   	add	%o0, %l6, %l6
	.word	0xa3a01a30	! t0_kref+0x2f44:   	fstoi	%f16, %f17
	.word	0xa69dc017	! t0_kref+0x2f48:   	xorcc	%l7, %l7, %l3
	.word	0x3f800004	! t0_kref+0x2f4c:   	fbo,a	_kref+0x2f5c
	.word	0x9fa4082c	! t0_kref+0x2f50:   	fadds	%f16, %f12, %f15
	.word	0xd9180019	! t0_kref+0x2f54:   	ldd	[%g0 + %i1], %f12
	.word	0xa1a30850	! t0_kref+0x2f58:   	faddd	%f12, %f16, %f16
	.word	0x9da01110	! t0_kref+0x2f5c:   	fxtod	%f16, %f14
	.word	0x3c480001	! t0_kref+0x2f60:   	bpos,a,pt	%icc, _kref+0x2f64
	.word	0xa9400000	! t0_kref+0x2f64:   	mov	%y, %l4
	.word	0xafb20052	! t0_kref+0x2f68:   	edge8l	%o0, %l2, %l7
	.word	0x35800008	! t0_kref+0x2f6c:   	fbue,a	_kref+0x2f8c
	.word	0x96f48008	! t0_kref+0x2f70:   	udivcc	%l2, %o0, %o3
	.word	0x99b306ce	! t0_kref+0x2f74:   	fmul8sux16	%f12, %f14, %f12
	.word	0x81ab8aac	! t0_kref+0x2f78:   	fcmpes	%fcc0, %f14, %f12
	.word	0x9da389d0	! t0_kref+0x2f7c:   	fdivd	%f14, %f16, %f14
	.word	0xa8820014	! t0_kref+0x2f80:   	addcc	%o0, %l4, %l4
	.word	0x25480004	! t0_kref+0x2f84:   	fblg,a,pt	%fcc0, _kref+0x2f94
	.word	0xea28a036	! t0_kref+0x2f88:   	stb	%l5, [%g2 + 0x36]
	.word	0x9da308cc	! t0_kref+0x2f8c:   	fsubd	%f12, %f12, %f14
	.word	0x99a00550	! t0_kref+0x2f90:   	fsqrtd	%f16, %f12
	.word	0x99a00131	! t0_kref+0x2f94:   	fabss	%f17, %f12
	.word	0x3c480002	! t0_kref+0x2f98:   	bpos,a,pt	%icc, _kref+0x2fa0
	.word	0x99a3884c	! t0_kref+0x2f9c:   	faddd	%f14, %f12, %f12
	.word	0x9664b41d	! t0_kref+0x2fa0:   	subc	%l2, -0xbe3, %o3
	.word	0xd66e8019	! t0_kref+0x2fa4:   	ldstub	[%i2 + %i1], %o3
	.word	0xad35c016	! t0_kref+0x2fa8:   	srl	%l7, %l6, %l6
	.word	0x2c480005	! t0_kref+0x2fac:   	bneg,a,pt	%icc, _kref+0x2fc0
	.word	0xd91e7ff8	! t0_kref+0x2fb0:   	ldd	[%i1 - 8], %f12
	.word	0x81d876fc	! t0_kref+0x2fb4:   	flush	%g1 - 0x904
	.word	0xae8d8015	! t0_kref+0x2fb8:   	andcc	%l6, %l5, %l7
	.word	0x9da0054c	! t0_kref+0x2fbc:   	fsqrtd	%f12, %f14
	.word	0x99a4094e	! t0_kref+0x2fc0:   	fmuld	%f16, %f14, %f12
	.word	0xeb68a006	! t0_kref+0x2fc4:   	prefetch	%g2 + 6, 21
	.word	0xe428a036	! t0_kref+0x2fc8:   	stb	%l2, [%g2 + 0x36]
	.word	0x2e800006	! t0_kref+0x2fcc:   	bvs,a	_kref+0x2fe4
	.word	0xa3b30a2d	! t0_kref+0x2fd0:   	fpadd16s	%f12, %f13, %f17
	.word	0xaa0a338a	! t0_kref+0x2fd4:   	and	%o0, -0xc76, %l5
	.word	0xd9be1a1a	! t0_kref+0x2fd8:   	stda	%f12, [%i0 + %i2]0xd0
	.word	0x94650015	! t0_kref+0x2fdc:   	subc	%l4, %l5, %o2
	.word	0xa740c000	! t0_kref+0x2fe0:   	mov	%asi, %l3
	.word	0xacfd8014	! t0_kref+0x2fe4:   	sdivcc	%l6, %l4, %l6
	.word	0xa3a0052c	! t0_kref+0x2fe8:   	fsqrts	%f12, %f17
	.word	0xe07f0018	! t0_kref+0x2fec:   	swap	[%i4 + %i0], %l0
	.word	0x99a00030	! t0_kref+0x2ff0:   	fmovs	%f16, %f12
	.word	0x3b480003	! t0_kref+0x2ff4:   	fble,a,pt	%fcc0, _kref+0x3000
	.word	0xa3a01a4e	! t0_kref+0x2ff8:   	fdtoi	%f14, %f17
	.word	0x9615c016	! t0_kref+0x2ffc:   	or	%l7, %l6, %o3
	.word	0xd020a038	! t0_kref+0x3000:   	st	%o0, [%g2 + 0x38]
	.word	0x9075fd19	! t0_kref+0x3004:   	udiv	%l7, -0x2e7, %o0
	.word	0xae354016	! t0_kref+0x3008:   	orn	%l5, %l6, %l7
	.word	0xea28a010	! t0_kref+0x300c:   	stb	%l5, [%g2 + 0x10]
	.word	0x93320015	! t0_kref+0x3010:   	srl	%o0, %l5, %o1
	.word	0x9fa00530	! t0_kref+0x3014:   	fsqrts	%f16, %f15
	.word	0xa1a0052e	! t0_kref+0x3018:   	fsqrts	%f14, %f16
	.word	0x22800004	! t0_kref+0x301c:   	be,a	_kref+0x302c
	.word	0xa7b5c174	! t0_kref+0x3020:   	edge32ln	%l7, %l4, %l3
	.word	0x912dc008	! t0_kref+0x3024:   	sll	%l7, %o0, %o0
	.word	0x9204c017	! t0_kref+0x3028:   	add	%l3, %l7, %o1
	.word	0x9da40850	! t0_kref+0x302c:   	faddd	%f16, %f16, %f14
	.word	0x2f07732b	! t0_kref+0x3030:   	sethi	%hi(0x1dccac00), %l7
	.word	0xa3a308ac	! t0_kref+0x3034:   	fsubs	%f12, %f12, %f17
	.word	0xd65f4019	! t0_kref+0x3038:   	ldx	[%i5 + %i1], %o3
	.word	0xa73ca00e	! t0_kref+0x303c:   	sra	%l2, 0xe, %l3
	.word	0x9ba00530	! t0_kref+0x3040:   	fsqrts	%f16, %f13
	.word	0x24800001	! t0_kref+0x3044:   	ble,a	_kref+0x3048
	.word	0xa88df78d	! t0_kref+0x3048:   	andcc	%l7, -0x873, %l4
	.word	0xa1a30830	! t0_kref+0x304c:   	fadds	%f12, %f16, %f16
	.word	0x94acea00	! t0_kref+0x3050:   	andncc	%l3, 0xa00, %o2
	.word	0x3e480004	! t0_kref+0x3054:   	bvc,a,pt	%icc, _kref+0x3064
	.word	0x9da408cc	! t0_kref+0x3058:   	fsubd	%f16, %f12, %f14
	.word	0xfd6e7fe8	! t0_kref+0x305c:   	prefetch	%i1 - 0x18, 30
	.word	0x91b58115	! t0_kref+0x3060:   	edge32	%l6, %l5, %o0
	.word	0x9de3bfa0	! t0_kref+0x3064:   	save	%sp, -0x60, %sp
	.word	0x93ef001d	! t0_kref+0x3068:   	restore	%i4, %i5, %o1
	.word	0x9ba0012e	! t0_kref+0x306c:   	fabss	%f14, %f13
	.word	0x2c800003	! t0_kref+0x3070:   	bneg,a	_kref+0x307c
	.word	0x252adb0c	! t0_kref+0x3074:   	sethi	%hi(0xab6c3000), %l2
	.word	0xfdee101c	! t0_kref+0x3078:   	prefetcha	%i0 + %i4, 30
	.word	0xe62e600c	! t0_kref+0x307c:   	stb	%l3, [%i1 + 0xc]
	.word	0xa1a409cc	! t0_kref+0x3080:   	fdivd	%f16, %f12, %f16
	.word	0xa6253d9f	! t0_kref+0x3084:   	sub	%l4, -0x261, %l3
	.word	0x90fcb548	! t0_kref+0x3088:   	sdivcc	%l2, -0xab8, %o0
	.word	0x9fa018ce	! t0_kref+0x308c:   	fdtos	%f14, %f15
	.word	0xe430a01e	! t0_kref+0x3090:   	sth	%l2, [%g2 + 0x1e]
	.word	0x9da0052d	! t0_kref+0x3094:   	fsqrts	%f13, %f14
	.word	0x2b800004	! t0_kref+0x3098:   	fbug,a	_kref+0x30a8
	.word	0xf83e4000	! t0_kref+0x309c:   	std	%i4, [%i1]
	.word	0x99b3caac	! t0_kref+0x30a0:   	fpsub16s	%f15, %f12, %f12
	.word	0xa92ca017	! t0_kref+0x30a4:   	sll	%l2, 0x17, %l4
	.word	0x99b30a70	! t0_kref+0x30a8:   	fpadd32s	%f12, %f16, %f12
	.word	0x9db00cf0	! t0_kref+0x30ac:   	fnot2s	%f16, %f14
	.word	0xdd063ff8	! t0_kref+0x30b0:   	ld	[%i0 - 8], %f14
	.word	0xdd20a030	! t0_kref+0x30b4:   	st	%f14, [%g2 + 0x30]
	.word	0x94850012	! t0_kref+0x30b8:   	addcc	%l4, %l2, %o2
	.word	0xa1a348b1	! t0_kref+0x30bc:   	fsubs	%f13, %f17, %f16
	.word	0x91b54355	! t0_kref+0x30c0:   	alignaddrl	%l5, %l5, %o0
	.word	0xee2e7ff8	! t0_kref+0x30c4:   	stb	%l7, [%i1 - 8]
	.word	0xa88d0016	! t0_kref+0x30c8:   	andcc	%l4, %l6, %l4
	.word	0xdf20a004	! t0_kref+0x30cc:   	st	%f15, [%g2 + 4]
	.word	0x3a800006	! t0_kref+0x30d0:   	bcc,a	_kref+0x30e8
	.word	0xa934a007	! t0_kref+0x30d4:   	srl	%l2, 0x7, %l4
	.word	0x2b26912c	! t0_kref+0x30d8:   	sethi	%hi(0x9a44b000), %l5
	.word	0xa6ac8013	! t0_kref+0x30dc:   	andncc	%l2, %l3, %l3
	.word	0x9da0054e	! t0_kref+0x30e0:   	fsqrtd	%f14, %f14
	.word	0xa1b44a6c	! t0_kref+0x30e4:   	fpadd32s	%f17, %f12, %f16
	.word	0xa4fd79af	! t0_kref+0x30e8:   	sdivcc	%l5, -0x651, %l2
	.word	0xa1b386b0	! t0_kref+0x30ec:   	fmul8x16al	%f14, %f16, %f16
	.word	0x97b5c115	! t0_kref+0x30f0:   	edge32	%l7, %l5, %o3
	.word	0xdf070018	! t0_kref+0x30f4:   	ld	[%i4 + %i0], %f15
	.word	0x99a308b1	! t0_kref+0x30f8:   	fsubs	%f12, %f17, %f12
	.word	0x96fd8017	! t0_kref+0x30fc:   	sdivcc	%l6, %l7, %o3
	.word	0x30800002	! t0_kref+0x3100:   	ba,a	_kref+0x3108
	.word	0xaa5ce668	! t0_kref+0x3104:   	smul	%l3, 0x668, %l5
	.word	0x9da0054c	! t0_kref+0x3108:   	fsqrtd	%f12, %f14
	.word	0xe820a028	! t0_kref+0x310c:   	st	%l4, [%g2 + 0x28]
	.word	0xa1b00cd0	! t0_kref+0x3110:   	fnot2	%f16, %f16
	.word	0x9da0054c	! t0_kref+0x3114:   	fsqrtd	%f12, %f14
	.word	0xa7b58116	! t0_kref+0x3118:   	edge32	%l6, %l6, %l3
	.word	0xef6e001d	! t0_kref+0x311c:   	prefetch	%i0 + %i5, 23
	.word	0x9da0192c	! t0_kref+0x3120:   	fstod	%f12, %f14
	.word	0x95b384d0	! t0_kref+0x3124:   	fcmpne32	%f14, %f16, %o2
	.word	0xec86101c	! t0_kref+0x3128:   	lda	[%i0 + %i4]0x80, %l6
	.word	0xd020a030	! t0_kref+0x312c:   	st	%o0, [%g2 + 0x30]
	.word	0xa9b384ce	! t0_kref+0x3130:   	fcmpne32	%f14, %f14, %l4
	.word	0x921573e1	! t0_kref+0x3134:   	or	%l5, -0xc1f, %o1
	.word	0xa9400000	! t0_kref+0x3138:   	mov	%y, %l4
	.word	0x99a4492f	! t0_kref+0x313c:   	fmuls	%f17, %f15, %f12
	.word	0xd9064000	! t0_kref+0x3140:   	ld	[%i1], %f12
	.word	0xa3a00031	! t0_kref+0x3144:   	fmovs	%f17, %f17
	.word	0xda6e2011	! t0_kref+0x3148:   	ldstub	[%i0 + 0x11], %o5
	.word	0x8143c000	! t0_kref+0x314c:   	stbar
	.word	0x292e44c5	! t0_kref+0x3150:   	sethi	%hi(0xb9131400), %l4
	.word	0xe120a030	! t0_kref+0x3154:   	st	%f16, [%g2 + 0x30]
	.word	0x9db0076c	! t0_kref+0x3158:   	fpack16	%f12, %f14
	.word	0x8143e07e	! t0_kref+0x315c:   	membar	0x7e
	.word	0x25800005	! t0_kref+0x3160:   	fblg,a	_kref+0x3174
	.word	0x99a309d0	! t0_kref+0x3164:   	fdivd	%f12, %f16, %f12
	.word	0xa465ba77	! t0_kref+0x3168:   	subc	%l6, -0x589, %l2
	.word	0xe36e6008	! t0_kref+0x316c:   	prefetch	%i1 + 8, 17
	.word	0xa1a408ce	! t0_kref+0x3170:   	fsubd	%f16, %f14, %f16
	.word	0x9da0192d	! t0_kref+0x3174:   	fstod	%f13, %f14
	.word	0xe3b8a040	! t0_kref+0x3178:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9ba0012c	! t0_kref+0x317c:   	fabss	%f12, %f13
	.word	0xa5b4054e	! t0_kref+0x3180:   	fcmpeq16	%f16, %f14, %l2
	.word	0x9fc00004	! t0_kref+0x3184:   	call	%g0 + %g4
	.word	0xee2e7ff3	! t0_kref+0x3188:   	stb	%l7, [%i1 - 0xd]
	.word	0x9de3bfa0	! t0_kref+0x318c:   	save	%sp, -0x60, %sp
	.word	0xb2e6e7e0	! t0_kref+0x3190:   	subccc	%i3, 0x7e0, %i1
	.word	0xa9ee001c	! t0_kref+0x3194:   	restore	%i0, %i4, %l4
	.word	0xa3a3092e	! t0_kref+0x3198:   	fmuls	%f12, %f14, %f17
	.word	0xea00a034	! t0_kref+0x319c:   	ld	[%g2 + 0x34], %l5
	.word	0x86102001	! t0_kref+0x31a0:   	mov	0x1, %g3
	.word	0x32800000	! t0_kref+0x31a4:   	bne,a	_kref+0x31a4
	.word	0x86a0e001	! t0_kref+0x31a8:   	subcc	%g3, 1, %g3
	.word	0x81ab4aaf	! t0_kref+0x31ac:   	fcmpes	%fcc0, %f13, %f15
	.word	0xae84a000	! t0_kref+0x31b0:   	addcc	%l2, 0, %l7
	.word	0x9db38750	! t0_kref+0x31b4:   	fpack32	%f14, %f16, %f14
	.word	0x9da3082f	! t0_kref+0x31b8:   	fadds	%f12, %f15, %f14
	.word	0x9da3c9ae	! t0_kref+0x31bc:   	fdivs	%f15, %f14, %f14
	.word	0xa3a0012e	! t0_kref+0x31c0:   	fabss	%f14, %f17
	.word	0x26480007	! t0_kref+0x31c4:   	bl,a,pt	%icc, _kref+0x31e0
	.word	0x9fa00031	! t0_kref+0x31c8:   	fmovs	%f17, %f15
	.word	0x925dc012	! t0_kref+0x31cc:   	smul	%l7, %l2, %o1
	.word	0xa43ce46a	! t0_kref+0x31d0:   	xnor	%l3, 0x46a, %l2
	.word	0xa435c016	! t0_kref+0x31d4:   	orn	%l7, %l6, %l2
	.word	0x90fcc015	! t0_kref+0x31d8:   	sdivcc	%l3, %l5, %o0
	.word	0x99b30ace	! t0_kref+0x31dc:   	fpsub32	%f12, %f14, %f12
	.word	0x99a0052c	! t0_kref+0x31e0:   	fsqrts	%f12, %f12
	.word	0xe300a03c	! t0_kref+0x31e4:   	ld	[%g2 + 0x3c], %f17
	.word	0xa61cad62	! t0_kref+0x31e8:   	xor	%l2, 0xd62, %l3
	.word	0x81dfc00f	! t0_kref+0x31ec:   	flush	%i7 + %o7
	.word	0xec20a014	! t0_kref+0x31f0:   	st	%l6, [%g2 + 0x14]
	.word	0x9140c000	! t0_kref+0x31f4:   	mov	%asi, %o0
	.word	0xa1a3894e	! t0_kref+0x31f8:   	fmuld	%f14, %f14, %f16
	.word	0xac54c015	! t0_kref+0x31fc:   	umul	%l3, %l5, %l6
	.word	0xeb68a047	! t0_kref+0x3200:   	prefetch	%g2 + 0x47, 21
	.word	0xdd20a02c	! t0_kref+0x3204:   	st	%f14, [%g2 + 0x2c]
	.word	0xea262000	! t0_kref+0x3208:   	st	%l5, [%i0]
	.word	0xe11e3fe8	! t0_kref+0x320c:   	ldd	[%i0 - 0x18], %f16
	.word	0xd02e8018	! t0_kref+0x3210:   	stb	%o0, [%i2 + %i0]
	.word	0xa8950012	! t0_kref+0x3214:   	orcc	%l4, %l2, %l4
	.word	0xac650008	! t0_kref+0x3218:   	subc	%l4, %o0, %l6
	.word	0xea30a038	! t0_kref+0x321c:   	sth	%l5, [%g2 + 0x38]
	.word	0x24800003	! t0_kref+0x3220:   	ble,a	_kref+0x322c
	.word	0x9405a9cd	! t0_kref+0x3224:   	add	%l6, 0x9cd, %o2
	.word	0x92ad0008	! t0_kref+0x3228:   	andncc	%l4, %o0, %o1
	.word	0x29800004	! t0_kref+0x322c:   	fbl,a	_kref+0x323c
	.word	0xac953141	! t0_kref+0x3230:   	orcc	%l4, -0xebf, %l6
	.word	0xa3b40aae	! t0_kref+0x3234:   	fpsub16s	%f16, %f14, %f17
	.word	0x37480002	! t0_kref+0x3238:   	fbge,a,pt	%fcc0, _kref+0x3240
	.word	0xa1a0052e	! t0_kref+0x323c:   	fsqrts	%f14, %f16
	.word	0x8143e071	! t0_kref+0x3240:   	membar	0x71
	.word	0x81dfaba5	! t0_kref+0x3244:   	flush	%fp + 0xba5
	.word	0x9de3bfa0	! t0_kref+0x3248:   	save	%sp, -0x60, %sp
	.word	0x91ee31c4	! t0_kref+0x324c:   	restore	%i0, -0xe3c, %o0
	.word	0x95400000	! t0_kref+0x3250:   	mov	%y, %o2
	.word	0xee20a000	! t0_kref+0x3254:   	st	%l7, [%g2]
	.word	0x905d756c	! t0_kref+0x3258:   	smul	%l5, -0xa94, %o0
	.word	0x99b30e80	! t0_kref+0x325c:   	fsrc1	%f12, %f12
	.word	0xdd20a004	! t0_kref+0x3260:   	st	%f14, [%g2 + 4]
	.word	0x99a4492c	! t0_kref+0x3264:   	fmuls	%f17, %f12, %f12
	.word	0x9de3bfa0	! t0_kref+0x3268:   	save	%sp, -0x60, %sp
	.word	0x97ee0018	! t0_kref+0x326c:   	restore	%i0, %i0, %o3
	.word	0xaa5d8012	! t0_kref+0x3270:   	smul	%l6, %l2, %l5
	.word	0x99a309ce	! t0_kref+0x3274:   	fdivd	%f12, %f14, %f12
	.word	0xa4fdaad0	! t0_kref+0x3278:   	sdivcc	%l6, 0xad0, %l2
	.word	0xa49dc015	! t0_kref+0x327c:   	xorcc	%l7, %l5, %l2
	.word	0x9da0104c	! t0_kref+0x3280:   	fdtox	%f12, %f14
	.word	0x97358016	! t0_kref+0x3284:   	srl	%l6, %l6, %o3
	.word	0xe88e1000	! t0_kref+0x3288:   	lduba	[%i0]0x80, %l4
	.word	0xe76e6010	! t0_kref+0x328c:   	prefetch	%i1 + 0x10, 19
	.word	0x9ba018cc	! t0_kref+0x3290:   	fdtos	%f12, %f13
	.word	0x9da30850	! t0_kref+0x3294:   	faddd	%f12, %f16, %f14
	.word	0x81de709d	! t0_kref+0x3298:   	flush	%i1 - 0xf63
	.word	0xe3b8a040	! t0_kref+0x329c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9ba3c82e	! t0_kref+0x32a0:   	fadds	%f15, %f14, %f13
	.word	0xa1b30c8e	! t0_kref+0x32a4:   	fandnot2	%f12, %f14, %f16
	.word	0xe4363fe2	! t0_kref+0x32a8:   	sth	%l2, [%i0 - 0x1e]
	.word	0x9ba3c9af	! t0_kref+0x32ac:   	fdivs	%f15, %f15, %f13
	.word	0x86102019	! t0_kref+0x32b0:   	mov	0x19, %g3
	.word	0x86a0e001	! t0_kref+0x32b4:   	subcc	%g3, 1, %g3
	.word	0x22800010	! t0_kref+0x32b8:   	be,a	_kref+0x32f8
	.word	0x9da38850	! t0_kref+0x32bc:   	faddd	%f14, %f16, %f14
	.word	0x9340c000	! t0_kref+0x32c0:   	mov	%asi, %o1
	.word	0x95b4044c	! t0_kref+0x32c4:   	fcmpne16	%f16, %f12, %o2
	.word	0x2f4ffffb	! t0_kref+0x32c8:   	fbu,a,pt	%fcc0, _kref+0x32b4
	.word	0x9da448b0	! t0_kref+0x32cc:   	fsubs	%f17, %f16, %f14
	.word	0xe3ee501d	! t0_kref+0x32d0:   	prefetcha	%i1 + %i5, 17
	.word	0x9fa3892e	! t0_kref+0x32d4:   	fmuls	%f14, %f14, %f15
	.word	0x38bffff7	! t0_kref+0x32d8:   	bgu,a	_kref+0x32b4
	.word	0x9635b413	! t0_kref+0x32dc:   	orn	%l6, -0xbed, %o3
	.word	0x9ba01a30	! t0_kref+0x32e0:   	fstoi	%f16, %f13
	.word	0xd93e0000	! t0_kref+0x32e4:   	std	%f12, [%i0]
	.word	0x972da00c	! t0_kref+0x32e8:   	sll	%l6, 0xc, %o3
	.word	0x91b5c356	! t0_kref+0x32ec:   	alignaddrl	%l7, %l6, %o0
	.word	0xd27e3fe0	! t0_kref+0x32f0:   	swap	[%i0 - 0x20], %o1
	.word	0x2c800002	! t0_kref+0x32f4:   	bneg,a	_kref+0x32fc
	.word	0xec26401c	! t0_kref+0x32f8:   	st	%l6, [%i1 + %i4]
	.word	0xe1b81019	! t0_kref+0x32fc:   	stda	%f16, [%g0 + %i1]0x80
	.word	0x9da00530	! t0_kref+0x3300:   	fsqrts	%f16, %f14
	.word	0xa8fa0012	! t0_kref+0x3304:   	sdivcc	%o0, %l2, %l4
	.word	0xac058014	! t0_kref+0x3308:   	add	%l6, %l4, %l6
	.word	0x25800006	! t0_kref+0x330c:   	fblg,a	_kref+0x3324
	.word	0x9da388cc	! t0_kref+0x3310:   	fsubd	%f14, %f12, %f14
	.word	0x9fa018cc	! t0_kref+0x3314:   	fdtos	%f12, %f15
	.word	0x99b38671	! t0_kref+0x3318:   	fmul8x16au	%f14, %f17, %f12
	.word	0x2d800006	! t0_kref+0x331c:   	fbg,a	_kref+0x3334
	.word	0xf43e3ff8	! t0_kref+0x3320:   	std	%i2, [%i0 - 8]
	.word	0xad652454	! t0_kref+0x3324:   	movleu	%icc, -0x3ac, %l6
	.word	0xef68a085	! t0_kref+0x3328:   	prefetch	%g2 + 0x85, 23
	.word	0xc368a00f	! t0_kref+0x332c:   	prefetch	%g2 + 0xf, 1
	.word	0xc1ee5013	! t0_kref+0x3330:   	prefetcha	%i1 + %l3, 0
	.word	0xa7400000	! t0_kref+0x3334:   	mov	%y, %l3
	.word	0xac9d4008	! t0_kref+0x3338:   	xorcc	%l5, %o0, %l6
	.word	0xaa8c8008	! t0_kref+0x333c:   	andcc	%l2, %o0, %l5
	.word	0xa3a0012e	! t0_kref+0x3340:   	fabss	%f14, %f17
	.word	0x9fa0012f	! t0_kref+0x3344:   	fabss	%f15, %f15
	.word	0xab400000	! t0_kref+0x3348:   	mov	%y, %l5
	.word	0xa1b40a10	! t0_kref+0x334c:   	fpadd16	%f16, %f16, %f16
	.word	0x9ba389ac	! t0_kref+0x3350:   	fdivs	%f14, %f12, %f13
	.word	0xaafc8013	! t0_kref+0x3354:   	sdivcc	%l2, %l3, %l5
	.word	0x99a8404c	! t0_kref+0x3358:   	fmovdne	%fcc0, %f12, %f12
	.word	0x3a800008	! t0_kref+0x335c:   	bcc,a	_kref+0x337c
	.word	0xa1a00530	! t0_kref+0x3360:   	fsqrts	%f16, %f16
	.word	0xaafd0012	! t0_kref+0x3364:   	sdivcc	%l4, %l2, %l5
	.word	0x97120014	! t0_kref+0x3368:   	taddcctv	%o0, %l4, %o3
	.word	0xe11e2000	! t0_kref+0x336c:   	ldd	[%i0], %f16
	.word	0x93418000	! t0_kref+0x3370:   	mov	%fprs, %o1
	.word	0xe320a028	! t0_kref+0x3374:   	st	%f17, [%g2 + 0x28]
	.word	0xec2e401a	! t0_kref+0x3378:   	stb	%l6, [%i1 + %i2]
	.word	0x969d6f89	! t0_kref+0x337c:   	xorcc	%l5, 0xf89, %o3
	.word	0xc568a003	! t0_kref+0x3380:   	prefetch	%g2 + 3, 2
	.word	0xdb20a014	! t0_kref+0x3384:   	st	%f13, [%g2 + 0x14]
	.word	0xa4454013	! t0_kref+0x3388:   	addc	%l5, %l3, %l2
	.word	0xc568a044	! t0_kref+0x338c:   	prefetch	%g2 + 0x44, 2
	.word	0x99a0054c	! t0_kref+0x3390:   	fsqrtd	%f12, %f12
	.word	0x91250016	! t0_kref+0x3394:   	mulscc	%l4, %l6, %o0
	.word	0x951561cb	! t0_kref+0x3398:   	taddcctv	%l5, 0x1cb, %o2
	.word	0x99b30990	! t0_kref+0x339c:   	bshuffle	%f12, %f16, %f12
	.word	0x9ba389b0	! t0_kref+0x33a0:   	fdivs	%f14, %f16, %f13
	.word	0x9db38d10	! t0_kref+0x33a4:   	fandnot1	%f14, %f16, %f14
	.word	0xec2e001a	! t0_kref+0x33a8:   	stb	%l6, [%i0 + %i2]
	.word	0x9134c008	! t0_kref+0x33ac:   	srl	%l3, %o0, %o0
	.word	0x93b385cc	! t0_kref+0x33b0:   	fcmpeq32	%f14, %f12, %o1
	.word	0x36480007	! t0_kref+0x33b4:   	bge,a,pt	%icc, _kref+0x33d0
	.word	0x99b40e80	! t0_kref+0x33b8:   	fsrc1	%f16, %f12
	.word	0xea6e401a	! t0_kref+0x33bc:   	ldstub	[%i1 + %i2], %l5
	.word	0x99b00770	! t0_kref+0x33c0:   	fpack16	%f16, %f12
	.word	0xe1070019	! t0_kref+0x33c4:   	ld	[%i4 + %i1], %f16
	.word	0x9da00550	! t0_kref+0x33c8:   	fsqrtd	%f16, %f14
	.word	0xd248a024	! t0_kref+0x33cc:   	ldsb	[%g2 + 0x24], %o1
	.word	0x93b4c014	! t0_kref+0x33d0:   	edge8	%l3, %l4, %o1
	.word	0xddbe1000	! t0_kref+0x33d4:   	stda	%f14, [%i0]0x80
	.word	0xea2e3feb	! t0_kref+0x33d8:   	stb	%l5, [%i0 - 0x15]
	.word	0xa3a409b1	! t0_kref+0x33dc:   	fdivs	%f16, %f17, %f17
	.word	0x9da30950	! t0_kref+0x33e0:   	fmuld	%f12, %f16, %f14
	.word	0xac9d0017	! t0_kref+0x33e4:   	xorcc	%l4, %l7, %l6
	.word	0xac358017	! t0_kref+0x33e8:   	orn	%l6, %l7, %l6
	.word	0xa1a0054e	! t0_kref+0x33ec:   	fsqrtd	%f14, %f16
	.word	0x81dc7939	! t0_kref+0x33f0:   	flush	%l1 - 0x6c7
	.word	0xe62e401a	! t0_kref+0x33f4:   	stb	%l3, [%i1 + %i2]
	.word	0xc768a089	! t0_kref+0x33f8:   	prefetch	%g2 + 0x89, 3
	.word	0x965cb6a2	! t0_kref+0x33fc:   	smul	%l2, -0x95e, %o3
	.word	0xab34a00f	! t0_kref+0x3400:   	srl	%l2, 0xf, %l5
	.word	0x99a0052d	! t0_kref+0x3404:   	fsqrts	%f13, %f12
	.word	0x8143c000	! t0_kref+0x3408:   	stbar
	.word	0x2725947b	! t0_kref+0x340c:   	sethi	%hi(0x9651ec00), %l3
	.word	0xaabd629a	! t0_kref+0x3410:   	xnorcc	%l5, 0x29a, %l5
	.word	0x965a3e85	! t0_kref+0x3414:   	smul	%o0, -0x17b, %o3
	.word	0xafb5c356	! t0_kref+0x3418:   	alignaddrl	%l7, %l6, %l7
	.word	0xee0e6019	! t0_kref+0x341c:   	ldub	[%i1 + 0x19], %l7
	.word	0x26800004	! t0_kref+0x3420:   	bl,a	_kref+0x3430
	.word	0xdd3e2008	! t0_kref+0x3424:   	std	%f14, [%i0 + 8]
	.word	0x8143c000	! t0_kref+0x3428:   	stbar
	.word	0xe1871018	! t0_kref+0x342c:   	lda	[%i4 + %i0]0x80, %f16
	.word	0xa1a0052c	! t0_kref+0x3430:   	fsqrts	%f12, %f16
	.word	0x9fa018ce	! t0_kref+0x3434:   	fdtos	%f14, %f15
	.word	0x9fa01a50	! t0_kref+0x3438:   	fdtoi	%f16, %f15
	.word	0xa3a01a31	! t0_kref+0x343c:   	fstoi	%f17, %f17
	.word	0x963d8012	! t0_kref+0x3440:   	xnor	%l6, %l2, %o3
	.word	0x3c800004	! t0_kref+0x3444:   	bpos,a	_kref+0x3454
	.word	0xa1b00fe0	! t0_kref+0x3448:   	fones	%f16
	.word	0x9da3092d	! t0_kref+0x344c:   	fmuls	%f12, %f13, %f14
	.word	0x29800002	! t0_kref+0x3450:   	fbl,a	_kref+0x3458
	.word	0xa1a00550	! t0_kref+0x3454:   	fsqrtd	%f16, %f16
	.word	0x9da3c8b0	! t0_kref+0x3458:   	fsubs	%f15, %f16, %f14
	.word	0x30800005	! t0_kref+0x345c:   	ba,a	_kref+0x3470
	.word	0x99a0002d	! t0_kref+0x3460:   	fmovs	%f13, %f12
	.word	0xa1a40850	! t0_kref+0x3464:   	faddd	%f16, %f16, %f16
	.word	0x2e800003	! t0_kref+0x3468:   	bvs,a	_kref+0x3474
	.word	0x92b4c015	! t0_kref+0x346c:   	orncc	%l3, %l5, %o1
	.word	0x94ade802	! t0_kref+0x3470:   	andncc	%l7, 0x802, %o2
	.word	0xe3b8a040	! t0_kref+0x3474:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9684f363	! t0_kref+0x3478:   	addcc	%l3, -0xc9d, %o3
	.word	0xa3a3082d	! t0_kref+0x347c:   	fadds	%f12, %f13, %f17
	.word	0xa6256feb	! t0_kref+0x3480:   	sub	%l5, 0xfeb, %l3
	.word	0xe828a01b	! t0_kref+0x3484:   	stb	%l4, [%g2 + 0x1b]
	.word	0xa1b00cce	! t0_kref+0x3488:   	fnot2	%f14, %f16
	.word	0xdd981019	! t0_kref+0x348c:   	ldda	[%g0 + %i1]0x80, %f14
	.word	0xac8a2de2	! t0_kref+0x3490:   	andcc	%o0, 0xde2, %l6
	.word	0xd83e7ff8	! t0_kref+0x3494:   	std	%o4, [%i1 - 8]
	.word	0x97400000	! t0_kref+0x3498:   	mov	%y, %o3
	.word	0xe6680019	! t0_kref+0x349c:   	ldstub	[%g0 + %i1], %l3
	.word	0xe13f4019	! t0_kref+0x34a0:   	std	%f16, [%i5 + %i1]
	.word	0x9da0054e	! t0_kref+0x34a4:   	fsqrtd	%f14, %f14
	.word	0xaa8daddd	! t0_kref+0x34a8:   	andcc	%l6, 0xddd, %l5
	.word	0x13149039	! t0_kref+0x34ac:   	sethi	%hi(0x5240e400), %o1
	.word	0xc16e2018	! t0_kref+0x34b0:   	prefetch	%i0 + 0x18, 0
	.word	0xac9cefb9	! t0_kref+0x34b4:   	xorcc	%l3, 0xfb9, %l6
	.word	0xa684c008	! t0_kref+0x34b8:   	addcc	%l3, %o0, %l3
	.word	0x9da38850	! t0_kref+0x34bc:   	faddd	%f14, %f16, %f14
	.word	0x99a4094e	! t0_kref+0x34c0:   	fmuld	%f16, %f14, %f12
	.word	0x94653f25	! t0_kref+0x34c4:   	subc	%l4, -0xdb, %o2
	.word	0xa845fcd6	! t0_kref+0x34c8:   	addc	%l7, -0x32a, %l4
	.word	0xa3a349b1	! t0_kref+0x34cc:   	fdivs	%f13, %f17, %f17
	.word	0xa464f4a6	! t0_kref+0x34d0:   	subc	%l3, -0xb5a, %l2
	.word	0xd66e201d	! t0_kref+0x34d4:   	ldstub	[%i0 + 0x1d], %o3
	.word	0x99b38a4c	! t0_kref+0x34d8:   	fpadd32	%f14, %f12, %f12
	.word	0x27800007	! t0_kref+0x34dc:   	fbul,a	_kref+0x34f8
	.word	0xa465f77e	! t0_kref+0x34e0:   	subc	%l7, -0x882, %l2
	.word	0x99a00550	! t0_kref+0x34e4:   	fsqrtd	%f16, %f12
	.word	0xa1a4084e	! t0_kref+0x34e8:   	faddd	%f16, %f14, %f16
	.word	0x99a389cc	! t0_kref+0x34ec:   	fdivd	%f14, %f12, %f12
	.word	0xf007bfe0	! t0_kref+0x34f0:   	ld	[%fp - 0x20], %i0
	.word	0x32800003	! t0_kref+0x34f4:   	bne,a	_kref+0x3500
	.word	0x8184c000	! t0_kref+0x34f8:   	wr	%l3, %g0, %y
	.word	0xee08a002	! t0_kref+0x34fc:   	ldub	[%g2 + 2], %l7
	.word	0xd028a028	! t0_kref+0x3500:   	stb	%o0, [%g2 + 0x28]
	.word	0x2a800001	! t0_kref+0x3504:   	bcs,a	_kref+0x3508
	.word	0x9ba348af	! t0_kref+0x3508:   	fsubs	%f13, %f15, %f13
	.word	0x9da44831	! t0_kref+0x350c:   	fadds	%f17, %f17, %f14
	.word	0x9da0054e	! t0_kref+0x3510:   	fsqrtd	%f14, %f14
	.word	0xd9264000	! t0_kref+0x3514:   	st	%f12, [%i1]
	.word	0xeeb01019	! t0_kref+0x3518:   	stha	%l7, [%g0 + %i1]0x80
	.word	0x30480006	! t0_kref+0x351c:   	ba,a,pt	%icc, _kref+0x3534
	.word	0x927d2c3d	! t0_kref+0x3520:   	sdiv	%l4, 0xc3d, %o1
	.word	0xe826200c	! t0_kref+0x3524:   	st	%l4, [%i0 + 0xc]
	.word	0x9fa000ad	! t0_kref+0x3528:   	fnegs	%f13, %f15
	.word	0x22800005	! t0_kref+0x352c:   	be,a	_kref+0x3540
	.word	0xe856200a	! t0_kref+0x3530:   	ldsh	[%i0 + 0xa], %l4
	.word	0xafb5c168	! t0_kref+0x3534:   	edge32ln	%l7, %o0, %l7
	.word	0xa43d3dc4	! t0_kref+0x3538:   	xnor	%l4, -0x23c, %l2
	.word	0x9db30d0e	! t0_kref+0x353c:   	fandnot1	%f12, %f14, %f14
	.word	0xe01f4018	! t0_kref+0x3540:   	ldd	[%i5 + %i0], %l0
	.word	0x9fa0002e	! t0_kref+0x3544:   	fmovs	%f14, %f15
	.word	0x9ba00030	! t0_kref+0x3548:   	fmovs	%f16, %f13
	.word	0x99b34eed	! t0_kref+0x354c:   	fornot2s	%f13, %f13, %f12
	.word	0xac8de04c	! t0_kref+0x3550:   	andcc	%l7, 0x4c, %l6
	.word	0x8143c000	! t0_kref+0x3554:   	stbar
	.word	0x9de3bfa0	! t0_kref+0x3558:   	save	%sp, -0x60, %sp
	.word	0xafe80000	! t0_kref+0x355c:   	restore	%g0, %g0, %l7
	.word	0xa89db289	! t0_kref+0x3560:   	xorcc	%l6, -0xd77, %l4
	.word	0xedee501b	! t0_kref+0x3564:   	prefetcha	%i1 + %i3, 22
	.word	0xa4ade151	! t0_kref+0x3568:   	andncc	%l7, 0x151, %l2
	.word	0x9094e816	! t0_kref+0x356c:   	orcc	%l3, 0x816, %o0
	.word	0xac6223a2	! t0_kref+0x3570:   	subc	%o0, 0x3a2, %l6
	.word	0x9fa0002c	! t0_kref+0x3574:   	fmovs	%f12, %f15
	.word	0xe1ee501d	! t0_kref+0x3578:   	prefetcha	%i1 + %i5, 16
	.word	0x9db00cd0	! t0_kref+0x357c:   	fnot2	%f16, %f14
	.word	0x9bb30ef1	! t0_kref+0x3580:   	fornot2s	%f12, %f17, %f13
	.word	0xa4b5c013	! t0_kref+0x3584:   	orncc	%l7, %l3, %l2
	.word	0xab2a0012	! t0_kref+0x3588:   	sll	%o0, %l2, %l5
	.word	0x2e800007	! t0_kref+0x358c:   	bvs,a	_kref+0x35a8
	.word	0xe4400019	! t0_kref+0x3590:   	ldsw	[%g0 + %i1], %l2
	.word	0x9db38990	! t0_kref+0x3594:   	bshuffle	%f14, %f16, %f14
	.word	0x9da00550	! t0_kref+0x3598:   	fsqrtd	%f16, %f14
	.word	0x99a0012c	! t0_kref+0x359c:   	fabss	%f12, %f12
	call	SYM(t0_subr3)
	.word	0xaa5d30cd	! t0_kref+0x35a4:   	smul	%l4, -0xf33, %l5
	.word	0x9fc10000	! t0_kref+0x35a8:   	call	%g4
	.word	0x81daaaf9	! t0_kref+0x35ac:   	flush	%o2 + 0xaf9
	.word	0xd9be5a5b	! t0_kref+0x35b0:   	stda	%f12, [%i1 + %i3]0xd2
	.word	0xe11e2010	! t0_kref+0x35b4:   	ldd	[%i0 + 0x10], %f16
	.word	0xaa9dc015	! t0_kref+0x35b8:   	xorcc	%l7, %l5, %l5
	.word	0x99a30950	! t0_kref+0x35bc:   	fmuld	%f12, %f16, %f12
	.word	0xd208a027	! t0_kref+0x35c0:   	ldub	[%g2 + 0x27], %o1
	.word	0xee36600e	! t0_kref+0x35c4:   	sth	%l7, [%i1 + 0xe]
	.word	0x31800001	! t0_kref+0x35c8:   	fba,a	_kref+0x35cc
	.word	0xaf358013	! t0_kref+0x35cc:   	srl	%l6, %l3, %l7
	.word	0x99a3894e	! t0_kref+0x35d0:   	fmuld	%f14, %f14, %f12
	.word	0x952233a1	! t0_kref+0x35d4:   	mulscc	%o0, -0xc5f, %o2
	.word	0x92458017	! t0_kref+0x35d8:   	addc	%l6, %l7, %o1
	.word	0x99a018ce	! t0_kref+0x35dc:   	fdtos	%f14, %f12
	.word	0xedee101b	! t0_kref+0x35e0:   	prefetcha	%i0 + %i3, 22
	.word	0x81d932a5	! t0_kref+0x35e4:   	flush	%g4 - 0xd5b
	.word	0x85854008	! t0_kref+0x35e8:   	wr	%l5, %o0, %ccr
	.word	0x99b3098e	! t0_kref+0x35ec:   	bshuffle	%f12, %f14, %f12
	.word	0xa5400000	! t0_kref+0x35f0:   	mov	%y, %l2
	.word	0xa1a4084c	! t0_kref+0x35f4:   	faddd	%f16, %f12, %f16
	.word	0xa61232be	! t0_kref+0x35f8:   	or	%o0, -0xd42, %l3
	.word	0x9fa3c92f	! t0_kref+0x35fc:   	fmuls	%f15, %f15, %f15
	.word	0xa88c8016	! t0_kref+0x3600:   	andcc	%l2, %l6, %l4
	.word	0xeea6101c	! t0_kref+0x3604:   	sta	%l7, [%i0 + %i4]0x80
	.word	0x9da00530	! t0_kref+0x3608:   	fsqrts	%f16, %f14
	.word	0x25800003	! t0_kref+0x360c:   	fblg,a	_kref+0x3618
	.word	0xa1b30a0e	! t0_kref+0x3610:   	fpadd16	%f12, %f14, %f16
	.word	0xe430a01e	! t0_kref+0x3614:   	sth	%l2, [%g2 + 0x1e]
	.word	0x9fb3caef	! t0_kref+0x3618:   	fpsub32s	%f15, %f15, %f15
	.word	0xe3b8a040	! t0_kref+0x361c:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x972c8017	! t0_kref+0x3620:   	sll	%l2, %l7, %o3
	.word	0xe76e401a	! t0_kref+0x3624:   	prefetch	%i1 + %i2, 19
	.word	0xeaa71019	! t0_kref+0x3628:   	sta	%l5, [%i4 + %i1]0x80
	.word	0xa1a00550	! t0_kref+0x362c:   	fsqrtd	%f16, %f16
	.word	0x878020e0	! t0_kref+0x3630:   	mov	0xe0, %asi
	.word	0x3c800008	! t0_kref+0x3634:   	bpos,a	_kref+0x3654
	.word	0xec463fe0	! t0_kref+0x3638:   	ldsw	[%i0 - 0x20], %l6
	.word	0xe1180018	! t0_kref+0x363c:   	ldd	[%g0 + %i0], %f16
	.word	0x81abcab0	! t0_kref+0x3640:   	fcmpes	%fcc0, %f15, %f16
	.word	0xa6b4c008	! t0_kref+0x3644:   	orncc	%l3, %o0, %l3
	.word	0xacd53f57	! t0_kref+0x3648:   	umulcc	%l4, -0xa9, %l6
	.word	0x9fa0002f	! t0_kref+0x364c:   	fmovs	%f15, %f15
	.word	0xd030a014	! t0_kref+0x3650:   	sth	%o0, [%g2 + 0x14]
	.word	0xe4ae9019	! t0_kref+0x3654:   	stba	%l2, [%i2 + %i1]0x80
	.word	0x90250008	! t0_kref+0x3658:   	sub	%l4, %o0, %o0
	.word	0x2c480008	! t0_kref+0x365c:   	bneg,a,pt	%icc, _kref+0x367c
	.word	0x9da01a4e	! t0_kref+0x3660:   	fdtoi	%f14, %f14
	.word	0xa8b50017	! t0_kref+0x3664:   	orncc	%l4, %l7, %l4
	.word	0xac7cff11	! t0_kref+0x3668:   	sdiv	%l3, -0xef, %l6
	.word	0x99a01931	! t0_kref+0x366c:   	fstod	%f17, %f12
	.word	0x90053f0e	! t0_kref+0x3670:   	add	%l4, -0xf2, %o0
	.word	0xd99e1a5d	! t0_kref+0x3674:   	ldda	[%i0 + %i5]0xd2, %f12
	.word	0x9ba0002f	! t0_kref+0x3678:   	fmovs	%f15, %f13
	.word	0xa465c015	! t0_kref+0x367c:   	subc	%l7, %l5, %l2
	.word	0x37800003	! t0_kref+0x3680:   	fbge,a	_kref+0x368c
	.word	0xa3a018ce	! t0_kref+0x3684:   	fdtos	%f14, %f17
	.word	0xee2e8018	! t0_kref+0x3688:   	stb	%l7, [%i2 + %i0]
	.word	0x90c4c017	! t0_kref+0x368c:   	addccc	%l3, %l7, %o0
	.word	0xd406001c	! t0_kref+0x3690:   	ld	[%i0 + %i4], %o2
	.word	0x9da00550	! t0_kref+0x3694:   	fsqrtd	%f16, %f14
	.word	0x81ac0acc	! t0_kref+0x3698:   	fcmped	%fcc0, %f16, %f12
	.word	0x93b3844c	! t0_kref+0x369c:   	fcmpne16	%f14, %f12, %o1
	.word	0x928d8017	! t0_kref+0x36a0:   	andcc	%l6, %l7, %o1
	.word	0x2f800007	! t0_kref+0x36a4:   	fbu,a	_kref+0x36c0
	.word	0x001fffff	! t0_kref+0x36a8:   	illtrap	0x1fffff
	.word	0xa5b50315	! t0_kref+0x36ac:   	alignaddr	%l4, %l5, %l2
	.word	0x9db38e4e	! t0_kref+0x36b0:   	fxnor	%f14, %f14, %f14
	.word	0xa1b30c8c	! t0_kref+0x36b4:   	fandnot2	%f12, %f12, %f16
	.word	0xa6748015	! t0_kref+0x36b8:   	udiv	%l2, %l5, %l3
	.word	0xa45da879	! t0_kref+0x36bc:   	smul	%l6, 0x879, %l2
	.word	0x3a480006	! t0_kref+0x36c0:   	bcc,a,pt	%icc, _kref+0x36d8
	.word	0xac258014	! t0_kref+0x36c4:   	sub	%l6, %l4, %l6
	.word	0x9fa449ac	! t0_kref+0x36c8:   	fdivs	%f17, %f12, %f15
	.word	0x2a800006	! t0_kref+0x36cc:   	bcs,a	_kref+0x36e4
	.word	0x9ba018cc	! t0_kref+0x36d0:   	fdtos	%f12, %f13
	call	SYM(t0_subr2)
	.word	0xa535200d	! t0_kref+0x36d8:   	srl	%l4, 0xd, %l2
	.word	0xec881018	! t0_kref+0x36dc:   	lduba	[%g0 + %i0]0x80, %l6
	.word	0xd9180018	! t0_kref+0x36e0:   	ldd	[%g0 + %i0], %f12
	.word	0xe66e0000	! t0_kref+0x36e4:   	ldstub	[%i0], %l3
	.word	0xac022f33	! t0_kref+0x36e8:   	add	%o0, 0xf33, %l6
	.word	0x9664ee4a	! t0_kref+0x36ec:   	subc	%l3, 0xe4a, %o3
	.word	0xa864ac41	! t0_kref+0x36f0:   	subc	%l2, 0xc41, %l4
	.word	0x99a4084e	! t0_kref+0x36f4:   	faddd	%f16, %f14, %f12
	.word	0xf96e2010	! t0_kref+0x36f8:   	prefetch	%i0 + 0x10, 28
	.word	0xec9e1000	! t0_kref+0x36fc:   	ldda	[%i0]0x80, %l6
	.word	0x95b3040c	! t0_kref+0x3700:   	fcmple16	%f12, %f12, %o2
	.word	0xa1b38f50	! t0_kref+0x3704:   	fornot1	%f14, %f16, %f16
	.word	0x93b404ce	! t0_kref+0x3708:   	fcmpne32	%f16, %f14, %o1
	.word	0xa6fdb4bc	! t0_kref+0x370c:   	sdivcc	%l6, -0xb44, %l3
	.word	0x8143c000	! t0_kref+0x3710:   	stbar
	.word	0xe168a082	! t0_kref+0x3714:   	prefetch	%g2 + 0x82, 16
	.word	0x9664ef89	! t0_kref+0x3718:   	subc	%l3, 0xf89, %o3
	.word	0x905a0017	! t0_kref+0x371c:   	smul	%o0, %l7, %o0
	.word	0xe56e3ff8	! t0_kref+0x3720:   	prefetch	%i0 - 8, 18
	.word	0x9fa01a2f	! t0_kref+0x3724:   	fstoi	%f15, %f15
	.word	0x9fa3882f	! t0_kref+0x3728:   	fadds	%f14, %f15, %f15
	.word	0xa4320014	! t0_kref+0x372c:   	orn	%o0, %l4, %l2
	.word	0x9de3bfa0	! t0_kref+0x3730:   	save	%sp, -0x60, %sp
	.word	0xb010330d	! t0_kref+0x3734:   	mov	0xfffff30d, %i0
	.word	0xa5ee6423	! t0_kref+0x3738:   	restore	%i1, 0x423, %l2
	.word	0xa3a409ae	! t0_kref+0x373c:   	fdivs	%f16, %f14, %f17
	.word	0x99b4074c	! t0_kref+0x3740:   	fpack32	%f16, %f12, %f12
	.word	0x9de3bfa0	! t0_kref+0x3744:   	save	%sp, -0x60, %sp
	.word	0x80966314	! t0_kref+0x3748:   	orcc	%i1, 0x314, %g0
	.word	0x93ee001c	! t0_kref+0x374c:   	restore	%i0, %i4, %o1
	.word	0xe8b6101b	! t0_kref+0x3750:   	stha	%l4, [%i0 + %i3]0x80
	.word	0xa3a0002c	! t0_kref+0x3754:   	fmovs	%f12, %f17
	.word	0xaa15c016	! t0_kref+0x3758:   	or	%l7, %l6, %l5
	.word	0xd93e4000	! t0_kref+0x375c:   	std	%f12, [%i1]
	.word	0x9db38ad0	! t0_kref+0x3760:   	fpsub32	%f14, %f16, %f14
	.word	0x2a800003	! t0_kref+0x3764:   	bcs,a	_kref+0x3770
	.word	0xa1a0052c	! t0_kref+0x3768:   	fsqrts	%f12, %f16
	.word	0xaa5d7740	! t0_kref+0x376c:   	smul	%l5, -0x8c0, %l5
	.word	0xa65de100	! t0_kref+0x3770:   	smul	%l7, 0x100, %l3
	.word	0x9fb30aaf	! t0_kref+0x3774:   	fpsub16s	%f12, %f15, %f15
	.word	0x3d800004	! t0_kref+0x3778:   	fbule,a	_kref+0x3788
	.word	0x9da0052e	! t0_kref+0x377c:   	fsqrts	%f14, %f14
	.word	0xd8070000	! t0_kref+0x3780:   	ld	[%i4], %o4
	.word	0xfbee501c	! t0_kref+0x3784:   	prefetcha	%i1 + %i4, 29
	.word	0x001fffff	! t0_kref+0x3788:   	illtrap	0x1fffff
	.word	0x2f367a6e	! t0_kref+0x378c:   	sethi	%hi(0xd9e9b800), %l7
	.word	0x9db40f8c	! t0_kref+0x3790:   	for	%f16, %f12, %f14
	.word	0xc168a008	! t0_kref+0x3794:   	prefetch	%g2 + 8, 0
	.word	0xaf400000	! t0_kref+0x3798:   	mov	%y, %l7
	.word	0x99b38a8c	! t0_kref+0x379c:   	fpsub16	%f14, %f12, %f12
	.word	0x3a800004	! t0_kref+0x37a0:   	bcc,a	_kref+0x37b0
	.word	0x903a0017	! t0_kref+0x37a4:   	xnor	%o0, %l7, %o0
	.word	0xe3b8a040	! t0_kref+0x37a8:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x9da0052f	! t0_kref+0x37ac:   	fsqrts	%f15, %f14
	.word	0xa1b38e4e	! t0_kref+0x37b0:   	fxnor	%f14, %f14, %f16
	.word	0xa1a388ac	! t0_kref+0x37b4:   	fsubs	%f14, %f12, %f16
	.word	0xe650a03e	! t0_kref+0x37b8:   	ldsh	[%g2 + 0x3e], %l3
	.word	0xe6262008	! t0_kref+0x37bc:   	st	%l3, [%i0 + 8]
	.word	0xa3b44ab0	! t0_kref+0x37c0:   	fpsub16s	%f17, %f16, %f17
	.word	0xa1b30750	! t0_kref+0x37c4:   	fpack32	%f12, %f16, %f16
	.word	0xaef50016	! t0_kref+0x37c8:   	udivcc	%l4, %l6, %l7
	.word	0xe3064000	! t0_kref+0x37cc:   	ld	[%i1], %f17
	.word	0xe19eda59	! t0_kref+0x37d0:   	ldda	[%i3 + %i1]0xd2, %f16
	.word	0xd028a035	! t0_kref+0x37d4:   	stb	%o0, [%g2 + 0x35]
	.word	0xae250016	! t0_kref+0x37d8:   	sub	%l4, %l6, %l7
	.word	0xa72d6001	! t0_kref+0x37dc:   	sll	%l5, 0x1, %l3
	.word	0xe3b8a040	! t0_kref+0x37e0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0x31800007	! t0_kref+0x37e4:   	fba,a	_kref+0x3800
	.word	0xf4380019	! t0_kref+0x37e8:   	std	%i2, [%g0 + %i1]
	.word	0xe76e401b	! t0_kref+0x37ec:   	prefetch	%i1 + %i3, 19
	.word	0x3f800003	! t0_kref+0x37f0:   	fbo,a	_kref+0x37fc
	.word	0xa3b0076c	! t0_kref+0x37f4:   	fpack16	%f12, %f17
	.word	0x9da018ce	! t0_kref+0x37f8:   	fdtos	%f14, %f14
	.word	0x99a3094c	! t0_kref+0x37fc:   	fmuld	%f12, %f12, %f12
	.word	0xea68a01e	! t0_kref+0x3800:   	ldstub	[%g2 + 0x1e], %l5
	.word	0x9615b2df	! t0_kref+0x3804:   	or	%l6, -0xd21, %o3
	.word	0x9da0192f	! t0_kref+0x3808:   	fstod	%f15, %f14
	.word	0xae75bff0	! t0_kref+0x380c:   	udiv	%l6, -0x10, %l7
	.word	0x9ba01a30	! t0_kref+0x3810:   	fstoi	%f16, %f13
	.word	0xadb5c008	! t0_kref+0x3814:   	edge8	%l7, %o0, %l6
	.word	0xa1a0002d	! t0_kref+0x3818:   	fmovs	%f13, %f16
	.word	0x9da3094e	! t0_kref+0x381c:   	fmuld	%f12, %f14, %f14
	.word	0x90750017	! t0_kref+0x3820:   	udiv	%l4, %l7, %o0
	.word	0x90ad4015	! t0_kref+0x3824:   	andncc	%l5, %l5, %o0
	.word	0xfd19401d	! t0_kref+0x3828:   	ldd	[%g5 + %i5], %f30
	.word	0x9ba018ce	! t0_kref+0x382c:   	fdtos	%f14, %f13
	.word	0xac9db162	! t0_kref+0x3830:   	xorcc	%l6, -0xe9e, %l6
	.word	0x9db38ab1	! t0_kref+0x3834:   	fpsub16s	%f14, %f17, %f14
	.word	0x9fa0002f	! t0_kref+0x3838:   	fmovs	%f15, %f15
	.word	0x2f1cf226	! t0_kref+0x383c:   	sethi	%hi(0x73c89800), %l7
	.word	0x9fb007ac	! t0_kref+0x3840:   	fpackfix	%f12, %f15
	.word	0x94fa0008	! t0_kref+0x3844:   	sdivcc	%o0, %o0, %o2
	.word	0xf43e4000	! t0_kref+0x3848:   	std	%i2, [%i1]
	.word	0xdd1e2000	! t0_kref+0x384c:   	ldd	[%i0], %f14
	.word	0xa1a409ac	! t0_kref+0x3850:   	fdivs	%f16, %f12, %f16
	.word	0xa1a408d0	! t0_kref+0x3854:   	fsubd	%f16, %f16, %f16
	.word	0xa1b30a10	! t0_kref+0x3858:   	fpadd16	%f12, %f16, %f16
	.word	0x99b30fb1	! t0_kref+0x385c:   	fors	%f12, %f17, %f12
	.word	0x948cc012	! t0_kref+0x3860:   	andcc	%l3, %l2, %o2
	.word	0x99a389d0	! t0_kref+0x3864:   	fdivd	%f14, %f16, %f12
	.word	0x34480004	! t0_kref+0x3868:   	bg,a,pt	%icc, _kref+0x3878
	.word	0xe300a020	! t0_kref+0x386c:   	ld	[%g2 + 0x20], %f17
	.word	0x81d9700e	! t0_kref+0x3870:   	flush	%g5 - 0xff2
	.word	0x97700016	! t0_kref+0x3874:   	popc	%l6, %o3
	.word	0x99a3094c	! t0_kref+0x3878:   	fmuld	%f12, %f12, %f12
	.word	0x38480003	! t0_kref+0x387c:   	bgu,a,pt	%icc, _kref+0x3888
	.word	0x9fa3492d	! t0_kref+0x3880:   	fmuls	%f13, %f13, %f15
	.word	0x2b480003	! t0_kref+0x3884:   	fbug,a,pt	%fcc0, _kref+0x3890
	.word	0xd678a020	! t0_kref+0x3888:   	swap	[%g2 + 0x20], %o3
	.word	0xdd1e7ff8	! t0_kref+0x388c:   	ldd	[%i1 - 8], %f14
	.word	0xac5d7cbc	! t0_kref+0x3890:   	smul	%l5, -0x344, %l6
	.word	0xae7cf162	! t0_kref+0x3894:   	sdiv	%l3, -0xe9e, %l7
	.word	0x2d800007	! t0_kref+0x3898:   	fbg,a	_kref+0x38b4
	.word	0x9db38d0c	! t0_kref+0x389c:   	fandnot1	%f14, %f12, %f14
	.word	0xa1a000af	! t0_kref+0x38a0:   	fnegs	%f15, %f16
	.word	0xe168a04e	! t0_kref+0x38a4:   	prefetch	%g2 + 0x4e, 16
	.word	0xa1a408cc	! t0_kref+0x38a8:   	fsubd	%f16, %f12, %f16
	.word	0x9da0052e	! t0_kref+0x38ac:   	fsqrts	%f14, %f14
	.word	0xa822335f	! t0_kref+0x38b0:   	sub	%o0, -0xca1, %l4
	.word	0xaeb50012	! t0_kref+0x38b4:   	orncc	%l4, %l2, %l7
	.word	0x9db40671	! t0_kref+0x38b8:   	fmul8x16au	%f16, %f17, %f14
	.word	0xa1a01930	! t0_kref+0x38bc:   	fstod	%f16, %f16
	.word	0xa3aac02d	! t0_kref+0x38c0:   	fmovsge	%fcc0, %f13, %f17
	.word	0xea5e7fe0	! t0_kref+0x38c4:   	ldx	[%i1 - 0x20], %l5
	.word	0xab400000	! t0_kref+0x38c8:   	mov	%y, %l5
	.word	0x9db38a0e	! t0_kref+0x38cc:   	fpadd16	%f14, %f14, %f14
	.word	0xe820a020	! t0_kref+0x38d0:   	st	%l4, [%g2 + 0x20]
	.word	0xe3263fe0	! t0_kref+0x38d4:   	st	%f17, [%i0 - 0x20]
	.word	0xac5a3773	! t0_kref+0x38d8:   	smul	%o0, -0x88d, %l6
	.word	0x9fa0108c	! t0_kref+0x38dc:   	fxtos	%f12, %f15
	.word	0x3a800003	! t0_kref+0x38e0:   	bcc,a	_kref+0x38ec
	.word	0xeac61000	! t0_kref+0x38e4:   	ldswa	[%i0]0x80, %l5
	.word	0xe100a02c	! t0_kref+0x38e8:   	ld	[%g2 + 0x2c], %f16
	.word	0x90fcad79	! t0_kref+0x38ec:   	sdivcc	%l2, 0xd79, %o0
	.word	0x9fc00004	! t0_kref+0x38f0:   	call	%g0 + %g4
	.word	0x001fffff	! t0_kref+0x38f4:   	illtrap	0x1fffff
	.word	0xe6871040	! t0_kref+0x38f8:   	lda	[%i4]0x82, %l3
	.word	0x9db30990	! t0_kref+0x38fc:   	bshuffle	%f12, %f16, %f14
	.word	0xa40cb393	! t0_kref+0x3900:   	and	%l2, -0xc6d, %l2
	.word	0xd6680018	! t0_kref+0x3904:   	ldstub	[%g0 + %i0], %o3
	.word	0xa68debe8	! t0_kref+0x3908:   	andcc	%l7, 0xbe8, %l3
	.word	0xe42e6000	! t0_kref+0x390c:   	stb	%l2, [%i1]
	.word	0x943d4012	! t0_kref+0x3910:   	xnor	%l5, %l2, %o2
	.word	0x9da0002e	! t0_kref+0x3914:   	fmovs	%f14, %f14
	.word	0x34800003	! t0_kref+0x3918:   	bg,a	_kref+0x3924
	.word	0x9db3462c	! t0_kref+0x391c:   	fmul8x16	%f13, %f12, %f14
	.word	0x39480001	! t0_kref+0x3920:   	fbuge,a,pt	%fcc0, _kref+0x3924
	.word	0xeab6d019	! t0_kref+0x3924:   	stha	%l5, [%i3 + %i1]0x80
	.word	0x99a4084e	! t0_kref+0x3928:   	faddd	%f16, %f14, %f12
	.word	0x9de3bfa0	! t0_kref+0x392c:   	save	%sp, -0x60, %sp
	.word	0xb8e6ea61	! t0_kref+0x3930:   	subccc	%i3, 0xa61, %i4
	.word	0xafef2dca	! t0_kref+0x3934:   	restore	%i4, 0xdca, %l7
	.word	0x9de3bfa0	! t0_kref+0x3938:   	save	%sp, -0x60, %sp
	.word	0xafef401d	! t0_kref+0x393c:   	restore	%i5, %i5, %l7
	.word	0x97254014	! t0_kref+0x3940:   	mulscc	%l5, %l4, %o3
	.word	0x9144c000	! t0_kref+0x3944:   	mov	%gsr, %o0
	.word	0x9da00150	! t0_kref+0x3948:   	fabsd	%f16, %f14
	.word	0xe810a022	! t0_kref+0x394c:   	lduh	[%g2 + 0x22], %l4
	.word	0xe320a02c	! t0_kref+0x3950:   	st	%f17, [%g2 + 0x2c]
	.word	0xa465e84c	! t0_kref+0x3954:   	subc	%l7, 0x84c, %l2
	.word	0xa1a349af	! t0_kref+0x3958:   	fdivs	%f13, %f15, %f16
	.word	0xedee101c	! t0_kref+0x395c:   	prefetcha	%i0 + %i4, 22
	.word	0x94fdf86b	! t0_kref+0x3960:   	sdivcc	%l7, -0x795, %o2
	.word	0xa1b00cee	! t0_kref+0x3964:   	fnot2s	%f14, %f16
	.word	0x3f800007	! t0_kref+0x3968:   	fbo,a	_kref+0x3984
	.word	0xa842342c	! t0_kref+0x396c:   	addc	%o0, -0xbd4, %l4
	.word	0xf16e001a	! t0_kref+0x3970:   	prefetch	%i0 + %i2, 24
	.word	0xa1a9002f	! t0_kref+0x3974:   	fmovsl	%fcc0, %f15, %f16
	.word	0x2b800004	! t0_kref+0x3978:   	fbug,a	_kref+0x3988
	.word	0xe11fbfa0	! t0_kref+0x397c:   	ldd	[%fp - 0x60], %f16
	.word	0xe8080019	! t0_kref+0x3980:   	ldub	[%g0 + %i1], %l4
	.word	0x9224af3e	! t0_kref+0x3984:   	sub	%l2, 0xf3e, %o1
	.word	0x20800003	! t0_kref+0x3988:   	bn,a	_kref+0x3994
	.word	0x81deb5e0	! t0_kref+0x398c:   	flush	%i2 - 0xa20
	.word	0x2e800006	! t0_kref+0x3990:   	bvs,a	_kref+0x39a8
	.word	0xa50d8017	! t0_kref+0x3994:   	tsubcc	%l6, %l7, %l2
	.word	0x3a800002	! t0_kref+0x3998:   	bcc,a	_kref+0x39a0
	.word	0x9fa0052e	! t0_kref+0x399c:   	fsqrts	%f14, %f15
	.word	0x99b30630	! t0_kref+0x39a0:   	fmul8x16	%f12, %f16, %f12
	.word	0xe320a030	! t0_kref+0x39a4:   	st	%f17, [%g2 + 0x30]
	.word	0xdd20a03c	! t0_kref+0x39a8:   	st	%f14, [%g2 + 0x3c]
	.word	0xec2e7fe2	! t0_kref+0x39ac:   	stb	%l6, [%i1 - 0x1e]
	.word	0xaa65242a	! t0_kref+0x39b0:   	subc	%l4, 0x42a, %l5
	.word	0xaa8a35d8	! t0_kref+0x39b4:   	andcc	%o0, -0xa28, %l5
	.word	0xa1a3884e	! t0_kref+0x39b8:   	faddd	%f14, %f14, %f16
	.word	0x81de8019	! t0_kref+0x39bc:   	flush	%i2 + %i1
	.word	0x91b304d0	! t0_kref+0x39c0:   	fcmpne32	%f12, %f16, %o0
	.word	0x947d4013	! t0_kref+0x39c4:   	sdiv	%l5, %l3, %o2
	.word	0xa1b306b0	! t0_kref+0x39c8:   	fmul8x16al	%f12, %f16, %f16
	.word	0x9fc00004	! t0_kref+0x39cc:   	call	%g0 + %g4
	.word	0xa1a00030	! t0_kref+0x39d0:   	fmovs	%f16, %f16
	.word	0xe8462018	! t0_kref+0x39d4:   	ldsw	[%i0 + 0x18], %l4
	.word	0xa90d221c	! t0_kref+0x39d8:   	tsubcc	%l4, 0x21c, %l4
	.word	0x95b305ce	! t0_kref+0x39dc:   	fcmpeq32	%f12, %f14, %o2
	.word	0xe3b8a040	! t0_kref+0x39e0:   	stda	%f48, [%g2 + 0x40]%asi
	.word	0xd900a038	! t0_kref+0x39e4:   	ld	[%g2 + 0x38], %f12
	.word	0xea30a022	! t0_kref+0x39e8:   	sth	%l5, [%g2 + 0x22]
	.word	0xa71d3c1a	! t0_kref+0x39ec:   	tsubcctv	%l4, -0x3e6, %l3
	.word	0xe100a020	! t0_kref+0x39f0:   	ld	[%g2 + 0x20], %f16
	.word	0xd920a028	! t0_kref+0x39f4:   	st	%f12, [%g2 + 0x28]
	.word	0xa8652327	! t0_kref+0x39f8:   	subc	%l4, 0x327, %l4
	.word	0xa534a019	! t0_kref+0x39fc:   	srl	%l2, 0x19, %l2
	.word	0x99a01a30	! t0_kref+0x3a00:   	fstoi	%f16, %f12
	.word	0xd83f4019	! t0_kref+0x3a04:   	std	%o4, [%i5 + %i1]
	.word	0xa1b30f8e	! t0_kref+0x3a08:   	for	%f12, %f14, %f16
	.word	0x9fa30830	! t0_kref+0x3a0c:   	fadds	%f12, %f16, %f15
	.word	0x34800001	! t0_kref+0x3a10:   	bg,a	_kref+0x3a14
	.word	0xd67e401c	! t0_kref+0x3a14:   	swap	[%i1 + %i4], %o3
	.word	0xadb48116	! t0_kref+0x3a18:   	edge32	%l2, %l6, %l6
	.word	0x29800001	! t0_kref+0x3a1c:   	fbl,a	_kref+0x3a20
	.word	0xa4952e08	! t0_kref+0x3a20:   	orcc	%l4, 0xe08, %l2
	.word	0x929c8017	! t0_kref+0x3a24:   	xorcc	%l2, %l7, %o1
	.word	0xa1b40c90	! t0_kref+0x3a28:   	fandnot2	%f16, %f16, %f16
	.word	0x93400000	! t0_kref+0x3a2c:   	mov	%y, %o1
	.word	0xa1a349ad	! t0_kref+0x3a30:   	fdivs	%f13, %f13, %f16
	.word	0xeb68a08d	! t0_kref+0x3a34:   	prefetch	%g2 + 0x8d, 21
	.word	0x35800006	! t0_kref+0x3a38:   	fbue,a	_kref+0x3a50
	.word	0x9da0054e	! t0_kref+0x3a3c:   	fsqrtd	%f14, %f14
	.word	0xa63d0012	! t0_kref+0x3a40:   	xnor	%l4, %l2, %l3
	.word	0x99b38d0c	! t0_kref+0x3a44:   	fandnot1	%f14, %f12, %f12
	.word	0xd93e3ff0	! t0_kref+0x3a48:   	std	%f12, [%i0 - 0x10]
	.word	0x97b30590	! t0_kref+0x3a4c:   	fcmpgt32	%f12, %f16, %o3
	.word	0x9484c008	! t0_kref+0x3a50:   	addcc	%l3, %o0, %o2
	.word	0xd9be5848	! t0_kref+0x3a54:   	stda	%f12, [%i1 + %o0]0xc2
	.word	0x96bc8017	! t0_kref+0x3a58:   	xnorcc	%l2, %l7, %o3
	.word	0xdd270018	! t0_kref+0x3a5c:   	st	%f14, [%i4 + %i0]
	.word	0x9da0002f	! t0_kref+0x3a60:   	fmovs	%f15, %f14
	.word	0x928d4016	! t0_kref+0x3a64:   	andcc	%l5, %l6, %o1
	.word	0x9fa00530	! t0_kref+0x3a68:   	fsqrts	%f16, %f15
	.word	0xe62e0000	! t0_kref+0x3a6c:   	stb	%l3, [%i0]
	.word	0x81dde522	! t0_kref+0x3a70:   	flush	%l7 + 0x522
	.word	0x93b3848e	! t0_kref+0x3a74:   	fcmple32	%f14, %f14, %o1
	.word	0x9da40950	! t0_kref+0x3a78:   	fmuld	%f16, %f16, %f14
	.word	0xa1b3ce2f	! t0_kref+0x3a7c:   	fands	%f15, %f15, %f16
	.word	0xac858012	! t0_kref+0x3a80:   	addcc	%l6, %l2, %l6
	.word	0xa3a3492e	! t0_kref+0x3a84:   	fmuls	%f13, %f14, %f17
	.word	0x99a0054e	! t0_kref+0x3a88:   	fsqrtd	%f14, %f12
	.word	0x949cb2d0	! t0_kref+0x3a8c:   	xorcc	%l2, -0xd30, %o2
	.word	0x99b30dce	! t0_kref+0x3a90:   	fnand	%f12, %f14, %f12
	.word	0xdd1e001d	! t0_kref+0x3a94:   	ldd	[%i0 + %i5], %f14
	.word	0x9ba00030	! t0_kref+0x3a98:   	fmovs	%f16, %f13
	.word	0x903a0016	! t0_kref+0x3a9c:   	xnor	%o0, %l6, %o0
	.word	0xa824c014	! t0_kref+0x3aa0:   	sub	%l3, %l4, %l4
	.word	0x91b54173	! t0_kref+0x3aa4:   	edge32ln	%l5, %l3, %o0
	.word	0xa1a0054c	! t0_kref+0x3aa8:   	fsqrtd	%f12, %f16
	.word	0xa7400000	! t0_kref+0x3aac:   	mov	%y, %l3
	.word	0xe448a022	! t0_kref+0x3ab0:   	ldsb	[%g2 + 0x22], %l2
	.word	0xe11e0000	! t0_kref+0x3ab4:   	ldd	[%i0], %f16
	.word	0xa424eae4	! t0_kref+0x3ab8:   	sub	%l3, 0xae4, %l2
	.word	0x99a0110c	! t0_kref+0x3abc:   	fxtod	%f12, %f12
	.word	0xac9cc008	! t0_kref+0x3ac0:   	xorcc	%l3, %o0, %l6
	.word	0x8143c000	! t0_kref+0x3ac4:   	stbar
	.word	0xe628a015	! t0_kref+0x3ac8:   	stb	%l3, [%g2 + 0x15]
	.word	0xa1a0052d	! t0_kref+0x3acc:   	fsqrts	%f13, %f16
	.word	0x8143e040	! t0_kref+0x3ad0:   	membar	0x40
	.word	0x963ce4e8	! t0_kref+0x3ad4:   	xnor	%l3, 0x4e8, %o3
	.word	0x969d8016	! t0_kref+0x3ad8:   	xorcc	%l6, %l6, %o3
	.word	0x81ab0acc	! t0_kref+0x3adc:   	fcmped	%fcc0, %f12, %f12
	.word	0xc568a040	! t0_kref+0x3ae0:   	prefetch	%g2 + 0x40, 2
	.word	0x9da30831	! t0_kref+0x3ae4:   	fadds	%f12, %f17, %f14
	.word	0xa65d0016	! t0_kref+0x3ae8:   	smul	%l4, %l6, %l3
	.word	0xc768a088	! t0_kref+0x3aec:   	prefetch	%g2 + 0x88, 3
	.word	0xd4981019	! t0_kref+0x3af0:   	ldda	[%g0 + %i1]0x80, %o2
	.word	0x91b20012	! t0_kref+0x3af4:   	edge8	%o0, %l2, %o0
	.word	0xdf00a008	! t0_kref+0x3af8:   	ld	[%g2 + 8], %f15
	.word	0xd9801019	! t0_kref+0x3afc:   	lda	[%g0 + %i1]0x80, %f12
	.word	0xa684e684	! t0_kref+0x3b00:   	addcc	%l3, 0x684, %l3
	.word	0x9675c015	! t0_kref+0x3b04:   	udiv	%l7, %l5, %o3
	.word	0xa665c017	! t0_kref+0x3b08:   	subc	%l7, %l7, %l3
	.word	0xfbee101b	! t0_kref+0x3b0c:   	prefetcha	%i0 + %i3, 29
	.word	0x905dc012	! t0_kref+0x3b10:   	smul	%l7, %l2, %o0
	.word	0x9ba3892d	! t0_kref+0x3b14:   	fmuls	%f14, %f13, %f13
	.word	0x36800005	! t0_kref+0x3b18:   	bge,a	_kref+0x3b2c
	.word	0xd9063ff0	! t0_kref+0x3b1c:   	ld	[%i0 - 0x10], %f12
	.word	0xd0680018	! t0_kref+0x3b20:   	ldstub	[%g0 + %i0], %o0
	.word	0x9da4084e	! t0_kref+0x3b24:   	faddd	%f16, %f14, %f14
	.word	0x3e800007	! t0_kref+0x3b28:   	bvc,a	_kref+0x3b44
	.word	0x99b44aaf	! t0_kref+0x3b2c:   	fpsub16s	%f17, %f15, %f12
	.word	0xd028a01b	! t0_kref+0x3b30:   	stb	%o0, [%g2 + 0x1b]
	.word	0x97048016	! t0_kref+0x3b34:   	taddcc	%l2, %l6, %o3
	.word	0x35800005	! t0_kref+0x3b38:   	fbue,a	_kref+0x3b4c
	.word	0xe306201c	! t0_kref+0x3b3c:   	ld	[%i0 + 0x1c], %f17
	.word	0xd02e2019	! t0_kref+0x3b40:   	stb	%o0, [%i0 + 0x19]
	.word	0xacc4e197	! t0_kref+0x3b44:   	addccc	%l3, 0x197, %l6
	.word	0xd20e2016	! t0_kref+0x3b48:   	ldub	[%i0 + 0x16], %o1
	.word	0xe826001c	! t0_kref+0x3b4c:   	st	%l4, [%i0 + %i4]
	.word	0x97b5c176	! t0_kref+0x3b50:   	edge32ln	%l7, %l6, %o3
	.word	0xa1a308d0	! t0_kref+0x3b54:   	fsubd	%f12, %f16, %f16
	.word	0xadb5c136	! t0_kref+0x3b58:   	edge32n	%l7, %l6, %l6
	.word	0xe630a036	! t0_kref+0x3b5c:   	sth	%l3, [%g2 + 0x36]
	.word	0x81ab0a4c	! t0_kref+0x3b60:   	fcmpd	%fcc0, %f12, %f12
	.word	0xa3b38e31	! t0_kref+0x3b64:   	fands	%f14, %f17, %f17
	.word	0xa8f5c014	! t0_kref+0x3b68:   	udivcc	%l7, %l4, %l4
	.word	0xa3b3caf1	! t0_kref+0x3b6c:   	fpsub32s	%f15, %f17, %f17
	.word	0xaf34a019	! t0_kref+0x3b70:   	srl	%l2, 0x19, %l7
	.word	0xa925c013	! t0_kref+0x3b74:   	mulscc	%l7, %l3, %l4
	.word	0xa1a000ad	! t0_kref+0x3b78:   	fnegs	%f13, %f16
	.word	0xacb5b13d	! t0_kref+0x3b7c:   	orncc	%l6, -0xec3, %l6
	.word	0x2c800003	! t0_kref+0x3b80:   	bneg,a	_kref+0x3b8c
	.word	0x9ba408b0	! t0_kref+0x3b84:   	fsubs	%f16, %f16, %f13
	.word	0x36480006	! t0_kref+0x3b88:   	bge,a,pt	%icc, _kref+0x3ba0
	.word	0x81dc6ae0	! t0_kref+0x3b8c:   	flush	%l1 + 0xae0
	.word	0xd28e9018	! t0_kref+0x3b90:   	lduba	[%i2 + %i0]0x80, %o1
	.word	0x3f800002	! t0_kref+0x3b94:   	fbo,a	_kref+0x3b9c
	.word	0xa1b38f8c	! t0_kref+0x3b98:   	for	%f14, %f12, %f16
	.word	0xa1a0052f	! t0_kref+0x3b9c:   	fsqrts	%f15, %f16
	.word	0x99a3094e	! t0_kref+0x3ba0:   	fmuld	%f12, %f14, %f12
	.word	0xe1070018	! t0_kref+0x3ba4:   	ld	[%i4 + %i0], %f16
	.word	0xf8380019	! t0_kref+0x3ba8:   	std	%i4, [%g0 + %i1]
	.word	0xac65a81c	! t0_kref+0x3bac:   	subc	%l6, 0x81c, %l6
	.word	0xa1a0052c	! t0_kref+0x3bb0:   	fsqrts	%f12, %f16
	.word	0x96aa0014	! t0_kref+0x3bb4:   	andncc	%o0, %l4, %o3
	.word	0x9da018cc	! t0_kref+0x3bb8:   	fdtos	%f12, %f14
	.word	0x99a388cc	! t0_kref+0x3bbc:   	fsubd	%f14, %f12, %f12
	.word	0x2a800003	! t0_kref+0x3bc0:   	bcs,a	_kref+0x3bcc
	.word	0xa4f5b5d4	! t0_kref+0x3bc4:   	udivcc	%l6, -0xa2c, %l2
	.word	0xec30a008	! t0_kref+0x3bc8:   	sth	%l6, [%g2 + 8]
	.word	0xae8d6e63	! t0_kref+0x3bcc:   	andcc	%l5, 0xe63, %l7
	.word	0xeb68a089	! t0_kref+0x3bd0:   	prefetch	%g2 + 0x89, 21
	.word	0xdf060000	! t0_kref+0x3bd4:   	ld	[%i0], %f15
	.word	0x9db3074e	! t0_kref+0x3bd8:   	fpack32	%f12, %f14, %f14
	.word	0xea2e401a	! t0_kref+0x3bdc:   	stb	%l5, [%i1 + %i2]
	.word	0xe4463fe0	! t0_kref+0x3be0:   	ldsw	[%i0 - 0x20], %l2
	.word	0xac95b0c2	! t0_kref+0x3be4:   	orcc	%l6, -0xf3e, %l6
	.word	0xea30a000	! t0_kref+0x3be8:   	sth	%l5, [%g2]
	.word	0xe16e6000	! t0_kref+0x3bec:   	prefetch	%i1, 16
	.word	0xc1ee1014	! t0_kref+0x3bf0:   	prefetcha	%i0 + %l4, 0
	.word	0xa3b3ca30	! t0_kref+0x3bf4:   	fpadd16s	%f15, %f16, %f17
	.word	0x9da00550	! t0_kref+0x3bf8:   	fsqrtd	%f16, %f14
	.word	0xc7ee5014	! t0_kref+0x3bfc:   	prefetcha	%i1 + %l4, 3
	.word	0xa3a389ae	! t0_kref+0x3c00:   	fdivs	%f14, %f14, %f17
	.word	0x9de3bfa0	! t0_kref+0x3c04:   	save	%sp, -0x60, %sp
	.word	0x80a6c01c	! t0_kref+0x3c08:   	cmp	%i3, %i4
	.word	0xa7ee401d	! t0_kref+0x3c0c:   	restore	%i1, %i5, %l3
	.word	0xaf400000	! t0_kref+0x3c10:   	mov	%y, %l7
	.word	0xa1a38850	! t0_kref+0x3c14:   	faddd	%f14, %f16, %f16
	.word	0xab2a2010	! t0_kref+0x3c18:   	sll	%o0, 0x10, %l5
	.word	0xa1b3062e	! t0_kref+0x3c1c:   	fmul8x16	%f12, %f14, %f16
	.word	0x9274f781	! t0_kref+0x3c20:   	udiv	%l3, -0x87f, %o1
	.word	0xaef5c013	! t0_kref+0x3c24:   	udivcc	%l7, %l3, %l7
	.word	0xe120a020	! t0_kref+0x3c28:   	st	%f16, [%g2 + 0x20]
	.word	0x8143c000	! t0_kref+0x3c2c:   	stbar
	.word	0x27480005	! t0_kref+0x3c30:   	fbul,a,pt	%fcc0, _kref+0x3c44
	.word	0xe120a014	! t0_kref+0x3c34:   	st	%f16, [%g2 + 0x14]
	.word	0xa4acfd00	! t0_kref+0x3c38:   	andncc	%l3, -0x300, %l2
	.word	0xa1b40c8c	! t0_kref+0x3c3c:   	fandnot2	%f16, %f12, %f16
	.word	0x81ab0ace	! t0_kref+0x3c40:   	fcmped	%fcc0, %f12, %f14
	.word	0x20480006	! t0_kref+0x3c44:   	bn,a,pt	%icc, _kref+0x3c5c
	.word	0x9674ffeb	! t0_kref+0x3c48:   	udiv	%l3, -0x15, %o3
	.word	0xa1a38850	! t0_kref+0x3c4c:   	faddd	%f14, %f16, %f16
	.word	0x94158016	! t0_kref+0x3c50:   	or	%l6, %l6, %o2
	.word	0xe48e501a	! t0_kref+0x3c54:   	lduba	[%i1 + %i2]0x80, %l2
	.word	0xa8320008	! t0_kref+0x3c58:   	orn	%o0, %o0, %l4
	.word	0xd91e3ff8	! t0_kref+0x3c5c:   	ldd	[%i0 - 8], %f12
	.word	0x99a018ce	! t0_kref+0x3c60:   	fdtos	%f14, %f12
	.word	0x81db394f	! t0_kref+0x3c64:   	flush	%o4 - 0x6b1
	.word	0x3a800006	! t0_kref+0x3c68:   	bcc,a	_kref+0x3c80
	.word	0x94d52241	! t0_kref+0x3c6c:   	umulcc	%l4, 0x241, %o2
	.word	0xec6e401a	! t0_kref+0x3c70:   	ldstub	[%i1 + %i2], %l6
	.word	0xa1a38850	! t0_kref+0x3c74:   	faddd	%f14, %f16, %f16
	.word	0xd0300018	! t0_kref+0x3c78:   	sth	%o0, [%g0 + %i0]
	.word	0x908c8014	! t0_kref+0x3c7c:   	andcc	%l2, %l4, %o0
	.word	0x99a4084e	! t0_kref+0x3c80:   	faddd	%f16, %f14, %f12
	.word	0xdb20a038	! t0_kref+0x3c84:   	st	%f13, [%g2 + 0x38]
	.word	0x22800007	! t0_kref+0x3c88:   	be,a	_kref+0x3ca4
	.word	0xaa920012	! t0_kref+0x3c8c:   	orcc	%o0, %l2, %l5
	.word	0x94750014	! t0_kref+0x3c90:   	udiv	%l4, %l4, %o2
	.word	0xe8c6101c	! t0_kref+0x3c94:   	ldswa	[%i0 + %i4]0x80, %l4
	.word	0x81abcab1	! t0_kref+0x3c98:   	fcmpes	%fcc0, %f15, %f17
	.word	0xa9b48052	! t0_kref+0x3c9c:   	edge8l	%l2, %l2, %l4
	.word	0x9da0054c	! t0_kref+0x3ca0:   	fsqrtd	%f12, %f14
	.word	0x9bb38a70	! t0_kref+0x3ca4:   	fpadd32s	%f14, %f16, %f13
	.word	0x9de3bfa0	! t0_kref+0x3ca8:   	save	%sp, -0x60, %sp
	.word	0xabef401a	! t0_kref+0x3cac:   	restore	%i5, %i2, %l5
	.word	0x81b01025	! t0_kref+0x3cb0:   	siam	0x5
	.word	0xf76e401a	! t0_kref+0x3cb4:   	prefetch	%i1 + %i2, 27
	.word	0x8143c000	! t0_kref+0x3cb8:   	stbar
	.word	0x9da000af	! t0_kref+0x3cbc:   	fnegs	%f15, %f14
	.word	0x30480002	! t0_kref+0x3cc0:   	ba,a,pt	%icc, _kref+0x3cc8
	.word	0x9db30dce	! t0_kref+0x3cc4:   	fnand	%f12, %f14, %f14
	.word	0xe13e7ff8	! t0_kref+0x3cc8:   	std	%f16, [%i1 - 8]
	.word	0xa6154014	! t0_kref+0x3ccc:   	or	%l5, %l4, %l3
	.word	0xa1b406ac	! t0_kref+0x3cd0:   	fmul8x16al	%f16, %f12, %f16
	.word	0xd2de1000	! t0_kref+0x3cd4:   	ldxa	[%i0]0x80, %o1
	.word	0x9da01a50	! t0_kref+0x3cd8:   	fdtoi	%f16, %f14
	.word	0xe3b8a080	! t0_kref+0x3cdc:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0xaeb20015	! t0_kref+0x3ce0:   	orncc	%o0, %l5, %l7
	.word	0x81ab0aae	! t0_kref+0x3ce4:   	fcmpes	%fcc0, %f12, %f14
	.word	0xd400a024	! t0_kref+0x3ce8:   	ld	[%g2 + 0x24], %o2
	.word	0xe3b8a080	! t0_kref+0x3cec:   	stda	%f48, [%g2 + 0x80]%asi
	.word	0x24800005	! t0_kref+0x3cf0:   	ble,a	_kref+0x3d04
	.word	0x9db40f4e	! t0_kref+0x3cf4:   	fornot1	%f16, %f14, %f14
	.word	0x30480007	! t0_kref+0x3cf8:   	ba,a,pt	%icc, _kref+0x3d14
	.word	0xea2e8018	! t0_kref+0x3cfc:   	stb	%l5, [%i2 + %i0]
	.word	0xd020a018	! t0_kref+0x3d00:   	st	%o0, [%g2 + 0x18]
	.word	0x9da3894e	! t0_kref+0x3d04:   	fmuld	%f14, %f14, %f14
	.word	0x2b800005	! t0_kref+0x3d08:   	fbug,a	_kref+0x3d1c
	.word	0xe1264000	! t0_kref+0x3d0c:   	st	%f16, [%i1]
	.word	0xaad50017	! t0_kref+0x3d10:   	umulcc	%l4, %l7, %l5
	.word	0x9da00150	! t0_kref+0x3d14:   	fabsd	%f16, %f14
	.word	0xe6c65000	! t0_kref+0x3d18:   	ldswa	[%i1]0x80, %l3
	.word	0xc56e4017	! t0_kref+0x3d1c:   	prefetch	%i1 + %l7, 2
	.word	0xaa9d0012	! t0_kref+0x3d20:   	xorcc	%l4, %l2, %l5
	.word	0x9625c017	! t0_kref+0x3d24:   	sub	%l7, %l7, %o3
	.word	0x9ba0052c	! t0_kref+0x3d28:   	fsqrts	%f12, %f13
	.word	0xec267ff4	! t0_kref+0x3d2c:   	st	%l6, [%i1 - 0xc]
	.word	0xa1b3c62e	! t0_kref+0x3d30:   	fmul8x16	%f15, %f14, %f16
	.word	0x9fa0052f	! t0_kref+0x3d34:   	fsqrts	%f15, %f15
	.word	0xe630a01a	! t0_kref+0x3d38:   	sth	%l3, [%g2 + 0x1a]
	.word	0xdd1e6010	! t0_kref+0x3d3c:   	ldd	[%i1 + 0x10], %f14
	.word	0x99a000b0	! t0_kref+0x3d40:   	fnegs	%f16, %f12
	.word	0x8143e05c	! t0_kref+0x3d44:   	membar	0x5c
	.word	0xec30a006	! t0_kref+0x3d48:   	sth	%l6, [%g2 + 6]
	.word	0xe630a000	! t0_kref+0x3d4c:   	sth	%l3, [%g2]
	.word	0xa1a309d0	! t0_kref+0x3d50:   	fdivd	%f12, %f16, %f16
	.word	0x81ab0acc	! t0_kref+0x3d54:   	fcmped	%fcc0, %f12, %f12
	.word	0x99a01a4c	! t0_kref+0x3d58:   	fdtoi	%f12, %f12
	.word	0x99a389cc	! t0_kref+0x3d5c:   	fdivd	%f14, %f12, %f12
	.word	0x26800007	! t0_kref+0x3d60:   	bl,a	_kref+0x3d7c
	.word	0x99a0052f	! t0_kref+0x3d64:   	fsqrts	%f15, %f12
	.word	0xa1b40ace	! t0_kref+0x3d68:   	fpsub32	%f16, %f14, %f16
	.word	0x9da00550	! t0_kref+0x3d6c:   	fsqrtd	%f16, %f14
	.word	0xa45cb93d	! t0_kref+0x3d70:   	smul	%l2, -0x6c3, %l2
	.word	0x99b40acc	! t0_kref+0x3d74:   	fpsub32	%f16, %f12, %f12
	.word	0xa875ec13	! t0_kref+0x3d78:   	udiv	%l7, 0xc13, %l4
	.word	0xf83e7ff8	! t0_kref+0x3d7c:   	std	%i4, [%i1 - 8]
	.word	0xd9beda58	! t0_kref+0x3d80:   	stda	%f12, [%i3 + %i0]0xd2
	.word	0xdda6101c	! t0_kref+0x3d84:   	sta	%f14, [%i0 + %i4]0x80
	.word	0xa1a409d0	! t0_kref+0x3d88:   	fdivd	%f16, %f16, %f16
	.word	0xd2580019	! t0_kref+0x3d8c:   	ldx	[%g0 + %i1], %o1
	.word	0x945a3a9d	! t0_kref+0x3d90:   	smul	%o0, -0x563, %o2
	.word	0x96fc8014	! t0_kref+0x3d94:   	sdivcc	%l2, %l4, %o3
	.word	0x35800007	! t0_kref+0x3d98:   	fbue,a	_kref+0x3db4
	.word	0x9444f22a	! t0_kref+0x3d9c:   	addc	%l3, -0xdd6, %o2
	.word	0x96b4a632	! t0_kref+0x3da0:   	orncc	%l2, 0x632, %o3
	.word	0xaabd8012	! t0_kref+0x3da4:   	xnorcc	%l6, %l2, %l5
	.word	0x9da0052d	! t0_kref+0x3da8:   	fsqrts	%f13, %f14
	.word	0x34480004	! t0_kref+0x3dac:   	bg,a,pt	%icc, _kref+0x3dbc
	.word	0x965d4016	! t0_kref+0x3db0:   	smul	%l5, %l6, %o3
	.word	0xa1a0054c	! t0_kref+0x3db4:   	fsqrtd	%f12, %f16
	.word	0x92654013	! t0_kref+0x3db8:   	subc	%l5, %l3, %o1
	call	SYM(t0_subr2)
	.word	0x91b54332	! t0_kref+0x3dc0:   	bmask	%l5, %l2, %o0
	.word	0xa1b007ac	! t0_kref+0x3dc4:   	fpackfix	%f12, %f16
	.word	0xdd871019	! t0_kref+0x3dc8:   	lda	[%i4 + %i1]0x80, %f14
	.word	0x99a3084e	! t0_kref+0x3dcc:   	faddd	%f12, %f14, %f12
	.word	0xf43e0000	! t0_kref+0x3dd0:   	std	%i2, [%i0]
	.word	0xe320a018	! t0_kref+0x3dd4:   	st	%f17, [%g2 + 0x18]
	.word	0xd9066008	! t0_kref+0x3dd8:   	ld	[%i1 + 8], %f12
	.word	0xab2d8008	! t0_kref+0x3ddc:   	sll	%l6, %o0, %l5
	.word	0x9fa0108e	! t0_kref+0x3de0:   	fxtos	%f14, %f15
	.word	0x26480001	! t0_kref+0x3de4:   	bl,a,pt	%icc, _kref+0x3de8
	.word	0xd6861000	! t0_kref+0x3de8:   	lda	[%i0]0x80, %o3
	.word	0xab700014	! t0_kref+0x3dec:   	popc	%l4, %l5
	.word	0xebee501c	! t0_kref+0x3df0:   	prefetcha	%i1 + %i4, 21
	.word	0x3c480006	! t0_kref+0x3df4:   	bpos,a,pt	%icc, _kref+0x3e0c
	.word	0xa6153f88	! t0_kref+0x3df8:   	or	%l4, -0x78, %l3
	.word	0x9224eb83	! t0_kref+0x3dfc:   	sub	%l3, 0xb83, %o1
	.word	0xacfc8012	! t0_kref+0x3e00:   	sdivcc	%l2, %l2, %l6
	.word	0xa1b40d40	! t0_kref+0x3e04:   	fnot1	%f16, %f16
	.word	0x3f800006	! t0_kref+0x3e08:   	fbo,a	_kref+0x3e20
	.word	0xd91e0000	! t0_kref+0x3e0c:   	ldd	[%i0], %f12
	.word	0xe2680019	! t0_kref+0x3e10:   	ldstub	[%g0 + %i1], %l1
	.word	0xaa24f8f1	! t0_kref+0x3e14:   	sub	%l3, -0x70f, %l5
	.word	0xa4854016	! t0_kref+0x3e18:   	addcc	%l5, %l6, %l2
	.word	0xae148016	! t0_kref+0x3e1c:   	or	%l2, %l6, %l7
	.word	0xd9380019	! t0_kref+0x3e20:   	std	%f12, [%g0 + %i1]
	.word	0xab400000	! t0_kref+0x3e24:   	mov	%y, %l5
	.word	0xa1a3884e	! t0_kref+0x3e28:   	faddd	%f14, %f14, %f16
	.word	0xa1a0054e	! t0_kref+0x3e2c:   	fsqrtd	%f14, %f16
	.word	0x8143e05c	! t0_kref+0x3e30:   	membar	0x5c
	.word	0xe13e0000	! t0_kref+0x3e34:   	std	%f16, [%i0]
	.word	0x99a3884e	! t0_kref+0x3e38:   	faddd	%f14, %f14, %f12
	.word	0x9bb40cad	! t0_kref+0x3e3c:   	fandnot2s	%f16, %f13, %f13
	call	1f
	.empty
	.word	0xa1a349af	! t0_kref+0x3e44:   	fdivs	%f13, %f15, %f16
	.word	0xa49a0017	! t0_kref+0x3e48:   	xorcc	%o0, %l7, %l2
1:	.word	0xec270018	! t0_kref+0x3e4c:   	st	%l6, [%i4 + %i0]
	.word	0xabb58072	! t0_kref+0x3e50:   	edge8ln	%l6, %l2, %l5
	.word	0x99b4074e	! t0_kref+0x3e54:   	fpack32	%f16, %f14, %f12
	.word	0xa4f58013	! t0_kref+0x3e58:   	udivcc	%l6, %l3, %l2
	.word	0xe120a020	! t0_kref+0x3e5c:   	st	%f16, [%g2 + 0x20]
	.word	0xdd3e401d	! t0_kref+0x3e60:   	std	%f14, [%i1 + %i5]
	.word	0x9db34caf	! t0_kref+0x3e64:   	fandnot2s	%f13, %f15, %f14
	.word	0x9db30f8c	! t0_kref+0x3e68:   	for	%f12, %f12, %f14
	.word	0xac5dc016	! t0_kref+0x3e6c:   	smul	%l7, %l6, %l6
	.word	0xe3064000	! t0_kref+0x3e70:   	ld	[%i1], %f17
	.word	0x92658017	! t0_kref+0x3e74:   	subc	%l6, %l7, %o1
	.word	0x9bb40d60	! t0_kref+0x3e78:   	fnot1s	%f16, %f13
	.word	0xe4467fe0	! t0_kref+0x3e7c:   	ldsw	[%i1 - 0x20], %l2
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x3e84:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x53362000)
.seg "text"
t0_subr0_page_begin:
	.skip 8184
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x52cca000)
.seg "text"
t0_subr1_page_begin:
	.skip 8188
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x5091a000)
.seg "text"
t0_subr2_page_begin:
	.skip 8188
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x53434000)
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
!  Total operations: 3928  
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              0.12   0.15
!  ldub              0.24   0.20
!  ldsh              0.29   0.15
!  lduh              0.01   0.00
!  ld                0.24   0.08
!  ldd               0.21   0.25
!  swap              0.28   0.20
!  ldstub            0.69   0.99
!  stb               1.25   1.20
!  sth               0.39   0.51
!  st                0.83   1.12
!  std               1.19   1.12
!  add               0.79   0.89
!  addcc             0.53   0.71
!  addx              0.61   0.71
!  addxcc            0.22   0.20
!  taddcc            0.26   0.31
!  taddcctv          0.10   0.10
!  sub               0.70   0.89
!  subcc             0.30   0.10
!  subx              1.40   1.53
!  subxcc            0.15   0.08
!  tsubcc            0.14   0.05
!  tsubcctv          0.19   0.20
!  mulscc            0.32   0.13
!  and               0.38   0.48
!  andcc             1.43   1.55
!  andn              0.02   0.00
!  andncc            0.71   0.76
!  or                0.41   0.48
!  orcc              0.76   0.43
!  orn               0.55   0.53
!  orncc             1.07   0.92
!  xor               0.37   0.46
!  xorcc             1.38   1.40
!  xnor              1.42   1.43
!  xnorcc            0.28   0.25
!  sll               0.85   0.92
!  srl               0.84   0.94
!  sra               0.12   0.08
!  unimp             0.16   0.28
!  umul              0.40   0.23
!  smul              1.38   1.71
!  udiv              0.59   0.71
!  sdiv              0.41   0.51
!  umulcc            0.54   0.36
!  smulcc            0.06   0.05
!  udivcc            0.93   0.92
!  sdivcc            1.26   1.37
!  rdy               1.04   1.25
!  wry               0.07   0.13
!  bicc              3.18   3.21
!  sethi             0.76   0.87
!  jmpl              0.38   0.36
!  call              0.23   0.23
!  ticc              0.00   0.00
!  flush             0.80   1.02
!  save              1.29   1.02
!  restore           1.37   0.00
!  stbar             0.55   0.84
!  ldf               1.32   1.32
!  lddf              1.02   1.02
!  stf               0.50   0.36
!  stdf              1.29   1.30
!  fadds             0.75   0.92
!  fsubs             1.18   1.35
!  fmuls             0.98   0.81
!  fdivs             1.06   1.02
!  faddd             1.24   1.65
!  fsubd             0.96   0.99
!  fmuld             1.33   1.35
!  fdivd             1.15   1.09
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.01   0.00
!  fdmulq            0.00   0.00
!  fitos             0.04   0.03
!  fitod             0.13   0.08
!  fitoq             0.00   0.00
!  fstoi             0.31   0.33
!  fstod             0.39   0.38
!  fstoq             0.00   0.00
!  fdtoi             0.67   0.71
!  fdtos             1.29   1.35
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             1.21   1.32
!  fnegs             0.65   0.56
!  fabss             0.68   0.66
!  fsqrts            2.63   2.85
!  fsqrtd            2.49   2.93
!  fsqrtq            0.00   0.00
!  fcmps             0.07   0.00
!  fcmpd             0.14   0.23
!  fcmpq             0.00   0.00
!  fcmpes            0.81   0.99
!  fcmped            0.68   0.48
!  fcmpeq            0.00   0.00
!  fbfcc             3.46   3.08
!  ldfsr             0.08   0.00
!  stfsr             0.17   0.03
!  loop              0.23   0.20
!  offset            0.11   0.13
!  area              0.10   0.15
!  target            0.13   0.08
!  goto              0.08   0.03
!  sigsegv           0.04   0.08
!  sigbus            0.24   0.25
!  imodify           0.00   0.00
!  ldfsr_offset      0.25   0.00
!  fpattern          0.23   0.23
!  lbranch           0.14   0.10
!  shmld             1.34   1.60
!  shmst             2.78   3.46
!  shmpf             1.01   1.12
!  shmswap           0.13   0.18
!  shmblkld          1.33   0.00
!  shmblkst          0.71   0.23
!  shmblkchk         0.36   0.36
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
!  casa              0.03   0.05
!  rdasi             0.13   0.18
!  wrasi             0.20   0.25
!  bpcc              1.79   1.63
!  fbpfcc            0.47   0.71
!  fmovscc           0.19   0.23
!  fmovdcc           0.14   0.10
!  fmovqcc           0.00   0.00
!  movcc             0.13   0.10
!  flushw            0.08   0.13
!  membar            0.21   0.33
!  prefetch          0.60   0.76
!  rdpc              0.06   0.13
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.28   0.33
!  lddfa             0.21   0.18
!  ldqfa             0.00   0.00
!  ldsba             0.14   0.10
!  ldsha             0.13   0.13
!  lduba             0.24   0.31
!  lduha             0.22   0.18
!  lda               0.08   0.15
!  ldda              0.10   0.13
!  ldstuba           0.09   0.13
!  prefetcha         1.26   1.37
!  stfa              0.23   0.10
!  stdfa             0.19   0.36
!  stqfa             0.00   0.00
!  stba              0.14   0.08
!  stha              0.23   0.31
!  sta               0.20   0.28
!  stda              0.02   0.05
!  swapa             0.11   0.08
!  fmovd             0.17   0.10
!  fnegd             0.16   0.08
!  fabsd             0.22   0.20
!  fstox             0.04   0.05
!  fdtox             0.05   0.08
!  fxtos             0.26   0.36
!  fxtod             0.26   0.15
!  lds               0.26   0.36
!  ldsa              0.09   0.13
!  ldx               0.14   0.23
!  ldxa              0.08   0.13
!  nofault           0.23   0.20
!  rdgsr             0.08   0.08
!  wrgsr             0.01   0.00
!  fpadd16           0.23   0.18
!  fpadd16s          0.07   0.08
!  fpadd32           0.15   0.13
!  fpadd32s          0.12   0.18
!  fpsub16           0.16   0.08
!  fpsub16s          0.19   0.31
!  fpsub32           0.22   0.23
!  fpsub32s          0.20   0.18
!  fpack16           0.20   0.18
!  fpack32           0.16   0.25
!  fpackfix          0.23   0.25
!  fexpand           0.17   0.13
!  fpmerge           0.25   0.15
!  fmul8x16          0.25   0.28
!  fmul8x16au        0.07   0.08
!  fmul8x16al        0.16   0.25
!  fmul8sux16        0.20   0.18
!  fmul8ulx16        0.11   0.10
!  fmuld8sux16       0.00   0.00
!  fmuld8ulx16       0.05   0.03
!  alignaddr         0.09   0.05
!  alignaddrl        0.27   0.25
!  faligndata        0.07   0.10
!  fzero             0.08   0.03
!  fzeros            0.21   0.15
!  fone              0.07   0.00
!  fones             0.07   0.05
!  fsrc1             0.23   0.20
!  fsrc1s            0.11   0.18
!  fsrc2             0.16   0.10
!  fsrc2s            0.07   0.13
!  fnot1             0.08   0.08
!  fnot1s            0.04   0.03
!  fnot2             0.22   0.31
!  fnot2s            0.06   0.05
!  for               0.23   0.33
!  fors              0.10   0.05
!  fnor              0.06   0.05
!  fnors             0.10   0.10
!  fand              0.22   0.28
!  fands             0.09   0.10
!  fnand             0.15   0.15
!  fnands            0.13   0.15
!  fxor              0.13   0.20
!  fxors             0.03   0.05
!  fxnor             0.12   0.08
!  fxnors            0.13   0.08
!  fornot1           0.12   0.13
!  fornot1s          0.03   0.00
!  fornot2           0.04   0.08
!  fornot2s          0.15   0.20
!  fandnot1          0.28   0.28
!  fandnot1s         0.09   0.13
!  fandnot2          0.16   0.18
!  fandnot2s         0.28   0.28
!  fcmpgt16          0.06   0.05
!  fcmpgt32          0.25   0.13
!  fcmple16          0.10   0.13
!  fcmple32          0.27   0.18
!  fcmpne16          0.14   0.10
!  fcmpne32          0.27   0.38
!  fcmpeq16          0.03   0.05
!  fcmpeq32          0.16   0.23
!  edge8             0.20   0.25
!  edge8l            0.26   0.25
!  edge16            0.01   0.03
!  edge16l           0.26   0.15
!  edge32            0.25   0.25
!  edge32l           0.09   0.03
!  pdist             0.13   0.08
!  partial_st8       0.09   0.05
!  partial_st16      0.22   0.25
!  partial_st32      0.20   0.23
!  short_st8         0.09   0.15
!  short_st16        0.11   0.15
!  short_ld8         0.01   0.00
!  short_ld16        0.27   0.20
!  blkld             0.12   0.00
!  blkst             0.24   0.00
!  blkld_offset      0.13   0.00
!  blkst_offset      0.27   0.00
!  blk_check         0.15   0.13
!  casxa             0.27   0.18
!  rdccr             0.01   0.00
!  rdfprs            0.28   0.36
!  wrccr             0.05   0.08
!  popc              0.21   0.18
!  wrfprs            0.08   0.00
!  stx               0.11   0.18
!  stxa              0.05   0.00
!  cflush            0.00   0.00
!  array8            0.05   0.03
!  array16           0.12   0.03
!  array32           0.02   0.03
!  edge8n            0.15   0.18
!  edge8ln           0.07   0.08
!  edge16n           0.14   0.15
!  edge16ln          0.16   0.18
!  edge32n           0.18   0.20
!  edge32ln          0.25   0.31
!  bmask             0.12   0.13
!  bshuffle          0.21   0.25
!  siam              0.14   0.20
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
KDATA_MODULE(t0_module_offset_table, 0x0748e000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0xffffffe8
	.word	0x00000010
	.word	0x00000000
	.word	0x00000008
	.word	0xfffffff8
	.word	0xffffffe0
	.word	0xfffffff0
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

KDATA_MODULE(t0_module_data_in_regs, 0x02c90000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0x7e260454          ! %f0
	.word	0xeb017be9          ! %f1
	.word	0xd22b7602          ! %f2
	.word	0x1b25144b          ! %f3
	.word	0xb59883f6          ! %f4
	.word	0x90239c26          ! %f5
	.word	0x43905371          ! %f6
	.word	0x224b9c8e          ! %f7
	.word	0xe777d29c          ! %f8
	.word	0x45708506          ! %f9
	.word	0x0debfdb8          ! %f10
	.word	0x2b462a7a          ! %f11
	.word	0x03e401de          ! %f12
	.word	0x72d97ca3          ! %f13
	.word	0x585913e1          ! %f14
	.word	0xbb84f9c9          ! %f15
	.word	0xeeae4912          ! %f16
	.word	0x5075af04          ! %f17
	.word	0xc9cc28ec          ! %f18
	.word	0xf156e369          ! %f19
	.word	0x9b0c5a01          ! %f20
	.word	0xfde6f6c3          ! %f21
	.word	0x3a70899a          ! %f22
	.word	0x999610c8          ! %f23
	.word	0xa9dfccdd          ! %f24
	.word	0x2eb00bef          ! %f25
	.word	0x74ab0b87          ! %f26
	.word	0x22561f51          ! %f27
	.word	0x6773d772          ! %f28
	.word	0xa2843d33          ! %f29
	.word	0xf492397e          ! %f30
	.word	0xce527835          ! %f31
	.word	0xb502c39c          ! %f32
	.word	0x46771737          ! %f33
	.word	0xe1cc7108          ! %f34
	.word	0x4383e06e          ! %f35
	.word	0x5977d8f8          ! %f36
	.word	0x59749e46          ! %f37
	.word	0xf5b9c546          ! %f38
	.word	0x20308500          ! %f39
	.word	0x2af9adde          ! %f40
	.word	0x99d0fe30          ! %f41
	.word	0xd7d8bb00          ! %f42
	.word	0x8d3a0781          ! %f43
	.word	0x7b14138e          ! %f44
	.word	0xd548d471          ! %f45
	.word	0x41b231fd          ! %f46
	.word	0x6ea14edc          ! %f47
	.word	0x991811a8          ! %f48
	.word	0x0eb97892          ! %f49
	.word	0x138a0f94          ! %f50
	.word	0x84702051          ! %f51
	.word	0x3cbba4e1          ! %f52
	.word	0x4f6ae6cf          ! %f53
	.word	0x60d77e83          ! %f54
	.word	0x72b4c4bf          ! %f55
	.word	0x556a34f4          ! %f56
	.word	0x8b3b30f9          ! %f57
	.word	0x6860d7fe          ! %f58
	.word	0xaf3c3e25          ! %f59
	.word	0x5c51f5d5          ! %f60
	.word	0x4995999d          ! %f61
	.word	0xc5048a0b          ! %f62
	.word	0xf37bd166          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x8d8       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0x457cfef1          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x9908a0b3          ! %o0
	.word	0xeb2a27bc          ! %o1
	.word	0xa9dddfa0          ! %o2
	.word	0xda481695          ! %o3
	.word	0x5d4df12e          ! %o4
	.word	0x9f91363a          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x9f49a82c          ! %l0
	.word	0xf71dbd66          ! %l1
	.word	0xdaf98f0c          ! %l2
	.word	0x40e2e84b          ! %l3
	.word	0x7c6d6d01          ! %l4
	.word	0x6f996ebf          ! %l5
	.word	0x5ee74a9d          ! %l6
	.word	0x41da8fce          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0xfffffffc          ! %i2 (byte offset)
	.word	0xfffffff6          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0x00000000          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8c355395          ! %y
	.word	0x0000000c          ! %icc (nzvc)
	.word	0xc0000041          ! %fsr
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

KDATA_MODULE(t0_module_data_in_stack, 0x54c34000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0x677cf5c8
	.word	0x8795e608
	.word	0x157f96ad
	.word	0x0dd9b9fd
	.word	0x9c2328f6
	.word	0xded876ac
	.word	0x3506c737
	.word	0xdd22899a
	.word	0x156ce2de
	.word	0xa464ec41
	.word	0x09127cc2
	.word	0x947b3632
	.word	0xe936f97e
	.word	0xb02a337e
	.word	0xda89dee5
	.word	0xd0839706
	.word	0x465ffd11
	.word	0x1b1d8cb3
	.word	0x2d47dcd5
	.word	0xad4f95a2
	.word	0xe44796a1
	.word	0xafdec8c5
	.word	0xfc8ac017
	.word	0x15a65c86
	.word	0xbbccbbdf
	.word	0xb0f4d276
	.word	0x08bdb67d
	.word	0xb8b34c08
	.word	0x19dacc36
	.word	0xad7307e9
	.word	0xedfc874f
	.word	0x18d6d978
	.word	0x8402eb1d
	.word	0xbadc2865
	.word	0xd400e7c7
	.word	0x2083bc85
	.word	0x61a02bac
	.word	0x7d1fda58
	.word	0x9f2c22c2
	.word	0x61f70ede
	.word	0xecda6172
	.word	0xa7dc0d9f
	.word	0x465707b5
	.word	0x5260421c
	.word	0xafc4aa85
	.word	0x56dbbe04
	.word	0x2d3d54dd
	.word	0x4af80fde
	.word	0x301206d9
	.word	0xc360da07
	.word	0x6ef910ba
	.word	0x20d3c835
	.word	0x68ab90d5
	.word	0x805f51e1
	.word	0xe25586bd
	.word	0x9934a242
	.word	0x21192b23
	.word	0xd5ab92c5
	.word	0x4a08db3f
	.word	0xa9e8f31e
	.word	0x0066b7c7
	.word	0xd97ef268
	.word	0xc05e6ab5
	.word	0x3e4f6ef9
	.word	0xa13d2c73
	.word	0x1cd8cec3
	.word	0x9fcb6822
	.word	0x6fead885
	.word	0xc0881818
	.word	0xba6b6617
	.word	0x438a6ecc
	.word	0xb776c294
	.word	0x84756dc0
	.word	0x352fab31
	.word	0x43f1fb32
	.word	0x675447ff
	.word	0x8826a89a
	.word	0x33ab99ef
	.word	0xc504ff3c
	.word	0xbc2fddca
	.word	0xde479d56
	.word	0xebaad002
	.word	0xf9fc05b4
	.word	0x5b2fa385
	.word	0x3b308cb3
	.word	0x27e16df5
	.word	0xc97898f5
	.word	0x300bd5f4
	.word	0x637e4b55
	.word	0xa1ed846d
	.word	0x1afbe0e1
	.word	0x2f6947f2
	.word	0x5f6492db
	.word	0xe7ab91b1
	.word	0x9254ac17
	.word	0x94e80592
	.word	0xaaabd031
	.word	0xdf16d36c
	.word	0x98485865
	.word	0x36d68586
	.word	0x168d0322
	.word	0xf03670b2
	.word	0x7bfd4e7c
	.word	0x8d9c0cc4
	.word	0x9ab38330
	.word	0xe524c040
	.word	0x1de504e2
	.word	0x08f32866
	.word	0x3ed5bda7
	.word	0x2d4e2f07
	.word	0x0e4ebe2c
	.word	0x5b3761d1
	.word	0x43d340ef
	.word	0xa6d98aeb
	.word	0xe6ab766b
	.word	0x01979119
	.word	0x0357a922
	.word	0xa803b5c7
	.word	0x281eb3e6
	.word	0xa13071a4
	.word	0xb4e741de
	.word	0x465504b4
	.word	0x4b7f2f09
	.word	0xdb295d0c
	.word	0x9033715b
	.word	0xdb36cf8b
	.word	0x59a5859e
	.word	0x27275049
	.word	0x1be240bf
	.word	0x58d3f4a7
	.word	0x36166d3a
	.word	0xa2089f0f
	.word	0xeed595b0
	.word	0xff9754ef
	.word	0x54f918f9
	.word	0xc11df975
	.word	0xa5b3f12b
	.word	0x88478c13
	.word	0x6721c66d
	.word	0x963ba7d7
	.word	0x483dc793
	.word	0x80ef6914
	.word	0x5703a5d2
	.word	0x014820fc
	.word	0x1f17c60d
	.word	0xcfb6eb0a
	.word	0xeedc9187
	.word	0x6e9b5e7a
	.word	0xec63990a
	.word	0x76c8c621
	.word	0x8ea048b9
	.word	0xd8d49358
	.word	0x4d060824
	.word	0x7b9cb4e4
	.word	0x4e502161
	.word	0xd70228f5
	.word	0x87127b2e
	.word	0x6abf19bd
	.word	0xd2c7656f
	.word	0xd7522629
	.word	0x50c13c85
	.word	0x4bb2b4bc
	.word	0x76d3cf47
	.word	0xf13f64a9
	.word	0xdbd70cac
	.word	0xef117197
	.word	0x6bf4d96c
	.word	0x4a9238b0
t0_data_in_sp:
	.word	0x30b9db18
	.word	0x8fdd91f1
	.word	0x4493d57a
	.word	0x16d16eda
	.word	0x3bd7b847
	.word	0x8844b7df
	.word	0x5031fe59
	.word	0x1b2ac452
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xfffffff5
	.word	0x0000001c
	.word	0x0000001c
	.word	0x00000018
	.word	t0_data_in_fp
	.word	0x34e93fca
	.word	0xf46d7c96
	.word	0xe3f9fd1b
	.word	0x194d6b91
	.word	0x0c117a44
	.word	0x2a8b078f
	.word	0xb8728635
	.word	0x48baec3c
	.word	0x6ed56211
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
	.word   	0xc10aedb5	! [%fp - 0xc]
	.word   	0x6d4d8238	! [%fp - 0x8]
	.word   	0x7ab0d5ec	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x696c59f3
	.word	0xb5e81b35
	.word	0x413779dc
	.word	0x462f38fd
	.word	0xd9672972
	.word	0x4ad44efd
	.word	0x668f1e7c
	.word	0x7ea6385f
	.word	0xd7d79924
	.word	0xd52abbb3
	.word	0x833f09f8
	.word	0xe44395aa
	.word	0xf09f0f2e
	.word	0xacb743e8
	.word	0xf39918dc
	.word	0xff846a74
	.word	0x3d6bf00a
	.word	0x7b38c58d
	.word	0xdb8ac2c1
	.word	0xb018a2e6
	.word	0xf525c789
	.word	0xc1f828a5
	.word	0x651414f3
	.word	0xf1eb0d8d
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x190a6000)
.seg "data"
t0_data_in_area0_start:
.skip 512
t0_data_in_area0_begin:
	.word	0xfe047e1b	! t0_data_in_area0-0x20
	.word	0xfa35253b	! t0_data_in_area0-0x1c
	.word	0x5d613353	! t0_data_in_area0-0x18
	.word	0x34fa146d	! t0_data_in_area0-0x14
	.word	0x018f1e4e	! t0_data_in_area0-0x10
	.word	0x8bc4f497	! t0_data_in_area0-0xc
	.word	0x3d80837f	! t0_data_in_area0-0x8
	.word	0xbada735b	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x9a82ee94	! t0_data_in_area0+0x0
	.word	0xb24e61ac	! t0_data_in_area0+0x4
	.word	0x7eade62f	! t0_data_in_area0+0x8
	.word	0xb07e7f8c	! t0_data_in_area0+0xc
	.word	0xad6be349	! t0_data_in_area0+0x10
	.word	0xc051ecd3	! t0_data_in_area0+0x14
	.word	0x76cda2e2	! t0_data_in_area0+0x18
	.word	0xf171d468	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 7616
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x10a20000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x51c3acf3	! t0_data_in_shm_area+0x0 (t0)
	.word	0x66e3f6be	! t0_data_in_shm_area+0x4 (t0)
	.word	0x5637e9b9	! t0_data_in_shm_area+0x8 (t0)
	.word	0x646279a4	! t0_data_in_shm_area+0xc (t0)
	.word	0xe2fce6ca	! t0_data_in_shm_area+0x10 (t0)
	.word	0x5cea26a6	! t0_data_in_shm_area+0x14 (t0)
	.word	0xd6a00fa1	! t0_data_in_shm_area+0x18 (t0)
	.word	0xdccdd68f	! t0_data_in_shm_area+0x1c (t0)
	.word	0xa334297b	! t0_data_in_shm_area+0x20 (t0)
	.word	0x000c7fc7	! t0_data_in_shm_area+0x24 (t0)
	.word	0xb9f0e8b8	! t0_data_in_shm_area+0x28 (t0)
	.word	0x243906ab	! t0_data_in_shm_area+0x2c (t0)
	.word	0x94990628	! t0_data_in_shm_area+0x30 (t0)
	.word	0x179dda0d	! t0_data_in_shm_area+0x34 (t0)
	.word	0x01a9e4e9	! t0_data_in_shm_area+0x38 (t0)
	.word	0xd3c1637e	! t0_data_in_shm_area+0x3c (t0)
	.word	0xdf3d2db3	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x75c6b20f	! t0_data_in_shm_area+0x44
	.word	0x51ded2d8	! t0_data_in_shm_area+0x48
	.word	0xa64b57aa	! t0_data_in_shm_area+0x4c
	.word	0xcf18483c	! t0_data_in_shm_area+0x50
	.word	0xb878843c	! t0_data_in_shm_area+0x54
	.word	0xe8b66d05	! t0_data_in_shm_area+0x58
	.word	0xe162cf3b	! t0_data_in_shm_area+0x5c
	.word	0x85f340e7	! t0_data_in_shm_area+0x60
	.word	0x415f2753	! t0_data_in_shm_area+0x64
	.word	0x0262152b	! t0_data_in_shm_area+0x68
	.word	0xf041d940	! t0_data_in_shm_area+0x6c
	.word	0x3ed609e2	! t0_data_in_shm_area+0x70
	.word	0xb568da18	! t0_data_in_shm_area+0x74
	.word	0x1c4b61e9	! t0_data_in_shm_area+0x78
	.word	0xb6a74e9c	! t0_data_in_shm_area+0x7c
	.word	0x10bf1ca6	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xf8d4f844	! t0_data_in_shm_area+0x84
	.word	0xe6da62a4	! t0_data_in_shm_area+0x88
	.word	0xf170921d	! t0_data_in_shm_area+0x8c
	.word	0x9d1c3a7c	! t0_data_in_shm_area+0x90
	.word	0xe7448abc	! t0_data_in_shm_area+0x94
	.word	0x8e01bdaa	! t0_data_in_shm_area+0x98
	.word	0xfe86bdcd	! t0_data_in_shm_area+0x9c
	.word	0xe7f03142	! t0_data_in_shm_area+0xa0
	.word	0xa7472706	! t0_data_in_shm_area+0xa4
	.word	0x73ec0c9b	! t0_data_in_shm_area+0xa8
	.word	0xfde0d188	! t0_data_in_shm_area+0xac
	.word	0xa409a86e	! t0_data_in_shm_area+0xb0
	.word	0xd191d1f8	! t0_data_in_shm_area+0xb4
	.word	0x48f81b04	! t0_data_in_shm_area+0xb8
	.word	0x9f61b6ce	! t0_data_in_shm_area+0xbc
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x53336000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0x7e260454          ! %f0
	.word	0xeb017be9          ! %f1
	.word	0xd22b7602          ! %f2
	.word	0x1b25144b          ! %f3
	.word	0xb59883f6          ! %f4
	.word	0x90239c26          ! %f5
	.word	0x43905371          ! %f6
	.word	0x224b9c8e          ! %f7
	.word	0xe777d29c          ! %f8
	.word	0x45708506          ! %f9
	.word	0x0debfdb8          ! %f10
	.word	0x2b462a7a          ! %f11
	.word	0x03e401de          ! %f12
	.word	0x72d97ca3          ! %f13
	.word	0x585913e1          ! %f14
	.word	0xbb84f9c9          ! %f15
	.word	0xeeae4912          ! %f16
	.word	0x5075af04          ! %f17
	.word	0xc9cc28ec          ! %f18
	.word	0xf156e369          ! %f19
	.word	0x9b0c5a01          ! %f20
	.word	0xfde6f6c3          ! %f21
	.word	0x3a70899a          ! %f22
	.word	0x999610c8          ! %f23
	.word	0xa9dfccdd          ! %f24
	.word	0x2eb00bef          ! %f25
	.word	0x74ab0b87          ! %f26
	.word	0x22561f51          ! %f27
	.word	0x6773d772          ! %f28
	.word	0xa2843d33          ! %f29
	.word	0xf492397e          ! %f30
	.word	0xce527835          ! %f31
	.word	0xb502c39c          ! %f32
	.word	0x46771737          ! %f33
	.word	0xe1cc7108          ! %f34
	.word	0x4383e06e          ! %f35
	.word	0x5977d8f8          ! %f36
	.word	0x59749e46          ! %f37
	.word	0xf5b9c546          ! %f38
	.word	0x20308500          ! %f39
	.word	0x2af9adde          ! %f40
	.word	0x99d0fe30          ! %f41
	.word	0xd7d8bb00          ! %f42
	.word	0x8d3a0781          ! %f43
	.word	0x7b14138e          ! %f44
	.word	0xd548d471          ! %f45
	.word	0x41b231fd          ! %f46
	.word	0x6ea14edc          ! %f47
	.word	0x991811a8          ! %f48
	.word	0x0eb97892          ! %f49
	.word	0x138a0f94          ! %f50
	.word	0x84702051          ! %f51
	.word	0x3cbba4e1          ! %f52
	.word	0x4f6ae6cf          ! %f53
	.word	0x60d77e83          ! %f54
	.word	0x72b4c4bf          ! %f55
	.word	0x556a34f4          ! %f56
	.word	0x8b3b30f9          ! %f57
	.word	0x6860d7fe          ! %f58
	.word	0xaf3c3e25          ! %f59
	.word	0x5c51f5d5          ! %f60
	.word	0x4995999d          ! %f61
	.word	0xc5048a0b          ! %f62
	.word	0xf37bd166          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x8d8       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0x457cfef1          ! %g3 (loop index)
	.word	SYM(t0_subr1)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0x9908a0b3          ! %o0
	.word	0xeb2a27bc          ! %o1
	.word	0xa9dddfa0          ! %o2
	.word	0xda481695          ! %o3
	.word	0x5d4df12e          ! %o4
	.word	0x9f91363a          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x9f49a82c          ! %l0
	.word	0xf71dbd66          ! %l1
	.word	0xdaf98f0c          ! %l2
	.word	0x40e2e84b          ! %l3
	.word	0x7c6d6d01          ! %l4
	.word	0x6f996ebf          ! %l5
	.word	0x5ee74a9d          ! %l6
	.word	0x41da8fce          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0xfffffffc          ! %i2 (byte offset)
	.word	0xfffffff6          ! %i3 (halfword offset)
	.word	0x00000008          ! %i4 (word offset)
	.word	0x00000000          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x8c355395          ! %y
	.word	0x0000000c          ! %icc (nzvc)
	.word	0xc0000041          ! %fsr
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

KDATA_MODULE(t0_module_data_exp_stack, 0x1dca4000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0x677cf5c8
	.word	0x8795e608
	.word	0x157f96ad
	.word	0x0dd9b9fd
	.word	0x9c2328f6
	.word	0xded876ac
	.word	0x3506c737
	.word	0xdd22899a
	.word	0x156ce2de
	.word	0xa464ec41
	.word	0x09127cc2
	.word	0x947b3632
	.word	0xe936f97e
	.word	0xb02a337e
	.word	0xda89dee5
	.word	0xd0839706
	.word	0x465ffd11
	.word	0x1b1d8cb3
	.word	0x2d47dcd5
	.word	0xad4f95a2
	.word	0xe44796a1
	.word	0xafdec8c5
	.word	0xfc8ac017
	.word	0x15a65c86
	.word	0xbbccbbdf
	.word	0xb0f4d276
	.word	0x08bdb67d
	.word	0xb8b34c08
	.word	0x19dacc36
	.word	0xad7307e9
	.word	0xedfc874f
	.word	0x18d6d978
	.word	0x8402eb1d
	.word	0xbadc2865
	.word	0xd400e7c7
	.word	0x2083bc85
	.word	0x61a02bac
	.word	0x7d1fda58
	.word	0x9f2c22c2
	.word	0x61f70ede
	.word	0xecda6172
	.word	0xa7dc0d9f
	.word	0x465707b5
	.word	0x5260421c
	.word	0xafc4aa85
	.word	0x56dbbe04
	.word	0x2d3d54dd
	.word	0x4af80fde
	.word	0x301206d9
	.word	0xc360da07
	.word	0x6ef910ba
	.word	0x20d3c835
	.word	0x68ab90d5
	.word	0x805f51e1
	.word	0xe25586bd
	.word	0x9934a242
	.word	0x21192b23
	.word	0xd5ab92c5
	.word	0x4a08db3f
	.word	0xa9e8f31e
	.word	0x0066b7c7
	.word	0xd97ef268
	.word	0xc05e6ab5
	.word	0x3e4f6ef9
	.word	0xa13d2c73
	.word	0x1cd8cec3
	.word	0x9fcb6822
	.word	0x6fead885
	.word	0xc0881818
	.word	0xba6b6617
	.word	0x438a6ecc
	.word	0xb776c294
	.word	0x84756dc0
	.word	0x352fab31
	.word	0x43f1fb32
	.word	0x675447ff
	.word	0x8826a89a
	.word	0x33ab99ef
	.word	0xc504ff3c
	.word	0xbc2fddca
	.word	0xde479d56
	.word	0xebaad002
	.word	0xf9fc05b4
	.word	0x5b2fa385
	.word	0x3b308cb3
	.word	0x27e16df5
	.word	0xc97898f5
	.word	0x300bd5f4
	.word	0x637e4b55
	.word	0xa1ed846d
	.word	0x1afbe0e1
	.word	0x2f6947f2
	.word	0x5f6492db
	.word	0xe7ab91b1
	.word	0x9254ac17
	.word	0x94e80592
	.word	0xaaabd031
	.word	0xdf16d36c
	.word	0x98485865
	.word	0x36d68586
	.word	0x168d0322
	.word	0xf03670b2
	.word	0x7bfd4e7c
	.word	0x8d9c0cc4
	.word	0x9ab38330
	.word	0xe524c040
	.word	0x1de504e2
	.word	0x08f32866
	.word	0x3ed5bda7
	.word	0x2d4e2f07
	.word	0x0e4ebe2c
	.word	0x5b3761d1
	.word	0x43d340ef
	.word	0xa6d98aeb
	.word	0xe6ab766b
	.word	0x01979119
	.word	0x0357a922
	.word	0xa803b5c7
	.word	0x281eb3e6
	.word	0xa13071a4
	.word	0xb4e741de
	.word	0x465504b4
	.word	0x4b7f2f09
	.word	0xdb295d0c
	.word	0x9033715b
	.word	0xdb36cf8b
	.word	0x59a5859e
	.word	0x27275049
	.word	0x1be240bf
	.word	0x58d3f4a7
	.word	0x36166d3a
	.word	0xa2089f0f
	.word	0xeed595b0
	.word	0xff9754ef
	.word	0x54f918f9
	.word	0xc11df975
	.word	0xa5b3f12b
	.word	0x88478c13
	.word	0x6721c66d
	.word	0x963ba7d7
	.word	0x483dc793
	.word	0x80ef6914
	.word	0x5703a5d2
	.word	0x014820fc
	.word	0x1f17c60d
	.word	0xcfb6eb0a
	.word	0xeedc9187
	.word	0x6e9b5e7a
	.word	0xec63990a
	.word	0x76c8c621
	.word	0x8ea048b9
	.word	0xd8d49358
	.word	0x4d060824
	.word	0x7b9cb4e4
	.word	0x4e502161
	.word	0xd70228f5
	.word	0x87127b2e
	.word	0x6abf19bd
	.word	0xd2c7656f
	.word	0xd7522629
	.word	0x50c13c85
	.word	0x4bb2b4bc
	.word	0x76d3cf47
	.word	0xf13f64a9
	.word	0xdbd70cac
	.word	0xef117197
	.word	0x6bf4d96c
	.word	0x4a9238b0
t0_data_exp_sp:
	.word	0x30b9db18
	.word	0x8fdd91f1
	.word	0x4493d57a
	.word	0x16d16eda
	.word	0x3bd7b847
	.word	0x8844b7df
	.word	0x5031fe59
	.word	0x1b2ac452
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xfffffff5
	.word	0x0000001c
	.word	0x0000001c
	.word	0x00000018
	.word	t0_data_exp_fp
	.word	0x34e93fca
	.word	0xf46d7c96
	.word	0xe3f9fd1b
	.word	0x194d6b91
	.word	0x0c117a44
	.word	0x2a8b078f
	.word	0xb8728635
	.word	0x48baec3c
	.word	0x6ed56211
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
	.word   	0xc10aedb5	! [%fp - 0xc]
	.word   	0x6d4d8238	! [%fp - 0x8]
	.word   	0x7ab0d5ec	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x696c59f3
	.word	0xb5e81b35
	.word	0x413779dc
	.word	0x462f38fd
	.word	0xd9672972
	.word	0x4ad44efd
	.word	0x668f1e7c
	.word	0x7ea6385f
	.word	0xd7d79924
	.word	0xd52abbb3
	.word	0x833f09f8
	.word	0xe44395aa
	.word	0xf09f0f2e
	.word	0xacb743e8
	.word	0xf39918dc
	.word	0xff846a74
	.word	0x3d6bf00a
	.word	0x7b38c58d
	.word	0xdb8ac2c1
	.word	0xb018a2e6
	.word	0xf525c789
	.word	0xc1f828a5
	.word	0x651414f3
	.word	0xf1eb0d8d
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x51360000)
.seg "data"
t0_data_exp_area0_start:
.skip 512
t0_data_exp_area0_begin:
	.word	0xfe047e1b	! t0_data_exp_area0-0x20
	.word	0xfa35253b	! t0_data_exp_area0-0x1c
	.word	0x5d613353	! t0_data_exp_area0-0x18
	.word	0x34fa146d	! t0_data_exp_area0-0x14
	.word	0x018f1e4e	! t0_data_exp_area0-0x10
	.word	0x8bc4f497	! t0_data_exp_area0-0xc
	.word	0x3d80837f	! t0_data_exp_area0-0x8
	.word	0xbada735b	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x9a82ee94	! t0_data_exp_area0+0x0
	.word	0xb24e61ac	! t0_data_exp_area0+0x4
	.word	0x7eade62f	! t0_data_exp_area0+0x8
	.word	0xb07e7f8c	! t0_data_exp_area0+0xc
	.word	0xad6be349	! t0_data_exp_area0+0x10
	.word	0xc051ecd3	! t0_data_exp_area0+0x14
	.word	0x76cda2e2	! t0_data_exp_area0+0x18
	.word	0xf171d468	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 7616
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x6d884000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x51c3acf3	! t0_data_exp_shm_area+0x0 (t0)
	.word	0x66e3f6be	! t0_data_exp_shm_area+0x4 (t0)
	.word	0x5637e9b9	! t0_data_exp_shm_area+0x8 (t0)
	.word	0x646279a4	! t0_data_exp_shm_area+0xc (t0)
	.word	0xe2fce6ca	! t0_data_exp_shm_area+0x10 (t0)
	.word	0x5cea26a6	! t0_data_exp_shm_area+0x14 (t0)
	.word	0xd6a00fa1	! t0_data_exp_shm_area+0x18 (t0)
	.word	0xdccdd68f	! t0_data_exp_shm_area+0x1c (t0)
	.word	0xa334297b	! t0_data_exp_shm_area+0x20 (t0)
	.word	0x000c7fc7	! t0_data_exp_shm_area+0x24 (t0)
	.word	0xb9f0e8b8	! t0_data_exp_shm_area+0x28 (t0)
	.word	0x243906ab	! t0_data_exp_shm_area+0x2c (t0)
	.word	0x94990628	! t0_data_exp_shm_area+0x30 (t0)
	.word	0x179dda0d	! t0_data_exp_shm_area+0x34 (t0)
	.word	0x01a9e4e9	! t0_data_exp_shm_area+0x38 (t0)
	.word	0xd3c1637e	! t0_data_exp_shm_area+0x3c (t0)
	.word	0xdf3d2db3	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x75c6b20f	! t0_data_exp_shm_area+0x44
	.word	0x51ded2d8	! t0_data_exp_shm_area+0x48
	.word	0xa64b57aa	! t0_data_exp_shm_area+0x4c
	.word	0xcf18483c	! t0_data_exp_shm_area+0x50
	.word	0xb878843c	! t0_data_exp_shm_area+0x54
	.word	0xe8b66d05	! t0_data_exp_shm_area+0x58
	.word	0xe162cf3b	! t0_data_exp_shm_area+0x5c
	.word	0x85f340e7	! t0_data_exp_shm_area+0x60
	.word	0x415f2753	! t0_data_exp_shm_area+0x64
	.word	0x0262152b	! t0_data_exp_shm_area+0x68
	.word	0xf041d940	! t0_data_exp_shm_area+0x6c
	.word	0x3ed609e2	! t0_data_exp_shm_area+0x70
	.word	0xb568da18	! t0_data_exp_shm_area+0x74
	.word	0x1c4b61e9	! t0_data_exp_shm_area+0x78
	.word	0xb6a74e9c	! t0_data_exp_shm_area+0x7c
	.word	0x10bf1ca6	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xf8d4f844	! t0_data_exp_shm_area+0x84
	.word	0xe6da62a4	! t0_data_exp_shm_area+0x88
	.word	0xf170921d	! t0_data_exp_shm_area+0x8c
	.word	0x9d1c3a7c	! t0_data_exp_shm_area+0x90
	.word	0xe7448abc	! t0_data_exp_shm_area+0x94
	.word	0x8e01bdaa	! t0_data_exp_shm_area+0x98
	.word	0xfe86bdcd	! t0_data_exp_shm_area+0x9c
	.word	0xe7f03142	! t0_data_exp_shm_area+0xa0
	.word	0xa7472706	! t0_data_exp_shm_area+0xa4
	.word	0x73ec0c9b	! t0_data_exp_shm_area+0xa8
	.word	0xfde0d188	! t0_data_exp_shm_area+0xac
	.word	0xa409a86e	! t0_data_exp_shm_area+0xb0
	.word	0xd191d1f8	! t0_data_exp_shm_area+0xb4
	.word	0x48f81b04	! t0_data_exp_shm_area+0xb8
	.word	0x9f61b6ce	! t0_data_exp_shm_area+0xbc
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



