/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_mt_asi_cp.s
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
	
#define CUSTOM_TRAP_0XC

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
#define THR0_PCONTEXT_0 0x0fde
#define THR0_PCONTEXT_1 0x1547
#define THR0_SCONTEXT_0 0x189c
#define THR0_SCONTEXT_1 0x1516
#define THR1_PCONTEXT_0 0x1715
#define THR1_PCONTEXT_1 0x1022
#define THR1_SCONTEXT_0 0x173f
#define THR1_SCONTEXT_1 0x1673
#define THR2_PCONTEXT_0 0x0eeb
#define THR2_PCONTEXT_1 0x12a0
#define THR2_SCONTEXT_0 0x015e
#define THR2_SCONTEXT_1 0x1138
#define THR3_PCONTEXT_0 0x0456
#define THR3_PCONTEXT_1 0x1240
#define THR3_SCONTEXT_0 0x085d
#define THR3_SCONTEXT_1 0x1c13
#define THR4_PCONTEXT_0 0x1d2c
#define THR4_PCONTEXT_1 0x0503
#define THR4_SCONTEXT_0 0x146b
#define THR4_SCONTEXT_1 0x1d53
#define THR5_PCONTEXT_0 0x1189
#define THR5_PCONTEXT_1 0x07d9
#define THR5_SCONTEXT_0 0x1fce
#define THR5_SCONTEXT_1 0x0896
#define THR6_PCONTEXT_0 0x1578
#define THR6_PCONTEXT_1 0x1a1e
#define THR6_SCONTEXT_0 0x019e
#define THR6_SCONTEXT_1 0x09de
#define THR7_PCONTEXT_0 0x114a
#define THR7_PCONTEXT_1 0x1c87
#define THR7_SCONTEXT_0 0x1361
#define THR7_SCONTEXT_1 0x0267
#define THR0_PTRAP_TEXT_VA 0x600000c20000
#define THR0_PTRAP_TEXT_RA 0x03c0250000
#define THR0_PTRAP_TEXT_PA 0x0fc0250000
#define THR1_PTRAP_TEXT_VA 0x640000890000
#define THR1_PTRAP_TEXT_RA 0x03d0870000
#define THR1_PTRAP_TEXT_PA 0x03d0870000
#define THR2_PTRAP_TEXT_VA 0x680000bd0000
#define THR2_PTRAP_TEXT_RA 0x03e07e0000
#define THR2_PTRAP_TEXT_PA 0x03e07e0000
#define THR3_PTRAP_TEXT_VA 0x6c00004c0000
#define THR3_PTRAP_TEXT_RA 0x03f0f90000
#define THR3_PTRAP_TEXT_PA 0x3ff0f90000
#define THR4_PTRAP_TEXT_VA 0x700000ff0000
#define THR4_PTRAP_TEXT_RA 0x00100a0000
#define THR4_PTRAP_TEXT_PA 0x40100a0000
#define THR5_PTRAP_TEXT_VA 0x740000bb0000
#define THR5_PTRAP_TEXT_RA 0x0020360000
#define THR5_PTRAP_TEXT_PA 0x5420360000
#define THR6_PTRAP_TEXT_VA 0x780000d60000
#define THR6_PTRAP_TEXT_RA 0x00302d0000
#define THR6_PTRAP_TEXT_PA 0x00302d0000
#define THR7_PTRAP_TEXT_VA 0x7c0000eb0000
#define THR7_PTRAP_TEXT_RA 0x00407d0000
#define THR7_PTRAP_TEXT_PA 0x00407d0000
#include "mmu_hred.s"
/*********************************************************************/
SECTION .Thr0_Priv_Sect TEXT_VA=0x5f500017a000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_1
	VA = 0x5f500017a000 ,
	RA = 0x00b00ac000 ,
	PA = 0x0cb00ac000 ,
	TTE_Context = 0x0fde ,
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
SECTION .Thr1_Priv_Sect TEXT_VA=0x6360000be000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_1
	VA = 0x6360000be000 ,
	RA = 0x00c0192000 ,
	PA = 0x00c0192000 ,
	TTE_Context = 0x1715 ,
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
SECTION .Thr2_Priv_Sect TEXT_VA=0x6770001c8000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_3
	VA = 0x6770001c8000 ,
	RA = 0x00d01ca000 ,
	PA = 0x00d01ca000 ,
	TTE_Context = 0x0eeb ,
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
SECTION .Thr3_Priv_Sect TEXT_VA=0x6b8000114000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_0
	VA = 0x6b8000114000 ,
	RA = 0x00e0162000 ,
	PA = 0x00e0162000 ,
	TTE_Context = 0x0456 ,
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
SECTION .Thr4_Priv_Sect TEXT_VA=0x6f9000074000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_2
	VA = 0x6f9000074000 ,
	RA = 0x00f011e000 ,
	PA = 0x00f011e000 ,
	TTE_Context = 0x1d2c ,
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
SECTION .Thr5_Priv_Sect TEXT_VA=0x73a000186000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_3
	VA = 0x73a000186000 ,
	RA = 0x01001c0000 ,
	PA = 0x01001c0000 ,
	TTE_Context = 0x1189 ,
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
SECTION .Thr6_Priv_Sect TEXT_VA=0x77b0000c8000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_1
	VA = 0x77b0000c8000 ,
	RA = 0x0110030000 ,
	PA = 0x6d10030000 ,
	TTE_Context = 0x1578 ,
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
SECTION .Thr7_Priv_Sect TEXT_VA=0x7bc000136000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x7bc000136000 ,
	RA = 0x01201f4000 ,
	PA = 0x01201f4000 ,
	TTE_Context = 0x114a ,
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
	TTE_P       =           0 ,
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
/*********************************************************************/
SECTION .HPTRAPS_CUSTOM_SECT   TEXT_VA=0xa0000, DATA_VA=0xa8000
        
attr_text {
        Name=.HPTRAPS_CUSTOM_SECT,
        hypervisor
}

.text
.global custom_trap_0xc_handler

custom_trap_0xc_handler:
	setx	Thr2_User_Text_4v000_text_begin, %g2, %g1
	wrpr	%g1, %tnpc
        done
                
attr_data {
        Name=.HPTRAPS_CUSTOM_SECT,
        hypervisor
}

/*********************************************************************/
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x5f5000168000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	VA = 0x5f5000168000 ,/* 0x5f5000169fc0 */
	RA = 0x00b007c000 ,
	PA = 0x0cb007c000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f5000169547 8000000cb007c080 */
	end_label   = Thr0_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
	! %i0 = data primary, c
	! %i1 = data primary, nc
	! %i2 = data secondary, c
	! %i3 = data secondary, nc
	setx	Thr0_User_Data_4v100_data_begin, %l0, %i0
	setx	Thr0_User_Data_4v101_data_begin, %l0, %i1
	setx	Thr0_User_Data_4v200_data_begin, %l0, %i2
	setx	Thr0_User_Data_4v201_data_begin, %l0, %i3
.global Thr0_User_Text_4v000_text_begin
Thr0_User_Text_4v000_text_begin:
	ldda	[%i1] MMU_ASI_BLK_P, %f0
	ldda	[%i0] MMU_ASI_BLK_P, %f0
	stda	%f0, [%i1] MMU_ASI_BLK_COMMIT_P
	stda	%f0, [%i0] MMU_ASI_BLK_COMMIT_P
	ldda	[%i0] MMU_ASI_BLK_PL, %f16
	stda	%f16, [%i3] MMU_ASI_BLK_COMMIT_S
	stda	%f16, [%i2] MMU_ASI_BLK_COMMIT_S
	
	ldda	[%i3] MMU_ASI_BLK_S, %f16
	ldda	[%i2] MMU_ASI_BLK_S, %f16
	ldda	[%i2] MMU_ASI_BLK_SL, %f0
	setx	Thr0_User_Text_4v400_text_begin, %l0, %i7
	GOTO_SUPERVISOR1
	EXIT_BAD
.align	256
	nop
	nop
	EXIT_GOOD
Thr0_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v100 DATA_VA=0x600000170000
attr_data {
	Name = .Thr0_User_Data_4v100 ,
	VA = 0x600000170000 ,/* 0x60000017ffc0 */
	RA = 0x03c04b0000 ,
	PA = 0x0fc04b0000 ,
	TTE_Context = 0x0fde ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 0000600000170fde 8000000fc04b0441 */
	end_label   = Thr0_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v100_data_begin
Thr0_User_Data_4v100_data_begin:
	.xword	0x1234abcd
	.xword	0xffaaccdd
	.xword	0x1122aadd
	.xword	0xeeccbb00
Thr0_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v200 DATA_VA=0x61003b000000
attr_data {
	Name = .Thr0_User_Data_4v200 ,
	VA = 0x61003b000000 ,/* 0x61003b3fffc0 */
	RA = 0x005cc00000 ,
	PA = 0x085cc00000 ,
	TTE_Context = 0x189c ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 000061003b00189c 800000085cc00043 */
	end_label   = Thr0_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v200_data_begin
Thr0_User_Data_4v200_data_begin:
	.xword	0xabcd0000
	.xword	0x1224aaaa
	.xword	0x33442211
	.xword	0xabefcdaa
Thr0_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v300 DATA_VA=0x5f50000b0000
attr_data {
	Name = .Thr0_User_Data_4v300 ,
	VA = 0x5f50000b0000 ,/* 0x5f50000b1fc0 */
	RA = 0x00b0062000 ,
	PA = 0x00b0062000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr0_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x020000 ,
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
	/* DTTE_TAG_DATA = 00005f50000b0000 80000000b0062440 */
	end_label   = Thr0_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v300_data_begin
Thr0_User_Data_4v300_data_begin:
Thr0_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v001 TEXT_VA=0x61003b400000
attr_text {
	Name = .Thr0_User_Text_4v001 ,
	VA = 0x61003b400000 ,/* 0x61003b7fffc0 */
	RA = 0x005d400000 ,
	PA = 0x085d400000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061003b400fde 800000085d400083 */
	end_label   = Thr0_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v001_text_begin
Thr0_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v400 TEXT_VA=0x5f500017e000
attr_text {
	Name = .Thr0_User_Text_4v400 ,
	VA = 0x5f500017e000 ,/* 0x5f500017ffc0 */
	RA = 0x00b00a4000 ,
	PA = 0x00b00a4000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr0_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* ITTE_TAG_DATA = 00005f500017e000 80000000b00a4080 */
	end_label   = Thr0_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v400_text_begin
Thr0_User_Text_4v400_text_begin:
	setx	Thr0_User_Text_4v002_text_begin, %l0, %i7
	RETURN_FROM_SUPERVISOR1
	EXIT_BAD
Thr0_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v002 TEXT_VA=0x620ec0000000
attr_text {
	Name = .Thr0_User_Text_4v002 ,
	VA = 0x620ec0000000 ,/* 0x620ecfffffc0 */
	RA = 0x0320000000 ,
	PA = 0x0320000000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000620ec0000fde 8000000320000085 */
	end_label   = Thr0_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v002_text_begin
Thr0_User_Text_4v002_text_begin:
	setx	Thr0_User_Text_4v003_text_begin, %i2, %i7
	add	%i7, 256, %i7
	GOTO_SUPERVISOR0
	EXIT_BAD
Thr0_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v101 DATA_VA=0x5f50001dc000
attr_data {
	Name = .Thr0_User_Data_4v101 ,
	VA = 0x5f50001dc000 ,/* 0x5f50001ddfc0 */
	RA = 0x00b01d4000 ,
	PA = 0x0cb01d4000 ,
	TTE_Context = 0x0fde ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00005f50001dd547 8000000cb01d4440 */
	end_label   = Thr0_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v101_data_begin
Thr0_User_Data_4v101_data_begin:
	.xword	0x10101010
	.xword	0x11111111
	.xword	0x12121212
	.xword	0x13131313
Thr0_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v201 DATA_VA=0x61002c400000
attr_data {
	Name = .Thr0_User_Data_4v201 ,
	VA = 0x61002c400000 ,/* 0x61002c7fffc0 */
	RA = 0x005c000000 ,
	PA = 0x085c000000 ,
	TTE_Context = 0x189c ,/* DATA_SECONDARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 000061002c40189c 800000085c000043 */
	end_label   = Thr0_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v201_data_begin
Thr0_User_Data_4v201_data_begin:
	.xword	0x14141414
	.xword	0x15151515
	.xword	0x16161616
	.xword	0x17171717
Thr0_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v301 DATA_VA=0x600000d40000
attr_data {
	Name = .Thr0_User_Data_4v301 ,
	VA = 0x600000d40000 ,/* 0x600000d4ffc0 */
	RA = 0x03c0980000 ,
	PA = 0x0fc0980000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr0_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x020000 ,
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
	/* DTTE_TAG_DATA = 0000600000d40000 8000000fc0980441 */
	end_label   = Thr0_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v301_data_begin
Thr0_User_Data_4v301_data_begin:
Thr0_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v003 TEXT_VA=0x5f5000082000
attr_text {
	Name = .Thr0_User_Text_4v003 ,
	VA = 0x5f5000082000 ,/* 0x5f5000083fc0 */
	RA = 0x00b00be000 ,
	PA = 0x0cb00be000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f5000083547 8000000cb00be080 */
	end_label   = Thr0_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v003_text_begin
Thr0_User_Text_4v003_text_begin:
	EXIT_BAD
.align	256
	setx	Thr0_user_code_entry, %i1, %i7
	add	%i7, 256, %i7
	RETURN_FROM_SUPERVISOR0
	EXIT_BAD	
Thr0_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v401 TEXT_VA=0x5f5000016000
attr_text {
	Name = .Thr0_User_Text_4v401 ,
	VA = 0x5f5000016000 ,/* 0x5f5000017fc0 */
	RA = 0x00b001c000 ,
	PA = 0x00b001c000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr0_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* ITTE_TAG_DATA = 00005f5000016000 80000000b001c080 */
	end_label   = Thr0_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v401_text_begin
Thr0_User_Text_4v401_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v004 TEXT_VA=0x5f5000180000
attr_text {
	Name = .Thr0_User_Text_4v004 ,
	VA = 0x5f5000180000 ,/* 0x5f5000181fc0 */
	RA = 0x00b0074000 ,
	PA = 0x0cb0074000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f5000181547 8000000cb0074080 */
	end_label   = Thr0_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v004_text_begin
Thr0_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v102 DATA_VA=0x610019000000
attr_data {
	Name = .Thr0_User_Data_4v102 ,
	VA = 0x610019000000 ,/* 0x6100193fffc0 */
	RA = 0x005e000000 ,
	PA = 0x085e000000 ,
	TTE_Context = 0x0fde ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 0000610019000fde 800000085e000443 */
	end_label   = Thr0_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v102_data_begin
Thr0_User_Data_4v102_data_begin:
Thr0_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v005 TEXT_VA=0x5f5000160000
attr_text {
	Name = .Thr0_User_Text_4v005 ,
	VA = 0x5f5000160000 ,/* 0x5f5000161fc0 */
	RA = 0x00b019e000 ,
	PA = 0x0cb019e000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f5000161547 8000000cb019e080 */
	end_label   = Thr0_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v005_text_begin
Thr0_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v103 DATA_VA=0x61002b400000
attr_data {
	Name = .Thr0_User_Data_4v103 ,
	VA = 0x61002b400000 ,/* 0x61002b7fffc0 */
	RA = 0x0059000000 ,
	PA = 0x0859000000 ,
	TTE_Context = 0x0fde ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 000061002b400fde 8000000859000443 */
	end_label   = Thr0_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v103_data_begin
Thr0_User_Data_4v103_data_begin:
Thr0_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v006 TEXT_VA=0x600000d50000
attr_text {
	Name = .Thr0_User_Text_4v006 ,
	VA = 0x600000d50000 ,/* 0x600000d5ffc0 */
	RA = 0x03c0ed0000 ,
	PA = 0x0fc0ed0000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000d50fde 8000000fc0ed0081 */
	end_label   = Thr0_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v006_text_begin
Thr0_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v104 DATA_VA=0x600000dd0000
attr_data {
	Name = .Thr0_User_Data_4v104 ,
	VA = 0x600000dd0000 ,/* 0x600000ddffc0 */
	RA = 0x03c0480000 ,
	PA = 0x0fc0480000 ,
	TTE_Context = 0x0fde ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 0000600000dd0fde 8000000fc0480441 */
	end_label   = Thr0_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v104_data_begin
Thr0_User_Data_4v104_data_begin:
Thr0_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v007 TEXT_VA=0x61002fc00000
attr_text {
	Name = .Thr0_User_Text_4v007 ,
	VA = 0x61002fc00000 ,/* 0x61002fffffc0 */
	RA = 0x005e800000 ,
	PA = 0x085e800000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 000061002fc00fde 800000085e800083 */
	end_label   = Thr0_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v007_text_begin
Thr0_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v105 DATA_VA=0x5f5000132000
attr_data {
	Name = .Thr0_User_Data_4v105 ,
	VA = 0x5f5000132000 ,/* 0x5f5000133fc0 */
	RA = 0x00b0164000 ,
	PA = 0x0cb0164000 ,
	TTE_Context = 0x0fde ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00005f5000133547 8000000cb0164440 */
	end_label   = Thr0_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v105_data_begin
Thr0_User_Data_4v105_data_begin:
Thr0_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v008 TEXT_VA=0x600000010000
attr_text {
	Name = .Thr0_User_Text_4v008 ,
	VA = 0x600000010000 ,/* 0x60000001ffc0 */
	RA = 0x03c0620000 ,
	PA = 0x0fc0620000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000600000010fde 8000000fc0620081 */
	end_label   = Thr0_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v008_text_begin
Thr0_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v106 DATA_VA=0x600000c50000
attr_data {
	Name = .Thr0_User_Data_4v106 ,
	VA = 0x600000c50000 ,/* 0x600000c5ffc0 */
	RA = 0x03c0920000 ,
	PA = 0x0fc0920000 ,
	TTE_Context = 0x0fde ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 0000600000c50fde 8000000fc0920441 */
	end_label   = Thr0_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v106_data_begin
Thr0_User_Data_4v106_data_begin:
Thr0_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v009 TEXT_VA=0x5f500016c000
attr_text {
	Name = .Thr0_User_Text_4v009 ,
	VA = 0x5f500016c000 ,/* 0x5f500016dfc0 */
	RA = 0x00b0132000 ,
	PA = 0x0cb0132000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f500016d547 8000000cb0132080 */
	end_label   = Thr0_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v009_text_begin
Thr0_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v107 DATA_VA=0x6208d0000000
attr_data {
	Name = .Thr0_User_Data_4v107 ,
	VA = 0x6208d0000000 ,/* 0x6208dfffffc0 */
	RA = 0x0150000000 ,
	PA = 0x0150000000 ,
	TTE_Context = 0x0fde ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00006208d0000fde 8000000150000445 */
	end_label   = Thr0_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v107_data_begin
Thr0_User_Data_4v107_data_begin:
Thr0_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00a TEXT_VA=0x5f50001a8000
attr_text {
	Name = .Thr0_User_Text_4v00a ,
	VA = 0x5f50001a8000 ,/* 0x5f50001a9fc0 */
	RA = 0x00b002e000 ,
	PA = 0x0cb002e000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f50001a9547 8000000cb002e080 */
	end_label   = Thr0_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00a_text_begin
Thr0_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v108 DATA_VA=0x5f500016e000
attr_data {
	Name = .Thr0_User_Data_4v108 ,
	VA = 0x5f500016e000 ,/* 0x5f500016ffc0 */
	RA = 0x00b0140000 ,
	PA = 0x0cb0140000 ,
	TTE_Context = 0x0fde ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00005f500016f547 8000000cb0140440 */
	end_label   = Thr0_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v108_data_begin
Thr0_User_Data_4v108_data_begin:
Thr0_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00b TEXT_VA=0x620500000000
attr_text {
	Name = .Thr0_User_Text_4v00b ,
	VA = 0x620500000000 ,/* 0x62050fffffc0 */
	RA = 0x02b0000000 ,
	PA = 0x02b0000000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000620500000fde 80000002b0000085 */
	end_label   = Thr0_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00b_text_begin
Thr0_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v109 DATA_VA=0x5f500018c000
attr_data {
	Name = .Thr0_User_Data_4v109 ,
	VA = 0x5f500018c000 ,/* 0x5f500018dfc0 */
	RA = 0x00b01c8000 ,
	PA = 0x0cb01c8000 ,
	TTE_Context = 0x0fde ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00005f500018d547 8000000cb01c8440 */
	end_label   = Thr0_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v109_data_begin
Thr0_User_Data_4v109_data_begin:
Thr0_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00c TEXT_VA=0x610026800000
attr_text {
	Name = .Thr0_User_Text_4v00c ,
	VA = 0x610026800000 ,/* 0x610026bfffc0 */
	RA = 0x005dc00000 ,
	PA = 0x085dc00000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 0000610026800fde 800000085dc00083 */
	end_label   = Thr0_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00c_text_begin
Thr0_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v10a DATA_VA=0x5f5000090000
attr_data {
	Name = .Thr0_User_Data_4v10a ,
	VA = 0x5f5000090000 ,/* 0x5f5000091fc0 */
	RA = 0x00b00b0000 ,
	PA = 0x0cb00b0000 ,
	TTE_Context = 0x0fde ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x080000 ,
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
	/* DTTE_TAG_DATA = 00005f5000091547 8000000cb00b0440 */
	end_label   = Thr0_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v10a_data_begin
Thr0_User_Data_4v10a_data_begin:
Thr0_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v00d TEXT_VA=0x5f5000026000
attr_text {
	Name = .Thr0_User_Text_4v00d ,
	VA = 0x5f5000026000 ,/* 0x5f5000027fc0 */
	RA = 0x00b0184000 ,
	PA = 0x0cb0184000 ,
	TTE_Context = 0x0fde ,/* TEXT_PRIMARY */
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
	/* ITTE_TAG_DATA = 00005f5000027547 8000000cb0184080 */
	end_label   = Thr0_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v00d_text_begin
Thr0_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr0_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x640000220000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	VA = 0x640000220000 ,/* 0x64000022ffc0 */
	RA = 0x03d04e0000 ,
	PA = 0x1fd04e0000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000640000221715 8000001fd04e0081 */
	end_label   = Thr1_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr1_user_code_entry
Thr1_user_code_entry:
	! %i0 = data primary, c
	! %i1 = data primary, nc
	! %i2 = data secondary, c
	! %i3 = data secondary, nc
	setx	Thr1_User_Data_4v100_data_begin, %l0, %i0
	setx	Thr1_User_Data_4v101_data_begin, %l0, %i1
	setx	Thr1_User_Data_4v200_data_begin, %l0, %i2
	setx	Thr1_User_Data_4v201_data_begin, %l0, %i3
.global Thr1_User_Text_4v000_text_begin
Thr1_User_Text_4v000_text_begin:
	ldda	[%i3] MMU_ASI_SECONDARY, %l2
	ldda	[%i2] MMU_ASI_SECONDARY, %l4	
	ldda	[%i3] MMU_ASI_SECONDARY_LITTLE, %l4		
	ldda	[%i0] MMU_ASI_PRIMARY_LITTLE, %l4		
	ldda	[%i1] MMU_ASI_PRIMARY_LITTLE, %l4		
	ldda	[%i1] MMU_ASI_BLK_INIT_ST_QUAD_LDD_PRIMARY, %l2			! nc
	ldda	[%i0] MMU_ASI_BLK_INIT_ST_QUAD_LDD_PRIMARY, %l2			! c
	ldda	[%i0] MMU_ASI_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE, %l4		! c
	ldda	[%i3] MMU_ASI_BLK_INIT_ST_QUAD_LDD_SECONDARY, %l2		! nc
	ldda	[%i2] MMU_ASI_BLK_INIT_ST_QUAD_LDD_SECONDARY, %l2		! c
	ldda	[%i2] MMU_ASI_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE, %l4	! c
	EXIT_GOOD
Thr1_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v100 DATA_VA=0x640000850000
attr_data {
	Name = .Thr1_User_Data_4v100 ,
	VA = 0x640000850000 ,/* 0x64000085ffc0 */
	RA = 0x03d0160000 ,
	PA = 0x1fd0160000 ,
	TTE_Context = 0x1715 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0d0000 ,
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
	/* DTTE_TAG_DATA = 0000640000851715 8000001fd0160041 */
	end_label   = Thr1_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v100_data_begin
Thr1_User_Data_4v100_data_begin:
	.xword	0x01010101
	.xword	0x02020202
	.xword	0x03030303
	.xword	0x04040404
Thr1_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v200 DATA_VA=0x6360000f4000
attr_data {
	Name = .Thr1_User_Data_4v200 ,
	VA = 0x6360000f4000 ,/* 0x6360000f5fc0 */
	RA = 0x00c01f6000 ,
	PA = 0x00c01f6000 ,
	TTE_Context = 0x173f ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1b0000 ,
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
	/* DTTE_TAG_DATA = 00006360000f573f 80000000c01f6040 */
	end_label   = Thr1_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v200_data_begin
Thr1_User_Data_4v200_data_begin:
	.xword	0xabcdef00
	.xword	0xaabbccdd
	.xword	0xddccaabb
	.xword	0xffeeaabb
Thr1_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v300 DATA_VA=0x65002a400000
attr_data {
	Name = .Thr1_User_Data_4v300 ,
	VA = 0x65002a400000 ,/* 0x65002a7fffc0 */
	RA = 0x006f400000 ,
	PA = 0x186f400000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_2 ,
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
	/* DTTE_TAG_DATA = 000065002a400000 800000186f400043 */
	end_label   = Thr1_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v300_data_begin
Thr1_User_Data_4v300_data_begin:
Thr1_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v001 TEXT_VA=0x636000118000
attr_text {
	Name = .Thr1_User_Text_4v001 ,
	VA = 0x636000118000 ,/* 0x636000119fc0 */
	RA = 0x00c0120000 ,
	PA = 0x00c0120000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 0000636000119715 80000000c0120080 */
	end_label   = Thr1_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v001_text_begin
Thr1_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v400 TEXT_VA=0x660410000000
attr_text {
	Name = .Thr1_User_Text_4v400 ,
	VA = 0x660410000000 ,/* 0x66041fffffc0 */
	RA = 0x0330000000 ,
	PA = 0x0330000000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr1_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x010000 ,
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
	/* ITTE_TAG_DATA = 0000660410000000 8000000330000485 */
	end_label   = Thr1_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v400_text_begin
Thr1_User_Text_4v400_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v002 TEXT_VA=0x6360001aa000
attr_text {
	Name = .Thr1_User_Text_4v002 ,
	VA = 0x6360001aa000 ,/* 0x6360001abfc0 */
	RA = 0x00c00c8000 ,
	PA = 0x00c00c8000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* ITTE_TAG_DATA = 00006360001ab715 80000000c00c8080 */
	end_label   = Thr1_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v002_text_begin
Thr1_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v101 DATA_VA=0x650005c00000
attr_data {
	Name = .Thr1_User_Data_4v101 ,
	VA = 0x650005c00000 ,/* 0x650005ffffc0 */
	RA = 0x006e400000 ,
	PA = 0x186e400000 ,
	TTE_Context = 0x1715 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
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
	/* DTTE_TAG_DATA = 0000650005c01022 800000186e400043 */
	end_label   = Thr1_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v101_data_begin
Thr1_User_Data_4v101_data_begin:
	.xword	0x0b0b0b0b
	.xword	0x0a0a0a0a
	.xword	0x09090909
	.xword	0x08080808
Thr1_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v201 DATA_VA=0x636000080000
attr_data {
	Name = .Thr1_User_Data_4v201 ,
	VA = 0x636000080000 ,/* 0x636000081fc0 */
	RA = 0x00c0158000 ,
	PA = 0x00c0158000 ,
	TTE_Context = 0x173f ,/* DATA_SECONDARY */
	thr1_nz_ctx_tsb_1 ,
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
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 000063600008173f 80000000c0158040 */
	end_label   = Thr1_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v201_data_begin
Thr1_User_Data_4v201_data_begin:
	.xword	0x0f0f0f0f
	.xword	0x0e0e0e0e
	.xword	0x0d0d0d0d
	.xword	0x0c0c0c0c
Thr1_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v301 DATA_VA=0x650038400000
attr_data {
	Name = .Thr1_User_Data_4v301 ,
	VA = 0x650038400000 ,/* 0x6500387fffc0 */
	RA = 0x0062000000 ,
	PA = 0x1862000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_2 ,
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
	/* DTTE_TAG_DATA = 0000650038400000 8000001862000043 */
	end_label   = Thr1_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v301_data_begin
Thr1_User_Data_4v301_data_begin:
Thr1_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v003 TEXT_VA=0x65003e400000
attr_text {
	Name = .Thr1_User_Text_4v003 ,
	VA = 0x65003e400000 ,/* 0x65003e7fffc0 */
	RA = 0x0069400000 ,
	PA = 0x1869400000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000065003e401022 8000001869400083 */
	end_label   = Thr1_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v003_text_begin
Thr1_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v401 TEXT_VA=0x640000e80000
attr_text {
	Name = .Thr1_User_Text_4v401 ,
	VA = 0x640000e80000 ,/* 0x640000e8ffc0 */
	RA = 0x03d0580000 ,
	PA = 0x03d0580000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr1_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x010000 ,
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
	/* ITTE_TAG_DATA = 0000640000e80000 80000003d0580481 */
	end_label   = Thr1_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v401_text_begin
Thr1_User_Text_4v401_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v004 TEXT_VA=0x650031000000
attr_text {
	Name = .Thr1_User_Text_4v004 ,
	VA = 0x650031000000 ,/* 0x6500313fffc0 */
	RA = 0x0068400000 ,
	PA = 0x1868400000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* ITTE_TAG_DATA = 0000650031001022 8000001868400083 */
	end_label   = Thr1_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v004_text_begin
Thr1_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v102 DATA_VA=0x636000198000
attr_data {
	Name = .Thr1_User_Data_4v102 ,
	VA = 0x636000198000 ,/* 0x636000199fc0 */
	RA = 0x00c00ae000 ,
	PA = 0x00c00ae000 ,
	TTE_Context = 0x1715 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_1 ,
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
	/* DTTE_TAG_DATA = 0000636000199715 80000000c00ae040 */
	end_label   = Thr1_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v102_data_begin
Thr1_User_Data_4v102_data_begin:
Thr1_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v302 DATA_VA=0x640000f30000
attr_data {
	Name = .Thr1_User_Data_4v302 ,
	VA = 0x640000f30000 ,/* 0x640000f3ffc0 */
	RA = 0x03d05a0000 ,
	PA = 0x03d05a0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_1 ,
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
	/* DTTE_TAG_DATA = 0000640000f30000 80000003d05a0041 */
	end_label   = Thr1_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v302_data_begin
Thr1_User_Data_4v302_data_begin:
Thr1_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v005 TEXT_VA=0x640000f80000
attr_text {
	Name = .Thr1_User_Text_4v005 ,
	VA = 0x640000f80000 ,/* 0x640000f8ffc0 */
	RA = 0x03d0a00000 ,
	PA = 0x1fd0a00000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000640000f81715 8000001fd0a00081 */
	end_label   = Thr1_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v005_text_begin
Thr1_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v006 TEXT_VA=0x640000150000
attr_text {
	Name = .Thr1_User_Text_4v006 ,
	VA = 0x640000150000 ,/* 0x64000015ffc0 */
	RA = 0x03d0c90000 ,
	PA = 0x1fd0c90000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* ITTE_TAG_DATA = 0000640000151715 8000001fd0c90081 */
	end_label   = Thr1_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v006_text_begin
Thr1_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v103 DATA_VA=0x640000980000
attr_data {
	Name = .Thr1_User_Data_4v103 ,
	VA = 0x640000980000 ,/* 0x64000098ffc0 */
	RA = 0x03d0880000 ,
	PA = 0x1fd0880000 ,
	TTE_Context = 0x1715 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
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
	/* DTTE_TAG_DATA = 0000640000981715 8000001fd0880041 */
	end_label   = Thr1_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v103_data_begin
Thr1_User_Data_4v103_data_begin:
Thr1_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v303 DATA_VA=0x660060000000
attr_data {
	Name = .Thr1_User_Data_4v303 ,
	VA = 0x660060000000 ,/* 0x66006fffffc0 */
	RA = 0x0170000000 ,
	PA = 0x0170000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr1_z_ctx_tsb_3 ,
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
	/* DTTE_TAG_DATA = 0000660060000000 8000000170000045 */
	end_label   = Thr1_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v303_data_begin
Thr1_User_Data_4v303_data_begin:
Thr1_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v007 TEXT_VA=0x63600006e000
attr_text {
	Name = .Thr1_User_Text_4v007 ,
	VA = 0x63600006e000 ,/* 0x63600006ffc0 */
	RA = 0x00c01b6000 ,
	PA = 0x00c01b6000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 000063600006f715 80000000c01b6080 */
	end_label   = Thr1_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v007_text_begin
Thr1_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v104 DATA_VA=0x640000360000
attr_data {
	Name = .Thr1_User_Data_4v104 ,
	VA = 0x640000360000 ,/* 0x64000036ffc0 */
	RA = 0x03d05b0000 ,
	PA = 0x1fd05b0000 ,
	TTE_Context = 0x1715 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
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
	/* DTTE_TAG_DATA = 0000640000361715 8000001fd05b0041 */
	end_label   = Thr1_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v104_data_begin
Thr1_User_Data_4v104_data_begin:
Thr1_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v008 TEXT_VA=0x6360001a4000
attr_text {
	Name = .Thr1_User_Text_4v008 ,
	VA = 0x6360001a4000 ,/* 0x6360001a5fc0 */
	RA = 0x00c0028000 ,
	PA = 0x00c0028000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00006360001a5715 80000000c0028080 */
	end_label   = Thr1_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v008_text_begin
Thr1_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v105 DATA_VA=0x640000200000
attr_data {
	Name = .Thr1_User_Data_4v105 ,
	VA = 0x640000200000 ,/* 0x64000020ffc0 */
	RA = 0x03d0630000 ,
	PA = 0x1fd0630000 ,
	TTE_Context = 0x1715 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
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
	/* DTTE_TAG_DATA = 0000640000201715 8000001fd0630041 */
	end_label   = Thr1_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v105_data_begin
Thr1_User_Data_4v105_data_begin:
Thr1_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v009 TEXT_VA=0x63600009a000
attr_text {
	Name = .Thr1_User_Text_4v009 ,
	VA = 0x63600009a000 ,/* 0x63600009bfc0 */
	RA = 0x00c0134000 ,
	PA = 0x00c0134000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 000063600009b715 80000000c0134080 */
	end_label   = Thr1_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v009_text_begin
Thr1_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v106 DATA_VA=0x650015400000
attr_data {
	Name = .Thr1_User_Data_4v106 ,
	VA = 0x650015400000 ,/* 0x6500157fffc0 */
	RA = 0x006ec00000 ,
	PA = 0x186ec00000 ,
	TTE_Context = 0x1715 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_3 ,
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
	/* DTTE_TAG_DATA = 0000650015401022 800000186ec00043 */
	end_label   = Thr1_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v106_data_begin
Thr1_User_Data_4v106_data_begin:
Thr1_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00a TEXT_VA=0x63600019c000
attr_text {
	Name = .Thr1_User_Text_4v00a ,
	VA = 0x63600019c000 ,/* 0x63600019dfc0 */
	RA = 0x00c007e000 ,
	PA = 0x00c007e000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 000063600019d715 80000000c007e080 */
	end_label   = Thr1_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v00a_text_begin
Thr1_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v107 DATA_VA=0x640000c00000
attr_data {
	Name = .Thr1_User_Data_4v107 ,
	VA = 0x640000c00000 ,/* 0x640000c0ffc0 */
	RA = 0x03d0120000 ,
	PA = 0x1fd0120000 ,
	TTE_Context = 0x1715 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
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
	/* DTTE_TAG_DATA = 0000640000c01715 8000001fd0120041 */
	end_label   = Thr1_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v107_data_begin
Thr1_User_Data_4v107_data_begin:
Thr1_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00b TEXT_VA=0x640000f40000
attr_text {
	Name = .Thr1_User_Text_4v00b ,
	VA = 0x640000f40000 ,/* 0x640000f4ffc0 */
	RA = 0x03d0320000 ,
	PA = 0x1fd0320000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000640000f41715 8000001fd0320081 */
	end_label   = Thr1_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v00b_text_begin
Thr1_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v108 DATA_VA=0x640000930000
attr_data {
	Name = .Thr1_User_Data_4v108 ,
	VA = 0x640000930000 ,/* 0x64000093ffc0 */
	RA = 0x03d0130000 ,
	PA = 0x1fd0130000 ,
	TTE_Context = 0x1715 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
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
	/* DTTE_TAG_DATA = 0000640000931715 8000001fd0130041 */
	end_label   = Thr1_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v108_data_begin
Thr1_User_Data_4v108_data_begin:
Thr1_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00c TEXT_VA=0x6400000b0000
attr_text {
	Name = .Thr1_User_Text_4v00c ,
	VA = 0x6400000b0000 ,/* 0x6400000bffc0 */
	RA = 0x03d0d90000 ,
	PA = 0x1fd0d90000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006400000b1715 8000001fd0d90081 */
	end_label   = Thr1_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v00c_text_begin
Thr1_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr1_User_Data_4v109 DATA_VA=0x6400007a0000
attr_data {
	Name = .Thr1_User_Data_4v109 ,
	VA = 0x6400007a0000 ,/* 0x6400007affc0 */
	RA = 0x03d05d0000 ,
	PA = 0x1fd05d0000 ,
	TTE_Context = 0x1715 ,/* DATA_PRIMARY */
	thr1_nz_ctx_tsb_2 ,
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
	/* DTTE_TAG_DATA = 00006400007a1715 8000001fd05d0041 */
	end_label   = Thr1_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr1_User_Data_4v109_data_begin
Thr1_User_Data_4v109_data_begin:
Thr1_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00d TEXT_VA=0x636000008000
attr_text {
	Name = .Thr1_User_Text_4v00d ,
	VA = 0x636000008000 ,/* 0x636000009fc0 */
	RA = 0x00c00aa000 ,
	PA = 0x00c00aa000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 0000636000009715 80000000c00aa080 */
	end_label   = Thr1_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v00d_text_begin
Thr1_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v00e TEXT_VA=0x636000128000
attr_text {
	Name = .Thr1_User_Text_4v00e ,
	VA = 0x636000128000 ,/* 0x636000129fc0 */
	RA = 0x00c0092000 ,
	PA = 0x00c0092000 ,
	TTE_Context = 0x1715 ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 0000636000129715 80000000c0092080 */
	end_label   = Thr1_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr1_User_Text_4v00e_text_begin
Thr1_User_Text_4v00e_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x680000a00000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	VA = 0x680000a00000 ,/* 0x680000a0ffc0 */
	RA = 0x03e0590000 ,
	PA = 0x03e0590000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000680000a00eeb 80000003e0590481 */
	end_label   = Thr2_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr2_user_code_entry
Thr2_user_code_entry:
	setx	Thr2_User_Text_4v001_text_begin, %l0, %l1
	jmp	%l1
	nop
.global Thr2_User_Text_4v000_text_begin
Thr2_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v100 DATA_VA=0x6a0f30000000
attr_data {
	Name = .Thr2_User_Data_4v100 ,
	VA = 0x6a0f30000000 ,/* 0x6a0f3fffffc0 */
	RA = 0x0340000000 ,
	PA = 0x2f40000000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00006a0f30000eeb 8000002f40000045 */
	end_label   = Thr2_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v100_data_begin
Thr2_User_Data_4v100_data_begin:
Thr2_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v200 DATA_VA=0x6770000ce000
attr_data {
	Name = .Thr2_User_Data_4v200 ,
	VA = 0x6770000ce000 ,/* 0x6770000cffc0 */
	RA = 0x00d016a000 ,
	PA = 0x00d016a000 ,
	TTE_Context = 0x015e ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_3 ,
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
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00006770000ce15e 80000000d016a440 */
	end_label   = Thr2_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v200_data_begin
Thr2_User_Data_4v200_data_begin:
Thr2_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v300 DATA_VA=0x690035800000
attr_data {
	Name = .Thr2_User_Data_4v300 ,
	VA = 0x690035800000 ,/* 0x690035bfffc0 */
	RA = 0x007d800000 ,
	PA = 0x007d800000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 0000690035800000 800000007d800443 */
	end_label   = Thr2_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v300_data_begin
Thr2_User_Data_4v300_data_begin:
Thr2_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v001 TEXT_VA=0x677000050000
attr_text {
	Name = .Thr2_User_Text_4v001 ,
	VA = 0x677000050000 ,/* 0x677000051fc0 */
	RA = 0x00d0106000 ,
	PA = 0x00d0106000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 1 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x180000 ,
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
	/* ITTE_TAG_DATA = 0000677000050eeb 80000000d0106480 */
	end_label   = Thr2_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v001_text_begin
Thr2_User_Text_4v001_text_begin:
	EXIT_BAD
Thr2_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v400 TEXT_VA=0x680000750000
attr_text {
	Name = .Thr2_User_Text_4v400 ,
	VA = 0x680000750000 ,/* 0x68000075ffc0 */
	RA = 0x03e0c80000 ,
	PA = 0x03e0c80000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr2_z_ctx_tsb_3 ,
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
	/* ITTE_TAG_DATA = 0000680000750000 80000003e0c80481 */
	end_label   = Thr2_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v400_text_begin
Thr2_User_Text_4v400_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v002 TEXT_VA=0x6a0070000000
attr_text {
	Name = .Thr2_User_Text_4v002 ,
	VA = 0x6a0070000000 ,/* 0x6a007fffffc0 */
	RA = 0x0180000000 ,
	PA = 0x2d80000000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x180000 ,
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
	/* ITTE_TAG_DATA = 00006a0070000eeb 8000002d80000485 */
	end_label   = Thr2_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v002_text_begin
Thr2_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v101 DATA_VA=0x690022c00000
attr_data {
	Name = .Thr2_User_Data_4v101 ,
	VA = 0x690022c00000 ,/* 0x690022ffffc0 */
	RA = 0x0076c00000 ,
	PA = 0x2876c00000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000690022c00eeb 8000002876c00043 */
	end_label   = Thr2_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v101_data_begin
Thr2_User_Data_4v101_data_begin:
Thr2_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v201 DATA_VA=0x67700014a000
attr_data {
	Name = .Thr2_User_Data_4v201 ,
	VA = 0x67700014a000 ,/* 0x67700014bfc0 */
	RA = 0x00d017a000 ,
	PA = 0x00d017a000 ,
	TTE_Context = 0x015e ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_3 ,
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
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 000067700014a15e 80000000d017a440 */
	end_label   = Thr2_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v201_data_begin
Thr2_User_Data_4v201_data_begin:
Thr2_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v301 DATA_VA=0x677000116000
attr_data {
	Name = .Thr2_User_Data_4v301 ,
	VA = 0x677000116000 ,/* 0x677000117fc0 */
	RA = 0x00d00ba000 ,
	PA = 0x00d00ba000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr2_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1f0000 ,
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
	/* DTTE_TAG_DATA = 0000677000116000 80000000d00ba440 */
	end_label   = Thr2_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v301_data_begin
Thr2_User_Data_4v301_data_begin:
Thr2_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v003 TEXT_VA=0x680000390000
attr_text {
	Name = .Thr2_User_Text_4v003 ,
	VA = 0x680000390000 ,/* 0x68000039ffc0 */
	RA = 0x03e04f0000 ,
	PA = 0x03e04f0000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000680000390eeb 80000003e04f0481 */
	end_label   = Thr2_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v003_text_begin
Thr2_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v401 TEXT_VA=0x680000de0000
attr_text {
	Name = .Thr2_User_Text_4v401 ,
	VA = 0x680000de0000 ,/* 0x680000deffc0 */
	RA = 0x03e0780000 ,
	PA = 0x03e0780000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr2_z_ctx_tsb_3 ,
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
	/* ITTE_TAG_DATA = 0000680000de0000 80000003e0780481 */
	end_label   = Thr2_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v401_text_begin
Thr2_User_Text_4v401_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v004 TEXT_VA=0x680000bc0000
attr_text {
	Name = .Thr2_User_Text_4v004 ,
	VA = 0x680000bc0000 ,/* 0x680000bcffc0 */
	RA = 0x03e0540000 ,
	PA = 0x03e0540000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x180000 ,
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
	/* ITTE_TAG_DATA = 0000680000bc0eeb 80000003e0540481 */
	end_label   = Thr2_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v004_text_begin
Thr2_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v102 DATA_VA=0x6770000f0000
attr_data {
	Name = .Thr2_User_Data_4v102 ,
	VA = 0x6770000f0000 ,/* 0x6770000f1fc0 */
	RA = 0x00d0008000 ,
	PA = 0x00d0008000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00006770000f0eeb 80000000d0008040 */
	end_label   = Thr2_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v102_data_begin
Thr2_User_Data_4v102_data_begin:
Thr2_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v202 DATA_VA=0x69001d000000
attr_data {
	Name = .Thr2_User_Data_4v202 ,
	VA = 0x69001d000000 ,/* 0x69001d3fffc0 */
	RA = 0x0074800000 ,
	PA = 0x2874800000 ,
	TTE_Context = 0x015e ,/* DATA_SECONDARY */
	thr2_nz_ctx_tsb_1 ,
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
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 000069001d00015e 8000002874800443 */
	end_label   = Thr2_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v202_data_begin
Thr2_User_Data_4v202_data_begin:
Thr2_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v005 TEXT_VA=0x6a0510000000
attr_text {
	Name = .Thr2_User_Text_4v005 ,
	VA = 0x6a0510000000 ,/* 0x6a051fffffc0 */
	RA = 0x0300000000 ,
	PA = 0x2f00000000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 5 ,
	/* ITTE_TAG_DATA = 00006a0510000eeb 8000002f00000485 */
	end_label   = Thr2_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v005_text_begin
Thr2_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v006 TEXT_VA=0x690015800000
attr_text {
	Name = .Thr2_User_Text_4v006 ,
	VA = 0x690015800000 ,/* 0x690015bfffc0 */
	RA = 0x007f800000 ,
	PA = 0x287f800000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x180000 ,
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
	/* ITTE_TAG_DATA = 0000690015800eeb 800000287f800483 */
	end_label   = Thr2_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v006_text_begin
Thr2_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v103 DATA_VA=0x680000be0000
attr_data {
	Name = .Thr2_User_Data_4v103 ,
	VA = 0x680000be0000 ,/* 0x680000beffc0 */
	RA = 0x03e05e0000 ,
	PA = 0x03e05e0000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000680000be0eeb 80000003e05e0041 */
	end_label   = Thr2_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v103_data_begin
Thr2_User_Data_4v103_data_begin:
Thr2_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v007 TEXT_VA=0x680000710000
attr_text {
	Name = .Thr2_User_Text_4v007 ,
	VA = 0x680000710000 ,/* 0x68000071ffc0 */
	RA = 0x03e0890000 ,
	PA = 0x03e0890000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000680000710eeb 80000003e0890481 */
	end_label   = Thr2_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v007_text_begin
Thr2_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v008 TEXT_VA=0x67700017c000
attr_text {
	Name = .Thr2_User_Text_4v008 ,
	VA = 0x67700017c000 ,/* 0x67700017dfc0 */
	RA = 0x00d00e4000 ,
	PA = 0x00d00e4000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x180000 ,
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
	/* ITTE_TAG_DATA = 000067700017ceeb 80000000d00e4480 */
	end_label   = Thr2_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v008_text_begin
Thr2_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v104 DATA_VA=0x677000138000
attr_data {
	Name = .Thr2_User_Data_4v104 ,
	VA = 0x677000138000 ,/* 0x677000139fc0 */
	RA = 0x00d003c000 ,
	PA = 0x00d003c000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000677000138eeb 80000000d003c040 */
	end_label   = Thr2_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v104_data_begin
Thr2_User_Data_4v104_data_begin:
Thr2_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v009 TEXT_VA=0x69000e800000
attr_text {
	Name = .Thr2_User_Text_4v009 ,
	VA = 0x69000e800000 ,/* 0x69000ebfffc0 */
	RA = 0x0074000000 ,
	PA = 0x2874000000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000069000e800eeb 8000002874000483 */
	end_label   = Thr2_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v009_text_begin
Thr2_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v105 DATA_VA=0x6a0f00000000
attr_data {
	Name = .Thr2_User_Data_4v105 ,
	VA = 0x6a0f00000000 ,/* 0x6a0f0fffffc0 */
	RA = 0x01a0000000 ,
	PA = 0x2da0000000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00006a0f00000eeb 8000002da0000045 */
	end_label   = Thr2_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v105_data_begin
Thr2_User_Data_4v105_data_begin:
Thr2_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00a TEXT_VA=0x680000230000
attr_text {
	Name = .Thr2_User_Text_4v00a ,
	VA = 0x680000230000 ,/* 0x68000023ffc0 */
	RA = 0x03e0f20000 ,
	PA = 0x03e0f20000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 0000680000230eeb 80000003e0f20481 */
	end_label   = Thr2_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00a_text_begin
Thr2_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v106 DATA_VA=0x69003b800000
attr_data {
	Name = .Thr2_User_Data_4v106 ,
	VA = 0x69003b800000 ,/* 0x69003bbfffc0 */
	RA = 0x007a000000 ,
	PA = 0x287a000000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 000069003b800eeb 800000287a000043 */
	end_label   = Thr2_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v106_data_begin
Thr2_User_Data_4v106_data_begin:
Thr2_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00b TEXT_VA=0x6800009c0000
attr_text {
	Name = .Thr2_User_Text_4v00b ,
	VA = 0x6800009c0000 ,/* 0x6800009cffc0 */
	RA = 0x03e0ca0000 ,
	PA = 0x03e0ca0000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006800009c0eeb 80000003e0ca0481 */
	end_label   = Thr2_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00b_text_begin
Thr2_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v107 DATA_VA=0x680000640000
attr_data {
	Name = .Thr2_User_Data_4v107 ,
	VA = 0x680000640000 ,/* 0x68000064ffc0 */
	RA = 0x03e0a30000 ,
	PA = 0x03e0a30000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000680000640eeb 80000003e0a30041 */
	end_label   = Thr2_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v107_data_begin
Thr2_User_Data_4v107_data_begin:
Thr2_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00c TEXT_VA=0x690000000000
attr_text {
	Name = .Thr2_User_Text_4v00c ,
	VA = 0x690000000000 ,/* 0x6900003fffc0 */
	RA = 0x0079800000 ,
	PA = 0x2879800000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 0000690000000eeb 8000002879800483 */
	end_label   = Thr2_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00c_text_begin
Thr2_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v108 DATA_VA=0x677000038000
attr_data {
	Name = .Thr2_User_Data_4v108 ,
	VA = 0x677000038000 ,/* 0x677000039fc0 */
	RA = 0x00d01b8000 ,
	PA = 0x00d01b8000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000677000038eeb 80000000d01b8040 */
	end_label   = Thr2_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v108_data_begin
Thr2_User_Data_4v108_data_begin:
Thr2_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00d TEXT_VA=0x67700004c000
attr_text {
	Name = .Thr2_User_Text_4v00d ,
	VA = 0x67700004c000 ,/* 0x67700004dfc0 */
	RA = 0x00d019a000 ,
	PA = 0x00d019a000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 000067700004ceeb 80000000d019a480 */
	end_label   = Thr2_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00d_text_begin
Thr2_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v109 DATA_VA=0x677000012000
attr_data {
	Name = .Thr2_User_Data_4v109 ,
	VA = 0x677000012000 ,/* 0x677000013fc0 */
	RA = 0x00d0146000 ,
	PA = 0x00d0146000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000677000012eeb 80000000d0146040 */
	end_label   = Thr2_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v109_data_begin
Thr2_User_Data_4v109_data_begin:
Thr2_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v00e TEXT_VA=0x6800007d0000
attr_text {
	Name = .Thr2_User_Text_4v00e ,
	VA = 0x6800007d0000 ,/* 0x6800007dffc0 */
	RA = 0x03e0cb0000 ,
	PA = 0x03e0cb0000 ,
	TTE_Context = 0x0eeb ,/* TEXT_PRIMARY */
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
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 0 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00006800007d0eeb 80000003e0cb0481 */
	end_label   = Thr2_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr2_User_Text_4v00e_text_begin
Thr2_User_Text_4v00e_text_begin:
	EXIT_GOOD
Thr2_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10a DATA_VA=0x6770001fa000
attr_data {
	Name = .Thr2_User_Data_4v10a ,
	VA = 0x6770001fa000 ,/* 0x6770001fbfc0 */
	RA = 0x00d0064000 ,
	PA = 0x00d0064000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00006770001faeeb 80000000d0064040 */
	end_label   = Thr2_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10a_data_begin
Thr2_User_Data_4v10a_data_begin:
Thr2_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10b DATA_VA=0x680000fc0000
attr_data {
	Name = .Thr2_User_Data_4v10b ,
	VA = 0x680000fc0000 ,/* 0x680000fcffc0 */
	RA = 0x03e0e00000 ,
	PA = 0x03e0e00000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000680000fc0eeb 80000003e0e00041 */
	end_label   = Thr2_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10b_data_begin
Thr2_User_Data_4v10b_data_begin:
Thr2_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr2_User_Data_4v10c DATA_VA=0x67700003c000
attr_data {
	Name = .Thr2_User_Data_4v10c ,
	VA = 0x67700003c000 ,/* 0x67700003dfc0 */
	RA = 0x00d004c000 ,
	PA = 0x00d004c000 ,
	TTE_Context = 0x0eeb ,/* DATA_PRIMARY */
	thr2_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 000067700003ceeb 80000000d004c040 */
	end_label   = Thr2_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr2_User_Data_4v10c_data_begin
Thr2_User_Data_4v10c_data_begin:
Thr2_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x6c00003d0000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	VA = 0x6c00003d0000 ,/* 0x6c00003dffc0 */
	RA = 0x03f07f0000 ,
	PA = 0x3ff07f0000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006c00003d0456 8000003ff07f0481 */
	end_label   = Thr3_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr3_user_code_entry
Thr3_user_code_entry:
	setx	Thr3_User_Data_4v100_data_begin, %l0, %i0	! p, c
	setx	Thr3_User_Data_4v200_data_begin, %l0, %i1	! s, c
	setx	Thr3_User_Data_4v101_data_begin, %l0, %i2	! p, nc
	setx	Thr3_User_Data_4v201_data_begin, %l0, %i3	! s, nc
	setx	Thr3_User_Text_4v002_text_begin, %l0, %i7
	GOTO_SUPERVISOR0
.global Thr3_User_Text_4v000_text_begin
Thr3_User_Text_4v000_text_begin:
	EXIT_BAD
Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v100 DATA_VA=0x6b800004e000
attr_data {
	Name = .Thr3_User_Data_4v100 ,
	VA = 0x6b800004e000 ,/* 0x6b800004ffc0 */
	RA = 0x00e012c000 ,
	PA = 0x00e012c000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006b800004e456 80000000e012c440 */
	end_label   = Thr3_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v100_data_begin
Thr3_User_Data_4v100_data_begin:
	.xword	0x20212223
	.xword	0x24252627
	.xword	0x28292a2b
	.xword	0x2c2d2e2f
Thr3_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v200 DATA_VA=0x6d001c800000
attr_data {
	Name = .Thr3_User_Data_4v200 ,
	VA = 0x6d001c800000 ,/* 0x6d001cbfffc0 */
	RA = 0x008a800000 ,
	PA = 0x008a800000 ,
	TTE_Context = 0x085d ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0f0000 ,
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
	/* DTTE_TAG_DATA = 00006d001c80085d 800000008a800043 */
	end_label   = Thr3_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v200_data_begin
Thr3_User_Data_4v200_data_begin:
	.xword	0x30313233
	.xword	0x34353637
	.xword	0x38393a3b
	.xword	0x3c3d3e3f
Thr3_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v300 DATA_VA=0x6b800000c000
attr_data {
	Name = .Thr3_User_Data_4v300 ,
	VA = 0x6b800000c000 ,/* 0x6b800000dfc0 */
	RA = 0x00e0174000 ,
	PA = 0x00e0174000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* DTTE_TAG_DATA = 00006b800000c000 80000000e0174440 */
	end_label   = Thr3_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v300_data_begin
Thr3_User_Data_4v300_data_begin:
	.xword	0x30313233
	.xword	0x34353637
	.xword	0x38393a3b
	.xword	0x3c3d3e3f
Thr3_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v001 TEXT_VA=0x6b80001de000
attr_text {
	Name = .Thr3_User_Text_4v001 ,
	VA = 0x6b80001de000 ,/* 0x6b80001dffc0 */
	RA = 0x00e009c000 ,
	PA = 0x00e009c000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006b80001de456 80000000e009c480 */
	end_label   = Thr3_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v001_text_begin
Thr3_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v400 TEXT_VA=0x6b80001e8000
attr_text {
	Name = .Thr3_User_Text_4v400 ,
	VA = 0x6b80001e8000 ,/* 0x6b80001e9fc0 */
	RA = 0x00e0104000 ,
	PA = 0x00e0104000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x130000 ,
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
	/* ITTE_TAG_DATA = 00006b80001e8000 80000000e0104080 */
	end_label   = Thr3_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v400_text_begin
Thr3_User_Text_4v400_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v002 TEXT_VA=0x6d0016400000
attr_text {
	Name = .Thr3_User_Text_4v002 ,
	VA = 0x6d0016400000 ,/* 0x6d00167fffc0 */
	RA = 0x0081400000 ,
	PA = 0x0081400000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 00006d0016400456 8000000081400483 */
	end_label   = Thr3_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v002_text_begin
Thr3_User_Text_4v002_text_begin:
	ldxa	[%i2] MMU_ASI_AS_IF_USER_PRIMARY, %g1
	ldxa	[%i0] MMU_ASI_AS_IF_USER_PRIMARY, %g1
	ldxa	[%i0] MMU_ASI_AS_IF_USER_PRIMARY_LITTLE, %g1
	ldxa	[%i3] MMU_ASI_AS_IF_USER_SECONDARY, %g2
	ldxa	[%i1] MMU_ASI_AS_IF_USER_SECONDARY, %g2
	ldxa	[%i1] MMU_ASI_AS_IF_USER_SECONDARY_LITTLE, %g2
	setx	Thr3_User_Data_4v102_data_begin, %l0, %i4
	stxa	%g2, [%i2] MMU_ASI_REAL_MEM
	stxa	%g2, [%i0] MMU_ASI_REAL_MEM
	ldxa	[%i0] MMU_ASI_REAL_MEM_LITTLE, %g3
	stxa	%g2, [%i4] MMU_ASI_REAL_IO
	ldxa	[%i4] MMU_ASI_REAL_IO_LITTLE, %g3

	ldda	[%i2] MMU_ASI_BLOCK_AS_IF_USER_PRIMARY, %f0
	ldda	[%i0] MMU_ASI_BLOCK_AS_IF_USER_PRIMARY, %f0
	ldda	[%i0] MMU_ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE, %f16
	ldda	[%i3] MMU_ASI_BLOCK_AS_IF_USER_SECONDARY, %f0
	ldda	[%i1] MMU_ASI_BLOCK_AS_IF_USER_SECONDARY, %f0
	ldda	[%i1] MMU_ASI_BLOCK_AS_IF_USER_SECONDARY_LITTLE, %f16

	stda	%g2, [%i2] MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY
	stda	%g2, [%i0] MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY
	stda	%g2, [%i2] MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_PRIMARY_LITTLE
	stda	%g2, [%i3] MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY
	stda	%g2, [%i1] MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY
	stda	%g2, [%i3] MMU_ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_SECONDARY_LITTLE

	setx	Thr3_User_Text_4v003_text_begin, %l0, %i7
	RETURN_FROM_SUPERVISOR0
	EXIT_BAD
Thr3_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v101 DATA_VA=0x6b800002c000
attr_data {
	Name = .Thr3_User_Data_4v101 ,
	VA = 0x6b800002c000 ,/* 0x6b800002dfc0 */
	RA = 0x00e0078000 ,
	PA = 0x00e0078000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006b800002c456 80000000e0078440 */
	end_label   = Thr3_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v101_data_begin
Thr3_User_Data_4v101_data_begin:
	.xword	0x40414443
	.xword	0x44454647
	.xword	0x48494a4b
	.xword	0x4c4d4e2f
Thr3_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v201 DATA_VA=0x6d0029400000
attr_data {
	Name = .Thr3_User_Data_4v201 ,
	VA = 0x6d0029400000 ,/* 0x6d00297fffc0 */
	RA = 0x0089c00000 ,
	PA = 0x0089c00000 ,
	TTE_Context = 0x085d ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_2 ,
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
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 00006d002940085d 8000000089c00043 */
	end_label   = Thr3_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v201_data_begin
Thr3_User_Data_4v201_data_begin:
	.xword	0x50515553
	.xword	0x54555657
	.xword	0x58595a5b
	.xword	0x5c5d5e5f
Thr3_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v301 DATA_VA=0x6c0000700000
attr_data {
	Name = .Thr3_User_Data_4v301 ,
	VA = 0x6c0000700000 ,/* 0x6c000070ffc0 */
	RA = 0x03f0740000 ,
	PA = 0x3ff0740000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr3_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* DTTE_TAG_DATA = 00006c0000700000 8000003ff0740441 */
	end_label   = Thr3_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v301_data_begin
Thr3_User_Data_4v301_data_begin:
	.xword	0x50515553
	.xword	0x54555657
	.xword	0x58595a5b
	.xword	0x5c5d5e5f
Thr3_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v003 TEXT_VA=0x6b80001c2000
attr_text {
	Name = .Thr3_User_Text_4v003 ,
	VA = 0x6b80001c2000 ,/* 0x6b80001c3fc0 */
	RA = 0x00e0010000 ,
	PA = 0x00e0010000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006b80001c2456 80000000e0010480 */
	end_label   = Thr3_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v003_text_begin
Thr3_User_Text_4v003_text_begin:
	setx	Thr3_User_Text_4v401_text_begin, %l0, %i7
	GOTO_SUPERVISOR1
	EXIT_BAD
.align	256
	nop
	EXIT_GOOD
Thr3_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v401 TEXT_VA=0x6b800006a000
attr_text {
	Name = .Thr3_User_Text_4v401 ,
	VA = 0x6b800006a000 ,/* 0x6b800006bfc0 */
	RA = 0x00e00f8000 ,
	PA = 0x00e00f8000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x130000 ,
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
	/* ITTE_TAG_DATA = 00006b800006a000 80000000e00f8080 */
	end_label   = Thr3_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v401_text_begin
Thr3_User_Text_4v401_text_begin:
	setx	Thr3_User_Data_4v300_data_begin, %l0, %i4
	setx	Thr3_User_Data_4v301_data_begin, %l0, %i5
	ldda	[%i4] MMU_ASI_QUAD_LDD, %g4
	ldda	[%i5] MMU_ASI_QUAD_LDD, %g4
	ldda	[%i5] MMU_ASI_QUAD_LDD_LITTLE, %g4
	ldda	[%i5] MMU_ASI_QUAD_LDD_REAL, %g4
	ldda	[%i4] MMU_ASI_QUAD_LDD_REAL, %g4
	ldda	[%i5] MMU_ASI_QUAD_LDD_REAL_LITTLE, %g4

	ldda	[%i5] MMU_ASI_NUCLEUS_BLK_INIT_ST_QUAD_LDD, %g6
	ldda	[%i4] MMU_ASI_NUCLEUS_BLK_INIT_ST_QUAD_LDD, %g6
	ldda	[%i5] MMU_ASI_NUCLEUS_BLK_INIT_ST_QUAD_LDD_LITTLE, %g6
	
	setx	Thr3_User_Text_4v003_text_begin, %l0, %i7
	add	%i7, 256, %i7
	RETURN_FROM_SUPERVISOR1
	EXIT_BAD
Thr3_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v004 TEXT_VA=0x6d001ac00000
attr_text {
	Name = .Thr3_User_Text_4v004 ,
	VA = 0x6d001ac00000 ,/* 0x6d001affffc0 */
	RA = 0x0084400000 ,
	PA = 0x0084400000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 00006d001ac00456 8000000084400483 */
	end_label   = Thr3_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v004_text_begin
Thr3_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v102 DATA_VA=0x6b80001d6000
attr_data {
	Name = .Thr3_User_Data_4v102 ,
	VA = 0x6b80001d6000 ,/* 0x6b80001d7fc0 */
	RA = 0x00e018a000 ,
	PA = 0x00e018a000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006b80001d6456 80000000e018a440 */
	end_label   = Thr3_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v102_data_begin
Thr3_User_Data_4v102_data_begin:
	.xword	0x50515553
	.xword	0x54555657
	.xword	0x58595a5b
	.xword	0x5c5d5e5f
Thr3_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v202 DATA_VA=0x6b80001e4000
attr_data {
	Name = .Thr3_User_Data_4v202 ,
	VA = 0x6b80001e4000 ,/* 0x6b80001e5fc0 */
	RA = 0x00e00f2000 ,
	PA = 0x00e00f2000 ,
	TTE_Context = 0x085d ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_0 ,
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
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00006b80001e485d 80000000e00f2040 */
	end_label   = Thr3_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v202_data_begin
Thr3_User_Data_4v202_data_begin:
Thr3_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v005 TEXT_VA=0x6d0035c00000
attr_text {
	Name = .Thr3_User_Text_4v005 ,
	VA = 0x6d0035c00000 ,/* 0x6d0035ffffc0 */
	RA = 0x008ac00000 ,
	PA = 0x008ac00000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006d0035c00456 800000008ac00483 */
	end_label   = Thr3_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v005_text_begin
Thr3_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v402 TEXT_VA=0x6b800011a000
attr_text {
	Name = .Thr3_User_Text_4v402 ,
	VA = 0x6b800011a000 ,/* 0x6b800011bfc0 */
	RA = 0x00e0096000 ,
	PA = 0x00e0096000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr3_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x130000 ,
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
	/* ITTE_TAG_DATA = 00006b800011a000 80000000e0096080 */
	end_label   = Thr3_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v402_text_begin
Thr3_User_Text_4v402_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v103 DATA_VA=0x6e08c0000000
attr_data {
	Name = .Thr3_User_Data_4v103 ,
	VA = 0x6e08c0000000 ,/* 0x6e08cfffffc0 */
	RA = 0x0350000000 ,
	PA = 0x0350000000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006e08c0000456 8000000350000445 */
	end_label   = Thr3_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v103_data_begin
Thr3_User_Data_4v103_data_begin:
Thr3_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v203 DATA_VA=0x6b8000182000
attr_data {
	Name = .Thr3_User_Data_4v203 ,
	VA = 0x6b8000182000 ,/* 0x6b8000183fc0 */
	RA = 0x00e0032000 ,
	PA = 0x00e0032000 ,
	TTE_Context = 0x085d ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_0 ,
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
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* DTTE_TAG_DATA = 00006b800018285d 80000000e0032040 */
	end_label   = Thr3_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v203_data_begin
Thr3_User_Data_4v203_data_begin:
Thr3_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v006 TEXT_VA=0x6c0000250000
attr_text {
	Name = .Thr3_User_Text_4v006 ,
	VA = 0x6c0000250000 ,/* 0x6c000025ffc0 */
	RA = 0x03f05c0000 ,
	PA = 0x3ff05c0000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006c0000250456 8000003ff05c0481 */
	end_label   = Thr3_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v006_text_begin
Thr3_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v403 TEXT_VA=0x6c0000f20000
attr_text {
	Name = .Thr3_User_Text_4v403 ,
	VA = 0x6c0000f20000 ,/* 0x6c0000f2ffc0 */
	RA = 0x03f0fa0000 ,
	PA = 0x3ff0fa0000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr3_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x130000 ,
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
	/* ITTE_TAG_DATA = 00006c0000f20000 8000003ff0fa0081 */
	end_label   = Thr3_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v403_text_begin
Thr3_User_Text_4v403_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v104 DATA_VA=0x6d002b800000
attr_data {
	Name = .Thr3_User_Data_4v104 ,
	VA = 0x6d002b800000 ,/* 0x6d002bbfffc0 */
	RA = 0x0081c00000 ,
	PA = 0x0081c00000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006d002b800456 8000000081c00443 */
	end_label   = Thr3_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v104_data_begin
Thr3_User_Data_4v104_data_begin:
Thr3_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v204 DATA_VA=0x6d0017400000
attr_data {
	Name = .Thr3_User_Data_4v204 ,
	VA = 0x6d0017400000 ,/* 0x6d00177fffc0 */
	RA = 0x008b000000 ,
	PA = 0x008b000000 ,
	TTE_Context = 0x085d ,/* DATA_SECONDARY */
	thr3_nz_ctx_tsb_2 ,
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
	TTE_SW0     = 1 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* DTTE_TAG_DATA = 00006d001740085d 800000008b000043 */
	end_label   = Thr3_User_Data_4v204_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v204_data_begin
Thr3_User_Data_4v204_data_begin:
Thr3_User_Data_4v204_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v007 TEXT_VA=0x6b800003a000
attr_text {
	Name = .Thr3_User_Text_4v007 ,
	VA = 0x6b800003a000 ,/* 0x6b800003bfc0 */
	RA = 0x00e001e000 ,
	PA = 0x00e001e000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006b800003a456 80000000e001e480 */
	end_label   = Thr3_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v007_text_begin
Thr3_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v105 DATA_VA=0x6b80001d8000
attr_data {
	Name = .Thr3_User_Data_4v105 ,
	VA = 0x6b80001d8000 ,/* 0x6b80001d9fc0 */
	RA = 0x00e006a000 ,
	PA = 0x00e006a000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006b80001d8456 80000000e006a440 */
	end_label   = Thr3_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v105_data_begin
Thr3_User_Data_4v105_data_begin:
Thr3_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v008 TEXT_VA=0x6b80001e0000
attr_text {
	Name = .Thr3_User_Text_4v008 ,
	VA = 0x6b80001e0000 ,/* 0x6b80001e1fc0 */
	RA = 0x00e0054000 ,
	PA = 0x00e0054000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006b80001e0456 80000000e0054480 */
	end_label   = Thr3_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v008_text_begin
Thr3_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v106 DATA_VA=0x6b80001b2000
attr_data {
	Name = .Thr3_User_Data_4v106 ,
	VA = 0x6b80001b2000 ,/* 0x6b80001b3fc0 */
	RA = 0x00e007a000 ,
	PA = 0x00e007a000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006b80001b2456 80000000e007a440 */
	end_label   = Thr3_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v106_data_begin
Thr3_User_Data_4v106_data_begin:
Thr3_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v009 TEXT_VA=0x6c0000ef0000
attr_text {
	Name = .Thr3_User_Text_4v009 ,
	VA = 0x6c0000ef0000 ,/* 0x6c0000efffc0 */
	RA = 0x03f0840000 ,
	PA = 0x3ff0840000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006c0000ef0456 8000003ff0840481 */
	end_label   = Thr3_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v009_text_begin
Thr3_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v107 DATA_VA=0x6b8000184000
attr_data {
	Name = .Thr3_User_Data_4v107 ,
	VA = 0x6b8000184000 ,/* 0x6b8000185fc0 */
	RA = 0x00e0196000 ,
	PA = 0x00e0196000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006b8000184456 80000000e0196440 */
	end_label   = Thr3_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v107_data_begin
Thr3_User_Data_4v107_data_begin:
Thr3_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00a TEXT_VA=0x6b80000d8000
attr_text {
	Name = .Thr3_User_Text_4v00a ,
	VA = 0x6b80000d8000 ,/* 0x6b80000d9fc0 */
	RA = 0x00e01dc000 ,
	PA = 0x00e01dc000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006b80000d8456 80000000e01dc480 */
	end_label   = Thr3_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00a_text_begin
Thr3_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v108 DATA_VA=0x6b8000108000
attr_data {
	Name = .Thr3_User_Data_4v108 ,
	VA = 0x6b8000108000 ,/* 0x6b8000109fc0 */
	RA = 0x00e01fa000 ,
	PA = 0x00e01fa000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006b8000108456 80000000e01fa440 */
	end_label   = Thr3_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v108_data_begin
Thr3_User_Data_4v108_data_begin:
Thr3_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00b TEXT_VA=0x6c0000670000
attr_text {
	Name = .Thr3_User_Text_4v00b ,
	VA = 0x6c0000670000 ,/* 0x6c000067ffc0 */
	RA = 0x03f0e50000 ,
	PA = 0x3ff0e50000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006c0000670456 8000003ff0e50481 */
	end_label   = Thr3_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00b_text_begin
Thr3_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v109 DATA_VA=0x6b800003e000
attr_data {
	Name = .Thr3_User_Data_4v109 ,
	VA = 0x6b800003e000 ,/* 0x6b800003ffc0 */
	RA = 0x00e0160000 ,
	PA = 0x00e0160000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006b800003e456 80000000e0160440 */
	end_label   = Thr3_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v109_data_begin
Thr3_User_Data_4v109_data_begin:
Thr3_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00c TEXT_VA=0x6b80001ee000
attr_text {
	Name = .Thr3_User_Text_4v00c ,
	VA = 0x6b80001ee000 ,/* 0x6b80001effc0 */
	RA = 0x00e0178000 ,
	PA = 0x00e0178000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006b80001ee456 80000000e0178480 */
	end_label   = Thr3_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00c_text_begin
Thr3_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10a DATA_VA=0x6b80000e6000
attr_data {
	Name = .Thr3_User_Data_4v10a ,
	VA = 0x6b80000e6000 ,/* 0x6b80000e7fc0 */
	RA = 0x00e012e000 ,
	PA = 0x00e012e000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006b80000e6456 80000000e012e440 */
	end_label   = Thr3_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10a_data_begin
Thr3_User_Data_4v10a_data_begin:
Thr3_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00d TEXT_VA=0x6b800004a000
attr_text {
	Name = .Thr3_User_Text_4v00d ,
	VA = 0x6b800004a000 ,/* 0x6b800004bfc0 */
	RA = 0x00e01b0000 ,
	PA = 0x00e01b0000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006b800004a456 80000000e01b0480 */
	end_label   = Thr3_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00d_text_begin
Thr3_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10b DATA_VA=0x6c0000530000
attr_data {
	Name = .Thr3_User_Data_4v10b ,
	VA = 0x6c0000530000 ,/* 0x6c000053ffc0 */
	RA = 0x03f0500000 ,
	PA = 0x3ff0500000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006c0000530456 8000003ff0500441 */
	end_label   = Thr3_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10b_data_begin
Thr3_User_Data_4v10b_data_begin:
Thr3_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00e TEXT_VA=0x6c0000600000
attr_text {
	Name = .Thr3_User_Text_4v00e ,
	VA = 0x6c0000600000 ,/* 0x6c000060ffc0 */
	RA = 0x03f0930000 ,
	PA = 0x3ff0930000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006c0000600456 8000003ff0930481 */
	end_label   = Thr3_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00e_text_begin
Thr3_User_Text_4v00e_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr3_User_Data_4v10c DATA_VA=0x6e0ad0000000
attr_data {
	Name = .Thr3_User_Data_4v10c ,
	VA = 0x6e0ad0000000 ,/* 0x6e0adfffffc0 */
	RA = 0x01c0000000 ,
	PA = 0x01c0000000 ,
	TTE_Context = 0x0456 ,/* DATA_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x090000 ,
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
	/* DTTE_TAG_DATA = 00006e0ad0000456 80000001c0000445 */
	end_label   = Thr3_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr3_User_Data_4v10c_data_begin
Thr3_User_Data_4v10c_data_begin:
Thr3_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v00f TEXT_VA=0x6c0000290000
attr_text {
	Name = .Thr3_User_Text_4v00f ,
	VA = 0x6c0000290000 ,/* 0x6c000029ffc0 */
	RA = 0x03f0cc0000 ,
	PA = 0x3ff0cc0000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006c0000290456 8000003ff0cc0481 */
	end_label   = Thr3_User_Text_4v00f_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v00f_text_begin
Thr3_User_Text_4v00f_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v010 TEXT_VA=0x6e07e0000000
attr_text {
	Name = .Thr3_User_Text_4v010 ,
	VA = 0x6e07e0000000 ,/* 0x6e07efffffc0 */
	RA = 0x0190000000 ,
	PA = 0x0190000000 ,
	TTE_Context = 0x0456 ,/* TEXT_PRIMARY */
	thr3_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* ITTE_TAG_DATA = 00006e07e0000456 8000000190000485 */
	end_label   = Thr3_User_Text_4v010_text_end ,
	compressimage ,
	}
.text
.global Thr3_User_Text_4v010_text_begin
Thr3_User_Text_4v010_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x710029c00000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	VA = 0x710029c00000 ,/* 0x710029ffffc0 */
	RA = 0x009b800000 ,
	PA = 0x4c9b800000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 0000710029c01d2c 8000004c9b800083 */
	end_label   = Thr4_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr4_user_code_entry
Thr4_user_code_entry:
	setx	Thr4_User_Data_4v100_data_begin, %l0, %i0	! p, c
	setx	Thr4_User_Data_4v200_data_begin, %l0, %i1	! s, c
	setx	Thr4_User_Data_4v101_data_begin, %l0, %i2	! p, nc
	setx	Thr4_User_Data_4v201_data_begin, %l0, %i3	! s, nc
.global Thr4_User_Text_4v000_text_begin
Thr4_User_Text_4v000_text_begin:
	ldxa	[%i2] MMU_ASI_PRIMARY_NO_FAULT, %g1
	ldxa	[%i0] MMU_ASI_PRIMARY_NO_FAULT, %g1
	ldxa	[%i2] MMU_ASI_PRIMARY_NO_FAULT_LITTLE, %g1
	ldxa	[%i3] MMU_ASI_SECONDARY_NO_FAULT, %g2
	ldxa	[%i0] MMU_ASI_SECONDARY_NO_FAULT, %g2
	ldxa	[%i3] MMU_ASI_SECONDARY_NO_FAULT_LITTLE, %g2

	TOGGLE_HWTW_DEMAP
	
	ldxa	[%i2] MMU_ASI_PRIMARY_NO_FAULT, %g1
	ldxa	[%i0] MMU_ASI_PRIMARY_NO_FAULT, %g1
	ldxa	[%i2] MMU_ASI_PRIMARY_NO_FAULT_LITTLE, %g1
	ldxa	[%i3] MMU_ASI_SECONDARY_NO_FAULT, %g2
	ldxa	[%i0] MMU_ASI_SECONDARY_NO_FAULT, %g2
	ldxa	[%i3] MMU_ASI_SECONDARY_NO_FAULT_LITTLE, %g2

	EXIT_GOOD
Thr4_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v100 DATA_VA=0x6f9000102000
attr_data {
	Name = .Thr4_User_Data_4v100 ,
	VA = 0x6f9000102000 ,/* 0x6f9000103fc0 */
	RA = 0x00f006e000 ,
	PA = 0x00f006e000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00006f9000102503 80000000f006e440 */
	end_label   = Thr4_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v100_data_begin
Thr4_User_Data_4v100_data_begin:
	.xword	0x01010101
	.xword	0x02020202
	.xword	0x03030303
	.xword	0x04040404
Thr4_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v200 DATA_VA=0x700000ba0000
attr_data {
	Name = .Thr4_User_Data_4v200 ,
	VA = 0x700000ba0000 ,/* 0x700000baffc0 */
	RA = 0x00105f0000 ,
	PA = 0x40105f0000 ,
	TTE_Context = 0x146b ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x150000 ,
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
	/* DTTE_TAG_DATA = 0000700000ba146b 80000040105f0041 */
	end_label   = Thr4_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v200_data_begin
Thr4_User_Data_4v200_data_begin:
	.xword	0x01010101
	.xword	0x02020202
	.xword	0x03030303
	.xword	0x04040404
Thr4_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v300 DATA_VA=0x6f90001e2000
attr_data {
	Name = .Thr4_User_Data_4v300 ,
	VA = 0x6f90001e2000 ,/* 0x6f90001e3fc0 */
	RA = 0x00f0124000 ,
	PA = 0x00f0124000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x170000 ,
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
	/* DTTE_TAG_DATA = 00006f90001e2000 80000000f0124440 */
	end_label   = Thr4_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v300_data_begin
Thr4_User_Data_4v300_data_begin:
Thr4_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v001 TEXT_VA=0x710016c00000
attr_text {
	Name = .Thr4_User_Text_4v001 ,
	VA = 0x710016c00000 ,/* 0x710016ffffc0 */
	RA = 0x0093000000 ,
	PA = 0x4c93000000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 0000710016c01d2c 8000004c93000083 */
	end_label   = Thr4_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v001_text_begin
Thr4_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v400 TEXT_VA=0x7000005e0000
attr_text {
	Name = .Thr4_User_Text_4v400 ,
	VA = 0x7000005e0000 ,/* 0x7000005effc0 */
	RA = 0x0010150000 ,
	PA = 0x4010150000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr4_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0a0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00007000005e0000 8000004010150481 */
	end_label   = Thr4_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v400_text_begin
Thr4_User_Text_4v400_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v002 TEXT_VA=0x6f9000040000
attr_text {
	Name = .Thr4_User_Text_4v002 ,
	VA = 0x6f9000040000 ,/* 0x6f9000041fc0 */
	RA = 0x00f019c000 ,
	PA = 0x00f019c000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
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
	/* ITTE_TAG_DATA = 00006f9000040503 80000000f019c080 */
	end_label   = Thr4_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v002_text_begin
Thr4_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v101 DATA_VA=0x720d40000000
attr_data {
	Name = .Thr4_User_Data_4v101 ,
	VA = 0x720d40000000 ,/* 0x720d4fffffc0 */
	RA = 0x0360000000 ,
	PA = 0x4f60000000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000720d40001d2c 8000004f60000445 */
	end_label   = Thr4_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v101_data_begin
Thr4_User_Data_4v101_data_begin:
	.xword	0x11111111
	.xword	0x12121212
	.xword	0x13131313
	.xword	0x14141414
Thr4_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v201 DATA_VA=0x6f9000072000
attr_data {
	Name = .Thr4_User_Data_4v201 ,
	VA = 0x6f9000072000 ,/* 0x6f9000073fc0 */
	RA = 0x00f01e4000 ,
	PA = 0x00f01e4000 ,
	TTE_Context = 0x146b ,/* DATA_SECONDARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x150000 ,
	TTE_IE      = 0 ,
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
	/* DTTE_TAG_DATA = 00006f9000073d53 80000000f01e4040 */
	end_label   = Thr4_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v201_data_begin
Thr4_User_Data_4v201_data_begin:
	.xword	0x21212121
	.xword	0x22222222
	.xword	0x23232323
	.xword	0x24242424
Thr4_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v301 DATA_VA=0x6f9000172000
attr_data {
	Name = .Thr4_User_Data_4v301 ,
	VA = 0x6f9000172000 ,/* 0x6f9000173fc0 */
	RA = 0x00f00e0000 ,
	PA = 0x00f00e0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x170000 ,
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
	/* DTTE_TAG_DATA = 00006f9000172000 80000000f00e0440 */
	end_label   = Thr4_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v301_data_begin
Thr4_User_Data_4v301_data_begin:
Thr4_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v003 TEXT_VA=0x7000002e0000
attr_text {
	Name = .Thr4_User_Text_4v003 ,
	VA = 0x7000002e0000 ,/* 0x7000002effc0 */
	RA = 0x0010510000 ,
	PA = 0x4010510000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 00007000002e1d2c 8000004010510081 */
	end_label   = Thr4_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v003_text_begin
Thr4_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v401 TEXT_VA=0x6f90000b4000
attr_text {
	Name = .Thr4_User_Text_4v401 ,
	VA = 0x6f90000b4000 ,/* 0x6f90000b5fc0 */
	RA = 0x00f01e0000 ,
	PA = 0x00f01e0000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr4_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0a0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00006f90000b4000 80000000f01e0480 */
	end_label   = Thr4_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v401_text_begin
Thr4_User_Text_4v401_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v004 TEXT_VA=0x700000940000
attr_text {
	Name = .Thr4_User_Text_4v004 ,
	VA = 0x700000940000 ,/* 0x70000094ffc0 */
	RA = 0x0010d60000 ,
	PA = 0x4010d60000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
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
	/* ITTE_TAG_DATA = 0000700000941d2c 8000004010d60081 */
	end_label   = Thr4_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v004_text_begin
Thr4_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v102 DATA_VA=0x6f900005a000
attr_data {
	Name = .Thr4_User_Data_4v102 ,
	VA = 0x6f900005a000 ,/* 0x6f900005bfc0 */
	RA = 0x00f008e000 ,
	PA = 0x00f008e000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00006f900005a503 80000000f008e440 */
	end_label   = Thr4_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v102_data_begin
Thr4_User_Data_4v102_data_begin:
Thr4_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v302 DATA_VA=0x6f9000194000
attr_data {
	Name = .Thr4_User_Data_4v302 ,
	VA = 0x6f9000194000 ,/* 0x6f9000195fc0 */
	RA = 0x00f0052000 ,
	PA = 0x00f0052000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr4_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x170000 ,
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
	/* DTTE_TAG_DATA = 00006f9000194000 80000000f0052440 */
	end_label   = Thr4_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v302_data_begin
Thr4_User_Data_4v302_data_begin:
Thr4_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v005 TEXT_VA=0x700000860000
attr_text {
	Name = .Thr4_User_Text_4v005 ,
	VA = 0x700000860000 ,/* 0x70000086ffc0 */
	RA = 0x0010640000 ,
	PA = 0x4010640000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 0000700000861d2c 8000004010640081 */
	end_label   = Thr4_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v005_text_begin
Thr4_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v402 TEXT_VA=0x6f9000042000
attr_text {
	Name = .Thr4_User_Text_4v402 ,
	VA = 0x6f9000042000 ,/* 0x6f9000043fc0 */
	RA = 0x00f00cc000 ,
	PA = 0x00f00cc000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr4_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0a0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 00006f9000042000 80000000f00cc480 */
	end_label   = Thr4_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v402_text_begin
Thr4_User_Text_4v402_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v006 TEXT_VA=0x71000c000000
attr_text {
	Name = .Thr4_User_Text_4v006 ,
	VA = 0x71000c000000 ,/* 0x71000c3fffc0 */
	RA = 0x0094c00000 ,
	PA = 0x4c94c00000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
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
	/* ITTE_TAG_DATA = 000071000c001d2c 8000004c94c00083 */
	end_label   = Thr4_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v006_text_begin
Thr4_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v103 DATA_VA=0x6f900018e000
attr_data {
	Name = .Thr4_User_Data_4v103 ,
	VA = 0x6f900018e000 ,/* 0x6f900018ffc0 */
	RA = 0x00f009e000 ,
	PA = 0x00f009e000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00006f900018e503 80000000f009e440 */
	end_label   = Thr4_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v103_data_begin
Thr4_User_Data_4v103_data_begin:
Thr4_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v007 TEXT_VA=0x6f900019e000
attr_text {
	Name = .Thr4_User_Text_4v007 ,
	VA = 0x6f900019e000 ,/* 0x6f900019ffc0 */
	RA = 0x00f0186000 ,
	PA = 0x00f0186000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 00006f900019e503 80000000f0186080 */
	end_label   = Thr4_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v007_text_begin
Thr4_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v008 TEXT_VA=0x7000009d0000
attr_text {
	Name = .Thr4_User_Text_4v008 ,
	VA = 0x7000009d0000 ,/* 0x7000009dffc0 */
	RA = 0x0010e30000 ,
	PA = 0x4010e30000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
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
	/* ITTE_TAG_DATA = 00007000009d1d2c 8000004010e30081 */
	end_label   = Thr4_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v008_text_begin
Thr4_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v104 DATA_VA=0x710018400000
attr_data {
	Name = .Thr4_User_Data_4v104 ,
	VA = 0x710018400000 ,/* 0x7100187fffc0 */
	RA = 0x009b400000 ,
	PA = 0x4c9b400000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000710018401d2c 8000004c9b400443 */
	end_label   = Thr4_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v104_data_begin
Thr4_User_Data_4v104_data_begin:
Thr4_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v009 TEXT_VA=0x7000003e0000
attr_text {
	Name = .Thr4_User_Text_4v009 ,
	VA = 0x7000003e0000 ,/* 0x7000003effc0 */
	RA = 0x0010ce0000 ,
	PA = 0x4010ce0000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 00007000003e1d2c 8000004010ce0081 */
	end_label   = Thr4_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v009_text_begin
Thr4_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00a TEXT_VA=0x710038800000
attr_text {
	Name = .Thr4_User_Text_4v00a ,
	VA = 0x710038800000 ,/* 0x710038bfffc0 */
	RA = 0x009fc00000 ,
	PA = 0x4c9fc00000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
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
	/* ITTE_TAG_DATA = 0000710038801d2c 8000004c9fc00083 */
	end_label   = Thr4_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00a_text_begin
Thr4_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v105 DATA_VA=0x7000001c0000
attr_data {
	Name = .Thr4_User_Data_4v105 ,
	VA = 0x7000001c0000 ,/* 0x7000001cffc0 */
	RA = 0x0010380000 ,
	PA = 0x4010380000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00007000001c1d2c 8000004010380441 */
	end_label   = Thr4_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v105_data_begin
Thr4_User_Data_4v105_data_begin:
Thr4_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00b TEXT_VA=0x6f90001a0000
attr_text {
	Name = .Thr4_User_Text_4v00b ,
	VA = 0x6f90001a0000 ,/* 0x6f90001a1fc0 */
	RA = 0x00f01da000 ,
	PA = 0x00f01da000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 00006f90001a0503 80000000f01da080 */
	end_label   = Thr4_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00b_text_begin
Thr4_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v106 DATA_VA=0x710025c00000
attr_data {
	Name = .Thr4_User_Data_4v106 ,
	VA = 0x710025c00000 ,/* 0x710025ffffc0 */
	RA = 0x009c400000 ,
	PA = 0x4c9c400000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000710025c01d2c 8000004c9c400443 */
	end_label   = Thr4_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v106_data_begin
Thr4_User_Data_4v106_data_begin:
Thr4_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00c TEXT_VA=0x6f90000d0000
attr_text {
	Name = .Thr4_User_Text_4v00c ,
	VA = 0x6f90000d0000 ,/* 0x6f90000d1fc0 */
	RA = 0x00f0034000 ,
	PA = 0x00f0034000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 00006f90000d0503 80000000f0034080 */
	end_label   = Thr4_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00c_text_begin
Thr4_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v107 DATA_VA=0x6f900010a000
attr_data {
	Name = .Thr4_User_Data_4v107 ,
	VA = 0x6f900010a000 ,/* 0x6f900010bfc0 */
	RA = 0x00f01ce000 ,
	PA = 0x00f01ce000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00006f900010a503 80000000f01ce440 */
	end_label   = Thr4_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v107_data_begin
Thr4_User_Data_4v107_data_begin:
Thr4_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00d TEXT_VA=0x6f90000ac000
attr_text {
	Name = .Thr4_User_Text_4v00d ,
	VA = 0x6f90000ac000 ,/* 0x6f90000adfc0 */
	RA = 0x00f00dc000 ,
	PA = 0x00f00dc000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 00006f90000ac503 80000000f00dc080 */
	end_label   = Thr4_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00d_text_begin
Thr4_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v108 DATA_VA=0x6f900010c000
attr_data {
	Name = .Thr4_User_Data_4v108 ,
	VA = 0x6f900010c000 ,/* 0x6f900010dfc0 */
	RA = 0x00f005c000 ,
	PA = 0x00f005c000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00006f900010c503 80000000f005c440 */
	end_label   = Thr4_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v108_data_begin
Thr4_User_Data_4v108_data_begin:
Thr4_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00e TEXT_VA=0x6f900005c000
attr_text {
	Name = .Thr4_User_Text_4v00e ,
	VA = 0x6f900005c000 ,/* 0x6f900005dfc0 */
	RA = 0x00f0002000 ,
	PA = 0x00f0002000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 00006f900005c503 80000000f0002080 */
	end_label   = Thr4_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00e_text_begin
Thr4_User_Text_4v00e_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v109 DATA_VA=0x6f9000162000
attr_data {
	Name = .Thr4_User_Data_4v109 ,
	VA = 0x6f9000162000 ,/* 0x6f9000163fc0 */
	RA = 0x00f0148000 ,
	PA = 0x00f0148000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00006f9000162503 80000000f0148440 */
	end_label   = Thr4_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v109_data_begin
Thr4_User_Data_4v109_data_begin:
Thr4_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v00f TEXT_VA=0x6f900010e000
attr_text {
	Name = .Thr4_User_Text_4v00f ,
	VA = 0x6f900010e000 ,/* 0x6f900010ffc0 */
	RA = 0x00f01ba000 ,
	PA = 0x00f01ba000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 00006f900010e503 80000000f01ba080 */
	end_label   = Thr4_User_Text_4v00f_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v00f_text_begin
Thr4_User_Text_4v00f_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v10a DATA_VA=0x710007000000
attr_data {
	Name = .Thr4_User_Data_4v10a ,
	VA = 0x710007000000 ,/* 0x7100073fffc0 */
	RA = 0x0095000000 ,
	PA = 0x4c95000000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000710007001d2c 8000004c95000443 */
	end_label   = Thr4_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v10a_data_begin
Thr4_User_Data_4v10a_data_begin:
Thr4_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v010 TEXT_VA=0x71003d800000
attr_text {
	Name = .Thr4_User_Text_4v010 ,
	VA = 0x71003d800000 ,/* 0x71003dbfffc0 */
	RA = 0x0095400000 ,
	PA = 0x4c95400000 ,
	TTE_Context = 0x1d2c ,/* TEXT_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x110000 ,
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
	/* ITTE_TAG_DATA = 000071003d801d2c 8000004c95400083 */
	end_label   = Thr4_User_Text_4v010_text_end ,
	compressimage ,
	}
.text
.global Thr4_User_Text_4v010_text_begin
Thr4_User_Text_4v010_text_begin:
	EXIT_GOOD
Thr4_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v10b DATA_VA=0x710020800000
attr_data {
	Name = .Thr4_User_Data_4v10b ,
	VA = 0x710020800000 ,/* 0x710020bfffc0 */
	RA = 0x0093400000 ,
	PA = 0x4c93400000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000710020801d2c 8000004c93400443 */
	end_label   = Thr4_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v10b_data_begin
Thr4_User_Data_4v10b_data_begin:
Thr4_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v10c DATA_VA=0x6f9000024000
attr_data {
	Name = .Thr4_User_Data_4v10c ,
	VA = 0x6f9000024000 ,/* 0x6f9000025fc0 */
	RA = 0x00f0036000 ,
	PA = 0x00f0036000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 00006f9000024503 80000000f0036440 */
	end_label   = Thr4_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v10c_data_begin
Thr4_User_Data_4v10c_data_begin:
Thr4_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr4_User_Data_4v10d DATA_VA=0x710011000000
attr_data {
	Name = .Thr4_User_Data_4v10d ,
	VA = 0x710011000000 ,/* 0x7100113fffc0 */
	RA = 0x0092800000 ,
	PA = 0x4c92800000 ,
	TTE_Context = 0x1d2c ,/* DATA_PRIMARY */
	thr4_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1d0000 ,
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
	/* DTTE_TAG_DATA = 0000710011001d2c 8000004c92800443 */
	end_label   = Thr4_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr4_User_Data_4v10d_data_begin
Thr4_User_Data_4v10d_data_begin:
Thr4_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x73a000000000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	VA = 0x73a000000000 ,/* 0x73a000001fc0 */
	RA = 0x0100026000 ,
	PA = 0x0100026000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 000073a000001189 8000000100026080 */
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
SECTION .Thr5_User_Data_4v100 DATA_VA=0x750027800000
attr_data {
	Name = .Thr5_User_Data_4v100 ,
	VA = 0x750027800000 ,/* 0x750027bfffc0 */
	RA = 0x00aa400000 ,
	PA = 0x00aa400000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
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
	/* DTTE_TAG_DATA = 0000750027801189 80000000aa400443 */
	end_label   = Thr5_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v100_data_begin
Thr5_User_Data_4v100_data_begin:
Thr5_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v200 DATA_VA=0x73a000076000
attr_data {
	Name = .Thr5_User_Data_4v200 ,
	VA = 0x73a000076000 ,/* 0x73a000077fc0 */
	RA = 0x0100086000 ,
	PA = 0x0100086000 ,
	TTE_Context = 0x1fce ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 000073a000077fce 8000000100086440 */
	end_label   = Thr5_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v200_data_begin
Thr5_User_Data_4v200_data_begin:
Thr5_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v300 DATA_VA=0x740000b20000
attr_data {
	Name = .Thr5_User_Data_4v300 ,
	VA = 0x740000b20000 ,/* 0x740000b2ffc0 */
	RA = 0x0020ba0000 ,
	PA = 0x5420ba0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x010000 ,
	TTE_IE      = 0 ,
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
	/* DTTE_TAG_DATA = 0000740000b20000 8000005420ba0041 */
	end_label   = Thr5_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v300_data_begin
Thr5_User_Data_4v300_data_begin:
Thr5_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v001 TEXT_VA=0x75000a000000
attr_text {
	Name = .Thr5_User_Text_4v001 ,
	VA = 0x75000a000000 ,/* 0x75000a3fffc0 */
	RA = 0x00a8800000 ,
	PA = 0x00a8800000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 000075000a001189 80000000a8800083 */
	end_label   = Thr5_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v001_text_begin
Thr5_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v400 TEXT_VA=0x73a00005e000
attr_text {
	Name = .Thr5_User_Text_4v400 ,
	VA = 0x73a00005e000 ,/* 0x73a00005ffc0 */
	RA = 0x01001bc000 ,
	PA = 0x5d001bc000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr5_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1e0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 000073a00005e000 8000005d001bc480 */
	end_label   = Thr5_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v400_text_begin
Thr5_User_Text_4v400_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v002 TEXT_VA=0x740000620000
attr_text {
	Name = .Thr5_User_Text_4v002 ,
	VA = 0x740000620000 ,/* 0x74000062ffc0 */
	RA = 0x0020020000 ,
	PA = 0x0020020000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 0000740000621189 8000000020020081 */
	end_label   = Thr5_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v002_text_begin
Thr5_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v101 DATA_VA=0x760e30000000
attr_data {
	Name = .Thr5_User_Data_4v101 ,
	VA = 0x760e30000000 ,/* 0x760e3fffffc0 */
	RA = 0x0370000000 ,
	PA = 0x0370000000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
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
	/* DTTE_TAG_DATA = 0000760e30001189 8000000370000445 */
	end_label   = Thr5_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v101_data_begin
Thr5_User_Data_4v101_data_begin:
Thr5_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v201 DATA_VA=0x740000d30000
attr_data {
	Name = .Thr5_User_Data_4v201 ,
	VA = 0x740000d30000 ,/* 0x740000d3ffc0 */
	RA = 0x00202b0000 ,
	PA = 0x00202b0000 ,
	TTE_Context = 0x1fce ,/* DATA_SECONDARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x140000 ,
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
	/* DTTE_TAG_DATA = 0000740000d31fce 80000000202b0441 */
	end_label   = Thr5_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v201_data_begin
Thr5_User_Data_4v201_data_begin:
Thr5_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v301 DATA_VA=0x73a00011c000
attr_data {
	Name = .Thr5_User_Data_4v301 ,
	VA = 0x73a00011c000 ,/* 0x73a00011dfc0 */
	RA = 0x01001d6000 ,
	PA = 0x5d001d6000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr5_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x010000 ,
	TTE_IE      = 0 ,
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
	/* DTTE_TAG_DATA = 000073a00011c000 8000005d001d6040 */
	end_label   = Thr5_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v301_data_begin
Thr5_User_Data_4v301_data_begin:
Thr5_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v003 TEXT_VA=0x73a0000d2000
attr_text {
	Name = .Thr5_User_Text_4v003 ,
	VA = 0x73a0000d2000 ,/* 0x73a0000d3fc0 */
	RA = 0x0100168000 ,
	PA = 0x0100168000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 000073a0000d3189 8000000100168080 */
	end_label   = Thr5_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v003_text_begin
Thr5_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v401 TEXT_VA=0x73a000196000
attr_text {
	Name = .Thr5_User_Text_4v401 ,
	VA = 0x73a000196000 ,/* 0x73a000197fc0 */
	RA = 0x01000c0000 ,
	PA = 0x5d000c0000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr5_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1e0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 0 ,
	/* ITTE_TAG_DATA = 000073a000196000 8000005d000c0480 */
	end_label   = Thr5_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v401_text_begin
Thr5_User_Text_4v401_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v004 TEXT_VA=0x760980000000
attr_text {
	Name = .Thr5_User_Text_4v004 ,
	VA = 0x760980000000 ,/* 0x76098fffffc0 */
	RA = 0x01d0000000 ,
	PA = 0x01d0000000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 0000760980001189 80000001d0000085 */
	end_label   = Thr5_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v004_text_begin
Thr5_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v102 DATA_VA=0x73a000170000
attr_data {
	Name = .Thr5_User_Data_4v102 ,
	VA = 0x73a000170000 ,/* 0x73a000171fc0 */
	RA = 0x0100118000 ,
	PA = 0x0100118000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
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
	/* DTTE_TAG_DATA = 000073a000171189 8000000100118440 */
	end_label   = Thr5_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v102_data_begin
Thr5_User_Data_4v102_data_begin:
Thr5_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v005 TEXT_VA=0x73a0000fc000
attr_text {
	Name = .Thr5_User_Text_4v005 ,
	VA = 0x73a0000fc000 ,/* 0x73a0000fdfc0 */
	RA = 0x0100108000 ,
	PA = 0x0100108000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 000073a0000fd189 8000000100108080 */
	end_label   = Thr5_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v005_text_begin
Thr5_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v402 TEXT_VA=0x75002ec00000
attr_text {
	Name = .Thr5_User_Text_4v402 ,
	VA = 0x75002ec00000 ,/* 0x75002effffc0 */
	RA = 0x00af000000 ,
	PA = 0x00af000000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr5_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x1e0000 ,
	TTE_IE      = 0 ,
	TTE_E       = 0 ,
	TTE_CP      = 1 ,
	TTE_CV      = 0 ,
	TTE_P       = 1 ,
	TTE_EP      = 1 ,
	TTE_W       = 0 ,
	TTE_SW1     = 1 ,
	TTE_SW0     = 0 ,
	TTE_RSVD1   = 0 ,
	TTE_Size    = 3 ,
	/* ITTE_TAG_DATA = 000075002ec00000 80000000af000483 */
	end_label   = Thr5_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v402_text_begin
Thr5_User_Text_4v402_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v006 TEXT_VA=0x73a000044000
attr_text {
	Name = .Thr5_User_Text_4v006 ,
	VA = 0x73a000044000 ,/* 0x73a000045fc0 */
	RA = 0x0100176000 ,
	PA = 0x0100176000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 000073a000045189 8000000100176080 */
	end_label   = Thr5_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v006_text_begin
Thr5_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v103 DATA_VA=0x73a00012a000
attr_data {
	Name = .Thr5_User_Data_4v103 ,
	VA = 0x73a00012a000 ,/* 0x73a00012bfc0 */
	RA = 0x01000ee000 ,
	PA = 0x01000ee000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
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
	/* DTTE_TAG_DATA = 000073a00012b189 80000001000ee440 */
	end_label   = Thr5_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v103_data_begin
Thr5_User_Data_4v103_data_begin:
Thr5_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v007 TEXT_VA=0x73a000188000
attr_text {
	Name = .Thr5_User_Text_4v007 ,
	VA = 0x73a000188000 ,/* 0x73a000189fc0 */
	RA = 0x01000e2000 ,
	PA = 0x01000e2000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 000073a000189189 80000001000e2080 */
	end_label   = Thr5_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v007_text_begin
Thr5_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v104 DATA_VA=0x75003fc00000
attr_data {
	Name = .Thr5_User_Data_4v104 ,
	VA = 0x75003fc00000 ,/* 0x75003fffffc0 */
	RA = 0x00a1000000 ,
	PA = 0x00a1000000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
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
	/* DTTE_TAG_DATA = 000075003fc01189 80000000a1000443 */
	end_label   = Thr5_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v104_data_begin
Thr5_User_Data_4v104_data_begin:
Thr5_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v008 TEXT_VA=0x750021000000
attr_text {
	Name = .Thr5_User_Text_4v008 ,
	VA = 0x750021000000 ,/* 0x7500213fffc0 */
	RA = 0x00a2c00000 ,
	PA = 0x00a2c00000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 0000750021001189 80000000a2c00083 */
	end_label   = Thr5_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v008_text_begin
Thr5_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v105 DATA_VA=0x750006400000
attr_data {
	Name = .Thr5_User_Data_4v105 ,
	VA = 0x750006400000 ,/* 0x7500067fffc0 */
	RA = 0x00a0000000 ,
	PA = 0x00a0000000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
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
	/* DTTE_TAG_DATA = 0000750006401189 80000000a0000443 */
	end_label   = Thr5_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v105_data_begin
Thr5_User_Data_4v105_data_begin:
Thr5_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v009 TEXT_VA=0x740000fd0000
attr_text {
	Name = .Thr5_User_Text_4v009 ,
	VA = 0x740000fd0000 ,/* 0x740000fdffc0 */
	RA = 0x00202c0000 ,
	PA = 0x00202c0000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 0000740000fd1189 80000000202c0081 */
	end_label   = Thr5_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v009_text_begin
Thr5_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v106 DATA_VA=0x740000ce0000
attr_data {
	Name = .Thr5_User_Data_4v106 ,
	VA = 0x740000ce0000 ,/* 0x740000ceffc0 */
	RA = 0x0020a90000 ,
	PA = 0x0020a90000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
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
	/* DTTE_TAG_DATA = 0000740000ce1189 8000000020a90441 */
	end_label   = Thr5_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v106_data_begin
Thr5_User_Data_4v106_data_begin:
Thr5_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00a TEXT_VA=0x73a00006c000
attr_text {
	Name = .Thr5_User_Text_4v00a ,
	VA = 0x73a00006c000 ,/* 0x73a00006dfc0 */
	RA = 0x01000d0000 ,
	PA = 0x01000d0000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 000073a00006d189 80000001000d0080 */
	end_label   = Thr5_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00a_text_begin
Thr5_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v107 DATA_VA=0x750030c00000
attr_data {
	Name = .Thr5_User_Data_4v107 ,
	VA = 0x750030c00000 ,/* 0x750030ffffc0 */
	RA = 0x00a0400000 ,
	PA = 0x00a0400000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
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
	/* DTTE_TAG_DATA = 0000750030c01189 80000000a0400443 */
	end_label   = Thr5_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v107_data_begin
Thr5_User_Data_4v107_data_begin:
Thr5_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00b TEXT_VA=0x75001c000000
attr_text {
	Name = .Thr5_User_Text_4v00b ,
	VA = 0x75001c000000 ,/* 0x75001c3fffc0 */
	RA = 0x00a0800000 ,
	PA = 0x00a0800000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 000075001c001189 80000000a0800083 */
	end_label   = Thr5_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00b_text_begin
Thr5_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v108 DATA_VA=0x73a00019a000
attr_data {
	Name = .Thr5_User_Data_4v108 ,
	VA = 0x73a00019a000 ,/* 0x73a00019bfc0 */
	RA = 0x010008c000 ,
	PA = 0x010008c000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
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
	/* DTTE_TAG_DATA = 000073a00019b189 800000010008c440 */
	end_label   = Thr5_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v108_data_begin
Thr5_User_Data_4v108_data_begin:
Thr5_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00c TEXT_VA=0x750022800000
attr_text {
	Name = .Thr5_User_Text_4v00c ,
	VA = 0x750022800000 ,/* 0x750022bfffc0 */
	RA = 0x00a5800000 ,
	PA = 0x00a5800000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 0000750022801189 80000000a5800083 */
	end_label   = Thr5_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00c_text_begin
Thr5_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v109 DATA_VA=0x740000a30000
attr_data {
	Name = .Thr5_User_Data_4v109 ,
	VA = 0x740000a30000 ,/* 0x740000a3ffc0 */
	RA = 0x0020650000 ,
	PA = 0x0020650000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
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
	/* DTTE_TAG_DATA = 0000740000a31189 8000000020650441 */
	end_label   = Thr5_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v109_data_begin
Thr5_User_Data_4v109_data_begin:
Thr5_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00d TEXT_VA=0x740000840000
attr_text {
	Name = .Thr5_User_Text_4v00d ,
	VA = 0x740000840000 ,/* 0x74000084ffc0 */
	RA = 0x0020850000 ,
	PA = 0x0020850000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 0000740000841189 8000000020850081 */
	end_label   = Thr5_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00d_text_begin
Thr5_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10a DATA_VA=0x750027400000
attr_data {
	Name = .Thr5_User_Data_4v10a ,
	VA = 0x750027400000 ,/* 0x7500277fffc0 */
	RA = 0x00abc00000 ,
	PA = 0x00abc00000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
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
	/* DTTE_TAG_DATA = 0000750027401189 80000000abc00443 */
	end_label   = Thr5_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10a_data_begin
Thr5_User_Data_4v10a_data_begin:
Thr5_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v00e TEXT_VA=0x75003ec00000
attr_text {
	Name = .Thr5_User_Text_4v00e ,
	VA = 0x75003ec00000 ,/* 0x75003effffc0 */
	RA = 0x00a0c00000 ,
	PA = 0x00a0c00000 ,
	TTE_Context = 0x1189 ,/* TEXT_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x030000 ,
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
	/* ITTE_TAG_DATA = 000075003ec01189 80000000a0c00083 */
	end_label   = Thr5_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr5_User_Text_4v00e_text_begin
Thr5_User_Text_4v00e_text_begin:
	EXIT_GOOD
Thr5_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10b DATA_VA=0x740000370000
attr_data {
	Name = .Thr5_User_Data_4v10b ,
	VA = 0x740000370000 ,/* 0x74000037ffc0 */
	RA = 0x00200b0000 ,
	PA = 0x00200b0000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
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
	/* DTTE_TAG_DATA = 0000740000371189 80000000200b0441 */
	end_label   = Thr5_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10b_data_begin
Thr5_User_Data_4v10b_data_begin:
Thr5_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10c DATA_VA=0x73a0001ca000
attr_data {
	Name = .Thr5_User_Data_4v10c ,
	VA = 0x73a0001ca000 ,/* 0x73a0001cbfc0 */
	RA = 0x0100136000 ,
	PA = 0x0100136000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
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
	/* DTTE_TAG_DATA = 000073a0001cb189 8000000100136440 */
	end_label   = Thr5_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10c_data_begin
Thr5_User_Data_4v10c_data_begin:
Thr5_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10d DATA_VA=0x740000bf0000
attr_data {
	Name = .Thr5_User_Data_4v10d ,
	VA = 0x740000bf0000 ,/* 0x740000bfffc0 */
	RA = 0x00203b0000 ,
	PA = 0x00203b0000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
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
	/* DTTE_TAG_DATA = 0000740000bf1189 80000000203b0441 */
	end_label   = Thr5_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10d_data_begin
Thr5_User_Data_4v10d_data_begin:
Thr5_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10e DATA_VA=0x7400004f0000
attr_data {
	Name = .Thr5_User_Data_4v10e ,
	VA = 0x7400004f0000 ,/* 0x7400004fffc0 */
	RA = 0x0020d00000 ,
	PA = 0x0020d00000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
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
	/* DTTE_TAG_DATA = 00007400004f1189 8000000020d00441 */
	end_label   = Thr5_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10e_data_begin
Thr5_User_Data_4v10e_data_begin:
Thr5_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v10f DATA_VA=0x740000650000
attr_data {
	Name = .Thr5_User_Data_4v10f ,
	VA = 0x740000650000 ,/* 0x74000065ffc0 */
	RA = 0x0020270000 ,
	PA = 0x0020270000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_0 ,
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
	/* DTTE_TAG_DATA = 0000740000651189 8000000020270441 */
	end_label   = Thr5_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v10f_data_begin
Thr5_User_Data_4v10f_data_begin:
Thr5_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v110 DATA_VA=0x73a000018000
attr_data {
	Name = .Thr5_User_Data_4v110 ,
	VA = 0x73a000018000 ,/* 0x73a000019fc0 */
	RA = 0x0100082000 ,
	PA = 0x0100082000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
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
	/* DTTE_TAG_DATA = 000073a000019189 8000000100082440 */
	end_label   = Thr5_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v110_data_begin
Thr5_User_Data_4v110_data_begin:
Thr5_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v111 DATA_VA=0x73a000110000
attr_data {
	Name = .Thr5_User_Data_4v111 ,
	VA = 0x73a000110000 ,/* 0x73a000111fc0 */
	RA = 0x0100098000 ,
	PA = 0x0100098000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
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
	/* DTTE_TAG_DATA = 000073a000111189 8000000100098440 */
	end_label   = Thr5_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v111_data_begin
Thr5_User_Data_4v111_data_begin:
Thr5_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v112 DATA_VA=0x73a0001a2000
attr_data {
	Name = .Thr5_User_Data_4v112 ,
	VA = 0x73a0001a2000 ,/* 0x73a0001a3fc0 */
	RA = 0x0100040000 ,
	PA = 0x0100040000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_3 ,
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
	/* DTTE_TAG_DATA = 000073a0001a3189 8000000100040440 */
	end_label   = Thr5_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v112_data_begin
Thr5_User_Data_4v112_data_begin:
Thr5_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr5_User_Data_4v113 DATA_VA=0x75000d800000
attr_data {
	Name = .Thr5_User_Data_4v113 ,
	VA = 0x75000d800000 ,/* 0x75000dbfffc0 */
	RA = 0x00a1800000 ,
	PA = 0x00a1800000 ,
	TTE_Context = 0x1189 ,/* DATA_PRIMARY */
	thr5_nz_ctx_tsb_1 ,
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
	/* DTTE_TAG_DATA = 000075000d801189 80000000a1800443 */
	end_label   = Thr5_User_Data_4v113_data_end ,
	compressimage ,
	}
.data
.global Thr5_User_Data_4v113_data_begin
Thr5_User_Data_4v113_data_begin:
Thr5_User_Data_4v113_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v000 TEXT_VA=0x7800001f0000
attr_text {
	Name = .Thr6_User_Text_4v000 ,
	VA = 0x7800001f0000 ,/* 0x7800001fffc0 */
	RA = 0x0030f60000 ,
	PA = 0x6430f60000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007800001f1578 8000006430f60081 */
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
SECTION .Thr6_User_Data_4v100 DATA_VA=0x77b0001ec000
attr_data {
	Name = .Thr6_User_Data_4v100 ,
	VA = 0x77b0001ec000 ,/* 0x77b0001edfc0 */
	RA = 0x0110166000 ,
	PA = 0x6d10166000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b0001eda1e 8000006d10166440 */
	end_label   = Thr6_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v100_data_begin
Thr6_User_Data_4v100_data_begin:
Thr6_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v200 DATA_VA=0x780000990000
attr_data {
	Name = .Thr6_User_Data_4v200 ,
	VA = 0x780000990000 ,/* 0x78000099ffc0 */
	RA = 0x0030ea0000 ,
	PA = 0x6430ea0000 ,
	TTE_Context = 0x019e ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x020000 ,
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
	/* DTTE_TAG_DATA = 000078000099019e 8000006430ea0041 */
	end_label   = Thr6_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v200_data_begin
Thr6_User_Data_4v200_data_begin:
Thr6_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v300 DATA_VA=0x790018800000
attr_data {
	Name = .Thr6_User_Data_4v300 ,
	VA = 0x790018800000 ,/* 0x790018bfffc0 */
	RA = 0x0132400000 ,
	PA = 0x0132400000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 0000790018800000 8000000132400443 */
	end_label   = Thr6_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v300_data_begin
Thr6_User_Data_4v300_data_begin:
Thr6_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v001 TEXT_VA=0x77b00007c000
attr_text {
	Name = .Thr6_User_Text_4v001 ,
	VA = 0x77b00007c000 ,/* 0x77b00007dfc0 */
	RA = 0x0110180000 ,
	PA = 0x6d10180000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 000077b00007da1e 8000006d10180080 */
	end_label   = Thr6_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v001_text_begin
Thr6_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v400 TEXT_VA=0x79000b800000
attr_text {
	Name = .Thr6_User_Text_4v400 ,
	VA = 0x79000b800000 ,/* 0x79000bbfffc0 */
	RA = 0x0133800000 ,
	PA = 0x0133800000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr6_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x100000 ,
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
	/* ITTE_TAG_DATA = 000079000b800000 8000000133800083 */
	end_label   = Thr6_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v400_text_begin
Thr6_User_Text_4v400_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v002 TEXT_VA=0x77b0000b2000
attr_text {
	Name = .Thr6_User_Text_4v002 ,
	VA = 0x77b0000b2000 ,/* 0x77b0000b3fc0 */
	RA = 0x01101e6000 ,
	PA = 0x6d101e6000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 000077b0000b3a1e 8000006d101e6080 */
	end_label   = Thr6_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v002_text_begin
Thr6_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v101 DATA_VA=0x77b00002e000
attr_data {
	Name = .Thr6_User_Data_4v101 ,
	VA = 0x77b00002e000 ,/* 0x77b00002ffc0 */
	RA = 0x0110076000 ,
	PA = 0x6d10076000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b00002fa1e 8000006d10076440 */
	end_label   = Thr6_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v101_data_begin
Thr6_User_Data_4v101_data_begin:
Thr6_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v201 DATA_VA=0x77b000190000
attr_data {
	Name = .Thr6_User_Data_4v201 ,
	VA = 0x77b000190000 ,/* 0x77b000191fc0 */
	RA = 0x0110194000 ,
	PA = 0x6d10194000 ,
	TTE_Context = 0x019e ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x020000 ,
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
	/* DTTE_TAG_DATA = 000077b0001909de 8000006d10194040 */
	end_label   = Thr6_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v201_data_begin
Thr6_User_Data_4v201_data_begin:
Thr6_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v301 DATA_VA=0x780000cf0000
attr_data {
	Name = .Thr6_User_Data_4v301 ,
	VA = 0x780000cf0000 ,/* 0x780000cfffc0 */
	RA = 0x0030820000 ,
	PA = 0x0030820000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 0000780000cf0000 8000000030820441 */
	end_label   = Thr6_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v301_data_begin
Thr6_User_Data_4v301_data_begin:
Thr6_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v003 TEXT_VA=0x7800004b0000
attr_text {
	Name = .Thr6_User_Text_4v003 ,
	VA = 0x7800004b0000 ,/* 0x7800004bffc0 */
	RA = 0x0030800000 ,
	PA = 0x6430800000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007800004b1578 8000006430800081 */
	end_label   = Thr6_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v003_text_begin
Thr6_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v401 TEXT_VA=0x7800008d0000
attr_text {
	Name = .Thr6_User_Text_4v401 ,
	VA = 0x7800008d0000 ,/* 0x7800008dffc0 */
	RA = 0x0030b10000 ,
	PA = 0x0030b10000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr6_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x100000 ,
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
	/* ITTE_TAG_DATA = 00007800008d0000 8000000030b10081 */
	end_label   = Thr6_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v401_text_begin
Thr6_User_Text_4v401_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v004 TEXT_VA=0x79003e800000
attr_text {
	Name = .Thr6_User_Text_4v004 ,
	VA = 0x79003e800000 ,/* 0x79003ebfffc0 */
	RA = 0x0133c00000 ,
	PA = 0x0133c00000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 000079003e801578 8000000133c00083 */
	end_label   = Thr6_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v004_text_begin
Thr6_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v102 DATA_VA=0x780000270000
attr_data {
	Name = .Thr6_User_Data_4v102 ,
	VA = 0x780000270000 ,/* 0x78000027ffc0 */
	RA = 0x0030520000 ,
	PA = 0x6430520000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 0000780000271578 8000006430520441 */
	end_label   = Thr6_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v102_data_begin
Thr6_User_Data_4v102_data_begin:
Thr6_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v202 DATA_VA=0x780000d20000
attr_data {
	Name = .Thr6_User_Data_4v202 ,
	VA = 0x780000d20000 ,/* 0x780000d2ffc0 */
	RA = 0x00300f0000 ,
	PA = 0x64300f0000 ,
	TTE_Context = 0x019e ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x020000 ,
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
	/* DTTE_TAG_DATA = 0000780000d2019e 80000064300f0041 */
	end_label   = Thr6_User_Data_4v202_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v202_data_begin
Thr6_User_Data_4v202_data_begin:
Thr6_User_Data_4v202_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v302 DATA_VA=0x780000f70000
attr_data {
	Name = .Thr6_User_Data_4v302 ,
	VA = 0x780000f70000 ,/* 0x780000f7ffc0 */
	RA = 0x0030830000 ,
	PA = 0x0030830000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 0000780000f70000 8000000030830441 */
	end_label   = Thr6_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v302_data_begin
Thr6_User_Data_4v302_data_begin:
Thr6_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v005 TEXT_VA=0x77b000112000
attr_text {
	Name = .Thr6_User_Text_4v005 ,
	VA = 0x77b000112000 ,/* 0x77b000113fc0 */
	RA = 0x01101d8000 ,
	PA = 0x6d101d8000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 000077b000113a1e 8000006d101d8080 */
	end_label   = Thr6_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v005_text_begin
Thr6_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v006 TEXT_VA=0x780000ee0000
attr_text {
	Name = .Thr6_User_Text_4v006 ,
	VA = 0x780000ee0000 ,/* 0x780000eeffc0 */
	RA = 0x0030ee0000 ,
	PA = 0x6430ee0000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 0000780000ee1578 8000006430ee0081 */
	end_label   = Thr6_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v006_text_begin
Thr6_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v103 DATA_VA=0x780000680000
attr_data {
	Name = .Thr6_User_Data_4v103 ,
	VA = 0x780000680000 ,/* 0x78000068ffc0 */
	RA = 0x0030aa0000 ,
	PA = 0x6430aa0000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 0000780000681578 8000006430aa0441 */
	end_label   = Thr6_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v103_data_begin
Thr6_User_Data_4v103_data_begin:
Thr6_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v203 DATA_VA=0x7800000c0000
attr_data {
	Name = .Thr6_User_Data_4v203 ,
	VA = 0x7800000c0000 ,/* 0x7800000cffc0 */
	RA = 0x0030ff0000 ,
	PA = 0x6430ff0000 ,
	TTE_Context = 0x019e ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x020000 ,
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
	/* DTTE_TAG_DATA = 00007800000c019e 8000006430ff0041 */
	end_label   = Thr6_User_Data_4v203_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v203_data_begin
Thr6_User_Data_4v203_data_begin:
Thr6_User_Data_4v203_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v303 DATA_VA=0x77b00014c000
attr_data {
	Name = .Thr6_User_Data_4v303 ,
	VA = 0x77b00014c000 ,/* 0x77b00014dfc0 */
	RA = 0x011014a000 ,
	PA = 0x6d1014a000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr6_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x1a0000 ,
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
	/* DTTE_TAG_DATA = 000077b00014c000 8000006d1014a440 */
	end_label   = Thr6_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v303_data_begin
Thr6_User_Data_4v303_data_begin:
Thr6_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v007 TEXT_VA=0x77b000104000
attr_text {
	Name = .Thr6_User_Text_4v007 ,
	VA = 0x77b000104000 ,/* 0x77b000105fc0 */
	RA = 0x0110122000 ,
	PA = 0x6d10122000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 000077b000105a1e 8000006d10122080 */
	end_label   = Thr6_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v007_text_begin
Thr6_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v008 TEXT_VA=0x790026000000
attr_text {
	Name = .Thr6_User_Text_4v008 ,
	VA = 0x790026000000 ,/* 0x7900263fffc0 */
	RA = 0x0135c00000 ,
	PA = 0x0135c00000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 0000790026001578 8000000135c00083 */
	end_label   = Thr6_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v008_text_begin
Thr6_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v104 DATA_VA=0x780000100000
attr_data {
	Name = .Thr6_User_Data_4v104 ,
	VA = 0x780000100000 ,/* 0x78000010ffc0 */
	RA = 0x0030940000 ,
	PA = 0x6430940000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 0000780000101578 8000006430940441 */
	end_label   = Thr6_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v104_data_begin
Thr6_User_Data_4v104_data_begin:
Thr6_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v204 DATA_VA=0x77b000152000
attr_data {
	Name = .Thr6_User_Data_4v204 ,
	VA = 0x77b000152000 ,/* 0x77b000153fc0 */
	RA = 0x0110014000 ,
	PA = 0x6d10014000 ,
	TTE_Context = 0x019e ,/* DATA_SECONDARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x020000 ,
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
	/* DTTE_TAG_DATA = 000077b0001529de 8000006d10014040 */
	end_label   = Thr6_User_Data_4v204_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v204_data_begin
Thr6_User_Data_4v204_data_begin:
Thr6_User_Data_4v204_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v009 TEXT_VA=0x7800001a0000
attr_text {
	Name = .Thr6_User_Text_4v009 ,
	VA = 0x7800001a0000 ,/* 0x7800001affc0 */
	RA = 0x0030490000 ,
	PA = 0x6430490000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 00007800001a1578 8000006430490081 */
	end_label   = Thr6_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v009_text_begin
Thr6_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v105 DATA_VA=0x77b0001da000
attr_data {
	Name = .Thr6_User_Data_4v105 ,
	VA = 0x77b0001da000 ,/* 0x77b0001dbfc0 */
	RA = 0x01101a6000 ,
	PA = 0x6d101a6000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b0001dba1e 8000006d101a6440 */
	end_label   = Thr6_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v105_data_begin
Thr6_User_Data_4v105_data_begin:
Thr6_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00a TEXT_VA=0x77b000056000
attr_text {
	Name = .Thr6_User_Text_4v00a ,
	VA = 0x77b000056000 ,/* 0x77b000057fc0 */
	RA = 0x0110126000 ,
	PA = 0x6d10126000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 000077b000057a1e 8000006d10126080 */
	end_label   = Thr6_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v00a_text_begin
Thr6_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v106 DATA_VA=0x7800003f0000
attr_data {
	Name = .Thr6_User_Data_4v106 ,
	VA = 0x7800003f0000 ,/* 0x7800003fffc0 */
	RA = 0x0030d10000 ,
	PA = 0x6430d10000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 00007800003f1578 8000006430d10441 */
	end_label   = Thr6_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v106_data_begin
Thr6_User_Data_4v106_data_begin:
Thr6_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00b TEXT_VA=0x79003bc00000
attr_text {
	Name = .Thr6_User_Text_4v00b ,
	VA = 0x79003bc00000 ,/* 0x79003bffffc0 */
	RA = 0x0136000000 ,
	PA = 0x0136000000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 000079003bc01578 8000000136000083 */
	end_label   = Thr6_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v00b_text_begin
Thr6_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v107 DATA_VA=0x77b0000d6000
attr_data {
	Name = .Thr6_User_Data_4v107 ,
	VA = 0x77b0000d6000 ,/* 0x77b0000d7fc0 */
	RA = 0x011009a000 ,
	PA = 0x6d1009a000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b0000d7a1e 8000006d1009a440 */
	end_label   = Thr6_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v107_data_begin
Thr6_User_Data_4v107_data_begin:
Thr6_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00c TEXT_VA=0x780000a70000
attr_text {
	Name = .Thr6_User_Text_4v00c ,
	VA = 0x780000a70000 ,/* 0x780000a7ffc0 */
	RA = 0x0030f30000 ,
	PA = 0x6430f30000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 0000780000a71578 8000006430f30081 */
	end_label   = Thr6_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v00c_text_begin
Thr6_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v108 DATA_VA=0x77b00012e000
attr_data {
	Name = .Thr6_User_Data_4v108 ,
	VA = 0x77b00012e000 ,/* 0x77b00012ffc0 */
	RA = 0x0110102000 ,
	PA = 0x6d10102000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b00012fa1e 8000006d10102440 */
	end_label   = Thr6_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v108_data_begin
Thr6_User_Data_4v108_data_begin:
Thr6_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00d TEXT_VA=0x780000920000
attr_text {
	Name = .Thr6_User_Text_4v00d ,
	VA = 0x780000920000 ,/* 0x78000092ffc0 */
	RA = 0x00307c0000 ,
	PA = 0x64307c0000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 0000780000921578 80000064307c0081 */
	end_label   = Thr6_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v00d_text_begin
Thr6_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v109 DATA_VA=0x77b000028000
attr_data {
	Name = .Thr6_User_Data_4v109 ,
	VA = 0x77b000028000 ,/* 0x77b000029fc0 */
	RA = 0x01100de000 ,
	PA = 0x6d100de000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b000029a1e 8000006d100de440 */
	end_label   = Thr6_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v109_data_begin
Thr6_User_Data_4v109_data_begin:
Thr6_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v00e TEXT_VA=0x77b00015a000
attr_text {
	Name = .Thr6_User_Text_4v00e ,
	VA = 0x77b00015a000 ,/* 0x77b00015bfc0 */
	RA = 0x0110128000 ,
	PA = 0x6d10128000 ,
	TTE_Context = 0x1578 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x120000 ,
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
	/* ITTE_TAG_DATA = 000077b00015ba1e 8000006d10128080 */
	end_label   = Thr6_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr6_User_Text_4v00e_text_begin
Thr6_User_Text_4v00e_text_begin:
	EXIT_GOOD
Thr6_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10a DATA_VA=0x780000ea0000
attr_data {
	Name = .Thr6_User_Data_4v10a ,
	VA = 0x780000ea0000 ,/* 0x780000eaffc0 */
	RA = 0x00303e0000 ,
	PA = 0x64303e0000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 0000780000ea1578 80000064303e0441 */
	end_label   = Thr6_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10a_data_begin
Thr6_User_Data_4v10a_data_begin:
Thr6_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10b DATA_VA=0x77b000014000
attr_data {
	Name = .Thr6_User_Data_4v10b ,
	VA = 0x77b000014000 ,/* 0x77b000015fc0 */
	RA = 0x01100c2000 ,
	PA = 0x6d100c2000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b000015a1e 8000006d100c2440 */
	end_label   = Thr6_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10b_data_begin
Thr6_User_Data_4v10b_data_begin:
Thr6_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10c DATA_VA=0x77b00002a000
attr_data {
	Name = .Thr6_User_Data_4v10c ,
	VA = 0x77b00002a000 ,/* 0x77b00002bfc0 */
	RA = 0x01101f0000 ,
	PA = 0x6d101f0000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b00002ba1e 8000006d101f0440 */
	end_label   = Thr6_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10c_data_begin
Thr6_User_Data_4v10c_data_begin:
Thr6_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10d DATA_VA=0x790015c00000
attr_data {
	Name = .Thr6_User_Data_4v10d ,
	VA = 0x790015c00000 ,/* 0x790015ffffc0 */
	RA = 0x0136400000 ,
	PA = 0x0136400000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 0000790015c01578 8000000136400443 */
	end_label   = Thr6_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10d_data_begin
Thr6_User_Data_4v10d_data_begin:
Thr6_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10e DATA_VA=0x77b0000da000
attr_data {
	Name = .Thr6_User_Data_4v10e ,
	VA = 0x77b0000da000 ,/* 0x77b0000dbfc0 */
	RA = 0x01101c2000 ,
	PA = 0x6d101c2000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b0000dba1e 8000006d101c2440 */
	end_label   = Thr6_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10e_data_begin
Thr6_User_Data_4v10e_data_begin:
Thr6_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v10f DATA_VA=0x7800009a0000
attr_data {
	Name = .Thr6_User_Data_4v10f ,
	VA = 0x7800009a0000 ,/* 0x7800009affc0 */
	RA = 0x0030df0000 ,
	PA = 0x6430df0000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 00007800009a1578 8000006430df0441 */
	end_label   = Thr6_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v10f_data_begin
Thr6_User_Data_4v10f_data_begin:
Thr6_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v110 DATA_VA=0x77b000192000
attr_data {
	Name = .Thr6_User_Data_4v110 ,
	VA = 0x77b000192000 ,/* 0x77b000193fc0 */
	RA = 0x0110084000 ,
	PA = 0x6d10084000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b000193a1e 8000006d10084440 */
	end_label   = Thr6_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v110_data_begin
Thr6_User_Data_4v110_data_begin:
Thr6_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v111 DATA_VA=0x79003ac00000
attr_data {
	Name = .Thr6_User_Data_4v111 ,
	VA = 0x79003ac00000 ,/* 0x79003affffc0 */
	RA = 0x0136800000 ,
	PA = 0x0136800000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000079003ac01578 8000000136800443 */
	end_label   = Thr6_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v111_data_begin
Thr6_User_Data_4v111_data_begin:
Thr6_User_Data_4v111_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v112 DATA_VA=0x77b000054000
attr_data {
	Name = .Thr6_User_Data_4v112 ,
	VA = 0x77b000054000 ,/* 0x77b000055fc0 */
	RA = 0x01101a0000 ,
	PA = 0x6d101a0000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b000055a1e 8000006d101a0440 */
	end_label   = Thr6_User_Data_4v112_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v112_data_begin
Thr6_User_Data_4v112_data_begin:
Thr6_User_Data_4v112_data_end:
/*********************************************************************/
SECTION .Thr6_User_Data_4v113 DATA_VA=0x77b00011e000
attr_data {
	Name = .Thr6_User_Data_4v113 ,
	VA = 0x77b00011e000 ,/* 0x77b00011ffc0 */
	RA = 0x01100ea000 ,
	PA = 0x6d100ea000 ,
	TTE_Context = 0x1578 ,/* DATA_PRIMARY */
	thr6_nz_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x050000 ,
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
	/* DTTE_TAG_DATA = 000077b00011fa1e 8000006d100ea440 */
	end_label   = Thr6_User_Data_4v113_data_end ,
	compressimage ,
	}
.data
.global Thr6_User_Data_4v113_data_begin
Thr6_User_Data_4v113_data_begin:
Thr6_User_Data_4v113_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x7c0000800000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	VA = 0x7c0000800000 ,/* 0x7c000080ffc0 */
	RA = 0x0040080000 ,
	PA = 0x7840080000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00007c0000801c87 8000007840080081 */
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
SECTION .Thr7_User_Data_4v100 DATA_VA=0x7c0000060000
attr_data {
	Name = .Thr7_User_Data_4v100 ,
	VA = 0x7c0000060000 ,/* 0x7c000006ffc0 */
	RA = 0x0040420000 ,
	PA = 0x7840420000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007c0000061c87 8000007840420441 */
	end_label   = Thr7_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v100_data_begin
Thr7_User_Data_4v100_data_begin:
Thr7_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v200 DATA_VA=0x7d002a000000
attr_data {
	Name = .Thr7_User_Data_4v200 ,
	VA = 0x7d002a000000 ,/* 0x7d002a3fffc0 */
	RA = 0x0147000000 ,
	PA = 0x7d47000000 ,
	TTE_Context = 0x1361 ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
	TTE_IE      = 0 ,
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
	/* DTTE_TAG_DATA = 00007d002a000267 8000007d47000043 */
	end_label   = Thr7_User_Data_4v200_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v200_data_begin
Thr7_User_Data_4v200_data_begin:
Thr7_User_Data_4v200_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v300 DATA_VA=0x7c00007b0000
attr_data {
	Name = .Thr7_User_Data_4v300 ,
	VA = 0x7c00007b0000 ,/* 0x7c00007bffc0 */
	RA = 0x0040b90000 ,
	PA = 0x0040b90000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x150000 ,
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
	/* DTTE_TAG_DATA = 00007c00007b0000 8000000040b90441 */
	end_label   = Thr7_User_Data_4v300_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v300_data_begin
Thr7_User_Data_4v300_data_begin:
Thr7_User_Data_4v300_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v001 TEXT_VA=0x7d0007800000
attr_text {
	Name = .Thr7_User_Text_4v001 ,
	VA = 0x7d0007800000 ,/* 0x7d0007bfffc0 */
	RA = 0x0147400000 ,
	PA = 0x7d47400000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007d0007801c87 8000007d47400083 */
	end_label   = Thr7_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v001_text_begin
Thr7_User_Text_4v001_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v400 TEXT_VA=0x7d0013400000
attr_text {
	Name = .Thr7_User_Text_4v400 ,
	VA = 0x7d0013400000 ,/* 0x7d00137fffc0 */
	RA = 0x0147800000 ,
	PA = 0x0147800000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00007d0013400000 8000000147800083 */
	end_label   = Thr7_User_Text_4v400_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v400_text_begin
Thr7_User_Text_4v400_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v400_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v002 TEXT_VA=0x7c0000180000
attr_text {
	Name = .Thr7_User_Text_4v002 ,
	VA = 0x7c0000180000 ,/* 0x7c000018ffc0 */
	RA = 0x0040f70000 ,
	PA = 0x7840f70000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007c0000181c87 8000007840f70081 */
	end_label   = Thr7_User_Text_4v002_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v002_text_begin
Thr7_User_Text_4v002_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v002_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v101 DATA_VA=0x7c0000dc0000
attr_data {
	Name = .Thr7_User_Data_4v101 ,
	VA = 0x7c0000dc0000 ,/* 0x7c0000dcffc0 */
	RA = 0x0040050000 ,
	PA = 0x7840050000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007c0000dc1c87 8000007840050441 */
	end_label   = Thr7_User_Data_4v101_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v101_data_begin
Thr7_User_Data_4v101_data_begin:
Thr7_User_Data_4v101_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v201 DATA_VA=0x7bc0001f4000
attr_data {
	Name = .Thr7_User_Data_4v201 ,
	VA = 0x7bc0001f4000 ,/* 0x7bc0001f5fc0 */
	RA = 0x012017c000 ,
	PA = 0x012017c000 ,
	TTE_Context = 0x1361 ,/* DATA_SECONDARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x070000 ,
	TTE_IE      = 0 ,
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
	/* DTTE_TAG_DATA = 00007bc0001f4267 800000012017c040 */
	end_label   = Thr7_User_Data_4v201_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v201_data_begin
Thr7_User_Data_4v201_data_begin:
Thr7_User_Data_4v201_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v301 DATA_VA=0x7d0032800000
attr_data {
	Name = .Thr7_User_Data_4v301 ,
	VA = 0x7d0032800000 ,/* 0x7d0032bfffc0 */
	RA = 0x0147c00000 ,
	PA = 0x0147c00000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x150000 ,
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
	/* DTTE_TAG_DATA = 00007d0032800000 8000000147c00443 */
	end_label   = Thr7_User_Data_4v301_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v301_data_begin
Thr7_User_Data_4v301_data_begin:
Thr7_User_Data_4v301_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v003 TEXT_VA=0x7bc000178000
attr_text {
	Name = .Thr7_User_Text_4v003 ,
	VA = 0x7bc000178000 ,/* 0x7bc000179fc0 */
	RA = 0x012003e000 ,
	PA = 0x012003e000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007bc000179c87 800000012003e080 */
	end_label   = Thr7_User_Text_4v003_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v003_text_begin
Thr7_User_Text_4v003_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v003_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v401 TEXT_VA=0x7c0000720000
attr_text {
	Name = .Thr7_User_Text_4v401 ,
	VA = 0x7c0000720000 ,/* 0x7c000072ffc0 */
	RA = 0x0040810000 ,
	PA = 0x0040810000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr7_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00007c0000720000 8000000040810081 */
	end_label   = Thr7_User_Text_4v401_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v401_text_begin
Thr7_User_Text_4v401_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v401_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v004 TEXT_VA=0x7d001b000000
attr_text {
	Name = .Thr7_User_Text_4v004 ,
	VA = 0x7d001b000000 ,/* 0x7d001b3fffc0 */
	RA = 0x0148000000 ,
	PA = 0x7d48000000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007d001b001c87 8000007d48000083 */
	end_label   = Thr7_User_Text_4v004_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v004_text_begin
Thr7_User_Text_4v004_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v004_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v102 DATA_VA=0x7c0000120000
attr_data {
	Name = .Thr7_User_Data_4v102 ,
	VA = 0x7c0000120000 ,/* 0x7c000012ffc0 */
	RA = 0x0040fe0000 ,
	PA = 0x7840fe0000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007c0000121c87 8000007840fe0441 */
	end_label   = Thr7_User_Data_4v102_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v102_data_begin
Thr7_User_Data_4v102_data_begin:
Thr7_User_Data_4v102_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v302 DATA_VA=0x7e0440000000
attr_data {
	Name = .Thr7_User_Data_4v302 ,
	VA = 0x7e0440000000 ,/* 0x7e044fffffc0 */
	RA = 0x0390000000 ,
	PA = 0x7f90000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_1 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x150000 ,
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
	/* DTTE_TAG_DATA = 00007e0440000000 8000007f90000445 */
	end_label   = Thr7_User_Data_4v302_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v302_data_begin
Thr7_User_Data_4v302_data_begin:
Thr7_User_Data_4v302_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v005 TEXT_VA=0x7bc0000dc000
attr_text {
	Name = .Thr7_User_Text_4v005 ,
	VA = 0x7bc0000dc000 ,/* 0x7bc0000ddfc0 */
	RA = 0x01200b6000 ,
	PA = 0x01200b6000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007bc0000ddc87 80000001200b6080 */
	end_label   = Thr7_User_Text_4v005_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v005_text_begin
Thr7_User_Text_4v005_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v005_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v402 TEXT_VA=0x7d002a800000
attr_text {
	Name = .Thr7_User_Text_4v402 ,
	VA = 0x7d002a800000 ,/* 0x7d002abfffc0 */
	RA = 0x0148c00000 ,
	PA = 0x0148c00000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00007d002a800000 8000000148c00083 */
	end_label   = Thr7_User_Text_4v402_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v402_text_begin
Thr7_User_Text_4v402_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v402_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v006 TEXT_VA=0x7d003f000000
attr_text {
	Name = .Thr7_User_Text_4v006 ,
	VA = 0x7d003f000000 ,/* 0x7d003f3fffc0 */
	RA = 0x014c800000 ,
	PA = 0x7d4c800000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007d003f001c87 8000007d4c800083 */
	end_label   = Thr7_User_Text_4v006_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v006_text_begin
Thr7_User_Text_4v006_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v006_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v103 DATA_VA=0x7c0000020000
attr_data {
	Name = .Thr7_User_Data_4v103 ,
	VA = 0x7c0000020000 ,/* 0x7c000002ffc0 */
	RA = 0x0040d70000 ,
	PA = 0x7840d70000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007c0000021c87 8000007840d70441 */
	end_label   = Thr7_User_Data_4v103_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v103_data_begin
Thr7_User_Data_4v103_data_begin:
Thr7_User_Data_4v103_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v303 DATA_VA=0x7d003f400000
attr_data {
	Name = .Thr7_User_Data_4v303 ,
	VA = 0x7d003f400000 ,/* 0x7d003f7fffc0 */
	RA = 0x014d000000 ,
	PA = 0x014d000000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_0 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x150000 ,
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
	/* DTTE_TAG_DATA = 00007d003f400000 800000014d000443 */
	end_label   = Thr7_User_Data_4v303_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v303_data_begin
Thr7_User_Data_4v303_data_begin:
Thr7_User_Data_4v303_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v007 TEXT_VA=0x7bc000130000
attr_text {
	Name = .Thr7_User_Text_4v007 ,
	VA = 0x7bc000130000 ,/* 0x7bc000131fc0 */
	RA = 0x0120024000 ,
	PA = 0x0120024000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007bc000131c87 8000000120024080 */
	end_label   = Thr7_User_Text_4v007_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v007_text_begin
Thr7_User_Text_4v007_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v007_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v403 TEXT_VA=0x7bc000046000
attr_text {
	Name = .Thr7_User_Text_4v403 ,
	VA = 0x7bc000046000 ,/* 0x7bc000047fc0 */
	RA = 0x0120182000 ,
	PA = 0x7d20182000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr7_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00007bc000046000 8000007d20182080 */
	end_label   = Thr7_User_Text_4v403_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v403_text_begin
Thr7_User_Text_4v403_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v403_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v008 TEXT_VA=0x7bc00013a000
attr_text {
	Name = .Thr7_User_Text_4v008 ,
	VA = 0x7bc00013a000 ,/* 0x7bc00013bfc0 */
	RA = 0x01200e6000 ,
	PA = 0x01200e6000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007bc00013bc87 80000001200e6080 */
	end_label   = Thr7_User_Text_4v008_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v008_text_begin
Thr7_User_Text_4v008_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v008_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v104 DATA_VA=0x7bc0001b0000
attr_data {
	Name = .Thr7_User_Data_4v104 ,
	VA = 0x7bc0001b0000 ,/* 0x7bc0001b1fc0 */
	RA = 0x01200b2000 ,
	PA = 0x01200b2000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007bc0001b1c87 80000001200b2440 */
	end_label   = Thr7_User_Data_4v104_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v104_data_begin
Thr7_User_Data_4v104_data_begin:
Thr7_User_Data_4v104_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v304 DATA_VA=0x7c0000f90000
attr_data {
	Name = .Thr7_User_Data_4v304 ,
	VA = 0x7c0000f90000 ,/* 0x7c0000f9ffc0 */
	RA = 0x00407b0000 ,
	PA = 0x00407b0000 ,
	TTE_Context = 0x0000 ,/* DATA_NUCLEUS */
	thr7_z_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x150000 ,
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
	/* DTTE_TAG_DATA = 00007c0000f90000 80000000407b0441 */
	end_label   = Thr7_User_Data_4v304_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v304_data_begin
Thr7_User_Data_4v304_data_begin:
Thr7_User_Data_4v304_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v009 TEXT_VA=0x7bc000084000
attr_text {
	Name = .Thr7_User_Text_4v009 ,
	VA = 0x7bc000084000 ,/* 0x7bc000085fc0 */
	RA = 0x0120090000 ,
	PA = 0x0120090000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007bc000085c87 8000000120090080 */
	end_label   = Thr7_User_Text_4v009_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v009_text_begin
Thr7_User_Text_4v009_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v009_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v404 TEXT_VA=0x7bc0000b6000
attr_text {
	Name = .Thr7_User_Text_4v404 ,
	VA = 0x7bc0000b6000 ,/* 0x7bc0000b7fc0 */
	RA = 0x01201a2000 ,
	PA = 0x7d201a2000 ,
	TTE_Context = 0x0 ,/* TEXT_NUCLEUS */
	thr7_z_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 1 ,
	TTE_Soft    = 0x0c0000 ,
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
	/* ITTE_TAG_DATA = 00007bc0000b6000 8000007d201a2080 */
	end_label   = Thr7_User_Text_4v404_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v404_text_begin
Thr7_User_Text_4v404_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v404_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v105 DATA_VA=0x7bc000086000
attr_data {
	Name = .Thr7_User_Data_4v105 ,
	VA = 0x7bc000086000 ,/* 0x7bc000087fc0 */
	RA = 0x012018c000 ,
	PA = 0x012018c000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007bc000087c87 800000012018c440 */
	end_label   = Thr7_User_Data_4v105_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v105_data_begin
Thr7_User_Data_4v105_data_begin:
Thr7_User_Data_4v105_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00a TEXT_VA=0x7c00003a0000
attr_text {
	Name = .Thr7_User_Text_4v00a ,
	VA = 0x7c00003a0000 ,/* 0x7c00003affc0 */
	RA = 0x0040f40000 ,
	PA = 0x7840f40000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00007c00003a1c87 8000007840f40081 */
	end_label   = Thr7_User_Text_4v00a_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00a_text_begin
Thr7_User_Text_4v00a_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v00a_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v106 DATA_VA=0x7bc000158000
attr_data {
	Name = .Thr7_User_Data_4v106 ,
	VA = 0x7bc000158000 ,/* 0x7bc000159fc0 */
	RA = 0x01200b4000 ,
	PA = 0x01200b4000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007bc000159c87 80000001200b4440 */
	end_label   = Thr7_User_Data_4v106_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v106_data_begin
Thr7_User_Data_4v106_data_begin:
Thr7_User_Data_4v106_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00b TEXT_VA=0x7bc000148000
attr_text {
	Name = .Thr7_User_Text_4v00b ,
	VA = 0x7bc000148000 ,/* 0x7bc000149fc0 */
	RA = 0x01201cc000 ,
	PA = 0x01201cc000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007bc000149c87 80000001201cc080 */
	end_label   = Thr7_User_Text_4v00b_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00b_text_begin
Thr7_User_Text_4v00b_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v00b_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v107 DATA_VA=0x7c0000a20000
attr_data {
	Name = .Thr7_User_Data_4v107 ,
	VA = 0x7c0000a20000 ,/* 0x7c0000a2ffc0 */
	RA = 0x00409a0000 ,
	PA = 0x78409a0000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007c0000a21c87 80000078409a0441 */
	end_label   = Thr7_User_Data_4v107_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v107_data_begin
Thr7_User_Data_4v107_data_begin:
Thr7_User_Data_4v107_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00c TEXT_VA=0x7c00009b0000
attr_text {
	Name = .Thr7_User_Text_4v00c ,
	VA = 0x7c00009b0000 ,/* 0x7c00009bffc0 */
	RA = 0x0040bb0000 ,
	PA = 0x7840bb0000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00007c00009b1c87 8000007840bb0081 */
	end_label   = Thr7_User_Text_4v00c_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00c_text_begin
Thr7_User_Text_4v00c_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v00c_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v108 DATA_VA=0x7bc00013e000
attr_data {
	Name = .Thr7_User_Data_4v108 ,
	VA = 0x7bc00013e000 ,/* 0x7bc00013ffc0 */
	RA = 0x01200ca000 ,
	PA = 0x01200ca000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007bc00013fc87 80000001200ca440 */
	end_label   = Thr7_User_Data_4v108_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v108_data_begin
Thr7_User_Data_4v108_data_begin:
Thr7_User_Data_4v108_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00d TEXT_VA=0x7c00002f0000
attr_text {
	Name = .Thr7_User_Text_4v00d ,
	VA = 0x7c00002f0000 ,/* 0x7c00002fffc0 */
	RA = 0x0040bf0000 ,
	PA = 0x7840bf0000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00007c00002f1c87 8000007840bf0081 */
	end_label   = Thr7_User_Text_4v00d_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00d_text_begin
Thr7_User_Text_4v00d_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v00d_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v109 DATA_VA=0x7bc000120000
attr_data {
	Name = .Thr7_User_Data_4v109 ,
	VA = 0x7bc000120000 ,/* 0x7bc000121fc0 */
	RA = 0x0120110000 ,
	PA = 0x0120110000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007bc000121c87 8000000120110440 */
	end_label   = Thr7_User_Data_4v109_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v109_data_begin
Thr7_User_Data_4v109_data_begin:
Thr7_User_Data_4v109_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00e TEXT_VA=0x7bc000174000
attr_text {
	Name = .Thr7_User_Text_4v00e ,
	VA = 0x7bc000174000 ,/* 0x7bc000175fc0 */
	RA = 0x012015a000 ,
	PA = 0x012015a000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007bc000175c87 800000012015a080 */
	end_label   = Thr7_User_Text_4v00e_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00e_text_begin
Thr7_User_Text_4v00e_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v00e_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10a DATA_VA=0x7bc000134000
attr_data {
	Name = .Thr7_User_Data_4v10a ,
	VA = 0x7bc000134000 ,/* 0x7bc000135fc0 */
	RA = 0x01201be000 ,
	PA = 0x01201be000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007bc000135c87 80000001201be440 */
	end_label   = Thr7_User_Data_4v10a_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10a_data_begin
Thr7_User_Data_4v10a_data_begin:
Thr7_User_Data_4v10a_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v00f TEXT_VA=0x7c0000160000
attr_text {
	Name = .Thr7_User_Text_4v00f ,
	VA = 0x7c0000160000 ,/* 0x7c000016ffc0 */
	RA = 0x0040070000 ,
	PA = 0x7840070000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	TTE_Size    = 1 ,
	/* ITTE_TAG_DATA = 00007c0000161c87 8000007840070081 */
	end_label   = Thr7_User_Text_4v00f_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v00f_text_begin
Thr7_User_Text_4v00f_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v00f_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10b DATA_VA=0x7c00001d0000
attr_data {
	Name = .Thr7_User_Data_4v10b ,
	VA = 0x7c00001d0000 ,/* 0x7c00001dffc0 */
	RA = 0x0040200000 ,
	PA = 0x7840200000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007c00001d1c87 8000007840200441 */
	end_label   = Thr7_User_Data_4v10b_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10b_data_begin
Thr7_User_Data_4v10b_data_begin:
Thr7_User_Data_4v10b_data_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v010 TEXT_VA=0x7bc00013c000
attr_text {
	Name = .Thr7_User_Text_4v010 ,
	VA = 0x7bc00013c000 ,/* 0x7bc00013dfc0 */
	RA = 0x012016c000 ,
	PA = 0x012016c000 ,
	TTE_Context = 0x114a ,/* TEXT_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x000000 ,
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
	/* ITTE_TAG_DATA = 00007bc00013dc87 800000012016c080 */
	end_label   = Thr7_User_Text_4v010_text_end ,
	compressimage ,
	}
.text
.global Thr7_User_Text_4v010_text_begin
Thr7_User_Text_4v010_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v010_text_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10c DATA_VA=0x7c0000240000
attr_data {
	Name = .Thr7_User_Data_4v10c ,
	VA = 0x7c0000240000 ,/* 0x7c000024ffc0 */
	RA = 0x00402e0000 ,
	PA = 0x78402e0000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007c0000241c87 80000078402e0441 */
	end_label   = Thr7_User_Data_4v10c_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10c_data_begin
Thr7_User_Data_4v10c_data_begin:
Thr7_User_Data_4v10c_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10d DATA_VA=0x7bc0001a6000
attr_data {
	Name = .Thr7_User_Data_4v10d ,
	VA = 0x7bc0001a6000 ,/* 0x7bc0001a7fc0 */
	RA = 0x01200ce000 ,
	PA = 0x01200ce000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007bc0001a7c87 80000001200ce440 */
	end_label   = Thr7_User_Data_4v10d_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10d_data_begin
Thr7_User_Data_4v10d_data_begin:
Thr7_User_Data_4v10d_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10e DATA_VA=0x7bc0000fe000
attr_data {
	Name = .Thr7_User_Data_4v10e ,
	VA = 0x7bc0000fe000 ,/* 0x7bc0000fffc0 */
	RA = 0x0120112000 ,
	PA = 0x0120112000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007bc0000ffc87 8000000120112440 */
	end_label   = Thr7_User_Data_4v10e_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10e_data_begin
Thr7_User_Data_4v10e_data_begin:
Thr7_User_Data_4v10e_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v10f DATA_VA=0x7c0000610000
attr_data {
	Name = .Thr7_User_Data_4v10f ,
	VA = 0x7c0000610000 ,/* 0x7c000061ffc0 */
	RA = 0x0040b00000 ,
	PA = 0x7840b00000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007c0000611c87 8000007840b00441 */
	end_label   = Thr7_User_Data_4v10f_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v10f_data_begin
Thr7_User_Data_4v10f_data_begin:
Thr7_User_Data_4v10f_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v110 DATA_VA=0x7bc000006000
attr_data {
	Name = .Thr7_User_Data_4v110 ,
	VA = 0x7bc000006000 ,/* 0x7bc000007fc0 */
	RA = 0x01201a4000 ,
	PA = 0x01201a4000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_2 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007bc000007c87 80000001201a4440 */
	end_label   = Thr7_User_Data_4v110_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v110_data_begin
Thr7_User_Data_4v110_data_begin:
Thr7_User_Data_4v110_data_end:
/*********************************************************************/
SECTION .Thr7_User_Data_4v111 DATA_VA=0x7c0000f60000
attr_data {
	Name = .Thr7_User_Data_4v111 ,
	VA = 0x7c0000f60000 ,/* 0x7c0000f6ffc0 */
	RA = 0x0040610000 ,
	PA = 0x7840610000 ,
	TTE_Context = 0x114a ,/* DATA_PRIMARY */
	thr7_nz_ctx_tsb_3 ,
	TTE_V       = 1 ,
	TTE_NFO     = 0 ,
	TTE_L       = 0 ,
	TTE_Soft    = 0x060000 ,
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
	/* DTTE_TAG_DATA = 00007c0000f61c87 8000007840610441 */
	end_label   = Thr7_User_Data_4v111_data_end ,
	compressimage ,
	}
.data
.global Thr7_User_Data_4v111_data_begin
Thr7_User_Data_4v111_data_begin:
Thr7_User_Data_4v111_data_end:
