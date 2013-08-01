/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_cmp_test_0.s
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
#define THR0_PCONTEXT_0 0x187e
#define THR0_PCONTEXT_1 0x1eab
#define THR0_SCONTEXT_0 0x10d8
#define THR0_SCONTEXT_1 0x1e93
#define THR1_PCONTEXT_0 0x09c6
#define THR1_PCONTEXT_1 0x096b
#define THR1_SCONTEXT_0 0x0803
#define THR1_SCONTEXT_1 0x11c6
#define THR2_PCONTEXT_0 0x0984
#define THR2_PCONTEXT_1 0x07ca
#define THR2_SCONTEXT_0 0x031c
#define THR2_SCONTEXT_1 0x05f0
#define THR3_PCONTEXT_0 0x0a0e
#define THR3_PCONTEXT_1 0x0115
#define THR3_SCONTEXT_0 0x0865
#define THR3_SCONTEXT_1 0x1386
#define THR4_PCONTEXT_0 0x04d1
#define THR4_PCONTEXT_1 0x113f
#define THR4_SCONTEXT_0 0x18ea
#define THR4_SCONTEXT_1 0x1d83
#define THR5_PCONTEXT_0 0x19a9
#define THR5_PCONTEXT_1 0x1c9e
#define THR5_SCONTEXT_0 0x154e
#define THR5_SCONTEXT_1 0x1d2d
#define THR6_PCONTEXT_0 0x0dac
#define THR6_PCONTEXT_1 0x069f
#define THR6_SCONTEXT_0 0x1c29
#define THR6_SCONTEXT_1 0x1f98
#define THR7_PCONTEXT_0 0x039c
#define THR7_PCONTEXT_1 0x01ef
#define THR7_SCONTEXT_0 0x00ee
#define THR7_SCONTEXT_1 0x138a
#define THR0_PTRAP_TEXT_VA 0x600000ff0000
#define THR0_PTRAP_TEXT_RA 0x01d09c0000
#define THR0_PTRAP_TEXT_PA 0x0dd09c0000
#define THR1_PTRAP_TEXT_VA 0x640000e60000
#define THR1_PTRAP_TEXT_RA 0x01e0190000
#define THR1_PTRAP_TEXT_PA 0x01e0190000
#define THR2_PTRAP_TEXT_VA 0x680000580000
#define THR2_PTRAP_TEXT_RA 0x01f0250000
#define THR2_PTRAP_TEXT_PA 0x01f0250000
#define THR3_PTRAP_TEXT_VA 0x6c0000730000
#define THR3_PTRAP_TEXT_RA 0x0200660000
#define THR3_PTRAP_TEXT_PA 0x3e00660000
#define THR4_PTRAP_TEXT_VA 0x700000e10000
#define THR4_PTRAP_TEXT_RA 0x0210e30000
#define THR4_PTRAP_TEXT_PA 0x4e10e30000
#define THR5_PTRAP_TEXT_VA 0x740000600000
#define THR5_PTRAP_TEXT_RA 0x02201e0000
#define THR5_PTRAP_TEXT_PA 0x5e201e0000
#define THR6_PTRAP_TEXT_VA 0x780000e30000
#define THR6_PTRAP_TEXT_RA 0x0230d50000
#define THR6_PTRAP_TEXT_PA 0x0230d50000
#define THR7_PTRAP_TEXT_VA 0x7c0000a40000
#define THR7_PTRAP_TEXT_RA 0x0240720000
#define THR7_PTRAP_TEXT_PA 0x0240720000
#include "mmu_hred.s"
/*********************************************************************/
SECTION .Thr0_Priv_Sect TEXT_VA=0x5f50000fc000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_1
	VA = 0x5f50000fc000 ,
	RA = 0x03200be000 ,
	PA = 0x0f200be000 ,
	TTE_Context = 0x187e ,
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
SECTION .Thr1_Priv_Sect TEXT_VA=0x63600013a000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_1
	VA = 0x63600013a000 ,
	RA = 0x0330078000 ,
	PA = 0x0330078000 ,
	TTE_Context = 0x09c6 ,
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
SECTION .Thr2_Priv_Sect TEXT_VA=0x67700006e000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_3
	VA = 0x67700006e000 ,
	RA = 0x0340080000 ,
	PA = 0x0340080000 ,
	TTE_Context = 0x0984 ,
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
SECTION .Thr3_Priv_Sect TEXT_VA=0x6b80001f4000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_0
	VA = 0x6b80001f4000 ,
	RA = 0x03500b0000 ,
	PA = 0x03500b0000 ,
	TTE_Context = 0x0a0e ,
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
SECTION .Thr4_Priv_Sect TEXT_VA=0x6f9000122000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_2
	VA = 0x6f9000122000 ,
	RA = 0x0360094000 ,
	PA = 0x0360094000 ,
	TTE_Context = 0x04d1 ,
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
SECTION .Thr5_Priv_Sect TEXT_VA=0x73a0001c4000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_3
	VA = 0x73a0001c4000 ,
	RA = 0x037001a000 ,
	PA = 0x037001a000 ,
	TTE_Context = 0x19a9 ,
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
SECTION .Thr6_Priv_Sect TEXT_VA=0x77b00019c000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_1
	VA = 0x77b00019c000 ,
	RA = 0x03801b6000 ,
	PA = 0x6f801b6000 ,
	TTE_Context = 0x0dac ,
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
SECTION .Thr7_Priv_Sect TEXT_VA=0x7bc000054000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x7bc000054000 ,
	RA = 0x03900e0000 ,
	PA = 0x03900e0000 ,
	TTE_Context = 0x039c ,
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
	TTE_W       =           1 ,
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
	TTE_P       =           1 ,
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
	TTE_W       =           1 ,
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
	TTE_P       =           1 ,
	TTE_EP      = 1 ,
	TTE_W       =           0 ,
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
	TTE_W       =           1 ,
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
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
Thr1_register_initial_values:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
Thr2_register_initial_values:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
Thr3_register_initial_values:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
Thr4_register_initial_values:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
Thr5_register_initial_values:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
Thr6_register_initial_values:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
Thr7_register_initial_values:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
.align 32
hptrap_itte_begin:
	.xword	0x00005f5000161eab	!0
	.xword	0x8000000f200ba080	
	.xword	0x00005f50001e1eab	!1
	.xword	0x8000000f2000a080	
	.xword	0x0000620970000000	!2
	.xword	0x8000000e50000485	
	.xword	0x00005f500003feab	!3
	.xword	0x8000000f2017c080	
	.xword	0x00005f50001fbeab	!4
	.xword	0x8000000f201f0080	
	.xword	0x0000600000da0000	!5
	.xword	0x8000000dd02d0481	
	.xword	0x0000600000fe187e	!6
	.xword	0x8000000dd0880081	
	.xword	0x00005f5000111eab	!7
	.xword	0x8000000f20142080	
	.xword	0x000061002c40187e	!8
	.xword	0x8000000fa3800083	
	.xword	0x000061003a80187e	!9
	.xword	0x8000000fa4800083	
	.xword	0x00005f5000175eab	!10
	.xword	0x8000000f2016e080	
	.xword	0x00005f5000007eab	!11
	.xword	0x8000000f20130080	
	.xword	0x00005f5000011eab	!12
	.xword	0x8000000f2010c080	
	.xword	0x00006000004c187e	!13
	.xword	0x8000000dd0a70081	
	.xword	0x000060000076187e	!14
	.xword	0x8000000dd0b70081	
	.xword	0x00005f5000063eab	!15
	.xword	0x8000000f20172080	
	.xword	0x00005f50001f1eab	!16
	.xword	0x8000000f2015c080	
	.xword	0x000060000037187e	!17
	.xword	0x8000000dd06f0081	
	.xword	0x000061002e40187e	!18
	.xword	0x8000000faf800083	
	.xword	0x000060000046187e	!19
	.xword	0x8000000dd07d0081	
	.xword	0x00005f50000bbeab	!20
	.xword	0x8000000f201d6080	
	.xword	0x00006360001ce9c6	!21
	.xword	0x8000000330064080	
	.xword	0x000065002ec0096b	!22
	.xword	0x8000001fb9000083	
	.xword	0x000063600005e000	!23
	.xword	0x80000003300fc480	
	.xword	0x000063600006a9c6	!24
	.xword	0x8000000330140080	
	.xword	0x00006400006809c6	!25
	.xword	0x8000001de0bd0081	
	.xword	0x0000650002c00000	!26
	.xword	0x8000001fbdc00483	
	.xword	0x00006360001d09c6	!27
	.xword	0x8000000330136080	
	.xword	0x00006400000f09c6	!28
	.xword	0x8000001de0210081	
	.xword	0x000065002a000000	!29
	.xword	0x8000001fb5000483	
	.xword	0x000065002200096b	!30
	.xword	0x8000001fb9400083	
	.xword	0x00006400000309c6	!31
	.xword	0x8000001de0000081	
	.xword	0x00006360001769c6	!32
	.xword	0x80000003300bc080	
	.xword	0x00006400001509c6	!33
	.xword	0x8000001de0710081	
	.xword	0x000065001340096b	!34
	.xword	0x8000001fbc800083	
	.xword	0x00006360001bc9c6	!35
	.xword	0x80000003301fe080	
	.xword	0x00006360001029c6	!36
	.xword	0x80000003300c4080	
	.xword	0x000065002dc0096b	!37
	.xword	0x8000001fb9800083	
	.xword	0x00006360001e69c6	!38
	.xword	0x800000033005c080	
	.xword	0x00006360001129c6	!39
	.xword	0x8000000330090080	
	.xword	0x0000680000d00984	!40
	.xword	0x80000001f0950481	
	.xword	0x0000680000020984	!41
	.xword	0x80000001f09b0481	
	.xword	0x0000677000154000	!42
	.xword	0x80000003401ea080	
	.xword	0x0000680000cb0984	!43
	.xword	0x80000001f0650481	
	.xword	0x00006770000c0984	!44
	.xword	0x8000000340026480	
	.xword	0x0000677000146000	!45
	.xword	0x800000034005e080	
	.xword	0x0000690005000984	!46
	.xword	0x8000002fc7800483	
	.xword	0x000069002d800984	!47
	.xword	0x8000002fcbc00483	
	.xword	0x00006a0d20000000	!48
	.xword	0x8000002850000085	
	.xword	0x00006770000b0984	!49
	.xword	0x800000034006a480	
	.xword	0x00006770000a4000	!50
	.xword	0x80000003401d8080	
	.xword	0x000067700015a984	!51
	.xword	0x800000034013a480	
	.xword	0x00006770001b2984	!52
	.xword	0x8000000340022480	
	.xword	0x00006800008f0984	!53
	.xword	0x80000001f0b80481	
	.xword	0x0000690032400984	!54
	.xword	0x8000002fc0000483	
	.xword	0x0000680000eb0984	!55
	.xword	0x80000001f0d00481	
	.xword	0x000069003dc00984	!56
	.xword	0x8000002fc0400483	
	.xword	0x0000690010c00984	!57
	.xword	0x8000002fc0800483	
	.xword	0x000067700013c984	!58
	.xword	0x8000000340088480	
	.xword	0x00006c0000100a0e	!59
	.xword	0x8000003e00a50481	
	.xword	0x00006c0000260a0e	!60
	.xword	0x8000003e001d0481	
	.xword	0x00006c0000a20000	!61
	.xword	0x8000003e00e50081	
	.xword	0x00006c0000f30a0e	!62
	.xword	0x8000003e00ee0481	
	.xword	0x00006d0021c00a0e	!63
	.xword	0x80000003d1000483	
	.xword	0x00006b80000aa000	!64
	.xword	0x8000000350144080	
	.xword	0x00006d0036000a0e	!65
	.xword	0x80000003dd000483	
	.xword	0x00006b8000188a0e	!66
	.xword	0x8000000350028480	
	.xword	0x00006d000bc00000	!67
	.xword	0x80000003da000083	
	.xword	0x00006b80000eaa0e	!68
	.xword	0x80000003501f2480	
	.xword	0x00006c00000b0a0e	!69
	.xword	0x8000003e00890481	
	.xword	0x00006c00007d0000	!70
	.xword	0x8000003e003a0081	
	.xword	0x00006c0000b00a0e	!71
	.xword	0x8000003e00510481	
	.xword	0x00006c0000500a0e	!72
	.xword	0x8000003e00eb0481	
	.xword	0x00006b80001baa0e	!73
	.xword	0x80000003501a8480	
	.xword	0x00006d0006000a0e	!74
	.xword	0x80000003dec00483	
	.xword	0x00006b8000012a0e	!75
	.xword	0x80000003500d6480	
	.xword	0x00006c0000b40a0e	!76
	.xword	0x8000003e00de0481	
	.xword	0x00006d0033800a0e	!77
	.xword	0x80000003d6400483	
	.xword	0x00006b80000b8a0e	!78
	.xword	0x800000035014a480	
	.xword	0x00006e0ad0000a0e	!79
	.xword	0x80000000e0000485	
	.xword	0x00006d0027400a0e	!80
	.xword	0x80000003d4000483	
	.xword	0x00006d000a800a0e	!81
	.xword	0x80000003d7400483	
	.xword	0x000071001c0004d1	!82
	.xword	0x8000004fe8c00083	
	.xword	0x00007100044004d1	!83
	.xword	0x8000004fef400083	
	.xword	0x00006f900010c000	!84
	.xword	0x8000000360014080	
	.xword	0x0000720e000004d1	!85
	.xword	0x8000004870000085	
	.xword	0x00006f90001ed13f	!86
	.xword	0x80000003601e6080	
	.xword	0x0000700000530000	!87
	.xword	0x8000004e10e90081	
	.xword	0x00006f900003113f	!88
	.xword	0x8000000360018080	
	.xword	0x00006f900013313f	!89
	.xword	0x800000036014e080	
	.xword	0x00006f90001a8000	!90
	.xword	0x80000003600f8080	
	.xword	0x00006f900010113f	!91
	.xword	0x800000036010e080	
	.xword	0x000071000b8004d1	!92
	.xword	0x8000004fe2800083	
	.xword	0x00006f900011d13f	!93
	.xword	0x80000003601ec080	
	.xword	0x00007000004d04d1	!94
	.xword	0x8000004e106c0081	
	.xword	0x0000700000b704d1	!95
	.xword	0x8000004e10990081	
	.xword	0x00007206300004d1	!96
	.xword	0x8000004da0000085	
	.xword	0x00006f90001e313f	!97
	.xword	0x80000003601aa080	
	.xword	0x00007100254004d1	!98
	.xword	0x8000004fee400083	
	.xword	0x000071003c0004d1	!99
	.xword	0x8000004fe3c00083	
	.xword	0x0000710007c004d1	!100
	.xword	0x8000004fe2c00083	
	.xword	0x00007400005619a9	!101
	.xword	0x80000002206d0081	
	.xword	0x00007400002d19a9	!102
	.xword	0x8000000220410081	
	.xword	0x000073a0000b2000	!103
	.xword	0x8000005f7015a080	
	.xword	0x00007500164019a9	!104
	.xword	0x80000003f4400083	
	.xword	0x00007500168019a9	!105
	.xword	0x80000003f3400083	
	.xword	0x0000740000e20000	!106
	.xword	0x8000005e20fb0081	
	.xword	0x000073a0001c99a9	!107
	.xword	0x800000037002a080	
	.xword	0x000073a0000a39a9	!108
	.xword	0x800000037011a080	
	.xword	0x0000740000c90000	!109
	.xword	0x8000005e208f0081	
	.xword	0x000073a00014f9a9	!110
	.xword	0x800000037002e080	
	.xword	0x00007400000919a9	!111
	.xword	0x8000000220fc0081	
	.xword	0x00007400000e0000	!112
	.xword	0x8000005e20070081	
	.xword	0x00007400006319a9	!113
	.xword	0x8000000220fd0081	
	.xword	0x0000750027800000	!114
	.xword	0x80000003f6c00083	
	.xword	0x000073a00000b9a9	!115
	.xword	0x8000000370054080	
	.xword	0x000073a00010f9a9	!116
	.xword	0x80000003701f4080	
	.xword	0x000073a0001739a9	!117
	.xword	0x8000000370164080	
	.xword	0x00007400006919a9	!118
	.xword	0x8000000220280081	
	.xword	0x000073a00006d9a9	!119
	.xword	0x80000003700b4080	
	.xword	0x000073a0000199a9	!120
	.xword	0x8000000370040080	
	.xword	0x000073a00015f9a9	!121
	.xword	0x800000037008a080	
	.xword	0x0000790001c00dac	!122
	.xword	0x8000000018000483	
	.xword	0x000077b0001d469f	!123
	.xword	0x8000006f80110480	
	.xword	0x000077b000090000	!124
	.xword	0x8000006f800dc080	
	.xword	0x0000790030c00dac	!125
	.xword	0x8000000018400483	
	.xword	0x000079003c400dac	!126
	.xword	0x8000000018800483	
	.xword	0x0000790004800000	!127
	.xword	0x800000001b800083	
	.xword	0x00007800002b0dac	!128
	.xword	0x8000006e305a0481	
	.xword	0x000077b00011e69f	!129
	.xword	0x8000006f800c6480	
	.xword	0x0000780000c30000	!130
	.xword	0x8000000230fe0081	
	.xword	0x000077b0000ee69f	!131
	.xword	0x8000006f80032480	
	.xword	0x000077b000134000	!132
	.xword	0x8000006f8016a080	
	.xword	0x0000780000d20dac	!133
	.xword	0x8000006e30680481	
	.xword	0x0000790004000dac	!134
	.xword	0x800000001e800483	
	.xword	0x000077b0001a669f	!135
	.xword	0x8000006f80012480	
	.xword	0x0000790038800dac	!136
	.xword	0x800000001c400483	
	.xword	0x000077b0000d069f	!137
	.xword	0x8000006f8001c480	
	.xword	0x00007bc00001a1ef	!138
	.xword	0x80000003901c6480	
	.xword	0x00007bc0001241ef	!139
	.xword	0x8000000390008480	
	.xword	0x00007bc0001f8000	!140
	.xword	0x8000007f90176480	
	.xword	0x00007c0000b501ef	!141
	.xword	0x8000007e401b0481	
	.xword	0x00007bc0001081ef	!142
	.xword	0x80000003900ee480	
	.xword	0x00007c0000710000	!143
	.xword	0x8000000240120481	
	.xword	0x00007bc00017a1ef	!144
	.xword	0x800000039008c480	
	.xword	0x00007c0000fa01ef	!145
	.xword	0x8000007e40ec0481	
	.xword	0x00007bc000126000	!146
	.xword	0x8000007f90178480	
	.xword	0x00007bc0000001ef	!147
	.xword	0x80000003901fa480	
	.xword	0x00007c00001701ef	!148
	.xword	0x8000007e40c80481	
	.xword	0x00007bc0000e81ef	!149
	.xword	0x800000039017e480	
	.xword	0x00007c00005501ef	!150
	.xword	0x8000007e40ed0481	
	.xword	0x00007bc0001841ef	!151
	.xword	0x8000000390044480	
	.xword	0x00007bc00007c1ef	!152
	.xword	0x8000000390180480	
	.xword	0x00007bc0001fc1ef	!153
	.xword	0x8000000390102480	
	.xword	0x00007c0000c601ef	!154
	.xword	0x8000007e40810481	
	.xword	0x00007c0000ce01ef	!155
	.xword	0x8000007e40a80481	
	.xword	0x00007bc0000401ef	!156
	.xword	0x80000003901a2480	
	.xword	0x00007bc0000821ef	!157
	.xword	0x8000000390198480	
hptrap_itte_end:
	.xword	158
.align 32
hptrap_dtte_begin:
	.xword	0x000062060000187e	!0
	.xword	0x8000000030000445	
	.xword	0x0000600000f810d8	!1
	.xword	0x8000000dd02c0041	
	.xword	0x00005f5000060000	!2
	.xword	0x80000003200ca040	
	.xword	0x000060000044187e	!3
	.xword	0x8000000dd0140441	
	.xword	0x00005f50000e1e93	!4
	.xword	0x8000000f20068040	
	.xword	0x0000610008800000	!5
	.xword	0x8000000faac00043	
	.xword	0x0000620ac000187e	!6
	.xword	0x80000000b0000445	
	.xword	0x0000620a500010d8	!7
	.xword	0x80000000c0000045	
	.xword	0x00005f50000f1eab	!8
	.xword	0x8000000f2000e440	
	.xword	0x00006000009610d8	!9
	.xword	0x8000000dd09d0041	
	.xword	0x00005f500004deab	!10
	.xword	0x8000000f200ce440	
	.xword	0x000062085000187e	!11
	.xword	0x80000002a0000445	
	.xword	0x00005f5000009eab	!12
	.xword	0x8000000f20020440	
	.xword	0x0000600000a1187e	!13
	.xword	0x8000000dd0f10441	
	.xword	0x00006000007c187e	!14
	.xword	0x8000000dd0780441	
	.xword	0x000060000040187e	!15
	.xword	0x8000000dd0af0441	
	.xword	0x000061003b00187e	!16
	.xword	0x8000000fa4c00443	
	.xword	0x00005f5000039eab	!17
	.xword	0x8000000f201f8440	
	.xword	0x00005f500000feab	!18
	.xword	0x8000000f2015e440	
	.xword	0x00005f5000121eab	!19
	.xword	0x8000000f20152440	
	.xword	0x00005f500012feab	!20
	.xword	0x8000000f200cc440	
	.xword	0x000061000b00187e	!21
	.xword	0x8000000faa800443	
	.xword	0x00005f50001cdeab	!22
	.xword	0x8000000f200c8440	
	.xword	0x00005f5000119eab	!23
	.xword	0x8000000f2010a440	
	.xword	0x00005f5000169eab	!24
	.xword	0x8000000f2003c440	
	.xword	0x00006400000009c6	!25
	.xword	0x8000001de0b50041	
	.xword	0x0000636000004803	!26
	.xword	0x8000000330174440	
	.xword	0x0000636000032000	!27
	.xword	0x8000000330170440	
	.xword	0x000063600018a9c6	!28
	.xword	0x80000003301b0040	
	.xword	0x00006360001e8803	!29
	.xword	0x8000000330146440	
	.xword	0x00006400001c0000	!30
	.xword	0x80000001e00f0441	
	.xword	0x000063600009a9c6	!31
	.xword	0x80000003300a8040	
	.xword	0x0000640000570803	!32
	.xword	0x8000001de0a30441	
	.xword	0x0000660b10000000	!33
	.xword	0x8000000040000445	
	.xword	0x00006360001969c6	!34
	.xword	0x80000003301e4040	
	.xword	0x0000636000042000	!35
	.xword	0x8000000330138440	
	.xword	0x00006360000169c6	!36
	.xword	0x8000000330132040	
	.xword	0x00006360001f29c6	!37
	.xword	0x80000003300d4040	
	.xword	0x00006360000949c6	!38
	.xword	0x80000003301be040	
	.xword	0x00006400008d09c6	!39
	.xword	0x8000001de0c30041	
	.xword	0x0000640000bb09c6	!40
	.xword	0x8000001de0b60041	
	.xword	0x000065002a80096b	!41
	.xword	0x8000001fb5400043	
	.xword	0x00006360001b49c6	!42
	.xword	0x80000003301a0040	
	.xword	0x00006400004f09c6	!43
	.xword	0x8000001de0fa0041	
	.xword	0x000065003440096b	!44
	.xword	0x8000001fbd800043	
	.xword	0x00006360001069c6	!45
	.xword	0x8000000330188040	
	.xword	0x0000690025000984	!46
	.xword	0x8000002fc2400043	
	.xword	0x00006770000da31c	!47
	.xword	0x8000000340160440	
	.xword	0x00006770001ea000	!48
	.xword	0x800000034002c440	
	.xword	0x0000690037000984	!49
	.xword	0x8000002fcfc00043	
	.xword	0x000068000059031c	!50
	.xword	0x80000001f0aa0441	
	.xword	0x0000690002400000	!51
	.xword	0x80000003c1800443	
	.xword	0x0000680000380984	!52
	.xword	0x80000001f0440041	
	.xword	0x0000677000170000	!53
	.xword	0x8000000340122440	
	.xword	0x00006770001b0984	!54
	.xword	0x80000003401b4040	
	.xword	0x00006770001a2984	!55
	.xword	0x80000003400d0040	
	.xword	0x0000680000420984	!56
	.xword	0x80000001f0c70041	
	.xword	0x0000680000660984	!57
	.xword	0x80000001f0e40041	
	.xword	0x0000680000110984	!58
	.xword	0x80000001f0850041	
	.xword	0x0000690010400984	!59
	.xword	0x8000002fce000043	
	.xword	0x00006800009f0984	!60
	.xword	0x80000001f0db0041	
	.xword	0x0000690028000984	!61
	.xword	0x8000002fcf000043	
	.xword	0x00006800006e0984	!62
	.xword	0x80000001f07a0041	
	.xword	0x0000680000540984	!63
	.xword	0x80000001f0760041	
	.xword	0x00006770001ca984	!64
	.xword	0x80000003400b2040	
	.xword	0x0000690007800984	!65
	.xword	0x8000002fc0c00043	
	.xword	0x000067700010a984	!66
	.xword	0x8000000340120040	
	.xword	0x00006770000ae984	!67
	.xword	0x8000000340134040	
	.xword	0x000067700008a984	!68
	.xword	0x80000003400ac040	
	.xword	0x0000680000450984	!69
	.xword	0x80000001f08e0041	
	.xword	0x00006770001a4984	!70
	.xword	0x8000000340186040	
	.xword	0x00006b80000a0a0e	!71
	.xword	0x8000000350150040	
	.xword	0x00006c0000db0865	!72
	.xword	0x8000003e00240041	
	.xword	0x00006b80001be000	!73
	.xword	0x800000035018a440	
	.xword	0x00006c0000e00a0e	!74
	.xword	0x8000003e00a60041	
	.xword	0x00006d003cc00865	!75
	.xword	0x80000003d9c00043	
	.xword	0x00006c0000870000	!76
	.xword	0x8000003e00980441	
	.xword	0x00006e01d0000a0e	!77
	.xword	0x8000000060000045	
	.xword	0x00006b80001c2865	!78
	.xword	0x80000003500ae040	
	.xword	0x00006b80001ac000	!79
	.xword	0x80000003500d2440	
	.xword	0x00006c0000f40a0e	!80
	.xword	0x8000003e00cf0041	
	.xword	0x00006b8000078000	!81
	.xword	0x8000000350158440	
	.xword	0x00006c00006d0a0e	!82
	.xword	0x8000003e00ba0041	
	.xword	0x00006c0000970a0e	!83
	.xword	0x8000003e00640041	
	.xword	0x00006b80001c6a0e	!84
	.xword	0x8000000350148040	
	.xword	0x00006b80001c0a0e	!85
	.xword	0x80000003501dc040	
	.xword	0x00006b80000f4a0e	!86
	.xword	0x8000000350184040	
	.xword	0x00006e0ca0000a0e	!87
	.xword	0x8000000300000045	
	.xword	0x00006b80000c2a0e	!88
	.xword	0x8000000350154040	
	.xword	0x00006b8000068a0e	!89
	.xword	0x80000003500c0040	
	.xword	0x00006d0037400a0e	!90
	.xword	0x80000003d1400043	
	.xword	0x00006f900005713f	!91
	.xword	0x800000036013c040	
	.xword	0x00006f900009dd83	!92
	.xword	0x8000000360124440	
	.xword	0x000071000b400000	!93
	.xword	0x8000004feb400443	
	.xword	0x00006f900013113f	!94
	.xword	0x80000003601b8040	
	.xword	0x00006f9000067d83	!95
	.xword	0x8000000360030440	
	.xword	0x0000710015000000	!96
	.xword	0x8000004fe1c00443	
	.xword	0x00006f900007b13f	!97
	.xword	0x800000036014c040	
	.xword	0x00006f90000c5d83	!98
	.xword	0x8000000360060440	
	.xword	0x0000710009400000	!99
	.xword	0x8000004feb000443	
	.xword	0x000071000a4004d1	!100
	.xword	0x8000004fed400043	
	.xword	0x0000700000d118ea	!101
	.xword	0x8000004e107b0441	
	.xword	0x0000700000280000	!102
	.xword	0x8000004e104f0441	
	.xword	0x00007206100004d1	!103
	.xword	0x8000004e70000045	
	.xword	0x000071003b400000	!104
	.xword	0x8000004fe2000443	
	.xword	0x00006f900019913f	!105
	.xword	0x8000000360126040	
	.xword	0x00007000000404d1	!106
	.xword	0x8000004e10550041	
	.xword	0x00006f900011513f	!107
	.xword	0x80000003601ac040	
	.xword	0x00006f90001e513f	!108
	.xword	0x8000000360156040	
	.xword	0x00007000000104d1	!109
	.xword	0x8000004e109e0041	
	.xword	0x000073a00004b9a9	!110
	.xword	0x80000003701bc440	
	.xword	0x0000750014c0154e	!111
	.xword	0x80000003f5800043	
	.xword	0x0000750038400000	!112
	.xword	0x80000003f3000043	
	.xword	0x000073a0001179a9	!113
	.xword	0x800000037008e440	
	.xword	0x0000740000a3154e	!114
	.xword	0x8000000220540041	
	.xword	0x000073a00008e000	!115
	.xword	0x8000005f700c2040	
	.xword	0x0000740000dc19a9	!116
	.xword	0x8000000220670441	
	.xword	0x000075001f80154e	!117
	.xword	0x80000003f5c00043	
	.xword	0x0000750023800000	!118
	.xword	0x80000003f6000043	
	.xword	0x000075003b8019a9	!119
	.xword	0x80000003f6800443	
	.xword	0x0000740000ef0000	!120
	.xword	0x8000005e204e0041	
	.xword	0x000073a0001839a9	!121
	.xword	0x8000000370162440	
	.xword	0x00007500340019a9	!122
	.xword	0x80000003fa400443	
	.xword	0x00007500010019a9	!123
	.xword	0x80000003f7000443	
	.xword	0x0000740000b919a9	!124
	.xword	0x80000002202a0441	
	.xword	0x000073a0001059a9	!125
	.xword	0x8000000370000440	
	.xword	0x000073a0001d39a9	!126
	.xword	0x8000000370166440	
	.xword	0x00007500390019a9	!127
	.xword	0x80000003f7c00443	
	.xword	0x00007400007e19a9	!128
	.xword	0x8000000220770441	
	.xword	0x000077b00007469f	!129
	.xword	0x8000006f800fe040	
	.xword	0x000077b00013ff98	!130
	.xword	0x8000006f80168040	
	.xword	0x000077b0000e6000	!131
	.xword	0x8000006f80100040	
	.xword	0x000077b0001ee69f	!132
	.xword	0x8000006f8017a040	
	.xword	0x000077b0001f7f98	!133
	.xword	0x8000006f800d8040	
	.xword	0x0000780000d70000	!134
	.xword	0x8000000230ac0041	
	.xword	0x0000780000f90dac	!135
	.xword	0x8000006e30520041	
	.xword	0x0000780000481c29	!136
	.xword	0x8000006e30010041	
	.xword	0x000077b0000d8000	!137
	.xword	0x8000006f801c0040	
	.xword	0x0000790005800dac	!138
	.xword	0x800000001c000043	
	.xword	0x00007a00e0001c29	!139
	.xword	0x8000006c90000045	
	.xword	0x000077b000076000	!140
	.xword	0x8000006f800b6040	
	.xword	0x000077b0001b669f	!141
	.xword	0x8000006f800da040	
	.xword	0x0000780000980000	!142
	.xword	0x8000000230030041	
	.xword	0x0000780000700dac	!143
	.xword	0x8000006e309f0041	
	.xword	0x000077b00008c69f	!144
	.xword	0x8000006f800ec040	
	.xword	0x000077b00015c69f	!145
	.xword	0x8000006f8006c040	
	.xword	0x0000780000120dac	!146
	.xword	0x8000006e30d30041	
	.xword	0x00007800001b0dac	!147
	.xword	0x8000006e303d0041	
	.xword	0x000079002c000dac	!148
	.xword	0x800000001cc00043	
	.xword	0x000077b00011a69f	!149
	.xword	0x8000006f800b8040	
	.xword	0x000077b0001d669f	!150
	.xword	0x8000006f801a6040	
	.xword	0x000077b0000a669f	!151
	.xword	0x8000006f80112040	
	.xword	0x00007a03f0000dac	!152
	.xword	0x8000006e80000045	
	.xword	0x000077b00018669f	!153
	.xword	0x8000006f8011e040	
	.xword	0x0000780000b30dac	!154
	.xword	0x8000006e30c40041	
	.xword	0x000077b00014069f	!155
	.xword	0x8000006f800de040	
	.xword	0x00007bc00019a1ef	!156
	.xword	0x8000000390092440	
	.xword	0x00007c0000dd138a	!157
	.xword	0x8000007e40530441	
	.xword	0x00007bc00005c000	!158
	.xword	0x8000007f901f6040	
	.xword	0x00007bc0001781ef	!159
	.xword	0x8000000390034440	
	.xword	0x00007c000077138a	!160
	.xword	0x8000007e40ef0441	
	.xword	0x00007bc000070000	!161
	.xword	0x8000007f900e2040	
	.xword	0x00007bc0000441ef	!162
	.xword	0x80000003901d2440	
	.xword	0x00007bc00005b38a	!163
	.xword	0x800000039011c440	
	.xword	0x00007bc000026000	!164
	.xword	0x8000007f900e4040	
	.xword	0x00007bc0000c61ef	!165
	.xword	0x80000003901ba440	
	.xword	0x00007bc0000f738a	!166
	.xword	0x8000000390194440	
	.xword	0x00007bc0001aa000	!167
	.xword	0x8000007f9001e040	
	.xword	0x00007c00003401ef	!168
	.xword	0x8000007e40dc0441	
	.xword	0x00007bc00001538a	!169
	.xword	0x800000039006e440	
	.xword	0x00007c0000510000	!170
	.xword	0x80000002401f0041	
	.xword	0x00007bc00004e1ef	!171
	.xword	0x800000039016c440	
	.xword	0x00007bc0000501ef	!172
	.xword	0x8000000390002440	
	.xword	0x00007bc0001581ef	!173
	.xword	0x800000039018c440	
	.xword	0x00007c00004901ef	!174
	.xword	0x8000007e40430441	
	.xword	0x00007c00006101ef	!175
	.xword	0x8000007e40d40441	
	.xword	0x00007c00001f01ef	!176
	.xword	0x8000007e40c10441	
	.xword	0x00007c00008801ef	!177
	.xword	0x8000007e40f90441	
	.xword	0x00007bc0001d81ef	!178
	.xword	0x8000000390182440	
	.xword	0x00007bc0000481ef	!179
	.xword	0x8000000390114440	
	.xword	0x00007bc0001281ef	!180
	.xword	0x80000003900e6440	
	.xword	0x00007bc0000c81ef	!181
	.xword	0x8000000390128440	
hptrap_dtte_end:
	.xword	182
.align 32
hptrap_user_code_ptrs_0_begin:
	.xword	8
	.xword	0x5f50001e0000
	.xword	24
	.xword	0x5f50001fa000
	.xword	40
	.xword	0x5f5000110000
	.xword	56
	.xword	0x61003a800000
	.xword	72
	.xword	0x5f5000006000
	.xword	88
	.xword	0x5f5000010000
	.xword	104
	.xword	0x6000004c0000
	.xword	120
	.xword	0x600000760000
	.xword	136
	.xword	0x5f5000062000
	.xword	152
	.xword	0x5f50001f0000
	.xword	168
	.xword	0x600000370000
	.xword	184
	.xword	0x61002e400000
	.xword	200
	.xword	0x600000460000
	.xword	216
	.xword	0x5f50000ba000
	.xword	232
	.xword	8
.align 32
hptrap_user_code_ptrs_1_begin:
	.xword	8
	.xword	0x65002ec00000
	.xword	24
	.xword	0x640000680000
	.xword	40
	.xword	0x6400000f0000
	.xword	56
	.xword	0x640000030000
	.xword	72
	.xword	0x636000176000
	.xword	88
	.xword	0x640000150000
	.xword	104
	.xword	0x650013400000
	.xword	120
	.xword	0x6360001bc000
	.xword	136
	.xword	0x636000102000
	.xword	152
	.xword	0x65002dc00000
	.xword	168
	.xword	0x6360001e6000
	.xword	184
	.xword	0x636000112000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_2_begin:
	.xword	8
	.xword	0x680000020000
	.xword	24
	.xword	0x6770000c0000
	.xword	40
	.xword	0x69002d800000
	.xword	56
	.xword	0x6770000b0000
	.xword	72
	.xword	0x67700015a000
	.xword	88
	.xword	0x6770001b2000
	.xword	104
	.xword	0x6800008f0000
	.xword	120
	.xword	0x690032400000
	.xword	136
	.xword	0x680000eb0000
	.xword	152
	.xword	0x69003dc00000
	.xword	168
	.xword	0x690010c00000
	.xword	184
	.xword	0x67700013c000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_3_begin:
	.xword	8
	.xword	0x6c0000260000
	.xword	24
	.xword	0x6d0021c00000
	.xword	40
	.xword	0x6b8000188000
	.xword	56
	.xword	0x6c00000b0000
	.xword	72
	.xword	0x6c0000500000
	.xword	88
	.xword	0x6d0006000000
	.xword	104
	.xword	0x6b8000012000
	.xword	120
	.xword	0x6c0000b40000
	.xword	136
	.xword	0x6d0033800000
	.xword	152
	.xword	0x6b80000b8000
	.xword	168
	.xword	0x6e0ad0000000
	.xword	184
	.xword	0x6d0027400000
	.xword	200
	.xword	0x6d000a800000
	.xword	216
	.xword	8
.align 32
hptrap_user_code_ptrs_4_begin:
	.xword	8
	.xword	0x710004400000
	.xword	24
	.xword	0x6f90001ec000
	.xword	40
	.xword	0x6f9000132000
	.xword	56
	.xword	0x71000b800000
	.xword	72
	.xword	0x7000004d0000
	.xword	88
	.xword	0x720630000000
	.xword	104
	.xword	0x6f90001e2000
	.xword	120
	.xword	0x710025400000
	.xword	136
	.xword	0x71003c000000
	.xword	152
	.xword	0x710007c00000
	.xword	168
	.xword	8
.align 32
hptrap_user_code_ptrs_5_begin:
	.xword	8
	.xword	0x7400002d0000
	.xword	24
	.xword	0x750016800000
	.xword	40
	.xword	0x73a0000a2000
	.xword	56
	.xword	0x740000090000
	.xword	72
	.xword	0x740000630000
	.xword	88
	.xword	0x73a00000a000
	.xword	104
	.xword	0x73a00010e000
	.xword	120
	.xword	0x73a000172000
	.xword	136
	.xword	0x740000690000
	.xword	152
	.xword	0x73a00006c000
	.xword	168
	.xword	0x73a000018000
	.xword	184
	.xword	0x73a00015e000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_6_begin:
	.xword	8
	.xword	0x77b0001d4000
	.xword	24
	.xword	0x79003c400000
	.xword	40
	.xword	0x77b00011e000
	.xword	56
	.xword	0x77b0000ee000
	.xword	72
	.xword	0x780000d20000
	.xword	88
	.xword	0x790004000000
	.xword	104
	.xword	0x77b0001a6000
	.xword	120
	.xword	0x790038800000
	.xword	136
	.xword	0x77b0000d0000
	.xword	152
	.xword	8
.align 32
hptrap_user_code_ptrs_7_begin:
	.xword	8
	.xword	0x7bc000124000
	.xword	24
	.xword	0x7bc000108000
	.xword	40
	.xword	0x7c0000fa0000
	.xword	56
	.xword	0x7bc000000000
	.xword	72
	.xword	0x7c0000170000
	.xword	88
	.xword	0x7bc0000e8000
	.xword	104
	.xword	0x7c0000550000
	.xword	120
	.xword	0x7bc000184000
	.xword	136
	.xword	0x7bc00007c000
	.xword	152
	.xword	0x7bc0001fc000
	.xword	168
	.xword	0x7c0000c60000
	.xword	184
	.xword	0x7c0000ce0000
	.xword	200
	.xword	0x7bc000040000
	.xword	216
	.xword	0x7bc000082000
	.xword	232
	.xword	8
/*********************************************************************/
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x5f5000160000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	VA = 0x5f5000160000 ,/* 0x5f5000161fc0 */
	RA = 0x03200ba000 ,
	PA = 0x0f200ba000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f5000161eab 8000000f200ba080 */
	end_label   = Thr0_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
	setx	0x620600000000, %g1, %g2
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
	nop
	nop
	IDEMAP_NCTX
	.word	0xc02ea6fa
	.word	0xbe8520d8
	.word	0xe0dfd000
thr0_MMU_ASI_PRIMARY_1:
	.word	0x87802080
	.word	0xf4f62108
	.word	0x1000000
	or	%g0, 0x43, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x410, %i7
	READ_DDATA_ACCESS
thr0_MMU_ASI_PRIMARY_2:
	.word	0x87802080
	.word	0xe2f42040
	ACCESS_DTSB_PTR
thr0_MMU_ASI_PRIMARY_3:
	.word	0x87802080
	.word	0xe0f120b8
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xbe812038
	.word	0xe0dfd000
	.word	0xc025217c
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr0_MMU_ASI_SECONDARY_LITTLE_4:
	.word	0x87802089
	.word	0xe8bc6e30
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe85ea0b8
	.word	0x1000000
	.word	0xbe120000
	IDEMAP_PAGE
	.word	0xfc9c1c40
	DDEMAP_ALL
	IDEMAP_ALL_PAGES
	ACCESS_DTSB_PTR
	.word	0xc022ae90
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
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
	or	%g0, 0x04f, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe15c000
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
	TOGGLE_LSU_IM
	.word	0xc4712088
	.word	0xc0352700
	.word	0xee72a0f0
	.word	0xc02f28c2
	.word	0x1000000
	or	%g0, 0x5d0, %i7
	ITLB_TAG_READ
	.word	0xfe5aa3f0
	.word	0x1000000
	or	%g0, 0x036, %i7
	LOAD_DDATA_IN
	.word	0xc45aa088
	.word	0xec72a098
	.word	0xc02aa90f
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd0742028
	.word	0xc032ad14
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v000_exit:
	EXIT_GOOD
Thr0_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v100 DATA_VA=0x620600000000
attr_data {
	Name = .Thr0_User_Data_4v100 ,
	VA = 0x620600000000 ,/* 0x62060fffffc0 */
	RA = 0x0030000000 ,
	PA = 0x0030000000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000062060000187e 8000000030000445 */
	end_label   = Thr0_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v100_data_begin
Thr0_User_Data_4v100_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v200 DATA_VA=0x600000f80000
attr_data {
	Name = .Thr0_User_Data_4v200 ,
	VA = 0x600000f80000 ,/* 0x600000f8ffc0 */
	RA = 0x01d02c0000 ,
	PA = 0x0dd02c0000 ,
	TTE_Context = 0x10d8 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000600000f810d8 8000000dd02c0041 */
	end_label   = Thr0_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v200_data_begin
Thr0_User_Data_4v200_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v300 DATA_VA=0x5f5000060000
attr_data {
	Name = .Thr0_User_Data_4v300 ,
	VA = 0x5f5000060000 ,/* 0x5f5000061fc0 */
	RA = 0x03200ca000 ,
	PA = 0x03200ca000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr0_z_ctx_tsb_1 ,
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
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00005f5000060000 80000003200ca040 */
	end_label   = Thr0_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v300_data_begin
Thr0_User_Data_4v300_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v001 TEXT_VA=0x5f50001e0000
attr_text {
	Name = .Thr0_User_Text_4v001 ,
	VA = 0x5f50001e0000 ,/* 0x5f50001e1fc0 */
	RA = 0x032000a000 ,
	PA = 0x0f2000a000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f50001e1eab 8000000f2000a080 */
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
	.word	0xfe4e2e95
thr0_MMU_ASI_BLK_SL_5:
	.word	0x878020f9
	.word	0xe3bc68c0
	.word	0xd85c2018
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x071, %i7
	LOAD_IDATA_IN
	.word	0xbe846010
	.word	0xeadfd060
	ACCESS_ITSB_PTR
	.word	0xf85aa038
	IDEMAP_ALL_PAGES
	.word	0xd8762018
	.word	0xc0752ee8
	.word	0xc0742370
	.word	0xbe852150
	.word	0xe0dfd000
	.word	0xbe82e010
	.word	0xe39fde20
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc022a84c
	DO_BRANCH
	.word	0x81c5e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	ACCESS_DTSB_PTR
	.word	0xbe872038
	.word	0xf0dfd000
	DDEMAP_ALL_PAGES
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
	.word	0xfcde1100
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x059, %i7
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
	nop
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x620, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf47120a8
	.word	0xc022a298
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr0_MMU_ASI_PRIMARY_6:
	.word	0x87802080
	.word	0xfaf62050
	.word	0xfe4d2056
	.word	0xfc9d1c40
	.word	0xfc9ad020
	.word	0x1000000
	or	%g0, 0x790, %i7
	READ_DDATA_ACCESS
thr0_MMU_ASI_PRIMARY_7:
	.word	0x87802080
	.word	0xe0f520a8
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0xe8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x580, %i7
	READ_IDATA_ACCESS
	.word	0xc02aa40e
	.word	0xe85ea068
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
	.word	0xc39c1f00
	.word	0xd45c20e8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf47420c8
	.word	0xc02c2d18
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe05c2068
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v001_exit:
	EXIT_GOOD
Thr0_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v400 TEXT_VA=0x620970000000
attr_text {
	Name = .Thr0_User_Text_4v400 ,
	VA = 0x620970000000 ,/* 0x62097fffffc0 */
	RA = 0x0250000000 ,
	PA = 0x0e50000000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr0_z_ctx_tsb_0 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 0000620970000000 8000000e50000485 */
	end_label   = Thr0_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v400_text_begin
Thr0_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x0a8, %i7
	P_LOAD_DDATA_IN
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x032, %i7
	P_LOAD_DDATA_IN
	.word	0xfcde1100
	.word	0xcc71a018
	.word	0xc029ae2e
	.word	0x1000000
	.word	0xbe120000
	P_IDEMAP_RPAGE
	.word	0xfcdd0200
	.word	0x1000000
	.word	0xbe114000
	P_IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x073, %i7
	P_LOAD_IDATA_IN
	P_DDEMAP_SCTX
	.word	0xfcd90200
thr0_MMU_ASI_BLK_PL_8:
	.word	0x878020f8
	.word	0xc3baa1c0
	.word	0xe05b2108
thr0_MMU_ASI_AS_IF_USER_PRIMARY_9:
	.word	0x87802010
	.word	0xdaf2a078
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe114000
	P_DDEMAP_PAGE
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x658, %i7
	P_DTLB_TAG_READ
	.word	0xfc9b0580
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4b6, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR1
	nop
Thr0_User_Text_4v400_exit:
	EXIT_GOOD
Thr0_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v002 TEXT_VA=0x5f500003e000
attr_text {
	Name = .Thr0_User_Text_4v002 ,
	VA = 0x5f500003e000 ,/* 0x5f500003ffc0 */
	RA = 0x032017c000 ,
	PA = 0x0f2017c000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f500003feab 8000000f2017c080 */
	end_label   = Thr0_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v002_text_begin
Thr0_User_Text_4v002_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
thr0_MMU_ASI_BLK_S_10:
	.word	0x878020f1
	.word	0xc1b96300
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x3fe, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xc028acc3
	P_TOGGLE_LSU_DM
	P_TOGGLE_LSU_IM
thr0_MMU_ASI_AS_IF_USER_PRIMARY_11:
	.word	0x87802010
	.word	0xe8f2a150
	.word	0x1000000
	.word	0xbe11c000
	P_IDEMAP_PAGE
	.word	0xbe82a0b8
	.word	0xc4dfc200
	P_DDEMAP_ALL_PAGES
	.word	0xe3991f00
	P_ACCESS_ITSB_PTR
	.word	0xfc9c85c0
	.word	0xc1995e20
	.word	0x1000000
	or	%g0, 0x054, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x046, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x441, %i7
	P_LOAD_IDATA_ACCESS
thr0_MMU_ASI_BLK_P_12:
	.word	0x878020f0
	.word	0xc3bf22c0
	.word	0xfcd88200
thr0_MMU_ASI_PRIMARY_13:
	.word	0x87802080
	.word	0xc6f72140
	.word	0x1000000
	or	%g0, 0x5ea, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xd65aa010
	.word	0xea592090
	.word	0x1000000
	or	%g0, 0x073, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x7ce, %i7
	P_LOAD_DDATA_ACCESS
	P_DDEMAP_SCTX
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v002_exit:
	EXIT_GOOD
Thr0_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v101 DATA_VA=0x600000440000
attr_data {
	Name = .Thr0_User_Data_4v101 ,
	VA = 0x600000440000 ,/* 0x60000044ffc0 */
	RA = 0x01d0140000 ,
	PA = 0x0dd0140000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000060000044187e 8000000dd0140441 */
	end_label   = Thr0_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v101_data_begin
Thr0_User_Data_4v101_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v201 DATA_VA=0x5f50000e0000
attr_data {
	Name = .Thr0_User_Data_4v201 ,
	VA = 0x5f50000e0000 ,/* 0x5f50000e1fc0 */
	RA = 0x0320068000 ,
	PA = 0x0f20068000 ,
	TTE_Context = 0x10d8 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00005f50000e1e93 8000000f20068040 */
	end_label   = Thr0_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v201_data_begin
Thr0_User_Data_4v201_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v301 DATA_VA=0x610008800000
attr_data {
	Name = .Thr0_User_Data_4v301 ,
	VA = 0x610008800000 ,/* 0x610008bfffc0 */
	RA = 0x03aac00000 ,
	PA = 0x0faac00000 ,
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
	/* DTTE_TAG_DATA = 0000610008800000 8000000faac00043 */
	end_label   = Thr0_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v301_data_begin
Thr0_User_Data_4v301_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v003 TEXT_VA=0x5f50001fa000
attr_text {
	Name = .Thr0_User_Text_4v003 ,
	VA = 0x5f50001fa000 ,/* 0x5f50001fbfc0 */
	RA = 0x03201f0000 ,
	PA = 0x0f201f0000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f50001fbeab 8000000f201f0080 */
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
	IDEMAP_ALL
	TOGGLE_LSU_IM
	.word	0xfc995020
	IDEMAP_ALL
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe8420c8
	.word	0xd4dfd000
	.word	0xfa76a140
	.word	0xc032aacc
	.word	0xf45c20a8
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	.word	0x1000000
	.word	0xbe10c000
	IDEMAP_RPAGE
	.word	0xc03529b4
	.word	0xfe5629e4
	nop
	nop
	nop
	nop
	nop
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
	nop
	nop
	.word	0x1000000
	or	%g0, 0x6f8, %i7
	READ_DDATA_ACCESS
	.word	0xdc752028
	.word	0xc0262170
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x070, %i7
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
	.word	0xd072a028
	.word	0xc0362f86
	.word	0x1000000
	or	%g0, 0x108, %i7
	ITLB_TAG_READ
	nop
	.word	0x1000000
	.word	0xbe150000
	DDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	ACCESS_ITSB_PTR
	.word	0xe85aa0e8
	.word	0xfcd89000
	.word	0xbe862128
	.word	0xe0dfd000
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc87420b8
	.word	0xc0752b20
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v003_exit:
	EXIT_GOOD
Thr0_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v401 TEXT_VA=0x600000da0000
attr_text {
	Name = .Thr0_User_Text_4v401 ,
	VA = 0x600000da0000 ,/* 0x600000daffc0 */
	RA = 0x01d02d0000 ,
	PA = 0x0dd02d0000 ,
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
	/* ITTE_TAG_DATA = 0000600000da0000 8000000dd02d0481 */
	end_label   = Thr0_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v401_text_begin
Thr0_User_Text_4v401_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	.word	0xfe49a383
	.word	0x1000000
	or	%g0, 0x4a0, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x540, %i7
	P_READ_IDATA_ACCESS
thr0_MMU_ASI_AS_IF_USER_PRIMARY_14:
	.word	0x87802010
	.word	0xcef42000
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe168000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x031, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x4cb, %i7
	P_LOAD_DDATA_ACCESS
	P_TOGGLE_LSU_DM
	.word	0xd2732000
	.word	0xc021a704
	P_IDEMAP_ALL
thr0_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_15:
	.word	0x87802022
	.word	0xecbe2170
	.word	0x1000000
	or	%g0, 0x05e, %i7
	P_LOAD_IDATA_IN
	.word	0xfc9b45c0
	.word	0xe19a9f00
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR1
	nop
Thr0_User_Text_4v401_exit:
	EXIT_GOOD
Thr0_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v004 TEXT_VA=0x600000fe0000
attr_text {
	Name = .Thr0_User_Text_4v004 ,
	VA = 0x600000fe0000 ,/* 0x600000feffc0 */
	RA = 0x01d0880000 ,
	PA = 0x0dd0880000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000600000fe187e 8000000dd0880081 */
	end_label   = Thr0_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v004_text_begin
Thr0_User_Text_4v004_text_begin:
	wrpr	0, %gl
thr0_MMU_ASI_BLK_COMMIT_P_16:
	.word	0x878020e0
	.word	0xc1bd2dc0
	.word	0xfcdc1040
	.word	0x1000000
	or	%g0, 0x06e, %i7
	P_LOAD_DDATA_IN
	.word	0xfcdc0200
	.word	0xfcdd5160
	.word	0xee70a120
	.word	0xc07127f0
	.word	0xfcdf1000
	.word	0x1000000
	or	%g0, 0x016, %i7
	P_LOAD_IDATA_IN
	.word	0xfcd91000
	P_IDEMAP_PCTX
thr0_MMU_ASI_AS_IF_USER_PRIMARY_17:
	.word	0x87802010
	.word	0xd2f6a078
	P_DDEMAP_SCTX
	P_ACCESS_ITSB_PTR
	.word	0xca712090
	.word	0xc020a170
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	P_READ_IDATA_ACCESS
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
	or	%g0, 0x7a0, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe134000
	P_IDEMAP_RPAGE
	P_DDEMAP_ALL_PAGES
	.word	0xfe4d2505
	.word	0x1000000
	or	%g0, 0x7f8, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x140, %i7
	P_DTLB_TAG_READ
	.word	0xf05d2118
	.word	0x1000000
	or	%g0, 0x3f0, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfe5aa690
	.word	0xbe842068
	.word	0xf0dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcde1000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcd89000
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x05d, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9d1c40
	.word	0xfcdd0200
	.word	0xbe82a148
	.word	0xe0dfd000
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd072a028
	.word	0xc026a264
	.word	0x1000000
	or	%g0, 0x468, %i7
	P_DTLB_TAG_READ
thr0_MMU_ASI_BLK_P_18:
	.word	0x878020f0
	.word	0xe3bd2300
	.word	0xd070a028
	.word	0xc02ea170
	P_DDEMAP_SCTX
	.word	0xbe174000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v004_exit:
	EXIT_GOOD
Thr0_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v102 DATA_VA=0x620ac0000000
attr_data {
	Name = .Thr0_User_Data_4v102 ,
	VA = 0x620ac0000000 ,/* 0x620acfffffc0 */
	RA = 0x00b0000000 ,
	PA = 0x00b0000000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000620ac000187e 80000000b0000445 */
	end_label   = Thr0_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v102_data_begin
Thr0_User_Data_4v102_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v202 DATA_VA=0x620a50000000
attr_data {
	Name = .Thr0_User_Data_4v202 ,
	VA = 0x620a50000000 ,/* 0x620a5fffffc0 */
	RA = 0x00c0000000 ,
	PA = 0x00c0000000 ,
	TTE_Context = 0x10d8 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000620a500010d8 80000000c0000045 */
	end_label   = Thr0_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v202_data_begin
Thr0_User_Data_4v202_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v005 TEXT_VA=0x5f5000110000
attr_text {
	Name = .Thr0_User_Text_4v005 ,
	VA = 0x5f5000110000 ,/* 0x5f5000111fc0 */
	RA = 0x0320142000 ,
	PA = 0x0f20142000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f5000111eab 8000000f20142080 */
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
	.word	0x1000000
	or	%g0, 0x5d0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x5e0, %i7
	DTLB_TAG_READ
	.word	0xfe4420d8
	.word	0xe2752010
	.word	0xc02f2b22
	.word	0xbe842038
	.word	0xe0dfd000
	.word	0xfe4f260e
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0252c94
	.word	0xc028a2e3
	.word	0xfcdc1000
	.word	0xd4752038
	.word	0xc022a8b4
	nop
	nop
	nop
	nop
	.word	0xe670a110
	.word	0xc022a6a8
	nop
	nop
	.word	0xbe842160
	.word	0xd4dfd000
	IDEMAP_NCTX
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x98, %i7
	LOAD_IDATA_ACCESS
	.word	0xcc5c2018
	.word	0xd85aa018
	TOGGLE_LSU_DM
	.word	0xe858a128
	.word	0xc0762c00
	.word	0xbe8420b8
	.word	0xf4dfd000
	.word	0xea5aa010
thr0_MMU_ASI_PRIMARY_19:
	.word	0x87802080
	.word	0xe0f420f8
	nop
	nop
	.word	0x1000000
	.word	0xbe138000
	IDEMAP_PAGE
	.word	0xbe82a088
	.word	0xe0dfd000
	.word	0xd2742030
	.word	0xc0362792
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe56a22e
	.word	0x1000000
	or	%g0, 0x1f8, %i7
	READ_IDATA_ACCESS
thr0_MMU_ASI_PRIMARY_20:
	.word	0x87802080
	.word	0xcef2a060
	DDEMAP_ALL_RPAGES
	nop
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x511, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xf472a0e8
	.word	0xc0362946
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v005_exit:
	EXIT_GOOD
Thr0_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v006 TEXT_VA=0x61002c400000
attr_text {
	Name = .Thr0_User_Text_4v006 ,
	VA = 0x61002c400000 ,/* 0x61002c7fffc0 */
	RA = 0x03a3800000 ,
	PA = 0x0fa3800000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061002c40187e 8000000fa3800083 */
	end_label   = Thr0_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v006_text_begin
Thr0_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x006, %i7
	P_LOAD_DDATA_IN
	P_IDEMAP_ALL_PAGES
	.word	0xfcdd0200
	.word	0x1000000
	or	%g0, 0x054, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x4f2, %i7
	P_LOAD_IDATA_ACCESS
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x00c, %i7
	P_LOAD_DDATA_IN
	.word	0xfcdc1000
	.word	0xfe4d26d1
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	P_READ_IDATA_ACCESS
	.word	0xfcdc0200
	P_DDEMAP_NCTX
	P_IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	P_READ_IDATA_ACCESS
	P_IDEMAP_ALL_PAGES
	.word	0xfc991c40
	.word	0xbe158000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v006_exit:
	EXIT_GOOD
Thr0_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v103 DATA_VA=0x5f50000f0000
attr_data {
	Name = .Thr0_User_Data_4v103 ,
	VA = 0x5f50000f0000 ,/* 0x5f50000f1fc0 */
	RA = 0x032000e000 ,
	PA = 0x0f2000e000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f50000f1eab 8000000f2000e440 */
	end_label   = Thr0_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v103_data_begin
Thr0_User_Data_4v103_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v203 DATA_VA=0x600000960000
attr_data {
	Name = .Thr0_User_Data_4v203 ,
	VA = 0x600000960000 ,/* 0x60000096ffc0 */
	RA = 0x01d09d0000 ,
	PA = 0x0dd09d0000 ,
	TTE_Context = 0x10d8 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006000009610d8 8000000dd09d0041 */
	end_label   = Thr0_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v203_data_begin
Thr0_User_Data_4v203_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v007 TEXT_VA=0x61003a800000
attr_text {
	Name = .Thr0_User_Text_4v007 ,
	VA = 0x61003a800000 ,/* 0x61003abfffc0 */
	RA = 0x03a4800000 ,
	PA = 0x0fa4800000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061003a80187e 8000000fa4800083 */
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
	.word	0xbe86a038
	.word	0xe8dfd000
	.word	0x1000000
	or	%g0, 0x124, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe862038
	.word	0xe0dfd000
	.word	0xbe86a0a8
	.word	0xf4dfd000
	.word	0x1000000
	.word	0xbe140000
	IDEMAP_PAGE
	.word	0xfe572f82
	.word	0xbe842068
	.word	0xf0dfd000
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
	.word	0xfe54235a
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x025, %i7
	LOAD_IDATA_IN
	ACCESS_ITSB_PTR
	.word	0xe05aa0c8
	.word	0x1000000
	or	%g0, 0x498, %i7
	ITLB_TAG_READ
	.word	0xc676a110
	.word	0xc072ae08
	.word	0xbe82a088
	.word	0xe0dfd000
	.word	0xd2772080
	.word	0xc02aa49f
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe12c000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe472a050
	.word	0xc03428b0
	IDEMAP_NCTX
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x50, %i7
	ITLB_TAG_READ
	DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9d1c40
	.word	0x1000000
	.word	0xbe13c000
	DDEMAP_RPAGE
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc036233a
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v007_exit:
	EXIT_GOOD
Thr0_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v008 TEXT_VA=0x5f5000174000
attr_text {
	Name = .Thr0_User_Text_4v008 ,
	VA = 0x5f5000174000 ,/* 0x5f5000175fc0 */
	RA = 0x032016e000 ,
	PA = 0x0f2016e000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f5000175eab 8000000f2016e080 */
	end_label   = Thr0_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v008_text_begin
Thr0_User_Text_4v008_text_begin:
	wrpr	0, %gl
thr0_MMU_ASI_PRIMARY_21:
	.word	0x87802080
	.word	0xd4f120b8
	P_TOGGLE_LSU_IM
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x88, %i7
	P_READ_IDATA_ACCESS
	P_IDEMAP_NCTX
	.word	0x1000000
	.word	0xbe160000
	P_DDEMAP_PAGE
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0xb8, %i7
	P_READ_DDATA_ACCESS
thr0_MMU_ASI_BLK_PL_22:
	.word	0x878020f8
	.word	0xe3b92140
	.word	0x1000000
	.word	0xbe154000
	P_DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe168000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0xa0, %i7
	P_READ_IDATA_ACCESS
thr0_MMU_ASI_PRIMARY_23:
	.word	0x87802080
	.word	0xdaf62098
	P_IDEMAP_NCTX
	.word	0xc39e1e00
	nop
	nop
	nop
	.word	0xbe842038
	.word	0xd4dfc200
	.word	0x1000000
	or	%g0, 0x093, %i7
	P_LOAD_IDATA_IN
	P_ACCESS_DTSB_PTR
	P_IDEMAP_ALL_RPAGES
	.word	0xfcde1000
	P_IDEMAP_NCTX
	.word	0xfcde1000
	.word	0xc0772ef8
	.word	0xe85aa088
	.word	0x1000000
	.word	0xbe100000
	P_DDEMAP_RPAGE
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x4ec, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfcd89040
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x11, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v008_exit:
	EXIT_GOOD
Thr0_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v104 DATA_VA=0x5f500004c000
attr_data {
	Name = .Thr0_User_Data_4v104 ,
	VA = 0x5f500004c000 ,/* 0x5f500004dfc0 */
	RA = 0x03200ce000 ,
	PA = 0x0f200ce000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f500004deab 8000000f200ce440 */
	end_label   = Thr0_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v104_data_begin
Thr0_User_Data_4v104_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v009 TEXT_VA=0x5f5000006000
attr_text {
	Name = .Thr0_User_Text_4v009 ,
	VA = 0x5f5000006000 ,/* 0x5f5000007fc0 */
	RA = 0x0320130000 ,
	PA = 0x0f20130000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f5000007eab 8000000f20130080 */
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
	.word	0x1000000
	or	%g0, 0x123, %i7
	LOAD_IDATA_ACCESS
	.word	0xe072a008
	.word	0xc0742e70
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc85f2128
	.word	0xf872a128
	.word	0xc037244a
	nop
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_24:
	.word	0x87802080
	.word	0xf0f62068
	DDEMAP_SCTX
	.word	0xfe442acc
	.word	0xfcd91000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc02aa59c
	.word	0xcc5e2018
	.word	0x1000000
	or	%g0, 0x660, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc022a8a4
	.word	0x1000000
	.word	0xbe12c000
	IDEMAP_PAGE
	.word	0xe39ade20
	.word	0x1000000
	or	%g0, 0x74a, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x518, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_25:
	.word	0x87802080
	.word	0xe4f62000
	.word	0xfe542d3c
	.word	0xfe4aa197
	.word	0xfe4122dc
	.word	0x1000000
	.word	0xbe12c000
	IDEMAP_PAGE
	IDEMAP_ALL
	.word	0xc036a4ac
	.word	0xfcdc1000
	.word	0xc0752e08
	.word	0xe05aa008
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe17c000
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
	nop
	nop
	nop
	nop
	.word	0xfe542514
	.word	0xfe54275c
	.word	0xc02425c0
	.word	0xfe48aefc
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_RPAGE
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
	.word	0xfe512b48
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc87420d8
	.word	0xc022a170
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v009_exit:
	EXIT_GOOD
Thr0_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v105 DATA_VA=0x620850000000
attr_data {
	Name = .Thr0_User_Data_4v105 ,
	VA = 0x620850000000 ,/* 0x62085fffffc0 */
	RA = 0x02a0000000 ,
	PA = 0x02a0000000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000062085000187e 80000002a0000445 */
	end_label   = Thr0_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v105_data_begin
Thr0_User_Data_4v105_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00a TEXT_VA=0x5f5000010000
attr_text {
	Name = .Thr0_User_Text_4v00a ,
	VA = 0x5f5000010000 ,/* 0x5f5000011fc0 */
	RA = 0x032010c000 ,
	PA = 0x0f2010c000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f5000011eab 8000000f2010c080 */
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
	nop
	nop
	.word	0x1000000
	or	%g0, 0x59a, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_LITTLE_26:
	.word	0x87802088
	.word	0xccf12018
	.word	0xfcdc1000
thr0_MMU_ASI_BLK_COMMIT_P_27:
	.word	0x878020e0
	.word	0xc1baa200
	nop
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_28:
	.word	0x87802080
	.word	0xdcf62028
	.word	0xfe5aa8a8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02c2a61
	.word	0xbe82a128
	.word	0xe0dfd000
	ACCESS_ITSB_PTR
	.word	0xc0742eb8
thr0_MMU_ASI_SECONDARY_LITTLE_29:
	.word	0x87802089
	.word	0xc8b96d90
	ACCESS_DTSB_PTR
	.word	0xc85c20c8
	.word	0x1000000
	or	%g0, 0x8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x778, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe05e2148
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v00a_exit:
	EXIT_GOOD
Thr0_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v106 DATA_VA=0x5f5000008000
attr_data {
	Name = .Thr0_User_Data_4v106 ,
	VA = 0x5f5000008000 ,/* 0x5f5000009fc0 */
	RA = 0x0320020000 ,
	PA = 0x0f20020000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f5000009eab 8000000f20020440 */
	end_label   = Thr0_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v106_data_begin
Thr0_User_Data_4v106_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00b TEXT_VA=0x6000004c0000
attr_text {
	Name = .Thr0_User_Text_4v00b ,
	VA = 0x6000004c0000 ,/* 0x6000004cffc0 */
	RA = 0x01d0a70000 ,
	PA = 0x0dd0a70000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006000004c187e 8000000dd0a70081 */
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
	or	%g0, 0x3b8, %i7
	DTLB_TAG_READ
	.word	0xfc9a9c40
	.word	0xc85c20d8
	.word	0x1000000
	.word	0xbe114000
	DDEMAP_PAGE
	.word	0xfe4f2eb0
	.word	0x1000000
	or	%g0, 0x06a, %i7
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
	.word	0xc072a728
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xca742070
	.word	0xc02ea45a
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc02922da
	.word	0xfe5aa928
	DDEMAP_PCTX
	.word	0xfe5aa358
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xea772010
	.word	0xc02d2a0a
	.word	0xfa76a0b0
	.word	0xc03126ba
	.word	0xfcdd5020
	TOGGLE_LSU_DM
	DDEMAP_PCTX
	.word	0xbe82a008
	.word	0xc8dfd000
	.word	0xfe46aa98
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9ad020
thr0_MMU_ASI_BLK_COMMIT_P_30:
	.word	0x878020e0
	.word	0xc3be2940
	.word	0x1000000
	or	%g0, 0x32, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c5e000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xbe82a120
	.word	0xc39fde00
	.word	0xfe5d2910
	.word	0xc0242830
thr0_MMU_ASI_BLK_P_31:
	.word	0x878020f0
	.word	0xc1baaa00
thr0_MMU_ASI_PRIMARY_LITTLE_32:
	.word	0x87802088
	.word	0xd0f2a028
	.word	0xfcdc1000
	.word	0xbe812088
	.word	0xf0dfd000
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xf85d2128
	.word	0x81c66000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00b_exit:
	EXIT_GOOD
Thr0_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v107 DATA_VA=0x600000a10000
attr_data {
	Name = .Thr0_User_Data_4v107 ,
	VA = 0x600000a10000 ,/* 0x600000a1ffc0 */
	RA = 0x01d0f10000 ,
	PA = 0x0dd0f10000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000a1187e 8000000dd0f10441 */
	end_label   = Thr0_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v107_data_begin
Thr0_User_Data_4v107_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00c TEXT_VA=0x600000760000
attr_text {
	Name = .Thr0_User_Text_4v00c ,
	VA = 0x600000760000 ,/* 0x60000076ffc0 */
	RA = 0x01d0b70000 ,
	PA = 0x0dd0b70000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000060000076187e 8000000dd0b70081 */
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
	.word	0xcc5d2018
	.word	0xbe8620a8
	.word	0xf4dfd000
	TOGGLE_LSU_DM
thr0_MMU_ASI_BLK_COMMIT_P_33:
	.word	0x878020e0
	.word	0xc3bc2c00
	.word	0x1000000
	or	%g0, 0x451, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x541, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	DDEMAP_ALL_PAGES
thr0_MMU_ASI_BLK_PL_34:
	.word	0x878020f8
	.word	0xc1b92cc0
	.word	0xfe4d2fef
thr0_MMU_ASI_PRIMARY_35:
	.word	0x87802080
	.word	0xe2f72010
	.word	0x1000000
	or	%g0, 0x053, %i7
	LOAD_IDATA_IN
thr0_MMU_ASI_PRIMARY_LITTLE_36:
	.word	0x87802088
	.word	0xd6f42010
	IDEMAP_ALL_RPAGES
	.word	0xc02c2572
	.word	0xfe442f88
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_RPAGES
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x588, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe46aa64
	DO_BRANCH
	.word	0x81c5a000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xca742010
	.word	0xc020af20
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00c_exit:
	EXIT_GOOD
Thr0_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v108 DATA_VA=0x6000007c0000
attr_data {
	Name = .Thr0_User_Data_4v108 ,
	VA = 0x6000007c0000 ,/* 0x6000007cffc0 */
	RA = 0x01d0780000 ,
	PA = 0x0dd0780000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006000007c187e 8000000dd0780441 */
	end_label   = Thr0_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v108_data_begin
Thr0_User_Data_4v108_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00d TEXT_VA=0x5f5000062000
attr_text {
	Name = .Thr0_User_Text_4v00d ,
	VA = 0x5f5000062000 ,/* 0x5f5000063fc0 */
	RA = 0x0320172000 ,
	PA = 0x0f20172000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f5000063eab 8000000f20172080 */
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
	nop
	.word	0xbe8520b8
	.word	0xc4dfd000
	.word	0xf85c2068
thr0_MMU_ASI_BLK_P_37:
	.word	0x878020f0
	.word	0xe1baa6c0
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1cd, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c5a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc032a5ae
	.word	0xfcde1000
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_RPAGE
	.word	0xfc989c40
	.word	0x1000000
	or	%g0, 0x015, %i7
	LOAD_IDATA_IN
	ACCESS_DTSB_PTR
	.word	0xfe4c2698
	.word	0xc672a000
	.word	0xc032abb4
thr0_MMU_ASI_BLK_COMMIT_P_38:
	.word	0x878020e0
	.word	0xc1baa740
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0362e1e
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x228, %i7
	READ_DDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0xc8, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_IM
	nop
	nop
	nop
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x5c7, %i7
	LOAD_IDATA_ACCESS
	.word	0xda72a078
	.word	0xc02c25ce
	DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xf8592038
	.word	0x1000000
	or	%g0, 0x6d0, %i7
	LOAD_DDATA_ACCESS
thr0_MMU_ASI_PRIMARY_39:
	.word	0x87802080
	.word	0xcaf42010
	.word	0xcc762018
	.word	0xc02128f8
	.word	0xf8712160
	.word	0xc02ea4e5
thr0_MMU_ASI_BLK_COMMIT_P_40:
	.word	0x878020e0
	.word	0xc1be24c0
	IDEMAP_NCTX
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd65d2010
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v00d_exit:
	EXIT_GOOD
Thr0_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v109 DATA_VA=0x600000400000
attr_data {
	Name = .Thr0_User_Data_4v109 ,
	VA = 0x600000400000 ,/* 0x60000040ffc0 */
	RA = 0x01d0af0000 ,
	PA = 0x0dd0af0000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000060000040187e 8000000dd0af0441 */
	end_label   = Thr0_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v109_data_begin
Thr0_User_Data_4v109_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00e TEXT_VA=0x5f50001f0000
attr_text {
	Name = .Thr0_User_Text_4v00e ,
	VA = 0x5f50001f0000 ,/* 0x5f50001f1fc0 */
	RA = 0x032015c000 ,
	PA = 0x0f2015c000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f50001f1eab 8000000f2015c080 */
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
	.word	0xd072a028
	.word	0xc02ea2d3
	.word	0xcc5f2018
thr0_MMU_ASI_PRIMARY_41:
	.word	0x87802080
	.word	0xdcf72028
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe4627a8
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc070ac90
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00e_exit:
	EXIT_GOOD
Thr0_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10a DATA_VA=0x61003b000000
attr_data {
	Name = .Thr0_User_Data_4v10a ,
	VA = 0x61003b000000 ,/* 0x61003b3fffc0 */
	RA = 0x03a4c00000 ,
	PA = 0x0fa4c00000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000061003b00187e 8000000fa4c00443 */
	end_label   = Thr0_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10a_data_begin
Thr0_User_Data_4v10a_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00f TEXT_VA=0x600000370000
attr_text {
	Name = .Thr0_User_Text_4v00f ,
	VA = 0x600000370000 ,/* 0x60000037ffc0 */
	RA = 0x01d06f0000 ,
	PA = 0x0dd06f0000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000060000037187e 8000000dd06f0081 */
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
	.word	0x1000000
	or	%g0, 0x370, %i7
	DTLB_TAG_READ
thr0_MMU_ASI_PRIMARY_42:
	.word	0x87802080
	.word	0xccf2a018
	.word	0xfe442894
thr0_MMU_ASI_PRIMARY_43:
	.word	0x87802080
	.word	0xfaf2a060
thr0_MMU_ASI_PRIMARY_44:
	.word	0x87802080
	.word	0xe2f62010
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x035, %i7
	LOAD_DDATA_IN
	.word	0xc02c230b
	.word	0xfa72a050
	.word	0xc02c2170
	DDEMAP_PCTX
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x562, %i7
	LOAD_IDATA_ACCESS
	.word	0xc19ade20
	.word	0xc39adf20
	.word	0xc032ad06
	.word	0xfcd95120
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	DTLB_TAG_READ
	.word	0xfe4d2264
	DO_BRANCH
	.word	0x81c5a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0xa0, %i7
	ITLB_TAG_READ
	.word	0xfe58a7c0
	.word	0x1000000
	or	%g0, 0x09a, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x075, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x051, %i7
	LOAD_DDATA_IN
	DDEMAP_SCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd4592068
	TOGGLE_LSU_DM
	.word	0xfcdd1000
	.word	0xbe86a068
	.word	0xd4dfd000
	DDEMAP_ALL_PAGES
	.word	0xc076a458
	.word	0xf05c2108
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x330, %i7
	DTLB_TAG_READ
	.word	0xe05f2108
	.word	0xc0262ff8
thr0_MMU_ASI_BLK_PL_45:
	.word	0x878020f8
	.word	0xc1b8ae00
	.word	0xc0362a6c
	.word	0x1000000
	or	%g0, 0x14a, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe150000
	DDEMAP_PAGE
	.word	0xd45c20c8
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xc072a2a8
	.word	0x81c6e000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00f_exit:
	EXIT_GOOD
Thr0_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10b DATA_VA=0x5f5000038000
attr_data {
	Name = .Thr0_User_Data_4v10b ,
	VA = 0x5f5000038000 ,/* 0x5f5000039fc0 */
	RA = 0x03201f8000 ,
	PA = 0x0f201f8000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f5000039eab 8000000f201f8440 */
	end_label   = Thr0_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10b_data_begin
Thr0_User_Data_4v10b_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v010 TEXT_VA=0x61002e400000
attr_text {
	Name = .Thr0_User_Text_4v010 ,
	VA = 0x61002e400000 ,/* 0x61002e7fffc0 */
	RA = 0x03af800000 ,
	PA = 0x0faf800000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061002e40187e 8000000faf800083 */
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
	.word	0xc02f2c85
	.word	0x1000000
	or	%g0, 0x393, %i7
	LOAD_DDATA_ACCESS
thr0_MMU_ASI_SECONDARY_LITTLE_46:
	.word	0x87802089
	.word	0xcef2e078
	.word	0x1000000
	.word	0xbe148000
	IDEMAP_PAGE
	.word	0xfcdc1000
thr0_MMU_ASI_PRIMARY_47:
	.word	0x87802080
	.word	0xc6f2a000
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe100000
	IDEMAP_PAGE
	nop
	nop
	nop
	nop
	.word	0xbe8420a8
	.word	0xd4dfd000
	.word	0xe85e2088
	.word	0xe0592068
	IDEMAP_NCTX
	.word	0xd872a048
	.word	0xc036244c
	.word	0x1000000
	or	%g0, 0x095, %i7
	LOAD_IDATA_IN
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
	.word	0xbe82a038
	.word	0xc8dfd000
	.word	0xc02e28cc
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x089, %i7
	LOAD_IDATA_IN
	.word	0xe1995e20
	.word	0x1000000
	or	%g0, 0x230, %i7
	DTLB_TAG_READ
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c5e000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
thr0_MMU_ASI_BLK_S_48:
	.word	0x878020f1
	.word	0xe1baed00
	.word	0xc02c2b73
	ACCESS_DTSB_PTR
	.word	0xc87720c8
	.word	0xc0342e96
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe80a108
	.word	0xc4dfd000
	.word	0xd45e2128
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfcdd1000
	.word	0xf85d2088
	DDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe05ea088
	.word	0x1000000
	or	%g0, 0x563, %i7
	LOAD_IDATA_ACCESS
thr0_MMU_ASI_PRIMARY_LITTLE_49:
	.word	0x87802088
	.word	0xeaf2a010
	.word	0xbe82e010
	.word	0xcadfd020
	.word	0xfe5aa600
	.word	0xd45c2088
	.word	0x1000000
	or	%g0, 0x0ad, %i7
	LOAD_DDATA_IN
	.word	0xc0242170
	.word	0xf05aa068
	.word	0x1000000
	or	%g0, 0x09f, %i7
	LOAD_DDATA_IN
	.word	0xfe5aa690
	.word	0xfe55259e
	IDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0242954
	.word	0x81c5e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v010_exit:
	EXIT_GOOD
Thr0_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10c DATA_VA=0x5f500000e000
attr_data {
	Name = .Thr0_User_Data_4v10c ,
	VA = 0x5f500000e000 ,/* 0x5f500000ffc0 */
	RA = 0x032015e000 ,
	PA = 0x0f2015e000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f500000feab 8000000f2015e440 */
	end_label   = Thr0_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10c_data_begin
Thr0_User_Data_4v10c_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v011 TEXT_VA=0x600000460000
attr_text {
	Name = .Thr0_User_Text_4v011 ,
	VA = 0x600000460000 ,/* 0x60000046ffc0 */
	RA = 0x01d07d0000 ,
	PA = 0x0dd07d0000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000060000046187e 8000000dd07d0081 */
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
	.word	0xdc752028
	.word	0xc0352a5a
	.word	0x1000000
	or	%g0, 0x687, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_SCTX
	nop
	nop
	TOGGLE_LSU_IM
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xca742010
	.word	0xc032afb4
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xde742020
	.word	0xc0242de0
	nop
	.word	0x1000000
	.word	0xbe128000
	IDEMAP_PAGE
	.word	0xfcdd1000
	.word	0x1000000
	or	%g0, 0x300, %i7
	DTLB_TAG_READ
	.word	0xbe8420a8
	.word	0xd4dfd000
	.word	0xfe42a3cc
	.word	0xbe862088
	.word	0xf8dfd000
	.word	0xfe48a2f8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc19e1e00
	TOGGLE_LSU_DM
	.word	0xfcdd1140
	.word	0x1000000
	or	%g0, 0x400, %i7
	READ_DDATA_ACCESS
	.word	0xfe5d2460
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
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xe0, %i7
	DTLB_TAG_READ
	DDEMAP_ALL_RPAGES
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	.word	0xf470a008
	.word	0xc03428de
	.word	0xfe44299c
	.word	0x1000000
	or	%g0, 0x78, %i7
	READ_IDATA_ACCESS
	.word	0xfe452fd4
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0xbe862068
	.word	0xf8dfd000
	.word	0x1000000
	or	%g0, 0xc0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x096, %i7
	LOAD_DDATA_IN
thr0_MMU_ASI_PRIMARY_50:
	.word	0x87802080
	.word	0xe4f6a0c0
	.word	0x1000000
	.word	0xbe14c000
	DDEMAP_RPAGE
	.word	0xc070a1b0
	.word	0xe19c5f20
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_NCTX
	.word	0xbe862068
	.word	0xc8dfd000
	.word	0xc07428f0
	.word	0xfcde1000
	DO_BRANCH
	.word	0x81c36000
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
	IDEMAP_ALL
	.word	0xc0712c10
	.word	0x1000000
	.word	0xbe170000
	DDEMAP_RPAGE
	.word	0xea752040
	.word	0xc02c2f23
	.word	0xc030a89a
	.word	0xe85c20c8
	DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x770, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcde9100
	ACCESS_ITSB_PTR
	.word	0xf05aa0c8
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd85ea048
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v011_exit:
	EXIT_GOOD
Thr0_User_Text_4v011_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10d DATA_VA=0x5f5000120000
attr_data {
	Name = .Thr0_User_Data_4v10d ,
	VA = 0x5f5000120000 ,/* 0x5f5000121fc0 */
	RA = 0x0320152000 ,
	PA = 0x0f20152000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f5000121eab 8000000f20152440 */
	end_label   = Thr0_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10d_data_begin
Thr0_User_Data_4v10d_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v012 TEXT_VA=0x5f50000ba000
attr_text {
	Name = .Thr0_User_Text_4v012 ,
	VA = 0x5f50000ba000 ,/* 0x5f50000bbfc0 */
	RA = 0x03201d6000 ,
	PA = 0x0f201d6000 ,
	TTE_Context = 0x187e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f50000bbeab 8000000f201d6080 */
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
	.word	0xfcde1100
	.word	0x1000000
	or	%g0, 0x150, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	DDEMAP_SCTX
	.word	0xfe44277c
	.word	0xfcd95120
	.word	0xc0242b1c
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0262f0c
	.word	0xdc72a058
	.word	0xc036a692
	.word	0xfe58acf0
	.word	0x1000000
	or	%g0, 0x59f, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe492bd2
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xee752000
	.word	0xc02ea437
	.word	0xfe5aab40
	.word	0x1000000
	or	%g0, 0x148, %i7
	DTLB_TAG_READ
	.word	0xe2742010
	.word	0xc02c2616
	.word	0x1000000
	or	%g0, 0x118, %i7
	ITLB_TAG_READ
	.word	0xbe86a038
	.word	0xe0dfd000
	.word	0xbe86a118
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x67, %i7
	LOAD_IDATA_ACCESS
	.word	0xe858a0e8
thr0_MMU_ASI_PRIMARY_51:
	.word	0x87802080
	.word	0xe8f520a8
	.word	0x1000000
	or	%g0, 0x022, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_52:
	.word	0x87802080
	.word	0xd4f42068
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x50, %i7
	ITLB_TAG_READ
	.word	0xc0712ed8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe858a148
	.word	0x1000000
	or	%g0, 0x76f, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcda9000
	DO_BRANCH
	.word	0x81c5a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf4772068
	.word	0xc0742578
	.word	0x81c66000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v012_exit:
	EXIT_GOOD
Thr0_User_Text_4v012_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10e DATA_VA=0x5f500012e000
attr_data {
	Name = .Thr0_User_Data_4v10e ,
	VA = 0x5f500012e000 ,/* 0x5f500012ffc0 */
	RA = 0x03200cc000 ,
	PA = 0x0f200cc000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f500012feab 8000000f200cc440 */
	end_label   = Thr0_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10e_data_begin
Thr0_User_Data_4v10e_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10f DATA_VA=0x61000b000000
attr_data {
	Name = .Thr0_User_Data_4v10f ,
	VA = 0x61000b000000 ,/* 0x61000b3fffc0 */
	RA = 0x03aa800000 ,
	PA = 0x0faa800000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000061000b00187e 8000000faa800443 */
	end_label   = Thr0_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10f_data_begin
Thr0_User_Data_4v10f_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v110 DATA_VA=0x5f50001cc000
attr_data {
	Name = .Thr0_User_Data_4v110 ,
	VA = 0x5f50001cc000 ,/* 0x5f50001cdfc0 */
	RA = 0x03200c8000 ,
	PA = 0x0f200c8000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f50001cdeab 8000000f200c8440 */
	end_label   = Thr0_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v110_data_begin
Thr0_User_Data_4v110_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v111 DATA_VA=0x5f5000118000
attr_data {
	Name = .Thr0_User_Data_4v111 ,
	VA = 0x5f5000118000 ,/* 0x5f5000119fc0 */
	RA = 0x032010a000 ,
	PA = 0x0f2010a000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f5000119eab 8000000f2010a440 */
	end_label   = Thr0_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v111_data_begin
Thr0_User_Data_4v111_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v112 DATA_VA=0x5f5000168000
attr_data {
	Name = .Thr0_User_Data_4v112 ,
	VA = 0x5f5000168000 ,/* 0x5f5000169fc0 */
	RA = 0x032003c000 ,
	PA = 0x0f2003c000 ,
	TTE_Context = 0x187e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f5000169eab 8000000f2003c440 */
	end_label   = Thr0_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v112_data_begin
Thr0_User_Data_4v112_data_begin:
	.xword	0x5f5000160000
	.xword	0x620600000000
	.xword	0x600000f80000
	.xword	0x5f5000060000
	.xword	0x5f50001e0000
	.xword	0x620970000000
	.xword	0x5f500003e000
	.xword	0x600000440000
	.xword	0x5f50000e0000
	.xword	0x610008800000
	.xword	0x5f50001fa000
	.xword	0x600000da0000
	.xword	0x600000fe0000
	.xword	0x620ac0000000
	.xword	0x620a50000000
	.xword	0x5f5000110000
	.xword	0x61002c400000
	.xword	0x5f50000f0000
	.xword	0x600000960000
	.xword	0x61003a800000
	.xword	0x5f5000174000
	.xword	0x5f500004c000
	.xword	0x5f5000006000
	.xword	0x620850000000
	.xword	0x5f5000010000
	.xword	0x5f5000008000
	.xword	0x6000004c0000
	.xword	0x600000a10000
	.xword	0x600000760000
	.xword	0x6000007c0000
	.xword	0x5f5000062000
	.xword	0x600000400000
	.xword	0x5f50001f0000
	.xword	0x61003b000000
	.xword	0x600000370000
	.xword	0x5f5000038000
	.xword	0x61002e400000
	.xword	0x5f500000e000
	.xword	0x600000460000
	.xword	0x5f5000120000
	.xword	0x5f50000ba000
	.xword	0x5f500012e000
	.xword	0x61000b000000
	.xword	0x5f50001cc000
	.xword	0x5f5000118000
	.xword	0x5f5000168000
Thr0_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x6360001ce000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	VA = 0x6360001ce000 ,/* 0x6360001cffc0 */
	RA = 0x0330064000 ,
	PA = 0x0330064000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006360001ce9c6 8000000330064080 */
	end_label   = Thr1_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr1_user_code_entry
Thr1_user_code_entry:
	setx	0x640000000000, %g1, %g2
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
	.word	0xec75a130
	.word	0xc02aa140
	.word	0x1000000
	or	%g0, 0x6e0, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	.word	0xbe82a0f0
	.word	0xecdfd000
	TOGGLE_LSU_DM
	nop
	nop
	.word	0xd472a098
	.word	0xc02422f4
	.word	0xc075a988
	.word	0xbe812038
	.word	0xfadfd000
	.word	0xc032a140
	.word	0x1000000
	or	%g0, 0x485, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc025ab24
	TOGGLE_LSU_DM
	ACCESS_DTSB_PTR
	.word	0xfe45ab30
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x50a, %i7
	LOAD_DDATA_ACCESS
	ACCESS_DTSB_PTR
	IDEMAP_ALL_RPAGES
	nop
	nop
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x066, %i7
	LOAD_IDATA_IN
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
	DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe13c000
	IDEMAP_RPAGE
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x18, %i7
	READ_IDATA_ACCESS
	.word	0xcc72a018
	.word	0xc02e6c37
	.word	0xfe5da890
	.word	0xc0776e48
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe442b6c
	.word	0xfcda9000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc02c228c
	.word	0x1000000
	or	%g0, 0x1b2, %i7
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
	TOGGLE_LSU_DM
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x130, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc072afc0
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v000_exit:
	EXIT_GOOD
Thr1_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v100 DATA_VA=0x640000000000
attr_data {
	Name = .Thr1_User_Data_4v100 ,
	VA = 0x640000000000 ,/* 0x64000000ffc0 */
	RA = 0x01e0b50000 ,
	PA = 0x1de0b50000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006400000009c6 8000001de0b50041 */
	end_label   = Thr1_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v100_data_begin
Thr1_User_Data_4v100_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v200 DATA_VA=0x636000004000
attr_data {
	Name = .Thr1_User_Data_4v200 ,
	VA = 0x636000004000 ,/* 0x636000005fc0 */
	RA = 0x0330174000 ,
	PA = 0x0330174000 ,
	TTE_Context = 0x0803 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_1 ,
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
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 0000636000004803 8000000330174440 */
	end_label   = Thr1_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v200_data_begin
Thr1_User_Data_4v200_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v300 DATA_VA=0x636000032000
attr_data {
	Name = .Thr1_User_Data_4v300 ,
	VA = 0x636000032000 ,/* 0x636000033fc0 */
	RA = 0x0330170000 ,
	PA = 0x0330170000 ,
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
	/* DTTE_TAG_DATA = 0000636000032000 8000000330170440 */
	end_label   = Thr1_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v300_data_begin
Thr1_User_Data_4v300_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v001 TEXT_VA=0x65002ec00000
attr_text {
	Name = .Thr1_User_Text_4v001 ,
	VA = 0x65002ec00000 ,/* 0x65002effffc0 */
	RA = 0x03b9000000 ,
	PA = 0x1fb9000000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000065002ec0096b 8000001fb9000083 */
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
	.word	0xbe816010
	.word	0xcadfd060
	.word	0xfcdc1000
	DDEMAP_NCTX
	.word	0xc03429f8
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr1_MMU_ASI_PRIMARY_LITTLE_53:
	.word	0x87802088
	.word	0xf4f42000
	.word	0x1000000
	or	%g0, 0xfa, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe174000
	IDEMAP_PAGE
	.word	0xfcdc1100
	.word	0x1000000
	or	%g0, 0xe0, %i7
	ITLB_TAG_READ
	.word	0xbe120000
	GOTO_SUPERVISOR1
	IDEMAP_ALL_RPAGES
	.word	0xfe45ad78
	.word	0x1000000
	or	%g0, 0x4fd, %i7
	LOAD_IDATA_ACCESS
	.word	0xc0242e24
	TOGGLE_LSU_IM
	.word	0xfe5e6ed8
	TOGGLE_LSU_DM
	.word	0xe058a100
	.word	0x1000000
	or	%g0, 0x78, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe154000
	DDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c6a000
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
	.word	0x1000000
	or	%g0, 0x137, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8120e0
	.word	0xecdfd000
	.word	0x1000000
	or	%g0, 0x066, %i7
	LOAD_DDATA_IN
thr1_MMU_ASI_PRIMARY_54:
	.word	0x87802080
	.word	0xdef2a030
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x60, %i7
	LOAD_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xf075a0c8
	.word	0xc072a140
	TOGGLE_LSU_DM
thr1_MMU_ASI_BLK_COMMIT_P_55:
	.word	0x878020e0
	.word	0xc1baa940
	.word	0xbe85a138
	.word	0xecdfd000
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe442664
	.word	0xbe842030
	.word	0xc19fde00
	.word	0xe05f6068
	.word	0x1000000
	or	%g0, 0x07a, %i7
	LOAD_IDATA_IN
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x5f9, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x07b, %i7
	LOAD_IDATA_IN
	DDEMAP_SCTX
	.word	0xfe5da718
	.word	0xc070a2e8
	.word	0x1000000
	or	%g0, 0xe8, %i7
	READ_IDATA_ACCESS
	DDEMAP_ALL
	.word	0x1000000
	.word	0xbe114000
	IDEMAP_PAGE
	.word	0xfcda9000
	.word	0xc0242d8c
	.word	0xbe812038
	.word	0xecdfd000
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf25c2120
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v001_exit:
	EXIT_GOOD
Thr1_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v400 TEXT_VA=0x63600005e000
attr_text {
	Name = .Thr1_User_Text_4v400 ,
	VA = 0x63600005e000 ,/* 0x63600005ffc0 */
	RA = 0x03300fc000 ,
	PA = 0x03300fc000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr1_z_ctx_tsb_0 ,
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
	/* ITTE_TAG_DATA = 000063600005e000 80000003300fc480 */
	end_label   = Thr1_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v400_text_begin
Thr1_User_Text_4v400_text_begin:
	wrpr	0, %gl
	P_DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x098, %i7
	P_LOAD_IDATA_IN
	.word	0xc024a18c
	.word	0xbe842030
	.word	0xc19fc2c0
	P_IDEMAP_ALL
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
	or	%g0, 0x446, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v400_exit:
	EXIT_GOOD
Thr1_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v002 TEXT_VA=0x63600006a000
attr_text {
	Name = .Thr1_User_Text_4v002 ,
	VA = 0x63600006a000 ,/* 0x63600006bfc0 */
	RA = 0x0330140000 ,
	PA = 0x0330140000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063600006a9c6 8000000330140080 */
	end_label   = Thr1_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v002_text_begin
Thr1_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x16f, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr1_MMU_ASI_REAL_MEM_LITTLE_56:
	.word	0x8780201c
	.word	0xdef6a0d8
	.word	0x1000000
	.word	0xbe178000
	P_IDEMAP_RPAGE
	nop
	nop
	.word	0xf6766008
	.word	0xc07125c8
	nop
	nop
	nop
	.word	0xfcde4200
thr1_MMU_ASI_SECONDARY_57:
	.word	0x87802081
	.word	0xdcb963a0
	.word	0xfe412f74
thr1_MMU_ASI_SECONDARY_LITTLE_58:
	.word	0x87802089
	.word	0xd8baeaa0
	.word	0xd45c20e0
	.word	0xe8742028
	.word	0xc02dafd4
	P_ACCESS_ITSB_PTR
	P_TOGGLE_LSU_DM
	.word	0xbe85a008
	.word	0xfadfd000
	.word	0xdc76e028
	.word	0xc02663ec
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v002_exit:
	EXIT_GOOD
Thr1_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v101 DATA_VA=0x63600018a000
attr_data {
	Name = .Thr1_User_Data_4v101 ,
	VA = 0x63600018a000 ,/* 0x63600018bfc0 */
	RA = 0x03301b0000 ,
	PA = 0x03301b0000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063600018a9c6 80000003301b0040 */
	end_label   = Thr1_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v101_data_begin
Thr1_User_Data_4v101_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v201 DATA_VA=0x6360001e8000
attr_data {
	Name = .Thr1_User_Data_4v201 ,
	VA = 0x6360001e8000 ,/* 0x6360001e9fc0 */
	RA = 0x0330146000 ,
	PA = 0x0330146000 ,
	TTE_Context = 0x0803 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_1 ,
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
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00006360001e8803 8000000330146440 */
	end_label   = Thr1_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v201_data_begin
Thr1_User_Data_4v201_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v301 DATA_VA=0x6400001c0000
attr_data {
	Name = .Thr1_User_Data_4v301 ,
	VA = 0x6400001c0000 ,/* 0x6400001cffc0 */
	RA = 0x01e00f0000 ,
	PA = 0x01e00f0000 ,
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
	/* DTTE_TAG_DATA = 00006400001c0000 80000001e00f0441 */
	end_label   = Thr1_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v301_data_begin
Thr1_User_Data_4v301_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v003 TEXT_VA=0x640000680000
attr_text {
	Name = .Thr1_User_Text_4v003 ,
	VA = 0x640000680000 ,/* 0x64000068ffc0 */
	RA = 0x01e0bd0000 ,
	PA = 0x1de0bd0000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006400006809c6 8000001de0bd0081 */
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
	.word	0xc02c2140
	.word	0x1000000
	or	%g0, 0x650, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x560, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	.word	0xfcda9000
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x04a, %i7
	LOAD_IDATA_IN
	ACCESS_ITSB_PTR
thr1_MMU_ASI_BLK_P_59:
	.word	0x878020f0
	.word	0xc3bf6e80
	.word	0xfe5daf30
	.word	0xf475a020
	.word	0xc0776dd8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe8120b0
	.word	0xf6dfd000
	.word	0xec5e60b0
	DDEMAP_NCTX
	.word	0xfc995020
	nop
thr1_MMU_ASI_PRIMARY_60:
	.word	0x87802080
	.word	0xd4f2a0e0
	.word	0x1000000
	or	%g0, 0x17f, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xb7, %i7
	LOAD_DDATA_ACCESS
	.word	0xc022a900
	.word	0xe675a020
	.word	0xc072aa60
	.word	0x1000000
	or	%g0, 0x530, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe466880
	.word	0x1000000
	.word	0xbe104000
	IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xea766050
	.word	0xc02daafb
	.word	0x1000000
	or	%g0, 0x00d, %i7
	LOAD_DDATA_IN
thr1_MMU_ASI_PRIMARY_61:
	.word	0x87802080
	.word	0xcef5a0c8
	.word	0xfe45a20c
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x0a7, %i7
	LOAD_DDATA_IN
	.word	0xc0366a26
	.word	0xc02c23ed
thr1_MMU_ASI_BLK_S_62:
	.word	0x878020f1
	.word	0xc1bc6140
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xbe876030
	.word	0xc19fde00
	TOGGLE_LSU_IM
	.word	0xd45e60b0
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x003, %i7
	LOAD_IDATA_IN
	.word	0xd6776010
	.word	0xc020a140
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	ITLB_TAG_READ
	.word	0xc035afa2
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xee766048
	.word	0xc072a140
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0xc02423a8
	.word	0x1000000
	or	%g0, 0x034, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe16c000
	IDEMAP_RPAGE
	IDEMAP_PCTX
	.word	0xbe8120e0
	.word	0xf2dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd0742028
	.word	0xc022a8d4
	.word	0x81c62000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v003_exit:
	EXIT_GOOD
Thr1_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v401 TEXT_VA=0x650002c00000
attr_text {
	Name = .Thr1_User_Text_4v401 ,
	VA = 0x650002c00000 ,/* 0x650002ffffc0 */
	RA = 0x03bdc00000 ,
	PA = 0x1fbdc00000 ,
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
	/* ITTE_TAG_DATA = 0000650002c00000 8000001fbdc00483 */
	end_label   = Thr1_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v401_text_begin
Thr1_User_Text_4v401_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	.word	0xbe83e130
	.word	0xc8dfc2a0
	P_TOGGLE_LSU_DM
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x00b, %i7
	P_LOAD_IDATA_IN
	P_IDEMAP_NCTX
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_63:
	.word	0x8780202a
	.word	0xc0baadd0
	.word	0xfc9a9100
	.word	0x1000000
	or	%g0, 0x1c8, %i7
	P_READ_IDATA_ACCESS
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x2cd, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x18, %i7
	P_READ_IDATA_ACCESS
	.word	0xfc9ad020
	.word	0x1000000
	or	%g0, 0x04d, %i7
	P_LOAD_IDATA_IN
thr1_MMU_ASI_AS_IF_USER_PRIMARY_64:
	.word	0x87802010
	.word	0xe2f76040
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
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x1e, %i7
	P_LOAD_DDATA_ACCESS
thr1_MMU_ASI_AS_IF_USER_PRIMARY_65:
	.word	0x87802010
	.word	0xe0f2a068
thr1_MMU_ASI_AS_IF_USER_PRIMARY_66:
	.word	0x87802010
	.word	0xe4f42048
thr1_MMU_ASI_PRIMARY_67:
	.word	0x87802080
	.word	0xc6f42030
	.word	0x1000000
	or	%g0, 0x6c8, %i7
	P_READ_DDATA_ACCESS
	.word	0xfc998480
	.word	0xfe51a17a
	.word	0x1000000
	or	%g0, 0x080, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x089, %i7
	P_LOAD_IDATA_IN
	.word	0xd675e010
	.word	0xc034ad42
	.word	0x1000000
	or	%g0, 0x03d, %i7
	P_LOAD_IDATA_IN
	.word	0xc034a340
	nop
	nop
	.word	0xc0232f58
	.word	0x1000000
	or	%g0, 0x98, %i7
	P_READ_DDATA_ACCESS
	P_IDEMAP_ALL
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x096, %i7
	P_LOAD_IDATA_IN
	.word	0xd85b2018
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x540, %i7
	P_READ_IDATA_ACCESS
	P_DDEMAP_SCTX
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x025, %i7
	P_LOAD_IDATA_IN
	P_ACCESS_DTSB_PTR
	.word	0xe19e43c0
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	P_READ_DDATA_ACCESS
	.word	0xfc9a9000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_ACCESS_ITSB_PTR
	P_IDEMAP_NCTX
	.word	0xe39d82c0
	P_DDEMAP_SCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x162, %i7
	P_LOAD_IDATA_ACCESS
	nop
	.word	0x1000000
	or	%g0, 0x578, %i7
	P_ITLB_TAG_READ
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v401_exit:
	EXIT_GOOD
Thr1_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v004 TEXT_VA=0x6360001d0000
attr_text {
	Name = .Thr1_User_Text_4v004 ,
	VA = 0x6360001d0000 ,/* 0x6360001d1fc0 */
	RA = 0x0330136000 ,
	PA = 0x0330136000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006360001d09c6 8000000330136080 */
	end_label   = Thr1_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v004_text_begin
Thr1_User_Text_4v004_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_RPAGES
	.word	0xfcd89000
	.word	0xfcdc1000
	.word	0xbe82a008
	.word	0xc8dfc200
thr1_MMU_ASI_BLK_P_68:
	.word	0x878020f0
	.word	0xc1bda940
	P_IDEMAP_ALL_RPAGES
thr1_MMU_ASI_PRIMARY_69:
	.word	0x87802080
	.word	0xecf5a0f0
	.word	0x1000000
	or	%g0, 0xd8, %i7
	P_READ_DDATA_ACCESS
thr1_MMU_ASI_PRIMARY_70:
	.word	0x87802080
	.word	0xfaf42098
	P_IDEMAP_NCTX
	P_DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
thr1_MMU_ASI_BLK_P_71:
	.word	0x878020f0
	.word	0xc3bda280
	P_TOGGLE_LSU_DM
thr1_MMU_ASI_PRIMARY_72:
	.word	0x87802080
	.word	0xe4f5a078
	.word	0xc022aaa8
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_PRIMARY_73:
	.word	0x87802080
	.word	0xd6f6e010
	.word	0xbe82a038
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x543, %i7
	P_LOAD_IDATA_ACCESS
	P_DDEMAP_SCTX
thr1_MMU_ASI_AS_IF_USER_PRIMARY_74:
	.word	0x87802010
	.word	0xeef66078
	P_IDEMAP_ALL
	.word	0xda75a0c8
	.word	0xc0312f2e
	P_TOGGLE_LSU_DM
	.word	0xfcdd8200
	.word	0xfcde4200
	.word	0xf65aa098
	.word	0xfcdd8200
	P_DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x3f8, %i7
	P_LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe86e038
	.word	0xe0dfc200
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v004_exit:
	EXIT_GOOD
Thr1_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v102 DATA_VA=0x63600009a000
attr_data {
	Name = .Thr1_User_Data_4v102 ,
	VA = 0x63600009a000 ,/* 0x63600009bfc0 */
	RA = 0x03300a8000 ,
	PA = 0x03300a8000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063600009a9c6 80000003300a8040 */
	end_label   = Thr1_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v102_data_begin
Thr1_User_Data_4v102_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v202 DATA_VA=0x640000570000
attr_data {
	Name = .Thr1_User_Data_4v202 ,
	VA = 0x640000570000 ,/* 0x64000057ffc0 */
	RA = 0x01e0a30000 ,
	PA = 0x1de0a30000 ,
	TTE_Context = 0x0803 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000640000570803 8000001de0a30441 */
	end_label   = Thr1_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v202_data_begin
Thr1_User_Data_4v202_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v302 DATA_VA=0x660b10000000
attr_data {
	Name = .Thr1_User_Data_4v302 ,
	VA = 0x660b10000000 ,/* 0x660b1fffffc0 */
	RA = 0x0040000000 ,
	PA = 0x0040000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_3 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 0000660b10000000 8000000040000445 */
	end_label   = Thr1_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v302_data_begin
Thr1_User_Data_4v302_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v005 TEXT_VA=0x6400000f0000
attr_text {
	Name = .Thr1_User_Text_4v005 ,
	VA = 0x6400000f0000 ,/* 0x6400000fffc0 */
	RA = 0x01e0210000 ,
	PA = 0x1de0210000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006400000f09c6 8000001de0210081 */
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
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x047, %i7
	LOAD_IDATA_IN
	.word	0xe275a010
	.word	0xc022a4fc
	nop
	nop
	nop
	nop
thr1_MMU_ASI_PRIMARY_LITTLE_75:
	.word	0x87802088
	.word	0xe8baaf90
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x458, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_PAGE
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x066, %i7
	LOAD_DDATA_IN
	DDEMAP_ALL_PAGES
	.word	0xc0742438
	.word	0xc025a140
	TOGGLE_LSU_IM
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x58d, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x488, %i7
	DTLB_TAG_READ
thr1_MMU_ASI_PRIMARY_76:
	.word	0x87802080
	.word	0xd2f66030
	.word	0xc075ad70
	.word	0xbe86e098
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x09c, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x480, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xea75a0e8
	.word	0xc032ac54
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v005_exit:
	EXIT_GOOD
Thr1_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v402 TEXT_VA=0x65002a000000
attr_text {
	Name = .Thr1_User_Text_4v402 ,
	VA = 0x65002a000000 ,/* 0x65002a3fffc0 */
	RA = 0x03b5000000 ,
	PA = 0x1fb5000000 ,
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
	/* ITTE_TAG_DATA = 000065002a000000 8000001fb5000483 */
	end_label   = Thr1_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v402_text_begin
Thr1_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x16b, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc074a6e8
	.word	0xfcdd9000
	P_TOGGLE_LSU_DM
	.word	0xfcdd9000
	P_TOGGLE_LSU_IM
	.word	0xbe85a098
	.word	0xecdfd000
	nop
	.word	0xbe8660e0
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x778, %i7
	P_READ_DDATA_ACCESS
thr1_MMU_ASI_PRIMARY_77:
	.word	0x87802080
	.word	0xc6f5a050
	.word	0x1000000
	or	%g0, 0x610, %i7
	P_READ_DDATA_ACCESS
thr1_MMU_ASI_BLK_P_78:
	.word	0x878020f0
	.word	0xe1bda500
	P_DDEMAP_ALL_RPAGES
	.word	0xfcdc0300
	P_DDEMAP_ALL_PAGES
	.word	0xfcda9000
	.word	0xfcdbc2a0
	nop
	nop
	nop
	nop
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_79:
	.word	0x8780202a
	.word	0xd4beef80
	.word	0xce75e000
	.word	0xc02325ac
thr1_MMU_ASI_AS_IF_USER_PRIMARY_80:
	.word	0x87802010
	.word	0xeef66018
	.word	0xfcda8200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_BLK_SL_81:
	.word	0x878020f9
	.word	0xc3b96140
	P_IDEMAP_ALL_PAGES
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x790, %i7
	P_DTLB_TAG_READ
	.word	0xc475e110
	.word	0xc02b2c8f
	.word	0x1000000
	.word	0xbe138000
	P_DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe178000
	P_DDEMAP_PAGE
	P_ACCESS_DTSB_PTR
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0xbc, %i7
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
	.word	0xfcde5140
	.word	0x1000000
	.word	0xbe108000
	P_DDEMAP_PAGE
	.word	0xbe8420c0
	.word	0xd4dfc200
	.word	0xbe82a0d0
	.word	0xd4dfd000
	.word	0xfcdc4320
	P_DDEMAP_ALL
	.word	0xe059a068
thr1_MMU_ASI_AS_IF_USER_PRIMARY_82:
	.word	0x87802010
	.word	0xe2f42010
	.word	0xfcdd9140
	.word	0xfcdf4200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9904c0
	nop
	nop
	.word	0xbe8420e0
	.word	0xecdfd000
	.word	0xbe866068
	.word	0xfadfd000
	nop
	nop
	nop
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v402_exit:
	EXIT_GOOD
Thr1_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v006 TEXT_VA=0x650022000000
attr_text {
	Name = .Thr1_User_Text_4v006 ,
	VA = 0x650022000000 ,/* 0x6500223fffc0 */
	RA = 0x03b9400000 ,
	PA = 0x1fb9400000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000065002200096b 8000001fb9400083 */
	end_label   = Thr1_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v006_text_begin
Thr1_User_Text_4v006_text_begin:
	wrpr	0, %gl
thr1_MMU_ASI_PRIMARY_83:
	.word	0x87802080
	.word	0xfaf12038
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	P_ITLB_TAG_READ
thr1_MMU_ASI_PRIMARY_84:
	.word	0x87802080
	.word	0xc4f42038
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	P_READ_DDATA_ACCESS
	.word	0xfc9a9c40
thr1_MMU_ASI_BLK_COMMIT_S_85:
	.word	0x878020e1
	.word	0xe1bc6e00
thr1_MMU_ASI_PRIMARY_86:
	.word	0x87802080
	.word	0xc8f5a038
thr1_MMU_ASI_PRIMARY_87:
	.word	0x87802080
	.word	0xd4f5a038
	.word	0x1000000
	.word	0xbe15c000
	P_IDEMAP_PAGE
	P_IDEMAP_ALL
	.word	0xcc742018
	.word	0xc075a9d0
thr1_MMU_ASI_AS_IF_USER_PRIMARY_88:
	.word	0x87802010
	.word	0xe8f2a088
	.word	0x1000000
	or	%g0, 0x360, %i7
	P_READ_DDATA_ACCESS
	nop
	.word	0x1000000
	.word	0xbe154000
	P_DDEMAP_PAGE
	.word	0xfcdc1100
	.word	0xfe442ba8
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_89:
	.word	0x87802022
	.word	0xd4bee570
	nop
	nop
	nop
	.word	0xfc9c8580
	nop
	P_IDEMAP_ALL_RPAGES
	.word	0xbe82a098
	.word	0xd4dfc200
	.word	0xbe168000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v006_exit:
	EXIT_GOOD
Thr1_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v103 DATA_VA=0x636000196000
attr_data {
	Name = .Thr1_User_Data_4v103 ,
	VA = 0x636000196000 ,/* 0x636000197fc0 */
	RA = 0x03301e4000 ,
	PA = 0x03301e4000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006360001969c6 80000003301e4040 */
	end_label   = Thr1_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v103_data_begin
Thr1_User_Data_4v103_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v303 DATA_VA=0x636000042000
attr_data {
	Name = .Thr1_User_Data_4v303 ,
	VA = 0x636000042000 ,/* 0x636000043fc0 */
	RA = 0x0330138000 ,
	PA = 0x0330138000 ,
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
	/* DTTE_TAG_DATA = 0000636000042000 8000000330138440 */
	end_label   = Thr1_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v303_data_begin
Thr1_User_Data_4v303_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v007 TEXT_VA=0x640000030000
attr_text {
	Name = .Thr1_User_Text_4v007 ,
	VA = 0x640000030000 ,/* 0x64000003ffc0 */
	RA = 0x01e0000000 ,
	PA = 0x1de0000000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006400000309c6 8000001de0000081 */
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
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
thr1_MMU_ASI_BLK_P_90:
	.word	0x878020f0
	.word	0xe3be66c0
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_PRIMARY_91:
	.word	0x87802080
	.word	0xdaf42020
	.word	0x1000000
	or	%g0, 0x038, %i7
	LOAD_IDATA_IN
	.word	0xfcda9000
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x48, %i7
	READ_IDATA_ACCESS
	.word	0xf87420f8
	.word	0xc072a710
	IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xda776000
	.word	0xc028adb6
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
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0376a26
	DDEMAP_PCTX
	.word	0xcc742018
	.word	0xc035a364
	.word	0xbe816040
	.word	0xe39fde20
	.word	0xd85da018
	ACCESS_ITSB_PTR
	nop
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x009, %i7
	LOAD_DDATA_IN
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
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x3b0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x6d0, %i7
	DTLB_TAG_READ
	.word	0xf275a130
	.word	0xc02aa6ac
	ACCESS_ITSB_PTR
	.word	0xca742010
	.word	0xc03423be
	.word	0xfe46e2a8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a068
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x84, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x598, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0xd275a118
	.word	0xc0312140
	.word	0xbe82a130
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe150000
	DDEMAP_PAGE
thr1_MMU_ASI_PRIMARY_92:
	.word	0x87802080
	.word	0xeaf2a020
	.word	0xec75a098
	.word	0xc02669e0
	.word	0xbe82a008
	.word	0xecdfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe144000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x20, %i7
	READ_IDATA_ACCESS
	.word	0xfe42ab70
	.word	0xfc9c1000
	.word	0x1000000
	or	%g0, 0x740, %i7
	DTLB_TAG_READ
	.word	0xfcdad160
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe07420f0
	.word	0xc032a1a6
	.word	0xc075a140
thr1_MMU_ASI_BLK_P_93:
	.word	0x878020f0
	.word	0xc1bee380
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe85a0b0
	.word	0xd4dfd000
	nop
	.word	0xe25c2010
	ACCESS_ITSB_PTR
	.word	0xec5da110
	.word	0x1000000
	or	%g0, 0x022, %i7
	LOAD_IDATA_IN
	.word	0xfe4c2022
	.word	0x1000000
	or	%g0, 0x550, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_PRIMARY_94:
	.word	0x87802080
	.word	0xe0f42098
thr1_MMU_ASI_PRIMARY_95:
	.word	0x87802080
	.word	0xe6f6e020
thr1_MMU_ASI_BLK_SL_96:
	.word	0x878020f9
	.word	0xe3bae140
thr1_MMU_ASI_SECONDARY_LITTLE_97:
	.word	0x87802089
	.word	0xc0bae730
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xf67420d0
	.word	0xc02aa140
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v007_exit:
	EXIT_GOOD
Thr1_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v104 DATA_VA=0x636000016000
attr_data {
	Name = .Thr1_User_Data_4v104 ,
	VA = 0x636000016000 ,/* 0x636000017fc0 */
	RA = 0x0330132000 ,
	PA = 0x0330132000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006360000169c6 8000000330132040 */
	end_label   = Thr1_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v104_data_begin
Thr1_User_Data_4v104_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v008 TEXT_VA=0x636000176000
attr_text {
	Name = .Thr1_User_Text_4v008 ,
	VA = 0x636000176000 ,/* 0x636000177fc0 */
	RA = 0x03300bc000 ,
	PA = 0x03300bc000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006360001769c6 80000003300bc080 */
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
	.word	0xc0712b88
	ACCESS_DTSB_PTR
	DDEMAP_PCTX
	.word	0xfe5c27c0
	.word	0x1000000
	or	%g0, 0x770, %i7
	READ_DDATA_ACCESS
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x60, %i7
	DTLB_TAG_READ
	.word	0xbe842068
	.word	0xd4dfd000
	DDEMAP_SCTX
thr1_MMU_ASI_PRIMARY_98:
	.word	0x87802080
	.word	0xfaf2a008
	.word	0x1000000
	or	%g0, 0x70, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xdc742058
	.word	0xc0266c10
	.word	0xe3995e20
	.word	0xc035a140
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0xf8, %i7
	ITLB_TAG_READ
	IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x07c, %i7
	LOAD_DDATA_IN
	.word	0xfe512b4e
	IDEMAP_NCTX
	.word	0x1000000
	.word	0xbe160000
	IDEMAP_PAGE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe150000
	DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xb0, %i7
	ITLB_TAG_READ
	.word	0xbe816010
	.word	0xcadfd020
	.word	0xc075ad58
	.word	0xfcdc1040
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc0366d90
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfa5c2098
	DDEMAP_NCTX
thr1_MMU_ASI_PRIMARY_99:
	.word	0x87802080
	.word	0xdcf42028
	.word	0x1000000
	or	%g0, 0x690, %i7
	LOAD_DDATA_ACCESS
thr1_MMU_ASI_PRIMARY_100:
	.word	0x87802080
	.word	0xccf76018
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0242b34
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v008_exit:
	EXIT_GOOD
Thr1_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v105 DATA_VA=0x6360001f2000
attr_data {
	Name = .Thr1_User_Data_4v105 ,
	VA = 0x6360001f2000 ,/* 0x6360001f3fc0 */
	RA = 0x03300d4000 ,
	PA = 0x03300d4000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006360001f29c6 80000003300d4040 */
	end_label   = Thr1_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v105_data_begin
Thr1_User_Data_4v105_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v009 TEXT_VA=0x640000150000
attr_text {
	Name = .Thr1_User_Text_4v009 ,
	VA = 0x640000150000 ,/* 0x64000015ffc0 */
	RA = 0x01e0710000 ,
	PA = 0x1de0710000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006400001509c6 8000001de0710081 */
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
thr1_MMU_ASI_PRIMARY_101:
	.word	0x87802080
	.word	0xcaf2a040
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x072, %i7
	LOAD_IDATA_IN
thr1_MMU_ASI_PRIMARY_102:
	.word	0x87802080
	.word	0xecf5a0c0
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xfe4daa33
	.word	0x1000000
	or	%g0, 0xb4, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	.word	0xbe816010
	.word	0xcadfd020
	.word	0x1000000
	or	%g0, 0x16c, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcdc1140
	ACCESS_ITSB_PTR
	.word	0xfcda9000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xbe876100
	.word	0xd4dfd000
	.word	0xbe816010
	.word	0xe39fde20
	.word	0xfcdc1000
thr1_MMU_ASI_BLK_COMMIT_P_103:
	.word	0x878020e0
	.word	0xc1bc2e40
	.word	0xc02c26aa
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_RPAGE
	.word	0xfc9a9d40
	.word	0x1000000
	or	%g0, 0x38e, %i7
	LOAD_DDATA_ACCESS
	.word	0xd45da110
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x47f, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_SCTX
	IDEMAP_PCTX
	.word	0xc032ae72
thr1_MMU_ASI_PRIMARY_104:
	.word	0x87802080
	.word	0xc8f420c0
	.word	0xc85aa098
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	.word	0xfe4422a0
	.word	0x1000000
	.word	0xbe138000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe5da9d8
	.word	0xc036e57a
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0xfc9edc40
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc02aa9d1
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v009_exit:
	EXIT_GOOD
Thr1_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v106 DATA_VA=0x636000094000
attr_data {
	Name = .Thr1_User_Data_4v106 ,
	VA = 0x636000094000 ,/* 0x636000095fc0 */
	RA = 0x03301be000 ,
	PA = 0x03301be000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006360000949c6 80000003301be040 */
	end_label   = Thr1_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v106_data_begin
Thr1_User_Data_4v106_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00a TEXT_VA=0x650013400000
attr_text {
	Name = .Thr1_User_Text_4v00a ,
	VA = 0x650013400000 ,/* 0x6500137fffc0 */
	RA = 0x03bc800000 ,
	PA = 0x1fbc800000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000065001340096b 8000001fbc800083 */
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
	.word	0xfcdd9000
	.word	0x1000000
	.word	0xbe118000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
thr1_MMU_ASI_BLK_P_105:
	.word	0x878020f0
	.word	0xc3bc2c80
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe10c000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x348, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x011, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc07425a8
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00a_exit:
	EXIT_GOOD
Thr1_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v107 DATA_VA=0x6400008d0000
attr_data {
	Name = .Thr1_User_Data_4v107 ,
	VA = 0x6400008d0000 ,/* 0x6400008dffc0 */
	RA = 0x01e0c30000 ,
	PA = 0x1de0c30000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006400008d09c6 8000001de0c30041 */
	end_label   = Thr1_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v107_data_begin
Thr1_User_Data_4v107_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00b TEXT_VA=0x6360001bc000
attr_text {
	Name = .Thr1_User_Text_4v00b ,
	VA = 0x6360001bc000 ,/* 0x6360001bdfc0 */
	RA = 0x03301fe000 ,
	PA = 0x03301fe000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006360001bc9c6 80000003301fe080 */
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
	or	%g0, 0x148, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe85a098
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
	.word	0xec5e6138
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x168, %i7
	DTLB_TAG_READ
	.word	0xfe55af92
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0x750, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x660, %i7
	READ_DDATA_ACCESS
	DDEMAP_SCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0xc02e6140
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_NCTX
	.word	0xd8776078
	.word	0xc02aa962
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr1_MMU_ASI_BLK_P_106:
	.word	0x878020f0
	.word	0xe1baaf00
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x4ba, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	READ_IDATA_ACCESS
	.word	0xc072ac90
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	ITLB_TAG_READ
	.word	0xf65aa0c0
	.word	0xc85aa0d0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a098
	.word	0xf2dfd000
	nop
	nop
	nop
	TOGGLE_LSU_IM
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr1_MMU_ASI_BLK_P_107:
	.word	0x878020f0
	.word	0xc1baa280
	DDEMAP_ALL
	IDEMAP_PCTX
	.word	0xc02e6b13
	DDEMAP_SCTX
thr1_MMU_ASI_PRIMARY_108:
	.word	0x87802080
	.word	0xc6f12030
thr1_MMU_ASI_PRIMARY_109:
	.word	0x87802080
	.word	0xc4f76098
	.word	0xf25f6110
	.word	0xc0776618
	.word	0xfcdd9100
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xcc5aa018
	.word	0xe875a028
	.word	0xc0742330
	.word	0xc02f6538
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc02e66e6
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v00b_exit:
	EXIT_GOOD
Thr1_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v108 DATA_VA=0x640000bb0000
attr_data {
	Name = .Thr1_User_Data_4v108 ,
	VA = 0x640000bb0000 ,/* 0x640000bbffc0 */
	RA = 0x01e0b60000 ,
	PA = 0x1de0b60000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000bb09c6 8000001de0b60041 */
	end_label   = Thr1_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v108_data_begin
Thr1_User_Data_4v108_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00c TEXT_VA=0x636000102000
attr_text {
	Name = .Thr1_User_Text_4v00c ,
	VA = 0x636000102000 ,/* 0x636000103fc0 */
	RA = 0x03300c4000 ,
	PA = 0x03300c4000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006360001029c6 80000003300c4080 */
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
	.word	0xc675a0d8
	.word	0xc0766a88
	nop
	nop
	nop
	nop
	nop
	.word	0xec5da0e0
	.word	0xbe150000
	GOTO_SUPERVISOR1
	IDEMAP_ALL_RPAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xf476e0a8
	.word	0xc02aa92a
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xf472a030
	.word	0xc075a1c0
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00c_exit:
	EXIT_GOOD
Thr1_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v109 DATA_VA=0x65002a800000
attr_data {
	Name = .Thr1_User_Data_4v109 ,
	VA = 0x65002a800000 ,/* 0x65002abfffc0 */
	RA = 0x03b5400000 ,
	PA = 0x1fb5400000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000065002a80096b 8000001fb5400043 */
	end_label   = Thr1_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v109_data_begin
Thr1_User_Data_4v109_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00d TEXT_VA=0x65002dc00000
attr_text {
	Name = .Thr1_User_Text_4v00d ,
	VA = 0x65002dc00000 ,/* 0x65002dffffc0 */
	RA = 0x03b9800000 ,
	PA = 0x1fb9800000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000065002dc0096b 8000001fb9800083 */
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
	nop
	nop
	nop
	nop
	.word	0xd0766028
	.word	0xc02c2bda
	.word	0xd45e6068
	.word	0xbe82a0c0
	.word	0xf2dfd000
	.word	0xc0242ba8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc020a878
	IDEMAP_PCTX
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_RPAGE
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe150000
	IDEMAP_RPAGE
	.word	0xfcdd9000
	.word	0xec5da0c0
	.word	0x1000000
	.word	0xbe108000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x5ca, %i7
	LOAD_IDATA_ACCESS
thr1_MMU_ASI_PRIMARY_110:
	.word	0x87802080
	.word	0xdef42108
	DDEMAP_ALL
	.word	0xc035a564
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x528, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0xec5c2138
	IDEMAP_PCTX
	.word	0xfcd89000
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	DTLB_TAG_READ
thr1_MMU_ASI_PRIMARY_111:
	.word	0x87802080
	.word	0xf2f42068
	.word	0xf672a068
	.word	0xc02c2a10
	.word	0xf272a0c0
	.word	0xc02e61c1
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	.word	0xc02da50e
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfc9a9000
	nop
	nop
	nop
	nop
	nop
	.word	0xd276e118
	.word	0xc02ee999
	IDEMAP_ALL_PAGES
thr1_MMU_ASI_SECONDARY_112:
	.word	0x87802081
	.word	0xf8b967e0
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0xd7, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe4c29af
	.word	0xfc9c1c40
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	nop
	.word	0x1000000
	or	%g0, 0x57d, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe55a316
	nop
	IDEMAP_PCTX
	.word	0xfcdc1000
	ACCESS_DTSB_PTR
	.word	0xbe8420f0
	.word	0xecdfd000
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc032a36a
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc02dac4b
	.word	0xda712108
	.word	0xc0376e36
	.word	0x1000000
	or	%g0, 0x06e, %i7
	LOAD_IDATA_IN
	.word	0xc45aa100
	.word	0x1000000
	or	%g0, 0x02e, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe118000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_PAGE
thr1_MMU_ASI_PRIMARY_113:
	.word	0x87802080
	.word	0xc4f42068
	.word	0xbe812098
	.word	0xfadfd000
	.word	0xf0766050
	.word	0xc02c225b
	ACCESS_ITSB_PTR
	.word	0xbe8420b0
	.word	0xfadfd000
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd45c2098
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00d_exit:
	EXIT_GOOD
Thr1_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10a DATA_VA=0x6360001b4000
attr_data {
	Name = .Thr1_User_Data_4v10a ,
	VA = 0x6360001b4000 ,/* 0x6360001b5fc0 */
	RA = 0x03301a0000 ,
	PA = 0x03301a0000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006360001b49c6 80000003301a0040 */
	end_label   = Thr1_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10a_data_begin
Thr1_User_Data_4v10a_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00e TEXT_VA=0x6360001e6000
attr_text {
	Name = .Thr1_User_Text_4v00e ,
	VA = 0x6360001e6000 ,/* 0x6360001e7fc0 */
	RA = 0x033005c000 ,
	PA = 0x033005c000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006360001e69c6 800000033005c080 */
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
	.word	0xbe866100
	.word	0xf2dfd000
	nop
	nop
	DDEMAP_PCTX
	.word	0xc45c2098
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc45c20c0
	.word	0xf875a020
	.word	0xc02dacd8
	.word	0xfe5c2660
	DDEMAP_NCTX
	.word	0xbe154000
	GOTO_SUPERVISOR0
thr1_MMU_ASI_PRIMARY_114:
	.word	0x87802080
	.word	0xf8f76080
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xca5e6010
	.word	0xfcda9000
	.word	0xc1995f20
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0xfe566ea0
	.word	0x1000000
	.word	0xbe10c000
	IDEMAP_RPAGE
	DDEMAP_PCTX
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xda776118
	.word	0xc0342436
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x108, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5da, %i7
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
	nop
	nop
	.word	0xbe842138
	.word	0xfadfd000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe05aa0e0
	.word	0xe05da098
	.word	0xbe85a0f0
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xec5aa110
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v00e_exit:
	EXIT_GOOD
Thr1_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10b DATA_VA=0x6400004f0000
attr_data {
	Name = .Thr1_User_Data_4v10b ,
	VA = 0x6400004f0000 ,/* 0x6400004fffc0 */
	RA = 0x01e0fa0000 ,
	PA = 0x1de0fa0000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006400004f09c6 8000001de0fa0041 */
	end_label   = Thr1_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10b_data_begin
Thr1_User_Data_4v10b_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00f TEXT_VA=0x636000112000
attr_text {
	Name = .Thr1_User_Text_4v00f ,
	VA = 0x636000112000 ,/* 0x636000113fc0 */
	RA = 0x0330090000 ,
	PA = 0x0330090000 ,
	TTE_Context = 0x09c6 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006360001129c6 8000000330090080 */
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
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe466960
	.word	0xf2776110
	.word	0xc02f6f39
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
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x58, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x19a, %i7
	LOAD_IDATA_ACCESS
	.word	0xfc995020
	ACCESS_ITSB_PTR
	.word	0xfcdf5000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x160, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x2f0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x280, %i7
	READ_DDATA_ACCESS
	DDEMAP_ALL
	TOGGLE_LSU_DM
	ACCESS_DTSB_PTR
	IDEMAP_ALL_RPAGES
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe138000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0xf5, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x01e, %i7
	LOAD_DDATA_IN
	.word	0xec5aa0c0
thr1_MMU_ASI_PRIMARY_115:
	.word	0x87802080
	.word	0xeef2a0a0
	.word	0x1000000
	or	%g0, 0x568, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr1_MMU_ASI_PRIMARY_116:
	.word	0x87802080
	.word	0xccf5a018
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x5d0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x1c3, %i7
	LOAD_IDATA_ACCESS
	.word	0xd45c2098
	.word	0x1000000
	.word	0xbe15c000
	DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe5929c8
	.word	0xd2766060
	.word	0xc0276d80
	.word	0xf472a000
	.word	0xc076efe0
	.word	0x1000000
	.word	0xbe148000
	IDEMAP_RPAGE
	.word	0xfe512dac
thr1_MMU_ASI_SECONDARY_117:
	.word	0x87802081
	.word	0xd8f16018
	.word	0xda72a090
	.word	0xc02da8d2
	.word	0x1000000
	or	%g0, 0x2e9, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe4aa2eb
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd872a0a0
	.word	0xc02aaa93
	.word	0xfe52a102
	.word	0xfa5da0e0
	.word	0x1000000
	or	%g0, 0x650, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	.word	0xc472a068
	.word	0xc02c24d5
	.word	0xcc776078
	.word	0xc022ad7c
	ACCESS_DTSB_PTR
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe05c2068
thr1_MMU_ASI_BLK_SL_118:
	.word	0x878020f9
	.word	0xc1bc6b00
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x432, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe56eede
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00f_exit:
	EXIT_GOOD
Thr1_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10c DATA_VA=0x650034400000
attr_data {
	Name = .Thr1_User_Data_4v10c ,
	VA = 0x650034400000 ,/* 0x6500347fffc0 */
	RA = 0x03bd800000 ,
	PA = 0x1fbd800000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000065003440096b 8000001fbd800043 */
	end_label   = Thr1_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10c_data_begin
Thr1_User_Data_4v10c_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10d DATA_VA=0x636000106000
attr_data {
	Name = .Thr1_User_Data_4v10d ,
	VA = 0x636000106000 ,/* 0x636000107fc0 */
	RA = 0x0330188000 ,
	PA = 0x0330188000 ,
	TTE_Context = 0x09c6 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006360001069c6 8000000330188040 */
	end_label   = Thr1_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10d_data_begin
Thr1_User_Data_4v10d_data_begin:
	.xword	0x6360001ce000
	.xword	0x640000000000
	.xword	0x636000004000
	.xword	0x636000032000
	.xword	0x65002ec00000
	.xword	0x63600005e000
	.xword	0x63600006a000
	.xword	0x63600018a000
	.xword	0x6360001e8000
	.xword	0x6400001c0000
	.xword	0x640000680000
	.xword	0x650002c00000
	.xword	0x6360001d0000
	.xword	0x63600009a000
	.xword	0x640000570000
	.xword	0x660b10000000
	.xword	0x6400000f0000
	.xword	0x65002a000000
	.xword	0x650022000000
	.xword	0x636000196000
	.xword	0x636000042000
	.xword	0x640000030000
	.xword	0x636000016000
	.xword	0x636000176000
	.xword	0x6360001f2000
	.xword	0x640000150000
	.xword	0x636000094000
	.xword	0x650013400000
	.xword	0x6400008d0000
	.xword	0x6360001bc000
	.xword	0x640000bb0000
	.xword	0x636000102000
	.xword	0x65002a800000
	.xword	0x65002dc00000
	.xword	0x6360001b4000
	.xword	0x6360001e6000
	.xword	0x6400004f0000
	.xword	0x636000112000
	.xword	0x650034400000
	.xword	0x636000106000
Thr1_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x680000d00000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	VA = 0x680000d00000 ,/* 0x680000d0ffc0 */
	RA = 0x01f0950000 ,
	PA = 0x01f0950000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000d00984 80000001f0950481 */
	end_label   = Thr2_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr2_user_code_entry
Thr2_user_code_entry:
	setx	0x690025000000, %g1, %g2
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
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	.word	0xc0352ad6
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe866008
	.word	0xd4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5aa988
thr2_MMU_ASI_SECONDARY_119:
	.word	0x87802081
	.word	0xc6f16090
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe82a0f0
	.word	0xe39fde00
	.word	0xbe158000
	GOTO_SUPERVISOR1
	.word	0xcc5aa018
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v000_exit:
	EXIT_GOOD
Thr2_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v100 DATA_VA=0x690025000000
attr_data {
	Name = .Thr2_User_Data_4v100 ,
	VA = 0x690025000000 ,/* 0x6900253fffc0 */
	RA = 0x03c2400000 ,
	PA = 0x2fc2400000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000690025000984 8000002fc2400043 */
	end_label   = Thr2_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v100_data_begin
Thr2_User_Data_4v100_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v200 DATA_VA=0x6770000da000
attr_data {
	Name = .Thr2_User_Data_4v200 ,
	VA = 0x6770000da000 ,/* 0x6770000dbfc0 */
	RA = 0x0340160000 ,
	PA = 0x0340160000 ,
	TTE_Context = 0x031c ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006770000da31c 8000000340160440 */
	end_label   = Thr2_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v200_data_begin
Thr2_User_Data_4v200_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v300 DATA_VA=0x6770001ea000
attr_data {
	Name = .Thr2_User_Data_4v300 ,
	VA = 0x6770001ea000 ,/* 0x6770001ebfc0 */
	RA = 0x034002c000 ,
	PA = 0x034002c000 ,
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
	/* DTTE_TAG_DATA = 00006770001ea000 800000034002c440 */
	end_label   = Thr2_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v300_data_begin
Thr2_User_Data_4v300_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v001 TEXT_VA=0x680000020000
attr_text {
	Name = .Thr2_User_Text_4v001 ,
	VA = 0x680000020000 ,/* 0x68000002ffc0 */
	RA = 0x01f09b0000 ,
	PA = 0x01f09b0000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000020984 80000001f09b0481 */
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
	nop
	nop
	.word	0x1000000
	or	%g0, 0x160, %i7
	READ_DDATA_ACCESS
	.word	0xc0352300
	.word	0xfe442d14
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	DTLB_TAG_READ
	.word	0xe05c2068
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x431, %i7
	LOAD_DDATA_ACCESS
	.word	0xc45d2008
	nop
	DDEMAP_SCTX
thr2_MMU_ASI_BLK_COMMIT_P_120:
	.word	0x878020e0
	.word	0xc1baaac0
	.word	0xd8766048
	.word	0xc02ee9c3
	.word	0x1000000
	or	%g0, 0x510, %i7
	READ_IDATA_ACCESS
	.word	0xfcdc1000
	.word	0xbe82e010
	.word	0xcadfd060
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe108000
	IDEMAP_RPAGE
	ACCESS_DTSB_PTR
	.word	0xfa5d20f0
	.word	0xfe542de2
	.word	0x1000000
	or	%g0, 0x777, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_PAGE
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x0ac, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcda9000
	.word	0x1000000
	.word	0xbe13c000
	IDEMAP_PAGE
thr2_MMU_ASI_PRIMARY_121:
	.word	0x87802080
	.word	0xeaf52020
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x98, %i7
	READ_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xf075e000
	.word	0xc02de2a5
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v001_exit:
	EXIT_GOOD
Thr2_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v400 TEXT_VA=0x677000154000
attr_text {
	Name = .Thr2_User_Text_4v400 ,
	VA = 0x677000154000 ,/* 0x677000155fc0 */
	RA = 0x03401ea000 ,
	PA = 0x03401ea000 ,
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
	/* ITTE_TAG_DATA = 0000677000154000 80000003401ea080 */
	end_label   = Thr2_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v400_text_begin
Thr2_User_Text_4v400_text_begin:
	wrpr	0, %gl
	nop
	nop
	P_DDEMAP_ALL_PAGES
thr2_MMU_ASI_PRIMARY_122:
	.word	0x87802080
	.word	0xf6f6e0e0
thr2_MMU_ASI_AS_IF_USER_PRIMARY_123:
	.word	0x87802010
	.word	0xd0f12058
	.word	0xfcd8c2a0
	P_DDEMAP_ALL_RPAGES
	.word	0xfcddc200
	.word	0xbe8420e0
	.word	0xf2dfc200
	nop
thr2_MMU_ASI_PRIMARY_LITTLE_124:
	.word	0x87802088
	.word	0xfcbd2cb0
	.word	0xf659a0c0
	.word	0xfcdc0200
	.word	0xbe816010
	.word	0xcadfd020
	.word	0x1000000
	.word	0xbe118000
	P_DDEMAP_RPAGE
	.word	0xbe85e0c0
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x780, %i7
	P_DTLB_TAG_READ
	.word	0xfe41a47c
	.word	0xfc9ad020
	.word	0xbe816010
	.word	0xcadfd060
	.word	0xfcd90200
	.word	0xbe85e088
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe86e008
	.word	0xfadfd000
	.word	0xe19942e0
	.word	0xfcd90200
	.word	0xd671a040
	.word	0xc0332532
	P_DDEMAP_SCTX
	nop
	nop
	nop
	nop
thr2_MMU_ASI_AS_IF_USER_PRIMARY_125:
	.word	0x87802010
	.word	0xf0f76078
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v400_exit:
	EXIT_GOOD
Thr2_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v002 TEXT_VA=0x680000cb0000
attr_text {
	Name = .Thr2_User_Text_4v002 ,
	VA = 0x680000cb0000 ,/* 0x680000cbffc0 */
	RA = 0x01f0650000 ,
	PA = 0x01f0650000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000cb0984 80000001f0650481 */
	end_label   = Thr2_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v002_text_begin
Thr2_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x3c0, %i7
	P_READ_DDATA_ACCESS
	P_ACCESS_ITSB_PTR
	P_IDEMAP_NCTX
	P_TOGGLE_LSU_DM
	.word	0xbe852110
	.word	0xd4dfc200
	.word	0xc45aa140
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x578, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe80a128
	.word	0xeedfc200
	.word	0x1000000
	or	%g0, 0x7f8, %i7
	P_DTLB_TAG_READ
	P_TOGGLE_LSU_DM
	nop
	nop
	.word	0xe05de068
	.word	0xfcde5000
	.word	0xfcdd0200
	.word	0xfc998480
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
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xc035e31c
	.word	0xbe842088
	.word	0xc8dfd000
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
	or	%g0, 0x590, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1d8, %i7
	P_READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_AS_IF_USER_PRIMARY_126:
	.word	0x87802010
	.word	0xe2f42048
	.word	0xc0266868
	.word	0xbe82a0e0
	.word	0xf6dfc200
thr2_MMU_ASI_PRIMARY_127:
	.word	0x87802080
	.word	0xd8f12018
	.word	0x1000000
	or	%g0, 0x98, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x67f, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xc028a448
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR0
	nop
Thr2_User_Text_4v002_exit:
	EXIT_GOOD
Thr2_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v101 DATA_VA=0x690037000000
attr_data {
	Name = .Thr2_User_Data_4v101 ,
	VA = 0x690037000000 ,/* 0x6900373fffc0 */
	RA = 0x03cfc00000 ,
	PA = 0x2fcfc00000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000690037000984 8000002fcfc00043 */
	end_label   = Thr2_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v101_data_begin
Thr2_User_Data_4v101_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v201 DATA_VA=0x680000590000
attr_data {
	Name = .Thr2_User_Data_4v201 ,
	VA = 0x680000590000 ,/* 0x68000059ffc0 */
	RA = 0x01f0aa0000 ,
	PA = 0x01f0aa0000 ,
	TTE_Context = 0x031c ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_0 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 000068000059031c 80000001f0aa0441 */
	end_label   = Thr2_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v201_data_begin
Thr2_User_Data_4v201_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v301 DATA_VA=0x690002400000
attr_data {
	Name = .Thr2_User_Data_4v301 ,
	VA = 0x690002400000 ,/* 0x6900027fffc0 */
	RA = 0x03c1800000 ,
	PA = 0x03c1800000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_0 ,
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
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 0000690002400000 80000003c1800443 */
	end_label   = Thr2_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v301_data_begin
Thr2_User_Data_4v301_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v003 TEXT_VA=0x6770000c0000
attr_text {
	Name = .Thr2_User_Text_4v003 ,
	VA = 0x6770000c0000 ,/* 0x6770000c1fc0 */
	RA = 0x0340026000 ,
	PA = 0x0340026000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006770000c0984 8000000340026480 */
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
	.word	0xfcd95160
	.word	0x1000000
	or	%g0, 0x480, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x09c, %i7
	LOAD_DDATA_IN
	.word	0xc036ea7a
	nop
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x418, %i7
	READ_IDATA_ACCESS
	.word	0xe39c1e00
	.word	0xfe52af96
	.word	0xfe58ad60
	.word	0xfcddd000
	.word	0xc036e668
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfa75e150
	.word	0xc0252cc4
	.word	0x1000000
	or	%g0, 0x7c0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x539, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc02aaa54
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v003_exit:
	EXIT_GOOD
Thr2_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v401 TEXT_VA=0x677000146000
attr_text {
	Name = .Thr2_User_Text_4v401 ,
	VA = 0x677000146000 ,/* 0x677000147fc0 */
	RA = 0x034005e000 ,
	PA = 0x034005e000 ,
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
	/* ITTE_TAG_DATA = 0000677000146000 800000034005e080 */
	end_label   = Thr2_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v401_text_begin
Thr2_User_Text_4v401_text_begin:
	wrpr	0, %gl
	P_IDEMAP_PCTX
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x728, %i7
	P_DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_PRIMARY_LITTLE_128:
	.word	0x87802088
	.word	0xfaf42038
	P_IDEMAP_ALL_PAGES
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x480, %i7
	P_READ_IDATA_ACCESS
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0xf0, %i7
	P_ITLB_TAG_READ
	.word	0xc02c6e1a
	.word	0xe05b2038
	P_DDEMAP_ALL_PAGES
	.word	0xfc9984e0
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
	.word	0xbe110000
	P_IDEMAP_RPAGE
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
	.word	0xfcd90200
	.word	0xbe82a068
	.word	0xc4dfc200
thr2_MMU_ASI_PRIMARY_129:
	.word	0x87802080
	.word	0xdef52000
	.word	0x1000000
	or	%g0, 0x00f, %i7
	P_LOAD_IDATA_IN
	P_IDEMAP_PCTX
	.word	0xbe82a138
	.word	0xeedfd000
	.word	0xfc998580
	.word	0xfe51a02a
	.word	0x1000000
	or	%g0, 0x58, %i7
	P_ITLB_TAG_READ
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe128000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x075, %i7
	P_LOAD_IDATA_IN
	.word	0xfe49a82b
	.word	0xfa59a088
	.word	0x1000000
	or	%g0, 0x03e, %i7
	P_LOAD_DDATA_IN
	.word	0xbe866068
	.word	0xf6dfc200
thr2_MMU_ASI_BLK_COMMIT_S_130:
	.word	0x878020e1
	.word	0xc3b966c0
thr2_MMU_ASI_AS_IF_USER_PRIMARY_131:
	.word	0x87802010
	.word	0xeef2a008
	.word	0xbe154000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v401_exit:
	EXIT_GOOD
Thr2_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v004 TEXT_VA=0x690005000000
attr_text {
	Name = .Thr2_User_Text_4v004 ,
	VA = 0x690005000000 ,/* 0x6900053fffc0 */
	RA = 0x03c7800000 ,
	PA = 0x2fc7800000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
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
	/* ITTE_TAG_DATA = 0000690005000984 8000002fc7800483 */
	end_label   = Thr2_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v004_text_begin
Thr2_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xfc9d1c40
	.word	0xfc9b05e0
	.word	0xfc9a9c40
	P_TOGGLE_LSU_IM
thr2_MMU_ASI_AS_IF_USER_PRIMARY_132:
	.word	0x87802010
	.word	0xf0f2a060
	P_TOGGLE_LSU_IM
	.word	0xfcd90200
	.word	0xfcdec200
	.word	0xfcda8300
	.word	0x1000000
	or	%g0, 0x03f, %i7
	P_LOAD_DDATA_IN
	.word	0xfcdd1000
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR0
	nop
Thr2_User_Text_4v004_exit:
	EXIT_GOOD
Thr2_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v102 DATA_VA=0x680000380000
attr_data {
	Name = .Thr2_User_Data_4v102 ,
	VA = 0x680000380000 ,/* 0x68000038ffc0 */
	RA = 0x01f0440000 ,
	PA = 0x01f0440000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000380984 80000001f0440041 */
	end_label   = Thr2_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v102_data_begin
Thr2_User_Data_4v102_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v302 DATA_VA=0x677000170000
attr_data {
	Name = .Thr2_User_Data_4v302 ,
	VA = 0x677000170000 ,/* 0x677000171fc0 */
	RA = 0x0340122000 ,
	PA = 0x0340122000 ,
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
	/* DTTE_TAG_DATA = 0000677000170000 8000000340122440 */
	end_label   = Thr2_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v302_data_begin
Thr2_User_Data_4v302_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v005 TEXT_VA=0x69002d800000
attr_text {
	Name = .Thr2_User_Text_4v005 ,
	VA = 0x69002d800000 ,/* 0x69002dbfffc0 */
	RA = 0x03cbc00000 ,
	PA = 0x2fcbc00000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000069002d800984 8000002fcbc00483 */
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
	nop
	nop
	.word	0x1000000
	.word	0xbe140000
	IDEMAP_RPAGE
thr2_MMU_ASI_SECONDARY_133:
	.word	0x87802081
	.word	0xd4b96e00
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa5aa088
thr2_MMU_ASI_PRIMARY_134:
	.word	0x87802080
	.word	0xdcf66080
	.word	0xde7420d8
	.word	0xc02c2da2
thr2_MMU_ASI_PRIMARY_135:
	.word	0x87802080
	.word	0xdef5e0e8
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xbe8420e0
	.word	0xeedfd000
	.word	0x1000000
	.word	0xbe17c000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4c251a
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v005_exit:
	EXIT_GOOD
Thr2_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v402 TEXT_VA=0x6a0d20000000
attr_text {
	Name = .Thr2_User_Text_4v402 ,
	VA = 0x6a0d20000000 ,/* 0x6a0d2fffffc0 */
	RA = 0x0050000000 ,
	PA = 0x2850000000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr2_z_ctx_tsb_1 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 00006a0d20000000 8000002850000085 */
	end_label   = Thr2_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v402_text_begin
Thr2_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	P_ITLB_TAG_READ
	P_DDEMAP_SCTX
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
thr2_MMU_ASI_AS_IF_USER_PRIMARY_136:
	.word	0x87802010
	.word	0xeef52120
	.word	0x1000000
	or	%g0, 0x557, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfcdd0200
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v402_exit:
	EXIT_GOOD
Thr2_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v103 DATA_VA=0x6770001b0000
attr_data {
	Name = .Thr2_User_Data_4v103 ,
	VA = 0x6770001b0000 ,/* 0x6770001b1fc0 */
	RA = 0x03401b4000 ,
	PA = 0x03401b4000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006770001b0984 80000003401b4040 */
	end_label   = Thr2_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v103_data_begin
Thr2_User_Data_4v103_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v006 TEXT_VA=0x6770000b0000
attr_text {
	Name = .Thr2_User_Text_4v006 ,
	VA = 0x6770000b0000 ,/* 0x6770000b1fc0 */
	RA = 0x034006a000 ,
	PA = 0x034006a000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006770000b0984 800000034006a480 */
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
	.word	0xc020aaa0
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x798, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1d5, %i7
	LOAD_IDATA_ACCESS
	.word	0xfc9ad120
	.word	0xfe42a3e4
	.word	0x1000000
	or	%g0, 0x079, %i7
	LOAD_DDATA_IN
thr2_MMU_ASI_PRIMARY_137:
	.word	0x87802080
	.word	0xf2f12068
	.word	0xfcdf5000
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x288, %i7
	READ_DDATA_ACCESS
	.word	0xc0742310
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x628, %i7
	READ_DDATA_ACCESS
	DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe158000
	GOTO_SUPERVISOR1
	.word	0xcc72a018
	.word	0xc032ab0a
	.word	0x1000000
	or	%g0, 0x76f, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe5aa7e0
thr2_MMU_ASI_PRIMARY_138:
	.word	0x87802080
	.word	0xc8f76008
	.word	0xfe4de06a
	.word	0xfe442dc4
	.word	0xbe8420d0
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x110, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xde712090
	.word	0xc022a160
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v006_exit:
	EXIT_GOOD
Thr2_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v403 TEXT_VA=0x6770000a4000
attr_text {
	Name = .Thr2_User_Text_4v403 ,
	VA = 0x6770000a4000 ,/* 0x6770000a5fc0 */
	RA = 0x03401d8000 ,
	PA = 0x03401d8000 ,
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
	/* ITTE_TAG_DATA = 00006770000a4000 80000003401d8080 */
	end_label   = Thr2_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v403_text_begin
Thr2_User_Text_4v403_text_begin:
	wrpr	0, %gl
thr2_MMU_ASI_PRIMARY_139:
	.word	0x87802080
	.word	0xc6f2a000
	.word	0x1000000
	or	%g0, 0x019, %i7
	P_LOAD_IDATA_IN
	P_IDEMAP_ALL_PAGES
	.word	0xfcd90200
	P_DDEMAP_ALL_PAGES
thr2_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_140:
	.word	0x87802018
	.word	0xdef760c8
thr2_MMU_ASI_PRIMARY_141:
	.word	0x87802080
	.word	0xdaf2a0c8
	P_DDEMAP_ALL
	.word	0xbe8760e0
	.word	0xd4dfd040
	P_ACCESS_DTSB_PTR
	.word	0xe071a140
	.word	0xc071a5f0
	.word	0x1000000
	or	%g0, 0x98, %i7
	P_ITLB_TAG_READ
	.word	0xfe51a048
	P_ACCESS_DTSB_PTR
	P_IDEMAP_PCTX
thr2_MMU_ASI_BLK_S_142:
	.word	0x878020f1
	.word	0xc3b96140
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
	P_IDEMAP_NCTX
thr2_MMU_ASI_BLK_SL_143:
	.word	0x878020f9
	.word	0xc1b96780
	P_TOGGLE_LSU_IM
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe17c000
	P_IDEMAP_PAGE
thr2_MMU_ASI_AS_IF_USER_PRIMARY_144:
	.word	0x87802010
	.word	0xecf12028
	.word	0x1000000
	.word	0xbe178000
	P_DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	P_READ_IDATA_ACCESS
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
	or	%g0, 0xe0, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe138000
	P_IDEMAP_PAGE
	P_TOGGLE_LSU_DM
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x8, %i7
	P_DTLB_TAG_READ
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v403_exit:
	EXIT_GOOD
Thr2_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v104 DATA_VA=0x6770001a2000
attr_data {
	Name = .Thr2_User_Data_4v104 ,
	VA = 0x6770001a2000 ,/* 0x6770001a3fc0 */
	RA = 0x03400d0000 ,
	PA = 0x03400d0000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006770001a2984 80000003400d0040 */
	end_label   = Thr2_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v104_data_begin
Thr2_User_Data_4v104_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v007 TEXT_VA=0x67700015a000
attr_text {
	Name = .Thr2_User_Text_4v007 ,
	VA = 0x67700015a000 ,/* 0x67700015bfc0 */
	RA = 0x034013a000 ,
	PA = 0x034013a000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000067700015a984 800000034013a480 */
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
	TOGGLE_LSU_DM
	.word	0xec766028
	.word	0xc0292f05
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
	or	%g0, 0x18f, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x150, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0766570
	IDEMAP_NCTX
	.word	0xbe86e100
	.word	0xe0dfd000
	.word	0xf676e128
	.word	0xc02769d0
	.word	0x1000000
	.word	0xbe108000
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
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd85d2018
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x2d0, %i7
	READ_DDATA_ACCESS
	.word	0xfc9adc60
	IDEMAP_PCTX
	.word	0xfe5eeea8
	nop
	nop
	nop
	nop
	.word	0xfe45298c
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe164000
	IDEMAP_RPAGE
	.word	0xfe452b00
	nop
	nop
	nop
	nop
	.word	0xfe56664e
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcde5000
thr2_MMU_ASI_PRIMARY_145:
	.word	0x87802080
	.word	0xcaf42010
	.word	0xe8766088
	.word	0xc076ea28
	nop
	nop
	nop
	nop
	nop
	.word	0xfe56e2cc
	.word	0xfc9a9d40
	.word	0x1000000
	.word	0xbe120000
	DDEMAP_RPAGE
	.word	0xe85d2088
	.word	0xfe4420d8
	.word	0xd85f6018
	.word	0xe472a078
	.word	0xc0742160
	.word	0xee5e6138
	.word	0xfe4126e8
	.word	0xc022a6dc
	.word	0x1000000
	.word	0xbe124000
	IDEMAP_PAGE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa5c2088
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v007_exit:
	EXIT_GOOD
Thr2_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v105 DATA_VA=0x680000420000
attr_data {
	Name = .Thr2_User_Data_4v105 ,
	VA = 0x680000420000 ,/* 0x68000042ffc0 */
	RA = 0x01f0c70000 ,
	PA = 0x01f0c70000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000420984 80000001f0c70041 */
	end_label   = Thr2_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v105_data_begin
Thr2_User_Data_4v105_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v008 TEXT_VA=0x6770001b2000
attr_text {
	Name = .Thr2_User_Text_4v008 ,
	VA = 0x6770001b2000 ,/* 0x6770001b3fc0 */
	RA = 0x0340022000 ,
	PA = 0x0340022000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006770001b2984 8000000340022480 */
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
	or	%g0, 0xe0, %i7
	READ_DDATA_ACCESS
	.word	0xd0752058
	.word	0xc02d298d
	.word	0xfc995020
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfa5c2100
	.word	0x1000000
	or	%g0, 0x0b4, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x6b0, %i7
	READ_DDATA_ACCESS
	.word	0xfe442b68
	.word	0x1000000
	or	%g0, 0x41d, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x150, %i7
	READ_DDATA_ACCESS
	.word	0xbe852148
	.word	0xeedfd040
	.word	0x1000000
	.word	0xbe160000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x07e, %i7
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
	.word	0x1000000
	or	%g0, 0x574, %i7
	LOAD_IDATA_ACCESS
thr2_MMU_ASI_PRIMARY_146:
	.word	0x87802080
	.word	0xf6f2a120
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x358, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe552bb2
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x110, %i7
	READ_IDATA_ACCESS
	.word	0xfcdad160
	.word	0x1000000
	or	%g0, 0x527, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x640, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdf5000
	nop
	nop
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe492884
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v008_exit:
	EXIT_GOOD
Thr2_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v106 DATA_VA=0x680000660000
attr_data {
	Name = .Thr2_User_Data_4v106 ,
	VA = 0x680000660000 ,/* 0x68000066ffc0 */
	RA = 0x01f0e40000 ,
	PA = 0x01f0e40000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000660984 80000001f0e40041 */
	end_label   = Thr2_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v106_data_begin
Thr2_User_Data_4v106_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v009 TEXT_VA=0x6800008f0000
attr_text {
	Name = .Thr2_User_Text_4v009 ,
	VA = 0x6800008f0000 ,/* 0x6800008fffc0 */
	RA = 0x01f0b80000 ,
	PA = 0x01f0b80000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006800008f0984 80000001f0b80481 */
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
	.word	0xc67760e8
	.word	0xc075e938
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	TOGGLE_LSU_DM
	nop
	nop
	nop
	.word	0xbe85e140
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfc995d60
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x48, %i7
	READ_IDATA_ACCESS
	.word	0xfe46e468
	.word	0x1000000
	or	%g0, 0x074, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe124000
	DDEMAP_PAGE
	.word	0xf65c2038
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x05f, %i7
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
	.word	0xe472a000
	.word	0xc0252938
	.word	0xfcd91000
	.word	0xc032a754
	.word	0xbe158000
	GOTO_SUPERVISOR1
	.word	0xc0242a9c
	.word	0xbe158000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v009_exit:
	EXIT_GOOD
Thr2_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v107 DATA_VA=0x680000110000
attr_data {
	Name = .Thr2_User_Data_4v107 ,
	VA = 0x680000110000 ,/* 0x68000011ffc0 */
	RA = 0x01f0850000 ,
	PA = 0x01f0850000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000110984 80000001f0850041 */
	end_label   = Thr2_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v107_data_begin
Thr2_User_Data_4v107_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00a TEXT_VA=0x690032400000
attr_text {
	Name = .Thr2_User_Text_4v00a ,
	VA = 0x690032400000 ,/* 0x6900327fffc0 */
	RA = 0x03c0000000 ,
	PA = 0x2fc0000000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000690032400984 8000002fc0000483 */
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
	.word	0xfe576a34
	.word	0xfc9d1c40
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd6592040
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc3995f20
	.word	0x1000000
	or	%g0, 0x608, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_PRIMARY_147:
	.word	0x87802080
	.word	0xe8baa7e0
	.word	0x1000000
	or	%g0, 0x460, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	.word	0xc0776e00
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x2ee, %i7
	LOAD_DDATA_ACCESS
	.word	0xfc9c1c40
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
	ACCESS_ITSB_PTR
	.word	0xfe5c20b0
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe100000
	DDEMAP_PAGE
	.word	0xfe4de28f
	.word	0x1000000
	or	%g0, 0x578, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0276e8c
	.word	0xbe158000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v00a_exit:
	EXIT_GOOD
Thr2_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v108 DATA_VA=0x690010400000
attr_data {
	Name = .Thr2_User_Data_4v108 ,
	VA = 0x690010400000 ,/* 0x6900107fffc0 */
	RA = 0x03ce000000 ,
	PA = 0x2fce000000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000690010400984 8000002fce000043 */
	end_label   = Thr2_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v108_data_begin
Thr2_User_Data_4v108_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00b TEXT_VA=0x680000eb0000
attr_text {
	Name = .Thr2_User_Text_4v00b ,
	VA = 0x680000eb0000 ,/* 0x680000ebffc0 */
	RA = 0x01f0d00000 ,
	PA = 0x01f0d00000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000eb0984 80000001f0d00481 */
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
	.word	0xd275e060
	.word	0xc031285a
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x548, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x052, %i7
	LOAD_DDATA_IN
	.word	0xc03128fe
	nop
	.word	0xcc72a048
	.word	0xc02aab5b
	TOGGLE_LSU_IM
	.word	0xc02d233f
	.word	0x1000000
	or	%g0, 0x0a3, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc8712008
	.word	0xc0342d2a
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00b_exit:
	EXIT_GOOD
Thr2_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v109 DATA_VA=0x6800009f0000
attr_data {
	Name = .Thr2_User_Data_4v109 ,
	VA = 0x6800009f0000 ,/* 0x6800009fffc0 */
	RA = 0x01f0db0000 ,
	PA = 0x01f0db0000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800009f0984 80000001f0db0041 */
	end_label   = Thr2_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v109_data_begin
Thr2_User_Data_4v109_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00c TEXT_VA=0x69003dc00000
attr_text {
	Name = .Thr2_User_Text_4v00c ,
	VA = 0x69003dc00000 ,/* 0x69003dffffc0 */
	RA = 0x03c0400000 ,
	PA = 0x2fc0400000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000069003dc00984 8000002fc0400483 */
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
	.word	0xe85c2088
	.word	0x1000000
	or	%g0, 0x540, %i7
	ITLB_TAG_READ
	IDEMAP_PCTX
	ACCESS_DTSB_PTR
	.word	0xc024280c
	.word	0x1000000
	.word	0xbe154000
	IDEMAP_PAGE
	.word	0xf0742030
	.word	0xc0242e8c
	.word	0xe47420d8
	.word	0xc02aab26
thr2_MMU_ASI_PRIMARY_148:
	.word	0x87802080
	.word	0xeaf42108
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	DDEMAP_SCTX
	.word	0x1000000
	.word	0xbe15c000
	IDEMAP_RPAGE
	.word	0xfe4d226d
	.word	0xbe85e110
	.word	0xd4dfd000
	.word	0xfcdad160
	.word	0x1000000
	or	%g0, 0x4ad, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	TOGGLE_LSU_IM
	ACCESS_ITSB_PTR
thr2_MMU_ASI_BLK_P_149:
	.word	0x878020f0
	.word	0xc3baaf40
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_BLK_PL_150:
	.word	0x878020f8
	.word	0xe3bd2f80
	.word	0xf470a090
	.word	0xc02aa160
	.word	0xfe4c210b
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe85aa038
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00c_exit:
	EXIT_GOOD
Thr2_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10a DATA_VA=0x690028000000
attr_data {
	Name = .Thr2_User_Data_4v10a ,
	VA = 0x690028000000 ,/* 0x6900283fffc0 */
	RA = 0x03cf000000 ,
	PA = 0x2fcf000000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000690028000984 8000002fcf000043 */
	end_label   = Thr2_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10a_data_begin
Thr2_User_Data_4v10a_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00d TEXT_VA=0x690010c00000
attr_text {
	Name = .Thr2_User_Text_4v00d ,
	VA = 0x690010c00000 ,/* 0x690010ffffc0 */
	RA = 0x03c0800000 ,
	PA = 0x2fc0800000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000690010c00984 8000002fc0800483 */
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
	.word	0xc02dea4e
	nop
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	LOAD_IDATA_ACCESS
	nop
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x78, %i7
	READ_IDATA_ACCESS
	nop
	.word	0xfe5427f4
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	READ_IDATA_ACCESS
	.word	0xfc9c1d40
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x488, %i7
	READ_DDATA_ACCESS
	.word	0xf25c2068
	.word	0x1000000
	or	%g0, 0x451, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4fb, %i7
	LOAD_IDATA_ACCESS
	.word	0xd85c2070
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfc9c1c40
	nop
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x698, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
	.word	0xfcd91000
	DDEMAP_PCTX
	.word	0xfa5de148
	.word	0xbe852088
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe12c000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x01f, %i7
	LOAD_DDATA_IN
	.word	0xfcd91000
	DDEMAP_SCTX
	.word	0xfe45ec50
	.word	0xfc991c40
	.word	0x1000000
	or	%g0, 0x4e0, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL_PAGES
	.word	0xfe4aa51e
	.word	0x1000000
	or	%g0, 0x0b3, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02aa317
	.word	0x1000000
	or	%g0, 0x01e, %i7
	LOAD_DDATA_IN
	.word	0xf4742050
	.word	0xc032a530
thr2_MMU_ASI_BLK_P_151:
	.word	0x878020f0
	.word	0xe1bc2580
	TOGGLE_LSU_DM
	.word	0xfa742120
	.word	0xc022acbc
	.word	0xe872a0e0
	.word	0xc026e608
	.word	0xbe85e138
	.word	0xd4dfd000
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
	.word	0x1000000
	or	%g0, 0x10, %i7
	ITLB_TAG_READ
	.word	0xc02d2fe8
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa5de100
	.word	0xf2742068
	.word	0xc0342bba
	.word	0xc85aa038
	.word	0x1000000
	or	%g0, 0x2c8, %i7
	DTLB_TAG_READ
	.word	0xfe466140
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe866088
	.word	0xe8dfd000
	nop
	nop
	.word	0x1000000
	or	%g0, 0x2c0, %i7
	READ_DDATA_ACCESS
	.word	0xbe842158
	.word	0xd4dfd000
	.word	0xfcdc1000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xcc742018
	.word	0xc0752db0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00d_exit:
	EXIT_GOOD
Thr2_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10b DATA_VA=0x6800006e0000
attr_data {
	Name = .Thr2_User_Data_4v10b ,
	VA = 0x6800006e0000 ,/* 0x6800006effc0 */
	RA = 0x01f07a0000 ,
	PA = 0x01f07a0000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800006e0984 80000001f07a0041 */
	end_label   = Thr2_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10b_data_begin
Thr2_User_Data_4v10b_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00e TEXT_VA=0x67700013c000
attr_text {
	Name = .Thr2_User_Text_4v00e ,
	VA = 0x67700013c000 ,/* 0x67700013dfc0 */
	RA = 0x0340088000 ,
	PA = 0x0340088000 ,
	TTE_Context = 0x0984 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000067700013c984 8000000340088480 */
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
thr2_MMU_ASI_PRIMARY_152:
	.word	0x87802080
	.word	0xecf42028
	.word	0xd8592018
	.word	0xe872a038
	.word	0xc02c2be1
thr2_MMU_ASI_PRIMARY_153:
	.word	0x87802080
	.word	0xd2f420c8
	nop
	nop
	.word	0xda7120e8
	.word	0xc025ebdc
	IDEMAP_PCTX
	IDEMAP_ALL
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe52a584
thr2_MMU_ASI_PRIMARY_154:
	.word	0x87802080
	.word	0xe6f5e028
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x001, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x07e, %i7
	LOAD_IDATA_IN
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe85920e0
	.word	0xe272a018
	.word	0xc03765e8
	.word	0x1000000
	or	%g0, 0x04d, %i7
	LOAD_IDATA_IN
	ACCESS_DTSB_PTR
	DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf872a118
	.word	0xc0752400
	TOGGLE_LSU_IM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdc1000
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe13c000
	DDEMAP_RPAGE
	.word	0xbe85e038
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x536, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x00f, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL_RPAGES
	.word	0xde742090
	.word	0xc0292376
	.word	0xec712028
	.word	0xc02c2ee4
	.word	0xd45aa068
thr2_MMU_ASI_PRIMARY_155:
	.word	0x87802080
	.word	0xc6f2a090
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	.word	0x1000000
	or	%g0, 0x050, %i7
	LOAD_IDATA_IN
	.word	0xfcdd1000
	.word	0xfe54294c
	DDEMAP_ALL_PAGES
	.word	0xfcdc1000
	TOGGLE_LSU_DM
	TOGGLE_LSU_IM
	.word	0xbe82a110
	.word	0xe0dfd000
	.word	0xfe412b8c
	.word	0xfe4124a8
	.word	0x1000000
	or	%g0, 0x179, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd658a010
	.word	0xfcde5000
	.word	0xd65e6010
	.word	0x1000000
	or	%g0, 0x549, %i7
	LOAD_DDATA_ACCESS
	.word	0xe85aa068
	.word	0x1000000
	or	%g0, 0x68, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc6766050
	.word	0xc02426a0
	.word	0xbe82a120
	.word	0xe8dfd000
	DDEMAP_SCTX
thr2_MMU_ASI_PRIMARY_156:
	.word	0x87802080
	.word	0xe6f66028
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x056, %i7
	LOAD_DDATA_IN
	.word	0xfe45e548
	.word	0xbe842110
	.word	0xe8dfd000
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0266894
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00e_exit:
	EXIT_GOOD
Thr2_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10c DATA_VA=0x680000540000
attr_data {
	Name = .Thr2_User_Data_4v10c ,
	VA = 0x680000540000 ,/* 0x68000054ffc0 */
	RA = 0x01f0760000 ,
	PA = 0x01f0760000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000540984 80000001f0760041 */
	end_label   = Thr2_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10c_data_begin
Thr2_User_Data_4v10c_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10d DATA_VA=0x6770001ca000
attr_data {
	Name = .Thr2_User_Data_4v10d ,
	VA = 0x6770001ca000 ,/* 0x6770001cbfc0 */
	RA = 0x03400b2000 ,
	PA = 0x03400b2000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006770001ca984 80000003400b2040 */
	end_label   = Thr2_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10d_data_begin
Thr2_User_Data_4v10d_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10e DATA_VA=0x690007800000
attr_data {
	Name = .Thr2_User_Data_4v10e ,
	VA = 0x690007800000 ,/* 0x690007bfffc0 */
	RA = 0x03c0c00000 ,
	PA = 0x2fc0c00000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000690007800984 8000002fc0c00043 */
	end_label   = Thr2_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10e_data_begin
Thr2_User_Data_4v10e_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10f DATA_VA=0x67700010a000
attr_data {
	Name = .Thr2_User_Data_4v10f ,
	VA = 0x67700010a000 ,/* 0x67700010bfc0 */
	RA = 0x0340120000 ,
	PA = 0x0340120000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067700010a984 8000000340120040 */
	end_label   = Thr2_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10f_data_begin
Thr2_User_Data_4v10f_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v110 DATA_VA=0x6770000ae000
attr_data {
	Name = .Thr2_User_Data_4v110 ,
	VA = 0x6770000ae000 ,/* 0x6770000affc0 */
	RA = 0x0340134000 ,
	PA = 0x0340134000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006770000ae984 8000000340134040 */
	end_label   = Thr2_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v110_data_begin
Thr2_User_Data_4v110_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v111 DATA_VA=0x67700008a000
attr_data {
	Name = .Thr2_User_Data_4v111 ,
	VA = 0x67700008a000 ,/* 0x67700008bfc0 */
	RA = 0x03400ac000 ,
	PA = 0x03400ac000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067700008a984 80000003400ac040 */
	end_label   = Thr2_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v111_data_begin
Thr2_User_Data_4v111_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v112 DATA_VA=0x680000450000
attr_data {
	Name = .Thr2_User_Data_4v112 ,
	VA = 0x680000450000 ,/* 0x68000045ffc0 */
	RA = 0x01f08e0000 ,
	PA = 0x01f08e0000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000450984 80000001f08e0041 */
	end_label   = Thr2_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v112_data_begin
Thr2_User_Data_4v112_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v113 DATA_VA=0x6770001a4000
attr_data {
	Name = .Thr2_User_Data_4v113 ,
	VA = 0x6770001a4000 ,/* 0x6770001a5fc0 */
	RA = 0x0340186000 ,
	PA = 0x0340186000 ,
	TTE_Context = 0x0984 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006770001a4984 8000000340186040 */
	end_label   = Thr2_User_Data_4v113_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v113_data_begin
Thr2_User_Data_4v113_data_begin:
	.xword	0x680000d00000
	.xword	0x690025000000
	.xword	0x6770000da000
	.xword	0x6770001ea000
	.xword	0x680000020000
	.xword	0x677000154000
	.xword	0x680000cb0000
	.xword	0x690037000000
	.xword	0x680000590000
	.xword	0x690002400000
	.xword	0x6770000c0000
	.xword	0x677000146000
	.xword	0x690005000000
	.xword	0x680000380000
	.xword	0x677000170000
	.xword	0x69002d800000
	.xword	0x6a0d20000000
	.xword	0x6770001b0000
	.xword	0x6770000b0000
	.xword	0x6770000a4000
	.xword	0x6770001a2000
	.xword	0x67700015a000
	.xword	0x680000420000
	.xword	0x6770001b2000
	.xword	0x680000660000
	.xword	0x6800008f0000
	.xword	0x680000110000
	.xword	0x690032400000
	.xword	0x690010400000
	.xword	0x680000eb0000
	.xword	0x6800009f0000
	.xword	0x69003dc00000
	.xword	0x690028000000
	.xword	0x690010c00000
	.xword	0x6800006e0000
	.xword	0x67700013c000
	.xword	0x680000540000
	.xword	0x6770001ca000
	.xword	0x690007800000
	.xword	0x67700010a000
	.xword	0x6770000ae000
	.xword	0x67700008a000
	.xword	0x680000450000
	.xword	0x6770001a4000
Thr2_User_Data_4v113_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x6c0000100000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	VA = 0x6c0000100000 ,/* 0x6c000010ffc0 */
	RA = 0x0200a50000 ,
	PA = 0x3e00a50000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000100a0e 8000003e00a50481 */
	end_label   = Thr3_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr3_user_code_entry
Thr3_user_code_entry:
	setx	0x6b80000a0000, %g1, %g2
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
	ACCESS_DTSB_PTR
	.word	0xc026e3ec
thr3_MMU_ASI_PRIMARY_LITTLE_157:
	.word	0x87802088
	.word	0xeef6e018
	.word	0xfcd95060
	.word	0xc072ae60
	.word	0xfc995d60
	.word	0xf65da098
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5c2918
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xca742010
	.word	0xc025a1e8
	.word	0xf65aa098
	ACCESS_ITSB_PTR
	nop
	nop
	.word	0x1000000
	or	%g0, 0x577, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0xbe82a148
	.word	0xc4dfd000
	nop
	nop
	nop
	.word	0xbe85a118
	.word	0xe0dfd000
	ACCESS_DTSB_PTR
	.word	0xc072a728
	nop
	nop
	IDEMAP_PCTX
	.word	0xce76e0a8
	.word	0xc020a158
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc035a908
	.word	0x1000000
	or	%g0, 0x417, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe842098
	.word	0xc8dfd000
	nop
	nop
	.word	0xbe82a038
	.word	0xe0dfd000
	.word	0xfc995120
	.word	0x1000000
	or	%g0, 0x5d0, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL
	.word	0xe472a018
	.word	0xc035a1d0
	.word	0x1000000
	or	%g0, 0x530, %i7
	READ_IDATA_ACCESS
	.word	0xfe542bec
	.word	0xfc9d9c40
	.word	0xfe58acb8
	.word	0x1000000
	or	%g0, 0xb0, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xfe52a77a
	.word	0x1000000
	or	%g0, 0xa8, %i7
	DTLB_TAG_READ
	IDEMAP_NCTX
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
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfc9c1000
	DDEMAP_PCTX
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xfe5aa170
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v000_exit:
	EXIT_GOOD
Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v100 DATA_VA=0x6b80000a0000
attr_data {
	Name = .Thr3_User_Data_4v100 ,
	VA = 0x6b80000a0000 ,/* 0x6b80000a1fc0 */
	RA = 0x0350150000 ,
	PA = 0x0350150000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b80000a0a0e 8000000350150040 */
	end_label   = Thr3_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v100_data_begin
Thr3_User_Data_4v100_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v200 DATA_VA=0x6c0000db0000
attr_data {
	Name = .Thr3_User_Data_4v200 ,
	VA = 0x6c0000db0000 ,/* 0x6c0000dbffc0 */
	RA = 0x0200240000 ,
	PA = 0x3e00240000 ,
	TTE_Context = 0x0865 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006c0000db0865 8000003e00240041 */
	end_label   = Thr3_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v200_data_begin
Thr3_User_Data_4v200_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v300 DATA_VA=0x6b80001be000
attr_data {
	Name = .Thr3_User_Data_4v300 ,
	VA = 0x6b80001be000 ,/* 0x6b80001bffc0 */
	RA = 0x035018a000 ,
	PA = 0x035018a000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
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
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00006b80001be000 800000035018a440 */
	end_label   = Thr3_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v300_data_begin
Thr3_User_Data_4v300_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v001 TEXT_VA=0x6c0000260000
attr_text {
	Name = .Thr3_User_Text_4v001 ,
	VA = 0x6c0000260000 ,/* 0x6c000026ffc0 */
	RA = 0x02001d0000 ,
	PA = 0x3e001d0000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000260a0e 8000003e001d0481 */
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
	.word	0xec58a0d8
	.word	0x1000000
	or	%g0, 0x04c, %i7
	LOAD_IDATA_IN
	.word	0xfc9d9000
	.word	0xbe842038
	.word	0xe0dfd000
	.word	0xfe4ee3e5
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x01b, %i7
	LOAD_IDATA_IN
	IDEMAP_ALL
	.word	0xfe4da140
	DDEMAP_ALL_PAGES
	.word	0xc022ad5c
	.word	0xe05ee0c0
	.word	0xc022a278
	.word	0x1000000
	or	%g0, 0xb0, %i7
	ITLB_TAG_READ
	.word	0xc85aa068
	.word	0x1000000
	or	%g0, 0x210, %i7
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
	nop
	nop
	nop
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0212c54
	.word	0xd45ee108
	IDEMAP_ALL_RPAGES
	.word	0xbe86e0d8
	.word	0xecdfd000
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
	or	%g0, 0x150, %i7
	ITLB_TAG_READ
	nop
	nop
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0xbe82e010
	.word	0xc19fde20
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc035a950
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xda72a150
	.word	0xc076ee30
	nop
	nop
	nop
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xf65ee0c0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v001_exit:
	EXIT_GOOD
Thr3_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v400 TEXT_VA=0x6c0000a20000
attr_text {
	Name = .Thr3_User_Text_4v400 ,
	VA = 0x6c0000a20000 ,/* 0x6c0000a2ffc0 */
	RA = 0x0200e50000 ,
	PA = 0x3e00e50000 ,
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
	/* ITTE_TAG_DATA = 00006c0000a20000 8000003e00e50081 */
	end_label   = Thr3_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v400_text_begin
Thr3_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xea71a050
	.word	0xc034ac72
	.word	0xc029a158
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
	.word	0xbe118000
	P_DDEMAP_PAGE
	.word	0xfcd95120
	P_ACCESS_DTSB_PTR
	.word	0xbe86e098
	.word	0xd4dfd000
	P_DDEMAP_ALL_RPAGES
thr3_MMU_ASI_BLK_P_158:
	.word	0x878020f0
	.word	0xc3bee700
	.word	0x1000000
	or	%g0, 0x04e, %i7
	P_LOAD_IDATA_IN
	P_IDEMAP_ALL_RPAGES
thr3_MMU_ASI_PRIMARY_159:
	.word	0x87802080
	.word	0xf8f42020
	P_IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x21e, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe816010
	.word	0xe2dfd060
	.word	0xfcda8200
	P_DDEMAP_PCTX
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x68, %i7
	P_ITLB_TAG_READ
	P_IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x435, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x087, %i7
	P_LOAD_IDATA_IN
thr3_MMU_ASI_AS_IF_USER_PRIMARY_160:
	.word	0x87802010
	.word	0xccf420a0
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_161:
	.word	0x8780202a
	.word	0xc4bc2720
	.word	0xc021a4c8
	P_TOGGLE_LSU_IM
thr3_MMU_ASI_AS_IF_USER_PRIMARY_162:
	.word	0x87802010
	.word	0xdef5a0f0
	.word	0xbe82e010
	.word	0xe19fc2e0
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x65d, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xe271a010
	.word	0xc021aa3c
thr3_MMU_ASI_AS_IF_USER_PRIMARY_163:
	.word	0x87802010
	.word	0xf2f0a028
	P_ACCESS_ITSB_PTR
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v400_exit:
	EXIT_GOOD
Thr3_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v002 TEXT_VA=0x6c0000f30000
attr_text {
	Name = .Thr3_User_Text_4v002 ,
	VA = 0x6c0000f30000 ,/* 0x6c0000f3ffc0 */
	RA = 0x0200ee0000 ,
	PA = 0x3e00ee0000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000f30a0e 8000003e00ee0481 */
	end_label   = Thr3_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v002_text_begin
Thr3_User_Text_4v002_text_begin:
	wrpr	0, %gl
thr3_MMU_ASI_AS_IF_USER_PRIMARY_164:
	.word	0x87802010
	.word	0xe6f0a150
	.word	0xc876e068
	.word	0xc072ab60
	.word	0x1000000
	or	%g0, 0x6e, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfc9984e0
	.word	0x1000000
	.word	0xbe128000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xfc9905c0
	.word	0x1000000
	or	%g0, 0x47e, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe86e0e8
	.word	0xc8dfd000
	.word	0xe19d82c0
	.word	0xfc9d9c40
	.word	0xfc9d84c0
	P_IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x091, %i7
	P_LOAD_IDATA_IN
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v002_exit:
	EXIT_GOOD
Thr3_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v101 DATA_VA=0x6c0000e00000
attr_data {
	Name = .Thr3_User_Data_4v101 ,
	VA = 0x6c0000e00000 ,/* 0x6c0000e0ffc0 */
	RA = 0x0200a60000 ,
	PA = 0x3e00a60000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c0000e00a0e 8000003e00a60041 */
	end_label   = Thr3_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v101_data_begin
Thr3_User_Data_4v101_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v201 DATA_VA=0x6d003cc00000
attr_data {
	Name = .Thr3_User_Data_4v201 ,
	VA = 0x6d003cc00000 ,/* 0x6d003cffffc0 */
	RA = 0x03d9c00000 ,
	PA = 0x03d9c00000 ,
	TTE_Context = 0x0865 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006d003cc00865 80000003d9c00043 */
	end_label   = Thr3_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v201_data_begin
Thr3_User_Data_4v201_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v301 DATA_VA=0x6c0000870000
attr_data {
	Name = .Thr3_User_Data_4v301 ,
	VA = 0x6c0000870000 ,/* 0x6c000087ffc0 */
	RA = 0x0200980000 ,
	PA = 0x3e00980000 ,
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
	/* DTTE_TAG_DATA = 00006c0000870000 8000003e00980441 */
	end_label   = Thr3_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v301_data_begin
Thr3_User_Data_4v301_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v003 TEXT_VA=0x6d0021c00000
attr_text {
	Name = .Thr3_User_Text_4v003 ,
	VA = 0x6d0021c00000 ,/* 0x6d0021ffffc0 */
	RA = 0x03d1000000 ,
	PA = 0x03d1000000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d0021c00a0e 80000003d1000483 */
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
	.word	0xc032a690
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
	.word	0xc8dfd000
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x04e, %i7
	LOAD_DDATA_IN
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	.word	0xfe52ac0a
	.word	0x1000000
	or	%g0, 0x7c0, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xd870a018
	.word	0xc034277a
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v003_exit:
	EXIT_GOOD
Thr3_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v401 TEXT_VA=0x6b80000aa000
attr_text {
	Name = .Thr3_User_Text_4v401 ,
	VA = 0x6b80000aa000 ,/* 0x6b80000abfc0 */
	RA = 0x0350144000 ,
	PA = 0x0350144000 ,
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
	/* ITTE_TAG_DATA = 00006b80000aa000 8000000350144080 */
	end_label   = Thr3_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v401_text_begin
Thr3_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0xbe812068
	.word	0xc4dfc200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	P_ITLB_TAG_READ
	nop
	nop
	nop
	nop
	P_IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x08f, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	.word	0xfcdd9100
	nop
	.word	0xbe82e010
	.word	0xe2dfd060
	.word	0xc0732158
	P_IDEMAP_ALL_PAGES
	.word	0xf65ca008
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe100000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x050, %i7
	P_LOAD_DDATA_IN
	.word	0xfcda8200
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xfcda9000
	P_IDEMAP_ALL_RPAGES
	.word	0xd274a0f0
	.word	0xc02de219
thr3_MMU_ASI_PRIMARY_165:
	.word	0x87802080
	.word	0xf4f6e130
	P_ACCESS_ITSB_PTR
	P_ACCESS_ITSB_PTR
	.word	0xe05de038
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v401_exit:
	EXIT_GOOD
Thr3_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v004 TEXT_VA=0x6d0036000000
attr_text {
	Name = .Thr3_User_Text_4v004 ,
	VA = 0x6d0036000000 ,/* 0x6d00363fffc0 */
	RA = 0x03dd000000 ,
	PA = 0x03dd000000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 00006d0036000a0e 80000003dd000483 */
	end_label   = Thr3_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v004_text_begin
Thr3_User_Text_4v004_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0xd8, %i7
	P_ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x099, %i7
	P_LOAD_IDATA_IN
	.word	0xbe816010
	.word	0xe39fde20
	.word	0xbe85a008
	.word	0xd4dfd000
	P_DDEMAP_ALL
	.word	0xe19ac2e0
	.word	0xda742080
	.word	0xc020ab90
	.word	0xfe56e196
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xd9, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe816010
	.word	0xc39fc2e0
	.word	0xfe4c231a
	P_DDEMAP_SCTX
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v004_exit:
	EXIT_GOOD
Thr3_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v102 DATA_VA=0x6e01d0000000
attr_data {
	Name = .Thr3_User_Data_4v102 ,
	VA = 0x6e01d0000000 ,/* 0x6e01dfffffc0 */
	RA = 0x0060000000 ,
	PA = 0x0060000000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 00006e01d0000a0e 8000000060000045 */
	end_label   = Thr3_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v102_data_begin
Thr3_User_Data_4v102_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v202 DATA_VA=0x6b80001c2000
attr_data {
	Name = .Thr3_User_Data_4v202 ,
	VA = 0x6b80001c2000 ,/* 0x6b80001c3fc0 */
	RA = 0x03500ae000 ,
	PA = 0x03500ae000 ,
	TTE_Context = 0x0865 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006b80001c2865 80000003500ae040 */
	end_label   = Thr3_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v202_data_begin
Thr3_User_Data_4v202_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v302 DATA_VA=0x6b80001ac000
attr_data {
	Name = .Thr3_User_Data_4v302 ,
	VA = 0x6b80001ac000 ,/* 0x6b80001adfc0 */
	RA = 0x03500d2000 ,
	PA = 0x03500d2000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
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
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00006b80001ac000 80000003500d2440 */
	end_label   = Thr3_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v302_data_begin
Thr3_User_Data_4v302_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v005 TEXT_VA=0x6b8000188000
attr_text {
	Name = .Thr3_User_Text_4v005 ,
	VA = 0x6b8000188000 ,/* 0x6b8000189fc0 */
	RA = 0x0350028000 ,
	PA = 0x0350028000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b8000188a0e 8000000350028480 */
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
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	ITLB_TAG_READ
	.word	0xfe442780
thr3_MMU_ASI_PRIMARY_166:
	.word	0x87802080
	.word	0xf8f2a0a8
	.word	0x1000000
	or	%g0, 0x7f8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x258, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe140000
	IDEMAP_RPAGE
	DDEMAP_ALL_RPAGES
	.word	0xfcda9000
	.word	0xf875a100
	.word	0xc0742be8
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x5db, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe174000
	GOTO_SUPERVISOR0
	.word	0xd8712078
	.word	0xc022af5c
	.word	0xc02ee450
	.word	0x1000000
	or	%g0, 0x3be, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe42ab2c
thr3_MMU_ASI_BLK_P_167:
	.word	0x878020f0
	.word	0xc1bc2e00
	TOGGLE_LSU_DM
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x5e8, %i7
	READ_IDATA_ACCESS
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe592900
	.word	0xbe164000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v005_exit:
	EXIT_GOOD
Thr3_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v402 TEXT_VA=0x6d000bc00000
attr_text {
	Name = .Thr3_User_Text_4v402 ,
	VA = 0x6d000bc00000 ,/* 0x6d000bffffc0 */
	RA = 0x03da000000 ,
	PA = 0x03da000000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr3_z_ctx_tsb_0 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 00006d000bc00000 80000003da000083 */
	end_label   = Thr3_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v402_text_begin
Thr3_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x120, %i7
	P_ITLB_TAG_READ
thr3_MMU_ASI_AS_IF_USER_PRIMARY_168:
	.word	0x87802010
	.word	0xd0f2a028
	nop
	nop
	nop
	.word	0xfcdd9000
	.word	0xfcdec300
	.word	0xfc9b0580
	.word	0xf659a038
	P_DDEMAP_ALL_RPAGES
	P_TOGGLE_LSU_IM
thr3_MMU_ASI_PRIMARY_169:
	.word	0x87802080
	.word	0xd2f42050
	.word	0xbe836040
	.word	0xe4dfc2a0
	P_IDEMAP_NCTX
	.word	0xe674a150
	.word	0xc02ca50c
	.word	0x1000000
	.word	0xbe16c000
	P_DDEMAP_PAGE
	P_TOGGLE_LSU_DM
thr3_MMU_ASI_BLK_P_170:
	.word	0x878020f0
	.word	0xe1baa3c0
	.word	0xbe82a068
	.word	0xd4dfd000
	.word	0xc02ca2a4
	nop
	.word	0xca74a070
	.word	0xc024a5dc
	.word	0xbe82a038
	.word	0xf6dfd000
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v402_exit:
	EXIT_GOOD
Thr3_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v006 TEXT_VA=0x6b80000ea000
attr_text {
	Name = .Thr3_User_Text_4v006 ,
	VA = 0x6b80000ea000 ,/* 0x6b80000ebfc0 */
	RA = 0x03501f2000 ,
	PA = 0x03501f2000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b80000eaa0e 80000003501f2480 */
	end_label   = Thr3_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v006_text_begin
Thr3_User_Text_4v006_text_begin:
	wrpr	0, %gl
thr3_MMU_ASI_PRIMARY_171:
	.word	0x87802080
	.word	0xecf2a068
	.word	0xfe5429fa
	.word	0x1000000
	.word	0xbe128000
	P_DDEMAP_RPAGE
	P_TOGGLE_LSU_IM
	P_IDEMAP_ALL
	.word	0x1000000
	.word	0xbe134000
	P_DDEMAP_PAGE
	nop
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	P_LOAD_DDATA_ACCESS
	nop
	.word	0x1000000
	or	%g0, 0x7d3, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfe42a55c
	.word	0xcc712018
	.word	0xc072a618
	.word	0xc39942e0
	.word	0x1000000
	or	%g0, 0x009, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x71a, %i7
	P_LOAD_DDATA_ACCESS
thr3_MMU_ASI_BLK_SL_172:
	.word	0x878020f9
	.word	0xc1b96940
	P_ACCESS_DTSB_PTR
	.word	0xfc9c84e0
	.word	0xfcd89000
	.word	0xfcd88200
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x0a5, %i7
	P_LOAD_DDATA_IN
	P_TOGGLE_LSU_DM
	P_DDEMAP_ALL_PAGES
	.word	0xfe5da898
	P_DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe150000
	P_IDEMAP_RPAGE
	.word	0xf65aa108
	P_TOGGLE_LSU_DM
	.word	0xbe80a108
	.word	0xecdfc200
	nop
	nop
	nop
	P_IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x340, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe13c000
	P_DDEMAP_RPAGE
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v006_exit:
	EXIT_GOOD
Thr3_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v103 DATA_VA=0x6c0000f40000
attr_data {
	Name = .Thr3_User_Data_4v103 ,
	VA = 0x6c0000f40000 ,/* 0x6c0000f4ffc0 */
	RA = 0x0200cf0000 ,
	PA = 0x3e00cf0000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c0000f40a0e 8000003e00cf0041 */
	end_label   = Thr3_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v103_data_begin
Thr3_User_Data_4v103_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v303 DATA_VA=0x6b8000078000
attr_data {
	Name = .Thr3_User_Data_4v303 ,
	VA = 0x6b8000078000 ,/* 0x6b8000079fc0 */
	RA = 0x0350158000 ,
	PA = 0x0350158000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
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
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00006b8000078000 8000000350158440 */
	end_label   = Thr3_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v303_data_begin
Thr3_User_Data_4v303_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v007 TEXT_VA=0x6c00000b0000
attr_text {
	Name = .Thr3_User_Text_4v007 ,
	VA = 0x6c00000b0000 ,/* 0x6c00000bffc0 */
	RA = 0x0200890000 ,
	PA = 0x3e00890000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c00000b0a0e 8000003e00890481 */
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
	DDEMAP_SCTX
	.word	0x1000000
	.word	0xbe168000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x01d, %i7
	LOAD_IDATA_IN
	.word	0xe458a048
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x5b1, %i7
	LOAD_IDATA_ACCESS
	nop
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xec5aa038
thr3_MMU_ASI_BLK_P_173:
	.word	0x878020f0
	.word	0xc1baa540
	.word	0xfcda9000
	.word	0xfe45a41c
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfcded000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	DDEMAP_PCTX
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x02d, %i7
	LOAD_DDATA_IN
	IDEMAP_NCTX
	.word	0xfe45a0fc
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9ad020
	.word	0xea742050
	.word	0xc075acd8
	.word	0xee5c2018
	.word	0xfc9c1100
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x510, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfcdc1000
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc026e954
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v007_exit:
	EXIT_GOOD
Thr3_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v403 TEXT_VA=0x6c00007d0000
attr_text {
	Name = .Thr3_User_Text_4v403 ,
	VA = 0x6c00007d0000 ,/* 0x6c00007dffc0 */
	RA = 0x02003a0000 ,
	PA = 0x3e003a0000 ,
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
	/* ITTE_TAG_DATA = 00006c00007d0000 8000003e003a0081 */
	end_label   = Thr3_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v403_text_begin
Thr3_User_Text_4v403_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x508, %i7
	P_ITLB_TAG_READ
	.word	0xfc9c5120
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x448, %i7
	P_ITLB_TAG_READ
	.word	0xcc71a078
	.word	0xc074a730
	.word	0xbe80e0d8
	.word	0xe0dfc280
	.word	0xbe842128
	.word	0xd4dfd000
	P_IDEMAP_ALL_RPAGES
thr3_MMU_ASI_AS_IF_USER_PRIMARY_174:
	.word	0x87802010
	.word	0xcef2a0a8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_PAGES
	.word	0xbe8420e8
	.word	0xecdfd000
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_175:
	.word	0x8780202a
	.word	0xe4bda250
	P_ACCESS_DTSB_PTR
	.word	0xfcdad160
	.word	0x1000000
	or	%g0, 0x06d, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_176:
	.word	0x87802080
	.word	0xecf2a008
	.word	0x1000000
	.word	0xbe170000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x083, %i7
	P_LOAD_DDATA_IN
	.word	0xfe49a2cc
	P_DDEMAP_PCTX
	nop
	nop
	nop
	nop
	.word	0xfcd90200
	.word	0xbe86e038
	.word	0xd4dfd000
thr3_MMU_ASI_PRIMARY_177:
	.word	0x87802080
	.word	0xe0bda9d0
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_178:
	.word	0x8780202a
	.word	0xc0beed50
	.word	0xc87320c0
	.word	0xc024a27c
	nop
	.word	0xbe842118
	.word	0xecdfd000
	.word	0xec71a068
	.word	0xc029a4f3
	P_IDEMAP_ALL
	.word	0xfcd90200
thr3_MMU_ASI_AS_IF_USER_PRIMARY_179:
	.word	0x87802010
	.word	0xc8f420d8
	.word	0xbe842008
	.word	0xc8dfc200
	.word	0xfc998480
thr3_MMU_ASI_AS_IF_USER_PRIMARY_180:
	.word	0x87802010
	.word	0xd0f5a058
	.word	0xfcd95160
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v403_exit:
	EXIT_GOOD
Thr3_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v008 TEXT_VA=0x6c0000b00000
attr_text {
	Name = .Thr3_User_Text_4v008 ,
	VA = 0x6c0000b00000 ,/* 0x6c0000b0ffc0 */
	RA = 0x0200510000 ,
	PA = 0x3e00510000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000b00a0e 8000003e00510481 */
	end_label   = Thr3_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v008_text_begin
Thr3_User_Text_4v008_text_begin:
	wrpr	0, %gl
	P_DDEMAP_SCTX
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x41, %i7
	P_LOAD_IDATA_ACCESS
	P_TOGGLE_LSU_DM
	.word	0xbe85a0c0
	.word	0xecdfc200
	P_DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x047, %i7
	P_LOAD_IDATA_IN
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0x458, %i7
	P_DTLB_TAG_READ
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v008_exit:
	EXIT_GOOD
Thr3_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v104 DATA_VA=0x6c00006d0000
attr_data {
	Name = .Thr3_User_Data_4v104 ,
	VA = 0x6c00006d0000 ,/* 0x6c00006dffc0 */
	RA = 0x0200ba0000 ,
	PA = 0x3e00ba0000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c00006d0a0e 8000003e00ba0041 */
	end_label   = Thr3_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v104_data_begin
Thr3_User_Data_4v104_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v009 TEXT_VA=0x6c0000500000
attr_text {
	Name = .Thr3_User_Text_4v009 ,
	VA = 0x6c0000500000 ,/* 0x6c000050ffc0 */
	RA = 0x0200eb0000 ,
	PA = 0x3e00eb0000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000500a0e 8000003e00eb0481 */
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
thr3_MMU_ASI_BLK_COMMIT_P_181:
	.word	0x878020e0
	.word	0xc1bc2a00
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x081, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
thr3_MMU_ASI_BLK_COMMIT_P_182:
	.word	0x878020e0
	.word	0xe1bdad80
	TOGGLE_LSU_IM
	.word	0xd45920c0
	.word	0x1000000
	or	%g0, 0x198, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL_PAGES
	.word	0xc02ee729
	.word	0xbe86e0e8
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	ACCESS_ITSB_PTR
thr3_MMU_ASI_SECONDARY_183:
	.word	0x87802081
	.word	0xeef46018
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x90, %i7
	ITLB_TAG_READ
	.word	0xe270a010
	.word	0xc075a7b8
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe168000
	GOTO_SUPERVISOR0
thr3_MMU_ASI_PRIMARY_184:
	.word	0x87802080
	.word	0xf6f0a108
	.word	0x1000000
	or	%g0, 0x628, %i7
	DTLB_TAG_READ
	.word	0xfcdad120
	.word	0xe058a098
thr3_MMU_ASI_BLK_PL_185:
	.word	0x878020f8
	.word	0xc3bc2380
	.word	0x1000000
	or	%g0, 0x09d, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	.word	0xfe4da231
	.word	0xbe86e008
	.word	0xe0dfd040
	.word	0xf65aa128
	.word	0xbe80a038
	.word	0xe0dfd000
	.word	0xfcded000
	.word	0xfe5c2168
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x288, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	.word	0xd65da010
	.word	0x1000000
	.word	0xbe144000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xe0712098
	.word	0xc025a3b0
	.word	0xec5c2118
	.word	0xfe46e6a0
	.word	0x1000000
	or	%g0, 0x58, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0xfe58a420
	.word	0xd85aa018
	DDEMAP_ALL
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x5f8, %i7
	READ_DDATA_ACCESS
	.word	0xf275a028
	.word	0xc02ee3b3
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x124, %i7
	LOAD_IDATA_ACCESS
	.word	0xc036e158
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe174000
	GOTO_SUPERVISOR0
	.word	0xfe46edec
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v009_exit:
	EXIT_GOOD
Thr3_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00a TEXT_VA=0x6b80001ba000
attr_text {
	Name = .Thr3_User_Text_4v00a ,
	VA = 0x6b80001ba000 ,/* 0x6b80001bbfc0 */
	RA = 0x03501a8000 ,
	PA = 0x03501a8000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b80001baa0e 80000003501a8480 */
	end_label   = Thr3_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00a_text_begin
Thr3_User_Text_4v00a_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	.word	0xfcdd9000
	nop
	nop
	nop
	.word	0xfc9c5020
	.word	0xfe46e390
	.word	0xfcda8200
	.word	0xbe85a148
	.word	0xd4dfc200
	.word	0x1000000
	.word	0xbe170000
	P_IDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe130000
	P_IDEMAP_RPAGE
	.word	0xc032aeee
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x68, %i7
	P_ITLB_TAG_READ
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
	.word	0xf475a050
	.word	0xc02aa363
	.word	0xc0292163
	.word	0xf65da068
	.word	0xfcdec200
	P_IDEMAP_NCTX
	.word	0xbe812068
	.word	0xd4dfc200
	.word	0xbe82a038
	.word	0xecdfd000
thr3_MMU_ASI_AS_IF_USER_PRIMARY_186:
	.word	0x87802010
	.word	0xccf420a0
thr3_MMU_ASI_PRIMARY_187:
	.word	0x87802080
	.word	0xe4f2a0a0
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x423, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr3_MMU_ASI_SECONDARY_188:
	.word	0x87802081
	.word	0xd8bc68e0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_189:
	.word	0x87802080
	.word	0xd4f42098
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x216, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcd88200
thr3_MMU_ASI_AS_IF_USER_PRIMARY_190:
	.word	0x87802010
	.word	0xdef120b8
	.word	0xfe542516
	.word	0xfe5ee708
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	P_DTLB_TAG_READ
	.word	0xfcd95060
	P_TOGGLE_LSU_IM
thr3_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_191:
	.word	0x87802018
	.word	0xe6f6e020
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_BLK_P_192:
	.word	0x878020f0
	.word	0xe1bdaac0
	.word	0xbe86e098
	.word	0xf6dfd000
	.word	0xfc995d60
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_193:
	.word	0x8780202a
	.word	0xe0bc2880
	.word	0xe05aa098
	.word	0x1000000
	or	%g0, 0x7c0, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v00a_exit:
	EXIT_GOOD
Thr3_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v105 DATA_VA=0x6c0000970000
attr_data {
	Name = .Thr3_User_Data_4v105 ,
	VA = 0x6c0000970000 ,/* 0x6c000097ffc0 */
	RA = 0x0200640000 ,
	PA = 0x3e00640000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c0000970a0e 8000003e00640041 */
	end_label   = Thr3_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v105_data_begin
Thr3_User_Data_4v105_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00b TEXT_VA=0x6d0006000000
attr_text {
	Name = .Thr3_User_Text_4v00b ,
	VA = 0x6d0006000000 ,/* 0x6d00063fffc0 */
	RA = 0x03dec00000 ,
	PA = 0x03dec00000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d0006000a0e 80000003dec00483 */
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
	.word	0xc028a723
	.word	0x1000000
	or	%g0, 0x78, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe82a068
	.word	0xd4dfd000
	.word	0xc022aa0c
	.word	0xbe154000
	GOTO_SUPERVISOR0
thr3_MMU_ASI_BLK_P_194:
	.word	0x878020f0
	.word	0xe1baa340
	.word	0xec5c2118
	nop
	nop
	nop
	nop
	.word	0xea742080
	.word	0xc02429f8
	.word	0xbe85a068
	.word	0xe0dfd000
	.word	0xbe86e098
	.word	0xf6dfd000
	.word	0x1000000
	.word	0xbe100000
	IDEMAP_PAGE
	IDEMAP_NCTX
	.word	0xc020aa94
	.word	0xfe5c2290
	.word	0xfcda9000
thr3_MMU_ASI_PRIMARY_195:
	.word	0x87802080
	.word	0xe2f2a040
	.word	0x1000000
	or	%g0, 0x540, %i7
	DTLB_TAG_READ
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe158000
	IDEMAP_PAGE
	.word	0xfa72a0c8
	.word	0xc0212c3c
	.word	0xbe80a098
	.word	0xecdfd000
	.word	0xfcded140
	.word	0xbe154000
	GOTO_SUPERVISOR0
thr3_MMU_ASI_PRIMARY_LITTLE_196:
	.word	0x87802088
	.word	0xd4baa300
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_197:
	.word	0x87802080
	.word	0xdcf5a028
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
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0xfe55a4e6
	.word	0xc030a776
	.word	0x1000000
	or	%g0, 0x490, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45aa098
	.word	0x1000000
	or	%g0, 0x268, %i7
	DTLB_TAG_READ
	.word	0xfcdc1000
	.word	0xc072ae58
	.word	0x1000000
	or	%g0, 0x2a, %i7
	LOAD_DDATA_ACCESS
	.word	0xd45aa008
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe05aa108
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v00b_exit:
	EXIT_GOOD
Thr3_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v106 DATA_VA=0x6b80001c6000
attr_data {
	Name = .Thr3_User_Data_4v106 ,
	VA = 0x6b80001c6000 ,/* 0x6b80001c7fc0 */
	RA = 0x0350148000 ,
	PA = 0x0350148000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b80001c6a0e 8000000350148040 */
	end_label   = Thr3_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v106_data_begin
Thr3_User_Data_4v106_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00c TEXT_VA=0x6b8000012000
attr_text {
	Name = .Thr3_User_Text_4v00c ,
	VA = 0x6b8000012000 ,/* 0x6b8000013fc0 */
	RA = 0x03500d6000 ,
	PA = 0x03500d6000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b8000012a0e 80000003500d6480 */
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
	.word	0xca5ee010
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe17c000
	DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc075ac10
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe12c000
	DDEMAP_RPAGE
	TOGGLE_LSU_DM
	IDEMAP_NCTX
	.word	0x1000000
	.word	0xbe144000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x545, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcda9040
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x552, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x2f9, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe85a098
	.word	0xc8dfd000
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe108000
	DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xc85ee0c0
	.word	0x81c76000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00c_exit:
	EXIT_GOOD
Thr3_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v107 DATA_VA=0x6b80001c0000
attr_data {
	Name = .Thr3_User_Data_4v107 ,
	VA = 0x6b80001c0000 ,/* 0x6b80001c1fc0 */
	RA = 0x03501dc000 ,
	PA = 0x03501dc000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b80001c0a0e 80000003501dc040 */
	end_label   = Thr3_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v107_data_begin
Thr3_User_Data_4v107_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00d TEXT_VA=0x6c0000b40000
attr_text {
	Name = .Thr3_User_Text_4v00d ,
	VA = 0x6c0000b40000 ,/* 0x6c0000b4ffc0 */
	RA = 0x0200de0000 ,
	PA = 0x3e00de0000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000b40a0e 8000003e00de0481 */
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
	IDEMAP_NCTX
	.word	0xbe8420e8
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x638, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe108000
	DDEMAP_RPAGE
	.word	0xdc72a028
	.word	0xc02da72b
	DDEMAP_SCTX
	.word	0xbe80a0c0
	.word	0xe0dfd000
	DDEMAP_ALL
	.word	0xf2742088
	.word	0xc07422b0
	.word	0xc45aa0d8
	.word	0xf65aa038
	.word	0xfcd89000
	ACCESS_ITSB_PTR
	IDEMAP_NCTX
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe542a8e
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0xc2, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x535, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe5c20d8
	.word	0x1000000
	or	%g0, 0x180, %i7
	LOAD_IDATA_ACCESS
thr3_MMU_ASI_PRIMARY_198:
	.word	0x87802080
	.word	0xdcf2a088
	.word	0x1000000
	or	%g0, 0xd0, %i7
	DTLB_TAG_READ
thr3_MMU_ASI_PRIMARY_199:
	.word	0x87802080
	.word	0xe6f12020
thr3_MMU_ASI_PRIMARY_200:
	.word	0x87802080
	.word	0xd8f2a078
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0xa8, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xc030aab8
	.word	0xfe412f84
	.word	0xfe42acc4
	.word	0xce75a050
	.word	0xc0342ce2
thr3_MMU_ASI_PRIMARY_201:
	.word	0x87802080
	.word	0xc8f420f8
	.word	0xf076e050
	.word	0xc035af64
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x4b3, %i7
	LOAD_DDATA_ACCESS
	.word	0xcc5aa018
	.word	0x1000000
	or	%g0, 0x037, %i7
	LOAD_IDATA_IN
	.word	0xc022ac9c
	.word	0x1000000
	or	%g0, 0xc, %i7
	LOAD_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xde75a120
	.word	0xc022a4cc
	.word	0x1000000
	or	%g0, 0x063, %i7
	LOAD_DDATA_IN
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc075a158
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v00d_exit:
	EXIT_GOOD
Thr3_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v108 DATA_VA=0x6b80000f4000
attr_data {
	Name = .Thr3_User_Data_4v108 ,
	VA = 0x6b80000f4000 ,/* 0x6b80000f5fc0 */
	RA = 0x0350184000 ,
	PA = 0x0350184000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b80000f4a0e 8000000350184040 */
	end_label   = Thr3_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v108_data_begin
Thr3_User_Data_4v108_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00e TEXT_VA=0x6d0033800000
attr_text {
	Name = .Thr3_User_Text_4v00e ,
	VA = 0x6d0033800000 ,/* 0x6d0033bfffc0 */
	RA = 0x03d6400000 ,
	PA = 0x03d6400000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d0033800a0e 80000003d6400483 */
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
	.word	0xfe4928f4
	.word	0x1000000
	or	%g0, 0x260, %i7
	DTLB_TAG_READ
	ACCESS_DTSB_PTR
	.word	0xe275a010
	.word	0xc072aec8
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
	.word	0x81c6a000
	.word	0xbe168000
	GOTO_SUPERVISOR0
thr3_MMU_ASI_PRIMARY_202:
	.word	0x87802080
	.word	0xf4f2a0f0
	.word	0xc02da709
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc85ee008
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00e_exit:
	EXIT_GOOD
Thr3_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v109 DATA_VA=0x6e0ca0000000
attr_data {
	Name = .Thr3_User_Data_4v109 ,
	VA = 0x6e0ca0000000 ,/* 0x6e0cafffffc0 */
	RA = 0x0300000000 ,
	PA = 0x0300000000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 00006e0ca0000a0e 8000000300000045 */
	end_label   = Thr3_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v109_data_begin
Thr3_User_Data_4v109_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00f TEXT_VA=0x6b80000b8000
attr_text {
	Name = .Thr3_User_Text_4v00f ,
	VA = 0x6b80000b8000 ,/* 0x6b80000b9fc0 */
	RA = 0x035014a000 ,
	PA = 0x035014a000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b80000b8a0e 800000035014a480 */
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
thr3_MMU_ASI_PRIMARY_203:
	.word	0x87802080
	.word	0xfaf5a080
	.word	0x1000000
	or	%g0, 0x0, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xe675a050
	.word	0xc076e7a0
	.word	0xbe8420d8
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd45aa0c0
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00f_exit:
	EXIT_GOOD
Thr3_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10a DATA_VA=0x6b80000c2000
attr_data {
	Name = .Thr3_User_Data_4v10a ,
	VA = 0x6b80000c2000 ,/* 0x6b80000c3fc0 */
	RA = 0x0350154000 ,
	PA = 0x0350154000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b80000c2a0e 8000000350154040 */
	end_label   = Thr3_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10a_data_begin
Thr3_User_Data_4v10a_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v010 TEXT_VA=0x6e0ad0000000
attr_text {
	Name = .Thr3_User_Text_4v010 ,
	VA = 0x6e0ad0000000 ,/* 0x6e0adfffffc0 */
	RA = 0x00e0000000 ,
	PA = 0x00e0000000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006e0ad0000a0e 80000000e0000485 */
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
	.word	0xd8742048
	.word	0xc0292158
	DDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe168000
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
	.word	0x1000000
	or	%g0, 0x510, %i7
	LOAD_DDATA_ACCESS
	.word	0xfa76e150
	.word	0xc03424a4
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x28, %i7
	DTLB_TAG_READ
	.word	0xf658a138
	nop
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	DTLB_TAG_READ
	.word	0xbe164000
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
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	READ_IDATA_ACCESS
	nop
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x005, %i7
	LOAD_IDATA_IN
	IDEMAP_PCTX
	DDEMAP_ALL_RPAGES
	IDEMAP_ALL_PAGES
	TOGGLE_LSU_IM
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
	.word	0xc026e18c
thr3_MMU_ASI_PRIMARY_204:
	.word	0x87802080
	.word	0xd6f42010
	.word	0xfe5c2d50
	.word	0x1000000
	or	%g0, 0x61a, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xd47420e8
	.word	0xc075ac00
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v010_exit:
	EXIT_GOOD
Thr3_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10b DATA_VA=0x6b8000068000
attr_data {
	Name = .Thr3_User_Data_4v10b ,
	VA = 0x6b8000068000 ,/* 0x6b8000069fc0 */
	RA = 0x03500c0000 ,
	PA = 0x03500c0000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b8000068a0e 80000003500c0040 */
	end_label   = Thr3_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10b_data_begin
Thr3_User_Data_4v10b_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v011 TEXT_VA=0x6d0027400000
attr_text {
	Name = .Thr3_User_Text_4v011 ,
	VA = 0x6d0027400000 ,/* 0x6d00277fffc0 */
	RA = 0x03d4000000 ,
	PA = 0x03d4000000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d0027400a0e 80000003d4000483 */
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
	.word	0xc02aa56d
	.word	0xfc9c5d60
	.word	0x1000000
	.word	0xbe100000
	IDEMAP_RPAGE
	.word	0xfc9c5020
	.word	0xc45ee138
	nop
	nop
	nop
	nop
	nop
	.word	0xfe42a6c8
	.word	0xf470a110
	.word	0xc022af0c
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x017, %i7
	LOAD_DDATA_IN
	.word	0xc035a158
	ACCESS_ITSB_PTR
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
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xfcda9000
	.word	0xfe42a1a4
	.word	0xc0742870
	.word	0xfcd89000
	.word	0x1000000
	or	%g0, 0x518, %i7
	READ_DDATA_ACCESS
	.word	0xfe4eea46
	.word	0xbe85a068
	.word	0xd4dfd000
	IDEMAP_ALL_PAGES
	ACCESS_ITSB_PTR
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe4ee79b
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v011_exit:
	EXIT_GOOD
Thr3_User_Text_4v011_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10c DATA_VA=0x6d0037400000
attr_data {
	Name = .Thr3_User_Data_4v10c ,
	VA = 0x6d0037400000 ,/* 0x6d00377fffc0 */
	RA = 0x03d1400000 ,
	PA = 0x03d1400000 ,
	TTE_Context = 0x0a0e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006d0037400a0e 80000003d1400043 */
	end_label   = Thr3_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10c_data_begin
Thr3_User_Data_4v10c_data_begin:
	.xword	0x6c0000100000
	.xword	0x6b80000a0000
	.xword	0x6c0000db0000
	.xword	0x6b80001be000
	.xword	0x6c0000260000
	.xword	0x6c0000a20000
	.xword	0x6c0000f30000
	.xword	0x6c0000e00000
	.xword	0x6d003cc00000
	.xword	0x6c0000870000
	.xword	0x6d0021c00000
	.xword	0x6b80000aa000
	.xword	0x6d0036000000
	.xword	0x6e01d0000000
	.xword	0x6b80001c2000
	.xword	0x6b80001ac000
	.xword	0x6b8000188000
	.xword	0x6d000bc00000
	.xword	0x6b80000ea000
	.xword	0x6c0000f40000
	.xword	0x6b8000078000
	.xword	0x6c00000b0000
	.xword	0x6c00007d0000
	.xword	0x6c0000b00000
	.xword	0x6c00006d0000
	.xword	0x6c0000500000
	.xword	0x6b80001ba000
	.xword	0x6c0000970000
	.xword	0x6d0006000000
	.xword	0x6b80001c6000
	.xword	0x6b8000012000
	.xword	0x6b80001c0000
	.xword	0x6c0000b40000
	.xword	0x6b80000f4000
	.xword	0x6d0033800000
	.xword	0x6e0ca0000000
	.xword	0x6b80000b8000
	.xword	0x6b80000c2000
	.xword	0x6e0ad0000000
	.xword	0x6b8000068000
	.xword	0x6d0027400000
	.xword	0x6d0037400000
	.xword	0x6d000a800000
Thr3_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v012 TEXT_VA=0x6d000a800000
attr_text {
	Name = .Thr3_User_Text_4v012 ,
	VA = 0x6d000a800000 ,/* 0x6d000abfffc0 */
	RA = 0x03d7400000 ,
	PA = 0x03d7400000 ,
	TTE_Context = 0x0a0e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d000a800a0e 80000003d7400483 */
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
	DDEMAP_PCTX
	.word	0xc45ee038
	.word	0xe058a0c0
	.word	0x1000000
	.word	0xbe13c000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe174000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x067, %i7
	LOAD_IDATA_IN
	.word	0xda742080
	.word	0xc02dabf9
	IDEMAP_PCTX
	.word	0x1000000
	.word	0xbe14c000
	IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	DDEMAP_PCTX
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x120, %i7
	ITLB_TAG_READ
	.word	0xe39a9f00
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0312e94
thr3_MMU_ASI_PRIMARY_205:
	.word	0x87802080
	.word	0xf6f42098
	TOGGLE_LSU_DM
	TOGGLE_LSU_IM
	.word	0xc032ac44
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0xd0, %i7
	READ_IDATA_ACCESS
	.word	0xc072ab30
	DDEMAP_NCTX
	.word	0xc85ee098
	DDEMAP_ALL_PAGES
	TOGGLE_LSU_DM
thr3_MMU_ASI_PRIMARY_206:
	.word	0x87802080
	.word	0xf6f420d8
	DDEMAP_SCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe58aff0
	.word	0x81c26000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v012_exit:
	EXIT_GOOD
Thr3_User_Text_4v012_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x71001c000000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	VA = 0x71001c000000 ,/* 0x71001c3fffc0 */
	RA = 0x03e8c00000 ,
	PA = 0x4fe8c00000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000071001c0004d1 8000004fe8c00083 */
	end_label   = Thr4_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr4_user_code_entry
Thr4_user_code_entry:
	setx	0x6f9000056000, %g1, %g2
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
	.word	0xc026e364
	.word	0xfcdc1140
thr4_MMU_ASI_SECONDARY_LITTLE_207:
	.word	0x87802089
	.word	0xc8b96ba0
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0xfe42a7d8
	.word	0xc032a130
	.word	0x1000000
	or	%g0, 0x093, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd9000
	.word	0xbe842120
	.word	0xecdfd000
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x638, %i7
	DTLB_TAG_READ
thr4_MMU_ASI_PRIMARY_208:
	.word	0x87802080
	.word	0xcaf0a010
	ACCESS_ITSB_PTR
	.word	0xbe85a110
	.word	0xe0dfd000
	IDEMAP_ALL_RPAGES
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe164000
	IDEMAP_PAGE
	.word	0xfe5c2d38
	.word	0xfe4c2ffe
	.word	0xfe45a548
	.word	0x1000000
	or	%g0, 0x5ae, %i7
	LOAD_DDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xda742118
	.word	0xc035ac36
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
thr4_MMU_ASI_PRIMARY_209:
	.word	0x87802080
	.word	0xf2f5a0e8
	.word	0xec76e068
	.word	0xc03124e8
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xc02423c0
	nop
	nop
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_RPAGE
	.word	0xc45ee068
	.word	0x1000000
	or	%g0, 0x18, %i7
	DTLB_TAG_READ
	.word	0xc076ed10
	.word	0xbe86e068
	.word	0xe0dfd000
	.word	0xfe512d36
	.word	0x1000000
	.word	0xbe12c000
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
	.word	0xfe45acb0
	.word	0xc6742118
	.word	0xc075a630
	.word	0xfe5eead0
	.word	0xc0742ed8
	.word	0xfe49203e
	.word	0xfe5daea8
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc072a810
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v000_exit:
	EXIT_GOOD
Thr4_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v100 DATA_VA=0x6f9000056000
attr_data {
	Name = .Thr4_User_Data_4v100 ,
	VA = 0x6f9000056000 ,/* 0x6f9000057fc0 */
	RA = 0x036013c000 ,
	PA = 0x036013c000 ,
	TTE_Context = 0x04d1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006f900005713f 800000036013c040 */
	end_label   = Thr4_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v100_data_begin
Thr4_User_Data_4v100_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v200 DATA_VA=0x6f900009c000
attr_data {
	Name = .Thr4_User_Data_4v200 ,
	VA = 0x6f900009c000 ,/* 0x6f900009dfc0 */
	RA = 0x0360124000 ,
	PA = 0x0360124000 ,
	TTE_Context = 0x18ea ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006f900009dd83 8000000360124440 */
	end_label   = Thr4_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v200_data_begin
Thr4_User_Data_4v200_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v300 DATA_VA=0x71000b400000
attr_data {
	Name = .Thr4_User_Data_4v300 ,
	VA = 0x71000b400000 ,/* 0x71000b7fffc0 */
	RA = 0x03eb400000 ,
	PA = 0x4feb400000 ,
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
	/* DTTE_TAG_DATA = 000071000b400000 8000004feb400443 */
	end_label   = Thr4_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v300_data_begin
Thr4_User_Data_4v300_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v001 TEXT_VA=0x710004400000
attr_text {
	Name = .Thr4_User_Text_4v001 ,
	VA = 0x710004400000 ,/* 0x7100047fffc0 */
	RA = 0x03ef400000 ,
	PA = 0x4fef400000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007100044004d1 8000004fef400083 */
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0xec5ee0e0
	.word	0x1000000
	or	%g0, 0x03d, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x518, %i7
	READ_IDATA_ACCESS
	.word	0xfe5128f4
	.word	0x1000000
	or	%g0, 0x08e, %i7
	LOAD_IDATA_IN
	.word	0xf65ee098
	.word	0xfe46eba0
	nop
	nop
	nop
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x598, %i7
	DTLB_TAG_READ
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcdd9000
	ACCESS_DTSB_PTR
	.word	0xbe85a098
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x70, %i7
	READ_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xec592068
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v001_exit:
	EXIT_GOOD
Thr4_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v400 TEXT_VA=0x6f900010c000
attr_text {
	Name = .Thr4_User_Text_4v400 ,
	VA = 0x6f900010c000 ,/* 0x6f900010dfc0 */
	RA = 0x0360014000 ,
	PA = 0x0360014000 ,
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
	/* ITTE_TAG_DATA = 00006f900010c000 8000000360014080 */
	end_label   = Thr4_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v400_text_begin
Thr4_User_Text_4v400_text_begin:
	wrpr	0, %gl
thr4_MMU_ASI_PRIMARY_210:
	.word	0x87802080
	.word	0xf2f5a080
	P_TOGGLE_LSU_DM
	.word	0xf65e2100
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_AS_IF_USER_PRIMARY_211:
	.word	0x87802010
	.word	0xc6f2a0b0
	.word	0xfcd94320
thr4_MMU_ASI_PRIMARY_212:
	.word	0x87802080
	.word	0xc6f12020
thr4_MMU_ASI_PRIMARY_213:
	.word	0x87802080
	.word	0xe2f6e0a0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x6b0, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xb8, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe124000
	P_IDEMAP_RPAGE
	.word	0xfcdd8200
	nop
	nop
	.word	0xf65b2098
	.word	0xfc9f05e0
	P_IDEMAP_ALL
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	P_ACCESS_DTSB_PTR
	.word	0xbe85a0c0
	.word	0xc4dfd000
	.word	0x1000000
	or	%g0, 0x06b, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x3ed, %i7
	P_LOAD_DDATA_ACCESS
	P_TOGGLE_LSU_IM
	.word	0xfc9edc40
	.word	0x1000000
	or	%g0, 0x28, %i7
	P_DTLB_TAG_READ
	nop
	nop
	nop
	nop
	.word	0xe674a020
	.word	0xc034ac7e
	.word	0x1000000
	or	%g0, 0x044, %i7
	P_LOAD_IDATA_IN
	.word	0xfcd94320
	.word	0xde71a020
	.word	0xc021af70
	.word	0xfe51a27e
	.word	0xfe5e2e18
	P_IDEMAP_ALL
	P_IDEMAP_ALL_RPAGES
	.word	0xbe85a098
	.word	0xe0dfd000
thr4_MMU_ASI_REAL_IO_LITTLE_214:
	.word	0x8780201d
	.word	0xd6f56010
	.word	0x1000000
	or	%g0, 0x47a, %i7
	P_LOAD_IDATA_ACCESS
thr4_MMU_ASI_BLK_COMMIT_P_215:
	.word	0x878020e0
	.word	0xe1baa180
	.word	0xc037265a
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdc1000
thr4_MMU_ASI_AS_IF_USER_PRIMARY_216:
	.word	0x87802010
	.word	0xd2f6e080
	.word	0xbe85a038
	.word	0xecdfc200
	.word	0xbe80a098
	.word	0xecdfd040
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x638, %i7
	P_DTLB_TAG_READ
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v400_exit:
	EXIT_GOOD
Thr4_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v002 TEXT_VA=0x720e00000000
attr_text {
	Name = .Thr4_User_Text_4v002 ,
	VA = 0x720e00000000 ,/* 0x720e0fffffc0 */
	RA = 0x0070000000 ,
	PA = 0x4870000000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 0000720e000004d1 8000004870000085 */
	end_label   = Thr4_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v002_text_begin
Thr4_User_Text_4v002_text_begin:
	wrpr	0, %gl
	nop
	nop
	P_IDEMAP_ALL_RPAGES
	.word	0xfe5aa0f0
	P_DDEMAP_PCTX
thr4_MMU_ASI_PRIMARY_LITTLE_217:
	.word	0x87802088
	.word	0xfaf420d0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x0b5, %i7
	P_LOAD_DDATA_IN
	.word	0xfc9c85e0
	.word	0x1000000
	.word	0xbe114000
	P_IDEMAP_PAGE
	P_ACCESS_DTSB_PTR
	.word	0xbe80a038
	.word	0xecdfc200
	.word	0xbe816070
	.word	0xc19fc2e0
	.word	0xd0742058
	.word	0xc075a1d0
	.word	0xbe82a0e0
	.word	0xecdfd000
thr4_MMU_ASI_PRIMARY_218:
	.word	0x87802080
	.word	0xecf5a0e0
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x039, %i7
	P_LOAD_IDATA_IN
thr4_MMU_ASI_AS_IF_USER_PRIMARY_219:
	.word	0x87802010
	.word	0xe6f0a0d0
	.word	0xfc995120
	.word	0xf4742108
	.word	0xc035afd6
thr4_MMU_ASI_PRIMARY_LITTLE_220:
	.word	0x87802088
	.word	0xd4f6e068
	nop
	nop
	nop
	nop
	nop
	.word	0xfa75a080
	.word	0xc02426b4
	.word	0xfcdd9000
	.word	0xfc998580
	.word	0xfcd89000
	.word	0xbe82a110
	.word	0xecdfd000
	.word	0x1000000
	or	%g0, 0x318, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0xf8, %i7
	P_DTLB_TAG_READ
	.word	0xec58a120
	.word	0x1000000
	or	%g0, 0x568, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x588, %i7
	P_READ_IDATA_ACCESS
	.word	0xfc9b05e0
	.word	0xd475a0e0
	.word	0xc02daee3
	.word	0xc19ede00
	.word	0xfcda9000
	.word	0xfc9c1000
thr4_MMU_ASI_AS_IF_USER_PRIMARY_221:
	.word	0x87802010
	.word	0xc6f6e0e8
	.word	0xbe84a0b0
	.word	0xc4dfc280
	P_TOGGLE_LSU_DM
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v002_exit:
	EXIT_GOOD
Thr4_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v101 DATA_VA=0x6f9000130000
attr_data {
	Name = .Thr4_User_Data_4v101 ,
	VA = 0x6f9000130000 ,/* 0x6f9000131fc0 */
	RA = 0x03601b8000 ,
	PA = 0x03601b8000 ,
	TTE_Context = 0x04d1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006f900013113f 80000003601b8040 */
	end_label   = Thr4_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v101_data_begin
Thr4_User_Data_4v101_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v201 DATA_VA=0x6f9000066000
attr_data {
	Name = .Thr4_User_Data_4v201 ,
	VA = 0x6f9000066000 ,/* 0x6f9000067fc0 */
	RA = 0x0360030000 ,
	PA = 0x0360030000 ,
	TTE_Context = 0x18ea ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006f9000067d83 8000000360030440 */
	end_label   = Thr4_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v201_data_begin
Thr4_User_Data_4v201_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v301 DATA_VA=0x710015000000
attr_data {
	Name = .Thr4_User_Data_4v301 ,
	VA = 0x710015000000 ,/* 0x7100153fffc0 */
	RA = 0x03e1c00000 ,
	PA = 0x4fe1c00000 ,
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
	/* DTTE_TAG_DATA = 0000710015000000 8000004fe1c00443 */
	end_label   = Thr4_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v301_data_begin
Thr4_User_Data_4v301_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v003 TEXT_VA=0x6f90001ec000
attr_text {
	Name = .Thr4_User_Text_4v003 ,
	VA = 0x6f90001ec000 ,/* 0x6f90001edfc0 */
	RA = 0x03601e6000 ,
	PA = 0x03601e6000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f90001ed13f 80000003601e6080 */
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
	.word	0xdc742058
	.word	0xc0212c90
	.word	0xea712080
	.word	0xc02aa528
	.word	0xc076eb80
	.word	0x1000000
	or	%g0, 0x2c0, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x13e, %i7
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc02aa911
	.word	0xfcddd120
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0xec5ee0c0
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
	or	%g0, 0x07b, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x5bf, %i7
	LOAD_DDATA_ACCESS
	.word	0xe19d9f00
	.word	0xbe842100
	.word	0xc4dfd000
	.word	0xf85aa0a8
	.word	0xbe86e008
	.word	0xd4dfd000
	.word	0xc85ee038
	nop
	.word	0x1000000
	or	%g0, 0x59, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_NCTX
	DDEMAP_ALL_PAGES
thr4_MMU_ASI_PRIMARY_222:
	.word	0x87802080
	.word	0xf0f2a018
	.word	0xbe842068
	.word	0xe0dfd000
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfe5eeb18
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xee5da070
	.word	0x81c4e000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v003_exit:
	EXIT_GOOD
Thr4_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v401 TEXT_VA=0x700000530000
attr_text {
	Name = .Thr4_User_Text_4v401 ,
	VA = 0x700000530000 ,/* 0x70000053ffc0 */
	RA = 0x0210e90000 ,
	PA = 0x4e10e90000 ,
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
	/* ITTE_TAG_DATA = 0000700000530000 8000004e10e90081 */
	end_label   = Thr4_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v401_text_begin
Thr4_User_Text_4v401_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_DM
	.word	0xe05e20f0
	.word	0xbe85a120
	.word	0xc4dfc200
	.word	0xbe85e070
	.word	0xe19fc2e0
	.word	0x1000000
	or	%g0, 0xb0, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x550, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe154000
	P_DDEMAP_RPAGE
thr4_MMU_ASI_PRIMARY_223:
	.word	0x87802080
	.word	0xeef2a010
	.word	0x1000000
	or	%g0, 0xc0, %i7
	P_ITLB_TAG_READ
	P_IDEMAP_ALL_PAGES
	.word	0xc19c02c0
	nop
	nop
	nop
	nop
	.word	0xfe44abf4
	.word	0xc0762990
	.word	0xca762070
	.word	0xc0762b48
thr4_MMU_ASI_PRIMARY_224:
	.word	0x87802080
	.word	0xd0f42058
thr4_MMU_ASI_PRIMARY_225:
	.word	0x87802080
	.word	0xd8f5a0c8
	.word	0x1000000
	or	%g0, 0x04c, %i7
	P_LOAD_IDATA_IN
thr4_MMU_ASI_BLK_S_226:
	.word	0x878020f1
	.word	0xc1bde140
	.word	0x1000000
	or	%g0, 0x10, %i7
	P_ITLB_TAG_READ
	.word	0xfcdec200
	.word	0xfcda8200
	.word	0xfcdc0200
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe130000
	P_DDEMAP_PAGE
	.word	0xbe82a120
	.word	0xe0dfc200
	.word	0xbe85a068
	.word	0xc8dfd000
	.word	0xfcdc5020
	.word	0x1000000
	.word	0xbe174000
	P_IDEMAP_PAGE
	.word	0xfcded000
	.word	0xfe5e2968
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a008
	.word	0xecdfd000
thr4_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_227:
	.word	0x87802018
	.word	0xe2f2a010
thr4_MMU_ASI_AS_IF_USER_PRIMARY_228:
	.word	0x87802010
	.word	0xcaf5a010
thr4_MMU_ASI_AS_IF_USER_PRIMARY_229:
	.word	0x87802010
	.word	0xdef12030
	P_DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xfe432aa8
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v401_exit:
	EXIT_GOOD
Thr4_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v004 TEXT_VA=0x6f9000030000
attr_text {
	Name = .Thr4_User_Text_4v004 ,
	VA = 0x6f9000030000 ,/* 0x6f9000031fc0 */
	RA = 0x0360018000 ,
	PA = 0x0360018000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f900003113f 8000000360018080 */
	end_label   = Thr4_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v004_text_begin
Thr4_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x140, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe85a120
	.word	0xe0dfc200
	.word	0xfe42af3c
	.word	0xfc989100
	.word	0x1000000
	.word	0xbe108000
	P_DDEMAP_RPAGE
	.word	0xfcd90200
	.word	0xbe82e040
	.word	0xe2dfd060
	.word	0xbe86e068
	.word	0xe0dfd000
thr4_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_230:
	.word	0x87802023
	.word	0xd4bc63e0
thr4_MMU_ASI_AS_IF_USER_PRIMARY_231:
	.word	0x87802010
	.word	0xe0f6e068
	.word	0x1000000
	.word	0xbe150000
	P_DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x13e, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfe52aef8
thr4_MMU_ASI_AS_IF_USER_PRIMARY_232:
	.word	0x87802010
	.word	0xf6f120e0
	.word	0xc072ace8
	.word	0x1000000
	or	%g0, 0x9a, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xd672a010
	.word	0xc032a130
	.word	0xfcdc0200
thr4_MMU_ASI_AS_IF_USER_PRIMARY_233:
	.word	0x87802010
	.word	0xcaf12010
	.word	0x1000000
	or	%g0, 0x58, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x598, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x06a, %i7
	P_LOAD_IDATA_IN
thr4_MMU_ASI_AS_IF_USER_PRIMARY_234:
	.word	0x87802010
	.word	0xd0f12088
	.word	0xfcd89000
	.word	0x1000000
	or	%g0, 0x06e, %i7
	P_LOAD_IDATA_IN
	nop
	.word	0x1000000
	or	%g0, 0x031, %i7
	P_LOAD_IDATA_IN
	.word	0xfcda8200
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x728, %i7
	P_READ_DDATA_ACCESS
	.word	0xfe5c2b90
	.word	0xfe4c24a6
	.word	0x1000000
	or	%g0, 0x4c, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfc9984e0
	.word	0x1000000
	or	%g0, 0x032, %i7
	P_LOAD_IDATA_IN
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x4e8, %i7
	P_DTLB_TAG_READ
	P_ACCESS_DTSB_PTR
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v004_exit:
	EXIT_GOOD
Thr4_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v102 DATA_VA=0x6f900007a000
attr_data {
	Name = .Thr4_User_Data_4v102 ,
	VA = 0x6f900007a000 ,/* 0x6f900007bfc0 */
	RA = 0x036014c000 ,
	PA = 0x036014c000 ,
	TTE_Context = 0x04d1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006f900007b13f 800000036014c040 */
	end_label   = Thr4_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v102_data_begin
Thr4_User_Data_4v102_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v202 DATA_VA=0x6f90000c4000
attr_data {
	Name = .Thr4_User_Data_4v202 ,
	VA = 0x6f90000c4000 ,/* 0x6f90000c5fc0 */
	RA = 0x0360060000 ,
	PA = 0x0360060000 ,
	TTE_Context = 0x18ea ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006f90000c5d83 8000000360060440 */
	end_label   = Thr4_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v202_data_begin
Thr4_User_Data_4v202_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v302 DATA_VA=0x710009400000
attr_data {
	Name = .Thr4_User_Data_4v302 ,
	VA = 0x710009400000 ,/* 0x7100097fffc0 */
	RA = 0x03eb000000 ,
	PA = 0x4feb000000 ,
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
	/* DTTE_TAG_DATA = 0000710009400000 8000004feb000443 */
	end_label   = Thr4_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v302_data_begin
Thr4_User_Data_4v302_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v005 TEXT_VA=0x6f9000132000
attr_text {
	Name = .Thr4_User_Text_4v005 ,
	VA = 0x6f9000132000 ,/* 0x6f9000133fc0 */
	RA = 0x036014e000 ,
	PA = 0x036014e000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f900013313f 800000036014e080 */
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
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc036e284
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0xf875a048
	.word	0xc02da241
	nop
	nop
	nop
	.word	0xd272a0d8
	.word	0xc02aa326
	.word	0xfe5da280
	.word	0xfe58a9d0
	.word	0xec5da120
	.word	0xfcdd9100
	.word	0xc020a9cc
	.word	0x1000000
	.word	0xbe170000
	DDEMAP_RPAGE
	.word	0xfe52af26
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_PAGES
	.word	0xe45c20a8
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcda9040
	.word	0xc020a39c
	.word	0xfe4ee642
	.word	0xbe8120e0
	.word	0xd4dfd000
	.word	0xec70a008
	.word	0xc075a140
	.word	0x1000000
	or	%g0, 0x1ed, %i7
	LOAD_DDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xfe5ee430
	.word	0x1000000
	or	%g0, 0x408, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe110000
	IDEMAP_RPAGE
	.word	0xd45c20c0
	.word	0xbe82a068
	.word	0xc4dfd000
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
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45ee110
	.word	0x1000000
	or	%g0, 0xb0, %i7
	READ_IDATA_ACCESS
	nop
	nop
	DDEMAP_NCTX
	.word	0xf65ee0f0
	.word	0xcc5ee078
	.word	0xce75a0e8
	.word	0xc0712d18
	.word	0x1000000
	or	%g0, 0x485, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_BLK_P_235:
	.word	0x878020f0
	.word	0xe1baab80
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x100, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x40, %i7
	READ_IDATA_ACCESS
	.word	0xfcdc1000
	.word	0xc022ab0c
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfcdc1000
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x071, %i7
	LOAD_IDATA_IN
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe158000
	IDEMAP_PAGE
	.word	0x1000000
	.word	0xbe104000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x03e, %i7
	LOAD_IDATA_IN
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x0ad, %i7
	LOAD_DDATA_IN
	.word	0xee72a010
	.word	0xc02da36a
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x506, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0xec5aa008
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe45a458
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v005_exit:
	EXIT_GOOD
Thr4_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v402 TEXT_VA=0x6f90001a8000
attr_text {
	Name = .Thr4_User_Text_4v402 ,
	VA = 0x6f90001a8000 ,/* 0x6f90001a9fc0 */
	RA = 0x03600f8000 ,
	PA = 0x03600f8000 ,
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
	/* ITTE_TAG_DATA = 00006f90001a8000 80000003600f8080 */
	end_label   = Thr4_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v402_text_begin
Thr4_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x014, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x48, %i7
	P_READ_IDATA_ACCESS
	P_TOGGLE_LSU_IM
	.word	0xfcdd8200
thr4_MMU_ASI_AS_IF_USER_SECONDARY_236:
	.word	0x87802011
	.word	0xd8f2e018
	P_ACCESS_ITSB_PTR
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x050, %i7
	P_LOAD_IDATA_IN
thr4_MMU_ASI_AS_IF_USER_PRIMARY_237:
	.word	0x87802010
	.word	0xcaf6e0a0
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
	.word	0xfcddd020
thr4_MMU_ASI_BLK_P_238:
	.word	0x878020f0
	.word	0xe3b8a100
	.word	0xc19adf20
	.word	0xc029ac7f
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x760, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x60, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe842038
	.word	0xd4dfd000
	P_ACCESS_DTSB_PTR
	.word	0xc02625e4
	.word	0x1000000
	or	%g0, 0x478, %i7
	P_READ_DDATA_ACCESS
	P_DDEMAP_ALL_PAGES
	P_IDEMAP_ALL
	.word	0xe39ac2e0
thr4_MMU_ASI_PRIMARY_239:
	.word	0x87802080
	.word	0xcaf2a040
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x428, %i7
	P_DTLB_TAG_READ
	.word	0xfcd89000
	.word	0xfc9c8580
	P_IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xfcd91000
thr4_MMU_ASI_AS_IF_USER_PRIMARY_240:
	.word	0x87802010
	.word	0xcef6e080
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe100000
	P_DDEMAP_PAGE
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0xef, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe8420c0
	.word	0xe39fc2c0
	.word	0xfcda43a0
	.word	0xc85b2098
thr4_MMU_ASI_PRIMARY_241:
	.word	0x87802080
	.word	0xfaf0a0b8
	.word	0xbe8420c0
	.word	0xf6dfd000
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
thr4_MMU_ASI_BLK_P_242:
	.word	0x878020f0
	.word	0xe3baa640
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	P_DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe842038
	.word	0xc4dfc200
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v402_exit:
	EXIT_GOOD
Thr4_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v006 TEXT_VA=0x6f9000100000
attr_text {
	Name = .Thr4_User_Text_4v006 ,
	VA = 0x6f9000100000 ,/* 0x6f9000101fc0 */
	RA = 0x036010e000 ,
	PA = 0x036010e000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f900010113f 800000036010e080 */
	end_label   = Thr4_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v006_text_begin
Thr4_User_Text_4v006_text_begin:
	wrpr	0, %gl
	P_ACCESS_ITSB_PTR
	.word	0xbe86e038
	.word	0xc4dfd000
	.word	0xfcdd8200
	.word	0xd85da048
	.word	0xfcdc0200
	.word	0xc876e038
	.word	0xc0342392
	.word	0xc026e210
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xf4742118
	.word	0xc025a7d0
	P_TOGGLE_LSU_DM
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x260, %i7
	P_READ_DDATA_ACCESS
thr4_MMU_ASI_BLK_COMMIT_P_243:
	.word	0x878020e0
	.word	0xe1bda100
	.word	0xde7420f8
	.word	0xc02ee52c
	.word	0x1000000
	or	%g0, 0x08c, %i7
	P_LOAD_IDATA_IN
	.word	0xc03121f6
thr4_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_244:
	.word	0x87802018
	.word	0xf0f0a0a8
	.word	0xfcdc1000
	.word	0xfcdc0200
	P_DDEMAP_ALL_PAGES
	.word	0xbe174000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v006_exit:
	EXIT_GOOD
Thr4_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v103 DATA_VA=0x71000a400000
attr_data {
	Name = .Thr4_User_Data_4v103 ,
	VA = 0x71000a400000 ,/* 0x71000a7fffc0 */
	RA = 0x03ed400000 ,
	PA = 0x4fed400000 ,
	TTE_Context = 0x04d1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000071000a4004d1 8000004fed400043 */
	end_label   = Thr4_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v103_data_begin
Thr4_User_Data_4v103_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v203 DATA_VA=0x700000d10000
attr_data {
	Name = .Thr4_User_Data_4v203 ,
	VA = 0x700000d10000 ,/* 0x700000d1ffc0 */
	RA = 0x02107b0000 ,
	PA = 0x4e107b0000 ,
	TTE_Context = 0x18ea ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_3 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000700000d118ea 8000004e107b0441 */
	end_label   = Thr4_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v203_data_begin
Thr4_User_Data_4v203_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v303 DATA_VA=0x700000280000
attr_data {
	Name = .Thr4_User_Data_4v303 ,
	VA = 0x700000280000 ,/* 0x70000028ffc0 */
	RA = 0x02104f0000 ,
	PA = 0x4e104f0000 ,
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
	/* DTTE_TAG_DATA = 0000700000280000 8000004e104f0441 */
	end_label   = Thr4_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v303_data_begin
Thr4_User_Data_4v303_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v007 TEXT_VA=0x71000b800000
attr_text {
	Name = .Thr4_User_Text_4v007 ,
	VA = 0x71000b800000 ,/* 0x71000bbfffc0 */
	RA = 0x03e2800000 ,
	PA = 0x4fe2800000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000071000b8004d1 8000004fe2800083 */
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
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe150000
	DDEMAP_PAGE
thr4_MMU_ASI_BLK_P_245:
	.word	0x878020f0
	.word	0xc3bda140
	.word	0xe272a040
	.word	0xc02daea8
	ACCESS_DTSB_PTR
	.word	0xee5da010
	.word	0x1000000
	.word	0xbe160000
	IDEMAP_PAGE
	.word	0xc025ab78
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc035a42a
	.word	0xc070aa48
	.word	0xbe842110
	.word	0xe39fde00
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xbe82a008
	.word	0xc8dfd000
thr4_MMU_ASI_PRIMARY_246:
	.word	0x87802080
	.word	0xdef42090
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
thr4_MMU_ASI_PRIMARY_247:
	.word	0x87802080
	.word	0xdef12030
thr4_MMU_ASI_SECONDARY_248:
	.word	0x87802081
	.word	0xd2f2e020
	.word	0xc035a856
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xec5aa110
	nop
	nop
	nop
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a038
	.word	0xecdfd000
	IDEMAP_ALL_PAGES
thr4_MMU_ASI_PRIMARY_249:
	.word	0x87802080
	.word	0xe4f42048
	.word	0xee742010
	.word	0xc036e8a4
	.word	0xc032a81e
	TOGGLE_LSU_IM
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_PRIMARY_LITTLE_250:
	.word	0x87802088
	.word	0xf4f2a0d0
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	TOGGLE_LSU_IM
	.word	0xbe82a110
	.word	0xc4dfd000
	TOGGLE_LSU_IM
	DDEMAP_SCTX
	DDEMAP_PCTX
	.word	0xc02c22e3
	.word	0xfe5da780
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	DTLB_TAG_READ
	.word	0xfe5aa680
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
	DDEMAP_ALL_RPAGES
	.word	0xfe4421b0
	.word	0xe19c1e00
	.word	0xfe50a98c
	.word	0xfe4c2498
	nop
	nop
	nop
	.word	0xc036e52e
	.word	0xbe82e0a0
	.word	0xe19fde20
	TOGGLE_LSU_IM
	.word	0xe475a048
	.word	0xc02aa82a
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
	DDEMAP_ALL_RPAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc07125c0
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v007_exit:
	EXIT_GOOD
Thr4_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v008 TEXT_VA=0x6f900011c000
attr_text {
	Name = .Thr4_User_Text_4v008 ,
	VA = 0x6f900011c000 ,/* 0x6f900011dfc0 */
	RA = 0x03601ec000 ,
	PA = 0x03601ec000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f900011d13f 80000003601ec080 */
	end_label   = Thr4_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v008_text_begin
Thr4_User_Text_4v008_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x188, %i7
	P_READ_IDATA_ACCESS
	.word	0xc0292fae
	P_TOGGLE_LSU_DM
	nop
	.word	0x1000000
	or	%g0, 0x428, %i7
	P_ITLB_TAG_READ
	nop
	nop
	.word	0xfcdc1000
	.word	0xc45da098
	.word	0xf4742080
	.word	0xc02daa1f
	.word	0x1000000
	or	%g0, 0x538, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x2c5, %i7
	P_LOAD_DDATA_ACCESS
thr4_MMU_ASI_PRIMARY_251:
	.word	0x87802080
	.word	0xc4f5a008
	P_TOGGLE_LSU_IM
	.word	0xbe812038
	.word	0xf6dfd000
thr4_MMU_ASI_PRIMARY_252:
	.word	0x87802080
	.word	0xd6f6e040
thr4_MMU_ASI_SECONDARY_LITTLE_253:
	.word	0x87802089
	.word	0xc4f460c0
	.word	0x1000000
	or	%g0, 0x240, %i7
	P_DTLB_TAG_READ
	.word	0xbe82a068
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe15c000
	P_DDEMAP_PAGE
	.word	0xfcdd8200
thr4_MMU_ASI_SECONDARY_254:
	.word	0x87802081
	.word	0xd4b967b0
	.word	0x1000000
	or	%g0, 0x268, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe17c000
	P_IDEMAP_RPAGE
	.word	0xfcda9000
	nop
	nop
	nop
	.word	0xbe82a038
	.word	0xf6dfc200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_PRIMARY_255:
	.word	0x87802080
	.word	0xf6f5a0e0
	.word	0xc028a733
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
	or	%g0, 0x290, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v008_exit:
	EXIT_GOOD
Thr4_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v104 DATA_VA=0x720610000000
attr_data {
	Name = .Thr4_User_Data_4v104 ,
	VA = 0x720610000000 ,/* 0x72061fffffc0 */
	RA = 0x0270000000 ,
	PA = 0x4e70000000 ,
	TTE_Context = 0x04d1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007206100004d1 8000004e70000045 */
	end_label   = Thr4_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v104_data_begin
Thr4_User_Data_4v104_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v304 DATA_VA=0x71003b400000
attr_data {
	Name = .Thr4_User_Data_4v304 ,
	VA = 0x71003b400000 ,/* 0x71003b7fffc0 */
	RA = 0x03e2000000 ,
	PA = 0x4fe2000000 ,
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
	/* DTTE_TAG_DATA = 000071003b400000 8000004fe2000443 */
	end_label   = Thr4_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v304_data_begin
Thr4_User_Data_4v304_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v009 TEXT_VA=0x7000004d0000
attr_text {
	Name = .Thr4_User_Text_4v009 ,
	VA = 0x7000004d0000 ,/* 0x7000004dffc0 */
	RA = 0x02106c0000 ,
	PA = 0x4e106c0000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007000004d04d1 8000004e106c0081 */
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
	.word	0x1000000
	.word	0xbe128000
	DDEMAP_PAGE
	IDEMAP_PCTX
	ACCESS_ITSB_PTR
	.word	0xbe138000
	GOTO_SUPERVISOR1
thr4_MMU_ASI_PRIMARY_256:
	.word	0x87802080
	.word	0xf0f2a018
thr4_MMU_ASI_PRIMARY_257:
	.word	0x87802080
	.word	0xecf42098
	.word	0xd672a070
	.word	0xc02dad8a
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0xfc995d60
	.word	0xc02c2dda
	.word	0x1000000
	or	%g0, 0x128, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	.word	0xec58a038
	.word	0xfcda9000
	TOGGLE_LSU_DM
	ACCESS_ITSB_PTR
	.word	0xfe4eefa9
	.word	0xd458a0f0
	.word	0x1000000
	or	%g0, 0x180, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe12c000
	IDEMAP_PAGE
	.word	0xfe5eee18
	.word	0x1000000
	or	%g0, 0x618, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe16c000
	DDEMAP_PAGE
	.word	0xfe4c2624
	.word	0xc025a870
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
	or	%g0, 0x03c, %i7
	LOAD_IDATA_IN
	.word	0xd872a018
	.word	0xc026eed0
	.word	0x1000000
	or	%g0, 0x011, %i7
	LOAD_IDATA_IN
	IDEMAP_PCTX
	.word	0xd075a088
	.word	0xc036ec6c
	.word	0xfc9ed000
	.word	0xbe842100
	.word	0xd4dfd000
	.word	0xc02c2ae7
	TOGGLE_LSU_IM
	.word	0xbe150000
	GOTO_SUPERVISOR1
	DDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc034257c
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v009_exit:
	EXIT_GOOD
Thr4_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00a TEXT_VA=0x700000b70000
attr_text {
	Name = .Thr4_User_Text_4v00a ,
	VA = 0x700000b70000 ,/* 0x700000b7ffc0 */
	RA = 0x0210990000 ,
	PA = 0x4e10990000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000700000b704d1 8000004e10990081 */
	end_label   = Thr4_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00a_text_begin
Thr4_User_Text_4v00a_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x248, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x520, %i7
	P_DTLB_TAG_READ
	.word	0xfe52a21c
	nop
	nop
	nop
	nop
thr4_MMU_ASI_BLK_P_258:
	.word	0x878020f0
	.word	0xe1b8a8c0
	.word	0xe05c2038
	.word	0x1000000
	or	%g0, 0x7c1, %i7
	P_LOAD_DDATA_ACCESS
thr4_MMU_ASI_AS_IF_USER_PRIMARY_259:
	.word	0x87802010
	.word	0xf8f0a018
	.word	0xfe45afd8
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_DDEMAP_ALL_PAGES
	.word	0xfe5aa9f8
	.word	0xfcdc0200
	P_IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_ALL
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x780, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x40, %i7
	P_LOAD_DDATA_ACCESS
	nop
	P_DDEMAP_ALL_RPAGES
	P_TOGGLE_LSU_DM
	P_TOGGLE_LSU_DM
	.word	0xf275a000
	.word	0xc028aceb
thr4_MMU_ASI_AS_IF_USER_PRIMARY_260:
	.word	0x87802010
	.word	0xdcf42028
	.word	0xc670a0d0
	.word	0xc0212ff0
	.word	0x1000000
	or	%g0, 0x6c8, %i7
	P_READ_DDATA_ACCESS
	.word	0xc85ee0c0
	.word	0xfe42acb8
	P_DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x60, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x7c8, %i7
	P_DTLB_TAG_READ
	.word	0xe276e040
	.word	0xc032a34a
	.word	0xfcda9000
	.word	0x1000000
	.word	0xbe118000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v00a_exit:
	EXIT_GOOD
Thr4_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v105 DATA_VA=0x6f9000198000
attr_data {
	Name = .Thr4_User_Data_4v105 ,
	VA = 0x6f9000198000 ,/* 0x6f9000199fc0 */
	RA = 0x0360126000 ,
	PA = 0x0360126000 ,
	TTE_Context = 0x04d1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006f900019913f 8000000360126040 */
	end_label   = Thr4_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v105_data_begin
Thr4_User_Data_4v105_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00b TEXT_VA=0x720630000000
attr_text {
	Name = .Thr4_User_Text_4v00b ,
	VA = 0x720630000000 ,/* 0x72063fffffc0 */
	RA = 0x01a0000000 ,
	PA = 0x4da0000000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007206300004d1 8000004da0000085 */
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
	.word	0x1000000
	or	%g0, 0x128, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x087, %i7
	LOAD_DDATA_IN
	.word	0xe6712020
	.word	0xc020a7b8
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcd89040
	.word	0xc026e130
	.word	0xd876e018
	.word	0xc02aacc8
	.word	0xc072a130
	.word	0xee5ee010
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe542bc8
thr4_MMU_ASI_PRIMARY_261:
	.word	0x87802080
	.word	0xe4f2a018
	.word	0xfe4da555
	.word	0xd458a038
thr4_MMU_ASI_BLK_PL_262:
	.word	0x878020f8
	.word	0xc1bc2980
	.word	0xc45aa110
thr4_MMU_ASI_PRIMARY_263:
	.word	0x87802080
	.word	0xeef420a0
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe118000
	DDEMAP_PAGE
	.word	0xbe82a100
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x7a8, %i7
	READ_DDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0xfe48a867
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x570, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x05c, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x518, %i7
	DTLB_TAG_READ
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0xf1, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc02eeccc
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xd45ee098
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00b_exit:
	EXIT_GOOD
Thr4_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v106 DATA_VA=0x700000040000
attr_data {
	Name = .Thr4_User_Data_4v106 ,
	VA = 0x700000040000 ,/* 0x70000004ffc0 */
	RA = 0x0210550000 ,
	PA = 0x4e10550000 ,
	TTE_Context = 0x04d1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007000000404d1 8000004e10550041 */
	end_label   = Thr4_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v106_data_begin
Thr4_User_Data_4v106_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00c TEXT_VA=0x6f90001e2000
attr_text {
	Name = .Thr4_User_Text_4v00c ,
	VA = 0x6f90001e2000 ,/* 0x6f90001e3fc0 */
	RA = 0x03601aa000 ,
	PA = 0x03601aa000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f90001e313f 80000003601aa080 */
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
	.word	0x1000000
	or	%g0, 0x628, %i7
	DTLB_TAG_READ
	.word	0xec742068
	.word	0xc025a7bc
	.word	0xfcdd9000
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x03f, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_BLK_P_264:
	.word	0x878020f0
	.word	0xe3bee100
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
	.word	0xfcded000
	DDEMAP_SCTX
	.word	0xfe48a3ea
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xc0712530
	.word	0xfcdad120
	.word	0xbe82a100
	.word	0xf6dfd000
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x24e, %i7
	LOAD_DDATA_ACCESS
thr4_MMU_ASI_PRIMARY_265:
	.word	0x87802080
	.word	0xe4f2a078
	.word	0xfe592b98
	.word	0xc6712030
	.word	0xc026efb4
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_PAGE
	.word	0xe1995e20
	.word	0x1000000
	or	%g0, 0x04d, %i7
	LOAD_IDATA_IN
	.word	0xfe45a8e8
	TOGGLE_LSU_DM
	.word	0xfcdc1000
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	nop
	nop
	.word	0xfcdc1000
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x79, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe82a068
	.word	0xecdfd000
	.word	0xe676e020
	.word	0xc02da418
	IDEMAP_PCTX
	ACCESS_ITSB_PTR
	.word	0xe872a028
	.word	0xc07128b0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc85da120
	.word	0x81c3e000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00c_exit:
	EXIT_GOOD
Thr4_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v107 DATA_VA=0x6f9000114000
attr_data {
	Name = .Thr4_User_Data_4v107 ,
	VA = 0x6f9000114000 ,/* 0x6f9000115fc0 */
	RA = 0x03601ac000 ,
	PA = 0x03601ac000 ,
	TTE_Context = 0x04d1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006f900011513f 80000003601ac040 */
	end_label   = Thr4_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v107_data_begin
Thr4_User_Data_4v107_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00d TEXT_VA=0x710025400000
attr_text {
	Name = .Thr4_User_Text_4v00d ,
	VA = 0x710025400000 ,/* 0x7100257fffc0 */
	RA = 0x03ee400000 ,
	PA = 0x4fee400000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007100254004d1 8000004fee400083 */
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
	.word	0x1000000
	or	%g0, 0x509, %i7
	LOAD_IDATA_ACCESS
	.word	0xec5da098
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x004, %i7
	LOAD_DDATA_IN
	.word	0xbe85e010
	.word	0xd6dfd020
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr4_MMU_ASI_PRIMARY_266:
	.word	0x87802080
	.word	0xe8f0a028
	.word	0x1000000
	or	%g0, 0x03e, %i7
	LOAD_DDATA_IN
	.word	0xe2742010
	.word	0xc02ee8b2
	.word	0x1000000
	or	%g0, 0x78, %i7
	READ_IDATA_ACCESS
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
	.word	0xbe16c000
	DDEMAP_PAGE
	.word	0xfcdd9000
	.word	0xc875a110
	.word	0xc022aaf4
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe25da010
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00d_exit:
	EXIT_GOOD
Thr4_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v108 DATA_VA=0x6f90001e4000
attr_data {
	Name = .Thr4_User_Data_4v108 ,
	VA = 0x6f90001e4000 ,/* 0x6f90001e5fc0 */
	RA = 0x0360156000 ,
	PA = 0x0360156000 ,
	TTE_Context = 0x04d1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006f90001e513f 8000000360156040 */
	end_label   = Thr4_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v108_data_begin
Thr4_User_Data_4v108_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00e TEXT_VA=0x71003c000000
attr_text {
	Name = .Thr4_User_Text_4v00e ,
	VA = 0x71003c000000 ,/* 0x71003c3fffc0 */
	RA = 0x03e3c00000 ,
	PA = 0x4fe3c00000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000071003c0004d1 8000004fe3c00083 */
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
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x00d, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x420, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	TOGGLE_LSU_IM
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x4e0, %i7
	ITLB_TAG_READ
	nop
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_RPAGE
	.word	0xfe5aa240
	DDEMAP_ALL_PAGES
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xd275a020
	.word	0xc032afc6
	.word	0xec5c20c0
	.word	0x1000000
	or	%g0, 0x230, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc072aeb8
	.word	0xfcded000
	.word	0xc072a230
	.word	0xbe138000
	GOTO_SUPERVISOR1
	DDEMAP_ALL_PAGES
	.word	0xfe55aefa
	ACCESS_ITSB_PTR
	.word	0xfc9c5d60
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	.word	0xf8592018
	.word	0x1000000
	or	%g0, 0x23e, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe85e040
	.word	0xd6dfd020
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4c2aa7
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00e_exit:
	EXIT_GOOD
Thr4_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v109 DATA_VA=0x700000010000
attr_data {
	Name = .Thr4_User_Data_4v109 ,
	VA = 0x700000010000 ,/* 0x70000001ffc0 */
	RA = 0x02109e0000 ,
	PA = 0x4e109e0000 ,
	TTE_Context = 0x04d1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007000000104d1 8000004e109e0041 */
	end_label   = Thr4_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v109_data_begin
Thr4_User_Data_4v109_data_begin:
	.xword	0x71001c000000
	.xword	0x6f9000056000
	.xword	0x6f900009c000
	.xword	0x71000b400000
	.xword	0x710004400000
	.xword	0x6f900010c000
	.xword	0x720e00000000
	.xword	0x6f9000130000
	.xword	0x6f9000066000
	.xword	0x710015000000
	.xword	0x6f90001ec000
	.xword	0x700000530000
	.xword	0x6f9000030000
	.xword	0x6f900007a000
	.xword	0x6f90000c4000
	.xword	0x710009400000
	.xword	0x6f9000132000
	.xword	0x6f90001a8000
	.xword	0x6f9000100000
	.xword	0x71000a400000
	.xword	0x700000d10000
	.xword	0x700000280000
	.xword	0x71000b800000
	.xword	0x6f900011c000
	.xword	0x720610000000
	.xword	0x71003b400000
	.xword	0x7000004d0000
	.xword	0x700000b70000
	.xword	0x6f9000198000
	.xword	0x720630000000
	.xword	0x700000040000
	.xword	0x6f90001e2000
	.xword	0x6f9000114000
	.xword	0x710025400000
	.xword	0x6f90001e4000
	.xword	0x71003c000000
	.xword	0x700000010000
	.xword	0x710007c00000
Thr4_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00f TEXT_VA=0x710007c00000
attr_text {
	Name = .Thr4_User_Text_4v00f ,
	VA = 0x710007c00000 ,/* 0x710007ffffc0 */
	RA = 0x03e2c00000 ,
	PA = 0x4fe2c00000 ,
	TTE_Context = 0x04d1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000710007c004d1 8000004fe2c00083 */
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
	.word	0xc472a098
	.word	0xc022a7e0
	IDEMAP_ALL
	.word	0xec75a100
	.word	0xc036e63a
	.word	0x1000000
	or	%g0, 0x596, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x114, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x065, %i7
	LOAD_DDATA_IN
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x051, %i7
	LOAD_IDATA_IN
	.word	0xca5c2010
	DDEMAP_ALL_RPAGES
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x1d8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x074, %i7
	LOAD_IDATA_IN
	.word	0xc032a3ec
	DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x07f, %i7
	LOAD_DDATA_IN
thr4_MMU_ASI_BLK_P_267:
	.word	0x878020f0
	.word	0xc3bc2180
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe542bda
	.word	0xc02aa5bc
	.word	0xe876e058
	.word	0xc0342e32
	nop
	.word	0xc0242130
	IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	.word	0xe39a9e00
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5c2188
	.word	0xc02aa9c1
	ACCESS_DTSB_PTR
	DDEMAP_SCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x472, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x398, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_DM
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x04d, %i7
	LOAD_IDATA_IN
	.word	0xc076e500
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xfe4421b0
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00f_exit:
	EXIT_GOOD
Thr4_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x740000560000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	VA = 0x740000560000 ,/* 0x74000056ffc0 */
	RA = 0x02206d0000 ,
	PA = 0x02206d0000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007400005619a9 80000002206d0081 */
	end_label   = Thr5_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr5_user_code_entry
Thr5_user_code_entry:
	setx	0x73a00004a000, %g1, %g2
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
	.word	0x1000000
	or	%g0, 0x180, %i7
	DTLB_TAG_READ
	.word	0xcc5aa0a0
	.word	0xbe85a130
	.word	0xecdfd000
	.word	0x1000000
	or	%g0, 0x146, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4c2486
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe872a058
	.word	0xc022af90
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v000_exit:
	EXIT_GOOD
Thr5_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v100 DATA_VA=0x73a00004a000
attr_data {
	Name = .Thr5_User_Data_4v100 ,
	VA = 0x73a00004a000 ,/* 0x73a00004bfc0 */
	RA = 0x03701bc000 ,
	PA = 0x03701bc000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073a00004b9a9 80000003701bc440 */
	end_label   = Thr5_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v100_data_begin
Thr5_User_Data_4v100_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v200 DATA_VA=0x750014c00000
attr_data {
	Name = .Thr5_User_Data_4v200 ,
	VA = 0x750014c00000 ,/* 0x750014ffffc0 */
	RA = 0x03f5800000 ,
	PA = 0x03f5800000 ,
	TTE_Context = 0x154e ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000750014c0154e 80000003f5800043 */
	end_label   = Thr5_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v200_data_begin
Thr5_User_Data_4v200_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v300 DATA_VA=0x750038400000
attr_data {
	Name = .Thr5_User_Data_4v300 ,
	VA = 0x750038400000 ,/* 0x7500387fffc0 */
	RA = 0x03f3000000 ,
	PA = 0x03f3000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_2 ,
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
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 0000750038400000 80000003f3000043 */
	end_label   = Thr5_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v300_data_begin
Thr5_User_Data_4v300_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v001 TEXT_VA=0x7400002d0000
attr_text {
	Name = .Thr5_User_Text_4v001 ,
	VA = 0x7400002d0000 ,/* 0x7400002dffc0 */
	RA = 0x0220410000 ,
	PA = 0x0220410000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007400002d19a9 8000000220410081 */
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
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	DTLB_TAG_READ
	.word	0xdc76a058
	.word	0xc0292950
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4da3e5
thr5_MMU_ASI_PRIMARY_268:
	.word	0x87802080
	.word	0xdcf5a028
	IDEMAP_ALL_PAGES
	.word	0xbe82a0d0
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x758, %i7
	READ_DDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe5f6b80
thr5_MMU_ASI_PRIMARY_LITTLE_269:
	.word	0x87802088
	.word	0xe0bf6bd0
	ACCESS_DTSB_PTR
	.word	0xd45c2038
	.word	0xd45da110
	.word	0xec5da110
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4120e4
	TOGGLE_LSU_DM
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
	nop
	TOGGLE_LSU_DM
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02ea64c
	.word	0xc075a350
	.word	0x1000000
	or	%g0, 0x490, %i7
	ITLB_TAG_READ
	.word	0xec5c20d0
	ACCESS_ITSB_PTR
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	.word	0xfe42a4d8
thr5_MMU_ASI_PRIMARY_270:
	.word	0x87802080
	.word	0xc8bf6720
	.word	0xe25aa070
	IDEMAP_PCTX
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
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc476a068
	.word	0xc026ab6c
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v001_exit:
	EXIT_GOOD
Thr5_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v400 TEXT_VA=0x73a0000b2000
attr_text {
	Name = .Thr5_User_Text_4v400 ,
	VA = 0x73a0000b2000 ,/* 0x73a0000b3fc0 */
	RA = 0x037015a000 ,
	PA = 0x5f7015a000 ,
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
	/* ITTE_TAG_DATA = 000073a0000b2000 8000005f7015a080 */
	end_label   = Thr5_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v400_text_begin
Thr5_User_Text_4v400_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x065, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x4e8, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_ACCESS_DTSB_PTR
	.word	0xfcde9000
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v400_exit:
	EXIT_GOOD
Thr5_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v002 TEXT_VA=0x750016400000
attr_text {
	Name = .Thr5_User_Text_4v002 ,
	VA = 0x750016400000 ,/* 0x7500167fffc0 */
	RA = 0x03f4400000 ,
	PA = 0x03f4400000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 00007500164019a9 80000003f4400083 */
	end_label   = Thr5_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v002_text_begin
Thr5_User_Text_4v002_text_begin:
	wrpr	0, %gl
thr5_MMU_ASI_PRIMARY_271:
	.word	0x87802080
	.word	0xe8f5a088
	.word	0xec5da130
	P_DDEMAP_ALL_RPAGES
	P_IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x38, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x77e, %i7
	P_LOAD_DDATA_ACCESS
	P_TOGGLE_LSU_IM
	.word	0xc02daa7b
thr5_MMU_ASI_AS_IF_USER_PRIMARY_272:
	.word	0x87802010
	.word	0xe6f760a8
	.word	0xe05da038
thr5_MMU_ASI_AS_IF_USER_PRIMARY_273:
	.word	0x87802010
	.word	0xdcf2a0b0
	.word	0xbe85a038
	.word	0xecdfc200
	.word	0xbe85a130
	.word	0xd4dfd000
	.word	0xc45da100
	.word	0xfc998480
	.word	0x1000000
	.word	0xbe120000
	P_DDEMAP_PAGE
	.word	0xe0776130
	.word	0xc075ab38
	P_DDEMAP_PCTX
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
	or	%g0, 0x055, %i7
	P_LOAD_DDATA_IN
	P_IDEMAP_NCTX
thr5_MMU_ASI_BLK_COMMIT_P_274:
	.word	0x878020e0
	.word	0xe3bea940
	.word	0x1000000
	or	%g0, 0x28, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe85a0b8
	.word	0xe0dfc200
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v002_exit:
	EXIT_GOOD
Thr5_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v101 DATA_VA=0x73a000116000
attr_data {
	Name = .Thr5_User_Data_4v101 ,
	VA = 0x73a000116000 ,/* 0x73a000117fc0 */
	RA = 0x037008e000 ,
	PA = 0x037008e000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073a0001179a9 800000037008e440 */
	end_label   = Thr5_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v101_data_begin
Thr5_User_Data_4v101_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v201 DATA_VA=0x740000a30000
attr_data {
	Name = .Thr5_User_Data_4v201 ,
	VA = 0x740000a30000 ,/* 0x740000a3ffc0 */
	RA = 0x0220540000 ,
	PA = 0x0220540000 ,
	TTE_Context = 0x154e ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000740000a3154e 8000000220540041 */
	end_label   = Thr5_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v201_data_begin
Thr5_User_Data_4v201_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v301 DATA_VA=0x73a00008e000
attr_data {
	Name = .Thr5_User_Data_4v301 ,
	VA = 0x73a00008e000 ,/* 0x73a00008ffc0 */
	RA = 0x03700c2000 ,
	PA = 0x5f700c2000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_0 ,
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
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 000073a00008e000 8000005f700c2040 */
	end_label   = Thr5_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v301_data_begin
Thr5_User_Data_4v301_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v003 TEXT_VA=0x750016800000
attr_text {
	Name = .Thr5_User_Text_4v003 ,
	VA = 0x750016800000 ,/* 0x750016bfffc0 */
	RA = 0x03f3400000 ,
	PA = 0x03f3400000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007500168019a9 80000003f3400083 */
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
	ACCESS_DTSB_PTR
	.word	0xfe56a2e0
	.word	0x1000000
	or	%g0, 0xad, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x032, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x2ef, %i7
	LOAD_DDATA_ACCESS
thr5_MMU_ASI_PRIMARY_275:
	.word	0x87802080
	.word	0xeef2a018
	.word	0x1000000
	or	%g0, 0x027, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	nop
	nop
	TOGGLE_LSU_IM
thr5_MMU_ASI_BLK_PL_276:
	.word	0x878020f8
	.word	0xe1bda280
	.word	0xfcdc1000
	.word	0xf472a0b8
	.word	0xc0742cb0
	.word	0x1000000
	or	%g0, 0x7fb, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x128, %i7
	DTLB_TAG_READ
	.word	0xfc9a9c40
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x01e, %i7
	LOAD_IDATA_IN
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x460, %i7
	READ_IDATA_ACCESS
	.word	0xc0242f7c
	.word	0xec5c2008
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x98, %i7
	ITLB_TAG_READ
	.word	0xbe80a068
	.word	0xe0dfd000
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x390, %i7
	DTLB_TAG_READ
	.word	0xc0342902
	.word	0xfa5c2120
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	READ_DDATA_ACCESS
thr5_MMU_ASI_SECONDARY_LITTLE_277:
	.word	0x87802089
	.word	0xf4b96af0
	.word	0x1000000
	or	%g0, 0x80, %i7
	ITLB_TAG_READ
	.word	0xe05c20d0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5c29e8
	.word	0xbe164000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v003_exit:
	EXIT_GOOD
Thr5_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v401 TEXT_VA=0x740000e20000
attr_text {
	Name = .Thr5_User_Text_4v401 ,
	VA = 0x740000e20000 ,/* 0x740000e2ffc0 */
	RA = 0x0220fb0000 ,
	PA = 0x5e20fb0000 ,
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
	/* ITTE_TAG_DATA = 0000740000e20000 8000005e20fb0081 */
	end_label   = Thr5_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v401_text_begin
Thr5_User_Text_4v401_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda8200
	.word	0x1000000
	or	%g0, 0x728, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x17, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe85a068
	.word	0xfadfd000
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x146, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x408, %i7
	P_DTLB_TAG_READ
	.word	0xf875e028
	.word	0xc031a5ec
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x066, %i7
	P_LOAD_DDATA_IN
	.word	0xe459a048
	P_ACCESS_ITSB_PTR
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x012, %i7
	P_LOAD_IDATA_IN
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
	P_ACCESS_DTSB_PTR
	.word	0xfcd89000
	P_TOGGLE_LSU_DM
	P_TOGGLE_LSU_DM
	.word	0xc024a7a0
	.word	0xbe80a068
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe114000
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
thr5_MMU_ASI_AS_IF_USER_PRIMARY_278:
	.word	0x87802010
	.word	0xf2f76058
	.word	0xfcdf5040
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v401_exit:
	EXIT_GOOD
Thr5_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v004 TEXT_VA=0x73a0001c8000
attr_text {
	Name = .Thr5_User_Text_4v004 ,
	VA = 0x73a0001c8000 ,/* 0x73a0001c9fc0 */
	RA = 0x037002a000 ,
	PA = 0x037002a000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a0001c99a9 800000037002a080 */
	end_label   = Thr5_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v004_text_begin
Thr5_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xfcdac220
	.word	0xbe85a0b8
	.word	0xf4dfc200
	P_DDEMAP_PCTX
thr5_MMU_ASI_BLK_P_279:
	.word	0x878020f0
	.word	0xe1bc2140
	nop
	nop
	.word	0x1000000
	or	%g0, 0x30, %i7
	P_DTLB_TAG_READ
thr5_MMU_ASI_PRIMARY_LITTLE_280:
	.word	0x87802088
	.word	0xe8f42028
	.word	0x1000000
	or	%g0, 0x05d, %i7
	P_LOAD_DDATA_IN
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_281:
	.word	0x8780202a
	.word	0xccbc21b0
	.word	0xc19c1e00
thr5_MMU_ASI_PRIMARY_282:
	.word	0x87802080
	.word	0xecf42098
	.word	0x1000000
	or	%g0, 0x40, %i7
	P_READ_DDATA_ACCESS
thr5_MMU_ASI_BLK_S_283:
	.word	0x878020f1
	.word	0xc1bae440
	.word	0x1000000
	or	%g0, 0x528, %i7
	P_DTLB_TAG_READ
	.word	0xf45da0f0
thr5_MMU_ASI_PRIMARY_284:
	.word	0x87802080
	.word	0xdef760c0
	P_ACCESS_DTSB_PTR
thr5_MMU_ASI_AS_IF_USER_PRIMARY_285:
	.word	0x87802010
	.word	0xc6f5a080
	.word	0x1000000
	or	%g0, 0x780, %i7
	P_DTLB_TAG_READ
thr5_MMU_ASI_PRIMARY_LITTLE_286:
	.word	0x87802088
	.word	0xdef420d8
	P_DDEMAP_NCTX
	nop
	.word	0x1000000
	or	%g0, 0x029, %i7
	P_LOAD_DDATA_IN
thr5_MMU_ASI_AS_IF_USER_SECONDARY_287:
	.word	0x87802011
	.word	0xf8f16058
thr5_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_288:
	.word	0x87802018
	.word	0xd6f2a070
	.word	0xfcda8200
	.word	0x1000000
	or	%g0, 0x498, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe842100
	.word	0xd4dfd000
	nop
	.word	0x1000000
	or	%g0, 0x016, %i7
	P_LOAD_DDATA_IN
thr5_MMU_ASI_PRIMARY_289:
	.word	0x87802080
	.word	0xe2f5a010
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v004_exit:
	EXIT_GOOD
Thr5_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v102 DATA_VA=0x740000dc0000
attr_data {
	Name = .Thr5_User_Data_4v102 ,
	VA = 0x740000dc0000 ,/* 0x740000dcffc0 */
	RA = 0x0220670000 ,
	PA = 0x0220670000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000dc19a9 8000000220670441 */
	end_label   = Thr5_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v102_data_begin
Thr5_User_Data_4v102_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v202 DATA_VA=0x75001f800000
attr_data {
	Name = .Thr5_User_Data_4v202 ,
	VA = 0x75001f800000 ,/* 0x75001fbfffc0 */
	RA = 0x03f5c00000 ,
	PA = 0x03f5c00000 ,
	TTE_Context = 0x154e ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000075001f80154e 80000003f5c00043 */
	end_label   = Thr5_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v202_data_begin
Thr5_User_Data_4v202_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v302 DATA_VA=0x750023800000
attr_data {
	Name = .Thr5_User_Data_4v302 ,
	VA = 0x750023800000 ,/* 0x750023bfffc0 */
	RA = 0x03f6000000 ,
	PA = 0x03f6000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_2 ,
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
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 0000750023800000 80000003f6000043 */
	end_label   = Thr5_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v302_data_begin
Thr5_User_Data_4v302_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v005 TEXT_VA=0x73a0000a2000
attr_text {
	Name = .Thr5_User_Text_4v005 ,
	VA = 0x73a0000a2000 ,/* 0x73a0000a3fc0 */
	RA = 0x037011a000 ,
	PA = 0x037011a000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a0000a39a9 800000037011a080 */
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
	DDEMAP_PCTX
thr5_MMU_ASI_PRIMARY_290:
	.word	0x87802080
	.word	0xeaf6a080
	.word	0xbe85a0d0
	.word	0xfadfd000
	.word	0xdc7420b0
	.word	0xc03121e6
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc035a9fa
	.word	0xe272a010
	.word	0xc076a888
	.word	0xfe45ac14
	.word	0xf075a0a8
	.word	0xc0342df4
	.word	0x1000000
	or	%g0, 0x460, %i7
	ITLB_TAG_READ
	.word	0xf672a0a8
	.word	0xc036af2c
	.word	0x1000000
	or	%g0, 0x3b0, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe13c000
	DDEMAP_RPAGE
	.word	0xfcdf5000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a098
	.word	0xc8dfd000
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe576fb0
	.word	0xfe42aed8
	.word	0x1000000
	or	%g0, 0x081, %i7
	LOAD_DDATA_IN
	.word	0xbe86a0b8
	.word	0xecdfd000
	TOGGLE_LSU_DM
	.word	0xfcda9000
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe13c000
	DDEMAP_RPAGE
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
	or	%g0, 0x38f, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe86a068
	.word	0xd4dfd000
thr5_MMU_ASI_BLK_P_291:
	.word	0x878020f0
	.word	0xe1baac40
	.word	0xfcdd9000
	.word	0xfa5aa068
	.word	0xfe42aa64
	.word	0xc02ea26d
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9f5000
	.word	0xe05c2130
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe5f6b20
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v005_exit:
	EXIT_GOOD
Thr5_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v402 TEXT_VA=0x740000c90000
attr_text {
	Name = .Thr5_User_Text_4v402 ,
	VA = 0x740000c90000 ,/* 0x740000c9ffc0 */
	RA = 0x02208f0000 ,
	PA = 0x5e208f0000 ,
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
	/* ITTE_TAG_DATA = 0000740000c90000 8000005e208f0081 */
	end_label   = Thr5_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v402_text_begin
Thr5_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xbe812038
	.word	0xe0dfc200
	.word	0x1000000
	or	%g0, 0x02b, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	P_TOGGLE_LSU_IM
	.word	0xfc9e9100
thr5_MMU_ASI_AS_IF_USER_PRIMARY_292:
	.word	0x87802010
	.word	0xeef12078
	.word	0xfcd90200
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x448, %i7
	P_ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfa5de098
	.word	0x1000000
	or	%g0, 0x552, %i7
	P_LOAD_DDATA_ACCESS
	nop
	nop
	nop
	P_DDEMAP_ALL_RPAGES
	P_DDEMAP_ALL
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x061, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_SCTX
	.word	0xc0732710
	P_DDEMAP_NCTX
thr5_MMU_ASI_AS_IF_USER_PRIMARY_293:
	.word	0x87802010
	.word	0xeef2a018
	.word	0xfc9c8580
	nop
	nop
	nop
	nop
	nop
	.word	0xbe842038
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe124000
	P_IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_SECONDARY_294:
	.word	0x87802081
	.word	0xf0b96dc0
	P_IDEMAP_ALL_RPAGES
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xe471a018
	.word	0xc023252c
	.word	0xfe41ad30
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_295:
	.word	0x8780202b
	.word	0xf4b96c90
	.word	0x1000000
	.word	0xbe124000
	P_IDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xcc71a048
	.word	0xc03322b2
	.word	0xfc9d9000
	.word	0x1000000
	or	%g0, 0x79e, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xc4732068
	.word	0xc0232f0c
	nop
	nop
thr5_MMU_ASI_AS_IF_USER_PRIMARY_296:
	.word	0x87802010
	.word	0xd0f420b0
	.word	0x1000000
	or	%g0, 0x03c, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	.word	0xfe44ad84
	.word	0xfcde8200
thr5_MMU_ASI_AS_IF_USER_PRIMARY_297:
	.word	0x87802010
	.word	0xc8f420b8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0732d88
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x049, %i7
	P_LOAD_DDATA_IN
	.word	0xbe85a0b8
	.word	0xe0dfd000
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe128000
	P_IDEMAP_RPAGE
	P_DDEMAP_ALL_PAGES
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x06a, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xde, %i7
	P_LOAD_IDATA_ACCESS
thr5_MMU_ASI_BLK_P_298:
	.word	0x878020f0
	.word	0xc3bc2180
	.word	0xcc59a048
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_299:
	.word	0x87802022
	.word	0xc4bf6240
	.word	0xfcdd0280
	.word	0x1000000
	or	%g0, 0x030, %i7
	P_LOAD_IDATA_IN
	P_ACCESS_DTSB_PTR
	.word	0xbe16c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v402_exit:
	EXIT_GOOD
Thr5_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v006 TEXT_VA=0x73a00014e000
attr_text {
	Name = .Thr5_User_Text_4v006 ,
	VA = 0x73a00014e000 ,/* 0x73a00014ffc0 */
	RA = 0x037002e000 ,
	PA = 0x037002e000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00014f9a9 800000037002e080 */
	end_label   = Thr5_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v006_text_begin
Thr5_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe15c000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x7d8, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x7c0, %i7
	P_READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_IM
	.word	0xc02dac60
	.word	0xfc9e9c40
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x38, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfa5da0b8
	.word	0xfcdd9000
	.word	0xca742010
	.word	0xc032ad6e
thr5_MMU_ASI_AS_IF_USER_PRIMARY_300:
	.word	0x87802010
	.word	0xeef76048
	nop
thr5_MMU_ASI_PRIMARY_301:
	.word	0x87802080
	.word	0xf8b8a8c0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x510, %i7
	P_READ_IDATA_ACCESS
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x195, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_302:
	.word	0x87802023
	.word	0xecbc6a90
	.word	0x1000000
	or	%g0, 0x208, %i7
	P_DTLB_TAG_READ
	P_TOGGLE_LSU_DM
	.word	0xc0242974
	.word	0xbe846010
	.word	0xc19fde20
	P_DDEMAP_PCTX
	.word	0xfe42a29c
	.word	0xbe86a110
	.word	0xfadfd000
	.word	0xfe46a738
	.word	0xcc75a0a0
	.word	0xc035a746
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
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v006_exit:
	EXIT_GOOD
Thr5_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v103 DATA_VA=0x75003b800000
attr_data {
	Name = .Thr5_User_Data_4v103 ,
	VA = 0x75003b800000 ,/* 0x75003bbfffc0 */
	RA = 0x03f6800000 ,
	PA = 0x03f6800000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000075003b8019a9 80000003f6800443 */
	end_label   = Thr5_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v103_data_begin
Thr5_User_Data_4v103_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v303 DATA_VA=0x740000ef0000
attr_data {
	Name = .Thr5_User_Data_4v303 ,
	VA = 0x740000ef0000 ,/* 0x740000efffc0 */
	RA = 0x02204e0000 ,
	PA = 0x5e204e0000 ,
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
	/* DTTE_TAG_DATA = 0000740000ef0000 8000005e204e0041 */
	end_label   = Thr5_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v303_data_begin
Thr5_User_Data_4v303_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v007 TEXT_VA=0x740000090000
attr_text {
	Name = .Thr5_User_Text_4v007 ,
	VA = 0x740000090000 ,/* 0x74000009ffc0 */
	RA = 0x0220fc0000 ,
	PA = 0x0220fc0000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007400000919a9 8000000220fc0081 */
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
	.word	0xc0712458
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcd95120
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0xc075a140
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x4ee, %i7
	LOAD_DDATA_ACCESS
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x113, %i7
	LOAD_IDATA_ACCESS
	.word	0xd85aa0a0
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x037, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x7d0, %i7
	DTLB_TAG_READ
	.word	0xfe5daff0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a038
	.word	0xecdfd040
	.word	0xfcda9000
	.word	0xfe5da3e0
	.word	0xfcda9000
	.word	0xc076a180
	.word	0xc02c25d6
	.word	0xbe170000
	GOTO_SUPERVISOR1
	.word	0xd45aa068
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v007_exit:
	EXIT_GOOD
Thr5_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v403 TEXT_VA=0x7400000e0000
attr_text {
	Name = .Thr5_User_Text_4v403 ,
	VA = 0x7400000e0000 ,/* 0x7400000effc0 */
	RA = 0x0220070000 ,
	PA = 0x5e20070000 ,
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
	/* ITTE_TAG_DATA = 00007400000e0000 8000005e20070081 */
	end_label   = Thr5_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v403_text_begin
Thr5_User_Text_4v403_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_PRIMARY_303:
	.word	0x87802080
	.word	0xcaf2a010
	.word	0xd459a0d0
	.word	0xfe5b23f8
	.word	0xec59a098
	P_IDEMAP_PCTX
	P_DDEMAP_ALL_PAGES
	.word	0xc031af12
	.word	0x1000000
	or	%g0, 0x1d8, %i7
	P_DTLB_TAG_READ
	.word	0xc034a440
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdc1000
thr5_MMU_ASI_AS_IF_USER_PRIMARY_304:
	.word	0x87802010
	.word	0xecf5a068
	.word	0xbe82a0d0
	.word	0xd4dfc200
	.word	0xc19ac2e0
	.word	0xc19d83c0
	.word	0xfe5b2ef0
	.word	0x1000000
	or	%g0, 0x091, %i7
	P_LOAD_DDATA_IN
	P_TOGGLE_LSU_DM
	.word	0xdc71a0b0
	.word	0xc024a47c
	.word	0x1000000
	or	%g0, 0x011, %i7
	P_LOAD_DDATA_IN
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_305:
	.word	0x87802022
	.word	0xf0beafd0
	P_DDEMAP_ALL_RPAGES
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	.word	0xfcdc1000
	.word	0xbe842098
	.word	0xecdfc200
	.word	0xc029a575
	.word	0xbe85a068
	.word	0xe0dfd000
	.word	0xfa71a0f0
	.word	0xc071aaf8
	.word	0xc075e140
	.word	0x1000000
	or	%g0, 0x160, %i7
	P_READ_IDATA_ACCESS
thr5_MMU_ASI_PRIMARY_306:
	.word	0x87802080
	.word	0xccbdad40
thr5_MMU_ASI_AS_IF_USER_PRIMARY_307:
	.word	0x87802010
	.word	0xecf5a068
	.word	0xfcd89000
	P_ACCESS_ITSB_PTR
	P_TOGGLE_LSU_DM
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v403_exit:
	EXIT_GOOD
Thr5_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v104 DATA_VA=0x73a000182000
attr_data {
	Name = .Thr5_User_Data_4v104 ,
	VA = 0x73a000182000 ,/* 0x73a000183fc0 */
	RA = 0x0370162000 ,
	PA = 0x0370162000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073a0001839a9 8000000370162440 */
	end_label   = Thr5_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v104_data_begin
Thr5_User_Data_4v104_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v008 TEXT_VA=0x740000630000
attr_text {
	Name = .Thr5_User_Text_4v008 ,
	VA = 0x740000630000 ,/* 0x74000063ffc0 */
	RA = 0x0220fd0000 ,
	PA = 0x0220fd0000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007400006319a9 8000000220fd0081 */
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
	.word	0xfc9adc60
	nop
	nop
	nop
thr5_MMU_ASI_PRIMARY_308:
	.word	0x87802080
	.word	0xdcf6a028
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xbe812110
	.word	0xc4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x500, %i7
	READ_IDATA_ACCESS
	.word	0xc85aa008
	.word	0x1000000
	or	%g0, 0x370, %i7
	LOAD_DDATA_ACCESS
	ACCESS_DTSB_PTR
thr5_MMU_ASI_PRIMARY_309:
	.word	0x87802080
	.word	0xe0f5a0b8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xf4712100
	.word	0xc0292359
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v008_exit:
	EXIT_GOOD
Thr5_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v404 TEXT_VA=0x750027800000
attr_text {
	Name = .Thr5_User_Text_4v404 ,
	VA = 0x750027800000 ,/* 0x750027bfffc0 */
	RA = 0x03f6c00000 ,
	PA = 0x03f6c00000 ,
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
	/* ITTE_TAG_DATA = 0000750027800000 80000003f6c00083 */
	end_label   = Thr5_User_Text_4v404_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v404_text_begin
Thr5_User_Text_4v404_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x778, %i7
	P_READ_DDATA_ACCESS
	P_IDEMAP_ALL_PAGES
	.word	0xbe86a0d0
	.word	0xc8dfc200
	P_DDEMAP_PCTX
	P_IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x41b, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfcd89000
	.word	0xc0232b78
	.word	0xbe8420e0
	.word	0xf4dfd000
	.word	0x1000000
	.word	0xbe16c000
	P_IDEMAP_RPAGE
	.word	0xfe51a784
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a098
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x015, %i7
	P_LOAD_IDATA_IN
	.word	0xfcdd8200
	.word	0xc071a140
	.word	0x1000000
	or	%g0, 0x210, %i7
	P_DTLB_TAG_READ
	.word	0xbe85a068
	.word	0xd4dfc200
	.word	0xf45b20e0
	.word	0xfcd94280
	P_TOGGLE_LSU_DM
thr5_MMU_ASI_BLK_COMMIT_P_310:
	.word	0x878020e0
	.word	0xe3bda880
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x0ae, %i7
	P_LOAD_DDATA_IN
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a068
	.word	0xd4dfd000
	P_DDEMAP_PCTX
	P_TOGGLE_LSU_DM
	P_ACCESS_ITSB_PTR
	.word	0xc3991f00
	.word	0x1000000
	or	%g0, 0x570, %i7
	P_READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda8200
	nop
	.word	0x1000000
	or	%g0, 0x17f, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe8420e0
	.word	0xecdfd000
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_311:
	.word	0x8780202a
	.word	0xfcbc2430
	.word	0xec5ca038
	P_IDEMAP_ALL_RPAGES
	nop
	.word	0x1000000
	or	%g0, 0x5ac, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	P_ACCESS_DTSB_PTR
	P_IDEMAP_PCTX
thr5_MMU_ASI_PRIMARY_LITTLE_312:
	.word	0x87802088
	.word	0xf6f0a0d8
	.word	0xfcda9000
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v404_exit:
	EXIT_GOOD
Thr5_User_Text_4v404_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v105 DATA_VA=0x750034000000
attr_data {
	Name = .Thr5_User_Data_4v105 ,
	VA = 0x750034000000 ,/* 0x7500343fffc0 */
	RA = 0x03fa400000 ,
	PA = 0x03fa400000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007500340019a9 80000003fa400443 */
	end_label   = Thr5_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v105_data_begin
Thr5_User_Data_4v105_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v009 TEXT_VA=0x73a00000a000
attr_text {
	Name = .Thr5_User_Text_4v009 ,
	VA = 0x73a00000a000 ,/* 0x73a00000bfc0 */
	RA = 0x0370054000 ,
	PA = 0x0370054000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00000b9a9 8000000370054080 */
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
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe154000
	IDEMAP_RPAGE
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x135, %i7
	LOAD_IDATA_ACCESS
	.word	0xc02c2140
	.word	0xda72a0d8
	.word	0xc02ea144
	.word	0xfa5da098
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdad020
	.word	0x1000000
	.word	0xbe150000
	IDEMAP_PAGE
thr5_MMU_ASI_PRIMARY_313:
	.word	0x87802080
	.word	0xeaf0a0a8
	.word	0xfe4c2a8a
	.word	0xbe82a0d0
	.word	0xecdfd000
	.word	0x1000000
	.word	0xbe138000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe55ae96
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x490, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x738, %i7
	READ_DDATA_ACCESS
	.word	0xec776100
	.word	0xc026a570
	.word	0xc032a152
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
	.word	0x1000000
	or	%g0, 0x063, %i7
	LOAD_IDATA_IN
	DDEMAP_ALL_RPAGES
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x7d0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x013, %i7
	LOAD_IDATA_IN
	.word	0xbe842098
	.word	0xfadfd000
	.word	0xfe492fb4
	.word	0xfe42a968
	.word	0xc0342ac4
	.word	0xbe82a068
	.word	0xf4dfd000
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	nop
	nop
	nop
thr5_MMU_ASI_BLK_SL_314:
	.word	0x878020f9
	.word	0xe3baedc0
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xf45ea100
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v009_exit:
	EXIT_GOOD
Thr5_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v106 DATA_VA=0x750001000000
attr_data {
	Name = .Thr5_User_Data_4v106 ,
	VA = 0x750001000000 ,/* 0x7500013fffc0 */
	RA = 0x03f7000000 ,
	PA = 0x03f7000000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007500010019a9 80000003f7000443 */
	end_label   = Thr5_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v106_data_begin
Thr5_User_Data_4v106_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00a TEXT_VA=0x73a00010e000
attr_text {
	Name = .Thr5_User_Text_4v00a ,
	VA = 0x73a00010e000 ,/* 0x73a00010ffc0 */
	RA = 0x03701f4000 ,
	PA = 0x03701f4000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00010f9a9 80000003701f4080 */
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
	TOGGLE_LSU_DM
	.word	0xbe138000
	GOTO_SUPERVISOR1
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x60, %i7
	READ_IDATA_ACCESS
	IDEMAP_PCTX
	nop
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x210, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x130, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x030, %i7
	LOAD_DDATA_IN
	.word	0xbe8420f0
	.word	0xf4dfd000
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc025aac4
	.word	0x1000000
	or	%g0, 0x5f5, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x6b6, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc8776068
	.word	0xc075a140
	.word	0xbe164000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00a_exit:
	EXIT_GOOD
Thr5_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v107 DATA_VA=0x740000b90000
attr_data {
	Name = .Thr5_User_Data_4v107 ,
	VA = 0x740000b90000 ,/* 0x740000b9ffc0 */
	RA = 0x02202a0000 ,
	PA = 0x02202a0000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000b919a9 80000002202a0441 */
	end_label   = Thr5_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v107_data_begin
Thr5_User_Data_4v107_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00b TEXT_VA=0x73a000172000
attr_text {
	Name = .Thr5_User_Text_4v00b ,
	VA = 0x73a000172000 ,/* 0x73a000173fc0 */
	RA = 0x0370164000 ,
	PA = 0x0370164000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a0001739a9 8000000370164080 */
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
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe15c000
	IDEMAP_RPAGE
thr5_MMU_ASI_PRIMARY_315:
	.word	0x87802080
	.word	0xc4f420e0
	.word	0x1000000
	.word	0xbe144000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xec5ea068
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	.word	0xbe86a100
	.word	0xfadfd040
	.word	0xbe86a038
	.word	0xf4dfd000
	.word	0xfcda9000
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
	or	%g0, 0x168, %i7
	READ_DDATA_ACCESS
	.word	0xc45c2008
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_NCTX
	.word	0xf8742088
	.word	0xc036ab0c
	.word	0x1000000
	or	%g0, 0x430, %i7
	READ_IDATA_ACCESS
	.word	0xfa5aa038
thr5_MMU_ASI_PRIMARY_316:
	.word	0x87802080
	.word	0xeaf12118
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x6d8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0xa2, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe154000
	GOTO_SUPERVISOR0
thr5_MMU_ASI_PRIMARY_317:
	.word	0x87802080
	.word	0xf4f12098
	.word	0x1000000
	or	%g0, 0xa9, %i7
	LOAD_IDATA_ACCESS
	.word	0xc0742980
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xd45ea110
	.word	0xe19d9f00
	.word	0xec5ea098
	.word	0xe05aa0d0
	.word	0x1000000
	or	%g0, 0x4b2, %i7
	LOAD_IDATA_ACCESS
	.word	0xca5f6070
	.word	0xbe82a0b8
	.word	0xc4dfd000
	.word	0x1000000
	or	%g0, 0x790, %i7
	DTLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdc1000
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x471, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe07760f0
	.word	0xc075a150
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00b_exit:
	EXIT_GOOD
Thr5_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v108 DATA_VA=0x73a000104000
attr_data {
	Name = .Thr5_User_Data_4v108 ,
	VA = 0x73a000104000 ,/* 0x73a000105fc0 */
	RA = 0x0370000000 ,
	PA = 0x0370000000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073a0001059a9 8000000370000440 */
	end_label   = Thr5_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v108_data_begin
Thr5_User_Data_4v108_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00c TEXT_VA=0x740000690000
attr_text {
	Name = .Thr5_User_Text_4v00c ,
	VA = 0x740000690000 ,/* 0x74000069ffc0 */
	RA = 0x0220280000 ,
	PA = 0x0220280000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007400006919a9 8000000220280081 */
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
	DDEMAP_NCTX
	.word	0xfe50adfc
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	DTLB_TAG_READ
thr5_MMU_ASI_PRIMARY_318:
	.word	0x87802080
	.word	0xdaf12050
thr5_MMU_ASI_PRIMARY_319:
	.word	0x87802080
	.word	0xd6f5a070
	.word	0xe45c20a0
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd4742120
	.word	0xc025aad8
thr5_MMU_ASI_SECONDARY_320:
	.word	0x87802081
	.word	0xfcbae140
	.word	0xfe45a918
	.word	0xec592130
	.word	0xfcdf5000
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x010, %i7
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
	.word	0xbe80a120
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0xd4712038
	.word	0xc022af78
	IDEMAP_NCTX
	DDEMAP_ALL_RPAGES
	TOGGLE_LSU_DM
	.word	0xfcdad120
thr5_MMU_ASI_PRIMARY_321:
	.word	0x87802080
	.word	0xf6f42050
	DDEMAP_SCTX
	.word	0xcc742018
	.word	0xc0742aa0
	.word	0x1000000
	or	%g0, 0x100, %i7
	ITLB_TAG_READ
	.word	0xfcdc1000
	nop
	nop
	nop
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe5920b8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00c_exit:
	EXIT_GOOD
Thr5_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v109 DATA_VA=0x73a0001d2000
attr_data {
	Name = .Thr5_User_Data_4v109 ,
	VA = 0x73a0001d2000 ,/* 0x73a0001d3fc0 */
	RA = 0x0370166000 ,
	PA = 0x0370166000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073a0001d39a9 8000000370166440 */
	end_label   = Thr5_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v109_data_begin
Thr5_User_Data_4v109_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00d TEXT_VA=0x73a00006c000
attr_text {
	Name = .Thr5_User_Text_4v00d ,
	VA = 0x73a00006c000 ,/* 0x73a00006dfc0 */
	RA = 0x03700b4000 ,
	PA = 0x03700b4000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00006d9a9 80000003700b4080 */
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
	.word	0x1000000
	.word	0xbe100000
	IDEMAP_RPAGE
	DDEMAP_ALL_RPAGES
	.word	0xe05ea0f0
	.word	0xbe842110
	.word	0xf4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe148000
	IDEMAP_RPAGE
	DDEMAP_ALL
	.word	0xf0776030
	.word	0xc0712f58
	IDEMAP_NCTX
thr5_MMU_ASI_PRIMARY_322:
	.word	0x87802080
	.word	0xf6f5a090
	.word	0xe05da068
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
	.word	0xfe52a42a
	.word	0xfcdf5000
	.word	0xbe85a0e0
	.word	0xe0dfd000
thr5_MMU_ASI_PRIMARY_LITTLE_323:
	.word	0x87802088
	.word	0xccbeaed0
	.word	0xd4742120
	.word	0xc02c2aba
	.word	0xfa5c20e0
	nop
	nop
	nop
	.word	0xf45aa098
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5da098
	.word	0xd475a068
	.word	0xc0342140
	.word	0xc026ab04
	.word	0x1000000
	or	%g0, 0x012, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_RPAGE
	.word	0xc037633a
	.word	0xc072aaf8
	.word	0x1000000
	or	%g0, 0x4c5, %i7
	LOAD_IDATA_ACCESS
thr5_MMU_ASI_PRIMARY_LITTLE_324:
	.word	0x87802088
	.word	0xccf5a078
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe114000
	IDEMAP_PAGE
	.word	0xc032a5fa
	.word	0x1000000
	or	%g0, 0x5d9, %i7
	LOAD_IDATA_ACCESS
	.word	0xec5c2098
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x180, %i7
	READ_IDATA_ACCESS
	DDEMAP_SCTX
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x158, %i7
	DTLB_TAG_READ
	.word	0xe0742100
	.word	0xc030abd4
	.word	0xcc5c2048
	DO_BRANCH
	.word	0x81c56000
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
	.word	0xc025ac54
	.word	0x1000000
	.word	0xbe144000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x05e, %i7
	LOAD_IDATA_IN
	IDEMAP_ALL_PAGES
	.word	0xfe5761d4
	TOGGLE_LSU_DM
	.word	0xbe82a0d0
	.word	0xecdfd000
	.word	0xfe5aa190
	IDEMAP_NCTX
	.word	0xce776050
	.word	0xc02ea8a3
	IDEMAP_ALL_RPAGES
	.word	0xc076afa0
	.word	0xfcdc1000
	DDEMAP_NCTX
	.word	0xfe4aa8c8
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc076aa50
	.word	0x81c62000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00d_exit:
	EXIT_GOOD
Thr5_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10a DATA_VA=0x750039000000
attr_data {
	Name = .Thr5_User_Data_4v10a ,
	VA = 0x750039000000 ,/* 0x7500393fffc0 */
	RA = 0x03f7c00000 ,
	PA = 0x03f7c00000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007500390019a9 80000003f7c00443 */
	end_label   = Thr5_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10a_data_begin
Thr5_User_Data_4v10a_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00e TEXT_VA=0x73a000018000
attr_text {
	Name = .Thr5_User_Text_4v00e ,
	VA = 0x73a000018000 ,/* 0x73a000019fc0 */
	RA = 0x0370040000 ,
	PA = 0x0370040000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a0000199a9 8000000370040080 */
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
	IDEMAP_NCTX
	nop
	nop
	nop
	.word	0xc0242140
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe174000
	IDEMAP_PAGE
thr5_MMU_ASI_BLK_P_325:
	.word	0x878020f0
	.word	0xc3bda940
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x620, %i7
	DTLB_TAG_READ
	.word	0xc022a2a8
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x7a6, %i7
	LOAD_DDATA_ACCESS
	.word	0xc1989f00
	.word	0xfe5dabc8
	.word	0xee72a018
	.word	0xc0312b16
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x07f, %i7
	LOAD_DDATA_IN
	.word	0xfa742130
	.word	0xc035ab46
	.word	0xc02f6915
	.word	0xec5aa038
	.word	0x1000000
	or	%g0, 0xa6, %i7
	LOAD_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xc4742068
	.word	0xc076add8
	.word	0xfe542338
	.word	0xe675a0a8
	.word	0xc035ad9a
	.word	0x1000000
	or	%g0, 0x178, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x054, %i7
	LOAD_DDATA_IN
	.word	0xc85da038
	DDEMAP_NCTX
	.word	0xc026a1b4
	.word	0xd45aa038
	.word	0x1000000
	or	%g0, 0x007, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc85aa100
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00e_exit:
	EXIT_GOOD
Thr5_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10b DATA_VA=0x7400007e0000
attr_data {
	Name = .Thr5_User_Data_4v10b ,
	VA = 0x7400007e0000 ,/* 0x7400007effc0 */
	RA = 0x0220770000 ,
	PA = 0x0220770000 ,
	TTE_Context = 0x19a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007400007e19a9 8000000220770441 */
	end_label   = Thr5_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10b_data_begin
Thr5_User_Data_4v10b_data_begin:
	.xword	0x740000560000
	.xword	0x73a00004a000
	.xword	0x750014c00000
	.xword	0x750038400000
	.xword	0x7400002d0000
	.xword	0x73a0000b2000
	.xword	0x750016400000
	.xword	0x73a000116000
	.xword	0x740000a30000
	.xword	0x73a00008e000
	.xword	0x750016800000
	.xword	0x740000e20000
	.xword	0x73a0001c8000
	.xword	0x740000dc0000
	.xword	0x75001f800000
	.xword	0x750023800000
	.xword	0x73a0000a2000
	.xword	0x740000c90000
	.xword	0x73a00014e000
	.xword	0x75003b800000
	.xword	0x740000ef0000
	.xword	0x740000090000
	.xword	0x7400000e0000
	.xword	0x73a000182000
	.xword	0x740000630000
	.xword	0x750027800000
	.xword	0x750034000000
	.xword	0x73a00000a000
	.xword	0x750001000000
	.xword	0x73a00010e000
	.xword	0x740000b90000
	.xword	0x73a000172000
	.xword	0x73a000104000
	.xword	0x740000690000
	.xword	0x73a0001d2000
	.xword	0x73a00006c000
	.xword	0x750039000000
	.xword	0x73a000018000
	.xword	0x7400007e0000
	.xword	0x73a00015e000
Thr5_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00f TEXT_VA=0x73a00015e000
attr_text {
	Name = .Thr5_User_Text_4v00f ,
	VA = 0x73a00015e000 ,/* 0x73a00015ffc0 */
	RA = 0x037008a000 ,
	PA = 0x037008a000 ,
	TTE_Context = 0x19a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00015f9a9 800000037008a080 */
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
	IDEMAP_ALL_RPAGES
	.word	0xf276a028
	.word	0xc0242be4
	.word	0x1000000
	or	%g0, 0x01a, %i7
	LOAD_DDATA_IN
	.word	0xc0312cb8
	.word	0xe4592018
	.word	0x1000000
	or	%g0, 0x051, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x04c, %i7
	LOAD_IDATA_IN
	.word	0xc19e9e00
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_IM
	nop
	nop
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xbe85a130
	.word	0xe0dfd040
	.word	0xfcde9000
	.word	0xc0376140
	.word	0xfe5c2ac0
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfa5c2098
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00f_exit:
	EXIT_GOOD
Thr5_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v000 TEXT_VA=0x790001c00000
attr_text {
	Name = .Thr6_User_Text_4v000 ,
	VA = 0x790001c00000 ,/* 0x790001ffffc0 */
	RA = 0x0018000000 ,
	PA = 0x0018000000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 0000790001c00dac 8000000018000483 */
	end_label   = Thr6_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr6_user_code_entry
Thr6_user_code_entry:
	setx	0x77b000074000, %g1, %g2
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
	.word	0xc02569e4
	TOGGLE_LSU_IM
	DDEMAP_PCTX
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	.word	0xe67120e8
	.word	0xc02aa158
	.word	0xfcd91000
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe476750
	.word	0xc02f67d0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_PAGES
	TOGGLE_LSU_DM
	.word	0xfe50aeb0
	.word	0x1000000
	or	%g0, 0x480, %i7
	ITLB_TAG_READ
	.word	0xca58a010
	.word	0xbe120000
	GOTO_SUPERVISOR1
	DDEMAP_ALL
	.word	0x1000000
	.word	0xbe144000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x430, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0xd4756038
	.word	0xc072ad90
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe46a17c
	.word	0xfe4920bc
	.word	0xd45c20d0
	ACCESS_DTSB_PTR
	.word	0xf65aa018
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45aa090
thr6_MMU_ASI_PRIMARY_326:
	.word	0x87802080
	.word	0xd4f560b8
	.word	0xfcd89100
	.word	0x1000000
	or	%g0, 0x280, %i7
	DTLB_TAG_READ
	.word	0xca742098
	.word	0xc02429e8
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf4742090
	.word	0xc02f61cd
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v000_exit:
	EXIT_GOOD
Thr6_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v100 DATA_VA=0x77b000074000
attr_data {
	Name = .Thr6_User_Data_4v100 ,
	VA = 0x77b000074000 ,/* 0x77b000075fc0 */
	RA = 0x03800fe000 ,
	PA = 0x6f800fe000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b00007469f 8000006f800fe040 */
	end_label   = Thr6_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v100_data_begin
Thr6_User_Data_4v100_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v200 DATA_VA=0x77b00013e000
attr_data {
	Name = .Thr6_User_Data_4v200 ,
	VA = 0x77b00013e000 ,/* 0x77b00013ffc0 */
	RA = 0x0380168000 ,
	PA = 0x6f80168000 ,
	TTE_Context = 0x1c29 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000077b00013ff98 8000006f80168040 */
	end_label   = Thr6_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v200_data_begin
Thr6_User_Data_4v200_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v300 DATA_VA=0x77b0000e6000
attr_data {
	Name = .Thr6_User_Data_4v300 ,
	VA = 0x77b0000e6000 ,/* 0x77b0000e7fc0 */
	RA = 0x0380100000 ,
	PA = 0x6f80100000 ,
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
	/* DTTE_TAG_DATA = 000077b0000e6000 8000006f80100040 */
	end_label   = Thr6_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v300_data_begin
Thr6_User_Data_4v300_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v001 TEXT_VA=0x77b0001d4000
attr_text {
	Name = .Thr6_User_Text_4v001 ,
	VA = 0x77b0001d4000 ,/* 0x77b0001d5fc0 */
	RA = 0x0380110000 ,
	PA = 0x6f80110000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077b0001d469f 8000006f80110480 */
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
	.word	0x1000000
	or	%g0, 0x583, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe25c2010
	.word	0x1000000
	or	%g0, 0x118, %i7
	DTLB_TAG_READ
	.word	0xc020ab20
	.word	0xc0742438
	.word	0xfcd89000
	.word	0xc676a000
	.word	0xc0342174
	.word	0x1000000
	or	%g0, 0x590, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_327:
	.word	0x87802080
	.word	0xcef120a8
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe5f6890
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
	ACCESS_DTSB_PTR
	DDEMAP_ALL
	ACCESS_ITSB_PTR
	.word	0xbe86a090
	.word	0xd4dfd000
	.word	0xc0712788
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
thr6_MMU_ASI_PRIMARY_328:
	.word	0x87802080
	.word	0xecf6a098
thr6_MMU_ASI_PRIMARY_LITTLE_329:
	.word	0x87802088
	.word	0xccf12018
	.word	0xea5d6068
	IDEMAP_ALL_RPAGES
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x78, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x528, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe15c000
	IDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5568dc
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v001_exit:
	EXIT_GOOD
Thr6_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v400 TEXT_VA=0x77b000090000
attr_text {
	Name = .Thr6_User_Text_4v400 ,
	VA = 0x77b000090000 ,/* 0x77b000091fc0 */
	RA = 0x03800dc000 ,
	PA = 0x6f800dc000 ,
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
	/* ITTE_TAG_DATA = 000077b000090000 8000006f800dc080 */
	end_label   = Thr6_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v400_text_begin
Thr6_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0xc0, %i7
	P_ITLB_TAG_READ
	P_IDEMAP_ALL
	.word	0xfcdd4200
thr6_MMU_ASI_PRIMARY_330:
	.word	0x87802080
	.word	0xcef56080
	nop
	nop
	nop
	.word	0xbe80a100
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x1c7, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x408, %i7
	P_READ_IDATA_ACCESS
	.word	0xfe532a56
	.word	0x1000000
	or	%g0, 0x05d, %i7
	P_LOAD_IDATA_IN
	P_TOGGLE_LSU_DM
	.word	0xd65b2070
	.word	0xc026ea1c
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x478, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x01e, %i7
	P_LOAD_IDATA_IN
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v400_exit:
	EXIT_GOOD
Thr6_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v002 TEXT_VA=0x790030c00000
attr_text {
	Name = .Thr6_User_Text_4v002 ,
	VA = 0x790030c00000 ,/* 0x790030ffffc0 */
	RA = 0x0018400000 ,
	PA = 0x0018400000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 0000790030c00dac 8000000018400483 */
	end_label   = Thr6_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v002_text_begin
Thr6_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x35, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc022a158
	.word	0x1000000
	or	%g0, 0x4ed, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc4712068
	.word	0xc072abd8
	.word	0xfcdb82a0
thr6_MMU_ASI_AS_IF_USER_PRIMARY_331:
	.word	0x87802010
	.word	0xf8f12000
	P_DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0xfe, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x48, %i7
	P_READ_IDATA_ACCESS
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x09e, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr6_MMU_ASI_PRIMARY_332:
	.word	0x87802080
	.word	0xd8f2a0c0
	.word	0xd476a148
	.word	0xc072ace8
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR0
	nop
Thr6_User_Text_4v002_exit:
	EXIT_GOOD
Thr6_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v101 DATA_VA=0x77b0001ee000
attr_data {
	Name = .Thr6_User_Data_4v101 ,
	VA = 0x77b0001ee000 ,/* 0x77b0001effc0 */
	RA = 0x038017a000 ,
	PA = 0x6f8017a000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b0001ee69f 8000006f8017a040 */
	end_label   = Thr6_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v101_data_begin
Thr6_User_Data_4v101_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v201 DATA_VA=0x77b0001f6000
attr_data {
	Name = .Thr6_User_Data_4v201 ,
	VA = 0x77b0001f6000 ,/* 0x77b0001f7fc0 */
	RA = 0x03800d8000 ,
	PA = 0x6f800d8000 ,
	TTE_Context = 0x1c29 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000077b0001f7f98 8000006f800d8040 */
	end_label   = Thr6_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v201_data_begin
Thr6_User_Data_4v201_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v301 DATA_VA=0x780000d70000
attr_data {
	Name = .Thr6_User_Data_4v301 ,
	VA = 0x780000d70000 ,/* 0x780000d7ffc0 */
	RA = 0x0230ac0000 ,
	PA = 0x0230ac0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_2 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000780000d70000 8000000230ac0041 */
	end_label   = Thr6_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v301_data_begin
Thr6_User_Data_4v301_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v003 TEXT_VA=0x79003c400000
attr_text {
	Name = .Thr6_User_Text_4v003 ,
	VA = 0x79003c400000 ,/* 0x79003c7fffc0 */
	RA = 0x0018800000 ,
	PA = 0x0018800000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000079003c400dac 8000000018800483 */
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
	.word	0x1000000
	or	%g0, 0x079, %i7
	LOAD_DDATA_IN
	.word	0xc02aa66e
	.word	0xfcde9000
	.word	0xc0756f40
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xfe4c2739
	.word	0xfcde9000
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x062, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0xc9, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x044, %i7
	LOAD_DDATA_IN
	.word	0xd45c2068
	.word	0xf65f60a0
	.word	0xfa5aa0d0
	ACCESS_DTSB_PTR
	.word	0xfe4ea4c0
	nop
	nop
	nop
	.word	0xbe86a0d0
	.word	0xd4dfd000
	.word	0xfe5aa400
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
	.word	0xea776068
	.word	0xc0256b4c
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v003_exit:
	EXIT_GOOD
Thr6_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v401 TEXT_VA=0x790004800000
attr_text {
	Name = .Thr6_User_Text_4v401 ,
	VA = 0x790004800000 ,/* 0x790004bfffc0 */
	RA = 0x001b800000 ,
	PA = 0x001b800000 ,
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
	/* ITTE_TAG_DATA = 0000790004800000 800000001b800083 */
	end_label   = Thr6_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v401_text_begin
Thr6_User_Text_4v401_text_begin:
	wrpr	0, %gl
	P_IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x02b, %i7
	P_LOAD_IDATA_IN
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x020, %i7
	P_LOAD_IDATA_IN
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
thr6_MMU_ASI_PRIMARY_333:
	.word	0x87802080
	.word	0xd6f42010
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xc071a558
	.word	0xbe86a128
	.word	0xf4dfd000
thr6_MMU_ASI_PRIMARY_334:
	.word	0x87802080
	.word	0xd6f6a010
thr6_MMU_ASI_PRIMARY_335:
	.word	0x87802080
	.word	0xecf76010
	.word	0x1000000
	or	%g0, 0x538, %i7
	P_ITLB_TAG_READ
	.word	0xbe86a138
	.word	0xd4dfc200
	.word	0xbe82a038
	.word	0xf4dfc200
	.word	0xbe856068
	.word	0xc8dfc200
	.word	0x1000000
	or	%g0, 0x0, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_ALL_RPAGES
	.word	0xfcdc1000
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x448, %i7
	P_ITLB_TAG_READ
	.word	0xbe842068
	.word	0xc8dfd000
	.word	0xec5ca070
thr6_MMU_ASI_AS_IF_USER_SECONDARY_336:
	.word	0x87802011
	.word	0xf6f46018
	P_IDEMAP_ALL_RPAGES
	.word	0xf276e0b0
	.word	0xc075e850
	.word	0xc19e82c0
	.word	0x1000000
	or	%g0, 0x140, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x340, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x170, %i7
	P_DTLB_TAG_READ
	P_IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x650, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x33e, %i7
	P_LOAD_DDATA_ACCESS
	P_TOGGLE_LSU_DM
	P_TOGGLE_LSU_IM
thr6_MMU_ASI_AS_IF_USER_PRIMARY_337:
	.word	0x87802010
	.word	0xeef42048
	.word	0xbe8560d0
	.word	0xfadfc200
	.word	0xea5de148
	.word	0xd471a038
	.word	0xc0332f28
thr6_MMU_ASI_PRIMARY_338:
	.word	0x87802080
	.word	0xecf42010
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v401_exit:
	EXIT_GOOD
Thr6_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v004 TEXT_VA=0x7800002b0000
attr_text {
	Name = .Thr6_User_Text_4v004 ,
	VA = 0x7800002b0000 ,/* 0x7800002bffc0 */
	RA = 0x02305a0000 ,
	PA = 0x6e305a0000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007800002b0dac 8000006e305a0481 */
	end_label   = Thr6_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v004_text_begin
Thr6_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xbe846010
	.word	0xd6dfc220
	.word	0xc02d6158
	.word	0xc19882c0
	nop
	nop
	nop
	.word	0xfcdad020
	P_IDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe86a0e0
	.word	0xd4dfd000
thr6_MMU_ASI_BLK_P_339:
	.word	0x878020f0
	.word	0xc1bc2640
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xec5d6070
	nop
	nop
	nop
	nop
	P_DDEMAP_PCTX
thr6_MMU_ASI_SECONDARY_LITTLE_340:
	.word	0x87802089
	.word	0xecbc6280
thr6_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_341:
	.word	0x87802018
	.word	0xf4f6a118
thr6_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_342:
	.word	0x87802018
	.word	0xe2f6a010
	.word	0x1000000
	or	%g0, 0x1f8, %i7
	P_READ_IDATA_ACCESS
	.word	0xfe56ad46
	.word	0x1000000
	or	%g0, 0xff, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfcd91100
	.word	0xbe816010
	.word	0xc39fc2e0
	.word	0x1000000
	or	%g0, 0x00c, %i7
	P_LOAD_DDATA_IN
	.word	0xfcde8200
	.word	0x1000000
	or	%g0, 0x05b, %i7
	P_LOAD_IDATA_IN
	.word	0xfe4d6b2a
	.word	0xfe542d28
	.word	0x1000000
	or	%g0, 0x038, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	P_DDEMAP_ALL
	P_TOGGLE_LSU_DM
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr6_User_Text_4v004_exit:
	EXIT_GOOD
Thr6_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v102 DATA_VA=0x780000f90000
attr_data {
	Name = .Thr6_User_Data_4v102 ,
	VA = 0x780000f90000 ,/* 0x780000f9ffc0 */
	RA = 0x0230520000 ,
	PA = 0x6e30520000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000f90dac 8000006e30520041 */
	end_label   = Thr6_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v102_data_begin
Thr6_User_Data_4v102_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v202 DATA_VA=0x780000480000
attr_data {
	Name = .Thr6_User_Data_4v202 ,
	VA = 0x780000480000 ,/* 0x78000048ffc0 */
	RA = 0x0230010000 ,
	PA = 0x6e30010000 ,
	TTE_Context = 0x1c29 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000780000481c29 8000006e30010041 */
	end_label   = Thr6_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v202_data_begin
Thr6_User_Data_4v202_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v302 DATA_VA=0x77b0000d8000
attr_data {
	Name = .Thr6_User_Data_4v302 ,
	VA = 0x77b0000d8000 ,/* 0x77b0000d9fc0 */
	RA = 0x03801c0000 ,
	PA = 0x6f801c0000 ,
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
	/* DTTE_TAG_DATA = 000077b0000d8000 8000006f801c0040 */
	end_label   = Thr6_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v302_data_begin
Thr6_User_Data_4v302_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v005 TEXT_VA=0x77b00011e000
attr_text {
	Name = .Thr6_User_Text_4v005 ,
	VA = 0x77b00011e000 ,/* 0x77b00011ffc0 */
	RA = 0x03800c6000 ,
	PA = 0x6f800c6000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077b00011e69f 8000006f800c6480 */
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
	.word	0xfe5d6640
	.word	0xfc9d5000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	nop
	ACCESS_DTSB_PTR
	.word	0xfcda9000
	.word	0xfe5769b8
thr6_MMU_ASI_BLK_COMMIT_S_343:
	.word	0x878020e1
	.word	0xe3bc6a80
	nop
	.word	0xc0242180
thr6_MMU_ASI_BLK_P_344:
	.word	0x878020f0
	.word	0xc3baafc0
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x130, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xdd, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc076a618
	.word	0xfe5aaa80
	IDEMAP_NCTX
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x298, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x238, %i7
	DTLB_TAG_READ
thr6_MMU_ASI_PRIMARY_LITTLE_345:
	.word	0x87802088
	.word	0xcaf2a010
	.word	0xfe4aa928
	.word	0xbe876090
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x04b, %i7
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
	nop
	nop
	nop
	.word	0xc0756738
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x3e0, %i7
	DTLB_TAG_READ
	.word	0xfc9f5100
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02aa86e
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v005_exit:
	EXIT_GOOD
Thr6_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v402 TEXT_VA=0x780000c30000
attr_text {
	Name = .Thr6_User_Text_4v402 ,
	VA = 0x780000c30000 ,/* 0x780000c3ffc0 */
	RA = 0x0230fe0000 ,
	PA = 0x0230fe0000 ,
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
	/* ITTE_TAG_DATA = 0000780000c30000 8000000230fe0081 */
	end_label   = Thr6_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v402_text_begin
Thr6_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xfc9d5c40
	.word	0xcc5ca078
	.word	0xc02de6b3
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_346:
	.word	0x8780202a
	.word	0xf4bea290
	.word	0xc8732090
	.word	0xc074aaf8
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
thr6_MMU_ASI_BLK_COMMIT_P_347:
	.word	0x878020e0
	.word	0xc3bea980
	.word	0xf4732090
	.word	0xc021a93c
	P_ACCESS_ITSB_PTR
thr6_MMU_ASI_REAL_MEM_348:
	.word	0x87802014
	.word	0xcef3e050
	.word	0xfcdf4200
	P_DDEMAP_PCTX
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v402_exit:
	EXIT_GOOD
Thr6_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v103 DATA_VA=0x790005800000
attr_data {
	Name = .Thr6_User_Data_4v103 ,
	VA = 0x790005800000 ,/* 0x790005bfffc0 */
	RA = 0x001c000000 ,
	PA = 0x001c000000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000790005800dac 800000001c000043 */
	end_label   = Thr6_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v103_data_begin
Thr6_User_Data_4v103_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v203 DATA_VA=0x7a00e0000000
attr_data {
	Name = .Thr6_User_Data_4v203 ,
	VA = 0x7a00e0000000 ,/* 0x7a00efffffc0 */
	RA = 0x0090000000 ,
	PA = 0x6c90000000 ,
	TTE_Context = 0x1c29 ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_0 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 00007a00e0001c29 8000006c90000045 */
	end_label   = Thr6_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v203_data_begin
Thr6_User_Data_4v203_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v303 DATA_VA=0x77b000076000
attr_data {
	Name = .Thr6_User_Data_4v303 ,
	VA = 0x77b000076000 ,/* 0x77b000077fc0 */
	RA = 0x03800b6000 ,
	PA = 0x6f800b6000 ,
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
	/* DTTE_TAG_DATA = 000077b000076000 8000006f800b6040 */
	end_label   = Thr6_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v303_data_begin
Thr6_User_Data_4v303_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v006 TEXT_VA=0x77b0000ee000
attr_text {
	Name = .Thr6_User_Text_4v006 ,
	VA = 0x77b0000ee000 ,/* 0x77b0000effc0 */
	RA = 0x0380032000 ,
	PA = 0x6f80032000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077b0000ee69f 8000006f80032480 */
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
thr6_MMU_ASI_PRIMARY_349:
	.word	0x87802080
	.word	0xc6f420c8
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe1995f20
	.word	0xbe86a0b8
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x88, %i7
	READ_IDATA_ACCESS
	.word	0xec742010
	.word	0xc0356a6c
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_BLK_PL_350:
	.word	0x878020f8
	.word	0xe3bf6800
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdf5000
	nop
	nop
	nop
	.word	0xbe86a0e0
	.word	0xeadfd000
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe170000
	IDEMAP_PAGE
	.word	0xfe56a8b6
	.word	0xc02f6777
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
	or	%g0, 0x01b, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x4a9, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe15c000
	DDEMAP_PAGE
	.word	0xfe542130
thr6_MMU_ASI_PRIMARY_LITTLE_351:
	.word	0x87802088
	.word	0xecbc25d0
	DDEMAP_PCTX
	.word	0xfa742068
	.word	0xc02aaa75
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x4a0, %i7
	READ_IDATA_ACCESS
thr6_MMU_ASI_BLK_PL_352:
	.word	0x878020f8
	.word	0xe1b8a680
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	DDEMAP_NCTX
	.word	0xde742080
	.word	0xc036a720
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe144000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x70, %i7
	ITLB_TAG_READ
	.word	0xc45d6140
	.word	0xfe46a808
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe14c000
	DDEMAP_RPAGE
	nop
	nop
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x278, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x065, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x150, %i7
	ITLB_TAG_READ
	.word	0xc1995f20
	.word	0x1000000
	or	%g0, 0x407, %i7
	LOAD_IDATA_ACCESS
	.word	0xc1995e20
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x035, %i7
	LOAD_DDATA_IN
	.word	0xda7560d8
	.word	0xc032a684
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe556fae
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe4742018
	.word	0xc0742a78
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v006_exit:
	EXIT_GOOD
Thr6_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v403 TEXT_VA=0x77b000134000
attr_text {
	Name = .Thr6_User_Text_4v403 ,
	VA = 0x77b000134000 ,/* 0x77b000135fc0 */
	RA = 0x038016a000 ,
	PA = 0x6f8016a000 ,
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
	/* ITTE_TAG_DATA = 000077b000134000 8000006f8016a080 */
	end_label   = Thr6_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v403_text_begin
Thr6_User_Text_4v403_text_begin:
	wrpr	0, %gl
thr6_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_353:
	.word	0x87802018
	.word	0xcaf2a010
thr6_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_354:
	.word	0x87802018
	.word	0xe2f42010
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe05de130
thr6_MMU_ASI_AS_IF_USER_PRIMARY_355:
	.word	0x87802010
	.word	0xe0f42110
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf45b20d0
	.word	0xbe842140
	.word	0xf4dfd000
	.word	0x1000000
	or	%g0, 0x08a, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_ALL
	.word	0x1000000
	.word	0xbe104000
	P_DDEMAP_RPAGE
	.word	0xc85ee038
	.word	0x1000000
	or	%g0, 0x498, %i7
	P_READ_DDATA_ACCESS
	P_IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x100, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe120000
	P_DDEMAP_PAGE
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v403_exit:
	EXIT_GOOD
Thr6_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v104 DATA_VA=0x77b0001b6000
attr_data {
	Name = .Thr6_User_Data_4v104 ,
	VA = 0x77b0001b6000 ,/* 0x77b0001b7fc0 */
	RA = 0x03800da000 ,
	PA = 0x6f800da000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b0001b669f 8000006f800da040 */
	end_label   = Thr6_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v104_data_begin
Thr6_User_Data_4v104_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v304 DATA_VA=0x780000980000
attr_data {
	Name = .Thr6_User_Data_4v304 ,
	VA = 0x780000980000 ,/* 0x78000098ffc0 */
	RA = 0x0230030000 ,
	PA = 0x0230030000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_2 ,
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
	TTE_Size    = 1 ,
	/* DTTE_TAG_DATA = 0000780000980000 8000000230030041 */
	end_label   = Thr6_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v304_data_begin
Thr6_User_Data_4v304_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v007 TEXT_VA=0x780000d20000
attr_text {
	Name = .Thr6_User_Text_4v007 ,
	VA = 0x780000d20000 ,/* 0x780000d2ffc0 */
	RA = 0x0230680000 ,
	PA = 0x6e30680000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000780000d20dac 8000006e30680481 */
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
	.word	0xe87120b0
	.word	0xc022a188
	.word	0xc0212234
	.word	0x1000000
	or	%g0, 0x092, %i7
	LOAD_DDATA_IN
	.word	0xfe40abc4
	.word	0xd87420a0
	.word	0xc070a1f0
	.word	0x1000000
	.word	0xbe144000
	IDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	.word	0xc02f6a98
	.word	0xc0342e68
	.word	0x1000000
	.word	0xbe140000
	DDEMAP_RPAGE
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc02ea158
	IDEMAP_ALL_PAGES
thr6_MMU_ASI_PRIMARY_356:
	.word	0x87802080
	.word	0xc4f2a118
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x5fc, %i7
	LOAD_IDATA_ACCESS
	.word	0xea5aa038
	IDEMAP_NCTX
	nop
	nop
	.word	0x1000000
	or	%g0, 0x258, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x548, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4e0, %i7
	READ_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xfe46ae70
	.word	0xbe856068
	.word	0xeadfd000
	DDEMAP_PCTX
	nop
	TOGGLE_LSU_IM
	ACCESS_ITSB_PTR
	.word	0xfcdd9160
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0756f10
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v007_exit:
	EXIT_GOOD
Thr6_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v105 DATA_VA=0x780000700000
attr_data {
	Name = .Thr6_User_Data_4v105 ,
	VA = 0x780000700000 ,/* 0x78000070ffc0 */
	RA = 0x02309f0000 ,
	PA = 0x6e309f0000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000700dac 8000006e309f0041 */
	end_label   = Thr6_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v105_data_begin
Thr6_User_Data_4v105_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v008 TEXT_VA=0x790004000000
attr_text {
	Name = .Thr6_User_Text_4v008 ,
	VA = 0x790004000000 ,/* 0x7900043fffc0 */
	RA = 0x001e800000 ,
	PA = 0x001e800000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 0000790004000dac 800000001e800483 */
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
	IDEMAP_NCTX
	.word	0x1000000
	.word	0xbe14c000
	IDEMAP_PAGE
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0xfcde9000
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x084, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5eaeb0
	nop
	nop
	nop
	nop
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x418, %i7
	READ_DDATA_ACCESS
	ACCESS_ITSB_PTR
thr6_MMU_ASI_PRIMARY_357:
	.word	0x87802080
	.word	0xe2f6a098
	.word	0x1000000
	or	%g0, 0x18, %i7
	READ_IDATA_ACCESS
	.word	0xfc995020
	nop
	nop
thr6_MMU_ASI_BLK_COMMIT_P_358:
	.word	0x878020e0
	.word	0xe3bc2cc0
	.word	0xd27420a8
	.word	0xc0212d44
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe05ea068
	.word	0xe19d9e20
	.word	0x1000000
	or	%g0, 0x1b8, %i7
	READ_IDATA_ACCESS
	.word	0xfe5c24c0
	nop
	.word	0xfc9a9c40
	.word	0x1000000
	or	%g0, 0x09a, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_IM
	.word	0xfc9c5020
	.word	0xfe46a8b4
	.word	0xc0376db6
	.word	0xfc9e9100
	.word	0x1000000
	.word	0xbe168000
	DDEMAP_PAGE
	IDEMAP_ALL
	nop
	nop
	nop
	.word	0xbe85a010
	.word	0xc39fde20
	.word	0x1000000
	or	%g0, 0x60, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe19c5f20
	.word	0xfe576174
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0xfcde9000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	.word	0xe876a028
	.word	0xc072a1f8
	DDEMAP_NCTX
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	READ_IDATA_ACCESS
	.word	0xc02f6a86
thr6_MMU_ASI_PRIMARY_LITTLE_359:
	.word	0x87802088
	.word	0xdcf2a028
thr6_MMU_ASI_PRIMARY_360:
	.word	0x87802080
	.word	0xcef6a050
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02aaf2c
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v008_exit:
	EXIT_GOOD
Thr6_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v106 DATA_VA=0x77b00008c000
attr_data {
	Name = .Thr6_User_Data_4v106 ,
	VA = 0x77b00008c000 ,/* 0x77b00008dfc0 */
	RA = 0x03800ec000 ,
	PA = 0x6f800ec000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b00008c69f 8000006f800ec040 */
	end_label   = Thr6_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v106_data_begin
Thr6_User_Data_4v106_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v009 TEXT_VA=0x77b0001a6000
attr_text {
	Name = .Thr6_User_Text_4v009 ,
	VA = 0x77b0001a6000 ,/* 0x77b0001a7fc0 */
	RA = 0x0380012000 ,
	PA = 0x6f80012000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077b0001a669f 8000006f80012480 */
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
thr6_MMU_ASI_SECONDARY_361:
	.word	0x87802081
	.word	0xd8bae290
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xd458a120
	.word	0xbe82a068
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xe876a028
	.word	0xc0742d28
	.word	0xc07124b8
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x018, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	.word	0xbe816040
	.word	0xecdfd020
thr6_MMU_ASI_PRIMARY_362:
	.word	0x87802080
	.word	0xcef0a050
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0xc45aa038
	.word	0xbe856118
	.word	0xd4dfd000
	.word	0xbe812090
	.word	0xf4dfd040
	.word	0xfcda9000
	.word	0xbe842150
	.word	0xf4dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa76a0d0
	.word	0xc032ac90
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v009_exit:
	EXIT_GOOD
Thr6_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v107 DATA_VA=0x77b00015c000
attr_data {
	Name = .Thr6_User_Data_4v107 ,
	VA = 0x77b00015c000 ,/* 0x77b00015dfc0 */
	RA = 0x038006c000 ,
	PA = 0x6f8006c000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b00015c69f 8000006f8006c040 */
	end_label   = Thr6_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v107_data_begin
Thr6_User_Data_4v107_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00a TEXT_VA=0x790038800000
attr_text {
	Name = .Thr6_User_Text_4v00a ,
	VA = 0x790038800000 ,/* 0x790038bfffc0 */
	RA = 0x001c400000 ,
	PA = 0x001c400000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 0000790038800dac 800000001c400483 */
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
	.word	0xfcda9000
	nop
	nop
	.word	0xd45d6090
	.word	0x1000000
	or	%g0, 0x3a0, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xfe4560a8
	DDEMAP_ALL_RPAGES
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
	.word	0x1000000
	or	%g0, 0x288, %i7
	DTLB_TAG_READ
	.word	0xbe8760e0
	.word	0xd4dfd000
thr6_MMU_ASI_PRIMARY_363:
	.word	0x87802080
	.word	0xf6f56048
	.word	0xbe86a090
	.word	0xd4dfd000
	DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe138000
	IDEMAP_PAGE
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x506, %i7
	LOAD_IDATA_ACCESS
	.word	0xe05ea0f0
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x028, %i7
	LOAD_IDATA_IN
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_RPAGES
	IDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_PCTX
	.word	0xbe8120f0
	.word	0xf4dfd000
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x05b, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_IM
	.word	0xfe456548
thr6_MMU_ASI_PRIMARY_364:
	.word	0x87802080
	.word	0xf2f56028
	.word	0x1000000
	or	%g0, 0x011, %i7
	LOAD_IDATA_IN
	IDEMAP_NCTX
	.word	0xc0342852
	.word	0xfe56aa54
	DDEMAP_PCTX
	IDEMAP_ALL_PAGES
	.word	0xc02d63d4
	nop
	nop
	.word	0x1000000
	or	%g0, 0x036, %i7
	LOAD_DDATA_IN
	.word	0xbe86a068
	.word	0xf4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdc1000
	.word	0xec756010
	.word	0xc022a1d0
	.word	0x1000000
	or	%g0, 0xe0, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_IM
thr6_MMU_ASI_PRIMARY_365:
	.word	0x87802080
	.word	0xd0f56028
	.word	0x1000000
	or	%g0, 0xdc, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_NCTX
thr6_MMU_ASI_BLK_S_366:
	.word	0x878020f1
	.word	0xe3b96f40
	.word	0xe05ea038
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x450, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_NCTX
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc45ea090
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v00a_exit:
	EXIT_GOOD
Thr6_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v108 DATA_VA=0x780000120000
attr_data {
	Name = .Thr6_User_Data_4v108 ,
	VA = 0x780000120000 ,/* 0x78000012ffc0 */
	RA = 0x0230d30000 ,
	PA = 0x6e30d30000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000120dac 8000006e30d30041 */
	end_label   = Thr6_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v108_data_begin
Thr6_User_Data_4v108_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00b TEXT_VA=0x77b0000d0000
attr_text {
	Name = .Thr6_User_Text_4v00b ,
	VA = 0x77b0000d0000 ,/* 0x77b0000d1fc0 */
	RA = 0x038001c000 ,
	PA = 0x6f8001c000 ,
	TTE_Context = 0x0dac ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077b0000d069f 8000006f8001c480 */
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
	.word	0xfcd89000
	.word	0xbe842100
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
	.word	0x1000000
	or	%g0, 0x453, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc026afa8
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x058, %i7
	LOAD_DDATA_IN
	nop
	nop
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0xf0, %i7
	READ_DDATA_ACCESS
	.word	0xc39e9f00
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0xe3, %i7
	LOAD_IDATA_ACCESS
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc85aa0b8
	.word	0xfcd95020
	.word	0x1000000
	or	%g0, 0x03d, %i7
	LOAD_IDATA_IN
	.word	0xfcdd5000
	nop
	IDEMAP_ALL_RPAGES
thr6_MMU_ASI_BLK_COMMIT_P_367:
	.word	0x878020e0
	.word	0xc3bf6400
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfe46a0ac
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x088, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe100000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x8, %i7
	READ_IDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5c26d0
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v00b_exit:
	EXIT_GOOD
Thr6_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v109 DATA_VA=0x7800001b0000
attr_data {
	Name = .Thr6_User_Data_4v109 ,
	VA = 0x7800001b0000 ,/* 0x7800001bffc0 */
	RA = 0x02303d0000 ,
	PA = 0x6e303d0000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007800001b0dac 8000006e303d0041 */
	end_label   = Thr6_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v109_data_begin
Thr6_User_Data_4v109_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10a DATA_VA=0x79002c000000
attr_data {
	Name = .Thr6_User_Data_4v10a ,
	VA = 0x79002c000000 ,/* 0x79002c3fffc0 */
	RA = 0x001cc00000 ,
	PA = 0x001cc00000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000079002c000dac 800000001cc00043 */
	end_label   = Thr6_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10a_data_begin
Thr6_User_Data_4v10a_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10b DATA_VA=0x77b00011a000
attr_data {
	Name = .Thr6_User_Data_4v10b ,
	VA = 0x77b00011a000 ,/* 0x77b00011bfc0 */
	RA = 0x03800b8000 ,
	PA = 0x6f800b8000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b00011a69f 8000006f800b8040 */
	end_label   = Thr6_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10b_data_begin
Thr6_User_Data_4v10b_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10c DATA_VA=0x77b0001d6000
attr_data {
	Name = .Thr6_User_Data_4v10c ,
	VA = 0x77b0001d6000 ,/* 0x77b0001d7fc0 */
	RA = 0x03801a6000 ,
	PA = 0x6f801a6000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b0001d669f 8000006f801a6040 */
	end_label   = Thr6_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10c_data_begin
Thr6_User_Data_4v10c_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10d DATA_VA=0x77b0000a6000
attr_data {
	Name = .Thr6_User_Data_4v10d ,
	VA = 0x77b0000a6000 ,/* 0x77b0000a7fc0 */
	RA = 0x0380112000 ,
	PA = 0x6f80112000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b0000a669f 8000006f80112040 */
	end_label   = Thr6_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10d_data_begin
Thr6_User_Data_4v10d_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10e DATA_VA=0x7a03f0000000
attr_data {
	Name = .Thr6_User_Data_4v10e ,
	VA = 0x7a03f0000000 ,/* 0x7a03ffffffc0 */
	RA = 0x0280000000 ,
	PA = 0x6e80000000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 00007a03f0000dac 8000006e80000045 */
	end_label   = Thr6_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10e_data_begin
Thr6_User_Data_4v10e_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10f DATA_VA=0x77b000186000
attr_data {
	Name = .Thr6_User_Data_4v10f ,
	VA = 0x77b000186000 ,/* 0x77b000187fc0 */
	RA = 0x038011e000 ,
	PA = 0x6f8011e000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b00018669f 8000006f8011e040 */
	end_label   = Thr6_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10f_data_begin
Thr6_User_Data_4v10f_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v110 DATA_VA=0x780000b30000
attr_data {
	Name = .Thr6_User_Data_4v110 ,
	VA = 0x780000b30000 ,/* 0x780000b3ffc0 */
	RA = 0x0230c40000 ,
	PA = 0x6e30c40000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000b30dac 8000006e30c40041 */
	end_label   = Thr6_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v110_data_begin
Thr6_User_Data_4v110_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v111 DATA_VA=0x77b000140000
attr_data {
	Name = .Thr6_User_Data_4v111 ,
	VA = 0x77b000140000 ,/* 0x77b000141fc0 */
	RA = 0x03800de000 ,
	PA = 0x6f800de000 ,
	TTE_Context = 0x0dac ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b00014069f 8000006f800de040 */
	end_label   = Thr6_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v111_data_begin
Thr6_User_Data_4v111_data_begin:
	.xword	0x790001c00000
	.xword	0x77b000074000
	.xword	0x77b00013e000
	.xword	0x77b0000e6000
	.xword	0x77b0001d4000
	.xword	0x77b000090000
	.xword	0x790030c00000
	.xword	0x77b0001ee000
	.xword	0x77b0001f6000
	.xword	0x780000d70000
	.xword	0x79003c400000
	.xword	0x790004800000
	.xword	0x7800002b0000
	.xword	0x780000f90000
	.xword	0x780000480000
	.xword	0x77b0000d8000
	.xword	0x77b00011e000
	.xword	0x780000c30000
	.xword	0x790005800000
	.xword	0x7a00e0000000
	.xword	0x77b000076000
	.xword	0x77b0000ee000
	.xword	0x77b000134000
	.xword	0x77b0001b6000
	.xword	0x780000980000
	.xword	0x780000d20000
	.xword	0x780000700000
	.xword	0x790004000000
	.xword	0x77b00008c000
	.xword	0x77b0001a6000
	.xword	0x77b00015c000
	.xword	0x790038800000
	.xword	0x780000120000
	.xword	0x77b0000d0000
	.xword	0x7800001b0000
	.xword	0x79002c000000
	.xword	0x77b00011a000
	.xword	0x77b0001d6000
	.xword	0x77b0000a6000
	.xword	0x7a03f0000000
	.xword	0x77b000186000
	.xword	0x780000b30000
	.xword	0x77b000140000
Thr6_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x7bc00001a000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	VA = 0x7bc00001a000 ,/* 0x7bc00001bfc0 */
	RA = 0x03901c6000 ,
	PA = 0x03901c6000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc00001a1ef 80000003901c6480 */
	end_label   = Thr7_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr7_user_code_entry
Thr7_user_code_entry:
	setx	0x7bc00019a000, %g1, %g2
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
	.word	0xc0312170
	.word	0xea592068
	.word	0xfc995c60
	TOGGLE_LSU_IM
	.word	0xbe82e070
	.word	0xecdfd020
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	.word	0xea5e6090
	DDEMAP_ALL
	.word	0xfe42a024
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
thr7_MMU_ASI_PRIMARY_368:
	.word	0x87802080
	.word	0xe0f2a038
	.word	0xbe876038
	.word	0xe0dfd000
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0242750
	.word	0x1000000
	or	%g0, 0x70, %i7
	ITLB_TAG_READ
	ACCESS_DTSB_PTR
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x268, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x248, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x108, %i7
	ITLB_TAG_READ
	.word	0xc0766f10
	.word	0x1000000
	or	%g0, 0x2a0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_PAGE
thr7_MMU_ASI_PRIMARY_369:
	.word	0x87802080
	.word	0xdaf66080
	.word	0x1000000
	or	%g0, 0x355, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x21, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe576564
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v000_exit:
	EXIT_GOOD
Thr7_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v100 DATA_VA=0x7bc00019a000
attr_data {
	Name = .Thr7_User_Data_4v100 ,
	VA = 0x7bc00019a000 ,/* 0x7bc00019bfc0 */
	RA = 0x0390092000 ,
	PA = 0x0390092000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc00019a1ef 8000000390092440 */
	end_label   = Thr7_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v100_data_begin
Thr7_User_Data_4v100_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v200 DATA_VA=0x7c0000dd0000
attr_data {
	Name = .Thr7_User_Data_4v200 ,
	VA = 0x7c0000dd0000 ,/* 0x7c0000ddffc0 */
	RA = 0x0240530000 ,
	PA = 0x7e40530000 ,
	TTE_Context = 0x00ee ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007c0000dd138a 8000007e40530441 */
	end_label   = Thr7_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v200_data_begin
Thr7_User_Data_4v200_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v300 DATA_VA=0x7bc00005c000
attr_data {
	Name = .Thr7_User_Data_4v300 ,
	VA = 0x7bc00005c000 ,/* 0x7bc00005dfc0 */
	RA = 0x03901f6000 ,
	PA = 0x7f901f6000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_2 ,
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
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00007bc00005c000 8000007f901f6040 */
	end_label   = Thr7_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v300_data_begin
Thr7_User_Data_4v300_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v001 TEXT_VA=0x7bc000124000
attr_text {
	Name = .Thr7_User_Text_4v001 ,
	VA = 0x7bc000124000 ,/* 0x7bc000125fc0 */
	RA = 0x0390008000 ,
	PA = 0x0390008000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0001241ef 8000000390008480 */
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
	.word	0x1000000
	or	%g0, 0xc7, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe856150
	.word	0xc19fde00
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x1c2, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_SCTX
	.word	0xcc756018
	.word	0xc02aab45
	.word	0xea592140
	.word	0xcc5aa018
	nop
	nop
	nop
	nop
	IDEMAP_ALL_RPAGES
	DDEMAP_ALL_PAGES
	.word	0xc0742648
	nop
	nop
	nop
	.word	0xfe50a628
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe128000
	IDEMAP_PAGE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5c2620
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v001_exit:
	EXIT_GOOD
Thr7_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v400 TEXT_VA=0x7bc0001f8000
attr_text {
	Name = .Thr7_User_Text_4v400 ,
	VA = 0x7bc0001f8000 ,/* 0x7bc0001f9fc0 */
	RA = 0x0390176000 ,
	PA = 0x7f90176000 ,
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
	/* ITTE_TAG_DATA = 00007bc0001f8000 8000007f90176480 */
	end_label   = Thr7_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v400_text_begin
Thr7_User_Text_4v400_text_begin:
	wrpr	0, %gl
	P_ACCESS_ITSB_PTR
	.word	0xbe812168
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x03d, %i7
	P_LOAD_DDATA_IN
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v400_exit:
	EXIT_GOOD
Thr7_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v002 TEXT_VA=0x7c0000b50000
attr_text {
	Name = .Thr7_User_Text_4v002 ,
	VA = 0x7c0000b50000 ,/* 0x7c0000b5ffc0 */
	RA = 0x02401b0000 ,
	PA = 0x7e401b0000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000b501ef 8000007e401b0481 */
	end_label   = Thr7_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v002_text_begin
Thr7_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0xe05aa038
	.word	0xfcdc1000
thr7_MMU_ASI_AS_IF_USER_SECONDARY_370:
	.word	0x87802011
	.word	0xc4f5a110
	.word	0x1000000
	or	%g0, 0x70, %i7
	P_ITLB_TAG_READ
	.word	0xfe4d67e1
	.word	0xfcd88200
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
	P_DDEMAP_SCTX
thr7_MMU_ASI_AS_IF_USER_PRIMARY_371:
	.word	0x87802010
	.word	0xdef2a0f8
	P_DDEMAP_ALL_PAGES
	.word	0xbe8120b0
	.word	0xf2dfd000
	.word	0x1000000
	or	%g0, 0x548, %i7
	P_ITLB_TAG_READ
thr7_MMU_ASI_PRIMARY_372:
	.word	0x87802080
	.word	0xeaf0a008
thr7_MMU_ASI_AS_IF_USER_SECONDARY_LITTLE_373:
	.word	0x87802019
	.word	0xf2f6a120
	.word	0xc02c27a0
	.word	0xfe5aa440
	.word	0x1000000
	or	%g0, 0x540, %i7
	P_ITLB_TAG_READ
	.word	0xc072ad70
	P_TOGGLE_LSU_IM
thr7_MMU_ASI_SECONDARY_374:
	.word	0x87802081
	.word	0xf8bc66b0
	.word	0xc02d64f7
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdf5000
	.word	0xbe82a120
	.word	0xfadfc200
thr7_MMU_ASI_AS_IF_USER_PRIMARY_375:
	.word	0x87802010
	.word	0xe0f56090
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	P_READ_IDATA_ACCESS
	.word	0xfc9add60
	.word	0xfcde5000
	.word	0xc0356eee
	.word	0xbe82a150
	.word	0xd4dfc200
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_AS_IF_USER_PRIMARY_376:
	.word	0x87802010
	.word	0xe2f76040
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr7_User_Text_4v002_exit:
	EXIT_GOOD
Thr7_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v101 DATA_VA=0x7bc000178000
attr_data {
	Name = .Thr7_User_Data_4v101 ,
	VA = 0x7bc000178000 ,/* 0x7bc000179fc0 */
	RA = 0x0390034000 ,
	PA = 0x0390034000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0001781ef 8000000390034440 */
	end_label   = Thr7_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v101_data_begin
Thr7_User_Data_4v101_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v201 DATA_VA=0x7c0000770000
attr_data {
	Name = .Thr7_User_Data_4v201 ,
	VA = 0x7c0000770000 ,/* 0x7c000077ffc0 */
	RA = 0x0240ef0000 ,
	PA = 0x7e40ef0000 ,
	TTE_Context = 0x00ee ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007c000077138a 8000007e40ef0441 */
	end_label   = Thr7_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v201_data_begin
Thr7_User_Data_4v201_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v301 DATA_VA=0x7bc000070000
attr_data {
	Name = .Thr7_User_Data_4v301 ,
	VA = 0x7bc000070000 ,/* 0x7bc000071fc0 */
	RA = 0x03900e2000 ,
	PA = 0x7f900e2000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_2 ,
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
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00007bc000070000 8000007f900e2040 */
	end_label   = Thr7_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v301_data_begin
Thr7_User_Data_4v301_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v003 TEXT_VA=0x7bc000108000
attr_text {
	Name = .Thr7_User_Text_4v003 ,
	VA = 0x7bc000108000 ,/* 0x7bc000109fc0 */
	RA = 0x03900ee000 ,
	PA = 0x03900ee000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0001081ef 80000003900ee480 */
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
	.word	0xfcda9100
	.word	0x1000000
	.word	0xbe144000
	DDEMAP_PAGE
	.word	0xfe4660f4
	TOGGLE_LSU_DM
thr7_MMU_ASI_PRIMARY_377:
	.word	0x87802080
	.word	0xe0f56130
	.word	0xbe816010
	.word	0xf4dfd060
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0xc0, %i7
	ITLB_TAG_READ
	.word	0xc03669be
	.word	0xfa5f6100
	.word	0x1000000
	or	%g0, 0x40, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x005, %i7
	LOAD_IDATA_IN
	.word	0xfcdad060
	nop
	nop
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5f6af0
	.word	0xca592010
	.word	0xec72a098
	.word	0xc0376552
	.word	0xcc58a018
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	READ_DDATA_ACCESS
	.word	0xde72a0c8
	.word	0xc02aacab
	.word	0xfcdd5000
	.word	0xc022ab1c
	.word	0xfcde5000
	.word	0xfe5aad08
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd4756130
	.word	0xc0342c56
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v003_exit:
	EXIT_GOOD
Thr7_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v401 TEXT_VA=0x7c0000710000
attr_text {
	Name = .Thr7_User_Text_4v401 ,
	VA = 0x7c0000710000 ,/* 0x7c000071ffc0 */
	RA = 0x0240120000 ,
	PA = 0x0240120000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr7_z_ctx_tsb_3 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00007c0000710000 8000000240120481 */
	end_label   = Thr7_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v401_text_begin
Thr7_User_Text_4v401_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcde4200
	.word	0xd85ee0c0
	.word	0xce71a020
	.word	0xc03323c2
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
	or	%g0, 0x1f8, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfe432b8c
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe46e70c
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xea732068
	.word	0xc035ee4a
	.word	0xfcdd5000
	P_ACCESS_DTSB_PTR
	P_DDEMAP_ALL_PAGES
	nop
	P_DDEMAP_NCTX
thr7_MMU_ASI_BLK_P_378:
	.word	0x878020f0
	.word	0xc1bf6f00
	.word	0xbe842008
	.word	0xf2dfc200
	.word	0x1000000
	.word	0xbe174000
	P_IDEMAP_PAGE
	P_DDEMAP_NCTX
	P_ACCESS_ITSB_PTR
	P_ACCESS_ITSB_PTR
	.word	0xde71a050
	.word	0xc036eba4
	nop
	nop
thr7_MMU_ASI_PRIMARY_379:
	.word	0x87802080
	.word	0xe4f56018
thr7_MMU_ASI_REAL_MEM_380:
	.word	0x87802014
	.word	0xcaf0e010
	.word	0xbe8420b0
	.word	0xe0dfd040
	P_DDEMAP_SCTX
	.word	0xd476e008
	.word	0xc026e984
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
thr7_MMU_ASI_BLK_COMMIT_P_381:
	.word	0x878020e0
	.word	0xe3bf6f00
	.word	0xc19d5f00
	.word	0x1000000
	.word	0xbe118000
	P_DDEMAP_RPAGE
	.word	0xe475e0a0
	.word	0xc02b2e4d
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v401_exit:
	EXIT_GOOD
Thr7_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v004 TEXT_VA=0x7bc00017a000
attr_text {
	Name = .Thr7_User_Text_4v004 ,
	VA = 0x7bc00017a000 ,/* 0x7bc00017bfc0 */
	RA = 0x039008c000 ,
	PA = 0x039008c000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc00017a1ef 800000039008c480 */
	end_label   = Thr7_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v004_text_begin
Thr7_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0xf0, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe144000
	P_IDEMAP_RPAGE
	.word	0xfcda9140
	.word	0xfcdf4200
	.word	0xfe576252
	P_TOGGLE_LSU_IM
	.word	0xbe876008
	.word	0xeadfc200
	.word	0xfe56684e
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x46b, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfc991c40
	.word	0x1000000
	or	%g0, 0x498, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xe05f6068
	P_TOGGLE_LSU_IM
thr7_MMU_ASI_PRIMARY_382:
	.word	0x87802080
	.word	0xc6f2a0d8
	.word	0xfcda83a0
	.word	0xbe842160
	.word	0xd4dfc200
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x1f2, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe876068
	.word	0xd4dfc200
	.word	0xfc9b84c0
	P_DDEMAP_ALL
	.word	0xfcdd5040
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xfcdc0200
	.word	0x1000000
	.word	0xbe140000
	P_DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe160000
	P_IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5a7, %i7
	P_LOAD_IDATA_ACCESS
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe178000
	P_IDEMAP_RPAGE
	.word	0xfcd88200
	.word	0xfcde4200
thr7_MMU_ASI_REAL_IO_383:
	.word	0x87802015
	.word	0xcef4e128
	nop
	nop
thr7_MMU_ASI_AS_IF_USER_PRIMARY_384:
	.word	0x87802010
	.word	0xe4f2a018
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr7_User_Text_4v004_exit:
	EXIT_GOOD
Thr7_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v102 DATA_VA=0x7bc000044000
attr_data {
	Name = .Thr7_User_Data_4v102 ,
	VA = 0x7bc000044000 ,/* 0x7bc000045fc0 */
	RA = 0x03901d2000 ,
	PA = 0x03901d2000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0000441ef 80000003901d2440 */
	end_label   = Thr7_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v102_data_begin
Thr7_User_Data_4v102_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v202 DATA_VA=0x7bc00005a000
attr_data {
	Name = .Thr7_User_Data_4v202 ,
	VA = 0x7bc00005a000 ,/* 0x7bc00005bfc0 */
	RA = 0x039011c000 ,
	PA = 0x039011c000 ,
	TTE_Context = 0x00ee ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007bc00005b38a 800000039011c440 */
	end_label   = Thr7_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v202_data_begin
Thr7_User_Data_4v202_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v302 DATA_VA=0x7bc000026000
attr_data {
	Name = .Thr7_User_Data_4v302 ,
	VA = 0x7bc000026000 ,/* 0x7bc000027fc0 */
	RA = 0x03900e4000 ,
	PA = 0x7f900e4000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_2 ,
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
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00007bc000026000 8000007f900e4040 */
	end_label   = Thr7_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v302_data_begin
Thr7_User_Data_4v302_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v005 TEXT_VA=0x7c0000fa0000
attr_text {
	Name = .Thr7_User_Text_4v005 ,
	VA = 0x7c0000fa0000 ,/* 0x7c0000faffc0 */
	RA = 0x0240ec0000 ,
	PA = 0x7e40ec0000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000fa01ef 8000007e40ec0481 */
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
thr7_MMU_ASI_PRIMARY_385:
	.word	0x87802080
	.word	0xd0f76058
	.word	0xee756018
	.word	0xc027691c
	.word	0xfe4f68d1
	.word	0xec72a0b8
	.word	0xc032a29e
	.word	0xc0376a38
	.word	0x1000000
	or	%g0, 0x790, %i7
	READ_DDATA_ACCESS
	.word	0xc85aa160
	.word	0x1000000
	or	%g0, 0x0, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcda9000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe114000
	IDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe168000
	DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe124000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x0aa, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_BLK_P_386:
	.word	0x878020f0
	.word	0xe3bc2340
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x478, %i7
	ITLB_TAG_READ
	.word	0xc02428d8
	.word	0x1000000
	or	%g0, 0x518, %i7
	DTLB_TAG_READ
	.word	0xfc995120
	.word	0xfe4c2a18
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xea7120d0
	.word	0xc0276dd0
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v005_exit:
	EXIT_GOOD
Thr7_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v402 TEXT_VA=0x7bc000126000
attr_text {
	Name = .Thr7_User_Text_4v402 ,
	VA = 0x7bc000126000 ,/* 0x7bc000127fc0 */
	RA = 0x0390178000 ,
	PA = 0x7f90178000 ,
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
	/* ITTE_TAG_DATA = 00007bc000126000 8000007f90178480 */
	end_label   = Thr7_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v402_text_begin
Thr7_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xfcd95160
	.word	0xbe8760d0
	.word	0xeadfc200
	.word	0xfc9b0580
	.word	0xfcd94220
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v402_exit:
	EXIT_GOOD
Thr7_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v103 DATA_VA=0x7bc0000c6000
attr_data {
	Name = .Thr7_User_Data_4v103 ,
	VA = 0x7bc0000c6000 ,/* 0x7bc0000c7fc0 */
	RA = 0x03901ba000 ,
	PA = 0x03901ba000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0000c61ef 80000003901ba440 */
	end_label   = Thr7_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v103_data_begin
Thr7_User_Data_4v103_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v203 DATA_VA=0x7bc0000f6000
attr_data {
	Name = .Thr7_User_Data_4v203 ,
	VA = 0x7bc0000f6000 ,/* 0x7bc0000f7fc0 */
	RA = 0x0390194000 ,
	PA = 0x0390194000 ,
	TTE_Context = 0x00ee ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007bc0000f738a 8000000390194440 */
	end_label   = Thr7_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v203_data_begin
Thr7_User_Data_4v203_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v303 DATA_VA=0x7bc0001aa000
attr_data {
	Name = .Thr7_User_Data_4v303 ,
	VA = 0x7bc0001aa000 ,/* 0x7bc0001abfc0 */
	RA = 0x039001e000 ,
	PA = 0x7f9001e000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_2 ,
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
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00007bc0001aa000 8000007f9001e040 */
	end_label   = Thr7_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v303_data_begin
Thr7_User_Data_4v303_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v006 TEXT_VA=0x7bc000000000
attr_text {
	Name = .Thr7_User_Text_4v006 ,
	VA = 0x7bc000000000 ,/* 0x7bc000001fc0 */
	RA = 0x03901fa000 ,
	PA = 0x03901fa000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0000001ef 80000003901fa480 */
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
	TOGGLE_LSU_IM
	.word	0xfe48aaf3
thr7_MMU_ASI_PRIMARY_387:
	.word	0x87802080
	.word	0xeef56078
	.word	0x1000000
	or	%g0, 0x03d, %i7
	LOAD_IDATA_IN
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
	DDEMAP_PAGE
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_RPAGE
	.word	0xea5e6120
	.word	0x1000000
	or	%g0, 0x3a2, %i7
	LOAD_DDATA_ACCESS
	.word	0xfc9e9c60
	.word	0xbe856068
	.word	0xf2dfd000
	nop
	nop
thr7_MMU_ASI_PRIMARY_388:
	.word	0x87802080
	.word	0xd6f560b8
	DDEMAP_ALL_RPAGES
	.word	0xbe150000
	GOTO_SUPERVISOR1
	IDEMAP_ALL
	.word	0xfe5f6e00
	.word	0xf8766060
	.word	0xc0742418
	TOGGLE_LSU_DM
	.word	0xc07669e8
	.word	0xf65e6078
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf07660d8
	.word	0xc02aaadf
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v006_exit:
	EXIT_GOOD
Thr7_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v104 DATA_VA=0x7c0000340000
attr_data {
	Name = .Thr7_User_Data_4v104 ,
	VA = 0x7c0000340000 ,/* 0x7c000034ffc0 */
	RA = 0x0240dc0000 ,
	PA = 0x7e40dc0000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00003401ef 8000007e40dc0441 */
	end_label   = Thr7_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v104_data_begin
Thr7_User_Data_4v104_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v204 DATA_VA=0x7bc000014000
attr_data {
	Name = .Thr7_User_Data_4v204 ,
	VA = 0x7bc000014000 ,/* 0x7bc000015fc0 */
	RA = 0x039006e000 ,
	PA = 0x039006e000 ,
	TTE_Context = 0x00ee ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007bc00001538a 800000039006e440 */
	end_label   = Thr7_User_Data_4v204_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v204_data_begin
Thr7_User_Data_4v204_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v204_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v304 DATA_VA=0x7c0000510000
attr_data {
	Name = .Thr7_User_Data_4v304 ,
	VA = 0x7c0000510000 ,/* 0x7c000051ffc0 */
	RA = 0x02401f0000 ,
	PA = 0x02401f0000 ,
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
	/* DTTE_TAG_DATA = 00007c0000510000 80000002401f0041 */
	end_label   = Thr7_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v304_data_begin
Thr7_User_Data_4v304_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v007 TEXT_VA=0x7c0000170000
attr_text {
	Name = .Thr7_User_Text_4v007 ,
	VA = 0x7c0000170000 ,/* 0x7c000017ffc0 */
	RA = 0x0240c80000 ,
	PA = 0x7e40c80000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c00001701ef 8000007e40c80481 */
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
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	IDEMAP_NCTX
	.word	0xee5f6048
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xea5d6068
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe168000
	DDEMAP_RPAGE
	DDEMAP_NCTX
	.word	0xc0256170
	.word	0x1000000
	or	%g0, 0x19e, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x430, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xec72a010
	.word	0xc0256c74
thr7_MMU_ASI_SECONDARY_389:
	.word	0x87802081
	.word	0xd4f460b0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfcd89000
	.word	0xd45f60e0
	.word	0x1000000
	or	%g0, 0x2e8, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	TOGGLE_LSU_IM
thr7_MMU_ASI_PRIMARY_390:
	.word	0x87802080
	.word	0xdcf2a028
	.word	0xf45aa098
	.word	0xc030a950
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc1989f00
	.word	0xbe8560f0
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x0, %i7
	ITLB_TAG_READ
thr7_MMU_ASI_PRIMARY_391:
	.word	0x87802080
	.word	0xeaf2a038
	.word	0xd872a018
	.word	0xc035698c
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xcc5aa078
	.word	0x1000000
	or	%g0, 0x146, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcdc5060
	.word	0xda72a030
	.word	0xc0312448
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL
	.word	0xfa5920d0
	nop
	nop
	nop
	.word	0xf65d60c0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5e6248
	TOGGLE_LSU_DM
	.word	0xbe856120
	.word	0xd4dfd000
	.word	0xea5e6130
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xf272a0d0
	.word	0xc0356d7c
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v007_exit:
	EXIT_GOOD
Thr7_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v105 DATA_VA=0x7bc00004e000
attr_data {
	Name = .Thr7_User_Data_4v105 ,
	VA = 0x7bc00004e000 ,/* 0x7bc00004ffc0 */
	RA = 0x039016c000 ,
	PA = 0x039016c000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc00004e1ef 800000039016c440 */
	end_label   = Thr7_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v105_data_begin
Thr7_User_Data_4v105_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v008 TEXT_VA=0x7bc0000e8000
attr_text {
	Name = .Thr7_User_Text_4v008 ,
	VA = 0x7bc0000e8000 ,/* 0x7bc0000e9fc0 */
	RA = 0x039017e000 ,
	PA = 0x039017e000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0000e81ef 800000039017e480 */
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
	DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9e5100
	DDEMAP_PCTX
	IDEMAP_PCTX
	ACCESS_ITSB_PTR
	.word	0xfe542ea6
	.word	0xf458a010
	.word	0x1000000
	.word	0xbe128000
	DDEMAP_PAGE
	.word	0xfcdc1000
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x0af, %i7
	LOAD_DDATA_IN
thr7_MMU_ASI_BLK_COMMIT_S_392:
	.word	0x878020e1
	.word	0xe1b96140
	.word	0x1000000
	.word	0xbe150000
	DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe160000
	DDEMAP_PAGE
	.word	0xfcda9000
	IDEMAP_ALL_RPAGES
	.word	0xce742148
	.word	0xc02e6f7d
thr7_MMU_ASI_BLK_PL_393:
	.word	0x878020f8
	.word	0xc1bf67c0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe19c1f00
	.word	0xbe842168
	.word	0xd4dfd000
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0xf0, %i7
	ITLB_TAG_READ
	ACCESS_ITSB_PTR
	.word	0xfe5f64c8
	.word	0xbe856140
	.word	0xc4dfd000
	nop
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02f683c
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v008_exit:
	EXIT_GOOD
Thr7_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v106 DATA_VA=0x7bc000050000
attr_data {
	Name = .Thr7_User_Data_4v106 ,
	VA = 0x7bc000050000 ,/* 0x7bc000051fc0 */
	RA = 0x0390002000 ,
	PA = 0x0390002000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0000501ef 8000000390002440 */
	end_label   = Thr7_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v106_data_begin
Thr7_User_Data_4v106_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v009 TEXT_VA=0x7c0000550000
attr_text {
	Name = .Thr7_User_Text_4v009 ,
	VA = 0x7c0000550000 ,/* 0x7c000055ffc0 */
	RA = 0x0240ed0000 ,
	PA = 0x7e40ed0000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c00005501ef 8000007e40ed0481 */
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
	.word	0xe6756050
	.word	0xc032a75c
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	DTLB_TAG_READ
	.word	0xfa5c20b0
thr7_MMU_ASI_BLK_S_394:
	.word	0x878020f1
	.word	0xc3bc6880
	nop
	nop
	.word	0xc032ab04
	DDEMAP_SCTX
	.word	0xbe8420b0
	.word	0xf2dfd000
	.word	0x1000000
	.word	0xbe118000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	.word	0xbe876068
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0xb0, %i7
	LOAD_DDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0xfe512e98
	.word	0xd6756040
	.word	0xc021269c
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_RPAGES
	.word	0xfa5d6038
	IDEMAP_PCTX
	.word	0x1000000
	.word	0xbe114000
	DDEMAP_PAGE
	TOGGLE_LSU_DM
	.word	0xe05c2100
	.word	0xc85f6038
	.word	0xbe876100
	.word	0xd4dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x1ff, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x04e, %i7
	LOAD_DDATA_IN
	.word	0xf272a110
	.word	0xc032aa72
thr7_MMU_ASI_PRIMARY_395:
	.word	0x87802080
	.word	0xdaf42030
	.word	0x1000000
	or	%g0, 0x052, %i7
	LOAD_DDATA_IN
	.word	0xc0742170
	.word	0x1000000
	.word	0xbe178000
	DDEMAP_RPAGE
	TOGGLE_LSU_DM
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x580, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_DM
	DDEMAP_ALL_RPAGES
	nop
	.word	0xfcda9000
	TOGGLE_LSU_DM
	.word	0xbe8420d0
	.word	0xfadfd000
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xca5f6070
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v009_exit:
	EXIT_GOOD
Thr7_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v107 DATA_VA=0x7bc000158000
attr_data {
	Name = .Thr7_User_Data_4v107 ,
	VA = 0x7bc000158000 ,/* 0x7bc000159fc0 */
	RA = 0x039018c000 ,
	PA = 0x039018c000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0001581ef 800000039018c440 */
	end_label   = Thr7_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v107_data_begin
Thr7_User_Data_4v107_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00a TEXT_VA=0x7bc000184000
attr_text {
	Name = .Thr7_User_Text_4v00a ,
	VA = 0x7bc000184000 ,/* 0x7bc000185fc0 */
	RA = 0x0390044000 ,
	PA = 0x0390044000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0001841ef 8000000390044480 */
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
	TOGGLE_LSU_IM
	.word	0xc0276dcc
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0xe8, %i7
	ITLB_TAG_READ
	.word	0xbe86a040
	.word	0xd6dfd020
	.word	0xc872a110
	.word	0xc0376e54
	.word	0xd45c2068
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xbe866140
	.word	0xe0dfd000
	.word	0xbe82a0e0
	.word	0xfadfd000
	.word	0xc072ace0
	nop
	nop
	nop
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe842068
	.word	0xd4dfd000
	.word	0xfcd91000
	.word	0x1000000
	or	%g0, 0x428, %i7
	DTLB_TAG_READ
	.word	0xf45c2010
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe4742018
	.word	0xc07429a8
	DDEMAP_ALL
	.word	0xfe52a49a
	.word	0xfe5aacb0
	.word	0xbe842038
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
	.word	0xf0742158
	.word	0xc02e6731
	nop
	nop
	nop
thr7_MMU_ASI_PRIMARY_396:
	.word	0x87802080
	.word	0xf2f760e0
	.word	0x1000000
	or	%g0, 0x2, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x3d8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe154000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x5d8, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x5d1, %i7
	LOAD_IDATA_ACCESS
thr7_MMU_ASI_PRIMARY_397:
	.word	0x87802080
	.word	0xecf42040
	.word	0xce766060
	.word	0xc02c22d9
	.word	0x1000000
	or	%g0, 0x2e0, %i7
	DTLB_TAG_READ
	.word	0xea766120
	.word	0xc022a1c8
	.word	0xc0366498
	.word	0x1000000
	or	%g0, 0x7a0, %i7
	DTLB_TAG_READ
	IDEMAP_ALL
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02d6f31
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00a_exit:
	EXIT_GOOD
Thr7_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v108 DATA_VA=0x7c0000490000
attr_data {
	Name = .Thr7_User_Data_4v108 ,
	VA = 0x7c0000490000 ,/* 0x7c000049ffc0 */
	RA = 0x0240430000 ,
	PA = 0x7e40430000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00004901ef 8000007e40430441 */
	end_label   = Thr7_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v108_data_begin
Thr7_User_Data_4v108_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00b TEXT_VA=0x7bc00007c000
attr_text {
	Name = .Thr7_User_Text_4v00b ,
	VA = 0x7bc00007c000 ,/* 0x7bc00007dfc0 */
	RA = 0x0390180000 ,
	PA = 0x0390180000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc00007c1ef 8000000390180480 */
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
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x580, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4c2bbe
	.word	0xc026640c
	.word	0xfcdc1000
	.word	0xde7420a8
	.word	0xc022a17c
	.word	0xfe442e3c
	TOGGLE_LSU_DM
	.word	0xfe566b04
	.word	0x1000000
	or	%g0, 0x70, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	ITLB_TAG_READ
	.word	0xd45aa110
	.word	0xcc766018
	.word	0xc0756760
	.word	0x1000000
	or	%g0, 0x780, %i7
	DTLB_TAG_READ
	.word	0xcc5aa018
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_RPAGES
	DDEMAP_ALL
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr7_MMU_ASI_PRIMARY_398:
	.word	0x87802080
	.word	0xeef42078
	.word	0xfe556774
	.word	0xbe876068
	.word	0xfadfd000
	.word	0xd872a018
	.word	0xc0276d38
	.word	0xea5aa090
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	DDEMAP_NCTX
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
	.word	0x1000000
	or	%g0, 0x092, %i7
	LOAD_DDATA_IN
	.word	0xfcde5000
	.word	0xc8592140
	.word	0x1000000
	or	%g0, 0x8b, %i7
	LOAD_IDATA_ACCESS
thr7_MMU_ASI_BLK_COMMIT_P_399:
	.word	0x878020e0
	.word	0xe1bc2f80
	.word	0xfe5763fe
	.word	0xfcdc1000
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
thr7_MMU_ASI_PRIMARY_LITTLE_400:
	.word	0x87802088
	.word	0xecbc2430
	.word	0x1000000
	or	%g0, 0x01d, %i7
	LOAD_IDATA_IN
	.word	0xea5c20d0
	.word	0xea5aa090
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf65c2048
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00b_exit:
	EXIT_GOOD
Thr7_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v109 DATA_VA=0x7c0000610000
attr_data {
	Name = .Thr7_User_Data_4v109 ,
	VA = 0x7c0000610000 ,/* 0x7c000061ffc0 */
	RA = 0x0240d40000 ,
	PA = 0x7e40d40000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00006101ef 8000007e40d40441 */
	end_label   = Thr7_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v109_data_begin
Thr7_User_Data_4v109_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00c TEXT_VA=0x7bc0001fc000
attr_text {
	Name = .Thr7_User_Text_4v00c ,
	VA = 0x7bc0001fc000 ,/* 0x7bc0001fdfc0 */
	RA = 0x0390102000 ,
	PA = 0x0390102000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0001fc1ef 8000000390102480 */
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
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	READ_DDATA_ACCESS
	.word	0xc072a9a8
	.word	0xfe566ee4
	.word	0xc02125d0
	.word	0x1000000
	.word	0xbe16c000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x588, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_PAGE
	.word	0xfe4aaae1
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0766cc0
thr7_MMU_ASI_PRIMARY_LITTLE_401:
	.word	0x87802088
	.word	0xdcf76028
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	.word	0xfe5d6500
	.word	0x1000000
	.word	0xbe100000
	IDEMAP_PAGE
	.word	0xd0756028
	.word	0xc02567c4
	.word	0xc0366e08
thr7_MMU_ASI_PRIMARY_402:
	.word	0x87802080
	.word	0xe6f2a050
	.word	0x1000000
	.word	0xbe160000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x054, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x510, %i7
	DTLB_TAG_READ
	.word	0xfe576240
	.word	0xfcdf5140
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x88, %i7
	READ_DDATA_ACCESS
thr7_MMU_ASI_PRIMARY_403:
	.word	0x87802080
	.word	0xdef560f8
	.word	0xc85d60b0
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4c2403
	.word	0x1000000
	or	%g0, 0x043, %i7
	LOAD_IDATA_IN
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x458, %i7
	READ_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe866038
	.word	0xfadfd000
	.word	0xf25c20f0
	IDEMAP_ALL_RPAGES
	.word	0xbe856008
	.word	0xeadfd000
thr7_MMU_ASI_PRIMARY_404:
	.word	0x87802080
	.word	0xe2f76010
	.word	0xe3989f00
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	IDEMAP_NCTX
	.word	0xc0356f0e
	.word	0xf45e6010
	DDEMAP_ALL
	.word	0xc02e65c3
	.word	0xc0742e48
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	DTLB_TAG_READ
	.word	0xda7560d8
	.word	0xc032a384
	.word	0x1000000
	or	%g0, 0xe0, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe812038
	.word	0xd4dfd000
thr7_MMU_ASI_PRIMARY_405:
	.word	0x87802080
	.word	0xf0f420a8
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	ITLB_TAG_READ
	.word	0xfcdf5040
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02c2ade
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00c_exit:
	EXIT_GOOD
Thr7_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10a DATA_VA=0x7c00001f0000
attr_data {
	Name = .Thr7_User_Data_4v10a ,
	VA = 0x7c00001f0000 ,/* 0x7c00001fffc0 */
	RA = 0x0240c10000 ,
	PA = 0x7e40c10000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00001f01ef 8000007e40c10441 */
	end_label   = Thr7_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10a_data_begin
Thr7_User_Data_4v10a_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00d TEXT_VA=0x7c0000c60000
attr_text {
	Name = .Thr7_User_Text_4v00d ,
	VA = 0x7c0000c60000 ,/* 0x7c0000c6ffc0 */
	RA = 0x0240810000 ,
	PA = 0x7e40810000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000c601ef 8000007e40810481 */
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
	.word	0xfa5c20e0
	.word	0x1000000
	or	%g0, 0x240, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0xc026621c
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x012, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x030, %i7
	LOAD_IDATA_IN
	ACCESS_ITSB_PTR
	.word	0xea766090
	.word	0xc0366c1e
	.word	0xbe120000
	GOTO_SUPERVISOR1
	DDEMAP_SCTX
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_PAGE
	.word	0xc02c2315
	.word	0x1000000
	or	%g0, 0x4e8, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xb8, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x110, %i7
	ITLB_TAG_READ
	.word	0xbe866150
	.word	0xc39fde00
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x94, %i7
	LOAD_IDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x410, %i7
	ITLB_TAG_READ
	.word	0xc85aa110
thr7_MMU_ASI_BLK_P_406:
	.word	0x878020f0
	.word	0xc3bc2fc0
	.word	0xfa72a0f0
	.word	0xc0266280
	nop
	.word	0x1000000
	or	%g0, 0x03e, %i7
	LOAD_DDATA_IN
thr7_MMU_ASI_PRIMARY_LITTLE_407:
	.word	0x87802088
	.word	0xecbc2b50
	.word	0x1000000
	or	%g0, 0x594, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0xc07424a8
	TOGGLE_LSU_IM
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe14c000
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
	.word	0xbe82a0b0
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x140, %i7
	READ_DDATA_ACCESS
	.word	0xc45c20d0
	.word	0x1000000
	or	%g0, 0x48, %i7
	LOAD_DDATA_ACCESS
	.word	0xfc9c1100
	.word	0xe45f6048
	DDEMAP_PCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x05f, %i7
	LOAD_DDATA_IN
	ACCESS_DTSB_PTR
	.word	0xd65e6010
	.word	0xbe85a010
	.word	0xd6dfd060
	nop
	nop
	nop
	.word	0xc0742fb0
	.word	0xfe566716
	.word	0xd45f60f0
	IDEMAP_NCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa5aa068
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00d_exit:
	EXIT_GOOD
Thr7_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10b DATA_VA=0x7c0000880000
attr_data {
	Name = .Thr7_User_Data_4v10b ,
	VA = 0x7c0000880000 ,/* 0x7c000088ffc0 */
	RA = 0x0240f90000 ,
	PA = 0x7e40f90000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00008801ef 8000007e40f90441 */
	end_label   = Thr7_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10b_data_begin
Thr7_User_Data_4v10b_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00e TEXT_VA=0x7c0000ce0000
attr_text {
	Name = .Thr7_User_Text_4v00e ,
	VA = 0x7c0000ce0000 ,/* 0x7c0000ceffc0 */
	RA = 0x0240a80000 ,
	PA = 0x7e40a80000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000ce01ef 8000007e40a80481 */
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
	.word	0x1000000
	.word	0xbe138000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x034, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
thr7_MMU_ASI_PRIMARY_408:
	.word	0x87802080
	.word	0xf8f66080
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x588, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe128000
	IDEMAP_PAGE
	.word	0xfe5c2770
	.word	0xfcde5000
	.word	0xfcdc5160
	.word	0xfcde5000
	.word	0xfc9c5c60
thr7_MMU_ASI_PRIMARY_409:
	.word	0x87802080
	.word	0xd4f560e0
thr7_MMU_ASI_PRIMARY_410:
	.word	0x87802080
	.word	0xe2f56010
	.word	0xc0742170
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x008, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x5d8, %i7
	ITLB_TAG_READ
	DDEMAP_ALL_RPAGES
	.word	0xfcdad160
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x7a, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4a0, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x5b8, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	nop
	nop
	.word	0x1000000
	or	%g0, 0x583, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe5f6b78
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v00e_exit:
	EXIT_GOOD
Thr7_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10c DATA_VA=0x7bc0001d8000
attr_data {
	Name = .Thr7_User_Data_4v10c ,
	VA = 0x7bc0001d8000 ,/* 0x7bc0001d9fc0 */
	RA = 0x0390182000 ,
	PA = 0x0390182000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0001d81ef 8000000390182440 */
	end_label   = Thr7_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10c_data_begin
Thr7_User_Data_4v10c_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00f TEXT_VA=0x7bc000040000
attr_text {
	Name = .Thr7_User_Text_4v00f ,
	VA = 0x7bc000040000 ,/* 0x7bc000041fc0 */
	RA = 0x03901a2000 ,
	PA = 0x03901a2000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0000401ef 80000003901a2480 */
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
	.word	0xfcdf5000
	DDEMAP_ALL_RPAGES
thr7_MMU_ASI_PRIMARY_411:
	.word	0x87802080
	.word	0xfaf2a120
	.word	0xcc72a018
	.word	0xc022a750
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5c2200
	.word	0xfe5d65d0
thr7_MMU_ASI_PRIMARY_412:
	.word	0x87802080
	.word	0xecf0a040
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0356f06
	DDEMAP_ALL
	.word	0xf25f6068
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x470, %i7
	READ_IDATA_ACCESS
	.word	0xd45f60b0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe466380
	.word	0xe05d6038
	.word	0x1000000
	.word	0xbe154000
	DDEMAP_RPAGE
	.word	0xbe82a008
	.word	0xeadfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xda72a050
	.word	0xc0712170
	ACCESS_ITSB_PTR
	.word	0xe2712040
	.word	0xc032a170
	.word	0x1000000
	.word	0xbe11c000
	IDEMAP_PAGE
	.word	0xc0242294
	.word	0xd47660b0
	.word	0xc022ac00
	.word	0xbe856090
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0xc0, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xd45c2038
	.word	0x1000000
	or	%g0, 0x054, %i7
	LOAD_IDATA_IN
	.word	0xfcdd5000
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_PAGE
	.word	0xcc5920a0
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	IDEMAP_ALL_PAGES
	.word	0xfcde5000
	TOGGLE_LSU_IM
	.word	0xf25d6100
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa5e6068
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v00f_exit:
	EXIT_GOOD
Thr7_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10d DATA_VA=0x7bc000048000
attr_data {
	Name = .Thr7_User_Data_4v10d ,
	VA = 0x7bc000048000 ,/* 0x7bc000049fc0 */
	RA = 0x0390114000 ,
	PA = 0x0390114000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0000481ef 8000000390114440 */
	end_label   = Thr7_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10d_data_begin
Thr7_User_Data_4v10d_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v010 TEXT_VA=0x7bc000082000
attr_text {
	Name = .Thr7_User_Text_4v010 ,
	VA = 0x7bc000082000 ,/* 0x7bc000083fc0 */
	RA = 0x0390198000 ,
	PA = 0x0390198000 ,
	TTE_Context = 0x039c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0000821ef 8000000390198480 */
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
	.word	0xd872a0a0
	.word	0xc0266b50
	ACCESS_ITSB_PTR
	IDEMAP_ALL
	.word	0xc0742888
	nop
	nop
	nop
	nop
	nop
	.word	0xc0276324
	TOGGLE_LSU_DM
	.word	0xc022a4c8
thr7_MMU_ASI_PRIMARY_413:
	.word	0x87802080
	.word	0xdef2a020
	.word	0xe25f60b8
	.word	0xfe52a054
	.word	0x1000000
	or	%g0, 0x13f, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x720, %i7
	DTLB_TAG_READ
thr7_MMU_ASI_PRIMARY_414:
	.word	0x87802080
	.word	0xfcbd62e0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_BLK_P_415:
	.word	0x878020f0
	.word	0xc3bf6e80
	.word	0x1000000
	or	%g0, 0x307, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x538, %i7
	READ_IDATA_ACCESS
	.word	0xe05c2150
	DDEMAP_ALL_RPAGES
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc02f6e9d
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
	nop
thr7_MMU_ASI_SECONDARY_LITTLE_416:
	.word	0x87802089
	.word	0xd4b96410
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4560d8
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfcdd5000
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	.word	0xd272a060
	.word	0xc022a8b8
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd45f60f0
	.word	0xea70a0e0
	.word	0xc025619c
	.word	0x1000000
	.word	0xbe150000
	DDEMAP_RPAGE
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe866100
	.word	0xe0dfd000
	ACCESS_ITSB_PTR
	.word	0xfe5660de
thr7_MMU_ASI_BLK_COMMIT_S_417:
	.word	0x878020e1
	.word	0xc1b96700
	.word	0xbe138000
	GOTO_SUPERVISOR1
	IDEMAP_PCTX
	.word	0xe05e6130
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
	.word	0xfcdc1000
	.word	0xca5d6010
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	.word	0xc03661d2
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x208, %i7
	READ_DDATA_ACCESS
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0xd8, %i7
	READ_IDATA_ACCESS
	.word	0xfe5561ea
	.word	0xfcd91000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf272a0b0
	.word	0xc02f676e
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0342f1e
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v010_exit:
	EXIT_GOOD
Thr7_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10e DATA_VA=0x7bc000128000
attr_data {
	Name = .Thr7_User_Data_4v10e ,
	VA = 0x7bc000128000 ,/* 0x7bc000129fc0 */
	RA = 0x03900e6000 ,
	PA = 0x03900e6000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0001281ef 80000003900e6440 */
	end_label   = Thr7_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10e_data_begin
Thr7_User_Data_4v10e_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10f DATA_VA=0x7bc0000c8000
attr_data {
	Name = .Thr7_User_Data_4v10f ,
	VA = 0x7bc0000c8000 ,/* 0x7bc0000c9fc0 */
	RA = 0x0390128000 ,
	PA = 0x0390128000 ,
	TTE_Context = 0x039c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0000c81ef 8000000390128440 */
	end_label   = Thr7_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10f_data_begin
Thr7_User_Data_4v10f_data_begin:
	.xword	0x7bc00001a000
	.xword	0x7bc00019a000
	.xword	0x7c0000dd0000
	.xword	0x7bc00005c000
	.xword	0x7bc000124000
	.xword	0x7bc0001f8000
	.xword	0x7c0000b50000
	.xword	0x7bc000178000
	.xword	0x7c0000770000
	.xword	0x7bc000070000
	.xword	0x7bc000108000
	.xword	0x7c0000710000
	.xword	0x7bc00017a000
	.xword	0x7bc000044000
	.xword	0x7bc00005a000
	.xword	0x7bc000026000
	.xword	0x7c0000fa0000
	.xword	0x7bc000126000
	.xword	0x7bc0000c6000
	.xword	0x7bc0000f6000
	.xword	0x7bc0001aa000
	.xword	0x7bc000000000
	.xword	0x7c0000340000
	.xword	0x7bc000014000
	.xword	0x7c0000510000
	.xword	0x7c0000170000
	.xword	0x7bc00004e000
	.xword	0x7bc0000e8000
	.xword	0x7bc000050000
	.xword	0x7c0000550000
	.xword	0x7bc000158000
	.xword	0x7bc000184000
	.xword	0x7c0000490000
	.xword	0x7bc00007c000
	.xword	0x7c0000610000
	.xword	0x7bc0001fc000
	.xword	0x7c00001f0000
	.xword	0x7c0000c60000
	.xword	0x7c0000880000
	.xword	0x7c0000ce0000
	.xword	0x7bc0001d8000
	.xword	0x7bc000040000
	.xword	0x7bc000048000
	.xword	0x7bc000082000
	.xword	0x7bc000128000
	.xword	0x7bc0000c8000
Thr7_User_Data_4v10f_data_end:

