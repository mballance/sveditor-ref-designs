/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_cmp_test_2.s
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
#define THR0_Z_CTX_TSB_CONFIG_0  0xc000000001000150
#define THR0_Z_CTX_TSB_CONFIG_1  0x8000000001010000
#define THR0_Z_CTX_TSB_CONFIG_2  0x8000000001020110
#define THR0_Z_CTX_TSB_CONFIG_3  0x8000000001030130
#define THR0_NZ_CTX_TSB_CONFIG_0 0x8000000001200050
#define THR0_NZ_CTX_TSB_CONFIG_1 0xa000000001210100
#define THR0_NZ_CTX_TSB_CONFIG_2 0x8000000001220110
#define THR0_NZ_CTX_TSB_CONFIG_3 0xe000000001230130
#define THR1_Z_CTX_TSB_CONFIG_0  0x8000000001040000
#define THR1_Z_CTX_TSB_CONFIG_1  0xa000000001050010
#define THR1_Z_CTX_TSB_CONFIG_2  0x8000000001060130
#define THR1_Z_CTX_TSB_CONFIG_3  0x8000000001070050
#define THR1_NZ_CTX_TSB_CONFIG_0 0xc000000001240150
#define THR1_NZ_CTX_TSB_CONFIG_1 0x8000000001250000
#define THR1_NZ_CTX_TSB_CONFIG_2 0xc000000001260110
#define THR1_NZ_CTX_TSB_CONFIG_3 0xa000000001270130
#define THR2_Z_CTX_TSB_CONFIG_0  0x8000000001080030
#define THR2_Z_CTX_TSB_CONFIG_1  0xa000000001090150
#define THR2_Z_CTX_TSB_CONFIG_2  0x80000000010a0000
#define THR2_Z_CTX_TSB_CONFIG_3  0x80000000010b0010
#define THR2_NZ_CTX_TSB_CONFIG_0 0xc000000001280010
#define THR2_NZ_CTX_TSB_CONFIG_1 0xe000000001290130
#define THR2_NZ_CTX_TSB_CONFIG_2 0xc0000000012a0150
#define THR2_NZ_CTX_TSB_CONFIG_3 0xc0000000012b0000
#define THR3_Z_CTX_TSB_CONFIG_0  0x80000000010c0030
#define THR3_Z_CTX_TSB_CONFIG_1  0xc0000000010d0150
#define THR3_Z_CTX_TSB_CONFIG_2  0xa0000000010e0000
#define THR3_Z_CTX_TSB_CONFIG_3  0x80000000010f0110
#define THR3_NZ_CTX_TSB_CONFIG_0 0x80000000012c0000
#define THR3_NZ_CTX_TSB_CONFIG_1 0xc0000000012d0110
#define THR3_NZ_CTX_TSB_CONFIG_2 0xc0000000012e0030
#define THR3_NZ_CTX_TSB_CONFIG_3 0x80000000012f0050
#define THR4_Z_CTX_TSB_CONFIG_0  0x8000000001100110
#define THR4_Z_CTX_TSB_CONFIG_1  0xc000000001110130
#define THR4_Z_CTX_TSB_CONFIG_2  0xa000000001120050
#define THR4_Z_CTX_TSB_CONFIG_3  0xc000000001130000
#define THR4_NZ_CTX_TSB_CONFIG_0 0xc000000001300130
#define THR4_NZ_CTX_TSB_CONFIG_1 0xc000000001310150
#define THR4_NZ_CTX_TSB_CONFIG_2 0xa000000001320000
#define THR4_NZ_CTX_TSB_CONFIG_3 0xc000000001330110
#define THR5_Z_CTX_TSB_CONFIG_0  0xa000000001140100
#define THR5_Z_CTX_TSB_CONFIG_1  0x8000000001150110
#define THR5_Z_CTX_TSB_CONFIG_2  0x8000000001160030
#define THR5_Z_CTX_TSB_CONFIG_3  0xe000000001170150
#define THR5_NZ_CTX_TSB_CONFIG_0 0x8000000001340010
#define THR5_NZ_CTX_TSB_CONFIG_1 0xc000000001350030
#define THR5_NZ_CTX_TSB_CONFIG_2 0xc000000001360050
#define THR5_NZ_CTX_TSB_CONFIG_3 0xc000000001370000
#define THR6_Z_CTX_TSB_CONFIG_0  0x8000000001180150
#define THR6_Z_CTX_TSB_CONFIG_1  0xa000000001190100
#define THR6_Z_CTX_TSB_CONFIG_2  0xa0000000011a0010
#define THR6_Z_CTX_TSB_CONFIG_3  0xc0000000011b0030
#define THR6_NZ_CTX_TSB_CONFIG_0 0x8000000001380150
#define THR6_NZ_CTX_TSB_CONFIG_1 0xa000000001390100
#define THR6_NZ_CTX_TSB_CONFIG_2 0x80000000013a0110
#define THR6_NZ_CTX_TSB_CONFIG_3 0xe0000000013b0030
#define THR7_Z_CTX_TSB_CONFIG_0  0x80000000011c0030
#define THR7_Z_CTX_TSB_CONFIG_1  0x80000000011d0150
#define THR7_Z_CTX_TSB_CONFIG_2  0xc0000000011e0100
#define THR7_Z_CTX_TSB_CONFIG_3  0x80000000011f0010
#define THR7_NZ_CTX_TSB_CONFIG_0 0xa0000000013c0130
#define THR7_NZ_CTX_TSB_CONFIG_1 0x80000000013d0150
#define THR7_NZ_CTX_TSB_CONFIG_2 0xa0000000013e0000
#define THR7_NZ_CTX_TSB_CONFIG_3 0xa0000000013f0110
#else
#define THR0_Z_CTX_TSB_CONFIG_0  0x4000000001000150
#define THR0_Z_CTX_TSB_CONFIG_1  0x0000000001010000
#define THR0_Z_CTX_TSB_CONFIG_2  0x0000000001020110
#define THR0_Z_CTX_TSB_CONFIG_3  0x0000000001030130
#define THR0_NZ_CTX_TSB_CONFIG_0 0x0000000001200050
#define THR0_NZ_CTX_TSB_CONFIG_1 0x2000000001210100
#define THR0_NZ_CTX_TSB_CONFIG_2 0x0000000001220110
#define THR0_NZ_CTX_TSB_CONFIG_3 0x6000000001230130
#define THR1_Z_CTX_TSB_CONFIG_0  0x0000000001040000
#define THR1_Z_CTX_TSB_CONFIG_1  0x2000000001050010
#define THR1_Z_CTX_TSB_CONFIG_2  0x0000000001060130
#define THR1_Z_CTX_TSB_CONFIG_3  0x0000000001070050
#define THR1_NZ_CTX_TSB_CONFIG_0 0x4000000001240150
#define THR1_NZ_CTX_TSB_CONFIG_1 0x0000000001250000
#define THR1_NZ_CTX_TSB_CONFIG_2 0x4000000001260110
#define THR1_NZ_CTX_TSB_CONFIG_3 0x2000000001270130
#define THR2_Z_CTX_TSB_CONFIG_0  0x0000000001080030
#define THR2_Z_CTX_TSB_CONFIG_1  0x2000000001090150
#define THR2_Z_CTX_TSB_CONFIG_2  0x00000000010a0000
#define THR2_Z_CTX_TSB_CONFIG_3  0x00000000010b0010
#define THR2_NZ_CTX_TSB_CONFIG_0 0x4000000001280010
#define THR2_NZ_CTX_TSB_CONFIG_1 0x6000000001290130
#define THR2_NZ_CTX_TSB_CONFIG_2 0x40000000012a0150
#define THR2_NZ_CTX_TSB_CONFIG_3 0x40000000012b0000
#define THR3_Z_CTX_TSB_CONFIG_0  0x00000000010c0030
#define THR3_Z_CTX_TSB_CONFIG_1  0x40000000010d0150
#define THR3_Z_CTX_TSB_CONFIG_2  0x20000000010e0000
#define THR3_Z_CTX_TSB_CONFIG_3  0x00000000010f0110
#define THR3_NZ_CTX_TSB_CONFIG_0 0x00000000012c0000
#define THR3_NZ_CTX_TSB_CONFIG_1 0x40000000012d0110
#define THR3_NZ_CTX_TSB_CONFIG_2 0x40000000012e0030
#define THR3_NZ_CTX_TSB_CONFIG_3 0x00000000012f0050
#define THR4_Z_CTX_TSB_CONFIG_0  0x0000000001100110
#define THR4_Z_CTX_TSB_CONFIG_1  0x4000000001110130
#define THR4_Z_CTX_TSB_CONFIG_2  0x2000000001120050
#define THR4_Z_CTX_TSB_CONFIG_3  0x4000000001130000
#define THR4_NZ_CTX_TSB_CONFIG_0 0x4000000001300130
#define THR4_NZ_CTX_TSB_CONFIG_1 0x4000000001310150
#define THR4_NZ_CTX_TSB_CONFIG_2 0x2000000001320000
#define THR4_NZ_CTX_TSB_CONFIG_3 0x4000000001330110
#define THR5_Z_CTX_TSB_CONFIG_0  0x2000000001140100
#define THR5_Z_CTX_TSB_CONFIG_1  0x0000000001150110
#define THR5_Z_CTX_TSB_CONFIG_2  0x0000000001160030
#define THR5_Z_CTX_TSB_CONFIG_3  0x6000000001170150
#define THR5_NZ_CTX_TSB_CONFIG_0 0x0000000001340010
#define THR5_NZ_CTX_TSB_CONFIG_1 0x4000000001350030
#define THR5_NZ_CTX_TSB_CONFIG_2 0x4000000001360050
#define THR5_NZ_CTX_TSB_CONFIG_3 0x4000000001370000
#define THR6_Z_CTX_TSB_CONFIG_0  0x0000000001180150
#define THR6_Z_CTX_TSB_CONFIG_1  0x2000000001190100
#define THR6_Z_CTX_TSB_CONFIG_2  0x20000000011a0010
#define THR6_Z_CTX_TSB_CONFIG_3  0x40000000011b0030
#define THR6_NZ_CTX_TSB_CONFIG_0 0x0000000001380150
#define THR6_NZ_CTX_TSB_CONFIG_1 0x2000000001390100
#define THR6_NZ_CTX_TSB_CONFIG_2 0x00000000013a0110
#define THR6_NZ_CTX_TSB_CONFIG_3 0x60000000013b0030
#define THR7_Z_CTX_TSB_CONFIG_0  0x00000000011c0030
#define THR7_Z_CTX_TSB_CONFIG_1  0x00000000011d0150
#define THR7_Z_CTX_TSB_CONFIG_2  0x40000000011e0100
#define THR7_Z_CTX_TSB_CONFIG_3  0x00000000011f0010
#define THR7_NZ_CTX_TSB_CONFIG_0 0x20000000013c0130
#define THR7_NZ_CTX_TSB_CONFIG_1 0x00000000013d0150
#define THR7_NZ_CTX_TSB_CONFIG_2 0x20000000013e0000
#define THR7_NZ_CTX_TSB_CONFIG_3 0x20000000013f0110
#endif
#define THR0_REAL_RANGE_0 0x8000080000000000
#define THR0_REAL_RANGE_1 0x8000100000000000
#define THR0_REAL_RANGE_2 0x8000200000000000
#define THR0_REAL_RANGE_3 0x8001000000000000
#define THR1_REAL_RANGE_0 0x8000080000000000
#define THR1_REAL_RANGE_1 0x8000100000000000
#define THR1_REAL_RANGE_2 0x8000200000000000
#define THR1_REAL_RANGE_3 0x8001000000000000
#define THR2_REAL_RANGE_0 0x8000080000000000
#define THR2_REAL_RANGE_1 0x8000100000000000
#define THR2_REAL_RANGE_2 0x8000200000000000
#define THR2_REAL_RANGE_3 0x8001000000000000
#define THR3_REAL_RANGE_0 0x8000080000000000
#define THR3_REAL_RANGE_1 0x8000100000000000
#define THR3_REAL_RANGE_2 0x8000200000000000
#define THR3_REAL_RANGE_3 0x8001000000000000
#define THR4_REAL_RANGE_0 0x8000080000000000
#define THR4_REAL_RANGE_1 0x8000100000000000
#define THR4_REAL_RANGE_2 0x8000200000000000
#define THR4_REAL_RANGE_3 0x8001000000000000
#define THR5_REAL_RANGE_0 0x8000080000000000
#define THR5_REAL_RANGE_1 0x8000100000000000
#define THR5_REAL_RANGE_2 0x8000200000000000
#define THR5_REAL_RANGE_3 0x8001000000000000
#define THR6_REAL_RANGE_0 0x8000080000000000
#define THR6_REAL_RANGE_1 0x8000100000000000
#define THR6_REAL_RANGE_2 0x8000200000000000
#define THR6_REAL_RANGE_3 0x8001000000000000
#define THR7_REAL_RANGE_0 0x8000080000000000
#define THR7_REAL_RANGE_1 0x8000100000000000
#define THR7_REAL_RANGE_2 0x8000200000000000
#define THR7_REAL_RANGE_3 0x8001000000000000
#define THR0_PHY_OFF_0 0x0000000000000000
#define THR0_PHY_OFF_1 0x0000000400000000
#define THR0_PHY_OFF_2 0x0000000800000000
#define THR0_PHY_OFF_3 0x0000000c00000000
#define THR1_PHY_OFF_0 0x0000001000000000
#define THR1_PHY_OFF_1 0x0000001400000000
#define THR1_PHY_OFF_2 0x0000001800000000
#define THR1_PHY_OFF_3 0x0000001c00000000
#define THR2_PHY_OFF_0 0x0000002000000000
#define THR2_PHY_OFF_1 0x0000002400000000
#define THR2_PHY_OFF_2 0x0000002800000000
#define THR2_PHY_OFF_3 0x0000002c00000000
#define THR3_PHY_OFF_0 0x0000003000000000
#define THR3_PHY_OFF_1 0x0000003400000000
#define THR3_PHY_OFF_2 0x0000003800000000
#define THR3_PHY_OFF_3 0x0000003c00000000
#define THR4_PHY_OFF_0 0x0000004000000000
#define THR4_PHY_OFF_1 0x0000004400000000
#define THR4_PHY_OFF_2 0x0000004800000000
#define THR4_PHY_OFF_3 0x0000004c00000000
#define THR5_PHY_OFF_0 0x0000005000000000
#define THR5_PHY_OFF_1 0x0000005400000000
#define THR5_PHY_OFF_2 0x0000005800000000
#define THR5_PHY_OFF_3 0x0000005c00000000
#define THR6_PHY_OFF_0 0x0000006000000000
#define THR6_PHY_OFF_1 0x0000006400000000
#define THR6_PHY_OFF_2 0x0000006800000000
#define THR6_PHY_OFF_3 0x0000006c00000000
#define THR7_PHY_OFF_0 0x0000007000000000
#define THR7_PHY_OFF_1 0x0000007400000000
#define THR7_PHY_OFF_2 0x0000007800000000
#define THR7_PHY_OFF_3 0x0000007c00000000
#define THR_0_PARTID 4
#define THR_1_PARTID 5
#define THR_2_PARTID 7
#define THR_3_PARTID 1
#define THR_4_PARTID 5
#define THR_5_PARTID 2
#define THR_6_PARTID 6
#define THR_7_PARTID 3
#define NUCLEUS 0x0
#define THR0_PCONTEXT_0 0x0807
#define THR0_PCONTEXT_1 0x01dd
#define THR0_SCONTEXT_0 0x1ace
#define THR0_SCONTEXT_1 0x0286
#define THR1_PCONTEXT_0 0x18e3
#define THR1_PCONTEXT_1 0x1c25
#define THR1_SCONTEXT_0 0x1bc8
#define THR1_SCONTEXT_1 0x1a24
#define THR2_PCONTEXT_0 0x12a1
#define THR2_PCONTEXT_1 0x1ba5
#define THR2_SCONTEXT_0 0x09a1
#define THR2_SCONTEXT_1 0x0a3d
#define THR3_PCONTEXT_0 0x1412
#define THR3_PCONTEXT_1 0x0bad
#define THR3_SCONTEXT_0 0x1291
#define THR3_SCONTEXT_1 0x197f
#define THR4_PCONTEXT_0 0x0ee3
#define THR4_PCONTEXT_1 0x10cb
#define THR4_SCONTEXT_0 0x1cf3
#define THR4_SCONTEXT_1 0x16bb
#define THR5_PCONTEXT_0 0x0a49
#define THR5_PCONTEXT_1 0x12f7
#define THR5_SCONTEXT_0 0x1b71
#define THR5_SCONTEXT_1 0x021e
#define THR6_PCONTEXT_0 0x0ebb
#define THR6_PCONTEXT_1 0x1a67
#define THR6_SCONTEXT_0 0x0066
#define THR6_SCONTEXT_1 0x0aa7
#define THR7_PCONTEXT_0 0x1cad
#define THR7_PCONTEXT_1 0x1dba
#define THR7_SCONTEXT_0 0x1799
#define THR7_SCONTEXT_1 0x0764
#define THR0_PTRAP_TEXT_VA 0x600000fb0000
#define THR0_PTRAP_TEXT_RA 0x03b01c0000
#define THR0_PTRAP_TEXT_PA 0x0fb01c0000
#define THR1_PTRAP_TEXT_VA 0x640000640000
#define THR1_PTRAP_TEXT_RA 0x03c0830000
#define THR1_PTRAP_TEXT_PA 0x03c0830000
#define THR2_PTRAP_TEXT_VA 0x680000060000
#define THR2_PTRAP_TEXT_RA 0x03d0100000
#define THR2_PTRAP_TEXT_PA 0x03d0100000
#define THR3_PTRAP_TEXT_VA 0x6c0000920000
#define THR3_PTRAP_TEXT_RA 0x03e0070000
#define THR3_PTRAP_TEXT_PA 0x3fe0070000
#define THR4_PTRAP_TEXT_VA 0x700000ce0000
#define THR4_PTRAP_TEXT_RA 0x03f0980000
#define THR4_PTRAP_TEXT_PA 0x4ff0980000
#define THR5_PTRAP_TEXT_VA 0x7400001d0000
#define THR5_PTRAP_TEXT_RA 0x0010c20000
#define THR5_PTRAP_TEXT_PA 0x5010c20000
#define THR6_PTRAP_TEXT_VA 0x780000420000
#define THR6_PTRAP_TEXT_RA 0x0020860000
#define THR6_PTRAP_TEXT_PA 0x0020860000
#define THR7_PTRAP_TEXT_VA 0x7c0000190000
#define THR7_PTRAP_TEXT_RA 0x00302c0000
#define THR7_PTRAP_TEXT_PA 0x00302c0000
#include "mmu_hred.s"
/*********************************************************************/
SECTION .Thr0_Priv_Sect TEXT_VA=0x5ff000046000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_1
	VA = 0x5ff000046000 ,
	RA = 0x0080046000 ,
	PA = 0x0c80046000 ,
	TTE_Context = 0x0807 ,
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
SECTION .Thr1_Priv_Sect TEXT_VA=0x63100009e000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_1
	VA = 0x63100009e000 ,
	RA = 0x0090084000 ,
	PA = 0x0090084000 ,
	TTE_Context = 0x18e3 ,
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
SECTION .Thr2_Priv_Sect TEXT_VA=0x6720001aa000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_3
	VA = 0x6720001aa000 ,
	RA = 0x00a01fe000 ,
	PA = 0x00a01fe000 ,
	TTE_Context = 0x12a1 ,
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
SECTION .Thr3_Priv_Sect TEXT_VA=0x6b3000146000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_0
	VA = 0x6b3000146000 ,
	RA = 0x00b0184000 ,
	PA = 0x00b0184000 ,
	TTE_Context = 0x1412 ,
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
SECTION .Thr4_Priv_Sect TEXT_VA=0x6f400015a000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_2
	VA = 0x6f400015a000 ,
	RA = 0x00c01a2000 ,
	PA = 0x00c01a2000 ,
	TTE_Context = 0x0ee3 ,
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
SECTION .Thr5_Priv_Sect TEXT_VA=0x7350000a2000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_3
	VA = 0x7350000a2000 ,
	RA = 0x00d0156000 ,
	PA = 0x00d0156000 ,
	TTE_Context = 0x0a49 ,
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
SECTION .Thr6_Priv_Sect TEXT_VA=0x7760001dc000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_1
	VA = 0x7760001dc000 ,
	RA = 0x00e01d6000 ,
	PA = 0x6ce01d6000 ,
	TTE_Context = 0x0ebb ,
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
SECTION .Thr7_Priv_Sect TEXT_VA=0x7b70001b8000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x7b70001b8000 ,
	RA = 0x00f010e000 ,
	PA = 0x00f010e000 ,
	TTE_Context = 0x1cad ,
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
	thr0_z_ctx_tsb_2
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
	TTE_W       =           0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr0_Ptrap_Sect_text_end ,
	compressimage ,
	}
#include "mmu_ptrap.s"
Thr0_Ptrap_Sect_text_end:
/*********************************************************************/
SECTION .Thr1_Ptrap_Sect TEXT_VA=THR1_PTRAP_TEXT_VA
attr_text {
	Name = .Thr1_Ptrap_Sect ,
	thr1_z_ctx_tsb_1
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
	TTE_P       =           0 ,
	TTE_EP      = 1 ,
	TTE_W       =           0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr1_Ptrap_Sect_text_end ,
	compressimage ,
	}
#include "mmu_ptrap.s"
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
	TTE_W       =           0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr2_Ptrap_Sect_text_end ,
	compressimage ,
	}
#include "mmu_ptrap.s"
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
	TTE_P       =           1 ,
	TTE_EP      = 1 ,
	TTE_W       =           1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr3_Ptrap_Sect_text_end ,
	compressimage ,
	}
#include "mmu_ptrap.s"
Thr3_Ptrap_Sect_text_end:
/*********************************************************************/
SECTION .Thr4_Ptrap_Sect TEXT_VA=THR4_PTRAP_TEXT_VA
attr_text {
	Name = .Thr4_Ptrap_Sect ,
	thr4_z_ctx_tsb_0
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
	TTE_P       =           1 ,
	TTE_EP      = 1 ,
	TTE_W       =           0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr4_Ptrap_Sect_text_end ,
	compressimage ,
	}
#include "mmu_ptrap.s"
Thr4_Ptrap_Sect_text_end:
/*********************************************************************/
SECTION .Thr5_Ptrap_Sect TEXT_VA=THR5_PTRAP_TEXT_VA
attr_text {
	Name = .Thr5_Ptrap_Sect ,
	thr5_z_ctx_tsb_1
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
	TTE_P       =           0 ,
	TTE_EP      = 1 ,
	TTE_W       =           1 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr5_Ptrap_Sect_text_end ,
	compressimage ,
	}
#include "mmu_ptrap.s"
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
	TTE_P       =           1 ,
	TTE_EP      = 1 ,
	TTE_W       =           0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	end_label   = Thr6_Ptrap_Sect_text_end ,
	compressimage ,
	}
#include "mmu_ptrap.s"
Thr6_Ptrap_Sect_text_end:
/*********************************************************************/
SECTION .Thr7_Ptrap_Sect TEXT_VA=THR7_PTRAP_TEXT_VA
attr_text {
	Name = .Thr7_Ptrap_Sect ,
	thr7_z_ctx_tsb_3
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
#include "mmu_ptrap.s"
Thr7_Ptrap_Sect_text_end:
#include "mmu_hptrap.s"
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
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
Thr1_register_initial_values:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
Thr2_register_initial_values:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
Thr3_register_initial_values:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
Thr4_register_initial_values:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
Thr5_register_initial_values:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
Thr6_register_initial_values:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
Thr7_register_initial_values:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
.align 32
hptrap_itte_begin:
	.xword	0x00006000007b0807	!0
	.xword	0x8000000fb0b20081	
	.xword	0x00005ff0000c41dd	!1
	.xword	0x8000000c801ae080	
	.xword	0x0000600000b50000	!2
	.xword	0x8000000fb0320481	
	.xword	0x00005ff00011e1dd	!3
	.xword	0x8000000c80078080	
	.xword	0x000061000a000807	!4
	.xword	0x8000000d84800083	
	.xword	0x00005ff0000f0000	!5
	.xword	0x80000000801e8480	
	.xword	0x0000610039000807	!6
	.xword	0x8000000d85000083	
	.xword	0x00005ff00017e1dd	!7
	.xword	0x8000000c80138080	
	.xword	0x0000620b80000807	!8
	.xword	0x8000000060000085	
	.xword	0x00005ff0000261dd	!9
	.xword	0x8000000c8010a080	
	.xword	0x00005ff0000361dd	!10
	.xword	0x8000000c800be080	
	.xword	0x00006000003e0807	!11
	.xword	0x8000000fb0460081	
	.xword	0x00005ff0001f81dd	!12
	.xword	0x8000000c8008e080	
	.xword	0x00005ff0000f21dd	!13
	.xword	0x8000000c8014e080	
	.xword	0x000061000ec00807	!14
	.xword	0x8000000d89400083	
	.xword	0x0000610020000807	!15
	.xword	0x8000000d84c00083	
	.xword	0x00005ff0000fa1dd	!16
	.xword	0x8000000c800bc080	
	.xword	0x00006000006f0807	!17
	.xword	0x8000000fb0840081	
	.xword	0x000061003ec00807	!18
	.xword	0x8000000d8e000083	
	.xword	0x0000620b00000807	!19
	.xword	0x8000000110000085	
	.xword	0x00005ff0000081dd	!20
	.xword	0x8000000c80196080	
	.xword	0x0000640000d218e3	!21
	.xword	0x8000001fc0d60081	
	.xword	0x00006310000c78e3	!22
	.xword	0x80000000901aa080	
	.xword	0x00006400003d0000	!23
	.xword	0x80000003c06e0481	
	.xword	0x000065002b001c25	!24
	.xword	0x8000001d92c00083	
	.xword	0x00006310001158e3	!25
	.xword	0x800000009004e080	
	.xword	0x0000650021000000	!26
	.xword	0x8000001d9c400483	
	.xword	0x0000650023001c25	!27
	.xword	0x8000001d9f000083	
	.xword	0x00006310000118e3	!28
	.xword	0x8000000090010080	
	.xword	0x000065003e000000	!29
	.xword	0x8000001d9d800483	
	.xword	0x00006310000858e3	!30
	.xword	0x80000000901d8080	
	.xword	0x00006400009318e3	!31
	.xword	0x8000001fc0110081	
	.xword	0x0000640000bd18e3	!32
	.xword	0x8000001fc0b60081	
	.xword	0x0000640000a318e3	!33
	.xword	0x8000001fc07f0081	
	.xword	0x00006310000018e3	!34
	.xword	0x80000000900ce080	
	.xword	0x00006400005f18e3	!35
	.xword	0x8000001fc0000081	
	.xword	0x000063100019f8e3	!36
	.xword	0x8000000090070080	
	.xword	0x00006310001b18e3	!37
	.xword	0x80000000901a8080	
	.xword	0x00006310001e78e3	!38
	.xword	0x8000000090026080	
	.xword	0x00006400002318e3	!39
	.xword	0x8000001fc0fb0081	
	.xword	0x00006720000432a1	!40
	.xword	0x80000000a005a480	
	.xword	0x00006720000ed2a1	!41
	.xword	0x80000000a01ea480	
	.xword	0x000067200002a000	!42
	.xword	0x80000000a016c080	
	.xword	0x0000680000da12a1	!43
	.xword	0x80000003d0800481	
	.xword	0x00006720000f72a1	!44
	.xword	0x80000000a0198480	
	.xword	0x000069003a800000	!45
	.xword	0x80000001a5800083	
	.xword	0x00006720000c92a1	!46
	.xword	0x80000000a0002480	
	.xword	0x0000680000aa12a1	!47
	.xword	0x80000003d0700481	
	.xword	0x00006800000b0000	!48
	.xword	0x80000003d04d0081	
	.xword	0x00006900300012a1	!49
	.xword	0x8000002da8400483	
	.xword	0x000067200003c000	!50
	.xword	0x80000000a0032080	
	.xword	0x000069002e4012a1	!51
	.xword	0x8000002dac800483	
	.xword	0x00006800003f12a1	!52
	.xword	0x80000003d0c30481	
	.xword	0x00006a02800012a1	!53
	.xword	0x8000002e80000485	
	.xword	0x0000690013c012a1	!54
	.xword	0x8000002da9800483	
	.xword	0x00006800001712a1	!55
	.xword	0x80000003d0e90481	
	.xword	0x00006800005d12a1	!56
	.xword	0x80000003d09f0481	
	.xword	0x000067200007d2a1	!57
	.xword	0x80000000a007c480	
	.xword	0x0000680000fc12a1	!58
	.xword	0x80000003d04a0481	
	.xword	0x00006d001a001412	!59
	.xword	0x80000001b8800483	
	.xword	0x00006e0660001412	!60
	.xword	0x8000000230000485	
	.xword	0x00006b30001ac000	!61
	.xword	0x80000000b01ec080	
	.xword	0x00006c0000591412	!62
	.xword	0x8000003fe0f40481	
	.xword	0x00006b3000189412	!63
	.xword	0x80000000b01ee480	
	.xword	0x00006b300006e000	!64
	.xword	0x80000000b012e080	
	.xword	0x00006b3000107412	!65
	.xword	0x80000000b01a0480	
	.xword	0x00006b3000131412	!66
	.xword	0x80000000b002e480	
	.xword	0x00006c0000940000	!67
	.xword	0x8000003fe0280081	
	.xword	0x00006b30001ff412	!68
	.xword	0x80000000b0080480	
	.xword	0x00006c0000031412	!69
	.xword	0x8000003fe0490481	
	.xword	0x00006b3000078000	!70
	.xword	0x80000000b009c080	
	.xword	0x00006c0000be1412	!71
	.xword	0x8000003fe0900481	
	.xword	0x00006c0000371412	!72
	.xword	0x8000003fe0ff0481	
	.xword	0x00006c0000311412	!73
	.xword	0x8000003fe0df0481	
	.xword	0x00006c0000971412	!74
	.xword	0x8000003fe0f70481	
	.xword	0x00006b30001ef412	!75
	.xword	0x80000000b0182480	
	.xword	0x00006e0210001412	!76
	.xword	0x80000002c0000485	
	.xword	0x00006c00001c1412	!77
	.xword	0x8000003fe0bf0481	
	.xword	0x00006c0000d61412	!78
	.xword	0x8000003fe0970481	
	.xword	0x00006d002e001412	!79
	.xword	0x80000001bb000483	
	.xword	0x00006d001bc01412	!80
	.xword	0x80000001bf800483	
	.xword	0x00006c0000ba1412	!81
	.xword	0x8000003fe0010481	
	.xword	0x0000700000f10ee3	!82
	.xword	0x8000004ff0680081	
	.xword	0x00006f40000a10cb	!83
	.xword	0x80000000c01a4080	
	.xword	0x00006f4000180000	!84
	.xword	0x80000000c0034080	
	.xword	0x0000700000700ee3	!85
	.xword	0x8000004ff0290081	
	.xword	0x00006f400008d0cb	!86
	.xword	0x80000000c01c2080	
	.xword	0x00007000006b0000	!87
	.xword	0x8000004ff0620081	
	.xword	0x0000700000510ee3	!88
	.xword	0x8000004ff03e0081	
	.xword	0x00006f40001630cb	!89
	.xword	0x80000000c0150080	
	.xword	0x0000700000440000	!90
	.xword	0x8000004ff03f0081	
	.xword	0x00006f40000b70cb	!91
	.xword	0x80000000c00e2080	
	.xword	0x00006f40001cd0cb	!92
	.xword	0x80000000c005c080	
	.xword	0x0000700000390ee3	!93
	.xword	0x8000004ff01b0081	
	.xword	0x0000700000630ee3	!94
	.xword	0x8000004ff0340081	
	.xword	0x00006f40000610cb	!95
	.xword	0x80000000c0134080	
	.xword	0x00006f40000c30cb	!96
	.xword	0x80000000c019e080	
	.xword	0x0000700000f60ee3	!97
	.xword	0x8000004ff00e0081	
	.xword	0x0000720b20000ee3	!98
	.xword	0x8000004ea0000085	
	.xword	0x000071002a800ee3	!99
	.xword	0x8000004dcd000083	
	.xword	0x0000710015000ee3	!100
	.xword	0x8000004dcdc00083	
	.xword	0x000075000dc00a49	!101
	.xword	0x80000001de400083	
	.xword	0x0000740000360a49	!102
	.xword	0x8000000010ec0081	
	.xword	0x000075002d400000	!103
	.xword	0x80000001da400083	
	.xword	0x00007350001e2a49	!104
	.xword	0x80000000d00aa080	
	.xword	0x000075003bc00a49	!105
	.xword	0x80000001d0000083	
	.xword	0x00007350001bc000	!106
	.xword	0x8000005cd01e2080	
	.xword	0x00007350001cea49	!107
	.xword	0x80000000d0106080	
	.xword	0x0000740000410a49	!108
	.xword	0x8000000010dd0081	
	.xword	0x0000740000ff0000	!109
	.xword	0x8000005010450081	
	.xword	0x0000735000074a49	!110
	.xword	0x80000000d0174080	
	.xword	0x00007400009b0a49	!111
	.xword	0x8000000010140081	
	.xword	0x0000740000340000	!112
	.xword	0x8000005010c10081	
	.xword	0x0000735000002a49	!113
	.xword	0x80000000d010c080	
	.xword	0x0000750014800000	!114
	.xword	0x80000001d9c00083	
	.xword	0x0000740000ad0a49	!115
	.xword	0x8000000010c00081	
	.xword	0x0000750011000a49	!116
	.xword	0x80000001d7800083	
	.xword	0x0000740000a40a49	!117
	.xword	0x80000000104b0081	
	.xword	0x00007350001f0a49	!118
	.xword	0x80000000d0076080	
	.xword	0x00007350001b2a49	!119
	.xword	0x80000000d0062080	
	.xword	0x00007350001c2a49	!120
	.xword	0x80000000d01cc080	
	.xword	0x0000740000f30a49	!121
	.xword	0x8000000010210081	
	.xword	0x00007760001f5a67	!122
	.xword	0x8000006ce00b4480	
	.xword	0x00007760001dfa67	!123
	.xword	0x8000006ce0194480	
	.xword	0x0000780000c70000	!124
	.xword	0x8000000020f50081	
	.xword	0x0000780000ae0ebb	!125
	.xword	0x80000064202b0481	
	.xword	0x0000776000005a67	!126
	.xword	0x8000006ce0116480	
	.xword	0x00007760000ca000	!127
	.xword	0x8000006ce01a6080	
	.xword	0x00007a02c0000ebb	!128
	.xword	0x8000006e60000485	
	.xword	0x00007760000ffa67	!129
	.xword	0x8000006ce001e480	
	.xword	0x000077600016a000	!130
	.xword	0x8000006ce00a0080	
	.xword	0x0000780000220ebb	!131
	.xword	0x8000006420400481	
	.xword	0x0000790003800000	!132
	.xword	0x80000001e2400083	
	.xword	0x0000776000049a67	!133
	.xword	0x8000006ce015e480	
	.xword	0x0000780000260ebb	!134
	.xword	0x8000006420660481	
	.xword	0x0000780000430ebb	!135
	.xword	0x80000064207a0481	
	.xword	0x0000776000057a67	!136
	.xword	0x8000006ce00da480	
	.xword	0x00007760001e5a67	!137
	.xword	0x8000006ce007a480	
	.xword	0x00007b70000dfdba	!138
	.xword	0x80000000f0018480	
	.xword	0x00007d003d001dba	!139
	.xword	0x8000007df3800483	
	.xword	0x00007b700014e000	!140
	.xword	0x8000007cf017c480	
	.xword	0x00007c0000cb1dba	!141
	.xword	0x80000074307e0481	
	.xword	0x00007c0000781dba	!142
	.xword	0x8000007430b80481	
	.xword	0x00007d0002000000	!143
	.xword	0x80000001f1c00483	
	.xword	0x00007b700014ddba	!144
	.xword	0x80000000f0006480	
	.xword	0x00007b7000129dba	!145
	.xword	0x80000000f0186480	
	.xword	0x00007b70000b8000	!146
	.xword	0x8000007cf0158480	
	.xword	0x00007b70001eddba	!147
	.xword	0x80000000f0028480	
	.xword	0x00007b70001ebdba	!148
	.xword	0x80000000f0188480	
	.xword	0x00007b70001f7dba	!149
	.xword	0x80000000f013a480	
	.xword	0x00007b700000fdba	!150
	.xword	0x80000000f0170480	
	.xword	0x00007b7000133dba	!151
	.xword	0x80000000f0048480	
	.xword	0x00007c0000af1dba	!152
	.xword	0x8000007430b30481	
	.xword	0x00007e08b0001cad	!153
	.xword	0x8000007d70000485	
	.xword	0x00007b7000157dba	!154
	.xword	0x80000000f0020480	
	.xword	0x00007b70000a5dba	!155
	.xword	0x80000000f0054480	
	.xword	0x00007c0000d51dba	!156
	.xword	0x8000007430f60481	
	.xword	0x00007b7000017dba	!157
	.xword	0x80000000f0168480	
hptrap_itte_end:
	.xword	158
.align 32
hptrap_dtte_begin:
	.xword	0x00005ff0001521dd	!0
	.xword	0x8000000c800d8440	
	.xword	0x0000600000901ace	!1
	.xword	0x8000000fb0120041	
	.xword	0x0000610017c00000	!2
	.xword	0x8000000d84400043	
	.xword	0x0000610037000807	!3
	.xword	0x8000000d86000443	
	.xword	0x0000600000f91ace	!4
	.xword	0x8000000fb09b0041	
	.xword	0x0000600000910000	!5
	.xword	0x8000000fb0ef0041	
	.xword	0x00005ff00009a1dd	!6
	.xword	0x8000000c801d2440	
	.xword	0x0000620640001ace	!7
	.xword	0x8000000200000045	
	.xword	0x00005ff0000581dd	!8
	.xword	0x8000000c80038440	
	.xword	0x00005ff0001f2286	!9
	.xword	0x8000000c8014a040	
	.xword	0x00005ff0001ca1dd	!10
	.xword	0x8000000c8017e440	
	.xword	0x0000600000f80807	!11
	.xword	0x8000000fb0e80441	
	.xword	0x00006000000a0807	!12
	.xword	0x8000000fb0270441	
	.xword	0x00006206d0000807	!13
	.xword	0x8000000100000445	
	.xword	0x00005ff0001441dd	!14
	.xword	0x8000000c8005e440	
	.xword	0x0000600000960807	!15
	.xword	0x8000000fb08e0441	
	.xword	0x0000620cd0000807	!16
	.xword	0x80000003a0000445	
	.xword	0x0000600000b60807	!17
	.xword	0x8000000fb0c40441	
	.xword	0x0000600000ac0807	!18
	.xword	0x8000000fb09e0441	
	.xword	0x0000600000820807	!19
	.xword	0x8000000fb0d30441	
	.xword	0x0000600000330807	!20
	.xword	0x8000000fb0dc0441	
	.xword	0x00005ff00005e1dd	!21
	.xword	0x8000000c80030440	
	.xword	0x00005ff0000801dd	!22
	.xword	0x8000000c800a2440	
	.xword	0x00005ff0001221dd	!23
	.xword	0x8000000c801b8440	
	.xword	0x00006000003c0807	!24
	.xword	0x8000000fb06b0441	
	.xword	0x0000650027401c25	!25
	.xword	0x8000001d9ec00043	
	.xword	0x00006400005c1bc8	!26
	.xword	0x8000001fc0540441	
	.xword	0x0000640000c50000	!27
	.xword	0x80000003c0130441	
	.xword	0x00006310000778e3	!28
	.xword	0x80000000900ae040	
	.xword	0x0000640000891bc8	!29
	.xword	0x8000001fc0db0441	
	.xword	0x0000640000b00000	!30
	.xword	0x80000003c03a0441	
	.xword	0x000065002f401c25	!31
	.xword	0x8000001d9d400043	
	.xword	0x000065003e801a24	!32
	.xword	0x8000001d92800443	
	.xword	0x00006310001e0000	!33
	.xword	0x8000000090140440	
	.xword	0x000065003c001c25	!34
	.xword	0x8000001d95400043	
	.xword	0x000063100013c000	!35
	.xword	0x8000000090152440	
	.xword	0x000063100007b8e3	!36
	.xword	0x8000000090132040	
	.xword	0x0000650002401c25	!37
	.xword	0x8000001d9b800043	
	.xword	0x000063100016d8e3	!38
	.xword	0x80000000900de040	
	.xword	0x00006310000638e3	!39
	.xword	0x8000000090096040	
	.xword	0x00006310001a78e3	!40
	.xword	0x8000000090052040	
	.xword	0x00006310000ef8e3	!41
	.xword	0x800000009000a040	
	.xword	0x00006400000d18e3	!42
	.xword	0x8000001fc0c60041	
	.xword	0x00006310001518e3	!43
	.xword	0x8000000090000040	
	.xword	0x00006607f00018e3	!44
	.xword	0x8000001e10000045	
	.xword	0x0000640000d918e3	!45
	.xword	0x8000001fc0d70041	
	.xword	0x000067200017d2a1	!46
	.xword	0x80000000a0074040	
	.xword	0x00006a00400009a1	!47
	.xword	0x8000002e20000445	
	.xword	0x000067200006c000	!48
	.xword	0x80000000a00b0440	
	.xword	0x0000690032c012a1	!49
	.xword	0x8000002dab400043	
	.xword	0x00006720000129a1	!50
	.xword	0x80000000a0072440	
	.xword	0x000067200002c000	!51
	.xword	0x80000000a016e440	
	.xword	0x00006900198012a1	!52
	.xword	0x8000002daa000043	
	.xword	0x00006800008a0000	!53
	.xword	0x80000003d0f20441	
	.xword	0x00006720001e92a1	!54
	.xword	0x80000000a00a6040	
	.xword	0x00006900034012a1	!55
	.xword	0x8000002da6800043	
	.xword	0x0000680000cf12a1	!56
	.xword	0x80000003d0fa0041	
	.xword	0x00006720001692a1	!57
	.xword	0x80000000a00a8040	
	.xword	0x00006800003b12a1	!58
	.xword	0x80000003d01d0041	
	.xword	0x000067200000b2a1	!59
	.xword	0x80000000a004c040	
	.xword	0x000069003b8012a1	!60
	.xword	0x8000002daa800043	
	.xword	0x00006800002912a1	!61
	.xword	0x80000003d0580041	
	.xword	0x000069000c8012a1	!62
	.xword	0x8000002dabc00043	
	.xword	0x00006720000fd2a1	!63
	.xword	0x80000000a018c040	
	.xword	0x00006a05c00012a1	!64
	.xword	0x8000002e90000045	
	.xword	0x00006800003a12a1	!65
	.xword	0x80000003d0ac0041	
	.xword	0x0000690018c012a1	!66
	.xword	0x8000002da6c00043	
	.xword	0x00006900260012a1	!67
	.xword	0x8000002da5c00043	
	.xword	0x000067200003f2a1	!68
	.xword	0x80000000a01ac040	
	.xword	0x00006a06700012a1	!69
	.xword	0x8000002d20000045	
	.xword	0x00006800006712a1	!70
	.xword	0x80000003d0be0041	
	.xword	0x00006c0000021412	!71
	.xword	0x8000003fe0650041	
	.xword	0x00006d0008001291	!72
	.xword	0x80000001b8000043	
	.xword	0x00006d003cc00000	!73
	.xword	0x80000001b8c00443	
	.xword	0x00006c0000d41412	!74
	.xword	0x8000003fe04f0041	
	.xword	0x00006c0000611291	!75
	.xword	0x8000003fe0480041	
	.xword	0x00006d003f000000	!76
	.xword	0x80000001b4000443	
	.xword	0x00006d0021401412	!77
	.xword	0x80000001bc000043	
	.xword	0x00006b300016f291	!78
	.xword	0x80000000b0192040	
	.xword	0x00006d0033000000	!79
	.xword	0x80000001bf400443	
	.xword	0x00006b3000071412	!80
	.xword	0x80000000b000c040	
	.xword	0x00006c0000950000	!81
	.xword	0x8000003fe0890441	
	.xword	0x00006c0000481412	!82
	.xword	0x8000003fe0230041	
	.xword	0x00006b3000149412	!83
	.xword	0x80000000b019a040	
	.xword	0x00006b30001fd412	!84
	.xword	0x80000000b007e040	
	.xword	0x00006b3000121412	!85
	.xword	0x80000000b01c0040	
	.xword	0x00006c0000b11412	!86
	.xword	0x8000003fe01e0041	
	.xword	0x00006d002c001412	!87
	.xword	0x80000001b6400043	
	.xword	0x00006b30001d7412	!88
	.xword	0x80000000b00ac040	
	.xword	0x00006d0038c01412	!89
	.xword	0x80000001b7000043	
	.xword	0x00006b3000073412	!90
	.xword	0x80000000b017a040	
	.xword	0x00006f400013f0cb	!91
	.xword	0x80000000c0088040	
	.xword	0x0000710027c01cf3	!92
	.xword	0x8000004dc9000443	
	.xword	0x0000700000650000	!93
	.xword	0x8000004ff03b0441	
	.xword	0x0000710001800ee3	!94
	.xword	0x8000004dcfc00043	
	.xword	0x00006f40000916bb	!95
	.xword	0x80000000c013c440	
	.xword	0x00006f4000178000	!96
	.xword	0x80000000c012c440	
	.xword	0x00006f40000230cb	!97
	.xword	0x80000000c019c040	
	.xword	0x000071001fc01cf3	!98
	.xword	0x8000004dcac00443	
	.xword	0x0000700000180000	!99
	.xword	0x8000004ff0fd0441	
	.xword	0x00006f40001fb0cb	!100
	.xword	0x80000000c0016040	
	.xword	0x0000720b60001cf3	!101
	.xword	0x8000004e40000445	
	.xword	0x000071002c800000	!102
	.xword	0x8000004dccc00443	
	.xword	0x00007000008d0ee3	!103
	.xword	0x8000004ff0820041	
	.xword	0x00006f4000068000	!104
	.xword	0x80000000c0130440	
	.xword	0x00006f40000450cb	!105
	.xword	0x80000000c0154040	
	.xword	0x000071001c000ee3	!106
	.xword	0x8000004dc0c00043	
	.xword	0x0000720ab0000ee3	!107
	.xword	0x8000004850000045	
	.xword	0x0000710025800ee3	!108
	.xword	0x8000004dc7400043	
	.xword	0x0000700000580ee3	!109
	.xword	0x8000004ff0570041	
	.xword	0x0000740000980a49	!110
	.xword	0x8000000010f30441	
	.xword	0x00007350000b5b71	!111
	.xword	0x80000000d01f0040	
	.xword	0x0000760190000000	!112
	.xword	0x8000005e50000045	
	.xword	0x00007350001a0a49	!113
	.xword	0x80000000d01f2440	
	.xword	0x000075000fc01b71	!114
	.xword	0x80000001d3000043	
	.xword	0x0000740000400000	!115
	.xword	0x8000005010440041	
	.xword	0x0000740000ab0a49	!116
	.xword	0x8000000010fe0441	
	.xword	0x0000740000bf1b71	!117
	.xword	0x80000000101f0041	
	.xword	0x0000740000130000	!118
	.xword	0x8000005010500041	
	.xword	0x0000740000fa0a49	!119
	.xword	0x8000000010a00441	
	.xword	0x0000740000c00000	!120
	.xword	0x8000005010430041	
	.xword	0x0000740000120a49	!121
	.xword	0x80000000102a0441	
	.xword	0x00007400001f0a49	!122
	.xword	0x8000000010a40441	
	.xword	0x0000735000124a49	!123
	.xword	0x80000000d0146440	
	.xword	0x0000750039400a49	!124
	.xword	0x80000001de800443	
	.xword	0x0000735000194a49	!125
	.xword	0x80000000d00b2440	
	.xword	0x0000735000186a49	!126
	.xword	0x80000000d00a4440	
	.xword	0x000073500012ea49	!127
	.xword	0x80000000d00c0440	
	.xword	0x0000740000380a49	!128
	.xword	0x8000000010350441	
	.xword	0x0000780000830ebb	!129
	.xword	0x80000064206d0041	
	.xword	0x00007800002a0066	!130
	.xword	0x8000006420550041	
	.xword	0x0000776000118000	!131
	.xword	0x8000006ce00d0040	
	.xword	0x0000780000c80ebb	!132
	.xword	0x8000006420200041	
	.xword	0x0000790036c00066	!133
	.xword	0x80000001e7c00043	
	.xword	0x000079001b000000	!134
	.xword	0x80000001e0400043	
	.xword	0x0000776000165a67	!135
	.xword	0x8000006ce00b6040	
	.xword	0x00007800007c0066	!136
	.xword	0x8000006420ae0041	
	.xword	0x00007a0440000000	!137
	.xword	0x8000006ee0000045	
	.xword	0x0000790019c00ebb	!138
	.xword	0x80000001e0800043	
	.xword	0x000077600017aaa7	!139
	.xword	0x8000006ce01b0040	
	.xword	0x00007a0e20000000	!140
	.xword	0x8000006d50000045	
	.xword	0x0000790038800ebb	!141
	.xword	0x80000001e1000043	
	.xword	0x00007760001a2000	!142
	.xword	0x8000006ce015a040	
	.xword	0x0000780000fd0ebb	!143
	.xword	0x8000006420b70041	
	.xword	0x0000790001c00ebb	!144
	.xword	0x80000001e3400043	
	.xword	0x0000776000021a67	!145
	.xword	0x8000006ce01e0040	
	.xword	0x0000780000e90ebb	!146
	.xword	0x8000006420c50041	
	.xword	0x0000790030800ebb	!147
	.xword	0x80000001e1400043	
	.xword	0x00007760001d5a67	!148
	.xword	0x8000006ce00fa040	
	.xword	0x000077600009da67	!149
	.xword	0x8000006ce0050040	
	.xword	0x00007760001a9a67	!150
	.xword	0x8000006ce01f4040	
	.xword	0x00007760001b5a67	!151
	.xword	0x8000006ce0112040	
	.xword	0x0000776000191a67	!152
	.xword	0x8000006ce0004040	
	.xword	0x0000780000860ebb	!153
	.xword	0x80000064206f0041	
	.xword	0x0000780000040ebb	!154
	.xword	0x8000006420710041	
	.xword	0x0000780000240ebb	!155
	.xword	0x8000006420c70041	
	.xword	0x00007b7000067dba	!156
	.xword	0x80000000f011c440	
	.xword	0x00007b700007e764	!157
	.xword	0x80000000f0104440	
	.xword	0x00007c0000660000	!158
	.xword	0x8000000030c80041	
	.xword	0x00007b7000127dba	!159
	.xword	0x80000000f0180440	
	.xword	0x00007d0000400764	!160
	.xword	0x8000007df1800443	
	.xword	0x00007c0000600000	!161
	.xword	0x8000000030030041	
	.xword	0x00007b70001d1dba	!162
	.xword	0x80000000f000e440	
	.xword	0x00007c0000e20764	!163
	.xword	0x80000074302d0441	
	.xword	0x00007e0d40000000	!164
	.xword	0x8000007e70000045	
	.xword	0x00007b700000ddba	!165
	.xword	0x80000000f0094440	
	.xword	0x00007c00005a0764	!166
	.xword	0x8000007430810441	
	.xword	0x00007d000d400000	!167
	.xword	0x80000001f2000043	
	.xword	0x00007d0009c01dba	!168
	.xword	0x8000007df3c00443	
	.xword	0x00007b7000006764	!169
	.xword	0x80000000f0008440	
	.xword	0x00007c0000db0000	!170
	.xword	0x8000000030020041	
	.xword	0x00007b7000171dba	!171
	.xword	0x80000000f0082440	
	.xword	0x00007b7000173dba	!172
	.xword	0x80000000f00dc440	
	.xword	0x00007b7000177dba	!173
	.xword	0x80000000f0136440	
	.xword	0x00007b700003bdba	!174
	.xword	0x80000000f0172440	
	.xword	0x00007b700011ddba	!175
	.xword	0x80000000f011e440	
	.xword	0x00007b7000015dba	!176
	.xword	0x80000000f018a440	
	.xword	0x00007b7000093dba	!177
	.xword	0x80000000f01e4440	
	.xword	0x00007b7000101dba	!178
	.xword	0x80000000f00ee440	
	.xword	0x00007e0730001cad	!179
	.xword	0x8000007eb0000445	
	.xword	0x00007c00001e1dba	!180
	.xword	0x8000007430b50441	
	.xword	0x00007c0000051dba	!181
	.xword	0x8000007430b90441	
hptrap_dtte_end:
	.xword	182
.align 32
hptrap_user_code_ptrs_0_begin:
	.xword	8
	.xword	0x5ff0000c4000
	.xword	24
	.xword	0x61000a000000
	.xword	40
	.xword	0x5ff00017e000
	.xword	56
	.xword	0x5ff000026000
	.xword	72
	.xword	0x6000003e0000
	.xword	88
	.xword	0x5ff0001f8000
	.xword	104
	.xword	0x5ff0000f2000
	.xword	120
	.xword	0x61000ec00000
	.xword	136
	.xword	0x610020000000
	.xword	152
	.xword	0x5ff0000fa000
	.xword	168
	.xword	0x6000006f0000
	.xword	184
	.xword	0x61003ec00000
	.xword	200
	.xword	0x620b00000000
	.xword	216
	.xword	0x5ff000008000
	.xword	232
	.xword	8
.align 32
hptrap_user_code_ptrs_1_begin:
	.xword	8
	.xword	0x6310000c6000
	.xword	24
	.xword	0x631000114000
	.xword	40
	.xword	0x631000010000
	.xword	56
	.xword	0x640000930000
	.xword	72
	.xword	0x640000bd0000
	.xword	88
	.xword	0x640000a30000
	.xword	104
	.xword	0x631000000000
	.xword	120
	.xword	0x6400005f0000
	.xword	136
	.xword	0x63100019e000
	.xword	152
	.xword	0x6310001b0000
	.xword	168
	.xword	0x6310001e6000
	.xword	184
	.xword	0x640000230000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_2_begin:
	.xword	8
	.xword	0x6720000ec000
	.xword	24
	.xword	0x6720000f6000
	.xword	40
	.xword	0x680000aa0000
	.xword	56
	.xword	0x690030000000
	.xword	72
	.xword	0x69002e400000
	.xword	88
	.xword	0x6800003f0000
	.xword	104
	.xword	0x6a0280000000
	.xword	120
	.xword	0x690013c00000
	.xword	136
	.xword	0x680000170000
	.xword	152
	.xword	0x6800005d0000
	.xword	168
	.xword	0x67200007c000
	.xword	184
	.xword	0x680000fc0000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_3_begin:
	.xword	8
	.xword	0x6e0660000000
	.xword	24
	.xword	0x6b3000188000
	.xword	40
	.xword	0x6b3000130000
	.xword	56
	.xword	0x6c0000030000
	.xword	72
	.xword	0x6c0000370000
	.xword	88
	.xword	0x6c0000970000
	.xword	104
	.xword	0x6b30001ee000
	.xword	120
	.xword	0x6e0210000000
	.xword	136
	.xword	0x6c00001c0000
	.xword	152
	.xword	0x6c0000d60000
	.xword	168
	.xword	0x6d002e000000
	.xword	184
	.xword	0x6d001bc00000
	.xword	200
	.xword	0x6c0000ba0000
	.xword	216
	.xword	8
.align 32
hptrap_user_code_ptrs_4_begin:
	.xword	8
	.xword	0x6f40000a0000
	.xword	24
	.xword	0x6f400008c000
	.xword	40
	.xword	0x6f4000162000
	.xword	56
	.xword	0x6f40001cc000
	.xword	72
	.xword	0x700000630000
	.xword	88
	.xword	0x6f40000c2000
	.xword	104
	.xword	0x700000f60000
	.xword	120
	.xword	0x720b20000000
	.xword	136
	.xword	0x71002a800000
	.xword	152
	.xword	0x710015000000
	.xword	168
	.xword	8
.align 32
hptrap_user_code_ptrs_5_begin:
	.xword	8
	.xword	0x740000360000
	.xword	24
	.xword	0x75003bc00000
	.xword	40
	.xword	0x740000410000
	.xword	56
	.xword	0x7400009b0000
	.xword	72
	.xword	0x735000002000
	.xword	88
	.xword	0x740000ad0000
	.xword	104
	.xword	0x750011000000
	.xword	120
	.xword	0x740000a40000
	.xword	136
	.xword	0x7350001f0000
	.xword	152
	.xword	0x7350001b2000
	.xword	168
	.xword	0x7350001c2000
	.xword	184
	.xword	0x740000f30000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_6_begin:
	.xword	8
	.xword	0x7760001de000
	.xword	24
	.xword	0x776000004000
	.xword	40
	.xword	0x7760000fe000
	.xword	56
	.xword	0x780000220000
	.xword	72
	.xword	0x776000048000
	.xword	88
	.xword	0x780000260000
	.xword	104
	.xword	0x780000430000
	.xword	120
	.xword	0x776000056000
	.xword	136
	.xword	0x7760001e4000
	.xword	152
	.xword	8
.align 32
hptrap_user_code_ptrs_7_begin:
	.xword	8
	.xword	0x7d003d000000
	.xword	24
	.xword	0x7c0000780000
	.xword	40
	.xword	0x7b7000128000
	.xword	56
	.xword	0x7b70001ec000
	.xword	72
	.xword	0x7b70001ea000
	.xword	88
	.xword	0x7b70001f6000
	.xword	104
	.xword	0x7b700000e000
	.xword	120
	.xword	0x7b7000132000
	.xword	136
	.xword	0x7c0000af0000
	.xword	152
	.xword	0x7e08b0000000
	.xword	168
	.xword	0x7b7000156000
	.xword	184
	.xword	0x7b70000a4000
	.xword	200
	.xword	0x7c0000d50000
	.xword	216
	.xword	0x7b7000016000
	.xword	232
	.xword	8
/*********************************************************************/
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x6000007b0000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	VA = 0x6000007b0000 ,/* 0x6000007bffc0 */
	RA = 0x03b0b20000 ,
	PA = 0x0fb0b20000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00006000007b0807 8000000fb0b20081 */
	end_label   = Thr0_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
	setx	0x5ff000152000, %g1, %g2
	or	%g0, 12, %g1
	.word	0xc658a000
	.word	0xc858a008
	.word	0xca58a010
	.word	0xcc58a018
	.word	0xce58a020
	.word	0xd058a028
	.word	0xd258a030
	.word	0xd458a038
	.word	0xd658a040
	.word	0xd858a048
	.word	0xda58a050
	.word	0xdc58a058
	.word	0xde58a060
	.word	0xe058a068
	.word	0xe258a070
	.word	0xe458a078
	.word	0xe658a080
	.word	0xe858a088
	.word	0xea58a090
	.word	0xec58a098
	.word	0xee58a0a0
	.word	0xf058a0a8
	.word	0xf258a0b0
	.word	0xf458a0b8
	.word	0xf658a0c0
	.word	0xf858a0c8
	.word	0xfa58a0d0
	.word	0xfc58a0d8
.global Thr0_User_Text_4v000_text_begin
Thr0_User_Text_4v000_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v000_exit
	nop
	.word	0x1000000
	or	%g0, 0x268, %i7
	READ_DDATA_ACCESS
	.word	0xca58a040
	.word	0xfcda9000
	.word	0xe058a0f8
	.word	0xbe852108
	.word	0xc8dfd000
	DDEMAP_SCTX
	.word	0xbe8620e8
	.word	0xe8dfd000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	TOGGLE_LSU_IM
	.word	0xfcdf1000
	TOGGLE_LSU_IM
	.word	0xfcdf1000
	.word	0x1000000
	or	%g0, 0x449, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe82a0b8
	.word	0xd4dfd000
	.word	0xe8772128
	.word	0xc032a62c
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x195, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe842148
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x005, %i7
	LOAD_IDATA_IN
	ACCESS_DTSB_PTR
	.word	0xe85aa038
thr0_MMU_ASI_PRIMARY_1:
	.word	0x87802080
	.word	0xc8f42068
	.word	0xbe8620a8
	.word	0xe0dfd000
	.word	0xc02c24a0
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xea72a010
	.word	0xc0252d7c
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v000_exit:
	EXIT_GOOD
Thr0_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v100 DATA_VA=0x5ff000152000
attr_data {
	Name = .Thr0_User_Data_4v100 ,
	VA = 0x5ff000152000 ,/* 0x5ff000153fc0 */
	RA = 0x00800d8000 ,
	PA = 0x0c800d8000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	/* DTTE_TAG_DATA = 00005ff0001521dd 8000000c800d8440 */
	end_label   = Thr0_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v100_data_begin
Thr0_User_Data_4v100_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v200 DATA_VA=0x600000900000
attr_data {
	Name = .Thr0_User_Data_4v200 ,
	VA = 0x600000900000 ,/* 0x60000090ffc0 */
	RA = 0x03b0120000 ,
	PA = 0x0fb0120000 ,
	TTE_Context = 0x1ace ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x130000 ,
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
	/* DTTE_TAG_DATA = 0000600000901ace 8000000fb0120041 */
	end_label   = Thr0_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v200_data_begin
Thr0_User_Data_4v200_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v300 DATA_VA=0x610017c00000
attr_data {
	Name = .Thr0_User_Data_4v300 ,
	VA = 0x610017c00000 ,/* 0x610017ffffc0 */
	RA = 0x0184400000 ,
	PA = 0x0d84400000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr0_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0a0000 ,
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
	/* DTTE_TAG_DATA = 0000610017c00000 8000000d84400043 */
	end_label   = Thr0_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v300_data_begin
Thr0_User_Data_4v300_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v001 TEXT_VA=0x5ff0000c4000
attr_text {
	Name = .Thr0_User_Text_4v001 ,
	VA = 0x5ff0000c4000 ,/* 0x5ff0000c5fc0 */
	RA = 0x00801ae000 ,
	PA = 0x0c801ae000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00005ff0000c41dd 8000000c801ae080 */
	end_label   = Thr0_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v001_text_begin
Thr0_User_Text_4v001_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v001_exit
	nop
	.word	0xc022a1e4
	DDEMAP_ALL_RPAGES
	.word	0xfe56a980
	.word	0xbe852108
	.word	0xd4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf6742100
	.word	0xc07521b0
	DDEMAP_ALL_RPAGES
thr0_MMU_ASI_BLK_P_2:
	.word	0x878020f0
	.word	0xc1bc2b00
	.word	0x1000000
	or	%g0, 0x004, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x053, %i7
	LOAD_DDATA_IN
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd45aa038
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd6712070
	.word	0xc0712f50
	.word	0x1000000
	or	%g0, 0x140, %i7
	DTLB_TAG_READ
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	.word	0xfc9a9100
thr0_MMU_ASI_BLK_P_3:
	.word	0x878020f0
	.word	0xc3bc2f80
	.word	0xbe82a0d8
	.word	0xc4dfd000
	DDEMAP_SCTX
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe16c000
	IDEMAP_PAGE
	ACCESS_ITSB_PTR
	.word	0xfe5c29c8
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x690, %i7
	DTLB_TAG_READ
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe05d20b8
	.word	0xc0242170
	.word	0xc032a400
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x540, %i7
	READ_IDATA_ACCESS
	.word	0xfe4c2a7c
	ACCESS_DTSB_PTR
	DDEMAP_ALL
	.word	0xfa72a0e0
	.word	0xc03629cc
	.word	0xfcde9000
	.word	0xe258a090
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe592250
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v001_exit:
	EXIT_GOOD
Thr0_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v400 TEXT_VA=0x600000b50000
attr_text {
	Name = .Thr0_User_Text_4v400 ,
	VA = 0x600000b50000 ,/* 0x600000b5ffc0 */
	RA = 0x03b0320000 ,
	PA = 0x0fb0320000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr0_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x000000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000600000b50000 8000000fb0320481 */
	end_label   = Thr0_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v400_text_begin
Thr0_User_Text_4v400_text_begin:
	wrpr	0, %gl
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe816010
	.word	0xcadfd060
	.word	0xfe41a200
	.word	0xfcd95060
	.word	0xbe82a0c8
	.word	0xe8dfd000
	.word	0xc031a368
	nop
	nop
	.word	0xfcda8200
	.word	0x1000000
	or	%g0, 0x0b5, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0xd8, %i7
	P_READ_IDATA_ACCESS
	nop
	.word	0x1000000
	.word	0xbe12c000
	P_DDEMAP_RPAGE
	.word	0xfcdc0300
	P_TOGGLE_LSU_DM
thr0_MMU_ASI_PRIMARY_4:
	.word	0x87802080
	.word	0xf4f72068
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	nop
	.word	0xfcdec2a0
	P_TOGGLE_LSU_DM
	P_DDEMAP_ALL_PAGES
	nop
	.word	0xe859a138
	P_IDEMAP_NCTX
	.word	0xbe8520d8
	.word	0xc8dfd000
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xbe8420f8
	.word	0xc4dfd000
	nop
	nop
	nop
	nop
	.word	0xd471a038
	.word	0xc021aebc
	.word	0xfcd94320
thr0_MMU_ASI_BLK_SL_5:
	.word	0x878020f9
	.word	0xc3bc6140
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr0_User_Text_4v400_exit:
	EXIT_GOOD
Thr0_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v002 TEXT_VA=0x5ff00011e000
attr_text {
	Name = .Thr0_User_Text_4v002 ,
	VA = 0x5ff00011e000 ,/* 0x5ff00011ffc0 */
	RA = 0x0080078000 ,
	PA = 0x0c80078000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00005ff00011e1dd 8000000c80078080 */
	end_label   = Thr0_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v002_text_begin
Thr0_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xfcd89000
thr0_MMU_ASI_AS_IF_USER_PRIMARY_6:
	.word	0x87802010
	.word	0xdcf62028
	.word	0xbe812108
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x3f8, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	P_ITLB_TAG_READ
	.word	0xf6762110
	.word	0xc0742170
	.word	0x1000000
	or	%g0, 0x4d4, %i7
	P_LOAD_IDATA_ACCESS
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe114000
	P_DDEMAP_PAGE
	P_ACCESS_DTSB_PTR
thr0_MMU_ASI_BLK_COMMIT_S_7:
	.word	0x878020e1
	.word	0xc1bc6140
	.word	0xd8752018
	.word	0xc026a3d4
	.word	0xfcdf0200
	P_DDEMAP_ALL_RPAGES
	.word	0xc037279a
thr0_MMU_ASI_BLK_P_8:
	.word	0x878020f0
	.word	0xc3bea700
	.word	0x1000000
	or	%g0, 0x458, %i7
	P_ITLB_TAG_READ
	P_DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x01a, %i7
	P_LOAD_IDATA_IN
thr0_MMU_ASI_AS_IF_USER_PRIMARY_9:
	.word	0x87802010
	.word	0xfaf2a020
	.word	0x1000000
	.word	0xbe13c000
	P_IDEMAP_RPAGE
	.word	0xbe158000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v002_exit:
	EXIT_GOOD
Thr0_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v101 DATA_VA=0x610037000000
attr_data {
	Name = .Thr0_User_Data_4v101 ,
	VA = 0x610037000000 ,/* 0x6100373fffc0 */
	RA = 0x0186000000 ,
	PA = 0x0d86000000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	/* DTTE_TAG_DATA = 0000610037000807 8000000d86000443 */
	end_label   = Thr0_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v101_data_begin
Thr0_User_Data_4v101_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v201 DATA_VA=0x600000f90000
attr_data {
	Name = .Thr0_User_Data_4v201 ,
	VA = 0x600000f90000 ,/* 0x600000f9ffc0 */
	RA = 0x03b09b0000 ,
	PA = 0x0fb09b0000 ,
	TTE_Context = 0x1ace ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x130000 ,
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
	/* DTTE_TAG_DATA = 0000600000f91ace 8000000fb09b0041 */
	end_label   = Thr0_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v201_data_begin
Thr0_User_Data_4v201_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v301 DATA_VA=0x600000910000
attr_data {
	Name = .Thr0_User_Data_4v301 ,
	VA = 0x600000910000 ,/* 0x60000091ffc0 */
	RA = 0x03b0ef0000 ,
	PA = 0x0fb0ef0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr0_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0a0000 ,
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
	/* DTTE_TAG_DATA = 0000600000910000 8000000fb0ef0041 */
	end_label   = Thr0_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v301_data_begin
Thr0_User_Data_4v301_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v003 TEXT_VA=0x61000a000000
attr_text {
	Name = .Thr0_User_Text_4v003 ,
	VA = 0x61000a000000 ,/* 0x61000a3fffc0 */
	RA = 0x0184800000 ,
	PA = 0x0d84800000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 000061000a000807 8000000d84800083 */
	end_label   = Thr0_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v003_text_begin
Thr0_User_Text_4v003_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v003_exit
	nop
thr0_MMU_ASI_BLK_S_10:
	.word	0x878020f1
	.word	0xc1b96b80
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x3b0, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe5d2290
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x3d6, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_IM
thr0_MMU_ASI_BLK_COMMIT_P_11:
	.word	0x878020e0
	.word	0xc3bc2880
	.word	0xe05e2008
	TOGGLE_LSU_IM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfcdf1000
	.word	0xfe58ae68
	.word	0xc036a170
	.word	0xbe842038
	.word	0xe0dfd040
	.word	0x1000000
	or	%g0, 0x110, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	.word	0xfcdc5120
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe512992
	.word	0xfcda9000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4c2a36
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x005, %i7
	LOAD_IDATA_IN
	.word	0xf472a088
	.word	0xc02c2ab7
	.word	0xfe592cd8
	DDEMAP_ALL_PAGES
	.word	0xd45d20e8
	.word	0xe05ea108
	nop
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x18a, %i7
	LOAD_IDATA_ACCESS
	.word	0xc1995e20
thr0_MMU_ASI_BLK_PL_12:
	.word	0x878020f8
	.word	0xc1bd2f00
	IDEMAP_NCTX
	.word	0xbe8720e8
	.word	0xd4dfd000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
thr0_MMU_ASI_BLK_P_13:
	.word	0x878020f0
	.word	0xc3baa140
	.word	0x1000000
	.word	0xbe104000
	DDEMAP_PAGE
	.word	0xfc9e1d40
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xbe812068
	.word	0xe8dfd000
	.word	0xfcdad160
	.word	0xc02ea8ae
	.word	0x1000000
	or	%g0, 0x90, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfa712020
	.word	0xc0372d4e
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xcc5ea018
	.word	0x81c5e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v003_exit:
	EXIT_GOOD
Thr0_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v401 TEXT_VA=0x5ff0000f0000
attr_text {
	Name = .Thr0_User_Text_4v401 ,
	VA = 0x5ff0000f0000 ,/* 0x5ff0000f1fc0 */
	RA = 0x00801e8000 ,
	PA = 0x00801e8000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr0_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x000000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00005ff0000f0000 80000000801e8480 */
	end_label   = Thr0_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v401_text_begin
Thr0_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x5f8, %i7
	P_ITLB_TAG_READ
	.word	0xfcdc0200
	P_DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x93, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr0_MMU_ASI_AS_IF_USER_PRIMARY_14:
	.word	0x87802010
	.word	0xc8f620c8
thr0_MMU_ASI_AS_IF_USER_PRIMARY_15:
	.word	0x87802010
	.word	0xe2f52040
	.word	0xc029af51
	P_ACCESS_ITSB_PTR
	P_DDEMAP_ALL_RPAGES
	P_ACCESS_ITSB_PTR
	P_IDEMAP_NCTX
thr0_MMU_ASI_BLK_P_16:
	.word	0x878020f0
	.word	0xc3b8ad40
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x070, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe160000
	P_IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	.word	0xc071a860
	P_ACCESS_DTSB_PTR
	.word	0xbe852160
	.word	0xc8dfd000
	.word	0xfe49a03a
thr0_MMU_ASI_PRIMARY_17:
	.word	0x87802080
	.word	0xf4f2a038
	P_IDEMAP_PCTX
	P_ACCESS_DTSB_PTR
thr0_MMU_ASI_AS_IF_USER_PRIMARY_18:
	.word	0x87802010
	.word	0xe6f2a000
	.word	0x1000000
	or	%g0, 0x98, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x43b, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_NCTX
	.word	0xbe842038
	.word	0xc4dfd000
	.word	0x1000000
	or	%g0, 0x478, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe82a038
	.word	0xf4dfd000
	nop
	nop
	nop
	.word	0xbe8420d8
	.word	0xd4dfd000
	P_IDEMAP_ALL_PAGES
	.word	0xfc9b0480
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_ALL
thr0_MMU_ASI_PRIMARY_19:
	.word	0x87802080
	.word	0xd0f42028
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcde0200
	.word	0x1000000
	.word	0xbe130000
	P_DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe168000
	P_IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9a9000
	.word	0x1000000
	.word	0xbe164000
	P_DDEMAP_PAGE
	.word	0xe39a9f00
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR1
	nop
Thr0_User_Text_4v401_exit:
	EXIT_GOOD
Thr0_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v004 TEXT_VA=0x610039000000
attr_text {
	Name = .Thr0_User_Text_4v004 ,
	VA = 0x610039000000 ,/* 0x6100393fffc0 */
	RA = 0x0185000000 ,
	PA = 0x0d85000000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 0000610039000807 8000000d85000083 */
	end_label   = Thr0_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v004_text_begin
Thr0_User_Text_4v004_text_begin:
	wrpr	0, %gl
	P_DDEMAP_NCTX
	.word	0xc022ae60
	P_DDEMAP_ALL_PAGES
	.word	0xbe80a0a8
	.word	0xe0dfc200
	.word	0xfe452be0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a148
	.word	0xe0dfc200
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf6762050
	.word	0xc032a6c8
thr0_MMU_ASI_BLK_COMMIT_P_20:
	.word	0x878020e0
	.word	0xe1bd2440
	P_IDEMAP_ALL_RPAGES
	.word	0xfcdc1000
	P_IDEMAP_ALL
	P_ACCESS_ITSB_PTR
	.word	0xc036aaa2
	P_IDEMAP_ALL_RPAGES
	nop
	nop
	.word	0xde772098
	.word	0xc028a44a
	P_ACCESS_ITSB_PTR
	.word	0xc3995e20
	.word	0xfcdf43a0
	P_ACCESS_DTSB_PTR
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v004_exit:
	EXIT_GOOD
Thr0_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v102 DATA_VA=0x5ff00009a000
attr_data {
	Name = .Thr0_User_Data_4v102 ,
	VA = 0x5ff00009a000 ,/* 0x5ff00009bfc0 */
	RA = 0x00801d2000 ,
	PA = 0x0c801d2000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	/* DTTE_TAG_DATA = 00005ff00009a1dd 8000000c801d2440 */
	end_label   = Thr0_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v102_data_begin
Thr0_User_Data_4v102_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v202 DATA_VA=0x620640000000
attr_data {
	Name = .Thr0_User_Data_4v202 ,
	VA = 0x620640000000 ,/* 0x62064fffffc0 */
	RA = 0x0200000000 ,
	PA = 0x0200000000 ,
	TTE_Context = 0x1ace ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x130000 ,
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
	/* DTTE_TAG_DATA = 0000620640001ace 8000000200000045 */
	end_label   = Thr0_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v202_data_begin
Thr0_User_Data_4v202_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v005 TEXT_VA=0x5ff00017e000
attr_text {
	Name = .Thr0_User_Text_4v005 ,
	VA = 0x5ff00017e000 ,/* 0x5ff00017ffc0 */
	RA = 0x0080138000 ,
	PA = 0x0c80138000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00005ff00017e1dd 8000000c80138080 */
	end_label   = Thr0_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v005_text_begin
Thr0_User_Text_4v005_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v005_exit
	nop
	.word	0xfe5126f4
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe4c2b3b
	.word	0xfe42a608
thr0_MMU_ASI_BLK_COMMIT_P_21:
	.word	0x878020e0
	.word	0xc3bf2800
	.word	0xc022a580
	.word	0xbe842118
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	DTLB_TAG_READ
	DDEMAP_ALL_PAGES
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x2a8, %i7
	READ_DDATA_ACCESS
	.word	0xfe48aac7
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x0, %i7
	ITLB_TAG_READ
	.word	0xfcdd1000
	.word	0xfc9e1c40
	.word	0x1000000
	or	%g0, 0x5d9, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfcd89000
	.word	0xfcdc1000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xc072a1f8
	.word	0xda7420d0
	.word	0xc028ab1d
	.word	0xe05c20f8
	.word	0x1000000
	or	%g0, 0x580, %i7
	DTLB_TAG_READ
	.word	0xfcdc1140
	.word	0xbe120000
	GOTO_SUPERVISOR1
thr0_MMU_ASI_PRIMARY_22:
	.word	0x87802080
	.word	0xd2f62100
	IDEMAP_ALL_RPAGES
	.word	0xfcdc1040
	.word	0xfc9c1d40
	TOGGLE_LSU_DM
	.word	0xe47620d0
	.word	0xc02e27ce
	.word	0xbe82a108
	.word	0xc4dfd000
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x51b, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL
thr0_MMU_ASI_PRIMARY_23:
	.word	0x87802080
	.word	0xf6f12078
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x1bc, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x3f0, %i7
	DTLB_TAG_READ
	ACCESS_ITSB_PTR
	IDEMAP_ALL_RPAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd4762068
	.word	0xc072a208
	.word	0x81c1e000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v005_exit:
	EXIT_GOOD
Thr0_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v006 TEXT_VA=0x620b80000000
attr_text {
	Name = .Thr0_User_Text_4v006 ,
	VA = 0x620b80000000 ,/* 0x620b8fffffc0 */
	RA = 0x0060000000 ,
	PA = 0x0060000000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 0000620b80000807 8000000060000085 */
	end_label   = Thr0_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v006_text_begin
Thr0_User_Text_4v006_text_begin:
	wrpr	0, %gl
thr0_MMU_ASI_REAL_MEM_24:
	.word	0x87802014
	.word	0xeaf42010
	.word	0xfcde1000
	.word	0xbe8120c8
	.word	0xc4dfc200
	.word	0xfc998480
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	P_ITLB_TAG_READ
thr0_MMU_ASI_AS_IF_USER_PRIMARY_25:
	.word	0x87802010
	.word	0xd8f12018
	.word	0xbe862038
	.word	0xd4dfd000
	.word	0xf05f20a8
	.word	0xbe80a148
	.word	0xf0dfd000
	.word	0xfe5aadd0
	.word	0xfc9d1000
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x7af, %i7
	P_LOAD_DDATA_ACCESS
	P_IDEMAP_ALL_PAGES
	P_IDEMAP_ALL_PAGES
	P_IDEMAP_NCTX
	.word	0xbe8520c8
	.word	0xe0dfc200
	.word	0x1000000
	.word	0xbe13c000
	P_IDEMAP_RPAGE
	.word	0xfcd91000
	.word	0x1000000
	or	%g0, 0x703, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe8520a8
	.word	0xe0dfd000
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x138, %i7
	P_DTLB_TAG_READ
	.word	0xbe856010
	.word	0xc39fc2e0
	.word	0xbe80a088
	.word	0xd4dfd000
	P_ACCESS_ITSB_PTR
	.word	0xbe842168
	.word	0xe0dfd000
thr0_MMU_ASI_AS_IF_USER_PRIMARY_26:
	.word	0x87802010
	.word	0xd2f2a078
	.word	0x1000000
	or	%g0, 0x5d0, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x2a, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v006_exit:
	EXIT_GOOD
Thr0_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v103 DATA_VA=0x5ff000058000
attr_data {
	Name = .Thr0_User_Data_4v103 ,
	VA = 0x5ff000058000 ,/* 0x5ff000059fc0 */
	RA = 0x0080038000 ,
	PA = 0x0c80038000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	/* DTTE_TAG_DATA = 00005ff0000581dd 8000000c80038440 */
	end_label   = Thr0_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v103_data_begin
Thr0_User_Data_4v103_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v203 DATA_VA=0x5ff0001f2000
attr_data {
	Name = .Thr0_User_Data_4v203 ,
	VA = 0x5ff0001f2000 ,/* 0x5ff0001f3fc0 */
	RA = 0x008014a000 ,
	PA = 0x0c8014a000 ,
	TTE_Context = 0x1ace ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x130000 ,
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
	/* DTTE_TAG_DATA = 00005ff0001f2286 8000000c8014a040 */
	end_label   = Thr0_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v203_data_begin
Thr0_User_Data_4v203_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v007 TEXT_VA=0x5ff000026000
attr_text {
	Name = .Thr0_User_Text_4v007 ,
	VA = 0x5ff000026000 ,/* 0x5ff000027fc0 */
	RA = 0x008010a000 ,
	PA = 0x0c8010a000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00005ff0000261dd 8000000c8010a080 */
	end_label   = Thr0_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v007_text_begin
Thr0_User_Text_4v007_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v007_exit
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe100000
	IDEMAP_RPAGE
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	.word	0xee762020
	.word	0xc0262638
	.word	0xd8772018
	.word	0xc024237c
	.word	0x1000000
	or	%g0, 0x019, %i7
	LOAD_DDATA_IN
	IDEMAP_NCTX
	.word	0xbe862038
	.word	0xe0dfd000
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x278, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x409, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	.word	0xc85d20a8
	.word	0xda76a120
	.word	0xc0292243
	.word	0xea70a010
	.word	0xc022a44c
	.word	0xf85f20a8
	.word	0xe05c2118
	.word	0xcc5c2018
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x438, %i7
	LOAD_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x85, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe40a294
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9a9c40
thr0_MMU_ASI_BLK_P_27:
	.word	0x878020f0
	.word	0xc1baa5c0
	.word	0x1000000
	or	%g0, 0x658, %i7
	READ_DDATA_ACCESS
	.word	0xf470a068
	.word	0xc02e229f
	nop
	nop
	.word	0xda7520e0
	.word	0xc02aab27
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x120, %i7
	READ_DDATA_ACCESS
	.word	0xfe4c2746
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc0212170
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v007_exit:
	EXIT_GOOD
Thr0_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v008 TEXT_VA=0x5ff000036000
attr_text {
	Name = .Thr0_User_Text_4v008 ,
	VA = 0x5ff000036000 ,/* 0x5ff000037fc0 */
	RA = 0x00800be000 ,
	PA = 0x0c800be000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00005ff0000361dd 8000000c800be080 */
	end_label   = Thr0_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v008_text_begin
Thr0_User_Text_4v008_text_begin:
	wrpr	0, %gl
	.word	0xfcde0300
	P_TOGGLE_LSU_DM
	.word	0xfcda9100
	P_ACCESS_ITSB_PTR
	P_TOGGLE_LSU_IM
	P_DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	P_ITLB_TAG_READ
	.word	0xbe82a068
	.word	0xc8dfc200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_NCTX
	P_IDEMAP_ALL_RPAGES
thr0_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_28:
	.word	0x87802018
	.word	0xecf42080
	P_DDEMAP_NCTX
	.word	0xfcdd0300
	.word	0xfc989000
	.word	0xbe86a008
	.word	0xf8dfd000
thr0_MMU_ASI_PRIMARY_29:
	.word	0x87802080
	.word	0xf2f72050
thr0_MMU_ASI_PRIMARY_LITTLE_30:
	.word	0x87802088
	.word	0xc4f52088
	.word	0xfcd95160
	.word	0x1000000
	.word	0xbe118000
	P_DDEMAP_PAGE
thr0_MMU_ASI_PRIMARY_31:
	.word	0x87802080
	.word	0xc4f62138
	.word	0xe270a010
	.word	0xc022a8d0
	.word	0xbe842068
	.word	0xd4dfc200
	.word	0xbe158000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v008_exit:
	EXIT_GOOD
Thr0_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v104 DATA_VA=0x5ff0001ca000
attr_data {
	Name = .Thr0_User_Data_4v104 ,
	VA = 0x5ff0001ca000 ,/* 0x5ff0001cbfc0 */
	RA = 0x008017e000 ,
	PA = 0x0c8017e000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	/* DTTE_TAG_DATA = 00005ff0001ca1dd 8000000c8017e440 */
	end_label   = Thr0_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v104_data_begin
Thr0_User_Data_4v104_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v009 TEXT_VA=0x6000003e0000
attr_text {
	Name = .Thr0_User_Text_4v009 ,
	VA = 0x6000003e0000 ,/* 0x6000003effc0 */
	RA = 0x03b0460000 ,
	PA = 0x0fb0460000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00006000003e0807 8000000fb0460081 */
	end_label   = Thr0_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v009_text_begin
Thr0_User_Text_4v009_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v009_exit
	nop
	TOGGLE_LSU_DM
	DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_PAGES
	nop
	nop
	.word	0x1000000
	or	%g0, 0x06f, %i7
	LOAD_IDATA_IN
	.word	0xc032a170
	.word	0xe1995f20
	.word	0x1000000
	or	%g0, 0x1c2, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe82a0d0
	.word	0xe19fde00
	.word	0xfe562780
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xfc9a9c40
	.word	0xf45d2108
thr0_MMU_ASI_PRIMARY_32:
	.word	0x87802080
	.word	0xd0f42028
thr0_MMU_ASI_PRIMARY_33:
	.word	0x87802080
	.word	0xfaf120e0
	.word	0x1000000
	or	%g0, 0x5e8, %i7
	READ_DDATA_ACCESS
	IDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	.word	0xbe852068
	.word	0xe8dfd000
	.word	0xf05e2038
	.word	0xd6712010
	.word	0xc02422b8
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x016, %i7
	LOAD_DDATA_IN
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe46a510
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v009_exit:
	EXIT_GOOD
Thr0_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v105 DATA_VA=0x600000f80000
attr_data {
	Name = .Thr0_User_Data_4v105 ,
	VA = 0x600000f80000 ,/* 0x600000f8ffc0 */
	RA = 0x03b0e80000 ,
	PA = 0x0fb0e80000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000600000f80807 8000000fb0e80441 */
	end_label   = Thr0_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v105_data_begin
Thr0_User_Data_4v105_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00a TEXT_VA=0x5ff0001f8000
attr_text {
	Name = .Thr0_User_Text_4v00a ,
	VA = 0x5ff0001f8000 ,/* 0x5ff0001f9fc0 */
	RA = 0x008008e000 ,
	PA = 0x0c8008e000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00005ff0001f81dd 8000000c8008e080 */
	end_label   = Thr0_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00a_text_begin
Thr0_User_Text_4v00a_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v00a_exit
	nop
thr0_MMU_ASI_PRIMARY_34:
	.word	0x87802080
	.word	0xcaf42010
	.word	0xfcda9000
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x553, %i7
	LOAD_DDATA_ACCESS
	.word	0xf85f2038
thr0_MMU_ASI_BLK_P_35:
	.word	0x878020f0
	.word	0xe1be2ac0
	TOGGLE_LSU_DM
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe164000
	IDEMAP_RPAGE
	nop
	nop
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc02126bc
	.word	0x1000000
	or	%g0, 0x031, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	.word	0xd2752050
	.word	0xc02426a8
	.word	0xc07521f8
	.word	0xfe552db4
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xe85c2128
thr0_MMU_ASI_PRIMARY_36:
	.word	0x87802080
	.word	0xeaf0a040
	.word	0x1000000
	or	%g0, 0x278, %i7
	READ_DDATA_ACCESS
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x180, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0xc072acc8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xee76a098
	.word	0xc0362e8a
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_PAGE
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_RPAGE
	TOGGLE_LSU_DM
	.word	0xfc9f1000
	.word	0xfe42a81c
	DDEMAP_ALL
	.word	0xf6772000
	.word	0xc03726e2
	.word	0xfc9a9c40
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe120000
	IDEMAP_RPAGE
	TOGGLE_LSU_IM
	ACCESS_ITSB_PTR
thr0_MMU_ASI_PRIMARY_LITTLE_37:
	.word	0x87802088
	.word	0xf4bf2db0
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfe5e2f90
	.word	0x81c76000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00a_exit:
	EXIT_GOOD
Thr0_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v106 DATA_VA=0x6000000a0000
attr_data {
	Name = .Thr0_User_Data_4v106 ,
	VA = 0x6000000a0000 ,/* 0x6000000affc0 */
	RA = 0x03b0270000 ,
	PA = 0x0fb0270000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 00006000000a0807 8000000fb0270441 */
	end_label   = Thr0_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v106_data_begin
Thr0_User_Data_4v106_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00b TEXT_VA=0x5ff0000f2000
attr_text {
	Name = .Thr0_User_Text_4v00b ,
	VA = 0x5ff0000f2000 ,/* 0x5ff0000f3fc0 */
	RA = 0x008014e000 ,
	PA = 0x0c8014e000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00005ff0000f21dd 8000000c8014e080 */
	end_label   = Thr0_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00b_text_begin
Thr0_User_Text_4v00b_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v00b_exit
	nop
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	DTLB_TAG_READ
	.word	0xd45d2148
	.word	0xfe5423c0
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr0_MMU_ASI_SECONDARY_LITTLE_38:
	.word	0x87802089
	.word	0xc8b96c50
	.word	0x1000000
	or	%g0, 0x4ed, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc45aa150
	.word	0x81c0e088
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00b_exit:
	EXIT_GOOD
Thr0_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v107 DATA_VA=0x6206d0000000
attr_data {
	Name = .Thr0_User_Data_4v107 ,
	VA = 0x6206d0000000 ,/* 0x6206dfffffc0 */
	RA = 0x0100000000 ,
	PA = 0x0100000000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	/* DTTE_TAG_DATA = 00006206d0000807 8000000100000445 */
	end_label   = Thr0_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v107_data_begin
Thr0_User_Data_4v107_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00c TEXT_VA=0x61000ec00000
attr_text {
	Name = .Thr0_User_Text_4v00c ,
	VA = 0x61000ec00000 ,/* 0x61000effffc0 */
	RA = 0x0189400000 ,
	PA = 0x0d89400000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 000061000ec00807 8000000d89400083 */
	end_label   = Thr0_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00c_text_begin
Thr0_User_Text_4v00c_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v00c_exit
	nop
	DDEMAP_PCTX
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x07b, %i7
	LOAD_IDATA_IN
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe13c000
	IDEMAP_PAGE
	.word	0xfe4f2038
	.word	0xe05aa088
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe2752010
	.word	0xc02425b4
	.word	0x1000000
	or	%g0, 0x457, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x054, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	ITLB_TAG_READ
thr0_MMU_ASI_PRIMARY_39:
	.word	0x87802080
	.word	0xd4f52138
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x618, %i7
	DTLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc072a4a8
	.word	0x81c5e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00c_exit:
	EXIT_GOOD
Thr0_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v108 DATA_VA=0x5ff000144000
attr_data {
	Name = .Thr0_User_Data_4v108 ,
	VA = 0x5ff000144000 ,/* 0x5ff000145fc0 */
	RA = 0x008005e000 ,
	PA = 0x0c8005e000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	/* DTTE_TAG_DATA = 00005ff0001441dd 8000000c8005e440 */
	end_label   = Thr0_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v108_data_begin
Thr0_User_Data_4v108_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00d TEXT_VA=0x610020000000
attr_text {
	Name = .Thr0_User_Text_4v00d ,
	VA = 0x610020000000 ,/* 0x6100203fffc0 */
	RA = 0x0184c00000 ,
	PA = 0x0d84c00000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 0000610020000807 8000000d84c00083 */
	end_label   = Thr0_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00d_text_begin
Thr0_User_Text_4v00d_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v00d_exit
	nop
	.word	0xfcd95120
	.word	0x1000000
	or	%g0, 0x020, %i7
	LOAD_IDATA_IN
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x120, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1a3, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe128000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	nop
	.word	0x1000000
	or	%g0, 0x35a, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcde9000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4c234c
	.word	0x81c5e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00d_exit:
	EXIT_GOOD
Thr0_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v109 DATA_VA=0x600000960000
attr_data {
	Name = .Thr0_User_Data_4v109 ,
	VA = 0x600000960000 ,/* 0x60000096ffc0 */
	RA = 0x03b08e0000 ,
	PA = 0x0fb08e0000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000600000960807 8000000fb08e0441 */
	end_label   = Thr0_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v109_data_begin
Thr0_User_Data_4v109_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00e TEXT_VA=0x5ff0000fa000
attr_text {
	Name = .Thr0_User_Text_4v00e ,
	VA = 0x5ff0000fa000 ,/* 0x5ff0000fbfc0 */
	RA = 0x00800bc000 ,
	PA = 0x0c800bc000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00005ff0000fa1dd 8000000c800bc080 */
	end_label   = Thr0_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00e_text_begin
Thr0_User_Text_4v00e_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v00e_exit
	nop
thr0_MMU_ASI_PRIMARY_40:
	.word	0x87802080
	.word	0xd8f42018
	DDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x510, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe852108
	.word	0xd4dfd000
	.word	0xc0742ff0
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x040, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x7ce, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xd45c2148
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc0762858
	.word	0xfa72a100
	.word	0xc072a4e8
	.word	0xbe86a128
	.word	0xe8dfd000
	.word	0xfcdc1000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0xc85c2108
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe82a118
	.word	0xd4dfd040
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd1000
	.word	0xbe846010
	.word	0xe2dfd060
	.word	0xc3995e20
	DDEMAP_ALL_PAGES
	.word	0xc02d2170
	.word	0xd85d2018
	.word	0x1000000
	or	%g0, 0x064, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc032aca8
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00e_exit:
	EXIT_GOOD
Thr0_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10a DATA_VA=0x620cd0000000
attr_data {
	Name = .Thr0_User_Data_4v10a ,
	VA = 0x620cd0000000 ,/* 0x620cdfffffc0 */
	RA = 0x03a0000000 ,
	PA = 0x03a0000000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	/* DTTE_TAG_DATA = 0000620cd0000807 80000003a0000445 */
	end_label   = Thr0_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10a_data_begin
Thr0_User_Data_4v10a_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00f TEXT_VA=0x6000006f0000
attr_text {
	Name = .Thr0_User_Text_4v00f ,
	VA = 0x6000006f0000 ,/* 0x6000006fffc0 */
	RA = 0x03b0840000 ,
	PA = 0x0fb0840000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00006000006f0807 8000000fb0840081 */
	end_label   = Thr0_User_Text_4v00f_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00f_text_begin
Thr0_User_Text_4v00f_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v00f_exit
	nop
	.word	0xfcda9000
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
thr0_MMU_ASI_SECONDARY_41:
	.word	0x87802081
	.word	0xc4b96ea0
	.word	0x1000000
	or	%g0, 0x4cb, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcdd1000
	.word	0xc072a170
	.word	0xfe4e24cb
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	ACCESS_DTSB_PTR
	.word	0xc0742170
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc02aa882
	nop
	nop
	nop
	.word	0xc072ad68
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	READ_IDATA_ACCESS
	.word	0xbe82a128
	.word	0xd4dfd000
	DDEMAP_SCTX
	.word	0xfc9e1c40
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc028a2cc
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00f_exit:
	EXIT_GOOD
Thr0_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10b DATA_VA=0x600000b60000
attr_data {
	Name = .Thr0_User_Data_4v10b ,
	VA = 0x600000b60000 ,/* 0x600000b6ffc0 */
	RA = 0x03b0c40000 ,
	PA = 0x0fb0c40000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000600000b60807 8000000fb0c40441 */
	end_label   = Thr0_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10b_data_begin
Thr0_User_Data_4v10b_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v010 TEXT_VA=0x61003ec00000
attr_text {
	Name = .Thr0_User_Text_4v010 ,
	VA = 0x61003ec00000 ,/* 0x61003effffc0 */
	RA = 0x018e000000 ,
	PA = 0x0d8e000000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 000061003ec00807 8000000d8e000083 */
	end_label   = Thr0_User_Text_4v010_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v010_text_begin
Thr0_User_Text_4v010_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v010_exit
	nop
	.word	0x1000000
	or	%g0, 0x361, %i7
	LOAD_DDATA_ACCESS
	.word	0xde76a0b0
	.word	0xc02426b4
	.word	0x1000000
	.word	0xbe134000
	IDEMAP_PAGE
	IDEMAP_ALL_PAGES
	.word	0xfe5c22a0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc8752088
	.word	0xc0742318
	.word	0xfcdc1000
	.word	0xea5c2040
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe4aa483
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe4742060
	.word	0xc0752170
	.word	0x81c26000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v010_exit:
	EXIT_GOOD
Thr0_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10c DATA_VA=0x600000ac0000
attr_data {
	Name = .Thr0_User_Data_4v10c ,
	VA = 0x600000ac0000 ,/* 0x600000acffc0 */
	RA = 0x03b09e0000 ,
	PA = 0x0fb09e0000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000600000ac0807 8000000fb09e0441 */
	end_label   = Thr0_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10c_data_begin
Thr0_User_Data_4v10c_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v011 TEXT_VA=0x620b00000000
attr_text {
	Name = .Thr0_User_Text_4v011 ,
	VA = 0x620b00000000 ,/* 0x620b0fffffc0 */
	RA = 0x0110000000 ,
	PA = 0x0110000000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 0000620b00000807 8000000110000085 */
	end_label   = Thr0_User_Text_4v011_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v011_text_begin
Thr0_User_Text_4v011_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v011_exit
	nop
	TOGGLE_LSU_DM
	.word	0xc032a3c6
	.word	0xfe56246a
	DDEMAP_ALL_PAGES
	.word	0xfe562fde
	.word	0xc472a128
	.word	0xc0312676
	nop
	nop
	nop
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	.word	0xc030a922
	.word	0xd45d20c8
thr0_MMU_ASI_PRIMARY_42:
	.word	0x87802080
	.word	0xc4f120a8
	.word	0xe0592008
thr0_MMU_ASI_PRIMARY_43:
	.word	0x87802080
	.word	0xf6f52100
	ACCESS_DTSB_PTR
	DDEMAP_NCTX
thr0_MMU_ASI_PRIMARY_44:
	.word	0x87802080
	.word	0xfaf62130
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x04f, %i7
	LOAD_IDATA_IN
	DDEMAP_SCTX
	.word	0xc0762790
	.word	0x1000000
	or	%g0, 0x4de, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
thr0_MMU_ASI_PRIMARY_45:
	.word	0x87802080
	.word	0xccf42018
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02c2bf0
	.word	0x1000000
	.word	0xbe128000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_SECONDARY_46:
	.word	0x87802081
	.word	0xccf16048
	.word	0xfe592b58
	nop
	nop
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe108000
	IDEMAP_PAGE
thr0_MMU_ASI_PRIMARY_47:
	.word	0x87802080
	.word	0xf0f620d8
	.word	0x1000000
	or	%g0, 0x1ac, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe5d2760
	.word	0xbe8620f8
	.word	0xe8dfd000
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_PAGES
	.word	0xfe4c24d2
	.word	0xe85d2160
	.word	0x1000000
	or	%g0, 0x460, %i7
	ITLB_TAG_READ
thr0_MMU_ASI_SECONDARY_LITTLE_48:
	.word	0x87802089
	.word	0xe8b96210
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	READ_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xbe8420a8
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe158000
	DDEMAP_RPAGE
	.word	0xcc5f2018
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe05c2068
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v011_exit:
	EXIT_GOOD
Thr0_User_Text_4v011_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10d DATA_VA=0x600000820000
attr_data {
	Name = .Thr0_User_Data_4v10d ,
	VA = 0x600000820000 ,/* 0x60000082ffc0 */
	RA = 0x03b0d30000 ,
	PA = 0x0fb0d30000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000600000820807 8000000fb0d30441 */
	end_label   = Thr0_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10d_data_begin
Thr0_User_Data_4v10d_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v012 TEXT_VA=0x5ff000008000
attr_text {
	Name = .Thr0_User_Text_4v012 ,
	VA = 0x5ff000008000 ,/* 0x5ff000009fc0 */
	RA = 0x0080196000 ,
	PA = 0x0c80196000 ,
	TTE_Context = 0x0807 ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* ITTE_TAG_DATA = 00005ff0000081dd 8000000c80196080 */
	end_label   = Thr0_User_Text_4v012_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v012_text_begin
Thr0_User_Text_4v012_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr0_User_Text_4v012_exit
	nop
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x348, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xcc762018
	.word	0xc07428a8
	.word	0xc85ea0d8
	IDEMAP_ALL
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0352fe6
	.word	0xfe4d2fc6
	.word	0xe85aa068
	.word	0xde7520e0
	.word	0xc020adec
	.word	0xd45c2008
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x190, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_PAGES
	.word	0xe670a060
	.word	0xc022ae00
	.word	0x1000000
	or	%g0, 0x80, %i7
	READ_DDATA_ACCESS
	.word	0xc0762170
	.word	0xc07525e8
	.word	0xbe842068
	.word	0xe8dfd000
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe140000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x4d8, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc02aafe0
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v012_exit:
	EXIT_GOOD
Thr0_User_Text_4v012_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10e DATA_VA=0x600000330000
attr_data {
	Name = .Thr0_User_Data_4v10e ,
	VA = 0x600000330000 ,/* 0x60000033ffc0 */
	RA = 0x03b0dc0000 ,
	PA = 0x0fb0dc0000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000600000330807 8000000fb0dc0441 */
	end_label   = Thr0_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10e_data_begin
Thr0_User_Data_4v10e_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10f DATA_VA=0x5ff00005e000
attr_data {
	Name = .Thr0_User_Data_4v10f ,
	VA = 0x5ff00005e000 ,/* 0x5ff00005ffc0 */
	RA = 0x0080030000 ,
	PA = 0x0c80030000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	/* DTTE_TAG_DATA = 00005ff00005e1dd 8000000c80030440 */
	end_label   = Thr0_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10f_data_begin
Thr0_User_Data_4v10f_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v110 DATA_VA=0x5ff000080000
attr_data {
	Name = .Thr0_User_Data_4v110 ,
	VA = 0x5ff000080000 ,/* 0x5ff000081fc0 */
	RA = 0x00800a2000 ,
	PA = 0x0c800a2000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	/* DTTE_TAG_DATA = 00005ff0000801dd 8000000c800a2440 */
	end_label   = Thr0_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v110_data_begin
Thr0_User_Data_4v110_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v111 DATA_VA=0x5ff000122000
attr_data {
	Name = .Thr0_User_Data_4v111 ,
	VA = 0x5ff000122000 ,/* 0x5ff000123fc0 */
	RA = 0x00801b8000 ,
	PA = 0x0c801b8000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	/* DTTE_TAG_DATA = 00005ff0001221dd 8000000c801b8440 */
	end_label   = Thr0_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v111_data_begin
Thr0_User_Data_4v111_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v112 DATA_VA=0x6000003c0000
attr_data {
	Name = .Thr0_User_Data_4v112 ,
	VA = 0x6000003c0000 ,/* 0x6000003cffc0 */
	RA = 0x03b06b0000 ,
	PA = 0x0fb06b0000 ,
	TTE_Context = 0x0807 ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x110000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 00006000003c0807 8000000fb06b0441 */
	end_label   = Thr0_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v112_data_begin
Thr0_User_Data_4v112_data_begin:
	.xword	0x6000007b0000
	.xword	0x5ff000152000
	.xword	0x600000900000
	.xword	0x610017c00000
	.xword	0x5ff0000c4000
	.xword	0x600000b50000
	.xword	0x5ff00011e000
	.xword	0x610037000000
	.xword	0x600000f90000
	.xword	0x600000910000
	.xword	0x61000a000000
	.xword	0x5ff0000f0000
	.xword	0x610039000000
	.xword	0x5ff00009a000
	.xword	0x620640000000
	.xword	0x5ff00017e000
	.xword	0x620b80000000
	.xword	0x5ff000058000
	.xword	0x5ff0001f2000
	.xword	0x5ff000026000
	.xword	0x5ff000036000
	.xword	0x5ff0001ca000
	.xword	0x6000003e0000
	.xword	0x600000f80000
	.xword	0x5ff0001f8000
	.xword	0x6000000a0000
	.xword	0x5ff0000f2000
	.xword	0x6206d0000000
	.xword	0x61000ec00000
	.xword	0x5ff000144000
	.xword	0x610020000000
	.xword	0x600000960000
	.xword	0x5ff0000fa000
	.xword	0x620cd0000000
	.xword	0x6000006f0000
	.xword	0x600000b60000
	.xword	0x61003ec00000
	.xword	0x600000ac0000
	.xword	0x620b00000000
	.xword	0x600000820000
	.xword	0x5ff000008000
	.xword	0x600000330000
	.xword	0x5ff00005e000
	.xword	0x5ff000080000
	.xword	0x5ff000122000
	.xword	0x6000003c0000
Thr0_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x640000d20000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	VA = 0x640000d20000 ,/* 0x640000d2ffc0 */
	RA = 0x03c0d60000 ,
	PA = 0x1fc0d60000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000640000d218e3 8000001fc0d60081 */
	end_label   = Thr1_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr1_user_code_entry
Thr1_user_code_entry:
	setx	0x650027400000, %g1, %g2
	or	%g0, 12, %g1
	.word	0xc658a000
	.word	0xc858a008
	.word	0xca58a010
	.word	0xcc58a018
	.word	0xce58a020
	.word	0xd058a028
	.word	0xd258a030
	.word	0xd458a038
	.word	0xd658a040
	.word	0xd858a048
	.word	0xda58a050
	.word	0xdc58a058
	.word	0xde58a060
	.word	0xe058a068
	.word	0xe258a070
	.word	0xe458a078
	.word	0xe658a080
	.word	0xe858a088
	.word	0xea58a090
	.word	0xec58a098
	.word	0xee58a0a0
	.word	0xf058a0a8
	.word	0xf258a0b0
	.word	0xf458a0b8
	.word	0xf658a0c0
	.word	0xf858a0c8
	.word	0xfa58a0d0
	.word	0xfc58a0d8
.global Thr1_User_Text_4v000_text_begin
Thr1_User_Text_4v000_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v000_exit
	nop
	.word	0x1000000
	or	%g0, 0x422, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x76, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe5f6f98
	.word	0x1000000
	or	%g0, 0x20, %i7
	ITLB_TAG_READ
	.word	0xf475a050
	.word	0xc034269e
	.word	0x1000000
	or	%g0, 0x60f, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x034, %i7
	LOAD_IDATA_IN
	nop
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x2f7, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x159, %i7
	LOAD_DDATA_ACCESS
	.word	0xf875a000
	.word	0xc02e63e3
	.word	0xbe842068
	.word	0xfadfd000
	DDEMAP_SCTX
	IDEMAP_ALL
	.word	0xd475a0e0
	.word	0xc02129f8
	.word	0x1000000
	or	%g0, 0x44a, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe812130
	.word	0xc4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe05da038
	.word	0xfcdc5120
	.word	0xbe866068
	.word	0xecdfd000
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_SECONDARY_LITTLE_49:
	.word	0x87802089
	.word	0xeaf46108
	.word	0xfcda9000
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe52a884
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v000_exit:
	EXIT_GOOD
Thr1_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v100 DATA_VA=0x650027400000
attr_data {
	Name = .Thr1_User_Data_4v100 ,
	VA = 0x650027400000 ,/* 0x6500277fffc0 */
	RA = 0x019ec00000 ,
	PA = 0x1d9ec00000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 0000650027401c25 8000001d9ec00043 */
	end_label   = Thr1_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v100_data_begin
Thr1_User_Data_4v100_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v200 DATA_VA=0x6400005c0000
attr_data {
	Name = .Thr1_User_Data_4v200 ,
	VA = 0x6400005c0000 ,/* 0x6400005cffc0 */
	RA = 0x03c0540000 ,
	PA = 0x1fc0540000 ,
	TTE_Context = 0x1bc8 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0b0000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 00006400005c1bc8 8000001fc0540441 */
	end_label   = Thr1_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v200_data_begin
Thr1_User_Data_4v200_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v300 DATA_VA=0x640000c50000
attr_data {
	Name = .Thr1_User_Data_4v300 ,
	VA = 0x640000c50000 ,/* 0x640000c5ffc0 */
	RA = 0x03c0130000 ,
	PA = 0x03c0130000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 0000640000c50000 80000003c0130441 */
	end_label   = Thr1_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v300_data_begin
Thr1_User_Data_4v300_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v001 TEXT_VA=0x6310000c6000
attr_text {
	Name = .Thr1_User_Text_4v001 ,
	VA = 0x6310000c6000 ,/* 0x6310000c7fc0 */
	RA = 0x00901aa000 ,
	PA = 0x00901aa000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	/* ITTE_TAG_DATA = 00006310000c78e3 80000000901aa080 */
	end_label   = Thr1_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v001_text_begin
Thr1_User_Text_4v001_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v001_exit
	nop
	.word	0xc45ee038
	.word	0xf65da038
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x118, %i7
	READ_IDATA_ACCESS
thr1_MMU_ASI_PRIMARY_50:
	.word	0x87802080
	.word	0xfaf120d0
	.word	0xf075a000
	.word	0xc0242a3c
	.word	0x1000000
	or	%g0, 0x3de, %i7
	LOAD_DDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	READ_DDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	.word	0xfcded100
	.word	0xc02423cc
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xec5aa098
	nop
thr1_MMU_ASI_PRIMARY_51:
	.word	0x87802080
	.word	0xcaf5a010
	.word	0xfe4429e8
	.word	0x1000000
	or	%g0, 0x05c, %i7
	LOAD_IDATA_IN
	.word	0xc0292208
	.word	0xfcdf5000
	.word	0xd45aa008
	.word	0xec5f6038
	.word	0xfe55aece
	.word	0x1000000
	or	%g0, 0x1b8, %i7
	ITLB_TAG_READ
	.word	0xfe5eee30
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x470, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xe05da0c0
	.word	0xfe576c0a
	.word	0xf65ee008
	ACCESS_ITSB_PTR
	.word	0xfcdd9100
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x054, %i7
	LOAD_DDATA_IN
	DDEMAP_ALL
	.word	0xfcdd9000
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4125bc
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v001_exit:
	EXIT_GOOD
Thr1_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v400 TEXT_VA=0x6400003d0000
attr_text {
	Name = .Thr1_User_Text_4v400 ,
	VA = 0x6400003d0000 ,/* 0x6400003dffc0 */
	RA = 0x03c06e0000 ,
	PA = 0x03c06e0000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr1_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006400003d0000 80000003c06e0481 */
	end_label   = Thr1_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v400_text_begin
Thr1_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xfcdf5000
	P_TOGGLE_LSU_DM
thr1_MMU_ASI_AS_IF_USER_PRIMARY_52:
	.word	0x87802010
	.word	0xe8f42028
	.word	0xbe846070
	.word	0xcadfd060
	.word	0xf0732000
	.word	0xc031a454
	.word	0xfe5328dc
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x488, %i7
	P_ITLB_TAG_READ
	P_IDEMAP_ALL_PAGES
	.word	0xbe842098
	.word	0xf6dfc200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe178000
	P_IDEMAP_RPAGE
thr1_MMU_ASI_AS_IF_USER_SECONDARY_LITTLE_53:
	.word	0x87802019
	.word	0xe6f2e0e8
thr1_MMU_ASI_AS_IF_USER_PRIMARY_54:
	.word	0x87802010
	.word	0xeef66018
	P_ACCESS_ITSB_PTR
	P_IDEMAP_ALL_RPAGES
	.word	0xc034a140
	.word	0xbe85a110
	.word	0xfadfc200
	P_TOGGLE_LSU_DM
	P_IDEMAP_ALL_PAGES
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v400_exit:
	EXIT_GOOD
Thr1_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v002 TEXT_VA=0x65002b000000
attr_text {
	Name = .Thr1_User_Text_4v002 ,
	VA = 0x65002b000000 ,/* 0x65002b3fffc0 */
	RA = 0x0192c00000 ,
	PA = 0x1d92c00000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000065002b001c25 8000001d92c00083 */
	end_label   = Thr1_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v002_text_begin
Thr1_User_Text_4v002_text_begin:
	wrpr	0, %gl
	P_DDEMAP_PCTX
	.word	0xee5920a0
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x081, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x570, %i7
	P_DTLB_TAG_READ
thr1_MMU_ASI_SECONDARY_LITTLE_55:
	.word	0x87802089
	.word	0xe8f16028
	.word	0xf25c2068
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe875a028
	.word	0xc022a9bc
	P_IDEMAP_PCTX
	P_DDEMAP_SCTX
	.word	0xfcdd9000
	nop
	nop
	nop
	.word	0xfe4da225
thr1_MMU_ASI_PRIMARY_56:
	.word	0x87802080
	.word	0xdaf42020
	P_ACCESS_ITSB_PTR
	P_DDEMAP_SCTX
	.word	0xbe816010
	.word	0xe39fde20
	.word	0xda75a020
	.word	0xc026694c
thr1_MMU_ASI_AS_IF_USER_SECONDARY_57:
	.word	0x87802011
	.word	0xccf16018
	.word	0x1000000
	or	%g0, 0x7f0, %i7
	P_READ_DDATA_ACCESS
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x2b6, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x178, %i7
	P_ITLB_TAG_READ
	P_ACCESS_ITSB_PTR
	.word	0xc0276a64
	P_ACCESS_ITSB_PTR
	.word	0xe45da018
	.word	0xe2742010
	.word	0xc035a346
	.word	0xcc5c2018
	P_ACCESS_DTSB_PTR
	.word	0xfa5aa038
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_58:
	.word	0x8780202b
	.word	0xd0bc6a30
	.word	0xfcdc0200
	.word	0xfe46ea98
	.word	0x1000000
	or	%g0, 0x470, %i7
	P_ITLB_TAG_READ
	.word	0xc076ed10
	.word	0xf25e60e0
	P_TOGGLE_LSU_IM
thr1_MMU_ASI_AS_IF_USER_PRIMARY_59:
	.word	0x87802010
	.word	0xeaf5a050
	P_DDEMAP_ALL
	.word	0xd872a0a0
	.word	0xc02e63f7
	.word	0xc675a080
	.word	0xc02f64be
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_AS_IF_USER_PRIMARY_60:
	.word	0x87802010
	.word	0xe6f12118
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v002_exit:
	EXIT_GOOD
Thr1_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v101 DATA_VA=0x631000076000
attr_data {
	Name = .Thr1_User_Data_4v101 ,
	VA = 0x631000076000 ,/* 0x631000077fc0 */
	RA = 0x00900ae000 ,
	PA = 0x00900ae000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 00006310000778e3 80000000900ae040 */
	end_label   = Thr1_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v101_data_begin
Thr1_User_Data_4v101_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v201 DATA_VA=0x640000890000
attr_data {
	Name = .Thr1_User_Data_4v201 ,
	VA = 0x640000890000 ,/* 0x64000089ffc0 */
	RA = 0x03c0db0000 ,
	PA = 0x1fc0db0000 ,
	TTE_Context = 0x1bc8 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0b0000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000640000891bc8 8000001fc0db0441 */
	end_label   = Thr1_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v201_data_begin
Thr1_User_Data_4v201_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v301 DATA_VA=0x640000b00000
attr_data {
	Name = .Thr1_User_Data_4v301 ,
	VA = 0x640000b00000 ,/* 0x640000b0ffc0 */
	RA = 0x03c03a0000 ,
	PA = 0x03c03a0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 0000640000b00000 80000003c03a0441 */
	end_label   = Thr1_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v301_data_begin
Thr1_User_Data_4v301_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v003 TEXT_VA=0x631000114000
attr_text {
	Name = .Thr1_User_Text_4v003 ,
	VA = 0x631000114000 ,/* 0x631000115fc0 */
	RA = 0x009004e000 ,
	PA = 0x009004e000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	/* ITTE_TAG_DATA = 00006310001158e3 800000009004e080 */
	end_label   = Thr1_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v003_text_begin
Thr1_User_Text_4v003_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v003_exit
	nop
thr1_MMU_ASI_PRIMARY_LITTLE_61:
	.word	0x87802088
	.word	0xe2f5a010
	.word	0x1000000
	or	%g0, 0x454, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x420, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x78, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xee5c2078
thr1_MMU_ASI_BLK_COMMIT_P_62:
	.word	0x878020e0
	.word	0xc1baa700
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
thr1_MMU_ASI_PRIMARY_63:
	.word	0x87802080
	.word	0xdcf2a028
thr1_MMU_ASI_BLK_COMMIT_P_64:
	.word	0x878020e0
	.word	0xe1baabc0
	DDEMAP_SCTX
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc67760c8
	.word	0xc0776460
	.word	0xfe466378
	.word	0xc022a848
	TOGGLE_LSU_DM
	.word	0xc875a120
	.word	0xc076e608
	.word	0xfe45ad9c
	.word	0x1000000
	or	%g0, 0x370, %i7
	DTLB_TAG_READ
	.word	0xc072abf0
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	ITLB_TAG_READ
	.word	0xd45aa098
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xc024262c
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v003_exit:
	EXIT_GOOD
Thr1_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v401 TEXT_VA=0x650021000000
attr_text {
	Name = .Thr1_User_Text_4v401 ,
	VA = 0x650021000000 ,/* 0x6500213fffc0 */
	RA = 0x019c400000 ,
	PA = 0x1d9c400000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr1_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 0000650021000000 8000001d9c400483 */
	end_label   = Thr1_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v401_text_begin
Thr1_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe15c000
	P_DDEMAP_RPAGE
	P_IDEMAP_ALL_RPAGES
	.word	0xfcda8200
	.word	0xfcd88200
	.word	0xfe49af91
thr1_MMU_ASI_PRIMARY_65:
	.word	0x87802080
	.word	0xccf2a0a0
	.word	0xc024a380
	nop
	nop
	nop
	P_DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x369, %i7
	P_LOAD_DDATA_ACCESS
	P_DDEMAP_NCTX
	.word	0xfcda4280
	.word	0x1000000
	or	%g0, 0x069, %i7
	P_LOAD_IDATA_IN
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x210, %i7
	P_READ_DDATA_ACCESS
	P_ACCESS_ITSB_PTR
	.word	0xbe85a120
	.word	0xf2dfd040
	P_IDEMAP_PCTX
	.word	0xbe842068
	.word	0xd4dfd000
	.word	0xde732030
	.word	0xc034aabc
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	P_ITLB_TAG_READ
thr1_MMU_ASI_AS_IF_USER_PRIMARY_66:
	.word	0x87802010
	.word	0xc4f5a100
	.word	0xfe4deb00
thr1_MMU_ASI_PRIMARY_LITTLE_67:
	.word	0x87802088
	.word	0xd2f76090
	.word	0xf259a068
	.word	0xfe5de790
	P_DDEMAP_ALL_RPAGES
	P_IDEMAP_ALL_PAGES
	nop
	.word	0x1000000
	or	%g0, 0x0b1, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a138
	.word	0xd4dfc200
	nop
	.word	0xfcdc0200
thr1_MMU_ASI_AS_IF_USER_PRIMARY_68:
	.word	0x87802010
	.word	0xd2f2a0a8
	.word	0xf65b2068
	P_DDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_PAGES
	.word	0xbe86e098
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x680, %i7
	P_READ_DDATA_ACCESS
	.word	0xfcda9000
	P_TOGGLE_LSU_DM
	.word	0xe19943e0
thr1_MMU_ASI_AS_IF_USER_PRIMARY_69:
	.word	0x87802010
	.word	0xd6f5a010
	.word	0x1000000
	or	%g0, 0x42c, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe168000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v401_exit:
	EXIT_GOOD
Thr1_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v004 TEXT_VA=0x650023000000
attr_text {
	Name = .Thr1_User_Text_4v004 ,
	VA = 0x650023000000 ,/* 0x6500233fffc0 */
	RA = 0x019f000000 ,
	PA = 0x1d9f000000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 0000650023001c25 8000001d9f000083 */
	end_label   = Thr1_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v004_text_begin
Thr1_User_Text_4v004_text_begin:
	wrpr	0, %gl
thr1_MMU_ASI_AS_IF_USER_PRIMARY_70:
	.word	0x87802010
	.word	0xc4f2a100
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	P_READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x698, %i7
	P_DTLB_TAG_READ
thr1_MMU_ASI_AS_IF_USER_PRIMARY_71:
	.word	0x87802010
	.word	0xcef66020
	P_DDEMAP_NCTX
	.word	0xbe816010
	.word	0xc19fc2e0
thr1_MMU_ASI_SECONDARY_72:
	.word	0x87802081
	.word	0xdcb96a10
	.word	0xfc9e5000
	.word	0x1000000
	or	%g0, 0x400, %i7
	P_READ_DDATA_ACCESS
	.word	0xfe5aaec8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xce, %i7
	P_LOAD_IDATA_ACCESS
	P_TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_ALL
	.word	0xf65da120
	P_DDEMAP_ALL
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_73:
	.word	0x8780202a
	.word	0xe8b8ac20
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x170, %i7
	P_DTLB_TAG_READ
	.word	0xfe45a764
thr1_MMU_ASI_SECONDARY_74:
	.word	0x87802081
	.word	0xdcbae700
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	.word	0xbe86e0e0
	.word	0xe0dfd040
	.word	0x1000000
	or	%g0, 0x458, %i7
	P_ITLB_TAG_READ
	.word	0xfcdd9000
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v004_exit:
	EXIT_GOOD
Thr1_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v102 DATA_VA=0x65002f400000
attr_data {
	Name = .Thr1_User_Data_4v102 ,
	VA = 0x65002f400000 ,/* 0x65002f7fffc0 */
	RA = 0x019d400000 ,
	PA = 0x1d9d400000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 000065002f401c25 8000001d9d400043 */
	end_label   = Thr1_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v102_data_begin
Thr1_User_Data_4v102_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v202 DATA_VA=0x65003e800000
attr_data {
	Name = .Thr1_User_Data_4v202 ,
	VA = 0x65003e800000 ,/* 0x65003ebfffc0 */
	RA = 0x0192800000 ,
	PA = 0x1d92800000 ,
	TTE_Context = 0x1bc8 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0b0000 ,
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
	/* DTTE_TAG_DATA = 000065003e801a24 8000001d92800443 */
	end_label   = Thr1_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v202_data_begin
Thr1_User_Data_4v202_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v302 DATA_VA=0x6310001e0000
attr_data {
	Name = .Thr1_User_Data_4v302 ,
	VA = 0x6310001e0000 ,/* 0x6310001e1fc0 */
	RA = 0x0090140000 ,
	PA = 0x0090140000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 00006310001e0000 8000000090140440 */
	end_label   = Thr1_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v302_data_begin
Thr1_User_Data_4v302_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v005 TEXT_VA=0x631000010000
attr_text {
	Name = .Thr1_User_Text_4v005 ,
	VA = 0x631000010000 ,/* 0x631000011fc0 */
	RA = 0x0090010000 ,
	PA = 0x0090010000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	/* ITTE_TAG_DATA = 00006310000118e3 8000000090010080 */
	end_label   = Thr1_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v005_text_begin
Thr1_User_Text_4v005_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v005_exit
	nop
	.word	0xbe85a0e0
	.word	0xecdfd000
	.word	0x1000000
	.word	0xbe128000
	DDEMAP_RPAGE
	.word	0xfe4da201
	.word	0xee742018
	.word	0xc032a496
	.word	0xd8766048
	.word	0xc076ebb8
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc0312888
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	READ_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x025, %i7
	LOAD_DDATA_IN
	.word	0xe45e6018
	.word	0xc022a140
	.word	0x1000000
	or	%g0, 0x488, %i7
	READ_IDATA_ACCESS
	IDEMAP_NCTX
	.word	0xbe85a110
	.word	0xf2dfd000
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe55a62e
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v005_exit:
	EXIT_GOOD
Thr1_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v402 TEXT_VA=0x65003e000000
attr_text {
	Name = .Thr1_User_Text_4v402 ,
	VA = 0x65003e000000 ,/* 0x65003e3fffc0 */
	RA = 0x019d800000 ,
	PA = 0x1d9d800000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr1_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000065003e000000 8000001d9d800483 */
	end_label   = Thr1_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v402_text_begin
Thr1_User_Text_4v402_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x249, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfe49aee9
	.word	0x1000000
	or	%g0, 0x80, %i7
	P_DTLB_TAG_READ
	P_IDEMAP_ALL
thr1_MMU_ASI_PRIMARY_75:
	.word	0x87802080
	.word	0xf0f6e030
	nop
	nop
	nop
	nop
	.word	0xfcde5000
	P_DDEMAP_SCTX
	nop
	nop
	.word	0xfc9c5d60
	P_DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc029ad8c
	nop
	nop
	nop
	.word	0xbe82a130
	.word	0xe19fc2c0
	.word	0xc674a020
	.word	0xc02de896
thr1_MMU_ASI_AS_IF_USER_PRIMARY_76:
	.word	0x87802010
	.word	0xdaf2a0a8
	.word	0xfcdc1000
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe86e098
	.word	0xecdfd000
	.word	0xfcdc0200
	.word	0xfcdc1000
	P_IDEMAP_ALL
	.word	0xc674a090
	.word	0xc02b292a
	nop
	nop
	nop
	nop
	nop
	.word	0xc029a983
	.word	0xc19e5f00
	.word	0xd85ca018
	.word	0xfcdec380
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v402_exit:
	EXIT_GOOD
Thr1_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v006 TEXT_VA=0x631000084000
attr_text {
	Name = .Thr1_User_Text_4v006 ,
	VA = 0x631000084000 ,/* 0x631000085fc0 */
	RA = 0x00901d8000 ,
	PA = 0x00901d8000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00006310000858e3 80000000901d8080 */
	end_label   = Thr1_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v006_text_begin
Thr1_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0xbe842038
	.word	0xecdfc200
	P_ACCESS_ITSB_PTR
	.word	0xec58a008
thr1_MMU_ASI_BLK_P_77:
	.word	0x878020f0
	.word	0xc1bda280
thr1_MMU_ASI_SECONDARY_78:
	.word	0x87802081
	.word	0xf4b964c0
	.word	0xbe86e130
	.word	0xe0dfd000
	.word	0xe870a028
	.word	0xc02dab12
thr1_MMU_ASI_BLK_COMMIT_P_79:
	.word	0x878020e0
	.word	0xc3bc22c0
	P_DDEMAP_ALL_PAGES
thr1_MMU_ASI_PRIMARY_80:
	.word	0x87802080
	.word	0xeef5a048
	.word	0x1000000
	or	%g0, 0x059, %i7
	P_LOAD_DDATA_IN
	.word	0xbe85a0f0
	.word	0xe0dfd000
	P_TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a110
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x9b, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcda42a0
	.word	0xfcdc1000
	P_IDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe140000
	P_DDEMAP_PAGE
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x198, %i7
	P_ITLB_TAG_READ
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v006_exit:
	EXIT_GOOD
Thr1_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v103 DATA_VA=0x65003c000000
attr_data {
	Name = .Thr1_User_Data_4v103 ,
	VA = 0x65003c000000 ,/* 0x65003c3fffc0 */
	RA = 0x0195400000 ,
	PA = 0x1d95400000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 000065003c001c25 8000001d95400043 */
	end_label   = Thr1_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v103_data_begin
Thr1_User_Data_4v103_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v303 DATA_VA=0x63100013c000
attr_data {
	Name = .Thr1_User_Data_4v303 ,
	VA = 0x63100013c000 ,/* 0x63100013dfc0 */
	RA = 0x0090152000 ,
	PA = 0x0090152000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 000063100013c000 8000000090152440 */
	end_label   = Thr1_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v303_data_begin
Thr1_User_Data_4v303_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v007 TEXT_VA=0x640000930000
attr_text {
	Name = .Thr1_User_Text_4v007 ,
	VA = 0x640000930000 ,/* 0x64000093ffc0 */
	RA = 0x03c0110000 ,
	PA = 0x1fc0110000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006400009318e3 8000001fc0110081 */
	end_label   = Thr1_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v007_text_begin
Thr1_User_Text_4v007_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v007_exit
	nop
	.word	0xfe5666a6
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a038
	.word	0xc4dfd000
	.word	0xc026e874
thr1_MMU_ASI_PRIMARY_LITTLE_81:
	.word	0x87802088
	.word	0xdef42050
	.word	0x1000000
	.word	0xbe160000
	DDEMAP_PAGE
	.word	0xbe8660b0
	.word	0xe0dfd000
	.word	0xca5c2010
	.word	0x1000000
	or	%g0, 0x570, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x58, %i7
	READ_DDATA_ACCESS
	.word	0xc032a66e
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x4d8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x720, %i7
	DTLB_TAG_READ
	.word	0xf25da120
	.word	0xe672a128
	.word	0xc02da868
	.word	0x1000000
	or	%g0, 0xe0, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0xbe842068
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x093, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	IDEMAP_ALL_RPAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe4dae46
thr1_MMU_ASI_PRIMARY_82:
	.word	0x87802080
	.word	0xfaf660f0
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe160000
	IDEMAP_RPAGE
	.word	0xd6766040
	.word	0xc0342e7a
	.word	0x1000000
	or	%g0, 0x034, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x48, %i7
	DTLB_TAG_READ
	IDEMAP_ALL_RPAGES
	ACCESS_DTSB_PTR
	.word	0xc0242cec
	.word	0xf675a068
	.word	0xc02c2b61
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x074, %i7
	LOAD_IDATA_IN
	.word	0xc035a2ac
	IDEMAP_ALL
	.word	0xe05c20f0
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xfe4c2f46
thr1_MMU_ASI_BLK_SL_83:
	.word	0x878020f9
	.word	0xc1b96580
	DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x60, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x480, %i7
	READ_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xbe866098
	.word	0xf6dfd000
	.word	0x1000000
	.word	0xbe170000
	DDEMAP_RPAGE
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xea72a0b8
	.word	0xc02ee662
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v007_exit:
	EXIT_GOOD
Thr1_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v104 DATA_VA=0x63100007a000
attr_data {
	Name = .Thr1_User_Data_4v104 ,
	VA = 0x63100007a000 ,/* 0x63100007bfc0 */
	RA = 0x0090132000 ,
	PA = 0x0090132000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 000063100007b8e3 8000000090132040 */
	end_label   = Thr1_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v104_data_begin
Thr1_User_Data_4v104_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v008 TEXT_VA=0x640000bd0000
attr_text {
	Name = .Thr1_User_Text_4v008 ,
	VA = 0x640000bd0000 ,/* 0x640000bdffc0 */
	RA = 0x03c0b60000 ,
	PA = 0x1fc0b60000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000640000bd18e3 8000001fc0b60081 */
	end_label   = Thr1_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v008_text_begin
Thr1_User_Text_4v008_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v008_exit
	nop
	.word	0x1000000
	or	%g0, 0x510, %i7
	READ_IDATA_ACCESS
	.word	0xbe816040
	.word	0xc19fde20
	DDEMAP_NCTX
	TOGGLE_LSU_DM
	TOGGLE_LSU_IM
	.word	0xbe138000
	GOTO_SUPERVISOR1
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe442f4c
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe52a47a
	.word	0x1000000
	or	%g0, 0x4b6, %i7
	LOAD_IDATA_ACCESS
thr1_MMU_ASI_PRIMARY_84:
	.word	0x87802080
	.word	0xcaf42010
thr1_MMU_ASI_PRIMARY_85:
	.word	0x87802080
	.word	0xf4f6e0e8
	.word	0x1000000
	or	%g0, 0x90, %i7
	READ_IDATA_ACCESS
	IDEMAP_NCTX
	nop
	nop
	.word	0x1000000
	or	%g0, 0x01c, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x076, %i7
	LOAD_DDATA_IN
	.word	0xfc9c1c40
	.word	0xfa72a068
	.word	0xc075a1b0
	.word	0x1000000
	or	%g0, 0x04b, %i7
	LOAD_IDATA_IN
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x430, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x730, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
thr1_MMU_ASI_SECONDARY_LITTLE_86:
	.word	0x87802089
	.word	0xc0baeb20
	.word	0x1000000
	or	%g0, 0x07d, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x4b3, %i7
	LOAD_IDATA_ACCESS
	.word	0xd476e008
	.word	0xc02da613
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x03a, %i7
	LOAD_IDATA_IN
	IDEMAP_NCTX
	.word	0xd458a100
	.word	0x1000000
	or	%g0, 0x08d, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x010, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc032ad18
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v008_exit:
	EXIT_GOOD
Thr1_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v105 DATA_VA=0x650002400000
attr_data {
	Name = .Thr1_User_Data_4v105 ,
	VA = 0x650002400000 ,/* 0x6500027fffc0 */
	RA = 0x019b800000 ,
	PA = 0x1d9b800000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 0000650002401c25 8000001d9b800043 */
	end_label   = Thr1_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v105_data_begin
Thr1_User_Data_4v105_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v009 TEXT_VA=0x640000a30000
attr_text {
	Name = .Thr1_User_Text_4v009 ,
	VA = 0x640000a30000 ,/* 0x640000a3ffc0 */
	RA = 0x03c07f0000 ,
	PA = 0x1fc07f0000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000640000a318e3 8000001fc07f0081 */
	end_label   = Thr1_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v009_text_begin
Thr1_User_Text_4v009_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v009_exit
	nop
	.word	0xc0366140
	.word	0x1000000
	or	%g0, 0x360, %i7
	READ_DDATA_ACCESS
	ACCESS_ITSB_PTR
	TOGGLE_LSU_IM
	.word	0xfe50a20c
	.word	0xc032a140
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0xfcdad020
	.word	0xbe86e0d0
	.word	0xf2dfd000
	.word	0xc45c2068
	.word	0xf876e050
	.word	0xc0766450
	.word	0xbe842098
	.word	0xf6dfd000
	ACCESS_DTSB_PTR
	.word	0xd85da078
thr1_MMU_ASI_BLK_P_87:
	.word	0x878020f0
	.word	0xc3b8a540
	.word	0xbe13c000
	GOTO_SUPERVISOR0
thr1_MMU_ASI_PRIMARY_88:
	.word	0x87802080
	.word	0xd2f12118
	TOGGLE_LSU_DM
	.word	0xee5c2078
	nop
	nop
	nop
	.word	0xfe5da078
	.word	0xee5aa078
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0xb3, %i7
	LOAD_IDATA_ACCESS
	.word	0xd65e6010
	.word	0xc02da803
	.word	0xd47660f0
	.word	0xc026ec70
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe14c000
	DDEMAP_RPAGE
	IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8660e0
	.word	0xecdfd000
	IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xfe442638
	.word	0xe05f6138
	.word	0xec5aa068
	.word	0xbe85a0c0
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x438, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x548, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe168000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	DDEMAP_ALL_RPAGES
	.word	0xc02c222c
thr1_MMU_ASI_PRIMARY_89:
	.word	0x87802080
	.word	0xccf66018
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xd45da068
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v009_exit:
	EXIT_GOOD
Thr1_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v106 DATA_VA=0x63100016c000
attr_data {
	Name = .Thr1_User_Data_4v106 ,
	VA = 0x63100016c000 ,/* 0x63100016dfc0 */
	RA = 0x00900de000 ,
	PA = 0x00900de000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 000063100016d8e3 80000000900de040 */
	end_label   = Thr1_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v106_data_begin
Thr1_User_Data_4v106_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00a TEXT_VA=0x631000000000
attr_text {
	Name = .Thr1_User_Text_4v00a ,
	VA = 0x631000000000 ,/* 0x631000001fc0 */
	RA = 0x00900ce000 ,
	PA = 0x00900ce000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	/* ITTE_TAG_DATA = 00006310000018e3 80000000900ce080 */
	end_label   = Thr1_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v00a_text_begin
Thr1_User_Text_4v00a_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v00a_exit
	nop
	.word	0xec5c20b0
	.word	0xc67120e8
	.word	0xc035aa90
	.word	0xfcded000
	.word	0xfa76e0b0
	.word	0xc02ee4a8
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x88, %i7
	DTLB_TAG_READ
	.word	0xca5da010
	.word	0xec5f60e0
	.word	0xdc766028
	.word	0xc028a8ec
thr1_MMU_ASI_BLK_COMMIT_S_90:
	.word	0x878020e1
	.word	0xe3b96980
thr1_MMU_ASI_BLK_S_91:
	.word	0x878020f1
	.word	0xc3b96b80
	.word	0x1000000
	or	%g0, 0x032, %i7
	LOAD_DDATA_IN
	.word	0xbe82e010
	.word	0xcadfd020
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x18, %i7
	READ_IDATA_ACCESS
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe15c000
	IDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
thr1_MMU_ASI_PRIMARY_92:
	.word	0x87802080
	.word	0xc4f6e068
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xec5aa038
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00a_exit:
	EXIT_GOOD
Thr1_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v107 DATA_VA=0x631000062000
attr_data {
	Name = .Thr1_User_Data_4v107 ,
	VA = 0x631000062000 ,/* 0x631000063fc0 */
	RA = 0x0090096000 ,
	PA = 0x0090096000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 00006310000638e3 8000000090096040 */
	end_label   = Thr1_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v107_data_begin
Thr1_User_Data_4v107_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00b TEXT_VA=0x6400005f0000
attr_text {
	Name = .Thr1_User_Text_4v00b ,
	VA = 0x6400005f0000 ,/* 0x6400005fffc0 */
	RA = 0x03c0000000 ,
	PA = 0x1fc0000000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006400005f18e3 8000001fc0000081 */
	end_label   = Thr1_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v00b_text_begin
Thr1_User_Text_4v00b_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v00b_exit
	nop
	.word	0x1000000
	or	%g0, 0x438, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x047, %i7
	LOAD_DDATA_IN
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe4776078
	.word	0xc024299c
	.word	0xc872a0d0
	.word	0xc02dac54
	.word	0xec5f6038
	.word	0xee72a018
	.word	0xc0242140
	.word	0xfe55a61a
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xd4592038
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v00b_exit:
	EXIT_GOOD
Thr1_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v108 DATA_VA=0x6310001a6000
attr_data {
	Name = .Thr1_User_Data_4v108 ,
	VA = 0x6310001a6000 ,/* 0x6310001a7fc0 */
	RA = 0x0090052000 ,
	PA = 0x0090052000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 00006310001a78e3 8000000090052040 */
	end_label   = Thr1_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v108_data_begin
Thr1_User_Data_4v108_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00c TEXT_VA=0x63100019e000
attr_text {
	Name = .Thr1_User_Text_4v00c ,
	VA = 0x63100019e000 ,/* 0x63100019ffc0 */
	RA = 0x0090070000 ,
	PA = 0x0090070000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	/* ITTE_TAG_DATA = 000063100019f8e3 8000000090070080 */
	end_label   = Thr1_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v00c_text_begin
Thr1_User_Text_4v00c_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v00c_exit
	nop
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	nop
	.word	0x1000000
	.word	0xbe170000
	IDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02aa668
	DDEMAP_SCTX
	IDEMAP_PCTX
	IDEMAP_ALL_RPAGES
	DDEMAP_ALL_PAGES
	.word	0xfe55a4a6
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x410, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x094, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x133, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	ITLB_TAG_READ
	.word	0xd45e6110
	.word	0x1000000
	or	%g0, 0x93, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe56e3ac
	.word	0xc0766918
	.word	0x1000000
	or	%g0, 0x568, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x02d, %i7
	LOAD_IDATA_IN
	.word	0xfe55aa0e
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5dac08
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v00c_exit:
	EXIT_GOOD
Thr1_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v109 DATA_VA=0x6310000ee000
attr_data {
	Name = .Thr1_User_Data_4v109 ,
	VA = 0x6310000ee000 ,/* 0x6310000effc0 */
	RA = 0x009000a000 ,
	PA = 0x009000a000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 00006310000ef8e3 800000009000a040 */
	end_label   = Thr1_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v109_data_begin
Thr1_User_Data_4v109_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00d TEXT_VA=0x6310001b0000
attr_text {
	Name = .Thr1_User_Text_4v00d ,
	VA = 0x6310001b0000 ,/* 0x6310001b1fc0 */
	RA = 0x00901a8000 ,
	PA = 0x00901a8000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	/* ITTE_TAG_DATA = 00006310001b18e3 80000000901a8080 */
	end_label   = Thr1_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v00d_text_begin
Thr1_User_Text_4v00d_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v00d_exit
	nop
	.word	0xfcde5000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda9000
	.word	0xc025ad08
	.word	0x1000000
	or	%g0, 0x40, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x047, %i7
	LOAD_IDATA_IN
	.word	0xfcda9000
	.word	0xd65c2010
	.word	0xd85c2018
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0742350
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v00d_exit:
	EXIT_GOOD
Thr1_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10a DATA_VA=0x6400000d0000
attr_data {
	Name = .Thr1_User_Data_4v10a ,
	VA = 0x6400000d0000 ,/* 0x6400000dffc0 */
	RA = 0x03c0c60000 ,
	PA = 0x1fc0c60000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 00006400000d18e3 8000001fc0c60041 */
	end_label   = Thr1_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10a_data_begin
Thr1_User_Data_4v10a_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00e TEXT_VA=0x6310001e6000
attr_text {
	Name = .Thr1_User_Text_4v00e ,
	VA = 0x6310001e6000 ,/* 0x6310001e7fc0 */
	RA = 0x0090026000 ,
	PA = 0x0090026000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	/* ITTE_TAG_DATA = 00006310001e78e3 8000000090026080 */
	end_label   = Thr1_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v00e_text_begin
Thr1_User_Text_4v00e_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v00e_exit
	nop
	IDEMAP_NCTX
thr1_MMU_ASI_PRIMARY_93:
	.word	0x87802080
	.word	0xcaf12070
	.word	0xfe45a308
	.word	0x1000000
	.word	0xbe134000
	IDEMAP_PAGE
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x45b, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcded000
	.word	0xc0312dde
	DDEMAP_ALL_RPAGES
	.word	0xbe82a098
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x03d, %i7
	LOAD_DDATA_IN
	.word	0xf2766038
	.word	0xc0742498
	.word	0xec5da110
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_PAGE
	.word	0xee712048
	.word	0xc0242fa8
	.word	0xbe80a038
	.word	0xf2dfd000
	.word	0xde712020
	.word	0xc035a140
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xe07420c0
	.word	0xc035a344
	DDEMAP_ALL_PAGES
thr1_MMU_ASI_PRIMARY_94:
	.word	0x87802080
	.word	0xc8f660d0
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x10b, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5e8, %i7
	READ_DDATA_ACCESS
	.word	0xec5c20c0
	.word	0x1000000
	or	%g0, 0x340, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe144000
	DDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	IDEMAP_NCTX
	.word	0xc02da140
	.word	0xfcdf5000
	.word	0xbe85a068
	.word	0xf2dfd000
	ACCESS_ITSB_PTR
	.word	0xc076e140
thr1_MMU_ASI_PRIMARY_95:
	.word	0x87802080
	.word	0xf0f42118
	.word	0xbe8420d0
	.word	0xe0dfd000
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe05c2008
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00e_exit:
	EXIT_GOOD
Thr1_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10b DATA_VA=0x631000150000
attr_data {
	Name = .Thr1_User_Data_4v10b ,
	VA = 0x631000150000 ,/* 0x631000151fc0 */
	RA = 0x0090000000 ,
	PA = 0x0090000000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 00006310001518e3 8000000090000040 */
	end_label   = Thr1_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10b_data_begin
Thr1_User_Data_4v10b_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00f TEXT_VA=0x640000230000
attr_text {
	Name = .Thr1_User_Text_4v00f ,
	VA = 0x640000230000 ,/* 0x64000023ffc0 */
	RA = 0x03c0fb0000 ,
	PA = 0x1fc0fb0000 ,
	TTE_Context = 0x18e3 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006400002318e3 8000001fc0fb0081 */
	end_label   = Thr1_User_Text_4v00f_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v00f_text_begin
Thr1_User_Text_4v00f_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr1_User_Text_4v00f_exit
	nop
	.word	0xc02aab36
	.word	0x1000000
	or	%g0, 0x6b0, %i7
	READ_DDATA_ACCESS
	.word	0xc02763c0
	.word	0xc02428b8
	.word	0xbe842068
	.word	0xf2dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a120
	.word	0xf2dfd000
thr1_MMU_ASI_PRIMARY_96:
	.word	0x87802080
	.word	0xf2f0a098
	.word	0xc872a110
	.word	0xc0242bf8
thr1_MMU_ASI_BLK_COMMIT_P_97:
	.word	0x878020e0
	.word	0xe3be6680
	.word	0xc025a768
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0xec5da098
	.word	0x1000000
	or	%g0, 0x43c, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x405, %i7
	LOAD_DDATA_ACCESS
	.word	0xc072ae30
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr1_MMU_ASI_PRIMARY_98:
	.word	0x87802080
	.word	0xdcbc2670
	ACCESS_DTSB_PTR
	.word	0xbe82a098
	.word	0xf2dfd000
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xf25aa068
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v00f_exit:
	EXIT_GOOD
Thr1_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10c DATA_VA=0x6607f0000000
attr_data {
	Name = .Thr1_User_Data_4v10c ,
	VA = 0x6607f0000000 ,/* 0x6607ffffffc0 */
	RA = 0x0210000000 ,
	PA = 0x1e10000000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 00006607f00018e3 8000001e10000045 */
	end_label   = Thr1_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10c_data_begin
Thr1_User_Data_4v10c_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10d DATA_VA=0x640000d90000
attr_data {
	Name = .Thr1_User_Data_4v10d ,
	VA = 0x640000d90000 ,/* 0x640000d9ffc0 */
	RA = 0x03c0d70000 ,
	PA = 0x1fc0d70000 ,
	TTE_Context = 0x18e3 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 0000640000d918e3 8000001fc0d70041 */
	end_label   = Thr1_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10d_data_begin
Thr1_User_Data_4v10d_data_begin:
	.xword	0x640000d20000
	.xword	0x650027400000
	.xword	0x6400005c0000
	.xword	0x640000c50000
	.xword	0x6310000c6000
	.xword	0x6400003d0000
	.xword	0x65002b000000
	.xword	0x631000076000
	.xword	0x640000890000
	.xword	0x640000b00000
	.xword	0x631000114000
	.xword	0x650021000000
	.xword	0x650023000000
	.xword	0x65002f400000
	.xword	0x65003e800000
	.xword	0x6310001e0000
	.xword	0x631000010000
	.xword	0x65003e000000
	.xword	0x631000084000
	.xword	0x65003c000000
	.xword	0x63100013c000
	.xword	0x640000930000
	.xword	0x63100007a000
	.xword	0x640000bd0000
	.xword	0x650002400000
	.xword	0x640000a30000
	.xword	0x63100016c000
	.xword	0x631000000000
	.xword	0x631000062000
	.xword	0x6400005f0000
	.xword	0x6310001a6000
	.xword	0x63100019e000
	.xword	0x6310000ee000
	.xword	0x6310001b0000
	.xword	0x6400000d0000
	.xword	0x6310001e6000
	.xword	0x631000150000
	.xword	0x640000230000
	.xword	0x6607f0000000
	.xword	0x640000d90000
Thr1_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x672000042000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	VA = 0x672000042000 ,/* 0x672000043fc0 */
	RA = 0x00a005a000 ,
	PA = 0x00a005a000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00006720000432a1 80000000a005a480 */
	end_label   = Thr2_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr2_user_code_entry
Thr2_user_code_entry:
	setx	0x67200017c000, %g1, %g2
	or	%g0, 12, %g1
	.word	0xc658a000
	.word	0xc858a008
	.word	0xca58a010
	.word	0xcc58a018
	.word	0xce58a020
	.word	0xd058a028
	.word	0xd258a030
	.word	0xd458a038
	.word	0xd658a040
	.word	0xd858a048
	.word	0xda58a050
	.word	0xdc58a058
	.word	0xde58a060
	.word	0xe058a068
	.word	0xe258a070
	.word	0xe458a078
	.word	0xe658a080
	.word	0xe858a088
	.word	0xea58a090
	.word	0xec58a098
	.word	0xee58a0a0
	.word	0xf058a0a8
	.word	0xf258a0b0
	.word	0xf458a0b8
	.word	0xf658a0c0
	.word	0xf858a0c8
	.word	0xfa58a0d0
	.word	0xfc58a0d8
.global Thr2_User_Text_4v000_text_begin
Thr2_User_Text_4v000_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v000_exit
	nop
	.word	0xfe42aed8
	nop
	nop
	nop
	.word	0xfe4d21c7
	.word	0xde70a000
	.word	0xc02d22bf
	.word	0xc02c21b5
	.word	0xea76e0d8
	.word	0xc029227d
	IDEMAP_ALL
thr2_MMU_ASI_PRIMARY_99:
	.word	0x87802080
	.word	0xe6f52028
thr2_MMU_ASI_PRIMARY_LITTLE_100:
	.word	0x87802088
	.word	0xe0b92cc0
	DDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	.word	0xbe876008
	.word	0xe8dfd000
	.word	0xee5f6068
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	.word	0xd870a018
	.word	0xc07427e0
	ACCESS_ITSB_PTR
thr2_MMU_ASI_PRIMARY_101:
	.word	0x87802080
	.word	0xfaf42150
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x00b, %i7
	LOAD_DDATA_IN
	.word	0xfcdc1000
	.word	0xda776090
	.word	0xc0376160
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x118, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x1c8, %i7
	READ_IDATA_ACCESS
	.word	0xc675e000
	.word	0xc0342e68
	.word	0x1000000
	or	%g0, 0x53, %i7
	LOAD_IDATA_ACCESS
thr2_MMU_ASI_BLK_P_102:
	.word	0x878020f0
	.word	0xe1baa140
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0xbe852068
	.word	0xd4dfd040
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	READ_IDATA_ACCESS
	.word	0xc0342160
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_PRIMARY_LITTLE_103:
	.word	0x87802088
	.word	0xd2f42030
	.word	0xd458a150
	TOGGLE_LSU_DM
	IDEMAP_ALL_RPAGES
	.word	0xfa776008
	.word	0xc07524c8
	.word	0xee5c20a0
	.word	0xbe82a120
	.word	0xe0dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe86e128
	.word	0xf6dfd000
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	.word	0xfcdc1000
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc85ee150
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v000_exit:
	EXIT_GOOD
Thr2_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v100 DATA_VA=0x67200017c000
attr_data {
	Name = .Thr2_User_Data_4v100 ,
	VA = 0x67200017c000 ,/* 0x67200017dfc0 */
	RA = 0x00a0074000 ,
	PA = 0x00a0074000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 000067200017d2a1 80000000a0074040 */
	end_label   = Thr2_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v100_data_begin
Thr2_User_Data_4v100_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v200 DATA_VA=0x6a0040000000
attr_data {
	Name = .Thr2_User_Data_4v200 ,
	VA = 0x6a0040000000 ,/* 0x6a004fffffc0 */
	RA = 0x0220000000 ,
	PA = 0x2e20000000 ,
	TTE_Context = 0x09a1 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x180000 ,
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
	/* DTTE_TAG_DATA = 00006a00400009a1 8000002e20000445 */
	end_label   = Thr2_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v200_data_begin
Thr2_User_Data_4v200_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v300 DATA_VA=0x67200006c000
attr_data {
	Name = .Thr2_User_Data_4v300 ,
	VA = 0x67200006c000 ,/* 0x67200006dfc0 */
	RA = 0x00a00b0000 ,
	PA = 0x00a00b0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0f0000 ,
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
	/* DTTE_TAG_DATA = 000067200006c000 80000000a00b0440 */
	end_label   = Thr2_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v300_data_begin
Thr2_User_Data_4v300_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v001 TEXT_VA=0x6720000ec000
attr_text {
	Name = .Thr2_User_Text_4v001 ,
	VA = 0x6720000ec000 ,/* 0x6720000edfc0 */
	RA = 0x00a01ea000 ,
	PA = 0x00a01ea000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00006720000ed2a1 80000000a01ea480 */
	end_label   = Thr2_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v001_text_begin
Thr2_User_Text_4v001_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v001_exit
	nop
	.word	0xbe842148
	.word	0xfadfd000
thr2_MMU_ASI_PRIMARY_104:
	.word	0x87802080
	.word	0xfaf2a088
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_DM
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x206, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcdc1000
	ACCESS_ITSB_PTR
	.word	0xe05ee100
	.word	0xfcdd1000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_NCTX
	.word	0xc02e6bd0
	.word	0x1000000
	.word	0xbe118000
	DDEMAP_RPAGE
	DDEMAP_ALL
	.word	0xbe82e040
	.word	0xcadfd020
	.word	0xf8776030
	.word	0xc03122b2
	ACCESS_ITSB_PTR
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr2_MMU_ASI_BLK_S_105:
	.word	0x878020f1
	.word	0xe1b96700
	.word	0xc8752068
	.word	0xc075ec28
	.word	0xfe42a224
	.word	0xfe4e68ec
	.word	0xbe85e150
	.word	0xfadfd000
	.word	0xfe42a028
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr2_MMU_ASI_BLK_COMMIT_P_106:
	.word	0x878020e0
	.word	0xe1baadc0
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
thr2_MMU_ASI_BLK_P_107:
	.word	0x878020f0
	.word	0xe3b8ad00
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4c2168
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v001_exit:
	EXIT_GOOD
Thr2_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v400 TEXT_VA=0x67200002a000
attr_text {
	Name = .Thr2_User_Text_4v400 ,
	VA = 0x67200002a000 ,/* 0x67200002bfc0 */
	RA = 0x00a016c000 ,
	PA = 0x00a016c000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x040000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 000067200002a000 80000000a016c080 */
	end_label   = Thr2_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v400_text_begin
Thr2_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xc071ae78
	.word	0x1000000
	or	%g0, 0x4b5, %i7
	P_LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe876068
	.word	0xe0dfc200
	.word	0xfcd95060
	P_IDEMAP_PCTX
	.word	0xf071a090
	.word	0xc0746468
	P_TOGGLE_LSU_IM
	.word	0xbe8120b0
	.word	0xd4dfc200
thr2_MMU_ASI_AS_IF_USER_PRIMARY_108:
	.word	0x87802010
	.word	0xd4f2a088
thr2_MMU_ASI_BLK_S_109:
	.word	0x878020f1
	.word	0xc3bae180
thr2_MMU_ASI_AS_IF_USER_PRIMARY_110:
	.word	0x87802010
	.word	0xd6f6e040
	.word	0x1000000
	or	%g0, 0x168, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc031ada2
thr2_MMU_ASI_PRIMARY_111:
	.word	0x87802080
	.word	0xd8f42070
thr2_MMU_ASI_BLK_COMMIT_P_112:
	.word	0x878020e0
	.word	0xe1bd2400
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcddd000
thr2_MMU_ASI_BLK_P_113:
	.word	0x878020f0
	.word	0xc1bd2940
	.word	0xbe82e010
	.word	0xcadfd060
	.word	0xbe82a0f0
	.word	0xd4dfc200
	.word	0xd45c6150
thr2_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_114:
	.word	0x8780202a
	.word	0xecbc27f0
	.word	0xc07325b0
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr2_MMU_ASI_PRIMARY_115:
	.word	0x87802080
	.word	0xcaf2a010
	.word	0xfe59ad90
	.word	0x1000000
	or	%g0, 0x6e4, %i7
	P_LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8420b0
	.word	0xf6dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x594, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe852068
	.word	0xc8dfd000
	P_DDEMAP_PCTX
	.word	0xfcde4200
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v400_exit:
	EXIT_GOOD
Thr2_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v002 TEXT_VA=0x680000da0000
attr_text {
	Name = .Thr2_User_Text_4v002 ,
	VA = 0x680000da0000 ,/* 0x680000daffc0 */
	RA = 0x03d0800000 ,
	PA = 0x03d0800000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000680000da12a1 80000003d0800481 */
	end_label   = Thr2_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v002_text_begin
Thr2_User_Text_4v002_text_begin:
	wrpr	0, %gl
	P_DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5f8, %i7
	P_READ_IDATA_ACCESS
thr2_MMU_ASI_BLK_P_116:
	.word	0x878020f0
	.word	0xe1bf6f00
thr2_MMU_ASI_AS_IF_USER_PRIMARY_117:
	.word	0x87802010
	.word	0xe0f66120
thr2_MMU_ASI_PRIMARY_LITTLE_118:
	.word	0x87802088
	.word	0xe4bd2180
	P_DDEMAP_PCTX
	P_TOGGLE_LSU_DM
thr2_MMU_ASI_AS_IF_USER_PRIMARY_119:
	.word	0x87802010
	.word	0xeaf42000
	.word	0xfe542ca2
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_BLK_COMMIT_S_120:
	.word	0x878020e1
	.word	0xe3b962c0
	.word	0x1000000
	or	%g0, 0x077, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0xc8, %i7
	P_READ_IDATA_ACCESS
thr2_MMU_ASI_PRIMARY_121:
	.word	0x87802080
	.word	0xf0f2a000
	.word	0xfe552818
	P_IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcddd000
	.word	0xbe82a088
	.word	0xd4dfc200
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x540, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe120000
	P_DDEMAP_RPAGE
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR0
	nop
Thr2_User_Text_4v002_exit:
	EXIT_GOOD
Thr2_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v101 DATA_VA=0x690032c00000
attr_data {
	Name = .Thr2_User_Data_4v101 ,
	VA = 0x690032c00000 ,/* 0x690032ffffc0 */
	RA = 0x01ab400000 ,
	PA = 0x2dab400000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 0000690032c012a1 8000002dab400043 */
	end_label   = Thr2_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v101_data_begin
Thr2_User_Data_4v101_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v201 DATA_VA=0x672000012000
attr_data {
	Name = .Thr2_User_Data_4v201 ,
	VA = 0x672000012000 ,/* 0x672000013fc0 */
	RA = 0x00a0072000 ,
	PA = 0x00a0072000 ,
	TTE_Context = 0x09a1 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x180000 ,
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
	/* DTTE_TAG_DATA = 00006720000129a1 80000000a0072440 */
	end_label   = Thr2_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v201_data_begin
Thr2_User_Data_4v201_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v301 DATA_VA=0x67200002c000
attr_data {
	Name = .Thr2_User_Data_4v301 ,
	VA = 0x67200002c000 ,/* 0x67200002dfc0 */
	RA = 0x00a016e000 ,
	PA = 0x00a016e000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0f0000 ,
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
	/* DTTE_TAG_DATA = 000067200002c000 80000000a016e440 */
	end_label   = Thr2_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v301_data_begin
Thr2_User_Data_4v301_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v003 TEXT_VA=0x6720000f6000
attr_text {
	Name = .Thr2_User_Text_4v003 ,
	VA = 0x6720000f6000 ,/* 0x6720000f7fc0 */
	RA = 0x00a0198000 ,
	PA = 0x00a0198000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00006720000f72a1 80000000a0198480 */
	end_label   = Thr2_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v003_text_begin
Thr2_User_Text_4v003_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v003_exit
	nop
	.word	0xf0742050
	.word	0xc07127c0
	nop
	nop
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xe85aa038
	.word	0x1000000
	or	%g0, 0x05c, %i7
	LOAD_IDATA_IN
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x4d4, %i7
	LOAD_DDATA_ACCESS
	.word	0xc02e6a73
	.word	0x1000000
	or	%g0, 0x550, %i7
	READ_IDATA_ACCESS
	.word	0xe05ee120
	DDEMAP_PCTX
	.word	0xd65e6010
	TOGGLE_LSU_IM
	.word	0xc0712f10
	.word	0x1000000
	or	%g0, 0x5c, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe80a0e0
	.word	0xe8dfd000
thr2_MMU_ASI_PRIMARY_122:
	.word	0x87802080
	.word	0xd4f5e038
thr2_MMU_ASI_BLK_P_123:
	.word	0x878020f0
	.word	0xc1bc25c0
	nop
	nop
	nop
	.word	0xf675e158
	.word	0xc072a608
	.word	0xfc995d60
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	IDEMAP_ALL
thr2_MMU_ASI_BLK_P_124:
	.word	0x878020f0
	.word	0xc1bc2e00
	.word	0xf4742090
	.word	0xc02d263b
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe45264c
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcde5000
	.word	0xc4742068
	.word	0xc020a250
	IDEMAP_ALL_PAGES
	.word	0xfcd89000
	.word	0xbe85e038
	.word	0xe8dfd000
	.word	0xfe442954
	.word	0xbe842038
	.word	0xe0dfd000
thr2_MMU_ASI_PRIMARY_125:
	.word	0x87802080
	.word	0xe0f120f0
	ACCESS_DTSB_PTR
	.word	0xc0266504
	.word	0xe85e60d0
	.word	0xc070a7c0
	.word	0x1000000
	.word	0xbe11c000
	IDEMAP_RPAGE
thr2_MMU_ASI_PRIMARY_126:
	.word	0x87802080
	.word	0xf6f42128
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xca72a010
	.word	0xc02aa4b3
	.word	0x1000000
	or	%g0, 0x5b4, %i7
	LOAD_IDATA_ACCESS
	.word	0xc072a798
	.word	0xd45d20b0
	.word	0xc0252160
	.word	0xfc9e5c40
	TOGGLE_LSU_DM
	.word	0xfcdd1000
	.word	0x1000000
	or	%g0, 0x09c, %i7
	LOAD_IDATA_IN
	IDEMAP_NCTX
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd45aa0a0
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v003_exit:
	EXIT_GOOD
Thr2_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v401 TEXT_VA=0x69003a800000
attr_text {
	Name = .Thr2_User_Text_4v401 ,
	VA = 0x69003a800000 ,/* 0x69003abfffc0 */
	RA = 0x01a5800000 ,
	PA = 0x01a5800000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr2_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x040000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000069003a800000 80000001a5800083 */
	end_label   = Thr2_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v401_text_begin
Thr2_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr2_MMU_ASI_REAL_MEM_LITTLE_127:
	.word	0x8780201c
	.word	0xdef5e050
	P_DDEMAP_SCTX
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x071, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe100000
	P_IDEMAP_RPAGE
	.word	0xbe842100
	.word	0xc8dfd000
	P_IDEMAP_PCTX
	.word	0xfcda9000
	.word	0xfe432490
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	P_READ_DDATA_ACCESS
	.word	0xfcd90200
thr2_MMU_ASI_PRIMARY_128:
	.word	0x87802080
	.word	0xecf42028
thr2_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_129:
	.word	0x87802018
	.word	0xdef76020
	.word	0x1000000
	.word	0xbe178000
	P_IDEMAP_RPAGE
	.word	0xfcda8200
	.word	0xfe5c6438
thr2_MMU_ASI_PRIMARY_130:
	.word	0x87802080
	.word	0xdaf120f8
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v401_exit:
	EXIT_GOOD
Thr2_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v004 TEXT_VA=0x6720000c8000
attr_text {
	Name = .Thr2_User_Text_4v004 ,
	VA = 0x6720000c8000 ,/* 0x6720000c9fc0 */
	RA = 0x00a0002000 ,
	PA = 0x00a0002000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00006720000c92a1 80000000a0002480 */
	end_label   = Thr2_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v004_text_begin
Thr2_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xdc752028
	.word	0xc076e940
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x011, %i7
	P_LOAD_DDATA_IN
	.word	0xfc9ddc40
	P_DDEMAP_ALL
	.word	0xe076e038
	.word	0xc02aa9d1
thr2_MMU_ASI_REAL_IO_LITTLE_131:
	.word	0x8780201d
	.word	0xd0f4a028
	.word	0xbe866038
	.word	0xe8dfd000
	.word	0xc032a8ea
	.word	0xbe876038
	.word	0xd4dfd000
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x5b3, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xc39a83c0
	.word	0xfc9f5000
	P_TOGGLE_LSU_IM
	P_DDEMAP_ALL_RPAGES
	.word	0xe6712028
	.word	0xc0342c84
	.word	0xc0276950
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xca776010
	.word	0xc022aa40
thr2_MMU_ASI_AS_IF_USER_PRIMARY_132:
	.word	0x87802010
	.word	0xeaf12050
	P_IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x408, %i7
	P_DTLB_TAG_READ
	.word	0xbe85e120
	.word	0xd4dfc200
	P_TOGGLE_LSU_IM
	.word	0xbe82e010
	.word	0xe19fde20
	.word	0xfc998580
	P_TOGGLE_LSU_DM
	P_IDEMAP_ALL
	.word	0xfcded000
	.word	0xfc99c4c0
	.word	0x1000000
	or	%g0, 0x610, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x2e8, %i7
	P_READ_DDATA_ACCESS
	.word	0xfe512956
	.word	0xe076e0a0
	.word	0xc02aa5ac
thr2_MMU_ASI_PRIMARY_133:
	.word	0x87802080
	.word	0xecf6e028
thr2_MMU_ASI_PRIMARY_134:
	.word	0x87802080
	.word	0xf0f42050
	.word	0xfc9b0480
	.word	0x1000000
	.word	0xbe174000
	P_DDEMAP_RPAGE
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe12c000
	P_IDEMAP_PAGE
thr2_MMU_ASI_AS_IF_USER_PRIMARY_135:
	.word	0x87802010
	.word	0xdcf42028
	.word	0x1000000
	or	%g0, 0x068, %i7
	P_LOAD_DDATA_IN
	P_ACCESS_ITSB_PTR
	.word	0xfcd95120
	.word	0xc3995e20
	.word	0xbe82a038
	.word	0xfadfd000
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr2_User_Text_4v004_exit:
	EXIT_GOOD
Thr2_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v102 DATA_VA=0x690019800000
attr_data {
	Name = .Thr2_User_Data_4v102 ,
	VA = 0x690019800000 ,/* 0x690019bfffc0 */
	RA = 0x01aa000000 ,
	PA = 0x2daa000000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006900198012a1 8000002daa000043 */
	end_label   = Thr2_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v102_data_begin
Thr2_User_Data_4v102_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v302 DATA_VA=0x6800008a0000
attr_data {
	Name = .Thr2_User_Data_4v302 ,
	VA = 0x6800008a0000 ,/* 0x6800008affc0 */
	RA = 0x03d0f20000 ,
	PA = 0x03d0f20000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0f0000 ,
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
	/* DTTE_TAG_DATA = 00006800008a0000 80000003d0f20441 */
	end_label   = Thr2_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v302_data_begin
Thr2_User_Data_4v302_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v005 TEXT_VA=0x680000aa0000
attr_text {
	Name = .Thr2_User_Text_4v005 ,
	VA = 0x680000aa0000 ,/* 0x680000aaffc0 */
	RA = 0x03d0700000 ,
	PA = 0x03d0700000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 0000680000aa12a1 80000003d0700481 */
	end_label   = Thr2_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v005_text_begin
Thr2_User_Text_4v005_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v005_exit
	nop
	ACCESS_DTSB_PTR
	DDEMAP_ALL_PAGES
	TOGGLE_LSU_IM
	DDEMAP_ALL_PAGES
	.word	0xfcdc1000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x180, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x1d5, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x6a8, %i7
	READ_DDATA_ACCESS
	.word	0xc0242160
	.word	0xc075e668
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL
	.word	0xc032abd4
	.word	0xc85aa110
	.word	0xd45920a0
	.word	0xc032a160
thr2_MMU_ASI_PRIMARY_136:
	.word	0x87802080
	.word	0xdef760e8
	.word	0xfe50aa1a
	.word	0xfe452408
	TOGGLE_LSU_DM
	DDEMAP_SCTX
	.word	0xbe8660e0
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x2e8, %i7
	DTLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcdc1000
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0x1000000
	.word	0xbe100000
	DDEMAP_PAGE
	.word	0xf65f60e0
	.word	0xf472a0d8
	.word	0xc036e160
	ACCESS_DTSB_PTR
	.word	0xc0766b20
	.word	0xe25c2018
	.word	0x1000000
	or	%g0, 0x510, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x520, %i7
	ITLB_TAG_READ
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x158, %i7
	READ_DDATA_ACCESS
	.word	0xce70a060
	.word	0xc026e6fc
	DDEMAP_ALL
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd85aa018
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v005_exit:
	EXIT_GOOD
Thr2_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v402 TEXT_VA=0x6800000b0000
attr_text {
	Name = .Thr2_User_Text_4v402 ,
	VA = 0x6800000b0000 ,/* 0x6800000bffc0 */
	RA = 0x03d04d0000 ,
	PA = 0x03d04d0000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr2_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x040000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006800000b0000 80000003d04d0081 */
	end_label   = Thr2_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v402_text_begin
Thr2_User_Text_4v402_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
thr2_MMU_ASI_PRIMARY_LITTLE_137:
	.word	0x87802088
	.word	0xdef0a0a8
	.word	0xfcde8280
	.word	0xfcda8200
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	.word	0xfcddd000
thr2_MMU_ASI_AS_IF_USER_PRIMARY_138:
	.word	0x87802010
	.word	0xe6f2a028
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	P_DTLB_TAG_READ
	.word	0xbe816010
	.word	0xc19fc2e0
	.word	0xc071aa88
	.word	0x1000000
	or	%g0, 0x178, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x510, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v402_exit:
	EXIT_GOOD
Thr2_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v103 DATA_VA=0x6720001e8000
attr_data {
	Name = .Thr2_User_Data_4v103 ,
	VA = 0x6720001e8000 ,/* 0x6720001e9fc0 */
	RA = 0x00a00a6000 ,
	PA = 0x00a00a6000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006720001e92a1 80000000a00a6040 */
	end_label   = Thr2_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v103_data_begin
Thr2_User_Data_4v103_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v006 TEXT_VA=0x690030000000
attr_text {
	Name = .Thr2_User_Text_4v006 ,
	VA = 0x690030000000 ,/* 0x6900303fffc0 */
	RA = 0x01a8400000 ,
	PA = 0x2da8400000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00006900300012a1 8000002da8400483 */
	end_label   = Thr2_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v006_text_begin
Thr2_User_Text_4v006_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v006_exit
	nop
	.word	0xc85de0e0
	IDEMAP_ALL
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x016, %i7
	LOAD_DDATA_IN
	.word	0xfcdd1000
	.word	0x1000000
	or	%g0, 0x7c8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x02b, %i7
	LOAD_IDATA_IN
	.word	0xe85aa0a0
	.word	0x1000000
	or	%g0, 0x055, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe42a09c
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xdc776028
	.word	0xc022a1bc
	.word	0xfe45ef34
	nop
	TOGGLE_LSU_IM
	.word	0xfe52a0e8
	TOGGLE_LSU_DM
	.word	0xbe8420a0
	.word	0xd4dfd040
	TOGGLE_LSU_DM
	.word	0xe19adf20
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	.word	0xc075e360
	IDEMAP_PCTX
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x200, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x468, %i7
	ITLB_TAG_READ
	.word	0xd45f6068
	IDEMAP_ALL_RPAGES
	.word	0xc076e9c8
	.word	0x1000000
	or	%g0, 0x446, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr2_MMU_ASI_PRIMARY_LITTLE_139:
	.word	0x87802088
	.word	0xccf5e018
	.word	0xc076edf8
	.word	0xc03429f0
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_PRIMARY_140:
	.word	0x87802080
	.word	0xe2f6e018
	.word	0xfe5aa8b8
	.word	0xd45c20b0
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x03b, %i7
	LOAD_IDATA_IN
	nop
	ACCESS_ITSB_PTR
	.word	0xe85f60e0
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe25d2048
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v006_exit:
	EXIT_GOOD
Thr2_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v403 TEXT_VA=0x67200003c000
attr_text {
	Name = .Thr2_User_Text_4v403 ,
	VA = 0x67200003c000 ,/* 0x67200003dfc0 */
	RA = 0x00a0032000 ,
	PA = 0x00a0032000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x040000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 000067200003c000 80000000a0032080 */
	end_label   = Thr2_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v403_text_begin
Thr2_User_Text_4v403_text_begin:
	wrpr	0, %gl
	.word	0xbe852158
	.word	0xf6dfd000
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x88, %i7
	P_ITLB_TAG_READ
thr2_MMU_ASI_AS_IF_USER_PRIMARY_141:
	.word	0x87802010
	.word	0xd0f5e028
	.word	0x1000000
	or	%g0, 0x510, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9a9c40
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xca5c6040
	.word	0xbe85e100
	.word	0xe39fde00
	.word	0xf671a038
	.word	0xc023267c
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8420a0
	.word	0xc8dfc200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xde71a0a8
	.word	0xc0746ed0
	.word	0xfcddd000
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x00b, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x590, %i7
	P_READ_IDATA_ACCESS
thr2_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_142:
	.word	0x87802018
	.word	0xf0f520d8
	.word	0x1000000
	or	%g0, 0x414, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe108000
	P_IDEMAP_RPAGE
	.word	0xc071a768
	.word	0xc0346258
thr2_MMU_ASI_BLK_P_143:
	.word	0x878020f0
	.word	0xe3baa3c0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe108000
	P_IDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_PRIMARY_144:
	.word	0x87802080
	.word	0xf0f660c8
	P_IDEMAP_NCTX
	P_TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe13c000
	P_DDEMAP_RPAGE
	.word	0xc39c03c0
	P_IDEMAP_NCTX
	.word	0xfcdc0200
	nop
	.word	0xbe8760d0
	.word	0xd4dfd000
	.word	0xfcddd000
	P_IDEMAP_ALL_RPAGES
	P_IDEMAP_NCTX
	.word	0xbe876138
	.word	0xd4dfc200
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v403_exit:
	EXIT_GOOD
Thr2_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v104 DATA_VA=0x690003400000
attr_data {
	Name = .Thr2_User_Data_4v104 ,
	VA = 0x690003400000 ,/* 0x6900037fffc0 */
	RA = 0x01a6800000 ,
	PA = 0x2da6800000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006900034012a1 8000002da6800043 */
	end_label   = Thr2_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v104_data_begin
Thr2_User_Data_4v104_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v007 TEXT_VA=0x69002e400000
attr_text {
	Name = .Thr2_User_Text_4v007 ,
	VA = 0x69002e400000 ,/* 0x69002e7fffc0 */
	RA = 0x01ac800000 ,
	PA = 0x2dac800000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 000069002e4012a1 8000002dac800483 */
	end_label   = Thr2_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v007_text_begin
Thr2_User_Text_4v007_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v007_exit
	nop
	.word	0xd45f6088
thr2_MMU_ASI_PRIMARY_145:
	.word	0x87802080
	.word	0xe8f52110
	ACCESS_DTSB_PTR
	.word	0xc87760e0
	.word	0xc036e6a0
	.word	0xfcdd1000
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xb8, %i7
	DTLB_TAG_READ
	.word	0xf072a020
	.word	0xc0352240
	IDEMAP_NCTX
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr2_MMU_ASI_SECONDARY_146:
	.word	0x87802081
	.word	0xe0f16110
	.word	0xe05e6088
	.word	0xc0276e90
	.word	0x1000000
	or	%g0, 0x708, %i7
	DTLB_TAG_READ
thr2_MMU_ASI_PRIMARY_147:
	.word	0x87802080
	.word	0xcaf42010
	.word	0x1000000
	or	%g0, 0x7c5, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x098, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x298, %i7
	DTLB_TAG_READ
	.word	0xe05e6120
	.word	0xd458a120
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x0a8, %i7
	LOAD_DDATA_IN
	.word	0xe85c2008
	.word	0xec742028
	.word	0xc025ec78
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	.word	0xfcdd1000
	.word	0xbe876038
	.word	0xf6dfd000
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x093, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x508, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xca72a010
	.word	0xc036ee4e
	.word	0x1000000
	or	%g0, 0x440, %i7
	READ_IDATA_ACCESS
	.word	0xc0776398
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x578, %i7
	READ_IDATA_ACCESS
	.word	0xfe4c275d
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc028a3fe
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v007_exit:
	EXIT_GOOD
Thr2_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v105 DATA_VA=0x680000cf0000
attr_data {
	Name = .Thr2_User_Data_4v105 ,
	VA = 0x680000cf0000 ,/* 0x680000cfffc0 */
	RA = 0x03d0fa0000 ,
	PA = 0x03d0fa0000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 0000680000cf12a1 80000003d0fa0041 */
	end_label   = Thr2_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v105_data_begin
Thr2_User_Data_4v105_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v008 TEXT_VA=0x6800003f0000
attr_text {
	Name = .Thr2_User_Text_4v008 ,
	VA = 0x6800003f0000 ,/* 0x6800003fffc0 */
	RA = 0x03d0c30000 ,
	PA = 0x03d0c30000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00006800003f12a1 80000003d0c30481 */
	end_label   = Thr2_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v008_text_begin
Thr2_User_Text_4v008_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v008_exit
	nop
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe5aa7d0
	.word	0xfe5d22e8
	.word	0xfe46e53c
	.word	0x1000000
	or	%g0, 0x43f, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_SCTX
thr2_MMU_ASI_PRIMARY_148:
	.word	0x87802080
	.word	0xe8f0a038
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5b8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0xd0, %i7
	READ_IDATA_ACCESS
	nop
	nop
	.word	0xf4766050
	.word	0xc022a160
thr2_MMU_ASI_PRIMARY_LITTLE_149:
	.word	0x87802088
	.word	0xf4bde7c0
	nop
	.word	0xbe812068
	.word	0xe8dfd000
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x20, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xbe852100
	.word	0xf2dfd000
	DDEMAP_ALL_RPAGES
thr2_MMU_ASI_BLK_SL_150:
	.word	0x878020f9
	.word	0xe1b96600
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfa742068
	.word	0xc02427b0
	.word	0xfe5aae40
	.word	0xd45c20e0
	.word	0xbe86e120
	.word	0xc4dfd000
	.word	0xfcdc1000
	.word	0xe8592088
thr2_MMU_ASI_PRIMARY_151:
	.word	0x87802080
	.word	0xe8f66110
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x8, %i7
	READ_IDATA_ACCESS
thr2_MMU_ASI_PRIMARY_152:
	.word	0x87802080
	.word	0xd0f42028
	.word	0xfc995020
	.word	0xe272a018
	.word	0xc070aec0
	.word	0x1000000
	or	%g0, 0x030, %i7
	LOAD_DDATA_IN
thr2_MMU_ASI_BLK_P_153:
	.word	0x878020f0
	.word	0xe3bd2340
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf25aa148
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v008_exit:
	EXIT_GOOD
Thr2_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v106 DATA_VA=0x672000168000
attr_data {
	Name = .Thr2_User_Data_4v106 ,
	VA = 0x672000168000 ,/* 0x672000169fc0 */
	RA = 0x00a00a8000 ,
	PA = 0x00a00a8000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006720001692a1 80000000a00a8040 */
	end_label   = Thr2_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v106_data_begin
Thr2_User_Data_4v106_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v009 TEXT_VA=0x6a0280000000
attr_text {
	Name = .Thr2_User_Text_4v009 ,
	VA = 0x6a0280000000 ,/* 0x6a028fffffc0 */
	RA = 0x0280000000 ,
	PA = 0x2e80000000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00006a02800012a1 8000002e80000485 */
	end_label   = Thr2_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v009_text_begin
Thr2_User_Text_4v009_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v009_exit
	nop
	.word	0xfe4c294a
	TOGGLE_LSU_DM
	nop
	.word	0xc03421c0
	.word	0xbe876100
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x5c3, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe5e69c0
	.word	0xe05c2068
	.word	0xc07123a0
	.word	0xfe4eefcd
thr2_MMU_ASI_BLK_P_154:
	.word	0x878020f0
	.word	0xe1bc2800
	.word	0xbe8520d0
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x03d, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	.word	0xc0242628
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd45c20a0
	.word	0xc02de475
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0xa0, %i7
	READ_IDATA_ACCESS
thr2_MMU_ASI_BLK_COMMIT_P_155:
	.word	0x878020e0
	.word	0xe3bd21c0
	.word	0xfe52a202
	.word	0xbe842100
	.word	0xeedfd000
	.word	0x1000000
	or	%g0, 0x023, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe114000
	DDEMAP_PAGE
	.word	0xfe4d291c
	.word	0xc0252eb0
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
thr2_MMU_ASI_BLK_S_156:
	.word	0x878020f1
	.word	0xc3baee00
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x608, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x02b, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	.word	0xf0742078
	.word	0xc03768fe
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe55249e
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x005, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_DM
	.word	0xfcdc1000
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	TOGGLE_LSU_DM
thr2_MMU_ASI_BLK_P_157:
	.word	0x878020f0
	.word	0xe3bc2140
	.word	0x1000000
	or	%g0, 0xb8, %i7
	ITLB_TAG_READ
	IDEMAP_ALL
	.word	0xc45c20a0
	.word	0xfe512424
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe52ac8c
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v009_exit:
	EXIT_GOOD
Thr2_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v107 DATA_VA=0x6800003b0000
attr_data {
	Name = .Thr2_User_Data_4v107 ,
	VA = 0x6800003b0000 ,/* 0x6800003bffc0 */
	RA = 0x03d01d0000 ,
	PA = 0x03d01d0000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006800003b12a1 80000003d01d0041 */
	end_label   = Thr2_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v107_data_begin
Thr2_User_Data_4v107_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00a TEXT_VA=0x690013c00000
attr_text {
	Name = .Thr2_User_Text_4v00a ,
	VA = 0x690013c00000 ,/* 0x690013ffffc0 */
	RA = 0x01a9800000 ,
	PA = 0x2da9800000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 0000690013c012a1 8000002da9800483 */
	end_label   = Thr2_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00a_text_begin
Thr2_User_Text_4v00a_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v00a_exit
	nop
	.word	0xd65c2010
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	ITLB_TAG_READ
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x0a9, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL_PAGES
	.word	0xfcddd000
	.word	0x1000000
	or	%g0, 0x468, %i7
	READ_DDATA_ACCESS
	.word	0xd65c2010
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	READ_DDATA_ACCESS
	nop
	.word	0xc02aa1cc
	DDEMAP_SCTX
	.word	0xc035e48a
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xbe8520b0
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x00c, %i7
	LOAD_DDATA_IN
thr2_MMU_ASI_PRIMARY_158:
	.word	0x87802080
	.word	0xccf42070
	ACCESS_ITSB_PTR
	.word	0xfc9d1000
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x498, %i7
	DTLB_TAG_READ
	.word	0xbe82a150
	.word	0xeedfd000
	.word	0xc39f5e00
	.word	0xfcdc1000
thr2_MMU_ASI_PRIMARY_159:
	.word	0x87802080
	.word	0xe0f2a130
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc022a29c
	.word	0xc475e088
	.word	0xc02765d8
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x3d5, %i7
	LOAD_DDATA_ACCESS
thr2_MMU_ASI_PRIMARY_160:
	.word	0x87802080
	.word	0xdcf2a028
	.word	0xce766020
	.word	0xc02aa9c0
	.word	0xe25e6018
	.word	0xd45d2110
	.word	0xc39a9e00
	.word	0xe05aa140
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x02c, %i7
	LOAD_IDATA_IN
	.word	0xe85aa0c0
	.word	0xc0742160
	IDEMAP_ALL_PAGES
	.word	0xfe5f68d8
	nop
	nop
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe4f60d7
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0352e9a
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00a_exit:
	EXIT_GOOD
Thr2_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v108 DATA_VA=0x67200000a000
attr_data {
	Name = .Thr2_User_Data_4v108 ,
	VA = 0x67200000a000 ,/* 0x67200000bfc0 */
	RA = 0x00a004c000 ,
	PA = 0x00a004c000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 000067200000b2a1 80000000a004c040 */
	end_label   = Thr2_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v108_data_begin
Thr2_User_Data_4v108_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00b TEXT_VA=0x680000170000
attr_text {
	Name = .Thr2_User_Text_4v00b ,
	VA = 0x680000170000 ,/* 0x68000017ffc0 */
	RA = 0x03d0e90000 ,
	PA = 0x03d0e90000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00006800001712a1 80000003d0e90481 */
	end_label   = Thr2_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00b_text_begin
Thr2_User_Text_4v00b_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v00b_exit
	nop
	.word	0xd8776018
	.word	0xc022ae88
	.word	0x1000000
	or	%g0, 0x07e, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_IM
	.word	0xca742010
	.word	0xc02c2f6c
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x358, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe816040
	.word	0xcadfd060
	.word	0xfcda9000
	.word	0xfe4425f8
	.word	0xf475e020
	.word	0xc0242160
	.word	0xf25aa148
	IDEMAP_ALL_PAGES
	IDEMAP_ALL
	ACCESS_DTSB_PTR
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x468, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x280, %i7
	READ_DDATA_ACCESS
	IDEMAP_NCTX
thr2_MMU_ASI_BLK_SL_161:
	.word	0x878020f9
	.word	0xc1b96d00
	.word	0xbe842068
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x2d0, %i7
	READ_DDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x15c, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe82a0c0
	.word	0xe0dfd000
	.word	0xfe50a6cc
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x750, %i7
	READ_DDATA_ACCESS
	.word	0xd45aa0b0
	.word	0x1000000
	or	%g0, 0x478, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_IDATA_ACCESS
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe158000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	.word	0xbe876068
	.word	0xeedfd000
	.word	0xe85d2068
	DDEMAP_ALL
	.word	0x1000000
	.word	0xbe15c000
	DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	ACCESS_DTSB_PTR
	.word	0xf676e038
	.word	0xc0742518
	IDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_BLK_PL_162:
	.word	0x878020f8
	.word	0xc3bf6980
	.word	0xe85f60f0
	nop
	nop
	nop
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc03521a0
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00b_exit:
	EXIT_GOOD
Thr2_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v109 DATA_VA=0x69003b800000
attr_data {
	Name = .Thr2_User_Data_4v109 ,
	VA = 0x69003b800000 ,/* 0x69003bbfffc0 */
	RA = 0x01aa800000 ,
	PA = 0x2daa800000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 000069003b8012a1 8000002daa800043 */
	end_label   = Thr2_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v109_data_begin
Thr2_User_Data_4v109_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00c TEXT_VA=0x6800005d0000
attr_text {
	Name = .Thr2_User_Text_4v00c ,
	VA = 0x6800005d0000 ,/* 0x6800005dffc0 */
	RA = 0x03d09f0000 ,
	PA = 0x03d09f0000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00006800005d12a1 80000003d09f0481 */
	end_label   = Thr2_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00c_text_begin
Thr2_User_Text_4v00c_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v00c_exit
	nop
	.word	0xd2712020
	.word	0xc028abae
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe54210c
	.word	0xec742058
	.word	0xc02f6e93
	.word	0x1000000
	or	%g0, 0x6d8, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_BLK_P_163:
	.word	0x878020f0
	.word	0xe3baa900
	TOGGLE_LSU_DM
	.word	0xbe842008
	.word	0xe8dfd000
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc022ad58
	TOGGLE_LSU_DM
	.word	0xfc9ddc40
	.word	0xfe47620c
	.word	0xf65ee0a0
	.word	0xc0752338
	.word	0x1000000
	or	%g0, 0x690, %i7
	DTLB_TAG_READ
	IDEMAP_ALL_RPAGES
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x338, %i7
	READ_DDATA_ACCESS
	.word	0xc8592008
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe114000
	IDEMAP_PAGE
	.word	0xe39d1f00
thr2_MMU_ASI_PRIMARY_LITTLE_164:
	.word	0x87802088
	.word	0xecbde670
	.word	0xe05aa088
	.word	0xfe5d2f08
	IDEMAP_ALL_RPAGES
	.word	0xc02de74d
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_RPAGE
	.word	0xce70a078
	.word	0xc0752368
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	ACCESS_DTSB_PTR
	.word	0xc1995e20
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x0aa, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_DM
	.word	0xc0252d04
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x2c9, %i7
	LOAD_DDATA_ACCESS
	.word	0xca5ee010
	.word	0xc02aa314
	.word	0x1000000
	or	%g0, 0x00f, %i7
	LOAD_IDATA_IN
	nop
	nop
	.word	0xfe4e653e
	nop
	nop
	nop
thr2_MMU_ASI_PRIMARY_165:
	.word	0x87802080
	.word	0xecf42028
	.word	0xe05aa038
	.word	0x1000000
	or	%g0, 0x4d8, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x499, %i7
	LOAD_IDATA_ACCESS
	.word	0xe85aa120
	.word	0xc0352ef6
	.word	0xc072a340
	.word	0xca76e010
	.word	0xc0252fb0
	.word	0xc022a160
	.word	0xfe442984
	.word	0xfe52afde
thr2_MMU_ASI_PRIMARY_166:
	.word	0x87802080
	.word	0xeaf5e000
	.word	0xfe4aa88f
	.word	0xfcdc1000
	.word	0xfc9c1100
thr2_MMU_ASI_PRIMARY_167:
	.word	0x87802080
	.word	0xeef2a038
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_RPAGE
	.word	0xc0292949
	IDEMAP_ALL
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02aacc5
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00c_exit:
	EXIT_GOOD
Thr2_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10a DATA_VA=0x680000290000
attr_data {
	Name = .Thr2_User_Data_4v10a ,
	VA = 0x680000290000 ,/* 0x68000029ffc0 */
	RA = 0x03d0580000 ,
	PA = 0x03d0580000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006800002912a1 80000003d0580041 */
	end_label   = Thr2_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10a_data_begin
Thr2_User_Data_4v10a_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00d TEXT_VA=0x67200007c000
attr_text {
	Name = .Thr2_User_Text_4v00d ,
	VA = 0x67200007c000 ,/* 0x67200007dfc0 */
	RA = 0x00a007c000 ,
	PA = 0x00a007c000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 000067200007d2a1 80000000a007c480 */
	end_label   = Thr2_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00d_text_begin
Thr2_User_Text_4v00d_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v00d_exit
	nop
	.word	0xe0592120
	.word	0xfc9a9c40
	.word	0xfe5c2f20
	.word	0xe272a048
	.word	0xc025e7dc
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf65aa0c0
	.word	0x1000000
	or	%g0, 0xf0, %i7
	READ_IDATA_ACCESS
	.word	0xbe86e068
	.word	0xe0dfd040
	.word	0xc0242cc8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0376780
	.word	0xfe56e998
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x045, %i7
	LOAD_DDATA_IN
	.word	0xc072a710
thr2_MMU_ASI_PRIMARY_168:
	.word	0x87802080
	.word	0xf8f42000
	.word	0x1000000
	or	%g0, 0x47d, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_ALL
thr2_MMU_ASI_BLK_PL_169:
	.word	0x878020f8
	.word	0xc1baac40
	TOGGLE_LSU_DM
	.word	0xfe42aa9c
	.word	0x1000000
	.word	0xbe154000
	DDEMAP_PAGE
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x003, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x73c, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	nop
	.word	0xbe82e010
	.word	0xcadfd060
	.word	0xfcdd1000
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x72b, %i7
	LOAD_DDATA_ACCESS
thr2_MMU_ASI_PRIMARY_170:
	.word	0x87802080
	.word	0xccf42018
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x70, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc19a9f00
	.word	0xfe52a976
	.word	0xfcdd1000
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DDEMAP_ALL_RPAGES
	.word	0xfa5e6068
	.word	0x1000000
	or	%g0, 0x262, %i7
	LOAD_DDATA_ACCESS
	.word	0xcc5aa070
	DDEMAP_ALL_PAGES
	.word	0xc0742890
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x284, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x488, %i7
	ITLB_TAG_READ
	IDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd0752028
	.word	0xc02aada4
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00d_exit:
	EXIT_GOOD
Thr2_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10b DATA_VA=0x69000c800000
attr_data {
	Name = .Thr2_User_Data_4v10b ,
	VA = 0x69000c800000 ,/* 0x69000cbfffc0 */
	RA = 0x01abc00000 ,
	PA = 0x2dabc00000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 000069000c8012a1 8000002dabc00043 */
	end_label   = Thr2_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10b_data_begin
Thr2_User_Data_4v10b_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00e TEXT_VA=0x680000fc0000
attr_text {
	Name = .Thr2_User_Text_4v00e ,
	VA = 0x680000fc0000 ,/* 0x680000fcffc0 */
	RA = 0x03d04a0000 ,
	PA = 0x03d04a0000 ,
	TTE_Context = 0x12a1 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 0000680000fc12a1 80000003d04a0481 */
	end_label   = Thr2_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00e_text_begin
Thr2_User_Text_4v00e_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr2_User_Text_4v00e_exit
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe39ddf00
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0xe0, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe852068
	.word	0xe0dfd000
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd2712000
	.word	0xc02aac7b
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0xc02aaa20
thr2_MMU_ASI_BLK_COMMIT_P_171:
	.word	0x878020e0
	.word	0xe1b8ab80
	DDEMAP_ALL
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0x2d9, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x091, %i7
	LOAD_DDATA_IN
	.word	0xc0342160
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	IDEMAP_PCTX
	.word	0xc0342f8c
	.word	0x1000000
	or	%g0, 0xc8, %i7
	DTLB_TAG_READ
	.word	0xfcde5000
thr2_MMU_ASI_PRIMARY_172:
	.word	0x87802080
	.word	0xecf2a080
	.word	0xbe158000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x056, %i7
	LOAD_IDATA_IN
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1f6, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x08a, %i7
	LOAD_IDATA_IN
	.word	0xfcdf5100
thr2_MMU_ASI_PRIMARY_173:
	.word	0x87802080
	.word	0xf8f76108
	.word	0xdc76e028
	.word	0xc0342a18
	DDEMAP_ALL_RPAGES
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x4dc, %i7
	LOAD_DDATA_ACCESS
	.word	0xc02128e4
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4c2c36
	.word	0xfcdf5000
	.word	0xbe85e088
	.word	0xfadfd000
thr2_MMU_ASI_PRIMARY_174:
	.word	0x87802080
	.word	0xc8f2a0c0
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x550, %i7
	ITLB_TAG_READ
	.word	0xfc9d1000
	.word	0x1000000
	or	%g0, 0x71, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x0af, %i7
	LOAD_DDATA_IN
	.word	0xe05aa0c0
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf25f6068
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v00e_exit:
	EXIT_GOOD
Thr2_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10c DATA_VA=0x6720000fc000
attr_data {
	Name = .Thr2_User_Data_4v10c ,
	VA = 0x6720000fc000 ,/* 0x6720000fdfc0 */
	RA = 0x00a018c000 ,
	PA = 0x00a018c000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006720000fd2a1 80000000a018c040 */
	end_label   = Thr2_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10c_data_begin
Thr2_User_Data_4v10c_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10d DATA_VA=0x6a05c0000000
attr_data {
	Name = .Thr2_User_Data_4v10d ,
	VA = 0x6a05c0000000 ,/* 0x6a05cfffffc0 */
	RA = 0x0290000000 ,
	PA = 0x2e90000000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006a05c00012a1 8000002e90000045 */
	end_label   = Thr2_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10d_data_begin
Thr2_User_Data_4v10d_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10e DATA_VA=0x6800003a0000
attr_data {
	Name = .Thr2_User_Data_4v10e ,
	VA = 0x6800003a0000 ,/* 0x6800003affc0 */
	RA = 0x03d0ac0000 ,
	PA = 0x03d0ac0000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006800003a12a1 80000003d0ac0041 */
	end_label   = Thr2_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10e_data_begin
Thr2_User_Data_4v10e_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10f DATA_VA=0x690018c00000
attr_data {
	Name = .Thr2_User_Data_4v10f ,
	VA = 0x690018c00000 ,/* 0x690018ffffc0 */
	RA = 0x01a6c00000 ,
	PA = 0x2da6c00000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 0000690018c012a1 8000002da6c00043 */
	end_label   = Thr2_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10f_data_begin
Thr2_User_Data_4v10f_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v110 DATA_VA=0x690026000000
attr_data {
	Name = .Thr2_User_Data_4v110 ,
	VA = 0x690026000000 ,/* 0x6900263fffc0 */
	RA = 0x01a5c00000 ,
	PA = 0x2da5c00000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006900260012a1 8000002da5c00043 */
	end_label   = Thr2_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v110_data_begin
Thr2_User_Data_4v110_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v111 DATA_VA=0x67200003e000
attr_data {
	Name = .Thr2_User_Data_4v111 ,
	VA = 0x67200003e000 ,/* 0x67200003ffc0 */
	RA = 0x00a01ac000 ,
	PA = 0x00a01ac000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 000067200003f2a1 80000000a01ac040 */
	end_label   = Thr2_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v111_data_begin
Thr2_User_Data_4v111_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v112 DATA_VA=0x6a0670000000
attr_data {
	Name = .Thr2_User_Data_4v112 ,
	VA = 0x6a0670000000 ,/* 0x6a067fffffc0 */
	RA = 0x0120000000 ,
	PA = 0x2d20000000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006a06700012a1 8000002d20000045 */
	end_label   = Thr2_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v112_data_begin
Thr2_User_Data_4v112_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v113 DATA_VA=0x680000670000
attr_data {
	Name = .Thr2_User_Data_4v113 ,
	VA = 0x680000670000 ,/* 0x68000067ffc0 */
	RA = 0x03d0be0000 ,
	PA = 0x03d0be0000 ,
	TTE_Context = 0x12a1 ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006800006712a1 80000003d0be0041 */
	end_label   = Thr2_User_Data_4v113_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v113_data_begin
Thr2_User_Data_4v113_data_begin:
	.xword	0x672000042000
	.xword	0x67200017c000
	.xword	0x6a0040000000
	.xword	0x67200006c000
	.xword	0x6720000ec000
	.xword	0x67200002a000
	.xword	0x680000da0000
	.xword	0x690032c00000
	.xword	0x672000012000
	.xword	0x67200002c000
	.xword	0x6720000f6000
	.xword	0x69003a800000
	.xword	0x6720000c8000
	.xword	0x690019800000
	.xword	0x6800008a0000
	.xword	0x680000aa0000
	.xword	0x6800000b0000
	.xword	0x6720001e8000
	.xword	0x690030000000
	.xword	0x67200003c000
	.xword	0x690003400000
	.xword	0x69002e400000
	.xword	0x680000cf0000
	.xword	0x6800003f0000
	.xword	0x672000168000
	.xword	0x6a0280000000
	.xword	0x6800003b0000
	.xword	0x690013c00000
	.xword	0x67200000a000
	.xword	0x680000170000
	.xword	0x69003b800000
	.xword	0x6800005d0000
	.xword	0x680000290000
	.xword	0x67200007c000
	.xword	0x69000c800000
	.xword	0x680000fc0000
	.xword	0x6720000fc000
	.xword	0x6a05c0000000
	.xword	0x6800003a0000
	.xword	0x690018c00000
	.xword	0x690026000000
	.xword	0x67200003e000
	.xword	0x6a0670000000
	.xword	0x680000670000
Thr2_User_Data_4v113_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x6d001a000000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	VA = 0x6d001a000000 ,/* 0x6d001a3fffc0 */
	RA = 0x01b8800000 ,
	PA = 0x01b8800000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006d001a001412 80000001b8800483 */
	end_label   = Thr3_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr3_user_code_entry
Thr3_user_code_entry:
	setx	0x6c0000020000, %g1, %g2
	or	%g0, 12, %g1
	.word	0xc658a000
	.word	0xc858a008
	.word	0xca58a010
	.word	0xcc58a018
	.word	0xce58a020
	.word	0xd058a028
	.word	0xd258a030
	.word	0xd458a038
	.word	0xd658a040
	.word	0xd858a048
	.word	0xda58a050
	.word	0xdc58a058
	.word	0xde58a060
	.word	0xe058a068
	.word	0xe258a070
	.word	0xe458a078
	.word	0xe658a080
	.word	0xe858a088
	.word	0xea58a090
	.word	0xec58a098
	.word	0xee58a0a0
	.word	0xf058a0a8
	.word	0xf258a0b0
	.word	0xf458a0b8
	.word	0xf658a0c0
	.word	0xf858a0c8
	.word	0xfa58a0d0
	.word	0xfc58a0d8
.global Thr3_User_Text_4v000_text_begin
Thr3_User_Text_4v000_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v000_exit
	nop
	.word	0xc02ee992
	.word	0x1000000
	or	%g0, 0x29, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x188, %i7
	ITLB_TAG_READ
	.word	0xfe4426dc
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_PAGE
	nop
	nop
	nop
	DDEMAP_PCTX
	nop
	nop
	nop
	nop
	.word	0xd45da098
	.word	0xfe55a376
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc4742068
	.word	0xc032af9e
thr3_MMU_ASI_PRIMARY_175:
	.word	0x87802080
	.word	0xf8f120b8
	.word	0xec5aa0c0
	.word	0xfe5da1f8
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1bf, %i7
	LOAD_DDATA_ACCESS
	.word	0xc875a0c0
	.word	0xc02429ac
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	.word	0xfcd89000
	.word	0x1000000
	or	%g0, 0x064, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe154000
	IDEMAP_PAGE
	.word	0xc025ac20
thr3_MMU_ASI_BLK_P_176:
	.word	0x878020f0
	.word	0xe3bee400
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
thr3_MMU_ASI_PRIMARY_177:
	.word	0x87802080
	.word	0xdaf6e020
thr3_MMU_ASI_PRIMARY_178:
	.word	0x87802080
	.word	0xd6f42010
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc036e304
	.word	0xd876e048
	.word	0xc07421e8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x7e8, %i7
	DTLB_TAG_READ
	.word	0xfe58a010
	.word	0xbe82e070
	.word	0xe39fde20
	.word	0xf4742090
	.word	0xc03127ca
	.word	0xfcd95160
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr3_MMU_ASI_PRIMARY_179:
	.word	0x87802080
	.word	0xdef120e0
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x568, %i7
	READ_DDATA_ACCESS
	.word	0xf65da068
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe46e250
	.word	0x81c76000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v000_exit:
	EXIT_GOOD
Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v100 DATA_VA=0x6c0000020000
attr_data {
	Name = .Thr3_User_Data_4v100 ,
	VA = 0x6c0000020000 ,/* 0x6c000002ffc0 */
	RA = 0x03e0650000 ,
	PA = 0x3fe0650000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006c0000021412 8000003fe0650041 */
	end_label   = Thr3_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v100_data_begin
Thr3_User_Data_4v100_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v200 DATA_VA=0x6d0008000000
attr_data {
	Name = .Thr3_User_Data_4v200 ,
	VA = 0x6d0008000000 ,/* 0x6d00083fffc0 */
	RA = 0x01b8000000 ,
	PA = 0x01b8000000 ,
	TTE_Context = 0x1291 ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 00006d0008001291 80000001b8000043 */
	end_label   = Thr3_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v200_data_begin
Thr3_User_Data_4v200_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v300 DATA_VA=0x6d003cc00000
attr_data {
	Name = .Thr3_User_Data_4v300 ,
	VA = 0x6d003cc00000 ,/* 0x6d003cffffc0 */
	RA = 0x01b8c00000 ,
	PA = 0x01b8c00000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006d003cc00000 80000001b8c00443 */
	end_label   = Thr3_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v300_data_begin
Thr3_User_Data_4v300_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v001 TEXT_VA=0x6e0660000000
attr_text {
	Name = .Thr3_User_Text_4v001 ,
	VA = 0x6e0660000000 ,/* 0x6e066fffffc0 */
	RA = 0x0230000000 ,
	PA = 0x0230000000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006e0660001412 8000000230000485 */
	end_label   = Thr3_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v001_text_begin
Thr3_User_Text_4v001_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v001_exit
	nop
	.word	0x1000000
	.word	0xbe158000
	IDEMAP_RPAGE
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x063, %i7
	LOAD_DDATA_IN
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_SCTX
	.word	0xfe40a8b0
	TOGGLE_LSU_IM
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x629, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	DDEMAP_PCTX
	.word	0xfe4da09d
	.word	0xbe80a0f8
	.word	0xf6dfd000
	.word	0xfe56e078
	.word	0xfcda9000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL
	.word	0xec72a138
	.word	0xc075a4d0
	TOGGLE_LSU_IM
	DDEMAP_SCTX
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x00a, %i7
	LOAD_IDATA_IN
	ACCESS_ITSB_PTR
	IDEMAP_ALL_RPAGES
	.word	0xf275a088
	.word	0xc02eef4e
	.word	0xbe86e038
	.word	0xc4dfd000
	.word	0xbe80a0c0
	.word	0xc19fde00
	IDEMAP_ALL
	.word	0xbe138000
	GOTO_SUPERVISOR1
	DDEMAP_SCTX
	.word	0xc670a130
	.word	0xc075abd8
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x119, %i7
	LOAD_IDATA_ACCESS
	.word	0xf872a0a8
	.word	0xc02aa3b8
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfe46e634
	.word	0x81c6a000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v001_exit:
	EXIT_GOOD
Thr3_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v400 TEXT_VA=0x6b30001ac000
attr_text {
	Name = .Thr3_User_Text_4v400 ,
	VA = 0x6b30001ac000 ,/* 0x6b30001adfc0 */
	RA = 0x00b01ec000 ,
	PA = 0x00b01ec000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x180000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00006b30001ac000 80000000b01ec080 */
	end_label   = Thr3_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v400_text_begin
Thr3_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
thr3_MMU_ASI_AS_IF_USER_PRIMARY_180:
	.word	0x87802010
	.word	0xdef0a110
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x418, %i7
	P_DTLB_TAG_READ
thr3_MMU_ASI_PRIMARY_181:
	.word	0x87802080
	.word	0xf8f6e100
	P_DDEMAP_PCTX
thr3_MMU_ASI_PRIMARY_182:
	.word	0x87802080
	.word	0xd0f6e058
	.word	0xfcdc0200
	.word	0xfcdd8200
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x230, %i7
	P_READ_DDATA_ACCESS
	.word	0xfe5de7a0
	.word	0x1000000
	or	%g0, 0x10, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x7a0, %i7
	P_DTLB_TAG_READ
	.word	0xfe5cac90
	.word	0x1000000
	or	%g0, 0x5f0, %i7
	P_READ_IDATA_ACCESS
	P_DDEMAP_ALL
thr3_MMU_ASI_AS_IF_USER_PRIMARY_183:
	.word	0x87802010
	.word	0xc8f2a038
	.word	0xfcdc0200
	nop
	.word	0xbe82a098
	.word	0xf6dfd000
	.word	0xfcdc1000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_184:
	.word	0x8780202a
	.word	0xdcbaa7f0
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x786, %i7
	P_LOAD_DDATA_ACCESS
	P_ACCESS_DTSB_PTR
thr3_MMU_ASI_AS_IF_USER_PRIMARY_185:
	.word	0x87802010
	.word	0xdcf6e028
	.word	0x1000000
	.word	0xbe11c000
	P_DDEMAP_RPAGE
	.word	0xfcd90200
thr3_MMU_ASI_PRIMARY_186:
	.word	0x87802080
	.word	0xd4f5a108
	.word	0xfe44afe8
	.word	0x1000000
	or	%g0, 0x551, %i7
	P_LOAD_DDATA_ACCESS
thr3_MMU_ASI_PRIMARY_LITTLE_187:
	.word	0x87802088
	.word	0xc4f5a098
	P_DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	.word	0xc85ca038
thr3_MMU_ASI_SECONDARY_188:
	.word	0x87802081
	.word	0xeaf46090
	P_TOGGLE_LSU_IM
	.word	0xbe86e098
	.word	0xc8dfc200
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x47a, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc029ad32
thr3_MMU_ASI_PRIMARY_189:
	.word	0x87802080
	.word	0xf2f2a058
	.word	0x1000000
	or	%g0, 0x4a0, %i7
	P_ITLB_TAG_READ
	P_TOGGLE_LSU_IM
	.word	0xfc9b0580
	P_DDEMAP_NCTX
thr3_MMU_ASI_PRIMARY_190:
	.word	0x87802080
	.word	0xf8baa4c0
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_191:
	.word	0x87802023
	.word	0xf4bc6bb0
	.word	0x1000000
	or	%g0, 0x405, %i7
	P_LOAD_DDATA_ACCESS
	nop
	.word	0xfcd95120
	P_DDEMAP_NCTX
	P_DDEMAP_ALL_PAGES
	.word	0xfcdc0200
	.word	0xfcd90380
	.word	0x1000000
	or	%g0, 0x28, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v400_exit:
	EXIT_GOOD
Thr3_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v002 TEXT_VA=0x6c0000590000
attr_text {
	Name = .Thr3_User_Text_4v002 ,
	VA = 0x6c0000590000 ,/* 0x6c000059ffc0 */
	RA = 0x03e0f40000 ,
	PA = 0x3fe0f40000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006c0000591412 8000003fe0f40481 */
	end_label   = Thr3_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v002_text_begin
Thr3_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x3b7, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xf672a068
	.word	0xc0342158
	.word	0xc0742b98
thr3_MMU_ASI_AS_IF_USER_PRIMARY_192:
	.word	0x87802010
	.word	0xcaf42010
thr3_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_193:
	.word	0x87802018
	.word	0xcaf0a010
	.word	0xd8742078
	.word	0xc022a3bc
thr3_MMU_ASI_AS_IF_USER_PRIMARY_194:
	.word	0x87802010
	.word	0xcef0a060
	.word	0xc47420e8
	.word	0xc022a458
	.word	0xfcdb42a0
	.word	0xfe56e2bc
	.word	0xc020a6e4
	.word	0xfcdd8200
	.word	0x1000000
	or	%g0, 0x05b, %i7
	P_LOAD_DDATA_IN
	.word	0xbe80a068
	.word	0xf6dfc200
	.word	0xc1995e20
thr3_MMU_ASI_AS_IF_USER_PRIMARY_195:
	.word	0x87802010
	.word	0xc6f2a130
	.word	0xbe80a038
	.word	0xf6dfd000
thr3_MMU_ASI_AS_IF_USER_PRIMARY_196:
	.word	0x87802010
	.word	0xdcf12028
	.word	0xc39942e0
	.word	0xee5aa018
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x280, %i7
	P_READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdad160
	P_IDEMAP_ALL
	.word	0xfcdc0200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x005, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x364, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	P_DTLB_TAG_READ
	nop
	.word	0xc022ab40
	P_TOGGLE_LSU_IM
	.word	0xfe5da0c0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_BLK_P_197:
	.word	0x878020f0
	.word	0xc3bdae40
	.word	0xc0292789
	.word	0xce75a020
	.word	0xc02aaf0a
	.word	0xfc9adc60
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v002_exit:
	EXIT_GOOD
Thr3_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v101 DATA_VA=0x6c0000d40000
attr_data {
	Name = .Thr3_User_Data_4v101 ,
	VA = 0x6c0000d40000 ,/* 0x6c0000d4ffc0 */
	RA = 0x03e04f0000 ,
	PA = 0x3fe04f0000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006c0000d41412 8000003fe04f0041 */
	end_label   = Thr3_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v101_data_begin
Thr3_User_Data_4v101_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v201 DATA_VA=0x6c0000610000
attr_data {
	Name = .Thr3_User_Data_4v201 ,
	VA = 0x6c0000610000 ,/* 0x6c000061ffc0 */
	RA = 0x03e0480000 ,
	PA = 0x3fe0480000 ,
	TTE_Context = 0x1291 ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 00006c0000611291 8000003fe0480041 */
	end_label   = Thr3_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v201_data_begin
Thr3_User_Data_4v201_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v301 DATA_VA=0x6d003f000000
attr_data {
	Name = .Thr3_User_Data_4v301 ,
	VA = 0x6d003f000000 ,/* 0x6d003f3fffc0 */
	RA = 0x01b4000000 ,
	PA = 0x01b4000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006d003f000000 80000001b4000443 */
	end_label   = Thr3_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v301_data_begin
Thr3_User_Data_4v301_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v003 TEXT_VA=0x6b3000188000
attr_text {
	Name = .Thr3_User_Text_4v003 ,
	VA = 0x6b3000188000 ,/* 0x6b3000189fc0 */
	RA = 0x00b01ee000 ,
	PA = 0x00b01ee000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006b3000189412 80000000b01ee480 */
	end_label   = Thr3_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v003_text_begin
Thr3_User_Text_4v003_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v003_exit
	nop
	.word	0xd275a120
	.word	0xc02423d4
	IDEMAP_ALL_PAGES
	.word	0xbe85a0c0
	.word	0xe0dfd000
	DDEMAP_ALL_RPAGES
thr3_MMU_ASI_PRIMARY_198:
	.word	0x87802080
	.word	0xeaf0a060
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xfcdc1000
	nop
	IDEMAP_ALL
	.word	0xbe86e038
	.word	0xd4dfd000
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x012, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x500, %i7
	READ_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc0742830
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v003_exit:
	EXIT_GOOD
Thr3_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v401 TEXT_VA=0x6b300006e000
attr_text {
	Name = .Thr3_User_Text_4v401 ,
	VA = 0x6b300006e000 ,/* 0x6b300006ffc0 */
	RA = 0x00b012e000 ,
	PA = 0x00b012e000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x180000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00006b300006e000 80000000b012e080 */
	end_label   = Thr3_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v401_text_begin
Thr3_User_Text_4v401_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc995c60
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
thr3_MMU_ASI_PRIMARY_199:
	.word	0x87802080
	.word	0xc4f5a0c0
	.word	0xbe85a008
	.word	0xe0dfc200
	.word	0xbe812108
	.word	0xd4dfd000
	.word	0xc02cad39
	.word	0x1000000
	.word	0xbe170000
	P_IDEMAP_RPAGE
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_200:
	.word	0x8780202a
	.word	0xdcbda9d0
	.word	0xc85b20d8
	.word	0xec5ca0e8
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_201:
	.word	0x8780202b
	.word	0xd4b96920
	.word	0xfc998480
	.word	0x1000000
	or	%g0, 0xa5, %i7
	P_LOAD_IDATA_ACCESS
	P_DDEMAP_NCTX
	.word	0xfcdd9000
	.word	0xfe5de6f8
thr3_MMU_ASI_BLK_P_202:
	.word	0x878020f0
	.word	0xe1baa4c0
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	nop
	nop
	nop
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x312, %i7
	P_LOAD_DDATA_ACCESS
	P_TOGGLE_LSU_IM
	.word	0xfe59ab40
	P_TOGGLE_LSU_IM
	P_IDEMAP_NCTX
	P_DDEMAP_ALL_PAGES
	.word	0xbe85a148
	.word	0xecdfc200
	.word	0xe05ca0c0
	.word	0xbe82a108
	.word	0xd4dfd000
thr3_MMU_ASI_AS_IF_USER_PRIMARY_203:
	.word	0x87802010
	.word	0xd6f0a070
	.word	0xfcda9000
	P_TOGGLE_LSU_DM
	.word	0xc021a450
	.word	0xfc998480
	nop
	nop
	nop
	P_IDEMAP_NCTX
	.word	0xfc9b0480
	.word	0x1000000
	or	%g0, 0x52b, %i7
	P_LOAD_DDATA_ACCESS
	nop
	nop
	nop
	.word	0xfc995d60
	.word	0x1000000
	or	%g0, 0x160, %i7
	P_ITLB_TAG_READ
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v401_exit:
	EXIT_GOOD
Thr3_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v004 TEXT_VA=0x6b3000106000
attr_text {
	Name = .Thr3_User_Text_4v004 ,
	VA = 0x6b3000106000 ,/* 0x6b3000107fc0 */
	RA = 0x00b01a0000 ,
	PA = 0x00b01a0000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00006b3000107412 80000000b01a0480 */
	end_label   = Thr3_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v004_text_begin
Thr3_User_Text_4v004_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc072a158
	.word	0xfc9c8480
	.word	0x1000000
	or	%g0, 0x076, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x258, %i7
	P_DTLB_TAG_READ
thr3_MMU_ASI_AS_IF_USER_PRIMARY_204:
	.word	0x87802010
	.word	0xf6f2a068
	.word	0xfcdd9040
	.word	0x1000000
	.word	0xbe108000
	P_DDEMAP_PAGE
	.word	0xfcda8200
	.word	0x1000000
	or	%g0, 0x440, %i7
	P_ITLB_TAG_READ
	nop
	.word	0xbe80a068
	.word	0xf6dfc200
	.word	0xbe8420f8
	.word	0xf6dfd040
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe13c000
	P_DDEMAP_PAGE
	.word	0xbe82a098
	.word	0xd4dfd000
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_205:
	.word	0x8780202a
	.word	0xf8b8a230
	.word	0xc872a098
	.word	0xc031240a
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc998580
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
thr3_MMU_ASI_PRIMARY_206:
	.word	0x87802080
	.word	0xf4f0a0e0
	P_DDEMAP_SCTX
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_AS_IF_USER_PRIMARY_207:
	.word	0x87802010
	.word	0xe4f5a018
	.word	0x1000000
	or	%g0, 0x5b8, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe80a0e8
	.word	0xf6dfc200
	.word	0xd45aa008
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0xe4, %i7
	P_LOAD_IDATA_ACCESS
thr3_MMU_ASI_BLK_P_208:
	.word	0x878020f0
	.word	0xe3b8a140
	P_ACCESS_DTSB_PTR
	.word	0xc85c2008
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_209:
	.word	0x87802080
	.word	0xdef6e150
	.word	0x1000000
	or	%g0, 0x073, %i7
	P_LOAD_IDATA_IN
	P_ACCESS_DTSB_PTR
	P_DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v004_exit:
	EXIT_GOOD
Thr3_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v102 DATA_VA=0x6d0021400000
attr_data {
	Name = .Thr3_User_Data_4v102 ,
	VA = 0x6d0021400000 ,/* 0x6d00217fffc0 */
	RA = 0x01bc000000 ,
	PA = 0x01bc000000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006d0021401412 80000001bc000043 */
	end_label   = Thr3_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v102_data_begin
Thr3_User_Data_4v102_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v202 DATA_VA=0x6b300016e000
attr_data {
	Name = .Thr3_User_Data_4v202 ,
	VA = 0x6b300016e000 ,/* 0x6b300016ffc0 */
	RA = 0x00b0192000 ,
	PA = 0x00b0192000 ,
	TTE_Context = 0x1291 ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 00006b300016f291 80000000b0192040 */
	end_label   = Thr3_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v202_data_begin
Thr3_User_Data_4v202_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v302 DATA_VA=0x6d0033000000
attr_data {
	Name = .Thr3_User_Data_4v302 ,
	VA = 0x6d0033000000 ,/* 0x6d00333fffc0 */
	RA = 0x01bf400000 ,
	PA = 0x01bf400000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006d0033000000 80000001bf400443 */
	end_label   = Thr3_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v302_data_begin
Thr3_User_Data_4v302_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v005 TEXT_VA=0x6b3000130000
attr_text {
	Name = .Thr3_User_Text_4v005 ,
	VA = 0x6b3000130000 ,/* 0x6b3000131fc0 */
	RA = 0x00b002e000 ,
	PA = 0x00b002e000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006b3000131412 80000000b002e480 */
	end_label   = Thr3_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v005_text_begin
Thr3_User_Text_4v005_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v005_exit
	nop
	DDEMAP_ALL_PAGES
	.word	0xbe86e068
	.word	0xe0dfd000
	DDEMAP_NCTX
	TOGGLE_LSU_IM
	.word	0xc030af6e
	.word	0xea7420a8
	.word	0xc025ad84
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe164000
	DDEMAP_RPAGE
	DDEMAP_SCTX
	.word	0xe276e040
	.word	0xc03423aa
	.word	0x1000000
	or	%g0, 0x461, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x0a4, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL_RPAGES
	nop
	nop
	.word	0xfe442d44
	.word	0x1000000
	or	%g0, 0x04f, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe174000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x5ed, %i7
	LOAD_IDATA_ACCESS
	.word	0xe05aa138
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_RPAGES
	.word	0xda72a140
	.word	0xc036ee46
	.word	0x1000000
	or	%g0, 0x328, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc026ee24
	.word	0x1000000
	or	%g0, 0x18, %i7
	LOAD_DDATA_ACCESS
	.word	0xec5c2128
	.word	0xc45ee0c0
	.word	0x1000000
	or	%g0, 0x5fb, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xfe5c2578
	.word	0x1000000
	or	%g0, 0x5db, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcda9040
	.word	0x1000000
	or	%g0, 0x5d8, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	.word	0xfe56e5a0
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xf072a050
	.word	0xc0712df0
	.word	0x81c76000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v005_exit:
	EXIT_GOOD
Thr3_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v402 TEXT_VA=0x6c0000940000
attr_text {
	Name = .Thr3_User_Text_4v402 ,
	VA = 0x6c0000940000 ,/* 0x6c000094ffc0 */
	RA = 0x03e0280000 ,
	PA = 0x3fe0280000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr3_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x180000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006c0000940000 8000003fe0280081 */
	end_label   = Thr3_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v402_text_begin
Thr3_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xc021a270
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_210:
	.word	0x87802080
	.word	0xf8f0a150
	.word	0xfcda9000
thr3_MMU_ASI_SECONDARY_211:
	.word	0x87802081
	.word	0xd6f16010
	.word	0xf659a0c0
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x034, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x190, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x460, %i7
	P_LOAD_IDATA_ACCESS
	P_ACCESS_DTSB_PTR
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe14c000
	P_DDEMAP_PAGE
	.word	0xfe44a454
thr3_MMU_ASI_AS_IF_USER_PRIMARY_212:
	.word	0x87802010
	.word	0xf6f2a038
	.word	0x1000000
	or	%g0, 0x5d8, %i7
	P_READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1d7, %i7
	P_LOAD_DDATA_ACCESS
	P_IDEMAP_NCTX
	P_ACCESS_ITSB_PTR
	.word	0xcc74a078
	.word	0xc031a328
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe842068
	.word	0xd4dfd000
	.word	0xc021a238
	.word	0xf675e098
	.word	0xc024a218
	.word	0xfe41a8f8
	.word	0x1000000
	or	%g0, 0xb8, %i7
	P_READ_IDATA_ACCESS
	.word	0xca5b2040
	P_DDEMAP_ALL_RPAGES
thr3_MMU_ASI_AS_IF_USER_PRIMARY_213:
	.word	0x87802010
	.word	0xc4f6e0d8
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x240, %i7
	P_DTLB_TAG_READ
thr3_MMU_ASI_PRIMARY_LITTLE_214:
	.word	0x87802088
	.word	0xd6f2a010
	.word	0xf659a128
	P_DDEMAP_PCTX
thr3_MMU_ASI_PRIMARY_215:
	.word	0x87802080
	.word	0xcef5a0d0
	P_DDEMAP_NCTX
	.word	0xfcded000
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v402_exit:
	EXIT_GOOD
Thr3_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v006 TEXT_VA=0x6b30001fe000
attr_text {
	Name = .Thr3_User_Text_4v006 ,
	VA = 0x6b30001fe000 ,/* 0x6b30001fffc0 */
	RA = 0x00b0080000 ,
	PA = 0x00b0080000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00006b30001ff412 80000000b0080480 */
	end_label   = Thr3_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v006_text_begin
Thr3_User_Text_4v006_text_begin:
	wrpr	0, %gl
	P_DDEMAP_PCTX
	.word	0xc02aa343
	P_IDEMAP_PCTX
	.word	0xfcd95160
thr3_MMU_ASI_PRIMARY_216:
	.word	0x87802080
	.word	0xe6f0a0f0
thr3_MMU_ASI_BLK_P_217:
	.word	0x878020f0
	.word	0xc1b8a2c0
	.word	0xec58a0f8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_AS_IF_USER_PRIMARY_218:
	.word	0x87802010
	.word	0xc6f120a8
	.word	0x1000000
	or	%g0, 0x198, %i7
	P_ITLB_TAG_READ
	.word	0xfe4ee570
	nop
	nop
	nop
	.word	0xfcded000
	.word	0xfc9a9000
	.word	0x1000000
	or	%g0, 0x039, %i7
	P_LOAD_DDATA_IN
	.word	0xbe842148
	.word	0xc8dfc200
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v006_exit:
	EXIT_GOOD
Thr3_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v103 DATA_VA=0x6b3000070000
attr_data {
	Name = .Thr3_User_Data_4v103 ,
	VA = 0x6b3000070000 ,/* 0x6b3000071fc0 */
	RA = 0x00b000c000 ,
	PA = 0x00b000c000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006b3000071412 80000000b000c040 */
	end_label   = Thr3_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v103_data_begin
Thr3_User_Data_4v103_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v303 DATA_VA=0x6c0000950000
attr_data {
	Name = .Thr3_User_Data_4v303 ,
	VA = 0x6c0000950000 ,/* 0x6c000095ffc0 */
	RA = 0x03e0890000 ,
	PA = 0x3fe0890000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 00006c0000950000 8000003fe0890441 */
	end_label   = Thr3_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v303_data_begin
Thr3_User_Data_4v303_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v007 TEXT_VA=0x6c0000030000
attr_text {
	Name = .Thr3_User_Text_4v007 ,
	VA = 0x6c0000030000 ,/* 0x6c000003ffc0 */
	RA = 0x03e0490000 ,
	PA = 0x3fe0490000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006c0000031412 8000003fe0490481 */
	end_label   = Thr3_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v007_text_begin
Thr3_User_Text_4v007_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v007_exit
	nop
thr3_MMU_ASI_PRIMARY_LITTLE_219:
	.word	0x87802088
	.word	0xf8f42030
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc032a448
	ACCESS_DTSB_PTR
	.word	0xc67120c8
	.word	0xc0712848
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc026efd8
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v007_exit:
	EXIT_GOOD
Thr3_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v403 TEXT_VA=0x6b3000078000
attr_text {
	Name = .Thr3_User_Text_4v403 ,
	VA = 0x6b3000078000 ,/* 0x6b3000079fc0 */
	RA = 0x00b009c000 ,
	PA = 0x00b009c000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x180000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00006b3000078000 80000000b009c080 */
	end_label   = Thr3_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v403_text_begin
Thr3_User_Text_4v403_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd659a010
	nop
	nop
	nop
	nop
	.word	0xbe86e068
	.word	0xecdfd000
	.word	0xc024a764
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe174000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x186, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfcded000
	nop
	.word	0xc0732158
	.word	0xbe82a118
	.word	0xd4dfc200
	P_ACCESS_ITSB_PTR
	.word	0xfcda83a0
	.word	0x1000000
	or	%g0, 0x168, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe80a098
	.word	0xd4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_PCTX
thr3_MMU_ASI_AS_IF_USER_PRIMARY_220:
	.word	0x87802010
	.word	0xf0f0a0b8
	P_DDEMAP_PCTX
	.word	0xf871a0f0
	.word	0xc074a158
thr3_MMU_ASI_AS_IF_USER_PRIMARY_221:
	.word	0x87802010
	.word	0xf2f0a028
	P_TOGGLE_LSU_IM
	.word	0xc02b242d
	.word	0xfcdec200
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v403_exit:
	EXIT_GOOD
Thr3_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v008 TEXT_VA=0x6c0000be0000
attr_text {
	Name = .Thr3_User_Text_4v008 ,
	VA = 0x6c0000be0000 ,/* 0x6c0000beffc0 */
	RA = 0x03e0900000 ,
	PA = 0x3fe0900000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006c0000be1412 8000003fe0900481 */
	end_label   = Thr3_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v008_text_begin
Thr3_User_Text_4v008_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x6f8, %i7
	P_READ_DDATA_ACCESS
thr3_MMU_ASI_PRIMARY_LITTLE_222:
	.word	0x87802088
	.word	0xd4bc2d20
	.word	0xfe42a81c
thr3_MMU_ASI_AS_IF_USER_PRIMARY_223:
	.word	0x87802010
	.word	0xe2f5a010
	P_IDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe13c000
	P_DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe14c000
	P_DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x7a1, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x029, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x1b5, %i7
	P_LOAD_IDATA_ACCESS
thr3_MMU_ASI_PRIMARY_224:
	.word	0x87802080
	.word	0xc6f5a140
	.word	0xe19942e0
	.word	0xfcdd9000
	P_DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x033, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x05d, %i7
	P_LOAD_DDATA_IN
thr3_MMU_ASI_AS_IF_USER_PRIMARY_225:
	.word	0x87802010
	.word	0xfaf0a000
	.word	0xe39a83c0
	P_IDEMAP_ALL
	P_DDEMAP_NCTX
	P_TOGGLE_LSU_DM
	.word	0xbe82a118
	.word	0xe0dfc200
	P_DDEMAP_SCTX
	P_DDEMAP_ALL
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v008_exit:
	EXIT_GOOD
Thr3_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v104 DATA_VA=0x6c0000480000
attr_data {
	Name = .Thr3_User_Data_4v104 ,
	VA = 0x6c0000480000 ,/* 0x6c000048ffc0 */
	RA = 0x03e0230000 ,
	PA = 0x3fe0230000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006c0000481412 8000003fe0230041 */
	end_label   = Thr3_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v104_data_begin
Thr3_User_Data_4v104_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v009 TEXT_VA=0x6c0000370000
attr_text {
	Name = .Thr3_User_Text_4v009 ,
	VA = 0x6c0000370000 ,/* 0x6c000037ffc0 */
	RA = 0x03e0ff0000 ,
	PA = 0x3fe0ff0000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006c0000371412 8000003fe0ff0481 */
	end_label   = Thr3_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v009_text_begin
Thr3_User_Text_4v009_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v009_exit
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_LITTLE_226:
	.word	0x87802088
	.word	0xdef5a120
	.word	0xfe40a038
	.word	0x1000000
	.word	0xbe130000
	IDEMAP_PAGE
	.word	0xfc9d9c40
	.word	0xf875a140
	.word	0xc02c2c03
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	.word	0xc076e8c8
	.word	0x1000000
	.word	0xbe120000
	DDEMAP_PAGE
	IDEMAP_ALL
	.word	0x1000000
	.word	0xbe174000
	IDEMAP_PAGE
	.word	0xbe168000
	GOTO_SUPERVISOR0
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xf276e028
	.word	0xc02da779
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v009_exit:
	EXIT_GOOD
Thr3_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00a TEXT_VA=0x6c0000310000
attr_text {
	Name = .Thr3_User_Text_4v00a ,
	VA = 0x6c0000310000 ,/* 0x6c000031ffc0 */
	RA = 0x03e0df0000 ,
	PA = 0x3fe0df0000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006c0000311412 8000003fe0df0481 */
	end_label   = Thr3_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00a_text_begin
Thr3_User_Text_4v00a_text_begin:
	wrpr	0, %gl
	P_IDEMAP_PCTX
	.word	0xfc998480
	.word	0xfcd89000
	P_DDEMAP_NCTX
	P_TOGGLE_LSU_DM
thr3_MMU_ASI_PRIMARY_227:
	.word	0x87802080
	.word	0xdaf42080
	.word	0xf076e020
	.word	0xc0742778
	.word	0x1000000
	.word	0xbe10c000
	P_IDEMAP_RPAGE
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_228:
	.word	0x8780202a
	.word	0xfcbc2630
	.word	0x1000000
	or	%g0, 0xa5, %i7
	P_LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8120c0
	.word	0xf6dfd000
	.word	0x1000000
	or	%g0, 0x5f0, %i7
	P_ITLB_TAG_READ
	nop
	nop
	.word	0xbe872060
	.word	0xccdfc280
	.word	0xfcdc0200
	.word	0xbe85a008
	.word	0xd4dfd000
	.word	0xc0342b2e
	P_DDEMAP_SCTX
	.word	0xee72a048
	.word	0xc030ad86
	nop
	nop
	nop
	.word	0xbe86e108
	.word	0xecdfd000
	.word	0x1000000
	.word	0xbe16c000
	P_IDEMAP_PAGE
thr3_MMU_ASI_PRIMARY_229:
	.word	0x87802080
	.word	0xd2f5a100
	.word	0xc035acce
	.word	0x1000000
	or	%g0, 0x32d, %i7
	P_LOAD_DDATA_ACCESS
	nop
	nop
	nop
	P_ACCESS_ITSB_PTR
	P_TOGGLE_LSU_IM
	.word	0xc0742188
	.word	0x1000000
	.word	0xbe16c000
	P_IDEMAP_RPAGE
	P_IDEMAP_ALL
	.word	0xbe842138
	.word	0xe0dfc200
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	P_READ_IDATA_ACCESS
	.word	0xc036e650
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x588, %i7
	P_READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
thr3_MMU_ASI_AS_IF_USER_PRIMARY_230:
	.word	0x87802010
	.word	0xdef420a8
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x338, %i7
	P_READ_DDATA_ACCESS
	.word	0xfcda8200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x130, %i7
	P_LOAD_IDATA_ACCESS
	P_TOGGLE_LSU_DM
thr3_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_231:
	.word	0x87802018
	.word	0xdef2a140
	.word	0xc0342e84
	P_ACCESS_DTSB_PTR
	.word	0xc022ac14
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	P_READ_IDATA_ACCESS
	.word	0xc025a158
	.word	0xbe80a128
	.word	0xecdfc200
	.word	0xfe492f89
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v00a_exit:
	EXIT_GOOD
Thr3_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v105 DATA_VA=0x6b3000148000
attr_data {
	Name = .Thr3_User_Data_4v105 ,
	VA = 0x6b3000148000 ,/* 0x6b3000149fc0 */
	RA = 0x00b019a000 ,
	PA = 0x00b019a000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006b3000149412 80000000b019a040 */
	end_label   = Thr3_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v105_data_begin
Thr3_User_Data_4v105_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00b TEXT_VA=0x6c0000970000
attr_text {
	Name = .Thr3_User_Text_4v00b ,
	VA = 0x6c0000970000 ,/* 0x6c000097ffc0 */
	RA = 0x03e0f70000 ,
	PA = 0x3fe0f70000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006c0000971412 8000003fe0f70481 */
	end_label   = Thr3_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00b_text_begin
Thr3_User_Text_4v00b_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v00b_exit
	nop
	.word	0xfcda9000
	.word	0xfcded000
	.word	0xc02c2932
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x095, %i7
	LOAD_DDATA_IN
	ACCESS_ITSB_PTR
	.word	0xcc58a018
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	ITLB_TAG_READ
	.word	0xfe592a28
	.word	0xcc5da018
	.word	0xfe42aa3c
	.word	0xe05aa098
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf872a130
	.word	0xc02ee2ad
	.word	0xd076e028
	.word	0xc072aeb0
	.word	0xfe50a6aa
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0xb0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x478, %i7
	READ_IDATA_ACCESS
	.word	0xf672a118
	.word	0xc0712988
	.word	0x1000000
	or	%g0, 0x3da, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x628, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4daca6
	.word	0xd470a0d8
	.word	0xc0742538
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfcdd9000
	ACCESS_DTSB_PTR
	.word	0xfe4da350
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_SCTX
	.word	0xca5da010
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc030a172
	.word	0xfc9c1c40
	TOGGLE_LSU_DM
	IDEMAP_ALL
	DDEMAP_ALL_PAGES
	.word	0xfcdc1000
	.word	0xfa76e110
	.word	0xc0342988
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xe45ee0a0
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00b_exit:
	EXIT_GOOD
Thr3_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v106 DATA_VA=0x6b30001fc000
attr_data {
	Name = .Thr3_User_Data_4v106 ,
	VA = 0x6b30001fc000 ,/* 0x6b30001fdfc0 */
	RA = 0x00b007e000 ,
	PA = 0x00b007e000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006b30001fd412 80000000b007e040 */
	end_label   = Thr3_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v106_data_begin
Thr3_User_Data_4v106_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00c TEXT_VA=0x6b30001ee000
attr_text {
	Name = .Thr3_User_Text_4v00c ,
	VA = 0x6b30001ee000 ,/* 0x6b30001effc0 */
	RA = 0x00b0182000 ,
	PA = 0x00b0182000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006b30001ef412 80000000b0182480 */
	end_label   = Thr3_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00c_text_begin
Thr3_User_Text_4v00c_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v00c_exit
	nop
	.word	0xc072ad18
	nop
	nop
	nop
	.word	0xc034276e
	.word	0x1000000
	or	%g0, 0x30, %i7
	READ_IDATA_ACCESS
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x74, %i7
	LOAD_DDATA_ACCESS
	IDEMAP_ALL_PAGES
	.word	0xfc9c5020
	.word	0xe275a010
	.word	0xc076ee18
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x510, %i7
	ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	nop
	nop
	nop
	nop
	nop
	.word	0xfa7420a8
	.word	0xc072a980
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x077, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0xda, %i7
	LOAD_DDATA_ACCESS
	.word	0xcc76e018
	.word	0xc075ab40
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe82a038
	.word	0xe0dfd000
thr3_MMU_ASI_PRIMARY_232:
	.word	0x87802080
	.word	0xc4f2a038
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	READ_DDATA_ACCESS
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x046, %i7
	LOAD_IDATA_IN
thr3_MMU_ASI_PRIMARY_233:
	.word	0x87802080
	.word	0xd2f5a030
	.word	0xfc9ad120
	ACCESS_ITSB_PTR
	.word	0xfcd89000
	.word	0xbe80a068
	.word	0xc8dfd000
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9c1c40
	.word	0xe275a040
	.word	0xc03425ca
	.word	0xc85aa0d8
	.word	0xe05c20e8
	.word	0xfcda9000
	nop
	nop
	.word	0x1000000
	or	%g0, 0x78, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x25, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x091, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_DM
	.word	0xcc72a018
	.word	0xc02da158
thr3_MMU_ASI_PRIMARY_234:
	.word	0x87802080
	.word	0xd2f42060
	.word	0xfcdd9000
	.word	0xfe55a376
	nop
	nop
	.word	0xc022a3a4
	.word	0x1000000
	or	%g0, 0x04e, %i7
	LOAD_IDATA_IN
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x40c, %i7
	LOAD_IDATA_ACCESS
	.word	0xec58a0c0
	.word	0xca72a010
	.word	0xc036e21c
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xe05c2068
	.word	0x1000000
	or	%g0, 0x0ad, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x53d, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x01c, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_DM
	.word	0xfe5daf68
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x458, %i7
	READ_IDATA_ACCESS
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	READ_IDATA_ACCESS
	.word	0xc4742118
	.word	0xc025aaa0
	.word	0xf272a028
	.word	0xc02eecdb
thr3_MMU_ASI_PRIMARY_235:
	.word	0x87802080
	.word	0xe2f6e010
	IDEMAP_ALL_PAGES
	.word	0xc45da0c0
	.word	0x1000000
	or	%g0, 0x065, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xc020ace4
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00c_exit:
	EXIT_GOOD
Thr3_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v107 DATA_VA=0x6b3000120000
attr_data {
	Name = .Thr3_User_Data_4v107 ,
	VA = 0x6b3000120000 ,/* 0x6b3000121fc0 */
	RA = 0x00b01c0000 ,
	PA = 0x00b01c0000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006b3000121412 80000000b01c0040 */
	end_label   = Thr3_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v107_data_begin
Thr3_User_Data_4v107_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00d TEXT_VA=0x6e0210000000
attr_text {
	Name = .Thr3_User_Text_4v00d ,
	VA = 0x6e0210000000 ,/* 0x6e021fffffc0 */
	RA = 0x02c0000000 ,
	PA = 0x02c0000000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006e0210001412 80000002c0000485 */
	end_label   = Thr3_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00d_text_begin
Thr3_User_Text_4v00d_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v00d_exit
	nop
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x58, %i7
	READ_DDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe0592068
thr3_MMU_ASI_PRIMARY_236:
	.word	0x87802080
	.word	0xcef5a000
	.word	0xfe40a9c8
thr3_MMU_ASI_PRIMARY_237:
	.word	0x87802080
	.word	0xc8f420c0
	IDEMAP_ALL
	.word	0xfe56ec66
	nop
	.word	0xc02dabae
	.word	0x1000000
	or	%g0, 0x369, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x09b, %i7
	LOAD_DDATA_IN
	IDEMAP_PCTX
	IDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe174000
	GOTO_SUPERVISOR0
	DDEMAP_SCTX
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd45ee038
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00d_exit:
	EXIT_GOOD
Thr3_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v108 DATA_VA=0x6c0000b10000
attr_data {
	Name = .Thr3_User_Data_4v108 ,
	VA = 0x6c0000b10000 ,/* 0x6c0000b1ffc0 */
	RA = 0x03e01e0000 ,
	PA = 0x3fe01e0000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006c0000b11412 8000003fe01e0041 */
	end_label   = Thr3_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v108_data_begin
Thr3_User_Data_4v108_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00e TEXT_VA=0x6c00001c0000
attr_text {
	Name = .Thr3_User_Text_4v00e ,
	VA = 0x6c00001c0000 ,/* 0x6c00001cffc0 */
	RA = 0x03e0bf0000 ,
	PA = 0x3fe0bf0000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006c00001c1412 8000003fe0bf0481 */
	end_label   = Thr3_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00e_text_begin
Thr3_User_Text_4v00e_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v00e_exit
	nop
	.word	0xfe52af58
	.word	0xee742018
	.word	0xc07425e0
	.word	0x1000000
	or	%g0, 0x15, %i7
	LOAD_DDATA_ACCESS
thr3_MMU_ASI_PRIMARY_LITTLE_238:
	.word	0x87802088
	.word	0xc6f2a140
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc03429da
thr3_MMU_ASI_BLK_P_239:
	.word	0x878020f0
	.word	0xe1bc2700
	DDEMAP_SCTX
	.word	0xfe4c22e1
	.word	0xfe5ee220
	.word	0xfc995c60
	.word	0x1000000
	or	%g0, 0xc0, %i7
	ITLB_TAG_READ
	nop
	nop
	.word	0x1000000
	.word	0xbe17c000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x728, %i7
	READ_DDATA_ACCESS
thr3_MMU_ASI_PRIMARY_240:
	.word	0x87802080
	.word	0xd2f420d0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe275a040
	.word	0xc022a6b0
	nop
	.word	0x1000000
	.word	0xbe154000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x041, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0xe0, %i7
	ITLB_TAG_READ
	.word	0xe070a148
	.word	0xc02aaceb
thr3_MMU_ASI_SECONDARY_241:
	.word	0x87802081
	.word	0xecb966d0
	.word	0x1000000
	or	%g0, 0x05b, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x045, %i7
	LOAD_DDATA_IN
	.word	0xc036e880
	.word	0x1000000
	or	%g0, 0x63e, %i7
	LOAD_DDATA_ACCESS
thr3_MMU_ASI_BLK_COMMIT_S_242:
	.word	0x878020e1
	.word	0xe3bae240
	DDEMAP_ALL
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	DTLB_TAG_READ
	.word	0xbe86e0f8
	.word	0xecdfd000
	IDEMAP_PCTX
	DDEMAP_SCTX
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_BLK_P_243:
	.word	0x878020f0
	.word	0xc3bdae80
	.word	0xe4742048
	.word	0xc0742aa0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xda75a080
	.word	0xc03121a2
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00e_exit:
	EXIT_GOOD
Thr3_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v109 DATA_VA=0x6d002c000000
attr_data {
	Name = .Thr3_User_Data_4v109 ,
	VA = 0x6d002c000000 ,/* 0x6d002c3fffc0 */
	RA = 0x01b6400000 ,
	PA = 0x01b6400000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006d002c001412 80000001b6400043 */
	end_label   = Thr3_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v109_data_begin
Thr3_User_Data_4v109_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00f TEXT_VA=0x6c0000d60000
attr_text {
	Name = .Thr3_User_Text_4v00f ,
	VA = 0x6c0000d60000 ,/* 0x6c0000d6ffc0 */
	RA = 0x03e0970000 ,
	PA = 0x3fe0970000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006c0000d61412 8000003fe0970481 */
	end_label   = Thr3_User_Text_4v00f_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00f_text_begin
Thr3_User_Text_4v00f_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v00f_exit
	nop
thr3_MMU_ASI_PRIMARY_LITTLE_244:
	.word	0x87802088
	.word	0xd8f5a018
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x012, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL_RPAGES
	.word	0xe05c2008
	.word	0xe058a008
	DDEMAP_ALL
	.word	0xfe4c243e
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfcded000
	DDEMAP_ALL_RPAGES
	.word	0xe05da128
	.word	0x1000000
	or	%g0, 0x281, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x196, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x31e, %i7
	LOAD_DDATA_ACCESS
	ACCESS_DTSB_PTR
thr3_MMU_ASI_BLK_COMMIT_P_245:
	.word	0x878020e0
	.word	0xe3baa3c0
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5ee210
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x711, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe130000
	IDEMAP_PAGE
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x620, %i7
	READ_DDATA_ACCESS
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xd875a018
	.word	0xc0242730
	nop
thr3_MMU_ASI_SECONDARY_LITTLE_246:
	.word	0x87802089
	.word	0xf6f2e038
	.word	0xc030a73e
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr3_MMU_ASI_BLK_COMMIT_P_247:
	.word	0x878020e0
	.word	0xc1baa840
	.word	0xc0742d78
	.word	0x1000000
	or	%g0, 0x595, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xca75a070
	.word	0xc02aadbf
	.word	0xc035aa4e
	.word	0xc025a3d4
	.word	0xbe82a0c0
	.word	0xc4dfd000
	TOGGLE_LSU_IM
	DDEMAP_NCTX
	.word	0xdc72a058
	.word	0xc076e3e0
	.word	0xc02eeb11
	.word	0xec5aa068
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xda712050
	.word	0xc07429b0
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v00f_exit:
	EXIT_GOOD
Thr3_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10a DATA_VA=0x6b30001d6000
attr_data {
	Name = .Thr3_User_Data_4v10a ,
	VA = 0x6b30001d6000 ,/* 0x6b30001d7fc0 */
	RA = 0x00b00ac000 ,
	PA = 0x00b00ac000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006b30001d7412 80000000b00ac040 */
	end_label   = Thr3_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10a_data_begin
Thr3_User_Data_4v10a_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v010 TEXT_VA=0x6d002e000000
attr_text {
	Name = .Thr3_User_Text_4v010 ,
	VA = 0x6d002e000000 ,/* 0x6d002e3fffc0 */
	RA = 0x01bb000000 ,
	PA = 0x01bb000000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006d002e001412 80000001bb000483 */
	end_label   = Thr3_User_Text_4v010_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v010_text_begin
Thr3_User_Text_4v010_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v010_exit
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_PCTX
	.word	0xc030a4a8
	.word	0x1000000
	or	%g0, 0x067, %i7
	LOAD_IDATA_IN
	.word	0xbe85a068
	.word	0xd4dfd000
	.word	0xfe46e7c8
	.word	0x1000000
	or	%g0, 0x588, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe442188
	nop
	.word	0x1000000
	or	%g0, 0x470, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x170, %i7
	READ_DDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcdd9000
	DDEMAP_PCTX
	.word	0xc026ea8c
	.word	0xd45c2148
	.word	0xee76e048
	.word	0xc070a460
	.word	0xd45da108
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	ACCESS_DTSB_PTR
	.word	0xd4742148
	.word	0xc0342806
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe11c000
	IDEMAP_RPAGE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe072a0c0
	.word	0xc02da932
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe5c2db8
	.word	0xbe164000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v010_exit:
	EXIT_GOOD
Thr3_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10b DATA_VA=0x6d0038c00000
attr_data {
	Name = .Thr3_User_Data_4v10b ,
	VA = 0x6d0038c00000 ,/* 0x6d0038ffffc0 */
	RA = 0x01b7000000 ,
	PA = 0x01b7000000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006d0038c01412 80000001b7000043 */
	end_label   = Thr3_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10b_data_begin
Thr3_User_Data_4v10b_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v011 TEXT_VA=0x6d001bc00000
attr_text {
	Name = .Thr3_User_Text_4v011 ,
	VA = 0x6d001bc00000 ,/* 0x6d001bffffc0 */
	RA = 0x01bf800000 ,
	PA = 0x01bf800000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006d001bc01412 80000001bf800483 */
	end_label   = Thr3_User_Text_4v011_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v011_text_begin
Thr3_User_Text_4v011_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v011_exit
	nop
	.word	0xfc9a9100
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1fc, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd85aa048
	.word	0xf65da098
	.word	0xc02c242d
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xbe85a0c0
	.word	0xe0dfd000
	.word	0xc0712178
	.word	0xbe154000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x480, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe46eba8
	.word	0x1000000
	or	%g0, 0x7a, %i7
	LOAD_DDATA_ACCESS
thr3_MMU_ASI_BLK_P_248:
	.word	0x878020f0
	.word	0xe3bee840
	.word	0xbe82a098
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x730, %i7
	DTLB_TAG_READ
	.word	0xfcdad060
thr3_MMU_ASI_PRIMARY_249:
	.word	0x87802080
	.word	0xd8f42048
	.word	0x1000000
	or	%g0, 0x728, %i7
	DTLB_TAG_READ
	.word	0xc036e688
	.word	0x1000000
	or	%g0, 0x056, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x06d, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x591, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xec5c20e8
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v011_exit:
	EXIT_GOOD
Thr3_User_Text_4v011_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10c DATA_VA=0x6b3000072000
attr_data {
	Name = .Thr3_User_Data_4v10c ,
	VA = 0x6b3000072000 ,/* 0x6b3000073fc0 */
	RA = 0x00b017a000 ,
	PA = 0x00b017a000 ,
	TTE_Context = 0x1412 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006b3000073412 80000000b017a040 */
	end_label   = Thr3_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10c_data_begin
Thr3_User_Data_4v10c_data_begin:
	.xword	0x6d001a000000
	.xword	0x6c0000020000
	.xword	0x6d0008000000
	.xword	0x6d003cc00000
	.xword	0x6e0660000000
	.xword	0x6b30001ac000
	.xword	0x6c0000590000
	.xword	0x6c0000d40000
	.xword	0x6c0000610000
	.xword	0x6d003f000000
	.xword	0x6b3000188000
	.xword	0x6b300006e000
	.xword	0x6b3000106000
	.xword	0x6d0021400000
	.xword	0x6b300016e000
	.xword	0x6d0033000000
	.xword	0x6b3000130000
	.xword	0x6c0000940000
	.xword	0x6b30001fe000
	.xword	0x6b3000070000
	.xword	0x6c0000950000
	.xword	0x6c0000030000
	.xword	0x6b3000078000
	.xword	0x6c0000be0000
	.xword	0x6c0000480000
	.xword	0x6c0000370000
	.xword	0x6c0000310000
	.xword	0x6b3000148000
	.xword	0x6c0000970000
	.xword	0x6b30001fc000
	.xword	0x6b30001ee000
	.xword	0x6b3000120000
	.xword	0x6e0210000000
	.xword	0x6c0000b10000
	.xword	0x6c00001c0000
	.xword	0x6d002c000000
	.xword	0x6c0000d60000
	.xword	0x6b30001d6000
	.xword	0x6d002e000000
	.xword	0x6d0038c00000
	.xword	0x6d001bc00000
	.xword	0x6b3000072000
	.xword	0x6c0000ba0000
Thr3_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v012 TEXT_VA=0x6c0000ba0000
attr_text {
	Name = .Thr3_User_Text_4v012 ,
	VA = 0x6c0000ba0000 ,/* 0x6c0000baffc0 */
	RA = 0x03e0010000 ,
	PA = 0x3fe0010000 ,
	TTE_Context = 0x1412 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* ITTE_TAG_DATA = 00006c0000ba1412 8000003fe0010481 */
	end_label   = Thr3_User_Text_4v012_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v012_text_begin
Thr3_User_Text_4v012_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr3_User_Text_4v012_exit
	nop
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe120000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x50f, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe52a288
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc022a97c
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe25ee010
	.word	0xc035a958
	.word	0x1000000
	or	%g0, 0x015, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe170000
	IDEMAP_PAGE
thr3_MMU_ASI_PRIMARY_250:
	.word	0x87802080
	.word	0xdef2a0c8
	nop
	nop
	nop
	IDEMAP_NCTX
	ACCESS_DTSB_PTR
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0x448, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	.word	0xec5aa068
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc85c2108
	.word	0xfe46e958
	.word	0xe05da038
	.word	0xbe86e138
	.word	0xf6dfd000
	IDEMAP_ALL_PAGES
thr3_MMU_ASI_BLK_S_251:
	.word	0x878020f1
	.word	0xe3b96cc0
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe154000
	DDEMAP_PAGE
	.word	0xbe812038
	.word	0xc4dfd000
	.word	0xbe85a098
	.word	0xd4dfd000
	DDEMAP_ALL
	.word	0xfc9d9c40
	.word	0xca5aa040
	.word	0xc02daac7
	nop
	nop
	nop
	nop
	.word	0xfcda9000
	nop
	nop
	nop
	DDEMAP_SCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc032ac48
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v012_exit:
	EXIT_GOOD
Thr3_User_Text_4v012_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x700000f10000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	VA = 0x700000f10000 ,/* 0x700000f1ffc0 */
	RA = 0x03f0680000 ,
	PA = 0x4ff0680000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 0000700000f10ee3 8000004ff0680081 */
	end_label   = Thr4_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr4_user_code_entry
Thr4_user_code_entry:
	setx	0x6f400013e000, %g1, %g2
	or	%g0, 12, %g1
	.word	0xc658a000
	.word	0xc858a008
	.word	0xca58a010
	.word	0xcc58a018
	.word	0xce58a020
	.word	0xd058a028
	.word	0xd258a030
	.word	0xd458a038
	.word	0xd658a040
	.word	0xd858a048
	.word	0xda58a050
	.word	0xdc58a058
	.word	0xde58a060
	.word	0xe058a068
	.word	0xe258a070
	.word	0xe458a078
	.word	0xe658a080
	.word	0xe858a088
	.word	0xea58a090
	.word	0xec58a098
	.word	0xee58a0a0
	.word	0xf058a0a8
	.word	0xf258a0b0
	.word	0xf458a0b8
	.word	0xf658a0c0
	.word	0xf858a0c8
	.word	0xfa58a0d0
	.word	0xfc58a0d8
.global Thr4_User_Text_4v000_text_begin
Thr4_User_Text_4v000_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr4_User_Text_4v000_exit
	nop
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x528, %i7
	DTLB_TAG_READ
	.word	0xbe85a0e0
	.word	0xe0dfd000
	.word	0xf05aa0a8
	.word	0xd4712068
	.word	0xc026ecbc
thr4_MMU_ASI_BLK_P_252:
	.word	0x878020f0
	.word	0xe1bdaa80
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x510, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9d9c40
	nop
	nop
	nop
	.word	0xc036e6b0
thr4_MMU_ASI_PRIMARY_253:
	.word	0x87802080
	.word	0xcaf0a010
	.word	0xc858a068
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02aa5a6
	.word	0x1000000
	or	%g0, 0x680, %i7
	READ_DDATA_ACCESS
	.word	0xe45ee078
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xfe55a57c
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v000_exit:
	EXIT_GOOD
Thr4_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v100 DATA_VA=0x6f400013e000
attr_data {
	Name = .Thr4_User_Data_4v100 ,
	VA = 0x6f400013e000 ,/* 0x6f400013ffc0 */
	RA = 0x00c0088000 ,
	PA = 0x00c0088000 ,
	TTE_Context = 0x0ee3 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 00006f400013f0cb 80000000c0088040 */
	end_label   = Thr4_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v100_data_begin
Thr4_User_Data_4v100_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v200 DATA_VA=0x710027c00000
attr_data {
	Name = .Thr4_User_Data_4v200 ,
	VA = 0x710027c00000 ,/* 0x710027ffffc0 */
	RA = 0x01c9000000 ,
	PA = 0x4dc9000000 ,
	TTE_Context = 0x1cf3 ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a0000 ,
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
	/* DTTE_TAG_DATA = 0000710027c01cf3 8000004dc9000443 */
	end_label   = Thr4_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v200_data_begin
Thr4_User_Data_4v200_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v300 DATA_VA=0x700000650000
attr_data {
	Name = .Thr4_User_Data_4v300 ,
	VA = 0x700000650000 ,/* 0x70000065ffc0 */
	RA = 0x03f03b0000 ,
	PA = 0x4ff03b0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0e0000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000700000650000 8000004ff03b0441 */
	end_label   = Thr4_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v300_data_begin
Thr4_User_Data_4v300_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v001 TEXT_VA=0x6f40000a0000
attr_text {
	Name = .Thr4_User_Text_4v001 ,
	VA = 0x6f40000a0000 ,/* 0x6f40000a1fc0 */
	RA = 0x00c01a4000 ,
	PA = 0x00c01a4000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00006f40000a10cb 80000000c01a4080 */
	end_label   = Thr4_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v001_text_begin
Thr4_User_Text_4v001_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr4_User_Text_4v001_exit
	nop
thr4_MMU_ASI_PRIMARY_254:
	.word	0x87802080
	.word	0xd4f6e100
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe148000
	IDEMAP_PAGE
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe4421bc
	.word	0xfe50ab08
	.word	0xc0342c44
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc675a020
	.word	0xc035a484
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0xfe42ab14
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd672a010
	.word	0xc020aba4
	.word	0x1000000
	or	%g0, 0x50, %i7
	READ_IDATA_ACCESS
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xc022a1f8
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v001_exit:
	EXIT_GOOD
Thr4_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v400 TEXT_VA=0x6f4000180000
attr_text {
	Name = .Thr4_User_Text_4v400 ,
	VA = 0x6f4000180000 ,/* 0x6f4000181fc0 */
	RA = 0x00c0034000 ,
	PA = 0x00c0034000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr4_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 00006f4000180000 80000000c0034080 */
	end_label   = Thr4_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v400_text_begin
Thr4_User_Text_4v400_text_begin:
	wrpr	0, %gl
thr4_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_255:
	.word	0x87802018
	.word	0xeef5a0a0
	.word	0xbe82a0e0
	.word	0xecdfd000
thr4_MMU_ASI_PRIMARY_256:
	.word	0x87802080
	.word	0xcaf6e010
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xf65e20c0
	.word	0xbe85a008
	.word	0xc4dfc200
	.word	0x1000000
	or	%g0, 0x78, %i7
	P_READ_IDATA_ACCESS
	.word	0xc074aff0
	P_DDEMAP_NCTX
	.word	0xfcdc1000
	.word	0xbe80a0e0
	.word	0xd4dfc200
	P_TOGGLE_LSU_IM
	.word	0xfcdc0200
	P_DDEMAP_NCTX
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v400_exit:
	EXIT_GOOD
Thr4_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v002 TEXT_VA=0x700000700000
attr_text {
	Name = .Thr4_User_Text_4v002 ,
	VA = 0x700000700000 ,/* 0x70000070ffc0 */
	RA = 0x03f0290000 ,
	PA = 0x4ff0290000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000700000700ee3 8000004ff0290081 */
	end_label   = Thr4_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v002_text_begin
Thr4_User_Text_4v002_text_begin:
	wrpr	0, %gl
	P_DDEMAP_ALL_RPAGES
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x68, %i7
	P_DTLB_TAG_READ
thr4_MMU_ASI_PRIMARY_257:
	.word	0x87802080
	.word	0xdef420d0
	.word	0xca742010
	.word	0xc076e910
	.word	0xbe85a0e0
	.word	0xe0dfc200
	P_ACCESS_ITSB_PTR
	.word	0xbe842100
	.word	0xecdfc200
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v002_exit:
	EXIT_GOOD
Thr4_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v101 DATA_VA=0x710001800000
attr_data {
	Name = .Thr4_User_Data_4v101 ,
	VA = 0x710001800000 ,/* 0x710001bfffc0 */
	RA = 0x01cfc00000 ,
	PA = 0x4dcfc00000 ,
	TTE_Context = 0x0ee3 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 0000710001800ee3 8000004dcfc00043 */
	end_label   = Thr4_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v101_data_begin
Thr4_User_Data_4v101_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v201 DATA_VA=0x6f4000090000
attr_data {
	Name = .Thr4_User_Data_4v201 ,
	VA = 0x6f4000090000 ,/* 0x6f4000091fc0 */
	RA = 0x00c013c000 ,
	PA = 0x00c013c000 ,
	TTE_Context = 0x1cf3 ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a0000 ,
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
	/* DTTE_TAG_DATA = 00006f40000916bb 80000000c013c440 */
	end_label   = Thr4_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v201_data_begin
Thr4_User_Data_4v201_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v301 DATA_VA=0x6f4000178000
attr_data {
	Name = .Thr4_User_Data_4v301 ,
	VA = 0x6f4000178000 ,/* 0x6f4000179fc0 */
	RA = 0x00c012c000 ,
	PA = 0x00c012c000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0e0000 ,
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
	/* DTTE_TAG_DATA = 00006f4000178000 80000000c012c440 */
	end_label   = Thr4_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v301_data_begin
Thr4_User_Data_4v301_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v003 TEXT_VA=0x6f400008c000
attr_text {
	Name = .Thr4_User_Text_4v003 ,
	VA = 0x6f400008c000 ,/* 0x6f400008dfc0 */
	RA = 0x00c01c2000 ,
	PA = 0x00c01c2000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00006f400008d0cb 80000000c01c2080 */
	end_label   = Thr4_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v003_text_begin
Thr4_User_Text_4v003_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr4_User_Text_4v003_exit
	nop
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x060, %i7
	LOAD_DDATA_IN
	.word	0xc476e0e0
	.word	0xc02aa8ce
	.word	0xd45ee0c0
	.word	0xfe42a5b8
	.word	0xda75a080
	.word	0xc035a53c
	.word	0xf65da038
	.word	0x1000000
	or	%g0, 0x169, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcd89000
	.word	0xfe45aa8c
	.word	0x1000000
	.word	0xbe160000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0xa0, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x02e, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x028, %i7
	LOAD_DDATA_IN
	ACCESS_DTSB_PTR
	.word	0xf658a038
	DDEMAP_SCTX
	.word	0xfe4da289
	.word	0xfcdd9000
	.word	0xfcdc5060
	.word	0xc022a130
	.word	0xd472a098
	.word	0xc030a188
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4dace0
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v003_exit:
	EXIT_GOOD
Thr4_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v401 TEXT_VA=0x7000006b0000
attr_text {
	Name = .Thr4_User_Text_4v401 ,
	VA = 0x7000006b0000 ,/* 0x7000006bffc0 */
	RA = 0x03f0620000 ,
	PA = 0x4ff0620000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr4_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00007000006b0000 8000004ff0620081 */
	end_label   = Thr4_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v401_text_begin
Thr4_User_Text_4v401_text_begin:
	wrpr	0, %gl
	P_ACCESS_DTSB_PTR
	.word	0xfc9ed100
	.word	0xfcda9000
	P_DDEMAP_PCTX
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x01a, %i7
	P_LOAD_IDATA_IN
	.word	0xcc59a018
	.word	0xfcda8300
	.word	0xe39c1e00
	.word	0x1000000
	.word	0xbe160000
	P_IDEMAP_PAGE
	.word	0xbe842098
	.word	0xd4dfd000
thr4_MMU_ASI_PRIMARY_258:
	.word	0x87802080
	.word	0xe0f120e0
	.word	0x1000000
	.word	0xbe134000
	P_IDEMAP_RPAGE
thr4_MMU_ASI_BLK_P_259:
	.word	0x878020f0
	.word	0xe1bc2200
	.word	0x1000000
	or	%g0, 0x674, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcded000
	.word	0xfc9e04e0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v401_exit:
	EXIT_GOOD
Thr4_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v004 TEXT_VA=0x700000510000
attr_text {
	Name = .Thr4_User_Text_4v004 ,
	VA = 0x700000510000 ,/* 0x70000051ffc0 */
	RA = 0x03f03e0000 ,
	PA = 0x4ff03e0000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000700000510ee3 8000004ff03e0081 */
	end_label   = Thr4_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v004_text_begin
Thr4_User_Text_4v004_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x88, %i7
	P_ITLB_TAG_READ
	.word	0xbe174000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v004_exit:
	EXIT_GOOD
Thr4_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v102 DATA_VA=0x6f4000022000
attr_data {
	Name = .Thr4_User_Data_4v102 ,
	VA = 0x6f4000022000 ,/* 0x6f4000023fc0 */
	RA = 0x00c019c000 ,
	PA = 0x00c019c000 ,
	TTE_Context = 0x0ee3 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 00006f40000230cb 80000000c019c040 */
	end_label   = Thr4_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v102_data_begin
Thr4_User_Data_4v102_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v202 DATA_VA=0x71001fc00000
attr_data {
	Name = .Thr4_User_Data_4v202 ,
	VA = 0x71001fc00000 ,/* 0x71001fffffc0 */
	RA = 0x01cac00000 ,
	PA = 0x4dcac00000 ,
	TTE_Context = 0x1cf3 ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a0000 ,
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
	/* DTTE_TAG_DATA = 000071001fc01cf3 8000004dcac00443 */
	end_label   = Thr4_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v202_data_begin
Thr4_User_Data_4v202_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v302 DATA_VA=0x700000180000
attr_data {
	Name = .Thr4_User_Data_4v302 ,
	VA = 0x700000180000 ,/* 0x70000018ffc0 */
	RA = 0x03f0fd0000 ,
	PA = 0x4ff0fd0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0e0000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000700000180000 8000004ff0fd0441 */
	end_label   = Thr4_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v302_data_begin
Thr4_User_Data_4v302_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v005 TEXT_VA=0x6f4000162000
attr_text {
	Name = .Thr4_User_Text_4v005 ,
	VA = 0x6f4000162000 ,/* 0x6f4000163fc0 */
	RA = 0x00c0150000 ,
	PA = 0x00c0150000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00006f40001630cb 80000000c0150080 */
	end_label   = Thr4_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v005_text_begin
Thr4_User_Text_4v005_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr4_User_Text_4v005_exit
	nop
	.word	0x1000000
	or	%g0, 0x508, %i7
	READ_DDATA_ACCESS
	.word	0xf076e018
	.word	0xc026ea84
	.word	0x1000000
	or	%g0, 0x18a, %i7
	LOAD_IDATA_ACCESS
	.word	0xec5da0e0
	.word	0x1000000
	.word	0xbe158000
	IDEMAP_RPAGE
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x520, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xdc712028
	.word	0xc0712130
	.word	0xc032a806
	.word	0xbe86e068
	.word	0xc4dfd000
	.word	0xfe4ee38c
	.word	0xf476e0b8
	.word	0xc035a900
	.word	0xfc9a9c40
	TOGGLE_LSU_IM
	DDEMAP_NCTX
	.word	0xfe442018
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xfe5da4d8
	.word	0xf670a0f0
	.word	0xc02aa95a
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc022a8fc
	.word	0xde712080
	.word	0xc02c2751
	.word	0xe058a008
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4ee82f
	.word	0xc075a340
	.word	0xfc995c60
	.word	0xfcdd9000
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x490, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_IM
	nop
	nop
	.word	0xbe80a098
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x100, %i7
	DTLB_TAG_READ
	.word	0xc02aa867
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02da6b0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v005_exit:
	EXIT_GOOD
Thr4_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v402 TEXT_VA=0x700000440000
attr_text {
	Name = .Thr4_User_Text_4v402 ,
	VA = 0x700000440000 ,/* 0x70000044ffc0 */
	RA = 0x03f03f0000 ,
	PA = 0x4ff03f0000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr4_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000700000440000 8000004ff03f0081 */
	end_label   = Thr4_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v402_text_begin
Thr4_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xfcdd8200
	.word	0xd0732028
	.word	0xc0372df8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_PRIMARY_260:
	.word	0x87802080
	.word	0xdaf2a060
	.word	0xfe562864
	.word	0x1000000
	or	%g0, 0x708, %i7
	P_READ_DDATA_ACCESS
thr4_MMU_ASI_AS_IF_USER_PRIMARY_261:
	.word	0x87802010
	.word	0xe4f5a0c8
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_IDEMAP_PCTX
	.word	0xfcdc1000
	P_IDEMAP_PCTX
	.word	0xfcda9100
	P_ACCESS_ITSB_PTR
	.word	0xc3995f20
	.word	0xc02cadc3
	.word	0xbe842098
	.word	0xd4dfd000
	P_DDEMAP_ALL_RPAGES
	P_IDEMAP_ALL
	.word	0xfcdc0200
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xd9, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v402_exit:
	EXIT_GOOD
Thr4_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v006 TEXT_VA=0x6f40000b6000
attr_text {
	Name = .Thr4_User_Text_4v006 ,
	VA = 0x6f40000b6000 ,/* 0x6f40000b7fc0 */
	RA = 0x00c00e2000 ,
	PA = 0x00c00e2000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00006f40000b70cb 80000000c00e2080 */
	end_label   = Thr4_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v006_text_begin
Thr4_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0xbe816010
	.word	0xcadfd020
	P_IDEMAP_ALL
	.word	0xfcdd8200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_PCTX
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x042, %i7
	P_LOAD_DDATA_IN
	P_ACCESS_ITSB_PTR
thr4_MMU_ASI_REAL_IO_262:
	.word	0x87802015
	.word	0xcaf16070
	.word	0xfcdc0200
	.word	0xbe812098
	.word	0xe0dfc200
	.word	0xc19943e0
	.word	0xe05ee068
thr4_MMU_ASI_SECONDARY_LITTLE_263:
	.word	0x87802089
	.word	0xf4b96c10
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x560, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	nop
	nop
	nop
	nop
	P_IDEMAP_PCTX
	.word	0xfe50a392
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v006_exit:
	EXIT_GOOD
Thr4_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v103 DATA_VA=0x6f40001fa000
attr_data {
	Name = .Thr4_User_Data_4v103 ,
	VA = 0x6f40001fa000 ,/* 0x6f40001fbfc0 */
	RA = 0x00c0016000 ,
	PA = 0x00c0016000 ,
	TTE_Context = 0x0ee3 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 00006f40001fb0cb 80000000c0016040 */
	end_label   = Thr4_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v103_data_begin
Thr4_User_Data_4v103_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v203 DATA_VA=0x720b60000000
attr_data {
	Name = .Thr4_User_Data_4v203 ,
	VA = 0x720b60000000 ,/* 0x720b6fffffc0 */
	RA = 0x0240000000 ,
	PA = 0x4e40000000 ,
	TTE_Context = 0x1cf3 ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a0000 ,
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
	/* DTTE_TAG_DATA = 0000720b60001cf3 8000004e40000445 */
	end_label   = Thr4_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v203_data_begin
Thr4_User_Data_4v203_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v303 DATA_VA=0x71002c800000
attr_data {
	Name = .Thr4_User_Data_4v303 ,
	VA = 0x71002c800000 ,/* 0x71002cbfffc0 */
	RA = 0x01ccc00000 ,
	PA = 0x4dccc00000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0e0000 ,
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
	/* DTTE_TAG_DATA = 000071002c800000 8000004dccc00443 */
	end_label   = Thr4_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v303_data_begin
Thr4_User_Data_4v303_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v007 TEXT_VA=0x6f40001cc000
attr_text {
	Name = .Thr4_User_Text_4v007 ,
	VA = 0x6f40001cc000 ,/* 0x6f40001cdfc0 */
	RA = 0x00c005c000 ,
	PA = 0x00c005c000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00006f40001cd0cb 80000000c005c080 */
	end_label   = Thr4_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v007_text_begin
Thr4_User_Text_4v007_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr4_User_Text_4v007_exit
	nop
	.word	0x1000000
	or	%g0, 0x138, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x03a, %i7
	LOAD_IDATA_IN
	.word	0xc025af50
	.word	0xbe842120
	.word	0xc4dfd000
	.word	0x1000000
	or	%g0, 0x520, %i7
	READ_IDATA_ACCESS
	ACCESS_DTSB_PTR
	IDEMAP_ALL
	.word	0xe45aa0a8
	.word	0xfe4dac2d
	.word	0xc0242f44
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5da4e0
	.word	0xfcdc1000
	.word	0xfe56e090
	.word	0x1000000
	or	%g0, 0xc0, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd075a028
	.word	0xc0742c68
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xec592068
	.word	0x1000000
	or	%g0, 0x560, %i7
	READ_DDATA_ACCESS
	.word	0xbe85a0c0
	.word	0xe0dfd000
	.word	0xec5da0c0
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xbe82a110
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x5ae, %i7
	LOAD_IDATA_ACCESS
	.word	0xc02ee213
	.word	0x1000000
	or	%g0, 0x150, %i7
	DTLB_TAG_READ
	.word	0xfcded000
	.word	0xf272a0b8
	.word	0xc070a950
	.word	0xc032a3ce
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe5c27c8
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v007_exit:
	EXIT_GOOD
Thr4_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v008 TEXT_VA=0x700000390000
attr_text {
	Name = .Thr4_User_Text_4v008 ,
	VA = 0x700000390000 ,/* 0x70000039ffc0 */
	RA = 0x03f01b0000 ,
	PA = 0x4ff01b0000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000700000390ee3 8000004ff01b0081 */
	end_label   = Thr4_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v008_text_begin
Thr4_User_Text_4v008_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe10c000
	P_DDEMAP_RPAGE
	P_DDEMAP_PCTX
	.word	0xbe85e010
	.word	0xeedfd060
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	P_ITLB_TAG_READ
	P_TOGGLE_LSU_DM
	.word	0xd45c2038
	P_DDEMAP_NCTX
	.word	0xfcdc1040
thr4_MMU_ASI_BLK_SL_264:
	.word	0x878020f9
	.word	0xe1bdeb40
	.word	0x1000000
	or	%g0, 0xa0, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x498, %i7
	P_ITLB_TAG_READ
	nop
	nop
	nop
	P_DDEMAP_ALL_PAGES
	.word	0xfcded000
	P_TOGGLE_LSU_IM
thr4_MMU_ASI_PRIMARY_LITTLE_265:
	.word	0x87802088
	.word	0xd4baa5a0
	.word	0xf67420e0
	.word	0xc020a6a4
thr4_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_266:
	.word	0x87802018
	.word	0xd6f42010
	.word	0x1000000
	or	%g0, 0x540, %i7
	P_DTLB_TAG_READ
	.word	0xfcd90380
thr4_MMU_ASI_PRIMARY_267:
	.word	0x87802080
	.word	0xcaf2a010
	.word	0xfc9b05e0
	.word	0xfe5c2ae8
	.word	0xc020abdc
	nop
	nop
	nop
	nop
thr4_MMU_ASI_PRIMARY_268:
	.word	0x87802080
	.word	0xcaf0a010
	.word	0x1000000
	.word	0xbe16c000
	P_IDEMAP_PAGE
	P_TOGGLE_LSU_DM
	P_TOGGLE_LSU_DM
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v008_exit:
	EXIT_GOOD
Thr4_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v104 DATA_VA=0x7000008d0000
attr_data {
	Name = .Thr4_User_Data_4v104 ,
	VA = 0x7000008d0000 ,/* 0x7000008dffc0 */
	RA = 0x03f0820000 ,
	PA = 0x4ff0820000 ,
	TTE_Context = 0x0ee3 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 00007000008d0ee3 8000004ff0820041 */
	end_label   = Thr4_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v104_data_begin
Thr4_User_Data_4v104_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v304 DATA_VA=0x6f4000068000
attr_data {
	Name = .Thr4_User_Data_4v304 ,
	VA = 0x6f4000068000 ,/* 0x6f4000069fc0 */
	RA = 0x00c0130000 ,
	PA = 0x00c0130000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0e0000 ,
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
	/* DTTE_TAG_DATA = 00006f4000068000 80000000c0130440 */
	end_label   = Thr4_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v304_data_begin
Thr4_User_Data_4v304_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v009 TEXT_VA=0x700000630000
attr_text {
	Name = .Thr4_User_Text_4v009 ,
	VA = 0x700000630000 ,/* 0x70000063ffc0 */
	RA = 0x03f0340000 ,
	PA = 0x4ff0340000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 0000700000630ee3 8000004ff0340081 */
	end_label   = Thr4_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v009_text_begin
Thr4_User_Text_4v009_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr4_User_Text_4v009_exit
	nop
	IDEMAP_NCTX
	.word	0xfcded000
	.word	0xc032a5d2
	DDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe50aa58
	.word	0xda72a050
	.word	0xc02aa195
	.word	0xfcda9000
	TOGGLE_LSU_IM
	.word	0xc02da78f
	.word	0x1000000
	or	%g0, 0x43c, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_PAGE
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	ITLB_TAG_READ
	IDEMAP_ALL_PAGES
	.word	0xbe85a0e0
	.word	0xe0dfd000
	.word	0xda70a030
	.word	0xc036ed92
	DDEMAP_ALL_RPAGES
	.word	0xf2712128
	.word	0xc026e1ac
	.word	0x1000000
	or	%g0, 0x520, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x045, %i7
	LOAD_IDATA_IN
	.word	0xbe154000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0xbe85a098
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe45da018
thr4_MMU_ASI_PRIMARY_269:
	.word	0x87802080
	.word	0xc4f5a100
	ACCESS_DTSB_PTR
	ACCESS_DTSB_PTR
thr4_MMU_ASI_SECONDARY_LITTLE_270:
	.word	0x87802089
	.word	0xc4b966b0
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe138000
	DDEMAP_RPAGE
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xec76e038
	.word	0xc03125b8
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5ee990
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v009_exit:
	EXIT_GOOD
Thr4_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00a TEXT_VA=0x6f4000060000
attr_text {
	Name = .Thr4_User_Text_4v00a ,
	VA = 0x6f4000060000 ,/* 0x6f4000061fc0 */
	RA = 0x00c0134000 ,
	PA = 0x00c0134000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00006f40000610cb 80000000c0134080 */
	end_label   = Thr4_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00a_text_begin
Thr4_User_Text_4v00a_text_begin:
	wrpr	0, %gl
thr4_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_271:
	.word	0x8780202b
	.word	0xd4baea20
	.word	0x1000000
	.word	0xbe10c000
	P_DDEMAP_RPAGE
	.word	0xbe80a038
	.word	0xecdfd000
thr4_MMU_ASI_BLK_P_272:
	.word	0x878020f0
	.word	0xe3bc2100
	.word	0xbe82a110
	.word	0xe0dfc200
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x670, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_PCTX
	.word	0xc075a188
thr4_MMU_ASI_BLK_P_273:
	.word	0x878020f0
	.word	0xc1baae40
	.word	0xd4592008
	.word	0x1000000
	or	%g0, 0x10, %i7
	P_READ_IDATA_ACCESS
thr4_MMU_ASI_AS_IF_USER_PRIMARY_274:
	.word	0x87802010
	.word	0xcaf0a070
thr4_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_275:
	.word	0x8780202a
	.word	0xf8bc2410
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x190, %i7
	P_READ_IDATA_ACCESS
	nop
	nop
	.word	0xc4592068
	.word	0xfcded000
	.word	0xfe5c2fa0
thr4_MMU_ASI_BLK_P_276:
	.word	0x878020f0
	.word	0xe3b8a4c0
	.word	0xfe492164
	P_DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x410, %i7
	P_DTLB_TAG_READ
	.word	0xfc9f05e0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda8300
	P_IDEMAP_ALL
	P_IDEMAP_ALL
	P_IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x06b, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x1b6, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xe19942e0
	.word	0xbe822020
	.word	0xf2dfc280
	.word	0x1000000
	or	%g0, 0x574, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x03e, %i7
	P_LOAD_IDATA_IN
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v00a_exit:
	EXIT_GOOD
Thr4_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v105 DATA_VA=0x6f4000044000
attr_data {
	Name = .Thr4_User_Data_4v105 ,
	VA = 0x6f4000044000 ,/* 0x6f4000045fc0 */
	RA = 0x00c0154000 ,
	PA = 0x00c0154000 ,
	TTE_Context = 0x0ee3 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 00006f40000450cb 80000000c0154040 */
	end_label   = Thr4_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v105_data_begin
Thr4_User_Data_4v105_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00b TEXT_VA=0x6f40000c2000
attr_text {
	Name = .Thr4_User_Text_4v00b ,
	VA = 0x6f40000c2000 ,/* 0x6f40000c3fc0 */
	RA = 0x00c019e000 ,
	PA = 0x00c019e000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00006f40000c30cb 80000000c019e080 */
	end_label   = Thr4_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00b_text_begin
Thr4_User_Text_4v00b_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr4_User_Text_4v00b_exit
	nop
	.word	0xd65c2040
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc875a038
	.word	0xc02da8d6
	.word	0xfe5daab0
	.word	0xcc5c2018
	.word	0x1000000
	or	%g0, 0x564, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xe8, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x06a, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe130000
	IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	.word	0xd476e0c0
	.word	0xc02aa3d3
	nop
	.word	0x1000000
	or	%g0, 0x5a1, %i7
	LOAD_IDATA_ACCESS
	.word	0xce72a0f8
	.word	0xc020a9d0
	IDEMAP_ALL_RPAGES
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe168000
	GOTO_SUPERVISOR0
thr4_MMU_ASI_SECONDARY_LITTLE_277:
	.word	0x87802089
	.word	0xdcb96130
	.word	0xfe4dad33
	.word	0xda742118
	.word	0xc02ee130
	.word	0xc075a5b0
	.word	0xbe80a098
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x044, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_SECONDARY_LITTLE_278:
	.word	0x87802089
	.word	0xf0bae820
	.word	0xfcd91000
thr4_MMU_ASI_SECONDARY_LITTLE_279:
	.word	0x87802089
	.word	0xf4bdebe0
	.word	0x1000000
	or	%g0, 0x14a, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe100000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x072, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x482, %i7
	LOAD_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe46ec4c
	.word	0xbe80a0e0
	.word	0xe0dfd000
	.word	0xe19c1f00
	.word	0xfcdad060
	.word	0xbe86e098
	.word	0xc4dfd000
	.word	0xc02c292c
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x022, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x146, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe42ab10
	.word	0xbe842098
	.word	0xd4dfd000
thr4_MMU_ASI_PRIMARY_280:
	.word	0x87802080
	.word	0xf8f42078
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x081, %i7
	LOAD_IDATA_IN
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe17c000
	DDEMAP_RPAGE
	nop
	nop
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0x069, %i7
	LOAD_DDATA_IN
	.word	0xfe45a764
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc85ee068
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe5c20b0
	.word	0x81c6a000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00b_exit:
	EXIT_GOOD
Thr4_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v106 DATA_VA=0x71001c000000
attr_data {
	Name = .Thr4_User_Data_4v106 ,
	VA = 0x71001c000000 ,/* 0x71001c3fffc0 */
	RA = 0x01c0c00000 ,
	PA = 0x4dc0c00000 ,
	TTE_Context = 0x0ee3 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 000071001c000ee3 8000004dc0c00043 */
	end_label   = Thr4_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v106_data_begin
Thr4_User_Data_4v106_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00c TEXT_VA=0x700000f60000
attr_text {
	Name = .Thr4_User_Text_4v00c ,
	VA = 0x700000f60000 ,/* 0x700000f6ffc0 */
	RA = 0x03f00e0000 ,
	PA = 0x4ff00e0000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 0000700000f60ee3 8000004ff00e0081 */
	end_label   = Thr4_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00c_text_begin
Thr4_User_Text_4v00c_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr4_User_Text_4v00c_exit
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe8742028
	.word	0xc076e410
	TOGGLE_LSU_IM
	ACCESS_DTSB_PTR
	.word	0xe0592110
	nop
	nop
	nop
	nop
	nop
	.word	0xfe55a6ac
	ACCESS_ITSB_PTR
	.word	0xfe46e6a8
	ACCESS_ITSB_PTR
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x546, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe160000
	IDEMAP_PAGE
	.word	0xfcda9000
	.word	0x1000000
	.word	0xbe154000
	IDEMAP_PAGE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe82a098
	.word	0xc8dfd000
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x770, %i7
	READ_DDATA_ACCESS
thr4_MMU_ASI_SECONDARY_281:
	.word	0x87802081
	.word	0xc0b96e30
	.word	0xc022ae98
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xdc742028
	.word	0xc036e1ec
	.word	0x81c36000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00c_exit:
	EXIT_GOOD
Thr4_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v107 DATA_VA=0x720ab0000000
attr_data {
	Name = .Thr4_User_Data_4v107 ,
	VA = 0x720ab0000000 ,/* 0x720abfffffc0 */
	RA = 0x0050000000 ,
	PA = 0x4850000000 ,
	TTE_Context = 0x0ee3 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 0000720ab0000ee3 8000004850000045 */
	end_label   = Thr4_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v107_data_begin
Thr4_User_Data_4v107_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00d TEXT_VA=0x720b20000000
attr_text {
	Name = .Thr4_User_Text_4v00d ,
	VA = 0x720b20000000 ,/* 0x720b2fffffc0 */
	RA = 0x02a0000000 ,
	PA = 0x4ea0000000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 0000720b20000ee3 8000004ea0000085 */
	end_label   = Thr4_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00d_text_begin
Thr4_User_Text_4v00d_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr4_User_Text_4v00d_exit
	nop
	ACCESS_DTSB_PTR
	.word	0xfe42a124
	.word	0xc02daf33
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x41, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x298, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	.word	0xc0242888
	.word	0xf272a0d0
	.word	0xc035aa70
	IDEMAP_NCTX
	IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL
	.word	0xbe120000
	GOTO_SUPERVISOR1
	TOGGLE_LSU_IM
	.word	0xc075a720
	.word	0xfe5ee4d8
	.word	0x1000000
	or	%g0, 0xc7, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe5c2eb0
	.word	0x1000000
	or	%g0, 0x738, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_IM
	.word	0xfe4ee59c
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x342, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe842038
	.word	0xecdfd000
	DDEMAP_ALL_RPAGES
	.word	0xf0592048
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xe05da110
	.word	0x81c66000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00d_exit:
	EXIT_GOOD
Thr4_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v108 DATA_VA=0x710025800000
attr_data {
	Name = .Thr4_User_Data_4v108 ,
	VA = 0x710025800000 ,/* 0x710025bfffc0 */
	RA = 0x01c7400000 ,
	PA = 0x4dc7400000 ,
	TTE_Context = 0x0ee3 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 0000710025800ee3 8000004dc7400043 */
	end_label   = Thr4_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v108_data_begin
Thr4_User_Data_4v108_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00e TEXT_VA=0x71002a800000
attr_text {
	Name = .Thr4_User_Text_4v00e ,
	VA = 0x71002a800000 ,/* 0x71002abfffc0 */
	RA = 0x01cd000000 ,
	PA = 0x4dcd000000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 000071002a800ee3 8000004dcd000083 */
	end_label   = Thr4_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00e_text_begin
Thr4_User_Text_4v00e_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr4_User_Text_4v00e_exit
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_PCTX
	.word	0xfe48a12b
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x750, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x188, %i7
	READ_IDATA_ACCESS
	.word	0xc45ee038
	nop
	nop
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
	.word	0xec5ee098
	.word	0xbe816010
	.word	0xc39fde20
	.word	0xc475a068
	.word	0xc02da130
	.word	0xfe5ee758
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	IDEMAP_ALL_PAGES
	.word	0xf65da098
	.word	0x1000000
	or	%g0, 0x032, %i7
	LOAD_DDATA_IN
	.word	0xfcddd160
	.word	0xc02aa39a
	DDEMAP_ALL
thr4_MMU_ASI_PRIMARY_LITTLE_282:
	.word	0x87802088
	.word	0xf0b92cc0
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	.word	0x1000000
	or	%g0, 0x38, %i7
	DTLB_TAG_READ
	.word	0xfe5aa450
thr4_MMU_ASI_PRIMARY_283:
	.word	0x87802080
	.word	0xe6f0a118
	DDEMAP_ALL_RPAGES
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xee72a010
	.word	0xc02923b4
	.word	0xc02aa7b5
	.word	0xfe48a2a7
	DDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xee592070
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x096, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xd1, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x530, %i7
	READ_IDATA_ACCESS
	nop
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	ITLB_TAG_READ
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xf05aa0a8
	.word	0x81c26000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00e_exit:
	EXIT_GOOD
Thr4_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v109 DATA_VA=0x700000580000
attr_data {
	Name = .Thr4_User_Data_4v109 ,
	VA = 0x700000580000 ,/* 0x70000058ffc0 */
	RA = 0x03f0570000 ,
	PA = 0x4ff0570000 ,
	TTE_Context = 0x0ee3 ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 0000700000580ee3 8000004ff0570041 */
	end_label   = Thr4_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v109_data_begin
Thr4_User_Data_4v109_data_begin:
	.xword	0x700000f10000
	.xword	0x6f400013e000
	.xword	0x710027c00000
	.xword	0x700000650000
	.xword	0x6f40000a0000
	.xword	0x6f4000180000
	.xword	0x700000700000
	.xword	0x710001800000
	.xword	0x6f4000090000
	.xword	0x6f4000178000
	.xword	0x6f400008c000
	.xword	0x7000006b0000
	.xword	0x700000510000
	.xword	0x6f4000022000
	.xword	0x71001fc00000
	.xword	0x700000180000
	.xword	0x6f4000162000
	.xword	0x700000440000
	.xword	0x6f40000b6000
	.xword	0x6f40001fa000
	.xword	0x720b60000000
	.xword	0x71002c800000
	.xword	0x6f40001cc000
	.xword	0x700000390000
	.xword	0x7000008d0000
	.xword	0x6f4000068000
	.xword	0x700000630000
	.xword	0x6f4000060000
	.xword	0x6f4000044000
	.xword	0x6f40000c2000
	.xword	0x71001c000000
	.xword	0x700000f60000
	.xword	0x720ab0000000
	.xword	0x720b20000000
	.xword	0x710025800000
	.xword	0x71002a800000
	.xword	0x700000580000
	.xword	0x710015000000
Thr4_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00f TEXT_VA=0x710015000000
attr_text {
	Name = .Thr4_User_Text_4v00f ,
	VA = 0x710015000000 ,/* 0x7100153fffc0 */
	RA = 0x01cdc00000 ,
	PA = 0x4dcdc00000 ,
	TTE_Context = 0x0ee3 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 0000710015000ee3 8000004dcdc00083 */
	end_label   = Thr4_User_Text_4v00f_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00f_text_begin
Thr4_User_Text_4v00f_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr4_User_Text_4v00f_exit
	nop
	.word	0xc036edf4
	IDEMAP_NCTX
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0xfe4425bc
	nop
	.word	0x1000000
	.word	0xbe154000
	IDEMAP_RPAGE
thr4_MMU_ASI_PRIMARY_284:
	.word	0x87802080
	.word	0xe0bdad80
	.word	0xf2742118
	.word	0xc0742a00
	.word	0xbe842008
	.word	0xf6dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc85c2098
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00f_exit:
	EXIT_GOOD
Thr4_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x75000dc00000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	VA = 0x75000dc00000 ,/* 0x75000dffffc0 */
	RA = 0x01de400000 ,
	PA = 0x01de400000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000075000dc00a49 80000001de400083 */
	end_label   = Thr5_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr5_user_code_entry
Thr5_user_code_entry:
	setx	0x740000980000, %g1, %g2
	or	%g0, 12, %g1
	.word	0xc658a000
	.word	0xc858a008
	.word	0xca58a010
	.word	0xcc58a018
	.word	0xce58a020
	.word	0xd058a028
	.word	0xd258a030
	.word	0xd458a038
	.word	0xd658a040
	.word	0xd858a048
	.word	0xda58a050
	.word	0xdc58a058
	.word	0xde58a060
	.word	0xe058a068
	.word	0xe258a070
	.word	0xe458a078
	.word	0xe658a080
	.word	0xe858a088
	.word	0xea58a090
	.word	0xec58a098
	.word	0xee58a0a0
	.word	0xf058a0a8
	.word	0xf258a0b0
	.word	0xf458a0b8
	.word	0xf658a0c0
	.word	0xf858a0c8
	.word	0xfa58a0d0
	.word	0xfc58a0d8
.global Thr5_User_Text_4v000_text_begin
Thr5_User_Text_4v000_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v000_exit
	nop
	DDEMAP_SCTX
	IDEMAP_NCTX
	.word	0xd65c2070
	.word	0xfcdc1000
	.word	0xd47420b8
	.word	0xc034236a
	.word	0x1000000
	or	%g0, 0x420, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x063, %i7
	LOAD_DDATA_IN
	ACCESS_DTSB_PTR
	.word	0xec5ea120
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	DDEMAP_ALL
	.word	0xbe85a100
	.word	0xd4dfd000
	.word	0xfc9c5120
	.word	0xfe4daf9e
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x60, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0xfe5aa6c0
	DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe124000
	IDEMAP_PAGE
	.word	0xc0342b0e
	.word	0xf0776138
	.word	0xc0242dcc
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	TOGGLE_LSU_DM
thr5_MMU_ASI_PRIMARY_285:
	.word	0x87802080
	.word	0xe6f2a0c0
	nop
	nop
	nop
	nop
thr5_MMU_ASI_PRIMARY_286:
	.word	0x87802080
	.word	0xe0f5a068
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x04a, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_IM
	.word	0xfe5aaff8
	.word	0xfcd95020
	.word	0xec742068
	.word	0xc028aa01
	.word	0xc02ea582
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xf475a120
	.word	0xc0742228
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v000_exit:
	EXIT_GOOD
Thr5_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v100 DATA_VA=0x740000980000
attr_data {
	Name = .Thr5_User_Data_4v100 ,
	VA = 0x740000980000 ,/* 0x74000098ffc0 */
	RA = 0x0010f30000 ,
	PA = 0x0010f30000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 0000740000980a49 8000000010f30441 */
	end_label   = Thr5_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v100_data_begin
Thr5_User_Data_4v100_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v200 DATA_VA=0x7350000b4000
attr_data {
	Name = .Thr5_User_Data_4v200 ,
	VA = 0x7350000b4000 ,/* 0x7350000b5fc0 */
	RA = 0x00d01f0000 ,
	PA = 0x00d01f0000 ,
	TTE_Context = 0x1b71 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0d0000 ,
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
	/* DTTE_TAG_DATA = 00007350000b5b71 80000000d01f0040 */
	end_label   = Thr5_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v200_data_begin
Thr5_User_Data_4v200_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v300 DATA_VA=0x760190000000
attr_data {
	Name = .Thr5_User_Data_4v300 ,
	VA = 0x760190000000 ,/* 0x76019fffffc0 */
	RA = 0x0250000000 ,
	PA = 0x5e50000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f0000 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 0000760190000000 8000005e50000045 */
	end_label   = Thr5_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v300_data_begin
Thr5_User_Data_4v300_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v001 TEXT_VA=0x740000360000
attr_text {
	Name = .Thr5_User_Text_4v001 ,
	VA = 0x740000360000 ,/* 0x74000036ffc0 */
	RA = 0x0010ec0000 ,
	PA = 0x0010ec0000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000740000360a49 8000000010ec0081 */
	end_label   = Thr5_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v001_text_begin
Thr5_User_Text_4v001_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v001_exit
	nop
	DDEMAP_SCTX
	ACCESS_ITSB_PTR
	.word	0xfa5c2130
	.word	0x1000000
	or	%g0, 0x078, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe128000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe512496
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x188, %i7
	ITLB_TAG_READ
	DDEMAP_ALL
	.word	0xc032aae4
	.word	0x1000000
	or	%g0, 0x190, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe05aa098
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfcdd9040
	.word	0xe475a018
	.word	0xc022a634
	.word	0xfe52a87a
	.word	0x1000000
	or	%g0, 0x01a, %i7
	LOAD_IDATA_IN
	.word	0xbe82a100
	.word	0xf4dfd040
	.word	0x1000000
	or	%g0, 0x547, %i7
	LOAD_DDATA_ACCESS
thr5_MMU_ASI_PRIMARY_287:
	.word	0x87802080
	.word	0xecf5a008
	.word	0xc0212e38
	TOGGLE_LSU_IM
	.word	0xfcdad020
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe130000
	IDEMAP_RPAGE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5f6440
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v001_exit:
	EXIT_GOOD
Thr5_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v400 TEXT_VA=0x75002d400000
attr_text {
	Name = .Thr5_User_Text_4v400 ,
	VA = 0x75002d400000 ,/* 0x75002d7fffc0 */
	RA = 0x01da400000 ,
	PA = 0x01da400000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr5_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x040000 ,
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
	/* ITTE_TAG_DATA = 000075002d400000 80000001da400083 */
	end_label   = Thr5_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v400_text_begin
Thr5_User_Text_4v400_text_begin:
	wrpr	0, %gl
thr5_MMU_ASI_PRIMARY_LITTLE_288:
	.word	0x87802088
	.word	0xe8f42028
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x122, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe842098
	.word	0xecdfc200
thr5_MMU_ASI_BLK_COMMIT_P_289:
	.word	0x878020e0
	.word	0xe1bc2d40
	.word	0xfa59a038
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	P_READ_DDATA_ACCESS
	P_TOGGLE_LSU_IM
	nop
	.word	0xbe80a008
	.word	0xe0dfd000
	P_DDEMAP_ALL
	.word	0xe459a018
thr5_MMU_ASI_PRIMARY_LITTLE_290:
	.word	0x87802088
	.word	0xd2f6a0d8
	.word	0x1000000
	or	%g0, 0x046, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x7c0, %i7
	P_DTLB_TAG_READ
	.word	0xfe51a4fe
	P_TOGGLE_LSU_DM
	.word	0xbe85a0d0
	.word	0xc8dfc200
	.word	0xfc9dc480
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe842068
	.word	0xf4dfd000
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_291:
	.word	0x87802022
	.word	0xe4bc24f0
	.word	0x1000000
	or	%g0, 0x73d, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v400_exit:
	EXIT_GOOD
Thr5_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v002 TEXT_VA=0x7350001e2000
attr_text {
	Name = .Thr5_User_Text_4v002 ,
	VA = 0x7350001e2000 ,/* 0x7350001e3fc0 */
	RA = 0x00d00aa000 ,
	PA = 0x00d00aa000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00007350001e2a49 80000000d00aa080 */
	end_label   = Thr5_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v002_text_begin
Thr5_User_Text_4v002_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_IM
	.word	0xc0312620
	.word	0x1000000
	.word	0xbe104000
	P_IDEMAP_RPAGE
	.word	0xfcdf5000
	.word	0xfc9e05c0
	.word	0xfcdc1000
	.word	0xbe842098
	.word	0xf4dfd040
	.word	0xfa592130
	.word	0xbe82a100
	.word	0xd4dfc200
	.word	0xc030a4e8
	.word	0x1000000
	or	%g0, 0x15c, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x408, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x430, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x190, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x270, %i7
	P_DTLB_TAG_READ
	.word	0xfcdc0200
	.word	0xfcdf5000
thr5_MMU_ASI_BLK_COMMIT_P_292:
	.word	0x878020e0
	.word	0xe1b8ad80
thr5_MMU_ASI_AS_IF_USER_PRIMARY_293:
	.word	0x87802010
	.word	0xccf2a078
	.word	0x1000000
	or	%g0, 0x4e0, %i7
	P_ITLB_TAG_READ
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xfe4c2ce9
	.word	0xd0742058
	.word	0xc02da51e
	.word	0x1000000
	or	%g0, 0x760, %i7
	P_READ_DDATA_ACCESS
	.word	0xc0242140
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8120b8
	.word	0xc8dfc200
	.word	0xf45aa100
	.word	0x1000000
	or	%g0, 0x3f8, %i7
	P_LOAD_DDATA_ACCESS
thr5_MMU_ASI_BLK_S_294:
	.word	0x878020f1
	.word	0xc3bc61c0
	P_IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x020, %i7
	P_LOAD_IDATA_IN
	.word	0xfcde8200
	.word	0xbe876068
	.word	0xd4dfc200
	P_IDEMAP_ALL_RPAGES
	P_ACCESS_ITSB_PTR
	P_IDEMAP_ALL_PAGES
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v002_exit:
	EXIT_GOOD
Thr5_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v101 DATA_VA=0x7350001a0000
attr_data {
	Name = .Thr5_User_Data_4v101 ,
	VA = 0x7350001a0000 ,/* 0x7350001a1fc0 */
	RA = 0x00d01f2000 ,
	PA = 0x00d01f2000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 00007350001a0a49 80000000d01f2440 */
	end_label   = Thr5_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v101_data_begin
Thr5_User_Data_4v101_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v201 DATA_VA=0x75000fc00000
attr_data {
	Name = .Thr5_User_Data_4v201 ,
	VA = 0x75000fc00000 ,/* 0x75000fffffc0 */
	RA = 0x01d3000000 ,
	PA = 0x01d3000000 ,
	TTE_Context = 0x1b71 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0d0000 ,
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
	/* DTTE_TAG_DATA = 000075000fc01b71 80000001d3000043 */
	end_label   = Thr5_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v201_data_begin
Thr5_User_Data_4v201_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v301 DATA_VA=0x740000400000
attr_data {
	Name = .Thr5_User_Data_4v301 ,
	VA = 0x740000400000 ,/* 0x74000040ffc0 */
	RA = 0x0010440000 ,
	PA = 0x5010440000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f0000 ,
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
	/* DTTE_TAG_DATA = 0000740000400000 8000005010440041 */
	end_label   = Thr5_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v301_data_begin
Thr5_User_Data_4v301_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v003 TEXT_VA=0x75003bc00000
attr_text {
	Name = .Thr5_User_Text_4v003 ,
	VA = 0x75003bc00000 ,/* 0x75003bffffc0 */
	RA = 0x01d0000000 ,
	PA = 0x01d0000000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000075003bc00a49 80000001d0000083 */
	end_label   = Thr5_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v003_text_begin
Thr5_User_Text_4v003_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v003_exit
	nop
	nop
	nop
	nop
	nop
	.word	0xc0292b09
	.word	0x1000000
	or	%g0, 0x238, %i7
	READ_DDATA_ACCESS
thr5_MMU_ASI_PRIMARY_LITTLE_295:
	.word	0x87802088
	.word	0xecf5a068
thr5_MMU_ASI_PRIMARY_296:
	.word	0x87802080
	.word	0xc8f5a008
	DDEMAP_SCTX
	.word	0xfe5aa960
	.word	0xbe85a0b8
	.word	0xecdfd000
	.word	0xc02f6140
	.word	0x1000000
	.word	0xbe164000
	IDEMAP_PAGE
	.word	0xc0242b2c
	.word	0xd45aa0d0
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	nop
	.word	0x1000000
	or	%g0, 0xe2, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x0b4, %i7
	LOAD_DDATA_IN
	.word	0xbe170000
	GOTO_SUPERVISOR1
thr5_MMU_ASI_PRIMARY_297:
	.word	0x87802080
	.word	0xccf42018
	.word	0xfc9ad120
	.word	0x1000000
	or	%g0, 0x029, %i7
	LOAD_IDATA_IN
	IDEMAP_PCTX
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x6b8, %i7
	DTLB_TAG_READ
	.word	0xbe85a068
	.word	0xecdfd000
	.word	0xc85c2130
	.word	0x1000000
	or	%g0, 0x071, %i7
	LOAD_IDATA_IN
	.word	0xbe82a110
	.word	0xf4dfd000
	.word	0xc02aa153
	.word	0xfe55a1ea
	.word	0x1000000
	or	%g0, 0x033, %i7
	LOAD_IDATA_IN
	ACCESS_ITSB_PTR
	DDEMAP_PCTX
	.word	0xe19d9e00
	nop
	nop
	nop
	.word	0xbe164000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	.word	0xbe170000
	GOTO_SUPERVISOR1
	.word	0xfe4eaa23
	.word	0x1000000
	or	%g0, 0x87, %i7
	LOAD_IDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x004, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x60, %i7
	READ_IDATA_ACCESS
	DDEMAP_ALL_PAGES
	.word	0xf45ea0d0
	DDEMAP_ALL
	.word	0x1000000
	.word	0xbe150000
	IDEMAP_PAGE
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0242a6c
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v003_exit:
	EXIT_GOOD
Thr5_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v401 TEXT_VA=0x7350001bc000
attr_text {
	Name = .Thr5_User_Text_4v401 ,
	VA = 0x7350001bc000 ,/* 0x7350001bdfc0 */
	RA = 0x00d01e2000 ,
	PA = 0x5cd01e2000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr5_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x040000 ,
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
	/* ITTE_TAG_DATA = 00007350001bc000 8000005cd01e2080 */
	end_label   = Thr5_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v401_text_begin
Thr5_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0xfc995d60
	.word	0xfcdf5100
	P_TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe170000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x076, %i7
	P_LOAD_IDATA_IN
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x498, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x09b, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x735, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfe51a314
	.word	0x1000000
	or	%g0, 0xd4, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc035e484
	.word	0xfcde8200
	nop
	nop
	.word	0xfc9c1c40
	nop
	nop
	P_IDEMAP_ALL_RPAGES
	.word	0xbe816010
	.word	0xe2dfd060
	.word	0xc031a4ac
	.word	0xbe85a110
	.word	0xf4dfc200
	.word	0x1000000
	.word	0xbe124000
	P_IDEMAP_PAGE
	.word	0xfcdc1000
	.word	0xbe842110
	.word	0xecdfd000
	.word	0xde7320c0
	.word	0xc02b2445
	P_IDEMAP_NCTX
	.word	0xbe842008
	.word	0xecdfd000
thr5_MMU_ASI_BLK_PL_298:
	.word	0x878020f8
	.word	0xc3bc2a40
	nop
	nop
	.word	0x1000000
	or	%g0, 0x03a, %i7
	P_LOAD_DDATA_IN
	P_TOGGLE_LSU_IM
thr5_MMU_ASI_SECONDARY_299:
	.word	0x87802081
	.word	0xc4bc6a80
	.word	0xfe45e238
	.word	0x1000000
	or	%g0, 0x690, %i7
	P_DTLB_TAG_READ
	nop
	nop
	.word	0x1000000
	or	%g0, 0x73d, %i7
	P_LOAD_DDATA_ACCESS
thr5_MMU_ASI_AS_IF_USER_PRIMARY_300:
	.word	0x87802010
	.word	0xfaf6a038
	.word	0xfcdd8200
thr5_MMU_ASI_AS_IF_USER_PRIMARY_301:
	.word	0x87802010
	.word	0xdaf5a060
thr5_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_302:
	.word	0x87802018
	.word	0xeaf76060
	.word	0x1000000
	.word	0xbe11c000
	P_DDEMAP_PAGE
	.word	0xfcd94320
	.word	0x1000000
	.word	0xbe154000
	P_DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x138, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfc9c8580
	.word	0xfcd90300
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe164000
	P_IDEMAP_PAGE
	.word	0xc19d9e00
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x019, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_ALL_RPAGES
	P_DDEMAP_ALL
	.word	0xbe82a068
	.word	0xf4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda9040
	P_TOGGLE_LSU_IM
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v401_exit:
	EXIT_GOOD
Thr5_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v004 TEXT_VA=0x7350001ce000
attr_text {
	Name = .Thr5_User_Text_4v004 ,
	VA = 0x7350001ce000 ,/* 0x7350001cffc0 */
	RA = 0x00d0106000 ,
	PA = 0x00d0106000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00007350001cea49 80000000d0106080 */
	end_label   = Thr5_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v004_text_begin
Thr5_User_Text_4v004_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	.word	0xec592098
thr5_MMU_ASI_PRIMARY_303:
	.word	0x87802080
	.word	0xd8f2a018
	P_IDEMAP_NCTX
	P_ACCESS_ITSB_PTR
	P_IDEMAP_ALL_RPAGES
	.word	0xfe5eadb8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x02f, %i7
	P_LOAD_DDATA_IN
thr5_MMU_ASI_BLK_S_304:
	.word	0x878020f1
	.word	0xe1b967c0
	.word	0x1000000
	.word	0xbe140000
	P_IDEMAP_RPAGE
thr5_MMU_ASI_PRIMARY_305:
	.word	0x87802080
	.word	0xccf2a018
	.word	0x1000000
	or	%g0, 0x518, %i7
	P_DTLB_TAG_READ
	.word	0xbe842098
	.word	0xe0dfd000
	.word	0xfcda9000
	.word	0xfcdc0200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_AS_IF_USER_PRIMARY_306:
	.word	0x87802010
	.word	0xc6f5a0e8
	.word	0xbe82a008
	.word	0xfadfd000
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe138000
	P_IDEMAP_PAGE
	.word	0xfe5daf18
	.word	0xc031224a
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x4e0, %i7
	P_DTLB_TAG_READ
	.word	0xbe842038
	.word	0xd4dfc200
	.word	0xe19942e0
	.word	0xc0742de0
	P_TOGGLE_LSU_IM
	.word	0xbe876068
	.word	0xfadfc200
	nop
	nop
	nop
thr5_MMU_ASI_AS_IF_USER_PRIMARY_307:
	.word	0x87802010
	.word	0xf4f42068
thr5_MMU_ASI_SECONDARY_LITTLE_308:
	.word	0x87802089
	.word	0xd2f16050
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x570, %i7
	P_DTLB_TAG_READ
thr5_MMU_ASI_BLK_S_309:
	.word	0x878020f1
	.word	0xc3bc6b00
	.word	0xbe85a098
	.word	0xfadfc200
	.word	0x1000000
	or	%g0, 0x408, %i7
	P_LOAD_IDATA_ACCESS
thr5_MMU_ASI_AS_IF_USER_PRIMARY_310:
	.word	0x87802010
	.word	0xc8f6a098
	P_TOGGLE_LSU_DM
	nop
	.word	0xfcdac3a0
	.word	0xbe86a038
	.word	0xfadfc200
	.word	0x1000000
	or	%g0, 0xb0, %i7
	P_ITLB_TAG_READ
	.word	0xfcd89000
	P_DDEMAP_SCTX
	.word	0x1000000
	.word	0xbe160000
	P_IDEMAP_PAGE
	P_ACCESS_ITSB_PTR
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v004_exit:
	EXIT_GOOD
Thr5_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v102 DATA_VA=0x740000ab0000
attr_data {
	Name = .Thr5_User_Data_4v102 ,
	VA = 0x740000ab0000 ,/* 0x740000abffc0 */
	RA = 0x0010fe0000 ,
	PA = 0x0010fe0000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 0000740000ab0a49 8000000010fe0441 */
	end_label   = Thr5_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v102_data_begin
Thr5_User_Data_4v102_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v202 DATA_VA=0x740000bf0000
attr_data {
	Name = .Thr5_User_Data_4v202 ,
	VA = 0x740000bf0000 ,/* 0x740000bfffc0 */
	RA = 0x00101f0000 ,
	PA = 0x00101f0000 ,
	TTE_Context = 0x1b71 ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0d0000 ,
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
	/* DTTE_TAG_DATA = 0000740000bf1b71 80000000101f0041 */
	end_label   = Thr5_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v202_data_begin
Thr5_User_Data_4v202_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v302 DATA_VA=0x740000130000
attr_data {
	Name = .Thr5_User_Data_4v302 ,
	VA = 0x740000130000 ,/* 0x74000013ffc0 */
	RA = 0x0010500000 ,
	PA = 0x5010500000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f0000 ,
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
	/* DTTE_TAG_DATA = 0000740000130000 8000005010500041 */
	end_label   = Thr5_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v302_data_begin
Thr5_User_Data_4v302_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v005 TEXT_VA=0x740000410000
attr_text {
	Name = .Thr5_User_Text_4v005 ,
	VA = 0x740000410000 ,/* 0x74000041ffc0 */
	RA = 0x0010dd0000 ,
	PA = 0x0010dd0000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000740000410a49 8000000010dd0081 */
	end_label   = Thr5_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v005_text_begin
Thr5_User_Text_4v005_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v005_exit
	nop
thr5_MMU_ASI_SECONDARY_LITTLE_311:
	.word	0x87802089
	.word	0xd4b963a0
	.word	0xc035a474
	.word	0x1000000
	or	%g0, 0x034, %i7
	LOAD_IDATA_IN
	.word	0xc0242220
	.word	0x1000000
	.word	0xbe138000
	DDEMAP_PAGE
	.word	0xfcdad120
	.word	0xe472a018
	.word	0xc035aed2
	.word	0xfc9e9c40
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0xf5, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe5aa040
	.word	0xf45c2008
	ACCESS_ITSB_PTR
	.word	0xc45f6038
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe842068
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcde9000
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	ACCESS_ITSB_PTR
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x313, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe56a07e
	.word	0xfe48a6ed
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x608, %i7
	DTLB_TAG_READ
	nop
	nop
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x04e, %i7
	LOAD_IDATA_IN
	.word	0xbe816040
	.word	0xe2dfd060
thr5_MMU_ASI_PRIMARY_312:
	.word	0x87802080
	.word	0xcef420a8
	DDEMAP_PCTX
	.word	0xc02128d8
	.word	0xfe5c2a20
	nop
	nop
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe542d9a
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v005_exit:
	EXIT_GOOD
Thr5_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v402 TEXT_VA=0x740000ff0000
attr_text {
	Name = .Thr5_User_Text_4v402 ,
	VA = 0x740000ff0000 ,/* 0x740000ffffc0 */
	RA = 0x0010450000 ,
	PA = 0x5010450000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr5_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x040000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000740000ff0000 8000005010450081 */
	end_label   = Thr5_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v402_text_begin
Thr5_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x0a1, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x68, %i7
	P_DTLB_TAG_READ
	.word	0xfcda8200
	.word	0x1000000
	or	%g0, 0x522, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcdd9000
	.word	0xbe85a130
	.word	0xfadfc200
	.word	0x1000000
	.word	0xbe108000
	P_IDEMAP_PAGE
	.word	0xfcdd9000
	.word	0xfcdd9000
thr5_MMU_ASI_AS_IF_USER_PRIMARY_313:
	.word	0x87802010
	.word	0xd4f120d0
	P_IDEMAP_PCTX
	.word	0x1000000
	.word	0xbe10c000
	P_DDEMAP_PAGE
	nop
	nop
	.word	0xfcdf5000
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x191, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_PRIMARY_314:
	.word	0x87802080
	.word	0xccf5a018
	.word	0x1000000
	or	%g0, 0x04d, %i7
	P_LOAD_DDATA_IN
	P_ACCESS_DTSB_PTR
	nop
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v402_exit:
	EXIT_GOOD
Thr5_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v006 TEXT_VA=0x735000074000
attr_text {
	Name = .Thr5_User_Text_4v006 ,
	VA = 0x735000074000 ,/* 0x735000075fc0 */
	RA = 0x00d0174000 ,
	PA = 0x00d0174000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 0000735000074a49 80000000d0174080 */
	end_label   = Thr5_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v006_text_begin
Thr5_User_Text_4v006_text_begin:
	wrpr	0, %gl
	P_DDEMAP_ALL
	.word	0xf872a0b0
	.word	0xc02aae9f
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	P_READ_IDATA_ACCESS
thr5_MMU_ASI_AS_IF_USER_PRIMARY_315:
	.word	0x87802010
	.word	0xd4f6a0e0
	.word	0xce76a090
	.word	0xc03121c0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe842008
	.word	0xe0dfc200
	.word	0xe3995f20
thr5_MMU_ASI_BLK_COMMIT_S_316:
	.word	0x878020e1
	.word	0xe3baef40
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_317:
	.word	0x87802023
	.word	0xfcb963d0
	.word	0x1000000
	or	%g0, 0x04e, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe86a068
	.word	0xc4dfc200
	.word	0xfc9b04c0
	.word	0xbe80a068
	.word	0xe0dfd000
	nop
	.word	0xbe80a038
	.word	0xe0dfc200
thr5_MMU_ASI_PRIMARY_318:
	.word	0x87802080
	.word	0xe6f2a030
	P_IDEMAP_ALL_PAGES
	.word	0xbe85a0b8
	.word	0xe0dfc200
	.word	0x1000000
	or	%g0, 0x50a, %i7
	P_LOAD_DDATA_ACCESS
	P_IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x164, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfcda8200
	.word	0xfcde9000
	.word	0xfc9dc4e0
	.word	0xf472a098
	.word	0xc075afe0
	nop
	nop
	nop
	P_IDEMAP_NCTX
	.word	0x1000000
	.word	0xbe12c000
	P_DDEMAP_RPAGE
	P_ACCESS_DTSB_PTR
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9d9000
	.word	0x1000000
	or	%g0, 0x588, %i7
	P_READ_IDATA_ACCESS
	.word	0xd85c2018
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	P_DTLB_TAG_READ
	.word	0xfe5c29f8
	.word	0x1000000
	or	%g0, 0x578, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe120000
	P_DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe118000
	P_DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe100000
	P_IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x2e8, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v006_exit:
	EXIT_GOOD
Thr5_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v103 DATA_VA=0x740000fa0000
attr_data {
	Name = .Thr5_User_Data_4v103 ,
	VA = 0x740000fa0000 ,/* 0x740000faffc0 */
	RA = 0x0010a00000 ,
	PA = 0x0010a00000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 0000740000fa0a49 8000000010a00441 */
	end_label   = Thr5_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v103_data_begin
Thr5_User_Data_4v103_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v303 DATA_VA=0x740000c00000
attr_data {
	Name = .Thr5_User_Data_4v303 ,
	VA = 0x740000c00000 ,/* 0x740000c0ffc0 */
	RA = 0x0010430000 ,
	PA = 0x5010430000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f0000 ,
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
	/* DTTE_TAG_DATA = 0000740000c00000 8000005010430041 */
	end_label   = Thr5_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v303_data_begin
Thr5_User_Data_4v303_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v007 TEXT_VA=0x7400009b0000
attr_text {
	Name = .Thr5_User_Text_4v007 ,
	VA = 0x7400009b0000 ,/* 0x7400009bffc0 */
	RA = 0x0010140000 ,
	PA = 0x0010140000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00007400009b0a49 8000000010140081 */
	end_label   = Thr5_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v007_text_begin
Thr5_User_Text_4v007_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v007_exit
	nop
thr5_MMU_ASI_BLK_P_319:
	.word	0x878020f0
	.word	0xe3baadc0
	.word	0xe075a038
	.word	0xc03429be
thr5_MMU_ASI_PRIMARY_320:
	.word	0x87802080
	.word	0xf2f76028
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe168000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x700, %i7
	READ_DDATA_ACCESS
	.word	0xfcd89000
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x48, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc022a9f4
	.word	0xf8742028
	.word	0xc0342fa8
	DDEMAP_NCTX
	.word	0xd476a068
	.word	0xc0242f14
	.word	0x1000000
	or	%g0, 0x208, %i7
	READ_DDATA_ACCESS
	IDEMAP_ALL
	nop
	nop
	.word	0xfa5c2130
	.word	0x1000000
	or	%g0, 0x43e, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	TOGGLE_LSU_DM
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd2776020
	.word	0xc02aaf36
thr5_MMU_ASI_PRIMARY_321:
	.word	0x87802080
	.word	0xc8bda8c0
	.word	0x1000000
	or	%g0, 0x097, %i7
	LOAD_DDATA_IN
	.word	0xc0712420
	.word	0xee5da0a0
	.word	0x1000000
	or	%g0, 0x001, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x07c, %i7
	LOAD_DDATA_IN
	.word	0xc02c2231
	.word	0xc020aaa0
	.word	0xfcdd9000
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x003, %i7
	LOAD_DDATA_IN
	.word	0xfcdf5000
	.word	0xfe5aa370
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_NCTX
	.word	0xfe55a912
	nop
	nop
	.word	0x1000000
	or	%g0, 0x340, %i7
	DTLB_TAG_READ
thr5_MMU_ASI_BLK_P_322:
	.word	0x878020f0
	.word	0xe3baa980
	.word	0xbe8420d0
	.word	0xc8dfd000
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xf875a058
	.word	0xc072ae08
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v007_exit:
	EXIT_GOOD
Thr5_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v403 TEXT_VA=0x740000340000
attr_text {
	Name = .Thr5_User_Text_4v403 ,
	VA = 0x740000340000 ,/* 0x74000034ffc0 */
	RA = 0x0010c10000 ,
	PA = 0x5010c10000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr5_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x040000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000740000340000 8000005010c10081 */
	end_label   = Thr5_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v403_text_begin
Thr5_User_Text_4v403_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_DM
	.word	0xfcdf0280
thr5_MMU_ASI_AS_IF_USER_PRIMARY_323:
	.word	0x87802010
	.word	0xcef2a020
	P_ACCESS_ITSB_PTR
	P_ACCESS_ITSB_PTR
thr5_MMU_ASI_AS_IF_USER_PRIMARY_324:
	.word	0x87802010
	.word	0xfaf42098
	nop
	nop
	nop
	.word	0xfcd89000
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x004, %i7
	P_LOAD_IDATA_IN
thr5_MMU_ASI_SECONDARY_325:
	.word	0x87802081
	.word	0xd8b96e20
	.word	0x1000000
	or	%g0, 0x09a, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x8f, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe85a038
	.word	0xe0dfc200
	.word	0xfcde8200
	P_IDEMAP_NCTX
thr5_MMU_ASI_PRIMARY_326:
	.word	0x87802080
	.word	0xeaf6a0e8
	.word	0xfcdd8200
	.word	0x1000000
	.word	0xbe124000
	P_DDEMAP_RPAGE
	.word	0xfcdd9000
	.word	0xbe8420f0
	.word	0xd4dfd000
	.word	0xe671a020
	.word	0xc024a69c
thr5_MMU_ASI_BLK_P_327:
	.word	0x878020f0
	.word	0xc3b8ad40
	.word	0xbe82a100
	.word	0xe0dfc200
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v403_exit:
	EXIT_GOOD
Thr5_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v104 DATA_VA=0x740000120000
attr_data {
	Name = .Thr5_User_Data_4v104 ,
	VA = 0x740000120000 ,/* 0x74000012ffc0 */
	RA = 0x00102a0000 ,
	PA = 0x00102a0000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 0000740000120a49 80000000102a0441 */
	end_label   = Thr5_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v104_data_begin
Thr5_User_Data_4v104_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v008 TEXT_VA=0x735000002000
attr_text {
	Name = .Thr5_User_Text_4v008 ,
	VA = 0x735000002000 ,/* 0x735000003fc0 */
	RA = 0x00d010c000 ,
	PA = 0x00d010c000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	/* ITTE_TAG_DATA = 0000735000002a49 80000000d010c080 */
	end_label   = Thr5_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v008_text_begin
Thr5_User_Text_4v008_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v008_exit
	nop
	.word	0xfc9c5020
thr5_MMU_ASI_PRIMARY_328:
	.word	0x87802080
	.word	0xc6f6a0e8
	.word	0x1000000
	or	%g0, 0x5d0, %i7
	READ_IDATA_ACCESS
	.word	0xfe4428a8
	.word	0xbe85a068
	.word	0xd4dfd000
	.word	0xd8742018
	.word	0xc0212ee8
	.word	0x1000000
	or	%g0, 0x39, %i7
	LOAD_IDATA_ACCESS
	.word	0xe05ea0b8
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x168, %i7
	ITLB_TAG_READ
	.word	0xc022a520
	.word	0x1000000
	or	%g0, 0x060, %i7
	LOAD_DDATA_IN
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe1991e00
	.word	0xfcdc1140
	.word	0xc032adaa
	DDEMAP_NCTX
	IDEMAP_ALL_RPAGES
	.word	0xe676a128
	.word	0xc026aed4
	.word	0xd45c2098
	DDEMAP_ALL_RPAGES
	.word	0xe05c20e0
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x0ae, %i7
	LOAD_DDATA_IN
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0xc035a9e4
	IDEMAP_PCTX
	DDEMAP_ALL_RPAGES
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc0242f24
	.word	0x1000000
	.word	0xbe100000
	IDEMAP_PAGE
	IDEMAP_ALL_RPAGES
	.word	0xe272a010
	.word	0xc0276cb8
	.word	0xd85c2018
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe4f647b
	.word	0xfcdad120
	.word	0xc026aac4
	.word	0xfe46a688
	.word	0x1000000
	or	%g0, 0x1b5, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x054, %i7
	LOAD_IDATA_IN
	.word	0xf45aa038
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_RPAGES
	.word	0xc02da9b5
	.word	0xec58a068
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x1bc, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x498, %i7
	ITLB_TAG_READ
	.word	0xe2592070
	.word	0x1000000
	or	%g0, 0x04c, %i7
	LOAD_IDATA_IN
	.word	0xc45c2098
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr5_MMU_ASI_SECONDARY_329:
	.word	0x87802081
	.word	0xd8bc6ab0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf87120b0
	.word	0xc02daa03
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v008_exit:
	EXIT_GOOD
Thr5_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v404 TEXT_VA=0x750014800000
attr_text {
	Name = .Thr5_User_Text_4v404 ,
	VA = 0x750014800000 ,/* 0x750014bfffc0 */
	RA = 0x01d9c00000 ,
	PA = 0x01d9c00000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr5_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x040000 ,
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
	/* ITTE_TAG_DATA = 0000750014800000 80000001d9c00083 */
	end_label   = Thr5_User_Text_4v404_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v404_text_begin
Thr5_User_Text_4v404_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_ALL
	P_IDEMAP_ALL_PAGES
	.word	0xbe86e098
	.word	0xd4dfc280
	.word	0xe39942e0
thr5_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_330:
	.word	0x87802018
	.word	0xd4f42100
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
thr5_MMU_ASI_BLK_COMMIT_P_331:
	.word	0x878020e0
	.word	0xe1bf68c0
	.word	0xbe8120b8
	.word	0xe0dfd000
	P_DDEMAP_PCTX
thr5_MMU_ASI_AS_IF_USER_PRIMARY_332:
	.word	0x87802010
	.word	0xcef2a090
	.word	0xfa71a098
	.word	0xc0732a88
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xea74a0a8
	.word	0xc071aa70
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_IDEMAP_ALL_PAGES
thr5_MMU_ASI_AS_IF_USER_PRIMARY_333:
	.word	0x87802010
	.word	0xdaf6a080
	.word	0xfcdd8200
	.word	0xde7320f8
	.word	0xc035e880
	P_DDEMAP_ALL_RPAGES
	P_IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
thr5_MMU_ASI_PRIMARY_334:
	.word	0x87802080
	.word	0xf4f0a0d0
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v404_exit:
	EXIT_GOOD
Thr5_User_Text_4v404_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v105 DATA_VA=0x7400001f0000
attr_data {
	Name = .Thr5_User_Data_4v105 ,
	VA = 0x7400001f0000 ,/* 0x7400001fffc0 */
	RA = 0x0010a40000 ,
	PA = 0x0010a40000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 00007400001f0a49 8000000010a40441 */
	end_label   = Thr5_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v105_data_begin
Thr5_User_Data_4v105_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v009 TEXT_VA=0x740000ad0000
attr_text {
	Name = .Thr5_User_Text_4v009 ,
	VA = 0x740000ad0000 ,/* 0x740000adffc0 */
	RA = 0x0010c00000 ,
	PA = 0x0010c00000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000740000ad0a49 8000000010c00081 */
	end_label   = Thr5_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v009_text_begin
Thr5_User_Text_4v009_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v009_exit
	nop
	.word	0x1000000
	or	%g0, 0x06b, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x138, %i7
	READ_IDATA_ACCESS
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xfe5f6fd0
	DDEMAP_SCTX
	.word	0xfa5aa068
	.word	0xbe82a0d0
	.word	0xf4dfd000
	.word	0xe276a010
	.word	0xc022a334
	.word	0xfc9c5120
	.word	0xc0342d9a
	.word	0xc076a6f0
	.word	0x1000000
	or	%g0, 0xb0, %i7
	ITLB_TAG_READ
	.word	0xf07760c0
	.word	0xc036ae40
	.word	0xfe52a3bc
	.word	0x1000000
	or	%g0, 0x350, %i7
	READ_DDATA_ACCESS
thr5_MMU_ASI_BLK_P_335:
	.word	0x878020f0
	.word	0xc1b8a480
	.word	0xd2742128
	.word	0xc02aa65e
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_RPAGES
	.word	0xbe80a110
	.word	0xd4dfd000
	.word	0xd2742128
	.word	0xc075a670
	.word	0x1000000
	or	%g0, 0x211, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4aaf11
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v009_exit:
	EXIT_GOOD
Thr5_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v106 DATA_VA=0x735000124000
attr_data {
	Name = .Thr5_User_Data_4v106 ,
	VA = 0x735000124000 ,/* 0x735000125fc0 */
	RA = 0x00d0146000 ,
	PA = 0x00d0146000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 0000735000124a49 80000000d0146440 */
	end_label   = Thr5_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v106_data_begin
Thr5_User_Data_4v106_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00a TEXT_VA=0x750011000000
attr_text {
	Name = .Thr5_User_Text_4v00a ,
	VA = 0x750011000000 ,/* 0x7500113fffc0 */
	RA = 0x01d7800000 ,
	PA = 0x01d7800000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 0000750011000a49 80000001d7800083 */
	end_label   = Thr5_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00a_text_begin
Thr5_User_Text_4v00a_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v00a_exit
	nop
	.word	0xfe4f602a
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x060, %i7
	LOAD_IDATA_IN
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x08d, %i7
	LOAD_IDATA_IN
	.word	0xfc9d9c40
	IDEMAP_NCTX
	IDEMAP_ALL
	.word	0xc075ac88
	.word	0xf472a110
	.word	0xc02da19f
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xbe86a068
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0xc02da190
	.word	0xfc995020
	.word	0x1000000
	or	%g0, 0x083, %i7
	LOAD_IDATA_IN
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x020, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x408, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xd45aa068
	.word	0xfe4eafe7
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_BLK_COMMIT_S_336:
	.word	0x878020e1
	.word	0xe1b96f00
	.word	0x1000000
	or	%g0, 0x30, %i7
	ITLB_TAG_READ
	DDEMAP_SCTX
thr5_MMU_ASI_BLK_COMMIT_P_337:
	.word	0x878020e0
	.word	0xe1baa740
	.word	0xfcda9000
	.word	0xc032a642
	.word	0xbe150000
	GOTO_SUPERVISOR1
	ACCESS_ITSB_PTR
	TOGGLE_LSU_IM
	.word	0xde72a0c0
	.word	0xc036a18e
	IDEMAP_PCTX
	.word	0xbe846070
	.word	0xcadfd060
	.word	0x1000000
	or	%g0, 0x2a0, %i7
	DTLB_TAG_READ
	.word	0xfa75a130
	.word	0xc072ab68
thr5_MMU_ASI_PRIMARY_338:
	.word	0x87802080
	.word	0xc4f42038
	.word	0xea72a0a8
	.word	0xc036a874
	.word	0xe05da0e0
	.word	0xe4712018
	.word	0xc036a480
thr5_MMU_ASI_PRIMARY_LITTLE_339:
	.word	0x87802088
	.word	0xecf76110
	.word	0xfc9adc60
	.word	0xbe85a038
	.word	0xecdfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4da8db
	.word	0xc02aa9f1
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe42a9a0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00a_exit:
	EXIT_GOOD
Thr5_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v107 DATA_VA=0x750039400000
attr_data {
	Name = .Thr5_User_Data_4v107 ,
	VA = 0x750039400000 ,/* 0x7500397fffc0 */
	RA = 0x01de800000 ,
	PA = 0x01de800000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 0000750039400a49 80000001de800443 */
	end_label   = Thr5_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v107_data_begin
Thr5_User_Data_4v107_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00b TEXT_VA=0x740000a40000
attr_text {
	Name = .Thr5_User_Text_4v00b ,
	VA = 0x740000a40000 ,/* 0x740000a4ffc0 */
	RA = 0x00104b0000 ,
	PA = 0x00104b0000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000740000a40a49 80000000104b0081 */
	end_label   = Thr5_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00b_text_begin
Thr5_User_Text_4v00b_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v00b_exit
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe876068
	.word	0xfadfd000
	.word	0xfe55a67c
	.word	0x1000000
	or	%g0, 0x630, %i7
	DTLB_TAG_READ
	.word	0xc0342a0c
	TOGGLE_LSU_IM
	.word	0xfcdd9000
	DDEMAP_PCTX
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x38, %i7
	READ_DDATA_ACCESS
	IDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a120
	.word	0xfadfd000
	nop
	.word	0xbe816010
	.word	0xe39fde20
	.word	0x1000000
	or	%g0, 0x510, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdc1000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe50a474
	.word	0xe05ea038
	.word	0x1000000
	or	%g0, 0x770, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x024, %i7
	LOAD_IDATA_IN
	.word	0xfcde9000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x091, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_IM
	.word	0xc036af4e
	IDEMAP_ALL_RPAGES
	.word	0xca5da010
	.word	0x1000000
	or	%g0, 0x400, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
thr5_MMU_ASI_PRIMARY_LITTLE_340:
	.word	0x87802088
	.word	0xf4f5a0f0
	.word	0xfe45ad4c
	.word	0x1000000
	or	%g0, 0x598, %i7
	ITLB_TAG_READ
	DDEMAP_ALL_PAGES
	.word	0xc672a128
	.word	0xc02c29fa
	.word	0xc026ada4
	IDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc02da32c
	.word	0xbe170000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00b_exit:
	EXIT_GOOD
Thr5_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v108 DATA_VA=0x735000194000
attr_data {
	Name = .Thr5_User_Data_4v108 ,
	VA = 0x735000194000 ,/* 0x735000195fc0 */
	RA = 0x00d00b2000 ,
	PA = 0x00d00b2000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 0000735000194a49 80000000d00b2440 */
	end_label   = Thr5_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v108_data_begin
Thr5_User_Data_4v108_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00c TEXT_VA=0x7350001f0000
attr_text {
	Name = .Thr5_User_Text_4v00c ,
	VA = 0x7350001f0000 ,/* 0x7350001f1fc0 */
	RA = 0x00d0076000 ,
	PA = 0x00d0076000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	/* ITTE_TAG_DATA = 00007350001f0a49 80000000d0076080 */
	end_label   = Thr5_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00c_text_begin
Thr5_User_Text_4v00c_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v00c_exit
	nop
	.word	0xe4592018
	.word	0xf2742028
	.word	0xc0292ff3
	.word	0x1000000
	or	%g0, 0x6fd, %i7
	LOAD_DDATA_ACCESS
	.word	0xd45f6068
	.word	0xbe8420b8
	.word	0xe0dfd000
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x58d, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1f3, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x50b, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe55a84c
	ACCESS_ITSB_PTR
	.word	0xe05aa038
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdad020
	.word	0x1000000
	or	%g0, 0x68, %i7
	ITLB_TAG_READ
	.word	0xfcdd9100
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_PRIMARY_341:
	.word	0x87802080
	.word	0xdcf5a0c8
	.word	0x1000000
	or	%g0, 0x278, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0xb8, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcdc1000
	.word	0xbe842030
	.word	0xe19fde00
	.word	0xc035ab5a
	.word	0x1000000
	or	%g0, 0x01a, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0742ae8
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x09d, %i7
	LOAD_IDATA_IN
thr5_MMU_ASI_PRIMARY_342:
	.word	0x87802080
	.word	0xe6f0a0a8
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02aa245
	.word	0xc075aef8
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x258, %i7
	DTLB_TAG_READ
	DDEMAP_ALL_PAGES
	TOGGLE_LSU_DM
	.word	0xd8742018
	.word	0xc02dacea
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x00d, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x420, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x235, %i7
	LOAD_DDATA_ACCESS
thr5_MMU_ASI_PRIMARY_343:
	.word	0x87802080
	.word	0xc8f12008
	.word	0xf2712058
	.word	0xc02f671f
	nop
	nop
	.word	0xf4742100
	.word	0xc0376ff0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf672a0d8
	.word	0xc032af00
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00c_exit:
	EXIT_GOOD
Thr5_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v109 DATA_VA=0x735000186000
attr_data {
	Name = .Thr5_User_Data_4v109 ,
	VA = 0x735000186000 ,/* 0x735000187fc0 */
	RA = 0x00d00a4000 ,
	PA = 0x00d00a4000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 0000735000186a49 80000000d00a4440 */
	end_label   = Thr5_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v109_data_begin
Thr5_User_Data_4v109_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00d TEXT_VA=0x7350001b2000
attr_text {
	Name = .Thr5_User_Text_4v00d ,
	VA = 0x7350001b2000 ,/* 0x7350001b3fc0 */
	RA = 0x00d0062000 ,
	PA = 0x00d0062000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	/* ITTE_TAG_DATA = 00007350001b2a49 80000000d0062080 */
	end_label   = Thr5_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00d_text_begin
Thr5_User_Text_4v00d_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v00d_exit
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0xfe5da390
	.word	0xd872a078
	.word	0xc0242a70
	.word	0xc02c291c
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x27a, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	.word	0xc026ae24
	.word	0xfcdd9000
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x340, %i7
	DTLB_TAG_READ
	.word	0xec76a098
	.word	0xc035a462
	.word	0xe2712010
	.word	0xc0742140
	.word	0xc02da140
	.word	0xbe80a100
	.word	0xfadfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a110
	.word	0xecdfd000
	.word	0x1000000
	.word	0xbe160000
	DDEMAP_RPAGE
	.word	0xbe170000
	GOTO_SUPERVISOR1
	.word	0xd275a0a8
	.word	0xc075a208
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02aae0e
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00d_exit:
	EXIT_GOOD
Thr5_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10a DATA_VA=0x73500012e000
attr_data {
	Name = .Thr5_User_Data_4v10a ,
	VA = 0x73500012e000 ,/* 0x73500012ffc0 */
	RA = 0x00d00c0000 ,
	PA = 0x00d00c0000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 000073500012ea49 80000000d00c0440 */
	end_label   = Thr5_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10a_data_begin
Thr5_User_Data_4v10a_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00e TEXT_VA=0x7350001c2000
attr_text {
	Name = .Thr5_User_Text_4v00e ,
	VA = 0x7350001c2000 ,/* 0x7350001c3fc0 */
	RA = 0x00d01cc000 ,
	PA = 0x00d01cc000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	/* ITTE_TAG_DATA = 00007350001c2a49 80000000d01cc080 */
	end_label   = Thr5_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00e_text_begin
Thr5_User_Text_4v00e_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v00e_exit
	nop
	.word	0xfcda9000
	.word	0xe470a078
	.word	0xc035a690
	.word	0xc072ac80
	.word	0xf272a058
	.word	0xc036aefc
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc03425fe
	.word	0xfe5aaa08
	IDEMAP_ALL_PAGES
	.word	0xbe86a098
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe6776138
	.word	0xc0742140
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a060
	.word	0xc19fde00
	.word	0xc19c1f00
	.word	0xee5aa0a0
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr5_MMU_ASI_BLK_P_344:
	.word	0x878020f0
	.word	0xc3bc2a80
	.word	0x1000000
	or	%g0, 0x02e, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x6bd, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	IDEMAP_NCTX
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x568, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc035adc0
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00e_exit:
	EXIT_GOOD
Thr5_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10b DATA_VA=0x740000380000
attr_data {
	Name = .Thr5_User_Data_4v10b ,
	VA = 0x740000380000 ,/* 0x74000038ffc0 */
	RA = 0x0010350000 ,
	PA = 0x0010350000 ,
	TTE_Context = 0x0a49 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 0000740000380a49 8000000010350441 */
	end_label   = Thr5_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10b_data_begin
Thr5_User_Data_4v10b_data_begin:
	.xword	0x75000dc00000
	.xword	0x740000980000
	.xword	0x7350000b4000
	.xword	0x760190000000
	.xword	0x740000360000
	.xword	0x75002d400000
	.xword	0x7350001e2000
	.xword	0x7350001a0000
	.xword	0x75000fc00000
	.xword	0x740000400000
	.xword	0x75003bc00000
	.xword	0x7350001bc000
	.xword	0x7350001ce000
	.xword	0x740000ab0000
	.xword	0x740000bf0000
	.xword	0x740000130000
	.xword	0x740000410000
	.xword	0x740000ff0000
	.xword	0x735000074000
	.xword	0x740000fa0000
	.xword	0x740000c00000
	.xword	0x7400009b0000
	.xword	0x740000340000
	.xword	0x740000120000
	.xword	0x735000002000
	.xword	0x750014800000
	.xword	0x7400001f0000
	.xword	0x740000ad0000
	.xword	0x735000124000
	.xword	0x750011000000
	.xword	0x750039400000
	.xword	0x740000a40000
	.xword	0x735000194000
	.xword	0x7350001f0000
	.xword	0x735000186000
	.xword	0x7350001b2000
	.xword	0x73500012e000
	.xword	0x7350001c2000
	.xword	0x740000380000
	.xword	0x740000f30000
Thr5_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00f TEXT_VA=0x740000f30000
attr_text {
	Name = .Thr5_User_Text_4v00f ,
	VA = 0x740000f30000 ,/* 0x740000f3ffc0 */
	RA = 0x0010210000 ,
	PA = 0x0010210000 ,
	TTE_Context = 0x0a49 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x010000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000740000f30a49 8000000010210081 */
	end_label   = Thr5_User_Text_4v00f_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00f_text_begin
Thr5_User_Text_4v00f_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr5_User_Text_4v00f_exit
	nop
	.word	0xc4742098
	.word	0xc036adf2
	DDEMAP_ALL_RPAGES
	.word	0xfe5c2268
thr5_MMU_ASI_BLK_P_345:
	.word	0x878020f0
	.word	0xc3bc2600
thr5_MMU_ASI_BLK_COMMIT_P_346:
	.word	0x878020e0
	.word	0xe3beab80
	.word	0xc39ade20
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL
	.word	0xfe4aaebc
	.word	0x1000000
	.word	0xbe17c000
	IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xee58a018
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00f_exit:
	EXIT_GOOD
Thr5_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v000 TEXT_VA=0x7760001f4000
attr_text {
	Name = .Thr6_User_Text_4v000 ,
	VA = 0x7760001f4000 ,/* 0x7760001f5fc0 */
	RA = 0x00e00b4000 ,
	PA = 0x6ce00b4000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* ITTE_TAG_DATA = 00007760001f5a67 8000006ce00b4480 */
	end_label   = Thr6_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr6_user_code_entry
Thr6_user_code_entry:
	setx	0x780000830000, %g1, %g2
	or	%g0, 12, %g1
	.word	0xc658a000
	.word	0xc858a008
	.word	0xca58a010
	.word	0xcc58a018
	.word	0xce58a020
	.word	0xd058a028
	.word	0xd258a030
	.word	0xd458a038
	.word	0xd658a040
	.word	0xd858a048
	.word	0xda58a050
	.word	0xdc58a058
	.word	0xde58a060
	.word	0xe058a068
	.word	0xe258a070
	.word	0xe458a078
	.word	0xe658a080
	.word	0xe858a088
	.word	0xea58a090
	.word	0xec58a098
	.word	0xee58a0a0
	.word	0xf058a0a8
	.word	0xf258a0b0
	.word	0xf458a0b8
	.word	0xf658a0c0
	.word	0xf858a0c8
	.word	0xfa58a0d0
	.word	0xfc58a0d8
.global Thr6_User_Text_4v000_text_begin
Thr6_User_Text_4v000_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr6_User_Text_4v000_exit
	nop
	.word	0xea5d6110
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcd89000
	.word	0xc022a6c4
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x505, %i7
	LOAD_IDATA_ACCESS
	.word	0xd472a068
	.word	0xc030af8e
	nop
	DDEMAP_ALL_PAGES
thr6_MMU_ASI_PRIMARY_347:
	.word	0x87802080
	.word	0xd2f12080
	.word	0xc0356dcc
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe05aa110
	.word	0xf65f6078
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_RPAGES
	DDEMAP_PCTX
	.word	0xbe842090
	.word	0xf4dfd000
	.word	0x1000000
	or	%g0, 0x548, %i7
	READ_IDATA_ACCESS
	nop
	ACCESS_ITSB_PTR
	ACCESS_DTSB_PTR
	.word	0xbe82a0b8
	.word	0xeadfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc85d6068
	.word	0xfcde9000
	.word	0xd072a028
	.word	0xc032a6b6
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x08d, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe17c000
	IDEMAP_PAGE
	ACCESS_DTSB_PTR
	.word	0xd472a0d0
	.word	0xc072a848
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	.word	0x1000000
	or	%g0, 0x78, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x03f, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x6a8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x20, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc026a5e0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v000_exit:
	EXIT_GOOD
Thr6_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v100 DATA_VA=0x780000830000
attr_data {
	Name = .Thr6_User_Data_4v100 ,
	VA = 0x780000830000 ,/* 0x78000083ffc0 */
	RA = 0x00206d0000 ,
	PA = 0x64206d0000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000780000830ebb 80000064206d0041 */
	end_label   = Thr6_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v100_data_begin
Thr6_User_Data_4v100_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v200 DATA_VA=0x7800002a0000
attr_data {
	Name = .Thr6_User_Data_4v200 ,
	VA = 0x7800002a0000 ,/* 0x7800002affc0 */
	RA = 0x0020550000 ,
	PA = 0x6420550000 ,
	TTE_Context = 0x0066 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x150000 ,
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
	/* DTTE_TAG_DATA = 00007800002a0066 8000006420550041 */
	end_label   = Thr6_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v200_data_begin
Thr6_User_Data_4v200_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v300 DATA_VA=0x776000118000
attr_data {
	Name = .Thr6_User_Data_4v300 ,
	VA = 0x776000118000 ,/* 0x776000119fc0 */
	RA = 0x00e00d0000 ,
	PA = 0x6ce00d0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x190000 ,
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
	/* DTTE_TAG_DATA = 0000776000118000 8000006ce00d0040 */
	end_label   = Thr6_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v300_data_begin
Thr6_User_Data_4v300_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v001 TEXT_VA=0x7760001de000
attr_text {
	Name = .Thr6_User_Text_4v001 ,
	VA = 0x7760001de000 ,/* 0x7760001dffc0 */
	RA = 0x00e0194000 ,
	PA = 0x6ce0194000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* ITTE_TAG_DATA = 00007760001dfa67 8000006ce0194480 */
	end_label   = Thr6_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v001_text_begin
Thr6_User_Text_4v001_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr6_User_Text_4v001_exit
	nop
	.word	0xbe82a008
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfc9e9c40
	.word	0xe05f6150
	.word	0xbe86a150
	.word	0xf4dfd000
	DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x00d, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe25f6010
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x98, %i7
	READ_IDATA_ACCESS
	.word	0xc02aa6eb
	.word	0xbe164000
	GOTO_SUPERVISOR1
	ACCESS_DTSB_PTR
	.word	0xd45d6110
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x05d, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc022aca4
	.word	0xc032abc0
	IDEMAP_ALL_RPAGES
	DDEMAP_ALL
	.word	0xd45d6068
	.word	0x1000000
	or	%g0, 0x40a, %i7
	LOAD_IDATA_ACCESS
thr6_MMU_ASI_BLK_COMMIT_P_348:
	.word	0x878020e0
	.word	0xc1beafc0
	.word	0xc036ac7e
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe42a5fc
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v001_exit:
	EXIT_GOOD
Thr6_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v400 TEXT_VA=0x780000c70000
attr_text {
	Name = .Thr6_User_Text_4v400 ,
	VA = 0x780000c70000 ,/* 0x780000c7ffc0 */
	RA = 0x0020f50000 ,
	PA = 0x0020f50000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr6_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000780000c70000 8000000020f50081 */
	end_label   = Thr6_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v400_text_begin
Thr6_User_Text_4v400_text_begin:
	wrpr	0, %gl
	P_IDEMAP_ALL
thr6_MMU_ASI_AS_IF_USER_PRIMARY_349:
	.word	0x87802010
	.word	0xecf56010
	.word	0x1000000
	or	%g0, 0x026, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	.word	0xfe46e6b8
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_PCTX
	P_TOGGLE_LSU_IM
	.word	0xc071a9b0
	.word	0x1000000
	or	%g0, 0x530, %i7
	P_READ_IDATA_ACCESS
	.word	0xdc74a0b0
	.word	0xc031a2b4
thr6_MMU_ASI_SECONDARY_350:
	.word	0x87802081
	.word	0xe0baeb40
	P_IDEMAP_NCTX
	.word	0xdc74a0b0
	.word	0xc024af60
	.word	0x1000000
	.word	0xbe178000
	P_DDEMAP_RPAGE
thr6_MMU_ASI_PRIMARY_351:
	.word	0x87802080
	.word	0xf0f42020
thr6_MMU_ASI_PRIMARY_352:
	.word	0x87802080
	.word	0xdef42060
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v400_exit:
	EXIT_GOOD
Thr6_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v002 TEXT_VA=0x780000ae0000
attr_text {
	Name = .Thr6_User_Text_4v002 ,
	VA = 0x780000ae0000 ,/* 0x780000aeffc0 */
	RA = 0x00202b0000 ,
	PA = 0x64202b0000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000780000ae0ebb 80000064202b0481 */
	end_label   = Thr6_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v002_text_begin
Thr6_User_Text_4v002_text_begin:
	wrpr	0, %gl
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_353:
	.word	0x87802022
	.word	0xf4bc2720
	P_TOGGLE_LSU_DM
	.word	0xbe82a0e0
	.word	0xe0dfd000
	.word	0xca592010
	P_DDEMAP_NCTX
	P_DDEMAP_ALL_PAGES
thr6_MMU_ASI_AS_IF_USER_PRIMARY_354:
	.word	0x87802010
	.word	0xd6f42010
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x268, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x048, %i7
	P_LOAD_DDATA_IN
thr6_MMU_ASI_PRIMARY_355:
	.word	0x87802080
	.word	0xd6f2a010
	.word	0xfcda9000
	.word	0xbe8420e0
	.word	0xeadfd000
	.word	0xfcdd4200
thr6_MMU_ASI_AS_IF_USER_PRIMARY_356:
	.word	0x87802010
	.word	0xe0f0a0e0
	.word	0xc0376232
	P_IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	.word	0xbe846010
	.word	0xcadfc220
	.word	0x1000000
	or	%g0, 0x071, %i7
	P_LOAD_IDATA_IN
	.word	0xfcdd4200
	.word	0xfcde8200
	.word	0x1000000
	or	%g0, 0x07a, %i7
	P_LOAD_IDATA_IN
	P_DDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe108000
	P_IDEMAP_PAGE
	.word	0xc02ea1f1
	.word	0xec76a070
	.word	0xc0756d68
	.word	0xf076a020
	.word	0xc022a324
	.word	0xfe442a4c
	.word	0x1000000
	.word	0xbe104000
	P_IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	P_DTLB_TAG_READ
	.word	0xbe82a038
	.word	0xf4dfc200
	P_IDEMAP_PCTX
thr6_MMU_ASI_PRIMARY_357:
	.word	0x87802080
	.word	0xfaf6a140
thr6_MMU_ASI_PRIMARY_358:
	.word	0x87802080
	.word	0xeef2a078
	.word	0x1000000
	or	%g0, 0x023, %i7
	P_LOAD_DDATA_IN
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr6_User_Text_4v002_exit:
	EXIT_GOOD
Thr6_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v101 DATA_VA=0x780000c80000
attr_data {
	Name = .Thr6_User_Data_4v101 ,
	VA = 0x780000c80000 ,/* 0x780000c8ffc0 */
	RA = 0x0020200000 ,
	PA = 0x6420200000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000780000c80ebb 8000006420200041 */
	end_label   = Thr6_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v101_data_begin
Thr6_User_Data_4v101_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v201 DATA_VA=0x790036c00000
attr_data {
	Name = .Thr6_User_Data_4v201 ,
	VA = 0x790036c00000 ,/* 0x790036ffffc0 */
	RA = 0x01e7c00000 ,
	PA = 0x01e7c00000 ,
	TTE_Context = 0x0066 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x150000 ,
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
	/* DTTE_TAG_DATA = 0000790036c00066 80000001e7c00043 */
	end_label   = Thr6_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v201_data_begin
Thr6_User_Data_4v201_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v301 DATA_VA=0x79001b000000
attr_data {
	Name = .Thr6_User_Data_4v301 ,
	VA = 0x79001b000000 ,/* 0x79001b3fffc0 */
	RA = 0x01e0400000 ,
	PA = 0x01e0400000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x190000 ,
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
	/* DTTE_TAG_DATA = 000079001b000000 80000001e0400043 */
	end_label   = Thr6_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v301_data_begin
Thr6_User_Data_4v301_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v003 TEXT_VA=0x776000004000
attr_text {
	Name = .Thr6_User_Text_4v003 ,
	VA = 0x776000004000 ,/* 0x776000005fc0 */
	RA = 0x00e0116000 ,
	PA = 0x6ce0116000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* ITTE_TAG_DATA = 0000776000005a67 8000006ce0116480 */
	end_label   = Thr6_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v003_text_begin
Thr6_User_Text_4v003_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr6_User_Text_4v003_exit
	nop
	ACCESS_ITSB_PTR
	.word	0xbe82a008
	.word	0xfadfd000
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe114000
	IDEMAP_PAGE
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x0ac, %i7
	LOAD_DDATA_IN
	.word	0xce70a0c8
	.word	0xc076a800
	IDEMAP_PCTX
	.word	0xbe86a110
	.word	0xd4dfd000
	DDEMAP_NCTX
	.word	0xfcde9000
	.word	0xc85f60f0
	.word	0xfe54293a
	.word	0xe4742018
	.word	0xc076a158
	IDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe158000
	IDEMAP_RPAGE
	DDEMAP_NCTX
thr6_MMU_ASI_BLK_P_359:
	.word	0x878020f0
	.word	0xc1beab80
	.word	0x1000000
	.word	0xbe17c000
	DDEMAP_RPAGE
	.word	0xbe8420d0
	.word	0xe0dfd000
	.word	0xfe58af58
	.word	0x1000000
	.word	0xbe168000
	IDEMAP_PAGE
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x43f, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcdd5000
	DDEMAP_SCTX
	.word	0xfc995d60
	.word	0x1000000
	.word	0xbe14c000
	IDEMAP_PAGE
	.word	0xfe5c20a8
	nop
	.word	0xf076a0c8
	.word	0xc072a1b8
	.word	0xec5d6040
	.word	0x1000000
	or	%g0, 0x5c9, %i7
	LOAD_DDATA_ACCESS
	.word	0xe05ea090
	.word	0x1000000
	.word	0xbe118000
	IDEMAP_PAGE
	nop
	nop
	nop
	ACCESS_ITSB_PTR
thr6_MMU_ASI_PRIMARY_360:
	.word	0x87802080
	.word	0xdef420a8
	.word	0xc025685c
	.word	0xbe8760f0
	.word	0xeadfd000
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe058a038
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v003_exit:
	EXIT_GOOD
Thr6_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v401 TEXT_VA=0x7760000ca000
attr_text {
	Name = .Thr6_User_Text_4v401 ,
	VA = 0x7760000ca000 ,/* 0x7760000cbfc0 */
	RA = 0x00e01a6000 ,
	PA = 0x6ce01a6000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr6_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00007760000ca000 8000006ce01a6080 */
	end_label   = Thr6_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v401_text_begin
Thr6_User_Text_4v401_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe104000
	P_IDEMAP_PAGE
	P_TOGGLE_LSU_DM
thr6_MMU_ASI_AS_IF_USER_SECONDARY_LITTLE_361:
	.word	0x87802019
	.word	0xc6f16080
	.word	0xbe86a110
	.word	0xd4dfc200
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xbe8420e0
	.word	0xeadfd000
	P_TOGGLE_LSU_IM
thr6_MMU_ASI_AS_IF_USER_PRIMARY_362:
	.word	0x87802010
	.word	0xfaf42090
thr6_MMU_ASI_SECONDARY_363:
	.word	0x87802081
	.word	0xecbc6150
	P_ACCESS_DTSB_PTR
	.word	0xbe812128
	.word	0xd4dfc200
thr6_MMU_ASI_AS_IF_USER_PRIMARY_364:
	.word	0x87802010
	.word	0xeaf2a150
	.word	0xbe812038
	.word	0xeadfc200
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_BLK_COMMIT_S_365:
	.word	0x878020e1
	.word	0xc3bc6b40
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_NCTX
thr6_MMU_ASI_PRIMARY_366:
	.word	0x87802080
	.word	0xdef2a0a8
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_BLK_P_367:
	.word	0x878020f0
	.word	0xc3baa300
	.word	0xfc9c8580
	P_IDEMAP_PCTX
	.word	0xfc98c5c0
	.word	0xbe842138
	.word	0xeadfd000
	P_ACCESS_DTSB_PTR
	.word	0xbe86a030
	.word	0xe39fc2c0
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v401_exit:
	EXIT_GOOD
Thr6_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v004 TEXT_VA=0x7a02c0000000
attr_text {
	Name = .Thr6_User_Text_4v004 ,
	VA = 0x7a02c0000000 ,/* 0x7a02cfffffc0 */
	RA = 0x0260000000 ,
	PA = 0x6e60000000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 00007a02c0000ebb 8000006e60000485 */
	end_label   = Thr6_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v004_text_begin
Thr6_User_Text_4v004_text_begin:
	wrpr	0, %gl
	nop
	nop
	.word	0x1000000
	or	%g0, 0x53d, %i7
	P_LOAD_IDATA_ACCESS
	P_TOGGLE_LSU_IM
thr6_MMU_ASI_AS_IF_USER_PRIMARY_368:
	.word	0x87802010
	.word	0xf0f6a020
	.word	0xc02eaee9
thr6_MMU_ASI_AS_IF_USER_PRIMARY_369:
	.word	0x87802010
	.word	0xdef2a0a8
	P_IDEMAP_ALL_PAGES
	.word	0xbe856090
	.word	0xe19fc2c0
	.word	0xbe82a130
	.word	0xe0dfd000
thr6_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_370:
	.word	0x87802018
	.word	0xd2f42108
	nop
	nop
	nop
	nop
	.word	0xc02ea8d0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4db, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x558, %i7
	P_ITLB_TAG_READ
	.word	0xfcdf5000
thr6_MMU_ASI_REAL_IO_LITTLE_371:
	.word	0x8780201d
	.word	0xe0f42090
	.word	0x1000000
	or	%g0, 0x5d8, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x6a5, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfe5ea898
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x62, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe160000
	P_DDEMAP_RPAGE
thr6_MMU_ASI_AS_IF_USER_PRIMARY_372:
	.word	0x87802010
	.word	0xdef2a0e8
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr6_User_Text_4v004_exit:
	EXIT_GOOD
Thr6_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v102 DATA_VA=0x776000164000
attr_data {
	Name = .Thr6_User_Data_4v102 ,
	VA = 0x776000164000 ,/* 0x776000165fc0 */
	RA = 0x00e00b6000 ,
	PA = 0x6ce00b6000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000776000165a67 8000006ce00b6040 */
	end_label   = Thr6_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v102_data_begin
Thr6_User_Data_4v102_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v202 DATA_VA=0x7800007c0000
attr_data {
	Name = .Thr6_User_Data_4v202 ,
	VA = 0x7800007c0000 ,/* 0x7800007cffc0 */
	RA = 0x0020ae0000 ,
	PA = 0x6420ae0000 ,
	TTE_Context = 0x0066 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x150000 ,
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
	/* DTTE_TAG_DATA = 00007800007c0066 8000006420ae0041 */
	end_label   = Thr6_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v202_data_begin
Thr6_User_Data_4v202_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v302 DATA_VA=0x7a0440000000
attr_data {
	Name = .Thr6_User_Data_4v302 ,
	VA = 0x7a0440000000 ,/* 0x7a044fffffc0 */
	RA = 0x02e0000000 ,
	PA = 0x6ee0000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x190000 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 00007a0440000000 8000006ee0000045 */
	end_label   = Thr6_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v302_data_begin
Thr6_User_Data_4v302_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v005 TEXT_VA=0x7760000fe000
attr_text {
	Name = .Thr6_User_Text_4v005 ,
	VA = 0x7760000fe000 ,/* 0x7760000fffc0 */
	RA = 0x00e001e000 ,
	PA = 0x6ce001e000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* ITTE_TAG_DATA = 00007760000ffa67 8000006ce001e480 */
	end_label   = Thr6_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v005_text_begin
Thr6_User_Text_4v005_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr6_User_Text_4v005_exit
	nop
	.word	0x1000000
	or	%g0, 0xa0, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0712b70
thr6_MMU_ASI_SECONDARY_LITTLE_373:
	.word	0x87802089
	.word	0xd6f16010
	.word	0x1000000
	.word	0xbe140000
	IDEMAP_RPAGE
	.word	0xfc9c1100
	TOGGLE_LSU_IM
	.word	0xc0742538
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf4742068
	.word	0xc022aea4
thr6_MMU_ASI_BLK_SL_374:
	.word	0x878020f9
	.word	0xe3b96580
	.word	0xf4756038
	.word	0xc07567c8
	.word	0x1000000
	or	%g0, 0x99, %i7
	LOAD_DDATA_ACCESS
	nop
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0xfc991c40
	.word	0xc85d60d0
	.word	0xc036a1a2
	TOGGLE_LSU_IM
	DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc032a4ae
	.word	0xfcd89000
	TOGGLE_LSU_IM
	.word	0xbe82a008
	.word	0xeadfd000
thr6_MMU_ASI_PRIMARY_375:
	.word	0x87802080
	.word	0xe6f6a000
	.word	0xd2742050
	.word	0xc072ae18
	.word	0x1000000
	or	%g0, 0x140, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x116, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x008, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x1d8, %i7
	READ_DDATA_ACCESS
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xea5aa068
	.word	0xc85aa068
	.word	0x1000000
	or	%g0, 0x5e8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x484, %i7
	LOAD_DDATA_ACCESS
	.word	0xfc9a9d40
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	DDEMAP_SCTX
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_RPAGE
	nop
	nop
	.word	0xca5f6010
	.word	0xce7120a8
	.word	0xc0376d24
	ACCESS_DTSB_PTR
	IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4f69b7
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v005_exit:
	EXIT_GOOD
Thr6_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v402 TEXT_VA=0x77600016a000
attr_text {
	Name = .Thr6_User_Text_4v402 ,
	VA = 0x77600016a000 ,/* 0x77600016bfc0 */
	RA = 0x00e00a0000 ,
	PA = 0x6ce00a0000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr6_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 000077600016a000 8000006ce00a0080 */
	end_label   = Thr6_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v402_text_begin
Thr6_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x142, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf4732110
	.word	0xc025e67c
	.word	0xfcda9000
	P_DDEMAP_ALL
thr6_MMU_ASI_AS_IF_USER_PRIMARY_376:
	.word	0x87802010
	.word	0xd4f12090
	.word	0x1000000
	or	%g0, 0x428, %i7
	P_ITLB_TAG_READ
	.word	0xbe8420d0
	.word	0xf4dfd000
thr6_MMU_ASI_SECONDARY_LITTLE_377:
	.word	0x87802089
	.word	0xd4bc69d0
	.word	0x1000000
	or	%g0, 0x04b, %i7
	P_LOAD_DDATA_IN
	.word	0xfcdc1000
	.word	0xc036e43c
	P_IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	.word	0xe19e82c0
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x208, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x63a, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xc02de569
	.word	0xfe51abce
	.word	0xfc9f5000
	.word	0xd671a070
	.word	0xc021a80c
	.word	0x1000000
	.word	0xbe128000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0xb8, %i7
	P_DTLB_TAG_READ
	nop
	.word	0xe3995f20
	.word	0xf659a0a0
	.word	0x1000000
	or	%g0, 0x650, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_NCTX
	.word	0xfcdc0200
	.word	0xfcdc42a0
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xfe41a84c
	.word	0x1000000
	or	%g0, 0x015, %i7
	P_LOAD_IDATA_IN
	.word	0xe19942e0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x087, %i7
	P_LOAD_DDATA_IN
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v402_exit:
	EXIT_GOOD
Thr6_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v103 DATA_VA=0x790019c00000
attr_data {
	Name = .Thr6_User_Data_4v103 ,
	VA = 0x790019c00000 ,/* 0x790019ffffc0 */
	RA = 0x01e0800000 ,
	PA = 0x01e0800000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000790019c00ebb 80000001e0800043 */
	end_label   = Thr6_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v103_data_begin
Thr6_User_Data_4v103_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v203 DATA_VA=0x77600017a000
attr_data {
	Name = .Thr6_User_Data_4v203 ,
	VA = 0x77600017a000 ,/* 0x77600017bfc0 */
	RA = 0x00e01b0000 ,
	PA = 0x6ce01b0000 ,
	TTE_Context = 0x0066 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x150000 ,
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
	/* DTTE_TAG_DATA = 000077600017aaa7 8000006ce01b0040 */
	end_label   = Thr6_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v203_data_begin
Thr6_User_Data_4v203_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v303 DATA_VA=0x7a0e20000000
attr_data {
	Name = .Thr6_User_Data_4v303 ,
	VA = 0x7a0e20000000 ,/* 0x7a0e2fffffc0 */
	RA = 0x0150000000 ,
	PA = 0x6d50000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x190000 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 00007a0e20000000 8000006d50000045 */
	end_label   = Thr6_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v303_data_begin
Thr6_User_Data_4v303_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v006 TEXT_VA=0x780000220000
attr_text {
	Name = .Thr6_User_Text_4v006 ,
	VA = 0x780000220000 ,/* 0x78000022ffc0 */
	RA = 0x0020400000 ,
	PA = 0x6420400000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* ITTE_TAG_DATA = 0000780000220ebb 8000006420400481 */
	end_label   = Thr6_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v006_text_begin
Thr6_User_Text_4v006_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr6_User_Text_4v006_exit
	nop
	.word	0xee5aa048
	DDEMAP_ALL_PAGES
	.word	0xbe842060
	.word	0xc39fde00
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0xc0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x181, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_LITTLE_378:
	.word	0x87802088
	.word	0xd0f6a028
	.word	0x1000000
	or	%g0, 0x076, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x72a, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5e8, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_LITTLE_379:
	.word	0x87802088
	.word	0xdaf0a0c8
	.word	0xf670a018
	.word	0xc02f6a23
	.word	0x1000000
	or	%g0, 0x095, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_380:
	.word	0x87802080
	.word	0xcef12050
	.word	0xc07123d8
	.word	0x1000000
	or	%g0, 0x076, %i7
	LOAD_IDATA_IN
	IDEMAP_ALL_PAGES
thr6_MMU_ASI_PRIMARY_381:
	.word	0x87802080
	.word	0xe4f0a018
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe6776050
	.word	0xc026aadc
	DDEMAP_NCTX
	ACCESS_DTSB_PTR
	.word	0xfc9add60
	.word	0xfcdc5020
	.word	0x1000000
	or	%g0, 0x1f8, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	.word	0xc45d6090
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe07560e0
	.word	0xc0292827
	nop
	nop
	.word	0xfcdf5000
	.word	0xfe42ae40
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x110, %i7
	DTLB_TAG_READ
	nop
	nop
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc02c2ae4
thr6_MMU_ASI_PRIMARY_382:
	.word	0x87802080
	.word	0xdaf56020
	.word	0xc0342740
	.word	0xf876a0c8
	.word	0xc0256f08
	.word	0xfcda9000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xea5f6148
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v006_exit:
	EXIT_GOOD
Thr6_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v403 TEXT_VA=0x790003800000
attr_text {
	Name = .Thr6_User_Text_4v403 ,
	VA = 0x790003800000 ,/* 0x790003bfffc0 */
	RA = 0x01e2400000 ,
	PA = 0x01e2400000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr6_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x0a0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 0 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 0000790003800000 80000001e2400083 */
	end_label   = Thr6_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v403_text_begin
Thr6_User_Text_4v403_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x10, %i7
	P_ITLB_TAG_READ
	.word	0xe05ca130
	.word	0xce76e020
	.word	0xc02ca3ec
	.word	0xc025ef90
	P_DDEMAP_SCTX
	.word	0xfcdc1000
	.word	0xe874a058
	.word	0xc071a8e8
thr6_MMU_ASI_AS_IF_USER_PRIMARY_383:
	.word	0x87802010
	.word	0xf8f420a8
	nop
	.word	0xfe54ad0a
	.word	0x1000000
	or	%g0, 0x35, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe80a008
	.word	0xc8dfc200
	.word	0xfe44a5cc
	.word	0xfc9dc480
	.word	0xbe82e010
	.word	0xcadfc220
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	P_READ_DDATA_ACCESS
	.word	0xc024a23c
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_384:
	.word	0x8780202b
	.word	0xf0bda810
	.word	0x1000000
	or	%g0, 0x509, %i7
	P_LOAD_DDATA_ACCESS
thr6_MMU_ASI_AS_IF_USER_PRIMARY_385:
	.word	0x87802010
	.word	0xeaf76068
	.word	0x1000000
	or	%g0, 0x640, %i7
	P_READ_DDATA_ACCESS
	.word	0xec5ca010
	P_IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x6bf, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe8420b8
	.word	0xf4dfd000
	.word	0xbe842038
	.word	0xe0dfd000
thr6_MMU_ASI_AS_IF_USER_PRIMARY_386:
	.word	0x87802010
	.word	0xdef560d8
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	P_ITLB_TAG_READ
	.word	0xfcda8200
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v403_exit:
	EXIT_GOOD
Thr6_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v104 DATA_VA=0x790038800000
attr_data {
	Name = .Thr6_User_Data_4v104 ,
	VA = 0x790038800000 ,/* 0x790038bfffc0 */
	RA = 0x01e1000000 ,
	PA = 0x01e1000000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000790038800ebb 80000001e1000043 */
	end_label   = Thr6_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v104_data_begin
Thr6_User_Data_4v104_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v304 DATA_VA=0x7760001a2000
attr_data {
	Name = .Thr6_User_Data_4v304 ,
	VA = 0x7760001a2000 ,/* 0x7760001a3fc0 */
	RA = 0x00e015a000 ,
	PA = 0x6ce015a000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x190000 ,
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
	/* DTTE_TAG_DATA = 00007760001a2000 8000006ce015a040 */
	end_label   = Thr6_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v304_data_begin
Thr6_User_Data_4v304_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v007 TEXT_VA=0x776000048000
attr_text {
	Name = .Thr6_User_Text_4v007 ,
	VA = 0x776000048000 ,/* 0x776000049fc0 */
	RA = 0x00e015e000 ,
	PA = 0x6ce015e000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* ITTE_TAG_DATA = 0000776000049a67 8000006ce015e480 */
	end_label   = Thr6_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v007_text_begin
Thr6_User_Text_4v007_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr6_User_Text_4v007_exit
	nop
	.word	0xca5aa010
	.word	0xfcda9000
	.word	0xca742098
	.word	0xc02aa158
	.word	0x1000000
	or	%g0, 0x065, %i7
	LOAD_IDATA_IN
	.word	0xfcda9000
	.word	0xea5c20d0
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_RPAGES
	.word	0xfe556ed0
	.word	0xbe876090
	.word	0xe0dfd000
	TOGGLE_LSU_DM
	.word	0xc036a2c6
	.word	0xc0742570
thr6_MMU_ASI_PRIMARY_387:
	.word	0x87802080
	.word	0xc6f2a0a8
	.word	0x1000000
	or	%g0, 0x7b1, %i7
	LOAD_DDATA_ACCESS
	.word	0xcc756018
	.word	0xc037681a
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x140, %i7
	LOAD_DDATA_ACCESS
	.word	0xd85d60a0
thr6_MMU_ASI_PRIMARY_388:
	.word	0x87802080
	.word	0xcaf42040
	.word	0x1000000
	or	%g0, 0x120, %i7
	ITLB_TAG_READ
	.word	0xfe5d6f30
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc85c2068
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v007_exit:
	EXIT_GOOD
Thr6_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v105 DATA_VA=0x780000fd0000
attr_data {
	Name = .Thr6_User_Data_4v105 ,
	VA = 0x780000fd0000 ,/* 0x780000fdffc0 */
	RA = 0x0020b70000 ,
	PA = 0x6420b70000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000780000fd0ebb 8000006420b70041 */
	end_label   = Thr6_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v105_data_begin
Thr6_User_Data_4v105_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v008 TEXT_VA=0x780000260000
attr_text {
	Name = .Thr6_User_Text_4v008 ,
	VA = 0x780000260000 ,/* 0x78000026ffc0 */
	RA = 0x0020660000 ,
	PA = 0x6420660000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* ITTE_TAG_DATA = 0000780000260ebb 8000006420660481 */
	end_label   = Thr6_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v008_text_begin
Thr6_User_Text_4v008_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr6_User_Text_4v008_exit
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0xfe4f6838
	.word	0xf65ea018
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x3b8, %i7
	READ_DDATA_ACCESS
	DDEMAP_NCTX
thr6_MMU_ASI_PRIMARY_389:
	.word	0x87802080
	.word	0xf8f42000
	.word	0xfe5eab40
	.word	0x1000000
	or	%g0, 0x010, %i7
	LOAD_DDATA_IN
	.word	0xc0356316
	.word	0xfcda9000
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x5b8, %i7
	DTLB_TAG_READ
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe476898
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0756370
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_SCTX
thr6_MMU_ASI_PRIMARY_390:
	.word	0x87802080
	.word	0xdcf2a028
thr6_MMU_ASI_BLK_S_391:
	.word	0x878020f1
	.word	0xe1bda740
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x8, %i7
	READ_IDATA_ACCESS
	.word	0xfe4d6c76
	.word	0xc07762c8
	.word	0xd45920d0
	.word	0xc45c20b8
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe144000
	IDEMAP_RPAGE
	.word	0xd876a0a0
	.word	0xc0356782
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9a9000
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_392:
	.word	0x87802080
	.word	0xf6f42048
	TOGGLE_LSU_IM
	.word	0xbe842090
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5d0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe148000
	IDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x017, %i7
	LOAD_IDATA_IN
	.word	0xca5c2098
thr6_MMU_ASI_BLK_COMMIT_P_393:
	.word	0x878020e0
	.word	0xc3bc2540
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe0742008
	.word	0xc02aab79
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v008_exit:
	EXIT_GOOD
Thr6_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v106 DATA_VA=0x790001c00000
attr_data {
	Name = .Thr6_User_Data_4v106 ,
	VA = 0x790001c00000 ,/* 0x790001ffffc0 */
	RA = 0x01e3400000 ,
	PA = 0x01e3400000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000790001c00ebb 80000001e3400043 */
	end_label   = Thr6_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v106_data_begin
Thr6_User_Data_4v106_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v009 TEXT_VA=0x780000430000
attr_text {
	Name = .Thr6_User_Text_4v009 ,
	VA = 0x780000430000 ,/* 0x78000043ffc0 */
	RA = 0x00207a0000 ,
	PA = 0x64207a0000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* ITTE_TAG_DATA = 0000780000430ebb 80000064207a0481 */
	end_label   = Thr6_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v009_text_begin
Thr6_User_Text_4v009_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr6_User_Text_4v009_exit
	nop
	.word	0x1000000
	or	%g0, 0x05a, %i7
	LOAD_IDATA_IN
thr6_MMU_ASI_BLK_P_394:
	.word	0x878020f0
	.word	0xc1beae80
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4aab72
	nop
	nop
	nop
	nop
	nop
	.word	0xfcde9000
	.word	0xfcdd5000
	.word	0x1000000
	or	%g0, 0x134, %i7
	LOAD_DDATA_ACCESS
	.word	0xc022ae4c
	.word	0xee70a018
	.word	0xc0312572
	.word	0x1000000
	or	%g0, 0x2c0, %i7
	READ_DDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x5f0, %i7
	DTLB_TAG_READ
thr6_MMU_ASI_PRIMARY_395:
	.word	0x87802080
	.word	0xd0f56028
	.word	0xc1991e00
	DDEMAP_NCTX
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x5b1, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe138000
	GOTO_SUPERVISOR1
	ACCESS_ITSB_PTR
	.word	0xf45920d0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf4742110
	.word	0xc0242bc4
	DDEMAP_SCTX
	ACCESS_ITSB_PTR
	IDEMAP_ALL_PAGES
	IDEMAP_ALL_PAGES
	.word	0xbe8760f0
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x0ac, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x589, %i7
	LOAD_IDATA_ACCESS
	.word	0xe05ea038
	.word	0xe8712028
	.word	0xc02423d4
	.word	0xe05c2038
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x349, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_ALL_PAGES
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xea5f6100
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v009_exit:
	EXIT_GOOD
Thr6_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v107 DATA_VA=0x776000020000
attr_data {
	Name = .Thr6_User_Data_4v107 ,
	VA = 0x776000020000 ,/* 0x776000021fc0 */
	RA = 0x00e01e0000 ,
	PA = 0x6ce01e0000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000776000021a67 8000006ce01e0040 */
	end_label   = Thr6_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v107_data_begin
Thr6_User_Data_4v107_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00a TEXT_VA=0x776000056000
attr_text {
	Name = .Thr6_User_Text_4v00a ,
	VA = 0x776000056000 ,/* 0x776000057fc0 */
	RA = 0x00e00da000 ,
	PA = 0x6ce00da000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* ITTE_TAG_DATA = 0000776000057a67 8000006ce00da480 */
	end_label   = Thr6_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v00a_text_begin
Thr6_User_Text_4v00a_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr6_User_Text_4v00a_exit
	nop
	.word	0x1000000
	or	%g0, 0x588, %i7
	READ_IDATA_ACCESS
	.word	0xea5ea140
	.word	0xfcd95060
	.word	0x1000000
	or	%g0, 0x438, %i7
	ITLB_TAG_READ
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe108000
	DDEMAP_RPAGE
	.word	0xd85d60c0
	.word	0x1000000
	or	%g0, 0x330, %i7
	DTLB_TAG_READ
	.word	0xfe56aad0
	.word	0x1000000
	or	%g0, 0x570, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc076aec8
	.word	0x1000000
	or	%g0, 0x43a, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x158, %i7
	READ_IDATA_ACCESS
	nop
	DDEMAP_PCTX
	.word	0xfe542c06
	.word	0xc03423e6
	.word	0xd45c2148
	.word	0xd65d6010
	.word	0xd676a040
	.word	0xc0756410
	.word	0x1000000
	or	%g0, 0x58f, %i7
	LOAD_IDATA_ACCESS
	.word	0xc02ea1ad
	.word	0xbe812128
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe11c000
	IDEMAP_PAGE
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x593, %i7
	LOAD_DDATA_ACCESS
	.word	0xea72a068
	.word	0xc0342158
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc03129c4
	nop
thr6_MMU_ASI_PRIMARY_LITTLE_396:
	.word	0x87802088
	.word	0xd6f6a010
	.word	0xc022a62c
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0xbe82a0f0
	.word	0xeadfd000
	.word	0xbe842110
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe100000
	DDEMAP_RPAGE
	.word	0xea5f60b8
thr6_MMU_ASI_BLK_P_397:
	.word	0x878020f0
	.word	0xe1bf6300
thr6_MMU_ASI_PRIMARY_398:
	.word	0x87802080
	.word	0xf6f42018
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe58ac30
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v00a_exit:
	EXIT_GOOD
Thr6_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v108 DATA_VA=0x780000e90000
attr_data {
	Name = .Thr6_User_Data_4v108 ,
	VA = 0x780000e90000 ,/* 0x780000e9ffc0 */
	RA = 0x0020c50000 ,
	PA = 0x6420c50000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000780000e90ebb 8000006420c50041 */
	end_label   = Thr6_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v108_data_begin
Thr6_User_Data_4v108_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00b TEXT_VA=0x7760001e4000
attr_text {
	Name = .Thr6_User_Text_4v00b ,
	VA = 0x7760001e4000 ,/* 0x7760001e5fc0 */
	RA = 0x00e007a000 ,
	PA = 0x6ce007a000 ,
	TTE_Context = 0x0ebb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* ITTE_TAG_DATA = 00007760001e5a67 8000006ce007a480 */
	end_label   = Thr6_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v00b_text_begin
Thr6_User_Text_4v00b_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr6_User_Text_4v00b_exit
	nop
	.word	0xfcdf5000
	.word	0xdc76a028
	.word	0xc035665c
	.word	0x1000000
	or	%g0, 0x58, %i7
	ITLB_TAG_READ
	.word	0xce72a000
	.word	0xc036a5ac
	TOGGLE_LSU_IM
	DDEMAP_ALL_RPAGES
	.word	0xfe48a8cb
	.word	0xfe5c2480
	.word	0xea5c2008
	.word	0xc85f6140
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc02ea6d2
thr6_MMU_ASI_BLK_COMMIT_P_399:
	.word	0x878020e0
	.word	0xc3b8aac0
thr6_MMU_ASI_PRIMARY_400:
	.word	0x87802080
	.word	0xfaf6a0d0
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr6_MMU_ASI_PRIMARY_401:
	.word	0x87802080
	.word	0xdef2a0c8
	.word	0xc028af15
	.word	0xfa7420b8
	.word	0xc026aa98
	.word	0xca72a098
	.word	0xc0776930
	DDEMAP_PCTX
	.word	0xfcda9100
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfcd91000
	.word	0xfc9a9100
	.word	0xde742020
	.word	0xc0742be8
thr6_MMU_ASI_BLK_P_402:
	.word	0x878020f0
	.word	0xe1bc2ac0
	.word	0xc0376df6
	.word	0xc026a158
	.word	0xbe8120b8
	.word	0xd4dfd000
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x488, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe42a244
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v00b_exit:
	EXIT_GOOD
Thr6_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v109 DATA_VA=0x790030800000
attr_data {
	Name = .Thr6_User_Data_4v109 ,
	VA = 0x790030800000 ,/* 0x790030bfffc0 */
	RA = 0x01e1400000 ,
	PA = 0x01e1400000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000790030800ebb 80000001e1400043 */
	end_label   = Thr6_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v109_data_begin
Thr6_User_Data_4v109_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10a DATA_VA=0x7760001d4000
attr_data {
	Name = .Thr6_User_Data_4v10a ,
	VA = 0x7760001d4000 ,/* 0x7760001d5fc0 */
	RA = 0x00e00fa000 ,
	PA = 0x6ce00fa000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 00007760001d5a67 8000006ce00fa040 */
	end_label   = Thr6_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10a_data_begin
Thr6_User_Data_4v10a_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10b DATA_VA=0x77600009c000
attr_data {
	Name = .Thr6_User_Data_4v10b ,
	VA = 0x77600009c000 ,/* 0x77600009dfc0 */
	RA = 0x00e0050000 ,
	PA = 0x6ce0050000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 000077600009da67 8000006ce0050040 */
	end_label   = Thr6_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10b_data_begin
Thr6_User_Data_4v10b_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10c DATA_VA=0x7760001a8000
attr_data {
	Name = .Thr6_User_Data_4v10c ,
	VA = 0x7760001a8000 ,/* 0x7760001a9fc0 */
	RA = 0x00e01f4000 ,
	PA = 0x6ce01f4000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 00007760001a9a67 8000006ce01f4040 */
	end_label   = Thr6_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10c_data_begin
Thr6_User_Data_4v10c_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10d DATA_VA=0x7760001b4000
attr_data {
	Name = .Thr6_User_Data_4v10d ,
	VA = 0x7760001b4000 ,/* 0x7760001b5fc0 */
	RA = 0x00e0112000 ,
	PA = 0x6ce0112000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 00007760001b5a67 8000006ce0112040 */
	end_label   = Thr6_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10d_data_begin
Thr6_User_Data_4v10d_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10e DATA_VA=0x776000190000
attr_data {
	Name = .Thr6_User_Data_4v10e ,
	VA = 0x776000190000 ,/* 0x776000191fc0 */
	RA = 0x00e0004000 ,
	PA = 0x6ce0004000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000776000191a67 8000006ce0004040 */
	end_label   = Thr6_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10e_data_begin
Thr6_User_Data_4v10e_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10f DATA_VA=0x780000860000
attr_data {
	Name = .Thr6_User_Data_4v10f ,
	VA = 0x780000860000 ,/* 0x78000086ffc0 */
	RA = 0x00206f0000 ,
	PA = 0x64206f0000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000780000860ebb 80000064206f0041 */
	end_label   = Thr6_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10f_data_begin
Thr6_User_Data_4v10f_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v110 DATA_VA=0x780000040000
attr_data {
	Name = .Thr6_User_Data_4v110 ,
	VA = 0x780000040000 ,/* 0x78000004ffc0 */
	RA = 0x0020710000 ,
	PA = 0x6420710000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000780000040ebb 8000006420710041 */
	end_label   = Thr6_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v110_data_begin
Thr6_User_Data_4v110_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v111 DATA_VA=0x780000240000
attr_data {
	Name = .Thr6_User_Data_4v111 ,
	VA = 0x780000240000 ,/* 0x78000024ffc0 */
	RA = 0x0020c70000 ,
	PA = 0x6420c70000 ,
	TTE_Context = 0x0ebb ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x030000 ,
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
	/* DTTE_TAG_DATA = 0000780000240ebb 8000006420c70041 */
	end_label   = Thr6_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v111_data_begin
Thr6_User_Data_4v111_data_begin:
	.xword	0x7760001f4000
	.xword	0x780000830000
	.xword	0x7800002a0000
	.xword	0x776000118000
	.xword	0x7760001de000
	.xword	0x780000c70000
	.xword	0x780000ae0000
	.xword	0x780000c80000
	.xword	0x790036c00000
	.xword	0x79001b000000
	.xword	0x776000004000
	.xword	0x7760000ca000
	.xword	0x7a02c0000000
	.xword	0x776000164000
	.xword	0x7800007c0000
	.xword	0x7a0440000000
	.xword	0x7760000fe000
	.xword	0x77600016a000
	.xword	0x790019c00000
	.xword	0x77600017a000
	.xword	0x7a0e20000000
	.xword	0x780000220000
	.xword	0x790003800000
	.xword	0x790038800000
	.xword	0x7760001a2000
	.xword	0x776000048000
	.xword	0x780000fd0000
	.xword	0x780000260000
	.xword	0x790001c00000
	.xword	0x780000430000
	.xword	0x776000020000
	.xword	0x776000056000
	.xword	0x780000e90000
	.xword	0x7760001e4000
	.xword	0x790030800000
	.xword	0x7760001d4000
	.xword	0x77600009c000
	.xword	0x7760001a8000
	.xword	0x7760001b4000
	.xword	0x776000190000
	.xword	0x780000860000
	.xword	0x780000040000
	.xword	0x780000240000
Thr6_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x7b70000de000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	VA = 0x7b70000de000 ,/* 0x7b70000dffc0 */
	RA = 0x00f0018000 ,
	PA = 0x00f0018000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007b70000dfdba 80000000f0018480 */
	end_label   = Thr7_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr7_user_code_entry
Thr7_user_code_entry:
	setx	0x7b7000066000, %g1, %g2
	or	%g0, 12, %g1
	.word	0xc658a000
	.word	0xc858a008
	.word	0xca58a010
	.word	0xcc58a018
	.word	0xce58a020
	.word	0xd058a028
	.word	0xd258a030
	.word	0xd458a038
	.word	0xd658a040
	.word	0xd858a048
	.word	0xda58a050
	.word	0xdc58a058
	.word	0xde58a060
	.word	0xe058a068
	.word	0xe258a070
	.word	0xe458a078
	.word	0xe658a080
	.word	0xe858a088
	.word	0xea58a090
	.word	0xec58a098
	.word	0xee58a0a0
	.word	0xf058a0a8
	.word	0xf258a0b0
	.word	0xf458a0b8
	.word	0xf658a0c0
	.word	0xf858a0c8
	.word	0xfa58a0d0
	.word	0xfc58a0d8
.global Thr7_User_Text_4v000_text_begin
Thr7_User_Text_4v000_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v000_exit
	nop
	.word	0xdc756028
	.word	0xc0742620
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc1995e20
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x498, %i7
	DTLB_TAG_READ
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xbe82a068
	.word	0xeadfd000
	.word	0xde70a108
	.word	0xc072a980
	nop
	nop
	.word	0xf072a020
	.word	0xc072a5c0
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
thr7_MMU_ASI_BLK_COMMIT_P_403:
	.word	0x878020e0
	.word	0xc1bc2c80
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x588, %i7
	ITLB_TAG_READ
	.word	0xfcda9000
	.word	0xe0742068
	.word	0xc02e6ffc
	.word	0xbe856090
	.word	0xeadfd000
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xf25c2090
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v000_exit:
	EXIT_GOOD
Thr7_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v100 DATA_VA=0x7b7000066000
attr_data {
	Name = .Thr7_User_Data_4v100 ,
	VA = 0x7b7000066000 ,/* 0x7b7000067fc0 */
	RA = 0x00f011c000 ,
	PA = 0x00f011c000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b7000067dba 80000000f011c440 */
	end_label   = Thr7_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v100_data_begin
Thr7_User_Data_4v100_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v200 DATA_VA=0x7b700007e000
attr_data {
	Name = .Thr7_User_Data_4v200 ,
	VA = 0x7b700007e000 ,/* 0x7b700007ffc0 */
	RA = 0x00f0104000 ,
	PA = 0x00f0104000 ,
	TTE_Context = 0x1799 ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 00007b700007e764 80000000f0104440 */
	end_label   = Thr7_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v200_data_begin
Thr7_User_Data_4v200_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v300 DATA_VA=0x7c0000660000
attr_data {
	Name = .Thr7_User_Data_4v300 ,
	VA = 0x7c0000660000 ,/* 0x7c000066ffc0 */
	RA = 0x0030c80000 ,
	PA = 0x0030c80000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x130000 ,
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
	/* DTTE_TAG_DATA = 00007c0000660000 8000000030c80041 */
	end_label   = Thr7_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v300_data_begin
Thr7_User_Data_4v300_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v001 TEXT_VA=0x7d003d000000
attr_text {
	Name = .Thr7_User_Text_4v001 ,
	VA = 0x7d003d000000 ,/* 0x7d003d3fffc0 */
	RA = 0x01f3800000 ,
	PA = 0x7df3800000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007d003d001dba 8000007df3800483 */
	end_label   = Thr7_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v001_text_begin
Thr7_User_Text_4v001_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v001_exit
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x130, %i7
	READ_IDATA_ACCESS
	.word	0xcc766018
	.word	0xc02aac17
	.word	0xfe556eca
	.word	0xbe8460b0
	.word	0xc19fde20
	.word	0x1000000
	or	%g0, 0x022, %i7
	LOAD_IDATA_IN
	.word	0xfe4425cc
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_PRIMARY_404:
	.word	0x87802080
	.word	0xccf56078
	.word	0xbe82a160
	.word	0xd4dfd040
	.word	0xc0276538
	.word	0xea72a008
	.word	0xc0742340
	.word	0x1000000
	or	%g0, 0x17, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x660, %i7
	READ_DDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd85d6018
	.word	0xe058a038
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc02d637d
	.word	0xfe592ba8
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf0756158
	.word	0xc032ab1a
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf25aa168
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v001_exit:
	EXIT_GOOD
Thr7_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v400 TEXT_VA=0x7b700014e000
attr_text {
	Name = .Thr7_User_Text_4v400 ,
	VA = 0x7b700014e000 ,/* 0x7b700014ffc0 */
	RA = 0x00f017c000 ,
	PA = 0x7cf017c000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr7_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00007b700014e000 8000007cf017c480 */
	end_label   = Thr7_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v400_text_begin
Thr7_User_Text_4v400_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x54c, %i7
	P_LOAD_IDATA_ACCESS
	P_TOGGLE_LSU_IM
	.word	0xbe8420b0
	.word	0xe0dfc200
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0xe1, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe82a110
	.word	0xeadfd000
	P_DDEMAP_PCTX
	.word	0xbe82a120
	.word	0xd4dfc200
	P_DDEMAP_NCTX
	.word	0xda71a030
	.word	0xc036ebd8
	.word	0x1000000
	.word	0xbe114000
	P_DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe856090
	.word	0xd4dfd000
thr7_MMU_ASI_AS_IF_USER_PRIMARY_405:
	.word	0x87802010
	.word	0xcaf76040
	.word	0x1000000
	or	%g0, 0xb, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x2b, %i7
	P_LOAD_IDATA_ACCESS
thr7_MMU_ASI_AS_IF_USER_PRIMARY_406:
	.word	0x87802010
	.word	0xd8f12018
	.word	0xbe856090
	.word	0xc8dfc200
	.word	0x1000000
	.word	0xbe14c000
	P_IDEMAP_PAGE
thr7_MMU_ASI_PRIMARY_LITTLE_407:
	.word	0x87802088
	.word	0xf0f56030
	.word	0xfcd90280
	.word	0x1000000
	or	%g0, 0x03f, %i7
	P_LOAD_IDATA_IN
	.word	0xfcdc0200
thr7_MMU_ASI_AS_IF_USER_PRIMARY_408:
	.word	0x87802010
	.word	0xeaf560f0
	.word	0x1000000
	or	%g0, 0x78, %i7
	P_READ_IDATA_ACCESS
thr7_MMU_ASI_BLK_P_409:
	.word	0x878020f0
	.word	0xe3bf6c40
	.word	0x1000000
	or	%g0, 0x790, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe13c000
	P_DDEMAP_RPAGE
thr7_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_410:
	.word	0x87802018
	.word	0xe6f2a060
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x011, %i7
	P_LOAD_IDATA_IN
thr7_MMU_ASI_PRIMARY_411:
	.word	0x87802080
	.word	0xd2f42148
	.word	0x1000000
	or	%g0, 0x09f, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x534, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
thr7_MMU_ASI_AS_IF_USER_PRIMARY_412:
	.word	0x87802010
	.word	0xf8f2a030
	.word	0xfc9b04c0
	.word	0x1000000
	or	%g0, 0x573, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v400_exit:
	EXIT_GOOD
Thr7_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v002 TEXT_VA=0x7c0000cb0000
attr_text {
	Name = .Thr7_User_Text_4v002 ,
	VA = 0x7c0000cb0000 ,/* 0x7c0000cbffc0 */
	RA = 0x00307e0000 ,
	PA = 0x74307e0000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00007c0000cb1dba 80000074307e0481 */
	end_label   = Thr7_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v002_text_begin
Thr7_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0xfe566c1e
	.word	0xfcdd8380
	.word	0x1000000
	or	%g0, 0x188, %i7
	P_READ_DDATA_ACCESS
	P_IDEMAP_NCTX
	.word	0xbe85a010
	.word	0xf4dfd020
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	P_READ_IDATA_ACCESS
	P_DDEMAP_PCTX
	nop
	nop
	nop
	nop
thr7_MMU_ASI_PRIMARY_413:
	.word	0x87802080
	.word	0xeaf2a120
thr7_MMU_ASI_AS_IF_USER_PRIMARY_414:
	.word	0x87802010
	.word	0xe2f56098
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe154000
	P_DDEMAP_RPAGE
	.word	0xd45aa090
thr7_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_415:
	.word	0x87802022
	.word	0xf8b923a0
	P_DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_ALL_RPAGES
	.word	0xc19c5f20
	P_TOGGLE_LSU_IM
	.word	0xbe876160
	.word	0xf2dfd000
	.word	0xfe5665e4
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_BLK_COMMIT_P_416:
	.word	0x878020e0
	.word	0xc3bd69c0
	P_IDEMAP_ALL
	.word	0xfc9f5d40
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x055, %i7
	P_LOAD_DDATA_IN
	.word	0xc19d83e0
	.word	0xfe42a7d8
	P_ACCESS_ITSB_PTR
	.word	0xfcde8220
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr7_User_Text_4v002_exit:
	EXIT_GOOD
Thr7_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v101 DATA_VA=0x7b7000126000
attr_data {
	Name = .Thr7_User_Data_4v101 ,
	VA = 0x7b7000126000 ,/* 0x7b7000127fc0 */
	RA = 0x00f0180000 ,
	PA = 0x00f0180000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b7000127dba 80000000f0180440 */
	end_label   = Thr7_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v101_data_begin
Thr7_User_Data_4v101_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v201 DATA_VA=0x7d0000400000
attr_data {
	Name = .Thr7_User_Data_4v201 ,
	VA = 0x7d0000400000 ,/* 0x7d00007fffc0 */
	RA = 0x01f1800000 ,
	PA = 0x7df1800000 ,
	TTE_Context = 0x1799 ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 00007d0000400764 8000007df1800443 */
	end_label   = Thr7_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v201_data_begin
Thr7_User_Data_4v201_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v301 DATA_VA=0x7c0000600000
attr_data {
	Name = .Thr7_User_Data_4v301 ,
	VA = 0x7c0000600000 ,/* 0x7c000060ffc0 */
	RA = 0x0030030000 ,
	PA = 0x0030030000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x130000 ,
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
	/* DTTE_TAG_DATA = 00007c0000600000 8000000030030041 */
	end_label   = Thr7_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v301_data_begin
Thr7_User_Data_4v301_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v003 TEXT_VA=0x7c0000780000
attr_text {
	Name = .Thr7_User_Text_4v003 ,
	VA = 0x7c0000780000 ,/* 0x7c000078ffc0 */
	RA = 0x0030b80000 ,
	PA = 0x7430b80000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007c0000781dba 8000007430b80481 */
	end_label   = Thr7_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v003_text_begin
Thr7_User_Text_4v003_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v003_exit
	nop
	.word	0x1000000
	or	%g0, 0x618, %i7
	DTLB_TAG_READ
	.word	0xfcdc5160
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x5eb, %i7
	LOAD_IDATA_ACCESS
thr7_MMU_ASI_PRIMARY_417:
	.word	0x87802080
	.word	0xcaf56098
	.word	0x1000000
	or	%g0, 0x568, %i7
	ITLB_TAG_READ
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	ITLB_TAG_READ
	.word	0xc0242990
	.word	0xc07765d8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5aa478
	.word	0xc022a7e0
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x18d, %i7
	LOAD_IDATA_ACCESS
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	.word	0xbe856068
	.word	0xf2dfd000
	.word	0xfc9d5c40
	.word	0xee766078
	.word	0xc070a170
	.word	0xfe52a866
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x06b, %i7
	LOAD_DDATA_IN
	ACCESS_DTSB_PTR
	TOGGLE_LSU_DM
	IDEMAP_NCTX
	.word	0xfe52a678
thr7_MMU_ASI_PRIMARY_418:
	.word	0x87802080
	.word	0xdaf12030
	.word	0xfe592240
	DDEMAP_NCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe82a068
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xca5c2010
	.word	0xec756040
	.word	0xc0766e30
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xec5c2010
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v003_exit:
	EXIT_GOOD
Thr7_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v401 TEXT_VA=0x7d0002000000
attr_text {
	Name = .Thr7_User_Text_4v401 ,
	VA = 0x7d0002000000 ,/* 0x7d00023fffc0 */
	RA = 0x01f1c00000 ,
	PA = 0x01f1c00000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 00007d0002000000 80000001f1c00483 */
	end_label   = Thr7_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v401_text_begin
Thr7_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0xfc9ac5c0
	.word	0x1000000
	or	%g0, 0x5a6, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfc9f5c40
	.word	0xfcdc0200
	.word	0xfe54a14a
	P_IDEMAP_NCTX
	P_DDEMAP_ALL
thr7_MMU_ASI_PRIMARY_419:
	.word	0x87802080
	.word	0xd2f12080
	P_TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe144000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v401_exit:
	EXIT_GOOD
Thr7_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v004 TEXT_VA=0x7b700014c000
attr_text {
	Name = .Thr7_User_Text_4v004 ,
	VA = 0x7b700014c000 ,/* 0x7b700014dfc0 */
	RA = 0x00f0006000 ,
	PA = 0x00f0006000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00007b700014ddba 80000000f0006480 */
	end_label   = Thr7_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v004_text_begin
Thr7_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xe8712028
	.word	0xc02664ec
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x05c, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x520, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x62, %i7
	P_LOAD_IDATA_ACCESS
	P_DDEMAP_PCTX
	.word	0xfcde4200
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x04a, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	P_READ_IDATA_ACCESS
	.word	0xc03669a0
	.word	0xfe4aa709
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x558, %i7
	P_READ_DDATA_ACCESS
thr7_MMU_ASI_AS_IF_USER_PRIMARY_420:
	.word	0x87802010
	.word	0xfaf2a038
	P_IDEMAP_NCTX
thr7_MMU_ASI_PRIMARY_421:
	.word	0x87802080
	.word	0xe0f2a0d0
	P_DDEMAP_ALL_PAGES
	P_IDEMAP_NCTX
	.word	0xbe82a160
	.word	0xfadfc200
	P_IDEMAP_ALL_PAGES
	.word	0xfe4768ec
	.word	0x1000000
	or	%g0, 0xb0, %i7
	P_READ_IDATA_ACCESS
	.word	0xfc998580
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr7_User_Text_4v004_exit:
	EXIT_GOOD
Thr7_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v102 DATA_VA=0x7b70001d0000
attr_data {
	Name = .Thr7_User_Data_4v102 ,
	VA = 0x7b70001d0000 ,/* 0x7b70001d1fc0 */
	RA = 0x00f000e000 ,
	PA = 0x00f000e000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b70001d1dba 80000000f000e440 */
	end_label   = Thr7_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v102_data_begin
Thr7_User_Data_4v102_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v202 DATA_VA=0x7c0000e20000
attr_data {
	Name = .Thr7_User_Data_4v202 ,
	VA = 0x7c0000e20000 ,/* 0x7c0000e2ffc0 */
	RA = 0x00302d0000 ,
	PA = 0x74302d0000 ,
	TTE_Context = 0x1799 ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 00007c0000e20764 80000074302d0441 */
	end_label   = Thr7_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v202_data_begin
Thr7_User_Data_4v202_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v302 DATA_VA=0x7e0d40000000
attr_data {
	Name = .Thr7_User_Data_4v302 ,
	VA = 0x7e0d40000000 ,/* 0x7e0d4fffffc0 */
	RA = 0x0270000000 ,
	PA = 0x7e70000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x130000 ,
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
	/* DTTE_TAG_DATA = 00007e0d40000000 8000007e70000045 */
	end_label   = Thr7_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v302_data_begin
Thr7_User_Data_4v302_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v005 TEXT_VA=0x7b7000128000
attr_text {
	Name = .Thr7_User_Text_4v005 ,
	VA = 0x7b7000128000 ,/* 0x7b7000129fc0 */
	RA = 0x00f0186000 ,
	PA = 0x00f0186000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007b7000129dba 80000000f0186480 */
	end_label   = Thr7_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v005_text_begin
Thr7_User_Text_4v005_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v005_exit
	nop
	.word	0xfcdd5000
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x1d, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe168000
	DDEMAP_RPAGE
thr7_MMU_ASI_PRIMARY_422:
	.word	0x87802080
	.word	0xfaf76068
thr7_MMU_ASI_BLK_COMMIT_P_423:
	.word	0x878020e0
	.word	0xe1bd6780
	.word	0xc0766a40
thr7_MMU_ASI_PRIMARY_424:
	.word	0x87802080
	.word	0xcaf76098
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x418, %i7
	READ_DDATA_ACCESS
	.word	0xfe576576
thr7_MMU_ASI_PRIMARY_425:
	.word	0x87802080
	.word	0xc6f12080
	.word	0xf25c2090
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr7_MMU_ASI_PRIMARY_LITTLE_426:
	.word	0x87802088
	.word	0xc8f56038
	nop
	nop
	.word	0x1000000
	or	%g0, 0x448, %i7
	ITLB_TAG_READ
thr7_MMU_ASI_PRIMARY_427:
	.word	0x87802080
	.word	0xf6f66018
	.word	0xfe4e6d83
	IDEMAP_ALL
thr7_MMU_ASI_PRIMARY_428:
	.word	0x87802080
	.word	0xd8f56018
	.word	0x1000000
	or	%g0, 0x002, %i7
	LOAD_IDATA_IN
	.word	0xca5e6010
	.word	0xe0712068
	.word	0xc0376dde
	DDEMAP_ALL_PAGES
	.word	0xd2712060
	.word	0xc02762d0
	TOGGLE_LSU_IM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xe672a0a8
	.word	0xc0242f80
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc02121a0
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x04c, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x76a, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x7a, %i7
	LOAD_IDATA_ACCESS
	.word	0xc0242d58
	.word	0xf65d60a0
	ACCESS_ITSB_PTR
	IDEMAP_PCTX
	.word	0xc0776c88
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe42ad6c
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v005_exit:
	EXIT_GOOD
Thr7_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v402 TEXT_VA=0x7b70000b8000
attr_text {
	Name = .Thr7_User_Text_4v402 ,
	VA = 0x7b70000b8000 ,/* 0x7b70000b9fc0 */
	RA = 0x00f0158000 ,
	PA = 0x7cf0158000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr7_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00007b70000b8000 8000007cf0158480 */
	end_label   = Thr7_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v402_text_begin
Thr7_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xe45ee018
	nop
	nop
thr7_MMU_ASI_AS_IF_USER_PRIMARY_429:
	.word	0x87802010
	.word	0xdef0a0f8
	.word	0x1000000
	or	%g0, 0x79e, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfc9885c0
	P_IDEMAP_ALL
thr7_MMU_ASI_PRIMARY_430:
	.word	0x87802080
	.word	0xf6f2a018
	.word	0xbe82a068
	.word	0xfadfc200
	nop
	nop
	nop
	nop
	nop
	.word	0xbe856090
	.word	0xfadfc200
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x108, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe178000
	P_DDEMAP_PAGE
thr7_MMU_ASI_BLK_PL_431:
	.word	0x878020f8
	.word	0xe1bd6840
	.word	0x1000000
	.word	0xbe134000
	P_IDEMAP_PAGE
	.word	0xc85b2120
	P_DDEMAP_ALL_RPAGES
	P_IDEMAP_ALL
	.word	0xfe4ee87f
	.word	0x1000000
	.word	0xbe11c000
	P_DDEMAP_RPAGE
	nop
	nop
	nop
	.word	0xfe5de6e0
	P_DDEMAP_NCTX
	.word	0xfcde4200
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x540, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_NCTX
	.word	0xe39ac3e0
thr7_MMU_ASI_PRIMARY_432:
	.word	0x87802080
	.word	0xe0f66090
	.word	0x1000000
	.word	0xbe158000
	P_IDEMAP_PAGE
thr7_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_433:
	.word	0x8780202b
	.word	0xfcbda170
	P_TOGGLE_LSU_DM
	.word	0xfcdf5000
	.word	0xc031aa5e
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x04d, %i7
	P_LOAD_IDATA_IN
thr7_MMU_ASI_AS_IF_USER_PRIMARY_434:
	.word	0x87802010
	.word	0xecf2a010
	P_DDEMAP_ALL_RPAGES
	.word	0xc675e0a8
	.word	0xc034a61c
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v402_exit:
	EXIT_GOOD
Thr7_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v103 DATA_VA=0x7b700000c000
attr_data {
	Name = .Thr7_User_Data_4v103 ,
	VA = 0x7b700000c000 ,/* 0x7b700000dfc0 */
	RA = 0x00f0094000 ,
	PA = 0x00f0094000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b700000ddba 80000000f0094440 */
	end_label   = Thr7_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v103_data_begin
Thr7_User_Data_4v103_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v203 DATA_VA=0x7c00005a0000
attr_data {
	Name = .Thr7_User_Data_4v203 ,
	VA = 0x7c00005a0000 ,/* 0x7c00005affc0 */
	RA = 0x0030810000 ,
	PA = 0x7430810000 ,
	TTE_Context = 0x1799 ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 00007c00005a0764 8000007430810441 */
	end_label   = Thr7_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v203_data_begin
Thr7_User_Data_4v203_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v303 DATA_VA=0x7d000d400000
attr_data {
	Name = .Thr7_User_Data_4v303 ,
	VA = 0x7d000d400000 ,/* 0x7d000d7fffc0 */
	RA = 0x01f2000000 ,
	PA = 0x01f2000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x130000 ,
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
	/* DTTE_TAG_DATA = 00007d000d400000 80000001f2000043 */
	end_label   = Thr7_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v303_data_begin
Thr7_User_Data_4v303_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v006 TEXT_VA=0x7b70001ec000
attr_text {
	Name = .Thr7_User_Text_4v006 ,
	VA = 0x7b70001ec000 ,/* 0x7b70001edfc0 */
	RA = 0x00f0028000 ,
	PA = 0x00f0028000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007b70001eddba 80000000f0028480 */
	end_label   = Thr7_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v006_text_begin
Thr7_User_Text_4v006_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v006_exit
	nop
	.word	0xe872a028
	.word	0xc022a820
	nop
	nop
	nop
	nop
thr7_MMU_ASI_PRIMARY_LITTLE_435:
	.word	0x87802088
	.word	0xc4f2a090
	.word	0xbe856068
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0xda, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_PCTX
thr7_MMU_ASI_BLK_COMMIT_P_436:
	.word	0x878020e0
	.word	0xc1be6140
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5fc, %i7
	LOAD_DDATA_ACCESS
thr7_MMU_ASI_BLK_COMMIT_P_437:
	.word	0x878020e0
	.word	0xe1bc2700
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_NCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0xf25c2038
	nop
	nop
	nop
	nop
	nop
	.word	0xe67420c8
	.word	0xc0366d10
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x2c8, %i7
	READ_DDATA_ACCESS
	ACCESS_ITSB_PTR
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe25e60b8
	IDEMAP_ALL
thr7_MMU_ASI_PRIMARY_438:
	.word	0x87802080
	.word	0xd8f2a018
	.word	0x1000000
	or	%g0, 0x4ed, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcdc1000
	.word	0xda756128
	.word	0xc07422a0
	.word	0x1000000
	or	%g0, 0x88, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfc9a9000
	.word	0xd8592018
	.word	0xfe476b88
	.word	0xc02c2f94
	IDEMAP_NCTX
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_RPAGE
	.word	0xfcde5000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe05e60b0
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v006_exit:
	EXIT_GOOD
Thr7_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v104 DATA_VA=0x7d0009c00000
attr_data {
	Name = .Thr7_User_Data_4v104 ,
	VA = 0x7d0009c00000 ,/* 0x7d0009ffffc0 */
	RA = 0x01f3c00000 ,
	PA = 0x7df3c00000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007d0009c01dba 8000007df3c00443 */
	end_label   = Thr7_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v104_data_begin
Thr7_User_Data_4v104_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v204 DATA_VA=0x7b7000006000
attr_data {
	Name = .Thr7_User_Data_4v204 ,
	VA = 0x7b7000006000 ,/* 0x7b7000007fc0 */
	RA = 0x00f0008000 ,
	PA = 0x00f0008000 ,
	TTE_Context = 0x1799 ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
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
	/* DTTE_TAG_DATA = 00007b7000006764 80000000f0008440 */
	end_label   = Thr7_User_Data_4v204_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v204_data_begin
Thr7_User_Data_4v204_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v204_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v304 DATA_VA=0x7c0000db0000
attr_data {
	Name = .Thr7_User_Data_4v304 ,
	VA = 0x7c0000db0000 ,/* 0x7c0000dbffc0 */
	RA = 0x0030020000 ,
	PA = 0x0030020000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x130000 ,
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
	/* DTTE_TAG_DATA = 00007c0000db0000 8000000030020041 */
	end_label   = Thr7_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v304_data_begin
Thr7_User_Data_4v304_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v007 TEXT_VA=0x7b70001ea000
attr_text {
	Name = .Thr7_User_Text_4v007 ,
	VA = 0x7b70001ea000 ,/* 0x7b70001ebfc0 */
	RA = 0x00f0188000 ,
	PA = 0x00f0188000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007b70001ebdba 80000000f0188480 */
	end_label   = Thr7_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v007_text_begin
Thr7_User_Text_4v007_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v007_exit
	nop
	.word	0xbe856090
	.word	0xeadfd000
	nop
	.word	0x1000000
	or	%g0, 0x043, %i7
	LOAD_IDATA_IN
	ACCESS_DTSB_PTR
	TOGGLE_LSU_DM
	.word	0xfe5c2a50
	.word	0xcc5c2018
	.word	0xc0776c90
	DDEMAP_ALL
	IDEMAP_NCTX
	.word	0xc0256ccc
	DDEMAP_SCTX
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	READ_DDATA_ACCESS
	DDEMAP_NCTX
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0xa8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x6b0, %i7
	DTLB_TAG_READ
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x228, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe07420e0
	.word	0xc032a2d2
	nop
	nop
	.word	0x1000000
	or	%g0, 0x80, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_BLK_P_439:
	.word	0x878020f0
	.word	0xc1baa840
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe556fc0
	DDEMAP_ALL_RPAGES
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xde756108
	.word	0xc0212b04
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v007_exit:
	EXIT_GOOD
Thr7_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v105 DATA_VA=0x7b7000170000
attr_data {
	Name = .Thr7_User_Data_4v105 ,
	VA = 0x7b7000170000 ,/* 0x7b7000171fc0 */
	RA = 0x00f0082000 ,
	PA = 0x00f0082000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b7000171dba 80000000f0082440 */
	end_label   = Thr7_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v105_data_begin
Thr7_User_Data_4v105_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v008 TEXT_VA=0x7b70001f6000
attr_text {
	Name = .Thr7_User_Text_4v008 ,
	VA = 0x7b70001f6000 ,/* 0x7b70001f7fc0 */
	RA = 0x00f013a000 ,
	PA = 0x00f013a000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007b70001f7dba 80000000f013a480 */
	end_label   = Thr7_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v008_text_begin
Thr7_User_Text_4v008_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v008_exit
	nop
	.word	0xfe40ab5c
	.word	0xc0776df0
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x710, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x458, %i7
	DTLB_TAG_READ
	.word	0xfcdd5000
thr7_MMU_ASI_BLK_P_440:
	.word	0x878020f0
	.word	0xe3b8af80
	.word	0x1000000
	or	%g0, 0x46f, %i7
	LOAD_IDATA_ACCESS
	.word	0xd45f60e0
	.word	0x1000000
	or	%g0, 0x5d8, %i7
	READ_IDATA_ACCESS
	.word	0xfe4aaf48
	.word	0xfe5565d6
	TOGGLE_LSU_IM
	.word	0xf47420b8
	.word	0xc02e68ee
	.word	0xfe54230c
	.word	0x1000000
	or	%g0, 0xd0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	READ_IDATA_ACCESS
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe160000
	DDEMAP_RPAGE
	DDEMAP_ALL_RPAGES
	.word	0xfcdf5000
	.word	0xfe466cf0
	.word	0xfa70a090
	.word	0xc02aa45b
	.word	0xc0242d10
	IDEMAP_ALL_PAGES
	.word	0xd45c2090
	TOGGLE_LSU_IM
	IDEMAP_ALL
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_PAGE
	.word	0xfe52a888
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc030ac50
	.word	0x1000000
	or	%g0, 0xf1, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0256170
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v008_exit:
	EXIT_GOOD
Thr7_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v106 DATA_VA=0x7b7000172000
attr_data {
	Name = .Thr7_User_Data_4v106 ,
	VA = 0x7b7000172000 ,/* 0x7b7000173fc0 */
	RA = 0x00f00dc000 ,
	PA = 0x00f00dc000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b7000173dba 80000000f00dc440 */
	end_label   = Thr7_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v106_data_begin
Thr7_User_Data_4v106_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v009 TEXT_VA=0x7b700000e000
attr_text {
	Name = .Thr7_User_Text_4v009 ,
	VA = 0x7b700000e000 ,/* 0x7b700000ffc0 */
	RA = 0x00f0170000 ,
	PA = 0x00f0170000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007b700000fdba 80000000f0170480 */
	end_label   = Thr7_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v009_text_begin
Thr7_User_Text_4v009_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v009_exit
	nop
	.word	0x1000000
	or	%g0, 0x320, %i7
	DTLB_TAG_READ
thr7_MMU_ASI_PRIMARY_441:
	.word	0x87802080
	.word	0xc6f420c8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x468, %i7
	ITLB_TAG_READ
	.word	0xd85aa078
	.word	0x1000000
	or	%g0, 0x653, %i7
	LOAD_DDATA_ACCESS
	.word	0xf470a070
	.word	0xc0342170
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	READ_IDATA_ACCESS
	.word	0xe39a9e00
	.word	0x1000000
	or	%g0, 0x13c, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe82e010
	.word	0xe2dfd060
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc0756bb8
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v009_exit:
	EXIT_GOOD
Thr7_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v107 DATA_VA=0x7b7000176000
attr_data {
	Name = .Thr7_User_Data_4v107 ,
	VA = 0x7b7000176000 ,/* 0x7b7000177fc0 */
	RA = 0x00f0136000 ,
	PA = 0x00f0136000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b7000177dba 80000000f0136440 */
	end_label   = Thr7_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v107_data_begin
Thr7_User_Data_4v107_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00a TEXT_VA=0x7b7000132000
attr_text {
	Name = .Thr7_User_Text_4v00a ,
	VA = 0x7b7000132000 ,/* 0x7b7000133fc0 */
	RA = 0x00f0048000 ,
	PA = 0x00f0048000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007b7000133dba 80000000f0048480 */
	end_label   = Thr7_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00a_text_begin
Thr7_User_Text_4v00a_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v00a_exit
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe876090
	.word	0xd4dfd000
	.word	0xee7760a0
	.word	0xc0742778
thr7_MMU_ASI_PRIMARY_442:
	.word	0x87802080
	.word	0xc6f42060
	.word	0x1000000
	or	%g0, 0x548, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x446, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0xfcdd5040
	.word	0xfa5e6120
	ACCESS_ITSB_PTR
	TOGGLE_LSU_IM
	.word	0xc02c2655
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe0756160
	.word	0xc0376da4
	.word	0xfa7560d0
	.word	0xc0276ae8
	DDEMAP_ALL
thr7_MMU_ASI_PRIMARY_443:
	.word	0x87802080
	.word	0xf8f66148
	DDEMAP_ALL_PAGES
thr7_MMU_ASI_PRIMARY_444:
	.word	0x87802080
	.word	0xe4f2a078
	.word	0xec776070
	.word	0xc034224c
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x011, %i7
	LOAD_IDATA_IN
	.word	0xc0756610
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x40e, %i7
	LOAD_IDATA_ACCESS
thr7_MMU_ASI_PRIMARY_445:
	.word	0x87802080
	.word	0xc8f660e0
	.word	0xd8712048
	.word	0xc0312ba4
	.word	0xdc766028
	.word	0xc0776418
	.word	0xd65aa010
	.word	0xc070aae0
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe576c7e
	.word	0xfcdd9060
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe4e65f3
	.word	0xe8766028
	.word	0xc0212c98
	.word	0x1000000
	or	%g0, 0x78, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_IM
	nop
	nop
	nop
	.word	0xc02d6751
	.word	0x1000000
	.word	0xbe100000
	IDEMAP_PAGE
	IDEMAP_ALL
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x5f0, %i7
	READ_IDATA_ACCESS
	DDEMAP_PCTX
	.word	0xc0276460
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe8120d0
	.word	0xfadfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe842060
	.word	0xe39fde00
thr7_MMU_ASI_BLK_P_446:
	.word	0x878020f0
	.word	0xe3baa500
	TOGGLE_LSU_DM
	.word	0xc19c1f00
	.word	0xfcdc1000
	.word	0xc0366b44
	DDEMAP_PCTX
	.word	0xc0756170
	.word	0x1000000
	.word	0xbe120000
	IDEMAP_RPAGE
	.word	0xc02f6cd1
	.word	0xfe5c2cb0
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	DDEMAP_ALL_PAGES
thr7_MMU_ASI_BLK_COMMIT_S_447:
	.word	0x878020e1
	.word	0xc1b96dc0
	nop
	DDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd270a118
	.word	0xc02428a4
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00a_exit:
	EXIT_GOOD
Thr7_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v108 DATA_VA=0x7b700003a000
attr_data {
	Name = .Thr7_User_Data_4v108 ,
	VA = 0x7b700003a000 ,/* 0x7b700003bfc0 */
	RA = 0x00f0172000 ,
	PA = 0x00f0172000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b700003bdba 80000000f0172440 */
	end_label   = Thr7_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v108_data_begin
Thr7_User_Data_4v108_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00b TEXT_VA=0x7c0000af0000
attr_text {
	Name = .Thr7_User_Text_4v00b ,
	VA = 0x7c0000af0000 ,/* 0x7c0000afffc0 */
	RA = 0x0030b30000 ,
	PA = 0x7430b30000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007c0000af1dba 8000007430b30481 */
	end_label   = Thr7_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00b_text_begin
Thr7_User_Text_4v00b_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v00b_exit
	nop
	.word	0xd85f6018
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
thr7_MMU_ASI_BLK_COMMIT_S_448:
	.word	0x878020e1
	.word	0xc1bc6580
	.word	0xc032aeac
	TOGGLE_LSU_IM
	.word	0xfcdad020
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
thr7_MMU_ASI_BLK_P_449:
	.word	0x878020f0
	.word	0xc1baaf00
	IDEMAP_PCTX
	.word	0xcc5aa078
	.word	0x1000000
	or	%g0, 0x084, %i7
	LOAD_DDATA_IN
thr7_MMU_ASI_PRIMARY_450:
	.word	0x87802080
	.word	0xc8f76120
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xbe82a130
	.word	0xc19fde00
	.word	0xde72a0f8
	.word	0xc02e65cc
	TOGGLE_LSU_IM
	ACCESS_ITSB_PTR
	.word	0xfcdc1000
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x778, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_RPAGES
	.word	0xbe82a038
	.word	0xeadfd000
	DDEMAP_ALL_RPAGES
	.word	0xc0376b16
	.word	0x1000000
	or	%g0, 0x4e0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe144000
	DDEMAP_RPAGE
thr7_MMU_ASI_BLK_PL_451:
	.word	0x878020f8
	.word	0xc3baa640
	.word	0x1000000
	or	%g0, 0x14d, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfa5aa090
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00b_exit:
	EXIT_GOOD
Thr7_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v109 DATA_VA=0x7b700011c000
attr_data {
	Name = .Thr7_User_Data_4v109 ,
	VA = 0x7b700011c000 ,/* 0x7b700011dfc0 */
	RA = 0x00f011e000 ,
	PA = 0x00f011e000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b700011ddba 80000000f011e440 */
	end_label   = Thr7_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v109_data_begin
Thr7_User_Data_4v109_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00c TEXT_VA=0x7e08b0000000
attr_text {
	Name = .Thr7_User_Text_4v00c ,
	VA = 0x7e08b0000000 ,/* 0x7e08bfffffc0 */
	RA = 0x0170000000 ,
	PA = 0x7d70000000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007e08b0001cad 8000007d70000485 */
	end_label   = Thr7_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00c_text_begin
Thr7_User_Text_4v00c_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v00c_exit
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x053, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc03429e6
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd472a090
	.word	0xc02d6ff2
	.word	0xfc9adc60
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xde72a0a8
	.word	0xc031287a
	.word	0xca72a070
	.word	0xc02aadf8
	.word	0xd6756010
	.word	0xc03425ba
	.word	0x1000000
	or	%g0, 0x63f, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe4aa910
	.word	0xcc5aa018
	.word	0x1000000
	or	%g0, 0x4d8, %i7
	DTLB_TAG_READ
	.word	0xbe856038
	.word	0xc8dfd000
	DDEMAP_ALL_RPAGES
	.word	0xfe5d6af0
	.word	0x1000000
	.word	0xbe120000
	DDEMAP_RPAGE
	.word	0xfcdc1000
	DDEMAP_ALL_RPAGES
	DDEMAP_ALL_RPAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd872a018
	.word	0xc0356b3e
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v00c_exit:
	EXIT_GOOD
Thr7_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10a DATA_VA=0x7b7000014000
attr_data {
	Name = .Thr7_User_Data_4v10a ,
	VA = 0x7b7000014000 ,/* 0x7b7000015fc0 */
	RA = 0x00f018a000 ,
	PA = 0x00f018a000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b7000015dba 80000000f018a440 */
	end_label   = Thr7_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10a_data_begin
Thr7_User_Data_4v10a_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00d TEXT_VA=0x7b7000156000
attr_text {
	Name = .Thr7_User_Text_4v00d ,
	VA = 0x7b7000156000 ,/* 0x7b7000157fc0 */
	RA = 0x00f0020000 ,
	PA = 0x00f0020000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007b7000157dba 80000000f0020480 */
	end_label   = Thr7_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00d_text_begin
Thr7_User_Text_4v00d_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v00d_exit
	nop
	ACCESS_ITSB_PTR
	.word	0xd65d6070
	.word	0xfcdd5000
	.word	0xfcdc1040
	.word	0xea5c2130
	.word	0xfe4aa152
thr7_MMU_ASI_PRIMARY_452:
	.word	0x87802080
	.word	0xd2f660a8
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe170000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x1e, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_PCTX
	.word	0xc0766e78
	.word	0xfcde5000
	.word	0xc02c2f25
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x02c, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr7_MMU_ASI_PRIMARY_453:
	.word	0x87802080
	.word	0xf6f76018
	.word	0x1000000
	or	%g0, 0x017, %i7
	LOAD_IDATA_IN
	DDEMAP_ALL_RPAGES
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x178, %i7
	ITLB_TAG_READ
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xbe8420e0
	.word	0xf2dfd000
	.word	0x1000000
	.word	0xbe10c000
	IDEMAP_RPAGE
	.word	0xfe556426
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL
thr7_MMU_ASI_PRIMARY_454:
	.word	0x87802080
	.word	0xd2f420c8
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x093, %i7
	LOAD_DDATA_IN
thr7_MMU_ASI_PRIMARY_455:
	.word	0x87802080
	.word	0xdaf2a0c8
	.word	0xd45e60d0
	.word	0xfe542566
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	.word	0xec756010
	.word	0xc0756170
thr7_MMU_ASI_PRIMARY_456:
	.word	0x87802080
	.word	0xf2f42038
	.word	0x1000000
	or	%g0, 0x7a0, %i7
	DTLB_TAG_READ
	.word	0xfe4e61ad
	.word	0xc02aad52
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf45e6010
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00d_exit:
	EXIT_GOOD
Thr7_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10b DATA_VA=0x7b7000092000
attr_data {
	Name = .Thr7_User_Data_4v10b ,
	VA = 0x7b7000092000 ,/* 0x7b7000093fc0 */
	RA = 0x00f01e4000 ,
	PA = 0x00f01e4000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b7000093dba 80000000f01e4440 */
	end_label   = Thr7_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10b_data_begin
Thr7_User_Data_4v10b_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00e TEXT_VA=0x7b70000a4000
attr_text {
	Name = .Thr7_User_Text_4v00e ,
	VA = 0x7b70000a4000 ,/* 0x7b70000a5fc0 */
	RA = 0x00f0054000 ,
	PA = 0x00f0054000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007b70000a5dba 80000000f0054480 */
	end_label   = Thr7_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00e_text_begin
Thr7_User_Text_4v00e_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v00e_exit
	nop
	ACCESS_ITSB_PTR
	.word	0xc07761f8
	.word	0xc0342d1c
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0342c76
	.word	0x1000000
	or	%g0, 0x79d, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x119, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x720, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xfe4aab6b
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45aa110
	.word	0xfe4561dc
	.word	0x1000000
	or	%g0, 0x65e, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x006, %i7
	LOAD_IDATA_IN
	.word	0xfe412dfc
	ACCESS_DTSB_PTR
	.word	0xfe54230a
	.word	0x1000000
	or	%g0, 0x7e8, %i7
	DTLB_TAG_READ
	.word	0xfe58a290
thr7_MMU_ASI_PRIMARY_LITTLE_457:
	.word	0x87802088
	.word	0xcaf2a010
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x450, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x7c0, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe174000
	IDEMAP_PAGE
	.word	0xee5d6078
	.word	0x1000000
	or	%g0, 0x039, %i7
	LOAD_DDATA_IN
	.word	0xd45aa0b0
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc0766608
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc072af80
	.word	0xea5c2110
	.word	0x1000000
	or	%g0, 0x43b, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xe0, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_IDATA_ACCESS
thr7_MMU_ASI_PRIMARY_458:
	.word	0x87802080
	.word	0xc6f2a0a8
	.word	0x1000000
	or	%g0, 0x014, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	.word	0xfc9f5c40
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xf472a098
	.word	0xc07564b8
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v00e_exit:
	EXIT_GOOD
Thr7_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10c DATA_VA=0x7b7000100000
attr_data {
	Name = .Thr7_User_Data_4v10c ,
	VA = 0x7b7000100000 ,/* 0x7b7000101fc0 */
	RA = 0x00f00ee000 ,
	PA = 0x00f00ee000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007b7000101dba 80000000f00ee440 */
	end_label   = Thr7_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10c_data_begin
Thr7_User_Data_4v10c_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00f TEXT_VA=0x7c0000d50000
attr_text {
	Name = .Thr7_User_Text_4v00f ,
	VA = 0x7c0000d50000 ,/* 0x7c0000d5ffc0 */
	RA = 0x0030f60000 ,
	PA = 0x7430f60000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007c0000d51dba 8000007430f60481 */
	end_label   = Thr7_User_Text_4v00f_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00f_text_begin
Thr7_User_Text_4v00f_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v00f_exit
	nop
	.word	0xc85c20d0
	.word	0xfc9a9100
	.word	0xd8776048
	.word	0xc028a170
	.word	0xc0776528
	.word	0xbe8760e0
	.word	0xeadfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x583, %i7
	LOAD_IDATA_ACCESS
	.word	0xc022a1a0
	TOGGLE_LSU_DM
	IDEMAP_ALL
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcd95160
	TOGGLE_LSU_DM
	.word	0xfe576cc8
	.word	0x1000000
	or	%g0, 0x138, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x520, %i7
	DTLB_TAG_READ
	.word	0xbe8560d0
	.word	0xe0dfd000
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0xc02c2389
	TOGGLE_LSU_IM
	.word	0xfcde5000
	.word	0x1000000
	or	%g0, 0x678, %i7
	READ_DDATA_ACCESS
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x049, %i7
	LOAD_DDATA_IN
	.word	0xd472a038
	.word	0xc0376620
	.word	0xbe842110
	.word	0xe0dfd000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe5e68a0
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00f_exit:
	EXIT_GOOD
Thr7_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10d DATA_VA=0x7e0730000000
attr_data {
	Name = .Thr7_User_Data_4v10d ,
	VA = 0x7e0730000000 ,/* 0x7e073fffffc0 */
	RA = 0x02b0000000 ,
	PA = 0x7eb0000000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007e0730001cad 8000007eb0000445 */
	end_label   = Thr7_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10d_data_begin
Thr7_User_Data_4v10d_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v010 TEXT_VA=0x7b7000016000
attr_text {
	Name = .Thr7_User_Text_4v010 ,
	VA = 0x7b7000016000 ,/* 0x7b7000017fc0 */
	RA = 0x00f0168000 ,
	PA = 0x00f0168000 ,
	TTE_Context = 0x1cad ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007b7000017dba 80000000f0168480 */
	end_label   = Thr7_User_Text_4v010_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v010_text_begin
Thr7_User_Text_4v010_text_begin:
	nop
	sub	%g1, 1, %g1
	brz	%g1,Thr7_User_Text_4v010_exit
	nop
	.word	0xfe50afaa
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe154000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x6db, %i7
	LOAD_DDATA_ACCESS
	.word	0xce776020
	.word	0xc0266cd4
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xdc72a028
	.word	0xc0342392
	DDEMAP_PCTX
	.word	0xe05aa038
	.word	0x1000000
	or	%g0, 0x70, %i7
	ITLB_TAG_READ
	.word	0xc022aea4
	.word	0xe19a9e00
	TOGGLE_LSU_DM
	nop
	nop
	.word	0xc070acc8
	DDEMAP_PCTX
	.word	0xfc9c5020
	.word	0xbe8560b0
	.word	0xeadfd000
	.word	0xfe4423e0
	.word	0xbe150000
	GOTO_SUPERVISOR1
thr7_MMU_ASI_BLK_COMMIT_P_459:
	.word	0x878020e0
	.word	0xc3baaa40
	.word	0xfe4c24bf
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xfe44237c
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v010_exit:
	EXIT_GOOD
Thr7_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10e DATA_VA=0x7c00001e0000
attr_data {
	Name = .Thr7_User_Data_4v10e ,
	VA = 0x7c00001e0000 ,/* 0x7c00001effc0 */
	RA = 0x0030b50000 ,
	PA = 0x7430b50000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007c00001e1dba 8000007430b50441 */
	end_label   = Thr7_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10e_data_begin
Thr7_User_Data_4v10e_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10f DATA_VA=0x7c0000050000
attr_data {
	Name = .Thr7_User_Data_4v10f ,
	VA = 0x7c0000050000 ,/* 0x7c000005ffc0 */
	RA = 0x0030b90000 ,
	PA = 0x7430b90000 ,
	TTE_Context = 0x1cad ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00007c0000051dba 8000007430b90441 */
	end_label   = Thr7_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10f_data_begin
Thr7_User_Data_4v10f_data_begin:
	.xword	0x7b70000de000
	.xword	0x7b7000066000
	.xword	0x7b700007e000
	.xword	0x7c0000660000
	.xword	0x7d003d000000
	.xword	0x7b700014e000
	.xword	0x7c0000cb0000
	.xword	0x7b7000126000
	.xword	0x7d0000400000
	.xword	0x7c0000600000
	.xword	0x7c0000780000
	.xword	0x7d0002000000
	.xword	0x7b700014c000
	.xword	0x7b70001d0000
	.xword	0x7c0000e20000
	.xword	0x7e0d40000000
	.xword	0x7b7000128000
	.xword	0x7b70000b8000
	.xword	0x7b700000c000
	.xword	0x7c00005a0000
	.xword	0x7d000d400000
	.xword	0x7b70001ec000
	.xword	0x7d0009c00000
	.xword	0x7b7000006000
	.xword	0x7c0000db0000
	.xword	0x7b70001ea000
	.xword	0x7b7000170000
	.xword	0x7b70001f6000
	.xword	0x7b7000172000
	.xword	0x7b700000e000
	.xword	0x7b7000176000
	.xword	0x7b7000132000
	.xword	0x7b700003a000
	.xword	0x7c0000af0000
	.xword	0x7b700011c000
	.xword	0x7e08b0000000
	.xword	0x7b7000014000
	.xword	0x7b7000156000
	.xword	0x7b7000092000
	.xword	0x7b70000a4000
	.xword	0x7b7000100000
	.xword	0x7c0000d50000
	.xword	0x7e0730000000
	.xword	0x7b7000016000
	.xword	0x7c00001e0000
	.xword	0x7c0000050000
Thr7_User_Data_4v10f_data_end:

