/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_st_unsupport_psize.s
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
#define THR0_NZ_CTX_TSB_CONFIG_2 0xa000000001220100
#define THR0_NZ_CTX_TSB_CONFIG_3 0x8000000001230010
#define THR1_Z_CTX_TSB_CONFIG_0  0x8000000001040010
#define THR1_Z_CTX_TSB_CONFIG_1  0xa000000001050030
#define THR1_Z_CTX_TSB_CONFIG_2  0x8000000001060050
#define THR1_Z_CTX_TSB_CONFIG_3  0xa000000001070100
#define THR1_NZ_CTX_TSB_CONFIG_0 0x8000000001240000
#define THR1_NZ_CTX_TSB_CONFIG_1 0x8000000001250110
#define THR1_NZ_CTX_TSB_CONFIG_2 0x8000000001260030
#define THR1_NZ_CTX_TSB_CONFIG_3 0xa000000001270150
#define THR2_Z_CTX_TSB_CONFIG_0  0xa000000001080030
#define THR2_Z_CTX_TSB_CONFIG_1  0xc000000001090150
#define THR2_Z_CTX_TSB_CONFIG_2  0xc0000000010a0100
#define THR2_Z_CTX_TSB_CONFIG_3  0x80000000010b0010
#define THR2_NZ_CTX_TSB_CONFIG_0 0xc000000001280150
#define THR2_NZ_CTX_TSB_CONFIG_1 0xc000000001290100
#define THR2_NZ_CTX_TSB_CONFIG_2 0xc0000000012a0110
#define THR2_NZ_CTX_TSB_CONFIG_3 0x80000000012b0130
#define THR3_Z_CTX_TSB_CONFIG_0  0xc0000000010c0130
#define THR3_Z_CTX_TSB_CONFIG_1  0xa0000000010d0150
#define THR3_Z_CTX_TSB_CONFIG_2  0xc0000000010e0100
#define THR3_Z_CTX_TSB_CONFIG_3  0xc0000000010f0110
#define THR3_NZ_CTX_TSB_CONFIG_0 0xc0000000012c0050
#define THR3_NZ_CTX_TSB_CONFIG_1 0xa0000000012d0000
#define THR3_NZ_CTX_TSB_CONFIG_2 0xc0000000012e0110
#define THR3_NZ_CTX_TSB_CONFIG_3 0xc0000000012f0030
#define THR4_Z_CTX_TSB_CONFIG_0  0x8000000001100050
#define THR4_Z_CTX_TSB_CONFIG_1  0x8000000001110100
#define THR4_Z_CTX_TSB_CONFIG_2  0x8000000001120010
#define THR4_Z_CTX_TSB_CONFIG_3  0x8000000001130130
#define THR4_NZ_CTX_TSB_CONFIG_0 0xc000000001300050
#define THR4_NZ_CTX_TSB_CONFIG_1 0x8000000001310000
#define THR4_NZ_CTX_TSB_CONFIG_2 0x8000000001320110
#define THR4_NZ_CTX_TSB_CONFIG_3 0xa000000001330130
#define THR5_Z_CTX_TSB_CONFIG_0  0xc000000001140050
#define THR5_Z_CTX_TSB_CONFIG_1  0x8000000001150100
#define THR5_Z_CTX_TSB_CONFIG_2  0xa000000001160110
#define THR5_Z_CTX_TSB_CONFIG_3  0x8000000001170030
#define THR5_NZ_CTX_TSB_CONFIG_0 0x8000000001340100
#define THR5_NZ_CTX_TSB_CONFIG_1 0x8000000001350110
#define THR5_NZ_CTX_TSB_CONFIG_2 0x8000000001360030
#define THR5_NZ_CTX_TSB_CONFIG_3 0x8000000001370050
#define THR6_Z_CTX_TSB_CONFIG_0  0x8000000001180150
#define THR6_Z_CTX_TSB_CONFIG_1  0xc000000001190100
#define THR6_Z_CTX_TSB_CONFIG_2  0x80000000011a0110
#define THR6_Z_CTX_TSB_CONFIG_3  0xa0000000011b0030
#define THR6_NZ_CTX_TSB_CONFIG_0 0xc000000001380130
#define THR6_NZ_CTX_TSB_CONFIG_1 0x8000000001390050
#define THR6_NZ_CTX_TSB_CONFIG_2 0xa0000000013a0000
#define THR6_NZ_CTX_TSB_CONFIG_3 0xc0000000013b0010
#define THR7_Z_CTX_TSB_CONFIG_0  0xc0000000011c0010
#define THR7_Z_CTX_TSB_CONFIG_1  0xa0000000011d0030
#define THR7_Z_CTX_TSB_CONFIG_2  0xa0000000011e0150
#define THR7_Z_CTX_TSB_CONFIG_3  0x80000000011f0100
#define THR7_NZ_CTX_TSB_CONFIG_0 0x80000000013c0130
#define THR7_NZ_CTX_TSB_CONFIG_1 0x80000000013d0150
#define THR7_NZ_CTX_TSB_CONFIG_2 0x80000000013e0000
#define THR7_NZ_CTX_TSB_CONFIG_3 0x80000000013f0010
#else
#define THR0_Z_CTX_TSB_CONFIG_0  0x4000000001000010
#define THR0_Z_CTX_TSB_CONFIG_1  0x2000000001010030
#define THR0_Z_CTX_TSB_CONFIG_2  0x2000000001020150
#define THR0_Z_CTX_TSB_CONFIG_3  0x0000000001030000
#define THR0_NZ_CTX_TSB_CONFIG_0 0x0000000001200030
#define THR0_NZ_CTX_TSB_CONFIG_1 0x0000000001210150
#define THR0_NZ_CTX_TSB_CONFIG_2 0x2000000001220100
#define THR0_NZ_CTX_TSB_CONFIG_3 0x0000000001230010
#define THR1_Z_CTX_TSB_CONFIG_0  0x0000000001040010
#define THR1_Z_CTX_TSB_CONFIG_1  0x2000000001050030
#define THR1_Z_CTX_TSB_CONFIG_2  0x0000000001060050
#define THR1_Z_CTX_TSB_CONFIG_3  0x2000000001070100
#define THR1_NZ_CTX_TSB_CONFIG_0 0x0000000001240000
#define THR1_NZ_CTX_TSB_CONFIG_1 0x0000000001250110
#define THR1_NZ_CTX_TSB_CONFIG_2 0x0000000001260030
#define THR1_NZ_CTX_TSB_CONFIG_3 0x2000000001270150
#define THR2_Z_CTX_TSB_CONFIG_0  0x2000000001080030
#define THR2_Z_CTX_TSB_CONFIG_1  0x4000000001090150
#define THR2_Z_CTX_TSB_CONFIG_2  0x40000000010a0100
#define THR2_Z_CTX_TSB_CONFIG_3  0x00000000010b0010
#define THR2_NZ_CTX_TSB_CONFIG_0 0x4000000001280150
#define THR2_NZ_CTX_TSB_CONFIG_1 0x4000000001290100
#define THR2_NZ_CTX_TSB_CONFIG_2 0x40000000012a0110
#define THR2_NZ_CTX_TSB_CONFIG_3 0x00000000012b0130
#define THR3_Z_CTX_TSB_CONFIG_0  0x40000000010c0130
#define THR3_Z_CTX_TSB_CONFIG_1  0x20000000010d0150
#define THR3_Z_CTX_TSB_CONFIG_2  0x40000000010e0100
#define THR3_Z_CTX_TSB_CONFIG_3  0x40000000010f0110
#define THR3_NZ_CTX_TSB_CONFIG_0 0x40000000012c0050
#define THR3_NZ_CTX_TSB_CONFIG_1 0x20000000012d0000
#define THR3_NZ_CTX_TSB_CONFIG_2 0x40000000012e0110
#define THR3_NZ_CTX_TSB_CONFIG_3 0x40000000012f0030
#define THR4_Z_CTX_TSB_CONFIG_0  0x0000000001100050
#define THR4_Z_CTX_TSB_CONFIG_1  0x0000000001110100
#define THR4_Z_CTX_TSB_CONFIG_2  0x0000000001120010
#define THR4_Z_CTX_TSB_CONFIG_3  0x0000000001130130
#define THR4_NZ_CTX_TSB_CONFIG_0 0x4000000001300050
#define THR4_NZ_CTX_TSB_CONFIG_1 0x0000000001310000
#define THR4_NZ_CTX_TSB_CONFIG_2 0x0000000001320110
#define THR4_NZ_CTX_TSB_CONFIG_3 0x2000000001330130
#define THR5_Z_CTX_TSB_CONFIG_0  0x4000000001140050
#define THR5_Z_CTX_TSB_CONFIG_1  0x0000000001150100
#define THR5_Z_CTX_TSB_CONFIG_2  0x2000000001160110
#define THR5_Z_CTX_TSB_CONFIG_3  0x0000000001170030
#define THR5_NZ_CTX_TSB_CONFIG_0 0x0000000001340100
#define THR5_NZ_CTX_TSB_CONFIG_1 0x0000000001350110
#define THR5_NZ_CTX_TSB_CONFIG_2 0x0000000001360030
#define THR5_NZ_CTX_TSB_CONFIG_3 0x0000000001370050
#define THR6_Z_CTX_TSB_CONFIG_0  0x0000000001180150
#define THR6_Z_CTX_TSB_CONFIG_1  0x4000000001190100
#define THR6_Z_CTX_TSB_CONFIG_2  0x00000000011a0110
#define THR6_Z_CTX_TSB_CONFIG_3  0x20000000011b0030
#define THR6_NZ_CTX_TSB_CONFIG_0 0x4000000001380130
#define THR6_NZ_CTX_TSB_CONFIG_1 0x0000000001390050
#define THR6_NZ_CTX_TSB_CONFIG_2 0x20000000013a0000
#define THR6_NZ_CTX_TSB_CONFIG_3 0x40000000013b0010
#define THR7_Z_CTX_TSB_CONFIG_0  0x40000000011c0010
#define THR7_Z_CTX_TSB_CONFIG_1  0x20000000011d0030
#define THR7_Z_CTX_TSB_CONFIG_2  0x20000000011e0150
#define THR7_Z_CTX_TSB_CONFIG_3  0x00000000011f0100
#define THR7_NZ_CTX_TSB_CONFIG_0 0x00000000013c0130
#define THR7_NZ_CTX_TSB_CONFIG_1 0x00000000013d0150
#define THR7_NZ_CTX_TSB_CONFIG_2 0x00000000013e0000
#define THR7_NZ_CTX_TSB_CONFIG_3 0x00000000013f0010
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
#define THR0_PCONTEXT_0 0x15a4
#define THR0_PCONTEXT_1 0x1fab
#define THR0_SCONTEXT_0 0x0533
#define THR0_SCONTEXT_1 0x0fcc
#define THR1_PCONTEXT_0 0x1560
#define THR1_PCONTEXT_1 0x1c4d
#define THR1_SCONTEXT_0 0x1ef6
#define THR1_SCONTEXT_1 0x00b4
#define THR2_PCONTEXT_0 0x036f
#define THR2_PCONTEXT_1 0x090b
#define THR2_SCONTEXT_0 0x18c3
#define THR2_SCONTEXT_1 0x1d05
#define THR3_PCONTEXT_0 0x11ce
#define THR3_PCONTEXT_1 0x1bd0
#define THR3_SCONTEXT_0 0x088a
#define THR3_SCONTEXT_1 0x1939
#define THR4_PCONTEXT_0 0x14c0
#define THR4_PCONTEXT_1 0x0da7
#define THR4_SCONTEXT_0 0x009b
#define THR4_SCONTEXT_1 0x11b7
#define THR5_PCONTEXT_0 0x0b17
#define THR5_PCONTEXT_1 0x05f1
#define THR5_SCONTEXT_0 0x17c5
#define THR5_SCONTEXT_1 0x07bb
#define THR6_PCONTEXT_0 0x1923
#define THR6_PCONTEXT_1 0x0e57
#define THR6_SCONTEXT_0 0x0de5
#define THR6_SCONTEXT_1 0x049c
#define THR7_PCONTEXT_0 0x1392
#define THR7_PCONTEXT_1 0x14c3
#define THR7_SCONTEXT_0 0x0e6f
#define THR7_SCONTEXT_1 0x1ec9
#define THR0_PTRAP_TEXT_VA 0x000008400000
#define THR0_PTRAP_TEXT_RA 0x0036080000
#define THR0_PTRAP_TEXT_PA 0x0036080000
#define THR1_PTRAP_TEXT_VA 0x000008f40000
#define THR1_PTRAP_TEXT_RA 0x0056610000
#define THR1_PTRAP_TEXT_PA 0x0056610000
#define THR2_PTRAP_TEXT_VA 0x000008ce0000
#define THR2_PTRAP_TEXT_RA 0x0076c30000
#define THR2_PTRAP_TEXT_PA 0x0076c30000
#define THR3_PTRAP_TEXT_VA 0x000008b20000
#define THR3_PTRAP_TEXT_RA 0x0016a20000
#define THR3_PTRAP_TEXT_PA 0x0096a20000
#define THR4_PTRAP_TEXT_VA 0x000008060000
#define THR4_PTRAP_TEXT_RA 0x00b6eb0000
#define THR4_PTRAP_TEXT_PA 0x00b6eb0000
#define THR5_PTRAP_TEXT_VA 0x000008fc0000
#define THR5_PTRAP_TEXT_RA 0x0016ba0000
#define THR5_PTRAP_TEXT_PA 0x00d6ba0000
#define THR6_PTRAP_TEXT_VA 0x0000087c0000
#define THR6_PTRAP_TEXT_RA 0x0016850000
#define THR6_PTRAP_TEXT_PA 0x00f6850000
#define THR7_PTRAP_TEXT_VA 0x0000085e0000
#define THR7_PTRAP_TEXT_RA 0x01166e0000
#define THR7_PTRAP_TEXT_PA 0x01166e0000
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
#define SUN4V_MASK                      0x080
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
#define INCR_TSB_SIZE		ta PTRAP_INCR_TSB_SIZE
#define REAL_MEM_LD		ta PTRAP_REAL_MEM_LD
#define REAL_MEM_LD_LITTLE	ta PTRAP_REAL_MEM_LD_LITTLE
#define REAL_MEM_QUAD_LD	ta PTRAP_REAL_MEM_QUAD_LD
#define REAL_MEM_QUAD_LD_LITTLE	ta PTRAP_REAL_MEM_QUAD_LD_LITTLE
#define CLEAR_LSU_IMMU		ta PTRAP_CLEAR_LSU_IMMU
#define CLEAR_LSU_DMMU		ta PTRAP_CLEAR_LSU_DMMU

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
#define PTRAP_INCR_TSB_SIZE     0x22
#define PTRAP_REAL_MEM_LD	0x23
#define PTRAP_REAL_MEM_LD_LITTLE	0x24
#define PTRAP_REAL_MEM_QUAD_LD	0x25
#define PTRAP_REAL_MEM_QUAD_LD_LITTLE	0x26
#define PTRAP_CLEAR_LSU_IMMU	0x27
#define PTRAP_CLEAR_LSU_DMMU	0x28

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
#define HPTRAP_INCR_TSB_SIZE    0x92
#define HPTRAP_CLEAR_LSU_IMMU	0x93
#define HPTRAP_CLEAR_LSU_DMMU	0x94

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
	add	%g4, 0x10, %g4
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
SECTION .Thr0_Priv_Sect TEXT_VA=0x00007d4000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_2
	VA = 0x0000007d4000 ,
	RA = 0x0001036000 ,
	PA = 0x0003036000 ,
	TTE_Context = 0x15a4 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
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
SECTION .Thr1_Priv_Sect TEXT_VA=0x000062a000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_0
	VA = 0x00000062a000 ,
	RA = 0x000506e000 ,
	PA = 0x000506e000 ,
	TTE_Context = 0x1560 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
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
SECTION .Thr2_Priv_Sect TEXT_VA=0x0000614000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_1
	VA = 0x000000614000 ,
	RA = 0x0001186000 ,
	PA = 0x0007186000 ,
	TTE_Context = 0x036f ,
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
SECTION .Thr3_Priv_Sect TEXT_VA=0x0000794000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_1
	VA = 0x000000794000 ,
	RA = 0x00090a8000 ,
	PA = 0x00090a8000 ,
	TTE_Context = 0x11ce ,
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
SECTION .Thr4_Priv_Sect TEXT_VA=0x000064e000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_1
	VA = 0x00000064e000 ,
	RA = 0x000b0b6000 ,
	PA = 0x000b0b6000 ,
	TTE_Context = 0x14c0 ,
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
SECTION .Thr5_Priv_Sect TEXT_VA=0x00006e6000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_0
	VA = 0x0000006e6000 ,
	RA = 0x0001090000 ,
	PA = 0x000d090000 ,
	TTE_Context = 0x0b17 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
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
SECTION .Thr6_Priv_Sect TEXT_VA=0x0000668000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_2
	VA = 0x000000668000 ,
	RA = 0x000f106000 ,
	PA = 0x000f106000 ,
	TTE_Context = 0x1923 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
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
SECTION .Thr7_Priv_Sect TEXT_VA=0x000077c000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x00000077c000 ,
	RA = 0x00110d2000 ,
	PA = 0x00110d2000 ,
	TTE_Context = 0x1392 ,
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
	ta	HPTRAP_INCR_TSB_SIZE	/* 0x122 */
	done
.align 32				/* 0x123 */
	ldxa	[%l1] 0x14, %l2
	done
.align 32				/* 0x124 */
	ldxa	[%l1] 0x1c, %l2
	done
.align 32				/* 0x125 */
	ldda	[%l1] 0x26, %l2
	done
.align 32				/* 0x126 */
	ldda	[%l1] 0x2e, %l2
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_IMMU	/* 0x127 */
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_DMMU	/* 0x128 */
	done
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
	done
.align 32
	ta	HPTRAP_INCR_TSB_SIZE	/* 0x122 */
	done
.align 32				/* 0x123 */
	ldxa	[%l1] 0x14, %l2
	done
.align 32				/* 0x124 */
	ldxa	[%l1] 0x1c, %l2
	done
.align 32				/* 0x125 */
	ldda	[%l1] 0x26, %l2
	done
.align 32				/* 0x126 */
	ldda	[%l1] 0x2e, %l2
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_IMMU	/* 0x127 */
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_DMMU	/* 0x128 */
	done
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
	done
.align 32
	ta	HPTRAP_INCR_TSB_SIZE	/* 0x122 */
	done
.align 32				/* 0x123 */
	ldxa	[%l1] 0x14, %l2
	done
.align 32				/* 0x124 */
	ldxa	[%l1] 0x1c, %l2
	done
.align 32				/* 0x125 */
	ldda	[%l1] 0x26, %l2
	done
.align 32				/* 0x126 */
	ldda	[%l1] 0x2e, %l2
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_IMMU	/* 0x127 */
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_DMMU	/* 0x128 */
	done
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
	done
.align 32
	ta	HPTRAP_INCR_TSB_SIZE	/* 0x122 */
	done
.align 32				/* 0x123 */
	ldxa	[%l1] 0x14, %l2
	done
.align 32				/* 0x124 */
	ldxa	[%l1] 0x1c, %l2
	done
.align 32				/* 0x125 */
	ldda	[%l1] 0x26, %l2
	done
.align 32				/* 0x126 */
	ldda	[%l1] 0x2e, %l2
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_IMMU	/* 0x127 */
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_DMMU	/* 0x128 */
	done
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
	done
.align 32
	ta	HPTRAP_INCR_TSB_SIZE	/* 0x122 */
	done
.align 32				/* 0x123 */
	ldxa	[%l1] 0x14, %l2
	done
.align 32				/* 0x124 */
	ldxa	[%l1] 0x1c, %l2
	done
.align 32				/* 0x125 */
	ldda	[%l1] 0x26, %l2
	done
.align 32				/* 0x126 */
	ldda	[%l1] 0x2e, %l2
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_IMMU	/* 0x127 */
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_DMMU	/* 0x128 */
	done
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
	done
.align 32
	ta	HPTRAP_INCR_TSB_SIZE	/* 0x122 */
	done
.align 32				/* 0x123 */
	ldxa	[%l1] 0x14, %l2
	done
.align 32				/* 0x124 */
	ldxa	[%l1] 0x1c, %l2
	done
.align 32				/* 0x125 */
	ldda	[%l1] 0x26, %l2
	done
.align 32				/* 0x126 */
	ldda	[%l1] 0x2e, %l2
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_IMMU	/* 0x127 */
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_DMMU	/* 0x128 */
	done
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
	done
.align 32
	ta	HPTRAP_INCR_TSB_SIZE	/* 0x122 */
	done
.align 32				/* 0x123 */
	ldxa	[%l1] 0x14, %l2
	done
.align 32				/* 0x124 */
	ldxa	[%l1] 0x1c, %l2
	done
.align 32				/* 0x125 */
	ldda	[%l1] 0x26, %l2
	done
.align 32				/* 0x126 */
	ldda	[%l1] 0x2e, %l2
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_IMMU	/* 0x127 */
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_DMMU	/* 0x128 */
	done
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
	done
.align 32
	ta	HPTRAP_INCR_TSB_SIZE	/* 0x122 */
	done
.align 32				/* 0x123 */
	ldxa	[%l1] 0x14, %l2
	done
.align 32				/* 0x124 */
	ldxa	[%l1] 0x1c, %l2
	done
.align 32				/* 0x125 */
	ldda	[%l1] 0x26, %l2
	done
.align 32				/* 0x126 */
	ldda	[%l1] 0x2e, %l2
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_IMMU	/* 0x127 */
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_DMMU	/* 0x128 */
	done
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
	ta      HP_GOOD_TRAP
.align	32	/* 3c */
	ta      HP_BAD_TRAP
.align	32	/* 3d */
	ta      HP_BAD_TRAP
.align	32	/* 3e */
instruction_real_miss:	
        setx    ext_trap_0x3e_begin, %g1, %g2
        jmp     %g2
        nop
.align	32	/* 3f */
data_real_miss:	
        setx    ext_trap_0x3f_begin, %g1, %g2
        jmp     %g2
        nop
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
hptrap_incr_tsb_size:	
	ta      HP_BAD_TRAP
        !setx    ext_trap_0x192_begin, %g1, %g2
        !jmp     %g2
        !nop
.align	32	/* 193 */
clear_lsu_immu:	
	or	%g0, 0x4, %g1
	ldxa	[%g0] 0x45, %g2
	xor	%g2, %g1, %g3
	stxa	%g3, [%g0] 0x45
	done
.align	32	/* 194 */
clear_lsu_dmmu:	
	or	%g0, 0x8, %g1
	ldxa	[%g0] 0x45, %g2
	xor	%g2, %g1, %g3
	stxa	%g3, [%g0] 0x45
	done
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
	nop
	nop

.align 32
trap_handler_1a1:
.global	bad_trap
bad_trap:
	ba	bad_trap
	nop
	nop
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
.global ext_trap_0x3e_begin
.global ext_trap_0x3f_begin
.global ext_trap_0x64_begin
.global ext_trap_0x68_begin
.global ext_trap_0x6c_begin
.global ext_trap_0x192_begin

ext_trap_0x3e_begin:
ext_trap_0x3f_begin:
	or	%g0, 0x8, %g1
	ldxa	[%g1] 0x21, %g2		! %g2 = PRIMARY_CTX
	or	%g0, 0x30, %g3
	ldxa	[%g3] 0x58, %g1		! %g1 = DMMU_TAG_ACCESS
	srlx	%g1, 13, %g1
	sllx	%g1, 13, %g1
	or	%g1, %g2, %g1		! %g1 = DMMU_TAG_ACCESS with NZ_CTX
	stxa	%g1, [%g3] 0x58		! Update DMMU_TAG_ACCESS
	ldxa	[%g0] 0x58, %g1		! %g1 = DMMU_TAG_TARGET
	or	%g0, 0x30, %g4
	or	%g0, 0x70, %g2
	ldxa	[%g2] 0x54, %g3		! %g3 = DTSB_PTR_0
trap_0x3f_next_tte:	
	ldda	[%g3] ASI_NUCLEUS_QUAD_LDD, %g6		! %g6 = TTE_TAG, %g7 = TTE_DATA
	cmp	%g6, %g1
	bne,a	%xcc, trap_0x3f_next_tsb_ptr
	add	%g2, 8, %g2
	srlx	%g7, 63, %g5
	brz	%g5, trap_0x3f_next_tsb_ptr
	add	%g2, 8, %g2
	ldxa	[%g4] 0x54, %g5		! %g5 = NZ_TSB_CONFIG
	and	%g5, 0x80, %g5
	brz,a	%g5, trap_0x3f_sun4u
	or	%g0, 0x0800, %g5
trap_0x3f_sun4v:
	or	%g0, 0x0c00, %g5
trap_0x3f_sun4u:
	stxa	%g7, [%g5] 0x5c		! Write to DMMU_DATA_IN
	retry
trap_0x3f_next_tsb_ptr:
	add	%g4, 8, %g4
	cmp	%g4, 0x50
	bl,a	%xcc, trap_0x3f_next_tte
	ldxa	[%g2] 0x54, %g3		! %g3 = DTSB_PTR
	done
	
!****************************************************************************************	
ext_trap_0x64_begin:
	ldxa	[%g0] 0x50, %g1		! %g1 = IMMU_TAG_TARGET
	or	%g0, 0x50, %g2		! %g2 points to ITSB_PTR_0
	srlx	%g1, 48, %g3		! %g3 = CTX
	brz,a	%g3, trap_0x64_load_tsb_config
	or	%g0, 0x10, %g3
	or	%g0, 0x30, %g3
trap_0x64_load_tsb_config:	
	ldxa	[%g3] 0x54, %g4		! %g4 = TSB_CONFIG
	stxa	%g4, [%g0] 0x4f
	and	%g4, 0x80, %g4		! %g4 = SUN4V	
	brz,a	%g4, trap_0x64_sun4u
	or	%g0, %g0, %g4		! %g4 = 0x000 -> 4U
	or	%g0, 0x400, %g4		! %g4 = 0x400 -> 4V
trap_0x64_sun4u:	
	ldxa	[%g2] 0x54, %g5		! %g5 = ITSB_PTR
trap_0x64_load_tte:	
	ldda	[%g5] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6=TTE_TAG, %g7=TTE_DATA
	cmp	%g6, %g1		! Compare TAG
	bne,a	%xcc, trap_0x64_next_ptr
	add	%g2, 8, %g2
	srlx	%g7, 63, %g5		! Check Valid bit
	brz,a	%g5, trap_0x64_next_ptr
	add	%g2, 8, %g2
	! At this point, we have got the TTE to be loaded into the TLB.
	! We just need to figure out what physical offset to use.
	! Register %g4 and %g7 are restricted.
	setx	trap_ra_mask, %g5, %g6
	ldxa	[%g0] 0x4f, %g5		! %g5 = TSB_CONFIG
	and	%g5, 0x100, %g3		! %g3 has the ranotpa bit
	brz,a	%g3, trap_0x64_skip_ra
	nop
	and	%g5, 0x70, %g3		! %g3 = PSIZE
	cmp	%g3, 0x00
	be,a	trap_0x64_get_rr_limits
	add	%g6, 48, %g6
	cmp	%g3, 0x10
	be,a	trap_0x64_get_rr_limits
	add	%g6, 32, %g6
	cmp	%g3, 0x10
	be,a	trap_0x64_get_rr_limits
	add	%g6, 16, %g6
trap_0x64_get_rr_limits:
	ldda	[%g6] 0x24, %g2		! %g2 = RA_max mask, %g3 = RA_min mask
	sllx	%g7, 24, %g5
	srlx	%g5, 37, %g5
	sllx	%g5, 13, %g5		! %g5 = RA
	or	%g5, %g2, %g2		! %g2 = RA_max
	and	%g5, %g3, %g3		! %g3 = RA_min
		
	or	%g0, 0x108, %g1		! %g1 points to REAL_RANGE_REG
trap_0x64_next_rr:
	cmp	%g1, 0x128
	bl,a	%xcc, trap_0x64_get_rr
	ldxa	[%g1] 0x52, %g5		! %g5 = REAL_RANGE
	done
trap_0x64_get_rr:	
	srlx	%g5, 63, %g6
	brz,a	%g6, trap_0x64_next_rr
	add	%g1, 8, %g1
	
	sllx	%g5, 10, %g6		! %g6 = RR left shift by 10
	srlx	%g6, 37, %g6
	sllx	%g6, 13, %g6		! %g6 = RA_hi
	cmp	%g6, %g2
	bl,a	%xcc, trap_0x64_next_rr
	add	%g1, 8, %g1
	sllx	%g5, 39, %g6
	srlx	%g6, 24, %g6		! %g6 = RA_lo
	cmp	%g6, %g3
	bg,a	%xcc, trap_0x64_next_rr
	add	%g1, 8, %g1
	add	%g1, 0x100, %g1
	ldxa	[%g1] 0x52, %g1		! %g1 = physical offset
	add	%g7, %g1, %g7
trap_0x64_skip_ra:	
	stxa	%g7, [%g4] 0x54
	retry

trap_0x64_next_ptr:
	cmp	%g2, 0x70
	bl,a	%xcc, trap_0x64_load_tsb_config
	add	%g3, 8, %g3
	done
			
!****************************************************************************************	
ext_trap_0x68_begin:
	ldxa	[%g0] 0x58, %g1		! %g1 = DMMU_TAG_TARGET
	or	%g0, 0x70, %g2		! %g2 points to DTSB_PTR_0
	srlx	%g1, 48, %g3		! %g3 = CTX
	brz,a	%g3, trap_0x68_load_tsb_config
	or	%g0, 0x10, %g3
	or	%g0, 0x30, %g3
trap_0x68_load_tsb_config:	
	ldxa	[%g3] 0x54, %g4		! %g4 = TSB_CONFIG
	stxa	%g4, [%g0] 0x4f
	and	%g4, 0x80, %g4		! %g4 = SUN4V	
	brz,a	%g4, trap_0x68_sun4u
	or	%g0, %g0, %g4		! %g4 = 0x000 -> 4U
	or	%g0, 0x400, %g4		! %g4 = 0x400 -> 4V
trap_0x68_sun4u:	
	ldxa	[%g2] 0x54, %g5		! %g5 = DTSB_PTR
trap_0x68_load_tte:	
	ldda	[%g5] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6=TTE_TAG, %g7=TTE_DATA
	cmp	%g6, %g1		! Compare TAG
	bne,a	%xcc, trap_0x68_next_ptr
	add	%g2, 8, %g2
	srlx	%g7, 63, %g5		! Check Valid bit
	brz,a	%g5, trap_0x68_next_ptr
	add	%g2, 8, %g2
	! At this point, we have got the TTE to be loaded into the TLB.
	! We just need to figure out what physical offset to use.
	! Register %g4 and %g7 are restricted.
	setx	trap_ra_mask, %g5, %g6
	ldxa	[%g0] 0x4f, %g5		! %g5 = TSB_CONFIG
	and	%g5, 0x100, %g3		! %g3 has the ranotpa bit
	brz,a	%g3, trap_0x68_skip_ra
	nop
	and	%g5, 0x70, %g3		! %g3 = PSIZE
	cmp	%g3, 0x00
	be,a	trap_0x68_get_rr_limits
	add	%g6, 48, %g6
	cmp	%g3, 0x10
	be,a	trap_0x68_get_rr_limits
	add	%g6, 32, %g6
	cmp	%g3, 0x10
	be,a	trap_0x68_get_rr_limits
	add	%g6, 16, %g6
trap_0x68_get_rr_limits:
	ldda	[%g6] 0x24, %g2		! %g2 = RA_max mask, %g3 = RA_min mask
	sllx	%g7, 24, %g5
	srlx	%g5, 37, %g5
	sllx	%g5, 13, %g5		! %g5 = RA
	or	%g5, %g2, %g2		! %g2 = RA_max
	and	%g5, %g3, %g3		! %g3 = RA_min
		
	or	%g0, 0x108, %g1		! %g1 points to REAL_RANGE_REG
trap_0x68_next_rr:
	cmp	%g1, 0x128
	bl,a	%xcc, trap_0x68_get_rr
	ldxa	[%g1] 0x52, %g5		! %g5 = REAL_RANGE
	done
trap_0x68_get_rr:	
	srlx	%g5, 63, %g6
	brz,a	%g6, trap_0x68_next_rr
	add	%g1, 8, %g1
	
	sllx	%g5, 10, %g6		! %g6 = RR left shift by 10
	srlx	%g6, 37, %g6
	sllx	%g6, 13, %g6		! %g6 = RA_hi
	cmp	%g6, %g2
	bl,a	%xcc, trap_0x68_next_rr
	add	%g1, 8, %g1
	sllx	%g5, 39, %g6
	srlx	%g6, 24, %g6		! %g6 = RA_lo
	cmp	%g6, %g3
	bg,a	%xcc, trap_0x68_next_rr
	add	%g1, 8, %g1
	add	%g1, 0x100, %g1
	ldxa	[%g1] 0x52, %g1		! %g1 = physical offset
	add	%g7, %g1, %g7
trap_0x68_skip_ra:	
	stxa	%g7, [%g4] 0x5c
	retry

trap_0x68_next_ptr:
	cmp	%g2, 0x90
	bl,a	%xcc, trap_0x68_load_tsb_config
	add	%g3, 8, %g3
	done

/*************************************************************************/
ext_trap_0x9_begin:
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
trap_ra_mask:
	.xword	0x00000fffe000
	.xword	0x00fff0000000
	.xword	0x0000003fe000
	.xword	0x00ffffc00000
	.xword	0x00000000e000
	.xword	0x00ffffff0000
	.xword	0x000000000000
	.xword	0x00ffffffe000
	
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
SECTION .Thr0_User_Text_4u000 TEXT_VA=0x0160000000
attr_text {
	Name = .Thr0_User_Text_4u000 ,
	thr0_nz_ctx_tsb_1 ,
	VA = 0x000160000000 ,/* 0x00016fffffc0 */
	RA = 0x1240000000 ,
	PA = 0x3240000000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Text_4u000_text_end ,
	compressimage ,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
.global Thr0_User_Text_4u000_text_begin
Thr0_User_Text_4u000_text_begin:
	EXIT_GOOD
Thr0_User_Text_4u000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u100 DATA_VA=0x0000754000
attr_data {
	Name = .Thr0_User_Data_4u100 ,
	VA = 0x000000754000 ,/* 0x000000755fc0 */
	RA = 0x0001020000 ,
	PA = 0x0003020000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u100_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u100_data_begin
Thr0_User_Data_4u100_data_begin:
Thr0_User_Data_4u100_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u200 DATA_VA=0x0000776000
attr_data {
	Name = .Thr0_User_Data_4u200 ,
	VA = 0x000000776000 ,/* 0x000000777fc0 */
	RA = 0x000115c000 ,
	PA = 0x000315c000 ,
	TTE_Context = 0x0533 ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u200_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u200_data_begin
Thr0_User_Data_4u200_data_begin:
Thr0_User_Data_4u200_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u300 DATA_VA=0x0000638000
attr_data {
	Name = .Thr0_User_Data_4u300 ,
	VA = 0x000000638000 ,/* 0x000000639fc0 */
	RA = 0x000103a000 ,
	PA = 0x000303a000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr0_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u300_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u300_data_begin
Thr0_User_Data_4u300_data_begin:
Thr0_User_Data_4u300_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4u001 TEXT_VA=0x0008370000
attr_text {
	Name = .Thr0_User_Text_4u001 ,
	thr0_nz_ctx_tsb_3 ,
	VA = 0x000008370000 ,/* 0x00000837ffc0 */
	RA = 0x0036fe0000 ,
	PA = 0x0036fe0000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Text_4u001_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4u001_text_begin
Thr0_User_Text_4u001_text_begin:
	EXIT_GOOD
Thr0_User_Text_4u001_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u101 DATA_VA=0x000061a000
attr_data {
	Name = .Thr0_User_Data_4u101 ,
	VA = 0x00000061a000 ,/* 0x00000061bfc0 */
	RA = 0x000106c000 ,
	PA = 0x000306c000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u101_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u101_data_begin
Thr0_User_Data_4u101_data_begin:
Thr0_User_Data_4u101_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u201 DATA_VA=0x0008390000
attr_data {
	Name = .Thr0_User_Data_4u201 ,
	VA = 0x000008390000 ,/* 0x00000839ffc0 */
	RA = 0x0036460000 ,
	PA = 0x0036460000 ,
	TTE_Context = 0x0533 ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u201_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u201_data_begin
Thr0_User_Data_4u201_data_begin:
Thr0_User_Data_4u201_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u301 DATA_VA=0x00086f0000
attr_data {
	Name = .Thr0_User_Data_4u301 ,
	VA = 0x0000086f0000 ,/* 0x0000086fffc0 */
	RA = 0x00360a0000 ,
	PA = 0x00360a0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr0_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u301_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u301_data_begin
Thr0_User_Data_4u301_data_begin:
Thr0_User_Data_4u301_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4u002 TEXT_VA=0x0000770000
attr_text {
	Name = .Thr0_User_Text_4u002 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000000770000 ,/* 0x000000771fc0 */
	RA = 0x000104a000 ,
	PA = 0x000304a000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Text_4u002_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4u002_text_begin
Thr0_User_Text_4u002_text_begin:
	EXIT_GOOD
Thr0_User_Text_4u002_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u102 DATA_VA=0x0008150000
attr_data {
	Name = .Thr0_User_Data_4u102 ,
	VA = 0x000008150000 ,/* 0x00000815ffc0 */
	RA = 0x0036c00000 ,
	PA = 0x0036c00000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u102_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u102_data_begin
Thr0_User_Data_4u102_data_begin:
Thr0_User_Data_4u102_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u202 DATA_VA=0x0008840000
attr_data {
	Name = .Thr0_User_Data_4u202 ,
	VA = 0x000008840000 ,/* 0x00000884ffc0 */
	RA = 0x0036160000 ,
	PA = 0x0036160000 ,
	TTE_Context = 0x0533 ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u202_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u202_data_begin
Thr0_User_Data_4u202_data_begin:
Thr0_User_Data_4u202_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u302 DATA_VA=0x0008230000
attr_data {
	Name = .Thr0_User_Data_4u302 ,
	VA = 0x000008230000 ,/* 0x00000823ffc0 */
	RA = 0x00363f0000 ,
	PA = 0x00363f0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr0_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u302_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u302_data_begin
Thr0_User_Data_4u302_data_begin:
Thr0_User_Data_4u302_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4u003 TEXT_VA=0x0008780000
attr_text {
	Name = .Thr0_User_Text_4u003 ,
	thr0_nz_ctx_tsb_3 ,
	VA = 0x000008780000 ,/* 0x00000878ffc0 */
	RA = 0x00363c0000 ,
	PA = 0x00363c0000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Text_4u003_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4u003_text_begin
Thr0_User_Text_4u003_text_begin:
	EXIT_GOOD
Thr0_User_Text_4u003_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u103 DATA_VA=0x000065e000
attr_data {
	Name = .Thr0_User_Data_4u103 ,
	VA = 0x00000065e000 ,/* 0x00000065ffc0 */
	RA = 0x0001164000 ,
	PA = 0x0003164000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u103_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u103_data_begin
Thr0_User_Data_4u103_data_begin:
Thr0_User_Data_4u103_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u203 DATA_VA=0x00082e0000
attr_data {
	Name = .Thr0_User_Data_4u203 ,
	VA = 0x0000082e0000 ,/* 0x0000082effc0 */
	RA = 0x0036cd0000 ,
	PA = 0x0036cd0000 ,
	TTE_Context = 0x0533 ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u203_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u203_data_begin
Thr0_User_Data_4u203_data_begin:
Thr0_User_Data_4u203_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v300 DATA_VA=0x00ff800000
attr_data {
	Name = .Thr0_User_Data_4v300 ,
	VA = 0x0000ff800000 ,/* 0x0000ffbfffc0 */
	RA = 0x02c0000000 ,
	PA = 0x02c0000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr0_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr0_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v300_data_begin
Thr0_User_Data_4v300_data_begin:
Thr0_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x00cd000000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x0000cd000000 ,/* 0x0000cd3fffc0 */
	RA = 0x02f0000000 ,
	PA = 0x02f0000000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
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
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr0_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v000_text_begin
Thr0_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u104 DATA_VA=0x0000750000
attr_data {
	Name = .Thr0_User_Data_4u104 ,
	VA = 0x000000750000 ,/* 0x000000751fc0 */
	RA = 0x0001022000 ,
	PA = 0x0003022000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u104_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u104_data_begin
Thr0_User_Data_4u104_data_begin:
Thr0_User_Data_4u104_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v200 DATA_VA=0x00c6000000
attr_data {
	Name = .Thr0_User_Data_4v200 ,
	VA = 0x0000c6000000 ,/* 0x0000c63fffc0 */
	RA = 0x02dd400000 ,
	PA = 0x02dd400000 ,
	TTE_Context = 0x0533 ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr0_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v200_data_begin
Thr0_User_Data_4v200_data_begin:
Thr0_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4u004 TEXT_VA=0x00006e2000
attr_text {
	Name = .Thr0_User_Text_4u004 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x0000006e2000 ,/* 0x0000006e3fc0 */
	RA = 0x000113a000 ,
	PA = 0x000313a000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Text_4u004_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4u004_text_begin
Thr0_User_Text_4u004_text_begin:
	EXIT_GOOD
Thr0_User_Text_4u004_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u105 DATA_VA=0x000079e000
attr_data {
	Name = .Thr0_User_Data_4u105 ,
	VA = 0x00000079e000 ,/* 0x00000079ffc0 */
	RA = 0x0001032000 ,
	PA = 0x0003032000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u105_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u105_data_begin
Thr0_User_Data_4u105_data_begin:
Thr0_User_Data_4u105_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v001 TEXT_VA=0x00ee400000
attr_text {
	Name = .Thr0_User_Text_4v001 ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x0000ee400000 ,/* 0x0000ee7fffc0 */
	RA = 0x02fb400000 ,
	PA = 0x02fb400000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
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
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr0_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v001_text_begin
Thr0_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v100 DATA_VA=0x00e9c00000
attr_data {
	Name = .Thr0_User_Data_4v100 ,
	VA = 0x0000e9c00000 ,/* 0x0000e9ffffc0 */
	RA = 0x02f3400000 ,
	PA = 0x02f3400000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
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
	end_label   = Thr0_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v100_data_begin
Thr0_User_Data_4v100_data_begin:
Thr0_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4u005 TEXT_VA=0x00a0000000
attr_text {
	Name = .Thr0_User_Text_4u005 ,
	thr0_nz_ctx_tsb_1 ,
	VA = 0x0000a0000000 ,/* 0x0000afffffc0 */
	RA = 0x1320000000 ,
	PA = 0x3320000000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Text_4u005_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4u005_text_begin
Thr0_User_Text_4u005_text_begin:
	EXIT_GOOD
Thr0_User_Text_4u005_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u106 DATA_VA=0x0000698000
attr_data {
	Name = .Thr0_User_Data_4u106 ,
	VA = 0x000000698000 ,/* 0x000000699fc0 */
	RA = 0x000108e000 ,
	PA = 0x000308e000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u106_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u106_data_begin
Thr0_User_Data_4u106_data_begin:
Thr0_User_Data_4u106_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4u006 TEXT_VA=0x0190000000
attr_text {
	Name = .Thr0_User_Text_4u006 ,
	thr0_nz_ctx_tsb_1 ,
	VA = 0x000190000000 ,/* 0x00019fffffc0 */
	RA = 0x1340000000 ,
	PA = 0x3340000000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Text_4u006_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4u006_text_begin
Thr0_User_Text_4u006_text_begin:
	EXIT_GOOD
Thr0_User_Text_4u006_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u107 DATA_VA=0x0008bd0000
attr_data {
	Name = .Thr0_User_Data_4u107 ,
	VA = 0x000008bd0000 ,/* 0x000008bdffc0 */
	RA = 0x0036690000 ,
	PA = 0x0036690000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u107_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u107_data_begin
Thr0_User_Data_4u107_data_begin:
Thr0_User_Data_4u107_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4u007 TEXT_VA=0x00007e6000
attr_text {
	Name = .Thr0_User_Text_4u007 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x0000007e6000 ,/* 0x0000007e7fc0 */
	RA = 0x00011a2000 ,
	PA = 0x00031a2000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Text_4u007_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4u007_text_begin
Thr0_User_Text_4u007_text_begin:
	EXIT_GOOD
Thr0_User_Text_4u007_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v101 DATA_VA=0x00c4c00000
attr_data {
	Name = .Thr0_User_Data_4v101 ,
	VA = 0x0000c4c00000 ,/* 0x0000c4ffffc0 */
	RA = 0x02ea400000 ,
	PA = 0x02ea400000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
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
	end_label   = Thr0_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v101_data_begin
Thr0_User_Data_4v101_data_begin:
Thr0_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4u008 TEXT_VA=0x00007a6000
attr_text {
	Name = .Thr0_User_Text_4u008 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x0000007a6000 ,/* 0x0000007a7fc0 */
	RA = 0x000118a000 ,
	PA = 0x000318a000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Text_4u008_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4u008_text_begin
Thr0_User_Text_4u008_text_begin:
	EXIT_GOOD
Thr0_User_Text_4u008_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u108 DATA_VA=0x02e0000000
attr_data {
	Name = .Thr0_User_Data_4u108 ,
	VA = 0x0002e0000000 ,/* 0x0002efffffc0 */
	RA = 0x1170000000 ,
	PA = 0x3170000000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u108_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u108_data_begin
Thr0_User_Data_4u108_data_begin:
Thr0_User_Data_4u108_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4u009 TEXT_VA=0x0000616000
attr_text {
	Name = .Thr0_User_Text_4u009 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000000616000 ,/* 0x000000617fc0 */
	RA = 0x0001192000 ,
	PA = 0x0003192000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Text_4u009_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4u009_text_begin
Thr0_User_Text_4u009_text_begin:
	EXIT_GOOD
Thr0_User_Text_4u009_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u109 DATA_VA=0x000071a000
attr_data {
	Name = .Thr0_User_Data_4u109 ,
	VA = 0x00000071a000 ,/* 0x00000071bfc0 */
	RA = 0x00010ae000 ,
	PA = 0x00030ae000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u109_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u109_data_begin
Thr0_User_Data_4u109_data_begin:
Thr0_User_Data_4u109_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v002 TEXT_VA=0x00e3000000
attr_text {
	Name = .Thr0_User_Text_4v002 ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x0000e3000000 ,/* 0x0000e33fffc0 */
	RA = 0x02e9c00000 ,
	PA = 0x02e9c00000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
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
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr0_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v002_text_begin
Thr0_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u10a DATA_VA=0x0000646000
attr_data {
	Name = .Thr0_User_Data_4u10a ,
	VA = 0x000000646000 ,/* 0x000000647fc0 */
	RA = 0x00010c0000 ,
	PA = 0x00030c0000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u10a_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u10a_data_begin
Thr0_User_Data_4u10a_data_begin:
Thr0_User_Data_4u10a_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4u00a TEXT_VA=0x0008b70000
attr_text {
	Name = .Thr0_User_Text_4u00a ,
	thr0_nz_ctx_tsb_3 ,
	VA = 0x000008b70000 ,/* 0x000008b7ffc0 */
	RA = 0x0036d40000 ,
	PA = 0x0036d40000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Text_4u00a_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4u00a_text_begin
Thr0_User_Text_4u00a_text_begin:
	EXIT_GOOD
Thr0_User_Text_4u00a_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u10b DATA_VA=0x000070e000
attr_data {
	Name = .Thr0_User_Data_4u10b ,
	VA = 0x00000070e000 ,/* 0x00000070ffc0 */
	RA = 0x0001000000 ,
	PA = 0x0003000000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u10b_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u10b_data_begin
Thr0_User_Data_4u10b_data_begin:
Thr0_User_Data_4u10b_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v003 TEXT_VA=0x00f0000000
attr_text {
	Name = .Thr0_User_Text_4v003 ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x0000f0000000 ,/* 0x0000f03fffc0 */
	RA = 0x02eb800000 ,
	PA = 0x02eb800000 ,
	TTE_Context = 0x15a4 ,/* TEXT_PRIMARY */
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
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr0_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v003_text_begin
Thr0_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u10c DATA_VA=0x00007ac000
attr_data {
	Name = .Thr0_User_Data_4u10c ,
	VA = 0x0000007ac000 ,/* 0x0000007adfc0 */
	RA = 0x00010fa000 ,
	PA = 0x00030fa000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u10c_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u10c_data_begin
Thr0_User_Data_4u10c_data_begin:
Thr0_User_Data_4u10c_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4u10d DATA_VA=0x000069c000
attr_data {
	Name = .Thr0_User_Data_4u10d ,
	VA = 0x00000069c000 ,/* 0x00000069dfc0 */
	RA = 0x0001130000 ,
	PA = 0x0003130000 ,
	TTE_Context = 0x15a4 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr0_User_Data_4u10d_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4u10d_data_begin
Thr0_User_Data_4u10d_data_begin:
Thr0_User_Data_4u10d_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x01f0000000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	thr1_nz_ctx_tsb_3 ,
	VA = 0x0001f0000000 ,/* 0x0001ffffffc0 */
	RA = 0x1390000000 ,
	PA = 0x5390000000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0f0c8a ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr1_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr1_user_code_entry
Thr1_user_code_entry:
.global Thr1_User_Text_4v000_text_begin
Thr1_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u100 DATA_VA=0x0000772000
attr_data {
	Name = .Thr1_User_Data_4u100 ,
	VA = 0x000000772000 ,/* 0x000000773fc0 */
	RA = 0x00051cc000 ,
	PA = 0x00051cc000 ,
	TTE_Context = 0x1560 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft    = 0x0b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u100_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u100_data_begin
Thr1_User_Data_4u100_data_begin:
Thr1_User_Data_4u100_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u200 DATA_VA=0x00087f0000
attr_data {
	Name = .Thr1_User_Data_4u200 ,
	VA = 0x0000087f0000 ,/* 0x0000087fffc0 */
	RA = 0x0016b40000 ,
	PA = 0x0056b40000 ,
	TTE_Context = 0x1ef6 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3ea ,
	TTE_Diag    = 0x13 ,
	TTE_Soft    = 0x0e ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u200_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u200_data_begin
Thr1_User_Data_4u200_data_begin:
Thr1_User_Data_4u200_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u300 DATA_VA=0x00083c0000
attr_data {
	Name = .Thr1_User_Data_4u300 ,
	VA = 0x0000083c0000 ,/* 0x0000083cffc0 */
	RA = 0x0016760000 ,
	PA = 0x0056760000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x147 ,
	TTE_Diag    = 0x19 ,
	TTE_Soft    = 0x1a ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u300_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u300_data_begin
Thr1_User_Data_4u300_data_begin:
Thr1_User_Data_4u300_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u000 TEXT_VA=0x000078a000
attr_text {
	Name = .Thr1_User_Text_4u000 ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x00000078a000 ,/* 0x00000078bfc0 */
	RA = 0x0005138000 ,
	PA = 0x0005138000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u000_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u000_text_begin
Thr1_User_Text_4u000_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u000_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u101 DATA_VA=0x0008470000
attr_data {
	Name = .Thr1_User_Data_4u101 ,
	VA = 0x000008470000 ,/* 0x00000847ffc0 */
	RA = 0x0016bc0000 ,
	PA = 0x0056bc0000 ,
	TTE_Context = 0x1560 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x13d ,
	TTE_Diag    = 0x7e ,
	TTE_Soft    = 0x0b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u101_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u101_data_begin
Thr1_User_Data_4u101_data_begin:
Thr1_User_Data_4u101_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u201 DATA_VA=0x00006b8000
attr_data {
	Name = .Thr1_User_Data_4u201 ,
	VA = 0x0000006b8000 ,/* 0x0000006b9fc0 */
	RA = 0x0005100000 ,
	PA = 0x0005100000 ,
	TTE_Context = 0x1ef6 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3ea ,
	TTE_Diag    = 0x13 ,
	TTE_Soft    = 0x0e ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u201_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u201_data_begin
Thr1_User_Data_4u201_data_begin:
Thr1_User_Data_4u201_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u301 DATA_VA=0x0000736000
attr_data {
	Name = .Thr1_User_Data_4u301 ,
	VA = 0x000000736000 ,/* 0x000000737fc0 */
	RA = 0x00051c2000 ,
	PA = 0x00051c2000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x147 ,
	TTE_Diag    = 0x19 ,
	TTE_Soft    = 0x1a ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u301_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u301_data_begin
Thr1_User_Data_4u301_data_begin:
Thr1_User_Data_4u301_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u001 TEXT_VA=0x00cf800000
attr_text {
	Name = .Thr1_User_Text_4u001 ,
	thr1_nz_ctx_tsb_2 ,
	VA = 0x0000cf800000 ,/* 0x0000cfbfffc0 */
	RA = 0x04c6800000 ,
	PA = 0x04c6800000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u001_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u001_text_begin
Thr1_User_Text_4u001_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u001_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u102 DATA_VA=0x0008a80000
attr_data {
	Name = .Thr1_User_Data_4u102 ,
	VA = 0x000008a80000 ,/* 0x000008a8ffc0 */
	RA = 0x0016970000 ,
	PA = 0x0056970000 ,
	TTE_Context = 0x1560 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x13d ,
	TTE_Diag    = 0x7e ,
	TTE_Soft    = 0x0b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u102_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u102_data_begin
Thr1_User_Data_4u102_data_begin:
Thr1_User_Data_4u102_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u202 DATA_VA=0x0000658000
attr_data {
	Name = .Thr1_User_Data_4u202 ,
	VA = 0x000000658000 ,/* 0x000000659fc0 */
	RA = 0x00051a4000 ,
	PA = 0x00051a4000 ,
	TTE_Context = 0x1ef6 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3ea ,
	TTE_Diag    = 0x13 ,
	TTE_Soft    = 0x0e ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u202_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u202_data_begin
Thr1_User_Data_4u202_data_begin:
Thr1_User_Data_4u202_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u302 DATA_VA=0x00e4c00000
attr_data {
	Name = .Thr1_User_Data_4u302 ,
	VA = 0x0000e4c00000 ,/* 0x0000e4ffffc0 */
	RA = 0x04fbc00000 ,
	PA = 0x04fbc00000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x147 ,
	TTE_Diag    = 0x19 ,
	TTE_Soft    = 0x1a ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u302_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u302_data_begin
Thr1_User_Data_4u302_data_begin:
Thr1_User_Data_4u302_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u002 TEXT_VA=0x0008db0000
attr_text {
	Name = .Thr1_User_Text_4u002 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x000008db0000 ,/* 0x000008dbffc0 */
	RA = 0x0016da0000 ,
	PA = 0x0056da0000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u002_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u002_text_begin
Thr1_User_Text_4u002_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u002_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u103 DATA_VA=0x00e1800000
attr_data {
	Name = .Thr1_User_Data_4u103 ,
	VA = 0x0000e1800000 ,/* 0x0000e1bfffc0 */
	RA = 0x04d0400000 ,
	PA = 0x04d0400000 ,
	TTE_Context = 0x1560 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x13d ,
	TTE_Diag    = 0x7e ,
	TTE_Soft    = 0x0b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u103_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u103_data_begin
Thr1_User_Data_4u103_data_begin:
Thr1_User_Data_4u103_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u003 TEXT_VA=0x0008c80000
attr_text {
	Name = .Thr1_User_Text_4u003 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x000008c80000 ,/* 0x000008c8ffc0 */
	RA = 0x0016af0000 ,
	PA = 0x0056af0000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u003_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u003_text_begin
Thr1_User_Text_4u003_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u003_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u104 DATA_VA=0x00d0000000
attr_data {
	Name = .Thr1_User_Data_4u104 ,
	VA = 0x0000d0000000 ,/* 0x0000d03fffc0 */
	RA = 0x04f8400000 ,
	PA = 0x04f8400000 ,
	TTE_Context = 0x1560 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x13d ,
	TTE_Diag    = 0x7e ,
	TTE_Soft    = 0x0b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u104_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u104_data_begin
Thr1_User_Data_4u104_data_begin:
Thr1_User_Data_4u104_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u004 TEXT_VA=0x0008900000
attr_text {
	Name = .Thr1_User_Text_4u004 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x000008900000 ,/* 0x00000890ffc0 */
	RA = 0x0016670000 ,
	PA = 0x0056670000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u004_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u004_text_begin
Thr1_User_Text_4u004_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u004_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u105 DATA_VA=0x0008e10000
attr_data {
	Name = .Thr1_User_Data_4u105 ,
	VA = 0x000008e10000 ,/* 0x000008e1ffc0 */
	RA = 0x0016980000 ,
	PA = 0x0056980000 ,
	TTE_Context = 0x1560 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x13d ,
	TTE_Diag    = 0x7e ,
	TTE_Soft    = 0x0b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u105_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u105_data_begin
Thr1_User_Data_4u105_data_begin:
Thr1_User_Data_4u105_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u005 TEXT_VA=0x0008e70000
attr_text {
	Name = .Thr1_User_Text_4u005 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x000008e70000 ,/* 0x000008e7ffc0 */
	RA = 0x0016560000 ,
	PA = 0x0056560000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u005_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u005_text_begin
Thr1_User_Text_4u005_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u005_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u106 DATA_VA=0x00089b0000
attr_data {
	Name = .Thr1_User_Data_4u106 ,
	VA = 0x0000089b0000 ,/* 0x0000089bffc0 */
	RA = 0x0016490000 ,
	PA = 0x0056490000 ,
	TTE_Context = 0x1560 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x13d ,
	TTE_Diag    = 0x7e ,
	TTE_Soft    = 0x0b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u106_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u106_data_begin
Thr1_User_Data_4u106_data_begin:
Thr1_User_Data_4u106_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u006 TEXT_VA=0x00c7000000
attr_text {
	Name = .Thr1_User_Text_4u006 ,
	thr1_nz_ctx_tsb_2 ,
	VA = 0x0000c7000000 ,/* 0x0000c73fffc0 */
	RA = 0x04c3400000 ,
	PA = 0x04c3400000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u006_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u006_text_begin
Thr1_User_Text_4u006_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u006_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u107 DATA_VA=0x0008990000
attr_data {
	Name = .Thr1_User_Data_4u107 ,
	VA = 0x000008990000 ,/* 0x00000899ffc0 */
	RA = 0x00160b0000 ,
	PA = 0x00560b0000 ,
	TTE_Context = 0x1560 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x13d ,
	TTE_Diag    = 0x7e ,
	TTE_Soft    = 0x0b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u107_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u107_data_begin
Thr1_User_Data_4u107_data_begin:
Thr1_User_Data_4u107_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u007 TEXT_VA=0x00007e8000
attr_text {
	Name = .Thr1_User_Text_4u007 ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x0000007e8000 ,/* 0x0000007e9fc0 */
	RA = 0x00051ba000 ,
	PA = 0x00051ba000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u007_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u007_text_begin
Thr1_User_Text_4u007_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u007_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u108 DATA_VA=0x000060a000
attr_data {
	Name = .Thr1_User_Data_4u108 ,
	VA = 0x00000060a000 ,/* 0x00000060bfc0 */
	RA = 0x00051d8000 ,
	PA = 0x00051d8000 ,
	TTE_Context = 0x1560 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x13d ,
	TTE_Diag    = 0x7e ,
	TTE_Soft    = 0x0b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u108_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u108_data_begin
Thr1_User_Data_4u108_data_begin:
Thr1_User_Data_4u108_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u008 TEXT_VA=0x0008290000
attr_text {
	Name = .Thr1_User_Text_4u008 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x000008290000 ,/* 0x00000829ffc0 */
	RA = 0x0016a30000 ,
	PA = 0x0056a30000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u008_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u008_text_begin
Thr1_User_Text_4u008_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u008_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u109 DATA_VA=0x0008be0000
attr_data {
	Name = .Thr1_User_Data_4u109 ,
	VA = 0x000008be0000 ,/* 0x000008beffc0 */
	RA = 0x0016a70000 ,
	PA = 0x0056a70000 ,
	TTE_Context = 0x1560 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x13d ,
	TTE_Diag    = 0x7e ,
	TTE_Soft    = 0x0b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Data_4u109_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4u109_data_begin
Thr1_User_Data_4u109_data_begin:
Thr1_User_Data_4u109_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u009 TEXT_VA=0x0000790000
attr_text {
	Name = .Thr1_User_Text_4u009 ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x000000790000 ,/* 0x000000791fc0 */
	RA = 0x00051b8000 ,
	PA = 0x00051b8000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u009_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u009_text_begin
Thr1_User_Text_4u009_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u009_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u00a TEXT_VA=0x00088a0000
attr_text {
	Name = .Thr1_User_Text_4u00a ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x0000088a0000 ,/* 0x0000088affc0 */
	RA = 0x0016290000 ,
	PA = 0x0056290000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u00a_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u00a_text_begin
Thr1_User_Text_4u00a_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u00a_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u00b TEXT_VA=0x000068c000
attr_text {
	Name = .Thr1_User_Text_4u00b ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x00000068c000 ,/* 0x00000068dfc0 */
	RA = 0x0005122000 ,
	PA = 0x0005122000 ,
	TTE_Context = 0x1560 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x01 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u00b_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u00b_text_begin
Thr1_User_Text_4u00b_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u00b_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x0000606000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	thr2_nz_ctx_tsb_1 ,
	VA = 0x000000606000 ,/* 0x000000607fc0 */
	RA = 0x0001068000 ,
	PA = 0x0007068000 ,
	TTE_Context = 0x036f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0769bd ,
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
	end_label   = Thr2_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr2_user_code_entry
Thr2_user_code_entry:
.global Thr2_User_Text_4v000_text_begin
Thr2_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u100 DATA_VA=0x00fbc00000
attr_data {
	Name = .Thr2_User_Data_4u100 ,
	VA = 0x0000fbc00000 ,/* 0x0000fbffffc0 */
	RA = 0x00d2400000 ,
	PA = 0x06d2400000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u100_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u100_data_begin
Thr2_User_Data_4u100_data_begin:
Thr2_User_Data_4u100_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u200 DATA_VA=0x0008950000
attr_data {
	Name = .Thr2_User_Data_4u200 ,
	VA = 0x000008950000 ,/* 0x00000895ffc0 */
	RA = 0x0016ab0000 ,
	PA = 0x0076ab0000 ,
	TTE_Context = 0x18c3 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x158 ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u200_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u200_data_begin
Thr2_User_Data_4u200_data_begin:
Thr2_User_Data_4u200_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v300 DATA_VA=0x0000798000
attr_data {
	Name = .Thr2_User_Data_4v300 ,
	VA = 0x000000798000 ,/* 0x000000799fc0 */
	RA = 0x0001196000 ,
	PA = 0x0007196000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x126fec ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v300_data_begin
Thr2_User_Data_4v300_data_begin:
Thr2_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4u000 TEXT_VA=0x00085b0000
attr_text {
	Name = .Thr2_User_Text_4u000 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x0000085b0000 ,/* 0x0000085bffc0 */
	RA = 0x0016230000 ,
	PA = 0x0076230000 ,
	TTE_Context = 0x036f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3ac ,
	TTE_Diag    = 0x62 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Text_4u000_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4u000_text_begin
Thr2_User_Text_4u000_text_begin:
	EXIT_GOOD
Thr2_User_Text_4u000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v100 DATA_VA=0x00007c6000
attr_data {
	Name = .Thr2_User_Data_4v100 ,
	VA = 0x0000007c6000 ,/* 0x0000007c7fc0 */
	RA = 0x00010b4000 ,
	PA = 0x00070b4000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0eb732 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v100_data_begin
Thr2_User_Data_4v100_data_begin:
Thr2_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u201 DATA_VA=0x0380000000
attr_data {
	Name = .Thr2_User_Data_4u201 ,
	VA = 0x000380000000 ,/* 0x00038fffffc0 */
	RA = 0x1190000000 ,
	PA = 0x7190000000 ,
	TTE_Context = 0x18c3 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x158 ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u201_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u201_data_begin
Thr2_User_Data_4u201_data_begin:
Thr2_User_Data_4u201_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v301 DATA_VA=0x00006ae000
attr_data {
	Name = .Thr2_User_Data_4v301 ,
	VA = 0x0000006ae000 ,/* 0x0000006affc0 */
	RA = 0x00011a0000 ,
	PA = 0x00071a0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x126fec ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v301_data_begin
Thr2_User_Data_4v301_data_begin:
Thr2_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4u001 TEXT_VA=0x00082b0000
attr_text {
	Name = .Thr2_User_Text_4u001 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x0000082b0000 ,/* 0x0000082bffc0 */
	RA = 0x0016780000 ,
	PA = 0x0076780000 ,
	TTE_Context = 0x036f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3ac ,
	TTE_Diag    = 0x62 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Text_4u001_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4u001_text_begin
Thr2_User_Text_4u001_text_begin:
	EXIT_GOOD
Thr2_User_Text_4u001_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v101 DATA_VA=0x0000706000
attr_data {
	Name = .Thr2_User_Data_4v101 ,
	VA = 0x000000706000 ,/* 0x000000707fc0 */
	RA = 0x00011b2000 ,
	PA = 0x00071b2000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0eb732 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v101_data_begin
Thr2_User_Data_4v101_data_begin:
Thr2_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v200 DATA_VA=0x0000634000
attr_data {
	Name = .Thr2_User_Data_4v200 ,
	VA = 0x000000634000 ,/* 0x000000635fc0 */
	RA = 0x000109a000 ,
	PA = 0x000709a000 ,
	TTE_Context = 0x18c3 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0f125b ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v200_data_begin
Thr2_User_Data_4v200_data_begin:
Thr2_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u300 DATA_VA=0x00dc400000
attr_data {
	Name = .Thr2_User_Data_4u300 ,
	VA = 0x0000dc400000 ,/* 0x0000dc7fffc0 */
	RA = 0x00d8c00000 ,
	PA = 0x06d8c00000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x266 ,
	TTE_Diag    = 0x03 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u300_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u300_data_begin
Thr2_User_Data_4u300_data_begin:
Thr2_User_Data_4u300_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v001 TEXT_VA=0x000074a000
attr_text {
	Name = .Thr2_User_Text_4v001 ,
	thr2_nz_ctx_tsb_1 ,
	VA = 0x00000074a000 ,/* 0x00000074bfc0 */
	RA = 0x0001050000 ,
	PA = 0x0007050000 ,
	TTE_Context = 0x036f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0769bd ,
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
	end_label   = Thr2_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v001_text_begin
Thr2_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u101 DATA_VA=0x00082a0000
attr_data {
	Name = .Thr2_User_Data_4u101 ,
	VA = 0x0000082a0000 ,/* 0x0000082affc0 */
	RA = 0x0016ea0000 ,
	PA = 0x0076ea0000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u101_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u101_data_begin
Thr2_User_Data_4u101_data_begin:
Thr2_User_Data_4u101_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u202 DATA_VA=0x00c6400000
attr_data {
	Name = .Thr2_User_Data_4u202 ,
	VA = 0x0000c6400000 ,/* 0x0000c67fffc0 */
	RA = 0x00eb000000 ,
	PA = 0x06eb000000 ,
	TTE_Context = 0x18c3 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x158 ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u202_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u202_data_begin
Thr2_User_Data_4u202_data_begin:
Thr2_User_Data_4u202_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4u002 TEXT_VA=0x00d8800000
attr_text {
	Name = .Thr2_User_Text_4u002 ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x0000d8800000 ,/* 0x0000d8bfffc0 */
	RA = 0x00e1400000 ,
	PA = 0x06e1400000 ,
	TTE_Context = 0x036f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3ac ,
	TTE_Diag    = 0x62 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Text_4u002_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4u002_text_begin
Thr2_User_Text_4u002_text_begin:
	EXIT_GOOD
Thr2_User_Text_4u002_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v102 DATA_VA=0x00006fa000
attr_data {
	Name = .Thr2_User_Data_4v102 ,
	VA = 0x0000006fa000 ,/* 0x0000006fbfc0 */
	RA = 0x0001088000 ,
	PA = 0x0007088000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0eb732 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v102_data_begin
Thr2_User_Data_4v102_data_begin:
Thr2_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u203 DATA_VA=0x0008a90000
attr_data {
	Name = .Thr2_User_Data_4u203 ,
	VA = 0x000008a90000 ,/* 0x000008a9ffc0 */
	RA = 0x0016ac0000 ,
	PA = 0x0076ac0000 ,
	TTE_Context = 0x18c3 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x158 ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u203_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u203_data_begin
Thr2_User_Data_4u203_data_begin:
Thr2_User_Data_4u203_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4u003 TEXT_VA=0x0008ee0000
attr_text {
	Name = .Thr2_User_Text_4u003 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x000008ee0000 ,/* 0x000008eeffc0 */
	RA = 0x0016c40000 ,
	PA = 0x0076c40000 ,
	TTE_Context = 0x036f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3ac ,
	TTE_Diag    = 0x62 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Text_4u003_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4u003_text_begin
Thr2_User_Text_4u003_text_begin:
	EXIT_GOOD
Thr2_User_Text_4u003_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u102 DATA_VA=0x0008580000
attr_data {
	Name = .Thr2_User_Data_4u102 ,
	VA = 0x000008580000 ,/* 0x00000858ffc0 */
	RA = 0x0016900000 ,
	PA = 0x0076900000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u102_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u102_data_begin
Thr2_User_Data_4u102_data_begin:
Thr2_User_Data_4u102_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v002 TEXT_VA=0x0000622000
attr_text {
	Name = .Thr2_User_Text_4v002 ,
	thr2_nz_ctx_tsb_1 ,
	VA = 0x000000622000 ,/* 0x000000623fc0 */
	RA = 0x000119e000 ,
	PA = 0x000719e000 ,
	TTE_Context = 0x036f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0769bd ,
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
	end_label   = Thr2_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v002_text_begin
Thr2_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u103 DATA_VA=0x00082f0000
attr_data {
	Name = .Thr2_User_Data_4u103 ,
	VA = 0x0000082f0000 ,/* 0x0000082fffc0 */
	RA = 0x0016720000 ,
	PA = 0x0076720000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u103_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u103_data_begin
Thr2_User_Data_4u103_data_begin:
Thr2_User_Data_4u103_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4u004 TEXT_VA=0x00e0000000
attr_text {
	Name = .Thr2_User_Text_4u004 ,
	thr2_nz_ctx_tsb_0 ,
	VA = 0x0000e0000000 ,/* 0x0000efffffc0 */
	RA = 0x11d0000000 ,
	PA = 0x71d0000000 ,
	TTE_Context = 0x036f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3ac ,
	TTE_Diag    = 0x62 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Text_4u004_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4u004_text_begin
Thr2_User_Text_4u004_text_begin:
	EXIT_GOOD
Thr2_User_Text_4u004_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v103 DATA_VA=0x0000796000
attr_data {
	Name = .Thr2_User_Data_4v103 ,
	VA = 0x000000796000 ,/* 0x000000797fc0 */
	RA = 0x00010e6000 ,
	PA = 0x00070e6000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0eb732 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v103_data_begin
Thr2_User_Data_4v103_data_begin:
Thr2_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v003 TEXT_VA=0x00006be000
attr_text {
	Name = .Thr2_User_Text_4v003 ,
	thr2_nz_ctx_tsb_1 ,
	VA = 0x0000006be000 ,/* 0x0000006bffc0 */
	RA = 0x000100a000 ,
	PA = 0x000700a000 ,
	TTE_Context = 0x036f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0769bd ,
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
	end_label   = Thr2_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v003_text_begin
Thr2_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u104 DATA_VA=0x00ca400000
attr_data {
	Name = .Thr2_User_Data_4u104 ,
	VA = 0x0000ca400000 ,/* 0x0000ca7fffc0 */
	RA = 0x00d7400000 ,
	PA = 0x06d7400000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u104_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u104_data_begin
Thr2_User_Data_4u104_data_begin:
Thr2_User_Data_4u104_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4u005 TEXT_VA=0x00f6400000
attr_text {
	Name = .Thr2_User_Text_4u005 ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x0000f6400000 ,/* 0x0000f67fffc0 */
	RA = 0x00f3c00000 ,
	PA = 0x06f3c00000 ,
	TTE_Context = 0x036f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3ac ,
	TTE_Diag    = 0x62 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Text_4u005_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4u005_text_begin
Thr2_User_Text_4u005_text_begin:
	EXIT_GOOD
Thr2_User_Text_4u005_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u105 DATA_VA=0x0008c60000
attr_data {
	Name = .Thr2_User_Data_4u105 ,
	VA = 0x000008c60000 ,/* 0x000008c6ffc0 */
	RA = 0x0016640000 ,
	PA = 0x0076640000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u105_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u105_data_begin
Thr2_User_Data_4u105_data_begin:
Thr2_User_Data_4u105_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u106 DATA_VA=0x0008e20000
attr_data {
	Name = .Thr2_User_Data_4u106 ,
	VA = 0x000008e20000 ,/* 0x000008e2ffc0 */
	RA = 0x00165e0000 ,
	PA = 0x00765e0000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u106_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u106_data_begin
Thr2_User_Data_4u106_data_begin:
Thr2_User_Data_4u106_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u107 DATA_VA=0x0008810000
attr_data {
	Name = .Thr2_User_Data_4u107 ,
	VA = 0x000008810000 ,/* 0x00000881ffc0 */
	RA = 0x0016a50000 ,
	PA = 0x0076a50000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u107_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u107_data_begin
Thr2_User_Data_4u107_data_begin:
Thr2_User_Data_4u107_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u108 DATA_VA=0x00fcc00000
attr_data {
	Name = .Thr2_User_Data_4u108 ,
	VA = 0x0000fcc00000 ,/* 0x0000fcffffc0 */
	RA = 0x00c3000000 ,
	PA = 0x06c3000000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u108_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u108_data_begin
Thr2_User_Data_4u108_data_begin:
Thr2_User_Data_4u108_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u109 DATA_VA=0x0008160000
attr_data {
	Name = .Thr2_User_Data_4u109 ,
	VA = 0x000008160000 ,/* 0x00000816ffc0 */
	RA = 0x0016050000 ,
	PA = 0x0076050000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u109_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u109_data_begin
Thr2_User_Data_4u109_data_begin:
Thr2_User_Data_4u109_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u10a DATA_VA=0x00ff000000
attr_data {
	Name = .Thr2_User_Data_4u10a ,
	VA = 0x0000ff000000 ,/* 0x0000ff3fffc0 */
	RA = 0x00e4c00000 ,
	PA = 0x06e4c00000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u10a_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u10a_data_begin
Thr2_User_Data_4u10a_data_begin:
Thr2_User_Data_4u10a_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u10b DATA_VA=0x00085d0000
attr_data {
	Name = .Thr2_User_Data_4u10b ,
	VA = 0x0000085d0000 ,/* 0x0000085dffc0 */
	RA = 0x0016170000 ,
	PA = 0x0076170000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2a3 ,
	TTE_Diag    = 0xa6 ,
	TTE_Soft    = 0x13 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u10b_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u10b_data_begin
Thr2_User_Data_4u10b_data_begin:
Thr2_User_Data_4u10b_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v104 DATA_VA=0x00006ce000
attr_data {
	Name = .Thr2_User_Data_4v104 ,
	VA = 0x0000006ce000 ,/* 0x0000006cffc0 */
	RA = 0x000101e000 ,
	PA = 0x000701e000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0eb732 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v104_data_begin
Thr2_User_Data_4v104_data_begin:
Thr2_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v105 DATA_VA=0x000061e000
attr_data {
	Name = .Thr2_User_Data_4v105 ,
	VA = 0x00000061e000 ,/* 0x00000061ffc0 */
	RA = 0x0001078000 ,
	PA = 0x0007078000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0eb732 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v105_data_begin
Thr2_User_Data_4v105_data_begin:
Thr2_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v106 DATA_VA=0x0000710000
attr_data {
	Name = .Thr2_User_Data_4v106 ,
	VA = 0x000000710000 ,/* 0x000000711fc0 */
	RA = 0x00010e4000 ,
	PA = 0x00070e4000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0eb732 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v106_data_begin
Thr2_User_Data_4v106_data_begin:
Thr2_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v107 DATA_VA=0x0000756000
attr_data {
	Name = .Thr2_User_Data_4v107 ,
	VA = 0x000000756000 ,/* 0x000000757fc0 */
	RA = 0x00010d0000 ,
	PA = 0x00070d0000 ,
	TTE_Context = 0x036f ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0eb732 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v107_data_begin
Thr2_User_Data_4v107_data_begin:
Thr2_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4u000 TEXT_VA=0x00086e0000
attr_text {
	Name = .Thr3_User_Text_4u000 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x0000086e0000 ,/* 0x0000086effc0 */
	RA = 0x0016cf0000 ,
	PA = 0x0096cf0000 ,
	TTE_Context = 0x11ce ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x0e4 ,
	TTE_Diag    = 0xc5 ,
	TTE_Soft    = 0x11 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Text_4u000_text_end ,
	compressimage ,
	}
.text
.global Thr3_user_code_entry
Thr3_user_code_entry:
.global Thr3_User_Text_4u000_text_begin
Thr3_User_Text_4u000_text_begin:
	EXIT_GOOD
Thr3_User_Text_4u000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u100 DATA_VA=0x00e6400000
attr_data {
	Name = .Thr3_User_Data_4u100 ,
	VA = 0x0000e6400000 ,/* 0x0000e67fffc0 */
	RA = 0x08d6c00000 ,
	PA = 0x08d6c00000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x350 ,
	TTE_Diag    = 0xf1 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u100_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u100_data_begin
Thr3_User_Data_4u100_data_begin:
Thr3_User_Data_4u100_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u200 DATA_VA=0x0008680000
attr_data {
	Name = .Thr3_User_Data_4u200 ,
	VA = 0x000008680000 ,/* 0x00000868ffc0 */
	RA = 0x00168c0000 ,
	PA = 0x00968c0000 ,
	TTE_Context = 0x088a ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00b ,
	TTE_Diag    = 0xaa ,
	TTE_Soft    = 0x0f ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u200_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u200_data_begin
Thr3_User_Data_4u200_data_begin:
Thr3_User_Data_4u200_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v300 DATA_VA=0x0000618000
attr_data {
	Name = .Thr3_User_Data_4v300 ,
	VA = 0x000000618000 ,/* 0x000000619fc0 */
	RA = 0x00091d4000 ,
	PA = 0x00091d4000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x150a97 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v300_data_begin
Thr3_User_Data_4v300_data_begin:
Thr3_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x000062e000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x00000062e000 ,/* 0x00000062ffc0 */
	RA = 0x00091da000 ,
	PA = 0x00091da000 ,
	TTE_Context = 0x11ce ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c7502 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v000_text_begin
Thr3_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v100 DATA_VA=0x000073a000
attr_data {
	Name = .Thr3_User_Data_4v100 ,
	VA = 0x00000073a000 ,/* 0x00000073bfc0 */
	RA = 0x000909e000 ,
	PA = 0x000909e000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x138233 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v100_data_begin
Thr3_User_Data_4v100_data_begin:
Thr3_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v200 DATA_VA=0x000072c000
attr_data {
	Name = .Thr3_User_Data_4v200 ,
	VA = 0x00000072c000 ,/* 0x00000072dfc0 */
	RA = 0x0009116000 ,
	PA = 0x0009116000 ,
	TTE_Context = 0x088a ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x190012 ,
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
	end_label   = Thr3_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v200_data_begin
Thr3_User_Data_4v200_data_begin:
Thr3_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v301 DATA_VA=0x0000602000
attr_data {
	Name = .Thr3_User_Data_4v301 ,
	VA = 0x000000602000 ,/* 0x000000603fc0 */
	RA = 0x00090ac000 ,
	PA = 0x00090ac000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x150a97 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v301_data_begin
Thr3_User_Data_4v301_data_begin:
Thr3_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4u001 TEXT_VA=0x00cec00000
attr_text {
	Name = .Thr3_User_Text_4u001 ,
	thr3_nz_ctx_tsb_3 ,
	VA = 0x0000cec00000 ,/* 0x0000ceffffc0 */
	RA = 0x08f8800000 ,
	PA = 0x08f8800000 ,
	TTE_Context = 0x11ce ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x0e4 ,
	TTE_Diag    = 0xc5 ,
	TTE_Soft    = 0x11 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Text_4u001_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4u001_text_begin
Thr3_User_Text_4u001_text_begin:
	EXIT_GOOD
Thr3_User_Text_4u001_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u101 DATA_VA=0x00d0000000
attr_data {
	Name = .Thr3_User_Data_4u101 ,
	VA = 0x0000d0000000 ,/* 0x0000dfffffc0 */
	RA = 0x3200000000 ,
	PA = 0x3200000000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x350 ,
	TTE_Diag    = 0xf1 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u101_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u101_data_begin
Thr3_User_Data_4u101_data_begin:
Thr3_User_Data_4u101_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u201 DATA_VA=0x00d5000000
attr_data {
	Name = .Thr3_User_Data_4u201 ,
	VA = 0x0000d5000000 ,/* 0x0000d53fffc0 */
	RA = 0x08ed800000 ,
	PA = 0x08ed800000 ,
	TTE_Context = 0x088a ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x00b ,
	TTE_Diag    = 0xaa ,
	TTE_Soft    = 0x0f ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u201_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u201_data_begin
Thr3_User_Data_4u201_data_begin:
Thr3_User_Data_4u201_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4u002 TEXT_VA=0x00e5000000
attr_text {
	Name = .Thr3_User_Text_4u002 ,
	thr3_nz_ctx_tsb_3 ,
	VA = 0x0000e5000000 ,/* 0x0000e53fffc0 */
	RA = 0x08fac00000 ,
	PA = 0x08fac00000 ,
	TTE_Context = 0x11ce ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x0e4 ,
	TTE_Diag    = 0xc5 ,
	TTE_Soft    = 0x11 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Text_4u002_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4u002_text_begin
Thr3_User_Text_4u002_text_begin:
	EXIT_GOOD
Thr3_User_Text_4u002_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v101 DATA_VA=0x00007d6000
attr_data {
	Name = .Thr3_User_Data_4v101 ,
	VA = 0x0000007d6000 ,/* 0x0000007d7fc0 */
	RA = 0x00090ce000 ,
	PA = 0x00090ce000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x138233 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v101_data_begin
Thr3_User_Data_4v101_data_begin:
Thr3_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v001 TEXT_VA=0x0000664000
attr_text {
	Name = .Thr3_User_Text_4v001 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000000664000 ,/* 0x000000665fc0 */
	RA = 0x0009056000 ,
	PA = 0x0009056000 ,
	TTE_Context = 0x11ce ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c7502 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v001_text_begin
Thr3_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u102 DATA_VA=0x00087e0000
attr_data {
	Name = .Thr3_User_Data_4u102 ,
	VA = 0x0000087e0000 ,/* 0x0000087effc0 */
	RA = 0x0016c10000 ,
	PA = 0x0096c10000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x350 ,
	TTE_Diag    = 0xf1 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u102_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u102_data_begin
Thr3_User_Data_4u102_data_begin:
Thr3_User_Data_4u102_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v002 TEXT_VA=0x00007fc000
attr_text {
	Name = .Thr3_User_Text_4v002 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x0000007fc000 ,/* 0x0000007fdfc0 */
	RA = 0x0009148000 ,
	PA = 0x0009148000 ,
	TTE_Context = 0x11ce ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c7502 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v002_text_begin
Thr3_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v102 DATA_VA=0x0000684000
attr_data {
	Name = .Thr3_User_Data_4v102 ,
	VA = 0x000000684000 ,/* 0x000000685fc0 */
	RA = 0x000914e000 ,
	PA = 0x000914e000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x138233 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v102_data_begin
Thr3_User_Data_4v102_data_begin:
Thr3_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4u003 TEXT_VA=0x0008ff0000
attr_text {
	Name = .Thr3_User_Text_4u003 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x000008ff0000 ,/* 0x000008ffffc0 */
	RA = 0x0016840000 ,
	PA = 0x0096840000 ,
	TTE_Context = 0x11ce ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x0e4 ,
	TTE_Diag    = 0xc5 ,
	TTE_Soft    = 0x11 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Text_4u003_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4u003_text_begin
Thr3_User_Text_4u003_text_begin:
	EXIT_GOOD
Thr3_User_Text_4u003_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u103 DATA_VA=0x00f3400000
attr_data {
	Name = .Thr3_User_Data_4u103 ,
	VA = 0x0000f3400000 ,/* 0x0000f37fffc0 */
	RA = 0x08e3400000 ,
	PA = 0x08e3400000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x350 ,
	TTE_Diag    = 0xf1 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u103_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u103_data_begin
Thr3_User_Data_4u103_data_begin:
Thr3_User_Data_4u103_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v003 TEXT_VA=0x0000650000
attr_text {
	Name = .Thr3_User_Text_4v003 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000000650000 ,/* 0x000000651fc0 */
	RA = 0x00090e2000 ,
	PA = 0x00090e2000 ,
	TTE_Context = 0x11ce ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c7502 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v003_text_begin
Thr3_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v103 DATA_VA=0x00006ea000
attr_data {
	Name = .Thr3_User_Data_4v103 ,
	VA = 0x0000006ea000 ,/* 0x0000006ebfc0 */
	RA = 0x000907c000 ,
	PA = 0x000907c000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x138233 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v103_data_begin
Thr3_User_Data_4v103_data_begin:
Thr3_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4u004 TEXT_VA=0x00ef800000
attr_text {
	Name = .Thr3_User_Text_4u004 ,
	thr3_nz_ctx_tsb_3 ,
	VA = 0x0000ef800000 ,/* 0x0000efbfffc0 */
	RA = 0x08cd000000 ,
	PA = 0x08cd000000 ,
	TTE_Context = 0x11ce ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x0e4 ,
	TTE_Diag    = 0xc5 ,
	TTE_Soft    = 0x11 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Text_4u004_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4u004_text_begin
Thr3_User_Text_4u004_text_begin:
	EXIT_GOOD
Thr3_User_Text_4u004_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v104 DATA_VA=0x00007ca000
attr_data {
	Name = .Thr3_User_Data_4v104 ,
	VA = 0x0000007ca000 ,/* 0x0000007cbfc0 */
	RA = 0x00091be000 ,
	PA = 0x00091be000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x138233 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v104_data_begin
Thr3_User_Data_4v104_data_begin:
Thr3_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v004 TEXT_VA=0x00006fc000
attr_text {
	Name = .Thr3_User_Text_4v004 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x0000006fc000 ,/* 0x0000006fdfc0 */
	RA = 0x0009180000 ,
	PA = 0x0009180000 ,
	TTE_Context = 0x11ce ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c7502 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v004_text_begin
Thr3_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v105 DATA_VA=0x0000784000
attr_data {
	Name = .Thr3_User_Data_4v105 ,
	VA = 0x000000784000 ,/* 0x000000785fc0 */
	RA = 0x000916a000 ,
	PA = 0x000916a000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x138233 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v105_data_begin
Thr3_User_Data_4v105_data_begin:
Thr3_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v005 TEXT_VA=0x0000742000
attr_text {
	Name = .Thr3_User_Text_4v005 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000000742000 ,/* 0x000000743fc0 */
	RA = 0x000912e000 ,
	PA = 0x000912e000 ,
	TTE_Context = 0x11ce ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c7502 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v005_text_begin
Thr3_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u104 DATA_VA=0x0008f30000
attr_data {
	Name = .Thr3_User_Data_4u104 ,
	VA = 0x000008f30000 ,/* 0x000008f3ffc0 */
	RA = 0x00168a0000 ,
	PA = 0x00968a0000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x350 ,
	TTE_Diag    = 0xf1 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u104_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u104_data_begin
Thr3_User_Data_4u104_data_begin:
Thr3_User_Data_4u104_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u105 DATA_VA=0x0008500000
attr_data {
	Name = .Thr3_User_Data_4u105 ,
	VA = 0x000008500000 ,/* 0x00000850ffc0 */
	RA = 0x0016c60000 ,
	PA = 0x0096c60000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x350 ,
	TTE_Diag    = 0xf1 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u105_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u105_data_begin
Thr3_User_Data_4u105_data_begin:
Thr3_User_Data_4u105_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u106 DATA_VA=0x0008960000
attr_data {
	Name = .Thr3_User_Data_4u106 ,
	VA = 0x000008960000 ,/* 0x00000896ffc0 */
	RA = 0x0016630000 ,
	PA = 0x0096630000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x350 ,
	TTE_Diag    = 0xf1 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u106_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u106_data_begin
Thr3_User_Data_4u106_data_begin:
Thr3_User_Data_4u106_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v106 DATA_VA=0x00007b8000
attr_data {
	Name = .Thr3_User_Data_4v106 ,
	VA = 0x0000007b8000 ,/* 0x0000007b9fc0 */
	RA = 0x000919a000 ,
	PA = 0x000919a000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x138233 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v106_data_begin
Thr3_User_Data_4v106_data_begin:
Thr3_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v107 DATA_VA=0x00006f2000
attr_data {
	Name = .Thr3_User_Data_4v107 ,
	VA = 0x0000006f2000 ,/* 0x0000006f3fc0 */
	RA = 0x000910e000 ,
	PA = 0x000910e000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x138233 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v107_data_begin
Thr3_User_Data_4v107_data_begin:
Thr3_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u107 DATA_VA=0x0008d90000
attr_data {
	Name = .Thr3_User_Data_4u107 ,
	VA = 0x000008d90000 ,/* 0x000008d9ffc0 */
	RA = 0x0016480000 ,
	PA = 0x0096480000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x350 ,
	TTE_Diag    = 0xf1 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u107_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u107_data_begin
Thr3_User_Data_4u107_data_begin:
Thr3_User_Data_4u107_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u108 DATA_VA=0x0008bc0000
attr_data {
	Name = .Thr3_User_Data_4u108 ,
	VA = 0x000008bc0000 ,/* 0x000008bcffc0 */
	RA = 0x0016b60000 ,
	PA = 0x0096b60000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x350 ,
	TTE_Diag    = 0xf1 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u108_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u108_data_begin
Thr3_User_Data_4u108_data_begin:
Thr3_User_Data_4u108_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u109 DATA_VA=0x00f7000000
attr_data {
	Name = .Thr3_User_Data_4u109 ,
	VA = 0x0000f7000000 ,/* 0x0000f73fffc0 */
	RA = 0x08c7800000 ,
	PA = 0x08c7800000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x350 ,
	TTE_Diag    = 0xf1 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u109_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u109_data_begin
Thr3_User_Data_4u109_data_begin:
Thr3_User_Data_4u109_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u10a DATA_VA=0x00db800000
attr_data {
	Name = .Thr3_User_Data_4u10a ,
	VA = 0x0000db800000 ,/* 0x0000dbbfffc0 */
	RA = 0x08ed000000 ,
	PA = 0x08ed000000 ,
	TTE_Context = 0x11ce ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x350 ,
	TTE_Diag    = 0xf1 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u10a_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u10a_data_begin
Thr3_User_Data_4u10a_data_begin:
Thr3_User_Data_4u10a_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x00e8400000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	thr4_nz_ctx_tsb_3 ,
	VA = 0x0000e8400000 ,/* 0x0000e87fffc0 */
	RA = 0x00e8000000 ,
	PA = 0x0ae8000000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr4_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr4_user_code_entry
Thr4_user_code_entry:
.global Thr4_User_Text_4v000_text_begin
Thr4_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v100 DATA_VA=0x00007cc000
attr_data {
	Name = .Thr4_User_Data_4v100 ,
	VA = 0x0000007cc000 ,/* 0x0000007cdfc0 */
	RA = 0x000b1c8000 ,
	PA = 0x000b1c8000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v100_data_begin
Thr4_User_Data_4v100_data_begin:
Thr4_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v200 DATA_VA=0x00089d0000
attr_data {
	Name = .Thr4_User_Data_4v200 ,
	VA = 0x0000089d0000 ,/* 0x0000089dffc0 */
	RA = 0x0016430000 ,
	PA = 0x00b6430000 ,
	TTE_Context = 0x009b ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x16bd7d ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v200_data_begin
Thr4_User_Data_4v200_data_begin:
Thr4_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v300 DATA_VA=0x00fa800000
attr_data {
	Name = .Thr4_User_Data_4v300 ,
	VA = 0x0000fa800000 ,/* 0x0000fabfffc0 */
	RA = 0x00d7000000 ,
	PA = 0x0ad7000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x039785 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr4_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v300_data_begin
Thr4_User_Data_4v300_data_begin:
Thr4_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v001 TEXT_VA=0x00d1000000
attr_text {
	Name = .Thr4_User_Text_4v001 ,
	thr4_nz_ctx_tsb_3 ,
	VA = 0x0000d1000000 ,/* 0x0000d13fffc0 */
	RA = 0x00e7800000 ,
	PA = 0x0ae7800000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr4_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v001_text_begin
Thr4_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v101 DATA_VA=0x00cc400000
attr_data {
	Name = .Thr4_User_Data_4v101 ,
	VA = 0x0000cc400000 ,/* 0x0000cc7fffc0 */
	RA = 0x00fc400000 ,
	PA = 0x0afc400000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v101_data_begin
Thr4_User_Data_4v101_data_begin:
Thr4_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v201 DATA_VA=0x0008980000
attr_data {
	Name = .Thr4_User_Data_4v201 ,
	VA = 0x000008980000 ,/* 0x00000898ffc0 */
	RA = 0x00165b0000 ,
	PA = 0x00b65b0000 ,
	TTE_Context = 0x009b ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x16bd7d ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v201_data_begin
Thr4_User_Data_4v201_data_begin:
Thr4_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v301 DATA_VA=0x00007de000
attr_data {
	Name = .Thr4_User_Data_4v301 ,
	VA = 0x0000007de000 ,/* 0x0000007dffc0 */
	RA = 0x000b0be000 ,
	PA = 0x000b0be000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x039785 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v301_data_begin
Thr4_User_Data_4v301_data_begin:
Thr4_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v002 TEXT_VA=0x0008240000
attr_text {
	Name = .Thr4_User_Text_4v002 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x000008240000 ,/* 0x00000824ffc0 */
	RA = 0x0016570000 ,
	PA = 0x00b6570000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v002_text_begin
Thr4_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v102 DATA_VA=0x000067a000
attr_data {
	Name = .Thr4_User_Data_4v102 ,
	VA = 0x00000067a000 ,/* 0x00000067bfc0 */
	RA = 0x000b14a000 ,
	PA = 0x000b14a000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v102_data_begin
Thr4_User_Data_4v102_data_begin:
Thr4_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v202 DATA_VA=0x00006e8000
attr_data {
	Name = .Thr4_User_Data_4v202 ,
	VA = 0x0000006e8000 ,/* 0x0000006e9fc0 */
	RA = 0x000b194000 ,
	PA = 0x000b194000 ,
	TTE_Context = 0x009b ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x16bd7d ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v202_data_begin
Thr4_User_Data_4v202_data_begin:
Thr4_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v003 TEXT_VA=0x0000620000
attr_text {
	Name = .Thr4_User_Text_4v003 ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x000000620000 ,/* 0x000000621fc0 */
	RA = 0x000b0bc000 ,
	PA = 0x000b0bc000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v003_text_begin
Thr4_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v103 DATA_VA=0x00006da000
attr_data {
	Name = .Thr4_User_Data_4v103 ,
	VA = 0x0000006da000 ,/* 0x0000006dbfc0 */
	RA = 0x000b134000 ,
	PA = 0x000b134000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v103_data_begin
Thr4_User_Data_4v103_data_begin:
Thr4_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v203 DATA_VA=0x000073e000
attr_data {
	Name = .Thr4_User_Data_4v203 ,
	VA = 0x00000073e000 ,/* 0x00000073ffc0 */
	RA = 0x000b0c8000 ,
	PA = 0x000b0c8000 ,
	TTE_Context = 0x009b ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x16bd7d ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v203_data_begin
Thr4_User_Data_4v203_data_begin:
Thr4_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v004 TEXT_VA=0x0008760000
attr_text {
	Name = .Thr4_User_Text_4v004 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x000008760000 ,/* 0x00000876ffc0 */
	RA = 0x0016320000 ,
	PA = 0x00b6320000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v004_text_begin
Thr4_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v104 DATA_VA=0x0000654000
attr_data {
	Name = .Thr4_User_Data_4v104 ,
	VA = 0x000000654000 ,/* 0x000000655fc0 */
	RA = 0x000b024000 ,
	PA = 0x000b024000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v104_data_begin
Thr4_User_Data_4v104_data_begin:
Thr4_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v204 DATA_VA=0x0000604000
attr_data {
	Name = .Thr4_User_Data_4v204 ,
	VA = 0x000000604000 ,/* 0x000000605fc0 */
	RA = 0x000b1f0000 ,
	PA = 0x000b1f0000 ,
	TTE_Context = 0x009b ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x16bd7d ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Data_4v204_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v204_data_begin
Thr4_User_Data_4v204_data_begin:
Thr4_User_Data_4v204_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v005 TEXT_VA=0x00d7c00000
attr_text {
	Name = .Thr4_User_Text_4v005 ,
	thr4_nz_ctx_tsb_3 ,
	VA = 0x0000d7c00000 ,/* 0x0000d7ffffc0 */
	RA = 0x00c1000000 ,
	PA = 0x0ac1000000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr4_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v005_text_begin
Thr4_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v105 DATA_VA=0x0000676000
attr_data {
	Name = .Thr4_User_Data_4v105 ,
	VA = 0x000000676000 ,/* 0x000000677fc0 */
	RA = 0x000b104000 ,
	PA = 0x000b104000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v105_data_begin
Thr4_User_Data_4v105_data_begin:
Thr4_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v006 TEXT_VA=0x0008c10000
attr_text {
	Name = .Thr4_User_Text_4v006 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x000008c10000 ,/* 0x000008c1ffc0 */
	RA = 0x00165d0000 ,
	PA = 0x00b65d0000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v006_text_begin
Thr4_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v106 DATA_VA=0x00007fa000
attr_data {
	Name = .Thr4_User_Data_4v106 ,
	VA = 0x0000007fa000 ,/* 0x0000007fbfc0 */
	RA = 0x000b0cc000 ,
	PA = 0x000b0cc000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v106_data_begin
Thr4_User_Data_4v106_data_begin:
Thr4_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v007 TEXT_VA=0x000075a000
attr_text {
	Name = .Thr4_User_Text_4v007 ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x00000075a000 ,/* 0x00000075bfc0 */
	RA = 0x000b1d0000 ,
	PA = 0x000b1d0000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v007_text_begin
Thr4_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v107 DATA_VA=0x0000632000
attr_data {
	Name = .Thr4_User_Data_4v107 ,
	VA = 0x000000632000 ,/* 0x000000633fc0 */
	RA = 0x000b060000 ,
	PA = 0x000b060000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v107_data_begin
Thr4_User_Data_4v107_data_begin:
Thr4_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v008 TEXT_VA=0x0000670000
attr_text {
	Name = .Thr4_User_Text_4v008 ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x000000670000 ,/* 0x000000671fc0 */
	RA = 0x000b1fc000 ,
	PA = 0x000b1fc000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v008_text_begin
Thr4_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v108 DATA_VA=0x00dec00000
attr_data {
	Name = .Thr4_User_Data_4v108 ,
	VA = 0x0000dec00000 ,/* 0x0000deffffc0 */
	RA = 0x00d4800000 ,
	PA = 0x0ad4800000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v108_data_begin
Thr4_User_Data_4v108_data_begin:
Thr4_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v009 TEXT_VA=0x00006de000
attr_text {
	Name = .Thr4_User_Text_4v009 ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x0000006de000 ,/* 0x0000006dffc0 */
	RA = 0x000b058000 ,
	PA = 0x000b058000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v009_text_begin
Thr4_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v109 DATA_VA=0x00006ee000
attr_data {
	Name = .Thr4_User_Data_4v109 ,
	VA = 0x0000006ee000 ,/* 0x0000006effc0 */
	RA = 0x000b02c000 ,
	PA = 0x000b02c000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v109_data_begin
Thr4_User_Data_4v109_data_begin:
Thr4_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00a TEXT_VA=0x00d1400000
attr_text {
	Name = .Thr4_User_Text_4v00a ,
	thr4_nz_ctx_tsb_3 ,
	VA = 0x0000d1400000 ,/* 0x0000d17fffc0 */
	RA = 0x00f4c00000 ,
	PA = 0x0af4c00000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr4_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00a_text_begin
Thr4_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v10a DATA_VA=0x00006f8000
attr_data {
	Name = .Thr4_User_Data_4v10a ,
	VA = 0x0000006f8000 ,/* 0x0000006f9fc0 */
	RA = 0x000b0b8000 ,
	PA = 0x000b0b8000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v10a_data_begin
Thr4_User_Data_4v10a_data_begin:
Thr4_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00b TEXT_VA=0x0008640000
attr_text {
	Name = .Thr4_User_Text_4v00b ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x000008640000 ,/* 0x00000864ffc0 */
	RA = 0x0016d50000 ,
	PA = 0x00b6d50000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00b_text_begin
Thr4_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v10b DATA_VA=0x0000652000
attr_data {
	Name = .Thr4_User_Data_4v10b ,
	VA = 0x000000652000 ,/* 0x000000653fc0 */
	RA = 0x000b096000 ,
	PA = 0x000b096000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v10b_data_begin
Thr4_User_Data_4v10b_data_begin:
Thr4_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00c TEXT_VA=0x00083d0000
attr_text {
	Name = .Thr4_User_Text_4v00c ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x0000083d0000 ,/* 0x0000083dffc0 */
	RA = 0x0016b10000 ,
	PA = 0x00b6b10000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00c_text_begin
Thr4_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v10c DATA_VA=0x00dcc00000
attr_data {
	Name = .Thr4_User_Data_4v10c ,
	VA = 0x0000dcc00000 ,/* 0x0000dcffffc0 */
	RA = 0x00fe800000 ,
	PA = 0x0afe800000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v10c_data_begin
Thr4_User_Data_4v10c_data_begin:
Thr4_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00d TEXT_VA=0x00007c2000
attr_text {
	Name = .Thr4_User_Text_4v00d ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x0000007c2000 ,/* 0x0000007c3fc0 */
	RA = 0x000b1c4000 ,
	PA = 0x000b1c4000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00d_text_begin
Thr4_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v10d DATA_VA=0x000066c000
attr_data {
	Name = .Thr4_User_Data_4v10d ,
	VA = 0x00000066c000 ,/* 0x00000066dfc0 */
	RA = 0x000b072000 ,
	PA = 0x000b072000 ,
	TTE_Context = 0x14c0 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x096003 ,
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
	end_label   = Thr4_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v10d_data_begin
Thr4_User_Data_4v10d_data_begin:
Thr4_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00e TEXT_VA=0x00006d8000
attr_text {
	Name = .Thr4_User_Text_4v00e ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x0000006d8000 ,/* 0x0000006d9fc0 */
	RA = 0x000b154000 ,
	PA = 0x000b154000 ,
	TTE_Context = 0x14c0 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fbf9c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00e_text_begin
Thr4_User_Text_4v00e_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x00f9000000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x0000f9000000 ,/* 0x0000f93fffc0 */
	RA = 0x0cfa000000 ,
	PA = 0x0cfa000000 ,
	TTE_Context = 0x0b17 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1a502e ,
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
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr5_user_code_entry
Thr5_user_code_entry:
.global Thr5_User_Text_4v000_text_begin
Thr5_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u100 DATA_VA=0x0008af0000
attr_data {
	Name = .Thr5_User_Data_4u100 ,
	VA = 0x000008af0000 ,/* 0x000008afffc0 */
	RA = 0x0016f80000 ,
	PA = 0x00d6f80000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u100_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u100_data_begin
Thr5_User_Data_4u100_data_begin:
Thr5_User_Data_4u100_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u200 DATA_VA=0x0000786000
attr_data {
	Name = .Thr5_User_Data_4u200 ,
	VA = 0x000000786000 ,/* 0x000000787fc0 */
	RA = 0x0001132000 ,
	PA = 0x000d132000 ,
	TTE_Context = 0x17c5 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x07f ,
	TTE_Diag    = 0xc1 ,
	TTE_Soft    = 0x19 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u200_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u200_data_begin
Thr5_User_Data_4u200_data_begin:
Thr5_User_Data_4u200_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v300 DATA_VA=0x00c4000000
attr_data {
	Name = .Thr5_User_Data_4v300 ,
	VA = 0x0000c4000000 ,/* 0x0000c43fffc0 */
	RA = 0x0cf2400000 ,
	PA = 0x0cf2400000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1e80ba ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v300_data_begin
Thr5_User_Data_4v300_data_begin:
Thr5_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4u000 TEXT_VA=0x0000662000
attr_text {
	Name = .Thr5_User_Text_4u000 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x000000662000 ,/* 0x000000663fc0 */
	RA = 0x00010e0000 ,
	PA = 0x000d0e0000 ,
	TTE_Context = 0x0b17 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x342 ,
	TTE_Diag    = 0x16 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Text_4u000_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4u000_text_begin
Thr5_User_Text_4u000_text_begin:
	EXIT_GOOD
Thr5_User_Text_4u000_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u101 DATA_VA=0x000077e000
attr_data {
	Name = .Thr5_User_Data_4u101 ,
	VA = 0x00000077e000 ,/* 0x00000077ffc0 */
	RA = 0x0001168000 ,
	PA = 0x000d168000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u101_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u101_data_begin
Thr5_User_Data_4u101_data_begin:
Thr5_User_Data_4u101_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v200 DATA_VA=0x00fa400000
attr_data {
	Name = .Thr5_User_Data_4v200 ,
	VA = 0x0000fa400000 ,/* 0x0000fa7fffc0 */
	RA = 0x0cfb800000 ,
	PA = 0x0cfb800000 ,
	TTE_Context = 0x17c5 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f4028 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v200_data_begin
Thr5_User_Data_4v200_data_begin:
Thr5_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u300 DATA_VA=0x0000774000
attr_data {
	Name = .Thr5_User_Data_4u300 ,
	VA = 0x000000774000 ,/* 0x000000775fc0 */
	RA = 0x00011b0000 ,
	PA = 0x000d1b0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x264 ,
	TTE_Diag    = 0xde ,
	TTE_Soft    = 0x1e ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u300_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u300_data_begin
Thr5_User_Data_4u300_data_begin:
Thr5_User_Data_4u300_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4u001 TEXT_VA=0x0008ae0000
attr_text {
	Name = .Thr5_User_Text_4u001 ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x000008ae0000 ,/* 0x000008aeffc0 */
	RA = 0x00163b0000 ,
	PA = 0x00d63b0000 ,
	TTE_Context = 0x0b17 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x342 ,
	TTE_Diag    = 0x16 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Text_4u001_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4u001_text_begin
Thr5_User_Text_4u001_text_begin:
	EXIT_GOOD
Thr5_User_Text_4u001_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u102 DATA_VA=0x0008690000
attr_data {
	Name = .Thr5_User_Data_4u102 ,
	VA = 0x000008690000 ,/* 0x00000869ffc0 */
	RA = 0x00166b0000 ,
	PA = 0x00d66b0000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u102_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u102_data_begin
Thr5_User_Data_4u102_data_begin:
Thr5_User_Data_4u102_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u201 DATA_VA=0x000067e000
attr_data {
	Name = .Thr5_User_Data_4u201 ,
	VA = 0x00000067e000 ,/* 0x00000067ffc0 */
	RA = 0x0001070000 ,
	PA = 0x000d070000 ,
	TTE_Context = 0x17c5 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x07f ,
	TTE_Diag    = 0xc1 ,
	TTE_Soft    = 0x19 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u201_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u201_data_begin
Thr5_User_Data_4u201_data_begin:
Thr5_User_Data_4u201_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4u002 TEXT_VA=0x0008930000
attr_text {
	Name = .Thr5_User_Text_4u002 ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x000008930000 ,/* 0x00000893ffc0 */
	RA = 0x00166f0000 ,
	PA = 0x00d66f0000 ,
	TTE_Context = 0x0b17 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x342 ,
	TTE_Diag    = 0x16 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Text_4u002_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4u002_text_begin
Thr5_User_Text_4u002_text_begin:
	EXIT_GOOD
Thr5_User_Text_4u002_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u103 DATA_VA=0x0008e00000
attr_data {
	Name = .Thr5_User_Data_4u103 ,
	VA = 0x000008e00000 ,/* 0x000008e0ffc0 */
	RA = 0x0016790000 ,
	PA = 0x00d6790000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u103_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u103_data_begin
Thr5_User_Data_4u103_data_begin:
Thr5_User_Data_4u103_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v201 DATA_VA=0x00cf000000
attr_data {
	Name = .Thr5_User_Data_4v201 ,
	VA = 0x0000cf000000 ,/* 0x0000cf3fffc0 */
	RA = 0x0ce6400000 ,
	PA = 0x0ce6400000 ,
	TTE_Context = 0x17c5 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f4028 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v201_data_begin
Thr5_User_Data_4v201_data_begin:
Thr5_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v001 TEXT_VA=0x00ec400000
attr_text {
	Name = .Thr5_User_Text_4v001 ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x0000ec400000 ,/* 0x0000ec7fffc0 */
	RA = 0x0cff800000 ,
	PA = 0x0cff800000 ,
	TTE_Context = 0x0b17 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1a502e ,
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
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v001_text_begin
Thr5_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u104 DATA_VA=0x00084d0000
attr_data {
	Name = .Thr5_User_Data_4u104 ,
	VA = 0x0000084d0000 ,/* 0x0000084dffc0 */
	RA = 0x0016700000 ,
	PA = 0x00d6700000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u104_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u104_data_begin
Thr5_User_Data_4u104_data_begin:
Thr5_User_Data_4u104_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u202 DATA_VA=0x0008380000
attr_data {
	Name = .Thr5_User_Data_4u202 ,
	VA = 0x000008380000 ,/* 0x00000838ffc0 */
	RA = 0x00167a0000 ,
	PA = 0x00d67a0000 ,
	TTE_Context = 0x17c5 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x07f ,
	TTE_Diag    = 0xc1 ,
	TTE_Soft    = 0x19 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u202_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u202_data_begin
Thr5_User_Data_4u202_data_begin:
Thr5_User_Data_4u202_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4u003 TEXT_VA=0x0000732000
attr_text {
	Name = .Thr5_User_Text_4u003 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x000000732000 ,/* 0x000000733fc0 */
	RA = 0x0001030000 ,
	PA = 0x000d030000 ,
	TTE_Context = 0x0b17 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x342 ,
	TTE_Diag    = 0x16 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Text_4u003_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4u003_text_begin
Thr5_User_Text_4u003_text_begin:
	EXIT_GOOD
Thr5_User_Text_4u003_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u105 DATA_VA=0x00086a0000
attr_data {
	Name = .Thr5_User_Data_4u105 ,
	VA = 0x0000086a0000 ,/* 0x0000086affc0 */
	RA = 0x0016f60000 ,
	PA = 0x00d6f60000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u105_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u105_data_begin
Thr5_User_Data_4u105_data_begin:
Thr5_User_Data_4u105_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v002 TEXT_VA=0x0050000000
attr_text {
	Name = .Thr5_User_Text_4v002 ,
	thr5_nz_ctx_tsb_3 ,
	VA = 0x000050000000 ,/* 0x00005fffffc0 */
	RA = 0x7260000000 ,
	PA = 0x7260000000 ,
	TTE_Context = 0x0b17 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1a502e ,
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
	TTE_Size    = 5 ,
	end_label   = Thr5_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v002_text_begin
Thr5_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u106 DATA_VA=0x0008a00000
attr_data {
	Name = .Thr5_User_Data_4u106 ,
	VA = 0x000008a00000 ,/* 0x000008a0ffc0 */
	RA = 0x0016310000 ,
	PA = 0x00d6310000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u106_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u106_data_begin
Thr5_User_Data_4u106_data_begin:
Thr5_User_Data_4u106_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4u004 TEXT_VA=0x0008280000
attr_text {
	Name = .Thr5_User_Text_4u004 ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x000008280000 ,/* 0x00000828ffc0 */
	RA = 0x0016100000 ,
	PA = 0x00d6100000 ,
	TTE_Context = 0x0b17 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x342 ,
	TTE_Diag    = 0x16 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Text_4u004_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4u004_text_begin
Thr5_User_Text_4u004_text_begin:
	EXIT_GOOD
Thr5_User_Text_4u004_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u107 DATA_VA=0x0000610000
attr_data {
	Name = .Thr5_User_Data_4u107 ,
	VA = 0x000000610000 ,/* 0x000000611fc0 */
	RA = 0x00011f8000 ,
	PA = 0x000d1f8000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u107_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u107_data_begin
Thr5_User_Data_4u107_data_begin:
Thr5_User_Data_4u107_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4u005 TEXT_VA=0x0008330000
attr_text {
	Name = .Thr5_User_Text_4u005 ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x000008330000 ,/* 0x00000833ffc0 */
	RA = 0x0016ee0000 ,
	PA = 0x00d6ee0000 ,
	TTE_Context = 0x0b17 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x342 ,
	TTE_Diag    = 0x16 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Text_4u005_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4u005_text_begin
Thr5_User_Text_4u005_text_begin:
	EXIT_GOOD
Thr5_User_Text_4u005_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u108 DATA_VA=0x0000678000
attr_data {
	Name = .Thr5_User_Data_4u108 ,
	VA = 0x000000678000 ,/* 0x000000679fc0 */
	RA = 0x0001118000 ,
	PA = 0x000d118000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u108_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u108_data_begin
Thr5_User_Data_4u108_data_begin:
Thr5_User_Data_4u108_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4u006 TEXT_VA=0x00006c2000
attr_text {
	Name = .Thr5_User_Text_4u006 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x0000006c2000 ,/* 0x0000006c3fc0 */
	RA = 0x0001048000 ,
	PA = 0x000d048000 ,
	TTE_Context = 0x0b17 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x342 ,
	TTE_Diag    = 0x16 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Text_4u006_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4u006_text_begin
Thr5_User_Text_4u006_text_begin:
	EXIT_GOOD
Thr5_User_Text_4u006_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u109 DATA_VA=0x0000726000
attr_data {
	Name = .Thr5_User_Data_4u109 ,
	VA = 0x000000726000 ,/* 0x000000727fc0 */
	RA = 0x00010da000 ,
	PA = 0x000d0da000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u109_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u109_data_begin
Thr5_User_Data_4u109_data_begin:
Thr5_User_Data_4u109_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4u007 TEXT_VA=0x0000688000
attr_text {
	Name = .Thr5_User_Text_4u007 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x000000688000 ,/* 0x000000689fc0 */
	RA = 0x00011e2000 ,
	PA = 0x000d1e2000 ,
	TTE_Context = 0x0b17 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x342 ,
	TTE_Diag    = 0x16 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Text_4u007_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4u007_text_begin
Thr5_User_Text_4u007_text_begin:
	EXIT_GOOD
Thr5_User_Text_4u007_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v100 DATA_VA=0x00f7800000
attr_data {
	Name = .Thr5_User_Data_4v100 ,
	VA = 0x0000f7800000 ,/* 0x0000f7bfffc0 */
	RA = 0x0cdac00000 ,
	PA = 0x0cdac00000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0678fb ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v100_data_begin
Thr5_User_Data_4v100_data_begin:
Thr5_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u10a DATA_VA=0x0008920000
attr_data {
	Name = .Thr5_User_Data_4u10a ,
	VA = 0x000008920000 ,/* 0x00000892ffc0 */
	RA = 0x00167b0000 ,
	PA = 0x00d67b0000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u10a_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u10a_data_begin
Thr5_User_Data_4u10a_data_begin:
Thr5_User_Data_4u10a_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u10b DATA_VA=0x00007b6000
attr_data {
	Name = .Thr5_User_Data_4u10b ,
	VA = 0x0000007b6000 ,/* 0x0000007b7fc0 */
	RA = 0x000103e000 ,
	PA = 0x000d03e000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u10b_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u10b_data_begin
Thr5_User_Data_4u10b_data_begin:
Thr5_User_Data_4u10b_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u10c DATA_VA=0x000064c000
attr_data {
	Name = .Thr5_User_Data_4u10c ,
	VA = 0x00000064c000 ,/* 0x00000064dfc0 */
	RA = 0x000116c000 ,
	PA = 0x000d16c000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u10c_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u10c_data_begin
Thr5_User_Data_4u10c_data_begin:
Thr5_User_Data_4u10c_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u10d DATA_VA=0x00081f0000
attr_data {
	Name = .Thr5_User_Data_4u10d ,
	VA = 0x0000081f0000 ,/* 0x0000081fffc0 */
	RA = 0x0016730000 ,
	PA = 0x00d6730000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u10d_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u10d_data_begin
Thr5_User_Data_4u10d_data_begin:
Thr5_User_Data_4u10d_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v101 DATA_VA=0x00d9000000
attr_data {
	Name = .Thr5_User_Data_4v101 ,
	VA = 0x0000d9000000 ,/* 0x0000d93fffc0 */
	RA = 0x0cc8c00000 ,
	PA = 0x0cc8c00000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0678fb ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v101_data_begin
Thr5_User_Data_4v101_data_begin:
Thr5_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u10e DATA_VA=0x0008340000
attr_data {
	Name = .Thr5_User_Data_4u10e ,
	VA = 0x000008340000 ,/* 0x00000834ffc0 */
	RA = 0x0016140000 ,
	PA = 0x00d6140000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u10e_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u10e_data_begin
Thr5_User_Data_4u10e_data_begin:
Thr5_User_Data_4u10e_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v102 DATA_VA=0x00fec00000
attr_data {
	Name = .Thr5_User_Data_4v102 ,
	VA = 0x0000fec00000 ,/* 0x0000feffffc0 */
	RA = 0x0cfd000000 ,
	PA = 0x0cfd000000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0678fb ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v102_data_begin
Thr5_User_Data_4v102_data_begin:
Thr5_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u10f DATA_VA=0x000065c000
attr_data {
	Name = .Thr5_User_Data_4u10f ,
	VA = 0x00000065c000 ,/* 0x00000065dfc0 */
	RA = 0x00011de000 ,
	PA = 0x000d1de000 ,
	TTE_Context = 0x0b17 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x031 ,
	TTE_Diag    = 0x0a ,
	TTE_Soft    = 0x09 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u10f_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u10f_data_begin
Thr5_User_Data_4u10f_data_begin:
Thr5_User_Data_4u10f_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u000 TEXT_VA=0x0000764000
attr_text {
	Name = .Thr6_User_Text_4u000 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x000000764000 ,/* 0x000000765fc0 */
	RA = 0x000f028000 ,
	PA = 0x000f028000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u000_text_end ,
	compressimage ,
	}
.text
.global Thr6_user_code_entry
Thr6_user_code_entry:
.global Thr6_User_Text_4u000_text_begin
Thr6_User_Text_4u000_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u000_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u100 DATA_VA=0x000076c000
attr_data {
	Name = .Thr6_User_Data_4u100 ,
	VA = 0x00000076c000 ,/* 0x00000076dfc0 */
	RA = 0x000f012000 ,
	PA = 0x000f012000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u100_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u100_data_begin
Thr6_User_Data_4u100_data_begin:
Thr6_User_Data_4u100_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v200 DATA_VA=0x00ea800000
attr_data {
	Name = .Thr6_User_Data_4v200 ,
	VA = 0x0000ea800000 ,/* 0x0000eabfffc0 */
	RA = 0x00fcc00000 ,
	PA = 0x0efcc00000 ,
	TTE_Context = 0x0de5 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0b3c19 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v200_data_begin
Thr6_User_Data_4v200_data_begin:
Thr6_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u300 DATA_VA=0x01a0000000
attr_data {
	Name = .Thr6_User_Data_4u300 ,
	VA = 0x0001a0000000 ,/* 0x0001afffffc0 */
	RA = 0x3250000000 ,
	PA = 0x3250000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3de ,
	TTE_Diag    = 0x66 ,
	TTE_Soft    = 0x0d ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u300_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u300_data_begin
Thr6_User_Data_4u300_data_begin:
Thr6_User_Data_4u300_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u001 TEXT_VA=0x0008c70000
attr_text {
	Name = .Thr6_User_Text_4u001 ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x000008c70000 ,/* 0x000008c7ffc0 */
	RA = 0x00f6220000 ,
	PA = 0x00f6220000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u001_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u001_text_begin
Thr6_User_Text_4u001_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u001_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v100 DATA_VA=0x00d9c00000
attr_data {
	Name = .Thr6_User_Data_4v100 ,
	VA = 0x0000d9c00000 ,/* 0x0000d9ffffc0 */
	RA = 0x00e6800000 ,
	PA = 0x0ee6800000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x07e3a8 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v100_data_begin
Thr6_User_Data_4v100_data_begin:
Thr6_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u200 DATA_VA=0x00007e0000
attr_data {
	Name = .Thr6_User_Data_4u200 ,
	VA = 0x0000007e0000 ,/* 0x0000007e1fc0 */
	RA = 0x000f1ce000 ,
	PA = 0x000f1ce000 ,
	TTE_Context = 0x0de5 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x01a ,
	TTE_Diag    = 0x14 ,
	TTE_Soft    = 0x19 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u200_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u200_data_begin
Thr6_User_Data_4u200_data_begin:
Thr6_User_Data_4u200_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u301 DATA_VA=0x0008430000
attr_data {
	Name = .Thr6_User_Data_4u301 ,
	VA = 0x000008430000 ,/* 0x00000843ffc0 */
	RA = 0x00f6380000 ,
	PA = 0x00f6380000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3de ,
	TTE_Diag    = 0x66 ,
	TTE_Soft    = 0x0d ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u301_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u301_data_begin
Thr6_User_Data_4u301_data_begin:
Thr6_User_Data_4u301_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u002 TEXT_VA=0x0000648000
attr_text {
	Name = .Thr6_User_Text_4u002 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x000000648000 ,/* 0x000000649fc0 */
	RA = 0x000f15e000 ,
	PA = 0x000f15e000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u002_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u002_text_begin
Thr6_User_Text_4u002_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u002_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u101 DATA_VA=0x00086d0000
attr_data {
	Name = .Thr6_User_Data_4u101 ,
	VA = 0x0000086d0000 ,/* 0x0000086dffc0 */
	RA = 0x00f6660000 ,
	PA = 0x00f6660000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u101_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u101_data_begin
Thr6_User_Data_4u101_data_begin:
Thr6_User_Data_4u101_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v201 DATA_VA=0x00c8400000
attr_data {
	Name = .Thr6_User_Data_4v201 ,
	VA = 0x0000c8400000 ,/* 0x0000c87fffc0 */
	RA = 0x00d0c00000 ,
	PA = 0x0ed0c00000 ,
	TTE_Context = 0x0de5 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0b3c19 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v201_data_begin
Thr6_User_Data_4v201_data_begin:
Thr6_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u302 DATA_VA=0x0008b40000
attr_data {
	Name = .Thr6_User_Data_4u302 ,
	VA = 0x000008b40000 ,/* 0x000008b4ffc0 */
	RA = 0x00f6180000 ,
	PA = 0x00f6180000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3de ,
	TTE_Diag    = 0x66 ,
	TTE_Soft    = 0x0d ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u302_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u302_data_begin
Thr6_User_Data_4u302_data_begin:
Thr6_User_Data_4u302_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u003 TEXT_VA=0x00007f6000
attr_text {
	Name = .Thr6_User_Text_4u003 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x0000007f6000 ,/* 0x0000007f7fc0 */
	RA = 0x000f1ac000 ,
	PA = 0x000f1ac000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u003_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u003_text_begin
Thr6_User_Text_4u003_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u003_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u102 DATA_VA=0x00006c4000
attr_data {
	Name = .Thr6_User_Data_4u102 ,
	VA = 0x0000006c4000 ,/* 0x0000006c5fc0 */
	RA = 0x000f09c000 ,
	PA = 0x000f09c000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u102_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u102_data_begin
Thr6_User_Data_4u102_data_begin:
Thr6_User_Data_4u102_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v202 DATA_VA=0x00ea400000
attr_data {
	Name = .Thr6_User_Data_4v202 ,
	VA = 0x0000ea400000 ,/* 0x0000ea7fffc0 */
	RA = 0x00d0000000 ,
	PA = 0x0ed0000000 ,
	TTE_Context = 0x0de5 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0b3c19 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v202_data_begin
Thr6_User_Data_4v202_data_begin:
Thr6_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u004 TEXT_VA=0x0008ba0000
attr_text {
	Name = .Thr6_User_Text_4u004 ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x000008ba0000 ,/* 0x000008baffc0 */
	RA = 0x00f6cb0000 ,
	PA = 0x00f6cb0000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u004_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u004_text_begin
Thr6_User_Text_4u004_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u004_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v101 DATA_VA=0x00d7400000
attr_data {
	Name = .Thr6_User_Data_4v101 ,
	VA = 0x0000d7400000 ,/* 0x0000d77fffc0 */
	RA = 0x00f7c00000 ,
	PA = 0x0ef7c00000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x07e3a8 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v101_data_begin
Thr6_User_Data_4v101_data_begin:
Thr6_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u005 TEXT_VA=0x00007a8000
attr_text {
	Name = .Thr6_User_Text_4u005 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x0000007a8000 ,/* 0x0000007a9fc0 */
	RA = 0x000f0ba000 ,
	PA = 0x000f0ba000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u005_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u005_text_begin
Thr6_User_Text_4u005_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u005_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u103 DATA_VA=0x0000702000
attr_data {
	Name = .Thr6_User_Data_4u103 ,
	VA = 0x000000702000 ,/* 0x000000703fc0 */
	RA = 0x000f01c000 ,
	PA = 0x000f01c000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u103_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u103_data_begin
Thr6_User_Data_4u103_data_begin:
Thr6_User_Data_4u103_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u006 TEXT_VA=0x00081d0000
attr_text {
	Name = .Thr6_User_Text_4u006 ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x0000081d0000 ,/* 0x0000081dffc0 */
	RA = 0x00f6110000 ,
	PA = 0x00f6110000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u006_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u006_text_begin
Thr6_User_Text_4u006_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u006_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u104 DATA_VA=0x0008e30000
attr_data {
	Name = .Thr6_User_Data_4u104 ,
	VA = 0x000008e30000 ,/* 0x000008e3ffc0 */
	RA = 0x00f69a0000 ,
	PA = 0x00f69a0000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u104_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u104_data_begin
Thr6_User_Data_4u104_data_begin:
Thr6_User_Data_4u104_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u007 TEXT_VA=0x00006a0000
attr_text {
	Name = .Thr6_User_Text_4u007 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x0000006a0000 ,/* 0x0000006a1fc0 */
	RA = 0x000f0fc000 ,
	PA = 0x000f0fc000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u007_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u007_text_begin
Thr6_User_Text_4u007_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u007_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v102 DATA_VA=0x00eb000000
attr_data {
	Name = .Thr6_User_Data_4v102 ,
	VA = 0x0000eb000000 ,/* 0x0000eb3fffc0 */
	RA = 0x00c4400000 ,
	PA = 0x0ec4400000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x07e3a8 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v102_data_begin
Thr6_User_Data_4v102_data_begin:
Thr6_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u008 TEXT_VA=0x00006c0000
attr_text {
	Name = .Thr6_User_Text_4u008 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x0000006c0000 ,/* 0x0000006c1fc0 */
	RA = 0x000f018000 ,
	PA = 0x000f018000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u008_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u008_text_begin
Thr6_User_Text_4u008_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u008_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v103 DATA_VA=0x00f6800000
attr_data {
	Name = .Thr6_User_Data_4v103 ,
	VA = 0x0000f6800000 ,/* 0x0000f6bfffc0 */
	RA = 0x00ccc00000 ,
	PA = 0x0eccc00000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x07e3a8 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v103_data_begin
Thr6_User_Data_4v103_data_begin:
Thr6_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u009 TEXT_VA=0x0008040000
attr_text {
	Name = .Thr6_User_Text_4u009 ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x000008040000 ,/* 0x00000804ffc0 */
	RA = 0x00f6e10000 ,
	PA = 0x00f6e10000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u009_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u009_text_begin
Thr6_User_Text_4u009_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u009_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u105 DATA_VA=0x0000762000
attr_data {
	Name = .Thr6_User_Data_4u105 ,
	VA = 0x000000762000 ,/* 0x000000763fc0 */
	RA = 0x000f07e000 ,
	PA = 0x000f07e000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u105_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u105_data_begin
Thr6_User_Data_4u105_data_begin:
Thr6_User_Data_4u105_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u00a TEXT_VA=0x0008710000
attr_text {
	Name = .Thr6_User_Text_4u00a ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x000008710000 ,/* 0x00000871ffc0 */
	RA = 0x00f6940000 ,
	PA = 0x00f6940000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u00a_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u00a_text_begin
Thr6_User_Text_4u00a_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u00a_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u106 DATA_VA=0x00007ea000
attr_data {
	Name = .Thr6_User_Data_4u106 ,
	VA = 0x0000007ea000 ,/* 0x0000007ebfc0 */
	RA = 0x000f082000 ,
	PA = 0x000f082000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u106_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u106_data_begin
Thr6_User_Data_4u106_data_begin:
Thr6_User_Data_4u106_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u00b TEXT_VA=0x00080d0000
attr_text {
	Name = .Thr6_User_Text_4u00b ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x0000080d0000 ,/* 0x0000080dffc0 */
	RA = 0x00f6500000 ,
	PA = 0x00f6500000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u00b_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u00b_text_begin
Thr6_User_Text_4u00b_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u00b_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u107 DATA_VA=0x0340000000
attr_data {
	Name = .Thr6_User_Data_4u107 ,
	VA = 0x000340000000 ,/* 0x00034fffffc0 */
	RA = 0x3090000000 ,
	PA = 0x3090000000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u107_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u107_data_begin
Thr6_User_Data_4u107_data_begin:
Thr6_User_Data_4u107_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u00c TEXT_VA=0x000065a000
attr_text {
	Name = .Thr6_User_Text_4u00c ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x00000065a000 ,/* 0x00000065bfc0 */
	RA = 0x000f110000 ,
	PA = 0x000f110000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u00c_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u00c_text_begin
Thr6_User_Text_4u00c_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u00c_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u108 DATA_VA=0x00006b4000
attr_data {
	Name = .Thr6_User_Data_4u108 ,
	VA = 0x0000006b4000 ,/* 0x0000006b5fc0 */
	RA = 0x000f176000 ,
	PA = 0x000f176000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u108_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u108_data_begin
Thr6_User_Data_4u108_data_begin:
Thr6_User_Data_4u108_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u00d TEXT_VA=0x00082d0000
attr_text {
	Name = .Thr6_User_Text_4u00d ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x0000082d0000 ,/* 0x0000082dffc0 */
	RA = 0x00f6b20000 ,
	PA = 0x00f6b20000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u00d_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u00d_text_begin
Thr6_User_Text_4u00d_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u00d_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u109 DATA_VA=0x00006aa000
attr_data {
	Name = .Thr6_User_Data_4u109 ,
	VA = 0x0000006aa000 ,/* 0x0000006abfc0 */
	RA = 0x000f0ea000 ,
	PA = 0x000f0ea000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u109_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u109_data_begin
Thr6_User_Data_4u109_data_begin:
Thr6_User_Data_4u109_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u00e TEXT_VA=0x00006b6000
attr_text {
	Name = .Thr6_User_Text_4u00e ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x0000006b6000 ,/* 0x0000006b7fc0 */
	RA = 0x000f18c000 ,
	PA = 0x000f18c000 ,
	TTE_Context = 0x1923 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x020 ,
	TTE_Diag    = 0x02 ,
	TTE_Soft    = 0x1f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Text_4u00e_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4u00e_text_begin
Thr6_User_Text_4u00e_text_begin:
	EXIT_GOOD
Thr6_User_Text_4u00e_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u10a DATA_VA=0x0008fa0000
attr_data {
	Name = .Thr6_User_Data_4u10a ,
	VA = 0x000008fa0000 ,/* 0x000008faffc0 */
	RA = 0x00f69d0000 ,
	PA = 0x00f69d0000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u10a_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u10a_data_begin
Thr6_User_Data_4u10a_data_begin:
Thr6_User_Data_4u10a_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u10b DATA_VA=0x00006f4000
attr_data {
	Name = .Thr6_User_Data_4u10b ,
	VA = 0x0000006f4000 ,/* 0x0000006f5fc0 */
	RA = 0x000f08a000 ,
	PA = 0x000f08a000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u10b_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u10b_data_begin
Thr6_User_Data_4u10b_data_begin:
Thr6_User_Data_4u10b_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u10c DATA_VA=0x02c0000000
attr_data {
	Name = .Thr6_User_Data_4u10c ,
	VA = 0x0002c0000000 ,/* 0x0002cfffffc0 */
	RA = 0x30e0000000 ,
	PA = 0x30e0000000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u10c_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u10c_data_begin
Thr6_User_Data_4u10c_data_begin:
Thr6_User_Data_4u10c_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u10d DATA_VA=0x00089c0000
attr_data {
	Name = .Thr6_User_Data_4u10d ,
	VA = 0x0000089c0000 ,/* 0x0000089cffc0 */
	RA = 0x00f6200000 ,
	PA = 0x00f6200000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u10d_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u10d_data_begin
Thr6_User_Data_4u10d_data_begin:
Thr6_User_Data_4u10d_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u10e DATA_VA=0x00006ec000
attr_data {
	Name = .Thr6_User_Data_4u10e ,
	VA = 0x0000006ec000 ,/* 0x0000006edfc0 */
	RA = 0x000f066000 ,
	PA = 0x000f066000 ,
	TTE_Context = 0x1923 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3cf ,
	TTE_Diag    = 0xeb ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u10e_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u10e_data_begin
Thr6_User_Data_4u10e_data_begin:
Thr6_User_Data_4u10e_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4u000 TEXT_VA=0x0008f70000
attr_text {
	Name = .Thr7_User_Text_4u000 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x000008f70000 ,/* 0x000008f7ffc0 */
	RA = 0x0116fd0000 ,
	PA = 0x0116fd0000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x01f ,
	TTE_Diag    = 0x28 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Text_4u000_text_end ,
	compressimage ,
	}
.text
.global Thr7_user_code_entry
Thr7_user_code_entry:
.global Thr7_User_Text_4u000_text_begin
Thr7_User_Text_4u000_text_begin:
	EXIT_GOOD
Thr7_User_Text_4u000_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u100 DATA_VA=0x0008b30000
attr_data {
	Name = .Thr7_User_Data_4u100 ,
	VA = 0x000008b30000 ,/* 0x000008b3ffc0 */
	RA = 0x0116650000 ,
	PA = 0x0116650000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x309 ,
	TTE_Diag    = 0x1c ,
	TTE_Soft    = 0x0d ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Data_4u100_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4u100_data_begin
Thr7_User_Data_4u100_data_begin:
Thr7_User_Data_4u100_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v200 DATA_VA=0x000060c000
attr_data {
	Name = .Thr7_User_Data_4v200 ,
	VA = 0x00000060c000 ,/* 0x00000060dfc0 */
	RA = 0x00111e4000 ,
	PA = 0x00111e4000 ,
	TTE_Context = 0x0e6f ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1cbf3c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v200_data_begin
Thr7_User_Data_4v200_data_begin:
Thr7_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v300 DATA_VA=0x00f5000000
attr_data {
	Name = .Thr7_User_Data_4v300 ,
	VA = 0x0000f5000000 ,/* 0x0000f53fffc0 */
	RA = 0x00ca800000 ,
	PA = 0x10ca800000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1904e7 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v300_data_begin
Thr7_User_Data_4v300_data_begin:
Thr7_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4u001 TEXT_VA=0x0008c00000
attr_text {
	Name = .Thr7_User_Text_4u001 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x000008c00000 ,/* 0x000008c0ffc0 */
	RA = 0x0116fb0000 ,
	PA = 0x0116fb0000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x01f ,
	TTE_Diag    = 0x28 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Text_4u001_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4u001_text_begin
Thr7_User_Text_4u001_text_begin:
	EXIT_GOOD
Thr7_User_Text_4u001_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u101 DATA_VA=0x0008fd0000
attr_data {
	Name = .Thr7_User_Data_4u101 ,
	VA = 0x000008fd0000 ,/* 0x000008fdffc0 */
	RA = 0x0116070000 ,
	PA = 0x0116070000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x309 ,
	TTE_Diag    = 0x1c ,
	TTE_Soft    = 0x0d ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Data_4u101_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4u101_data_begin
Thr7_User_Data_4u101_data_begin:
Thr7_User_Data_4u101_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v201 DATA_VA=0x0000686000
attr_data {
	Name = .Thr7_User_Data_4v201 ,
	VA = 0x000000686000 ,/* 0x000000687fc0 */
	RA = 0x0011014000 ,
	PA = 0x0011014000 ,
	TTE_Context = 0x0e6f ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1cbf3c ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v201_data_begin
Thr7_User_Data_4v201_data_begin:
Thr7_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v301 DATA_VA=0x00007f8000
attr_data {
	Name = .Thr7_User_Data_4v301 ,
	VA = 0x0000007f8000 ,/* 0x0000007f9fc0 */
	RA = 0x00111a6000 ,
	PA = 0x00111a6000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1904e7 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v301_data_begin
Thr7_User_Data_4v301_data_begin:
Thr7_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4u002 TEXT_VA=0x0008fe0000
attr_text {
	Name = .Thr7_User_Text_4u002 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x000008fe0000 ,/* 0x000008feffc0 */
	RA = 0x0116db0000 ,
	PA = 0x0116db0000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x01f ,
	TTE_Diag    = 0x28 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Text_4u002_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4u002_text_begin
Thr7_User_Text_4u002_text_begin:
	EXIT_GOOD
Thr7_User_Text_4u002_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u102 DATA_VA=0x0008d60000
attr_data {
	Name = .Thr7_User_Data_4u102 ,
	VA = 0x000008d60000 ,/* 0x000008d6ffc0 */
	RA = 0x0116ec0000 ,
	PA = 0x0116ec0000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x309 ,
	TTE_Diag    = 0x1c ,
	TTE_Soft    = 0x0d ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Data_4u102_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4u102_data_begin
Thr7_User_Data_4u102_data_begin:
Thr7_User_Data_4u102_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u300 DATA_VA=0x00087a0000
attr_data {
	Name = .Thr7_User_Data_4u300 ,
	VA = 0x0000087a0000 ,/* 0x0000087affc0 */
	RA = 0x0116a90000 ,
	PA = 0x0116a90000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1ec ,
	TTE_Diag    = 0x5d ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Data_4u300_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4u300_data_begin
Thr7_User_Data_4u300_data_begin:
Thr7_User_Data_4u300_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x00f0c00000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	thr7_nz_ctx_tsb_0 ,
	VA = 0x0000f0c00000 ,/* 0x0000f0ffffc0 */
	RA = 0x00da000000 ,
	PA = 0x10da000000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f2ac6 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v000_text_begin
Thr7_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v100 DATA_VA=0x02f0000000
attr_data {
	Name = .Thr7_User_Data_4v100 ,
	VA = 0x0002f0000000 ,/* 0x0002ffffffc0 */
	RA = 0x11f0000000 ,
	PA = 0x51f0000000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fab79 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr7_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v100_data_begin
Thr7_User_Data_4v100_data_begin:
Thr7_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u301 DATA_VA=0x0008880000
attr_data {
	Name = .Thr7_User_Data_4u301 ,
	VA = 0x000008880000 ,/* 0x00000888ffc0 */
	RA = 0x0116ff0000 ,
	PA = 0x0116ff0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1ec ,
	TTE_Diag    = 0x5d ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Data_4u301_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4u301_data_begin
Thr7_User_Data_4u301_data_begin:
Thr7_User_Data_4u301_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v001 TEXT_VA=0x0150000000
attr_text {
	Name = .Thr7_User_Text_4v001 ,
	thr7_nz_ctx_tsb_1 ,
	VA = 0x000150000000 ,/* 0x00015fffffc0 */
	RA = 0x1270000000 ,
	PA = 0x5270000000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f2ac6 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr7_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v001_text_begin
Thr7_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v101 DATA_VA=0x000068a000
attr_data {
	Name = .Thr7_User_Data_4v101 ,
	VA = 0x00000068a000 ,/* 0x00000068bfc0 */
	RA = 0x001111e000 ,
	PA = 0x001111e000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fab79 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v101_data_begin
Thr7_User_Data_4v101_data_begin:
Thr7_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u302 DATA_VA=0x00087b0000
attr_data {
	Name = .Thr7_User_Data_4u302 ,
	VA = 0x0000087b0000 ,/* 0x0000087bffc0 */
	RA = 0x0116dc0000 ,
	PA = 0x0116dc0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1ec ,
	TTE_Diag    = 0x5d ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Data_4u302_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4u302_data_begin
Thr7_User_Data_4u302_data_begin:
Thr7_User_Data_4u302_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v002 TEXT_VA=0x000069a000
attr_text {
	Name = .Thr7_User_Text_4v002 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x00000069a000 ,/* 0x00000069bfc0 */
	RA = 0x0011128000 ,
	PA = 0x0011128000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f2ac6 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v002_text_begin
Thr7_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u103 DATA_VA=0x00083f0000
attr_data {
	Name = .Thr7_User_Data_4u103 ,
	VA = 0x0000083f0000 ,/* 0x0000083fffc0 */
	RA = 0x01163d0000 ,
	PA = 0x01163d0000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x309 ,
	TTE_Diag    = 0x1c ,
	TTE_Soft    = 0x0d ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Data_4u103_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4u103_data_begin
Thr7_User_Data_4u103_data_begin:
Thr7_User_Data_4u103_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v003 TEXT_VA=0x00e8000000
attr_text {
	Name = .Thr7_User_Text_4v003 ,
	thr7_nz_ctx_tsb_0 ,
	VA = 0x0000e8000000 ,/* 0x0000e83fffc0 */
	RA = 0x00d4c00000 ,
	PA = 0x10d4c00000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f2ac6 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v003_text_begin
Thr7_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v102 DATA_VA=0x03c0000000
attr_data {
	Name = .Thr7_User_Data_4v102 ,
	VA = 0x0003c0000000 ,/* 0x0003cfffffc0 */
	RA = 0x1120000000 ,
	PA = 0x5120000000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fab79 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr7_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v102_data_begin
Thr7_User_Data_4v102_data_begin:
Thr7_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v004 TEXT_VA=0x0000694000
attr_text {
	Name = .Thr7_User_Text_4v004 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x000000694000 ,/* 0x000000695fc0 */
	RA = 0x0011112000 ,
	PA = 0x0011112000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f2ac6 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v004_text_begin
Thr7_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v103 DATA_VA=0x000072a000
attr_data {
	Name = .Thr7_User_Data_4v103 ,
	VA = 0x00000072a000 ,/* 0x00000072bfc0 */
	RA = 0x001104c000 ,
	PA = 0x001104c000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fab79 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v103_data_begin
Thr7_User_Data_4v103_data_begin:
Thr7_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v005 TEXT_VA=0x00006d6000
attr_text {
	Name = .Thr7_User_Text_4v005 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x0000006d6000 ,/* 0x0000006d7fc0 */
	RA = 0x00110a4000 ,
	PA = 0x00110a4000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f2ac6 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v005_text_begin
Thr7_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v104 DATA_VA=0x0000716000
attr_data {
	Name = .Thr7_User_Data_4v104 ,
	VA = 0x000000716000 ,/* 0x000000717fc0 */
	RA = 0x00110a2000 ,
	PA = 0x00110a2000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fab79 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v104_data_begin
Thr7_User_Data_4v104_data_begin:
Thr7_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4u003 TEXT_VA=0x0008a40000
attr_text {
	Name = .Thr7_User_Text_4u003 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x000008a40000 ,/* 0x000008a4ffc0 */
	RA = 0x0116120000 ,
	PA = 0x0116120000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x01f ,
	TTE_Diag    = 0x28 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Text_4u003_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4u003_text_begin
Thr7_User_Text_4u003_text_begin:
	EXIT_GOOD
Thr7_User_Text_4u003_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u104 DATA_VA=0x00089a0000
attr_data {
	Name = .Thr7_User_Data_4u104 ,
	VA = 0x0000089a0000 ,/* 0x0000089affc0 */
	RA = 0x01162c0000 ,
	PA = 0x01162c0000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x309 ,
	TTE_Diag    = 0x1c ,
	TTE_Soft    = 0x0d ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Data_4u104_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4u104_data_begin
Thr7_User_Data_4u104_data_begin:
Thr7_User_Data_4u104_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v006 TEXT_VA=0x00007aa000
attr_text {
	Name = .Thr7_User_Text_4v006 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x0000007aa000 ,/* 0x0000007abfc0 */
	RA = 0x0011086000 ,
	PA = 0x0011086000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f2ac6 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v006_text_begin
Thr7_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u105 DATA_VA=0x0008180000
attr_data {
	Name = .Thr7_User_Data_4u105 ,
	VA = 0x000008180000 ,/* 0x00000818ffc0 */
	RA = 0x0116990000 ,
	PA = 0x0116990000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x309 ,
	TTE_Diag    = 0x1c ,
	TTE_Soft    = 0x0d ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Data_4u105_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4u105_data_begin
Thr7_User_Data_4u105_data_begin:
Thr7_User_Data_4u105_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4u004 TEXT_VA=0x0008d30000
attr_text {
	Name = .Thr7_User_Text_4u004 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x000008d30000 ,/* 0x000008d3ffc0 */
	RA = 0x01164c0000 ,
	PA = 0x01164c0000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x01f ,
	TTE_Diag    = 0x28 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Text_4u004_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4u004_text_begin
Thr7_User_Text_4u004_text_begin:
	EXIT_GOOD
Thr7_User_Text_4u004_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v105 DATA_VA=0x00f0000000
attr_data {
	Name = .Thr7_User_Data_4v105 ,
	VA = 0x0000f0000000 ,/* 0x0000ffffffc0 */
	RA = 0x13e0000000 ,
	PA = 0x53e0000000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fab79 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr7_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v105_data_begin
Thr7_User_Data_4v105_data_begin:
Thr7_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v007 TEXT_VA=0x00c6800000
attr_text {
	Name = .Thr7_User_Text_4v007 ,
	thr7_nz_ctx_tsb_0 ,
	VA = 0x0000c6800000 ,/* 0x0000c6bfffc0 */
	RA = 0x00c2000000 ,
	PA = 0x10c2000000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f2ac6 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v007_text_begin
Thr7_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v106 DATA_VA=0x00d5800000
attr_data {
	Name = .Thr7_User_Data_4v106 ,
	VA = 0x0000d5800000 ,/* 0x0000d5bfffc0 */
	RA = 0x00dfc00000 ,
	PA = 0x10dfc00000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fab79 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v106_data_begin
Thr7_User_Data_4v106_data_begin:
Thr7_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4u005 TEXT_VA=0x00080b0000
attr_text {
	Name = .Thr7_User_Text_4u005 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x0000080b0000 ,/* 0x0000080bffc0 */
	RA = 0x0116060000 ,
	PA = 0x0116060000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x01f ,
	TTE_Diag    = 0x28 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Text_4u005_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4u005_text_begin
Thr7_User_Text_4u005_text_begin:
	EXIT_GOOD
Thr7_User_Text_4u005_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u106 DATA_VA=0x0008080000
attr_data {
	Name = .Thr7_User_Data_4u106 ,
	VA = 0x000008080000 ,/* 0x00000808ffc0 */
	RA = 0x01161e0000 ,
	PA = 0x01161e0000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x309 ,
	TTE_Diag    = 0x1c ,
	TTE_Soft    = 0x0d ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Data_4u106_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4u106_data_begin
Thr7_User_Data_4u106_data_begin:
Thr7_User_Data_4u106_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4u006 TEXT_VA=0x0008d10000
attr_text {
	Name = .Thr7_User_Text_4u006 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x000008d10000 ,/* 0x000008d1ffc0 */
	RA = 0x0116a00000 ,
	PA = 0x0116a00000 ,
	TTE_Context = 0x1392 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x01f ,
	TTE_Diag    = 0x28 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Text_4u006_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4u006_text_begin
Thr7_User_Text_4u006_text_begin:
	EXIT_GOOD
Thr7_User_Text_4u006_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v107 DATA_VA=0x00f9400000
attr_data {
	Name = .Thr7_User_Data_4v107 ,
	VA = 0x0000f9400000 ,/* 0x0000f97fffc0 */
	RA = 0x00c2c00000 ,
	PA = 0x10c2c00000 ,
	TTE_Context = 0x1392 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1fab79 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v107_data_begin
Thr7_User_Data_4v107_data_begin:
Thr7_User_Data_4v107_data_end:
