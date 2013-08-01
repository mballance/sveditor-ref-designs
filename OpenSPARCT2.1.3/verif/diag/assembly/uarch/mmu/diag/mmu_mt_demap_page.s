/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_mt_demap_page.s
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
#define THR0_Z_CTX_TSB_CONFIG_0  0x8000000001000150
#define THR0_Z_CTX_TSB_CONFIG_1  0x8000000001010000
#define THR0_Z_CTX_TSB_CONFIG_2  0x8000000001020110
#define THR0_Z_CTX_TSB_CONFIG_3  0x8000000001030130
#define THR0_NZ_CTX_TSB_CONFIG_0 0x8000000001200050
#define THR0_NZ_CTX_TSB_CONFIG_1 0x8000000001210000
#define THR0_NZ_CTX_TSB_CONFIG_2 0x8000000001220110
#define THR0_NZ_CTX_TSB_CONFIG_3 0x8000000001230130
#define THR1_Z_CTX_TSB_CONFIG_0  0x8000000001040000
#define THR1_Z_CTX_TSB_CONFIG_1  0x8000000001050010
#define THR1_Z_CTX_TSB_CONFIG_2  0x8000000001060130
#define THR1_Z_CTX_TSB_CONFIG_3  0x8000000001070050
#define THR1_NZ_CTX_TSB_CONFIG_0 0x8000000001240150
#define THR1_NZ_CTX_TSB_CONFIG_1 0x8000000001250000
#define THR1_NZ_CTX_TSB_CONFIG_2 0x8000000001260110
#define THR1_NZ_CTX_TSB_CONFIG_3 0x8000000001270130
#define THR2_Z_CTX_TSB_CONFIG_0  0x8000000001080030
#define THR2_Z_CTX_TSB_CONFIG_1  0x8000000001090150
#define THR2_Z_CTX_TSB_CONFIG_2  0x80000000010a0000
#define THR2_Z_CTX_TSB_CONFIG_3  0x80000000010b0010
#define THR2_NZ_CTX_TSB_CONFIG_0 0x8000000001280010
#define THR2_NZ_CTX_TSB_CONFIG_1 0x8000000001290130
#define THR2_NZ_CTX_TSB_CONFIG_2 0x80000000012a0150
#define THR2_NZ_CTX_TSB_CONFIG_3 0x80000000012b0000
#define THR3_Z_CTX_TSB_CONFIG_0  0x80000000010c0030
#define THR3_Z_CTX_TSB_CONFIG_1  0x80000000010d0150
#define THR3_Z_CTX_TSB_CONFIG_2  0x80000000010e0000
#define THR3_Z_CTX_TSB_CONFIG_3  0x80000000010f0110
#define THR3_NZ_CTX_TSB_CONFIG_0 0x80000000012c0000
#define THR3_NZ_CTX_TSB_CONFIG_1 0x80000000012d0110
#define THR3_NZ_CTX_TSB_CONFIG_2 0x80000000012e0030
#define THR3_NZ_CTX_TSB_CONFIG_3 0x80000000012f0050
#define THR4_Z_CTX_TSB_CONFIG_0  0x8000000001100110
#define THR4_Z_CTX_TSB_CONFIG_1  0x8000000001110130
#define THR4_Z_CTX_TSB_CONFIG_2  0x8000000001120050
#define THR4_Z_CTX_TSB_CONFIG_3  0x8000000001130000
#define THR4_NZ_CTX_TSB_CONFIG_0 0x8000000001300130
#define THR4_NZ_CTX_TSB_CONFIG_1 0x8000000001310150
#define THR4_NZ_CTX_TSB_CONFIG_2 0x8000000001320000
#define THR4_NZ_CTX_TSB_CONFIG_3 0x8000000001330110
#define THR5_Z_CTX_TSB_CONFIG_0  0x8000000001140100
#define THR5_Z_CTX_TSB_CONFIG_1  0x8000000001150110
#define THR5_Z_CTX_TSB_CONFIG_2  0x8000000001160030
#define THR5_Z_CTX_TSB_CONFIG_3  0x8000000001170150
#define THR5_NZ_CTX_TSB_CONFIG_0 0x8000000001340010
#define THR5_NZ_CTX_TSB_CONFIG_1 0x8000000001350030
#define THR5_NZ_CTX_TSB_CONFIG_2 0x8000000001360050
#define THR5_NZ_CTX_TSB_CONFIG_3 0x8000000001370000
#define THR6_Z_CTX_TSB_CONFIG_0  0x8000000001180150
#define THR6_Z_CTX_TSB_CONFIG_1  0x8000000001190100
#define THR6_Z_CTX_TSB_CONFIG_2  0x80000000011a0010
#define THR6_Z_CTX_TSB_CONFIG_3  0x80000000011b0030
#define THR6_NZ_CTX_TSB_CONFIG_0 0x8000000001380150
#define THR6_NZ_CTX_TSB_CONFIG_1 0x8000000001390000
#define THR6_NZ_CTX_TSB_CONFIG_2 0x80000000013a0110
#define THR6_NZ_CTX_TSB_CONFIG_3 0x80000000013b0030
#define THR7_Z_CTX_TSB_CONFIG_0  0x80000000011c0030
#define THR7_Z_CTX_TSB_CONFIG_1  0x80000000011d0150
#define THR7_Z_CTX_TSB_CONFIG_2  0x80000000011e0100
#define THR7_Z_CTX_TSB_CONFIG_3  0x80000000011f0010
#define THR7_NZ_CTX_TSB_CONFIG_0 0x80000000013c0130
#define THR7_NZ_CTX_TSB_CONFIG_1 0x80000000013d0150
#define THR7_NZ_CTX_TSB_CONFIG_2 0x80000000013e0000
#define THR7_NZ_CTX_TSB_CONFIG_3 0x80000000013f0110
#else
#define THR0_Z_CTX_TSB_CONFIG_0  0x0000000001000150
#define THR0_Z_CTX_TSB_CONFIG_1  0x0000000001010000
#define THR0_Z_CTX_TSB_CONFIG_2  0x0000000001020110
#define THR0_Z_CTX_TSB_CONFIG_3  0x0000000001030130
#define THR0_NZ_CTX_TSB_CONFIG_0 0x0000000001200050
#define THR0_NZ_CTX_TSB_CONFIG_1 0x0000000001210000
#define THR0_NZ_CTX_TSB_CONFIG_2 0x0000000001220110
#define THR0_NZ_CTX_TSB_CONFIG_3 0x0000000001230130
#define THR1_Z_CTX_TSB_CONFIG_0  0x0000000001040000
#define THR1_Z_CTX_TSB_CONFIG_1  0x0000000001050010
#define THR1_Z_CTX_TSB_CONFIG_2  0x0000000001060130
#define THR1_Z_CTX_TSB_CONFIG_3  0x0000000001070050
#define THR1_NZ_CTX_TSB_CONFIG_0 0x0000000001240150
#define THR1_NZ_CTX_TSB_CONFIG_1 0x0000000001250000
#define THR1_NZ_CTX_TSB_CONFIG_2 0x0000000001260110
#define THR1_NZ_CTX_TSB_CONFIG_3 0x0000000001270130
#define THR2_Z_CTX_TSB_CONFIG_0  0x0000000001080030
#define THR2_Z_CTX_TSB_CONFIG_1  0x0000000001090150
#define THR2_Z_CTX_TSB_CONFIG_2  0x00000000010a0000
#define THR2_Z_CTX_TSB_CONFIG_3  0x00000000010b0010
#define THR2_NZ_CTX_TSB_CONFIG_0 0x0000000001280010
#define THR2_NZ_CTX_TSB_CONFIG_1 0x0000000001290130
#define THR2_NZ_CTX_TSB_CONFIG_2 0x00000000012a0150
#define THR2_NZ_CTX_TSB_CONFIG_3 0x00000000012b0000
#define THR3_Z_CTX_TSB_CONFIG_0  0x00000000010c0030
#define THR3_Z_CTX_TSB_CONFIG_1  0x00000000010d0150
#define THR3_Z_CTX_TSB_CONFIG_2  0x00000000010e0000
#define THR3_Z_CTX_TSB_CONFIG_3  0x00000000010f0110
#define THR3_NZ_CTX_TSB_CONFIG_0 0x00000000012c0000
#define THR3_NZ_CTX_TSB_CONFIG_1 0x00000000012d0110
#define THR3_NZ_CTX_TSB_CONFIG_2 0x00000000012e0030
#define THR3_NZ_CTX_TSB_CONFIG_3 0x00000000012f0050
#define THR4_Z_CTX_TSB_CONFIG_0  0x0000000001100110
#define THR4_Z_CTX_TSB_CONFIG_1  0x0000000001110130
#define THR4_Z_CTX_TSB_CONFIG_2  0x0000000001120050
#define THR4_Z_CTX_TSB_CONFIG_3  0x0000000001130000
#define THR4_NZ_CTX_TSB_CONFIG_0 0x0000000001300130
#define THR4_NZ_CTX_TSB_CONFIG_1 0x0000000001310150
#define THR4_NZ_CTX_TSB_CONFIG_2 0x0000000001320000
#define THR4_NZ_CTX_TSB_CONFIG_3 0x0000000001330110
#define THR5_Z_CTX_TSB_CONFIG_0  0x0000000001140100
#define THR5_Z_CTX_TSB_CONFIG_1  0x0000000001150110
#define THR5_Z_CTX_TSB_CONFIG_2  0x0000000001160030
#define THR5_Z_CTX_TSB_CONFIG_3  0x0000000001170150
#define THR5_NZ_CTX_TSB_CONFIG_0 0x0000000001340010
#define THR5_NZ_CTX_TSB_CONFIG_1 0x0000000001350030
#define THR5_NZ_CTX_TSB_CONFIG_2 0x0000000001360050
#define THR5_NZ_CTX_TSB_CONFIG_3 0x0000000001370000
#define THR6_Z_CTX_TSB_CONFIG_0  0x0000000001180150
#define THR6_Z_CTX_TSB_CONFIG_1  0x0000000001190100
#define THR6_Z_CTX_TSB_CONFIG_2  0x00000000011a0010
#define THR6_Z_CTX_TSB_CONFIG_3  0x00000000011b0030
#define THR6_NZ_CTX_TSB_CONFIG_0 0x0000000001380150
#define THR6_NZ_CTX_TSB_CONFIG_1 0x0000000001390000
#define THR6_NZ_CTX_TSB_CONFIG_2 0x00000000013a0110
#define THR6_NZ_CTX_TSB_CONFIG_3 0x00000000013b0030
#define THR7_Z_CTX_TSB_CONFIG_0  0x00000000011c0030
#define THR7_Z_CTX_TSB_CONFIG_1  0x00000000011d0150
#define THR7_Z_CTX_TSB_CONFIG_2  0x00000000011e0100
#define THR7_Z_CTX_TSB_CONFIG_3  0x00000000011f0010
#define THR7_NZ_CTX_TSB_CONFIG_0 0x00000000013c0130
#define THR7_NZ_CTX_TSB_CONFIG_1 0x00000000013d0150
#define THR7_NZ_CTX_TSB_CONFIG_2 0x00000000013e0000
#define THR7_NZ_CTX_TSB_CONFIG_3 0x00000000013f0110
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
#define THR_1_PARTID 4
#define THR_2_PARTID 4
#define THR_3_PARTID 4
#define THR_4_PARTID 4
#define THR_5_PARTID 4
#define THR_6_PARTID 4
#define THR_7_PARTID 4
#define NUCLEUS 0x0
#define THR0_PCONTEXT_0 0x111a
#define THR0_PCONTEXT_1 0x028e
#define THR0_SCONTEXT_0 0x053b
#define THR0_SCONTEXT_1 0x1a09
#define THR1_PCONTEXT_0 0x111a
#define THR1_PCONTEXT_1 0x00cb
#define THR1_SCONTEXT_0 0x10bf
#define THR1_SCONTEXT_1 0x0fc4
#define THR2_PCONTEXT_0 0x111a
#define THR2_PCONTEXT_1 0x059c
#define THR2_SCONTEXT_0 0x0486
#define THR2_SCONTEXT_1 0x12b7
#define THR3_PCONTEXT_0 0x111a
#define THR3_PCONTEXT_1 0x169d
#define THR3_SCONTEXT_0 0x061b
#define THR3_SCONTEXT_1 0x1010
#define THR4_PCONTEXT_0 0x111a
#define THR4_PCONTEXT_1 0x079f
#define THR4_SCONTEXT_0 0x1e3d
#define THR4_SCONTEXT_1 0x18e5
#define THR5_PCONTEXT_0 0x111a
#define THR5_PCONTEXT_1 0x0fb0
#define THR5_SCONTEXT_0 0x0595
#define THR5_SCONTEXT_1 0x195d
#define THR6_PCONTEXT_0 0x111a
#define THR6_PCONTEXT_1 0x1bf1
#define THR6_SCONTEXT_0 0x0dad
#define THR6_SCONTEXT_1 0x0a9d
#define THR7_PCONTEXT_0 0x111a
#define THR7_PCONTEXT_1 0x0540
#define THR7_SCONTEXT_0 0x08b7
#define THR7_SCONTEXT_1 0x1237
#define THR0_PTRAP_TEXT_VA 0x600000970000
#define THR0_PTRAP_TEXT_RA 0x0190500000
#define THR0_PTRAP_TEXT_PA 0x0d90500000
#define THR1_PTRAP_TEXT_VA 0x6400001e0000
#define THR1_PTRAP_TEXT_RA 0x01a0090000
#define THR1_PTRAP_TEXT_PA 0x01a0090000
#define THR2_PTRAP_TEXT_VA 0x6800005e0000
#define THR2_PTRAP_TEXT_RA 0x01b0540000
#define THR2_PTRAP_TEXT_PA 0x01b0540000
#define THR3_PTRAP_TEXT_VA 0x6c0000780000
#define THR3_PTRAP_TEXT_RA 0x01c0380000
#define THR3_PTRAP_TEXT_PA 0x3dc0380000
#define THR4_PTRAP_TEXT_VA 0x700000f70000
#define THR4_PTRAP_TEXT_RA 0x01d0290000
#define THR4_PTRAP_TEXT_PA 0x4dd0290000
#define THR5_PTRAP_TEXT_VA 0x740000f30000
#define THR5_PTRAP_TEXT_RA 0x01e0990000
#define THR5_PTRAP_TEXT_PA 0x5de0990000
#define THR6_PTRAP_TEXT_VA 0x780000e00000
#define THR6_PTRAP_TEXT_RA 0x01f0d10000
#define THR6_PTRAP_TEXT_PA 0x01f0d10000
#define THR7_PTRAP_TEXT_VA 0x7c0000eb0000
#define THR7_PTRAP_TEXT_RA 0x02004c0000
#define THR7_PTRAP_TEXT_PA 0x02004c0000
#include "mmu_hred.s"
/*********************************************************************/
SECTION .Thr0_Priv_Sect TEXT_VA=0x5fe0000d0000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_1
	VA = 0x5fe0000d0000 ,
	RA = 0x00f016e000 ,
	PA = 0x00f016e000 ,
	TTE_Context = 0x111a ,
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
SECTION .Thr1_Priv_Sect TEXT_VA=0x63f000018000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_1
	VA = 0x63f000018000 ,
	RA = 0x0100046000 ,
	PA = 0x0100046000 ,
	TTE_Context = 0x111a ,
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
SECTION .Thr2_Priv_Sect TEXT_VA=0x6710001de000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_3
	VA = 0x6710001de000 ,
	RA = 0x01101ac000 ,
	PA = 0x01101ac000 ,
	TTE_Context = 0x111a ,
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
SECTION .Thr3_Priv_Sect TEXT_VA=0x6b2000184000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_0
	VA = 0x6b2000184000 ,
	RA = 0x0120064000 ,
	PA = 0x0120064000 ,
	TTE_Context = 0x111a ,
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
SECTION .Thr4_Priv_Sect TEXT_VA=0x6f3000084000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_2
	VA = 0x6f3000084000 ,
	RA = 0x013013c000 ,
	PA = 0x013013c000 ,
	TTE_Context = 0x111a ,
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
SECTION .Thr5_Priv_Sect TEXT_VA=0x734000154000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_3
	VA = 0x734000154000 ,
	RA = 0x01401b2000 ,
	PA = 0x01401b2000 ,
	TTE_Context = 0x111a ,
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
SECTION .Thr6_Priv_Sect TEXT_VA=0x775000064000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_1
	VA = 0x775000064000 ,
	RA = 0x015014a000 ,
	PA = 0x015014a000 ,
	TTE_Context = 0x111a ,
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
SECTION .Thr7_Priv_Sect TEXT_VA=0x7b6000078000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x7b6000078000 ,
	RA = 0x01600a2000 ,
	PA = 0x01600a2000 ,
	TTE_Context = 0x111a ,
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
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x610024c00000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	VA = 0x610024c00000 ,/* 0x610024ffffc0 */
	RA = 0x03d2800000 ,
	PA = 0x0fd2800000 ,
	TTE_Context = 0x111a ,/* TEXT_PRIMARY */
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
	end_label   = Thr0_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
	setx	Thr0_User_Text_4v001_text_begin, %l0, %l1
	or	%g0, 0x10, %l2
.global Thr0_User_Text_4v000_text_begin
Thr0_User_Text_4v000_text_begin:
	jmpl	%l1, %i6
	nop
	sub	%l2, 1, %l2
	brnz,a	%l2, Thr0_User_Text_4v000_text_begin
	nop
	EXIT_GOOD
Thr0_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v001 TEXT_VA=0x5fe000172000
attr_text {
	Name = .Thr0_User_Text_4v001 ,
	VA = 0x5fe000172000 ,/* 0x5fe000173fc0 */
	RA = 0x00f00cc000 ,
	PA = 0x00f00cc000 ,
	TTE_Context = 0x111a ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_1 ,
	thr1_nz_ctx_tsb_1 ,
	thr2_nz_ctx_tsb_3 ,
	thr3_nz_ctx_tsb_0 ,
	thr4_nz_ctx_tsb_2 ,
	thr5_nz_ctx_tsb_3 ,
	thr6_nz_ctx_tsb_1 ,
	thr7_nz_ctx_tsb_2 ,
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
	end_label   = Thr0_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v001_text_begin
Thr0_User_Text_4v001_text_begin:
	setx	Thr0_User_Text_4v001_text_begin, %i5, %i7
	IDEMAP_PAGE
	jmp	%i6 + 8
	nop
	EXIT_GOOD
Thr0_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x63f00016a000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	VA = 0x63f00016a000 ,/* 0x63f00016bfc0 */
	RA = 0x010018c000 ,
	PA = 0x010018c000 ,
	TTE_Context = 0x111a ,/* TEXT_PRIMARY */
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
	end_label   = Thr1_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr1_user_code_entry
Thr1_user_code_entry:
	setx	Thr0_User_Text_4v001_text_begin, %l0, %l1
	or	%g0, 0x10, %l2
.global Thr1_User_Text_4v000_text_begin
Thr1_User_Text_4v000_text_begin:
	jmpl	%l1, %i6
	nop
	sub	%l2, 1, %l2
	brnz,a	%l2, Thr1_User_Text_4v000_text_begin
	nop
	EXIT_GOOD
Thr1_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x67100018c000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	VA = 0x67100018c000 ,/* 0x67100018dfc0 */
	RA = 0x01101ec000 ,
	PA = 0x01101ec000 ,
	TTE_Context = 0x111a ,/* TEXT_PRIMARY */
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
	end_label   = Thr2_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr2_user_code_entry
Thr2_user_code_entry:
	setx	Thr0_User_Text_4v001_text_begin, %l0, %l1
	or	%g0, 0x10, %l2
.global Thr2_User_Text_4v000_text_begin
Thr2_User_Text_4v000_text_begin:
	jmpl	%l1, %i6
	nop
	sub	%l2, 1, %l2
	brnz,a	%l2, Thr2_User_Text_4v000_text_begin
	nop
	EXIT_GOOD
Thr2_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x6c0000e40000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	VA = 0x6c0000e40000 ,/* 0x6c0000e4ffc0 */
	RA = 0x01c0da0000 ,
	PA = 0x3dc0da0000 ,
	TTE_Context = 0x111a ,/* TEXT_PRIMARY */
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
	end_label   = Thr3_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr3_user_code_entry
Thr3_user_code_entry:
	setx	Thr0_User_Text_4v001_text_begin, %l0, %l1
	or	%g0, 0x10, %l2
.global Thr3_User_Text_4v000_text_begin
Thr3_User_Text_4v000_text_begin:
	jmpl	%l1, %i6
	nop
	sub	%l2, 1, %l2
	brnz,a	%l2, Thr3_User_Text_4v000_text_begin
	nop
	EXIT_GOOD
Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x700000200000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	VA = 0x700000200000 ,/* 0x70000020ffc0 */
	RA = 0x01d0c80000 ,
	PA = 0x4dd0c80000 ,
	TTE_Context = 0x111a ,/* TEXT_PRIMARY */
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
	end_label   = Thr4_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr4_user_code_entry
Thr4_user_code_entry:
	setx	Thr0_User_Text_4v001_text_begin, %l0, %l1
	or	%g0, 0x10, %l2
.global Thr4_User_Text_4v000_text_begin
Thr4_User_Text_4v000_text_begin:
	jmpl	%l1, %i6
	nop
	sub	%l2, 1, %l2
	brnz,a	%l2, Thr4_User_Text_4v000_text_begin
	nop
	EXIT_GOOD
Thr4_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x7340000ae000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	VA = 0x7340000ae000 ,/* 0x7340000affc0 */
	RA = 0x014000c000 ,
	PA = 0x014000c000 ,
	TTE_Context = 0x111a ,/* TEXT_PRIMARY */
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
	end_label   = Thr5_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr5_user_code_entry
Thr5_user_code_entry:
	setx	Thr0_User_Text_4v001_text_begin, %l0, %l1
	or	%g0, 0x10, %l2
.global Thr5_User_Text_4v000_text_begin
Thr5_User_Text_4v000_text_begin:
	jmpl	%l1, %i6
	nop
	sub	%l2, 1, %l2
	brnz,a	%l2, Thr5_User_Text_4v000_text_begin
	nop
	EXIT_GOOD
Thr5_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr6_User_Text_4v000 TEXT_VA=0x775000094000
attr_text {
	Name = .Thr6_User_Text_4v000 ,
	VA = 0x775000094000 ,/* 0x775000095fc0 */
	RA = 0x015019a000 ,
	PA = 0x015019a000 ,
	TTE_Context = 0x111a ,/* TEXT_PRIMARY */
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
	end_label   = Thr6_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr6_user_code_entry
Thr6_user_code_entry:
	setx	Thr0_User_Text_4v001_text_begin, %l0, %l1
	or	%g0, 0x10, %l2
.global Thr6_User_Text_4v000_text_begin
Thr6_User_Text_4v000_text_begin:
	jmpl	%l1, %i6
	nop
	sub	%l2, 1, %l2
	brnz,a	%l2, Thr6_User_Text_4v000_text_begin
	nop
	EXIT_GOOD
Thr6_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x7d0018c00000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	VA = 0x7d0018c00000 ,/* 0x7d0018ffffc0 */
	RA = 0x0057800000 ,
	PA = 0x7857800000 ,
	TTE_Context = 0x111a ,/* TEXT_PRIMARY */
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
	end_label   = Thr7_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr7_user_code_entry
Thr7_user_code_entry:
	setx	Thr0_User_Text_4v001_text_begin, %l0, %l1
	or	%g0, 0x10, %l2
.global Thr7_User_Text_4v000_text_begin
Thr7_User_Text_4v000_text_begin:
	jmpl	%l1, %i6
	nop
	sub	%l2, 1, %l2
	brnz,a	%l2, Thr7_User_Text_4v000_text_begin
	nop
	EXIT_GOOD
Thr7_User_Text_4v000_text_end:
