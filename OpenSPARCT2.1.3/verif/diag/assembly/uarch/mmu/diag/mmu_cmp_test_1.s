/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_cmp_test_1.s
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
#define THR0_PCONTEXT_0 0x1492
#define THR0_PCONTEXT_1 0x119d
#define THR0_SCONTEXT_0 0x1759
#define THR0_SCONTEXT_1 0x1dd2
#define THR1_PCONTEXT_0 0x1cb5
#define THR1_PCONTEXT_1 0x0f8a
#define THR1_SCONTEXT_0 0x09b2
#define THR1_SCONTEXT_1 0x095a
#define THR2_PCONTEXT_0 0x09a9
#define THR2_PCONTEXT_1 0x0693
#define THR2_SCONTEXT_0 0x04a8
#define THR2_SCONTEXT_1 0x0a08
#define THR3_PCONTEXT_0 0x1006
#define THR3_PCONTEXT_1 0x057b
#define THR3_SCONTEXT_0 0x1d56
#define THR3_SCONTEXT_1 0x131a
#define THR4_PCONTEXT_0 0x1b80
#define THR4_PCONTEXT_1 0x0416
#define THR4_SCONTEXT_0 0x0dcb
#define THR4_SCONTEXT_1 0x08e0
#define THR5_PCONTEXT_0 0x186b
#define THR5_PCONTEXT_1 0x1243
#define THR5_SCONTEXT_0 0x0081
#define THR5_SCONTEXT_1 0x10d7
#define THR6_PCONTEXT_0 0x0713
#define THR6_PCONTEXT_1 0x0d7c
#define THR6_SCONTEXT_0 0x15b6
#define THR6_SCONTEXT_1 0x0690
#define THR7_PCONTEXT_0 0x0021
#define THR7_PCONTEXT_1 0x01df
#define THR7_SCONTEXT_0 0x16f8
#define THR7_SCONTEXT_1 0x1c59
#define THR0_PTRAP_TEXT_VA 0x6000005b0000
#define THR0_PTRAP_TEXT_RA 0x00c04c0000
#define THR0_PTRAP_TEXT_PA 0x0cc04c0000
#define THR1_PTRAP_TEXT_VA 0x6400005c0000
#define THR1_PTRAP_TEXT_RA 0x00d03b0000
#define THR1_PTRAP_TEXT_PA 0x00d03b0000
#define THR2_PTRAP_TEXT_VA 0x680000890000
#define THR2_PTRAP_TEXT_RA 0x00e00e0000
#define THR2_PTRAP_TEXT_PA 0x00e00e0000
#define THR3_PTRAP_TEXT_VA 0x6c00007a0000
#define THR3_PTRAP_TEXT_RA 0x00f0d70000
#define THR3_PTRAP_TEXT_PA 0x3cf0d70000
#define THR4_PTRAP_TEXT_VA 0x700000050000
#define THR4_PTRAP_TEXT_RA 0x0100000000
#define THR4_PTRAP_TEXT_PA 0x4d00000000
#define THR5_PTRAP_TEXT_VA 0x740000630000
#define THR5_PTRAP_TEXT_RA 0x0110900000
#define THR5_PTRAP_TEXT_PA 0x5d10900000
#define THR6_PTRAP_TEXT_VA 0x780000350000
#define THR6_PTRAP_TEXT_RA 0x01202c0000
#define THR6_PTRAP_TEXT_PA 0x01202c0000
#define THR7_PTRAP_TEXT_VA 0x7c00004a0000
#define THR7_PTRAP_TEXT_RA 0x0130ce0000
#define THR7_PTRAP_TEXT_PA 0x0130ce0000
#include "mmu_hred.s"
/*********************************************************************/
SECTION .Thr0_Priv_Sect TEXT_VA=0x5f50001b6000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_1
	VA = 0x5f50001b6000 ,
	RA = 0x03901f2000 ,
	PA = 0x0f901f2000 ,
	TTE_Context = 0x1492 ,
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
SECTION .Thr1_Priv_Sect TEXT_VA=0x63600000e000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_1
	VA = 0x63600000e000 ,
	RA = 0x03a00e0000 ,
	PA = 0x03a00e0000 ,
	TTE_Context = 0x1cb5 ,
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
SECTION .Thr2_Priv_Sect TEXT_VA=0x677000012000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_3
	VA = 0x677000012000 ,
	RA = 0x03b0150000 ,
	PA = 0x03b0150000 ,
	TTE_Context = 0x09a9 ,
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
SECTION .Thr3_Priv_Sect TEXT_VA=0x6b8000086000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_0
	VA = 0x6b8000086000 ,
	RA = 0x03c00f0000 ,
	PA = 0x03c00f0000 ,
	TTE_Context = 0x1006 ,
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
SECTION .Thr4_Priv_Sect TEXT_VA=0x6f90001c8000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_2
	VA = 0x6f90001c8000 ,
	RA = 0x03d014a000 ,
	PA = 0x03d014a000 ,
	TTE_Context = 0x1b80 ,
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
SECTION .Thr5_Priv_Sect TEXT_VA=0x73a0001c0000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_3
	VA = 0x73a0001c0000 ,
	RA = 0x03e0126000 ,
	PA = 0x03e0126000 ,
	TTE_Context = 0x186b ,
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
SECTION .Thr6_Priv_Sect TEXT_VA=0x77b00015a000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_1
	VA = 0x77b00015a000 ,
	RA = 0x03f0054000 ,
	PA = 0x6ff0054000 ,
	TTE_Context = 0x0713 ,
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
SECTION .Thr7_Priv_Sect TEXT_VA=0x7bc000024000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x7bc000024000 ,
	RA = 0x001014c000 ,
	PA = 0x001014c000 ,
	TTE_Context = 0x0021 ,
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
	TTE_P       =           0 ,
	TTE_EP      = 1 ,
	TTE_W       =           1 ,
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
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
Thr1_register_initial_values:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
Thr2_register_initial_values:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
Thr3_register_initial_values:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
Thr4_register_initial_values:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
Thr5_register_initial_values:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
Thr6_register_initial_values:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
Thr7_register_initial_values:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
.align 32
hptrap_itte_begin:
	.xword	0x0000600000241492	!0
	.xword	0x8000000cc0760081	
	.xword	0x00005f500010d19d	!1
	.xword	0x8000000f900d4080	
	.xword	0x00005f5000170000	!2
	.xword	0x800000039012c480	
	.xword	0x0000600000331492	!3
	.xword	0x8000000cc0310081	
	.xword	0x0000610012401492	!4
	.xword	0x8000000863000083	
	.xword	0x00005f500018c000	!5
	.xword	0x80000003900ea480	
	.xword	0x000061001c001492	!6
	.xword	0x8000000866400083	
	.xword	0x00005f50000ef19d	!7
	.xword	0x8000000f901ac080	
	.xword	0x00005f500011919d	!8
	.xword	0x8000000f9009c080	
	.xword	0x000061003fc01492	!9
	.xword	0x8000000869400083	
	.xword	0x00005f500012f19d	!10
	.xword	0x8000000f9002c080	
	.xword	0x0000600000881492	!11
	.xword	0x8000000cc07c0081	
	.xword	0x00005f500001f19d	!12
	.xword	0x8000000f9017c080	
	.xword	0x00006000003d1492	!13
	.xword	0x8000000cc05a0081	
	.xword	0x0000600000da1492	!14
	.xword	0x8000000cc0a10081	
	.xword	0x0000600000b91492	!15
	.xword	0x8000000cc0d40081	
	.xword	0x0000620400001492	!16
	.xword	0x8000000320000085	
	.xword	0x0000600000131492	!17
	.xword	0x8000000cc0f20081	
	.xword	0x00005f500006f19d	!18
	.xword	0x8000000f901f8080	
	.xword	0x0000600000c81492	!19
	.xword	0x8000000cc0c70081	
	.xword	0x0000620b40001492	!20
	.xword	0x8000000160000085	
	.xword	0x00006400006f1cb5	!21
	.xword	0x8000001cd0770081	
	.xword	0x00006400005d1cb5	!22
	.xword	0x8000001cd00d0081	
	.xword	0x00006360000b6000	!23
	.xword	0x80000003a0008480	
	.xword	0x0000636000005cb5	!24
	.xword	0x80000003a015c080	
	.xword	0x0000640000991cb5	!25
	.xword	0x8000001cd07d0081	
	.xword	0x0000636000160000	!26
	.xword	0x80000003a0078480	
	.xword	0x0000640000431cb5	!27
	.xword	0x8000001cd0860081	
	.xword	0x00006400008b1cb5	!28
	.xword	0x8000001cd0600081	
	.xword	0x0000636000148000	!29
	.xword	0x80000003a0006480	
	.xword	0x000063600008dcb5	!30
	.xword	0x80000003a01fa080	
	.xword	0x00006360001e1cb5	!31
	.xword	0x80000003a01f6080	
	.xword	0x000063600008bcb5	!32
	.xword	0x80000003a0128080	
	.xword	0x0000660fa0001cb5	!33
	.xword	0x8000001f30000085	
	.xword	0x00006360000bdcb5	!34
	.xword	0x80000003a003c080	
	.xword	0x0000636000105cb5	!35
	.xword	0x80000003a00ee080	
	.xword	0x0000640000581cb5	!36
	.xword	0x8000001cd0e50081	
	.xword	0x00006400001d1cb5	!37
	.xword	0x8000001cd0cc0081	
	.xword	0x0000636000115cb5	!38
	.xword	0x80000003a014e080	
	.xword	0x000063600014bcb5	!39
	.xword	0x80000003a01d8080	
	.xword	0x00006900250009a9	!40
	.xword	0x8000002c81c00483	
	.xword	0x00006800004c09a9	!41
	.xword	0x80000000e0c60481	
	.xword	0x0000677000184000	!42
	.xword	0x80000003b0016080	
	.xword	0x00006770001c29a9	!43
	.xword	0x80000003b0144480	
	.xword	0x00006770000349a9	!44
	.xword	0x80000003b0112480	
	.xword	0x000069002c800000	!45
	.xword	0x8000000081000083	
	.xword	0x00006800001109a9	!46
	.xword	0x80000000e0bc0481	
	.xword	0x00006770001a89a9	!47
	.xword	0x80000003b01f4480	
	.xword	0x0000690011400000	!48
	.xword	0x8000000087000083	
	.xword	0x000069002b4009a9	!49
	.xword	0x8000002c82800483	
	.xword	0x00006a0170000000	!50
	.xword	0x8000002f40000085	
	.xword	0x00006a01b00009a9	!51
	.xword	0x8000002840000485	
	.xword	0x00006800007909a9	!52
	.xword	0x80000000e0e30481	
	.xword	0x00006770000c29a9	!53
	.xword	0x80000003b00d8480	
	.xword	0x00006800003709a9	!54
	.xword	0x80000000e03a0481	
	.xword	0x00006800004d09a9	!55
	.xword	0x80000000e0960481	
	.xword	0x0000680000eb09a9	!56
	.xword	0x80000000e0170481	
	.xword	0x000067700010a9a9	!57
	.xword	0x80000003b0124480	
	.xword	0x0000680000a309a9	!58
	.xword	0x80000000e0580481	
	.xword	0x00006c0000c51006	!59
	.xword	0x8000003cf0080481	
	.xword	0x00006e08f0001006	!60
	.xword	0x8000000350000485	
	.xword	0x00006d0020c00000	!61
	.xword	0x8000000092000083	
	.xword	0x00006b8000093006	!62
	.xword	0x80000003c002e480	
	.xword	0x00006b80000d5006	!63
	.xword	0x80000003c013a480	
	.xword	0x00006b8000186000	!64
	.xword	0x80000003c0194080	
	.xword	0x00006d0031001006	!65
	.xword	0x8000000097400483	
	.xword	0x00006c00000c1006	!66
	.xword	0x8000003cf00f0481	
	.xword	0x00006c0000ec0000	!67
	.xword	0x8000003cf01a0081	
	.xword	0x00006b80000fb006	!68
	.xword	0x80000003c00ec480	
	.xword	0x00006c0000de1006	!69
	.xword	0x8000003cf0e60481	
	.xword	0x00006c0000930000	!70
	.xword	0x8000003cf0240081	
	.xword	0x00006d000f401006	!71
	.xword	0x8000000094400483	
	.xword	0x00006b80000cb006	!72
	.xword	0x80000003c01c6480	
	.xword	0x00006d0024001006	!73
	.xword	0x8000000098400483	
	.xword	0x00006b800001b006	!74
	.xword	0x80000003c01e6480	
	.xword	0x00006c0000721006	!75
	.xword	0x8000003cf0560481	
	.xword	0x00006d0007801006	!76
	.xword	0x8000000092c00483	
	.xword	0x00006d0012001006	!77
	.xword	0x8000000090400483	
	.xword	0x00006b8000169006	!78
	.xword	0x80000003c01d4480	
	.xword	0x00006d000cc01006	!79
	.xword	0x800000009f000483	
	.xword	0x00006b8000039006	!80
	.xword	0x80000003c006c480	
	.xword	0x00006b80000d9006	!81
	.xword	0x80000003c0000480	
	.xword	0x0000710007c01b80	!82
	.xword	0x8000004cadc00083	
	.xword	0x00007000009e1b80	!83
	.xword	0x8000004d00690081	
	.xword	0x0000710021000000	!84
	.xword	0x8000004ca4800083	
	.xword	0x0000720530001b80	!85
	.xword	0x8000004f60000085	
	.xword	0x000071003d801b80	!86
	.xword	0x8000004ca6000083	
	.xword	0x00006f9000166000	!87
	.xword	0x80000003d01a0080	
	.xword	0x0000700000c61b80	!88
	.xword	0x8000004d00ec0081	
	.xword	0x00006f90000de416	!89
	.xword	0x80000003d0192080	
	.xword	0x00006f90000ce000	!90
	.xword	0x80000003d001e080	
	.xword	0x0000700000821b80	!91
	.xword	0x8000004d006f0081	
	.xword	0x0000700000d31b80	!92
	.xword	0x8000004d00ff0081	
	.xword	0x00006f900009e416	!93
	.xword	0x80000003d00de080	
	.xword	0x00006f90001b8416	!94
	.xword	0x80000003d0094080	
	.xword	0x0000710011c01b80	!95
	.xword	0x8000004ca4c00083	
	.xword	0x00006f90000e0416	!96
	.xword	0x80000003d01c8080	
	.xword	0x00006f90000fc416	!97
	.xword	0x80000003d005e080	
	.xword	0x00006f900018a416	!98
	.xword	0x80000003d0118080	
	.xword	0x0000710012c01b80	!99
	.xword	0x8000004cad400083	
	.xword	0x00007000004e1b80	!100
	.xword	0x8000004d00750081	
	.xword	0x000073a00005786b	!101
	.xword	0x80000003e000e080	
	.xword	0x000073a00018986b	!102
	.xword	0x80000003e0162080	
	.xword	0x00007400005e0000	!103
	.xword	0x8000005d10910081	
	.xword	0x000075001280186b	!104
	.xword	0x80000000b8800083	
	.xword	0x00007604b000186b	!105
	.xword	0x8000000370000085	
	.xword	0x000073a0001e6000	!106
	.xword	0x8000005fe012e080	
	.xword	0x000073a00001586b	!107
	.xword	0x80000003e0122080	
	.xword	0x000073a0000d186b	!108
	.xword	0x80000003e0028080	
	.xword	0x0000740000410000	!109
	.xword	0x8000005d10990081	
	.xword	0x000073a00007b86b	!110
	.xword	0x80000003e010e080	
	.xword	0x00007400005f186b	!111
	.xword	0x8000000110d60081	
	.xword	0x00007400008d0000	!112
	.xword	0x8000005d105e0081	
	.xword	0x00007601c000186b	!113
	.xword	0x8000000220000085	
	.xword	0x000073a000050000	!114
	.xword	0x8000005fe0044080	
	.xword	0x000073a00018186b	!115
	.xword	0x80000003e0058080	
	.xword	0x000073a00011b86b	!116
	.xword	0x80000003e0130080	
	.xword	0x000073a00000d86b	!117
	.xword	0x80000003e0132080	
	.xword	0x000073a00006586b	!118
	.xword	0x80000003e003e080	
	.xword	0x000074000022186b	!119
	.xword	0x8000000110010081	
	.xword	0x000074000053186b	!120
	.xword	0x80000001108c0081	
	.xword	0x000073a00019986b	!121
	.xword	0x80000003e0062080	
	.xword	0x0000780000150713	!122
	.xword	0x8000006d20cd0481	
	.xword	0x000077b00014ed7c	!123
	.xword	0x8000006ff01a2480	
	.xword	0x000077b0000d6000	!124
	.xword	0x8000006ff00a6080	
	.xword	0x0000780000c90713	!125
	.xword	0x8000006d20810481	
	.xword	0x000077b00015cd7c	!126
	.xword	0x8000006ff00f2480	
	.xword	0x000077b000190000	!127
	.xword	0x8000006ff0136080	
	.xword	0x000077b000052d7c	!128
	.xword	0x8000006ff0082480	
	.xword	0x000077b0000dad7c	!129
	.xword	0x8000006ff01ca480	
	.xword	0x00007800009d0000	!130
	.xword	0x8000000120090081	
	.xword	0x000079002a800713	!131
	.xword	0x800000014e800483	
	.xword	0x000077b00015e000	!132
	.xword	0x8000006ff01c4080	
	.xword	0x0000790018c00713	!133
	.xword	0x8000000146c00483	
	.xword	0x000077b0000b4d7c	!134
	.xword	0x8000006ff006a480	
	.xword	0x00007800007b0713	!135
	.xword	0x8000006d205b0481	
	.xword	0x000077b000100d7c	!136
	.xword	0x8000006ff016c480	
	.xword	0x00007800007f0713	!137
	.xword	0x8000006d20870481	
	.xword	0x00007d00004001df	!138
	.xword	0x8000007d5bc00483	
	.xword	0x00007bc0001201df	!139
	.xword	0x8000000010174480	
	.xword	0x00007c0000290000	!140
	.xword	0x8000000130820481	
	.xword	0x00007bc00013a1df	!141
	.xword	0x8000000010098480	
	.xword	0x00007bc0001521df	!142
	.xword	0x800000001005c480	
	.xword	0x00007bc000150000	!143
	.xword	0x8000007010032480	
	.xword	0x00007d00160001df	!144
	.xword	0x8000007d5c000483	
	.xword	0x00007d00300001df	!145
	.xword	0x8000007d5b400483	
	.xword	0x00007bc0001dc000	!146
	.xword	0x800000701019e480	
	.xword	0x00007bc0001cc1df	!147
	.xword	0x80000000100f8480	
	.xword	0x00007bc0000be1df	!148
	.xword	0x8000000010014480	
	.xword	0x00007bc0001241df	!149
	.xword	0x80000000100e2480	
	.xword	0x00007bc0001a01df	!150
	.xword	0x8000000010156480	
	.xword	0x00007c0000a601df	!151
	.xword	0x8000007d30af0481	
	.xword	0x00007bc0000b81df	!152
	.xword	0x80000000100e4480	
	.xword	0x00007c0000e001df	!153
	.xword	0x8000007d30ea0481	
	.xword	0x00007bc0001d81df	!154
	.xword	0x8000000010052480	
	.xword	0x00007bc00012a1df	!155
	.xword	0x80000000101da480	
	.xword	0x00007bc0000c81df	!156
	.xword	0x800000001007a480	
	.xword	0x00007bc0001621df	!157
	.xword	0x8000000010164480	
hptrap_itte_end:
	.xword	158
.align 32
hptrap_dtte_begin:
	.xword	0x0000600000c01492	!0
	.xword	0x8000000cc00c0441	
	.xword	0x0000610004c01759	!1
	.xword	0x8000000860800043	
	.xword	0x0000600000080000	!2
	.xword	0x8000000cc0e10041	
	.xword	0x00005f50000dd19d	!3
	.xword	0x8000000f90048440	
	.xword	0x0000610022c01759	!4
	.xword	0x8000000863c00043	
	.xword	0x00005f5000094000	!5
	.xword	0x80000003900d2040	
	.xword	0x0000600000381492	!6
	.xword	0x8000000cc06c0441	
	.xword	0x00005f500011fdd2	!7
	.xword	0x8000000f90198040	
	.xword	0x000061002a401492	!8
	.xword	0x8000000861400443	
	.xword	0x00005f500006ddd2	!9
	.xword	0x8000000f90100040	
	.xword	0x0000600000e61492	!10
	.xword	0x8000000cc0bb0441	
	.xword	0x000061002dc01492	!11
	.xword	0x8000000869800443	
	.xword	0x0000600000401492	!12
	.xword	0x8000000cc0320441	
	.xword	0x00005f50000f119d	!13
	.xword	0x8000000f90036440	
	.xword	0x00005f500004f19d	!14
	.xword	0x8000000f901b6440	
	.xword	0x00005f500011319d	!15
	.xword	0x8000000f900b0440	
	.xword	0x00005f500018319d	!16
	.xword	0x8000000f901e2440	
	.xword	0x00005f500007d19d	!17
	.xword	0x8000000f901ce440	
	.xword	0x00005f500011719d	!18
	.xword	0x8000000f90076440	
	.xword	0x000061002fc01492	!19
	.xword	0x8000000861800443	
	.xword	0x0000600000091492	!20
	.xword	0x8000000cc02b0441	
	.xword	0x00005f500009119d	!21
	.xword	0x8000000f90004440	
	.xword	0x00005f500007f19d	!22
	.xword	0x8000000f90074440	
	.xword	0x0000610024c01492	!23
	.xword	0x8000000860c00443	
	.xword	0x00006000008a1492	!24
	.xword	0x8000000cc0f10441	
	.xword	0x0000636000021cb5	!25
	.xword	0x80000003a000c040	
	.xword	0x000063600009a9b2	!26
	.xword	0x80000003a0068440	
	.xword	0x000063600008e000	!27
	.xword	0x80000003a01a8440	
	.xword	0x00006360001b5cb5	!28
	.xword	0x80000003a0096040	
	.xword	0x00006360000989b2	!29
	.xword	0x80000003a008e440	
	.xword	0x00006400000b0000	!30
	.xword	0x80000000d0140441	
	.xword	0x0000636000055cb5	!31
	.xword	0x80000003a01e8040	
	.xword	0x00006360001229b2	!32
	.xword	0x80000003a009a440	
	.xword	0x0000636000042000	!33
	.xword	0x80000003a01b4440	
	.xword	0x000063600013fcb5	!34
	.xword	0x80000003a017a040	
	.xword	0x0000650023000000	!35
	.xword	0x8000001877800443	
	.xword	0x0000640000521cb5	!36
	.xword	0x8000001cd0970041	
	.xword	0x0000640000b31cb5	!37
	.xword	0x8000001cd0ad0041	
	.xword	0x0000650021800f8a	!38
	.xword	0x800000187e400043	
	.xword	0x00006360000c1cb5	!39
	.xword	0x80000003a0108040	
	.xword	0x000065001d400f8a	!40
	.xword	0x8000001870000043	
	.xword	0x0000660eb0001cb5	!41
	.xword	0x8000001d70000045	
	.xword	0x0000650010800f8a	!42
	.xword	0x8000001873400043	
	.xword	0x00006360001d7cb5	!43
	.xword	0x80000003a0140040	
	.xword	0x0000640000db1cb5	!44
	.xword	0x8000001cd0f30041	
	.xword	0x0000636000071cb5	!45
	.xword	0x80000003a01e0040	
	.xword	0x00006900168009a9	!46
	.xword	0x8000002c85c00043	
	.xword	0x00006770001284a8	!47
	.xword	0x80000003b00d6440	
	.xword	0x000067700018e000	!48
	.xword	0x80000003b0002440	
	.xword	0x00006800000e09a9	!49
	.xword	0x80000000e0e20041	
	.xword	0x00006900244004a8	!50
	.xword	0x8000002c88000443	
	.xword	0x0000680000610000	!51
	.xword	0x80000000e0d10441	
	.xword	0x00006800001209a9	!52
	.xword	0x80000000e0c80041	
	.xword	0x0000680000af0000	!53
	.xword	0x80000000e0490441	
	.xword	0x0000690030c009a9	!54
	.xword	0x8000002c82400043	
	.xword	0x00006800009209a9	!55
	.xword	0x80000000e0a60041	
	.xword	0x00006770000229a9	!56
	.xword	0x80000003b018e040	
	.xword	0x0000680000dc09a9	!57
	.xword	0x80000000e01f0041	
	.xword	0x00006800003c09a9	!58
	.xword	0x80000000e08b0041	
	.xword	0x00006900394009a9	!59
	.xword	0x8000002c8b800043	
	.xword	0x00006800001409a9	!60
	.xword	0x80000000e0db0041	
	.xword	0x0000680000cf09a9	!61
	.xword	0x80000000e0030041	
	.xword	0x00006800001909a9	!62
	.xword	0x80000000e0590041	
	.xword	0x00006770000469a9	!63
	.xword	0x80000003b0176040	
	.xword	0x00006a04a00009a9	!64
	.xword	0x8000002e40000045	
	.xword	0x0000680000be09a9	!65
	.xword	0x80000000e0700041	
	.xword	0x000069002cc009a9	!66
	.xword	0x8000002c8b000043	
	.xword	0x0000680000b109a9	!67
	.xword	0x80000000e0780041	
	.xword	0x00006800003909a9	!68
	.xword	0x80000000e0e40041	
	.xword	0x00006800000409a9	!69
	.xword	0x80000000e06b0041	
	.xword	0x00006770001429a9	!70
	.xword	0x80000003b01b8040	
	.xword	0x00006d003cc01006	!71
	.xword	0x8000000094000043	
	.xword	0x00006b800017bd56	!72
	.xword	0x80000003c0196040	
	.xword	0x00006d0016400000	!73
	.xword	0x800000009e000443	
	.xword	0x00006b80001cb006	!74
	.xword	0x80000003c0060040	
	.xword	0x00006e0b50001d56	!75
	.xword	0x8000000190000045	
	.xword	0x00006e00e0000000	!76
	.xword	0x8000003850000445	
	.xword	0x00006b8000097006	!77
	.xword	0x80000003c0066040	
	.xword	0x00006d0024801d56	!78
	.xword	0x8000000093800043	
	.xword	0x00006c0000760000	!79
	.xword	0x8000003cf0430441	
	.xword	0x00006b8000147006	!80
	.xword	0x80000003c004a040	
	.xword	0x00006c0000270000	!81
	.xword	0x8000003cf0d50441	
	.xword	0x00006b8000089006	!82
	.xword	0x80000003c0090040	
	.xword	0x00006c00002d1006	!83
	.xword	0x8000003cf0640041	
	.xword	0x00006b800019d006	!84
	.xword	0x80000003c01fc040	
	.xword	0x00006b80000c5006	!85
	.xword	0x80000003c0092040	
	.xword	0x00006b8000111006	!86
	.xword	0x80000003c01fe040	
	.xword	0x00006b8000063006	!87
	.xword	0x80000003c009e040	
	.xword	0x00006b8000159006	!88
	.xword	0x80000003c017e040	
	.xword	0x00006e0900001006	!89
	.xword	0x80000001a0000045	
	.xword	0x00006c0000a01006	!90
	.xword	0x8000003cf0350041	
	.xword	0x0000700000061b80	!91
	.xword	0x8000004d005c0041	
	.xword	0x00006f900000a8e0	!92
	.xword	0x80000003d01cc440	
	.xword	0x00006f9000048000	!93
	.xword	0x80000003d00da440	
	.xword	0x00006f9000176416	!94
	.xword	0x80000003d0056040	
	.xword	0x00007000003a0dcb	!95
	.xword	0x8000004d00380441	
	.xword	0x00006f90001fc000	!96
	.xword	0x80000003d010a440	
	.xword	0x0000700000ed1b80	!97
	.xword	0x8000004d00260041	
	.xword	0x0000710008400dcb	!98
	.xword	0x8000004ca5800443	
	.xword	0x00006f9000130000	!99
	.xword	0x80000003d01a4440	
	.xword	0x0000700000d81b80	!100
	.xword	0x8000004d001d0041	
	.xword	0x00006f90001de8e0	!101
	.xword	0x80000003d0160440	
	.xword	0x00006f9000016000	!102
	.xword	0x80000003d000a440	
	.xword	0x0000710005801b80	!103
	.xword	0x8000004ca7c00043	
	.xword	0x0000700000210000	!104
	.xword	0x8000004d00da0441	
	.xword	0x00007209a0001b80	!105
	.xword	0x8000004dd0000045	
	.xword	0x0000700000a41b80	!106
	.xword	0x8000004d004b0041	
	.xword	0x0000700000ea1b80	!107
	.xword	0x8000004d00f70041	
	.xword	0x0000700000481b80	!108
	.xword	0x8000004d00510041	
	.xword	0x00006f9000172416	!109
	.xword	0x80000003d01a6040	
	.xword	0x000073a00017986b	!110
	.xword	0x80000003e0166440	
	.xword	0x000073a0001ba081	!111
	.xword	0x80000003e012a040	
	.xword	0x000073a00009c000	!112
	.xword	0x8000005fe002a040	
	.xword	0x000075001300186b	!113
	.xword	0x80000000bfc00443	
	.xword	0x000073a0001bc081	!114
	.xword	0x80000003e0106040	
	.xword	0x000073a0000a0000	!115
	.xword	0x8000005fe01ea040	
	.xword	0x0000740000b6186b	!116
	.xword	0x8000000110d30441	
	.xword	0x000073a000010081	!117
	.xword	0x80000003e010c040	
	.xword	0x0000760460000000	!118
	.xword	0x8000005e50000045	
	.xword	0x000075000500186b	!119
	.xword	0x80000000b5000443	
	.xword	0x000073a000002000	!120
	.xword	0x8000005fe00b2040	
	.xword	0x000074000003186b	!121
	.xword	0x8000000110610441	
	.xword	0x000074000049186b	!122
	.xword	0x80000001102f0441	
	.xword	0x00007603a000186b	!123
	.xword	0x80000001f0000445	
	.xword	0x0000740000dd186b	!124
	.xword	0x8000000110e70441	
	.xword	0x0000740000df186b	!125
	.xword	0x80000001103e0441	
	.xword	0x0000740000c7186b	!126
	.xword	0x8000000110c50441	
	.xword	0x000075000b00186b	!127
	.xword	0x80000000ba000443	
	.xword	0x0000750003c0186b	!128
	.xword	0x80000000b5400443	
	.xword	0x000077b00003ad7c	!129
	.xword	0x8000006ff0134040	
	.xword	0x000077b00014c690	!130
	.xword	0x8000006ff01ba040	
	.xword	0x0000780000a50000	!131
	.xword	0x8000000120a40041	
	.xword	0x000077b000078d7c	!132
	.xword	0x8000006ff01b0040	
	.xword	0x00007900178015b6	!133
	.xword	0x800000014a400043	
	.xword	0x0000780000310000	!134
	.xword	0x8000000120570041	
	.xword	0x000077b000174d7c	!135
	.xword	0x8000006ff00c8040	
	.xword	0x0000780000fc15b6	!136
	.xword	0x8000006d20f40041	
	.xword	0x0000780000540000	!137
	.xword	0x8000000120e80041	
	.xword	0x000077b0001c6d7c	!138
	.xword	0x8000006ff006e040	
	.xword	0x000079000c4015b6	!139
	.xword	0x8000000146800043	
	.xword	0x000077b0001ea000	!140
	.xword	0x8000006ff00a0040	
	.xword	0x0000780000ac0713	!141
	.xword	0x8000006d208e0041	
	.xword	0x00007800008e0000	!142
	.xword	0x80000001207b0041	
	.xword	0x00007800006d0713	!143
	.xword	0x8000006d205d0041	
	.xword	0x000077b00003ed7c	!144
	.xword	0x8000006ff0110040	
	.xword	0x000077b0001a2d7c	!145
	.xword	0x8000006ff0010040	
	.xword	0x000077b0000d2d7c	!146
	.xword	0x8000006ff01e4040	
	.xword	0x0000790023400713	!147
	.xword	0x8000000148c00043	
	.xword	0x0000780000620713	!148
	.xword	0x8000006d20f50041	
	.xword	0x000077b000072d7c	!149
	.xword	0x8000006ff0152040	
	.xword	0x0000790028800713	!150
	.xword	0x8000000149000043	
	.xword	0x0000780000b70713	!151
	.xword	0x8000006d20410041	
	.xword	0x000077b000196d7c	!152
	.xword	0x8000006ff0114040	
	.xword	0x000079002ec00713	!153
	.xword	0x8000000149c00043	
	.xword	0x000077b000040d7c	!154
	.xword	0x8000006ff01d0040	
	.xword	0x0000790001800713	!155
	.xword	0x800000014a800043	
	.xword	0x00007bc00011c1df	!156
	.xword	0x800000001008c440	
	.xword	0x00007bc000059c59	!157
	.xword	0x800000001005a440	
	.xword	0x00007bc0001be000	!158
	.xword	0x8000007010030040	
	.xword	0x00007c00003e01df	!159
	.xword	0x8000007d30790441	
	.xword	0x00007bc000193c59	!160
	.xword	0x8000000010178440	
	.xword	0x00007bc0001c4000	!161
	.xword	0x80000070100bc040	
	.xword	0x00007d00378001df	!162
	.xword	0x8000007d5ac00443	
	.xword	0x00007bc0001ffc59	!163
	.xword	0x8000000010190440	
	.xword	0x00007c0000510000	!164
	.xword	0x8000000130850041	
	.xword	0x00007bc0000f21df	!165
	.xword	0x8000000010012440	
	.xword	0x00007d0038c01c59	!166
	.xword	0x8000007d5f400443	
	.xword	0x00007bc000194000	!167
	.xword	0x8000007010154040	
	.xword	0x00007c00006401df	!168
	.xword	0x8000007d30bf0441	
	.xword	0x00007bc0000a3c59	!169
	.xword	0x80000000100e6440	
	.xword	0x00007c00008f0000	!170
	.xword	0x8000000130130041	
	.xword	0x00007c00001801df	!171
	.xword	0x8000007d301e0441	
	.xword	0x00007bc0001261df	!172
	.xword	0x80000000100dc440	
	.xword	0x00007c0000ee01df	!173
	.xword	0x8000007d305f0441	
	.xword	0x00007e0220000021	!174
	.xword	0x8000007420000445	
	.xword	0x00007c00000d01df	!175
	.xword	0x8000007d30e90441	
	.xword	0x00007c00008101df	!176
	.xword	0x8000007d30eb0441	
	.xword	0x00007d00278001df	!177
	.xword	0x8000007d5c400443	
	.xword	0x00007bc0000e61df	!178
	.xword	0x8000000010116440	
	.xword	0x00007bc0001ce1df	!179
	.xword	0x800000001015e440	
	.xword	0x00007c00007c01df	!180
	.xword	0x8000007d30370441	
	.xword	0x00007c0000a701df	!181
	.xword	0x8000007d30c90441	
hptrap_dtte_end:
	.xword	182
.align 32
hptrap_user_code_ptrs_0_begin:
	.xword	8
	.xword	0x5f500010c000
	.xword	24
	.xword	0x610012400000
	.xword	40
	.xword	0x5f50000ee000
	.xword	56
	.xword	0x61003fc00000
	.xword	72
	.xword	0x600000880000
	.xword	88
	.xword	0x5f500001e000
	.xword	104
	.xword	0x6000003d0000
	.xword	120
	.xword	0x600000da0000
	.xword	136
	.xword	0x600000b90000
	.xword	152
	.xword	0x620400000000
	.xword	168
	.xword	0x600000130000
	.xword	184
	.xword	0x5f500006e000
	.xword	200
	.xword	0x600000c80000
	.xword	216
	.xword	0x620b40000000
	.xword	232
	.xword	8
.align 32
hptrap_user_code_ptrs_1_begin:
	.xword	8
	.xword	0x6400005d0000
	.xword	24
	.xword	0x640000990000
	.xword	40
	.xword	0x6400008b0000
	.xword	56
	.xword	0x6360001e0000
	.xword	72
	.xword	0x63600008a000
	.xword	88
	.xword	0x660fa0000000
	.xword	104
	.xword	0x6360000bc000
	.xword	120
	.xword	0x636000104000
	.xword	136
	.xword	0x640000580000
	.xword	152
	.xword	0x6400001d0000
	.xword	168
	.xword	0x636000114000
	.xword	184
	.xword	0x63600014a000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_2_begin:
	.xword	8
	.xword	0x6800004c0000
	.xword	24
	.xword	0x677000034000
	.xword	40
	.xword	0x6770001a8000
	.xword	56
	.xword	0x69002b400000
	.xword	72
	.xword	0x6a01b0000000
	.xword	88
	.xword	0x680000790000
	.xword	104
	.xword	0x6770000c2000
	.xword	120
	.xword	0x680000370000
	.xword	136
	.xword	0x6800004d0000
	.xword	152
	.xword	0x680000eb0000
	.xword	168
	.xword	0x67700010a000
	.xword	184
	.xword	0x680000a30000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_3_begin:
	.xword	8
	.xword	0x6e08f0000000
	.xword	24
	.xword	0x6b80000d4000
	.xword	40
	.xword	0x6c00000c0000
	.xword	56
	.xword	0x6c0000de0000
	.xword	72
	.xword	0x6b80000ca000
	.xword	88
	.xword	0x6b800001a000
	.xword	104
	.xword	0x6c0000720000
	.xword	120
	.xword	0x6d0007800000
	.xword	136
	.xword	0x6d0012000000
	.xword	152
	.xword	0x6b8000168000
	.xword	168
	.xword	0x6d000cc00000
	.xword	184
	.xword	0x6b8000038000
	.xword	200
	.xword	0x6b80000d8000
	.xword	216
	.xword	8
.align 32
hptrap_user_code_ptrs_4_begin:
	.xword	8
	.xword	0x7000009e0000
	.xword	24
	.xword	0x71003d800000
	.xword	40
	.xword	0x6f90000de000
	.xword	56
	.xword	0x700000d30000
	.xword	72
	.xword	0x6f90001b8000
	.xword	88
	.xword	0x6f90000e0000
	.xword	104
	.xword	0x6f90000fc000
	.xword	120
	.xword	0x6f900018a000
	.xword	136
	.xword	0x710012c00000
	.xword	152
	.xword	0x7000004e0000
	.xword	168
	.xword	8
.align 32
hptrap_user_code_ptrs_5_begin:
	.xword	8
	.xword	0x73a000188000
	.xword	24
	.xword	0x7604b0000000
	.xword	40
	.xword	0x73a0000d0000
	.xword	56
	.xword	0x7400005f0000
	.xword	72
	.xword	0x7601c0000000
	.xword	88
	.xword	0x73a000180000
	.xword	104
	.xword	0x73a00011a000
	.xword	120
	.xword	0x73a00000c000
	.xword	136
	.xword	0x73a000064000
	.xword	152
	.xword	0x740000220000
	.xword	168
	.xword	0x740000530000
	.xword	184
	.xword	0x73a000198000
	.xword	200
	.xword	8
.align 32
hptrap_user_code_ptrs_6_begin:
	.xword	8
	.xword	0x77b00014e000
	.xword	24
	.xword	0x77b00015c000
	.xword	40
	.xword	0x77b0000da000
	.xword	56
	.xword	0x79002a800000
	.xword	72
	.xword	0x790018c00000
	.xword	88
	.xword	0x77b0000b4000
	.xword	104
	.xword	0x7800007b0000
	.xword	120
	.xword	0x77b000100000
	.xword	136
	.xword	0x7800007f0000
	.xword	152
	.xword	8
.align 32
hptrap_user_code_ptrs_7_begin:
	.xword	8
	.xword	0x7bc000120000
	.xword	24
	.xword	0x7bc000152000
	.xword	40
	.xword	0x7d0030000000
	.xword	56
	.xword	0x7bc0001cc000
	.xword	72
	.xword	0x7bc0000be000
	.xword	88
	.xword	0x7bc000124000
	.xword	104
	.xword	0x7bc0001a0000
	.xword	120
	.xword	0x7c0000a60000
	.xword	136
	.xword	0x7bc0000b8000
	.xword	152
	.xword	0x7c0000e00000
	.xword	168
	.xword	0x7bc0001d8000
	.xword	184
	.xword	0x7bc00012a000
	.xword	200
	.xword	0x7bc0000c8000
	.xword	216
	.xword	0x7bc000162000
	.xword	232
	.xword	8
/*********************************************************************/
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x600000240000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	VA = 0x600000240000 ,/* 0x60000024ffc0 */
	RA = 0x00c0760000 ,
	PA = 0x0cc0760000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000241492 8000000cc0760081 */
	end_label   = Thr0_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
	setx	0x600000c00000, %g1, %g2
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
	or	%g0, 0x7a0, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc45d2088
	.word	0xfe4ea692
thr0_MMU_ASI_BLK_COMMIT_P_1:
	.word	0x878020e0
	.word	0xc1be2280
thr0_MMU_ASI_BLK_P_2:
	.word	0x878020f0
	.word	0xc1bc2280
	.word	0xbe82a148
	.word	0xe0dfd000
	.word	0xda742110
	.word	0xc020a890
	.word	0xfa76a020
	.word	0xc036280e
	.word	0xfe5728a8
	TOGGLE_LSU_DM
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0xe0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	.word	0xfcde1000
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x37a, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x7e1, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x2df, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe5d20f0
	.word	0xbe816010
	.word	0xe39fde20
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc03628a0
	.word	0x81c5e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v000_exit:
	EXIT_GOOD
Thr0_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v100 DATA_VA=0x600000c00000
attr_data {
	Name = .Thr0_User_Data_4v100 ,
	VA = 0x600000c00000 ,/* 0x600000c0ffc0 */
	RA = 0x00c00c0000 ,
	PA = 0x0cc00c0000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000c01492 8000000cc00c0441 */
	end_label   = Thr0_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v100_data_begin
Thr0_User_Data_4v100_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v200 DATA_VA=0x610004c00000
attr_data {
	Name = .Thr0_User_Data_4v200 ,
	VA = 0x610004c00000 ,/* 0x610004ffffc0 */
	RA = 0x0060800000 ,
	PA = 0x0860800000 ,
	TTE_Context = 0x1759 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000610004c01759 8000000860800043 */
	end_label   = Thr0_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v200_data_begin
Thr0_User_Data_4v200_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v300 DATA_VA=0x600000080000
attr_data {
	Name = .Thr0_User_Data_4v300 ,
	VA = 0x600000080000 ,/* 0x60000008ffc0 */
	RA = 0x00c0e10000 ,
	PA = 0x0cc0e10000 ,
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
	/* DTTE_TAG_DATA = 0000600000080000 8000000cc0e10041 */
	end_label   = Thr0_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v300_data_begin
Thr0_User_Data_4v300_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v001 TEXT_VA=0x5f500010c000
attr_text {
	Name = .Thr0_User_Text_4v001 ,
	VA = 0x5f500010c000 ,/* 0x5f500010dfc0 */
	RA = 0x03900d4000 ,
	PA = 0x0f900d4000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f500010d19d 8000000f900d4080 */
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
	DDEMAP_SCTX
	.word	0xd45ea148
	.word	0x1000000
	or	%g0, 0x01b, %i7
	LOAD_DDATA_IN
	.word	0xfcde1000
thr0_MMU_ASI_PRIMARY_LITTLE_3:
	.word	0x87802088
	.word	0xf2f6a050
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4f2fde
	.word	0xc02aa7fd
	.word	0x1000000
	or	%g0, 0x178, %i7
	READ_DDATA_ACCESS
	ACCESS_ITSB_PTR
	DDEMAP_PCTX
thr0_MMU_ASI_SECONDARY_4:
	.word	0x87802081
	.word	0xdaf16078
	ACCESS_DTSB_PTR
	.word	0xf45d2068
	.word	0x1000000
	or	%g0, 0x00e, %i7
	LOAD_IDATA_IN
	.word	0xfcde1000
	.word	0x1000000
	or	%g0, 0x550, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x070, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
thr0_MMU_ASI_BLK_COMMIT_P_5:
	.word	0x878020e0
	.word	0xe3beaa80
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf672a0c0
	.word	0xc032ab28
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe100000
	IDEMAP_PAGE
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe472964
	nop
	nop
	nop
	nop
	.word	0xfe4aac58
	.word	0x1000000
	or	%g0, 0x7d8, %i7
	DTLB_TAG_READ
	nop
	.word	0xc03722ba
	ACCESS_DTSB_PTR
	.word	0xc0342dd6
	.word	0xf85ea068
thr0_MMU_ASI_BLK_P_6:
	.word	0x878020f0
	.word	0xc1bc2c40
	TOGGLE_LSU_DM
	.word	0xf85f2150
	ACCESS_ITSB_PTR
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc02aa53c
	.word	0x81c3e000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v001_exit:
	EXIT_GOOD
Thr0_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v400 TEXT_VA=0x5f5000170000
attr_text {
	Name = .Thr0_User_Text_4v400 ,
	VA = 0x5f5000170000 ,/* 0x5f5000171fc0 */
	RA = 0x039012c000 ,
	PA = 0x039012c000 ,
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
	/* ITTE_TAG_DATA = 00005f5000170000 800000039012c480 */
	end_label   = Thr0_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v400_text_begin
Thr0_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xc0332422
	.word	0x1000000
	.word	0xbe15c000
	P_IDEMAP_PAGE
thr0_MMU_ASI_AS_IF_USER_PRIMARY_7:
	.word	0x87802010
	.word	0xfaf620b0
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x560, %i7
	P_READ_IDATA_ACCESS
thr0_MMU_ASI_AS_IF_USER_SECONDARY_LITTLE_8:
	.word	0x87802019
	.word	0xd0f16058
	.word	0xc021a3d8
	.word	0xf859a038
	.word	0xbe842038
	.word	0xe8dfd000
	.word	0xbe842108
	.word	0xf0dfc200
	.word	0xfcdc1000
	P_IDEMAP_ALL
thr0_MMU_ASI_AS_IF_USER_PRIMARY_9:
	.word	0x87802010
	.word	0xe8f62038
	nop
	nop
	.word	0x1000000
	or	%g0, 0x550, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x46b, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc071a478
	.word	0x1000000
	or	%g0, 0x674, %i7
	P_LOAD_DDATA_ACCESS
	P_DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_SECONDARY_LITTLE_10:
	.word	0x87802089
	.word	0xdef2e020
	.word	0xcc5b2048
	.word	0x1000000
	or	%g0, 0x078, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x305, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x438, %i7
	P_ITLB_TAG_READ
thr0_MMU_ASI_PRIMARY_11:
	.word	0x87802080
	.word	0xdef2a050
	P_IDEMAP_NCTX
	.word	0x1000000
	.word	0xbe164000
	P_IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x488, %i7
	P_DTLB_TAG_READ
	.word	0xe859a038
	.word	0x1000000
	or	%g0, 0x086, %i7
	P_LOAD_DDATA_IN
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr0_User_Text_4v400_exit:
	EXIT_GOOD
Thr0_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v002 TEXT_VA=0x600000330000
attr_text {
	Name = .Thr0_User_Text_4v002 ,
	VA = 0x600000330000 ,/* 0x60000033ffc0 */
	RA = 0x00c0310000 ,
	PA = 0x0cc0310000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000331492 8000000cc0310081 */
	end_label   = Thr0_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v002_text_begin
Thr0_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0xc0, %i7
	P_READ_IDATA_ACCESS
thr0_MMU_ASI_PRIMARY_12:
	.word	0x87802080
	.word	0xf0f620c8
	P_IDEMAP_ALL_RPAGES
	P_DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xd270a020
	.word	0xc0352ee8
	nop
	nop
	nop
	nop
	nop
	.word	0xc85c20f8
	.word	0x1000000
	or	%g0, 0x28, %i7
	P_LOAD_DDATA_ACCESS
	nop
	nop
	.word	0xfcde1040
	.word	0xe39c5e20
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v002_exit:
	EXIT_GOOD
Thr0_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v101 DATA_VA=0x5f50000dc000
attr_data {
	Name = .Thr0_User_Data_4v101 ,
	VA = 0x5f50000dc000 ,/* 0x5f50000ddfc0 */
	RA = 0x0390048000 ,
	PA = 0x0f90048000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f50000dd19d 8000000f90048440 */
	end_label   = Thr0_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v101_data_begin
Thr0_User_Data_4v101_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v201 DATA_VA=0x610022c00000
attr_data {
	Name = .Thr0_User_Data_4v201 ,
	VA = 0x610022c00000 ,/* 0x610022ffffc0 */
	RA = 0x0063c00000 ,
	PA = 0x0863c00000 ,
	TTE_Context = 0x1759 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000610022c01759 8000000863c00043 */
	end_label   = Thr0_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v201_data_begin
Thr0_User_Data_4v201_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v301 DATA_VA=0x5f5000094000
attr_data {
	Name = .Thr0_User_Data_4v301 ,
	VA = 0x5f5000094000 ,/* 0x5f5000095fc0 */
	RA = 0x03900d2000 ,
	PA = 0x03900d2000 ,
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
	/* DTTE_TAG_DATA = 00005f5000094000 80000003900d2040 */
	end_label   = Thr0_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v301_data_begin
Thr0_User_Data_4v301_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v003 TEXT_VA=0x610012400000
attr_text {
	Name = .Thr0_User_Text_4v003 ,
	VA = 0x610012400000 ,/* 0x6100127fffc0 */
	RA = 0x0063000000 ,
	PA = 0x0863000000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000610012401492 8000000863000083 */
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
	or	%g0, 0x5f8, %i7
	DTLB_TAG_READ
	.word	0xfe542c62
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	ITLB_TAG_READ
thr0_MMU_ASI_PRIMARY_13:
	.word	0x87802080
	.word	0xd2f62120
	.word	0xf85e2108
	.word	0xf858a088
	.word	0x1000000
	or	%g0, 0x6f0, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x7c8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe170000
	IDEMAP_PAGE
	nop
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_RPAGE
	.word	0xc030a9d2
	.word	0xc85c2088
	.word	0xf270a100
	.word	0xc0262f60
	.word	0x1000000
	.word	0xbe124000
	IDEMAP_PAGE
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xfcd91000
	.word	0xc02aa805
	DDEMAP_ALL
thr0_MMU_ASI_BLK_COMMIT_P_14:
	.word	0x878020e0
	.word	0xe1b92ec0
	.word	0xfcdf1000
	.word	0x1000000
	or	%g0, 0x15, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x60, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_SECONDARY_15:
	.word	0x87802081
	.word	0xc0bc64a0
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	READ_DDATA_ACCESS
thr0_MMU_ASI_PRIMARY_LITTLE_16:
	.word	0x87802088
	.word	0xe0f6a128
	.word	0xc026a170
	.word	0x1000000
	or	%g0, 0x079, %i7
	LOAD_DDATA_IN
	.word	0xd858a018
	.word	0x1000000
	or	%g0, 0x560, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xbe8620e8
	.word	0xf0dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf6742100
	.word	0xc0292976
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v003_exit:
	EXIT_GOOD
Thr0_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v401 TEXT_VA=0x5f500018c000
attr_text {
	Name = .Thr0_User_Text_4v401 ,
	VA = 0x5f500018c000 ,/* 0x5f500018dfc0 */
	RA = 0x03900ea000 ,
	PA = 0x03900ea000 ,
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
	/* ITTE_TAG_DATA = 00005f500018c000 80000003900ea480 */
	end_label   = Thr0_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v401_text_begin
Thr0_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x01b, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	.word	0xc031a8ea
	.word	0xfcde9000
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1d8, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe812150
	.word	0xe0dfc200
	.word	0xc859a118
	.word	0xbe82a148
	.word	0xd4dfc200
	.word	0x1000000
	or	%g0, 0x080, %i7
	P_LOAD_DDATA_IN
	.word	0xbe812138
	.word	0xe0dfd000
	.word	0xc19d1e00
	.word	0xe39943e0
	.word	0x1000000
	or	%g0, 0x068, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x06d, %i7
	P_LOAD_IDATA_IN
thr0_MMU_ASI_AS_IF_USER_PRIMARY_17:
	.word	0x87802010
	.word	0xeef62050
	P_ACCESS_DTSB_PTR
	P_IDEMAP_ALL_RPAGES
	.word	0xc859a0d8
thr0_MMU_ASI_REAL_IO_18:
	.word	0x87802015
	.word	0xe2f6e010
	.word	0x1000000
	or	%g0, 0x013, %i7
	P_LOAD_DDATA_IN
	.word	0xbe8520d0
	.word	0xe19fc2c0
	P_TOGGLE_LSU_DM
	P_IDEMAP_ALL_RPAGES
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x099, %i7
	P_LOAD_IDATA_IN
	.word	0xbe86a008
	.word	0xd4dfd000
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR1
	nop
Thr0_User_Text_4v401_exit:
	EXIT_GOOD
Thr0_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v004 TEXT_VA=0x61001c000000
attr_text {
	Name = .Thr0_User_Text_4v004 ,
	VA = 0x61001c000000 ,/* 0x61001c3fffc0 */
	RA = 0x0066400000 ,
	PA = 0x0866400000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061001c001492 8000000866400083 */
	end_label   = Thr0_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v004_text_begin
Thr0_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe158000
	P_DDEMAP_PAGE
	.word	0xc0742fb8
	.word	0xfcde1040
	.word	0x1000000
	.word	0xbe170000
	P_DDEMAP_RPAGE
	.word	0xfcda8200
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x10, %i7
	P_READ_DDATA_ACCESS
	nop
thr0_MMU_ASI_PRIMARY_19:
	.word	0x87802080
	.word	0xfaf520f0
	P_TOGGLE_LSU_DM
	.word	0xfe5d2160
	.word	0xbe80a148
	.word	0xf4dfd000
	P_ACCESS_ITSB_PTR
	P_DDEMAP_PCTX
	nop
	nop
	nop
	.word	0xfcdb83a0
	.word	0xbe852008
	.word	0xd4dfd000
	.word	0xfcdc0200
	.word	0x1000000
	or	%g0, 0x160, %i7
	P_READ_DDATA_ACCESS
	.word	0xe85ea150
	.word	0x1000000
	or	%g0, 0x508, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x086, %i7
	P_LOAD_IDATA_IN
	.word	0xbe174000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v004_exit:
	EXIT_GOOD
Thr0_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v102 DATA_VA=0x600000380000
attr_data {
	Name = .Thr0_User_Data_4v102 ,
	VA = 0x600000380000 ,/* 0x60000038ffc0 */
	RA = 0x00c06c0000 ,
	PA = 0x0cc06c0000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000381492 8000000cc06c0441 */
	end_label   = Thr0_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v102_data_begin
Thr0_User_Data_4v102_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v202 DATA_VA=0x5f500011e000
attr_data {
	Name = .Thr0_User_Data_4v202 ,
	VA = 0x5f500011e000 ,/* 0x5f500011ffc0 */
	RA = 0x0390198000 ,
	PA = 0x0f90198000 ,
	TTE_Context = 0x1759 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00005f500011fdd2 8000000f90198040 */
	end_label   = Thr0_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v202_data_begin
Thr0_User_Data_4v202_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v005 TEXT_VA=0x5f50000ee000
attr_text {
	Name = .Thr0_User_Text_4v005 ,
	VA = 0x5f50000ee000 ,/* 0x5f50000effc0 */
	RA = 0x03901ac000 ,
	PA = 0x0f901ac000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f50000ef19d 8000000f901ac080 */
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
	.word	0xc0342554
	.word	0xbe82e010
	.word	0xcadfd060
	.word	0xc076a420
	.word	0xca5c2040
	.word	0xc02aa170
	.word	0xfc995d60
	.word	0x1000000
	or	%g0, 0x390, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x130, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a0b8
	.word	0xd4dfd000
	.word	0xfc9d1000
	.word	0xcc5e2018
	.word	0xfe52a07e
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe562456
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x1b8, %i7
	ITLB_TAG_READ
	nop
	nop
	.word	0xfcde1000
	.word	0xfcde1000
	.word	0xd45aa118
	DDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x320, %i7
	READ_DDATA_ACCESS
	.word	0xec742050
	.word	0xc026a7a8
	.word	0xce70a098
	.word	0xc07423a0
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
	.word	0xfe5925a0
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe8592088
	.word	0x81c5a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v005_exit:
	EXIT_GOOD
Thr0_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v006 TEXT_VA=0x5f5000118000
attr_text {
	Name = .Thr0_User_Text_4v006 ,
	VA = 0x5f5000118000 ,/* 0x5f5000119fc0 */
	RA = 0x039009c000 ,
	PA = 0x0f9009c000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f500011919d 8000000f9009c080 */
	end_label   = Thr0_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v006_text_begin
Thr0_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0xbe816010
	.word	0xc39fc2e0
	P_IDEMAP_ALL_RPAGES
	.word	0xfc9c1c40
thr0_MMU_ASI_AS_IF_USER_PRIMARY_20:
	.word	0x87802010
	.word	0xfaf52050
	P_ACCESS_ITSB_PTR
thr0_MMU_ASI_BLK_PL_21:
	.word	0x878020f8
	.word	0xc1bc2440
thr0_MMU_ASI_AS_IF_USER_PRIMARY_22:
	.word	0x87802010
	.word	0xf2f42130
	P_DDEMAP_ALL_RPAGES
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
	.word	0xbe168000
	P_IDEMAP_RPAGE
	.word	0xc036a780
	.word	0x1000000
	or	%g0, 0xc8, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v006_exit:
	EXIT_GOOD
Thr0_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v103 DATA_VA=0x61002a400000
attr_data {
	Name = .Thr0_User_Data_4v103 ,
	VA = 0x61002a400000 ,/* 0x61002a7fffc0 */
	RA = 0x0061400000 ,
	PA = 0x0861400000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000061002a401492 8000000861400443 */
	end_label   = Thr0_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v103_data_begin
Thr0_User_Data_4v103_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v203 DATA_VA=0x5f500006c000
attr_data {
	Name = .Thr0_User_Data_4v203 ,
	VA = 0x5f500006c000 ,/* 0x5f500006dfc0 */
	RA = 0x0390100000 ,
	PA = 0x0f90100000 ,
	TTE_Context = 0x1759 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00005f500006ddd2 8000000f90100040 */
	end_label   = Thr0_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v203_data_begin
Thr0_User_Data_4v203_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v007 TEXT_VA=0x61003fc00000
attr_text {
	Name = .Thr0_User_Text_4v007 ,
	VA = 0x61003fc00000 ,/* 0x61003fffffc0 */
	RA = 0x0069400000 ,
	PA = 0x0869400000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061003fc01492 8000000869400083 */
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
	.word	0xc0342fde
	TOGGLE_LSU_DM
	.word	0xc02c2aeb
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_23:
	.word	0x87802080
	.word	0xf8f42118
thr0_MMU_ASI_BLK_SL_24:
	.word	0x878020f9
	.word	0xe1bae140
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
	.word	0xfe5c2dd8
	.word	0xc67520a0
	.word	0xc02122d4
	.word	0xfe4d2d82
	.word	0xfe462d64
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xde742000
	.word	0xc036af4c
	.word	0xbe138000
	GOTO_SUPERVISOR1
	IDEMAP_ALL_RPAGES
thr0_MMU_ASI_PRIMARY_25:
	.word	0x87802080
	.word	0xd2f520d0
	.word	0x1000000
	or	%g0, 0x387, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xf0, %i7
	READ_IDATA_ACCESS
	DDEMAP_PCTX
	.word	0xc07626d0
	TOGGLE_LSU_IM
	DDEMAP_ALL
	.word	0x1000000
	.word	0xbe144000
	DDEMAP_PAGE
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe114000
	DDEMAP_PAGE
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x420, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x09d, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x30, %i7
	ITLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe67520f0
	.word	0xc076a170
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v007_exit:
	EXIT_GOOD
Thr0_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v008 TEXT_VA=0x5f500012e000
attr_text {
	Name = .Thr0_User_Text_4v008 ,
	VA = 0x5f500012e000 ,/* 0x5f500012ffc0 */
	RA = 0x039002c000 ,
	PA = 0x0f9002c000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f500012f19d 8000000f9002c080 */
	end_label   = Thr0_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v008_text_begin
Thr0_User_Text_4v008_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x4a5, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe148000
	P_IDEMAP_RPAGE
	nop
	nop
	.word	0xc0342c56
	.word	0x1000000
	or	%g0, 0xc0, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc02e24b0
	.word	0xbe856060
	.word	0xd2dfc2a0
	.word	0xfc998480
	P_IDEMAP_NCTX
	P_ACCESS_DTSB_PTR
	P_TOGGLE_LSU_DM
	.word	0xbe8720d8
	.word	0xd4dfc200
	.word	0x1000000
	or	%g0, 0x130, %i7
	P_READ_IDATA_ACCESS
	.word	0xe2592010
	.word	0xbe872038
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x1ec, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xc19ade20
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
	nop
	nop
	nop
	nop
	.word	0xbe852088
	.word	0xd4dfd000
	.word	0xde772120
	.word	0xc0272434
thr0_MMU_ASI_BLK_P_26:
	.word	0x878020f0
	.word	0xe1bf2140
	.word	0xfcde9000
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x1d0, %i7
	P_ITLB_TAG_READ
thr0_MMU_ASI_REAL_MEM_LITTLE_27:
	.word	0x8780201c
	.word	0xdaf460d0
	P_DDEMAP_NCTX
	.word	0xc0242170
	P_DDEMAP_ALL
	P_IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	P_ACCESS_ITSB_PTR
	.word	0xd45c2088
	P_TOGGLE_LSU_IM
	.word	0xfcdc5120
	.word	0x1000000
	or	%g0, 0x67f, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe11c000
	P_DDEMAP_PAGE
	.word	0xc39a82c0
	.word	0xfe442678
thr0_MMU_ASI_AS_IF_USER_PRIMARY_28:
	.word	0x87802010
	.word	0xf6f42020
thr0_MMU_ASI_AS_IF_USER_PRIMARY_29:
	.word	0x87802010
	.word	0xf8f2a068
	.word	0x1000000
	or	%g0, 0x093, %i7
	P_LOAD_IDATA_IN
thr0_MMU_ASI_AS_IF_USER_PRIMARY_30:
	.word	0x87802010
	.word	0xdcf52028
	.word	0xbe174000
	RETURN_FROM_SUPERVISOR0
	nop
Thr0_User_Text_4v008_exit:
	EXIT_GOOD
Thr0_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v104 DATA_VA=0x600000e60000
attr_data {
	Name = .Thr0_User_Data_4v104 ,
	VA = 0x600000e60000 ,/* 0x600000e6ffc0 */
	RA = 0x00c0bb0000 ,
	PA = 0x0cc0bb0000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000e61492 8000000cc0bb0441 */
	end_label   = Thr0_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v104_data_begin
Thr0_User_Data_4v104_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v009 TEXT_VA=0x600000880000
attr_text {
	Name = .Thr0_User_Text_4v009 ,
	VA = 0x600000880000 ,/* 0x60000088ffc0 */
	RA = 0x00c07c0000 ,
	PA = 0x0cc07c0000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000881492 8000000cc07c0081 */
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
	.word	0xd4712068
	.word	0xc02621f0
	.word	0x1000000
	or	%g0, 0x01b, %i7
	LOAD_IDATA_IN
	.word	0xfe5aaa00
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe128000
	IDEMAP_PAGE
	.word	0xc0372818
	.word	0xf672a0d0
	.word	0xc02aa453
	.word	0x1000000
	or	%g0, 0x558, %i7
	DTLB_TAG_READ
	.word	0xfc9e9100
	.word	0xfe5c2c18
	.word	0x1000000
	or	%g0, 0x410, %i7
	READ_IDATA_ACCESS
	.word	0xe25ea010
thr0_MMU_ASI_SECONDARY_LITTLE_31:
	.word	0x87802089
	.word	0xf6f2e078
thr0_MMU_ASI_BLK_PL_32:
	.word	0x878020f8
	.word	0xe3bc2480
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x55, %i7
	LOAD_DDATA_ACCESS
	.word	0xe85c2108
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcdd1000
thr0_MMU_ASI_BLK_SL_33:
	.word	0x878020f9
	.word	0xe3bc64c0
	.word	0xf6742080
	.word	0xc02d27bd
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe140000
	DDEMAP_RPAGE
	.word	0xfcdc1000
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe4ea9fb
	.word	0x1000000
	or	%g0, 0x11c, %i7
	LOAD_IDATA_ACCESS
	nop
	.word	0xc03528b4
	DDEMAP_NCTX
	.word	0xde742000
	.word	0xc0712170
	.word	0xd472a0e8
	.word	0xc072a628
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
	DDEMAP_RPAGE
	.word	0xce7520d0
	.word	0xc0742170
thr0_MMU_ASI_PRIMARY_34:
	.word	0x87802080
	.word	0xdcf52028
	.word	0x1000000
	or	%g0, 0x7c8, %i7
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
	TOGGLE_LSU_IM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x550, %i7
	LOAD_IDATA_ACCESS
	.word	0xe05e20a8
	.word	0xc032a736
	.word	0xbe82a0b8
	.word	0xe0dfd000
	TOGGLE_LSU_IM
	.word	0xfc9e9d40
thr0_MMU_ASI_BLK_COMMIT_S_35:
	.word	0x878020e1
	.word	0xc3bd6200
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x168, %i7
	READ_DDATA_ACCESS
	.word	0xc07523d0
	.word	0xfcde1000
	.word	0xfe46281c
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe40a750
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v009_exit:
	EXIT_GOOD
Thr0_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v105 DATA_VA=0x61002dc00000
attr_data {
	Name = .Thr0_User_Data_4v105 ,
	VA = 0x61002dc00000 ,/* 0x61002dffffc0 */
	RA = 0x0069800000 ,
	PA = 0x0869800000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000061002dc01492 8000000869800443 */
	end_label   = Thr0_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v105_data_begin
Thr0_User_Data_4v105_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00a TEXT_VA=0x5f500001e000
attr_text {
	Name = .Thr0_User_Text_4v00a ,
	VA = 0x5f500001e000 ,/* 0x5f500001ffc0 */
	RA = 0x039017c000 ,
	PA = 0x0f9017c000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f500001f19d 8000000f9017c080 */
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
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x590, %i7
	LOAD_DDATA_ACCESS
thr0_MMU_ASI_PRIMARY_36:
	.word	0x87802080
	.word	0xeaf42070
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe130000
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
	.word	0xfe562644
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe13c000
	IDEMAP_PAGE
	nop
	nop
	nop
	.word	0xfe5aaa60
	.word	0x1000000
	.word	0xbe108000
	IDEMAP_RPAGE
	.word	0xfe442e84
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xdc742028
	.word	0xc0772d58
	.word	0xe6762100
	.word	0xc03629aa
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
	.word	0xc02d2204
	.word	0x1000000
	or	%g0, 0x458, %i7
	DTLB_TAG_READ
	.word	0xf07620e8
	.word	0xc072a450
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe52a4f8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00a_exit:
	EXIT_GOOD
Thr0_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v106 DATA_VA=0x600000400000
attr_data {
	Name = .Thr0_User_Data_4v106 ,
	VA = 0x600000400000 ,/* 0x60000040ffc0 */
	RA = 0x00c0320000 ,
	PA = 0x0cc0320000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000401492 8000000cc0320441 */
	end_label   = Thr0_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v106_data_begin
Thr0_User_Data_4v106_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00b TEXT_VA=0x6000003d0000
attr_text {
	Name = .Thr0_User_Text_4v00b ,
	VA = 0x6000003d0000 ,/* 0x6000003dffc0 */
	RA = 0x00c05a0000 ,
	PA = 0x0cc05a0000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006000003d1492 8000000cc05a0081 */
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
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe4aa02a
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xbe812068
	.word	0xf8dfd000
	.word	0xbe82a0a8
	.word	0xc8dfd000
	DDEMAP_PCTX
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0xc0242540
	.word	0x81c5e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00b_exit:
	EXIT_GOOD
Thr0_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v107 DATA_VA=0x5f50000f0000
attr_data {
	Name = .Thr0_User_Data_4v107 ,
	VA = 0x5f50000f0000 ,/* 0x5f50000f1fc0 */
	RA = 0x0390036000 ,
	PA = 0x0f90036000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f50000f119d 8000000f90036440 */
	end_label   = Thr0_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v107_data_begin
Thr0_User_Data_4v107_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00c TEXT_VA=0x600000da0000
attr_text {
	Name = .Thr0_User_Text_4v00c ,
	VA = 0x600000da0000 ,/* 0x600000daffc0 */
	RA = 0x00c0a10000 ,
	PA = 0x0cc0a10000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000da1492 8000000cc0a10081 */
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
	nop
	nop
	IDEMAP_ALL_RPAGES
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
	.word	0xc032ac0a
	.word	0xfcd91000
	.word	0xfcde9000
	.word	0xf85c20a8
thr0_MMU_ASI_PRIMARY_37:
	.word	0x87802080
	.word	0xf2f62060
	.word	0xc39ade20
	IDEMAP_ALL_PAGES
thr0_MMU_ASI_BLK_P_38:
	.word	0x878020f0
	.word	0xe1be29c0
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02d2d8d
	ACCESS_DTSB_PTR
	.word	0xc02c22c6
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x57a, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe4aa1d0
	.word	0xc028ad23
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_39:
	.word	0x87802080
	.word	0xe2f2a010
	DO_BRANCH
	.word	0x81c5a000
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0xfcdf1000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe2742070
	.word	0xc0262a3c
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00c_exit:
	EXIT_GOOD
Thr0_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v108 DATA_VA=0x5f500004e000
attr_data {
	Name = .Thr0_User_Data_4v108 ,
	VA = 0x5f500004e000 ,/* 0x5f500004ffc0 */
	RA = 0x03901b6000 ,
	PA = 0x0f901b6000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f500004f19d 8000000f901b6440 */
	end_label   = Thr0_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v108_data_begin
Thr0_User_Data_4v108_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00d TEXT_VA=0x600000b90000
attr_text {
	Name = .Thr0_User_Text_4v00d ,
	VA = 0x600000b90000 ,/* 0x600000b9ffc0 */
	RA = 0x00c0d40000 ,
	PA = 0x0cc0d40000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000b91492 8000000cc0d40081 */
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
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x08c, %i7
	LOAD_IDATA_IN
	.word	0xe072a148
	.word	0xc072a250
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x340, %i7
	READ_DDATA_ACCESS
	.word	0xfe4725e4
thr0_MMU_ASI_PRIMARY_40:
	.word	0x87802080
	.word	0xecf62030
	.word	0x1000000
	or	%g0, 0x070, %i7
	LOAD_IDATA_IN
	.word	0xfcdc1000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe842128
	.word	0xe0dfd000
thr0_MMU_ASI_SECONDARY_41:
	.word	0x87802081
	.word	0xf8f56148
	.word	0xbe842138
	.word	0xe8dfd000
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0xc0, %i7
	READ_DDATA_ACCESS
	.word	0xbe842088
	.word	0xf4dfd000
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
	.word	0x1000000
	.word	0xbe178000
	DDEMAP_PAGE
	.word	0xc0752170
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x80, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe134000
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x6c0, %i7
	READ_DDATA_ACCESS
	.word	0xfe4525e0
	.word	0xc39c1f00
thr0_MMU_ASI_PRIMARY_42:
	.word	0x87802080
	.word	0xecf52050
	.word	0x1000000
	or	%g0, 0x51f, %i7
	LOAD_IDATA_ACCESS
	.word	0xf45c2128
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_PAGE
	.word	0xbe120000
	GOTO_SUPERVISOR1
	IDEMAP_ALL_PAGES
	.word	0xc0712318
	.word	0xfe44266c
	TOGGLE_LSU_DM
	.word	0xfcd95060
	.word	0xd4592038
	.word	0xfcda9000
thr0_MMU_ASI_BLK_P_43:
	.word	0x878020f0
	.word	0xc3bc2f40
	.word	0x1000000
	or	%g0, 0x3c8, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_DM
thr0_MMU_ASI_PRIMARY_44:
	.word	0x87802080
	.word	0xdaf62050
	.word	0x1000000
	or	%g0, 0x1d8, %i7
	DTLB_TAG_READ
thr0_MMU_ASI_PRIMARY_45:
	.word	0x87802080
	.word	0xf8f420d8
	.word	0xd272a050
	.word	0xc0362c14
	.word	0x1000000
	or	%g0, 0x760, %i7
	DTLB_TAG_READ
thr0_MMU_ASI_BLK_P_46:
	.word	0x878020f0
	.word	0xe1bc2a40
	.word	0xec742060
	.word	0xc03524c6
	.word	0xe4762100
	.word	0xc02ea470
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfc9a9d40
	.word	0xfe42a14c
	.word	0xfc9d5d60
thr0_MMU_ASI_PRIMARY_47:
	.word	0x87802080
	.word	0xd2f42050
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x0b0, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x68, %i7
	ITLB_TAG_READ
	.word	0xc85c20c8
	.word	0x1000000
	.word	0xbe13c000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x358, %i7
	DTLB_TAG_READ
	.word	0xc02d2832
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe144000
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
	IDEMAP_ALL
	ACCESS_DTSB_PTR
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x09d, %i7
	LOAD_IDATA_IN
	.word	0xfc9add60
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xca72a010
	.word	0xc02c2e21
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr0_User_Text_4v00d_exit:
	EXIT_GOOD
Thr0_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v109 DATA_VA=0x5f5000112000
attr_data {
	Name = .Thr0_User_Data_4v109 ,
	VA = 0x5f5000112000 ,/* 0x5f5000113fc0 */
	RA = 0x03900b0000 ,
	PA = 0x0f900b0000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f500011319d 8000000f900b0440 */
	end_label   = Thr0_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v109_data_begin
Thr0_User_Data_4v109_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00e TEXT_VA=0x620400000000
attr_text {
	Name = .Thr0_User_Text_4v00e ,
	VA = 0x620400000000 ,/* 0x62040fffffc0 */
	RA = 0x0320000000 ,
	PA = 0x0320000000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000620400001492 8000000320000085 */
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
	.word	0xfc9c1c40
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	TOGGLE_LSU_DM
	ACCESS_ITSB_PTR
	.word	0xfcdd5120
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	.word	0xc45ea0b8
	.word	0x1000000
	or	%g0, 0x330, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xf0, %i7
	ITLB_TAG_READ
	.word	0xbe86a0d8
	.word	0xd4dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x6b3, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x032, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe164000
	DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe118000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x288, %i7
	READ_DDATA_ACCESS
	IDEMAP_ALL_PAGES
	.word	0xc032afbc
	.word	0x1000000
	or	%g0, 0x033, %i7
	LOAD_DDATA_IN
	.word	0xf05f20a8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xf85d2128
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00e_exit:
	EXIT_GOOD
Thr0_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10a DATA_VA=0x5f5000182000
attr_data {
	Name = .Thr0_User_Data_4v10a ,
	VA = 0x5f5000182000 ,/* 0x5f5000183fc0 */
	RA = 0x03901e2000 ,
	PA = 0x0f901e2000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f500018319d 8000000f901e2440 */
	end_label   = Thr0_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10a_data_begin
Thr0_User_Data_4v10a_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00f TEXT_VA=0x600000130000
attr_text {
	Name = .Thr0_User_Text_4v00f ,
	VA = 0x600000130000 ,/* 0x60000013ffc0 */
	RA = 0x00c0f20000 ,
	PA = 0x0cc0f20000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000131492 8000000cc0f20081 */
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
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	IDEMAP_NCTX
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_SECONDARY_48:
	.word	0x87802081
	.word	0xdcf16028
	.word	0xec762100
	.word	0xc03729bc
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x5f2, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe5f26a8
	.word	0xfc9c1c40
	.word	0x1000000
	.word	0xbe108000
	DDEMAP_PAGE
	.word	0xcc72a018
	.word	0xc0312b08
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd85e2018
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v00f_exit:
	EXIT_GOOD
Thr0_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10b DATA_VA=0x5f500007c000
attr_data {
	Name = .Thr0_User_Data_4v10b ,
	VA = 0x5f500007c000 ,/* 0x5f500007dfc0 */
	RA = 0x03901ce000 ,
	PA = 0x0f901ce000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f500007d19d 8000000f901ce440 */
	end_label   = Thr0_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10b_data_begin
Thr0_User_Data_4v10b_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v010 TEXT_VA=0x5f500006e000
attr_text {
	Name = .Thr0_User_Text_4v010 ,
	VA = 0x5f500006e000 ,/* 0x5f500006ffc0 */
	RA = 0x03901f8000 ,
	PA = 0x0f901f8000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f500006f19d 8000000f901f8080 */
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
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x390, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	DDEMAP_ALL_PAGES
	.word	0xfcdc1000
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
	.word	0xd65e2070
	.word	0xc02d2991
	.word	0xe85aa008
	.word	0xfe5c28a8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfe42ad18
	nop
	nop
	nop
	nop
	nop
	.word	0xde7620d0
	.word	0xc02d284a
	.word	0x1000000
	or	%g0, 0x1c8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x499, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe170000
	IDEMAP_PAGE
	.word	0xfe52a1c0
	.word	0xfe572764
	.word	0x1000000
	or	%g0, 0x148, %i7
	ITLB_TAG_READ
	.word	0xe05aa0a8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0xb9, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x6c9, %i7
	LOAD_DDATA_ACCESS
	nop
	.word	0x1000000
	or	%g0, 0x050, %i7
	LOAD_IDATA_IN
	.word	0xfe5f2be8
thr0_MMU_ASI_SECONDARY_49:
	.word	0x87802081
	.word	0xd0b966e0
	.word	0xbe8420a8
	.word	0xe0dfd000
	.word	0xfe552fb2
	.word	0xc032a628
	.word	0xfe552dba
	.word	0x1000000
	or	%g0, 0x588, %i7
	ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfa7720b0
	.word	0xc026aab4
	.word	0x1000000
	or	%g0, 0x580, %i7
	READ_IDATA_ACCESS
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd27620f0
	.word	0xc032ab34
	.word	0x81c5e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v010_exit:
	EXIT_GOOD
Thr0_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10c DATA_VA=0x5f5000116000
attr_data {
	Name = .Thr0_User_Data_4v10c ,
	VA = 0x5f5000116000 ,/* 0x5f5000117fc0 */
	RA = 0x0390076000 ,
	PA = 0x0f90076000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f500011719d 8000000f90076440 */
	end_label   = Thr0_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10c_data_begin
Thr0_User_Data_4v10c_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v011 TEXT_VA=0x600000c80000
attr_text {
	Name = .Thr0_User_Text_4v011 ,
	VA = 0x600000c80000 ,/* 0x600000c8ffc0 */
	RA = 0x00c0c70000 ,
	PA = 0x0cc0c70000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000c81492 8000000cc0c70081 */
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
	.word	0xfe5aa2f0
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
	or	%g0, 0x5c0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x368, %i7
	DTLB_TAG_READ
	.word	0xf85f2068
	.word	0xc45aa128
	DDEMAP_PCTX
	.word	0xc02aaa7c
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x02b, %i7
	LOAD_DDATA_IN
	.word	0xc8762138
	.word	0xc0242bc8
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe846010
	.word	0xd6dfd060
	.word	0xd45e20a8
	.word	0xca742010
	.word	0xc032aca2
	.word	0xfe512da2
	.word	0xfe52aba6
	ACCESS_ITSB_PTR
	.word	0xfe5c23f0
	.word	0x1000000
	.word	0xbe104000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
thr0_MMU_ASI_PRIMARY_50:
	.word	0x87802080
	.word	0xe2f12090
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe85e20a8
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v011_exit:
	EXIT_GOOD
Thr0_User_Text_4v011_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10d DATA_VA=0x61002fc00000
attr_data {
	Name = .Thr0_User_Data_4v10d ,
	VA = 0x61002fc00000 ,/* 0x61002fffffc0 */
	RA = 0x0061800000 ,
	PA = 0x0861800000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000061002fc01492 8000000861800443 */
	end_label   = Thr0_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10d_data_begin
Thr0_User_Data_4v10d_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v012 TEXT_VA=0x620b40000000
attr_text {
	Name = .Thr0_User_Text_4v012 ,
	VA = 0x620b40000000 ,/* 0x620b4fffffc0 */
	RA = 0x0160000000 ,
	PA = 0x0160000000 ,
	TTE_Context = 0x1492 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000620b40001492 8000000160000085 */
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
	.word	0xfcd89000
	.word	0x1000000
	or	%g0, 0x081, %i7
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
	DDEMAP_ALL_PAGES
	.word	0xc072a650
	.word	0xc03625ae
	DDEMAP_ALL_PAGES
thr0_MMU_ASI_PRIMARY_51:
	.word	0x87802080
	.word	0xe0f42038
	.word	0x1000000
	or	%g0, 0x75c, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcdd1000
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x051, %i7
	LOAD_DDATA_IN
	.word	0xbe14c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x498, %i7
	ITLB_TAG_READ
	.word	0xe6742000
	.word	0xc0212288
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_SECONDARY_52:
	.word	0x87802081
	.word	0xecf16098
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda9100
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
	or	%g0, 0x008, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x02e, %i7
	LOAD_IDATA_IN
	.word	0xc0342eb4
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xbe8120b8
	.word	0xd4dfd000
	.word	0xfcd91000
	.word	0xbe8420a8
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x079, %i7
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
	ACCESS_ITSB_PTR
	DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr0_MMU_ASI_PRIMARY_53:
	.word	0x87802080
	.word	0xdaf520d0
	.word	0xfcde1000
	.word	0xc076a5d0
	ACCESS_DTSB_PTR
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
	.word	0xfcde1000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x40a, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe48aee7
	.word	0xc4742138
	.word	0xc030a170
	.word	0x1000000
	or	%g0, 0x73c, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
	nop
	nop
	.word	0xc02e2ec2
	.word	0x1000000
	or	%g0, 0x015, %i7
	LOAD_DDATA_IN
	.word	0xe05aa0e8
	.word	0xbe852148
	.word	0xf4dfd000
	ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe12c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c6e000
	.word	0xbe15c000
	GOTO_SUPERVISOR0
	.word	0xc0212dec
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr0_User_Text_4v012_exit:
	EXIT_GOOD
Thr0_User_Text_4v012_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10e DATA_VA=0x600000090000
attr_data {
	Name = .Thr0_User_Data_4v10e ,
	VA = 0x600000090000 ,/* 0x60000009ffc0 */
	RA = 0x00c02b0000 ,
	PA = 0x0cc02b0000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000600000091492 8000000cc02b0441 */
	end_label   = Thr0_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10e_data_begin
Thr0_User_Data_4v10e_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10f DATA_VA=0x5f5000090000
attr_data {
	Name = .Thr0_User_Data_4v10f ,
	VA = 0x5f5000090000 ,/* 0x5f5000091fc0 */
	RA = 0x0390004000 ,
	PA = 0x0f90004000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f500009119d 8000000f90004440 */
	end_label   = Thr0_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10f_data_begin
Thr0_User_Data_4v10f_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v110 DATA_VA=0x5f500007e000
attr_data {
	Name = .Thr0_User_Data_4v110 ,
	VA = 0x5f500007e000 ,/* 0x5f500007ffc0 */
	RA = 0x0390074000 ,
	PA = 0x0f90074000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00005f500007f19d 8000000f90074440 */
	end_label   = Thr0_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v110_data_begin
Thr0_User_Data_4v110_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v111 DATA_VA=0x610024c00000
attr_data {
	Name = .Thr0_User_Data_4v111 ,
	VA = 0x610024c00000 ,/* 0x610024ffffc0 */
	RA = 0x0060c00000 ,
	PA = 0x0860c00000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000610024c01492 8000000860c00443 */
	end_label   = Thr0_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v111_data_begin
Thr0_User_Data_4v111_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v112 DATA_VA=0x6000008a0000
attr_data {
	Name = .Thr0_User_Data_4v112 ,
	VA = 0x6000008a0000 ,/* 0x6000008affc0 */
	RA = 0x00c0f10000 ,
	PA = 0x0cc0f10000 ,
	TTE_Context = 0x1492 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006000008a1492 8000000cc0f10441 */
	end_label   = Thr0_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v112_data_begin
Thr0_User_Data_4v112_data_begin:
	.xword	0x600000240000
	.xword	0x600000c00000
	.xword	0x610004c00000
	.xword	0x600000080000
	.xword	0x5f500010c000
	.xword	0x5f5000170000
	.xword	0x600000330000
	.xword	0x5f50000dc000
	.xword	0x610022c00000
	.xword	0x5f5000094000
	.xword	0x610012400000
	.xword	0x5f500018c000
	.xword	0x61001c000000
	.xword	0x600000380000
	.xword	0x5f500011e000
	.xword	0x5f50000ee000
	.xword	0x5f5000118000
	.xword	0x61002a400000
	.xword	0x5f500006c000
	.xword	0x61003fc00000
	.xword	0x5f500012e000
	.xword	0x600000e60000
	.xword	0x600000880000
	.xword	0x61002dc00000
	.xword	0x5f500001e000
	.xword	0x600000400000
	.xword	0x6000003d0000
	.xword	0x5f50000f0000
	.xword	0x600000da0000
	.xword	0x5f500004e000
	.xword	0x600000b90000
	.xword	0x5f5000112000
	.xword	0x620400000000
	.xword	0x5f5000182000
	.xword	0x600000130000
	.xword	0x5f500007c000
	.xword	0x5f500006e000
	.xword	0x5f5000116000
	.xword	0x600000c80000
	.xword	0x61002fc00000
	.xword	0x620b40000000
	.xword	0x600000090000
	.xword	0x5f5000090000
	.xword	0x5f500007e000
	.xword	0x610024c00000
	.xword	0x6000008a0000
Thr0_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x6400006f0000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	VA = 0x6400006f0000 ,/* 0x6400006fffc0 */
	RA = 0x00d0770000 ,
	PA = 0x1cd0770000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006400006f1cb5 8000001cd0770081 */
	end_label   = Thr1_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr1_user_code_entry
Thr1_user_code_entry:
	setx	0x636000020000, %g1, %g2
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
	.word	0xd45c2130
	.word	0xc0776220
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x761, %i7
	LOAD_DDATA_ACCESS
	IDEMAP_ALL_RPAGES
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xbe82a0d0
	.word	0xf2dfd000
	.word	0xf070a0e8
	.word	0xc0776350
	.word	0xbe842100
	.word	0xe0dfd000
	IDEMAP_ALL_PAGES
	.word	0xbe85a098
	.word	0xecdfd000
	.word	0xc45da100
	IDEMAP_ALL_PAGES
	DDEMAP_PCTX
thr1_MMU_ASI_PRIMARY_54:
	.word	0x87802080
	.word	0xe8f0a088
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc035a89e
thr1_MMU_ASI_PRIMARY_55:
	.word	0x87802080
	.word	0xfaf5a098
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf6742120
	.word	0xc075a510
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v000_exit:
	EXIT_GOOD
Thr1_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v100 DATA_VA=0x636000020000
attr_data {
	Name = .Thr1_User_Data_4v100 ,
	VA = 0x636000020000 ,/* 0x636000021fc0 */
	RA = 0x03a000c000 ,
	PA = 0x03a000c000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000636000021cb5 80000003a000c040 */
	end_label   = Thr1_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v100_data_begin
Thr1_User_Data_4v100_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v200 DATA_VA=0x63600009a000
attr_data {
	Name = .Thr1_User_Data_4v200 ,
	VA = 0x63600009a000 ,/* 0x63600009bfc0 */
	RA = 0x03a0068000 ,
	PA = 0x03a0068000 ,
	TTE_Context = 0x09b2 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000063600009a9b2 80000003a0068440 */
	end_label   = Thr1_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v200_data_begin
Thr1_User_Data_4v200_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v300 DATA_VA=0x63600008e000
attr_data {
	Name = .Thr1_User_Data_4v300 ,
	VA = 0x63600008e000 ,/* 0x63600008ffc0 */
	RA = 0x03a01a8000 ,
	PA = 0x03a01a8000 ,
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
	/* DTTE_TAG_DATA = 000063600008e000 80000003a01a8440 */
	end_label   = Thr1_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v300_data_begin
Thr1_User_Data_4v300_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v001 TEXT_VA=0x6400005d0000
attr_text {
	Name = .Thr1_User_Text_4v001 ,
	VA = 0x6400005d0000 ,/* 0x6400005dffc0 */
	RA = 0x00d00d0000 ,
	PA = 0x1cd00d0000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006400005d1cb5 8000001cd00d0081 */
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
	DDEMAP_ALL_RPAGES
	.word	0xe075a068
	.word	0xc0242f48
thr1_MMU_ASI_PRIMARY_LITTLE_56:
	.word	0x87802088
	.word	0xf8b92330
	.word	0xf675a0b0
	.word	0xc027649c
	ACCESS_ITSB_PTR
	.word	0xfe52a6ea
	.word	0xfcda9000
	DDEMAP_ALL_PAGES
	.word	0xfcd89000
	.word	0xfe4424a8
	.word	0xec75a0c0
	.word	0xc02761d8
	.word	0x1000000
	or	%g0, 0x069, %i7
	LOAD_DDATA_IN
	.word	0xfcde5000
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
thr1_MMU_ASI_PRIMARY_57:
	.word	0x87802080
	.word	0xe6f2a118
thr1_MMU_ASI_PRIMARY_LITTLE_58:
	.word	0x87802088
	.word	0xf0f5a0a8
	.word	0x1000000
	or	%g0, 0x3e, %i7
	LOAD_IDATA_ACCESS
	.word	0xe8742028
	.word	0xc02aac79
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x60, %i7
	READ_DDATA_ACCESS
	.word	0xee592018
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf65aa0c0
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v001_exit:
	EXIT_GOOD
Thr1_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v400 TEXT_VA=0x6360000b6000
attr_text {
	Name = .Thr1_User_Text_4v400 ,
	VA = 0x6360000b6000 ,/* 0x6360000b7fc0 */
	RA = 0x03a0008000 ,
	PA = 0x03a0008000 ,
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
	/* ITTE_TAG_DATA = 00006360000b6000 80000003a0008480 */
	end_label   = Thr1_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v400_text_begin
Thr1_User_Text_4v400_text_begin:
	wrpr	0, %gl
	P_ACCESS_DTSB_PTR
	P_ACCESS_ITSB_PTR
thr1_MMU_ASI_BLK_P_59:
	.word	0x878020f0
	.word	0xe3bc2a40
thr1_MMU_ASI_AS_IF_USER_PRIMARY_60:
	.word	0x87802010
	.word	0xc8f42100
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	P_ITLB_TAG_READ
thr1_MMU_ASI_AS_IF_USER_PRIMARY_61:
	.word	0x87802010
	.word	0xd6f5a010
	.word	0xfcda8200
	.word	0x1000000
	or	%g0, 0x4a4, %i7
	P_LOAD_IDATA_ACCESS
thr1_MMU_ASI_AS_IF_USER_PRIMARY_62:
	.word	0x87802010
	.word	0xe6f5a0c8
	P_DDEMAP_ALL_PAGES
	P_ACCESS_ITSB_PTR
	.word	0xf674a098
	.word	0xc0332c94
	P_IDEMAP_ALL
	.word	0xbe8760b0
	.word	0xf2dfc200
	nop
thr1_MMU_ASI_REAL_IO_LITTLE_63:
	.word	0x8780201d
	.word	0xf0f12128
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v400_exit:
	EXIT_GOOD
Thr1_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v002 TEXT_VA=0x636000004000
attr_text {
	Name = .Thr1_User_Text_4v002 ,
	VA = 0x636000004000 ,/* 0x636000005fc0 */
	RA = 0x03a015c000 ,
	PA = 0x03a015c000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000636000005cb5 80000003a015c080 */
	end_label   = Thr1_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v002_text_begin
Thr1_User_Text_4v002_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_IM
	.word	0xfcdd03a0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_BLK_P_64:
	.word	0x878020f0
	.word	0xe3bdae80
	nop
	nop
	nop
	nop
	nop
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x08b, %i7
	P_LOAD_DDATA_IN
	P_DDEMAP_ALL_RPAGES
thr1_MMU_ASI_BLK_SL_65:
	.word	0x878020f9
	.word	0xc1b96540
	.word	0x1000000
	.word	0xbe144000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_IDEMAP_PCTX
	.word	0x1000000
	.word	0xbe144000
	P_IDEMAP_PAGE
	.word	0xc026ee98
	.word	0xfe4c2dcf
	nop
	nop
	nop
thr1_MMU_ASI_AS_IF_USER_PRIMARY_66:
	.word	0x87802010
	.word	0xe2f42040
thr1_MMU_ASI_PRIMARY_67:
	.word	0x87802080
	.word	0xeaf420a8
	P_TOGGLE_LSU_DM
	P_DDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9a9000
	P_TOGGLE_LSU_DM
	.word	0xfcda9000
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8420c0
	.word	0xe0dfc200
	.word	0xc19942e0
	.word	0xfcde5040
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf872a020
	.word	0xc076e660
thr1_MMU_ASI_PRIMARY_68:
	.word	0x87802080
	.word	0xcef6e0c8
	.word	0xfc9a9100
	P_IDEMAP_ALL
	.word	0xfe52ad1e
	.word	0xd076e028
	.word	0xc0366fdc
	.word	0x1000000
	or	%g0, 0x014, %i7
	P_LOAD_DDATA_IN
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v002_exit:
	EXIT_GOOD
Thr1_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v101 DATA_VA=0x6360001b4000
attr_data {
	Name = .Thr1_User_Data_4v101 ,
	VA = 0x6360001b4000 ,/* 0x6360001b5fc0 */
	RA = 0x03a0096000 ,
	PA = 0x03a0096000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006360001b5cb5 80000003a0096040 */
	end_label   = Thr1_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v101_data_begin
Thr1_User_Data_4v101_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v201 DATA_VA=0x636000098000
attr_data {
	Name = .Thr1_User_Data_4v201 ,
	VA = 0x636000098000 ,/* 0x636000099fc0 */
	RA = 0x03a008e000 ,
	PA = 0x03a008e000 ,
	TTE_Context = 0x09b2 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006360000989b2 80000003a008e440 */
	end_label   = Thr1_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v201_data_begin
Thr1_User_Data_4v201_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v301 DATA_VA=0x6400000b0000
attr_data {
	Name = .Thr1_User_Data_4v301 ,
	VA = 0x6400000b0000 ,/* 0x6400000bffc0 */
	RA = 0x00d0140000 ,
	PA = 0x00d0140000 ,
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
	/* DTTE_TAG_DATA = 00006400000b0000 80000000d0140441 */
	end_label   = Thr1_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v301_data_begin
Thr1_User_Data_4v301_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v003 TEXT_VA=0x640000990000
attr_text {
	Name = .Thr1_User_Text_4v003 ,
	VA = 0x640000990000 ,/* 0x64000099ffc0 */
	RA = 0x00d07d0000 ,
	PA = 0x1cd07d0000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000640000991cb5 8000001cd07d0081 */
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
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_RPAGE
	IDEMAP_ALL
	DDEMAP_PCTX
	.word	0xde72a0f8
	.word	0xc03424f6
	TOGGLE_LSU_IM
	IDEMAP_NCTX
	IDEMAP_ALL
	.word	0xfe45af24
	.word	0xd072a028
	.word	0xc0242140
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x7b, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	.word	0xfcde5140
	.word	0x1000000
	or	%g0, 0x1c8, %i7
	DTLB_TAG_READ
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xab, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe82e010
	.word	0xd6dfd020
	.word	0xfe52a23e
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_BLK_COMMIT_P_69:
	.word	0x878020e0
	.word	0xe1bc2380
	.word	0xfc9d9000
	.word	0x1000000
	or	%g0, 0x76e, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe85a138
	.word	0xe0dfd000
	.word	0xc02f6407
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
	.word	0xc02dace9
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	READ_IDATA_ACCESS
	.word	0xc0292efa
thr1_MMU_ASI_BLK_S_70:
	.word	0x878020f1
	.word	0xe1b96580
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	READ_DDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0292f04
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v003_exit:
	EXIT_GOOD
Thr1_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v401 TEXT_VA=0x636000160000
attr_text {
	Name = .Thr1_User_Text_4v401 ,
	VA = 0x636000160000 ,/* 0x636000161fc0 */
	RA = 0x03a0078000 ,
	PA = 0x03a0078000 ,
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
	/* ITTE_TAG_DATA = 0000636000160000 80000003a0078480 */
	end_label   = Thr1_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v401_text_begin
Thr1_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe144000
	P_DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x0ab, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x4c6, %i7
	P_LOAD_IDATA_ACCESS
	P_DDEMAP_ALL_PAGES
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_71:
	.word	0x87802022
	.word	0xf0bda250
	.word	0x1000000
	or	%g0, 0x06c, %i7
	P_LOAD_DDATA_IN
	.word	0xfcdc1140
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x7a6, %i7
	P_LOAD_DDATA_ACCESS
thr1_MMU_ASI_AS_IF_USER_PRIMARY_72:
	.word	0x87802010
	.word	0xf8f5a050
	.word	0xbe86e068
	.word	0xc4dfd000
	.word	0xfe54a5f0
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_TOGGLE_LSU_DM
	.word	0xfcda8200
	.word	0xfe5b20c8
thr1_MMU_ASI_AS_IF_USER_PRIMARY_73:
	.word	0x87802010
	.word	0xc8f6e038
	P_DDEMAP_PCTX
thr1_MMU_ASI_PRIMARY_74:
	.word	0x87802080
	.word	0xe8f5a028
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc19942e0
	.word	0x1000000
	or	%g0, 0x016, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x588, %i7
	P_READ_DDATA_ACCESS
	.word	0xfcd89000
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x5d8, %i7
	P_DTLB_TAG_READ
	.word	0xfcd903a0
thr1_MMU_ASI_BLK_P_75:
	.word	0x878020f0
	.word	0xc3bdaec0
	.word	0xc071a468
	.word	0x1000000
	or	%g0, 0x2a, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xe05de0c0
	.word	0x1000000
	or	%g0, 0x518, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x200, %i7
	P_READ_DDATA_ACCESS
	P_DDEMAP_ALL_PAGES
	P_DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x49e, %i7
	P_LOAD_IDATA_ACCESS
thr1_MMU_ASI_PRIMARY_76:
	.word	0x87802080
	.word	0xc4f420c0
	.word	0xbe168000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v401_exit:
	EXIT_GOOD
Thr1_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v004 TEXT_VA=0x640000430000
attr_text {
	Name = .Thr1_User_Text_4v004 ,
	VA = 0x640000430000 ,/* 0x64000043ffc0 */
	RA = 0x00d0860000 ,
	PA = 0x1cd0860000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000640000431cb5 8000001cd0860081 */
	end_label   = Thr1_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v004_text_begin
Thr1_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xfcda8200
	.word	0xfc995d60
	.word	0x1000000
	or	%g0, 0x04e, %i7
	P_LOAD_DDATA_IN
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	.word	0xe05da098
	.word	0x1000000
	or	%g0, 0x661, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfe4aa166
	.word	0xfcdc0200
	.word	0xbe842048
	.word	0xeedfc280
	.word	0x1000000
	or	%g0, 0x207, %i7
	P_LOAD_DDATA_ACCESS
	P_TOGGLE_LSU_IM
	P_IDEMAP_ALL_RPAGES
	.word	0xfcd94320
	nop
	nop
	nop
	nop
thr1_MMU_ASI_REAL_MEM_LITTLE_77:
	.word	0x8780201c
	.word	0xc6f5a0b8
	.word	0xc0766fa8
	P_TOGGLE_LSU_DM
	P_DDEMAP_ALL_PAGES
	P_TOGGLE_LSU_DM
	P_ACCESS_ITSB_PTR
	P_ACCESS_DTSB_PTR
	.word	0xfe42a178
	.word	0x1000000
	or	%g0, 0x77b, %i7
	P_LOAD_DDATA_ACCESS
thr1_MMU_ASI_PRIMARY_78:
	.word	0x87802080
	.word	0xd8f42018
	.word	0xfcda9000
	P_DDEMAP_ALL
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
thr1_MMU_ASI_BLK_P_79:
	.word	0x878020f0
	.word	0xc1baa140
	.word	0xfcdc1040
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x460, %i7
	P_LOAD_IDATA_ACCESS
	P_IDEMAP_ALL
	nop
thr1_MMU_ASI_AS_IF_USER_PRIMARY_80:
	.word	0x87802010
	.word	0xdaf2a0f8
	.word	0xfcdc0200
thr1_MMU_ASI_BLK_COMMIT_P_81:
	.word	0x878020e0
	.word	0xe1bc2f40
	.word	0x1000000
	.word	0xbe108000
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
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0xf0, %i7
	P_ITLB_TAG_READ
	.word	0xbe842138
	.word	0xe0dfc200
	.word	0xbe80a0f0
	.word	0xd4dfd000
	P_ACCESS_ITSB_PTR
	P_TOGGLE_LSU_DM
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v004_exit:
	EXIT_GOOD
Thr1_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v102 DATA_VA=0x636000054000
attr_data {
	Name = .Thr1_User_Data_4v102 ,
	VA = 0x636000054000 ,/* 0x636000055fc0 */
	RA = 0x03a01e8000 ,
	PA = 0x03a01e8000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000636000055cb5 80000003a01e8040 */
	end_label   = Thr1_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v102_data_begin
Thr1_User_Data_4v102_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v202 DATA_VA=0x636000122000
attr_data {
	Name = .Thr1_User_Data_4v202 ,
	VA = 0x636000122000 ,/* 0x636000123fc0 */
	RA = 0x03a009a000 ,
	PA = 0x03a009a000 ,
	TTE_Context = 0x09b2 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006360001229b2 80000003a009a440 */
	end_label   = Thr1_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v202_data_begin
Thr1_User_Data_4v202_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v302 DATA_VA=0x636000042000
attr_data {
	Name = .Thr1_User_Data_4v302 ,
	VA = 0x636000042000 ,/* 0x636000043fc0 */
	RA = 0x03a01b4000 ,
	PA = 0x03a01b4000 ,
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
	/* DTTE_TAG_DATA = 0000636000042000 80000003a01b4440 */
	end_label   = Thr1_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v302_data_begin
Thr1_User_Data_4v302_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v005 TEXT_VA=0x6400008b0000
attr_text {
	Name = .Thr1_User_Text_4v005 ,
	VA = 0x6400008b0000 ,/* 0x6400008bffc0 */
	RA = 0x00d0600000 ,
	PA = 0x1cd0600000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006400008b1cb5 8000001cd0600081 */
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
	or	%g0, 0x73d, %i7
	LOAD_DDATA_ACCESS
	.word	0xc0292ab0
	.word	0xe072a038
	.word	0xc035aa94
	.word	0x1000000
	or	%g0, 0x180, %i7
	DTLB_TAG_READ
	ACCESS_DTSB_PTR
	IDEMAP_NCTX
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcda9000
	.word	0xd8742018
	.word	0xc075a940
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_DDATA_ACCESS
	.word	0xfe52a916
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
thr1_MMU_ASI_PRIMARY_82:
	.word	0x87802080
	.word	0xd0f6e058
	.word	0xfe52a8f0
thr1_MMU_ASI_PRIMARY_83:
	.word	0x87802080
	.word	0xeaf120a8
	.word	0xfe5da678
	nop
	nop
	.word	0xfe58a9a0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc032a762
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v005_exit:
	EXIT_GOOD
Thr1_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v402 TEXT_VA=0x636000148000
attr_text {
	Name = .Thr1_User_Text_4v402 ,
	VA = 0x636000148000 ,/* 0x636000149fc0 */
	RA = 0x03a0006000 ,
	PA = 0x03a0006000 ,
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
	/* ITTE_TAG_DATA = 0000636000148000 80000003a0006480 */
	end_label   = Thr1_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v402_text_begin
Thr1_User_Text_4v402_text_begin:
	wrpr	0, %gl
thr1_MMU_ASI_AS_IF_USER_PRIMARY_84:
	.word	0x87802010
	.word	0xe4f2a018
	.word	0xc03326da
	.word	0xfcdc4220
	.word	0xbe842100
	.word	0xfadfd000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xc035e140
	.word	0xfcdc1000
	.word	0xbe842008
	.word	0xd4dfc200
	P_TOGGLE_LSU_DM
	P_IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x320, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe138000
	P_DDEMAP_PAGE
	P_ACCESS_DTSB_PTR
	.word	0xbe842138
	.word	0xc8dfc200
	.word	0xe39ec3c0
	.word	0xbe8760e0
	.word	0xecdfd000
	.word	0xfcded000
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
thr1_MMU_ASI_AS_IF_USER_PRIMARY_85:
	.word	0x87802010
	.word	0xc8f2a0b0
	P_TOGGLE_LSU_IM
thr1_MMU_ASI_PRIMARY_LITTLE_86:
	.word	0x87802088
	.word	0xf8f42000
thr1_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_87:
	.word	0x87802018
	.word	0xf6f420c0
thr1_MMU_ASI_BLK_P_88:
	.word	0x878020f0
	.word	0xc3bdab40
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr1_User_Text_4v402_exit:
	EXIT_GOOD
Thr1_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v006 TEXT_VA=0x63600008c000
attr_text {
	Name = .Thr1_User_Text_4v006 ,
	VA = 0x63600008c000 ,/* 0x63600008dfc0 */
	RA = 0x03a01fa000 ,
	PA = 0x03a01fa000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063600008dcb5 80000003a01fa080 */
	end_label   = Thr1_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v006_text_begin
Thr1_User_Text_4v006_text_begin:
	wrpr	0, %gl
thr1_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_89:
	.word	0x87802023
	.word	0xf4bc6e80
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe46e724
	nop
	nop
	nop
	.word	0xfe5aa8a0
	.word	0xfcdd9000
	P_IDEMAP_ALL
thr1_MMU_ASI_PRIMARY_90:
	.word	0x87802080
	.word	0xe6f420a8
	P_TOGGLE_LSU_IM
	P_IDEMAP_NCTX
thr1_MMU_ASI_SECONDARY_LITTLE_91:
	.word	0x87802089
	.word	0xc4bae830
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x558, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr1_User_Text_4v006_exit:
	EXIT_GOOD
Thr1_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v103 DATA_VA=0x63600013e000
attr_data {
	Name = .Thr1_User_Data_4v103 ,
	VA = 0x63600013e000 ,/* 0x63600013ffc0 */
	RA = 0x03a017a000 ,
	PA = 0x03a017a000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000063600013fcb5 80000003a017a040 */
	end_label   = Thr1_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v103_data_begin
Thr1_User_Data_4v103_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v303 DATA_VA=0x650023000000
attr_data {
	Name = .Thr1_User_Data_4v303 ,
	VA = 0x650023000000 ,/* 0x6500233fffc0 */
	RA = 0x0077800000 ,
	PA = 0x1877800000 ,
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
	/* DTTE_TAG_DATA = 0000650023000000 8000001877800443 */
	end_label   = Thr1_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v303_data_begin
Thr1_User_Data_4v303_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v007 TEXT_VA=0x6360001e0000
attr_text {
	Name = .Thr1_User_Text_4v007 ,
	VA = 0x6360001e0000 ,/* 0x6360001e1fc0 */
	RA = 0x03a01f6000 ,
	PA = 0x03a01f6000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006360001e1cb5 80000003a01f6080 */
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
	.word	0xbe82a130
	.word	0xecdfd000
	.word	0x1000000
	or	%g0, 0x6c0, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	.word	0xc02e651d
	.word	0xea776080
	.word	0xc072aa28
	.word	0x1000000
	or	%g0, 0x390, %i7
	READ_DDATA_ACCESS
	IDEMAP_NCTX
	.word	0xc032a3f4
	.word	0xf870a0a8
	.word	0xc02f647f
thr1_MMU_ASI_PRIMARY_92:
	.word	0x87802080
	.word	0xd8f76018
	.word	0xca742010
	.word	0xc02f6aa7
	.word	0xbe82a068
	.word	0xe0dfd000
	IDEMAP_ALL_PAGES
	.word	0xfa5f6098
	.word	0xbe846010
	.word	0xcadfd060
	IDEMAP_ALL
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4e644c
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v007_exit:
	EXIT_GOOD
Thr1_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v104 DATA_VA=0x640000520000
attr_data {
	Name = .Thr1_User_Data_4v104 ,
	VA = 0x640000520000 ,/* 0x64000052ffc0 */
	RA = 0x00d0970000 ,
	PA = 0x1cd0970000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000521cb5 8000001cd0970041 */
	end_label   = Thr1_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v104_data_begin
Thr1_User_Data_4v104_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v008 TEXT_VA=0x63600008a000
attr_text {
	Name = .Thr1_User_Text_4v008 ,
	VA = 0x63600008a000 ,/* 0x63600008bfc0 */
	RA = 0x03a0128000 ,
	PA = 0x03a0128000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063600008bcb5 80000003a0128080 */
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
	.word	0x1000000
	or	%g0, 0x59d, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr1_MMU_ASI_BLK_PL_93:
	.word	0x878020f8
	.word	0xe1baac00
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x42d, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe45a718
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x004, %i7
	LOAD_IDATA_IN
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x7d8, %i7
	DTLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x5cc, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	DDEMAP_ALL_PAGES
	IDEMAP_NCTX
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0x1000000
	or	%g0, 0x0b2, %i7
	LOAD_DDATA_IN
	DDEMAP_NCTX
	.word	0xfcdc1000
	.word	0xbe8760c0
	.word	0xf6dfd000
	.word	0xca5e6010
	.word	0xbe876138
	.word	0xf2dfd000
thr1_MMU_ASI_BLK_COMMIT_S_94:
	.word	0x878020e1
	.word	0xc1b96680
	.word	0x1000000
	or	%g0, 0x5d8, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xd4742098
	.word	0xc02c21e9
	.word	0x81c6a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v008_exit:
	EXIT_GOOD
Thr1_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v105 DATA_VA=0x640000b30000
attr_data {
	Name = .Thr1_User_Data_4v105 ,
	VA = 0x640000b30000 ,/* 0x640000b3ffc0 */
	RA = 0x00d0ad0000 ,
	PA = 0x1cd0ad0000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000b31cb5 8000001cd0ad0041 */
	end_label   = Thr1_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v105_data_begin
Thr1_User_Data_4v105_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v009 TEXT_VA=0x660fa0000000
attr_text {
	Name = .Thr1_User_Text_4v009 ,
	VA = 0x660fa0000000 ,/* 0x660fafffffc0 */
	RA = 0x0330000000 ,
	PA = 0x1f30000000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000660fa0001cb5 8000001f30000085 */
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
	.word	0x1000000
	.word	0xbe148000
	IDEMAP_RPAGE
	.word	0xfa5ee038
	.word	0xbe85a068
	.word	0xd4dfd000
thr1_MMU_ASI_PRIMARY_95:
	.word	0x87802080
	.word	0xfaf42068
	.word	0xc02f6147
	.word	0xbe842138
	.word	0xd4dfd000
	.word	0xd45c2098
	.word	0xbe120000
	GOTO_SUPERVISOR1
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x7f0, %i7
	READ_DDATA_ACCESS
	.word	0xfc9d9c40
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr1_MMU_ASI_BLK_COMMIT_P_96:
	.word	0x878020e0
	.word	0xc3be6140
	.word	0xc0742b78
	.word	0xd45c20e0
	.word	0xd45ee098
	TOGGLE_LSU_IM
	.word	0xc075aca0
	.word	0x1000000
	or	%g0, 0x140, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xec5da098
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe55abe6
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v009_exit:
	EXIT_GOOD
Thr1_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v106 DATA_VA=0x650021800000
attr_data {
	Name = .Thr1_User_Data_4v106 ,
	VA = 0x650021800000 ,/* 0x650021bfffc0 */
	RA = 0x007e400000 ,
	PA = 0x187e400000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000650021800f8a 800000187e400043 */
	end_label   = Thr1_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v106_data_begin
Thr1_User_Data_4v106_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00a TEXT_VA=0x6360000bc000
attr_text {
	Name = .Thr1_User_Text_4v00a ,
	VA = 0x6360000bc000 ,/* 0x6360000bdfc0 */
	RA = 0x03a003c000 ,
	PA = 0x03a003c000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006360000bdcb5 80000003a003c080 */
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
	.word	0xfe5e6858
	nop
	nop
	nop
	nop
	nop
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
	IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x98, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x410, %i7
	LOAD_DDATA_ACCESS
thr1_MMU_ASI_PRIMARY_97:
	.word	0x87802080
	.word	0xd8f76018
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0342f68
	ACCESS_ITSB_PTR
	DO_BRANCH
	.word	0x81c62000
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
	.word	0xfe4aab57
	.word	0xfe4c2456
	.word	0x1000000
	or	%g0, 0x788, %i7
	READ_DDATA_ACCESS
thr1_MMU_ASI_BLK_SL_98:
	.word	0x878020f9
	.word	0xe3b96e40
	.word	0xd27420c8
	.word	0xc03422f8
	nop
	nop
	nop
	.word	0xfe4aaa59
	.word	0xbe82a068
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x007, %i7
	LOAD_IDATA_IN
	.word	0xbe80a100
	.word	0xe0dfd000
	.word	0xc85da038
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xea75a080
	.word	0xc0342140
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xee5da018
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v00a_exit:
	EXIT_GOOD
Thr1_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v107 DATA_VA=0x6360000c0000
attr_data {
	Name = .Thr1_User_Data_4v107 ,
	VA = 0x6360000c0000 ,/* 0x6360000c1fc0 */
	RA = 0x03a0108000 ,
	PA = 0x03a0108000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006360000c1cb5 80000003a0108040 */
	end_label   = Thr1_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v107_data_begin
Thr1_User_Data_4v107_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00b TEXT_VA=0x636000104000
attr_text {
	Name = .Thr1_User_Text_4v00b ,
	VA = 0x636000104000 ,/* 0x636000105fc0 */
	RA = 0x03a00ee000 ,
	PA = 0x03a00ee000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000636000105cb5 80000003a00ee080 */
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
	.word	0xfe4f6d06
	.word	0x1000000
	or	%g0, 0x1b8, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x528, %i7
	READ_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd272a020
	.word	0xc032a2c2
	.word	0xfe4f6932
	.word	0xc02aa2eb
	.word	0xc02aa797
	.word	0xfe442500
	.word	0xfe4aa2e9
	.word	0xc070a2a0
	.word	0x1000000
	or	%g0, 0x150, %i7
	ITLB_TAG_READ
	ACCESS_ITSB_PTR
	.word	0xd6766070
	.word	0xc022a204
	.word	0xc672a080
	.word	0xc027671c
	.word	0xc025afec
	.word	0x1000000
	.word	0xbe114000
	DDEMAP_RPAGE
	.word	0xda776020
	.word	0xc02c2448
	nop
	nop
	.word	0xbe82a068
	.word	0xe0dfd000
	ACCESS_DTSB_PTR
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe56e926
thr1_MMU_ASI_PRIMARY_99:
	.word	0x87802080
	.word	0xd2f5a050
	.word	0xec72a098
	.word	0xc072a210
	.word	0x1000000
	.word	0xbe108000
	IDEMAP_PAGE
	.word	0xcc776048
	.word	0xc02da8d5
	.word	0xc07662f0
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5e6288
	.word	0x1000000
	or	%g0, 0x0a9, %i7
	LOAD_DDATA_IN
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc034227a
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00b_exit:
	EXIT_GOOD
Thr1_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v108 DATA_VA=0x65001d400000
attr_data {
	Name = .Thr1_User_Data_4v108 ,
	VA = 0x65001d400000 ,/* 0x65001d7fffc0 */
	RA = 0x0070000000 ,
	PA = 0x1870000000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000065001d400f8a 8000001870000043 */
	end_label   = Thr1_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v108_data_begin
Thr1_User_Data_4v108_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00c TEXT_VA=0x640000580000
attr_text {
	Name = .Thr1_User_Text_4v00c ,
	VA = 0x640000580000 ,/* 0x64000058ffc0 */
	RA = 0x00d0e50000 ,
	PA = 0x1cd0e50000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000640000581cb5 8000001cd0e50081 */
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
	.word	0xfe5aae68
	.word	0xfe5eebd0
	TOGGLE_LSU_IM
	.word	0xfe5aaf00
	.word	0xfe5da480
	TOGGLE_LSU_IM
	nop
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a110
	.word	0xd4dfd000
	.word	0xfcda9000
	IDEMAP_ALL
	IDEMAP_ALL_PAGES
	IDEMAP_ALL
	.word	0xec592120
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc02427fc
	.word	0x1000000
	or	%g0, 0x11e, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x580, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x630, %i7
	DTLB_TAG_READ
	nop
	nop
	.word	0x1000000
	.word	0xbe174000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x1d8, %i7
	ITLB_TAG_READ
	IDEMAP_ALL_RPAGES
	DDEMAP_PCTX
	nop
	nop
	nop
	nop
thr1_MMU_ASI_PRIMARY_100:
	.word	0x87802080
	.word	0xdcf66028
	.word	0x1000000
	or	%g0, 0x580, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	DDEMAP_NCTX
	.word	0xca776040
	.word	0xc037657e
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc032a970
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v00c_exit:
	EXIT_GOOD
Thr1_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v109 DATA_VA=0x660eb0000000
attr_data {
	Name = .Thr1_User_Data_4v109 ,
	VA = 0x660eb0000000 ,/* 0x660ebfffffc0 */
	RA = 0x0170000000 ,
	PA = 0x1d70000000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000660eb0001cb5 8000001d70000045 */
	end_label   = Thr1_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v109_data_begin
Thr1_User_Data_4v109_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00d TEXT_VA=0x6400001d0000
attr_text {
	Name = .Thr1_User_Text_4v00d ,
	VA = 0x6400001d0000 ,/* 0x6400001dffc0 */
	RA = 0x00d0cc0000 ,
	PA = 0x1cd0cc0000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006400001d1cb5 8000001cd0cc0081 */
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
	.word	0xc0342832
	.word	0xec592120
	.word	0x1000000
	.word	0xbe154000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc0342fc0
	.word	0xd6766040
	.word	0xc025a7c0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd4776100
	.word	0xc0342140
	.word	0xec5ee038
thr1_MMU_ASI_PRIMARY_101:
	.word	0x87802080
	.word	0xdcf66028
	.word	0x1000000
	.word	0xbe154000
	DDEMAP_PAGE
	.word	0xbe812100
	.word	0xe0dfd000
	TOGGLE_LSU_DM
	.word	0xfe5c26a0
	.word	0xd4592038
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe86e038
	.word	0xecdfd000
	DDEMAP_SCTX
	.word	0xfe4da18d
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	.word	0xc032a326
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe816010
	.word	0xd6dfd060
	.word	0xbe120000
	GOTO_SUPERVISOR1
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x150, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	.word	0xd275a0e8
	.word	0xc02f6b1f
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xd0742028
	.word	0xc032aaba
	.word	0xfe4425d8
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe55ac62
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr1_User_Text_4v00d_exit:
	EXIT_GOOD
Thr1_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10a DATA_VA=0x650010800000
attr_data {
	Name = .Thr1_User_Data_4v10a ,
	VA = 0x650010800000 ,/* 0x650010bfffc0 */
	RA = 0x0073400000 ,
	PA = 0x1873400000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000650010800f8a 8000001873400043 */
	end_label   = Thr1_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10a_data_begin
Thr1_User_Data_4v10a_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00e TEXT_VA=0x636000114000
attr_text {
	Name = .Thr1_User_Text_4v00e ,
	VA = 0x636000114000 ,/* 0x636000115fc0 */
	RA = 0x03a014e000 ,
	PA = 0x03a014e000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000636000115cb5 80000003a014e080 */
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
	.word	0xfa766008
	.word	0xc030a700
	nop
	nop
	nop
	.word	0xfe5aa148
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xbe85a038
	.word	0xecdfd000
	.word	0xfcdc1000
	IDEMAP_ALL
thr1_MMU_ASI_PRIMARY_102:
	.word	0x87802080
	.word	0xcaf2a040
	.word	0xfcdc1000
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc035aa82
	.word	0xfc9f5000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe442140
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00e_exit:
	EXIT_GOOD
Thr1_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10b DATA_VA=0x6360001d6000
attr_data {
	Name = .Thr1_User_Data_4v10b ,
	VA = 0x6360001d6000 ,/* 0x6360001d7fc0 */
	RA = 0x03a0140000 ,
	PA = 0x03a0140000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006360001d7cb5 80000003a0140040 */
	end_label   = Thr1_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10b_data_begin
Thr1_User_Data_4v10b_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00f TEXT_VA=0x63600014a000
attr_text {
	Name = .Thr1_User_Text_4v00f ,
	VA = 0x63600014a000 ,/* 0x63600014bfc0 */
	RA = 0x03a01d8000 ,
	PA = 0x03a01d8000 ,
	TTE_Context = 0x1cb5 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000063600014bcb5 80000003a01d8080 */
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
	or	%g0, 0x042, %i7
	LOAD_DDATA_IN
	.word	0xd8776018
	.word	0xc0292f75
	.word	0xfc995c60
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
thr1_MMU_ASI_PRIMARY_103:
	.word	0x87802080
	.word	0xc6f42000
	.word	0xd45f6098
	nop
thr1_MMU_ASI_PRIMARY_104:
	.word	0x87802080
	.word	0xd8f42018
	nop
	.word	0x1000000
	or	%g0, 0x491, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe5425e6
	.word	0xfcdc1000
	.word	0xfe4e6a62
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x43a, %i7
	LOAD_IDATA_ACCESS
thr1_MMU_ASI_BLK_P_105:
	.word	0x878020f0
	.word	0xc1be6140
	.word	0xd45e60b0
	.word	0xde742020
	.word	0xc0366640
	.word	0xfe4f6f90
	.word	0x1000000
	or	%g0, 0x058, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_NCTX
	IDEMAP_PCTX
	IDEMAP_PCTX
	.word	0xc0266960
	.word	0x1000000
	or	%g0, 0x49f, %i7
	LOAD_DDATA_ACCESS
	IDEMAP_ALL
	ACCESS_DTSB_PTR
	.word	0xd45f6120
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xee742018
	.word	0xc0742fc8
	.word	0x81c72000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr1_User_Text_4v00f_exit:
	EXIT_GOOD
Thr1_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10c DATA_VA=0x640000db0000
attr_data {
	Name = .Thr1_User_Data_4v10c ,
	VA = 0x640000db0000 ,/* 0x640000dbffc0 */
	RA = 0x00d0f30000 ,
	PA = 0x1cd0f30000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000640000db1cb5 8000001cd0f30041 */
	end_label   = Thr1_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10c_data_begin
Thr1_User_Data_4v10c_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v10d DATA_VA=0x636000070000
attr_data {
	Name = .Thr1_User_Data_4v10d ,
	VA = 0x636000070000 ,/* 0x636000071fc0 */
	RA = 0x03a01e0000 ,
	PA = 0x03a01e0000 ,
	TTE_Context = 0x1cb5 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000636000071cb5 80000003a01e0040 */
	end_label   = Thr1_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v10d_data_begin
Thr1_User_Data_4v10d_data_begin:
	.xword	0x6400006f0000
	.xword	0x636000020000
	.xword	0x63600009a000
	.xword	0x63600008e000
	.xword	0x6400005d0000
	.xword	0x6360000b6000
	.xword	0x636000004000
	.xword	0x6360001b4000
	.xword	0x636000098000
	.xword	0x6400000b0000
	.xword	0x640000990000
	.xword	0x636000160000
	.xword	0x640000430000
	.xword	0x636000054000
	.xword	0x636000122000
	.xword	0x636000042000
	.xword	0x6400008b0000
	.xword	0x636000148000
	.xword	0x63600008c000
	.xword	0x63600013e000
	.xword	0x650023000000
	.xword	0x6360001e0000
	.xword	0x640000520000
	.xword	0x63600008a000
	.xword	0x640000b30000
	.xword	0x660fa0000000
	.xword	0x650021800000
	.xword	0x6360000bc000
	.xword	0x6360000c0000
	.xword	0x636000104000
	.xword	0x65001d400000
	.xword	0x640000580000
	.xword	0x660eb0000000
	.xword	0x6400001d0000
	.xword	0x650010800000
	.xword	0x636000114000
	.xword	0x6360001d6000
	.xword	0x63600014a000
	.xword	0x640000db0000
	.xword	0x636000070000
Thr1_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x690025000000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	VA = 0x690025000000 ,/* 0x6900253fffc0 */
	RA = 0x0081c00000 ,
	PA = 0x2c81c00000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006900250009a9 8000002c81c00483 */
	end_label   = Thr2_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr2_user_code_entry
Thr2_user_code_entry:
	setx	0x690016800000, %g1, %g2
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
	.word	0x1000000
	or	%g0, 0x188, %i7
	DTLB_TAG_READ
	.word	0xfe45e4a4
	.word	0xfe5c2ef8
	.word	0xc02d26f5
thr2_MMU_ASI_PRIMARY_LITTLE_106:
	.word	0x87802088
	.word	0xe0f0a120
	.word	0x1000000
	.word	0xbe15c000
	DDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	IDEMAP_ALL_RPAGES
	.word	0xc022a900
	.word	0xda7520b8
	.word	0xc0712e40
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x55c, %i7
	LOAD_IDATA_ACCESS
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
	.word	0xfe52a504
	.word	0xc02428e8
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc076e730
	.word	0xbe842038
	.word	0xeedfd000
	.word	0x1000000
	or	%g0, 0xc0, %i7
	LOAD_DDATA_ACCESS
	ACCESS_DTSB_PTR
	ACCESS_DTSB_PTR
	.word	0xfe576046
	.word	0x1000000
	.word	0xbe110000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x7c0, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe54274c
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v000_exit:
	EXIT_GOOD
Thr2_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v100 DATA_VA=0x690016800000
attr_data {
	Name = .Thr2_User_Data_4v100 ,
	VA = 0x690016800000 ,/* 0x690016bfffc0 */
	RA = 0x0085c00000 ,
	PA = 0x2c85c00000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006900168009a9 8000002c85c00043 */
	end_label   = Thr2_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v100_data_begin
Thr2_User_Data_4v100_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v200 DATA_VA=0x677000128000
attr_data {
	Name = .Thr2_User_Data_4v200 ,
	VA = 0x677000128000 ,/* 0x677000129fc0 */
	RA = 0x03b00d6000 ,
	PA = 0x03b00d6000 ,
	TTE_Context = 0x04a8 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006770001284a8 80000003b00d6440 */
	end_label   = Thr2_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v200_data_begin
Thr2_User_Data_4v200_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v300 DATA_VA=0x67700018e000
attr_data {
	Name = .Thr2_User_Data_4v300 ,
	VA = 0x67700018e000 ,/* 0x67700018ffc0 */
	RA = 0x03b0002000 ,
	PA = 0x03b0002000 ,
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
	/* DTTE_TAG_DATA = 000067700018e000 80000003b0002440 */
	end_label   = Thr2_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v300_data_begin
Thr2_User_Data_4v300_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v001 TEXT_VA=0x6800004c0000
attr_text {
	Name = .Thr2_User_Text_4v001 ,
	VA = 0x6800004c0000 ,/* 0x6800004cffc0 */
	RA = 0x00e0c60000 ,
	PA = 0x00e0c60000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006800004c09a9 80000000e0c60481 */
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
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd1000
	.word	0xbe86e0b0
	.word	0xc8dfd000
	.word	0xfcddd140
	.word	0xfcdc1000
	.word	0xc02c28f7
	.word	0x1000000
	or	%g0, 0x5d3, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe452494
	.word	0xc45c20d0
thr2_MMU_ASI_PRIMARY_107:
	.word	0x87802080
	.word	0xe8f2a138
	.word	0x1000000
	or	%g0, 0x07a, %i7
	LOAD_IDATA_IN
	.word	0xe39d1f00
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc075ec98
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_DTSB_PTR
	.word	0xc02c25c0
	.word	0x1000000
	or	%g0, 0x388, %i7
	DTLB_TAG_READ
	ACCESS_DTSB_PTR
	.word	0xfcda9000
	DDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x438, %i7
	ITLB_TAG_READ
	IDEMAP_PCTX
thr2_MMU_ASI_PRIMARY_108:
	.word	0x87802080
	.word	0xf4f2a118
	.word	0xfe5c27b0
	.word	0x1000000
	or	%g0, 0x590, %i7
	LOAD_DDATA_ACCESS
	.word	0xe3995f20
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x087, %i7
	LOAD_IDATA_IN
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfcd91000
	IDEMAP_ALL
	TOGGLE_LSU_IM
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x3f8, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe442b8c
	DDEMAP_ALL_PAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc02aa396
	.word	0x1000000
	or	%g0, 0x008, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe164000
	DDEMAP_RPAGE
	.word	0xfe4c270d
	.word	0xde752020
	.word	0xc072ab78
	.word	0x1000000
	or	%g0, 0x80, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x031, %i7
	LOAD_IDATA_IN
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x60, %i7
	ITLB_TAG_READ
	ACCESS_DTSB_PTR
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
thr2_MMU_ASI_PRIMARY_109:
	.word	0x87802080
	.word	0xd0f5e058
	.word	0x1000000
	or	%g0, 0x9a, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe85e088
	.word	0xd4dfd000
	.word	0xfe5f69a8
	.word	0xee5aa038
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc07525e8
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v001_exit:
	EXIT_GOOD
Thr2_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v400 TEXT_VA=0x677000184000
attr_text {
	Name = .Thr2_User_Text_4v400 ,
	VA = 0x677000184000 ,/* 0x677000185fc0 */
	RA = 0x03b0016000 ,
	PA = 0x03b0016000 ,
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
	/* ITTE_TAG_DATA = 0000677000184000 80000003b0016080 */
	end_label   = Thr2_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v400_text_begin
Thr2_User_Text_4v400_text_begin:
	wrpr	0, %gl
thr2_MMU_ASI_BLK_COMMIT_S_110:
	.word	0x878020e1
	.word	0xe1b961c0
	.word	0xfe49ae15
	.word	0xfe59ad70
	P_IDEMAP_NCTX
thr2_MMU_ASI_AS_IF_USER_PRIMARY_111:
	.word	0x87802010
	.word	0xd4f6e120
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x7d0, %i7
	P_READ_DDATA_ACCESS
	.word	0xfcded000
thr2_MMU_ASI_AS_IF_USER_PRIMARY_112:
	.word	0x87802010
	.word	0xf0f5e078
	.word	0xfe41adb4
	P_TOGGLE_LSU_DM
	.word	0xfcdb42a0
	.word	0x1000000
	or	%g0, 0x054, %i7
	P_LOAD_DDATA_IN
	.word	0xfcdec200
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	P_READ_IDATA_ACCESS
thr2_MMU_ASI_BLK_P_113:
	.word	0x878020f0
	.word	0xc3bc2a80
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v400_exit:
	EXIT_GOOD
Thr2_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v002 TEXT_VA=0x6770001c2000
attr_text {
	Name = .Thr2_User_Text_4v002 ,
	VA = 0x6770001c2000 ,/* 0x6770001c3fc0 */
	RA = 0x03b0144000 ,
	PA = 0x03b0144000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006770001c29a9 80000003b0144480 */
	end_label   = Thr2_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v002_text_begin
Thr2_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xe85aa0a0
	.word	0xbe852100
	.word	0xd4dfd000
	.word	0xbe8420e0
	.word	0xeedfc200
	.word	0xc875e038
	.word	0xc032a8b2
	.word	0x1000000
	or	%g0, 0xa4, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
thr2_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_114:
	.word	0x87802023
	.word	0xd8b96280
	.word	0x1000000
	.word	0xbe174000
	P_IDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x0a9, %i7
	P_LOAD_DDATA_IN
	P_TOGGLE_LSU_DM
	.word	0xc45d2038
	P_DDEMAP_NCTX
	.word	0xfcdc1000
	nop
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x137, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5c, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR0
	nop
Thr2_User_Text_4v002_exit:
	EXIT_GOOD
Thr2_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v101 DATA_VA=0x6800000e0000
attr_data {
	Name = .Thr2_User_Data_4v101 ,
	VA = 0x6800000e0000 ,/* 0x6800000effc0 */
	RA = 0x00e0e20000 ,
	PA = 0x00e0e20000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800000e09a9 80000000e0e20041 */
	end_label   = Thr2_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v101_data_begin
Thr2_User_Data_4v101_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v201 DATA_VA=0x690024400000
attr_data {
	Name = .Thr2_User_Data_4v201 ,
	VA = 0x690024400000 ,/* 0x6900247fffc0 */
	RA = 0x0088000000 ,
	PA = 0x2c88000000 ,
	TTE_Context = 0x04a8 ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_1 ,
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
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 00006900244004a8 8000002c88000443 */
	end_label   = Thr2_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v201_data_begin
Thr2_User_Data_4v201_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v301 DATA_VA=0x680000610000
attr_data {
	Name = .Thr2_User_Data_4v301 ,
	VA = 0x680000610000 ,/* 0x68000061ffc0 */
	RA = 0x00e0d10000 ,
	PA = 0x00e0d10000 ,
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
	/* DTTE_TAG_DATA = 0000680000610000 80000000e0d10441 */
	end_label   = Thr2_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v301_data_begin
Thr2_User_Data_4v301_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v003 TEXT_VA=0x677000034000
attr_text {
	Name = .Thr2_User_Text_4v003 ,
	VA = 0x677000034000 ,/* 0x677000035fc0 */
	RA = 0x03b0112000 ,
	PA = 0x03b0112000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006770000349a9 80000003b0112480 */
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
	.word	0xc02429a0
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	READ_IDATA_ACCESS
	.word	0xbe85e068
	.word	0xfadfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc026ef84
thr2_MMU_ASI_PRIMARY_115:
	.word	0x87802080
	.word	0xcaf76010
	.word	0x1000000
	or	%g0, 0x7a0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	ITLB_TAG_READ
	.word	0xfe5c2a88
	.word	0xfc991000
	.word	0xbe158000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x102, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x90, %i7
	READ_IDATA_ACCESS
	DDEMAP_ALL
	nop
	.word	0xc0242644
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe82a120
	.word	0xc8dfd000
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	ITLB_TAG_READ
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
	.word	0xfc9c1c40
	DDEMAP_SCTX
	DDEMAP_ALL_RPAGES
	.word	0xfe4d2ff4
	DO_BRANCH
	.word	0x81c4a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xee76e008
	.word	0xc0342e48
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v003_exit:
	EXIT_GOOD
Thr2_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v401 TEXT_VA=0x69002c800000
attr_text {
	Name = .Thr2_User_Text_4v401 ,
	VA = 0x69002c800000 ,/* 0x69002cbfffc0 */
	RA = 0x0081000000 ,
	PA = 0x0081000000 ,
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
	/* ITTE_TAG_DATA = 000069002c800000 8000000081000083 */
	end_label   = Thr2_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v401_text_begin
Thr2_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x48, %i7
	P_ITLB_TAG_READ
	.word	0xfe49a57c
	.word	0x1000000
	.word	0xbe174000
	P_DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x28, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x099, %i7
	P_LOAD_DDATA_IN
	.word	0xe059a0e0
	.word	0xc0232670
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	nop
	.word	0xfc998580
thr2_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_116:
	.word	0x8780202a
	.word	0xd8beef00
	.word	0xfcdec300
	.word	0xfcd91000
	.word	0x1000000
	or	%g0, 0x450, %i7
	P_LOAD_IDATA_ACCESS
	P_TOGGLE_LSU_DM
thr2_MMU_ASI_PRIMARY_117:
	.word	0x87802080
	.word	0xf6f6e100
	.word	0xbe8520b0
	.word	0xd4dfd040
thr2_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_118:
	.word	0x8780202a
	.word	0xd8beea60
	P_DDEMAP_ALL_RPAGES
thr2_MMU_ASI_REAL_IO_119:
	.word	0x87802015
	.word	0xf4f720f8
thr2_MMU_ASI_PRIMARY_LITTLE_120:
	.word	0x87802088
	.word	0xfcbf68b0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x0, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe134000
	P_DDEMAP_RPAGE
	.word	0xbe8420e0
	.word	0xd4dfc200
	P_ACCESS_ITSB_PTR
thr2_MMU_ASI_AS_IF_USER_PRIMARY_121:
	.word	0x87802010
	.word	0xd2f6e0f8
thr2_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_122:
	.word	0x8780202a
	.word	0xd8bc2d80
	.word	0x1000000
	.word	0xbe108000
	P_IDEMAP_RPAGE
	P_TOGGLE_LSU_IM
	.word	0xd459a140
	.word	0xbe816010
	.word	0xc19fc2e0
	.word	0x1000000
	or	%g0, 0x59a, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x120, %i7
	P_DTLB_TAG_READ
thr2_MMU_ASI_AS_IF_USER_PRIMARY_123:
	.word	0x87802010
	.word	0xd2f76020
	.word	0xfe5c6148
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe148000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v401_exit:
	EXIT_GOOD
Thr2_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v004 TEXT_VA=0x680000110000
attr_text {
	Name = .Thr2_User_Text_4v004 ,
	VA = 0x680000110000 ,/* 0x68000011ffc0 */
	RA = 0x00e0bc0000 ,
	PA = 0x00e0bc0000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006800001109a9 80000000e0bc0481 */
	end_label   = Thr2_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v004_text_begin
Thr2_User_Text_4v004_text_begin:
	wrpr	0, %gl
thr2_MMU_ASI_PRIMARY_124:
	.word	0x87802080
	.word	0xf6f42068
thr2_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_125:
	.word	0x87802023
	.word	0xe4bae620
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x480, %i7
	P_ITLB_TAG_READ
thr2_MMU_ASI_AS_IF_USER_PRIMARY_126:
	.word	0x87802010
	.word	0xeaf6e090
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc025e9e0
	.word	0xfcd89000
	nop
	nop
	nop
	nop
	nop
	.word	0xc0252628
	.word	0xfcd89140
thr2_MMU_ASI_AS_IF_USER_PRIMARY_127:
	.word	0x87802010
	.word	0xeaf42020
	.word	0xfc9e5100
	.word	0xbe168000
	RETURN_FROM_SUPERVISOR0
	nop
Thr2_User_Text_4v004_exit:
	EXIT_GOOD
Thr2_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v102 DATA_VA=0x680000120000
attr_data {
	Name = .Thr2_User_Data_4v102 ,
	VA = 0x680000120000 ,/* 0x68000012ffc0 */
	RA = 0x00e0c80000 ,
	PA = 0x00e0c80000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800001209a9 80000000e0c80041 */
	end_label   = Thr2_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v102_data_begin
Thr2_User_Data_4v102_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v302 DATA_VA=0x680000af0000
attr_data {
	Name = .Thr2_User_Data_4v302 ,
	VA = 0x680000af0000 ,/* 0x680000afffc0 */
	RA = 0x00e0490000 ,
	PA = 0x00e0490000 ,
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
	/* DTTE_TAG_DATA = 0000680000af0000 80000000e0490441 */
	end_label   = Thr2_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v302_data_begin
Thr2_User_Data_4v302_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v005 TEXT_VA=0x6770001a8000
attr_text {
	Name = .Thr2_User_Text_4v005 ,
	VA = 0x6770001a8000 ,/* 0x6770001a9fc0 */
	RA = 0x03b01f4000 ,
	PA = 0x03b01f4000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006770001a89a9 80000003b01f4480 */
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
	DDEMAP_SCTX
thr2_MMU_ASI_SECONDARY_LITTLE_128:
	.word	0x87802089
	.word	0xe0f16130
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_ALL
	DDEMAP_PCTX
	.word	0xce72a0c8
	.word	0xc026e6dc
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd272a030
	.word	0xc0292523
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xea752108
	.word	0xc03521cc
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc02c272e
	.word	0x1000000
	or	%g0, 0x6c, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0xc7, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_PAGE
	.word	0xbe842088
	.word	0xe0dfd000
	.word	0xc02aaf83
	.word	0xcc5ee018
	.word	0xc02aa4f5
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	ITLB_TAG_READ
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x698, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe134000
	IDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe52a0b6
	nop
	nop
	nop
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
	or	%g0, 0x120, %i7
	READ_IDATA_ACCESS
	.word	0xc02c246b
	.word	0xbe124000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	IDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_PAGE
	TOGGLE_LSU_IM
	TOGGLE_LSU_DM
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xee58a0a0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v005_exit:
	EXIT_GOOD
Thr2_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v402 TEXT_VA=0x690011400000
attr_text {
	Name = .Thr2_User_Text_4v402 ,
	VA = 0x690011400000 ,/* 0x6900117fffc0 */
	RA = 0x0087000000 ,
	PA = 0x0087000000 ,
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
	/* ITTE_TAG_DATA = 0000690011400000 8000000087000083 */
	end_label   = Thr2_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v402_text_begin
Thr2_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_IDEMAP_PCTX
thr2_MMU_ASI_PRIMARY_129:
	.word	0x87802080
	.word	0xd8f2a018
	.word	0xfc9a9c40
	.word	0xfcdc1000
	P_ACCESS_ITSB_PTR
	P_DDEMAP_NCTX
	.word	0x1000000
	.word	0xbe100000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x600, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe124000
	P_IDEMAP_RPAGE
	.word	0xc0732d68
	P_ACCESS_ITSB_PTR
	.word	0xc02c6211
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x258, %i7
	P_READ_DDATA_ACCESS
thr2_MMU_ASI_AS_IF_USER_PRIMARY_130:
	.word	0x87802010
	.word	0xc6f0a050
	.word	0xfc9b0480
	.word	0x1000000
	or	%g0, 0x225, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcddd000
	.word	0x1000000
	.word	0xbe128000
	P_IDEMAP_PAGE
	.word	0xfe51ab34
	nop
	nop
	P_TOGGLE_LSU_IM
thr2_MMU_ASI_AS_IF_USER_PRIMARY_131:
	.word	0x87802010
	.word	0xf4f42030
	P_IDEMAP_ALL
	.word	0xfe49a7c8
	.word	0xc859a120
	.word	0x1000000
	or	%g0, 0x459, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe812008
	.word	0xeedfd000
	.word	0xbe862110
	.word	0xe8dfc280
	.word	0x1000000
	or	%g0, 0x08d, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_IDEMAP_ALL_PAGES
	.word	0xfcda9000
	.word	0xbe842120
	.word	0xf6dfc200
	.word	0xfcded000
	.word	0xfcdc1000
thr2_MMU_ASI_AS_IF_USER_PRIMARY_132:
	.word	0x87802010
	.word	0xcaf52010
	.word	0xfc9985e0
	.word	0xec71a028
	.word	0xc029a211
	.word	0xc071ad90
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v402_exit:
	EXIT_GOOD
Thr2_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v103 DATA_VA=0x690030c00000
attr_data {
	Name = .Thr2_User_Data_4v103 ,
	VA = 0x690030c00000 ,/* 0x690030ffffc0 */
	RA = 0x0082400000 ,
	PA = 0x2c82400000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000690030c009a9 8000002c82400043 */
	end_label   = Thr2_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v103_data_begin
Thr2_User_Data_4v103_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v006 TEXT_VA=0x69002b400000
attr_text {
	Name = .Thr2_User_Text_4v006 ,
	VA = 0x69002b400000 ,/* 0x69002b7fffc0 */
	RA = 0x0082800000 ,
	PA = 0x2c82800000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000069002b4009a9 8000002c82800483 */
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
	.word	0x1000000
	or	%g0, 0x02b, %i7
	LOAD_IDATA_IN
	.word	0xd45e6088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe842068
	.word	0xfadfd000
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x013, %i7
	LOAD_DDATA_IN
	.word	0xfe442bd8
	.word	0xc8766140
	.word	0xc036655a
	.word	0x1000000
	or	%g0, 0x728, %i7
	READ_DDATA_ACCESS
	.word	0xfc9a9c40
	.word	0x1000000
	or	%g0, 0xf8, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x049, %i7
	LOAD_IDATA_IN
	.word	0xc0766c90
	.word	0xe39c1e00
	.word	0x1000000
	or	%g0, 0xa0, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x046, %i7
	LOAD_DDATA_IN
thr2_MMU_ASI_PRIMARY_133:
	.word	0x87802080
	.word	0xc4f12038
	DDEMAP_NCTX
	.word	0xbe82a0c0
	.word	0xeedfd000
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe5d23b8
	nop
	nop
	.word	0x1000000
	or	%g0, 0x27f, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x040, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x38, %i7
	READ_DDATA_ACCESS
	.word	0xe475e050
	.word	0xc0212b3c
	.word	0x1000000
	.word	0xbe10c000
	IDEMAP_RPAGE
thr2_MMU_ASI_PRIMARY_134:
	.word	0x87802080
	.word	0xdef42108
	nop
	.word	0xfa58a008
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
	.word	0xfe56e376
	.word	0x1000000
	or	%g0, 0x85, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL
	DDEMAP_ALL
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	.word	0xf25aa038
	IDEMAP_PCTX
	IDEMAP_ALL_RPAGES
	.word	0xca742010
	.word	0xc02c278b
	.word	0xd45de0b0
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x50c, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x390, %i7
	DTLB_TAG_READ
	.word	0xbe842080
	.word	0xc19fde00
	.word	0xc0776ce8
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	ITLB_TAG_READ
	.word	0xbe158000
	GOTO_SUPERVISOR1
	.word	0xf25c2088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v006_exit:
	EXIT_GOOD
Thr2_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v403 TEXT_VA=0x6a0170000000
attr_text {
	Name = .Thr2_User_Text_4v403 ,
	VA = 0x6a0170000000 ,/* 0x6a017fffffc0 */
	RA = 0x0340000000 ,
	PA = 0x2f40000000 ,
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
	/* ITTE_TAG_DATA = 00006a0170000000 8000002f40000085 */
	end_label   = Thr2_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v403_text_begin
Thr2_User_Text_4v403_text_begin:
	wrpr	0, %gl
	.word	0xbe842158
	.word	0xe8dfd000
thr2_MMU_ASI_BLK_P_135:
	.word	0x878020f0
	.word	0xe1bdea40
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	.word	0xbe150000
	P_DDEMAP_RPAGE
	P_TOGGLE_LSU_IM
	.word	0xbe8420e0
	.word	0xc39fc2c0
	.word	0xfc9ad020
	P_ACCESS_DTSB_PTR
	P_DDEMAP_PCTX
	P_TOGGLE_LSU_DM
thr2_MMU_ASI_PRIMARY_136:
	.word	0x87802080
	.word	0xe0bc2db0
	nop
	nop
	nop
	P_TOGGLE_LSU_DM
thr2_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_137:
	.word	0x87802022
	.word	0xfcbf6ed0
	.word	0x1000000
	or	%g0, 0x728, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x093, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x053, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	P_READ_IDATA_ACCESS
	P_TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe100000
	P_IDEMAP_PAGE
	.word	0xfcdd1140
	.word	0xfcda8200
thr2_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_138:
	.word	0x8780202a
	.word	0xf8baaf60
	.word	0x1000000
	or	%g0, 0x638, %i7
	P_READ_DDATA_ACCESS
thr2_MMU_ASI_PRIMARY_139:
	.word	0x87802080
	.word	0xd4f2a0a0
	.word	0x1000000
	or	%g0, 0xd8, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr2_User_Text_4v403_exit:
	EXIT_GOOD
Thr2_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v104 DATA_VA=0x680000920000
attr_data {
	Name = .Thr2_User_Data_4v104 ,
	VA = 0x680000920000 ,/* 0x68000092ffc0 */
	RA = 0x00e0a60000 ,
	PA = 0x00e0a60000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800009209a9 80000000e0a60041 */
	end_label   = Thr2_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v104_data_begin
Thr2_User_Data_4v104_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v007 TEXT_VA=0x6a01b0000000
attr_text {
	Name = .Thr2_User_Text_4v007 ,
	VA = 0x6a01b0000000 ,/* 0x6a01bfffffc0 */
	RA = 0x0040000000 ,
	PA = 0x2840000000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006a01b00009a9 8000002840000485 */
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
	.word	0xbe842068
	.word	0xfadfd000
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
	.word	0xd45d20e0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr2_MMU_ASI_PRIMARY_LITTLE_140:
	.word	0x87802088
	.word	0xcef420e8
	.word	0xd072a028
	.word	0xc02e6991
	.word	0xbe86e100
	.word	0xfadfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xce75e060
	.word	0xc02525ec
	nop
	nop
	nop
	nop
	nop
	nop
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
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x2a8, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_DM
	DDEMAP_ALL
	TOGGLE_LSU_DM
thr2_MMU_ASI_PRIMARY_LITTLE_141:
	.word	0x87802088
	.word	0xf6f5e0d0
	TOGGLE_LSU_IM
thr2_MMU_ASI_PRIMARY_142:
	.word	0x87802080
	.word	0xfaf52068
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc0252160
	.word	0x1000000
	.word	0xbe13c000
	DDEMAP_PAGE
	.word	0xbe86e068
	.word	0xe0dfd000
	ACCESS_DTSB_PTR
	nop
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe14c000
	GOTO_SUPERVISOR1
	.word	0xc025e8d8
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v007_exit:
	EXIT_GOOD
Thr2_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v105 DATA_VA=0x677000022000
attr_data {
	Name = .Thr2_User_Data_4v105 ,
	VA = 0x677000022000 ,/* 0x677000023fc0 */
	RA = 0x03b018e000 ,
	PA = 0x03b018e000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006770000229a9 80000003b018e040 */
	end_label   = Thr2_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v105_data_begin
Thr2_User_Data_4v105_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v008 TEXT_VA=0x680000790000
attr_text {
	Name = .Thr2_User_Text_4v008 ,
	VA = 0x680000790000 ,/* 0x68000079ffc0 */
	RA = 0x00e0e30000 ,
	PA = 0x00e0e30000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006800007909a9 80000000e0e30481 */
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
thr2_MMU_ASI_BLK_COMMIT_P_143:
	.word	0x878020e0
	.word	0xe3bc2140
	.word	0x1000000
	or	%g0, 0x0aa, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x030, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe128000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc0266c24
	TOGGLE_LSU_IM
	.word	0xd4592068
	DDEMAP_SCTX
	IDEMAP_ALL
	.word	0xd45e60b0
	.word	0x1000000
	or	%g0, 0x054, %i7
	LOAD_DDATA_IN
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0xfe56efa8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc02eef05
	.word	0xee5d20b0
	.word	0x1000000
	or	%g0, 0x5be, %i7
	LOAD_IDATA_ACCESS
	.word	0xc0742160
	.word	0xbe82e010
	.word	0xcadfd020
	.word	0xc6742020
	.word	0xc0242b94
	.word	0xbe816010
	.word	0xcadfd020
	.word	0xee5aa0a0
	.word	0xfe5eebe0
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xce766020
	.word	0xc0742be0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v008_exit:
	EXIT_GOOD
Thr2_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v106 DATA_VA=0x680000dc0000
attr_data {
	Name = .Thr2_User_Data_4v106 ,
	VA = 0x680000dc0000 ,/* 0x680000dcffc0 */
	RA = 0x00e01f0000 ,
	PA = 0x00e01f0000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000dc09a9 80000000e01f0041 */
	end_label   = Thr2_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v106_data_begin
Thr2_User_Data_4v106_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v009 TEXT_VA=0x6770000c2000
attr_text {
	Name = .Thr2_User_Text_4v009 ,
	VA = 0x6770000c2000 ,/* 0x6770000c3fc0 */
	RA = 0x03b00d8000 ,
	PA = 0x03b00d8000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006770000c29a9 80000003b00d8480 */
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
	.word	0xbe13c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xe25ee018
	.word	0xe85de068
	.word	0xfcddd000
	.word	0xbe876088
	.word	0xeedfd000
	nop
	nop
	nop
	.word	0xe05de068
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x488, %i7
	DTLB_TAG_READ
	.word	0xc8776088
	.word	0xc03528a6
thr2_MMU_ASI_PRIMARY_144:
	.word	0x87802080
	.word	0xe4f2a050
	.word	0x1000000
	.word	0xbe128000
	IDEMAP_PAGE
thr2_MMU_ASI_PRIMARY_145:
	.word	0x87802080
	.word	0xf0f2a078
	.word	0xbe876088
	.word	0xd4dfd000
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc022aab4
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe842158
	.word	0xe0dfd000
	.word	0xd85aa018
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x7e0, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	TOGGLE_LSU_DM
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x5a, %i7
	LOAD_DDATA_ACCESS
	.word	0xc07768b8
	nop
	nop
	nop
	nop
	nop
	.word	0xc0242d98
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x448, %i7
	READ_DDATA_ACCESS
	.word	0xbe8420d0
	.word	0xfadfd000
	.word	0xe05d2088
	.word	0x1000000
	or	%g0, 0x178, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0xfe4425dc
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x160, %i7
	LOAD_DDATA_ACCESS
	.word	0xd45e6140
	ACCESS_ITSB_PTR
	.word	0xc072a160
	.word	0xfe442e00
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
	.word	0xec766058
	.word	0xc02e669a
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v009_exit:
	EXIT_GOOD
Thr2_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v107 DATA_VA=0x6800003c0000
attr_data {
	Name = .Thr2_User_Data_4v107 ,
	VA = 0x6800003c0000 ,/* 0x6800003cffc0 */
	RA = 0x00e08b0000 ,
	PA = 0x00e08b0000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800003c09a9 80000000e08b0041 */
	end_label   = Thr2_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v107_data_begin
Thr2_User_Data_4v107_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00a TEXT_VA=0x680000370000
attr_text {
	Name = .Thr2_User_Text_4v00a ,
	VA = 0x680000370000 ,/* 0x68000037ffc0 */
	RA = 0x00e03a0000 ,
	PA = 0x00e03a0000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006800003709a9 80000000e03a0481 */
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
	IDEMAP_PCTX
thr2_MMU_ASI_SECONDARY_LITTLE_146:
	.word	0x87802089
	.word	0xf4f2e078
	.word	0xfa5ee100
	DO_BRANCH
	.word	0x81c26000
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
	.word	0xbe8520c0
	.word	0xfadfd000
	DDEMAP_NCTX
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x010, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL
	nop
	nop
	.word	0xbe842038
	.word	0xe8dfd000
thr2_MMU_ASI_SECONDARY_LITTLE_147:
	.word	0x87802089
	.word	0xf0b96160
	.word	0xd45d2120
	.word	0xd65c2010
	.word	0xcc5aa018
	.word	0x1000000
	or	%g0, 0x180, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc872a0a0
	.word	0xc02aa170
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x774, %i7
	LOAD_DDATA_ACCESS
thr2_MMU_ASI_PRIMARY_148:
	.word	0x87802080
	.word	0xc6f420c8
	.word	0x1000000
	or	%g0, 0x684, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x128, %i7
	DTLB_TAG_READ
	.word	0xfa5c20e0
	.word	0x1000000
	or	%g0, 0x6c8, %i7
	DTLB_TAG_READ
	.word	0xbe812068
	.word	0xc4dfd000
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x499, %i7
	LOAD_DDATA_ACCESS
	.word	0xc670a0b8
	.word	0xc072ada0
	.word	0x1000000
	.word	0xbe128000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x78, %i7
	READ_IDATA_ACCESS
	.word	0xfc9adc60
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe05aa038
	.word	0xfe5ee8b0
	IDEMAP_NCTX
	DDEMAP_ALL_RPAGES
	.word	0xde72a0b8
	.word	0xc03526b2
	.word	0x1000000
	.word	0xbe128000
	DDEMAP_RPAGE
	.word	0xfe4aaf7e
	.word	0x1000000
	or	%g0, 0x1cd, %i7
	LOAD_DDATA_ACCESS
	.word	0xca72a010
	.word	0xc0242e9c
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_RPAGE
thr2_MMU_ASI_PRIMARY_LITTLE_149:
	.word	0x87802088
	.word	0xe8bc2560
	.word	0xfcded000
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr2_MMU_ASI_BLK_P_150:
	.word	0x878020f0
	.word	0xe1bf62c0
	TOGGLE_LSU_IM
	.word	0xe25aa018
	ACCESS_DTSB_PTR
	.word	0xd4742068
	.word	0xc03522ee
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe05de0d0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v00a_exit:
	EXIT_GOOD
Thr2_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v108 DATA_VA=0x690039400000
attr_data {
	Name = .Thr2_User_Data_4v108 ,
	VA = 0x690039400000 ,/* 0x6900397fffc0 */
	RA = 0x008b800000 ,
	PA = 0x2c8b800000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006900394009a9 8000002c8b800043 */
	end_label   = Thr2_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v108_data_begin
Thr2_User_Data_4v108_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00b TEXT_VA=0x6800004d0000
attr_text {
	Name = .Thr2_User_Text_4v00b ,
	VA = 0x6800004d0000 ,/* 0x6800004dffc0 */
	RA = 0x00e0960000 ,
	PA = 0x00e0960000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006800004d09a9 80000000e0960481 */
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
thr2_MMU_ASI_BLK_P_151:
	.word	0x878020f0
	.word	0xc3b926c0
thr2_MMU_ASI_BLK_COMMIT_P_152:
	.word	0x878020e0
	.word	0xe1baa800
	DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0xb0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	DDEMAP_ALL
	nop
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	TOGGLE_LSU_DM
thr2_MMU_ASI_PRIMARY_153:
	.word	0x87802080
	.word	0xf2f5e150
	.word	0xfe4526e0
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x5b0, %i7
	READ_IDATA_ACCESS
	nop
	nop
	.word	0x1000000
	or	%g0, 0x400, %i7
	ITLB_TAG_READ
	.word	0xc6742000
	.word	0xc032ad62
	.word	0xfe45e614
	.word	0x1000000
	.word	0xbe144000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x360, %i7
	READ_DDATA_ACCESS
	.word	0xee5aa0e0
	.word	0xbe842140
	.word	0xe8dfd000
	.word	0xfe4426e0
	.word	0x1000000
	or	%g0, 0x550, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x097, %i7
	LOAD_IDATA_IN
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x488, %i7
	READ_IDATA_ACCESS
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc0752248
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr2_User_Text_4v00b_exit:
	EXIT_GOOD
Thr2_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v109 DATA_VA=0x680000140000
attr_data {
	Name = .Thr2_User_Data_4v109 ,
	VA = 0x680000140000 ,/* 0x68000014ffc0 */
	RA = 0x00e0db0000 ,
	PA = 0x00e0db0000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800001409a9 80000000e0db0041 */
	end_label   = Thr2_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v109_data_begin
Thr2_User_Data_4v109_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00c TEXT_VA=0x680000eb0000
attr_text {
	Name = .Thr2_User_Text_4v00c ,
	VA = 0x680000eb0000 ,/* 0x680000ebffc0 */
	RA = 0x00e0170000 ,
	PA = 0x00e0170000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000eb09a9 80000000e0170481 */
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
thr2_MMU_ASI_PRIMARY_154:
	.word	0x87802080
	.word	0xc6f52050
	.word	0xbe842068
	.word	0xeedfd000
	.word	0xd0752058
	.word	0xc0776440
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd1040
	.word	0x1000000
	or	%g0, 0x508, %i7
	READ_IDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_RPAGES
	.word	0xf272a0a0
	.word	0xc072adb0
	.word	0x1000000
	or	%g0, 0x01a, %i7
	LOAD_IDATA_IN
thr2_MMU_ASI_PRIMARY_155:
	.word	0x87802080
	.word	0xfaf6e0f0
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe13c000
	IDEMAP_PAGE
	IDEMAP_ALL_PAGES
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x3e4, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcddd000
	.word	0xfa752088
	.word	0xc07123e0
	.word	0xbe8420c0
	.word	0xd4dfd000
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4aa5df
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00c_exit:
	EXIT_GOOD
Thr2_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10a DATA_VA=0x680000cf0000
attr_data {
	Name = .Thr2_User_Data_4v10a ,
	VA = 0x680000cf0000 ,/* 0x680000cfffc0 */
	RA = 0x00e0030000 ,
	PA = 0x00e0030000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000cf09a9 80000000e0030041 */
	end_label   = Thr2_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10a_data_begin
Thr2_User_Data_4v10a_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00d TEXT_VA=0x67700010a000
attr_text {
	Name = .Thr2_User_Text_4v00d ,
	VA = 0x67700010a000 ,/* 0x67700010bfc0 */
	RA = 0x03b0124000 ,
	PA = 0x03b0124000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000067700010a9a9 80000003b0124480 */
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
	ACCESS_ITSB_PTR
	.word	0xee76e008
	.word	0xc075e4c8
	.word	0xc032abfa
thr2_MMU_ASI_PRIMARY_156:
	.word	0x87802080
	.word	0xccf42018
	.word	0xfcdc1000
	ACCESS_ITSB_PTR
	.word	0xc0342f0c
	.word	0xfe442df4
	.word	0x1000000
	or	%g0, 0x53d, %i7
	LOAD_DDATA_ACCESS
	IDEMAP_PCTX
	.word	0xbe842038
	.word	0xf6dfd000
	.word	0x1000000
	or	%g0, 0x108, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe158000
	DDEMAP_PAGE
	.word	0xd276e000
	.word	0xc0742e30
	IDEMAP_ALL_RPAGES
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x188, %i7
	ITLB_TAG_READ
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc075eea8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00d_exit:
	EXIT_GOOD
Thr2_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10b DATA_VA=0x680000190000
attr_data {
	Name = .Thr2_User_Data_4v10b ,
	VA = 0x680000190000 ,/* 0x68000019ffc0 */
	RA = 0x00e0590000 ,
	PA = 0x00e0590000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800001909a9 80000000e0590041 */
	end_label   = Thr2_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10b_data_begin
Thr2_User_Data_4v10b_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00e TEXT_VA=0x680000a30000
attr_text {
	Name = .Thr2_User_Text_4v00e ,
	VA = 0x680000a30000 ,/* 0x680000a3ffc0 */
	RA = 0x00e0580000 ,
	PA = 0x00e0580000 ,
	TTE_Context = 0x09a9 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000680000a309a9 80000000e0580481 */
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
	or	%g0, 0x8, %i7
	READ_IDATA_ACCESS
	.word	0xc035e386
	.word	0x1000000
	or	%g0, 0x45b, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcdd1000
	.word	0x1000000
	or	%g0, 0x58c, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcddd000
	IDEMAP_NCTX
	nop
	.word	0xfcda9000
	DDEMAP_NCTX
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL
	.word	0xc035efea
thr2_MMU_ASI_BLK_P_157:
	.word	0x878020f0
	.word	0xe1bc2740
	.word	0xbe852088
	.word	0xd4dfd000
	.word	0xbe86e100
	.word	0xc8dfd000
	.word	0xda712000
	.word	0xc02e6a83
thr2_MMU_ASI_PRIMARY_158:
	.word	0x87802080
	.word	0xcef52060
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe52ac4c
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5f6a98
	.word	0x1000000
	or	%g0, 0x486, %i7
	LOAD_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr2_MMU_ASI_BLK_P_159:
	.word	0x878020f0
	.word	0xc3bde3c0
	.word	0x1000000
	or	%g0, 0x798, %i7
	DTLB_TAG_READ
	.word	0xd85de070
	.word	0x1000000
	.word	0xbe140000
	DDEMAP_RPAGE
thr2_MMU_ASI_BLK_S_160:
	.word	0x878020f1
	.word	0xc3bae140
	ACCESS_ITSB_PTR
	.word	0xfa752088
	.word	0xc0712288
	.word	0xc02522f4
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe85c20c0
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr2_User_Text_4v00e_exit:
	EXIT_GOOD
Thr2_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10c DATA_VA=0x677000046000
attr_data {
	Name = .Thr2_User_Data_4v10c ,
	VA = 0x677000046000 ,/* 0x677000047fc0 */
	RA = 0x03b0176000 ,
	PA = 0x03b0176000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006770000469a9 80000003b0176040 */
	end_label   = Thr2_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10c_data_begin
Thr2_User_Data_4v10c_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10d DATA_VA=0x6a04a0000000
attr_data {
	Name = .Thr2_User_Data_4v10d ,
	VA = 0x6a04a0000000 ,/* 0x6a04afffffc0 */
	RA = 0x0240000000 ,
	PA = 0x2e40000000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006a04a00009a9 8000002e40000045 */
	end_label   = Thr2_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10d_data_begin
Thr2_User_Data_4v10d_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10e DATA_VA=0x680000be0000
attr_data {
	Name = .Thr2_User_Data_4v10e ,
	VA = 0x680000be0000 ,/* 0x680000beffc0 */
	RA = 0x00e0700000 ,
	PA = 0x00e0700000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000be09a9 80000000e0700041 */
	end_label   = Thr2_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10e_data_begin
Thr2_User_Data_4v10e_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10f DATA_VA=0x69002cc00000
attr_data {
	Name = .Thr2_User_Data_4v10f ,
	VA = 0x69002cc00000 ,/* 0x69002cffffc0 */
	RA = 0x008b000000 ,
	PA = 0x2c8b000000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000069002cc009a9 8000002c8b000043 */
	end_label   = Thr2_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10f_data_begin
Thr2_User_Data_4v10f_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v110 DATA_VA=0x680000b10000
attr_data {
	Name = .Thr2_User_Data_4v110 ,
	VA = 0x680000b10000 ,/* 0x680000b1ffc0 */
	RA = 0x00e0780000 ,
	PA = 0x00e0780000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000680000b109a9 80000000e0780041 */
	end_label   = Thr2_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v110_data_begin
Thr2_User_Data_4v110_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v111 DATA_VA=0x680000390000
attr_data {
	Name = .Thr2_User_Data_4v111 ,
	VA = 0x680000390000 ,/* 0x68000039ffc0 */
	RA = 0x00e0e40000 ,
	PA = 0x00e0e40000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800003909a9 80000000e0e40041 */
	end_label   = Thr2_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v111_data_begin
Thr2_User_Data_4v111_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v112 DATA_VA=0x680000040000
attr_data {
	Name = .Thr2_User_Data_4v112 ,
	VA = 0x680000040000 ,/* 0x68000004ffc0 */
	RA = 0x00e06b0000 ,
	PA = 0x00e06b0000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006800000409a9 80000000e06b0041 */
	end_label   = Thr2_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v112_data_begin
Thr2_User_Data_4v112_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v113 DATA_VA=0x677000142000
attr_data {
	Name = .Thr2_User_Data_4v113 ,
	VA = 0x677000142000 ,/* 0x677000143fc0 */
	RA = 0x03b01b8000 ,
	PA = 0x03b01b8000 ,
	TTE_Context = 0x09a9 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006770001429a9 80000003b01b8040 */
	end_label   = Thr2_User_Data_4v113_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v113_data_begin
Thr2_User_Data_4v113_data_begin:
	.xword	0x690025000000
	.xword	0x690016800000
	.xword	0x677000128000
	.xword	0x67700018e000
	.xword	0x6800004c0000
	.xword	0x677000184000
	.xword	0x6770001c2000
	.xword	0x6800000e0000
	.xword	0x690024400000
	.xword	0x680000610000
	.xword	0x677000034000
	.xword	0x69002c800000
	.xword	0x680000110000
	.xword	0x680000120000
	.xword	0x680000af0000
	.xword	0x6770001a8000
	.xword	0x690011400000
	.xword	0x690030c00000
	.xword	0x69002b400000
	.xword	0x6a0170000000
	.xword	0x680000920000
	.xword	0x6a01b0000000
	.xword	0x677000022000
	.xword	0x680000790000
	.xword	0x680000dc0000
	.xword	0x6770000c2000
	.xword	0x6800003c0000
	.xword	0x680000370000
	.xword	0x690039400000
	.xword	0x6800004d0000
	.xword	0x680000140000
	.xword	0x680000eb0000
	.xword	0x680000cf0000
	.xword	0x67700010a000
	.xword	0x680000190000
	.xword	0x680000a30000
	.xword	0x677000046000
	.xword	0x6a04a0000000
	.xword	0x680000be0000
	.xword	0x69002cc00000
	.xword	0x680000b10000
	.xword	0x680000390000
	.xword	0x680000040000
	.xword	0x677000142000
Thr2_User_Data_4v113_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x6c0000c50000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	VA = 0x6c0000c50000 ,/* 0x6c0000c5ffc0 */
	RA = 0x00f0080000 ,
	PA = 0x3cf0080000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000c51006 8000003cf0080481 */
	end_label   = Thr3_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr3_user_code_entry
Thr3_user_code_entry:
	setx	0x6d003cc00000, %g1, %g2
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
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x518, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x158, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x58b, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe8420f8
	.word	0xd4dfd000
	.word	0xe39c5f20
	.word	0xfe58a2f8
	ACCESS_ITSB_PTR
thr3_MMU_ASI_PRIMARY_161:
	.word	0x87802080
	.word	0xf8f6e080
	.word	0xbe164000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4aa597
	nop
	nop
	nop
	.word	0xc45aa098
	.word	0xc85aa068
	DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x05e, %i7
	LOAD_IDATA_IN
	.word	0xc070a1c0
	.word	0xfe55a53a
	.word	0x1000000
	or	%g0, 0x1b8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
thr3_MMU_ASI_PRIMARY_162:
	.word	0x87802080
	.word	0xccf0a048
	.word	0xbe168000
	GOTO_SUPERVISOR0
	IDEMAP_ALL
thr3_MMU_ASI_PRIMARY_163:
	.word	0x87802080
	.word	0xeaf2a030
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x018, %i7
	LOAD_DDATA_IN
	.word	0xc45c2038
thr3_MMU_ASI_BLK_COMMIT_P_164:
	.word	0x878020e0
	.word	0xc1bee280
	.word	0xfe42a56c
	nop
	nop
	nop
	nop
	nop
	.word	0xec5aa038
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4ee54d
thr3_MMU_ASI_PRIMARY_165:
	.word	0x87802080
	.word	0xf8baaad0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc032a4f0
	.word	0x81c76000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v000_exit:
	EXIT_GOOD
Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v100 DATA_VA=0x6d003cc00000
attr_data {
	Name = .Thr3_User_Data_4v100 ,
	VA = 0x6d003cc00000 ,/* 0x6d003cffffc0 */
	RA = 0x0094000000 ,
	PA = 0x0094000000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006d003cc01006 8000000094000043 */
	end_label   = Thr3_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v100_data_begin
Thr3_User_Data_4v100_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v200 DATA_VA=0x6b800017a000
attr_data {
	Name = .Thr3_User_Data_4v200 ,
	VA = 0x6b800017a000 ,/* 0x6b800017bfc0 */
	RA = 0x03c0196000 ,
	PA = 0x03c0196000 ,
	TTE_Context = 0x1d56 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006b800017bd56 80000003c0196040 */
	end_label   = Thr3_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v200_data_begin
Thr3_User_Data_4v200_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v300 DATA_VA=0x6d0016400000
attr_data {
	Name = .Thr3_User_Data_4v300 ,
	VA = 0x6d0016400000 ,/* 0x6d00167fffc0 */
	RA = 0x009e000000 ,
	PA = 0x009e000000 ,
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
	/* DTTE_TAG_DATA = 00006d0016400000 800000009e000443 */
	end_label   = Thr3_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v300_data_begin
Thr3_User_Data_4v300_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v001 TEXT_VA=0x6e08f0000000
attr_text {
	Name = .Thr3_User_Text_4v001 ,
	VA = 0x6e08f0000000 ,/* 0x6e08ffffffc0 */
	RA = 0x0350000000 ,
	PA = 0x0350000000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006e08f0001006 8000000350000485 */
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
	.word	0xd85ee018
thr3_MMU_ASI_PRIMARY_166:
	.word	0x87802080
	.word	0xe8f6e0b0
	TOGGLE_LSU_DM
	DDEMAP_NCTX
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfc9d9100
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
	nop
	nop
	nop
	nop
	nop
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
	.word	0xf658a098
	.word	0xc02aa90f
thr3_MMU_ASI_PRIMARY_167:
	.word	0x87802080
	.word	0xc4f42128
	.word	0xc036e382
	.word	0xc022a1fc
	.word	0xbe80a0d8
	.word	0xe0dfd000
	nop
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xc0742518
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v001_exit:
	EXIT_GOOD
Thr3_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v400 TEXT_VA=0x6d0020c00000
attr_text {
	Name = .Thr3_User_Text_4v400 ,
	VA = 0x6d0020c00000 ,/* 0x6d0020ffffc0 */
	RA = 0x0092000000 ,
	PA = 0x0092000000 ,
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
	/* ITTE_TAG_DATA = 00006d0020c00000 8000000092000083 */
	end_label   = Thr3_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v400_text_begin
Thr3_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe168000
	P_DDEMAP_RPAGE
	nop
	nop
	.word	0xfcd95060
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_168:
	.word	0x8780202b
	.word	0xe8b964b0
	.word	0xc024aae4
	.word	0xc034a8a2
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v400_exit:
	EXIT_GOOD
Thr3_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v002 TEXT_VA=0x6b8000092000
attr_text {
	Name = .Thr3_User_Text_4v002 ,
	VA = 0x6b8000092000 ,/* 0x6b8000093fc0 */
	RA = 0x03c002e000 ,
	PA = 0x03c002e000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b8000093006 80000003c002e480 */
	end_label   = Thr3_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v002_text_begin
Thr3_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe130000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x310, %i7
	P_DTLB_TAG_READ
	.word	0xe39a9f00
	.word	0xbe8420e8
	.word	0xecdfc200
thr3_MMU_ASI_PRIMARY_169:
	.word	0x87802080
	.word	0xe8f6e028
	.word	0xbe812098
	.word	0xecdfd000
	.word	0xd275a140
	.word	0xc025a7f0
	.word	0xbe812068
	.word	0xd4dfc200
	nop
	nop
	nop
	P_ACCESS_ITSB_PTR
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v002_exit:
	EXIT_GOOD
Thr3_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v101 DATA_VA=0x6b80001ca000
attr_data {
	Name = .Thr3_User_Data_4v101 ,
	VA = 0x6b80001ca000 ,/* 0x6b80001cbfc0 */
	RA = 0x03c0060000 ,
	PA = 0x03c0060000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b80001cb006 80000003c0060040 */
	end_label   = Thr3_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v101_data_begin
Thr3_User_Data_4v101_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v201 DATA_VA=0x6e0b50000000
attr_data {
	Name = .Thr3_User_Data_4v201 ,
	VA = 0x6e0b50000000 ,/* 0x6e0b5fffffc0 */
	RA = 0x0190000000 ,
	PA = 0x0190000000 ,
	TTE_Context = 0x1d56 ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_3 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 00006e0b50001d56 8000000190000045 */
	end_label   = Thr3_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v201_data_begin
Thr3_User_Data_4v201_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v301 DATA_VA=0x6e00e0000000
attr_data {
	Name = .Thr3_User_Data_4v301 ,
	VA = 0x6e00e0000000 ,/* 0x6e00efffffc0 */
	RA = 0x0050000000 ,
	PA = 0x3850000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_1 ,
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
	TTE_Size    = 5 ,
	/* DTTE_TAG_DATA = 00006e00e0000000 8000003850000445 */
	end_label   = Thr3_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v301_data_begin
Thr3_User_Data_4v301_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v003 TEXT_VA=0x6b80000d4000
attr_text {
	Name = .Thr3_User_Text_4v003 ,
	VA = 0x6b80000d4000 ,/* 0x6b80000d5fc0 */
	RA = 0x03c013a000 ,
	PA = 0x03c013a000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b80000d5006 80000003c013a480 */
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
	or	%g0, 0x7c0, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_IM
	.word	0xd0712028
	.word	0xc022af20
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xe276e010
	.word	0xc072a6c0
	.word	0xfcdd9000
	.word	0x1000000
	or	%g0, 0x439, %i7
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
	or	%g0, 0x4e6, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
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
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x133, %i7
	LOAD_IDATA_ACCESS
	.word	0xc45da108
	.word	0x1000000
	or	%g0, 0x07f, %i7
	LOAD_IDATA_IN
	.word	0xd075a028
	.word	0xc02daa4c
	.word	0xc876e068
	.word	0xc0742960
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5eec68
	.word	0xc19edf00
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xbe82a118
	.word	0xc8dfd000
	IDEMAP_ALL_PAGES
	.word	0xc02c294c
	DDEMAP_NCTX
	TOGGLE_LSU_DM
	.word	0xfe4aa440
	DDEMAP_NCTX
	TOGGLE_LSU_DM
	.word	0xc6712020
	.word	0xc075a4b0
	IDEMAP_ALL_RPAGES
thr3_MMU_ASI_PRIMARY_170:
	.word	0x87802080
	.word	0xecf6e0c0
	.word	0xfc9c5120
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xf65aa0c0
	.word	0x1000000
	or	%g0, 0x045, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x408, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x168, %i7
	READ_IDATA_ACCESS
	.word	0xc036e1e8
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xa4, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x54a, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x3a8, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd272a020
	.word	0xc02c28a0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v003_exit:
	EXIT_GOOD
Thr3_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v401 TEXT_VA=0x6b8000186000
attr_text {
	Name = .Thr3_User_Text_4v401 ,
	VA = 0x6b8000186000 ,/* 0x6b8000187fc0 */
	RA = 0x03c0194000 ,
	PA = 0x03c0194000 ,
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
	/* ITTE_TAG_DATA = 00006b8000186000 80000003c0194080 */
	end_label   = Thr3_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v401_text_begin
Thr3_User_Text_4v401_text_begin:
	wrpr	0, %gl
thr3_MMU_ASI_AS_IF_USER_PRIMARY_171:
	.word	0x87802010
	.word	0xe4f12078
thr3_MMU_ASI_BLK_COMMIT_P_172:
	.word	0x878020e0
	.word	0xe3bc2dc0
	.word	0xbe812038
	.word	0xe0dfc200
	.word	0x1000000
	.word	0xbe14c000
	P_DDEMAP_RPAGE
	.word	0xbe842068
	.word	0xe0dfc200
	.word	0xfcdd9000
	P_DDEMAP_PCTX
	.word	0xfcd91040
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_173:
	.word	0x8780202a
	.word	0xd4b8af40
	nop
	P_ACCESS_ITSB_PTR
	.word	0xfcdac220
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v401_exit:
	EXIT_GOOD
Thr3_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v004 TEXT_VA=0x6d0031000000
attr_text {
	Name = .Thr3_User_Text_4v004 ,
	VA = 0x6d0031000000 ,/* 0x6d00313fffc0 */
	RA = 0x0097400000 ,
	PA = 0x0097400000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d0031001006 8000000097400483 */
	end_label   = Thr3_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v004_text_begin
Thr3_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0xfa712120
	.word	0xc02ee8de
	.word	0xe39c1e00
	.word	0x1000000
	or	%g0, 0x412, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xe8, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x05f, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x03c, %i7
	P_LOAD_DDATA_IN
	.word	0xc072a3b8
thr3_MMU_ASI_AS_IF_USER_PRIMARY_174:
	.word	0x87802010
	.word	0xf2f2a028
	.word	0x1000000
	or	%g0, 0x728, %i7
	P_DTLB_TAG_READ
	P_ACCESS_DTSB_PTR
	.word	0xec5da118
	.word	0x1000000
	or	%g0, 0x793, %i7
	P_LOAD_DDATA_ACCESS
thr3_MMU_ASI_BLK_SL_175:
	.word	0x878020f9
	.word	0xe3b96b80
	.word	0x1000000
	or	%g0, 0x148, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5c9, %i7
	P_LOAD_DDATA_ACCESS
thr3_MMU_ASI_PRIMARY_176:
	.word	0x87802080
	.word	0xcef0a020
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_177:
	.word	0x87802018
	.word	0xd4f5a068
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_ALL_PAGES
	.word	0xbe812098
	.word	0xd4dfc200
	.word	0xfcda8200
	.word	0x1000000
	or	%g0, 0x5e0, %i7
	P_READ_DDATA_ACCESS
	.word	0xfcdec200
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v004_exit:
	EXIT_GOOD
Thr3_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v102 DATA_VA=0x6b8000096000
attr_data {
	Name = .Thr3_User_Data_4v102 ,
	VA = 0x6b8000096000 ,/* 0x6b8000097fc0 */
	RA = 0x03c0066000 ,
	PA = 0x03c0066000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b8000097006 80000003c0066040 */
	end_label   = Thr3_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v102_data_begin
Thr3_User_Data_4v102_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v202 DATA_VA=0x6d0024800000
attr_data {
	Name = .Thr3_User_Data_4v202 ,
	VA = 0x6d0024800000 ,/* 0x6d0024bfffc0 */
	RA = 0x0093800000 ,
	PA = 0x0093800000 ,
	TTE_Context = 0x1d56 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006d0024801d56 8000000093800043 */
	end_label   = Thr3_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v202_data_begin
Thr3_User_Data_4v202_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v302 DATA_VA=0x6c0000760000
attr_data {
	Name = .Thr3_User_Data_4v302 ,
	VA = 0x6c0000760000 ,/* 0x6c000076ffc0 */
	RA = 0x00f0430000 ,
	PA = 0x3cf0430000 ,
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
	/* DTTE_TAG_DATA = 00006c0000760000 8000003cf0430441 */
	end_label   = Thr3_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v302_data_begin
Thr3_User_Data_4v302_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v005 TEXT_VA=0x6c00000c0000
attr_text {
	Name = .Thr3_User_Text_4v005 ,
	VA = 0x6c00000c0000 ,/* 0x6c00000cffc0 */
	RA = 0x00f00f0000 ,
	PA = 0x3cf00f0000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c00000c1006 8000003cf00f0481 */
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
	or	%g0, 0x040, %i7
	LOAD_IDATA_IN
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
	.word	0x1000000
	.word	0xbe104000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x148, %i7
	READ_IDATA_ACCESS
	DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	TOGGLE_LSU_IM
	DDEMAP_SCTX
	.word	0xc0342158
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	READ_IDATA_ACCESS
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xbe846040
	.word	0xe39fde20
thr3_MMU_ASI_PRIMARY_LITTLE_178:
	.word	0x87802088
	.word	0xe0bda170
	.word	0xfcd95160
	nop
	nop
	nop
	nop
	.word	0xbe154000
	GOTO_SUPERVISOR0
	IDEMAP_PCTX
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xc8, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe25c2070
	.word	0xbe85a118
	.word	0xf6dfd000
	.word	0x1000000
	or	%g0, 0x410, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x08f, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe134000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x6e8, %i7
	DTLB_TAG_READ
	.word	0xbe8420d8
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
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x522, %i7
	LOAD_DDATA_ACCESS
	.word	0xd276e100
	.word	0xc0292ddd
	.word	0xc026e194
	nop
	nop
	nop
	nop
	nop
	.word	0xbe842008
	.word	0xd4dfd000
	.word	0xc0242240
	.word	0x1000000
	or	%g0, 0x6e8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x330, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xf8, %i7
	READ_IDATA_ACCESS
	nop
	nop
	.word	0xe675a0d0
	.word	0xc0742f88
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xf65aa118
	IDEMAP_ALL_RPAGES
	.word	0xbe82e010
	.word	0xe2dfd020
	.word	0xee5da018
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xd075a0b0
	.word	0xc035ae44
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v005_exit:
	EXIT_GOOD
Thr3_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v402 TEXT_VA=0x6c0000ec0000
attr_text {
	Name = .Thr3_User_Text_4v402 ,
	VA = 0x6c0000ec0000 ,/* 0x6c0000ecffc0 */
	RA = 0x00f01a0000 ,
	PA = 0x3cf01a0000 ,
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
	/* ITTE_TAG_DATA = 00006c0000ec0000 8000003cf01a0081 */
	end_label   = Thr3_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v402_text_begin
Thr3_User_Text_4v402_text_begin:
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
	.word	0xfcda9000
thr3_MMU_ASI_PRIMARY_179:
	.word	0x87802080
	.word	0xd2f6e020
	.word	0xfe4b2cc5
	P_TOGGLE_LSU_IM
	.word	0xfe55ef40
	.word	0xbe816010
	.word	0xcadfc220
	.word	0x1000000
	or	%g0, 0x428, %i7
	P_READ_IDATA_ACCESS
	.word	0xfe49ac2b
	.word	0xfcd89000
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v402_exit:
	EXIT_GOOD
Thr3_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v006 TEXT_VA=0x6b80000fa000
attr_text {
	Name = .Thr3_User_Text_4v006 ,
	VA = 0x6b80000fa000 ,/* 0x6b80000fbfc0 */
	RA = 0x03c00ec000 ,
	PA = 0x03c00ec000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b80000fb006 80000003c00ec480 */
	end_label   = Thr3_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v006_text_begin
Thr3_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0xe672a020
	.word	0xc036eca4
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x140, %i7
	P_LOAD_IDATA_ACCESS
	P_ACCESS_ITSB_PTR
	P_IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0xb8, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x063, %i7
	P_LOAD_DDATA_IN
thr3_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_180:
	.word	0x87802022
	.word	0xccb8a570
	.word	0xbe82a148
	.word	0xe0dfc200
	P_DDEMAP_ALL
	P_DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x004, %i7
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
thr3_MMU_ASI_AS_IF_USER_PRIMARY_181:
	.word	0x87802010
	.word	0xe8f2a028
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v006_exit:
	EXIT_GOOD
Thr3_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v103 DATA_VA=0x6b8000146000
attr_data {
	Name = .Thr3_User_Data_4v103 ,
	VA = 0x6b8000146000 ,/* 0x6b8000147fc0 */
	RA = 0x03c004a000 ,
	PA = 0x03c004a000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b8000147006 80000003c004a040 */
	end_label   = Thr3_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v103_data_begin
Thr3_User_Data_4v103_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v303 DATA_VA=0x6c0000270000
attr_data {
	Name = .Thr3_User_Data_4v303 ,
	VA = 0x6c0000270000 ,/* 0x6c000027ffc0 */
	RA = 0x00f0d50000 ,
	PA = 0x3cf0d50000 ,
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
	/* DTTE_TAG_DATA = 00006c0000270000 8000003cf0d50441 */
	end_label   = Thr3_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v303_data_begin
Thr3_User_Data_4v303_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v007 TEXT_VA=0x6c0000de0000
attr_text {
	Name = .Thr3_User_Text_4v007 ,
	VA = 0x6c0000de0000 ,/* 0x6c0000deffc0 */
	RA = 0x00f0e60000 ,
	PA = 0x3cf0e60000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000de1006 8000003cf0e60481 */
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
	DDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe11c000
	DDEMAP_RPAGE
	.word	0xbe842098
	.word	0xc4dfd000
	.word	0x1000000
	or	%g0, 0x488, %i7
	READ_IDATA_ACCESS
	.word	0xec76e068
	.word	0xc036e8e6
	.word	0xfcdc5120
	.word	0x1000000
	or	%g0, 0x478, %i7
	READ_IDATA_ACCESS
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x643, %i7
	LOAD_DDATA_ACCESS
	.word	0xc675a060
	.word	0xc020a298
	.word	0x1000000
	or	%g0, 0x03f, %i7
	LOAD_IDATA_IN
	.word	0xe25aa010
	.word	0xc02ee158
	.word	0xfcd89000
	.word	0xc036e938
	.word	0xca75a010
	.word	0xc075a938
	IDEMAP_PCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdc1140
	.word	0xf272a028
	.word	0xc070ab60
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x7f0, %i7
	READ_DDATA_ACCESS
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe80a068
	.word	0xf6dfd000
	.word	0xca712040
	.word	0xc02aa99a
	nop
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_182:
	.word	0x87802080
	.word	0xd0f0a028
	nop
thr3_MMU_ASI_PRIMARY_183:
	.word	0x87802080
	.word	0xd0f5a058
	IDEMAP_ALL_RPAGES
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x460, %i7
	READ_DDATA_ACCESS
	.word	0xbe86e008
	.word	0xc4dfd000
	.word	0xc02aa158
	.word	0xfe50ac3c
thr3_MMU_ASI_PRIMARY_184:
	.word	0x87802080
	.word	0xe2f2a010
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x518, %i7
	READ_IDATA_ACCESS
thr3_MMU_ASI_PRIMARY_LITTLE_185:
	.word	0x87802088
	.word	0xe6f2a0f0
	.word	0xfa72a0f0
	.word	0xc02aadab
	.word	0xfcd89000
	.word	0x1000000
	.word	0xbe14c000
	IDEMAP_PAGE
	.word	0xbe8120d8
	.word	0xc8dfd000
	.word	0xf65ee0e8
	.word	0xc072a7f0
	.word	0xfe4daea8
	IDEMAP_ALL
	TOGGLE_LSU_DM
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	.word	0xfcdd9000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x014, %i7
	LOAD_DDATA_IN
	.word	0xc022a770
	ACCESS_DTSB_PTR
	TOGGLE_LSU_DM
	TOGGLE_LSU_IM
	nop
	nop
	.word	0x1000000
	.word	0xbe108000
	IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe54239e
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr3_User_Text_4v007_exit:
	EXIT_GOOD
Thr3_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v403 TEXT_VA=0x6c0000930000
attr_text {
	Name = .Thr3_User_Text_4v403 ,
	VA = 0x6c0000930000 ,/* 0x6c000093ffc0 */
	RA = 0x00f0240000 ,
	PA = 0x3cf0240000 ,
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
	/* ITTE_TAG_DATA = 00006c0000930000 8000003cf0240081 */
	end_label   = Thr3_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v403_text_begin
Thr3_User_Text_4v403_text_begin:
	wrpr	0, %gl
	P_DDEMAP_NCTX
	P_IDEMAP_ALL_PAGES
	.word	0xfcda9000
	P_DDEMAP_SCTX
	P_IDEMAP_ALL
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x093, %i7
	P_LOAD_IDATA_IN
	.word	0xfe49aca3
	.word	0xfe5b2340
	.word	0xfe51a52c
	.word	0x1000000
	or	%g0, 0x0a7, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x04e, %i7
	P_LOAD_IDATA_IN
	P_IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc45b2108
thr3_MMU_ASI_SECONDARY_LITTLE_186:
	.word	0x87802089
	.word	0xd2f2e0d0
	P_TOGGLE_LSU_IM
	.word	0xca59a040
	.word	0x1000000
	or	%g0, 0x01c, %i7
	P_LOAD_IDATA_IN
	.word	0xfcdd8200
thr3_MMU_ASI_AS_IF_USER_PRIMARY_187:
	.word	0x87802010
	.word	0xf2f6e058
	P_IDEMAP_NCTX
thr3_MMU_ASI_PRIMARY_188:
	.word	0x87802080
	.word	0xeaf42120
thr3_MMU_ASI_PRIMARY_189:
	.word	0x87802080
	.word	0xc6f2a050
thr3_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_190:
	.word	0x87802018
	.word	0xc6f5a030
	.word	0xc02de9d9
	P_ACCESS_DTSB_PTR
thr3_MMU_ASI_AS_IF_USER_PRIMARY_191:
	.word	0x87802010
	.word	0xe2f6e010
	.word	0xd271a090
	.word	0xc0332dd0
thr3_MMU_ASI_PRIMARY_192:
	.word	0x87802080
	.word	0xe2f2a010
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr3_User_Text_4v403_exit:
	EXIT_GOOD
Thr3_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v008 TEXT_VA=0x6d000f400000
attr_text {
	Name = .Thr3_User_Text_4v008 ,
	VA = 0x6d000f400000 ,/* 0x6d000f7fffc0 */
	RA = 0x0094400000 ,
	PA = 0x0094400000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d000f401006 8000000094400483 */
	end_label   = Thr3_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v008_text_begin
Thr3_User_Text_4v008_text_begin:
	wrpr	0, %gl
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe120000
	P_DDEMAP_PAGE
	P_TOGGLE_LSU_DM
	.word	0xe39a9f00
	P_DDEMAP_SCTX
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_DDEMAP_NCTX
thr3_MMU_ASI_AS_IF_USER_PRIMARY_193:
	.word	0x87802010
	.word	0xc6f6e150
	.word	0xfe5ee058
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x5e0, %i7
	P_ITLB_TAG_READ
	.word	0xfe40a974
	P_ACCESS_ITSB_PTR
	.word	0xe39943e0
	.word	0x1000000
	or	%g0, 0x458, %i7
	P_DTLB_TAG_READ
	.word	0xfcda8300
	P_IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x097, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
thr3_MMU_ASI_PRIMARY_194:
	.word	0x87802080
	.word	0xe8f0a028
	.word	0xfcd94220
	.word	0x1000000
	or	%g0, 0x488, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x1f4, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x140, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe86a0b0
	.word	0xf8dfc2a0
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v008_exit:
	EXIT_GOOD
Thr3_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v104 DATA_VA=0x6b8000088000
attr_data {
	Name = .Thr3_User_Data_4v104 ,
	VA = 0x6b8000088000 ,/* 0x6b8000089fc0 */
	RA = 0x03c0090000 ,
	PA = 0x03c0090000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b8000089006 80000003c0090040 */
	end_label   = Thr3_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v104_data_begin
Thr3_User_Data_4v104_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v009 TEXT_VA=0x6b80000ca000
attr_text {
	Name = .Thr3_User_Text_4v009 ,
	VA = 0x6b80000ca000 ,/* 0x6b80000cbfc0 */
	RA = 0x03c01c6000 ,
	PA = 0x03c01c6000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b80000cb006 80000003c01c6480 */
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
	.word	0xc476e008
	.word	0xc022a768
	IDEMAP_ALL_RPAGES
	.word	0xfcda9040
	.word	0x1000000
	or	%g0, 0x0ae, %i7
	LOAD_DDATA_IN
	.word	0xe05aa118
	.word	0x1000000
	or	%g0, 0x453, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcdd9100
	DDEMAP_ALL_PAGES
	.word	0xc075a480
	.word	0xda70a130
	.word	0xc0292ae6
	.word	0xe45c20a0
	.word	0x1000000
	or	%g0, 0x128, %i7
	ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xf65ee0c0
	.word	0xe05c2068
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	DDEMAP_ALL
	nop
	nop
	nop
	nop
	IDEMAP_ALL
	.word	0xfe4da465
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe174000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0xc0292967
	.word	0x1000000
	.word	0xbe12c000
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
	.word	0xc0292526
	.word	0xd458a038
	.word	0xc036e41a
	nop
	DDEMAP_ALL
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_ALL
	.word	0xbe82a008
	.word	0xc4dfd000
	.word	0xfcdd9000
	.word	0xd65ee040
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x406, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1c0, %i7
	ITLB_TAG_READ
thr3_MMU_ASI_PRIMARY_195:
	.word	0x87802080
	.word	0xc4f420c0
	.word	0xc02ee17a
	.word	0xc070ac08
	.word	0xd658a010
	.word	0x1000000
	or	%g0, 0x7b8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0xbc, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x5a6, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xfe5aa298
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v009_exit:
	EXIT_GOOD
Thr3_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00a TEXT_VA=0x6d0024000000
attr_text {
	Name = .Thr3_User_Text_4v00a ,
	VA = 0x6d0024000000 ,/* 0x6d00243fffc0 */
	RA = 0x0098400000 ,
	PA = 0x0098400000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d0024001006 8000000098400483 */
	end_label   = Thr3_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00a_text_begin
Thr3_User_Text_4v00a_text_begin:
	wrpr	0, %gl
	.word	0xfe56ed10
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xfe5da688
	P_TOGGLE_LSU_IM
	.word	0xbe812098
	.word	0xd4dfc200
	P_TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe15c000
	P_DDEMAP_PAGE
	P_TOGGLE_LSU_DM
	P_IDEMAP_ALL
	.word	0x1000000
	.word	0xbe150000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xc19902c0
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr3_User_Text_4v00a_exit:
	EXIT_GOOD
Thr3_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v105 DATA_VA=0x6c00002d0000
attr_data {
	Name = .Thr3_User_Data_4v105 ,
	VA = 0x6c00002d0000 ,/* 0x6c00002dffc0 */
	RA = 0x00f0640000 ,
	PA = 0x3cf0640000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c00002d1006 8000003cf0640041 */
	end_label   = Thr3_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v105_data_begin
Thr3_User_Data_4v105_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00b TEXT_VA=0x6b800001a000
attr_text {
	Name = .Thr3_User_Text_4v00b ,
	VA = 0x6b800001a000 ,/* 0x6b800001bfc0 */
	RA = 0x03c01e6000 ,
	PA = 0x03c01e6000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b800001b006 80000003c01e6480 */
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
thr3_MMU_ASI_PRIMARY_196:
	.word	0x87802080
	.word	0xf4f0a080
	.word	0x1000000
	or	%g0, 0x5b6, %i7
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
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x052, %i7
	LOAD_IDATA_IN
thr3_MMU_ASI_PRIMARY_197:
	.word	0x87802080
	.word	0xc6f420a8
	.word	0x1000000
	or	%g0, 0x3a8, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x648, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x01b, %i7
	LOAD_IDATA_IN
	DDEMAP_NCTX
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	.word	0xc02c2158
	.word	0x1000000
	or	%g0, 0x020, %i7
	LOAD_IDATA_IN
	.word	0xbe150000
	GOTO_SUPERVISOR1
	IDEMAP_NCTX
	DDEMAP_ALL
	IDEMAP_ALL
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xd45da128
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00b_exit:
	EXIT_GOOD
Thr3_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v106 DATA_VA=0x6b800019c000
attr_data {
	Name = .Thr3_User_Data_4v106 ,
	VA = 0x6b800019c000 ,/* 0x6b800019dfc0 */
	RA = 0x03c01fc000 ,
	PA = 0x03c01fc000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b800019d006 80000003c01fc040 */
	end_label   = Thr3_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v106_data_begin
Thr3_User_Data_4v106_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00c TEXT_VA=0x6c0000720000
attr_text {
	Name = .Thr3_User_Text_4v00c ,
	VA = 0x6c0000720000 ,/* 0x6c000072ffc0 */
	RA = 0x00f0560000 ,
	PA = 0x3cf0560000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006c0000721006 8000003cf0560481 */
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
	nop
	nop
	nop
	nop
	nop
	.word	0xc072a2b0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x130, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_IM
	.word	0xfc995120
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0xb0, %i7
	ITLB_TAG_READ
	.word	0xbe816010
	.word	0xe39fde20
	.word	0xbe842118
	.word	0xd4dfd000
	ACCESS_DTSB_PTR
	.word	0xc022a57c
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xfcd91000
	.word	0x1000000
	or	%g0, 0xd1, %i7
	LOAD_IDATA_ACCESS
	.word	0xf2712028
	.word	0xc020abb4
	.word	0xfe46e9f0
	.word	0xfcd89040
thr3_MMU_ASI_PRIMARY_198:
	.word	0x87802080
	.word	0xfaf2a0a8
	ACCESS_DTSB_PTR
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xd45c2148
	.word	0x81c36000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00c_exit:
	EXIT_GOOD
Thr3_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v107 DATA_VA=0x6b80000c4000
attr_data {
	Name = .Thr3_User_Data_4v107 ,
	VA = 0x6b80000c4000 ,/* 0x6b80000c5fc0 */
	RA = 0x03c0092000 ,
	PA = 0x03c0092000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b80000c5006 80000003c0092040 */
	end_label   = Thr3_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v107_data_begin
Thr3_User_Data_4v107_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00d TEXT_VA=0x6d0007800000
attr_text {
	Name = .Thr3_User_Text_4v00d ,
	VA = 0x6d0007800000 ,/* 0x6d0007bfffc0 */
	RA = 0x0092c00000 ,
	PA = 0x0092c00000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d0007801006 8000000092c00483 */
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
	ACCESS_ITSB_PTR
	.word	0xfc9c1c40
	IDEMAP_PCTX
	nop
	.word	0xfcda9000
	TOGGLE_LSU_IM
	.word	0xfcdc1140
	.word	0xfe542a80
	.word	0xfe4da64a
	.word	0xc45ee008
	.word	0x1000000
	or	%g0, 0x046, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x071, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	.word	0x1000000
	.word	0xbe150000
	DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
thr3_MMU_ASI_PRIMARY_199:
	.word	0x87802080
	.word	0xd2f12130
thr3_MMU_ASI_SECONDARY_200:
	.word	0x87802081
	.word	0xe6f46110
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x4f3, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x2b9, %i7
	LOAD_DDATA_ACCESS
	.word	0xec5aa148
	.word	0xe05c20c0
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc02428bc
	.word	0x81c62000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00d_exit:
	EXIT_GOOD
Thr3_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v108 DATA_VA=0x6b8000110000
attr_data {
	Name = .Thr3_User_Data_4v108 ,
	VA = 0x6b8000110000 ,/* 0x6b8000111fc0 */
	RA = 0x03c01fe000 ,
	PA = 0x03c01fe000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b8000111006 80000003c01fe040 */
	end_label   = Thr3_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v108_data_begin
Thr3_User_Data_4v108_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00e TEXT_VA=0x6d0012000000
attr_text {
	Name = .Thr3_User_Text_4v00e ,
	VA = 0x6d0012000000 ,/* 0x6d00123fffc0 */
	RA = 0x0090400000 ,
	PA = 0x0090400000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d0012001006 8000000090400483 */
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
thr3_MMU_ASI_PRIMARY_201:
	.word	0x87802080
	.word	0xe4f42078
thr3_MMU_ASI_PRIMARY_202:
	.word	0x87802080
	.word	0xe6f2a050
	.word	0x1000000
	.word	0xbe10c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x318, %i7
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
	.word	0xc025a2a8
	DDEMAP_NCTX
	.word	0xcc72a018
	.word	0xc076e3d8
	.word	0x1000000
	or	%g0, 0x4e8, %i7
	READ_IDATA_ACCESS
	.word	0xc6712140
	.word	0xc070a268
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe17c000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x160, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc858a148
	.word	0xbe82a0d8
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe134000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	DDEMAP_NCTX
	nop
	nop
	.word	0xfcdc1000
	nop
	nop
	.word	0xc0242a20
	.word	0x1000000
	or	%g0, 0x41c, %i7
	LOAD_IDATA_ACCESS
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x160, %i7
	ITLB_TAG_READ
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	DDEMAP_SCTX
	.word	0xfcd95020
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe118000
	DDEMAP_PAGE
	.word	0xf676e0c0
	.word	0xc025a250
	.word	0xcc72a018
	.word	0xc076e2b0
	.word	0xbe80a108
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xbe80a098
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x488, %i7
	ITLB_TAG_READ
	.word	0xbe164000
	GOTO_SUPERVISOR1
	TOGGLE_LSU_IM
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xd07420b0
	.word	0xc075a490
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00e_exit:
	EXIT_GOOD
Thr3_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v109 DATA_VA=0x6b8000062000
attr_data {
	Name = .Thr3_User_Data_4v109 ,
	VA = 0x6b8000062000 ,/* 0x6b8000063fc0 */
	RA = 0x03c009e000 ,
	PA = 0x03c009e000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b8000063006 80000003c009e040 */
	end_label   = Thr3_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v109_data_begin
Thr3_User_Data_4v109_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00f TEXT_VA=0x6b8000168000
attr_text {
	Name = .Thr3_User_Text_4v00f ,
	VA = 0x6b8000168000 ,/* 0x6b8000169fc0 */
	RA = 0x03c01d4000 ,
	PA = 0x03c01d4000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b8000169006 80000003c01d4480 */
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
	or	%g0, 0x438, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4a8, %i7
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
	or	%g0, 0x057, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc02c2ca4
	.word	0x1000000
	.word	0xbe148000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x570, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	.word	0xc07121f8
	ACCESS_ITSB_PTR
	TOGGLE_LSU_DM
	ACCESS_ITSB_PTR
thr3_MMU_ASI_BLK_P_203:
	.word	0x878020f0
	.word	0xe1b92180
	DDEMAP_ALL
	.word	0x1000000
	.word	0xbe17c000
	IDEMAP_PAGE
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe174000
	GOTO_SUPERVISOR0
	.word	0xee742018
	.word	0xc028a158
	ACCESS_ITSB_PTR
	DDEMAP_SCTX
	nop
	nop
	nop
	.word	0xc02c2a0d
thr3_MMU_ASI_PRIMARY_204:
	.word	0x87802080
	.word	0xd0f2a028
	.word	0xfcda9000
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xc02121c0
	.word	0xfe40aa30
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe45a2c4
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x097, %i7
	LOAD_IDATA_IN
	ACCESS_DTSB_PTR
	IDEMAP_ALL_RPAGES
	TOGGLE_LSU_DM
	.word	0xc032a6a0
	ACCESS_ITSB_PTR
	.word	0xf65ee068
	.word	0xbe150000
	GOTO_SUPERVISOR1
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x148, %i7
	ITLB_TAG_READ
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
	TOGGLE_LSU_IM
	.word	0xec75a128
	.word	0xc025aff8
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
	.word	0xbe85a090
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
	nop
	nop
	nop
	nop
	nop
	.word	0xc02aa35d
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe11c000
	IDEMAP_RPAGE
thr3_MMU_ASI_PRIMARY_205:
	.word	0x87802080
	.word	0xfaf0a100
	.word	0x1000000
	or	%g0, 0x590, %i7
	ITLB_TAG_READ
	DDEMAP_PCTX
thr3_MMU_ASI_SECONDARY_LITTLE_206:
	.word	0x87802089
	.word	0xdcb96150
	.word	0xc45c2098
	.word	0xfcd89000
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
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x160, %i7
	READ_IDATA_ACCESS
	TOGGLE_LSU_IM
	DO_BRANCH
	.word	0x81c76000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe2712010
	.word	0xc072a528
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v00f_exit:
	EXIT_GOOD
Thr3_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10a DATA_VA=0x6b8000158000
attr_data {
	Name = .Thr3_User_Data_4v10a ,
	VA = 0x6b8000158000 ,/* 0x6b8000159fc0 */
	RA = 0x03c017e000 ,
	PA = 0x03c017e000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006b8000159006 80000003c017e040 */
	end_label   = Thr3_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10a_data_begin
Thr3_User_Data_4v10a_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v010 TEXT_VA=0x6d000cc00000
attr_text {
	Name = .Thr3_User_Text_4v010 ,
	VA = 0x6d000cc00000 ,/* 0x6d000cffffc0 */
	RA = 0x009f000000 ,
	PA = 0x009f000000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006d000cc01006 800000009f000483 */
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
	DDEMAP_ALL_RPAGES
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0xca5da010
	nop
	nop
thr3_MMU_ASI_PRIMARY_207:
	.word	0x87802080
	.word	0xf6f42098
	.word	0xf272a0b0
	.word	0xc02c2339
	.word	0xda76e030
	.word	0xc034264c
	.word	0xc675a0e0
	.word	0xc0342900
	.word	0x1000000
	or	%g0, 0x618, %i7
	DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x01b, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x1af, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x30, %i7
	READ_IDATA_ACCESS
	.word	0xfe5dabd8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x465, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0xe8, %i7
	ITLB_TAG_READ
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x022, %i7
	LOAD_IDATA_IN
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x083, %i7
	LOAD_DDATA_IN
	.word	0xc020a874
	nop
	nop
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe842140
	.word	0xc39fde00
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x7d0, %i7
	READ_DDATA_ACCESS
	.word	0xfe5aa588
	.word	0x1000000
	.word	0xbe160000
	DDEMAP_PAGE
	.word	0xee72a018
	.word	0xc076e158
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xf65da0e8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v010_exit:
	EXIT_GOOD
Thr3_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10b DATA_VA=0x6e0900000000
attr_data {
	Name = .Thr3_User_Data_4v10b ,
	VA = 0x6e0900000000 ,/* 0x6e090fffffc0 */
	RA = 0x01a0000000 ,
	PA = 0x01a0000000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006e0900001006 80000001a0000045 */
	end_label   = Thr3_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10b_data_begin
Thr3_User_Data_4v10b_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v011 TEXT_VA=0x6b8000038000
attr_text {
	Name = .Thr3_User_Text_4v011 ,
	VA = 0x6b8000038000 ,/* 0x6b8000039fc0 */
	RA = 0x03c006c000 ,
	PA = 0x03c006c000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b8000039006 80000003c006c480 */
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
	.word	0x1000000
	or	%g0, 0x40f, %i7
	LOAD_DDATA_ACCESS
	.word	0xfe45a6bc
	.word	0xec75a068
	.word	0xc0742300
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe05c2128
	.word	0xc4742038
	.word	0xc02aab9a
	.word	0x1000000
	or	%g0, 0x083, %i7
	LOAD_IDATA_IN
	.word	0xc0242874
	.word	0xdc76e028
	.word	0xc02c2d6a
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x608, %i7
	DTLB_TAG_READ
	.word	0xc675a030
	.word	0xc072af98
	.word	0x1000000
	or	%g0, 0x59b, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_ALL_RPAGES
	ACCESS_ITSB_PTR
	DDEMAP_SCTX
thr3_MMU_ASI_PRIMARY_208:
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
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	.word	0xc076e500
	IDEMAP_NCTX
	.word	0xbe82a118
	.word	0xe0dfd000
	.word	0xfc9edd40
	nop
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0x092, %i7
	LOAD_IDATA_IN
	DDEMAP_ALL_RPAGES
	.word	0xfcdc1040
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x451, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_NCTX
	.word	0xd472a098
	.word	0xc030ac20
	.word	0x1000000
	.word	0xbe120000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x015, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_DM
	.word	0xfc9c5120
	.word	0xc036e3c2
	.word	0xf65da0f8
	.word	0xc025a598
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x68, %i7
	ITLB_TAG_READ
	.word	0xda70a150
	.word	0xc0242290
	.word	0x1000000
	.word	0xbe178000
	DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x4ed, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe174000
	GOTO_SUPERVISOR0
	IDEMAP_ALL
	.word	0x1000000
	.word	0xbe124000
	IDEMAP_RPAGE
	.word	0xc030a158
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xc035ac8c
	.word	0x81c1e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v011_exit:
	EXIT_GOOD
Thr3_User_Text_4v011_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10c DATA_VA=0x6c0000a00000
attr_data {
	Name = .Thr3_User_Data_4v10c ,
	VA = 0x6c0000a00000 ,/* 0x6c0000a0ffc0 */
	RA = 0x00f0350000 ,
	PA = 0x3cf0350000 ,
	TTE_Context = 0x1006 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006c0000a01006 8000003cf0350041 */
	end_label   = Thr3_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10c_data_begin
Thr3_User_Data_4v10c_data_begin:
	.xword	0x6c0000c50000
	.xword	0x6d003cc00000
	.xword	0x6b800017a000
	.xword	0x6d0016400000
	.xword	0x6e08f0000000
	.xword	0x6d0020c00000
	.xword	0x6b8000092000
	.xword	0x6b80001ca000
	.xword	0x6e0b50000000
	.xword	0x6e00e0000000
	.xword	0x6b80000d4000
	.xword	0x6b8000186000
	.xword	0x6d0031000000
	.xword	0x6b8000096000
	.xword	0x6d0024800000
	.xword	0x6c0000760000
	.xword	0x6c00000c0000
	.xword	0x6c0000ec0000
	.xword	0x6b80000fa000
	.xword	0x6b8000146000
	.xword	0x6c0000270000
	.xword	0x6c0000de0000
	.xword	0x6c0000930000
	.xword	0x6d000f400000
	.xword	0x6b8000088000
	.xword	0x6b80000ca000
	.xword	0x6d0024000000
	.xword	0x6c00002d0000
	.xword	0x6b800001a000
	.xword	0x6b800019c000
	.xword	0x6c0000720000
	.xword	0x6b80000c4000
	.xword	0x6d0007800000
	.xword	0x6b8000110000
	.xword	0x6d0012000000
	.xword	0x6b8000062000
	.xword	0x6b8000168000
	.xword	0x6b8000158000
	.xword	0x6d000cc00000
	.xword	0x6e0900000000
	.xword	0x6b8000038000
	.xword	0x6c0000a00000
	.xword	0x6b80000d8000
Thr3_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v012 TEXT_VA=0x6b80000d8000
attr_text {
	Name = .Thr3_User_Text_4v012 ,
	VA = 0x6b80000d8000 ,/* 0x6b80000d9fc0 */
	RA = 0x03c0000000 ,
	PA = 0x03c0000000 ,
	TTE_Context = 0x1006 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006b80000d9006 80000003c0000480 */
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
	.word	0xc476e098
	.word	0xc0742668
	.word	0x1000000
	.word	0xbe138000
	DDEMAP_PAGE
thr3_MMU_ASI_PRIMARY_209:
	.word	0x87802080
	.word	0xd8f0a018
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe174000
	GOTO_SUPERVISOR0
	.word	0xc19adf20
	.word	0xbe82a0e8
	.word	0xe0dfd000
	nop
	.word	0xbe86e060
	.word	0xe39fde00
	IDEMAP_NCTX
	.word	0x1000000
	.word	0xbe154000
	DDEMAP_PAGE
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xc072a158
	.word	0x81c6a000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr3_User_Text_4v012_exit:
	EXIT_GOOD
Thr3_User_Text_4v012_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x710007c00000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	VA = 0x710007c00000 ,/* 0x710007ffffc0 */
	RA = 0x00adc00000 ,
	PA = 0x4cadc00000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000710007c01b80 8000004cadc00083 */
	end_label   = Thr4_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr4_user_code_entry
Thr4_user_code_entry:
	setx	0x700000060000, %g1, %g2
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
	DDEMAP_ALL_PAGES
	.word	0xbe82a008
	.word	0xe0dfd000
	nop
	nop
	DDEMAP_ALL_PAGES
thr4_MMU_ASI_PRIMARY_210:
	.word	0x87802080
	.word	0xd8f12078
	.word	0x1000000
	or	%g0, 0x0a7, %i7
	LOAD_DDATA_IN
	.word	0xe072a068
	.word	0xc072ad28
	.word	0xd45da008
	.word	0x1000000
	.word	0xbe118000
	DDEMAP_RPAGE
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe48a124
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xbe80a068
	.word	0xecdfd000
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe158000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe40a21c
	.word	0x1000000
	or	%g0, 0x5a, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x1c8, %i7
	READ_IDATA_ACCESS
	.word	0xbe85e0a0
	.word	0xd6dfd020
	.word	0x1000000
	or	%g0, 0x074, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x480, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x558, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe114000
	DDEMAP_PAGE
thr4_MMU_ASI_PRIMARY_LITTLE_211:
	.word	0x87802088
	.word	0xe8baa8c0
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x210, %i7
	DTLB_TAG_READ
	DDEMAP_ALL
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc85c2008
	.word	0x81c6a000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v000_exit:
	EXIT_GOOD
Thr4_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v100 DATA_VA=0x700000060000
attr_data {
	Name = .Thr4_User_Data_4v100 ,
	VA = 0x700000060000 ,/* 0x70000006ffc0 */
	RA = 0x01005c0000 ,
	PA = 0x4d005c0000 ,
	TTE_Context = 0x1b80 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000700000061b80 8000004d005c0041 */
	end_label   = Thr4_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v100_data_begin
Thr4_User_Data_4v100_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v200 DATA_VA=0x6f900000a000
attr_data {
	Name = .Thr4_User_Data_4v200 ,
	VA = 0x6f900000a000 ,/* 0x6f900000bfc0 */
	RA = 0x03d01cc000 ,
	PA = 0x03d01cc000 ,
	TTE_Context = 0x0dcb ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006f900000a8e0 80000003d01cc440 */
	end_label   = Thr4_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v200_data_begin
Thr4_User_Data_4v200_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v300 DATA_VA=0x6f9000048000
attr_data {
	Name = .Thr4_User_Data_4v300 ,
	VA = 0x6f9000048000 ,/* 0x6f9000049fc0 */
	RA = 0x03d00da000 ,
	PA = 0x03d00da000 ,
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
	/* DTTE_TAG_DATA = 00006f9000048000 80000003d00da440 */
	end_label   = Thr4_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v300_data_begin
Thr4_User_Data_4v300_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v001 TEXT_VA=0x7000009e0000
attr_text {
	Name = .Thr4_User_Text_4v001 ,
	VA = 0x7000009e0000 ,/* 0x7000009effc0 */
	RA = 0x0100690000 ,
	PA = 0x4d00690000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007000009e1b80 8000004d00690081 */
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
	.word	0xe39edf00
	TOGGLE_LSU_IM
	.word	0xfe52a890
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_PRIMARY_212:
	.word	0x87802080
	.word	0xf2f2a0b0
	.word	0x1000000
	or	%g0, 0x055, %i7
	LOAD_DDATA_IN
	.word	0xf870a0a8
	.word	0xc0242f9c
	.word	0xbe812068
	.word	0xecdfd000
	.word	0xfcdc1000
	.word	0xe872a088
	.word	0xc070a3a0
	IDEMAP_PCTX
	.word	0xfe56e21a
	.word	0x1000000
	or	%g0, 0x064, %i7
	LOAD_IDATA_IN
	TOGGLE_LSU_IM
	nop
	nop
	.word	0xfe40ae08
	nop
	nop
	TOGGLE_LSU_IM
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe82a110
	.word	0xd4dfd000
thr4_MMU_ASI_BLK_SL_213:
	.word	0x878020f9
	.word	0xc3b965c0
	.word	0x1000000
	or	%g0, 0x458, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_IM
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe52a306
	.word	0x81c66000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v001_exit:
	EXIT_GOOD
Thr4_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v400 TEXT_VA=0x710021000000
attr_text {
	Name = .Thr4_User_Text_4v400 ,
	VA = 0x710021000000 ,/* 0x7100213fffc0 */
	RA = 0x00a4800000 ,
	PA = 0x4ca4800000 ,
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
	/* ITTE_TAG_DATA = 0000710021000000 8000004ca4800083 */
	end_label   = Thr4_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v400_text_begin
Thr4_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xf87620a8
	.word	0xc031adac
	.word	0xfc9d9100
	P_ACCESS_DTSB_PTR
	P_DDEMAP_ALL
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x798, %i7
	P_DTLB_TAG_READ
	P_DDEMAP_PCTX
	.word	0xfa71a090
	.word	0xc071ab78
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_SCTX
	.word	0xe674a128
	.word	0xc074aae8
	P_DDEMAP_ALL
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v400_exit:
	EXIT_GOOD
Thr4_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v002 TEXT_VA=0x720530000000
attr_text {
	Name = .Thr4_User_Text_4v002 ,
	VA = 0x720530000000 ,/* 0x72053fffffc0 */
	RA = 0x0360000000 ,
	PA = 0x4f60000000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000720530001b80 8000004f60000085 */
	end_label   = Thr4_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v002_text_begin
Thr4_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0xc075a220
	P_ACCESS_DTSB_PTR
	P_ACCESS_DTSB_PTR
	.word	0xfcdc0200
	P_DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x4b0, %i7
	P_LOAD_DDATA_ACCESS
	P_IDEMAP_ALL
	.word	0xfcda8200
	P_DDEMAP_NCTX
	P_ACCESS_DTSB_PTR
	P_IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_AS_IF_USER_SECONDARY_214:
	.word	0x87802011
	.word	0xcaf16010
thr4_MMU_ASI_PRIMARY_215:
	.word	0x87802080
	.word	0xf8f2a018
	.word	0x1000000
	or	%g0, 0x1e, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe85a0f0
	.word	0xe0dfd000
	nop
	nop
thr4_MMU_ASI_AS_IF_USER_PRIMARY_216:
	.word	0x87802010
	.word	0xc6f0a030
	P_DDEMAP_ALL_PAGES
	.word	0xfcd88200
	.word	0xbe80a098
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe12c000
	P_IDEMAP_RPAGE
	.word	0xe275a010
	.word	0xc036e4d8
	.word	0xbe86e068
	.word	0xd4dfd000
	.word	0xfc9ddc60
	P_TOGGLE_LSU_DM
	.word	0xbe85a100
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x5f8, %i7
	P_READ_IDATA_ACCESS
	P_IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x580, %i7
	P_READ_IDATA_ACCESS
	.word	0xfe412c50
	.word	0x1000000
	.word	0xbe108000
	P_DDEMAP_PAGE
	.word	0xfe52a78e
	.word	0x1000000
	or	%g0, 0x1a8, %i7
	P_READ_DDATA_ACCESS
	P_ACCESS_DTSB_PTR
	P_DDEMAP_SCTX
	.word	0xc47420c0
	.word	0xc07422e0
	.word	0x1000000
	or	%g0, 0x79d, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xfe45aed8
	P_TOGGLE_LSU_DM
	P_IDEMAP_ALL_RPAGES
	.word	0xc070a7f0
thr4_MMU_ASI_BLK_P_217:
	.word	0x878020f0
	.word	0xc3bee140
	.word	0xe39c03c0
	.word	0x1000000
	or	%g0, 0x438, %i7
	P_READ_DDATA_ACCESS
	.word	0xbe164000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v002_exit:
	EXIT_GOOD
Thr4_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v101 DATA_VA=0x6f9000176000
attr_data {
	Name = .Thr4_User_Data_4v101 ,
	VA = 0x6f9000176000 ,/* 0x6f9000177fc0 */
	RA = 0x03d0056000 ,
	PA = 0x03d0056000 ,
	TTE_Context = 0x1b80 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006f9000176416 80000003d0056040 */
	end_label   = Thr4_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v101_data_begin
Thr4_User_Data_4v101_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v201 DATA_VA=0x7000003a0000
attr_data {
	Name = .Thr4_User_Data_4v201 ,
	VA = 0x7000003a0000 ,/* 0x7000003affc0 */
	RA = 0x0100380000 ,
	PA = 0x4d00380000 ,
	TTE_Context = 0x0dcb ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007000003a0dcb 8000004d00380441 */
	end_label   = Thr4_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v201_data_begin
Thr4_User_Data_4v201_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v301 DATA_VA=0x6f90001fc000
attr_data {
	Name = .Thr4_User_Data_4v301 ,
	VA = 0x6f90001fc000 ,/* 0x6f90001fdfc0 */
	RA = 0x03d010a000 ,
	PA = 0x03d010a000 ,
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
	/* DTTE_TAG_DATA = 00006f90001fc000 80000003d010a440 */
	end_label   = Thr4_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v301_data_begin
Thr4_User_Data_4v301_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v003 TEXT_VA=0x71003d800000
attr_text {
	Name = .Thr4_User_Text_4v003 ,
	VA = 0x71003d800000 ,/* 0x71003dbfffc0 */
	RA = 0x00a6000000 ,
	PA = 0x4ca6000000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000071003d801b80 8000004ca6000083 */
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
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85e0a0
	.word	0xe19fde20
	.word	0x1000000
	or	%g0, 0x074, %i7
	LOAD_DDATA_IN
	.word	0xfe4eec6e
	IDEMAP_ALL
	DDEMAP_PCTX
	.word	0xc022ad70
	.word	0xc0312daa
	.word	0xe05c20e0
	TOGGLE_LSU_IM
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5ee9d8
	.word	0x1000000
	or	%g0, 0x528, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x4f8, %i7
	ITLB_TAG_READ
	.word	0xf876e078
	.word	0xc076e710
	.word	0xbe82a008
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x04a, %i7
	LOAD_IDATA_IN
	.word	0xbe82a0c0
	.word	0xf6dfd000
	.word	0xc0742130
	.word	0x1000000
	.word	0xbe12c000
	IDEMAP_RPAGE
	.word	0xe1989f00
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xc02aa827
	.word	0x81c36000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v003_exit:
	EXIT_GOOD
Thr4_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v401 TEXT_VA=0x6f9000166000
attr_text {
	Name = .Thr4_User_Text_4v401 ,
	VA = 0x6f9000166000 ,/* 0x6f9000167fc0 */
	RA = 0x03d01a0000 ,
	PA = 0x03d01a0000 ,
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
	/* ITTE_TAG_DATA = 00006f9000166000 80000003d01a0080 */
	end_label   = Thr4_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v401_text_begin
Thr4_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x528, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x0a3, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x195, %i7
	P_LOAD_DDATA_ACCESS
	P_TOGGLE_LSU_IM
	P_DDEMAP_ALL_PAGES
	.word	0xbe85a098
	.word	0xe0dfc200
thr4_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_218:
	.word	0x87802018
	.word	0xe0f2a098
	.word	0xfe41a160
	.word	0xca732040
	.word	0xc0262b08
	.word	0xcc7720a8
	.word	0xc071a910
	P_ACCESS_ITSB_PTR
	.word	0xbe85a100
	.word	0xc4dfd000
	.word	0x1000000
	or	%g0, 0x2fc, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcda9000
	.word	0xfc9c8480
	.word	0xbe82a068
	.word	0xe0dfc200
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0xe8, %i7
	P_LOAD_IDATA_ACCESS
	P_TOGGLE_LSU_IM
	P_IDEMAP_ALL_PAGES
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x00b, %i7
	P_LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9c5c60
	P_ACCESS_ITSB_PTR
	.word	0xc0272c9c
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v401_exit:
	EXIT_GOOD
Thr4_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v004 TEXT_VA=0x700000c60000
attr_text {
	Name = .Thr4_User_Text_4v004 ,
	VA = 0x700000c60000 ,/* 0x700000c6ffc0 */
	RA = 0x0100ec0000 ,
	PA = 0x4d00ec0000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000700000c61b80 8000004d00ec0081 */
	end_label   = Thr4_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v004_text_begin
Thr4_User_Text_4v004_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xd65aa0a0
	nop
	nop
	P_TOGGLE_LSU_IM
	P_IDEMAP_ALL
	.word	0xfe48a202
	nop
	.word	0xf65c2008
	.word	0xc39a82c0
	.word	0xfcded000
	.word	0xfcda82a0
	P_TOGGLE_LSU_DM
thr4_MMU_ASI_AS_IF_USER_PRIMARY_219:
	.word	0x87802010
	.word	0xd6f2a010
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe16c000
	P_DDEMAP_RPAGE
	P_ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x378, %i7
	P_DTLB_TAG_READ
	P_IDEMAP_ALL
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v004_exit:
	EXIT_GOOD
Thr4_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v102 DATA_VA=0x700000ed0000
attr_data {
	Name = .Thr4_User_Data_4v102 ,
	VA = 0x700000ed0000 ,/* 0x700000edffc0 */
	RA = 0x0100260000 ,
	PA = 0x4d00260000 ,
	TTE_Context = 0x1b80 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000700000ed1b80 8000004d00260041 */
	end_label   = Thr4_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v102_data_begin
Thr4_User_Data_4v102_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v202 DATA_VA=0x710008400000
attr_data {
	Name = .Thr4_User_Data_4v202 ,
	VA = 0x710008400000 ,/* 0x7100087fffc0 */
	RA = 0x00a5800000 ,
	PA = 0x4ca5800000 ,
	TTE_Context = 0x0dcb ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000710008400dcb 8000004ca5800443 */
	end_label   = Thr4_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v202_data_begin
Thr4_User_Data_4v202_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v302 DATA_VA=0x6f9000130000
attr_data {
	Name = .Thr4_User_Data_4v302 ,
	VA = 0x6f9000130000 ,/* 0x6f9000131fc0 */
	RA = 0x03d01a4000 ,
	PA = 0x03d01a4000 ,
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
	/* DTTE_TAG_DATA = 00006f9000130000 80000003d01a4440 */
	end_label   = Thr4_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v302_data_begin
Thr4_User_Data_4v302_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v005 TEXT_VA=0x6f90000de000
attr_text {
	Name = .Thr4_User_Text_4v005 ,
	VA = 0x6f90000de000 ,/* 0x6f90000dffc0 */
	RA = 0x03d0192000 ,
	PA = 0x03d0192000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f90000de416 80000003d0192080 */
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
	.word	0xe19ade20
	IDEMAP_PCTX
	.word	0xbe80a0e0
	.word	0xd4dfd000
	.word	0xfe4ee034
thr4_MMU_ASI_SECONDARY_LITTLE_220:
	.word	0x87802089
	.word	0xd8f2e048
thr4_MMU_ASI_BLK_SL_221:
	.word	0x878020f9
	.word	0xe3b96240
	.word	0xbe154000
	GOTO_SUPERVISOR0
thr4_MMU_ASI_PRIMARY_222:
	.word	0x87802080
	.word	0xe8f2a088
	.word	0xd470a110
	.word	0xc032a218
	.word	0xfe492e62
	nop
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
	.word	0x1000000
	.word	0xbe140000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc45da068
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_PRIMARY_223:
	.word	0x87802080
	.word	0xc8bda4b0
	.word	0xc0242c0c
	.word	0x1000000
	or	%g0, 0x460, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xc075ac20
	.word	0xf272a060
	.word	0xc075af80
	TOGGLE_LSU_DM
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x530, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe5da358
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
	nop
	nop
	.word	0xfc991c40
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xec742068
	.word	0xc075a130
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x075, %i7
	LOAD_DDATA_IN
thr4_MMU_ASI_SECONDARY_224:
	.word	0x87802081
	.word	0xe8f46028
	.word	0x1000000
	.word	0xbe130000
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
thr4_MMU_ASI_PRIMARY_225:
	.word	0x87802080
	.word	0xdcf42028
	.word	0xc45c20c0
	TOGGLE_LSU_IM
	TOGGLE_LSU_IM
	.word	0xfe542a6a
	nop
	nop
	nop
	nop
	nop
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
	.word	0xe45c2018
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
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc45aa038
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v005_exit:
	EXIT_GOOD
Thr4_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v402 TEXT_VA=0x6f90000ce000
attr_text {
	Name = .Thr4_User_Text_4v402 ,
	VA = 0x6f90000ce000 ,/* 0x6f90000cffc0 */
	RA = 0x03d001e000 ,
	PA = 0x03d001e000 ,
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
	/* ITTE_TAG_DATA = 00006f90000ce000 80000003d001e080 */
	end_label   = Thr4_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v402_text_begin
Thr4_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x7f8, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0xd7, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfe462cdc
	.word	0xe05f20c0
	P_DDEMAP_ALL_PAGES
	P_TOGGLE_LSU_DM
thr4_MMU_ASI_AS_IF_USER_PRIMARY_226:
	.word	0x87802010
	.word	0xe0f12098
	P_DDEMAP_ALL_PAGES
	.word	0xca5e2010
	.word	0x1000000
	or	%g0, 0x428, %i7
	P_READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x07d, %i7
	P_LOAD_IDATA_IN
	.word	0xfcda9000
	.word	0xfcd91000
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8420e0
	.word	0xecdfc200
	.word	0xec762038
	.word	0xc02b2b11
thr4_MMU_ASI_PRIMARY_227:
	.word	0x87802080
	.word	0xfaf420b8
thr4_MMU_ASI_PRIMARY_228:
	.word	0x87802080
	.word	0xf0f42048
	.word	0x1000000
	or	%g0, 0x091, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x07d, %i7
	P_LOAD_DDATA_IN
thr4_MMU_ASI_PRIMARY_229:
	.word	0x87802080
	.word	0xe6f5a108
thr4_MMU_ASI_PRIMARY_230:
	.word	0x87802080
	.word	0xe8f2a028
	.word	0xbe80a120
	.word	0xf6dfd000
	P_DDEMAP_ALL_RPAGES
thr4_MMU_ASI_AS_IF_USER_PRIMARY_231:
	.word	0x87802010
	.word	0xdaf2a0b8
	.word	0xfcdad120
	.word	0x1000000
	or	%g0, 0x09a, %i7
	P_LOAD_DDATA_IN
	.word	0xfcdec200
thr4_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_232:
	.word	0x87802023
	.word	0xe0bc6570
	.word	0x1000000
	.word	0xbe17c000
	P_DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x550, %i7
	P_READ_IDATA_ACCESS
thr4_MMU_ASI_REAL_IO_LITTLE_233:
	.word	0x8780201d
	.word	0xc8f5e0c0
	.word	0xfcdc1000
	nop
	nop
	nop
	nop
	.word	0xc074af78
	.word	0xc39edf00
	P_TOGGLE_LSU_IM
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
	nop
	nop
	P_DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe168000
	P_IDEMAP_PAGE
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr4_User_Text_4v402_exit:
	EXIT_GOOD
Thr4_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v006 TEXT_VA=0x700000820000
attr_text {
	Name = .Thr4_User_Text_4v006 ,
	VA = 0x700000820000 ,/* 0x70000082ffc0 */
	RA = 0x01006f0000 ,
	PA = 0x4d006f0000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000700000821b80 8000004d006f0081 */
	end_label   = Thr4_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v006_text_begin
Thr4_User_Text_4v006_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x450, %i7
	P_READ_DDATA_ACCESS
	P_ACCESS_ITSB_PTR
	.word	0xfcded140
	.word	0x1000000
	or	%g0, 0x1f1, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfe5eef38
	.word	0x1000000
	or	%g0, 0x006, %i7
	P_LOAD_DDATA_IN
	.word	0xfe56e872
	.word	0xc02da86a
	.word	0x1000000
	or	%g0, 0x490, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe85e010
	.word	0xc39fde20
	.word	0xc45da0f0
	.word	0xfcda9000
	.word	0xe45ee018
	.word	0xfcdc0200
	P_DDEMAP_ALL_PAGES
	nop
	nop
	nop
thr4_MMU_ASI_AS_IF_USER_PRIMARY_234:
	.word	0x87802010
	.word	0xf6f42068
	P_IDEMAP_PCTX
	.word	0xbe85a120
	.word	0xc4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda8200
	.word	0xfcdc4320
	P_DDEMAP_ALL
	.word	0x1000000
	.word	0xbe158000
	P_DDEMAP_RPAGE
	P_TOGGLE_LSU_IM
	.word	0xec76e100
	.word	0xc02da4c2
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x078, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0xc8, %i7
	P_READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x084, %i7
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
	or	%g0, 0x356, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xc4742100
	.word	0xc025a73c
	.word	0xfcded000
thr4_MMU_ASI_SECONDARY_235:
	.word	0x87802081
	.word	0xe2f16010
	.word	0x1000000
	or	%g0, 0x65f, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcdd9040
	P_DDEMAP_NCTX
	.word	0xfc9c5120
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	P_ITLB_TAG_READ
	P_IDEMAP_ALL_RPAGES
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v006_exit:
	EXIT_GOOD
Thr4_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v103 DATA_VA=0x700000d80000
attr_data {
	Name = .Thr4_User_Data_4v103 ,
	VA = 0x700000d80000 ,/* 0x700000d8ffc0 */
	RA = 0x01001d0000 ,
	PA = 0x4d001d0000 ,
	TTE_Context = 0x1b80 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000700000d81b80 8000004d001d0041 */
	end_label   = Thr4_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v103_data_begin
Thr4_User_Data_4v103_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v203 DATA_VA=0x6f90001de000
attr_data {
	Name = .Thr4_User_Data_4v203 ,
	VA = 0x6f90001de000 ,/* 0x6f90001dffc0 */
	RA = 0x03d0160000 ,
	PA = 0x03d0160000 ,
	TTE_Context = 0x0dcb ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00006f90001de8e0 80000003d0160440 */
	end_label   = Thr4_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v203_data_begin
Thr4_User_Data_4v203_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v303 DATA_VA=0x6f9000016000
attr_data {
	Name = .Thr4_User_Data_4v303 ,
	VA = 0x6f9000016000 ,/* 0x6f9000017fc0 */
	RA = 0x03d000a000 ,
	PA = 0x03d000a000 ,
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
	/* DTTE_TAG_DATA = 00006f9000016000 80000003d000a440 */
	end_label   = Thr4_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v303_data_begin
Thr4_User_Data_4v303_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v007 TEXT_VA=0x700000d30000
attr_text {
	Name = .Thr4_User_Text_4v007 ,
	VA = 0x700000d30000 ,/* 0x700000d3ffc0 */
	RA = 0x0100ff0000 ,
	PA = 0x4d00ff0000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000700000d31b80 8000004d00ff0081 */
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
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x110, %i7
	ITLB_TAG_READ
	.word	0xee5da0a0
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02daa18
	.word	0x1000000
	.word	0xbe120000
	IDEMAP_RPAGE
	DDEMAP_PCTX
	.word	0xfe42a870
	DDEMAP_ALL_RPAGES
thr4_MMU_ASI_BLK_P_236:
	.word	0x878020f0
	.word	0xe1b8a1c0
	ACCESS_DTSB_PTR
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
	nop
	.word	0xc022a4f0
	.word	0xc076ec48
	nop
	nop
	nop
	nop
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xc0242150
	.word	0x1000000
	or	%g0, 0x588, %i7
	DTLB_TAG_READ
	.word	0xd275a080
	.word	0xc02eed51
	.word	0xfe592c48
	.word	0x1000000
	or	%g0, 0x012, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_PRIMARY_LITTLE_237:
	.word	0x87802088
	.word	0xeaf42060
	.word	0xfe5daa68
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_BLK_COMMIT_S_238:
	.word	0x878020e1
	.word	0xe3bc6100
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe44242c
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v007_exit:
	EXIT_GOOD
Thr4_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v008 TEXT_VA=0x6f900009e000
attr_text {
	Name = .Thr4_User_Text_4v008 ,
	VA = 0x6f900009e000 ,/* 0x6f900009ffc0 */
	RA = 0x03d00de000 ,
	PA = 0x03d00de000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f900009e416 80000003d00de080 */
	end_label   = Thr4_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v008_text_begin
Thr4_User_Text_4v008_text_begin:
	wrpr	0, %gl
	.word	0xbe82a110
	.word	0xd4dfc200
	nop
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_AS_IF_USER_PRIMARY_239:
	.word	0x87802010
	.word	0xccf2a0a8
	.word	0x1000000
	or	%g0, 0x06a, %i7
	P_LOAD_DDATA_IN
	.word	0xc02da57d
	.word	0x1000000
	.word	0xbe124000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_TOGGLE_LSU_DM
	.word	0xfa76e030
	.word	0xc020ab6c
	.word	0xd875a018
	.word	0xc02aac06
	P_IDEMAP_NCTX
	.word	0xfcdb42a0
	.word	0xd675a010
	.word	0xc072a2a8
	nop
	nop
	.word	0xbe842100
	.word	0xe0dfd000
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd276e108
	.word	0xc035a130
	.word	0xfcd942a0
	.word	0xbe86e0e0
	.word	0xc39fc2c0
	P_DDEMAP_SCTX
	.word	0xfc9ad120
thr4_MMU_ASI_SECONDARY_240:
	.word	0x87802081
	.word	0xe4baee10
	P_DDEMAP_ALL
	P_TOGGLE_LSU_DM
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v008_exit:
	EXIT_GOOD
Thr4_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v104 DATA_VA=0x710005800000
attr_data {
	Name = .Thr4_User_Data_4v104 ,
	VA = 0x710005800000 ,/* 0x710005bfffc0 */
	RA = 0x00a7c00000 ,
	PA = 0x4ca7c00000 ,
	TTE_Context = 0x1b80 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000710005801b80 8000004ca7c00043 */
	end_label   = Thr4_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v104_data_begin
Thr4_User_Data_4v104_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v304 DATA_VA=0x700000210000
attr_data {
	Name = .Thr4_User_Data_4v304 ,
	VA = 0x700000210000 ,/* 0x70000021ffc0 */
	RA = 0x0100da0000 ,
	PA = 0x4d00da0000 ,
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
	/* DTTE_TAG_DATA = 0000700000210000 8000004d00da0441 */
	end_label   = Thr4_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v304_data_begin
Thr4_User_Data_4v304_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v009 TEXT_VA=0x6f90001b8000
attr_text {
	Name = .Thr4_User_Text_4v009 ,
	VA = 0x6f90001b8000 ,/* 0x6f90001b9fc0 */
	RA = 0x03d0094000 ,
	PA = 0x03d0094000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f90001b8416 80000003d0094080 */
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
	nop
	nop
	nop
	nop
	.word	0xca5aa010
	.word	0xc036e690
	TOGGLE_LSU_DM
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x566, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_SCTX
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_PRIMARY_LITTLE_241:
	.word	0x87802088
	.word	0xd2f5a080
	.word	0x1000000
	or	%g0, 0x258, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	.word	0x1000000
	or	%g0, 0x183, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe128000
	IDEMAP_PAGE
	IDEMAP_ALL
	TOGGLE_LSU_DM
	.word	0xc075afa8
	.word	0x1000000
	or	%g0, 0x2a9, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcded000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc02aa1f3
	TOGGLE_LSU_DM
	.word	0xbe80a120
	.word	0xecdfd000
	nop
	nop
	nop
	nop
	nop
thr4_MMU_ASI_BLK_COMMIT_P_242:
	.word	0x878020e0
	.word	0xe1bda480
	.word	0xc026e950
	DDEMAP_NCTX
	.word	0xf65ee038
	.word	0x1000000
	or	%g0, 0x14c, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe52ab9c
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v009_exit:
	EXIT_GOOD
Thr4_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00a TEXT_VA=0x710011c00000
attr_text {
	Name = .Thr4_User_Text_4v00a ,
	VA = 0x710011c00000 ,/* 0x710011ffffc0 */
	RA = 0x00a4c00000 ,
	PA = 0x4ca4c00000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000710011c01b80 8000004ca4c00083 */
	end_label   = Thr4_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00a_text_begin
Thr4_User_Text_4v00a_text_begin:
	wrpr	0, %gl
	nop
	nop
	.word	0xda76e0b0
	.word	0xc0242130
	.word	0xfc995d60
	P_ACCESS_DTSB_PTR
	.word	0xd275a108
	.word	0xc0342a22
	.word	0x1000000
	.word	0xbe130000
	P_DDEMAP_RPAGE
	.word	0xfcdd9000
	.word	0xc072a438
	.word	0xbe82a008
	.word	0xf6dfc200
thr4_MMU_ASI_PRIMARY_243:
	.word	0x87802080
	.word	0xf0f2a018
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
	or	%g0, 0x2a0, %i7
	P_READ_DDATA_ACCESS
	.word	0xfcded000
	.word	0x1000000
	or	%g0, 0x067, %i7
	P_LOAD_IDATA_IN
	.word	0xbe842120
	.word	0xf6dfd000
	.word	0xd65aa070
	.word	0xc85da0c0
	.word	0xe05c2110
	.word	0xbe842038
	.word	0xecdfc200
	.word	0xfcded100
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe25aa070
	P_ACCESS_ITSB_PTR
thr4_MMU_ASI_PRIMARY_LITTLE_244:
	.word	0x87802088
	.word	0xd4f5a110
	P_ACCESS_DTSB_PTR
	.word	0xfc9d44c0
	.word	0x1000000
	or	%g0, 0x5f8, %i7
	P_READ_DDATA_ACCESS
	.word	0xfc9d85c0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe86e068
	.word	0xc4dfc200
	.word	0x1000000
	or	%g0, 0x758, %i7
	P_READ_DDATA_ACCESS
	.word	0xfe5ee2b0
	P_IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x095, %i7
	P_LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x551, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x90, %i7
	P_ITLB_TAG_READ
	.word	0xbe80a0c0
	.word	0xd4dfd000
thr4_MMU_ASI_AS_IF_USER_PRIMARY_245:
	.word	0x87802010
	.word	0xcef0a0f8
	.word	0xfe56e6f0
	.word	0xfcd94320
	.word	0xe39883c0
	.word	0xfe52a610
	.word	0xfcdec200
	.word	0xfc9e0580
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr4_User_Text_4v00a_exit:
	EXIT_GOOD
Thr4_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v105 DATA_VA=0x7209a0000000
attr_data {
	Name = .Thr4_User_Data_4v105 ,
	VA = 0x7209a0000000 ,/* 0x7209afffffc0 */
	RA = 0x01d0000000 ,
	PA = 0x4dd0000000 ,
	TTE_Context = 0x1b80 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007209a0001b80 8000004dd0000045 */
	end_label   = Thr4_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v105_data_begin
Thr4_User_Data_4v105_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00b TEXT_VA=0x6f90000e0000
attr_text {
	Name = .Thr4_User_Text_4v00b ,
	VA = 0x6f90000e0000 ,/* 0x6f90000e1fc0 */
	RA = 0x03d01c8000 ,
	PA = 0x03d01c8000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f90000e0416 80000003d01c8080 */
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
thr4_MMU_ASI_BLK_P_246:
	.word	0x878020f0
	.word	0xe1bee1c0
	.word	0x1000000
	or	%g0, 0x598, %i7
	LOAD_IDATA_ACCESS
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xcc5c2048
	ACCESS_DTSB_PTR
	.word	0xbe8420c0
	.word	0xe0dfd000
	nop
	nop
	nop
	nop
	nop
	.word	0xc02ee7f4
	.word	0xfa742020
	.word	0xc072a6f0
	.word	0x1000000
	or	%g0, 0x020, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x10, %i7
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
	.word	0xe05aa038
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x145, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe13c000
	GOTO_SUPERVISOR0
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
	or	%g0, 0x1c8, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0xfc9a9c40
	.word	0xc02c2ea6
	.word	0xfe45a594
thr4_MMU_ASI_PRIMARY_247:
	.word	0x87802080
	.word	0xc8f2a038
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xb0, %i7
	READ_IDATA_ACCESS
	.word	0xc02dae66
	.word	0xd65aa010
	.word	0xdc76e028
	.word	0xc075a240
	.word	0x1000000
	or	%g0, 0x1df, %i7
	LOAD_IDATA_ACCESS
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
	or	%g0, 0x3c0, %i7
	DTLB_TAG_READ
	.word	0xc02da69c
	.word	0x1000000
	or	%g0, 0x488, %i7
	DTLB_TAG_READ
	nop
	.word	0xfe5eec80
	DDEMAP_ALL_RPAGES
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xde76e0f8
	.word	0xc02daca2
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v00b_exit:
	EXIT_GOOD
Thr4_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v106 DATA_VA=0x700000a40000
attr_data {
	Name = .Thr4_User_Data_4v106 ,
	VA = 0x700000a40000 ,/* 0x700000a4ffc0 */
	RA = 0x01004b0000 ,
	PA = 0x4d004b0000 ,
	TTE_Context = 0x1b80 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000700000a41b80 8000004d004b0041 */
	end_label   = Thr4_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v106_data_begin
Thr4_User_Data_4v106_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00c TEXT_VA=0x6f90000fc000
attr_text {
	Name = .Thr4_User_Text_4v00c ,
	VA = 0x6f90000fc000 ,/* 0x6f90000fdfc0 */
	RA = 0x03d005e000 ,
	PA = 0x03d005e000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f90000fc416 80000003d005e080 */
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
thr4_MMU_ASI_PRIMARY_248:
	.word	0x87802080
	.word	0xf6f42068
	.word	0x1000000
	or	%g0, 0x42d, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe52afd8
	.word	0xfc9c1000
	ACCESS_ITSB_PTR
	TOGGLE_LSU_IM
	.word	0xfcda9000
	.word	0xfcda9000
	.word	0xfcdc1000
	nop
	nop
	nop
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xf67420f0
	.word	0xc024287c
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe170000
	IDEMAP_RPAGE
	.word	0xf0742018
	.word	0xc032ac72
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xf65c2038
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00c_exit:
	EXIT_GOOD
Thr4_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v107 DATA_VA=0x700000ea0000
attr_data {
	Name = .Thr4_User_Data_4v107 ,
	VA = 0x700000ea0000 ,/* 0x700000eaffc0 */
	RA = 0x0100f70000 ,
	PA = 0x4d00f70000 ,
	TTE_Context = 0x1b80 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000700000ea1b80 8000004d00f70041 */
	end_label   = Thr4_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v107_data_begin
Thr4_User_Data_4v107_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00d TEXT_VA=0x6f900018a000
attr_text {
	Name = .Thr4_User_Text_4v00d ,
	VA = 0x6f900018a000 ,/* 0x6f900018bfc0 */
	RA = 0x03d0118000 ,
	PA = 0x03d0118000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00006f900018a416 80000003d0118080 */
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
	IDEMAP_ALL_RPAGES
	nop
	nop
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
	.word	0xfcdc1000
	DDEMAP_ALL_PAGES
	.word	0xfcda9040
	.word	0x1000000
	or	%g0, 0x01b, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf276e080
	.word	0xc032a59c
	.word	0x1000000
	.word	0xbe144000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe42a040
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	.word	0xd45aa098
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xbe812068
	.word	0xc4dfd000
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x1b4, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_PCTX
	.word	0xf47120d8
	.word	0xc02da4ba
	.word	0xf076e078
	.word	0xc036ec64
	.word	0xfe4dae12
	nop
	nop
	nop
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
	.word	0x1000000
	or	%g0, 0xaa, %i7
	LOAD_IDATA_ACCESS
	.word	0xe19ddf20
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0xbe82a0f0
	.word	0xd4dfd000
	.word	0xfcda9000
	.word	0xfe45a5e8
	nop
	nop
	nop
	nop
	nop
	.word	0xfe58a810
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf476e0e8
	.word	0xc022acc8
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr4_User_Text_4v00d_exit:
	EXIT_GOOD
Thr4_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v108 DATA_VA=0x700000480000
attr_data {
	Name = .Thr4_User_Data_4v108 ,
	VA = 0x700000480000 ,/* 0x70000048ffc0 */
	RA = 0x0100510000 ,
	PA = 0x4d00510000 ,
	TTE_Context = 0x1b80 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000700000481b80 8000004d00510041 */
	end_label   = Thr4_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v108_data_begin
Thr4_User_Data_4v108_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00e TEXT_VA=0x710012c00000
attr_text {
	Name = .Thr4_User_Text_4v00e ,
	VA = 0x710012c00000 ,/* 0x710012ffffc0 */
	RA = 0x00ad400000 ,
	PA = 0x4cad400000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000710012c01b80 8000004cad400083 */
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
	.word	0x1000000
	.word	0xbe16c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DO_BRANCH
	.word	0x81c6a000
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe158000
	DDEMAP_PAGE
	ACCESS_DTSB_PTR
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xd45c2100
	.word	0xbe842090
	.word	0xc19fde00
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
	DDEMAP_PCTX
	.word	0xc030ae68
	.word	0xfe4c2362
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe168000
	GOTO_SUPERVISOR0
	.word	0xc032a2c8
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00e_exit:
	EXIT_GOOD
Thr4_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v109 DATA_VA=0x6f9000172000
attr_data {
	Name = .Thr4_User_Data_4v109 ,
	VA = 0x6f9000172000 ,/* 0x6f9000173fc0 */
	RA = 0x03d01a6000 ,
	PA = 0x03d01a6000 ,
	TTE_Context = 0x1b80 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00006f9000172416 80000003d01a6040 */
	end_label   = Thr4_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v109_data_begin
Thr4_User_Data_4v109_data_begin:
	.xword	0x710007c00000
	.xword	0x700000060000
	.xword	0x6f900000a000
	.xword	0x6f9000048000
	.xword	0x7000009e0000
	.xword	0x710021000000
	.xword	0x720530000000
	.xword	0x6f9000176000
	.xword	0x7000003a0000
	.xword	0x6f90001fc000
	.xword	0x71003d800000
	.xword	0x6f9000166000
	.xword	0x700000c60000
	.xword	0x700000ed0000
	.xword	0x710008400000
	.xword	0x6f9000130000
	.xword	0x6f90000de000
	.xword	0x6f90000ce000
	.xword	0x700000820000
	.xword	0x700000d80000
	.xword	0x6f90001de000
	.xword	0x6f9000016000
	.xword	0x700000d30000
	.xword	0x6f900009e000
	.xword	0x710005800000
	.xword	0x700000210000
	.xword	0x6f90001b8000
	.xword	0x710011c00000
	.xword	0x7209a0000000
	.xword	0x6f90000e0000
	.xword	0x700000a40000
	.xword	0x6f90000fc000
	.xword	0x700000ea0000
	.xword	0x6f900018a000
	.xword	0x700000480000
	.xword	0x710012c00000
	.xword	0x6f9000172000
	.xword	0x7000004e0000
Thr4_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00f TEXT_VA=0x7000004e0000
attr_text {
	Name = .Thr4_User_Text_4v00f ,
	VA = 0x7000004e0000 ,/* 0x7000004effc0 */
	RA = 0x0100750000 ,
	PA = 0x4d00750000 ,
	TTE_Context = 0x1b80 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007000004e1b80 8000004d00750081 */
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
	.word	0xbe80a068
	.word	0xc4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x28, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5ee3e0
	TOGGLE_LSU_DM
	.word	0xcc5aa018
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4ee0a9
	.word	0xfcd89000
thr4_MMU_ASI_PRIMARY_249:
	.word	0x87802080
	.word	0xdef0a128
thr4_MMU_ASI_PRIMARY_250:
	.word	0x87802080
	.word	0xe8f42028
	.word	0xfe4aaf01
	ACCESS_DTSB_PTR
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe86e098
	.word	0xd4dfd000
	.word	0xc0342ac4
	.word	0xe25aa070
	.word	0xd45c2038
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe168000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe85a038
	.word	0xc8dfd000
	.word	0xfe52ac34
	.word	0xc0242130
	.word	0x1000000
	or	%g0, 0x02d, %i7
	LOAD_IDATA_IN
	.word	0xd45c2068
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd9000
thr4_MMU_ASI_BLK_P_251:
	.word	0x878020f0
	.word	0xc1beedc0
	.word	0xc022a378
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
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xfe55af78
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe138000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xca5da010
	TOGGLE_LSU_IM
	DDEMAP_ALL
	.word	0xfe4eee52
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0x1000000
	.word	0xbe170000
	IDEMAP_RPAGE
	.word	0xe472a018
	.word	0xc0212b60
thr4_MMU_ASI_BLK_P_252:
	.word	0x878020f0
	.word	0xe3beee80
	.word	0xc075ab50
	IDEMAP_ALL_PAGES
	ACCESS_DTSB_PTR
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xee5c2070
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr4_User_Text_4v00f_exit:
	EXIT_GOOD
Thr4_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x73a000056000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	VA = 0x73a000056000 ,/* 0x73a000057fc0 */
	RA = 0x03e000e000 ,
	PA = 0x03e000e000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00005786b 80000003e000e080 */
	end_label   = Thr5_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr5_user_code_entry
Thr5_user_code_entry:
	setx	0x73a000178000, %g1, %g2
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
	ACCESS_ITSB_PTR
thr5_MMU_ASI_PRIMARY_253:
	.word	0x87802080
	.word	0xf6f2a0f8
	.word	0xfe5c2c48
	.word	0xec5aa0e0
	.word	0xc022a588
thr5_MMU_ASI_PRIMARY_254:
	.word	0x87802080
	.word	0xe8bc2e90
	IDEMAP_PCTX
	.word	0xfc9c1d40
	.word	0xfcdc1000
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xde75a080
	.word	0xc035a840
	.word	0xfe5da618
	TOGGLE_LSU_IM
	.word	0xfcd89000
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	.word	0xbe148000
	IDEMAP_PAGE
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x1d8, %i7
	READ_DDATA_ACCESS
	.word	0xfe48ae4d
	.word	0xec5aa068
	.word	0xfc995120
	.word	0xbe164000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	.word	0xc85aa068
thr5_MMU_ASI_BLK_SL_255:
	.word	0x878020f9
	.word	0xc3b961c0
	.word	0xf45aa068
thr5_MMU_ASI_PRIMARY_256:
	.word	0x87802080
	.word	0xeef5a048
thr5_MMU_ASI_PRIMARY_257:
	.word	0x87802080
	.word	0xe4f6a0a0
	.word	0xfe5da4d8
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
	.word	0x1000000
	or	%g0, 0x4bf, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xfe4daa1b
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	.word	0xfa5c2038
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd275a000
	.word	0xc075a9b8
	.word	0xfe4924af
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xca5f6040
	.word	0x1000000
	or	%g0, 0x026, %i7
	LOAD_DDATA_IN
	.word	0xfe4aaa37
	.word	0xce72a118
	.word	0xc027670c
	.word	0xe05c2098
	.word	0xfc9d9c40
	.word	0xc85da038
	.word	0x1000000
	or	%g0, 0x0aa, %i7
	LOAD_DDATA_IN
	.word	0xfe4da05c
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xee5da048
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v000_exit:
	EXIT_GOOD
Thr5_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v100 DATA_VA=0x73a000178000
attr_data {
	Name = .Thr5_User_Data_4v100 ,
	VA = 0x73a000178000 ,/* 0x73a000179fc0 */
	RA = 0x03e0166000 ,
	PA = 0x03e0166000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000073a00017986b 80000003e0166440 */
	end_label   = Thr5_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v100_data_begin
Thr5_User_Data_4v100_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v200 DATA_VA=0x73a0001ba000
attr_data {
	Name = .Thr5_User_Data_4v200 ,
	VA = 0x73a0001ba000 ,/* 0x73a0001bbfc0 */
	RA = 0x03e012a000 ,
	PA = 0x03e012a000 ,
	TTE_Context = 0x0081 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000073a0001ba081 80000003e012a040 */
	end_label   = Thr5_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v200_data_begin
Thr5_User_Data_4v200_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v300 DATA_VA=0x73a00009c000
attr_data {
	Name = .Thr5_User_Data_4v300 ,
	VA = 0x73a00009c000 ,/* 0x73a00009dfc0 */
	RA = 0x03e002a000 ,
	PA = 0x5fe002a000 ,
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
	/* DTTE_TAG_DATA = 000073a00009c000 8000005fe002a040 */
	end_label   = Thr5_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v300_data_begin
Thr5_User_Data_4v300_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v001 TEXT_VA=0x73a000188000
attr_text {
	Name = .Thr5_User_Text_4v001 ,
	VA = 0x73a000188000 ,/* 0x73a000189fc0 */
	RA = 0x03e0162000 ,
	PA = 0x03e0162000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00018986b 80000003e0162080 */
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
	.word	0xfcda9000
	.word	0xbe812090
	.word	0xe39fde00
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfa5c2038
	.word	0xfcde9000
	.word	0x1000000
	or	%g0, 0x179, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x03f, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe13c000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x630, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xbe846010
	.word	0xd6dfd060
	.word	0x1000000
	or	%g0, 0x57e, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	.word	0xbe138000
	IDEMAP_RPAGE
	IDEMAP_ALL_RPAGES
	ACCESS_DTSB_PTR
	.word	0xfe4eafcc
	.word	0xbe85a098
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x50a, %i7
	LOAD_IDATA_ACCESS
	ACCESS_DTSB_PTR
thr5_MMU_ASI_BLK_COMMIT_P_258:
	.word	0x878020e0
	.word	0xc3bda280
	ACCESS_ITSB_PTR
	TOGGLE_LSU_IM
	.word	0xfc9a9c40
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcde9100
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc02122fc
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v001_exit:
	EXIT_GOOD
Thr5_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v400 TEXT_VA=0x7400005e0000
attr_text {
	Name = .Thr5_User_Text_4v400 ,
	VA = 0x7400005e0000 ,/* 0x7400005effc0 */
	RA = 0x0110910000 ,
	PA = 0x5d10910000 ,
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
	/* ITTE_TAG_DATA = 00007400005e0000 8000005d10910081 */
	end_label   = Thr5_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v400_text_begin
Thr5_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xfc9c8580
	P_TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x62, %i7
	P_LOAD_DDATA_ACCESS
thr5_MMU_ASI_BLK_COMMIT_S_259:
	.word	0x878020e1
	.word	0xe1baebc0
	.word	0xbe842130
	.word	0xfadfc200
	.word	0xfcdc1000
	P_IDEMAP_ALL
	.word	0xfc9c85e0
	P_IDEMAP_ALL_RPAGES
	P_IDEMAP_NCTX
thr5_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_260:
	.word	0x87802018
	.word	0xf4f42038
	P_IDEMAP_ALL_RPAGES
	.word	0xbe86a120
	.word	0xf4dfd000
	.word	0xbe85a0e0
	.word	0xf4dfd000
	.word	0xfe4b2305
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x524, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfcd95060
	.word	0x1000000
	or	%g0, 0x096, %i7
	P_LOAD_IDATA_IN
thr5_MMU_ASI_BLK_COMMIT_P_261:
	.word	0x878020e0
	.word	0xc3bc2880
	.word	0xbe16c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v400_exit:
	EXIT_GOOD
Thr5_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v002 TEXT_VA=0x750012800000
attr_text {
	Name = .Thr5_User_Text_4v002 ,
	VA = 0x750012800000 ,/* 0x750012bfffc0 */
	RA = 0x00b8800000 ,
	PA = 0x00b8800000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000075001280186b 80000000b8800083 */
	end_label   = Thr5_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v002_text_begin
Thr5_User_Text_4v002_text_begin:
	wrpr	0, %gl
	P_DDEMAP_ALL
	P_DDEMAP_ALL
thr5_MMU_ASI_SECONDARY_LITTLE_262:
	.word	0x87802089
	.word	0xf0b96af0
	.word	0xbe82a008
	.word	0xfadfc200
	.word	0x1000000
	.word	0xbe128000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x6a5, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xc85ea120
	.word	0x1000000
	or	%g0, 0x3cb, %i7
	P_LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x480, %i7
	P_READ_IDATA_ACCESS
	.word	0xc02427ec
	.word	0x1000000
	.word	0xbe160000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	.word	0xbe120000
	P_DDEMAP_RPAGE
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe19ac2e0
	P_TOGGLE_LSU_IM
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v002_exit:
	EXIT_GOOD
Thr5_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v101 DATA_VA=0x750013000000
attr_data {
	Name = .Thr5_User_Data_4v101 ,
	VA = 0x750013000000 ,/* 0x7500133fffc0 */
	RA = 0x00bfc00000 ,
	PA = 0x00bfc00000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000075001300186b 80000000bfc00443 */
	end_label   = Thr5_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v101_data_begin
Thr5_User_Data_4v101_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v201 DATA_VA=0x73a0001bc000
attr_data {
	Name = .Thr5_User_Data_4v201 ,
	VA = 0x73a0001bc000 ,/* 0x73a0001bdfc0 */
	RA = 0x03e0106000 ,
	PA = 0x03e0106000 ,
	TTE_Context = 0x0081 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000073a0001bc081 80000003e0106040 */
	end_label   = Thr5_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v201_data_begin
Thr5_User_Data_4v201_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v301 DATA_VA=0x73a0000a0000
attr_data {
	Name = .Thr5_User_Data_4v301 ,
	VA = 0x73a0000a0000 ,/* 0x73a0000a1fc0 */
	RA = 0x03e01ea000 ,
	PA = 0x5fe01ea000 ,
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
	/* DTTE_TAG_DATA = 000073a0000a0000 8000005fe01ea040 */
	end_label   = Thr5_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v301_data_begin
Thr5_User_Data_4v301_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v003 TEXT_VA=0x7604b0000000
attr_text {
	Name = .Thr5_User_Text_4v003 ,
	VA = 0x7604b0000000 ,/* 0x7604bfffffc0 */
	RA = 0x0370000000 ,
	PA = 0x0370000000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007604b000186b 8000000370000085 */
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
	.word	0xd8742018
	.word	0xc0776c58
	nop
	nop
	nop
	nop
	nop
	.word	0xbe842068
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x4a8, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x11b, %i7
	LOAD_IDATA_ACCESS
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
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x048, %i7
	LOAD_IDATA_IN
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	.word	0xfa5da098
	.word	0xfcdf5140
	.word	0x1000000
	or	%g0, 0x789, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x178, %i7
	ITLB_TAG_READ
	.word	0xfa5c20e0
	.word	0x1000000
	.word	0xbe150000
	IDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe85a130
	.word	0xe0dfd000
	.word	0xd275a138
	.word	0xc0376498
	.word	0xfe5c2f60
	DDEMAP_PCTX
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xfe4aac03
	.word	0x1000000
	or	%g0, 0x01a, %i7
	LOAD_IDATA_IN
	.word	0xbe85a038
	.word	0xe0dfd000
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x5e8, %i7
	DTLB_TAG_READ
	.word	0xc85c2100
	.word	0x1000000
	or	%g0, 0x1ef, %i7
	LOAD_IDATA_ACCESS
	.word	0xe25aa010
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0342140
	.word	0xf2776028
	.word	0xc0212524
	.word	0xc0342f68
	TOGGLE_LSU_IM
	DDEMAP_ALL_RPAGES
	.word	0xc0342b5a
	nop
	nop
	nop
	nop
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc03426e4
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v003_exit:
	EXIT_GOOD
Thr5_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v401 TEXT_VA=0x73a0001e6000
attr_text {
	Name = .Thr5_User_Text_4v401 ,
	VA = 0x73a0001e6000 ,/* 0x73a0001e7fc0 */
	RA = 0x03e012e000 ,
	PA = 0x5fe012e000 ,
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
	/* ITTE_TAG_DATA = 000073a0001e6000 8000005fe012e080 */
	end_label   = Thr5_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v401_text_begin
Thr5_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0xfcd90200
	P_DDEMAP_SCTX
	.word	0xbe842098
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe144000
	P_IDEMAP_RPAGE
	.word	0xfcdc0200
	P_DDEMAP_ALL
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_263:
	.word	0x8780202a
	.word	0xf8bc2c40
	.word	0xee74a018
	.word	0xc071afb8
	.word	0xd45de110
	.word	0xfc99c4c0
	.word	0xbe86a130
	.word	0xf4dfd000
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x440, %i7
	P_READ_IDATA_ACCESS
	.word	0xe05de068
	nop
	.word	0xfcde9000
	.word	0xfcdc0200
	.word	0xdc71a028
	.word	0xc029a269
	.word	0xfcdd4280
	.word	0xfc9c8480
thr5_MMU_ASI_PRIMARY_264:
	.word	0x87802080
	.word	0xd0f2a088
	P_ACCESS_ITSB_PTR
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc029ac70
	.word	0xbe85a098
	.word	0xc8dfd000
	.word	0xfcdc1000
	.word	0xfcde9000
	.word	0x1000000
	or	%g0, 0x094, %i7
	P_LOAD_IDATA_IN
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v401_exit:
	EXIT_GOOD
Thr5_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v004 TEXT_VA=0x73a000014000
attr_text {
	Name = .Thr5_User_Text_4v004 ,
	VA = 0x73a000014000 ,/* 0x73a000015fc0 */
	RA = 0x03e0122000 ,
	PA = 0x03e0122000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00001586b 80000003e0122080 */
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
	nop
	nop
thr5_MMU_ASI_PRIMARY_265:
	.word	0x87802080
	.word	0xf4f42110
	P_TOGGLE_LSU_IM
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_266:
	.word	0x8780202b
	.word	0xecb96800
	.word	0xfa5c2130
	.word	0xbe826110
	.word	0xeedfc280
	.word	0x1000000
	or	%g0, 0x03c, %i7
	P_LOAD_IDATA_IN
	P_TOGGLE_LSU_IM
	.word	0xc072a358
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_267:
	.word	0x8780202a
	.word	0xdcbc26b0
	P_IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xec5f6100
	.word	0xbe11c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v004_exit:
	EXIT_GOOD
Thr5_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v102 DATA_VA=0x740000b60000
attr_data {
	Name = .Thr5_User_Data_4v102 ,
	VA = 0x740000b60000 ,/* 0x740000b6ffc0 */
	RA = 0x0110d30000 ,
	PA = 0x0110d30000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000b6186b 8000000110d30441 */
	end_label   = Thr5_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v102_data_begin
Thr5_User_Data_4v102_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v202 DATA_VA=0x73a000010000
attr_data {
	Name = .Thr5_User_Data_4v202 ,
	VA = 0x73a000010000 ,/* 0x73a000011fc0 */
	RA = 0x03e010c000 ,
	PA = 0x03e010c000 ,
	TTE_Context = 0x0081 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000073a000010081 80000003e010c040 */
	end_label   = Thr5_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v202_data_begin
Thr5_User_Data_4v202_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v302 DATA_VA=0x760460000000
attr_data {
	Name = .Thr5_User_Data_4v302 ,
	VA = 0x760460000000 ,/* 0x76046fffffc0 */
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
	/* DTTE_TAG_DATA = 0000760460000000 8000005e50000045 */
	end_label   = Thr5_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v302_data_begin
Thr5_User_Data_4v302_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v005 TEXT_VA=0x73a0000d0000
attr_text {
	Name = .Thr5_User_Text_4v005 ,
	VA = 0x73a0000d0000 ,/* 0x73a0000d1fc0 */
	RA = 0x03e0028000 ,
	PA = 0x03e0028000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a0000d186b 80000003e0028080 */
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
	.word	0xfe5766a8
thr5_MMU_ASI_PRIMARY_268:
	.word	0x87802080
	.word	0xcaf5a040
	.word	0xfe4ead7f
thr5_MMU_ASI_PRIMARY_269:
	.word	0x87802080
	.word	0xcaf2a010
	.word	0x1000000
	.word	0xbe160000
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
	.word	0xfcd89000
	.word	0xbe846070
	.word	0xcadfd060
	.word	0xd45aa038
thr5_MMU_ASI_PRIMARY_LITTLE_270:
	.word	0x87802088
	.word	0xe0f5a0e0
	.word	0xfe5aa500
thr5_MMU_ASI_BLK_PL_271:
	.word	0x878020f8
	.word	0xc3bc2140
	TOGGLE_LSU_IM
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0xc035a9c0
	ACCESS_ITSB_PTR
	.word	0xbe150000
	GOTO_SUPERVISOR1
thr5_MMU_ASI_SECONDARY_272:
	.word	0x87802081
	.word	0xdcbaebd0
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x18d, %i7
	LOAD_DDATA_ACCESS
	.word	0xc02daae8
	.word	0xbe120000
	GOTO_SUPERVISOR1
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe11c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xbe80a130
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
thr5_MMU_ASI_PRIMARY_273:
	.word	0x87802080
	.word	0xd6f42010
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd6742010
	.word	0xc0292140
	.word	0x81c0e088
	.word	0xbe154000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v005_exit:
	EXIT_GOOD
Thr5_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v402 TEXT_VA=0x740000410000
attr_text {
	Name = .Thr5_User_Text_4v402 ,
	VA = 0x740000410000 ,/* 0x74000041ffc0 */
	RA = 0x0110990000 ,
	PA = 0x5d10990000 ,
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
	/* ITTE_TAG_DATA = 0000740000410000 8000005d10990081 */
	end_label   = Thr5_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v402_text_begin
Thr5_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0xfcd95020
	P_ACCESS_DTSB_PTR
	.word	0xbe85a068
	.word	0xd4dfc200
	.word	0xfc9c8480
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda8200
thr5_MMU_ASI_AS_IF_USER_PRIMARY_274:
	.word	0x87802010
	.word	0xc8f2a0d0
	.word	0xc39e9e00
	.word	0xda732108
	.word	0xc034a88a
	.word	0xbe85a100
	.word	0xfadfd000
	.word	0xf67320c0
	.word	0xc029a564
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_TOGGLE_LSU_IM
	P_TOGGLE_LSU_IM
	.word	0xfcda9000
	.word	0xf4732098
	.word	0xc031aa6e
thr5_MMU_ASI_REAL_MEM_LITTLE_275:
	.word	0x8780201c
	.word	0xeaf62050
	P_DDEMAP_PCTX
	P_DDEMAP_NCTX
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v402_exit:
	EXIT_GOOD
Thr5_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v006 TEXT_VA=0x73a00007a000
attr_text {
	Name = .Thr5_User_Text_4v006 ,
	VA = 0x73a00007a000 ,/* 0x73a00007bfc0 */
	RA = 0x03e010e000 ,
	PA = 0x03e010e000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00007b86b 80000003e010e080 */
	end_label   = Thr5_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v006_text_begin
Thr5_User_Text_4v006_text_begin:
	wrpr	0, %gl
	P_TOGGLE_LSU_DM
thr5_MMU_ASI_PRIMARY_276:
	.word	0x87802080
	.word	0xeaf42060
thr5_MMU_ASI_AS_IF_USER_PRIMARY_277:
	.word	0x87802010
	.word	0xe6f42050
	P_ACCESS_ITSB_PTR
	.word	0xbe82a038
	.word	0xfadfc200
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
	or	%g0, 0x90, %i7
	P_ITLB_TAG_READ
	.word	0xbe842098
	.word	0xd4dfd000
	.word	0xfe5c2208
	.word	0x1000000
	or	%g0, 0x5db, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfc989000
	.word	0x1000000
	or	%g0, 0x5c8, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	P_READ_IDATA_ACCESS
	P_IDEMAP_NCTX
thr5_MMU_ASI_PRIMARY_278:
	.word	0x87802080
	.word	0xf8f2a058
thr5_MMU_ASI_PRIMARY_279:
	.word	0x87802080
	.word	0xecf42068
	.word	0x1000000
	or	%g0, 0x006, %i7
	P_LOAD_DDATA_IN
	.word	0xbe82e040
	.word	0xcadfd060
	.word	0x1000000
	.word	0xbe178000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
thr5_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_280:
	.word	0x87802022
	.word	0xd4bead30
	.word	0xfcd88200
	.word	0xfe45a818
	nop
	nop
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
	.word	0xbe842038
	.word	0xc8dfd000
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xbe85a068
	.word	0xd4dfd000
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR0
	nop
Thr5_User_Text_4v006_exit:
	EXIT_GOOD
Thr5_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v103 DATA_VA=0x750005000000
attr_data {
	Name = .Thr5_User_Data_4v103 ,
	VA = 0x750005000000 ,/* 0x7500053fffc0 */
	RA = 0x00b5000000 ,
	PA = 0x00b5000000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000075000500186b 80000000b5000443 */
	end_label   = Thr5_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v103_data_begin
Thr5_User_Data_4v103_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v303 DATA_VA=0x73a000002000
attr_data {
	Name = .Thr5_User_Data_4v303 ,
	VA = 0x73a000002000 ,/* 0x73a000003fc0 */
	RA = 0x03e00b2000 ,
	PA = 0x5fe00b2000 ,
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
	/* DTTE_TAG_DATA = 000073a000002000 8000005fe00b2040 */
	end_label   = Thr5_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v303_data_begin
Thr5_User_Data_4v303_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v007 TEXT_VA=0x7400005f0000
attr_text {
	Name = .Thr5_User_Text_4v007 ,
	VA = 0x7400005f0000 ,/* 0x7400005fffc0 */
	RA = 0x0110d60000 ,
	PA = 0x0110d60000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007400005f186b 8000000110d60081 */
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
	nop
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x590, %i7
	READ_DDATA_ACCESS
thr5_MMU_ASI_PRIMARY_281:
	.word	0x87802080
	.word	0xdcf76028
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4c231c
	.word	0x1000000
	or	%g0, 0x02e, %i7
	LOAD_DDATA_IN
	.word	0xbe876098
	.word	0xecdfd040
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x508, %i7
	ITLB_TAG_READ
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x25b, %i7
	LOAD_DDATA_ACCESS
	.word	0xd65ea010
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
thr5_MMU_ASI_PRIMARY_282:
	.word	0x87802080
	.word	0xeaf5a0c0
	nop
	nop
	nop
thr5_MMU_ASI_SECONDARY_283:
	.word	0x87802081
	.word	0xc8b96ca0
	.word	0xc02aa71b
	TOGGLE_LSU_IM
	.word	0xfa72a068
	.word	0xc035a140
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0776a60
	.word	0x1000000
	or	%g0, 0xa4, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x170, %i7
	READ_IDATA_ACCESS
	.word	0xe05c2038
thr5_MMU_ASI_PRIMARY_284:
	.word	0x87802080
	.word	0xcef12030
	.word	0xe05aa0b8
	.word	0x1000000
	or	%g0, 0x000, %i7
	LOAD_IDATA_IN
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xf4742100
	.word	0xc0212140
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x040, %i7
	LOAD_DDATA_IN
	.word	0xfe42a474
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0xe, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xe3995f20
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x411, %i7
	LOAD_IDATA_ACCESS
	.word	0xfcdf5000
	.word	0xbe876068
	.word	0xf4dfd000
	.word	0xe4742018
	.word	0xc036a560
	.word	0xbe846070
	.word	0xc39fde20
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5dacc8
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v007_exit:
	EXIT_GOOD
Thr5_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v403 TEXT_VA=0x7400008d0000
attr_text {
	Name = .Thr5_User_Text_4v403 ,
	VA = 0x7400008d0000 ,/* 0x7400008dffc0 */
	RA = 0x01105e0000 ,
	PA = 0x5d105e0000 ,
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
	/* ITTE_TAG_DATA = 00007400008d0000 8000005d105e0081 */
	end_label   = Thr5_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v403_text_begin
Thr5_User_Text_4v403_text_begin:
	wrpr	0, %gl
thr5_MMU_ASI_REAL_MEM_LITTLE_285:
	.word	0x8780201c
	.word	0xccf6e018
	.word	0xfe5b2648
	.word	0xbe842098
	.word	0xfadfc200
	.word	0xee71a018
	.word	0xc031a140
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x1f1, %i7
	P_LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8120b8
	.word	0xeadfc280
	.word	0xec59a038
	.word	0xc074acc0
	.word	0xfc9b04e0
	P_DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x78, %i7
	P_READ_IDATA_ACCESS
	.word	0xcc74a048
	.word	0xc02b294f
	.word	0xbe85a098
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe17c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0xe05b20b8
	.word	0xfcdd9000
	.word	0xbe876038
	.word	0xe0dfd000
thr5_MMU_ASI_BLK_P_286:
	.word	0x878020f0
	.word	0xe1bf66c0
thr5_MMU_ASI_PRIMARY_287:
	.word	0x87802080
	.word	0xdef760a8
	.word	0x1000000
	.word	0xbe108000
	P_DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0x785, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcda8200
	.word	0x1000000
	or	%g0, 0x09b, %i7
	P_LOAD_IDATA_IN
thr5_MMU_ASI_AS_IF_USER_PRIMARY_288:
	.word	0x87802010
	.word	0xeef6a018
	.word	0xf671a080
	.word	0xc02ca5db
	.word	0xfe45ea94
	.word	0xfc9985e0
	.word	0x1000000
	.word	0xbe120000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x10d, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfcdd8200
	.word	0xfe5b25d0
	P_ACCESS_DTSB_PTR
	.word	0xfa732098
	.word	0xc024a278
	P_IDEMAP_PCTX
	.word	0xc075ea00
	.word	0xbe842098
	.word	0xecdfd000
	.word	0xc19c5f20
	.word	0xec5b2008
	nop
	nop
	P_DDEMAP_ALL_PAGES
	P_IDEMAP_NCTX
	nop
	.word	0xfe41ac38
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v403_exit:
	EXIT_GOOD
Thr5_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v104 DATA_VA=0x740000030000
attr_data {
	Name = .Thr5_User_Data_4v104 ,
	VA = 0x740000030000 ,/* 0x74000003ffc0 */
	RA = 0x0110610000 ,
	PA = 0x0110610000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000074000003186b 8000000110610441 */
	end_label   = Thr5_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v104_data_begin
Thr5_User_Data_4v104_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v008 TEXT_VA=0x7601c0000000
attr_text {
	Name = .Thr5_User_Text_4v008 ,
	VA = 0x7601c0000000 ,/* 0x7601cfffffc0 */
	RA = 0x0220000000 ,
	PA = 0x0220000000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007601c000186b 8000000220000085 */
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
	.word	0x1000000
	or	%g0, 0x024, %i7
	LOAD_IDATA_IN
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x002, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x20, %i7
	ITLB_TAG_READ
	.word	0xfe54276c
thr5_MMU_ASI_BLK_PL_289:
	.word	0x878020f8
	.word	0xc3baa380
	.word	0xc0242140
	.word	0xc036ad18
	.word	0xc0742db8
	IDEMAP_NCTX
	.word	0xc035aa60
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x2dd, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x028, %i7
	LOAD_DDATA_IN
	.word	0xbe86a068
	.word	0xecdfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x16d, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe82a098
	.word	0xe0dfd000
	ACCESS_ITSB_PTR
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
	.word	0xfe4ea0e9
	.word	0x1000000
	or	%g0, 0x120, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcda9000
	TOGGLE_LSU_IM
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
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	LOAD_IDATA_ACCESS
thr5_MMU_ASI_BLK_COMMIT_P_290:
	.word	0x878020e0
	.word	0xc1bda880
	.word	0xc036a9d8
	.word	0x1000000
	.word	0xbe15c000
	DDEMAP_PAGE
	.word	0xc035a5d8
	.word	0xbe170000
	GOTO_SUPERVISOR1
	.word	0xc0242330
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v008_exit:
	EXIT_GOOD
Thr5_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v404 TEXT_VA=0x73a000050000
attr_text {
	Name = .Thr5_User_Text_4v404 ,
	VA = 0x73a000050000 ,/* 0x73a000051fc0 */
	RA = 0x03e0044000 ,
	PA = 0x5fe0044000 ,
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
	/* ITTE_TAG_DATA = 000073a000050000 8000005fe0044080 */
	end_label   = Thr5_User_Text_4v404_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v404_text_begin
Thr5_User_Text_4v404_text_begin:
	wrpr	0, %gl
	.word	0xc871a098
	.word	0xc029af00
	.word	0xbe85a0b8
	.word	0xfadfc200
	.word	0xfcdd8200
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe1995e20
	.word	0x1000000
	.word	0xbe150000
	P_IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x48, %i7
	P_READ_DDATA_ACCESS
	P_ACCESS_ITSB_PTR
	.word	0xfe41ad5c
	.word	0x1000000
	or	%g0, 0x181, %i7
	P_LOAD_IDATA_ACCESS
thr5_MMU_ASI_PRIMARY_291:
	.word	0x87802080
	.word	0xf2f5a0c8
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x03e, %i7
	P_LOAD_DDATA_IN
	.word	0xfcde9100
	.word	0x1000000
	or	%g0, 0x618, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe164000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	P_ACCESS_DTSB_PTR
	.word	0xcc5b2018
	.word	0x1000000
	.word	0xbe160000
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
thr5_MMU_ASI_AS_IF_USER_PRIMARY_292:
	.word	0x87802010
	.word	0xd8f5a018
thr5_MMU_ASI_PRIMARY_293:
	.word	0x87802080
	.word	0xdef42138
	.word	0xcc71a078
	.word	0xc075ea20
	.word	0x1000000
	or	%g0, 0x065, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x3b0, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x52b, %i7
	P_LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x04d, %i7
	P_LOAD_DDATA_IN
	.word	0xfcdf4280
	P_DDEMAP_ALL_RPAGES
	.word	0xfe5debc8
	.word	0xfc9b04e0
	P_DDEMAP_ALL_RPAGES
	.word	0xf459a098
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_294:
	.word	0x87802018
	.word	0xcef5a050
	.word	0xfcda9000
	.word	0x1000000
	or	%g0, 0x50, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x148, %i7
	P_ITLB_TAG_READ
	nop
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr5_User_Text_4v404_exit:
	EXIT_GOOD
Thr5_User_Text_4v404_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v105 DATA_VA=0x740000490000
attr_data {
	Name = .Thr5_User_Data_4v105 ,
	VA = 0x740000490000 ,/* 0x74000049ffc0 */
	RA = 0x01102f0000 ,
	PA = 0x01102f0000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000074000049186b 80000001102f0441 */
	end_label   = Thr5_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v105_data_begin
Thr5_User_Data_4v105_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v009 TEXT_VA=0x73a000180000
attr_text {
	Name = .Thr5_User_Text_4v009 ,
	VA = 0x73a000180000 ,/* 0x73a000181fc0 */
	RA = 0x03e0058000 ,
	PA = 0x03e0058000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00018186b 80000003e0058080 */
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
	DDEMAP_SCTX
	.word	0xc0242e4c
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x438, %i7
	READ_IDATA_ACCESS
	.word	0xc02aaba5
	.word	0xc0742fa0
	.word	0x1000000
	or	%g0, 0x68, %i7
	DTLB_TAG_READ
	.word	0xbe842038
	.word	0xfadfd000
	IDEMAP_ALL_RPAGES
thr5_MMU_ASI_PRIMARY_LITTLE_295:
	.word	0x87802088
	.word	0xe2f6a010
	.word	0xc02c2a50
	.word	0xfcdc1000
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x1ca, %i7
	LOAD_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x063, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_IM
	.word	0xc0776210
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x491, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x5f0, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0xc6, %i7
	LOAD_DDATA_ACCESS
	.word	0xf470a068
	.word	0xc0292a37
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe45da018
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v009_exit:
	EXIT_GOOD
Thr5_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v106 DATA_VA=0x7603a0000000
attr_data {
	Name = .Thr5_User_Data_4v106 ,
	VA = 0x7603a0000000 ,/* 0x7603afffffc0 */
	RA = 0x01f0000000 ,
	PA = 0x01f0000000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007603a000186b 80000001f0000445 */
	end_label   = Thr5_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v106_data_begin
Thr5_User_Data_4v106_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00a TEXT_VA=0x73a00011a000
attr_text {
	Name = .Thr5_User_Text_4v00a ,
	VA = 0x73a00011a000 ,/* 0x73a00011bfc0 */
	RA = 0x03e0130000 ,
	PA = 0x03e0130000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00011b86b 80000003e0130080 */
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
	.word	0xd4776038
	.word	0xc020a99c
	TOGGLE_LSU_DM
	DDEMAP_SCTX
	.word	0xf875a088
	.word	0xc026aac8
	.word	0x1000000
	or	%g0, 0x1cd, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe85a068
	.word	0xfadfd000
	.word	0xfe4c2e16
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x140, %i7
	READ_IDATA_ACCESS
	.word	0xfe5aac88
	.word	0xfe4428c4
	.word	0xfe56af56
	.word	0x1000000
	or	%g0, 0x132, %i7
	LOAD_IDATA_ACCESS
	.word	0xc0276140
	TOGGLE_LSU_IM
	DDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ACCESS_ITSB_PTR
	DDEMAP_PCTX
	TOGGLE_LSU_DM
	ACCESS_ITSB_PTR
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	.word	0xc021280c
	.word	0x1000000
	or	%g0, 0x508, %i7
	READ_DDATA_ACCESS
thr5_MMU_ASI_PRIMARY_LITTLE_296:
	.word	0x87802088
	.word	0xd8f12018
	.word	0xc0242ef8
	nop
	nop
	nop
	.word	0xec592098
	.word	0xfe45ad5c
	.word	0xe276a010
	.word	0xc076a850
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfe5aa808
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x2b7, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xbe842038
	.word	0xd4dfd000
	TOGGLE_LSU_IM
	DDEMAP_PCTX
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xca5da010
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00a_exit:
	EXIT_GOOD
Thr5_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v107 DATA_VA=0x740000dd0000
attr_data {
	Name = .Thr5_User_Data_4v107 ,
	VA = 0x740000dd0000 ,/* 0x740000ddffc0 */
	RA = 0x0110e70000 ,
	PA = 0x0110e70000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000dd186b 8000000110e70441 */
	end_label   = Thr5_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v107_data_begin
Thr5_User_Data_4v107_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00b TEXT_VA=0x73a00000c000
attr_text {
	Name = .Thr5_User_Text_4v00b ,
	VA = 0x73a00000c000 ,/* 0x73a00000dfc0 */
	RA = 0x03e0132000 ,
	PA = 0x03e0132000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00000d86b 80000003e0132080 */
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
	.word	0xfe45ab74
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_NCTX
thr5_MMU_ASI_PRIMARY_297:
	.word	0x87802080
	.word	0xf2f42088
	.word	0xe476a078
	.word	0xc0776890
	.word	0x1000000
	or	%g0, 0x03e, %i7
	LOAD_IDATA_IN
	.word	0xd45aa100
	.word	0xfa76a0d0
	.word	0xc02aae8e
	.word	0x1000000
	or	%g0, 0x500, %i7
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
	.word	0x1000000
	or	%g0, 0x01b, %i7
	LOAD_DDATA_IN
	.word	0xbe82a098
	.word	0xe0dfd000
	DDEMAP_ALL
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe45ab14
	IDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x048, %i7
	LOAD_IDATA_IN
	.word	0xde75a050
	.word	0xc020a288
	nop
	nop
	nop
	.word	0xfcde9100
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
thr5_MMU_ASI_PRIMARY_298:
	.word	0x87802080
	.word	0xcaf2a010
	.word	0x1000000
	or	%g0, 0x0ab, %i7
	LOAD_DDATA_IN
	.word	0xc022aedc
	nop
	nop
	nop
	nop
	.word	0xcc5c20a0
	.word	0xc020ac14
	TOGGLE_LSU_DM
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x4e9, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe45a1a0
	.word	0x1000000
	.word	0xbe13c000
	DDEMAP_PAGE
	nop
	nop
	nop
	.word	0xbe85a0d0
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x07c, %i7
	LOAD_IDATA_IN
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x190, %i7
	READ_DDATA_ACCESS
	nop
	nop
	.word	0xe476a018
	.word	0xc02f6664
	.word	0xbe82a038
	.word	0xf4dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc03762b4
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00b_exit:
	EXIT_GOOD
Thr5_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v108 DATA_VA=0x740000df0000
attr_data {
	Name = .Thr5_User_Data_4v108 ,
	VA = 0x740000df0000 ,/* 0x740000dfffc0 */
	RA = 0x01103e0000 ,
	PA = 0x01103e0000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000df186b 80000001103e0441 */
	end_label   = Thr5_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v108_data_begin
Thr5_User_Data_4v108_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00c TEXT_VA=0x73a000064000
attr_text {
	Name = .Thr5_User_Text_4v00c ,
	VA = 0x73a000064000 ,/* 0x73a000065fc0 */
	RA = 0x03e003e000 ,
	PA = 0x03e003e000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00006586b 80000003e003e080 */
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
	.word	0x1000000
	or	%g0, 0x478, %i7
	READ_IDATA_ACCESS
	IDEMAP_NCTX
	.word	0xc02eab0d
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x020, %i7
	LOAD_IDATA_IN
	.word	0xc0742508
	.word	0x1000000
	or	%g0, 0x18b, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x4fc, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x1f0, %i7
	ITLB_TAG_READ
	.word	0xee742018
	.word	0xc025add4
	nop
	nop
	nop
	nop
	nop
	.word	0xbe812038
	.word	0xe0dfd000
thr5_MMU_ASI_PRIMARY_299:
	.word	0x87802080
	.word	0xc4f5a0d0
	.word	0xec5c2120
	.word	0xfe4c2c6b
	TOGGLE_LSU_IM
	.word	0xd65f6010
	IDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfc9a9100
	.word	0x1000000
	or	%g0, 0x05f, %i7
	LOAD_IDATA_IN
	.word	0xfcd91000
	.word	0x1000000
	or	%g0, 0x703, %i7
	LOAD_DDATA_ACCESS
	.word	0xc025a170
	DDEMAP_PCTX
thr5_MMU_ASI_BLK_P_300:
	.word	0x878020f0
	.word	0xc3bf6140
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr5_MMU_ASI_PRIMARY_301:
	.word	0x87802080
	.word	0xc8f6a0d0
	.word	0x1000000
	or	%g0, 0xc8, %i7
	READ_IDATA_ACCESS
thr5_MMU_ASI_PRIMARY_LITTLE_302:
	.word	0x87802088
	.word	0xf0f2a0d8
	.word	0xf45f6098
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xb8, %i7
	DTLB_TAG_READ
	.word	0x1000000
	.word	0xbe13c000
	IDEMAP_RPAGE
	.word	0xfcdd9000
	.word	0xfcde9000
	.word	0xfe4c2f27
	.word	0xee712018
	.word	0xc0742ab8
	.word	0x1000000
	or	%g0, 0x08e, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_DM
	.word	0xc072a820
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5aaad0
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00c_exit:
	EXIT_GOOD
Thr5_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v109 DATA_VA=0x740000c70000
attr_data {
	Name = .Thr5_User_Data_4v109 ,
	VA = 0x740000c70000 ,/* 0x740000c7ffc0 */
	RA = 0x0110c50000 ,
	PA = 0x0110c50000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000740000c7186b 8000000110c50441 */
	end_label   = Thr5_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v109_data_begin
Thr5_User_Data_4v109_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00d TEXT_VA=0x740000220000
attr_text {
	Name = .Thr5_User_Text_4v00d ,
	VA = 0x740000220000 ,/* 0x74000022ffc0 */
	RA = 0x0110010000 ,
	PA = 0x0110010000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000074000022186b 8000000110010081 */
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
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x560, %i7
	READ_IDATA_ACCESS
	IDEMAP_PCTX
	.word	0xbe842120
	.word	0xfadfd000
	ACCESS_ITSB_PTR
	ACCESS_DTSB_PTR
	.word	0xfcdf5000
	.word	0xe25f6010
	TOGGLE_LSU_IM
	IDEMAP_PCTX
	.word	0xc02f6f9d
	.word	0xc02f6c89
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x736, %i7
	LOAD_DDATA_ACCESS
	.word	0xfcdad160
thr5_MMU_ASI_PRIMARY_303:
	.word	0x87802080
	.word	0xfcbc2ea0
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0xc8, %i7
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
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x430, %i7
	DTLB_TAG_READ
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x03d, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x03d, %i7
	LOAD_IDATA_IN
thr5_MMU_ASI_PRIMARY_304:
	.word	0x87802080
	.word	0xc4f76038
	.word	0xfe5c2458
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
	.word	0xfe52a33a
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr5_User_Text_4v00d_exit:
	EXIT_GOOD
Thr5_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10a DATA_VA=0x75000b000000
attr_data {
	Name = .Thr5_User_Data_4v10a ,
	VA = 0x75000b000000 ,/* 0x75000b3fffc0 */
	RA = 0x00ba000000 ,
	PA = 0x00ba000000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000075000b00186b 80000000ba000443 */
	end_label   = Thr5_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10a_data_begin
Thr5_User_Data_4v10a_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00e TEXT_VA=0x740000530000
attr_text {
	Name = .Thr5_User_Text_4v00e ,
	VA = 0x740000530000 ,/* 0x74000053ffc0 */
	RA = 0x01108c0000 ,
	PA = 0x01108c0000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000074000053186b 80000001108c0081 */
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
thr5_MMU_ASI_PRIMARY_305:
	.word	0x87802080
	.word	0xc4f6a038
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x407, %i7
	LOAD_DDATA_ACCESS
	TOGGLE_LSU_DM
	.word	0xfe5ea180
	.word	0x1000000
	or	%g0, 0x38, %i7
	READ_IDATA_ACCESS
	nop
	.word	0x1000000
	or	%g0, 0x026, %i7
	LOAD_IDATA_IN
	.word	0xfe5c2778
	.word	0x1000000
	or	%g0, 0x007, %i7
	LOAD_DDATA_IN
	.word	0xc672a0d8
	.word	0xc02dae7a
thr5_MMU_ASI_BLK_SL_306:
	.word	0x878020f9
	.word	0xe1baed00
	.word	0xc035aa98
	.word	0xfe5eafa0
	DO_BRANCH
	.word	0x81c56000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfa75a120
	.word	0xc0776158
	.word	0x1000000
	or	%g0, 0x128, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x6f0, %i7
	DTLB_TAG_READ
	.word	0xec5da0e0
	TOGGLE_LSU_DM
	.word	0x1000000
	or	%g0, 0x438, %i7
	LOAD_DDATA_ACCESS
	.word	0xc02765f8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02aa37c
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00e_exit:
	EXIT_GOOD
Thr5_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10b DATA_VA=0x750003c00000
attr_data {
	Name = .Thr5_User_Data_4v10b ,
	VA = 0x750003c00000 ,/* 0x750003ffffc0 */
	RA = 0x00b5400000 ,
	PA = 0x00b5400000 ,
	TTE_Context = 0x186b ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000750003c0186b 80000000b5400443 */
	end_label   = Thr5_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10b_data_begin
Thr5_User_Data_4v10b_data_begin:
	.xword	0x73a000056000
	.xword	0x73a000178000
	.xword	0x73a0001ba000
	.xword	0x73a00009c000
	.xword	0x73a000188000
	.xword	0x7400005e0000
	.xword	0x750012800000
	.xword	0x750013000000
	.xword	0x73a0001bc000
	.xword	0x73a0000a0000
	.xword	0x7604b0000000
	.xword	0x73a0001e6000
	.xword	0x73a000014000
	.xword	0x740000b60000
	.xword	0x73a000010000
	.xword	0x760460000000
	.xword	0x73a0000d0000
	.xword	0x740000410000
	.xword	0x73a00007a000
	.xword	0x750005000000
	.xword	0x73a000002000
	.xword	0x7400005f0000
	.xword	0x7400008d0000
	.xword	0x740000030000
	.xword	0x7601c0000000
	.xword	0x73a000050000
	.xword	0x740000490000
	.xword	0x73a000180000
	.xword	0x7603a0000000
	.xword	0x73a00011a000
	.xword	0x740000dd0000
	.xword	0x73a00000c000
	.xword	0x740000df0000
	.xword	0x73a000064000
	.xword	0x740000c70000
	.xword	0x740000220000
	.xword	0x75000b000000
	.xword	0x740000530000
	.xword	0x750003c00000
	.xword	0x73a000198000
Thr5_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00f TEXT_VA=0x73a000198000
attr_text {
	Name = .Thr5_User_Text_4v00f ,
	VA = 0x73a000198000 ,/* 0x73a000199fc0 */
	RA = 0x03e0062000 ,
	PA = 0x03e0062000 ,
	TTE_Context = 0x186b ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000073a00019986b 80000003e0062080 */
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
	.word	0xfe52a1fa
	.word	0xbe842038
	.word	0xfadfd000
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xbe816010
	.word	0xd6dfd060
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x708, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0xbe170000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x270, %i7
	READ_DDATA_ACCESS
	.word	0xc076a140
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfcde9000
	.word	0xfc9a9d40
	.word	0x1000000
	or	%g0, 0x431, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
thr5_MMU_ASI_PRIMARY_307:
	.word	0x87802080
	.word	0xd2f42050
	IDEMAP_ALL_PAGES
	.word	0xfc9d9c40
	.word	0x1000000
	or	%g0, 0x670, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe168000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x300, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x340, %i7
	DTLB_TAG_READ
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe154000
	GOTO_SUPERVISOR0
	.word	0xfa58a110
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr5_User_Text_4v00f_exit:
	EXIT_GOOD
Thr5_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v000 TEXT_VA=0x780000150000
attr_text {
	Name = .Thr6_User_Text_4v000 ,
	VA = 0x780000150000 ,/* 0x78000015ffc0 */
	RA = 0x0120cd0000 ,
	PA = 0x6d20cd0000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000780000150713 8000006d20cd0481 */
	end_label   = Thr6_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr6_user_code_entry
Thr6_user_code_entry:
	setx	0x77b00003a000, %g1, %g2
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
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe82a100
	.word	0xe0dfd000
	.word	0xfcdf5000
	.word	0x1000000
	or	%g0, 0x470, %i7
	ITLB_TAG_READ
	.word	0xbe8560b8
	.word	0xfadfd000
	DO_BRANCH
	.word	0x81c62000
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
	DDEMAP_NCTX
	IDEMAP_ALL
	IDEMAP_ALL
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_308:
	.word	0x87802080
	.word	0xecf12040
	IDEMAP_NCTX
thr6_MMU_ASI_PRIMARY_309:
	.word	0x87802080
	.word	0xe8f56088
thr6_MMU_ASI_PRIMARY_310:
	.word	0x87802080
	.word	0xdef6a000
	.word	0xbe82a0b8
	.word	0xe0dfd000
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x308, %i7
	READ_DDATA_ACCESS
	.word	0xfe5566ca
	DDEMAP_PCTX
	.word	0xfe442978
	.word	0xbe82a138
	.word	0xe0dfd000
thr6_MMU_ASI_PRIMARY_311:
	.word	0x87802080
	.word	0xf4f120f0
	DDEMAP_ALL_PAGES
	.word	0xcc72a018
	.word	0xc0376900
	.word	0xbe842090
	.word	0xd4dfd000
	DDEMAP_ALL_RPAGES
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
	DDEMAP_SCTX
	.word	0xfe4f6c08
	IDEMAP_ALL
	.word	0xfe4d6221
	.word	0xf0742060
	.word	0xc072aaf8
	TOGGLE_LSU_IM
	.word	0xfcdc1000
	.word	0xec742070
	.word	0xc036adfa
	.word	0x1000000
	.word	0xbe148000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	nop
	.word	0xfe5c2af8
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_312:
	.word	0x87802080
	.word	0xf8f6a000
	TOGGLE_LSU_DM
	nop
	.word	0xfe5d6850
	.word	0xfcdf5000
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf45ea068
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v000_exit:
	EXIT_GOOD
Thr6_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v100 DATA_VA=0x77b00003a000
attr_data {
	Name = .Thr6_User_Data_4v100 ,
	VA = 0x77b00003a000 ,/* 0x77b00003bfc0 */
	RA = 0x03f0134000 ,
	PA = 0x6ff0134000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b00003ad7c 8000006ff0134040 */
	end_label   = Thr6_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v100_data_begin
Thr6_User_Data_4v100_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v200 DATA_VA=0x77b00014c000
attr_data {
	Name = .Thr6_User_Data_4v200 ,
	VA = 0x77b00014c000 ,/* 0x77b00014dfc0 */
	RA = 0x03f01ba000 ,
	PA = 0x6ff01ba000 ,
	TTE_Context = 0x15b6 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000077b00014c690 8000006ff01ba040 */
	end_label   = Thr6_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v200_data_begin
Thr6_User_Data_4v200_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v300 DATA_VA=0x780000a50000
attr_data {
	Name = .Thr6_User_Data_4v300 ,
	VA = 0x780000a50000 ,/* 0x780000a5ffc0 */
	RA = 0x0120a40000 ,
	PA = 0x0120a40000 ,
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
	/* DTTE_TAG_DATA = 0000780000a50000 8000000120a40041 */
	end_label   = Thr6_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v300_data_begin
Thr6_User_Data_4v300_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v001 TEXT_VA=0x77b00014e000
attr_text {
	Name = .Thr6_User_Text_4v001 ,
	VA = 0x77b00014e000 ,/* 0x77b00014ffc0 */
	RA = 0x03f01a2000 ,
	PA = 0x6ff01a2000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077b00014ed7c 8000006ff01a2480 */
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
	ACCESS_DTSB_PTR
	.word	0xc0342158
	.word	0xc02ea312
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc076a648
	.word	0x1000000
	or	%g0, 0x378, %i7
	DTLB_TAG_READ
	.word	0xfcdc1040
	.word	0xc02f6e15
thr6_MMU_ASI_PRIMARY_313:
	.word	0x87802080
	.word	0xccf56048
	.word	0xea5aa0f0
	.word	0xfe4f6869
	TOGGLE_LSU_DM
	.word	0xfe556a3a
	.word	0x1000000
	or	%g0, 0x208, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc45c2100
	.word	0xfcdc1000
	.word	0x1000000
	or	%g0, 0x208, %i7
	DTLB_TAG_READ
	.word	0xe45ea018
	.word	0x1000000
	or	%g0, 0x488, %i7
	ITLB_TAG_READ
thr6_MMU_ASI_PRIMARY_314:
	.word	0x87802080
	.word	0xe2f56098
thr6_MMU_ASI_PRIMARY_315:
	.word	0x87802080
	.word	0xd6f42010
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	DTLB_TAG_READ
	.word	0xe6776000
	.word	0xc0742158
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd872a018
	.word	0xc02c2713
	.word	0xcc756018
	.word	0xc0742be0
	.word	0x1000000
	or	%g0, 0x498, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x718, %i7
	DTLB_TAG_READ
	.word	0xbe120000
	GOTO_SUPERVISOR1
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xca5ea010
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v001_exit:
	EXIT_GOOD
Thr6_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v400 TEXT_VA=0x77b0000d6000
attr_text {
	Name = .Thr6_User_Text_4v400 ,
	VA = 0x77b0000d6000 ,/* 0x77b0000d7fc0 */
	RA = 0x03f00a6000 ,
	PA = 0x6ff00a6000 ,
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
	/* ITTE_TAG_DATA = 000077b0000d6000 8000006ff00a6080 */
	end_label   = Thr6_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v400_text_begin
Thr6_User_Text_4v400_text_begin:
	wrpr	0, %gl
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x04b, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x2e0, %i7
	P_DTLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x035, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x7be, %i7
	P_LOAD_DDATA_ACCESS
	P_DDEMAP_ALL
	nop
	nop
	nop
	nop
	P_IDEMAP_ALL_RPAGES
	.word	0xbe85a010
	.word	0xe39fde20
thr6_MMU_ASI_PRIMARY_316:
	.word	0x87802080
	.word	0xc6f420d8
	.word	0xbe82a110
	.word	0xf4dfd040
	.word	0xde74a080
	.word	0xc075e670
	.word	0x1000000
	or	%g0, 0x66e, %i7
	P_LOAD_DDATA_ACCESS
	P_DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x550, %i7
	P_READ_IDATA_ACCESS
thr6_MMU_ASI_PRIMARY_317:
	.word	0x87802080
	.word	0xd6f56010
	.word	0xea59a090
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_318:
	.word	0x87802080
	.word	0xc6f56030
	.word	0xfcda9000
	nop
	nop
	nop
	nop
	nop
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v400_exit:
	EXIT_GOOD
Thr6_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v002 TEXT_VA=0x780000c90000
attr_text {
	Name = .Thr6_User_Text_4v002 ,
	VA = 0x780000c90000 ,/* 0x780000c9ffc0 */
	RA = 0x0120810000 ,
	PA = 0x6d20810000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000780000c90713 8000006d20810481 */
	end_label   = Thr6_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v002_text_begin
Thr6_User_Text_4v002_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	.word	0xbe114000
	P_DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x054, %i7
	P_LOAD_DDATA_IN
thr6_MMU_ASI_BLK_COMMIT_S_319:
	.word	0x878020e1
	.word	0xe3baee40
	.word	0xfc9add60
	P_IDEMAP_ALL_PAGES
	.word	0xc02ea28e
	.word	0xfcde8200
	.word	0x1000000
	.word	0xbe11c000
	P_IDEMAP_PAGE
	P_DDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_320:
	.word	0x87802080
	.word	0xdcbf6b10
	.word	0x1000000
	or	%g0, 0x150, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xfcdc1000
	P_IDEMAP_NCTX
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_321:
	.word	0x87802022
	.word	0xd8bea5a0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcd9c3a0
	P_IDEMAP_PCTX
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr6_User_Text_4v002_exit:
	EXIT_GOOD
Thr6_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v101 DATA_VA=0x77b000078000
attr_data {
	Name = .Thr6_User_Data_4v101 ,
	VA = 0x77b000078000 ,/* 0x77b000079fc0 */
	RA = 0x03f01b0000 ,
	PA = 0x6ff01b0000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b000078d7c 8000006ff01b0040 */
	end_label   = Thr6_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v101_data_begin
Thr6_User_Data_4v101_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v201 DATA_VA=0x790017800000
attr_data {
	Name = .Thr6_User_Data_4v201 ,
	VA = 0x790017800000 ,/* 0x790017bfffc0 */
	RA = 0x014a400000 ,
	PA = 0x014a400000 ,
	TTE_Context = 0x15b6 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007900178015b6 800000014a400043 */
	end_label   = Thr6_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v201_data_begin
Thr6_User_Data_4v201_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v301 DATA_VA=0x780000310000
attr_data {
	Name = .Thr6_User_Data_4v301 ,
	VA = 0x780000310000 ,/* 0x78000031ffc0 */
	RA = 0x0120570000 ,
	PA = 0x0120570000 ,
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
	/* DTTE_TAG_DATA = 0000780000310000 8000000120570041 */
	end_label   = Thr6_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v301_data_begin
Thr6_User_Data_4v301_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v003 TEXT_VA=0x77b00015c000
attr_text {
	Name = .Thr6_User_Text_4v003 ,
	VA = 0x77b00015c000 ,/* 0x77b00015dfc0 */
	RA = 0x03f00f2000 ,
	PA = 0x6ff00f2000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077b00015cd7c 8000006ff00f2480 */
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
	DDEMAP_PCTX
	DDEMAP_ALL_PAGES
thr6_MMU_ASI_PRIMARY_322:
	.word	0x87802080
	.word	0xd4bc2150
	.word	0x1000000
	or	%g0, 0x468, %i7
	READ_IDATA_ACCESS
	.word	0xd07420b0
	.word	0xc02c2272
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xfcde9000
	.word	0xbe86a090
	.word	0xe0dfd000
	.word	0xe05f6110
	TOGGLE_LSU_IM
	IDEMAP_ALL_PAGES
thr6_MMU_ASI_PRIMARY_323:
	.word	0x87802080
	.word	0xcef76080
	.word	0x1000000
	or	%g0, 0x4c0, %i7
	ITLB_TAG_READ
	.word	0x1000000
	or	%g0, 0x5f8, %i7
	READ_IDATA_ACCESS
	IDEMAP_ALL
	.word	0xfcde9000
	.word	0xfcdc1140
	.word	0x1000000
	or	%g0, 0x500, %i7
	DTLB_TAG_READ
	nop
	.word	0x1000000
	.word	0xbe114000
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
	.word	0xfcdd5000
	.word	0x1000000
	or	%g0, 0x03e, %i7
	LOAD_DDATA_IN
	ACCESS_DTSB_PTR
	.word	0xbe124000
	GOTO_SUPERVISOR0
thr6_MMU_ASI_BLK_COMMIT_P_324:
	.word	0x878020e0
	.word	0xc1baa980
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x467, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x308, %i7
	READ_DDATA_ACCESS
	.word	0xc070a690
	.word	0x1000000
	or	%g0, 0x2, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_PCTX
	.word	0xfa72a068
	.word	0xc030a4a6
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x118, %i7
	READ_DDATA_ACCESS
	.word	0xfe58a760
	.word	0x1000000
	.word	0xbe100000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x06f, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xc6756108
	.word	0xc022a878
	DDEMAP_ALL_PAGES
	nop
	nop
	.word	0x1000000
	or	%g0, 0x026, %i7
	LOAD_IDATA_IN
thr6_MMU_ASI_PRIMARY_325:
	.word	0x87802080
	.word	0xc8beaf70
	.word	0xe05aa068
thr6_MMU_ASI_BLK_SL_326:
	.word	0x878020f9
	.word	0xe3b962c0
	.word	0x1000000
	or	%g0, 0x146, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xf4756140
	.word	0xc032a920
	.word	0xbe164000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v003_exit:
	EXIT_GOOD
Thr6_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v401 TEXT_VA=0x77b000190000
attr_text {
	Name = .Thr6_User_Text_4v401 ,
	VA = 0x77b000190000 ,/* 0x77b000191fc0 */
	RA = 0x03f0136000 ,
	PA = 0x6ff0136000 ,
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
	/* ITTE_TAG_DATA = 000077b000190000 8000006ff0136080 */
	end_label   = Thr6_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v401_text_begin
Thr6_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0xfcda9000
	.word	0x1000000
	.word	0xbe178000
	P_DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x1e0, %i7
	P_READ_DDATA_ACCESS
	.word	0xf875e0f8
	.word	0xc024ad94
thr6_MMU_ASI_PRIMARY_327:
	.word	0x87802080
	.word	0xe0baa6e0
	.word	0x1000000
	or	%g0, 0x4e0, %i7
	P_READ_DDATA_ACCESS
	P_IDEMAP_ALL
	P_TOGGLE_LSU_DM
	P_IDEMAP_ALL
	.word	0x1000000
	.word	0xbe110000
	P_DDEMAP_PAGE
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xbe8120e0
	.word	0xfadfc200
	P_ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0xc8, %i7
	P_ITLB_TAG_READ
	.word	0xfcda9000
	P_TOGGLE_LSU_DM
	.word	0xbe842090
	.word	0xf4dfc200
	.word	0xea7320b8
	.word	0xc071a9e8
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
	or	%g0, 0x4a0, %i7
	P_READ_IDATA_ACCESS
	.word	0xbe856068
	.word	0xc8dfd000
	nop
	.word	0xc021a808
thr6_MMU_ASI_PRIMARY_328:
	.word	0x87802080
	.word	0xccbf6740
thr6_MMU_ASI_AS_IF_USER_PRIMARY_329:
	.word	0x87802010
	.word	0xe8f6a088
thr6_MMU_ASI_AS_IF_USER_PRIMARY_330:
	.word	0x87802010
	.word	0xf4f76100
	.word	0x1000000
	or	%g0, 0x458, %i7
	P_ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	P_DDEMAP_PCTX
	.word	0xfcdc0200
	P_IDEMAP_NCTX
	.word	0xfcdd4200
	.word	0xbe8120b8
	.word	0xe0dfd000
	.word	0x1000000
	or	%g0, 0x466, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xbe856068
	.word	0xe0dfd000
	.word	0xfe54a61a
	.word	0xfcd95160
thr6_MMU_ASI_AS_IF_USER_PRIMARY_331:
	.word	0x87802010
	.word	0xeaf12150
thr6_MMU_ASI_AS_IF_USER_PRIMARY_332:
	.word	0x87802010
	.word	0xe0f6a130
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v401_exit:
	EXIT_GOOD
Thr6_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v004 TEXT_VA=0x77b000052000
attr_text {
	Name = .Thr6_User_Text_4v004 ,
	VA = 0x77b000052000 ,/* 0x77b000053fc0 */
	RA = 0x03f0082000 ,
	PA = 0x6ff0082000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077b000052d7c 8000006ff0082480 */
	end_label   = Thr6_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v004_text_begin
Thr6_User_Text_4v004_text_begin:
	wrpr	0, %gl
	P_IDEMAP_NCTX
	.word	0xfe4eaa90
	.word	0xc028a6c4
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
	.word	0xfcdd4200
	P_DDEMAP_SCTX
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr6_User_Text_4v004_exit:
	EXIT_GOOD
Thr6_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v102 DATA_VA=0x77b000174000
attr_data {
	Name = .Thr6_User_Data_4v102 ,
	VA = 0x77b000174000 ,/* 0x77b000175fc0 */
	RA = 0x03f00c8000 ,
	PA = 0x6ff00c8000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b000174d7c 8000006ff00c8040 */
	end_label   = Thr6_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v102_data_begin
Thr6_User_Data_4v102_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v202 DATA_VA=0x780000fc0000
attr_data {
	Name = .Thr6_User_Data_4v202 ,
	VA = 0x780000fc0000 ,/* 0x780000fcffc0 */
	RA = 0x0120f40000 ,
	PA = 0x6d20f40000 ,
	TTE_Context = 0x15b6 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 0000780000fc15b6 8000006d20f40041 */
	end_label   = Thr6_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v202_data_begin
Thr6_User_Data_4v202_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v302 DATA_VA=0x780000540000
attr_data {
	Name = .Thr6_User_Data_4v302 ,
	VA = 0x780000540000 ,/* 0x78000054ffc0 */
	RA = 0x0120e80000 ,
	PA = 0x0120e80000 ,
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
	/* DTTE_TAG_DATA = 0000780000540000 8000000120e80041 */
	end_label   = Thr6_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v302_data_begin
Thr6_User_Data_4v302_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v005 TEXT_VA=0x77b0000da000
attr_text {
	Name = .Thr6_User_Text_4v005 ,
	VA = 0x77b0000da000 ,/* 0x77b0000dbfc0 */
	RA = 0x03f01ca000 ,
	PA = 0x6ff01ca000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077b0000dad7c 8000006ff01ca480 */
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
	or	%g0, 0x498, %i7
	ITLB_TAG_READ
	.word	0xe05d6038
	.word	0x1000000
	or	%g0, 0x04b, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdc1100
	.word	0x1000000
	or	%g0, 0x076, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x4ac, %i7
	LOAD_IDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe86a038
	.word	0xf4dfd000
	.word	0x1000000
	or	%g0, 0xb0, %i7
	ITLB_TAG_READ
	.word	0xbe876038
	.word	0xd4dfd000
	nop
	nop
	nop
	nop
	DDEMAP_SCTX
	.word	0xbe80a100
	.word	0xfadfd000
	IDEMAP_ALL_RPAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc036a63c
	.word	0x1000000
	or	%g0, 0x004, %i7
	LOAD_IDATA_IN
	.word	0xc07421a0
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
	.word	0xf272a028
	.word	0xc07762f8
	.word	0x1000000
	or	%g0, 0x160, %i7
	ITLB_TAG_READ
thr6_MMU_ASI_BLK_P_333:
	.word	0x878020f0
	.word	0xc3beaec0
	.word	0xce756020
	.word	0xc0742b98
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xd676a098
	.word	0xc0776950
	.word	0xe05aa090
	.word	0xf45ea100
	.word	0x1000000
	.word	0xbe158000
	IDEMAP_PAGE
	.word	0xee712018
	.word	0xc0712240
	.word	0xee742018
	.word	0xc02c28e5
	TOGGLE_LSU_IM
	.word	0xfe4aa778
	.word	0x1000000
	or	%g0, 0x450, %i7
	READ_IDATA_ACCESS
	.word	0xe45ea018
	.word	0xd45c20d0
	.word	0x1000000
	or	%g0, 0x420, %i7
	ITLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x68, %i7
	READ_IDATA_ACCESS
	.word	0xfc9d9d60
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe05f6068
	.word	0x1000000
	or	%g0, 0x198, %i7
	LOAD_IDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5c2c98
	nop
	nop
	ACCESS_DTSB_PTR
	.word	0xfc9e9c40
thr6_MMU_ASI_SECONDARY_LITTLE_334:
	.word	0x87802089
	.word	0xdcbae2a0
	.word	0xee712018
	.word	0xc076a390
	.word	0xc0756410
	.word	0xea5ea038
	.word	0x1000000
	.word	0xbe134000
	IDEMAP_RPAGE
	nop
	.word	0xee5ea018
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0776ac0
	.word	0xc85920d0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe876148
	.word	0xc8dfd000
	ACCESS_DTSB_PTR
	.word	0xe05aa130
	.word	0xe19d5f00
	.word	0xfc9e9c40
	.word	0x1000000
	or	%g0, 0x080, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DDEMAP_ALL
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xfa5aa038
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v005_exit:
	EXIT_GOOD
Thr6_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v402 TEXT_VA=0x7800009d0000
attr_text {
	Name = .Thr6_User_Text_4v402 ,
	VA = 0x7800009d0000 ,/* 0x7800009dffc0 */
	RA = 0x0120090000 ,
	PA = 0x0120090000 ,
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
	/* ITTE_TAG_DATA = 00007800009d0000 8000000120090081 */
	end_label   = Thr6_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v402_text_begin
Thr6_User_Text_4v402_text_begin:
	wrpr	0, %gl
	.word	0x1000000
	or	%g0, 0x0aa, %i7
	P_LOAD_DDATA_IN
	P_TOGGLE_LSU_IM
	P_DDEMAP_ALL
	.word	0x1000000
	.word	0xbe174000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x108, %i7
	P_READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_335:
	.word	0x87802080
	.word	0xfaf6a090
	.word	0x1000000
	or	%g0, 0x032, %i7
	P_LOAD_DDATA_IN
thr6_MMU_ASI_AS_IF_USER_PRIMARY_336:
	.word	0x87802010
	.word	0xcaf2a010
	.word	0xfcde9000
	.word	0xc876e090
	.word	0xc024ae98
	.word	0xbe876090
	.word	0xf4dfc200
	.word	0x1000000
	or	%g0, 0x4e0, %i7
	P_ITLB_TAG_READ
	.word	0x1000000
	.word	0xbe17c000
	P_IDEMAP_RPAGE
	P_DDEMAP_SCTX
	.word	0xbe82a0d0
	.word	0xc8dfd000
	.word	0x1000000
	or	%g0, 0x48, %i7
	P_ITLB_TAG_READ
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_337:
	.word	0x87802022
	.word	0xecbc2930
thr6_MMU_ASI_PRIMARY_338:
	.word	0x87802080
	.word	0xd8f42018
	.word	0xfcde8200
	P_TOGGLE_LSU_IM
	P_DDEMAP_ALL_PAGES
	P_TOGGLE_LSU_DM
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x598, %i7
	P_READ_IDATA_ACCESS
	P_DDEMAP_ALL
	.word	0xfc9c5c60
thr6_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE_339:
	.word	0x8780202b
	.word	0xc8bda710
	.word	0xfcdb03a0
	.word	0xbe170000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v402_exit:
	EXIT_GOOD
Thr6_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v103 DATA_VA=0x77b0001c6000
attr_data {
	Name = .Thr6_User_Data_4v103 ,
	VA = 0x77b0001c6000 ,/* 0x77b0001c7fc0 */
	RA = 0x03f006e000 ,
	PA = 0x6ff006e000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b0001c6d7c 8000006ff006e040 */
	end_label   = Thr6_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v103_data_begin
Thr6_User_Data_4v103_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v203 DATA_VA=0x79000c400000
attr_data {
	Name = .Thr6_User_Data_4v203 ,
	VA = 0x79000c400000 ,/* 0x79000c7fffc0 */
	RA = 0x0146800000 ,
	PA = 0x0146800000 ,
	TTE_Context = 0x15b6 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 000079000c4015b6 8000000146800043 */
	end_label   = Thr6_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v203_data_begin
Thr6_User_Data_4v203_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v303 DATA_VA=0x77b0001ea000
attr_data {
	Name = .Thr6_User_Data_4v303 ,
	VA = 0x77b0001ea000 ,/* 0x77b0001ebfc0 */
	RA = 0x03f00a0000 ,
	PA = 0x6ff00a0000 ,
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
	/* DTTE_TAG_DATA = 000077b0001ea000 8000006ff00a0040 */
	end_label   = Thr6_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v303_data_begin
Thr6_User_Data_4v303_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v006 TEXT_VA=0x79002a800000
attr_text {
	Name = .Thr6_User_Text_4v006 ,
	VA = 0x79002a800000 ,/* 0x79002abfffc0 */
	RA = 0x014e800000 ,
	PA = 0x014e800000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000079002a800713 800000014e800483 */
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
	.word	0xbe82a038
	.word	0xfadfd000
	.word	0xc02d6158
	.word	0xfcdf5000
	ACCESS_DTSB_PTR
	.word	0xc0776d48
	.word	0xea7420e0
	.word	0xc070a750
	TOGGLE_LSU_IM
	.word	0xe67560e8
	.word	0xc0356ebe
	nop
	.word	0x1000000
	.word	0xbe11c000
	IDEMAP_RPAGE
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfc9a9c40
	.word	0xe872a088
	.word	0xc027693c
	.word	0x1000000
	or	%g0, 0x008, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	nop
	.word	0xfe4424a8
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xc0212768
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v006_exit:
	EXIT_GOOD
Thr6_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v403 TEXT_VA=0x77b00015e000
attr_text {
	Name = .Thr6_User_Text_4v403 ,
	VA = 0x77b00015e000 ,/* 0x77b00015ffc0 */
	RA = 0x03f01c4000 ,
	PA = 0x6ff01c4000 ,
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
	/* ITTE_TAG_DATA = 000077b00015e000 8000006ff01c4080 */
	end_label   = Thr6_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v403_text_begin
Thr6_User_Text_4v403_text_begin:
	wrpr	0, %gl
	.word	0xfa5ee008
	.word	0xbe8760f0
	.word	0xeadfc200
	.word	0xfcdc1000
	.word	0xfe44a0bc
	P_IDEMAP_ALL_PAGES
thr6_MMU_ASI_PRIMARY_340:
	.word	0x87802080
	.word	0xccf760a0
	nop
	nop
	nop
	nop
	nop
	.word	0xbe8760f0
	.word	0xc39fc2c0
	.word	0xe05b2100
	.word	0xc029a158
	.word	0xe45ee0c0
	P_DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x0, %i7
	P_ITLB_TAG_READ
	P_TOGGLE_LSU_DM
	P_TOGGLE_LSU_DM
thr6_MMU_ASI_BLK_S_341:
	.word	0x878020f1
	.word	0xc3b961c0
	.word	0xfcd90200
	.word	0x1000000
	or	%g0, 0x09f, %i7
	P_LOAD_DDATA_IN
	.word	0xfc9f5c40
	.word	0xbe160000
	RETURN_FROM_SUPERVISOR1
	nop
Thr6_User_Text_4v403_exit:
	EXIT_GOOD
Thr6_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v104 DATA_VA=0x780000ac0000
attr_data {
	Name = .Thr6_User_Data_4v104 ,
	VA = 0x780000ac0000 ,/* 0x780000acffc0 */
	RA = 0x01208e0000 ,
	PA = 0x6d208e0000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000ac0713 8000006d208e0041 */
	end_label   = Thr6_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v104_data_begin
Thr6_User_Data_4v104_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v304 DATA_VA=0x7800008e0000
attr_data {
	Name = .Thr6_User_Data_4v304 ,
	VA = 0x7800008e0000 ,/* 0x7800008effc0 */
	RA = 0x01207b0000 ,
	PA = 0x01207b0000 ,
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
	/* DTTE_TAG_DATA = 00007800008e0000 80000001207b0041 */
	end_label   = Thr6_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v304_data_begin
Thr6_User_Data_4v304_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v007 TEXT_VA=0x790018c00000
attr_text {
	Name = .Thr6_User_Text_4v007 ,
	VA = 0x790018c00000 ,/* 0x790018ffffc0 */
	RA = 0x0146c00000 ,
	PA = 0x0146c00000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000790018c00713 8000000146c00483 */
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
	.word	0xfe5c2ed8
	.word	0xfc9d9d60
	DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x04f, %i7
	LOAD_DDATA_IN
	.word	0xc026a7bc
	.word	0xfe542f38
	.word	0x1000000
	or	%g0, 0x681, %i7
	LOAD_DDATA_ACCESS
	nop
	DDEMAP_PCTX
	.word	0xfcdd5000
	.word	0xc02c2683
	.word	0xfe442874
	.word	0xee5ea018
	.word	0x1000000
	or	%g0, 0x041, %i7
	LOAD_IDATA_IN
	.word	0xfe4ea933
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xfe54210a
thr6_MMU_ASI_BLK_COMMIT_P_342:
	.word	0x878020e0
	.word	0xe3bf6540
	.word	0xfcdc1000
thr6_MMU_ASI_PRIMARY_LITTLE_343:
	.word	0x87802088
	.word	0xe2f2a010
	.word	0xc87760d0
	.word	0xc036af20
	.word	0xbe856008
	.word	0xe0dfd000
	.word	0xfe4aa215
	ACCESS_DTSB_PTR
	.word	0xc02d668a
	.word	0x1000000
	or	%g0, 0x448, %i7
	ITLB_TAG_READ
	.word	0xc0256d50
	.word	0x1000000
	.word	0xbe100000
	DDEMAP_RPAGE
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x80, %i7
	READ_IDATA_ACCESS
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
	.word	0xfcda9000
	.word	0xbe8760b8
	.word	0xe0dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x50, %i7
	LOAD_IDATA_ACCESS
	nop
	.word	0x1000000
	.word	0xbe16c000
	IDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe110000
	DDEMAP_PAGE
	.word	0xc02c2d05
	nop
	nop
	nop
	nop
	nop
	nop
thr6_MMU_ASI_PRIMARY_344:
	.word	0x87802080
	.word	0xfaf42130
	.word	0xc036a26e
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x7c0, %i7
	READ_DDATA_ACCESS
	.word	0xe05aa090
	.word	0x1000000
	.word	0xbe130000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x490, %i7
	DTLB_TAG_READ
	DDEMAP_ALL_RPAGES
thr6_MMU_ASI_BLK_COMMIT_S_345:
	.word	0x878020e1
	.word	0xc1bdac00
	ACCESS_DTSB_PTR
	DDEMAP_ALL_RPAGES
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
	.word	0xe67420c8
	.word	0xc030a158
	.word	0xc45ea038
	.word	0xc0742f50
	.word	0xc076a360
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
	nop
	nop
	nop
	.word	0xfe456bec
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x055, %i7
	LOAD_DDATA_IN
	nop
	nop
	nop
	nop
	.word	0xbe8560b8
	.word	0xeadfd000
	nop
	.word	0x1000000
	or	%g0, 0x5a8, %i7
	ITLB_TAG_READ
	.word	0xea72a038
	.word	0xc072a678
	.word	0xfcdf5000
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xd272a000
	.word	0xc032a438
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v007_exit:
	EXIT_GOOD
Thr6_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v105 DATA_VA=0x7800006d0000
attr_data {
	Name = .Thr6_User_Data_4v105 ,
	VA = 0x7800006d0000 ,/* 0x7800006dffc0 */
	RA = 0x01205d0000 ,
	PA = 0x6d205d0000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007800006d0713 8000006d205d0041 */
	end_label   = Thr6_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v105_data_begin
Thr6_User_Data_4v105_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v008 TEXT_VA=0x77b0000b4000
attr_text {
	Name = .Thr6_User_Text_4v008 ,
	VA = 0x77b0000b4000 ,/* 0x77b0000b5fc0 */
	RA = 0x03f006a000 ,
	PA = 0x6ff006a000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077b0000b4d7c 8000006ff006a480 */
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
	ACCESS_DTSB_PTR
	.word	0xe05ea120
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	IDEMAP_PCTX
	.word	0xfcda9000
	.word	0xbe86a128
	.word	0xe0dfd000
	TOGGLE_LSU_DM
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe128000
	IDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x07f, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x580, %i7
	ITLB_TAG_READ
	DDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x188, %i7
	ITLB_TAG_READ
	DDEMAP_NCTX
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x03c, %i7
	LOAD_DDATA_IN
	DDEMAP_NCTX
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xea5ea0b8
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr6_User_Text_4v008_exit:
	EXIT_GOOD
Thr6_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v106 DATA_VA=0x77b00003e000
attr_data {
	Name = .Thr6_User_Data_4v106 ,
	VA = 0x77b00003e000 ,/* 0x77b00003ffc0 */
	RA = 0x03f0110000 ,
	PA = 0x6ff0110000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b00003ed7c 8000006ff0110040 */
	end_label   = Thr6_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v106_data_begin
Thr6_User_Data_4v106_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v009 TEXT_VA=0x7800007b0000
attr_text {
	Name = .Thr6_User_Text_4v009 ,
	VA = 0x7800007b0000 ,/* 0x7800007bffc0 */
	RA = 0x01205b0000 ,
	PA = 0x6d205b0000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007800007b0713 8000006d205b0481 */
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
	or	%g0, 0x33, %i7
	LOAD_IDATA_ACCESS
	DDEMAP_PCTX
	.word	0xde72a080
	.word	0xc0742390
	.word	0xc02ea158
	.word	0xfe442c70
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfe5564ac
	.word	0xc85ea068
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	nop
	nop
	nop
	DDEMAP_NCTX
	ACCESS_ITSB_PTR
	IDEMAP_NCTX
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x07c, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x08e, %i7
	LOAD_DDATA_IN
	.word	0xd45f6090
	DDEMAP_SCTX
	.word	0x1000000
	or	%g0, 0x728, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe556ac0
	TOGGLE_LSU_IM
	DDEMAP_PCTX
	.word	0xfc995d60
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xec5aa070
	.word	0xc036a2b8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe6742050
	.word	0xc02126dc
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe100000
	DDEMAP_RPAGE
	.word	0x1000000
	or	%g0, 0xc8, %i7
	READ_DDATA_ACCESS
	.word	0xfe5761e8
	.word	0x1000000
	or	%g0, 0x0b4, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x18, %i7
	LOAD_IDATA_ACCESS
	.word	0xc85d6090
	.word	0x1000000
	or	%g0, 0x069, %i7
	LOAD_DDATA_IN
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x598, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x498, %i7
	READ_IDATA_ACCESS
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xc02c2685
	.word	0xf6776018
	.word	0xc072a610
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xea5d6068
	.word	0xe19c5e20
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0376514
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v009_exit:
	EXIT_GOOD
Thr6_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v107 DATA_VA=0x77b0001a2000
attr_data {
	Name = .Thr6_User_Data_4v107 ,
	VA = 0x77b0001a2000 ,/* 0x77b0001a3fc0 */
	RA = 0x03f0010000 ,
	PA = 0x6ff0010000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b0001a2d7c 8000006ff0010040 */
	end_label   = Thr6_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v107_data_begin
Thr6_User_Data_4v107_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00a TEXT_VA=0x77b000100000
attr_text {
	Name = .Thr6_User_Text_4v00a ,
	VA = 0x77b000100000 ,/* 0x77b000101fc0 */
	RA = 0x03f016c000 ,
	PA = 0x6ff016c000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000077b000100d7c 8000006ff016c480 */
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
	.word	0xc0356c70
	.word	0xe19c1f00
	.word	0xc0242718
	DDEMAP_ALL_RPAGES
	TOGGLE_LSU_DM
	.word	0xfe58a6d8
thr6_MMU_ASI_PRIMARY_346:
	.word	0x87802080
	.word	0xf2f76028
	ACCESS_DTSB_PTR
	.word	0x1000000
	or	%g0, 0x168, %i7
	READ_DDATA_ACCESS
	.word	0xfe5d6468
	.word	0xd85c2018
	nop
	nop
	.word	0xca756010
	.word	0xc07768b8
	.word	0x1000000
	or	%g0, 0x208, %i7
	READ_DDATA_ACCESS
	.word	0xfe5ea7e0
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc0742b50
	nop
	nop
	.word	0xfa5f60e0
	.word	0xc072a3e8
	.word	0xd272a0d8
	.word	0xc0742158
	TOGGLE_LSU_DM
	.word	0x1000000
	.word	0xbe128000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xf6756018
	.word	0xc072ae70
thr6_MMU_ASI_PRIMARY_347:
	.word	0x87802080
	.word	0xeaf2a110
	.word	0xfa5ea0f0
	.word	0x1000000
	or	%g0, 0x710, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe10c000
	IDEMAP_RPAGE
	.word	0xfe4aa8ea
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
	.word	0xc0742c78
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v00a_exit:
	EXIT_GOOD
Thr6_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v108 DATA_VA=0x77b0000d2000
attr_data {
	Name = .Thr6_User_Data_4v108 ,
	VA = 0x77b0000d2000 ,/* 0x77b0000d3fc0 */
	RA = 0x03f01e4000 ,
	PA = 0x6ff01e4000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b0000d2d7c 8000006ff01e4040 */
	end_label   = Thr6_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v108_data_begin
Thr6_User_Data_4v108_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00b TEXT_VA=0x7800007f0000
attr_text {
	Name = .Thr6_User_Text_4v00b ,
	VA = 0x7800007f0000 ,/* 0x7800007fffc0 */
	RA = 0x0120870000 ,
	PA = 0x6d20870000 ,
	TTE_Context = 0x0713 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007800007f0713 8000006d20870481 */
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
	TOGGLE_LSU_DM
	IDEMAP_ALL_RPAGES
	.word	0xda76a0e8
	.word	0xc022a220
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc02c2f19
	.word	0xf0776000
	.word	0xc0776f18
	nop
thr6_MMU_ASI_PRIMARY_348:
	.word	0x87802080
	.word	0xd8f56078
	TOGGLE_LSU_DM
	.word	0xbe876090
	.word	0xeadfd000
	DO_BRANCH
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5c20f0
thr6_MMU_ASI_BLK_SL_349:
	.word	0x878020f9
	.word	0xe3bc6840
	.word	0x1000000
	or	%g0, 0x01b, %i7
	LOAD_DDATA_IN
	TOGGLE_LSU_IM
	.word	0xc85aa140
	nop
	nop
	nop
	nop
	.word	0xfe52a1a2
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
	.word	0x1000000
	or	%g0, 0x643, %i7
	LOAD_DDATA_ACCESS
thr6_MMU_ASI_PRIMARY_350:
	.word	0x87802080
	.word	0xe4f56018
thr6_MMU_ASI_PRIMARY_351:
	.word	0x87802080
	.word	0xc8f56090
	ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x041, %i7
	LOAD_DDATA_IN
	.word	0xec72a010
	.word	0xc0756c28
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe856008
	.word	0xf4dfd000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5560a6
	DDEMAP_ALL_PAGES
	.word	0xfe42a934
	.word	0x1000000
	or	%g0, 0x1e8, %i7
	READ_IDATA_ACCESS
	DDEMAP_ALL_RPAGES
thr6_MMU_ASI_PRIMARY_352:
	.word	0x87802080
	.word	0xf4f6a118
	.word	0xda742000
	.word	0xc032a9c6
	nop
	nop
	nop
thr6_MMU_ASI_BLK_P_353:
	.word	0x878020f0
	.word	0xc3bd6e40
	.word	0x1000000
	or	%g0, 0x13b, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe164000
	GOTO_SUPERVISOR1
	.word	0xea5c20d0
	.word	0xbe138000
	GOTO_SUPERVISOR1
	nop
Thr6_User_Text_4v00b_exit:
	EXIT_GOOD
Thr6_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v109 DATA_VA=0x790023400000
attr_data {
	Name = .Thr6_User_Data_4v109 ,
	VA = 0x790023400000 ,/* 0x7900237fffc0 */
	RA = 0x0148c00000 ,
	PA = 0x0148c00000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000790023400713 8000000148c00043 */
	end_label   = Thr6_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v109_data_begin
Thr6_User_Data_4v109_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10a DATA_VA=0x780000620000
attr_data {
	Name = .Thr6_User_Data_4v10a ,
	VA = 0x780000620000 ,/* 0x78000062ffc0 */
	RA = 0x0120f50000 ,
	PA = 0x6d20f50000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000620713 8000006d20f50041 */
	end_label   = Thr6_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10a_data_begin
Thr6_User_Data_4v10a_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10b DATA_VA=0x77b000072000
attr_data {
	Name = .Thr6_User_Data_4v10b ,
	VA = 0x77b000072000 ,/* 0x77b000073fc0 */
	RA = 0x03f0152000 ,
	PA = 0x6ff0152000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b000072d7c 8000006ff0152040 */
	end_label   = Thr6_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10b_data_begin
Thr6_User_Data_4v10b_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10c DATA_VA=0x790028800000
attr_data {
	Name = .Thr6_User_Data_4v10c ,
	VA = 0x790028800000 ,/* 0x790028bfffc0 */
	RA = 0x0149000000 ,
	PA = 0x0149000000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000790028800713 8000000149000043 */
	end_label   = Thr6_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10c_data_begin
Thr6_User_Data_4v10c_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10d DATA_VA=0x780000b70000
attr_data {
	Name = .Thr6_User_Data_4v10d ,
	VA = 0x780000b70000 ,/* 0x780000b7ffc0 */
	RA = 0x0120410000 ,
	PA = 0x6d20410000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000780000b70713 8000006d20410041 */
	end_label   = Thr6_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10d_data_begin
Thr6_User_Data_4v10d_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10e DATA_VA=0x77b000196000
attr_data {
	Name = .Thr6_User_Data_4v10e ,
	VA = 0x77b000196000 ,/* 0x77b000197fc0 */
	RA = 0x03f0114000 ,
	PA = 0x6ff0114000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b000196d7c 8000006ff0114040 */
	end_label   = Thr6_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10e_data_begin
Thr6_User_Data_4v10e_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10f DATA_VA=0x79002ec00000
attr_data {
	Name = .Thr6_User_Data_4v10f ,
	VA = 0x79002ec00000 ,/* 0x79002effffc0 */
	RA = 0x0149c00000 ,
	PA = 0x0149c00000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000079002ec00713 8000000149c00043 */
	end_label   = Thr6_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10f_data_begin
Thr6_User_Data_4v10f_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v110 DATA_VA=0x77b000040000
attr_data {
	Name = .Thr6_User_Data_4v110 ,
	VA = 0x77b000040000 ,/* 0x77b000041fc0 */
	RA = 0x03f01d0000 ,
	PA = 0x6ff01d0000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 000077b000040d7c 8000006ff01d0040 */
	end_label   = Thr6_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v110_data_begin
Thr6_User_Data_4v110_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v111 DATA_VA=0x790001800000
attr_data {
	Name = .Thr6_User_Data_4v111 ,
	VA = 0x790001800000 ,/* 0x790001bfffc0 */
	RA = 0x014a800000 ,
	PA = 0x014a800000 ,
	TTE_Context = 0x0713 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 0000790001800713 800000014a800043 */
	end_label   = Thr6_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v111_data_begin
Thr6_User_Data_4v111_data_begin:
	.xword	0x780000150000
	.xword	0x77b00003a000
	.xword	0x77b00014c000
	.xword	0x780000a50000
	.xword	0x77b00014e000
	.xword	0x77b0000d6000
	.xword	0x780000c90000
	.xword	0x77b000078000
	.xword	0x790017800000
	.xword	0x780000310000
	.xword	0x77b00015c000
	.xword	0x77b000190000
	.xword	0x77b000052000
	.xword	0x77b000174000
	.xword	0x780000fc0000
	.xword	0x780000540000
	.xword	0x77b0000da000
	.xword	0x7800009d0000
	.xword	0x77b0001c6000
	.xword	0x79000c400000
	.xword	0x77b0001ea000
	.xword	0x79002a800000
	.xword	0x77b00015e000
	.xword	0x780000ac0000
	.xword	0x7800008e0000
	.xword	0x790018c00000
	.xword	0x7800006d0000
	.xword	0x77b0000b4000
	.xword	0x77b00003e000
	.xword	0x7800007b0000
	.xword	0x77b0001a2000
	.xword	0x77b000100000
	.xword	0x77b0000d2000
	.xword	0x7800007f0000
	.xword	0x790023400000
	.xword	0x780000620000
	.xword	0x77b000072000
	.xword	0x790028800000
	.xword	0x780000b70000
	.xword	0x77b000196000
	.xword	0x79002ec00000
	.xword	0x77b000040000
	.xword	0x790001800000
Thr6_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x7d0000400000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	VA = 0x7d0000400000 ,/* 0x7d00007fffc0 */
	RA = 0x015bc00000 ,
	PA = 0x7d5bc00000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007d00004001df 8000007d5bc00483 */
	end_label   = Thr7_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr7_user_code_entry
Thr7_user_code_entry:
	setx	0x7bc00011c000, %g1, %g2
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
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc85aa0d0
	.word	0xfe42aa58
	.word	0x1000000
	or	%g0, 0x087, %i7
	LOAD_DDATA_IN
thr7_MMU_ASI_PRIMARY_354:
	.word	0x87802080
	.word	0xe2f56070
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
	nop
	IDEMAP_ALL
	.word	0x1000000
	or	%g0, 0x0, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x5a6, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe512aea
	.word	0xbe13c000
	GOTO_SUPERVISOR0
thr7_MMU_ASI_PRIMARY_355:
	.word	0x87802080
	.word	0xe6f420a8
	DDEMAP_ALL_PAGES
	.word	0xc87420b0
	.word	0xc028ab15
	.word	0xc0266170
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x650, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x7, %i7
	LOAD_IDATA_ACCESS
	.word	0xea5d6068
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	DDEMAP_PCTX
	IDEMAP_ALL_PAGES
	.word	0xe05f6068
	nop
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
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcde5100
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xda756138
	.word	0xc0266514
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v000_exit:
	EXIT_GOOD
Thr7_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v100 DATA_VA=0x7bc00011c000
attr_data {
	Name = .Thr7_User_Data_4v100 ,
	VA = 0x7bc00011c000 ,/* 0x7bc00011dfc0 */
	RA = 0x001008c000 ,
	PA = 0x001008c000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc00011c1df 800000001008c440 */
	end_label   = Thr7_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v100_data_begin
Thr7_User_Data_4v100_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v200 DATA_VA=0x7bc000058000
attr_data {
	Name = .Thr7_User_Data_4v200 ,
	VA = 0x7bc000058000 ,/* 0x7bc000059fc0 */
	RA = 0x001005a000 ,
	PA = 0x001005a000 ,
	TTE_Context = 0x16f8 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007bc000059c59 800000001005a440 */
	end_label   = Thr7_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v200_data_begin
Thr7_User_Data_4v200_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v300 DATA_VA=0x7bc0001be000
attr_data {
	Name = .Thr7_User_Data_4v300 ,
	VA = 0x7bc0001be000 ,/* 0x7bc0001bffc0 */
	RA = 0x0010030000 ,
	PA = 0x7010030000 ,
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
	/* DTTE_TAG_DATA = 00007bc0001be000 8000007010030040 */
	end_label   = Thr7_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v300_data_begin
Thr7_User_Data_4v300_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v001 TEXT_VA=0x7bc000120000
attr_text {
	Name = .Thr7_User_Text_4v001 ,
	VA = 0x7bc000120000 ,/* 0x7bc000121fc0 */
	RA = 0x0010174000 ,
	PA = 0x0010174000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0001201df 8000000010174480 */
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
	or	%g0, 0x100, %i7
	ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_NCTX
	.word	0xe67120f8
	.word	0xc032a30c
	.word	0xc0256dd4
	.word	0xfe4e6f54
	.word	0x1000000
	or	%g0, 0x424, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe82a0d0
	.word	0xe0dfd000
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xe05f6090
	DDEMAP_ALL_PAGES
	.word	0xfc9c1100
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x117, %i7
	LOAD_IDATA_ACCESS
thr7_MMU_ASI_PRIMARY_356:
	.word	0x87802080
	.word	0xc0baaa70
	.word	0xc02c2623
thr7_MMU_ASI_PRIMARY_357:
	.word	0x87802080
	.word	0xe2f66010
	.word	0xfcdc5020
	.word	0xc0742170
	.word	0x1000000
	.word	0xbe108000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xf6592018
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe19d9f20
	.word	0x1000000
	.word	0xbe168000
	IDEMAP_RPAGE
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0xc03764fe
thr7_MMU_ASI_SECONDARY_358:
	.word	0x87802081
	.word	0xf2f6a090
	.word	0xc0356cac
	.word	0x1000000
	or	%g0, 0x04d, %i7
	LOAD_DDATA_IN
	IDEMAP_ALL
	.word	0xfe5e6bb8
	IDEMAP_ALL
	DDEMAP_SCTX
	nop
	nop
	nop
	nop
	.word	0xd85aa018
	.word	0x1000000
	or	%g0, 0x768, %i7
	DTLB_TAG_READ
	IDEMAP_ALL_PAGES
	.word	0xf672a018
	.word	0xc032a65e
	nop
	nop
	.word	0xfcdc1000
	.word	0xdc766028
	.word	0xc02c2c4c
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x052, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x09a, %i7
	LOAD_DDATA_IN
	.word	0xfa756130
	.word	0xc0242cf0
	.word	0xfa5d60b0
	nop
	nop
	TOGGLE_LSU_IM
	.word	0xfe5661be
	.word	0xe472a018
	.word	0xc020a1d4
	.word	0xc032a69e
	.word	0xfe46662c
thr7_MMU_ASI_PRIMARY_359:
	.word	0x87802080
	.word	0xe8f76058
	IDEMAP_NCTX
thr7_MMU_ASI_SECONDARY_LITTLE_360:
	.word	0x87802089
	.word	0xf0bda700
	DDEMAP_ALL_PAGES
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0242194
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v001_exit:
	EXIT_GOOD
Thr7_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v400 TEXT_VA=0x7c0000290000
attr_text {
	Name = .Thr7_User_Text_4v400 ,
	VA = 0x7c0000290000 ,/* 0x7c000029ffc0 */
	RA = 0x0130820000 ,
	PA = 0x0130820000 ,
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
	/* ITTE_TAG_DATA = 00007c0000290000 8000000130820481 */
	end_label   = Thr7_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v400_text_begin
Thr7_User_Text_4v400_text_begin:
	wrpr	0, %gl
	.word	0xc39f5f00
	P_IDEMAP_PCTX
	.word	0xe875e058
	.word	0xc034afe4
	.word	0xfcdc0200
	P_DDEMAP_ALL
	P_DDEMAP_ALL_PAGES
	P_ACCESS_DTSB_PTR
	.word	0xc034ad30
	.word	0xfcda4280
	.word	0x1000000
	or	%g0, 0x0ae, %i7
	P_LOAD_DDATA_IN
	.word	0xfe532fec
	.word	0xbe816010
	.word	0xc19fc2e0
	.word	0xfcdd5000
	nop
	nop
	nop
	nop
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
	or	%g0, 0x039, %i7
	P_LOAD_IDATA_IN
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v400_exit:
	EXIT_GOOD
Thr7_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v002 TEXT_VA=0x7bc00013a000
attr_text {
	Name = .Thr7_User_Text_4v002 ,
	VA = 0x7bc00013a000 ,/* 0x7bc00013bfc0 */
	RA = 0x0010098000 ,
	PA = 0x0010098000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc00013a1df 8000000010098480 */
	end_label   = Thr7_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v002_text_begin
Thr7_User_Text_4v002_text_begin:
	wrpr	0, %gl
thr7_MMU_ASI_BLK_P_361:
	.word	0x878020f0
	.word	0xc1bf63c0
	.word	0x1000000
	or	%g0, 0x037, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe150000
	P_IDEMAP_PAGE
	.word	0xd45c20b0
	.word	0xfc9d9c60
	P_ACCESS_DTSB_PTR
	nop
	nop
	nop
	nop
	.word	0xbe842110
	.word	0xfadfd000
	.word	0x1000000
	or	%g0, 0x128, %i7
	P_ITLB_TAG_READ
	.word	0xe672a138
	.word	0xc070a7e8
	nop
	nop
	nop
	P_DDEMAP_ALL_PAGES
	P_DDEMAP_SCTX
thr7_MMU_ASI_AS_IF_USER_PRIMARY_362:
	.word	0x87802010
	.word	0xdaf660c8
	.word	0x1000000
	or	%g0, 0xa8, %i7
	P_ITLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x460, %i7
	P_DTLB_TAG_READ
	.word	0xbe14c000
	RETURN_FROM_SUPERVISOR0
	nop
Thr7_User_Text_4v002_exit:
	EXIT_GOOD
Thr7_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v101 DATA_VA=0x7c00003e0000
attr_data {
	Name = .Thr7_User_Data_4v101 ,
	VA = 0x7c00003e0000 ,/* 0x7c00003effc0 */
	RA = 0x0130790000 ,
	PA = 0x7d30790000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00003e01df 8000007d30790441 */
	end_label   = Thr7_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v101_data_begin
Thr7_User_Data_4v101_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v201 DATA_VA=0x7bc000192000
attr_data {
	Name = .Thr7_User_Data_4v201 ,
	VA = 0x7bc000192000 ,/* 0x7bc000193fc0 */
	RA = 0x0010178000 ,
	PA = 0x0010178000 ,
	TTE_Context = 0x16f8 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007bc000193c59 8000000010178440 */
	end_label   = Thr7_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v201_data_begin
Thr7_User_Data_4v201_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v301 DATA_VA=0x7bc0001c4000
attr_data {
	Name = .Thr7_User_Data_4v301 ,
	VA = 0x7bc0001c4000 ,/* 0x7bc0001c5fc0 */
	RA = 0x00100bc000 ,
	PA = 0x70100bc000 ,
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
	/* DTTE_TAG_DATA = 00007bc0001c4000 80000070100bc040 */
	end_label   = Thr7_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v301_data_begin
Thr7_User_Data_4v301_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v003 TEXT_VA=0x7bc000152000
attr_text {
	Name = .Thr7_User_Text_4v003 ,
	VA = 0x7bc000152000 ,/* 0x7bc000153fc0 */
	RA = 0x001005c000 ,
	PA = 0x001005c000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0001521df 800000001005c480 */
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
	.word	0xea5c2120
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
	READ_IDATA_ACCESS
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x160, %i7
	DTLB_TAG_READ
	.word	0xbe876038
	.word	0xeadfd000
	.word	0xc6776158
	.word	0xc02aa9f7
	.word	0xc022a53c
	.word	0xfe542cfc
	IDEMAP_PCTX
thr7_MMU_ASI_PRIMARY_363:
	.word	0x87802080
	.word	0xf6f2a078
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x084, %i7
	LOAD_IDATA_IN
	.word	0xc858a068
	.word	0xfe5aa638
	DDEMAP_PCTX
	.word	0x1000000
	.word	0xbe14c000
	IDEMAP_PAGE
	TOGGLE_LSU_IM
	ACCESS_DTSB_PTR
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe124000
	GOTO_SUPERVISOR0
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
	ACCESS_DTSB_PTR
	.word	0xf072a0a8
	.word	0xc02f669a
	.word	0x1000000
	or	%g0, 0x070, %i7
	LOAD_DDATA_IN
	.word	0xbe876038
	.word	0xe0dfd000
	IDEMAP_NCTX
	.word	0xe05f6100
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xbe856038
	.word	0xeadfd000
	.word	0xd0776028
	.word	0xc02d64b0
	.word	0xe05e60b0
	nop
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x4d0, %i7
	READ_IDATA_ACCESS
	nop
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xd4592068
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v003_exit:
	EXIT_GOOD
Thr7_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v401 TEXT_VA=0x7bc000150000
attr_text {
	Name = .Thr7_User_Text_4v401 ,
	VA = 0x7bc000150000 ,/* 0x7bc000151fc0 */
	RA = 0x0010032000 ,
	PA = 0x7010032000 ,
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
	/* ITTE_TAG_DATA = 00007bc000150000 8000007010032480 */
	end_label   = Thr7_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v401_text_begin
Thr7_User_Text_4v401_text_begin:
	wrpr	0, %gl
	.word	0xec59a098
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	.word	0xbe16c000
	P_IDEMAP_RPAGE
	.word	0xe19e82e0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xfcdd02a0
	.word	0xfe54abb8
	.word	0xfcd90200
thr7_MMU_ASI_BLK_P_364:
	.word	0x878020f0
	.word	0xc3baaa40
thr7_MMU_ASI_SECONDARY_LITTLE_365:
	.word	0x87802089
	.word	0xd0f16028
	.word	0x1000000
	or	%g0, 0x153, %i7
	P_LOAD_IDATA_ACCESS
	.word	0xc074a9d0
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	P_ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x067, %i7
	P_LOAD_DDATA_IN
	.word	0xfe45e6c0
	.word	0xfcd90200
	.word	0x1000000
	or	%g0, 0x08f, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x005, %i7
	P_LOAD_DDATA_IN
thr7_MMU_ASI_PRIMARY_366:
	.word	0x87802080
	.word	0xecf560b8
thr7_MMU_ASI_AS_IF_USER_PRIMARY_367:
	.word	0x87802010
	.word	0xecf42070
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v401_exit:
	EXIT_GOOD
Thr7_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v004 TEXT_VA=0x7d0016000000
attr_text {
	Name = .Thr7_User_Text_4v004 ,
	VA = 0x7d0016000000 ,/* 0x7d00163fffc0 */
	RA = 0x015c000000 ,
	PA = 0x7d5c000000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_0 ,
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
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 00007d00160001df 8000007d5c000483 */
	end_label   = Thr7_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v004_text_begin
Thr7_User_Text_4v004_text_begin:
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
thr7_MMU_ASI_PRIMARY_368:
	.word	0x87802080
	.word	0xeaf42168
	P_DDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x4b8, %i7
	P_LOAD_DDATA_ACCESS
	.word	0xfc9b0580
	.word	0xfcdd4200
	.word	0x1000000
	.word	0xbe130000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	.word	0xea5e6160
	nop
	nop
	.word	0xfcdf5000
	nop
	nop
	.word	0x1000000
	.word	0xbe11c000
	P_IDEMAP_PAGE
	.word	0xfe4f67cd
	P_DDEMAP_PCTX
	.word	0xfcde4200
	P_IDEMAP_PCTX
thr7_MMU_ASI_PRIMARY_LITTLE_369:
	.word	0x87802088
	.word	0xe8f42028
	.word	0x1000000
	or	%g0, 0x598, %i7
	P_ITLB_TAG_READ
	.word	0xbe842100
	.word	0xd4dfd000
	P_TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x1d8, %i7
	P_ITLB_TAG_READ
	.word	0xbe842110
	.word	0xd4dfc200
	.word	0x1000000
	or	%g0, 0x06b, %i7
	P_LOAD_IDATA_IN
	nop
	nop
	.word	0xbe8660d0
	.word	0xd4dfc200
	P_TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x158, %i7
	P_READ_DDATA_ACCESS
	.word	0xd6712010
	.word	0xc022a264
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR0
	nop
Thr7_User_Text_4v004_exit:
	EXIT_GOOD
Thr7_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v102 DATA_VA=0x7d0037800000
attr_data {
	Name = .Thr7_User_Data_4v102 ,
	VA = 0x7d0037800000 ,/* 0x7d0037bfffc0 */
	RA = 0x015ac00000 ,
	PA = 0x7d5ac00000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007d00378001df 8000007d5ac00443 */
	end_label   = Thr7_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v102_data_begin
Thr7_User_Data_4v102_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v202 DATA_VA=0x7bc0001fe000
attr_data {
	Name = .Thr7_User_Data_4v202 ,
	VA = 0x7bc0001fe000 ,/* 0x7bc0001fffc0 */
	RA = 0x0010190000 ,
	PA = 0x0010190000 ,
	TTE_Context = 0x16f8 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007bc0001ffc59 8000000010190440 */
	end_label   = Thr7_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v202_data_begin
Thr7_User_Data_4v202_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v302 DATA_VA=0x7c0000510000
attr_data {
	Name = .Thr7_User_Data_4v302 ,
	VA = 0x7c0000510000 ,/* 0x7c000051ffc0 */
	RA = 0x0130850000 ,
	PA = 0x0130850000 ,
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
	/* DTTE_TAG_DATA = 00007c0000510000 8000000130850041 */
	end_label   = Thr7_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v302_data_begin
Thr7_User_Data_4v302_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v005 TEXT_VA=0x7d0030000000
attr_text {
	Name = .Thr7_User_Text_4v005 ,
	VA = 0x7d0030000000 ,/* 0x7d00303fffc0 */
	RA = 0x015b400000 ,
	PA = 0x7d5b400000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007d00300001df 8000007d5b400483 */
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
	.word	0xc45aa140
	.word	0xf6742018
	.word	0xc07664d8
	IDEMAP_NCTX
	TOGGLE_LSU_DM
	.word	0xc0742170
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_PRIMARY_370:
	.word	0x87802080
	.word	0xecf56010
	.word	0x1000000
	or	%g0, 0x2be, %i7
	LOAD_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x7b8, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe5aa398
	.word	0x1000000
	or	%g0, 0x03d, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x084, %i7
	LOAD_IDATA_IN
	.word	0xc85c20d0
	.word	0xc02aa915
thr7_MMU_ASI_PRIMARY_371:
	.word	0x87802080
	.word	0xc6f760d8
	.word	0xfe4f6939
	.word	0xfcdc1000
	.word	0xd45aa150
	.word	0x1000000
	or	%g0, 0x631, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
	IDEMAP_ALL
	.word	0xfe5aa050
	.word	0xe39f5e00
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x40, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	.word	0xbe108000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x6d4, %i7
	LOAD_DDATA_ACCESS
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x05c, %i7
	LOAD_DDATA_IN
thr7_MMU_ASI_PRIMARY_LITTLE_372:
	.word	0x87802088
	.word	0xe8bf6ed0
	.word	0x1000000
	or	%g0, 0x4bf, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe150000
	GOTO_SUPERVISOR1
	nop
	nop
	.word	0xf65f6018
	.word	0xfe566ae8
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xe058a140
	.word	0xbe120000
	GOTO_SUPERVISOR1
	nop
Thr7_User_Text_4v005_exit:
	EXIT_GOOD
Thr7_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v402 TEXT_VA=0x7bc0001dc000
attr_text {
	Name = .Thr7_User_Text_4v402 ,
	VA = 0x7bc0001dc000 ,/* 0x7bc0001ddfc0 */
	RA = 0x001019e000 ,
	PA = 0x701019e000 ,
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
	/* ITTE_TAG_DATA = 00007bc0001dc000 800000701019e480 */
	end_label   = Thr7_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v402_text_begin
Thr7_User_Text_4v402_text_begin:
	wrpr	0, %gl
	P_ACCESS_DTSB_PTR
	.word	0xbe842160
	.word	0xd4dfd040
	.word	0xfcda8200
thr7_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_373:
	.word	0x87802022
	.word	0xc4be6a10
	P_TOGGLE_LSU_DM
	.word	0xfcde4200
	P_ACCESS_DTSB_PTR
	P_IDEMAP_ALL_PAGES
	P_IDEMAP_ALL_PAGES
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x168, %i7
	P_ITLB_TAG_READ
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
	.word	0xc024a8c4
	.word	0x1000000
	.word	0xbe114000
	P_IDEMAP_PAGE
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	P_ITLB_PROBE
	P_ACCESS_ITSB_PTR
thr7_MMU_ASI_AS_IF_USER_PRIMARY_LITTLE_374:
	.word	0x87802018
	.word	0xd6f76040
	.word	0xc02b233b
	P_IDEMAP_NCTX
	P_IDEMAP_ALL
	.word	0xc025ee98
	.word	0x1000000
	or	%g0, 0x1a0, %i7
	P_ITLB_TAG_READ
thr7_MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE_375:
	.word	0x8780202a
	.word	0xdcbc2fc0
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
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x0ab, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x096, %i7
	P_LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x420, %i7
	P_ITLB_TAG_READ
thr7_MMU_ASI_PRIMARY_376:
	.word	0x87802080
	.word	0xc6f76060
	.word	0x1000000
	or	%g0, 0x1b0, %i7
	P_READ_IDATA_ACCESS
thr7_MMU_ASI_PRIMARY_377:
	.word	0x87802080
	.word	0xfaf56038
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_AS_IF_USER_PRIMARY_378:
	.word	0x87802010
	.word	0xe0f42090
	.word	0xbe134000
	RETURN_FROM_SUPERVISOR1
	nop
Thr7_User_Text_4v402_exit:
	EXIT_GOOD
Thr7_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v103 DATA_VA=0x7bc0000f2000
attr_data {
	Name = .Thr7_User_Data_4v103 ,
	VA = 0x7bc0000f2000 ,/* 0x7bc0000f3fc0 */
	RA = 0x0010012000 ,
	PA = 0x0010012000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0000f21df 8000000010012440 */
	end_label   = Thr7_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v103_data_begin
Thr7_User_Data_4v103_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v203 DATA_VA=0x7d0038c00000
attr_data {
	Name = .Thr7_User_Data_4v203 ,
	VA = 0x7d0038c00000 ,/* 0x7d0038ffffc0 */
	RA = 0x015f400000 ,
	PA = 0x7d5f400000 ,
	TTE_Context = 0x16f8 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007d0038c01c59 8000007d5f400443 */
	end_label   = Thr7_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v203_data_begin
Thr7_User_Data_4v203_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v303 DATA_VA=0x7bc000194000
attr_data {
	Name = .Thr7_User_Data_4v303 ,
	VA = 0x7bc000194000 ,/* 0x7bc000195fc0 */
	RA = 0x0010154000 ,
	PA = 0x7010154000 ,
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
	/* DTTE_TAG_DATA = 00007bc000194000 8000007010154040 */
	end_label   = Thr7_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v303_data_begin
Thr7_User_Data_4v303_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v006 TEXT_VA=0x7bc0001cc000
attr_text {
	Name = .Thr7_User_Text_4v006 ,
	VA = 0x7bc0001cc000 ,/* 0x7bc0001cdfc0 */
	RA = 0x00100f8000 ,
	PA = 0x00100f8000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0001cc1df 80000000100f8480 */
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
	.word	0xc0766978
	.word	0xfe52a198
	.word	0xf2766150
	.word	0xc02d6aab
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	nop
	nop
	nop
	nop
	TOGGLE_LSU_IM
	IDEMAP_NCTX
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
	.word	0x1000000
	or	%g0, 0x40, %i7
	ITLB_TAG_READ
	TOGGLE_LSU_DM
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x500, %i7
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
	.word	0xf0742050
	.word	0xc0276618
	.word	0x1000000
	or	%g0, 0x023, %i7
	LOAD_IDATA_IN
	.word	0x1000000
	or	%g0, 0x88, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c3e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfe442268
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v006_exit:
	EXIT_GOOD
Thr7_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v104 DATA_VA=0x7c0000640000
attr_data {
	Name = .Thr7_User_Data_4v104 ,
	VA = 0x7c0000640000 ,/* 0x7c000064ffc0 */
	RA = 0x0130bf0000 ,
	PA = 0x7d30bf0000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00006401df 8000007d30bf0441 */
	end_label   = Thr7_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v104_data_begin
Thr7_User_Data_4v104_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v204 DATA_VA=0x7bc0000a2000
attr_data {
	Name = .Thr7_User_Data_4v204 ,
	VA = 0x7bc0000a2000 ,/* 0x7bc0000a3fc0 */
	RA = 0x00100e6000 ,
	PA = 0x00100e6000 ,
	TTE_Context = 0x16f8 ,/* DATA_SECONDARY */
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
	/* DTTE_TAG_DATA = 00007bc0000a3c59 80000000100e6440 */
	end_label   = Thr7_User_Data_4v204_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v204_data_begin
Thr7_User_Data_4v204_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v204_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v304 DATA_VA=0x7c00008f0000
attr_data {
	Name = .Thr7_User_Data_4v304 ,
	VA = 0x7c00008f0000 ,/* 0x7c00008fffc0 */
	RA = 0x0130130000 ,
	PA = 0x0130130000 ,
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
	/* DTTE_TAG_DATA = 00007c00008f0000 8000000130130041 */
	end_label   = Thr7_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v304_data_begin
Thr7_User_Data_4v304_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v007 TEXT_VA=0x7bc0000be000
attr_text {
	Name = .Thr7_User_Text_4v007 ,
	VA = 0x7bc0000be000 ,/* 0x7bc0000bffc0 */
	RA = 0x0010014000 ,
	PA = 0x0010014000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0000be1df 8000000010014480 */
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
	or	%g0, 0xe8, %i7
	ITLB_TAG_READ
	.word	0xc0342666
	.word	0xfcdd5000
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x7bf, %i7
	LOAD_DDATA_ACCESS
	.word	0xc02f6238
	.word	0x1000000
	or	%g0, 0x480, %i7
	LOAD_IDATA_ACCESS
thr7_MMU_ASI_SECONDARY_LITTLE_379:
	.word	0x87802089
	.word	0xf0bdabd0
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	IDEMAP_PCTX
	.word	0x1000000
	or	%g0, 0x698, %i7
	DTLB_TAG_READ
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x04d, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x2f8, %i7
	READ_DDATA_ACCESS
	.word	0xf4756098
	.word	0xc022af68
	.word	0xe05c20f0
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xfc9e5000
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
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe100000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0x1000000
	or	%g0, 0x520, %i7
	ITLB_TAG_READ
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc0312382
	ACCESS_ITSB_PTR
	IDEMAP_ALL_PAGES
	DO_BRANCH
	.word	0x81c1e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf25aa130
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v007_exit:
	EXIT_GOOD
Thr7_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v105 DATA_VA=0x7c0000180000
attr_data {
	Name = .Thr7_User_Data_4v105 ,
	VA = 0x7c0000180000 ,/* 0x7c000018ffc0 */
	RA = 0x01301e0000 ,
	PA = 0x7d301e0000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00001801df 8000007d301e0441 */
	end_label   = Thr7_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v105_data_begin
Thr7_User_Data_4v105_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v008 TEXT_VA=0x7bc000124000
attr_text {
	Name = .Thr7_User_Text_4v008 ,
	VA = 0x7bc000124000 ,/* 0x7bc000125fc0 */
	RA = 0x00100e2000 ,
	PA = 0x00100e2000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0001241df 80000000100e2480 */
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
thr7_MMU_ASI_PRIMARY_LITTLE_380:
	.word	0x87802088
	.word	0xd4be6170
	.word	0xd45c2130
	.word	0xfcdd5040
thr7_MMU_ASI_BLK_PL_381:
	.word	0x878020f8
	.word	0xe1baa280
	nop
	nop
	nop
	nop
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
	.word	0xbe178000
	IDEMAP_PAGE
	.word	0xc02f68b2
	.word	0xbe876160
	.word	0xf2dfd000
	.word	0x1000000
	or	%g0, 0x065, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	.word	0xbe160000
	DDEMAP_PAGE
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe25f6010
	DDEMAP_ALL
	DDEMAP_ALL
	DDEMAP_ALL
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x02b, %i7
	LOAD_IDATA_IN
	IDEMAP_NCTX
	.word	0x1000000
	or	%g0, 0x069, %i7
	LOAD_DDATA_IN
	.word	0x1000000
	or	%g0, 0x046, %i7
	LOAD_IDATA_IN
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0xc0, %i7
	ITLB_TAG_READ
	.word	0xfcdd5000
	.word	0x1000000
	or	%g0, 0x073, %i7
	LOAD_DDATA_IN
	.word	0xc0312684
	nop
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
	nop
	.word	0x1000000
	or	%g0, 0x015, %i7
	LOAD_IDATA_IN
	DDEMAP_ALL
	ACCESS_ITSB_PTR
	.word	0xd85aa018
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL
	.word	0x1000000
	or	%g0, 0xed, %i7
	LOAD_DDATA_ACCESS
	DDEMAP_PCTX
	.word	0xfa5d6130
thr7_MMU_ASI_PRIMARY_382:
	.word	0x87802080
	.word	0xd0f2a088
	.word	0xfe5e6400
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc03666ba
	.word	0x1000000
	or	%g0, 0x2d0, %i7
	READ_DDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x70, %i7
	DTLB_TAG_READ
	.word	0xd670a070
	.word	0xc0766400
thr7_MMU_ASI_BLK_COMMIT_P_383:
	.word	0x878020e0
	.word	0xc3bf6e80
	.word	0xec766010
	.word	0xc07429a0
	IDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe138000
	IDEMAP_PAGE
	.word	0xfe542a40
	.word	0xfcdc1000
	.word	0xc02f6629
	.word	0xe0776038
	.word	0xc032ae4c
thr7_MMU_ASI_PRIMARY_384:
	.word	0x87802080
	.word	0xf6f0a018
	.word	0xe25e6010
thr7_MMU_ASI_PRIMARY_385:
	.word	0x87802080
	.word	0xe6f76050
	.word	0xfe54262c
	.word	0xfe5d6730
	.word	0xbe82a0d0
	.word	0xfadfd000
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc02e6f02
	.word	0x81c36000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v008_exit:
	EXIT_GOOD
Thr7_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v106 DATA_VA=0x7bc000126000
attr_data {
	Name = .Thr7_User_Data_4v106 ,
	VA = 0x7bc000126000 ,/* 0x7bc000127fc0 */
	RA = 0x00100dc000 ,
	PA = 0x00100dc000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0001261df 80000000100dc440 */
	end_label   = Thr7_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v106_data_begin
Thr7_User_Data_4v106_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v009 TEXT_VA=0x7bc0001a0000
attr_text {
	Name = .Thr7_User_Text_4v009 ,
	VA = 0x7bc0001a0000 ,/* 0x7bc0001a1fc0 */
	RA = 0x0010156000 ,
	PA = 0x0010156000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0001a01df 8000000010156480 */
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
	.word	0xfe466b9c
	.word	0x1000000
	or	%g0, 0x2c8, %i7
	DTLB_TAG_READ
	.word	0xfe4425f0
	nop
	nop
	nop
	nop
	nop
	.word	0xbe876008
	.word	0xc4dfd000
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0xc8, %i7
	READ_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45aa0d0
	.word	0xbe124000
	GOTO_SUPERVISOR0
	DDEMAP_ALL
	.word	0xc0766180
thr7_MMU_ASI_PRIMARY_386:
	.word	0x87802080
	.word	0xdcf76028
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
	or	%g0, 0x4e8, %i7
	READ_IDATA_ACCESS
	.word	0xfe5d6cb0
	nop
	nop
	ACCESS_ITSB_PTR
	.word	0xfe556398
	.word	0xf6776018
	.word	0xc072aeb8
	.word	0xd45d6160
	.word	0xbe842068
	.word	0xd4dfd000
thr7_MMU_ASI_PRIMARY_387:
	.word	0x87802080
	.word	0xe4f76048
thr7_MMU_ASI_PRIMARY_388:
	.word	0x87802080
	.word	0xfaf660e0
	DDEMAP_ALL_PAGES
	DDEMAP_SCTX
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
	.word	0x1000000
	.word	0xbe15c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xfe42ac3c
	.word	0xca5f60b8
	.word	0x1000000
	or	%g0, 0x045, %i7
	LOAD_DDATA_IN
	.word	0xbe82a0d0
	.word	0xeadfd000
	.word	0xbe856038
	.word	0xe0dfd000
	.word	0xbe856068
	.word	0xd4dfd000
	.word	0x1000000
	or	%g0, 0x021, %i7
	LOAD_IDATA_IN
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xca712010
	.word	0xc02d6d8b
	DDEMAP_ALL_PAGES
	.word	0x1000000
	.word	0xbe14c000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	xor	%i7, 0x10, %i7
	ITLB_PROBE
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
	.word	0xf45d6010
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v009_exit:
	EXIT_GOOD
Thr7_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v107 DATA_VA=0x7c0000ee0000
attr_data {
	Name = .Thr7_User_Data_4v107 ,
	VA = 0x7c0000ee0000 ,/* 0x7c0000eeffc0 */
	RA = 0x01305f0000 ,
	PA = 0x7d305f0000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c0000ee01df 8000007d305f0441 */
	end_label   = Thr7_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v107_data_begin
Thr7_User_Data_4v107_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00a TEXT_VA=0x7c0000a60000
attr_text {
	Name = .Thr7_User_Text_4v00a ,
	VA = 0x7c0000a60000 ,/* 0x7c0000a6ffc0 */
	RA = 0x0130af0000 ,
	PA = 0x7d30af0000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000a601df 8000007d30af0481 */
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
	.word	0x1000000
	or	%g0, 0x174, %i7
	LOAD_DDATA_ACCESS
	.word	0xcc72a018
	.word	0xc0776d50
	.word	0xfa5c2090
	.word	0xdc766028
	.word	0xc0276c00
thr7_MMU_ASI_PRIMARY_389:
	.word	0x87802080
	.word	0xd2f2a080
	.word	0xfcdd5000
	.word	0x1000000
	or	%g0, 0x003, %i7
	LOAD_IDATA_IN
	.word	0xfc9a9c40
	.word	0xbe842120
	.word	0xeadfd000
	.word	0xc85e60b0
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xc0242774
	IDEMAP_ALL_PAGES
	.word	0xc02e695b
	.word	0xbe866120
	.word	0xe0dfd000
	.word	0xbe866120
	.word	0xfadfd000
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe42a6a4
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00a_exit:
	EXIT_GOOD
Thr7_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v108 DATA_VA=0x7e0220000000
attr_data {
	Name = .Thr7_User_Data_4v108 ,
	VA = 0x7e0220000000 ,/* 0x7e022fffffc0 */
	RA = 0x0020000000 ,
	PA = 0x7420000000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007e0220000021 8000007420000445 */
	end_label   = Thr7_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v108_data_begin
Thr7_User_Data_4v108_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00b TEXT_VA=0x7bc0000b8000
attr_text {
	Name = .Thr7_User_Text_4v00b ,
	VA = 0x7bc0000b8000 ,/* 0x7bc0000b9fc0 */
	RA = 0x00100e4000 ,
	PA = 0x00100e4000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0000b81df 80000000100e4480 */
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
	nop
	nop
	nop
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0x068, %i7
	LOAD_IDATA_IN
	.word	0xf4756010
	.word	0xc0342eb4
	.word	0xbe856008
	.word	0xd4dfd000
	nop
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
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc672a050
	.word	0xc0376180
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00b_exit:
	EXIT_GOOD
Thr7_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v109 DATA_VA=0x7c00000d0000
attr_data {
	Name = .Thr7_User_Data_4v109 ,
	VA = 0x7c00000d0000 ,/* 0x7c00000dffc0 */
	RA = 0x0130e90000 ,
	PA = 0x7d30e90000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00000d01df 8000007d30e90441 */
	end_label   = Thr7_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v109_data_begin
Thr7_User_Data_4v109_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00c TEXT_VA=0x7c0000e00000
attr_text {
	Name = .Thr7_User_Text_4v00c ,
	VA = 0x7c0000e00000 ,/* 0x7c0000e0ffc0 */
	RA = 0x0130ea0000 ,
	PA = 0x7d30ea0000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007c0000e001df 8000007d30ea0481 */
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
	.word	0xfc9d9120
	TOGGLE_LSU_IM
	.word	0xd272a060
	.word	0xc0712758
	.word	0xee5aa0c0
	ACCESS_ITSB_PTR
	.word	0xc02aa8de
	DDEMAP_SCTX
	.word	0xbe120000
	GOTO_SUPERVISOR1
	ACCESS_DTSB_PTR
	.word	0x1000000
	.word	0xbe178000
	IDEMAP_RPAGE
	.word	0xc07664d8
	.word	0xc0342544
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xbe856090
	.word	0xfadfd000
	.word	0xfcdc1000
	IDEMAP_ALL_PAGES
	IDEMAP_ALL
thr7_MMU_ASI_BLK_PL_390:
	.word	0x878020f8
	.word	0xc1bc2980
	IDEMAP_PCTX
	ACCESS_ITSB_PTR
	.word	0x1000000
	or	%g0, 0x4b, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_PCTX
	.word	0xc024287c
	TOGGLE_LSU_IM
	.word	0x1000000
	or	%g0, 0xd, %i7
	LOAD_DDATA_ACCESS
	ACCESS_ITSB_PTR
	.word	0xbe150000
	GOTO_SUPERVISOR1
	.word	0xc02428ac
thr7_MMU_ASI_PRIMARY_391:
	.word	0x87802080
	.word	0xd0f66028
	.word	0x1000000
	or	%g0, 0x208, %i7
	DTLB_TAG_READ
thr7_MMU_ASI_BLK_SL_392:
	.word	0x878020f9
	.word	0xc1b96c00
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
	or	%g0, 0x4b8, %i7
	DTLB_TAG_READ
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe870a028
	.word	0xc032a170
thr7_MMU_ASI_BLK_P_393:
	.word	0x878020f0
	.word	0xc3bf62c0
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf25aa090
	.word	0x81c62000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00c_exit:
	EXIT_GOOD
Thr7_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10a DATA_VA=0x7c0000810000
attr_data {
	Name = .Thr7_User_Data_4v10a ,
	VA = 0x7c0000810000 ,/* 0x7c000081ffc0 */
	RA = 0x0130eb0000 ,
	PA = 0x7d30eb0000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00008101df 8000007d30eb0441 */
	end_label   = Thr7_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10a_data_begin
Thr7_User_Data_4v10a_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00d TEXT_VA=0x7bc0001d8000
attr_text {
	Name = .Thr7_User_Text_4v00d ,
	VA = 0x7bc0001d8000 ,/* 0x7bc0001d9fc0 */
	RA = 0x0010052000 ,
	PA = 0x0010052000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0001d81df 8000000010052480 */
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
thr7_MMU_ASI_PRIMARY_394:
	.word	0x87802080
	.word	0xc6f76050
	DDEMAP_NCTX
	.word	0xc85d6130
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
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	.word	0xbe10c000
	DDEMAP_PAGE
	.word	0x1000000
	or	%g0, 0x055, %i7
	LOAD_IDATA_IN
	.word	0xe672a158
	.word	0xc0776f50
	.word	0x1000000
	or	%g0, 0x5c0, %i7
	READ_IDATA_ACCESS
	.word	0xfe4e6899
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	.word	0xbe14c000
	DDEMAP_PAGE
	.word	0xfcdd5000
	ACCESS_DTSB_PTR
	TOGGLE_LSU_IM
	.word	0xe45aa018
	TOGGLE_LSU_DM
	.word	0xea5d6100
	DDEMAP_PCTX
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DDEMAP_ALL_RPAGES
	.word	0xce72a050
	.word	0xc0266474
	.word	0xfcd89140
	.word	0x1000000
	or	%g0, 0x7, %i7
	LOAD_IDATA_ACCESS
	.word	0xbe816010
	.word	0xd6dfd060
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xe45f6078
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd45e6150
	.word	0xfa5c2160
thr7_MMU_ASI_PRIMARY_395:
	.word	0x87802080
	.word	0xcaf560b8
	.word	0x1000000
	.word	0xbe120000
	IDEMAP_RPAGE
	DDEMAP_ALL_PAGES
	.word	0x1000000
	or	%g0, 0x5ed, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe42a45c
	.word	0x1000000
	.word	0xbe110000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	ACCESS_DTSB_PTR
	.word	0xfc9f5000
	DO_BRANCH
	.word	0x81c0e088
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xe058a068
	.word	0x1000000
	.word	0xbe114000
	srlx	%i7, 8, %i7
	andn	%i7, 0x1f, %i7
	ITLB_PROBE
	.word	0xbe812140
	.word	0xe0dfd000
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xd4592068
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00d_exit:
	EXIT_GOOD
Thr7_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10b DATA_VA=0x7d0027800000
attr_data {
	Name = .Thr7_User_Data_4v10b ,
	VA = 0x7d0027800000 ,/* 0x7d0027bfffc0 */
	RA = 0x015c400000 ,
	PA = 0x7d5c400000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007d00278001df 8000007d5c400443 */
	end_label   = Thr7_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10b_data_begin
Thr7_User_Data_4v10b_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00e TEXT_VA=0x7bc00012a000
attr_text {
	Name = .Thr7_User_Text_4v00e ,
	VA = 0x7bc00012a000 ,/* 0x7bc00012bfc0 */
	RA = 0x00101da000 ,
	PA = 0x00101da000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc00012a1df 80000000101da480 */
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
	.word	0xca70a010
	.word	0xc02d684c
	.word	0x1000000
	or	%g0, 0x548, %i7
	DTLB_TAG_READ
	.word	0xfcdad120
	.word	0xbe8660b0
	.word	0xd4dfd000
	.word	0x1000000
	.word	0xbe114000
	DDEMAP_RPAGE
	DDEMAP_SCTX
	.word	0xfe442da0
	.word	0xe2742010
	.word	0xc02e6c16
	TOGGLE_LSU_DM
	ACCESS_ITSB_PTR
	.word	0xfe4f692b
	.word	0xbe856008
	.word	0xd4dfd000
	.word	0xd2742060
	.word	0xc072aff0
thr7_MMU_ASI_PRIMARY_396:
	.word	0x87802080
	.word	0xe8be66c0
thr7_MMU_ASI_PRIMARY_397:
	.word	0x87802080
	.word	0xe4f56048
	.word	0xc0276e60
	ACCESS_DTSB_PTR
	IDEMAP_ALL_RPAGES
	.word	0xea742168
	.word	0xc02c254c
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfcdf5000
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0xa8, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x146, %i7
	LOAD_DDATA_ACCESS
	IDEMAP_PCTX
	nop
	.word	0xfc9c1c40
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xfe4d65a8
	.word	0xfe476fa0
	TOGGLE_LSU_IM
	.word	0xfcdc1000
	.word	0xc02e6265
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd4756110
	.word	0xc072af88
	IDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x416, %i7
	LOAD_IDATA_ACCESS
	.word	0xc07662b0
	DO_BRANCH
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xc3991e00
	nop
	.word	0xcc7420a0
	.word	0xc034230a
	.word	0x1000000
	or	%g0, 0x140, %i7
	READ_DDATA_ACCESS
	.word	0xf45aa010
	.word	0x1000000
	.word	0xbe114000
	IDEMAP_RPAGE
	.word	0xfa5c2150
thr7_MMU_ASI_PRIMARY_398:
	.word	0x87802080
	.word	0xf2f76150
	.word	0x1000000
	or	%g0, 0x469, %i7
	LOAD_IDATA_ACCESS
	.word	0xfe5e6a28
thr7_MMU_ASI_PRIMARY_399:
	.word	0x87802080
	.word	0xdef42050
	.word	0xfa5e6038
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe45aa0a0
	.word	0x1000000
	or	%g0, 0x360, %i7
	DTLB_TAG_READ
thr7_MMU_ASI_PRIMARY_400:
	.word	0x87802080
	.word	0xd4f560d0
	nop
	nop
	nop
	DO_BRANCH
	.word	0x81c62000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0xf25f6068
	.word	0x81c4e000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00e_exit:
	EXIT_GOOD
Thr7_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10c DATA_VA=0x7bc0000e6000
attr_data {
	Name = .Thr7_User_Data_4v10c ,
	VA = 0x7bc0000e6000 ,/* 0x7bc0000e7fc0 */
	RA = 0x0010116000 ,
	PA = 0x0010116000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0000e61df 8000000010116440 */
	end_label   = Thr7_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10c_data_begin
Thr7_User_Data_4v10c_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00f TEXT_VA=0x7bc0000c8000
attr_text {
	Name = .Thr7_User_Text_4v00f ,
	VA = 0x7bc0000c8000 ,/* 0x7bc0000c9fc0 */
	RA = 0x001007a000 ,
	PA = 0x001007a000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0000c81df 800000001007a480 */
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
	DDEMAP_ALL_PAGES
	.word	0xd45c2160
	.word	0x1000000
	or	%g0, 0x8c, %i7
	LOAD_IDATA_ACCESS
	IDEMAP_PCTX
	.word	0xc0256518
	.word	0xbe138000
	GOTO_SUPERVISOR1
	.word	0xea5aa090
	.word	0x1000000
	or	%g0, 0x4c8, %i7
	READ_DDATA_ACCESS
	.word	0xc39f5e00
	.word	0x1000000
	.word	0xbe114000
	DDEMAP_PAGE
	.word	0xbe85a040
	.word	0xd6dfd060
	.word	0x1000000
	or	%g0, 0x50, %i7
	READ_IDATA_ACCESS
	.word	0x1000000
	or	%g0, 0x028, %i7
	LOAD_IDATA_IN
	IDEMAP_PCTX
	.word	0xe05c20b0
	nop
	nop
	nop
	.word	0xc02e66c2
	.word	0xcc5aa018
	.word	0x1000000
	or	%g0, 0x2f0, %i7
	READ_DDATA_ACCESS
	DO_BRANCH
	.word	0x81c72000
	.word	0xbe124000
	GOTO_SUPERVISOR0
	.word	0x1000000
	or	%g0, 0x312, %i7
	LOAD_DDATA_ACCESS
	nop
	nop
	nop
	nop
	nop
	.word	0xfc9c1c40
thr7_MMU_ASI_PRIMARY_401:
	.word	0x87802080
	.word	0xf4f2a010
	.word	0x1000000
	or	%g0, 0x740, %i7
	READ_DDATA_ACCESS
	.word	0xfcdd5040
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xee5e60a0
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v00f_exit:
	EXIT_GOOD
Thr7_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10d DATA_VA=0x7bc0001ce000
attr_data {
	Name = .Thr7_User_Data_4v10d ,
	VA = 0x7bc0001ce000 ,/* 0x7bc0001cffc0 */
	RA = 0x001015e000 ,
	PA = 0x001015e000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007bc0001ce1df 800000001015e440 */
	end_label   = Thr7_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10d_data_begin
Thr7_User_Data_4v10d_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v010 TEXT_VA=0x7bc000162000
attr_text {
	Name = .Thr7_User_Text_4v010 ,
	VA = 0x7bc000162000 ,/* 0x7bc000163fc0 */
	RA = 0x0010164000 ,
	PA = 0x0010164000 ,
	TTE_Context = 0x0021 ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00007bc0001621df 8000000010164480 */
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
	.word	0xfe52af04
	.word	0xc02c234b
	DDEMAP_PCTX
	.word	0xe458a048
	.word	0xc85f60f0
	.word	0xe05f60d0
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xd45d60b0
	.word	0xc02d6f8e
	.word	0xfe442510
	DDEMAP_ALL
	.word	0xc19d9e20
	IDEMAP_NCTX
	.word	0xbe8560d0
	.word	0xc4dfd000
	.word	0xc02c2e62
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	.word	0xbe134000
	IDEMAP_PAGE
	.word	0xec72a010
	.word	0xc02aa62e
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
thr7_MMU_ASI_BLK_P_402:
	.word	0x878020f0
	.word	0xc3be67c0
	.word	0xc85c20e0
	nop
	nop
	nop
	.word	0xfa72a160
	.word	0xc0742fe8
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0x1000000
	or	%g0, 0x443, %i7
	LOAD_IDATA_ACCESS
thr7_MMU_ASI_PRIMARY_403:
	.word	0x87802080
	.word	0xd6f42040
	.word	0xfe4aaa07
	.word	0xea5c2090
	.word	0x1000000
	or	%g0, 0x4f0, %i7
	LOAD_DDATA_ACCESS
	.word	0xc0776898
	nop
	nop
	nop
	.word	0xc0256180
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0xe19ade20
thr7_MMU_ASI_PRIMARY_404:
	.word	0x87802080
	.word	0xc6f420a8
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
thr7_MMU_ASI_PRIMARY_LITTLE_405:
	.word	0x87802088
	.word	0xc8f0a0f0
	.word	0xfe5aad38
	nop
	nop
	nop
	nop
	nop
	nop
	.word	0xc45c2160
	.word	0xbe876100
	.word	0xd4dfd000
	IDEMAP_ALL
	.word	0xbe120000
	GOTO_SUPERVISOR1
	.word	0x1000000
	or	%g0, 0x330, %i7
	DTLB_TAG_READ
	.word	0xc0756350
	.word	0x1000000
	or	%g0, 0x097, %i7
	LOAD_IDATA_IN
	DDEMAP_ALL_RPAGES
	.word	0x1000000
	or	%g0, 0x08e, %i7
	LOAD_IDATA_IN
	DO_BRANCH
	.word	0x81c26000
	.word	0xbe13c000
	GOTO_SUPERVISOR0
	.word	0xc02aa67d
	.word	0xbe124000
	GOTO_SUPERVISOR0
	nop
Thr7_User_Text_4v010_exit:
	EXIT_GOOD
Thr7_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10e DATA_VA=0x7c00007c0000
attr_data {
	Name = .Thr7_User_Data_4v10e ,
	VA = 0x7c00007c0000 ,/* 0x7c00007cffc0 */
	RA = 0x0130370000 ,
	PA = 0x7d30370000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c00007c01df 8000007d30370441 */
	end_label   = Thr7_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10e_data_begin
Thr7_User_Data_4v10e_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10f DATA_VA=0x7c0000a70000
attr_data {
	Name = .Thr7_User_Data_4v10f ,
	VA = 0x7c0000a70000 ,/* 0x7c0000a7ffc0 */
	RA = 0x0130c90000 ,
	PA = 0x7d30c90000 ,
	TTE_Context = 0x0021 ,/* DATA_PRIMARY */
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
	/* DTTE_TAG_DATA = 00007c0000a701df 8000007d30c90441 */
	end_label   = Thr7_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10f_data_begin
Thr7_User_Data_4v10f_data_begin:
	.xword	0x7d0000400000
	.xword	0x7bc00011c000
	.xword	0x7bc000058000
	.xword	0x7bc0001be000
	.xword	0x7bc000120000
	.xword	0x7c0000290000
	.xword	0x7bc00013a000
	.xword	0x7c00003e0000
	.xword	0x7bc000192000
	.xword	0x7bc0001c4000
	.xword	0x7bc000152000
	.xword	0x7bc000150000
	.xword	0x7d0016000000
	.xword	0x7d0037800000
	.xword	0x7bc0001fe000
	.xword	0x7c0000510000
	.xword	0x7d0030000000
	.xword	0x7bc0001dc000
	.xword	0x7bc0000f2000
	.xword	0x7d0038c00000
	.xword	0x7bc000194000
	.xword	0x7bc0001cc000
	.xword	0x7c0000640000
	.xword	0x7bc0000a2000
	.xword	0x7c00008f0000
	.xword	0x7bc0000be000
	.xword	0x7c0000180000
	.xword	0x7bc000124000
	.xword	0x7bc000126000
	.xword	0x7bc0001a0000
	.xword	0x7c0000ee0000
	.xword	0x7c0000a60000
	.xword	0x7e0220000000
	.xword	0x7bc0000b8000
	.xword	0x7c00000d0000
	.xword	0x7c0000e00000
	.xword	0x7c0000810000
	.xword	0x7bc0001d8000
	.xword	0x7d0027800000
	.xword	0x7bc00012a000
	.xword	0x7bc0000e6000
	.xword	0x7bc0000c8000
	.xword	0x7bc0001ce000
	.xword	0x7bc000162000
	.xword	0x7c00007c0000
	.xword	0x7c0000a70000
Thr7_User_Data_4v10f_data_end:

