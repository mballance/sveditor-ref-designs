/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_mt_write_tsb_0.s
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
#include "asi_s.h"

#ifndef NOHWTW
#define THR0_Z_CTX_TSB_CONFIG_0  0xc000000001000010
#define THR0_Z_CTX_TSB_CONFIG_1  0xa000000001010030
#define THR0_Z_CTX_TSB_CONFIG_2  0xa000000001020150
#define THR0_Z_CTX_TSB_CONFIG_3  0x8000000001030000
#define THR0_NZ_CTX_TSB_CONFIG_0 0x8000000001200030
#define THR0_NZ_CTX_TSB_CONFIG_1 0x8000000001210150
#define THR0_NZ_CTX_TSB_CONFIG_2 0x8000000001220100
#define THR0_NZ_CTX_TSB_CONFIG_3 0x8000000001230000
#define THR1_Z_CTX_TSB_CONFIG_0  0x8000000001040010
#define THR1_Z_CTX_TSB_CONFIG_1  0xa000000001050030
#define THR1_Z_CTX_TSB_CONFIG_2  0x8000000001060050
#define THR1_Z_CTX_TSB_CONFIG_3  0xa000000001070100
#define THR1_NZ_CTX_TSB_CONFIG_0 0x8000000001240030
#define THR1_NZ_CTX_TSB_CONFIG_1 0x8000000001250110
#define THR1_NZ_CTX_TSB_CONFIG_2 0x8000000001260100
#define THR1_NZ_CTX_TSB_CONFIG_3 0x8000000001270000
#define THR2_Z_CTX_TSB_CONFIG_0  0xa000000001080030
#define THR2_Z_CTX_TSB_CONFIG_1  0xc000000001090150
#define THR2_Z_CTX_TSB_CONFIG_2  0xc0000000010a0100
#define THR2_Z_CTX_TSB_CONFIG_3  0x80000000010b0010
#define THR2_NZ_CTX_TSB_CONFIG_0 0xc000000001280030
#define THR2_NZ_CTX_TSB_CONFIG_1 0xc000000001290100
#define THR2_NZ_CTX_TSB_CONFIG_2 0xc0000000012a0100
#define THR2_NZ_CTX_TSB_CONFIG_3 0x80000000012b0000
#define THR3_Z_CTX_TSB_CONFIG_0  0xc0000000010c0130
#define THR3_Z_CTX_TSB_CONFIG_1  0xa0000000010d0150
#define THR3_Z_CTX_TSB_CONFIG_2  0xc0000000010e0100
#define THR3_Z_CTX_TSB_CONFIG_3  0xc0000000010f0110
#define THR3_NZ_CTX_TSB_CONFIG_0 0xc0000000012c0030
#define THR3_NZ_CTX_TSB_CONFIG_1 0xa0000000012d0000
#define THR3_NZ_CTX_TSB_CONFIG_2 0xc0000000012e0100
#define THR3_NZ_CTX_TSB_CONFIG_3 0xc0000000012f0000
#define THR4_Z_CTX_TSB_CONFIG_0  0x8000000001100050
#define THR4_Z_CTX_TSB_CONFIG_1  0x8000000001110100
#define THR4_Z_CTX_TSB_CONFIG_2  0x8000000001120010
#define THR4_Z_CTX_TSB_CONFIG_3  0x8000000001130130
#define THR4_NZ_CTX_TSB_CONFIG_0 0xc000000001300030
#define THR4_NZ_CTX_TSB_CONFIG_1 0x8000000001310000
#define THR4_NZ_CTX_TSB_CONFIG_2 0x8000000001320100
#define THR4_NZ_CTX_TSB_CONFIG_3 0xa000000001330000
#define THR5_Z_CTX_TSB_CONFIG_0  0xc000000001140050
#define THR5_Z_CTX_TSB_CONFIG_1  0x8000000001150110
#define THR5_Z_CTX_TSB_CONFIG_2  0xa000000001160100
#define THR5_Z_CTX_TSB_CONFIG_3  0x8000000001170030
#define THR5_NZ_CTX_TSB_CONFIG_0 0x8000000001340030
#define THR5_NZ_CTX_TSB_CONFIG_1 0x8000000001350100
#define THR5_NZ_CTX_TSB_CONFIG_2 0x8000000001360100
#define THR5_NZ_CTX_TSB_CONFIG_3 0x8000000001370000
#define THR6_Z_CTX_TSB_CONFIG_0  0x8000000001180150
#define THR6_Z_CTX_TSB_CONFIG_1  0xc000000001190100
#define THR6_Z_CTX_TSB_CONFIG_2  0x80000000011a0110
#define THR6_Z_CTX_TSB_CONFIG_3  0xa0000000011b0030
#define THR6_NZ_CTX_TSB_CONFIG_0 0xc000000001380030
#define THR6_NZ_CTX_TSB_CONFIG_1 0x8000000001390050
#define THR6_NZ_CTX_TSB_CONFIG_2 0xa0000000013a0100
#define THR6_NZ_CTX_TSB_CONFIG_3 0xc0000000013b0000
#define THR7_Z_CTX_TSB_CONFIG_0  0xc0000000011c0010
#define THR7_Z_CTX_TSB_CONFIG_1  0xa0000000011d0030
#define THR7_Z_CTX_TSB_CONFIG_2  0xa0000000011e0150
#define THR7_Z_CTX_TSB_CONFIG_3  0x80000000011f0100
#define THR7_NZ_CTX_TSB_CONFIG_0 0x80000000013c0030
#define THR7_NZ_CTX_TSB_CONFIG_1 0x80000000013d0150
#define THR7_NZ_CTX_TSB_CONFIG_2 0x80000000013e0100
#define THR7_NZ_CTX_TSB_CONFIG_3 0x80000000013f0000
#else
#define THR0_Z_CTX_TSB_CONFIG_0  0x4000000001000010
#define THR0_Z_CTX_TSB_CONFIG_1  0x2000000001010030
#define THR0_Z_CTX_TSB_CONFIG_2  0x2000000001020150
#define THR0_Z_CTX_TSB_CONFIG_3  0x0000000001030000
#define THR0_NZ_CTX_TSB_CONFIG_0 0x0000000001200030
#define THR0_NZ_CTX_TSB_CONFIG_1 0x0000000001210150
#define THR0_NZ_CTX_TSB_CONFIG_2 0x0000000001220100
#define THR0_NZ_CTX_TSB_CONFIG_3 0x0000000001230000
#define THR1_Z_CTX_TSB_CONFIG_0  0x0000000001040010
#define THR1_Z_CTX_TSB_CONFIG_1  0x2000000001050030
#define THR1_Z_CTX_TSB_CONFIG_2  0x0000000001060050
#define THR1_Z_CTX_TSB_CONFIG_3  0x2000000001070100
#define THR1_NZ_CTX_TSB_CONFIG_0 0x0000000001240030
#define THR1_NZ_CTX_TSB_CONFIG_1 0x0000000001250110
#define THR1_NZ_CTX_TSB_CONFIG_2 0x0000000001260100
#define THR1_NZ_CTX_TSB_CONFIG_3 0x0000000001270000
#define THR2_Z_CTX_TSB_CONFIG_0  0x2000000001080030
#define THR2_Z_CTX_TSB_CONFIG_1  0x4000000001090150
#define THR2_Z_CTX_TSB_CONFIG_2  0x40000000010a0100
#define THR2_Z_CTX_TSB_CONFIG_3  0x00000000010b0010
#define THR2_NZ_CTX_TSB_CONFIG_0 0x4000000001280030
#define THR2_NZ_CTX_TSB_CONFIG_1 0x4000000001290100
#define THR2_NZ_CTX_TSB_CONFIG_2 0x40000000012a0100
#define THR2_NZ_CTX_TSB_CONFIG_3 0x00000000012b0000
#define THR3_Z_CTX_TSB_CONFIG_0  0x40000000010c0130
#define THR3_Z_CTX_TSB_CONFIG_1  0x20000000010d0150
#define THR3_Z_CTX_TSB_CONFIG_2  0x40000000010e0100
#define THR3_Z_CTX_TSB_CONFIG_3  0x40000000010f0110
#define THR3_NZ_CTX_TSB_CONFIG_0 0x40000000012c0030
#define THR3_NZ_CTX_TSB_CONFIG_1 0x20000000012d0000
#define THR3_NZ_CTX_TSB_CONFIG_2 0x40000000012e0100
#define THR3_NZ_CTX_TSB_CONFIG_3 0x40000000012f0000
#define THR4_Z_CTX_TSB_CONFIG_0  0x0000000001100050
#define THR4_Z_CTX_TSB_CONFIG_1  0x0000000001110100
#define THR4_Z_CTX_TSB_CONFIG_2  0x0000000001120010
#define THR4_Z_CTX_TSB_CONFIG_3  0x0000000001130130
#define THR4_NZ_CTX_TSB_CONFIG_0 0x4000000001300030
#define THR4_NZ_CTX_TSB_CONFIG_1 0x0000000001310000
#define THR4_NZ_CTX_TSB_CONFIG_2 0x0000000001320100
#define THR4_NZ_CTX_TSB_CONFIG_3 0x2000000001330000
#define THR5_Z_CTX_TSB_CONFIG_0  0x4000000001140050
#define THR5_Z_CTX_TSB_CONFIG_1  0x0000000001150110
#define THR5_Z_CTX_TSB_CONFIG_2  0x2000000001160100
#define THR5_Z_CTX_TSB_CONFIG_3  0x0000000001170030
#define THR5_NZ_CTX_TSB_CONFIG_0 0x0000000001340030
#define THR5_NZ_CTX_TSB_CONFIG_1 0x0000000001350100
#define THR5_NZ_CTX_TSB_CONFIG_2 0x0000000001360100
#define THR5_NZ_CTX_TSB_CONFIG_3 0x0000000001370000
#define THR6_Z_CTX_TSB_CONFIG_0  0x0000000001180150
#define THR6_Z_CTX_TSB_CONFIG_1  0x4000000001190100
#define THR6_Z_CTX_TSB_CONFIG_2  0x00000000011a0110
#define THR6_Z_CTX_TSB_CONFIG_3  0x20000000011b0030
#define THR6_NZ_CTX_TSB_CONFIG_0 0x4000000001380030
#define THR6_NZ_CTX_TSB_CONFIG_1 0x0000000001390050
#define THR6_NZ_CTX_TSB_CONFIG_2 0x20000000013a0100
#define THR6_NZ_CTX_TSB_CONFIG_3 0x40000000013b0000
#define THR7_Z_CTX_TSB_CONFIG_0  0x40000000011c0010
#define THR7_Z_CTX_TSB_CONFIG_1  0x20000000011d0030
#define THR7_Z_CTX_TSB_CONFIG_2  0x20000000011e0150
#define THR7_Z_CTX_TSB_CONFIG_3  0x00000000011f0100
#define THR7_NZ_CTX_TSB_CONFIG_0 0x00000000013c0030
#define THR7_NZ_CTX_TSB_CONFIG_1 0x00000000013d0150
#define THR7_NZ_CTX_TSB_CONFIG_2 0x00000000013e0100
#define THR7_NZ_CTX_TSB_CONFIG_3 0x00000000013f0000
#endif
#define THR0_REAL_RANGE_0 0x8000008000000000
#define THR0_REAL_RANGE_1 0x8000080000000000
#define THR0_REAL_RANGE_2 0x8000800000000000
#define THR0_REAL_RANGE_3 0x8008000000000000
#define THR1_REAL_RANGE_0 0x8000008000000000
#define THR1_REAL_RANGE_1 0x8000080000000000
#define THR1_REAL_RANGE_2 0x8000800000000000
#define THR1_REAL_RANGE_3 0x8008000000000000
#define THR2_REAL_RANGE_0 0x8000008000000000
#define THR2_REAL_RANGE_1 0x8000080000000000
#define THR2_REAL_RANGE_2 0x8000800000000000
#define THR2_REAL_RANGE_3 0x8008000000000000
#define THR3_REAL_RANGE_0 0x8000008000000000
#define THR3_REAL_RANGE_1 0x8000080000000000
#define THR3_REAL_RANGE_2 0x8000800000000000
#define THR3_REAL_RANGE_3 0x8008000000000000
#define THR4_REAL_RANGE_0 0x8000008000000000
#define THR4_REAL_RANGE_1 0x8000080000000000
#define THR4_REAL_RANGE_2 0x8000800000000000
#define THR4_REAL_RANGE_3 0x8008000000000000
#define THR5_REAL_RANGE_0 0x8000008000000000
#define THR5_REAL_RANGE_1 0x8000080000000000
#define THR5_REAL_RANGE_2 0x8000800000000000
#define THR5_REAL_RANGE_3 0x8008000000000000
#define THR6_REAL_RANGE_0 0x8000008000000000
#define THR6_REAL_RANGE_1 0x8000080000000000
#define THR6_REAL_RANGE_2 0x8000800000000000
#define THR6_REAL_RANGE_3 0x8008000000000000
#define THR7_REAL_RANGE_0 0x8000008000000000
#define THR7_REAL_RANGE_1 0x8000080000000000
#define THR7_REAL_RANGE_2 0x8000800000000000
#define THR7_REAL_RANGE_3 0x8008000000000000
#define THR0_PHY_OFF_0 0x0000000002000000
#define THR0_PHY_OFF_1 0x0000000020000000
#define THR0_PHY_OFF_2 0x0000000200000000
#define THR0_PHY_OFF_3 0x0000002000000000
#define THR1_PHY_OFF_0 0x0000000004000000
#define THR1_PHY_OFF_1 0x0000000040000000
#define THR1_PHY_OFF_2 0x0000000400000000
#define THR1_PHY_OFF_3 0x0000004000000000
#define THR2_PHY_OFF_0 0x0000000006000000
#define THR2_PHY_OFF_1 0x0000000060000000
#define THR2_PHY_OFF_2 0x0000000600000000
#define THR2_PHY_OFF_3 0x0000006000000000
#define THR3_PHY_OFF_0 0x0000000008000000
#define THR3_PHY_OFF_1 0x0000000080000000
#define THR3_PHY_OFF_2 0x0000000800000000
#define THR3_PHY_OFF_3 0x0000002000000000
#define THR4_PHY_OFF_0 0x000000000a000000
#define THR4_PHY_OFF_1 0x00000000a0000000
#define THR4_PHY_OFF_2 0x0000000a00000000
#define THR4_PHY_OFF_3 0x0000004000000000
#define THR5_PHY_OFF_0 0x000000000c000000
#define THR5_PHY_OFF_1 0x00000000c0000000
#define THR5_PHY_OFF_2 0x0000000c00000000
#define THR5_PHY_OFF_3 0x0000006000000000
#define THR6_PHY_OFF_0 0x000000000e000000
#define THR6_PHY_OFF_1 0x00000000e0000000
#define THR6_PHY_OFF_2 0x0000000e00000000
#define THR6_PHY_OFF_3 0x0000002000000000
#define THR7_PHY_OFF_0 0x0000000010000000
#define THR7_PHY_OFF_1 0x0000000100000000
#define THR7_PHY_OFF_2 0x0000001000000000
#define THR7_PHY_OFF_3 0x0000004000000000
#define THR_0_PARTID 0
#define THR_1_PARTID 1
#define THR_2_PARTID 2
#define THR_3_PARTID 3
#define THR_4_PARTID 4
#define THR_5_PARTID 5
#define THR_6_PARTID 6
#define THR_7_PARTID 7
#define NUCLEUS 0x0
#define THR0_PCONTEXT_0 0x07b6
#define THR0_PCONTEXT_1 0x03fe
#define THR0_SCONTEXT_0 0x1dc7
#define THR0_SCONTEXT_1 0x0023
#define THR1_PCONTEXT_0 0x0e94
#define THR1_PCONTEXT_1 0x1ca8
#define THR1_SCONTEXT_0 0x0363
#define THR1_SCONTEXT_1 0x152a
#define THR2_PCONTEXT_0 0x032c
#define THR2_PCONTEXT_1 0x1160
#define THR2_SCONTEXT_0 0x0133
#define THR2_SCONTEXT_1 0x00e1
#define THR3_PCONTEXT_0 0x12fb
#define THR3_PCONTEXT_1 0x0f1b
#define THR3_SCONTEXT_0 0x1e13
#define THR3_SCONTEXT_1 0x187d
#define THR4_PCONTEXT_0 0x06f9
#define THR4_PCONTEXT_1 0x099f
#define THR4_SCONTEXT_0 0x0883
#define THR4_SCONTEXT_1 0x18ac
#define THR5_PCONTEXT_0 0x11c9
#define THR5_PCONTEXT_1 0x10ca
#define THR5_SCONTEXT_0 0x0d55
#define THR5_SCONTEXT_1 0x05eb
#define THR6_PCONTEXT_0 0x0d7e
#define THR6_PCONTEXT_1 0x0a0e
#define THR6_SCONTEXT_0 0x10af
#define THR6_SCONTEXT_1 0x1179
#define THR7_PCONTEXT_0 0x1aee
#define THR7_PCONTEXT_1 0x098a
#define THR7_SCONTEXT_0 0x14f2
#define THR7_SCONTEXT_1 0x069e
#define THR0_PTRAP_TEXT_VA 0x000018090000
#define THR0_PTRAP_TEXT_RA 0x003e5e0000
#define THR0_PTRAP_TEXT_PA 0x003e5e0000
#define THR1_PTRAP_TEXT_VA 0x000018680000
#define THR1_PTRAP_TEXT_RA 0x005e0d0000
#define THR1_PTRAP_TEXT_PA 0x005e0d0000
#define THR2_PTRAP_TEXT_VA 0x000018d10000
#define THR2_PTRAP_TEXT_RA 0x007e7b0000
#define THR2_PTRAP_TEXT_PA 0x007e7b0000
#define THR3_PTRAP_TEXT_VA 0x000018e00000
#define THR3_PTRAP_TEXT_RA 0x001ea20000
#define THR3_PTRAP_TEXT_PA 0x009ea20000
#define THR4_PTRAP_TEXT_VA 0x000018990000
#define THR4_PTRAP_TEXT_RA 0x00be530000
#define THR4_PTRAP_TEXT_PA 0x00be530000
#define THR5_PTRAP_TEXT_VA 0x000018a10000
#define THR5_PTRAP_TEXT_RA 0x001e1f0000
#define THR5_PTRAP_TEXT_PA 0x00de1f0000
#define THR6_PTRAP_TEXT_VA 0x000018f20000
#define THR6_PTRAP_TEXT_RA 0x001e4c0000
#define THR6_PTRAP_TEXT_PA 0x00fe4c0000
#define THR7_PTRAP_TEXT_VA 0x000018620000
#define THR7_PTRAP_TEXT_RA 0x011e550000
#define THR7_PTRAP_TEXT_PA 0x011e550000
/*****************************************************************************
 * $Revision: 1.1 $
 *****************************************************************************/
#define HV_RED_TEXT_PA                  0x10000
#define HV_RED_DATA_PA                  0x20000
#define HPTRAP_TEXT_PA                  0x80000
#define HPTRAPS_EXT_TEXT_PA             0x90000
#define HPTRAPS_EXT_DATA_PA             0x98000
#define P_GOOD_TRAP                     0x0
#define P_BAD_TRAP                      0x1
#define HP_GOOD_TRAP                    0xa0
#define HP_BAD_TRAP                     0xa1
#define EXIT_GOOD                       ta P_GOOD_TRAP; nop
#define EXIT_BAD                        ta P_BAD_TRAP; nop
#define REALRANGE_LO_MASK               0x0000000007ffffff
#define REALRANGE_HI_MASK               0x003ffffff8000000
#define RANOTPA_MASK                    0x100
#define SUN4V_MASK                      0x000
#define TTE_RA_MASK                     0x000000ffffffe000

#define IDEMAP_ALL		ta PTRAP_I_DEMAP_ALL
#define IDEMAP_PCTX		ta PTRAP_I_DEMAP_PCTX
#define IDEMAP_SCTX		ta PTRAP_I_DEMAP_SCTX
#define IDEMAP_NCTX		ta PTRAP_I_DEMAP_NCTX
#define IDEMAP_PAGE		ta PTRAP_I_DEMAP_PAGE
#define IDEMAP_RPAGE		ta PTRAP_I_DEMAP_RPAGE
#define IDEMAP_REAL 		ta PTRAP_I_DEMAP_REAL 
#define DDEMAP_ALL		ta PTRAP_D_DEMAP_ALL
#define DDEMAP_PCTX		ta PTRAP_D_DEMAP_PCTX
#define DDEMAP_SCTX		ta PTRAP_D_DEMAP_SCTX
#define DDEMAP_NCTX		ta PTRAP_D_DEMAP_NCTX
#define DDEMAP_PAGE		ta PTRAP_D_DEMAP_PAGE
#define DDEMAP_RPAGE		ta PTRAP_D_DEMAP_RPAGE
#define DDEMAP_REAL 		ta PTRAP_D_DEMAP_REAL 
#define DO_BRANCH		or %g1, %g0, %i7 ;  ta PTRAP_REDIRECT
#define CHANGE_PID  		ta PTRAP_CHANGE_PID   

#define PTRAP_I_DEMAP_ALL       0x10
#define PTRAP_I_DEMAP_PCTX	0x11
#define PTRAP_I_DEMAP_SCTX	0x12
#define PTRAP_I_DEMAP_NCTX	0x13
#define PTRAP_I_DEMAP_PAGE	0x14
#define PTRAP_I_DEMAP_RPAGE	0x15
#define PTRAP_I_DEMAP_REAL 	0x16
#define PTRAP_D_DEMAP_ALL       0x17
#define PTRAP_D_DEMAP_PCTX	0x18
#define PTRAP_D_DEMAP_SCTX	0x19
#define PTRAP_D_DEMAP_NCTX	0x1a
#define PTRAP_D_DEMAP_PAGE	0x1b
#define PTRAP_D_DEMAP_RPAGE	0x1c
#define PTRAP_D_DEMAP_REAL 	0x1d
#define PTRAP_REDIRECT		0x20
#define PTRAP_CHANGE_PID	0x21

#define HPTRAP_I_DEMAP_ALL      0x80
#define HPTRAP_I_DEMAP_PCTX	0x81
#define HPTRAP_I_DEMAP_SCTX	0x82
#define HPTRAP_I_DEMAP_NCTX	0x83
#define HPTRAP_I_DEMAP_PAGE	0x84
#define HPTRAP_I_DEMAP_RPAGE	0x85
#define HPTRAP_I_DEMAP_REAL 	0x86
#define HPTRAP_D_DEMAP_ALL      0x87
#define HPTRAP_D_DEMAP_PCTX	0x88
#define HPTRAP_D_DEMAP_SCTX	0x89
#define HPTRAP_D_DEMAP_NCTX	0x8a
#define HPTRAP_D_DEMAP_PAGE	0x8b
#define HPTRAP_D_DEMAP_RPAGE	0x8c
#define HPTRAP_D_DEMAP_REAL 	0x8d
#define HPTRAP_CHANGE_PID   	0x91

#define MAX_OCCURENCE_CNT       10
#define NUM_IMPL_TRAPS          6	/* number of implemented traps */
#define TRAP_0x9_OFFSET         0
#define TRAP_0xB_OFFSET         4
#define TRAP_0x1B_OFFSET        8
#define TRAP_0x2E_OFFSET        0xc
#define TRAP_0x31_OFFSET        0x10
#define TRAP_0x6C_OFFSET        0x14

MIDAS_TSB       thr0_z_ctx_tsb_0        THR0_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr0_z_ctx_tsb_1        THR0_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr0_z_ctx_tsb_2        THR0_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr0_z_ctx_tsb_3        THR0_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr0_nz_ctx_tsb_0       THR0_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr0_nz_ctx_tsb_1       THR0_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr0_nz_ctx_tsb_2       THR0_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr0_nz_ctx_tsb_3       THR0_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB       thr1_z_ctx_tsb_0        THR1_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr1_z_ctx_tsb_1        THR1_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr1_z_ctx_tsb_2        THR1_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr1_z_ctx_tsb_3        THR1_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr1_nz_ctx_tsb_0       THR1_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr1_nz_ctx_tsb_1       THR1_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr1_nz_ctx_tsb_2       THR1_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr1_nz_ctx_tsb_3       THR1_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB       thr2_z_ctx_tsb_0        THR2_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr2_z_ctx_tsb_1        THR2_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr2_z_ctx_tsb_2        THR2_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr2_z_ctx_tsb_3        THR2_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr2_nz_ctx_tsb_0       THR2_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr2_nz_ctx_tsb_1       THR2_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr2_nz_ctx_tsb_2       THR2_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr2_nz_ctx_tsb_3       THR2_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB       thr3_z_ctx_tsb_0        THR3_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr3_z_ctx_tsb_1        THR3_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr3_z_ctx_tsb_2        THR3_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr3_z_ctx_tsb_3        THR3_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr3_nz_ctx_tsb_0       THR3_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr3_nz_ctx_tsb_1       THR3_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr3_nz_ctx_tsb_2       THR3_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr3_nz_ctx_tsb_3       THR3_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB       thr4_z_ctx_tsb_0        THR4_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr4_z_ctx_tsb_1        THR4_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr4_z_ctx_tsb_2        THR4_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr4_z_ctx_tsb_3        THR4_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr4_nz_ctx_tsb_0       THR4_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr4_nz_ctx_tsb_1       THR4_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr4_nz_ctx_tsb_2       THR4_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr4_nz_ctx_tsb_3       THR4_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB       thr5_z_ctx_tsb_0        THR5_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr5_z_ctx_tsb_1        THR5_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr5_z_ctx_tsb_2        THR5_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr5_z_ctx_tsb_3        THR5_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr5_nz_ctx_tsb_0       THR5_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr5_nz_ctx_tsb_1       THR5_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr5_nz_ctx_tsb_2       THR5_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr5_nz_ctx_tsb_3       THR5_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB       thr6_z_ctx_tsb_0        THR6_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr6_z_ctx_tsb_1        THR6_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr6_z_ctx_tsb_2        THR6_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr6_z_ctx_tsb_3        THR6_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr6_nz_ctx_tsb_0       THR6_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr6_nz_ctx_tsb_1       THR6_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr6_nz_ctx_tsb_2       THR6_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr6_nz_ctx_tsb_3       THR6_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB       thr7_z_ctx_tsb_0        THR7_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr7_z_ctx_tsb_1        THR7_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr7_z_ctx_tsb_2        THR7_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr7_z_ctx_tsb_3        THR7_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB       thr7_nz_ctx_tsb_0       THR7_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB       thr7_nz_ctx_tsb_1       THR7_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB       thr7_nz_ctx_tsb_2       THR7_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB       thr7_nz_ctx_tsb_3       THR7_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

/*****************************************************************************************/
SECTION .RED_SEC TEXT_VA = 0xfffffffff0000000

attr_text {
	Name=.RED_SEC,
	hypervisor
}

.text
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

	rdhpr	%hpstate, %l1 
	wrhpr	%l1, 0x820, %hpstate

	wrpr	0, %tl
	wrpr	0, %g0, %gl     

	! load partition id to %l7
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %l7
	set     0x7, %g1
	and     %l7, %g1, %l7         ! %l7 has TID
	xor	%l0, %l0, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr1
	nop
	setx	thr0_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr1:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr2
	nop
	setx	thr1_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr2:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr3
	nop
	setx	thr2_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr3:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr4
	nop
	setx	thr3_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr4:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr5
	nop
	setx	thr4_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr5:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr6
	nop
	setx	thr5_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr6:
	add	%l0, 1, %l0
	sub	%l7, %l0, %l1
	brnz	%l1, test_thr7
	nop
	setx	thr6_red_handler, %l0, %l2
	jmp	%l2
	nop
test_thr7:
	setx	thr7_red_handler, %l0, %l2
	jmp	%l2
	nop
	
	EXIT_BAD

/*****************************************************************************************/
SECTION .RED_EXT_SEC TEXT_VA = HV_RED_TEXT_PA, DATA_VA = HV_RED_DATA_PA

attr_text {
	Name=.RED_EXT_SEC,
	hypervisor
}

.text
.global	thr0_red_handler
thr0_red_handler:
	! set partition id
	set	THR_0_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr0_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR0_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR0_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR0_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR0_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr0_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr0_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr0_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR0_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR0_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR0_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR0_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr0_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR0_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR0_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR0_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR0_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr0_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr0_hred_tsb_z_config_0:
	setx	THR0_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR0_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR0_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR0_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR0_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR0_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR0_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR0_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi

thr0_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr0_transfer_to_priv_code:	
	setx	Thr0_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr1_red_handler
thr1_red_handler:
	! set partition id
	set	THR_0_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr1_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR1_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR1_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR1_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR1_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr1_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr1_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr1_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR1_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR1_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR1_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR1_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr1_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR1_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR1_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR1_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR1_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr1_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr1_hred_tsb_z_config_0:
	setx	THR1_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR1_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR1_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR1_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR1_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR1_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR1_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR1_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr1_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr1_transfer_to_priv_code:	
	setx	Thr1_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr2_red_handler
thr2_red_handler:
	! set partition id
	set	THR_0_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr2_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR2_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR2_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR2_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR2_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr2_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr2_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr2_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR2_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR2_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR2_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR2_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr2_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR2_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR2_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR2_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR2_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr2_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr2_hred_tsb_z_config_0:
	setx	THR2_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR2_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR2_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR2_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR2_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR2_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR2_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR2_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr2_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr2_transfer_to_priv_code:	
	setx	Thr2_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr3_red_handler
thr3_red_handler:
	! set partition id
	set	THR_0_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr3_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR3_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR3_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR3_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR3_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr3_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr3_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr3_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR3_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR3_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR3_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR3_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr3_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR3_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR3_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR3_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR3_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr3_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr3_hred_tsb_z_config_0:
	setx	THR3_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR3_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR3_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR3_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR3_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR3_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR3_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR3_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr3_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr3_transfer_to_priv_code:	
	setx	Thr3_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr4_red_handler
thr4_red_handler:
	! set partition id
	set	THR_0_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr4_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR4_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR4_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR4_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR4_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr4_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr4_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr4_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR4_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR4_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR4_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR4_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr4_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR4_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR4_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR4_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR4_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr4_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr4_hred_tsb_z_config_0:
	setx	THR4_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR4_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR4_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR4_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR4_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR4_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR4_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR4_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr4_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr4_transfer_to_priv_code:	
	setx	Thr4_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr5_red_handler
thr5_red_handler:
	! set partition id
	set	THR_0_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr5_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR5_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR5_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR5_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR5_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr5_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr5_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr5_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR5_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR5_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR5_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR5_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr5_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR5_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR5_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR5_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR5_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr5_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr5_hred_tsb_z_config_0:
	setx	THR5_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR5_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR5_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR5_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR5_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR5_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR5_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR5_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr5_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr5_transfer_to_priv_code:	
	setx	Thr5_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr6_red_handler
thr6_red_handler:
	! set partition id
	set	THR_0_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr6_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR6_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR6_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR6_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR6_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr6_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr6_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr6_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR6_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR6_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR6_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR6_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr6_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR6_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR6_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR6_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR6_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr6_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr6_hred_tsb_z_config_0:
	setx	THR6_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR6_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR6_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR6_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR6_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR6_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR6_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR6_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr6_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr6_transfer_to_priv_code:	
	setx	Thr6_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

.global	thr7_red_handler
thr7_red_handler:
	! set partition id
	set	THR_0_PARTID, %g2
	mov	ASI_PARTITION_ID_VAL, %g1
	stxa	%g2, [%g1] ASI_PARTITION_ID

	! set hyper trap base addr
	setx	HPTRAP_TEXT_PA, %l0, %l7
	wrhpr	%l7, %g0, %htba

thr7_hred_context_config:
	setx	ASI_PRIMARY_CONTEXT_REG, %l0, %g1
	wr	%g1, 0x0, %asi
	setx	THR7_PCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_0_REG_VAL] %asi
	setx	THR7_PCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_PRIMARY_CONTEXT_1_REG_VAL] %asi
	setx	THR7_SCONTEXT_0, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_0_REG_VAL] %asi
	setx	THR7_SCONTEXT_1, %l0, %g1
	stxa	%g1, [ASI_SECONDARY_CONTEXT_1_REG_VAL] %asi
	
#ifdef TSB_SEARCH_BURST
thr7_tsb_burst_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_BURST, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif 
#ifdef TSB_SEARCH_PREDICTION
thr7_tsb_prediction_mode:	
        setx    ASI_TSB_SEARCH_MODE_ADDR, %l1, %g1
        or      TSB_SEARCH_PREDICTION, %g0, %g2
        stxa    %g2, [%g1] ASI_TSB_SEARCH_MODE_REG
#endif

thr7_hred_physical_offset:
	setx	ASI_MMU_PHYSICAL_OFFSET, %l0, %g1
	wr	%g1, 0x0, %asi

	setx	THR7_PHY_OFF_0, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_0] %asi
	setx	THR7_PHY_OFF_1, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_1] %asi
	setx	THR7_PHY_OFF_2, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_2] %asi
	setx	THR7_PHY_OFF_3, %l0, %l1
	stxa    %l1, [ASI_MMU_PHYSICAL_OFFSET_3] %asi

thr7_hred_real_range:
	setx	ASI_MMU_REAL_RANGE, %l1, %g1
	wr	%g1, 0x0, %asi

	setx	THR7_REAL_RANGE_0, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_0] %asi
	setx	THR7_REAL_RANGE_1, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_1] %asi
	setx	THR7_REAL_RANGE_2, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_2] %asi
	setx	THR7_REAL_RANGE_3, %l0, %l1
	stxa	%l1, [ASI_MMU_REAL_RANGE_3] %asi

thr7_hred_tsb_config:
	mov	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g3
	wr	%g3, 0x0, %asi

thr7_hred_tsb_z_config_0:
	setx	THR7_Z_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR7_Z_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR7_Z_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR7_Z_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
	setx	THR7_NZ_CTX_TSB_CONFIG_0, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
	setx	THR7_NZ_CTX_TSB_CONFIG_1, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
	setx	THR7_NZ_CTX_TSB_CONFIG_2, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
	setx	THR7_NZ_CTX_TSB_CONFIG_3, %g1, %g4
	stxa	%g4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
	
thr7_lsu_ctl_reg:	
	setx	0x1f, %l0, %l7
	stxa	%l7, [%g0] ASI_LSU_CONTROL

thr7_transfer_to_priv_code:	
	setx	Thr7_Priv_Sect_text_begin, %g1, %g2
	jmp	%g2
	wrhpr	%g0, 0x000, %hpstate
	nop
	
	EXIT_BAD

attr_data {
	Name=.RED_EXT_SEC,
	hypervisor
}

.data
part_id_list:
	.xword	THR_0_PARTID, THR_1_PARTID, THR_2_PARTID, THR_3_PARTID
	.xword	THR_4_PARTID, THR_5_PARTID, THR_6_PARTID, THR_7_PARTID

/*********************************************************************/
SECTION .Thr0_Priv_Sect TEXT_VA=0x00001bc000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_2
	VA = 0x0000001bc000 ,
	RA = 0x0001d0e000 ,
	PA = 0x0003d0e000 ,
	TTE_Context = 0x07b6 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0 ,
	TTE_Diag    = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_Priv_Sect_text_end ,
	compressimage ,
	}
.text
.global Thr0_Priv_Sect_text_begin
Thr0_Priv_Sect_text_begin:
	setx	THR0_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	rdpr	%pstate, %l2
	setx	Thr0_user_code_entry, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
	EXIT_BAD
Thr0_Priv_Sect_text_end:
/*********************************************************************/
SECTION .Thr1_Priv_Sect TEXT_VA=0x0000062000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_2
	VA = 0x000000062000 ,
	RA = 0x0005d7a000 ,
	PA = 0x0045d7a000 ,
	TTE_Context = 0x0e94 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0 ,
	TTE_Diag    = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_Priv_Sect_text_end ,
	compressimage ,
	}
.text
.global Thr1_Priv_Sect_text_begin
Thr1_Priv_Sect_text_begin:
	setx	THR1_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	rdpr	%pstate, %l2
	setx	Thr1_user_code_entry, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
	EXIT_BAD
Thr1_Priv_Sect_text_end:
/*********************************************************************/
SECTION .Thr2_Priv_Sect TEXT_VA=0x000005a000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_1
	VA = 0x00000005a000 ,
	RA = 0x0001d00000 ,
	PA = 0x0007d00000 ,
	TTE_Context = 0x032c ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_Priv_Sect_text_end ,
	compressimage ,
	}
.text
.global Thr2_Priv_Sect_text_begin
Thr2_Priv_Sect_text_begin:
	setx	THR2_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	rdpr	%pstate, %l2
	setx	Thr2_user_code_entry, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
	EXIT_BAD
Thr2_Priv_Sect_text_end:
/*********************************************************************/
SECTION .Thr3_Priv_Sect TEXT_VA=0x000017c000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_1
	VA = 0x00000017c000 ,
	RA = 0x0009c38000 ,
	PA = 0x0009c38000 ,
	TTE_Context = 0x12fb ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_Priv_Sect_text_end ,
	compressimage ,
	}
.text
.global Thr3_Priv_Sect_text_begin
Thr3_Priv_Sect_text_begin:
	setx	THR3_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	rdpr	%pstate, %l2
	setx	Thr3_user_code_entry, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
	EXIT_BAD
Thr3_Priv_Sect_text_end:
/*********************************************************************/
SECTION .Thr4_Priv_Sect TEXT_VA=0x000011a000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_1
	VA = 0x00000011a000 ,
	RA = 0x000bd26000 ,
	PA = 0x000bd26000 ,
	TTE_Context = 0x06f9 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_Priv_Sect_text_end ,
	compressimage ,
	}
.text
.global Thr4_Priv_Sect_text_begin
Thr4_Priv_Sect_text_begin:
	setx	THR4_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	rdpr	%pstate, %l2
	setx	Thr4_user_code_entry, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
	EXIT_BAD
Thr4_Priv_Sect_text_end:
/*********************************************************************/
SECTION .Thr5_Priv_Sect TEXT_VA=0x0000082000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_1
	VA = 0x000000082000 ,
	RA = 0x0001ce8000 ,
	PA = 0x000dce8000 ,
	TTE_Context = 0x11c9 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0 ,
	TTE_Diag    = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_Priv_Sect_text_end ,
	compressimage ,
	}
.text
.global Thr5_Priv_Sect_text_begin
Thr5_Priv_Sect_text_begin:
	setx	THR5_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	rdpr	%pstate, %l2
	setx	Thr5_user_code_entry, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
	EXIT_BAD
Thr5_Priv_Sect_text_end:
/*********************************************************************/
SECTION .Thr6_Priv_Sect TEXT_VA=0x000004a000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_2
	VA = 0x00000004a000 ,
	RA = 0x000fdf2000 ,
	PA = 0x00efdf2000 ,
	TTE_Context = 0x0d7e ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0 ,
	TTE_Diag    = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_Priv_Sect_text_end ,
	compressimage ,
	}
.text
.global Thr6_Priv_Sect_text_begin
Thr6_Priv_Sect_text_begin:
	setx	THR6_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	rdpr	%pstate, %l2
	setx	Thr6_user_code_entry, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
	EXIT_BAD
Thr6_Priv_Sect_text_end:
/*********************************************************************/
SECTION .Thr7_Priv_Sect TEXT_VA=0x000005e000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x00000005e000 ,
	RA = 0x0011c18000 ,
	PA = 0x0111c18000 ,
	TTE_Context = 0x1aee ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_Priv_Sect_text_end ,
	compressimage ,
	}
.text
.global Thr7_Priv_Sect_text_begin
Thr7_Priv_Sect_text_begin:
	setx	THR7_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	rdpr	%pstate, %l2
	setx	Thr7_user_code_entry, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
	EXIT_BAD
Thr7_Priv_Sect_text_end:
/*********************************************************************/
SECTION .Thr0_Ptrap_Sect TEXT_VA=THR0_PTRAP_TEXT_VA
attr_text {
	Name = .Thr0_Ptrap_Sect ,
	thr0_z_ctx_tsb_0
	VA = THR0_PTRAP_TEXT_VA ,
	RA = THR0_PTRAP_TEXT_RA ,
	PA = THR0_PTRAP_TEXT_PA ,
	TTE_Context = NUCLEUS ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0 ,
	TTE_Diag    = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 1 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_Ptrap_Sect_text_end ,
	compressimage ,
	}
	ta	HP_BAD_TRAP	/* 0x0 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa */
.align 32
	ta	HP_BAD_TRAP	/* 0xb */
.align 32
	ta	HP_BAD_TRAP	/* 0xc */
.align 32
	ta	HP_BAD_TRAP	/* 0xd */
.align 32
	ta	HP_BAD_TRAP	/* 0xe */
.align 32
	ta	HP_BAD_TRAP	/* 0xf */
.align 32
	ta	HP_BAD_TRAP	/* 0x10 */
.align 32
	ta	HP_BAD_TRAP	/* 0x11 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17 */
.align 32
	ta	HP_BAD_TRAP	/* 0x18 */
.align 32
	ta	HP_BAD_TRAP	/* 0x19 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1a */
.align 32
	ta	HP_BAD_TRAP	/* 0x1b */
.align 32
	ta	HP_BAD_TRAP	/* 0x1c */
.align 32
	ta	HP_BAD_TRAP	/* 0x1d */
.align 32
	ta	HP_BAD_TRAP	/* 0x1e */
.align 32
	ta	HP_BAD_TRAP	/* 0x1f */
.align 32
	ta	HP_BAD_TRAP	/* 0x20 */
.align 32
	ta	HP_BAD_TRAP	/* 0x21 */
.align 32
	ta	HP_BAD_TRAP	/* 0x22 */
.align 32
	ta	HP_BAD_TRAP	/* 0x23 */
.align 32
	ta	HP_BAD_TRAP	/* 0x24 */
.align 32
	ta	HP_BAD_TRAP	/* 0x25 */
.align 32
	ta	HP_BAD_TRAP	/* 0x26 */
.align 32
	ta	HP_BAD_TRAP	/* 0x27 */
.align 32
	ta	HP_BAD_TRAP	/* 0x28 */
.align 32
	ta	HP_BAD_TRAP	/* 0x29 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2a */
.align 32
	ta	HP_BAD_TRAP	/* 0x2b */
.align 32
	ta	HP_BAD_TRAP	/* 0x2c */
.align 32
	ta	HP_BAD_TRAP	/* 0x2d */
.align 32
	ta	HP_BAD_TRAP	/* 0x2e */
.align 32
	ta	HP_BAD_TRAP	/* 0x2f */
.align 32
	ta	HP_BAD_TRAP	/* 0x30 */
.align 32
	ta	HP_BAD_TRAP	/* 0x31 */
.align 32
	ta	HP_BAD_TRAP	/* 0x32 */
.align 32
	ta	HP_BAD_TRAP	/* 0x33 */
.align 32
	ta	HP_BAD_TRAP	/* 0x34 */
.align 32
	ta	HP_BAD_TRAP	/* 0x35 */
.align 32
	ta	HP_BAD_TRAP	/* 0x36 */
.align 32
	ta	HP_BAD_TRAP	/* 0x37 */
.align 32
	ta	HP_BAD_TRAP	/* 0x38 */
.align 32
	ta	HP_BAD_TRAP	/* 0x39 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3a */
.align 32
	ta	HP_BAD_TRAP	/* 0x3b */
.align 32
	ta	HP_BAD_TRAP	/* 0x3c */
.align 32
	ta	HP_BAD_TRAP	/* 0x3d */
.align 32
	ta	HP_BAD_TRAP	/* 0x3e */
.align 32
	ta	HP_BAD_TRAP	/* 0x3f */
.align 32
	ta	HP_BAD_TRAP	/* 0x40 */
.align 32
	ta	HP_BAD_TRAP	/* 0x41 */
.align 32
	ta	HP_BAD_TRAP	/* 0x42 */
.align 32
	ta	HP_BAD_TRAP	/* 0x43 */
.align 32
	ta	HP_BAD_TRAP	/* 0x44 */
.align 32
	ta	HP_BAD_TRAP	/* 0x45 */
.align 32
	ta	HP_BAD_TRAP	/* 0x46 */
.align 32
	ta	HP_BAD_TRAP	/* 0x47 */
.align 32
	ta	HP_BAD_TRAP	/* 0x48 */
.align 32
	ta	HP_BAD_TRAP	/* 0x49 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4a */
.align 32
	ta	HP_BAD_TRAP	/* 0x4b */
.align 32
	ta	HP_BAD_TRAP	/* 0x4c */
.align 32
	ta	HP_BAD_TRAP	/* 0x4d */
.align 32
	ta	HP_BAD_TRAP	/* 0x4e */
.align 32
	ta	HP_BAD_TRAP	/* 0x4f */
.align 32
	ta	HP_BAD_TRAP	/* 0x50 */
.align 32
	ta	HP_BAD_TRAP	/* 0x51 */
.align 32
	ta	HP_BAD_TRAP	/* 0x52 */
.align 32
	ta	HP_BAD_TRAP	/* 0x53 */
.align 32
	ta	HP_BAD_TRAP	/* 0x54 */
.align 32
	ta	HP_BAD_TRAP	/* 0x55 */
.align 32
	ta	HP_BAD_TRAP	/* 0x56 */
.align 32
	ta	HP_BAD_TRAP	/* 0x57 */
.align 32
	ta	HP_BAD_TRAP	/* 0x58 */
.align 32
	ta	HP_BAD_TRAP	/* 0x59 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5a */
.align 32
	ta	HP_BAD_TRAP	/* 0x5b */
.align 32
	ta	HP_BAD_TRAP	/* 0x5c */
.align 32
	ta	HP_BAD_TRAP	/* 0x5d */
.align 32
	ta	HP_BAD_TRAP	/* 0x5e */
.align 32
	ta	HP_BAD_TRAP	/* 0x5f */
.align 32
	ta	HP_BAD_TRAP	/* 0x60 */
.align 32
	ta	HP_BAD_TRAP	/* 0x61 */
.align 32
	ta	HP_BAD_TRAP	/* 0x62 */
.align 32
	ta	HP_BAD_TRAP	/* 0x63 */
.align 32
	ta	HP_BAD_TRAP	/* 0x64 */
.align 32
	ta	HP_BAD_TRAP	/* 0x65 */
.align 32
	ta	HP_BAD_TRAP	/* 0x66 */
.align 32
	ta	HP_BAD_TRAP	/* 0x67 */
.align 32
	ta	HP_BAD_TRAP	/* 0x68 */
.align 32
	ta	HP_BAD_TRAP	/* 0x69 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6a */
.align 32
	ta	HP_BAD_TRAP	/* 0x6b */
.align 32
	ta	HP_BAD_TRAP	/* 0x6c */
.align 32
	ta	HP_BAD_TRAP	/* 0x6d */
.align 32
	ta	HP_BAD_TRAP	/* 0x6e */
.align 32
	ta	HP_BAD_TRAP	/* 0x6f */
.align 32
	ta	HP_BAD_TRAP	/* 0x70 */
.align 32
	ta	HP_BAD_TRAP	/* 0x71 */
.align 32
	ta	HP_BAD_TRAP	/* 0x72 */
.align 32
	ta	HP_BAD_TRAP	/* 0x73 */
.align 32
	ta	HP_BAD_TRAP	/* 0x74 */
.align 32
	ta	HP_BAD_TRAP	/* 0x75 */
.align 32
	ta	HP_BAD_TRAP	/* 0x76 */
.align 32
	ta	HP_BAD_TRAP	/* 0x77 */
.align 32
	ta	HP_BAD_TRAP	/* 0x78 */
.align 32
	ta	HP_BAD_TRAP	/* 0x79 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7a */
.align 32
	ta	HP_BAD_TRAP	/* 0x7b */
.align 32
	ta	HP_BAD_TRAP	/* 0x7c */
.align 32
	ta	HP_BAD_TRAP	/* 0x7d */
.align 32
	ta	HP_BAD_TRAP	/* 0x7e */
.align 32
	ta	HP_BAD_TRAP	/* 0x7f */
.align 32
	ta	HP_BAD_TRAP	/* 0x80 */
.align 32
	ta	HP_BAD_TRAP	/* 0x81 */
.align 32
	ta	HP_BAD_TRAP	/* 0x82 */
.align 32
	ta	HP_BAD_TRAP	/* 0x83 */
.align 32
	ta	HP_BAD_TRAP	/* 0x84 */
.align 32
	ta	HP_BAD_TRAP	/* 0x85 */
.align 32
	ta	HP_BAD_TRAP	/* 0x86 */
.align 32
	ta	HP_BAD_TRAP	/* 0x87 */
.align 32
	ta	HP_BAD_TRAP	/* 0x88 */
.align 32
	ta	HP_BAD_TRAP	/* 0x89 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8a */
.align 32
	ta	HP_BAD_TRAP	/* 0x8b */
.align 32
	ta	HP_BAD_TRAP	/* 0x8c */
.align 32
	ta	HP_BAD_TRAP	/* 0x8d */
.align 32
	ta	HP_BAD_TRAP	/* 0x8e */
.align 32
	ta	HP_BAD_TRAP	/* 0x8f */
.align 32
	ta	HP_BAD_TRAP	/* 0x90 */
.align 32
	ta	HP_BAD_TRAP	/* 0x91 */
.align 32
	ta	HP_BAD_TRAP	/* 0x92 */
.align 32
	ta	HP_BAD_TRAP	/* 0x93 */
.align 32
	ta	HP_BAD_TRAP	/* 0x94 */
.align 32
	ta	HP_BAD_TRAP	/* 0x95 */
.align 32
	ta	HP_BAD_TRAP	/* 0x96 */
.align 32
	ta	HP_BAD_TRAP	/* 0x97 */
.align 32
	ta	HP_BAD_TRAP	/* 0x98 */
.align 32
	ta	HP_BAD_TRAP	/* 0x99 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9a */
.align 32
	ta	HP_BAD_TRAP	/* 0x9b */
.align 32
	ta	HP_BAD_TRAP	/* 0x9c */
.align 32
	ta	HP_BAD_TRAP	/* 0x9d */
.align 32
	ta	HP_BAD_TRAP	/* 0x9e */
.align 32
	ta	HP_BAD_TRAP	/* 0x9f */
.align 32
	ta	HP_BAD_TRAP	/* 0xa0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xaa */
.align 32
	ta	HP_BAD_TRAP	/* 0xab */
.align 32
	ta	HP_BAD_TRAP	/* 0xac */
.align 32
	ta	HP_BAD_TRAP	/* 0xad */
.align 32
	ta	HP_BAD_TRAP	/* 0xae */
.align 32
	ta	HP_BAD_TRAP	/* 0xaf */
.align 32
	ta	HP_BAD_TRAP	/* 0xb0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xba */
.align 32
	ta	HP_BAD_TRAP	/* 0xbb */
.align 32
	ta	HP_BAD_TRAP	/* 0xbc */
.align 32
	ta	HP_BAD_TRAP	/* 0xbd */
.align 32
	ta	HP_BAD_TRAP	/* 0xbe */
.align 32
	ta	HP_BAD_TRAP	/* 0xbf */
.align 32
	ta	HP_BAD_TRAP	/* 0xc0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xca */
.align 32
	ta	HP_BAD_TRAP	/* 0xcb */
.align 32
	ta	HP_BAD_TRAP	/* 0xcc */
.align 32
	ta	HP_BAD_TRAP	/* 0xcd */
.align 32
	ta	HP_BAD_TRAP	/* 0xce */
.align 32
	ta	HP_BAD_TRAP	/* 0xcf */
.align 32
	ta	HP_BAD_TRAP	/* 0xd0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xda */
.align 32
	ta	HP_BAD_TRAP	/* 0xdb */
.align 32
	ta	HP_BAD_TRAP	/* 0xdc */
.align 32
	ta	HP_BAD_TRAP	/* 0xdd */
.align 32
	ta	HP_BAD_TRAP	/* 0xde */
.align 32
	ta	HP_BAD_TRAP	/* 0xdf */
.align 32
	ta	HP_BAD_TRAP	/* 0xe0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xea */
.align 32
	ta	HP_BAD_TRAP	/* 0xeb */
.align 32
	ta	HP_BAD_TRAP	/* 0xec */
.align 32
	ta	HP_BAD_TRAP	/* 0xed */
.align 32
	ta	HP_BAD_TRAP	/* 0xee */
.align 32
	ta	HP_BAD_TRAP	/* 0xef */
.align 32
	ta	HP_BAD_TRAP	/* 0xf0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xfa */
.align 32
	ta	HP_BAD_TRAP	/* 0xfb */
.align 32
	ta	HP_BAD_TRAP	/* 0xfc */
.align 32
	ta	HP_BAD_TRAP	/* 0xfd */
.align 32
	ta	HP_BAD_TRAP	/* 0xfe */
.align 32
	ta	HP_BAD_TRAP	/* 0xff */
.align 32
	ta	HP_GOOD_TRAP		/* 0x100 */
.align 32
	ta	HP_BAD_TRAP	/* 0x101 */
.align 32
	ta	HP_BAD_TRAP	/* 0x102 */
.align 32
	ta	HP_BAD_TRAP	/* 0x103 */
.align 32
	ta	HP_BAD_TRAP	/* 0x104 */
.align 32
	ta	HP_BAD_TRAP	/* 0x105 */
.align 32
	ta	HP_BAD_TRAP	/* 0x106 */
.align 32
	ta	HP_BAD_TRAP	/* 0x107 */
.align 32
	ta	HP_BAD_TRAP	/* 0x108 */
.align 32
	ta	HP_BAD_TRAP	/* 0x109 */
.align 32
	ta	HP_BAD_TRAP	/* 0x10a */
.align 32
	ta	HP_BAD_TRAP	/* 0x10b */
.align 32
	ta	HP_BAD_TRAP	/* 0x10c */
.align 32
	ta	HP_BAD_TRAP	/* 0x10d */
.align 32
	ta	HP_BAD_TRAP	/* 0x10e */
.align 32
	ta	HP_BAD_TRAP	/* 0x10f */
.align 32
	ta	HPTRAP_I_DEMAP_ALL	/* 0x110 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PCTX	/* 0x111 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_SCTX	/* 0x112 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_NCTX	/* 0x113 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PAGE	/* 0x114 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_RPAGE	/* 0x115 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_REAL 	/* 0x116 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_ALL	/* 0x117 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PCTX	/* 0x118 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_SCTX	/* 0x119 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_NCTX	/* 0x11a */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PAGE	/* 0x11b */
	done
.align 32
	ta	HPTRAP_D_DEMAP_RPAGE	/* 0x11c */
	done
.align 32
	ta	HPTRAP_D_DEMAP_REAL     /* 0x11d */
	done
.align 32
	ta	HP_BAD_TRAP	/* 0x11e */
.align 32
	ta	HP_BAD_TRAP	/* 0x11f */
.align 32
	sllx	%i7, 63, %g1
	brz	%g1, 1f
	nop
	rdpr	%tnpc, %g2
	add	%g2, 8, %g2
	wrpr	%g2, %tnpc
1:	
	done
.align 32
	ta	HPTRAP_CHANGE_PID	/* 0x121 */
	done
.align 32
	ta	HP_BAD_TRAP	/* 0x122 */
.align 32
	ta	HP_BAD_TRAP	/* 0x123 */
.align 32
	ta	HP_BAD_TRAP	/* 0x124 */
.align 32
	ta	HP_BAD_TRAP	/* 0x125 */
.align 32
	ta	HP_BAD_TRAP	/* 0x126 */
.align 32
	ta	HP_BAD_TRAP	/* 0x127 */
.align 32
	ta	HP_BAD_TRAP	/* 0x128 */
.align 32
	ta	HP_BAD_TRAP	/* 0x129 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12a */
.align 32
	ta	HP_BAD_TRAP	/* 0x12b */
.align 32
	ta	HP_BAD_TRAP	/* 0x12c */
.align 32
	ta	HP_BAD_TRAP	/* 0x12d */
.align 32
	ta	HP_BAD_TRAP	/* 0x12e */
.align 32
	ta	HP_BAD_TRAP	/* 0x12f */
.align 32
	ta	HP_BAD_TRAP	/* 0x130 */
.align 32
	ta	HP_BAD_TRAP	/* 0x131 */
.align 32
	ta	HP_BAD_TRAP	/* 0x132 */
.align 32
	ta	HP_BAD_TRAP	/* 0x133 */
.align 32
	ta	HP_BAD_TRAP	/* 0x134 */
.align 32
	ta	HP_BAD_TRAP	/* 0x135 */
.align 32
	ta	HP_BAD_TRAP	/* 0x136 */
.align 32
	ta	HP_BAD_TRAP	/* 0x137 */
.align 32
	ta	HP_BAD_TRAP	/* 0x138 */
.align 32
	ta	HP_BAD_TRAP	/* 0x139 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13a */
.align 32
	ta	HP_BAD_TRAP	/* 0x13b */
.align 32
	ta	HP_BAD_TRAP	/* 0x13c */
.align 32
	ta	HP_BAD_TRAP	/* 0x13d */
.align 32
	ta	HP_BAD_TRAP	/* 0x13e */
.align 32
	ta	HP_BAD_TRAP	/* 0x13f */
.align 32
	ta	HP_BAD_TRAP	/* 0x140 */
.align 32
	ta	HP_BAD_TRAP	/* 0x141 */
.align 32
	ta	HP_BAD_TRAP	/* 0x142 */
.align 32
	ta	HP_BAD_TRAP	/* 0x143 */
.align 32
	ta	HP_BAD_TRAP	/* 0x144 */
.align 32
	ta	HP_BAD_TRAP	/* 0x145 */
.align 32
	ta	HP_BAD_TRAP	/* 0x146 */
.align 32
	ta	HP_BAD_TRAP	/* 0x147 */
.align 32
	ta	HP_BAD_TRAP	/* 0x148 */
.align 32
	ta	HP_BAD_TRAP	/* 0x149 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14a */
.align 32
	ta	HP_BAD_TRAP	/* 0x14b */
.align 32
	ta	HP_BAD_TRAP	/* 0x14c */
.align 32
	ta	HP_BAD_TRAP	/* 0x14d */
.align 32
	ta	HP_BAD_TRAP	/* 0x14e */
.align 32
	ta	HP_BAD_TRAP	/* 0x14f */
.align 32
	ta	HP_BAD_TRAP	/* 0x150 */
.align 32
	ta	HP_BAD_TRAP	/* 0x151 */
.align 32
	ta	HP_BAD_TRAP	/* 0x152 */
.align 32
	ta	HP_BAD_TRAP	/* 0x153 */
.align 32
	ta	HP_BAD_TRAP	/* 0x154 */
.align 32
	ta	HP_BAD_TRAP	/* 0x155 */
.align 32
	ta	HP_BAD_TRAP	/* 0x156 */
.align 32
	ta	HP_BAD_TRAP	/* 0x157 */
.align 32
	ta	HP_BAD_TRAP	/* 0x158 */
.align 32
	ta	HP_BAD_TRAP	/* 0x159 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15a */
.align 32
	ta	HP_BAD_TRAP	/* 0x15b */
.align 32
	ta	HP_BAD_TRAP	/* 0x15c */
.align 32
	ta	HP_BAD_TRAP	/* 0x15d */
.align 32
	ta	HP_BAD_TRAP	/* 0x15e */
.align 32
	ta	HP_BAD_TRAP	/* 0x15f */
.align 32
	ta	HP_BAD_TRAP	/* 0x160 */
.align 32
	ta	HP_BAD_TRAP	/* 0x161 */
.align 32
	ta	HP_BAD_TRAP	/* 0x162 */
.align 32
	ta	HP_BAD_TRAP	/* 0x163 */
.align 32
	ta	HP_BAD_TRAP	/* 0x164 */
.align 32
	ta	HP_BAD_TRAP	/* 0x165 */
.align 32
	ta	HP_BAD_TRAP	/* 0x166 */
.align 32
	ta	HP_BAD_TRAP	/* 0x167 */
.align 32
	ta	HP_BAD_TRAP	/* 0x168 */
.align 32
	ta	HP_BAD_TRAP	/* 0x169 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16a */
.align 32
	ta	HP_BAD_TRAP	/* 0x16b */
.align 32
	ta	HP_BAD_TRAP	/* 0x16c */
.align 32
	ta	HP_BAD_TRAP	/* 0x16d */
.align 32
	ta	HP_BAD_TRAP	/* 0x16e */
.align 32
	ta	HP_BAD_TRAP	/* 0x16f */
.align 32
	ta	HP_BAD_TRAP	/* 0x170 */
.align 32
	ta	HP_BAD_TRAP	/* 0x171 */
.align 32
	ta	HP_BAD_TRAP	/* 0x172 */
.align 32
	ta	HP_BAD_TRAP	/* 0x173 */
.align 32
	ta	HP_BAD_TRAP	/* 0x174 */
.align 32
	ta	HP_BAD_TRAP	/* 0x175 */
.align 32
	ta	HP_BAD_TRAP	/* 0x176 */
.align 32
	ta	HP_BAD_TRAP	/* 0x177 */
.align 32
	ta	HP_BAD_TRAP	/* 0x178 */
.align 32
	ta	HP_BAD_TRAP	/* 0x179 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17a */
.align 32
	ta	HP_BAD_TRAP	/* 0x17b */
.align 32
	ta	HP_BAD_TRAP	/* 0x17c */
.align 32
	ta	HP_BAD_TRAP	/* 0x17d */
.align 32
	ta	HP_BAD_TRAP	/* 0x17e */
.align 32
	ta	HP_BAD_TRAP	/* 0x17f */
.align 32
Thr0_Ptrap_Sect_text_end:
/*********************************************************************/
SECTION .Thr1_Ptrap_Sect TEXT_VA=THR1_PTRAP_TEXT_VA
attr_text {
	Name = .Thr1_Ptrap_Sect ,
	thr1_z_ctx_tsb_0
	VA = THR1_PTRAP_TEXT_VA ,
	RA = THR1_PTRAP_TEXT_RA ,
	PA = THR1_PTRAP_TEXT_PA ,
	TTE_Context = NUCLEUS ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0 ,
	TTE_Diag    = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 1 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_Ptrap_Sect_text_end ,
	compressimage ,
	}
	ta	HP_BAD_TRAP	/* 0x0 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa */
.align 32
	ta	HP_BAD_TRAP	/* 0xb */
.align 32
	ta	HP_BAD_TRAP	/* 0xc */
.align 32
	ta	HP_BAD_TRAP	/* 0xd */
.align 32
	ta	HP_BAD_TRAP	/* 0xe */
.align 32
	ta	HP_BAD_TRAP	/* 0xf */
.align 32
	ta	HP_BAD_TRAP	/* 0x10 */
.align 32
	ta	HP_BAD_TRAP	/* 0x11 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17 */
.align 32
	ta	HP_BAD_TRAP	/* 0x18 */
.align 32
	ta	HP_BAD_TRAP	/* 0x19 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1a */
.align 32
	ta	HP_BAD_TRAP	/* 0x1b */
.align 32
	ta	HP_BAD_TRAP	/* 0x1c */
.align 32
	ta	HP_BAD_TRAP	/* 0x1d */
.align 32
	ta	HP_BAD_TRAP	/* 0x1e */
.align 32
	ta	HP_BAD_TRAP	/* 0x1f */
.align 32
	ta	HP_BAD_TRAP	/* 0x20 */
.align 32
	ta	HP_BAD_TRAP	/* 0x21 */
.align 32
	ta	HP_BAD_TRAP	/* 0x22 */
.align 32
	ta	HP_BAD_TRAP	/* 0x23 */
.align 32
	ta	HP_BAD_TRAP	/* 0x24 */
.align 32
	ta	HP_BAD_TRAP	/* 0x25 */
.align 32
	ta	HP_BAD_TRAP	/* 0x26 */
.align 32
	ta	HP_BAD_TRAP	/* 0x27 */
.align 32
	ta	HP_BAD_TRAP	/* 0x28 */
.align 32
	ta	HP_BAD_TRAP	/* 0x29 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2a */
.align 32
	ta	HP_BAD_TRAP	/* 0x2b */
.align 32
	ta	HP_BAD_TRAP	/* 0x2c */
.align 32
	ta	HP_BAD_TRAP	/* 0x2d */
.align 32
	ta	HP_BAD_TRAP	/* 0x2e */
.align 32
	ta	HP_BAD_TRAP	/* 0x2f */
.align 32
	ta	HP_BAD_TRAP	/* 0x30 */
.align 32
	ta	HP_BAD_TRAP	/* 0x31 */
.align 32
	ta	HP_BAD_TRAP	/* 0x32 */
.align 32
	ta	HP_BAD_TRAP	/* 0x33 */
.align 32
	ta	HP_BAD_TRAP	/* 0x34 */
.align 32
	ta	HP_BAD_TRAP	/* 0x35 */
.align 32
	ta	HP_BAD_TRAP	/* 0x36 */
.align 32
	ta	HP_BAD_TRAP	/* 0x37 */
.align 32
	ta	HP_BAD_TRAP	/* 0x38 */
.align 32
	ta	HP_BAD_TRAP	/* 0x39 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3a */
.align 32
	ta	HP_BAD_TRAP	/* 0x3b */
.align 32
	ta	HP_BAD_TRAP	/* 0x3c */
.align 32
	ta	HP_BAD_TRAP	/* 0x3d */
.align 32
	ta	HP_BAD_TRAP	/* 0x3e */
.align 32
	ta	HP_BAD_TRAP	/* 0x3f */
.align 32
	ta	HP_BAD_TRAP	/* 0x40 */
.align 32
	ta	HP_BAD_TRAP	/* 0x41 */
.align 32
	ta	HP_BAD_TRAP	/* 0x42 */
.align 32
	ta	HP_BAD_TRAP	/* 0x43 */
.align 32
	ta	HP_BAD_TRAP	/* 0x44 */
.align 32
	ta	HP_BAD_TRAP	/* 0x45 */
.align 32
	ta	HP_BAD_TRAP	/* 0x46 */
.align 32
	ta	HP_BAD_TRAP	/* 0x47 */
.align 32
	ta	HP_BAD_TRAP	/* 0x48 */
.align 32
	ta	HP_BAD_TRAP	/* 0x49 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4a */
.align 32
	ta	HP_BAD_TRAP	/* 0x4b */
.align 32
	ta	HP_BAD_TRAP	/* 0x4c */
.align 32
	ta	HP_BAD_TRAP	/* 0x4d */
.align 32
	ta	HP_BAD_TRAP	/* 0x4e */
.align 32
	ta	HP_BAD_TRAP	/* 0x4f */
.align 32
	ta	HP_BAD_TRAP	/* 0x50 */
.align 32
	ta	HP_BAD_TRAP	/* 0x51 */
.align 32
	ta	HP_BAD_TRAP	/* 0x52 */
.align 32
	ta	HP_BAD_TRAP	/* 0x53 */
.align 32
	ta	HP_BAD_TRAP	/* 0x54 */
.align 32
	ta	HP_BAD_TRAP	/* 0x55 */
.align 32
	ta	HP_BAD_TRAP	/* 0x56 */
.align 32
	ta	HP_BAD_TRAP	/* 0x57 */
.align 32
	ta	HP_BAD_TRAP	/* 0x58 */
.align 32
	ta	HP_BAD_TRAP	/* 0x59 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5a */
.align 32
	ta	HP_BAD_TRAP	/* 0x5b */
.align 32
	ta	HP_BAD_TRAP	/* 0x5c */
.align 32
	ta	HP_BAD_TRAP	/* 0x5d */
.align 32
	ta	HP_BAD_TRAP	/* 0x5e */
.align 32
	ta	HP_BAD_TRAP	/* 0x5f */
.align 32
	ta	HP_BAD_TRAP	/* 0x60 */
.align 32
	ta	HP_BAD_TRAP	/* 0x61 */
.align 32
	ta	HP_BAD_TRAP	/* 0x62 */
.align 32
	ta	HP_BAD_TRAP	/* 0x63 */
.align 32
	ta	HP_BAD_TRAP	/* 0x64 */
.align 32
	ta	HP_BAD_TRAP	/* 0x65 */
.align 32
	ta	HP_BAD_TRAP	/* 0x66 */
.align 32
	ta	HP_BAD_TRAP	/* 0x67 */
.align 32
	ta	HP_BAD_TRAP	/* 0x68 */
.align 32
	ta	HP_BAD_TRAP	/* 0x69 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6a */
.align 32
	ta	HP_BAD_TRAP	/* 0x6b */
.align 32
	ta	HP_BAD_TRAP	/* 0x6c */
.align 32
	ta	HP_BAD_TRAP	/* 0x6d */
.align 32
	ta	HP_BAD_TRAP	/* 0x6e */
.align 32
	ta	HP_BAD_TRAP	/* 0x6f */
.align 32
	ta	HP_BAD_TRAP	/* 0x70 */
.align 32
	ta	HP_BAD_TRAP	/* 0x71 */
.align 32
	ta	HP_BAD_TRAP	/* 0x72 */
.align 32
	ta	HP_BAD_TRAP	/* 0x73 */
.align 32
	ta	HP_BAD_TRAP	/* 0x74 */
.align 32
	ta	HP_BAD_TRAP	/* 0x75 */
.align 32
	ta	HP_BAD_TRAP	/* 0x76 */
.align 32
	ta	HP_BAD_TRAP	/* 0x77 */
.align 32
	ta	HP_BAD_TRAP	/* 0x78 */
.align 32
	ta	HP_BAD_TRAP	/* 0x79 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7a */
.align 32
	ta	HP_BAD_TRAP	/* 0x7b */
.align 32
	ta	HP_BAD_TRAP	/* 0x7c */
.align 32
	ta	HP_BAD_TRAP	/* 0x7d */
.align 32
	ta	HP_BAD_TRAP	/* 0x7e */
.align 32
	ta	HP_BAD_TRAP	/* 0x7f */
.align 32
	ta	HP_BAD_TRAP	/* 0x80 */
.align 32
	ta	HP_BAD_TRAP	/* 0x81 */
.align 32
	ta	HP_BAD_TRAP	/* 0x82 */
.align 32
	ta	HP_BAD_TRAP	/* 0x83 */
.align 32
	ta	HP_BAD_TRAP	/* 0x84 */
.align 32
	ta	HP_BAD_TRAP	/* 0x85 */
.align 32
	ta	HP_BAD_TRAP	/* 0x86 */
.align 32
	ta	HP_BAD_TRAP	/* 0x87 */
.align 32
	ta	HP_BAD_TRAP	/* 0x88 */
.align 32
	ta	HP_BAD_TRAP	/* 0x89 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8a */
.align 32
	ta	HP_BAD_TRAP	/* 0x8b */
.align 32
	ta	HP_BAD_TRAP	/* 0x8c */
.align 32
	ta	HP_BAD_TRAP	/* 0x8d */
.align 32
	ta	HP_BAD_TRAP	/* 0x8e */
.align 32
	ta	HP_BAD_TRAP	/* 0x8f */
.align 32
	ta	HP_BAD_TRAP	/* 0x90 */
.align 32
	ta	HP_BAD_TRAP	/* 0x91 */
.align 32
	ta	HP_BAD_TRAP	/* 0x92 */
.align 32
	ta	HP_BAD_TRAP	/* 0x93 */
.align 32
	ta	HP_BAD_TRAP	/* 0x94 */
.align 32
	ta	HP_BAD_TRAP	/* 0x95 */
.align 32
	ta	HP_BAD_TRAP	/* 0x96 */
.align 32
	ta	HP_BAD_TRAP	/* 0x97 */
.align 32
	ta	HP_BAD_TRAP	/* 0x98 */
.align 32
	ta	HP_BAD_TRAP	/* 0x99 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9a */
.align 32
	ta	HP_BAD_TRAP	/* 0x9b */
.align 32
	ta	HP_BAD_TRAP	/* 0x9c */
.align 32
	ta	HP_BAD_TRAP	/* 0x9d */
.align 32
	ta	HP_BAD_TRAP	/* 0x9e */
.align 32
	ta	HP_BAD_TRAP	/* 0x9f */
.align 32
	ta	HP_BAD_TRAP	/* 0xa0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xaa */
.align 32
	ta	HP_BAD_TRAP	/* 0xab */
.align 32
	ta	HP_BAD_TRAP	/* 0xac */
.align 32
	ta	HP_BAD_TRAP	/* 0xad */
.align 32
	ta	HP_BAD_TRAP	/* 0xae */
.align 32
	ta	HP_BAD_TRAP	/* 0xaf */
.align 32
	ta	HP_BAD_TRAP	/* 0xb0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xba */
.align 32
	ta	HP_BAD_TRAP	/* 0xbb */
.align 32
	ta	HP_BAD_TRAP	/* 0xbc */
.align 32
	ta	HP_BAD_TRAP	/* 0xbd */
.align 32
	ta	HP_BAD_TRAP	/* 0xbe */
.align 32
	ta	HP_BAD_TRAP	/* 0xbf */
.align 32
	ta	HP_BAD_TRAP	/* 0xc0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xca */
.align 32
	ta	HP_BAD_TRAP	/* 0xcb */
.align 32
	ta	HP_BAD_TRAP	/* 0xcc */
.align 32
	ta	HP_BAD_TRAP	/* 0xcd */
.align 32
	ta	HP_BAD_TRAP	/* 0xce */
.align 32
	ta	HP_BAD_TRAP	/* 0xcf */
.align 32
	ta	HP_BAD_TRAP	/* 0xd0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xda */
.align 32
	ta	HP_BAD_TRAP	/* 0xdb */
.align 32
	ta	HP_BAD_TRAP	/* 0xdc */
.align 32
	ta	HP_BAD_TRAP	/* 0xdd */
.align 32
	ta	HP_BAD_TRAP	/* 0xde */
.align 32
	ta	HP_BAD_TRAP	/* 0xdf */
.align 32
	ta	HP_BAD_TRAP	/* 0xe0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xea */
.align 32
	ta	HP_BAD_TRAP	/* 0xeb */
.align 32
	ta	HP_BAD_TRAP	/* 0xec */
.align 32
	ta	HP_BAD_TRAP	/* 0xed */
.align 32
	ta	HP_BAD_TRAP	/* 0xee */
.align 32
	ta	HP_BAD_TRAP	/* 0xef */
.align 32
	ta	HP_BAD_TRAP	/* 0xf0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xfa */
.align 32
	ta	HP_BAD_TRAP	/* 0xfb */
.align 32
	ta	HP_BAD_TRAP	/* 0xfc */
.align 32
	ta	HP_BAD_TRAP	/* 0xfd */
.align 32
	ta	HP_BAD_TRAP	/* 0xfe */
.align 32
	ta	HP_BAD_TRAP	/* 0xff */
.align 32
	ta	HP_GOOD_TRAP		/* 0x100 */
.align 32
	ta	HP_BAD_TRAP	/* 0x101 */
.align 32
	ta	HP_BAD_TRAP	/* 0x102 */
.align 32
	ta	HP_BAD_TRAP	/* 0x103 */
.align 32
	ta	HP_BAD_TRAP	/* 0x104 */
.align 32
	ta	HP_BAD_TRAP	/* 0x105 */
.align 32
	ta	HP_BAD_TRAP	/* 0x106 */
.align 32
	ta	HP_BAD_TRAP	/* 0x107 */
.align 32
	ta	HP_BAD_TRAP	/* 0x108 */
.align 32
	ta	HP_BAD_TRAP	/* 0x109 */
.align 32
	ta	HP_BAD_TRAP	/* 0x10a */
.align 32
	ta	HP_BAD_TRAP	/* 0x10b */
.align 32
	ta	HP_BAD_TRAP	/* 0x10c */
.align 32
	ta	HP_BAD_TRAP	/* 0x10d */
.align 32
	ta	HP_BAD_TRAP	/* 0x10e */
.align 32
	ta	HP_BAD_TRAP	/* 0x10f */
.align 32
	ta	HPTRAP_I_DEMAP_ALL	/* 0x110 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PCTX	/* 0x111 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_SCTX	/* 0x112 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_NCTX	/* 0x113 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PAGE	/* 0x114 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_RPAGE	/* 0x115 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_REAL 	/* 0x116 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_ALL	/* 0x117 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PCTX	/* 0x118 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_SCTX	/* 0x119 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_NCTX	/* 0x11a */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PAGE	/* 0x11b */
	done
.align 32
	ta	HPTRAP_D_DEMAP_RPAGE	/* 0x11c */
	done
.align 32
	ta	HPTRAP_D_DEMAP_REAL     /* 0x11d */
	done
.align 32
	ta	HP_BAD_TRAP	/* 0x11e */
.align 32
	ta	HP_BAD_TRAP	/* 0x11f */
.align 32
	sllx	%i7, 63, %g1
	brz	%g1, 1f
	nop
	rdpr	%tnpc, %g2
	add	%g2, 8, %g2
	wrpr	%g2, %tnpc
1:	
	done
.align 32
	ta	HPTRAP_CHANGE_PID	/* 0x121 */
.align 32
	ta	HP_BAD_TRAP	/* 0x122 */
.align 32
	ta	HP_BAD_TRAP	/* 0x123 */
.align 32
	ta	HP_BAD_TRAP	/* 0x124 */
.align 32
	ta	HP_BAD_TRAP	/* 0x125 */
.align 32
	ta	HP_BAD_TRAP	/* 0x126 */
.align 32
	ta	HP_BAD_TRAP	/* 0x127 */
.align 32
	ta	HP_BAD_TRAP	/* 0x128 */
.align 32
	ta	HP_BAD_TRAP	/* 0x129 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12a */
.align 32
	ta	HP_BAD_TRAP	/* 0x12b */
.align 32
	ta	HP_BAD_TRAP	/* 0x12c */
.align 32
	ta	HP_BAD_TRAP	/* 0x12d */
.align 32
	ta	HP_BAD_TRAP	/* 0x12e */
.align 32
	ta	HP_BAD_TRAP	/* 0x12f */
.align 32
	ta	HP_BAD_TRAP	/* 0x130 */
.align 32
	ta	HP_BAD_TRAP	/* 0x131 */
.align 32
	ta	HP_BAD_TRAP	/* 0x132 */
.align 32
	ta	HP_BAD_TRAP	/* 0x133 */
.align 32
	ta	HP_BAD_TRAP	/* 0x134 */
.align 32
	ta	HP_BAD_TRAP	/* 0x135 */
.align 32
	ta	HP_BAD_TRAP	/* 0x136 */
.align 32
	ta	HP_BAD_TRAP	/* 0x137 */
.align 32
	ta	HP_BAD_TRAP	/* 0x138 */
.align 32
	ta	HP_BAD_TRAP	/* 0x139 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13a */
.align 32
	ta	HP_BAD_TRAP	/* 0x13b */
.align 32
	ta	HP_BAD_TRAP	/* 0x13c */
.align 32
	ta	HP_BAD_TRAP	/* 0x13d */
.align 32
	ta	HP_BAD_TRAP	/* 0x13e */
.align 32
	ta	HP_BAD_TRAP	/* 0x13f */
.align 32
	ta	HP_BAD_TRAP	/* 0x140 */
.align 32
	ta	HP_BAD_TRAP	/* 0x141 */
.align 32
	ta	HP_BAD_TRAP	/* 0x142 */
.align 32
	ta	HP_BAD_TRAP	/* 0x143 */
.align 32
	ta	HP_BAD_TRAP	/* 0x144 */
.align 32
	ta	HP_BAD_TRAP	/* 0x145 */
.align 32
	ta	HP_BAD_TRAP	/* 0x146 */
.align 32
	ta	HP_BAD_TRAP	/* 0x147 */
.align 32
	ta	HP_BAD_TRAP	/* 0x148 */
.align 32
	ta	HP_BAD_TRAP	/* 0x149 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14a */
.align 32
	ta	HP_BAD_TRAP	/* 0x14b */
.align 32
	ta	HP_BAD_TRAP	/* 0x14c */
.align 32
	ta	HP_BAD_TRAP	/* 0x14d */
.align 32
	ta	HP_BAD_TRAP	/* 0x14e */
.align 32
	ta	HP_BAD_TRAP	/* 0x14f */
.align 32
	ta	HP_BAD_TRAP	/* 0x150 */
.align 32
	ta	HP_BAD_TRAP	/* 0x151 */
.align 32
	ta	HP_BAD_TRAP	/* 0x152 */
.align 32
	ta	HP_BAD_TRAP	/* 0x153 */
.align 32
	ta	HP_BAD_TRAP	/* 0x154 */
.align 32
	ta	HP_BAD_TRAP	/* 0x155 */
.align 32
	ta	HP_BAD_TRAP	/* 0x156 */
.align 32
	ta	HP_BAD_TRAP	/* 0x157 */
.align 32
	ta	HP_BAD_TRAP	/* 0x158 */
.align 32
	ta	HP_BAD_TRAP	/* 0x159 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15a */
.align 32
	ta	HP_BAD_TRAP	/* 0x15b */
.align 32
	ta	HP_BAD_TRAP	/* 0x15c */
.align 32
	ta	HP_BAD_TRAP	/* 0x15d */
.align 32
	ta	HP_BAD_TRAP	/* 0x15e */
.align 32
	ta	HP_BAD_TRAP	/* 0x15f */
.align 32
	ta	HP_BAD_TRAP	/* 0x160 */
.align 32
	ta	HP_BAD_TRAP	/* 0x161 */
.align 32
	ta	HP_BAD_TRAP	/* 0x162 */
.align 32
	ta	HP_BAD_TRAP	/* 0x163 */
.align 32
	ta	HP_BAD_TRAP	/* 0x164 */
.align 32
	ta	HP_BAD_TRAP	/* 0x165 */
.align 32
	ta	HP_BAD_TRAP	/* 0x166 */
.align 32
	ta	HP_BAD_TRAP	/* 0x167 */
.align 32
	ta	HP_BAD_TRAP	/* 0x168 */
.align 32
	ta	HP_BAD_TRAP	/* 0x169 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16a */
.align 32
	ta	HP_BAD_TRAP	/* 0x16b */
.align 32
	ta	HP_BAD_TRAP	/* 0x16c */
.align 32
	ta	HP_BAD_TRAP	/* 0x16d */
.align 32
	ta	HP_BAD_TRAP	/* 0x16e */
.align 32
	ta	HP_BAD_TRAP	/* 0x16f */
.align 32
	ta	HP_BAD_TRAP	/* 0x170 */
.align 32
	ta	HP_BAD_TRAP	/* 0x171 */
.align 32
	ta	HP_BAD_TRAP	/* 0x172 */
.align 32
	ta	HP_BAD_TRAP	/* 0x173 */
.align 32
	ta	HP_BAD_TRAP	/* 0x174 */
.align 32
	ta	HP_BAD_TRAP	/* 0x175 */
.align 32
	ta	HP_BAD_TRAP	/* 0x176 */
.align 32
	ta	HP_BAD_TRAP	/* 0x177 */
.align 32
	ta	HP_BAD_TRAP	/* 0x178 */
.align 32
	ta	HP_BAD_TRAP	/* 0x179 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17a */
.align 32
	ta	HP_BAD_TRAP	/* 0x17b */
.align 32
	ta	HP_BAD_TRAP	/* 0x17c */
.align 32
	ta	HP_BAD_TRAP	/* 0x17d */
.align 32
	ta	HP_BAD_TRAP	/* 0x17e */
.align 32
	ta	HP_BAD_TRAP	/* 0x17f */
.align 32
Thr1_Ptrap_Sect_text_end:
/*********************************************************************/
SECTION .Thr2_Ptrap_Sect TEXT_VA=THR2_PTRAP_TEXT_VA
attr_text {
	Name = .Thr2_Ptrap_Sect ,
	thr2_z_ctx_tsb_3
	VA = THR2_PTRAP_TEXT_VA ,
	RA = THR2_PTRAP_TEXT_RA ,
	PA = THR2_PTRAP_TEXT_PA ,
	TTE_Context = NUCLEUS ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr2_Ptrap_Sect_text_end ,
	compressimage ,
	}
	ta	HP_BAD_TRAP	/* 0x0 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa */
.align 32
	ta	HP_BAD_TRAP	/* 0xb */
.align 32
	ta	HP_BAD_TRAP	/* 0xc */
.align 32
	ta	HP_BAD_TRAP	/* 0xd */
.align 32
	ta	HP_BAD_TRAP	/* 0xe */
.align 32
	ta	HP_BAD_TRAP	/* 0xf */
.align 32
	ta	HP_BAD_TRAP	/* 0x10 */
.align 32
	ta	HP_BAD_TRAP	/* 0x11 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17 */
.align 32
	ta	HP_BAD_TRAP	/* 0x18 */
.align 32
	ta	HP_BAD_TRAP	/* 0x19 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1a */
.align 32
	ta	HP_BAD_TRAP	/* 0x1b */
.align 32
	ta	HP_BAD_TRAP	/* 0x1c */
.align 32
	ta	HP_BAD_TRAP	/* 0x1d */
.align 32
	ta	HP_BAD_TRAP	/* 0x1e */
.align 32
	ta	HP_BAD_TRAP	/* 0x1f */
.align 32
	ta	HP_BAD_TRAP	/* 0x20 */
.align 32
	ta	HP_BAD_TRAP	/* 0x21 */
.align 32
	ta	HP_BAD_TRAP	/* 0x22 */
.align 32
	ta	HP_BAD_TRAP	/* 0x23 */
.align 32
	ta	HP_BAD_TRAP	/* 0x24 */
.align 32
	ta	HP_BAD_TRAP	/* 0x25 */
.align 32
	ta	HP_BAD_TRAP	/* 0x26 */
.align 32
	ta	HP_BAD_TRAP	/* 0x27 */
.align 32
	ta	HP_BAD_TRAP	/* 0x28 */
.align 32
	ta	HP_BAD_TRAP	/* 0x29 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2a */
.align 32
	ta	HP_BAD_TRAP	/* 0x2b */
.align 32
	ta	HP_BAD_TRAP	/* 0x2c */
.align 32
	ta	HP_BAD_TRAP	/* 0x2d */
.align 32
	ta	HP_BAD_TRAP	/* 0x2e */
.align 32
	ta	HP_BAD_TRAP	/* 0x2f */
.align 32
	ta	HP_BAD_TRAP	/* 0x30 */
.align 32
	ta	HP_BAD_TRAP	/* 0x31 */
.align 32
	ta	HP_BAD_TRAP	/* 0x32 */
.align 32
	ta	HP_BAD_TRAP	/* 0x33 */
.align 32
	ta	HP_BAD_TRAP	/* 0x34 */
.align 32
	ta	HP_BAD_TRAP	/* 0x35 */
.align 32
	ta	HP_BAD_TRAP	/* 0x36 */
.align 32
	ta	HP_BAD_TRAP	/* 0x37 */
.align 32
	ta	HP_BAD_TRAP	/* 0x38 */
.align 32
	ta	HP_BAD_TRAP	/* 0x39 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3a */
.align 32
	ta	HP_BAD_TRAP	/* 0x3b */
.align 32
	ta	HP_BAD_TRAP	/* 0x3c */
.align 32
	ta	HP_BAD_TRAP	/* 0x3d */
.align 32
	ta	HP_BAD_TRAP	/* 0x3e */
.align 32
	ta	HP_BAD_TRAP	/* 0x3f */
.align 32
	ta	HP_BAD_TRAP	/* 0x40 */
.align 32
	ta	HP_BAD_TRAP	/* 0x41 */
.align 32
	ta	HP_BAD_TRAP	/* 0x42 */
.align 32
	ta	HP_BAD_TRAP	/* 0x43 */
.align 32
	ta	HP_BAD_TRAP	/* 0x44 */
.align 32
	ta	HP_BAD_TRAP	/* 0x45 */
.align 32
	ta	HP_BAD_TRAP	/* 0x46 */
.align 32
	ta	HP_BAD_TRAP	/* 0x47 */
.align 32
	ta	HP_BAD_TRAP	/* 0x48 */
.align 32
	ta	HP_BAD_TRAP	/* 0x49 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4a */
.align 32
	ta	HP_BAD_TRAP	/* 0x4b */
.align 32
	ta	HP_BAD_TRAP	/* 0x4c */
.align 32
	ta	HP_BAD_TRAP	/* 0x4d */
.align 32
	ta	HP_BAD_TRAP	/* 0x4e */
.align 32
	ta	HP_BAD_TRAP	/* 0x4f */
.align 32
	ta	HP_BAD_TRAP	/* 0x50 */
.align 32
	ta	HP_BAD_TRAP	/* 0x51 */
.align 32
	ta	HP_BAD_TRAP	/* 0x52 */
.align 32
	ta	HP_BAD_TRAP	/* 0x53 */
.align 32
	ta	HP_BAD_TRAP	/* 0x54 */
.align 32
	ta	HP_BAD_TRAP	/* 0x55 */
.align 32
	ta	HP_BAD_TRAP	/* 0x56 */
.align 32
	ta	HP_BAD_TRAP	/* 0x57 */
.align 32
	ta	HP_BAD_TRAP	/* 0x58 */
.align 32
	ta	HP_BAD_TRAP	/* 0x59 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5a */
.align 32
	ta	HP_BAD_TRAP	/* 0x5b */
.align 32
	ta	HP_BAD_TRAP	/* 0x5c */
.align 32
	ta	HP_BAD_TRAP	/* 0x5d */
.align 32
	ta	HP_BAD_TRAP	/* 0x5e */
.align 32
	ta	HP_BAD_TRAP	/* 0x5f */
.align 32
	ta	HP_BAD_TRAP	/* 0x60 */
.align 32
	ta	HP_BAD_TRAP	/* 0x61 */
.align 32
	ta	HP_BAD_TRAP	/* 0x62 */
.align 32
	ta	HP_BAD_TRAP	/* 0x63 */
.align 32
	ta	HP_BAD_TRAP	/* 0x64 */
.align 32
	ta	HP_BAD_TRAP	/* 0x65 */
.align 32
	ta	HP_BAD_TRAP	/* 0x66 */
.align 32
	ta	HP_BAD_TRAP	/* 0x67 */
.align 32
	ta	HP_BAD_TRAP	/* 0x68 */
.align 32
	ta	HP_BAD_TRAP	/* 0x69 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6a */
.align 32
	ta	HP_BAD_TRAP	/* 0x6b */
.align 32
	ta	HP_BAD_TRAP	/* 0x6c */
.align 32
	ta	HP_BAD_TRAP	/* 0x6d */
.align 32
	ta	HP_BAD_TRAP	/* 0x6e */
.align 32
	ta	HP_BAD_TRAP	/* 0x6f */
.align 32
	ta	HP_BAD_TRAP	/* 0x70 */
.align 32
	ta	HP_BAD_TRAP	/* 0x71 */
.align 32
	ta	HP_BAD_TRAP	/* 0x72 */
.align 32
	ta	HP_BAD_TRAP	/* 0x73 */
.align 32
	ta	HP_BAD_TRAP	/* 0x74 */
.align 32
	ta	HP_BAD_TRAP	/* 0x75 */
.align 32
	ta	HP_BAD_TRAP	/* 0x76 */
.align 32
	ta	HP_BAD_TRAP	/* 0x77 */
.align 32
	ta	HP_BAD_TRAP	/* 0x78 */
.align 32
	ta	HP_BAD_TRAP	/* 0x79 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7a */
.align 32
	ta	HP_BAD_TRAP	/* 0x7b */
.align 32
	ta	HP_BAD_TRAP	/* 0x7c */
.align 32
	ta	HP_BAD_TRAP	/* 0x7d */
.align 32
	ta	HP_BAD_TRAP	/* 0x7e */
.align 32
	ta	HP_BAD_TRAP	/* 0x7f */
.align 32
	ta	HP_BAD_TRAP	/* 0x80 */
.align 32
	ta	HP_BAD_TRAP	/* 0x81 */
.align 32
	ta	HP_BAD_TRAP	/* 0x82 */
.align 32
	ta	HP_BAD_TRAP	/* 0x83 */
.align 32
	ta	HP_BAD_TRAP	/* 0x84 */
.align 32
	ta	HP_BAD_TRAP	/* 0x85 */
.align 32
	ta	HP_BAD_TRAP	/* 0x86 */
.align 32
	ta	HP_BAD_TRAP	/* 0x87 */
.align 32
	ta	HP_BAD_TRAP	/* 0x88 */
.align 32
	ta	HP_BAD_TRAP	/* 0x89 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8a */
.align 32
	ta	HP_BAD_TRAP	/* 0x8b */
.align 32
	ta	HP_BAD_TRAP	/* 0x8c */
.align 32
	ta	HP_BAD_TRAP	/* 0x8d */
.align 32
	ta	HP_BAD_TRAP	/* 0x8e */
.align 32
	ta	HP_BAD_TRAP	/* 0x8f */
.align 32
	ta	HP_BAD_TRAP	/* 0x90 */
.align 32
	ta	HP_BAD_TRAP	/* 0x91 */
.align 32
	ta	HP_BAD_TRAP	/* 0x92 */
.align 32
	ta	HP_BAD_TRAP	/* 0x93 */
.align 32
	ta	HP_BAD_TRAP	/* 0x94 */
.align 32
	ta	HP_BAD_TRAP	/* 0x95 */
.align 32
	ta	HP_BAD_TRAP	/* 0x96 */
.align 32
	ta	HP_BAD_TRAP	/* 0x97 */
.align 32
	ta	HP_BAD_TRAP	/* 0x98 */
.align 32
	ta	HP_BAD_TRAP	/* 0x99 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9a */
.align 32
	ta	HP_BAD_TRAP	/* 0x9b */
.align 32
	ta	HP_BAD_TRAP	/* 0x9c */
.align 32
	ta	HP_BAD_TRAP	/* 0x9d */
.align 32
	ta	HP_BAD_TRAP	/* 0x9e */
.align 32
	ta	HP_BAD_TRAP	/* 0x9f */
.align 32
	ta	HP_BAD_TRAP	/* 0xa0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xaa */
.align 32
	ta	HP_BAD_TRAP	/* 0xab */
.align 32
	ta	HP_BAD_TRAP	/* 0xac */
.align 32
	ta	HP_BAD_TRAP	/* 0xad */
.align 32
	ta	HP_BAD_TRAP	/* 0xae */
.align 32
	ta	HP_BAD_TRAP	/* 0xaf */
.align 32
	ta	HP_BAD_TRAP	/* 0xb0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xba */
.align 32
	ta	HP_BAD_TRAP	/* 0xbb */
.align 32
	ta	HP_BAD_TRAP	/* 0xbc */
.align 32
	ta	HP_BAD_TRAP	/* 0xbd */
.align 32
	ta	HP_BAD_TRAP	/* 0xbe */
.align 32
	ta	HP_BAD_TRAP	/* 0xbf */
.align 32
	ta	HP_BAD_TRAP	/* 0xc0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xca */
.align 32
	ta	HP_BAD_TRAP	/* 0xcb */
.align 32
	ta	HP_BAD_TRAP	/* 0xcc */
.align 32
	ta	HP_BAD_TRAP	/* 0xcd */
.align 32
	ta	HP_BAD_TRAP	/* 0xce */
.align 32
	ta	HP_BAD_TRAP	/* 0xcf */
.align 32
	ta	HP_BAD_TRAP	/* 0xd0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xda */
.align 32
	ta	HP_BAD_TRAP	/* 0xdb */
.align 32
	ta	HP_BAD_TRAP	/* 0xdc */
.align 32
	ta	HP_BAD_TRAP	/* 0xdd */
.align 32
	ta	HP_BAD_TRAP	/* 0xde */
.align 32
	ta	HP_BAD_TRAP	/* 0xdf */
.align 32
	ta	HP_BAD_TRAP	/* 0xe0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xea */
.align 32
	ta	HP_BAD_TRAP	/* 0xeb */
.align 32
	ta	HP_BAD_TRAP	/* 0xec */
.align 32
	ta	HP_BAD_TRAP	/* 0xed */
.align 32
	ta	HP_BAD_TRAP	/* 0xee */
.align 32
	ta	HP_BAD_TRAP	/* 0xef */
.align 32
	ta	HP_BAD_TRAP	/* 0xf0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xfa */
.align 32
	ta	HP_BAD_TRAP	/* 0xfb */
.align 32
	ta	HP_BAD_TRAP	/* 0xfc */
.align 32
	ta	HP_BAD_TRAP	/* 0xfd */
.align 32
	ta	HP_BAD_TRAP	/* 0xfe */
.align 32
	ta	HP_BAD_TRAP	/* 0xff */
.align 32
	ta	HP_GOOD_TRAP		/* 0x100 */
.align 32
	ta	HP_BAD_TRAP	/* 0x101 */
.align 32
	ta	HP_BAD_TRAP	/* 0x102 */
.align 32
	ta	HP_BAD_TRAP	/* 0x103 */
.align 32
	ta	HP_BAD_TRAP	/* 0x104 */
.align 32
	ta	HP_BAD_TRAP	/* 0x105 */
.align 32
	ta	HP_BAD_TRAP	/* 0x106 */
.align 32
	ta	HP_BAD_TRAP	/* 0x107 */
.align 32
	ta	HP_BAD_TRAP	/* 0x108 */
.align 32
	ta	HP_BAD_TRAP	/* 0x109 */
.align 32
	ta	HP_BAD_TRAP	/* 0x10a */
.align 32
	ta	HP_BAD_TRAP	/* 0x10b */
.align 32
	ta	HP_BAD_TRAP	/* 0x10c */
.align 32
	ta	HP_BAD_TRAP	/* 0x10d */
.align 32
	ta	HP_BAD_TRAP	/* 0x10e */
.align 32
	ta	HP_BAD_TRAP	/* 0x10f */
.align 32
	ta	HPTRAP_I_DEMAP_ALL	/* 0x110 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PCTX	/* 0x111 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_SCTX	/* 0x112 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_NCTX	/* 0x113 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PAGE	/* 0x114 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_RPAGE	/* 0x115 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_REAL 	/* 0x116 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_ALL	/* 0x117 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PCTX	/* 0x118 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_SCTX	/* 0x119 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_NCTX	/* 0x11a */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PAGE	/* 0x11b */
	done
.align 32
	ta	HPTRAP_D_DEMAP_RPAGE	/* 0x11c */
	done
.align 32
	ta	HPTRAP_D_DEMAP_REAL     /* 0x11d */
	done
.align 32
	ta	HP_BAD_TRAP	/* 0x11e */
.align 32
	ta	HP_BAD_TRAP	/* 0x11f */
.align 32
	sllx	%i7, 63, %g1
	brz	%g1, 1f
	nop
	rdpr	%tnpc, %g2
	add	%g2, 8, %g2
	wrpr	%g2, %tnpc
1:	
	done
.align 32
	ta	HPTRAP_CHANGE_PID	/* 0x121 */
.align 32
	ta	HP_BAD_TRAP	/* 0x122 */
.align 32
	ta	HP_BAD_TRAP	/* 0x123 */
.align 32
	ta	HP_BAD_TRAP	/* 0x124 */
.align 32
	ta	HP_BAD_TRAP	/* 0x125 */
.align 32
	ta	HP_BAD_TRAP	/* 0x126 */
.align 32
	ta	HP_BAD_TRAP	/* 0x127 */
.align 32
	ta	HP_BAD_TRAP	/* 0x128 */
.align 32
	ta	HP_BAD_TRAP	/* 0x129 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12a */
.align 32
	ta	HP_BAD_TRAP	/* 0x12b */
.align 32
	ta	HP_BAD_TRAP	/* 0x12c */
.align 32
	ta	HP_BAD_TRAP	/* 0x12d */
.align 32
	ta	HP_BAD_TRAP	/* 0x12e */
.align 32
	ta	HP_BAD_TRAP	/* 0x12f */
.align 32
	ta	HP_BAD_TRAP	/* 0x130 */
.align 32
	ta	HP_BAD_TRAP	/* 0x131 */
.align 32
	ta	HP_BAD_TRAP	/* 0x132 */
.align 32
	ta	HP_BAD_TRAP	/* 0x133 */
.align 32
	ta	HP_BAD_TRAP	/* 0x134 */
.align 32
	ta	HP_BAD_TRAP	/* 0x135 */
.align 32
	ta	HP_BAD_TRAP	/* 0x136 */
.align 32
	ta	HP_BAD_TRAP	/* 0x137 */
.align 32
	ta	HP_BAD_TRAP	/* 0x138 */
.align 32
	ta	HP_BAD_TRAP	/* 0x139 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13a */
.align 32
	ta	HP_BAD_TRAP	/* 0x13b */
.align 32
	ta	HP_BAD_TRAP	/* 0x13c */
.align 32
	ta	HP_BAD_TRAP	/* 0x13d */
.align 32
	ta	HP_BAD_TRAP	/* 0x13e */
.align 32
	ta	HP_BAD_TRAP	/* 0x13f */
.align 32
	ta	HP_BAD_TRAP	/* 0x140 */
.align 32
	ta	HP_BAD_TRAP	/* 0x141 */
.align 32
	ta	HP_BAD_TRAP	/* 0x142 */
.align 32
	ta	HP_BAD_TRAP	/* 0x143 */
.align 32
	ta	HP_BAD_TRAP	/* 0x144 */
.align 32
	ta	HP_BAD_TRAP	/* 0x145 */
.align 32
	ta	HP_BAD_TRAP	/* 0x146 */
.align 32
	ta	HP_BAD_TRAP	/* 0x147 */
.align 32
	ta	HP_BAD_TRAP	/* 0x148 */
.align 32
	ta	HP_BAD_TRAP	/* 0x149 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14a */
.align 32
	ta	HP_BAD_TRAP	/* 0x14b */
.align 32
	ta	HP_BAD_TRAP	/* 0x14c */
.align 32
	ta	HP_BAD_TRAP	/* 0x14d */
.align 32
	ta	HP_BAD_TRAP	/* 0x14e */
.align 32
	ta	HP_BAD_TRAP	/* 0x14f */
.align 32
	ta	HP_BAD_TRAP	/* 0x150 */
.align 32
	ta	HP_BAD_TRAP	/* 0x151 */
.align 32
	ta	HP_BAD_TRAP	/* 0x152 */
.align 32
	ta	HP_BAD_TRAP	/* 0x153 */
.align 32
	ta	HP_BAD_TRAP	/* 0x154 */
.align 32
	ta	HP_BAD_TRAP	/* 0x155 */
.align 32
	ta	HP_BAD_TRAP	/* 0x156 */
.align 32
	ta	HP_BAD_TRAP	/* 0x157 */
.align 32
	ta	HP_BAD_TRAP	/* 0x158 */
.align 32
	ta	HP_BAD_TRAP	/* 0x159 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15a */
.align 32
	ta	HP_BAD_TRAP	/* 0x15b */
.align 32
	ta	HP_BAD_TRAP	/* 0x15c */
.align 32
	ta	HP_BAD_TRAP	/* 0x15d */
.align 32
	ta	HP_BAD_TRAP	/* 0x15e */
.align 32
	ta	HP_BAD_TRAP	/* 0x15f */
.align 32
	ta	HP_BAD_TRAP	/* 0x160 */
.align 32
	ta	HP_BAD_TRAP	/* 0x161 */
.align 32
	ta	HP_BAD_TRAP	/* 0x162 */
.align 32
	ta	HP_BAD_TRAP	/* 0x163 */
.align 32
	ta	HP_BAD_TRAP	/* 0x164 */
.align 32
	ta	HP_BAD_TRAP	/* 0x165 */
.align 32
	ta	HP_BAD_TRAP	/* 0x166 */
.align 32
	ta	HP_BAD_TRAP	/* 0x167 */
.align 32
	ta	HP_BAD_TRAP	/* 0x168 */
.align 32
	ta	HP_BAD_TRAP	/* 0x169 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16a */
.align 32
	ta	HP_BAD_TRAP	/* 0x16b */
.align 32
	ta	HP_BAD_TRAP	/* 0x16c */
.align 32
	ta	HP_BAD_TRAP	/* 0x16d */
.align 32
	ta	HP_BAD_TRAP	/* 0x16e */
.align 32
	ta	HP_BAD_TRAP	/* 0x16f */
.align 32
	ta	HP_BAD_TRAP	/* 0x170 */
.align 32
	ta	HP_BAD_TRAP	/* 0x171 */
.align 32
	ta	HP_BAD_TRAP	/* 0x172 */
.align 32
	ta	HP_BAD_TRAP	/* 0x173 */
.align 32
	ta	HP_BAD_TRAP	/* 0x174 */
.align 32
	ta	HP_BAD_TRAP	/* 0x175 */
.align 32
	ta	HP_BAD_TRAP	/* 0x176 */
.align 32
	ta	HP_BAD_TRAP	/* 0x177 */
.align 32
	ta	HP_BAD_TRAP	/* 0x178 */
.align 32
	ta	HP_BAD_TRAP	/* 0x179 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17a */
.align 32
	ta	HP_BAD_TRAP	/* 0x17b */
.align 32
	ta	HP_BAD_TRAP	/* 0x17c */
.align 32
	ta	HP_BAD_TRAP	/* 0x17d */
.align 32
	ta	HP_BAD_TRAP	/* 0x17e */
.align 32
	ta	HP_BAD_TRAP	/* 0x17f */
.align 32
Thr2_Ptrap_Sect_text_end:
/*********************************************************************/
SECTION .Thr3_Ptrap_Sect TEXT_VA=THR3_PTRAP_TEXT_VA
attr_text {
	Name = .Thr3_Ptrap_Sect ,
	thr3_z_ctx_tsb_3
	VA = THR3_PTRAP_TEXT_VA ,
	RA = THR3_PTRAP_TEXT_RA ,
	PA = THR3_PTRAP_TEXT_PA ,
	TTE_Context = NUCLEUS ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0 ,
	TTE_Diag    = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 1 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_Ptrap_Sect_text_end ,
	compressimage ,
	}
	ta	HP_BAD_TRAP	/* 0x0 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa */
.align 32
	ta	HP_BAD_TRAP	/* 0xb */
.align 32
	ta	HP_BAD_TRAP	/* 0xc */
.align 32
	ta	HP_BAD_TRAP	/* 0xd */
.align 32
	ta	HP_BAD_TRAP	/* 0xe */
.align 32
	ta	HP_BAD_TRAP	/* 0xf */
.align 32
	ta	HP_BAD_TRAP	/* 0x10 */
.align 32
	ta	HP_BAD_TRAP	/* 0x11 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17 */
.align 32
	ta	HP_BAD_TRAP	/* 0x18 */
.align 32
	ta	HP_BAD_TRAP	/* 0x19 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1a */
.align 32
	ta	HP_BAD_TRAP	/* 0x1b */
.align 32
	ta	HP_BAD_TRAP	/* 0x1c */
.align 32
	ta	HP_BAD_TRAP	/* 0x1d */
.align 32
	ta	HP_BAD_TRAP	/* 0x1e */
.align 32
	ta	HP_BAD_TRAP	/* 0x1f */
.align 32
	ta	HP_BAD_TRAP	/* 0x20 */
.align 32
	ta	HP_BAD_TRAP	/* 0x21 */
.align 32
	ta	HP_BAD_TRAP	/* 0x22 */
.align 32
	ta	HP_BAD_TRAP	/* 0x23 */
.align 32
	ta	HP_BAD_TRAP	/* 0x24 */
.align 32
	ta	HP_BAD_TRAP	/* 0x25 */
.align 32
	ta	HP_BAD_TRAP	/* 0x26 */
.align 32
	ta	HP_BAD_TRAP	/* 0x27 */
.align 32
	ta	HP_BAD_TRAP	/* 0x28 */
.align 32
	ta	HP_BAD_TRAP	/* 0x29 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2a */
.align 32
	ta	HP_BAD_TRAP	/* 0x2b */
.align 32
	ta	HP_BAD_TRAP	/* 0x2c */
.align 32
	ta	HP_BAD_TRAP	/* 0x2d */
.align 32
	ta	HP_BAD_TRAP	/* 0x2e */
.align 32
	ta	HP_BAD_TRAP	/* 0x2f */
.align 32
	ta	HP_BAD_TRAP	/* 0x30 */
.align 32
	ta	HP_BAD_TRAP	/* 0x31 */
.align 32
	ta	HP_BAD_TRAP	/* 0x32 */
.align 32
	ta	HP_BAD_TRAP	/* 0x33 */
.align 32
	ta	HP_BAD_TRAP	/* 0x34 */
.align 32
	ta	HP_BAD_TRAP	/* 0x35 */
.align 32
	ta	HP_BAD_TRAP	/* 0x36 */
.align 32
	ta	HP_BAD_TRAP	/* 0x37 */
.align 32
	ta	HP_BAD_TRAP	/* 0x38 */
.align 32
	ta	HP_BAD_TRAP	/* 0x39 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3a */
.align 32
	ta	HP_BAD_TRAP	/* 0x3b */
.align 32
	ta	HP_BAD_TRAP	/* 0x3c */
.align 32
	ta	HP_BAD_TRAP	/* 0x3d */
.align 32
	ta	HP_BAD_TRAP	/* 0x3e */
.align 32
	ta	HP_BAD_TRAP	/* 0x3f */
.align 32
	ta	HP_BAD_TRAP	/* 0x40 */
.align 32
	ta	HP_BAD_TRAP	/* 0x41 */
.align 32
	ta	HP_BAD_TRAP	/* 0x42 */
.align 32
	ta	HP_BAD_TRAP	/* 0x43 */
.align 32
	ta	HP_BAD_TRAP	/* 0x44 */
.align 32
	ta	HP_BAD_TRAP	/* 0x45 */
.align 32
	ta	HP_BAD_TRAP	/* 0x46 */
.align 32
	ta	HP_BAD_TRAP	/* 0x47 */
.align 32
	ta	HP_BAD_TRAP	/* 0x48 */
.align 32
	ta	HP_BAD_TRAP	/* 0x49 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4a */
.align 32
	ta	HP_BAD_TRAP	/* 0x4b */
.align 32
	ta	HP_BAD_TRAP	/* 0x4c */
.align 32
	ta	HP_BAD_TRAP	/* 0x4d */
.align 32
	ta	HP_BAD_TRAP	/* 0x4e */
.align 32
	ta	HP_BAD_TRAP	/* 0x4f */
.align 32
	ta	HP_BAD_TRAP	/* 0x50 */
.align 32
	ta	HP_BAD_TRAP	/* 0x51 */
.align 32
	ta	HP_BAD_TRAP	/* 0x52 */
.align 32
	ta	HP_BAD_TRAP	/* 0x53 */
.align 32
	ta	HP_BAD_TRAP	/* 0x54 */
.align 32
	ta	HP_BAD_TRAP	/* 0x55 */
.align 32
	ta	HP_BAD_TRAP	/* 0x56 */
.align 32
	ta	HP_BAD_TRAP	/* 0x57 */
.align 32
	ta	HP_BAD_TRAP	/* 0x58 */
.align 32
	ta	HP_BAD_TRAP	/* 0x59 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5a */
.align 32
	ta	HP_BAD_TRAP	/* 0x5b */
.align 32
	ta	HP_BAD_TRAP	/* 0x5c */
.align 32
	ta	HP_BAD_TRAP	/* 0x5d */
.align 32
	ta	HP_BAD_TRAP	/* 0x5e */
.align 32
	ta	HP_BAD_TRAP	/* 0x5f */
.align 32
	ta	HP_BAD_TRAP	/* 0x60 */
.align 32
	ta	HP_BAD_TRAP	/* 0x61 */
.align 32
	ta	HP_BAD_TRAP	/* 0x62 */
.align 32
	ta	HP_BAD_TRAP	/* 0x63 */
.align 32
	ta	HP_BAD_TRAP	/* 0x64 */
.align 32
	ta	HP_BAD_TRAP	/* 0x65 */
.align 32
	ta	HP_BAD_TRAP	/* 0x66 */
.align 32
	ta	HP_BAD_TRAP	/* 0x67 */
.align 32
	ta	HP_BAD_TRAP	/* 0x68 */
.align 32
	ta	HP_BAD_TRAP	/* 0x69 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6a */
.align 32
	ta	HP_BAD_TRAP	/* 0x6b */
.align 32
	ta	HP_BAD_TRAP	/* 0x6c */
.align 32
	ta	HP_BAD_TRAP	/* 0x6d */
.align 32
	ta	HP_BAD_TRAP	/* 0x6e */
.align 32
	ta	HP_BAD_TRAP	/* 0x6f */
.align 32
	ta	HP_BAD_TRAP	/* 0x70 */
.align 32
	ta	HP_BAD_TRAP	/* 0x71 */
.align 32
	ta	HP_BAD_TRAP	/* 0x72 */
.align 32
	ta	HP_BAD_TRAP	/* 0x73 */
.align 32
	ta	HP_BAD_TRAP	/* 0x74 */
.align 32
	ta	HP_BAD_TRAP	/* 0x75 */
.align 32
	ta	HP_BAD_TRAP	/* 0x76 */
.align 32
	ta	HP_BAD_TRAP	/* 0x77 */
.align 32
	ta	HP_BAD_TRAP	/* 0x78 */
.align 32
	ta	HP_BAD_TRAP	/* 0x79 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7a */
.align 32
	ta	HP_BAD_TRAP	/* 0x7b */
.align 32
	ta	HP_BAD_TRAP	/* 0x7c */
.align 32
	ta	HP_BAD_TRAP	/* 0x7d */
.align 32
	ta	HP_BAD_TRAP	/* 0x7e */
.align 32
	ta	HP_BAD_TRAP	/* 0x7f */
.align 32
	ta	HP_BAD_TRAP	/* 0x80 */
.align 32
	ta	HP_BAD_TRAP	/* 0x81 */
.align 32
	ta	HP_BAD_TRAP	/* 0x82 */
.align 32
	ta	HP_BAD_TRAP	/* 0x83 */
.align 32
	ta	HP_BAD_TRAP	/* 0x84 */
.align 32
	ta	HP_BAD_TRAP	/* 0x85 */
.align 32
	ta	HP_BAD_TRAP	/* 0x86 */
.align 32
	ta	HP_BAD_TRAP	/* 0x87 */
.align 32
	ta	HP_BAD_TRAP	/* 0x88 */
.align 32
	ta	HP_BAD_TRAP	/* 0x89 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8a */
.align 32
	ta	HP_BAD_TRAP	/* 0x8b */
.align 32
	ta	HP_BAD_TRAP	/* 0x8c */
.align 32
	ta	HP_BAD_TRAP	/* 0x8d */
.align 32
	ta	HP_BAD_TRAP	/* 0x8e */
.align 32
	ta	HP_BAD_TRAP	/* 0x8f */
.align 32
	ta	HP_BAD_TRAP	/* 0x90 */
.align 32
	ta	HP_BAD_TRAP	/* 0x91 */
.align 32
	ta	HP_BAD_TRAP	/* 0x92 */
.align 32
	ta	HP_BAD_TRAP	/* 0x93 */
.align 32
	ta	HP_BAD_TRAP	/* 0x94 */
.align 32
	ta	HP_BAD_TRAP	/* 0x95 */
.align 32
	ta	HP_BAD_TRAP	/* 0x96 */
.align 32
	ta	HP_BAD_TRAP	/* 0x97 */
.align 32
	ta	HP_BAD_TRAP	/* 0x98 */
.align 32
	ta	HP_BAD_TRAP	/* 0x99 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9a */
.align 32
	ta	HP_BAD_TRAP	/* 0x9b */
.align 32
	ta	HP_BAD_TRAP	/* 0x9c */
.align 32
	ta	HP_BAD_TRAP	/* 0x9d */
.align 32
	ta	HP_BAD_TRAP	/* 0x9e */
.align 32
	ta	HP_BAD_TRAP	/* 0x9f */
.align 32
	ta	HP_BAD_TRAP	/* 0xa0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xaa */
.align 32
	ta	HP_BAD_TRAP	/* 0xab */
.align 32
	ta	HP_BAD_TRAP	/* 0xac */
.align 32
	ta	HP_BAD_TRAP	/* 0xad */
.align 32
	ta	HP_BAD_TRAP	/* 0xae */
.align 32
	ta	HP_BAD_TRAP	/* 0xaf */
.align 32
	ta	HP_BAD_TRAP	/* 0xb0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xba */
.align 32
	ta	HP_BAD_TRAP	/* 0xbb */
.align 32
	ta	HP_BAD_TRAP	/* 0xbc */
.align 32
	ta	HP_BAD_TRAP	/* 0xbd */
.align 32
	ta	HP_BAD_TRAP	/* 0xbe */
.align 32
	ta	HP_BAD_TRAP	/* 0xbf */
.align 32
	ta	HP_BAD_TRAP	/* 0xc0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xca */
.align 32
	ta	HP_BAD_TRAP	/* 0xcb */
.align 32
	ta	HP_BAD_TRAP	/* 0xcc */
.align 32
	ta	HP_BAD_TRAP	/* 0xcd */
.align 32
	ta	HP_BAD_TRAP	/* 0xce */
.align 32
	ta	HP_BAD_TRAP	/* 0xcf */
.align 32
	ta	HP_BAD_TRAP	/* 0xd0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xda */
.align 32
	ta	HP_BAD_TRAP	/* 0xdb */
.align 32
	ta	HP_BAD_TRAP	/* 0xdc */
.align 32
	ta	HP_BAD_TRAP	/* 0xdd */
.align 32
	ta	HP_BAD_TRAP	/* 0xde */
.align 32
	ta	HP_BAD_TRAP	/* 0xdf */
.align 32
	ta	HP_BAD_TRAP	/* 0xe0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xea */
.align 32
	ta	HP_BAD_TRAP	/* 0xeb */
.align 32
	ta	HP_BAD_TRAP	/* 0xec */
.align 32
	ta	HP_BAD_TRAP	/* 0xed */
.align 32
	ta	HP_BAD_TRAP	/* 0xee */
.align 32
	ta	HP_BAD_TRAP	/* 0xef */
.align 32
	ta	HP_BAD_TRAP	/* 0xf0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xfa */
.align 32
	ta	HP_BAD_TRAP	/* 0xfb */
.align 32
	ta	HP_BAD_TRAP	/* 0xfc */
.align 32
	ta	HP_BAD_TRAP	/* 0xfd */
.align 32
	ta	HP_BAD_TRAP	/* 0xfe */
.align 32
	ta	HP_BAD_TRAP	/* 0xff */
.align 32
	ta	HP_GOOD_TRAP		/* 0x100 */
.align 32
	ta	HP_BAD_TRAP	/* 0x101 */
.align 32
	ta	HP_BAD_TRAP	/* 0x102 */
.align 32
	ta	HP_BAD_TRAP	/* 0x103 */
.align 32
	ta	HP_BAD_TRAP	/* 0x104 */
.align 32
	ta	HP_BAD_TRAP	/* 0x105 */
.align 32
	ta	HP_BAD_TRAP	/* 0x106 */
.align 32
	ta	HP_BAD_TRAP	/* 0x107 */
.align 32
	ta	HP_BAD_TRAP	/* 0x108 */
.align 32
	ta	HP_BAD_TRAP	/* 0x109 */
.align 32
	ta	HP_BAD_TRAP	/* 0x10a */
.align 32
	ta	HP_BAD_TRAP	/* 0x10b */
.align 32
	ta	HP_BAD_TRAP	/* 0x10c */
.align 32
	ta	HP_BAD_TRAP	/* 0x10d */
.align 32
	ta	HP_BAD_TRAP	/* 0x10e */
.align 32
	ta	HP_BAD_TRAP	/* 0x10f */
.align 32
	ta	HPTRAP_I_DEMAP_ALL	/* 0x110 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PCTX	/* 0x111 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_SCTX	/* 0x112 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_NCTX	/* 0x113 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PAGE	/* 0x114 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_RPAGE	/* 0x115 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_REAL 	/* 0x116 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_ALL	/* 0x117 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PCTX	/* 0x118 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_SCTX	/* 0x119 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_NCTX	/* 0x11a */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PAGE	/* 0x11b */
	done
.align 32
	ta	HPTRAP_D_DEMAP_RPAGE	/* 0x11c */
	done
.align 32
	ta	HPTRAP_D_DEMAP_REAL     /* 0x11d */
	done
.align 32
	ta	HP_BAD_TRAP	/* 0x11e */
.align 32
	ta	HP_BAD_TRAP	/* 0x11f */
.align 32
	sllx	%i7, 63, %g1
	brz	%g1, 1f
	nop
	rdpr	%tnpc, %g2
	add	%g2, 8, %g2
	wrpr	%g2, %tnpc
1:	
	done
.align 32
	ta	HPTRAP_CHANGE_PID	/* 0x121 */
.align 32
	ta	HP_BAD_TRAP	/* 0x122 */
.align 32
	ta	HP_BAD_TRAP	/* 0x123 */
.align 32
	ta	HP_BAD_TRAP	/* 0x124 */
.align 32
	ta	HP_BAD_TRAP	/* 0x125 */
.align 32
	ta	HP_BAD_TRAP	/* 0x126 */
.align 32
	ta	HP_BAD_TRAP	/* 0x127 */
.align 32
	ta	HP_BAD_TRAP	/* 0x128 */
.align 32
	ta	HP_BAD_TRAP	/* 0x129 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12a */
.align 32
	ta	HP_BAD_TRAP	/* 0x12b */
.align 32
	ta	HP_BAD_TRAP	/* 0x12c */
.align 32
	ta	HP_BAD_TRAP	/* 0x12d */
.align 32
	ta	HP_BAD_TRAP	/* 0x12e */
.align 32
	ta	HP_BAD_TRAP	/* 0x12f */
.align 32
	ta	HP_BAD_TRAP	/* 0x130 */
.align 32
	ta	HP_BAD_TRAP	/* 0x131 */
.align 32
	ta	HP_BAD_TRAP	/* 0x132 */
.align 32
	ta	HP_BAD_TRAP	/* 0x133 */
.align 32
	ta	HP_BAD_TRAP	/* 0x134 */
.align 32
	ta	HP_BAD_TRAP	/* 0x135 */
.align 32
	ta	HP_BAD_TRAP	/* 0x136 */
.align 32
	ta	HP_BAD_TRAP	/* 0x137 */
.align 32
	ta	HP_BAD_TRAP	/* 0x138 */
.align 32
	ta	HP_BAD_TRAP	/* 0x139 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13a */
.align 32
	ta	HP_BAD_TRAP	/* 0x13b */
.align 32
	ta	HP_BAD_TRAP	/* 0x13c */
.align 32
	ta	HP_BAD_TRAP	/* 0x13d */
.align 32
	ta	HP_BAD_TRAP	/* 0x13e */
.align 32
	ta	HP_BAD_TRAP	/* 0x13f */
.align 32
	ta	HP_BAD_TRAP	/* 0x140 */
.align 32
	ta	HP_BAD_TRAP	/* 0x141 */
.align 32
	ta	HP_BAD_TRAP	/* 0x142 */
.align 32
	ta	HP_BAD_TRAP	/* 0x143 */
.align 32
	ta	HP_BAD_TRAP	/* 0x144 */
.align 32
	ta	HP_BAD_TRAP	/* 0x145 */
.align 32
	ta	HP_BAD_TRAP	/* 0x146 */
.align 32
	ta	HP_BAD_TRAP	/* 0x147 */
.align 32
	ta	HP_BAD_TRAP	/* 0x148 */
.align 32
	ta	HP_BAD_TRAP	/* 0x149 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14a */
.align 32
	ta	HP_BAD_TRAP	/* 0x14b */
.align 32
	ta	HP_BAD_TRAP	/* 0x14c */
.align 32
	ta	HP_BAD_TRAP	/* 0x14d */
.align 32
	ta	HP_BAD_TRAP	/* 0x14e */
.align 32
	ta	HP_BAD_TRAP	/* 0x14f */
.align 32
	ta	HP_BAD_TRAP	/* 0x150 */
.align 32
	ta	HP_BAD_TRAP	/* 0x151 */
.align 32
	ta	HP_BAD_TRAP	/* 0x152 */
.align 32
	ta	HP_BAD_TRAP	/* 0x153 */
.align 32
	ta	HP_BAD_TRAP	/* 0x154 */
.align 32
	ta	HP_BAD_TRAP	/* 0x155 */
.align 32
	ta	HP_BAD_TRAP	/* 0x156 */
.align 32
	ta	HP_BAD_TRAP	/* 0x157 */
.align 32
	ta	HP_BAD_TRAP	/* 0x158 */
.align 32
	ta	HP_BAD_TRAP	/* 0x159 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15a */
.align 32
	ta	HP_BAD_TRAP	/* 0x15b */
.align 32
	ta	HP_BAD_TRAP	/* 0x15c */
.align 32
	ta	HP_BAD_TRAP	/* 0x15d */
.align 32
	ta	HP_BAD_TRAP	/* 0x15e */
.align 32
	ta	HP_BAD_TRAP	/* 0x15f */
.align 32
	ta	HP_BAD_TRAP	/* 0x160 */
.align 32
	ta	HP_BAD_TRAP	/* 0x161 */
.align 32
	ta	HP_BAD_TRAP	/* 0x162 */
.align 32
	ta	HP_BAD_TRAP	/* 0x163 */
.align 32
	ta	HP_BAD_TRAP	/* 0x164 */
.align 32
	ta	HP_BAD_TRAP	/* 0x165 */
.align 32
	ta	HP_BAD_TRAP	/* 0x166 */
.align 32
	ta	HP_BAD_TRAP	/* 0x167 */
.align 32
	ta	HP_BAD_TRAP	/* 0x168 */
.align 32
	ta	HP_BAD_TRAP	/* 0x169 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16a */
.align 32
	ta	HP_BAD_TRAP	/* 0x16b */
.align 32
	ta	HP_BAD_TRAP	/* 0x16c */
.align 32
	ta	HP_BAD_TRAP	/* 0x16d */
.align 32
	ta	HP_BAD_TRAP	/* 0x16e */
.align 32
	ta	HP_BAD_TRAP	/* 0x16f */
.align 32
	ta	HP_BAD_TRAP	/* 0x170 */
.align 32
	ta	HP_BAD_TRAP	/* 0x171 */
.align 32
	ta	HP_BAD_TRAP	/* 0x172 */
.align 32
	ta	HP_BAD_TRAP	/* 0x173 */
.align 32
	ta	HP_BAD_TRAP	/* 0x174 */
.align 32
	ta	HP_BAD_TRAP	/* 0x175 */
.align 32
	ta	HP_BAD_TRAP	/* 0x176 */
.align 32
	ta	HP_BAD_TRAP	/* 0x177 */
.align 32
	ta	HP_BAD_TRAP	/* 0x178 */
.align 32
	ta	HP_BAD_TRAP	/* 0x179 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17a */
.align 32
	ta	HP_BAD_TRAP	/* 0x17b */
.align 32
	ta	HP_BAD_TRAP	/* 0x17c */
.align 32
	ta	HP_BAD_TRAP	/* 0x17d */
.align 32
	ta	HP_BAD_TRAP	/* 0x17e */
.align 32
	ta	HP_BAD_TRAP	/* 0x17f */
.align 32
Thr3_Ptrap_Sect_text_end:
/*********************************************************************/
SECTION .Thr4_Ptrap_Sect TEXT_VA=THR4_PTRAP_TEXT_VA
attr_text {
	Name = .Thr4_Ptrap_Sect ,
	thr4_z_ctx_tsb_2
	VA = THR4_PTRAP_TEXT_VA ,
	RA = THR4_PTRAP_TEXT_RA ,
	PA = THR4_PTRAP_TEXT_PA ,
	TTE_Context = NUCLEUS ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0 ,
	TTE_Diag    = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 1 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr4_Ptrap_Sect_text_end ,
	compressimage ,
	}
	ta	HP_BAD_TRAP	/* 0x0 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa */
.align 32
	ta	HP_BAD_TRAP	/* 0xb */
.align 32
	ta	HP_BAD_TRAP	/* 0xc */
.align 32
	ta	HP_BAD_TRAP	/* 0xd */
.align 32
	ta	HP_BAD_TRAP	/* 0xe */
.align 32
	ta	HP_BAD_TRAP	/* 0xf */
.align 32
	ta	HP_BAD_TRAP	/* 0x10 */
.align 32
	ta	HP_BAD_TRAP	/* 0x11 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17 */
.align 32
	ta	HP_BAD_TRAP	/* 0x18 */
.align 32
	ta	HP_BAD_TRAP	/* 0x19 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1a */
.align 32
	ta	HP_BAD_TRAP	/* 0x1b */
.align 32
	ta	HP_BAD_TRAP	/* 0x1c */
.align 32
	ta	HP_BAD_TRAP	/* 0x1d */
.align 32
	ta	HP_BAD_TRAP	/* 0x1e */
.align 32
	ta	HP_BAD_TRAP	/* 0x1f */
.align 32
	ta	HP_BAD_TRAP	/* 0x20 */
.align 32
	ta	HP_BAD_TRAP	/* 0x21 */
.align 32
	ta	HP_BAD_TRAP	/* 0x22 */
.align 32
	ta	HP_BAD_TRAP	/* 0x23 */
.align 32
	ta	HP_BAD_TRAP	/* 0x24 */
.align 32
	ta	HP_BAD_TRAP	/* 0x25 */
.align 32
	ta	HP_BAD_TRAP	/* 0x26 */
.align 32
	ta	HP_BAD_TRAP	/* 0x27 */
.align 32
	ta	HP_BAD_TRAP	/* 0x28 */
.align 32
	ta	HP_BAD_TRAP	/* 0x29 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2a */
.align 32
	ta	HP_BAD_TRAP	/* 0x2b */
.align 32
	ta	HP_BAD_TRAP	/* 0x2c */
.align 32
	ta	HP_BAD_TRAP	/* 0x2d */
.align 32
	ta	HP_BAD_TRAP	/* 0x2e */
.align 32
	ta	HP_BAD_TRAP	/* 0x2f */
.align 32
	ta	HP_BAD_TRAP	/* 0x30 */
.align 32
	ta	HP_BAD_TRAP	/* 0x31 */
.align 32
	ta	HP_BAD_TRAP	/* 0x32 */
.align 32
	ta	HP_BAD_TRAP	/* 0x33 */
.align 32
	ta	HP_BAD_TRAP	/* 0x34 */
.align 32
	ta	HP_BAD_TRAP	/* 0x35 */
.align 32
	ta	HP_BAD_TRAP	/* 0x36 */
.align 32
	ta	HP_BAD_TRAP	/* 0x37 */
.align 32
	ta	HP_BAD_TRAP	/* 0x38 */
.align 32
	ta	HP_BAD_TRAP	/* 0x39 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3a */
.align 32
	ta	HP_BAD_TRAP	/* 0x3b */
.align 32
	ta	HP_BAD_TRAP	/* 0x3c */
.align 32
	ta	HP_BAD_TRAP	/* 0x3d */
.align 32
	ta	HP_BAD_TRAP	/* 0x3e */
.align 32
	ta	HP_BAD_TRAP	/* 0x3f */
.align 32
	ta	HP_BAD_TRAP	/* 0x40 */
.align 32
	ta	HP_BAD_TRAP	/* 0x41 */
.align 32
	ta	HP_BAD_TRAP	/* 0x42 */
.align 32
	ta	HP_BAD_TRAP	/* 0x43 */
.align 32
	ta	HP_BAD_TRAP	/* 0x44 */
.align 32
	ta	HP_BAD_TRAP	/* 0x45 */
.align 32
	ta	HP_BAD_TRAP	/* 0x46 */
.align 32
	ta	HP_BAD_TRAP	/* 0x47 */
.align 32
	ta	HP_BAD_TRAP	/* 0x48 */
.align 32
	ta	HP_BAD_TRAP	/* 0x49 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4a */
.align 32
	ta	HP_BAD_TRAP	/* 0x4b */
.align 32
	ta	HP_BAD_TRAP	/* 0x4c */
.align 32
	ta	HP_BAD_TRAP	/* 0x4d */
.align 32
	ta	HP_BAD_TRAP	/* 0x4e */
.align 32
	ta	HP_BAD_TRAP	/* 0x4f */
.align 32
	ta	HP_BAD_TRAP	/* 0x50 */
.align 32
	ta	HP_BAD_TRAP	/* 0x51 */
.align 32
	ta	HP_BAD_TRAP	/* 0x52 */
.align 32
	ta	HP_BAD_TRAP	/* 0x53 */
.align 32
	ta	HP_BAD_TRAP	/* 0x54 */
.align 32
	ta	HP_BAD_TRAP	/* 0x55 */
.align 32
	ta	HP_BAD_TRAP	/* 0x56 */
.align 32
	ta	HP_BAD_TRAP	/* 0x57 */
.align 32
	ta	HP_BAD_TRAP	/* 0x58 */
.align 32
	ta	HP_BAD_TRAP	/* 0x59 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5a */
.align 32
	ta	HP_BAD_TRAP	/* 0x5b */
.align 32
	ta	HP_BAD_TRAP	/* 0x5c */
.align 32
	ta	HP_BAD_TRAP	/* 0x5d */
.align 32
	ta	HP_BAD_TRAP	/* 0x5e */
.align 32
	ta	HP_BAD_TRAP	/* 0x5f */
.align 32
	ta	HP_BAD_TRAP	/* 0x60 */
.align 32
	ta	HP_BAD_TRAP	/* 0x61 */
.align 32
	ta	HP_BAD_TRAP	/* 0x62 */
.align 32
	ta	HP_BAD_TRAP	/* 0x63 */
.align 32
	ta	HP_BAD_TRAP	/* 0x64 */
.align 32
	ta	HP_BAD_TRAP	/* 0x65 */
.align 32
	ta	HP_BAD_TRAP	/* 0x66 */
.align 32
	ta	HP_BAD_TRAP	/* 0x67 */
.align 32
	ta	HP_BAD_TRAP	/* 0x68 */
.align 32
	ta	HP_BAD_TRAP	/* 0x69 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6a */
.align 32
	ta	HP_BAD_TRAP	/* 0x6b */
.align 32
	ta	HP_BAD_TRAP	/* 0x6c */
.align 32
	ta	HP_BAD_TRAP	/* 0x6d */
.align 32
	ta	HP_BAD_TRAP	/* 0x6e */
.align 32
	ta	HP_BAD_TRAP	/* 0x6f */
.align 32
	ta	HP_BAD_TRAP	/* 0x70 */
.align 32
	ta	HP_BAD_TRAP	/* 0x71 */
.align 32
	ta	HP_BAD_TRAP	/* 0x72 */
.align 32
	ta	HP_BAD_TRAP	/* 0x73 */
.align 32
	ta	HP_BAD_TRAP	/* 0x74 */
.align 32
	ta	HP_BAD_TRAP	/* 0x75 */
.align 32
	ta	HP_BAD_TRAP	/* 0x76 */
.align 32
	ta	HP_BAD_TRAP	/* 0x77 */
.align 32
	ta	HP_BAD_TRAP	/* 0x78 */
.align 32
	ta	HP_BAD_TRAP	/* 0x79 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7a */
.align 32
	ta	HP_BAD_TRAP	/* 0x7b */
.align 32
	ta	HP_BAD_TRAP	/* 0x7c */
.align 32
	ta	HP_BAD_TRAP	/* 0x7d */
.align 32
	ta	HP_BAD_TRAP	/* 0x7e */
.align 32
	ta	HP_BAD_TRAP	/* 0x7f */
.align 32
	ta	HP_BAD_TRAP	/* 0x80 */
.align 32
	ta	HP_BAD_TRAP	/* 0x81 */
.align 32
	ta	HP_BAD_TRAP	/* 0x82 */
.align 32
	ta	HP_BAD_TRAP	/* 0x83 */
.align 32
	ta	HP_BAD_TRAP	/* 0x84 */
.align 32
	ta	HP_BAD_TRAP	/* 0x85 */
.align 32
	ta	HP_BAD_TRAP	/* 0x86 */
.align 32
	ta	HP_BAD_TRAP	/* 0x87 */
.align 32
	ta	HP_BAD_TRAP	/* 0x88 */
.align 32
	ta	HP_BAD_TRAP	/* 0x89 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8a */
.align 32
	ta	HP_BAD_TRAP	/* 0x8b */
.align 32
	ta	HP_BAD_TRAP	/* 0x8c */
.align 32
	ta	HP_BAD_TRAP	/* 0x8d */
.align 32
	ta	HP_BAD_TRAP	/* 0x8e */
.align 32
	ta	HP_BAD_TRAP	/* 0x8f */
.align 32
	ta	HP_BAD_TRAP	/* 0x90 */
.align 32
	ta	HP_BAD_TRAP	/* 0x91 */
.align 32
	ta	HP_BAD_TRAP	/* 0x92 */
.align 32
	ta	HP_BAD_TRAP	/* 0x93 */
.align 32
	ta	HP_BAD_TRAP	/* 0x94 */
.align 32
	ta	HP_BAD_TRAP	/* 0x95 */
.align 32
	ta	HP_BAD_TRAP	/* 0x96 */
.align 32
	ta	HP_BAD_TRAP	/* 0x97 */
.align 32
	ta	HP_BAD_TRAP	/* 0x98 */
.align 32
	ta	HP_BAD_TRAP	/* 0x99 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9a */
.align 32
	ta	HP_BAD_TRAP	/* 0x9b */
.align 32
	ta	HP_BAD_TRAP	/* 0x9c */
.align 32
	ta	HP_BAD_TRAP	/* 0x9d */
.align 32
	ta	HP_BAD_TRAP	/* 0x9e */
.align 32
	ta	HP_BAD_TRAP	/* 0x9f */
.align 32
	ta	HP_BAD_TRAP	/* 0xa0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xaa */
.align 32
	ta	HP_BAD_TRAP	/* 0xab */
.align 32
	ta	HP_BAD_TRAP	/* 0xac */
.align 32
	ta	HP_BAD_TRAP	/* 0xad */
.align 32
	ta	HP_BAD_TRAP	/* 0xae */
.align 32
	ta	HP_BAD_TRAP	/* 0xaf */
.align 32
	ta	HP_BAD_TRAP	/* 0xb0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xba */
.align 32
	ta	HP_BAD_TRAP	/* 0xbb */
.align 32
	ta	HP_BAD_TRAP	/* 0xbc */
.align 32
	ta	HP_BAD_TRAP	/* 0xbd */
.align 32
	ta	HP_BAD_TRAP	/* 0xbe */
.align 32
	ta	HP_BAD_TRAP	/* 0xbf */
.align 32
	ta	HP_BAD_TRAP	/* 0xc0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xca */
.align 32
	ta	HP_BAD_TRAP	/* 0xcb */
.align 32
	ta	HP_BAD_TRAP	/* 0xcc */
.align 32
	ta	HP_BAD_TRAP	/* 0xcd */
.align 32
	ta	HP_BAD_TRAP	/* 0xce */
.align 32
	ta	HP_BAD_TRAP	/* 0xcf */
.align 32
	ta	HP_BAD_TRAP	/* 0xd0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xda */
.align 32
	ta	HP_BAD_TRAP	/* 0xdb */
.align 32
	ta	HP_BAD_TRAP	/* 0xdc */
.align 32
	ta	HP_BAD_TRAP	/* 0xdd */
.align 32
	ta	HP_BAD_TRAP	/* 0xde */
.align 32
	ta	HP_BAD_TRAP	/* 0xdf */
.align 32
	ta	HP_BAD_TRAP	/* 0xe0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xea */
.align 32
	ta	HP_BAD_TRAP	/* 0xeb */
.align 32
	ta	HP_BAD_TRAP	/* 0xec */
.align 32
	ta	HP_BAD_TRAP	/* 0xed */
.align 32
	ta	HP_BAD_TRAP	/* 0xee */
.align 32
	ta	HP_BAD_TRAP	/* 0xef */
.align 32
	ta	HP_BAD_TRAP	/* 0xf0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xfa */
.align 32
	ta	HP_BAD_TRAP	/* 0xfb */
.align 32
	ta	HP_BAD_TRAP	/* 0xfc */
.align 32
	ta	HP_BAD_TRAP	/* 0xfd */
.align 32
	ta	HP_BAD_TRAP	/* 0xfe */
.align 32
	ta	HP_BAD_TRAP	/* 0xff */
.align 32
	ta	HP_GOOD_TRAP		/* 0x100 */
.align 32
	ta	HP_BAD_TRAP	/* 0x101 */
.align 32
	ta	HP_BAD_TRAP	/* 0x102 */
.align 32
	ta	HP_BAD_TRAP	/* 0x103 */
.align 32
	ta	HP_BAD_TRAP	/* 0x104 */
.align 32
	ta	HP_BAD_TRAP	/* 0x105 */
.align 32
	ta	HP_BAD_TRAP	/* 0x106 */
.align 32
	ta	HP_BAD_TRAP	/* 0x107 */
.align 32
	ta	HP_BAD_TRAP	/* 0x108 */
.align 32
	ta	HP_BAD_TRAP	/* 0x109 */
.align 32
	ta	HP_BAD_TRAP	/* 0x10a */
.align 32
	ta	HP_BAD_TRAP	/* 0x10b */
.align 32
	ta	HP_BAD_TRAP	/* 0x10c */
.align 32
	ta	HP_BAD_TRAP	/* 0x10d */
.align 32
	ta	HP_BAD_TRAP	/* 0x10e */
.align 32
	ta	HP_BAD_TRAP	/* 0x10f */
.align 32
	ta	HPTRAP_I_DEMAP_ALL	/* 0x110 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PCTX	/* 0x111 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_SCTX	/* 0x112 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_NCTX	/* 0x113 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PAGE	/* 0x114 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_RPAGE	/* 0x115 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_REAL 	/* 0x116 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_ALL	/* 0x117 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PCTX	/* 0x118 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_SCTX	/* 0x119 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_NCTX	/* 0x11a */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PAGE	/* 0x11b */
	done
.align 32
	ta	HPTRAP_D_DEMAP_RPAGE	/* 0x11c */
	done
.align 32
	ta	HPTRAP_D_DEMAP_REAL     /* 0x11d */
	done
.align 32
	ta	HP_BAD_TRAP	/* 0x11e */
.align 32
	ta	HP_BAD_TRAP	/* 0x11f */
.align 32
	sllx	%i7, 63, %g1
	brz	%g1, 1f
	nop
	rdpr	%tnpc, %g2
	add	%g2, 8, %g2
	wrpr	%g2, %tnpc
1:	
	done
.align 32
	ta	HPTRAP_CHANGE_PID	/* 0x121 */
.align 32
	ta	HP_BAD_TRAP	/* 0x122 */
.align 32
	ta	HP_BAD_TRAP	/* 0x123 */
.align 32
	ta	HP_BAD_TRAP	/* 0x124 */
.align 32
	ta	HP_BAD_TRAP	/* 0x125 */
.align 32
	ta	HP_BAD_TRAP	/* 0x126 */
.align 32
	ta	HP_BAD_TRAP	/* 0x127 */
.align 32
	ta	HP_BAD_TRAP	/* 0x128 */
.align 32
	ta	HP_BAD_TRAP	/* 0x129 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12a */
.align 32
	ta	HP_BAD_TRAP	/* 0x12b */
.align 32
	ta	HP_BAD_TRAP	/* 0x12c */
.align 32
	ta	HP_BAD_TRAP	/* 0x12d */
.align 32
	ta	HP_BAD_TRAP	/* 0x12e */
.align 32
	ta	HP_BAD_TRAP	/* 0x12f */
.align 32
	ta	HP_BAD_TRAP	/* 0x130 */
.align 32
	ta	HP_BAD_TRAP	/* 0x131 */
.align 32
	ta	HP_BAD_TRAP	/* 0x132 */
.align 32
	ta	HP_BAD_TRAP	/* 0x133 */
.align 32
	ta	HP_BAD_TRAP	/* 0x134 */
.align 32
	ta	HP_BAD_TRAP	/* 0x135 */
.align 32
	ta	HP_BAD_TRAP	/* 0x136 */
.align 32
	ta	HP_BAD_TRAP	/* 0x137 */
.align 32
	ta	HP_BAD_TRAP	/* 0x138 */
.align 32
	ta	HP_BAD_TRAP	/* 0x139 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13a */
.align 32
	ta	HP_BAD_TRAP	/* 0x13b */
.align 32
	ta	HP_BAD_TRAP	/* 0x13c */
.align 32
	ta	HP_BAD_TRAP	/* 0x13d */
.align 32
	ta	HP_BAD_TRAP	/* 0x13e */
.align 32
	ta	HP_BAD_TRAP	/* 0x13f */
.align 32
	ta	HP_BAD_TRAP	/* 0x140 */
.align 32
	ta	HP_BAD_TRAP	/* 0x141 */
.align 32
	ta	HP_BAD_TRAP	/* 0x142 */
.align 32
	ta	HP_BAD_TRAP	/* 0x143 */
.align 32
	ta	HP_BAD_TRAP	/* 0x144 */
.align 32
	ta	HP_BAD_TRAP	/* 0x145 */
.align 32
	ta	HP_BAD_TRAP	/* 0x146 */
.align 32
	ta	HP_BAD_TRAP	/* 0x147 */
.align 32
	ta	HP_BAD_TRAP	/* 0x148 */
.align 32
	ta	HP_BAD_TRAP	/* 0x149 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14a */
.align 32
	ta	HP_BAD_TRAP	/* 0x14b */
.align 32
	ta	HP_BAD_TRAP	/* 0x14c */
.align 32
	ta	HP_BAD_TRAP	/* 0x14d */
.align 32
	ta	HP_BAD_TRAP	/* 0x14e */
.align 32
	ta	HP_BAD_TRAP	/* 0x14f */
.align 32
	ta	HP_BAD_TRAP	/* 0x150 */
.align 32
	ta	HP_BAD_TRAP	/* 0x151 */
.align 32
	ta	HP_BAD_TRAP	/* 0x152 */
.align 32
	ta	HP_BAD_TRAP	/* 0x153 */
.align 32
	ta	HP_BAD_TRAP	/* 0x154 */
.align 32
	ta	HP_BAD_TRAP	/* 0x155 */
.align 32
	ta	HP_BAD_TRAP	/* 0x156 */
.align 32
	ta	HP_BAD_TRAP	/* 0x157 */
.align 32
	ta	HP_BAD_TRAP	/* 0x158 */
.align 32
	ta	HP_BAD_TRAP	/* 0x159 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15a */
.align 32
	ta	HP_BAD_TRAP	/* 0x15b */
.align 32
	ta	HP_BAD_TRAP	/* 0x15c */
.align 32
	ta	HP_BAD_TRAP	/* 0x15d */
.align 32
	ta	HP_BAD_TRAP	/* 0x15e */
.align 32
	ta	HP_BAD_TRAP	/* 0x15f */
.align 32
	ta	HP_BAD_TRAP	/* 0x160 */
.align 32
	ta	HP_BAD_TRAP	/* 0x161 */
.align 32
	ta	HP_BAD_TRAP	/* 0x162 */
.align 32
	ta	HP_BAD_TRAP	/* 0x163 */
.align 32
	ta	HP_BAD_TRAP	/* 0x164 */
.align 32
	ta	HP_BAD_TRAP	/* 0x165 */
.align 32
	ta	HP_BAD_TRAP	/* 0x166 */
.align 32
	ta	HP_BAD_TRAP	/* 0x167 */
.align 32
	ta	HP_BAD_TRAP	/* 0x168 */
.align 32
	ta	HP_BAD_TRAP	/* 0x169 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16a */
.align 32
	ta	HP_BAD_TRAP	/* 0x16b */
.align 32
	ta	HP_BAD_TRAP	/* 0x16c */
.align 32
	ta	HP_BAD_TRAP	/* 0x16d */
.align 32
	ta	HP_BAD_TRAP	/* 0x16e */
.align 32
	ta	HP_BAD_TRAP	/* 0x16f */
.align 32
	ta	HP_BAD_TRAP	/* 0x170 */
.align 32
	ta	HP_BAD_TRAP	/* 0x171 */
.align 32
	ta	HP_BAD_TRAP	/* 0x172 */
.align 32
	ta	HP_BAD_TRAP	/* 0x173 */
.align 32
	ta	HP_BAD_TRAP	/* 0x174 */
.align 32
	ta	HP_BAD_TRAP	/* 0x175 */
.align 32
	ta	HP_BAD_TRAP	/* 0x176 */
.align 32
	ta	HP_BAD_TRAP	/* 0x177 */
.align 32
	ta	HP_BAD_TRAP	/* 0x178 */
.align 32
	ta	HP_BAD_TRAP	/* 0x179 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17a */
.align 32
	ta	HP_BAD_TRAP	/* 0x17b */
.align 32
	ta	HP_BAD_TRAP	/* 0x17c */
.align 32
	ta	HP_BAD_TRAP	/* 0x17d */
.align 32
	ta	HP_BAD_TRAP	/* 0x17e */
.align 32
	ta	HP_BAD_TRAP	/* 0x17f */
.align 32
Thr4_Ptrap_Sect_text_end:
/*********************************************************************/
SECTION .Thr5_Ptrap_Sect TEXT_VA=THR5_PTRAP_TEXT_VA
attr_text {
	Name = .Thr5_Ptrap_Sect ,
	thr5_z_ctx_tsb_2
	VA = THR5_PTRAP_TEXT_VA ,
	RA = THR5_PTRAP_TEXT_RA ,
	PA = THR5_PTRAP_TEXT_PA ,
	TTE_Context = NUCLEUS ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0 ,
	TTE_Diag    = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 1 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_Ptrap_Sect_text_end ,
	compressimage ,
	}
	ta	HP_BAD_TRAP	/* 0x0 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa */
.align 32
	ta	HP_BAD_TRAP	/* 0xb */
.align 32
	ta	HP_BAD_TRAP	/* 0xc */
.align 32
	ta	HP_BAD_TRAP	/* 0xd */
.align 32
	ta	HP_BAD_TRAP	/* 0xe */
.align 32
	ta	HP_BAD_TRAP	/* 0xf */
.align 32
	ta	HP_BAD_TRAP	/* 0x10 */
.align 32
	ta	HP_BAD_TRAP	/* 0x11 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17 */
.align 32
	ta	HP_BAD_TRAP	/* 0x18 */
.align 32
	ta	HP_BAD_TRAP	/* 0x19 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1a */
.align 32
	ta	HP_BAD_TRAP	/* 0x1b */
.align 32
	ta	HP_BAD_TRAP	/* 0x1c */
.align 32
	ta	HP_BAD_TRAP	/* 0x1d */
.align 32
	ta	HP_BAD_TRAP	/* 0x1e */
.align 32
	ta	HP_BAD_TRAP	/* 0x1f */
.align 32
	ta	HP_BAD_TRAP	/* 0x20 */
.align 32
	ta	HP_BAD_TRAP	/* 0x21 */
.align 32
	ta	HP_BAD_TRAP	/* 0x22 */
.align 32
	ta	HP_BAD_TRAP	/* 0x23 */
.align 32
	ta	HP_BAD_TRAP	/* 0x24 */
.align 32
	ta	HP_BAD_TRAP	/* 0x25 */
.align 32
	ta	HP_BAD_TRAP	/* 0x26 */
.align 32
	ta	HP_BAD_TRAP	/* 0x27 */
.align 32
	ta	HP_BAD_TRAP	/* 0x28 */
.align 32
	ta	HP_BAD_TRAP	/* 0x29 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2a */
.align 32
	ta	HP_BAD_TRAP	/* 0x2b */
.align 32
	ta	HP_BAD_TRAP	/* 0x2c */
.align 32
	ta	HP_BAD_TRAP	/* 0x2d */
.align 32
	ta	HP_BAD_TRAP	/* 0x2e */
.align 32
	ta	HP_BAD_TRAP	/* 0x2f */
.align 32
	ta	HP_BAD_TRAP	/* 0x30 */
.align 32
	ta	HP_BAD_TRAP	/* 0x31 */
.align 32
	ta	HP_BAD_TRAP	/* 0x32 */
.align 32
	ta	HP_BAD_TRAP	/* 0x33 */
.align 32
	ta	HP_BAD_TRAP	/* 0x34 */
.align 32
	ta	HP_BAD_TRAP	/* 0x35 */
.align 32
	ta	HP_BAD_TRAP	/* 0x36 */
.align 32
	ta	HP_BAD_TRAP	/* 0x37 */
.align 32
	ta	HP_BAD_TRAP	/* 0x38 */
.align 32
	ta	HP_BAD_TRAP	/* 0x39 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3a */
.align 32
	ta	HP_BAD_TRAP	/* 0x3b */
.align 32
	ta	HP_BAD_TRAP	/* 0x3c */
.align 32
	ta	HP_BAD_TRAP	/* 0x3d */
.align 32
	ta	HP_BAD_TRAP	/* 0x3e */
.align 32
	ta	HP_BAD_TRAP	/* 0x3f */
.align 32
	ta	HP_BAD_TRAP	/* 0x40 */
.align 32
	ta	HP_BAD_TRAP	/* 0x41 */
.align 32
	ta	HP_BAD_TRAP	/* 0x42 */
.align 32
	ta	HP_BAD_TRAP	/* 0x43 */
.align 32
	ta	HP_BAD_TRAP	/* 0x44 */
.align 32
	ta	HP_BAD_TRAP	/* 0x45 */
.align 32
	ta	HP_BAD_TRAP	/* 0x46 */
.align 32
	ta	HP_BAD_TRAP	/* 0x47 */
.align 32
	ta	HP_BAD_TRAP	/* 0x48 */
.align 32
	ta	HP_BAD_TRAP	/* 0x49 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4a */
.align 32
	ta	HP_BAD_TRAP	/* 0x4b */
.align 32
	ta	HP_BAD_TRAP	/* 0x4c */
.align 32
	ta	HP_BAD_TRAP	/* 0x4d */
.align 32
	ta	HP_BAD_TRAP	/* 0x4e */
.align 32
	ta	HP_BAD_TRAP	/* 0x4f */
.align 32
	ta	HP_BAD_TRAP	/* 0x50 */
.align 32
	ta	HP_BAD_TRAP	/* 0x51 */
.align 32
	ta	HP_BAD_TRAP	/* 0x52 */
.align 32
	ta	HP_BAD_TRAP	/* 0x53 */
.align 32
	ta	HP_BAD_TRAP	/* 0x54 */
.align 32
	ta	HP_BAD_TRAP	/* 0x55 */
.align 32
	ta	HP_BAD_TRAP	/* 0x56 */
.align 32
	ta	HP_BAD_TRAP	/* 0x57 */
.align 32
	ta	HP_BAD_TRAP	/* 0x58 */
.align 32
	ta	HP_BAD_TRAP	/* 0x59 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5a */
.align 32
	ta	HP_BAD_TRAP	/* 0x5b */
.align 32
	ta	HP_BAD_TRAP	/* 0x5c */
.align 32
	ta	HP_BAD_TRAP	/* 0x5d */
.align 32
	ta	HP_BAD_TRAP	/* 0x5e */
.align 32
	ta	HP_BAD_TRAP	/* 0x5f */
.align 32
	ta	HP_BAD_TRAP	/* 0x60 */
.align 32
	ta	HP_BAD_TRAP	/* 0x61 */
.align 32
	ta	HP_BAD_TRAP	/* 0x62 */
.align 32
	ta	HP_BAD_TRAP	/* 0x63 */
.align 32
	ta	HP_BAD_TRAP	/* 0x64 */
.align 32
	ta	HP_BAD_TRAP	/* 0x65 */
.align 32
	ta	HP_BAD_TRAP	/* 0x66 */
.align 32
	ta	HP_BAD_TRAP	/* 0x67 */
.align 32
	ta	HP_BAD_TRAP	/* 0x68 */
.align 32
	ta	HP_BAD_TRAP	/* 0x69 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6a */
.align 32
	ta	HP_BAD_TRAP	/* 0x6b */
.align 32
	ta	HP_BAD_TRAP	/* 0x6c */
.align 32
	ta	HP_BAD_TRAP	/* 0x6d */
.align 32
	ta	HP_BAD_TRAP	/* 0x6e */
.align 32
	ta	HP_BAD_TRAP	/* 0x6f */
.align 32
	ta	HP_BAD_TRAP	/* 0x70 */
.align 32
	ta	HP_BAD_TRAP	/* 0x71 */
.align 32
	ta	HP_BAD_TRAP	/* 0x72 */
.align 32
	ta	HP_BAD_TRAP	/* 0x73 */
.align 32
	ta	HP_BAD_TRAP	/* 0x74 */
.align 32
	ta	HP_BAD_TRAP	/* 0x75 */
.align 32
	ta	HP_BAD_TRAP	/* 0x76 */
.align 32
	ta	HP_BAD_TRAP	/* 0x77 */
.align 32
	ta	HP_BAD_TRAP	/* 0x78 */
.align 32
	ta	HP_BAD_TRAP	/* 0x79 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7a */
.align 32
	ta	HP_BAD_TRAP	/* 0x7b */
.align 32
	ta	HP_BAD_TRAP	/* 0x7c */
.align 32
	ta	HP_BAD_TRAP	/* 0x7d */
.align 32
	ta	HP_BAD_TRAP	/* 0x7e */
.align 32
	ta	HP_BAD_TRAP	/* 0x7f */
.align 32
	ta	HP_BAD_TRAP	/* 0x80 */
.align 32
	ta	HP_BAD_TRAP	/* 0x81 */
.align 32
	ta	HP_BAD_TRAP	/* 0x82 */
.align 32
	ta	HP_BAD_TRAP	/* 0x83 */
.align 32
	ta	HP_BAD_TRAP	/* 0x84 */
.align 32
	ta	HP_BAD_TRAP	/* 0x85 */
.align 32
	ta	HP_BAD_TRAP	/* 0x86 */
.align 32
	ta	HP_BAD_TRAP	/* 0x87 */
.align 32
	ta	HP_BAD_TRAP	/* 0x88 */
.align 32
	ta	HP_BAD_TRAP	/* 0x89 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8a */
.align 32
	ta	HP_BAD_TRAP	/* 0x8b */
.align 32
	ta	HP_BAD_TRAP	/* 0x8c */
.align 32
	ta	HP_BAD_TRAP	/* 0x8d */
.align 32
	ta	HP_BAD_TRAP	/* 0x8e */
.align 32
	ta	HP_BAD_TRAP	/* 0x8f */
.align 32
	ta	HP_BAD_TRAP	/* 0x90 */
.align 32
	ta	HP_BAD_TRAP	/* 0x91 */
.align 32
	ta	HP_BAD_TRAP	/* 0x92 */
.align 32
	ta	HP_BAD_TRAP	/* 0x93 */
.align 32
	ta	HP_BAD_TRAP	/* 0x94 */
.align 32
	ta	HP_BAD_TRAP	/* 0x95 */
.align 32
	ta	HP_BAD_TRAP	/* 0x96 */
.align 32
	ta	HP_BAD_TRAP	/* 0x97 */
.align 32
	ta	HP_BAD_TRAP	/* 0x98 */
.align 32
	ta	HP_BAD_TRAP	/* 0x99 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9a */
.align 32
	ta	HP_BAD_TRAP	/* 0x9b */
.align 32
	ta	HP_BAD_TRAP	/* 0x9c */
.align 32
	ta	HP_BAD_TRAP	/* 0x9d */
.align 32
	ta	HP_BAD_TRAP	/* 0x9e */
.align 32
	ta	HP_BAD_TRAP	/* 0x9f */
.align 32
	ta	HP_BAD_TRAP	/* 0xa0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xaa */
.align 32
	ta	HP_BAD_TRAP	/* 0xab */
.align 32
	ta	HP_BAD_TRAP	/* 0xac */
.align 32
	ta	HP_BAD_TRAP	/* 0xad */
.align 32
	ta	HP_BAD_TRAP	/* 0xae */
.align 32
	ta	HP_BAD_TRAP	/* 0xaf */
.align 32
	ta	HP_BAD_TRAP	/* 0xb0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xba */
.align 32
	ta	HP_BAD_TRAP	/* 0xbb */
.align 32
	ta	HP_BAD_TRAP	/* 0xbc */
.align 32
	ta	HP_BAD_TRAP	/* 0xbd */
.align 32
	ta	HP_BAD_TRAP	/* 0xbe */
.align 32
	ta	HP_BAD_TRAP	/* 0xbf */
.align 32
	ta	HP_BAD_TRAP	/* 0xc0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xca */
.align 32
	ta	HP_BAD_TRAP	/* 0xcb */
.align 32
	ta	HP_BAD_TRAP	/* 0xcc */
.align 32
	ta	HP_BAD_TRAP	/* 0xcd */
.align 32
	ta	HP_BAD_TRAP	/* 0xce */
.align 32
	ta	HP_BAD_TRAP	/* 0xcf */
.align 32
	ta	HP_BAD_TRAP	/* 0xd0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xda */
.align 32
	ta	HP_BAD_TRAP	/* 0xdb */
.align 32
	ta	HP_BAD_TRAP	/* 0xdc */
.align 32
	ta	HP_BAD_TRAP	/* 0xdd */
.align 32
	ta	HP_BAD_TRAP	/* 0xde */
.align 32
	ta	HP_BAD_TRAP	/* 0xdf */
.align 32
	ta	HP_BAD_TRAP	/* 0xe0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xea */
.align 32
	ta	HP_BAD_TRAP	/* 0xeb */
.align 32
	ta	HP_BAD_TRAP	/* 0xec */
.align 32
	ta	HP_BAD_TRAP	/* 0xed */
.align 32
	ta	HP_BAD_TRAP	/* 0xee */
.align 32
	ta	HP_BAD_TRAP	/* 0xef */
.align 32
	ta	HP_BAD_TRAP	/* 0xf0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xfa */
.align 32
	ta	HP_BAD_TRAP	/* 0xfb */
.align 32
	ta	HP_BAD_TRAP	/* 0xfc */
.align 32
	ta	HP_BAD_TRAP	/* 0xfd */
.align 32
	ta	HP_BAD_TRAP	/* 0xfe */
.align 32
	ta	HP_BAD_TRAP	/* 0xff */
.align 32
	ta	HP_GOOD_TRAP		/* 0x100 */
.align 32
	ta	HP_BAD_TRAP	/* 0x101 */
.align 32
	ta	HP_BAD_TRAP	/* 0x102 */
.align 32
	ta	HP_BAD_TRAP	/* 0x103 */
.align 32
	ta	HP_BAD_TRAP	/* 0x104 */
.align 32
	ta	HP_BAD_TRAP	/* 0x105 */
.align 32
	ta	HP_BAD_TRAP	/* 0x106 */
.align 32
	ta	HP_BAD_TRAP	/* 0x107 */
.align 32
	ta	HP_BAD_TRAP	/* 0x108 */
.align 32
	ta	HP_BAD_TRAP	/* 0x109 */
.align 32
	ta	HP_BAD_TRAP	/* 0x10a */
.align 32
	ta	HP_BAD_TRAP	/* 0x10b */
.align 32
	ta	HP_BAD_TRAP	/* 0x10c */
.align 32
	ta	HP_BAD_TRAP	/* 0x10d */
.align 32
	ta	HP_BAD_TRAP	/* 0x10e */
.align 32
	ta	HP_BAD_TRAP	/* 0x10f */
.align 32
	ta	HPTRAP_I_DEMAP_ALL	/* 0x110 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PCTX	/* 0x111 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_SCTX	/* 0x112 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_NCTX	/* 0x113 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PAGE	/* 0x114 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_RPAGE	/* 0x115 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_REAL 	/* 0x116 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_ALL	/* 0x117 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PCTX	/* 0x118 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_SCTX	/* 0x119 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_NCTX	/* 0x11a */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PAGE	/* 0x11b */
	done
.align 32
	ta	HPTRAP_D_DEMAP_RPAGE	/* 0x11c */
	done
.align 32
	ta	HPTRAP_D_DEMAP_REAL     /* 0x11d */
	done
.align 32
	ta	HP_BAD_TRAP	/* 0x11e */
.align 32
	ta	HP_BAD_TRAP	/* 0x11f */
.align 32
	sllx	%i7, 63, %g1
	brz	%g1, 1f
	nop
	rdpr	%tnpc, %g2
	add	%g2, 8, %g2
	wrpr	%g2, %tnpc
1:	
	done
.align 32
	ta	HPTRAP_CHANGE_PID	/* 0x121 */
.align 32
	ta	HP_BAD_TRAP	/* 0x122 */
.align 32
	ta	HP_BAD_TRAP	/* 0x123 */
.align 32
	ta	HP_BAD_TRAP	/* 0x124 */
.align 32
	ta	HP_BAD_TRAP	/* 0x125 */
.align 32
	ta	HP_BAD_TRAP	/* 0x126 */
.align 32
	ta	HP_BAD_TRAP	/* 0x127 */
.align 32
	ta	HP_BAD_TRAP	/* 0x128 */
.align 32
	ta	HP_BAD_TRAP	/* 0x129 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12a */
.align 32
	ta	HP_BAD_TRAP	/* 0x12b */
.align 32
	ta	HP_BAD_TRAP	/* 0x12c */
.align 32
	ta	HP_BAD_TRAP	/* 0x12d */
.align 32
	ta	HP_BAD_TRAP	/* 0x12e */
.align 32
	ta	HP_BAD_TRAP	/* 0x12f */
.align 32
	ta	HP_BAD_TRAP	/* 0x130 */
.align 32
	ta	HP_BAD_TRAP	/* 0x131 */
.align 32
	ta	HP_BAD_TRAP	/* 0x132 */
.align 32
	ta	HP_BAD_TRAP	/* 0x133 */
.align 32
	ta	HP_BAD_TRAP	/* 0x134 */
.align 32
	ta	HP_BAD_TRAP	/* 0x135 */
.align 32
	ta	HP_BAD_TRAP	/* 0x136 */
.align 32
	ta	HP_BAD_TRAP	/* 0x137 */
.align 32
	ta	HP_BAD_TRAP	/* 0x138 */
.align 32
	ta	HP_BAD_TRAP	/* 0x139 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13a */
.align 32
	ta	HP_BAD_TRAP	/* 0x13b */
.align 32
	ta	HP_BAD_TRAP	/* 0x13c */
.align 32
	ta	HP_BAD_TRAP	/* 0x13d */
.align 32
	ta	HP_BAD_TRAP	/* 0x13e */
.align 32
	ta	HP_BAD_TRAP	/* 0x13f */
.align 32
	ta	HP_BAD_TRAP	/* 0x140 */
.align 32
	ta	HP_BAD_TRAP	/* 0x141 */
.align 32
	ta	HP_BAD_TRAP	/* 0x142 */
.align 32
	ta	HP_BAD_TRAP	/* 0x143 */
.align 32
	ta	HP_BAD_TRAP	/* 0x144 */
.align 32
	ta	HP_BAD_TRAP	/* 0x145 */
.align 32
	ta	HP_BAD_TRAP	/* 0x146 */
.align 32
	ta	HP_BAD_TRAP	/* 0x147 */
.align 32
	ta	HP_BAD_TRAP	/* 0x148 */
.align 32
	ta	HP_BAD_TRAP	/* 0x149 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14a */
.align 32
	ta	HP_BAD_TRAP	/* 0x14b */
.align 32
	ta	HP_BAD_TRAP	/* 0x14c */
.align 32
	ta	HP_BAD_TRAP	/* 0x14d */
.align 32
	ta	HP_BAD_TRAP	/* 0x14e */
.align 32
	ta	HP_BAD_TRAP	/* 0x14f */
.align 32
	ta	HP_BAD_TRAP	/* 0x150 */
.align 32
	ta	HP_BAD_TRAP	/* 0x151 */
.align 32
	ta	HP_BAD_TRAP	/* 0x152 */
.align 32
	ta	HP_BAD_TRAP	/* 0x153 */
.align 32
	ta	HP_BAD_TRAP	/* 0x154 */
.align 32
	ta	HP_BAD_TRAP	/* 0x155 */
.align 32
	ta	HP_BAD_TRAP	/* 0x156 */
.align 32
	ta	HP_BAD_TRAP	/* 0x157 */
.align 32
	ta	HP_BAD_TRAP	/* 0x158 */
.align 32
	ta	HP_BAD_TRAP	/* 0x159 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15a */
.align 32
	ta	HP_BAD_TRAP	/* 0x15b */
.align 32
	ta	HP_BAD_TRAP	/* 0x15c */
.align 32
	ta	HP_BAD_TRAP	/* 0x15d */
.align 32
	ta	HP_BAD_TRAP	/* 0x15e */
.align 32
	ta	HP_BAD_TRAP	/* 0x15f */
.align 32
	ta	HP_BAD_TRAP	/* 0x160 */
.align 32
	ta	HP_BAD_TRAP	/* 0x161 */
.align 32
	ta	HP_BAD_TRAP	/* 0x162 */
.align 32
	ta	HP_BAD_TRAP	/* 0x163 */
.align 32
	ta	HP_BAD_TRAP	/* 0x164 */
.align 32
	ta	HP_BAD_TRAP	/* 0x165 */
.align 32
	ta	HP_BAD_TRAP	/* 0x166 */
.align 32
	ta	HP_BAD_TRAP	/* 0x167 */
.align 32
	ta	HP_BAD_TRAP	/* 0x168 */
.align 32
	ta	HP_BAD_TRAP	/* 0x169 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16a */
.align 32
	ta	HP_BAD_TRAP	/* 0x16b */
.align 32
	ta	HP_BAD_TRAP	/* 0x16c */
.align 32
	ta	HP_BAD_TRAP	/* 0x16d */
.align 32
	ta	HP_BAD_TRAP	/* 0x16e */
.align 32
	ta	HP_BAD_TRAP	/* 0x16f */
.align 32
	ta	HP_BAD_TRAP	/* 0x170 */
.align 32
	ta	HP_BAD_TRAP	/* 0x171 */
.align 32
	ta	HP_BAD_TRAP	/* 0x172 */
.align 32
	ta	HP_BAD_TRAP	/* 0x173 */
.align 32
	ta	HP_BAD_TRAP	/* 0x174 */
.align 32
	ta	HP_BAD_TRAP	/* 0x175 */
.align 32
	ta	HP_BAD_TRAP	/* 0x176 */
.align 32
	ta	HP_BAD_TRAP	/* 0x177 */
.align 32
	ta	HP_BAD_TRAP	/* 0x178 */
.align 32
	ta	HP_BAD_TRAP	/* 0x179 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17a */
.align 32
	ta	HP_BAD_TRAP	/* 0x17b */
.align 32
	ta	HP_BAD_TRAP	/* 0x17c */
.align 32
	ta	HP_BAD_TRAP	/* 0x17d */
.align 32
	ta	HP_BAD_TRAP	/* 0x17e */
.align 32
	ta	HP_BAD_TRAP	/* 0x17f */
.align 32
Thr5_Ptrap_Sect_text_end:
/*********************************************************************/
SECTION .Thr6_Ptrap_Sect TEXT_VA=THR6_PTRAP_TEXT_VA
attr_text {
	Name = .Thr6_Ptrap_Sect ,
	thr6_z_ctx_tsb_2
	VA = THR6_PTRAP_TEXT_VA ,
	RA = THR6_PTRAP_TEXT_RA ,
	PA = THR6_PTRAP_TEXT_PA ,
	TTE_Context = NUCLEUS ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0 ,
	TTE_Diag    = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 1 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_Ptrap_Sect_text_end ,
	compressimage ,
	}
	ta	HP_BAD_TRAP	/* 0x0 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa */
.align 32
	ta	HP_BAD_TRAP	/* 0xb */
.align 32
	ta	HP_BAD_TRAP	/* 0xc */
.align 32
	ta	HP_BAD_TRAP	/* 0xd */
.align 32
	ta	HP_BAD_TRAP	/* 0xe */
.align 32
	ta	HP_BAD_TRAP	/* 0xf */
.align 32
	ta	HP_BAD_TRAP	/* 0x10 */
.align 32
	ta	HP_BAD_TRAP	/* 0x11 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17 */
.align 32
	ta	HP_BAD_TRAP	/* 0x18 */
.align 32
	ta	HP_BAD_TRAP	/* 0x19 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1a */
.align 32
	ta	HP_BAD_TRAP	/* 0x1b */
.align 32
	ta	HP_BAD_TRAP	/* 0x1c */
.align 32
	ta	HP_BAD_TRAP	/* 0x1d */
.align 32
	ta	HP_BAD_TRAP	/* 0x1e */
.align 32
	ta	HP_BAD_TRAP	/* 0x1f */
.align 32
	ta	HP_BAD_TRAP	/* 0x20 */
.align 32
	ta	HP_BAD_TRAP	/* 0x21 */
.align 32
	ta	HP_BAD_TRAP	/* 0x22 */
.align 32
	ta	HP_BAD_TRAP	/* 0x23 */
.align 32
	ta	HP_BAD_TRAP	/* 0x24 */
.align 32
	ta	HP_BAD_TRAP	/* 0x25 */
.align 32
	ta	HP_BAD_TRAP	/* 0x26 */
.align 32
	ta	HP_BAD_TRAP	/* 0x27 */
.align 32
	ta	HP_BAD_TRAP	/* 0x28 */
.align 32
	ta	HP_BAD_TRAP	/* 0x29 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2a */
.align 32
	ta	HP_BAD_TRAP	/* 0x2b */
.align 32
	ta	HP_BAD_TRAP	/* 0x2c */
.align 32
	ta	HP_BAD_TRAP	/* 0x2d */
.align 32
	ta	HP_BAD_TRAP	/* 0x2e */
.align 32
	ta	HP_BAD_TRAP	/* 0x2f */
.align 32
	ta	HP_BAD_TRAP	/* 0x30 */
.align 32
	ta	HP_BAD_TRAP	/* 0x31 */
.align 32
	ta	HP_BAD_TRAP	/* 0x32 */
.align 32
	ta	HP_BAD_TRAP	/* 0x33 */
.align 32
	ta	HP_BAD_TRAP	/* 0x34 */
.align 32
	ta	HP_BAD_TRAP	/* 0x35 */
.align 32
	ta	HP_BAD_TRAP	/* 0x36 */
.align 32
	ta	HP_BAD_TRAP	/* 0x37 */
.align 32
	ta	HP_BAD_TRAP	/* 0x38 */
.align 32
	ta	HP_BAD_TRAP	/* 0x39 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3a */
.align 32
	ta	HP_BAD_TRAP	/* 0x3b */
.align 32
	ta	HP_BAD_TRAP	/* 0x3c */
.align 32
	ta	HP_BAD_TRAP	/* 0x3d */
.align 32
	ta	HP_BAD_TRAP	/* 0x3e */
.align 32
	ta	HP_BAD_TRAP	/* 0x3f */
.align 32
	ta	HP_BAD_TRAP	/* 0x40 */
.align 32
	ta	HP_BAD_TRAP	/* 0x41 */
.align 32
	ta	HP_BAD_TRAP	/* 0x42 */
.align 32
	ta	HP_BAD_TRAP	/* 0x43 */
.align 32
	ta	HP_BAD_TRAP	/* 0x44 */
.align 32
	ta	HP_BAD_TRAP	/* 0x45 */
.align 32
	ta	HP_BAD_TRAP	/* 0x46 */
.align 32
	ta	HP_BAD_TRAP	/* 0x47 */
.align 32
	ta	HP_BAD_TRAP	/* 0x48 */
.align 32
	ta	HP_BAD_TRAP	/* 0x49 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4a */
.align 32
	ta	HP_BAD_TRAP	/* 0x4b */
.align 32
	ta	HP_BAD_TRAP	/* 0x4c */
.align 32
	ta	HP_BAD_TRAP	/* 0x4d */
.align 32
	ta	HP_BAD_TRAP	/* 0x4e */
.align 32
	ta	HP_BAD_TRAP	/* 0x4f */
.align 32
	ta	HP_BAD_TRAP	/* 0x50 */
.align 32
	ta	HP_BAD_TRAP	/* 0x51 */
.align 32
	ta	HP_BAD_TRAP	/* 0x52 */
.align 32
	ta	HP_BAD_TRAP	/* 0x53 */
.align 32
	ta	HP_BAD_TRAP	/* 0x54 */
.align 32
	ta	HP_BAD_TRAP	/* 0x55 */
.align 32
	ta	HP_BAD_TRAP	/* 0x56 */
.align 32
	ta	HP_BAD_TRAP	/* 0x57 */
.align 32
	ta	HP_BAD_TRAP	/* 0x58 */
.align 32
	ta	HP_BAD_TRAP	/* 0x59 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5a */
.align 32
	ta	HP_BAD_TRAP	/* 0x5b */
.align 32
	ta	HP_BAD_TRAP	/* 0x5c */
.align 32
	ta	HP_BAD_TRAP	/* 0x5d */
.align 32
	ta	HP_BAD_TRAP	/* 0x5e */
.align 32
	ta	HP_BAD_TRAP	/* 0x5f */
.align 32
	ta	HP_BAD_TRAP	/* 0x60 */
.align 32
	ta	HP_BAD_TRAP	/* 0x61 */
.align 32
	ta	HP_BAD_TRAP	/* 0x62 */
.align 32
	ta	HP_BAD_TRAP	/* 0x63 */
.align 32
	ta	HP_BAD_TRAP	/* 0x64 */
.align 32
	ta	HP_BAD_TRAP	/* 0x65 */
.align 32
	ta	HP_BAD_TRAP	/* 0x66 */
.align 32
	ta	HP_BAD_TRAP	/* 0x67 */
.align 32
	ta	HP_BAD_TRAP	/* 0x68 */
.align 32
	ta	HP_BAD_TRAP	/* 0x69 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6a */
.align 32
	ta	HP_BAD_TRAP	/* 0x6b */
.align 32
	ta	HP_BAD_TRAP	/* 0x6c */
.align 32
	ta	HP_BAD_TRAP	/* 0x6d */
.align 32
	ta	HP_BAD_TRAP	/* 0x6e */
.align 32
	ta	HP_BAD_TRAP	/* 0x6f */
.align 32
	ta	HP_BAD_TRAP	/* 0x70 */
.align 32
	ta	HP_BAD_TRAP	/* 0x71 */
.align 32
	ta	HP_BAD_TRAP	/* 0x72 */
.align 32
	ta	HP_BAD_TRAP	/* 0x73 */
.align 32
	ta	HP_BAD_TRAP	/* 0x74 */
.align 32
	ta	HP_BAD_TRAP	/* 0x75 */
.align 32
	ta	HP_BAD_TRAP	/* 0x76 */
.align 32
	ta	HP_BAD_TRAP	/* 0x77 */
.align 32
	ta	HP_BAD_TRAP	/* 0x78 */
.align 32
	ta	HP_BAD_TRAP	/* 0x79 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7a */
.align 32
	ta	HP_BAD_TRAP	/* 0x7b */
.align 32
	ta	HP_BAD_TRAP	/* 0x7c */
.align 32
	ta	HP_BAD_TRAP	/* 0x7d */
.align 32
	ta	HP_BAD_TRAP	/* 0x7e */
.align 32
	ta	HP_BAD_TRAP	/* 0x7f */
.align 32
	ta	HP_BAD_TRAP	/* 0x80 */
.align 32
	ta	HP_BAD_TRAP	/* 0x81 */
.align 32
	ta	HP_BAD_TRAP	/* 0x82 */
.align 32
	ta	HP_BAD_TRAP	/* 0x83 */
.align 32
	ta	HP_BAD_TRAP	/* 0x84 */
.align 32
	ta	HP_BAD_TRAP	/* 0x85 */
.align 32
	ta	HP_BAD_TRAP	/* 0x86 */
.align 32
	ta	HP_BAD_TRAP	/* 0x87 */
.align 32
	ta	HP_BAD_TRAP	/* 0x88 */
.align 32
	ta	HP_BAD_TRAP	/* 0x89 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8a */
.align 32
	ta	HP_BAD_TRAP	/* 0x8b */
.align 32
	ta	HP_BAD_TRAP	/* 0x8c */
.align 32
	ta	HP_BAD_TRAP	/* 0x8d */
.align 32
	ta	HP_BAD_TRAP	/* 0x8e */
.align 32
	ta	HP_BAD_TRAP	/* 0x8f */
.align 32
	ta	HP_BAD_TRAP	/* 0x90 */
.align 32
	ta	HP_BAD_TRAP	/* 0x91 */
.align 32
	ta	HP_BAD_TRAP	/* 0x92 */
.align 32
	ta	HP_BAD_TRAP	/* 0x93 */
.align 32
	ta	HP_BAD_TRAP	/* 0x94 */
.align 32
	ta	HP_BAD_TRAP	/* 0x95 */
.align 32
	ta	HP_BAD_TRAP	/* 0x96 */
.align 32
	ta	HP_BAD_TRAP	/* 0x97 */
.align 32
	ta	HP_BAD_TRAP	/* 0x98 */
.align 32
	ta	HP_BAD_TRAP	/* 0x99 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9a */
.align 32
	ta	HP_BAD_TRAP	/* 0x9b */
.align 32
	ta	HP_BAD_TRAP	/* 0x9c */
.align 32
	ta	HP_BAD_TRAP	/* 0x9d */
.align 32
	ta	HP_BAD_TRAP	/* 0x9e */
.align 32
	ta	HP_BAD_TRAP	/* 0x9f */
.align 32
	ta	HP_BAD_TRAP	/* 0xa0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xaa */
.align 32
	ta	HP_BAD_TRAP	/* 0xab */
.align 32
	ta	HP_BAD_TRAP	/* 0xac */
.align 32
	ta	HP_BAD_TRAP	/* 0xad */
.align 32
	ta	HP_BAD_TRAP	/* 0xae */
.align 32
	ta	HP_BAD_TRAP	/* 0xaf */
.align 32
	ta	HP_BAD_TRAP	/* 0xb0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xba */
.align 32
	ta	HP_BAD_TRAP	/* 0xbb */
.align 32
	ta	HP_BAD_TRAP	/* 0xbc */
.align 32
	ta	HP_BAD_TRAP	/* 0xbd */
.align 32
	ta	HP_BAD_TRAP	/* 0xbe */
.align 32
	ta	HP_BAD_TRAP	/* 0xbf */
.align 32
	ta	HP_BAD_TRAP	/* 0xc0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xca */
.align 32
	ta	HP_BAD_TRAP	/* 0xcb */
.align 32
	ta	HP_BAD_TRAP	/* 0xcc */
.align 32
	ta	HP_BAD_TRAP	/* 0xcd */
.align 32
	ta	HP_BAD_TRAP	/* 0xce */
.align 32
	ta	HP_BAD_TRAP	/* 0xcf */
.align 32
	ta	HP_BAD_TRAP	/* 0xd0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xda */
.align 32
	ta	HP_BAD_TRAP	/* 0xdb */
.align 32
	ta	HP_BAD_TRAP	/* 0xdc */
.align 32
	ta	HP_BAD_TRAP	/* 0xdd */
.align 32
	ta	HP_BAD_TRAP	/* 0xde */
.align 32
	ta	HP_BAD_TRAP	/* 0xdf */
.align 32
	ta	HP_BAD_TRAP	/* 0xe0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xea */
.align 32
	ta	HP_BAD_TRAP	/* 0xeb */
.align 32
	ta	HP_BAD_TRAP	/* 0xec */
.align 32
	ta	HP_BAD_TRAP	/* 0xed */
.align 32
	ta	HP_BAD_TRAP	/* 0xee */
.align 32
	ta	HP_BAD_TRAP	/* 0xef */
.align 32
	ta	HP_BAD_TRAP	/* 0xf0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xfa */
.align 32
	ta	HP_BAD_TRAP	/* 0xfb */
.align 32
	ta	HP_BAD_TRAP	/* 0xfc */
.align 32
	ta	HP_BAD_TRAP	/* 0xfd */
.align 32
	ta	HP_BAD_TRAP	/* 0xfe */
.align 32
	ta	HP_BAD_TRAP	/* 0xff */
.align 32
	ta	HP_GOOD_TRAP		/* 0x100 */
.align 32
	ta	HP_BAD_TRAP	/* 0x101 */
.align 32
	ta	HP_BAD_TRAP	/* 0x102 */
.align 32
	ta	HP_BAD_TRAP	/* 0x103 */
.align 32
	ta	HP_BAD_TRAP	/* 0x104 */
.align 32
	ta	HP_BAD_TRAP	/* 0x105 */
.align 32
	ta	HP_BAD_TRAP	/* 0x106 */
.align 32
	ta	HP_BAD_TRAP	/* 0x107 */
.align 32
	ta	HP_BAD_TRAP	/* 0x108 */
.align 32
	ta	HP_BAD_TRAP	/* 0x109 */
.align 32
	ta	HP_BAD_TRAP	/* 0x10a */
.align 32
	ta	HP_BAD_TRAP	/* 0x10b */
.align 32
	ta	HP_BAD_TRAP	/* 0x10c */
.align 32
	ta	HP_BAD_TRAP	/* 0x10d */
.align 32
	ta	HP_BAD_TRAP	/* 0x10e */
.align 32
	ta	HP_BAD_TRAP	/* 0x10f */
.align 32
	ta	HPTRAP_I_DEMAP_ALL	/* 0x110 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PCTX	/* 0x111 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_SCTX	/* 0x112 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_NCTX	/* 0x113 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PAGE	/* 0x114 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_RPAGE	/* 0x115 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_REAL 	/* 0x116 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_ALL	/* 0x117 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PCTX	/* 0x118 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_SCTX	/* 0x119 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_NCTX	/* 0x11a */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PAGE	/* 0x11b */
	done
.align 32
	ta	HPTRAP_D_DEMAP_RPAGE	/* 0x11c */
	done
.align 32
	ta	HPTRAP_D_DEMAP_REAL     /* 0x11d */
	done
.align 32
	ta	HP_BAD_TRAP	/* 0x11e */
.align 32
	ta	HP_BAD_TRAP	/* 0x11f */
.align 32
	sllx	%i7, 63, %g1
	brz	%g1, 1f
	nop
	rdpr	%tnpc, %g2
	add	%g2, 8, %g2
	wrpr	%g2, %tnpc
1:	
	done
.align 32
	ta	HPTRAP_CHANGE_PID	/* 0x121 */
.align 32
	ta	HP_BAD_TRAP	/* 0x122 */
.align 32
	ta	HP_BAD_TRAP	/* 0x123 */
.align 32
	ta	HP_BAD_TRAP	/* 0x124 */
.align 32
	ta	HP_BAD_TRAP	/* 0x125 */
.align 32
	ta	HP_BAD_TRAP	/* 0x126 */
.align 32
	ta	HP_BAD_TRAP	/* 0x127 */
.align 32
	ta	HP_BAD_TRAP	/* 0x128 */
.align 32
	ta	HP_BAD_TRAP	/* 0x129 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12a */
.align 32
	ta	HP_BAD_TRAP	/* 0x12b */
.align 32
	ta	HP_BAD_TRAP	/* 0x12c */
.align 32
	ta	HP_BAD_TRAP	/* 0x12d */
.align 32
	ta	HP_BAD_TRAP	/* 0x12e */
.align 32
	ta	HP_BAD_TRAP	/* 0x12f */
.align 32
	ta	HP_BAD_TRAP	/* 0x130 */
.align 32
	ta	HP_BAD_TRAP	/* 0x131 */
.align 32
	ta	HP_BAD_TRAP	/* 0x132 */
.align 32
	ta	HP_BAD_TRAP	/* 0x133 */
.align 32
	ta	HP_BAD_TRAP	/* 0x134 */
.align 32
	ta	HP_BAD_TRAP	/* 0x135 */
.align 32
	ta	HP_BAD_TRAP	/* 0x136 */
.align 32
	ta	HP_BAD_TRAP	/* 0x137 */
.align 32
	ta	HP_BAD_TRAP	/* 0x138 */
.align 32
	ta	HP_BAD_TRAP	/* 0x139 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13a */
.align 32
	ta	HP_BAD_TRAP	/* 0x13b */
.align 32
	ta	HP_BAD_TRAP	/* 0x13c */
.align 32
	ta	HP_BAD_TRAP	/* 0x13d */
.align 32
	ta	HP_BAD_TRAP	/* 0x13e */
.align 32
	ta	HP_BAD_TRAP	/* 0x13f */
.align 32
	ta	HP_BAD_TRAP	/* 0x140 */
.align 32
	ta	HP_BAD_TRAP	/* 0x141 */
.align 32
	ta	HP_BAD_TRAP	/* 0x142 */
.align 32
	ta	HP_BAD_TRAP	/* 0x143 */
.align 32
	ta	HP_BAD_TRAP	/* 0x144 */
.align 32
	ta	HP_BAD_TRAP	/* 0x145 */
.align 32
	ta	HP_BAD_TRAP	/* 0x146 */
.align 32
	ta	HP_BAD_TRAP	/* 0x147 */
.align 32
	ta	HP_BAD_TRAP	/* 0x148 */
.align 32
	ta	HP_BAD_TRAP	/* 0x149 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14a */
.align 32
	ta	HP_BAD_TRAP	/* 0x14b */
.align 32
	ta	HP_BAD_TRAP	/* 0x14c */
.align 32
	ta	HP_BAD_TRAP	/* 0x14d */
.align 32
	ta	HP_BAD_TRAP	/* 0x14e */
.align 32
	ta	HP_BAD_TRAP	/* 0x14f */
.align 32
	ta	HP_BAD_TRAP	/* 0x150 */
.align 32
	ta	HP_BAD_TRAP	/* 0x151 */
.align 32
	ta	HP_BAD_TRAP	/* 0x152 */
.align 32
	ta	HP_BAD_TRAP	/* 0x153 */
.align 32
	ta	HP_BAD_TRAP	/* 0x154 */
.align 32
	ta	HP_BAD_TRAP	/* 0x155 */
.align 32
	ta	HP_BAD_TRAP	/* 0x156 */
.align 32
	ta	HP_BAD_TRAP	/* 0x157 */
.align 32
	ta	HP_BAD_TRAP	/* 0x158 */
.align 32
	ta	HP_BAD_TRAP	/* 0x159 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15a */
.align 32
	ta	HP_BAD_TRAP	/* 0x15b */
.align 32
	ta	HP_BAD_TRAP	/* 0x15c */
.align 32
	ta	HP_BAD_TRAP	/* 0x15d */
.align 32
	ta	HP_BAD_TRAP	/* 0x15e */
.align 32
	ta	HP_BAD_TRAP	/* 0x15f */
.align 32
	ta	HP_BAD_TRAP	/* 0x160 */
.align 32
	ta	HP_BAD_TRAP	/* 0x161 */
.align 32
	ta	HP_BAD_TRAP	/* 0x162 */
.align 32
	ta	HP_BAD_TRAP	/* 0x163 */
.align 32
	ta	HP_BAD_TRAP	/* 0x164 */
.align 32
	ta	HP_BAD_TRAP	/* 0x165 */
.align 32
	ta	HP_BAD_TRAP	/* 0x166 */
.align 32
	ta	HP_BAD_TRAP	/* 0x167 */
.align 32
	ta	HP_BAD_TRAP	/* 0x168 */
.align 32
	ta	HP_BAD_TRAP	/* 0x169 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16a */
.align 32
	ta	HP_BAD_TRAP	/* 0x16b */
.align 32
	ta	HP_BAD_TRAP	/* 0x16c */
.align 32
	ta	HP_BAD_TRAP	/* 0x16d */
.align 32
	ta	HP_BAD_TRAP	/* 0x16e */
.align 32
	ta	HP_BAD_TRAP	/* 0x16f */
.align 32
	ta	HP_BAD_TRAP	/* 0x170 */
.align 32
	ta	HP_BAD_TRAP	/* 0x171 */
.align 32
	ta	HP_BAD_TRAP	/* 0x172 */
.align 32
	ta	HP_BAD_TRAP	/* 0x173 */
.align 32
	ta	HP_BAD_TRAP	/* 0x174 */
.align 32
	ta	HP_BAD_TRAP	/* 0x175 */
.align 32
	ta	HP_BAD_TRAP	/* 0x176 */
.align 32
	ta	HP_BAD_TRAP	/* 0x177 */
.align 32
	ta	HP_BAD_TRAP	/* 0x178 */
.align 32
	ta	HP_BAD_TRAP	/* 0x179 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17a */
.align 32
	ta	HP_BAD_TRAP	/* 0x17b */
.align 32
	ta	HP_BAD_TRAP	/* 0x17c */
.align 32
	ta	HP_BAD_TRAP	/* 0x17d */
.align 32
	ta	HP_BAD_TRAP	/* 0x17e */
.align 32
	ta	HP_BAD_TRAP	/* 0x17f */
.align 32
Thr6_Ptrap_Sect_text_end:
/*********************************************************************/
SECTION .Thr7_Ptrap_Sect TEXT_VA=THR7_PTRAP_TEXT_VA
attr_text {
	Name = .Thr7_Ptrap_Sect ,
	thr7_z_ctx_tsb_0
	VA = THR7_PTRAP_TEXT_VA ,
	RA = THR7_PTRAP_TEXT_RA ,
	PA = THR7_PTRAP_TEXT_PA ,
	TTE_Context = NUCLEUS ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr7_Ptrap_Sect_text_end ,
	compressimage ,
	}
	ta	HP_BAD_TRAP	/* 0x0 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa */
.align 32
	ta	HP_BAD_TRAP	/* 0xb */
.align 32
	ta	HP_BAD_TRAP	/* 0xc */
.align 32
	ta	HP_BAD_TRAP	/* 0xd */
.align 32
	ta	HP_BAD_TRAP	/* 0xe */
.align 32
	ta	HP_BAD_TRAP	/* 0xf */
.align 32
	ta	HP_BAD_TRAP	/* 0x10 */
.align 32
	ta	HP_BAD_TRAP	/* 0x11 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17 */
.align 32
	ta	HP_BAD_TRAP	/* 0x18 */
.align 32
	ta	HP_BAD_TRAP	/* 0x19 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1a */
.align 32
	ta	HP_BAD_TRAP	/* 0x1b */
.align 32
	ta	HP_BAD_TRAP	/* 0x1c */
.align 32
	ta	HP_BAD_TRAP	/* 0x1d */
.align 32
	ta	HP_BAD_TRAP	/* 0x1e */
.align 32
	ta	HP_BAD_TRAP	/* 0x1f */
.align 32
	ta	HP_BAD_TRAP	/* 0x20 */
.align 32
	ta	HP_BAD_TRAP	/* 0x21 */
.align 32
	ta	HP_BAD_TRAP	/* 0x22 */
.align 32
	ta	HP_BAD_TRAP	/* 0x23 */
.align 32
	ta	HP_BAD_TRAP	/* 0x24 */
.align 32
	ta	HP_BAD_TRAP	/* 0x25 */
.align 32
	ta	HP_BAD_TRAP	/* 0x26 */
.align 32
	ta	HP_BAD_TRAP	/* 0x27 */
.align 32
	ta	HP_BAD_TRAP	/* 0x28 */
.align 32
	ta	HP_BAD_TRAP	/* 0x29 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2a */
.align 32
	ta	HP_BAD_TRAP	/* 0x2b */
.align 32
	ta	HP_BAD_TRAP	/* 0x2c */
.align 32
	ta	HP_BAD_TRAP	/* 0x2d */
.align 32
	ta	HP_BAD_TRAP	/* 0x2e */
.align 32
	ta	HP_BAD_TRAP	/* 0x2f */
.align 32
	ta	HP_BAD_TRAP	/* 0x30 */
.align 32
	ta	HP_BAD_TRAP	/* 0x31 */
.align 32
	ta	HP_BAD_TRAP	/* 0x32 */
.align 32
	ta	HP_BAD_TRAP	/* 0x33 */
.align 32
	ta	HP_BAD_TRAP	/* 0x34 */
.align 32
	ta	HP_BAD_TRAP	/* 0x35 */
.align 32
	ta	HP_BAD_TRAP	/* 0x36 */
.align 32
	ta	HP_BAD_TRAP	/* 0x37 */
.align 32
	ta	HP_BAD_TRAP	/* 0x38 */
.align 32
	ta	HP_BAD_TRAP	/* 0x39 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3a */
.align 32
	ta	HP_BAD_TRAP	/* 0x3b */
.align 32
	ta	HP_BAD_TRAP	/* 0x3c */
.align 32
	ta	HP_BAD_TRAP	/* 0x3d */
.align 32
	ta	HP_BAD_TRAP	/* 0x3e */
.align 32
	ta	HP_BAD_TRAP	/* 0x3f */
.align 32
	ta	HP_BAD_TRAP	/* 0x40 */
.align 32
	ta	HP_BAD_TRAP	/* 0x41 */
.align 32
	ta	HP_BAD_TRAP	/* 0x42 */
.align 32
	ta	HP_BAD_TRAP	/* 0x43 */
.align 32
	ta	HP_BAD_TRAP	/* 0x44 */
.align 32
	ta	HP_BAD_TRAP	/* 0x45 */
.align 32
	ta	HP_BAD_TRAP	/* 0x46 */
.align 32
	ta	HP_BAD_TRAP	/* 0x47 */
.align 32
	ta	HP_BAD_TRAP	/* 0x48 */
.align 32
	ta	HP_BAD_TRAP	/* 0x49 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4a */
.align 32
	ta	HP_BAD_TRAP	/* 0x4b */
.align 32
	ta	HP_BAD_TRAP	/* 0x4c */
.align 32
	ta	HP_BAD_TRAP	/* 0x4d */
.align 32
	ta	HP_BAD_TRAP	/* 0x4e */
.align 32
	ta	HP_BAD_TRAP	/* 0x4f */
.align 32
	ta	HP_BAD_TRAP	/* 0x50 */
.align 32
	ta	HP_BAD_TRAP	/* 0x51 */
.align 32
	ta	HP_BAD_TRAP	/* 0x52 */
.align 32
	ta	HP_BAD_TRAP	/* 0x53 */
.align 32
	ta	HP_BAD_TRAP	/* 0x54 */
.align 32
	ta	HP_BAD_TRAP	/* 0x55 */
.align 32
	ta	HP_BAD_TRAP	/* 0x56 */
.align 32
	ta	HP_BAD_TRAP	/* 0x57 */
.align 32
	ta	HP_BAD_TRAP	/* 0x58 */
.align 32
	ta	HP_BAD_TRAP	/* 0x59 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5a */
.align 32
	ta	HP_BAD_TRAP	/* 0x5b */
.align 32
	ta	HP_BAD_TRAP	/* 0x5c */
.align 32
	ta	HP_BAD_TRAP	/* 0x5d */
.align 32
	ta	HP_BAD_TRAP	/* 0x5e */
.align 32
	ta	HP_BAD_TRAP	/* 0x5f */
.align 32
	ta	HP_BAD_TRAP	/* 0x60 */
.align 32
	ta	HP_BAD_TRAP	/* 0x61 */
.align 32
	ta	HP_BAD_TRAP	/* 0x62 */
.align 32
	ta	HP_BAD_TRAP	/* 0x63 */
.align 32
	ta	HP_BAD_TRAP	/* 0x64 */
.align 32
	ta	HP_BAD_TRAP	/* 0x65 */
.align 32
	ta	HP_BAD_TRAP	/* 0x66 */
.align 32
	ta	HP_BAD_TRAP	/* 0x67 */
.align 32
	ta	HP_BAD_TRAP	/* 0x68 */
.align 32
	ta	HP_BAD_TRAP	/* 0x69 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6a */
.align 32
	ta	HP_BAD_TRAP	/* 0x6b */
.align 32
	ta	HP_BAD_TRAP	/* 0x6c */
.align 32
	ta	HP_BAD_TRAP	/* 0x6d */
.align 32
	ta	HP_BAD_TRAP	/* 0x6e */
.align 32
	ta	HP_BAD_TRAP	/* 0x6f */
.align 32
	ta	HP_BAD_TRAP	/* 0x70 */
.align 32
	ta	HP_BAD_TRAP	/* 0x71 */
.align 32
	ta	HP_BAD_TRAP	/* 0x72 */
.align 32
	ta	HP_BAD_TRAP	/* 0x73 */
.align 32
	ta	HP_BAD_TRAP	/* 0x74 */
.align 32
	ta	HP_BAD_TRAP	/* 0x75 */
.align 32
	ta	HP_BAD_TRAP	/* 0x76 */
.align 32
	ta	HP_BAD_TRAP	/* 0x77 */
.align 32
	ta	HP_BAD_TRAP	/* 0x78 */
.align 32
	ta	HP_BAD_TRAP	/* 0x79 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7a */
.align 32
	ta	HP_BAD_TRAP	/* 0x7b */
.align 32
	ta	HP_BAD_TRAP	/* 0x7c */
.align 32
	ta	HP_BAD_TRAP	/* 0x7d */
.align 32
	ta	HP_BAD_TRAP	/* 0x7e */
.align 32
	ta	HP_BAD_TRAP	/* 0x7f */
.align 32
	ta	HP_BAD_TRAP	/* 0x80 */
.align 32
	ta	HP_BAD_TRAP	/* 0x81 */
.align 32
	ta	HP_BAD_TRAP	/* 0x82 */
.align 32
	ta	HP_BAD_TRAP	/* 0x83 */
.align 32
	ta	HP_BAD_TRAP	/* 0x84 */
.align 32
	ta	HP_BAD_TRAP	/* 0x85 */
.align 32
	ta	HP_BAD_TRAP	/* 0x86 */
.align 32
	ta	HP_BAD_TRAP	/* 0x87 */
.align 32
	ta	HP_BAD_TRAP	/* 0x88 */
.align 32
	ta	HP_BAD_TRAP	/* 0x89 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8a */
.align 32
	ta	HP_BAD_TRAP	/* 0x8b */
.align 32
	ta	HP_BAD_TRAP	/* 0x8c */
.align 32
	ta	HP_BAD_TRAP	/* 0x8d */
.align 32
	ta	HP_BAD_TRAP	/* 0x8e */
.align 32
	ta	HP_BAD_TRAP	/* 0x8f */
.align 32
	ta	HP_BAD_TRAP	/* 0x90 */
.align 32
	ta	HP_BAD_TRAP	/* 0x91 */
.align 32
	ta	HP_BAD_TRAP	/* 0x92 */
.align 32
	ta	HP_BAD_TRAP	/* 0x93 */
.align 32
	ta	HP_BAD_TRAP	/* 0x94 */
.align 32
	ta	HP_BAD_TRAP	/* 0x95 */
.align 32
	ta	HP_BAD_TRAP	/* 0x96 */
.align 32
	ta	HP_BAD_TRAP	/* 0x97 */
.align 32
	ta	HP_BAD_TRAP	/* 0x98 */
.align 32
	ta	HP_BAD_TRAP	/* 0x99 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9a */
.align 32
	ta	HP_BAD_TRAP	/* 0x9b */
.align 32
	ta	HP_BAD_TRAP	/* 0x9c */
.align 32
	ta	HP_BAD_TRAP	/* 0x9d */
.align 32
	ta	HP_BAD_TRAP	/* 0x9e */
.align 32
	ta	HP_BAD_TRAP	/* 0x9f */
.align 32
	ta	HP_BAD_TRAP	/* 0xa0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xaa */
.align 32
	ta	HP_BAD_TRAP	/* 0xab */
.align 32
	ta	HP_BAD_TRAP	/* 0xac */
.align 32
	ta	HP_BAD_TRAP	/* 0xad */
.align 32
	ta	HP_BAD_TRAP	/* 0xae */
.align 32
	ta	HP_BAD_TRAP	/* 0xaf */
.align 32
	ta	HP_BAD_TRAP	/* 0xb0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xba */
.align 32
	ta	HP_BAD_TRAP	/* 0xbb */
.align 32
	ta	HP_BAD_TRAP	/* 0xbc */
.align 32
	ta	HP_BAD_TRAP	/* 0xbd */
.align 32
	ta	HP_BAD_TRAP	/* 0xbe */
.align 32
	ta	HP_BAD_TRAP	/* 0xbf */
.align 32
	ta	HP_BAD_TRAP	/* 0xc0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xca */
.align 32
	ta	HP_BAD_TRAP	/* 0xcb */
.align 32
	ta	HP_BAD_TRAP	/* 0xcc */
.align 32
	ta	HP_BAD_TRAP	/* 0xcd */
.align 32
	ta	HP_BAD_TRAP	/* 0xce */
.align 32
	ta	HP_BAD_TRAP	/* 0xcf */
.align 32
	ta	HP_BAD_TRAP	/* 0xd0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xda */
.align 32
	ta	HP_BAD_TRAP	/* 0xdb */
.align 32
	ta	HP_BAD_TRAP	/* 0xdc */
.align 32
	ta	HP_BAD_TRAP	/* 0xdd */
.align 32
	ta	HP_BAD_TRAP	/* 0xde */
.align 32
	ta	HP_BAD_TRAP	/* 0xdf */
.align 32
	ta	HP_BAD_TRAP	/* 0xe0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xea */
.align 32
	ta	HP_BAD_TRAP	/* 0xeb */
.align 32
	ta	HP_BAD_TRAP	/* 0xec */
.align 32
	ta	HP_BAD_TRAP	/* 0xed */
.align 32
	ta	HP_BAD_TRAP	/* 0xee */
.align 32
	ta	HP_BAD_TRAP	/* 0xef */
.align 32
	ta	HP_BAD_TRAP	/* 0xf0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xfa */
.align 32
	ta	HP_BAD_TRAP	/* 0xfb */
.align 32
	ta	HP_BAD_TRAP	/* 0xfc */
.align 32
	ta	HP_BAD_TRAP	/* 0xfd */
.align 32
	ta	HP_BAD_TRAP	/* 0xfe */
.align 32
	ta	HP_BAD_TRAP	/* 0xff */
.align 32
	ta	HP_GOOD_TRAP		/* 0x100 */
.align 32
	ta	HP_BAD_TRAP	/* 0x101 */
.align 32
	ta	HP_BAD_TRAP	/* 0x102 */
.align 32
	ta	HP_BAD_TRAP	/* 0x103 */
.align 32
	ta	HP_BAD_TRAP	/* 0x104 */
.align 32
	ta	HP_BAD_TRAP	/* 0x105 */
.align 32
	ta	HP_BAD_TRAP	/* 0x106 */
.align 32
	ta	HP_BAD_TRAP	/* 0x107 */
.align 32
	ta	HP_BAD_TRAP	/* 0x108 */
.align 32
	ta	HP_BAD_TRAP	/* 0x109 */
.align 32
	ta	HP_BAD_TRAP	/* 0x10a */
.align 32
	ta	HP_BAD_TRAP	/* 0x10b */
.align 32
	ta	HP_BAD_TRAP	/* 0x10c */
.align 32
	ta	HP_BAD_TRAP	/* 0x10d */
.align 32
	ta	HP_BAD_TRAP	/* 0x10e */
.align 32
	ta	HP_BAD_TRAP	/* 0x10f */
.align 32
	ta	HPTRAP_I_DEMAP_ALL	/* 0x110 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PCTX	/* 0x111 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_SCTX	/* 0x112 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_NCTX	/* 0x113 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PAGE	/* 0x114 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_RPAGE	/* 0x115 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_REAL 	/* 0x116 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_ALL	/* 0x117 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PCTX	/* 0x118 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_SCTX	/* 0x119 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_NCTX	/* 0x11a */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PAGE	/* 0x11b */
	done
.align 32
	ta	HPTRAP_D_DEMAP_RPAGE	/* 0x11c */
	done
.align 32
	ta	HPTRAP_D_DEMAP_REAL     /* 0x11d */
	done
.align 32
	ta	HP_BAD_TRAP	/* 0x11e */
.align 32
	ta	HP_BAD_TRAP	/* 0x11f */
.align 32
	sllx	%i7, 63, %g1
	brz	%g1, 1f
	nop
	rdpr	%tnpc, %g2
	add	%g2, 8, %g2
	wrpr	%g2, %tnpc
1:	
	done
.align 32
	ta	HPTRAP_CHANGE_PID	/* 0x121 */
.align 32
	ta	HP_BAD_TRAP	/* 0x122 */
.align 32
	ta	HP_BAD_TRAP	/* 0x123 */
.align 32
	ta	HP_BAD_TRAP	/* 0x124 */
.align 32
	ta	HP_BAD_TRAP	/* 0x125 */
.align 32
	ta	HP_BAD_TRAP	/* 0x126 */
.align 32
	ta	HP_BAD_TRAP	/* 0x127 */
.align 32
	ta	HP_BAD_TRAP	/* 0x128 */
.align 32
	ta	HP_BAD_TRAP	/* 0x129 */
.align 32
	ta	HP_BAD_TRAP	/* 0x12a */
.align 32
	ta	HP_BAD_TRAP	/* 0x12b */
.align 32
	ta	HP_BAD_TRAP	/* 0x12c */
.align 32
	ta	HP_BAD_TRAP	/* 0x12d */
.align 32
	ta	HP_BAD_TRAP	/* 0x12e */
.align 32
	ta	HP_BAD_TRAP	/* 0x12f */
.align 32
	ta	HP_BAD_TRAP	/* 0x130 */
.align 32
	ta	HP_BAD_TRAP	/* 0x131 */
.align 32
	ta	HP_BAD_TRAP	/* 0x132 */
.align 32
	ta	HP_BAD_TRAP	/* 0x133 */
.align 32
	ta	HP_BAD_TRAP	/* 0x134 */
.align 32
	ta	HP_BAD_TRAP	/* 0x135 */
.align 32
	ta	HP_BAD_TRAP	/* 0x136 */
.align 32
	ta	HP_BAD_TRAP	/* 0x137 */
.align 32
	ta	HP_BAD_TRAP	/* 0x138 */
.align 32
	ta	HP_BAD_TRAP	/* 0x139 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13a */
.align 32
	ta	HP_BAD_TRAP	/* 0x13b */
.align 32
	ta	HP_BAD_TRAP	/* 0x13c */
.align 32
	ta	HP_BAD_TRAP	/* 0x13d */
.align 32
	ta	HP_BAD_TRAP	/* 0x13e */
.align 32
	ta	HP_BAD_TRAP	/* 0x13f */
.align 32
	ta	HP_BAD_TRAP	/* 0x140 */
.align 32
	ta	HP_BAD_TRAP	/* 0x141 */
.align 32
	ta	HP_BAD_TRAP	/* 0x142 */
.align 32
	ta	HP_BAD_TRAP	/* 0x143 */
.align 32
	ta	HP_BAD_TRAP	/* 0x144 */
.align 32
	ta	HP_BAD_TRAP	/* 0x145 */
.align 32
	ta	HP_BAD_TRAP	/* 0x146 */
.align 32
	ta	HP_BAD_TRAP	/* 0x147 */
.align 32
	ta	HP_BAD_TRAP	/* 0x148 */
.align 32
	ta	HP_BAD_TRAP	/* 0x149 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14a */
.align 32
	ta	HP_BAD_TRAP	/* 0x14b */
.align 32
	ta	HP_BAD_TRAP	/* 0x14c */
.align 32
	ta	HP_BAD_TRAP	/* 0x14d */
.align 32
	ta	HP_BAD_TRAP	/* 0x14e */
.align 32
	ta	HP_BAD_TRAP	/* 0x14f */
.align 32
	ta	HP_BAD_TRAP	/* 0x150 */
.align 32
	ta	HP_BAD_TRAP	/* 0x151 */
.align 32
	ta	HP_BAD_TRAP	/* 0x152 */
.align 32
	ta	HP_BAD_TRAP	/* 0x153 */
.align 32
	ta	HP_BAD_TRAP	/* 0x154 */
.align 32
	ta	HP_BAD_TRAP	/* 0x155 */
.align 32
	ta	HP_BAD_TRAP	/* 0x156 */
.align 32
	ta	HP_BAD_TRAP	/* 0x157 */
.align 32
	ta	HP_BAD_TRAP	/* 0x158 */
.align 32
	ta	HP_BAD_TRAP	/* 0x159 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15a */
.align 32
	ta	HP_BAD_TRAP	/* 0x15b */
.align 32
	ta	HP_BAD_TRAP	/* 0x15c */
.align 32
	ta	HP_BAD_TRAP	/* 0x15d */
.align 32
	ta	HP_BAD_TRAP	/* 0x15e */
.align 32
	ta	HP_BAD_TRAP	/* 0x15f */
.align 32
	ta	HP_BAD_TRAP	/* 0x160 */
.align 32
	ta	HP_BAD_TRAP	/* 0x161 */
.align 32
	ta	HP_BAD_TRAP	/* 0x162 */
.align 32
	ta	HP_BAD_TRAP	/* 0x163 */
.align 32
	ta	HP_BAD_TRAP	/* 0x164 */
.align 32
	ta	HP_BAD_TRAP	/* 0x165 */
.align 32
	ta	HP_BAD_TRAP	/* 0x166 */
.align 32
	ta	HP_BAD_TRAP	/* 0x167 */
.align 32
	ta	HP_BAD_TRAP	/* 0x168 */
.align 32
	ta	HP_BAD_TRAP	/* 0x169 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16a */
.align 32
	ta	HP_BAD_TRAP	/* 0x16b */
.align 32
	ta	HP_BAD_TRAP	/* 0x16c */
.align 32
	ta	HP_BAD_TRAP	/* 0x16d */
.align 32
	ta	HP_BAD_TRAP	/* 0x16e */
.align 32
	ta	HP_BAD_TRAP	/* 0x16f */
.align 32
	ta	HP_BAD_TRAP	/* 0x170 */
.align 32
	ta	HP_BAD_TRAP	/* 0x171 */
.align 32
	ta	HP_BAD_TRAP	/* 0x172 */
.align 32
	ta	HP_BAD_TRAP	/* 0x173 */
.align 32
	ta	HP_BAD_TRAP	/* 0x174 */
.align 32
	ta	HP_BAD_TRAP	/* 0x175 */
.align 32
	ta	HP_BAD_TRAP	/* 0x176 */
.align 32
	ta	HP_BAD_TRAP	/* 0x177 */
.align 32
	ta	HP_BAD_TRAP	/* 0x178 */
.align 32
	ta	HP_BAD_TRAP	/* 0x179 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17a */
.align 32
	ta	HP_BAD_TRAP	/* 0x17b */
.align 32
	ta	HP_BAD_TRAP	/* 0x17c */
.align 32
	ta	HP_BAD_TRAP	/* 0x17d */
.align 32
	ta	HP_BAD_TRAP	/* 0x17e */
.align 32
	ta	HP_BAD_TRAP	/* 0x17f */
.align 32
Thr7_Ptrap_Sect_text_end:
/******************************************************************************************
 * $Revision: 1.1 $
 *******************************************************************************************/
SECTION .HTRAPS  TEXT_VA=HPTRAP_TEXT_PA

attr_text {
    Name = .HTRAPS,
    hypervisor,
    }

	ta      HP_BAD_TRAP
.align	32	/* 1 */
	ta      HP_BAD_TRAP
.align	32	/* 2 */
	ta      HP_BAD_TRAP
.align	32	/* 3 */
	ta      HP_BAD_TRAP
.align	32	/* 4 */
	ta      HP_BAD_TRAP
.align	32	/* 5 */
	ta      HP_BAD_TRAP
.align	32	/* 6 */
	ta      HP_BAD_TRAP
.align	32	/* 7 */
	ta      HP_BAD_TRAP
.align	32	/* 8 */
	ta      HP_BAD_TRAP
.align	32	/* 9 */
        setx    ext_trap_0x9_begin, %g1, %g2
        jmp     %g2
        nop
.align	32	/* a */
	ta      HP_BAD_TRAP
.align	32	/* b */
        setx    ext_trap_0xb_begin, %g1, %g2
        jmp     %g2
        nop
.align	32	/* c */
	ta      HP_BAD_TRAP
.align	32	/* d */
	ta      HP_BAD_TRAP
.align	32	/* e */
	ta      HP_BAD_TRAP
.align	32	/* f */
	ta      HP_BAD_TRAP
.align	32	/* 10 */
	done
.align	32	/* 11 */
	ta      HP_BAD_TRAP
.align	32	/* 12 */
	ta      HP_BAD_TRAP
.align	32	/* 13 */
	ta      HP_BAD_TRAP
.align	32	/* 14 */
	ta      HP_BAD_TRAP
.align	32	/* 15 */
	ta      HP_BAD_TRAP
.align	32	/* 16 */
	ta      HP_BAD_TRAP
.align	32	/* 17 */
	ta      HP_BAD_TRAP
.align	32	/* 18 */
	ta      HP_BAD_TRAP
.align	32	/* 19 */
	ta      HP_BAD_TRAP
.align	32	/* 1a */
	ta      HP_BAD_TRAP
.align	32	/* 1b */
        setx    ext_trap_0x1b_begin, %g1, %g2
        jmp     %g2
        nop
.align	32	/* 1c */
	ta      HP_BAD_TRAP
.align	32	/* 1d */
	ta      HP_BAD_TRAP
.align	32	/* 1e */
	ta      HP_BAD_TRAP
.align	32	/* 1f */
	ta      HP_BAD_TRAP
.align	32	/* 20 */
	ta      HP_BAD_TRAP
.align	32	/* 21 */
	ta      HP_BAD_TRAP
.align	32	/* 22 */
	ta      HP_BAD_TRAP
.align	32	/* 23 */
	ta      HP_BAD_TRAP
.align	32	/* 24 */
	ta      HP_BAD_TRAP
.align	32	/* 25 */
	ta      HP_BAD_TRAP
.align	32	/* 26 */
	ta      HP_BAD_TRAP
.align	32	/* 27 */
	ta      HP_BAD_TRAP
.align	32	/* 28 */
	ta      HP_BAD_TRAP
.align	32	/* 29 */
	ta      HP_BAD_TRAP
.align	32	/* 2a */
	ta      HP_BAD_TRAP
.align	32	/* 2b */
	ta      HP_BAD_TRAP
.align	32	/* 2c */
	ta      HP_BAD_TRAP
.align	32	/* 2d */
	ta      HP_BAD_TRAP
.align	32	/* 2e */
        setx    ext_trap_0x2e_begin, %g1, %g2
        jmp     %g2
        nop
.align	32	/* 2f */
	ta      HP_BAD_TRAP
.align	32	/* 30 */
	ta      HP_BAD_TRAP
.align	32	/* 31 */
        setx    ext_trap_0x31_begin, %g1, %g2
        jmp     %g2
        nop
.align	32	/* 32 */
	ta      HP_BAD_TRAP
.align	32	/* 33 */
	ta      HP_BAD_TRAP
.align	32	/* 34 */
	done
.align	32	/* 35 */
	ta      HP_BAD_TRAP
.align	32	/* 36 */
	ta      HP_BAD_TRAP
.align	32	/* 37 */
	ta      HP_BAD_TRAP
.align	32	/* 38 */
	ta      HP_BAD_TRAP
.align	32	/* 39 */
	ta      HP_BAD_TRAP
.align	32	/* 3a */
	ta      HP_BAD_TRAP
.align	32	/* 3b */
	ta      HP_BAD_TRAP
.align	32	/* 3c */
	ta      HP_BAD_TRAP
.align	32	/* 3d */
	ta      HP_BAD_TRAP
.align	32	/* 3e */
	ta      HP_BAD_TRAP
.align	32	/* 3f */
	ta      HP_BAD_TRAP
.align	32	/* 40 */
	ta      HP_BAD_TRAP
.align	32	/* 41 */
	ta      HP_BAD_TRAP
.align	32	/* 42 */
	ta      HP_BAD_TRAP
.align	32	/* 43 */
	ta      HP_BAD_TRAP
.align	32	/* 44 */
	ta      HP_BAD_TRAP
.align	32	/* 45 */
	ta      HP_BAD_TRAP
.align	32	/* 46 */
	ta      HP_BAD_TRAP
.align	32	/* 47 */
	ta      HP_BAD_TRAP
.align	32	/* 48 */
	ta      HP_BAD_TRAP
.align	32	/* 49 */
	ta      HP_BAD_TRAP
.align	32	/* 4a */
	ta      HP_BAD_TRAP
.align	32	/* 4b */
	ta      HP_BAD_TRAP
.align	32	/* 4c */
	ta      HP_BAD_TRAP
.align	32	/* 4d */
	ta      HP_BAD_TRAP
.align	32	/* 4e */
	ta      HP_BAD_TRAP
.align	32	/* 4f */
	ta      HP_BAD_TRAP
.align	32	/* 50 */
	ta      HP_BAD_TRAP
.align	32	/* 51 */
	ta      HP_BAD_TRAP
.align	32	/* 52 */
	ta      HP_BAD_TRAP
.align	32	/* 53 */
	ta      HP_BAD_TRAP
.align	32	/* 54 */
	ta      HP_BAD_TRAP
.align	32	/* 55 */
	ta      HP_BAD_TRAP
.align	32	/* 56 */
	ta      HP_BAD_TRAP
.align	32	/* 57 */
	ta      HP_BAD_TRAP
.align	32	/* 58 */
	ta      HP_BAD_TRAP
.align	32	/* 59 */
	ta      HP_BAD_TRAP
.align	32	/* 5a */
	ta      HP_BAD_TRAP
.align	32	/* 5b */
	ta      HP_BAD_TRAP
.align	32	/* 5c */
	ta      HP_BAD_TRAP
.align	32	/* 5d */
	ta      HP_BAD_TRAP
.align	32	/* 5e */
	ta      HP_BAD_TRAP
.align	32	/* 5f */
	ta      HP_BAD_TRAP
.align	32	/* 60 */
	ta      HP_BAD_TRAP
.align	32	/* 61 */
	ta      HP_BAD_TRAP
.align	32	/* 62 */
	ta      HP_BAD_TRAP
.align	32	/* 63 */
	ta      HP_BAD_TRAP
.align	32	/* 64 */
	setx	ext_trap_0x64_begin, %g1, %g2
	jmp	%g2
	nop
.align	32	/* 65 */
	ta      HP_BAD_TRAP
.align	32	/* 66 */
	ta      HP_BAD_TRAP
.align	32	/* 67 */
	ta      HP_BAD_TRAP
.align	32	/* 68 */
        setx    ext_trap_0x68_begin, %g1, %g2
        jmp     %g2
	nop
.align	32	/* 69 */
	ta      HP_BAD_TRAP
.align	32	/* 6a */
	ta      HP_BAD_TRAP
.align	32	/* 6b */
	ta      HP_BAD_TRAP
.align	32	/* 6c */
        setx    ext_trap_0x6c_begin, %g1, %g2
        jmp     %g2
        nop
.align	32	/* 6d */
	ta      HP_BAD_TRAP
.align	32	/* 6e */
	ta      HP_BAD_TRAP
.align	32	/* 6f */
	ta      HP_BAD_TRAP
.align	32	/* 70 */
	ta      HP_BAD_TRAP
.align	32	/* 71 */
	ta      HP_BAD_TRAP
.align	32	/* 72 */
	ta      HP_BAD_TRAP
.align	32	/* 73 */
	ta      HP_BAD_TRAP
.align	32	/* 74 */
	ta      HP_BAD_TRAP
.align	32	/* 75 */
	ta      HP_BAD_TRAP
.align	32	/* 76 */
	ta      HP_BAD_TRAP
.align	32	/* 77 */
	ta      HP_BAD_TRAP
.align	32	/* 78 */
	ta      HP_BAD_TRAP
.align	32	/* 79 */
	ta      HP_BAD_TRAP
.align	32	/* 7a */
	ta      HP_BAD_TRAP
.align	32	/* 7b */
	ta      HP_BAD_TRAP
.align	32	/* 7c */
	ta      HP_BAD_TRAP
.align	32	/* 7d */
	ta      HP_BAD_TRAP
.align	32	/* 7e */
	ta      HP_BAD_TRAP
.align	32	/* 7f */
	ta      HP_BAD_TRAP
.align	32	/* 80 */
	ta      HP_BAD_TRAP
.align	32	/* 81 */
	ta      HP_BAD_TRAP
.align	32	/* 82 */
	ta      HP_BAD_TRAP
.align	32	/* 83 */
	ta      HP_BAD_TRAP
.align	32	/* 84 */
	ta      HP_BAD_TRAP
.align	32	/* 85 */
	ta      HP_BAD_TRAP
.align	32	/* 86 */
	ta      HP_BAD_TRAP
.align	32	/* 87 */
	ta      HP_BAD_TRAP
.align	32	/* 88 */
	ta      HP_BAD_TRAP
.align	32	/* 89 */
	ta      HP_BAD_TRAP
.align	32	/* 8a */
	ta      HP_BAD_TRAP
.align	32	/* 8b */
	ta      HP_BAD_TRAP
.align	32	/* 8c */
	ta      HP_BAD_TRAP
.align	32	/* 8d */
	ta      HP_BAD_TRAP
.align	32	/* 8e */
	ta      HP_BAD_TRAP
.align	32	/* 8f */
	ta      HP_BAD_TRAP
.align	32	/* 90 */
	ta      HP_BAD_TRAP
.align	32	/* 91 */
	ta      HP_BAD_TRAP
.align	32	/* 92 */
	ta      HP_BAD_TRAP
.align	32	/* 93 */
	ta      HP_BAD_TRAP
.align	32	/* 94 */
	ta      HP_BAD_TRAP
.align	32	/* 95 */
	ta      HP_BAD_TRAP
.align	32	/* 96 */
	ta      HP_BAD_TRAP
.align	32	/* 97 */
	ta      HP_BAD_TRAP
.align	32	/* 98 */
	ta      HP_BAD_TRAP
.align	32	/* 99 */
	ta      HP_BAD_TRAP
.align	32	/* 9a */
	ta      HP_BAD_TRAP
.align	32	/* 9b */
	ta      HP_BAD_TRAP
.align	32	/* 9c */
	ta      HP_BAD_TRAP
.align	32	/* 9d */
	ta      HP_BAD_TRAP
.align	32	/* 9e */
	ta      HP_BAD_TRAP
.align	32	/* 9f */
	ta      HP_BAD_TRAP
.align	32	/* a0 */
	ta      HP_BAD_TRAP
.align	32	/* a1 */
	ta      HP_BAD_TRAP
.align	32	/* a2 */
	ta      HP_BAD_TRAP
.align	32	/* a3 */
	ta      HP_BAD_TRAP
.align	32	/* a4 */
	ta      HP_BAD_TRAP
.align	32	/* a5 */
	ta      HP_BAD_TRAP
.align	32	/* a6 */
	ta      HP_BAD_TRAP
.align	32	/* a7 */
	ta      HP_BAD_TRAP
.align	32	/* a8 */
	ta      HP_BAD_TRAP
.align	32	/* a9 */
	ta      HP_BAD_TRAP
.align	32	/* aa */
	ta      HP_BAD_TRAP
.align	32	/* ab */
	ta      HP_BAD_TRAP
.align	32	/* ac */
	ta      HP_BAD_TRAP
.align	32	/* ad */
	ta      HP_BAD_TRAP
.align	32	/* ae */
	ta      HP_BAD_TRAP
.align	32	/* af */
	ta      HP_BAD_TRAP
.align	32	/* b0 */
	ta      HP_BAD_TRAP
.align	32	/* b1 */
	ta      HP_BAD_TRAP
.align	32	/* b2 */
	ta      HP_BAD_TRAP
.align	32	/* b3 */
	ta      HP_BAD_TRAP
.align	32	/* b4 */
	ta      HP_BAD_TRAP
.align	32	/* b5 */
	ta      HP_BAD_TRAP
.align	32	/* b6 */
	ta      HP_BAD_TRAP
.align	32	/* b7 */
	ta      HP_BAD_TRAP
.align	32	/* b8 */
	ta      HP_BAD_TRAP
.align	32	/* b9 */
	ta      HP_BAD_TRAP
.align	32	/* ba */
	ta      HP_BAD_TRAP
.align	32	/* bb */
	ta      HP_BAD_TRAP
.align	32	/* bc */
	ta      HP_BAD_TRAP
.align	32	/* bd */
	ta      HP_BAD_TRAP
.align	32	/* be */
	ta      HP_BAD_TRAP
.align	32	/* bf */
	ta      HP_BAD_TRAP
.align	32	/* c0 */
	ta      HP_BAD_TRAP
.align	32	/* c1 */
	ta      HP_BAD_TRAP
.align	32	/* c2 */
	ta      HP_BAD_TRAP
.align	32	/* c3 */
	ta      HP_BAD_TRAP
.align	32	/* c4 */
	ta      HP_BAD_TRAP
.align	32	/* c5 */
	ta      HP_BAD_TRAP
.align	32	/* c6 */
	ta      HP_BAD_TRAP
.align	32	/* c7 */
	ta      HP_BAD_TRAP
.align	32	/* c8 */
	ta      HP_BAD_TRAP
.align	32	/* c9 */
	ta      HP_BAD_TRAP
.align	32	/* ca */
	ta      HP_BAD_TRAP
.align	32	/* cb */
	ta      HP_BAD_TRAP
.align	32	/* cc */
	ta      HP_BAD_TRAP
.align	32	/* cd */
	ta      HP_BAD_TRAP
.align	32	/* ce */
	ta      HP_BAD_TRAP
.align	32	/* cf */
	ta      HP_BAD_TRAP
.align	32	/* d0 */
	ta      HP_BAD_TRAP
.align	32	/* d1 */
	ta      HP_BAD_TRAP
.align	32	/* d2 */
	ta      HP_BAD_TRAP
.align	32	/* d3 */
	ta      HP_BAD_TRAP
.align	32	/* d4 */
	ta      HP_BAD_TRAP
.align	32	/* d5 */
	ta      HP_BAD_TRAP
.align	32	/* d6 */
	ta      HP_BAD_TRAP
.align	32	/* d7 */
	ta      HP_BAD_TRAP
.align	32	/* d8 */
	ta      HP_BAD_TRAP
.align	32	/* d9 */
	ta      HP_BAD_TRAP
.align	32	/* da */
	ta      HP_BAD_TRAP
.align	32	/* db */
	ta      HP_BAD_TRAP
.align	32	/* dc */
	ta      HP_BAD_TRAP
.align	32	/* dd */
	ta      HP_BAD_TRAP
.align	32	/* de */
	ta      HP_BAD_TRAP
.align	32	/* df */
	ta      HP_BAD_TRAP
.align	32	/* e0 */
	ta      HP_BAD_TRAP
.align	32	/* e1 */
	ta      HP_BAD_TRAP
.align	32	/* e2 */
	ta      HP_BAD_TRAP
.align	32	/* e3 */
	ta      HP_BAD_TRAP
.align	32	/* e4 */
	ta      HP_BAD_TRAP
.align	32	/* e5 */
	ta      HP_BAD_TRAP
.align	32	/* e6 */
	ta      HP_BAD_TRAP
.align	32	/* e7 */
	ta      HP_BAD_TRAP
.align	32	/* e8 */
	ta      HP_BAD_TRAP
.align	32	/* e9 */
	ta      HP_BAD_TRAP
.align	32	/* ea */
	ta      HP_BAD_TRAP
.align	32	/* eb */
	ta      HP_BAD_TRAP
.align	32	/* ec */
	ta      HP_BAD_TRAP
.align	32	/* ed */
	ta      HP_BAD_TRAP
.align	32	/* ee */
	ta      HP_BAD_TRAP
.align	32	/* ef */
	ta      HP_BAD_TRAP
.align	32	/* f0 */
	ta      HP_BAD_TRAP
.align	32	/* f1 */
	ta      HP_BAD_TRAP
.align	32	/* f2 */
	ta      HP_BAD_TRAP
.align	32	/* f3 */
	ta      HP_BAD_TRAP
.align	32	/* f4 */
	ta      HP_BAD_TRAP
.align	32	/* f5 */
	ta      HP_BAD_TRAP
.align	32	/* f6 */
	ta      HP_BAD_TRAP
.align	32	/* f7 */
	ta      HP_BAD_TRAP
.align	32	/* f8 */
	ta      HP_BAD_TRAP
.align	32	/* f9 */
	ta      HP_BAD_TRAP
.align	32	/* fa */
	ta      HP_BAD_TRAP
.align	32	/* fb */
	ta      HP_BAD_TRAP
.align	32	/* fc */
	ta      HP_BAD_TRAP
.align	32	/* fd */
	ta      HP_BAD_TRAP
.align	32	/* fe */
	ta      HP_BAD_TRAP
.align	32	/* ff */
	ta      HP_BAD_TRAP
.align	32	/* 100 */
	wrpr	0, %tl
	ta	HP_GOOD_TRAP
.align	32	/* 101 */
	wrpr	0, %tl
	ta	HP_BAD_TRAP
.align	32	/* 102 */
	ta      HP_BAD_TRAP
.align	32	/* 103 */
	ta      HP_BAD_TRAP
.align	32	/* 104 */
	ta      HP_BAD_TRAP
.align	32	/* 105 */
	ta      HP_BAD_TRAP
.align	32	/* 106 */
	ta      HP_BAD_TRAP
.align	32	/* 107 */
	ta      HP_BAD_TRAP
.align	32	/* 108 */
	ta      HP_BAD_TRAP
.align	32	/* 109 */
	ta      HP_BAD_TRAP
.align	32	/* 10a */
	ta      HP_BAD_TRAP
.align	32	/* 10b */
	ta      HP_BAD_TRAP
.align	32	/* 10c */
	ta      HP_BAD_TRAP
.align	32	/* 10d */
	ta      HP_BAD_TRAP
.align	32	/* 10e */
	ta      HP_BAD_TRAP
.align	32	/* 10f */
	ta      HP_BAD_TRAP
.align	32	/* 110 */
	ta      HP_BAD_TRAP
.align	32	/* 111 */
	ta      HP_BAD_TRAP
.align	32	/* 112 */
	ta      HP_BAD_TRAP
.align	32	/* 113 */
	ta      HP_BAD_TRAP
.align	32	/* 114 */
	ta      HP_BAD_TRAP
.align	32	/* 115 */
	ta      HP_BAD_TRAP
.align	32	/* 116 */
	ta      HP_BAD_TRAP
.align	32	/* 117 */
	ta      HP_BAD_TRAP
.align	32	/* 118 */
	ta      HP_BAD_TRAP
.align	32	/* 119 */
	ta      HP_BAD_TRAP
.align	32	/* 11a */
	ta      HP_BAD_TRAP
.align	32	/* 11b */
	ta      HP_BAD_TRAP
.align	32	/* 11c */
	ta      HP_BAD_TRAP
.align	32	/* 11d */
	ta      HP_BAD_TRAP
.align	32	/* 11e */
	ta      HP_BAD_TRAP
.align	32	/* 11f */
	ta      HP_BAD_TRAP
.align	32	/* 120 */
	ta      HP_BAD_TRAP
.align	32	/* 121 */
	ta      HP_BAD_TRAP
.align	32	/* 122 */
	ta      HP_BAD_TRAP
.align	32	/* 123 */
	ta      HP_BAD_TRAP
.align	32	/* 124 */
	ta      HP_BAD_TRAP
.align	32	/* 125 */
	ta      HP_BAD_TRAP
.align	32	/* 126 */
	ta      HP_BAD_TRAP
.align	32	/* 127 */
	ta      HP_BAD_TRAP
.align	32	/* 128 */
	ta      HP_BAD_TRAP
.align	32	/* 129 */
	ta      HP_BAD_TRAP
.align	32	/* 12a */
	ta      HP_BAD_TRAP
.align	32	/* 12b */
	ta      HP_BAD_TRAP
.align	32	/* 12c */
	ta      HP_BAD_TRAP
.align	32	/* 12d */
	ta      HP_BAD_TRAP
.align	32	/* 12e */
	ta      HP_BAD_TRAP
.align	32	/* 12f */
	ta      HP_BAD_TRAP
.align	32	/* 130 */
	ta      HP_BAD_TRAP
.align	32	/* 131 */
	ta      HP_BAD_TRAP
.align	32	/* 132 */
	ta      HP_BAD_TRAP
.align	32	/* 133 */
	ta      HP_BAD_TRAP
.align	32	/* 134 */
	ta      HP_BAD_TRAP
.align	32	/* 135 */
	ta      HP_BAD_TRAP
.align	32	/* 136 */
	ta      HP_BAD_TRAP
.align	32	/* 137 */
	ta      HP_BAD_TRAP
.align	32	/* 138 */
	ta      HP_BAD_TRAP
.align	32	/* 139 */
	ta      HP_BAD_TRAP
.align	32	/* 13a */
	ta      HP_BAD_TRAP
.align	32	/* 13b */
	ta      HP_BAD_TRAP
.align	32	/* 13c */
	ta      HP_BAD_TRAP
.align	32	/* 13d */
	ta      HP_BAD_TRAP
.align	32	/* 13e */
	ta      HP_BAD_TRAP
.align	32	/* 13f */
	ta      HP_BAD_TRAP
.align	32	/* 140 */
	ta      HP_BAD_TRAP
.align	32	/* 141 */
	ta      HP_BAD_TRAP
.align	32	/* 142 */
	ta      HP_BAD_TRAP
.align	32	/* 143 */
	ta      HP_BAD_TRAP
.align	32	/* 144 */
	ta      HP_BAD_TRAP
.align	32	/* 145 */
	ta      HP_BAD_TRAP
.align	32	/* 146 */
	ta      HP_BAD_TRAP
.align	32	/* 147 */
	ta      HP_BAD_TRAP
.align	32	/* 148 */
	ta      HP_BAD_TRAP
.align	32	/* 149 */
	ta      HP_BAD_TRAP
.align	32	/* 14a */
	ta      HP_BAD_TRAP
.align	32	/* 14b */
	ta      HP_BAD_TRAP
.align	32	/* 14c */
	ta      HP_BAD_TRAP
.align	32	/* 14d */
	ta      HP_BAD_TRAP
.align	32	/* 14e */
	ta      HP_BAD_TRAP
.align	32	/* 14f */
	ta      HP_BAD_TRAP
.align	32	/* 150 */
	ta      HP_BAD_TRAP
.align	32	/* 151 */
	ta      HP_BAD_TRAP
.align	32	/* 152 */
	ta      HP_BAD_TRAP
.align	32	/* 153 */
	ta      HP_BAD_TRAP
.align	32	/* 154 */
	ta      HP_BAD_TRAP
.align	32	/* 155 */
	ta      HP_BAD_TRAP
.align	32	/* 156 */
	ta      HP_BAD_TRAP
.align	32	/* 157 */
	ta      HP_BAD_TRAP
.align	32	/* 158 */
	ta      HP_BAD_TRAP
.align	32	/* 159 */
	ta      HP_BAD_TRAP
.align	32	/* 15a */
	ta      HP_BAD_TRAP
.align	32	/* 15b */
	ta      HP_BAD_TRAP
.align	32	/* 15c */
	ta      HP_BAD_TRAP
.align	32	/* 15d */
	ta      HP_BAD_TRAP
.align	32	/* 15e */
	ta      HP_BAD_TRAP
.align	32	/* 15f */
	ta      HP_BAD_TRAP
.align	32	/* 160 */
	ta      HP_BAD_TRAP
.align	32	/* 161 */
	ta      HP_BAD_TRAP
.align	32	/* 162 */
	ta      HP_BAD_TRAP
.align	32	/* 163 */
	ta      HP_BAD_TRAP
.align	32	/* 164 */
	ta      HP_BAD_TRAP
.align	32	/* 165 */
	ta      HP_BAD_TRAP
.align	32	/* 166 */
	ta      HP_BAD_TRAP
.align	32	/* 167 */
	ta      HP_BAD_TRAP
.align	32	/* 168 */
	ta      HP_BAD_TRAP
.align	32	/* 169 */
	ta      HP_BAD_TRAP
.align	32	/* 16a */
	ta      HP_BAD_TRAP
.align	32	/* 16b */
	ta      HP_BAD_TRAP
.align	32	/* 16c */
	ta      HP_BAD_TRAP
.align	32	/* 16d */
	ta      HP_BAD_TRAP
.align	32	/* 16e */
	ta      HP_BAD_TRAP
.align	32	/* 16f */
	ta      HP_BAD_TRAP
.align	32	/* 170 */
	ta      HP_BAD_TRAP
.align	32	/* 171 */
	ta      HP_BAD_TRAP
.align	32	/* 172 */
	ta      HP_BAD_TRAP
.align	32	/* 173 */
	ta      HP_BAD_TRAP
.align	32	/* 174 */
	ta      HP_BAD_TRAP
.align	32	/* 175 */
	ta      HP_BAD_TRAP
.align	32	/* 176 */
	ta      HP_BAD_TRAP
.align	32	/* 177 */
	ta      HP_BAD_TRAP
.align	32	/* 178 */
	ta      HP_BAD_TRAP
.align	32	/* 179 */
	ta      HP_BAD_TRAP
.align	32	/* 17a */
	ta      HP_BAD_TRAP
.align	32	/* 17b */
	ta      HP_BAD_TRAP
.align	32	/* 17c */
	ta      HP_BAD_TRAP
.align	32	/* 17d */
	ta      HP_BAD_TRAP
.align	32	/* 17e */
	ta      HP_BAD_TRAP
.align	32	/* 17f */
	ta      HP_BAD_TRAP
.align	32	/* 180 */
	! For all demaps, assume register %i7 = {VA[63:13],13'h0}
hptrap_I_demap_all:
        or      0x80, %i7, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 181 */
hptrap_I_demap_pctx:
        or      0x40, %i7, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 182 */
hptrap_I_demap_sctx:
        or      0x50, %i7, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 183 */
hptrap_I_demap_nctx:
        or      0x60, %i7, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 184 */
hptrap_I_demap_page:
        or      0x00, %i7, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 185 */
hptrap_I_demap_rpage:
        or      0x800, %i7, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 18c */
hptrap_I_demap_real:
        or      0xc0, %i7, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 186 */
hptrap_D_demap_all:
        or      0x80, %i7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 187 */
hptrap_D_demap_pctx:
        or      0x40, %i7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 188 */
hptrap_D_demap_sctx:
        or      0x50, %i7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 189 */
hptrap_D_demap_nctx:
        or      0x60, %i7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 18a */
hptrap_D_demap_page:
        or      0x00, %i7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 18b */
hptrap_D_demap_rpage:
        or      0x800, %i7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 18d */
hptrap_D_demap_real:
        or      0xc0, %i7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 18e */
	ta      HP_BAD_TRAP
.align	32	/* 18f */
	ta      HP_BAD_TRAP
.align	32	/* 190 */
	ta      HP_BAD_TRAP
.align	32	/* 191 */
hptrap_change_pid:	
	mov	ASI_PARTITION_ID_VAL, %g1
	ldxa	[%g1] ASI_PARTITION_ID, %g2
	add	%g2, 1, %g2
	and	%g2, 7, %g2
	stxa	%g2, [%g1] ASI_PARTITION_ID
	done
.align	32	/* 192 */
	ta      HP_BAD_TRAP
.align	32	/* 193 */
	ta      HP_BAD_TRAP
.align	32	/* 194 */
	ta      HP_BAD_TRAP
.align	32	/* 195 */
	ta      HP_BAD_TRAP
.align	32	/* 196 */
	ta      HP_BAD_TRAP
.align	32	/* 197 */
	ta      HP_BAD_TRAP
.align	32	/* 198 */
	ta      HP_BAD_TRAP
.align	32	/* 199 */
	ta      HP_BAD_TRAP
.align	32	/* 19a */
	ta      HP_BAD_TRAP
.align	32	/* 19b */
	ta      HP_BAD_TRAP
.align	32	/* 19c */
	ta      HP_BAD_TRAP
.align	32	/* 19d */
	ta      HP_BAD_TRAP
.align	32	/* 19e */
	ta      HP_BAD_TRAP
.align	32	/* 19f */
	ta      HP_BAD_TRAP
.align	32	/* 1a0 */

trap_handler_1a0:
.global	good_trap
good_trap:
	ba	good_trap
	nop

.align 32
trap_handler_1a1:
.global	bad_trap
bad_trap:
	ba	bad_trap
	nop

/****************************************************************************************** */
SECTION .HPTRAPS_EXT_SECT   TEXT_VA=HPTRAPS_EXT_TEXT_PA, DATA_VA=HPTRAPS_EXT_DATA_PA
	
attr_text {
	Name=.HPTRAPS_EXT_SECT,
	hypervisor
}

.text
.global ext_trap_0x9_begin
.global ext_trap_0xb_begin
.global ext_trap_0x1b_begin
.global ext_trap_0x2e_begin
.global ext_trap_0x31_begin
.global ext_trap_0x64_begin
.global ext_trap_0x68_begin
.global ext_trap_0x6c_begin

ext_trap_0x64_begin:
	!! Save %l0, %l1, %o7
	setx	ASI_SCRATCHPAD_0, %g1, %g2
	stxa	%l0, [%g2] ASI_SCRATCHPAD
	setx	ASI_SCRATCHPAD_1, %g1, %g2
	stxa	%l1, [%g2] ASI_SCRATCHPAD
	setx	ASI_SCRATCHPAD_2, %g1, %g2
	stxa	%l2, [%g2] ASI_SCRATCHPAD
	setx	ASI_SCRATCHPAD_3, %g1, %g2
	stxa	%o7, [%g2] ASI_SCRATCHPAD

trap_0x64_tsb_ptr_0:
	setx	trap_0x64_tsb_ptr_1, %l0, %l1
	setx	ASI_SCRATCHPAD_6, %g1, %g2
	stxa	%l1, [%g2] ASI_SCRATCHPAD	/* Store the next pointer */
	setx	ASI_ITSB_PTR_0, %g1, %g3
	ldxa	[%g3] ASI_ITSB_PTR, %g1		/* %g1 = TSB ptr */
	ldxa	[%g0] ASI_IMMU_TAG_REG, %g2	/* %g2 = CTX + VA */
	srlx	%g2, 48, %g3			/* %g3 = CTX */
	brnz	%g3, trap_0x64_nz_tsb_0
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x64_get_tte
	nop
trap_0x64_nz_tsb_0:
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x64_get_tte
	nop
		
trap_0x64_tsb_ptr_1:
	setx	trap_0x64_tsb_ptr_2, %l0, %l1
	setx	ASI_SCRATCHPAD_6, %g1, %g2
	stxa	%l1, [%g2] ASI_SCRATCHPAD	/* Store the next pointer */
	setx	ASI_ITSB_PTR_1, %g1, %g3
	ldxa	[%g3] ASI_ITSB_PTR, %g1		/* %g1 = TSB ptr */
	ldxa	[%g0] ASI_IMMU_TAG_REG, %g2	/* %g2 = CTX + VA */
	srlx	%g2, 48, %g3			/* %g3 = CTX */
	brnz	%g3, trap_0x64_nz_tsb_1
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x64_get_tte
	nop
trap_0x64_nz_tsb_1:
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x64_get_tte
	nop

trap_0x64_tsb_ptr_2:
	setx	trap_0x64_tsb_ptr_3, %l0, %l1
	setx	ASI_SCRATCHPAD_6, %g1, %g2
	stxa	%l1, [%g2] ASI_SCRATCHPAD	/* Store the next pointer */
	setx	ASI_ITSB_PTR_2, %g1, %g3
	ldxa	[%g3] ASI_ITSB_PTR, %g1		/* %g1 = TSB ptr */
	ldxa	[%g0] ASI_IMMU_TAG_REG, %g2	/* %g2 = CTX + VA */
	srlx	%g2, 48, %g3			/* %g3 = CTX */
	brnz	%g3, trap_0x64_nz_tsb_2
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x64_get_tte
	nop
trap_0x64_nz_tsb_2:
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x64_get_tte
	nop
		
trap_0x64_tsb_ptr_3:
	setx	ASI_SCRATCHPAD_6, %g1, %g2
	stxa	%g0, [%g2] ASI_SCRATCHPAD	/* Store 0 as the next pointer */
	setx	ASI_ITSB_PTR_3, %g1, %g3
	ldxa	[%g3] ASI_ITSB_PTR, %g1		/* %g1 = TSB ptr */
	ldxa	[%g0] ASI_IMMU_TAG_REG, %g2	/* %g2 = CTX + VA */
	srlx	%g2, 48, %g3			/* %g3 = CTX */
	brnz	%g3, trap_0x64_nz_tsb_3
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x64_get_tte
	nop
trap_0x64_nz_tsb_3:
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x64_get_tte
	nop
		
trap_0x64_get_tte:	
	ldda	[%g1] ASI_NUCLEUS_QUAD_LDD, %g6		! %g6:%g7 = TTE
	srlx	%g7, 63, %g5
	brz	%g5, trap_0x64_next_tsb_ptr
	nop

	!! If page size is 256M, mask out VA[27:22]
	srlx	%g4, 4, %g5
	and	%g5, 0x07, %g5			/* %g5 has page size */
	sub	%g5, 5, %g5
	brnz	%g5, trap_0x64_skip_mask	
	nop
	and	%g2, 0x1fc0, %g2
	and	%g6, 0x1fc0, %g6
trap_0x64_skip_mask:
	cmp	%g2, %g6			/* Compare tags */
	bne	%xcc, trap_0x64_next_tsb_ptr
	nop

	!! check if RA or PA
	and	%g4, RANOTPA_MASK, %g5
	brz	%g5, trap_0x64_pa
	nop
	call	trap_0x64_ra_2_pa
	nop
trap_0x64_pa:
	and	%g4, SUN4V_MASK, %g5
	sllx	%g5, 3, %g5			/* %g5 has SUN4v at bit 10 */
	stxa	%g7, [%g5] ASI_ITLB_DATA_IN	/* Reload ITLB */
	setx	ASI_SCRATCHPAD_0, %g1, %g2
	ldxa	[%g2] ASI_SCRATCHPAD, %l0
	setx	ASI_SCRATCHPAD_1, %g1, %g2
	ldxa	[%g2] ASI_SCRATCHPAD, %l1
	setx	ASI_SCRATCHPAD_2, %g1, %g2
	ldxa	[%g2] ASI_SCRATCHPAD, %l2
	setx	ASI_SCRATCHPAD_3, %g1, %g2
	ldxa	[%g2] ASI_SCRATCHPAD, %o7
	retry
	nop

!! This routine expects %g7 contains the RA to be converted to PA
trap_0x64_ra_2_pa:
	setx	ASI_MMU_REAL_RANGE_0, %l0, %l1
	ldxa	[%l1] ASI_MMU_REAL_RANGE, %g5		/* %g5 = Hi and Lo */
	srlx	%g5, 63, %l0
	brz	%l0, trap_0x64_check_realrange_1
	nop
	setx	REALRANGE_LO_MASK, %l0, %l1
	and	%g5, %l1, %l0
	sllx	%l0, 13, %l0			/* %l0 = Lo address */
	setx	REALRANGE_HI_MASK, %l1, %l2
	and	%g5, %l2, %l1
	srlx	%l1, 14, %l1			/* %l1 = Hi address */
	setx	TTE_RA_MASK, %l2, %g5
	and	%g7, %g5, %g5			/* %g5 = RA */
	cmp	%g5, %l0
	bl	%xcc, trap_0x64_check_realrange_1
	nop
	cmp	%g5, %l1
	bg	%xcc, trap_0x64_check_realrange_1
	nop
	setx	ASI_MMU_PHYSICAL_OFFSET_0, %l0, %l1
	ldxa	[%l1] ASI_MMU_PHYSICAL_OFFSET, %g5
	add	%g7, %g5, %g7
	jmp	%o7 + 8
	nop
	
trap_0x64_check_realrange_1:
	setx	ASI_MMU_REAL_RANGE_1, %l0, %l1
	ldxa	[%l1] ASI_MMU_REAL_RANGE, %g5		/* %g5 = Hi and Lo */
	srlx	%g5, 63, %l0
	brz	%l0, trap_0x64_check_realrange_2
	nop
	setx	REALRANGE_LO_MASK, %l0, %l1
	and	%g5, %l1, %l0
	sllx	%l0, 13, %l0			/* %l0 = Lo address */
	setx	REALRANGE_HI_MASK, %l1, %l2
	and	%g5, %l2, %l1
	srlx	%l1, 14, %l1			/* %l1 = Hi address */
	setx	TTE_RA_MASK, %l2, %g5
	and	%g7, %g5, %g5			/* %g5 = RA */
	cmp	%g5, %l0
	bl	%xcc, trap_0x64_check_realrange_2
	nop
	cmp	%g5, %l1
	bg	%xcc, trap_0x64_check_realrange_2
	nop
	setx	ASI_MMU_PHYSICAL_OFFSET_1, %l0, %l1
	ldxa	[%l1] ASI_MMU_PHYSICAL_OFFSET, %g5
	add	%g7, %g5, %g7
	jmp	%o7 + 8
	nop
	
trap_0x64_check_realrange_2:
	setx	ASI_MMU_REAL_RANGE_2, %l0, %l1
	ldxa	[%l1] ASI_MMU_REAL_RANGE, %g5		/* %g5 = Hi and Lo */
	srlx	%g5, 63, %l0
	brz	%l0, trap_0x64_check_realrange_3
	nop
	setx	REALRANGE_LO_MASK, %l0, %l1
	and	%g5, %l1, %l0
	sllx	%l0, 13, %l0			/* %l0 = Lo address */
	setx	REALRANGE_HI_MASK, %l1, %l2
	and	%g5, %l2, %l1
	srlx	%l1, 14, %l1			/* %l1 = Hi address */
	setx	TTE_RA_MASK, %l2, %g5
	and	%g7, %g5, %g5			/* %g5 = RA */
	cmp	%g5, %l0
	bl	%xcc, trap_0x64_check_realrange_3
	nop
	cmp	%g5, %l1
	bg	%xcc, trap_0x64_check_realrange_3
	nop
	setx	ASI_MMU_PHYSICAL_OFFSET_2, %l0, %l1
	ldxa	[%l1] ASI_MMU_PHYSICAL_OFFSET, %g5
	add	%g7, %g5, %g7
	jmp	%o7 + 8
	nop
	
trap_0x64_check_realrange_3:
	setx	ASI_MMU_REAL_RANGE_3, %l0, %l1
	ldxa	[%l1] ASI_MMU_REAL_RANGE, %g5		/* %g5 = Hi and Lo */
	srlx	%g5, 63, %l0
	brz	%l0, trap_0x64_next_tsb_ptr
	nop
	setx	REALRANGE_LO_MASK, %l0, %l1
	and	%g5, %l1, %l0
	sllx	%l0, 13, %l0			/* %l0 = Lo address */
	setx	REALRANGE_HI_MASK, %l1, %l2
	and	%g5, %l2, %l1
	srlx	%l1, 14, %l1			/* %l1 = Hi address */
	setx	TTE_RA_MASK, %l2, %g5
	and	%g7, %g5, %g5			/* %g5 = RA */
	cmp	%g5, %l0
	bl	%xcc, trap_0x64_next_tsb_ptr
	nop
	cmp	%g5, %l1
	bg	%xcc, trap_0x64_next_tsb_ptr
	nop
	setx	ASI_MMU_PHYSICAL_OFFSET_3, %l0, %l1
	ldxa	[%l1] ASI_MMU_PHYSICAL_OFFSET, %g5
	add	%g7, %g5, %g7
	jmp	%o7 + 8
	nop
	
trap_0x64_next_tsb_ptr:	
	setx	ASI_SCRATCHPAD_6, %l0, %l1
	ldxa	[%l1] ASI_SCRATCHPAD, %l0	/* Get the next pointer */
	brz	%l0, trap_0x64_tsb_walk_failed
	nop
	jmp	%l0
	nop
trap_0x64_tsb_walk_failed:
	ta      HP_BAD_TRAP
	
ext_trap_0x68_begin:
	!! Save %l0, %l1, %o7
	setx	ASI_SCRATCHPAD_0, %g1, %g2
	stxa	%l0, [%g2] ASI_SCRATCHPAD
	setx	ASI_SCRATCHPAD_1, %g1, %g2
	stxa	%l1, [%g2] ASI_SCRATCHPAD
	setx	ASI_SCRATCHPAD_2, %g1, %g2
	stxa	%l2, [%g2] ASI_SCRATCHPAD
	setx	ASI_SCRATCHPAD_3, %g1, %g2
	stxa	%o7, [%g2] ASI_SCRATCHPAD

trap_0x68_tsb_ptr_0:
	setx	trap_0x68_tsb_ptr_1, %l0, %l1
	setx	ASI_SCRATCHPAD_6, %g1, %g2
	stxa	%l1, [%g2] ASI_SCRATCHPAD	/* Store the next pointer */
	setx	ASI_DTSB_PTR_0, %g1, %g3
	ldxa	[%g3] ASI_DTSB_PTR, %g1		/* %g1 = TSB ptr */
	ldxa	[%g0] ASI_DMMU_TAG_REG, %g2	/* %g2 = CTX + VA */
	srlx	%g2, 48, %g3			/* %g3 = CTX */
	brnz	%g3, trap_0x68_nz_tsb_0
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x68_get_tte
	nop
trap_0x68_nz_tsb_0:
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x68_get_tte
	nop
		
trap_0x68_tsb_ptr_1:
	setx	trap_0x68_tsb_ptr_2, %l0, %l1
	setx	ASI_SCRATCHPAD_6, %g1, %g2
	stxa	%l1, [%g2] ASI_SCRATCHPAD	/* Store the next pointer */
	setx	ASI_DTSB_PTR_1, %g1, %g3
	ldxa	[%g3] ASI_DTSB_PTR, %g1		/* %g1 = TSB ptr */
	ldxa	[%g0] ASI_DMMU_TAG_REG, %g2	/* %g2 = CTX + VA */
	srlx	%g2, 48, %g3			/* %g3 = CTX */
	brnz	%g3, trap_0x68_nz_tsb_1
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x68_get_tte
	nop
trap_0x68_nz_tsb_1:
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x68_get_tte
	nop

trap_0x68_tsb_ptr_2:
	setx	trap_0x68_tsb_ptr_3, %l0, %l1
	setx	ASI_SCRATCHPAD_6, %g1, %g2
	stxa	%l1, [%g2] ASI_SCRATCHPAD	/* Store the next pointer */
	setx	ASI_DTSB_PTR_2, %g1, %g3
	ldxa	[%g3] ASI_DTSB_PTR, %g1		/* %g1 = TSB ptr */
	ldxa	[%g0] ASI_DMMU_TAG_REG, %g2	/* %g2 = CTX + VA */
	srlx	%g2, 48, %g3			/* %g3 = CTX */
	brnz	%g3, trap_0x68_nz_tsb_2
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x68_get_tte
	nop
trap_0x68_nz_tsb_2:
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x68_get_tte
	nop
		
trap_0x68_tsb_ptr_3:
	setx	ASI_SCRATCHPAD_6, %g1, %g2
	stxa	%g0, [%g2] ASI_SCRATCHPAD	/* Store 0 as the next pointer */
	setx	ASI_DTSB_PTR_3, %g1, %g3
	ldxa	[%g3] ASI_DTSB_PTR, %g1		/* %g1 = TSB ptr */
	ldxa	[%g0] ASI_DMMU_TAG_REG, %g2	/* %g2 = CTX + VA */
	srlx	%g2, 48, %g3			/* %g3 = CTX */
	brnz	%g3, trap_0x68_nz_tsb_3
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x68_get_tte
	nop
trap_0x68_nz_tsb_3:
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3, %g4, %g5
	ldxa	[%g5] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g4	/* %g4 = TSB config */
	ba	trap_0x68_get_tte
	nop
		
trap_0x68_get_tte:	
	ldda	[%g1] ASI_NUCLEUS_QUAD_LDD, %g6		! %g6:%g7 = TTE
	srlx	%g7, 63, %g5
	brz	%g5, trap_0x68_next_tsb_ptr
	nop
	
	!! If page size is 256M, mask out VA[27:22]
	srlx	%g4, 4, %g5
	and	%g5, 0x07, %g5			/* %g5 has page size */
	sub	%g5, 5, %g5
	brnz	%g5, trap_0x68_skip_mask	
	nop
	and	%g2, 0x1fc0, %g2
	and	%g6, 0x1fc0, %g6
trap_0x68_skip_mask:
	cmp	%g2, %g6			/* Compare tags */
	bne	%xcc, trap_0x68_next_tsb_ptr
	nop

	!! check if RA or PA
	and	%g4, RANOTPA_MASK, %g5
	brz	%g5, trap_0x68_pa
	nop
	call	trap_0x68_ra_2_pa
	nop
trap_0x68_pa:
	and	%g4, SUN4V_MASK, %g5
	sllx	%g5, 3, %g5			/* %g5 has SUN4v at bit 10 */
	stxa	%g7, [%g5] ASI_DTLB_DATA_IN	/* Reload ITLB */
	setx	ASI_SCRATCHPAD_0, %g1, %g2
	ldxa	[%g2] ASI_SCRATCHPAD, %l0
	setx	ASI_SCRATCHPAD_1, %g1, %g2
	ldxa	[%g2] ASI_SCRATCHPAD, %l1
	setx	ASI_SCRATCHPAD_2, %g1, %g2
	ldxa	[%g2] ASI_SCRATCHPAD, %l2
	setx	ASI_SCRATCHPAD_3, %g1, %g2
	ldxa	[%g2] ASI_SCRATCHPAD, %o7
	retry
	nop

!! This routine expects %g7 contains the RA to be converted to PA
trap_0x68_ra_2_pa:
	setx	ASI_MMU_REAL_RANGE_0, %l0, %l1
	ldxa	[%l1] ASI_MMU_REAL_RANGE, %g5		/* %g5 = Hi and Lo */
	srlx	%g5, 63, %l0
	brz	%l0, trap_0x68_check_realrange_1
	nop
	setx	REALRANGE_LO_MASK, %l0, %l1
	and	%g5, %l1, %l0
	sllx	%l0, 13, %l0			/* %l0 = Lo address */
	setx	REALRANGE_HI_MASK, %l1, %l2
	and	%g5, %l2, %l1
	srlx	%l1, 14, %l1			/* %l1 = Hi address */
	setx	TTE_RA_MASK, %l2, %g5
	and	%g7, %g5, %g5			/* %g5 = RA */
	cmp	%g5, %l0
	bl	%xcc, trap_0x68_check_realrange_1
	nop
	cmp	%g5, %l1
	bg	%xcc, trap_0x68_check_realrange_1
	nop
	setx	ASI_MMU_PHYSICAL_OFFSET_0, %l0, %l1
	ldxa	[%l1] ASI_MMU_PHYSICAL_OFFSET, %g5
	add	%g7, %g5, %g7
	jmp	%o7 + 8
	nop
	
trap_0x68_check_realrange_1:
	setx	ASI_MMU_REAL_RANGE_1, %l0, %l1
	ldxa	[%l1] ASI_MMU_REAL_RANGE, %g5		/* %g5 = Hi and Lo */
	srlx	%g5, 63, %l0
	brz	%l0, trap_0x68_check_realrange_2
	nop
	setx	REALRANGE_LO_MASK, %l0, %l1
	and	%g5, %l1, %l0
	sllx	%l0, 13, %l0			/* %l0 = Lo address */
	setx	REALRANGE_HI_MASK, %l1, %l2
	and	%g5, %l2, %l1
	srlx	%l1, 14, %l1			/* %l1 = Hi address */
	setx	TTE_RA_MASK, %l2, %g5
	and	%g7, %g5, %g5			/* %g5 = RA */
	cmp	%g5, %l0
	bl	%xcc, trap_0x68_check_realrange_2
	nop
	cmp	%g5, %l1
	bg	%xcc, trap_0x68_check_realrange_2
	nop
	setx	ASI_MMU_PHYSICAL_OFFSET_1, %l0, %l1
	ldxa	[%l1] ASI_MMU_PHYSICAL_OFFSET, %g5
	add	%g7, %g5, %g7
	jmp	%o7 + 8
	nop
	
trap_0x68_check_realrange_2:
	setx	ASI_MMU_REAL_RANGE_2, %l0, %l1
	ldxa	[%l1] ASI_MMU_REAL_RANGE, %g5		/* %g5 = Hi and Lo */
	srlx	%g5, 63, %l0
	brz	%l0, trap_0x68_check_realrange_3
	nop
	setx	REALRANGE_LO_MASK, %l0, %l1
	and	%g5, %l1, %l0
	sllx	%l0, 13, %l0			/* %l0 = Lo address */
	setx	REALRANGE_HI_MASK, %l1, %l2
	and	%g5, %l2, %l1
	srlx	%l1, 14, %l1			/* %l1 = Hi address */
	setx	TTE_RA_MASK, %l2, %g5
	and	%g7, %g5, %g5			/* %g5 = RA */
	cmp	%g5, %l0
	bl	%xcc, trap_0x68_check_realrange_3
	nop
	cmp	%g5, %l1
	bg	%xcc, trap_0x68_check_realrange_3
	nop
	setx	ASI_MMU_PHYSICAL_OFFSET_2, %l0, %l1
	ldxa	[%l1] ASI_MMU_PHYSICAL_OFFSET, %g5
	add	%g7, %g5, %g7
	jmp	%o7 + 8
	nop
	
trap_0x68_check_realrange_3:
	setx	ASI_MMU_REAL_RANGE_3, %l0, %l1
	ldxa	[%l1] ASI_MMU_REAL_RANGE, %g5		/* %g5 = Hi and Lo */
	srlx	%g5, 63, %l0
	brz	%l0, trap_0x68_next_tsb_ptr
	nop
	setx	REALRANGE_LO_MASK, %l0, %l1
	and	%g5, %l1, %l0
	sllx	%l0, 13, %l0			/* %l0 = Lo address */
	setx	REALRANGE_HI_MASK, %l1, %l2
	and	%g5, %l2, %l1
	srlx	%l1, 14, %l1			/* %l1 = Hi address */
	setx	TTE_RA_MASK, %l2, %g5
	and	%g7, %g5, %g5			/* %g5 = RA */
	cmp	%g5, %l0
	bl	%xcc, trap_0x68_next_tsb_ptr
	nop
	cmp	%g5, %l1
	bg	%xcc, trap_0x68_next_tsb_ptr
	nop
	setx	ASI_MMU_PHYSICAL_OFFSET_3, %l0, %l1
	ldxa	[%l1] ASI_MMU_PHYSICAL_OFFSET, %g5
	add	%g7, %g5, %g7
	jmp	%o7 + 8
	nop
	
trap_0x68_next_tsb_ptr:	
	setx	ASI_SCRATCHPAD_6, %l0, %l1
	ldxa	[%l1] ASI_SCRATCHPAD, %l0	/* Get the next pointer */
	brz	%l0, trap_0x68_tsb_walk_failed
	nop
	jmp	%l0
	nop
trap_0x68_tsb_walk_failed:
	ta      HP_BAD_TRAP

/*************************************************************************/
ext_trap_0x9_begin:
	setx	Thr5_trap_checkpoint, %g1, %g2
	cmp	%g2, %i7
	bne	%xcc, ext_trap_0x9_continue
	nop
	ta      HP_GOOD_TRAP
ext_trap_0x9_continue:	
	/* Get TID */
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %l7
	set     0x7, %g1
	and     %l7, %g1, %l7         ! %l7 has TID
	setx	Thr0_trap_occurence_cnt_begin, %g2, %g1
	or	%g0, NUM_IMPL_TRAPS, %g3
	umul	%g3, 4, %g2
	umul	%l7, %g2, %g2	! %g2 points to thread offset
	add	%g1, %g2, %g1	! %g1 points to thread
	add	%g1, TRAP_0x9_OFFSET, %g1	! %g1 points to trap 0x9 occurence count
	lduw	[%g1], %g2
	add	%g2, 1, %g2
	or	%g0, MAX_OCCURENCE_CNT, %g4
	cmp	%g2, %g4
	bge	%xcc, clear_occurence_cnt
	nop
	stw	%g2, [%g1]
	done

ext_trap_0xb_begin:
	/* Get TID */
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %l7
	set     0x7, %g1
	and     %l7, %g1, %l7         ! %l7 has TID
	setx	Thr0_trap_occurence_cnt_begin, %g2, %g1
	or	%g0, NUM_IMPL_TRAPS, %g3
	umul	%g3, 4, %g2
	umul	%l7, %g2, %g2	! %g2 points to thread offset
	add	%g1, %g2, %g1	! %g1 points to thread
	add	%g1, TRAP_0xB_OFFSET, %g1	! %g1 points to trap 0xb occurence count
	lduw	[%g1], %g2
	add	%g2, 1, %g2
	or	%g0, MAX_OCCURENCE_CNT, %g4
	cmp	%g2, %g4
	bge	%xcc, clear_occurence_cnt
	nop
	stw	%g2, [%g1]
	done

ext_trap_0x1b_begin:
	/* Get TID */
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %l7
	set     0x7, %g1
	and     %l7, %g1, %l7         ! %l7 has TID
	setx	Thr0_trap_occurence_cnt_begin, %g2, %g1
	or	%g0, NUM_IMPL_TRAPS, %g3
	umul	%g3, 4, %g2
	umul	%l7, %g2, %g2	! %g2 points to thread offset
	add	%g1, %g2, %g1	! %g1 points to thread
	add	%g1, TRAP_0x1B_OFFSET, %g1	! %g1 points to trap 0x1b occurence count
	lduw	[%g1], %g2
	add	%g2, 1, %g2
	or	%g0, MAX_OCCURENCE_CNT, %g4
	cmp	%g2, %g4
	bge	%xcc, clear_occurence_cnt
	nop
	stw	%g2, [%g1]
	done

ext_trap_0x2e_begin:
	/* Get TID */
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %l7
	set     0x7, %g1
	and     %l7, %g1, %l7         ! %l7 has TID
	setx	Thr0_trap_occurence_cnt_begin, %g2, %g1
	or	%g0, NUM_IMPL_TRAPS, %g3
	umul	%g3, 4, %g2
	umul	%l7, %g2, %g2	! %g2 points to thread offset
	add	%g1, %g2, %g1	! %g1 points to thread
	add	%g1, TRAP_0x2E_OFFSET, %g1	! %g1 points to trap 0x2e occurence count
	lduw	[%g1], %g2
	add	%g2, 1, %g2
	or	%g0, MAX_OCCURENCE_CNT, %g4
	cmp	%g2, %g4
	bge	%xcc, clear_occurence_cnt
	nop
	stw	%g2, [%g1]
	done

ext_trap_0x31_begin:
	/* Get TID */
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %l7
	set     0x7, %g1
	and     %l7, %g1, %l7         ! %l7 has TID
	setx	Thr0_trap_occurence_cnt_begin, %g2, %g1
	or	%g0, NUM_IMPL_TRAPS, %g3
	umul	%g3, 4, %g2
	umul	%l7, %g2, %g2	! %g2 points to thread offset
	add	%g1, %g2, %g1	! %g1 points to thread
	add	%g1, TRAP_0x31_OFFSET, %g1	! %g1 points to trap 0x31 occurence count
	lduw	[%g1], %g2
	add	%g2, 1, %g2
	or	%g0, MAX_OCCURENCE_CNT, %g4
	cmp	%g2, %g4
	bge	%xcc, clear_occurence_cnt
	nop
	stw	%g2, [%g1]
	done

ext_trap_0x6c_begin:
	/* Get TID */
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %l7
	set     0x7, %g1
	and     %l7, %g1, %l7         ! %l7 has TID
	setx	Thr0_trap_occurence_cnt_begin, %g2, %g1
	or	%g0, NUM_IMPL_TRAPS, %g3
	umul	%g3, 4, %g2
	umul	%l7, %g2, %g2	! %g2 points to thread offset
	add	%g1, %g2, %g1	! %g1 points to thread
	add	%g1, TRAP_0x6C_OFFSET, %g1	! %g1 points to trap 0x6c occurence count
	lduw	[%g1], %g2
	add	%g2, 1, %g2
	or	%g0, MAX_OCCURENCE_CNT, %g4
	cmp	%g2, %g4
	bge	%xcc, clear_occurence_cnt
	nop
	stw	%g2, [%g1]
	done


clear_occurence_cnt:
	stw	%g0, [%g1]
	add	%g1, 4, %g1
	sub	%g3, 1, %g3
	brnz	%g3, clear_occurence_cnt
	nop
	/* %l7 has TID */
	setx	Thr0_register_initial_values, %i6, %i7
	umul	%l7, 240, %i6
	add	%i7, %i6, %i7	! %i7 points to register values
restore_registers:
	wrpr	0, %g0, %gl     
	ldx	[%i7 + 0x10], %g2
	ldx	[%i7 + 0x00], %g3
	ldx	[%i7 + 0x08], %g4
	ldx	[%i7 + 0x10], %g5
	ldx	[%i7 + 0x18], %g6
	ldx	[%i7 + 0x20], %g7
	ldx	[%i7 + 0x28], %o0
	ldx	[%i7 + 0x30], %o1
	ldx	[%i7 + 0x38], %o2
	ldx	[%i7 + 0x40], %o3
	ldx	[%i7 + 0x48], %o4
	ldx	[%i7 + 0x50], %o5
	ldx	[%i7 + 0x58], %o6
	ldx	[%i7 + 0x60], %o7
	ldx	[%i7 + 0x68], %l0
	ldx	[%i7 + 0x70], %l1
	ldx	[%i7 + 0x78], %l2
	ldx	[%i7 + 0x80], %l3
	ldx	[%i7 + 0x88], %l4
	ldx	[%i7 + 0x90], %l5
	ldx	[%i7 + 0x98], %l6
	ldx	[%i7 + 0xa0], %l7
	ldx	[%i7 + 0xa8], %i0
	ldx	[%i7 + 0xb0], %i1
	ldx	[%i7 + 0xb8], %i2
	ldx	[%i7 + 0xc0], %i3
	ldx	[%i7 + 0xc8], %i4
	ldx	[%i7 + 0xd0], %i5
	ldx	[%i7 + 0xd8], %i6
	ldx	[%i7 + 0xe0], %i7
	done

attr_data {
	Name=.HPTRAPS_EXT_SECT,
	hypervisor
}

.data
/* include register_init.out */	
Thr0_trap_occurence_cnt_begin:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
Thr1_trap_occurence_cnt_begin:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
Thr2_trap_occurence_cnt_begin:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
Thr3_trap_occurence_cnt_begin:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
Thr4_trap_occurence_cnt_begin:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
Thr5_trap_occurence_cnt_begin:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
Thr6_trap_occurence_cnt_begin:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
Thr7_trap_occurence_cnt_begin:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
.align 32
.global Thr0_register_initial_values
Thr0_register_initial_values:
	.xword	0x000000ea4000
	.xword	0x000000ea5fc0
	.xword	0x000006140000
	.xword	0x00000614ffc0
	.xword	0x00018ec00000
	.xword	0x00018effffc0
	.xword	0x000000ec2000
	.xword	0x000000ec3fc0
	.xword	0x000006b80000
	.xword	0x000006b8ffc0
	.xword	0x000000e68000
	.xword	0x000000e69fc0
	.xword	0x000000fb4000
	.xword	0x000000fb5fc0
	.xword	0x000000e6c000
	.xword	0x000000e6dfc0
	.xword	0x000000e04000
	.xword	0x000000e05fc0
	.xword	0x000000e5c000
	.xword	0x000000e5dfc0
	.xword	0x000000e90000
	.xword	0x000000e91fc0
	.xword	0x000000e54000
	.xword	0x000000e55fc0
	.xword	0x0000064b0000
	.xword	0x0000064bffc0
	.xword	0x000000f4e000
	.xword	0x000000f4ffc0
	.xword	0x000000f5a000
	.xword	0x000000f5bfc0
Thr1_register_initial_values:
	.xword	0x000006b00000
	.xword	0x000006b0ffc0
	.xword	0x000000e34000
	.xword	0x000000e35fc0
	.xword	0x000000f02000
	.xword	0x000000f03fc0
	.xword	0x0001ad800000
	.xword	0x0001adbfffc0
	.xword	0x000006ad0000
	.xword	0x000006adffc0
	.xword	0x0000067c0000
	.xword	0x0000067cffc0
	.xword	0x000000e88000
	.xword	0x000000e89fc0
	.xword	0x000000fea000
	.xword	0x000000febfc0
	.xword	0x000000f76000
	.xword	0x000000f77fc0
	.xword	0x000006320000
	.xword	0x00000632ffc0
	.xword	0x000006010000
	.xword	0x00000601ffc0
	.xword	0x0001ac400000
	.xword	0x0001ac7fffc0
	.xword	0x0001a7800000
	.xword	0x0001a7bfffc0
	.xword	0x000006020000
	.xword	0x00000602ffc0
	.xword	0x000006510000
	.xword	0x00000651ffc0
Thr2_register_initial_values:
	.xword	0x000000e84000
	.xword	0x000000e85fc0
	.xword	0x000189800000
	.xword	0x000189bfffc0
	.xword	0x000006430000
	.xword	0x00000643ffc0
	.xword	0x000000e74000
	.xword	0x000000e75fc0
	.xword	0x000000f40000
	.xword	0x000000f41fc0
	.xword	0x000000f74000
	.xword	0x000000f75fc0
	.xword	0x000006410000
	.xword	0x00000641ffc0
	.xword	0x000006b50000
	.xword	0x000006b5ffc0
	.xword	0x000000f3c000
	.xword	0x000000f3dfc0
	.xword	0x000006190000
	.xword	0x00000619ffc0
	.xword	0x000193000000
	.xword	0x0001933fffc0
	.xword	0x000000e7e000
	.xword	0x000000e7ffc0
	.xword	0x000000f86000
	.xword	0x000000f87fc0
	.xword	0x000006080000
	.xword	0x00000608ffc0
	.xword	0x000006d50000
	.xword	0x000006d5ffc0
Thr3_register_initial_values:
	.xword	0x0001bb400000
	.xword	0x0001bb7fffc0
	.xword	0x0000061d0000
	.xword	0x0000061dffc0
	.xword	0x0000069e0000
	.xword	0x0000069effc0
	.xword	0x000006100000
	.xword	0x00000610ffc0
	.xword	0x000000faa000
	.xword	0x000000fabfc0
	.xword	0x000006580000
	.xword	0x00000658ffc0
	.xword	0x000185800000
	.xword	0x000185bfffc0
	.xword	0x0001b1000000
	.xword	0x0001b13fffc0
	.xword	0x0001af400000
	.xword	0x0001af7fffc0
	.xword	0x000c50000000
	.xword	0x000c5fffffc0
	.xword	0x000006e60000
	.xword	0x000006e6ffc0
	.xword	0x000000ed8000
	.xword	0x000000ed9fc0
	.xword	0x000006fa0000
	.xword	0x000006faffc0
	.xword	0x000000ef4000
	.xword	0x000000ef5fc0
	.xword	0x000000f5e000
	.xword	0x000000f5ffc0
Thr4_register_initial_values:
	.xword	0x000000e2c000
	.xword	0x000000e2dfc0
	.xword	0x000000e98000
	.xword	0x000000e99fc0
	.xword	0x00019dc00000
	.xword	0x00019dffffc0
	.xword	0x000000f38000
	.xword	0x000000f39fc0
	.xword	0x0001b9c00000
	.xword	0x0001b9ffffc0
	.xword	0x000000f8a000
	.xword	0x000000f8bfc0
	.xword	0x0001aa000000
	.xword	0x0001aa3fffc0
	.xword	0x000000eda000
	.xword	0x000000edbfc0
	.xword	0x000c00000000
	.xword	0x000c0fffffc0
	.xword	0x000006ca0000
	.xword	0x000006caffc0
	.xword	0x000006770000
	.xword	0x00000677ffc0
	.xword	0x000000f96000
	.xword	0x000000f97fc0
	.xword	0x000006df0000
	.xword	0x000006dfffc0
	.xword	0x000000eee000
	.xword	0x000000eeffc0
	.xword	0x000006ab0000
	.xword	0x000006abffc0
Thr5_register_initial_values:
	.xword	0x000000f2e000
	.xword	0x000000f2ffc0
	.xword	0x000000f88000
	.xword	0x000000f89fc0
	.xword	0x000000e6a000
	.xword	0x000000e6bfc0
	.xword	0x000000e66000
	.xword	0x000000e67fc0
	.xword	0x000191c00000
	.xword	0x000191ffffc0
	.xword	0x000000e9c000
	.xword	0x000000e9dfc0
	.xword	0x00018fc00000
	.xword	0x00018fffffc0
	.xword	0x000000e38000
	.xword	0x000000e39fc0
	.xword	0x000000fc2000
	.xword	0x000000fc3fc0
	.xword	0x000006590000
	.xword	0x00000659ffc0
	.xword	0x000000eb8000
	.xword	0x000000eb9fc0
	.xword	0x000000f52000
	.xword	0x000000f53fc0
	.xword	0x000000ed0000
	.xword	0x000000ed1fc0
	.xword	0x000000e94000
	.xword	0x000000e95fc0
	.xword	0x0001a6800000
	.xword	0x0001a6bfffc0
Thr6_register_initial_values:
	.xword	0x000000fc0000
	.xword	0x000000fc1fc0
	.xword	0x000006030000
	.xword	0x00000603ffc0
	.xword	0x000000f36000
	.xword	0x000000f37fc0
	.xword	0x0000065f0000
	.xword	0x0000065fffc0
	.xword	0x000000e2a000
	.xword	0x000000e2bfc0
	.xword	0x000006cd0000
	.xword	0x000006cdffc0
	.xword	0x000c40000000
	.xword	0x000c4fffffc0
	.xword	0x000000ede000
	.xword	0x000000edffc0
	.xword	0x0001bc800000
	.xword	0x0001bcbfffc0
	.xword	0x0000066c0000
	.xword	0x0000066cffc0
	.xword	0x000000f30000
	.xword	0x000000f31fc0
	.xword	0x000006350000
	.xword	0x00000635ffc0
	.xword	0x000000f58000
	.xword	0x000000f59fc0
	.xword	0x0000062a0000
	.xword	0x0000062affc0
	.xword	0x000000ff8000
	.xword	0x000000ff9fc0
Thr7_register_initial_values:
	.xword	0x000000e02000
	.xword	0x000000e03fc0
	.xword	0x0001b8000000
	.xword	0x0001b83fffc0
	.xword	0x000000e3c000
	.xword	0x000000e3dfc0
	.xword	0x000000f5c000
	.xword	0x000000f5dfc0
	.xword	0x0001a7400000
	.xword	0x0001a77fffc0
	.xword	0x000000e28000
	.xword	0x000000e29fc0
	.xword	0x000006db0000
	.xword	0x000006dbffc0
	.xword	0x000000f7a000
	.xword	0x000000f7bfc0
	.xword	0x000195800000
	.xword	0x000195bfffc0
	.xword	0x000006fc0000
	.xword	0x000006fcffc0
	.xword	0x000006060000
	.xword	0x00000606ffc0
	.xword	0x000eb0000000
	.xword	0x000ebfffffc0
	.xword	0x000006340000
	.xword	0x00000634ffc0
	.xword	0x00018b400000
	.xword	0x00018b7fffc0
	.xword	0x000184400000
	.xword	0x0001847fffc0
/*********************************************************************/
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x0001000000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000001000000 ,/* 0x00001873ffc0 */
	RA = 0x0003000000 ,
	PA = 0x0023000000 ,
	TTE_Context = 0x07b6 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr0_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
.global Thr0_User_Text_4v000_text_begin
Thr0_User_Text_4v000_text_begin:
	setx	Thr0_User_Data_4v100_data_begin, %l0, %l1
	ldx	[%l1 + 0], %l2	! %l2 = tag
	ldx	[%l1 + 8], %l3	! %l3 = data
	or   	%g0, 31, %l4	! %l4 = loop count 
	sethi	8, %l5		! %l5 = 8K increment
	or	%l3, %g0, %l6	! %l6 = start RA
	or	%g0, %l1, %l7
Thr0_write_tsb_loop:	
	add	%l6, %l5, %l6	! %l6 = new RA
	add	%l7, 16, %l7	! %l7 = offset to TSB
	stx	%l2, [%l7]
	stx	%l6, [%l7 + 8]
	sub	%l4, 1, %l4
	brnz	%l4, Thr0_write_tsb_loop
	nop
	
	!setx	test_code, %g1, %g2
	!jmpl	%g2, %o1
	!add	%o1, 8, %o1
	
	setx	0x81c24000, %i0, %i1	! %i1 = jmp  %o1
	setx	0x01000000, %i0, %i2	! %i2 = nop
	setx	Thr0_User_Data_4v101_data_begin, %i0, %i3
	or	%g0, 31, %i4		! %i4 = loop count
	or	%g0, %i3, %i5		! %i5 = initial target addr
Thr0_write_jmp_loop:	
	add	%i5, %l5, %i5		! %i5 = new target addr of jmpl
	stuw	%i1, [%i5]
	stuw	%i2, [%i5 + 4]
	sub	%i4, 1, %i4
	brnz	%i4, Thr0_write_jmp_loop
	nop

	or	%g0, 31, %i4
	setx	Thr0_User_Text_4v000_text_begin, %i0, %i7
Thr0_jmp_loop:	
	add	%i7, %l5, %i7
	jmpl	%i7, %o1
	add	%o1, 8, %o1
	sub	%i4, 1, %i4
	brnz	%i4, Thr0_jmp_loop
	nop
	
	EXIT_GOOD
	nop
	nop
test_code:
	jmp	%o1
	nop
Thr0_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v100 DATA_VA=0x0003000000
attr_data {
	Name = .Thr0_User_Data_4v100 ,
	VA = 0x000003000000 ,/* 0x0000000f1fc0 */
	RA = 0x0001220000 ,
	PA = 0x0001220000 ,
	TTE_Context = 0x07b6 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	tsbonly ,
	}
.data
.global Thr0_User_Data_4v100_data_begin
Thr0_User_Data_4v100_data_begin:
	.word	0x1234
Thr0_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v101 DATA_VA=0x0033000000
attr_data {
	Name = .Thr0_User_Data_4v101 ,
	VA = 0x000033000000 ,/* 0x0000000f1fc0 */
	RA = 0x0023000000 ,
	PA = 0x0023000000 ,
	TTE_Context = 0x07b6 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	tsbonly ,
	}
.data
.global Thr0_User_Data_4v101_data_begin
Thr0_User_Data_4v101_data_begin:
	.word	0x1234
Thr0_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x0001000000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	thr1_nz_ctx_tsb_2 ,
	VA = 0x000001000000 ,/* 0x00001873ffc0 */
	RA = 0x0003000000 ,
	PA = 0x0043000000 ,
	TTE_Context = 0x0e94 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr1_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr1_user_code_entry
Thr1_user_code_entry:
.global Thr1_User_Text_4v000_text_begin
Thr1_User_Text_4v000_text_begin:
	setx	Thr1_User_Data_4v100_data_begin, %l0, %l1
	ldx	[%l1 + 0], %l2	! %l2 = tag
	ldx	[%l1 + 8], %l3	! %l3 = data
	or   	%g0, 31, %l4	! %l4 = loop count 
	sethi	8, %l5		! %l5 = 8K increment
	or	%l3, %g0, %l6	! %l6 = start RA
	or	%g0, %l1, %l7
Thr1_write_tsb_loop:	
	add	%l6, %l5, %l6	! %l6 = new RA
	add	%l7, 16, %l7	! %l7 = offset to TSB
	stx	%l2, [%l7]
	stx	%l6, [%l7 + 8]
	sub	%l4, 1, %l4
	brnz	%l4, Thr1_write_tsb_loop
	nop
	
	setx	0x81c24000, %i0, %i1	! %i1 = jmp  %o1
	setx	0x01000000, %i0, %i2	! %i2 = nop
	setx	Thr1_User_Data_4v101_data_begin, %i0, %i3
	or	%g0, 31, %i4		! %i4 = loop count
	or	%g0, %i3, %i5		! %i5 = initial target addr
Thr1_write_jmp_loop:	
	add	%i5, %l5, %i5		! %i5 = new target addr of jmpl
	stuw	%i1, [%i5]
	stuw	%i2, [%i5 + 4]
	sub	%i4, 1, %i4
	brnz	%i4, Thr1_write_jmp_loop
	nop

	or	%g0, 31, %i4
	setx	Thr1_User_Text_4v000_text_begin, %i0, %i7
Thr1_jmp_loop:	
	add	%i7, %l5, %i7
	jmpl	%i7, %o1
	add	%o1, 8, %o1
	sub	%i4, 1, %i4
	brnz	%i4, Thr1_jmp_loop
	nop
	
	EXIT_GOOD

Thr1_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v100 DATA_VA=0x0003000000
attr_data {
	Name = .Thr1_User_Data_4v100 ,
	VA = 0x000003000000 ,/* 0x0000000f1fc0 */
	RA = 0x0001260000 ,
	PA = 0x0001260000 ,
	TTE_Context = 0x0e94 ,
	thr1_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	tsbonly ,
	}
.data
.global Thr1_User_Data_4v100_data_begin
Thr1_User_Data_4v100_data_begin:
	.word	0x1234
Thr1_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v101 DATA_VA=0x0033000000
attr_data {
	Name = .Thr1_User_Data_4v101 ,
	VA = 0x000033000000 ,/* 0x0000000f1fc0 */
	RA = 0x0043000000 ,
	PA = 0x0043000000 ,
	TTE_Context = 0x0e94 ,
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	tsbonly ,
	}
.data
.global Thr1_User_Data_4v101_data_begin
Thr1_User_Data_4v101_data_begin:
	.word	0x1234
Thr1_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x0001000000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x000001000000 ,/* 0x00001873ffc0 */
	RA = 0x0003000000 ,
	PA = 0x0063000000 ,
	TTE_Context = 0x032c ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr2_user_code_entry
Thr2_user_code_entry:
.global Thr2_User_Text_4v000_text_begin
Thr2_User_Text_4v000_text_begin:
	setx	Thr2_User_Data_4v100_data_begin, %l0, %l1
	ldx	[%l1 + 0], %l2	! %l2 = tag
	ldx	[%l1 + 8], %l3	! %l3 = data
	or   	%g0, 31, %l4	! %l4 = loop count 
	sethi	8, %l5		! %l5 = 8K increment
	or	%l3, %g0, %l6	! %l6 = start RA
	or	%g0, %l1, %l7
Thr2_write_tsb_loop:	
	add	%l6, %l5, %l6	! %l6 = new RA
	add	%l7, 16, %l7	! %l7 = offset to TSB
	stx	%l2, [%l7]
	stx	%l6, [%l7 + 8]
	sub	%l4, 1, %l4
	brnz	%l4, Thr2_write_tsb_loop
	nop
	
	setx	0x81c24000, %i0, %i1	! %i1 = jmp  %o1
	setx	0x01000000, %i0, %i2	! %i2 = nop
	setx	Thr2_User_Data_4v101_data_begin, %i0, %i3
	or	%g0, 31, %i4		! %i4 = loop count
	or	%g0, %i3, %i5		! %i5 = initial target addr
Thr2_write_jmp_loop:	
	add	%i5, %l5, %i5		! %i5 = new target addr of jmpl
	stuw	%i1, [%i5]
	stuw	%i2, [%i5 + 4]
	sub	%i4, 1, %i4
	brnz	%i4, Thr2_write_jmp_loop
	nop

	or	%g0, 31, %i4
	setx	Thr2_User_Text_4v000_text_begin, %i0, %i7
Thr2_jmp_loop:	
	add	%i7, %l5, %i7
	jmpl	%i7, %o1
	add	%o1, 8, %o1
	sub	%i4, 1, %i4
	brnz	%i4, Thr2_jmp_loop
	nop
	
	EXIT_GOOD

Thr2_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v100 DATA_VA=0x0003000000
attr_data {
	Name = .Thr2_User_Data_4v100 ,
	VA = 0x000003000000 ,/* 0x0000000f1fc0 */
	RA = 0x00012a0000 ,
	PA = 0x00012a0000 ,
	TTE_Context = 0x032c ,
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	tsbonly ,
	}
.data
.global Thr2_User_Data_4v100_data_begin
Thr2_User_Data_4v100_data_begin:
	.word	0x1234
Thr2_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v101 DATA_VA=0x0033000000
attr_data {
	Name = .Thr2_User_Data_4v101 ,
	VA = 0x000033000000 ,/* 0x0000000f1fc0 */
	RA = 0x0063000000 ,
	PA = 0x0063000000 ,
	TTE_Context = 0x032c ,
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	tsbonly ,
	}
.data
.global Thr2_User_Data_4v101_data_begin
Thr2_User_Data_4v101_data_begin:
	.word	0x1234
Thr2_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x0001000000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x000001000000 ,/* 0x00001873ffc0 */
	RA = 0x0003000000 ,
	PA = 0x0083000000 ,
	TTE_Context = 0x12fb ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr3_user_code_entry
Thr3_user_code_entry:
.global Thr3_User_Text_4v000_text_begin
Thr3_User_Text_4v000_text_begin:
	setx	Thr3_User_Data_4v100_data_begin, %l0, %l1
	ldx	[%l1 + 0], %l2	! %l2 = tag
	ldx	[%l1 + 8], %l3	! %l3 = data
	or   	%g0, 31, %l4	! %l4 = loop count 
	sethi	8, %l5		! %l5 = 8K increment
	or	%l3, %g0, %l6	! %l6 = start RA
	or	%g0, %l1, %l7
Thr3_write_tsb_loop:	
	add	%l6, %l5, %l6	! %l6 = new RA
	add	%l7, 16, %l7	! %l7 = offset to TSB
	stx	%l2, [%l7]
	stx	%l6, [%l7 + 8]
	sub	%l4, 1, %l4
	brnz	%l4, Thr3_write_tsb_loop
	nop
	
	setx	0x81c24000, %i0, %i1	! %i1 = jmp  %o1
	setx	0x01000000, %i0, %i2	! %i2 = nop
	setx	Thr3_User_Data_4v101_data_begin, %i0, %i3
	or	%g0, 31, %i4		! %i4 = loop count
	or	%g0, %i3, %i5		! %i5 = initial target addr
Thr3_write_jmp_loop:	
	add	%i5, %l5, %i5		! %i5 = new target addr of jmpl
	stuw	%i1, [%i5]
	stuw	%i2, [%i5 + 4]
	sub	%i4, 1, %i4
	brnz	%i4, Thr3_write_jmp_loop
	nop

	or	%g0, 31, %i4
	setx	Thr3_User_Text_4v000_text_begin, %i0, %i7
Thr3_jmp_loop:	
	add	%i7, %l5, %i7
	jmpl	%i7, %o1
	add	%o1, 8, %o1
	sub	%i4, 1, %i4
	brnz	%i4, Thr3_jmp_loop
	nop
	
	EXIT_GOOD

Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v100 DATA_VA=0x0003000000
attr_data {
	Name = .Thr3_User_Data_4v100 ,
	VA = 0x000003000000 ,/* 0x0000000f1fc0 */
	RA = 0x00012e0000 ,
	PA = 0x00012e0000 ,
	TTE_Context = 0x12fb ,
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	tsbonly ,
	}
.data
.global Thr3_User_Data_4v100_data_begin
Thr3_User_Data_4v100_data_begin:
	.word	0x1234
Thr3_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v101 DATA_VA=0x0033000000
attr_data {
	Name = .Thr3_User_Data_4v101 ,
	VA = 0x000033000000 ,/* 0x0000000f1fc0 */
	RA = 0x0083000000 ,
	PA = 0x0083000000 ,
	TTE_Context = 0x12fb ,
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	tsbonly ,
	}
.data
.global Thr3_User_Data_4v101_data_begin
Thr3_User_Data_4v101_data_begin:
	.word	0x1234
Thr3_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x0001000000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x000001000000 ,/* 0x00001873ffc0 */
	RA = 0x0003000000 ,
	PA = 0x00a3000000 ,
	TTE_Context = 0x06f9     ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr4_user_code_entry
Thr4_user_code_entry:
.global Thr4_User_Text_4v000_text_begin
Thr4_User_Text_4v000_text_begin:
	setx	Thr4_User_Data_4v100_data_begin, %l0, %l1
	ldx	[%l1 + 0], %l2	! %l2 = tag
	ldx	[%l1 + 8], %l3	! %l3 = data
	or   	%g0, 31, %l4	! %l4 = loop count 
	sethi	8, %l5		! %l5 = 8K increment
	or	%l3, %g0, %l6	! %l6 = start RA
	or	%g0, %l1, %l7
Thr4_write_tsb_loop:	
	add	%l6, %l5, %l6	! %l6 = new RA
	add	%l7, 16, %l7	! %l7 = offset to TSB
	stx	%l2, [%l7]
	stx	%l6, [%l7 + 8]
	sub	%l4, 1, %l4
	brnz	%l4, Thr4_write_tsb_loop
	nop
	
	setx	0x81c24000, %i0, %i1	! %i1 = jmp  %o1
	setx	0x01000000, %i0, %i2	! %i2 = nop
	setx	Thr4_User_Data_4v101_data_begin, %i0, %i3
	or	%g0, 31, %i4		! %i4 = loop count
	or	%g0, %i3, %i5		! %i5 = initial target addr
Thr4_write_jmp_loop:	
	add	%i5, %l5, %i5		! %i5 = new target addr of jmpl
	stuw	%i1, [%i5]
	stuw	%i2, [%i5 + 4]
	sub	%i4, 1, %i4
	brnz	%i4, Thr4_write_jmp_loop
	nop

	or	%g0, 31, %i4
	setx	Thr4_User_Text_4v000_text_begin, %i0, %i7
Thr4_jmp_loop:	
	add	%i7, %l5, %i7
	jmpl	%i7, %o1
	add	%o1, 8, %o1
	sub	%i4, 1, %i4
	brnz	%i4, Thr4_jmp_loop
	nop
	
	EXIT_GOOD

Thr4_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v100 DATA_VA=0x0003000000
attr_data {
	Name = .Thr4_User_Data_4v100 ,
	VA = 0x000003000000 ,/* 0x0000000f1fc0 */
	RA = 0x0001320000 ,
	PA = 0x0001320000 ,
	TTE_Context = 0x06f9     ,
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	tsbonly ,
	}
.data
.global Thr4_User_Data_4v100_data_begin
Thr4_User_Data_4v100_data_begin:
	.word	0x1234
Thr4_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v101 DATA_VA=0x0033000000
attr_data {
	Name = .Thr4_User_Data_4v101 ,
	VA = 0x000033000000 ,/* 0x0000000f1fc0 */
	RA = 0x00a3000000 ,
	PA = 0x00a3000000 ,
	TTE_Context = 0x06f9     ,
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	tsbonly ,
	}
.data
.global Thr4_User_Data_4v101_data_begin
Thr4_User_Data_4v101_data_begin:
	.word	0x1234
Thr4_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x0001000000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x000001000000 ,/* 0x00001873ffc0 */
	RA = 0x0003000000 ,
	PA = 0x00c3000000 ,
	TTE_Context = 0x11c9         ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr5_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr5_user_code_entry
Thr5_user_code_entry:
.global Thr5_User_Text_4v000_text_begin
Thr5_User_Text_4v000_text_begin:
	setx	Thr5_User_Data_4v100_data_begin, %l0, %l1
	ldx	[%l1 + 0], %l2	! %l2 = tag
	ldx	[%l1 + 8], %l3	! %l3 = data
	or   	%g0, 31, %l4	! %l4 = loop count 
	sethi	8, %l5		! %l5 = 8K increment
	or	%l3, %g0, %l6	! %l6 = start RA
	or	%g0, %l1, %l7
Thr5_write_tsb_loop:	
	add	%l6, %l5, %l6	! %l6 = new RA
	add	%l7, 16, %l7	! %l7 = offset to TSB
	stx	%l2, [%l7]
	stx	%l6, [%l7 + 8]
	sub	%l4, 1, %l4
	brnz	%l4, Thr5_write_tsb_loop
	nop
	
	setx	0x81c24000, %i0, %i1	! %i1 = jmp  %o1
	setx	0x01000000, %i0, %i2	! %i2 = nop
	setx	Thr5_User_Data_4v101_data_begin, %i0, %i3
	or	%g0, 31, %i4		! %i4 = loop count
	or	%g0, %i3, %i5		! %i5 = initial target addr
Thr5_write_jmp_loop:	
	add	%i5, %l5, %i5		! %i5 = new target addr of jmpl
	stuw	%i1, [%i5]
	stuw	%i2, [%i5 + 4]
	sub	%i4, 1, %i4
	brnz	%i4, Thr5_write_jmp_loop
	nop

	or	%g0, 31, %i4
	setx	Thr5_User_Text_4v000_text_begin, %i0, %i7
Thr5_jmp_loop:	
	add	%i7, %l5, %i7
	jmpl	%i7, %o1
	add	%o1, 8, %o1
	sub	%i4, 1, %i4
	brnz	%i4, Thr5_jmp_loop
	nop
.global Thr5_trap_checkpoint
Thr5_trap_checkpoint:	
	setx	Thr5_trap_checkpoint, %l0, %i7	
	EXIT_GOOD

Thr5_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v100 DATA_VA=0x0003000000
attr_data {
	Name = .Thr5_User_Data_4v100 ,
	VA = 0x000003000000 ,/* 0x0000000f1fc0 */
	RA = 0x0001360000 ,
	PA = 0x0001360000 ,
	TTE_Context = 0x11c9 ,
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	tsbonly ,
	}
.data
.global Thr5_User_Data_4v100_data_begin
Thr5_User_Data_4v100_data_begin:
	.word	0x1234
Thr5_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v101 DATA_VA=0x0033000000
attr_data {
	Name = .Thr5_User_Data_4v101 ,
	VA = 0x000033000000 ,/* 0x0000000f1fc0 */
	RA = 0x00c3000000 ,
	PA = 0x00c3000000 ,
	TTE_Context = 0x11c9 ,
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	tsbonly ,
	}
.data
.global Thr5_User_Data_4v101_data_begin
Thr5_User_Data_4v101_data_begin:
	.word	0x1234
Thr5_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v000 TEXT_VA=0x0001000000
attr_text {
	Name = .Thr6_User_Text_4v000 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x000001000000 ,/* 0x00001873ffc0 */
	RA = 0x0003000000 ,
	PA = 0x00e3000000 ,
	TTE_Context = 0x0d7e ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr6_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr6_user_code_entry
Thr6_user_code_entry:
.global Thr6_User_Text_4v000_text_begin
Thr6_User_Text_4v000_text_begin:
	setx	Thr6_User_Data_4v100_data_begin, %l0, %l1
	ldx	[%l1 + 0], %l2	! %l2 = tag
	ldx	[%l1 + 8], %l3	! %l3 = data
	or   	%g0, 31, %l4	! %l4 = loop count 
	sethi	8, %l5		! %l5 = 8K increment
	or	%l3, %g0, %l6	! %l6 = start RA
	or	%g0, %l1, %l7
Thr6_write_tsb_loop:	
	add	%l6, %l5, %l6	! %l6 = new RA
	add	%l7, 16, %l7	! %l7 = offset to TSB
	stx	%l2, [%l7]
	stx	%l6, [%l7 + 8]
	sub	%l4, 1, %l4
	brnz	%l4, Thr6_write_tsb_loop
	nop
	
	setx	0x81c24000, %i0, %i1	! %i1 = jmp  %o1
	setx	0x01000000, %i0, %i2	! %i2 = nop
	setx	Thr6_User_Data_4v101_data_begin, %i0, %i3
	or	%g0, 31, %i4		! %i4 = loop count
	or	%g0, %i3, %i5		! %i5 = initial target addr
Thr6_write_jmp_loop:	
	add	%i5, %l5, %i5		! %i5 = new target addr of jmpl
	stuw	%i1, [%i5]
	stuw	%i2, [%i5 + 4]
	sub	%i4, 1, %i4
	brnz	%i4, Thr6_write_jmp_loop
	nop

	or	%g0, 31, %i4
	setx	Thr6_User_Text_4v000_text_begin, %i0, %i7
Thr6_jmp_loop:	
	add	%i7, %l5, %i7
	jmpl	%i7, %o1
	add	%o1, 8, %o1
	sub	%i4, 1, %i4
	brnz	%i4, Thr6_jmp_loop
	nop
	
	EXIT_GOOD

Thr6_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v100 DATA_VA=0x0003000000
attr_data {
	Name = .Thr6_User_Data_4v100 ,
	VA = 0x000003000000 ,/* 0x0000000f1fc0 */
	RA = 0x00013a0000 ,
	PA = 0x00013a0000 ,
	TTE_Context = 0x0d7e ,
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	tsbonly ,
	}
.data
.global Thr6_User_Data_4v100_data_begin
Thr6_User_Data_4v100_data_begin:
	.word	0x1234
Thr6_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v101 DATA_VA=0x0033000000
attr_data {
	Name = .Thr6_User_Data_4v101 ,
	VA = 0x000033000000 ,/* 0x0000000f1fc0 */
	RA = 0x00e3000000 ,
	PA = 0x00e3000000 ,
	TTE_Context = 0x0d7e ,
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	tsbonly ,
	}
.data
.global Thr6_User_Data_4v101_data_begin
Thr6_User_Data_4v101_data_begin:
	.word	0x1234
Thr6_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x0001000000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x000001000000 ,/* 0x00001873ffc0 */
	RA = 0x0003000000 ,
	PA = 0x0103000000 ,
	TTE_Context = 0x1aee ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr7_user_code_entry
Thr7_user_code_entry:
.global Thr7_User_Text_4v000_text_begin
Thr7_User_Text_4v000_text_begin:
	setx	Thr7_User_Data_4v100_data_begin, %l0, %l1
	ldx	[%l1 + 0], %l2	! %l2 = tag
	ldx	[%l1 + 8], %l3	! %l3 = data
	or   	%g0, 31, %l4	! %l4 = loop count 
	sethi	8, %l5		! %l5 = 8K increment
	or	%l3, %g0, %l6	! %l6 = start RA
	or	%g0, %l1, %l7
Thr7_write_tsb_loop:	
	add	%l6, %l5, %l6	! %l6 = new RA
	add	%l7, 16, %l7	! %l7 = offset to TSB
	stx	%l2, [%l7]
	stx	%l6, [%l7 + 8]
	sub	%l4, 1, %l4
	brnz	%l4, Thr7_write_tsb_loop
	nop
	
	setx	0x81c24000, %i0, %i1	! %i1 = jmp  %o1
	setx	0x01000000, %i0, %i2	! %i2 = nop
	setx	Thr7_User_Data_4v101_data_begin, %i0, %i3
	or	%g0, 31, %i4		! %i4 = loop count
	or	%g0, %i3, %i5		! %i5 = initial target addr
Thr7_write_jmp_loop:	
	add	%i5, %l5, %i5		! %i5 = new target addr of jmpl
	stuw	%i1, [%i5]
	stuw	%i2, [%i5 + 4]
	sub	%i4, 1, %i4
	brnz	%i4, Thr7_write_jmp_loop
	nop

	or	%g0, 31, %i4
	setx	Thr7_User_Text_4v000_text_begin, %i0, %i7
Thr7_jmp_loop:	
	add	%i7, %l5, %i7
	jmpl	%i7, %o1
	add	%o1, 8, %o1
	sub	%i4, 1, %i4
	brnz	%i4, Thr7_jmp_loop
	nop
	
	EXIT_GOOD

Thr7_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v100 DATA_VA=0x0003000000
attr_data {
	Name = .Thr7_User_Data_4v100 ,
	VA = 0x000003000000 ,/* 0x0000000f1fc0 */
	RA = 0x00013e0000 ,
	PA = 0x00013e0000 ,
	TTE_Context = 0x1aee ,
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	tsbonly ,
	}
.data
.global Thr7_User_Data_4v100_data_begin
Thr7_User_Data_4v100_data_begin:
	.word	0x1234
Thr7_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v101 DATA_VA=0x0033000000
attr_data {
	Name = .Thr7_User_Data_4v101 ,
	VA = 0x000033000000 ,/* 0x0000000f1fc0 */
	RA = 0x0103000000 ,
	PA = 0x0103000000 ,
	TTE_Context = 0x1aee ,
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	tsbonly ,
	}
.data
.global Thr7_User_Data_4v101_data_begin
Thr7_User_Data_4v101_data_begin:
	.word	0x1234
Thr7_User_Data_4v101_data_end:
