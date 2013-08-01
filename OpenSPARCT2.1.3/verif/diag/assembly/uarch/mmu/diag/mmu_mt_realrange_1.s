/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_mt_realrange_1.s
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

#define THR0_Z_CTX_TSB_CONFIG_0  0x8000000001000110
#define THR0_Z_CTX_TSB_CONFIG_1  0x8000000001010130
#define THR0_Z_CTX_TSB_CONFIG_2  0x8000000001020150
#define THR0_Z_CTX_TSB_CONFIG_3  0x8000000001030100
#define THR0_NZ_CTX_TSB_CONFIG_0 0x8000000001200130
#define THR0_NZ_CTX_TSB_CONFIG_1 0x8000000001210150
#define THR0_NZ_CTX_TSB_CONFIG_2 0x8000000001220100
#define THR0_NZ_CTX_TSB_CONFIG_3 0x8000000001230110
#define THR1_Z_CTX_TSB_CONFIG_0  0x8000000001040110
#define THR1_Z_CTX_TSB_CONFIG_1  0x8000000001050130
#define THR1_Z_CTX_TSB_CONFIG_2  0x8000000001060150
#define THR1_Z_CTX_TSB_CONFIG_3  0x8000000001070100
#define THR1_NZ_CTX_TSB_CONFIG_0 0x8000000001240100
#define THR1_NZ_CTX_TSB_CONFIG_1 0x8000000001250110
#define THR1_NZ_CTX_TSB_CONFIG_2 0x8000000001260130
#define THR1_NZ_CTX_TSB_CONFIG_3 0x8000000001270150
#define THR2_Z_CTX_TSB_CONFIG_0  0x8000000001080130
#define THR2_Z_CTX_TSB_CONFIG_1  0x8000000001090150
#define THR2_Z_CTX_TSB_CONFIG_2  0x80000000010a0100
#define THR2_Z_CTX_TSB_CONFIG_3  0x80000000010b0110
#define THR2_NZ_CTX_TSB_CONFIG_0 0x8000000001280150
#define THR2_NZ_CTX_TSB_CONFIG_1 0x8000000001290100
#define THR2_NZ_CTX_TSB_CONFIG_2 0x80000000012a0110
#define THR2_NZ_CTX_TSB_CONFIG_3 0x80000000012b0130
#define THR3_Z_CTX_TSB_CONFIG_0  0x80000000010c0130
#define THR3_Z_CTX_TSB_CONFIG_1  0x80000000010d0150
#define THR3_Z_CTX_TSB_CONFIG_2  0x80000000010e0100
#define THR3_Z_CTX_TSB_CONFIG_3  0x80000000010f0110
#define THR3_NZ_CTX_TSB_CONFIG_0 0x80000000012c0150
#define THR3_NZ_CTX_TSB_CONFIG_1 0x80000000012d0100
#define THR3_NZ_CTX_TSB_CONFIG_2 0x80000000012e0110
#define THR3_NZ_CTX_TSB_CONFIG_3 0x80000000012f0130
#define THR4_Z_CTX_TSB_CONFIG_0  0x8000000001100150
#define THR4_Z_CTX_TSB_CONFIG_1  0x8000000001110100
#define THR4_Z_CTX_TSB_CONFIG_2  0x8000000001120110
#define THR4_Z_CTX_TSB_CONFIG_3  0x8000000001130130
#define THR4_NZ_CTX_TSB_CONFIG_0 0x8000000001300150
#define THR4_NZ_CTX_TSB_CONFIG_1 0x8000000001310100
#define THR4_NZ_CTX_TSB_CONFIG_2 0x8000000001320110
#define THR4_NZ_CTX_TSB_CONFIG_3 0x8000000001330130
#define THR5_Z_CTX_TSB_CONFIG_0  0x8000000001140150
#define THR5_Z_CTX_TSB_CONFIG_1  0x8000000001150100
#define THR5_Z_CTX_TSB_CONFIG_2  0x8000000001160110
#define THR5_Z_CTX_TSB_CONFIG_3  0x8000000001170130
#define THR5_NZ_CTX_TSB_CONFIG_0 0x8000000001340100
#define THR5_NZ_CTX_TSB_CONFIG_1 0x8000000001350110
#define THR5_NZ_CTX_TSB_CONFIG_2 0x8000000001360130
#define THR5_NZ_CTX_TSB_CONFIG_3 0x8000000001370150
#define THR6_Z_CTX_TSB_CONFIG_0  0x8000000001180150
#define THR6_Z_CTX_TSB_CONFIG_1  0x8000000001190100
#define THR6_Z_CTX_TSB_CONFIG_2  0x80000000011a0110
#define THR6_Z_CTX_TSB_CONFIG_3  0x80000000011b0130
#define THR6_NZ_CTX_TSB_CONFIG_0 0x8000000001380130
#define THR6_NZ_CTX_TSB_CONFIG_1 0x8000000001390150
#define THR6_NZ_CTX_TSB_CONFIG_2 0x80000000013a0100
#define THR6_NZ_CTX_TSB_CONFIG_3 0x80000000013b0110
#define THR7_Z_CTX_TSB_CONFIG_0  0x80000000011c0110
#define THR7_Z_CTX_TSB_CONFIG_1  0x80000000011d0130
#define THR7_Z_CTX_TSB_CONFIG_2  0x80000000011e0150
#define THR7_Z_CTX_TSB_CONFIG_3  0x80000000011f0100
#define THR7_NZ_CTX_TSB_CONFIG_0 0x80000000013c0130
#define THR7_NZ_CTX_TSB_CONFIG_1 0x80000000013d0150
#define THR7_NZ_CTX_TSB_CONFIG_2 0x80000000013e0100
#define THR7_NZ_CTX_TSB_CONFIG_3 0x80000000013f0110
#define THR0_REAL_RANGE_0 0x8000080000000000
#define THR0_REAL_RANGE_1 0x8000080000000000
#define THR0_REAL_RANGE_2 0x8000080000000000
#define THR0_REAL_RANGE_3 0x8000080000000000
#define THR1_REAL_RANGE_0 0x8000080000000000
#define THR1_REAL_RANGE_1 0x8000080000000000
#define THR1_REAL_RANGE_2 0x8000080000000000
#define THR1_REAL_RANGE_3 0x8000080000000000
#define THR2_REAL_RANGE_0 0x8000080000000000
#define THR2_REAL_RANGE_1 0x8000080000000000
#define THR2_REAL_RANGE_2 0x8000080000000000
#define THR2_REAL_RANGE_3 0x8000080000000000
#define THR3_REAL_RANGE_0 0x8001000000000000
#define THR3_REAL_RANGE_1 0x8001000000000000
#define THR3_REAL_RANGE_2 0x8001000000000000
#define THR3_REAL_RANGE_3 0x8001000000000000
#define THR4_REAL_RANGE_0 0x8001000000000000
#define THR4_REAL_RANGE_1 0x8001000000000000
#define THR4_REAL_RANGE_2 0x8001000000000000
#define THR4_REAL_RANGE_3 0x8001000000000000
#define THR5_REAL_RANGE_0 0x8001000000000000
#define THR5_REAL_RANGE_1 0x8001000000000000
#define THR5_REAL_RANGE_2 0x8001000000000000
#define THR5_REAL_RANGE_3 0x8001000000000000
#define THR6_REAL_RANGE_0 0x0000080000000000
#define THR6_REAL_RANGE_1 0x0000080000000000
#define THR6_REAL_RANGE_2 0x0000080000000000
#define THR6_REAL_RANGE_3 0x8001000000000000
#define THR7_REAL_RANGE_0 0x0001000000000000
#define THR7_REAL_RANGE_1 0x0001000000000000
#define THR7_REAL_RANGE_2 0x8001000000000002
#define THR7_REAL_RANGE_3 0x0001000000000000
#define THR0_PHY_OFF_0 0x0000000080000000
#define THR0_PHY_OFF_1 0x0000000200000000
#define THR0_PHY_OFF_2 0x0000000800000000
#define THR0_PHY_OFF_3 0x0000004000000000
#define THR1_PHY_OFF_0 0x0000000200000000
#define THR1_PHY_OFF_1 0x0000000200000000
#define THR1_PHY_OFF_2 0x0000000800000000
#define THR1_PHY_OFF_3 0x0000004000000000
#define THR2_PHY_OFF_0 0x0000000080000000
#define THR2_PHY_OFF_1 0x0000000200000000
#define THR2_PHY_OFF_2 0x0000000800000000
#define THR2_PHY_OFF_3 0x0000004000000000
#define THR3_PHY_OFF_0 0x0000000800000000
#define THR3_PHY_OFF_1 0x0000004000000000
#define THR3_PHY_OFF_2 0x0000004000000000
#define THR3_PHY_OFF_3 0x0000004000000000
#define THR4_PHY_OFF_0 0x0000000800000000
#define THR4_PHY_OFF_1 0x0000004000000000
#define THR4_PHY_OFF_2 0x0000004000000000
#define THR4_PHY_OFF_3 0x0000004000000000
#define THR5_PHY_OFF_0 0x0000000800000000
#define THR5_PHY_OFF_1 0x0000004000000000
#define THR5_PHY_OFF_2 0x0000005000000000
#define THR5_PHY_OFF_3 0x0000006000000000
#define THR6_PHY_OFF_0 0x0000004080000000
#define THR6_PHY_OFF_1 0x0000005200000000
#define THR6_PHY_OFF_2 0x0000006800000000
#define THR6_PHY_OFF_3 0x0000000800000000
#define THR7_PHY_OFF_0 0x0000004080000000
#define THR7_PHY_OFF_1 0x0000005200000000
#define THR7_PHY_OFF_2 0x0000000800000000
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
#define THR0_PCONTEXT_0 0x0c80
#define THR0_PCONTEXT_1 0x0565
#define THR0_SCONTEXT_0 0x0ca4
#define THR0_SCONTEXT_1 0x117b
#define THR1_PCONTEXT_0 0x1ef0
#define THR1_PCONTEXT_1 0x0df9
#define THR1_SCONTEXT_0 0x1643
#define THR1_SCONTEXT_1 0x0806
#define THR2_PCONTEXT_0 0x1740
#define THR2_PCONTEXT_1 0x192b
#define THR2_SCONTEXT_0 0x1fb2
#define THR2_SCONTEXT_1 0x105d
#define THR3_PCONTEXT_0 0x15c2
#define THR3_PCONTEXT_1 0x1067
#define THR3_SCONTEXT_0 0x0d6f
#define THR3_SCONTEXT_1 0x1af3
#define THR4_PCONTEXT_0 0x0613
#define THR4_PCONTEXT_1 0x172e
#define THR4_SCONTEXT_0 0x12e4
#define THR4_SCONTEXT_1 0x0670
#define THR5_PCONTEXT_0 0x13dd
#define THR5_PCONTEXT_1 0x15c8
#define THR5_SCONTEXT_0 0x1cd9
#define THR5_SCONTEXT_1 0x1586
#define THR6_PCONTEXT_0 0x0c8a
#define THR6_PCONTEXT_1 0x19ac
#define THR6_SCONTEXT_0 0x18ab
#define THR6_SCONTEXT_1 0x1e47
#define THR7_PCONTEXT_0 0x0687
#define THR7_PCONTEXT_1 0x1d84
#define THR7_SCONTEXT_0 0x06bc
#define THR7_SCONTEXT_1 0x05a0
#define THR0_PTRAP_TEXT_VA 0x0000a7690000
#define THR0_PTRAP_TEXT_RA 0x0045b80000
#define THR0_PTRAP_TEXT_PA 0x0245b80000
#define THR1_PTRAP_TEXT_VA 0x0000a75b0000
#define THR1_PTRAP_TEXT_RA 0x00450f0000
#define THR1_PTRAP_TEXT_PA 0x02450f0000
#define THR2_PTRAP_TEXT_VA 0x0000a7800000
#define THR2_PTRAP_TEXT_RA 0x00452b0000
#define THR2_PTRAP_TEXT_PA 0x02452b0000
#define THR3_PTRAP_TEXT_VA 0x0000a74a0000
#define THR3_PTRAP_TEXT_RA 0x0045e60000
#define THR3_PTRAP_TEXT_PA 0x0245e60000
#define THR4_PTRAP_TEXT_VA 0x0000a73e0000
#define THR4_PTRAP_TEXT_RA 0x0045d20000
#define THR4_PTRAP_TEXT_PA 0x0245d20000
#define THR5_PTRAP_TEXT_VA 0x0000a79a0000
#define THR5_PTRAP_TEXT_RA 0x0045c60000
#define THR5_PTRAP_TEXT_PA 0x0245c60000
#define THR6_PTRAP_TEXT_VA 0x0000a7010000
#define THR6_PTRAP_TEXT_RA 0x0045260000
#define THR6_PTRAP_TEXT_PA 0x0245260000
#define THR7_PTRAP_TEXT_VA 0x0000a7cc0000
#define THR7_PTRAP_TEXT_RA 0x0045170000
#define THR7_PTRAP_TEXT_PA 0x0245170000
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

#define PTRAP_DEMAP_ALL         0x10
#define HPTRAP_DEMAP_ALL        0x80

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

!#*****************************************************************************************
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

#ifndef NOPWRMGMT
    	! Power Management - set full power throttle mode ..
pwr_mgmt:
    	set     0x1fff, %g2
    	stxa    %g2, [%g0] ASI_SPARC_PWR_MGMT
#endif

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

!#*****************************************************************************************
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

!#*********************************************************************
SECTION .Thr0_Priv_Sect TEXT_VA=0x00142d6000
attr_text {
	Name = .Thr0_Priv_Sect,
	thr0_nz_ctx_tsb_2
	VA = 0x0000142d6000,
	RA = 0x0011ade000,
	PA = 0x0091ade000,
	TTE_Context = 0x0c80,
	TTE_V       = 1,
	TTE_Size    = 0,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_Soft2   = 0,
	TTE_Diag    = 0,
	TTE_Soft    = 0,
	TTE_EP      = 1,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 0,
	TTE_W       = 0,
	TTE_RSVD1   = 0,
	end_label   = Thr0_Priv_Sect_text_end,
	compressimage,
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
!#*********************************************************************
SECTION .Thr1_Priv_Sect TEXT_VA=0x0014324000
attr_text {
	Name = .Thr1_Priv_Sect,
	thr1_nz_ctx_tsb_0
	VA = 0x000014324000,
	RA = 0x0011bc0000,
	PA = 0x0211bc0000,
	TTE_Context = 0x1ef0,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	end_label   = Thr1_Priv_Sect_text_end,
	compressimage,
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
!#*********************************************************************
SECTION .Thr2_Priv_Sect TEXT_VA=0x001424a000
attr_text {
	Name = .Thr2_Priv_Sect,
	thr2_nz_ctx_tsb_1
	VA = 0x00001424a000,
	RA = 0x0011bdc000,
	PA = 0x0091bdc000,
	TTE_Context = 0x1740,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	end_label   = Thr2_Priv_Sect_text_end,
	compressimage,
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
!#*********************************************************************
SECTION .Thr3_Priv_Sect TEXT_VA=0x001430a000
attr_text {
	Name = .Thr3_Priv_Sect,
	thr3_nz_ctx_tsb_1
	VA = 0x00001430a000,
	RA = 0x0011a28000,
	PA = 0x0811a28000,
	TTE_Context = 0x15c2,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	end_label   = Thr3_Priv_Sect_text_end,
	compressimage,
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
!#*********************************************************************
SECTION .Thr4_Priv_Sect TEXT_VA=0x0014226000
attr_text {
	Name = .Thr4_Priv_Sect,
	thr4_nz_ctx_tsb_1
	VA = 0x000014226000,
	RA = 0x0211ae6000,
	PA = 0x0a11ae6000,
	TTE_Context = 0x0613,
	TTE_V       = 1,
	TTE_Size    = 0,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_Soft2   = 0,
	TTE_Diag    = 0,
	TTE_Soft    = 0,
	TTE_EP      = 1,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 0,
	TTE_W       = 0,
	TTE_RSVD1   = 0,
	end_label   = Thr4_Priv_Sect_text_end,
	compressimage,
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
!#*********************************************************************
SECTION .Thr5_Priv_Sect TEXT_VA=0x001432a000
attr_text {
	Name = .Thr5_Priv_Sect,
	thr5_nz_ctx_tsb_0
	VA = 0x00001432a000,
	RA = 0x0011b78000,
	PA = 0x0811b78000,
	TTE_Context = 0x13dd,
	TTE_V       = 1,
	TTE_Size    = 0,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_Soft2   = 0,
	TTE_Diag    = 0,
	TTE_Soft    = 0,
	TTE_EP      = 1,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 0,
	TTE_W       = 0,
	TTE_RSVD1   = 0,
	end_label   = Thr5_Priv_Sect_text_end,
	compressimage,
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
!#*********************************************************************
SECTION .Thr6_Priv_Sect TEXT_VA=0x0014374000
attr_text {
	Name = .Thr6_Priv_Sect,
	thr6_nz_ctx_tsb_2
	VA = 0x000014374000,
	RA = 0x0011a00000,
	PA = 0x0811a00000,
	TTE_Context = 0x0c8a,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	end_label   = Thr6_Priv_Sect_text_end,
	compressimage,
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
!#*********************************************************************
SECTION .Thr7_Priv_Sect TEXT_VA=0x0014274000
attr_text {
	Name = .Thr7_Priv_Sect,
	thr7_nz_ctx_tsb_2
	VA = 0x000014274000,
	RA = 0x0011bb2000,
	PA = 0x0811bb2000,
	TTE_Context = 0x0687,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	end_label   = Thr7_Priv_Sect_text_end,
	compressimage,
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
!#*********************************************************************
SECTION .Thr0_Ptrap_Sect TEXT_VA=THR0_PTRAP_TEXT_VA
attr_text {
	Name = .Thr0_Ptrap_Sect,
	thr0_z_ctx_tsb_0
	VA = THR0_PTRAP_TEXT_VA,
	RA = THR0_PTRAP_TEXT_RA,
	PA = THR0_PTRAP_TEXT_PA,
	TTE_Context = NUCLEUS,
	TTE_V       = 1,
	TTE_Size    = 1,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_Soft2   = 0,
	TTE_Diag    = 0,
	TTE_Soft    = 0,
	TTE_EP      = 1,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 1,
	TTE_W       = 0,
	TTE_RSVD1   = 0,
	end_label   = Thr0_Ptrap_Sect_text_end,
	compressimage,
	}
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	ta	HP_GOOD_TRAP
	nop
.align	32	
	ta	HP_BAD_TRAP
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
thr1_ptrap_demap_all_entry:	
	ta	HPTRAP_DEMAP_ALL
	done
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
Thr0_Ptrap_Sect_text_end:
!#*********************************************************************
SECTION .Thr1_Ptrap_Sect TEXT_VA=THR1_PTRAP_TEXT_VA
attr_text {
	Name = .Thr1_Ptrap_Sect,
	thr1_z_ctx_tsb_0
	VA = THR1_PTRAP_TEXT_VA,
	RA = THR1_PTRAP_TEXT_RA,
	PA = THR1_PTRAP_TEXT_PA,
	TTE_Context = NUCLEUS,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 1,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	end_label   = Thr1_Ptrap_Sect_text_end,
	compressimage,
	}
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	ta	HP_GOOD_TRAP
	nop
.align	32	
	ta	HP_BAD_TRAP
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
thr1_ptrap_demap_all_entry:	
	ta	HPTRAP_DEMAP_ALL
	done
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
Thr1_Ptrap_Sect_text_end:
!#*********************************************************************
SECTION .Thr2_Ptrap_Sect TEXT_VA=THR2_PTRAP_TEXT_VA
attr_text {
	Name = .Thr2_Ptrap_Sect,
	thr2_z_ctx_tsb_3
	VA = THR2_PTRAP_TEXT_VA,
	RA = THR2_PTRAP_TEXT_RA,
	PA = THR2_PTRAP_TEXT_PA,
	TTE_Context = NUCLEUS,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 1,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	end_label   = Thr2_Ptrap_Sect_text_end,
	compressimage,
	}
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	ta	HP_GOOD_TRAP
	nop
.align	32	
	ta	HP_BAD_TRAP
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
thr1_ptrap_demap_all_entry:	
	ta	HPTRAP_DEMAP_ALL
	done
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
Thr2_Ptrap_Sect_text_end:
!#*********************************************************************
SECTION .Thr3_Ptrap_Sect TEXT_VA=THR3_PTRAP_TEXT_VA
attr_text {
	Name = .Thr3_Ptrap_Sect,
	thr3_z_ctx_tsb_3
	VA = THR3_PTRAP_TEXT_VA,
	RA = THR3_PTRAP_TEXT_RA,
	PA = THR3_PTRAP_TEXT_PA,
	TTE_Context = NUCLEUS,
	TTE_V       = 1,
	TTE_Size    = 1,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_Soft2   = 0,
	TTE_Diag    = 0,
	TTE_Soft    = 0,
	TTE_EP      = 1,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 1,
	TTE_W       = 0,
	TTE_RSVD1   = 0,
	end_label   = Thr3_Ptrap_Sect_text_end,
	compressimage,
	}
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	ta	HP_GOOD_TRAP
	nop
.align	32	
	ta	HP_BAD_TRAP
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
thr1_ptrap_demap_all_entry:	
	ta	HPTRAP_DEMAP_ALL
	done
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
Thr3_Ptrap_Sect_text_end:
!#*********************************************************************
SECTION .Thr4_Ptrap_Sect TEXT_VA=THR4_PTRAP_TEXT_VA
attr_text {
	Name = .Thr4_Ptrap_Sect,
	thr4_z_ctx_tsb_2
	VA = THR4_PTRAP_TEXT_VA,
	RA = THR4_PTRAP_TEXT_RA,
	PA = THR4_PTRAP_TEXT_PA,
	TTE_Context = NUCLEUS,
	TTE_V       = 1,
	TTE_Size    = 1,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_Soft2   = 0,
	TTE_Diag    = 0,
	TTE_Soft    = 0,
	TTE_EP      = 1,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 1,
	TTE_W       = 0,
	TTE_RSVD1   = 0,
	end_label   = Thr4_Ptrap_Sect_text_end,
	compressimage,
	}
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	ta	HP_GOOD_TRAP
	nop
.align	32	
	ta	HP_BAD_TRAP
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
thr1_ptrap_demap_all_entry:	
	ta	HPTRAP_DEMAP_ALL
	done
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
Thr4_Ptrap_Sect_text_end:
!#*********************************************************************
SECTION .Thr5_Ptrap_Sect TEXT_VA=THR5_PTRAP_TEXT_VA
attr_text {
	Name = .Thr5_Ptrap_Sect,
	thr5_z_ctx_tsb_2
	VA = THR5_PTRAP_TEXT_VA,
	RA = THR5_PTRAP_TEXT_RA,
	PA = THR5_PTRAP_TEXT_PA,
	TTE_Context = NUCLEUS,
	TTE_V       = 1,
	TTE_Size    = 1,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_Soft2   = 0,
	TTE_Diag    = 0,
	TTE_Soft    = 0,
	TTE_EP      = 1,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 1,
	TTE_W       = 0,
	TTE_RSVD1   = 0,
	end_label   = Thr5_Ptrap_Sect_text_end,
	compressimage,
	}
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	ta	HP_GOOD_TRAP
	nop
.align	32	
	ta	HP_BAD_TRAP
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
thr1_ptrap_demap_all_entry:	
	ta	HPTRAP_DEMAP_ALL
	done
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
Thr5_Ptrap_Sect_text_end:
!#*********************************************************************
SECTION .Thr6_Ptrap_Sect TEXT_VA=THR6_PTRAP_TEXT_VA
attr_text {
	Name = .Thr6_Ptrap_Sect,
	thr6_z_ctx_tsb_2
	VA = THR6_PTRAP_TEXT_VA,
	RA = THR6_PTRAP_TEXT_RA,
	PA = THR6_PTRAP_TEXT_PA,
	TTE_Context = NUCLEUS,
	TTE_V       = 1,
	TTE_Size    = 1,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_Soft2   = 0,
	TTE_Diag    = 0,
	TTE_Soft    = 0,
	TTE_EP      = 1,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 1,
	TTE_W       = 0,
	TTE_RSVD1   = 0,
	end_label   = Thr6_Ptrap_Sect_text_end,
	compressimage,
	}
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	ta	HP_GOOD_TRAP
	nop
.align	32	
	ta	HP_BAD_TRAP
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
thr1_ptrap_demap_all_entry:	
	ta	HPTRAP_DEMAP_ALL
	done
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
Thr6_Ptrap_Sect_text_end:
!#*********************************************************************
SECTION .Thr7_Ptrap_Sect TEXT_VA=THR7_PTRAP_TEXT_VA
attr_text {
	Name = .Thr7_Ptrap_Sect,
	thr7_z_ctx_tsb_0
	VA = THR7_PTRAP_TEXT_VA,
	RA = THR7_PTRAP_TEXT_RA,
	PA = THR7_PTRAP_TEXT_PA,
	TTE_Context = NUCLEUS,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 1,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	end_label   = Thr7_Ptrap_Sect_text_end,
	compressimage,
	}
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	ta	HP_GOOD_TRAP
	nop
.align	32	
	ta	HP_BAD_TRAP
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
thr1_ptrap_demap_all_entry:	
	ta	HPTRAP_DEMAP_ALL
	done
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
	nop
.align	32	
Thr7_Ptrap_Sect_text_end:
!#*****************************************************************************************
SECTION .HTRAPS  TEXT_VA=HPTRAP_TEXT_PA

attr_text {
    Name = .HTRAPS,
    hypervisor,
    }

	nop
.align	32	!# 1
	nop
.align	32	!# 2
	nop
.align	32	!# 3
	nop
.align	32	!# 4
	nop
.align	32	!# 5
	nop
.align	32	!# 6
	nop
.align	32	!# 7
	nop
.align	32	!# 8
HP_trap_0x8:	
	EXIT_BAD
	nop
.align	32	!# 9
HP_trap_0x9:	
	EXIT_BAD
	nop
.align	32	!# a
	nop
.align	32	!# b
	nop
.align	32	!# c
	nop
.align	32	!# d
	nop
.align	32	!# e
	nop
.align	32	!# f
	nop
.align	32	!# 10
HP_trap_0x10:	
	wrpr	0, %tl
	ta	HP_BAD_TRAP
	nop
.align	32	!# 11
	nop
.align	32	!# 12
	nop
.align	32	!# 13
	nop
.align	32	!# 14
	nop
.align	32	!# 15
	nop
.align	32	!# 16
	nop
.align	32	!# 17
	nop
.align	32	!# 18
	nop
.align	32	!# 19
	nop
.align	32	!# 1a
	nop
.align	32	!# 1b
	nop
.align	32	!# 1c
	nop
.align	32	!# 1d
	nop
.align	32	!# 1e
	nop
.align	32	!# 1f
	nop
.align	32	!# 20
	nop
.align	32	!# 21
	nop
.align	32	!# 22
	nop
.align	32	!# 23
	nop
.align	32	!# 24
	nop
.align	32	!# 25
	nop
.align	32	!# 26
	nop
.align	32	!# 27
	nop
.align	32	!# 28
	nop
.align	32	!# 29
	nop
.align	32	!# 2a
	EXIT_BAD
	nop
.align	32	!# 2b
	setx	ext_trap_0x2b_begin, %g1, %g2
	jmp	%g2
	nop
.align	32	!# 2c
	nop
.align	32	!# 2d
	nop
.align	32	!# 2e
	nop
.align	32	!# 2f
	nop
.align	32	!# 30
	nop
.align	32	!# 31
	EXIT_BAD
	nop
.align	32	!# 32
	nop
.align	32	!# 33
	nop
.align	32	!# 34
	nop
.align	32	!# 35
	nop
.align	32	!# 36
	nop
.align	32	!# 37
	nop
.align	32	!# 38
	nop
.align	32	!# 39
	nop
.align	32	!# 3a
	nop
.align	32	!# 3b
	nop
.align	32	!# 3c
	nop
.align	32	!# 3d
	nop
.align	32	!# 3e
	nop
.align	32	!# 3f
	nop
.align	32	!# 40
	nop
.align	32	!# 41
	nop
.align	32	!# 42
	nop
.align	32	!# 43
	nop
.align	32	!# 44
	nop
.align	32	!# 45
	nop
.align	32	!# 46
	nop
.align	32	!# 47
	nop
.align	32	!# 48
	nop
.align	32	!# 49
	nop
.align	32	!# 4a
	nop
.align	32	!# 4b
	nop
.align	32	!# 4c
	nop
.align	32	!# 4d
	nop
.align	32	!# 4e
	nop
.align	32	!# 4f
	nop
.align	32	!# 50
	nop
.align	32	!# 51
	nop
.align	32	!# 52
	nop
.align	32	!# 53
	nop
.align	32	!# 54
	nop
.align	32	!# 55
	nop
.align	32	!# 56
	nop
.align	32	!# 57
	nop
.align	32	!# 58
	nop
.align	32	!# 59
	nop
.align	32	!# 5a
	nop
.align	32	!# 5b
	nop
.align	32	!# 5c
	nop
.align	32	!# 5d
	nop
.align	32	!# 5e
	nop
.align	32	!# 5f
	nop
.align	32	!# 60
	nop
.align	32	!# 61
	nop
.align	32	!# 62
	nop
.align	32	!# 63
	nop
.align	32	!# 64
	setx	ext_trap_0x64_begin, %g1, %g2
	jmp	%g2
	nop
.align	32	!# 65
	nop
.align	32	!# 66
	nop
.align	32	!# 67
	nop
.align	32	!# 68
        setx    ext_trap_0x68_begin, %g1, %g2
        jmp     %g2
	nop
.align	32	!# 69
	nop
.align	32	!# 6a
	nop
.align	32	!# 6b
	nop
.align	32	!# 6c
	nop
.align	32	!# 6d
	nop
.align	32	!# 6e
	nop
.align	32	!# 6f
	nop
.align	32	!# 70
	nop
.align	32	!# 71
	nop
.align	32	!# 72
	nop
.align	32	!# 73
	nop
.align	32	!# 74
	nop
.align	32	!# 75
	nop
.align	32	!# 76
	nop
.align	32	!# 77
	nop
.align	32	!# 78
	nop
.align	32	!# 79
	nop
.align	32	!# 7a
	nop
.align	32	!# 7b
	nop
.align	32	!# 7c
	nop
.align	32	!# 7d
	nop
.align	32	!# 7e
	nop
.align	32	!# 7f
	nop
.align	32	!# 80
	nop
.align	32	!# 81
	nop
.align	32	!# 82
	nop
.align	32	!# 83
	nop
.align	32	!# 84
	nop
.align	32	!# 85
	nop
.align	32	!# 86
	nop
.align	32	!# 87
	nop
.align	32	!# 88
	nop
.align	32	!# 89
	nop
.align	32	!# 8a
	nop
.align	32	!# 8b
	nop
.align	32	!# 8c
	nop
.align	32	!# 8d
	nop
.align	32	!# 8e
	nop
.align	32	!# 8f
	nop
.align	32	!# 90
	nop
.align	32	!# 91
	nop
.align	32	!# 92
	nop
.align	32	!# 93
	nop
.align	32	!# 94
	nop
.align	32	!# 95
	nop
.align	32	!# 96
	nop
.align	32	!# 97
	nop
.align	32	!# 98
	nop
.align	32	!# 99
	nop
.align	32	!# 9a
	nop
.align	32	!# 9b
	nop
.align	32	!# 9c
	nop
.align	32	!# 9d
	nop
.align	32	!# 9e
	nop
.align	32	!# 9f
	nop
.align	32	!# a0
	nop
.align	32	!# a1
	nop
.align	32	!# a2
	nop
.align	32	!# a3
	nop
.align	32	!# a4
	nop
.align	32	!# a5
	nop
.align	32	!# a6
	nop
.align	32	!# a7
	nop
.align	32	!# a8
	nop
.align	32	!# a9
	nop
.align	32	!# aa
	nop
.align	32	!# ab
	nop
.align	32	!# ac
	nop
.align	32	!# ad
	nop
.align	32	!# ae
	nop
.align	32	!# af
	nop
.align	32	!# b0
	nop
.align	32	!# b1
	nop
.align	32	!# b2
	nop
.align	32	!# b3
	nop
.align	32	!# b4
	nop
.align	32	!# b5
	nop
.align	32	!# b6
	nop
.align	32	!# b7
	nop
.align	32	!# b8
	nop
.align	32	!# b9
	nop
.align	32	!# ba
	nop
.align	32	!# bb
	nop
.align	32	!# bc
	nop
.align	32	!# bd
	nop
.align	32	!# be
	nop
.align	32	!# bf
	nop
.align	32	!# c0
	nop
.align	32	!# c1
	nop
.align	32	!# c2
	nop
.align	32	!# c3
	nop
.align	32	!# c4
	nop
.align	32	!# c5
	nop
.align	32	!# c6
	nop
.align	32	!# c7
	nop
.align	32	!# c8
	nop
.align	32	!# c9
	nop
.align	32	!# ca
	nop
.align	32	!# cb
	nop
.align	32	!# cc
	nop
.align	32	!# cd
	nop
.align	32	!# ce
	nop
.align	32	!# cf
	nop
.align	32	!# d0
	nop
.align	32	!# d1
	nop
.align	32	!# d2
	nop
.align	32	!# d3
	nop
.align	32	!# d4
	nop
.align	32	!# d5
	nop
.align	32	!# d6
	nop
.align	32	!# d7
	nop
.align	32	!# d8
	nop
.align	32	!# d9
	nop
.align	32	!# da
	nop
.align	32	!# db
	nop
.align	32	!# dc
	nop
.align	32	!# dd
	nop
.align	32	!# de
	nop
.align	32	!# df
	nop
.align	32	!# e0
	nop
.align	32	!# e1
	nop
.align	32	!# e2
	nop
.align	32	!# e3
	nop
.align	32	!# e4
	nop
.align	32	!# e5
	nop
.align	32	!# e6
	nop
.align	32	!# e7
	nop
.align	32	!# e8
	nop
.align	32	!# e9
	nop
.align	32	!# ea
	nop
.align	32	!# eb
	nop
.align	32	!# ec
	nop
.align	32	!# ed
	nop
.align	32	!# ee
	nop
.align	32	!# ef
	nop
.align	32	!# f0
	nop
.align	32	!# f1
	nop
.align	32	!# f2
	nop
.align	32	!# f3
	nop
.align	32	!# f4
	nop
.align	32	!# f5
	nop
.align	32	!# f6
	nop
.align	32	!# f7
	nop
.align	32	!# f8
	nop
.align	32	!# f9
	nop
.align	32	!# fa
	nop
.align	32	!# fb
	nop
.align	32	!# fc
	nop
.align	32	!# fd
	nop
.align	32	!# fe
	nop
.align	32	!# ff
	nop
.align	32	!# 100
	wrpr	0, %tl
	ta	HP_GOOD_TRAP
	nop
.align	32	!# 101
	wrpr	0, %tl
	ta	HP_BAD_TRAP
	nop
.align	32	!# 102
	nop
.align	32	!# 103
	nop
.align	32	!# 104
	nop
.align	32	!# 105
	nop
.align	32	!# 106
	nop
.align	32	!# 107
	nop
.align	32	!# 108
	nop
.align	32	!# 109
	nop
.align	32	!# 10a
	nop
.align	32	!# 10b
	nop
.align	32	!# 10c
	nop
.align	32	!# 10d
	nop
.align	32	!# 10e
	nop
.align	32	!# 10f
	nop
.align	32	!# 110
	nop
.align	32	!# 111
	nop
.align	32	!# 112
	nop
.align	32	!# 113
	nop
.align	32	!# 114
	nop
.align	32	!# 115
	nop
.align	32	!# 116
	nop
.align	32	!# 117
	nop
.align	32	!# 118
	nop
.align	32	!# 119
	nop
.align	32	!# 11a
	nop
.align	32	!# 11b
	nop
.align	32	!# 11c
	nop
.align	32	!# 11d
	nop
.align	32	!# 11e
	nop
.align	32	!# 11f
	nop
.align	32	!# 120
	nop
.align	32	!# 121
	nop
.align	32	!# 122
	nop
.align	32	!# 123
	nop
.align	32	!# 124
	nop
.align	32	!# 125
	nop
.align	32	!# 126
	nop
.align	32	!# 127
	nop
.align	32	!# 128
	nop
.align	32	!# 129
	nop
.align	32	!# 12a
	nop
.align	32	!# 12b
	nop
.align	32	!# 12c
	nop
.align	32	!# 12d
	nop
.align	32	!# 12e
	nop
.align	32	!# 12f
	nop
.align	32	!# 130
	nop
.align	32	!# 131
	nop
.align	32	!# 132
	nop
.align	32	!# 133
	nop
.align	32	!# 134
	nop
.align	32	!# 135
	nop
.align	32	!# 136
	nop
.align	32	!# 137
	nop
.align	32	!# 138
	nop
.align	32	!# 139
	nop
.align	32	!# 13a
	nop
.align	32	!# 13b
	nop
.align	32	!# 13c
	nop
.align	32	!# 13d
	nop
.align	32	!# 13e
	nop
.align	32	!# 13f
	nop
.align	32	!# 140
	nop
.align	32	!# 141
	nop
.align	32	!# 142
	nop
.align	32	!# 143
	nop
.align	32	!# 144
	nop
.align	32	!# 145
	nop
.align	32	!# 146
	nop
.align	32	!# 147
	nop
.align	32	!# 148
	nop
.align	32	!# 149
	nop
.align	32	!# 14a
	nop
.align	32	!# 14b
	nop
.align	32	!# 14c
	nop
.align	32	!# 14d
	nop
.align	32	!# 14e
	nop
.align	32	!# 14f
	nop
.align	32	!# 150
	nop
.align	32	!# 151
	nop
.align	32	!# 152
	nop
.align	32	!# 153
	nop
.align	32	!# 154
	nop
.align	32	!# 155
	nop
.align	32	!# 156
	nop
.align	32	!# 157
	nop
.align	32	!# 158
	nop
.align	32	!# 159
	nop
.align	32	!# 15a
	nop
.align	32	!# 15b
	nop
.align	32	!# 15c
	nop
.align	32	!# 15d
	nop
.align	32	!# 15e
	nop
.align	32	!# 15f
	nop
.align	32	!# 160
	nop
.align	32	!# 161
	nop
.align	32	!# 162
	nop
.align	32	!# 163
	nop
.align	32	!# 164
	nop
.align	32	!# 165
	nop
.align	32	!# 166
	nop
.align	32	!# 167
	nop
.align	32	!# 168
	nop
.align	32	!# 169
	nop
.align	32	!# 16a
	nop
.align	32	!# 16b
	nop
.align	32	!# 16c
	nop
.align	32	!# 16d
	nop
.align	32	!# 16e
	nop
.align	32	!# 16f
	nop
.align	32	!# 170
	nop
.align	32	!# 171
	nop
.align	32	!# 172
	nop
.align	32	!# 173
	nop
.align	32	!# 174
	nop
.align	32	!# 175
	nop
.align	32	!# 176
	nop
.align	32	!# 177
	nop
.align	32	!# 178
	nop
.align	32	!# 179
	nop
.align	32	!# 17a
	nop
.align	32	!# 17b
	nop
.align	32	!# 17c
	nop
.align	32	!# 17d
	nop
.align	32	!# 17e
	nop
.align	32	!# 17f
	nop
.align	32	!# 180
hptrap_demap_all_entry:
        or      0x80, %g0, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
	nop
.align	32	!# 181
	nop
.align	32	!# 182
	nop
.align	32	!# 183
	nop
.align	32	!# 184
	nop
.align	32	!# 185
	nop
.align	32	!# 186
	nop
.align	32	!# 187
	nop
.align	32	!# 188
	nop
.align	32	!# 189
	nop
.align	32	!# 18a
	nop
.align	32	!# 18b
	nop
.align	32	!# 18c
	nop
.align	32	!# 18d
	nop
.align	32	!# 18e
	nop
.align	32	!# 18f
	nop
.align	32	!# 190
	nop
.align	32	!# 191
	nop
.align	32	!# 192
	nop
.align	32	!# 193
	nop
.align	32	!# 194
	nop
.align	32	!# 195
	nop
.align	32	!# 196
	nop
.align	32	!# 197
	nop
.align	32	!# 198
	nop
.align	32	!# 199
	nop
.align	32	!# 19a
	nop
.align	32	!# 19b
	nop
.align	32	!# 19c
	nop
.align	32	!# 19d
	nop
.align	32	!# 19e
	nop
.align	32	!# 19f
	nop
.align	32	!# 1a0

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

!#*****************************************************************************************
SECTION .HPTRAPS_EXT_SECT   TEXT_VA=HPTRAPS_EXT_TEXT_PA, DATA_VA=HPTRAPS_EXT_DATA_PA
	
attr_text {
	Name=.HPTRAPS_EXT_SECT,
	hypervisor
}

.text
.global ext_trap_0x2b_begin
.global ext_trap_0x64_begin
.global ext_trap_0x68_begin
	
ext_trap_0x2b_begin:
	EXIT_GOOD
	
ext_trap_0x64_begin:
	EXIT_BAD
	
ext_trap_0x68_begin:
	EXIT_BAD
	
attr_data {
	Name=.HPTRAPS_EXT_SECT,
	hypervisor
}

.data
.global	tsb_base_mask
.global tsb_va_8k_mask
.global tsb_va_64k_mask
.global tsb_va_4m_mask
.global tsb_va_256m_mask
trap_0x64_save_registers:
.xword	0
.xword	0
.xword	0
.xword	0
.xword	0
.xword	0
.xword	0
.xword	0
trap_0x68_save_registers: 
.xword  0
.xword  0
.xword  0
.xword  0
.xword  0
.xword  0
.xword  0
.xword  0
!# TSB mask
tsb_base_mask:	
.xword	0x000000ffffffe000
.xword	0x000000ffffffc000
.xword	0x000000ffffff8000
.xword	0x000000ffffff0000
.xword	0x000000fffffe0000
.xword	0x000000fffffc0000
.xword	0x000000fffff80000
.xword	0x000000fffff00000
.xword	0x000000ffffe00000
.xword	0x000000ffffc00000
.xword	0x000000ffff800000
.xword	0x000000ffff000000
.xword	0x000000fffe000000
.xword	0x000000fffc000000
.xword	0x000000fff8000000
.xword	0x000000fff0000000
tsb_va_8k_mask:
.xword	0x00000000003fe000
.xword	0x00000000007fe000
.xword	0x0000000000ffe000
.xword	0x0000000001ffe000
.xword	0x0000000003ffe000
.xword	0x0000000007ffe000
.xword	0x000000000fffe000
.xword	0x000000001fffe000
.xword	0x000000003fffe000
.xword	0x000000007fffe000
.xword	0x00000000ffffe000
.xword	0x00000001ffffe000
.xword	0x00000003ffffe000
.xword	0x00000007ffffe000
.xword	0x0000000fffffe000
.xword	0x0000001fffffe000
tsb_va_64k_mask:
.xword	0x0000000001ff0000
.xword	0x0000000003ff0000
.xword	0x0000000007ff0000
.xword	0x000000000fff0000
.xword	0x000000001fff0000
.xword	0x000000003fff0000
.xword	0x000000007fff0000
.xword	0x00000000ffff0000
.xword	0x00000001ffff0000
.xword	0x00000003ffff0000
.xword	0x00000007ffff0000
.xword	0x0000000fffff0000
.xword	0x0000001fffff0000
.xword	0x0000003fffff0000
.xword	0x0000007fffff0000
.xword	0x000000ffffff0000
tsb_va_4m_mask:
.xword	0x000000007fc00000
.xword	0x00000000ffc00000
.xword	0x00000001ffc00000
.xword	0x00000003ffc00000
.xword	0x00000007ffc00000
.xword	0x0000000fffc00000
.xword	0x0000001fffc00000
.xword	0x0000003fffc00000
.xword	0x0000007fffc00000
.xword	0x000000ffffc00000
.xword	0x000001ffffc00000
.xword	0x000003ffffc00000
.xword	0x000007ffffc00000
.xword	0x00000fffffc00000
.xword	0x00001fffffc00000
.xword	0x00003fffffc00000
tsb_va_256m_mask:
.xword	0x0000001fe0000000
.xword	0x0000003fe0000000
.xword	0x0000007fe0000000
.xword	0x000000ffe0000000
.xword	0x000001ffe0000000
.xword	0x000003ffe0000000
.xword	0x000007ffe0000000
.xword	0x00000fffe0000000
.xword	0x00001fffe0000000
.xword	0x00003fffe0000000
.xword	0x00007fffe0000000
.xword	0x0000ffffe0000000
.xword	0x0001ffffe0000000
.xword	0x0003ffffe0000000
.xword	0x0007ffffe0000000
.xword	0x000fffffe0000000
phy_offset_list:	
.xword	THR0_PHY_OFF_0
.xword	THR1_PHY_OFF_0
.xword	THR2_PHY_OFF_0
.xword	THR3_PHY_OFF_0
.xword	THR4_PHY_OFF_0
.xword	THR5_PHY_OFF_0
.xword	THR6_PHY_OFF_0
.xword	THR7_PHY_OFF_0
	
!#*********************************************************************
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x00a7140000
attr_text {
	Name = .Thr0_User_Text_4v000,
	thr0_nz_ctx_tsb_3,
	VA = 0x0000a7140000,
	RA = 0x0015ad0000,
	PA = 0x0095ad0000,
	TTE_Context = 0x0c80,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0x0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	end_label   = Thr0_User_Text_4v000_text_end,
	compressimage,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
.global Thr0_User_Text_4v000_text_begin
Thr0_User_Text_4v000_text_begin:
	setx	Thr0_User_Data_4u100_data_begin, %g1, %g2
	ldx	[%g2], %g1
	EXIT_BAD
Thr0_User_Text_4v000_text_end:
!#*********************************************************************
SECTION .Thr0_User_Data_4u100 DATA_VA=0x00143c4000
attr_data {
	Name = .Thr0_User_Data_4u100,
	thr0_nz_ctx_tsb_2,
	VA = 0x0000143c4000,
	RA = 0x0111a26000,
	PA = 0x0091a26000,
	TTE_Context = 0x0c80,
	TTE_V       = 1,
	TTE_Size    = 0,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_EP      = 0,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 0,
	TTE_W       = 1,
	TTE_RSVD1   = 0,
	end_label   = Thr0_User_Data_4u100_data_end,
	compressimage,
	}
.data
.global Thr0_User_Data_4u100_data_begin
Thr0_User_Data_4u100_data_begin:
	.word	0
Thr0_User_Data_4u100_data_end:
!#*********************************************************************
SECTION .Thr1_User_Text_4u000 TEXT_VA=0x0c60000000
attr_text {
	Name = .Thr1_User_Text_4u000,
	thr1_nz_ctx_tsb_2,
	VA = 0x000c60000000,
	RA = 0x0010000000,
	PA = 0x0210000000,
	TTE_Context = 0x1ef0,
	TTE_V       = 1,
	TTE_Size    = 3,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_EP      = 1,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 0,
	TTE_W       = 0,
	TTE_RSVD1   = 0,
	end_label   = Thr1_User_Text_4u000_text_end,
	compressimage,
	}
.text
.global Thr1_user_code_entry
Thr1_user_code_entry:
.global Thr1_User_Text_4u000_text_begin
Thr1_User_Text_4u000_text_begin:
	setx	Thr1_User_Data_4v100_data_begin, %g1, %g2
	ldx	[%g2], %g1
	EXIT_BAD
Thr1_User_Text_4u000_text_end:
!#*********************************************************************
SECTION .Thr1_User_Data_4v100 DATA_VA=0x1120000000
attr_data {
	Name = .Thr1_User_Data_4v100,
	thr1_nz_ctx_tsb_3,
	VA = 0x001120000000,
	RA = 0x0020000000,
	PA = 0x00a0000000,
	TTE_Context = 0x1ef0,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0x0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 1,
	TTE_SW0     = 1,
	TTE_RSVD1   = 0,
	TTE_Size    = 5,
	end_label   = Thr1_User_Data_4v100_data_end,
	compressimage,
	}
.data
.global Thr1_User_Data_4v100_data_begin
Thr1_User_Data_4v100_data_begin:
	.word	0
Thr1_User_Data_4v100_data_end:
!#*********************************************************************
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x00a7830000
attr_text {
	Name = .Thr2_User_Text_4v000,
	thr2_nz_ctx_tsb_2,
	VA = 0x0000a7830000,
	RA = 0x0015e50000,
	PA = 0x0095e50000,
	TTE_Context = 0x1740,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0x0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	end_label   = Thr2_User_Text_4v000_text_end,
	compressimage,
	}
.text
.global Thr2_user_code_entry
Thr2_user_code_entry:
.global Thr2_User_Text_4v000_text_begin
Thr2_User_Text_4v000_text_begin:
	setx	Thr2_User_Data_4v100_data_begin, %g1, %g2
	ldx	[%g2], %g1
	EXIT_BAD
Thr2_User_Text_4v000_text_end:
!#*********************************************************************
SECTION .Thr2_User_Data_4v100 DATA_VA=0x00a7d80000
attr_data {
	Name = .Thr2_User_Data_4v100,
	thr2_nz_ctx_tsb_2,
	VA = 0x0000a7d80000,
	RA = 0x0045c00000,
	PA = 0x0245c00000,
	TTE_Context = 0x1740,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0x0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 1,
	end_label   = Thr2_User_Data_4v100_data_end,
	compressimage,
	}
.data
.global Thr2_User_Data_4v100_data_begin
Thr2_User_Data_4v100_data_begin:
	.word	0
Thr2_User_Data_4v100_data_end:
!#*********************************************************************
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x1470000000
attr_text {
	Name = .Thr3_User_Text_4v000,
	thr3_nz_ctx_tsb_0,
	VA = 0x001470000000,
	RA = 0x0180000000,
	PA = 0x0980000000,
	TTE_Context = 0x15c2,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0x0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 5,
	end_label   = Thr3_User_Text_4v000_text_end,
	compressimage,
	}
.text
.global Thr3_user_code_entry
Thr3_user_code_entry:
.global Thr3_User_Text_4v000_text_begin
Thr3_User_Text_4v000_text_begin:
	setx	Thr3_User_Data_4u100_data_begin, %g1, %g2
	ldx	[%g2], %g1
	EXIT_BAD
Thr3_User_Text_4v000_text_end:
!#*********************************************************************
SECTION .Thr3_User_Data_4u100 DATA_VA=0x00a7720000
attr_data {
	Name = .Thr3_User_Data_4u100,
	thr3_nz_ctx_tsb_2,
	VA = 0x0000a7720000,
	RA = 0x0445d00000,
	PA = 0x0c45d00000,
	TTE_Context = 0x15c2,
	TTE_V       = 1,
	TTE_Size    = 1,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_EP      = 0,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 0,
	TTE_W       = 1,
	TTE_RSVD1   = 0,
	end_label   = Thr3_User_Data_4u100_data_end,
	compressimage,
	}
.data
.global Thr3_User_Data_4u100_data_begin
Thr3_User_Data_4u100_data_begin:
	.word	0
Thr3_User_Data_4u100_data_end:
!#*********************************************************************
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x1670000000
attr_text {
	Name = .Thr4_User_Text_4v000,
	thr4_nz_ctx_tsb_3,
	VA = 0x001670000000,
	RA = 0x03f0000000,
	PA = 0x0bf0000000,
	TTE_Context = 0x0613,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0x0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 3,
	end_label   = Thr4_User_Text_4v000_text_end,
	compressimage,
	}
.text
.global Thr4_user_code_entry
Thr4_user_code_entry:
.global Thr4_User_Text_4v000_text_begin
Thr4_User_Text_4v000_text_begin:
	setx	Thr4_User_Data_4u100_data_begin, %g1, %g2
	ldx	[%g2], %g1
	EXIT_BAD
Thr4_User_Text_4v000_text_end:
!#*********************************************************************
SECTION .Thr4_User_Data_4u100 DATA_VA=0x00a7290000
attr_data {
	Name = .Thr4_User_Data_4u100,
	thr4_nz_ctx_tsb_2,
	VA = 0x0000a7290000,
	RA = 0x04452c0000,
	PA = 0x0c452c0000,
	TTE_Context = 0x0613,
	TTE_V       = 1,
	TTE_Size    = 1,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_EP      = 0,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 0,
	TTE_W       = 1,
	TTE_RSVD1   = 0,
	end_label   = Thr4_User_Data_4u100_data_end,
	compressimage,
	}
.data
.global Thr4_User_Data_4u100_data_begin
Thr4_User_Data_4u100_data_begin:
	.word	0
Thr4_User_Data_4u100_data_end:
!#*********************************************************************
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x0f20000000
attr_text {
	Name = .Thr5_User_Text_4v000,
	thr5_nz_ctx_tsb_2,
	VA = 0x000f20000000,
	RA = 0x03d0000000,
	PA = 0x0bd0000000,
	TTE_Context = 0x13dd,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0x0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 1,
	TTE_W       = 0,
	TTE_SW1     = 1,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 3,
	end_label   = Thr5_User_Text_4v000_text_end,
	compressimage,
	}
.text
.global Thr5_user_code_entry
Thr5_user_code_entry:
.global Thr5_User_Text_4v000_text_begin
Thr5_User_Text_4v000_text_begin:
	setx	Thr5_User_Data_4v100_data_begin, %g1, %g2
	ldx	[%g2], %g1
	EXIT_BAD
Thr5_User_Text_4v000_text_end:
!#*********************************************************************
SECTION .Thr5_User_Data_4v100 DATA_VA=0x14e0000000
attr_data {
	Name = .Thr5_User_Data_4v100,
	thr5_nz_ctx_tsb_2,
	VA = 0x0014e0000000,
	RA = 0x10a0000000,
	PA = 0x18a0000000,
	TTE_Context = 0x13dd,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0x0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 0,
	TTE_RSVD1   = 0,
	TTE_Size    = 3,
	end_label   = Thr5_User_Data_4v100_data_end,
	compressimage,
	}
.data
.global Thr5_User_Data_4v100_data_begin
Thr5_User_Data_4v100_data_begin:
	.word	0
Thr5_User_Data_4v100_data_end:
!#*********************************************************************
SECTION .Thr6_User_Text_4u000 TEXT_VA=0x00a7990000
attr_text {
	Name = .Thr6_User_Text_4u000,
	thr6_nz_ctx_tsb_3,
	VA = 0x0000a7990000,
	RA = 0x03ffff0000,
	PA = 0x0bffff0000,
	TTE_Context = 0x0c8a,
	TTE_V       = 1,
	TTE_Size    = 1,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_EP      = 1,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 0,
	TTE_W       = 0,
	TTE_RSVD1   = 0,
	end_label   = Thr6_User_Text_4u000_text_end,
	compressimage,
	}
.text
.global Thr6_user_code_entry
Thr6_user_code_entry:
.global Thr6_User_Text_4u000_text_begin
Thr6_User_Text_4u000_text_begin:
	setx	Thr6_User_Data_4u100_data_begin, %g1, %g2
	ldx	[%g2], %g1
	EXIT_BAD
Thr6_User_Text_4u000_text_end:
!#*********************************************************************
SECTION .Thr6_User_Data_4u100 DATA_VA=0x0b90000000
attr_data {
	Name = .Thr6_User_Data_4u100,
	thr6_nz_ctx_tsb_0,
	VA = 0x000b90000000,
	RA = 0x0400000000,
	PA = 0x0c00000000,
	TTE_Context = 0x0c8a,
	TTE_V       = 1,
	TTE_Size    = 3,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_EP      = 0,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 0,
	TTE_W       = 1,
	TTE_RSVD1   = 0,
	end_label   = Thr6_User_Data_4u100_data_end,
	compressimage,
	}
.data
.global Thr6_User_Data_4u100_data_begin
Thr6_User_Data_4u100_data_begin:
	.word	0
Thr6_User_Data_4u100_data_end:
!#*********************************************************************
SECTION .Thr7_User_Text_4u000 TEXT_VA=0x0c70000000
attr_text {
	Name = .Thr7_User_Text_4u000,
	thr7_nz_ctx_tsb_1,
	VA = 0x000c70000000,
	RA = 0x0340000000,
	PA = 0x0b40000000,
	TTE_Context = 0x0687,
	TTE_V       = 1,
	TTE_Size    = 5,
	TTE_NFO     = 0,
	TTE_IE      = 0,
	TTE_EP      = 1,
	TTE_L       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_E       = 0,
	TTE_P       = 0,
	TTE_W       = 0,
	TTE_RSVD1   = 0,
	end_label   = Thr7_User_Text_4u000_text_end,
	compressimage,
	}
.text
.global Thr7_user_code_entry
Thr7_user_code_entry:
.global Thr7_User_Text_4u000_text_begin
Thr7_User_Text_4u000_text_begin:
	setx	Thr7_User_Data_4v100_data_begin, %g1, %g2
	ldx	[%g2], %g1
	EXIT_BAD
Thr7_User_Text_4u000_text_end:
!#*********************************************************************
SECTION .Thr7_User_Data_4v000 DATA_VA=0x0014242000
attr_data {
	Name = .Thr7_User_Data_4v000,
	thr7_nz_ctx_tsb_2,
	VA = 0x000014242000,
	RA = 0x0000002000,
	PA = 0x0080002000,
	TTE_Context = 0x0687,
	TTE_V       = 1,
	TTE_NFO     = 0,
	TTE_L       = 0,
	TTE_Soft    = 0x0,
	TTE_IE      = 0,
	TTE_E       = 0,
	TTE_CP      = 1,
	TTE_CV      = 0,
	TTE_P       = 0,
	TTE_EP      = 0,
	TTE_W       = 1,
	TTE_SW1     = 0,
	TTE_SW0     = 1,
	TTE_RSVD1   = 0,
	TTE_Size    = 0,
	end_label   = Thr7_User_Data_4v100_data_end,
	compressimage,
	}
.data
.global Thr7_User_Data_4v100_data_begin
Thr7_User_Data_4v100_data_begin:
	EXIT_GOOD
Thr7_User_Data_4v100_data_end:
	.word	0
	
