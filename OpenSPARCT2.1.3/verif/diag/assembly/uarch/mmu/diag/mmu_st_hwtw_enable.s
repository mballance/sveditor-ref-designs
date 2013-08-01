/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_st_hwtw_enable.s
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
#define THR0_NZ_CTX_TSB_CONFIG_0 0x0000000001200030
#define THR0_NZ_CTX_TSB_CONFIG_1 0x0000000001210150
#define THR0_NZ_CTX_TSB_CONFIG_2 0x0000000001220100
#define THR0_NZ_CTX_TSB_CONFIG_3 0x0000000001230010
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
#define THR0_PCONTEXT_0 0x1ed8
#define THR0_PCONTEXT_1 0x0e55
#define THR0_SCONTEXT_0 0x0bc9
#define THR0_SCONTEXT_1 0x0d64
#define THR1_PCONTEXT_0 0x07b8
#define THR1_PCONTEXT_1 0x1984
#define THR1_SCONTEXT_0 0x1564
#define THR1_SCONTEXT_1 0x141c
#define THR2_PCONTEXT_0 0x0610
#define THR2_PCONTEXT_1 0x1ce9
#define THR2_SCONTEXT_0 0x0ad6
#define THR2_SCONTEXT_1 0x0866
#define THR3_PCONTEXT_0 0x0a90
#define THR3_PCONTEXT_1 0x1078
#define THR3_SCONTEXT_0 0x1c86
#define THR3_SCONTEXT_1 0x1242
#define THR4_PCONTEXT_0 0x072f
#define THR4_PCONTEXT_1 0x1b35
#define THR4_SCONTEXT_0 0x0d8e
#define THR4_SCONTEXT_1 0x0652
#define THR5_PCONTEXT_0 0x02cc
#define THR5_PCONTEXT_1 0x1ac9
#define THR5_SCONTEXT_0 0x1234
#define THR5_SCONTEXT_1 0x1550
#define THR6_PCONTEXT_0 0x1d97
#define THR6_PCONTEXT_1 0x09bf
#define THR6_SCONTEXT_0 0x0d1b
#define THR6_SCONTEXT_1 0x1e71
#define THR7_PCONTEXT_0 0x1595
#define THR7_PCONTEXT_1 0x168b
#define THR7_SCONTEXT_0 0x043c
#define THR7_SCONTEXT_1 0x1e58
#define THR0_PTRAP_TEXT_VA 0x000010b30000
#define THR0_PTRAP_TEXT_RA 0x0002df0000
#define THR0_PTRAP_TEXT_PA 0x0002df0000
#define THR1_PTRAP_TEXT_VA 0x000010660000
#define THR1_PTRAP_TEXT_RA 0x0004880000
#define THR1_PTRAP_TEXT_PA 0x0004880000
#define THR2_PTRAP_TEXT_VA 0x000010f20000
#define THR2_PTRAP_TEXT_RA 0x00060d0000
#define THR2_PTRAP_TEXT_PA 0x00060d0000
#define THR3_PTRAP_TEXT_VA 0x000010180000
#define THR3_PTRAP_TEXT_RA 0x0000000000
#define THR3_PTRAP_TEXT_PA 0x0008000000
#define THR4_PTRAP_TEXT_VA 0x000010c50000
#define THR4_PTRAP_TEXT_RA 0x000afc0000
#define THR4_PTRAP_TEXT_PA 0x000afc0000
#define THR5_PTRAP_TEXT_VA 0x000010ec0000
#define THR5_PTRAP_TEXT_RA 0x0000eb0000
#define THR5_PTRAP_TEXT_PA 0x000ceb0000
#define THR6_PTRAP_TEXT_VA 0x0000100a0000
#define THR6_PTRAP_TEXT_RA 0x0000f50000
#define THR6_PTRAP_TEXT_PA 0x000ef50000
#define THR7_PTRAP_TEXT_VA 0x000010b20000
#define THR7_PTRAP_TEXT_RA 0x0010f60000
#define THR7_PTRAP_TEXT_PA 0x0010f60000
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
#define DELAY_LOOP		ta PTRAP_DELAY_LOOP
#define SEM_LOCK                ta PTRAP_SEM_LOCK
#define SEM_RELEASE             ta PTRAP_SEM_RELEASE
#define SEM_GET                 ta PTRAP_SEM_GET 
#define SEM_SET                 ta PTRAP_SEM_SET 
	
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
#define PTRAP_DELAY_LOOP	0x29
#define PTRAP_SEM_LOCK		0x2a
#define PTRAP_SEM_RELEASE	0x2b
#define PTRAP_SEM_GET 		0x2c
#define PTRAP_SEM_SET 		0x2d
	
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
#define HPTRAP_DELAY_LOOP	0x95
#define HPTRAP_SEM_LOCK		0x96
#define HPTRAP_SEM_RELEASE	0x97
#define HPTRAP_SEM_GET 		0x98
#define HPTRAP_SEM_SET 		0x99
	
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
	set	THR_1_PARTID, %g2
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
	set	THR_2_PARTID, %g2
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
	set	THR_3_PARTID, %g2
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
	set	THR_4_PARTID, %g2
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
	set	THR_5_PARTID, %g2
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
	set	THR_6_PARTID, %g2
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
	set	THR_7_PARTID, %g2
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
SECTION .Thr0_Priv_Sect TEXT_VA=0x0001f34000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_2
	VA = 0x000001f34000 ,
	RA = 0x000133e000 ,
	PA = 0x000333e000 ,
	TTE_Context = 0x1ed8 ,
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
	TTE_P       =           1 ,
	TTE_W       =           0 ,
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
SECTION .Thr1_Priv_Sect TEXT_VA=0x0001f66000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_0
	VA = 0x000001f66000 ,
	RA = 0x000534e000 ,
	PA = 0x000534e000 ,
	TTE_Context = 0x07b8 ,
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
	TTE_P       =           0 ,
	TTE_W       =           0 ,
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
SECTION .Thr2_Priv_Sect TEXT_VA=0x0001fce000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_1
	VA = 0x000001fce000 ,
	RA = 0x00013f4000 ,
	PA = 0x00073f4000 ,
	TTE_Context = 0x0610 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       =           1 ,
	TTE_EP      = 1 ,
	TTE_W       =           0 ,
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
SECTION .Thr3_Priv_Sect TEXT_VA=0x0001e84000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_1
	VA = 0x000001e84000 ,
	RA = 0x0009346000 ,
	PA = 0x0009346000 ,
	TTE_Context = 0x0a90 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       =           1 ,
	TTE_EP      = 1 ,
	TTE_W       =           0 ,
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
SECTION .Thr4_Priv_Sect TEXT_VA=0x0001e06000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_1
	VA = 0x000001e06000 ,
	RA = 0x000b254000 ,
	PA = 0x000b254000 ,
	TTE_Context = 0x072f ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       =           0 ,
	TTE_EP      = 1 ,
	TTE_W       =           0 ,
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
SECTION .Thr5_Priv_Sect TEXT_VA=0x0001fd4000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_0
	VA = 0x000001fd4000 ,
	RA = 0x0001224000 ,
	PA = 0x000d224000 ,
	TTE_Context = 0x02cc ,
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
	TTE_P       =           1 ,
	TTE_W       =           0 ,
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
SECTION .Thr6_Priv_Sect TEXT_VA=0x0001fe0000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_2
	VA = 0x000001fe0000 ,
	RA = 0x000f32c000 ,
	PA = 0x000f32c000 ,
	TTE_Context = 0x1d97 ,
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
	TTE_P       =           1 ,
	TTE_W       =           0 ,
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
SECTION .Thr7_Priv_Sect TEXT_VA=0x0001e68000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x000001e68000 ,
	RA = 0x0011332000 ,
	PA = 0x0011332000 ,
	TTE_Context = 0x1595 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       =           1 ,
	TTE_EP      = 1 ,
	TTE_W       =           0 ,
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
	TTE_P       =           0 ,
	TTE_W       =           0 ,
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
	ta	HPTRAP_DELAY_LOOP	/* 0x129 */
	done
.align 32
	ta	HPTRAP_SEM_LOCK		/* 0x12a */
	done
.align 32
	ta	HPTRAP_SEM_RELEASE	/* 0x12b */
	done
.align 32
	ta	HPTRAP_SEM_GET         	/* 0x12c */
	done
.align 32
	ta	HPTRAP_SEM_SET		/* 0x12d */
	done
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
	TTE_P       =           1 ,
	TTE_W       =           0 ,
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
	ta	HPTRAP_DELAY_LOOP	/* 0x129 */
	done
.align 32
	ta	HPTRAP_SEM_LOCK		/* 0x12a */
	done
.align 32
	ta	HPTRAP_SEM_RELEASE	/* 0x12b */
	done
.align 32
	ta	HPTRAP_SEM_GET         	/* 0x12c */
	done
.align 32
	ta	HPTRAP_SEM_SET		/* 0x12d */
	done
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
	TTE_P       =           1 ,
	TTE_EP      = 1 ,
	TTE_W       =           1 ,
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
	ta	HPTRAP_DELAY_LOOP	/* 0x129 */
	done
.align 32
	ta	HPTRAP_SEM_LOCK		/* 0x12a */
	done
.align 32
	ta	HPTRAP_SEM_RELEASE	/* 0x12b */
	done
.align 32
	ta	HPTRAP_SEM_GET         	/* 0x12c */
	done
.align 32
	ta	HPTRAP_SEM_SET		/* 0x12d */
	done
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
	TTE_P       =           0 ,
	TTE_W       =           0 ,
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
	ta	HPTRAP_DELAY_LOOP	/* 0x129 */
	done
.align 32
	ta	HPTRAP_SEM_LOCK		/* 0x12a */
	done
.align 32
	ta	HPTRAP_SEM_RELEASE	/* 0x12b */
	done
.align 32
	ta	HPTRAP_SEM_GET         	/* 0x12c */
	done
.align 32
	ta	HPTRAP_SEM_SET		/* 0x12d */
	done
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
	TTE_P       =           0 ,
	TTE_W       =           1 ,
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
	ta	HPTRAP_DELAY_LOOP	/* 0x129 */
	done
.align 32
	ta	HPTRAP_SEM_LOCK		/* 0x12a */
	done
.align 32
	ta	HPTRAP_SEM_RELEASE	/* 0x12b */
	done
.align 32
	ta	HPTRAP_SEM_GET         	/* 0x12c */
	done
.align 32
	ta	HPTRAP_SEM_SET		/* 0x12d */
	done
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
	TTE_P       =           1 ,
	TTE_W       =           0 ,
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
	ta	HPTRAP_DELAY_LOOP	/* 0x129 */
	done
.align 32
	ta	HPTRAP_SEM_LOCK		/* 0x12a */
	done
.align 32
	ta	HPTRAP_SEM_RELEASE	/* 0x12b */
	done
.align 32
	ta	HPTRAP_SEM_GET         	/* 0x12c */
	done
.align 32
	ta	HPTRAP_SEM_SET		/* 0x12d */
	done
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
	TTE_P       =           0 ,
	TTE_W       =           1 ,
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
	ta	HPTRAP_DELAY_LOOP	/* 0x129 */
	done
.align 32
	ta	HPTRAP_SEM_LOCK		/* 0x12a */
	done
.align 32
	ta	HPTRAP_SEM_RELEASE	/* 0x12b */
	done
.align 32
	ta	HPTRAP_SEM_GET         	/* 0x12c */
	done
.align 32
	ta	HPTRAP_SEM_SET		/* 0x12d */
	done
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
	TTE_P       =           0 ,
	TTE_EP      = 1 ,
	TTE_W       =           0 ,
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
	ta	HPTRAP_DELAY_LOOP	/* 0x129 */
	done
.align 32
	ta	HPTRAP_SEM_LOCK		/* 0x12a */
	done
.align 32
	ta	HPTRAP_SEM_RELEASE	/* 0x12b */
	done
.align 32
	ta	HPTRAP_SEM_GET         	/* 0x12c */
	done
.align 32
	ta	HPTRAP_SEM_SET		/* 0x12d */
	done
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
	ta      HP_GOOD_TRAP
        !setx    ext_trap_0x9_begin, %g1, %g2
        !jmp     %g2
        !nop
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
delay_loop:	/* %i7 = loop count */
	brnz,a	%i7, delay_loop
	sub	%i7, 1, %i7
	done
.align	32	/* 196 */
	setx	ext_trap_sem_lock_begin, %g1, %g2
	jmp	%g2
	nop
.align	32	/* 197 */
	setx	ext_trap_sem_release_begin, %g1, %g2
	jmp	%g2
	nop
.align	32	/* 198 */
	setx	sem_data, %g5, %g4	! %g4 = sem_data
	ldx	[%g4+8], %i7
	done
.align	32	/* 199 */
	setx	sem_data, %g5, %g4	! %g4 = sem_data
	stx	%i7, [%g4+8]
	done
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
.global ext_trap_sem_lock_begin
.global ext_trap_sem_release_begin

ext_trap_sem_lock_begin:
	or	%i7, %g0, %g7		! save %i7
        wr      %g0, ASI_CORE_ID, %asi
        ldxa    [ASI_CORE_ID_VA] %asi, %g1	! %g1 = core id + tid
ext_trap_sem_lock_loop:
	or	%g0, 0x100, %i7
	or	%g0, %g1, %g2
        or	%g0, 0x0fff, %g3	! %g3 = compare value
	setx	sem_data, %g5, %g4	! %g4 = sem_data
	casxa	[%g4] 0x80, %g3, %g2
	cmp	%g2, 0x0fff
	bne,a	%xcc, ext_trap_sem_lock_loop
	ta	HPTRAP_DELAY_LOOP
	or	%g7, %g0, %i7		! restore %i7
	done

ext_trap_sem_release_begin:
        wr      %g0, ASI_CORE_ID, %asi
        ldxa    [ASI_CORE_ID_VA] %asi, %g1	! %g1 = core id + tid
        or	%g0, 0x0fff, %g3	! %g3 = compare value
	setx	sem_data, %g5, %g4	! %g4 = sem_data
	casxa	[%g4] 0x80, %g1, %g3
	done


ext_trap_0x3e_begin:
	! If TL > 1 ==> Zero context
	rdpr	%tl, %g1
	cmp	%g1, 1
	bg,a	%xcc, trap_0x3e_zero_ctx
	or	%g0, 0x10, %g4
	or	%g0, 0x30, %g4
trap_0x3e_zero_ctx:	
	ldxa	[%g0] 0x50, %g1		! %g1 = IMMU_TAG_TARGET
	or	%g0, 0x50, %g2
	ldxa	[%g2] 0x54, %g3		! %g3 = ITSB_PTR_0
trap_0x3e_next_tte:	
	ldda	[%g3] ASI_NUCLEUS_QUAD_LDD, %g6		! %g6 = TTE_TAG, %g7 = TTE_DATA
	cmp	%g6, %g1
	bne,a	%xcc, trap_0x3e_next_tsb_ptr
	add	%g2, 8, %g2
	srlx	%g7, 63, %g5
	brz	%g5, trap_0x3e_next_tsb_ptr
	add	%g2, 8, %g2
	ldxa	[%g4] 0x54, %g5		! %g5 = NZ_TSB_CONFIG
	and	%g5, 0x80, %g5
	brz,a	%g5, trap_0x3e_sun4u
	or	%g0, 0x0800, %g5
trap_0x3e_sun4v:
	or	%g0, 0x0c00, %g5
trap_0x3e_sun4u:
	stxa	%g7, [%g5] 0x54		! Write to IMMU_DATA_IN
	retry
trap_0x3e_next_tsb_ptr:
	add	%g4, 8, %g4
	cmp	%g4, 0x50
	bl,a	%xcc, trap_0x3e_next_tte
	ldxa	[%g2] 0x54, %g3		! %g3 = DTSB_PTR
	done
	
!****************************************************************************************	
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
	
.global sem_data	
sem_data:
	.xword	0x0fff
	.xword	0x0
	
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
SECTION .Thr0_User_Text_4u000 TEXT_VA=0x0001fa2000
attr_text {
	Name = .Thr0_User_Text_4u000 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000001fa2000 ,/* 0x000001fa3fc0 */
	RA = 0x0001386000 ,
	PA = 0x0003386000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x32e ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x10 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Data_4u100 DATA_VA=0x0001ed6000
attr_data {
	Name = .Thr0_User_Data_4u100 ,
	VA = 0x000001ed6000 ,/* 0x000001ed7fc0 */
	RA = 0x0001274000 ,
	PA = 0x0003274000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x186 ,
	TTE_Diag    = 0x8a ,
	TTE_Soft    = 0x0c ,
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
SECTION .Thr0_User_Data_4v200 DATA_VA=0x0134000000
attr_data {
	Name = .Thr0_User_Data_4v200 ,
	VA = 0x000134000000 ,/* 0x0001343fffc0 */
	RA = 0x036d000000 ,
	PA = 0x036d000000 ,
	TTE_Context = 0x0bc9 ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0d2df9 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr0_User_Data_4u300 DATA_VA=0x0001fe2000
attr_data {
	Name = .Thr0_User_Data_4u300 ,
	VA = 0x000001fe2000 ,/* 0x000001fe3fc0 */
	RA = 0x00013e4000 ,
	PA = 0x00033e4000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr0_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x107 ,
	TTE_Diag    = 0xf6 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x0119400000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x000119400000 ,/* 0x0001197fffc0 */
	RA = 0x0363800000 ,
	PA = 0x0363800000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x08c9a7 ,
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
SECTION .Thr0_User_Data_4v100 DATA_VA=0x0106800000
attr_data {
	Name = .Thr0_User_Data_4v100 ,
	VA = 0x000106800000 ,/* 0x000106bfffc0 */
	RA = 0x0366400000 ,
	PA = 0x0366400000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x14580a ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
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
SECTION .Thr0_User_Data_4u200 DATA_VA=0x0001f02000
attr_data {
	Name = .Thr0_User_Data_4u200 ,
	VA = 0x000001f02000 ,/* 0x000001f03fc0 */
	RA = 0x00012b0000 ,
	PA = 0x00032b0000 ,
	TTE_Context = 0x0bc9 ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x184 ,
	TTE_Diag    = 0xbc ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Data_4u301 DATA_VA=0x0001e76000
attr_data {
	Name = .Thr0_User_Data_4u301 ,
	VA = 0x000001e76000 ,/* 0x000001e77fc0 */
	RA = 0x00012b4000 ,
	PA = 0x00032b4000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr0_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x107 ,
	TTE_Diag    = 0xf6 ,
	TTE_Soft    = 0x08 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Text_4u001 TEXT_VA=0x0001ff4000
attr_text {
	Name = .Thr0_User_Text_4u001 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000001ff4000 ,/* 0x000001ff5fc0 */
	RA = 0x000120a000 ,
	PA = 0x000320a000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x32e ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x10 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Data_4u101 DATA_VA=0x0001eb8000
attr_data {
	Name = .Thr0_User_Data_4u101 ,
	VA = 0x000001eb8000 ,/* 0x000001eb9fc0 */
	RA = 0x00012dc000 ,
	PA = 0x00032dc000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x186 ,
	TTE_Diag    = 0x8a ,
	TTE_Soft    = 0x0c ,
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
SECTION .Thr0_User_Data_4u201 DATA_VA=0x0001fd8000
attr_data {
	Name = .Thr0_User_Data_4u201 ,
	VA = 0x000001fd8000 ,/* 0x000001fd9fc0 */
	RA = 0x00012ce000 ,
	PA = 0x00032ce000 ,
	TTE_Context = 0x0bc9 ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x184 ,
	TTE_Diag    = 0xbc ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Text_4u002 TEXT_VA=0x0010140000
attr_text {
	Name = .Thr0_User_Text_4u002 ,
	thr0_nz_ctx_tsb_3 ,
	VA = 0x000010140000 ,/* 0x00001014ffc0 */
	RA = 0x0002e70000 ,
	PA = 0x0002e70000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x32e ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x10 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Data_4u102 DATA_VA=0x0010e40000
attr_data {
	Name = .Thr0_User_Data_4u102 ,
	VA = 0x000010e40000 ,/* 0x000010e4ffc0 */
	RA = 0x00025e0000 ,
	PA = 0x00025e0000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x186 ,
	TTE_Diag    = 0x8a ,
	TTE_Soft    = 0x0c ,
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
SECTION .Thr0_User_Data_4u202 DATA_VA=0x0001ff6000
attr_data {
	Name = .Thr0_User_Data_4u202 ,
	VA = 0x000001ff6000 ,/* 0x000001ff7fc0 */
	RA = 0x0001370000 ,
	PA = 0x0003370000 ,
	TTE_Context = 0x0bc9 ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x184 ,
	TTE_Diag    = 0xbc ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Text_4v001 TEXT_VA=0x012c400000
attr_text {
	Name = .Thr0_User_Text_4v001 ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x00012c400000 ,/* 0x00012c7fffc0 */
	RA = 0x0341c00000 ,
	PA = 0x0341c00000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x08c9a7 ,
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
SECTION .Thr0_User_Data_4u103 DATA_VA=0x0001f06000
attr_data {
	Name = .Thr0_User_Data_4u103 ,
	VA = 0x000001f06000 ,/* 0x000001f07fc0 */
	RA = 0x0001384000 ,
	PA = 0x0003384000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x186 ,
	TTE_Diag    = 0x8a ,
	TTE_Soft    = 0x0c ,
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
SECTION .Thr0_User_Text_4u003 TEXT_VA=0x0001f92000
attr_text {
	Name = .Thr0_User_Text_4u003 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000001f92000 ,/* 0x000001f93fc0 */
	RA = 0x00012c2000 ,
	PA = 0x00032c2000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x32e ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x10 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Data_4u104 DATA_VA=0x0010260000
attr_data {
	Name = .Thr0_User_Data_4u104 ,
	VA = 0x000010260000 ,/* 0x00001026ffc0 */
	RA = 0x0002890000 ,
	PA = 0x0002890000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x186 ,
	TTE_Diag    = 0x8a ,
	TTE_Soft    = 0x0c ,
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
SECTION .Thr0_User_Text_4u004 TEXT_VA=0x0001f32000
attr_text {
	Name = .Thr0_User_Text_4u004 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000001f32000 ,/* 0x000001f33fc0 */
	RA = 0x00012be000 ,
	PA = 0x00032be000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x32e ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x10 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Data_4v101 DATA_VA=0x0112800000
attr_data {
	Name = .Thr0_User_Data_4v101 ,
	VA = 0x000112800000 ,/* 0x000112bfffc0 */
	RA = 0x037d000000 ,
	PA = 0x037d000000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x14580a ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
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
SECTION .Thr0_User_Text_4v002 TEXT_VA=0x0121c00000
attr_text {
	Name = .Thr0_User_Text_4v002 ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x000121c00000 ,/* 0x000121ffffc0 */
	RA = 0x035d800000 ,
	PA = 0x035d800000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x08c9a7 ,
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
SECTION .Thr0_User_Data_4u105 DATA_VA=0x0570000000
attr_data {
	Name = .Thr0_User_Data_4u105 ,
	VA = 0x000570000000 ,/* 0x00057fffffc0 */
	RA = 0x1170000000 ,
	PA = 0x3170000000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x186 ,
	TTE_Diag    = 0x8a ,
	TTE_Soft    = 0x0c ,
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
SECTION .Thr0_User_Text_4u005 TEXT_VA=0x0001ef8000
attr_text {
	Name = .Thr0_User_Text_4u005 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000001ef8000 ,/* 0x000001ef9fc0 */
	RA = 0x00013a2000 ,
	PA = 0x00033a2000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x32e ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x10 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Data_4u106 DATA_VA=0x0470000000
attr_data {
	Name = .Thr0_User_Data_4u106 ,
	VA = 0x000470000000 ,/* 0x00047fffffc0 */
	RA = 0x1100000000 ,
	PA = 0x3100000000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x186 ,
	TTE_Diag    = 0x8a ,
	TTE_Soft    = 0x0c ,
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
SECTION .Thr0_User_Text_4u006 TEXT_VA=0x0001f70000
attr_text {
	Name = .Thr0_User_Text_4u006 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000001f70000 ,/* 0x000001f71fc0 */
	RA = 0x0001250000 ,
	PA = 0x0003250000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x32e ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x10 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Data_4u107 DATA_VA=0x07b0000000
attr_data {
	Name = .Thr0_User_Data_4u107 ,
	VA = 0x0007b0000000 ,/* 0x0007bfffffc0 */
	RA = 0x1040000000 ,
	PA = 0x3040000000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x186 ,
	TTE_Diag    = 0x8a ,
	TTE_Soft    = 0x0c ,
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
SECTION .Thr0_User_Text_4u007 TEXT_VA=0x0001e9a000
attr_text {
	Name = .Thr0_User_Text_4u007 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000001e9a000 ,/* 0x000001e9bfc0 */
	RA = 0x0001396000 ,
	PA = 0x0003396000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x32e ,
	TTE_Diag    = 0xe4 ,
	TTE_Soft    = 0x10 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr0_User_Data_4u108 DATA_VA=0x0010b90000
attr_data {
	Name = .Thr0_User_Data_4u108 ,
	VA = 0x000010b90000 ,/* 0x000010b9ffc0 */
	RA = 0x0002500000 ,
	PA = 0x0002500000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x186 ,
	TTE_Diag    = 0x8a ,
	TTE_Soft    = 0x0c ,
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
SECTION .Thr0_User_Text_4v003 TEXT_VA=0x0116800000
attr_text {
	Name = .Thr0_User_Text_4v003 ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x000116800000 ,/* 0x000116bfffc0 */
	RA = 0x0351000000 ,
	PA = 0x0351000000 ,
	TTE_Context = 0x1ed8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x08c9a7 ,
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
SECTION .Thr0_User_Data_4u109 DATA_VA=0x00109b0000
attr_data {
	Name = .Thr0_User_Data_4u109 ,
	VA = 0x0000109b0000 ,/* 0x0000109bffc0 */
	RA = 0x0002600000 ,
	PA = 0x0002600000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x186 ,
	TTE_Diag    = 0x8a ,
	TTE_Soft    = 0x0c ,
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
SECTION .Thr0_User_Data_4v102 DATA_VA=0x010d400000
attr_data {
	Name = .Thr0_User_Data_4v102 ,
	VA = 0x00010d400000 ,/* 0x00010d7fffc0 */
	RA = 0x036c400000 ,
	PA = 0x036c400000 ,
	TTE_Context = 0x1ed8 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x14580a ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr0_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v102_data_begin
Thr0_User_Data_4v102_data_begin:
Thr0_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4u000 TEXT_VA=0x0010910000
attr_text {
	Name = .Thr1_User_Text_4u000 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x000010910000 ,/* 0x00001091ffc0 */
	RA = 0x00002b0000 ,
	PA = 0x00042b0000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u000_text_end ,
	compressimage ,
	}
.text
.global Thr1_user_code_entry
Thr1_user_code_entry:
.global Thr1_User_Text_4u000_text_begin
Thr1_User_Text_4u000_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u000_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u100 DATA_VA=0x0001fb6000
attr_data {
	Name = .Thr1_User_Data_4u100 ,
	VA = 0x000001fb6000 ,/* 0x000001fb7fc0 */
	RA = 0x00052c0000 ,
	PA = 0x00052c0000 ,
	TTE_Context = 0x07b8 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1d2 ,
	TTE_Diag    = 0xac ,
	TTE_Soft    = 0x02 ,
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
SECTION .Thr1_User_Data_4v200 DATA_VA=0x0530000000
attr_data {
	Name = .Thr1_User_Data_4v200 ,
	VA = 0x000530000000 ,/* 0x00053fffffc0 */
	RA = 0x13f0000000 ,
	PA = 0x53f0000000 ,
	TTE_Context = 0x1564 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f433a ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr1_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v200_data_begin
Thr1_User_Data_4v200_data_begin:
Thr1_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u300 DATA_VA=0x0001fbe000
attr_data {
	Name = .Thr1_User_Data_4u300 ,
	VA = 0x000001fbe000 ,/* 0x000001fbffc0 */
	RA = 0x00053da000 ,
	PA = 0x00053da000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1f2 ,
	TTE_Diag    = 0x66 ,
	TTE_Soft    = 0x03 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr1_User_Text_4u001 TEXT_VA=0x0001fa0000
attr_text {
	Name = .Thr1_User_Text_4u001 ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x000001fa0000 ,/* 0x000001fa1fc0 */
	RA = 0x0005304000 ,
	PA = 0x0005304000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr1_User_Data_4u101 DATA_VA=0x0132400000
attr_data {
	Name = .Thr1_User_Data_4u101 ,
	VA = 0x000132400000 ,/* 0x0001327fffc0 */
	RA = 0x055c000000 ,
	PA = 0x055c000000 ,
	TTE_Context = 0x07b8 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1d2 ,
	TTE_Diag    = 0xac ,
	TTE_Soft    = 0x02 ,
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
SECTION .Thr1_User_Data_4u200 DATA_VA=0x0126800000
attr_data {
	Name = .Thr1_User_Data_4u200 ,
	VA = 0x000126800000 ,/* 0x000126bfffc0 */
	RA = 0x0540000000 ,
	PA = 0x0540000000 ,
	TTE_Context = 0x1564 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1a6 ,
	TTE_Diag    = 0xf3 ,
	TTE_Soft    = 0x0d ,
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
SECTION .Thr1_User_Data_4u301 DATA_VA=0x0010390000
attr_data {
	Name = .Thr1_User_Data_4u301 ,
	VA = 0x000010390000 ,/* 0x00001039ffc0 */
	RA = 0x0000da0000 ,
	PA = 0x0004da0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1f2 ,
	TTE_Diag    = 0x66 ,
	TTE_Soft    = 0x03 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr1_User_Text_4u002 TEXT_VA=0x0010d90000
attr_text {
	Name = .Thr1_User_Text_4u002 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x000010d90000 ,/* 0x000010d9ffc0 */
	RA = 0x00003c0000 ,
	PA = 0x00043c0000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr1_User_Data_4u102 DATA_VA=0x0010a30000
attr_data {
	Name = .Thr1_User_Data_4u102 ,
	VA = 0x000010a30000 ,/* 0x000010a3ffc0 */
	RA = 0x0000960000 ,
	PA = 0x0004960000 ,
	TTE_Context = 0x07b8 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1d2 ,
	TTE_Diag    = 0xac ,
	TTE_Soft    = 0x02 ,
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
SECTION .Thr1_User_Data_4u302 DATA_VA=0x011a400000
attr_data {
	Name = .Thr1_User_Data_4u302 ,
	VA = 0x00011a400000 ,/* 0x00011a7fffc0 */
	RA = 0x056e800000 ,
	PA = 0x056e800000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1f2 ,
	TTE_Diag    = 0x66 ,
	TTE_Soft    = 0x03 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr1_User_Text_4u003 TEXT_VA=0x0001e86000
attr_text {
	Name = .Thr1_User_Text_4u003 ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x000001e86000 ,/* 0x000001e87fc0 */
	RA = 0x00052b2000 ,
	PA = 0x00052b2000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr1_User_Data_4u103 DATA_VA=0x0001f72000
attr_data {
	Name = .Thr1_User_Data_4u103 ,
	VA = 0x000001f72000 ,/* 0x000001f73fc0 */
	RA = 0x000522c000 ,
	PA = 0x000522c000 ,
	TTE_Context = 0x07b8 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1d2 ,
	TTE_Diag    = 0xac ,
	TTE_Soft    = 0x02 ,
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
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x06e0000000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	thr1_nz_ctx_tsb_3 ,
	VA = 0x0006e0000000 ,/* 0x0006efffffc0 */
	RA = 0x1270000000 ,
	PA = 0x5270000000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x176121 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr1_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v000_text_begin
Thr1_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u104 DATA_VA=0x0119000000
attr_data {
	Name = .Thr1_User_Data_4u104 ,
	VA = 0x000119000000 ,/* 0x0001193fffc0 */
	RA = 0x057d400000 ,
	PA = 0x057d400000 ,
	TTE_Context = 0x07b8 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1d2 ,
	TTE_Diag    = 0xac ,
	TTE_Soft    = 0x02 ,
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
SECTION .Thr1_User_Text_4v001 TEXT_VA=0x0610000000
attr_text {
	Name = .Thr1_User_Text_4v001 ,
	thr1_nz_ctx_tsb_3 ,
	VA = 0x000610000000 ,/* 0x00061fffffc0 */
	RA = 0x1050000000 ,
	PA = 0x5050000000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x176121 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr1_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v001_text_begin
Thr1_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4u105 DATA_VA=0x00104f0000
attr_data {
	Name = .Thr1_User_Data_4u105 ,
	VA = 0x0000104f0000 ,/* 0x0000104fffc0 */
	RA = 0x0000380000 ,
	PA = 0x0004380000 ,
	TTE_Context = 0x07b8 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1d2 ,
	TTE_Diag    = 0xac ,
	TTE_Soft    = 0x02 ,
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
SECTION .Thr1_User_Text_4u004 TEXT_VA=0x0001f30000
attr_text {
	Name = .Thr1_User_Text_4u004 ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x000001f30000 ,/* 0x000001f31fc0 */
	RA = 0x0005382000 ,
	PA = 0x0005382000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr1_User_Data_4u106 DATA_VA=0x0135000000
attr_data {
	Name = .Thr1_User_Data_4u106 ,
	VA = 0x000135000000 ,/* 0x0001353fffc0 */
	RA = 0x0579c00000 ,
	PA = 0x0579c00000 ,
	TTE_Context = 0x07b8 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1d2 ,
	TTE_Diag    = 0xac ,
	TTE_Soft    = 0x02 ,
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
SECTION .Thr1_User_Text_4u005 TEXT_VA=0x0010a80000
attr_text {
	Name = .Thr1_User_Text_4u005 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x000010a80000 ,/* 0x000010a8ffc0 */
	RA = 0x0000cf0000 ,
	PA = 0x0004cf0000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr1_User_Data_4u107 DATA_VA=0x0001e80000
attr_data {
	Name = .Thr1_User_Data_4u107 ,
	VA = 0x000001e80000 ,/* 0x000001e81fc0 */
	RA = 0x00053d4000 ,
	PA = 0x00053d4000 ,
	TTE_Context = 0x07b8 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1d2 ,
	TTE_Diag    = 0xac ,
	TTE_Soft    = 0x02 ,
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
SECTION .Thr1_User_Text_4u006 TEXT_VA=0x012f000000
attr_text {
	Name = .Thr1_User_Text_4u006 ,
	thr1_nz_ctx_tsb_2 ,
	VA = 0x00012f000000 ,/* 0x00012f3fffc0 */
	RA = 0x0572400000 ,
	PA = 0x0572400000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr1_User_Data_4u108 DATA_VA=0x0010320000
attr_data {
	Name = .Thr1_User_Data_4u108 ,
	VA = 0x000010320000 ,/* 0x00001032ffc0 */
	RA = 0x0000de0000 ,
	PA = 0x0004de0000 ,
	TTE_Context = 0x07b8 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1d2 ,
	TTE_Diag    = 0xac ,
	TTE_Soft    = 0x02 ,
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
SECTION .Thr1_User_Text_4u007 TEXT_VA=0x013a800000
attr_text {
	Name = .Thr1_User_Text_4u007 ,
	thr1_nz_ctx_tsb_2 ,
	VA = 0x00013a800000 ,/* 0x00013abfffc0 */
	RA = 0x056ac00000 ,
	PA = 0x056ac00000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr1_User_Data_4u109 DATA_VA=0x00104a0000
attr_data {
	Name = .Thr1_User_Data_4u109 ,
	VA = 0x0000104a0000 ,/* 0x0000104affc0 */
	RA = 0x0000580000 ,
	PA = 0x0004580000 ,
	TTE_Context = 0x07b8 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1d2 ,
	TTE_Diag    = 0xac ,
	TTE_Soft    = 0x02 ,
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
SECTION .Thr1_User_Text_4u008 TEXT_VA=0x0001e00000
attr_text {
	Name = .Thr1_User_Text_4u008 ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x000001e00000 ,/* 0x000001e01fc0 */
	RA = 0x000535a000 ,
	PA = 0x000535a000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr1_User_Text_4u009 TEXT_VA=0x0010670000
attr_text {
	Name = .Thr1_User_Text_4u009 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x000010670000 ,/* 0x00001067ffc0 */
	RA = 0x0000a60000 ,
	PA = 0x0004a60000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr1_User_Text_4u00a TEXT_VA=0x013f800000
attr_text {
	Name = .Thr1_User_Text_4u00a ,
	thr1_nz_ctx_tsb_2 ,
	VA = 0x00013f800000 ,/* 0x00013fbfffc0 */
	RA = 0x0562400000 ,
	PA = 0x0562400000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr1_User_Text_4u00b TEXT_VA=0x0001e44000
attr_text {
	Name = .Thr1_User_Text_4u00b ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x000001e44000 ,/* 0x000001e45fc0 */
	RA = 0x000537e000 ,
	PA = 0x000537e000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr1_User_Text_4u00c TEXT_VA=0x0001edc000
attr_text {
	Name = .Thr1_User_Text_4u00c ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x000001edc000 ,/* 0x000001eddfc0 */
	RA = 0x0005388000 ,
	PA = 0x0005388000 ,
	TTE_Context = 0x07b8 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02d ,
	TTE_Diag    = 0x0c ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr1_User_Text_4u00c_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4u00c_text_begin
Thr1_User_Text_4u00c_text_begin:
	EXIT_GOOD
Thr1_User_Text_4u00c_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x0001e88000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	thr2_nz_ctx_tsb_1 ,
	VA = 0x000001e88000 ,/* 0x000001e89fc0 */
	RA = 0x000133c000 ,
	PA = 0x000733c000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1ea597 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
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
	EXIT_GOOD
Thr2_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u100 DATA_VA=0x0620000000
attr_data {
	Name = .Thr2_User_Data_4u100 ,
	VA = 0x000620000000 ,/* 0x00062fffffc0 */
	RA = 0x13a0000000 ,
	PA = 0x73a0000000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3f5 ,
	TTE_Diag    = 0x41 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr2_User_Data_4u200 DATA_VA=0x0010fe0000
attr_data {
	Name = .Thr2_User_Data_4u200 ,
	VA = 0x000010fe0000 ,/* 0x000010feffc0 */
	RA = 0x0000780000 ,
	PA = 0x0006780000 ,
	TTE_Context = 0x0ad6 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x003 ,
	TTE_Diag    = 0xa9 ,
	TTE_Soft    = 0x19 ,
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
SECTION .Thr2_User_Data_4u300 DATA_VA=0x0010f80000
attr_data {
	Name = .Thr2_User_Data_4u300 ,
	VA = 0x000010f80000 ,/* 0x000010f8ffc0 */
	RA = 0x00006e0000 ,
	PA = 0x00066e0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x27a ,
	TTE_Diag    = 0x75 ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr2_User_Text_4u000 TEXT_VA=0x07e0000000
attr_text {
	Name = .Thr2_User_Text_4u000 ,
	thr2_nz_ctx_tsb_0 ,
	VA = 0x0007e0000000 ,/* 0x0007efffffc0 */
	RA = 0x1030000000 ,
	PA = 0x7030000000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2aa ,
	TTE_Diag    = 0xef ,
	TTE_Soft    = 0x0f ,
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
SECTION .Thr2_User_Data_4u101 DATA_VA=0x0010cd0000
attr_data {
	Name = .Thr2_User_Data_4u101 ,
	VA = 0x000010cd0000 ,/* 0x000010cdffc0 */
	RA = 0x0000030000 ,
	PA = 0x0006030000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3f5 ,
	TTE_Diag    = 0x41 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr2_User_Data_4u201 DATA_VA=0x0010400000
attr_data {
	Name = .Thr2_User_Data_4u201 ,
	VA = 0x000010400000 ,/* 0x00001040ffc0 */
	RA = 0x0000570000 ,
	PA = 0x0006570000 ,
	TTE_Context = 0x0ad6 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x003 ,
	TTE_Diag    = 0xa9 ,
	TTE_Soft    = 0x19 ,
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
SECTION .Thr2_User_Data_4v300 DATA_VA=0x0001e34000
attr_data {
	Name = .Thr2_User_Data_4v300 ,
	VA = 0x000001e34000 ,/* 0x000001e35fc0 */
	RA = 0x00012ca000 ,
	PA = 0x00072ca000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x071dc3 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr2_User_Text_4u001 TEXT_VA=0x012f400000
attr_text {
	Name = .Thr2_User_Text_4u001 ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x00012f400000 ,/* 0x00012f7fffc0 */
	RA = 0x016c000000 ,
	PA = 0x076c000000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2aa ,
	TTE_Diag    = 0xef ,
	TTE_Soft    = 0x0f ,
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
SECTION .Thr2_User_Data_4v100 DATA_VA=0x0001e9c000
attr_data {
	Name = .Thr2_User_Data_4v100 ,
	VA = 0x000001e9c000 ,/* 0x000001e9dfc0 */
	RA = 0x0001258000 ,
	PA = 0x0007258000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x049948 ,
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
	end_label   = Thr2_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v100_data_begin
Thr2_User_Data_4v100_data_begin:
Thr2_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u202 DATA_VA=0x00104d0000
attr_data {
	Name = .Thr2_User_Data_4u202 ,
	VA = 0x0000104d0000 ,/* 0x0000104dffc0 */
	RA = 0x0000ab0000 ,
	PA = 0x0006ab0000 ,
	TTE_Context = 0x0ad6 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x003 ,
	TTE_Diag    = 0xa9 ,
	TTE_Soft    = 0x19 ,
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
SECTION .Thr2_User_Data_4u301 DATA_VA=0x0010a20000
attr_data {
	Name = .Thr2_User_Data_4u301 ,
	VA = 0x000010a20000 ,/* 0x000010a2ffc0 */
	RA = 0x00006c0000 ,
	PA = 0x00066c0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x27a ,
	TTE_Diag    = 0x75 ,
	TTE_Soft    = 0x05 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Data_4u301_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4u301_data_begin
Thr2_User_Data_4u301_data_begin:
Thr2_User_Data_4u301_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v001 TEXT_VA=0x0001e8c000
attr_text {
	Name = .Thr2_User_Text_4v001 ,
	thr2_nz_ctx_tsb_1 ,
	VA = 0x000001e8c000 ,/* 0x000001e8dfc0 */
	RA = 0x0001324000 ,
	PA = 0x0007324000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1ea597 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
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
SECTION .Thr2_User_Data_4u102 DATA_VA=0x0010b50000
attr_data {
	Name = .Thr2_User_Data_4u102 ,
	VA = 0x000010b50000 ,/* 0x000010b5ffc0 */
	RA = 0x0000a80000 ,
	PA = 0x0006a80000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3f5 ,
	TTE_Diag    = 0x41 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr2_User_Data_4v200 DATA_VA=0x0001e5c000
attr_data {
	Name = .Thr2_User_Data_4v200 ,
	VA = 0x000001e5c000 ,/* 0x000001e5dfc0 */
	RA = 0x000127a000 ,
	PA = 0x000727a000 ,
	TTE_Context = 0x0ad6 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0ff861 ,
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
	end_label   = Thr2_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v200_data_begin
Thr2_User_Data_4v200_data_begin:
Thr2_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v301 DATA_VA=0x0001e62000
attr_data {
	Name = .Thr2_User_Data_4v301 ,
	VA = 0x000001e62000 ,/* 0x000001e63fc0 */
	RA = 0x000125e000 ,
	PA = 0x000725e000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x071dc3 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr2_User_Text_4v002 TEXT_VA=0x0001e4a000
attr_text {
	Name = .Thr2_User_Text_4v002 ,
	thr2_nz_ctx_tsb_1 ,
	VA = 0x000001e4a000 ,/* 0x000001e4bfc0 */
	RA = 0x000138e000 ,
	PA = 0x000738e000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1ea597 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
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
SECTION .Thr2_User_Data_4v101 DATA_VA=0x0001fa4000
attr_data {
	Name = .Thr2_User_Data_4v101 ,
	VA = 0x000001fa4000 ,/* 0x000001fa5fc0 */
	RA = 0x0001306000 ,
	PA = 0x0007306000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x049948 ,
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
	end_label   = Thr2_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v101_data_begin
Thr2_User_Data_4v101_data_begin:
Thr2_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u203 DATA_VA=0x0109800000
attr_data {
	Name = .Thr2_User_Data_4u203 ,
	VA = 0x000109800000 ,/* 0x000109bfffc0 */
	RA = 0x016dc00000 ,
	PA = 0x076dc00000 ,
	TTE_Context = 0x0ad6 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x003 ,
	TTE_Diag    = 0xa9 ,
	TTE_Soft    = 0x19 ,
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
SECTION .Thr2_User_Text_4u002 TEXT_VA=0x0010a70000
attr_text {
	Name = .Thr2_User_Text_4u002 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x000010a70000 ,/* 0x000010a7ffc0 */
	RA = 0x0000bb0000 ,
	PA = 0x0006bb0000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2aa ,
	TTE_Diag    = 0xef ,
	TTE_Soft    = 0x0f ,
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
SECTION .Thr2_User_Data_4u103 DATA_VA=0x012d400000
attr_data {
	Name = .Thr2_User_Data_4u103 ,
	VA = 0x00012d400000 ,/* 0x00012d7fffc0 */
	RA = 0x0177400000 ,
	PA = 0x0777400000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3f5 ,
	TTE_Diag    = 0x41 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr2_User_Text_4v003 TEXT_VA=0x0001ed0000
attr_text {
	Name = .Thr2_User_Text_4v003 ,
	thr2_nz_ctx_tsb_1 ,
	VA = 0x000001ed0000 ,/* 0x000001ed1fc0 */
	RA = 0x000126c000 ,
	PA = 0x000726c000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1ea597 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
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
SECTION .Thr2_User_Data_4u104 DATA_VA=0x0108000000
attr_data {
	Name = .Thr2_User_Data_4u104 ,
	VA = 0x000108000000 ,/* 0x0001083fffc0 */
	RA = 0x014fc00000 ,
	PA = 0x074fc00000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3f5 ,
	TTE_Diag    = 0x41 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr2_User_Text_4v004 TEXT_VA=0x0001f7e000
attr_text {
	Name = .Thr2_User_Text_4v004 ,
	thr2_nz_ctx_tsb_1 ,
	VA = 0x000001f7e000 ,/* 0x000001f7ffc0 */
	RA = 0x00013de000 ,
	PA = 0x00073de000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1ea597 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v004_text_begin
Thr2_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u105 DATA_VA=0x0130c00000
attr_data {
	Name = .Thr2_User_Data_4u105 ,
	VA = 0x000130c00000 ,/* 0x000130ffffc0 */
	RA = 0x015e000000 ,
	PA = 0x075e000000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3f5 ,
	TTE_Diag    = 0x41 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr2_User_Text_4u003 TEXT_VA=0x00108c0000
attr_text {
	Name = .Thr2_User_Text_4u003 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x0000108c0000 ,/* 0x0000108cffc0 */
	RA = 0x00009d0000 ,
	PA = 0x00069d0000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2aa ,
	TTE_Diag    = 0xef ,
	TTE_Soft    = 0x0f ,
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
SECTION .Thr2_User_Data_4u106 DATA_VA=0x010e400000
attr_data {
	Name = .Thr2_User_Data_4u106 ,
	VA = 0x00010e400000 ,/* 0x00010e7fffc0 */
	RA = 0x0157800000 ,
	PA = 0x0757800000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3f5 ,
	TTE_Diag    = 0x41 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr2_User_Text_4u004 TEXT_VA=0x0100400000
attr_text {
	Name = .Thr2_User_Text_4u004 ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x000100400000 ,/* 0x0001007fffc0 */
	RA = 0x0169800000 ,
	PA = 0x0769800000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2aa ,
	TTE_Diag    = 0xef ,
	TTE_Soft    = 0x0f ,
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
SECTION .Thr2_User_Data_4v102 DATA_VA=0x0001e20000
attr_data {
	Name = .Thr2_User_Data_4v102 ,
	VA = 0x000001e20000 ,/* 0x000001e21fc0 */
	RA = 0x00012d6000 ,
	PA = 0x00072d6000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x049948 ,
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
	end_label   = Thr2_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v102_data_begin
Thr2_User_Data_4v102_data_begin:
Thr2_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4u005 TEXT_VA=0x013bc00000
attr_text {
	Name = .Thr2_User_Text_4u005 ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x00013bc00000 ,/* 0x00013bffffc0 */
	RA = 0x014c400000 ,
	PA = 0x074c400000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2aa ,
	TTE_Diag    = 0xef ,
	TTE_Soft    = 0x0f ,
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
SECTION .Thr2_User_Data_4v103 DATA_VA=0x0001e6e000
attr_data {
	Name = .Thr2_User_Data_4v103 ,
	VA = 0x000001e6e000 ,/* 0x000001e6ffc0 */
	RA = 0x00013e6000 ,
	PA = 0x00073e6000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x049948 ,
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
	end_label   = Thr2_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v103_data_begin
Thr2_User_Data_4v103_data_begin:
Thr2_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v005 TEXT_VA=0x0001f0c000
attr_text {
	Name = .Thr2_User_Text_4v005 ,
	thr2_nz_ctx_tsb_1 ,
	VA = 0x000001f0c000 ,/* 0x000001f0dfc0 */
	RA = 0x0001284000 ,
	PA = 0x0007284000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1ea597 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr2_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v005_text_begin
Thr2_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v104 DATA_VA=0x0001eda000
attr_data {
	Name = .Thr2_User_Data_4v104 ,
	VA = 0x000001eda000 ,/* 0x000001edbfc0 */
	RA = 0x0001222000 ,
	PA = 0x0007222000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x049948 ,
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
	end_label   = Thr2_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v104_data_begin
Thr2_User_Data_4v104_data_begin:
Thr2_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4u006 TEXT_VA=0x0132c00000
attr_text {
	Name = .Thr2_User_Text_4u006 ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x000132c00000 ,/* 0x000132ffffc0 */
	RA = 0x0148400000 ,
	PA = 0x0748400000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2aa ,
	TTE_Diag    = 0xef ,
	TTE_Soft    = 0x0f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Text_4u006_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4u006_text_begin
Thr2_User_Text_4u006_text_begin:
	EXIT_GOOD
Thr2_User_Text_4u006_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v105 DATA_VA=0x0001eb0000
attr_data {
	Name = .Thr2_User_Data_4v105 ,
	VA = 0x000001eb0000 ,/* 0x000001eb1fc0 */
	RA = 0x000123c000 ,
	PA = 0x000723c000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x049948 ,
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
	end_label   = Thr2_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v105_data_begin
Thr2_User_Data_4v105_data_begin:
Thr2_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4u007 TEXT_VA=0x0010210000
attr_text {
	Name = .Thr2_User_Text_4u007 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x000010210000 ,/* 0x00001021ffc0 */
	RA = 0x00004b0000 ,
	PA = 0x00064b0000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2aa ,
	TTE_Diag    = 0xef ,
	TTE_Soft    = 0x0f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Text_4u007_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4u007_text_begin
Thr2_User_Text_4u007_text_begin:
	EXIT_GOOD
Thr2_User_Text_4u007_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v106 DATA_VA=0x0001ea2000
attr_data {
	Name = .Thr2_User_Data_4v106 ,
	VA = 0x000001ea2000 ,/* 0x000001ea3fc0 */
	RA = 0x00013ec000 ,
	PA = 0x00073ec000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x049948 ,
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
	end_label   = Thr2_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v106_data_begin
Thr2_User_Data_4v106_data_begin:
Thr2_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4u008 TEXT_VA=0x0010c60000
attr_text {
	Name = .Thr2_User_Text_4u008 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x000010c60000 ,/* 0x000010c6ffc0 */
	RA = 0x0000930000 ,
	PA = 0x0006930000 ,
	TTE_Context = 0x0610 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2aa ,
	TTE_Diag    = 0xef ,
	TTE_Soft    = 0x0f ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr2_User_Text_4u008_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4u008_text_begin
Thr2_User_Text_4u008_text_begin:
	EXIT_GOOD
Thr2_User_Text_4u008_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v107 DATA_VA=0x0001e10000
attr_data {
	Name = .Thr2_User_Data_4v107 ,
	VA = 0x000001e10000 ,/* 0x000001e11fc0 */
	RA = 0x0001338000 ,
	PA = 0x0007338000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x049948 ,
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
	end_label   = Thr2_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v107_data_begin
Thr2_User_Data_4v107_data_begin:
Thr2_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v108 DATA_VA=0x0001efe000
attr_data {
	Name = .Thr2_User_Data_4v108 ,
	VA = 0x000001efe000 ,/* 0x000001efffc0 */
	RA = 0x000135c000 ,
	PA = 0x000735c000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x049948 ,
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
	end_label   = Thr2_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v108_data_begin
Thr2_User_Data_4v108_data_begin:
Thr2_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4u107 DATA_VA=0x0010f70000
attr_data {
	Name = .Thr2_User_Data_4u107 ,
	VA = 0x000010f70000 ,/* 0x000010f7ffc0 */
	RA = 0x0000c70000 ,
	PA = 0x0006c70000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3f5 ,
	TTE_Diag    = 0x41 ,
	TTE_Soft    = 0x1c ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr2_User_Data_4v109 DATA_VA=0x0001ebc000
attr_data {
	Name = .Thr2_User_Data_4v109 ,
	VA = 0x000001ebc000 ,/* 0x000001ebdfc0 */
	RA = 0x0001378000 ,
	PA = 0x0007378000 ,
	TTE_Context = 0x0610 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x049948 ,
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
	end_label   = Thr2_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v109_data_begin
Thr2_User_Data_4v109_data_begin:
Thr2_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4u000 TEXT_VA=0x0134800000
attr_text {
	Name = .Thr3_User_Text_4u000 ,
	thr3_nz_ctx_tsb_3 ,
	VA = 0x000134800000 ,/* 0x000134bfffc0 */
	RA = 0x096d400000 ,
	PA = 0x096d400000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x028 ,
	TTE_Diag    = 0x95 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Data_4u100 DATA_VA=0x011e400000
attr_data {
	Name = .Thr3_User_Data_4u100 ,
	VA = 0x00011e400000 ,/* 0x00011e7fffc0 */
	RA = 0x0945000000 ,
	PA = 0x0945000000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x03e ,
	TTE_Diag    = 0xc9 ,
	TTE_Soft    = 0x02 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Data_4v200 DATA_VA=0x0001e04000
attr_data {
	Name = .Thr3_User_Data_4v200 ,
	VA = 0x000001e04000 ,/* 0x000001e05fc0 */
	RA = 0x00093ee000 ,
	PA = 0x00093ee000 ,
	TTE_Context = 0x1c86 ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1cda69 ,
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
SECTION .Thr3_User_Data_4u300 DATA_VA=0x011e800000
attr_data {
	Name = .Thr3_User_Data_4u300 ,
	VA = 0x00011e800000 ,/* 0x00011ebfffc0 */
	RA = 0x0944400000 ,
	PA = 0x0944400000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x199 ,
	TTE_Diag    = 0x9e ,
	TTE_Soft    = 0x04 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u300_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u300_data_begin
Thr3_User_Data_4u300_data_begin:
Thr3_User_Data_4u300_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4u001 TEXT_VA=0x0010000000
attr_text {
	Name = .Thr3_User_Text_4u001 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x000010000000 ,/* 0x00001000ffc0 */
	RA = 0x0000c20000 ,
	PA = 0x0008c20000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x028 ,
	TTE_Diag    = 0x95 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Data_4u101 DATA_VA=0x00103e0000
attr_data {
	Name = .Thr3_User_Data_4u101 ,
	VA = 0x0000103e0000 ,/* 0x0000103effc0 */
	RA = 0x0000ff0000 ,
	PA = 0x0008ff0000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x03e ,
	TTE_Diag    = 0xc9 ,
	TTE_Soft    = 0x02 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Data_4v201 DATA_VA=0x0001f86000
attr_data {
	Name = .Thr3_User_Data_4v201 ,
	VA = 0x000001f86000 ,/* 0x000001f87fc0 */
	RA = 0x0009218000 ,
	PA = 0x0009218000 ,
	TTE_Context = 0x1c86 ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1cda69 ,
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
	end_label   = Thr3_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v201_data_begin
Thr3_User_Data_4v201_data_begin:
Thr3_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u301 DATA_VA=0x0010eb0000
attr_data {
	Name = .Thr3_User_Data_4u301 ,
	VA = 0x000010eb0000 ,/* 0x000010ebffc0 */
	RA = 0x0000710000 ,
	PA = 0x0008710000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x199 ,
	TTE_Diag    = 0x9e ,
	TTE_Soft    = 0x04 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u301_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u301_data_begin
Thr3_User_Data_4u301_data_begin:
Thr3_User_Data_4u301_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4u002 TEXT_VA=0x0110000000
attr_text {
	Name = .Thr3_User_Text_4u002 ,
	thr3_nz_ctx_tsb_3 ,
	VA = 0x000110000000 ,/* 0x0001103fffc0 */
	RA = 0x0960800000 ,
	PA = 0x0960800000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x028 ,
	TTE_Diag    = 0x95 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Data_4u102 DATA_VA=0x0010110000
attr_data {
	Name = .Thr3_User_Data_4u102 ,
	VA = 0x000010110000 ,/* 0x00001011ffc0 */
	RA = 0x0000f40000 ,
	PA = 0x0008f40000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x03e ,
	TTE_Diag    = 0xc9 ,
	TTE_Soft    = 0x02 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Data_4u302 DATA_VA=0x0640000000
attr_data {
	Name = .Thr3_User_Data_4u302 ,
	VA = 0x000640000000 ,/* 0x00064fffffc0 */
	RA = 0x3390000000 ,
	PA = 0x3390000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x199 ,
	TTE_Diag    = 0x9e ,
	TTE_Soft    = 0x04 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Data_4u302_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4u302_data_begin
Thr3_User_Data_4u302_data_begin:
Thr3_User_Data_4u302_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x0001f26000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000001f26000 ,/* 0x000001f27fc0 */
	RA = 0x0009302000 ,
	PA = 0x0009302000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1757d5 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
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
.global Thr3_User_Text_4v000_text_begin
Thr3_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u103 DATA_VA=0x0114800000
attr_data {
	Name = .Thr3_User_Data_4u103 ,
	VA = 0x000114800000 ,/* 0x000114bfffc0 */
	RA = 0x0968400000 ,
	PA = 0x0968400000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x03e ,
	TTE_Diag    = 0xc9 ,
	TTE_Soft    = 0x02 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Text_4u003 TEXT_VA=0x010c000000
attr_text {
	Name = .Thr3_User_Text_4u003 ,
	thr3_nz_ctx_tsb_3 ,
	VA = 0x00010c000000 ,/* 0x00010c3fffc0 */
	RA = 0x0974800000 ,
	PA = 0x0974800000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x028 ,
	TTE_Diag    = 0x95 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Data_4u104 DATA_VA=0x0126000000
attr_data {
	Name = .Thr3_User_Data_4u104 ,
	VA = 0x000126000000 ,/* 0x0001263fffc0 */
	RA = 0x0955400000 ,
	PA = 0x0955400000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x03e ,
	TTE_Diag    = 0xc9 ,
	TTE_Soft    = 0x02 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Text_4u004 TEXT_VA=0x0010c40000
attr_text {
	Name = .Thr3_User_Text_4u004 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x000010c40000 ,/* 0x000010c4ffc0 */
	RA = 0x0000910000 ,
	PA = 0x0008910000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x028 ,
	TTE_Diag    = 0x95 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Data_4u105 DATA_VA=0x0010780000
attr_data {
	Name = .Thr3_User_Data_4u105 ,
	VA = 0x000010780000 ,/* 0x00001078ffc0 */
	RA = 0x0000c90000 ,
	PA = 0x0008c90000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x03e ,
	TTE_Diag    = 0xc9 ,
	TTE_Soft    = 0x02 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Text_4u005 TEXT_VA=0x010ec00000
attr_text {
	Name = .Thr3_User_Text_4u005 ,
	thr3_nz_ctx_tsb_3 ,
	VA = 0x00010ec00000 ,/* 0x00010effffc0 */
	RA = 0x0967400000 ,
	PA = 0x0967400000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x028 ,
	TTE_Diag    = 0x95 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Text_4u005_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4u005_text_begin
Thr3_User_Text_4u005_text_begin:
	EXIT_GOOD
Thr3_User_Text_4u005_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u106 DATA_VA=0x0010cc0000
attr_data {
	Name = .Thr3_User_Data_4u106 ,
	VA = 0x000010cc0000 ,/* 0x000010ccffc0 */
	RA = 0x0000f80000 ,
	PA = 0x0008f80000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x03e ,
	TTE_Diag    = 0xc9 ,
	TTE_Soft    = 0x02 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Text_4v001 TEXT_VA=0x0001f6c000
attr_text {
	Name = .Thr3_User_Text_4v001 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000001f6c000 ,/* 0x000001f6dfc0 */
	RA = 0x0009294000 ,
	PA = 0x0009294000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1757d5 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
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
SECTION .Thr3_User_Data_4v100 DATA_VA=0x0001ff2000
attr_data {
	Name = .Thr3_User_Data_4v100 ,
	VA = 0x000001ff2000 ,/* 0x000001ff3fc0 */
	RA = 0x00092d4000 ,
	PA = 0x00092d4000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x12735a ,
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
	end_label   = Thr3_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v100_data_begin
Thr3_User_Data_4v100_data_begin:
Thr3_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v002 TEXT_VA=0x0001fae000
attr_text {
	Name = .Thr3_User_Text_4v002 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000001fae000 ,/* 0x000001faffc0 */
	RA = 0x00092b8000 ,
	PA = 0x00092b8000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1757d5 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
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
SECTION .Thr3_User_Data_4u107 DATA_VA=0x0010550000
attr_data {
	Name = .Thr3_User_Data_4u107 ,
	VA = 0x000010550000 ,/* 0x00001055ffc0 */
	RA = 0x0000310000 ,
	PA = 0x0008310000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x03e ,
	TTE_Diag    = 0xc9 ,
	TTE_Soft    = 0x02 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Text_4v003 TEXT_VA=0x0001e3c000
attr_text {
	Name = .Thr3_User_Text_4v003 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000001e3c000 ,/* 0x000001e3dfc0 */
	RA = 0x000922e000 ,
	PA = 0x000922e000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1757d5 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
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
SECTION .Thr3_User_Data_4v101 DATA_VA=0x0001e2c000
attr_data {
	Name = .Thr3_User_Data_4v101 ,
	VA = 0x000001e2c000 ,/* 0x000001e2dfc0 */
	RA = 0x00093a0000 ,
	PA = 0x00093a0000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x12735a ,
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
	end_label   = Thr3_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v101_data_begin
Thr3_User_Data_4v101_data_begin:
Thr3_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v004 TEXT_VA=0x0001e1c000
attr_text {
	Name = .Thr3_User_Text_4v004 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000001e1c000 ,/* 0x000001e1dfc0 */
	RA = 0x00093fc000 ,
	PA = 0x00093fc000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1757d5 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
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
SECTION .Thr3_User_Data_4v102 DATA_VA=0x0001faa000
attr_data {
	Name = .Thr3_User_Data_4v102 ,
	VA = 0x000001faa000 ,/* 0x000001fabfc0 */
	RA = 0x0009252000 ,
	PA = 0x0009252000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x12735a ,
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
	end_label   = Thr3_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v102_data_begin
Thr3_User_Data_4v102_data_begin:
Thr3_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4u006 TEXT_VA=0x011b800000
attr_text {
	Name = .Thr3_User_Text_4u006 ,
	thr3_nz_ctx_tsb_3 ,
	VA = 0x00011b800000 ,/* 0x00011bbfffc0 */
	RA = 0x0973800000 ,
	PA = 0x0973800000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 3 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x028 ,
	TTE_Diag    = 0x95 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Text_4u006_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4u006_text_begin
Thr3_User_Text_4u006_text_begin:
	EXIT_GOOD
Thr3_User_Text_4u006_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4u108 DATA_VA=0x0010c00000
attr_data {
	Name = .Thr3_User_Data_4u108 ,
	VA = 0x000010c00000 ,/* 0x000010c0ffc0 */
	RA = 0x0000840000 ,
	PA = 0x0008840000 ,
	TTE_Context = 0x0a90 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x03e ,
	TTE_Diag    = 0xc9 ,
	TTE_Soft    = 0x02 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr3_User_Text_4v005 TEXT_VA=0x0001e16000
attr_text {
	Name = .Thr3_User_Text_4v005 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000001e16000 ,/* 0x000001e17fc0 */
	RA = 0x000933a000 ,
	PA = 0x000933a000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1757d5 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
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
SECTION .Thr3_User_Text_4u007 TEXT_VA=0x0010b70000
attr_text {
	Name = .Thr3_User_Text_4u007 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x000010b70000 ,/* 0x000010b7ffc0 */
	RA = 0x0000a70000 ,
	PA = 0x0008a70000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x028 ,
	TTE_Diag    = 0x95 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr3_User_Text_4u007_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4u007_text_begin
Thr3_User_Text_4u007_text_begin:
	EXIT_GOOD
Thr3_User_Text_4u007_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v006 TEXT_VA=0x0001ef4000
attr_text {
	Name = .Thr3_User_Text_4v006 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000001ef4000 ,/* 0x000001ef5fc0 */
	RA = 0x0009276000 ,
	PA = 0x0009276000 ,
	TTE_Context = 0x0a90 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1757d5 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v006_text_begin
Thr3_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x0010040000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x000010040000 ,/* 0x00001004ffc0 */
	RA = 0x0000e60000 ,
	PA = 0x000ae60000 ,
	TTE_Context = 0x072f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x17c495 ,
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
	TTE_Size    = 1 ,
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
SECTION .Thr4_User_Data_4v100 DATA_VA=0x0001f90000
attr_data {
	Name = .Thr4_User_Data_4v100 ,
	VA = 0x000001f90000 ,/* 0x000001f91fc0 */
	RA = 0x000b242000 ,
	PA = 0x000b242000 ,
	TTE_Context = 0x072f ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f2444 ,
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
	end_label   = Thr4_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v100_data_begin
Thr4_User_Data_4v100_data_begin:
Thr4_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v200 DATA_VA=0x00102f0000
attr_data {
	Name = .Thr4_User_Data_4v200 ,
	VA = 0x0000102f0000 ,/* 0x0000102fffc0 */
	RA = 0x00009c0000 ,
	PA = 0x000a9c0000 ,
	TTE_Context = 0x0d8e ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x10da95 ,
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
SECTION .Thr4_User_Data_4v300 DATA_VA=0x0010190000
attr_data {
	Name = .Thr4_User_Data_4v300 ,
	VA = 0x000010190000 ,/* 0x00001019ffc0 */
	RA = 0x00001d0000 ,
	PA = 0x000a1d0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x05cb3f ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v300_data_begin
Thr4_User_Data_4v300_data_begin:
Thr4_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v001 TEXT_VA=0x0010a90000
attr_text {
	Name = .Thr4_User_Text_4v001 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x000010a90000 ,/* 0x000010a9ffc0 */
	RA = 0x0000740000 ,
	PA = 0x000a740000 ,
	TTE_Context = 0x072f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x17c495 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v001_text_begin
Thr4_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v101 DATA_VA=0x0010510000
attr_data {
	Name = .Thr4_User_Data_4v101 ,
	VA = 0x000010510000 ,/* 0x00001051ffc0 */
	RA = 0x0000cd0000 ,
	PA = 0x000acd0000 ,
	TTE_Context = 0x072f ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f2444 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v101_data_begin
Thr4_User_Data_4v101_data_begin:
Thr4_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v201 DATA_VA=0x0001e46000
attr_data {
	Name = .Thr4_User_Data_4v201 ,
	VA = 0x000001e46000 ,/* 0x000001e47fc0 */
	RA = 0x000b2a8000 ,
	PA = 0x000b2a8000 ,
	TTE_Context = 0x0d8e ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x10da95 ,
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
	end_label   = Thr4_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v201_data_begin
Thr4_User_Data_4v201_data_begin:
Thr4_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v301 DATA_VA=0x0001eaa000
attr_data {
	Name = .Thr4_User_Data_4v301 ,
	VA = 0x000001eaa000 ,/* 0x000001eabfc0 */
	RA = 0x000b23a000 ,
	PA = 0x000b23a000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x05cb3f ,
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
	end_label   = Thr4_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v301_data_begin
Thr4_User_Data_4v301_data_begin:
Thr4_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v002 TEXT_VA=0x0001fe8000
attr_text {
	Name = .Thr4_User_Text_4v002 ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x000001fe8000 ,/* 0x000001fe9fc0 */
	RA = 0x000b24a000 ,
	PA = 0x000b24a000 ,
	TTE_Context = 0x072f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x17c495 ,
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
	end_label   = Thr4_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v002_text_begin
Thr4_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v102 DATA_VA=0x0001ef0000
attr_data {
	Name = .Thr4_User_Data_4v102 ,
	VA = 0x000001ef0000 ,/* 0x000001ef1fc0 */
	RA = 0x000b2c8000 ,
	PA = 0x000b2c8000 ,
	TTE_Context = 0x072f ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f2444 ,
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
	end_label   = Thr4_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v102_data_begin
Thr4_User_Data_4v102_data_begin:
Thr4_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v202 DATA_VA=0x0131000000
attr_data {
	Name = .Thr4_User_Data_4v202 ,
	VA = 0x000131000000 ,/* 0x0001313fffc0 */
	RA = 0x0178000000 ,
	PA = 0x0b78000000 ,
	TTE_Context = 0x0d8e ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x10da95 ,
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
	end_label   = Thr4_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v202_data_begin
Thr4_User_Data_4v202_data_begin:
Thr4_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v003 TEXT_VA=0x0001eb2000
attr_text {
	Name = .Thr4_User_Text_4v003 ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x000001eb2000 ,/* 0x000001eb3fc0 */
	RA = 0x000b39c000 ,
	PA = 0x000b39c000 ,
	TTE_Context = 0x072f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x17c495 ,
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
	end_label   = Thr4_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v003_text_begin
Thr4_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v103 DATA_VA=0x0010290000
attr_data {
	Name = .Thr4_User_Data_4v103 ,
	VA = 0x000010290000 ,/* 0x00001029ffc0 */
	RA = 0x0000320000 ,
	PA = 0x000a320000 ,
	TTE_Context = 0x072f ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f2444 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v103_data_begin
Thr4_User_Data_4v103_data_begin:
Thr4_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v004 TEXT_VA=0x0010ea0000
attr_text {
	Name = .Thr4_User_Text_4v004 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x000010ea0000 ,/* 0x000010eaffc0 */
	RA = 0x00004c0000 ,
	PA = 0x000a4c0000 ,
	TTE_Context = 0x072f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x17c495 ,
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
SECTION .Thr4_User_Data_4u100 DATA_VA=0x04b0000000
attr_data {
	Name = .Thr4_User_Data_4u100 ,
	VA = 0x0004b0000000 ,/* 0x0004bfffffc0 */
	RA = 0x5020000000 ,
	PA = 0x5020000000 ,
	TTE_Context = 0x072f ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x04d ,
	TTE_Diag    = 0xa9 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr4_User_Data_4u100_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4u100_data_begin
Thr4_User_Data_4u100_data_begin:
Thr4_User_Data_4u100_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v005 TEXT_VA=0x0001fc0000
attr_text {
	Name = .Thr4_User_Text_4v005 ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x000001fc0000 ,/* 0x000001fc1fc0 */
	RA = 0x000b2c6000 ,
	PA = 0x000b2c6000 ,
	TTE_Context = 0x072f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x17c495 ,
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
	end_label   = Thr4_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v005_text_begin
Thr4_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v104 DATA_VA=0x00103d0000
attr_data {
	Name = .Thr4_User_Data_4v104 ,
	VA = 0x0000103d0000 ,/* 0x0000103dffc0 */
	RA = 0x0000b60000 ,
	PA = 0x000ab60000 ,
	TTE_Context = 0x072f ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f2444 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v104_data_begin
Thr4_User_Data_4v104_data_begin:
Thr4_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v006 TEXT_VA=0x0010640000
attr_text {
	Name = .Thr4_User_Text_4v006 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x000010640000 ,/* 0x00001064ffc0 */
	RA = 0x0000a20000 ,
	PA = 0x000aa20000 ,
	TTE_Context = 0x072f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x17c495 ,
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
SECTION .Thr4_User_Data_4v105 DATA_VA=0x00106b0000
attr_data {
	Name = .Thr4_User_Data_4v105 ,
	VA = 0x0000106b0000 ,/* 0x0000106bffc0 */
	RA = 0x0000900000 ,
	PA = 0x000a900000 ,
	TTE_Context = 0x072f ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f2444 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v105_data_begin
Thr4_User_Data_4v105_data_begin:
Thr4_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v007 TEXT_VA=0x0010560000
attr_text {
	Name = .Thr4_User_Text_4v007 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x000010560000 ,/* 0x00001056ffc0 */
	RA = 0x0000370000 ,
	PA = 0x000a370000 ,
	TTE_Context = 0x072f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x17c495 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v007_text_begin
Thr4_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4u101 DATA_VA=0x0500000000
attr_data {
	Name = .Thr4_User_Data_4u101 ,
	VA = 0x000500000000 ,/* 0x00050fffffc0 */
	RA = 0x5300000000 ,
	PA = 0x5300000000 ,
	TTE_Context = 0x072f ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x04d ,
	TTE_Diag    = 0xa9 ,
	TTE_Soft    = 0x12 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr4_User_Data_4u101_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4u101_data_begin
Thr4_User_Data_4u101_data_begin:
Thr4_User_Data_4u101_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v008 TEXT_VA=0x012f800000
attr_text {
	Name = .Thr4_User_Text_4v008 ,
	thr4_nz_ctx_tsb_3 ,
	VA = 0x00012f800000 ,/* 0x00012fbfffc0 */
	RA = 0x017f000000 ,
	PA = 0x0b7f000000 ,
	TTE_Context = 0x072f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x17c495 ,
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
	end_label   = Thr4_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v008_text_begin
Thr4_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v106 DATA_VA=0x00101f0000
attr_data {
	Name = .Thr4_User_Data_4v106 ,
	VA = 0x0000101f0000 ,/* 0x0000101fffc0 */
	RA = 0x0000fb0000 ,
	PA = 0x000afb0000 ,
	TTE_Context = 0x072f ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f2444 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v106_data_begin
Thr4_User_Data_4v106_data_begin:
Thr4_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v009 TEXT_VA=0x0010ca0000
attr_text {
	Name = .Thr4_User_Text_4v009 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x000010ca0000 ,/* 0x000010caffc0 */
	RA = 0x00004e0000 ,
	PA = 0x000a4e0000 ,
	TTE_Context = 0x072f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x17c495 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v009_text_begin
Thr4_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v107 DATA_VA=0x0113c00000
attr_data {
	Name = .Thr4_User_Data_4v107 ,
	VA = 0x000113c00000 ,/* 0x000113ffffc0 */
	RA = 0x0175400000 ,
	PA = 0x0b75400000 ,
	TTE_Context = 0x072f ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f2444 ,
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
	end_label   = Thr4_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v107_data_begin
Thr4_User_Data_4v107_data_begin:
Thr4_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00a TEXT_VA=0x0001f2e000
attr_text {
	Name = .Thr4_User_Text_4v00a ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x000001f2e000 ,/* 0x000001f2ffc0 */
	RA = 0x000b2cc000 ,
	PA = 0x000b2cc000 ,
	TTE_Context = 0x072f ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x17c495 ,
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
	end_label   = Thr4_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00a_text_begin
Thr4_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v108 DATA_VA=0x0001e5a000
attr_data {
	Name = .Thr4_User_Data_4v108 ,
	VA = 0x000001e5a000 ,/* 0x000001e5bfc0 */
	RA = 0x000b3c8000 ,
	PA = 0x000b3c8000 ,
	TTE_Context = 0x072f ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f2444 ,
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
	end_label   = Thr4_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v108_data_begin
Thr4_User_Data_4v108_data_begin:
Thr4_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x0103000000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x000103000000 ,/* 0x0001033fffc0 */
	RA = 0x0d60c00000 ,
	PA = 0x0d60c00000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x04641f ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr5_User_Data_4u100 DATA_VA=0x0010050000
attr_data {
	Name = .Thr5_User_Data_4u100 ,
	VA = 0x000010050000 ,/* 0x00001005ffc0 */
	RA = 0x0000d30000 ,
	PA = 0x000cd30000 ,
	TTE_Context = 0x02cc ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x36b ,
	TTE_Diag    = 0x7a ,
	TTE_Soft    = 0x1a ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr5_User_Data_4u200 DATA_VA=0x0001f08000
attr_data {
	Name = .Thr5_User_Data_4u200 ,
	VA = 0x000001f08000 ,/* 0x000001f09fc0 */
	RA = 0x000129c000 ,
	PA = 0x000d29c000 ,
	TTE_Context = 0x1234 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x10f ,
	TTE_Diag    = 0xe3 ,
	TTE_Soft    = 0x0b ,
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
SECTION .Thr5_User_Data_4u300 DATA_VA=0x0001ea4000
attr_data {
	Name = .Thr5_User_Data_4u300 ,
	VA = 0x000001ea4000 ,/* 0x000001ea5fc0 */
	RA = 0x00013e2000 ,
	PA = 0x000d3e2000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x210 ,
	TTE_Diag    = 0x24 ,
	TTE_Soft    = 0x1b ,
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
SECTION .Thr5_User_Text_4u000 TEXT_VA=0x0001e42000
attr_text {
	Name = .Thr5_User_Text_4u000 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x000001e42000 ,/* 0x000001e43fc0 */
	RA = 0x000136e000 ,
	PA = 0x000d36e000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x08e ,
	TTE_Diag    = 0x64 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Data_4u101 DATA_VA=0x00108d0000
attr_data {
	Name = .Thr5_User_Data_4u101 ,
	VA = 0x0000108d0000 ,/* 0x0000108dffc0 */
	RA = 0x0000440000 ,
	PA = 0x000c440000 ,
	TTE_Context = 0x02cc ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x36b ,
	TTE_Diag    = 0x7a ,
	TTE_Soft    = 0x1a ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr5_User_Data_4v200 DATA_VA=0x010d800000
attr_data {
	Name = .Thr5_User_Data_4v200 ,
	VA = 0x00010d800000 ,/* 0x00010dbfffc0 */
	RA = 0x0d52c00000 ,
	PA = 0x0d52c00000 ,
	TTE_Context = 0x1234 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x11a9ec ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Data_4u301 DATA_VA=0x0001fde000
attr_data {
	Name = .Thr5_User_Data_4u301 ,
	VA = 0x000001fde000 ,/* 0x000001fdffc0 */
	RA = 0x0001262000 ,
	PA = 0x000d262000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x210 ,
	TTE_Diag    = 0x24 ,
	TTE_Soft    = 0x1b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u301_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u301_data_begin
Thr5_User_Data_4u301_data_begin:
Thr5_User_Data_4u301_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v001 TEXT_VA=0x0101800000
attr_text {
	Name = .Thr5_User_Text_4v001 ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x000101800000 ,/* 0x000101bfffc0 */
	RA = 0x0d4c800000 ,
	PA = 0x0d4c800000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x04641f ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr5_User_Data_4v100 DATA_VA=0x010f800000
attr_data {
	Name = .Thr5_User_Data_4v100 ,
	VA = 0x00010f800000 ,/* 0x00010fbfffc0 */
	RA = 0x0d4f800000 ,
	PA = 0x0d4f800000 ,
	TTE_Context = 0x02cc ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0bd26d ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Data_4u302 DATA_VA=0x00103c0000
attr_data {
	Name = .Thr5_User_Data_4u302 ,
	VA = 0x0000103c0000 ,/* 0x0000103cffc0 */
	RA = 0x0000ed0000 ,
	PA = 0x000ced0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x210 ,
	TTE_Diag    = 0x24 ,
	TTE_Soft    = 0x1b ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Data_4u302_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4u302_data_begin
Thr5_User_Data_4u302_data_begin:
Thr5_User_Data_4u302_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4u001 TEXT_VA=0x0001e38000
attr_text {
	Name = .Thr5_User_Text_4u001 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x000001e38000 ,/* 0x000001e39fc0 */
	RA = 0x00012e6000 ,
	PA = 0x000d2e6000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x08e ,
	TTE_Diag    = 0x64 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Data_4v101 DATA_VA=0x012e400000
attr_data {
	Name = .Thr5_User_Data_4v101 ,
	VA = 0x00012e400000 ,/* 0x00012e7fffc0 */
	RA = 0x0d75800000 ,
	PA = 0x0d75800000 ,
	TTE_Context = 0x02cc ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0bd26d ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Text_4v002 TEXT_VA=0x0129800000
attr_text {
	Name = .Thr5_User_Text_4v002 ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x000129800000 ,/* 0x000129bfffc0 */
	RA = 0x0d4dc00000 ,
	PA = 0x0d4dc00000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x04641f ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v002_text_begin
Thr5_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v102 DATA_VA=0x0138800000
attr_data {
	Name = .Thr5_User_Data_4v102 ,
	VA = 0x000138800000 ,/* 0x000138bfffc0 */
	RA = 0x0d5e800000 ,
	PA = 0x0d5e800000 ,
	TTE_Context = 0x02cc ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0bd26d ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Text_4v003 TEXT_VA=0x0137400000
attr_text {
	Name = .Thr5_User_Text_4v003 ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x000137400000 ,/* 0x0001377fffc0 */
	RA = 0x0d4f400000 ,
	PA = 0x0d4f400000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x04641f ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v003_text_begin
Thr5_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u102 DATA_VA=0x0001f94000
attr_data {
	Name = .Thr5_User_Data_4u102 ,
	VA = 0x000001f94000 ,/* 0x000001f95fc0 */
	RA = 0x00013b8000 ,
	PA = 0x000d3b8000 ,
	TTE_Context = 0x02cc ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x36b ,
	TTE_Diag    = 0x7a ,
	TTE_Soft    = 0x1a ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr5_User_Text_4v004 TEXT_VA=0x013dc00000
attr_text {
	Name = .Thr5_User_Text_4v004 ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x00013dc00000 ,/* 0x00013dffffc0 */
	RA = 0x0d46400000 ,
	PA = 0x0d46400000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x04641f ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v004_text_begin
Thr5_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4u103 DATA_VA=0x00107e0000
attr_data {
	Name = .Thr5_User_Data_4u103 ,
	VA = 0x0000107e0000 ,/* 0x0000107effc0 */
	RA = 0x0000db0000 ,
	PA = 0x000cdb0000 ,
	TTE_Context = 0x02cc ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x36b ,
	TTE_Diag    = 0x7a ,
	TTE_Soft    = 0x1a ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr5_User_Text_4u002 TEXT_VA=0x0001e52000
attr_text {
	Name = .Thr5_User_Text_4u002 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x000001e52000 ,/* 0x000001e53fc0 */
	RA = 0x000135e000 ,
	PA = 0x000d35e000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x08e ,
	TTE_Diag    = 0x64 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Data_4u104 DATA_VA=0x00100e0000
attr_data {
	Name = .Thr5_User_Data_4u104 ,
	VA = 0x0000100e0000 ,/* 0x0000100effc0 */
	RA = 0x0000480000 ,
	PA = 0x000c480000 ,
	TTE_Context = 0x02cc ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x36b ,
	TTE_Diag    = 0x7a ,
	TTE_Soft    = 0x1a ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr5_User_Text_4u003 TEXT_VA=0x0001fea000
attr_text {
	Name = .Thr5_User_Text_4u003 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x000001fea000 ,/* 0x000001febfc0 */
	RA = 0x00013ce000 ,
	PA = 0x000d3ce000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x08e ,
	TTE_Diag    = 0x64 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Data_4u105 DATA_VA=0x0001f48000
attr_data {
	Name = .Thr5_User_Data_4u105 ,
	VA = 0x000001f48000 ,/* 0x000001f49fc0 */
	RA = 0x000124e000 ,
	PA = 0x000d24e000 ,
	TTE_Context = 0x02cc ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x36b ,
	TTE_Diag    = 0x7a ,
	TTE_Soft    = 0x1a ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr5_User_Text_4u004 TEXT_VA=0x0001ec8000
attr_text {
	Name = .Thr5_User_Text_4u004 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x000001ec8000 ,/* 0x000001ec9fc0 */
	RA = 0x0001348000 ,
	PA = 0x000d348000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x08e ,
	TTE_Diag    = 0x64 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Data_4v103 DATA_VA=0x0107000000
attr_data {
	Name = .Thr5_User_Data_4v103 ,
	VA = 0x000107000000 ,/* 0x0001073fffc0 */
	RA = 0x0d73000000 ,
	PA = 0x0d73000000 ,
	TTE_Context = 0x02cc ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0bd26d ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr5_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v103_data_begin
Thr5_User_Data_4v103_data_begin:
Thr5_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4u005 TEXT_VA=0x0001fd6000
attr_text {
	Name = .Thr5_User_Text_4u005 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x000001fd6000 ,/* 0x000001fd7fc0 */
	RA = 0x00012d0000 ,
	PA = 0x000d2d0000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x08e ,
	TTE_Diag    = 0x64 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Text_4u006 TEXT_VA=0x0010c80000
attr_text {
	Name = .Thr5_User_Text_4u006 ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x000010c80000 ,/* 0x000010c8ffc0 */
	RA = 0x0000dd0000 ,
	PA = 0x000cdd0000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x08e ,
	TTE_Diag    = 0x64 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Text_4u007 TEXT_VA=0x00101d0000
attr_text {
	Name = .Thr5_User_Text_4u007 ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x0000101d0000 ,/* 0x0000101dffc0 */
	RA = 0x0000c40000 ,
	PA = 0x000cc40000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x08e ,
	TTE_Diag    = 0x64 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr5_User_Text_4u008 TEXT_VA=0x0010af0000
attr_text {
	Name = .Thr5_User_Text_4u008 ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x000010af0000 ,/* 0x000010afffc0 */
	RA = 0x0000fe0000 ,
	PA = 0x000cfe0000 ,
	TTE_Context = 0x02cc ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x08e ,
	TTE_Diag    = 0x64 ,
	TTE_Soft    = 0x00 ,
	TTE_EP      = 1 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr5_User_Text_4u008_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4u008_text_begin
Thr5_User_Text_4u008_text_begin:
	EXIT_GOOD
Thr5_User_Text_4u008_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u000 TEXT_VA=0x0001fe6000
attr_text {
	Name = .Thr6_User_Text_4u000 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x000001fe6000 ,/* 0x000001fe7fc0 */
	RA = 0x000f3e8000 ,
	PA = 0x000f3e8000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2e5 ,
	TTE_Diag    = 0x85 ,
	TTE_Soft    = 0x18 ,
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
SECTION .Thr6_User_Data_4u100 DATA_VA=0x0010440000
attr_data {
	Name = .Thr6_User_Data_4u100 ,
	VA = 0x000010440000 ,/* 0x00001044ffc0 */
	RA = 0x000e390000 ,
	PA = 0x000e390000 ,
	TTE_Context = 0x1d97 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3af ,
	TTE_Diag    = 0x9c ,
	TTE_Soft    = 0x15 ,
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
SECTION .Thr6_User_Data_4u200 DATA_VA=0x0001f88000
attr_data {
	Name = .Thr6_User_Data_4u200 ,
	VA = 0x000001f88000 ,/* 0x000001f89fc0 */
	RA = 0x000f278000 ,
	PA = 0x000f278000 ,
	TTE_Context = 0x0d1b ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2c3 ,
	TTE_Diag    = 0xf9 ,
	TTE_Soft    = 0x18 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr6_User_Data_4u300 DATA_VA=0x0001f4a000
attr_data {
	Name = .Thr6_User_Data_4u300 ,
	VA = 0x000001f4a000 ,/* 0x000001f4bfc0 */
	RA = 0x000f2f2000 ,
	PA = 0x000f2f2000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x064 ,
	TTE_Diag    = 0xc0 ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr6_User_Text_4u001 TEXT_VA=0x0001eec000
attr_text {
	Name = .Thr6_User_Text_4u001 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x000001eec000 ,/* 0x000001eedfc0 */
	RA = 0x000f2fc000 ,
	PA = 0x000f2fc000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2e5 ,
	TTE_Diag    = 0x85 ,
	TTE_Soft    = 0x18 ,
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
SECTION .Thr6_User_Data_4u101 DATA_VA=0x0001f36000
attr_data {
	Name = .Thr6_User_Data_4u101 ,
	VA = 0x000001f36000 ,/* 0x000001f37fc0 */
	RA = 0x000f3ae000 ,
	PA = 0x000f3ae000 ,
	TTE_Context = 0x1d97 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3af ,
	TTE_Diag    = 0x9c ,
	TTE_Soft    = 0x15 ,
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
SECTION .Thr6_User_Data_4u201 DATA_VA=0x0001ec0000
attr_data {
	Name = .Thr6_User_Data_4u201 ,
	VA = 0x000001ec0000 ,/* 0x000001ec1fc0 */
	RA = 0x000f344000 ,
	PA = 0x000f344000 ,
	TTE_Context = 0x0d1b ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2c3 ,
	TTE_Diag    = 0xf9 ,
	TTE_Soft    = 0x18 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u201_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u201_data_begin
Thr6_User_Data_4u201_data_begin:
Thr6_User_Data_4u201_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u301 DATA_VA=0x0010450000
attr_data {
	Name = .Thr6_User_Data_4u301 ,
	VA = 0x000010450000 ,/* 0x00001045ffc0 */
	RA = 0x000ee10000 ,
	PA = 0x000ee10000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x064 ,
	TTE_Diag    = 0xc0 ,
	TTE_Soft    = 0x0c ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr6_User_Text_4u002 TEXT_VA=0x0010fa0000
attr_text {
	Name = .Thr6_User_Text_4u002 ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x000010fa0000 ,/* 0x000010faffc0 */
	RA = 0x000e140000 ,
	PA = 0x000e140000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2e5 ,
	TTE_Diag    = 0x85 ,
	TTE_Soft    = 0x18 ,
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
SECTION .Thr6_User_Data_4v100 DATA_VA=0x011f800000
attr_data {
	Name = .Thr6_User_Data_4v100 ,
	VA = 0x00011f800000 ,/* 0x00011fbfffc0 */
	RA = 0x0161800000 ,
	PA = 0x0f61800000 ,
	TTE_Context = 0x1d97 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a9441 ,
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
	end_label   = Thr6_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v100_data_begin
Thr6_User_Data_4v100_data_begin:
Thr6_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u202 DATA_VA=0x0001ede000
attr_data {
	Name = .Thr6_User_Data_4u202 ,
	VA = 0x000001ede000 ,/* 0x000001edffc0 */
	RA = 0x000f3e0000 ,
	PA = 0x000f3e0000 ,
	TTE_Context = 0x0d1b ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2c3 ,
	TTE_Diag    = 0xf9 ,
	TTE_Soft    = 0x18 ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr6_User_Data_4u202_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4u202_data_begin
Thr6_User_Data_4u202_data_begin:
Thr6_User_Data_4u202_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u003 TEXT_VA=0x0010160000
attr_text {
	Name = .Thr6_User_Text_4u003 ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x000010160000 ,/* 0x00001016ffc0 */
	RA = 0x000eb30000 ,
	PA = 0x000eb30000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2e5 ,
	TTE_Diag    = 0x85 ,
	TTE_Soft    = 0x18 ,
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
SECTION .Thr6_User_Data_4u102 DATA_VA=0x0001f62000
attr_data {
	Name = .Thr6_User_Data_4u102 ,
	VA = 0x000001f62000 ,/* 0x000001f63fc0 */
	RA = 0x000f2c4000 ,
	PA = 0x000f2c4000 ,
	TTE_Context = 0x1d97 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3af ,
	TTE_Diag    = 0x9c ,
	TTE_Soft    = 0x15 ,
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
SECTION .Thr6_User_Text_4v000 TEXT_VA=0x0105400000
attr_text {
	Name = .Thr6_User_Text_4v000 ,
	thr6_nz_ctx_tsb_0 ,
	VA = 0x000105400000 ,/* 0x0001057fffc0 */
	RA = 0x017ec00000 ,
	PA = 0x0f7ec00000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x19057b ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v000_text_begin
Thr6_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v101 DATA_VA=0x0102800000
attr_data {
	Name = .Thr6_User_Data_4v101 ,
	VA = 0x000102800000 ,/* 0x000102bfffc0 */
	RA = 0x0170800000 ,
	PA = 0x0f70800000 ,
	TTE_Context = 0x1d97 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a9441 ,
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
	end_label   = Thr6_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v101_data_begin
Thr6_User_Data_4v101_data_begin:
Thr6_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u004 TEXT_VA=0x07a0000000
attr_text {
	Name = .Thr6_User_Text_4u004 ,
	thr6_nz_ctx_tsb_1 ,
	VA = 0x0007a0000000 ,/* 0x0007afffffc0 */
	RA = 0x33d0000000 ,
	PA = 0x33d0000000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 5 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2e5 ,
	TTE_Diag    = 0x85 ,
	TTE_Soft    = 0x18 ,
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
SECTION .Thr6_User_Data_4u103 DATA_VA=0x0001f68000
attr_data {
	Name = .Thr6_User_Data_4u103 ,
	VA = 0x000001f68000 ,/* 0x000001f69fc0 */
	RA = 0x000f2fa000 ,
	PA = 0x000f2fa000 ,
	TTE_Context = 0x1d97 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3af ,
	TTE_Diag    = 0x9c ,
	TTE_Soft    = 0x15 ,
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
SECTION .Thr6_User_Text_4v001 TEXT_VA=0x0123400000
attr_text {
	Name = .Thr6_User_Text_4v001 ,
	thr6_nz_ctx_tsb_0 ,
	VA = 0x000123400000 ,/* 0x0001237fffc0 */
	RA = 0x0150400000 ,
	PA = 0x0f50400000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x19057b ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v001_text_begin
Thr6_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4u104 DATA_VA=0x0010ff0000
attr_data {
	Name = .Thr6_User_Data_4u104 ,
	VA = 0x000010ff0000 ,/* 0x000010ffffc0 */
	RA = 0x000e920000 ,
	PA = 0x000e920000 ,
	TTE_Context = 0x1d97 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3af ,
	TTE_Diag    = 0x9c ,
	TTE_Soft    = 0x15 ,
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
SECTION .Thr6_User_Text_4u005 TEXT_VA=0x0010b10000
attr_text {
	Name = .Thr6_User_Text_4u005 ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x000010b10000 ,/* 0x000010b1ffc0 */
	RA = 0x000e7d0000 ,
	PA = 0x000e7d0000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2e5 ,
	TTE_Diag    = 0x85 ,
	TTE_Soft    = 0x18 ,
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
SECTION .Thr6_User_Data_4u105 DATA_VA=0x0001f1a000
attr_data {
	Name = .Thr6_User_Data_4u105 ,
	VA = 0x000001f1a000 ,/* 0x000001f1bfc0 */
	RA = 0x000f3a6000 ,
	PA = 0x000f3a6000 ,
	TTE_Context = 0x1d97 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x3af ,
	TTE_Diag    = 0x9c ,
	TTE_Soft    = 0x15 ,
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
SECTION .Thr6_User_Text_4u006 TEXT_VA=0x0001f54000
attr_text {
	Name = .Thr6_User_Text_4u006 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x000001f54000 ,/* 0x000001f55fc0 */
	RA = 0x000f340000 ,
	PA = 0x000f340000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2e5 ,
	TTE_Diag    = 0x85 ,
	TTE_Soft    = 0x18 ,
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
SECTION .Thr6_User_Data_4v102 DATA_VA=0x0124800000
attr_data {
	Name = .Thr6_User_Data_4v102 ,
	VA = 0x000124800000 ,/* 0x000124bfffc0 */
	RA = 0x0141800000 ,
	PA = 0x0f41800000 ,
	TTE_Context = 0x1d97 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a9441 ,
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
	end_label   = Thr6_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v102_data_begin
Thr6_User_Data_4v102_data_begin:
Thr6_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u007 TEXT_VA=0x0001f9c000
attr_text {
	Name = .Thr6_User_Text_4u007 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x000001f9c000 ,/* 0x000001f9dfc0 */
	RA = 0x000f322000 ,
	PA = 0x000f322000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2e5 ,
	TTE_Diag    = 0x85 ,
	TTE_Soft    = 0x18 ,
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
SECTION .Thr6_User_Data_4v103 DATA_VA=0x0118c00000
attr_data {
	Name = .Thr6_User_Data_4v103 ,
	VA = 0x000118c00000 ,/* 0x000118ffffc0 */
	RA = 0x0168c00000 ,
	PA = 0x0f68c00000 ,
	TTE_Context = 0x1d97 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a9441 ,
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
	end_label   = Thr6_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v103_data_begin
Thr6_User_Data_4v103_data_begin:
Thr6_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v002 TEXT_VA=0x013e000000
attr_text {
	Name = .Thr6_User_Text_4v002 ,
	thr6_nz_ctx_tsb_0 ,
	VA = 0x00013e000000 ,/* 0x00013e3fffc0 */
	RA = 0x0173400000 ,
	PA = 0x0f73400000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x19057b ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v002_text_begin
Thr6_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v003 TEXT_VA=0x0139800000
attr_text {
	Name = .Thr6_User_Text_4v003 ,
	thr6_nz_ctx_tsb_0 ,
	VA = 0x000139800000 ,/* 0x000139bfffc0 */
	RA = 0x0176c00000 ,
	PA = 0x0f76c00000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x19057b ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v003_text_begin
Thr6_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4u008 TEXT_VA=0x0001f82000
attr_text {
	Name = .Thr6_User_Text_4u008 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x000001f82000 ,/* 0x000001f83fc0 */
	RA = 0x000f36a000 ,
	PA = 0x000f36a000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 0 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2e5 ,
	TTE_Diag    = 0x85 ,
	TTE_Soft    = 0x18 ,
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
SECTION .Thr6_User_Text_4u009 TEXT_VA=0x0010680000
attr_text {
	Name = .Thr6_User_Text_4u009 ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x000010680000 ,/* 0x00001068ffc0 */
	RA = 0x000ee40000 ,
	PA = 0x000ee40000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x2e5 ,
	TTE_Diag    = 0x85 ,
	TTE_Soft    = 0x18 ,
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
SECTION .Thr6_User_Text_4v004 TEXT_VA=0x0104400000
attr_text {
	Name = .Thr6_User_Text_4v004 ,
	thr6_nz_ctx_tsb_0 ,
	VA = 0x000104400000 ,/* 0x0001047fffc0 */
	RA = 0x014d400000 ,
	PA = 0x0f4d400000 ,
	TTE_Context = 0x1d97 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x19057b ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr6_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v004_text_begin
Thr6_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x0001e82000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x000001e82000 ,/* 0x000001e83fc0 */
	RA = 0x0011372000 ,
	PA = 0x0011372000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x10b85e ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
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
	EXIT_GOOD
Thr7_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v100 DATA_VA=0x0001ffc000
attr_data {
	Name = .Thr7_User_Data_4v100 ,
	VA = 0x000001ffc000 ,/* 0x000001ffdfc0 */
	RA = 0x00112f0000 ,
	PA = 0x00112f0000 ,
	TTE_Context = 0x1595 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x11ad39 ,
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
	end_label   = Thr7_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v100_data_begin
Thr7_User_Data_4v100_data_begin:
Thr7_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v200 DATA_VA=0x0125000000
attr_data {
	Name = .Thr7_User_Data_4v200 ,
	VA = 0x000125000000 ,/* 0x0001253fffc0 */
	RA = 0x0142c00000 ,
	PA = 0x1142c00000 ,
	TTE_Context = 0x043c ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x06fc46 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v200_data_begin
Thr7_User_Data_4v200_data_begin:
Thr7_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v300 DATA_VA=0x0001eee000
attr_data {
	Name = .Thr7_User_Data_4v300 ,
	VA = 0x000001eee000 ,/* 0x000001eeffc0 */
	RA = 0x0011368000 ,
	PA = 0x0011368000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x04bbe3 ,
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
	end_label   = Thr7_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v300_data_begin
Thr7_User_Data_4v300_data_begin:
Thr7_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v001 TEXT_VA=0x0106c00000
attr_text {
	Name = .Thr7_User_Text_4v001 ,
	thr7_nz_ctx_tsb_0 ,
	VA = 0x000106c00000 ,/* 0x000106ffffc0 */
	RA = 0x0159400000 ,
	PA = 0x1159400000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x10b85e ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v001_text_begin
Thr7_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u100 DATA_VA=0x0010430000
attr_data {
	Name = .Thr7_User_Data_4u100 ,
	VA = 0x000010430000 ,/* 0x00001043ffc0 */
	RA = 0x0010ce0000 ,
	PA = 0x0010ce0000 ,
	TTE_Context = 0x1595 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1cf ,
	TTE_Diag    = 0x84 ,
	TTE_Soft    = 0x0a ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr7_User_Data_4v201 DATA_VA=0x0001f20000
attr_data {
	Name = .Thr7_User_Data_4v201 ,
	VA = 0x000001f20000 ,/* 0x000001f21fc0 */
	RA = 0x0011330000 ,
	PA = 0x0011330000 ,
	TTE_Context = 0x043c ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x06fc46 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
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
SECTION .Thr7_User_Data_4v301 DATA_VA=0x0001f56000
attr_data {
	Name = .Thr7_User_Data_4v301 ,
	VA = 0x000001f56000 ,/* 0x000001f57fc0 */
	RA = 0x0011232000 ,
	PA = 0x0011232000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x04bbe3 ,
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
SECTION .Thr7_User_Text_4u000 TEXT_VA=0x0010060000
attr_text {
	Name = .Thr7_User_Text_4u000 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x000010060000 ,/* 0x00001006ffc0 */
	RA = 0x0010020000 ,
	PA = 0x0010020000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1c7 ,
	TTE_Diag    = 0x84 ,
	TTE_Soft    = 0x19 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 0 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Text_4u000_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4u000_text_begin
Thr7_User_Text_4u000_text_begin:
	EXIT_GOOD
Thr7_User_Text_4u000_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v101 DATA_VA=0x0001f12000
attr_data {
	Name = .Thr7_User_Data_4v101 ,
	VA = 0x000001f12000 ,/* 0x000001f13fc0 */
	RA = 0x001128c000 ,
	PA = 0x001128c000 ,
	TTE_Context = 0x1595 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x11ad39 ,
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
	end_label   = Thr7_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v101_data_begin
Thr7_User_Data_4v101_data_begin:
Thr7_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u200 DATA_VA=0x00108f0000
attr_data {
	Name = .Thr7_User_Data_4u200 ,
	VA = 0x0000108f0000 ,/* 0x0000108fffc0 */
	RA = 0x0010d20000 ,
	PA = 0x0010d20000 ,
	TTE_Context = 0x043c ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x02c ,
	TTE_Diag    = 0x8f ,
	TTE_Soft    = 0x16 ,
	TTE_EP      = 0 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_E       = 0 ,
	TTE_P       = 0 ,
	TTE_W       = 1 ,
	TTE_RSVD1   = 0 ,
	end_label   = Thr7_User_Data_4u200_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4u200_data_begin
Thr7_User_Data_4u200_data_begin:
Thr7_User_Data_4u200_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v002 TEXT_VA=0x0001e12000
attr_text {
	Name = .Thr7_User_Text_4v002 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x000001e12000 ,/* 0x000001e13fc0 */
	RA = 0x001137c000 ,
	PA = 0x001137c000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x10b85e ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr7_User_Data_4v102 DATA_VA=0x0001e30000
attr_data {
	Name = .Thr7_User_Data_4v102 ,
	VA = 0x000001e30000 ,/* 0x000001e31fc0 */
	RA = 0x00112bc000 ,
	PA = 0x00112bc000 ,
	TTE_Context = 0x1595 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x11ad39 ,
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
	end_label   = Thr7_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v102_data_begin
Thr7_User_Data_4v102_data_begin:
Thr7_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v202 DATA_VA=0x0001f44000
attr_data {
	Name = .Thr7_User_Data_4v202 ,
	VA = 0x000001f44000 ,/* 0x000001f45fc0 */
	RA = 0x00112e8000 ,
	PA = 0x00112e8000 ,
	TTE_Context = 0x043c ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x06fc46 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v202_data_begin
Thr7_User_Data_4v202_data_begin:
Thr7_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v003 TEXT_VA=0x0001fb0000
attr_text {
	Name = .Thr7_User_Text_4v003 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x000001fb0000 ,/* 0x000001fb1fc0 */
	RA = 0x00113a8000 ,
	PA = 0x00113a8000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x10b85e ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v003_text_begin
Thr7_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v103 DATA_VA=0x0110400000
attr_data {
	Name = .Thr7_User_Data_4v103 ,
	VA = 0x000110400000 ,/* 0x0001107fffc0 */
	RA = 0x017e000000 ,
	PA = 0x117e000000 ,
	TTE_Context = 0x1595 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x11ad39 ,
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
	end_label   = Thr7_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v103_data_begin
Thr7_User_Data_4v103_data_begin:
Thr7_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v203 DATA_VA=0x0001e4c000
attr_data {
	Name = .Thr7_User_Data_4v203 ,
	VA = 0x000001e4c000 ,/* 0x000001e4dfc0 */
	RA = 0x00112a0000 ,
	PA = 0x00112a0000 ,
	TTE_Context = 0x043c ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x06fc46 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v203_data_begin
Thr7_User_Data_4v203_data_begin:
Thr7_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v004 TEXT_VA=0x0001e74000
attr_text {
	Name = .Thr7_User_Text_4v004 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x000001e74000 ,/* 0x000001e75fc0 */
	RA = 0x00113fe000 ,
	PA = 0x00113fe000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x10b85e ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr7_User_Data_4v104 DATA_VA=0x0001ee4000
attr_data {
	Name = .Thr7_User_Data_4v104 ,
	VA = 0x000001ee4000 ,/* 0x000001ee5fc0 */
	RA = 0x0011238000 ,
	PA = 0x0011238000 ,
	TTE_Context = 0x1595 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x11ad39 ,
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
	end_label   = Thr7_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v104_data_begin
Thr7_User_Data_4v104_data_begin:
Thr7_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v005 TEXT_VA=0x0001ee2000
attr_text {
	Name = .Thr7_User_Text_4v005 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x000001ee2000 ,/* 0x000001ee3fc0 */
	RA = 0x0011320000 ,
	PA = 0x0011320000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x10b85e ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr7_User_Data_4v105 DATA_VA=0x0001e3e000
attr_data {
	Name = .Thr7_User_Data_4v105 ,
	VA = 0x000001e3e000 ,/* 0x000001e3ffc0 */
	RA = 0x0011246000 ,
	PA = 0x0011246000 ,
	TTE_Context = 0x1595 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x11ad39 ,
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
	end_label   = Thr7_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v105_data_begin
Thr7_User_Data_4v105_data_begin:
Thr7_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v006 TEXT_VA=0x0001eb4000
attr_text {
	Name = .Thr7_User_Text_4v006 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x000001eb4000 ,/* 0x000001eb5fc0 */
	RA = 0x00112f8000 ,
	PA = 0x00112f8000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x10b85e ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr7_User_Data_4u101 DATA_VA=0x00107d0000
attr_data {
	Name = .Thr7_User_Data_4u101 ,
	VA = 0x0000107d0000 ,/* 0x0000107dffc0 */
	RA = 0x00101e0000 ,
	PA = 0x00101e0000 ,
	TTE_Context = 0x1595 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1cf ,
	TTE_Diag    = 0x84 ,
	TTE_Soft    = 0x0a ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr7_User_Text_4v007 TEXT_VA=0x0001e0c000
attr_text {
	Name = .Thr7_User_Text_4v007 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x000001e0c000 ,/* 0x000001e0dfc0 */
	RA = 0x0011234000 ,
	PA = 0x0011234000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x10b85e ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v007_text_begin
Thr7_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4u102 DATA_VA=0x0010a50000
attr_data {
	Name = .Thr7_User_Data_4u102 ,
	VA = 0x000010a50000 ,/* 0x000010a5ffc0 */
	RA = 0x00103b0000 ,
	PA = 0x00103b0000 ,
	TTE_Context = 0x1595 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1cf ,
	TTE_Diag    = 0x84 ,
	TTE_Soft    = 0x0a ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr7_User_Text_4u001 TEXT_VA=0x0010ad0000
attr_text {
	Name = .Thr7_User_Text_4u001 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x000010ad0000 ,/* 0x000010adffc0 */
	RA = 0x0010590000 ,
	PA = 0x0010590000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1c7 ,
	TTE_Diag    = 0x84 ,
	TTE_Soft    = 0x19 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr7_User_Data_4v106 DATA_VA=0x0480000000
attr_data {
	Name = .Thr7_User_Data_4v106 ,
	VA = 0x000480000000 ,/* 0x00048fffffc0 */
	RA = 0x1070000000 ,
	PA = 0x5070000000 ,
	TTE_Context = 0x1595 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x11ad39 ,
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
	TTE_Size    = 5 ,
	end_label   = Thr7_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v106_data_begin
Thr7_User_Data_4v106_data_begin:
Thr7_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4u002 TEXT_VA=0x0010d60000
attr_text {
	Name = .Thr7_User_Text_4u002 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x000010d60000 ,/* 0x000010d6ffc0 */
	RA = 0x00104f0000 ,
	PA = 0x00104f0000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1c7 ,
	TTE_Diag    = 0x84 ,
	TTE_Soft    = 0x19 ,
	TTE_EP      = 1 ,
	TTE_L       = 0 ,
	TTE_CP      = 0 ,
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
SECTION .Thr7_User_Data_4u103 DATA_VA=0x00107a0000
attr_data {
	Name = .Thr7_User_Data_4u103 ,
	VA = 0x0000107a0000 ,/* 0x0000107affc0 */
	RA = 0x0010a00000 ,
	PA = 0x0010a00000 ,
	TTE_Context = 0x1595 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_Size    = 1 ,
	TTE_NFO     = 0 ,
	TTE_IE      = 0 ,
	TTE_Soft2   = 0x1cf ,
	TTE_Diag    = 0x84 ,
	TTE_Soft    = 0x0a ,
	TTE_EP      = 0 ,
	TTE_L       = 1 ,
	TTE_CP      = 0 ,
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
SECTION .Thr7_User_Text_4v008 TEXT_VA=0x0136800000
attr_text {
	Name = .Thr7_User_Text_4v008 ,
	thr7_nz_ctx_tsb_0 ,
	VA = 0x000136800000 ,/* 0x000136bfffc0 */
	RA = 0x015a800000 ,
	PA = 0x115a800000 ,
	TTE_Context = 0x1595 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x10b85e ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v008_text_begin
Thr7_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v008_text_end:
