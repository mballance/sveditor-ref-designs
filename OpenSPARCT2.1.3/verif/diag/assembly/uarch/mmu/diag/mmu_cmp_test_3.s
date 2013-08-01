/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_cmp_test_3.s
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
#define THR0_PCONTEXT_0 0x0380
#define THR0_PCONTEXT_1 0x1fb0
#define THR0_SCONTEXT_0 0x1324
#define THR0_SCONTEXT_1 0x0f4c
#define THR1_PCONTEXT_0 0x0326
#define THR1_PCONTEXT_1 0x05ce
#define THR1_SCONTEXT_0 0x1d03
#define THR1_SCONTEXT_1 0x06ad
#define THR2_PCONTEXT_0 0x1a67
#define THR2_PCONTEXT_1 0x1c0d
#define THR2_SCONTEXT_0 0x13ea
#define THR2_SCONTEXT_1 0x13e0
#define THR3_PCONTEXT_0 0x08aa
#define THR3_PCONTEXT_1 0x147f
#define THR3_SCONTEXT_0 0x0e5a
#define THR3_SCONTEXT_1 0x08de
#define THR4_PCONTEXT_0 0x1ac1
#define THR4_PCONTEXT_1 0x0c1e
#define THR4_SCONTEXT_0 0x0c3c
#define THR4_SCONTEXT_1 0x0a24
#define THR5_PCONTEXT_0 0x1133
#define THR5_PCONTEXT_1 0x1b57
#define THR5_SCONTEXT_0 0x0358
#define THR5_SCONTEXT_1 0x0fde
#define THR6_PCONTEXT_0 0x033d
#define THR6_PCONTEXT_1 0x0c1b
#define THR6_SCONTEXT_0 0x0ef5
#define THR6_SCONTEXT_1 0x1b46
#define THR7_PCONTEXT_0 0x0931
#define THR7_PCONTEXT_1 0x1c11
#define THR7_SCONTEXT_0 0x0df9
#define THR7_SCONTEXT_1 0x0e71
#define THR0_PTRAP_TEXT_VA 0x600000080000
#define THR0_PTRAP_TEXT_RA 0x03e06f0000
#define THR0_PTRAP_TEXT_PA 0x0fe06f0000
#define THR1_PTRAP_TEXT_VA 0x640000d70000
#define THR1_PTRAP_TEXT_RA 0x03f05b0000
#define THR1_PTRAP_TEXT_PA 0x03f05b0000
#define THR2_PTRAP_TEXT_VA 0x680000120000
#define THR2_PTRAP_TEXT_RA 0x0010020000
#define THR2_PTRAP_TEXT_PA 0x0010020000
#define THR3_PTRAP_TEXT_VA 0x6c0000dc0000
#define THR3_PTRAP_TEXT_RA 0x0020b00000
#define THR3_PTRAP_TEXT_PA 0x3420b00000
#define THR4_PTRAP_TEXT_VA 0x700000070000
#define THR4_PTRAP_TEXT_RA 0x0030ff0000
#define THR4_PTRAP_TEXT_PA 0x4430ff0000
#define THR5_PTRAP_TEXT_VA 0x740000260000
#define THR5_PTRAP_TEXT_RA 0x0040550000
#define THR5_PTRAP_TEXT_PA 0x5840550000
#define THR6_PTRAP_TEXT_VA 0x780000960000
#define THR6_PTRAP_TEXT_RA 0x0050310000
#define THR6_PTRAP_TEXT_PA 0x0050310000
#define THR7_PTRAP_TEXT_VA 0x7c00007b0000
#define THR7_PTRAP_TEXT_RA 0x0060270000
#define THR7_PTRAP_TEXT_PA 0x0060270000
#include "mmu_hred.s"
/*********************************************************************/
SECTION .Thr0_Priv_Sect TEXT_VA=0x5ff0000b4000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_1
	VA = 0x5ff0000b4000 ,
	RA = 0x03601f6000 ,
	PA = 0x0f601f6000 ,
	TTE_Context = 0x0380 ,
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
SECTION .Thr1_Priv_Sect TEXT_VA=0x6310000fc000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_1
	VA = 0x6310000fc000 ,
	RA = 0x03700e4000 ,
	PA = 0x03700e4000 ,
	TTE_Context = 0x0326 ,
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
SECTION .Thr2_Priv_Sect TEXT_VA=0x67200011e000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_3
	VA = 0x67200011e000 ,
	RA = 0x03800f6000 ,
	PA = 0x03800f6000 ,
	TTE_Context = 0x1a67 ,
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
SECTION .Thr3_Priv_Sect TEXT_VA=0x6b30001e2000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_0
	VA = 0x6b30001e2000 ,
	RA = 0x03900d8000 ,
	PA = 0x03900d8000 ,
	TTE_Context = 0x08aa ,
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
SECTION .Thr4_Priv_Sect TEXT_VA=0x6f40000ba000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_2
	VA = 0x6f40000ba000 ,
	RA = 0x03a0166000 ,
	PA = 0x03a0166000 ,
	TTE_Context = 0x1ac1 ,
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
SECTION .Thr5_Priv_Sect TEXT_VA=0x735000168000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_3
	VA = 0x735000168000 ,
	RA = 0x03b00fa000 ,
	PA = 0x03b00fa000 ,
	TTE_Context = 0x1133 ,
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
SECTION .Thr6_Priv_Sect TEXT_VA=0x7760000a0000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_1
	VA = 0x7760000a0000 ,
	RA = 0x03c009a000 ,
	PA = 0x6fc009a000 ,
	TTE_Context = 0x033d ,
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
SECTION .Thr7_Priv_Sect TEXT_VA=0x7b7000190000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x7b7000190000 ,
	RA = 0x03d0068000 ,
	PA = 0x03d0068000 ,
	TTE_Context = 0x0931 ,
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
	TTE_P       =           0 ,
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
	TTE_P       =           1 ,
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
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
Thr1_register_initial_values:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
Thr2_register_initial_values:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
Thr3_register_initial_values:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
Thr4_register_initial_values:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
Thr5_register_initial_values:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
Thr6_register_initial_values:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
Thr7_register_initial_values:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
.align 32
hptrap_itte_begin:
	.xword	0x0000620640000380	!0
	.xword	0x8000000070000085	
	.xword	0x00005ff000131fb0	!1
	.xword	0x8000000f60092080	
	.xword	0x00005ff00010a000	!2
	.xword	0x8000000360004480	
	.xword	0x00005ff000153fb0	!3
	.xword	0x8000000f60130080	
	.xword	0x0000600000780380	!4
	.xword	0x8000000fe03a0081	
	.xword	0x00005ff000094000	!5
	.xword	0x80000003601e4480	
	.xword	0x0000610005c00380	!6
	.xword	0x8000000e50800083	
	.xword	0x000061001a400380	!7
	.xword	0x8000000e5a000083	
	.xword	0x000061002a400380	!8
	.xword	0x8000000e5d800083	
	.xword	0x00005ff00019dfb0	!9
	.xword	0x8000000f600cc080	
	.xword	0x0000610007000380	!10
	.xword	0x8000000e52c00083	
	.xword	0x0000610025c00380	!11
	.xword	0x8000000e59000083	
	.xword	0x00005ff000047fb0	!12
	.xword	0x8000000f601f8080	
	.xword	0x00005ff000013fb0	!13
	.xword	0x8000000f60076080	
	.xword	0x00005ff000135fb0	!14
	.xword	0x8000000f600f0080	
	.xword	0x00005ff000087fb0	!15
	.xword	0x8000000f601ac080	
	.xword	0x00005ff000001fb0	!16
	.xword	0x8000000f600d2080	
	.xword	0x000061001e000380	!17
	.xword	0x8000000e51000083	
	.xword	0x00006000009d0380	!18
	.xword	0x8000000fe0230081	
	.xword	0x00005ff0000b3fb0	!19
	.xword	0x8000000f6010e080	
	.xword	0x0000600000050380	!20
	.xword	0x8000000fe0890081	
	.xword	0x00006310001f2326	!21
	.xword	0x8000000370138080	
	.xword	0x0000640000990326	!22
	.xword	0x8000001ff0f60081	
	.xword	0x0000631000016000	!23
	.xword	0x800000037017e480	
	.xword	0x0000640000200326	!24
	.xword	0x8000001ff0d90081	
	.xword	0x00006500100005ce	!25
	.xword	0x8000001e66800083	
	.xword	0x000065000d800000	!26
	.xword	0x8000001e68400483	
	.xword	0x0000640000a60326	!27
	.xword	0x8000001ff0d30081	
	.xword	0x0000640000400326	!28
	.xword	0x8000001ff0280081	
	.xword	0x0000640000bf0000	!29
	.xword	0x80000003f0f80481	
	.xword	0x00006500314005ce	!30
	.xword	0x8000001e6a400083	
	.xword	0x0000640000500326	!31
	.xword	0x8000001ff0bd0081	
	.xword	0x0000640000c90326	!32
	.xword	0x8000001ff07e0081	
	.xword	0x0000660650000326	!33
	.xword	0x8000001ee0000085	
	.xword	0x000063100014c326	!34
	.xword	0x8000000370142080	
	.xword	0x0000640000eb0326	!35
	.xword	0x8000001ff0a50081	
	.xword	0x0000631000140326	!36
	.xword	0x8000000370000080	
	.xword	0x00006400003b0326	!37
	.xword	0x8000001ff0e50081	
	.xword	0x000065003a4005ce	!38
	.xword	0x8000001e6f800083	
	.xword	0x000063100015c326	!39
	.xword	0x800000037012e080	
	.xword	0x00006a0aa0001a67	!40
	.xword	0x8000002c90000485	
	.xword	0x0000680000101a67	!41
	.xword	0x8000000010610481	
	.xword	0x00006720000b6000	!42
	.xword	0x80000003800ce080	
	.xword	0x00006a0b20001a67	!43
	.xword	0x8000002d00000485	
	.xword	0x0000680000111a67	!44
	.xword	0x8000000010a70481	
	.xword	0x0000672000082000	!45
	.xword	0x80000003800b4080	
	.xword	0x0000680000d81a67	!46
	.xword	0x8000000010d50481	
	.xword	0x000067200011da67	!47
	.xword	0x8000000380144480	
	.xword	0x0000672000142000	!48
	.xword	0x8000000380164080	
	.xword	0x000067200018ba67	!49
	.xword	0x80000003801ec480	
	.xword	0x00006a0140000000	!50
	.xword	0x8000002d10000085	
	.xword	0x00006720000eba67	!51
	.xword	0x800000038003e480	
	.xword	0x00006720000dfa67	!52
	.xword	0x80000003801d6480	
	.xword	0x000067200017da67	!53
	.xword	0x80000003800f8480	
	.xword	0x000067200004da67	!54
	.xword	0x8000000380044480	
	.xword	0x000069001c401a67	!55
	.xword	0x8000002e70000483	
	.xword	0x0000680000e21a67	!56
	.xword	0x80000000107d0481	
	.xword	0x00006720000c7a67	!57
	.xword	0x80000003801c2480	
	.xword	0x000069000e001a67	!58
	.xword	0x8000002e79400483	
	.xword	0x00006c00000e08aa	!59
	.xword	0x80000034205f0481	
	.xword	0x00006c0000a308aa	!60
	.xword	0x8000003420f70481	
	.xword	0x00006d002f000000	!61
	.xword	0x8000000287400083	
	.xword	0x00006c00009708aa	!62
	.xword	0x80000034203b0481	
	.xword	0x00006b300000a8aa	!63
	.xword	0x8000000390020480	
	.xword	0x00006c0000b50000	!64
	.xword	0x8000003420000081	
	.xword	0x00006c0000ca08aa	!65
	.xword	0x8000003420800481	
	.xword	0x00006c0000dd08aa	!66
	.xword	0x8000003420cf0481	
	.xword	0x00006d0027c00000	!67
	.xword	0x800000028a800083	
	.xword	0x00006b30000fa8aa	!68
	.xword	0x80000003901ca480	
	.xword	0x00006c0000fd08aa	!69
	.xword	0x8000003420d40481	
	.xword	0x00006c0000bb0000	!70
	.xword	0x80000034209e0081	
	.xword	0x00006d001bc008aa	!71
	.xword	0x8000000280400483	
	.xword	0x00006c00002508aa	!72
	.xword	0x8000003420470481	
	.xword	0x00006d003f0008aa	!73
	.xword	0x8000000286000483	
	.xword	0x00006b30000bc8aa	!74
	.xword	0x8000000390002480	
	.xword	0x00006b30001028aa	!75
	.xword	0x8000000390188480	
	.xword	0x00006b300015a8aa	!76
	.xword	0x80000003900f2480	
	.xword	0x00006b30001d88aa	!77
	.xword	0x80000003901e8480	
	.xword	0x00006b300004e8aa	!78
	.xword	0x80000003901b8480	
	.xword	0x00006b300002c8aa	!79
	.xword	0x8000000390062480	
	.xword	0x00006b30001fa8aa	!80
	.xword	0x800000039004e480	
	.xword	0x00006b30001608aa	!81
	.xword	0x8000000390104480	
	.xword	0x000071003b401ac1	!82
	.xword	0x8000004e9b000083	
	.xword	0x00006f400008ac1e	!83
	.xword	0x80000003a014a080	
	.xword	0x000071000dc00000	!84
	.xword	0x8000004e98000083	
	.xword	0x00007000003d1ac1	!85
	.xword	0x8000004430720081	
	.xword	0x00006f400006cc1e	!86
	.xword	0x80000003a0098080	
	.xword	0x000071001d800000	!87
	.xword	0x8000004e9b800083	
	.xword	0x00006f40000aec1e	!88
	.xword	0x80000003a016c080	
	.xword	0x0000700000141ac1	!89
	.xword	0x80000044304a0081	
	.xword	0x0000710026000000	!90
	.xword	0x8000004e93800083	
	.xword	0x00006f4000126c1e	!91
	.xword	0x80000003a006a080	
	.xword	0x00006f4000166c1e	!92
	.xword	0x80000003a018a080	
	.xword	0x00006f40001dac1e	!93
	.xword	0x80000003a01ea080	
	.xword	0x0000710028c01ac1	!94
	.xword	0x8000004e9ec00083	
	.xword	0x00006f4000162c1e	!95
	.xword	0x80000003a01f2080	
	.xword	0x00006f40001f0c1e	!96
	.xword	0x80000003a013a080	
	.xword	0x0000710031801ac1	!97
	.xword	0x8000004e98800083	
	.xword	0x00006f4000164c1e	!98
	.xword	0x80000003a016e080	
	.xword	0x0000720190001ac1	!99
	.xword	0x8000004d90000085	
	.xword	0x00006f400014ec1e	!100
	.xword	0x80000003a0084080	
	.xword	0x0000760370001133	!101
	.xword	0x80000000c0000085	
	.xword	0x0000740000b31133	!102
	.xword	0x80000000404b0081	
	.xword	0x0000740000ac0000	!103
	.xword	0x8000005840820081	
	.xword	0x0000740000de1133	!104
	.xword	0x8000000040060081	
	.xword	0x00007400004d1133	!105
	.xword	0x8000000040a90081	
	.xword	0x00007400003e0000	!106
	.xword	0x8000005840830081	
	.xword	0x00007350001f7133	!107
	.xword	0x80000003b00e6080	
	.xword	0x000073500013d133	!108
	.xword	0x80000003b00b0080	
	.xword	0x000073500018e000	!109
	.xword	0x8000005fb0050080	
	.xword	0x0000760300001133	!110
	.xword	0x8000000230000085	
	.xword	0x0000740000771133	!111
	.xword	0x8000000040370081	
	.xword	0x000075001c000000	!112
	.xword	0x80000002a1c00083	
	.xword	0x0000750009c01133	!113
	.xword	0x80000002ac000083	
	.xword	0x0000735000076000	!114
	.xword	0x8000005fb0058080	
	.xword	0x0000740000321133	!115
	.xword	0x8000000040af0081	
	.xword	0x0000740000d41133	!116
	.xword	0x8000000040390081	
	.xword	0x00007350000d7133	!117
	.xword	0x80000003b01f4080	
	.xword	0x00007350001dd133	!118
	.xword	0x80000003b0078080	
	.xword	0x0000735000065133	!119
	.xword	0x80000003b01ba080	
	.xword	0x00007607c0001133	!120
	.xword	0x8000000140000085	
	.xword	0x000075000ac01133	!121
	.xword	0x80000002af000083	
	.xword	0x000077600005cc1b	!122
	.xword	0x8000006fc00da480	
	.xword	0x0000780000a7033d	!123
	.xword	0x8000006850730481	
	.xword	0x000077600013e000	!124
	.xword	0x8000006fc0074080	
	.xword	0x000079002cc0033d	!125
	.xword	0x80000002b4c00483	
	.xword	0x0000776000100c1b	!126
	.xword	0x8000006fc00bc480	
	.xword	0x0000780000680000	!127
	.xword	0x8000000050d00081	
	.xword	0x000079001dc0033d	!128
	.xword	0x80000002b4000483	
	.xword	0x000079002280033d	!129
	.xword	0x80000002b2800483	
	.xword	0x0000780000550000	!130
	.xword	0x8000000050740081	
	.xword	0x000078000049033d	!131
	.xword	0x8000006850410481	
	.xword	0x0000790011800000	!132
	.xword	0x80000002b3c00083	
	.xword	0x00007800007a033d	!133
	.xword	0x8000006850100481	
	.xword	0x00007760000ccc1b	!134
	.xword	0x8000006fc0052480	
	.xword	0x00007760001dec1b	!135
	.xword	0x8000006fc0008480	
	.xword	0x00007760001b6c1b	!136
	.xword	0x8000006fc0176480	
	.xword	0x000079001980033d	!137
	.xword	0x80000002b4800483	
	.xword	0x00007b70001e5c11	!138
	.xword	0x80000003d01ae480	
	.xword	0x00007c00000d1c11	!139
	.xword	0x80000078604c0481	
	.xword	0x00007c0000fc0000	!140
	.xword	0x80000000605d0481	
	.xword	0x00007c0000c41c11	!141
	.xword	0x80000078602e0481	
	.xword	0x00007d0036401c11	!142
	.xword	0x8000007ec5800483	
	.xword	0x00007b70001a8000	!143
	.xword	0x8000007fd0046480	
	.xword	0x00007c0000f31c11	!144
	.xword	0x8000007860960481	
	.xword	0x00007b7000097c11	!145
	.xword	0x80000003d005e480	
	.xword	0x00007c0000b20000	!146
	.xword	0x8000000060170481	
	.xword	0x00007c0000801c11	!147
	.xword	0x8000007860450481	
	.xword	0x00007c0000f51c11	!148
	.xword	0x8000007860ef0481	
	.xword	0x00007c0000a91c11	!149
	.xword	0x8000007860240481	
	.xword	0x00007b7000093c11	!150
	.xword	0x80000003d00fe480	
	.xword	0x00007c0000631c11	!151
	.xword	0x8000007860670481	
	.xword	0x00007b7000053c11	!152
	.xword	0x80000003d00be480	
	.xword	0x00007c00000b1c11	!153
	.xword	0x8000007860d70481	
	.xword	0x00007b7000059c11	!154
	.xword	0x80000003d017c480	
	.xword	0x00007b70001a1c11	!155
	.xword	0x80000003d01da480	
	.xword	0x00007b70000cfc11	!156
	.xword	0x80000003d006e480	
	.xword	0x00007c00009e1c11	!157
	.xword	0x8000007860bc0481	
hptrap_itte_end:
	.xword	158
.align 32
hptrap_dtte_begin:
	.xword	0x00005ff000151fb0	!0
	.xword	0x8000000f600f4440	
	.xword	0x0000600000c61324	!1
	.xword	0x8000000fe0010041	
	.xword	0x0000610030800000	!2
	.xword	0x8000000e57000043	
	.xword	0x00005ff00002ffb0	!3
	.xword	0x8000000f60086440	
	.xword	0x00005ff000084f4c	!4
	.xword	0x8000000f60132040	
	.xword	0x0000600000ef0000	!5
	.xword	0x8000000fe08b0041	
	.xword	0x000061002e800380	!6
	.xword	0x8000000e5cc00443	
	.xword	0x0000610030401324	!7
	.xword	0x8000000e52400043	
	.xword	0x0000600000220380	!8
	.xword	0x8000000fe0540441	
	.xword	0x0000610024c01324	!9
	.xword	0x8000000e5c400043	
	.xword	0x0000600000a50380	!10
	.xword	0x8000000fe0d80441	
	.xword	0x00005ff0000a5fb0	!11
	.xword	0x8000000f60152440	
	.xword	0x00005ff000157fb0	!12
	.xword	0x8000000f60140440	
	.xword	0x00005ff00001bfb0	!13
	.xword	0x8000000f60192440	
	.xword	0x000061002f800380	!14
	.xword	0x8000000e5dc00443	
	.xword	0x0000610019c00380	!15
	.xword	0x8000000e5e000443	
	.xword	0x0000600000790380	!16
	.xword	0x8000000fe0c70441	
	.xword	0x0000600000010380	!17
	.xword	0x8000000fe0c10441	
	.xword	0x0000600000930380	!18
	.xword	0x8000000fe0d10441	
	.xword	0x00005ff000081fb0	!19
	.xword	0x8000000f60042440	
	.xword	0x0000610036000380	!20
	.xword	0x8000000e59800443	
	.xword	0x00005ff00000dfb0	!21
	.xword	0x8000000f601d2440	
	.xword	0x00005ff000137fb0	!22
	.xword	0x8000000f601de440	
	.xword	0x00005ff00003dfb0	!23
	.xword	0x8000000f600a8440	
	.xword	0x0000600000e80380	!24
	.xword	0x8000000fe0b30441	
	.xword	0x0000640000ae0326	!25
	.xword	0x8000001ff0c30041	
	.xword	0x0000640000d61d03	!26
	.xword	0x8000001ff0dd0441	
	.xword	0x0000640000620000	!27
	.xword	0x80000003f02f0441	
	.xword	0x0000631000048326	!28
	.xword	0x800000037001a040	
	.xword	0x00006607d0001d03	!29
	.xword	0x8000001c80000445	
	.xword	0x00006400004c0000	!30
	.xword	0x80000003f0180441	
	.xword	0x00006400003f0326	!31
	.xword	0x8000001ff0a80041	
	.xword	0x000063100012bd03	!32
	.xword	0x80000003700c0440	
	.xword	0x00006400003c0000	!33
	.xword	0x80000003f0120441	
	.xword	0x00006500048005ce	!34
	.xword	0x8000001e66c00043	
	.xword	0x0000640000350000	!35
	.xword	0x80000003f0040441	
	.xword	0x0000640000830326	!36
	.xword	0x8000001ff0e00041	
	.xword	0x00006310000b0326	!37
	.xword	0x8000000370094040	
	.xword	0x00006400002f0326	!38
	.xword	0x8000001ff0ad0041	
	.xword	0x000063100011a326	!39
	.xword	0x80000003700a0040	
	.xword	0x0000640000670326	!40
	.xword	0x8000001ff00f0041	
	.xword	0x0000640000210326	!41
	.xword	0x8000001ff0300041	
	.xword	0x0000631000108326	!42
	.xword	0x8000000370056040	
	.xword	0x0000631000138326	!43
	.xword	0x80000003700b2040	
	.xword	0x00006310001d2326	!44
	.xword	0x8000000370182040	
	.xword	0x0000640000db0326	!45
	.xword	0x8000001ff0360041	
	.xword	0x0000680000281a67	!46
	.xword	0x8000000010dc0041	
	.xword	0x00006720000e33ea	!47
	.xword	0x8000000380134440	
	.xword	0x00006720001c0000	!48
	.xword	0x8000000380112440	
	.xword	0x0000680000c31a67	!49
	.xword	0x8000000010710041	
	.xword	0x0000680000cc13ea	!50
	.xword	0x8000000010c20441	
	.xword	0x0000680000520000	!51
	.xword	0x80000000107c0441	
	.xword	0x0000680000371a67	!52
	.xword	0x8000000010460041	
	.xword	0x000067200007c000	!53
	.xword	0x800000038001c440	
	.xword	0x00006720000f1a67	!54
	.xword	0x8000000380148040	
	.xword	0x0000672000023a67	!55
	.xword	0x80000003801f0040	
	.xword	0x00006720001ada67	!56
	.xword	0x80000003800d6040	
	.xword	0x000069001b401a67	!57
	.xword	0x8000002e7fc00043	
	.xword	0x00006720000dba67	!58
	.xword	0x8000000380060040	
	.xword	0x0000672000089a67	!59
	.xword	0x80000003800d4040	
	.xword	0x000067200017fa67	!60
	.xword	0x800000038001e040	
	.xword	0x00006720001cfa67	!61
	.xword	0x8000000380120040	
	.xword	0x00006720000a7a67	!62
	.xword	0x8000000380096040	
	.xword	0x0000680000e11a67	!63
	.xword	0x8000000010250041	
	.xword	0x000067200015fa67	!64
	.xword	0x8000000380082040	
	.xword	0x0000680000651a67	!65
	.xword	0x80000000105e0041	
	.xword	0x000069002ec01a67	!66
	.xword	0x8000002e75c00043	
	.xword	0x0000690029801a67	!67
	.xword	0x8000002e79c00043	
	.xword	0x000067200004ba67	!68
	.xword	0x800000038018c040	
	.xword	0x0000672000159a67	!69
	.xword	0x8000000380006040	
	.xword	0x0000680000f21a67	!70
	.xword	0x8000000010b60041	
	.xword	0x00006c0000f808aa	!71
	.xword	0x8000003420c40041	
	.xword	0x00006d0013c00e5a	!72
	.xword	0x800000028f400043	
	.xword	0x00006b300005a000	!73
	.xword	0x80000003900ae440	
	.xword	0x00006b30001548aa	!74
	.xword	0x8000000390162040	
	.xword	0x00006b300006ee5a	!75
	.xword	0x80000003900ea040	
	.xword	0x00006d002f400000	!76
	.xword	0x800000028e800443	
	.xword	0x00006b30000b88aa	!77
	.xword	0x80000003900a6040	
	.xword	0x00006b30001eee5a	!78
	.xword	0x80000003900e8040	
	.xword	0x00006b3000068000	!79
	.xword	0x800000039011e440	
	.xword	0x00006d00224008aa	!80
	.xword	0x8000000287c00043	
	.xword	0x00006d002fc00000	!81
	.xword	0x8000000283000443	
	.xword	0x00006e07600008aa	!82
	.xword	0x80000000a0000045	
	.xword	0x00006d00218008aa	!83
	.xword	0x8000000286400043	
	.xword	0x00006d001b8008aa	!84
	.xword	0x8000000283400043	
	.xword	0x00006c0000a008aa	!85
	.xword	0x8000003420030041	
	.xword	0x00006d002b8008aa	!86
	.xword	0x8000000280c00043	
	.xword	0x00006d001a8008aa	!87
	.xword	0x8000000287800043	
	.xword	0x00006c00004f08aa	!88
	.xword	0x8000003420b10041	
	.xword	0x00006d00290008aa	!89
	.xword	0x800000028ac00043	
	.xword	0x00006c00000208aa	!90
	.xword	0x8000003420bb0041	
	.xword	0x0000710001801ac1	!91
	.xword	0x8000004e9b400043	
	.xword	0x00006f40000f2a24	!92
	.xword	0x80000003a0168440	
	.xword	0x00006f40000ca000	!93
	.xword	0x80000003a01b6440	
	.xword	0x0000720030001ac1	!94
	.xword	0x8000004cb0000045	
	.xword	0x000071000f400c3c	!95
	.xword	0x8000004e9c800443	
	.xword	0x0000710039000000	!96
	.xword	0x8000004e9bc00443	
	.xword	0x00006f400007ec1e	!97
	.xword	0x80000003a0116040	
	.xword	0x0000700000940c3c	!98
	.xword	0x8000004430d20441	
	.xword	0x0000700000ed0000	!99
	.xword	0x8000004430db0441	
	.xword	0x0000700000711ac1	!100
	.xword	0x8000004430a10041	
	.xword	0x00006f40000aca24	!101
	.xword	0x80000003a01e0440	
	.xword	0x0000700000d30000	!102
	.xword	0x8000004430e80441	
	.xword	0x00006f4000008c1e	!103
	.xword	0x80000003a0136040	
	.xword	0x0000700000d90000	!104
	.xword	0x8000004430400441	
	.xword	0x0000720950001ac1	!105
	.xword	0x8000004df0000045	
	.xword	0x0000700000641ac1	!106
	.xword	0x8000004430050041	
	.xword	0x0000710034801ac1	!107
	.xword	0x8000004e91400043	
	.xword	0x0000720830001ac1	!108
	.xword	0x8000004da0000045	
	.xword	0x0000700000c81ac1	!109
	.xword	0x80000044305c0041	
	.xword	0x0000760270001133	!110
	.xword	0x8000000300000445	
	.xword	0x0000750028000358	!111
	.xword	0x80000002a1800043	
	.xword	0x000075000bc00000	!112
	.xword	0x80000002a8c00043	
	.xword	0x000075002dc01133	!113
	.xword	0x80000002ae400443	
	.xword	0x00007350000f4358	!114
	.xword	0x80000003b0028040	
	.xword	0x0000740000270000	!115
	.xword	0x8000005840cc0041	
	.xword	0x000073500013b133	!116
	.xword	0x80000003b019e440	
	.xword	0x000073500005e358	!117
	.xword	0x80000003b0066040	
	.xword	0x0000740000300000	!118
	.xword	0x8000005840de0041	
	.xword	0x0000740000691133	!119
	.xword	0x8000000040b90441	
	.xword	0x0000735000062000	!120
	.xword	0x8000005fb01d8040	
	.xword	0x0000740000f71133	!121
	.xword	0x8000000040cd0441	
	.xword	0x0000740000a11133	!122
	.xword	0x8000000040590441	
	.xword	0x000073500003f133	!123
	.xword	0x80000003b0110440	
	.xword	0x000073500016b133	!124
	.xword	0x80000003b0122440	
	.xword	0x0000740000811133	!125
	.xword	0x80000000405a0441	
	.xword	0x000075000e401133	!126
	.xword	0x80000002ad000443	
	.xword	0x000073500008d133	!127
	.xword	0x80000003b00b6440	
	.xword	0x000073500016d133	!128
	.xword	0x80000003b0022440	
	.xword	0x0000776000198c1b	!129
	.xword	0x8000006fc00ec040	
	.xword	0x000077600016fb46	!130
	.xword	0x8000006fc0170040	
	.xword	0x0000776000148000	!131
	.xword	0x8000006fc0064040	
	.xword	0x000077600006ac1b	!132
	.xword	0x8000006fc01cc040	
	.xword	0x0000776000171b46	!133
	.xword	0x8000006fc01dc040	
	.xword	0x00007760001a6000	!134
	.xword	0x8000006fc0174040	
	.xword	0x000079001e40033d	!135
	.xword	0x80000002bd400043	
	.xword	0x0000790018800ef5	!136
	.xword	0x80000002b2000043	
	.xword	0x0000780000e70000	!137
	.xword	0x8000000050ba0041	
	.xword	0x0000776000172c1b	!138
	.xword	0x8000006fc016a040	
	.xword	0x0000780000410ef5	!139
	.xword	0x8000006850fd0041	
	.xword	0x0000780000900000	!140
	.xword	0x8000000050ae0041	
	.xword	0x0000776000118c1b	!141
	.xword	0x8000006fc0172040	
	.xword	0x0000780000090000	!142
	.xword	0x80000000502c0041	
	.xword	0x000078000006033d	!143
	.xword	0x8000006850970041	
	.xword	0x000078000034033d	!144
	.xword	0x8000006850950041	
	.xword	0x000079002680033d	!145
	.xword	0x80000002b4400043	
	.xword	0x000078000091033d	!146
	.xword	0x8000006850070041	
	.xword	0x00007760001e6c1b	!147
	.xword	0x8000006fc0024040	
	.xword	0x00007a061000033d	!148
	.xword	0x8000006cd0000045	
	.xword	0x0000780000da033d	!149
	.xword	0x8000006850910041	
	.xword	0x000077600001cc1b	!150
	.xword	0x8000006fc00ee040	
	.xword	0x000078000057033d	!151
	.xword	0x8000006850ed0041	
	.xword	0x00007760001c8c1b	!152
	.xword	0x8000006fc00fc040	
	.xword	0x00007800000a033d	!153
	.xword	0x8000006850da0041	
	.xword	0x000079001e80033d	!154
	.xword	0x80000002b5000043	
	.xword	0x00007760001d0c1b	!155
	.xword	0x8000006fc01ce040	
	.xword	0x00007b70001e1c11	!156
	.xword	0x80000003d000a440	
	.xword	0x00007d0016800e71	!157
	.xword	0x8000007ec5400443	
	.xword	0x00007c0000bc0000	!158
	.xword	0x80000000606c0041	
	.xword	0x00007b7000057c11	!159
	.xword	0x80000003d0012440	
	.xword	0x00007b7000040e71	!160
	.xword	0x80000003d000c440	
	.xword	0x00007c0000a80000	!161
	.xword	0x8000000060780041	
	.xword	0x00007b7000051c11	!162
	.xword	0x80000003d01d4440	
	.xword	0x00007b70001e8e71	!163
	.xword	0x80000003d010a440	
	.xword	0x00007b700008e000	!164
	.xword	0x8000007fd004a040	
	.xword	0x00007b70001afc11	!165
	.xword	0x80000003d00b8440	
	.xword	0x00007b70000f6e71	!166
	.xword	0x80000003d0126440	
	.xword	0x00007c0000f40000	!167
	.xword	0x8000000060900041	
	.xword	0x00007b70000e1c11	!168
	.xword	0x80000003d009c440	
	.xword	0x00007c0000bd0e71	!169
	.xword	0x8000007860d60441	
	.xword	0x00007b7000090000	!170
	.xword	0x8000007fd0158040	
	.xword	0x00007b7000193c11	!171
	.xword	0x80000003d00ba440	
	.xword	0x00007c00000f1c11	!172
	.xword	0x8000007860840441	
	.xword	0x00007b7000175c11	!173
	.xword	0x80000003d01d0440	
	.xword	0x00007b7000195c11	!174
	.xword	0x80000003d0178440	
	.xword	0x00007b7000133c11	!175
	.xword	0x80000003d0198440	
	.xword	0x00007b700018dc11	!176
	.xword	0x80000003d008c440	
	.xword	0x00007b7000061c11	!177
	.xword	0x80000003d006c440	
	.xword	0x00007c0000df1c11	!178
	.xword	0x8000007860990441	
	.xword	0x00007b70000edc11	!179
	.xword	0x80000003d005a440	
	.xword	0x00007b7000121c11	!180
	.xword	0x80000003d0100440	
	.xword	0x00007b70001bfc11	!181
	.xword	0x80000003d0114440	
hptrap_dtte_end:
	.xword	182
.align 32
hptrap_user_code_ptrs_0_begin:
	.xword	8
	.xword	0x5ff000130000
	.xword	24
	.xword	0x600000780000
	.xword	40
	.xword	0x61001a400000
	.xword	56
	.xword	0x5ff00019c000
	.xword	72
	.xword	0x610025c00000
	.xword	88
	.xword	0x5ff000046000
	.xword	104
	.xword	0x5ff000012000
	.xword	120
	.xword	0x5ff000134000
	.xword	136
	.xword	0x5ff000086000
	.xword	152
	.xword	0x5ff000000000
	.xword	168
	.xword	0x61001e000000
	.xword	184
	.xword	0x6000009d0000
	.xword	200
	.xword	0x5ff0000b2000
	.xword	216
	.xword	0x600000050000
	.xword	232
	.xword	8
.align 32
hptrap_user_code_ptrs_1_begin:
	.xword	8
	.xword	0x640000990000
	.xword	24
	.xword	0x650010000000
	.xword	40
	.xword	0x640000400000
	.xword	56
	.xword	0x640000500000
	.xword	72
	.xword	0x640000c90000
	.xword	88
	.xword	0x660650000000
	.xword	104
	.xword	0x63100014c000
	.xword	120
	.xword	0x640000eb0000
	.xword	136
	.xword	0x631000140000
	.xword	152
	.xword	0x6400003b0000
	.xword	168
	.xword	0x65003a400000
	.xword	184
	.xword	0x63100015c000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_2_begin:
	.xword	8
	.xword	0x680000100000
	.xword	24
	.xword	0x680000110000
	.xword	40
	.xword	0x67200011c000
	.xword	56
	.xword	0x67200018a000
	.xword	72
	.xword	0x6720000ea000
	.xword	88
	.xword	0x6720000de000
	.xword	104
	.xword	0x67200017c000
	.xword	120
	.xword	0x67200004c000
	.xword	136
	.xword	0x69001c400000
	.xword	152
	.xword	0x680000e20000
	.xword	168
	.xword	0x6720000c6000
	.xword	184
	.xword	0x69000e000000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_3_begin:
	.xword	8
	.xword	0x6c0000a30000
	.xword	24
	.xword	0x6b300000a000
	.xword	40
	.xword	0x6c0000dd0000
	.xword	56
	.xword	0x6c0000fd0000
	.xword	72
	.xword	0x6c0000250000
	.xword	88
	.xword	0x6b30000bc000
	.xword	104
	.xword	0x6b3000102000
	.xword	120
	.xword	0x6b300015a000
	.xword	136
	.xword	0x6b30001d8000
	.xword	152
	.xword	0x6b300004e000
	.xword	168
	.xword	0x6b300002c000
	.xword	184
	.xword	0x6b30001fa000
	.xword	200
	.xword	0x6b3000160000
	.xword	216
	.xword	8
.align 32
hptrap_user_code_ptrs_4_begin:
	.xword	8
	.xword	0x6f400008a000
	.xword	24
	.xword	0x6f400006c000
	.xword	40
	.xword	0x700000140000
	.xword	56
	.xword	0x6f4000166000
	.xword	72
	.xword	0x710028c00000
	.xword	88
	.xword	0x6f40001f0000
	.xword	104
	.xword	0x710031800000
	.xword	120
	.xword	0x6f4000164000
	.xword	136
	.xword	0x720190000000
	.xword	152
	.xword	0x6f400014e000
	.xword	168
	.xword	8
.align 32
hptrap_user_code_ptrs_5_begin:
	.xword	8
	.xword	0x740000b30000
	.xword	24
	.xword	0x7400004d0000
	.xword	40
	.xword	0x73500013c000
	.xword	56
	.xword	0x740000770000
	.xword	72
	.xword	0x750009c00000
	.xword	88
	.xword	0x740000320000
	.xword	104
	.xword	0x740000d40000
	.xword	120
	.xword	0x7350000d6000
	.xword	136
	.xword	0x7350001dc000
	.xword	152
	.xword	0x735000064000
	.xword	168
	.xword	0x7607c0000000
	.xword	184
	.xword	0x75000ac00000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_6_begin:
	.xword	8
	.xword	0x780000a70000
	.xword	24
	.xword	0x776000100000
	.xword	40
	.xword	0x790022800000
	.xword	56
	.xword	0x780000490000
	.xword	72
	.xword	0x7800007a0000
	.xword	88
	.xword	0x7760000cc000
	.xword	104
	.xword	0x7760001de000
	.xword	120
	.xword	0x7760001b6000
	.xword	136
	.xword	0x790019800000
	.xword	152
	.xword	8
.align 32
hptrap_user_code_ptrs_7_begin:
	.xword	8
	.xword	0x7c00000d0000
	.xword	24
	.xword	0x7d0036400000
	.xword	40
	.xword	0x7b7000096000
	.xword	56
	.xword	0x7c0000800000
	.xword	72
	.xword	0x7c0000f50000
	.xword	88
	.xword	0x7c0000a90000
	.xword	104
	.xword	0x7b7000092000
	.xword	120
	.xword	0x7c0000630000
	.xword	136
	.xword	0x7b7000052000
	.xword	152
	.xword	0x7c00000b0000
	.xword	168
	.xword	0x7b7000058000
	.xword	184
	.xword	0x7b70001a0000
	.xword	200
	.xword	0x7b70000ce000
	.xword	216
	.xword	0x7c00009e0000
	.xword	232
	.xword	8
/*********************************************************************/
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x620640000000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	VA = 0x620640000000 ,/* 0x62064fffffc0 */
	RA = 0x0070000000 ,
	PA = 0x0070000000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000620640000380 8000000070000085 */
	end_label   = Thr0_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
	setx	0x5ff000150000, %g1, %g2
	or	%g0, 16, %g1
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
	or	%g0, 0x169, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	READ_IDATA_ACCESS
	.word	0xfcd95120
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c5a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe85aa0b8
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe168000
	IDEMAP_RPAGE
	nop
thr0_MMU_ASI_SECONDARY_1:
	.word	0x87802081
	.word	0xd6f46090
	.word	0x1000000
	or	%g0, 0x138, %i7
	ITLB_TAG_READ
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xc020a7dc
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v000_exit:
	EXIT_GOOD
Thr0_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v100 DATA_VA=0x5ff000150000
attr_data {
	Name = .Thr0_User_Data_4v100 ,
	VA = 0x5ff000150000 ,/* 0x5ff000151fc0 */
	RA = 0x03600f4000 ,
	PA = 0x0f600f4000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005ff000151fb0 8000000f600f4440 */
	end_label   = Thr0_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v100_data_begin
Thr0_User_Data_4v100_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v200 DATA_VA=0x600000c60000
attr_data {
	Name = .Thr0_User_Data_4v200 ,
	VA = 0x600000c60000 ,/* 0x600000c6ffc0 */
	RA = 0x03e0010000 ,
	PA = 0x0fe0010000 ,
	TTE_Context = 0x1324 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000600000c61324 8000000fe0010041 */
	end_label   = Thr0_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v200_data_begin
Thr0_User_Data_4v200_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v300 DATA_VA=0x610030800000
attr_data {
	Name = .Thr0_User_Data_4v300 ,
	VA = 0x610030800000 ,/* 0x610030bfffc0 */
	RA = 0x0257000000 ,
	PA = 0x0e57000000 ,
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
	/* DTTE_TAG_DATA = 0000610030800000 8000000e57000043 */
	end_label   = Thr0_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v300_data_begin
Thr0_User_Data_4v300_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v001 TEXT_VA=0x5ff000130000
attr_text {
	Name = .Thr0_User_Text_4v001 ,
	VA = 0x5ff000130000 ,/* 0x5ff000131fc0 */
	RA = 0x0360092000 ,
	PA = 0x0f60092000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005ff000131fb0 8000000f60092080 */
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
	.word	0xfa712110
	.word	0xc029235c
	.word	0xfe562b52
	.word	0xe870a108
	.word	0xc026a4c4
	.word	0x1000000
	or	%g0, 0x5b3, %i7
	LOAD_IDATA_ACCESS
thr0_MMU_ASI_BLK_PL_2:
	.word	0x878020f8
	.word	0xc3b92b40
	TOGGLE_LSU_DM
	.word	0xd45d2038
	.word	0x1000000
	or	%g0, 0x7a, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcde1000
	.word	0x1000000
	.word	0xbe118000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe15c000
	IDEMAP_PAGE
	nop
	nop
	nop
	TOGGLE_LSU_IM
thr0_MMU_ASI_PRIMARY_3:
	.word	0x87802080
	.word	0xc8f62150
	.word	0x1000000
	or	%g0, 0x128, %i7
	READ_IDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x3c2, %i7
	LOAD_DDATA_ACCESS
	.word	0xde70a050
	.word	0xc0352e84
	.word	0xfa712050
	.word	0xc0712e48
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x699, %i7
	LOAD_DDATA_ACCESS
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
	DDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_SCTX
	.word	0xfe40a8b0
	.word	0xf45aa0b8
	.word	0x1000000
	or	%g0, 0x019, %i7
	LOAD_DDATA_IN
	.word	0xfe56252e
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x20, %i7
	READ_IDATA_ACCESS
	DDEMAP_ALL_RPAGES
	.word	0xc070a3b0
	.word	0x1000000
	or	%g0, 0x521, %i7
	LOAD_IDATA_ACCESS
	ACCESS_DTSB_PTR
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_4:
	.word	0x87802080
	.word	0xdcf0a028
	.word	0xc0242f3c
	.word	0xe07420f8
	.word	0xc022a388
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x00d, %i7
	LOAD_DDATA_IN
thr0_MMU_ASI_PRIMARY_5:
	.word	0x87802080
	.word	0xdaf620b0
	.word	0xec762098
	.word	0xc02aa662
	.word	0xfcda9140
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc022ad58
	ACCESS_DTSB_PTR
	.word	0xc87620a8
	.word	0xc02525dc
	.word	0xc0262540
	.word	0x1000000
	or	%g0, 0x645, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0xd45c2108
	.word	0x81c4a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v001_exit:
	EXIT_GOOD
Thr0_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v400 TEXT_VA=0x5ff00010a000
attr_text {
	Name = .Thr0_User_Text_4v400 ,
	VA = 0x5ff00010a000 ,/* 0x5ff00010bfc0 */
	RA = 0x0360004000 ,
	PA = 0x0360004000 ,
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
	/* ITTE_TAG_DATA = 00005ff00010a000 8000000360004480 */
	end_label   = Thr0_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v400_text_begin
Thr0_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x370, %i7
	P_DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd1140
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe104000
	P_DDEMAP_PAGE
	.word	0xbe862068
	.word	0xc4dfc200
	.word	0xfc995020
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_ACCESS_DTSB_PTR
thr0_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_6:
	.word	0x8780202a
	.word	0xd0bd2eb0
	.word	0x1000000
	or	%g0, 0x197, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfe41a7ec
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x019, %i7
	P_LOAD_DDATA_IN
	.word	0xc19e9e00
	.word	0xbe82a088
	.word	0xe8dfc200
	.word	0xec732020
	.word	0xc029a43b
	.word	0x1000000
	or	%g0, 0x3d8, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfe49afb0
	P_IDEMAP_ALL
	P_TOGGLE_LSU_DM
	.word	0xf859a088
	.word	0xf059a0a8
	.word	0xc871a150
	.word	0xc02b2792
	.word	0xe25b2010
	.word	0xbe862008
	.word	0xd4dfd000
thr0_MMU_ASI_BLK_COMMIT_P_7:
	.word	0x878020e0
	.word	0xe1be21c0
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe872008
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x535, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcd91000
	.word	0x1000000
	or	%g0, 0x158, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x374, %i7
	P_LOAD_DDATA_ACCESS
thr0_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_8:
	.word	0x87802022
	.word	0xccb92170
	P_DDEMAP_SCTX
thr0_MMU_ASI_BLK_S_9:
	.word	0x878020f1
	.word	0xc3b96c00
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x057, %i7
	P_LOAD_DDATA_IN
thr0_MMU_ASI_BLK_COMMIT_P_10:
	.word	0x878020e0
	.word	0xe3bc2a00
thr0_MMU_ASI_AS_IF_USER_PRIMARY_11:
	.word	0x87802010
	.word	0xd8f2a018
thr0_MMU_ASI_PRIMARY_12:
	.word	0x87802080
	.word	0xf0bf2610
thr0_MMU_ASI_PRIMARY_13:
	.word	0x87802080
	.word	0xf6f2a0e0
	.word	0xbe8420a8
	.word	0xe0dfd000
	nop
	nop
	.word	0xf671a100
	.word	0xc021ad7c
	.word	0xbe8120c8
	.word	0xd4dfc200
	P_ACCESS_DTSB_PTR
	.word	0xfcdec280
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda9000
thr0_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_14:
	.word	0x8780202b
	.word	0xc0b96fb0
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_ACCESS_DTSB_PTR
	.word	0xfc9984e0
	.word	0xbe872088
	.word	0xd4dfd000
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR1
	nop
Thr0_User_Text_4v400_exit:
	EXIT_GOOD
Thr0_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v002 TEXT_VA=0x5ff000152000
attr_text {
	Name = .Thr0_User_Text_4v002 ,
	VA = 0x5ff000152000 ,/* 0x5ff000153fc0 */
	RA = 0x0360130000 ,
	PA = 0x0f60130000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005ff000153fb0 8000000f60130080 */
	end_label   = Thr0_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v002_text_begin
Thr0_User_Text_4v002_text_begin:
	wrpr	0, %gl
thr0_MMU_ASI_BLK_P_15:
	.word	0x878020f0
	.word	0xe3be22c0
	.word	0xbe842068
	.word	0xe8dfd040
	P_ACCESS_DTSB_PTR
thr0_MMU_ASI_AS_IF_USER_PRIMARY_16:
	.word	0x87802010
	.word	0xd6f62010
	.word	0x1000000
	or	%g0, 0x480, %i7
	P_ITLB_TAG_READ
	.word	0xbe86a088
	.word	0xf8dfc200
	P_ACCESS_DTSB_PTR
	nop
	.word	0xfc998580
thr0_MMU_ASI_SECONDARY_17:
	.word	0x87802081
	.word	0xecbc6240
	.word	0x1000000
	or	%g0, 0x51e, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_ACCESS_ITSB_PTR
	.word	0xfcda9000
	.word	0xc472a0a8
	.word	0xc0292f44
	nop
	nop
	nop
	nop
	.word	0xfcde0200
	.word	0xfcdd5120
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x550, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
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
	.word	0xfcdd5060
	nop
	nop
	nop
	.word	0xf070a068
	.word	0xc0362880
	.word	0xbe82a168
	.word	0xf4dfc200
	.word	0x1000000
	or	%g0, 0x590, %i7
	P_READ_DDATA_ACCESS
	P_TOGGLE_LSU_DM
thr0_MMU_ASI_AS_IF_USER_SECONDARY_LITTLE_18:
	.word	0x87802019
	.word	0xf4f16038
	.word	0x1000000
	or	%g0, 0x067, %i7
	P_LOAD_DDATA_IN
thr0_MMU_ASI_AS_IF_USER_PRIMARY_19:
	.word	0x87802010
	.word	0xd2f52110
	.word	0x1000000
	or	%g0, 0x498, %i7
	P_DTLB_TAG_READ
	.word	0xfe412b4c
	P_ACCESS_ITSB_PTR
	P_DDEMAP_SCTX
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v002_exit:
	EXIT_GOOD
Thr0_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v101 DATA_VA=0x5ff00002e000
attr_data {
	Name = .Thr0_User_Data_4v101 ,
	VA = 0x5ff00002e000 ,/* 0x5ff00002ffc0 */
	RA = 0x0360086000 ,
	PA = 0x0f60086000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005ff00002ffb0 8000000f60086440 */
	end_label   = Thr0_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v101_data_begin
Thr0_User_Data_4v101_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v201 DATA_VA=0x5ff000084000
attr_data {
	Name = .Thr0_User_Data_4v201 ,
	VA = 0x5ff000084000 ,/* 0x5ff000085fc0 */
	RA = 0x0360132000 ,
	PA = 0x0f60132000 ,
	TTE_Context = 0x1324 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00005ff000084f4c 8000000f60132040 */
	end_label   = Thr0_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v201_data_begin
Thr0_User_Data_4v201_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v301 DATA_VA=0x600000ef0000
attr_data {
	Name = .Thr0_User_Data_4v301 ,
	VA = 0x600000ef0000 ,/* 0x600000efffc0 */
	RA = 0x03e08b0000 ,
	PA = 0x0fe08b0000 ,
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
	/* DTTE_TAG_DATA = 0000600000ef0000 8000000fe08b0041 */
	end_label   = Thr0_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v301_data_begin
Thr0_User_Data_4v301_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v003 TEXT_VA=0x600000780000
attr_text {
	Name = .Thr0_User_Text_4v003 ,
	VA = 0x600000780000 ,/* 0x60000078ffc0 */
	RA = 0x03e03a0000 ,
	PA = 0x0fe03a0000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000780380 8000000fe03a0081 */
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
	.word	0x1000000
	or	%g0, 0x410, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_PCTX
	.word	0xbe120000
	GOTO_SUPERVISOR1
thr0_MMU_ASI_BLK_PL_20:
	.word	0x878020f8
	.word	0xe3bd2740
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	DTLB_TAG_READ
thr0_MMU_ASI_PRIMARY_21:
	.word	0x87802080
	.word	0xd4f620a8
	.word	0xc0762df8
	.word	0x1000000
	or	%g0, 0x60, %i7
	READ_IDATA_ACCESS
	.word	0xbe812088
	.word	0xe8dfd000
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x140, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe13c000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x078, %i7
	LOAD_IDATA_IN
	.word	0xfe40aec4
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x096, %i7
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
	.word	0x1000000
	or	%g0, 0x30, %i7
	ITLB_TAG_READ
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x007, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe104000
	IDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0272f98
thr0_MMU_ASI_PRIMARY_22:
	.word	0x87802080
	.word	0xd2f520c0
	.word	0xc02c2b55
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0xce762000
	.word	0xc072a1f0
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v003_exit:
	EXIT_GOOD
Thr0_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v401 TEXT_VA=0x5ff000094000
attr_text {
	Name = .Thr0_User_Text_4v401 ,
	VA = 0x5ff000094000 ,/* 0x5ff000095fc0 */
	RA = 0x03601e4000 ,
	PA = 0x03601e4000 ,
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
	/* ITTE_TAG_DATA = 00005ff000094000 80000003601e4480 */
	end_label   = Thr0_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v401_text_begin
Thr0_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0xec71a0c0
	.word	0xc021a1c0
	P_TOGGLE_LSU_DM
	.word	0xfcdf1000
	.word	0x1000000
	or	%g0, 0x00b, %i7
	P_LOAD_IDATA_IN
	.word	0xbe82a088
	.word	0xe8dfd040
	.word	0x1000000
	.word	0xbe15c000
	P_IDEMAP_RPAGE
	.word	0xf859a0a8
	.word	0xfc998480
thr0_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_23:
	.word	0x8780202a
	.word	0xd4baa7e0
	.word	0x1000000
	or	%g0, 0x640, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_SCTX
	.word	0xbe8720f0
	.word	0xe19fde00
thr0_MMU_ASI_BLK_P_24:
	.word	0x878020f0
	.word	0xc1be2e40
thr0_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_25:
	.word	0x87802018
	.word	0xc4f2a0a8
	P_TOGGLE_LSU_DM
	.word	0xbe862108
	.word	0xd4dfc200
	P_DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x07f, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x300, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_NCTX
	P_DDEMAP_PCTX
	P_TOGGLE_LSU_IM
	.word	0xfe51ae0e
	P_IDEMAP_NCTX
thr0_MMU_ASI_AS_IF_USER_PRIMARY_26:
	.word	0x87802010
	.word	0xe6f0a030
	.word	0xea71a010
	.word	0xc071ac68
	.word	0xfc9ad120
	P_ACCESS_DTSB_PTR
	.word	0xd45b2088
thr0_MMU_ASI_PRIMARY_27:
	.word	0x87802080
	.word	0xd2f520e0
	P_DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe872038
	.word	0xe8dfc200
	P_TOGGLE_LSU_DM
thr0_MMU_ASI_AS_IF_USER_PRIMARY_28:
	.word	0x87802010
	.word	0xd6f52010
	.word	0xbe842068
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_ACCESS_DTSB_PTR
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr0_User_Text_4v401_exit:
	EXIT_GOOD
Thr0_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v004 TEXT_VA=0x610005c00000
attr_text {
	Name = .Thr0_User_Text_4v004 ,
	VA = 0x610005c00000 ,/* 0x610005ffffc0 */
	RA = 0x0250800000 ,
	PA = 0x0e50800000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000610005c00380 8000000e50800083 */
	end_label   = Thr0_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v004_text_begin
Thr0_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe138000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xe19a9e00
	.word	0x1000000
	.word	0xbe10c000
	P_IDEMAP_PAGE
	.word	0xfcdd1000
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x06d, %i7
	P_LOAD_IDATA_IN
	.word	0xbe80a088
	.word	0xf0dfc200
	nop
	.word	0xbe842038
	.word	0xe0dfc200
	.word	0xf058a168
	.word	0x1000000
	or	%g0, 0x004, %i7
	P_LOAD_IDATA_IN
	P_ACCESS_ITSB_PTR
	P_DDEMAP_NCTX
	P_TOGGLE_LSU_DM
	.word	0xbe82e010
	.word	0xc19fde20
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe17c000
	P_IDEMAP_PAGE
	.word	0xe85d2128
thr0_MMU_ASI_PRIMARY_29:
	.word	0x87802080
	.word	0xd6f52070
	P_TOGGLE_LSU_DM
	.word	0xe05ea0a8
	.word	0xc0272f1c
	.word	0xfcdc1000
thr0_MMU_ASI_PRIMARY_30:
	.word	0x87802080
	.word	0xd0f52028
	P_TOGGLE_LSU_DM
	.word	0xfcd94320
	.word	0xc02e2309
	.word	0xfc9d44c0
	.word	0xfe5aa970
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x16, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xd872a018
	.word	0xc072a2e8
	.word	0x1000000
	or	%g0, 0x5bf, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfcdc0200
	.word	0xd65c2070
	.word	0xbe82a038
	.word	0xe8dfc200
thr0_MMU_ASI_PRIMARY_31:
	.word	0x87802080
	.word	0xc4f52008
	.word	0x1000000
	or	%g0, 0x58, %i7
	P_READ_DDATA_ACCESS
	P_IDEMAP_ALL_PAGES
	.word	0xbe82a0f8
	.word	0xf0dfc200
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v004_exit:
	EXIT_GOOD
Thr0_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v102 DATA_VA=0x61002e800000
attr_data {
	Name = .Thr0_User_Data_4v102 ,
	VA = 0x61002e800000 ,/* 0x61002ebfffc0 */
	RA = 0x025cc00000 ,
	PA = 0x0e5cc00000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000061002e800380 8000000e5cc00443 */
	end_label   = Thr0_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v102_data_begin
Thr0_User_Data_4v102_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v202 DATA_VA=0x610030400000
attr_data {
	Name = .Thr0_User_Data_4v202 ,
	VA = 0x610030400000 ,/* 0x6100307fffc0 */
	RA = 0x0252400000 ,
	PA = 0x0e52400000 ,
	TTE_Context = 0x1324 ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_3 ,
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
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 0000610030401324 8000000e52400043 */
	end_label   = Thr0_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v202_data_begin
Thr0_User_Data_4v202_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v005 TEXT_VA=0x61001a400000
attr_text {
	Name = .Thr0_User_Text_4v005 ,
	VA = 0x61001a400000 ,/* 0x61001a7fffc0 */
	RA = 0x025a000000 ,
	PA = 0x0e5a000000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061001a400380 8000000e5a000083 */
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
	.word	0xee752130
	.word	0xc02aab00
	IDEMAP_ALL_RPAGES
	.word	0xfa7120f0
	.word	0xc02c2539
thr0_MMU_ASI_PRIMARY_32:
	.word	0x87802080
	.word	0xd6f42010
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_BLK_P_33:
	.word	0x878020f0
	.word	0xc3bc2980
	IDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc036a190
	.word	0x81c3e000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v005_exit:
	EXIT_GOOD
Thr0_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v006 TEXT_VA=0x61002a400000
attr_text {
	Name = .Thr0_User_Text_4v006 ,
	VA = 0x61002a400000 ,/* 0x61002a7fffc0 */
	RA = 0x025d800000 ,
	PA = 0x0e5d800000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061002a400380 8000000e5d800083 */
	end_label   = Thr0_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v006_text_begin
Thr0_User_Text_4v006_text_begin:
	wrpr	0, %gl
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x5a7, %i7
	P_LOAD_IDATA_ACCESS
	P_ACCESS_ITSB_PTR
thr0_MMU_ASI_BLK_P_34:
	.word	0x878020f0
	.word	0xe1baa140
	.word	0xfe42a174
	.word	0xbe80a088
	.word	0xe8dfc200
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	P_ITLB_TAG_READ
	P_DDEMAP_SCTX
	.word	0xc072a410
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
	.word	0xd6dfd020
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v006_exit:
	EXIT_GOOD
Thr0_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v103 DATA_VA=0x600000220000
attr_data {
	Name = .Thr0_User_Data_4v103 ,
	VA = 0x600000220000 ,/* 0x60000022ffc0 */
	RA = 0x03e0540000 ,
	PA = 0x0fe0540000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000220380 8000000fe0540441 */
	end_label   = Thr0_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v103_data_begin
Thr0_User_Data_4v103_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v203 DATA_VA=0x610024c00000
attr_data {
	Name = .Thr0_User_Data_4v203 ,
	VA = 0x610024c00000 ,/* 0x610024ffffc0 */
	RA = 0x025c400000 ,
	PA = 0x0e5c400000 ,
	TTE_Context = 0x1324 ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_3 ,
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
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 0000610024c01324 8000000e5c400043 */
	end_label   = Thr0_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v203_data_begin
Thr0_User_Data_4v203_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v007 TEXT_VA=0x5ff00019c000
attr_text {
	Name = .Thr0_User_Text_4v007 ,
	VA = 0x5ff00019c000 ,/* 0x5ff00019dfc0 */
	RA = 0x03600cc000 ,
	PA = 0x0f600cc000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005ff00019dfb0 8000000f600cc080 */
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
	.word	0xfe42a788
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xf05ea150
	.word	0xfe442c84
	.word	0xd65c2070
	.word	0x1000000
	.word	0xbe134000
	DDEMAP_RPAGE
	nop
	nop
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	READ_IDATA_ACCESS
	ACCESS_ITSB_PTR
	DDEMAP_ALL_PAGES
	DDEMAP_PCTX
	.word	0xc0252170
	.word	0xcc5d2018
	DO_BRANCH
	.word	0x81c5e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe42aaa0
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v007_exit:
	EXIT_GOOD
Thr0_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v008 TEXT_VA=0x610007000000
attr_text {
	Name = .Thr0_User_Text_4v008 ,
	VA = 0x610007000000 ,/* 0x6100073fffc0 */
	RA = 0x0252c00000 ,
	PA = 0x0e52c00000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000610007000380 8000000e52c00083 */
	end_label   = Thr0_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v008_text_begin
Thr0_User_Text_4v008_text_begin:
	wrpr	0, %gl
thr0_MMU_ASI_AS_IF_USER_PRIMARY_35:
	.word	0x87802010
	.word	0xc8f420d8
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe25c2010
thr0_MMU_ASI_PRIMARY_36:
	.word	0x87802080
	.word	0xe2f2a010
thr0_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_37:
	.word	0x87802023
	.word	0xf0bc6170
	.word	0xfe46ab54
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	nop
	nop
	nop
	nop
	.word	0xbe812068
	.word	0xe0dfd000
	.word	0xfcde1000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_ACCESS_DTSB_PTR
	.word	0xbe842068
	.word	0xe8dfc200
	.word	0x1000000
	or	%g0, 0x46, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xc030aa8c
	.word	0xbe82a110
	.word	0xc19fde00
	.word	0xbe80a0e8
	.word	0xe8dfd000
	P_TOGGLE_LSU_IM
	.word	0xbe8620d8
	.word	0xc8dfd000
	.word	0xfcdf1000
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
thr0_MMU_ASI_PRIMARY_38:
	.word	0x87802080
	.word	0xc6f420e0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x450, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe154000
	P_DDEMAP_RPAGE
	.word	0xf4762068
	.word	0xc02aa817
	P_DDEMAP_ALL
	P_IDEMAP_ALL
	.word	0xfcde8380
	.word	0xe05e2088
	P_IDEMAP_ALL_RPAGES
	.word	0xf858a0e8
	P_IDEMAP_NCTX
thr0_MMU_ASI_PRIMARY_LITTLE_39:
	.word	0x87802088
	.word	0xe0f42088
	nop
thr0_MMU_ASI_PRIMARY_40:
	.word	0x87802080
	.word	0xd8f0a018
	.word	0xfcdc0200
	P_ACCESS_ITSB_PTR
	.word	0xfcdc0200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe15c000
	P_DDEMAP_PAGE
	.word	0xbe812128
	.word	0xf0dfc200
	P_DDEMAP_ALL_PAGES
	.word	0xbe852150
	.word	0xf4dfd000
	.word	0x1000000
	or	%g0, 0x491, %i7
	P_LOAD_IDATA_ACCESS
thr0_MMU_ASI_PRIMARY_41:
	.word	0x87802080
	.word	0xd6f52090
	.word	0xc02aad0d
	P_IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x07b, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	P_ITLB_TAG_READ
	.word	0xbe842088
	.word	0xe0dfd000
	.word	0xc02d222b
thr0_MMU_ASI_PRIMARY_42:
	.word	0x87802080
	.word	0xd6f2a070
	.word	0xfcdd1000
thr0_MMU_ASI_PRIMARY_43:
	.word	0x87802080
	.word	0xcaf72010
	.word	0xc02c28e8
	nop
	nop
	.word	0xda712098
	.word	0xc076a170
	.word	0xea5d2010
	.word	0xbe8420a8
	.word	0xe0dfc200
	.word	0xfc9c5d60
	.word	0xfcd90200
	.word	0xfe42a964
	.word	0x1000000
	.word	0xbe154000
	P_IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda8200
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v008_exit:
	EXIT_GOOD
Thr0_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v104 DATA_VA=0x600000a50000
attr_data {
	Name = .Thr0_User_Data_4v104 ,
	VA = 0x600000a50000 ,/* 0x600000a5ffc0 */
	RA = 0x03e0d80000 ,
	PA = 0x0fe0d80000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000a50380 8000000fe0d80441 */
	end_label   = Thr0_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v104_data_begin
Thr0_User_Data_4v104_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v009 TEXT_VA=0x610025c00000
attr_text {
	Name = .Thr0_User_Text_4v009 ,
	VA = 0x610025c00000 ,/* 0x610025ffffc0 */
	RA = 0x0259000000 ,
	PA = 0x0e59000000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000610025c00380 8000000e59000083 */
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
	nop
	.word	0x1000000
	.word	0xbe168000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x158, %i7
	READ_DDATA_ACCESS
thr0_MMU_ASI_PRIMARY_44:
	.word	0x87802080
	.word	0xe6f420b0
	.word	0xe07420c8
	.word	0xc031287c
	DDEMAP_ALL
	IDEMAP_ALL_RPAGES
	.word	0xfc995120
	.word	0xfe442dfc
	.word	0xfe4aa772
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xf05d2068
	.word	0xc03726cc
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
	IDEMAP_ALL
	.word	0xbe852068
	.word	0xe8dfd000
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	TOGGLE_LSU_IM
	.word	0xfcd89000
	.word	0xfe5e2c28
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc026269c
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0xe476a140
	.word	0xc072ae30
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
	DDEMAP_ALL_PAGES
	.word	0xea58a040
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0xd9, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
thr0_MMU_ASI_PRIMARY_45:
	.word	0x87802080
	.word	0xe4f42120
	.word	0xfe4aa74d
	IDEMAP_ALL
	.word	0xbe816040
	.word	0xe2dfd060
	.word	0xbe862168
	.word	0xd4dfd000
	nop
	nop
	ACCESS_ITSB_PTR
	DDEMAP_ALL_RPAGES
	.word	0xc072a220
	.word	0xf05d2068
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
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x074, %i7
	LOAD_DDATA_IN
	.word	0xfe542120
	.word	0xc0352b28
	.word	0xee76a0c0
	.word	0xc0752520
	.word	0xfe542eee
	IDEMAP_NCTX
	.word	0xe05920d8
	TOGGLE_LSU_IM
	.word	0xbe852038
	.word	0xf4dfd000
	.word	0x1000000
	or	%g0, 0x588, %i7
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
	nop
	nop
	nop
	nop
	.word	0xfe5e2f78
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xf05d2068
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v009_exit:
	EXIT_GOOD
Thr0_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v105 DATA_VA=0x5ff0000a4000
attr_data {
	Name = .Thr0_User_Data_4v105 ,
	VA = 0x5ff0000a4000 ,/* 0x5ff0000a5fc0 */
	RA = 0x0360152000 ,
	PA = 0x0f60152000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005ff0000a5fb0 8000000f60152440 */
	end_label   = Thr0_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v105_data_begin
Thr0_User_Data_4v105_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00a TEXT_VA=0x5ff000046000
attr_text {
	Name = .Thr0_User_Text_4v00a ,
	VA = 0x5ff000046000 ,/* 0x5ff000047fc0 */
	RA = 0x03601f8000 ,
	PA = 0x0f601f8000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005ff000047fb0 8000000f601f8080 */
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
	.word	0x1000000
	or	%g0, 0x049, %i7
	LOAD_IDATA_IN
	.word	0xc19f1e00
	.word	0xe4742020
	.word	0xc02aa170
	.word	0xfc9e9c40
	.word	0xe05d2088
	DO_BRANCH
	.word	0x81c5a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x150, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	.word	0xbe812148
	.word	0xe8dfd000
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_PAGE
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x4e8, %i7
	DTLB_TAG_READ
	.word	0xfc995d60
	.word	0x1000000
	or	%g0, 0x508, %i7
	READ_DDATA_ACCESS
	.word	0xf85c2088
	.word	0xc072ab30
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xbe852118
	.word	0xe0dfd000
	.word	0xe0592038
	.word	0xbe816070
	.word	0xd6dfd020
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x4ef, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x7a8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x428, %i7
	READ_IDATA_ACCESS
thr0_MMU_ASI_PRIMARY_46:
	.word	0x87802080
	.word	0xf4f620b8
	.word	0xf072a068
	.word	0xc032a6b2
	.word	0xfe4126dc
	.word	0xc020a600
	TOGGLE_LSU_IM
	.word	0xfe4c2a98
	.word	0xde742098
	.word	0xc0312984
	.word	0xf458a128
	.word	0xbe82a0e8
	.word	0xe8dfd000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0xca5c2010
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v00a_exit:
	EXIT_GOOD
Thr0_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v106 DATA_VA=0x5ff000156000
attr_data {
	Name = .Thr0_User_Data_4v106 ,
	VA = 0x5ff000156000 ,/* 0x5ff000157fc0 */
	RA = 0x0360140000 ,
	PA = 0x0f60140000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005ff000157fb0 8000000f60140440 */
	end_label   = Thr0_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v106_data_begin
Thr0_User_Data_4v106_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00b TEXT_VA=0x5ff000012000
attr_text {
	Name = .Thr0_User_Text_4v00b ,
	VA = 0x5ff000012000 ,/* 0x5ff000013fc0 */
	RA = 0x0360076000 ,
	PA = 0x0f60076000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005ff000013fb0 8000000f60076080 */
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
	nop
	nop
	nop
	nop
	nop
	.word	0xc030a1b2
	.word	0x1000000
	or	%g0, 0x4a0, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_DM
thr0_MMU_ASI_PRIMARY_47:
	.word	0x87802080
	.word	0xe2f52010
	.word	0xfcd89000
	.word	0x1000000
	or	%g0, 0x059, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_RPAGES
thr0_MMU_ASI_PRIMARY_48:
	.word	0x87802080
	.word	0xdaf42000
	.word	0x1000000
	.word	0xbe108000
	IDEMAP_PAGE
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x444, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x045, %i7
	LOAD_IDATA_IN
	.word	0xc036a39c
	.word	0x1000000
	or	%g0, 0x5f0, %i7
	READ_IDATA_ACCESS
	.word	0xfcd89000
	.word	0xe85d20a8
thr0_MMU_ASI_PRIMARY_49:
	.word	0x87802080
	.word	0xc6f2a098
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x494, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x129, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe56239e
	.word	0xfe5aa8b0
	.word	0xe858a108
	.word	0xbe8120a8
	.word	0xe8dfd040
	.word	0xc85aa038
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x3a0, %i7
	DTLB_TAG_READ
	.word	0xc0742c20
thr0_MMU_ASI_BLK_P_50:
	.word	0x878020f0
	.word	0xe3bc2ac0
	.word	0xbe80a160
	.word	0xc8dfd000
	.word	0x1000000
	.word	0xbe140000
	IDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe124000
	DDEMAP_RPAGE
	ACCESS_DTSB_PTR
	.word	0xc036adc6
	DO_BRANCH
	.word	0x81c5e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02427f8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00b_exit:
	EXIT_GOOD
Thr0_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v107 DATA_VA=0x5ff00001a000
attr_data {
	Name = .Thr0_User_Data_4v107 ,
	VA = 0x5ff00001a000 ,/* 0x5ff00001bfc0 */
	RA = 0x0360192000 ,
	PA = 0x0f60192000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005ff00001bfb0 8000000f60192440 */
	end_label   = Thr0_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v107_data_begin
Thr0_User_Data_4v107_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00c TEXT_VA=0x5ff000134000
attr_text {
	Name = .Thr0_User_Text_4v00c ,
	VA = 0x5ff000134000 ,/* 0x5ff000135fc0 */
	RA = 0x03600f0000 ,
	PA = 0x0f600f0000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005ff000135fb0 8000000f600f0080 */
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
	.word	0x1000000
	or	%g0, 0x059, %i7
	LOAD_IDATA_IN
	.word	0xfcdc1040
	IDEMAP_NCTX
	.word	0xfe4aa0d5
	.word	0xf05aa0d8
	.word	0xc02aad87
	.word	0x1000000
	or	%g0, 0x099, %i7
	LOAD_IDATA_IN
	.word	0xfc9a9100
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
	nop
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x58, %i7
	READ_IDATA_ACCESS
	.word	0xfe5d2b18
	.word	0x1000000
	or	%g0, 0x50, %i7
	READ_DDATA_ACCESS
	.word	0xea70a010
	.word	0xc070ab50
thr0_MMU_ASI_BLK_P_51:
	.word	0x878020f0
	.word	0xc3baad80
	.word	0xe8752038
	.word	0xc02f2589
	IDEMAP_PCTX
	.word	0xfcd91000
	IDEMAP_ALL_PAGES
	.word	0xe6752000
	.word	0xc02c2cf8
	IDEMAP_PCTX
thr0_MMU_ASI_PRIMARY_52:
	.word	0x87802080
	.word	0xf4f62148
	.word	0xfcdf1140
	.word	0xf05aa108
	.word	0xd65e2010
thr0_MMU_ASI_PRIMARY_53:
	.word	0x87802080
	.word	0xe2f62010
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	IDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe108000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x025, %i7
	LOAD_DDATA_IN
	.word	0xd6742090
	.word	0xc02d2cbc
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xc0742c88
	.word	0xbe8720c8
	.word	0xc8dfd000
	ACCESS_ITSB_PTR
	.word	0xfa752050
	.word	0xc02521a4
	DDEMAP_NCTX
	.word	0xfcde1000
	.word	0xfa76a060
	.word	0xc02c2a89
	.word	0x1000000
	or	%g0, 0x168, %i7
	READ_DDATA_ACCESS
	.word	0xe39c1f00
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x369, %i7
	LOAD_DDATA_ACCESS
thr0_MMU_ASI_BLK_S_54:
	.word	0x878020f1
	.word	0xc1bae480
	.word	0xf85d2038
	.word	0xea5e2090
	IDEMAP_NCTX
	TOGGLE_LSU_IM
thr0_MMU_ASI_PRIMARY_55:
	.word	0x87802080
	.word	0xdef120e0
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0xd0, %i7
	DTLB_TAG_READ
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe5aabc8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v00c_exit:
	EXIT_GOOD
Thr0_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v108 DATA_VA=0x61002f800000
attr_data {
	Name = .Thr0_User_Data_4v108 ,
	VA = 0x61002f800000 ,/* 0x61002fbfffc0 */
	RA = 0x025dc00000 ,
	PA = 0x0e5dc00000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000061002f800380 8000000e5dc00443 */
	end_label   = Thr0_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v108_data_begin
Thr0_User_Data_4v108_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00d TEXT_VA=0x5ff000086000
attr_text {
	Name = .Thr0_User_Text_4v00d ,
	VA = 0x5ff000086000 ,/* 0x5ff000087fc0 */
	RA = 0x03601ac000 ,
	PA = 0x0f601ac000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005ff000087fb0 8000000f601ac080 */
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
	.word	0xee72a0d0
	.word	0xc076a938
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x2d0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x118, %i7
	ITLB_TAG_READ
	.word	0xfe472754
	.word	0x1000000
	or	%g0, 0x048, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x019, %i7
	LOAD_IDATA_IN
	.word	0xc85aa160
	DDEMAP_ALL_PAGES
	IDEMAP_ALL
	DDEMAP_ALL_PAGES
	.word	0xc02d29cd
	.word	0xf67520b0
	.word	0xc070a8e8
	nop
	nop
	nop
	nop
thr0_MMU_ASI_SECONDARY_LITTLE_56:
	.word	0x87802089
	.word	0xdaf46140
	.word	0x1000000
	.word	0xbe17c000
	IDEMAP_RPAGE
	.word	0xf8592038
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x058, %i7
	LOAD_DDATA_IN
	.word	0xd45c2088
	.word	0xc0712718
	.word	0xcc76a018
	.word	0xc032a720
	DO_BRANCH
	.word	0x81c5a000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0xfe5eac20
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00d_exit:
	EXIT_GOOD
Thr0_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v109 DATA_VA=0x610019c00000
attr_data {
	Name = .Thr0_User_Data_4v109 ,
	VA = 0x610019c00000 ,/* 0x610019ffffc0 */
	RA = 0x025e000000 ,
	PA = 0x0e5e000000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000610019c00380 8000000e5e000443 */
	end_label   = Thr0_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v109_data_begin
Thr0_User_Data_4v109_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00e TEXT_VA=0x5ff000000000
attr_text {
	Name = .Thr0_User_Text_4v00e ,
	VA = 0x5ff000000000 ,/* 0x5ff000001fc0 */
	RA = 0x03600d2000 ,
	PA = 0x0f600d2000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005ff000001fb0 8000000f600d2080 */
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
	nop
	nop
	nop
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
	or	%g0, 0x57b, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xd270a0f0
	.word	0xc0712548
	.word	0xfe5e2138
	.word	0x1000000
	or	%g0, 0x5f8, %i7
	LOAD_IDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xfc995020
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x411, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_ALL_PAGES
	ACCESS_ITSB_PTR
	DDEMAP_NCTX
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc02aad9a
	DDEMAP_ALL_PAGES
	IDEMAP_PCTX
	.word	0xbe842088
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x013, %i7
	LOAD_DDATA_IN
	.word	0xfe4e22fa
thr0_MMU_ASI_PRIMARY_57:
	.word	0x87802080
	.word	0xc6f52098
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x015, %i7
	LOAD_IDATA_IN
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x0ae, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x7e8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x100, %i7
	READ_IDATA_ACCESS
	.word	0xe85e2138
	.word	0x1000000
	.word	0xbe140000
	DDEMAP_PAGE
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x638, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfcdd1000
	.word	0xfcde1000
	.word	0xce712120
	.word	0xc0742288
	.word	0x1000000
	or	%g0, 0x58, %i7
	ITLB_TAG_READ
thr0_MMU_ASI_PRIMARY_58:
	.word	0x87802080
	.word	0xd8f12018
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x70, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0352586
	.word	0xfcd89000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe562d7a
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00e_exit:
	EXIT_GOOD
Thr0_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10a DATA_VA=0x600000790000
attr_data {
	Name = .Thr0_User_Data_4v10a ,
	VA = 0x600000790000 ,/* 0x60000079ffc0 */
	RA = 0x03e0c70000 ,
	PA = 0x0fe0c70000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000790380 8000000fe0c70441 */
	end_label   = Thr0_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10a_data_begin
Thr0_User_Data_4v10a_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00f TEXT_VA=0x61001e000000
attr_text {
	Name = .Thr0_User_Text_4v00f ,
	VA = 0x61001e000000 ,/* 0x61001e3fffc0 */
	RA = 0x0251000000 ,
	PA = 0x0e51000000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061001e000380 8000000e51000083 */
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
	DDEMAP_ALL_RPAGES
	nop
	nop
	.word	0xf47520a8
	.word	0xc0742c28
	.word	0xc02c28fa
	.word	0xfcda9000
thr0_MMU_ASI_BLK_P_59:
	.word	0x878020f0
	.word	0xe1bea140
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9add60
	TOGGLE_LSU_DM
	TOGGLE_LSU_IM
thr0_MMU_ASI_PRIMARY_LITTLE_60:
	.word	0x87802088
	.word	0xf6f52030
	TOGGLE_LSU_IM
	.word	0xdc772058
	.word	0xc02e2442
	.word	0xe85e2150
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	.word	0xfcde1000
	.word	0x1000000
	or	%g0, 0xfe, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcdd1000
thr0_MMU_ASI_BLK_COMMIT_P_61:
	.word	0x878020e0
	.word	0xc1bc2640
	.word	0xd45c2148
	.word	0x1000000
	or	%g0, 0x042, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c26000
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
	.word	0xc07623e8
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	READ_DDATA_ACCESS
	.word	0xc02723c8
	IDEMAP_ALL
	.word	0xc0352170
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x047, %i7
	LOAD_IDATA_IN
	.word	0xfcda9000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4cc, %i7
	LOAD_DDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x04f, %i7
	LOAD_DDATA_IN
	ACCESS_DTSB_PTR
	.word	0xfe4eac43
	.word	0x1000000
	or	%g0, 0x01f, %i7
	LOAD_DDATA_IN
thr0_MMU_ASI_PRIMARY_62:
	.word	0x87802080
	.word	0xecf120f0
	.word	0x1000000
	or	%g0, 0xd0, %i7
	ITLB_TAG_READ
	.word	0xfcd95120
thr0_MMU_ASI_PRIMARY_63:
	.word	0x87802080
	.word	0xe0f720b8
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xe8772118
	.word	0xc0252d48
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00f_exit:
	EXIT_GOOD
Thr0_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10b DATA_VA=0x600000010000
attr_data {
	Name = .Thr0_User_Data_4v10b ,
	VA = 0x600000010000 ,/* 0x60000001ffc0 */
	RA = 0x03e0c10000 ,
	PA = 0x0fe0c10000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000010380 8000000fe0c10441 */
	end_label   = Thr0_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10b_data_begin
Thr0_User_Data_4v10b_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v010 TEXT_VA=0x6000009d0000
attr_text {
	Name = .Thr0_User_Text_4v010 ,
	VA = 0x6000009d0000 ,/* 0x6000009dffc0 */
	RA = 0x03e0230000 ,
	PA = 0x0fe0230000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006000009d0380 8000000fe0230081 */
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
thr0_MMU_ASI_PRIMARY_64:
	.word	0x87802080
	.word	0xf6f72000
thr0_MMU_ASI_PRIMARY_65:
	.word	0x87802080
	.word	0xe6f0a000
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x30, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x584, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x130, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x470, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xa8, %i7
	READ_IDATA_ACCESS
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x578, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x528, %i7
	ITLB_TAG_READ
	IDEMAP_ALL_PAGES
	IDEMAP_PCTX
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DDEMAP_PCTX
thr0_MMU_ASI_BLK_P_66:
	.word	0x878020f0
	.word	0xc1baa240
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xf058a168
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v010_exit:
	EXIT_GOOD
Thr0_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10c DATA_VA=0x600000930000
attr_data {
	Name = .Thr0_User_Data_4v10c ,
	VA = 0x600000930000 ,/* 0x60000093ffc0 */
	RA = 0x03e0d10000 ,
	PA = 0x0fe0d10000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000930380 8000000fe0d10441 */
	end_label   = Thr0_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10c_data_begin
Thr0_User_Data_4v10c_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v011 TEXT_VA=0x5ff0000b2000
attr_text {
	Name = .Thr0_User_Text_4v011 ,
	VA = 0x5ff0000b2000 ,/* 0x5ff0000b3fc0 */
	RA = 0x036010e000 ,
	PA = 0x0f6010e000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005ff0000b3fb0 8000000f6010e080 */
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
	.word	0xc02c2170
	.word	0xfcdc1000
	DO_BRANCH
	.word	0x81c5a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0xbe82a008
	.word	0xd4dfd000
thr0_MMU_ASI_PRIMARY_67:
	.word	0x87802080
	.word	0xdcf42058
	DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x2e8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x540, %i7
	READ_IDATA_ACCESS
	.word	0xc02aacc5
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_ALL
	.word	0xf05aa0a8
	.word	0x1000000
	or	%g0, 0x55b, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4d2956
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr0_MMU_ASI_BLK_COMMIT_P_68:
	.word	0x878020e0
	.word	0xc3be2580
	.word	0x1000000
	or	%g0, 0xd8, %i7
	READ_IDATA_ACCESS
	.word	0xde712050
	.word	0xc0742fb0
	.word	0xc0212db4
	IDEMAP_NCTX
	.word	0xfe552882
	.word	0xbe842068
	.word	0xf0dfd040
thr0_MMU_ASI_SECONDARY_69:
	.word	0x87802081
	.word	0xe8f2e148
	nop
	nop
	.word	0xca5c2010
	.word	0xc07428f0
	DO_BRANCH
	.word	0x81c5e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe562c0c
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v011_exit:
	EXIT_GOOD
Thr0_User_Text_4v011_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10d DATA_VA=0x5ff000080000
attr_data {
	Name = .Thr0_User_Data_4v10d ,
	VA = 0x5ff000080000 ,/* 0x5ff000081fc0 */
	RA = 0x0360042000 ,
	PA = 0x0f60042000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005ff000081fb0 8000000f60042440 */
	end_label   = Thr0_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10d_data_begin
Thr0_User_Data_4v10d_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v012 TEXT_VA=0x600000050000
attr_text {
	Name = .Thr0_User_Text_4v012 ,
	VA = 0x600000050000 ,/* 0x60000005ffc0 */
	RA = 0x03e0890000 ,
	PA = 0x0fe0890000 ,
	TTE_Context = 0x0380 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000050380 8000000fe0890081 */
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
	.word	0xc0772f68
	.word	0xd6762010
	.word	0xc02e26db
	.word	0x1000000
	.word	0xbe15c000
	DDEMAP_RPAGE
	nop
	nop
	nop
	.word	0xc030aae8
	.word	0xbe816070
	.word	0xc19fde20
	ACCESS_DTSB_PTR
	.word	0xe85ea038
	.word	0xe85d2008
	.word	0xbe852038
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x335, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x031, %i7
	LOAD_IDATA_IN
	DDEMAP_ALL_PAGES
	.word	0xc02aa835
	.word	0xfe5aa928
	IDEMAP_NCTX
thr0_MMU_ASI_BLK_COMMIT_P_70:
	.word	0x878020e0
	.word	0xe1bf2b00
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe3995e20
	.word	0xd65c2010
	.word	0x1000000
	or	%g0, 0x180, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x580, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe134000
	IDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe442f4c
	.word	0x81c5a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v012_exit:
	EXIT_GOOD
Thr0_User_Text_4v012_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10e DATA_VA=0x610036000000
attr_data {
	Name = .Thr0_User_Data_4v10e ,
	VA = 0x610036000000 ,/* 0x6100363fffc0 */
	RA = 0x0259800000 ,
	PA = 0x0e59800000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000610036000380 8000000e59800443 */
	end_label   = Thr0_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10e_data_begin
Thr0_User_Data_4v10e_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10f DATA_VA=0x5ff00000c000
attr_data {
	Name = .Thr0_User_Data_4v10f ,
	VA = 0x5ff00000c000 ,/* 0x5ff00000dfc0 */
	RA = 0x03601d2000 ,
	PA = 0x0f601d2000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005ff00000dfb0 8000000f601d2440 */
	end_label   = Thr0_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10f_data_begin
Thr0_User_Data_4v10f_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v110 DATA_VA=0x5ff000136000
attr_data {
	Name = .Thr0_User_Data_4v110 ,
	VA = 0x5ff000136000 ,/* 0x5ff000137fc0 */
	RA = 0x03601de000 ,
	PA = 0x0f601de000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005ff000137fb0 8000000f601de440 */
	end_label   = Thr0_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v110_data_begin
Thr0_User_Data_4v110_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v111 DATA_VA=0x5ff00003c000
attr_data {
	Name = .Thr0_User_Data_4v111 ,
	VA = 0x5ff00003c000 ,/* 0x5ff00003dfc0 */
	RA = 0x03600a8000 ,
	PA = 0x0f600a8000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005ff00003dfb0 8000000f600a8440 */
	end_label   = Thr0_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v111_data_begin
Thr0_User_Data_4v111_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v112 DATA_VA=0x600000e80000
attr_data {
	Name = .Thr0_User_Data_4v112 ,
	VA = 0x600000e80000 ,/* 0x600000e8ffc0 */
	RA = 0x03e0b30000 ,
	PA = 0x0fe0b30000 ,
	TTE_Context = 0x0380 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000e80380 8000000fe0b30441 */
	end_label   = Thr0_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v112_data_begin
Thr0_User_Data_4v112_data_begin:
	.xword	0x620640000000
	.xword	0x5ff000150000
	.xword	0x600000c60000
	.xword	0x610030800000
	.xword	0x5ff000130000
	.xword	0x5ff00010a000
	.xword	0x5ff000152000
	.xword	0x5ff00002e000
	.xword	0x5ff000084000
	.xword	0x600000ef0000
	.xword	0x600000780000
	.xword	0x5ff000094000
	.xword	0x610005c00000
	.xword	0x61002e800000
	.xword	0x610030400000
	.xword	0x61001a400000
	.xword	0x61002a400000
	.xword	0x600000220000
	.xword	0x610024c00000
	.xword	0x5ff00019c000
	.xword	0x610007000000
	.xword	0x600000a50000
	.xword	0x610025c00000
	.xword	0x5ff0000a4000
	.xword	0x5ff000046000
	.xword	0x5ff000156000
	.xword	0x5ff000012000
	.xword	0x5ff00001a000
	.xword	0x5ff000134000
	.xword	0x61002f800000
	.xword	0x5ff000086000
	.xword	0x610019c00000
	.xword	0x5ff000000000
	.xword	0x600000790000
	.xword	0x61001e000000
	.xword	0x600000010000
	.xword	0x6000009d0000
	.xword	0x600000930000
	.xword	0x5ff0000b2000
	.xword	0x5ff000080000
	.xword	0x600000050000
	.xword	0x610036000000
	.xword	0x5ff00000c000
	.xword	0x5ff000136000
	.xword	0x5ff00003c000
	.xword	0x600000e80000
Thr0_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x6310001f2000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	VA = 0x6310001f2000 ,/* 0x6310001f3fc0 */
	RA = 0x0370138000 ,
	PA = 0x0370138000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006310001f2326 8000000370138080 */
	end_label   = Thr1_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr1_user_code_entry
Thr1_user_code_entry:
	setx	0x640000ae0000, %g1, %g2
	or	%g0, 16, %g1
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
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd6776010
	.word	0xc0242dd4
	DDEMAP_SCTX
	.word	0xf65aa008
	nop
	nop
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
	.word	0x1000000
	or	%g0, 0x579, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_PCTX
thr1_MMU_ASI_PRIMARY_71:
	.word	0x87802080
	.word	0xf2f2a068
	.word	0x1000000
	or	%g0, 0x056, %i7
	LOAD_DDATA_IN
	DDEMAP_PCTX
	.word	0xbe8660c0
	.word	0xd4dfd000
	.word	0xbe842100
	.word	0xc8dfd040
	.word	0xfc9c5c60
thr1_MMU_ASI_PRIMARY_72:
	.word	0x87802080
	.word	0xd2f42128
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfcdc5120
	.word	0xc022a6f8
	ACCESS_ITSB_PTR
	.word	0xc025a73c
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x021, %i7
	LOAD_IDATA_IN
	.word	0xfcd89000
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xec5aa098
thr1_MMU_ASI_BLK_COMMIT_P_73:
	.word	0x878020e0
	.word	0xe1bdad40
thr1_MMU_ASI_PRIMARY_74:
	.word	0x87802080
	.word	0xeaf42090
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc030a7e2
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	.word	0xf272a068
	.word	0xc0776970
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd45da130
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v000_exit:
	EXIT_GOOD
Thr1_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v100 DATA_VA=0x640000ae0000
attr_data {
	Name = .Thr1_User_Data_4v100 ,
	VA = 0x640000ae0000 ,/* 0x640000aeffc0 */
	RA = 0x03f0c30000 ,
	PA = 0x1ff0c30000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000ae0326 8000001ff0c30041 */
	end_label   = Thr1_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v100_data_begin
Thr1_User_Data_4v100_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v200 DATA_VA=0x640000d60000
attr_data {
	Name = .Thr1_User_Data_4v200 ,
	VA = 0x640000d60000 ,/* 0x640000d6ffc0 */
	RA = 0x03f0dd0000 ,
	PA = 0x1ff0dd0000 ,
	TTE_Context = 0x1d03 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000640000d61d03 8000001ff0dd0441 */
	end_label   = Thr1_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v200_data_begin
Thr1_User_Data_4v200_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v300 DATA_VA=0x640000620000
attr_data {
	Name = .Thr1_User_Data_4v300 ,
	VA = 0x640000620000 ,/* 0x64000062ffc0 */
	RA = 0x03f02f0000 ,
	PA = 0x03f02f0000 ,
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
	/* DTTE_TAG_DATA = 0000640000620000 80000003f02f0441 */
	end_label   = Thr1_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v300_data_begin
Thr1_User_Data_4v300_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v001 TEXT_VA=0x640000990000
attr_text {
	Name = .Thr1_User_Text_4v001 ,
	VA = 0x640000990000 ,/* 0x64000099ffc0 */
	RA = 0x03f0f60000 ,
	PA = 0x1ff0f60000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000640000990326 8000001ff0f60081 */
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
	.word	0x1000000
	or	%g0, 0x430, %i7
	DTLB_TAG_READ
	DDEMAP_ALL_PAGES
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xe05ee098
	.word	0xfa5f6068
	.word	0x1000000
	or	%g0, 0x658, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x0b4, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x0b5, %i7
	LOAD_DDATA_IN
	.word	0xbe85a038
	.word	0xe0dfd000
	.word	0xfe45ae8c
	.word	0xfe4da2aa
	ACCESS_DTSB_PTR
	.word	0xbe82a098
	.word	0xf6dfd000
	.word	0xfe5c2598
	.word	0xbe138000
	GOTO_SUPERVISOR1
	IDEMAP_NCTX
thr1_MMU_ASI_BLK_SL_75:
	.word	0x878020f9
	.word	0xc3b96c80
	.word	0xfc995c60
	.word	0xca5e6070
	.word	0x1000000
	.word	0xbe160000
	IDEMAP_PAGE
	nop
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	ACCESS_DTSB_PTR
thr1_MMU_ASI_PRIMARY_76:
	.word	0x87802080
	.word	0xe0f2a0c0
	IDEMAP_PCTX
	.word	0xe05da038
	.word	0xfcd91000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x084, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL_PAGES
	IDEMAP_ALL
	.word	0xd45e6110
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x180, %i7
	READ_IDATA_ACCESS
	.word	0xfe42aa9c
	DDEMAP_SCTX
	nop
	nop
	nop
	.word	0xe1995f20
	.word	0x1000000
	or	%g0, 0xd0, %i7
	LOAD_DDATA_ACCESS
	.word	0xc0366d2e
	.word	0xfcdc1100
	.word	0x1000000
	or	%g0, 0x748, %i7
	DTLB_TAG_READ
	.word	0xfe4e64d5
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	READ_DDATA_ACCESS
	nop
	nop
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_RPAGES
	.word	0xbe82a098
	.word	0xd4dfd000
	.word	0xec76e0c0
	.word	0xc02aa821
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x000, %i7
	LOAD_DDATA_IN
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x082, %i7
	LOAD_DDATA_IN
	.word	0xc0276870
	.word	0xfcd95120
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xfe55a8d8
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v001_exit:
	EXIT_GOOD
Thr1_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v400 TEXT_VA=0x631000016000
attr_text {
	Name = .Thr1_User_Text_4v400 ,
	VA = 0x631000016000 ,/* 0x631000017fc0 */
	RA = 0x037017e000 ,
	PA = 0x037017e000 ,
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
	/* ITTE_TAG_DATA = 0000631000016000 800000037017e480 */
	end_label   = Thr1_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v400_text_begin
Thr1_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xfcdc1000
	.word	0xfc9c84e0
	.word	0x1000000
	or	%g0, 0x548, %i7
	P_READ_DDATA_ACCESS
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x180, %i7
	P_ITLB_TAG_READ
	.word	0xc029ace1
thr1_MMU_ASI_AS_IF_USER_PRIMARY_77:
	.word	0x87802010
	.word	0xd8f5a018
thr1_MMU_ASI_AS_IF_USER_PRIMARY_78:
	.word	0x87802010
	.word	0xe2f2a010
	P_TOGGLE_LSU_IM
	.word	0xfcdc1000
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_79:
	.word	0x8780202a
	.word	0xccb8aa10
	.word	0x1000000
	or	%g0, 0x3c0, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe85a038
	.word	0xd4dfd000
	.word	0xfcdc0200
	.word	0xfcdd8200
	.word	0x1000000
	.word	0xbe130000
	P_IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x087, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_PRIMARY_80:
	.word	0x87802080
	.word	0xe0f2a068
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	P_ITLB_TAG_READ
thr1_MMU_ASI_AS_IF_USER_PRIMARY_81:
	.word	0x87802010
	.word	0xe2f42070
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x488, %i7
	P_READ_IDATA_ACCESS
	.word	0xea75e020
	.word	0xc031ab70
	.word	0x1000000
	or	%g0, 0x148, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x13e, %i7
	P_LOAD_IDATA_ACCESS
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x082, %i7
	P_LOAD_DDATA_IN
	P_ACCESS_ITSB_PTR
	.word	0xfa59a038
	.word	0xfcde5000
	.word	0x1000000
	or	%g0, 0x539, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfe49a286
	P_DDEMAP_NCTX
	.word	0xe19c5f20
	P_ACCESS_DTSB_PTR
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v400_exit:
	EXIT_GOOD
Thr1_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v002 TEXT_VA=0x640000200000
attr_text {
	Name = .Thr1_User_Text_4v002 ,
	VA = 0x640000200000 ,/* 0x64000020ffc0 */
	RA = 0x03f0d90000 ,
	PA = 0x1ff0d90000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000640000200326 8000001ff0d90081 */
	end_label   = Thr1_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v002_text_begin
Thr1_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0xc19c5e20
thr1_MMU_ASI_AS_IF_USER_PRIMARY_82:
	.word	0x87802010
	.word	0xc8f2a0f0
	.word	0x1000000
	or	%g0, 0x350, %i7
	P_DTLB_TAG_READ
	.word	0xbe816010
	.word	0xe39fde20
	.word	0xfcdc0200
	.word	0xfc998580
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	P_READ_IDATA_ACCESS
	P_IDEMAP_ALL
	.word	0xfcdc1000
	P_DDEMAP_ALL
	.word	0xfc9dc5e0
	.word	0xfcdd9000
	.word	0xce712050
	.word	0xc02f6cba
	.word	0xfcd90200
	.word	0x1000000
	or	%g0, 0x066, %i7
	P_LOAD_IDATA_IN
	P_DDEMAP_ALL_RPAGES
thr1_MMU_ASI_PRIMARY_83:
	.word	0x87802080
	.word	0xfaf420b0
	.word	0x1000000
	.word	0xbe144000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x20, %i7
	P_ITLB_TAG_READ
thr1_MMU_ASI_AS_IF_USER_PRIMARY_84:
	.word	0x87802010
	.word	0xd6f42010
	.word	0xbe812038
	.word	0xe0dfd000
	.word	0xfe4aaece
thr1_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_85:
	.word	0x87802018
	.word	0xd8f2a048
thr1_MMU_ASI_PRIMARY_86:
	.word	0x87802080
	.word	0xeef5a048
	.word	0x1000000
	or	%g0, 0x424, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xfcd90200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe45a734
	P_DDEMAP_ALL_PAGES
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v002_exit:
	EXIT_GOOD
Thr1_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v101 DATA_VA=0x631000048000
attr_data {
	Name = .Thr1_User_Data_4v101 ,
	VA = 0x631000048000 ,/* 0x631000049fc0 */
	RA = 0x037001a000 ,
	PA = 0x037001a000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000631000048326 800000037001a040 */
	end_label   = Thr1_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v101_data_begin
Thr1_User_Data_4v101_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v201 DATA_VA=0x6607d0000000
attr_data {
	Name = .Thr1_User_Data_4v201 ,
	VA = 0x6607d0000000 ,/* 0x6607dfffffc0 */
	RA = 0x0080000000 ,
	PA = 0x1c80000000 ,
	TTE_Context = 0x1d03 ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_0 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 00006607d0001d03 8000001c80000445 */
	end_label   = Thr1_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v201_data_begin
Thr1_User_Data_4v201_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v301 DATA_VA=0x6400004c0000
attr_data {
	Name = .Thr1_User_Data_4v301 ,
	VA = 0x6400004c0000 ,/* 0x6400004cffc0 */
	RA = 0x03f0180000 ,
	PA = 0x03f0180000 ,
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
	/* DTTE_TAG_DATA = 00006400004c0000 80000003f0180441 */
	end_label   = Thr1_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v301_data_begin
Thr1_User_Data_4v301_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v003 TEXT_VA=0x650010000000
attr_text {
	Name = .Thr1_User_Text_4v003 ,
	VA = 0x650010000000 ,/* 0x6500103fffc0 */
	RA = 0x0266800000 ,
	PA = 0x1e66800000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006500100005ce 8000001e66800083 */
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
	.word	0xfcde5000
	.word	0xc0766e28
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x044, %i7
	LOAD_IDATA_IN
	.word	0xfcded000
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe25f6010
	.word	0xfcdd9000
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x00f, %i7
	LOAD_DDATA_IN
thr1_MMU_ASI_PRIMARY_87:
	.word	0x87802080
	.word	0xcef12020
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
	or	%g0, 0x108, %i7
	READ_IDATA_ACCESS
	.word	0xbe85a038
	.word	0xe0dfd000
	.word	0xfcded000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe55a5d0
	IDEMAP_PCTX
	.word	0xd45aa110
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0xbe86e0f0
	.word	0xc39fde00
	.word	0xbe86e038
	.word	0xd4dfd000
	.word	0xfe5e6ae8
	.word	0x1000000
	.word	0xbe17c000
	IDEMAP_PAGE
	.word	0xfc9ad020
	DDEMAP_ALL_RPAGES
	.word	0xbe8420b0
	.word	0xf2dfd000
	.word	0x1000000
	or	%g0, 0x338, %i7
	DTLB_TAG_READ
	DDEMAP_ALL_RPAGES
	.word	0xcc5da078
	.word	0x1000000
	or	%g0, 0x075, %i7
	LOAD_IDATA_IN
	.word	0xfcde5000
	.word	0xc02c2db1
	IDEMAP_NCTX
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfcda9040
	DDEMAP_ALL
	.word	0x1000000
	.word	0xbe154000
	IDEMAP_RPAGE
	.word	0xfcda9000
	.word	0xfe442b78
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4c218d
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v003_exit:
	EXIT_GOOD
Thr1_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v401 TEXT_VA=0x65000d800000
attr_text {
	Name = .Thr1_User_Text_4v401 ,
	VA = 0x65000d800000 ,/* 0x65000dbfffc0 */
	RA = 0x0268400000 ,
	PA = 0x1e68400000 ,
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
	/* ITTE_TAG_DATA = 000065000d800000 8000001e68400483 */
	end_label   = Thr1_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v401_text_begin
Thr1_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x027, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda9000
	P_TOGGLE_LSU_DM
	.word	0xe1995e20
	.word	0x1000000
	.word	0xbe118000
	P_IDEMAP_PAGE
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_88:
	.word	0x8780202a
	.word	0xecbc2140
	.word	0x1000000
	or	%g0, 0x08e, %i7
	P_LOAD_DDATA_IN
thr1_MMU_ASI_AS_IF_USER_PRIMARY_89:
	.word	0x87802010
	.word	0xdaf2a0e8
	.word	0xfcdc5160
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
	.word	0xe0dfc200
	.word	0xfcdc1000
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x49, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe85a0f0
	.word	0xc39fc2c0
	P_DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc029a3fa
	nop
	nop
thr1_MMU_ASI_PRIMARY_90:
	.word	0x87802080
	.word	0xcef2a118
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a110
	.word	0xd4dfd000
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v401_exit:
	EXIT_GOOD
Thr1_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v004 TEXT_VA=0x640000a60000
attr_text {
	Name = .Thr1_User_Text_4v004 ,
	VA = 0x640000a60000 ,/* 0x640000a6ffc0 */
	RA = 0x03f0d30000 ,
	PA = 0x1ff0d30000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000640000a60326 8000001ff0d30081 */
	end_label   = Thr1_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v004_text_begin
Thr1_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xfa5e6038
	nop
	nop
	nop
	nop
	P_ACCESS_ITSB_PTR
	nop
	.word	0x1000000
	or	%g0, 0xcc, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc075a8b8
	P_DDEMAP_PCTX
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x420, %i7
	P_ITLB_TAG_READ
	.word	0xbe876110
	.word	0xe0dfd000
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v004_exit:
	EXIT_GOOD
Thr1_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v102 DATA_VA=0x6400003f0000
attr_data {
	Name = .Thr1_User_Data_4v102 ,
	VA = 0x6400003f0000 ,/* 0x6400003fffc0 */
	RA = 0x03f0a80000 ,
	PA = 0x1ff0a80000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006400003f0326 8000001ff0a80041 */
	end_label   = Thr1_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v102_data_begin
Thr1_User_Data_4v102_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v202 DATA_VA=0x63100012a000
attr_data {
	Name = .Thr1_User_Data_4v202 ,
	VA = 0x63100012a000 ,/* 0x63100012bfc0 */
	RA = 0x03700c0000 ,
	PA = 0x03700c0000 ,
	TTE_Context = 0x1d03 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000063100012bd03 80000003700c0440 */
	end_label   = Thr1_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v202_data_begin
Thr1_User_Data_4v202_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v302 DATA_VA=0x6400003c0000
attr_data {
	Name = .Thr1_User_Data_4v302 ,
	VA = 0x6400003c0000 ,/* 0x6400003cffc0 */
	RA = 0x03f0120000 ,
	PA = 0x03f0120000 ,
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
	/* DTTE_TAG_DATA = 00006400003c0000 80000003f0120441 */
	end_label   = Thr1_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v302_data_begin
Thr1_User_Data_4v302_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v005 TEXT_VA=0x640000400000
attr_text {
	Name = .Thr1_User_Text_4v005 ,
	VA = 0x640000400000 ,/* 0x64000040ffc0 */
	RA = 0x03f0280000 ,
	PA = 0x1ff0280000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000640000400326 8000001ff0280081 */
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
	.word	0x1000000
	or	%g0, 0x600, %i7
	READ_DDATA_ACCESS
	.word	0xc45da100
	.word	0xbe86e0f0
	.word	0xc8dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf25c2008
	nop
	nop
	nop
	nop
	.word	0xbe866008
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xf25da038
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x498, %i7
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
	nop
	nop
	nop
	nop
	nop
	.word	0xc036ee48
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe118000
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
	.word	0x1000000
	or	%g0, 0x098, %i7
	LOAD_DDATA_IN
	.word	0xc0242288
	.word	0xe05aa038
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_BLK_SL_91:
	.word	0x878020f9
	.word	0xc1b96680
	.word	0xf075a030
	.word	0xc0342baa
	.word	0x1000000
	or	%g0, 0x196, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_RPAGES
	.word	0xe05c2038
	.word	0x1000000
	or	%g0, 0x178, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0xe075a038
	.word	0xc030ae04
	.word	0xc025ad1c
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x540, %i7
	READ_IDATA_ACCESS
	DDEMAP_NCTX
	nop
	nop
thr1_MMU_ASI_PRIMARY_92:
	.word	0x87802080
	.word	0xdcf2a088
	.word	0x1000000
	or	%g0, 0x010, %i7
	LOAD_IDATA_IN
	.word	0xc076e540
	IDEMAP_ALL
	nop
thr1_MMU_ASI_SECONDARY_93:
	.word	0x87802081
	.word	0xf8b963c0
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xee5e6078
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v005_exit:
	EXIT_GOOD
Thr1_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v402 TEXT_VA=0x640000bf0000
attr_text {
	Name = .Thr1_User_Text_4v402 ,
	VA = 0x640000bf0000 ,/* 0x640000bfffc0 */
	RA = 0x03f0f80000 ,
	PA = 0x03f0f80000 ,
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
	/* ITTE_TAG_DATA = 0000640000bf0000 80000003f0f80481 */
	end_label   = Thr1_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v402_text_begin
Thr1_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xbe85a0d0
	.word	0xe0dfc200
	P_TOGGLE_LSU_DM
	P_TOGGLE_LSU_IM
thr1_MMU_ASI_PRIMARY_94:
	.word	0x87802080
	.word	0xe0f42008
	.word	0xc39942e0
	.word	0x1000000
	or	%g0, 0xf0, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x5d0, %i7
	P_LOAD_DDATA_ACCESS
	P_IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0xa5, %i7
	P_LOAD_DDATA_ACCESS
	P_DDEMAP_ALL_PAGES
	.word	0xe19942e0
	.word	0xfcd94220
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_95:
	.word	0x87802022
	.word	0xd8bc2e70
	.word	0xe39c43e0
	.word	0xca5de010
	.word	0x1000000
	or	%g0, 0x30, %i7
	P_READ_IDATA_ACCESS
thr1_MMU_ASI_SECONDARY_LITTLE_96:
	.word	0x87802089
	.word	0xfcb96320
thr1_MMU_ASI_AS_IF_USER_PRIMARY_97:
	.word	0x87802010
	.word	0xd8f76018
	.word	0x1000000
	.word	0xbe120000
	P_IDEMAP_RPAGE
	.word	0xc021a214
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x78, %i7
	P_READ_DDATA_ACCESS
	P_DDEMAP_ALL_PAGES
	P_DDEMAP_SCTX
	.word	0xfe51a57c
	.word	0xfc9dc580
	.word	0x1000000
	or	%g0, 0x05f, %i7
	P_LOAD_DDATA_IN
	.word	0xfe4de815
	.word	0xc031aa08
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe148000
	P_IDEMAP_PAGE
	.word	0xbe86e098
	.word	0xf2dfd000
	P_DDEMAP_PCTX
thr1_MMU_ASI_SECONDARY_LITTLE_98:
	.word	0x87802089
	.word	0xc0bc6540
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v402_exit:
	EXIT_GOOD
Thr1_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v006 TEXT_VA=0x650031400000
attr_text {
	Name = .Thr1_User_Text_4v006 ,
	VA = 0x650031400000 ,/* 0x6500317fffc0 */
	RA = 0x026a400000 ,
	PA = 0x1e6a400000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006500314005ce 8000001e6a400083 */
	end_label   = Thr1_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v006_text_begin
Thr1_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0xbe82a038
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe10c000
	P_DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe80a098
	.word	0xf2dfc200
	P_TOGGLE_LSU_DM
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v006_exit:
	EXIT_GOOD
Thr1_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v103 DATA_VA=0x650004800000
attr_data {
	Name = .Thr1_User_Data_4v103 ,
	VA = 0x650004800000 ,/* 0x650004bfffc0 */
	RA = 0x0266c00000 ,
	PA = 0x1e66c00000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006500048005ce 8000001e66c00043 */
	end_label   = Thr1_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v103_data_begin
Thr1_User_Data_4v103_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v303 DATA_VA=0x640000350000
attr_data {
	Name = .Thr1_User_Data_4v303 ,
	VA = 0x640000350000 ,/* 0x64000035ffc0 */
	RA = 0x03f0040000 ,
	PA = 0x03f0040000 ,
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
	/* DTTE_TAG_DATA = 0000640000350000 80000003f0040441 */
	end_label   = Thr1_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v303_data_begin
Thr1_User_Data_4v303_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v007 TEXT_VA=0x640000500000
attr_text {
	Name = .Thr1_User_Text_4v007 ,
	VA = 0x640000500000 ,/* 0x64000050ffc0 */
	RA = 0x03f0bd0000 ,
	PA = 0x1ff0bd0000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000640000500326 8000001ff0bd0081 */
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
	.word	0xbe124000
	IDEMAP_PAGE
	.word	0xe4742018
	.word	0xc0212d44
	.word	0x1000000
	or	%g0, 0x538, %i7
	READ_DDATA_ACCESS
	.word	0xc03429ce
	.word	0xc0276614
	.word	0xbe82a068
	.word	0xecdfd040
	.word	0x1000000
	.word	0xbe120000
	DDEMAP_PAGE
	.word	0xbe842068
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x000, %i7
	LOAD_IDATA_IN
	ACCESS_DTSB_PTR
	.word	0xc675a0b8
	.word	0xc075a180
	.word	0x1000000
	or	%g0, 0x458, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe42a680
	.word	0xd45c20e0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfcdc5120
	.word	0xe0766130
	.word	0xc02669fc
	IDEMAP_PCTX
	.word	0xc85c20c0
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	READ_DDATA_ACCESS
	.word	0xc875a138
	.word	0xc0766960
	.word	0xf875a090
	.word	0xc030a974
	.word	0xda766108
	.word	0xc0342b66
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0366ccc
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v007_exit:
	EXIT_GOOD
Thr1_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v104 DATA_VA=0x640000830000
attr_data {
	Name = .Thr1_User_Data_4v104 ,
	VA = 0x640000830000 ,/* 0x64000083ffc0 */
	RA = 0x03f0e00000 ,
	PA = 0x1ff0e00000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000830326 8000001ff0e00041 */
	end_label   = Thr1_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v104_data_begin
Thr1_User_Data_4v104_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v008 TEXT_VA=0x640000c90000
attr_text {
	Name = .Thr1_User_Text_4v008 ,
	VA = 0x640000c90000 ,/* 0x640000c9ffc0 */
	RA = 0x03f07e0000 ,
	PA = 0x1ff07e0000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000640000c90326 8000001ff07e0081 */
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
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
thr1_MMU_ASI_PRIMARY_99:
	.word	0x87802080
	.word	0xd8f12018
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe108000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x060, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe16c000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x170, %i7
	READ_IDATA_ACCESS
	.word	0xfe56e49e
	.word	0xc035a1c8
	.word	0xc0242250
thr1_MMU_ASI_PRIMARY_100:
	.word	0x87802080
	.word	0xd0f76028
	.word	0xbe842130
	.word	0xd4dfd040
	.word	0xc02e6180
	ACCESS_DTSB_PTR
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd85c2018
	.word	0xc85aa038
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xcc5da018
	.word	0x1000000
	or	%g0, 0x02f, %i7
	LOAD_DDATA_IN
	.word	0xfe4e6e73
	nop
	nop
	.word	0x1000000
	or	%g0, 0x007, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x058, %i7
	LOAD_IDATA_IN
	.word	0xc0366d16
	.word	0x1000000
	or	%g0, 0x13d, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xdc75a088
	.word	0xc02da745
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v008_exit:
	EXIT_GOOD
Thr1_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v105 DATA_VA=0x6310000b0000
attr_data {
	Name = .Thr1_User_Data_4v105 ,
	VA = 0x6310000b0000 ,/* 0x6310000b1fc0 */
	RA = 0x0370094000 ,
	PA = 0x0370094000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006310000b0326 8000000370094040 */
	end_label   = Thr1_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v105_data_begin
Thr1_User_Data_4v105_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v009 TEXT_VA=0x660650000000
attr_text {
	Name = .Thr1_User_Text_4v009 ,
	VA = 0x660650000000 ,/* 0x66065fffffc0 */
	RA = 0x02e0000000 ,
	PA = 0x1ee0000000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 0000660650000326 8000001ee0000085 */
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
	.word	0xbe85a120
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x470, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_DM
	TOGGLE_LSU_IM
	.word	0xc02c242e
thr1_MMU_ASI_PRIMARY_101:
	.word	0x87802080
	.word	0xe4f42078
	DDEMAP_ALL
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x056, %i7
	LOAD_DDATA_IN
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcde5000
	TOGGLE_LSU_IM
	IDEMAP_ALL
	.word	0x1000000
	.word	0xbe130000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x50, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xe8, %i7
	DTLB_TAG_READ
	.word	0xca5da010
thr1_MMU_ASI_PRIMARY_102:
	.word	0x87802080
	.word	0xf4f42080
thr1_MMU_ASI_PRIMARY_103:
	.word	0x87802080
	.word	0xc4f66008
	.word	0xe675a050
	.word	0xc075a510
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdc1000
	.word	0xbe866068
	.word	0xd4dfd000
	DDEMAP_SCTX
	.word	0xc6742080
	.word	0xc02aa94a
	IDEMAP_PCTX
	.word	0xfcda9000
	.word	0xde75a050
	.word	0xc02dae8f
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x28, %i7
	ITLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe12c000
	DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe118000
	DDEMAP_RPAGE
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x084, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x590, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x022, %i7
	LOAD_IDATA_IN
	IDEMAP_ALL_RPAGES
	.word	0xfc991100
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x218, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	.word	0xd85aa078
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	READ_IDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0292420
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v009_exit:
	EXIT_GOOD
Thr1_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v106 DATA_VA=0x6400002f0000
attr_data {
	Name = .Thr1_User_Data_4v106 ,
	VA = 0x6400002f0000 ,/* 0x6400002fffc0 */
	RA = 0x03f0ad0000 ,
	PA = 0x1ff0ad0000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006400002f0326 8000001ff0ad0041 */
	end_label   = Thr1_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v106_data_begin
Thr1_User_Data_4v106_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00a TEXT_VA=0x63100014c000
attr_text {
	Name = .Thr1_User_Text_4v00a ,
	VA = 0x63100014c000 ,/* 0x63100014dfc0 */
	RA = 0x0370142000 ,
	PA = 0x0370142000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063100014c326 8000000370142080 */
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
	.word	0xfcdd9040
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
	.word	0xbe11c000
	IDEMAP_PAGE
	IDEMAP_PCTX
	.word	0xca72a010
	.word	0xc0212140
	.word	0xca70a070
	.word	0xc022a4e0
	ACCESS_DTSB_PTR
	.word	0xbe82a038
	.word	0xe0dfd000
	.word	0xd45da098
	.word	0x1000000
	or	%g0, 0x009, %i7
	LOAD_IDATA_IN
	.word	0xe05e60f0
	.word	0xc02da997
	DDEMAP_ALL
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
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
	nop
	nop
thr1_MMU_ASI_PRIMARY_104:
	.word	0x87802080
	.word	0xd8f76048
	.word	0x1000000
	or	%g0, 0x10b, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x078, %i7
	LOAD_IDATA_IN
	.word	0xe05f6038
	TOGGLE_LSU_IM
	.word	0xc4776038
	.word	0xc022add0
	ACCESS_DTSB_PTR
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x07e, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdc5160
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x047, %i7
	LOAD_IDATA_IN
	.word	0xfe4c2252
	.word	0xfe56e5d0
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xcc5aa018
	IDEMAP_ALL_RPAGES
	.word	0xca742010
	.word	0xc035a140
	.word	0xee5da0a0
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	DDEMAP_ALL
	.word	0xd4776038
	.word	0xc0766140
	.word	0xd8592018
thr1_MMU_ASI_BLK_P_105:
	.word	0x878020f0
	.word	0xe3bee4c0
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xec592098
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00a_exit:
	EXIT_GOOD
Thr1_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v107 DATA_VA=0x63100011a000
attr_data {
	Name = .Thr1_User_Data_4v107 ,
	VA = 0x63100011a000 ,/* 0x63100011bfc0 */
	RA = 0x03700a0000 ,
	PA = 0x03700a0000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063100011a326 80000003700a0040 */
	end_label   = Thr1_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v107_data_begin
Thr1_User_Data_4v107_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00b TEXT_VA=0x640000eb0000
attr_text {
	Name = .Thr1_User_Text_4v00b ,
	VA = 0x640000eb0000 ,/* 0x640000ebffc0 */
	RA = 0x03f0a50000 ,
	PA = 0x1ff0a50000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000640000eb0326 8000001ff0a50081 */
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
	or	%g0, 0x032, %i7
	LOAD_IDATA_IN
	.word	0xfc9add60
	.word	0xea7760b8
	.word	0xc037616e
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe45ad68
	.word	0x1000000
	or	%g0, 0x410, %i7
	READ_IDATA_ACCESS
	.word	0xe25c2040
	ACCESS_ITSB_PTR
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x7e0, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe128000
	DDEMAP_PAGE
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	TOGGLE_LSU_DM
	nop
	nop
	nop
	.word	0xf87120c8
	.word	0xc02c2ee6
	.word	0xc872a0d0
	.word	0xc076e6b8
	nop
	nop
	nop
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe072a120
	.word	0xc03429e2
	.word	0xfe4aa36b
	.word	0xbe80a098
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x94, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcda9000
	DDEMAP_NCTX
	IDEMAP_ALL
	.word	0xfc9f5c40
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x031, %i7
	LOAD_IDATA_IN
	.word	0xfcda9000
	.word	0xfc9d9100
	.word	0xbe866038
	.word	0xecdfd000
	.word	0xc02e647b
	.word	0x1000000
	or	%g0, 0xb8, %i7
	ITLB_TAG_READ
	.word	0xc02e65c8
	.word	0xc0742ae0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd45e6100
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0xb8, %i7
	READ_DDATA_ACCESS
	.word	0xc0276294
	DDEMAP_SCTX
	IDEMAP_NCTX
	IDEMAP_ALL_PAGES
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe118000
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
	.word	0xc075acd8
	.word	0xbe812098
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x2e0, %i7
	DTLB_TAG_READ
	.word	0xe25c2040
	nop
	.word	0x1000000
	or	%g0, 0x48, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL
	DDEMAP_ALL_RPAGES
	.word	0xc45c2100
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x690, %i7
	READ_DDATA_ACCESS
	.word	0xc19c1e00
	.word	0xe05da0e0
	.word	0x1000000
	or	%g0, 0x198, %i7
	READ_IDATA_ACCESS
	.word	0xfe55a79a
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4129ec
	.word	0x81c3e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00b_exit:
	EXIT_GOOD
Thr1_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v108 DATA_VA=0x640000670000
attr_data {
	Name = .Thr1_User_Data_4v108 ,
	VA = 0x640000670000 ,/* 0x64000067ffc0 */
	RA = 0x03f00f0000 ,
	PA = 0x1ff00f0000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000670326 8000001ff00f0041 */
	end_label   = Thr1_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v108_data_begin
Thr1_User_Data_4v108_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00c TEXT_VA=0x631000140000
attr_text {
	Name = .Thr1_User_Text_4v00c ,
	VA = 0x631000140000 ,/* 0x631000141fc0 */
	RA = 0x0370000000 ,
	PA = 0x0370000000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000631000140326 8000000370000080 */
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
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DDEMAP_PCTX
	.word	0xd45aa0d0
	.word	0xf0742000
	.word	0xc02c2140
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	TOGGLE_LSU_IM
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe15c000
	IDEMAP_PAGE
	.word	0xd45e6098
	DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe104000
	DDEMAP_PAGE
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x484, %i7
	LOAD_IDATA_ACCESS
	.word	0xd875a078
	.word	0xc02aa895
	.word	0xc07121f8
	.word	0x1000000
	.word	0xbe124000
	IDEMAP_PAGE
	.word	0xc0312372
	.word	0xfe55ad08
	.word	0xd85ee018
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc07762b8
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00c_exit:
	EXIT_GOOD
Thr1_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v109 DATA_VA=0x640000210000
attr_data {
	Name = .Thr1_User_Data_4v109 ,
	VA = 0x640000210000 ,/* 0x64000021ffc0 */
	RA = 0x03f0300000 ,
	PA = 0x1ff0300000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000210326 8000001ff0300041 */
	end_label   = Thr1_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v109_data_begin
Thr1_User_Data_4v109_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00d TEXT_VA=0x6400003b0000
attr_text {
	Name = .Thr1_User_Text_4v00d ,
	VA = 0x6400003b0000 ,/* 0x6400003bffc0 */
	RA = 0x03f0e50000 ,
	PA = 0x1ff0e50000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006400003b0326 8000001ff0e50081 */
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
	.word	0xf87420e8
	.word	0xc032a244
	.word	0xbe842098
	.word	0xe0dfd040
	.word	0x1000000
	or	%g0, 0x590, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe52afca
	nop
	DDEMAP_ALL
	.word	0xca766010
	.word	0xc035aa32
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x663, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x148, %i7
	ITLB_TAG_READ
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
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x58, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x175, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe5128ec
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4e8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe128000
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
	.word	0xec5aa068
	.word	0x1000000
	or	%g0, 0x182, %i7
	LOAD_IDATA_ACCESS
	.word	0xd075a088
	.word	0xc036e656
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe5f6ac8
	.word	0xc85da038
	.word	0x1000000
	.word	0xbe17c000
	IDEMAP_RPAGE
	nop
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdd9000
	TOGGLE_LSU_IM
thr1_MMU_ASI_BLK_P_106:
	.word	0x878020f0
	.word	0xc1bc2880
	.word	0xc0366e40
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc85aa098
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00d_exit:
	EXIT_GOOD
Thr1_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10a DATA_VA=0x631000108000
attr_data {
	Name = .Thr1_User_Data_4v10a ,
	VA = 0x631000108000 ,/* 0x631000109fc0 */
	RA = 0x0370056000 ,
	PA = 0x0370056000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000631000108326 8000000370056040 */
	end_label   = Thr1_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10a_data_begin
Thr1_User_Data_4v10a_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00e TEXT_VA=0x65003a400000
attr_text {
	Name = .Thr1_User_Text_4v00e ,
	VA = 0x65003a400000 ,/* 0x65003a7fffc0 */
	RA = 0x026f800000 ,
	PA = 0x1e6f800000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000065003a4005ce 8000001e6f800083 */
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
	.word	0xc19c5e20
	.word	0xfc9ad020
thr1_MMU_ASI_BLK_COMMIT_S_107:
	.word	0x878020e1
	.word	0xc3bae6c0
thr1_MMU_ASI_PRIMARY_108:
	.word	0x87802080
	.word	0xd6f6e070
	.word	0x1000000
	or	%g0, 0x019, %i7
	LOAD_IDATA_IN
	.word	0xbe86e120
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe134000
	DDEMAP_PAGE
	.word	0xd675a070
	.word	0xc03428a0
	.word	0xfe512a72
	.word	0xf872a118
	.word	0xc02f6d65
	.word	0x1000000
	or	%g0, 0x570, %i7
	READ_DDATA_ACCESS
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x05f, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x2f8, %i7
	READ_DDATA_ACCESS
	.word	0xe472a078
	.word	0xc032a162
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xec5920d0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcd95160
	.word	0xec5aa0b0
	.word	0x1000000
	or	%g0, 0x4f, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe154000
	DDEMAP_PAGE
	.word	0xca5e6010
	.word	0xfe442264
	.word	0xc022a8cc
thr1_MMU_ASI_PRIMARY_109:
	.word	0x87802080
	.word	0xe6f6e050
	.word	0xbe842138
	.word	0xd4dfd000
	.word	0xbe85a098
	.word	0xc4dfd000
	IDEMAP_ALL_RPAGES
	.word	0xfcda9000
	ACCESS_DTSB_PTR
	.word	0xc036eac6
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0342386
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00e_exit:
	EXIT_GOOD
Thr1_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10b DATA_VA=0x631000138000
attr_data {
	Name = .Thr1_User_Data_4v10b ,
	VA = 0x631000138000 ,/* 0x631000139fc0 */
	RA = 0x03700b2000 ,
	PA = 0x03700b2000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000631000138326 80000003700b2040 */
	end_label   = Thr1_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10b_data_begin
Thr1_User_Data_4v10b_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00f TEXT_VA=0x63100015c000
attr_text {
	Name = .Thr1_User_Text_4v00f ,
	VA = 0x63100015c000 ,/* 0x63100015dfc0 */
	RA = 0x037012e000 ,
	PA = 0x037012e000 ,
	TTE_Context = 0x0326 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063100015c326 800000037012e080 */
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0xfcd95020
	.word	0xfcdc1040
	.word	0xfcda9000
	.word	0xca776010
	.word	0xc022a494
	.word	0xc029225c
	DDEMAP_SCTX
	DDEMAP_PCTX
	.word	0xc0292eca
	.word	0xbe842098
	.word	0xf2dfd000
	nop
	nop
	nop
	nop
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
	.word	0xc02aa7ae
	TOGGLE_LSU_IM
	.word	0xfe5da598
	.word	0xc45e6130
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	.word	0xfe5f66e8
	.word	0xbe138000
	GOTO_SUPERVISOR1
thr1_MMU_ASI_BLK_COMMIT_S_110:
	.word	0x878020e1
	.word	0xc3b96a00
	.word	0x1000000
	or	%g0, 0x68a, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xbe866098
	.word	0xc4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x530, %i7
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
	or	%g0, 0x1e8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5, %i7
	LOAD_IDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x688, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xf675a110
	.word	0xc075ab98
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00f_exit:
	EXIT_GOOD
Thr1_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10c DATA_VA=0x6310001d2000
attr_data {
	Name = .Thr1_User_Data_4v10c ,
	VA = 0x6310001d2000 ,/* 0x6310001d3fc0 */
	RA = 0x0370182000 ,
	PA = 0x0370182000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006310001d2326 8000000370182040 */
	end_label   = Thr1_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10c_data_begin
Thr1_User_Data_4v10c_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10d DATA_VA=0x640000db0000
attr_data {
	Name = .Thr1_User_Data_4v10d ,
	VA = 0x640000db0000 ,/* 0x640000dbffc0 */
	RA = 0x03f0360000 ,
	PA = 0x1ff0360000 ,
	TTE_Context = 0x0326 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000db0326 8000001ff0360041 */
	end_label   = Thr1_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10d_data_begin
Thr1_User_Data_4v10d_data_begin:
	.xword	0x6310001f2000
	.xword	0x640000ae0000
	.xword	0x640000d60000
	.xword	0x640000620000
	.xword	0x640000990000
	.xword	0x631000016000
	.xword	0x640000200000
	.xword	0x631000048000
	.xword	0x6607d0000000
	.xword	0x6400004c0000
	.xword	0x650010000000
	.xword	0x65000d800000
	.xword	0x640000a60000
	.xword	0x6400003f0000
	.xword	0x63100012a000
	.xword	0x6400003c0000
	.xword	0x640000400000
	.xword	0x640000bf0000
	.xword	0x650031400000
	.xword	0x650004800000
	.xword	0x640000350000
	.xword	0x640000500000
	.xword	0x640000830000
	.xword	0x640000c90000
	.xword	0x6310000b0000
	.xword	0x660650000000
	.xword	0x6400002f0000
	.xword	0x63100014c000
	.xword	0x63100011a000
	.xword	0x640000eb0000
	.xword	0x640000670000
	.xword	0x631000140000
	.xword	0x640000210000
	.xword	0x6400003b0000
	.xword	0x631000108000
	.xword	0x65003a400000
	.xword	0x631000138000
	.xword	0x63100015c000
	.xword	0x6310001d2000
	.xword	0x640000db0000
Thr1_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x6a0aa0000000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	VA = 0x6a0aa0000000 ,/* 0x6a0aafffffc0 */
	RA = 0x0090000000 ,
	PA = 0x2c90000000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006a0aa0001a67 8000002c90000485 */
	end_label   = Thr2_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr2_user_code_entry
Thr2_user_code_entry:
	setx	0x680000280000, %g1, %g2
	or	%g0, 16, %g1
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
thr2_MMU_ASI_BLK_COMMIT_P_111:
	.word	0x878020e0
	.word	0xe3bc2740
	DDEMAP_NCTX
	nop
	nop
	.word	0xe85f6148
	.word	0xce712050
	.word	0xc035e400
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	TOGGLE_LSU_DM
thr2_MMU_ASI_PRIMARY_112:
	.word	0x87802080
	.word	0xecf2a028
thr2_MMU_ASI_PRIMARY_113:
	.word	0x87802080
	.word	0xf6f52120
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc0342884
	.word	0xc19a9f00
	nop
	nop
	nop
	nop
thr2_MMU_ASI_BLK_PL_114:
	.word	0x878020f8
	.word	0xe1bd2640
	IDEMAP_NCTX
	.word	0x1000000
	.word	0xbe140000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x05e, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x5d8, %i7
	READ_IDATA_ACCESS
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x580, %i7
	DTLB_TAG_READ
thr2_MMU_ASI_SECONDARY_LITTLE_115:
	.word	0x87802089
	.word	0xd4b964e0
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x500, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe17c000
	IDEMAP_RPAGE
	ACCESS_ITSB_PTR
	.word	0xbe842038
	.word	0xd4dfd000
thr2_MMU_ASI_PRIMARY_116:
	.word	0x87802080
	.word	0xe0baa9b0
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x059, %i7
	LOAD_IDATA_IN
	.word	0xfc9e5c40
	.word	0xe25aa018
	nop
	nop
thr2_MMU_ASI_BLK_PL_117:
	.word	0x878020f8
	.word	0xe1bde3c0
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	IDEMAP_PCTX
	.word	0xc85c2138
thr2_MMU_ASI_PRIMARY_118:
	.word	0x87802080
	.word	0xd2f420b8
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x0a6, %i7
	LOAD_DDATA_IN
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe170000
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
	.word	0xc035e2bc
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	.word	0xe85de138
	.word	0x1000000
	or	%g0, 0x5fb, %i7
	LOAD_IDATA_ACCESS
	.word	0xc670a0c8
	.word	0xc025e160
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x417, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xbe876110
	.word	0xe8dfd000
	.word	0xbe85e0d0
	.word	0xe8dfd000
	IDEMAP_PCTX
	.word	0xbe8420e0
	.word	0xd4dfd000
	.word	0xee5aa148
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4424f8
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v000_exit:
	EXIT_GOOD
Thr2_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v100 DATA_VA=0x680000280000
attr_data {
	Name = .Thr2_User_Data_4v100 ,
	VA = 0x680000280000 ,/* 0x68000028ffc0 */
	RA = 0x0010dc0000 ,
	PA = 0x0010dc0000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000281a67 8000000010dc0041 */
	end_label   = Thr2_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v100_data_begin
Thr2_User_Data_4v100_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v200 DATA_VA=0x6720000e2000
attr_data {
	Name = .Thr2_User_Data_4v200 ,
	VA = 0x6720000e2000 ,/* 0x6720000e3fc0 */
	RA = 0x0380134000 ,
	PA = 0x0380134000 ,
	TTE_Context = 0x13ea ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006720000e33ea 8000000380134440 */
	end_label   = Thr2_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v200_data_begin
Thr2_User_Data_4v200_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v300 DATA_VA=0x6720001c0000
attr_data {
	Name = .Thr2_User_Data_4v300 ,
	VA = 0x6720001c0000 ,/* 0x6720001c1fc0 */
	RA = 0x0380112000 ,
	PA = 0x0380112000 ,
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
	/* DTTE_TAG_DATA = 00006720001c0000 8000000380112440 */
	end_label   = Thr2_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v300_data_begin
Thr2_User_Data_4v300_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v001 TEXT_VA=0x680000100000
attr_text {
	Name = .Thr2_User_Text_4v001 ,
	VA = 0x680000100000 ,/* 0x68000010ffc0 */
	RA = 0x0010610000 ,
	PA = 0x0010610000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000101a67 8000000010610481 */
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
thr2_MMU_ASI_SECONDARY_119:
	.word	0x87802081
	.word	0xf0bae480
	.word	0xe85e6008
thr2_MMU_ASI_PRIMARY_120:
	.word	0x87802080
	.word	0xe2f5e018
	.word	0xd076e028
	.word	0xc0376f2e
	.word	0xf87520e8
	.word	0xc022a3d0
	.word	0xe2742048
	.word	0xc072af08
	ACCESS_ITSB_PTR
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x045, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x034, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x4cf, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcdd1000
	TOGGLE_LSU_DM
	.word	0xfc995120
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	READ_IDATA_ACCESS
	.word	0xf25de0e0
	.word	0xfcdd1000
	.word	0xbe80a120
	.word	0xfadfd000
thr2_MMU_ASI_BLK_SL_121:
	.word	0x878020f9
	.word	0xe1b96780
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x12a, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	.word	0xfcd95060
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdf5000
	.word	0xfe542a14
	.word	0x1000000
	.word	0xbe12c000
	IDEMAP_PAGE
	nop
	nop
	.word	0x1000000
	or	%g0, 0x3dd, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_ALL_PAGES
thr2_MMU_ASI_PRIMARY_122:
	.word	0x87802080
	.word	0xe6f2a028
	.word	0xe05aa0f0
	TOGGLE_LSU_DM
	.word	0xfcd91000
	.word	0xf67520c0
	.word	0xc02421b8
	TOGGLE_LSU_IM
	.word	0xfe592150
	.word	0x1000000
	or	%g0, 0x055, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x191, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc032ab7e
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v001_exit:
	EXIT_GOOD
Thr2_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v400 TEXT_VA=0x6720000b6000
attr_text {
	Name = .Thr2_User_Text_4v400 ,
	VA = 0x6720000b6000 ,/* 0x6720000b7fc0 */
	RA = 0x03800ce000 ,
	PA = 0x03800ce000 ,
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
	/* ITTE_TAG_DATA = 00006720000b6000 80000003800ce080 */
	end_label   = Thr2_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v400_text_begin
Thr2_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xfa732038
	.word	0xc0332f6a
	.word	0xfe59a8d0
	.word	0x1000000
	or	%g0, 0x418, %i7
	P_DTLB_TAG_READ
	.word	0xfcdf5000
	.word	0x1000000
	.word	0xbe130000
	P_IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	.word	0xbe866068
	.word	0xd4dfc200
	.word	0xe05b2130
	.word	0xbe85e068
	.word	0xeedfd040
	nop
	nop
	nop
	P_DDEMAP_ALL
thr2_MMU_ASI_SECONDARY_123:
	.word	0x87802081
	.word	0xe6f16058
	.word	0x1000000
	or	%g0, 0x58, %i7
	P_ITLB_TAG_READ
	.word	0xfc9b05e0
	P_TOGGLE_LSU_IM
	P_TOGGLE_LSU_IM
	.word	0xd271a050
	.word	0xc03328f2
	P_ACCESS_DTSB_PTR
thr2_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_124:
	.word	0x8780202a
	.word	0xe0bf6e00
	.word	0xbe8520f0
	.word	0xd4dfd000
	nop
	nop
	nop
	P_DDEMAP_NCTX
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0x6ef, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe85e038
	.word	0xe0dfc200
	.word	0xfe51a630
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_PCTX
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v400_exit:
	EXIT_GOOD
Thr2_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v002 TEXT_VA=0x6a0b20000000
attr_text {
	Name = .Thr2_User_Text_4v002 ,
	VA = 0x6a0b20000000 ,/* 0x6a0b2fffffc0 */
	RA = 0x0100000000 ,
	PA = 0x2d00000000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 00006a0b20001a67 8000002d00000485 */
	end_label   = Thr2_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v002_text_begin
Thr2_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0xbe852128
	.word	0xe0dfc200
	.word	0x1000000
	or	%g0, 0x1f8, %i7
	P_READ_DDATA_ACCESS
	.word	0xc02eeece
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x0b3, %i7
	P_LOAD_DDATA_IN
	.word	0xe05c20d0
	nop
	nop
	nop
	nop
	nop
	P_ACCESS_DTSB_PTR
	P_IDEMAP_ALL_RPAGES
	.word	0xbe82a068
	.word	0xf2dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd275e0b8
	.word	0xc0352a82
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0xbe812068
	.word	0xe0dfc200
	.word	0xfcd94280
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr2_User_Text_4v002_exit:
	EXIT_GOOD
Thr2_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v101 DATA_VA=0x680000c30000
attr_data {
	Name = .Thr2_User_Data_4v101 ,
	VA = 0x680000c30000 ,/* 0x680000c3ffc0 */
	RA = 0x0010710000 ,
	PA = 0x0010710000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000c31a67 8000000010710041 */
	end_label   = Thr2_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v101_data_begin
Thr2_User_Data_4v101_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v201 DATA_VA=0x680000cc0000
attr_data {
	Name = .Thr2_User_Data_4v201 ,
	VA = 0x680000cc0000 ,/* 0x680000ccffc0 */
	RA = 0x0010c20000 ,
	PA = 0x0010c20000 ,
	TTE_Context = 0x13ea ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000680000cc13ea 8000000010c20441 */
	end_label   = Thr2_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v201_data_begin
Thr2_User_Data_4v201_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v301 DATA_VA=0x680000520000
attr_data {
	Name = .Thr2_User_Data_4v301 ,
	VA = 0x680000520000 ,/* 0x68000052ffc0 */
	RA = 0x00107c0000 ,
	PA = 0x00107c0000 ,
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
	/* DTTE_TAG_DATA = 0000680000520000 80000000107c0441 */
	end_label   = Thr2_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v301_data_begin
Thr2_User_Data_4v301_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v003 TEXT_VA=0x680000110000
attr_text {
	Name = .Thr2_User_Text_4v003 ,
	VA = 0x680000110000 ,/* 0x68000011ffc0 */
	RA = 0x0010a70000 ,
	PA = 0x0010a70000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000111a67 8000000010a70481 */
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
	.word	0xfe5c2b18
	.word	0xc45aa0c0
	.word	0xc035e6f8
	.word	0xfe542420
	.word	0xfcded000
	IDEMAP_ALL_PAGES
	.word	0xfe542804
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4424b0
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa5ee100
	.word	0xf47120f8
	.word	0xc0712550
thr2_MMU_ASI_PRIMARY_125:
	.word	0x87802080
	.word	0xf2f760d0
	.word	0xfcdc1000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe80a080
	.word	0xe39fde00
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x20, %i7
	READ_DDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0xe85d2038
	.word	0xbe816010
	.word	0xc39fde20
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfc9c1100
	.word	0xf65f6130
	TOGGLE_LSU_DM
	.word	0xc02de160
	.word	0x1000000
	or	%g0, 0x020, %i7
	LOAD_DDATA_IN
thr2_MMU_ASI_PRIMARY_126:
	.word	0x87802080
	.word	0xc6f2a0a8
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5c2100
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v003_exit:
	EXIT_GOOD
Thr2_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v401 TEXT_VA=0x672000082000
attr_text {
	Name = .Thr2_User_Text_4v401 ,
	VA = 0x672000082000 ,/* 0x672000083fc0 */
	RA = 0x03800b4000 ,
	PA = 0x03800b4000 ,
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
	/* ITTE_TAG_DATA = 0000672000082000 80000003800b4080 */
	end_label   = Thr2_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v401_text_begin
Thr2_User_Text_4v401_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_IM
	P_DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x422, %i7
	P_LOAD_IDATA_ACCESS
thr2_MMU_ASI_SECONDARY_127:
	.word	0x87802081
	.word	0xfaf16130
	.word	0xc031a160
	.word	0xc0346e82
thr2_MMU_ASI_BLK_P_128:
	.word	0x878020f0
	.word	0xe3bd2340
	.word	0xfcda8200
thr2_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_129:
	.word	0x8780202b
	.word	0xccb96fa0
	.word	0xf25c6008
	.word	0xbe842120
	.word	0xd4dfc200
	P_DDEMAP_ALL
	P_IDEMAP_ALL_RPAGES
	.word	0xc3995e20
	.word	0x1000000
	or	%g0, 0x190, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe8120b0
	.word	0xc8dfd000
	.word	0x1000000
	.word	0xbe110000
	P_DDEMAP_RPAGE
	.word	0xbe852088
	.word	0xc4dfc200
	.word	0xfcdf4200
thr2_MMU_ASI_AS_IF_USER_PRIMARY_130:
	.word	0x87802010
	.word	0xf8f2a090
	.word	0xc859a0d0
	P_DDEMAP_ALL
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x78, %i7
	P_ITLB_TAG_READ
thr2_MMU_ASI_BLK_P_131:
	.word	0x878020f0
	.word	0xe1bc2f00
	.word	0xbe842120
	.word	0xe8dfd000
thr2_MMU_ASI_PRIMARY_132:
	.word	0x87802080
	.word	0xd6f5e010
	.word	0xbe8520f0
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	P_ITLB_TAG_READ
	.word	0xfcdd1040
	nop
	nop
	.word	0xfe446034
	.word	0xbe852138
	.word	0xeedfd040
	.word	0xc459a0b0
	nop
	nop
	nop
	nop
	nop
	.word	0xe6732058
	.word	0xc031ab6a
	.word	0xbe82a120
	.word	0xe8dfd000
	.word	0x1000000
	.word	0xbe128000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v401_exit:
	EXIT_GOOD
Thr2_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v004 TEXT_VA=0x680000d80000
attr_text {
	Name = .Thr2_User_Text_4v004 ,
	VA = 0x680000d80000 ,/* 0x680000d8ffc0 */
	RA = 0x0010d50000 ,
	PA = 0x0010d50000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000d81a67 8000000010d50481 */
	end_label   = Thr2_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v004_text_begin
Thr2_User_Text_4v004_text_begin:
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
	.word	0xfe45e084
thr2_MMU_ASI_PRIMARY_LITTLE_133:
	.word	0x87802088
	.word	0xe0f420b0
	.word	0x1000000
	or	%g0, 0x2cf, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe85e0c0
	.word	0xe8dfc200
	.word	0xca712010
	.word	0xc02521a8
	nop
	nop
	nop
	nop
	nop
	.word	0xfe566376
thr2_MMU_ASI_AS_IF_USER_PRIMARY_134:
	.word	0x87802010
	.word	0xf0f420a8
	.word	0xc02de160
	.word	0xfcddd000
	.word	0xfcda9000
	P_DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcd95160
	nop
	nop
	nop
	nop
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
	nop
	.word	0xbe8420d0
	.word	0xeedfd000
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr2_User_Text_4v004_exit:
	EXIT_GOOD
Thr2_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v102 DATA_VA=0x680000370000
attr_data {
	Name = .Thr2_User_Data_4v102 ,
	VA = 0x680000370000 ,/* 0x68000037ffc0 */
	RA = 0x0010460000 ,
	PA = 0x0010460000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000371a67 8000000010460041 */
	end_label   = Thr2_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v102_data_begin
Thr2_User_Data_4v102_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v302 DATA_VA=0x67200007c000
attr_data {
	Name = .Thr2_User_Data_4v302 ,
	VA = 0x67200007c000 ,/* 0x67200007dfc0 */
	RA = 0x038001c000 ,
	PA = 0x038001c000 ,
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
	/* DTTE_TAG_DATA = 000067200007c000 800000038001c440 */
	end_label   = Thr2_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v302_data_begin
Thr2_User_Data_4v302_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v005 TEXT_VA=0x67200011c000
attr_text {
	Name = .Thr2_User_Text_4v005 ,
	VA = 0x67200011c000 ,/* 0x67200011dfc0 */
	RA = 0x0380144000 ,
	PA = 0x0380144000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000067200011da67 8000000380144480 */
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
thr2_MMU_ASI_PRIMARY_135:
	.word	0x87802080
	.word	0xf0f2a000
	.word	0xc076ed20
	.word	0x1000000
	or	%g0, 0x5f0, %i7
	READ_IDATA_ACCESS
	.word	0xe05c2068
	.word	0x1000000
	.word	0xbe150000
	DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe11c000
	IDEMAP_PAGE
	.word	0xe4776000
	.word	0xc02ee49d
	nop
	nop
	nop
	nop
	.word	0xbe82e010
	.word	0xcadfd020
	.word	0xee5c20d0
	.word	0x1000000
	or	%g0, 0x520, %i7
	READ_IDATA_ACCESS
	.word	0xc0366160
	.word	0xbe816010
	.word	0xcadfd060
	.word	0xd2752000
	.word	0xc02c2160
	.word	0xc85e6008
	DDEMAP_PCTX
	.word	0xfcdc1000
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	.word	0xd85de018
	.word	0xd45ee068
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x428, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0xbe842038
	.word	0xfadfd000
thr2_MMU_ASI_BLK_P_136:
	.word	0x878020f0
	.word	0xc1bded40
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc032a978
	.word	0xbe852038
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x022, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe12c000
	IDEMAP_RPAGE
thr2_MMU_ASI_BLK_COMMIT_P_137:
	.word	0x878020e0
	.word	0xc1bc25c0
	DDEMAP_PCTX
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc85c20f0
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	DTLB_TAG_READ
	.word	0xfe5d2b78
	.word	0xfe4d270f
	.word	0x1000000
	.word	0xbe174000
	IDEMAP_RPAGE
thr2_MMU_ASI_PRIMARY_LITTLE_138:
	.word	0x87802088
	.word	0xcef2a020
	.word	0x1000000
	or	%g0, 0x02d, %i7
	LOAD_DDATA_IN
thr2_MMU_ASI_PRIMARY_139:
	.word	0x87802080
	.word	0xeaf420c8
	.word	0xfe4f6459
	DDEMAP_NCTX
	.word	0xe19a9f00
	.word	0xfcdd1000
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x508, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5b8, %i7
	DTLB_TAG_READ
	.word	0xfe5aa840
	.word	0x1000000
	or	%g0, 0x471, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe45e734
thr2_MMU_ASI_PRIMARY_140:
	.word	0x87802080
	.word	0xd2f42118
	.word	0x1000000
	or	%g0, 0x12d, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x058, %i7
	LOAD_IDATA_IN
	ACCESS_DTSB_PTR
	.word	0xfe4e68dc
	.word	0xee7760e0
	.word	0xc075e168
	.word	0xc025ea6c
thr2_MMU_ASI_PRIMARY_LITTLE_141:
	.word	0x87802088
	.word	0xe6f52080
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0742d40
thr2_MMU_ASI_PRIMARY_142:
	.word	0x87802080
	.word	0xc8f42100
	.word	0xe05aa0a0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf272a0c0
	.word	0xc032ab32
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v005_exit:
	EXIT_GOOD
Thr2_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v402 TEXT_VA=0x672000142000
attr_text {
	Name = .Thr2_User_Text_4v402 ,
	VA = 0x672000142000 ,/* 0x672000143fc0 */
	RA = 0x0380164000 ,
	PA = 0x0380164000 ,
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
	/* ITTE_TAG_DATA = 0000672000142000 8000000380164080 */
	end_label   = Thr2_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v402_text_begin
Thr2_User_Text_4v402_text_begin:
	wrpr	0, %gl
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
	.word	0xbe816010
	.word	0xd6dfd020
	.word	0xfcddd040
thr2_MMU_ASI_AS_IF_USER_PRIMARY_143:
	.word	0x87802010
	.word	0xe2f76018
	nop
	nop
	nop
	nop
thr2_MMU_ASI_AS_IF_USER_PRIMARY_144:
	.word	0x87802010
	.word	0xd4f520f0
	.word	0xc071a160
	P_IDEMAP_PCTX
	P_ACCESS_DTSB_PTR
	.word	0xd85c6048
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x178, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xfe4b2da1
	.word	0x1000000
	or	%g0, 0x13d, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe812088
	.word	0xe8dfd000
thr2_MMU_ASI_REAL_MEM_145:
	.word	0x87802014
	.word	0xccf4e018
	.word	0xbe86e148
	.word	0xeedfd000
	.word	0xc031a358
	.word	0xbe8420c0
	.word	0xc39fc2c0
	.word	0x1000000
	or	%g0, 0x351, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcddc200
	.word	0xfe432f78
	.word	0xf25b20f0
	.word	0xfc9c1c40
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xd0, %i7
	P_READ_DDATA_ACCESS
thr2_MMU_ASI_REAL_IO_LITTLE_146:
	.word	0x8780201d
	.word	0xc4f360d0
	P_IDEMAP_PCTX
	P_ACCESS_ITSB_PTR
thr2_MMU_ASI_AS_IF_USER_PRIMARY_147:
	.word	0x87802010
	.word	0xc8f420b0
	.word	0xbe816010
	.word	0xcadfd060
	.word	0xfcda8200
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v402_exit:
	EXIT_GOOD
Thr2_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v103 DATA_VA=0x6720000f0000
attr_data {
	Name = .Thr2_User_Data_4v103 ,
	VA = 0x6720000f0000 ,/* 0x6720000f1fc0 */
	RA = 0x0380148000 ,
	PA = 0x0380148000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006720000f1a67 8000000380148040 */
	end_label   = Thr2_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v103_data_begin
Thr2_User_Data_4v103_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v006 TEXT_VA=0x67200018a000
attr_text {
	Name = .Thr2_User_Text_4v006 ,
	VA = 0x67200018a000 ,/* 0x67200018bfc0 */
	RA = 0x03801ec000 ,
	PA = 0x03801ec000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000067200018ba67 80000003801ec480 */
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
	TOGGLE_LSU_DM
	.word	0xbe876148
	.word	0xf6dfd000
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	ITLB_TAG_READ
	.word	0xc024227c
thr2_MMU_ASI_PRIMARY_148:
	.word	0x87802080
	.word	0xecf2a080
thr2_MMU_ASI_PRIMARY_149:
	.word	0x87802080
	.word	0xfaf0a128
	.word	0xfcddd100
	.word	0xcc72a018
	.word	0xc032a160
	.word	0x1000000
	.word	0xbe120000
	IDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe134000
	IDEMAP_PAGE
	nop
	nop
	.word	0xc020a7a8
	.word	0xf272a0a0
	.word	0xc035e7f8
	.word	0xc0712e90
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcda9000
	.word	0xc0752160
	.word	0xc072aee0
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfc9c1d40
	.word	0xc672a0c8
	.word	0xc0212230
	.word	0x1000000
	or	%g0, 0x493, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	READ_IDATA_ACCESS
	.word	0xec712028
	.word	0xc072ad68
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xcc752018
	.word	0xc070a4b8
	.word	0xbe86e0e0
	.word	0xd4dfd000
	DDEMAP_ALL_RPAGES
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	IDEMAP_ALL_PAGES
	.word	0xfc995d60
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x409, %i7
	LOAD_IDATA_ACCESS
	.word	0xf47520e8
	.word	0xc036ed5a
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
	or	%g0, 0x440, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x054, %i7
	LOAD_DDATA_IN
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x460, %i7
	READ_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe05aa0d0
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v006_exit:
	EXIT_GOOD
Thr2_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v403 TEXT_VA=0x6a0140000000
attr_text {
	Name = .Thr2_User_Text_4v403 ,
	VA = 0x6a0140000000 ,/* 0x6a014fffffc0 */
	RA = 0x0110000000 ,
	PA = 0x2d10000000 ,
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
	/* ITTE_TAG_DATA = 00006a0140000000 8000002d10000085 */
	end_label   = Thr2_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v403_text_begin
Thr2_User_Text_4v403_text_begin:
	wrpr	0, %gl
thr2_MMU_ASI_PRIMARY_150:
	.word	0x87802080
	.word	0xd2f660f8
	.word	0x1000000
	.word	0xbe144000
	P_DDEMAP_PAGE
	P_DDEMAP_ALL
	.word	0xe85b20c0
	P_DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x120, %i7
	P_ITLB_TAG_READ
thr2_MMU_ASI_AS_IF_USER_PRIMARY_151:
	.word	0x87802010
	.word	0xf2f420d0
	.word	0xc0732210
	.word	0xd671a010
	.word	0xc021a1b0
	nop
	.word	0xfe59a7d0
	.word	0xc071a860
thr2_MMU_ASI_BLK_COMMIT_P_152:
	.word	0x878020e0
	.word	0xc1bd2d80
	.word	0xfcdf5040
thr2_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_153:
	.word	0x8780202b
	.word	0xf0b96b30
thr2_MMU_ASI_AS_IF_USER_PRIMARY_154:
	.word	0x87802010
	.word	0xdef52078
	.word	0xc0246160
thr2_MMU_ASI_AS_IF_USER_PRIMARY_155:
	.word	0x87802010
	.word	0xecf42058
	.word	0x1000000
	or	%g0, 0x546, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xca71a010
	.word	0xc029ae82
	nop
	nop
	nop
	nop
	nop
	.word	0xfcde5000
	.word	0x1000000
	or	%g0, 0x085, %i7
	P_LOAD_DDATA_IN
thr2_MMU_ASI_AS_IF_USER_PRIMARY_156:
	.word	0x87802010
	.word	0xe2f2a018
	nop
	nop
	nop
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
	.word	0xfcd91040
	.word	0xd8746070
	.word	0xc0346760
	.word	0x1000000
	.word	0xbe150000
	P_IDEMAP_PAGE
	.word	0xd459a0a0
thr2_MMU_ASI_PRIMARY_157:
	.word	0x87802080
	.word	0xe4f5e0b8
	P_DDEMAP_NCTX
	.word	0xc0232594
	.word	0xfcdad060
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	P_DTLB_TAG_READ
	.word	0xfe41afe0
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v403_exit:
	EXIT_GOOD
Thr2_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v104 DATA_VA=0x672000022000
attr_data {
	Name = .Thr2_User_Data_4v104 ,
	VA = 0x672000022000 ,/* 0x672000023fc0 */
	RA = 0x03801f0000 ,
	PA = 0x03801f0000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000672000023a67 80000003801f0040 */
	end_label   = Thr2_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v104_data_begin
Thr2_User_Data_4v104_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v007 TEXT_VA=0x6720000ea000
attr_text {
	Name = .Thr2_User_Text_4v007 ,
	VA = 0x6720000ea000 ,/* 0x6720000ebfc0 */
	RA = 0x038003e000 ,
	PA = 0x038003e000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006720000eba67 800000038003e480 */
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
	.word	0xd45f6068
	DDEMAP_ALL
thr2_MMU_ASI_PRIMARY_158:
	.word	0x87802080
	.word	0xeaf520f8
	.word	0x1000000
	or	%g0, 0x280, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	.word	0xc028a3c7
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x125, %i7
	LOAD_IDATA_ACCESS
	.word	0xc02c216f
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5d2e58
	DDEMAP_NCTX
	DDEMAP_ALL_PAGES
	IDEMAP_ALL_RPAGES
	.word	0xfcda9000
	.word	0xee5f6038
	TOGGLE_LSU_IM
	.word	0xfe442fc0
	nop
	nop
	nop
	.word	0xc02e6161
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	.word	0xec712028
	.word	0xc07527b8
	DDEMAP_SCTX
	.word	0xc0242cb8
	.word	0xf872a118
	.word	0xc0752d30
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x01f, %i7
	LOAD_DDATA_IN
	.word	0xc02c2160
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_PCTX
	.word	0xc02f64c9
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe144000
	IDEMAP_PAGE
	.word	0xfc9a9c40
	.word	0xfe52afb8
	.word	0x1000000
	or	%g0, 0x074, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x590, %i7
	READ_DDATA_ACCESS
	IDEMAP_ALL
	.word	0x1000000
	.word	0xbe160000
	IDEMAP_PAGE
	.word	0xbe842068
	.word	0xe8dfd000
	nop
	nop
	nop
	nop
	.word	0xc02aa229
	ACCESS_ITSB_PTR
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc0352160
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v007_exit:
	EXIT_GOOD
Thr2_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v105 DATA_VA=0x6720001ac000
attr_data {
	Name = .Thr2_User_Data_4v105 ,
	VA = 0x6720001ac000 ,/* 0x6720001adfc0 */
	RA = 0x03800d6000 ,
	PA = 0x03800d6000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006720001ada67 80000003800d6040 */
	end_label   = Thr2_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v105_data_begin
Thr2_User_Data_4v105_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v008 TEXT_VA=0x6720000de000
attr_text {
	Name = .Thr2_User_Text_4v008 ,
	VA = 0x6720000de000 ,/* 0x6720000dffc0 */
	RA = 0x03801d6000 ,
	PA = 0x03801d6000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006720000dfa67 80000003801d6480 */
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
	TOGGLE_LSU_IM
	.word	0xe672a080
	.word	0xc032a2c4
	.word	0x1000000
	or	%g0, 0x190, %i7
	ITLB_TAG_READ
	.word	0xe85c20a0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5eeda8
	.word	0x1000000
	.word	0xbe15c000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x590, %i7
	ITLB_TAG_READ
thr2_MMU_ASI_SECONDARY_159:
	.word	0x87802081
	.word	0xdef16050
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x108, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x03f, %i7
	LOAD_DDATA_IN
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x28, %i7
	DTLB_TAG_READ
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x580, %i7
	READ_IDATA_ACCESS
	.word	0xfcd91000
	.word	0x1000000
	or	%g0, 0x7c0, %i7
	READ_DDATA_ACCESS
thr2_MMU_ASI_BLK_COMMIT_P_160:
	.word	0x878020e0
	.word	0xc1bee280
	.word	0xe4742020
	.word	0xc032a91e
	.word	0xfc995c60
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4dea5e
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v008_exit:
	EXIT_GOOD
Thr2_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v106 DATA_VA=0x69001b400000
attr_data {
	Name = .Thr2_User_Data_4v106 ,
	VA = 0x69001b400000 ,/* 0x69001b7fffc0 */
	RA = 0x027fc00000 ,
	PA = 0x2e7fc00000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000069001b401a67 8000002e7fc00043 */
	end_label   = Thr2_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v106_data_begin
Thr2_User_Data_4v106_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v009 TEXT_VA=0x67200017c000
attr_text {
	Name = .Thr2_User_Text_4v009 ,
	VA = 0x67200017c000 ,/* 0x67200017dfc0 */
	RA = 0x03800f8000 ,
	PA = 0x03800f8000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000067200017da67 80000003800f8480 */
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
	.word	0xee72a0d0
	.word	0xc07527a0
	.word	0x1000000
	or	%g0, 0x52c, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe842008
	.word	0xe8dfd000
	.word	0xd2752050
	.word	0xc02aa3ff
	nop
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	READ_DDATA_ACCESS
	IDEMAP_NCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd876e018
	.word	0xc0366b26
	.word	0xe672a028
	.word	0xc022a160
	.word	0xc07421e8
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc032a6cc
	.word	0xbe82a038
	.word	0xfadfd000
	.word	0xbe8120b0
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x78, %i7
	ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe12c000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x172, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfa776088
	.word	0xc02f6160
	.word	0xe85e6128
	.word	0x1000000
	or	%g0, 0x5ae, %i7
	LOAD_IDATA_ACCESS
	.word	0xf65e6110
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x548, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x138, %i7
	DTLB_TAG_READ
	.word	0xc0242e7c
	.word	0xc035e796
	DDEMAP_ALL_PAGES
	ACCESS_DTSB_PTR
	.word	0xc02aaa53
	.word	0xbe842038
	.word	0xc8dfd000
	.word	0xe8592038
	.word	0x1000000
	.word	0xbe108000
	IDEMAP_RPAGE
	.word	0xe476e0a8
	.word	0xc02c268f
	nop
	nop
	nop
	DDEMAP_PCTX
	.word	0xc025e470
	.word	0xbe82a0e0
	.word	0xd4dfd000
	DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe120000
	DDEMAP_PAGE
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_RPAGES
	.word	0xfc9ed100
	.word	0xc032a2b4
	.word	0xc8742038
	.word	0xc0742388
	TOGGLE_LSU_IM
	.word	0xe476e090
	.word	0xc022a474
	IDEMAP_NCTX
	.word	0xfe592e10
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0xad, %i7
	LOAD_DDATA_ACCESS
	.word	0xc85aa158
	.word	0xfcd91000
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	.word	0xbe82a060
	.word	0xe39fde00
thr2_MMU_ASI_PRIMARY_161:
	.word	0x87802080
	.word	0xfaf76068
	.word	0x1000000
	or	%g0, 0x198, %i7
	LOAD_IDATA_ACCESS
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
	.word	0xd45de038
	.word	0x81c6a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v009_exit:
	EXIT_GOOD
Thr2_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v107 DATA_VA=0x6720000da000
attr_data {
	Name = .Thr2_User_Data_4v107 ,
	VA = 0x6720000da000 ,/* 0x6720000dbfc0 */
	RA = 0x0380060000 ,
	PA = 0x0380060000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006720000dba67 8000000380060040 */
	end_label   = Thr2_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v107_data_begin
Thr2_User_Data_4v107_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00a TEXT_VA=0x67200004c000
attr_text {
	Name = .Thr2_User_Text_4v00a ,
	VA = 0x67200004c000 ,/* 0x67200004dfc0 */
	RA = 0x0380044000 ,
	PA = 0x0380044000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000067200004da67 8000000380044480 */
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
	.word	0xfe45e6f0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x198, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x032, %i7
	LOAD_IDATA_IN
	.word	0xbe158000
	GOTO_SUPERVISOR1
	.word	0xfc9a9000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_PRIMARY_162:
	.word	0x87802080
	.word	0xdcf12028
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda9000
	.word	0xfa766038
	.word	0xc032a318
thr2_MMU_ASI_PRIMARY_163:
	.word	0x87802080
	.word	0xd0f2a028
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd458a068
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v00a_exit:
	EXIT_GOOD
Thr2_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v108 DATA_VA=0x672000088000
attr_data {
	Name = .Thr2_User_Data_4v108 ,
	VA = 0x672000088000 ,/* 0x672000089fc0 */
	RA = 0x03800d4000 ,
	PA = 0x03800d4000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000672000089a67 80000003800d4040 */
	end_label   = Thr2_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v108_data_begin
Thr2_User_Data_4v108_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00b TEXT_VA=0x69001c400000
attr_text {
	Name = .Thr2_User_Text_4v00b ,
	VA = 0x69001c400000 ,/* 0x69001c7fffc0 */
	RA = 0x0270000000 ,
	PA = 0x2e70000000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000069001c401a67 8000002e70000483 */
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
	.word	0x1000000
	or	%g0, 0x052, %i7
	LOAD_IDATA_IN
	.word	0xfc995c60
	.word	0xc0752160
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe150000
	DDEMAP_RPAGE
	.word	0xfc989c40
	.word	0xc0776360
	.word	0xc02de8d5
	.word	0xc0242f70
	IDEMAP_ALL_PAGES
	.word	0xbe866038
	.word	0xc4dfd000
	.word	0xbe85e088
	.word	0xe0dfd000
	ACCESS_DTSB_PTR
	.word	0xfcd95060
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_RPAGES
	.word	0xe05d2130
thr2_MMU_ASI_PRIMARY_164:
	.word	0x87802080
	.word	0xf8f420a8
	.word	0xca72a040
	.word	0xc0752c98
	.word	0xfcdc1000
	DDEMAP_ALL_PAGES
thr2_MMU_ASI_PRIMARY_165:
	.word	0x87802080
	.word	0xdef76118
	.word	0xc032aaba
	IDEMAP_PCTX
	.word	0xe47760f8
	.word	0xc032a824
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_PRIMARY_166:
	.word	0x87802080
	.word	0xcaf2a040
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe13c000
	IDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xea75e078
	.word	0xc02d22d0
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00b_exit:
	EXIT_GOOD
Thr2_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v109 DATA_VA=0x67200017e000
attr_data {
	Name = .Thr2_User_Data_4v109 ,
	VA = 0x67200017e000 ,/* 0x67200017ffc0 */
	RA = 0x038001e000 ,
	PA = 0x038001e000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067200017fa67 800000038001e040 */
	end_label   = Thr2_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v109_data_begin
Thr2_User_Data_4v109_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00c TEXT_VA=0x680000e20000
attr_text {
	Name = .Thr2_User_Text_4v00c ,
	VA = 0x680000e20000 ,/* 0x680000e2ffc0 */
	RA = 0x00107d0000 ,
	PA = 0x00107d0000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000e21a67 80000000107d0481 */
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
	.word	0x1000000
	or	%g0, 0xc8, %i7
	READ_IDATA_ACCESS
thr2_MMU_ASI_PRIMARY_167:
	.word	0x87802080
	.word	0xc6f520e8
	.word	0xfcdc1040
	.word	0xbe80a0d0
	.word	0xeedfd000
	.word	0xe2776018
	.word	0xc02f691d
	DDEMAP_ALL
thr2_MMU_ASI_BLK_COMMIT_S_168:
	.word	0x878020e1
	.word	0xe3b96500
thr2_MMU_ASI_PRIMARY_169:
	.word	0x87802080
	.word	0xd4f420b0
	.word	0x1000000
	or	%g0, 0x529, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe170000
	DDEMAP_PAGE
	IDEMAP_ALL
	DDEMAP_SCTX
thr2_MMU_ASI_PRIMARY_LITTLE_170:
	.word	0x87802088
	.word	0xdcf52028
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x06c, %i7
	LOAD_DDATA_IN
	.word	0xfe45251c
	.word	0xe85aa038
	.word	0x1000000
	or	%g0, 0x2f0, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfc9ddc40
	DDEMAP_NCTX
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	ITLB_TAG_READ
	.word	0xc0376928
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x270, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0742ba8
	.word	0xc0242160
	.word	0xfcd95160
	.word	0xc6742030
	.word	0xc0252608
	.word	0x1000000
	or	%g0, 0x1c8, %i7
	ITLB_TAG_READ
	DDEMAP_ALL_RPAGES
	.word	0xc022ad54
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe842088
	.word	0xd4dfd000
	.word	0xfe5c20c8
	.word	0x1000000
	or	%g0, 0x663, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe82a130
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe140000
	IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc02aa9de
	.word	0xf0752050
	.word	0xc0292d9f
thr2_MMU_ASI_PRIMARY_171:
	.word	0x87802080
	.word	0xe4f0a050
	.word	0xfcdc1000
	.word	0xc022a5c0
	.word	0xe275e018
	.word	0xc035eeea
	.word	0xee5c20f0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd85ee070
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00c_exit:
	EXIT_GOOD
Thr2_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10a DATA_VA=0x6720001ce000
attr_data {
	Name = .Thr2_User_Data_4v10a ,
	VA = 0x6720001ce000 ,/* 0x6720001cffc0 */
	RA = 0x0380120000 ,
	PA = 0x0380120000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006720001cfa67 8000000380120040 */
	end_label   = Thr2_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10a_data_begin
Thr2_User_Data_4v10a_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00d TEXT_VA=0x6720000c6000
attr_text {
	Name = .Thr2_User_Text_4v00d ,
	VA = 0x6720000c6000 ,/* 0x6720000c7fc0 */
	RA = 0x03801c2000 ,
	PA = 0x03801c2000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006720000c7a67 80000003801c2480 */
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
	.word	0x1000000
	or	%g0, 0x138, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x438, %i7
	ITLB_TAG_READ
	.word	0xfcdc1000
	.word	0xbe14c000
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
thr2_MMU_ASI_BLK_COMMIT_S_172:
	.word	0x878020e1
	.word	0xc1bae7c0
	DDEMAP_ALL_PAGES
	.word	0xc0352814
	.word	0xe4776090
	.word	0xc02c291b
	.word	0xd676e010
	.word	0xc025e3e8
	.word	0xbe82a0c0
	.word	0xc39fde00
	.word	0xfe442abc
	TOGGLE_LSU_DM
	.word	0xc02c2336
	.word	0xe675e028
	.word	0xc02de68b
	.word	0xfa72a068
	.word	0xc02c29cd
	.word	0xf6712038
	.word	0xc0366c52
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe100000
	DDEMAP_PAGE
	ACCESS_DTSB_PTR
	DDEMAP_NCTX
	.word	0xf258a0e0
	TOGGLE_LSU_IM
	.word	0xce742108
	.word	0xc0276254
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcde5000
	nop
	nop
	nop
	nop
	DDEMAP_SCTX
thr2_MMU_ASI_PRIMARY_173:
	.word	0x87802080
	.word	0xc6f42060
	.word	0x1000000
	.word	0xbe17c000
	IDEMAP_PAGE
thr2_MMU_ASI_PRIMARY_174:
	.word	0x87802080
	.word	0xf2f52008
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe87420c0
	.word	0xc0252c5c
	.word	0x1000000
	.word	0xbe114000
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
	.word	0x1000000
	or	%g0, 0x46d, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_PAGES
	.word	0xd458a150
	.word	0x1000000
	or	%g0, 0x91, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x087, %i7
	LOAD_DDATA_IN
	.word	0xfe5ee8e8
	.word	0xf472a090
	.word	0xc076e3e0
thr2_MMU_ASI_BLK_COMMIT_S_175:
	.word	0x878020e1
	.word	0xc1b96f40
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xd45de148
	.word	0xc0352dd8
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfe542d88
	.word	0xbe158000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v00d_exit:
	EXIT_GOOD
Thr2_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10b DATA_VA=0x6720000a6000
attr_data {
	Name = .Thr2_User_Data_4v10b ,
	VA = 0x6720000a6000 ,/* 0x6720000a7fc0 */
	RA = 0x0380096000 ,
	PA = 0x0380096000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006720000a7a67 8000000380096040 */
	end_label   = Thr2_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10b_data_begin
Thr2_User_Data_4v10b_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00e TEXT_VA=0x69000e000000
attr_text {
	Name = .Thr2_User_Text_4v00e ,
	VA = 0x69000e000000 ,/* 0x69000e3fffc0 */
	RA = 0x0279400000 ,
	PA = 0x2e79400000 ,
	TTE_Context = 0x1a67 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000069000e001a67 8000002e79400483 */
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
	.word	0x1000000
	or	%g0, 0x754, %i7
	LOAD_DDATA_ACCESS
	.word	0xc0742790
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	.word	0xfc991c40
	.word	0xe05c2088
	.word	0x1000000
	or	%g0, 0x528, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0xc0252cf0
	.word	0xf65aa0a0
	TOGGLE_LSU_IM
	IDEMAP_ALL_PAGES
	.word	0xbe82a0b0
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x558, %i7
	DTLB_TAG_READ
	.word	0xcc712018
	.word	0xc02aa312
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x208, %i7
	READ_DDATA_ACCESS
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4e61d6
	.word	0xc031298e
	.word	0x1000000
	.word	0xbe16c000
	DDEMAP_PAGE
	.word	0xfe4ee1de
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe85de100
	.word	0xfe4c2088
	.word	0x1000000
	or	%g0, 0x6c9, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xd7, %i7
	LOAD_IDATA_ACCESS
	.word	0xc1995f20
	.word	0xfe55e366
	.word	0x1000000
	or	%g0, 0x03d, %i7
	LOAD_DDATA_IN
	nop
	nop
	.word	0x1000000
	or	%g0, 0x04e, %i7
	LOAD_IDATA_IN
	.word	0xbe876128
	.word	0xeedfd040
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x768, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x170, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x59f, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe816010
	.word	0xcadfd020
	.word	0xe19a9f00
thr2_MMU_ASI_SECONDARY_LITTLE_176:
	.word	0x87802089
	.word	0xc4f16068
	.word	0xbe82a0b0
	.word	0xeedfd000
	.word	0xfcda9000
	.word	0xd65aa010
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc4752120
	.word	0xc0276838
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00e_exit:
	EXIT_GOOD
Thr2_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10c DATA_VA=0x680000e10000
attr_data {
	Name = .Thr2_User_Data_4v10c ,
	VA = 0x680000e10000 ,/* 0x680000e1ffc0 */
	RA = 0x0010250000 ,
	PA = 0x0010250000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000e11a67 8000000010250041 */
	end_label   = Thr2_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10c_data_begin
Thr2_User_Data_4v10c_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10d DATA_VA=0x67200015e000
attr_data {
	Name = .Thr2_User_Data_4v10d ,
	VA = 0x67200015e000 ,/* 0x67200015ffc0 */
	RA = 0x0380082000 ,
	PA = 0x0380082000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067200015fa67 8000000380082040 */
	end_label   = Thr2_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10d_data_begin
Thr2_User_Data_4v10d_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10e DATA_VA=0x680000650000
attr_data {
	Name = .Thr2_User_Data_4v10e ,
	VA = 0x680000650000 ,/* 0x68000065ffc0 */
	RA = 0x00105e0000 ,
	PA = 0x00105e0000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000651a67 80000000105e0041 */
	end_label   = Thr2_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10e_data_begin
Thr2_User_Data_4v10e_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10f DATA_VA=0x69002ec00000
attr_data {
	Name = .Thr2_User_Data_4v10f ,
	VA = 0x69002ec00000 ,/* 0x69002effffc0 */
	RA = 0x0275c00000 ,
	PA = 0x2e75c00000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000069002ec01a67 8000002e75c00043 */
	end_label   = Thr2_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10f_data_begin
Thr2_User_Data_4v10f_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v110 DATA_VA=0x690029800000
attr_data {
	Name = .Thr2_User_Data_4v110 ,
	VA = 0x690029800000 ,/* 0x690029bfffc0 */
	RA = 0x0279c00000 ,
	PA = 0x2e79c00000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000690029801a67 8000002e79c00043 */
	end_label   = Thr2_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v110_data_begin
Thr2_User_Data_4v110_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v111 DATA_VA=0x67200004a000
attr_data {
	Name = .Thr2_User_Data_4v111 ,
	VA = 0x67200004a000 ,/* 0x67200004bfc0 */
	RA = 0x038018c000 ,
	PA = 0x038018c000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067200004ba67 800000038018c040 */
	end_label   = Thr2_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v111_data_begin
Thr2_User_Data_4v111_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v112 DATA_VA=0x672000158000
attr_data {
	Name = .Thr2_User_Data_4v112 ,
	VA = 0x672000158000 ,/* 0x672000159fc0 */
	RA = 0x0380006000 ,
	PA = 0x0380006000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000672000159a67 8000000380006040 */
	end_label   = Thr2_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v112_data_begin
Thr2_User_Data_4v112_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v113 DATA_VA=0x680000f20000
attr_data {
	Name = .Thr2_User_Data_4v113 ,
	VA = 0x680000f20000 ,/* 0x680000f2ffc0 */
	RA = 0x0010b60000 ,
	PA = 0x0010b60000 ,
	TTE_Context = 0x1a67 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000f21a67 8000000010b60041 */
	end_label   = Thr2_User_Data_4v113_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v113_data_begin
Thr2_User_Data_4v113_data_begin:
	.xword	0x6a0aa0000000
	.xword	0x680000280000
	.xword	0x6720000e2000
	.xword	0x6720001c0000
	.xword	0x680000100000
	.xword	0x6720000b6000
	.xword	0x6a0b20000000
	.xword	0x680000c30000
	.xword	0x680000cc0000
	.xword	0x680000520000
	.xword	0x680000110000
	.xword	0x672000082000
	.xword	0x680000d80000
	.xword	0x680000370000
	.xword	0x67200007c000
	.xword	0x67200011c000
	.xword	0x672000142000
	.xword	0x6720000f0000
	.xword	0x67200018a000
	.xword	0x6a0140000000
	.xword	0x672000022000
	.xword	0x6720000ea000
	.xword	0x6720001ac000
	.xword	0x6720000de000
	.xword	0x69001b400000
	.xword	0x67200017c000
	.xword	0x6720000da000
	.xword	0x67200004c000
	.xword	0x672000088000
	.xword	0x69001c400000
	.xword	0x67200017e000
	.xword	0x680000e20000
	.xword	0x6720001ce000
	.xword	0x6720000c6000
	.xword	0x6720000a6000
	.xword	0x69000e000000
	.xword	0x680000e10000
	.xword	0x67200015e000
	.xword	0x680000650000
	.xword	0x69002ec00000
	.xword	0x690029800000
	.xword	0x67200004a000
	.xword	0x672000158000
	.xword	0x680000f20000
Thr2_User_Data_4v113_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x6c00000e0000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	VA = 0x6c00000e0000 ,/* 0x6c00000effc0 */
	RA = 0x00205f0000 ,
	PA = 0x34205f0000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c00000e08aa 80000034205f0481 */
	end_label   = Thr3_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr3_user_code_entry
Thr3_user_code_entry:
	setx	0x6c0000f80000, %g1, %g2
	or	%g0, 16, %g1
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
	.word	0xbe8420f8
	.word	0xe0dfd000
thr3_MMU_ASI_PRIMARY_LITTLE_177:
	.word	0x87802088
	.word	0xf0f5a0a8
	.word	0xe45c2018
	.word	0xfc9a9000
thr3_MMU_ASI_PRIMARY_178:
	.word	0x87802080
	.word	0xf4f2a0b8
	.word	0x1000000
	or	%g0, 0x07e, %i7
	LOAD_IDATA_IN
	.word	0xc036eec6
	.word	0xfcda9000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda9000
	DDEMAP_PCTX
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfcd89000
thr3_MMU_ASI_BLK_COMMIT_P_179:
	.word	0x878020e0
	.word	0xe3bc2940
	IDEMAP_PCTX
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x100, %i7
	LOAD_DDATA_ACCESS
thr3_MMU_ASI_PRIMARY_180:
	.word	0x87802080
	.word	0xe6f5a0a8
	ACCESS_DTSB_PTR
thr3_MMU_ASI_PRIMARY_181:
	.word	0x87802080
	.word	0xfcbdace0
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe842068
	.word	0xe0dfd000
	TOGGLE_LSU_IM
	.word	0xee72a048
	.word	0xc025a674
	.word	0x1000000
	or	%g0, 0x650, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x44e, %i7
	LOAD_IDATA_ACCESS
	.word	0xc02aa3ea
	.word	0xbe816010
	.word	0xcadfd060
thr3_MMU_ASI_PRIMARY_182:
	.word	0x87802080
	.word	0xecf2a068
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe45aa018
	.word	0x81c0e088
	.word	0xbe174000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v000_exit:
	EXIT_GOOD
Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v100 DATA_VA=0x6c0000f80000
attr_data {
	Name = .Thr3_User_Data_4v100 ,
	VA = 0x6c0000f80000 ,/* 0x6c0000f8ffc0 */
	RA = 0x0020c40000 ,
	PA = 0x3420c40000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c0000f808aa 8000003420c40041 */
	end_label   = Thr3_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v100_data_begin
Thr3_User_Data_4v100_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v200 DATA_VA=0x6d0013c00000
attr_data {
	Name = .Thr3_User_Data_4v200 ,
	VA = 0x6d0013c00000 ,/* 0x6d0013ffffc0 */
	RA = 0x028f400000 ,
	PA = 0x028f400000 ,
	TTE_Context = 0x0e5a ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006d0013c00e5a 800000028f400043 */
	end_label   = Thr3_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v200_data_begin
Thr3_User_Data_4v200_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v300 DATA_VA=0x6b300005a000
attr_data {
	Name = .Thr3_User_Data_4v300 ,
	VA = 0x6b300005a000 ,/* 0x6b300005bfc0 */
	RA = 0x03900ae000 ,
	PA = 0x03900ae000 ,
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
	/* DTTE_TAG_DATA = 00006b300005a000 80000003900ae440 */
	end_label   = Thr3_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v300_data_begin
Thr3_User_Data_4v300_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v001 TEXT_VA=0x6c0000a30000
attr_text {
	Name = .Thr3_User_Text_4v001 ,
	VA = 0x6c0000a30000 ,/* 0x6c0000a3ffc0 */
	RA = 0x0020f70000 ,
	PA = 0x3420f70000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000a308aa 8000003420f70481 */
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
	.word	0xbe82a068
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x500, %i7
	READ_DDATA_ACCESS
thr3_MMU_ASI_BLK_P_183:
	.word	0x878020f0
	.word	0xc3baaa80
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_184:
	.word	0x87802080
	.word	0xfaf42020
	.word	0xfcda9000
	DDEMAP_ALL
	.word	0xfc989000
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	TOGGLE_LSU_IM
	IDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a0d8
	.word	0xe0dfd040
	TOGGLE_LSU_DM
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0xd5, %i7
	LOAD_DDATA_ACCESS
	.word	0xf47120c8
	.word	0xc028a814
thr3_MMU_ASI_PRIMARY_185:
	.word	0x87802080
	.word	0xe0f12138
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfc995d60
	.word	0x1000000
	or	%g0, 0x0, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x618, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe148000
	IDEMAP_PAGE
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4da589
thr3_MMU_ASI_PRIMARY_186:
	.word	0x87802080
	.word	0xeaf120f0
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x780, %i7
	DTLB_TAG_READ
	.word	0xc028ae70
	.word	0x1000000
	or	%g0, 0x0a4, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x498, %i7
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
	nop
	nop
	.word	0x1000000
	.word	0xbe138000
	DDEMAP_PAGE
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
	nop
	nop
	.word	0x1000000
	or	%g0, 0x30, %i7
	ITLB_TAG_READ
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x046, %i7
	LOAD_DDATA_IN
thr3_MMU_ASI_BLK_P_187:
	.word	0x878020f0
	.word	0xc3baa3c0
	.word	0xbe8420c0
	.word	0xe0dfd000
	.word	0xf6742128
	.word	0xc02da587
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xc0212930
	nop
	nop
	nop
	.word	0xc025ac88
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	DTLB_TAG_READ
	.word	0xc476e098
	.word	0xc075a518
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xd276e0d0
	.word	0xc022a5c4
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v001_exit:
	EXIT_GOOD
Thr3_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v400 TEXT_VA=0x6d002f000000
attr_text {
	Name = .Thr3_User_Text_4v400 ,
	VA = 0x6d002f000000 ,/* 0x6d002f3fffc0 */
	RA = 0x0287400000 ,
	PA = 0x0287400000 ,
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
	/* ITTE_TAG_DATA = 00006d002f000000 8000000287400083 */
	end_label   = Thr3_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v400_text_begin
Thr3_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xc021a7c8
	.word	0xfc995d60
	P_ACCESS_DTSB_PTR
thr3_MMU_ASI_AS_IF_USER_PRIMARY_188:
	.word	0x87802010
	.word	0xecf2a038
	nop
	.word	0x1000000
	or	%g0, 0x479, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xdc71a0b0
	.word	0xc071aff8
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x398, %i7
	P_DTLB_TAG_READ
thr3_MMU_ASI_PRIMARY_LITTLE_189:
	.word	0x87802088
	.word	0xc8f5a068
	P_TOGGLE_LSU_DM
	P_DDEMAP_ALL
	P_DDEMAP_ALL_RPAGES
	P_TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_190:
	.word	0x87802080
	.word	0xdaf2a110
thr3_MMU_ASI_AS_IF_USER_PRIMARY_191:
	.word	0x87802010
	.word	0xc8f2a138
	.word	0xbe8120c0
	.word	0xd4dfd000
	.word	0xfe5ca480
	.word	0xfcded000
	P_IDEMAP_PCTX
	P_TOGGLE_LSU_DM
	.word	0xca59a040
	.word	0x1000000
	.word	0xbe17c000
	P_IDEMAP_PAGE
thr3_MMU_ASI_AS_IF_USER_PRIMARY_192:
	.word	0x87802010
	.word	0xc4f5a038
thr3_MMU_ASI_PRIMARY_193:
	.word	0x87802080
	.word	0xd2f2a0e0
	.word	0xfe59a380
	P_TOGGLE_LSU_DM
	P_DDEMAP_SCTX
	.word	0x1000000
	.word	0xbe138000
	P_IDEMAP_PAGE
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_194:
	.word	0x87802022
	.word	0xe8bda480
	.word	0x1000000
	or	%g0, 0x688, %i7
	P_READ_DDATA_ACCESS
	.word	0xf659a128
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v400_exit:
	EXIT_GOOD
Thr3_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v002 TEXT_VA=0x6c0000970000
attr_text {
	Name = .Thr3_User_Text_4v002 ,
	VA = 0x6c0000970000 ,/* 0x6c000097ffc0 */
	RA = 0x00203b0000 ,
	PA = 0x34203b0000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c00009708aa 80000034203b0481 */
	end_label   = Thr3_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v002_text_begin
Thr3_User_Text_4v002_text_begin:
	wrpr	0, %gl
	nop
	nop
	.word	0x1000000
	or	%g0, 0x014, %i7
	P_LOAD_IDATA_IN
	P_IDEMAP_NCTX
	.word	0xbe80a008
	.word	0xf6dfd000
	.word	0x1000000
	or	%g0, 0x210, %i7
	P_READ_DDATA_ACCESS
	.word	0xfcda8200
	P_DDEMAP_ALL
thr3_MMU_ASI_REAL_IO_LITTLE_195:
	.word	0x8780201d
	.word	0xdef2e0a8
thr3_MMU_ASI_PRIMARY_196:
	.word	0x87802080
	.word	0xccf2a018
	.word	0x1000000
	or	%g0, 0xf0, %i7
	P_READ_DDATA_ACCESS
	.word	0xfcda8200
	.word	0x1000000
	or	%g0, 0x130, %i7
	P_READ_DDATA_ACCESS
	P_ACCESS_DTSB_PTR
	P_IDEMAP_ALL
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v002_exit:
	EXIT_GOOD
Thr3_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v101 DATA_VA=0x6b3000154000
attr_data {
	Name = .Thr3_User_Data_4v101 ,
	VA = 0x6b3000154000 ,/* 0x6b3000155fc0 */
	RA = 0x0390162000 ,
	PA = 0x0390162000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b30001548aa 8000000390162040 */
	end_label   = Thr3_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v101_data_begin
Thr3_User_Data_4v101_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v201 DATA_VA=0x6b300006e000
attr_data {
	Name = .Thr3_User_Data_4v201 ,
	VA = 0x6b300006e000 ,/* 0x6b300006ffc0 */
	RA = 0x03900ea000 ,
	PA = 0x03900ea000 ,
	TTE_Context = 0x0e5a ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006b300006ee5a 80000003900ea040 */
	end_label   = Thr3_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v201_data_begin
Thr3_User_Data_4v201_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v301 DATA_VA=0x6d002f400000
attr_data {
	Name = .Thr3_User_Data_4v301 ,
	VA = 0x6d002f400000 ,/* 0x6d002f7fffc0 */
	RA = 0x028e800000 ,
	PA = 0x028e800000 ,
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
	/* DTTE_TAG_DATA = 00006d002f400000 800000028e800443 */
	end_label   = Thr3_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v301_data_begin
Thr3_User_Data_4v301_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v003 TEXT_VA=0x6b300000a000
attr_text {
	Name = .Thr3_User_Text_4v003 ,
	VA = 0x6b300000a000 ,/* 0x6b300000bfc0 */
	RA = 0x0390020000 ,
	PA = 0x0390020000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b300000a8aa 8000000390020480 */
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
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0xe8, %i7
	ITLB_TAG_READ
	.word	0xe472a078
	.word	0xc0342882
	ACCESS_ITSB_PTR
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x506, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1a1, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
thr3_MMU_ASI_PRIMARY_LITTLE_197:
	.word	0x87802088
	.word	0xe2f6e070
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x400, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe470a048
	.word	0xc02c2b25
	.word	0xf65aa038
	TOGGLE_LSU_DM
thr3_MMU_ASI_SECONDARY_198:
	.word	0x87802081
	.word	0xd2f2e050
	.word	0x1000000
	or	%g0, 0x183, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	.word	0xc026ea6c
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x03f, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x68, %i7
	ITLB_TAG_READ
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xd472a0c0
	.word	0xc028a80a
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v003_exit:
	EXIT_GOOD
Thr3_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v401 TEXT_VA=0x6c0000b50000
attr_text {
	Name = .Thr3_User_Text_4v401 ,
	VA = 0x6c0000b50000 ,/* 0x6c0000b5ffc0 */
	RA = 0x0020000000 ,
	PA = 0x3420000000 ,
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
	/* ITTE_TAG_DATA = 00006c0000b50000 8000003420000081 */
	end_label   = Thr3_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v401_text_begin
Thr3_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x051, %i7
	P_LOAD_DDATA_IN
	.word	0xfcdec200
	P_DDEMAP_NCTX
	.word	0xfcd95120
	.word	0x1000000
	or	%g0, 0x00a, %i7
	P_LOAD_IDATA_IN
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_199:
	.word	0x8780202b
	.word	0xe4b96d40
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x468, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe82a0d8
	.word	0xc4dfc200
	.word	0xf2732058
	.word	0xc071a820
	.word	0x1000000
	or	%g0, 0x5ac, %i7
	P_LOAD_IDATA_ACCESS
	P_IDEMAP_NCTX
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v401_exit:
	EXIT_GOOD
Thr3_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v004 TEXT_VA=0x6c0000ca0000
attr_text {
	Name = .Thr3_User_Text_4v004 ,
	VA = 0x6c0000ca0000 ,/* 0x6c0000caffc0 */
	RA = 0x0020800000 ,
	PA = 0x3420800000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000ca08aa 8000003420800481 */
	end_label   = Thr3_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v004_text_begin
Thr3_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xe475a048
	.word	0xc032acce
	.word	0x1000000
	or	%g0, 0x580, %i7
	P_ITLB_TAG_READ
	.word	0xbe80a038
	.word	0xe0dfd000
	.word	0xbe8420e8
	.word	0xecdfc200
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe14c000
	P_IDEMAP_RPAGE
	.word	0xd45ee108
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x538, %i7
	P_READ_IDATA_ACCESS
	P_IDEMAP_ALL
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x418, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_NCTX
	P_TOGGLE_LSU_DM
	P_IDEMAP_NCTX
	.word	0xfcda8200
	.word	0xbe80a038
	.word	0xf6dfd000
	.word	0xbe80a118
	.word	0xf6dfc200
	P_TOGGLE_LSU_DM
thr3_MMU_ASI_PRIMARY_200:
	.word	0x87802080
	.word	0xdcf0a0b0
	.word	0xc45c20f8
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	P_DTLB_TAG_READ
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x003, %i7
	P_LOAD_IDATA_IN
	.word	0xfcd88200
	P_TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9b0480
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x023, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8420d8
	.word	0xe0dfc200
	.word	0xc0342646
	.word	0x1000000
	or	%g0, 0x02f, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x03d, %i7
	P_LOAD_DDATA_IN
	.word	0xbe80a0d0
	.word	0xe19fde00
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x41d, %i7
	P_LOAD_DDATA_ACCESS
	P_DDEMAP_ALL_PAGES
	.word	0xfc9b04e0
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x10, %i7
	P_READ_IDATA_ACCESS
	P_IDEMAP_ALL_RPAGES
	.word	0xbe80a098
	.word	0xf6dfc200
	.word	0x1000000
	or	%g0, 0x045, %i7
	P_LOAD_IDATA_IN
thr3_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_201:
	.word	0x87802018
	.word	0xdaf5a0a8
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xbe8420f8
	.word	0xecdfc200
	.word	0x1000000
	or	%g0, 0x4a0, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe12c000
	P_DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe120000
	P_IDEMAP_RPAGE
	.word	0xfcd88200
	.word	0xee742018
	.word	0xc02ee7d8
	P_TOGGLE_LSU_IM
	P_IDEMAP_ALL
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v004_exit:
	EXIT_GOOD
Thr3_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v102 DATA_VA=0x6b30000b8000
attr_data {
	Name = .Thr3_User_Data_4v102 ,
	VA = 0x6b30000b8000 ,/* 0x6b30000b9fc0 */
	RA = 0x03900a6000 ,
	PA = 0x03900a6000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b30000b88aa 80000003900a6040 */
	end_label   = Thr3_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v102_data_begin
Thr3_User_Data_4v102_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v202 DATA_VA=0x6b30001ee000
attr_data {
	Name = .Thr3_User_Data_4v202 ,
	VA = 0x6b30001ee000 ,/* 0x6b30001effc0 */
	RA = 0x03900e8000 ,
	PA = 0x03900e8000 ,
	TTE_Context = 0x0e5a ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006b30001eee5a 80000003900e8040 */
	end_label   = Thr3_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v202_data_begin
Thr3_User_Data_4v202_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v302 DATA_VA=0x6b3000068000
attr_data {
	Name = .Thr3_User_Data_4v302 ,
	VA = 0x6b3000068000 ,/* 0x6b3000069fc0 */
	RA = 0x039011e000 ,
	PA = 0x039011e000 ,
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
	/* DTTE_TAG_DATA = 00006b3000068000 800000039011e440 */
	end_label   = Thr3_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v302_data_begin
Thr3_User_Data_4v302_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v005 TEXT_VA=0x6c0000dd0000
attr_text {
	Name = .Thr3_User_Text_4v005 ,
	VA = 0x6c0000dd0000 ,/* 0x6c0000ddffc0 */
	RA = 0x0020cf0000 ,
	PA = 0x3420cf0000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000dd08aa 8000003420cf0481 */
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
	.word	0xee72a018
	.word	0xc02daaf5
	.word	0x1000000
	or	%g0, 0x458, %i7
	ITLB_TAG_READ
thr3_MMU_ASI_PRIMARY_202:
	.word	0x87802080
	.word	0xdcf2a028
	TOGGLE_LSU_IM
	.word	0xbe82a008
	.word	0xecdfd000
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5c21d0
	.word	0xfcdc1000
	.word	0xc02aa8a3
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x416, %i7
	LOAD_IDATA_ACCESS
	.word	0xf075a050
	.word	0xc035ab52
thr3_MMU_ASI_PRIMARY_LITTLE_203:
	.word	0x87802088
	.word	0xfcb92e70
	.word	0xbe174000
	GOTO_SUPERVISOR0
	.word	0xe05c2038
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v005_exit:
	EXIT_GOOD
Thr3_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v402 TEXT_VA=0x6d0027c00000
attr_text {
	Name = .Thr3_User_Text_4v402 ,
	VA = 0x6d0027c00000 ,/* 0x6d0027ffffc0 */
	RA = 0x028a800000 ,
	PA = 0x028a800000 ,
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
	/* ITTE_TAG_DATA = 00006d0027c00000 800000028a800083 */
	end_label   = Thr3_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v402_text_begin
Thr3_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xd471a098
	.word	0xc021a728
	.word	0xe19d9f00
	.word	0x1000000
	or	%g0, 0x38, %i7
	P_ITLB_TAG_READ
thr3_MMU_ASI_PRIMARY_LITTLE_204:
	.word	0x87802088
	.word	0xe4bc2c60
	P_ACCESS_DTSB_PTR
	.word	0xbe82a098
	.word	0xe0dfd000
	.word	0xfcd90200
	.word	0xd45ca138
	.word	0xc3995f20
	.word	0xfcd91000
thr3_MMU_ASI_BLK_COMMIT_S_205:
	.word	0x878020e1
	.word	0xc3bae680
thr3_MMU_ASI_BLK_P_206:
	.word	0x878020f0
	.word	0xc1beef00
	.word	0xfc995020
	.word	0xbe842038
	.word	0xd4dfc200
	.word	0xfcdec200
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v402_exit:
	EXIT_GOOD
Thr3_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v006 TEXT_VA=0x6b30000fa000
attr_text {
	Name = .Thr3_User_Text_4v006 ,
	VA = 0x6b30000fa000 ,/* 0x6b30000fbfc0 */
	RA = 0x03901ca000 ,
	PA = 0x03901ca000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b30000fa8aa 80000003901ca480 */
	end_label   = Thr3_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v006_text_begin
Thr3_User_Text_4v006_text_begin:
	wrpr	0, %gl
	P_ACCESS_ITSB_PTR
	.word	0xfcda9000
	.word	0xe875a088
	.word	0xc032ae36
thr3_MMU_ASI_PRIMARY_207:
	.word	0x87802080
	.word	0xcaf2a040
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xc022a308
	.word	0xc472a008
	.word	0xc0742458
	.word	0xfe5aace0
	.word	0xfc9dc4e0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda9000
thr3_MMU_ASI_PRIMARY_208:
	.word	0x87802080
	.word	0xd2f5a0e0
thr3_MMU_ASI_SECONDARY_LITTLE_209:
	.word	0x87802089
	.word	0xd0bc6420
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v006_exit:
	EXIT_GOOD
Thr3_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v103 DATA_VA=0x6d0022400000
attr_data {
	Name = .Thr3_User_Data_4v103 ,
	VA = 0x6d0022400000 ,/* 0x6d00227fffc0 */
	RA = 0x0287c00000 ,
	PA = 0x0287c00000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006d00224008aa 8000000287c00043 */
	end_label   = Thr3_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v103_data_begin
Thr3_User_Data_4v103_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v303 DATA_VA=0x6d002fc00000
attr_data {
	Name = .Thr3_User_Data_4v303 ,
	VA = 0x6d002fc00000 ,/* 0x6d002fffffc0 */
	RA = 0x0283000000 ,
	PA = 0x0283000000 ,
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
	/* DTTE_TAG_DATA = 00006d002fc00000 8000000283000443 */
	end_label   = Thr3_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v303_data_begin
Thr3_User_Data_4v303_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v007 TEXT_VA=0x6c0000fd0000
attr_text {
	Name = .Thr3_User_Text_4v007 ,
	VA = 0x6c0000fd0000 ,/* 0x6c0000fdffc0 */
	RA = 0x0020d40000 ,
	PA = 0x3420d40000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000fd08aa 8000003420d40481 */
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
	.word	0xc036ef48
	.word	0xfc9a9c40
	.word	0xfcd91000
	.word	0xc0742b58
	DDEMAP_ALL
thr3_MMU_ASI_PRIMARY_210:
	.word	0x87802080
	.word	0xc8baa150
	.word	0xfe46e178
	IDEMAP_ALL_RPAGES
	.word	0xfa70a0c8
	.word	0xc036e8ac
	.word	0xfc9d9c40
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe16c000
	DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_RPAGE
	.word	0xe275a010
	.word	0xc072ad68
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xc036e1f8
	.word	0x81c36000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v007_exit:
	EXIT_GOOD
Thr3_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v403 TEXT_VA=0x6c0000bb0000
attr_text {
	Name = .Thr3_User_Text_4v403 ,
	VA = 0x6c0000bb0000 ,/* 0x6c0000bbffc0 */
	RA = 0x00209e0000 ,
	PA = 0x34209e0000 ,
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
	/* ITTE_TAG_DATA = 00006c0000bb0000 80000034209e0081 */
	end_label   = Thr3_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v403_text_begin
Thr3_User_Text_4v403_text_begin:
	wrpr	0, %gl
	.word	0xfcdd8200
	.word	0x1000000
	or	%g0, 0x350, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x199, %i7
	P_LOAD_IDATA_ACCESS
thr3_MMU_ASI_PRIMARY_211:
	.word	0x87802080
	.word	0xdcf6e0b0
	.word	0xfc9edc40
	.word	0xc45b2118
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_212:
	.word	0x8780202a
	.word	0xecbc2db0
	.word	0xc025ebc8
thr3_MMU_ASI_BLK_S_213:
	.word	0x878020f1
	.word	0xc3b96f00
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v403_exit:
	EXIT_GOOD
Thr3_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v008 TEXT_VA=0x6d001bc00000
attr_text {
	Name = .Thr3_User_Text_4v008 ,
	VA = 0x6d001bc00000 ,/* 0x6d001bffffc0 */
	RA = 0x0280400000 ,
	PA = 0x0280400000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d001bc008aa 8000000280400483 */
	end_label   = Thr3_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v008_text_begin
Thr3_User_Text_4v008_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x077, %i7
	P_LOAD_IDATA_IN
	.word	0xc85da108
	.word	0xbe82e138
	.word	0xf0dfc280
thr3_MMU_ASI_PRIMARY_214:
	.word	0x87802080
	.word	0xe4f6e0a0
	.word	0x1000000
	or	%g0, 0x095, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0xb8, %i7
	P_READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_215:
	.word	0x87802018
	.word	0xf8f6e050
	.word	0xbe82a098
	.word	0xf6dfd000
	.word	0xbe842068
	.word	0xecdfd000
	.word	0xfc998580
	.word	0xe39c42e0
	.word	0x1000000
	or	%g0, 0x3a8, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfe52ad56
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x22d, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcd95160
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe52abf0
thr3_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_216:
	.word	0x87802018
	.word	0xf2f5a028
	.word	0x1000000
	or	%g0, 0x748, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe816010
	.word	0xcadfd020
	.word	0xbe846010
	.word	0xc19fc2e0
	P_IDEMAP_ALL_RPAGES
	.word	0xc07426e8
	.word	0x1000000
	or	%g0, 0x055, %i7
	P_LOAD_IDATA_IN
	.word	0xdc742088
	.word	0xc026e1f8
	P_DDEMAP_ALL_RPAGES
	.word	0xfcdc1000
	P_IDEMAP_ALL
	.word	0xe05aa148
	.word	0xc0742b08
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v008_exit:
	EXIT_GOOD
Thr3_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v104 DATA_VA=0x6e0760000000
attr_data {
	Name = .Thr3_User_Data_4v104 ,
	VA = 0x6e0760000000 ,/* 0x6e076fffffc0 */
	RA = 0x00a0000000 ,
	PA = 0x00a0000000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006e07600008aa 80000000a0000045 */
	end_label   = Thr3_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v104_data_begin
Thr3_User_Data_4v104_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v009 TEXT_VA=0x6c0000250000
attr_text {
	Name = .Thr3_User_Text_4v009 ,
	VA = 0x6c0000250000 ,/* 0x6c000025ffc0 */
	RA = 0x0020470000 ,
	PA = 0x3420470000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c00002508aa 8000003420470481 */
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
	.word	0x1000000
	or	%g0, 0x17f, %i7
	LOAD_DDATA_ACCESS
	.word	0xc02c2e98
	TOGGLE_LSU_DM
	.word	0xbe154000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0xfcdd9000
	.word	0xfe45a590
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0xf0, %i7
	READ_IDATA_ACCESS
	.word	0xe0592118
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe070a038
	.word	0xc02ee76c
	nop
	.word	0x1000000
	or	%g0, 0x2a2, %i7
	LOAD_DDATA_ACCESS
thr3_MMU_ASI_BLK_P_217:
	.word	0x878020f0
	.word	0xc1bdadc0
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xc0242d88
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v009_exit:
	EXIT_GOOD
Thr3_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00a TEXT_VA=0x6d003f000000
attr_text {
	Name = .Thr3_User_Text_4v00a ,
	VA = 0x6d003f000000 ,/* 0x6d003f3fffc0 */
	RA = 0x0286000000 ,
	PA = 0x0286000000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d003f0008aa 8000000286000483 */
	end_label   = Thr3_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00a_text_begin
Thr3_User_Text_4v00a_text_begin:
	wrpr	0, %gl
	.word	0xec5aa128
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9b0480
	.word	0x1000000
	or	%g0, 0x01f, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x57d, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x630, %i7
	P_READ_DDATA_ACCESS
	.word	0xfc998580
	.word	0x1000000
	or	%g0, 0x338, %i7
	P_DTLB_TAG_READ
thr3_MMU_ASI_PRIMARY_218:
	.word	0x87802080
	.word	0xe4beed90
	.word	0xf65da0f8
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0xa8, %i7
	P_ITLB_TAG_READ
thr3_MMU_ASI_AS_IF_USER_PRIMARY_219:
	.word	0x87802010
	.word	0xccf5a018
	.word	0xfcda9000
	nop
	nop
	.word	0xe05ee0f8
	.word	0xbe8420c0
	.word	0xd4dfd040
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_220:
	.word	0x8780202a
	.word	0xf0baa9b0
	.word	0xbe80a0d8
	.word	0xd4dfc200
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x089, %i7
	P_LOAD_IDATA_IN
	P_TOGGLE_LSU_DM
	P_ACCESS_DTSB_PTR
thr3_MMU_ASI_SECONDARY_LITTLE_221:
	.word	0x87802089
	.word	0xd4f16138
thr3_MMU_ASI_SECONDARY_LITTLE_222:
	.word	0x87802089
	.word	0xc8b965c0
	.word	0xbe85a000
	.word	0xe39fde00
thr3_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_223:
	.word	0x87802018
	.word	0xe0f5a098
	P_ACCESS_ITSB_PTR
	.word	0xfcd91000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v00a_exit:
	EXIT_GOOD
Thr3_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v105 DATA_VA=0x6d0021800000
attr_data {
	Name = .Thr3_User_Data_4v105 ,
	VA = 0x6d0021800000 ,/* 0x6d0021bfffc0 */
	RA = 0x0286400000 ,
	PA = 0x0286400000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006d00218008aa 8000000286400043 */
	end_label   = Thr3_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v105_data_begin
Thr3_User_Data_4v105_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00b TEXT_VA=0x6b30000bc000
attr_text {
	Name = .Thr3_User_Text_4v00b ,
	VA = 0x6b30000bc000 ,/* 0x6b30000bdfc0 */
	RA = 0x0390002000 ,
	PA = 0x0390002000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b30000bc8aa 8000000390002480 */
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
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x118, %i7
	ITLB_TAG_READ
	.word	0xdc75a058
	.word	0xc072a590
	DDEMAP_NCTX
	.word	0xc0312bbe
	IDEMAP_ALL
thr3_MMU_ASI_PRIMARY_224:
	.word	0x87802080
	.word	0xd8f42048
	.word	0x1000000
	or	%g0, 0x05d, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_IM
	IDEMAP_PCTX
	.word	0xc3995f20
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe816040
	.word	0xcadfd060
	.word	0xe258a010
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	nop
	.word	0xec5aa098
	.word	0xc02eeeff
	.word	0xfe46e85c
	DDEMAP_ALL_RPAGES
	.word	0xc45ee118
	TOGGLE_LSU_IM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc45c2068
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x98, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x49f, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5cb, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x50, %i7
	READ_DDATA_ACCESS
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xce70a150
	.word	0xc022a28c
	.word	0xc0242ea8
	.word	0xbe812038
	.word	0xd4dfd000
thr3_MMU_ASI_PRIMARY_LITTLE_225:
	.word	0x87802088
	.word	0xf2f0a028
	.word	0x1000000
	or	%g0, 0x083, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x75f, %i7
	LOAD_DDATA_ACCESS
	.word	0xcc5aa048
	.word	0x1000000
	or	%g0, 0x04c, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe138000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x7f8, %i7
	LOAD_DDATA_ACCESS
thr3_MMU_ASI_BLK_P_226:
	.word	0x878020f0
	.word	0xc1b8a340
	.word	0xc076e158
	.word	0x1000000
	.word	0xbe11c000
	IDEMAP_RPAGE
	.word	0xec5c2098
	IDEMAP_PCTX
	.word	0x1000000
	.word	0xbe124000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x6f0, %i7
	READ_DDATA_ACCESS
	.word	0xca5da070
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf65c2098
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v00b_exit:
	EXIT_GOOD
Thr3_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v106 DATA_VA=0x6d001b800000
attr_data {
	Name = .Thr3_User_Data_4v106 ,
	VA = 0x6d001b800000 ,/* 0x6d001bbfffc0 */
	RA = 0x0283400000 ,
	PA = 0x0283400000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006d001b8008aa 8000000283400043 */
	end_label   = Thr3_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v106_data_begin
Thr3_User_Data_4v106_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00c TEXT_VA=0x6b3000102000
attr_text {
	Name = .Thr3_User_Text_4v00c ,
	VA = 0x6b3000102000 ,/* 0x6b3000103fc0 */
	RA = 0x0390188000 ,
	PA = 0x0390188000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b30001028aa 8000000390188480 */
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
thr3_MMU_ASI_BLK_COMMIT_P_227:
	.word	0x878020e0
	.word	0xc1bee7c0
	.word	0xf272a028
	.word	0xc070a8b0
	nop
	nop
	nop
	nop
	nop
	DDEMAP_SCTX
thr3_MMU_ASI_BLK_COMMIT_P_228:
	.word	0x878020e0
	.word	0xe1b8ac00
	.word	0x1000000
	or	%g0, 0x4af, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_ALL_PAGES
	.word	0xbe816010
	.word	0xe19fde20
	.word	0xdc712088
	.word	0xc036ed60
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe154000
	GOTO_SUPERVISOR0
thr3_MMU_ASI_BLK_P_229:
	.word	0x878020f0
	.word	0xe1bda300
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x2e0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	nop
	.word	0x1000000
	or	%g0, 0x408, %i7
	READ_IDATA_ACCESS
	.word	0xfcded000
	.word	0xfc9d9000
	.word	0xbe168000
	GOTO_SUPERVISOR0
thr3_MMU_ASI_SECONDARY_230:
	.word	0x87802081
	.word	0xf0f160d0
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0xe0, %i7
	ITLB_TAG_READ
	.word	0xc075ad60
	.word	0xe0592038
	IDEMAP_ALL
	.word	0xd0712028
	.word	0xc076e1b0
thr3_MMU_ASI_PRIMARY_231:
	.word	0x87802080
	.word	0xeef6e018
	.word	0x1000000
	or	%g0, 0x60, %i7
	ITLB_TAG_READ
	ACCESS_ITSB_PTR
	nop
	.word	0x1000000
	or	%g0, 0x37, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe42aed8
	.word	0xc02aa1c7
	.word	0x1000000
	or	%g0, 0x068, %i7
	LOAD_DDATA_IN
	.word	0xda742110
	.word	0xc02aa158
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x5d8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe118000
	DDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xc458a0c0
	.word	0xbe82e010
	.word	0xc39fde20
	.word	0xbe82a098
	.word	0xc4dfd040
	nop
	nop
thr3_MMU_ASI_BLK_COMMIT_P_232:
	.word	0x878020e0
	.word	0xe1b8a600
	nop
	nop
	nop
	nop
	nop
	.word	0xc076ebe8
	.word	0xbe82a008
	.word	0xecdfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xec5da098
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc0212cdc
	.word	0xbe174000
	GOTO_SUPERVISOR0
	.word	0xc028a8e8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v00c_exit:
	EXIT_GOOD
Thr3_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v107 DATA_VA=0x6c0000a00000
attr_data {
	Name = .Thr3_User_Data_4v107 ,
	VA = 0x6c0000a00000 ,/* 0x6c0000a0ffc0 */
	RA = 0x0020030000 ,
	PA = 0x3420030000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c0000a008aa 8000003420030041 */
	end_label   = Thr3_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v107_data_begin
Thr3_User_Data_4v107_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00d TEXT_VA=0x6b300015a000
attr_text {
	Name = .Thr3_User_Text_4v00d ,
	VA = 0x6b300015a000 ,/* 0x6b300015bfc0 */
	RA = 0x03900f2000 ,
	PA = 0x03900f2000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b300015a8aa 80000003900f2480 */
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
	nop
	nop
	nop
	nop
	nop
	nop
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
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0xd0, %i7
	READ_IDATA_ACCESS
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x563, %i7
	LOAD_DDATA_ACCESS
	.word	0xe475a018
	.word	0xc0342520
	ACCESS_ITSB_PTR
	.word	0xc072a7e0
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xe870a028
	.word	0xc076ec20
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd65da040
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v00d_exit:
	EXIT_GOOD
Thr3_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v108 DATA_VA=0x6d002b800000
attr_data {
	Name = .Thr3_User_Data_4v108 ,
	VA = 0x6d002b800000 ,/* 0x6d002bbfffc0 */
	RA = 0x0280c00000 ,
	PA = 0x0280c00000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006d002b8008aa 8000000280c00043 */
	end_label   = Thr3_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v108_data_begin
Thr3_User_Data_4v108_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00e TEXT_VA=0x6b30001d8000
attr_text {
	Name = .Thr3_User_Text_4v00e ,
	VA = 0x6b30001d8000 ,/* 0x6b30001d9fc0 */
	RA = 0x03901e8000 ,
	PA = 0x03901e8000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b30001d88aa 80000003901e8480 */
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
	.word	0x1000000
	or	%g0, 0x06a, %i7
	LOAD_IDATA_IN
	.word	0xfcd95060
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd6592070
	.word	0xc032a4ec
	IDEMAP_NCTX
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
	.word	0x1000000
	.word	0xbe144000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfc9d9c40
	.word	0x1000000
	or	%g0, 0x788, %i7
	DTLB_TAG_READ
	.word	0xbe85a098
	.word	0xc4dfd040
	nop
	nop
	nop
	nop
	.word	0xcc75a018
	.word	0xc026eac4
	IDEMAP_ALL_RPAGES
	.word	0xf0712110
	.word	0xc075a9b8
	.word	0xfe55afa8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd45da0e8
	DDEMAP_ALL_PAGES
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x520, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x063, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	.word	0xfe5da348
	.word	0xbe82a038
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x188, %i7
	DTLB_TAG_READ
thr3_MMU_ASI_SECONDARY_233:
	.word	0x87802081
	.word	0xdcb96c80
	nop
	nop
	nop
	nop
	nop
	.word	0xc0342986
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x780, %i7
	READ_DDATA_ACCESS
thr3_MMU_ASI_PRIMARY_234:
	.word	0x87802080
	.word	0xc4f420c0
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xca58a010
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00e_exit:
	EXIT_GOOD
Thr3_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v109 DATA_VA=0x6d001a800000
attr_data {
	Name = .Thr3_User_Data_4v109 ,
	VA = 0x6d001a800000 ,/* 0x6d001abfffc0 */
	RA = 0x0287800000 ,
	PA = 0x0287800000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006d001a8008aa 8000000287800043 */
	end_label   = Thr3_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v109_data_begin
Thr3_User_Data_4v109_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00f TEXT_VA=0x6b300004e000
attr_text {
	Name = .Thr3_User_Text_4v00f ,
	VA = 0x6b300004e000 ,/* 0x6b300004ffc0 */
	RA = 0x03901b8000 ,
	PA = 0x03901b8000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b300004e8aa 80000003901b8480 */
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
	.word	0xfcdd9000
thr3_MMU_ASI_BLK_P_235:
	.word	0x878020f0
	.word	0xc3bdab40
	.word	0xc036ed72
	IDEMAP_ALL_RPAGES
	.word	0xf27420b0
	.word	0xc0342158
	.word	0xce72a050
	.word	0xc0292158
	DDEMAP_PCTX
	.word	0xc02c2158
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe124000
	DDEMAP_RPAGE
	.word	0xc85aa0e8
	.word	0xbe8420c0
	.word	0xc4dfd000
thr3_MMU_ASI_PRIMARY_236:
	.word	0x87802080
	.word	0xe8f2a028
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xea75a030
	.word	0xc022a158
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr3_MMU_ASI_PRIMARY_237:
	.word	0x87802080
	.word	0xeaf2a0a8
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd272a0a8
	.word	0xc032a158
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00f_exit:
	EXIT_GOOD
Thr3_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10a DATA_VA=0x6c00004f0000
attr_data {
	Name = .Thr3_User_Data_4v10a ,
	VA = 0x6c00004f0000 ,/* 0x6c00004fffc0 */
	RA = 0x0020b10000 ,
	PA = 0x3420b10000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c00004f08aa 8000003420b10041 */
	end_label   = Thr3_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10a_data_begin
Thr3_User_Data_4v10a_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v010 TEXT_VA=0x6b300002c000
attr_text {
	Name = .Thr3_User_Text_4v010 ,
	VA = 0x6b300002c000 ,/* 0x6b300002dfc0 */
	RA = 0x0390062000 ,
	PA = 0x0390062000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b300002c8aa 8000000390062480 */
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
	TOGGLE_LSU_DM
	.word	0xf875a110
	.word	0xc025a860
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5427ba
	nop
	nop
	nop
	nop
	.word	0xfcda9000
	.word	0xbe82a008
	.word	0xe0dfd000
	.word	0xfe4eed40
	IDEMAP_ALL
	.word	0xca75a010
	.word	0xc035acd2
thr3_MMU_ASI_PRIMARY_238:
	.word	0x87802080
	.word	0xf8f42050
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	TOGGLE_LSU_DM
	.word	0xbe85a038
	.word	0xc8dfd000
	.word	0xfe56e7ea
thr3_MMU_ASI_PRIMARY_239:
	.word	0x87802080
	.word	0xdaf5a080
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe5c2b60
	.word	0xe05aa038
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x006, %i7
	LOAD_DDATA_IN
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xfe45abbc
	.word	0x81c6a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v010_exit:
	EXIT_GOOD
Thr3_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10b DATA_VA=0x6d0029000000
attr_data {
	Name = .Thr3_User_Data_4v10b ,
	VA = 0x6d0029000000 ,/* 0x6d00293fffc0 */
	RA = 0x028ac00000 ,
	PA = 0x028ac00000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006d00290008aa 800000028ac00043 */
	end_label   = Thr3_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10b_data_begin
Thr3_User_Data_4v10b_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v011 TEXT_VA=0x6b30001fa000
attr_text {
	Name = .Thr3_User_Text_4v011 ,
	VA = 0x6b30001fa000 ,/* 0x6b30001fbfc0 */
	RA = 0x039004e000 ,
	PA = 0x039004e000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b30001fa8aa 800000039004e480 */
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
thr3_MMU_ASI_PRIMARY_240:
	.word	0x87802080
	.word	0xd4f5a0e8
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
	ACCESS_DTSB_PTR
	.word	0xe072a038
	.word	0xc075a230
	.word	0x1000000
	or	%g0, 0x0a1, %i7
	LOAD_DDATA_IN
	.word	0xe05c2138
	.word	0x1000000
	or	%g0, 0x7fe, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcdc5120
	.word	0xbe82a068
	.word	0xe0dfd000
	.word	0xe675a060
	.word	0xc075aee0
thr3_MMU_ASI_PRIMARY_241:
	.word	0x87802080
	.word	0xdaf5a050
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	ITLB_TAG_READ
	.word	0xe05ee098
	.word	0xfe5aa118
	.word	0x1000000
	or	%g0, 0x0ae, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	.word	0xd6712070
	.word	0xc022abdc
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	.word	0xbe86e0c0
	.word	0xf6dfd000
	.word	0x1000000
	or	%g0, 0x9f, %i7
	LOAD_DDATA_ACCESS
	.word	0xc030adee
	.word	0xd65c2010
	.word	0xbe85a0d0
	.word	0xe19fde00
	.word	0xfcdad160
	.word	0x1000000
	or	%g0, 0x556, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	.word	0x1000000
	or	%g0, 0x075, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd9000
	DDEMAP_NCTX
thr3_MMU_ASI_BLK_COMMIT_P_242:
	.word	0x878020e0
	.word	0xc3b8a800
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
	or	%g0, 0x78, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe872a028
	.word	0xc02423c8
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe05da068
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v011_exit:
	EXIT_GOOD
Thr3_User_Text_4v011_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10c DATA_VA=0x6c0000020000
attr_data {
	Name = .Thr3_User_Data_4v10c ,
	VA = 0x6c0000020000 ,/* 0x6c000002ffc0 */
	RA = 0x0020bb0000 ,
	PA = 0x3420bb0000 ,
	TTE_Context = 0x08aa ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c00000208aa 8000003420bb0041 */
	end_label   = Thr3_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10c_data_begin
Thr3_User_Data_4v10c_data_begin:
	.xword	0x6c00000e0000
	.xword	0x6c0000f80000
	.xword	0x6d0013c00000
	.xword	0x6b300005a000
	.xword	0x6c0000a30000
	.xword	0x6d002f000000
	.xword	0x6c0000970000
	.xword	0x6b3000154000
	.xword	0x6b300006e000
	.xword	0x6d002f400000
	.xword	0x6b300000a000
	.xword	0x6c0000b50000
	.xword	0x6c0000ca0000
	.xword	0x6b30000b8000
	.xword	0x6b30001ee000
	.xword	0x6b3000068000
	.xword	0x6c0000dd0000
	.xword	0x6d0027c00000
	.xword	0x6b30000fa000
	.xword	0x6d0022400000
	.xword	0x6d002fc00000
	.xword	0x6c0000fd0000
	.xword	0x6c0000bb0000
	.xword	0x6d001bc00000
	.xword	0x6e0760000000
	.xword	0x6c0000250000
	.xword	0x6d003f000000
	.xword	0x6d0021800000
	.xword	0x6b30000bc000
	.xword	0x6d001b800000
	.xword	0x6b3000102000
	.xword	0x6c0000a00000
	.xword	0x6b300015a000
	.xword	0x6d002b800000
	.xword	0x6b30001d8000
	.xword	0x6d001a800000
	.xword	0x6b300004e000
	.xword	0x6c00004f0000
	.xword	0x6b300002c000
	.xword	0x6d0029000000
	.xword	0x6b30001fa000
	.xword	0x6c0000020000
	.xword	0x6b3000160000
Thr3_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v012 TEXT_VA=0x6b3000160000
attr_text {
	Name = .Thr3_User_Text_4v012 ,
	VA = 0x6b3000160000 ,/* 0x6b3000161fc0 */
	RA = 0x0390104000 ,
	PA = 0x0390104000 ,
	TTE_Context = 0x08aa ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b30001608aa 8000000390104480 */
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
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0xd5, %i7
	LOAD_IDATA_ACCESS
	.word	0xda70a130
	.word	0xc076e158
	.word	0xca70a040
	.word	0xc0742368
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xc02c2f75
	.word	0xc036ed70
	DDEMAP_ALL_RPAGES
	.word	0xfe4dabb3
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd85aa018
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe168000
	GOTO_SUPERVISOR0
thr3_MMU_ASI_PRIMARY_LITTLE_243:
	.word	0x87802088
	.word	0xd8bdace0
	.word	0x1000000
	or	%g0, 0x067, %i7
	LOAD_DDATA_IN
	.word	0xbe8120c0
	.word	0xecdfd000
	.word	0xf272a058
	.word	0xc035ad2a
	.word	0xfcded000
	.word	0xc85c20e8
	TOGGLE_LSU_DM
	.word	0xe05c20d8
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_RPAGE
	.word	0xfe512546
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x98, %i7
	READ_IDATA_ACCESS
	.word	0xc45c2038
	.word	0x1000000
	or	%g0, 0x002, %i7
	LOAD_DDATA_IN
	nop
	nop
	.word	0xf65aa0c0
	.word	0xc3995f20
	.word	0x1000000
	or	%g0, 0x298, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x232, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x42e, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xde75a110
	.word	0xc022ab50
	.word	0x81c3e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v012_exit:
	EXIT_GOOD
Thr3_User_Text_4v012_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x71003b400000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	VA = 0x71003b400000 ,/* 0x71003b7fffc0 */
	RA = 0x029b000000 ,
	PA = 0x4e9b000000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000071003b401ac1 8000004e9b000083 */
	end_label   = Thr4_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr4_user_code_entry
Thr4_user_code_entry:
	setx	0x710001800000, %g1, %g2
	or	%g0, 16, %g1
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
thr4_MMU_ASI_PRIMARY_244:
	.word	0x87802080
	.word	0xf2f5a0d0
	.word	0x1000000
	or	%g0, 0x548, %i7
	ITLB_TAG_READ
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfcda9000
thr4_MMU_ASI_BLK_COMMIT_P_245:
	.word	0x878020e0
	.word	0xc1bc2100
	.word	0xbe816040
	.word	0xcadfd060
	.word	0xfe4aab49
	.word	0xe07120c0
	.word	0xc03121f6
	.word	0xbe8420c0
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x4e0, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe4aadb6
	.word	0xee72a070
	.word	0xc030affa
	DDEMAP_PCTX
	DDEMAP_SCTX
	ACCESS_DTSB_PTR
	ACCESS_DTSB_PTR
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x011, %i7
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
	TOGGLE_LSU_DM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd470a120
	.word	0xc0342130
	.word	0xfcdc1100
	IDEMAP_ALL
	.word	0xca75a010
	.word	0xc072a458
	.word	0x1000000
	or	%g0, 0x191, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcdc1000
	.word	0xe2742010
	.word	0xc072a130
	IDEMAP_PCTX
	IDEMAP_ALL_RPAGES
	.word	0xfe55ac78
thr4_MMU_ASI_PRIMARY_246:
	.word	0x87802080
	.word	0xd2f2a000
	.word	0xe05aa068
	.word	0x1000000
	or	%g0, 0x571, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0x041, %i7
	LOAD_IDATA_IN
	nop
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xfe5eefb8
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v000_exit:
	EXIT_GOOD
Thr4_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v100 DATA_VA=0x710001800000
attr_data {
	Name = .Thr4_User_Data_4v100 ,
	VA = 0x710001800000 ,/* 0x710001bfffc0 */
	RA = 0x029b400000 ,
	PA = 0x4e9b400000 ,
	TTE_Context = 0x1ac1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000710001801ac1 8000004e9b400043 */
	end_label   = Thr4_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v100_data_begin
Thr4_User_Data_4v100_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v200 DATA_VA=0x6f40000f2000
attr_data {
	Name = .Thr4_User_Data_4v200 ,
	VA = 0x6f40000f2000 ,/* 0x6f40000f3fc0 */
	RA = 0x03a0168000 ,
	PA = 0x03a0168000 ,
	TTE_Context = 0x0c3c ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006f40000f2a24 80000003a0168440 */
	end_label   = Thr4_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v200_data_begin
Thr4_User_Data_4v200_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v300 DATA_VA=0x6f40000ca000
attr_data {
	Name = .Thr4_User_Data_4v300 ,
	VA = 0x6f40000ca000 ,/* 0x6f40000cbfc0 */
	RA = 0x03a01b6000 ,
	PA = 0x03a01b6000 ,
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
	/* DTTE_TAG_DATA = 00006f40000ca000 80000003a01b6440 */
	end_label   = Thr4_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v300_data_begin
Thr4_User_Data_4v300_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v001 TEXT_VA=0x6f400008a000
attr_text {
	Name = .Thr4_User_Text_4v001 ,
	VA = 0x6f400008a000 ,/* 0x6f400008bfc0 */
	RA = 0x03a014a000 ,
	PA = 0x03a014a000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f400008ac1e 80000003a014a080 */
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
	.word	0x1000000
	or	%g0, 0x071, %i7
	LOAD_IDATA_IN
	IDEMAP_ALL_RPAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	ACCESS_DTSB_PTR
thr4_MMU_ASI_PRIMARY_247:
	.word	0x87802080
	.word	0xf8f6e018
thr4_MMU_ASI_PRIMARY_248:
	.word	0x87802080
	.word	0xe2f12070
	.word	0x1000000
	or	%g0, 0x558, %i7
	READ_DDATA_ACCESS
	.word	0xbe86e038
	.word	0xecdfd000
	.word	0x1000000
	.word	0xbe170000
	IDEMAP_RPAGE
	.word	0xfe512eb8
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xf05920c8
thr4_MMU_ASI_PRIMARY_249:
	.word	0x87802080
	.word	0xdcf42088
	TOGGLE_LSU_IM
	.word	0xd45ee110
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xea742080
	.word	0xc026ed70
	.word	0x81c66000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v001_exit:
	EXIT_GOOD
Thr4_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v400 TEXT_VA=0x71000dc00000
attr_text {
	Name = .Thr4_User_Text_4v400 ,
	VA = 0x71000dc00000 ,/* 0x71000dffffc0 */
	RA = 0x0298000000 ,
	PA = 0x4e98000000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr4_z_ctx_tsb_1 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000071000dc00000 8000004e98000083 */
	end_label   = Thr4_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v400_text_begin
Thr4_User_Text_4v400_text_begin:
	wrpr	0, %gl
	P_ACCESS_ITSB_PTR
	.word	0xfe572312
	.word	0xfe532028
	P_DDEMAP_ALL_PAGES
	.word	0xfc9c1100
	P_IDEMAP_PCTX
thr4_MMU_ASI_BLK_COMMIT_P_250:
	.word	0x878020e0
	.word	0xe1bc2e40
	P_ACCESS_DTSB_PTR
thr4_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_251:
	.word	0x87802018
	.word	0xf8f5a048
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_IDEMAP_PCTX
	.word	0xbe85a110
	.word	0xf6dfd000
	P_DDEMAP_ALL_RPAGES
	nop
	P_DDEMAP_NCTX
	.word	0xfcdd8200
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x198, %i7
	P_LOAD_IDATA_ACCESS
	P_DDEMAP_NCTX
	P_IDEMAP_ALL_RPAGES
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x00c, %i7
	P_LOAD_DDATA_IN
	.word	0xbe86e110
	.word	0xd4dfc200
	.word	0xfcdc0200
	.word	0xfcdec200
	.word	0xfcda9000
thr4_MMU_ASI_AS_IF_USER_PRIMARY_252:
	.word	0x87802010
	.word	0xeef6e010
	P_TOGGLE_LSU_IM
	.word	0xfc9c85e0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_PAGES
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v400_exit:
	EXIT_GOOD
Thr4_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v002 TEXT_VA=0x7000003d0000
attr_text {
	Name = .Thr4_User_Text_4v002 ,
	VA = 0x7000003d0000 ,/* 0x7000003dffc0 */
	RA = 0x0030720000 ,
	PA = 0x4430720000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007000003d1ac1 8000004430720081 */
	end_label   = Thr4_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v002_text_begin
Thr4_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0xfcd89000
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x380, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_NCTX
	.word	0xf4742020
	.word	0xc026ed10
thr4_MMU_ASI_BLK_COMMIT_S_253:
	.word	0x878020e1
	.word	0xc3bae700
	.word	0xc032a5d4
	P_DDEMAP_PCTX
	.word	0xf85c2018
	P_IDEMAP_ALL_RPAGES
	.word	0xfcdac2a0
	.word	0xfe442b50
	.word	0xfcdec200
thr4_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_254:
	.word	0x8780202a
	.word	0xf0bc2820
	.word	0x1000000
	or	%g0, 0x418, %i7
	P_ITLB_TAG_READ
	.word	0xe058a098
thr4_MMU_ASI_BLK_P_255:
	.word	0x878020f0
	.word	0xe1bda640
	.word	0x1000000
	or	%g0, 0x07a, %i7
	P_LOAD_DDATA_IN
	.word	0xbe82e010
	.word	0xe2dfd060
thr4_MMU_ASI_SECONDARY_256:
	.word	0x87802081
	.word	0xccbded30
	.word	0xfc9c85e0
	.word	0x1000000
	or	%g0, 0x070, %i7
	P_LOAD_DDATA_IN
	.word	0xbe85a110
	.word	0xcadfc280
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe52a710
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a110
	.word	0xd4dfd000
thr4_MMU_ASI_SECONDARY_LITTLE_257:
	.word	0x87802089
	.word	0xf0f46018
	.word	0xc022aab4
	.word	0xfcdec200
	P_TOGGLE_LSU_DM
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x057, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x078, %i7
	P_LOAD_DDATA_IN
thr4_MMU_ASI_PRIMARY_258:
	.word	0x87802080
	.word	0xdcf6e028
	.word	0xbe846040
	.word	0xe19fc2e0
thr4_MMU_ASI_PRIMARY_259:
	.word	0x87802080
	.word	0xd2f5a020
	.word	0x1000000
	or	%g0, 0xd1, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xda76e090
	.word	0xc034220c
thr4_MMU_ASI_BLK_COMMIT_P_260:
	.word	0x878020e0
	.word	0xc1baa980
	.word	0xc472a068
	.word	0xc025a6a8
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x470, %i7
	P_ITLB_TAG_READ
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v002_exit:
	EXIT_GOOD
Thr4_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v101 DATA_VA=0x720030000000
attr_data {
	Name = .Thr4_User_Data_4v101 ,
	VA = 0x720030000000 ,/* 0x72003fffffc0 */
	RA = 0x00b0000000 ,
	PA = 0x4cb0000000 ,
	TTE_Context = 0x1ac1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000720030001ac1 8000004cb0000045 */
	end_label   = Thr4_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v101_data_begin
Thr4_User_Data_4v101_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v201 DATA_VA=0x71000f400000
attr_data {
	Name = .Thr4_User_Data_4v201 ,
	VA = 0x71000f400000 ,/* 0x71000f7fffc0 */
	RA = 0x029c800000 ,
	PA = 0x4e9c800000 ,
	TTE_Context = 0x0c3c ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000071000f400c3c 8000004e9c800443 */
	end_label   = Thr4_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v201_data_begin
Thr4_User_Data_4v201_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v301 DATA_VA=0x710039000000
attr_data {
	Name = .Thr4_User_Data_4v301 ,
	VA = 0x710039000000 ,/* 0x7100393fffc0 */
	RA = 0x029bc00000 ,
	PA = 0x4e9bc00000 ,
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
	/* DTTE_TAG_DATA = 0000710039000000 8000004e9bc00443 */
	end_label   = Thr4_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v301_data_begin
Thr4_User_Data_4v301_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v003 TEXT_VA=0x6f400006c000
attr_text {
	Name = .Thr4_User_Text_4v003 ,
	VA = 0x6f400006c000 ,/* 0x6f400006dfc0 */
	RA = 0x03a0098000 ,
	PA = 0x03a0098000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f400006cc1e 80000003a0098080 */
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
	.word	0xcc5aa018
	.word	0x1000000
	.word	0xbe124000
	IDEMAP_PAGE
	DDEMAP_NCTX
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x438, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe058a0f0
	.word	0x1000000
	or	%g0, 0x5d8, %i7
	DTLB_TAG_READ
thr4_MMU_ASI_BLK_COMMIT_S_261:
	.word	0x878020e1
	.word	0xc3baea80
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xfc9a9d40
	.word	0xc02ee56d
	.word	0xbe846010
	.word	0xe2dfd060
	.word	0xc85da110
	IDEMAP_ALL
	.word	0xc85c2098
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xd472a0c0
	.word	0xc032a130
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v003_exit:
	EXIT_GOOD
Thr4_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v401 TEXT_VA=0x71001d800000
attr_text {
	Name = .Thr4_User_Text_4v401 ,
	VA = 0x71001d800000 ,/* 0x71001dbfffc0 */
	RA = 0x029b800000 ,
	PA = 0x4e9b800000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr4_z_ctx_tsb_1 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000071001d800000 8000004e9b800083 */
	end_label   = Thr4_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v401_text_begin
Thr4_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0xfc9c5c60
	.word	0x1000000
	or	%g0, 0xd0, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x03a, %i7
	P_LOAD_IDATA_IN
	P_IDEMAP_ALL_RPAGES
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x03e, %i7
	P_LOAD_IDATA_IN
thr4_MMU_ASI_AS_IF_USER_PRIMARY_262:
	.word	0x87802010
	.word	0xeaf6e0e8
	.word	0xbe842098
	.word	0xc4dfc200
	.word	0x1000000
	or	%g0, 0x1f8, %i7
	P_READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe118000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xfe4628dc
	.word	0x1000000
	or	%g0, 0x0b3, %i7
	P_LOAD_DDATA_IN
	.word	0xbe8420c0
	.word	0xecdfd000
thr4_MMU_ASI_AS_IF_USER_PRIMARY_263:
	.word	0x87802010
	.word	0xd0f5a088
	P_TOGGLE_LSU_DM
thr4_MMU_ASI_AS_IF_USER_PRIMARY_264:
	.word	0x87802010
	.word	0xecf0a0f0
thr4_MMU_ASI_AS_IF_USER_PRIMARY_265:
	.word	0x87802010
	.word	0xe0f5a100
	P_DDEMAP_SCTX
thr4_MMU_ASI_PRIMARY_266:
	.word	0x87802080
	.word	0xc4f42038
	nop
	nop
	nop
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x001, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x597, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_DDEMAP_ALL_PAGES
	P_IDEMAP_PCTX
	P_DDEMAP_ALL
	.word	0xfcdec200
	.word	0x1000000
	or	%g0, 0x5b8, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe120000
	P_IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	P_READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe104000
	P_DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf2772030
	.word	0xc0262f9c
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v401_exit:
	EXIT_GOOD
Thr4_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v004 TEXT_VA=0x6f40000ae000
attr_text {
	Name = .Thr4_User_Text_4v004 ,
	VA = 0x6f40000ae000 ,/* 0x6f40000affc0 */
	RA = 0x03a016c000 ,
	PA = 0x03a016c000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f40000aec1e 80000003a016c080 */
	end_label   = Thr4_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v004_text_begin
Thr4_User_Text_4v004_text_begin:
	wrpr	0, %gl
thr4_MMU_ASI_BLK_COMMIT_P_267:
	.word	0x878020e0
	.word	0xc3bda800
	.word	0x1000000
	or	%g0, 0x80, %i7
	P_READ_DDATA_ACCESS
	.word	0xfe4aa986
	.word	0x1000000
	or	%g0, 0x95, %i7
	P_LOAD_IDATA_ACCESS
	P_DDEMAP_ALL
thr4_MMU_ASI_PRIMARY_268:
	.word	0x87802080
	.word	0xf6f2a120
	.word	0xbe80a0e0
	.word	0xf6dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x052, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	.word	0xbe846010
	.word	0xd6dfd060
	P_TOGGLE_LSU_IM
	.word	0xc07424e8
	.word	0x1000000
	or	%g0, 0x013, %i7
	P_LOAD_DDATA_IN
thr4_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_269:
	.word	0x8780202b
	.word	0xe4b96810
	.word	0xfcdd8200
thr4_MMU_ASI_AS_IF_USER_PRIMARY_270:
	.word	0x87802010
	.word	0xd0f6e088
thr4_MMU_ASI_REAL_MEM_LITTLE_271:
	.word	0x8780201c
	.word	0xd0f5a088
	.word	0xfcd95120
	.word	0x1000000
	or	%g0, 0x013, %i7
	P_LOAD_IDATA_IN
thr4_MMU_ASI_PRIMARY_272:
	.word	0x87802080
	.word	0xdef0a090
	.word	0xbe8460a0
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
	nop
	nop
	nop
	nop
thr4_MMU_ASI_REAL_IO_273:
	.word	0x87802015
	.word	0xc6f0a0f8
	.word	0xbe85a068
	.word	0xf6dfd000
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xc85aa068
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
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x2e0, %i7
	P_DTLB_TAG_READ
	.word	0xfc9d9c40
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v004_exit:
	EXIT_GOOD
Thr4_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v102 DATA_VA=0x6f400007e000
attr_data {
	Name = .Thr4_User_Data_4v102 ,
	VA = 0x6f400007e000 ,/* 0x6f400007ffc0 */
	RA = 0x03a0116000 ,
	PA = 0x03a0116000 ,
	TTE_Context = 0x1ac1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006f400007ec1e 80000003a0116040 */
	end_label   = Thr4_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v102_data_begin
Thr4_User_Data_4v102_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v202 DATA_VA=0x700000940000
attr_data {
	Name = .Thr4_User_Data_4v202 ,
	VA = 0x700000940000 ,/* 0x70000094ffc0 */
	RA = 0x0030d20000 ,
	PA = 0x4430d20000 ,
	TTE_Context = 0x0c3c ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000700000940c3c 8000004430d20441 */
	end_label   = Thr4_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v202_data_begin
Thr4_User_Data_4v202_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v302 DATA_VA=0x700000ed0000
attr_data {
	Name = .Thr4_User_Data_4v302 ,
	VA = 0x700000ed0000 ,/* 0x700000edffc0 */
	RA = 0x0030db0000 ,
	PA = 0x4430db0000 ,
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
	/* DTTE_TAG_DATA = 0000700000ed0000 8000004430db0441 */
	end_label   = Thr4_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v302_data_begin
Thr4_User_Data_4v302_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v005 TEXT_VA=0x700000140000
attr_text {
	Name = .Thr4_User_Text_4v005 ,
	VA = 0x700000140000 ,/* 0x70000014ffc0 */
	RA = 0x00304a0000 ,
	PA = 0x44304a0000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000700000141ac1 80000044304a0081 */
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
	.word	0xfcdd9000
	nop
	nop
	nop
	IDEMAP_NCTX
	ACCESS_DTSB_PTR
	.word	0xfe42aa44
	IDEMAP_ALL
	.word	0xbe842090
	.word	0xe39fde00
	ACCESS_ITSB_PTR
	.word	0xbe846070
	.word	0xd6dfd060
	.word	0x1000000
	or	%g0, 0x348, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x418, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xd45c2068
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe5ee298
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v005_exit:
	EXIT_GOOD
Thr4_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v402 TEXT_VA=0x710026000000
attr_text {
	Name = .Thr4_User_Text_4v402 ,
	VA = 0x710026000000 ,/* 0x7100263fffc0 */
	RA = 0x0293800000 ,
	PA = 0x4e93800000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr4_z_ctx_tsb_1 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 0000710026000000 8000004e93800083 */
	end_label   = Thr4_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v402_text_begin
Thr4_User_Text_4v402_text_begin:
	wrpr	0, %gl
	nop
thr4_MMU_ASI_AS_IF_USER_PRIMARY_274:
	.word	0x87802010
	.word	0xccf6e018
	.word	0x1000000
	.word	0xbe148000
	P_IDEMAP_RPAGE
	.word	0xe25b20a0
	P_ACCESS_ITSB_PTR
	.word	0xc0262eb4
	.word	0xbe85a0c0
	.word	0xe0dfd000
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe164000
	P_DDEMAP_RPAGE
thr4_MMU_ASI_AS_IF_USER_PRIMARY_275:
	.word	0x87802010
	.word	0xf4f5a020
	.word	0x1000000
	or	%g0, 0x0aa, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	.word	0xbe86e038
	.word	0xe0dfd000
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v402_exit:
	EXIT_GOOD
Thr4_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v006 TEXT_VA=0x6f4000126000
attr_text {
	Name = .Thr4_User_Text_4v006 ,
	VA = 0x6f4000126000 ,/* 0x6f4000127fc0 */
	RA = 0x03a006a000 ,
	PA = 0x03a006a000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f4000126c1e 80000003a006a080 */
	end_label   = Thr4_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v006_text_begin
Thr4_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe164000
	P_DDEMAP_RPAGE
	P_ACCESS_ITSB_PTR
thr4_MMU_ASI_AS_IF_USER_PRIMARY_276:
	.word	0x87802010
	.word	0xd0f5a028
	.word	0xfcd89000
thr4_MMU_ASI_AS_IF_USER_SECONDARY_LITTLE_277:
	.word	0x87802019
	.word	0xd6f46070
	.word	0xfe5c2568
	.word	0xe05ee038
	.word	0xe05da0e0
	.word	0xfcdc0200
	P_TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe154000
	P_IDEMAP_RPAGE
thr4_MMU_ASI_AS_IF_USER_PRIMARY_278:
	.word	0x87802010
	.word	0xc4f42008
	P_DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x00b, %i7
	P_LOAD_IDATA_IN
	P_TOGGLE_LSU_IM
thr4_MMU_ASI_PRIMARY_279:
	.word	0x87802080
	.word	0xcaf42010
	.word	0xea712108
	.word	0xc07129c0
	.word	0xfcdc0200
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v006_exit:
	EXIT_GOOD
Thr4_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v103 DATA_VA=0x700000710000
attr_data {
	Name = .Thr4_User_Data_4v103 ,
	VA = 0x700000710000 ,/* 0x70000071ffc0 */
	RA = 0x0030a10000 ,
	PA = 0x4430a10000 ,
	TTE_Context = 0x1ac1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000700000711ac1 8000004430a10041 */
	end_label   = Thr4_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v103_data_begin
Thr4_User_Data_4v103_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v203 DATA_VA=0x6f40000ac000
attr_data {
	Name = .Thr4_User_Data_4v203 ,
	VA = 0x6f40000ac000 ,/* 0x6f40000adfc0 */
	RA = 0x03a01e0000 ,
	PA = 0x03a01e0000 ,
	TTE_Context = 0x0c3c ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006f40000aca24 80000003a01e0440 */
	end_label   = Thr4_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v203_data_begin
Thr4_User_Data_4v203_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v303 DATA_VA=0x700000d30000
attr_data {
	Name = .Thr4_User_Data_4v303 ,
	VA = 0x700000d30000 ,/* 0x700000d3ffc0 */
	RA = 0x0030e80000 ,
	PA = 0x4430e80000 ,
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
	/* DTTE_TAG_DATA = 0000700000d30000 8000004430e80441 */
	end_label   = Thr4_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v303_data_begin
Thr4_User_Data_4v303_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v007 TEXT_VA=0x6f4000166000
attr_text {
	Name = .Thr4_User_Text_4v007 ,
	VA = 0x6f4000166000 ,/* 0x6f4000167fc0 */
	RA = 0x03a018a000 ,
	PA = 0x03a018a000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f4000166c1e 80000003a018a080 */
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
	ACCESS_DTSB_PTR
	.word	0xec58a098
	.word	0xbe85a008
	.word	0xecdfd000
	.word	0xc032a450
	.word	0x1000000
	or	%g0, 0x026, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x118, %i7
	READ_IDATA_ACCESS
	.word	0xc072a688
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x40e, %i7
	LOAD_IDATA_ACCESS
	.word	0xc075a2c8
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	ITLB_TAG_READ
	IDEMAP_ALL_PAGES
thr4_MMU_ASI_BLK_P_280:
	.word	0x878020f0
	.word	0xe1beee40
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xe4742078
	.word	0xc032a3b6
	.word	0xc472a098
	.word	0xc025a444
	.word	0xcc5c2018
	.word	0xfe5aa1e8
	.word	0x1000000
	or	%g0, 0xb0, %i7
	LOAD_IDATA_ACCESS
	.word	0xc025ac84
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_SECONDARY_LITTLE_281:
	.word	0x87802089
	.word	0xeaf16020
	.word	0xfe4eed78
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x548, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	DTLB_TAG_READ
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	ITLB_TAG_READ
thr4_MMU_ASI_PRIMARY_LITTLE_282:
	.word	0x87802088
	.word	0xc4f2a098
	.word	0xc0212ee4
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe124000
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
	IDEMAP_ALL_RPAGES
	.word	0xfcdc1000
thr4_MMU_ASI_BLK_PL_283:
	.word	0x878020f8
	.word	0xe1bc2980
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
	or	%g0, 0x648, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_DM
	nop
	nop
	nop
	.word	0xd45c2120
	TOGGLE_LSU_IM
	.word	0xc022a9c8
	.word	0xc025a7d4
	.word	0xbe86e0e0
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe168000
	GOTO_SUPERVISOR0
thr4_MMU_ASI_PRIMARY_284:
	.word	0x87802080
	.word	0xd8f120a8
	.word	0xbe8420e0
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x039, %i7
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
	.word	0xc021223c
	.word	0xbe85a068
	.word	0xc4dfd000
thr4_MMU_ASI_BLK_P_285:
	.word	0x878020f0
	.word	0xc1baa780
	TOGGLE_LSU_DM
	.word	0xe458a0a8
	DDEMAP_PCTX
	DDEMAP_SCTX
	nop
	nop
	nop
	nop
	nop
	.word	0xfe42a480
	.word	0xc45aa0c0
thr4_MMU_ASI_PRIMARY_286:
	.word	0x87802080
	.word	0xdaf5a108
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc0712510
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v007_exit:
	EXIT_GOOD
Thr4_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v008 TEXT_VA=0x6f40001da000
attr_text {
	Name = .Thr4_User_Text_4v008 ,
	VA = 0x6f40001da000 ,/* 0x6f40001dbfc0 */
	RA = 0x03a01ea000 ,
	PA = 0x03a01ea000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f40001dac1e 80000003a01ea080 */
	end_label   = Thr4_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v008_text_begin
Thr4_User_Text_4v008_text_begin:
	wrpr	0, %gl
thr4_MMU_ASI_AS_IF_USER_PRIMARY_287:
	.word	0x87802010
	.word	0xf2f2a0b8
thr4_MMU_ASI_AS_IF_USER_PRIMARY_288:
	.word	0x87802010
	.word	0xccf6e048
	nop
	P_DDEMAP_NCTX
	P_IDEMAP_ALL
	.word	0xf0742078
	.word	0xc02dad83
	.word	0x1000000
	.word	0xbe120000
	P_IDEMAP_RPAGE
	.word	0xe19942e0
	.word	0x1000000
	or	%g0, 0x458, %i7
	P_READ_DDATA_ACCESS
	P_TOGGLE_LSU_DM
	.word	0xfc9c1c40
	.word	0x1000000
	or	%g0, 0x390, %i7
	P_DTLB_TAG_READ
	P_IDEMAP_ALL_RPAGES
	.word	0xbe842038
	.word	0xecdfc200
	P_DDEMAP_ALL_RPAGES
	.word	0xfc9d9c40
	P_TOGGLE_LSU_DM
	.word	0xfc995020
	nop
	nop
	nop
	nop
	.word	0xc02eeb17
	P_DDEMAP_ALL_PAGES
	P_ACCESS_ITSB_PTR
	.word	0xfcd95060
	.word	0x1000000
	or	%g0, 0x02e, %i7
	P_LOAD_IDATA_IN
	P_TOGGLE_LSU_DM
	.word	0xec5aa068
	P_TOGGLE_LSU_IM
	.word	0xfcddd160
	.word	0xbe85a098
	.word	0xecdfc200
	.word	0xc070a320
thr4_MMU_ASI_REAL_IO_LITTLE_289:
	.word	0x8780201d
	.word	0xe6f5a050
	nop
	nop
	nop
	.word	0xe25aa010
	.word	0x1000000
	or	%g0, 0x538, %i7
	P_ITLB_TAG_READ
thr4_MMU_ASI_AS_IF_USER_PRIMARY_290:
	.word	0x87802010
	.word	0xc8f5a008
	.word	0x1000000
	or	%g0, 0x4a0, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe130000
	P_IDEMAP_RPAGE
	.word	0xf05aa0c8
thr4_MMU_ASI_BLK_P_291:
	.word	0x878020f0
	.word	0xc1bdaa40
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
	or	%g0, 0x5f0, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x130, %i7
	P_ITLB_TAG_READ
	.word	0xfcdd9000
	P_IDEMAP_NCTX
thr4_MMU_ASI_PRIMARY_292:
	.word	0x87802080
	.word	0xc4f2a038
thr4_MMU_ASI_AS_IF_USER_PRIMARY_293:
	.word	0x87802010
	.word	0xccf12018
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xfc9d05c0
thr4_MMU_ASI_REAL_MEM_294:
	.word	0x87802014
	.word	0xcaf2e010
	.word	0xfcd88200
	nop
	nop
	nop
	nop
thr4_MMU_ASI_PRIMARY_295:
	.word	0x87802080
	.word	0xf4f5a0b0
	.word	0xc45ee098
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v008_exit:
	EXIT_GOOD
Thr4_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v104 DATA_VA=0x6f4000008000
attr_data {
	Name = .Thr4_User_Data_4v104 ,
	VA = 0x6f4000008000 ,/* 0x6f4000009fc0 */
	RA = 0x03a0136000 ,
	PA = 0x03a0136000 ,
	TTE_Context = 0x1ac1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006f4000008c1e 80000003a0136040 */
	end_label   = Thr4_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v104_data_begin
Thr4_User_Data_4v104_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v304 DATA_VA=0x700000d90000
attr_data {
	Name = .Thr4_User_Data_4v304 ,
	VA = 0x700000d90000 ,/* 0x700000d9ffc0 */
	RA = 0x0030400000 ,
	PA = 0x4430400000 ,
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
	/* DTTE_TAG_DATA = 0000700000d90000 8000004430400441 */
	end_label   = Thr4_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v304_data_begin
Thr4_User_Data_4v304_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v009 TEXT_VA=0x710028c00000
attr_text {
	Name = .Thr4_User_Text_4v009 ,
	VA = 0x710028c00000 ,/* 0x710028ffffc0 */
	RA = 0x029ec00000 ,
	PA = 0x4e9ec00000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000710028c01ac1 8000004e9ec00083 */
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
	.word	0xec5da100
	.word	0xf65c20c0
	nop
	.word	0x1000000
	or	%g0, 0x5b8, %i7
	READ_DDATA_ACCESS
	.word	0xc022abe4
	.word	0xc075abc0
	.word	0xfa72a0e8
	.word	0xc02424a8
	.word	0xce72a030
	.word	0xc02dab64
	.word	0x1000000
	or	%g0, 0x538, %i7
	READ_IDATA_ACCESS
	.word	0xc45da0e0
	DDEMAP_ALL_PAGES
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_BLK_P_296:
	.word	0x878020f0
	.word	0xc3b8a300
	.word	0xc02ee7e5
	IDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9c1c40
thr4_MMU_ASI_PRIMARY_297:
	.word	0x87802080
	.word	0xd6f2a010
thr4_MMU_ASI_BLK_P_298:
	.word	0x878020f0
	.word	0xc1b8ac80
	.word	0xbe8120c0
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
	nop
	.word	0xc472a098
	.word	0xc075afb8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5c2e40
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x150, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x009, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xe670a080
	.word	0xc072aea8
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v009_exit:
	EXIT_GOOD
Thr4_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00a TEXT_VA=0x6f4000162000
attr_text {
	Name = .Thr4_User_Text_4v00a ,
	VA = 0x6f4000162000 ,/* 0x6f4000163fc0 */
	RA = 0x03a01f2000 ,
	PA = 0x03a01f2000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f4000162c1e 80000003a01f2080 */
	end_label   = Thr4_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00a_text_begin
Thr4_User_Text_4v00a_text_begin:
	wrpr	0, %gl
	.word	0xf676e038
	.word	0xc028ae8e
	.word	0xbe8420e0
	.word	0xc4dfd000
	P_DDEMAP_ALL_RPAGES
	.word	0xbe842038
	.word	0xd4dfc200
	.word	0x1000000
	.word	0xbe124000
	P_IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x03c, %i7
	P_LOAD_DDATA_IN
	.word	0xfe58a078
thr4_MMU_ASI_AS_IF_USER_PRIMARY_299:
	.word	0x87802010
	.word	0xd6f2a010
	.word	0xcc5aa018
	.word	0xfcdec200
	.word	0xc075a130
	P_DDEMAP_ALL
	.word	0xc02aa6ba
	.word	0x1000000
	or	%g0, 0x100, %i7
	P_READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8160a0
	.word	0xeedfd020
	.word	0xee5da010
	.word	0xfcdc0200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9b0480
	nop
	nop
	nop
	nop
	P_DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x06b, %i7
	P_LOAD_DDATA_IN
	.word	0xc026e7c0
	.word	0x1000000
	or	%g0, 0x09b, %i7
	P_LOAD_DDATA_IN
	.word	0xfcda8200
	.word	0xfcda8200
	P_IDEMAP_PCTX
	.word	0xc024221c
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x0a1, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_IDEMAP_PCTX
	.word	0xf2712020
	.word	0xc021295c
	P_DDEMAP_SCTX
	.word	0xfc9f0480
	.word	0xfcd95020
	P_IDEMAP_ALL_PAGES
	P_IDEMAP_PCTX
	P_IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x131, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe842100
	.word	0xe0dfc200
	P_ACCESS_DTSB_PTR
	.word	0xec5c2100
	.word	0x1000000
	or	%g0, 0x1da, %i7
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
	.word	0xc022a874
	.word	0xf65ee0c0
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	P_READ_IDATA_ACCESS
	P_IDEMAP_ALL
	.word	0xbe82a068
	.word	0xc4dfc200
	.word	0xfcdc1000
	P_TOGGLE_LSU_DM
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v00a_exit:
	EXIT_GOOD
Thr4_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v105 DATA_VA=0x720950000000
attr_data {
	Name = .Thr4_User_Data_4v105 ,
	VA = 0x720950000000 ,/* 0x72095fffffc0 */
	RA = 0x01f0000000 ,
	PA = 0x4df0000000 ,
	TTE_Context = 0x1ac1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000720950001ac1 8000004df0000045 */
	end_label   = Thr4_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v105_data_begin
Thr4_User_Data_4v105_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00b TEXT_VA=0x6f40001f0000
attr_text {
	Name = .Thr4_User_Text_4v00b ,
	VA = 0x6f40001f0000 ,/* 0x6f40001f1fc0 */
	RA = 0x03a013a000 ,
	PA = 0x03a013a000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f40001f0c1e 80000003a013a080 */
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
	.word	0x1000000
	or	%g0, 0x4a4, %i7
	LOAD_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xfcddd060
	.word	0xc0292464
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x38, %i7
	ITLB_TAG_READ
	.word	0xbe85a038
	.word	0xf6dfd000
	.word	0xc85da110
	.word	0xe25ee010
thr4_MMU_ASI_SECONDARY_LITTLE_300:
	.word	0x87802089
	.word	0xe0f2e0c0
	nop
	.word	0x1000000
	or	%g0, 0x1ea, %i7
	LOAD_DDATA_ACCESS
thr4_MMU_ASI_BLK_P_301:
	.word	0x878020f0
	.word	0xc3b8a240
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xee5c20a0
	nop
	IDEMAP_PCTX
thr4_MMU_ASI_PRIMARY_302:
	.word	0x87802080
	.word	0xf6f0a098
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe4dac6b
	.word	0xc075a708
	.word	0xf65c2068
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_SCTX
	.word	0xc19ddf20
	.word	0x1000000
	or	%g0, 0x076, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xfe4c2186
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00b_exit:
	EXIT_GOOD
Thr4_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v106 DATA_VA=0x700000640000
attr_data {
	Name = .Thr4_User_Data_4v106 ,
	VA = 0x700000640000 ,/* 0x70000064ffc0 */
	RA = 0x0030050000 ,
	PA = 0x4430050000 ,
	TTE_Context = 0x1ac1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000700000641ac1 8000004430050041 */
	end_label   = Thr4_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v106_data_begin
Thr4_User_Data_4v106_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00c TEXT_VA=0x710031800000
attr_text {
	Name = .Thr4_User_Text_4v00c ,
	VA = 0x710031800000 ,/* 0x710031bfffc0 */
	RA = 0x0298800000 ,
	PA = 0x4e98800000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000710031801ac1 8000004e98800083 */
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
	.word	0xf85c2048
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x033, %i7
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
	.word	0xfa70a128
	.word	0xc022a8d8
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x4ee, %i7
	LOAD_DDATA_ACCESS
	.word	0xf675a038
	.word	0xc070a4e8
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xdc70a028
	.word	0xc072a450
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe46e0e8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v00c_exit:
	EXIT_GOOD
Thr4_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v107 DATA_VA=0x710034800000
attr_data {
	Name = .Thr4_User_Data_4v107 ,
	VA = 0x710034800000 ,/* 0x710034bfffc0 */
	RA = 0x0291400000 ,
	PA = 0x4e91400000 ,
	TTE_Context = 0x1ac1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000710034801ac1 8000004e91400043 */
	end_label   = Thr4_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v107_data_begin
Thr4_User_Data_4v107_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00d TEXT_VA=0x6f4000164000
attr_text {
	Name = .Thr4_User_Text_4v00d ,
	VA = 0x6f4000164000 ,/* 0x6f4000165fc0 */
	RA = 0x03a016e000 ,
	PA = 0x03a016e000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f4000164c1e 80000003a016e080 */
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
	.word	0xbe8420c0
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x518, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe128000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x6e8, %i7
	READ_DDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0xbe8420c0
	.word	0xd4dfd000
	nop
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x530, %i7
	DTLB_TAG_READ
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe55abac
	.word	0xc022a6f4
	.word	0xfcddd020
	nop
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd670a070
	.word	0xc035af4c
	.word	0x1000000
	or	%g0, 0x687, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x158, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_PRIMARY_LITTLE_303:
	.word	0x87802088
	.word	0xe2f2a010
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x594, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xc028af4f
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v00d_exit:
	EXIT_GOOD
Thr4_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v108 DATA_VA=0x720830000000
attr_data {
	Name = .Thr4_User_Data_4v108 ,
	VA = 0x720830000000 ,/* 0x72083fffffc0 */
	RA = 0x01a0000000 ,
	PA = 0x4da0000000 ,
	TTE_Context = 0x1ac1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000720830001ac1 8000004da0000045 */
	end_label   = Thr4_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v108_data_begin
Thr4_User_Data_4v108_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00e TEXT_VA=0x720190000000
attr_text {
	Name = .Thr4_User_Text_4v00e ,
	VA = 0x720190000000 ,/* 0x72019fffffc0 */
	RA = 0x0190000000 ,
	PA = 0x4d90000000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000720190001ac1 8000004d90000085 */
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
	.word	0x1000000
	or	%g0, 0x1d8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x05c, %i7
	LOAD_DDATA_IN
	.word	0xfe52a8b2
	.word	0xbe85a120
	.word	0xc4dfd000
	.word	0xe05da0e0
	nop
	nop
	nop
	nop
	nop
	IDEMAP_PCTX
	.word	0xe05aa068
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd65aa070
	.word	0xc075a130
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x428, %i7
	READ_IDATA_ACCESS
	IDEMAP_NCTX
	DDEMAP_ALL_RPAGES
	DDEMAP_SCTX
	.word	0x1000000
	.word	0xbe168000
	IDEMAP_RPAGE
	DDEMAP_ALL_RPAGES
	.word	0xfe4c212e
	.word	0xc872a100
	.word	0xc02da801
	DDEMAP_NCTX
	.word	0xc0742c20
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0xc036ed6e
	.word	0x1000000
	or	%g0, 0x572, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xc0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x750, %i7
	DTLB_TAG_READ
	.word	0xfcded100
	IDEMAP_PCTX
	.word	0xfcdd9000
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
	nop
	nop
	nop
	.word	0xca5da070
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe45ac50
thr4_MMU_ASI_PRIMARY_304:
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
	.word	0xfcded000
	.word	0xfe4aa59c
	.word	0x1000000
	or	%g0, 0x578, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1f8, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
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
	or	%g0, 0x12, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_PCTX
	.word	0x1000000
	.word	0xbe120000
	DDEMAP_PAGE
	.word	0xc026e30c
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xcc5da0a8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v00e_exit:
	EXIT_GOOD
Thr4_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v109 DATA_VA=0x700000c80000
attr_data {
	Name = .Thr4_User_Data_4v109 ,
	VA = 0x700000c80000 ,/* 0x700000c8ffc0 */
	RA = 0x00305c0000 ,
	PA = 0x44305c0000 ,
	TTE_Context = 0x1ac1 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000700000c81ac1 80000044305c0041 */
	end_label   = Thr4_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v109_data_begin
Thr4_User_Data_4v109_data_begin:
	.xword	0x71003b400000
	.xword	0x710001800000
	.xword	0x6f40000f2000
	.xword	0x6f40000ca000
	.xword	0x6f400008a000
	.xword	0x71000dc00000
	.xword	0x7000003d0000
	.xword	0x720030000000
	.xword	0x71000f400000
	.xword	0x710039000000
	.xword	0x6f400006c000
	.xword	0x71001d800000
	.xword	0x6f40000ae000
	.xword	0x6f400007e000
	.xword	0x700000940000
	.xword	0x700000ed0000
	.xword	0x700000140000
	.xword	0x710026000000
	.xword	0x6f4000126000
	.xword	0x700000710000
	.xword	0x6f40000ac000
	.xword	0x700000d30000
	.xword	0x6f4000166000
	.xword	0x6f40001da000
	.xword	0x6f4000008000
	.xword	0x700000d90000
	.xword	0x710028c00000
	.xword	0x6f4000162000
	.xword	0x720950000000
	.xword	0x6f40001f0000
	.xword	0x700000640000
	.xword	0x710031800000
	.xword	0x710034800000
	.xword	0x6f4000164000
	.xword	0x720830000000
	.xword	0x720190000000
	.xword	0x700000c80000
	.xword	0x6f400014e000
Thr4_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00f TEXT_VA=0x6f400014e000
attr_text {
	Name = .Thr4_User_Text_4v00f ,
	VA = 0x6f400014e000 ,/* 0x6f400014ffc0 */
	RA = 0x03a0084000 ,
	PA = 0x03a0084000 ,
	TTE_Context = 0x1ac1 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f400014ec1e 80000003a0084080 */
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
	.word	0x1000000
	or	%g0, 0x095, %i7
	LOAD_DDATA_IN
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe170000
	DDEMAP_PAGE
	.word	0xc39c5e20
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe16c000
	IDEMAP_PAGE
	.word	0xfe5aa100
	.word	0x1000000
	.word	0xbe134000
	IDEMAP_PAGE
	.word	0xd276e0b0
	.word	0xc075a130
	.word	0xc872a0e0
	.word	0xc028a5cb
	IDEMAP_PCTX
	.word	0xc02422ec
	.word	0xc035ae90
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	DTLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe138000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xec5ee0c0
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00f_exit:
	EXIT_GOOD
Thr4_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x760370000000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	VA = 0x760370000000 ,/* 0x76037fffffc0 */
	RA = 0x00c0000000 ,
	PA = 0x00c0000000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 0000760370001133 80000000c0000085 */
	end_label   = Thr5_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr5_user_code_entry
Thr5_user_code_entry:
	setx	0x760270000000, %g1, %g2
	or	%g0, 16, %g1
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
	nop
	ACCESS_DTSB_PTR
	nop
	nop
	.word	0x1000000
	or	%g0, 0x007, %i7
	LOAD_DDATA_IN
	.word	0xfe5769ce
	.word	0xd075a028
	.word	0xc034282e
	ACCESS_DTSB_PTR
	ACCESS_ITSB_PTR
	nop
	.word	0x1000000
	or	%g0, 0x053, %i7
	LOAD_DDATA_IN
	.word	0xcc5c2018
	.word	0xc02da3cb
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcd91000
	IDEMAP_PCTX
	.word	0xbe842098
	.word	0xc4dfd000
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xbe8120b8
	.word	0xe0dfd000
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcdf5000
	nop
	nop
	.word	0x1000000
	or	%g0, 0x98, %i7
	DTLB_TAG_READ
	.word	0xfa5f60b8
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc85ea0e0
	.word	0xbe164000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v000_exit:
	EXIT_GOOD
Thr5_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v100 DATA_VA=0x760270000000
attr_data {
	Name = .Thr5_User_Data_4v100 ,
	VA = 0x760270000000 ,/* 0x76027fffffc0 */
	RA = 0x0300000000 ,
	PA = 0x0300000000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 0000760270001133 8000000300000445 */
	end_label   = Thr5_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v100_data_begin
Thr5_User_Data_4v100_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v200 DATA_VA=0x750028000000
attr_data {
	Name = .Thr5_User_Data_4v200 ,
	VA = 0x750028000000 ,/* 0x7500283fffc0 */
	RA = 0x02a1800000 ,
	PA = 0x02a1800000 ,
	TTE_Context = 0x0358 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000750028000358 80000002a1800043 */
	end_label   = Thr5_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v200_data_begin
Thr5_User_Data_4v200_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v300 DATA_VA=0x75000bc00000
attr_data {
	Name = .Thr5_User_Data_4v300 ,
	VA = 0x75000bc00000 ,/* 0x75000bffffc0 */
	RA = 0x02a8c00000 ,
	PA = 0x02a8c00000 ,
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
	/* DTTE_TAG_DATA = 000075000bc00000 80000002a8c00043 */
	end_label   = Thr5_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v300_data_begin
Thr5_User_Data_4v300_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v001 TEXT_VA=0x740000b30000
attr_text {
	Name = .Thr5_User_Text_4v001 ,
	VA = 0x740000b30000 ,/* 0x740000b3ffc0 */
	RA = 0x00404b0000 ,
	PA = 0x00404b0000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000740000b31133 80000000404b0081 */
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
	.word	0xe4712018
	.word	0xc026a204
	.word	0xc072ac78
	.word	0xbe876098
	.word	0xf4dfd040
	.word	0xce72a090
	.word	0xc02aa4e4
	.word	0xfe4ea069
	.word	0xfe4421e8
	.word	0x1000000
	or	%g0, 0x4f3, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x410, %i7
	ITLB_TAG_READ
	.word	0xee5aa048
	TOGGLE_LSU_IM
	.word	0xfc9c1000
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	READ_IDATA_ACCESS
	.word	0xfcdd9000
	nop
	nop
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr5_MMU_ASI_PRIMARY_305:
	.word	0x87802080
	.word	0xd6f0a070
	.word	0x1000000
	or	%g0, 0x457, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	TOGGLE_LSU_IM
	.word	0xfc9d9000
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe82a008
	.word	0xe0dfd000
	.word	0xc472a068
	.word	0xc02da7e1
	.word	0x1000000
	or	%g0, 0x05a, %i7
	LOAD_IDATA_IN
	.word	0xe4592018
	TOGGLE_LSU_DM
	.word	0xfe5aa040
thr5_MMU_ASI_PRIMARY_306:
	.word	0x87802080
	.word	0xcaf42010
thr5_MMU_ASI_PRIMARY_307:
	.word	0x87802080
	.word	0xeef42018
	nop
	nop
	nop
	IDEMAP_ALL
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x128, %i7
	LOAD_DDATA_ACCESS
	.word	0xc0212cd0
	nop
	nop
	nop
	nop
	nop
	.word	0xc035a89c
	.word	0xd45aa038
	.word	0xfcdd9000
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4428b4
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v001_exit:
	EXIT_GOOD
Thr5_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v400 TEXT_VA=0x740000ac0000
attr_text {
	Name = .Thr5_User_Text_4v400 ,
	VA = 0x740000ac0000 ,/* 0x740000acffc0 */
	RA = 0x0040820000 ,
	PA = 0x5840820000 ,
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
	/* ITTE_TAG_DATA = 0000740000ac0000 8000005840820081 */
	end_label   = Thr5_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v400_text_begin
Thr5_User_Text_4v400_text_begin:
	wrpr	0, %gl
thr5_MMU_ASI_AS_IF_USER_PRIMARY_308:
	.word	0x87802010
	.word	0xe6f5a030
	.word	0x1000000
	or	%g0, 0x034, %i7
	P_LOAD_IDATA_IN
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x380, %i7
	P_READ_DDATA_ACCESS
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x338, %i7
	P_LOAD_DDATA_ACCESS
	P_IDEMAP_PCTX
	.word	0xbe846070
	.word	0xe2dfd060
	P_DDEMAP_ALL
	P_ACCESS_DTSB_PTR
	.word	0xbe85a098
	.word	0xf4dfd000
	.word	0x1000000
	or	%g0, 0x248, %i7
	P_DTLB_TAG_READ
	P_IDEMAP_PCTX
	P_IDEMAP_PCTX
	.word	0xc871a0b8
	.word	0xc02328e0
	P_DDEMAP_NCTX
thr5_MMU_ASI_AS_IF_USER_PRIMARY_309:
	.word	0x87802010
	.word	0xe8f420b0
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
	.word	0xbe130000
	P_IDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x018, %i7
	P_LOAD_IDATA_IN
	.word	0xfcd90200
	.word	0xfc9c85e0
	P_TOGGLE_LSU_DM
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	P_READ_IDATA_ACCESS
	.word	0xc85ca130
	nop
	.word	0xfe4329f4
	.word	0xf875e028
	.word	0xc071a290
	P_IDEMAP_ALL_RPAGES
thr5_MMU_ASI_BLK_S_310:
	.word	0x878020f1
	.word	0xc1b96a80
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v400_exit:
	EXIT_GOOD
Thr5_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v002 TEXT_VA=0x740000de0000
attr_text {
	Name = .Thr5_User_Text_4v002 ,
	VA = 0x740000de0000 ,/* 0x740000deffc0 */
	RA = 0x0040060000 ,
	PA = 0x0040060000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000740000de1133 8000000040060081 */
	end_label   = Thr5_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v002_text_begin
Thr5_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x047, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	P_DDEMAP_NCTX
	.word	0xfc991c40
	.word	0xee72a048
	.word	0xc025a15c
	P_TOGGLE_LSU_IM
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x648, %i7
	P_DTLB_TAG_READ
	.word	0xbe85a120
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	.word	0xbe85a008
	.word	0xd4dfc200
	.word	0xbe842038
	.word	0xe0dfd000
	.word	0xbe8420f0
	.word	0xf4dfc200
	.word	0x1000000
	or	%g0, 0x03f, %i7
	P_LOAD_DDATA_IN
thr5_MMU_ASI_SECONDARY_311:
	.word	0x87802081
	.word	0xe8f16088
thr5_MMU_ASI_AS_IF_USER_PRIMARY_312:
	.word	0x87802010
	.word	0xdaf6a080
	.word	0x1000000
	or	%g0, 0x488, %i7
	P_ITLB_TAG_READ
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x01e, %i7
	P_LOAD_IDATA_IN
	.word	0xbe876130
	.word	0xecdfc200
thr5_MMU_ASI_BLK_P_313:
	.word	0x878020f0
	.word	0xc1beaf80
	P_DDEMAP_ALL
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v002_exit:
	EXIT_GOOD
Thr5_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v101 DATA_VA=0x75002dc00000
attr_data {
	Name = .Thr5_User_Data_4v101 ,
	VA = 0x75002dc00000 ,/* 0x75002dffffc0 */
	RA = 0x02ae400000 ,
	PA = 0x02ae400000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000075002dc01133 80000002ae400443 */
	end_label   = Thr5_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v101_data_begin
Thr5_User_Data_4v101_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v201 DATA_VA=0x7350000f4000
attr_data {
	Name = .Thr5_User_Data_4v201 ,
	VA = 0x7350000f4000 ,/* 0x7350000f5fc0 */
	RA = 0x03b0028000 ,
	PA = 0x03b0028000 ,
	TTE_Context = 0x0358 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007350000f4358 80000003b0028040 */
	end_label   = Thr5_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v201_data_begin
Thr5_User_Data_4v201_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v301 DATA_VA=0x740000270000
attr_data {
	Name = .Thr5_User_Data_4v301 ,
	VA = 0x740000270000 ,/* 0x74000027ffc0 */
	RA = 0x0040cc0000 ,
	PA = 0x5840cc0000 ,
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
	/* DTTE_TAG_DATA = 0000740000270000 8000005840cc0041 */
	end_label   = Thr5_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v301_data_begin
Thr5_User_Data_4v301_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v003 TEXT_VA=0x7400004d0000
attr_text {
	Name = .Thr5_User_Text_4v003 ,
	VA = 0x7400004d0000 ,/* 0x7400004dffc0 */
	RA = 0x0040a90000 ,
	PA = 0x0040a90000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007400004d1133 8000000040a90081 */
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
thr5_MMU_ASI_PRIMARY_314:
	.word	0x87802080
	.word	0xd6f76070
	IDEMAP_ALL
	.word	0xfe4428a0
	DDEMAP_PCTX
	ACCESS_DTSB_PTR
	.word	0xfe46af08
	DDEMAP_SCTX
	.word	0xfe492f37
	IDEMAP_NCTX
	.word	0xec712038
	.word	0xc035a3ee
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x4ce, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xce76a080
	.word	0xc075ac18
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe138000
	DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe120000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x658, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe158000
	DDEMAP_RPAGE
	ACCESS_DTSB_PTR
	.word	0xbe86a098
	.word	0xd4dfd000
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc027637c
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v003_exit:
	EXIT_GOOD
Thr5_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v401 TEXT_VA=0x7400003e0000
attr_text {
	Name = .Thr5_User_Text_4v401 ,
	VA = 0x7400003e0000 ,/* 0x7400003effc0 */
	RA = 0x0040830000 ,
	PA = 0x5840830000 ,
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
	/* ITTE_TAG_DATA = 00007400003e0000 8000005840830081 */
	end_label   = Thr5_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v401_text_begin
Thr5_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x042, %i7
	P_LOAD_DDATA_IN
	.word	0xbe8420f0
	.word	0xecdfc200
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_315:
	.word	0x8780202a
	.word	0xccb92c70
	.word	0x1000000
	or	%g0, 0x730, %i7
	P_DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_IM
	P_DDEMAP_NCTX
	P_IDEMAP_ALL_PAGES
thr5_MMU_ASI_AS_IF_USER_PRIMARY_316:
	.word	0x87802010
	.word	0xf0f76138
	P_DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x6, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfe4b2bdb
	.word	0xfa732120
	.word	0xc02dee8e
	.word	0xfe5ca5e0
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_NCTX
thr5_MMU_ASI_AS_IF_USER_PRIMARY_317:
	.word	0x87802010
	.word	0xecf6a120
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_318:
	.word	0x8780202a
	.word	0xd4baa990
	.word	0xfe59a158
	.word	0xbe82a0b8
	.word	0xd4dfc200
	.word	0x1000000
	or	%g0, 0x03d, %i7
	P_LOAD_DDATA_IN
	.word	0xe25ca070
	.word	0x1000000
	.word	0xbe138000
	P_IDEMAP_RPAGE
thr5_MMU_ASI_PRIMARY_319:
	.word	0x87802080
	.word	0xd8f5a018
thr5_MMU_ASI_AS_IF_USER_PRIMARY_320:
	.word	0x87802010
	.word	0xdaf6a060
thr5_MMU_ASI_PRIMARY_321:
	.word	0x87802080
	.word	0xe2f5a010
	.word	0xbe842038
	.word	0xecdfd000
	.word	0xfcde9000
	.word	0xbe82a100
	.word	0xe0dfc200
	P_ACCESS_ITSB_PTR
thr5_MMU_ASI_PRIMARY_322:
	.word	0x87802080
	.word	0xf0f5a090
	P_IDEMAP_PCTX
	.word	0xbe82a100
	.word	0xd4dfc200
	P_TOGGLE_LSU_DM
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v401_exit:
	EXIT_GOOD
Thr5_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v004 TEXT_VA=0x7350001f6000
attr_text {
	Name = .Thr5_User_Text_4v004 ,
	VA = 0x7350001f6000 ,/* 0x7350001f7fc0 */
	RA = 0x03b00e6000 ,
	PA = 0x03b00e6000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007350001f7133 80000003b00e6080 */
	end_label   = Thr5_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v004_text_begin
Thr5_User_Text_4v004_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_IM
	.word	0xbe82e010
	.word	0xcadfc220
	.word	0xfe4f6407
	P_IDEMAP_ALL
	P_TOGGLE_LSU_IM
	.word	0xbe842098
	.word	0xecdfc200
	.word	0xfcda9000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0212b60
	.word	0x1000000
	.word	0xbe144000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xfcdc0200
	P_ACCESS_ITSB_PTR
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
thr5_MMU_ASI_PRIMARY_323:
	.word	0x87802080
	.word	0xc4f120b8
	.word	0xbe86a038
	.word	0xd4dfc200
	.word	0x1000000
	or	%g0, 0x08f, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe16c000
	P_DDEMAP_RPAGE
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v004_exit:
	EXIT_GOOD
Thr5_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v102 DATA_VA=0x73500013a000
attr_data {
	Name = .Thr5_User_Data_4v102 ,
	VA = 0x73500013a000 ,/* 0x73500013bfc0 */
	RA = 0x03b019e000 ,
	PA = 0x03b019e000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073500013b133 80000003b019e440 */
	end_label   = Thr5_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v102_data_begin
Thr5_User_Data_4v102_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v202 DATA_VA=0x73500005e000
attr_data {
	Name = .Thr5_User_Data_4v202 ,
	VA = 0x73500005e000 ,/* 0x73500005ffc0 */
	RA = 0x03b0066000 ,
	PA = 0x03b0066000 ,
	TTE_Context = 0x0358 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000073500005e358 80000003b0066040 */
	end_label   = Thr5_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v202_data_begin
Thr5_User_Data_4v202_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v302 DATA_VA=0x740000300000
attr_data {
	Name = .Thr5_User_Data_4v302 ,
	VA = 0x740000300000 ,/* 0x74000030ffc0 */
	RA = 0x0040de0000 ,
	PA = 0x5840de0000 ,
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
	/* DTTE_TAG_DATA = 0000740000300000 8000005840de0041 */
	end_label   = Thr5_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v302_data_begin
Thr5_User_Data_4v302_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v005 TEXT_VA=0x73500013c000
attr_text {
	Name = .Thr5_User_Text_4v005 ,
	VA = 0x73500013c000 ,/* 0x73500013dfc0 */
	RA = 0x03b00b0000 ,
	PA = 0x03b00b0000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073500013d133 80000003b00b0080 */
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
	.word	0xc025a8ac
	.word	0x1000000
	or	%g0, 0x698, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
thr5_MMU_ASI_PRIMARY_324:
	.word	0x87802080
	.word	0xd8bda8c0
	DDEMAP_SCTX
	.word	0xfe4aa336
	.word	0xc672a050
	.word	0xc02c27eb
	.word	0xbe85a098
	.word	0xe0dfd000
	.word	0xbe82a120
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x3bd, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe56ad4e
	DDEMAP_PCTX
	TOGGLE_LSU_DM
	.word	0xc02daefe
	.word	0xfe5aafd0
	.word	0x1000000
	or	%g0, 0x4ae, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe44292c
	.word	0xfc995020
	IDEMAP_PCTX
	nop
	nop
	nop
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xbe154000
	GOTO_SUPERVISOR0
thr5_MMU_ASI_PRIMARY_325:
	.word	0x87802080
	.word	0xeaf2a050
	.word	0xfc9c5c60
	.word	0x1000000
	or	%g0, 0x00f, %i7
	LOAD_DDATA_IN
	DDEMAP_PCTX
thr5_MMU_ASI_PRIMARY_326:
	.word	0x87802080
	.word	0xf6f420d8
thr5_MMU_ASI_SECONDARY_327:
	.word	0x87802081
	.word	0xd8f16048
	DDEMAP_SCTX
	.word	0xc072ab58
	IDEMAP_ALL_PAGES
	DDEMAP_ALL_RPAGES
	TOGGLE_LSU_IM
	.word	0xc076a778
	.word	0xd872a078
	.word	0xc072ab20
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	TOGGLE_LSU_IM
	.word	0xfe4dabbe
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe442364
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v005_exit:
	EXIT_GOOD
Thr5_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v402 TEXT_VA=0x73500018e000
attr_text {
	Name = .Thr5_User_Text_4v402 ,
	VA = 0x73500018e000 ,/* 0x73500018ffc0 */
	RA = 0x03b0050000 ,
	PA = 0x5fb0050000 ,
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
	/* ITTE_TAG_DATA = 000073500018e000 8000005fb0050080 */
	end_label   = Thr5_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v402_text_begin
Thr5_User_Text_4v402_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_IM
	P_IDEMAP_ALL_PAGES
	.word	0xc071adf0
	.word	0x1000000
	or	%g0, 0x5f8, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x00b, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x170, %i7
	P_ITLB_TAG_READ
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x027, %i7
	P_LOAD_IDATA_IN
thr5_MMU_ASI_AS_IF_USER_PRIMARY_328:
	.word	0x87802010
	.word	0xd6f2a010
thr5_MMU_ASI_AS_IF_USER_PRIMARY_329:
	.word	0x87802010
	.word	0xc4f0a110
	.word	0xbe8760d0
	.word	0xd4dfc200
	.word	0x1000000
	or	%g0, 0x330, %i7
	P_READ_DDATA_ACCESS
	nop
	nop
	.word	0xfcdd9000
thr5_MMU_ASI_PRIMARY_330:
	.word	0x87802080
	.word	0xd2f0a050
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x163, %i7
	P_LOAD_IDATA_ACCESS
	P_DDEMAP_ALL_RPAGES
	P_IDEMAP_ALL_RPAGES
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0xd8, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x468, %i7
	P_DTLB_TAG_READ
	.word	0xc02b259d
	.word	0xec5ca038
thr5_MMU_ASI_AS_IF_USER_PRIMARY_331:
	.word	0x87802010
	.word	0xe8f5a028
	.word	0x1000000
	or	%g0, 0xf8, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x770, %i7
	P_DTLB_TAG_READ
	.word	0xfcd88200
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe174000
	P_IDEMAP_PAGE
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xb0, %i7
	P_ITLB_TAG_READ
	.word	0xc029a140
	.word	0xbe82a0b8
	.word	0xecdfd000
	.word	0xf871a0b0
	.word	0xc071a5e0
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v402_exit:
	EXIT_GOOD
Thr5_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v006 TEXT_VA=0x760300000000
attr_text {
	Name = .Thr5_User_Text_4v006 ,
	VA = 0x760300000000 ,/* 0x76030fffffc0 */
	RA = 0x0230000000 ,
	PA = 0x0230000000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 0000760300001133 8000000230000085 */
	end_label   = Thr5_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v006_text_begin
Thr5_User_Text_4v006_text_begin:
	wrpr	0, %gl
thr5_MMU_ASI_REAL_MEM_LITTLE_332:
	.word	0x8780201c
	.word	0xccf2a0a0
	.word	0xfcdf4200
	.word	0x1000000
	.word	0xbe16c000
	P_DDEMAP_RPAGE
	P_TOGGLE_LSU_DM
	P_ACCESS_ITSB_PTR
thr5_MMU_ASI_PRIMARY_333:
	.word	0x87802080
	.word	0xe0f42100
	.word	0xcc5ea0a0
	.word	0xbe80a098
	.word	0xf4dfd000
	.word	0xfe4da1dd
	.word	0xfc9a9100
thr5_MMU_ASI_PRIMARY_334:
	.word	0x87802080
	.word	0xc6f76050
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf45f6068
	P_DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0xbd, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe10c000
	P_DDEMAP_RPAGE
	.word	0xbe82a098
	.word	0xe0dfc200
	.word	0xe39a9e00
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v006_exit:
	EXIT_GOOD
Thr5_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v103 DATA_VA=0x740000690000
attr_data {
	Name = .Thr5_User_Data_4v103 ,
	VA = 0x740000690000 ,/* 0x74000069ffc0 */
	RA = 0x0040b90000 ,
	PA = 0x0040b90000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000691133 8000000040b90441 */
	end_label   = Thr5_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v103_data_begin
Thr5_User_Data_4v103_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v303 DATA_VA=0x735000062000
attr_data {
	Name = .Thr5_User_Data_4v303 ,
	VA = 0x735000062000 ,/* 0x735000063fc0 */
	RA = 0x03b01d8000 ,
	PA = 0x5fb01d8000 ,
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
	/* DTTE_TAG_DATA = 0000735000062000 8000005fb01d8040 */
	end_label   = Thr5_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v303_data_begin
Thr5_User_Data_4v303_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v007 TEXT_VA=0x740000770000
attr_text {
	Name = .Thr5_User_Text_4v007 ,
	VA = 0x740000770000 ,/* 0x74000077ffc0 */
	RA = 0x0040370000 ,
	PA = 0x0040370000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000740000771133 8000000040370081 */
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
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x38, %i7
	READ_DDATA_ACCESS
	.word	0xe0742068
	.word	0xc02dad22
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_IDATA_ACCESS
	.word	0xe2742040
	.word	0xc020a140
	.word	0xc072a8f0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
thr5_MMU_ASI_BLK_SL_335:
	.word	0x878020f9
	.word	0xc1b96800
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfcdf5040
	.word	0xc032affa
	DDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe130000
	IDEMAP_RPAGE
	DDEMAP_SCTX
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe12c000
	DDEMAP_PAGE
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf45c2068
	.word	0xec76a100
	.word	0xc032ac96
	DDEMAP_ALL_PAGES
	DDEMAP_NCTX
	.word	0xda75a030
	.word	0xc02f6140
	.word	0xe4742078
	.word	0xc0776a90
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc02c2f78
	nop
	.word	0xe4592018
	TOGGLE_LSU_IM
	.word	0xc076a570
	TOGGLE_LSU_DM
	ACCESS_DTSB_PTR
	DDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xe872a028
	.word	0xc0242830
	.word	0xfc995d60
	IDEMAP_PCTX
	TOGGLE_LSU_DM
	.word	0xd072a028
	.word	0xc0742140
	DDEMAP_PCTX
	.word	0xc02eadba
	DDEMAP_SCTX
	.word	0xc075a228
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xca72a010
	.word	0xc032ad5c
	.word	0x81c62000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v007_exit:
	EXIT_GOOD
Thr5_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v403 TEXT_VA=0x75001c000000
attr_text {
	Name = .Thr5_User_Text_4v403 ,
	VA = 0x75001c000000 ,/* 0x75001c3fffc0 */
	RA = 0x02a1c00000 ,
	PA = 0x02a1c00000 ,
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
	/* ITTE_TAG_DATA = 000075001c000000 80000002a1c00083 */
	end_label   = Thr5_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v403_text_begin
Thr5_User_Text_4v403_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe12c000
	P_DDEMAP_PAGE
thr5_MMU_ASI_AS_IF_USER_PRIMARY_336:
	.word	0x87802010
	.word	0xe4f5a018
	.word	0xd85b2018
	.word	0xbe80a0b8
	.word	0xecdfd000
	P_IDEMAP_ALL
	P_DDEMAP_ALL_RPAGES
	.word	0xbe85a130
	.word	0xecdfd000
thr5_MMU_ASI_SECONDARY_LITTLE_337:
	.word	0x87802089
	.word	0xccb969f0
thr5_MMU_ASI_PRIMARY_338:
	.word	0x87802080
	.word	0xecf6a038
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc071a4e0
	P_DDEMAP_ALL_RPAGES
	.word	0xfcdc5120
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_339:
	.word	0x87802022
	.word	0xecb8a690
	P_IDEMAP_ALL_PAGES
thr5_MMU_ASI_PRIMARY_340:
	.word	0x87802080
	.word	0xe8f2a058
	.word	0x1000000
	or	%g0, 0xe8, %i7
	P_ITLB_TAG_READ
	P_TOGGLE_LSU_IM
	nop
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x7a8, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0xe9, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe82a100
	.word	0xecdfc200
thr5_MMU_ASI_PRIMARY_341:
	.word	0x87802080
	.word	0xc6f2a138
thr5_MMU_ASI_BLK_COMMIT_P_342:
	.word	0x878020e0
	.word	0xc3bea340
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v403_exit:
	EXIT_GOOD
Thr5_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v104 DATA_VA=0x740000f70000
attr_data {
	Name = .Thr5_User_Data_4v104 ,
	VA = 0x740000f70000 ,/* 0x740000f7ffc0 */
	RA = 0x0040cd0000 ,
	PA = 0x0040cd0000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000f71133 8000000040cd0441 */
	end_label   = Thr5_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v104_data_begin
Thr5_User_Data_4v104_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v008 TEXT_VA=0x750009c00000
attr_text {
	Name = .Thr5_User_Text_4v008 ,
	VA = 0x750009c00000 ,/* 0x750009ffffc0 */
	RA = 0x02ac000000 ,
	PA = 0x02ac000000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000750009c01133 80000002ac000083 */
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
	.word	0xc0712938
	.word	0x1000000
	or	%g0, 0x017, %i7
	LOAD_DDATA_IN
	.word	0xea742000
	.word	0xc02eaf6d
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc075a9a0
	.word	0xfe5aa4f8
	.word	0xfcdf5000
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x124, %i7
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
	.word	0x1000000
	or	%g0, 0x091, %i7
	LOAD_DDATA_IN
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd658a010
	.word	0xe070a0f0
	.word	0xc02aa9ac
	.word	0xfe5ea9e0
	.word	0xc4742038
	.word	0xc026a578
	.word	0xe45aa018
	DDEMAP_SCTX
	DDEMAP_SCTX
	DDEMAP_ALL_RPAGES
	IDEMAP_ALL_RPAGES
	.word	0xc07424b8
	.word	0xfe4aab5f
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc072a260
thr5_MMU_ASI_SECONDARY_343:
	.word	0x87802081
	.word	0xfaf16038
	.word	0x1000000
	or	%g0, 0x1f0, %i7
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
	nop
	.word	0xc45ea120
	.word	0x1000000
	or	%g0, 0x4bf, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0xca76a010
	.word	0xc076a7a0
	.word	0xfe42a7e0
	.word	0x1000000
	.word	0xbe178000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x75f, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_PCTX
	nop
	nop
	.word	0x1000000
	or	%g0, 0xb8, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdd9000
	.word	0xe25aa010
	.word	0xfcdad160
	.word	0x1000000
	or	%g0, 0x1f8, %i7
	READ_IDATA_ACCESS
	.word	0xe45f60a0
	.word	0xea7120d8
	.word	0xc02dabdb
	.word	0xfe4daf09
	DDEMAP_ALL_RPAGES
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc4592008
	.word	0x1000000
	or	%g0, 0x09b, %i7
	LOAD_DDATA_IN
	.word	0xf45f60d0
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xcc75a018
	.word	0xc02aa182
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v008_exit:
	EXIT_GOOD
Thr5_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v404 TEXT_VA=0x735000076000
attr_text {
	Name = .Thr5_User_Text_4v404 ,
	VA = 0x735000076000 ,/* 0x735000077fc0 */
	RA = 0x03b0058000 ,
	PA = 0x5fb0058000 ,
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
	/* ITTE_TAG_DATA = 0000735000076000 8000005fb0058080 */
	end_label   = Thr5_User_Text_4v404_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v404_text_begin
Thr5_User_Text_4v404_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_IM
	.word	0xfcdd8200
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
	or	%g0, 0x042, %i7
	P_LOAD_DDATA_IN
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
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	P_READ_IDATA_ACCESS
	.word	0xfcde4280
	nop
	.word	0x1000000
	or	%g0, 0x151, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe86a060
	.word	0xc39fc2c0
	P_IDEMAP_ALL_PAGES
	.word	0xfe4ca711
	P_DDEMAP_SCTX
	.word	0xfcde8200
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_PRIMARY_344:
	.word	0x87802080
	.word	0xeaf6a050
	.word	0xbe846010
	.word	0xc39fc2e0
	.word	0xfc9ad120
	nop
	nop
	nop
	nop
	P_DDEMAP_ALL_RPAGES
	P_TOGGLE_LSU_IM
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v404_exit:
	EXIT_GOOD
Thr5_User_Text_4v404_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v105 DATA_VA=0x740000a10000
attr_data {
	Name = .Thr5_User_Data_4v105 ,
	VA = 0x740000a10000 ,/* 0x740000a1ffc0 */
	RA = 0x0040590000 ,
	PA = 0x0040590000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000a11133 8000000040590441 */
	end_label   = Thr5_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v105_data_begin
Thr5_User_Data_4v105_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v009 TEXT_VA=0x740000320000
attr_text {
	Name = .Thr5_User_Text_4v009 ,
	VA = 0x740000320000 ,/* 0x74000032ffc0 */
	RA = 0x0040af0000 ,
	PA = 0x0040af0000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000740000321133 8000000040af0081 */
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
	.word	0xc02c2931
	DDEMAP_ALL_PAGES
thr5_MMU_ASI_SECONDARY_LITTLE_345:
	.word	0x87802089
	.word	0xe4b965e0
thr5_MMU_ASI_SECONDARY_LITTLE_346:
	.word	0x87802089
	.word	0xc4bae6c0
	.word	0xe0776098
	.word	0xc032a676
	.word	0xfcdad020
	.word	0xc032a318
	DDEMAP_NCTX
	.word	0xbe82a098
	.word	0xe0dfd000
thr5_MMU_ASI_PRIMARY_347:
	.word	0x87802080
	.word	0xecf6a038
	.word	0xc032a84a
	.word	0x1000000
	or	%g0, 0x790, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x03f, %i7
	LOAD_DDATA_IN
thr5_MMU_ASI_BLK_P_348:
	.word	0x878020f0
	.word	0xc3bf6200
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x02d, %i7
	LOAD_DDATA_IN
	.word	0xcc742048
	.word	0xc02dae6f
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe16c000
	IDEMAP_RPAGE
	.word	0xc03126ae
	.word	0xbe82a098
	.word	0xecdfd000
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5da3a8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v009_exit:
	EXIT_GOOD
Thr5_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v106 DATA_VA=0x73500003e000
attr_data {
	Name = .Thr5_User_Data_4v106 ,
	VA = 0x73500003e000 ,/* 0x73500003ffc0 */
	RA = 0x03b0110000 ,
	PA = 0x03b0110000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073500003f133 80000003b0110440 */
	end_label   = Thr5_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v106_data_begin
Thr5_User_Data_4v106_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00a TEXT_VA=0x740000d40000
attr_text {
	Name = .Thr5_User_Text_4v00a ,
	VA = 0x740000d40000 ,/* 0x740000d4ffc0 */
	RA = 0x0040390000 ,
	PA = 0x0040390000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000740000d41133 8000000040390081 */
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
	.word	0xc875a038
	.word	0xc025a85c
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x036, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x770, %i7
	READ_DDATA_ACCESS
	.word	0xc02aa985
	.word	0xfe45aa2c
	.word	0xc85c2068
	.word	0xc02aa1d7
	.word	0xc02925d0
	.word	0x1000000
	or	%g0, 0x0, %i7
	READ_IDATA_ACCESS
	.word	0xc0742700
	.word	0xe2742010
	.word	0xc022a9f4
	.word	0xf270a028
	.word	0xc02ea786
	.word	0xfa5aa100
	.word	0xfe4f698b
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_NCTX
	TOGGLE_LSU_IM
	.word	0xfe412564
	.word	0xfa75a008
	.word	0xc0276c2c
	.word	0x1000000
	or	%g0, 0x030, %i7
	LOAD_IDATA_IN
	.word	0xc020ab80
	.word	0xc022aa54
	.word	0xc072a2d0
	.word	0xe39d9f00
	.word	0xd45aa008
	ACCESS_ITSB_PTR
	.word	0xda75a128
	.word	0xc032a6d4
	IDEMAP_ALL_RPAGES
	.word	0xfa5ea0d0
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
	.word	0xee72a0a0
	.word	0xc02da8b9
	.word	0xbe85a0d0
	.word	0xfadfd000
	nop
	nop
	nop
	.word	0xec5c2068
	.word	0xbe842038
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x042, %i7
	LOAD_DDATA_IN
	ACCESS_ITSB_PTR
	IDEMAP_ALL_PAGES
	TOGGLE_LSU_IM
	ACCESS_DTSB_PTR
	.word	0xfe442dac
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc072a9a8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00a_exit:
	EXIT_GOOD
Thr5_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v107 DATA_VA=0x73500016a000
attr_data {
	Name = .Thr5_User_Data_4v107 ,
	VA = 0x73500016a000 ,/* 0x73500016bfc0 */
	RA = 0x03b0122000 ,
	PA = 0x03b0122000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073500016b133 80000003b0122440 */
	end_label   = Thr5_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v107_data_begin
Thr5_User_Data_4v107_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00b TEXT_VA=0x7350000d6000
attr_text {
	Name = .Thr5_User_Text_4v00b ,
	VA = 0x7350000d6000 ,/* 0x7350000d7fc0 */
	RA = 0x03b01f4000 ,
	PA = 0x03b01f4000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007350000d7133 80000003b01f4080 */
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
	.word	0x1000000
	.word	0xbe128000
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
	nop
	.word	0x1000000
	or	%g0, 0x620, %i7
	READ_DDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0xfcde9000
thr5_MMU_ASI_PRIMARY_349:
	.word	0x87802080
	.word	0xd8f6a018
thr5_MMU_ASI_PRIMARY_LITTLE_350:
	.word	0x87802088
	.word	0xdcbda7f0
	.word	0xc026a140
	.word	0x1000000
	or	%g0, 0x60, %i7
	READ_IDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x19b, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe128000
	DDEMAP_PAGE
	.word	0xc85f6098
	.word	0xbe85a0b8
	.word	0xf4dfd000
	.word	0xc022a548
	IDEMAP_ALL_RPAGES
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x30, %i7
	READ_DDATA_ACCESS
	.word	0xfcdd9000
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe17c000
	IDEMAP_RPAGE
	.word	0xc02429a8
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_BLK_P_351:
	.word	0x878020f0
	.word	0xe3bda240
	nop
	nop
	.word	0xbe86a038
	.word	0xf4dfd000
	.word	0x1000000
	or	%g0, 0x7f0, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe25da010
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00b_exit:
	EXIT_GOOD
Thr5_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v108 DATA_VA=0x740000810000
attr_data {
	Name = .Thr5_User_Data_4v108 ,
	VA = 0x740000810000 ,/* 0x74000081ffc0 */
	RA = 0x00405a0000 ,
	PA = 0x00405a0000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000811133 80000000405a0441 */
	end_label   = Thr5_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v108_data_begin
Thr5_User_Data_4v108_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00c TEXT_VA=0x7350001dc000
attr_text {
	Name = .Thr5_User_Text_4v00c ,
	VA = 0x7350001dc000 ,/* 0x7350001ddfc0 */
	RA = 0x03b0078000 ,
	PA = 0x03b0078000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007350001dd133 80000003b0078080 */
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
	nop
	nop
	nop
	.word	0xbe85a038
	.word	0xd4dfd000
	DDEMAP_NCTX
	.word	0xc025a420
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe842098
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe842038
	.word	0xe0dfd000
	.word	0xfc995020
	.word	0x1000000
	or	%g0, 0xc8, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL
	nop
	nop
	.word	0xfcd95160
	.word	0xfcde9000
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcdc1040
	IDEMAP_ALL
	.word	0xfe4ea0d8
	.word	0xfcdc1100
	.word	0xbe85a0b8
	.word	0xd4dfd000
	.word	0xd0712028
	.word	0xc032abc0
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe158000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x710, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4da7c6
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00c_exit:
	EXIT_GOOD
Thr5_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v109 DATA_VA=0x75000e400000
attr_data {
	Name = .Thr5_User_Data_4v109 ,
	VA = 0x75000e400000 ,/* 0x75000e7fffc0 */
	RA = 0x02ad000000 ,
	PA = 0x02ad000000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000075000e401133 80000002ad000443 */
	end_label   = Thr5_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v109_data_begin
Thr5_User_Data_4v109_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00d TEXT_VA=0x735000064000
attr_text {
	Name = .Thr5_User_Text_4v00d ,
	VA = 0x735000064000 ,/* 0x735000065fc0 */
	RA = 0x03b01ba000 ,
	PA = 0x03b01ba000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000735000065133 80000003b01ba080 */
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
	TOGGLE_LSU_IM
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe55a726
	.word	0xbe82a0e0
	.word	0xc39fde00
thr5_MMU_ASI_SECONDARY_352:
	.word	0x87802081
	.word	0xccb96da0
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe46a824
	.word	0xfcdc5120
	DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xfcda9000
	.word	0xbe86a098
	.word	0xc8dfd000
thr5_MMU_ASI_PRIMARY_353:
	.word	0x87802080
	.word	0xd8f42048
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x68, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c6e000
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
	.word	0xe3995f20
	IDEMAP_NCTX
thr5_MMU_ASI_PRIMARY_354:
	.word	0x87802080
	.word	0xccf76018
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc024279c
	.word	0xc075ab00
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xd65aa070
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00d_exit:
	EXIT_GOOD
Thr5_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10a DATA_VA=0x73500008c000
attr_data {
	Name = .Thr5_User_Data_4v10a ,
	VA = 0x73500008c000 ,/* 0x73500008dfc0 */
	RA = 0x03b00b6000 ,
	PA = 0x03b00b6000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073500008d133 80000003b00b6440 */
	end_label   = Thr5_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10a_data_begin
Thr5_User_Data_4v10a_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00e TEXT_VA=0x7607c0000000
attr_text {
	Name = .Thr5_User_Text_4v00e ,
	VA = 0x7607c0000000 ,/* 0x7607cfffffc0 */
	RA = 0x0140000000 ,
	PA = 0x0140000000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 00007607c0001133 8000000140000085 */
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
	.word	0xc0376908
	.word	0xfc9f5c40
	.word	0xec5da0d0
	.word	0xfe45a600
	.word	0xc075a148
thr5_MMU_ASI_PRIMARY_355:
	.word	0x87802080
	.word	0xe8f42088
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x402, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x06c, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x670, %i7
	READ_DDATA_ACCESS
	DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe104000
	DDEMAP_RPAGE
thr5_MMU_ASI_SECONDARY_356:
	.word	0x87802081
	.word	0xd4baec80
	IDEMAP_ALL_RPAGES
thr5_MMU_ASI_PRIMARY_357:
	.word	0x87802080
	.word	0xcef42108
	.word	0x1000000
	or	%g0, 0x0b5, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x17c, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0xc02c2971
	IDEMAP_NCTX
	IDEMAP_ALL_RPAGES
	.word	0xc02f6e14
	.word	0x1000000
	or	%g0, 0x428, %i7
	DTLB_TAG_READ
	.word	0xfcde9000
	.word	0xc072a3c0
	.word	0xfe45ac50
	.word	0xc0242a9c
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe100000
	DDEMAP_PAGE
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	nop
	nop
	nop
	nop
	.word	0xe272a010
	.word	0xc030acd2
	.word	0xe05da098
	.word	0xc075ae08
	.word	0xc03421be
	.word	0xf45ea110
	.word	0x1000000
	or	%g0, 0x0af, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_NCTX
	DDEMAP_ALL_PAGES
	.word	0xca592010
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe44272c
	.word	0xfe542974
thr5_MMU_ASI_PRIMARY_358:
	.word	0x87802080
	.word	0xd6f42010
	.word	0x1000000
	or	%g0, 0xb8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x1c, %i7
	LOAD_IDATA_ACCESS
	.word	0xfc9c1c40
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x5f0, %i7
	ITLB_TAG_READ
	.word	0xfe542cee
	.word	0xdc776028
	.word	0xc02dae90
	.word	0xc6776118
	.word	0xc02dad7b
thr5_MMU_ASI_PRIMARY_359:
	.word	0x87802080
	.word	0xcaf42010
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x528, %i7
	ITLB_TAG_READ
	IDEMAP_PCTX
	TOGGLE_LSU_DM
thr5_MMU_ASI_PRIMARY_LITTLE_360:
	.word	0x87802088
	.word	0xf8f6a028
	.word	0xd45da0e0
	.word	0xd45aa0e0
	.word	0xc07762a8
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	LOAD_IDATA_ACCESS
	.word	0xe05aa098
thr5_MMU_ASI_PRIMARY_361:
	.word	0x87802080
	.word	0xf0bc2780
	.word	0xbe82a120
	.word	0xf4dfd000
	.word	0xfe52ae92
	.word	0x1000000
	or	%g0, 0x316, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x638, %i7
	READ_DDATA_ACCESS
	IDEMAP_ALL
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xd65aa010
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00e_exit:
	EXIT_GOOD
Thr5_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10b DATA_VA=0x73500016c000
attr_data {
	Name = .Thr5_User_Data_4v10b ,
	VA = 0x73500016c000 ,/* 0x73500016dfc0 */
	RA = 0x03b0022000 ,
	PA = 0x03b0022000 ,
	TTE_Context = 0x1133 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073500016d133 80000003b0022440 */
	end_label   = Thr5_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10b_data_begin
Thr5_User_Data_4v10b_data_begin:
	.xword	0x760370000000
	.xword	0x760270000000
	.xword	0x750028000000
	.xword	0x75000bc00000
	.xword	0x740000b30000
	.xword	0x740000ac0000
	.xword	0x740000de0000
	.xword	0x75002dc00000
	.xword	0x7350000f4000
	.xword	0x740000270000
	.xword	0x7400004d0000
	.xword	0x7400003e0000
	.xword	0x7350001f6000
	.xword	0x73500013a000
	.xword	0x73500005e000
	.xword	0x740000300000
	.xword	0x73500013c000
	.xword	0x73500018e000
	.xword	0x760300000000
	.xword	0x740000690000
	.xword	0x735000062000
	.xword	0x740000770000
	.xword	0x75001c000000
	.xword	0x740000f70000
	.xword	0x750009c00000
	.xword	0x735000076000
	.xword	0x740000a10000
	.xword	0x740000320000
	.xword	0x73500003e000
	.xword	0x740000d40000
	.xword	0x73500016a000
	.xword	0x7350000d6000
	.xword	0x740000810000
	.xword	0x7350001dc000
	.xword	0x75000e400000
	.xword	0x735000064000
	.xword	0x73500008c000
	.xword	0x7607c0000000
	.xword	0x73500016c000
	.xword	0x75000ac00000
Thr5_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00f TEXT_VA=0x75000ac00000
attr_text {
	Name = .Thr5_User_Text_4v00f ,
	VA = 0x75000ac00000 ,/* 0x75000affffc0 */
	RA = 0x02af000000 ,
	PA = 0x02af000000 ,
	TTE_Context = 0x1133 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000075000ac01133 80000002af000083 */
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
	.word	0xc0342140
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x10, %i7
	READ_IDATA_ACCESS
thr5_MMU_ASI_PRIMARY_362:
	.word	0x87802080
	.word	0xf8f5a028
	DDEMAP_NCTX
	DDEMAP_SCTX
	.word	0xbe816010
	.word	0xcadfd020
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	TOGGLE_LSU_DM
	ACCESS_ITSB_PTR
	IDEMAP_ALL_RPAGES
	.word	0xfcdd9000
	TOGGLE_LSU_DM
	.word	0xec5aa008
	.word	0x1000000
	or	%g0, 0x0a0, %i7
	LOAD_DDATA_IN
	.word	0xfe5ea660
	.word	0xe1995f20
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xca5f6040
	.word	0xfcda9000
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x016, %i7
	LOAD_DDATA_IN
thr5_MMU_ASI_BLK_P_363:
	.word	0x878020f0
	.word	0xe3b8a140
	.word	0x1000000
	or	%g0, 0x016, %i7
	LOAD_IDATA_IN
	.word	0xbe86a038
	.word	0xecdfd000
thr5_MMU_ASI_PRIMARY_364:
	.word	0x87802080
	.word	0xd8f76078
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_NCTX
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5eac90
	.word	0x1000000
	or	%g0, 0x568, %i7
	READ_DDATA_ACCESS
thr5_MMU_ASI_BLK_P_365:
	.word	0x878020f0
	.word	0xe3bc2f80
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x47, %i7
	LOAD_IDATA_ACCESS
	.word	0xc0376d38
thr5_MMU_ASI_BLK_P_366:
	.word	0x878020f0
	.word	0xc3bea3c0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	.word	0xfcdd9100
	.word	0xd65ea010
	TOGGLE_LSU_DM
	.word	0xf676a118
	.word	0xc070aee8
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	.word	0xe45da078
	.word	0x1000000
	.word	0xbe138000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x158, %i7
	READ_DDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
thr5_MMU_ASI_BLK_P_367:
	.word	0x878020f0
	.word	0xe3bc2d80
	.word	0xee76a018
	.word	0xc025ad20
	.word	0xda72a020
	.word	0xc072a210
	.word	0x1000000
	or	%g0, 0x04e, %i7
	LOAD_IDATA_IN
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x15a, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc85c2098
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00f_exit:
	EXIT_GOOD
Thr5_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v000 TEXT_VA=0x77600005c000
attr_text {
	Name = .Thr6_User_Text_4v000 ,
	VA = 0x77600005c000 ,/* 0x77600005dfc0 */
	RA = 0x03c00da000 ,
	PA = 0x6fc00da000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077600005cc1b 8000006fc00da480 */
	end_label   = Thr6_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr6_user_code_entry
Thr6_user_code_entry:
	setx	0x776000198000, %g1, %g2
	or	%g0, 16, %g1
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
	.word	0xd8756018
	.word	0xc034226c
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
	TOGGLE_LSU_DM
	.word	0xc0776470
	.word	0xfe4d69bf
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_368:
	.word	0x87802080
	.word	0xdcf42028
	.word	0x1000000
	or	%g0, 0x018, %i7
	LOAD_IDATA_IN
	DDEMAP_ALL_RPAGES
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
thr6_MMU_ASI_PRIMARY_369:
	.word	0x87802080
	.word	0xfaf6a0b8
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x588, %i7
	ITLB_TAG_READ
	.word	0xf272a028
	.word	0xc0742490
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf27760b0
	.word	0xc0342dcc
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe82a110
	.word	0xc8dfd000
thr6_MMU_ASI_PRIMARY_370:
	.word	0x87802080
	.word	0xd4f6a090
	.word	0x1000000
	.word	0xbe118000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x535, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe4ea611
	.word	0x1000000
	or	%g0, 0x438, %i7
	ITLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5d6328
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v000_exit:
	EXIT_GOOD
Thr6_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v100 DATA_VA=0x776000198000
attr_data {
	Name = .Thr6_User_Data_4v100 ,
	VA = 0x776000198000 ,/* 0x776000199fc0 */
	RA = 0x03c00ec000 ,
	PA = 0x6fc00ec000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000776000198c1b 8000006fc00ec040 */
	end_label   = Thr6_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v100_data_begin
Thr6_User_Data_4v100_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v200 DATA_VA=0x77600016e000
attr_data {
	Name = .Thr6_User_Data_4v200 ,
	VA = 0x77600016e000 ,/* 0x77600016ffc0 */
	RA = 0x03c0170000 ,
	PA = 0x6fc0170000 ,
	TTE_Context = 0x0ef5 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000077600016fb46 8000006fc0170040 */
	end_label   = Thr6_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v200_data_begin
Thr6_User_Data_4v200_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v300 DATA_VA=0x776000148000
attr_data {
	Name = .Thr6_User_Data_4v300 ,
	VA = 0x776000148000 ,/* 0x776000149fc0 */
	RA = 0x03c0064000 ,
	PA = 0x6fc0064000 ,
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
	/* DTTE_TAG_DATA = 0000776000148000 8000006fc0064040 */
	end_label   = Thr6_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v300_data_begin
Thr6_User_Data_4v300_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v001 TEXT_VA=0x780000a70000
attr_text {
	Name = .Thr6_User_Text_4v001 ,
	VA = 0x780000a70000 ,/* 0x780000a7ffc0 */
	RA = 0x0050730000 ,
	PA = 0x6850730000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000780000a7033d 8000006850730481 */
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
	TOGGLE_LSU_IM
	.word	0xc0212180
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	DTLB_TAG_READ
	.word	0xcc5ea048
	.word	0xec5c2010
	.word	0x1000000
	.word	0xbe144000
	DDEMAP_RPAGE
	.word	0xfc9ad120
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe19d9f20
	.word	0x1000000
	or	%g0, 0xe0, %i7
	ITLB_TAG_READ
	DDEMAP_ALL
	.word	0xd45d60f0
	.word	0x1000000
	or	%g0, 0x03f, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xf0756000
	.word	0xc0256a08
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v001_exit:
	EXIT_GOOD
Thr6_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v400 TEXT_VA=0x77600013e000
attr_text {
	Name = .Thr6_User_Text_4v400 ,
	VA = 0x77600013e000 ,/* 0x77600013ffc0 */
	RA = 0x03c0074000 ,
	PA = 0x6fc0074000 ,
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
	/* ITTE_TAG_DATA = 000077600013e000 8000006fc0074080 */
	end_label   = Thr6_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v400_text_begin
Thr6_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xfcd90200
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_371:
	.word	0x8780202a
	.word	0xc8bf6a50
	.word	0xbe86a148
	.word	0xfadfd000
	nop
	nop
	P_TOGGLE_LSU_DM
	P_ACCESS_ITSB_PTR
	.word	0xbe8560f0
	.word	0xd4dfc200
	.word	0x1000000
	or	%g0, 0x718, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe876038
	.word	0xd4dfc200
	.word	0xfe45e5f0
	P_ACCESS_ITSB_PTR
	.word	0xfe5b2f00
	P_TOGGLE_LSU_IM
	.word	0xfcda8200
thr6_MMU_ASI_PRIMARY_372:
	.word	0x87802080
	.word	0xecf76070
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x148, %i7
	P_ITLB_TAG_READ
	.word	0xea732038
	.word	0xc0732e00
	.word	0xbe842068
	.word	0xeadfc200
	.word	0xc02de84e
	.word	0xbe8420e0
	.word	0xeadfc200
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
thr6_MMU_ASI_AS_IF_USER_PRIMARY_373:
	.word	0x87802010
	.word	0xc6f2a030
thr6_MMU_ASI_PRIMARY_374:
	.word	0x87802080
	.word	0xdaf6a0e8
	.word	0xfcdc1040
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_375:
	.word	0x87802023
	.word	0xecb96c40
	.word	0xfe45e254
	P_DDEMAP_SCTX
	P_IDEMAP_ALL_RPAGES
	.word	0xbe86a0b8
	.word	0xd4dfd000
	P_IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x09d, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe856008
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x091, %i7
	P_LOAD_IDATA_IN
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x561, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xda732050
	.word	0xc02ee9fa
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xbe856008
	.word	0xd4dfc200
	.word	0xea59a0b8
	.word	0xc036e25a
	.word	0xea7320e0
	.word	0xc075e9e8
	.word	0xd65ca070
	.word	0xe871a028
	.word	0xc02b2deb
	.word	0x1000000
	or	%g0, 0x3a8, %i7
	P_READ_DDATA_ACCESS
thr6_MMU_ASI_PRIMARY_376:
	.word	0x87802080
	.word	0xdaf2a080
	.word	0x1000000
	.word	0xbe160000
	P_DDEMAP_RPAGE
thr6_MMU_ASI_AS_IF_USER_PRIMARY_377:
	.word	0x87802010
	.word	0xeef2a048
	.word	0xc03322da
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v400_exit:
	EXIT_GOOD
Thr6_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v002 TEXT_VA=0x79002cc00000
attr_text {
	Name = .Thr6_User_Text_4v002 ,
	VA = 0x79002cc00000 ,/* 0x79002cffffc0 */
	RA = 0x02b4c00000 ,
	PA = 0x02b4c00000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000079002cc0033d 80000002b4c00483 */
	end_label   = Thr6_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v002_text_begin
Thr6_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	P_LOAD_IDATA_ACCESS
	P_DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x062, %i7
	P_LOAD_DDATA_IN
	.word	0xfe576194
	.word	0x1000000
	or	%g0, 0x6b8, %i7
	P_DTLB_TAG_READ
	.word	0xc022a44c
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x410, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe13c000
	P_DDEMAP_PAGE
	.word	0xc076adf0
	P_ACCESS_DTSB_PTR
	P_DDEMAP_PCTX
	nop
	P_TOGGLE_LSU_IM
	P_DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9e04c0
	.word	0x1000000
	or	%g0, 0x42, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe108000
	P_DDEMAP_RPAGE
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_ACCESS_ITSB_PTR
	P_DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe45aa0a0
	.word	0x1000000
	or	%g0, 0x3c8, %i7
	P_DTLB_TAG_READ
	.word	0xfcdd4200
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x546, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45aa150
	P_ACCESS_DTSB_PTR
	.word	0xda776020
	.word	0xc02f6158
thr6_MMU_ASI_AS_IF_USER_PRIMARY_378:
	.word	0x87802010
	.word	0xdcf76028
	.word	0x1000000
	or	%g0, 0x003, %i7
	P_LOAD_IDATA_IN
thr6_MMU_ASI_REAL_IO_LITTLE_379:
	.word	0x8780201d
	.word	0xd2f460c8
	P_DDEMAP_SCTX
	.word	0xfcdad020
	.word	0x1000000
	or	%g0, 0x5e4, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xc03568b2
	.word	0xc02aa502
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr6_User_Text_4v002_exit:
	EXIT_GOOD
Thr6_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v101 DATA_VA=0x77600006a000
attr_data {
	Name = .Thr6_User_Data_4v101 ,
	VA = 0x77600006a000 ,/* 0x77600006bfc0 */
	RA = 0x03c01cc000 ,
	PA = 0x6fc01cc000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077600006ac1b 8000006fc01cc040 */
	end_label   = Thr6_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v101_data_begin
Thr6_User_Data_4v101_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v201 DATA_VA=0x776000170000
attr_data {
	Name = .Thr6_User_Data_4v201 ,
	VA = 0x776000170000 ,/* 0x776000171fc0 */
	RA = 0x03c01dc000 ,
	PA = 0x6fc01dc000 ,
	TTE_Context = 0x0ef5 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000776000171b46 8000006fc01dc040 */
	end_label   = Thr6_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v201_data_begin
Thr6_User_Data_4v201_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v301 DATA_VA=0x7760001a6000
attr_data {
	Name = .Thr6_User_Data_4v301 ,
	VA = 0x7760001a6000 ,/* 0x7760001a7fc0 */
	RA = 0x03c0174000 ,
	PA = 0x6fc0174000 ,
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
	/* DTTE_TAG_DATA = 00007760001a6000 8000006fc0174040 */
	end_label   = Thr6_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v301_data_begin
Thr6_User_Data_4v301_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v003 TEXT_VA=0x776000100000
attr_text {
	Name = .Thr6_User_Text_4v003 ,
	VA = 0x776000100000 ,/* 0x776000101fc0 */
	RA = 0x03c00bc000 ,
	PA = 0x6fc00bc000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000776000100c1b 8000006fc00bc480 */
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
	IDEMAP_ALL_PAGES
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5aae28
	.word	0xd872a0a0
	.word	0xc036a808
	.word	0x1000000
	or	%g0, 0x0ac, %i7
	LOAD_DDATA_IN
	.word	0xbe86a130
	.word	0xc39fde00
thr6_MMU_ASI_PRIMARY_LITTLE_380:
	.word	0x87802088
	.word	0xecf6a010
	.word	0x1000000
	or	%g0, 0x500, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_IM
	.word	0xfc9e9c40
	DDEMAP_PCTX
	IDEMAP_ALL
	.word	0xfe5aa5f8
	.word	0xc45c20b8
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe46a348
	.word	0x1000000
	or	%g0, 0x488, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	ITLB_TAG_READ
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfcda9000
	ACCESS_DTSB_PTR
thr6_MMU_ASI_PRIMARY_LITTLE_381:
	.word	0x87802088
	.word	0xe8f56058
	.word	0xee712078
	.word	0xc022aa3c
	.word	0xfe5eae28
	.word	0x1000000
	or	%g0, 0x439, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe86a090
	.word	0xfadfd000
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x50a, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe55652c
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x02c, %i7
	LOAD_IDATA_IN
	.word	0xbe812090
	.word	0xd4dfd000
	.word	0xe05ea090
	.word	0x1000000
	or	%g0, 0x0a5, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_IM
	.word	0xfe46a0a4
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	READ_IDATA_ACCESS
thr6_MMU_ASI_PRIMARY_382:
	.word	0x87802080
	.word	0xdcf6a028
	.word	0xfe5d6800
	.word	0xfcdc1000
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x1c8, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xc02569b4
	IDEMAP_ALL
	.word	0xe05aa038
	IDEMAP_ALL_PAGES
	.word	0xfe4c24e5
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5122ba
	.word	0xbe164000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v003_exit:
	EXIT_GOOD
Thr6_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v401 TEXT_VA=0x780000680000
attr_text {
	Name = .Thr6_User_Text_4v401 ,
	VA = 0x780000680000 ,/* 0x78000068ffc0 */
	RA = 0x0050d00000 ,
	PA = 0x0050d00000 ,
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
	/* ITTE_TAG_DATA = 0000780000680000 8000000050d00081 */
	end_label   = Thr6_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v401_text_begin
Thr6_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0xc031ae40
	.word	0xfc9c8480
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_AS_IF_USER_PRIMARY_383:
	.word	0x87802010
	.word	0xf2f2a028
thr6_MMU_ASI_REAL_IO_LITTLE_384:
	.word	0x8780201d
	.word	0xe0f5e008
	.word	0xfc9d9c60
	nop
	nop
	.word	0xfcda8200
	.word	0xfe4b2e9d
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe178000
	P_DDEMAP_RPAGE
	.word	0xbe86a150
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x529, %i7
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
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x036, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x6a0, %i7
	P_DTLB_TAG_READ
	.word	0xfcdc1000
	nop
	nop
	P_ACCESS_ITSB_PTR
	P_TOGGLE_LSU_DM
	P_IDEMAP_ALL_PAGES
	.word	0xfcdad060
thr6_MMU_ASI_BLK_COMMIT_P_385:
	.word	0x878020e0
	.word	0xe1bc2ec0
thr6_MMU_ASI_AS_IF_USER_PRIMARY_386:
	.word	0x87802010
	.word	0xe2f6a010
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v401_exit:
	EXIT_GOOD
Thr6_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v004 TEXT_VA=0x79001dc00000
attr_text {
	Name = .Thr6_User_Text_4v004 ,
	VA = 0x79001dc00000 ,/* 0x79001dffffc0 */
	RA = 0x02b4000000 ,
	PA = 0x02b4000000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000079001dc0033d 80000002b4000483 */
	end_label   = Thr6_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v004_text_begin
Thr6_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xbe82a0e0
	.word	0xf4dfc200
	.word	0xfc9f5c40
	nop
	nop
	nop
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x190, %i7
	P_READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x47a, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xe7, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcdc0200
	.word	0xfcde9000
	.word	0xc02eacc7
	.word	0x1000000
	or	%g0, 0x445, %i7
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd0712088
	.word	0xc02aace0
	.word	0xc02c2495
thr6_MMU_ASI_REAL_IO_LITTLE_387:
	.word	0x8780201d
	.word	0xfaf32038
	.word	0xc02c2fe0
	.word	0xbe856090
	.word	0xd4dfc200
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_388:
	.word	0x8780202a
	.word	0xd8bea8f0
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	P_LOAD_IDATA_ACCESS
	P_IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x400, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x10b, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc036a158
	.word	0x1000000
	or	%g0, 0x06c, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
thr6_MMU_ASI_REAL_MEM_LITTLE_389:
	.word	0x8780201c
	.word	0xc8f6e068
	P_IDEMAP_NCTX
	P_ACCESS_DTSB_PTR
	.word	0xbe812038
	.word	0xe0dfc200
	.word	0x1000000
	or	%g0, 0x478, %i7
	P_ITLB_TAG_READ
	P_IDEMAP_ALL
	.word	0xfcda8200
	.word	0x1000000
	or	%g0, 0x68, %i7
	P_ITLB_TAG_READ
	.word	0xfc9a9000
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr6_User_Text_4v004_exit:
	EXIT_GOOD
Thr6_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v102 DATA_VA=0x79001e400000
attr_data {
	Name = .Thr6_User_Data_4v102 ,
	VA = 0x79001e400000 ,/* 0x79001e7fffc0 */
	RA = 0x02bd400000 ,
	PA = 0x02bd400000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000079001e40033d 80000002bd400043 */
	end_label   = Thr6_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v102_data_begin
Thr6_User_Data_4v102_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v202 DATA_VA=0x790018800000
attr_data {
	Name = .Thr6_User_Data_4v202 ,
	VA = 0x790018800000 ,/* 0x790018bfffc0 */
	RA = 0x02b2000000 ,
	PA = 0x02b2000000 ,
	TTE_Context = 0x0ef5 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000790018800ef5 80000002b2000043 */
	end_label   = Thr6_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v202_data_begin
Thr6_User_Data_4v202_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v302 DATA_VA=0x780000e70000
attr_data {
	Name = .Thr6_User_Data_4v302 ,
	VA = 0x780000e70000 ,/* 0x780000e7ffc0 */
	RA = 0x0050ba0000 ,
	PA = 0x0050ba0000 ,
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
	/* DTTE_TAG_DATA = 0000780000e70000 8000000050ba0041 */
	end_label   = Thr6_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v302_data_begin
Thr6_User_Data_4v302_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v005 TEXT_VA=0x790022800000
attr_text {
	Name = .Thr6_User_Text_4v005 ,
	VA = 0x790022800000 ,/* 0x790022bfffc0 */
	RA = 0x02b2800000 ,
	PA = 0x02b2800000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000079002280033d 80000002b2800483 */
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
	TOGGLE_LSU_IM
	.word	0xfc995020
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x2f7, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	.word	0xbe876110
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
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdf5000
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x21f, %i7
	LOAD_DDATA_ACCESS
	.word	0xc02eadd6
	IDEMAP_ALL_RPAGES
	.word	0xec742010
	.word	0xc07564b0
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x1aa, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc032a740
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x575, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0xe4756018
	.word	0xc02aa7c9
thr6_MMU_ASI_PRIMARY_390:
	.word	0x87802080
	.word	0xdef2a080
	.word	0x1000000
	or	%g0, 0x19c, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe4c2036
	.word	0x1000000
	or	%g0, 0x41d, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5d6fa8
thr6_MMU_ASI_PRIMARY_391:
	.word	0x87802080
	.word	0xf8f56000
	.word	0xfa5d6090
	DO_BRANCH
	.word	0x81c3e000
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
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xbe842090
	.word	0xeadfd040
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc02ea2ce
	.word	0x1000000
	or	%g0, 0x49b, %i7
	LOAD_IDATA_ACCESS
	.word	0xe672a0a8
	.word	0xc0756af8
	.word	0x1000000
	or	%g0, 0x085, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe39c5e20
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8420b8
	.word	0xeadfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe158000
	IDEMAP_RPAGE
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe108000
	IDEMAP_RPAGE
	.word	0xc02d6b79
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_RPAGE
	.word	0xc0292f07
	.word	0xfcda9000
	.word	0xc0742f50
	DDEMAP_PCTX
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	READ_IDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0242eb4
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v005_exit:
	EXIT_GOOD
Thr6_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v402 TEXT_VA=0x780000550000
attr_text {
	Name = .Thr6_User_Text_4v402 ,
	VA = 0x780000550000 ,/* 0x78000055ffc0 */
	RA = 0x0050740000 ,
	PA = 0x0050740000 ,
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
	/* ITTE_TAG_DATA = 0000780000550000 8000000050740081 */
	end_label   = Thr6_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v402_text_begin
Thr6_User_Text_4v402_text_begin:
	wrpr	0, %gl
thr6_MMU_ASI_SECONDARY_LITTLE_392:
	.word	0x87802089
	.word	0xd2f46000
	.word	0x1000000
	or	%g0, 0x120, %i7
	P_READ_IDATA_ACCESS
	nop
	.word	0xc19e9e00
	nop
	nop
	nop
	nop
	nop
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
	or	%g0, 0x014, %i7
	P_LOAD_DDATA_IN
	P_TOGGLE_LSU_IM
	.word	0xbe856038
	.word	0xeadfd040
	.word	0xbe816098
	.word	0xcadfc220
	.word	0x1000000
	or	%g0, 0x550, %i7
	P_ITLB_TAG_READ
	.word	0xc0232620
	.word	0x1000000
	or	%g0, 0x2f1, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	P_ITLB_TAG_READ
thr6_MMU_ASI_BLK_COMMIT_P_393:
	.word	0x878020e0
	.word	0xc3bd6340
	.word	0x1000000
	or	%g0, 0x038, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x67a, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe12c000
	P_IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	P_ITLB_TAG_READ
	nop
	.word	0xce732108
	.word	0xc076e8a0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_ACCESS_ITSB_PTR
thr6_MMU_ASI_AS_IF_USER_SECONDARY_394:
	.word	0x87802011
	.word	0xecf2e070
	P_TOGGLE_LSU_IM
	.word	0xc39d9e20
	P_IDEMAP_ALL_RPAGES
thr6_MMU_ASI_PRIMARY_395:
	.word	0x87802080
	.word	0xf8baa830
	.word	0xc02def03
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	P_READ_IDATA_ACCESS
	P_ACCESS_ITSB_PTR
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_396:
	.word	0x8780202a
	.word	0xf4baa1a0
	.word	0xfcdc0300
	.word	0xfcde9000
	P_IDEMAP_ALL_RPAGES
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v402_exit:
	EXIT_GOOD
Thr6_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v103 DATA_VA=0x776000172000
attr_data {
	Name = .Thr6_User_Data_4v103 ,
	VA = 0x776000172000 ,/* 0x776000173fc0 */
	RA = 0x03c016a000 ,
	PA = 0x6fc016a000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000776000172c1b 8000006fc016a040 */
	end_label   = Thr6_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v103_data_begin
Thr6_User_Data_4v103_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v203 DATA_VA=0x780000410000
attr_data {
	Name = .Thr6_User_Data_4v203 ,
	VA = 0x780000410000 ,/* 0x78000041ffc0 */
	RA = 0x0050fd0000 ,
	PA = 0x6850fd0000 ,
	TTE_Context = 0x0ef5 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000780000410ef5 8000006850fd0041 */
	end_label   = Thr6_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v203_data_begin
Thr6_User_Data_4v203_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v303 DATA_VA=0x780000900000
attr_data {
	Name = .Thr6_User_Data_4v303 ,
	VA = 0x780000900000 ,/* 0x78000090ffc0 */
	RA = 0x0050ae0000 ,
	PA = 0x0050ae0000 ,
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
	/* DTTE_TAG_DATA = 0000780000900000 8000000050ae0041 */
	end_label   = Thr6_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v303_data_begin
Thr6_User_Data_4v303_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v006 TEXT_VA=0x780000490000
attr_text {
	Name = .Thr6_User_Text_4v006 ,
	VA = 0x780000490000 ,/* 0x78000049ffc0 */
	RA = 0x0050410000 ,
	PA = 0x6850410000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000078000049033d 8000006850410481 */
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
	.word	0xf45920b8
	.word	0xc0342158
	.word	0xc85c2090
	.word	0x1000000
	or	%g0, 0x26d, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_IM
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x069, %i7
	LOAD_IDATA_IN
	.word	0xfe4c21c7
	.word	0xea5aa0b8
thr6_MMU_ASI_SECONDARY_397:
	.word	0x87802081
	.word	0xecf2e070
	IDEMAP_NCTX
	.word	0xc0292158
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
	nop
	.word	0x1000000
	.word	0xbe158000
	DDEMAP_PAGE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe110000
	IDEMAP_RPAGE
	.word	0xfe4eadf7
	IDEMAP_ALL_RPAGES
	.word	0xfa5c20b8
	.word	0xbe8560d0
	.word	0xfadfd000
	DDEMAP_PCTX
	.word	0xbe812090
	.word	0xe39fde00
	.word	0xee5d60c0
	.word	0xe270a010
	.word	0xc0342744
	.word	0xc0242514
	.word	0x1000000
	or	%g0, 0x7, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x2d0, %i7
	DTLB_TAG_READ
thr6_MMU_ASI_PRIMARY_LITTLE_398:
	.word	0x87802088
	.word	0xd8beac30
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x30, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x055, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_IDATA_ACCESS
	.word	0xc0756e58
	.word	0xfe556602
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xda76a0c8
	.word	0xc02427c4
	DDEMAP_NCTX
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe456e70
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x07a, %i7
	LOAD_DDATA_IN
	.word	0xfe4aa15b
	.word	0x1000000
	or	%g0, 0x076, %i7
	LOAD_IDATA_IN
	DDEMAP_NCTX
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc024292c
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v006_exit:
	EXIT_GOOD
Thr6_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v403 TEXT_VA=0x790011800000
attr_text {
	Name = .Thr6_User_Text_4v403 ,
	VA = 0x790011800000 ,/* 0x790011bfffc0 */
	RA = 0x02b3c00000 ,
	PA = 0x02b3c00000 ,
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
	/* ITTE_TAG_DATA = 0000790011800000 80000002b3c00083 */
	end_label   = Thr6_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v403_text_begin
Thr6_User_Text_4v403_text_begin:
	wrpr	0, %gl
thr6_MMU_ASI_BLK_COMMIT_S_399:
	.word	0x878020e1
	.word	0xe1bc6840
	.word	0x1000000
	or	%g0, 0x7a, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc39c1e00
	.word	0x1000000
	or	%g0, 0x44c, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe876038
	.word	0xd4dfd000
	.word	0xc071a738
	.word	0xbe876148
	.word	0xeadfd000
	.word	0xbe856100
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x430, %i7
	P_ITLB_TAG_READ
	P_ACCESS_ITSB_PTR
	.word	0xfcd89000
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xfcdc43a0
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x03f, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x138, %i7
	P_READ_IDATA_ACCESS
	P_ACCESS_ITSB_PTR
	.word	0xc025e1a8
	P_IDEMAP_ALL_RPAGES
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v403_exit:
	EXIT_GOOD
Thr6_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v104 DATA_VA=0x776000118000
attr_data {
	Name = .Thr6_User_Data_4v104 ,
	VA = 0x776000118000 ,/* 0x776000119fc0 */
	RA = 0x03c0172000 ,
	PA = 0x6fc0172000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000776000118c1b 8000006fc0172040 */
	end_label   = Thr6_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v104_data_begin
Thr6_User_Data_4v104_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v304 DATA_VA=0x780000090000
attr_data {
	Name = .Thr6_User_Data_4v304 ,
	VA = 0x780000090000 ,/* 0x78000009ffc0 */
	RA = 0x00502c0000 ,
	PA = 0x00502c0000 ,
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
	/* DTTE_TAG_DATA = 0000780000090000 80000000502c0041 */
	end_label   = Thr6_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v304_data_begin
Thr6_User_Data_4v304_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v007 TEXT_VA=0x7800007a0000
attr_text {
	Name = .Thr6_User_Text_4v007 ,
	VA = 0x7800007a0000 ,/* 0x7800007affc0 */
	RA = 0x0050100000 ,
	PA = 0x6850100000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007800007a033d 8000006850100481 */
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
	.word	0xfcdf5000
	DDEMAP_PCTX
	ACCESS_DTSB_PTR
	ACCESS_ITSB_PTR
	.word	0xbe86a130
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x0b2, %i7
	LOAD_DDATA_IN
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x09c, %i7
	LOAD_IDATA_IN
	IDEMAP_ALL_RPAGES
	.word	0xf876a000
	.word	0xc0276e28
	.word	0xca5aa010
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe164000
	DDEMAP_PAGE
	.word	0xd85aa018
	.word	0x1000000
	or	%g0, 0x044, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe144000
	IDEMAP_RPAGE
	.word	0xfe5aa090
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0xde76a000
	.word	0xc025698c
	.word	0x1000000
	or	%g0, 0x0a9, %i7
	LOAD_DDATA_IN
	.word	0xee5aa018
	.word	0xc85d6118
thr6_MMU_ASI_BLK_P_400:
	.word	0x878020f0
	.word	0xe3b92b40
	.word	0x1000000
	or	%g0, 0x250, %i7
	DTLB_TAG_READ
thr6_MMU_ASI_BLK_P_401:
	.word	0x878020f0
	.word	0xe1b92b80
	.word	0x1000000
	or	%g0, 0x128, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe556032
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v007_exit:
	EXIT_GOOD
Thr6_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v105 DATA_VA=0x780000060000
attr_data {
	Name = .Thr6_User_Data_4v105 ,
	VA = 0x780000060000 ,/* 0x78000006ffc0 */
	RA = 0x0050970000 ,
	PA = 0x6850970000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000078000006033d 8000006850970041 */
	end_label   = Thr6_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v105_data_begin
Thr6_User_Data_4v105_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v008 TEXT_VA=0x7760000cc000
attr_text {
	Name = .Thr6_User_Text_4v008 ,
	VA = 0x7760000cc000 ,/* 0x7760000cdfc0 */
	RA = 0x03c0052000 ,
	PA = 0x6fc0052000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007760000ccc1b 8000006fc0052480 */
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
	.word	0x1000000
	or	%g0, 0x09d, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x558, %i7
	ITLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr6_MMU_ASI_BLK_COMMIT_P_402:
	.word	0x878020e0
	.word	0xe3bf64c0
	.word	0xfe46a010
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xee70a018
	.word	0xc070a158
	ACCESS_DTSB_PTR
	.word	0xd076a028
	.word	0xc0242f58
	.word	0xbe86a0f0
	.word	0xeadfd000
	.word	0xc07422f0
	.word	0xfe4c2ec4
	.word	0x1000000
	.word	0xbe128000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xd45c20d0
	.word	0xcc76a078
	.word	0xc02aa2e3
	.word	0x1000000
	or	%g0, 0x718, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
thr6_MMU_ASI_PRIMARY_403:
	.word	0x87802080
	.word	0xdef2a0c8
thr6_MMU_ASI_BLK_P_404:
	.word	0x878020f0
	.word	0xc3b92c40
	.word	0x1000000
	.word	0xbe130000
	IDEMAP_PAGE
	DO_BRANCH
	.word	0x81c72000
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_BLK_S_405:
	.word	0x878020f1
	.word	0xe3bda280
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	ACCESS_DTSB_PTR
	IDEMAP_PCTX
	.word	0xc07424c0
	DDEMAP_NCTX
thr6_MMU_ASI_BLK_COMMIT_S_406:
	.word	0x878020e1
	.word	0xc3bc6980
	.word	0x1000000
	or	%g0, 0x083, %i7
	LOAD_IDATA_IN
	.word	0xc0342900
	.word	0x1000000
	or	%g0, 0x140, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa76a068
	.word	0xc025639c
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v008_exit:
	EXIT_GOOD
Thr6_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v106 DATA_VA=0x780000340000
attr_data {
	Name = .Thr6_User_Data_4v106 ,
	VA = 0x780000340000 ,/* 0x78000034ffc0 */
	RA = 0x0050950000 ,
	PA = 0x6850950000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000078000034033d 8000006850950041 */
	end_label   = Thr6_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v106_data_begin
Thr6_User_Data_4v106_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v009 TEXT_VA=0x7760001de000
attr_text {
	Name = .Thr6_User_Text_4v009 ,
	VA = 0x7760001de000 ,/* 0x7760001dffc0 */
	RA = 0x03c0008000 ,
	PA = 0x6fc0008000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007760001dec1b 8000006fc0008480 */
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
	.word	0xce776050
	.word	0xc02aacef
	.word	0x1000000
	.word	0xbe12c000
	IDEMAP_PAGE
	TOGGLE_LSU_IM
	.word	0xf45f60d0
	nop
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
	or	%g0, 0x148, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_IM
	.word	0xfe576688
	.word	0xce742020
	.word	0xc0256158
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xbe842118
	.word	0xc8dfd000
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	READ_IDATA_ACCESS
	.word	0xfcd89100
	.word	0xbe164000
	GOTO_SUPERVISOR1
	TOGGLE_LSU_DM
	.word	0xfe5eaa20
	.word	0x1000000
	or	%g0, 0x138, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x00a, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe140000
	IDEMAP_RPAGE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL
thr6_MMU_ASI_SECONDARY_407:
	.word	0x87802081
	.word	0xd4f46090
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc0376158
thr6_MMU_ASI_PRIMARY_408:
	.word	0x87802080
	.word	0xc8f560b8
	.word	0x1000000
	.word	0xbe128000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd65d6010
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v009_exit:
	EXIT_GOOD
Thr6_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v107 DATA_VA=0x790026800000
attr_data {
	Name = .Thr6_User_Data_4v107 ,
	VA = 0x790026800000 ,/* 0x790026bfffc0 */
	RA = 0x02b4400000 ,
	PA = 0x02b4400000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000079002680033d 80000002b4400043 */
	end_label   = Thr6_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v107_data_begin
Thr6_User_Data_4v107_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00a TEXT_VA=0x7760001b6000
attr_text {
	Name = .Thr6_User_Text_4v00a ,
	VA = 0x7760001b6000 ,/* 0x7760001b7fc0 */
	RA = 0x03c0176000 ,
	PA = 0x6fc0176000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007760001b6c1b 8000006fc0176480 */
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
thr6_MMU_ASI_BLK_SL_409:
	.word	0x878020f9
	.word	0xe3bc6980
	.word	0xfcda9000
thr6_MMU_ASI_PRIMARY_410:
	.word	0x87802080
	.word	0xc6f560d8
	.word	0xc02ea158
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcdc1000
	.word	0xdc776058
	.word	0xc02c2c1d
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_DM
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe8760d0
	.word	0xe0dfd000
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x00b, %i7
	LOAD_IDATA_IN
	.word	0xfe576f40
	.word	0xc0776158
thr6_MMU_ASI_PRIMARY_411:
	.word	0x87802080
	.word	0xfaf2a090
	.word	0xc024246c
	DDEMAP_SCTX
	nop
	nop
	.word	0xc85d60f0
	.word	0xfcda9000
	.word	0xe1991f00
	.word	0xfe4f6b77
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
thr6_MMU_ASI_PRIMARY_412:
	.word	0x87802080
	.word	0xf0f56050
thr6_MMU_ASI_PRIMARY_413:
	.word	0x87802080
	.word	0xe0bc23b0
	.word	0x1000000
	or	%g0, 0xb0, %i7
	DTLB_TAG_READ
	.word	0xbe82a110
	.word	0xc4dfd000
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x05b, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x5e8, %i7
	DTLB_TAG_READ
	.word	0xe05ea038
	.word	0xc45d6138
	DDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe158000
	DDEMAP_RPAGE
	DDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x08c, %i7
	LOAD_IDATA_IN
	.word	0xdc76a088
	.word	0xc0242a00
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_PAGE
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x441, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe12c000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x240, %i7
	DTLB_TAG_READ
	.word	0xfc9d5c40
	nop
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
	.word	0xf8742000
	.word	0xc036a9cc
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v00a_exit:
	EXIT_GOOD
Thr6_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v108 DATA_VA=0x780000910000
attr_data {
	Name = .Thr6_User_Data_4v108 ,
	VA = 0x780000910000 ,/* 0x78000091ffc0 */
	RA = 0x0050070000 ,
	PA = 0x6850070000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000078000091033d 8000006850070041 */
	end_label   = Thr6_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v108_data_begin
Thr6_User_Data_4v108_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00b TEXT_VA=0x790019800000
attr_text {
	Name = .Thr6_User_Text_4v00b ,
	VA = 0x790019800000 ,/* 0x790019bfffc0 */
	RA = 0x02b4800000 ,
	PA = 0x02b4800000 ,
	TTE_Context = 0x033d ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000079001980033d 80000002b4800483 */
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
	nop
	nop
	nop
	DDEMAP_PCTX
	.word	0xfe42a7e4
	nop
	nop
	nop
	nop
	.word	0xd676a098
	.word	0xc0356d6a
	.word	0x1000000
	or	%g0, 0x8, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe118000
	DDEMAP_PAGE
	.word	0xc4742090
	.word	0xc035697e
	ACCESS_ITSB_PTR
	.word	0xbe86a110
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
	nop
	nop
	nop
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x5b1, %i7
	LOAD_IDATA_ACCESS
thr6_MMU_ASI_PRIMARY_414:
	.word	0x87802080
	.word	0xc4f42090
	.word	0x1000000
	.word	0xbe108000
	DDEMAP_RPAGE
	IDEMAP_ALL
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x438, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x42c, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x178, %i7
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
	nop
	nop
	.word	0x1000000
	or	%g0, 0x14c, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
thr6_MMU_ASI_BLK_SL_415:
	.word	0x878020f9
	.word	0xe1b96180
	.word	0xce7560a8
	.word	0xc022ab38
	.word	0x1000000
	or	%g0, 0x2a0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xd0, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0xc076ac38
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_LITTLE_416:
	.word	0x87802088
	.word	0xdef2a080
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	IDEMAP_ALL_PAGES
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd470a090
	.word	0xc036a188
	TOGGLE_LSU_IM
	IDEMAP_ALL
	ACCESS_DTSB_PTR
	.word	0xfe5eadb8
	nop
	nop
thr6_MMU_ASI_PRIMARY_417:
	.word	0x87802080
	.word	0xd0f2a088
	.word	0xfe456b08
	.word	0xbe82a038
	.word	0xd4dfd000
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe100000
	IDEMAP_PAGE
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe412e94
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v00b_exit:
	EXIT_GOOD
Thr6_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v109 DATA_VA=0x7760001e6000
attr_data {
	Name = .Thr6_User_Data_4v109 ,
	VA = 0x7760001e6000 ,/* 0x7760001e7fc0 */
	RA = 0x03c0024000 ,
	PA = 0x6fc0024000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007760001e6c1b 8000006fc0024040 */
	end_label   = Thr6_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v109_data_begin
Thr6_User_Data_4v109_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10a DATA_VA=0x7a0610000000
attr_data {
	Name = .Thr6_User_Data_4v10a ,
	VA = 0x7a0610000000 ,/* 0x7a061fffffc0 */
	RA = 0x00d0000000 ,
	PA = 0x6cd0000000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007a061000033d 8000006cd0000045 */
	end_label   = Thr6_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10a_data_begin
Thr6_User_Data_4v10a_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10b DATA_VA=0x780000da0000
attr_data {
	Name = .Thr6_User_Data_4v10b ,
	VA = 0x780000da0000 ,/* 0x780000daffc0 */
	RA = 0x0050910000 ,
	PA = 0x6850910000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000da033d 8000006850910041 */
	end_label   = Thr6_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10b_data_begin
Thr6_User_Data_4v10b_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10c DATA_VA=0x77600001c000
attr_data {
	Name = .Thr6_User_Data_4v10c ,
	VA = 0x77600001c000 ,/* 0x77600001dfc0 */
	RA = 0x03c00ee000 ,
	PA = 0x6fc00ee000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077600001cc1b 8000006fc00ee040 */
	end_label   = Thr6_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10c_data_begin
Thr6_User_Data_4v10c_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10d DATA_VA=0x780000570000
attr_data {
	Name = .Thr6_User_Data_4v10d ,
	VA = 0x780000570000 ,/* 0x78000057ffc0 */
	RA = 0x0050ed0000 ,
	PA = 0x6850ed0000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000078000057033d 8000006850ed0041 */
	end_label   = Thr6_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10d_data_begin
Thr6_User_Data_4v10d_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10e DATA_VA=0x7760001c8000
attr_data {
	Name = .Thr6_User_Data_4v10e ,
	VA = 0x7760001c8000 ,/* 0x7760001c9fc0 */
	RA = 0x03c00fc000 ,
	PA = 0x6fc00fc000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007760001c8c1b 8000006fc00fc040 */
	end_label   = Thr6_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10e_data_begin
Thr6_User_Data_4v10e_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10f DATA_VA=0x7800000a0000
attr_data {
	Name = .Thr6_User_Data_4v10f ,
	VA = 0x7800000a0000 ,/* 0x7800000affc0 */
	RA = 0x0050da0000 ,
	PA = 0x6850da0000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007800000a033d 8000006850da0041 */
	end_label   = Thr6_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10f_data_begin
Thr6_User_Data_4v10f_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v110 DATA_VA=0x79001e800000
attr_data {
	Name = .Thr6_User_Data_4v110 ,
	VA = 0x79001e800000 ,/* 0x79001ebfffc0 */
	RA = 0x02b5000000 ,
	PA = 0x02b5000000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000079001e80033d 80000002b5000043 */
	end_label   = Thr6_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v110_data_begin
Thr6_User_Data_4v110_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v111 DATA_VA=0x7760001d0000
attr_data {
	Name = .Thr6_User_Data_4v111 ,
	VA = 0x7760001d0000 ,/* 0x7760001d1fc0 */
	RA = 0x03c01ce000 ,
	PA = 0x6fc01ce000 ,
	TTE_Context = 0x033d ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007760001d0c1b 8000006fc01ce040 */
	end_label   = Thr6_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v111_data_begin
Thr6_User_Data_4v111_data_begin:
	.xword	0x77600005c000
	.xword	0x776000198000
	.xword	0x77600016e000
	.xword	0x776000148000
	.xword	0x780000a70000
	.xword	0x77600013e000
	.xword	0x79002cc00000
	.xword	0x77600006a000
	.xword	0x776000170000
	.xword	0x7760001a6000
	.xword	0x776000100000
	.xword	0x780000680000
	.xword	0x79001dc00000
	.xword	0x79001e400000
	.xword	0x790018800000
	.xword	0x780000e70000
	.xword	0x790022800000
	.xword	0x780000550000
	.xword	0x776000172000
	.xword	0x780000410000
	.xword	0x780000900000
	.xword	0x780000490000
	.xword	0x790011800000
	.xword	0x776000118000
	.xword	0x780000090000
	.xword	0x7800007a0000
	.xword	0x780000060000
	.xword	0x7760000cc000
	.xword	0x780000340000
	.xword	0x7760001de000
	.xword	0x790026800000
	.xword	0x7760001b6000
	.xword	0x780000910000
	.xword	0x790019800000
	.xword	0x7760001e6000
	.xword	0x7a0610000000
	.xword	0x780000da0000
	.xword	0x77600001c000
	.xword	0x780000570000
	.xword	0x7760001c8000
	.xword	0x7800000a0000
	.xword	0x79001e800000
	.xword	0x7760001d0000
Thr6_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x7b70001e4000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	VA = 0x7b70001e4000 ,/* 0x7b70001e5fc0 */
	RA = 0x03d01ae000 ,
	PA = 0x03d01ae000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b70001e5c11 80000003d01ae480 */
	end_label   = Thr7_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr7_user_code_entry
Thr7_user_code_entry:
	setx	0x7b70001e0000, %g1, %g2
	or	%g0, 16, %g1
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
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x0, %i7
	READ_IDATA_ACCESS
	.word	0xbe8760f0
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe4425f8
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x488, %i7
	ITLB_TAG_READ
	.word	0xc02c25c1
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_RPAGES
	.word	0xf6712048
	.word	0xc0312332
	.word	0xc19c1e00
	.word	0xc39d5f00
	DDEMAP_ALL
	.word	0xd85f6048
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x096, %i7
	LOAD_DDATA_IN
	IDEMAP_NCTX
	DDEMAP_ALL_PAGES
	.word	0xce776030
	.word	0xc0766da0
	.word	0xbe80a038
	.word	0xd4dfd000
thr7_MMU_ASI_PRIMARY_418:
	.word	0x87802080
	.word	0xdaf42030
	.word	0x1000000
	or	%g0, 0x140, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe812090
	.word	0xeadfd000
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xd85aa018
	nop
	nop
	nop
	nop
	.word	0xfc9e9120
thr7_MMU_ASI_PRIMARY_419:
	.word	0x87802080
	.word	0xe4f760c0
thr7_MMU_ASI_PRIMARY_420:
	.word	0x87802080
	.word	0xd4f560b0
	.word	0x1000000
	or	%g0, 0x23e, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xde72a0a8
	.word	0xc0276d50
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	ITLB_TAG_READ
	.word	0xbe866150
	.word	0xf2dfd000
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x095, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x061, %i7
	LOAD_IDATA_IN
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5aa378
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v000_exit:
	EXIT_GOOD
Thr7_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v100 DATA_VA=0x7b70001e0000
attr_data {
	Name = .Thr7_User_Data_4v100 ,
	VA = 0x7b70001e0000 ,/* 0x7b70001e1fc0 */
	RA = 0x03d000a000 ,
	PA = 0x03d000a000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b70001e1c11 80000003d000a440 */
	end_label   = Thr7_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v100_data_begin
Thr7_User_Data_4v100_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v200 DATA_VA=0x7d0016800000
attr_data {
	Name = .Thr7_User_Data_4v200 ,
	VA = 0x7d0016800000 ,/* 0x7d0016bfffc0 */
	RA = 0x02c5400000 ,
	PA = 0x7ec5400000 ,
	TTE_Context = 0x0df9 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007d0016800e71 8000007ec5400443 */
	end_label   = Thr7_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v200_data_begin
Thr7_User_Data_4v200_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v300 DATA_VA=0x7c0000bc0000
attr_data {
	Name = .Thr7_User_Data_4v300 ,
	VA = 0x7c0000bc0000 ,/* 0x7c0000bcffc0 */
	RA = 0x00606c0000 ,
	PA = 0x00606c0000 ,
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
	/* DTTE_TAG_DATA = 00007c0000bc0000 80000000606c0041 */
	end_label   = Thr7_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v300_data_begin
Thr7_User_Data_4v300_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v001 TEXT_VA=0x7c00000d0000
attr_text {
	Name = .Thr7_User_Text_4v001 ,
	VA = 0x7c00000d0000 ,/* 0x7c00000dffc0 */
	RA = 0x00604c0000 ,
	PA = 0x78604c0000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c00000d1c11 80000078604c0481 */
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
	DDEMAP_ALL_RPAGES
	.word	0xf07420d8
	.word	0xc02f6ad9
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x4d7, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0xa0, %i7
	ITLB_TAG_READ
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x023, %i7
	LOAD_DDATA_IN
	.word	0xfe442998
	.word	0xfe442104
	.word	0xfe5e6cf0
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xd45f6140
	.word	0xbe120000
	GOTO_SUPERVISOR1
thr7_MMU_ASI_BLK_PL_421:
	.word	0x878020f8
	.word	0xe3bc2cc0
	TOGGLE_LSU_IM
	nop
	.word	0xc45d60b0
	.word	0xfcda9000
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
	nop
	nop
	nop
	nop
	nop
	.word	0xf25aa0b0
	.word	0xc02aa42a
	TOGGLE_LSU_IM
	.word	0xf4776010
	.word	0xc0766dc0
	IDEMAP_PCTX
	.word	0xc037689c
	.word	0x1000000
	or	%g0, 0x060, %i7
	LOAD_DDATA_IN
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_RPAGES
	.word	0xcc5c2048
	DDEMAP_PCTX
	TOGGLE_LSU_DM
	DDEMAP_SCTX
thr7_MMU_ASI_PRIMARY_422:
	.word	0x87802080
	.word	0xf2f76008
	.word	0xd45e6090
	.word	0x1000000
	or	%g0, 0x248, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe138000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr7_MMU_ASI_PRIMARY_423:
	.word	0x87802080
	.word	0xccf560a0
	.word	0x1000000
	or	%g0, 0x002, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc0242a34
	.word	0xfe4c27f5
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_RPAGES
	.word	0xea592160
	.word	0x1000000
	.word	0xbe164000
	DDEMAP_RPAGE
	ACCESS_DTSB_PTR
	.word	0xc0342c48
	.word	0x1000000
	or	%g0, 0x0b1, %i7
	LOAD_DDATA_IN
	.word	0xc0356a78
	TOGGLE_LSU_IM
	.word	0xfcda9000
	.word	0xc8756038
	.word	0xc02aa334
	nop
	.word	0xe05f6130
	.word	0xc02aa576
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe5aae78
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v001_exit:
	EXIT_GOOD
Thr7_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v400 TEXT_VA=0x7c0000fc0000
attr_text {
	Name = .Thr7_User_Text_4v400 ,
	VA = 0x7c0000fc0000 ,/* 0x7c0000fcffc0 */
	RA = 0x00605d0000 ,
	PA = 0x00605d0000 ,
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
	/* ITTE_TAG_DATA = 00007c0000fc0000 80000000605d0481 */
	end_label   = Thr7_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v400_text_begin
Thr7_User_Text_4v400_text_begin:
	wrpr	0, %gl
thr7_MMU_ASI_PRIMARY_LITTLE_424:
	.word	0x87802088
	.word	0xd2f420e8
	.word	0xea5ee068
thr7_MMU_ASI_AS_IF_USER_PRIMARY_425:
	.word	0x87802010
	.word	0xdcf2a028
	.word	0xbe842130
	.word	0xeadfd000
	.word	0xfcdf5000
	.word	0xfc9984e0
	.word	0xc85ca100
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_REAL_MEM_426:
	.word	0x87802014
	.word	0xccf0e018
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc1991f00
	.word	0xfe41a4dc
	.word	0xbe82a0d0
	.word	0xe0dfd000
	.word	0xfcdf4200
	P_DDEMAP_ALL_RPAGES
	.word	0xbe812130
	.word	0xd4dfd000
thr7_MMU_ASI_BLK_SL_427:
	.word	0x878020f9
	.word	0xc3bae780
	.word	0x1000000
	or	%g0, 0x147, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x578, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe856160
	.word	0xf2dfc200
	.word	0x1000000
	or	%g0, 0x690, %i7
	P_READ_DDATA_ACCESS
	.word	0xfcdc0200
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x013, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x710, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xf25b2068
	.word	0x1000000
	.word	0xbe120000
	P_DDEMAP_PAGE
	P_TOGGLE_LSU_IM
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v400_exit:
	EXIT_GOOD
Thr7_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v002 TEXT_VA=0x7c0000c40000
attr_text {
	Name = .Thr7_User_Text_4v002 ,
	VA = 0x7c0000c40000 ,/* 0x7c0000c4ffc0 */
	RA = 0x00602e0000 ,
	PA = 0x78602e0000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000c41c11 80000078602e0481 */
	end_label   = Thr7_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v002_text_begin
Thr7_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x158, %i7
	P_READ_IDATA_ACCESS
	P_DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a0e0
	.word	0xc4dfc200
	.word	0xbe82a090
	.word	0xc8dfd000
	nop
thr7_MMU_ASI_PRIMARY_428:
	.word	0x87802080
	.word	0xeaf560f0
	.word	0x1000000
	or	%g0, 0x400, %i7
	P_ITLB_TAG_READ
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe164000
	P_IDEMAP_RPAGE
	.word	0xfe542e76
thr7_MMU_ASI_PRIMARY_429:
	.word	0x87802080
	.word	0xeaf660b0
	P_DDEMAP_PCTX
	.word	0xfe576134
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	P_READ_DDATA_ACCESS
	P_ACCESS_DTSB_PTR
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr7_MMU_ASI_AS_IF_USER_PRIMARY_430:
	.word	0x87802010
	.word	0xe0f42090
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x3a0, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x590, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr7_User_Text_4v002_exit:
	EXIT_GOOD
Thr7_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v101 DATA_VA=0x7b7000056000
attr_data {
	Name = .Thr7_User_Data_4v101 ,
	VA = 0x7b7000056000 ,/* 0x7b7000057fc0 */
	RA = 0x03d0012000 ,
	PA = 0x03d0012000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b7000057c11 80000003d0012440 */
	end_label   = Thr7_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v101_data_begin
Thr7_User_Data_4v101_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v201 DATA_VA=0x7b7000040000
attr_data {
	Name = .Thr7_User_Data_4v201 ,
	VA = 0x7b7000040000 ,/* 0x7b7000041fc0 */
	RA = 0x03d000c000 ,
	PA = 0x03d000c000 ,
	TTE_Context = 0x0df9 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007b7000040e71 80000003d000c440 */
	end_label   = Thr7_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v201_data_begin
Thr7_User_Data_4v201_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v301 DATA_VA=0x7c0000a80000
attr_data {
	Name = .Thr7_User_Data_4v301 ,
	VA = 0x7c0000a80000 ,/* 0x7c0000a8ffc0 */
	RA = 0x0060780000 ,
	PA = 0x0060780000 ,
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
	/* DTTE_TAG_DATA = 00007c0000a80000 8000000060780041 */
	end_label   = Thr7_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v301_data_begin
Thr7_User_Data_4v301_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v003 TEXT_VA=0x7d0036400000
attr_text {
	Name = .Thr7_User_Text_4v003 ,
	VA = 0x7d0036400000 ,/* 0x7d00367fffc0 */
	RA = 0x02c5800000 ,
	PA = 0x7ec5800000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007d0036401c11 8000007ec5800483 */
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
	DDEMAP_ALL
	.word	0xc02666cc
	.word	0xfc9f5d40
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x60, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x90, %i7
	ITLB_TAG_READ
	nop
	ACCESS_ITSB_PTR
thr7_MMU_ASI_PRIMARY_431:
	.word	0x87802080
	.word	0xe4f2a018
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	TOGGLE_LSU_DM
	.word	0xd45c20f0
	.word	0x1000000
	or	%g0, 0x1d2, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x08c, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL
	nop
	DDEMAP_SCTX
	IDEMAP_NCTX
	.word	0xbe120000
	GOTO_SUPERVISOR1
	IDEMAP_NCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0256bf0
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v003_exit:
	EXIT_GOOD
Thr7_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v401 TEXT_VA=0x7b70001a8000
attr_text {
	Name = .Thr7_User_Text_4v401 ,
	VA = 0x7b70001a8000 ,/* 0x7b70001a9fc0 */
	RA = 0x03d0046000 ,
	PA = 0x7fd0046000 ,
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
	/* ITTE_TAG_DATA = 00007b70001a8000 8000007fd0046480 */
	end_label   = Thr7_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v401_text_begin
Thr7_User_Text_4v401_text_begin:
	wrpr	0, %gl
	P_DDEMAP_NCTX
	.word	0xfe432784
	P_IDEMAP_NCTX
	P_IDEMAP_NCTX
thr7_MMU_ASI_AS_IF_USER_PRIMARY_432:
	.word	0x87802010
	.word	0xc4f66110
	.word	0xc024a250
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe120000
	P_IDEMAP_RPAGE
	.word	0xfcde9120
thr7_MMU_ASI_PRIMARY_433:
	.word	0x87802080
	.word	0xc8bf6c50
	.word	0xc0732f68
	.word	0xc0232694
thr7_MMU_ASI_AS_IF_USER_PRIMARY_434:
	.word	0x87802010
	.word	0xc4f56090
	.word	0x1000000
	or	%g0, 0x0a9, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x7f0, %i7
	P_READ_DDATA_ACCESS
	P_DDEMAP_ALL
	.word	0xbe842038
	.word	0xeadfc200
	nop
	nop
	nop
	nop
	.word	0xfe4325fc
	.word	0x1000000
	or	%g0, 0x12c, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_BLK_SL_435:
	.word	0x878020f9
	.word	0xe3b96380
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x110, %i7
	P_ITLB_TAG_READ
	.word	0xbe876068
	.word	0xe0dfc200
	P_DDEMAP_PCTX
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
	or	%g0, 0x01b, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x76e, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x067, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_RPAGES
	P_IDEMAP_ALL_PAGES
	.word	0xc033277a
	P_TOGGLE_LSU_DM
	.word	0xfc998580
	.word	0xfe53263e
	.word	0x1000000
	or	%g0, 0x400, %i7
	P_ITLB_TAG_READ
	nop
	nop
	nop
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v401_exit:
	EXIT_GOOD
Thr7_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v004 TEXT_VA=0x7c0000f30000
attr_text {
	Name = .Thr7_User_Text_4v004 ,
	VA = 0x7c0000f30000 ,/* 0x7c0000f3ffc0 */
	RA = 0x0060960000 ,
	PA = 0x7860960000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000f31c11 8000007860960481 */
	end_label   = Thr7_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v004_text_begin
Thr7_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xbe8420d0
	.word	0xe0dfd000
thr7_MMU_ASI_PRIMARY_436:
	.word	0x87802080
	.word	0xf0f76030
	nop
	nop
	.word	0xc0756278
	P_DDEMAP_PCTX
	.word	0xbe842068
	.word	0xeadfd000
	.word	0xc02565e0
	.word	0xc02d6434
	.word	0x1000000
	.word	0xbe110000
	P_DDEMAP_PAGE
	P_IDEMAP_ALL
	P_TOGGLE_LSU_IM
	.word	0xc47420d0
	.word	0xc0776b88
	.word	0xfe5aa738
	.word	0x1000000
	or	%g0, 0x434, %i7
	P_LOAD_DDATA_ACCESS
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x073, %i7
	P_LOAD_IDATA_IN
	.word	0xe8756028
	.word	0xc02c2af2
thr7_MMU_ASI_PRIMARY_437:
	.word	0x87802080
	.word	0xd8f420c0
	.word	0xbe856068
	.word	0xfadfc200
	P_IDEMAP_ALL_RPAGES
	P_IDEMAP_NCTX
	.word	0xfcd88200
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
	nop
	nop
	nop
	P_IDEMAP_NCTX
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
	or	%g0, 0x558, %i7
	P_READ_IDATA_ACCESS
	.word	0xfe4d68bf
	.word	0xfc9c1c40
	.word	0xbe82a008
	.word	0xd4dfc200
	.word	0x1000000
	.word	0xbe11c000
	P_DDEMAP_RPAGE
	.word	0xe872a028
	.word	0xc0776ed8
	P_IDEMAP_ALL
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr7_User_Text_4v004_exit:
	EXIT_GOOD
Thr7_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v102 DATA_VA=0x7b7000050000
attr_data {
	Name = .Thr7_User_Data_4v102 ,
	VA = 0x7b7000050000 ,/* 0x7b7000051fc0 */
	RA = 0x03d01d4000 ,
	PA = 0x03d01d4000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b7000051c11 80000003d01d4440 */
	end_label   = Thr7_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v102_data_begin
Thr7_User_Data_4v102_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v202 DATA_VA=0x7b70001e8000
attr_data {
	Name = .Thr7_User_Data_4v202 ,
	VA = 0x7b70001e8000 ,/* 0x7b70001e9fc0 */
	RA = 0x03d010a000 ,
	PA = 0x03d010a000 ,
	TTE_Context = 0x0df9 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007b70001e8e71 80000003d010a440 */
	end_label   = Thr7_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v202_data_begin
Thr7_User_Data_4v202_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v302 DATA_VA=0x7b700008e000
attr_data {
	Name = .Thr7_User_Data_4v302 ,
	VA = 0x7b700008e000 ,/* 0x7b700008ffc0 */
	RA = 0x03d004a000 ,
	PA = 0x7fd004a000 ,
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
	/* DTTE_TAG_DATA = 00007b700008e000 8000007fd004a040 */
	end_label   = Thr7_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v302_data_begin
Thr7_User_Data_4v302_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v005 TEXT_VA=0x7b7000096000
attr_text {
	Name = .Thr7_User_Text_4v005 ,
	VA = 0x7b7000096000 ,/* 0x7b7000097fc0 */
	RA = 0x03d005e000 ,
	PA = 0x03d005e000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b7000097c11 80000003d005e480 */
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
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_PRIMARY_438:
	.word	0x87802080
	.word	0xc6f2a0f8
	.word	0x1000000
	.word	0xbe138000
	IDEMAP_RPAGE
	.word	0xd4742150
	.word	0xc0276868
	ACCESS_DTSB_PTR
	.word	0xc6742080
	.word	0xc0342d14
	.word	0xc472a090
	.word	0xc072ade0
thr7_MMU_ASI_PRIMARY_439:
	.word	0x87802080
	.word	0xdaf120a8
	.word	0xfe42aed4
	.word	0xfcde5000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x110, %i7
	ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe110000
	IDEMAP_PAGE
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xbe82e010
	.word	0xc19fde20
	.word	0x1000000
	or	%g0, 0x3e, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_ALL_PAGES
	IDEMAP_ALL
	.word	0xd0776028
	.word	0xc0256fa0
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x2f, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	IDEMAP_ALL
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd85c2018
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v005_exit:
	EXIT_GOOD
Thr7_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v402 TEXT_VA=0x7c0000b20000
attr_text {
	Name = .Thr7_User_Text_4v402 ,
	VA = 0x7c0000b20000 ,/* 0x7c0000b2ffc0 */
	RA = 0x0060170000 ,
	PA = 0x0060170000 ,
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
	/* ITTE_TAG_DATA = 00007c0000b20000 8000000060170481 */
	end_label   = Thr7_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v402_text_begin
Thr7_User_Text_4v402_text_begin:
	wrpr	0, %gl
	P_IDEMAP_NCTX
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
	P_IDEMAP_ALL
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0xb, %i7
	P_LOAD_IDATA_ACCESS
	P_IDEMAP_ALL
	.word	0xbe812038
	.word	0xfadfd000
	.word	0xfe45e880
	.word	0x1000000
	or	%g0, 0x082, %i7
	P_LOAD_IDATA_IN
	.word	0xfcdf43a0
	.word	0x1000000
	or	%g0, 0x198, %i7
	P_READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe41af10
	.word	0xfcdd4200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_PCTX
	.word	0xc85de0e0
	.word	0x1000000
	or	%g0, 0x120, %i7
	P_ITLB_TAG_READ
	P_DDEMAP_NCTX
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
	nop
	nop
	nop
	nop
	.word	0xfcde5000
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v402_exit:
	EXIT_GOOD
Thr7_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v103 DATA_VA=0x7b70001ae000
attr_data {
	Name = .Thr7_User_Data_4v103 ,
	VA = 0x7b70001ae000 ,/* 0x7b70001affc0 */
	RA = 0x03d00b8000 ,
	PA = 0x03d00b8000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b70001afc11 80000003d00b8440 */
	end_label   = Thr7_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v103_data_begin
Thr7_User_Data_4v103_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v203 DATA_VA=0x7b70000f6000
attr_data {
	Name = .Thr7_User_Data_4v203 ,
	VA = 0x7b70000f6000 ,/* 0x7b70000f7fc0 */
	RA = 0x03d0126000 ,
	PA = 0x03d0126000 ,
	TTE_Context = 0x0df9 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007b70000f6e71 80000003d0126440 */
	end_label   = Thr7_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v203_data_begin
Thr7_User_Data_4v203_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v303 DATA_VA=0x7c0000f40000
attr_data {
	Name = .Thr7_User_Data_4v303 ,
	VA = 0x7c0000f40000 ,/* 0x7c0000f4ffc0 */
	RA = 0x0060900000 ,
	PA = 0x0060900000 ,
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
	/* DTTE_TAG_DATA = 00007c0000f40000 8000000060900041 */
	end_label   = Thr7_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v303_data_begin
Thr7_User_Data_4v303_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v006 TEXT_VA=0x7c0000800000
attr_text {
	Name = .Thr7_User_Text_4v006 ,
	VA = 0x7c0000800000 ,/* 0x7c000080ffc0 */
	RA = 0x0060450000 ,
	PA = 0x7860450000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000801c11 8000007860450481 */
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
	.word	0x1000000
	or	%g0, 0x8, %i7
	READ_IDATA_ACCESS
	.word	0xf25f6110
	.word	0xf45c2070
	.word	0xfe4663f8
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xe05e6150
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc032abac
	.word	0x1000000
	or	%g0, 0x56a, %i7
	LOAD_IDATA_ACCESS
thr7_MMU_ASI_PRIMARY_440:
	.word	0x87802080
	.word	0xe2f66010
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfcdd5000
	.word	0x1000000
	or	%g0, 0x720, %i7
	LOAD_DDATA_ACCESS
	.word	0xc0356170
	.word	0xf65aa0a0
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
	or	%g0, 0x7d8, %i7
	DTLB_TAG_READ
	IDEMAP_ALL_PAGES
thr7_MMU_ASI_PRIMARY_LITTLE_441:
	.word	0x87802088
	.word	0xf6f2a018
	.word	0xf872a128
	.word	0xc02e6dd2
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0xd45f6008
	.word	0xec72a010
	.word	0xc02c2fee
	.word	0xfcdc1000
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa5c20b0
	DDEMAP_SCTX
	ACCESS_ITSB_PTR
	.word	0xec742010
	.word	0xc032a828
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe2756040
	.word	0xc02d6b7a
	.word	0x1000000
	or	%g0, 0x580, %i7
	DTLB_TAG_READ
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x595, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	IDEMAP_PCTX
	.word	0xc072ab60
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4f6f9f
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v006_exit:
	EXIT_GOOD
Thr7_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v104 DATA_VA=0x7b70000e0000
attr_data {
	Name = .Thr7_User_Data_4v104 ,
	VA = 0x7b70000e0000 ,/* 0x7b70000e1fc0 */
	RA = 0x03d009c000 ,
	PA = 0x03d009c000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b70000e1c11 80000003d009c440 */
	end_label   = Thr7_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v104_data_begin
Thr7_User_Data_4v104_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v204 DATA_VA=0x7c0000bd0000
attr_data {
	Name = .Thr7_User_Data_4v204 ,
	VA = 0x7c0000bd0000 ,/* 0x7c0000bdffc0 */
	RA = 0x0060d60000 ,
	PA = 0x7860d60000 ,
	TTE_Context = 0x0df9 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007c0000bd0e71 8000007860d60441 */
	end_label   = Thr7_User_Data_4v204_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v204_data_begin
Thr7_User_Data_4v204_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v204_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v304 DATA_VA=0x7b7000090000
attr_data {
	Name = .Thr7_User_Data_4v304 ,
	VA = 0x7b7000090000 ,/* 0x7b7000091fc0 */
	RA = 0x03d0158000 ,
	PA = 0x7fd0158000 ,
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
	/* DTTE_TAG_DATA = 00007b7000090000 8000007fd0158040 */
	end_label   = Thr7_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v304_data_begin
Thr7_User_Data_4v304_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v007 TEXT_VA=0x7c0000f50000
attr_text {
	Name = .Thr7_User_Text_4v007 ,
	VA = 0x7c0000f50000 ,/* 0x7c0000f5ffc0 */
	RA = 0x0060ef0000 ,
	PA = 0x7860ef0000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000f51c11 8000007860ef0481 */
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
	or	%g0, 0x568, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x258, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe140000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x044, %i7
	LOAD_DDATA_IN
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x138, %i7
	DTLB_TAG_READ
	.word	0xfcd95120
	.word	0x1000000
	or	%g0, 0x6b0, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xbe82e010
	.word	0xc19fde20
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe866110
	.word	0xeadfd000
	.word	0x1000000
	or	%g0, 0x70, %i7
	READ_IDATA_ACCESS
thr7_MMU_ASI_BLK_P_442:
	.word	0x878020f0
	.word	0xe1b92180
	.word	0x1000000
	or	%g0, 0x690, %i7
	DTLB_TAG_READ
	.word	0xc02565ec
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x3e8, %i7
	DTLB_TAG_READ
	.word	0xf6742078
	.word	0xc0256304
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
thr7_MMU_ASI_PRIMARY_443:
	.word	0x87802080
	.word	0xc4f56008
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_RPAGES
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0xf45e6040
	.word	0xfcdd5000
	.word	0xe672a080
	.word	0xc02c2210
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL
	.word	0xc02e6170
	.word	0xe27760b8
	.word	0xc0256e18
	.word	0xfe566606
	nop
	nop
	.word	0xfa5e6110
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr7_MMU_ASI_PRIMARY_444:
	.word	0x87802080
	.word	0xe0f42130
	.word	0xfe4c236a
	.word	0xbe82e040
	.word	0xe2dfd020
thr7_MMU_ASI_PRIMARY_LITTLE_445:
	.word	0x87802088
	.word	0xecf760b8
	nop
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc032ad7c
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v007_exit:
	EXIT_GOOD
Thr7_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v105 DATA_VA=0x7b7000192000
attr_data {
	Name = .Thr7_User_Data_4v105 ,
	VA = 0x7b7000192000 ,/* 0x7b7000193fc0 */
	RA = 0x03d00ba000 ,
	PA = 0x03d00ba000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b7000193c11 80000003d00ba440 */
	end_label   = Thr7_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v105_data_begin
Thr7_User_Data_4v105_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v008 TEXT_VA=0x7c0000a90000
attr_text {
	Name = .Thr7_User_Text_4v008 ,
	VA = 0x7c0000a90000 ,/* 0x7c0000a9ffc0 */
	RA = 0x0060240000 ,
	PA = 0x7860240000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000a91c11 8000007860240481 */
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
	nop
	nop
	nop
	.word	0xc872a0d0
	.word	0xc0766f38
thr7_MMU_ASI_BLK_COMMIT_P_446:
	.word	0x878020e0
	.word	0xc1bf6e80
	.word	0x1000000
	.word	0xbe118000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	IDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe842008
	.word	0xc8dfd000
	.word	0xbe8660b0
	.word	0xeadfd000
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_PRIMARY_447:
	.word	0x87802080
	.word	0xe6f56148
	.word	0xd2712030
	.word	0xc07564a8
	DDEMAP_SCTX
	DDEMAP_ALL_PAGES
	.word	0xfe5f6df0
	.word	0xea766038
	.word	0xc02e6170
	.word	0xfa5f6150
	.word	0xfcda9000
	.word	0x1000000
	.word	0xbe150000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x440, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xfe5563a4
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xbe812120
	.word	0xc4dfd000
	.word	0x1000000
	.word	0xbe110000
	IDEMAP_PAGE
thr7_MMU_ASI_PRIMARY_448:
	.word	0x87802080
	.word	0xe6f2a0a8
thr7_MMU_ASI_BLK_P_449:
	.word	0x878020f0
	.word	0xe3be6540
	.word	0xdc756058
	.word	0xc0742560
	.word	0xbe80a140
	.word	0xd4dfd000
	.word	0xc1991f00
	.word	0xc032a746
	.word	0xc0356e7e
	.word	0x1000000
	or	%g0, 0x03d, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe134000
	DDEMAP_RPAGE
	.word	0xfcdf5000
	.word	0xfc995c60
	.word	0x1000000
	or	%g0, 0x62, %i7
	LOAD_IDATA_ACCESS
thr7_MMU_ASI_PRIMARY_450:
	.word	0x87802080
	.word	0xdef2a050
	.word	0x1000000
	or	%g0, 0x4d8, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcdc1000
	DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf25e6140
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_PAGE
	ACCESS_DTSB_PTR
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc072a5d8
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v008_exit:
	EXIT_GOOD
Thr7_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v106 DATA_VA=0x7c00000f0000
attr_data {
	Name = .Thr7_User_Data_4v106 ,
	VA = 0x7c00000f0000 ,/* 0x7c00000fffc0 */
	RA = 0x0060840000 ,
	PA = 0x7860840000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00000f1c11 8000007860840441 */
	end_label   = Thr7_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v106_data_begin
Thr7_User_Data_4v106_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v009 TEXT_VA=0x7b7000092000
attr_text {
	Name = .Thr7_User_Text_4v009 ,
	VA = 0x7b7000092000 ,/* 0x7b7000093fc0 */
	RA = 0x03d00fe000 ,
	PA = 0x03d00fe000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b7000093c11 80000003d00fe480 */
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
	or	%g0, 0x1d5, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	DDEMAP_ALL
	.word	0xfe5f6518
thr7_MMU_ASI_PRIMARY_451:
	.word	0x87802080
	.word	0xd4f420e0
	.word	0x1000000
	or	%g0, 0x09d, %i7
	LOAD_IDATA_IN
	.word	0xc022ae00
thr7_MMU_ASI_SECONDARY_452:
	.word	0x87802081
	.word	0xecf16010
	.word	0xbe866030
	.word	0xc39fde00
	.word	0xbe846070
	.word	0xcadfd020
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdd5000
thr7_MMU_ASI_SECONDARY_LITTLE_453:
	.word	0x87802089
	.word	0xf2f5a160
	.word	0xea5c2038
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
	or	%g0, 0x245, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe466d88
	ACCESS_ITSB_PTR
	.word	0xe272a098
	.word	0xc0756480
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	READ_IDATA_ACCESS
	.word	0xfcdf5000
	.word	0xbe82a100
	.word	0xeadfd000
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x733, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xfe4f6ab2
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v009_exit:
	EXIT_GOOD
Thr7_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v107 DATA_VA=0x7b7000174000
attr_data {
	Name = .Thr7_User_Data_4v107 ,
	VA = 0x7b7000174000 ,/* 0x7b7000175fc0 */
	RA = 0x03d01d0000 ,
	PA = 0x03d01d0000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b7000175c11 80000003d01d0440 */
	end_label   = Thr7_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v107_data_begin
Thr7_User_Data_4v107_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00a TEXT_VA=0x7c0000630000
attr_text {
	Name = .Thr7_User_Text_4v00a ,
	VA = 0x7c0000630000 ,/* 0x7c000063ffc0 */
	RA = 0x0060670000 ,
	PA = 0x7860670000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000631c11 8000007860670481 */
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
	DDEMAP_ALL_RPAGES
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x240, %i7
	READ_DDATA_ACCESS
thr7_MMU_ASI_PRIMARY_454:
	.word	0x87802080
	.word	0xf8f660d8
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xcc72a048
	.word	0xc07669a0
	.word	0xfc9c5120
	.word	0xfcdd5000
	.word	0x1000000
	or	%g0, 0x087, %i7
	LOAD_IDATA_IN
	.word	0xd45f6100
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x08d, %i7
	LOAD_IDATA_IN
	.word	0xfcdd5000
	.word	0x1000000
	or	%g0, 0x44d, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0xfe576c7e
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x06e, %i7
	LOAD_DDATA_IN
	.word	0xfcde5000
	.word	0xc3995f20
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0756170
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v00a_exit:
	EXIT_GOOD
Thr7_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v108 DATA_VA=0x7b7000194000
attr_data {
	Name = .Thr7_User_Data_4v108 ,
	VA = 0x7b7000194000 ,/* 0x7b7000195fc0 */
	RA = 0x03d0178000 ,
	PA = 0x03d0178000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b7000195c11 80000003d0178440 */
	end_label   = Thr7_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v108_data_begin
Thr7_User_Data_4v108_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00b TEXT_VA=0x7b7000052000
attr_text {
	Name = .Thr7_User_Text_4v00b ,
	VA = 0x7b7000052000 ,/* 0x7b7000053fc0 */
	RA = 0x03d00be000 ,
	PA = 0x03d00be000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b7000053c11 80000003d00be480 */
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
	nop
	nop
	nop
	nop
	.word	0xfc9a9000
	.word	0xfc9c1d40
	.word	0xd6592010
	.word	0x1000000
	or	%g0, 0x600, %i7
	DTLB_TAG_READ
	.word	0xfcdc1000
thr7_MMU_ASI_PRIMARY_455:
	.word	0x87802080
	.word	0xe0bc28c0
thr7_MMU_ASI_PRIMARY_LITTLE_456:
	.word	0x87802088
	.word	0xdaf2a0a8
	.word	0xc0366f3c
	.word	0xee72a0a0
	.word	0xc0742848
	.word	0xc072a758
	.word	0xfe466de8
	.word	0xfa5e60f0
	.word	0x1000000
	.word	0xbe16c000
	IDEMAP_RPAGE
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
	.word	0xe0592140
	.word	0xce72a020
	.word	0xc03567d0
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	.word	0x1000000
	.word	0xbe150000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x019, %i7
	LOAD_IDATA_IN
	.word	0xfcde5000
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe25f6010
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v00b_exit:
	EXIT_GOOD
Thr7_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v109 DATA_VA=0x7b7000132000
attr_data {
	Name = .Thr7_User_Data_4v109 ,
	VA = 0x7b7000132000 ,/* 0x7b7000133fc0 */
	RA = 0x03d0198000 ,
	PA = 0x03d0198000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b7000133c11 80000003d0198440 */
	end_label   = Thr7_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v109_data_begin
Thr7_User_Data_4v109_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00c TEXT_VA=0x7c00000b0000
attr_text {
	Name = .Thr7_User_Text_4v00c ,
	VA = 0x7c00000b0000 ,/* 0x7c00000bffc0 */
	RA = 0x0060d70000 ,
	PA = 0x7860d70000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c00000b1c11 8000007860d70481 */
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
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_PAGE
	.word	0xf8766138
	.word	0xc0756ee8
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x100, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc07566d0
	.word	0xcc5d6078
	.word	0xee776078
	.word	0xc0242d74
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x68, %i7
	DTLB_TAG_READ
	.word	0xbe842090
	.word	0xf2dfd000
thr7_MMU_ASI_PRIMARY_LITTLE_457:
	.word	0x87802088
	.word	0xc4f56150
thr7_MMU_ASI_BLK_COMMIT_S_458:
	.word	0x878020e1
	.word	0xc1bdafc0
	nop
	nop
	.word	0x1000000
	or	%g0, 0x548, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe4c26e8
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00c_exit:
	EXIT_GOOD
Thr7_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10a DATA_VA=0x7b700018c000
attr_data {
	Name = .Thr7_User_Data_4v10a ,
	VA = 0x7b700018c000 ,/* 0x7b700018dfc0 */
	RA = 0x03d008c000 ,
	PA = 0x03d008c000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b700018dc11 80000003d008c440 */
	end_label   = Thr7_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10a_data_begin
Thr7_User_Data_4v10a_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00d TEXT_VA=0x7b7000058000
attr_text {
	Name = .Thr7_User_Text_4v00d ,
	VA = 0x7b7000058000 ,/* 0x7b7000059fc0 */
	RA = 0x03d017c000 ,
	PA = 0x03d017c000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b7000059c11 80000003d017c480 */
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
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x568, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x07a, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x044, %i7
	LOAD_IDATA_IN
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0xcd, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xd45e6068
	.word	0xc0376832
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	nop
	nop
	.word	0xc02aa9b7
	.word	0xe4756078
	.word	0xc072aca8
thr7_MMU_ASI_PRIMARY_459:
	.word	0x87802080
	.word	0xd2f42080
	.word	0xf4756070
	.word	0xc02f6170
	.word	0xfcde5000
	.word	0x1000000
	or	%g0, 0x30, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe816010
	.word	0xc39fde20
	.word	0xfe412ad8
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x031, %i7
	LOAD_DDATA_IN
	.word	0xe0592100
thr7_MMU_ASI_PRIMARY_460:
	.word	0x87802080
	.word	0xe2f76010
	.word	0x1000000
	or	%g0, 0x630, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_RPAGES
	.word	0xfcdd5040
	.word	0xde7660e8
	.word	0xc022aa40
	.word	0x1000000
	or	%g0, 0x218, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x024, %i7
	LOAD_IDATA_IN
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa5c2038
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v00d_exit:
	EXIT_GOOD
Thr7_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10b DATA_VA=0x7b7000060000
attr_data {
	Name = .Thr7_User_Data_4v10b ,
	VA = 0x7b7000060000 ,/* 0x7b7000061fc0 */
	RA = 0x03d006c000 ,
	PA = 0x03d006c000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b7000061c11 80000003d006c440 */
	end_label   = Thr7_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10b_data_begin
Thr7_User_Data_4v10b_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00e TEXT_VA=0x7b70001a0000
attr_text {
	Name = .Thr7_User_Text_4v00e ,
	VA = 0x7b70001a0000 ,/* 0x7b70001a1fc0 */
	RA = 0x03d01da000 ,
	PA = 0x03d01da000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b70001a1c11 80000003d01da480 */
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
	.word	0xfe442c80
	.word	0xfe5126bc
thr7_MMU_ASI_PRIMARY_461:
	.word	0x87802080
	.word	0xecf2a010
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc025685c
	.word	0xfc9a9c40
	.word	0xf25aa150
	DDEMAP_NCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdd5100
	.word	0x1000000
	or	%g0, 0x046, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xec712070
	.word	0xc02763a8
thr7_MMU_ASI_PRIMARY_462:
	.word	0x87802080
	.word	0xfaf0a090
	nop
	nop
	nop
	.word	0xbe82a150
	.word	0xfadfd000
	.word	0xbe842110
	.word	0xeadfd000
	.word	0xfc9a9c40
	.word	0xea72a140
	.word	0xc0356f58
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x438, %i7
	READ_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe4666d0
	.word	0xbe842068
	.word	0xd4dfd000
	IDEMAP_ALL_PAGES
	.word	0xbe842090
	.word	0xf2dfd000
	.word	0x1000000
	.word	0xbe170000
	DDEMAP_RPAGE
	.word	0xfa58a100
	.word	0x1000000
	or	%g0, 0x5b, %i7
	LOAD_IDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfcdc1000
	.word	0xc45d6068
	IDEMAP_ALL_PAGES
	ACCESS_ITSB_PTR
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x010, %i7
	LOAD_DDATA_IN
	DDEMAP_ALL
	DDEMAP_SCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x300, %i7
	DTLB_TAG_READ
	.word	0xfcde5100
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0366448
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00e_exit:
	EXIT_GOOD
Thr7_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10c DATA_VA=0x7c0000df0000
attr_data {
	Name = .Thr7_User_Data_4v10c ,
	VA = 0x7c0000df0000 ,/* 0x7c0000dfffc0 */
	RA = 0x0060990000 ,
	PA = 0x7860990000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c0000df1c11 8000007860990441 */
	end_label   = Thr7_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10c_data_begin
Thr7_User_Data_4v10c_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00f TEXT_VA=0x7b70000ce000
attr_text {
	Name = .Thr7_User_Text_4v00f ,
	VA = 0x7b70000ce000 ,/* 0x7b70000cffc0 */
	RA = 0x03d006e000 ,
	PA = 0x03d006e000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b70000cfc11 80000003d006e480 */
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
	.word	0xc036682e
	.word	0xfe5e69a0
	DDEMAP_NCTX
	.word	0xfe52aa68
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x6d0, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0xfe5aae98
	.word	0xfe4567e4
	.word	0x1000000
	.word	0xbe138000
	DDEMAP_PAGE
	.word	0xf67760a0
	.word	0xc032a170
	.word	0x1000000
	or	%g0, 0x710, %i7
	READ_DDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xc0266b4c
thr7_MMU_ASI_BLK_COMMIT_P_463:
	.word	0x878020e0
	.word	0xe3b92280
	.word	0xca5aa010
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xbe82a0b0
	.word	0xf2dfd000
	.word	0xdc776028
	.word	0xc0342a1c
	.word	0x1000000
	or	%g0, 0x338, %i7
	DTLB_TAG_READ
	.word	0xfc9a9000
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe272a010
	.word	0xc07666c0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v00f_exit:
	EXIT_GOOD
Thr7_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10d DATA_VA=0x7b70000ec000
attr_data {
	Name = .Thr7_User_Data_4v10d ,
	VA = 0x7b70000ec000 ,/* 0x7b70000edfc0 */
	RA = 0x03d005a000 ,
	PA = 0x03d005a000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b70000edc11 80000003d005a440 */
	end_label   = Thr7_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10d_data_begin
Thr7_User_Data_4v10d_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v010 TEXT_VA=0x7c00009e0000
attr_text {
	Name = .Thr7_User_Text_4v010 ,
	VA = 0x7c00009e0000 ,/* 0x7c00009effc0 */
	RA = 0x0060bc0000 ,
	PA = 0x7860bc0000 ,
	TTE_Context = 0x0931 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c00009e1c11 8000007860bc0481 */
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
	.word	0xbe8660d0
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x9, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x533, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_RPAGE
thr7_MMU_ASI_BLK_COMMIT_P_464:
	.word	0x878020e0
	.word	0xc1baa4c0
thr7_MMU_ASI_PRIMARY_465:
	.word	0x87802080
	.word	0xf4f0a010
	.word	0x1000000
	or	%g0, 0x650, %i7
	READ_DDATA_ACCESS
	IDEMAP_NCTX
	.word	0xfcd89000
	TOGGLE_LSU_IM
	IDEMAP_ALL
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xca5aa098
	.word	0xfe52a634
	.word	0x1000000
	or	%g0, 0x1c3, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xc4742068
	.word	0xc0342980
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	.word	0xca776040
	.word	0xc02f6170
	.word	0xec5c2010
	.word	0x1000000
	or	%g0, 0x410, %i7
	ITLB_TAG_READ
	IDEMAP_ALL_PAGES
	.word	0xfcdc1000
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x138, %i7
	ITLB_TAG_READ
	ACCESS_ITSB_PTR
thr7_MMU_ASI_BLK_P_466:
	.word	0x878020f0
	.word	0xc1bf6140
	.word	0x1000000
	or	%g0, 0x90, %i7
	READ_DDATA_ACCESS
	.word	0xce756000
	.word	0xc02e63fa
thr7_MMU_ASI_PRIMARY_467:
	.word	0x87802080
	.word	0xeef66018
	.word	0xd45c20d0
	.word	0xfa766140
	.word	0xc0212c24
thr7_MMU_ASI_BLK_P_468:
	.word	0x878020f0
	.word	0xe1baa340
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x56d, %i7
	LOAD_IDATA_ACCESS
	.word	0xe05c20b0
	DDEMAP_ALL
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x478, %i7
	READ_IDATA_ACCESS
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x458, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x490, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	READ_IDATA_ACCESS
	DDEMAP_ALL
	.word	0xf4742010
	.word	0xc02f65cd
	.word	0x1000000
	or	%g0, 0x016, %i7
	LOAD_IDATA_IN
	.word	0xcc5d6048
	.word	0xe05d6160
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0xd8, %i7
	READ_IDATA_ACCESS
	.word	0xea5e6130
	.word	0xe05aa100
	IDEMAP_ALL_RPAGES
	ACCESS_ITSB_PTR
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe5f64d0
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v010_exit:
	EXIT_GOOD
Thr7_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10e DATA_VA=0x7b7000120000
attr_data {
	Name = .Thr7_User_Data_4v10e ,
	VA = 0x7b7000120000 ,/* 0x7b7000121fc0 */
	RA = 0x03d0100000 ,
	PA = 0x03d0100000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b7000121c11 80000003d0100440 */
	end_label   = Thr7_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10e_data_begin
Thr7_User_Data_4v10e_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10f DATA_VA=0x7b70001be000
attr_data {
	Name = .Thr7_User_Data_4v10f ,
	VA = 0x7b70001be000 ,/* 0x7b70001bffc0 */
	RA = 0x03d0114000 ,
	PA = 0x03d0114000 ,
	TTE_Context = 0x0931 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b70001bfc11 80000003d0114440 */
	end_label   = Thr7_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10f_data_begin
Thr7_User_Data_4v10f_data_begin:
	.xword	0x7b70001e4000
	.xword	0x7b70001e0000
	.xword	0x7d0016800000
	.xword	0x7c0000bc0000
	.xword	0x7c00000d0000
	.xword	0x7c0000fc0000
	.xword	0x7c0000c40000
	.xword	0x7b7000056000
	.xword	0x7b7000040000
	.xword	0x7c0000a80000
	.xword	0x7d0036400000
	.xword	0x7b70001a8000
	.xword	0x7c0000f30000
	.xword	0x7b7000050000
	.xword	0x7b70001e8000
	.xword	0x7b700008e000
	.xword	0x7b7000096000
	.xword	0x7c0000b20000
	.xword	0x7b70001ae000
	.xword	0x7b70000f6000
	.xword	0x7c0000f40000
	.xword	0x7c0000800000
	.xword	0x7b70000e0000
	.xword	0x7c0000bd0000
	.xword	0x7b7000090000
	.xword	0x7c0000f50000
	.xword	0x7b7000192000
	.xword	0x7c0000a90000
	.xword	0x7c00000f0000
	.xword	0x7b7000092000
	.xword	0x7b7000174000
	.xword	0x7c0000630000
	.xword	0x7b7000194000
	.xword	0x7b7000052000
	.xword	0x7b7000132000
	.xword	0x7c00000b0000
	.xword	0x7b700018c000
	.xword	0x7b7000058000
	.xword	0x7b7000060000
	.xword	0x7b70001a0000
	.xword	0x7c0000df0000
	.xword	0x7b70000ce000
	.xword	0x7b70000ec000
	.xword	0x7c00009e0000
	.xword	0x7b7000120000
	.xword	0x7b70001be000
Thr7_User_Data_4v10f_data_end:

