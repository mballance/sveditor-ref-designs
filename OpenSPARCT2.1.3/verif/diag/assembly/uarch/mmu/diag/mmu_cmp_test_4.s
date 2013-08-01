/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_cmp_test_4.s
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
#define THR0_PCONTEXT_0 0x1286
#define THR0_PCONTEXT_1 0x0798
#define THR0_SCONTEXT_0 0x098b
#define THR0_SCONTEXT_1 0x19a4
#define THR1_PCONTEXT_0 0x0c20
#define THR1_PCONTEXT_1 0x155b
#define THR1_SCONTEXT_0 0x0ba9
#define THR1_SCONTEXT_1 0x1f94
#define THR2_PCONTEXT_0 0x1872
#define THR2_PCONTEXT_1 0x0fce
#define THR2_SCONTEXT_0 0x0598
#define THR2_SCONTEXT_1 0x04ab
#define THR3_PCONTEXT_0 0x01bd
#define THR3_PCONTEXT_1 0x1c54
#define THR3_SCONTEXT_0 0x0e6f
#define THR3_SCONTEXT_1 0x0ca0
#define THR4_PCONTEXT_0 0x16f8
#define THR4_PCONTEXT_1 0x171f
#define THR4_SCONTEXT_0 0x086b
#define THR4_SCONTEXT_1 0x0f4c
#define THR5_PCONTEXT_0 0x1f1c
#define THR5_PCONTEXT_1 0x1292
#define THR5_SCONTEXT_0 0x0dc3
#define THR5_SCONTEXT_1 0x0809
#define THR6_PCONTEXT_0 0x1fbb
#define THR6_PCONTEXT_1 0x08ec
#define THR6_SCONTEXT_0 0x1685
#define THR6_SCONTEXT_1 0x1598
#define THR7_PCONTEXT_0 0x026e
#define THR7_PCONTEXT_1 0x06dc
#define THR7_SCONTEXT_0 0x02a6
#define THR7_SCONTEXT_1 0x1df3
#define THR0_PTRAP_TEXT_VA 0x600000e40000
#define THR0_PTRAP_TEXT_RA 0x00d03f0000
#define THR0_PTRAP_TEXT_PA 0x0cd03f0000
#define THR1_PTRAP_TEXT_VA 0x640000d80000
#define THR1_PTRAP_TEXT_RA 0x0160aa0000
#define THR1_PTRAP_TEXT_PA 0x0160aa0000
#define THR2_PTRAP_TEXT_VA 0x680000dd0000
#define THR2_PTRAP_TEXT_RA 0x0170620000
#define THR2_PTRAP_TEXT_PA 0x0170620000
#define THR3_PTRAP_TEXT_VA 0x6c0000760000
#define THR3_PTRAP_TEXT_RA 0x01801b0000
#define THR3_PTRAP_TEXT_PA 0x3d801b0000
#define THR4_PTRAP_TEXT_VA 0x7000008b0000
#define THR4_PTRAP_TEXT_RA 0x0190a60000
#define THR4_PTRAP_TEXT_PA 0x4d90a60000
#define THR5_PTRAP_TEXT_VA 0x740000080000
#define THR5_PTRAP_TEXT_RA 0x01a0da0000
#define THR5_PTRAP_TEXT_PA 0x5da0da0000
#define THR6_PTRAP_TEXT_VA 0x780000c10000
#define THR6_PTRAP_TEXT_RA 0x01b0a70000
#define THR6_PTRAP_TEXT_PA 0x01b0a70000
#define THR7_PTRAP_TEXT_VA 0x7c0000c20000
#define THR7_PTRAP_TEXT_RA 0x01c0190000
#define THR7_PTRAP_TEXT_PA 0x01c0190000
#include "mmu_hred.s"
/*********************************************************************/
SECTION .Thr0_Priv_Sect TEXT_VA=0x5fb000180000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_1
	VA = 0x5fb000180000 ,
	RA = 0x00e01fc000 ,
	PA = 0x0ce01fc000 ,
	TTE_Context = 0x1286 ,
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
SECTION .Thr1_Priv_Sect TEXT_VA=0x63c00006c000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_1
	VA = 0x63c00006c000 ,
	RA = 0x00f0010000 ,
	PA = 0x00f0010000 ,
	TTE_Context = 0x0c20 ,
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
SECTION .Thr2_Priv_Sect TEXT_VA=0x67d000138000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_3
	VA = 0x67d000138000 ,
	RA = 0x0100140000 ,
	PA = 0x0100140000 ,
	TTE_Context = 0x1872 ,
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
SECTION .Thr3_Priv_Sect TEXT_VA=0x6be000160000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_0
	VA = 0x6be000160000 ,
	RA = 0x01101b0000 ,
	PA = 0x01101b0000 ,
	TTE_Context = 0x01bd ,
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
SECTION .Thr4_Priv_Sect TEXT_VA=0x6ff000190000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_2
	VA = 0x6ff000190000 ,
	RA = 0x0120160000 ,
	PA = 0x0120160000 ,
	TTE_Context = 0x16f8 ,
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
SECTION .Thr5_Priv_Sect TEXT_VA=0x73100002c000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_3
	VA = 0x73100002c000 ,
	RA = 0x01301fe000 ,
	PA = 0x01301fe000 ,
	TTE_Context = 0x1f1c ,
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
SECTION .Thr6_Priv_Sect TEXT_VA=0x7720001e6000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_1
	VA = 0x7720001e6000 ,
	RA = 0x0140164000 ,
	PA = 0x6d40164000 ,
	TTE_Context = 0x1fbb ,
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
SECTION .Thr7_Priv_Sect TEXT_VA=0x7b30001b0000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x7b30001b0000 ,
	RA = 0x015014c000 ,
	PA = 0x015014c000 ,
	TTE_Context = 0x026e ,
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
	TTE_W       =           1 ,
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
	TTE_W       =           1 ,
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
	TTE_P       =           0 ,
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
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
Thr1_register_initial_values:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
Thr2_register_initial_values:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
Thr3_register_initial_values:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
Thr4_register_initial_values:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
Thr5_register_initial_values:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
Thr6_register_initial_values:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
Thr7_register_initial_values:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
.align 32
hptrap_itte_begin:
	.xword	0x0000600000b21286	!0
	.xword	0x8000000cd09c0081	
	.xword	0x0000600000051286	!1
	.xword	0x8000000cd0cf0081	
	.xword	0x00005fb000126000	!2
	.xword	0x80000000e0114480	
	.xword	0x000061002e001286	!3
	.xword	0x8000000dd9c00083	
	.xword	0x0000610019001286	!4
	.xword	0x8000000dd2400083	
	.xword	0x000061000d800000	!5
	.xword	0x8000000dd8400483	
	.xword	0x00005fb000140798	!6
	.xword	0x8000000ce009a080	
	.xword	0x000061003b801286	!7
	.xword	0x8000000ddd000083	
	.xword	0x00005fb00010e798	!8
	.xword	0x8000000ce0104080	
	.xword	0x00005fb00019a798	!9
	.xword	0x8000000ce00d4080	
	.xword	0x00005fb0001ac798	!10
	.xword	0x8000000ce0024080	
	.xword	0x0000610022401286	!11
	.xword	0x8000000dde000083	
	.xword	0x00005fb000070798	!12
	.xword	0x8000000ce00a8080	
	.xword	0x0000600000dc1286	!13
	.xword	0x8000000cd0530081	
	.xword	0x0000600000391286	!14
	.xword	0x8000000cd0fb0081	
	.xword	0x0000610037801286	!15
	.xword	0x8000000ddc800083	
	.xword	0x00005fb000090798	!16
	.xword	0x8000000ce0096080	
	.xword	0x0000600000af1286	!17
	.xword	0x8000000cd0720081	
	.xword	0x0000610017801286	!18
	.xword	0x8000000dda000083	
	.xword	0x00005fb000012798	!19
	.xword	0x8000000ce007a080	
	.xword	0x0000600000e61286	!20
	.xword	0x8000000cd0cc0081	
	.xword	0x0000640000550c20	!21
	.xword	0x8000001d60160081	
	.xword	0x000065003380155b	!22
	.xword	0x8000001def400083	
	.xword	0x0000640000660000	!23
	.xword	0x8000000160c40481	
	.xword	0x0000660ce0000c20	!24
	.xword	0x8000001f90000085	
	.xword	0x000063c000000c20	!25
	.xword	0x80000000f01f8080	
	.xword	0x000063c0000a8000	!26
	.xword	0x80000000f0052480	
	.xword	0x000063c000024c20	!27
	.xword	0x80000000f0002080	
	.xword	0x000063c000038c20	!28
	.xword	0x80000000f0144080	
	.xword	0x0000640000980000	!29
	.xword	0x8000000160480481	
	.xword	0x000063c000032c20	!30
	.xword	0x80000000f015a080	
	.xword	0x000063c0000aec20	!31
	.xword	0x80000000f017e080	
	.xword	0x00006400002f0c20	!32
	.xword	0x8000001d60c60081	
	.xword	0x0000640000a30c20	!33
	.xword	0x8000001d60e80081	
	.xword	0x000063c000170c20	!34
	.xword	0x80000000f00f6080	
	.xword	0x000063c0000bac20	!35
	.xword	0x80000000f006c080	
	.xword	0x00006400005e0c20	!36
	.xword	0x8000001d60e00081	
	.xword	0x000065002540155b	!37
	.xword	0x8000001de6800083	
	.xword	0x000063c0001ccc20	!38
	.xword	0x80000000f0176080	
	.xword	0x000063c000026c20	!39
	.xword	0x80000000f007e080	
	.xword	0x000069000ac01872	!40
	.xword	0x8000002dfb800483	
	.xword	0x000069001a001872	!41
	.xword	0x8000002df2800483	
	.xword	0x000067d0000f0000	!42
	.xword	0x800000010012e080	
	.xword	0x0000690003c01872	!43
	.xword	0x8000002df1c00483	
	.xword	0x000067d000159872	!44
	.xword	0x800000010016a480	
	.xword	0x000069002ec00000	!45
	.xword	0x80000001fbc00083	
	.xword	0x0000690000001872	!46
	.xword	0x8000002dfa800483	
	.xword	0x00006800006f1872	!47
	.xword	0x8000000170240481	
	.xword	0x0000690004000000	!48
	.xword	0x80000001f7000083	
	.xword	0x000067d000005872	!49
	.xword	0x80000001000f8480	
	.xword	0x0000680000260000	!50
	.xword	0x80000001700c0081	
	.xword	0x0000680000741872	!51
	.xword	0x8000000170760481	
	.xword	0x000069002b401872	!52
	.xword	0x8000002dfc000483	
	.xword	0x0000680000a11872	!53
	.xword	0x8000000170670481	
	.xword	0x0000680000381872	!54
	.xword	0x8000000170e50481	
	.xword	0x0000690030001872	!55
	.xword	0x8000002dfb000483	
	.xword	0x0000690000801872	!56
	.xword	0x8000002dfe400483	
	.xword	0x000067d00014f872	!57
	.xword	0x80000001000e4480	
	.xword	0x000067d00010d872	!58
	.xword	0x800000010019a480	
	.xword	0x00006be0001ec1bd	!59
	.xword	0x800000011011c480	
	.xword	0x00006d001ac001bd	!60
	.xword	0x800000020b400483	
	.xword	0x00006be0000ea000	!61
	.xword	0x8000000110184080	
	.xword	0x00006c00001901bd	!62
	.xword	0x8000003d80680481	
	.xword	0x00006be00005c1bd	!63
	.xword	0x80000001100cc480	
	.xword	0x00006be000184000	!64
	.xword	0x80000001100dc080	
	.xword	0x00006e0e900001bd	!65
	.xword	0x80000003b0000485	
	.xword	0x00006be0000561bd	!66
	.xword	0x80000001100f4480	
	.xword	0x00006be00017e000	!67
	.xword	0x80000001101d0080	
	.xword	0x00006c00003f01bd	!68
	.xword	0x8000003d80e30481	
	.xword	0x00006be0000dc1bd	!69
	.xword	0x80000001101de480	
	.xword	0x00006d0019c00000	!70
	.xword	0x8000000205800083	
	.xword	0x00006be0000f21bd	!71
	.xword	0x8000000110006480	
	.xword	0x00006c00003101bd	!72
	.xword	0x8000003d80170481	
	.xword	0x00006d002a4001bd	!73
	.xword	0x800000020c400483	
	.xword	0x00006c00007301bd	!74
	.xword	0x8000003d806d0481	
	.xword	0x00006be00006e1bd	!75
	.xword	0x8000000110040480	
	.xword	0x00006be0001021bd	!76
	.xword	0x800000011001c480	
	.xword	0x00006be0001fe1bd	!77
	.xword	0x8000000110142480	
	.xword	0x00006be0000481bd	!78
	.xword	0x8000000110054480	
	.xword	0x00006be0001741bd	!79
	.xword	0x8000000110098480	
	.xword	0x00006d003bc001bd	!80
	.xword	0x8000000203800483	
	.xword	0x00006c00004301bd	!81
	.xword	0x8000003d80690481	
	.xword	0x00006ff00009571f	!82
	.xword	0x8000000120074080	
	.xword	0x00007000005916f8	!83
	.xword	0x8000004d90400081	
	.xword	0x0000700000810000	!84
	.xword	0x8000004d90a20081	
	.xword	0x00006ff00011771f	!85
	.xword	0x800000012007c080	
	.xword	0x0000710016c016f8	!86
	.xword	0x8000004e1e800083	
	.xword	0x0000700000ec0000	!87
	.xword	0x8000004d90c50081	
	.xword	0x00006ff00019771f	!88
	.xword	0x8000000120008080	
	.xword	0x00006ff00001971f	!89
	.xword	0x800000012002e080	
	.xword	0x00006ff0001f0000	!90
	.xword	0x8000000120094080	
	.xword	0x0000710009c016f8	!91
	.xword	0x8000004e19000083	
	.xword	0x00006ff0000b171f	!92
	.xword	0x8000000120110080	
	.xword	0x00006ff0001c571f	!93
	.xword	0x8000000120080080	
	.xword	0x00006ff00007b71f	!94
	.xword	0x8000000120188080	
	.xword	0x00006ff0001c371f	!95
	.xword	0x80000001201ea080	
	.xword	0x00007000003c16f8	!96
	.xword	0x8000004d900b0081	
	.xword	0x00006ff0001a571f	!97
	.xword	0x800000012014a080	
	.xword	0x0000700000ad16f8	!98
	.xword	0x8000004d90d90081	
	.xword	0x00006ff0000d971f	!99
	.xword	0x800000012000a080	
	.xword	0x000071003ec016f8	!100
	.xword	0x8000004e18c00083	
	.xword	0x0000731000125f1c	!101
	.xword	0x800000013005e080	
	.xword	0x000075002a001f1c	!102
	.xword	0x800000022fc00083	
	.xword	0x0000731000178000	!103
	.xword	0x8000005d30102080	
	.xword	0x0000760cc0001f1c	!104
	.xword	0x80000003d0000085	
	.xword	0x0000740000f21f1c	!105
	.xword	0x80000001a0d30081	
	.xword	0x0000750031000000	!106
	.xword	0x8000000226c00083	
	.xword	0x0000740000111f1c	!107
	.xword	0x80000001a0a50081	
	.xword	0x0000740000911f1c	!108
	.xword	0x80000001a07a0081	
	.xword	0x0000760990000000	!109
	.xword	0x8000005c90000085	
	.xword	0x0000740000b11f1c	!110
	.xword	0x80000001a0f60081	
	.xword	0x00007400007a1f1c	!111
	.xword	0x80000001a0350081	
	.xword	0x00007400001f0000	!112
	.xword	0x8000005da0ca0081	
	.xword	0x0000750019401f1c	!113
	.xword	0x8000000220000083	
	.xword	0x00007609f0000000	!114
	.xword	0x8000005ed0000085	
	.xword	0x0000731000017f1c	!115
	.xword	0x8000000130136080	
	.xword	0x000075002bc01f1c	!116
	.xword	0x8000000220400083	
	.xword	0x0000740000201f1c	!117
	.xword	0x80000001a0890081	
	.xword	0x00007310000bdf1c	!118
	.xword	0x80000001300ae080	
	.xword	0x0000740000181f1c	!119
	.xword	0x80000001a0a30081	
	.xword	0x0000740000db1f1c	!120
	.xword	0x80000001a0180081	
	.xword	0x000075002c001f1c	!121
	.xword	0x8000000221000083	
	.xword	0x0000780000041fbb	!122
	.xword	0x8000006db0e90481	
	.xword	0x00007720001d28ec	!123
	.xword	0x8000006d4001e480	
	.xword	0x0000780000bb0000	!124
	.xword	0x80000001b0ed0081	
	.xword	0x0000790039c01fbb	!125
	.xword	0x8000000231800483	
	.xword	0x0000780000971fbb	!126
	.xword	0x8000006db0730481	
	.xword	0x00007720000c4000	!127
	.xword	0x8000006d40042080	
	.xword	0x00007720000648ec	!128
	.xword	0x8000006d40020480	
	.xword	0x0000780000b41fbb	!129
	.xword	0x8000006db0b70481	
	.xword	0x0000772000066000	!130
	.xword	0x8000006d400b6080	
	.xword	0x0000780000cd1fbb	!131
	.xword	0x8000006db0060481	
	.xword	0x000079001ec00000	!132
	.xword	0x8000000237c00083	
	.xword	0x00007a0570001fbb	!133
	.xword	0x8000006870000485	
	.xword	0x0000780000881fbb	!134
	.xword	0x8000006db0c00481	
	.xword	0x000079003a001fbb	!135
	.xword	0x8000000238000483	
	.xword	0x00007720001488ec	!136
	.xword	0x8000006d401e4480	
	.xword	0x00007720000148ec	!137
	.xword	0x8000006d40082480	
	.xword	0x00007c00001206dc	!138
	.xword	0x8000007dc04a0481	
	.xword	0x00007c00000906dc	!139
	.xword	0x8000007dc09b0481	
	.xword	0x00007e0770000000	!140
	.xword	0x8000007ca0000485	
	.xword	0x00007b30001566dc	!141
	.xword	0x8000000150022480	
	.xword	0x00007b300003a6dc	!142
	.xword	0x800000015013c480	
	.xword	0x00007c0000010000	!143
	.xword	0x80000001c03a0481	
	.xword	0x00007c0000c606dc	!144
	.xword	0x8000007dc0c10481	
	.xword	0x00007b30000fc6dc	!145
	.xword	0x80000001501ee480	
	.xword	0x00007c0000bc0000	!146
	.xword	0x80000001c0000481	
	.xword	0x00007b30001286dc	!147
	.xword	0x80000001500de480	
	.xword	0x00007b300009c6dc	!148
	.xword	0x8000000150166480	
	.xword	0x00007b30001926dc	!149
	.xword	0x8000000150116480	
	.xword	0x00007c00009a06dc	!150
	.xword	0x8000007dc01a0481	
	.xword	0x00007b30001ea6dc	!151
	.xword	0x8000000150092480	
	.xword	0x00007c00003e06dc	!152
	.xword	0x8000007dc0c70481	
	.xword	0x00007b30000066dc	!153
	.xword	0x80000001501a2480	
	.xword	0x00007c00001506dc	!154
	.xword	0x8000007dc0e60481	
	.xword	0x00007c00002106dc	!155
	.xword	0x8000007dc00d0481	
	.xword	0x00007b30000aa6dc	!156
	.xword	0x8000000150050480	
	.xword	0x00007b30001b66dc	!157
	.xword	0x8000000150132480	
hptrap_itte_end:
	.xword	158
.align 32
hptrap_dtte_begin:
	.xword	0x00006000004c1286	!0
	.xword	0x8000000cd07b0441	
	.xword	0x000061000040098b	!1
	.xword	0x8000000dd3c00043	
	.xword	0x00006000007e0000	!2
	.xword	0x8000000cd0de0041	
	.xword	0x000061001a801286	!3
	.xword	0x8000000ddf000443	
	.xword	0x00005fb0000f59a4	!4
	.xword	0x8000000ce004c040	
	.xword	0x00005fb0000ca000	!5
	.xword	0x80000000e00ee040	
	.xword	0x000061001d001286	!6
	.xword	0x8000000dd6400443	
	.xword	0x00006000001c098b	!7
	.xword	0x8000000cd0230041	
	.xword	0x0000600000f91286	!8
	.xword	0x8000000cd0df0441	
	.xword	0x00005fb0000899a4	!9
	.xword	0x8000000ce0084040	
	.xword	0x00005fb000002798	!10
	.xword	0x8000000ce01cc440	
	.xword	0x00005fb000132798	!11
	.xword	0x8000000ce002c440	
	.xword	0x00005fb00004c798	!12
	.xword	0x8000000ce01dc440	
	.xword	0x00005fb0000e8798	!13
	.xword	0x8000000ce00fa440	
	.xword	0x0000610036801286	!14
	.xword	0x8000000dd0800443	
	.xword	0x00005fb0001c0798	!15
	.xword	0x8000000ce019e440	
	.xword	0x00005fb0000be798	!16
	.xword	0x8000000ce01b6440	
	.xword	0x00005fb0000f6798	!17
	.xword	0x8000000ce01d8440	
	.xword	0x00005fb000054798	!18
	.xword	0x8000000ce01b8440	
	.xword	0x000061003cc01286	!19
	.xword	0x8000000dda400443	
	.xword	0x0000600000941286	!20
	.xword	0x8000000cd0650441	
	.xword	0x00005fb000142798	!21
	.xword	0x8000000ce01ce440	
	.xword	0x00005fb000100798	!22
	.xword	0x8000000ce0126440	
	.xword	0x000061003e401286	!23
	.xword	0x8000000dd5c00443	
	.xword	0x0000600000a41286	!24
	.xword	0x8000000cd0b30441	
	.xword	0x000063c00017cc20	!25
	.xword	0x80000000f01e0040	
	.xword	0x000065000dc01f94	!26
	.xword	0x8000001de9400443	
	.xword	0x000063c00010a000	!27
	.xword	0x80000000f006a440	
	.xword	0x000063c000106c20	!28
	.xword	0x80000000f000e040	
	.xword	0x000063c000050ba9	!29
	.xword	0x80000000f01f0440	
	.xword	0x0000650029000000	!30
	.xword	0x8000001de4400443	
	.xword	0x0000640000fb0c20	!31
	.xword	0x8000001d60cb0041	
	.xword	0x0000650002c01f94	!32
	.xword	0x8000001de3000443	
	.xword	0x0000650014800000	!33
	.xword	0x8000001de2c00443	
	.xword	0x000063c000114c20	!34
	.xword	0x80000000f004e040	
	.xword	0x0000650001c00000	!35
	.xword	0x8000001ded400443	
	.xword	0x0000640000a60c20	!36
	.xword	0x8000001d609f0041	
	.xword	0x000063c0000acc20	!37
	.xword	0x80000000f0072040	
	.xword	0x000063c0001a2c20	!38
	.xword	0x80000000f0178040	
	.xword	0x0000640000170c20	!39
	.xword	0x8000001d604f0041	
	.xword	0x000063c00015ec20	!40
	.xword	0x80000000f0056040	
	.xword	0x000063c00005ac20	!41
	.xword	0x80000000f01d6040	
	.xword	0x0000640000420c20	!42
	.xword	0x8000001d608f0041	
	.xword	0x000063c00013ec20	!43
	.xword	0x80000000f01ac040	
	.xword	0x0000640000f00c20	!44
	.xword	0x8000001d606a0041	
	.xword	0x000063c0001e4c20	!45
	.xword	0x80000000f0182040	
	.xword	0x0000680000de1872	!46
	.xword	0x8000000170dd0041	
	.xword	0x00006a0530000598	!47
	.xword	0x8000002fa0000445	
	.xword	0x0000680000e70000	!48
	.xword	0x8000000170a00441	
	.xword	0x00006a0d80001872	!49
	.xword	0x8000002e50000045	
	.xword	0x000067d0001ae598	!50
	.xword	0x8000000100078440	
	.xword	0x000067d0000ce000	!51
	.xword	0x800000010001a440	
	.xword	0x00006800001d1872	!52
	.xword	0x8000000170660041	
	.xword	0x00006a04b0000000	!53
	.xword	0x8000002e60000445	
	.xword	0x00006a04c0001872	!54
	.xword	0x8000002e70000045	
	.xword	0x000067d00016b872	!55
	.xword	0x80000001000c2040	
	.xword	0x000067d000061872	!56
	.xword	0x8000000100148040	
	.xword	0x0000680000d11872	!57
	.xword	0x8000000170fa0041	
	.xword	0x0000680000481872	!58
	.xword	0x80000001706b0041	
	.xword	0x0000690013c01872	!59
	.xword	0x8000002dfac00043	
	.xword	0x000067d00019f872	!60
	.xword	0x8000000100004040	
	.xword	0x0000690009801872	!61
	.xword	0x8000002df2000043	
	.xword	0x00006800001e1872	!62
	.xword	0x80000001708a0041	
	.xword	0x000067d000183872	!63
	.xword	0x80000001000ac040	
	.xword	0x000067d000147872	!64
	.xword	0x80000001001da040	
	.xword	0x000069000b401872	!65
	.xword	0x8000002df1400043	
	.xword	0x0000680000b51872	!66
	.xword	0x8000000170110041	
	.xword	0x000067d000121872	!67
	.xword	0x8000000100070040	
	.xword	0x000067d0001bd872	!68
	.xword	0x800000010018c040	
	.xword	0x0000690033c01872	!69
	.xword	0x8000002df8800043	
	.xword	0x00006a0b00001872	!70
	.xword	0x8000002010000045	
	.xword	0x00006be0000621bd	!71
	.xword	0x80000001100a0040	
	.xword	0x00006be000020e6f	!72
	.xword	0x8000000110014040	
	.xword	0x00006c0000fc0000	!73
	.xword	0x8000003d80440441	
	.xword	0x00006c00008301bd	!74
	.xword	0x8000003d805c0041	
	.xword	0x00006be00007ce6f	!75
	.xword	0x8000000110012040	
	.xword	0x00006c0000f50000	!76
	.xword	0x8000003d80570441	
	.xword	0x00006be0001e01bd	!77
	.xword	0x800000011016c040	
	.xword	0x00006be0000ece6f	!78
	.xword	0x80000001100e6040	
	.xword	0x00006be00005e000	!79
	.xword	0x800000011015e440	
	.xword	0x00006be0001a61bd	!80
	.xword	0x8000000110076040	
	.xword	0x00006be0000e6000	!81
	.xword	0x800000011019c440	
	.xword	0x00006c00000f01bd	!82
	.xword	0x8000003d80f50041	
	.xword	0x00006be0000d21bd	!83
	.xword	0x8000000110196040	
	.xword	0x00006c00008a01bd	!84
	.xword	0x8000003d801e0041	
	.xword	0x00006c0000c701bd	!85
	.xword	0x8000003d805e0041	
	.xword	0x00006d001bc001bd	!86
	.xword	0x8000000203400043	
	.xword	0x00006d00124001bd	!87
	.xword	0x800000020d800043	
	.xword	0x00006e0b500001bd	!88
	.xword	0x8000000290000045	
	.xword	0x00006be0000c01bd	!89
	.xword	0x8000000110058040	
	.xword	0x00006d003b4001bd	!90
	.xword	0x800000020cc00043	
	.xword	0x00007000006d16f8	!91
	.xword	0x8000004d90330041	
	.xword	0x00006ff0000b6f4c	!92
	.xword	0x80000001201f6440	
	.xword	0x000071003fc00000	!93
	.xword	0x8000004e1dc00443	
	.xword	0x0000700000b016f8	!94
	.xword	0x8000004d903e0041	
	.xword	0x00007000005b086b	!95
	.xword	0x8000004d90770441	
	.xword	0x0000700000a70000	!96
	.xword	0x8000004d90270441	
	.xword	0x000071003f4016f8	!97
	.xword	0x8000004e14000043	
	.xword	0x000071002040086b	!98
	.xword	0x8000004e14800443	
	.xword	0x00007000002a0000	!99
	.xword	0x8000004d90510441	
	.xword	0x00007000002816f8	!100
	.xword	0x8000004d900a0041	
	.xword	0x00006ff00007ef4c	!101
	.xword	0x80000001201ba440	
	.xword	0x000071002e400000	!102
	.xword	0x8000004e1ec00443	
	.xword	0x00006ff00019d71f	!103
	.xword	0x800000012017a040	
	.xword	0x0000700000300000	!104
	.xword	0x8000004d90cd0441	
	.xword	0x00006ff0000b571f	!105
	.xword	0x8000000120028040	
	.xword	0x00006ff00003f71f	!106
	.xword	0x80000001201fa040	
	.xword	0x00006ff0000b371f	!107
	.xword	0x8000000120026040	
	.xword	0x00006ff00005971f	!108
	.xword	0x8000000120146040	
	.xword	0x0000710029c016f8	!109
	.xword	0x8000004e14c00043	
	.xword	0x000075000b001f1c	!110
	.xword	0x8000000225000443	
	.xword	0x000075002d400dc3	!111
	.xword	0x8000000226000043	
	.xword	0x000075000c400000	!112
	.xword	0x800000022f800043	
	.xword	0x00007310001a9f1c	!113
	.xword	0x8000000130038440	
	.xword	0x000075000e000dc3	!114
	.xword	0x8000000225400043	
	.xword	0x000073100004e000	!115
	.xword	0x8000005d30088040	
	.xword	0x000075001f801f1c	!116
	.xword	0x8000000227400443	
	.xword	0x00007400005a0dc3	!117
	.xword	0x80000001a0f00041	
	.xword	0x0000750023000000	!118
	.xword	0x8000000220c00043	
	.xword	0x0000740000031f1c	!119
	.xword	0x80000001a0a10441	
	.xword	0x0000740000650000	!120
	.xword	0x8000005da0370041	
	.xword	0x00007310000b9f1c	!121
	.xword	0x80000001300d2440	
	.xword	0x0000740000471f1c	!122
	.xword	0x80000001a02b0441	
	.xword	0x0000760cd0001f1c	!123
	.xword	0x80000002a0000445	
	.xword	0x000073100012bf1c	!124
	.xword	0x80000001301e2440	
	.xword	0x00007310000c3f1c	!125
	.xword	0x800000013016e440	
	.xword	0x0000760910001f1c	!126
	.xword	0x8000000060000445	
	.xword	0x0000740000841f1c	!127
	.xword	0x80000001a0a40441	
	.xword	0x0000731000155f1c	!128
	.xword	0x800000013005a440	
	.xword	0x0000780000771fbb	!129
	.xword	0x8000006db0850041	
	.xword	0x00007720001ab598	!130
	.xword	0x8000006d40046040	
	.xword	0x0000780000ba0000	!131
	.xword	0x80000001b02a0041	
	.xword	0x00007720000e08ec	!132
	.xword	0x8000006d401a0040	
	.xword	0x0000772000187598	!133
	.xword	0x8000006d40112040	
	.xword	0x000079003e000000	!134
	.xword	0x8000000237800043	
	.xword	0x00007720001be8ec	!135
	.xword	0x8000006d401b4040	
	.xword	0x00007a0cf0001685	!136
	.xword	0x8000006fe0000045	
	.xword	0x00007800003a0000	!137
	.xword	0x80000001b0bc0041	
	.xword	0x00007720000728ec	!138
	.xword	0x8000006d4010e040	
	.xword	0x000077200013b598	!139
	.xword	0x8000006d400e8040	
	.xword	0x000077200015a000	!140
	.xword	0x8000006d400c0040	
	.xword	0x00007720001508ec	!141
	.xword	0x8000006d40016040	
	.xword	0x00007720001e8000	!142
	.xword	0x8000006d4002a040	
	.xword	0x00007720000ee8ec	!143
	.xword	0x8000006d40048040	
	.xword	0x0000780000321fbb	!144
	.xword	0x8000006db0460041	
	.xword	0x0000780000c31fbb	!145
	.xword	0x8000006db07f0041	
	.xword	0x00007720001d88ec	!146
	.xword	0x8000006d40030040	
	.xword	0x000079002fc01fbb	!147
	.xword	0x8000000239800043	
	.xword	0x00007720001888ec	!148
	.xword	0x8000006d40086040	
	.xword	0x00007720000448ec	!149
	.xword	0x8000006d40018040	
	.xword	0x00007720001b28ec	!150
	.xword	0x8000006d4003c040	
	.xword	0x00007720001228ec	!151
	.xword	0x8000006d4008a040	
	.xword	0x00007800009b1fbb	!152
	.xword	0x8000006db0ce0041	
	.xword	0x0000780000561fbb	!153
	.xword	0x8000006db0340041	
	.xword	0x00007800000c1fbb	!154
	.xword	0x8000006db0630041	
	.xword	0x00007720001108ec	!155
	.xword	0x8000006d400ce040	
	.xword	0x00007b30000226dc	!156
	.xword	0x8000000150124440	
	.xword	0x00007e02b00002a6	!157
	.xword	0x8000007ff0000445	
	.xword	0x00007b300015c000	!158
	.xword	0x8000007d501ec040	
	.xword	0x00007b30001986dc	!159
	.xword	0x80000001501c6440	
	.xword	0x00007c0000a91df3	!160
	.xword	0x8000007dc0a80441	
	.xword	0x00007b3000084000	!161
	.xword	0x8000007d5014e040	
	.xword	0x00007b30001d46dc	!162
	.xword	0x800000015009c440	
	.xword	0x00007b3000145df3	!163
	.xword	0x800000015005c440	
	.xword	0x00007e0a80000000	!164
	.xword	0x8000007ec0000045	
	.xword	0x00007c0000d406dc	!165
	.xword	0x8000007dc0790441	
	.xword	0x00007c00003d1df3	!166
	.xword	0x8000007dc0ea0441	
	.xword	0x00007e0e80000000	!167
	.xword	0x8000007f50000045	
	.xword	0x00007b30001b46dc	!168
	.xword	0x80000001501c8440	
	.xword	0x00007b30001f5df3	!169
	.xword	0x800000015013a440	
	.xword	0x00007b3000046000	!170
	.xword	0x8000007d50032040	
	.xword	0x00007c00000606dc	!171
	.xword	0x8000007dc09d0441	
	.xword	0x00007e0c2000026e	!172
	.xword	0x8000007ef0000445	
	.xword	0x00007b300003c6dc	!173
	.xword	0x800000015009e440	
	.xword	0x00007b300012c6dc	!174
	.xword	0x8000000150108440	
	.xword	0x00007b30001346dc	!175
	.xword	0x8000000150000440	
	.xword	0x00007b30000746dc	!176
	.xword	0x80000001501a4440	
	.xword	0x00007b300013c6dc	!177
	.xword	0x8000000150168440	
	.xword	0x00007b30001046dc	!178
	.xword	0x8000000150060440	
	.xword	0x00007c00004906dc	!179
	.xword	0x8000007dc0d40441	
	.xword	0x00007b30000766dc	!180
	.xword	0x800000015000c440	
	.xword	0x00007b300014a6dc	!181
	.xword	0x8000000150120440	
hptrap_dtte_end:
	.xword	182
.align 32
hptrap_user_code_ptrs_0_begin:
	.xword	8
	.xword	0x600000050000
	.xword	24
	.xword	0x610019000000
	.xword	40
	.xword	0x61003b800000
	.xword	56
	.xword	0x5fb00019a000
	.xword	72
	.xword	0x610022400000
	.xword	88
	.xword	0x5fb000070000
	.xword	104
	.xword	0x600000dc0000
	.xword	120
	.xword	0x600000390000
	.xword	136
	.xword	0x610037800000
	.xword	152
	.xword	0x5fb000090000
	.xword	168
	.xword	0x600000af0000
	.xword	184
	.xword	0x610017800000
	.xword	200
	.xword	0x5fb000012000
	.xword	216
	.xword	0x600000e60000
	.xword	232
	.xword	8
.align 32
hptrap_user_code_ptrs_1_begin:
	.xword	8
	.xword	0x650033800000
	.xword	24
	.xword	0x63c000000000
	.xword	40
	.xword	0x63c000038000
	.xword	56
	.xword	0x63c0000ae000
	.xword	72
	.xword	0x6400002f0000
	.xword	88
	.xword	0x640000a30000
	.xword	104
	.xword	0x63c000170000
	.xword	120
	.xword	0x63c0000ba000
	.xword	136
	.xword	0x6400005e0000
	.xword	152
	.xword	0x650025400000
	.xword	168
	.xword	0x63c0001cc000
	.xword	184
	.xword	0x63c000026000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_2_begin:
	.xword	8
	.xword	0x69001a000000
	.xword	24
	.xword	0x67d000158000
	.xword	40
	.xword	0x6800006f0000
	.xword	56
	.xword	0x67d000004000
	.xword	72
	.xword	0x680000740000
	.xword	88
	.xword	0x69002b400000
	.xword	104
	.xword	0x680000a10000
	.xword	120
	.xword	0x680000380000
	.xword	136
	.xword	0x690030000000
	.xword	152
	.xword	0x690000800000
	.xword	168
	.xword	0x67d00014e000
	.xword	184
	.xword	0x67d00010c000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_3_begin:
	.xword	8
	.xword	0x6d001ac00000
	.xword	24
	.xword	0x6be00005c000
	.xword	40
	.xword	0x6be000056000
	.xword	56
	.xword	0x6be0000dc000
	.xword	72
	.xword	0x6c0000310000
	.xword	88
	.xword	0x6c0000730000
	.xword	104
	.xword	0x6be00006e000
	.xword	120
	.xword	0x6be000102000
	.xword	136
	.xword	0x6be0001fe000
	.xword	152
	.xword	0x6be000048000
	.xword	168
	.xword	0x6be000174000
	.xword	184
	.xword	0x6d003bc00000
	.xword	200
	.xword	0x6c0000430000
	.xword	216
	.xword	8
.align 32
hptrap_user_code_ptrs_4_begin:
	.xword	8
	.xword	0x700000590000
	.xword	24
	.xword	0x710016c00000
	.xword	40
	.xword	0x6ff000018000
	.xword	56
	.xword	0x6ff0000b0000
	.xword	72
	.xword	0x6ff00007a000
	.xword	88
	.xword	0x7000003c0000
	.xword	104
	.xword	0x6ff0001a4000
	.xword	120
	.xword	0x700000ad0000
	.xword	136
	.xword	0x6ff0000d8000
	.xword	152
	.xword	0x71003ec00000
	.xword	168
	.xword	8
.align 32
hptrap_user_code_ptrs_5_begin:
	.xword	8
	.xword	0x75002a000000
	.xword	24
	.xword	0x740000f20000
	.xword	40
	.xword	0x740000910000
	.xword	56
	.xword	0x7400007a0000
	.xword	72
	.xword	0x750019400000
	.xword	88
	.xword	0x731000016000
	.xword	104
	.xword	0x75002bc00000
	.xword	120
	.xword	0x740000200000
	.xword	136
	.xword	0x7310000bc000
	.xword	152
	.xword	0x740000180000
	.xword	168
	.xword	0x740000db0000
	.xword	184
	.xword	0x75002c000000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_6_begin:
	.xword	8
	.xword	0x7720001d2000
	.xword	24
	.xword	0x780000970000
	.xword	40
	.xword	0x780000b40000
	.xword	56
	.xword	0x780000cd0000
	.xword	72
	.xword	0x7a0570000000
	.xword	88
	.xword	0x780000880000
	.xword	104
	.xword	0x79003a000000
	.xword	120
	.xword	0x772000148000
	.xword	136
	.xword	0x772000014000
	.xword	152
	.xword	8
.align 32
hptrap_user_code_ptrs_7_begin:
	.xword	8
	.xword	0x7c0000090000
	.xword	24
	.xword	0x7b300003a000
	.xword	40
	.xword	0x7b30000fc000
	.xword	56
	.xword	0x7b3000128000
	.xword	72
	.xword	0x7b300009c000
	.xword	88
	.xword	0x7b3000192000
	.xword	104
	.xword	0x7c00009a0000
	.xword	120
	.xword	0x7b30001ea000
	.xword	136
	.xword	0x7c00003e0000
	.xword	152
	.xword	0x7b3000006000
	.xword	168
	.xword	0x7c0000150000
	.xword	184
	.xword	0x7c0000210000
	.xword	200
	.xword	0x7b30000aa000
	.xword	216
	.xword	0x7b30001b6000
	.xword	232
	.xword	8
/*********************************************************************/
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x600000b20000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	VA = 0x600000b20000 ,/* 0x600000b2ffc0 */
	RA = 0x00d09c0000 ,
	PA = 0x0cd09c0000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000b21286 8000000cd09c0081 */
	end_label   = Thr0_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
	setx	0x6000004c0000, %g1, %g2
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
	.word	0xbe13c000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x58, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x668, %i7
	DTLB_TAG_READ
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
	.word	0x1000000
	or	%g0, 0x0, %i7
	READ_IDATA_ACCESS
	.word	0xbe82a0d8
	.word	0xf4dfd000
	.word	0xf670a030
	.word	0xc030af90
	DDEMAP_PCTX
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x515, %i7
	LOAD_IDATA_ACCESS
	.word	0xc02e22e6
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	READ_IDATA_ACCESS
	.word	0xe05aa0e8
	.word	0x1000000
	or	%g0, 0x61d, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0xd4752038
	.word	0xc0272dcc
	.word	0x1000000
	.word	0xbe144000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe114000
	DDEMAP_PAGE
	IDEMAP_NCTX
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_1:
	.word	0x87802080
	.word	0xdef62130
	nop
	nop
	.word	0xfe462ac8
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x040, %i7
	LOAD_DDATA_IN
	.word	0xdc752058
	.word	0xc026ae00
	.word	0xbe82a068
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x1b8, %i7
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
	or	%g0, 0x0a3, %i7
	LOAD_DDATA_IN
	.word	0xe05c20f8
	.word	0x1000000
	or	%g0, 0xc8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x588, %i7
	READ_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc022afdc
	TOGGLE_LSU_DM
	ACCESS_ITSB_PTR
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4c2b12
	DDEMAP_ALL_PAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe87520d8
	.word	0xc0352cc6
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v000_exit:
	EXIT_GOOD
Thr0_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v100 DATA_VA=0x6000004c0000
attr_data {
	Name = .Thr0_User_Data_4v100 ,
	VA = 0x6000004c0000 ,/* 0x6000004cffc0 */
	RA = 0x00d07b0000 ,
	PA = 0x0cd07b0000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006000004c1286 8000000cd07b0441 */
	end_label   = Thr0_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v100_data_begin
Thr0_User_Data_4v100_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v200 DATA_VA=0x610000400000
attr_data {
	Name = .Thr0_User_Data_4v200 ,
	VA = 0x610000400000 ,/* 0x6100007fffc0 */
	RA = 0x01d3c00000 ,
	PA = 0x0dd3c00000 ,
	TTE_Context = 0x098b ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000061000040098b 8000000dd3c00043 */
	end_label   = Thr0_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v200_data_begin
Thr0_User_Data_4v200_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v300 DATA_VA=0x6000007e0000
attr_data {
	Name = .Thr0_User_Data_4v300 ,
	VA = 0x6000007e0000 ,/* 0x6000007effc0 */
	RA = 0x00d0de0000 ,
	PA = 0x0cd0de0000 ,
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
	/* DTTE_TAG_DATA = 00006000007e0000 8000000cd0de0041 */
	end_label   = Thr0_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v300_data_begin
Thr0_User_Data_4v300_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v001 TEXT_VA=0x600000050000
attr_text {
	Name = .Thr0_User_Text_4v001 ,
	VA = 0x600000050000 ,/* 0x60000005ffc0 */
	RA = 0x00d0cf0000 ,
	PA = 0x0cd0cf0000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000051286 8000000cd0cf0081 */
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
	.word	0xd45ea0a8
	.word	0xbe812068
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x6b7, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x2b8, %i7
	DTLB_TAG_READ
	ACCESS_DTSB_PTR
	.word	0xfe4d24f9
	.word	0xc0262d20
	.word	0xca72a010
	.word	0xc070ad10
	nop
	nop
	nop
	.word	0xbe842038
	.word	0xe0dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd872a018
	.word	0xc02aaf8d
	.word	0x1000000
	or	%g0, 0xf5, %i7
	LOAD_DDATA_ACCESS
thr0_MMU_ASI_PRIMARY_LITTLE_2:
	.word	0x87802088
	.word	0xe0bf2980
	.word	0xfcdd1100
	.word	0xfcda9000
thr0_MMU_ASI_PRIMARY_3:
	.word	0x87802080
	.word	0xcef42000
	.word	0xf47620e8
	.word	0xc02c29b4
	.word	0xc876a038
	.word	0xc0712de8
	.word	0xc458a038
	.word	0xc0242170
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0xfe5e2fa0
	.word	0xfa7720a0
	.word	0xc02ea776
	DO_BRANCH
	.word	0x81c5a000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xc03523c0
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v001_exit:
	EXIT_GOOD
Thr0_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v400 TEXT_VA=0x5fb000126000
attr_text {
	Name = .Thr0_User_Text_4v400 ,
	VA = 0x5fb000126000 ,/* 0x5fb000127fc0 */
	RA = 0x00e0114000 ,
	PA = 0x00e0114000 ,
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
	/* ITTE_TAG_DATA = 00005fb000126000 80000000e0114480 */
	end_label   = Thr0_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v400_text_begin
Thr0_User_Text_4v400_text_begin:
	wrpr	0, %gl
thr0_MMU_ASI_PRIMARY_4:
	.word	0x87802080
	.word	0xdef6a098
	.word	0xfcde0200
	.word	0xc071aca8
	.word	0xbe842008
	.word	0xe8dfd000
	P_TOGGLE_LSU_IM
thr0_MMU_ASI_PRIMARY_5:
	.word	0x87802080
	.word	0xd0f6a028
	.word	0xbe8520a8
	.word	0xd4dfd000
	.word	0xfcd91000
thr0_MMU_ASI_BLK_P_6:
	.word	0x878020f0
	.word	0xc3beab80
	.word	0xfcdf42a0
	.word	0xfcde0200
	.word	0x1000000
	.word	0xbe144000
	P_DDEMAP_PAGE
	.word	0xbe158000
	RETURN_FROM_SUPERVISOR1
	nop
Thr0_User_Text_4v400_exit:
	EXIT_GOOD
Thr0_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v002 TEXT_VA=0x61002e000000
attr_text {
	Name = .Thr0_User_Text_4v002 ,
	VA = 0x61002e000000 ,/* 0x61002e3fffc0 */
	RA = 0x01d9c00000 ,
	PA = 0x0dd9c00000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061002e001286 8000000dd9c00083 */
	end_label   = Thr0_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v002_text_begin
Thr0_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x7c8, %i7
	P_LOAD_DDATA_ACCESS
	P_DDEMAP_ALL_PAGES
	.word	0xfc9b0580
	P_ACCESS_DTSB_PTR
	.word	0xcc742018
	.word	0xc0242b88
thr0_MMU_ASI_PRIMARY_LITTLE_7:
	.word	0x87802088
	.word	0xccf52018
	P_IDEMAP_NCTX
thr0_MMU_ASI_AS_IF_USER_PRIMARY_8:
	.word	0x87802010
	.word	0xccf2a018
	.word	0xbe82a068
	.word	0xf0dfd000
	.word	0x1000000
	.word	0xbe14c000
	P_IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0xd8, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xbe852160
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x3d8, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	nop
	nop
	nop
	.word	0xfcd94380
	.word	0xbe82a068
	.word	0xe0dfc200
thr0_MMU_ASI_AS_IF_USER_SECONDARY_LITTLE_9:
	.word	0x87802019
	.word	0xe6f16000
	P_IDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_ACCESS_ITSB_PTR
	.word	0xc872a0b8
	.word	0xc072ad30
thr0_MMU_ASI_PRIMARY_10:
	.word	0x87802080
	.word	0xd4baa9a0
	.word	0xbe86a008
	.word	0xe8dfd000
	.word	0xfcdc0200
	.word	0xfcdd0200
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	P_DTLB_TAG_READ
	.word	0xc672a000
	.word	0xc032a7b2
thr0_MMU_ASI_BLK_P_11:
	.word	0x878020f0
	.word	0xc1bf2540
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
	P_LOAD_IDATA_IN
	.word	0xc02c29d2
	.word	0xbe8420b8
	.word	0xd4dfc200
	P_DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x014, %i7
	P_LOAD_DDATA_IN
	.word	0xd458a088
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe148000
	P_DDEMAP_RPAGE
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x63b, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xd8762018
	.word	0xc02e23f0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_REAL_IO_LITTLE_12:
	.word	0x8780201d
	.word	0xf6f3a000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdc0200
	P_DDEMAP_ALL
	P_IDEMAP_NCTX
	.word	0xfc998580
	.word	0xbe82a138
	.word	0xe0dfc200
	.word	0xc4762068
	.word	0xc076ae60
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0742250
	P_IDEMAP_ALL_RPAGES
thr0_MMU_ASI_BLK_COMMIT_P_13:
	.word	0x878020e0
	.word	0xc3baaf40
	.word	0x1000000
	.word	0xbe15c000
	P_IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x069, %i7
	P_LOAD_DDATA_IN
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x022, %i7
	P_LOAD_IDATA_IN
	.word	0xbe174000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v002_exit:
	EXIT_GOOD
Thr0_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v101 DATA_VA=0x61001a800000
attr_data {
	Name = .Thr0_User_Data_4v101 ,
	VA = 0x61001a800000 ,/* 0x61001abfffc0 */
	RA = 0x01df000000 ,
	PA = 0x0ddf000000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000061001a801286 8000000ddf000443 */
	end_label   = Thr0_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v101_data_begin
Thr0_User_Data_4v101_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v201 DATA_VA=0x5fb0000f4000
attr_data {
	Name = .Thr0_User_Data_4v201 ,
	VA = 0x5fb0000f4000 ,/* 0x5fb0000f5fc0 */
	RA = 0x00e004c000 ,
	PA = 0x0ce004c000 ,
	TTE_Context = 0x098b ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00005fb0000f59a4 8000000ce004c040 */
	end_label   = Thr0_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v201_data_begin
Thr0_User_Data_4v201_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v301 DATA_VA=0x5fb0000ca000
attr_data {
	Name = .Thr0_User_Data_4v301 ,
	VA = 0x5fb0000ca000 ,/* 0x5fb0000cbfc0 */
	RA = 0x00e00ee000 ,
	PA = 0x00e00ee000 ,
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
	/* DTTE_TAG_DATA = 00005fb0000ca000 80000000e00ee040 */
	end_label   = Thr0_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v301_data_begin
Thr0_User_Data_4v301_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v003 TEXT_VA=0x610019000000
attr_text {
	Name = .Thr0_User_Text_4v003 ,
	VA = 0x610019000000 ,/* 0x6100193fffc0 */
	RA = 0x01d2400000 ,
	PA = 0x0dd2400000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000610019001286 8000000dd2400083 */
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
	nop
	nop
	nop
	nop
	nop
	.word	0xfcd91140
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd5060
	.word	0xc0742fa0
	.word	0xfc9f1c40
	.word	0xfcdf1140
	.word	0x1000000
	or	%g0, 0x66, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
	nop
	nop
	DO_BRANCH
	.word	0x81c4a000
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
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	READ_IDATA_ACCESS
thr0_MMU_ASI_PRIMARY_14:
	.word	0x87802080
	.word	0xd0f0a028
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x338, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe110000
	IDEMAP_PAGE
	DO_BRANCH
	.word	0x81c5e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x008, %i7
	LOAD_IDATA_IN
thr0_MMU_ASI_PRIMARY_15:
	.word	0x87802080
	.word	0xdaf62100
	.word	0xfe5d20c0
thr0_MMU_ASI_SECONDARY_16:
	.word	0x87802081
	.word	0xe8f16038
	.word	0x1000000
	or	%g0, 0x4da, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcd89000
thr0_MMU_ASI_BLK_P_17:
	.word	0x878020f0
	.word	0xc3be2b80
	DO_BRANCH
	.word	0x81c5a000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr0_MMU_ASI_BLK_COMMIT_P_18:
	.word	0x878020e0
	.word	0xc1baa400
	.word	0x1000000
	.word	0xbe10c000
	IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc072a770
	.word	0x1000000
	or	%g0, 0x590, %i7
	ITLB_TAG_READ
	.word	0xcc72a018
	.word	0xc022a89c
	IDEMAP_ALL
	.word	0xf6762050
	.word	0xc0212170
	.word	0x1000000
	or	%g0, 0x200, %i7
	READ_DDATA_ACCESS
	.word	0xda742030
	.word	0xc02c2550
	.word	0xc0262f48
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcda9000
	.word	0x1000000
	.word	0xbe160000
	IDEMAP_PAGE
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc85aa038
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v003_exit:
	EXIT_GOOD
Thr0_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v401 TEXT_VA=0x61000d800000
attr_text {
	Name = .Thr0_User_Text_4v401 ,
	VA = 0x61000d800000 ,/* 0x61000dbfffc0 */
	RA = 0x01d8400000 ,
	PA = 0x0dd8400000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr0_z_ctx_tsb_3 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000061000d800000 8000000dd8400483 */
	end_label   = Thr0_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v401_text_begin
Thr0_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe150000
	P_DDEMAP_PAGE
	.word	0xbe80a038
	.word	0xd4dfc200
	P_DDEMAP_ALL_PAGES
thr0_MMU_ASI_AS_IF_USER_PRIMARY_19:
	.word	0x87802010
	.word	0xd6f2a070
	.word	0xfe51a82e
	.word	0xbe82a088
	.word	0xe8dfc200
	P_DDEMAP_ALL
	.word	0xbe8720a8
	.word	0xe8dfd000
thr0_MMU_ASI_SECONDARY_20:
	.word	0x87802081
	.word	0xdaf2e0c0
	.word	0xfe41a090
	.word	0x1000000
	or	%g0, 0x11e, %i7
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
	.word	0xbe8160a8
	.word	0xe6dfc2a0
	.word	0xbe8160d8
	.word	0xd6dfc280
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
thr0_MMU_ASI_BLK_P_21:
	.word	0x878020f0
	.word	0xe1bea2c0
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x5a0, %i7
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
	P_ACCESS_ITSB_PTR
	.word	0xc029abd1
thr0_MMU_ASI_AS_IF_USER_PRIMARY_22:
	.word	0x87802010
	.word	0xeaf0a070
	.word	0xfcdad120
thr0_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_23:
	.word	0x8780202b
	.word	0xf0bc63d0
	.word	0xbe16c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr0_User_Text_4v401_exit:
	EXIT_GOOD
Thr0_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v004 TEXT_VA=0x5fb000140000
attr_text {
	Name = .Thr0_User_Text_4v004 ,
	VA = 0x5fb000140000 ,/* 0x5fb000141fc0 */
	RA = 0x00e009a000 ,
	PA = 0x0ce009a000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005fb000140798 8000000ce009a080 */
	end_label   = Thr0_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v004_text_begin
Thr0_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x099, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_AS_IF_USER_SECONDARY_LITTLE_24:
	.word	0x87802019
	.word	0xe6f2e078
thr0_MMU_ASI_REAL_IO_25:
	.word	0x87802015
	.word	0xdcf46028
	.word	0xbe8420b8
	.word	0xf8dfc200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_AS_IF_USER_PRIMARY_26:
	.word	0x87802010
	.word	0xdcf42028
	.word	0xfcda9000
	nop
thr0_MMU_ASI_AS_IF_USER_PRIMARY_27:
	.word	0x87802010
	.word	0xd4f420f8
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x018, %i7
	P_LOAD_DDATA_IN
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v004_exit:
	EXIT_GOOD
Thr0_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v102 DATA_VA=0x61001d000000
attr_data {
	Name = .Thr0_User_Data_4v102 ,
	VA = 0x61001d000000 ,/* 0x61001d3fffc0 */
	RA = 0x01d6400000 ,
	PA = 0x0dd6400000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000061001d001286 8000000dd6400443 */
	end_label   = Thr0_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v102_data_begin
Thr0_User_Data_4v102_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v202 DATA_VA=0x6000001c0000
attr_data {
	Name = .Thr0_User_Data_4v202 ,
	VA = 0x6000001c0000 ,/* 0x6000001cffc0 */
	RA = 0x00d0230000 ,
	PA = 0x0cd0230000 ,
	TTE_Context = 0x098b ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006000001c098b 8000000cd0230041 */
	end_label   = Thr0_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v202_data_begin
Thr0_User_Data_4v202_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v005 TEXT_VA=0x61003b800000
attr_text {
	Name = .Thr0_User_Text_4v005 ,
	VA = 0x61003b800000 ,/* 0x61003bbfffc0 */
	RA = 0x01dd000000 ,
	PA = 0x0ddd000000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061003b801286 8000000ddd000083 */
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
	nop
	nop
	nop
	nop
	nop
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
	.word	0xd45d20f8
	DDEMAP_ALL
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr0_MMU_ASI_PRIMARY_28:
	.word	0x87802080
	.word	0xf6f0a078
	.word	0xe05e2148
	.word	0xc02c2411
	.word	0xc6742060
	.word	0xc02921dd
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	ITLB_TAG_READ
	IDEMAP_ALL
	.word	0xfe492a55
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x02a, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xea5e2070
	.word	0x1000000
	or	%g0, 0x2d8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1b8, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf872a068
	.word	0xc022a190
	.word	0xfcde1000
	.word	0x1000000
	or	%g0, 0x8, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe12c000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x18b, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xea5c2010
	.word	0xca742040
	.word	0xc070a810
	nop
	nop
thr0_MMU_ASI_BLK_COMMIT_P_29:
	.word	0x878020e0
	.word	0xc1bf21c0
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xda7720e0
	.word	0xc070a368
	.word	0xfe4e2c23
	.word	0xc032a170
	.word	0x1000000
	or	%g0, 0x1bc, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xf05c2038
	.word	0xbe842060
	.word	0xc19fde00
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
	.word	0x1000000
	or	%g0, 0x09b, %i7
	LOAD_DDATA_IN
	.word	0xe05f2138
	.word	0x1000000
	.word	0xbe15c000
	IDEMAP_PAGE
	DDEMAP_ALL_RPAGES
	DDEMAP_SCTX
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x01f, %i7
	LOAD_DDATA_IN
	.word	0xe0762088
	.word	0xc02d299c
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0762a70
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v005_exit:
	EXIT_GOOD
Thr0_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v006 TEXT_VA=0x5fb00010e000
attr_text {
	Name = .Thr0_User_Text_4v006 ,
	VA = 0x5fb00010e000 ,/* 0x5fb00010ffc0 */
	RA = 0x00e0104000 ,
	PA = 0x0ce0104000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005fb00010e798 8000000ce0104080 */
	end_label   = Thr0_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v006_text_begin
Thr0_User_Text_4v006_text_begin:
	wrpr	0, %gl
	P_ACCESS_ITSB_PTR
	nop
	.word	0xbe82a0a8
	.word	0xc8dfd000
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x478, %i7
	P_DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe178000
	P_IDEMAP_RPAGE
	nop
	nop
	.word	0xcc5d2018
	.word	0x1000000
	or	%g0, 0x188, %i7
	P_ITLB_TAG_READ
thr0_MMU_ASI_PRIMARY_30:
	.word	0x87802080
	.word	0xe8f0a0f8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe816010
	.word	0xc39fc2e0
	P_IDEMAP_ALL_PAGES
thr0_MMU_ASI_PRIMARY_31:
	.word	0x87802080
	.word	0xf0f520f8
	.word	0x1000000
	.word	0xbe10c000
	P_DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x320, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v006_exit:
	EXIT_GOOD
Thr0_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v103 DATA_VA=0x600000f90000
attr_data {
	Name = .Thr0_User_Data_4v103 ,
	VA = 0x600000f90000 ,/* 0x600000f9ffc0 */
	RA = 0x00d0df0000 ,
	PA = 0x0cd0df0000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000f91286 8000000cd0df0441 */
	end_label   = Thr0_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v103_data_begin
Thr0_User_Data_4v103_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v203 DATA_VA=0x5fb000088000
attr_data {
	Name = .Thr0_User_Data_4v203 ,
	VA = 0x5fb000088000 ,/* 0x5fb000089fc0 */
	RA = 0x00e0084000 ,
	PA = 0x0ce0084000 ,
	TTE_Context = 0x098b ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00005fb0000899a4 8000000ce0084040 */
	end_label   = Thr0_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v203_data_begin
Thr0_User_Data_4v203_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v007 TEXT_VA=0x5fb00019a000
attr_text {
	Name = .Thr0_User_Text_4v007 ,
	VA = 0x5fb00019a000 ,/* 0x5fb00019bfc0 */
	RA = 0x00e00d4000 ,
	PA = 0x0ce00d4000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005fb00019a798 8000000ce00d4080 */
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
	.word	0x1000000
	.word	0xbe128000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc4752068
	.word	0xc076a5d8
	.word	0xfc9c1c40
	.word	0x1000000
	or	%g0, 0x140, %i7
	ITLB_TAG_READ
	.word	0xfe5d2c00
	.word	0xfcda9000
thr0_MMU_ASI_PRIMARY_32:
	.word	0x87802080
	.word	0xecbeac80
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	READ_IDATA_ACCESS
	.word	0xe85f2038
	.word	0x1000000
	or	%g0, 0x650, %i7
	READ_DDATA_ACCESS
	.word	0xfcda9000
	.word	0xc03526e6
	nop
	ACCESS_DTSB_PTR
	.word	0xe2762040
	.word	0xc0742c80
	.word	0x1000000
	or	%g0, 0x7d8, %i7
	READ_DDATA_ACCESS
thr0_MMU_ASI_PRIMARY_33:
	.word	0x87802080
	.word	0xf8f52038
	.word	0xbe13c000
	GOTO_SUPERVISOR0
thr0_MMU_ASI_PRIMARY_LITTLE_34:
	.word	0x87802088
	.word	0xe2f52010
	.word	0xc02aa170
	.word	0xc070a628
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8120c8
	.word	0xf0dfd000
	.word	0xc0352fda
	IDEMAP_NCTX
	DDEMAP_PCTX
thr0_MMU_ASI_SECONDARY_35:
	.word	0x87802081
	.word	0xd6f16010
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xee76a140
	.word	0xc02e2c8a
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe130000
	IDEMAP_PAGE
	.word	0xc0762b20
	.word	0xfa712100
	.word	0xc032a1b8
	.word	0x1000000
	or	%g0, 0x184, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe134000
	IDEMAP_PAGE
	.word	0x1000000
	.word	0xbe144000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xe05aa088
	.word	0x1000000
	or	%g0, 0x057, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x178, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x668, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_36:
	.word	0x87802080
	.word	0xf2f52100
	.word	0xf45d2160
thr0_MMU_ASI_PRIMARY_37:
	.word	0x87802080
	.word	0xf2f62050
	DO_BRANCH
	.word	0x81c5e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe46a9f8
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v007_exit:
	EXIT_GOOD
Thr0_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v008 TEXT_VA=0x5fb0001ac000
attr_text {
	Name = .Thr0_User_Text_4v008 ,
	VA = 0x5fb0001ac000 ,/* 0x5fb0001adfc0 */
	RA = 0x00e0024000 ,
	PA = 0x0ce0024000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005fb0001ac798 8000000ce0024080 */
	end_label   = Thr0_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v008_text_begin
Thr0_User_Text_4v008_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_38:
	.word	0x87802080
	.word	0xc6f6a000
	.word	0xfcda9000
	P_TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe14c000
	P_IDEMAP_PAGE
	.word	0xbe82a088
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x768, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe82a088
	.word	0xe8dfc200
	.word	0x1000000
	or	%g0, 0x4e0, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v008_exit:
	EXIT_GOOD
Thr0_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v104 DATA_VA=0x5fb000002000
attr_data {
	Name = .Thr0_User_Data_4v104 ,
	VA = 0x5fb000002000 ,/* 0x5fb000003fc0 */
	RA = 0x00e01cc000 ,
	PA = 0x0ce01cc000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005fb000002798 8000000ce01cc440 */
	end_label   = Thr0_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v104_data_begin
Thr0_User_Data_4v104_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v009 TEXT_VA=0x610022400000
attr_text {
	Name = .Thr0_User_Text_4v009 ,
	VA = 0x610022400000 ,/* 0x6100227fffc0 */
	RA = 0x01de000000 ,
	PA = 0x0dde000000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000610022401286 8000000dde000083 */
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
	or	%g0, 0x70d, %i7
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
	nop
	nop
	.word	0x1000000
	or	%g0, 0x049, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe114000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x013, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82e010
	.word	0xcadfd020
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0xca72a010
	.word	0xc072abf8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_BLK_P_39:
	.word	0x878020f0
	.word	0xe3bd2d00
	.word	0xbe816010
	.word	0xe19fde20
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_PCTX
	.word	0xc02aa1fd
	TOGGLE_LSU_IM
	IDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x3a8, %i7
	DTLB_TAG_READ
thr0_MMU_ASI_PRIMARY_40:
	.word	0x87802080
	.word	0xf2f420f0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x59e, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe16c000
	DDEMAP_RPAGE
	nop
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_41:
	.word	0x87802080
	.word	0xe4f52020
	.word	0xfe4d2c0a
	.word	0xfa752000
	.word	0xc070a170
thr0_MMU_ASI_PRIMARY_42:
	.word	0x87802080
	.word	0xdef2a080
	.word	0xea5f2010
	.word	0xc39f1f00
	ACCESS_DTSB_PTR
	.word	0xd6752010
	.word	0xc021231c
	IDEMAP_NCTX
	.word	0xe05d2168
	IDEMAP_PCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xca5e2090
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v009_exit:
	EXIT_GOOD
Thr0_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v105 DATA_VA=0x5fb000132000
attr_data {
	Name = .Thr0_User_Data_4v105 ,
	VA = 0x5fb000132000 ,/* 0x5fb000133fc0 */
	RA = 0x00e002c000 ,
	PA = 0x0ce002c000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005fb000132798 8000000ce002c440 */
	end_label   = Thr0_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v105_data_begin
Thr0_User_Data_4v105_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00a TEXT_VA=0x5fb000070000
attr_text {
	Name = .Thr0_User_Text_4v00a ,
	VA = 0x5fb000070000 ,/* 0x5fb000071fc0 */
	RA = 0x00e00a8000 ,
	PA = 0x0ce00a8000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005fb000070798 8000000ce00a8080 */
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
	or	%g0, 0xe0, %i7
	ITLB_TAG_READ
	.word	0xfcda9000
thr0_MMU_ASI_BLK_P_43:
	.word	0x878020f0
	.word	0xe1bf2e80
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
	nop
	nop
thr0_MMU_ASI_PRIMARY_44:
	.word	0x87802080
	.word	0xd4f620d8
	.word	0xf458a0a8
	.word	0xc19d5e20
	.word	0xcc5e2048
	nop
	nop
	nop
	IDEMAP_ALL
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc872a088
	.word	0xc02f295e
	nop
	nop
	.word	0xbe862068
	.word	0xe0dfd000
	.word	0xfc9d1100
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
	.word	0xe05e20a8
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x023, %i7
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
	.word	0x1000000
	or	%g0, 0x488, %i7
	ITLB_TAG_READ
	nop
	nop
	.word	0xfe452e14
	.word	0xc458a068
	nop
	nop
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe42ad4c
	.word	0x81c66000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00a_exit:
	EXIT_GOOD
Thr0_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v106 DATA_VA=0x5fb00004c000
attr_data {
	Name = .Thr0_User_Data_4v106 ,
	VA = 0x5fb00004c000 ,/* 0x5fb00004dfc0 */
	RA = 0x00e01dc000 ,
	PA = 0x0ce01dc000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005fb00004c798 8000000ce01dc440 */
	end_label   = Thr0_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v106_data_begin
Thr0_User_Data_4v106_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00b TEXT_VA=0x600000dc0000
attr_text {
	Name = .Thr0_User_Text_4v00b ,
	VA = 0x600000dc0000 ,/* 0x600000dcffc0 */
	RA = 0x00d0530000 ,
	PA = 0x0cd0530000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000dc1286 8000000cd0530081 */
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
	or	%g0, 0x1d7, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x490, %i7
	ITLB_TAG_READ
	.word	0xc0252eb4
	.word	0xfe5721a8
thr0_MMU_ASI_PRIMARY_45:
	.word	0x87802080
	.word	0xf4f42008
	.word	0xbe86a0a8
	.word	0xe0dfd000
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x01c, %i7
	LOAD_DDATA_IN
	.word	0xc0212df8
	.word	0x1000000
	or	%g0, 0x530, %i7
	ITLB_TAG_READ
	.word	0xfa742120
	.word	0xc02927f7
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4aafa3
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v00b_exit:
	EXIT_GOOD
Thr0_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v107 DATA_VA=0x5fb0000e8000
attr_data {
	Name = .Thr0_User_Data_4v107 ,
	VA = 0x5fb0000e8000 ,/* 0x5fb0000e9fc0 */
	RA = 0x00e00fa000 ,
	PA = 0x0ce00fa000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005fb0000e8798 8000000ce00fa440 */
	end_label   = Thr0_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v107_data_begin
Thr0_User_Data_4v107_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00c TEXT_VA=0x600000390000
attr_text {
	Name = .Thr0_User_Text_4v00c ,
	VA = 0x600000390000 ,/* 0x60000039ffc0 */
	RA = 0x00d0fb0000 ,
	PA = 0x0cd0fb0000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000391286 8000000cd0fb0081 */
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
	IDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4d, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0x1000000
	or	%g0, 0x62e, %i7
	LOAD_DDATA_ACCESS
	nop
	.word	0xe3995f20
	.word	0xfe492393
	nop
	nop
	.word	0x1000000
	.word	0xbe170000
	DDEMAP_PAGE
	nop
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	.word	0xc02923bc
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
	DTLB_TAG_READ
	DDEMAP_PCTX
	.word	0xf85c2148
	.word	0xbe82a038
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x588, %i7
	ITLB_TAG_READ
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
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xd2772000
	.word	0xc02e29c5
	.word	0xc85c20d8
	.word	0xd8762018
	.word	0xc032a170
	nop
	.word	0x1000000
	or	%g0, 0x59b, %i7
	LOAD_IDATA_ACCESS
	.word	0xd072a028
	.word	0xc0242ba8
thr0_MMU_ASI_PRIMARY_46:
	.word	0x87802080
	.word	0xcaf2a070
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x028, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x743, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x98, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x540, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe118000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf87420a8
	.word	0xc02aa3bf
	.word	0xd6742010
	.word	0xc030a85c
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x5b8, %i7
	DTLB_TAG_READ
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
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe108000
	DDEMAP_PAGE
thr0_MMU_ASI_PRIMARY_47:
	.word	0x87802080
	.word	0xe0f42088
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4f256e
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00c_exit:
	EXIT_GOOD
Thr0_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v108 DATA_VA=0x610036800000
attr_data {
	Name = .Thr0_User_Data_4v108 ,
	VA = 0x610036800000 ,/* 0x610036bfffc0 */
	RA = 0x01d0800000 ,
	PA = 0x0dd0800000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000610036801286 8000000dd0800443 */
	end_label   = Thr0_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v108_data_begin
Thr0_User_Data_4v108_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00d TEXT_VA=0x610037800000
attr_text {
	Name = .Thr0_User_Text_4v00d ,
	VA = 0x610037800000 ,/* 0x610037bfffc0 */
	RA = 0x01dc800000 ,
	PA = 0x0ddc800000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000610037801286 8000000ddc800083 */
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
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	.word	0xc0342170
	.word	0xfe412a24
	.word	0x1000000
	or	%g0, 0x7b8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x540, %i7
	LOAD_DDATA_ACCESS
	.word	0xca762010
	.word	0xc070aac8
	.word	0x1000000
	.word	0xbe14c000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x5e8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x558, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c5e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe17c000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x069, %i7
	LOAD_IDATA_IN
	.word	0xbe8520a8
	.word	0xd4dfd000
	.word	0xf272a120
	.word	0xc070a238
	DDEMAP_ALL_RPAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe2772040
	.word	0xc02f2dd2
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00d_exit:
	EXIT_GOOD
Thr0_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v109 DATA_VA=0x5fb0001c0000
attr_data {
	Name = .Thr0_User_Data_4v109 ,
	VA = 0x5fb0001c0000 ,/* 0x5fb0001c1fc0 */
	RA = 0x00e019e000 ,
	PA = 0x0ce019e000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005fb0001c0798 8000000ce019e440 */
	end_label   = Thr0_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v109_data_begin
Thr0_User_Data_4v109_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00e TEXT_VA=0x5fb000090000
attr_text {
	Name = .Thr0_User_Text_4v00e ,
	VA = 0x5fb000090000 ,/* 0x5fb000091fc0 */
	RA = 0x00e0096000 ,
	PA = 0x0ce0096000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005fb000090798 8000000ce0096080 */
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
thr0_MMU_ASI_PRIMARY_48:
	.word	0x87802080
	.word	0xc8f2a068
	.word	0xc0742538
	.word	0xfc995d60
	.word	0x1000000
	or	%g0, 0x700, %i7
	READ_DDATA_ACCESS
	.word	0xfc9d5120
	nop
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd65c2040
	.word	0xc02c240a
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
thr0_MMU_ASI_SECONDARY_49:
	.word	0x87802081
	.word	0xfaf16100
	nop
thr0_MMU_ASI_PRIMARY_50:
	.word	0x87802080
	.word	0xe0f620a8
thr0_MMU_ASI_PRIMARY_51:
	.word	0x87802080
	.word	0xf6f72000
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xda752000
	.word	0xc0342498
	IDEMAP_ALL_RPAGES
	.word	0xfe452c50
	.word	0xfcde1000
	DDEMAP_NCTX
	TOGGLE_LSU_DM
	IDEMAP_PCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5625c2
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00e_exit:
	EXIT_GOOD
Thr0_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10a DATA_VA=0x5fb0000be000
attr_data {
	Name = .Thr0_User_Data_4v10a ,
	VA = 0x5fb0000be000 ,/* 0x5fb0000bffc0 */
	RA = 0x00e01b6000 ,
	PA = 0x0ce01b6000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005fb0000be798 8000000ce01b6440 */
	end_label   = Thr0_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10a_data_begin
Thr0_User_Data_4v10a_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00f TEXT_VA=0x600000af0000
attr_text {
	Name = .Thr0_User_Text_4v00f ,
	VA = 0x600000af0000 ,/* 0x600000afffc0 */
	RA = 0x00d0720000 ,
	PA = 0x0cd0720000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000af1286 8000000cd0720081 */
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
	.word	0xfc9add60
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe552edc
	.word	0xfe5c2868
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe118000
	DDEMAP_PAGE
	IDEMAP_NCTX
	.word	0xbe872108
	.word	0xe8dfd000
	.word	0x1000000
	or	%g0, 0x120, %i7
	ITLB_TAG_READ
	.word	0xcc752018
	.word	0xc0362182
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x026, %i7
	LOAD_DDATA_IN
	.word	0xc030a73e
	.word	0xe85e2108
	.word	0x1000000
	or	%g0, 0x02b, %i7
	LOAD_DDATA_IN
	.word	0xd47620e8
	.word	0xc0212e58
	.word	0x1000000
	.word	0xbe140000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x063, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x588, %i7
	READ_DDATA_ACCESS
	.word	0xc39a9f00
	.word	0xc0352324
	nop
	DO_BRANCH
	.word	0x81c5e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc032a4c6
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	ITLB_TAG_READ
	nop
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	READ_DDATA_ACCESS
thr0_MMU_ASI_PRIMARY_52:
	.word	0x87802080
	.word	0xc0bc2170
	.word	0xf4762038
	.word	0xc034273e
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe05f20d8
	DDEMAP_SCTX
	.word	0xc032a776
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0xf076a068
	.word	0xc0712cc0
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00f_exit:
	EXIT_GOOD
Thr0_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10b DATA_VA=0x5fb0000f6000
attr_data {
	Name = .Thr0_User_Data_4v10b ,
	VA = 0x5fb0000f6000 ,/* 0x5fb0000f7fc0 */
	RA = 0x00e01d8000 ,
	PA = 0x0ce01d8000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005fb0000f6798 8000000ce01d8440 */
	end_label   = Thr0_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10b_data_begin
Thr0_User_Data_4v10b_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v010 TEXT_VA=0x610017800000
attr_text {
	Name = .Thr0_User_Text_4v010 ,
	VA = 0x610017800000 ,/* 0x610017bfffc0 */
	RA = 0x01da000000 ,
	PA = 0x0dda000000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000610017801286 8000000dda000083 */
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
	.word	0xbe154000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x45d, %i7
	LOAD_DDATA_ACCESS
	.word	0xe070a068
	.word	0xc0312fe2
	.word	0xfe5e2d50
	.word	0xc0712170
	nop
	nop
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x89, %i7
	LOAD_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xd45c20e8
	.word	0xc0742170
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x138, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xbe812038
	.word	0xe0dfd000
	.word	0xc02d291d
	IDEMAP_PCTX
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5624e4
	.word	0xfe4c2330
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x2d8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x57c, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe812008
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
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x71, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x460, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe5f26c8
	.word	0x1000000
	or	%g0, 0x27, %i7
	LOAD_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xfe5e2588
	.word	0xd458a088
	.word	0xd276a100
	.word	0xc02aaec2
	.word	0x1000000
	or	%g0, 0x330, %i7
	READ_DDATA_ACCESS
thr0_MMU_ASI_PRIMARY_LITTLE_53:
	.word	0x87802088
	.word	0xe0baa870
	.word	0x1000000
	or	%g0, 0x10, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x08b, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x0a7, %i7
	LOAD_DDATA_IN
	.word	0xbe86a0f8
	.word	0xf0dfd000
	DDEMAP_ALL
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc02f2a20
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v010_exit:
	EXIT_GOOD
Thr0_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10c DATA_VA=0x5fb000054000
attr_data {
	Name = .Thr0_User_Data_4v10c ,
	VA = 0x5fb000054000 ,/* 0x5fb000055fc0 */
	RA = 0x00e01b8000 ,
	PA = 0x0ce01b8000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005fb000054798 8000000ce01b8440 */
	end_label   = Thr0_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10c_data_begin
Thr0_User_Data_4v10c_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v011 TEXT_VA=0x5fb000012000
attr_text {
	Name = .Thr0_User_Text_4v011 ,
	VA = 0x5fb000012000 ,/* 0x5fb000013fc0 */
	RA = 0x00e007a000 ,
	PA = 0x0ce007a000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005fb000012798 8000000ce007a080 */
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
	DDEMAP_ALL
	.word	0xdc752028
	.word	0xc02524d4
	.word	0xda72a130
	.word	0xc02423a0
	.word	0x1000000
	or	%g0, 0x4f, %i7
	LOAD_IDATA_ACCESS
thr0_MMU_ASI_PRIMARY_54:
	.word	0x87802080
	.word	0xf0f2a068
	.word	0xfe5e2288
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x42c, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0xa8, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc85d2068
	.word	0xfe542e0a
	.word	0xbe812068
	.word	0xe8dfd000
	.word	0xc028a3ae
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x145, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_PCTX
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc0742d28
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v011_exit:
	EXIT_GOOD
Thr0_User_Text_4v011_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10d DATA_VA=0x61003cc00000
attr_data {
	Name = .Thr0_User_Data_4v10d ,
	VA = 0x61003cc00000 ,/* 0x61003cffffc0 */
	RA = 0x01da400000 ,
	PA = 0x0dda400000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000061003cc01286 8000000dda400443 */
	end_label   = Thr0_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10d_data_begin
Thr0_User_Data_4v10d_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v012 TEXT_VA=0x600000e60000
attr_text {
	Name = .Thr0_User_Text_4v012 ,
	VA = 0x600000e60000 ,/* 0x600000e6ffc0 */
	RA = 0x00d0cc0000 ,
	PA = 0x0cd0cc0000 ,
	TTE_Context = 0x1286 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000e61286 8000000cd0cc0081 */
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
	or	%g0, 0x4e0, %i7
	ITLB_TAG_READ
	.word	0xfe5aa220
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	.word	0xd8592018
	TOGGLE_LSU_IM
	.word	0xfe5aa088
	.word	0x1000000
	or	%g0, 0x2b0, %i7
	DTLB_TAG_READ
	.word	0xbe862088
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
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd45d20e8
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v012_exit:
	EXIT_GOOD
Thr0_User_Text_4v012_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10e DATA_VA=0x600000940000
attr_data {
	Name = .Thr0_User_Data_4v10e ,
	VA = 0x600000940000 ,/* 0x60000094ffc0 */
	RA = 0x00d0650000 ,
	PA = 0x0cd0650000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000941286 8000000cd0650441 */
	end_label   = Thr0_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10e_data_begin
Thr0_User_Data_4v10e_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10f DATA_VA=0x5fb000142000
attr_data {
	Name = .Thr0_User_Data_4v10f ,
	VA = 0x5fb000142000 ,/* 0x5fb000143fc0 */
	RA = 0x00e01ce000 ,
	PA = 0x0ce01ce000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005fb000142798 8000000ce01ce440 */
	end_label   = Thr0_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10f_data_begin
Thr0_User_Data_4v10f_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v110 DATA_VA=0x5fb000100000
attr_data {
	Name = .Thr0_User_Data_4v110 ,
	VA = 0x5fb000100000 ,/* 0x5fb000101fc0 */
	RA = 0x00e0126000 ,
	PA = 0x0ce0126000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005fb000100798 8000000ce0126440 */
	end_label   = Thr0_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v110_data_begin
Thr0_User_Data_4v110_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v111 DATA_VA=0x61003e400000
attr_data {
	Name = .Thr0_User_Data_4v111 ,
	VA = 0x61003e400000 ,/* 0x61003e7fffc0 */
	RA = 0x01d5c00000 ,
	PA = 0x0dd5c00000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000061003e401286 8000000dd5c00443 */
	end_label   = Thr0_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v111_data_begin
Thr0_User_Data_4v111_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v112 DATA_VA=0x600000a40000
attr_data {
	Name = .Thr0_User_Data_4v112 ,
	VA = 0x600000a40000 ,/* 0x600000a4ffc0 */
	RA = 0x00d0b30000 ,
	PA = 0x0cd0b30000 ,
	TTE_Context = 0x1286 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000a41286 8000000cd0b30441 */
	end_label   = Thr0_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v112_data_begin
Thr0_User_Data_4v112_data_begin:
	.xword	0x600000b20000
	.xword	0x6000004c0000
	.xword	0x610000400000
	.xword	0x6000007e0000
	.xword	0x600000050000
	.xword	0x5fb000126000
	.xword	0x61002e000000
	.xword	0x61001a800000
	.xword	0x5fb0000f4000
	.xword	0x5fb0000ca000
	.xword	0x610019000000
	.xword	0x61000d800000
	.xword	0x5fb000140000
	.xword	0x61001d000000
	.xword	0x6000001c0000
	.xword	0x61003b800000
	.xword	0x5fb00010e000
	.xword	0x600000f90000
	.xword	0x5fb000088000
	.xword	0x5fb00019a000
	.xword	0x5fb0001ac000
	.xword	0x5fb000002000
	.xword	0x610022400000
	.xword	0x5fb000132000
	.xword	0x5fb000070000
	.xword	0x5fb00004c000
	.xword	0x600000dc0000
	.xword	0x5fb0000e8000
	.xword	0x600000390000
	.xword	0x610036800000
	.xword	0x610037800000
	.xword	0x5fb0001c0000
	.xword	0x5fb000090000
	.xword	0x5fb0000be000
	.xword	0x600000af0000
	.xword	0x5fb0000f6000
	.xword	0x610017800000
	.xword	0x5fb000054000
	.xword	0x5fb000012000
	.xword	0x61003cc00000
	.xword	0x600000e60000
	.xword	0x600000940000
	.xword	0x5fb000142000
	.xword	0x5fb000100000
	.xword	0x61003e400000
	.xword	0x600000a40000
Thr0_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x640000550000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	VA = 0x640000550000 ,/* 0x64000055ffc0 */
	RA = 0x0160160000 ,
	PA = 0x1d60160000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000640000550c20 8000001d60160081 */
	end_label   = Thr1_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr1_user_code_entry
Thr1_user_code_entry:
	setx	0x63c00017c000, %g1, %g2
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
	nop
	nop
	.word	0x1000000
	or	%g0, 0x458, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe110000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x073, %i7
	LOAD_DDATA_IN
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf25f6068
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xd6776010
	.word	0xc032a768
	.word	0x1000000
	or	%g0, 0x50, %i7
	READ_DDATA_ACCESS
	ACCESS_DTSB_PTR
	IDEMAP_PCTX
	ACCESS_DTSB_PTR
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe140000
	IDEMAP_RPAGE
	.word	0xf07420b8
	.word	0xc076e390
	.word	0x1000000
	or	%g0, 0x188, %i7
	ITLB_TAG_READ
	.word	0xfc9c1d40
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr1_MMU_ASI_BLK_COMMIT_P_55:
	.word	0x878020e0
	.word	0xe3bf6bc0
	.word	0xd65da040
	.word	0xfcde5000
	.word	0xbe82a098
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe12c000
	DDEMAP_PAGE
	DDEMAP_PCTX
	.word	0xfe4da128
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
	or	%g0, 0x59b, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4da888
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v000_exit:
	EXIT_GOOD
Thr1_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v100 DATA_VA=0x63c00017c000
attr_data {
	Name = .Thr1_User_Data_4v100 ,
	VA = 0x63c00017c000 ,/* 0x63c00017dfc0 */
	RA = 0x00f01e0000 ,
	PA = 0x00f01e0000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063c00017cc20 80000000f01e0040 */
	end_label   = Thr1_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v100_data_begin
Thr1_User_Data_4v100_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v200 DATA_VA=0x65000dc00000
attr_data {
	Name = .Thr1_User_Data_4v200 ,
	VA = 0x65000dc00000 ,/* 0x65000dffffc0 */
	RA = 0x01e9400000 ,
	PA = 0x1de9400000 ,
	TTE_Context = 0x0ba9 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000065000dc01f94 8000001de9400443 */
	end_label   = Thr1_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v200_data_begin
Thr1_User_Data_4v200_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v300 DATA_VA=0x63c00010a000
attr_data {
	Name = .Thr1_User_Data_4v300 ,
	VA = 0x63c00010a000 ,/* 0x63c00010bfc0 */
	RA = 0x00f006a000 ,
	PA = 0x00f006a000 ,
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
	/* DTTE_TAG_DATA = 000063c00010a000 80000000f006a440 */
	end_label   = Thr1_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v300_data_begin
Thr1_User_Data_4v300_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v001 TEXT_VA=0x650033800000
attr_text {
	Name = .Thr1_User_Text_4v001 ,
	VA = 0x650033800000 ,/* 0x650033bfffc0 */
	RA = 0x01ef400000 ,
	PA = 0x1def400000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000065003380155b 8000001def400083 */
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_PRIMARY_LITTLE_56:
	.word	0x87802088
	.word	0xdcb8a290
	.word	0xbe82a120
	.word	0xf6dfd000
	.word	0xfe56667c
	.word	0xfcd91000
	ACCESS_DTSB_PTR
thr1_MMU_ASI_PRIMARY_57:
	.word	0x87802080
	.word	0xf6f42038
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xbe86e0d0
	.word	0xf6dfd000
	.word	0x1000000
	or	%g0, 0x330, %i7
	READ_DDATA_ACCESS
	.word	0xfc9e5d40
	DDEMAP_SCTX
	.word	0xfe5e6478
	.word	0xc025a140
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
	TOGGLE_LSU_IM
	.word	0xc028ac24
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	READ_IDATA_ACCESS
	.word	0xc02dabee
	.word	0xc075a1e8
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe4c25c2
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x090, %i7
	LOAD_DDATA_IN
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe4da2a5
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v001_exit:
	EXIT_GOOD
Thr1_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v400 TEXT_VA=0x640000660000
attr_text {
	Name = .Thr1_User_Text_4v400 ,
	VA = 0x640000660000 ,/* 0x64000066ffc0 */
	RA = 0x0160c40000 ,
	PA = 0x0160c40000 ,
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
	/* ITTE_TAG_DATA = 0000640000660000 8000000160c40481 */
	end_label   = Thr1_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v400_text_begin
Thr1_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x04f, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcd95060
	.word	0xe2732010
	.word	0xc029a670
	nop
	nop
	nop
	nop
	nop
	.word	0xe8732028
	.word	0xc029a39c
	.word	0xbe816010
	.word	0xe39fde20
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xbe8760e0
	.word	0xd4dfc200
thr1_MMU_ASI_SECONDARY_58:
	.word	0x87802081
	.word	0xc8baec50
thr1_MMU_ASI_PRIMARY_59:
	.word	0x87802080
	.word	0xf0f2a080
	.word	0xca59a010
	.word	0x1000000
	or	%g0, 0x98, %i7
	P_READ_IDATA_ACCESS
	.word	0xfcd90380
thr1_MMU_ASI_BLK_S_60:
	.word	0x878020f1
	.word	0xc3b96f40
	.word	0xfe41adec
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v400_exit:
	EXIT_GOOD
Thr1_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v002 TEXT_VA=0x660ce0000000
attr_text {
	Name = .Thr1_User_Text_4v002 ,
	VA = 0x660ce0000000 ,/* 0x660cefffffc0 */
	RA = 0x0390000000 ,
	PA = 0x1f90000000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_0 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 0000660ce0000c20 8000001f90000085 */
	end_label   = Thr1_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v002_text_begin
Thr1_User_Text_4v002_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8420d0
	.word	0xf2dfc200
	.word	0x1000000
	or	%g0, 0x5c7, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcdad020
	P_DDEMAP_PCTX
	P_IDEMAP_PCTX
	.word	0xd85f6048
	nop
	nop
	nop
	nop
	.word	0xbe82a120
	.word	0xe0dfd000
	.word	0xfcdf5000
thr1_MMU_ASI_REAL_IO_LITTLE_61:
	.word	0x8780201d
	.word	0xdef12118
	P_TOGGLE_LSU_IM
	.word	0xfe412f84
	nop
	.word	0xd45c2110
	P_IDEMAP_ALL_PAGES
	.word	0xbe816070
	.word	0xe2dfd060
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe124000
	P_IDEMAP_PAGE
	P_DDEMAP_NCTX
	.word	0xc020a3d4
	.word	0xfc9d9100
	P_TOGGLE_LSU_IM
	.word	0xd45e6098
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe48a9cb
	P_TOGGLE_LSU_DM
	P_ACCESS_ITSB_PTR
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v002_exit:
	EXIT_GOOD
Thr1_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v101 DATA_VA=0x63c000106000
attr_data {
	Name = .Thr1_User_Data_4v101 ,
	VA = 0x63c000106000 ,/* 0x63c000107fc0 */
	RA = 0x00f000e000 ,
	PA = 0x00f000e000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063c000106c20 80000000f000e040 */
	end_label   = Thr1_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v101_data_begin
Thr1_User_Data_4v101_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v201 DATA_VA=0x63c000050000
attr_data {
	Name = .Thr1_User_Data_4v201 ,
	VA = 0x63c000050000 ,/* 0x63c000051fc0 */
	RA = 0x00f01f0000 ,
	PA = 0x00f01f0000 ,
	TTE_Context = 0x0ba9 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000063c000050ba9 80000000f01f0440 */
	end_label   = Thr1_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v201_data_begin
Thr1_User_Data_4v201_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v301 DATA_VA=0x650029000000
attr_data {
	Name = .Thr1_User_Data_4v301 ,
	VA = 0x650029000000 ,/* 0x6500293fffc0 */
	RA = 0x01e4400000 ,
	PA = 0x1de4400000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_2 ,
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
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 0000650029000000 8000001de4400443 */
	end_label   = Thr1_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v301_data_begin
Thr1_User_Data_4v301_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v003 TEXT_VA=0x63c000000000
attr_text {
	Name = .Thr1_User_Text_4v003 ,
	VA = 0x63c000000000 ,/* 0x63c000001fc0 */
	RA = 0x00f01f8000 ,
	PA = 0x00f01f8000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063c000000c20 80000000f01f8080 */
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
	.word	0xc0266d28
thr1_MMU_ASI_BLK_P_62:
	.word	0x878020f0
	.word	0xc1bf6c40
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x18, %i7
	ITLB_TAG_READ
	ACCESS_ITSB_PTR
	TOGGLE_LSU_DM
	TOGGLE_LSU_IM
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x064, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x178, %i7
	ITLB_TAG_READ
	.word	0xfcda9000
	nop
	nop
	nop
	.word	0xe19d9f00
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x1dd, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe42acd4
	.word	0xfe5da048
	.word	0xfcdf5000
	IDEMAP_PCTX
	TOGGLE_LSU_IM
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x081, %i7
	LOAD_DDATA_IN
	.word	0xfa5aa0c0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5dac48
	DDEMAP_ALL_RPAGES
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
	.word	0xfe5c2580
	.word	0xbe13c000
	GOTO_SUPERVISOR0
thr1_MMU_ASI_PRIMARY_63:
	.word	0x87802080
	.word	0xfaf6e100
	.word	0xc02aaf03
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	nop
	nop
	nop
	.word	0xfcde5000
	.word	0xe45aa048
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5e7, %i7
	LOAD_IDATA_ACCESS
	.word	0xf65c2100
	TOGGLE_LSU_DM
	.word	0xc03125da
thr1_MMU_ASI_SECONDARY_64:
	.word	0x87802081
	.word	0xc4b96520
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe11c000
	IDEMAP_PAGE
	DDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_SCTX
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_PRIMARY_65:
	.word	0x87802080
	.word	0xdef66128
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_RPAGE
	.word	0xd475a068
	.word	0xc0276d40
	.word	0xfe5e67d0
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc075a478
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v003_exit:
	EXIT_GOOD
Thr1_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v401 TEXT_VA=0x63c0000a8000
attr_text {
	Name = .Thr1_User_Text_4v401 ,
	VA = 0x63c0000a8000 ,/* 0x63c0000a9fc0 */
	RA = 0x00f0052000 ,
	PA = 0x00f0052000 ,
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
	/* ITTE_TAG_DATA = 000063c0000a8000 80000000f0052480 */
	end_label   = Thr1_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v401_text_begin
Thr1_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	P_DTLB_TAG_READ
	.word	0xfc991c40
	P_TOGGLE_LSU_IM
thr1_MMU_ASI_REAL_IO_LITTLE_66:
	.word	0x8780201d
	.word	0xd8f6e0a0
	.word	0xfcdc82a0
	.word	0xee732018
	.word	0xc031ad48
	.word	0x1000000
	or	%g0, 0x007, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x2f5, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcdec200
	nop
thr1_MMU_ASI_AS_IF_USER_PRIMARY_67:
	.word	0x87802010
	.word	0xdef42118
thr1_MMU_ASI_AS_IF_USER_PRIMARY_68:
	.word	0x87802010
	.word	0xc6f760e8
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_SCTX
	P_TOGGLE_LSU_DM
	.word	0xbe8660c0
	.word	0xecdfd000
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	P_DTLB_TAG_READ
	.word	0xfcd89000
	.word	0xbe866138
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x1ce, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x592, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe872120
	.word	0xd8dfc2a0
	.word	0xfcdc1000
	.word	0xbe82a098
	.word	0xecdfc200
	.word	0xc02ca5c6
	.word	0xf259a098
	.word	0x1000000
	.word	0xbe124000
	P_IDEMAP_RPAGE
thr1_MMU_ASI_REAL_IO_69:
	.word	0x87802015
	.word	0xdcf52058
	P_DDEMAP_ALL_RPAGES
thr1_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_70:
	.word	0x87802018
	.word	0xcef2a0c8
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe154000
	P_DDEMAP_PAGE
	.word	0xd874a048
	.word	0xc021a920
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
	.word	0xfcd94380
	.word	0xbe812038
	.word	0xfadfd000
	.word	0xbe8120e0
	.word	0xf6dfc200
	nop
	nop
	nop
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v401_exit:
	EXIT_GOOD
Thr1_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v004 TEXT_VA=0x63c000024000
attr_text {
	Name = .Thr1_User_Text_4v004 ,
	VA = 0x63c000024000 ,/* 0x63c000025fc0 */
	RA = 0x00f0002000 ,
	PA = 0x00f0002000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063c000024c20 80000000f0002080 */
	end_label   = Thr1_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v004_text_begin
Thr1_User_Text_4v004_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_DM
	.word	0xfcde4200
	P_DDEMAP_ALL_PAGES
thr1_MMU_ASI_SECONDARY_LITTLE_71:
	.word	0x87802089
	.word	0xecb969d0
	.word	0xfcd95160
	.word	0x1000000
	or	%g0, 0x468, %i7
	P_READ_DDATA_ACCESS
	.word	0xd45c20b0
	.word	0xf072a050
	.word	0xc070a140
thr1_MMU_ASI_PRIMARY_72:
	.word	0x87802080
	.word	0xd2f66118
thr1_MMU_ASI_BLK_S_73:
	.word	0x878020f1
	.word	0xc3b96d00
	.word	0xfcdc1000
	.word	0xbe842098
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	P_DTLB_TAG_READ
	.word	0xfcda8200
	.word	0xfcda9000
	.word	0xbe86e038
	.word	0xf6dfd000
thr1_MMU_ASI_AS_IF_USER_PRIMARY_74:
	.word	0x87802010
	.word	0xf2f42120
	.word	0xbe86e008
	.word	0xc8dfd000
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
thr1_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_75:
	.word	0x87802018
	.word	0xf6f5a0c0
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	nop
	nop
	nop
	.word	0xc03769fe
	nop
	nop
	nop
	nop
	P_DDEMAP_PCTX
	.word	0xbe85a0c0
	.word	0xd4dfc200
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v004_exit:
	EXIT_GOOD
Thr1_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v102 DATA_VA=0x640000fb0000
attr_data {
	Name = .Thr1_User_Data_4v102 ,
	VA = 0x640000fb0000 ,/* 0x640000fbffc0 */
	RA = 0x0160cb0000 ,
	PA = 0x1d60cb0000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000fb0c20 8000001d60cb0041 */
	end_label   = Thr1_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v102_data_begin
Thr1_User_Data_4v102_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v202 DATA_VA=0x650002c00000
attr_data {
	Name = .Thr1_User_Data_4v202 ,
	VA = 0x650002c00000 ,/* 0x650002ffffc0 */
	RA = 0x01e3000000 ,
	PA = 0x1de3000000 ,
	TTE_Context = 0x0ba9 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000650002c01f94 8000001de3000443 */
	end_label   = Thr1_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v202_data_begin
Thr1_User_Data_4v202_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v302 DATA_VA=0x650014800000
attr_data {
	Name = .Thr1_User_Data_4v302 ,
	VA = 0x650014800000 ,/* 0x650014bfffc0 */
	RA = 0x01e2c00000 ,
	PA = 0x1de2c00000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_2 ,
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
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 0000650014800000 8000001de2c00443 */
	end_label   = Thr1_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v302_data_begin
Thr1_User_Data_4v302_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v005 TEXT_VA=0x63c000038000
attr_text {
	Name = .Thr1_User_Text_4v005 ,
	VA = 0x63c000038000 ,/* 0x63c000039fc0 */
	RA = 0x00f0144000 ,
	PA = 0x00f0144000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063c000038c20 80000000f0144080 */
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
	DDEMAP_SCTX
	.word	0xfcda9000
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe158000
	DDEMAP_PAGE
	IDEMAP_ALL_RPAGES
	.word	0xfc9c1c40
	.word	0xfe45a74c
	IDEMAP_ALL_RPAGES
	.word	0xe05aa068
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45ee130
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
	or	%g0, 0x560, %i7
	ITLB_TAG_READ
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xbe866008
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x024, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe174000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x168, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL_PAGES
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe52a3de
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v005_exit:
	EXIT_GOOD
Thr1_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v402 TEXT_VA=0x640000980000
attr_text {
	Name = .Thr1_User_Text_4v402 ,
	VA = 0x640000980000 ,/* 0x64000098ffc0 */
	RA = 0x0160480000 ,
	PA = 0x0160480000 ,
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
	/* ITTE_TAG_DATA = 0000640000980000 8000000160480481 */
	end_label   = Thr1_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v402_text_begin
Thr1_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x08f, %i7
	P_LOAD_DDATA_IN
	.word	0xbe82a068
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe160000
	P_DDEMAP_PAGE
	.word	0xec75e0b0
	.word	0xc021a7a8
	.word	0x1000000
	.word	0xbe17c000
	P_DDEMAP_RPAGE
	.word	0xbe8420d0
	.word	0xe0dfc200
	nop
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
thr1_MMU_ASI_AS_IF_USER_PRIMARY_76:
	.word	0x87802010
	.word	0xd4f12038
	.word	0xfcda9000
	.word	0xc024a4f8
thr1_MMU_ASI_PRIMARY_77:
	.word	0x87802080
	.word	0xccf76048
	.word	0xca59a040
	.word	0x1000000
	or	%g0, 0x049, %i7
	P_LOAD_IDATA_IN
thr1_MMU_ASI_AS_IF_USER_PRIMARY_78:
	.word	0x87802010
	.word	0xe8f6e088
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_TOGGLE_LSU_IM
	P_DDEMAP_ALL_RPAGES
	.word	0xfcda9000
thr1_MMU_ASI_PRIMARY_79:
	.word	0x87802080
	.word	0xf0f2a080
	.word	0x1000000
	or	%g0, 0x071, %i7
	P_LOAD_IDATA_IN
	.word	0xbe8420b0
	.word	0xf2dfc200
	.word	0x1000000
	or	%g0, 0x18, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x77b, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe842038
	.word	0xe0dfd000
	P_IDEMAP_PCTX
	P_IDEMAP_ALL
thr1_MMU_ASI_BLK_P_80:
	.word	0x878020f0
	.word	0xc3baa180
	.word	0x1000000
	or	%g0, 0x18, %i7
	P_READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc024a140
	.word	0xfcdad120
	.word	0x1000000
	or	%g0, 0x062, %i7
	P_LOAD_IDATA_IN
	P_TOGGLE_LSU_IM
	.word	0xfcda9000
thr1_MMU_ASI_PRIMARY_81:
	.word	0x87802080
	.word	0xd4f2a068
	.word	0xfcd94320
	P_DDEMAP_SCTX
thr1_MMU_ASI_PRIMARY_82:
	.word	0x87802080
	.word	0xe6f5a0d8
	.word	0x1000000
	or	%g0, 0xc8, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xd8, %i7
	P_ITLB_TAG_READ
	P_DDEMAP_PCTX
	P_DDEMAP_SCTX
thr1_MMU_ASI_BLK_S_83:
	.word	0x878020f1
	.word	0xc1b96b40
	.word	0x1000000
	or	%g0, 0x044, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x446, %i7
	P_LOAD_DDATA_ACCESS
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_84:
	.word	0x87802022
	.word	0xdcbdac50
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_85:
	.word	0x87802022
	.word	0xf0baa5e0
	.word	0xbe82a120
	.word	0xf6dfc200
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v402_exit:
	EXIT_GOOD
Thr1_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v006 TEXT_VA=0x63c000032000
attr_text {
	Name = .Thr1_User_Text_4v006 ,
	VA = 0x63c000032000 ,/* 0x63c000033fc0 */
	RA = 0x00f015a000 ,
	PA = 0x00f015a000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063c000032c20 80000000f015a080 */
	end_label   = Thr1_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v006_text_begin
Thr1_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0xbe86e038
	.word	0xd4dfc200
	P_ACCESS_DTSB_PTR
	.word	0xee5c2048
	.word	0x1000000
	.word	0xbe13c000
	P_DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x0a1, %i7
	P_LOAD_DDATA_IN
thr1_MMU_ASI_SECONDARY_LITTLE_86:
	.word	0x87802089
	.word	0xc4bae200
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x508, %i7
	P_ITLB_TAG_READ
	.word	0xfcdc5060
	.word	0xd472a068
	.word	0xc02aa140
	.word	0xfc995c60
	nop
	nop
	nop
	P_DDEMAP_SCTX
	.word	0xc022afb4
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc45aa0b0
	.word	0x1000000
	or	%g0, 0x180, %i7
	P_READ_IDATA_ACCESS
thr1_MMU_ASI_BLK_COMMIT_P_87:
	.word	0x878020e0
	.word	0xe3b928c0
	.word	0xe075a138
	.word	0xc0776818
	.word	0xc075aee0
	.word	0x1000000
	or	%g0, 0x095, %i7
	P_LOAD_IDATA_IN
	.word	0xbe85a0c0
	.word	0xecdfc200
	.word	0xc03426fe
	P_DDEMAP_NCTX
	P_DDEMAP_PCTX
	.word	0xfcdc1000
	.word	0xc02da479
thr1_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_88:
	.word	0x87802018
	.word	0xf8f2a020
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	P_DDEMAP_ALL
thr1_MMU_ASI_PRIMARY_LITTLE_89:
	.word	0x87802088
	.word	0xe0f2a0b0
	.word	0xbe85a098
	.word	0xd4dfd000
	P_DDEMAP_SCTX
	P_TOGGLE_LSU_IM
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v006_exit:
	EXIT_GOOD
Thr1_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v103 DATA_VA=0x63c000114000
attr_data {
	Name = .Thr1_User_Data_4v103 ,
	VA = 0x63c000114000 ,/* 0x63c000115fc0 */
	RA = 0x00f004e000 ,
	PA = 0x00f004e000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063c000114c20 80000000f004e040 */
	end_label   = Thr1_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v103_data_begin
Thr1_User_Data_4v103_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v303 DATA_VA=0x650001c00000
attr_data {
	Name = .Thr1_User_Data_4v303 ,
	VA = 0x650001c00000 ,/* 0x650001ffffc0 */
	RA = 0x01ed400000 ,
	PA = 0x1ded400000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_2 ,
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
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 0000650001c00000 8000001ded400443 */
	end_label   = Thr1_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v303_data_begin
Thr1_User_Data_4v303_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v007 TEXT_VA=0x63c0000ae000
attr_text {
	Name = .Thr1_User_Text_4v007 ,
	VA = 0x63c0000ae000 ,/* 0x63c0000affc0 */
	RA = 0x00f017e000 ,
	PA = 0x00f017e000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063c0000aec20 80000000f017e080 */
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
	.word	0xbe168000
	DDEMAP_RPAGE
	.word	0xfe5e6838
	TOGGLE_LSU_DM
	nop
thr1_MMU_ASI_PRIMARY_90:
	.word	0x87802080
	.word	0xeaf76090
	.word	0x1000000
	or	%g0, 0x6d8, %i7
	READ_DDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xce742000
	.word	0xc025aa70
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x00c, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x68d, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe120000
	IDEMAP_PAGE
	.word	0xc0342e84
	.word	0x1000000
	or	%g0, 0x085, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x98, %i7
	ITLB_TAG_READ
	.word	0xe05ee0c0
	.word	0xec5da138
	.word	0xe275a070
	.word	0xc0292896
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5c2720
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v007_exit:
	EXIT_GOOD
Thr1_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v104 DATA_VA=0x640000a60000
attr_data {
	Name = .Thr1_User_Data_4v104 ,
	VA = 0x640000a60000 ,/* 0x640000a6ffc0 */
	RA = 0x01609f0000 ,
	PA = 0x1d609f0000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000a60c20 8000001d609f0041 */
	end_label   = Thr1_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v104_data_begin
Thr1_User_Data_4v104_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v008 TEXT_VA=0x6400002f0000
attr_text {
	Name = .Thr1_User_Text_4v008 ,
	VA = 0x6400002f0000 ,/* 0x6400002fffc0 */
	RA = 0x0160c60000 ,
	PA = 0x1d60c60000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006400002f0c20 8000001d60c60081 */
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
	.word	0xee76e0a0
	.word	0xc032a90e
	.word	0xee592048
	.word	0xd45aa008
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x8, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc995c60
	.word	0xbe85a130
	.word	0xe39fde00
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe8420f0
	.word	0xf6dfd000
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe154000
	GOTO_SUPERVISOR0
thr1_MMU_ASI_PRIMARY_91:
	.word	0x87802080
	.word	0xd2f2a0b8
	.word	0x1000000
	or	%g0, 0x034, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe148000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0xd0, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	.word	0xfe566c20
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc032aaba
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_BLK_COMMIT_P_92:
	.word	0x878020e0
	.word	0xc1bc28c0
	.word	0xfe5c2048
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_PAGE
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	.word	0xcc742018
	.word	0xc0766140
	.word	0x1000000
	or	%g0, 0x095, %i7
	LOAD_IDATA_IN
	.word	0xf075a0e8
	.word	0xc022a9b0
	.word	0xec742100
	.word	0xc0242b7c
	.word	0xce742080
	.word	0xc0742140
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_BLK_COMMIT_P_93:
	.word	0x878020e0
	.word	0xc1b92a00
thr1_MMU_ASI_SECONDARY_94:
	.word	0x87802081
	.word	0xd8f46018
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xea742060
	.word	0xc02c2d24
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v008_exit:
	EXIT_GOOD
Thr1_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v105 DATA_VA=0x63c0000ac000
attr_data {
	Name = .Thr1_User_Data_4v105 ,
	VA = 0x63c0000ac000 ,/* 0x63c0000adfc0 */
	RA = 0x00f0072000 ,
	PA = 0x00f0072000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063c0000acc20 80000000f0072040 */
	end_label   = Thr1_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v105_data_begin
Thr1_User_Data_4v105_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v009 TEXT_VA=0x640000a30000
attr_text {
	Name = .Thr1_User_Text_4v009 ,
	VA = 0x640000a30000 ,/* 0x640000a3ffc0 */
	RA = 0x0160e80000 ,
	PA = 0x1d60e80000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000640000a30c20 8000001d60e80081 */
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5667e4
	nop
	.word	0xe876e088
	.word	0xc070a140
	DDEMAP_SCTX
	IDEMAP_NCTX
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc991100
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
	.word	0xfcdd9000
	.word	0x1000000
	.word	0xbe160000
	DDEMAP_PAGE
	.word	0xfe4ee53b
	.word	0xbe842098
	.word	0xecdfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x089, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	.word	0xc03422ba
	IDEMAP_PCTX
	.word	0xf65c2100
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	.word	0xfe55a7fc
	.word	0xfe412bd8
	TOGGLE_LSU_IM
	ACCESS_ITSB_PTR
	IDEMAP_NCTX
	DDEMAP_ALL_RPAGES
	.word	0xfe442630
	.word	0xfe5429ea
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
thr1_MMU_ASI_PRIMARY_95:
	.word	0x87802080
	.word	0xeaf2a020
	.word	0x1000000
	or	%g0, 0x77c, %i7
	LOAD_DDATA_ACCESS
	.word	0xc02aa293
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe50a74e
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v009_exit:
	EXIT_GOOD
Thr1_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v106 DATA_VA=0x63c0001a2000
attr_data {
	Name = .Thr1_User_Data_4v106 ,
	VA = 0x63c0001a2000 ,/* 0x63c0001a3fc0 */
	RA = 0x00f0178000 ,
	PA = 0x00f0178000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063c0001a2c20 80000000f0178040 */
	end_label   = Thr1_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v106_data_begin
Thr1_User_Data_4v106_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00a TEXT_VA=0x63c000170000
attr_text {
	Name = .Thr1_User_Text_4v00a ,
	VA = 0x63c000170000 ,/* 0x63c000171fc0 */
	RA = 0x00f00f6000 ,
	PA = 0x00f00f6000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063c000170c20 80000000f00f6080 */
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
thr1_MMU_ASI_PRIMARY_96:
	.word	0x87802080
	.word	0xe6f66080
	.word	0xc4742038
	.word	0xc02c2d08
	.word	0xc02e6166
	.word	0xe4742018
	.word	0xc022ad1c
	.word	0xec5920e0
	.word	0xbe82a110
	.word	0xfadfd000
	.word	0xf65da0b0
	.word	0xfcd95120
	.word	0xda76e0a8
	.word	0xc02dac56
	.word	0xc032af6e
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x668, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x34b, %i7
	LOAD_DDATA_ACCESS
	.word	0xc0712d70
	DDEMAP_NCTX
	.word	0xc025a218
	.word	0xc0342954
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
	.word	0xbe842130
	.word	0xd4dfd000
thr1_MMU_ASI_PRIMARY_97:
	.word	0x87802080
	.word	0xcaf0a040
thr1_MMU_ASI_PRIMARY_98:
	.word	0x87802080
	.word	0xf8f5a0b8
	.word	0x1000000
	or	%g0, 0x3ee, %i7
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
	nop
	nop
	nop
	nop
thr1_MMU_ASI_SECONDARY_LITTLE_99:
	.word	0x87802089
	.word	0xf0f16090
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
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf675a0e0
	.word	0xc0276848
	.word	0xbe138000
	GOTO_SUPERVISOR1
thr1_MMU_ASI_BLK_COMMIT_S_100:
	.word	0x878020e1
	.word	0xe1baecc0
	.word	0x1000000
	or	%g0, 0x7c0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x520, %i7
	DTLB_TAG_READ
	.word	0xfc9c5120
thr1_MMU_ASI_PRIMARY_101:
	.word	0x87802080
	.word	0xd8f42018
	.word	0x1000000
	or	%g0, 0x042, %i7
	LOAD_DDATA_IN
	.word	0xfe542b48
	.word	0x1000000
	or	%g0, 0x50f, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x7d8, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfa5c20b0
	.word	0xbe85a098
	.word	0xf6dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe114000
	IDEMAP_PAGE
	.word	0x1000000
	.word	0xbe128000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x580, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	.word	0xfe592460
thr1_MMU_ASI_BLK_P_102:
	.word	0x878020f0
	.word	0xe1baab00
	.word	0x1000000
	or	%g0, 0x4e5, %i7
	LOAD_DDATA_ACCESS
	.word	0xfc9a9d40
	.word	0xbe85a0d0
	.word	0xd4dfd000
	.word	0xfcd91000
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x027, %i7
	LOAD_DDATA_IN
	nop
	.word	0xee5c2018
	.word	0xec5ee008
	.word	0xf475a090
	.word	0xc0342140
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
	or	%g0, 0x02f, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	DDEMAP_ALL_PAGES
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe118000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc035aa14
	.word	0xe675a080
	.word	0xc026e3a0
	IDEMAP_ALL_RPAGES
	.word	0xc02f6dcb
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x548, %i7
	DTLB_TAG_READ
	DDEMAP_ALL_PAGES
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe275a010
	.word	0xc025aa04
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00a_exit:
	EXIT_GOOD
Thr1_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v107 DATA_VA=0x640000170000
attr_data {
	Name = .Thr1_User_Data_4v107 ,
	VA = 0x640000170000 ,/* 0x64000017ffc0 */
	RA = 0x01604f0000 ,
	PA = 0x1d604f0000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000170c20 8000001d604f0041 */
	end_label   = Thr1_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v107_data_begin
Thr1_User_Data_4v107_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00b TEXT_VA=0x63c0000ba000
attr_text {
	Name = .Thr1_User_Text_4v00b ,
	VA = 0x63c0000ba000 ,/* 0x63c0000bbfc0 */
	RA = 0x00f006c000 ,
	PA = 0x00f006c000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063c0000bac20 80000000f006c080 */
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
	.word	0xbe85a098
	.word	0xecdfd000
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x650, %i7
	READ_DDATA_ACCESS
	.word	0xd476e0e0
	.word	0xc02c2703
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xac, %i7
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
	.word	0xc02e6bd0
	.word	0xfe4f6086
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xec742038
	.word	0xc032a140
	nop
	nop
	nop
	nop
	.word	0xfe4eeb0d
	IDEMAP_ALL
	.word	0xfe56e2f4
	IDEMAP_NCTX
	.word	0xfe42a444
	.word	0xc022ad70
	.word	0xe05e60d0
	.word	0x1000000
	.word	0xbe14c000
	IDEMAP_PAGE
thr1_MMU_ASI_PRIMARY_103:
	.word	0x87802080
	.word	0xe4f2a018
	ACCESS_DTSB_PTR
	.word	0xd0742088
	.word	0xc02aa409
	.word	0x1000000
	or	%g0, 0x599, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x18, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe466fac
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xcc5da018
	.word	0xca58a040
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x550, %i7
	READ_IDATA_ACCESS
	.word	0xfe5e6670
thr1_MMU_ASI_BLK_COMMIT_S_104:
	.word	0x878020e1
	.word	0xc1b96780
	.word	0x1000000
	or	%g0, 0x6ba, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe118000
	DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9a9d40
	.word	0x1000000
	or	%g0, 0x432, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x508, %i7
	DTLB_TAG_READ
	.word	0xfc9a9100
	.word	0xfcd91000
	.word	0xcc75a0a0
	.word	0xc07664f0
	.word	0xfe40a644
	.word	0xd47420b0
	.word	0xc075a1a0
	DDEMAP_ALL_PAGES
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	DDEMAP_PCTX
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x60, %i7
	DTLB_TAG_READ
	.word	0xfe4aaa7b
	.word	0xfcdc5020
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xdc72a028
	.word	0xc034269a
	.word	0x81c1e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00b_exit:
	EXIT_GOOD
Thr1_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v108 DATA_VA=0x63c00015e000
attr_data {
	Name = .Thr1_User_Data_4v108 ,
	VA = 0x63c00015e000 ,/* 0x63c00015ffc0 */
	RA = 0x00f0056000 ,
	PA = 0x00f0056000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063c00015ec20 80000000f0056040 */
	end_label   = Thr1_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v108_data_begin
Thr1_User_Data_4v108_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00c TEXT_VA=0x6400005e0000
attr_text {
	Name = .Thr1_User_Text_4v00c ,
	VA = 0x6400005e0000 ,/* 0x6400005effc0 */
	RA = 0x0160e00000 ,
	PA = 0x1d60e00000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006400005e0c20 8000001d60e00081 */
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
	.word	0xc026e140
	DDEMAP_ALL_PAGES
	.word	0xc0366406
thr1_MMU_ASI_SECONDARY_LITTLE_105:
	.word	0x87802089
	.word	0xdef160d8
	.word	0xfcdd9000
	DDEMAP_PCTX
	nop
	.word	0xe05c2038
	.word	0xe0776038
	.word	0xc032a954
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_PAGE
	.word	0xfcda9000
	.word	0xfe5da2d8
	.word	0xfc9a9c40
	.word	0xc036e716
	.word	0x1000000
	or	%g0, 0x8, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	TOGGLE_LSU_IM
	DDEMAP_ALL
	.word	0xf07420e8
	.word	0xc02aa73e
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe150000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x608, %i7
	READ_DDATA_ACCESS
	.word	0xbe842138
	.word	0xecdfd000
	.word	0x1000000
	.word	0xbe15c000
	DDEMAP_RPAGE
	.word	0xfc9c1c40
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x168, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL
	DDEMAP_ALL_RPAGES
	.word	0xbe816010
	.word	0xe19fde20
	.word	0xd45c2038
	.word	0xfcdd9000
	.word	0xfe5f63e0
	ACCESS_DTSB_PTR
	.word	0xbe876008
	.word	0xecdfd000
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
	ACCESS_ITSB_PTR
	.word	0xc85c2130
	.word	0x1000000
	or	%g0, 0x098, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd45da068
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00c_exit:
	EXIT_GOOD
Thr1_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v109 DATA_VA=0x63c00005a000
attr_data {
	Name = .Thr1_User_Data_4v109 ,
	VA = 0x63c00005a000 ,/* 0x63c00005bfc0 */
	RA = 0x00f01d6000 ,
	PA = 0x00f01d6000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063c00005ac20 80000000f01d6040 */
	end_label   = Thr1_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v109_data_begin
Thr1_User_Data_4v109_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00d TEXT_VA=0x650025400000
attr_text {
	Name = .Thr1_User_Text_4v00d ,
	VA = 0x650025400000 ,/* 0x6500257fffc0 */
	RA = 0x01e6800000 ,
	PA = 0x1de6800000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000065002540155b 8000001de6800083 */
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
	IDEMAP_ALL
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	DDEMAP_PCTX
	.word	0xfcda9000
	IDEMAP_ALL_RPAGES
	.word	0xfcd91000
thr1_MMU_ASI_PRIMARY_106:
	.word	0x87802080
	.word	0xe0bc2c90
	.word	0xfe4f699c
	.word	0xc072ae48
	.word	0x1000000
	.word	0xbe16c000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x14, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe842038
	.word	0xecdfd000
	.word	0xfe4c25ea
	.word	0xc075a6d0
	nop
	nop
	.word	0xf475a090
	.word	0xc022a540
	.word	0xbe82a090
	.word	0xc19fde00
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
	IDEMAP_RPAGE
	.word	0xfe46e9b8
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xe4776018
	.word	0xc035a454
	.word	0x1000000
	or	%g0, 0x454, %i7
	LOAD_DDATA_ACCESS
	.word	0xc02e6773
thr1_MMU_ASI_PRIMARY_107:
	.word	0x87802080
	.word	0xe2f42010
	.word	0xe39a9f00
thr1_MMU_ASI_PRIMARY_LITTLE_108:
	.word	0x87802088
	.word	0xd6f66010
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	DTLB_TAG_READ
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe13c000
	IDEMAP_RPAGE
	.word	0xc0766508
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xd85ee018
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00d_exit:
	EXIT_GOOD
Thr1_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10a DATA_VA=0x640000420000
attr_data {
	Name = .Thr1_User_Data_4v10a ,
	VA = 0x640000420000 ,/* 0x64000042ffc0 */
	RA = 0x01608f0000 ,
	PA = 0x1d608f0000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000420c20 8000001d608f0041 */
	end_label   = Thr1_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10a_data_begin
Thr1_User_Data_4v10a_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00e TEXT_VA=0x63c0001cc000
attr_text {
	Name = .Thr1_User_Text_4v00e ,
	VA = 0x63c0001cc000 ,/* 0x63c0001cdfc0 */
	RA = 0x00f0176000 ,
	PA = 0x00f0176000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063c0001ccc20 80000000f0176080 */
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
	.word	0xcc712018
	.word	0xc02dafd8
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x68, %i7
	READ_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xfcdd9000
	.word	0xe05ee120
	.word	0x1000000
	or	%g0, 0x505, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe150000
	GOTO_SUPERVISOR1
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
	ACCESS_DTSB_PTR
	ACCESS_ITSB_PTR
	.word	0xfe5c2ab0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xec5aa0f0
	.word	0xbe816040
	.word	0xd6dfd060
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc0276880
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00e_exit:
	EXIT_GOOD
Thr1_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10b DATA_VA=0x63c00013e000
attr_data {
	Name = .Thr1_User_Data_4v10b ,
	VA = 0x63c00013e000 ,/* 0x63c00013ffc0 */
	RA = 0x00f01ac000 ,
	PA = 0x00f01ac000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063c00013ec20 80000000f01ac040 */
	end_label   = Thr1_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10b_data_begin
Thr1_User_Data_4v10b_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00f TEXT_VA=0x63c000026000
attr_text {
	Name = .Thr1_User_Text_4v00f ,
	VA = 0x63c000026000 ,/* 0x63c000027fc0 */
	RA = 0x00f007e000 ,
	PA = 0x00f007e000 ,
	TTE_Context = 0x0c20 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063c000026c20 80000000f007e080 */
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
	.word	0xfcded000
	.word	0xfe4da61f
	.word	0xbe812038
	.word	0xd4dfd000
	.word	0xfcd89000
	.word	0x1000000
	or	%g0, 0x670, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
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
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0xf2, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe46646c
	nop
	nop
	nop
	.word	0xc0366c46
	DDEMAP_PCTX
thr1_MMU_ASI_PRIMARY_109:
	.word	0x87802080
	.word	0xd6f2a010
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
	TOGGLE_LSU_DM
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x68, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	.word	0xc0342dbe
	DDEMAP_PCTX
	TOGGLE_LSU_IM
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	.word	0xee75a018
	.word	0xc0242820
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xec5aa038
	.word	0x1000000
	or	%g0, 0x593, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xdc75a088
	.word	0xc075a7b0
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x510, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x02c, %i7
	LOAD_IDATA_IN
	.word	0xe2766070
	.word	0xc030a140
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4ee3ba
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00f_exit:
	EXIT_GOOD
Thr1_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10c DATA_VA=0x640000f00000
attr_data {
	Name = .Thr1_User_Data_4v10c ,
	VA = 0x640000f00000 ,/* 0x640000f0ffc0 */
	RA = 0x01606a0000 ,
	PA = 0x1d606a0000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000f00c20 8000001d606a0041 */
	end_label   = Thr1_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10c_data_begin
Thr1_User_Data_4v10c_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10d DATA_VA=0x63c0001e4000
attr_data {
	Name = .Thr1_User_Data_4v10d ,
	VA = 0x63c0001e4000 ,/* 0x63c0001e5fc0 */
	RA = 0x00f0182000 ,
	PA = 0x00f0182000 ,
	TTE_Context = 0x0c20 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063c0001e4c20 80000000f0182040 */
	end_label   = Thr1_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10d_data_begin
Thr1_User_Data_4v10d_data_begin:
	.xword	0x640000550000
	.xword	0x63c00017c000
	.xword	0x65000dc00000
	.xword	0x63c00010a000
	.xword	0x650033800000
	.xword	0x640000660000
	.xword	0x660ce0000000
	.xword	0x63c000106000
	.xword	0x63c000050000
	.xword	0x650029000000
	.xword	0x63c000000000
	.xword	0x63c0000a8000
	.xword	0x63c000024000
	.xword	0x640000fb0000
	.xword	0x650002c00000
	.xword	0x650014800000
	.xword	0x63c000038000
	.xword	0x640000980000
	.xword	0x63c000032000
	.xword	0x63c000114000
	.xword	0x650001c00000
	.xword	0x63c0000ae000
	.xword	0x640000a60000
	.xword	0x6400002f0000
	.xword	0x63c0000ac000
	.xword	0x640000a30000
	.xword	0x63c0001a2000
	.xword	0x63c000170000
	.xword	0x640000170000
	.xword	0x63c0000ba000
	.xword	0x63c00015e000
	.xword	0x6400005e0000
	.xword	0x63c00005a000
	.xword	0x650025400000
	.xword	0x640000420000
	.xword	0x63c0001cc000
	.xword	0x63c00013e000
	.xword	0x63c000026000
	.xword	0x640000f00000
	.xword	0x63c0001e4000
Thr1_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x69000ac00000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	VA = 0x69000ac00000 ,/* 0x69000affffc0 */
	RA = 0x01fb800000 ,
	PA = 0x2dfb800000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000069000ac01872 8000002dfb800483 */
	end_label   = Thr2_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr2_user_code_entry
Thr2_user_code_entry:
	setx	0x680000de0000, %g1, %g2
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
thr2_MMU_ASI_BLK_COMMIT_S_110:
	.word	0x878020e1
	.word	0xe3b969c0
	.word	0xfe52a1fe
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc076e160
	.word	0xc02c2a59
	.word	0xc0776f68
	.word	0x1000000
	or	%g0, 0x060, %i7
	LOAD_IDATA_IN
thr2_MMU_ASI_BLK_S_111:
	.word	0x878020f1
	.word	0xc3bae940
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe070a0a0
	.word	0xc0276cf0
	.word	0x1000000
	or	%g0, 0x28, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x268, %i7
	DTLB_TAG_READ
	.word	0xe05d2038
	.word	0xf8752118
	.word	0xc02c2e5d
	.word	0xbe8120d0
	.word	0xe0dfd000
	.word	0xf275e088
	.word	0xc026ed28
	.word	0xfe466c50
	.word	0xfe542e54
	nop
	.word	0xc85d2150
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe85c20e0
	DDEMAP_ALL_PAGES
	.word	0xfcdc1000
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x1a3, %i7
	LOAD_IDATA_ACCESS
thr2_MMU_ASI_BLK_P_112:
	.word	0x878020f0
	.word	0xe1b92cc0
	.word	0x1000000
	or	%g0, 0x658, %i7
	DTLB_TAG_READ
	.word	0xfe50aad8
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5424b0
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v000_exit:
	EXIT_GOOD
Thr2_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v100 DATA_VA=0x680000de0000
attr_data {
	Name = .Thr2_User_Data_4v100 ,
	VA = 0x680000de0000 ,/* 0x680000deffc0 */
	RA = 0x0170dd0000 ,
	PA = 0x0170dd0000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000de1872 8000000170dd0041 */
	end_label   = Thr2_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v100_data_begin
Thr2_User_Data_4v100_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v200 DATA_VA=0x6a0530000000
attr_data {
	Name = .Thr2_User_Data_4v200 ,
	VA = 0x6a0530000000 ,/* 0x6a053fffffc0 */
	RA = 0x03a0000000 ,
	PA = 0x2fa0000000 ,
	TTE_Context = 0x0598 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006a0530000598 8000002fa0000445 */
	end_label   = Thr2_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v200_data_begin
Thr2_User_Data_4v200_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v300 DATA_VA=0x680000e70000
attr_data {
	Name = .Thr2_User_Data_4v300 ,
	VA = 0x680000e70000 ,/* 0x680000e7ffc0 */
	RA = 0x0170a00000 ,
	PA = 0x0170a00000 ,
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
	/* DTTE_TAG_DATA = 0000680000e70000 8000000170a00441 */
	end_label   = Thr2_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v300_data_begin
Thr2_User_Data_4v300_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v001 TEXT_VA=0x69001a000000
attr_text {
	Name = .Thr2_User_Text_4v001 ,
	VA = 0x69001a000000 ,/* 0x69001a3fffc0 */
	RA = 0x01f2800000 ,
	PA = 0x2df2800000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000069001a001872 8000002df2800483 */
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
	TOGGLE_LSU_IM
	IDEMAP_ALL
	TOGGLE_LSU_DM
	.word	0xbe82a088
	.word	0xc8dfd000
	.word	0x1000000
	.word	0xbe16c000
	IDEMAP_RPAGE
	.word	0xc070ac00
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_PRIMARY_113:
	.word	0x87802080
	.word	0xc6f52020
	.word	0x1000000
	or	%g0, 0x7f8, %i7
	READ_DDATA_ACCESS
	.word	0xfc9edc40
thr2_MMU_ASI_PRIMARY_114:
	.word	0x87802080
	.word	0xcef6e050
	.word	0x1000000
	or	%g0, 0x516, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe164000
	DDEMAP_PAGE
	DDEMAP_SCTX
	.word	0xca5e6010
	.word	0x1000000
	or	%g0, 0x30c, %i7
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
	IDEMAP_NCTX
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x07f, %i7
	LOAD_DDATA_IN
thr2_MMU_ASI_PRIMARY_115:
	.word	0x87802080
	.word	0xccf5e048
	.word	0x1000000
	or	%g0, 0x04b, %i7
	LOAD_IDATA_IN
	.word	0xc4766100
	.word	0xc02ee3fd
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe104000
	IDEMAP_RPAGE
	.word	0xfe5e6b28
	nop
	nop
	nop
	nop
	.word	0xd872a048
	.word	0xc072a820
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf075e0a8
	.word	0xc0776a70
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v001_exit:
	EXIT_GOOD
Thr2_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v400 TEXT_VA=0x67d0000f0000
attr_text {
	Name = .Thr2_User_Text_4v400 ,
	VA = 0x67d0000f0000 ,/* 0x67d0000f1fc0 */
	RA = 0x010012e000 ,
	PA = 0x010012e000 ,
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
	/* ITTE_TAG_DATA = 000067d0000f0000 800000010012e080 */
	end_label   = Thr2_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v400_text_begin
Thr2_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xc029a160
	P_TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe138000
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
	nop
	.word	0xd271a0c8
	.word	0xc02c6160
	.word	0xfcd91000
	.word	0xfcdcc280
	.word	0x1000000
	or	%g0, 0x015, %i7
	P_LOAD_IDATA_IN
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
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x440, %i7
	P_READ_DDATA_ACCESS
	.word	0xfe49a519
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0xfe49a3a1
	.word	0x1000000
	or	%g0, 0x705, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcd94220
	.word	0xfe41ad40
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x0a1, %i7
	P_LOAD_DDATA_IN
	P_IDEMAP_ALL_PAGES
	.word	0xfcdc0200
	P_TOGGLE_LSU_DM
	.word	0xcc732048
	.word	0xc031a72c
	.word	0xf671a120
	.word	0xc031af96
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v400_exit:
	EXIT_GOOD
Thr2_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v002 TEXT_VA=0x690003c00000
attr_text {
	Name = .Thr2_User_Text_4v002 ,
	VA = 0x690003c00000 ,/* 0x690003ffffc0 */
	RA = 0x01f1c00000 ,
	PA = 0x2df1c00000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000690003c01872 8000002df1c00483 */
	end_label   = Thr2_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v002_text_begin
Thr2_User_Text_4v002_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdc1000
	.word	0xfe4aa547
	P_DDEMAP_PCTX
	.word	0xfcd95020
	.word	0xbe852088
	.word	0xe8dfc200
	nop
	nop
	.word	0xfc995020
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4526a0
	.word	0xd45e6068
	.word	0x1000000
	or	%g0, 0x138, %i7
	P_READ_IDATA_ACCESS
	P_TOGGLE_LSU_DM
	P_DDEMAP_ALL
	.word	0xbe842068
	.word	0xe8dfc200
thr2_MMU_ASI_PRIMARY_116:
	.word	0x87802080
	.word	0xeaf52108
	P_ACCESS_DTSB_PTR
	P_TOGGLE_LSU_IM
	.word	0xfe4aa2e0
	P_DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x59e, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe86e0e0
	.word	0xeedfc200
	.word	0x1000000
	or	%g0, 0x7d0, %i7
	P_DTLB_TAG_READ
	.word	0xd872a048
	.word	0xc0242948
	.word	0xfcdb8380
thr2_MMU_ASI_REAL_MEM_117:
	.word	0x87802014
	.word	0xdcf5a028
	.word	0x1000000
	or	%g0, 0x630, %i7
	P_DTLB_TAG_READ
	.word	0xbe8660e0
	.word	0xd4dfd000
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x039, %i7
	P_LOAD_IDATA_IN
	.word	0xfc995c60
	.word	0xd475e038
	.word	0xc035e9fc
	P_IDEMAP_ALL
	.word	0xfe4aada5
	P_ACCESS_DTSB_PTR
	.word	0xfcda9000
	.word	0xc0312a8a
	.word	0xd85c2018
	.word	0xfe52a076
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr2_User_Text_4v002_exit:
	EXIT_GOOD
Thr2_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v101 DATA_VA=0x6a0d80000000
attr_data {
	Name = .Thr2_User_Data_4v101 ,
	VA = 0x6a0d80000000 ,/* 0x6a0d8fffffc0 */
	RA = 0x0250000000 ,
	PA = 0x2e50000000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006a0d80001872 8000002e50000045 */
	end_label   = Thr2_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v101_data_begin
Thr2_User_Data_4v101_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v201 DATA_VA=0x67d0001ae000
attr_data {
	Name = .Thr2_User_Data_4v201 ,
	VA = 0x67d0001ae000 ,/* 0x67d0001affc0 */
	RA = 0x0100078000 ,
	PA = 0x0100078000 ,
	TTE_Context = 0x0598 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000067d0001ae598 8000000100078440 */
	end_label   = Thr2_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v201_data_begin
Thr2_User_Data_4v201_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v301 DATA_VA=0x67d0000ce000
attr_data {
	Name = .Thr2_User_Data_4v301 ,
	VA = 0x67d0000ce000 ,/* 0x67d0000cffc0 */
	RA = 0x010001a000 ,
	PA = 0x010001a000 ,
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
	/* DTTE_TAG_DATA = 000067d0000ce000 800000010001a440 */
	end_label   = Thr2_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v301_data_begin
Thr2_User_Data_4v301_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v003 TEXT_VA=0x67d000158000
attr_text {
	Name = .Thr2_User_Text_4v003 ,
	VA = 0x67d000158000 ,/* 0x67d000159fc0 */
	RA = 0x010016a000 ,
	PA = 0x010016a000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000067d000159872 800000010016a480 */
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
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x500, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x096, %i7
	LOAD_IDATA_IN
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x260, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x178, %i7
	DTLB_TAG_READ
	.word	0xc076eca0
	.word	0xca752010
	.word	0xc02de727
	nop
	nop
	.word	0xc45d20d0
thr2_MMU_ASI_PRIMARY_118:
	.word	0x87802080
	.word	0xf0f2a078
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x530, %i7
	ITLB_TAG_READ
	DDEMAP_SCTX
	DDEMAP_SCTX
	.word	0xfcdc1000
thr2_MMU_ASI_PRIMARY_119:
	.word	0x87802080
	.word	0xc6f2a020
	.word	0xc036efac
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	.word	0xc02e6ee2
	.word	0xfe4aaea5
	.word	0xe47420c8
	.word	0xc022a1e4
	IDEMAP_ALL_PAGES
	.word	0xfcdc1140
	.word	0x1000000
	or	%g0, 0xe4, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x2b8, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0xe85c2008
	TOGGLE_LSU_DM
	.word	0xfe412840
	IDEMAP_ALL_RPAGES
	.word	0xd85c2018
	.word	0xfe55240c
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe842068
	.word	0xc4dfd000
	.word	0x1000000
	or	%g0, 0x4ba, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcded000
	ACCESS_ITSB_PTR
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0xfe552894
	.word	0x1000000
	or	%g0, 0x1f8, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc6752090
	.word	0xc02c2bd4
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v003_exit:
	EXIT_GOOD
Thr2_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v401 TEXT_VA=0x69002ec00000
attr_text {
	Name = .Thr2_User_Text_4v401 ,
	VA = 0x69002ec00000 ,/* 0x69002effffc0 */
	RA = 0x01fbc00000 ,
	PA = 0x01fbc00000 ,
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
	/* ITTE_TAG_DATA = 000069002ec00000 80000001fbc00083 */
	end_label   = Thr2_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v401_text_begin
Thr2_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x05a, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x4b3, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	P_READ_IDATA_ACCESS
	.word	0xfc9a9c40
	P_DDEMAP_NCTX
thr2_MMU_ASI_AS_IF_USER_PRIMARY_120:
	.word	0x87802010
	.word	0xd2f66000
	P_ACCESS_ITSB_PTR
thr2_MMU_ASI_AS_IF_USER_PRIMARY_121:
	.word	0x87802010
	.word	0xd4f420f0
thr2_MMU_ASI_AS_IF_USER_PRIMARY_122:
	.word	0x87802010
	.word	0xd6f5e010
	.word	0xfcd91000
	.word	0x1000000
	or	%g0, 0x7c0, %i7
	P_DTLB_TAG_READ
thr2_MMU_ASI_PRIMARY_123:
	.word	0x87802080
	.word	0xecf52058
	P_IDEMAP_PCTX
	P_DDEMAP_ALL_PAGES
	.word	0xfc9c4580
	.word	0xfe53240c
	.word	0x1000000
	or	%g0, 0x07e, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x5fe, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x570, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr2_MMU_ASI_AS_IF_USER_PRIMARY_124:
	.word	0x87802010
	.word	0xe0f52110
	nop
	nop
	nop
	nop
	.word	0xfcdd0200
thr2_MMU_ASI_SECONDARY_LITTLE_125:
	.word	0x87802089
	.word	0xf4b96170
	.word	0xc0332374
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe170000
	P_IDEMAP_PAGE
	.word	0xbe8660a0
	.word	0xe0dfc200
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0xdd, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x508, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x07c, %i7
	P_LOAD_IDATA_IN
	.word	0xfcded040
thr2_MMU_ASI_REAL_IO_126:
	.word	0x87802015
	.word	0xe2f46018
	P_DDEMAP_NCTX
	.word	0xd459a088
thr2_MMU_ASI_AS_IF_USER_PRIMARY_127:
	.word	0x87802010
	.word	0xf4f420b8
thr2_MMU_ASI_BLK_P_128:
	.word	0x878020f0
	.word	0xc1bd2a40
	.word	0xfe5b2398
	.word	0x1000000
	.word	0xbe118000
	P_IDEMAP_RPAGE
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v401_exit:
	EXIT_GOOD
Thr2_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v004 TEXT_VA=0x690000000000
attr_text {
	Name = .Thr2_User_Text_4v004 ,
	VA = 0x690000000000 ,/* 0x6900003fffc0 */
	RA = 0x01fa800000 ,
	PA = 0x2dfa800000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000690000001872 8000002dfa800483 */
	end_label   = Thr2_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v004_text_begin
Thr2_User_Text_4v004_text_begin:
	wrpr	0, %gl
thr2_MMU_ASI_AS_IF_USER_PRIMARY_129:
	.word	0x87802010
	.word	0xeef2a088
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
	P_TOGGLE_LSU_DM
	P_ACCESS_ITSB_PTR
	.word	0xee75e008
	.word	0xc0312ec4
	.word	0xfcdc0200
	.word	0xd65de010
	.word	0xbe852088
	.word	0xeedfd000
	nop
	nop
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
	.word	0x1000000
	or	%g0, 0x198, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x100, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x418, %i7
	P_ITLB_TAG_READ
	.word	0xbe842128
	.word	0xd4dfc200
	.word	0x1000000
	.word	0xbe108000
	P_IDEMAP_PAGE
	.word	0xfe5aae60
	P_IDEMAP_ALL
thr2_MMU_ASI_SECONDARY_LITTLE_130:
	.word	0x87802089
	.word	0xf8b96f50
	.word	0xc026e6d4
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr2_User_Text_4v004_exit:
	EXIT_GOOD
Thr2_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v102 DATA_VA=0x6800001d0000
attr_data {
	Name = .Thr2_User_Data_4v102 ,
	VA = 0x6800001d0000 ,/* 0x6800001dffc0 */
	RA = 0x0170660000 ,
	PA = 0x0170660000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800001d1872 8000000170660041 */
	end_label   = Thr2_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v102_data_begin
Thr2_User_Data_4v102_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v302 DATA_VA=0x6a04b0000000
attr_data {
	Name = .Thr2_User_Data_4v302 ,
	VA = 0x6a04b0000000 ,/* 0x6a04bfffffc0 */
	RA = 0x0260000000 ,
	PA = 0x2e60000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_1 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 00006a04b0000000 8000002e60000445 */
	end_label   = Thr2_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v302_data_begin
Thr2_User_Data_4v302_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v005 TEXT_VA=0x6800006f0000
attr_text {
	Name = .Thr2_User_Text_4v005 ,
	VA = 0x6800006f0000 ,/* 0x6800006fffc0 */
	RA = 0x0170240000 ,
	PA = 0x0170240000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006800006f1872 8000000170240481 */
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
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x450, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5d2868
thr2_MMU_ASI_PRIMARY_131:
	.word	0x87802080
	.word	0xcef2a118
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4c0, %i7
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
	nop
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x408, %i7
	READ_DDATA_ACCESS
thr2_MMU_ASI_BLK_COMMIT_S_132:
	.word	0x878020e1
	.word	0xe1bae6c0
	DO_BRANCH
	.word	0x81c4a000
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
	.word	0x1000000
	or	%g0, 0x023, %i7
	LOAD_IDATA_IN
	.word	0xc0312510
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x030, %i7
	LOAD_DDATA_IN
	.word	0xbe82a0c0
	.word	0xf2dfd000
	.word	0xd45aa140
	.word	0xcc776018
	.word	0xc02ee9ca
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	DTLB_TAG_READ
	.word	0xda7420e8
	.word	0xc0776160
	ACCESS_DTSB_PTR
	.word	0xee72a0f0
	.word	0xc02aaf22
	nop
	nop
	nop
	nop
	nop
	.word	0xbe158000
	GOTO_SUPERVISOR1
	.word	0xc022a160
	.word	0x1000000
	or	%g0, 0x180, %i7
	ITLB_TAG_READ
	.word	0xcc5e6018
	nop
	nop
	.word	0x1000000
	or	%g0, 0x188, %i7
	DTLB_TAG_READ
	.word	0xe1991e00
	.word	0x1000000
	or	%g0, 0x578, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe130000
	IDEMAP_PAGE
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	DDEMAP_SCTX
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x88, %i7
	DTLB_TAG_READ
	.word	0xfcd91000
	.word	0xc072a160
	.word	0x1000000
	or	%g0, 0x48, %i7
	ITLB_TAG_READ
	.word	0xf25de140
	DDEMAP_ALL_RPAGES
	.word	0xfe4de649
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr2_MMU_ASI_PRIMARY_133:
	.word	0x87802080
	.word	0xe6f42080
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x558, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xe8742120
	.word	0xc0242458
	TOGGLE_LSU_IM
	.word	0xc02de77e
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0xe2, %i7
	LOAD_DDATA_ACCESS
	.word	0xd0752028
	.word	0xc025ed0c
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xca5de010
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v005_exit:
	EXIT_GOOD
Thr2_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v402 TEXT_VA=0x690004000000
attr_text {
	Name = .Thr2_User_Text_4v402 ,
	VA = 0x690004000000 ,/* 0x6900043fffc0 */
	RA = 0x01f7000000 ,
	PA = 0x01f7000000 ,
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
	/* ITTE_TAG_DATA = 0000690004000000 80000001f7000083 */
	end_label   = Thr2_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v402_text_begin
Thr2_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xbe86e0a0
	.word	0xe0dfd000
thr2_MMU_ASI_PRIMARY_LITTLE_134:
	.word	0x87802088
	.word	0xf8f520c8
	P_TOGGLE_LSU_DM
	.word	0xfcddd000
thr2_MMU_ASI_AS_IF_USER_PRIMARY_135:
	.word	0x87802010
	.word	0xd6f0a010
	.word	0xfcd89000
	.word	0xbe8120f0
	.word	0xe0dfc200
	.word	0xfe5c6538
	.word	0x1000000
	or	%g0, 0x48, %i7
	P_READ_IDATA_ACCESS
	.word	0xe059a0a0
	.word	0xc071a6a8
	nop
	.word	0xbe8420d0
	.word	0xe8dfd000
	.word	0xc85c6038
	.word	0xfcdd1000
	P_DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	.word	0xd459a038
	.word	0xbe82a148
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x1c8, %i7
	P_READ_DDATA_ACCESS
	nop
	nop
thr2_MMU_ASI_SECONDARY_LITTLE_136:
	.word	0x87802089
	.word	0xe4f16078
	nop
	P_IDEMAP_ALL_PAGES
thr2_MMU_ASI_PRIMARY_137:
	.word	0x87802080
	.word	0xf2f760d0
	.word	0xfcd90200
	.word	0xfe41a1ec
	.word	0x1000000
	or	%g0, 0x470, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe852038
	.word	0xc8dfc200
thr2_MMU_ASI_PRIMARY_138:
	.word	0x87802080
	.word	0xfaf5e068
	P_DDEMAP_ALL_PAGES
	.word	0xea746050
	.word	0xc02b2191
	P_IDEMAP_NCTX
	P_DDEMAP_ALL_RPAGES
	.word	0xfcdbc2a0
	P_ACCESS_ITSB_PTR
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
	.word	0xf871a0a8
	.word	0xc071afa8
	nop
	nop
	nop
	nop
	nop
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v402_exit:
	EXIT_GOOD
Thr2_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v103 DATA_VA=0x6a04c0000000
attr_data {
	Name = .Thr2_User_Data_4v103 ,
	VA = 0x6a04c0000000 ,/* 0x6a04cfffffc0 */
	RA = 0x0270000000 ,
	PA = 0x2e70000000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006a04c0001872 8000002e70000045 */
	end_label   = Thr2_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v103_data_begin
Thr2_User_Data_4v103_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v006 TEXT_VA=0x67d000004000
attr_text {
	Name = .Thr2_User_Text_4v006 ,
	VA = 0x67d000004000 ,/* 0x67d000005fc0 */
	RA = 0x01000f8000 ,
	PA = 0x01000f8000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000067d000005872 80000001000f8480 */
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
	.word	0xe85de0c0
	.word	0xbe82a0a0
	.word	0xe8dfd000
	DDEMAP_SCTX
	DDEMAP_NCTX
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	.word	0xf25c2038
	.word	0xc85e60a0
	.word	0xfcddd000
	.word	0x1000000
	.word	0xbe140000
	DDEMAP_RPAGE
	.word	0xd475e0e0
	.word	0xc02926de
	.word	0x1000000
	or	%g0, 0x04c, %i7
	LOAD_IDATA_IN
thr2_MMU_ASI_PRIMARY_139:
	.word	0x87802080
	.word	0xd6f2a010
	.word	0x1000000
	or	%g0, 0x061, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL_RPAGES
	.word	0xca766010
	.word	0xc025ecac
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe412090
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v006_exit:
	EXIT_GOOD
Thr2_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v403 TEXT_VA=0x680000260000
attr_text {
	Name = .Thr2_User_Text_4v403 ,
	VA = 0x680000260000 ,/* 0x68000026ffc0 */
	RA = 0x01700c0000 ,
	PA = 0x01700c0000 ,
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
	/* ITTE_TAG_DATA = 0000680000260000 80000001700c0081 */
	end_label   = Thr2_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v403_text_begin
Thr2_User_Text_4v403_text_begin:
	wrpr	0, %gl
	.word	0xc021ac14
	.word	0x1000000
	.word	0xbe120000
	P_DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x4eb, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x550, %i7
	P_READ_IDATA_ACCESS
thr2_MMU_ASI_PRIMARY_140:
	.word	0x87802080
	.word	0xe2f2a018
	.word	0xfcdf5100
	P_IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x4d8, %i7
	P_DTLB_TAG_READ
thr2_MMU_ASI_AS_IF_USER_PRIMARY_141:
	.word	0x87802010
	.word	0xeaf420b8
	nop
	.word	0xfc9a9d40
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x030, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_NCTX
	.word	0xfcd89000
	.word	0x1000000
	or	%g0, 0x41d, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x431, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xfc, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcdc1000
	P_TOGGLE_LSU_IM
	P_DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0xf8, %i7
	P_ITLB_TAG_READ
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5dd, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xe19d02c0
	.word	0x1000000
	or	%g0, 0x051, %i7
	P_LOAD_DDATA_IN
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v403_exit:
	EXIT_GOOD
Thr2_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v104 DATA_VA=0x67d00016a000
attr_data {
	Name = .Thr2_User_Data_4v104 ,
	VA = 0x67d00016a000 ,/* 0x67d00016bfc0 */
	RA = 0x01000c2000 ,
	PA = 0x01000c2000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067d00016b872 80000001000c2040 */
	end_label   = Thr2_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v104_data_begin
Thr2_User_Data_4v104_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v007 TEXT_VA=0x680000740000
attr_text {
	Name = .Thr2_User_Text_4v007 ,
	VA = 0x680000740000 ,/* 0x68000074ffc0 */
	RA = 0x0170760000 ,
	PA = 0x0170760000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000741872 8000000170760481 */
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
	.word	0xfa5c2120
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0752388
	.word	0xd47420a0
	.word	0xc02f6206
	IDEMAP_ALL_PAGES
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcddd000
	.word	0x1000000
	.word	0xbe140000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x510, %i7
	ITLB_TAG_READ
	IDEMAP_NCTX
thr2_MMU_ASI_BLK_COMMIT_P_142:
	.word	0x878020e0
	.word	0xe1baa280
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4c2e54
	.word	0xfe512dec
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x6e0, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe852088
	.word	0xe8dfd000
	.word	0x1000000
	or	%g0, 0x300, %i7
	DTLB_TAG_READ
	.word	0xfe5421b4
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
thr2_MMU_ASI_BLK_P_143:
	.word	0x878020f0
	.word	0xe1baa8c0
	.word	0xbe120000
	GOTO_SUPERVISOR1
thr2_MMU_ASI_PRIMARY_144:
	.word	0x87802080
	.word	0xd4f6e088
thr2_MMU_ASI_PRIMARY_LITTLE_145:
	.word	0x87802088
	.word	0xf2f420c0
	.word	0x1000000
	or	%g0, 0x480, %i7
	LOAD_DDATA_ACCESS
	.word	0xc0366412
	.word	0xbe86e0c0
	.word	0xf6dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5c2270
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v007_exit:
	EXIT_GOOD
Thr2_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v105 DATA_VA=0x67d000060000
attr_data {
	Name = .Thr2_User_Data_4v105 ,
	VA = 0x67d000060000 ,/* 0x67d000061fc0 */
	RA = 0x0100148000 ,
	PA = 0x0100148000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067d000061872 8000000100148040 */
	end_label   = Thr2_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v105_data_begin
Thr2_User_Data_4v105_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v008 TEXT_VA=0x69002b400000
attr_text {
	Name = .Thr2_User_Text_4v008 ,
	VA = 0x69002b400000 ,/* 0x69002b7fffc0 */
	RA = 0x01fc000000 ,
	PA = 0x2dfc000000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000069002b401872 8000002dfc000483 */
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
	.word	0xc45f6130
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0352850
	.word	0xfe412644
	.word	0xf27420f0
	.word	0xc0742f08
thr2_MMU_ASI_PRIMARY_LITTLE_146:
	.word	0x87802088
	.word	0xc0bc2190
	.word	0xfc9e5000
	.word	0xbe80a138
	.word	0xe8dfd000
	.word	0xfe4d2bfa
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
	or	%g0, 0x448, %i7
	READ_IDATA_ACCESS
thr2_MMU_ASI_PRIMARY_147:
	.word	0x87802080
	.word	0xfaf6e0b0
	.word	0xf6742138
	.word	0xc02924d0
	.word	0xfcdc1000
	IDEMAP_NCTX
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0xd8, %i7
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
	.word	0xfe452bf0
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
	.word	0xe19dde00
	DDEMAP_NCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5aac30
	.word	0xe05ee0c0
	.word	0xc0242c28
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x093, %i7
	LOAD_IDATA_IN
	IDEMAP_NCTX
thr2_MMU_ASI_PRIMARY_LITTLE_148:
	.word	0x87802088
	.word	0xf0f120a8
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	LOAD_DDATA_ACCESS
	nop
	IDEMAP_ALL
	.word	0xfcded000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd2752000
	.word	0xc024222c
thr2_MMU_ASI_SECONDARY_149:
	.word	0x87802081
	.word	0xfcb967c0
	.word	0xfcdd1000
	.word	0xbe8420b0
	.word	0xf6dfd000
	.word	0x1000000
	or	%g0, 0x015, %i7
	LOAD_DDATA_IN
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xf8712030
	.word	0xc0242df0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v008_exit:
	EXIT_GOOD
Thr2_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v106 DATA_VA=0x680000d10000
attr_data {
	Name = .Thr2_User_Data_4v106 ,
	VA = 0x680000d10000 ,/* 0x680000d1ffc0 */
	RA = 0x0170fa0000 ,
	PA = 0x0170fa0000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000d11872 8000000170fa0041 */
	end_label   = Thr2_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v106_data_begin
Thr2_User_Data_4v106_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v009 TEXT_VA=0x680000a10000
attr_text {
	Name = .Thr2_User_Text_4v009 ,
	VA = 0x680000a10000 ,/* 0x680000a1ffc0 */
	RA = 0x0170670000 ,
	PA = 0x0170670000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000a11872 8000000170670481 */
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
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x548, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xfe5526ec
	.word	0xe25f6018
	.word	0xd8776070
	.word	0xc02e656b
	.word	0x1000000
	or	%g0, 0x11e, %i7
	LOAD_DDATA_ACCESS
	.word	0xc072a188
	IDEMAP_ALL_RPAGES
thr2_MMU_ASI_PRIMARY_150:
	.word	0x87802080
	.word	0xc8f12068
	.word	0xfe5aa0b0
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	.word	0xfcdad120
	.word	0xfe5aa9a0
	.word	0xe3995e20
	.word	0x1000000
	or	%g0, 0x80, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x67, %i7
	LOAD_DDATA_ACCESS
	nop
	.word	0xbe80a0c0
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02c2ccb
	.word	0x81c4a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v009_exit:
	EXIT_GOOD
Thr2_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v107 DATA_VA=0x680000480000
attr_data {
	Name = .Thr2_User_Data_4v107 ,
	VA = 0x680000480000 ,/* 0x68000048ffc0 */
	RA = 0x01706b0000 ,
	PA = 0x01706b0000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000481872 80000001706b0041 */
	end_label   = Thr2_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v107_data_begin
Thr2_User_Data_4v107_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00a TEXT_VA=0x680000380000
attr_text {
	Name = .Thr2_User_Text_4v00a ,
	VA = 0x680000380000 ,/* 0x68000038ffc0 */
	RA = 0x0170e50000 ,
	PA = 0x0170e50000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000381872 8000000170e50481 */
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
	.word	0x1000000
	or	%g0, 0x4bd, %i7
	LOAD_IDATA_ACCESS
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
	.word	0xd458a038
	.word	0xe05de0e0
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x540, %i7
	READ_DDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr2_MMU_ASI_SECONDARY_151:
	.word	0x87802081
	.word	0xe2f16070
	.word	0xfe476bac
	.word	0x1000000
	or	%g0, 0x588, %i7
	READ_IDATA_ACCESS
	.word	0xfcd91000
	.word	0x1000000
	or	%g0, 0x06d, %i7
	LOAD_DDATA_IN
	.word	0xfcded000
	.word	0x1000000
	.word	0xbe14c000
	IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a008
	.word	0xc8dfd000
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x044, %i7
	LOAD_IDATA_IN
	.word	0xde752030
	.word	0xc02aa519
	.word	0x1000000
	.word	0xbe160000
	DDEMAP_RPAGE
	.word	0xbe812068
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x05e, %i7
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
	.word	0xfcdd1000
	.word	0xc076ecf0
	.word	0x1000000
	or	%g0, 0x092, %i7
	LOAD_IDATA_IN
	.word	0xfe5ee638
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf472a090
	.word	0xc02dee67
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00a_exit:
	EXIT_GOOD
Thr2_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v108 DATA_VA=0x690013c00000
attr_data {
	Name = .Thr2_User_Data_4v108 ,
	VA = 0x690013c00000 ,/* 0x690013ffffc0 */
	RA = 0x01fac00000 ,
	PA = 0x2dfac00000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000690013c01872 8000002dfac00043 */
	end_label   = Thr2_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v108_data_begin
Thr2_User_Data_4v108_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00b TEXT_VA=0x690030000000
attr_text {
	Name = .Thr2_User_Text_4v00b ,
	VA = 0x690030000000 ,/* 0x6900303fffc0 */
	RA = 0x01fb000000 ,
	PA = 0x2dfb000000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000690030001872 8000002dfb000483 */
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
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0xee5f60d0
	DDEMAP_NCTX
	.word	0xfe4c2d24
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd4752148
	.word	0xc072aa38
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x3b8, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x0a7, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x728, %i7
	DTLB_TAG_READ
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x260, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x039, %i7
	LOAD_DDATA_IN
	.word	0xfe5ee480
	DDEMAP_NCTX
thr2_MMU_ASI_BLK_PL_152:
	.word	0x878020f8
	.word	0xc1bf6a40
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc02ee638
	nop
	.word	0xe85e60c0
	.word	0xbe80a088
	.word	0xd4dfd000
	IDEMAP_ALL
thr2_MMU_ASI_PRIMARY_LITTLE_153:
	.word	0x87802088
	.word	0xdcf2a058
	.word	0xe2742018
	.word	0xc0352d6e
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc075ed20
	.word	0xc02f6db4
	DDEMAP_ALL_PAGES
	.word	0xfcdd1000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_SECONDARY_154:
	.word	0x87802081
	.word	0xecb96df0
	.word	0xbe852008
	.word	0xeedfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x03e, %i7
	LOAD_IDATA_IN
	.word	0xc075e1b0
	ACCESS_DTSB_PTR
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5c25c8
	ACCESS_DTSB_PTR
	.word	0xc0242a30
	nop
	nop
	nop
	nop
	nop
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
	.word	0xfe42adfc
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00b_exit:
	EXIT_GOOD
Thr2_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v109 DATA_VA=0x67d00019e000
attr_data {
	Name = .Thr2_User_Data_4v109 ,
	VA = 0x67d00019e000 ,/* 0x67d00019ffc0 */
	RA = 0x0100004000 ,
	PA = 0x0100004000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067d00019f872 8000000100004040 */
	end_label   = Thr2_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v109_data_begin
Thr2_User_Data_4v109_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00c TEXT_VA=0x690000800000
attr_text {
	Name = .Thr2_User_Text_4v00c ,
	VA = 0x690000800000 ,/* 0x690000bfffc0 */
	RA = 0x01fe400000 ,
	PA = 0x2dfe400000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000690000801872 8000002dfe400483 */
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
	IDEMAP_ALL
	nop
thr2_MMU_ASI_PRIMARY_LITTLE_155:
	.word	0x87802088
	.word	0xd8baa440
	.word	0xc032aed6
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0xc076ec60
	DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe164000
	IDEMAP_PAGE
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xf25de0a0
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45c2100
	.word	0xfe592c78
	.word	0xfc9c1c40
	.word	0xc02f61e0
	.word	0x1000000
	or	%g0, 0x78, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x88, %i7
	ITLB_TAG_READ
	IDEMAP_PCTX
	.word	0xc02523b4
	.word	0xc022a1cc
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc03125ea
	.word	0xd85aa018
	.word	0xc0342ce6
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x85, %i7
	LOAD_IDATA_ACCESS
	.word	0xe075e088
	.word	0xc036ef0e
thr2_MMU_ASI_PRIMARY_156:
	.word	0x87802080
	.word	0xd6f42010
	.word	0xfe40a834
	.word	0xfe4aa255
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x058, %i7
	LOAD_IDATA_IN
	.word	0xea76e020
	.word	0xc03425ec
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	LOAD_IDATA_ACCESS
	.word	0xe05c2088
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
	nop
	.word	0xfcdc1000
	.word	0xca5e6040
	.word	0x1000000
	.word	0xbe128000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe2766018
	.word	0xc075e8d0
	.word	0x1000000
	or	%g0, 0x30, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x508, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9a9c40
	.word	0xda742050
	.word	0xc032a2a8
	.word	0x1000000
	or	%g0, 0x098, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_DM
	.word	0xfe5aac58
	.word	0xd8712018
	.word	0xc0276ef8
	.word	0xc022acd8
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	READ_IDATA_ACCESS
thr2_MMU_ASI_PRIMARY_157:
	.word	0x87802080
	.word	0xf2f420d0
	.word	0x1000000
	or	%g0, 0x091, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xcc5aa070
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc075e430
	.word	0xc19d1f00
	.word	0xfcd91000
	.word	0xe05aa088
thr2_MMU_ASI_BLK_COMMIT_P_158:
	.word	0x878020e0
	.word	0xe3b92880
	nop
	nop
	nop
	.word	0xd475e0e0
	.word	0xc0342ed4
	.word	0xf27420d0
	.word	0xc02d2172
	.word	0xc0742d08
thr2_MMU_ASI_BLK_S_159:
	.word	0x878020f1
	.word	0xe3b96440
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe5aac58
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00c_exit:
	EXIT_GOOD
Thr2_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10a DATA_VA=0x690009800000
attr_data {
	Name = .Thr2_User_Data_4v10a ,
	VA = 0x690009800000 ,/* 0x690009bfffc0 */
	RA = 0x01f2000000 ,
	PA = 0x2df2000000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000690009801872 8000002df2000043 */
	end_label   = Thr2_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10a_data_begin
Thr2_User_Data_4v10a_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00d TEXT_VA=0x67d00014e000
attr_text {
	Name = .Thr2_User_Text_4v00d ,
	VA = 0x67d00014e000 ,/* 0x67d00014ffc0 */
	RA = 0x01000e4000 ,
	PA = 0x01000e4000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000067d00014f872 80000001000e4480 */
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
	.word	0xc03764f6
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x5f8, %i7
	DTLB_TAG_READ
	.word	0xfe5de030
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	TOGGLE_LSU_DM
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x029, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x178, %i7
	READ_IDATA_ACCESS
	nop
	nop
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc85f60e0
	nop
	.word	0xca75e010
	.word	0xc02e64e3
	.word	0xc0276a88
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc02ee9c4
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00d_exit:
	EXIT_GOOD
Thr2_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10b DATA_VA=0x6800001e0000
attr_data {
	Name = .Thr2_User_Data_4v10b ,
	VA = 0x6800001e0000 ,/* 0x6800001effc0 */
	RA = 0x01708a0000 ,
	PA = 0x01708a0000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800001e1872 80000001708a0041 */
	end_label   = Thr2_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10b_data_begin
Thr2_User_Data_4v10b_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00e TEXT_VA=0x67d00010c000
attr_text {
	Name = .Thr2_User_Text_4v00e ,
	VA = 0x67d00010c000 ,/* 0x67d00010dfc0 */
	RA = 0x010019a000 ,
	PA = 0x010019a000 ,
	TTE_Context = 0x1872 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000067d00010d872 800000010019a480 */
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
	TOGGLE_LSU_DM
	.word	0xfcd95020
	.word	0xfcded000
thr2_MMU_ASI_PRIMARY_160:
	.word	0x87802080
	.word	0xf8f52060
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x049, %i7
	LOAD_IDATA_IN
	.word	0xfe442c90
	.word	0x1000000
	or	%g0, 0x076, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4d2cd0
	TOGGLE_LSU_DM
	ACCESS_DTSB_PTR
	.word	0xec70a058
	.word	0xc02d22c6
	ACCESS_DTSB_PTR
	.word	0xbe842088
	.word	0xf6dfd040
	.word	0xbe85e088
	.word	0xfadfd000
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x488, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0xfe42a468
	.word	0xfe58ab30
	.word	0xfe5c2288
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcda9000
	.word	0xfe4c289e
	.word	0xfe5de2e8
	.word	0x1000000
	or	%g0, 0x3e9, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x438, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0xc4766148
	.word	0xc035e308
	.word	0x1000000
	or	%g0, 0x578, %i7
	READ_IDATA_ACCESS
	.word	0xfcdad160
	.word	0xfa72a038
	.word	0xc020abf4
	.word	0xc034239c
	.word	0xfe5428e6
	.word	0xfe4ee253
	ACCESS_DTSB_PTR
	.word	0xf470a030
	.word	0xc0266a00
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xee592158
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00e_exit:
	EXIT_GOOD
Thr2_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10c DATA_VA=0x67d000182000
attr_data {
	Name = .Thr2_User_Data_4v10c ,
	VA = 0x67d000182000 ,/* 0x67d000183fc0 */
	RA = 0x01000ac000 ,
	PA = 0x01000ac000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067d000183872 80000001000ac040 */
	end_label   = Thr2_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10c_data_begin
Thr2_User_Data_4v10c_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10d DATA_VA=0x67d000146000
attr_data {
	Name = .Thr2_User_Data_4v10d ,
	VA = 0x67d000146000 ,/* 0x67d000147fc0 */
	RA = 0x01001da000 ,
	PA = 0x01001da000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067d000147872 80000001001da040 */
	end_label   = Thr2_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10d_data_begin
Thr2_User_Data_4v10d_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10e DATA_VA=0x69000b400000
attr_data {
	Name = .Thr2_User_Data_4v10e ,
	VA = 0x69000b400000 ,/* 0x69000b7fffc0 */
	RA = 0x01f1400000 ,
	PA = 0x2df1400000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000069000b401872 8000002df1400043 */
	end_label   = Thr2_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10e_data_begin
Thr2_User_Data_4v10e_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10f DATA_VA=0x680000b50000
attr_data {
	Name = .Thr2_User_Data_4v10f ,
	VA = 0x680000b50000 ,/* 0x680000b5ffc0 */
	RA = 0x0170110000 ,
	PA = 0x0170110000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000b51872 8000000170110041 */
	end_label   = Thr2_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10f_data_begin
Thr2_User_Data_4v10f_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v110 DATA_VA=0x67d000120000
attr_data {
	Name = .Thr2_User_Data_4v110 ,
	VA = 0x67d000120000 ,/* 0x67d000121fc0 */
	RA = 0x0100070000 ,
	PA = 0x0100070000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067d000121872 8000000100070040 */
	end_label   = Thr2_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v110_data_begin
Thr2_User_Data_4v110_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v111 DATA_VA=0x67d0001bc000
attr_data {
	Name = .Thr2_User_Data_4v111 ,
	VA = 0x67d0001bc000 ,/* 0x67d0001bdfc0 */
	RA = 0x010018c000 ,
	PA = 0x010018c000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000067d0001bd872 800000010018c040 */
	end_label   = Thr2_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v111_data_begin
Thr2_User_Data_4v111_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v112 DATA_VA=0x690033c00000
attr_data {
	Name = .Thr2_User_Data_4v112 ,
	VA = 0x690033c00000 ,/* 0x690033ffffc0 */
	RA = 0x01f8800000 ,
	PA = 0x2df8800000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000690033c01872 8000002df8800043 */
	end_label   = Thr2_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v112_data_begin
Thr2_User_Data_4v112_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v113 DATA_VA=0x6a0b00000000
attr_data {
	Name = .Thr2_User_Data_4v113 ,
	VA = 0x6a0b00000000 ,/* 0x6a0b0fffffc0 */
	RA = 0x0010000000 ,
	PA = 0x2010000000 ,
	TTE_Context = 0x1872 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006a0b00001872 8000002010000045 */
	end_label   = Thr2_User_Data_4v113_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v113_data_begin
Thr2_User_Data_4v113_data_begin:
	.xword	0x69000ac00000
	.xword	0x680000de0000
	.xword	0x6a0530000000
	.xword	0x680000e70000
	.xword	0x69001a000000
	.xword	0x67d0000f0000
	.xword	0x690003c00000
	.xword	0x6a0d80000000
	.xword	0x67d0001ae000
	.xword	0x67d0000ce000
	.xword	0x67d000158000
	.xword	0x69002ec00000
	.xword	0x690000000000
	.xword	0x6800001d0000
	.xword	0x6a04b0000000
	.xword	0x6800006f0000
	.xword	0x690004000000
	.xword	0x6a04c0000000
	.xword	0x67d000004000
	.xword	0x680000260000
	.xword	0x67d00016a000
	.xword	0x680000740000
	.xword	0x67d000060000
	.xword	0x69002b400000
	.xword	0x680000d10000
	.xword	0x680000a10000
	.xword	0x680000480000
	.xword	0x680000380000
	.xword	0x690013c00000
	.xword	0x690030000000
	.xword	0x67d00019e000
	.xword	0x690000800000
	.xword	0x690009800000
	.xword	0x67d00014e000
	.xword	0x6800001e0000
	.xword	0x67d00010c000
	.xword	0x67d000182000
	.xword	0x67d000146000
	.xword	0x69000b400000
	.xword	0x680000b50000
	.xword	0x67d000120000
	.xword	0x67d0001bc000
	.xword	0x690033c00000
	.xword	0x6a0b00000000
Thr2_User_Data_4v113_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x6be0001ec000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	VA = 0x6be0001ec000 ,/* 0x6be0001edfc0 */
	RA = 0x011011c000 ,
	PA = 0x011011c000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006be0001ec1bd 800000011011c480 */
	end_label   = Thr3_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr3_user_code_entry
Thr3_user_code_entry:
	setx	0x6be000062000, %g1, %g2
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
	DDEMAP_ALL
thr3_MMU_ASI_BLK_S_161:
	.word	0x878020f1
	.word	0xc1b96dc0
	.word	0x1000000
	or	%g0, 0x07e, %i7
	LOAD_IDATA_IN
	.word	0xc8592098
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe86e120
	.word	0xe39fde00
	.word	0x1000000
	.word	0xbe138000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x198, %i7
	ITLB_TAG_READ
thr3_MMU_ASI_PRIMARY_LITTLE_162:
	.word	0x87802088
	.word	0xc6f120e0
	.word	0x1000000
	or	%g0, 0x3f8, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe52a1b8
	.word	0x1000000
	or	%g0, 0x09a, %i7
	LOAD_DDATA_IN
	nop
thr3_MMU_ASI_PRIMARY_LITTLE_163:
	.word	0x87802088
	.word	0xd8bee250
	.word	0xd458a0d8
	ACCESS_DTSB_PTR
	.word	0xfcda9000
thr3_MMU_ASI_PRIMARY_LITTLE_164:
	.word	0x87802088
	.word	0xc6f5a020
	DDEMAP_ALL
	DDEMAP_ALL_PAGES
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc030a93e
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_165:
	.word	0x87802080
	.word	0xc4f12038
	.word	0xe2742010
	.word	0xc072ab58
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xe25da070
	.word	0xfcdc1000
	nop
	nop
	nop
	.word	0xfcda9000
	.word	0xc076ed08
	.word	0xfcd89000
	.word	0x1000000
	or	%g0, 0x1ad, %i7
	LOAD_IDATA_ACCESS
	.word	0xd45aa118
	.word	0xfcdc5120
	.word	0xbe85a0f8
	.word	0xc4dfd000
	DDEMAP_SCTX
	.word	0xfe5da580
	.word	0x1000000
	or	%g0, 0x140, %i7
	LOAD_DDATA_ACCESS
	.word	0xe275a010
	.word	0xc070a688
	.word	0xfe4aa4e7
	.word	0xfcda9040
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x06e, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x087, %i7
	LOAD_IDATA_IN
	nop
	ACCESS_DTSB_PTR
	ACCESS_DTSB_PTR
	ACCESS_ITSB_PTR
	ACCESS_DTSB_PTR
	.word	0xfe4eeeaa
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xc0742c98
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v000_exit:
	EXIT_GOOD
Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v100 DATA_VA=0x6be000062000
attr_data {
	Name = .Thr3_User_Data_4v100 ,
	VA = 0x6be000062000 ,/* 0x6be000063fc0 */
	RA = 0x01100a0000 ,
	PA = 0x01100a0000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006be0000621bd 80000001100a0040 */
	end_label   = Thr3_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v100_data_begin
Thr3_User_Data_4v100_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v200 DATA_VA=0x6be000020000
attr_data {
	Name = .Thr3_User_Data_4v200 ,
	VA = 0x6be000020000 ,/* 0x6be000021fc0 */
	RA = 0x0110014000 ,
	PA = 0x0110014000 ,
	TTE_Context = 0x0e6f ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006be000020e6f 8000000110014040 */
	end_label   = Thr3_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v200_data_begin
Thr3_User_Data_4v200_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v300 DATA_VA=0x6c0000fc0000
attr_data {
	Name = .Thr3_User_Data_4v300 ,
	VA = 0x6c0000fc0000 ,/* 0x6c0000fcffc0 */
	RA = 0x0180440000 ,
	PA = 0x3d80440000 ,
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
	/* DTTE_TAG_DATA = 00006c0000fc0000 8000003d80440441 */
	end_label   = Thr3_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v300_data_begin
Thr3_User_Data_4v300_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v001 TEXT_VA=0x6d001ac00000
attr_text {
	Name = .Thr3_User_Text_4v001 ,
	VA = 0x6d001ac00000 ,/* 0x6d001affffc0 */
	RA = 0x020b400000 ,
	PA = 0x020b400000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d001ac001bd 800000020b400483 */
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
	.word	0xf65c2008
	.word	0xfe5aa140
	.word	0xbe164000
	GOTO_SUPERVISOR1
	IDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x48, %i7
	DTLB_TAG_READ
	.word	0xfe52a926
	.word	0xfc995120
	.word	0x1000000
	or	%g0, 0x06e, %i7
	LOAD_IDATA_IN
	.word	0xc036ef7a
thr3_MMU_ASI_PRIMARY_166:
	.word	0x87802080
	.word	0xf0bc2890
	.word	0xe2742010
	.word	0xc072a158
	nop
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x470, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe5da9f0
	.word	0xc19a9f00
	.word	0xfe56e396
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	DDEMAP_ALL_RPAGES
thr3_MMU_ASI_PRIMARY_167:
	.word	0x87802080
	.word	0xe8bda970
	TOGGLE_LSU_IM
	IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_BLK_P_168:
	.word	0x878020f0
	.word	0xc1b92240
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x0ac, %i7
	LOAD_DDATA_IN
	.word	0xf2742028
	.word	0xc072ae88
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_RPAGE
	ACCESS_DTSB_PTR
	.word	0xee72a018
	.word	0xc035aeee
	.word	0x1000000
	or	%g0, 0x5e0, %i7
	ITLB_TAG_READ
thr3_MMU_ASI_PRIMARY_169:
	.word	0x87802080
	.word	0xf4f0a020
	.word	0x1000000
	or	%g0, 0x4d8, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd45aa0c0
	.word	0x1000000
	or	%g0, 0x508, %i7
	ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe17c000
	DDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc076e6e8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v001_exit:
	EXIT_GOOD
Thr3_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v400 TEXT_VA=0x6be0000ea000
attr_text {
	Name = .Thr3_User_Text_4v400 ,
	VA = 0x6be0000ea000 ,/* 0x6be0000ebfc0 */
	RA = 0x0110184000 ,
	PA = 0x0110184000 ,
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
	/* ITTE_TAG_DATA = 00006be0000ea000 8000000110184080 */
	end_label   = Thr3_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v400_text_begin
Thr3_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xfe5320aa
	nop
	.word	0xfc989c40
thr3_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_170:
	.word	0x87802018
	.word	0xcaf0a010
	P_TOGGLE_LSU_IM
	nop
	nop
thr3_MMU_ASI_PRIMARY_171:
	.word	0x87802080
	.word	0xd6f2a010
	.word	0xc02ca2dc
	.word	0xfc9d9c40
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe80a118
	.word	0xc4dfc200
	.word	0xc029a5d8
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v400_exit:
	EXIT_GOOD
Thr3_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v002 TEXT_VA=0x6c0000190000
attr_text {
	Name = .Thr3_User_Text_4v002 ,
	VA = 0x6c0000190000 ,/* 0x6c000019ffc0 */
	RA = 0x0180680000 ,
	PA = 0x3d80680000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c00001901bd 8000003d80680481 */
	end_label   = Thr3_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v002_text_begin
Thr3_User_Text_4v002_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x09a, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x90, %i7
	P_READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
thr3_MMU_ASI_BLK_P_172:
	.word	0x878020f0
	.word	0xc1bdabc0
thr3_MMU_ASI_AS_IF_USER_PRIMARY_173:
	.word	0x87802010
	.word	0xfaf42120
	.word	0x1000000
	or	%g0, 0x029, %i7
	P_LOAD_IDATA_IN
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_174:
	.word	0x87802022
	.word	0xf8b92cd0
	.word	0xe39edf00
	.word	0xbe86e0c0
	.word	0xecdfc200
	.word	0xfc9c8480
thr3_MMU_ASI_BLK_P_175:
	.word	0x878020f0
	.word	0xc3beef80
	.word	0xfc9c5c60
	.word	0x1000000
	or	%g0, 0x025, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x60, %i7
	P_ITLB_TAG_READ
	P_TOGGLE_LSU_IM
thr3_MMU_ASI_PRIMARY_176:
	.word	0x87802080
	.word	0xd8f12018
	.word	0x1000000
	or	%g0, 0x0ac, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	.word	0xbe846070
	.word	0xcadfd020
	.word	0xbe812128
	.word	0xd4dfc200
	.word	0xfc9c8580
	P_TOGGLE_LSU_DM
thr3_MMU_ASI_REAL_MEM_LITTLE_177:
	.word	0x8780201c
	.word	0xecf320c0
thr3_MMU_ASI_AS_IF_USER_PRIMARY_178:
	.word	0x87802010
	.word	0xd6f2a040
	nop
	nop
thr3_MMU_ASI_AS_IF_USER_PRIMARY_179:
	.word	0x87802010
	.word	0xc8f12138
thr3_MMU_ASI_AS_IF_USER_PRIMARY_180:
	.word	0x87802010
	.word	0xfaf42150
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_181:
	.word	0x87802080
	.word	0xe6f6e030
	.word	0xfc995020
	.word	0xc8592148
	.word	0xfcda9000
	.word	0xbe85a128
	.word	0xf6dfd000
	.word	0x1000000
	or	%g0, 0x053, %i7
	P_LOAD_DDATA_IN
	.word	0xfe492834
	.word	0x1000000
	or	%g0, 0x72f, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfc9c1000
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v002_exit:
	EXIT_GOOD
Thr3_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v101 DATA_VA=0x6c0000830000
attr_data {
	Name = .Thr3_User_Data_4v101 ,
	VA = 0x6c0000830000 ,/* 0x6c000083ffc0 */
	RA = 0x01805c0000 ,
	PA = 0x3d805c0000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c00008301bd 8000003d805c0041 */
	end_label   = Thr3_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v101_data_begin
Thr3_User_Data_4v101_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v201 DATA_VA=0x6be00007c000
attr_data {
	Name = .Thr3_User_Data_4v201 ,
	VA = 0x6be00007c000 ,/* 0x6be00007dfc0 */
	RA = 0x0110012000 ,
	PA = 0x0110012000 ,
	TTE_Context = 0x0e6f ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006be00007ce6f 8000000110012040 */
	end_label   = Thr3_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v201_data_begin
Thr3_User_Data_4v201_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v301 DATA_VA=0x6c0000f50000
attr_data {
	Name = .Thr3_User_Data_4v301 ,
	VA = 0x6c0000f50000 ,/* 0x6c0000f5ffc0 */
	RA = 0x0180570000 ,
	PA = 0x3d80570000 ,
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
	/* DTTE_TAG_DATA = 00006c0000f50000 8000003d80570441 */
	end_label   = Thr3_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v301_data_begin
Thr3_User_Data_4v301_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v003 TEXT_VA=0x6be00005c000
attr_text {
	Name = .Thr3_User_Text_4v003 ,
	VA = 0x6be00005c000 ,/* 0x6be00005dfc0 */
	RA = 0x01100cc000 ,
	PA = 0x01100cc000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006be00005c1bd 80000001100cc480 */
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
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x6e9, %i7
	LOAD_DDATA_ACCESS
	.word	0xc8592038
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4924b4
	nop
	.word	0x1000000
	or	%g0, 0x400, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x188, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	nop
	nop
	.word	0xec742038
	.word	0xc020a158
	.word	0xfe55a25a
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	ACCESS_ITSB_PTR
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
	TOGGLE_LSU_IM
	.word	0xf658a0d8
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x26c, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x38, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe80a068
	.word	0xecdfd000
	.word	0xfe42a110
	ACCESS_DTSB_PTR
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xda742100
	.word	0xc02c2867
	IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xb0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x670, %i7
	READ_DDATA_ACCESS
	.word	0xfcdd9000
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DDEMAP_ALL_RPAGES
	ACCESS_ITSB_PTR
	nop
	.word	0x1000000
	or	%g0, 0x798, %i7
	DTLB_TAG_READ
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_RPAGE
	DDEMAP_ALL
	.word	0xfcded040
	.word	0xda76e060
	.word	0xc02422f0
	nop
	nop
	.word	0x1000000
	or	%g0, 0x544, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1bc, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe154000
	IDEMAP_PAGE
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x152, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x110, %i7
	READ_DDATA_ACCESS
	.word	0xd6742010
	.word	0xc026e548
	.word	0x1000000
	.word	0xbe118000
	IDEMAP_PAGE
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xfe48af6b
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v003_exit:
	EXIT_GOOD
Thr3_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v401 TEXT_VA=0x6be000184000
attr_text {
	Name = .Thr3_User_Text_4v401 ,
	VA = 0x6be000184000 ,/* 0x6be000185fc0 */
	RA = 0x01100dc000 ,
	PA = 0x01100dc000 ,
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
	/* ITTE_TAG_DATA = 00006be000184000 80000001100dc080 */
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
	P_IDEMAP_ALL
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_IM
	.word	0xd45b2038
thr3_MMU_ASI_REAL_IO_LITTLE_182:
	.word	0x8780201d
	.word	0xf8f2a020
	.word	0xbe85a108
	.word	0xe0dfd000
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x044, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x200, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe120000
	P_DDEMAP_PAGE
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_183:
	.word	0x8780202a
	.word	0xc4bc2fb0
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_184:
	.word	0x87802080
	.word	0xc4f420c0
	.word	0xfe54a20e
	P_TOGGLE_LSU_DM
	.word	0xfe41a1c8
	.word	0xfc9c8480
	P_TOGGLE_LSU_DM
	.word	0xee75e018
	.word	0xc029a158
	.word	0xbe85a098
	.word	0xd4dfc200
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v401_exit:
	EXIT_GOOD
Thr3_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v004 TEXT_VA=0x6e0e90000000
attr_text {
	Name = .Thr3_User_Text_4v004 ,
	VA = 0x6e0e90000000 ,/* 0x6e0e9fffffc0 */
	RA = 0x03b0000000 ,
	PA = 0x03b0000000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 00006e0e900001bd 80000003b0000485 */
	end_label   = Thr3_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v004_text_begin
Thr3_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xfc995120
	.word	0xbe82a038
	.word	0xe0dfc200
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x18, %i7
	P_READ_DDATA_ACCESS
	P_TOGGLE_LSU_DM
	P_ACCESS_ITSB_PTR
thr3_MMU_ASI_AS_IF_USER_PRIMARY_185:
	.word	0x87802010
	.word	0xe6f0a0f0
thr3_MMU_ASI_AS_IF_USER_PRIMARY_186:
	.word	0x87802010
	.word	0xdcf0a028
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
	or	%g0, 0x52f, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfc9edc40
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x017, %i7
	P_LOAD_IDATA_IN
	P_DDEMAP_ALL_PAGES
	P_IDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_187:
	.word	0x87802022
	.word	0xccbaa820
	.word	0x1000000
	or	%g0, 0x48d, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe148000
	P_IDEMAP_PAGE
	.word	0xfcdd9000
	P_DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_188:
	.word	0x87802022
	.word	0xc0bc27d0
	.word	0x1000000
	or	%g0, 0xe9, %i7
	P_LOAD_IDATA_ACCESS
	P_TOGGLE_LSU_DM
	.word	0xbe80a038
	.word	0xf6dfc200
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v004_exit:
	EXIT_GOOD
Thr3_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v102 DATA_VA=0x6be0001e0000
attr_data {
	Name = .Thr3_User_Data_4v102 ,
	VA = 0x6be0001e0000 ,/* 0x6be0001e1fc0 */
	RA = 0x011016c000 ,
	PA = 0x011016c000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006be0001e01bd 800000011016c040 */
	end_label   = Thr3_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v102_data_begin
Thr3_User_Data_4v102_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v202 DATA_VA=0x6be0000ec000
attr_data {
	Name = .Thr3_User_Data_4v202 ,
	VA = 0x6be0000ec000 ,/* 0x6be0000edfc0 */
	RA = 0x01100e6000 ,
	PA = 0x01100e6000 ,
	TTE_Context = 0x0e6f ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006be0000ece6f 80000001100e6040 */
	end_label   = Thr3_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v202_data_begin
Thr3_User_Data_4v202_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v302 DATA_VA=0x6be00005e000
attr_data {
	Name = .Thr3_User_Data_4v302 ,
	VA = 0x6be00005e000 ,/* 0x6be00005ffc0 */
	RA = 0x011015e000 ,
	PA = 0x011015e000 ,
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
	/* DTTE_TAG_DATA = 00006be00005e000 800000011015e440 */
	end_label   = Thr3_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v302_data_begin
Thr3_User_Data_4v302_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v005 TEXT_VA=0x6be000056000
attr_text {
	Name = .Thr3_User_Text_4v005 ,
	VA = 0x6be000056000 ,/* 0x6be000057fc0 */
	RA = 0x01100f4000 ,
	PA = 0x01100f4000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006be0000561bd 80000001100f4480 */
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
	.word	0x1000000
	or	%g0, 0x108, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x20e, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x026, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x468, %i7
	READ_IDATA_ACCESS
	.word	0xbe80a000
	.word	0xc19fde00
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe442554
	.word	0xec5c2138
	.word	0x1000000
	or	%g0, 0xf8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x0a0, %i7
	LOAD_DDATA_IN
	.word	0xfe55aa60
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc028a372
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfc9d9100
	.word	0xe276e070
	.word	0xc032a4dc
	.word	0x1000000
	.word	0xbe17c000
	DDEMAP_PAGE
thr3_MMU_ASI_BLK_COMMIT_S_189:
	.word	0x878020e1
	.word	0xc1b96200
	.word	0xbe86e128
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x56c, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_PAGES
	.word	0xbe812038
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf65da098
	.word	0xfe40a274
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x68, %i7
	READ_IDATA_ACCESS
	.word	0xfe5c2110
	.word	0x1000000
	or	%g0, 0x067, %i7
	LOAD_IDATA_IN
	nop
	.word	0xec5c20f8
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xe05da098
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v005_exit:
	EXIT_GOOD
Thr3_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v402 TEXT_VA=0x6be00017e000
attr_text {
	Name = .Thr3_User_Text_4v402 ,
	VA = 0x6be00017e000 ,/* 0x6be00017ffc0 */
	RA = 0x01101d0000 ,
	PA = 0x01101d0000 ,
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
	/* ITTE_TAG_DATA = 00006be00017e000 80000001101d0080 */
	end_label   = Thr3_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v402_text_begin
Thr3_User_Text_4v402_text_begin:
	wrpr	0, %gl
thr3_MMU_ASI_AS_IF_USER_PRIMARY_190:
	.word	0x87802010
	.word	0xf0f420b8
	nop
	P_IDEMAP_ALL
	.word	0xfcd91140
	.word	0xee75e018
	.word	0xc02dea23
	P_TOGGLE_LSU_IM
	.word	0xbe84a128
	.word	0xf2dfc2a0
	.word	0x1000000
	or	%g0, 0x768, %i7
	P_READ_DDATA_ACCESS
thr3_MMU_ASI_PRIMARY_191:
	.word	0x87802080
	.word	0xe0f2a0c0
	.word	0x1000000
	or	%g0, 0xb0, %i7
	P_READ_DDATA_ACCESS
	P_ACCESS_DTSB_PTR
	P_IDEMAP_ALL_RPAGES
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_192:
	.word	0x87802022
	.word	0xc4bc28a0
	.word	0x1000000
	.word	0xbe138000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_DDEMAP_ALL
	nop
thr3_MMU_ASI_REAL_IO_LITTLE_193:
	.word	0x8780201d
	.word	0xc8f0e038
	.word	0xe19d82c0
	.word	0xbe842068
	.word	0xc4dfc200
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v402_exit:
	EXIT_GOOD
Thr3_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v006 TEXT_VA=0x6c00003f0000
attr_text {
	Name = .Thr3_User_Text_4v006 ,
	VA = 0x6c00003f0000 ,/* 0x6c00003fffc0 */
	RA = 0x0180e30000 ,
	PA = 0x3d80e30000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c00003f01bd 8000003d80e30481 */
	end_label   = Thr3_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v006_text_begin
Thr3_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xbe816010
	.word	0xe2dfd060
thr3_MMU_ASI_AS_IF_USER_PRIMARY_194:
	.word	0x87802010
	.word	0xf2f5a028
	.word	0xfcdd8200
	.word	0xbe86e038
	.word	0xf6dfc200
	P_TOGGLE_LSU_IM
	P_IDEMAP_PCTX
	P_DDEMAP_ALL_RPAGES
	P_DDEMAP_NCTX
	.word	0xbe86e0f8
	.word	0xf6dfc200
	.word	0xfcd88200
	.word	0xfcdbc380
	.word	0xbe812098
	.word	0xf6dfd040
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v006_exit:
	EXIT_GOOD
Thr3_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v103 DATA_VA=0x6be0001a6000
attr_data {
	Name = .Thr3_User_Data_4v103 ,
	VA = 0x6be0001a6000 ,/* 0x6be0001a7fc0 */
	RA = 0x0110076000 ,
	PA = 0x0110076000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006be0001a61bd 8000000110076040 */
	end_label   = Thr3_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v103_data_begin
Thr3_User_Data_4v103_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v303 DATA_VA=0x6be0000e6000
attr_data {
	Name = .Thr3_User_Data_4v303 ,
	VA = 0x6be0000e6000 ,/* 0x6be0000e7fc0 */
	RA = 0x011019c000 ,
	PA = 0x011019c000 ,
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
	/* DTTE_TAG_DATA = 00006be0000e6000 800000011019c440 */
	end_label   = Thr3_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v303_data_begin
Thr3_User_Data_4v303_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v007 TEXT_VA=0x6be0000dc000
attr_text {
	Name = .Thr3_User_Text_4v007 ,
	VA = 0x6be0000dc000 ,/* 0x6be0000ddfc0 */
	RA = 0x01101de000 ,
	PA = 0x01101de000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006be0000dc1bd 80000001101de480 */
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
	.word	0xc0342774
	.word	0xc035a158
	.word	0xfe50ad6e
	.word	0xfcdc5020
	.word	0xd076e028
	.word	0xc026e454
	.word	0x1000000
	or	%g0, 0x680, %i7
	READ_DDATA_ACCESS
	.word	0xec5aa068
	.word	0xc872a0e8
	.word	0xc02eea2c
	TOGGLE_LSU_DM
	.word	0xfc9d9000
	.word	0xfe4da48b
	.word	0x1000000
	.word	0xbe164000
	DDEMAP_PAGE
	.word	0xfe56e8d6
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe174000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x099, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_IM
	.word	0xf658a0c0
	.word	0xd45ee068
	.word	0xe45da018
	nop
	nop
	nop
	nop
	.word	0xfcdc5120
	.word	0x1000000
	or	%g0, 0x1c4, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xbe82a038
	.word	0xf6dfd000
	.word	0x1000000
	or	%g0, 0x6d8, %i7
	DTLB_TAG_READ
thr3_MMU_ASI_PRIMARY_LITTLE_195:
	.word	0x87802088
	.word	0xdef2a0a8
	.word	0xd65aa010
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe174000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	IDEMAP_NCTX
	.word	0xbe82a098
	.word	0xd4dfd000
thr3_MMU_ASI_PRIMARY_196:
	.word	0x87802080
	.word	0xc8f2a068
	nop
	nop
	nop
	nop
	.word	0xc458a0c0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc458a098
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v007_exit:
	EXIT_GOOD
Thr3_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v403 TEXT_VA=0x6d0019c00000
attr_text {
	Name = .Thr3_User_Text_4v403 ,
	VA = 0x6d0019c00000 ,/* 0x6d0019ffffc0 */
	RA = 0x0205800000 ,
	PA = 0x0205800000 ,
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
	/* ITTE_TAG_DATA = 00006d0019c00000 8000000205800083 */
	end_label   = Thr3_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v403_text_begin
Thr3_User_Text_4v403_text_begin:
	wrpr	0, %gl
	.word	0xfcd89040
thr3_MMU_ASI_SECONDARY_197:
	.word	0x87802081
	.word	0xe6f2e0c8
	.word	0xd471a118
	.word	0xc029a4a1
	.word	0xc07322f8
	nop
	nop
	nop
	nop
	nop
	.word	0xe2732010
	.word	0xc071af48
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd8200
	.word	0x1000000
	.word	0xbe168000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x2f0, %i7
	P_DTLB_TAG_READ
	nop
	.word	0xfe49a54f
	.word	0xf65de068
	.word	0xfe5b21e8
	.word	0xfcda9000
	P_ACCESS_ITSB_PTR
	.word	0xc19ac2e0
	.word	0x1000000
	.word	0xbe128000
	P_IDEMAP_PAGE
	P_ACCESS_ITSB_PTR
	P_TOGGLE_LSU_DM
	.word	0xfc9a9c40
	.word	0x1000000
	or	%g0, 0x318, %i7
	P_DTLB_TAG_READ
	.word	0xfcd89000
	.word	0x1000000
	or	%g0, 0x507, %i7
	P_LOAD_IDATA_ACCESS
	nop
	.word	0xfcda9000
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_198:
	.word	0x87802023
	.word	0xfcb964d0
	.word	0x1000000
	or	%g0, 0x05e, %i7
	P_LOAD_DDATA_IN
	.word	0xdc71a058
	.word	0xc025e4cc
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v403_exit:
	EXIT_GOOD
Thr3_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v008 TEXT_VA=0x6be0000f2000
attr_text {
	Name = .Thr3_User_Text_4v008 ,
	VA = 0x6be0000f2000 ,/* 0x6be0000f3fc0 */
	RA = 0x0110006000 ,
	PA = 0x0110006000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006be0000f21bd 8000000110006480 */
	end_label   = Thr3_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v008_text_begin
Thr3_User_Text_4v008_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	.word	0xbe10c000
	P_IDEMAP_PAGE
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x063, %i7
	P_LOAD_DDATA_IN
	.word	0xfe5da6b0
	.word	0xfc9d9c40
	P_IDEMAP_ALL_PAGES
	.word	0xc028a749
	.word	0x1000000
	.word	0xbe164000
	P_DDEMAP_RPAGE
	.word	0xc070ad48
	P_TOGGLE_LSU_IM
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x528, %i7
	P_READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_199:
	.word	0x87802080
	.word	0xdcf12028
thr3_MMU_ASI_PRIMARY_200:
	.word	0x87802080
	.word	0xd6f42040
	nop
	nop
	nop
thr3_MMU_ASI_BLK_P_201:
	.word	0x878020f0
	.word	0xc3bc2440
	.word	0xbe86e038
	.word	0xd4dfc200
	.word	0xfe52a0f0
	.word	0xfcd88200
	P_IDEMAP_ALL_RPAGES
	P_DDEMAP_NCTX
	.word	0xfc9c5c60
	.word	0x1000000
	or	%g0, 0x58a, %i7
	P_LOAD_DDATA_ACCESS
thr3_MMU_ASI_BLK_P_202:
	.word	0x878020f0
	.word	0xe3beeb00
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	.word	0xfe442134
	P_IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x434, %i7
	P_LOAD_DDATA_ACCESS
	P_TOGGLE_LSU_IM
	nop
	.word	0xfcdc1000
	.word	0xbe82a148
	.word	0xecdfc200
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	P_DTLB_TAG_READ
	.word	0xbe85a148
	.word	0xecdfd000
	P_IDEMAP_ALL_RPAGES
thr3_MMU_ASI_AS_IF_USER_SECONDARY_LITTLE_203:
	.word	0x87802019
	.word	0xd0f2e028
	.word	0xd45c2068
	P_TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_IDEMAP_ALL
	P_ACCESS_DTSB_PTR
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0xc072a4c0
	nop
	.word	0x1000000
	or	%g0, 0x50, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x230, %i7
	P_READ_DDATA_ACCESS
	P_IDEMAP_NCTX
	P_DDEMAP_NCTX
	.word	0xc45da098
	.word	0x1000000
	or	%g0, 0x01f, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x013, %i7
	P_LOAD_IDATA_IN
	.word	0xfe5aa440
	.word	0xfcdc0200
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v008_exit:
	EXIT_GOOD
Thr3_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v104 DATA_VA=0x6c00000f0000
attr_data {
	Name = .Thr3_User_Data_4v104 ,
	VA = 0x6c00000f0000 ,/* 0x6c00000fffc0 */
	RA = 0x0180f50000 ,
	PA = 0x3d80f50000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c00000f01bd 8000003d80f50041 */
	end_label   = Thr3_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v104_data_begin
Thr3_User_Data_4v104_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v009 TEXT_VA=0x6c0000310000
attr_text {
	Name = .Thr3_User_Text_4v009 ,
	VA = 0x6c0000310000 ,/* 0x6c000031ffc0 */
	RA = 0x0180170000 ,
	PA = 0x3d80170000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c00003101bd 8000003d80170481 */
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
	or	%g0, 0x07a, %i7
	LOAD_DDATA_IN
	.word	0xc075a548
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x246, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe4aa746
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfe5aa7a8
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v009_exit:
	EXIT_GOOD
Thr3_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00a TEXT_VA=0x6d002a400000
attr_text {
	Name = .Thr3_User_Text_4v00a ,
	VA = 0x6d002a400000 ,/* 0x6d002a7fffc0 */
	RA = 0x020c400000 ,
	PA = 0x020c400000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d002a4001bd 800000020c400483 */
	end_label   = Thr3_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00a_text_begin
Thr3_User_Text_4v00a_text_begin:
	wrpr	0, %gl
	P_DDEMAP_ALL
	P_DDEMAP_NCTX
	P_IDEMAP_ALL_PAGES
	.word	0xce76e0a8
	.word	0xc0742d10
	.word	0xbe82a0c0
	.word	0xe0dfc200
	.word	0x1000000
	or	%g0, 0x078, %i7
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
	.word	0xe45c2018
	P_IDEMAP_ALL
	.word	0xca76e010
	.word	0xc026eb54
thr3_MMU_ASI_AS_IF_USER_PRIMARY_204:
	.word	0x87802010
	.word	0xf2f5a028
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x428, %i7
	P_ITLB_TAG_READ
	P_ACCESS_ITSB_PTR
	.word	0xbe8420c0
	.word	0xe0dfd000
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x2f9, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfe46e874
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v00a_exit:
	EXIT_GOOD
Thr3_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v105 DATA_VA=0x6be0000d2000
attr_data {
	Name = .Thr3_User_Data_4v105 ,
	VA = 0x6be0000d2000 ,/* 0x6be0000d3fc0 */
	RA = 0x0110196000 ,
	PA = 0x0110196000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006be0000d21bd 8000000110196040 */
	end_label   = Thr3_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v105_data_begin
Thr3_User_Data_4v105_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00b TEXT_VA=0x6c0000730000
attr_text {
	Name = .Thr3_User_Text_4v00b ,
	VA = 0x6c0000730000 ,/* 0x6c000073ffc0 */
	RA = 0x01806d0000 ,
	PA = 0x3d806d0000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c00007301bd 8000003d806d0481 */
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
	.word	0xfcd89000
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
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4dadaa
	.word	0xc030a8c6
	DDEMAP_NCTX
	.word	0xf6592068
	IDEMAP_NCTX
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
	.word	0xec5ee138
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd9000
	.word	0xc19c5f20
	.word	0x1000000
	or	%g0, 0x38, %i7
	READ_IDATA_ACCESS
	.word	0xc0742790
	nop
	nop
	nop
	nop
	.word	0xfe50ac2e
	IDEMAP_ALL
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x389, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x048, %i7
	LOAD_IDATA_IN
	.word	0xc025a6a4
thr3_MMU_ASI_BLK_P_205:
	.word	0x878020f0
	.word	0xc3beef40
	.word	0xfc9a9000
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x648, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_IM
	nop
	nop
	.word	0xfe45a0b8
	.word	0xfe5427a8
	nop
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xc035a158
	.word	0x81c76000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00b_exit:
	EXIT_GOOD
Thr3_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v106 DATA_VA=0x6c00008a0000
attr_data {
	Name = .Thr3_User_Data_4v106 ,
	VA = 0x6c00008a0000 ,/* 0x6c00008affc0 */
	RA = 0x01801e0000 ,
	PA = 0x3d801e0000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c00008a01bd 8000003d801e0041 */
	end_label   = Thr3_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v106_data_begin
Thr3_User_Data_4v106_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00c TEXT_VA=0x6be00006e000
attr_text {
	Name = .Thr3_User_Text_4v00c ,
	VA = 0x6be00006e000 ,/* 0x6be00006ffc0 */
	RA = 0x0110040000 ,
	PA = 0x0110040000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006be00006e1bd 8000000110040480 */
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
thr3_MMU_ASI_BLK_P_206:
	.word	0x878020f0
	.word	0xc1b8a840
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x3fe, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0xc03128b0
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc02128ec
	.word	0x1000000
	or	%g0, 0x1c5, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x42a, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	.word	0xfe5dabc0
	.word	0xfe5aa440
	DDEMAP_ALL_RPAGES
	.word	0xc02da7ef
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_207:
	.word	0x87802080
	.word	0xc8f6e038
	.word	0xc025aae4
thr3_MMU_ASI_PRIMARY_208:
	.word	0x87802080
	.word	0xcef12150
	nop
	.word	0xbe842008
	.word	0xecdfd000
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcded000
	.word	0xfc9a9d40
	DDEMAP_ALL_RPAGES
thr3_MMU_ASI_PRIMARY_209:
	.word	0x87802080
	.word	0xc8f6e098
	.word	0xbe80a148
	.word	0xd4dfd000
	.word	0xfc9d9c40
	.word	0xbe82a128
	.word	0xc4dfd000
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x042, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x268, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x178, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe174000
	GOTO_SUPERVISOR0
	.word	0xfe5c20a0
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v00c_exit:
	EXIT_GOOD
Thr3_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v107 DATA_VA=0x6c0000c70000
attr_data {
	Name = .Thr3_User_Data_4v107 ,
	VA = 0x6c0000c70000 ,/* 0x6c0000c7ffc0 */
	RA = 0x01805e0000 ,
	PA = 0x3d805e0000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c0000c701bd 8000003d805e0041 */
	end_label   = Thr3_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v107_data_begin
Thr3_User_Data_4v107_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00d TEXT_VA=0x6be000102000
attr_text {
	Name = .Thr3_User_Text_4v00d ,
	VA = 0x6be000102000 ,/* 0x6be000103fc0 */
	RA = 0x011001c000 ,
	PA = 0x011001c000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006be0001021bd 800000011001c480 */
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
	.word	0xdc742028
	.word	0xc025a3d8
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x6ef, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_ALL_PAGES
	.word	0xe072a128
	.word	0xc03429ee
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xbe85a128
	.word	0xecdfd000
	.word	0x1000000
	or	%g0, 0x238, %i7
	READ_DDATA_ACCESS
	.word	0xbe150000
	GOTO_SUPERVISOR1
	IDEMAP_PCTX
thr3_MMU_ASI_BLK_P_210:
	.word	0x878020f0
	.word	0xc1beeac0
	.word	0xec72a0f8
	.word	0xc076e500
	.word	0xfcdc1000
	TOGGLE_LSU_IM
thr3_MMU_ASI_PRIMARY_211:
	.word	0x87802080
	.word	0xd6f42010
	.word	0x1000000
	or	%g0, 0xc8, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4fe, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_ALL_RPAGES
	.word	0xc020a158
	.word	0xfc9c1000
	DDEMAP_ALL
	DDEMAP_ALL
	.word	0xf65aa068
	.word	0xc072aab8
	.word	0xfcdd9040
	.word	0x1000000
	.word	0xbe138000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc022a79c
	.word	0x1000000
	or	%g0, 0x061, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
thr3_MMU_ASI_PRIMARY_212:
	.word	0x87802080
	.word	0xe0f2a068
	.word	0xbe812098
	.word	0xf6dfd000
	nop
	.word	0x1000000
	or	%g0, 0x064, %i7
	LOAD_IDATA_IN
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x678, %i7
	LOAD_DDATA_ACCESS
	.word	0xc02aa628
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x161, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_RPAGE
	DDEMAP_NCTX
	.word	0xe19edf00
	.word	0xc45c2068
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe4aa288
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00d_exit:
	EXIT_GOOD
Thr3_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v108 DATA_VA=0x6d001bc00000
attr_data {
	Name = .Thr3_User_Data_4v108 ,
	VA = 0x6d001bc00000 ,/* 0x6d001bffffc0 */
	RA = 0x0203400000 ,
	PA = 0x0203400000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006d001bc001bd 8000000203400043 */
	end_label   = Thr3_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v108_data_begin
Thr3_User_Data_4v108_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00e TEXT_VA=0x6be0001fe000
attr_text {
	Name = .Thr3_User_Text_4v00e ,
	VA = 0x6be0001fe000 ,/* 0x6be0001fffc0 */
	RA = 0x0110142000 ,
	PA = 0x0110142000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006be0001fe1bd 8000000110142480 */
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
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x558, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0xfe45a20c
	.word	0x1000000
	or	%g0, 0x071, %i7
	LOAD_DDATA_IN
	.word	0xc0342778
	.word	0xfe442af0
	.word	0x1000000
	.word	0xbe12c000
	IDEMAP_PAGE
	.word	0xbe164000
	GOTO_SUPERVISOR1
	TOGGLE_LSU_IM
	TOGGLE_LSU_IM
	.word	0xe2742070
	.word	0xc02c21c5
	.word	0x1000000
	or	%g0, 0x013, %i7
	LOAD_DDATA_IN
	.word	0xfe52ad08
	.word	0x1000000
	or	%g0, 0x43e, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe174000
	GOTO_SUPERVISOR0
	.word	0xfa72a020
	.word	0xc075a4f8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00e_exit:
	EXIT_GOOD
Thr3_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v109 DATA_VA=0x6d0012400000
attr_data {
	Name = .Thr3_User_Data_4v109 ,
	VA = 0x6d0012400000 ,/* 0x6d00127fffc0 */
	RA = 0x020d800000 ,
	PA = 0x020d800000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006d00124001bd 800000020d800043 */
	end_label   = Thr3_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v109_data_begin
Thr3_User_Data_4v109_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00f TEXT_VA=0x6be000048000
attr_text {
	Name = .Thr3_User_Text_4v00f ,
	VA = 0x6be000048000 ,/* 0x6be000049fc0 */
	RA = 0x0110054000 ,
	PA = 0x0110054000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006be0000481bd 8000000110054480 */
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
	.word	0x1000000
	or	%g0, 0x038, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a0e8
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
	.word	0x1000000
	or	%g0, 0x530, %i7
	ITLB_TAG_READ
	.word	0xc032a688
	.word	0xfcdd9000
	.word	0xfe52ae0a
	.word	0xbe82a038
	.word	0xd4dfd000
	DDEMAP_ALL_PAGES
	IDEMAP_ALL_PAGES
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	TOGGLE_LSU_IM
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0242d90
	.word	0x1000000
	or	%g0, 0x150, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe160000
	DDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xec5c2108
	DDEMAP_NCTX
	.word	0xc072a338
	.word	0x1000000
	.word	0xbe118000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xf6592108
	.word	0xfe512d5a
	.word	0x1000000
	or	%g0, 0x5c1, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xce72a020
	.word	0xc030a9aa
	.word	0xc032aef2
	.word	0x1000000
	or	%g0, 0x633, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe842008
	.word	0xf6dfd000
	.word	0x1000000
	or	%g0, 0x688, %i7
	DTLB_TAG_READ
	DDEMAP_ALL_PAGES
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x06b, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xd0712028
	.word	0xc02c2158
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00f_exit:
	EXIT_GOOD
Thr3_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10a DATA_VA=0x6e0b50000000
attr_data {
	Name = .Thr3_User_Data_4v10a ,
	VA = 0x6e0b50000000 ,/* 0x6e0b5fffffc0 */
	RA = 0x0290000000 ,
	PA = 0x0290000000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006e0b500001bd 8000000290000045 */
	end_label   = Thr3_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10a_data_begin
Thr3_User_Data_4v10a_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v010 TEXT_VA=0x6be000174000
attr_text {
	Name = .Thr3_User_Text_4v010 ,
	VA = 0x6be000174000 ,/* 0x6be000175fc0 */
	RA = 0x0110098000 ,
	PA = 0x0110098000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006be0001741bd 8000000110098480 */
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
thr3_MMU_ASI_BLK_S_213:
	.word	0x878020f1
	.word	0xc1b96140
	.word	0xec72a038
	.word	0xc036e4ba
	IDEMAP_ALL_RPAGES
	.word	0xe45c2018
	nop
	.word	0xc0742308
thr3_MMU_ASI_PRIMARY_214:
	.word	0x87802080
	.word	0xdef2a0f0
	.word	0xfe55ae48
	DDEMAP_NCTX
	.word	0xf65ee0c0
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0xbe842008
	.word	0xd4dfd000
	.word	0xbe842038
	.word	0xd4dfd000
	.word	0xbe120000
	GOTO_SUPERVISOR1
	TOGGLE_LSU_IM
thr3_MMU_ASI_PRIMARY_215:
	.word	0x87802080
	.word	0xd0f5a028
	.word	0x1000000
	or	%g0, 0x598, %i7
	ITLB_TAG_READ
thr3_MMU_ASI_PRIMARY_216:
	.word	0x87802080
	.word	0xc6f2a0a8
	.word	0x1000000
	or	%g0, 0x044, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x324, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xcc70a048
	.word	0xc0342794
	.word	0xbe150000
	GOTO_SUPERVISOR1
	DDEMAP_ALL
	DDEMAP_NCTX
	TOGGLE_LSU_DM
	.word	0xc45ee098
	.word	0xc025a200
	.word	0xf65aa118
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x570, %i7
	ITLB_TAG_READ
	.word	0xe45c2018
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xd45c20e8
	ACCESS_ITSB_PTR
	DDEMAP_ALL_PAGES
	IDEMAP_PCTX
	IDEMAP_ALL
	.word	0xbe85a008
	.word	0xc4dfd000
	.word	0xf65c20c0
	.word	0xfcdc1000
	ACCESS_ITSB_PTR
	.word	0xfe55af90
	.word	0xfe542ca0
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc026ecc0
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v010_exit:
	EXIT_GOOD
Thr3_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10b DATA_VA=0x6be0000c0000
attr_data {
	Name = .Thr3_User_Data_4v10b ,
	VA = 0x6be0000c0000 ,/* 0x6be0000c1fc0 */
	RA = 0x0110058000 ,
	PA = 0x0110058000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006be0000c01bd 8000000110058040 */
	end_label   = Thr3_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10b_data_begin
Thr3_User_Data_4v10b_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v011 TEXT_VA=0x6d003bc00000
attr_text {
	Name = .Thr3_User_Text_4v011 ,
	VA = 0x6d003bc00000 ,/* 0x6d003bffffc0 */
	RA = 0x0203800000 ,
	PA = 0x0203800000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d003bc001bd 8000000203800483 */
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
	.word	0xbe85a098
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x096, %i7
	LOAD_IDATA_IN
	.word	0xc072a240
	.word	0xe670a020
	.word	0xc02c24ab
	IDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_PAGE
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe174000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	ACCESS_DTSB_PTR
	.word	0xfcdc1000
	.word	0xfcded000
	.word	0xc026e3a8
	.word	0xd270a0a8
	.word	0xc075a620
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x396, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x053, %i7
	LOAD_IDATA_IN
thr3_MMU_ASI_PRIMARY_217:
	.word	0x87802080
	.word	0xd8f5a048
	.word	0xfcda9000
	.word	0xc02c2bb7
	.word	0xbe82a008
	.word	0xd4dfd000
	.word	0xf65da0e8
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe16c000
	DDEMAP_RPAGE
thr3_MMU_ASI_PRIMARY_218:
	.word	0x87802080
	.word	0xd0f0a088
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe104000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x98, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe138000
	IDEMAP_RPAGE
	DDEMAP_NCTX
	.word	0xc85ee098
	.word	0x1000000
	or	%g0, 0xd0, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
thr3_MMU_ASI_PRIMARY_219:
	.word	0x87802080
	.word	0xd8f0a048
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_220:
	.word	0x87802080
	.word	0xcaf5a040
	.word	0xee72a0a0
	.word	0xc072a4f0
	.word	0xc0292326
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4c274a
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v011_exit:
	EXIT_GOOD
Thr3_User_Text_4v011_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10c DATA_VA=0x6d003b400000
attr_data {
	Name = .Thr3_User_Data_4v10c ,
	VA = 0x6d003b400000 ,/* 0x6d003b7fffc0 */
	RA = 0x020cc00000 ,
	PA = 0x020cc00000 ,
	TTE_Context = 0x01bd ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006d003b4001bd 800000020cc00043 */
	end_label   = Thr3_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10c_data_begin
Thr3_User_Data_4v10c_data_begin:
	.xword	0x6be0001ec000
	.xword	0x6be000062000
	.xword	0x6be000020000
	.xword	0x6c0000fc0000
	.xword	0x6d001ac00000
	.xword	0x6be0000ea000
	.xword	0x6c0000190000
	.xword	0x6c0000830000
	.xword	0x6be00007c000
	.xword	0x6c0000f50000
	.xword	0x6be00005c000
	.xword	0x6be000184000
	.xword	0x6e0e90000000
	.xword	0x6be0001e0000
	.xword	0x6be0000ec000
	.xword	0x6be00005e000
	.xword	0x6be000056000
	.xword	0x6be00017e000
	.xword	0x6c00003f0000
	.xword	0x6be0001a6000
	.xword	0x6be0000e6000
	.xword	0x6be0000dc000
	.xword	0x6d0019c00000
	.xword	0x6be0000f2000
	.xword	0x6c00000f0000
	.xword	0x6c0000310000
	.xword	0x6d002a400000
	.xword	0x6be0000d2000
	.xword	0x6c0000730000
	.xword	0x6c00008a0000
	.xword	0x6be00006e000
	.xword	0x6c0000c70000
	.xword	0x6be000102000
	.xword	0x6d001bc00000
	.xword	0x6be0001fe000
	.xword	0x6d0012400000
	.xword	0x6be000048000
	.xword	0x6e0b50000000
	.xword	0x6be000174000
	.xword	0x6be0000c0000
	.xword	0x6d003bc00000
	.xword	0x6d003b400000
	.xword	0x6c0000430000
Thr3_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v012 TEXT_VA=0x6c0000430000
attr_text {
	Name = .Thr3_User_Text_4v012 ,
	VA = 0x6c0000430000 ,/* 0x6c000043ffc0 */
	RA = 0x0180690000 ,
	PA = 0x3d80690000 ,
	TTE_Context = 0x01bd ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c00004301bd 8000003d80690481 */
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a038
	.word	0xd4dfd000
	nop
	nop
	nop
	.word	0xcc75a048
	.word	0xc070a4d0
	.word	0xfe50a916
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe174000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x02d, %i7
	LOAD_IDATA_IN
	.word	0xc876e138
	.word	0xc0242454
thr3_MMU_ASI_PRIMARY_221:
	.word	0x87802080
	.word	0xdcf6e028
	DDEMAP_ALL
	.word	0xfcd95020
	.word	0xc85aa038
	.word	0xee75a018
	.word	0xc0712bc0
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xec58a0e8
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v012_exit:
	EXIT_GOOD
Thr3_User_Text_4v012_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x6ff000094000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	VA = 0x6ff000094000 ,/* 0x6ff000095fc0 */
	RA = 0x0120074000 ,
	PA = 0x0120074000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006ff00009571f 8000000120074080 */
	end_label   = Thr4_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr4_user_code_entry
Thr4_user_code_entry:
	setx	0x7000006d0000, %g1, %g2
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
	.word	0xd876e0c8
	.word	0xc070a678
	DDEMAP_ALL
	TOGGLE_LSU_DM
	.word	0xfcded000
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
	.word	0xfe45a490
	.word	0xc0742f08
	.word	0xbe120000
	GOTO_SUPERVISOR1
	ACCESS_DTSB_PTR
	IDEMAP_ALL_RPAGES
	.word	0xc0712b30
	nop
	nop
	nop
	nop
	.word	0xc02da457
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	READ_IDATA_ACCESS
	.word	0xfcded000
	.word	0xfcded000
	.word	0xc070ad40
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x370, %i7
	DTLB_TAG_READ
thr4_MMU_ASI_BLK_PL_222:
	.word	0x878020f8
	.word	0xe3bda9c0
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
	.word	0xc020ac38
	.word	0xf85c2018
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x2e8, %i7
	READ_DDATA_ACCESS
thr4_MMU_ASI_PRIMARY_223:
	.word	0x87802080
	.word	0xf2f6e090
	.word	0xfc9c1c40
thr4_MMU_ASI_SECONDARY_LITTLE_224:
	.word	0x87802089
	.word	0xe4bae580
	.word	0xda76e080
	.word	0xc02aa7bd
	.word	0xcc72a0c8
	.word	0xc02da33f
	.word	0x1000000
	or	%g0, 0x560, %i7
	READ_IDATA_ACCESS
	.word	0xfcded000
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
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe52a99a
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v000_exit:
	EXIT_GOOD
Thr4_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v100 DATA_VA=0x7000006d0000
attr_data {
	Name = .Thr4_User_Data_4v100 ,
	VA = 0x7000006d0000 ,/* 0x7000006dffc0 */
	RA = 0x0190330000 ,
	PA = 0x4d90330000 ,
	TTE_Context = 0x16f8 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007000006d16f8 8000004d90330041 */
	end_label   = Thr4_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v100_data_begin
Thr4_User_Data_4v100_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v200 DATA_VA=0x6ff0000b6000
attr_data {
	Name = .Thr4_User_Data_4v200 ,
	VA = 0x6ff0000b6000 ,/* 0x6ff0000b7fc0 */
	RA = 0x01201f6000 ,
	PA = 0x01201f6000 ,
	TTE_Context = 0x086b ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006ff0000b6f4c 80000001201f6440 */
	end_label   = Thr4_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v200_data_begin
Thr4_User_Data_4v200_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v300 DATA_VA=0x71003fc00000
attr_data {
	Name = .Thr4_User_Data_4v300 ,
	VA = 0x71003fc00000 ,/* 0x71003fffffc0 */
	RA = 0x021dc00000 ,
	PA = 0x4e1dc00000 ,
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
	/* DTTE_TAG_DATA = 000071003fc00000 8000004e1dc00443 */
	end_label   = Thr4_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v300_data_begin
Thr4_User_Data_4v300_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v001 TEXT_VA=0x700000590000
attr_text {
	Name = .Thr4_User_Text_4v001 ,
	VA = 0x700000590000 ,/* 0x70000059ffc0 */
	RA = 0x0190400000 ,
	PA = 0x4d90400000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007000005916f8 8000004d90400081 */
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
	.word	0xfe4ee625
	.word	0xfe4ee66a
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DO_BRANCH
	.word	0x81c66000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xf65c20c0
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v001_exit:
	EXIT_GOOD
Thr4_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v400 TEXT_VA=0x700000810000
attr_text {
	Name = .Thr4_User_Text_4v400 ,
	VA = 0x700000810000 ,/* 0x70000081ffc0 */
	RA = 0x0190a20000 ,
	PA = 0x4d90a20000 ,
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
	/* ITTE_TAG_DATA = 0000700000810000 8000004d90a20081 */
	end_label   = Thr4_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v400_text_begin
Thr4_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xfcdd8200
	P_IDEMAP_NCTX
	.word	0xbe82a0e0
	.word	0xe0dfd000
	P_IDEMAP_ALL
	.word	0x1000000
	.word	0xbe144000
	P_IDEMAP_RPAGE
	.word	0xfc995d60
	.word	0x1000000
	or	%g0, 0x550, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x070, %i7
	P_LOAD_IDATA_IN
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
	.word	0xfe41aed8
	.word	0xfe51aaf6
	.word	0x1000000
	or	%g0, 0xa0, %i7
	P_READ_IDATA_ACCESS
	.word	0xfe4e2127
	.word	0xbe80a110
	.word	0xd4dfc200
	P_TOGGLE_LSU_IM
	.word	0xfcd91000
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
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd8200
	P_IDEMAP_ALL_RPAGES
	.word	0xbe82a0e0
	.word	0xc4dfd000
	P_TOGGLE_LSU_DM
	.word	0xfe532cb8
	.word	0xfcdc0200
	P_DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	P_READ_IDATA_ACCESS
thr4_MMU_ASI_AS_IF_USER_PRIMARY_225:
	.word	0x87802010
	.word	0xeaf5a020
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45e20f0
	.word	0x1000000
	or	%g0, 0x10c, %i7
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
thr4_MMU_ASI_AS_IF_USER_SECONDARY_226:
	.word	0x87802011
	.word	0xe0f5e0e0
thr4_MMU_ASI_PRIMARY_LITTLE_227:
	.word	0x87802088
	.word	0xccf2a018
	.word	0x1000000
	or	%g0, 0x088, %i7
	P_LOAD_DDATA_IN
	.word	0xbe174000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v400_exit:
	EXIT_GOOD
Thr4_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v002 TEXT_VA=0x6ff000116000
attr_text {
	Name = .Thr4_User_Text_4v002 ,
	VA = 0x6ff000116000 ,/* 0x6ff000117fc0 */
	RA = 0x012007c000 ,
	PA = 0x012007c000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006ff00011771f 800000012007c080 */
	end_label   = Thr4_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v002_text_begin
Thr4_User_Text_4v002_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_DM
thr4_MMU_ASI_SECONDARY_228:
	.word	0x87802081
	.word	0xcaf46010
	.word	0x1000000
	or	%g0, 0x026, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	.word	0x1000000
	or	%g0, 0x031, %i7
	P_LOAD_DDATA_IN
thr4_MMU_ASI_AS_IF_USER_PRIMARY_229:
	.word	0x87802010
	.word	0xdef42080
thr4_MMU_ASI_AS_IF_USER_PRIMARY_230:
	.word	0x87802010
	.word	0xc6f0a090
thr4_MMU_ASI_PRIMARY_231:
	.word	0x87802080
	.word	0xe8f5a058
	.word	0x1000000
	or	%g0, 0x49f, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfe542eac
thr4_MMU_ASI_BLK_SL_232:
	.word	0x878020f9
	.word	0xc1bae380
	P_TOGGLE_LSU_DM
	.word	0xbe82a0e0
	.word	0xf6dfc200
	.word	0xfcd90200
	P_TOGGLE_LSU_IM
	.word	0xfcd91000
	.word	0x1000000
	.word	0xbe154000
	P_DDEMAP_RPAGE
	.word	0xfcda9000
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_IM
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v002_exit:
	EXIT_GOOD
Thr4_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v101 DATA_VA=0x700000b00000
attr_data {
	Name = .Thr4_User_Data_4v101 ,
	VA = 0x700000b00000 ,/* 0x700000b0ffc0 */
	RA = 0x01903e0000 ,
	PA = 0x4d903e0000 ,
	TTE_Context = 0x16f8 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000700000b016f8 8000004d903e0041 */
	end_label   = Thr4_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v101_data_begin
Thr4_User_Data_4v101_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v201 DATA_VA=0x7000005b0000
attr_data {
	Name = .Thr4_User_Data_4v201 ,
	VA = 0x7000005b0000 ,/* 0x7000005bffc0 */
	RA = 0x0190770000 ,
	PA = 0x4d90770000 ,
	TTE_Context = 0x086b ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007000005b086b 8000004d90770441 */
	end_label   = Thr4_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v201_data_begin
Thr4_User_Data_4v201_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v301 DATA_VA=0x700000a70000
attr_data {
	Name = .Thr4_User_Data_4v301 ,
	VA = 0x700000a70000 ,/* 0x700000a7ffc0 */
	RA = 0x0190270000 ,
	PA = 0x4d90270000 ,
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
	/* DTTE_TAG_DATA = 0000700000a70000 8000004d90270441 */
	end_label   = Thr4_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v301_data_begin
Thr4_User_Data_4v301_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v003 TEXT_VA=0x710016c00000
attr_text {
	Name = .Thr4_User_Text_4v003 ,
	VA = 0x710016c00000 ,/* 0x710016ffffc0 */
	RA = 0x021e800000 ,
	PA = 0x4e1e800000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000710016c016f8 8000004e1e800083 */
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
	.word	0xc02ee33e
	.word	0xfcdd9000
thr4_MMU_ASI_BLK_S_233:
	.word	0x878020f1
	.word	0xe3bae980
	.word	0xfe5c2e98
thr4_MMU_ASI_BLK_PL_234:
	.word	0x878020f8
	.word	0xc1bda7c0
	.word	0xfcda9000
	ACCESS_ITSB_PTR
	.word	0xfe542518
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x091, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	IDEMAP_ALL_RPAGES
	.word	0xd6592070
	IDEMAP_ALL_RPAGES
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xf8592018
	.word	0xc02daaf4
	DDEMAP_PCTX
	nop
	.word	0xc025a9d4
thr4_MMU_ASI_SECONDARY_235:
	.word	0x87802081
	.word	0xf4bc6de0
	.word	0x1000000
	or	%g0, 0x58d, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xcc592018
	.word	0x1000000
	or	%g0, 0x4e8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe108000
	IDEMAP_PAGE
	.word	0x1000000
	.word	0xbe170000
	DDEMAP_RPAGE
	.word	0xbe120000
	GOTO_SUPERVISOR1
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x0af, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_IM
thr4_MMU_ASI_PRIMARY_236:
	.word	0x87802080
	.word	0xc8f5a110
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_RPAGE
	.word	0xbe816010
	.word	0xc39fde20
	DDEMAP_NCTX
	.word	0xfcda9000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf475a090
	.word	0xc0342604
	.word	0x81c66000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v003_exit:
	EXIT_GOOD
Thr4_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v401 TEXT_VA=0x700000ec0000
attr_text {
	Name = .Thr4_User_Text_4v401 ,
	VA = 0x700000ec0000 ,/* 0x700000ecffc0 */
	RA = 0x0190c50000 ,
	PA = 0x4d90c50000 ,
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
	/* ITTE_TAG_DATA = 0000700000ec0000 8000004d90c50081 */
	end_label   = Thr4_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v401_text_begin
Thr4_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0xfcdc0200
thr4_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_237:
	.word	0x8780202a
	.word	0xccbc24b0
	P_DDEMAP_ALL_PAGES
	.word	0xd65f2010
	.word	0xc029a5ca
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x180, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x115, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xe8732028
	.word	0xc029adbd
	P_IDEMAP_ALL_RPAGES
	.word	0xbe842008
	.word	0xd4dfc200
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v401_exit:
	EXIT_GOOD
Thr4_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v004 TEXT_VA=0x6ff000196000
attr_text {
	Name = .Thr4_User_Text_4v004 ,
	VA = 0x6ff000196000 ,/* 0x6ff000197fc0 */
	RA = 0x0120008000 ,
	PA = 0x0120008000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006ff00019771f 8000000120008080 */
	end_label   = Thr4_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v004_text_begin
Thr4_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xfc998480
	.word	0x1000000
	.word	0xbe144000
	P_IDEMAP_RPAGE
	.word	0xfc995c60
	.word	0xfcdc0200
	.word	0xfcdd8200
	.word	0x1000000
	or	%g0, 0x78, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x558, %i7
	P_DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x081, %i7
	P_LOAD_DDATA_IN
	.word	0xbe86e008
	.word	0xc8dfd000
	P_IDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_RPAGES
	.word	0xbe82a038
	.word	0xd4dfc200
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v004_exit:
	EXIT_GOOD
Thr4_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v102 DATA_VA=0x71003f400000
attr_data {
	Name = .Thr4_User_Data_4v102 ,
	VA = 0x71003f400000 ,/* 0x71003f7fffc0 */
	RA = 0x0214000000 ,
	PA = 0x4e14000000 ,
	TTE_Context = 0x16f8 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000071003f4016f8 8000004e14000043 */
	end_label   = Thr4_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v102_data_begin
Thr4_User_Data_4v102_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v202 DATA_VA=0x710020400000
attr_data {
	Name = .Thr4_User_Data_4v202 ,
	VA = 0x710020400000 ,/* 0x7100207fffc0 */
	RA = 0x0214800000 ,
	PA = 0x4e14800000 ,
	TTE_Context = 0x086b ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000071002040086b 8000004e14800443 */
	end_label   = Thr4_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v202_data_begin
Thr4_User_Data_4v202_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v302 DATA_VA=0x7000002a0000
attr_data {
	Name = .Thr4_User_Data_4v302 ,
	VA = 0x7000002a0000 ,/* 0x7000002affc0 */
	RA = 0x0190510000 ,
	PA = 0x4d90510000 ,
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
	/* DTTE_TAG_DATA = 00007000002a0000 8000004d90510441 */
	end_label   = Thr4_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v302_data_begin
Thr4_User_Data_4v302_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v005 TEXT_VA=0x6ff000018000
attr_text {
	Name = .Thr4_User_Text_4v005 ,
	VA = 0x6ff000018000 ,/* 0x6ff000019fc0 */
	RA = 0x012002e000 ,
	PA = 0x012002e000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006ff00001971f 800000012002e080 */
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
	IDEMAP_ALL
thr4_MMU_ASI_PRIMARY_LITTLE_238:
	.word	0x87802088
	.word	0xc8bda480
	.word	0x1000000
	or	%g0, 0x655, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe52a8a8
	.word	0xd8742048
	.word	0xc076e940
	.word	0xfe542ac0
	.word	0xbe842098
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x5e8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x787, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x094, %i7
	LOAD_DDATA_IN
	IDEMAP_PCTX
	nop
	nop
	nop
	nop
	.word	0xe05ee0e0
	.word	0xc02eefd8
	.word	0xc0742970
	.word	0xc0712bd8
	nop
	nop
	nop
	.word	0xc0342a48
	.word	0xfe56edbc
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe56e888
	DDEMAP_ALL
	TOGGLE_LSU_IM
	nop
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	DTLB_TAG_READ
	.word	0xec5c2068
	.word	0x1000000
	or	%g0, 0x440, %i7
	READ_DDATA_ACCESS
thr4_MMU_ASI_PRIMARY_LITTLE_239:
	.word	0x87802088
	.word	0xd8b92580
	ACCESS_ITSB_PTR
	IDEMAP_ALL_RPAGES
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x089, %i7
	LOAD_IDATA_IN
	.word	0xfc9a9d40
	.word	0xbe168000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	DDEMAP_ALL
	DDEMAP_SCTX
	.word	0xfe592790
	.word	0xd8742018
	.word	0xc032ae90
	nop
	nop
	nop
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x00a, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x036, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_BLK_COMMIT_P_240:
	.word	0x878020e0
	.word	0xe3b8abc0
	IDEMAP_NCTX
	.word	0xc675a0f8
	.word	0xc076eaf8
	.word	0xfe56e5c6
	nop
	nop
thr4_MMU_ASI_PRIMARY_241:
	.word	0x87802080
	.word	0xe6f6e108
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xf05da018
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v005_exit:
	EXIT_GOOD
Thr4_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v402 TEXT_VA=0x6ff0001f0000
attr_text {
	Name = .Thr4_User_Text_4v402 ,
	VA = 0x6ff0001f0000 ,/* 0x6ff0001f1fc0 */
	RA = 0x0120094000 ,
	PA = 0x0120094000 ,
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
	/* ITTE_TAG_DATA = 00006ff0001f0000 8000000120094080 */
	end_label   = Thr4_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v402_text_begin
Thr4_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x150, %i7
	P_ITLB_TAG_READ
	.word	0xbe8420c0
	.word	0xd4dfc200
	.word	0x1000000
	.word	0xbe174000
	P_IDEMAP_RPAGE
	.word	0xbe86e100
	.word	0xc8dfd040
thr4_MMU_ASI_AS_IF_USER_PRIMARY_242:
	.word	0x87802010
	.word	0xe2f2a010
	P_TOGGLE_LSU_DM
	P_ACCESS_DTSB_PTR
	.word	0xbe842038
	.word	0xd4dfc200
	.word	0xfe532830
	P_DDEMAP_PCTX
	.word	0xfcdec200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc85e2008
	.word	0x1000000
	or	%g0, 0x40, %i7
	P_READ_IDATA_ACCESS
thr4_MMU_ASI_AS_IF_USER_PRIMARY_243:
	.word	0x87802010
	.word	0xc4f5a0e0
	.word	0xfcdec200
	.word	0xfe432858
	nop
	nop
	nop
	P_DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a068
	.word	0xc4dfc200
	.word	0xfcdc1000
	.word	0xfcdac3a0
	nop
	nop
	nop
	nop
	nop
	.word	0xc45f2098
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	P_READ_IDATA_ACCESS
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x2ae, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xf8, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x02f, %i7
	P_LOAD_IDATA_IN
	.word	0xca5ca010
	.word	0xfc995020
	.word	0x1000000
	.word	0xbe178000
	P_IDEMAP_RPAGE
	P_TOGGLE_LSU_DM
	nop
	nop
	.word	0xbe842038
	.word	0xd4dfc200
thr4_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_244:
	.word	0x8780202b
	.word	0xc8bde780
	nop
	nop
	.word	0x1000000
	or	%g0, 0x400, %i7
	P_ITLB_TAG_READ
	.word	0xfcdc0200
	.word	0xe8732088
	.word	0xc0262c74
	P_TOGGLE_LSU_DM
thr4_MMU_ASI_BLK_P_245:
	.word	0x878020f0
	.word	0xe3bc2580
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x430, %i7
	P_READ_IDATA_ACCESS
	.word	0xf674a100
	.word	0xc0372afc
	P_ACCESS_DTSB_PTR
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v402_exit:
	EXIT_GOOD
Thr4_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v006 TEXT_VA=0x710009c00000
attr_text {
	Name = .Thr4_User_Text_4v006 ,
	VA = 0x710009c00000 ,/* 0x710009ffffc0 */
	RA = 0x0219000000 ,
	PA = 0x4e19000000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 0000710009c016f8 8000004e19000083 */
	end_label   = Thr4_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v006_text_begin
Thr4_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0xbe812098
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	P_DTLB_TAG_READ
	.word	0xbe812038
	.word	0xe0dfc200
	.word	0xfe42ad58
	P_ACCESS_DTSB_PTR
	.word	0xbe85a0e0
	.word	0xf6dfc200
	.word	0xc39c1f00
	P_TOGGLE_LSU_DM
thr4_MMU_ASI_PRIMARY_LITTLE_246:
	.word	0x87802088
	.word	0xeef5a010
	.word	0x1000000
	or	%g0, 0x428, %i7
	P_ITLB_TAG_READ
thr4_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_247:
	.word	0x87802018
	.word	0xdaf5a0d0
	.word	0xfcded000
	.word	0xc85c2038
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr4_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_248:
	.word	0x87802022
	.word	0xd0bdac50
	.word	0xfcdc0200
	P_IDEMAP_NCTX
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v006_exit:
	EXIT_GOOD
Thr4_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v103 DATA_VA=0x700000280000
attr_data {
	Name = .Thr4_User_Data_4v103 ,
	VA = 0x700000280000 ,/* 0x70000028ffc0 */
	RA = 0x01900a0000 ,
	PA = 0x4d900a0000 ,
	TTE_Context = 0x16f8 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007000002816f8 8000004d900a0041 */
	end_label   = Thr4_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v103_data_begin
Thr4_User_Data_4v103_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v203 DATA_VA=0x6ff00007e000
attr_data {
	Name = .Thr4_User_Data_4v203 ,
	VA = 0x6ff00007e000 ,/* 0x6ff00007ffc0 */
	RA = 0x01201ba000 ,
	PA = 0x01201ba000 ,
	TTE_Context = 0x086b ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006ff00007ef4c 80000001201ba440 */
	end_label   = Thr4_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v203_data_begin
Thr4_User_Data_4v203_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v303 DATA_VA=0x71002e400000
attr_data {
	Name = .Thr4_User_Data_4v303 ,
	VA = 0x71002e400000 ,/* 0x71002e7fffc0 */
	RA = 0x021ec00000 ,
	PA = 0x4e1ec00000 ,
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
	/* DTTE_TAG_DATA = 000071002e400000 8000004e1ec00443 */
	end_label   = Thr4_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v303_data_begin
Thr4_User_Data_4v303_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v007 TEXT_VA=0x6ff0000b0000
attr_text {
	Name = .Thr4_User_Text_4v007 ,
	VA = 0x6ff0000b0000 ,/* 0x6ff0000b1fc0 */
	RA = 0x0120110000 ,
	PA = 0x0120110000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006ff0000b171f 8000000120110080 */
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
	.word	0xd45da0e0
	.word	0xe072a100
	.word	0xc070ab08
	nop
	nop
	nop
	nop
	.word	0xfc991c40
	.word	0xc035ad96
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x5e3, %i7
	LOAD_IDATA_ACCESS
	.word	0xf85aa018
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xec5c2038
	.word	0xd65aa0a0
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	DTLB_TAG_READ
	ACCESS_DTSB_PTR
	TOGGLE_LSU_DM
	.word	0xc872a0c0
	.word	0xc032a8b0
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0x1000000
	or	%g0, 0x459, %i7
	LOAD_DDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0xc028a29d
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a0c0
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
	.word	0xfcdc1000
	.word	0xd6592010
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x1f1, %i7
	LOAD_IDATA_ACCESS
	TOGGLE_LSU_IM
	TOGGLE_LSU_IM
	.word	0xfcda9000
	.word	0xc02c23a8
	.word	0xbe85a0f0
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x03b, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0xfcdd9000
	.word	0xfe412934
	.word	0xc034255c
	.word	0xfcd89000
	.word	0x1000000
	.word	0xbe16c000
	DDEMAP_PAGE
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x588, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xec5da098
	DDEMAP_SCTX
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xe05ee0f0
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v007_exit:
	EXIT_GOOD
Thr4_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v008 TEXT_VA=0x6ff0001c4000
attr_text {
	Name = .Thr4_User_Text_4v008 ,
	VA = 0x6ff0001c4000 ,/* 0x6ff0001c5fc0 */
	RA = 0x0120080000 ,
	PA = 0x0120080000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006ff0001c571f 8000000120080080 */
	end_label   = Thr4_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v008_text_begin
Thr4_User_Text_4v008_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x049, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe17c000
	P_IDEMAP_PAGE
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe158000
	P_IDEMAP_PAGE
	.word	0xfcda9000
thr4_MMU_ASI_REAL_IO_LITTLE_249:
	.word	0x8780201d
	.word	0xcaf0a010
	.word	0xfe45ac3c
	.word	0x1000000
	or	%g0, 0x798, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x117, %i7
	P_LOAD_DDATA_ACCESS
	P_IDEMAP_ALL
	P_IDEMAP_NCTX
	.word	0xc19a82c0
	nop
	nop
	nop
	nop
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v008_exit:
	EXIT_GOOD
Thr4_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v104 DATA_VA=0x6ff00019c000
attr_data {
	Name = .Thr4_User_Data_4v104 ,
	VA = 0x6ff00019c000 ,/* 0x6ff00019dfc0 */
	RA = 0x012017a000 ,
	PA = 0x012017a000 ,
	TTE_Context = 0x16f8 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006ff00019d71f 800000012017a040 */
	end_label   = Thr4_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v104_data_begin
Thr4_User_Data_4v104_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v304 DATA_VA=0x700000300000
attr_data {
	Name = .Thr4_User_Data_4v304 ,
	VA = 0x700000300000 ,/* 0x70000030ffc0 */
	RA = 0x0190cd0000 ,
	PA = 0x4d90cd0000 ,
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
	/* DTTE_TAG_DATA = 0000700000300000 8000004d90cd0441 */
	end_label   = Thr4_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v304_data_begin
Thr4_User_Data_4v304_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v009 TEXT_VA=0x6ff00007a000
attr_text {
	Name = .Thr4_User_Text_4v009 ,
	VA = 0x6ff00007a000 ,/* 0x6ff00007bfc0 */
	RA = 0x0120188000 ,
	PA = 0x0120188000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006ff00007b71f 8000000120188080 */
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
	.word	0xfe45a1a4
	.word	0xfe4aa98e
	DDEMAP_ALL
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xea742108
	.word	0xc024220c
	.word	0x1000000
	or	%g0, 0x017, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x288, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x4cf, %i7
	LOAD_IDATA_ACCESS
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
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xdc75a088
	.word	0xc024246c
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v009_exit:
	EXIT_GOOD
Thr4_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00a TEXT_VA=0x6ff0001c2000
attr_text {
	Name = .Thr4_User_Text_4v00a ,
	VA = 0x6ff0001c2000 ,/* 0x6ff0001c3fc0 */
	RA = 0x01201ea000 ,
	PA = 0x01201ea000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006ff0001c371f 80000001201ea080 */
	end_label   = Thr4_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00a_text_begin
Thr4_User_Text_4v00a_text_begin:
	wrpr	0, %gl
	.word	0xee75a010
	.word	0xc02daa54
thr4_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_250:
	.word	0x87802022
	.word	0xd0baa130
	.word	0xbe85e070
	.word	0xe19fde20
	P_DDEMAP_NCTX
	.word	0xfcdd8200
	nop
	nop
	nop
	nop
	P_ACCESS_DTSB_PTR
	.word	0xbe86e038
	.word	0xecdfc200
thr4_MMU_ASI_AS_IF_USER_PRIMARY_251:
	.word	0x87802010
	.word	0xe6f5a0d0
thr4_MMU_ASI_AS_IF_USER_PRIMARY_252:
	.word	0x87802010
	.word	0xfaf2a080
	.word	0x1000000
	or	%g0, 0x6b0, %i7
	P_DTLB_TAG_READ
	.word	0xbe174000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v00a_exit:
	EXIT_GOOD
Thr4_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v105 DATA_VA=0x6ff0000b4000
attr_data {
	Name = .Thr4_User_Data_4v105 ,
	VA = 0x6ff0000b4000 ,/* 0x6ff0000b5fc0 */
	RA = 0x0120028000 ,
	PA = 0x0120028000 ,
	TTE_Context = 0x16f8 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006ff0000b571f 8000000120028040 */
	end_label   = Thr4_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v105_data_begin
Thr4_User_Data_4v105_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00b TEXT_VA=0x7000003c0000
attr_text {
	Name = .Thr4_User_Text_4v00b ,
	VA = 0x7000003c0000 ,/* 0x7000003cffc0 */
	RA = 0x01900b0000 ,
	PA = 0x4d900b0000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007000003c16f8 8000004d900b0081 */
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
	or	%g0, 0x15b, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_ALL_PAGES
	TOGGLE_LSU_IM
	.word	0xfcda9000
	nop
	nop
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
thr4_MMU_ASI_BLK_COMMIT_S_253:
	.word	0x878020e1
	.word	0xe3bdecc0
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe158000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x118, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_RPAGES
thr4_MMU_ASI_PRIMARY_254:
	.word	0x87802080
	.word	0xdcf2a028
	nop
thr4_MMU_ASI_PRIMARY_255:
	.word	0x87802080
	.word	0xcaf5a0a0
	.word	0xc4592098
	DDEMAP_ALL
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x178, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL_PAGES
	TOGGLE_LSU_IM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xf2742050
	.word	0xc022ac4c
	.word	0x81c66000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00b_exit:
	EXIT_GOOD
Thr4_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v106 DATA_VA=0x6ff00003e000
attr_data {
	Name = .Thr4_User_Data_4v106 ,
	VA = 0x6ff00003e000 ,/* 0x6ff00003ffc0 */
	RA = 0x01201fa000 ,
	PA = 0x01201fa000 ,
	TTE_Context = 0x16f8 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006ff00003f71f 80000001201fa040 */
	end_label   = Thr4_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v106_data_begin
Thr4_User_Data_4v106_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00c TEXT_VA=0x6ff0001a4000
attr_text {
	Name = .Thr4_User_Text_4v00c ,
	VA = 0x6ff0001a4000 ,/* 0x6ff0001a5fc0 */
	RA = 0x012014a000 ,
	PA = 0x012014a000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006ff0001a571f 800000012014a080 */
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
	.word	0xc022a608
	.word	0x1000000
	.word	0xbe16c000
	DDEMAP_RPAGE
	.word	0xfe592d20
	.word	0xbe8420f0
	.word	0xe0dfd000
	.word	0xbe842120
	.word	0xe0dfd000
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x520, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_IM
	DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x498, %i7
	READ_DDATA_ACCESS
	.word	0xc858a098
	.word	0xd45c2038
	.word	0x1000000
	or	%g0, 0x045, %i7
	LOAD_DDATA_IN
	ACCESS_ITSB_PTR
	DDEMAP_NCTX
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xda72a090
	.word	0xc076edc8
	.word	0x1000000
	or	%g0, 0x148, %i7
	READ_IDATA_ACCESS
	.word	0xea75a020
	.word	0xc02c29e2
	.word	0x1000000
	or	%g0, 0x28, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x388, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x61a, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x02d, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL_RPAGES
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_RPAGE
	.word	0xfe4ee59e
	.word	0x1000000
	or	%g0, 0x348, %i7
	DTLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x198, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe124000
	IDEMAP_RPAGE
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xc45ee100
	.word	0xd470a008
	.word	0xc076e400
	.word	0xfc9ddc60
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
	.word	0xbe154000
	IDEMAP_RPAGE
	.word	0xea76e050
	.word	0xc072af58
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	DTLB_TAG_READ
	.word	0xfcd91000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	IDEMAP_ALL
	.word	0xfe5eeff0
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0x67a, %i7
	LOAD_DDATA_ACCESS
	.word	0xc0242750
	.word	0xf85c2078
	TOGGLE_LSU_IM
	.word	0xfcda9000
	.word	0xd45aa120
	.word	0xc026e1d4
	.word	0x1000000
	.word	0xbe128000
	DDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0xbe8420f0
	.word	0xf6dfd000
	DDEMAP_ALL_PAGES
	.word	0xc070a130
	.word	0xc024249c
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0xbe82a038
	.word	0xc8dfd000
	DDEMAP_PCTX
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe4742018
	.word	0xc0242500
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v00c_exit:
	EXIT_GOOD
Thr4_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v107 DATA_VA=0x6ff0000b2000
attr_data {
	Name = .Thr4_User_Data_4v107 ,
	VA = 0x6ff0000b2000 ,/* 0x6ff0000b3fc0 */
	RA = 0x0120026000 ,
	PA = 0x0120026000 ,
	TTE_Context = 0x16f8 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006ff0000b371f 8000000120026040 */
	end_label   = Thr4_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v107_data_begin
Thr4_User_Data_4v107_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00d TEXT_VA=0x700000ad0000
attr_text {
	Name = .Thr4_User_Text_4v00d ,
	VA = 0x700000ad0000 ,/* 0x700000adffc0 */
	RA = 0x0190d90000 ,
	PA = 0x4d90d90000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000700000ad16f8 8000004d90d90081 */
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
	or	%g0, 0x16f, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe492743
	IDEMAP_ALL
	.word	0xfe4aad21
	.word	0xc670a0b8
	.word	0xc076ecc0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf67420f0
	.word	0xc02aaf1c
	ACCESS_ITSB_PTR
	.word	0xfe52a152
	.word	0xc0212570
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe5eee58
	.word	0xfa75a050
	.word	0xc0742130
	.word	0xca75a070
	.word	0xc030a8e4
	.word	0x1000000
	or	%g0, 0x01b, %i7
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
	.word	0xfe4ee301
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe56e542
	.word	0xe076e068
	.word	0xc02c253d
	IDEMAP_PCTX
	.word	0xfe542ad4
	DDEMAP_ALL_RPAGES
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x465, %i7
	LOAD_DDATA_ACCESS
	nop
	DDEMAP_ALL_PAGES
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4eefda
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	.word	0xfe442364
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc8712038
	.word	0xc02aab89
	.word	0x81c66000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00d_exit:
	EXIT_GOOD
Thr4_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v108 DATA_VA=0x6ff000058000
attr_data {
	Name = .Thr4_User_Data_4v108 ,
	VA = 0x6ff000058000 ,/* 0x6ff000059fc0 */
	RA = 0x0120146000 ,
	PA = 0x0120146000 ,
	TTE_Context = 0x16f8 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006ff00005971f 8000000120146040 */
	end_label   = Thr4_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v108_data_begin
Thr4_User_Data_4v108_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00e TEXT_VA=0x6ff0000d8000
attr_text {
	Name = .Thr4_User_Text_4v00e ,
	VA = 0x6ff0000d8000 ,/* 0x6ff0000d9fc0 */
	RA = 0x012000a000 ,
	PA = 0x012000a000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006ff0000d971f 800000012000a080 */
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
	.word	0xe0712120
	.word	0xc075aa60
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_PRIMARY_256:
	.word	0x87802080
	.word	0xeef6e010
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0342f92
	.word	0x1000000
	or	%g0, 0x034, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x4e8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x04b, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xfe5ee450
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v00e_exit:
	EXIT_GOOD
Thr4_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v109 DATA_VA=0x710029c00000
attr_data {
	Name = .Thr4_User_Data_4v109 ,
	VA = 0x710029c00000 ,/* 0x710029ffffc0 */
	RA = 0x0214c00000 ,
	PA = 0x4e14c00000 ,
	TTE_Context = 0x16f8 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000710029c016f8 8000004e14c00043 */
	end_label   = Thr4_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v109_data_begin
Thr4_User_Data_4v109_data_begin:
	.xword	0x6ff000094000
	.xword	0x7000006d0000
	.xword	0x6ff0000b6000
	.xword	0x71003fc00000
	.xword	0x700000590000
	.xword	0x700000810000
	.xword	0x6ff000116000
	.xword	0x700000b00000
	.xword	0x7000005b0000
	.xword	0x700000a70000
	.xword	0x710016c00000
	.xword	0x700000ec0000
	.xword	0x6ff000196000
	.xword	0x71003f400000
	.xword	0x710020400000
	.xword	0x7000002a0000
	.xword	0x6ff000018000
	.xword	0x6ff0001f0000
	.xword	0x710009c00000
	.xword	0x700000280000
	.xword	0x6ff00007e000
	.xword	0x71002e400000
	.xword	0x6ff0000b0000
	.xword	0x6ff0001c4000
	.xword	0x6ff00019c000
	.xword	0x700000300000
	.xword	0x6ff00007a000
	.xword	0x6ff0001c2000
	.xword	0x6ff0000b4000
	.xword	0x7000003c0000
	.xword	0x6ff00003e000
	.xword	0x6ff0001a4000
	.xword	0x6ff0000b2000
	.xword	0x700000ad0000
	.xword	0x6ff000058000
	.xword	0x6ff0000d8000
	.xword	0x710029c00000
	.xword	0x71003ec00000
Thr4_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00f TEXT_VA=0x71003ec00000
attr_text {
	Name = .Thr4_User_Text_4v00f ,
	VA = 0x71003ec00000 ,/* 0x71003effffc0 */
	RA = 0x0218c00000 ,
	PA = 0x4e18c00000 ,
	TTE_Context = 0x16f8 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000071003ec016f8 8000004e18c00083 */
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
	.word	0xbe13c000
	DDEMAP_PAGE
	DDEMAP_ALL_RPAGES
	.word	0xf275a090
	.word	0xc020a214
	.word	0x1000000
	or	%g0, 0x6aa, %i7
	LOAD_DDATA_ACCESS
	.word	0xec76e068
	.word	0xc036eff4
thr4_MMU_ASI_PRIMARY_257:
	.word	0x87802080
	.word	0xe6f42050
	.word	0xc022aaac
	.word	0xfcdd9000
	DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe158000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x2f8, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0xfe48a1c2
	.word	0x1000000
	or	%g0, 0x120, %i7
	DTLB_TAG_READ
	DDEMAP_NCTX
	DDEMAP_ALL_RPAGES
	.word	0xfc9edd40
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	ITLB_TAG_READ
	.word	0xfe46e28c
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
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda9000
	ACCESS_ITSB_PTR
	DDEMAP_ALL_RPAGES
	DDEMAP_SCTX
	.word	0xc036e462
	.word	0xfcd89100
	.word	0xfcdd9000
	.word	0xfe40ab54
thr4_MMU_ASI_SECONDARY_LITTLE_258:
	.word	0x87802089
	.word	0xe0b96810
	.word	0xfe56e658
	TOGGLE_LSU_DM
	.word	0xfcdc5120
	nop
	.word	0xc070a268
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
	.word	0x1000000
	or	%g0, 0xd6, %i7
	LOAD_IDATA_ACCESS
thr4_MMU_ASI_PRIMARY_LITTLE_259:
	.word	0x87802088
	.word	0xfaf6e0b0
	nop
	nop
	.word	0xd458a0e0
	.word	0xec5ee038
	.word	0xc035a8dc
	.word	0x1000000
	.word	0xbe118000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe842068
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
	DDEMAP_ALL
thr4_MMU_ASI_PRIMARY_260:
	.word	0x87802080
	.word	0xcaf12010
	.word	0xe05da110
	.word	0xc0212760
	.word	0xc030aef0
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0xd45aa038
	.word	0x1000000
	.word	0xbe114000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x02b, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe11c000
	IDEMAP_RPAGE
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc026eb94
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00f_exit:
	EXIT_GOOD
Thr4_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x731000124000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	VA = 0x731000124000 ,/* 0x731000125fc0 */
	RA = 0x013005e000 ,
	PA = 0x013005e000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000731000125f1c 800000013005e080 */
	end_label   = Thr5_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr5_user_code_entry
Thr5_user_code_entry:
	setx	0x75000b000000, %g1, %g2
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
	.word	0xcc76a018
	.word	0xc02c2a56
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x15f, %i7
	LOAD_DDATA_ACCESS
	.word	0xdc776028
	.word	0xc0776508
	.word	0xc02f62f8
	.word	0x1000000
	or	%g0, 0x05a, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc075a600
	.word	0xdc742088
	.word	0xc022a96c
	DDEMAP_PCTX
	DDEMAP_ALL
	IDEMAP_ALL
	ACCESS_DTSB_PTR
	.word	0xfe5aa590
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x168, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	.word	0xde742060
	.word	0xc035aaba
	.word	0xd45aa100
	.word	0xfe41201c
	.word	0xfc9d9c40
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc022aec8
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_BLK_P_261:
	.word	0x878020f0
	.word	0xc3bda740
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	TOGGLE_LSU_DM
	.word	0xd45aa110
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x5f8, %i7
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
	.word	0xfcd95020
	.word	0xfe45a4c0
	.word	0x1000000
	or	%g0, 0x410, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x400, %i7
	DTLB_TAG_READ
	DDEMAP_SCTX
thr5_MMU_ASI_PRIMARY_262:
	.word	0x87802080
	.word	0xdcf6a088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xcc5c2018
	DDEMAP_NCTX
	.word	0xfe52a06e
	.word	0xd675a010
	.word	0xc0376afc
	.word	0xfcdc1000
	DDEMAP_SCTX
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x022, %i7
	LOAD_IDATA_IN
	.word	0xfe5f6ef0
	.word	0xc075a378
thr5_MMU_ASI_BLK_COMMIT_P_263:
	.word	0x878020e0
	.word	0xc3baa880
	.word	0xc025af00
	.word	0xbe85a068
	.word	0xe0dfd000
	.word	0xc02425ec
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x020, %i7
	LOAD_DDATA_IN
	.word	0xfcd89000
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xf272a028
	.word	0xc072a140
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v000_exit:
	EXIT_GOOD
Thr5_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v100 DATA_VA=0x75000b000000
attr_data {
	Name = .Thr5_User_Data_4v100 ,
	VA = 0x75000b000000 ,/* 0x75000b3fffc0 */
	RA = 0x0225000000 ,
	PA = 0x0225000000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000075000b001f1c 8000000225000443 */
	end_label   = Thr5_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v100_data_begin
Thr5_User_Data_4v100_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v200 DATA_VA=0x75002d400000
attr_data {
	Name = .Thr5_User_Data_4v200 ,
	VA = 0x75002d400000 ,/* 0x75002d7fffc0 */
	RA = 0x0226000000 ,
	PA = 0x0226000000 ,
	TTE_Context = 0x0dc3 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000075002d400dc3 8000000226000043 */
	end_label   = Thr5_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v200_data_begin
Thr5_User_Data_4v200_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v300 DATA_VA=0x75000c400000
attr_data {
	Name = .Thr5_User_Data_4v300 ,
	VA = 0x75000c400000 ,/* 0x75000c7fffc0 */
	RA = 0x022f800000 ,
	PA = 0x022f800000 ,
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
	/* DTTE_TAG_DATA = 000075000c400000 800000022f800043 */
	end_label   = Thr5_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v300_data_begin
Thr5_User_Data_4v300_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v001 TEXT_VA=0x75002a000000
attr_text {
	Name = .Thr5_User_Text_4v001 ,
	VA = 0x75002a000000 ,/* 0x75002a3fffc0 */
	RA = 0x022fc00000 ,
	PA = 0x022fc00000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000075002a001f1c 800000022fc00083 */
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
	.word	0xec75a0d0
	.word	0xc0712188
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x3a4, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe46a014
	.word	0xfe4da814
	.word	0xfe52a1e2
	.word	0xc02c2ee6
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x588, %i7
	ITLB_TAG_READ
	.word	0xc875a100
	.word	0xc072ad58
	.word	0xfe55abf6
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe104000
	IDEMAP_RPAGE
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0776998
	nop
	.word	0xf45f6068
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x035, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	DTLB_TAG_READ
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x0ae, %i7
	LOAD_DDATA_IN
	.word	0xbe154000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	ACCESS_DTSB_PTR
	.word	0xe45da018
	.word	0xfe4da8ce
	TOGGLE_LSU_IM
	.word	0xc1995e20
	.word	0x1000000
	or	%g0, 0x18, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xfe442d68
	.word	0xbe82a0d0
	.word	0xe0dfd000
	nop
	nop
	nop
thr5_MMU_ASI_BLK_P_264:
	.word	0x878020f0
	.word	0xc3bc2800
	.word	0xd4776100
	.word	0xc07421f8
thr5_MMU_ASI_BLK_COMMIT_P_265:
	.word	0x878020e0
	.word	0xc3bc2e00
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4dab61
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v001_exit:
	EXIT_GOOD
Thr5_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v400 TEXT_VA=0x731000178000
attr_text {
	Name = .Thr5_User_Text_4v400 ,
	VA = 0x731000178000 ,/* 0x731000179fc0 */
	RA = 0x0130102000 ,
	PA = 0x5d30102000 ,
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
	/* ITTE_TAG_DATA = 0000731000178000 8000005d30102080 */
	end_label   = Thr5_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v400_text_begin
Thr5_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xd871a048
	.word	0xc031a1bc
	.word	0x1000000
	.word	0xbe178000
	P_DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x690, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x278, %i7
	P_READ_DDATA_ACCESS
	.word	0xd659a010
	.word	0xc031a140
	.word	0xc39d83c0
	.word	0x1000000
	or	%g0, 0x4d8, %i7
	P_ITLB_TAG_READ
	.word	0xda71a060
	.word	0xc02de37b
	.word	0xe875e028
	.word	0xc071aa30
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_266:
	.word	0x87802022
	.word	0xd8bdaf60
	.word	0x1000000
	or	%g0, 0x3b0, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x4e8, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe876068
	.word	0xecdfc200
	P_ACCESS_DTSB_PTR
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v400_exit:
	EXIT_GOOD
Thr5_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v002 TEXT_VA=0x760cc0000000
attr_text {
	Name = .Thr5_User_Text_4v002 ,
	VA = 0x760cc0000000 ,/* 0x760ccfffffc0 */
	RA = 0x03d0000000 ,
	PA = 0x03d0000000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000760cc0001f1c 80000003d0000085 */
	end_label   = Thr5_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v002_text_begin
Thr5_User_Text_4v002_text_begin:
	wrpr	0, %gl
thr5_MMU_ASI_SECONDARY_LITTLE_267:
	.word	0x87802089
	.word	0xccf46018
	.word	0xbe842110
	.word	0xecdfc200
	.word	0x1000000
	or	%g0, 0x03c, %i7
	P_LOAD_DDATA_IN
	.word	0xbe86a038
	.word	0xecdfd040
thr5_MMU_ASI_PRIMARY_268:
	.word	0x87802080
	.word	0xf8f42028
	.word	0xf45c2110
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc85aa110
	.word	0xd45ea008
	.word	0xce72a020
	.word	0xc0212180
	.word	0xfe4aa70a
	.word	0x1000000
	or	%g0, 0xe8, %i7
	P_ITLB_TAG_READ
	.word	0xbe82a098
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x076, %i7
	P_LOAD_IDATA_IN
	.word	0xc85c2038
	.word	0x1000000
	or	%g0, 0x498, %i7
	P_READ_IDATA_ACCESS
	.word	0xfcdd9000
	.word	0xbe876068
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x168, %i7
	P_DTLB_TAG_READ
	.word	0xfe5ea3e0
	.word	0x1000000
	or	%g0, 0x350, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x708, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v002_exit:
	EXIT_GOOD
Thr5_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v101 DATA_VA=0x7310001a8000
attr_data {
	Name = .Thr5_User_Data_4v101 ,
	VA = 0x7310001a8000 ,/* 0x7310001a9fc0 */
	RA = 0x0130038000 ,
	PA = 0x0130038000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007310001a9f1c 8000000130038440 */
	end_label   = Thr5_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v101_data_begin
Thr5_User_Data_4v101_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v201 DATA_VA=0x75000e000000
attr_data {
	Name = .Thr5_User_Data_4v201 ,
	VA = 0x75000e000000 ,/* 0x75000e3fffc0 */
	RA = 0x0225400000 ,
	PA = 0x0225400000 ,
	TTE_Context = 0x0dc3 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000075000e000dc3 8000000225400043 */
	end_label   = Thr5_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v201_data_begin
Thr5_User_Data_4v201_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v301 DATA_VA=0x73100004e000
attr_data {
	Name = .Thr5_User_Data_4v301 ,
	VA = 0x73100004e000 ,/* 0x73100004ffc0 */
	RA = 0x0130088000 ,
	PA = 0x5d30088000 ,
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
	/* DTTE_TAG_DATA = 000073100004e000 8000005d30088040 */
	end_label   = Thr5_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v301_data_begin
Thr5_User_Data_4v301_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v003 TEXT_VA=0x740000f20000
attr_text {
	Name = .Thr5_User_Text_4v003 ,
	VA = 0x740000f20000 ,/* 0x740000f2ffc0 */
	RA = 0x01a0d30000 ,
	PA = 0x01a0d30000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000740000f21f1c 80000001a0d30081 */
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
	.word	0xee58a078
	.word	0xc02aad1f
	.word	0x1000000
	.word	0xbe14c000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0xd2, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x178, %i7
	DTLB_TAG_READ
	DDEMAP_NCTX
thr5_MMU_ASI_PRIMARY_269:
	.word	0x87802080
	.word	0xd4f5a038
thr5_MMU_ASI_BLK_P_270:
	.word	0x878020f0
	.word	0xe1bf6c80
	nop
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
	DDEMAP_ALL_PAGES
	.word	0xfa5c2038
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_PAGES
thr5_MMU_ASI_SECONDARY_LITTLE_271:
	.word	0x87802089
	.word	0xc4b96240
	.word	0xfe42aa1c
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x673, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x1f8, %i7
	READ_DDATA_ACCESS
thr5_MMU_ASI_BLK_COMMIT_P_272:
	.word	0x878020e0
	.word	0xe1bc2880
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x70f, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xa0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x7b6, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc070a9d0
	.word	0x1000000
	or	%g0, 0x7d8, %i7
	READ_DDATA_ACCESS
	DDEMAP_ALL_PAGES
	.word	0xee742018
	.word	0xc02aa5a4
	.word	0x1000000
	or	%g0, 0x9f, %i7
	LOAD_IDATA_ACCESS
	.word	0xc0242ddc
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02dade4
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v003_exit:
	EXIT_GOOD
Thr5_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v401 TEXT_VA=0x750031000000
attr_text {
	Name = .Thr5_User_Text_4v401 ,
	VA = 0x750031000000 ,/* 0x7500313fffc0 */
	RA = 0x0226c00000 ,
	PA = 0x0226c00000 ,
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
	/* ITTE_TAG_DATA = 0000750031000000 8000000226c00083 */
	end_label   = Thr5_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v401_text_begin
Thr5_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe170000
	P_IDEMAP_RPAGE
	P_ACCESS_DTSB_PTR
	.word	0xfcda9000
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x59e, %i7
	P_LOAD_DDATA_ACCESS
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x02d, %i7
	P_LOAD_DDATA_IN
	.word	0xbe842098
	.word	0xe0dfd000
	nop
	P_IDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe170000
	P_DDEMAP_PAGE
	.word	0xfcde9000
	.word	0xc02de827
	.word	0x1000000
	or	%g0, 0x7be, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x6e4, %i7
	P_LOAD_DDATA_ACCESS
	P_DDEMAP_NCTX
thr5_MMU_ASI_PRIMARY_273:
	.word	0x87802080
	.word	0xcef2a0d8
	.word	0x1000000
	or	%g0, 0x028, %i7
	P_LOAD_IDATA_IN
	.word	0xc029a7e4
	.word	0xfcda9140
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_274:
	.word	0x8780202a
	.word	0xf8bf6d20
	.word	0xd0732028
	.word	0xc031a280
	nop
	.word	0xbe8420d0
	.word	0xe19fc2c0
	.word	0x1000000
	or	%g0, 0x5a9, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfe45e600
	P_TOGGLE_LSU_DM
	P_DDEMAP_ALL
	.word	0x1000000
	.word	0xbe174000
	P_DDEMAP_PAGE
	P_IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x002, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x46d, %i7
	P_LOAD_DDATA_ACCESS
	P_IDEMAP_PCTX
thr5_MMU_ASI_AS_IF_USER_PRIMARY_275:
	.word	0x87802010
	.word	0xe6f42080
	.word	0xfc998480
	.word	0x1000000
	.word	0xbe174000
	P_IDEMAP_RPAGE
	P_IDEMAP_NCTX
	.word	0x1000000
	.word	0xbe118000
	P_DDEMAP_PAGE
thr5_MMU_ASI_PRIMARY_276:
	.word	0x87802080
	.word	0xd8f6a0a0
	.word	0xfcdad060
	.word	0xbe812098
	.word	0xc4dfc200
	.word	0xbe876038
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
	.word	0x1000000
	or	%g0, 0x400, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x678, %i7
	P_READ_DDATA_ACCESS
	.word	0xe875e028
	.word	0xc021a2f0
	.word	0xbe8120d0
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
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v401_exit:
	EXIT_GOOD
Thr5_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v004 TEXT_VA=0x740000110000
attr_text {
	Name = .Thr5_User_Text_4v004 ,
	VA = 0x740000110000 ,/* 0x74000011ffc0 */
	RA = 0x01a0a50000 ,
	PA = 0x01a0a50000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000740000111f1c 80000001a0a50081 */
	end_label   = Thr5_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v004_text_begin
Thr5_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xfcdf4200
	.word	0xe472a048
	.word	0xc034292e
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_NCTX
	.word	0xbe812130
	.word	0xe0dfd000
	P_TOGGLE_LSU_IM
	.word	0xfe5c2290
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_277:
	.word	0x8780202a
	.word	0xe4baa410
	.word	0x1000000
	or	%g0, 0x50f, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x138, %i7
	P_READ_IDATA_ACCESS
	P_DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x204, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x50, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x388, %i7
	P_READ_DDATA_ACCESS
	.word	0xde7420e8
	.word	0xc072a178
	.word	0x1000000
	or	%g0, 0x5d0, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v004_exit:
	EXIT_GOOD
Thr5_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v102 DATA_VA=0x75001f800000
attr_data {
	Name = .Thr5_User_Data_4v102 ,
	VA = 0x75001f800000 ,/* 0x75001fbfffc0 */
	RA = 0x0227400000 ,
	PA = 0x0227400000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000075001f801f1c 8000000227400443 */
	end_label   = Thr5_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v102_data_begin
Thr5_User_Data_4v102_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v202 DATA_VA=0x7400005a0000
attr_data {
	Name = .Thr5_User_Data_4v202 ,
	VA = 0x7400005a0000 ,/* 0x7400005affc0 */
	RA = 0x01a0f00000 ,
	PA = 0x01a0f00000 ,
	TTE_Context = 0x0dc3 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007400005a0dc3 80000001a0f00041 */
	end_label   = Thr5_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v202_data_begin
Thr5_User_Data_4v202_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v302 DATA_VA=0x750023000000
attr_data {
	Name = .Thr5_User_Data_4v302 ,
	VA = 0x750023000000 ,/* 0x7500233fffc0 */
	RA = 0x0220c00000 ,
	PA = 0x0220c00000 ,
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
	/* DTTE_TAG_DATA = 0000750023000000 8000000220c00043 */
	end_label   = Thr5_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v302_data_begin
Thr5_User_Data_4v302_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v005 TEXT_VA=0x740000910000
attr_text {
	Name = .Thr5_User_Text_4v005 ,
	VA = 0x740000910000 ,/* 0x74000091ffc0 */
	RA = 0x01a07a0000 ,
	PA = 0x01a07a0000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000740000911f1c 80000001a07a0081 */
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
thr5_MMU_ASI_BLK_SL_278:
	.word	0x878020f9
	.word	0xc3bc6f00
	.word	0xc02daa50
	nop
	nop
	nop
	nop
	.word	0xca5c2010
	nop
	.word	0xc075aad0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x2b1, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe82a098
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x08b, %i7
	LOAD_IDATA_IN
	IDEMAP_ALL
	.word	0xfcdd9000
thr5_MMU_ASI_PRIMARY_279:
	.word	0x87802080
	.word	0xe0b92e20
	.word	0xbe86a038
	.word	0xc8dfd000
	.word	0x1000000
	.word	0xbe100000
	DDEMAP_PAGE
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xfe45a3c4
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v005_exit:
	EXIT_GOOD
Thr5_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v402 TEXT_VA=0x760990000000
attr_text {
	Name = .Thr5_User_Text_4v402 ,
	VA = 0x760990000000 ,/* 0x76099fffffc0 */
	RA = 0x0090000000 ,
	PA = 0x5c90000000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr5_z_ctx_tsb_3 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 0000760990000000 8000005c90000085 */
	end_label   = Thr5_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v402_text_begin
Thr5_User_Text_4v402_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x005, %i7
	P_LOAD_IDATA_IN
	P_TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe11c000
	P_DDEMAP_PAGE
	.word	0xfe4def09
	.word	0xbe82a098
	.word	0xecdfd040
	P_TOGGLE_LSU_DM
	.word	0xfcdd8200
thr5_MMU_ASI_BLK_SL_280:
	.word	0x878020f9
	.word	0xc1b96700
	P_TOGGLE_LSU_IM
	P_ACCESS_DTSB_PTR
thr5_MMU_ASI_PRIMARY_281:
	.word	0x87802080
	.word	0xf6f2a080
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x064, %i7
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
thr5_MMU_ASI_AS_IF_USER_PRIMARY_282:
	.word	0x87802010
	.word	0xe0f12008
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0xc8, %i7
	P_READ_IDATA_ACCESS
	.word	0xd459a008
thr5_MMU_ASI_PRIMARY_283:
	.word	0x87802080
	.word	0xd6f42040
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v402_exit:
	EXIT_GOOD
Thr5_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v006 TEXT_VA=0x740000b10000
attr_text {
	Name = .Thr5_User_Text_4v006 ,
	VA = 0x740000b10000 ,/* 0x740000b1ffc0 */
	RA = 0x01a0f60000 ,
	PA = 0x01a0f60000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000740000b11f1c 80000001a0f60081 */
	end_label   = Thr5_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v006_text_begin
Thr5_User_Text_4v006_text_begin:
	wrpr	0, %gl
	P_ACCESS_ITSB_PTR
	.word	0xfc991d40
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x390, %i7
	P_READ_DDATA_ACCESS
	P_DDEMAP_SCTX
	.word	0xfcd89000
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	P_DDEMAP_NCTX
thr5_MMU_ASI_PRIMARY_LITTLE_284:
	.word	0x87802088
	.word	0xd0f76028
	P_DDEMAP_ALL
	.word	0xfc9e9c40
	.word	0xfcdd8200
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda8200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45ea0e0
	.word	0xfc998580
	.word	0x1000000
	.word	0xbe104000
	P_IDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x78, %i7
	P_READ_IDATA_ACCESS
	.word	0xc036a3a2
	.word	0x1000000
	or	%g0, 0x09c, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x00e, %i7
	P_LOAD_IDATA_IN
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x039, %i7
	P_LOAD_DDATA_IN
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v006_exit:
	EXIT_GOOD
Thr5_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v103 DATA_VA=0x740000030000
attr_data {
	Name = .Thr5_User_Data_4v103 ,
	VA = 0x740000030000 ,/* 0x74000003ffc0 */
	RA = 0x01a0a10000 ,
	PA = 0x01a0a10000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000031f1c 80000001a0a10441 */
	end_label   = Thr5_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v103_data_begin
Thr5_User_Data_4v103_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v303 DATA_VA=0x740000650000
attr_data {
	Name = .Thr5_User_Data_4v303 ,
	VA = 0x740000650000 ,/* 0x74000065ffc0 */
	RA = 0x01a0370000 ,
	PA = 0x5da0370000 ,
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
	/* DTTE_TAG_DATA = 0000740000650000 8000005da0370041 */
	end_label   = Thr5_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v303_data_begin
Thr5_User_Data_4v303_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v007 TEXT_VA=0x7400007a0000
attr_text {
	Name = .Thr5_User_Text_4v007 ,
	VA = 0x7400007a0000 ,/* 0x7400007affc0 */
	RA = 0x01a0350000 ,
	PA = 0x01a0350000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007400007a1f1c 80000001a0350081 */
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
	.word	0x1000000
	or	%g0, 0x418, %i7
	READ_IDATA_ACCESS
	DDEMAP_ALL
	.word	0xc072a568
	.word	0x1000000
	or	%g0, 0x528, %i7
	LOAD_IDATA_ACCESS
	.word	0xdc72a088
	.word	0xc072abe0
	DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	nop
	nop
	.word	0xc0342d5c
	.word	0xfcda9000
	.word	0xbe85a130
	.word	0xecdfd000
	.word	0xfe5aac48
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x208, %i7
	DTLB_TAG_READ
	.word	0xe05c2038
thr5_MMU_ASI_PRIMARY_LITTLE_285:
	.word	0x87802088
	.word	0xe4f6a0a0
	.word	0xfcdc1000
	.word	0xfa75a100
	.word	0xc025aec8
	.word	0x1000000
	or	%g0, 0x021, %i7
	LOAD_IDATA_IN
	DDEMAP_ALL_RPAGES
	.word	0xc022af60
	.word	0xfcdd9000
	.word	0xfcdc5060
	.word	0xf2712028
	.word	0xc03421c2
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc02da4e3
	.word	0x1000000
	or	%g0, 0x40, %i7
	READ_DDATA_ACCESS
	.word	0xc02dadf8
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr5_MMU_ASI_PRIMARY_286:
	.word	0x87802080
	.word	0xeef0a078
	.word	0xfa75a038
	.word	0xc072a910
	DDEMAP_ALL_PAGES
	.word	0xfa742100
	.word	0xc072a2d0
	nop
	nop
	nop
	.word	0xf45f60b8
	.word	0x1000000
	or	%g0, 0x07c, %i7
	LOAD_DDATA_IN
	.word	0xfcde9000
	nop
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4f6f66
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v007_exit:
	EXIT_GOOD
Thr5_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v403 TEXT_VA=0x7400001f0000
attr_text {
	Name = .Thr5_User_Text_4v403 ,
	VA = 0x7400001f0000 ,/* 0x7400001fffc0 */
	RA = 0x01a0ca0000 ,
	PA = 0x5da0ca0000 ,
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
	/* ITTE_TAG_DATA = 00007400001f0000 8000005da0ca0081 */
	end_label   = Thr5_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v403_text_begin
Thr5_User_Text_4v403_text_begin:
	wrpr	0, %gl
	.word	0xec5ca068
	.word	0x1000000
	.word	0xbe108000
	P_DDEMAP_PAGE
	nop
thr5_MMU_ASI_PRIMARY_287:
	.word	0x87802080
	.word	0xf8f2a028
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x490, %i7
	P_READ_IDATA_ACCESS
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a030
	.word	0xc39fde00
	.word	0xf471a038
	.word	0xc031a98a
	.word	0x1000000
	or	%g0, 0x198, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v403_exit:
	EXIT_GOOD
Thr5_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v104 DATA_VA=0x7310000b8000
attr_data {
	Name = .Thr5_User_Data_4v104 ,
	VA = 0x7310000b8000 ,/* 0x7310000b9fc0 */
	RA = 0x01300d2000 ,
	PA = 0x01300d2000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007310000b9f1c 80000001300d2440 */
	end_label   = Thr5_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v104_data_begin
Thr5_User_Data_4v104_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v008 TEXT_VA=0x750019400000
attr_text {
	Name = .Thr5_User_Text_4v008 ,
	VA = 0x750019400000 ,/* 0x7500197fffc0 */
	RA = 0x0220000000 ,
	PA = 0x0220000000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000750019401f1c 8000000220000083 */
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
	IDEMAP_ALL
	.word	0xbe86a098
	.word	0xe0dfd000
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
thr5_MMU_ASI_SECONDARY_LITTLE_288:
	.word	0x87802089
	.word	0xe4bc6660
thr5_MMU_ASI_PRIMARY_289:
	.word	0x87802080
	.word	0xccf76018
	.word	0xc85da098
	.word	0x1000000
	or	%g0, 0x6be, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe170000
	DDEMAP_RPAGE
	DDEMAP_ALL_PAGES
	.word	0xbe170000
	GOTO_SUPERVISOR1
	ACCESS_DTSB_PTR
	.word	0xe19c5f20
	.word	0xbe82a0b8
	.word	0xd4dfd000
	IDEMAP_PCTX
	DDEMAP_ALL
	.word	0xc032ad14
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf2776058
	.word	0xc02eadb3
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v008_exit:
	EXIT_GOOD
Thr5_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v404 TEXT_VA=0x7609f0000000
attr_text {
	Name = .Thr5_User_Text_4v404 ,
	VA = 0x7609f0000000 ,/* 0x7609ffffffc0 */
	RA = 0x02d0000000 ,
	PA = 0x5ed0000000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr5_z_ctx_tsb_3 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 00007609f0000000 8000005ed0000085 */
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
thr5_MMU_ASI_AS_IF_USER_PRIMARY_290:
	.word	0x87802010
	.word	0xc6f2a108
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x5b8, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe170000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_291:
	.word	0x8780202b
	.word	0xfcbc6690
	P_IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_PRIMARY_292:
	.word	0x87802080
	.word	0xd6f12010
	.word	0xe05de110
thr5_MMU_ASI_AS_IF_USER_PRIMARY_293:
	.word	0x87802010
	.word	0xf0f5a050
	P_IDEMAP_PCTX
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x279, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcde9000
	P_DDEMAP_NCTX
	.word	0xc075e2c0
thr5_MMU_ASI_PRIMARY_294:
	.word	0x87802080
	.word	0xfcbead70
	.word	0xfcdc1000
	nop
	nop
	nop
	.word	0xbe842068
	.word	0xf4dfd000
thr5_MMU_ASI_AS_IF_USER_PRIMARY_295:
	.word	0x87802010
	.word	0xdaf6a118
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x00b, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe144000
	P_IDEMAP_PAGE
	.word	0xe05de098
	.word	0x1000000
	or	%g0, 0x060, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x058, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe128000
	P_IDEMAP_RPAGE
	.word	0xbe82a0b8
	.word	0xd4dfc200
thr5_MMU_ASI_PRIMARY_296:
	.word	0x87802080
	.word	0xe2f42010
	P_IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_REAL_MEM_LITTLE_297:
	.word	0x8780201c
	.word	0xe0f1a110
	.word	0xfcdd9000
	P_DDEMAP_PCTX
thr5_MMU_ASI_PRIMARY_298:
	.word	0x87802080
	.word	0xc8f6a0d0
	.word	0xca732010
	.word	0xc021ac90
thr5_MMU_ASI_PRIMARY_299:
	.word	0x87802080
	.word	0xf8f6a0b0
	.word	0x1000000
	or	%g0, 0x1f9, %i7
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
	.word	0xfcda8200
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
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xfe49a43f
	.word	0xfcdd9000
	.word	0xfcdc1000
	.word	0xc074a9a8
	.word	0x1000000
	or	%g0, 0x4e, %i7
	P_LOAD_IDATA_ACCESS
	P_TOGGLE_LSU_IM
	P_DDEMAP_NCTX
	P_ACCESS_ITSB_PTR
	.word	0xbe816010
	.word	0xc39fc2e0
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v404_exit:
	EXIT_GOOD
Thr5_User_Text_4v404_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v105 DATA_VA=0x740000470000
attr_data {
	Name = .Thr5_User_Data_4v105 ,
	VA = 0x740000470000 ,/* 0x74000047ffc0 */
	RA = 0x01a02b0000 ,
	PA = 0x01a02b0000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000471f1c 80000001a02b0441 */
	end_label   = Thr5_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v105_data_begin
Thr5_User_Data_4v105_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v009 TEXT_VA=0x731000016000
attr_text {
	Name = .Thr5_User_Text_4v009 ,
	VA = 0x731000016000 ,/* 0x731000017fc0 */
	RA = 0x0130136000 ,
	PA = 0x0130136000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000731000017f1c 8000000130136080 */
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
	or	%g0, 0x183, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfcd89000
	.word	0xc0242200
	DDEMAP_PCTX
	.word	0xc02f6a81
	.word	0xc075a298
	.word	0xc02ea552
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	IDEMAP_NCTX
	.word	0xe25da010
	.word	0xbe8420d0
	.word	0xecdfd000
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x320, %i7
	DTLB_TAG_READ
	.word	0xc075a900
	.word	0xbe85a120
	.word	0xecdfd000
	.word	0xec5da0d0
	.word	0xc035a140
thr5_MMU_ASI_PRIMARY_300:
	.word	0x87802080
	.word	0xc4f420f0
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0xfa5da068
	.word	0xc035a2a2
	.word	0xfe592240
	nop
	nop
	.word	0xce742020
	.word	0xc032ae8e
	.word	0xdc72a028
	.word	0xc02765a0
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4daa8c
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0xc022a1e4
	.word	0x1000000
	or	%g0, 0x589, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe876038
	.word	0xe0dfd000
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd45f6120
	.word	0xc076a188
	nop
	nop
	nop
	nop
	DDEMAP_ALL_PAGES
	.word	0xc02dad5e
	ACCESS_ITSB_PTR
	.word	0xbe85a120
	.word	0xe0dfd000
	DDEMAP_PCTX
	.word	0xca5aa010
	.word	0xd675a070
	.word	0xc0712f20
	.word	0x1000000
	or	%g0, 0x2e8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0xa8, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x7b2, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x500, %i7
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
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe55ab80
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v009_exit:
	EXIT_GOOD
Thr5_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v106 DATA_VA=0x760cd0000000
attr_data {
	Name = .Thr5_User_Data_4v106 ,
	VA = 0x760cd0000000 ,/* 0x760cdfffffc0 */
	RA = 0x02a0000000 ,
	PA = 0x02a0000000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000760cd0001f1c 80000002a0000445 */
	end_label   = Thr5_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v106_data_begin
Thr5_User_Data_4v106_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00a TEXT_VA=0x75002bc00000
attr_text {
	Name = .Thr5_User_Text_4v00a ,
	VA = 0x75002bc00000 ,/* 0x75002bffffc0 */
	RA = 0x0220400000 ,
	PA = 0x0220400000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000075002bc01f1c 8000000220400083 */
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
	.word	0xc0742d40
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	.word	0xc032a502
thr5_MMU_ASI_BLK_COMMIT_P_301:
	.word	0x878020e0
	.word	0xe1bc29c0
	DDEMAP_SCTX
	.word	0xe05ea038
thr5_MMU_ASI_PRIMARY_302:
	.word	0x87802080
	.word	0xecf5a0d0
	.word	0xd45ea0e0
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	.word	0xbe8420f0
	.word	0xe0dfd000
	.word	0xc3995e20
	nop
	nop
	nop
	nop
	.word	0xfcdd9000
	.word	0xcc5aa018
	.word	0xc0342350
	DDEMAP_SCTX
	IDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa5aa068
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe442034
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00a_exit:
	EXIT_GOOD
Thr5_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v107 DATA_VA=0x73100012a000
attr_data {
	Name = .Thr5_User_Data_4v107 ,
	VA = 0x73100012a000 ,/* 0x73100012bfc0 */
	RA = 0x01301e2000 ,
	PA = 0x01301e2000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073100012bf1c 80000001301e2440 */
	end_label   = Thr5_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v107_data_begin
Thr5_User_Data_4v107_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00b TEXT_VA=0x740000200000
attr_text {
	Name = .Thr5_User_Text_4v00b ,
	VA = 0x740000200000 ,/* 0x74000020ffc0 */
	RA = 0x01a0890000 ,
	PA = 0x01a0890000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000740000201f1c 80000001a0890081 */
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
thr5_MMU_ASI_PRIMARY_303:
	.word	0x87802080
	.word	0xdaf420a8
	.word	0xfcdc1000
	.word	0xc0342464
	.word	0x1000000
	or	%g0, 0x04c, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x051, %i7
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
	.word	0xc02f6140
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe82a098
	.word	0xecdfd000
	.word	0xee712018
	.word	0xc02dacfd
	.word	0xbe86a008
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
	DDEMAP_ALL
	.word	0xe2776010
	.word	0xc02c2140
	.word	0xd675a010
	.word	0xc0776b80
	.word	0x1000000
	or	%g0, 0x05f, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x285, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0xd85f6018
	.word	0xc025a5b8
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe42a8b4
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00b_exit:
	EXIT_GOOD
Thr5_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v108 DATA_VA=0x7310000c2000
attr_data {
	Name = .Thr5_User_Data_4v108 ,
	VA = 0x7310000c2000 ,/* 0x7310000c3fc0 */
	RA = 0x013016e000 ,
	PA = 0x013016e000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007310000c3f1c 800000013016e440 */
	end_label   = Thr5_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v108_data_begin
Thr5_User_Data_4v108_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00c TEXT_VA=0x7310000bc000
attr_text {
	Name = .Thr5_User_Text_4v00c ,
	VA = 0x7310000bc000 ,/* 0x7310000bdfc0 */
	RA = 0x01300ae000 ,
	PA = 0x01300ae000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007310000bdf1c 80000001300ae080 */
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
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x07e, %i7
	LOAD_DDATA_IN
	.word	0xbe164000
	GOTO_SUPERVISOR1
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x06d, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe120000
	DDEMAP_PAGE
	.word	0xc475a0f0
	.word	0xc075a9a8
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc872a0e0
	.word	0xc0742140
	.word	0x1000000
	or	%g0, 0x0ad, %i7
	LOAD_DDATA_IN
	.word	0xbe842038
	.word	0xd4dfd000
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x748, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x004, %i7
	LOAD_DDATA_IN
	.word	0xe45aa048
	.word	0xec5c2130
	.word	0x1000000
	or	%g0, 0x490, %i7
	READ_DDATA_ACCESS
	.word	0xfe52a53a
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xec776100
	.word	0xc0242d2c
	TOGGLE_LSU_DM
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xfe5aad90
	.word	0xc02aa140
	.word	0xee5f60a0
	.word	0x1000000
	.word	0xbe110000
	IDEMAP_PAGE
thr5_MMU_ASI_PRIMARY_304:
	.word	0x87802080
	.word	0xc6f6a050
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x497, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x01b, %i7
	LOAD_DDATA_IN
	.word	0xe05c2068
	.word	0xe476a018
	.word	0xc0312cb6
	nop
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc027642c
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00c_exit:
	EXIT_GOOD
Thr5_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v109 DATA_VA=0x760910000000
attr_data {
	Name = .Thr5_User_Data_4v109 ,
	VA = 0x760910000000 ,/* 0x76091fffffc0 */
	RA = 0x0060000000 ,
	PA = 0x0060000000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000760910001f1c 8000000060000445 */
	end_label   = Thr5_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v109_data_begin
Thr5_User_Data_4v109_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00d TEXT_VA=0x740000180000
attr_text {
	Name = .Thr5_User_Text_4v00d ,
	VA = 0x740000180000 ,/* 0x74000018ffc0 */
	RA = 0x01a0a30000 ,
	PA = 0x01a0a30000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000740000181f1c 80000001a0a30081 */
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
	.word	0xbe876100
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfa5ea008
	.word	0xfcde9100
	.word	0xe05c2130
	.word	0xd45da0b8
	TOGGLE_LSU_DM
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x520, %i7
	ITLB_TAG_READ
	DDEMAP_ALL
	.word	0xfa7420f0
	.word	0xc02c27f7
thr5_MMU_ASI_PRIMARY_305:
	.word	0x87802080
	.word	0xd2f42020
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5d9, %i7
	LOAD_IDATA_ACCESS
	.word	0xc45c20b8
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xc02aacdd
	.word	0xfe5da438
	TOGGLE_LSU_DM
	.word	0xbe86a008
	.word	0xe0dfd000
thr5_MMU_ASI_PRIMARY_306:
	.word	0x87802080
	.word	0xf2f5a028
	.word	0xe25f6040
	.word	0xbe154000
	GOTO_SUPERVISOR0
thr5_MMU_ASI_BLK_SL_307:
	.word	0x878020f9
	.word	0xc3b96780
	nop
	nop
	nop
	nop
	nop
	.word	0xfe46a818
	.word	0x1000000
	.word	0xbe104000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x067, %i7
	LOAD_DDATA_IN
	.word	0xc0276bc4
	.word	0xc45c2008
	.word	0xc032a6e6
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc8592008
	.word	0xe05aa068
	ACCESS_ITSB_PTR
	.word	0xfe5aadb0
	.word	0x1000000
	.word	0xbe11c000
	IDEMAP_RPAGE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0312538
	.word	0xc025a404
	.word	0x1000000
	or	%g0, 0x108, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xec5920e0
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00d_exit:
	EXIT_GOOD
Thr5_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10a DATA_VA=0x740000840000
attr_data {
	Name = .Thr5_User_Data_4v10a ,
	VA = 0x740000840000 ,/* 0x74000084ffc0 */
	RA = 0x01a0a40000 ,
	PA = 0x01a0a40000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000841f1c 80000001a0a40441 */
	end_label   = Thr5_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10a_data_begin
Thr5_User_Data_4v10a_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00e TEXT_VA=0x740000db0000
attr_text {
	Name = .Thr5_User_Text_4v00e ,
	VA = 0x740000db0000 ,/* 0x740000dbffc0 */
	RA = 0x01a0180000 ,
	PA = 0x01a0180000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000740000db1f1c 80000001a0180081 */
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
	.word	0xdc72a058
	.word	0xc026aa8c
	.word	0xd45ea038
	.word	0xc0242fe0
	TOGGLE_LSU_DM
	.word	0xe0742110
	.word	0xc020aeb4
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x02c, %i7
	LOAD_DDATA_IN
	.word	0xfcd89000
	IDEMAP_NCTX
	.word	0xfe46a9cc
	.word	0xda712050
	.word	0xc035a40c
	.word	0xf45aa008
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x10e, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_PCTX
thr5_MMU_ASI_PRIMARY_308:
	.word	0x87802080
	.word	0xe4f760a0
	.word	0x1000000
	or	%g0, 0x3f0, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_IM
thr5_MMU_ASI_BLK_COMMIT_P_309:
	.word	0x878020e0
	.word	0xc1bc2540
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x5f8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x320, %i7
	LOAD_DDATA_ACCESS
	.word	0xc45da098
	.word	0x1000000
	.word	0xbe13c000
	IDEMAP_PAGE
	nop
	nop
	nop
	.word	0xfc9f5c40
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x158, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x066, %i7
	LOAD_DDATA_IN
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xde776030
	.word	0xc076af08
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00e_exit:
	EXIT_GOOD
Thr5_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10b DATA_VA=0x731000154000
attr_data {
	Name = .Thr5_User_Data_4v10b ,
	VA = 0x731000154000 ,/* 0x731000155fc0 */
	RA = 0x013005a000 ,
	PA = 0x013005a000 ,
	TTE_Context = 0x1f1c ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000731000155f1c 800000013005a440 */
	end_label   = Thr5_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10b_data_begin
Thr5_User_Data_4v10b_data_begin:
	.xword	0x731000124000
	.xword	0x75000b000000
	.xword	0x75002d400000
	.xword	0x75000c400000
	.xword	0x75002a000000
	.xword	0x731000178000
	.xword	0x760cc0000000
	.xword	0x7310001a8000
	.xword	0x75000e000000
	.xword	0x73100004e000
	.xword	0x740000f20000
	.xword	0x750031000000
	.xword	0x740000110000
	.xword	0x75001f800000
	.xword	0x7400005a0000
	.xword	0x750023000000
	.xword	0x740000910000
	.xword	0x760990000000
	.xword	0x740000b10000
	.xword	0x740000030000
	.xword	0x740000650000
	.xword	0x7400007a0000
	.xword	0x7400001f0000
	.xword	0x7310000b8000
	.xword	0x750019400000
	.xword	0x7609f0000000
	.xword	0x740000470000
	.xword	0x731000016000
	.xword	0x760cd0000000
	.xword	0x75002bc00000
	.xword	0x73100012a000
	.xword	0x740000200000
	.xword	0x7310000c2000
	.xword	0x7310000bc000
	.xword	0x760910000000
	.xword	0x740000180000
	.xword	0x740000840000
	.xword	0x740000db0000
	.xword	0x731000154000
	.xword	0x75002c000000
Thr5_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00f TEXT_VA=0x75002c000000
attr_text {
	Name = .Thr5_User_Text_4v00f ,
	VA = 0x75002c000000 ,/* 0x75002c3fffc0 */
	RA = 0x0221000000 ,
	PA = 0x0221000000 ,
	TTE_Context = 0x1f1c ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000075002c001f1c 8000000221000083 */
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
	.word	0xbe816010
	.word	0xcadfd020
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x550, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe124000
	DDEMAP_PAGE
	DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4e8, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	.word	0xec5aa068
	.word	0xc02928f7
	.word	0xcc5c2018
	.word	0xc02f618a
	.word	0x1000000
	or	%g0, 0x053, %i7
	LOAD_DDATA_IN
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd45aa120
thr5_MMU_ASI_PRIMARY_310:
	.word	0x87802080
	.word	0xdaf42128
thr5_MMU_ASI_PRIMARY_311:
	.word	0x87802080
	.word	0xeef2a018
	.word	0xfcdc1040
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x132, %i7
	LOAD_IDATA_ACCESS
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
thr5_MMU_ASI_BLK_P_312:
	.word	0x878020f0
	.word	0xe3bea140
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
	.word	0xfc9d9c40
	.word	0xfcdc1000
	.word	0xfe4c2b88
	.word	0x1000000
	.word	0xbe120000
	IDEMAP_RPAGE
	.word	0xfcd95120
	TOGGLE_LSU_IM
	DDEMAP_ALL
	DDEMAP_SCTX
thr5_MMU_ASI_PRIMARY_313:
	.word	0x87802080
	.word	0xd2f42030
	.word	0xc072aec8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe45ea018
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00f_exit:
	EXIT_GOOD
Thr5_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v000 TEXT_VA=0x780000040000
attr_text {
	Name = .Thr6_User_Text_4v000 ,
	VA = 0x780000040000 ,/* 0x78000004ffc0 */
	RA = 0x01b0e90000 ,
	PA = 0x6db0e90000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000780000041fbb 8000006db0e90481 */
	end_label   = Thr6_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr6_user_code_entry
Thr6_user_code_entry:
	setx	0x780000770000, %g1, %g2
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
	.word	0xfcda9000
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe542a5a
	.word	0xbe816010
	.word	0xe2dfd020
thr6_MMU_ASI_PRIMARY_314:
	.word	0x87802080
	.word	0xd8f560c0
	ACCESS_DTSB_PTR
thr6_MMU_ASI_PRIMARY_315:
	.word	0x87802080
	.word	0xeef56048
	ACCESS_DTSB_PTR
	DDEMAP_ALL_PAGES
	.word	0xbe842038
	.word	0xf4dfd000
	.word	0xc072a158
	ACCESS_ITSB_PTR
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x03e, %i7
	LOAD_DDATA_IN
	.word	0xbe812120
	.word	0xfadfd000
	.word	0xcc776018
	.word	0xc02ea691
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xea5f6090
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xce742108
	.word	0xc032adf4
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v000_exit:
	EXIT_GOOD
Thr6_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v100 DATA_VA=0x780000770000
attr_data {
	Name = .Thr6_User_Data_4v100 ,
	VA = 0x780000770000 ,/* 0x78000077ffc0 */
	RA = 0x01b0850000 ,
	PA = 0x6db0850000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000771fbb 8000006db0850041 */
	end_label   = Thr6_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v100_data_begin
Thr6_User_Data_4v100_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v200 DATA_VA=0x7720001aa000
attr_data {
	Name = .Thr6_User_Data_4v200 ,
	VA = 0x7720001aa000 ,/* 0x7720001abfc0 */
	RA = 0x0140046000 ,
	PA = 0x6d40046000 ,
	TTE_Context = 0x1685 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007720001ab598 8000006d40046040 */
	end_label   = Thr6_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v200_data_begin
Thr6_User_Data_4v200_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v300 DATA_VA=0x780000ba0000
attr_data {
	Name = .Thr6_User_Data_4v300 ,
	VA = 0x780000ba0000 ,/* 0x780000baffc0 */
	RA = 0x01b02a0000 ,
	PA = 0x01b02a0000 ,
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
	/* DTTE_TAG_DATA = 0000780000ba0000 80000001b02a0041 */
	end_label   = Thr6_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v300_data_begin
Thr6_User_Data_4v300_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v001 TEXT_VA=0x7720001d2000
attr_text {
	Name = .Thr6_User_Text_4v001 ,
	VA = 0x7720001d2000 ,/* 0x7720001d3fc0 */
	RA = 0x014001e000 ,
	PA = 0x6d4001e000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007720001d28ec 8000006d4001e480 */
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
	or	%g0, 0x50, %i7
	READ_IDATA_ACCESS
	.word	0xfcdc1000
	.word	0xcc776078
	.word	0xc0312f14
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0xe05d6008
	.word	0xc0292158
	.word	0xc02c2390
	.word	0x1000000
	or	%g0, 0x478, %i7
	ITLB_TAG_READ
	ACCESS_ITSB_PTR
	.word	0xfcd89040
	TOGGLE_LSU_IM
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc872a110
	.word	0xc026adb8
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v001_exit:
	EXIT_GOOD
Thr6_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v400 TEXT_VA=0x780000bb0000
attr_text {
	Name = .Thr6_User_Text_4v400 ,
	VA = 0x780000bb0000 ,/* 0x780000bbffc0 */
	RA = 0x01b0ed0000 ,
	PA = 0x01b0ed0000 ,
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
	/* ITTE_TAG_DATA = 0000780000bb0000 80000001b0ed0081 */
	end_label   = Thr6_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v400_text_begin
Thr6_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xfcd95060
	.word	0xfe59add0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_316:
	.word	0x87802080
	.word	0xe4f2a048
	.word	0x1000000
	or	%g0, 0x488, %i7
	P_READ_DDATA_ACCESS
	.word	0xfe59ae68
	.word	0xfcda4280
	.word	0xbe86a150
	.word	0xfadfc200
	.word	0x1000000
	or	%g0, 0x3c0, %i7
	P_DTLB_TAG_READ
	P_IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x006, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_NCTX
	.word	0xbe82a0e0
	.word	0xfadfc200
	.word	0xea75e0b8
	.word	0xc029ab50
	P_IDEMAP_ALL_PAGES
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v400_exit:
	EXIT_GOOD
Thr6_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v002 TEXT_VA=0x790039c00000
attr_text {
	Name = .Thr6_User_Text_4v002 ,
	VA = 0x790039c00000 ,/* 0x790039ffffc0 */
	RA = 0x0231800000 ,
	PA = 0x0231800000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000790039c01fbb 8000000231800483 */
	end_label   = Thr6_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v002_text_begin
Thr6_User_Text_4v002_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_PCTX
	.word	0xc02ea1dc
	.word	0x1000000
	or	%g0, 0x058, %i7
	P_LOAD_DDATA_IN
	P_ACCESS_DTSB_PTR
	nop
	nop
	.word	0x1000000
	or	%g0, 0x6b0, %i7
	P_READ_DDATA_ACCESS
	P_DDEMAP_ALL
	.word	0xc476a0b8
	.word	0xc02c21f7
	.word	0x1000000
	.word	0xbe16c000
	P_IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x05a, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x558, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0xf0, %i7
	P_READ_DDATA_ACCESS
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	.word	0xbe856118
	.word	0xeadfd000
	P_DDEMAP_ALL
	.word	0xbe86a038
	.word	0xeadfc200
	P_TOGGLE_LSU_DM
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x328, %i7
	P_DTLB_TAG_READ
thr6_MMU_ASI_PRIMARY_317:
	.word	0x87802080
	.word	0xd4f12100
	.word	0xea5c2068
	.word	0x1000000
	or	%g0, 0x007, %i7
	P_LOAD_DDATA_IN
thr6_MMU_ASI_PRIMARY_318:
	.word	0x87802080
	.word	0xdcf0a0b0
	nop
	.word	0xc02129e0
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_319:
	.word	0x8780202a
	.word	0xccb8af90
	P_DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x030, %i7
	P_LOAD_DDATA_IN
	.word	0xfe442f88
	P_DDEMAP_SCTX
thr6_MMU_ASI_PRIMARY_320:
	.word	0x87802080
	.word	0xd2f6a000
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr6_User_Text_4v002_exit:
	EXIT_GOOD
Thr6_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v101 DATA_VA=0x7720000e0000
attr_data {
	Name = .Thr6_User_Data_4v101 ,
	VA = 0x7720000e0000 ,/* 0x7720000e1fc0 */
	RA = 0x01401a0000 ,
	PA = 0x6d401a0000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007720000e08ec 8000006d401a0040 */
	end_label   = Thr6_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v101_data_begin
Thr6_User_Data_4v101_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v201 DATA_VA=0x772000186000
attr_data {
	Name = .Thr6_User_Data_4v201 ,
	VA = 0x772000186000 ,/* 0x772000187fc0 */
	RA = 0x0140112000 ,
	PA = 0x6d40112000 ,
	TTE_Context = 0x1685 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000772000187598 8000006d40112040 */
	end_label   = Thr6_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v201_data_begin
Thr6_User_Data_4v201_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v301 DATA_VA=0x79003e000000
attr_data {
	Name = .Thr6_User_Data_4v301 ,
	VA = 0x79003e000000 ,/* 0x79003e3fffc0 */
	RA = 0x0237800000 ,
	PA = 0x0237800000 ,
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
	/* DTTE_TAG_DATA = 000079003e000000 8000000237800043 */
	end_label   = Thr6_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v301_data_begin
Thr6_User_Data_4v301_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v003 TEXT_VA=0x780000970000
attr_text {
	Name = .Thr6_User_Text_4v003 ,
	VA = 0x780000970000 ,/* 0x78000097ffc0 */
	RA = 0x01b0730000 ,
	PA = 0x6db0730000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000780000971fbb 8000006db0730481 */
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
	or	%g0, 0x1d2, %i7
	LOAD_IDATA_ACCESS
thr6_MMU_ASI_PRIMARY_321:
	.word	0x87802080
	.word	0xdef2a080
thr6_MMU_ASI_PRIMARY_322:
	.word	0x87802080
	.word	0xf2f12088
	DDEMAP_ALL_PAGES
thr6_MMU_ASI_SECONDARY_323:
	.word	0x87802081
	.word	0xe2f5a010
	.word	0xfe52abd2
	.word	0x1000000
	or	%g0, 0x410, %i7
	ITLB_TAG_READ
	DDEMAP_PCTX
	.word	0xc076ae40
	.word	0x1000000
	or	%g0, 0x698, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x3e0, %i7
	READ_DDATA_ACCESS
	ACCESS_ITSB_PTR
	nop
	ACCESS_ITSB_PTR
	.word	0xc02aa158
	.word	0x1000000
	or	%g0, 0x3dc, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4aaf90
	.word	0x1000000
	or	%g0, 0x680, %i7
	DTLB_TAG_READ
	.word	0xc022a950
	.word	0xfe5ea338
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf45f60f0
	.word	0xfcde9000
	TOGGLE_LSU_IM
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe67120e8
	.word	0xc0376be4
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v003_exit:
	EXIT_GOOD
Thr6_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v401 TEXT_VA=0x7720000c4000
attr_text {
	Name = .Thr6_User_Text_4v401 ,
	VA = 0x7720000c4000 ,/* 0x7720000c5fc0 */
	RA = 0x0140042000 ,
	PA = 0x6d40042000 ,
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
	/* ITTE_TAG_DATA = 00007720000c4000 8000006d40042080 */
	end_label   = Thr6_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v401_text_begin
Thr6_User_Text_4v401_text_begin:
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
	P_IDEMAP_ALL_PAGES
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_SCTX
	.word	0xbe8560e0
	.word	0xd4dfd000
	P_ACCESS_DTSB_PTR
	.word	0xfc9a9100
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_324:
	.word	0x8780202a
	.word	0xd4baacf0
thr6_MMU_ASI_SECONDARY_325:
	.word	0x87802081
	.word	0xdef46050
	P_DDEMAP_PCTX
	P_IDEMAP_ALL
	nop
	nop
	P_IDEMAP_ALL_PAGES
	.word	0xee74a018
	.word	0xc025ec58
thr6_MMU_ASI_PRIMARY_LITTLE_326:
	.word	0x87802088
	.word	0xf4f2a100
	P_TOGGLE_LSU_IM
thr6_MMU_ASI_AS_IF_USER_PRIMARY_327:
	.word	0x87802010
	.word	0xf0f12050
thr6_MMU_ASI_PRIMARY_328:
	.word	0x87802080
	.word	0xc6f420f8
	.word	0xbe816070
	.word	0xe39fc2e0
	.word	0x1000000
	or	%g0, 0x480, %i7
	P_DTLB_TAG_READ
	.word	0xfc9dc5c0
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v401_exit:
	EXIT_GOOD
Thr6_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v004 TEXT_VA=0x772000064000
attr_text {
	Name = .Thr6_User_Text_4v004 ,
	VA = 0x772000064000 ,/* 0x772000065fc0 */
	RA = 0x0140020000 ,
	PA = 0x6d40020000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
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
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00007720000648ec 8000006d40020480 */
	end_label   = Thr6_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v004_text_begin
Thr6_User_Text_4v004_text_begin:
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
	.word	0xbe856130
	.word	0xe0dfc200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd5000
	P_ACCESS_ITSB_PTR
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
	.word	0xbe82a110
	.word	0xe0dfd000
	P_IDEMAP_NCTX
	nop
	nop
	nop
	.word	0xfcdc0200
	.word	0xfcde9000
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
	.word	0xc8dfc200
	.word	0xbe846040
	.word	0xc19fc2e0
	P_TOGGLE_LSU_DM
	.word	0xfcdf5000
thr6_MMU_ASI_AS_IF_USER_PRIMARY_329:
	.word	0x87802010
	.word	0xd8f560c0
	P_IDEMAP_ALL
	.word	0xc036a268
	.word	0xbe856120
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x28, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe170000
	P_IDEMAP_PAGE
	nop
	nop
	nop
	nop
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
thr6_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_330:
	.word	0x87802018
	.word	0xfaf56150
	nop
	.word	0xfc9c1d40
	.word	0x1000000
	or	%g0, 0x423, %i7
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
	.word	0xfcde9000
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0xe0, %i7
	P_ITLB_TAG_READ
	.word	0xe4756018
	.word	0xc07565f8
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr6_User_Text_4v004_exit:
	EXIT_GOOD
Thr6_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v102 DATA_VA=0x7720001be000
attr_data {
	Name = .Thr6_User_Data_4v102 ,
	VA = 0x7720001be000 ,/* 0x7720001bffc0 */
	RA = 0x01401b4000 ,
	PA = 0x6d401b4000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007720001be8ec 8000006d401b4040 */
	end_label   = Thr6_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v102_data_begin
Thr6_User_Data_4v102_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v202 DATA_VA=0x7a0cf0000000
attr_data {
	Name = .Thr6_User_Data_4v202 ,
	VA = 0x7a0cf0000000 ,/* 0x7a0cffffffc0 */
	RA = 0x03e0000000 ,
	PA = 0x6fe0000000 ,
	TTE_Context = 0x1685 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007a0cf0001685 8000006fe0000045 */
	end_label   = Thr6_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v202_data_begin
Thr6_User_Data_4v202_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v302 DATA_VA=0x7800003a0000
attr_data {
	Name = .Thr6_User_Data_4v302 ,
	VA = 0x7800003a0000 ,/* 0x7800003affc0 */
	RA = 0x01b0bc0000 ,
	PA = 0x01b0bc0000 ,
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
	/* DTTE_TAG_DATA = 00007800003a0000 80000001b0bc0041 */
	end_label   = Thr6_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v302_data_begin
Thr6_User_Data_4v302_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v005 TEXT_VA=0x780000b40000
attr_text {
	Name = .Thr6_User_Text_4v005 ,
	VA = 0x780000b40000 ,/* 0x780000b4ffc0 */
	RA = 0x01b0b70000 ,
	PA = 0x6db0b70000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000780000b41fbb 8000006db0b70481 */
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
	.word	0xbe86a100
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x06a, %i7
	LOAD_IDATA_IN
	.word	0xee5c2018
	.word	0xee5f60c0
	.word	0xfe4c2965
	.word	0xbe150000
	GOTO_SUPERVISOR1
	TOGGLE_LSU_DM
thr6_MMU_ASI_PRIMARY_331:
	.word	0x87802080
	.word	0xe4f2a078
thr6_MMU_ASI_PRIMARY_332:
	.word	0x87802080
	.word	0xdaf2a0d8
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe114000
	IDEMAP_PAGE
	IDEMAP_NCTX
	.word	0xe472a0a0
	.word	0xc028a3ee
	ACCESS_ITSB_PTR
	.word	0xfe42ae88
	DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x033, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x5fd, %i7
	LOAD_IDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xbe8420b8
	.word	0xc8dfd000
	ACCESS_DTSB_PTR
	TOGGLE_LSU_DM
	IDEMAP_ALL_PAGES
	IDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc07427e8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xec756098
	.word	0xc0276454
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v005_exit:
	EXIT_GOOD
Thr6_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v402 TEXT_VA=0x772000066000
attr_text {
	Name = .Thr6_User_Text_4v402 ,
	VA = 0x772000066000 ,/* 0x772000067fc0 */
	RA = 0x01400b6000 ,
	PA = 0x6d400b6000 ,
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
	/* ITTE_TAG_DATA = 0000772000066000 8000006d400b6080 */
	end_label   = Thr6_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v402_text_begin
Thr6_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xbe842140
	.word	0xf4dfc200
	.word	0xfcdc1000
	.word	0xc02ee781
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	P_READ_DDATA_ACCESS
	.word	0xfcdf5040
	.word	0xfcde8200
	.word	0xbe862088
	.word	0xeedfc280
	P_IDEMAP_ALL_RPAGES
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x628, %i7
	P_READ_DDATA_ACCESS
thr6_MMU_ASI_AS_IF_USER_PRIMARY_333:
	.word	0x87802010
	.word	0xd8f42018
	.word	0xfcde9000
	.word	0xd45de128
	.word	0xfe54a868
	.word	0xfe4de6bf
	.word	0x1000000
	or	%g0, 0x510, %i7
	P_DTLB_TAG_READ
	.word	0xfe45e7e4
	.word	0xbe842110
	.word	0xd4dfd000
	P_DDEMAP_ALL_PAGES
	.word	0xe274a010
	.word	0xc02eefe4
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x59e, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc076e8e0
	.word	0xc02b2af9
	.word	0xd85ca018
	P_ACCESS_ITSB_PTR
	.word	0xfcde8300
	.word	0xbe82a100
	.word	0xc8dfc200
	.word	0xbe842038
	.word	0xf4dfc200
thr6_MMU_ASI_PRIMARY_LITTLE_334:
	.word	0x87802088
	.word	0xe2f42070
	P_IDEMAP_ALL_PAGES
	P_ACCESS_ITSB_PTR
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_335:
	.word	0x8780202a
	.word	0xc0baadd0
	P_ACCESS_DTSB_PTR
	.word	0xc036ec70
	.word	0xf875e060
	.word	0xc0732a60
	P_DDEMAP_PCTX
	.word	0xc076e600
	.word	0xf071a0f8
	.word	0xc0232e9c
	P_ACCESS_DTSB_PTR
	.word	0xfcdf4200
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe11c000
	P_IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	P_ITLB_TAG_READ
	.word	0xc02b2481
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc671a020
	.word	0xc071ad98
thr6_MMU_ASI_PRIMARY_336:
	.word	0x87802080
	.word	0xd2f120c8
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v402_exit:
	EXIT_GOOD
Thr6_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v103 DATA_VA=0x772000072000
attr_data {
	Name = .Thr6_User_Data_4v103 ,
	VA = 0x772000072000 ,/* 0x772000073fc0 */
	RA = 0x014010e000 ,
	PA = 0x6d4010e000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007720000728ec 8000006d4010e040 */
	end_label   = Thr6_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v103_data_begin
Thr6_User_Data_4v103_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v203 DATA_VA=0x77200013a000
attr_data {
	Name = .Thr6_User_Data_4v203 ,
	VA = 0x77200013a000 ,/* 0x77200013bfc0 */
	RA = 0x01400e8000 ,
	PA = 0x6d400e8000 ,
	TTE_Context = 0x1685 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000077200013b598 8000006d400e8040 */
	end_label   = Thr6_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v203_data_begin
Thr6_User_Data_4v203_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v303 DATA_VA=0x77200015a000
attr_data {
	Name = .Thr6_User_Data_4v303 ,
	VA = 0x77200015a000 ,/* 0x77200015bfc0 */
	RA = 0x01400c0000 ,
	PA = 0x6d400c0000 ,
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
	/* DTTE_TAG_DATA = 000077200015a000 8000006d400c0040 */
	end_label   = Thr6_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v303_data_begin
Thr6_User_Data_4v303_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v006 TEXT_VA=0x780000cd0000
attr_text {
	Name = .Thr6_User_Text_4v006 ,
	VA = 0x780000cd0000 ,/* 0x780000cdffc0 */
	RA = 0x01b0060000 ,
	PA = 0x6db0060000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000780000cd1fbb 8000006db0060481 */
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
	.word	0xe2742040
	.word	0xc0242734
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x086, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0xeb, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe46a698
	DDEMAP_SCTX
	.word	0xfcdc1000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5aad70
	TOGGLE_LSU_DM
	nop
	nop
	.word	0xee5d6018
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a090
	.word	0xfadfd000
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
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
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0xfcdd5000
	.word	0xfcdf5000
	.word	0xfe42ad90
thr6_MMU_ASI_PRIMARY_LITTLE_337:
	.word	0x87802088
	.word	0xecbea930
	IDEMAP_ALL
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfcda9000
	.word	0xc4592100
	IDEMAP_PCTX
	.word	0xcc7760a0
	.word	0xc03421d8
	TOGGLE_LSU_DM
	DDEMAP_PCTX
	DDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	.word	0xc47420e0
	.word	0xc02aa298
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr6_MMU_ASI_SECONDARY_338:
	.word	0x87802081
	.word	0xc0b96d80
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x019, %i7
	LOAD_DDATA_IN
	.word	0xfcdf5040
	.word	0x1000000
	or	%g0, 0x39, %i7
	LOAD_IDATA_ACCESS
	.word	0xd27420a8
	.word	0xc020adb8
	.word	0xfe5c2340
	.word	0x1000000
	or	%g0, 0x580, %i7
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
	nop
	nop
	nop
	nop
	nop
	.word	0xfe542834
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_339:
	.word	0x87802080
	.word	0xc8f76130
	.word	0xfcdd5100
	.word	0xd85f6018
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xc076aa98
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v006_exit:
	EXIT_GOOD
Thr6_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v403 TEXT_VA=0x79001ec00000
attr_text {
	Name = .Thr6_User_Text_4v403 ,
	VA = 0x79001ec00000 ,/* 0x79001effffc0 */
	RA = 0x0237c00000 ,
	PA = 0x0237c00000 ,
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
	/* ITTE_TAG_DATA = 000079001ec00000 8000000237c00083 */
	end_label   = Thr6_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v403_text_begin
Thr6_User_Text_4v403_text_begin:
	wrpr	0, %gl
	.word	0xfcd95120
thr6_MMU_ASI_SECONDARY_340:
	.word	0x87802081
	.word	0xd2f5a0d8
	.word	0xd45ca0d0
	.word	0xbe856090
	.word	0xd4dfc200
	.word	0x1000000
	.word	0xbe118000
	P_IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x542, %i7
	P_LOAD_IDATA_ACCESS
thr6_MMU_ASI_REAL_IO_341:
	.word	0x87802015
	.word	0xd8f16018
	.word	0xfcda8200
	P_IDEMAP_NCTX
thr6_MMU_ASI_PRIMARY_342:
	.word	0x87802080
	.word	0xc6f2a0a8
	.word	0xbe856090
	.word	0xd4dfd000
	P_ACCESS_DTSB_PTR
	P_TOGGLE_LSU_IM
	.word	0xfa5de008
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe86a128
	.word	0xe0dfd000
	.word	0xfcde9000
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
	.word	0xfcdd5000
	.word	0xfcdd5000
	.word	0x1000000
	or	%g0, 0x170, %i7
	P_READ_DDATA_ACCESS
	.word	0xc0332be2
	.word	0xfa59a0b8
	.word	0xfcde8200
	.word	0x1000000
	.word	0xbe150000
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
	.word	0xfcd91000
	.word	0xfe432a5c
	.word	0xe19f5f00
	.word	0xfa76e0e0
	.word	0xc029a158
	.word	0xfc9c85e0
	.word	0xc4732130
	.word	0xc02ca776
	.word	0x1000000
	or	%g0, 0x180, %i7
	P_READ_IDATA_ACCESS
	.word	0xfcdf5000
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9d9020
	.word	0x1000000
	.word	0xbe178000
	P_IDEMAP_RPAGE
	.word	0xf65ca018
	.word	0x1000000
	or	%g0, 0x64, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfe54acc8
	.word	0xfe41af00
	nop
	nop
	nop
	nop
thr6_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_343:
	.word	0x87802018
	.word	0xd2f42080
	nop
	nop
	nop
	.word	0xfcda8200
	.word	0xce75e0c8
	.word	0xc0732668
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v403_exit:
	EXIT_GOOD
Thr6_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v104 DATA_VA=0x772000150000
attr_data {
	Name = .Thr6_User_Data_4v104 ,
	VA = 0x772000150000 ,/* 0x772000151fc0 */
	RA = 0x0140016000 ,
	PA = 0x6d40016000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007720001508ec 8000006d40016040 */
	end_label   = Thr6_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v104_data_begin
Thr6_User_Data_4v104_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v304 DATA_VA=0x7720001e8000
attr_data {
	Name = .Thr6_User_Data_4v304 ,
	VA = 0x7720001e8000 ,/* 0x7720001e9fc0 */
	RA = 0x014002a000 ,
	PA = 0x6d4002a000 ,
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
	/* DTTE_TAG_DATA = 00007720001e8000 8000006d4002a040 */
	end_label   = Thr6_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v304_data_begin
Thr6_User_Data_4v304_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v007 TEXT_VA=0x7a0570000000
attr_text {
	Name = .Thr6_User_Text_4v007 ,
	VA = 0x7a0570000000 ,/* 0x7a057fffffc0 */
	RA = 0x0070000000 ,
	PA = 0x6870000000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 00007a0570001fbb 8000006870000485 */
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
	.word	0xc027695c
thr6_MMU_ASI_BLK_COMMIT_P_344:
	.word	0x878020e0
	.word	0xe1bd6f80
	.word	0xdc756028
	.word	0xc032afc6
	.word	0x1000000
	or	%g0, 0x54f, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	nop
	nop
	nop
	nop
	.word	0xfe56ac7e
	.word	0x1000000
	or	%g0, 0x5e8, %i7
	ITLB_TAG_READ
	.word	0xfc995120
	.word	0xf872a030
	.word	0xc0756790
	.word	0xfcd91000
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr6_MMU_ASI_PRIMARY_345:
	.word	0x87802080
	.word	0xecf6a010
	DDEMAP_SCTX
	DDEMAP_ALL
	.word	0xd8742018
	.word	0xc0356bea
	.word	0xbe120000
	GOTO_SUPERVISOR1
thr6_MMU_ASI_BLK_COMMIT_S_346:
	.word	0x878020e1
	.word	0xc3b96940
thr6_MMU_ASI_PRIMARY_347:
	.word	0x87802080
	.word	0xcaf42010
	.word	0xe476a078
	.word	0xc072ab98
	.word	0x1000000
	or	%g0, 0x07b, %i7
	LOAD_IDATA_IN
	.word	0xc19d5f00
	.word	0xfcde9000
	.word	0xc0312800
	nop
	.word	0x1000000
	or	%g0, 0x5e0, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x098, %i7
	LOAD_DDATA_IN
	nop
	nop
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x110, %i7
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
	or	%g0, 0x583, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_ALL
	IDEMAP_ALL_PAGES
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc07422a8
	.word	0xe3995f20
	.word	0xfa5ea0b8
	IDEMAP_ALL_PAGES
	.word	0xc0256434
	IDEMAP_ALL_RPAGES
	.word	0xf472a150
	.word	0xc0342a36
	.word	0xfcdc1000
	IDEMAP_ALL
	.word	0xc026a158
	.word	0x1000000
	or	%g0, 0x38, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe456908
	.word	0xbe86a0f0
	.word	0xeadfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe46aaa4
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v007_exit:
	EXIT_GOOD
Thr6_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v105 DATA_VA=0x7720000ee000
attr_data {
	Name = .Thr6_User_Data_4v105 ,
	VA = 0x7720000ee000 ,/* 0x7720000effc0 */
	RA = 0x0140048000 ,
	PA = 0x6d40048000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007720000ee8ec 8000006d40048040 */
	end_label   = Thr6_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v105_data_begin
Thr6_User_Data_4v105_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v008 TEXT_VA=0x780000880000
attr_text {
	Name = .Thr6_User_Text_4v008 ,
	VA = 0x780000880000 ,/* 0x78000088ffc0 */
	RA = 0x01b0c00000 ,
	PA = 0x6db0c00000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000780000881fbb 8000006db0c00481 */
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
	or	%g0, 0x94, %i7
	LOAD_IDATA_ACCESS
	.word	0xc85aa068
	.word	0xbe82a0d0
	.word	0xe0dfd000
	.word	0xfcda9140
	.word	0x1000000
	or	%g0, 0x508, %i7
	READ_IDATA_ACCESS
	.word	0xe05aa138
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x7c8, %i7
	READ_DDATA_ACCESS
	.word	0xfe46ab60
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45d6038
	.word	0x1000000
	or	%g0, 0x788, %i7
	READ_DDATA_ACCESS
	.word	0xd87420a0
	.word	0xc02f6a39
	.word	0x1000000
	or	%g0, 0x8b, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
thr6_MMU_ASI_PRIMARY_348:
	.word	0x87802080
	.word	0xcef2a030
	.word	0xfcdc1000
	ACCESS_DTSB_PTR
thr6_MMU_ASI_PRIMARY_LITTLE_349:
	.word	0x87802088
	.word	0xdaf420d8
	TOGGLE_LSU_DM
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xc02d6f72
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v008_exit:
	EXIT_GOOD
Thr6_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v106 DATA_VA=0x780000320000
attr_data {
	Name = .Thr6_User_Data_4v106 ,
	VA = 0x780000320000 ,/* 0x78000032ffc0 */
	RA = 0x01b0460000 ,
	PA = 0x6db0460000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000321fbb 8000006db0460041 */
	end_label   = Thr6_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v106_data_begin
Thr6_User_Data_4v106_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v009 TEXT_VA=0x79003a000000
attr_text {
	Name = .Thr6_User_Text_4v009 ,
	VA = 0x79003a000000 ,/* 0x79003a3fffc0 */
	RA = 0x0238000000 ,
	PA = 0x0238000000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000079003a001fbb 8000000238000483 */
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
	.word	0xf27560b0
	.word	0xc0312b46
	.word	0xc39d5e00
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xcc76a018
	.word	0xc0256b68
	.word	0xc85f6038
	.word	0xfe5eaa58
	.word	0xc02c2bec
	.word	0xbe138000
	GOTO_SUPERVISOR1
	DDEMAP_SCTX
	.word	0xc02c2273
	.word	0x1000000
	or	%g0, 0x085, %i7
	LOAD_IDATA_IN
	.word	0xbe86a090
	.word	0xf4dfd000
	.word	0x1000000
	or	%g0, 0xb8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x068, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe4aad65
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v009_exit:
	EXIT_GOOD
Thr6_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v107 DATA_VA=0x780000c30000
attr_data {
	Name = .Thr6_User_Data_4v107 ,
	VA = 0x780000c30000 ,/* 0x780000c3ffc0 */
	RA = 0x01b07f0000 ,
	PA = 0x6db07f0000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000c31fbb 8000006db07f0041 */
	end_label   = Thr6_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v107_data_begin
Thr6_User_Data_4v107_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00a TEXT_VA=0x772000148000
attr_text {
	Name = .Thr6_User_Text_4v00a ,
	VA = 0x772000148000 ,/* 0x772000149fc0 */
	RA = 0x01401e4000 ,
	PA = 0x6d401e4000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007720001488ec 8000006d401e4480 */
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
	.word	0xfc9c1c40
thr6_MMU_ASI_PRIMARY_350:
	.word	0x87802080
	.word	0xd6f56070
	.word	0x1000000
	or	%g0, 0x2bf, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xbe812110
	.word	0xeadfd000
	.word	0x1000000
	or	%g0, 0x420, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_351:
	.word	0x87802080
	.word	0xd0f560b0
	.word	0x1000000
	or	%g0, 0x580, %i7
	READ_IDATA_ACCESS
	.word	0xfcd91040
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x418, %i7
	ITLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xda72a108
	.word	0xc0756320
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v00a_exit:
	EXIT_GOOD
Thr6_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v108 DATA_VA=0x7720001d8000
attr_data {
	Name = .Thr6_User_Data_4v108 ,
	VA = 0x7720001d8000 ,/* 0x7720001d9fc0 */
	RA = 0x0140030000 ,
	PA = 0x6d40030000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007720001d88ec 8000006d40030040 */
	end_label   = Thr6_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v108_data_begin
Thr6_User_Data_4v108_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00b TEXT_VA=0x772000014000
attr_text {
	Name = .Thr6_User_Text_4v00b ,
	VA = 0x772000014000 ,/* 0x772000015fc0 */
	RA = 0x0140082000 ,
	PA = 0x6d40082000 ,
	TTE_Context = 0x1fbb ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007720000148ec 8000006d40082480 */
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
	.word	0xfe5d6de0
	.word	0xfa70a118
	.word	0xc076a980
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x6e8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x98, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4c2659
	.word	0xbe82a0d0
	.word	0xc8dfd000
	.word	0xc02c2fb0
	.word	0xfa5aa0d0
	.word	0xbe86a090
	.word	0xd4dfd000
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x036, %i7
	LOAD_IDATA_IN
	.word	0xfcdc5020
	.word	0x1000000
	or	%g0, 0x1d8, %i7
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
	.word	0xee742018
	.word	0xc03423c6
	.word	0xbe82a150
	.word	0xe0dfd000
	.word	0xd076a0b0
	.word	0xc02c2680
	IDEMAP_ALL_RPAGES
	.word	0xfa5ea008
	.word	0xbe8560b8
	.word	0xeadfd000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd45c2038
	TOGGLE_LSU_DM
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xbe842068
	.word	0xf4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xee756018
	.word	0xc0256264
	.word	0xc02d62a6
	.word	0xfe42a414
	.word	0xd276a000
	.word	0xc0342158
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe14c000
	IDEMAP_RPAGE
	.word	0xfe412fc0
	.word	0x1000000
	or	%g0, 0x448, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x100, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0xce72a0c8
	.word	0xc02c298f
thr6_MMU_ASI_BLK_P_352:
	.word	0x878020f0
	.word	0xe3bea500
	.word	0x1000000
	or	%g0, 0x054, %i7
	LOAD_DDATA_IN
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xfe4ea87e
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v00b_exit:
	EXIT_GOOD
Thr6_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v109 DATA_VA=0x79002fc00000
attr_data {
	Name = .Thr6_User_Data_4v109 ,
	VA = 0x79002fc00000 ,/* 0x79002fffffc0 */
	RA = 0x0239800000 ,
	PA = 0x0239800000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000079002fc01fbb 8000000239800043 */
	end_label   = Thr6_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v109_data_begin
Thr6_User_Data_4v109_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10a DATA_VA=0x772000188000
attr_data {
	Name = .Thr6_User_Data_4v10a ,
	VA = 0x772000188000 ,/* 0x772000189fc0 */
	RA = 0x0140086000 ,
	PA = 0x6d40086000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007720001888ec 8000006d40086040 */
	end_label   = Thr6_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10a_data_begin
Thr6_User_Data_4v10a_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10b DATA_VA=0x772000044000
attr_data {
	Name = .Thr6_User_Data_4v10b ,
	VA = 0x772000044000 ,/* 0x772000045fc0 */
	RA = 0x0140018000 ,
	PA = 0x6d40018000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007720000448ec 8000006d40018040 */
	end_label   = Thr6_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10b_data_begin
Thr6_User_Data_4v10b_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10c DATA_VA=0x7720001b2000
attr_data {
	Name = .Thr6_User_Data_4v10c ,
	VA = 0x7720001b2000 ,/* 0x7720001b3fc0 */
	RA = 0x014003c000 ,
	PA = 0x6d4003c000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007720001b28ec 8000006d4003c040 */
	end_label   = Thr6_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10c_data_begin
Thr6_User_Data_4v10c_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10d DATA_VA=0x772000122000
attr_data {
	Name = .Thr6_User_Data_4v10d ,
	VA = 0x772000122000 ,/* 0x772000123fc0 */
	RA = 0x014008a000 ,
	PA = 0x6d4008a000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007720001228ec 8000006d4008a040 */
	end_label   = Thr6_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10d_data_begin
Thr6_User_Data_4v10d_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10e DATA_VA=0x7800009b0000
attr_data {
	Name = .Thr6_User_Data_4v10e ,
	VA = 0x7800009b0000 ,/* 0x7800009bffc0 */
	RA = 0x01b0ce0000 ,
	PA = 0x6db0ce0000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007800009b1fbb 8000006db0ce0041 */
	end_label   = Thr6_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10e_data_begin
Thr6_User_Data_4v10e_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10f DATA_VA=0x780000560000
attr_data {
	Name = .Thr6_User_Data_4v10f ,
	VA = 0x780000560000 ,/* 0x78000056ffc0 */
	RA = 0x01b0340000 ,
	PA = 0x6db0340000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000561fbb 8000006db0340041 */
	end_label   = Thr6_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10f_data_begin
Thr6_User_Data_4v10f_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v110 DATA_VA=0x7800000c0000
attr_data {
	Name = .Thr6_User_Data_4v110 ,
	VA = 0x7800000c0000 ,/* 0x7800000cffc0 */
	RA = 0x01b0630000 ,
	PA = 0x6db0630000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007800000c1fbb 8000006db0630041 */
	end_label   = Thr6_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v110_data_begin
Thr6_User_Data_4v110_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v111 DATA_VA=0x772000110000
attr_data {
	Name = .Thr6_User_Data_4v111 ,
	VA = 0x772000110000 ,/* 0x772000111fc0 */
	RA = 0x01400ce000 ,
	PA = 0x6d400ce000 ,
	TTE_Context = 0x1fbb ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007720001108ec 8000006d400ce040 */
	end_label   = Thr6_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v111_data_begin
Thr6_User_Data_4v111_data_begin:
	.xword	0x780000040000
	.xword	0x780000770000
	.xword	0x7720001aa000
	.xword	0x780000ba0000
	.xword	0x7720001d2000
	.xword	0x780000bb0000
	.xword	0x790039c00000
	.xword	0x7720000e0000
	.xword	0x772000186000
	.xword	0x79003e000000
	.xword	0x780000970000
	.xword	0x7720000c4000
	.xword	0x772000064000
	.xword	0x7720001be000
	.xword	0x7a0cf0000000
	.xword	0x7800003a0000
	.xword	0x780000b40000
	.xword	0x772000066000
	.xword	0x772000072000
	.xword	0x77200013a000
	.xword	0x77200015a000
	.xword	0x780000cd0000
	.xword	0x79001ec00000
	.xword	0x772000150000
	.xword	0x7720001e8000
	.xword	0x7a0570000000
	.xword	0x7720000ee000
	.xword	0x780000880000
	.xword	0x780000320000
	.xword	0x79003a000000
	.xword	0x780000c30000
	.xword	0x772000148000
	.xword	0x7720001d8000
	.xword	0x772000014000
	.xword	0x79002fc00000
	.xword	0x772000188000
	.xword	0x772000044000
	.xword	0x7720001b2000
	.xword	0x772000122000
	.xword	0x7800009b0000
	.xword	0x780000560000
	.xword	0x7800000c0000
	.xword	0x772000110000
Thr6_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x7c0000120000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	VA = 0x7c0000120000 ,/* 0x7c000012ffc0 */
	RA = 0x01c04a0000 ,
	PA = 0x7dc04a0000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c00001206dc 8000007dc04a0481 */
	end_label   = Thr7_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr7_user_code_entry
Thr7_user_code_entry:
	setx	0x7b3000022000, %g1, %g2
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
	.word	0xfe52aca8
	.word	0xea766068
	.word	0xc03669fe
	.word	0x1000000
	or	%g0, 0x340, %i7
	READ_DDATA_ACCESS
	.word	0xe05c2160
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr7_MMU_ASI_BLK_SL_353:
	.word	0x878020f9
	.word	0xe1baef40
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
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xe67760f8
	.word	0xc0366bbc
	.word	0xce742050
	.word	0xc02d654f
	.word	0xbe82e098
	.word	0xe2dfd020
	ACCESS_ITSB_PTR
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4f61fa
	.word	0xf67420c0
	.word	0xc036690e
	.word	0xfcdf5000
	.word	0xfcdc1000
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x280, %i7
	DTLB_TAG_READ
thr7_MMU_ASI_PRIMARY_354:
	.word	0x87802080
	.word	0xd2f760e8
	IDEMAP_ALL_PAGES
	.word	0xc02c2992
	.word	0x1000000
	.word	0xbe104000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x392, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe856090
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
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcda9000
	ACCESS_DTSB_PTR
	.word	0xe8742028
	.word	0xc03767e4
thr7_MMU_ASI_PRIMARY_355:
	.word	0x87802080
	.word	0xccf42018
	.word	0xf4776010
	.word	0xc022ab7c
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x44, %i7
	LOAD_DDATA_ACCESS
thr7_MMU_ASI_PRIMARY_356:
	.word	0x87802080
	.word	0xd8f660c0
	.word	0x1000000
	or	%g0, 0x082, %i7
	LOAD_IDATA_IN
thr7_MMU_ASI_PRIMARY_357:
	.word	0x87802080
	.word	0xe6f760c8
	IDEMAP_NCTX
	DDEMAP_NCTX
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe412c24
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v000_exit:
	EXIT_GOOD
Thr7_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v100 DATA_VA=0x7b3000022000
attr_data {
	Name = .Thr7_User_Data_4v100 ,
	VA = 0x7b3000022000 ,/* 0x7b3000023fc0 */
	RA = 0x0150124000 ,
	PA = 0x0150124000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b30000226dc 8000000150124440 */
	end_label   = Thr7_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v100_data_begin
Thr7_User_Data_4v100_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v200 DATA_VA=0x7e02b0000000
attr_data {
	Name = .Thr7_User_Data_4v200 ,
	VA = 0x7e02b0000000 ,/* 0x7e02bfffffc0 */
	RA = 0x03f0000000 ,
	PA = 0x7ff0000000 ,
	TTE_Context = 0x02a6 ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_1 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 00007e02b00002a6 8000007ff0000445 */
	end_label   = Thr7_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v200_data_begin
Thr7_User_Data_4v200_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v300 DATA_VA=0x7b300015c000
attr_data {
	Name = .Thr7_User_Data_4v300 ,
	VA = 0x7b300015c000 ,/* 0x7b300015dfc0 */
	RA = 0x01501ec000 ,
	PA = 0x7d501ec000 ,
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
	/* DTTE_TAG_DATA = 00007b300015c000 8000007d501ec040 */
	end_label   = Thr7_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v300_data_begin
Thr7_User_Data_4v300_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v001 TEXT_VA=0x7c0000090000
attr_text {
	Name = .Thr7_User_Text_4v001 ,
	VA = 0x7c0000090000 ,/* 0x7c000009ffc0 */
	RA = 0x01c09b0000 ,
	PA = 0x7dc09b0000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c00000906dc 8000007dc09b0481 */
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
	.word	0xfe5f64f8
	.word	0xfcdd5000
	.word	0xcc72a0a0
	.word	0xc02e6ac4
	.word	0x1000000
	or	%g0, 0x083, %i7
	LOAD_IDATA_IN
thr7_MMU_ASI_BLK_COMMIT_P_358:
	.word	0x878020e0
	.word	0xc1bf66c0
	TOGGLE_LSU_IM
	.word	0x1000000
	.word	0xbe15c000
	IDEMAP_PAGE
	nop
	nop
	DDEMAP_ALL
	DDEMAP_ALL
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe442d38
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
	or	%g0, 0x460, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5a0, %i7
	DTLB_TAG_READ
	.word	0xfcda9000
	TOGGLE_LSU_IM
	.word	0xfe47673c
	.word	0xfcde9060
	.word	0xc0212c10
	.word	0xe39a9e00
	nop
	nop
	nop
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
	or	%g0, 0x07a, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr7_MMU_ASI_PRIMARY_359:
	.word	0x87802080
	.word	0xd8f76078
	TOGGLE_LSU_DM
	.word	0xda70a020
	.word	0xc0756400
	.word	0xc0756a98
	.word	0xfcdc1000
	.word	0xe19c1e00
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf65d6018
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v001_exit:
	EXIT_GOOD
Thr7_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v400 TEXT_VA=0x7e0770000000
attr_text {
	Name = .Thr7_User_Text_4v400 ,
	VA = 0x7e0770000000 ,/* 0x7e077fffffc0 */
	RA = 0x00a0000000 ,
	PA = 0x7ca0000000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr7_z_ctx_tsb_1 ,
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
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 00007e0770000000 8000007ca0000485 */
	end_label   = Thr7_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v400_text_begin
Thr7_User_Text_4v400_text_begin:
	wrpr	0, %gl
thr7_MMU_ASI_AS_IF_USER_PRIMARY_360:
	.word	0x87802010
	.word	0xe4f2a018
	.word	0xfcda8200
	.word	0xfc9d5100
	.word	0xfcdd5000
thr7_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_361:
	.word	0x87802018
	.word	0xf2f2a0f0
	.word	0xda76e030
	.word	0xc02b2ed1
	.word	0xd45b2008
	nop
	nop
thr7_MMU_ASI_AS_IF_USER_PRIMARY_362:
	.word	0x87802010
	.word	0xd8f2a0c0
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1f8, %i7
	P_ITLB_TAG_READ
	.word	0xbe846070
	.word	0xe19fde20
	.word	0xbe866068
	.word	0xf2dfd000
	nop
	nop
	nop
	.word	0xc074a4f8
thr7_MMU_ASI_AS_IF_USER_PRIMARY_363:
	.word	0x87802010
	.word	0xcaf56070
thr7_MMU_ASI_REAL_MEM_LITTLE_364:
	.word	0x8780201c
	.word	0xd2f36050
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
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
	.word	0x1000000
	or	%g0, 0x5af, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x093, %i7
	P_LOAD_IDATA_IN
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v400_exit:
	EXIT_GOOD
Thr7_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v002 TEXT_VA=0x7b3000156000
attr_text {
	Name = .Thr7_User_Text_4v002 ,
	VA = 0x7b3000156000 ,/* 0x7b3000157fc0 */
	RA = 0x0150022000 ,
	PA = 0x0150022000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b30001566dc 8000000150022480 */
	end_label   = Thr7_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v002_text_begin
Thr7_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0xbe856068
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	P_READ_DDATA_ACCESS
	P_DDEMAP_NCTX
	P_IDEMAP_ALL_RPAGES
	P_TOGGLE_LSU_IM
	P_IDEMAP_ALL_RPAGES
	P_ACCESS_DTSB_PTR
	.word	0xbe856150
	.word	0xc4dfd000
	.word	0xfcda8200
	P_IDEMAP_PCTX
	P_ACCESS_DTSB_PTR
	P_IDEMAP_ALL_PAGES
thr7_MMU_ASI_AS_IF_USER_PRIMARY_365:
	.word	0x87802010
	.word	0xf2f56068
	.word	0x1000000
	.word	0xbe104000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x440, %i7
	P_DTLB_TAG_READ
	.word	0xbe856068
	.word	0xfadfc200
	.word	0xc0292c3c
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr7_User_Text_4v002_exit:
	EXIT_GOOD
Thr7_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v101 DATA_VA=0x7b3000198000
attr_data {
	Name = .Thr7_User_Data_4v101 ,
	VA = 0x7b3000198000 ,/* 0x7b3000199fc0 */
	RA = 0x01501c6000 ,
	PA = 0x01501c6000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b30001986dc 80000001501c6440 */
	end_label   = Thr7_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v101_data_begin
Thr7_User_Data_4v101_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v201 DATA_VA=0x7c0000a90000
attr_data {
	Name = .Thr7_User_Data_4v201 ,
	VA = 0x7c0000a90000 ,/* 0x7c0000a9ffc0 */
	RA = 0x01c0a80000 ,
	PA = 0x7dc0a80000 ,
	TTE_Context = 0x02a6 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007c0000a91df3 8000007dc0a80441 */
	end_label   = Thr7_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v201_data_begin
Thr7_User_Data_4v201_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v301 DATA_VA=0x7b3000084000
attr_data {
	Name = .Thr7_User_Data_4v301 ,
	VA = 0x7b3000084000 ,/* 0x7b3000085fc0 */
	RA = 0x015014e000 ,
	PA = 0x7d5014e000 ,
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
	/* DTTE_TAG_DATA = 00007b3000084000 8000007d5014e040 */
	end_label   = Thr7_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v301_data_begin
Thr7_User_Data_4v301_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v003 TEXT_VA=0x7b300003a000
attr_text {
	Name = .Thr7_User_Text_4v003 ,
	VA = 0x7b300003a000 ,/* 0x7b300003bfc0 */
	RA = 0x015013c000 ,
	PA = 0x015013c000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b300003a6dc 800000015013c480 */
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
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x099, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	.word	0xfcdc1000
	.word	0xc85f6120
	.word	0x1000000
	or	%g0, 0x7d7, %i7
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
	TOGGLE_LSU_DM
	.word	0xc0712a18
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xea58a0d0
	.word	0xfe4d63af
	.word	0xbe80a038
	.word	0xf2dfd000
	DDEMAP_PCTX
	.word	0xfcd91000
	.word	0xfe5d6c08
	.word	0xfcdc1000
	.word	0xc02e6170
	nop
	nop
	nop
	nop
	.word	0xcc5c2018
	.word	0xbe876110
	.word	0xeadfd000
	TOGGLE_LSU_IM
	.word	0xc6742050
	.word	0xc02f6d0e
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
	or	%g0, 0x1d2, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcdf5000
	.word	0xbe82a038
	.word	0xf2dfd000
	IDEMAP_ALL_RPAGES
thr7_MMU_ASI_PRIMARY_366:
	.word	0x87802080
	.word	0xe8f0a058
	.word	0xc0766ac8
	.word	0xc0756170
	.word	0x1000000
	or	%g0, 0x4d8, %i7
	DTLB_TAG_READ
	.word	0xd85c2018
thr7_MMU_ASI_PRIMARY_367:
	.word	0x87802080
	.word	0xdcf42028
	.word	0xfc9adc60
	.word	0x1000000
	or	%g0, 0x061, %i7
	LOAD_IDATA_IN
	.word	0xbe816098
	.word	0xd6dfd020
	.word	0x1000000
	or	%g0, 0x13d, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0766170
	.word	0x1000000
	.word	0xbe13c000
	DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe140000
	IDEMAP_PAGE
	.word	0xfcdc1100
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_PAGE
	IDEMAP_PCTX
	.word	0xbe8420e0
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
	ACCESS_ITSB_PTR
thr7_MMU_ASI_PRIMARY_368:
	.word	0x87802080
	.word	0xd0f2a028
	.word	0xd85c2018
	.word	0x1000000
	or	%g0, 0x029, %i7
	LOAD_IDATA_IN
thr7_MMU_ASI_PRIMARY_369:
	.word	0x87802080
	.word	0xd0f56028
	.word	0x1000000
	.word	0xbe124000
	DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_PRIMARY_LITTLE_370:
	.word	0x87802088
	.word	0xfaf76100
	.word	0xc02d62c1
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe05f6100
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v003_exit:
	EXIT_GOOD
Thr7_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v401 TEXT_VA=0x7c0000010000
attr_text {
	Name = .Thr7_User_Text_4v401 ,
	VA = 0x7c0000010000 ,/* 0x7c000001ffc0 */
	RA = 0x01c03a0000 ,
	PA = 0x01c03a0000 ,
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
	/* ITTE_TAG_DATA = 00007c0000010000 80000001c03a0481 */
	end_label   = Thr7_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v401_text_begin
Thr7_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x50, %i7
	P_ITLB_TAG_READ
	P_ACCESS_DTSB_PTR
	.word	0xfcdf4200
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x160, %i7
	P_READ_DDATA_ACCESS
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	.word	0xea7320e0
	.word	0xc02ca42c
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x000, %i7
	P_LOAD_IDATA_IN
	.word	0xfc9a9c40
	.word	0x1000000
	or	%g0, 0x78, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x082, %i7
	P_LOAD_IDATA_IN
	.word	0xfa75e0d0
	.word	0xc0232c84
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	P_DTLB_TAG_READ
	P_IDEMAP_ALL_RPAGES
	.word	0xfe4cad61
	P_TOGGLE_LSU_DM
thr7_MMU_ASI_PRIMARY_371:
	.word	0x87802080
	.word	0xf2f66140
	.word	0x1000000
	or	%g0, 0x140, %i7
	P_READ_DDATA_ACCESS
	.word	0xea59a0f0
	.word	0xbe866110
	.word	0xfadfc200
	nop
	nop
	.word	0x1000000
	.word	0xbe15c000
	P_IDEMAP_PAGE
	.word	0xbe866068
	.word	0xfadfc200
	.word	0xc02ee170
thr7_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_372:
	.word	0x87802023
	.word	0xd8b96a70
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_PAGES
thr7_MMU_ASI_PRIMARY_373:
	.word	0x87802080
	.word	0xdcf56058
	.word	0xfcde8320
	.word	0xbe82a100
	.word	0xd4dfd000
thr7_MMU_ASI_AS_IF_USER_PRIMARY_374:
	.word	0x87802010
	.word	0xd8f660a0
	.word	0xfcdf4200
	.word	0x1000000
	or	%g0, 0x05a, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf45ca010
	nop
	nop
	.word	0x1000000
	.word	0xbe11c000
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
	.word	0xfc9b04e0
	P_ACCESS_DTSB_PTR
thr7_MMU_ASI_PRIMARY_375:
	.word	0x87802080
	.word	0xe0f56160
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x4af, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xca74a040
	.word	0xc024ae98
	.word	0x1000000
	or	%g0, 0x4a3, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfe4de17b
	.word	0xfcda8200
	P_IDEMAP_ALL
	.word	0xbe82a0b0
	.word	0xfadfc200
thr7_MMU_ASI_PRIMARY_376:
	.word	0x87802080
	.word	0xf4f76010
	.word	0xbe812038
	.word	0xc4dfd000
thr7_MMU_ASI_AS_IF_USER_PRIMARY_377:
	.word	0x87802010
	.word	0xf8f42050
	.word	0x1000000
	or	%g0, 0x053, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_TOGGLE_LSU_DM
	P_IDEMAP_ALL
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v401_exit:
	EXIT_GOOD
Thr7_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v004 TEXT_VA=0x7c0000c60000
attr_text {
	Name = .Thr7_User_Text_4v004 ,
	VA = 0x7c0000c60000 ,/* 0x7c0000c6ffc0 */
	RA = 0x01c0c10000 ,
	PA = 0x7dc0c10000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000c606dc 8000007dc0c10481 */
	end_label   = Thr7_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v004_text_begin
Thr7_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xec756010
	.word	0xc0742170
	P_TOGGLE_LSU_IM
thr7_MMU_ASI_SECONDARY_LITTLE_378:
	.word	0x87802089
	.word	0xcaf46070
	.word	0x1000000
	.word	0xbe164000
	P_IDEMAP_PAGE
	nop
	nop
	nop
	nop
	.word	0xfe442e80
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_IDEMAP_NCTX
	.word	0xfe4c2188
	.word	0xfcd94320
	.word	0xc02aa92c
	nop
	nop
thr7_MMU_ASI_AS_IF_USER_PRIMARY_379:
	.word	0x87802010
	.word	0xd2f560c8
	P_ACCESS_DTSB_PTR
thr7_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_380:
	.word	0x87802018
	.word	0xd4f760d0
	P_IDEMAP_ALL_PAGES
	.word	0xfc9c1c40
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	P_ITLB_TAG_READ
	.word	0xbe82a0e0
	.word	0xc8dfd000
	nop
	.word	0x1000000
	.word	0xbe114000
	P_DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x089, %i7
	P_LOAD_DDATA_IN
	.word	0xfe442b9c
	.word	0x1000000
	or	%g0, 0x035, %i7
	P_LOAD_IDATA_IN
	P_TOGGLE_LSU_IM
thr7_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_381:
	.word	0x87802018
	.word	0xe2f42010
	.word	0x1000000
	or	%g0, 0x160, %i7
	P_READ_IDATA_ACCESS
thr7_MMU_ASI_AS_IF_USER_PRIMARY_382:
	.word	0x87802010
	.word	0xd0f0a058
	P_TOGGLE_LSU_IM
	.word	0xd6766010
	.word	0xc031295e
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	nop
	P_IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x09b, %i7
	P_LOAD_IDATA_IN
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr7_User_Text_4v004_exit:
	EXIT_GOOD
Thr7_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v102 DATA_VA=0x7b30001d4000
attr_data {
	Name = .Thr7_User_Data_4v102 ,
	VA = 0x7b30001d4000 ,/* 0x7b30001d5fc0 */
	RA = 0x015009c000 ,
	PA = 0x015009c000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b30001d46dc 800000015009c440 */
	end_label   = Thr7_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v102_data_begin
Thr7_User_Data_4v102_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v202 DATA_VA=0x7b3000144000
attr_data {
	Name = .Thr7_User_Data_4v202 ,
	VA = 0x7b3000144000 ,/* 0x7b3000145fc0 */
	RA = 0x015005c000 ,
	PA = 0x015005c000 ,
	TTE_Context = 0x02a6 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007b3000145df3 800000015005c440 */
	end_label   = Thr7_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v202_data_begin
Thr7_User_Data_4v202_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v302 DATA_VA=0x7e0a80000000
attr_data {
	Name = .Thr7_User_Data_4v302 ,
	VA = 0x7e0a80000000 ,/* 0x7e0a8fffffc0 */
	RA = 0x02c0000000 ,
	PA = 0x7ec0000000 ,
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
	/* DTTE_TAG_DATA = 00007e0a80000000 8000007ec0000045 */
	end_label   = Thr7_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v302_data_begin
Thr7_User_Data_4v302_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v005 TEXT_VA=0x7b30000fc000
attr_text {
	Name = .Thr7_User_Text_4v005 ,
	VA = 0x7b30000fc000 ,/* 0x7b30000fdfc0 */
	RA = 0x01501ee000 ,
	PA = 0x01501ee000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b30000fc6dc 80000001501ee480 */
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
thr7_MMU_ASI_BLK_P_383:
	.word	0x878020f0
	.word	0xc1bf63c0
	.word	0x1000000
	or	%g0, 0x541, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x4f5, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_SCTX
	.word	0xc0256d7c
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe812068
	.word	0xd4dfd000
	.word	0xc0742c68
	.word	0xbe82a140
	.word	0xeadfd000
	.word	0x1000000
	or	%g0, 0x518, %i7
	ITLB_TAG_READ
	.word	0xca5d6010
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
	.word	0xfcdd5000
	IDEMAP_ALL
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	ITLB_TAG_READ
	DDEMAP_ALL
	IDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe170000
	DDEMAP_PAGE
	.word	0xd45c2100
	.word	0xcc7420a0
	.word	0xc0256924
	.word	0xc0742258
	IDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	TOGGLE_LSU_IM
	.word	0xe272a010
	.word	0xc0376170
	.word	0xfcda9000
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
	IDEMAP_PCTX
thr7_MMU_ASI_PRIMARY_384:
	.word	0x87802080
	.word	0xd6f42040
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd87760c0
	.word	0xc02c22d9
	.word	0xd6776010
	.word	0xc07766d8
	.word	0x1000000
	.word	0xbe108000
	DDEMAP_PAGE
	.word	0xc032a3d8
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x051, %i7
	LOAD_IDATA_IN
	.word	0xfe576eb4
thr7_MMU_ASI_PRIMARY_385:
	.word	0x87802080
	.word	0xd8f56018
	.word	0xc67560a8
	.word	0xc0256324
	nop
	nop
	nop
	nop
	nop
	.word	0xf672a0c0
	.word	0xc02d6992
	IDEMAP_PCTX
	.word	0xc02f673e
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc67420c8
	.word	0xc0756188
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v005_exit:
	EXIT_GOOD
Thr7_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v402 TEXT_VA=0x7c0000bc0000
attr_text {
	Name = .Thr7_User_Text_4v402 ,
	VA = 0x7c0000bc0000 ,/* 0x7c0000bcffc0 */
	RA = 0x01c0000000 ,
	PA = 0x01c0000000 ,
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
	/* ITTE_TAG_DATA = 00007c0000bc0000 80000001c0000481 */
	end_label   = Thr7_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v402_text_begin
Thr7_User_Text_4v402_text_begin:
	wrpr	0, %gl
thr7_MMU_ASI_AS_IF_USER_PRIMARY_386:
	.word	0x87802010
	.word	0xccf560a0
thr7_MMU_ASI_BLK_P_387:
	.word	0x878020f0
	.word	0xe1bd6200
	.word	0x1000000
	or	%g0, 0x428, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe80a0d0
	.word	0xeadfc200
	.word	0x1000000
	or	%g0, 0x02a, %i7
	P_LOAD_IDATA_IN
	.word	0xd674a010
	.word	0xc024a170
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x007, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x738, %i7
	P_READ_DDATA_ACCESS
	.word	0xfc9c8480
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1c7, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x578, %i7
	P_ITLB_TAG_READ
	.word	0xc024a2a8
	.word	0x1000000
	or	%g0, 0x091, %i7
	P_LOAD_DDATA_IN
	.word	0xc029afc9
	.word	0xbe856068
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr7_MMU_ASI_BLK_COMMIT_P_388:
	.word	0x878020e0
	.word	0xe1be6140
	.word	0x1000000
	or	%g0, 0xf5, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcdc0200
	.word	0xfc995020
	.word	0xbe842038
	.word	0xd4dfd000
thr7_MMU_ASI_SECONDARY_LITTLE_389:
	.word	0x87802089
	.word	0xf2f46110
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v402_exit:
	EXIT_GOOD
Thr7_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v103 DATA_VA=0x7c0000d40000
attr_data {
	Name = .Thr7_User_Data_4v103 ,
	VA = 0x7c0000d40000 ,/* 0x7c0000d4ffc0 */
	RA = 0x01c0790000 ,
	PA = 0x7dc0790000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c0000d406dc 8000007dc0790441 */
	end_label   = Thr7_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v103_data_begin
Thr7_User_Data_4v103_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v203 DATA_VA=0x7c00003d0000
attr_data {
	Name = .Thr7_User_Data_4v203 ,
	VA = 0x7c00003d0000 ,/* 0x7c00003dffc0 */
	RA = 0x01c0ea0000 ,
	PA = 0x7dc0ea0000 ,
	TTE_Context = 0x02a6 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007c00003d1df3 8000007dc0ea0441 */
	end_label   = Thr7_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v203_data_begin
Thr7_User_Data_4v203_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v303 DATA_VA=0x7e0e80000000
attr_data {
	Name = .Thr7_User_Data_4v303 ,
	VA = 0x7e0e80000000 ,/* 0x7e0e8fffffc0 */
	RA = 0x0350000000 ,
	PA = 0x7f50000000 ,
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
	/* DTTE_TAG_DATA = 00007e0e80000000 8000007f50000045 */
	end_label   = Thr7_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v303_data_begin
Thr7_User_Data_4v303_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v006 TEXT_VA=0x7b3000128000
attr_text {
	Name = .Thr7_User_Text_4v006 ,
	VA = 0x7b3000128000 ,/* 0x7b3000129fc0 */
	RA = 0x01500de000 ,
	PA = 0x01500de000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b30001286dc 80000001500de480 */
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
	or	%g0, 0xca, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x406, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe5c2fd0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_PRIMARY_390:
	.word	0x87802080
	.word	0xf0f2a0c8
thr7_MMU_ASI_PRIMARY_LITTLE_391:
	.word	0x87802088
	.word	0xd4bc2d20
thr7_MMU_ASI_PRIMARY_392:
	.word	0x87802080
	.word	0xc4f12110
	.word	0xbe8760d0
	.word	0xd4dfd000
	TOGGLE_LSU_IM
	.word	0xc02e6e97
	.word	0xbe876038
	.word	0xeadfd000
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	.word	0xbe842140
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x178, %i7
	READ_IDATA_ACCESS
	.word	0xce766148
	.word	0xc0366992
	.word	0x1000000
	.word	0xbe15c000
	IDEMAP_PAGE
	.word	0xea5e6008
	IDEMAP_PCTX
	ACCESS_DTSB_PTR
	.word	0xf65c2018
	ACCESS_DTSB_PTR
	.word	0xfe5c2ec0
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x650, %i7
	READ_DDATA_ACCESS
thr7_MMU_ASI_SECONDARY_393:
	.word	0x87802081
	.word	0xd4b96170
	.word	0xc6712050
	.word	0xc02429d0
	.word	0x1000000
	or	%g0, 0x448, %i7
	DTLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe134000
	DDEMAP_RPAGE
	.word	0xc02e6d80
	DDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	TOGGLE_LSU_DM
	.word	0xf0756030
	.word	0xc072a708
	.word	0xca766010
	.word	0xc0356380
	.word	0x1000000
	.word	0xbe154000
	IDEMAP_RPAGE
	.word	0xfe5c2148
	.word	0xfcdc1000
	DDEMAP_ALL
	.word	0xe47420c0
	.word	0xc02661d8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
thr7_MMU_ASI_SECONDARY_394:
	.word	0x87802081
	.word	0xc0bda9d0
thr7_MMU_ASI_BLK_COMMIT_P_395:
	.word	0x878020e0
	.word	0xc3bc2c00
	ACCESS_ITSB_PTR
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x06c, %i7
	LOAD_DDATA_IN
	nop
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xcc5aa018
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v006_exit:
	EXIT_GOOD
Thr7_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v104 DATA_VA=0x7b30001b4000
attr_data {
	Name = .Thr7_User_Data_4v104 ,
	VA = 0x7b30001b4000 ,/* 0x7b30001b5fc0 */
	RA = 0x01501c8000 ,
	PA = 0x01501c8000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b30001b46dc 80000001501c8440 */
	end_label   = Thr7_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v104_data_begin
Thr7_User_Data_4v104_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v204 DATA_VA=0x7b30001f4000
attr_data {
	Name = .Thr7_User_Data_4v204 ,
	VA = 0x7b30001f4000 ,/* 0x7b30001f5fc0 */
	RA = 0x015013a000 ,
	PA = 0x015013a000 ,
	TTE_Context = 0x02a6 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007b30001f5df3 800000015013a440 */
	end_label   = Thr7_User_Data_4v204_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v204_data_begin
Thr7_User_Data_4v204_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v204_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v304 DATA_VA=0x7b3000046000
attr_data {
	Name = .Thr7_User_Data_4v304 ,
	VA = 0x7b3000046000 ,/* 0x7b3000047fc0 */
	RA = 0x0150032000 ,
	PA = 0x7d50032000 ,
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
	/* DTTE_TAG_DATA = 00007b3000046000 8000007d50032040 */
	end_label   = Thr7_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v304_data_begin
Thr7_User_Data_4v304_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v007 TEXT_VA=0x7b300009c000
attr_text {
	Name = .Thr7_User_Text_4v007 ,
	VA = 0x7b300009c000 ,/* 0x7b300009dfc0 */
	RA = 0x0150166000 ,
	PA = 0x0150166000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b300009c6dc 8000000150166480 */
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
	or	%g0, 0x066, %i7
	LOAD_DDATA_IN
	DDEMAP_ALL_RPAGES
	.word	0xfe5c2be0
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	ITLB_TAG_READ
	DDEMAP_ALL_PAGES
	.word	0xfe412388
	TOGGLE_LSU_IM
	IDEMAP_ALL_RPAGES
	.word	0xc45c20e0
	.word	0x1000000
	.word	0xbe158000
	IDEMAP_PAGE
	.word	0x1000000
	.word	0xbe118000
	IDEMAP_RPAGE
	.word	0xe05aa038
	.word	0xfcdd5000
	.word	0xe4776048
	.word	0xc0256a64
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
	.word	0xca5e60b8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v007_exit:
	EXIT_GOOD
Thr7_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v105 DATA_VA=0x7c0000060000
attr_data {
	Name = .Thr7_User_Data_4v105 ,
	VA = 0x7c0000060000 ,/* 0x7c000006ffc0 */
	RA = 0x01c09d0000 ,
	PA = 0x7dc09d0000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00000606dc 8000007dc09d0441 */
	end_label   = Thr7_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v105_data_begin
Thr7_User_Data_4v105_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v008 TEXT_VA=0x7b3000192000
attr_text {
	Name = .Thr7_User_Text_4v008 ,
	VA = 0x7b3000192000 ,/* 0x7b3000193fc0 */
	RA = 0x0150116000 ,
	PA = 0x0150116000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b30001926dc 8000000150116480 */
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
	.word	0xfe466998
	.word	0xf4766010
	.word	0xc0776178
	.word	0xfe5c25d8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_BLK_SL_396:
	.word	0x878020f9
	.word	0xc3baeb40
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	.word	0xe3995e20
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x037, %i7
	LOAD_DDATA_IN
thr7_MMU_ASI_BLK_COMMIT_S_397:
	.word	0x878020e1
	.word	0xe1bae580
	.word	0x1000000
	or	%g0, 0x096, %i7
	LOAD_DDATA_IN
	.word	0xfcdd5000
	.word	0xee756018
	.word	0xc072a1e0
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	DTLB_TAG_READ
	.word	0xfa592090
	nop
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	.word	0xc02d6607
	.word	0xd45d60b0
	.word	0xbe82a168
	.word	0xfadfd000
	.word	0xbe8420e0
	.word	0xeadfd000
	.word	0xd45f6038
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x036, %i7
	LOAD_DDATA_IN
	DDEMAP_NCTX
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	.word	0xc02aa767
	.word	0xfe45635c
	.word	0xfe5e60c8
	.word	0x1000000
	or	%g0, 0x410, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_PCTX
	.word	0xc02768c0
thr7_MMU_ASI_SECONDARY_LITTLE_398:
	.word	0x87802089
	.word	0xd6f46010
	.word	0xbe82a008
	.word	0xfadfd000
	IDEMAP_NCTX
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe120000
	DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf872a118
	.word	0xc022ab88
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v008_exit:
	EXIT_GOOD
Thr7_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v106 DATA_VA=0x7e0c20000000
attr_data {
	Name = .Thr7_User_Data_4v106 ,
	VA = 0x7e0c20000000 ,/* 0x7e0c2fffffc0 */
	RA = 0x02f0000000 ,
	PA = 0x7ef0000000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007e0c2000026e 8000007ef0000445 */
	end_label   = Thr7_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v106_data_begin
Thr7_User_Data_4v106_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v009 TEXT_VA=0x7c00009a0000
attr_text {
	Name = .Thr7_User_Text_4v009 ,
	VA = 0x7c00009a0000 ,/* 0x7c00009affc0 */
	RA = 0x01c01a0000 ,
	PA = 0x7dc01a0000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c00009a06dc 8000007dc01a0481 */
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
	or	%g0, 0x1bc, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0xfcdad020
	DDEMAP_ALL_RPAGES
	.word	0xe2742010
	.word	0xc034223e
	nop
	nop
	nop
	.word	0xfe5c28a0
	.word	0xc072af40
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xce766050
	.word	0xc02c29a6
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe4e6623
thr7_MMU_ASI_PRIMARY_LITTLE_399:
	.word	0x87802088
	.word	0xf2f560b0
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_RPAGES
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd85aa018
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v009_exit:
	EXIT_GOOD
Thr7_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v107 DATA_VA=0x7b300003c000
attr_data {
	Name = .Thr7_User_Data_4v107 ,
	VA = 0x7b300003c000 ,/* 0x7b300003dfc0 */
	RA = 0x015009e000 ,
	PA = 0x015009e000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b300003c6dc 800000015009e440 */
	end_label   = Thr7_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v107_data_begin
Thr7_User_Data_4v107_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00a TEXT_VA=0x7b30001ea000
attr_text {
	Name = .Thr7_User_Text_4v00a ,
	VA = 0x7b30001ea000 ,/* 0x7b30001ebfc0 */
	RA = 0x0150092000 ,
	PA = 0x0150092000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b30001ea6dc 8000000150092480 */
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
	.word	0xfe466cac
	nop
	TOGGLE_LSU_DM
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe118000
	IDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1e5, %i7
	LOAD_IDATA_ACCESS
	.word	0xca766010
	.word	0xc02aabd4
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe110000
	IDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x48, %i7
	ITLB_TAG_READ
	.word	0xc85e6038
	.word	0xf25f6090
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4c2919
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x067, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x120, %i7
	DTLB_TAG_READ
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x3f0, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_IM
thr7_MMU_ASI_PRIMARY_400:
	.word	0x87802080
	.word	0xecf42010
	.word	0x1000000
	.word	0xbe14c000
	IDEMAP_RPAGE
	nop
	nop
	nop
	.word	0xea72a068
	.word	0xc022a170
	.word	0x1000000
	or	%g0, 0xcc, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0376914
thr7_MMU_ASI_BLK_PL_401:
	.word	0x878020f8
	.word	0xc3b92f40
	.word	0xc45c2120
	.word	0xcc5aa018
	.word	0x1000000
	or	%g0, 0x012, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x04f, %i7
	LOAD_IDATA_IN
thr7_MMU_ASI_PRIMARY_402:
	.word	0x87802080
	.word	0xcef560c8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x380, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd85f6018
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00a_exit:
	EXIT_GOOD
Thr7_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v108 DATA_VA=0x7b300012c000
attr_data {
	Name = .Thr7_User_Data_4v108 ,
	VA = 0x7b300012c000 ,/* 0x7b300012dfc0 */
	RA = 0x0150108000 ,
	PA = 0x0150108000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b300012c6dc 8000000150108440 */
	end_label   = Thr7_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v108_data_begin
Thr7_User_Data_4v108_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00b TEXT_VA=0x7c00003e0000
attr_text {
	Name = .Thr7_User_Text_4v00b ,
	VA = 0x7c00003e0000 ,/* 0x7c00003effc0 */
	RA = 0x01c0c70000 ,
	PA = 0x7dc0c70000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c00003e06dc 8000007dc0c70481 */
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
	.word	0x1000000
	or	%g0, 0x20, %i7
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
	.word	0xfe5aa038
	.word	0xe05aa008
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0xc0212d34
thr7_MMU_ASI_PRIMARY_403:
	.word	0x87802080
	.word	0xe2f76010
	.word	0x1000000
	or	%g0, 0x3e0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr7_MMU_ASI_PRIMARY_404:
	.word	0x87802080
	.word	0xf6f76018
	.word	0x1000000
	or	%g0, 0x028, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x450, %i7
	READ_DDATA_ACCESS
	DDEMAP_SCTX
	ACCESS_DTSB_PTR
	nop
	.word	0x1000000
	or	%g0, 0x053, %i7
	LOAD_DDATA_IN
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xc02d67ed
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00b_exit:
	EXIT_GOOD
Thr7_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v109 DATA_VA=0x7b3000134000
attr_data {
	Name = .Thr7_User_Data_4v109 ,
	VA = 0x7b3000134000 ,/* 0x7b3000135fc0 */
	RA = 0x0150000000 ,
	PA = 0x0150000000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b30001346dc 8000000150000440 */
	end_label   = Thr7_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v109_data_begin
Thr7_User_Data_4v109_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00c TEXT_VA=0x7b3000006000
attr_text {
	Name = .Thr7_User_Text_4v00c ,
	VA = 0x7b3000006000 ,/* 0x7b3000007fc0 */
	RA = 0x01501a2000 ,
	PA = 0x01501a2000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b30000066dc 80000001501a2480 */
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
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_PRIMARY_405:
	.word	0x87802080
	.word	0xfaf56038
	.word	0x1000000
	or	%g0, 0x434, %i7
	LOAD_IDATA_ACCESS
	.word	0xc19a9e00
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x2c0, %i7
	DTLB_TAG_READ
thr7_MMU_ASI_PRIMARY_406:
	.word	0x87802080
	.word	0xe0f76038
	.word	0xc0292b6e
	.word	0xc0742370
	.word	0x1000000
	.word	0xbe140000
	IDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	nop
	nop
	nop
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xca7420b8
	.word	0xc02f6c4f
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00c_exit:
	EXIT_GOOD
Thr7_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10a DATA_VA=0x7b3000074000
attr_data {
	Name = .Thr7_User_Data_4v10a ,
	VA = 0x7b3000074000 ,/* 0x7b3000075fc0 */
	RA = 0x01501a4000 ,
	PA = 0x01501a4000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b30000746dc 80000001501a4440 */
	end_label   = Thr7_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10a_data_begin
Thr7_User_Data_4v10a_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00d TEXT_VA=0x7c0000150000
attr_text {
	Name = .Thr7_User_Text_4v00d ,
	VA = 0x7c0000150000 ,/* 0x7c000015ffc0 */
	RA = 0x01c0e60000 ,
	PA = 0x7dc0e60000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c00001506dc 8000007dc0e60481 */
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
	.word	0xbe856110
	.word	0xc8dfd000
thr7_MMU_ASI_PRIMARY_407:
	.word	0x87802080
	.word	0xf0f2a138
	.word	0x1000000
	or	%g0, 0x034, %i7
	LOAD_DDATA_IN
	.word	0xfe542b8c
	.word	0xfe5aaa28
	ACCESS_DTSB_PTR
thr7_MMU_ASI_BLK_COMMIT_P_408:
	.word	0x878020e0
	.word	0xe1b92140
	.word	0x1000000
	or	%g0, 0x06a, %i7
	LOAD_IDATA_IN
	.word	0xf672a018
	.word	0xc02c27e3
	.word	0xe25e6010
thr7_MMU_ASI_BLK_PL_409:
	.word	0x878020f8
	.word	0xc3b92f80
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a168
	.word	0xf2dfd000
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_RPAGE
	.word	0xfe4c2404
	.word	0xfe576a8a
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0xc02f64fc
	IDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5661fe
	.word	0xbe876038
	.word	0xeadfd040
	ACCESS_ITSB_PTR
	.word	0xc0342c62
	.word	0xc02c27cc
	.word	0x1000000
	or	%g0, 0x1bd, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_SCTX
	DDEMAP_ALL_PAGES
	.word	0xbe842038
	.word	0xeadfd000
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0742d98
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00d_exit:
	EXIT_GOOD
Thr7_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10b DATA_VA=0x7b300013c000
attr_data {
	Name = .Thr7_User_Data_4v10b ,
	VA = 0x7b300013c000 ,/* 0x7b300013dfc0 */
	RA = 0x0150168000 ,
	PA = 0x0150168000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b300013c6dc 8000000150168440 */
	end_label   = Thr7_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10b_data_begin
Thr7_User_Data_4v10b_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00e TEXT_VA=0x7c0000210000
attr_text {
	Name = .Thr7_User_Text_4v00e ,
	VA = 0x7c0000210000 ,/* 0x7c000021ffc0 */
	RA = 0x01c00d0000 ,
	PA = 0x7dc00d0000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c00002106dc 8000007dc00d0481 */
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
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0742170
	TOGGLE_LSU_DM
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x1d8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x510, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_PAGES
	.word	0xc072aa80
	.word	0xbe86a010
	.word	0xc39fde20
thr7_MMU_ASI_PRIMARY_410:
	.word	0x87802080
	.word	0xd6f42070
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x6e8, %i7
	DTLB_TAG_READ
	nop
	nop
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_PCTX
	.word	0xc032af12
	.word	0xec766010
	.word	0xc020a788
	.word	0x1000000
	or	%g0, 0x3c1, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe5122ce
	.word	0xd65f6098
	.word	0x1000000
	or	%g0, 0x7aa, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcdf5000
	.word	0xd8766018
	.word	0xc0756518
	.word	0xfe476d60
	.word	0x1000000
	.word	0xbe154000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x720, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4c9, %i7
	LOAD_DDATA_ACCESS
	nop
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe05d6090
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00e_exit:
	EXIT_GOOD
Thr7_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10c DATA_VA=0x7b3000104000
attr_data {
	Name = .Thr7_User_Data_4v10c ,
	VA = 0x7b3000104000 ,/* 0x7b3000105fc0 */
	RA = 0x0150060000 ,
	PA = 0x0150060000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b30001046dc 8000000150060440 */
	end_label   = Thr7_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10c_data_begin
Thr7_User_Data_4v10c_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00f TEXT_VA=0x7b30000aa000
attr_text {
	Name = .Thr7_User_Text_4v00f ,
	VA = 0x7b30000aa000 ,/* 0x7b30000abfc0 */
	RA = 0x0150050000 ,
	PA = 0x0150050000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b30000aa6dc 8000000150050480 */
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
	.word	0xbe866030
	.word	0xe39fde00
	.word	0x1000000
	or	%g0, 0x138, %i7
	ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe54224c
	.word	0xea5c2150
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe140000
	IDEMAP_RPAGE
	DDEMAP_SCTX
	.word	0xbe812110
	.word	0xfadfd000
	.word	0xfe5562de
	.word	0xd47420e0
	.word	0xc032a7ea
	.word	0x1000000
	or	%g0, 0x498, %i7
	READ_DDATA_ACCESS
	.word	0xc026671c
	.word	0x1000000
	or	%g0, 0x531, %i7
	LOAD_IDATA_ACCESS
	nop
	.word	0xfcda9000
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xbe842068
	.word	0xfadfd000
	.word	0xe25c2010
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x01b, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc45c2160
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	ITLB_TAG_READ
thr7_MMU_ASI_BLK_PL_411:
	.word	0x878020f8
	.word	0xe1bc23c0
	.word	0xfe412da8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc991d40
	.word	0xf0742138
	.word	0xc07128a8
	ACCESS_ITSB_PTR
	.word	0xc07124a0
	.word	0x1000000
	.word	0xbe15c000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x688, %i7
	READ_DDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x408, %i7
	ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe82e010
	.word	0xecdfd020
	.word	0xc45920d0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe856068
	.word	0xf2dfd000
	nop
	.word	0x1000000
	or	%g0, 0xd0, %i7
	READ_IDATA_ACCESS
	DDEMAP_NCTX
	DDEMAP_SCTX
	DDEMAP_ALL
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd272a030
	.word	0xc072a2d8
	.word	0x1000000
	or	%g0, 0x280, %i7
	READ_DDATA_ACCESS
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
	.word	0xc85c2090
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v00f_exit:
	EXIT_GOOD
Thr7_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10d DATA_VA=0x7c0000490000
attr_data {
	Name = .Thr7_User_Data_4v10d ,
	VA = 0x7c0000490000 ,/* 0x7c000049ffc0 */
	RA = 0x01c0d40000 ,
	PA = 0x7dc0d40000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00004906dc 8000007dc0d40441 */
	end_label   = Thr7_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10d_data_begin
Thr7_User_Data_4v10d_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v010 TEXT_VA=0x7b30001b6000
attr_text {
	Name = .Thr7_User_Text_4v010 ,
	VA = 0x7b30001b6000 ,/* 0x7b30001b7fc0 */
	RA = 0x0150132000 ,
	PA = 0x0150132000 ,
	TTE_Context = 0x026e ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007b30001b66dc 8000000150132480 */
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
	.word	0xfe52ab66
	.word	0xce7560d8
	.word	0xc02e68d0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	.word	0xfe57683c
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x698, %i7
	READ_DDATA_ACCESS
	.word	0xbe82a090
	.word	0xe0dfd000
	.word	0xfe4c2395
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45c2068
	.word	0xea5920d0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8760f0
	.word	0xeadfd000
	.word	0x1000000
	or	%g0, 0x5d1, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1cc, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	.word	0x1000000
	or	%g0, 0x2b8, %i7
	READ_DDATA_ACCESS
	.word	0xfcda9000
	ACCESS_ITSB_PTR
	.word	0xd45c20e0
thr7_MMU_ASI_PRIMARY_412:
	.word	0x87802080
	.word	0xd8b92170
	TOGGLE_LSU_DM
thr7_MMU_ASI_PRIMARY_413:
	.word	0x87802080
	.word	0xeaf0a110
	.word	0x1000000
	or	%g0, 0x25d, %i7
	LOAD_DDATA_ACCESS
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
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf25aa068
	.word	0xcc5aa018
	IDEMAP_ALL
	IDEMAP_ALL
	DDEMAP_SCTX
	.word	0x1000000
	.word	0xbe11c000
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
	nop
	nop
	nop
	.word	0xfcda9000
	.word	0xc4766068
	.word	0xc030a276
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe456f20
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v010_exit:
	EXIT_GOOD
Thr7_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10e DATA_VA=0x7b3000076000
attr_data {
	Name = .Thr7_User_Data_4v10e ,
	VA = 0x7b3000076000 ,/* 0x7b3000077fc0 */
	RA = 0x015000c000 ,
	PA = 0x015000c000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b30000766dc 800000015000c440 */
	end_label   = Thr7_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10e_data_begin
Thr7_User_Data_4v10e_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10f DATA_VA=0x7b300014a000
attr_data {
	Name = .Thr7_User_Data_4v10f ,
	VA = 0x7b300014a000 ,/* 0x7b300014bfc0 */
	RA = 0x0150120000 ,
	PA = 0x0150120000 ,
	TTE_Context = 0x026e ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007b300014a6dc 8000000150120440 */
	end_label   = Thr7_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10f_data_begin
Thr7_User_Data_4v10f_data_begin:
	.xword	0x7c0000120000
	.xword	0x7b3000022000
	.xword	0x7e02b0000000
	.xword	0x7b300015c000
	.xword	0x7c0000090000
	.xword	0x7e0770000000
	.xword	0x7b3000156000
	.xword	0x7b3000198000
	.xword	0x7c0000a90000
	.xword	0x7b3000084000
	.xword	0x7b300003a000
	.xword	0x7c0000010000
	.xword	0x7c0000c60000
	.xword	0x7b30001d4000
	.xword	0x7b3000144000
	.xword	0x7e0a80000000
	.xword	0x7b30000fc000
	.xword	0x7c0000bc0000
	.xword	0x7c0000d40000
	.xword	0x7c00003d0000
	.xword	0x7e0e80000000
	.xword	0x7b3000128000
	.xword	0x7b30001b4000
	.xword	0x7b30001f4000
	.xword	0x7b3000046000
	.xword	0x7b300009c000
	.xword	0x7c0000060000
	.xword	0x7b3000192000
	.xword	0x7e0c20000000
	.xword	0x7c00009a0000
	.xword	0x7b300003c000
	.xword	0x7b30001ea000
	.xword	0x7b300012c000
	.xword	0x7c00003e0000
	.xword	0x7b3000134000
	.xword	0x7b3000006000
	.xword	0x7b3000074000
	.xword	0x7c0000150000
	.xword	0x7b300013c000
	.xword	0x7c0000210000
	.xword	0x7b3000104000
	.xword	0x7b30000aa000
	.xword	0x7c0000490000
	.xword	0x7b30001b6000
	.xword	0x7b3000076000
	.xword	0x7b300014a000
Thr7_User_Data_4v10f_data_end:

