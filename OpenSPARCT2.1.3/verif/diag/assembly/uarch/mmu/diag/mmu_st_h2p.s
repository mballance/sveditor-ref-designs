/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_st_h2p.s
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
#define THR0_Z_CTX_TSB_CONFIG_1  0x8000000001010030
#define THR0_Z_CTX_TSB_CONFIG_2  0x8000000001020150
#define THR0_Z_CTX_TSB_CONFIG_3  0xc000000001030100
#define THR0_NZ_CTX_TSB_CONFIG_0 0x8000000001200030
#define THR0_NZ_CTX_TSB_CONFIG_1 0x8000000001210150
#define THR0_NZ_CTX_TSB_CONFIG_2 0x8000000001220100
#define THR0_NZ_CTX_TSB_CONFIG_3 0x8000000001230010
#define THR1_Z_CTX_TSB_CONFIG_0  0xa000000001040110
#define THR1_Z_CTX_TSB_CONFIG_1  0x8000000001050130
#define THR1_Z_CTX_TSB_CONFIG_2  0xc000000001060150
#define THR1_Z_CTX_TSB_CONFIG_3  0x8000000001070000
#define THR1_NZ_CTX_TSB_CONFIG_0 0xa000000001240000
#define THR1_NZ_CTX_TSB_CONFIG_1 0x8000000001250110
#define THR1_NZ_CTX_TSB_CONFIG_2 0x8000000001260030
#define THR1_NZ_CTX_TSB_CONFIG_3 0xc000000001270150
#define THR2_Z_CTX_TSB_CONFIG_0  0x8000000001080030
#define THR2_Z_CTX_TSB_CONFIG_1  0xc000000001090150
#define THR2_Z_CTX_TSB_CONFIG_2  0xa0000000010a0100
#define THR2_Z_CTX_TSB_CONFIG_3  0x80000000010b0010
#define THR2_NZ_CTX_TSB_CONFIG_0 0xa000000001280150
#define THR2_NZ_CTX_TSB_CONFIG_1 0x8000000001290000
#define THR2_NZ_CTX_TSB_CONFIG_2 0x80000000012a0010
#define THR2_NZ_CTX_TSB_CONFIG_3 0xc0000000012b0030
#define THR3_Z_CTX_TSB_CONFIG_0  0xc0000000010c0130
#define THR3_Z_CTX_TSB_CONFIG_1  0xc0000000010d0150
#define THR3_Z_CTX_TSB_CONFIG_2  0xc0000000010e0000
#define THR3_Z_CTX_TSB_CONFIG_3  0x80000000010f0010
#define THR3_NZ_CTX_TSB_CONFIG_0 0xc0000000012c0150
#define THR3_NZ_CTX_TSB_CONFIG_1 0xa0000000012d0000
#define THR3_NZ_CTX_TSB_CONFIG_2 0x80000000012e0110
#define THR3_NZ_CTX_TSB_CONFIG_3 0x80000000012f0030
#define THR4_Z_CTX_TSB_CONFIG_0  0xc000000001100150
#define THR4_Z_CTX_TSB_CONFIG_1  0xc000000001110000
#define THR4_Z_CTX_TSB_CONFIG_2  0x8000000001120010
#define THR4_Z_CTX_TSB_CONFIG_3  0x8000000001130130
#define THR4_NZ_CTX_TSB_CONFIG_0 0xc000000001300150
#define THR4_NZ_CTX_TSB_CONFIG_1 0xa000000001310000
#define THR4_NZ_CTX_TSB_CONFIG_2 0xc000000001320010
#define THR4_NZ_CTX_TSB_CONFIG_3 0xc000000001330130
#define THR5_Z_CTX_TSB_CONFIG_0  0xc000000001140150
#define THR5_Z_CTX_TSB_CONFIG_1  0xa000000001150000
#define THR5_Z_CTX_TSB_CONFIG_2  0xc000000001160110
#define THR5_Z_CTX_TSB_CONFIG_3  0xa000000001170130
#define THR5_NZ_CTX_TSB_CONFIG_0 0x8000000001340100
#define THR5_NZ_CTX_TSB_CONFIG_1 0x8000000001350010
#define THR5_NZ_CTX_TSB_CONFIG_2 0xc000000001360130
#define THR5_NZ_CTX_TSB_CONFIG_3 0x8000000001370050
#define THR6_Z_CTX_TSB_CONFIG_0  0xc000000001180050
#define THR6_Z_CTX_TSB_CONFIG_1  0xc000000001190000
#define THR6_Z_CTX_TSB_CONFIG_2  0xc0000000011a0010
#define THR6_Z_CTX_TSB_CONFIG_3  0x80000000011b0130
#define THR6_NZ_CTX_TSB_CONFIG_0 0xa000000001380130
#define THR6_NZ_CTX_TSB_CONFIG_1 0xa000000001390050
#define THR6_NZ_CTX_TSB_CONFIG_2 0xc0000000013a0000
#define THR6_NZ_CTX_TSB_CONFIG_3 0x80000000013b0110
#define THR7_Z_CTX_TSB_CONFIG_0  0xa0000000011c0110
#define THR7_Z_CTX_TSB_CONFIG_1  0x80000000011d0130
#define THR7_Z_CTX_TSB_CONFIG_2  0xc0000000011e0050
#define THR7_Z_CTX_TSB_CONFIG_3  0x80000000011f0000
#define THR7_NZ_CTX_TSB_CONFIG_0 0x80000000013c0130
#define THR7_NZ_CTX_TSB_CONFIG_1 0xc0000000013d0150
#define THR7_NZ_CTX_TSB_CONFIG_2 0x80000000013e0000
#define THR7_NZ_CTX_TSB_CONFIG_3 0xa0000000013f0110
#else
#define THR0_Z_CTX_TSB_CONFIG_0  0x4000000001000010
#define THR0_Z_CTX_TSB_CONFIG_1  0x0000000001010030
#define THR0_Z_CTX_TSB_CONFIG_2  0x0000000001020150
#define THR0_Z_CTX_TSB_CONFIG_3  0x4000000001030100
#define THR0_NZ_CTX_TSB_CONFIG_0 0x0000000001200030
#define THR0_NZ_CTX_TSB_CONFIG_1 0x0000000001210150
#define THR0_NZ_CTX_TSB_CONFIG_2 0x0000000001220100
#define THR0_NZ_CTX_TSB_CONFIG_3 0x0000000001230010
#define THR1_Z_CTX_TSB_CONFIG_0  0x2000000001040110
#define THR1_Z_CTX_TSB_CONFIG_1  0x0000000001050130
#define THR1_Z_CTX_TSB_CONFIG_2  0x4000000001060150
#define THR1_Z_CTX_TSB_CONFIG_3  0x0000000001070000
#define THR1_NZ_CTX_TSB_CONFIG_0 0x2000000001240000
#define THR1_NZ_CTX_TSB_CONFIG_1 0x0000000001250110
#define THR1_NZ_CTX_TSB_CONFIG_2 0x0000000001260030
#define THR1_NZ_CTX_TSB_CONFIG_3 0x4000000001270150
#define THR2_Z_CTX_TSB_CONFIG_0  0x0000000001080030
#define THR2_Z_CTX_TSB_CONFIG_1  0x4000000001090150
#define THR2_Z_CTX_TSB_CONFIG_2  0x20000000010a0100
#define THR2_Z_CTX_TSB_CONFIG_3  0x00000000010b0010
#define THR2_NZ_CTX_TSB_CONFIG_0 0x2000000001280150
#define THR2_NZ_CTX_TSB_CONFIG_1 0x0000000001290000
#define THR2_NZ_CTX_TSB_CONFIG_2 0x00000000012a0010
#define THR2_NZ_CTX_TSB_CONFIG_3 0x40000000012b0030
#define THR3_Z_CTX_TSB_CONFIG_0  0x40000000010c0130
#define THR3_Z_CTX_TSB_CONFIG_1  0x40000000010d0150
#define THR3_Z_CTX_TSB_CONFIG_2  0x40000000010e0000
#define THR3_Z_CTX_TSB_CONFIG_3  0x00000000010f0010
#define THR3_NZ_CTX_TSB_CONFIG_0 0x40000000012c0150
#define THR3_NZ_CTX_TSB_CONFIG_1 0x20000000012d0000
#define THR3_NZ_CTX_TSB_CONFIG_2 0x00000000012e0110
#define THR3_NZ_CTX_TSB_CONFIG_3 0x00000000012f0030
#define THR4_Z_CTX_TSB_CONFIG_0  0x4000000001100150
#define THR4_Z_CTX_TSB_CONFIG_1  0x4000000001110000
#define THR4_Z_CTX_TSB_CONFIG_2  0x0000000001120010
#define THR4_Z_CTX_TSB_CONFIG_3  0x0000000001130130
#define THR4_NZ_CTX_TSB_CONFIG_0 0x4000000001300150
#define THR4_NZ_CTX_TSB_CONFIG_1 0x2000000001310000
#define THR4_NZ_CTX_TSB_CONFIG_2 0x4000000001320010
#define THR4_NZ_CTX_TSB_CONFIG_3 0x4000000001330130
#define THR5_Z_CTX_TSB_CONFIG_0  0x4000000001140150
#define THR5_Z_CTX_TSB_CONFIG_1  0x2000000001150000
#define THR5_Z_CTX_TSB_CONFIG_2  0x4000000001160110
#define THR5_Z_CTX_TSB_CONFIG_3  0x2000000001170130
#define THR5_NZ_CTX_TSB_CONFIG_0 0x0000000001340100
#define THR5_NZ_CTX_TSB_CONFIG_1 0x0000000001350010
#define THR5_NZ_CTX_TSB_CONFIG_2 0x4000000001360130
#define THR5_NZ_CTX_TSB_CONFIG_3 0x0000000001370050
#define THR6_Z_CTX_TSB_CONFIG_0  0x4000000001180050
#define THR6_Z_CTX_TSB_CONFIG_1  0x4000000001190000
#define THR6_Z_CTX_TSB_CONFIG_2  0x40000000011a0010
#define THR6_Z_CTX_TSB_CONFIG_3  0x00000000011b0130
#define THR6_NZ_CTX_TSB_CONFIG_0 0x2000000001380130
#define THR6_NZ_CTX_TSB_CONFIG_1 0x2000000001390050
#define THR6_NZ_CTX_TSB_CONFIG_2 0x40000000013a0000
#define THR6_NZ_CTX_TSB_CONFIG_3 0x00000000013b0110
#define THR7_Z_CTX_TSB_CONFIG_0  0x20000000011c0110
#define THR7_Z_CTX_TSB_CONFIG_1  0x00000000011d0130
#define THR7_Z_CTX_TSB_CONFIG_2  0x40000000011e0050
#define THR7_Z_CTX_TSB_CONFIG_3  0x00000000011f0000
#define THR7_NZ_CTX_TSB_CONFIG_0 0x00000000013c0130
#define THR7_NZ_CTX_TSB_CONFIG_1 0x40000000013d0150
#define THR7_NZ_CTX_TSB_CONFIG_2 0x00000000013e0000
#define THR7_NZ_CTX_TSB_CONFIG_3 0x20000000013f0110
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
#define THR0_PHY_OFF_0 0x0000001000000000
#define THR0_PHY_OFF_1 0x0000001010000000
#define THR0_PHY_OFF_2 0x0000001020000000
#define THR0_PHY_OFF_3 0x0000001030000000
#define THR1_PHY_OFF_0 0x0000000100000000
#define THR1_PHY_OFF_1 0x0000000110000000
#define THR1_PHY_OFF_2 0x0000000120000000
#define THR1_PHY_OFF_3 0x0000000130000000
#define THR2_PHY_OFF_0 0x0000000200000000
#define THR2_PHY_OFF_1 0x0000000210000000
#define THR2_PHY_OFF_2 0x0000000220000000
#define THR2_PHY_OFF_3 0x0000000230000000
#define THR3_PHY_OFF_0 0x0000000300000000
#define THR3_PHY_OFF_1 0x0000000310000000
#define THR3_PHY_OFF_2 0x0000000320000000
#define THR3_PHY_OFF_3 0x0000000330000000
#define THR4_PHY_OFF_0 0x0000000400000000
#define THR4_PHY_OFF_1 0x0000000410000000
#define THR4_PHY_OFF_2 0x0000000420000000
#define THR4_PHY_OFF_3 0x0000000430000000
#define THR5_PHY_OFF_0 0x0000000500000000
#define THR5_PHY_OFF_1 0x0000000510000000
#define THR5_PHY_OFF_2 0x0000000520000000
#define THR5_PHY_OFF_3 0x0000000530000000
#define THR6_PHY_OFF_0 0x0000000600000000
#define THR6_PHY_OFF_1 0x0000000610000000
#define THR6_PHY_OFF_2 0x0000000620000000
#define THR6_PHY_OFF_3 0x0000000630000000
#define THR7_PHY_OFF_0 0x0000000700000000
#define THR7_PHY_OFF_1 0x0000000710000000
#define THR7_PHY_OFF_2 0x0000000720000000
#define THR7_PHY_OFF_3 0x0000000730000000
#define THR_0_PARTID 0
#define THR_1_PARTID 1
#define THR_2_PARTID 2
#define THR_3_PARTID 3
#define THR_4_PARTID 4
#define THR_5_PARTID 5
#define THR_6_PARTID 6
#define THR_7_PARTID 7
#define NUCLEUS 0x0
#define THR0_PCONTEXT_0 0x1e0a
#define THR0_PCONTEXT_1 0x0704
#define THR0_SCONTEXT_0 0x1189
#define THR0_SCONTEXT_1 0x1e9e
#define THR1_PCONTEXT_0 0x1d7d
#define THR1_PCONTEXT_1 0x0b8e
#define THR1_SCONTEXT_0 0x0df1
#define THR1_SCONTEXT_1 0x042c
#define THR2_PCONTEXT_0 0x09c1
#define THR2_PCONTEXT_1 0x005f
#define THR2_SCONTEXT_0 0x0b48
#define THR2_SCONTEXT_1 0x05db
#define THR3_PCONTEXT_0 0x0d2c
#define THR3_PCONTEXT_1 0x0b0f
#define THR3_SCONTEXT_0 0x07a8
#define THR3_SCONTEXT_1 0x11d4
#define THR4_PCONTEXT_0 0x0c8a
#define THR4_PCONTEXT_1 0x046e
#define THR4_SCONTEXT_0 0x03ce
#define THR4_SCONTEXT_1 0x0bed
#define THR5_PCONTEXT_0 0x0905
#define THR5_PCONTEXT_1 0x1c17
#define THR5_SCONTEXT_0 0x17b5
#define THR5_SCONTEXT_1 0x1d39
#define THR6_PCONTEXT_0 0x125d
#define THR6_PCONTEXT_1 0x1e27
#define THR6_SCONTEXT_0 0x1340
#define THR6_SCONTEXT_1 0x020e
#define THR7_PCONTEXT_0 0x0301
#define THR7_PCONTEXT_1 0x1b74
#define THR7_SCONTEXT_0 0x0afb
#define THR7_SCONTEXT_1 0x1ffa
#define THR0_PTRAP_TEXT_VA 0x00000a650000
#define THR0_PTRAP_TEXT_RA 0x1024400000
#define THR0_PTRAP_TEXT_PA 0x1024400000
#define THR1_PTRAP_TEXT_VA 0x00000ab40000
#define THR1_PTRAP_TEXT_RA 0x0014fe0000
#define THR1_PTRAP_TEXT_PA 0x0124fe0000
#define THR2_PTRAP_TEXT_VA 0x00000ac10000
#define THR2_PTRAP_TEXT_RA 0x0224630000
#define THR2_PTRAP_TEXT_PA 0x0224630000
#define THR3_PTRAP_TEXT_VA 0x00000aa90000
#define THR3_PTRAP_TEXT_RA 0x0324a20000
#define THR3_PTRAP_TEXT_PA 0x0324a20000
#define THR4_PTRAP_TEXT_VA 0x00000a440000
#define THR4_PTRAP_TEXT_RA 0x0424640000
#define THR4_PTRAP_TEXT_PA 0x0424640000
#define THR5_PTRAP_TEXT_VA 0x00000a210000
#define THR5_PTRAP_TEXT_RA 0x0014480000
#define THR5_PTRAP_TEXT_PA 0x0524480000
#define THR6_PTRAP_TEXT_VA 0x00000a2c0000
#define THR6_PTRAP_TEXT_RA 0x06247f0000
#define THR6_PTRAP_TEXT_PA 0x06247f0000
#define THR7_PTRAP_TEXT_VA 0x00000a460000
#define THR7_PTRAP_TEXT_RA 0x00149c0000
#define THR7_PTRAP_TEXT_PA 0x07249c0000
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
#define GOTO_SUPERVISOR0	ta PTRAP_GOTO_SUPERVISOR0
#define GOTO_SUPERVISOR1	ta PTRAP_GOTO_SUPERVISOR1
		
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
#define PTRAP_GOTO_SUPERVISOR0	0x2e
#define PTRAP_GOTO_SUPERVISOR1	0x2f
		
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
#define HPTRAP_GOTO_SUPERVISOR0	0x9a
#define HPTRAP_GOTO_SUPERVISOR1	0x9b
		
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
SECTION .Thr0_Priv_Sect TEXT_VA=0x00002cc000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_2
	VA = 0x0000002cc000 ,
	RA = 0x000001e000 ,
	PA = 0x100001e000 ,
	TTE_Context = 0x1e0a ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
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
SECTION .Thr1_Priv_Sect TEXT_VA=0x000035c000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_0
	VA = 0x00000035c000 ,
	RA = 0x01000ac000 ,
	PA = 0x01000ac000 ,
	TTE_Context = 0x1d7d ,
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
SECTION .Thr2_Priv_Sect TEXT_VA=0x000037a000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_1
	VA = 0x00000037a000 ,
	RA = 0x02000d4000 ,
	PA = 0x02000d4000 ,
	TTE_Context = 0x09c1 ,
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
SECTION .Thr3_Priv_Sect TEXT_VA=0x00002c6000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_1
	VA = 0x0000002c6000 ,
	RA = 0x0300112000 ,
	PA = 0x0300112000 ,
	TTE_Context = 0x0d2c ,
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
SECTION .Thr4_Priv_Sect TEXT_VA=0x000025c000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_1
	VA = 0x00000025c000 ,
	RA = 0x04001ca000 ,
	PA = 0x04001ca000 ,
	TTE_Context = 0x0c8a ,
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
SECTION .Thr5_Priv_Sect TEXT_VA=0x00003b2000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_0
	VA = 0x0000003b2000 ,
	RA = 0x0000136000 ,
	PA = 0x0500136000 ,
	TTE_Context = 0x0905 ,
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
	TTE_Size    = 0 ,
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
SECTION .Thr6_Priv_Sect TEXT_VA=0x0000232000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_2
	VA = 0x000000232000 ,
	RA = 0x06001ee000 ,
	PA = 0x06001ee000 ,
	TTE_Context = 0x125d ,
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
	TTE_W       =           1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
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
SECTION .Thr7_Priv_Sect TEXT_VA=0x0000296000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x000000296000 ,
	RA = 0x07001a4000 ,
	PA = 0x07001a4000 ,
	TTE_Context = 0x0301 ,
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
	ta	HPTRAP_GOTO_SUPERVISOR0	/* 0x12e */
.align 32
	ta	HPTRAP_GOTO_SUPERVISOR1	/* 0x12f */
.align 32
	ta	0x9c       	/* 0x130 */
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
	TTE_P       =           0 ,
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
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       =           0 ,
	TTE_EP      = 1 ,
	TTE_W       =           1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
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
	TTE_P       =           1 ,
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
        or      0x80, %g0, %g1
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
.align	32	/* 186 */
hptrap_I_demap_real:
        or      0xc0, %i7, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 187 */
hptrap_D_demap_all:
        or      0x80, %g0, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 188 */
hptrap_D_demap_pctx:
        or      0x40, %i7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 189 */
hptrap_D_demap_sctx:
        or      0x50, %i7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 18a */
hptrap_D_demap_nctx:
        or      0x60, %i7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 18b */
hptrap_D_demap_page:
        or      0x00, %i7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 18c */
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
	rdhpr	%hpstate, %g1
	rdpr	%pstate, %g2
	wrpr	%g2, 4, %pstate
	wrpr	0, %tl
	jmp	%i7
	wrhpr	%g1, 4, %hpstate
.align	32	/* 19b */
	rdhpr	%hpstate, %g1
	rdpr	%tl, %g2
	sub	%g2, 1, %g2
	wrpr	%g2, %g0, %tl
	rdpr	%pstate, %g2
	wrpr	%g2, 4, %pstate
	jmp	%i7
	wrhpr	%g1, 4, %hpstate
.align	32	/* 19c */
	rdhpr	%hpstate, %g1
	wrpr	0, %tl
	jmp	%i7
	wrhpr	%g1, 4, %hpstate
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
	or	%g0, 0x0400, %g5
trap_0x3e_sun4v:
	or	%g0, 0x0400, %g5
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
	or	%g0, 0x0400, %g5
trap_0x3f_sun4v:
	or	%g0, 0x0400, %g5
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
	or	%g0, 0x000, %g4		! %g4 = 0x400 -> 4V
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
	or	%g0, 0x000, %g4		! %g4 = 0x400 -> 4V
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
	.xword	0x000000f60000
	.xword	0x000000f61fc0
	.xword	0x000000e08000
	.xword	0x000000e09fc0
	.xword	0x000000e9c000
	.xword	0x000000e9dfc0
	.xword	0x000000fee000
	.xword	0x000000feffc0
	.xword	0x00001bc00000
	.xword	0x00001bffffc0
	.xword	0x000032400000
	.xword	0x0000327fffc0
	.xword	0x000000f84000
	.xword	0x000000f85fc0
	.xword	0x00002b800000
	.xword	0x00002bbfffc0
	.xword	0x000008000000
	.xword	0x0000083fffc0
	.xword	0x0000108f0000
	.xword	0x0000108fffc0
	.xword	0x000000f18000
	.xword	0x000000f19fc0
	.xword	0x000030000000
	.xword	0x0000303fffc0
	.xword	0x000028000000
	.xword	0x0000283fffc0
	.xword	0x000010430000
	.xword	0x00001043ffc0
	.xword	0x00000fc00000
	.xword	0x00000fffffc0
Thr1_register_initial_values:
	.xword	0x000000e22000
	.xword	0x000000e23fc0
	.xword	0x000010830000
	.xword	0x00001083ffc0
	.xword	0x000000e62000
	.xword	0x000000e63fc0
	.xword	0x000000ecc000
	.xword	0x000000ecdfc0
	.xword	0x000000e88000
	.xword	0x000000e89fc0
	.xword	0x0000100a0000
	.xword	0x0000100affc0
	.xword	0x000010030000
	.xword	0x00001003ffc0
	.xword	0x000000e06000
	.xword	0x000000e07fc0
	.xword	0x000010530000
	.xword	0x00001053ffc0
	.xword	0x000010330000
	.xword	0x00001033ffc0
	.xword	0x000010070000
	.xword	0x00001007ffc0
	.xword	0x000010ac0000
	.xword	0x000010acffc0
	.xword	0x000010730000
	.xword	0x00001073ffc0
	.xword	0x000000e16000
	.xword	0x000000e17fc0
	.xword	0x000000eb8000
	.xword	0x000000eb9fc0
Thr2_register_initial_values:
	.xword	0x00001fc00000
	.xword	0x00001fffffc0
	.xword	0x000024c00000
	.xword	0x000024ffffc0
	.xword	0x000000fa2000
	.xword	0x000000fa3fc0
	.xword	0x000000fa8000
	.xword	0x000000fa9fc0
	.xword	0x000000ea0000
	.xword	0x000000ea1fc0
	.xword	0x000010e10000
	.xword	0x000010e1ffc0
	.xword	0x000010880000
	.xword	0x00001088ffc0
	.xword	0x000000fb2000
	.xword	0x000000fb3fc0
	.xword	0x000000fd2000
	.xword	0x000000fd3fc0
	.xword	0x000000f5c000
	.xword	0x000000f5dfc0
	.xword	0x000010f40000
	.xword	0x000010f4ffc0
	.xword	0x0000107c0000
	.xword	0x0000107cffc0
	.xword	0x000000efe000
	.xword	0x000000efffc0
	.xword	0x000000e5e000
	.xword	0x000000e5ffc0
	.xword	0x00001a400000
	.xword	0x00001a7fffc0
Thr3_register_initial_values:
	.xword	0x000000f7c000
	.xword	0x000000f7dfc0
	.xword	0x000010820000
	.xword	0x00001082ffc0
	.xword	0x001de0000000
	.xword	0x001defffffc0
	.xword	0x000010230000
	.xword	0x00001023ffc0
	.xword	0x001dc0000000
	.xword	0x001dcfffffc0
	.xword	0x000000e0c000
	.xword	0x000000e0dfc0
	.xword	0x000000f9e000
	.xword	0x000000f9ffc0
	.xword	0x000010ab0000
	.xword	0x000010abffc0
	.xword	0x000010e90000
	.xword	0x000010e9ffc0
	.xword	0x000019400000
	.xword	0x0000197fffc0
	.xword	0x000010bb0000
	.xword	0x000010bbffc0
	.xword	0x000019c00000
	.xword	0x000019ffffc0
	.xword	0x000000e2a000
	.xword	0x000000e2bfc0
	.xword	0x001f30000000
	.xword	0x001f3fffffc0
	.xword	0x000010890000
	.xword	0x00001089ffc0
Thr4_register_initial_values:
	.xword	0x001e40000000
	.xword	0x001e4fffffc0
	.xword	0x000019000000
	.xword	0x0000193fffc0
	.xword	0x001ce0000000
	.xword	0x001cefffffc0
	.xword	0x000000ef4000
	.xword	0x000000ef5fc0
	.xword	0x000000eb0000
	.xword	0x000000eb1fc0
	.xword	0x000000f10000
	.xword	0x000000f11fc0
	.xword	0x001fd0000000
	.xword	0x001fdfffffc0
	.xword	0x000006c00000
	.xword	0x000006ffffc0
	.xword	0x000000e86000
	.xword	0x000000e87fc0
	.xword	0x000000f22000
	.xword	0x000000f23fc0
	.xword	0x00002c800000
	.xword	0x00002cbfffc0
	.xword	0x000000f88000
	.xword	0x000000f89fc0
	.xword	0x00000b800000
	.xword	0x00000bbfffc0
	.xword	0x000000f6c000
	.xword	0x000000f6dfc0
	.xword	0x0000100f0000
	.xword	0x0000100fffc0
Thr5_register_initial_values:
	.xword	0x000010520000
	.xword	0x00001052ffc0
	.xword	0x000000f7e000
	.xword	0x000000f7ffc0
	.xword	0x0000107b0000
	.xword	0x0000107bffc0
	.xword	0x0000109b0000
	.xword	0x0000109bffc0
	.xword	0x000000e34000
	.xword	0x000000e35fc0
	.xword	0x000025400000
	.xword	0x0000257fffc0
	.xword	0x000000f4c000
	.xword	0x000000f4dfc0
	.xword	0x000010ba0000
	.xword	0x000010baffc0
	.xword	0x00003d000000
	.xword	0x00003d3fffc0
	.xword	0x001c40000000
	.xword	0x001c4fffffc0
	.xword	0x000010980000
	.xword	0x00001098ffc0
	.xword	0x000000ec2000
	.xword	0x000000ec3fc0
	.xword	0x000010db0000
	.xword	0x000010dbffc0
	.xword	0x00000e000000
	.xword	0x00000e3fffc0
	.xword	0x000013400000
	.xword	0x0000137fffc0
Thr6_register_initial_values:
	.xword	0x000000e56000
	.xword	0x000000e57fc0
	.xword	0x00003ac00000
	.xword	0x00003affffc0
	.xword	0x000010ca0000
	.xword	0x000010caffc0
	.xword	0x000000f6a000
	.xword	0x000000f6bfc0
	.xword	0x000010490000
	.xword	0x00001049ffc0
	.xword	0x0000109d0000
	.xword	0x0000109dffc0
	.xword	0x000010250000
	.xword	0x00001025ffc0
	.xword	0x001c10000000
	.xword	0x001c1fffffc0
	.xword	0x00000c800000
	.xword	0x00000cbfffc0
	.xword	0x000036000000
	.xword	0x0000363fffc0
	.xword	0x0000105b0000
	.xword	0x0000105bffc0
	.xword	0x000027800000
	.xword	0x000027bfffc0
	.xword	0x000000fe8000
	.xword	0x000000fe9fc0
	.xword	0x0000106e0000
	.xword	0x0000106effc0
	.xword	0x000004c00000
	.xword	0x000004ffffc0
Thr7_register_initial_values:
	.xword	0x001fb0000000
	.xword	0x001fbfffffc0
	.xword	0x000010870000
	.xword	0x00001087ffc0
	.xword	0x000023000000
	.xword	0x0000233fffc0
	.xword	0x001c60000000
	.xword	0x001c6fffffc0
	.xword	0x000011400000
	.xword	0x0000117fffc0
	.xword	0x0000107a0000
	.xword	0x0000107affc0
	.xword	0x000000f32000
	.xword	0x000000f33fc0
	.xword	0x000000ee6000
	.xword	0x000000ee7fc0
	.xword	0x000010420000
	.xword	0x00001042ffc0
	.xword	0x000000fb6000
	.xword	0x000000fb7fc0
	.xword	0x000010c50000
	.xword	0x000010c5ffc0
	.xword	0x001d70000000
	.xword	0x001d7fffffc0
	.xword	0x000004800000
	.xword	0x000004bfffc0
	.xword	0x001f50000000
	.xword	0x001f5fffffc0
	.xword	0x00001ac00000
	.xword	0x00001affffc0
/*********************************************************************/
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x00002e6000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x0000002e6000 ,/* 0x0000002e7fc0 */
	RA = 0x0000010000 ,
	PA = 0x1000010000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr0_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
	or	%g0, 5, %l5
.global Thr0_User_Text_4v000_text_begin
Thr0_User_Text_4v000_text_begin:
	sub	%l5, 1, %l5
	brz	%l5, Thr0_terminate
	nop
	setx	Thr0_User_Text_4v001_text_begin, %i0, %i7
	GOTO_SUPERVISOR0
Thr0_terminate:	
	EXIT_GOOD
Thr0_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v001 TEXT_VA=0x00003a0000
attr_text {
	Name = .Thr0_User_Text_4v001 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x0000003a0000 ,/* 0x0000003a1fc0 */
	RA = 0x00000de000 ,
	PA = 0x10000de000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr0_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v001_text_begin
Thr0_User_Text_4v001_text_begin:
	! Priv=1, TL=0
	rdpr	%pstate, %l2
	setx	Thr0_User_Text_4v002_text_begin, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
Thr0_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v002 TEXT_VA=0x000a120000
attr_text {
	Name = .Thr0_User_Text_4v002 ,
	thr0_nz_ctx_tsb_3 ,
	VA = 0x00000a120000 ,/* 0x00000a12ffc0 */
	RA = 0x1024320000 ,
	PA = 0x1024320000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr0_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v002_text_begin
Thr0_User_Text_4v002_text_begin:
	setx	Thr0_User_Text_4v003_text_begin, %i0, %i7
	GOTO_SUPERVISOR1
	EXIT_BAD
Thr0_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v003 TEXT_VA=0x01e1c00000
attr_text {
	Name = .Thr0_User_Text_4v003 ,
	thr0_z_ctx_tsb_1 ,
	VA = 0x0001e1c00000 ,/* 0x0001e1ffffc0 */
	RA = 0x111c800000 ,
	PA = 0x111c800000 ,
	TTE_Context = 0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
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
	! Priv=1, TL=1
	setx	Thr0_User_Text_4v004_text_begin, %l0, %l1
	wrpr	%l1, %g0, %tnpc
	done
Thr0_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v004 TEXT_VA=0x0ee0000000
attr_text {
	Name = .Thr0_User_Text_4v004 ,
	thr0_nz_ctx_tsb_1 ,
	VA = 0x000ee0000000 ,/* 0x000eefffffc0 */
	RA = 0x1ca0000000 ,
	PA = 0x2cd0000000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 5 ,
	end_label   = Thr0_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v004_text_begin
Thr0_User_Text_4v004_text_begin:
	setx	Thr0_User_Text_4v005_text_begin, %i0, %i7
	ta	0x30
	EXIT_BAD
Thr0_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v005 TEXT_VA=0x01d8800000
attr_text {
	Name = .Thr0_User_Text_4v005 ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x0001d8800000 ,/* 0x0001d8bfffc0 */
	RA = 0x110b800000 ,
	PA = 0x110b800000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr0_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v005_text_begin
Thr0_User_Text_4v005_text_begin:
	setx	Thr0_User_Text_4v000_text_begin, %l0, %l1
	jmp	%l1
	nop
Thr0_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v105 DATA_VA=0x000033a000
attr_data {
	Name = .Thr0_User_Data_4v105 ,
	VA = 0x00000033a000 ,/* 0x00000033bfc0 */
	RA = 0x0000104000 ,
	PA = 0x1000104000 ,
	TTE_Context = 0x1e0a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr0_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v105_data_begin
Thr0_User_Data_4v105_data_begin:
Thr0_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v006 TEXT_VA=0x0000270000
attr_text {
	Name = .Thr0_User_Text_4v006 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000000270000 ,/* 0x000000271fc0 */
	RA = 0x0000102000 ,
	PA = 0x1000102000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr0_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v006_text_begin
Thr0_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v106 DATA_VA=0x00002a6000
attr_data {
	Name = .Thr0_User_Data_4v106 ,
	VA = 0x0000002a6000 ,/* 0x0000002a7fc0 */
	RA = 0x0000184000 ,
	PA = 0x1000184000 ,
	TTE_Context = 0x1e0a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr0_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v106_data_begin
Thr0_User_Data_4v106_data_begin:
Thr0_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v007 TEXT_VA=0x0000298000
attr_text {
	Name = .Thr0_User_Text_4v007 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000000298000 ,/* 0x000000299fc0 */
	RA = 0x000008c000 ,
	PA = 0x100008c000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr0_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v007_text_begin
Thr0_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v107 DATA_VA=0x000aee0000
attr_data {
	Name = .Thr0_User_Data_4v107 ,
	VA = 0x00000aee0000 ,/* 0x00000aeeffc0 */
	RA = 0x1024440000 ,
	PA = 0x1024440000 ,
	TTE_Context = 0x1e0a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr0_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v107_data_begin
Thr0_User_Data_4v107_data_begin:
Thr0_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v008 TEXT_VA=0x01fd400000
attr_text {
	Name = .Thr0_User_Text_4v008 ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x0001fd400000 ,/* 0x0001fd7fffc0 */
	RA = 0x10fcc00000 ,
	PA = 0x10fcc00000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr0_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v008_text_begin
Thr0_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v108 DATA_VA=0x00003f4000
attr_data {
	Name = .Thr0_User_Data_4v108 ,
	VA = 0x0000003f4000 ,/* 0x0000003f5fc0 */
	RA = 0x000015e000 ,
	PA = 0x100015e000 ,
	TTE_Context = 0x1e0a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr0_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v108_data_begin
Thr0_User_Data_4v108_data_begin:
Thr0_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v009 TEXT_VA=0x0000286000
attr_text {
	Name = .Thr0_User_Text_4v009 ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000000286000 ,/* 0x000000287fc0 */
	RA = 0x00000a4000 ,
	PA = 0x10000a4000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr0_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v009_text_begin
Thr0_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v109 DATA_VA=0x000af00000
attr_data {
	Name = .Thr0_User_Data_4v109 ,
	VA = 0x00000af00000 ,/* 0x00000af0ffc0 */
	RA = 0x1024530000 ,
	PA = 0x1024530000 ,
	TTE_Context = 0x1e0a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr0_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v109_data_begin
Thr0_User_Data_4v109_data_begin:
Thr0_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00a TEXT_VA=0x01d6000000
attr_text {
	Name = .Thr0_User_Text_4v00a ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x0001d6000000 ,/* 0x0001d63fffc0 */
	RA = 0x10fb400000 ,
	PA = 0x10fb400000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr0_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00a_text_begin
Thr0_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10a DATA_VA=0x000aaf0000
attr_data {
	Name = .Thr0_User_Data_4v10a ,
	VA = 0x00000aaf0000 ,/* 0x00000aafffc0 */
	RA = 0x1024d80000 ,
	PA = 0x1024d80000 ,
	TTE_Context = 0x1e0a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr0_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10a_data_begin
Thr0_User_Data_4v10a_data_begin:
Thr0_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00b TEXT_VA=0x01ff400000
attr_text {
	Name = .Thr0_User_Text_4v00b ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x0001ff400000 ,/* 0x0001ff7fffc0 */
	RA = 0x110bc00000 ,
	PA = 0x110bc00000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr0_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00b_text_begin
Thr0_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10b DATA_VA=0x000acd0000
attr_data {
	Name = .Thr0_User_Data_4v10b ,
	VA = 0x00000acd0000 ,/* 0x00000acdffc0 */
	RA = 0x1024250000 ,
	PA = 0x1024250000 ,
	TTE_Context = 0x1e0a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr0_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10b_data_begin
Thr0_User_Data_4v10b_data_begin:
Thr0_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00c TEXT_VA=0x01d0400000
attr_text {
	Name = .Thr0_User_Text_4v00c ,
	thr0_nz_ctx_tsb_0 ,
	VA = 0x0001d0400000 ,/* 0x0001d07fffc0 */
	RA = 0x1108400000 ,
	PA = 0x1108400000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr0_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00c_text_begin
Thr0_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10c DATA_VA=0x00002aa000
attr_data {
	Name = .Thr0_User_Data_4v10c ,
	VA = 0x0000002aa000 ,/* 0x0000002abfc0 */
	RA = 0x0000072000 ,
	PA = 0x1000072000 ,
	TTE_Context = 0x1e0a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr0_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10c_data_begin
Thr0_User_Data_4v10c_data_begin:
Thr0_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00d TEXT_VA=0x000a570000
attr_text {
	Name = .Thr0_User_Text_4v00d ,
	thr0_nz_ctx_tsb_3 ,
	VA = 0x00000a570000 ,/* 0x00000a57ffc0 */
	RA = 0x1024580000 ,
	PA = 0x1024580000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr0_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00d_text_begin
Thr0_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10d DATA_VA=0x000a710000
attr_data {
	Name = .Thr0_User_Data_4v10d ,
	VA = 0x00000a710000 ,/* 0x00000a71ffc0 */
	RA = 0x10241a0000 ,
	PA = 0x10241a0000 ,
	TTE_Context = 0x1e0a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr0_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10d_data_begin
Thr0_User_Data_4v10d_data_begin:
Thr0_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00e TEXT_VA=0x0000360000
attr_text {
	Name = .Thr0_User_Text_4v00e ,
	thr0_nz_ctx_tsb_2 ,
	VA = 0x000000360000 ,/* 0x000000361fc0 */
	RA = 0x00001e4000 ,
	PA = 0x10001e4000 ,
	TTE_Context = 0x1e0a ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr0_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00e_text_begin
Thr0_User_Text_4v00e_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10e DATA_VA=0x01f5800000
attr_data {
	Name = .Thr0_User_Data_4v10e ,
	VA = 0x0001f5800000 ,/* 0x0001f5bfffc0 */
	RA = 0x10f1400000 ,
	PA = 0x10f1400000 ,
	TTE_Context = 0x1e0a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr0_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10e_data_begin
Thr0_User_Data_4v10e_data_begin:
Thr0_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10f DATA_VA=0x000a110000
attr_data {
	Name = .Thr0_User_Data_4v10f ,
	VA = 0x00000a110000 ,/* 0x00000a11ffc0 */
	RA = 0x1024390000 ,
	PA = 0x1024390000 ,
	TTE_Context = 0x1e0a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr0_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10f_data_begin
Thr0_User_Data_4v10f_data_begin:
Thr0_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x000a6f0000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x00000a6f0000 ,/* 0x00000a6fffc0 */
	RA = 0x00148b0000 ,
	PA = 0x01248b0000 ,
	TTE_Context = 0x1d7d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
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
SECTION .Thr1_User_Data_4v100 DATA_VA=0x00003a6000
attr_data {
	Name = .Thr1_User_Data_4v100 ,
	VA = 0x0000003a6000 ,/* 0x0000003a7fc0 */
	RA = 0x01001cc000 ,
	PA = 0x01001cc000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v100_data_begin
Thr1_User_Data_4v100_data_begin:
Thr1_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v200 DATA_VA=0x0000318000
attr_data {
	Name = .Thr1_User_Data_4v200 ,
	VA = 0x000000318000 ,/* 0x000000319fc0 */
	RA = 0x0100176000 ,
	PA = 0x0100176000 ,
	TTE_Context = 0x0df1 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v200_data_begin
Thr1_User_Data_4v200_data_begin:
Thr1_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v300 DATA_VA=0x000026c000
attr_data {
	Name = .Thr1_User_Data_4v300 ,
	VA = 0x00000026c000 ,/* 0x00000026dfc0 */
	RA = 0x0100022000 ,
	PA = 0x0100022000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	end_label   = Thr1_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v300_data_begin
Thr1_User_Data_4v300_data_begin:
Thr1_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v001 TEXT_VA=0x01dac00000
attr_text {
	Name = .Thr1_User_Text_4v001 ,
	thr1_nz_ctx_tsb_2 ,
	VA = 0x0001dac00000 ,/* 0x0001daffffc0 */
	RA = 0x01eb000000 ,
	PA = 0x01eb000000 ,
	TTE_Context = 0x1d7d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v001_text_begin
Thr1_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v101 DATA_VA=0x0000334000
attr_data {
	Name = .Thr1_User_Data_4v101 ,
	VA = 0x000000334000 ,/* 0x000000335fc0 */
	RA = 0x0100128000 ,
	PA = 0x0100128000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v101_data_begin
Thr1_User_Data_4v101_data_begin:
Thr1_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v201 DATA_VA=0x0df0000000
attr_data {
	Name = .Thr1_User_Data_4v201 ,
	VA = 0x000df0000000 ,/* 0x000dffffffc0 */
	RA = 0x1fb0000000 ,
	PA = 0x20e0000000 ,
	TTE_Context = 0x0df1 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 5 ,
	end_label   = Thr1_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v201_data_begin
Thr1_User_Data_4v201_data_begin:
Thr1_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v301 DATA_VA=0x01f1c00000
attr_data {
	Name = .Thr1_User_Data_4v301 ,
	VA = 0x0001f1c00000 ,/* 0x0001f1ffffc0 */
	RA = 0x01efc00000 ,
	PA = 0x01efc00000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	end_label   = Thr1_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v301_data_begin
Thr1_User_Data_4v301_data_begin:
Thr1_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v002 TEXT_VA=0x000a540000
attr_text {
	Name = .Thr1_User_Text_4v002 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x00000a540000 ,/* 0x00000a54ffc0 */
	RA = 0x0014e80000 ,
	PA = 0x0124e80000 ,
	TTE_Context = 0x1d7d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr1_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v002_text_begin
Thr1_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v102 DATA_VA=0x000aad0000
attr_data {
	Name = .Thr1_User_Data_4v102 ,
	VA = 0x00000aad0000 ,/* 0x00000aadffc0 */
	RA = 0x0014dd0000 ,
	PA = 0x0124dd0000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr1_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v102_data_begin
Thr1_User_Data_4v102_data_begin:
Thr1_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v202 DATA_VA=0x01d9400000
attr_data {
	Name = .Thr1_User_Data_4v202 ,
	VA = 0x0001d9400000 ,/* 0x0001d97fffc0 */
	RA = 0x0207c00000 ,
	PA = 0x0207c00000 ,
	TTE_Context = 0x0df1 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v202_data_begin
Thr1_User_Data_4v202_data_begin:
Thr1_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v003 TEXT_VA=0x000af70000
attr_text {
	Name = .Thr1_User_Text_4v003 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x00000af70000 ,/* 0x00000af7ffc0 */
	RA = 0x0014df0000 ,
	PA = 0x0124df0000 ,
	TTE_Context = 0x1d7d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr1_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v003_text_begin
Thr1_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v103 DATA_VA=0x01ea400000
attr_data {
	Name = .Thr1_User_Data_4v103 ,
	VA = 0x0001ea400000 ,/* 0x0001ea7fffc0 */
	RA = 0x0213000000 ,
	PA = 0x0213000000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v103_data_begin
Thr1_User_Data_4v103_data_begin:
Thr1_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v203 DATA_VA=0x01ccc00000
attr_data {
	Name = .Thr1_User_Data_4v203 ,
	VA = 0x0001ccc00000 ,/* 0x0001ccffffc0 */
	RA = 0x01e4400000 ,
	PA = 0x01e4400000 ,
	TTE_Context = 0x0df1 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v203_data_begin
Thr1_User_Data_4v203_data_begin:
Thr1_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v004 TEXT_VA=0x000af60000
attr_text {
	Name = .Thr1_User_Text_4v004 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x00000af60000 ,/* 0x00000af6ffc0 */
	RA = 0x0014470000 ,
	PA = 0x0124470000 ,
	TTE_Context = 0x1d7d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr1_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v004_text_begin
Thr1_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v104 DATA_VA=0x01e4400000
attr_data {
	Name = .Thr1_User_Data_4v104 ,
	VA = 0x0001e4400000 ,/* 0x0001e47fffc0 */
	RA = 0x0210800000 ,
	PA = 0x0210800000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v104_data_begin
Thr1_User_Data_4v104_data_begin:
Thr1_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v005 TEXT_VA=0x000a890000
attr_text {
	Name = .Thr1_User_Text_4v005 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x00000a890000 ,/* 0x00000a89ffc0 */
	RA = 0x0014ca0000 ,
	PA = 0x0124ca0000 ,
	TTE_Context = 0x1d7d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr1_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v005_text_begin
Thr1_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v105 DATA_VA=0x000028a000
attr_data {
	Name = .Thr1_User_Data_4v105 ,
	VA = 0x00000028a000 ,/* 0x00000028bfc0 */
	RA = 0x01001c2000 ,
	PA = 0x01001c2000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v105_data_begin
Thr1_User_Data_4v105_data_begin:
Thr1_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v006 TEXT_VA=0x01efc00000
attr_text {
	Name = .Thr1_User_Text_4v006 ,
	thr1_nz_ctx_tsb_2 ,
	VA = 0x0001efc00000 ,/* 0x0001efffffc0 */
	RA = 0x01f5c00000 ,
	PA = 0x01f5c00000 ,
	TTE_Context = 0x1d7d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v006_text_begin
Thr1_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v106 DATA_VA=0x01d3400000
attr_data {
	Name = .Thr1_User_Data_4v106 ,
	VA = 0x0001d3400000 ,/* 0x0001d37fffc0 */
	RA = 0x0203800000 ,
	PA = 0x0203800000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v106_data_begin
Thr1_User_Data_4v106_data_begin:
Thr1_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v007 TEXT_VA=0x000024a000
attr_text {
	Name = .Thr1_User_Text_4v007 ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x00000024a000 ,/* 0x00000024bfc0 */
	RA = 0x010016c000 ,
	PA = 0x010016c000 ,
	TTE_Context = 0x1d7d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr1_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v007_text_begin
Thr1_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v107 DATA_VA=0x01e2800000
attr_data {
	Name = .Thr1_User_Data_4v107 ,
	VA = 0x0001e2800000 ,/* 0x0001e2bfffc0 */
	RA = 0x0203000000 ,
	PA = 0x0203000000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v107_data_begin
Thr1_User_Data_4v107_data_begin:
Thr1_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v008 TEXT_VA=0x000a190000
attr_text {
	Name = .Thr1_User_Text_4v008 ,
	thr1_nz_ctx_tsb_1 ,
	VA = 0x00000a190000 ,/* 0x00000a19ffc0 */
	RA = 0x0014b40000 ,
	PA = 0x0124b40000 ,
	TTE_Context = 0x1d7d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr1_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v008_text_begin
Thr1_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v108 DATA_VA=0x000a040000
attr_data {
	Name = .Thr1_User_Data_4v108 ,
	VA = 0x00000a040000 ,/* 0x00000a04ffc0 */
	RA = 0x00142a0000 ,
	PA = 0x01242a0000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr1_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v108_data_begin
Thr1_User_Data_4v108_data_begin:
Thr1_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v009 TEXT_VA=0x000027a000
attr_text {
	Name = .Thr1_User_Text_4v009 ,
	thr1_nz_ctx_tsb_0 ,
	VA = 0x00000027a000 ,/* 0x00000027bfc0 */
	RA = 0x0100172000 ,
	PA = 0x0100172000 ,
	TTE_Context = 0x1d7d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr1_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v009_text_begin
Thr1_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v109 DATA_VA=0x000020c000
attr_data {
	Name = .Thr1_User_Data_4v109 ,
	VA = 0x00000020c000 ,/* 0x00000020dfc0 */
	RA = 0x01001b8000 ,
	PA = 0x01001b8000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v109_data_begin
Thr1_User_Data_4v109_data_begin:
Thr1_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10a DATA_VA=0x01f5000000
attr_data {
	Name = .Thr1_User_Data_4v10a ,
	VA = 0x0001f5000000 ,/* 0x0001f53fffc0 */
	RA = 0x01eac00000 ,
	PA = 0x01eac00000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10a_data_begin
Thr1_User_Data_4v10a_data_begin:
Thr1_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10b DATA_VA=0x000a3b0000
attr_data {
	Name = .Thr1_User_Data_4v10b ,
	VA = 0x00000a3b0000 ,/* 0x00000a3bffc0 */
	RA = 0x0014540000 ,
	PA = 0x0124540000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr1_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10b_data_begin
Thr1_User_Data_4v10b_data_begin:
Thr1_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10c DATA_VA=0x00003b0000
attr_data {
	Name = .Thr1_User_Data_4v10c ,
	VA = 0x0000003b0000 ,/* 0x0000003b1fc0 */
	RA = 0x01000f4000 ,
	PA = 0x01000f4000 ,
	TTE_Context = 0x1d7d ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr1_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10c_data_begin
Thr1_User_Data_4v10c_data_begin:
Thr1_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x000a770000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x00000a770000 ,/* 0x00000a77ffc0 */
	RA = 0x02242c0000 ,
	PA = 0x02242c0000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
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
SECTION .Thr2_User_Data_4v100 DATA_VA=0x000021c000
attr_data {
	Name = .Thr2_User_Data_4v100 ,
	VA = 0x00000021c000 ,/* 0x00000021dfc0 */
	RA = 0x02000a2000 ,
	PA = 0x02000a2000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
SECTION .Thr2_User_Data_4v200 DATA_VA=0x01c5800000
attr_data {
	Name = .Thr2_User_Data_4v200 ,
	VA = 0x0001c5800000 ,/* 0x0001c5bfffc0 */
	RA = 0x0310400000 ,
	PA = 0x0310400000 ,
	TTE_Context = 0x0b48 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr2_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v200_data_begin
Thr2_User_Data_4v200_data_begin:
Thr2_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v300 DATA_VA=0x000a8d0000
attr_data {
	Name = .Thr2_User_Data_4v300 ,
	VA = 0x00000a8d0000 ,/* 0x00000a8dffc0 */
	RA = 0x02246d0000 ,
	PA = 0x02246d0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr2_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v300_data_begin
Thr2_User_Data_4v300_data_begin:
Thr2_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v001 TEXT_VA=0x000039c000
attr_text {
	Name = .Thr2_User_Text_4v001 ,
	thr2_nz_ctx_tsb_1 ,
	VA = 0x00000039c000 ,/* 0x00000039dfc0 */
	RA = 0x020015a000 ,
	PA = 0x020015a000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
SECTION .Thr2_User_Data_4v101 DATA_VA=0x00003f2000
attr_data {
	Name = .Thr2_User_Data_4v101 ,
	VA = 0x0000003f2000 ,/* 0x0000003f3fc0 */
	RA = 0x020004c000 ,
	PA = 0x020004c000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
SECTION .Thr2_User_Data_4v201 DATA_VA=0x000a8e0000
attr_data {
	Name = .Thr2_User_Data_4v201 ,
	VA = 0x00000a8e0000 ,/* 0x00000a8effc0 */
	RA = 0x0224590000 ,
	PA = 0x0224590000 ,
	TTE_Context = 0x0b48 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr2_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v201_data_begin
Thr2_User_Data_4v201_data_begin:
Thr2_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v301 DATA_VA=0x00002ba000
attr_data {
	Name = .Thr2_User_Data_4v301 ,
	VA = 0x0000002ba000 ,/* 0x0000002bbfc0 */
	RA = 0x02000f6000 ,
	PA = 0x02000f6000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr2_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v301_data_begin
Thr2_User_Data_4v301_data_begin:
Thr2_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v002 TEXT_VA=0x000aa40000
attr_text {
	Name = .Thr2_User_Text_4v002 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x00000aa40000 ,/* 0x00000aa4ffc0 */
	RA = 0x0224fb0000 ,
	PA = 0x0224fb0000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr2_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v002_text_begin
Thr2_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v102 DATA_VA=0x0000218000
attr_data {
	Name = .Thr2_User_Data_4v102 ,
	VA = 0x000000218000 ,/* 0x000000219fc0 */
	RA = 0x02001a8000 ,
	PA = 0x02001a8000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
SECTION .Thr2_User_Data_4v202 DATA_VA=0x000adb0000
attr_data {
	Name = .Thr2_User_Data_4v202 ,
	VA = 0x00000adb0000 ,/* 0x00000adbffc0 */
	RA = 0x0224bd0000 ,
	PA = 0x0224bd0000 ,
	TTE_Context = 0x0b48 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr2_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v202_data_begin
Thr2_User_Data_4v202_data_begin:
Thr2_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v302 DATA_VA=0x01f7000000
attr_data {
	Name = .Thr2_User_Data_4v302 ,
	VA = 0x0001f7000000 ,/* 0x0001f73fffc0 */
	RA = 0x0315400000 ,
	PA = 0x0315400000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr2_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v302_data_begin
Thr2_User_Data_4v302_data_begin:
Thr2_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v003 TEXT_VA=0x000acb0000
attr_text {
	Name = .Thr2_User_Text_4v003 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x00000acb0000 ,/* 0x00000acbffc0 */
	RA = 0x0224880000 ,
	PA = 0x0224880000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr2_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v003_text_begin
Thr2_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v103 DATA_VA=0x0000200000
attr_data {
	Name = .Thr2_User_Data_4v103 ,
	VA = 0x000000200000 ,/* 0x000000201fc0 */
	RA = 0x0200004000 ,
	PA = 0x0200004000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
SECTION .Thr2_User_Data_4v203 DATA_VA=0x0e40000000
attr_data {
	Name = .Thr2_User_Data_4v203 ,
	VA = 0x000e40000000 ,/* 0x000e4fffffc0 */
	RA = 0x1f10000000 ,
	PA = 0x2140000000 ,
	TTE_Context = 0x0b48 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 5 ,
	end_label   = Thr2_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v203_data_begin
Thr2_User_Data_4v203_data_begin:
Thr2_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v303 DATA_VA=0x0000234000
attr_data {
	Name = .Thr2_User_Data_4v303 ,
	VA = 0x000000234000 ,/* 0x000000235fc0 */
	RA = 0x02001f8000 ,
	PA = 0x02001f8000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr2_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v303_data_begin
Thr2_User_Data_4v303_data_begin:
Thr2_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v004 TEXT_VA=0x01db400000
attr_text {
	Name = .Thr2_User_Text_4v004 ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x0001db400000 ,/* 0x0001db7fffc0 */
	RA = 0x02f3000000 ,
	PA = 0x02f3000000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr2_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v004_text_begin
Thr2_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v104 DATA_VA=0x0000338000
attr_data {
	Name = .Thr2_User_Data_4v104 ,
	VA = 0x000000338000 ,/* 0x000000339fc0 */
	RA = 0x020010e000 ,
	PA = 0x020010e000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
SECTION .Thr2_User_Data_4v204 DATA_VA=0x01f6c00000
attr_data {
	Name = .Thr2_User_Data_4v204 ,
	VA = 0x0001f6c00000 ,/* 0x0001f6ffffc0 */
	RA = 0x02fdc00000 ,
	PA = 0x02fdc00000 ,
	TTE_Context = 0x0b48 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr2_User_Data_4v204_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v204_data_begin
Thr2_User_Data_4v204_data_begin:
Thr2_User_Data_4v204_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v304 DATA_VA=0x00003bc000
attr_data {
	Name = .Thr2_User_Data_4v304 ,
	VA = 0x0000003bc000 ,/* 0x0000003bdfc0 */
	RA = 0x02001c6000 ,
	PA = 0x02001c6000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr2_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v304_data_begin
Thr2_User_Data_4v304_data_begin:
Thr2_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v005 TEXT_VA=0x01f3400000
attr_text {
	Name = .Thr2_User_Text_4v005 ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x0001f3400000 ,/* 0x0001f37fffc0 */
	RA = 0x031ec00000 ,
	PA = 0x031ec00000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr2_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v005_text_begin
Thr2_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v105 DATA_VA=0x01e7400000
attr_data {
	Name = .Thr2_User_Data_4v105 ,
	VA = 0x0001e7400000 ,/* 0x0001e77fffc0 */
	RA = 0x02f2c00000 ,
	PA = 0x02f2c00000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr2_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v105_data_begin
Thr2_User_Data_4v105_data_begin:
Thr2_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v006 TEXT_VA=0x01c3c00000
attr_text {
	Name = .Thr2_User_Text_4v006 ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x0001c3c00000 ,/* 0x0001c3ffffc0 */
	RA = 0x031bc00000 ,
	PA = 0x031bc00000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr2_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v006_text_begin
Thr2_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v106 DATA_VA=0x00002c2000
attr_data {
	Name = .Thr2_User_Data_4v106 ,
	VA = 0x0000002c2000 ,/* 0x0000002c3fc0 */
	RA = 0x0200000000 ,
	PA = 0x0200000000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
SECTION .Thr2_User_Text_4v007 TEXT_VA=0x01f3800000
attr_text {
	Name = .Thr2_User_Text_4v007 ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x0001f3800000 ,/* 0x0001f3bfffc0 */
	RA = 0x02e1c00000 ,
	PA = 0x02e1c00000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr2_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v007_text_begin
Thr2_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v107 DATA_VA=0x00003c8000
attr_data {
	Name = .Thr2_User_Data_4v107 ,
	VA = 0x0000003c8000 ,/* 0x0000003c9fc0 */
	RA = 0x02001f2000 ,
	PA = 0x02001f2000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
SECTION .Thr2_User_Text_4v008 TEXT_VA=0x000aa20000
attr_text {
	Name = .Thr2_User_Text_4v008 ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x00000aa20000 ,/* 0x00000aa2ffc0 */
	RA = 0x0224cd0000 ,
	PA = 0x0224cd0000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr2_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v008_text_begin
Thr2_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v108 DATA_VA=0x00002c0000
attr_data {
	Name = .Thr2_User_Data_4v108 ,
	VA = 0x0000002c0000 ,/* 0x0000002c1fc0 */
	RA = 0x02000f0000 ,
	PA = 0x02000f0000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
SECTION .Thr2_User_Text_4v009 TEXT_VA=0x01c0c00000
attr_text {
	Name = .Thr2_User_Text_4v009 ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x0001c0c00000 ,/* 0x0001c0ffffc0 */
	RA = 0x02e2c00000 ,
	PA = 0x02e2c00000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr2_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v009_text_begin
Thr2_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v109 DATA_VA=0x000a0a0000
attr_data {
	Name = .Thr2_User_Data_4v109 ,
	VA = 0x00000a0a0000 ,/* 0x00000a0affc0 */
	RA = 0x02246f0000 ,
	PA = 0x02246f0000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr2_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v109_data_begin
Thr2_User_Data_4v109_data_begin:
Thr2_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00a TEXT_VA=0x000a530000
attr_text {
	Name = .Thr2_User_Text_4v00a ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x00000a530000 ,/* 0x00000a53ffc0 */
	RA = 0x02245d0000 ,
	PA = 0x02245d0000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr2_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00a_text_begin
Thr2_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10a DATA_VA=0x0000376000
attr_data {
	Name = .Thr2_User_Data_4v10a ,
	VA = 0x000000376000 ,/* 0x000000377fc0 */
	RA = 0x020000c000 ,
	PA = 0x020000c000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr2_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10a_data_begin
Thr2_User_Data_4v10a_data_begin:
Thr2_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00b TEXT_VA=0x01c8800000
attr_text {
	Name = .Thr2_User_Text_4v00b ,
	thr2_nz_ctx_tsb_3 ,
	VA = 0x0001c8800000 ,/* 0x0001c8bfffc0 */
	RA = 0x02f1c00000 ,
	PA = 0x02f1c00000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr2_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00b_text_begin
Thr2_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10b DATA_VA=0x0000226000
attr_data {
	Name = .Thr2_User_Data_4v10b ,
	VA = 0x000000226000 ,/* 0x000000227fc0 */
	RA = 0x020013c000 ,
	PA = 0x020013c000 ,
	TTE_Context = 0x09c1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr2_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10b_data_begin
Thr2_User_Data_4v10b_data_begin:
Thr2_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00c TEXT_VA=0x000a8f0000
attr_text {
	Name = .Thr2_User_Text_4v00c ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x00000a8f0000 ,/* 0x00000a8fffc0 */
	RA = 0x0224fd0000 ,
	PA = 0x0224fd0000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr2_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00c_text_begin
Thr2_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00d TEXT_VA=0x000a4a0000
attr_text {
	Name = .Thr2_User_Text_4v00d ,
	thr2_nz_ctx_tsb_2 ,
	VA = 0x00000a4a0000 ,/* 0x00000a4affc0 */
	RA = 0x0224f10000 ,
	PA = 0x0224f10000 ,
	TTE_Context = 0x09c1 ,/* TEXT_PRIMARY */
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
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr2_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00d_text_begin
Thr2_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x000a230000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x00000a230000 ,/* 0x00000a23ffc0 */
	RA = 0x0014010000 ,
	PA = 0x0324010000 ,
	TTE_Context = 0x0d2c ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr3_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr3_user_code_entry
Thr3_user_code_entry:
.global Thr3_User_Text_4v000_text_begin
Thr3_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v100 DATA_VA=0x0000264000
attr_data {
	Name = .Thr3_User_Data_4v100 ,
	VA = 0x000000264000 ,/* 0x000000265fc0 */
	RA = 0x0300058000 ,
	PA = 0x0300058000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
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
SECTION .Thr3_User_Data_4v200 DATA_VA=0x000a610000
attr_data {
	Name = .Thr3_User_Data_4v200 ,
	VA = 0x00000a610000 ,/* 0x00000a61ffc0 */
	RA = 0x0014f30000 ,
	PA = 0x0324f30000 ,
	TTE_Context = 0x07a8 ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr3_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v200_data_begin
Thr3_User_Data_4v200_data_begin:
Thr3_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v300 DATA_VA=0x0000320000
attr_data {
	Name = .Thr3_User_Data_4v300 ,
	VA = 0x000000320000 ,/* 0x000000321fc0 */
	RA = 0x03001e2000 ,
	PA = 0x03001e2000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
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
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
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
SECTION .Thr3_User_Text_4v001 TEXT_VA=0x000a730000
attr_text {
	Name = .Thr3_User_Text_4v001 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x00000a730000 ,/* 0x00000a73ffc0 */
	RA = 0x00143d0000 ,
	PA = 0x03243d0000 ,
	TTE_Context = 0x0d2c ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr3_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v001_text_begin
Thr3_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v101 DATA_VA=0x0000208000
attr_data {
	Name = .Thr3_User_Data_4v101 ,
	VA = 0x000000208000 ,/* 0x000000209fc0 */
	RA = 0x03001fe000 ,
	PA = 0x03001fe000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
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
SECTION .Thr3_User_Data_4v201 DATA_VA=0x000037c000
attr_data {
	Name = .Thr3_User_Data_4v201 ,
	VA = 0x00000037c000 ,/* 0x00000037dfc0 */
	RA = 0x03000fa000 ,
	PA = 0x03000fa000 ,
	TTE_Context = 0x07a8 ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v201_data_begin
Thr3_User_Data_4v201_data_begin:
Thr3_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v301 DATA_VA=0x00002d2000
attr_data {
	Name = .Thr3_User_Data_4v301 ,
	VA = 0x0000002d2000 ,/* 0x0000002d3fc0 */
	RA = 0x03001ac000 ,
	PA = 0x03001ac000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
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
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
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
SECTION .Thr3_User_Text_4v002 TEXT_VA=0x000aff0000
attr_text {
	Name = .Thr3_User_Text_4v002 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x00000aff0000 ,/* 0x00000affffc0 */
	RA = 0x0014070000 ,
	PA = 0x0324070000 ,
	TTE_Context = 0x0d2c ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr3_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v002_text_begin
Thr3_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v102 DATA_VA=0x00003c0000
attr_data {
	Name = .Thr3_User_Data_4v102 ,
	VA = 0x0000003c0000 ,/* 0x0000003c1fc0 */
	RA = 0x03001a6000 ,
	PA = 0x03001a6000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
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
SECTION .Thr3_User_Data_4v202 DATA_VA=0x00003d6000
attr_data {
	Name = .Thr3_User_Data_4v202 ,
	VA = 0x0000003d6000 ,/* 0x0000003d7fc0 */
	RA = 0x03000d8000 ,
	PA = 0x03000d8000 ,
	TTE_Context = 0x07a8 ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v202_data_begin
Thr3_User_Data_4v202_data_begin:
Thr3_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v003 TEXT_VA=0x00002f6000
attr_text {
	Name = .Thr3_User_Text_4v003 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x0000002f6000 ,/* 0x0000002f7fc0 */
	RA = 0x03001aa000 ,
	PA = 0x03001aa000 ,
	TTE_Context = 0x0d2c ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
SECTION .Thr3_User_Data_4v103 DATA_VA=0x01d9800000
attr_data {
	Name = .Thr3_User_Data_4v103 ,
	VA = 0x0001d9800000 ,/* 0x0001d9bfffc0 */
	RA = 0x03ff400000 ,
	PA = 0x03ff400000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr3_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v103_data_begin
Thr3_User_Data_4v103_data_begin:
Thr3_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v004 TEXT_VA=0x000030a000
attr_text {
	Name = .Thr3_User_Text_4v004 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x00000030a000 ,/* 0x00000030bfc0 */
	RA = 0x0300044000 ,
	PA = 0x0300044000 ,
	TTE_Context = 0x0d2c ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
SECTION .Thr3_User_Data_4v104 DATA_VA=0x000aa70000
attr_data {
	Name = .Thr3_User_Data_4v104 ,
	VA = 0x00000aa70000 ,/* 0x00000aa7ffc0 */
	RA = 0x00144c0000 ,
	PA = 0x03244c0000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr3_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v104_data_begin
Thr3_User_Data_4v104_data_begin:
Thr3_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v005 TEXT_VA=0x000a550000
attr_text {
	Name = .Thr3_User_Text_4v005 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x00000a550000 ,/* 0x00000a55ffc0 */
	RA = 0x0014b70000 ,
	PA = 0x0324b70000 ,
	TTE_Context = 0x0d2c ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr3_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v005_text_begin
Thr3_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v105 DATA_VA=0x0da0000000
attr_data {
	Name = .Thr3_User_Data_4v105 ,
	VA = 0x000da0000000 ,/* 0x000dafffffc0 */
	RA = 0x1c00000000 ,
	PA = 0x1f30000000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr3_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v105_data_begin
Thr3_User_Data_4v105_data_begin:
Thr3_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v006 TEXT_VA=0x000a620000
attr_text {
	Name = .Thr3_User_Text_4v006 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x00000a620000 ,/* 0x00000a62ffc0 */
	RA = 0x0014180000 ,
	PA = 0x0324180000 ,
	TTE_Context = 0x0d2c ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr3_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v006_text_begin
Thr3_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v106 DATA_VA=0x000ab20000
attr_data {
	Name = .Thr3_User_Data_4v106 ,
	VA = 0x00000ab20000 ,/* 0x00000ab2ffc0 */
	RA = 0x0014dc0000 ,
	PA = 0x0324dc0000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr3_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v106_data_begin
Thr3_User_Data_4v106_data_begin:
Thr3_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v007 TEXT_VA=0x00003b6000
attr_text {
	Name = .Thr3_User_Text_4v007 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x0000003b6000 ,/* 0x0000003b7fc0 */
	RA = 0x030007e000 ,
	PA = 0x030007e000 ,
	TTE_Context = 0x0d2c ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr3_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v007_text_begin
Thr3_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v107 DATA_VA=0x0000274000
attr_data {
	Name = .Thr3_User_Data_4v107 ,
	VA = 0x000000274000 ,/* 0x000000275fc0 */
	RA = 0x030001c000 ,
	PA = 0x030001c000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr3_User_Text_4v008 TEXT_VA=0x0000380000
attr_text {
	Name = .Thr3_User_Text_4v008 ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000000380000 ,/* 0x000000381fc0 */
	RA = 0x030018c000 ,
	PA = 0x030018c000 ,
	TTE_Context = 0x0d2c ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr3_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v008_text_begin
Thr3_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v108 DATA_VA=0x0c90000000
attr_data {
	Name = .Thr3_User_Data_4v108 ,
	VA = 0x000c90000000 ,/* 0x000c9fffffc0 */
	RA = 0x1fa0000000 ,
	PA = 0x22d0000000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr3_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v108_data_begin
Thr3_User_Data_4v108_data_begin:
Thr3_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v009 TEXT_VA=0x000abf0000
attr_text {
	Name = .Thr3_User_Text_4v009 ,
	thr3_nz_ctx_tsb_2 ,
	VA = 0x00000abf0000 ,/* 0x00000abfffc0 */
	RA = 0x0014ac0000 ,
	PA = 0x0324ac0000 ,
	TTE_Context = 0x0d2c ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr3_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v009_text_begin
Thr3_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v109 DATA_VA=0x000a070000
attr_data {
	Name = .Thr3_User_Data_4v109 ,
	VA = 0x00000a070000 ,/* 0x00000a07ffc0 */
	RA = 0x0014120000 ,
	PA = 0x0324120000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr3_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v109_data_begin
Thr3_User_Data_4v109_data_begin:
Thr3_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00a TEXT_VA=0x0000378000
attr_text {
	Name = .Thr3_User_Text_4v00a ,
	thr3_nz_ctx_tsb_1 ,
	VA = 0x000000378000 ,/* 0x000000379fc0 */
	RA = 0x0300160000 ,
	PA = 0x0300160000 ,
	TTE_Context = 0x0d2c ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr3_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00a_text_begin
Thr3_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10a DATA_VA=0x01df000000
attr_data {
	Name = .Thr3_User_Data_4v10a ,
	VA = 0x0001df000000 ,/* 0x0001df3fffc0 */
	RA = 0x03fc400000 ,
	PA = 0x03fc400000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr3_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10a_data_begin
Thr3_User_Data_4v10a_data_begin:
Thr3_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10b DATA_VA=0x01d8000000
attr_data {
	Name = .Thr3_User_Data_4v10b ,
	VA = 0x0001d8000000 ,/* 0x0001d83fffc0 */
	RA = 0x0409000000 ,
	PA = 0x0409000000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr3_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10b_data_begin
Thr3_User_Data_4v10b_data_begin:
Thr3_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10c DATA_VA=0x01c4400000
attr_data {
	Name = .Thr3_User_Data_4v10c ,
	VA = 0x0001c4400000 ,/* 0x0001c47fffc0 */
	RA = 0x03f3400000 ,
	PA = 0x03f3400000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr3_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10c_data_begin
Thr3_User_Data_4v10c_data_begin:
Thr3_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10d DATA_VA=0x000a5f0000
attr_data {
	Name = .Thr3_User_Data_4v10d ,
	VA = 0x00000a5f0000 ,/* 0x00000a5fffc0 */
	RA = 0x0014cb0000 ,
	PA = 0x0324cb0000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr3_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10d_data_begin
Thr3_User_Data_4v10d_data_begin:
Thr3_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10e DATA_VA=0x0000322000
attr_data {
	Name = .Thr3_User_Data_4v10e ,
	VA = 0x000000322000 ,/* 0x000000323fc0 */
	RA = 0x03000bc000 ,
	PA = 0x03000bc000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10e_data_begin
Thr3_User_Data_4v10e_data_begin:
Thr3_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10f DATA_VA=0x0000382000
attr_data {
	Name = .Thr3_User_Data_4v10f ,
	VA = 0x000000382000 ,/* 0x000000383fc0 */
	RA = 0x03001f0000 ,
	PA = 0x03001f0000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr3_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10f_data_begin
Thr3_User_Data_4v10f_data_begin:
Thr3_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v110 DATA_VA=0x01d7c00000
attr_data {
	Name = .Thr3_User_Data_4v110 ,
	VA = 0x0001d7c00000 ,/* 0x0001d7ffffc0 */
	RA = 0x041dc00000 ,
	PA = 0x041dc00000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr3_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v110_data_begin
Thr3_User_Data_4v110_data_begin:
Thr3_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v111 DATA_VA=0x01c3400000
attr_data {
	Name = .Thr3_User_Data_4v111 ,
	VA = 0x0001c3400000 ,/* 0x0001c37fffc0 */
	RA = 0x040b000000 ,
	PA = 0x040b000000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr3_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v111_data_begin
Thr3_User_Data_4v111_data_begin:
Thr3_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v112 DATA_VA=0x000ae80000
attr_data {
	Name = .Thr3_User_Data_4v112 ,
	VA = 0x00000ae80000 ,/* 0x00000ae8ffc0 */
	RA = 0x0014ba0000 ,
	PA = 0x0324ba0000 ,
	TTE_Context = 0x0d2c ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr3_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v112_data_begin
Thr3_User_Data_4v112_data_begin:
Thr3_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x000aae0000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x00000aae0000 ,/* 0x00000aaeffc0 */
	RA = 0x04245f0000 ,
	PA = 0x04245f0000 ,
	TTE_Context = 0x0c8a ,/* TEXT_PRIMARY */
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
SECTION .Thr4_User_Data_4v100 DATA_VA=0x00002e4000
attr_data {
	Name = .Thr4_User_Data_4v100 ,
	VA = 0x0000002e4000 ,/* 0x0000002e5fc0 */
	RA = 0x0400080000 ,
	PA = 0x0400080000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr4_User_Data_4v200 DATA_VA=0x000ad80000
attr_data {
	Name = .Thr4_User_Data_4v200 ,
	VA = 0x00000ad80000 ,/* 0x00000ad8ffc0 */
	RA = 0x0424f20000 ,
	PA = 0x0424f20000 ,
	TTE_Context = 0x03ce ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v200_data_begin
Thr4_User_Data_4v200_data_begin:
Thr4_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v300 DATA_VA=0x000ac40000
attr_data {
	Name = .Thr4_User_Data_4v300 ,
	VA = 0x00000ac40000 ,/* 0x00000ac4ffc0 */
	RA = 0x04242b0000 ,
	PA = 0x04242b0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v300_data_begin
Thr4_User_Data_4v300_data_begin:
Thr4_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v001 TEXT_VA=0x000a820000
attr_text {
	Name = .Thr4_User_Text_4v001 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x00000a820000 ,/* 0x00000a82ffc0 */
	RA = 0x0424ec0000 ,
	PA = 0x0424ec0000 ,
	TTE_Context = 0x0c8a ,/* TEXT_PRIMARY */
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
SECTION .Thr4_User_Data_4v101 DATA_VA=0x000a920000
attr_data {
	Name = .Thr4_User_Data_4v101 ,
	VA = 0x00000a920000 ,/* 0x00000a92ffc0 */
	RA = 0x0424a10000 ,
	PA = 0x0424a10000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr4_User_Data_4v201 DATA_VA=0x0000370000
attr_data {
	Name = .Thr4_User_Data_4v201 ,
	VA = 0x000000370000 ,/* 0x000000371fc0 */
	RA = 0x04000ec000 ,
	PA = 0x04000ec000 ,
	TTE_Context = 0x03ce ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr4_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v201_data_begin
Thr4_User_Data_4v201_data_begin:
Thr4_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v301 DATA_VA=0x0000386000
attr_data {
	Name = .Thr4_User_Data_4v301 ,
	VA = 0x000000386000 ,/* 0x000000387fc0 */
	RA = 0x0400042000 ,
	PA = 0x0400042000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr4_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v301_data_begin
Thr4_User_Data_4v301_data_begin:
Thr4_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v002 TEXT_VA=0x000036e000
attr_text {
	Name = .Thr4_User_Text_4v002 ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x00000036e000 ,/* 0x00000036ffc0 */
	RA = 0x040006e000 ,
	PA = 0x040006e000 ,
	TTE_Context = 0x0c8a ,/* TEXT_PRIMARY */
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
	end_label   = Thr4_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v002_text_begin
Thr4_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v102 DATA_VA=0x000ad60000
attr_data {
	Name = .Thr4_User_Data_4v102 ,
	VA = 0x00000ad60000 ,/* 0x00000ad6ffc0 */
	RA = 0x04242e0000 ,
	PA = 0x04242e0000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v102_data_begin
Thr4_User_Data_4v102_data_begin:
Thr4_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v202 DATA_VA=0x000a860000
attr_data {
	Name = .Thr4_User_Data_4v202 ,
	VA = 0x00000a860000 ,/* 0x00000a86ffc0 */
	RA = 0x0424650000 ,
	PA = 0x0424650000 ,
	TTE_Context = 0x03ce ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v202_data_begin
Thr4_User_Data_4v202_data_begin:
Thr4_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v302 DATA_VA=0x0000238000
attr_data {
	Name = .Thr4_User_Data_4v302 ,
	VA = 0x000000238000 ,/* 0x000000239fc0 */
	RA = 0x04000dc000 ,
	PA = 0x04000dc000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr4_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v302_data_begin
Thr4_User_Data_4v302_data_begin:
Thr4_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v003 TEXT_VA=0x0000240000
attr_text {
	Name = .Thr4_User_Text_4v003 ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x000000240000 ,/* 0x000000241fc0 */
	RA = 0x0400098000 ,
	PA = 0x0400098000 ,
	TTE_Context = 0x0c8a ,/* TEXT_PRIMARY */
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
	end_label   = Thr4_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v003_text_begin
Thr4_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v103 DATA_VA=0x00003fe000
attr_data {
	Name = .Thr4_User_Data_4v103 ,
	VA = 0x0000003fe000 ,/* 0x0000003fffc0 */
	RA = 0x040014a000 ,
	PA = 0x040014a000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr4_User_Data_4v203 DATA_VA=0x00002bc000
attr_data {
	Name = .Thr4_User_Data_4v203 ,
	VA = 0x0000002bc000 ,/* 0x0000002bdfc0 */
	RA = 0x040019a000 ,
	PA = 0x040019a000 ,
	TTE_Context = 0x03ce ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr4_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v203_data_begin
Thr4_User_Data_4v203_data_begin:
Thr4_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v004 TEXT_VA=0x01dc000000
attr_text {
	Name = .Thr4_User_Text_4v004 ,
	thr4_nz_ctx_tsb_3 ,
	VA = 0x0001dc000000 ,/* 0x0001dc3fffc0 */
	RA = 0x00d8c00000 ,
	PA = 0x04f8c00000 ,
	TTE_Context = 0x0c8a ,/* TEXT_PRIMARY */
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
	TTE_Size    = 3 ,
	end_label   = Thr4_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v004_text_begin
Thr4_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v104 DATA_VA=0x0f90000000
attr_data {
	Name = .Thr4_User_Data_4v104 ,
	VA = 0x000f90000000 ,/* 0x000f9fffffc0 */
	RA = 0x1f40000000 ,
	PA = 0x2370000000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr4_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v104_data_begin
Thr4_User_Data_4v104_data_begin:
Thr4_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v005 TEXT_VA=0x0000252000
attr_text {
	Name = .Thr4_User_Text_4v005 ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x000000252000 ,/* 0x000000253fc0 */
	RA = 0x04000fc000 ,
	PA = 0x04000fc000 ,
	TTE_Context = 0x0c8a ,/* TEXT_PRIMARY */
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
	end_label   = Thr4_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v005_text_begin
Thr4_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v105 DATA_VA=0x0000272000
attr_data {
	Name = .Thr4_User_Data_4v105 ,
	VA = 0x000000272000 ,/* 0x000000273fc0 */
	RA = 0x0400002000 ,
	PA = 0x0400002000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr4_User_Text_4v006 TEXT_VA=0x000a0b0000
attr_text {
	Name = .Thr4_User_Text_4v006 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x00000a0b0000 ,/* 0x00000a0bffc0 */
	RA = 0x0424220000 ,
	PA = 0x0424220000 ,
	TTE_Context = 0x0c8a ,/* TEXT_PRIMARY */
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
SECTION .Thr4_User_Data_4v106 DATA_VA=0x000031a000
attr_data {
	Name = .Thr4_User_Data_4v106 ,
	VA = 0x00000031a000 ,/* 0x00000031bfc0 */
	RA = 0x04001f4000 ,
	PA = 0x04001f4000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr4_User_Text_4v007 TEXT_VA=0x0fa0000000
attr_text {
	Name = .Thr4_User_Text_4v007 ,
	thr4_nz_ctx_tsb_0 ,
	VA = 0x000fa0000000 ,/* 0x000fafffffc0 */
	RA = 0x1ea0000000 ,
	PA = 0x22d0000000 ,
	TTE_Context = 0x0c8a ,/* TEXT_PRIMARY */
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
	TTE_Size    = 5 ,
	end_label   = Thr4_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v007_text_begin
Thr4_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v107 DATA_VA=0x01e5000000
attr_data {
	Name = .Thr4_User_Data_4v107 ,
	VA = 0x0001e5000000 ,/* 0x0001e53fffc0 */
	RA = 0x00cd400000 ,
	PA = 0x04ed400000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr4_User_Text_4v008 TEXT_VA=0x000031e000
attr_text {
	Name = .Thr4_User_Text_4v008 ,
	thr4_nz_ctx_tsb_1 ,
	VA = 0x00000031e000 ,/* 0x00000031ffc0 */
	RA = 0x04000ca000 ,
	PA = 0x04000ca000 ,
	TTE_Context = 0x0c8a ,/* TEXT_PRIMARY */
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
	end_label   = Thr4_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v008_text_begin
Thr4_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v108 DATA_VA=0x00002b0000
attr_data {
	Name = .Thr4_User_Data_4v108 ,
	VA = 0x0000002b0000 ,/* 0x0000002b1fc0 */
	RA = 0x04000e4000 ,
	PA = 0x04000e4000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr4_User_Text_4v009 TEXT_VA=0x000a060000
attr_text {
	Name = .Thr4_User_Text_4v009 ,
	thr4_nz_ctx_tsb_2 ,
	VA = 0x00000a060000 ,/* 0x00000a06ffc0 */
	RA = 0x04244e0000 ,
	PA = 0x04244e0000 ,
	TTE_Context = 0x0c8a ,/* TEXT_PRIMARY */
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
SECTION .Thr4_User_Data_4v109 DATA_VA=0x000a940000
attr_data {
	Name = .Thr4_User_Data_4v109 ,
	VA = 0x00000a940000 ,/* 0x00000a94ffc0 */
	RA = 0x0424de0000 ,
	PA = 0x0424de0000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr4_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v109_data_begin
Thr4_User_Data_4v109_data_begin:
Thr4_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v10a DATA_VA=0x00002b6000
attr_data {
	Name = .Thr4_User_Data_4v10a ,
	VA = 0x0000002b6000 ,/* 0x0000002b7fc0 */
	RA = 0x04001c8000 ,
	PA = 0x04001c8000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
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
SECTION .Thr4_User_Data_4v10b DATA_VA=0x01c7800000
attr_data {
	Name = .Thr4_User_Data_4v10b ,
	VA = 0x0001c7800000 ,/* 0x0001c7bfffc0 */
	RA = 0x00f4400000 ,
	PA = 0x0514400000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr4_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v10b_data_begin
Thr4_User_Data_4v10b_data_begin:
Thr4_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v10c DATA_VA=0x00003ce000
attr_data {
	Name = .Thr4_User_Data_4v10c ,
	VA = 0x0000003ce000 ,/* 0x0000003cffc0 */
	RA = 0x04001b4000 ,
	PA = 0x04001b4000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr4_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v10c_data_begin
Thr4_User_Data_4v10c_data_begin:
Thr4_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v10d DATA_VA=0x01fe000000
attr_data {
	Name = .Thr4_User_Data_4v10d ,
	VA = 0x0001fe000000 ,/* 0x0001fe3fffc0 */
	RA = 0x00d4000000 ,
	PA = 0x04f4000000 ,
	TTE_Context = 0x0c8a ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 0 ,
	TTE_EP      = 0 ,
	TTE_W       = 1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	end_label   = Thr4_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v10d_data_begin
Thr4_User_Data_4v10d_data_begin:
Thr4_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x01c1800000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x0001c1800000 ,/* 0x0001c1bfffc0 */
	RA = 0x00e7800000 ,
	PA = 0x0607800000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
SECTION .Thr5_User_Data_4v100 DATA_VA=0x00003e2000
attr_data {
	Name = .Thr5_User_Data_4v100 ,
	VA = 0x0000003e2000 ,/* 0x0000003e3fc0 */
	RA = 0x00000c6000 ,
	PA = 0x05000c6000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v100_data_begin
Thr5_User_Data_4v100_data_begin:
Thr5_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v200 DATA_VA=0x000a2e0000
attr_data {
	Name = .Thr5_User_Data_4v200 ,
	VA = 0x00000a2e0000 ,/* 0x00000a2effc0 */
	RA = 0x0524fc0000 ,
	PA = 0x0524fc0000 ,
	TTE_Context = 0x17b5 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v200_data_begin
Thr5_User_Data_4v200_data_begin:
Thr5_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v300 DATA_VA=0x0000396000
attr_data {
	Name = .Thr5_User_Data_4v300 ,
	VA = 0x000000396000 ,/* 0x000000397fc0 */
	RA = 0x00001d8000 ,
	PA = 0x05001d8000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_1 ,
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
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	end_label   = Thr5_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v300_data_begin
Thr5_User_Data_4v300_data_begin:
Thr5_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v001 TEXT_VA=0x000ac20000
attr_text {
	Name = .Thr5_User_Text_4v001 ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x00000ac20000 ,/* 0x00000ac2ffc0 */
	RA = 0x0524030000 ,
	PA = 0x0524030000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v001_text_begin
Thr5_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v101 DATA_VA=0x000a580000
attr_data {
	Name = .Thr5_User_Data_4v101 ,
	VA = 0x00000a580000 ,/* 0x00000a58ffc0 */
	RA = 0x0524860000 ,
	PA = 0x0524860000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr5_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v101_data_begin
Thr5_User_Data_4v101_data_begin:
Thr5_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v201 DATA_VA=0x00003c2000
attr_data {
	Name = .Thr5_User_Data_4v201 ,
	VA = 0x0000003c2000 ,/* 0x0000003c3fc0 */
	RA = 0x0000096000 ,
	PA = 0x0500096000 ,
	TTE_Context = 0x17b5 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v201_data_begin
Thr5_User_Data_4v201_data_begin:
Thr5_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v301 DATA_VA=0x0cb0000000
attr_data {
	Name = .Thr5_User_Data_4v301 ,
	VA = 0x000cb0000000 ,/* 0x000cbfffffc0 */
	RA = 0x23e0000000 ,
	PA = 0x23e0000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_0 ,
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
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	end_label   = Thr5_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v301_data_begin
Thr5_User_Data_4v301_data_begin:
Thr5_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v002 TEXT_VA=0x000ad70000
attr_text {
	Name = .Thr5_User_Text_4v002 ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x00000ad70000 ,/* 0x00000ad7ffc0 */
	RA = 0x0524570000 ,
	PA = 0x0524570000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v002_text_begin
Thr5_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v102 DATA_VA=0x000035e000
attr_data {
	Name = .Thr5_User_Data_4v102 ,
	VA = 0x00000035e000 ,/* 0x00000035ffc0 */
	RA = 0x0000186000 ,
	PA = 0x0500186000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v102_data_begin
Thr5_User_Data_4v102_data_begin:
Thr5_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v003 TEXT_VA=0x000a080000
attr_text {
	Name = .Thr5_User_Text_4v003 ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x00000a080000 ,/* 0x00000a08ffc0 */
	RA = 0x0524db0000 ,
	PA = 0x0524db0000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v003_text_begin
Thr5_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v103 DATA_VA=0x000a3a0000
attr_data {
	Name = .Thr5_User_Data_4v103 ,
	VA = 0x00000a3a0000 ,/* 0x00000a3affc0 */
	RA = 0x0524980000 ,
	PA = 0x0524980000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr5_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v103_data_begin
Thr5_User_Data_4v103_data_begin:
Thr5_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v004 TEXT_VA=0x0000212000
attr_text {
	Name = .Thr5_User_Text_4v004 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x000000212000 ,/* 0x000000213fc0 */
	RA = 0x0000074000 ,
	PA = 0x0500074000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v004_text_begin
Thr5_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v104 DATA_VA=0x0c50000000
attr_data {
	Name = .Thr5_User_Data_4v104 ,
	VA = 0x000c50000000 ,/* 0x000c5fffffc0 */
	RA = 0x2450000000 ,
	PA = 0x2450000000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v104_data_begin
Thr5_User_Data_4v104_data_begin:
Thr5_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v005 TEXT_VA=0x01c3800000
attr_text {
	Name = .Thr5_User_Text_4v005 ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x0001c3800000 ,/* 0x0001c3bfffc0 */
	RA = 0x00eec00000 ,
	PA = 0x060ec00000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v005_text_begin
Thr5_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v105 DATA_VA=0x000ae10000
attr_data {
	Name = .Thr5_User_Data_4v105 ,
	VA = 0x00000ae10000 ,/* 0x00000ae1ffc0 */
	RA = 0x0524460000 ,
	PA = 0x0524460000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr5_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v105_data_begin
Thr5_User_Data_4v105_data_begin:
Thr5_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v006 TEXT_VA=0x01dc400000
attr_text {
	Name = .Thr5_User_Text_4v006 ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x0001dc400000 ,/* 0x0001dc7fffc0 */
	RA = 0x00e0c00000 ,
	PA = 0x0600c00000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v006_text_begin
Thr5_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v106 DATA_VA=0x00002c4000
attr_data {
	Name = .Thr5_User_Data_4v106 ,
	VA = 0x0000002c4000 ,/* 0x0000002c5fc0 */
	RA = 0x0000144000 ,
	PA = 0x0500144000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v106_data_begin
Thr5_User_Data_4v106_data_begin:
Thr5_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v007 TEXT_VA=0x00002fa000
attr_text {
	Name = .Thr5_User_Text_4v007 ,
	thr5_nz_ctx_tsb_0 ,
	VA = 0x0000002fa000 ,/* 0x0000002fbfc0 */
	RA = 0x000003c000 ,
	PA = 0x050003c000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v007_text_begin
Thr5_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v107 DATA_VA=0x01e4800000
attr_data {
	Name = .Thr5_User_Data_4v107 ,
	VA = 0x0001e4800000 ,/* 0x0001e4bfffc0 */
	RA = 0x00f7400000 ,
	PA = 0x0617400000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v107_data_begin
Thr5_User_Data_4v107_data_begin:
Thr5_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v008 TEXT_VA=0x0ea0000000
attr_text {
	Name = .Thr5_User_Text_4v008 ,
	thr5_nz_ctx_tsb_3 ,
	VA = 0x000ea0000000 ,/* 0x000eafffffc0 */
	RA = 0x2230000000 ,
	PA = 0x2230000000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v008_text_begin
Thr5_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v108 DATA_VA=0x00003e6000
attr_data {
	Name = .Thr5_User_Data_4v108 ,
	VA = 0x0000003e6000 ,/* 0x0000003e7fc0 */
	RA = 0x0000052000 ,
	PA = 0x0500052000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v108_data_begin
Thr5_User_Data_4v108_data_begin:
Thr5_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v009 TEXT_VA=0x000aea0000
attr_text {
	Name = .Thr5_User_Text_4v009 ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x00000aea0000 ,/* 0x00000aeaffc0 */
	RA = 0x0524130000 ,
	PA = 0x0524130000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v009_text_begin
Thr5_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v109 DATA_VA=0x0d20000000
attr_data {
	Name = .Thr5_User_Data_4v109 ,
	VA = 0x000d20000000 ,/* 0x000d2fffffc0 */
	RA = 0x2290000000 ,
	PA = 0x2290000000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v109_data_begin
Thr5_User_Data_4v109_data_begin:
Thr5_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00a TEXT_VA=0x000abb0000
attr_text {
	Name = .Thr5_User_Text_4v00a ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x00000abb0000 ,/* 0x00000abbffc0 */
	RA = 0x0524140000 ,
	PA = 0x0524140000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00a_text_begin
Thr5_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10a DATA_VA=0x0000202000
attr_data {
	Name = .Thr5_User_Data_4v10a ,
	VA = 0x000000202000 ,/* 0x000000203fc0 */
	RA = 0x00000d2000 ,
	PA = 0x05000d2000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10a_data_begin
Thr5_User_Data_4v10a_data_begin:
Thr5_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00b TEXT_VA=0x000a290000
attr_text {
	Name = .Thr5_User_Text_4v00b ,
	thr5_nz_ctx_tsb_1 ,
	VA = 0x00000a290000 ,/* 0x00000a29ffc0 */
	RA = 0x0524370000 ,
	PA = 0x0524370000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00b_text_begin
Thr5_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10b DATA_VA=0x00003a2000
attr_data {
	Name = .Thr5_User_Data_4v10b ,
	VA = 0x0000003a2000 ,/* 0x0000003a3fc0 */
	RA = 0x000016e000 ,
	PA = 0x050016e000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10b_data_begin
Thr5_User_Data_4v10b_data_begin:
Thr5_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00c TEXT_VA=0x01fb000000
attr_text {
	Name = .Thr5_User_Text_4v00c ,
	thr5_nz_ctx_tsb_2 ,
	VA = 0x0001fb000000 ,/* 0x0001fb3fffc0 */
	RA = 0x00fe400000 ,
	PA = 0x061e400000 ,
	TTE_Context = 0x0905 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00c_text_begin
Thr5_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10c DATA_VA=0x000a850000
attr_data {
	Name = .Thr5_User_Data_4v10c ,
	VA = 0x00000a850000 ,/* 0x00000a85ffc0 */
	RA = 0x05241c0000 ,
	PA = 0x05241c0000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr5_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10c_data_begin
Thr5_User_Data_4v10c_data_begin:
Thr5_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10d DATA_VA=0x000acc0000
attr_data {
	Name = .Thr5_User_Data_4v10d ,
	VA = 0x00000acc0000 ,/* 0x00000accffc0 */
	RA = 0x0524c80000 ,
	PA = 0x0524c80000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr5_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10d_data_begin
Thr5_User_Data_4v10d_data_begin:
Thr5_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10e DATA_VA=0x01f4000000
attr_data {
	Name = .Thr5_User_Data_4v10e ,
	VA = 0x0001f4000000 ,/* 0x0001f43fffc0 */
	RA = 0x00dd800000 ,
	PA = 0x05fd800000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10e_data_begin
Thr5_User_Data_4v10e_data_begin:
Thr5_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10f DATA_VA=0x000afa0000
attr_data {
	Name = .Thr5_User_Data_4v10f ,
	VA = 0x00000afa0000 ,/* 0x00000afaffc0 */
	RA = 0x0524ea0000 ,
	PA = 0x0524ea0000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr5_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10f_data_begin
Thr5_User_Data_4v10f_data_begin:
Thr5_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v110 DATA_VA=0x000034a000
attr_data {
	Name = .Thr5_User_Data_4v110 ,
	VA = 0x00000034a000 ,/* 0x00000034bfc0 */
	RA = 0x0000026000 ,
	PA = 0x0500026000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v110_data_begin
Thr5_User_Data_4v110_data_begin:
Thr5_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v111 DATA_VA=0x00003fc000
attr_data {
	Name = .Thr5_User_Data_4v111 ,
	VA = 0x0000003fc000 ,/* 0x0000003fdfc0 */
	RA = 0x00000e0000 ,
	PA = 0x05000e0000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr5_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v111_data_begin
Thr5_User_Data_4v111_data_begin:
Thr5_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v112 DATA_VA=0x000a430000
attr_data {
	Name = .Thr5_User_Data_4v112 ,
	VA = 0x00000a430000 ,/* 0x00000a43ffc0 */
	RA = 0x0524770000 ,
	PA = 0x0524770000 ,
	TTE_Context = 0x0905 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr5_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v112_data_begin
Thr5_User_Data_4v112_data_begin:
Thr5_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v000 TEXT_VA=0x0000398000
attr_text {
	Name = .Thr6_User_Text_4v000 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x000000398000 ,/* 0x000000399fc0 */
	RA = 0x060001a000 ,
	PA = 0x060001a000 ,
	TTE_Context = 0x125d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr6_user_code_entry
Thr6_user_code_entry:
.global Thr6_User_Text_4v000_text_begin
Thr6_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v100 DATA_VA=0x000afd0000
attr_data {
	Name = .Thr6_User_Data_4v100 ,
	VA = 0x00000afd0000 ,/* 0x00000afdffc0 */
	RA = 0x0014e30000 ,
	PA = 0x0624e30000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v100_data_begin
Thr6_User_Data_4v100_data_begin:
Thr6_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v200 DATA_VA=0x01ff000000
attr_data {
	Name = .Thr6_User_Data_4v200 ,
	VA = 0x0001ff000000 ,/* 0x0001ff3fffc0 */
	RA = 0x00d9c00000 ,
	PA = 0x06f9c00000 ,
	TTE_Context = 0x1340 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v200_data_begin
Thr6_User_Data_4v200_data_begin:
Thr6_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v300 DATA_VA=0x000ad30000
attr_data {
	Name = .Thr6_User_Data_4v300 ,
	VA = 0x00000ad30000 ,/* 0x00000ad3ffc0 */
	RA = 0x0014f60000 ,
	PA = 0x0624f60000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr6_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v300_data_begin
Thr6_User_Data_4v300_data_begin:
Thr6_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v001 TEXT_VA=0x000af40000
attr_text {
	Name = .Thr6_User_Text_4v001 ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x00000af40000 ,/* 0x00000af4ffc0 */
	RA = 0x0014830000 ,
	PA = 0x0624830000 ,
	TTE_Context = 0x125d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v001_text_begin
Thr6_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v101 DATA_VA=0x0000342000
attr_data {
	Name = .Thr6_User_Data_4v101 ,
	VA = 0x000000342000 ,/* 0x000000343fc0 */
	RA = 0x06001ce000 ,
	PA = 0x06001ce000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v101_data_begin
Thr6_User_Data_4v101_data_begin:
Thr6_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v201 DATA_VA=0x000a690000
attr_data {
	Name = .Thr6_User_Data_4v201 ,
	VA = 0x00000a690000 ,/* 0x00000a69ffc0 */
	RA = 0x0014b30000 ,
	PA = 0x0624b30000 ,
	TTE_Context = 0x1340 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr6_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v201_data_begin
Thr6_User_Data_4v201_data_begin:
Thr6_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v301 DATA_VA=0x0000278000
attr_data {
	Name = .Thr6_User_Data_4v301 ,
	VA = 0x000000278000 ,/* 0x000000279fc0 */
	RA = 0x0600034000 ,
	PA = 0x0600034000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v301_data_begin
Thr6_User_Data_4v301_data_begin:
Thr6_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v002 TEXT_VA=0x000a010000
attr_text {
	Name = .Thr6_User_Text_4v002 ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x00000a010000 ,/* 0x00000a01ffc0 */
	RA = 0x0014aa0000 ,
	PA = 0x0624aa0000 ,
	TTE_Context = 0x125d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v002_text_begin
Thr6_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v102 DATA_VA=0x0db0000000
attr_data {
	Name = .Thr6_User_Data_4v102 ,
	VA = 0x000db0000000 ,/* 0x000dbfffffc0 */
	RA = 0x25a0000000 ,
	PA = 0x25a0000000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 5 ,
	end_label   = Thr6_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v102_data_begin
Thr6_User_Data_4v102_data_begin:
Thr6_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v202 DATA_VA=0x00002be000
attr_data {
	Name = .Thr6_User_Data_4v202 ,
	VA = 0x0000002be000 ,/* 0x0000002bffc0 */
	RA = 0x060003a000 ,
	PA = 0x060003a000 ,
	TTE_Context = 0x1340 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v202_data_begin
Thr6_User_Data_4v202_data_begin:
Thr6_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v302 DATA_VA=0x00002c8000
attr_data {
	Name = .Thr6_User_Data_4v302 ,
	VA = 0x0000002c8000 ,/* 0x0000002c9fc0 */
	RA = 0x060000a000 ,
	PA = 0x060000a000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v302_data_begin
Thr6_User_Data_4v302_data_begin:
Thr6_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v003 TEXT_VA=0x000ab70000
attr_text {
	Name = .Thr6_User_Text_4v003 ,
	thr6_nz_ctx_tsb_3 ,
	VA = 0x00000ab70000 ,/* 0x00000ab7ffc0 */
	RA = 0x0014be0000 ,
	PA = 0x0624be0000 ,
	TTE_Context = 0x125d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v003_text_begin
Thr6_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v103 DATA_VA=0x000021a000
attr_data {
	Name = .Thr6_User_Data_4v103 ,
	VA = 0x00000021a000 ,/* 0x00000021bfc0 */
	RA = 0x0600064000 ,
	PA = 0x0600064000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v103_data_begin
Thr6_User_Data_4v103_data_begin:
Thr6_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v203 DATA_VA=0x01d6800000
attr_data {
	Name = .Thr6_User_Data_4v203 ,
	VA = 0x0001d6800000 ,/* 0x0001d6bfffc0 */
	RA = 0x00ee000000 ,
	PA = 0x070e000000 ,
	TTE_Context = 0x1340 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v203_data_begin
Thr6_User_Data_4v203_data_begin:
Thr6_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v004 TEXT_VA=0x00002a0000
attr_text {
	Name = .Thr6_User_Text_4v004 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x0000002a0000 ,/* 0x0000002a1fc0 */
	RA = 0x060005c000 ,
	PA = 0x060005c000 ,
	TTE_Context = 0x125d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v004_text_begin
Thr6_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v104 DATA_VA=0x01e6000000
attr_data {
	Name = .Thr6_User_Data_4v104 ,
	VA = 0x0001e6000000 ,/* 0x0001e63fffc0 */
	RA = 0x00d1800000 ,
	PA = 0x06f1800000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v104_data_begin
Thr6_User_Data_4v104_data_begin:
Thr6_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v005 TEXT_VA=0x0fd0000000
attr_text {
	Name = .Thr6_User_Text_4v005 ,
	thr6_nz_ctx_tsb_1 ,
	VA = 0x000fd0000000 ,/* 0x000fdfffffc0 */
	RA = 0x2340000000 ,
	PA = 0x2340000000 ,
	TTE_Context = 0x125d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 5 ,
	end_label   = Thr6_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v005_text_begin
Thr6_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v105 DATA_VA=0x000ae30000
attr_data {
	Name = .Thr6_User_Data_4v105 ,
	VA = 0x00000ae30000 ,/* 0x00000ae3ffc0 */
	RA = 0x00141d0000 ,
	PA = 0x06241d0000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v105_data_begin
Thr6_User_Data_4v105_data_begin:
Thr6_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v006 TEXT_VA=0x000029e000
attr_text {
	Name = .Thr6_User_Text_4v006 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x00000029e000 ,/* 0x00000029ffc0 */
	RA = 0x06001f6000 ,
	PA = 0x06001f6000 ,
	TTE_Context = 0x125d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v006_text_begin
Thr6_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v106 DATA_VA=0x000a930000
attr_data {
	Name = .Thr6_User_Data_4v106 ,
	VA = 0x00000a930000 ,/* 0x00000a93ffc0 */
	RA = 0x0014150000 ,
	PA = 0x0624150000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v106_data_begin
Thr6_User_Data_4v106_data_begin:
Thr6_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v007 TEXT_VA=0x0f10000000
attr_text {
	Name = .Thr6_User_Text_4v007 ,
	thr6_nz_ctx_tsb_1 ,
	VA = 0x000f10000000 ,/* 0x000f1fffffc0 */
	RA = 0x2500000000 ,
	PA = 0x2500000000 ,
	TTE_Context = 0x125d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 5 ,
	end_label   = Thr6_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v007_text_begin
Thr6_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v107 DATA_VA=0x000acf0000
attr_data {
	Name = .Thr6_User_Data_4v107 ,
	VA = 0x00000acf0000 ,/* 0x00000acfffc0 */
	RA = 0x0014cc0000 ,
	PA = 0x0624cc0000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v107_data_begin
Thr6_User_Data_4v107_data_begin:
Thr6_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v008 TEXT_VA=0x0000362000
attr_text {
	Name = .Thr6_User_Text_4v008 ,
	thr6_nz_ctx_tsb_2 ,
	VA = 0x000000362000 ,/* 0x000000363fc0 */
	RA = 0x0600190000 ,
	PA = 0x0600190000 ,
	TTE_Context = 0x125d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v008_text_begin
Thr6_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v108 DATA_VA=0x000a2f0000
attr_data {
	Name = .Thr6_User_Data_4v108 ,
	VA = 0x00000a2f0000 ,/* 0x00000a2fffc0 */
	RA = 0x0014960000 ,
	PA = 0x0624960000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v108_data_begin
Thr6_User_Data_4v108_data_begin:
Thr6_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v009 TEXT_VA=0x01d1000000
attr_text {
	Name = .Thr6_User_Text_4v009 ,
	thr6_nz_ctx_tsb_0 ,
	VA = 0x0001d1000000 ,/* 0x0001d13fffc0 */
	RA = 0x00ed400000 ,
	PA = 0x070d400000 ,
	TTE_Context = 0x125d ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v009_text_begin
Thr6_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v109 DATA_VA=0x00003ae000
attr_data {
	Name = .Thr6_User_Data_4v109 ,
	VA = 0x0000003ae000 ,/* 0x0000003affc0 */
	RA = 0x06000e6000 ,
	PA = 0x06000e6000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v109_data_begin
Thr6_User_Data_4v109_data_begin:
Thr6_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10a DATA_VA=0x0000268000
attr_data {
	Name = .Thr6_User_Data_4v10a ,
	VA = 0x000000268000 ,/* 0x000000269fc0 */
	RA = 0x06000b0000 ,
	PA = 0x06000b0000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10a_data_begin
Thr6_User_Data_4v10a_data_begin:
Thr6_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10b DATA_VA=0x000a670000
attr_data {
	Name = .Thr6_User_Data_4v10b ,
	VA = 0x00000a670000 ,/* 0x00000a67ffc0 */
	RA = 0x0014fa0000 ,
	PA = 0x0624fa0000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10b_data_begin
Thr6_User_Data_4v10b_data_begin:
Thr6_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10c DATA_VA=0x000aa60000
attr_data {
	Name = .Thr6_User_Data_4v10c ,
	VA = 0x00000aa60000 ,/* 0x00000aa6ffc0 */
	RA = 0x0014680000 ,
	PA = 0x0624680000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10c_data_begin
Thr6_User_Data_4v10c_data_begin:
Thr6_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10d DATA_VA=0x00002d8000
attr_data {
	Name = .Thr6_User_Data_4v10d ,
	VA = 0x0000002d8000 ,/* 0x0000002d9fc0 */
	RA = 0x0600028000 ,
	PA = 0x0600028000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10d_data_begin
Thr6_User_Data_4v10d_data_begin:
Thr6_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10e DATA_VA=0x0e80000000
attr_data {
	Name = .Thr6_User_Data_4v10e ,
	VA = 0x000e80000000 ,/* 0x000e8fffffc0 */
	RA = 0x2470000000 ,
	PA = 0x2470000000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 5 ,
	end_label   = Thr6_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10e_data_begin
Thr6_User_Data_4v10e_data_begin:
Thr6_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10f DATA_VA=0x00003a4000
attr_data {
	Name = .Thr6_User_Data_4v10f ,
	VA = 0x0000003a4000 ,/* 0x0000003a5fc0 */
	RA = 0x06001ba000 ,
	PA = 0x06001ba000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10f_data_begin
Thr6_User_Data_4v10f_data_begin:
Thr6_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v110 DATA_VA=0x01e9000000
attr_data {
	Name = .Thr6_User_Data_4v110 ,
	VA = 0x0001e9000000 ,/* 0x0001e93fffc0 */
	RA = 0x00cb400000 ,
	PA = 0x06eb400000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v110_data_begin
Thr6_User_Data_4v110_data_begin:
Thr6_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v111 DATA_VA=0x000a9f0000
attr_data {
	Name = .Thr6_User_Data_4v111 ,
	VA = 0x00000a9f0000 ,/* 0x00000a9fffc0 */
	RA = 0x00149d0000 ,
	PA = 0x06249d0000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v111_data_begin
Thr6_User_Data_4v111_data_begin:
Thr6_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v112 DATA_VA=0x000ab00000
attr_data {
	Name = .Thr6_User_Data_4v112 ,
	VA = 0x00000ab00000 ,/* 0x00000ab0ffc0 */
	RA = 0x0014970000 ,
	PA = 0x0624970000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v112_data_begin
Thr6_User_Data_4v112_data_begin:
Thr6_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v113 DATA_VA=0x000ab50000
attr_data {
	Name = .Thr6_User_Data_4v113 ,
	VA = 0x00000ab50000 ,/* 0x00000ab5ffc0 */
	RA = 0x0014340000 ,
	PA = 0x0624340000 ,
	TTE_Context = 0x125d ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr6_User_Data_4v113_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v113_data_begin
Thr6_User_Data_4v113_data_begin:
Thr6_User_Data_4v113_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x01fcc00000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	thr7_nz_ctx_tsb_0 ,
	VA = 0x0001fcc00000 ,/* 0x0001fcffffc0 */
	RA = 0x00ef400000 ,
	PA = 0x080f400000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	TTE_Size    = 3 ,
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
SECTION .Thr7_User_Data_4v100 DATA_VA=0x000032a000
attr_data {
	Name = .Thr7_User_Data_4v100 ,
	VA = 0x00000032a000 ,/* 0x00000032bfc0 */
	RA = 0x0700056000 ,
	PA = 0x0700056000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v100_data_begin
Thr7_User_Data_4v100_data_begin:
Thr7_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v200 DATA_VA=0x01e1400000
attr_data {
	Name = .Thr7_User_Data_4v200 ,
	VA = 0x0001e1400000 ,/* 0x0001e17fffc0 */
	RA = 0x00c9000000 ,
	PA = 0x07e9000000 ,
	TTE_Context = 0x0afb ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr7_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v200_data_begin
Thr7_User_Data_4v200_data_begin:
Thr7_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v300 DATA_VA=0x000a630000
attr_data {
	Name = .Thr7_User_Data_4v300 ,
	VA = 0x00000a630000 ,/* 0x00000a63ffc0 */
	RA = 0x0014800000 ,
	PA = 0x0724800000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr7_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v300_data_begin
Thr7_User_Data_4v300_data_begin:
Thr7_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v001 TEXT_VA=0x00003f0000
attr_text {
	Name = .Thr7_User_Text_4v001 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x0000003f0000 ,/* 0x0000003f1fc0 */
	RA = 0x0700146000 ,
	PA = 0x0700146000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	end_label   = Thr7_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v001_text_begin
Thr7_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v101 DATA_VA=0x01c1400000
attr_data {
	Name = .Thr7_User_Data_4v101 ,
	VA = 0x0001c1400000 ,/* 0x0001c17fffc0 */
	RA = 0x00fc000000 ,
	PA = 0x081c000000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr7_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v101_data_begin
Thr7_User_Data_4v101_data_begin:
Thr7_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v201 DATA_VA=0x000a7a0000
attr_data {
	Name = .Thr7_User_Data_4v201 ,
	VA = 0x00000a7a0000 ,/* 0x00000a7affc0 */
	RA = 0x00141f0000 ,
	PA = 0x07241f0000 ,
	TTE_Context = 0x0afb ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr7_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v201_data_begin
Thr7_User_Data_4v201_data_begin:
Thr7_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v301 DATA_VA=0x000a7d0000
attr_data {
	Name = .Thr7_User_Data_4v301 ,
	VA = 0x00000a7d0000 ,/* 0x00000a7dffc0 */
	RA = 0x00140c0000 ,
	PA = 0x07240c0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr7_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v301_data_begin
Thr7_User_Data_4v301_data_begin:
Thr7_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v002 TEXT_VA=0x000a6e0000
attr_text {
	Name = .Thr7_User_Text_4v002 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x00000a6e0000 ,/* 0x00000a6effc0 */
	RA = 0x0014160000 ,
	PA = 0x0724160000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr7_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v002_text_begin
Thr7_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v102 DATA_VA=0x01ca800000
attr_data {
	Name = .Thr7_User_Data_4v102 ,
	VA = 0x0001ca800000 ,/* 0x0001cabfffc0 */
	RA = 0x00fb000000 ,
	PA = 0x081b000000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr7_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v102_data_begin
Thr7_User_Data_4v102_data_begin:
Thr7_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v202 DATA_VA=0x0000354000
attr_data {
	Name = .Thr7_User_Data_4v202 ,
	VA = 0x000000354000 ,/* 0x000000355fc0 */
	RA = 0x0700140000 ,
	PA = 0x0700140000 ,
	TTE_Context = 0x0afb ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v202_data_begin
Thr7_User_Data_4v202_data_begin:
Thr7_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v302 DATA_VA=0x000ab60000
attr_data {
	Name = .Thr7_User_Data_4v302 ,
	VA = 0x00000ab60000 ,/* 0x00000ab6ffc0 */
	RA = 0x0014f00000 ,
	PA = 0x0724f00000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr7_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v302_data_begin
Thr7_User_Data_4v302_data_begin:
Thr7_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v003 TEXT_VA=0x01fe800000
attr_text {
	Name = .Thr7_User_Text_4v003 ,
	thr7_nz_ctx_tsb_0 ,
	VA = 0x0001fe800000 ,/* 0x0001febfffc0 */
	RA = 0x00d3800000 ,
	PA = 0x07f3800000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
SECTION .Thr7_User_Data_4v103 DATA_VA=0x000a5a0000
attr_data {
	Name = .Thr7_User_Data_4v103 ,
	VA = 0x00000a5a0000 ,/* 0x00000a5affc0 */
	RA = 0x0014ed0000 ,
	PA = 0x0724ed0000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr7_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v103_data_begin
Thr7_User_Data_4v103_data_begin:
Thr7_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v303 DATA_VA=0x000a6a0000
attr_data {
	Name = .Thr7_User_Data_4v303 ,
	VA = 0x00000a6a0000 ,/* 0x00000a6affc0 */
	RA = 0x0014300000 ,
	PA = 0x0724300000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr7_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v303_data_begin
Thr7_User_Data_4v303_data_begin:
Thr7_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v004 TEXT_VA=0x01d3c00000
attr_text {
	Name = .Thr7_User_Text_4v004 ,
	thr7_nz_ctx_tsb_0 ,
	VA = 0x0001d3c00000 ,/* 0x0001d3ffffc0 */
	RA = 0x00c0000000 ,
	PA = 0x07e0000000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v004_text_begin
Thr7_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v104 DATA_VA=0x00003d4000
attr_data {
	Name = .Thr7_User_Data_4v104 ,
	VA = 0x0000003d4000 ,/* 0x0000003d5fc0 */
	RA = 0x07000aa000 ,
	PA = 0x07000aa000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v104_data_begin
Thr7_User_Data_4v104_data_begin:
Thr7_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v304 DATA_VA=0x00003b8000
attr_data {
	Name = .Thr7_User_Data_4v304 ,
	VA = 0x0000003b8000 ,/* 0x0000003b9fc0 */
	RA = 0x070004a000 ,
	PA = 0x070004a000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0 ,
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
	end_label   = Thr7_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v304_data_begin
Thr7_User_Data_4v304_data_begin:
Thr7_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v005 TEXT_VA=0x000029a000
attr_text {
	Name = .Thr7_User_Text_4v005 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x00000029a000 ,/* 0x00000029bfc0 */
	RA = 0x0700048000 ,
	PA = 0x0700048000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	end_label   = Thr7_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v005_text_begin
Thr7_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v105 DATA_VA=0x000add0000
attr_data {
	Name = .Thr7_User_Data_4v105 ,
	VA = 0x00000add0000 ,/* 0x00000addffc0 */
	RA = 0x0014bb0000 ,
	PA = 0x0724bb0000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr7_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v105_data_begin
Thr7_User_Data_4v105_data_begin:
Thr7_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v006 TEXT_VA=0x000aec0000
attr_text {
	Name = .Thr7_User_Text_4v006 ,
	thr7_nz_ctx_tsb_3 ,
	VA = 0x00000aec0000 ,/* 0x00000aecffc0 */
	RA = 0x00148e0000 ,
	PA = 0x07248e0000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr7_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v006_text_begin
Thr7_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v106 DATA_VA=0x00003d2000
attr_data {
	Name = .Thr7_User_Data_4v106 ,
	VA = 0x0000003d2000 ,/* 0x0000003d3fc0 */
	RA = 0x0700142000 ,
	PA = 0x0700142000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v106_data_begin
Thr7_User_Data_4v106_data_begin:
Thr7_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v007 TEXT_VA=0x0000392000
attr_text {
	Name = .Thr7_User_Text_4v007 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x000000392000 ,/* 0x000000393fc0 */
	RA = 0x07001c4000 ,
	PA = 0x07001c4000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	end_label   = Thr7_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v007_text_begin
Thr7_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v107 DATA_VA=0x0000276000
attr_data {
	Name = .Thr7_User_Data_4v107 ,
	VA = 0x000000276000 ,/* 0x000000277fc0 */
	RA = 0x0700152000 ,
	PA = 0x0700152000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v107_data_begin
Thr7_User_Data_4v107_data_begin:
Thr7_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v008 TEXT_VA=0x00003b4000
attr_text {
	Name = .Thr7_User_Text_4v008 ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x0000003b4000 ,/* 0x0000003b5fc0 */
	RA = 0x0700006000 ,
	PA = 0x0700006000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	end_label   = Thr7_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v008_text_begin
Thr7_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v108 DATA_VA=0x0000250000
attr_data {
	Name = .Thr7_User_Data_4v108 ,
	VA = 0x000000250000 ,/* 0x000000251fc0 */
	RA = 0x0700008000 ,
	PA = 0x0700008000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v108_data_begin
Thr7_User_Data_4v108_data_begin:
Thr7_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v009 TEXT_VA=0x0eb0000000
attr_text {
	Name = .Thr7_User_Text_4v009 ,
	thr7_nz_ctx_tsb_1 ,
	VA = 0x000eb0000000 ,/* 0x000ebfffffc0 */
	RA = 0x1f60000000 ,
	PA = 0x2690000000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	TTE_Size    = 5 ,
	end_label   = Thr7_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v009_text_begin
Thr7_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v109 DATA_VA=0x000a480000
attr_data {
	Name = .Thr7_User_Data_4v109 ,
	VA = 0x00000a480000 ,/* 0x00000a48ffc0 */
	RA = 0x0014720000 ,
	PA = 0x0724720000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr7_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v109_data_begin
Thr7_User_Data_4v109_data_begin:
Thr7_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00a TEXT_VA=0x0000364000
attr_text {
	Name = .Thr7_User_Text_4v00a ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x000000364000 ,/* 0x000000365fc0 */
	RA = 0x07000a6000 ,
	PA = 0x07000a6000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	end_label   = Thr7_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00a_text_begin
Thr7_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10a DATA_VA=0x000ac60000
attr_data {
	Name = .Thr7_User_Data_4v10a ,
	VA = 0x00000ac60000 ,/* 0x00000ac6ffc0 */
	RA = 0x0014eb0000 ,
	PA = 0x0724eb0000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr7_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10a_data_begin
Thr7_User_Data_4v10a_data_begin:
Thr7_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00b TEXT_VA=0x01dc800000
attr_text {
	Name = .Thr7_User_Text_4v00b ,
	thr7_nz_ctx_tsb_0 ,
	VA = 0x0001dc800000 ,/* 0x0001dcbfffc0 */
	RA = 0x00de800000 ,
	PA = 0x07fe800000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00b_text_begin
Thr7_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10b DATA_VA=0x000af10000
attr_data {
	Name = .Thr7_User_Data_4v10b ,
	VA = 0x00000af10000 ,/* 0x00000af1ffc0 */
	RA = 0x0014060000 ,
	PA = 0x0724060000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr7_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10b_data_begin
Thr7_User_Data_4v10b_data_begin:
Thr7_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00c TEXT_VA=0x000028c000
attr_text {
	Name = .Thr7_User_Text_4v00c ,
	thr7_nz_ctx_tsb_2 ,
	VA = 0x00000028c000 ,/* 0x00000028dfc0 */
	RA = 0x07001dc000 ,
	PA = 0x07001dc000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	end_label   = Thr7_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00c_text_begin
Thr7_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10c DATA_VA=0x00002a8000
attr_data {
	Name = .Thr7_User_Data_4v10c ,
	VA = 0x0000002a8000 ,/* 0x0000002a9fc0 */
	RA = 0x0700116000 ,
	PA = 0x0700116000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10c_data_begin
Thr7_User_Data_4v10c_data_begin:
Thr7_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00d TEXT_VA=0x01f9c00000
attr_text {
	Name = .Thr7_User_Text_4v00d ,
	thr7_nz_ctx_tsb_0 ,
	VA = 0x0001f9c00000 ,/* 0x0001f9ffffc0 */
	RA = 0x00e1800000 ,
	PA = 0x0801800000 ,
	TTE_Context = 0x0301 ,/* TEXT_PRIMARY */
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
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
	TTE_Size    = 3 ,
	end_label   = Thr7_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00d_text_begin
Thr7_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10d DATA_VA=0x00003da000
attr_data {
	Name = .Thr7_User_Data_4v10d ,
	VA = 0x0000003da000 ,/* 0x0000003dbfc0 */
	RA = 0x0700092000 ,
	PA = 0x0700092000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10d_data_begin
Thr7_User_Data_4v10d_data_begin:
Thr7_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10e DATA_VA=0x0000244000
attr_data {
	Name = .Thr7_User_Data_4v10e ,
	VA = 0x000000244000 ,/* 0x000000245fc0 */
	RA = 0x0700162000 ,
	PA = 0x0700162000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10e_data_begin
Thr7_User_Data_4v10e_data_begin:
Thr7_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10f DATA_VA=0x00003dc000
attr_data {
	Name = .Thr7_User_Data_4v10f ,
	VA = 0x0000003dc000 ,/* 0x0000003ddfc0 */
	RA = 0x0700066000 ,
	PA = 0x0700066000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10f_data_begin
Thr7_User_Data_4v10f_data_begin:
Thr7_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v110 DATA_VA=0x000a8a0000
attr_data {
	Name = .Thr7_User_Data_4v110 ,
	VA = 0x00000a8a0000 ,/* 0x00000a8affc0 */
	RA = 0x0014330000 ,
	PA = 0x0724330000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr7_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v110_data_begin
Thr7_User_Data_4v110_data_begin:
Thr7_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v111 DATA_VA=0x00002ae000
attr_data {
	Name = .Thr7_User_Data_4v111 ,
	VA = 0x0000002ae000 ,/* 0x0000002affc0 */
	RA = 0x070002e000 ,
	PA = 0x070002e000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v111_data_begin
Thr7_User_Data_4v111_data_begin:
Thr7_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v112 DATA_VA=0x000a960000
attr_data {
	Name = .Thr7_User_Data_4v112 ,
	VA = 0x00000a960000 ,/* 0x00000a96ffc0 */
	RA = 0x0014ee0000 ,
	PA = 0x0724ee0000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 1 ,
	end_label   = Thr7_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v112_data_begin
Thr7_User_Data_4v112_data_begin:
Thr7_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v113 DATA_VA=0x000030e000
attr_data {
	Name = .Thr7_User_Data_4v113 ,
	VA = 0x00000030e000 ,/* 0x00000030ffc0 */
	RA = 0x070017e000 ,
	PA = 0x070017e000 ,
	TTE_Context = 0x0301 ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0 ,
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
	TTE_Size    = 0 ,
	end_label   = Thr7_User_Data_4v113_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v113_data_begin
Thr7_User_Data_4v113_data_begin:
Thr7_User_Data_4v113_data_end:
