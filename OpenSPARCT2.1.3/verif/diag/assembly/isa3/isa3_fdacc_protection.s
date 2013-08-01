/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fdacc_protection.s
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


#define ENABLE_T0_Tag_Overflow_0x23	1
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
#define T0_KAOS_SEED          000000000267
#define T0_KAOS_ICOUNT        10
#define T0_KAOS_AREAS         1
#define T0_KAOS_AREASIZE      64
#define T0_KAOS_AREAOFFSET    3328
#define T0_KAOS_PAGESIZE      8192
#define T0_KAOS_CODECOUNT     11

#define T0_KAOS_BOOT_VA                  0x09442000
#define T0_KAOS_BOOT_PA                  0x000000000edaa000
#define T0_KAOS_BOOT_CACHEABLE           1
#define T0_KAOS_BOOT_NONCACHEABLE        0

#define T0_KAOS_STARTUP_VA               0x0da10000
#define T0_KAOS_STARTUP_PA               0x00000000087f8000
#define T0_KAOS_STARTUP_CACHEABLE        1
#define T0_KAOS_STARTUP_NONCACHEABLE     0

#define T0_KAOS_OFFSET_TBL_VA            0x00e44000
#define T0_KAOS_OFFSET_TBL_PA            0x0000000007392000
#define T0_KAOS_OFFSET_TBL_CACHEABLE     1
#define T0_KAOS_OFFSET_TBL_NONCACHEABLE  0

#define T0_KAOS_DONE_VA                  0x0a50a000
#define T0_KAOS_DONE_PA                  0x0000000002e84000
#define T0_KAOS_DONE_CACHEABLE           1
#define T0_KAOS_DONE_NONCACHEABLE        0

#define T0_KAOS_KTBL_VA                  0x0c7d8000
#define T0_KAOS_KTBL_PA                  0x0000000005f1a000
#define T0_KAOS_KTBL_CACHEABLE           1
#define T0_KAOS_KTBL_NONCACHEABLE        0

#define T0_KAOS_SUBR0_VA                 0x0c83e000
#define T0_KAOS_SUBR0_PA                 0x0000000006414000
#define T0_KAOS_SUBR0_CACHEABLE          1
#define T0_KAOS_SUBR0_NONCACHEABLE       0
#define T0_KAOS_SUBR1_VA                 0x0c93c000
#define T0_KAOS_SUBR1_PA                 0x0000000000760000
#define T0_KAOS_SUBR1_CACHEABLE          1
#define T0_KAOS_SUBR1_NONCACHEABLE       0
#define T0_KAOS_SUBR2_VA                 0x05a72000
#define T0_KAOS_SUBR2_PA                 0x0000000003c08000
#define T0_KAOS_SUBR2_CACHEABLE          1
#define T0_KAOS_SUBR2_NONCACHEABLE       0
#define T0_KAOS_SUBR3_VA                 0x0c5c6000
#define T0_KAOS_SUBR3_PA                 0x000000000724c000
#define T0_KAOS_SUBR3_CACHEABLE          1
#define T0_KAOS_SUBR3_NONCACHEABLE       0

#define T0_KAOS_EXP_REGS_VA              0x00daa000
#define T0_KAOS_EXP_REGS_PA              0x000000000679e000
#define T0_KAOS_EXP_REGS_CACHEABLE       1
#define T0_KAOS_EXP_REGS_NONCACHEABLE    0
#define T0_KAOS_RUN_REGS_VA              0x013ca000
#define T0_KAOS_RUN_REGS_PA              0x000000000e548000
#define T0_KAOS_RUN_REGS_CACHEABLE       1
#define T0_KAOS_RUN_REGS_NONCACHEABLE    0

#define T0_KAOS_EXP_STACK_VA             0x0d042000
#define T0_KAOS_EXP_STACK_PA             0x0000000003622000
#define T0_KAOS_EXP_STACK_CACHEABLE      1
#define T0_KAOS_EXP_STACK_NONCACHEABLE   0
#define T0_KAOS_RUN_STACK_VA             0x06622000
#define T0_KAOS_RUN_STACK_PA             0x0000000000cf2000
#define T0_KAOS_RUN_STACK_CACHEABLE      1
#define T0_KAOS_RUN_STACK_NONCACHEABLE   0

#define T0_KAOS_AREA0
#define T0_KAOS_EXP_AREA0_VA             0x0da6e000
#define T0_KAOS_EXP_AREA0_PA             0x0000000009c86000
#define T0_KAOS_EXP_AREA0_CACHEABLE      1
#define T0_KAOS_EXP_AREA0_NONCACHEABLE   0
#define T0_KAOS_RUN_AREA0_VA             0x03ed2000
#define T0_KAOS_RUN_AREA0_PA             0x000000000623e000
#define T0_KAOS_RUN_AREA0_CACHEABLE      1
#define T0_KAOS_RUN_AREA0_NONCACHEABLE   0

#define T0_KAOS_SHM_AREA
#define T0_KAOS_EXP_SHM_AREA_VA          0x0d720000
#define T0_KAOS_EXP_SHM_AREA_PA          0x000000000e058000
#define T0_KAOS_EXP_SHM_AREA_CACHEABLE   1
#define T0_KAOS_EXP_SHM_AREA_NONCACHEABLE 0
#define T0_KAOS_RUN_SHM_AREA_VA          0x0a816000
#define T0_KAOS_RUN_SHM_AREA_PA          0x0000000004c86000
#define T0_KAOS_RUN_SHM_AREA_CACHEABLE   1
#define T0_KAOS_RUN_SHM_AREA_NONCACHEABLE 0

#define T0_KAOS_RANVAL_00     0x23ecb37c
#define T0_KAOS_RANVAL_01     0x9bdc03d9
#define T0_KAOS_RANVAL_02     0x36c50e80
#define T0_KAOS_RANVAL_03     0x29cecd2f
#define T0_KAOS_RANVAL_04     0x359f4044
#define T0_KAOS_RANVAL_05     0x1581c4de
#define T0_KAOS_RANVAL_06     0xc89c88cc
#define T0_KAOS_RANVAL_07     0x3b9a43ab
#define T0_KAOS_RANVAL_08     0xea82ca76
#define T0_KAOS_RANVAL_09     0x5f2b223d
#define T0_KAOS_RANVAL_0a     0x44536f2c
#define T0_KAOS_RANVAL_0b     0x87fee51b
#define T0_KAOS_RANVAL_0c     0x001f8e13
#define T0_KAOS_RANVAL_0d     0x9407decd
#define T0_KAOS_RANVAL_0e     0x86dfe981
#define T0_KAOS_RANVAL_0f     0xeddf65de
#define T0_KAOS_RANVAL_10     0x7eb4238a
#define T0_KAOS_RANVAL_11     0x871b25d1
#define T0_KAOS_RANVAL_12     0x5ff85762
#define T0_KAOS_RANVAL_13     0xbf60bd45
#define T0_KAOS_RANVAL_14     0xf39b305e
#define T0_KAOS_RANVAL_15     0x0c6b18d6
#define T0_KAOS_RANVAL_16     0x0c2f2b64
#define T0_KAOS_RANVAL_17     0xe1759989
#define T0_KAOS_RANVAL_18     0xa6c8fe05
#define T0_KAOS_RANVAL_19     0x673ae6bf
#define T0_KAOS_RANVAL_1a     0xf2dab69a
#define T0_KAOS_RANVAL_1b     0xfe189eff
#define T0_KAOS_RANVAL_1c     0xae511b13
#define T0_KAOS_RANVAL_1d     0x6de6c01e
#define T0_KAOS_RANVAL_1e     0x9dafa85f
#define T0_KAOS_RANVAL_1f     0x808ee689
#define T0_KAOS_RANVAL_20     0x3f426a97
#define T0_KAOS_RANVAL_21     0x959a3cc4
#define T0_KAOS_RANVAL_22     0x911d4652
#define T0_KAOS_RANVAL_23     0xaaaf6f50
#define T0_KAOS_RANVAL_24     0xd72a45c5
#define T0_KAOS_RANVAL_25     0xaa8f069a
#define T0_KAOS_RANVAL_26     0x5fe6a0a2
#define T0_KAOS_RANVAL_27     0xb8c377af
#define T0_KAOS_RANVAL_28     0xab7593d4
#define T0_KAOS_RANVAL_29     0x360addb2
#define T0_KAOS_RANVAL_2a     0x6a64468b
#define T0_KAOS_RANVAL_2b     0x3a5ef172
#define T0_KAOS_RANVAL_2c     0x2df0fc29
#define T0_KAOS_RANVAL_2d     0x87314998
#define T0_KAOS_RANVAL_2e     0x568e3f1f
#define T0_KAOS_RANVAL_2f     0x70cf853f
#define T0_KAOS_RANVAL_30     0xc61796b5
#define T0_KAOS_RANVAL_31     0xa02e8bee
#define T0_KAOS_RANVAL_32     0x99a64a49
#define T0_KAOS_RANVAL_33     0x4ab3d954
#define T0_KAOS_RANVAL_34     0x1ff1be9a
#define T0_KAOS_RANVAL_35     0x6386a837
#define T0_KAOS_RANVAL_36     0xd356ae0e
#define T0_KAOS_RANVAL_37     0x0f340f72
#define T0_KAOS_RANVAL_38     0x893beb14
#define T0_KAOS_RANVAL_39     0xceac94f2
#define T0_KAOS_RANVAL_3a     0x2c9a1416
#define T0_KAOS_RANVAL_3b     0xc56fae18
#define T0_KAOS_RANVAL_3c     0xcea7b296
#define T0_KAOS_RANVAL_3d     0xb4b2e9eb
#define T0_KAOS_RANVAL_3e     0x1f053b6b
#define T0_KAOS_RANVAL_3f     0x1d4468f4
#define T0_KAOS_RANVAL_40     0x53875c33
#define T0_KAOS_RANVAL_41     0xb7289fcc
#define T0_KAOS_RANVAL_42     0xb353827f
#define T0_KAOS_RANVAL_43     0x08d47c96
#define T0_KAOS_RANVAL_44     0xc856a33f
#define T0_KAOS_RANVAL_45     0x7149b4fa
#define T0_KAOS_RANVAL_46     0x64a38d73
#define T0_KAOS_RANVAL_47     0x396a9166
#define T0_KAOS_RANVAL_48     0xe6999136
#define T0_KAOS_RANVAL_49     0x43d4cb9e
#define T0_KAOS_RANVAL_4a     0xe8e18c96
#define T0_KAOS_RANVAL_4b     0x69c459d8
#define T0_KAOS_RANVAL_4c     0x0cb491db
#define T0_KAOS_RANVAL_4d     0x9b541501
#define T0_KAOS_RANVAL_4e     0x6ab0e72b
#define T0_KAOS_RANVAL_4f     0x5aac5fdd
#define T0_KAOS_RANVAL_50     0xf8ef25a4
#define T0_KAOS_RANVAL_51     0x28b91e1c
#define T0_KAOS_RANVAL_52     0x8dff4e6e
#define T0_KAOS_RANVAL_53     0xe85eb59c
#define T0_KAOS_RANVAL_54     0x5a04d655
#define T0_KAOS_RANVAL_55     0x6a10516f
#define T0_KAOS_RANVAL_56     0x72877cd9
#define T0_KAOS_RANVAL_57     0xdebb7d61
#define T0_KAOS_RANVAL_58     0x7bbe51ea
#define T0_KAOS_RANVAL_59     0x380a4211
#define T0_KAOS_RANVAL_5a     0xdf2a25a3
#define T0_KAOS_RANVAL_5b     0x9b057cd5
#define T0_KAOS_RANVAL_5c     0x2946cfb9
#define T0_KAOS_RANVAL_5d     0x52661408
#define T0_KAOS_RANVAL_5e     0xaa67d888
#define T0_KAOS_RANVAL_5f     0xfb1a2f6f
#define T0_KAOS_RANVAL_60     0x839023d8
#define T0_KAOS_RANVAL_61     0x2a2995da
#define T0_KAOS_RANVAL_62     0x27aeddcf
#define T0_KAOS_RANVAL_63     0x26f40c2a
#define T0_KAOS_RANVAL_64     0x325a24bb
#define T0_KAOS_RANVAL_65     0x5248df63
#define T0_KAOS_RANVAL_66     0xfadc4e89
#define T0_KAOS_RANVAL_67     0xf11ef278
#define T0_KAOS_RANVAL_68     0x18984722
#define T0_KAOS_RANVAL_69     0x072889e9
#define T0_KAOS_RANVAL_6a     0xd37fed16
#define T0_KAOS_RANVAL_6b     0x98d1f276
#define T0_KAOS_RANVAL_6c     0xcb3a9431
#define T0_KAOS_RANVAL_6d     0x7082d56d
#define T0_KAOS_RANVAL_6e     0x9c6681ed
#define T0_KAOS_RANVAL_6f     0xd3e0e460
#define T0_KAOS_RANVAL_70     0x120d5de0
#define T0_KAOS_RANVAL_71     0x80e94f43
#define T0_KAOS_RANVAL_72     0x09e6c09b
#define T0_KAOS_RANVAL_73     0x12eb8346
#define T0_KAOS_RANVAL_74     0xf7b55595
#define T0_KAOS_RANVAL_75     0x57a1cde4
#define T0_KAOS_RANVAL_76     0xcea8f90b
#define T0_KAOS_RANVAL_77     0xc656feff
#define T0_KAOS_RANVAL_78     0x8603e90e
#define T0_KAOS_RANVAL_79     0x9636d603
#define T0_KAOS_RANVAL_7a     0x4b621908
#define T0_KAOS_RANVAL_7b     0x11fa395e
#define T0_KAOS_RANVAL_7c     0x893a0984
#define T0_KAOS_RANVAL_7d     0x5000bcdd
#define T0_KAOS_RANVAL_7e     0x3e7ec200
#define T0_KAOS_RANVAL_7f     0x573422a4
/* end ktbl.0.h */


#define CREGS_PSTATE_AM 1
#define CREGS_TSTATE_PSTATE_AM 1

#define NO_TRAPCHECK

#define LOCAL_SUPERVISOR_SECTION_TEXT_VA 0x20200000
#define LOCAL_SUPERVISOR_SECTION_TEXT_PA 0x20200000
#define LOCAL_SUPERVISOR_SECTION_DATA_VA 0x20210000
#define LOCAL_SUPERVISOR_SECTION_DATA_PA 0x20210000

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


/*
#include "enable_traps.h"
*/

#define H_HT0_Illegal_instruction_0x10 illegal_trap_handler

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



#define SET_DTTE_W_ON_DATA_ACC_PROT

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
!    icount         10
!    targetid       NIAGARA:SIM
!    hostid         NIAGARA:5.8
!    areas          1
!    areasize       64
!    areaoffset     3328
!    ncache         0
!    emulate_ncache 1
!    pagesize       8192
!    invsize        0
!    codecount      11
!    code           0c7d8000
!    entry          0c7d8000
!    fsr_exceptions 00000000
!    fsr_roundmode  00000004
!    fsr_mask       c0000fff
!    seed           000000000267
!    va_map         0000000000400000,000000000fffffff
!    pa_cached      0000000000400000,000000000fffffff
!    pa_noncached   000001ff00000000,000001ff7fffffff
!    weights        /import/n2-aus-localdir1/ntran/n2cdmspp/verif/diag/assembly/kaos/weights_files/allv9.w
!    begcount       0
!    endcount       10
!    dwords         8
!    ldblocks       0
!    stblocks       0
!    ldfsr_words    0
!    annul          2
!    predict        2
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

KTEXT_MODULE(t0_module_ktbl, 0x0c7d8000)
.seg "text"
	KGLOBAL(t0_ktbl)
t0_ktbl_page_begin:
.global t0_kref; t0_kref:
	.skip 0
t0_ktbl:
	.word	0x802d289d	! t0_kref+0x0:   	andn	%l4, 0x89d, %g0
	.word	0xe726401c	! t0_kref+0x4:   	st	%f19, [%i1 + %i4]
	.word	0x1e480006	! t0_kref+0x8:   	bvc,pt	%icc, _kref+0x20
	.word	0x92a27fbb	! t0_kref+0xc:   	subcc	%o1, -0x45, %o1
	.word	0x80ba401d	! t0_kref+0x10:   	xnorcc	%o1, %i5, %g0
	.word	0x96800000	! t0_kref+0x14:   	addcc	%g0, %g0, %o3
	.word	0x986572cb	! t0_kref+0x18:   	subc	%l5, -0xd35, %o4
	.word	0xd51e6000	! t0_kref+0x1c:   	ldd	[%i1], %f10
	.word	0x971eb226	! t0_kref+0x20:   	tsubcctv	%i2, -0xdda, %o3
	call	SYM(_kaos_done)
	.word	0x01000000	! t0_kref+0x28:   	nop
	KGLOBAL(t0_ktbl_end)
t0_ktbl_end:
t0_ktbl_page_end:

KTEXT_MODULE(t0_module_subr0, 0x0c83e000)
.seg "text"
t0_subr0_page_begin:
	.skip 8188
.global _t0_subr0; ENTRY(t0_subr0)
	.word	0xa6844012	! t0_subr0+0x0:   	addcc	%l1, %l2, %l3
	.word	0x81c3e008	! t0_subr0+0x4:   	retl
	.word	0xaa64c014	! t0_subr0+0x8:   	subc	%l3, %l4, %l5
t0_subr0_page_end:

KTEXT_MODULE(t0_module_subr1, 0x0c93c000)
.seg "text"
t0_subr1_page_begin:
	.skip 8192
.global _t0_subr1; ENTRY(t0_subr1)
	.word	0x9de3bfa0	! t0_subr1+0x0:   	save	%sp, -0x60, %sp
	.word	0xb29eaa5a	! t0_subr1+0x4:   	xorcc	%i2, 0xa5a, %i1
	.word	0x81c7e008	! t0_subr1+0x8:   	ret
	.word	0xa7ee6001	! t0_subr1+0xc:   	restore	%i1, 1, %l3
t0_subr1_page_end:

KTEXT_MODULE(t0_module_subr2, 0x05a72000)
.seg "text"
t0_subr2_page_begin:
	.skip 8184
.global _t0_subr2; ENTRY(t0_subr2)
	.word	0x9de3bfa0	! t0_subr2+0x0:   	save	%sp, -0x60, %sp
	.word	0xb2066001	! t0_subr2+0x4:   	add	%i1, 1, %i1
	.word	0x81c7e008	! t0_subr2+0x8:   	ret
	.word	0xa3ee6001	! t0_subr2+0xc:   	restore	%i1, 1, %l1
t0_subr2_page_end:

KTEXT_MODULE(t0_module_subr3, 0x0c5c6000)
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
!  Total operations: 10    
!
!  Operation frequencies
!
!  name               exp    obs
!  ldsb              1.26   0.00
!  ldub              0.54   0.00
!  ldsh              1.04   0.00
!  lduh              1.71   0.00
!  ld                0.86   0.00
!  ldd               1.48   0.00
!  swap              1.00   0.00
!  ldstub            0.47   0.00
!  stb               0.80   0.00
!  sth               0.99   0.00
!  st                0.60   0.00
!  std               0.11   0.00
!  add               0.42   0.00
!  addcc             0.91  10.00
!  addx              1.70   0.00
!  addxcc            0.72   0.00
!  taddcc            0.14   0.00
!  taddcctv          0.33   0.00
!  sub               0.21   0.00
!  subcc             1.00  10.00
!  subx              1.30  10.00
!  subxcc            1.57   0.00
!  tsubcc            0.03   0.00
!  tsubcctv          0.35  10.00
!  mulscc            0.04   0.00
!  and               1.04   0.00
!  andcc             1.67   0.00
!  andn              1.00  10.00
!  andncc            1.79   0.00
!  or                0.71   0.00
!  orcc              0.13   0.00
!  orn               1.26   0.00
!  orncc             0.48   0.00
!  xor               0.43   0.00
!  xorcc             0.92   0.00
!  xnor              1.36   0.00
!  xnorcc            1.65  10.00
!  sll               1.66   0.00
!  srl               1.26   0.00
!  sra               1.26   0.00
!  unimp             0.31   0.00
!  umul              0.09   0.00
!  smul              1.70   0.00
!  udiv              0.23   0.00
!  sdiv              0.87   0.00
!  umulcc            0.03   0.00
!  smulcc            0.53   0.00
!  udivcc            1.61   0.00
!  sdivcc            1.00   0.00
!  rdy               0.20   0.00
!  wry               1.46   0.00
!  bicc              4.53   0.00
!  sethi             0.39   0.00
!  jmpl              0.74   0.00
!  call              0.82  10.00
!  ticc              0.00   0.00
!  flush             0.24   0.00
!  save              0.41   0.00
!  restore           1.74   0.00
!  stbar             0.72   0.00
!  ldf               1.20   0.00
!  lddf              1.66  10.00
!  stf               0.61  10.00
!  stdf              1.21   0.00
!  fadds             1.50   0.00
!  fsubs             0.16   0.00
!  fmuls             0.38   0.00
!  fdivs             0.62   0.00
!  faddd             0.58   0.00
!  fsubd             0.46   0.00
!  fmuld             0.11   0.00
!  fdivd             0.78   0.00
!  faddq             0.00   0.00
!  fsubq             0.00   0.00
!  fmulq             0.00   0.00
!  fdivq             0.00   0.00
!  fsmuld            0.41   0.00
!  fdmulq            0.00   0.00
!  fitos             1.06   0.00
!  fitod             1.53   0.00
!  fitoq             0.00   0.00
!  fstoi             0.77   0.00
!  fstod             0.01   0.00
!  fstoq             0.00   0.00
!  fdtoi             0.17   0.00
!  fdtos             1.26   0.00
!  fdtoq             0.00   0.00
!  fqtoi             0.00   0.00
!  fqtos             0.00   0.00
!  fqtod             0.00   0.00
!  fmovs             0.99   0.00
!  fnegs             0.62   0.00
!  fabss             1.76   0.00
!  fsqrts            0.00   0.00
!  fsqrtd            0.00   0.00
!  fsqrtq            0.00   0.00
!  fcmps             0.59   0.00
!  fcmpd             1.53   0.00
!  fcmpq             0.00   0.00
!  fcmpes            0.78   0.00
!  fcmped            0.08   0.00
!  fcmpeq            0.00   0.00
!  fbfcc             6.40   0.00
!  ldfsr             0.09   0.00
!  stfsr             0.11   0.00
!  loop              0.33   0.00
!  offset            0.14   0.00
!  area              0.33   0.00
!  target            0.33   0.00
!  goto              0.18   0.00
!  sigsegv           0.60   0.00
!  sigbus            1.23   0.00
!  imodify           0.08   0.00
!  ldfsr_offset      0.34   0.00
!  fpattern          1.52   0.00
!  lbranch           0.02   0.00
!  shmld             0.00   0.00
!  shmst             0.00   0.00
!  shmpf             0.00   0.00
!  shmswap           0.00   0.00
!  shmblkld          0.00   0.00
!  shmblkst          0.00   0.00
!  shmblkchk         0.00   0.00
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
!  return            0.22   0.00
!  casa              0.18   0.00
!  rdasi             0.05   0.00
!  wrasi             0.21   0.00
!  bpcc              4.12  10.00
!  fbpfcc            2.43   0.00
!  fmovscc           0.30   0.00
!  fmovdcc           0.32   0.00
!  fmovqcc           0.00   0.00
!  movcc             0.00   0.00
!  flushw            0.11   0.00
!  membar            0.26   0.00
!  prefetch          0.00   0.00
!  rdpc              0.08   0.00
!  ldqf              0.00   0.00
!  stqf              0.00   0.00
!  ldfa              0.32   0.00
!  lddfa             0.33   0.00
!  ldqfa             0.00   0.00
!  ldsba             0.00   0.00
!  ldsha             0.03   0.00
!  lduba             0.09   0.00
!  lduha             0.32   0.00
!  lda               0.12   0.00
!  ldda              0.08   0.00
!  ldstuba           0.08   0.00
!  prefetcha         0.00   0.00
!  stfa              0.07   0.00
!  stdfa             0.07   0.00
!  stqfa             0.00   0.00
!  stba              0.17   0.00
!  stha              0.35   0.00
!  sta               0.05   0.00
!  stda              0.17   0.00
!  swapa             0.19   0.00
!  fmovd             0.25   0.00
!  fnegd             0.01   0.00
!  fabsd             0.06   0.00
!  fstox             0.25   0.00
!  fdtox             0.28   0.00
!  fxtos             0.15   0.00
!  fxtod             0.05   0.00
!  lds               0.06   0.00
!  ldsa              0.25   0.00
!  ldx               0.24   0.00
!  ldxa              0.31   0.00
!  nofault           1.02   0.00
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
!  partial_st8       0.00   0.00
!  partial_st16      0.00   0.00
!  partial_st32      0.00   0.00
!  short_st8         0.00   0.00
!  short_st16        0.00   0.00
!  short_ld8         0.00   0.00
!  short_ld16        0.00   0.00
!  blkld             0.00   0.00
!  blkst             0.00   0.00
!  blkld_offset      0.00   0.00
!  blkst_offset      0.00   0.00
!  blk_check         0.00   0.00
!  casxa             0.00   0.00
!  rdccr             0.00   0.00
!  rdfprs            0.00   0.00
!  wrccr             0.00   0.00
!  popc              0.00   0.00
!  wrfprs            0.00   0.00
!  stx               0.00   0.00
!  stxa              0.00   0.00
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
KDATA_MODULE(t0_module_offset_table, 0x00e44000)
.seg "data"
t0_offset_table_start:
t0_offset_table_size:	.word	0x00000008
t0_offset_table:
	.word	0x00000000
	.word	0x00000018
	.word	0x00000008
	.word	0xfffffff0
	.word	0x00000010
	.word	0xffffffe8
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

KDATA_MODULE(t0_module_data_in_regs, 0x013ca000)
.seg "data"
KGLOBAL(t0_data_in_regs)
t0_data_in_regs_start:
t0_data_in_regs:
	.word	0xd00355d6          ! %f0
	.word	0x73de2671          ! %f1
	.word	0xaed94e2b          ! %f2
	.word	0xf15deda2          ! %f3
	.word	0x3d97f0d9          ! %f4
	.word	0x307fec28          ! %f5
	.word	0x4b560b1b          ! %f6
	.word	0x40f6aaf2          ! %f7
	.word	0xd8ba3bca          ! %f8
	.word	0x82322c84          ! %f9
	.word	0xa7cbee1f          ! %f10
	.word	0xed068084          ! %f11
	.word	0x92616ad8          ! %f12
	.word	0x3a3e0520          ! %f13
	.word	0x29bcb168          ! %f14
	.word	0xfd001d2c          ! %f15
	.word	0x110839e7          ! %f16
	.word	0xe54b001d          ! %f17
	.word	0x8aa1e1ce          ! %f18
	.word	0x19a5f150          ! %f19
	.word	0x1a8168c9          ! %f20
	.word	0x5a5eae45          ! %f21
	.word	0xb06dd828          ! %f22
	.word	0x4d65cfaa          ! %f23
	.word	0xfa1b46af          ! %f24
	.word	0x4e393f72          ! %f25
	.word	0xd11273dd          ! %f26
	.word	0x88c7564c          ! %f27
	.word	0x5dac00dd          ! %f28
	.word	0x2638bd30          ! %f29
	.word	0xab206abb          ! %f30
	.word	0x4f6963e4          ! %f31
	.word	0xc787a89d          ! %f32
	.word	0x9c62cba1          ! %f33
	.word	0xab6b4206          ! %f34
	.word	0x070b1d41          ! %f35
	.word	0xddfc2475          ! %f36
	.word	0x65cf14a1          ! %f37
	.word	0x61cb44d4          ! %f38
	.word	0xdee14715          ! %f39
	.word	0x51fe809b          ! %f40
	.word	0xe3aac129          ! %f41
	.word	0x9ed80b98          ! %f42
	.word	0x6240f7fc          ! %f43
	.word	0x417852a8          ! %f44
	.word	0x87afa4f8          ! %f45
	.word	0xbf0b68fb          ! %f46
	.word	0x02b4e6bd          ! %f47
	.word	0x455b248c          ! %f48
	.word	0x7570006f          ! %f49
	.word	0xde65cff2          ! %f50
	.word	0x3b22d8ce          ! %f51
	.word	0x638b1ac2          ! %f52
	.word	0xa481fcbc          ! %f53
	.word	0x1faa870c          ! %f54
	.word	0x23faf51d          ! %f55
	.word	0xf01149c3          ! %f56
	.word	0x5aa4463b          ! %f57
	.word	0x9cdb3d0b          ! %f58
	.word	0x2fc2ff0d          ! %f59
	.word	0xcb196ebf          ! %f60
	.word	0xe2a76918          ! %f61
	.word	0x90ffd2b6          ! %f62
	.word	0x5bebbdbe          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x798       ! %g1 (code pointer)
	.word	t0_data_in_shm_area ! %g2 (shared area pointer)
	.word	0xbd15aedc          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xa21d799d          ! %o0
	.word	0xbf85a977          ! %o1
	.word	0x252ff935          ! %o2
	.word	0xc58a5538          ! %o3
	.word	0xf7070ee7          ! %o4
	.word	0x5e9d2071          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x1145ff8a          ! %l0
	.word	0x737dd438          ! %l1
	.word	0x7ec06ded          ! %l2
	.word	0xfbff1391          ! %l3
	.word	0x2d20c5d4          ! %l4
	.word	0xf48ea659          ! %l5
	.word	0x812529fd          ! %l6
	.word	0xb91989ea          ! %l7
	.word	t0_data_in_area0    ! %i0 (area pointer)
	.word	t0_data_in_area0    ! %i1 (area pointer)
	.word	0x00000014          ! %i2 (byte offset)
	.word	0xffffffec          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x893a8bb9          ! %y
	.word	0x00000002          ! %icc (nzvc)
	.word	0x40000a53          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x00000082          ! %asi
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

KDATA_MODULE(t0_module_data_in_stack, 0x06622000)
.seg "data"
KGLOBAL(t0_data_in_mtbl_size)
KGLOBAL(t0_data_in_mtbl)
KGLOBAL(t0_data_in_stack)
t0_data_in_stack_start:
	.word	0xb1dd0510
	.word	0x729fbda0
	.word	0xaaa20647
	.word	0x57b846bd
	.word	0x7a6ec9c7
	.word	0x03aece5a
	.word	0x9437931f
	.word	0x54a48859
	.word	0x2f3848ff
	.word	0x3af185ba
	.word	0x81d59f77
	.word	0xca2334f5
	.word	0xd0a9c3e1
	.word	0x487e86fe
	.word	0x7b59fabb
	.word	0x5a4f3794
	.word	0xfa2b0d09
	.word	0xca1bbbd2
	.word	0xc0d3b1ef
	.word	0x027f981c
	.word	0xb17622a0
	.word	0xddafe6d2
	.word	0x383109e2
	.word	0xdd15bb7e
	.word	0x9238d5aa
	.word	0x0adc5a4d
	.word	0x729668a2
	.word	0x4c2d0219
	.word	0x7f59129c
	.word	0x56b4d74c
	.word	0x53b5e232
	.word	0xb03b6860
	.word	0x04dc9f31
	.word	0xff67d8d2
	.word	0x86c65c7a
	.word	0xfc890db9
	.word	0x042e617d
	.word	0xf209cf64
	.word	0x93347e7e
	.word	0x195ec5a8
	.word	0x5d888441
	.word	0x9eda10cb
	.word	0x2e16ded2
	.word	0x5f2a172c
	.word	0xddec0c81
	.word	0xf8808018
	.word	0xa812254d
	.word	0x80d74e69
	.word	0x6e83b454
	.word	0x052f31e7
	.word	0x58f113fd
	.word	0xcc888486
	.word	0x11d91efa
	.word	0xd58390e8
	.word	0x25ffab5a
	.word	0xbadac1d8
	.word	0xb220ba33
	.word	0x18b6c69b
	.word	0xa577ddbd
	.word	0xb4589e3f
	.word	0xc351e0ce
	.word	0x08656c5a
	.word	0x93418612
	.word	0xc4cc03d0
	.word	0xb906127f
	.word	0x7432c89c
	.word	0xe12e95cc
	.word	0x8b16f7b4
	.word	0xd47354f5
	.word	0x3f0c1c77
	.word	0x71f7ae19
	.word	0x1c558d4f
	.word	0xb783122c
	.word	0x5914c566
	.word	0xc1cc9857
	.word	0x388967a4
	.word	0xe84807ff
	.word	0xe28c374c
	.word	0x548f51c5
	.word	0x28316cf7
	.word	0x492b1d00
	.word	0xa98b12b8
	.word	0xa0079e7d
	.word	0xdb3690b3
	.word	0xd7502e8c
	.word	0x1e84db6a
	.word	0x6ac857a1
	.word	0x84c0d78e
	.word	0x6f312c19
	.word	0x6e501316
	.word	0xce5ee8d4
	.word	0x7315f9ea
	.word	0x287f13d1
	.word	0xf44ebc67
	.word	0x77f8b0ec
	.word	0x68d5487e
	.word	0x233da464
	.word	0x386d8a46
	.word	0x9d3139e5
	.word	0x4bfab735
	.word	0x8a07d819
	.word	0x3b503f5b
	.word	0xce777c18
	.word	0xc14d3255
	.word	0x95b87d27
	.word	0xc36601d3
	.word	0x3ca7a0ab
	.word	0xce7aa1e4
	.word	0x96937f42
	.word	0x8808a764
	.word	0xbf59f74b
	.word	0x14663f46
	.word	0x53c1b677
	.word	0x98763d8e
	.word	0x743f1318
	.word	0xb454212a
	.word	0x6cba4f3c
	.word	0xd3a45222
	.word	0xe8ec42e1
	.word	0xb7e721a7
	.word	0x1e521fc3
	.word	0x17e0c007
	.word	0x96fad891
	.word	0x7b9482a1
	.word	0xbfda7e8e
	.word	0x662c043b
	.word	0xf18ff3e8
	.word	0x6782f471
	.word	0x313e6e47
	.word	0x39755f18
	.word	0x3289c46d
	.word	0x5a00e2c5
	.word	0x12a632d1
	.word	0xf5a145d8
	.word	0x87ea76a2
	.word	0xd3182bc3
	.word	0x1616a39a
	.word	0x89c6e85b
	.word	0xb6e84079
	.word	0xe083a574
	.word	0xbd02cf32
	.word	0x2499cf27
	.word	0xf48d4107
	.word	0x4ead155f
	.word	0xe41bc421
	.word	0x65c0d5af
	.word	0xbb492776
	.word	0xf4a07e74
	.word	0x381392f4
	.word	0x8b2c04d7
	.word	0x2481d540
	.word	0x684be92c
	.word	0xfbc5dd99
	.word	0x3a8f11b7
	.word	0x944f6f9a
	.word	0xc43109ed
	.word	0xec8987ec
	.word	0x3d3e849f
	.word	0xd763942d
	.word	0xca2069b2
	.word	0xe1945d91
	.word	0x9c09cc5a
	.word	0xa6e2a50b
	.word	0xddebf4eb
	.word	0x6892c103
	.word	0x518cc1b7
	.word	0x86f15fe0
	.word	0x797914a1
t0_data_in_sp:
	.word	0xd922b7ed
	.word	0x58175f44
	.word	0x42283467
	.word	0xa778b5dd
	.word	0x7402e8b8
	.word	0x44f2b15c
	.word	0xb1410e20
	.word	0x358de34a
	.word	t0_data_in_area0
	.word	t0_data_in_area0
	.word	0xffffffe9
	.word	0x00000016
	.word	0xfffffffc
	.word	0x00000018
	.word	t0_data_in_fp
	.word	0x35d18751
	.word	0x69feaae7
	.word	0x732e9b24
	.word	0xaae30203
	.word	0x92a1106c
	.word	0xedfee498
	.word	0xfcf7c556
	.word	0xe5372ad3
	.word	0xdb9f8259
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
	.word   	0x7a618ae4	! [%fp - 0xc]
	.word   	0x34baae49	! [%fp - 0x8]
	.word   	0x409633a9	! [%fp - 0x4]
.global t0_data_in_fp; t0_data_in_fp:
	.word	0x0ebe9b55
	.word	0x145f3f68
	.word	0x53364c30
	.word	0x2535f299
	.word	0xcef4c8be
	.word	0xe2c12dfa
	.word	0xc804abf6
	.word	0xe4334089
	.word	0x48d010d8
	.word	0xf724ad1f
	.word	0x307e7aa7
	.word	0xa41350bb
	.word	0x2ea754cd
	.word	0x43f3f1bf
	.word	0x4603410f
	.word	0xee4a6dab
	.word	0xf40f2ef5
	.word	0xcb89ca1b
	.word	0xfb1735a0
	.word	0x15b12f1a
	.word	0xeec7f158
	.word	0x91e193fe
	.word	0x8a71c898
	.word	0x1ace7d6a
t0_data_in_stacktop:
	.word	0
t0_data_in_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_in_area0, 0x03ed2000)
.seg "data"
t0_data_in_area0_start:
.skip 3328
t0_data_in_area0_begin:
	.word	0xf2ae8870	! t0_data_in_area0-0x20
	.word	0x7293e232	! t0_data_in_area0-0x1c
	.word	0xaf264e62	! t0_data_in_area0-0x18
	.word	0xea6df62c	! t0_data_in_area0-0x14
	.word	0x26924632	! t0_data_in_area0-0x10
	.word	0x73f38535	! t0_data_in_area0-0xc
	.word	0x3bc26c3d	! t0_data_in_area0-0x8
	.word	0x6a5f85f7	! t0_data_in_area0-0x4
.global t0_data_in_area0; t0_data_in_area0:
	.word	0x3d6dd94f	! t0_data_in_area0+0x0
	.word	0x3d25eb2d	! t0_data_in_area0+0x4
	.word	0x55d42b1b	! t0_data_in_area0+0x8
	.word	0x68b64b7b	! t0_data_in_area0+0xc
	.word	0x82a1f4b6	! t0_data_in_area0+0x10
	.word	0xe34d0b18	! t0_data_in_area0+0x14
	.word	0x6603d4cb	! t0_data_in_area0+0x18
	.word	0x28aa17d5	! t0_data_in_area0+0x1c
t0_data_in_area0_end:
.skip 4800
t0_data_in_area0_stop:

KDATA_MODULE(t0_module_data_in_shm_area, 0x0a816000)
.seg "data"
t0_data_in_shm_area_start:
t0_data_in_shm_area_begin:
.global t0_data_in_shm_area; t0_data_in_shm_area:
	.word	0x94b46b5d	! t0_data_in_shm_area+0x0 (t0)
	.word	0xb5a5b925	! t0_data_in_shm_area+0x4 (t1)
	.word	0x623e365a	! t0_data_in_shm_area+0x8 (t2)
	.word	0x00000000	! t0_data_in_shm_area+0xc (t3)
	.word	0x2cafc34e	! t0_data_in_shm_area+0x10 (t4)
	.word	0x00000000	! t0_data_in_shm_area+0x14 (t5)
	.word	0x009cb54b	! t0_data_in_shm_area+0x18 (t6)
	.word	0x00000000	! t0_data_in_shm_area+0x1c (t7)
	.word	0xb0884f47	! t0_data_in_shm_area+0x20 (t0)
	.word	0xd02b2d3a	! t0_data_in_shm_area+0x24 (t1)
	.word	0x9d8dbb92	! t0_data_in_shm_area+0x28 (t2)
	.word	0x00000000	! t0_data_in_shm_area+0x2c (t3)
	.word	0x0ea13687	! t0_data_in_shm_area+0x30 (t4)
	.word	0x00000000	! t0_data_in_shm_area+0x34 (t5)
	.word	0x7f0e742e	! t0_data_in_shm_area+0x38 (t6)
	.word	0x00000000	! t0_data_in_shm_area+0x3c (t7)
	.word	0x610bff59	! t0_data_in_shm_area+0x40 (t0 bload)
	.word	0x86a02023	! t0_data_in_shm_area+0x44
	.word	0x98fec441	! t0_data_in_shm_area+0x48
	.word	0xe9f5330c	! t0_data_in_shm_area+0x4c
	.word	0x1d9c6ab4	! t0_data_in_shm_area+0x50
	.word	0xe814b45b	! t0_data_in_shm_area+0x54
	.word	0xbfe38aab	! t0_data_in_shm_area+0x58
	.word	0xf72f87b2	! t0_data_in_shm_area+0x5c
	.word	0x8cda9491	! t0_data_in_shm_area+0x60
	.word	0xdd690f58	! t0_data_in_shm_area+0x64
	.word	0x3cd1deb4	! t0_data_in_shm_area+0x68
	.word	0xe15c94ad	! t0_data_in_shm_area+0x6c
	.word	0x98fd2690	! t0_data_in_shm_area+0x70
	.word	0x50359435	! t0_data_in_shm_area+0x74
	.word	0x43d30a0a	! t0_data_in_shm_area+0x78
	.word	0x98cb8712	! t0_data_in_shm_area+0x7c
	.word	0x45ada29c	! t0_data_in_shm_area+0x80 (t0 bstore)
	.word	0xb1f20cde	! t0_data_in_shm_area+0x84
	.word	0x17d61cf3	! t0_data_in_shm_area+0x88
	.word	0x31e8e448	! t0_data_in_shm_area+0x8c
	.word	0x32adf196	! t0_data_in_shm_area+0x90
	.word	0x11cabde3	! t0_data_in_shm_area+0x94
	.word	0xe5a9d791	! t0_data_in_shm_area+0x98
	.word	0xabe9f400	! t0_data_in_shm_area+0x9c
	.word	0x78f5b835	! t0_data_in_shm_area+0xa0
	.word	0x9692638f	! t0_data_in_shm_area+0xa4
	.word	0xbfd56368	! t0_data_in_shm_area+0xa8
	.word	0x60705562	! t0_data_in_shm_area+0xac
	.word	0xcf559627	! t0_data_in_shm_area+0xb0
	.word	0x302e6c39	! t0_data_in_shm_area+0xb4
	.word	0x0384a11d	! t0_data_in_shm_area+0xb8
	.word	0xf2b53388	! t0_data_in_shm_area+0xbc
	.word	0x626f3f29	! t0_data_in_shm_area+0xc0 (t1 bload)
	.word	0xd3d5c515	! t0_data_in_shm_area+0xc4
	.word	0x211f0dab	! t0_data_in_shm_area+0xc8
	.word	0xb429cc73	! t0_data_in_shm_area+0xcc
	.word	0x25c93c13	! t0_data_in_shm_area+0xd0
	.word	0x34862873	! t0_data_in_shm_area+0xd4
	.word	0x26e361dc	! t0_data_in_shm_area+0xd8
	.word	0x4f994583	! t0_data_in_shm_area+0xdc
	.word	0x36eadf10	! t0_data_in_shm_area+0xe0
	.word	0x6f0485bd	! t0_data_in_shm_area+0xe4
	.word	0xa3496b3d	! t0_data_in_shm_area+0xe8
	.word	0xb76066d3	! t0_data_in_shm_area+0xec
	.word	0xe9e54608	! t0_data_in_shm_area+0xf0
	.word	0xccf71f85	! t0_data_in_shm_area+0xf4
	.word	0x7fc6fcd1	! t0_data_in_shm_area+0xf8
	.word	0x34e1c7e8	! t0_data_in_shm_area+0xfc
	.word	0x68cbaafd	! t0_data_in_shm_area+0x100 (t1 bstore)
	.word	0x87dcc50f	! t0_data_in_shm_area+0x104
	.word	0x80a076e3	! t0_data_in_shm_area+0x108
	.word	0x78c877d5	! t0_data_in_shm_area+0x10c
	.word	0xa485e370	! t0_data_in_shm_area+0x110
	.word	0x9950e7db	! t0_data_in_shm_area+0x114
	.word	0x59b8ef02	! t0_data_in_shm_area+0x118
	.word	0xd74c9ef0	! t0_data_in_shm_area+0x11c
	.word	0xd140f203	! t0_data_in_shm_area+0x120
	.word	0x5502f682	! t0_data_in_shm_area+0x124
	.word	0x0bee544c	! t0_data_in_shm_area+0x128
	.word	0x37b407c8	! t0_data_in_shm_area+0x12c
	.word	0xb4248e5f	! t0_data_in_shm_area+0x130
	.word	0x954810c5	! t0_data_in_shm_area+0x134
	.word	0x215d13ef	! t0_data_in_shm_area+0x138
	.word	0xa49dc356	! t0_data_in_shm_area+0x13c
	.word	0x10fb5f47	! t0_data_in_shm_area+0x140 (t2 bload)
	.word	0x73cc0e17	! t0_data_in_shm_area+0x144
	.word	0x87fe6733	! t0_data_in_shm_area+0x148
	.word	0x3a5285a9	! t0_data_in_shm_area+0x14c
	.word	0x9c34667e	! t0_data_in_shm_area+0x150
	.word	0x12f71ecd	! t0_data_in_shm_area+0x154
	.word	0x91b5cc0f	! t0_data_in_shm_area+0x158
	.word	0x0747998c	! t0_data_in_shm_area+0x15c
	.word	0xc4f25803	! t0_data_in_shm_area+0x160
	.word	0xd00d8ca6	! t0_data_in_shm_area+0x164
	.word	0x63d190ac	! t0_data_in_shm_area+0x168
	.word	0x81962052	! t0_data_in_shm_area+0x16c
	.word	0x85c109c5	! t0_data_in_shm_area+0x170
	.word	0x1e2580cf	! t0_data_in_shm_area+0x174
	.word	0x4f634ec7	! t0_data_in_shm_area+0x178
	.word	0xe1e63915	! t0_data_in_shm_area+0x17c
	.word	0xf6617cb8	! t0_data_in_shm_area+0x180 (t2 bstore)
	.word	0x5d1c6057	! t0_data_in_shm_area+0x184
	.word	0x1e3164f6	! t0_data_in_shm_area+0x188
	.word	0xd0c66941	! t0_data_in_shm_area+0x18c
	.word	0x8161c1c5	! t0_data_in_shm_area+0x190
	.word	0xcbe68014	! t0_data_in_shm_area+0x194
	.word	0x687566b3	! t0_data_in_shm_area+0x198
	.word	0xabe34d0e	! t0_data_in_shm_area+0x19c
	.word	0x9719ba02	! t0_data_in_shm_area+0x1a0
	.word	0x1acbb2c3	! t0_data_in_shm_area+0x1a4
	.word	0x8188f9bb	! t0_data_in_shm_area+0x1a8
	.word	0x7beb4c4a	! t0_data_in_shm_area+0x1ac
	.word	0x90b72623	! t0_data_in_shm_area+0x1b0
	.word	0xc45c1572	! t0_data_in_shm_area+0x1b4
	.word	0x6bf2b499	! t0_data_in_shm_area+0x1b8
	.word	0xf672575b	! t0_data_in_shm_area+0x1bc
	.word	0x00000000	! t0_data_in_shm_area+0x1c0 (t3 bload)
	.word	0x00000000	! t0_data_in_shm_area+0x1c4
	.word	0x00000000	! t0_data_in_shm_area+0x1c8
	.word	0x00000000	! t0_data_in_shm_area+0x1cc
	.word	0x00000000	! t0_data_in_shm_area+0x1d0
	.word	0x00000000	! t0_data_in_shm_area+0x1d4
	.word	0x00000000	! t0_data_in_shm_area+0x1d8
	.word	0x00000000	! t0_data_in_shm_area+0x1dc
	.word	0x00000000	! t0_data_in_shm_area+0x1e0
	.word	0x00000000	! t0_data_in_shm_area+0x1e4
	.word	0x00000000	! t0_data_in_shm_area+0x1e8
	.word	0x00000000	! t0_data_in_shm_area+0x1ec
	.word	0x00000000	! t0_data_in_shm_area+0x1f0
	.word	0x00000000	! t0_data_in_shm_area+0x1f4
	.word	0x00000000	! t0_data_in_shm_area+0x1f8
	.word	0x00000000	! t0_data_in_shm_area+0x1fc
	.word	0x00000000	! t0_data_in_shm_area+0x200 (t3 bstore)
	.word	0x00000000	! t0_data_in_shm_area+0x204
	.word	0x00000000	! t0_data_in_shm_area+0x208
	.word	0x00000000	! t0_data_in_shm_area+0x20c
	.word	0x00000000	! t0_data_in_shm_area+0x210
	.word	0x00000000	! t0_data_in_shm_area+0x214
	.word	0x00000000	! t0_data_in_shm_area+0x218
	.word	0x00000000	! t0_data_in_shm_area+0x21c
	.word	0x00000000	! t0_data_in_shm_area+0x220
	.word	0x00000000	! t0_data_in_shm_area+0x224
	.word	0x00000000	! t0_data_in_shm_area+0x228
	.word	0x00000000	! t0_data_in_shm_area+0x22c
	.word	0x00000000	! t0_data_in_shm_area+0x230
	.word	0x00000000	! t0_data_in_shm_area+0x234
	.word	0x00000000	! t0_data_in_shm_area+0x238
	.word	0x00000000	! t0_data_in_shm_area+0x23c
	.word	0x0fbeb527	! t0_data_in_shm_area+0x240 (t4 bload)
	.word	0x9139d23c	! t0_data_in_shm_area+0x244
	.word	0x72e348d8	! t0_data_in_shm_area+0x248
	.word	0xad8333c0	! t0_data_in_shm_area+0x24c
	.word	0x03448fe2	! t0_data_in_shm_area+0x250
	.word	0x071c550a	! t0_data_in_shm_area+0x254
	.word	0xddadee4c	! t0_data_in_shm_area+0x258
	.word	0xe58fd5ef	! t0_data_in_shm_area+0x25c
	.word	0x236d5f30	! t0_data_in_shm_area+0x260
	.word	0x7c6776f4	! t0_data_in_shm_area+0x264
	.word	0xa79715dd	! t0_data_in_shm_area+0x268
	.word	0x36f1dd99	! t0_data_in_shm_area+0x26c
	.word	0x0f59ea18	! t0_data_in_shm_area+0x270
	.word	0x7d66e1fb	! t0_data_in_shm_area+0x274
	.word	0x5b06353e	! t0_data_in_shm_area+0x278
	.word	0x088fabf2	! t0_data_in_shm_area+0x27c
	.word	0xb28def56	! t0_data_in_shm_area+0x280 (t4 bstore)
	.word	0x53f9f61e	! t0_data_in_shm_area+0x284
	.word	0x381f4655	! t0_data_in_shm_area+0x288
	.word	0x1218f780	! t0_data_in_shm_area+0x28c
	.word	0x7c416726	! t0_data_in_shm_area+0x290
	.word	0x1dc14893	! t0_data_in_shm_area+0x294
	.word	0xd1290f2e	! t0_data_in_shm_area+0x298
	.word	0xc528a6fe	! t0_data_in_shm_area+0x29c
	.word	0x0fa38e62	! t0_data_in_shm_area+0x2a0
	.word	0xa30e5354	! t0_data_in_shm_area+0x2a4
	.word	0x2bfb7532	! t0_data_in_shm_area+0x2a8
	.word	0x73eef682	! t0_data_in_shm_area+0x2ac
	.word	0x0cdb0ecf	! t0_data_in_shm_area+0x2b0
	.word	0x15a018dc	! t0_data_in_shm_area+0x2b4
	.word	0x64234f98	! t0_data_in_shm_area+0x2b8
	.word	0x24764ae1	! t0_data_in_shm_area+0x2bc
	.word	0x00000000	! t0_data_in_shm_area+0x2c0 (t5 bload)
	.word	0x00000000	! t0_data_in_shm_area+0x2c4
	.word	0x00000000	! t0_data_in_shm_area+0x2c8
	.word	0x00000000	! t0_data_in_shm_area+0x2cc
	.word	0x00000000	! t0_data_in_shm_area+0x2d0
	.word	0x00000000	! t0_data_in_shm_area+0x2d4
	.word	0x00000000	! t0_data_in_shm_area+0x2d8
	.word	0x00000000	! t0_data_in_shm_area+0x2dc
	.word	0x00000000	! t0_data_in_shm_area+0x2e0
	.word	0x00000000	! t0_data_in_shm_area+0x2e4
	.word	0x00000000	! t0_data_in_shm_area+0x2e8
	.word	0x00000000	! t0_data_in_shm_area+0x2ec
	.word	0x00000000	! t0_data_in_shm_area+0x2f0
	.word	0x00000000	! t0_data_in_shm_area+0x2f4
	.word	0x00000000	! t0_data_in_shm_area+0x2f8
	.word	0x00000000	! t0_data_in_shm_area+0x2fc
	.word	0x00000000	! t0_data_in_shm_area+0x300 (t5 bstore)
	.word	0x00000000	! t0_data_in_shm_area+0x304
	.word	0x00000000	! t0_data_in_shm_area+0x308
	.word	0x00000000	! t0_data_in_shm_area+0x30c
	.word	0x00000000	! t0_data_in_shm_area+0x310
	.word	0x00000000	! t0_data_in_shm_area+0x314
	.word	0x00000000	! t0_data_in_shm_area+0x318
	.word	0x00000000	! t0_data_in_shm_area+0x31c
	.word	0x00000000	! t0_data_in_shm_area+0x320
	.word	0x00000000	! t0_data_in_shm_area+0x324
	.word	0x00000000	! t0_data_in_shm_area+0x328
	.word	0x00000000	! t0_data_in_shm_area+0x32c
	.word	0x00000000	! t0_data_in_shm_area+0x330
	.word	0x00000000	! t0_data_in_shm_area+0x334
	.word	0x00000000	! t0_data_in_shm_area+0x338
	.word	0x00000000	! t0_data_in_shm_area+0x33c
	.word	0x3d6c242d	! t0_data_in_shm_area+0x340 (t6 bload)
	.word	0x1578014d	! t0_data_in_shm_area+0x344
	.word	0x3cdc9c2a	! t0_data_in_shm_area+0x348
	.word	0xac6eccb4	! t0_data_in_shm_area+0x34c
	.word	0x2d00dc80	! t0_data_in_shm_area+0x350
	.word	0x618586e0	! t0_data_in_shm_area+0x354
	.word	0x562040d9	! t0_data_in_shm_area+0x358
	.word	0xd1611f69	! t0_data_in_shm_area+0x35c
	.word	0xe2efe765	! t0_data_in_shm_area+0x360
	.word	0x834903d0	! t0_data_in_shm_area+0x364
	.word	0x0f7c85ab	! t0_data_in_shm_area+0x368
	.word	0x5410c5a1	! t0_data_in_shm_area+0x36c
	.word	0x53becdf3	! t0_data_in_shm_area+0x370
	.word	0x4196c7c1	! t0_data_in_shm_area+0x374
	.word	0x3e2b1d6f	! t0_data_in_shm_area+0x378
	.word	0x578a4bec	! t0_data_in_shm_area+0x37c
	.word	0x49898b8c	! t0_data_in_shm_area+0x380 (t6 bstore)
	.word	0xc119b49a	! t0_data_in_shm_area+0x384
	.word	0xdaa96d18	! t0_data_in_shm_area+0x388
	.word	0xffcadcf3	! t0_data_in_shm_area+0x38c
	.word	0x8bfd821d	! t0_data_in_shm_area+0x390
	.word	0x28525779	! t0_data_in_shm_area+0x394
	.word	0x9db1639f	! t0_data_in_shm_area+0x398
	.word	0x97db0587	! t0_data_in_shm_area+0x39c
	.word	0x4058eea4	! t0_data_in_shm_area+0x3a0
	.word	0xe3ba1ce6	! t0_data_in_shm_area+0x3a4
	.word	0xdc0d6c28	! t0_data_in_shm_area+0x3a8
	.word	0x07c925f7	! t0_data_in_shm_area+0x3ac
	.word	0x784ea1f2	! t0_data_in_shm_area+0x3b0
	.word	0x6169144a	! t0_data_in_shm_area+0x3b4
	.word	0x20b6de63	! t0_data_in_shm_area+0x3b8
	.word	0x20c924a1	! t0_data_in_shm_area+0x3bc
	.word	0x00000000	! t0_data_in_shm_area+0x3c0 (t7 bload)
	.word	0x00000000	! t0_data_in_shm_area+0x3c4
	.word	0x00000000	! t0_data_in_shm_area+0x3c8
	.word	0x00000000	! t0_data_in_shm_area+0x3cc
	.word	0x00000000	! t0_data_in_shm_area+0x3d0
	.word	0x00000000	! t0_data_in_shm_area+0x3d4
	.word	0x00000000	! t0_data_in_shm_area+0x3d8
	.word	0x00000000	! t0_data_in_shm_area+0x3dc
	.word	0x00000000	! t0_data_in_shm_area+0x3e0
	.word	0x00000000	! t0_data_in_shm_area+0x3e4
	.word	0x00000000	! t0_data_in_shm_area+0x3e8
	.word	0x00000000	! t0_data_in_shm_area+0x3ec
	.word	0x00000000	! t0_data_in_shm_area+0x3f0
	.word	0x00000000	! t0_data_in_shm_area+0x3f4
	.word	0x00000000	! t0_data_in_shm_area+0x3f8
	.word	0x00000000	! t0_data_in_shm_area+0x3fc
	.word	0x00000000	! t0_data_in_shm_area+0x400 (t7 bstore)
	.word	0x00000000	! t0_data_in_shm_area+0x404
	.word	0x00000000	! t0_data_in_shm_area+0x408
	.word	0x00000000	! t0_data_in_shm_area+0x40c
	.word	0x00000000	! t0_data_in_shm_area+0x410
	.word	0x00000000	! t0_data_in_shm_area+0x414
	.word	0x00000000	! t0_data_in_shm_area+0x418
	.word	0x00000000	! t0_data_in_shm_area+0x41c
	.word	0x00000000	! t0_data_in_shm_area+0x420
	.word	0x00000000	! t0_data_in_shm_area+0x424
	.word	0x00000000	! t0_data_in_shm_area+0x428
	.word	0x00000000	! t0_data_in_shm_area+0x42c
	.word	0x00000000	! t0_data_in_shm_area+0x430
	.word	0x00000000	! t0_data_in_shm_area+0x434
	.word	0x00000000	! t0_data_in_shm_area+0x438
	.word	0x00000000	! t0_data_in_shm_area+0x43c
t0_data_in_shm_area_end:
t0_data_in_shm_area_stop:

KDATA_MODULE(t0_module_data_exp_regs, 0x00daa000)
.seg "data"
KGLOBAL(t0_data_exp_regs)
t0_data_exp_regs_start:
t0_data_exp_regs:
	.word	0xd00355d6          ! %f0
	.word	0x73de2671          ! %f1
	.word	0xaed94e2b          ! %f2
	.word	0xf15deda2          ! %f3
	.word	0x3d97f0d9          ! %f4
	.word	0x307fec28          ! %f5
	.word	0x4b560b1b          ! %f6
	.word	0x40f6aaf2          ! %f7
	.word	0xd8ba3bca          ! %f8
	.word	0x82322c84          ! %f9
	.word	0xa7cbee1f          ! %f10
	.word	0xed068084          ! %f11
	.word	0x92616ad8          ! %f12
	.word	0x3a3e0520          ! %f13
	.word	0x29bcb168          ! %f14
	.word	0xfd001d2c          ! %f15
	.word	0x110839e7          ! %f16
	.word	0xe54b001d          ! %f17
	.word	0x8aa1e1ce          ! %f18
	.word	0x19a5f150          ! %f19
	.word	0x1a8168c9          ! %f20
	.word	0x5a5eae45          ! %f21
	.word	0xb06dd828          ! %f22
	.word	0x4d65cfaa          ! %f23
	.word	0xfa1b46af          ! %f24
	.word	0x4e393f72          ! %f25
	.word	0xd11273dd          ! %f26
	.word	0x88c7564c          ! %f27
	.word	0x5dac00dd          ! %f28
	.word	0x2638bd30          ! %f29
	.word	0xab206abb          ! %f30
	.word	0x4f6963e4          ! %f31
	.word	0xc787a89d          ! %f32
	.word	0x9c62cba1          ! %f33
	.word	0xab6b4206          ! %f34
	.word	0x070b1d41          ! %f35
	.word	0xddfc2475          ! %f36
	.word	0x65cf14a1          ! %f37
	.word	0x61cb44d4          ! %f38
	.word	0xdee14715          ! %f39
	.word	0x51fe809b          ! %f40
	.word	0xe3aac129          ! %f41
	.word	0x9ed80b98          ! %f42
	.word	0x6240f7fc          ! %f43
	.word	0x417852a8          ! %f44
	.word	0x87afa4f8          ! %f45
	.word	0xbf0b68fb          ! %f46
	.word	0x02b4e6bd          ! %f47
	.word	0x455b248c          ! %f48
	.word	0x7570006f          ! %f49
	.word	0xde65cff2          ! %f50
	.word	0x3b22d8ce          ! %f51
	.word	0x638b1ac2          ! %f52
	.word	0xa481fcbc          ! %f53
	.word	0x1faa870c          ! %f54
	.word	0x23faf51d          ! %f55
	.word	0xf01149c3          ! %f56
	.word	0x5aa4463b          ! %f57
	.word	0x9cdb3d0b          ! %f58
	.word	0x2fc2ff0d          ! %f59
	.word	0xcb196ebf          ! %f60
	.word	0xe2a76918          ! %f61
	.word	0x90ffd2b6          ! %f62
	.word	0x5bebbdbe          ! %f63
	.word	0x00000000          ! %g0 (always zero)
	.word	t0_kref+0x798       ! %g1 (code pointer)
	.word	t0_data_exp_shm_area! %g2 (shared area pointer)
	.word	0xbd15aedc          ! %g3 (loop index)
	.word	SYM(t0_subr0)       ! %g4 (jmpl target)
	.word	t0_kref+0x1         ! %g5 (sigbus target)
	.word	0x00000000          ! %g6 (block ld offset)
	.word	0x00000000          ! %g7 (block st offset)
	.word	0xa21d799d          ! %o0
	.word	0xbf85a977          ! %o1
	.word	0x252ff935          ! %o2
	.word	0xc58a5538          ! %o3
	.word	0xf7070ee7          ! %o4
	.word	0x5e9d2071          ! %o5
	.word	0x00000000          ! %sp (stack pointer)
	.word	0x00000000          ! %o7 (relocatable junk)
	.word	0x1145ff8a          ! %l0
	.word	0x737dd438          ! %l1
	.word	0x7ec06ded          ! %l2
	.word	0xfbff1391          ! %l3
	.word	0x2d20c5d4          ! %l4
	.word	0xf48ea659          ! %l5
	.word	0x812529fd          ! %l6
	.word	0xb91989ea          ! %l7
	.word	t0_data_exp_area0   ! %i0 (area pointer)
	.word	t0_data_exp_area0   ! %i1 (area pointer)
	.word	0x00000014          ! %i2 (byte offset)
	.word	0xffffffec          ! %i3 (halfword offset)
	.word	0x0000000c          ! %i4 (word offset)
	.word	0xffffffe8          ! %i5 (doubleword offset)
	.word	0x00000000          ! %fp (frame pointer)
	.word	0x00000000          ! %i7 (return address)
	.word	0x893a8bb9          ! %y
	.word	0x00000002          ! %icc (nzvc)
	.word	0x40000a53          ! %fsr
	.word	0x00000000          ! %gsr.mask
	.word	0x00000000          ! %gsr
	.word	0x00000082          ! %asi
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

KDATA_MODULE(t0_module_data_exp_stack, 0x0d042000)
.seg "data"
KGLOBAL(t0_data_exp_mtbl_size)
KGLOBAL(t0_data_exp_mtbl)
KGLOBAL(t0_data_exp_stack)
t0_data_exp_stack_start:
	.word	0xb1dd0510
	.word	0x729fbda0
	.word	0xaaa20647
	.word	0x57b846bd
	.word	0x7a6ec9c7
	.word	0x03aece5a
	.word	0x9437931f
	.word	0x54a48859
	.word	0x2f3848ff
	.word	0x3af185ba
	.word	0x81d59f77
	.word	0xca2334f5
	.word	0xd0a9c3e1
	.word	0x487e86fe
	.word	0x7b59fabb
	.word	0x5a4f3794
	.word	0xfa2b0d09
	.word	0xca1bbbd2
	.word	0xc0d3b1ef
	.word	0x027f981c
	.word	0xb17622a0
	.word	0xddafe6d2
	.word	0x383109e2
	.word	0xdd15bb7e
	.word	0x9238d5aa
	.word	0x0adc5a4d
	.word	0x729668a2
	.word	0x4c2d0219
	.word	0x7f59129c
	.word	0x56b4d74c
	.word	0x53b5e232
	.word	0xb03b6860
	.word	0x04dc9f31
	.word	0xff67d8d2
	.word	0x86c65c7a
	.word	0xfc890db9
	.word	0x042e617d
	.word	0xf209cf64
	.word	0x93347e7e
	.word	0x195ec5a8
	.word	0x5d888441
	.word	0x9eda10cb
	.word	0x2e16ded2
	.word	0x5f2a172c
	.word	0xddec0c81
	.word	0xf8808018
	.word	0xa812254d
	.word	0x80d74e69
	.word	0x6e83b454
	.word	0x052f31e7
	.word	0x58f113fd
	.word	0xcc888486
	.word	0x11d91efa
	.word	0xd58390e8
	.word	0x25ffab5a
	.word	0xbadac1d8
	.word	0xb220ba33
	.word	0x18b6c69b
	.word	0xa577ddbd
	.word	0xb4589e3f
	.word	0xc351e0ce
	.word	0x08656c5a
	.word	0x93418612
	.word	0xc4cc03d0
	.word	0xb906127f
	.word	0x7432c89c
	.word	0xe12e95cc
	.word	0x8b16f7b4
	.word	0xd47354f5
	.word	0x3f0c1c77
	.word	0x71f7ae19
	.word	0x1c558d4f
	.word	0xb783122c
	.word	0x5914c566
	.word	0xc1cc9857
	.word	0x388967a4
	.word	0xe84807ff
	.word	0xe28c374c
	.word	0x548f51c5
	.word	0x28316cf7
	.word	0x492b1d00
	.word	0xa98b12b8
	.word	0xa0079e7d
	.word	0xdb3690b3
	.word	0xd7502e8c
	.word	0x1e84db6a
	.word	0x6ac857a1
	.word	0x84c0d78e
	.word	0x6f312c19
	.word	0x6e501316
	.word	0xce5ee8d4
	.word	0x7315f9ea
	.word	0x287f13d1
	.word	0xf44ebc67
	.word	0x77f8b0ec
	.word	0x68d5487e
	.word	0x233da464
	.word	0x386d8a46
	.word	0x9d3139e5
	.word	0x4bfab735
	.word	0x8a07d819
	.word	0x3b503f5b
	.word	0xce777c18
	.word	0xc14d3255
	.word	0x95b87d27
	.word	0xc36601d3
	.word	0x3ca7a0ab
	.word	0xce7aa1e4
	.word	0x96937f42
	.word	0x8808a764
	.word	0xbf59f74b
	.word	0x14663f46
	.word	0x53c1b677
	.word	0x98763d8e
	.word	0x743f1318
	.word	0xb454212a
	.word	0x6cba4f3c
	.word	0xd3a45222
	.word	0xe8ec42e1
	.word	0xb7e721a7
	.word	0x1e521fc3
	.word	0x17e0c007
	.word	0x96fad891
	.word	0x7b9482a1
	.word	0xbfda7e8e
	.word	0x662c043b
	.word	0xf18ff3e8
	.word	0x6782f471
	.word	0x313e6e47
	.word	0x39755f18
	.word	0x3289c46d
	.word	0x5a00e2c5
	.word	0x12a632d1
	.word	0xf5a145d8
	.word	0x87ea76a2
	.word	0xd3182bc3
	.word	0x1616a39a
	.word	0x89c6e85b
	.word	0xb6e84079
	.word	0xe083a574
	.word	0xbd02cf32
	.word	0x2499cf27
	.word	0xf48d4107
	.word	0x4ead155f
	.word	0xe41bc421
	.word	0x65c0d5af
	.word	0xbb492776
	.word	0xf4a07e74
	.word	0x381392f4
	.word	0x8b2c04d7
	.word	0x2481d540
	.word	0x684be92c
	.word	0xfbc5dd99
	.word	0x3a8f11b7
	.word	0x944f6f9a
	.word	0xc43109ed
	.word	0xec8987ec
	.word	0x3d3e849f
	.word	0xd763942d
	.word	0xca2069b2
	.word	0xe1945d91
	.word	0x9c09cc5a
	.word	0xa6e2a50b
	.word	0xddebf4eb
	.word	0x6892c103
	.word	0x518cc1b7
	.word	0x86f15fe0
	.word	0x797914a1
t0_data_exp_sp:
	.word	0xd922b7ed
	.word	0x58175f44
	.word	0x42283467
	.word	0xa778b5dd
	.word	0x7402e8b8
	.word	0x44f2b15c
	.word	0xb1410e20
	.word	0x358de34a
	.word	t0_data_exp_area0
	.word	t0_data_exp_area0
	.word	0xffffffe9
	.word	0x00000016
	.word	0xfffffffc
	.word	0x00000018
	.word	t0_data_exp_fp
	.word	0x35d18751
	.word	0x69feaae7
	.word	0x732e9b24
	.word	0xaae30203
	.word	0x92a1106c
	.word	0xedfee498
	.word	0xfcf7c556
	.word	0xe5372ad3
	.word	0xdb9f8259
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
	.word   	0x7a618ae4	! [%fp - 0xc]
	.word   	0x34baae49	! [%fp - 0x8]
	.word   	0x409633a9	! [%fp - 0x4]
t0_data_exp_fp:
	.word	0x0ebe9b55
	.word	0x145f3f68
	.word	0x53364c30
	.word	0x2535f299
	.word	0xcef4c8be
	.word	0xe2c12dfa
	.word	0xc804abf6
	.word	0xe4334089
	.word	0x48d010d8
	.word	0xf724ad1f
	.word	0x307e7aa7
	.word	0xa41350bb
	.word	0x2ea754cd
	.word	0x43f3f1bf
	.word	0x4603410f
	.word	0xee4a6dab
	.word	0xf40f2ef5
	.word	0xcb89ca1b
	.word	0xfb1735a0
	.word	0x15b12f1a
	.word	0xeec7f158
	.word	0x91e193fe
	.word	0x8a71c898
	.word	0x1ace7d6a
t0_data_exp_stacktop:
	.word	0
t0_data_exp_stack_end:
.skip 6300	! page align

KDATA_MODULE(t0_module_data_exp_area0, 0x0da6e000)
.seg "data"
t0_data_exp_area0_start:
.skip 3328
t0_data_exp_area0_begin:
	.word	0xf2ae8870	! t0_data_exp_area0-0x20
	.word	0x7293e232	! t0_data_exp_area0-0x1c
	.word	0xaf264e62	! t0_data_exp_area0-0x18
	.word	0xea6df62c	! t0_data_exp_area0-0x14
	.word	0x26924632	! t0_data_exp_area0-0x10
	.word	0x73f38535	! t0_data_exp_area0-0xc
	.word	0x3bc26c3d	! t0_data_exp_area0-0x8
	.word	0x6a5f85f7	! t0_data_exp_area0-0x4
.global t0_data_exp_area0; t0_data_exp_area0:
	.word	0x3d6dd94f	! t0_data_exp_area0+0x0
	.word	0x3d25eb2d	! t0_data_exp_area0+0x4
	.word	0x55d42b1b	! t0_data_exp_area0+0x8
	.word	0x68b64b7b	! t0_data_exp_area0+0xc
	.word	0x82a1f4b6	! t0_data_exp_area0+0x10
	.word	0xe34d0b18	! t0_data_exp_area0+0x14
	.word	0x6603d4cb	! t0_data_exp_area0+0x18
	.word	0x28aa17d5	! t0_data_exp_area0+0x1c
t0_data_exp_area0_end:
.skip 4800
t0_data_exp_area0_stop:

KDATA_MODULE(t0_module_data_exp_shm_area, 0x0d720000)
.seg "data"
t0_data_exp_shm_area_start:
t0_data_exp_shm_area_begin:
.global t0_data_exp_shm_area; t0_data_exp_shm_area:
	.word	0x94b46b5d	! t0_data_exp_shm_area+0x0 (t0)
	.word	0xb5a5b925	! t0_data_exp_shm_area+0x4 (t1)
	.word	0x623e365a	! t0_data_exp_shm_area+0x8 (t2)
	.word	0x00000000	! t0_data_exp_shm_area+0xc (t3)
	.word	0x2cafc34e	! t0_data_exp_shm_area+0x10 (t4)
	.word	0x00000000	! t0_data_exp_shm_area+0x14 (t5)
	.word	0x009cb54b	! t0_data_exp_shm_area+0x18 (t6)
	.word	0x00000000	! t0_data_exp_shm_area+0x1c (t7)
	.word	0xb0884f47	! t0_data_exp_shm_area+0x20 (t0)
	.word	0xd02b2d3a	! t0_data_exp_shm_area+0x24 (t1)
	.word	0x9d8dbb92	! t0_data_exp_shm_area+0x28 (t2)
	.word	0x00000000	! t0_data_exp_shm_area+0x2c (t3)
	.word	0x0ea13687	! t0_data_exp_shm_area+0x30 (t4)
	.word	0x00000000	! t0_data_exp_shm_area+0x34 (t5)
	.word	0x7f0e742e	! t0_data_exp_shm_area+0x38 (t6)
	.word	0x00000000	! t0_data_exp_shm_area+0x3c (t7)
	.word	0x610bff59	! t0_data_exp_shm_area+0x40 (t0 bload)
	.word	0x86a02023	! t0_data_exp_shm_area+0x44
	.word	0x98fec441	! t0_data_exp_shm_area+0x48
	.word	0xe9f5330c	! t0_data_exp_shm_area+0x4c
	.word	0x1d9c6ab4	! t0_data_exp_shm_area+0x50
	.word	0xe814b45b	! t0_data_exp_shm_area+0x54
	.word	0xbfe38aab	! t0_data_exp_shm_area+0x58
	.word	0xf72f87b2	! t0_data_exp_shm_area+0x5c
	.word	0x8cda9491	! t0_data_exp_shm_area+0x60
	.word	0xdd690f58	! t0_data_exp_shm_area+0x64
	.word	0x3cd1deb4	! t0_data_exp_shm_area+0x68
	.word	0xe15c94ad	! t0_data_exp_shm_area+0x6c
	.word	0x98fd2690	! t0_data_exp_shm_area+0x70
	.word	0x50359435	! t0_data_exp_shm_area+0x74
	.word	0x43d30a0a	! t0_data_exp_shm_area+0x78
	.word	0x98cb8712	! t0_data_exp_shm_area+0x7c
	.word	0x45ada29c	! t0_data_exp_shm_area+0x80 (t0 bstore)
	.word	0xb1f20cde	! t0_data_exp_shm_area+0x84
	.word	0x17d61cf3	! t0_data_exp_shm_area+0x88
	.word	0x31e8e448	! t0_data_exp_shm_area+0x8c
	.word	0x32adf196	! t0_data_exp_shm_area+0x90
	.word	0x11cabde3	! t0_data_exp_shm_area+0x94
	.word	0xe5a9d791	! t0_data_exp_shm_area+0x98
	.word	0xabe9f400	! t0_data_exp_shm_area+0x9c
	.word	0x78f5b835	! t0_data_exp_shm_area+0xa0
	.word	0x9692638f	! t0_data_exp_shm_area+0xa4
	.word	0xbfd56368	! t0_data_exp_shm_area+0xa8
	.word	0x60705562	! t0_data_exp_shm_area+0xac
	.word	0xcf559627	! t0_data_exp_shm_area+0xb0
	.word	0x302e6c39	! t0_data_exp_shm_area+0xb4
	.word	0x0384a11d	! t0_data_exp_shm_area+0xb8
	.word	0xf2b53388	! t0_data_exp_shm_area+0xbc
	.word	0x626f3f29	! t0_data_exp_shm_area+0xc0 (t1 bload)
	.word	0xd3d5c515	! t0_data_exp_shm_area+0xc4
	.word	0x211f0dab	! t0_data_exp_shm_area+0xc8
	.word	0xb429cc73	! t0_data_exp_shm_area+0xcc
	.word	0x25c93c13	! t0_data_exp_shm_area+0xd0
	.word	0x34862873	! t0_data_exp_shm_area+0xd4
	.word	0x26e361dc	! t0_data_exp_shm_area+0xd8
	.word	0x4f994583	! t0_data_exp_shm_area+0xdc
	.word	0x36eadf10	! t0_data_exp_shm_area+0xe0
	.word	0x6f0485bd	! t0_data_exp_shm_area+0xe4
	.word	0xa3496b3d	! t0_data_exp_shm_area+0xe8
	.word	0xb76066d3	! t0_data_exp_shm_area+0xec
	.word	0xe9e54608	! t0_data_exp_shm_area+0xf0
	.word	0xccf71f85	! t0_data_exp_shm_area+0xf4
	.word	0x7fc6fcd1	! t0_data_exp_shm_area+0xf8
	.word	0x34e1c7e8	! t0_data_exp_shm_area+0xfc
	.word	0x68cbaafd	! t0_data_exp_shm_area+0x100 (t1 bstore)
	.word	0x87dcc50f	! t0_data_exp_shm_area+0x104
	.word	0x80a076e3	! t0_data_exp_shm_area+0x108
	.word	0x78c877d5	! t0_data_exp_shm_area+0x10c
	.word	0xa485e370	! t0_data_exp_shm_area+0x110
	.word	0x9950e7db	! t0_data_exp_shm_area+0x114
	.word	0x59b8ef02	! t0_data_exp_shm_area+0x118
	.word	0xd74c9ef0	! t0_data_exp_shm_area+0x11c
	.word	0xd140f203	! t0_data_exp_shm_area+0x120
	.word	0x5502f682	! t0_data_exp_shm_area+0x124
	.word	0x0bee544c	! t0_data_exp_shm_area+0x128
	.word	0x37b407c8	! t0_data_exp_shm_area+0x12c
	.word	0xb4248e5f	! t0_data_exp_shm_area+0x130
	.word	0x954810c5	! t0_data_exp_shm_area+0x134
	.word	0x215d13ef	! t0_data_exp_shm_area+0x138
	.word	0xa49dc356	! t0_data_exp_shm_area+0x13c
	.word	0x10fb5f47	! t0_data_exp_shm_area+0x140 (t2 bload)
	.word	0x73cc0e17	! t0_data_exp_shm_area+0x144
	.word	0x87fe6733	! t0_data_exp_shm_area+0x148
	.word	0x3a5285a9	! t0_data_exp_shm_area+0x14c
	.word	0x9c34667e	! t0_data_exp_shm_area+0x150
	.word	0x12f71ecd	! t0_data_exp_shm_area+0x154
	.word	0x91b5cc0f	! t0_data_exp_shm_area+0x158
	.word	0x0747998c	! t0_data_exp_shm_area+0x15c
	.word	0xc4f25803	! t0_data_exp_shm_area+0x160
	.word	0xd00d8ca6	! t0_data_exp_shm_area+0x164
	.word	0x63d190ac	! t0_data_exp_shm_area+0x168
	.word	0x81962052	! t0_data_exp_shm_area+0x16c
	.word	0x85c109c5	! t0_data_exp_shm_area+0x170
	.word	0x1e2580cf	! t0_data_exp_shm_area+0x174
	.word	0x4f634ec7	! t0_data_exp_shm_area+0x178
	.word	0xe1e63915	! t0_data_exp_shm_area+0x17c
	.word	0xf6617cb8	! t0_data_exp_shm_area+0x180 (t2 bstore)
	.word	0x5d1c6057	! t0_data_exp_shm_area+0x184
	.word	0x1e3164f6	! t0_data_exp_shm_area+0x188
	.word	0xd0c66941	! t0_data_exp_shm_area+0x18c
	.word	0x8161c1c5	! t0_data_exp_shm_area+0x190
	.word	0xcbe68014	! t0_data_exp_shm_area+0x194
	.word	0x687566b3	! t0_data_exp_shm_area+0x198
	.word	0xabe34d0e	! t0_data_exp_shm_area+0x19c
	.word	0x9719ba02	! t0_data_exp_shm_area+0x1a0
	.word	0x1acbb2c3	! t0_data_exp_shm_area+0x1a4
	.word	0x8188f9bb	! t0_data_exp_shm_area+0x1a8
	.word	0x7beb4c4a	! t0_data_exp_shm_area+0x1ac
	.word	0x90b72623	! t0_data_exp_shm_area+0x1b0
	.word	0xc45c1572	! t0_data_exp_shm_area+0x1b4
	.word	0x6bf2b499	! t0_data_exp_shm_area+0x1b8
	.word	0xf672575b	! t0_data_exp_shm_area+0x1bc
	.word	0x00000000	! t0_data_exp_shm_area+0x1c0 (t3 bload)
	.word	0x00000000	! t0_data_exp_shm_area+0x1c4
	.word	0x00000000	! t0_data_exp_shm_area+0x1c8
	.word	0x00000000	! t0_data_exp_shm_area+0x1cc
	.word	0x00000000	! t0_data_exp_shm_area+0x1d0
	.word	0x00000000	! t0_data_exp_shm_area+0x1d4
	.word	0x00000000	! t0_data_exp_shm_area+0x1d8
	.word	0x00000000	! t0_data_exp_shm_area+0x1dc
	.word	0x00000000	! t0_data_exp_shm_area+0x1e0
	.word	0x00000000	! t0_data_exp_shm_area+0x1e4
	.word	0x00000000	! t0_data_exp_shm_area+0x1e8
	.word	0x00000000	! t0_data_exp_shm_area+0x1ec
	.word	0x00000000	! t0_data_exp_shm_area+0x1f0
	.word	0x00000000	! t0_data_exp_shm_area+0x1f4
	.word	0x00000000	! t0_data_exp_shm_area+0x1f8
	.word	0x00000000	! t0_data_exp_shm_area+0x1fc
	.word	0x00000000	! t0_data_exp_shm_area+0x200 (t3 bstore)
	.word	0x00000000	! t0_data_exp_shm_area+0x204
	.word	0x00000000	! t0_data_exp_shm_area+0x208
	.word	0x00000000	! t0_data_exp_shm_area+0x20c
	.word	0x00000000	! t0_data_exp_shm_area+0x210
	.word	0x00000000	! t0_data_exp_shm_area+0x214
	.word	0x00000000	! t0_data_exp_shm_area+0x218
	.word	0x00000000	! t0_data_exp_shm_area+0x21c
	.word	0x00000000	! t0_data_exp_shm_area+0x220
	.word	0x00000000	! t0_data_exp_shm_area+0x224
	.word	0x00000000	! t0_data_exp_shm_area+0x228
	.word	0x00000000	! t0_data_exp_shm_area+0x22c
	.word	0x00000000	! t0_data_exp_shm_area+0x230
	.word	0x00000000	! t0_data_exp_shm_area+0x234
	.word	0x00000000	! t0_data_exp_shm_area+0x238
	.word	0x00000000	! t0_data_exp_shm_area+0x23c
	.word	0x0fbeb527	! t0_data_exp_shm_area+0x240 (t4 bload)
	.word	0x9139d23c	! t0_data_exp_shm_area+0x244
	.word	0x72e348d8	! t0_data_exp_shm_area+0x248
	.word	0xad8333c0	! t0_data_exp_shm_area+0x24c
	.word	0x03448fe2	! t0_data_exp_shm_area+0x250
	.word	0x071c550a	! t0_data_exp_shm_area+0x254
	.word	0xddadee4c	! t0_data_exp_shm_area+0x258
	.word	0xe58fd5ef	! t0_data_exp_shm_area+0x25c
	.word	0x236d5f30	! t0_data_exp_shm_area+0x260
	.word	0x7c6776f4	! t0_data_exp_shm_area+0x264
	.word	0xa79715dd	! t0_data_exp_shm_area+0x268
	.word	0x36f1dd99	! t0_data_exp_shm_area+0x26c
	.word	0x0f59ea18	! t0_data_exp_shm_area+0x270
	.word	0x7d66e1fb	! t0_data_exp_shm_area+0x274
	.word	0x5b06353e	! t0_data_exp_shm_area+0x278
	.word	0x088fabf2	! t0_data_exp_shm_area+0x27c
	.word	0xb28def56	! t0_data_exp_shm_area+0x280 (t4 bstore)
	.word	0x53f9f61e	! t0_data_exp_shm_area+0x284
	.word	0x381f4655	! t0_data_exp_shm_area+0x288
	.word	0x1218f780	! t0_data_exp_shm_area+0x28c
	.word	0x7c416726	! t0_data_exp_shm_area+0x290
	.word	0x1dc14893	! t0_data_exp_shm_area+0x294
	.word	0xd1290f2e	! t0_data_exp_shm_area+0x298
	.word	0xc528a6fe	! t0_data_exp_shm_area+0x29c
	.word	0x0fa38e62	! t0_data_exp_shm_area+0x2a0
	.word	0xa30e5354	! t0_data_exp_shm_area+0x2a4
	.word	0x2bfb7532	! t0_data_exp_shm_area+0x2a8
	.word	0x73eef682	! t0_data_exp_shm_area+0x2ac
	.word	0x0cdb0ecf	! t0_data_exp_shm_area+0x2b0
	.word	0x15a018dc	! t0_data_exp_shm_area+0x2b4
	.word	0x64234f98	! t0_data_exp_shm_area+0x2b8
	.word	0x24764ae1	! t0_data_exp_shm_area+0x2bc
	.word	0x00000000	! t0_data_exp_shm_area+0x2c0 (t5 bload)
	.word	0x00000000	! t0_data_exp_shm_area+0x2c4
	.word	0x00000000	! t0_data_exp_shm_area+0x2c8
	.word	0x00000000	! t0_data_exp_shm_area+0x2cc
	.word	0x00000000	! t0_data_exp_shm_area+0x2d0
	.word	0x00000000	! t0_data_exp_shm_area+0x2d4
	.word	0x00000000	! t0_data_exp_shm_area+0x2d8
	.word	0x00000000	! t0_data_exp_shm_area+0x2dc
	.word	0x00000000	! t0_data_exp_shm_area+0x2e0
	.word	0x00000000	! t0_data_exp_shm_area+0x2e4
	.word	0x00000000	! t0_data_exp_shm_area+0x2e8
	.word	0x00000000	! t0_data_exp_shm_area+0x2ec
	.word	0x00000000	! t0_data_exp_shm_area+0x2f0
	.word	0x00000000	! t0_data_exp_shm_area+0x2f4
	.word	0x00000000	! t0_data_exp_shm_area+0x2f8
	.word	0x00000000	! t0_data_exp_shm_area+0x2fc
	.word	0x00000000	! t0_data_exp_shm_area+0x300 (t5 bstore)
	.word	0x00000000	! t0_data_exp_shm_area+0x304
	.word	0x00000000	! t0_data_exp_shm_area+0x308
	.word	0x00000000	! t0_data_exp_shm_area+0x30c
	.word	0x00000000	! t0_data_exp_shm_area+0x310
	.word	0x00000000	! t0_data_exp_shm_area+0x314
	.word	0x00000000	! t0_data_exp_shm_area+0x318
	.word	0x00000000	! t0_data_exp_shm_area+0x31c
	.word	0x00000000	! t0_data_exp_shm_area+0x320
	.word	0x00000000	! t0_data_exp_shm_area+0x324
	.word	0x00000000	! t0_data_exp_shm_area+0x328
	.word	0x00000000	! t0_data_exp_shm_area+0x32c
	.word	0x00000000	! t0_data_exp_shm_area+0x330
	.word	0x00000000	! t0_data_exp_shm_area+0x334
	.word	0x00000000	! t0_data_exp_shm_area+0x338
	.word	0x00000000	! t0_data_exp_shm_area+0x33c
	.word	0x3d6c242d	! t0_data_exp_shm_area+0x340 (t6 bload)
	.word	0x1578014d	! t0_data_exp_shm_area+0x344
	.word	0x3cdc9c2a	! t0_data_exp_shm_area+0x348
	.word	0xac6eccb4	! t0_data_exp_shm_area+0x34c
	.word	0x2d00dc80	! t0_data_exp_shm_area+0x350
	.word	0x618586e0	! t0_data_exp_shm_area+0x354
	.word	0x562040d9	! t0_data_exp_shm_area+0x358
	.word	0xd1611f69	! t0_data_exp_shm_area+0x35c
	.word	0xe2efe765	! t0_data_exp_shm_area+0x360
	.word	0x834903d0	! t0_data_exp_shm_area+0x364
	.word	0x0f7c85ab	! t0_data_exp_shm_area+0x368
	.word	0x5410c5a1	! t0_data_exp_shm_area+0x36c
	.word	0x53becdf3	! t0_data_exp_shm_area+0x370
	.word	0x4196c7c1	! t0_data_exp_shm_area+0x374
	.word	0x3e2b1d6f	! t0_data_exp_shm_area+0x378
	.word	0x578a4bec	! t0_data_exp_shm_area+0x37c
	.word	0x49898b8c	! t0_data_exp_shm_area+0x380 (t6 bstore)
	.word	0xc119b49a	! t0_data_exp_shm_area+0x384
	.word	0xdaa96d18	! t0_data_exp_shm_area+0x388
	.word	0xffcadcf3	! t0_data_exp_shm_area+0x38c
	.word	0x8bfd821d	! t0_data_exp_shm_area+0x390
	.word	0x28525779	! t0_data_exp_shm_area+0x394
	.word	0x9db1639f	! t0_data_exp_shm_area+0x398
	.word	0x97db0587	! t0_data_exp_shm_area+0x39c
	.word	0x4058eea4	! t0_data_exp_shm_area+0x3a0
	.word	0xe3ba1ce6	! t0_data_exp_shm_area+0x3a4
	.word	0xdc0d6c28	! t0_data_exp_shm_area+0x3a8
	.word	0x07c925f7	! t0_data_exp_shm_area+0x3ac
	.word	0x784ea1f2	! t0_data_exp_shm_area+0x3b0
	.word	0x6169144a	! t0_data_exp_shm_area+0x3b4
	.word	0x20b6de63	! t0_data_exp_shm_area+0x3b8
	.word	0x20c924a1	! t0_data_exp_shm_area+0x3bc
	.word	0x00000000	! t0_data_exp_shm_area+0x3c0 (t7 bload)
	.word	0x00000000	! t0_data_exp_shm_area+0x3c4
	.word	0x00000000	! t0_data_exp_shm_area+0x3c8
	.word	0x00000000	! t0_data_exp_shm_area+0x3cc
	.word	0x00000000	! t0_data_exp_shm_area+0x3d0
	.word	0x00000000	! t0_data_exp_shm_area+0x3d4
	.word	0x00000000	! t0_data_exp_shm_area+0x3d8
	.word	0x00000000	! t0_data_exp_shm_area+0x3dc
	.word	0x00000000	! t0_data_exp_shm_area+0x3e0
	.word	0x00000000	! t0_data_exp_shm_area+0x3e4
	.word	0x00000000	! t0_data_exp_shm_area+0x3e8
	.word	0x00000000	! t0_data_exp_shm_area+0x3ec
	.word	0x00000000	! t0_data_exp_shm_area+0x3f0
	.word	0x00000000	! t0_data_exp_shm_area+0x3f4
	.word	0x00000000	! t0_data_exp_shm_area+0x3f8
	.word	0x00000000	! t0_data_exp_shm_area+0x3fc
	.word	0x00000000	! t0_data_exp_shm_area+0x400 (t7 bstore)
	.word	0x00000000	! t0_data_exp_shm_area+0x404
	.word	0x00000000	! t0_data_exp_shm_area+0x408
	.word	0x00000000	! t0_data_exp_shm_area+0x40c
	.word	0x00000000	! t0_data_exp_shm_area+0x410
	.word	0x00000000	! t0_data_exp_shm_area+0x414
	.word	0x00000000	! t0_data_exp_shm_area+0x418
	.word	0x00000000	! t0_data_exp_shm_area+0x41c
	.word	0x00000000	! t0_data_exp_shm_area+0x420
	.word	0x00000000	! t0_data_exp_shm_area+0x424
	.word	0x00000000	! t0_data_exp_shm_area+0x428
	.word	0x00000000	! t0_data_exp_shm_area+0x42c
	.word	0x00000000	! t0_data_exp_shm_area+0x430
	.word	0x00000000	! t0_data_exp_shm_area+0x434
	.word	0x00000000	! t0_data_exp_shm_area+0x438
	.word	0x00000000	! t0_data_exp_shm_area+0x43c
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
        TTE_L=1, TTE_CP=T0_KAOS_RUN_AREA0_CACHEABLE, TTE_CV=T0_KAOS_RUN_AREA0_CACHEABLE, TTE_E=0, TTE_P=0, TTE_W=0
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
        setx      LOCAL_SUPERVISOR_SECTION_DATA_VA, %g1, %o2
        ldx       [%o2], %g1

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


.global illegal_trap_handler
illegal_trap_handler:

        rdpr     %tpc, %g2
        setx     LOCAL_SUPERVISOR_SECTION_DATA_PA, %g3, %g1
        stx      %g2, [%g1]

        mov     0x08, %g1
        ldxa    [%g1] 0x21, %o1
        mov     0x10, %g1
        ldxa    [%g1] 0x21, %o2
        set     0x1, %o3
        set     0x0, %o4
        setx    handle_ill_trap, %g1, %o5

        ta 0x2a

        nop

handle_ill_trap:
                        setx      LOCAL_SUPERVISOR_SECTION_DATA_VA, %g1, %o2
                        ldx       [%o2], %g1
                        lda      [%g1]ASI_PRIMARY, %g5
			sethi	%hi(0x1fffff), %g6 
			or	%g6, %lo(0x1fffff), %g6 
			cmp	%g5, %g6 
			tne	0x1 !bad trap
                        nop
                        done
                        nop



attr_data {
        Name = local_supervisor_section_data,
        VA=LOCAL_SUPERVISOR_SECTION_DATA_VA, 
	PA=ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA,0),
	RA=LOCAL_SUPERVISOR_SECTION_DATA_PA,
        part_0_ctx_zero_tsb_config_0,
        part_0_ctx_nonzero_tsb_config_0,
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


