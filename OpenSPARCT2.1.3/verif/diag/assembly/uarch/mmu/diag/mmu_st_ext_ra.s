/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_st_ext_ra.s
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

#define CUSTOM_TRAP_0X9
#define CUSTOM_TRAP_0X31
#define CUSTOM_TRAP_0X2A
#define CUSTOM_TRAP_0X2B
	
! This diag must be run with HWTW on only
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
#define THR0_PCONTEXT_0 0x1d1a
#define THR0_PCONTEXT_1 0x1d3e
#define THR0_SCONTEXT_0 0x0788
#define THR0_SCONTEXT_1 0x1fca
#define THR1_PCONTEXT_0 0x1957
#define THR1_PCONTEXT_1 0x15c3
#define THR1_SCONTEXT_0 0x12f3
#define THR1_SCONTEXT_1 0x1e41
#define THR2_PCONTEXT_0 0x10b9
#define THR2_PCONTEXT_1 0x0cb4
#define THR2_SCONTEXT_0 0x11d5
#define THR2_SCONTEXT_1 0x07f3
#define THR3_PCONTEXT_0 0x1f2a
#define THR3_PCONTEXT_1 0x0cbb
#define THR3_SCONTEXT_0 0x04ea
#define THR3_SCONTEXT_1 0x1ec7
#define THR4_PCONTEXT_0 0x0783
#define THR4_PCONTEXT_1 0x03ca
#define THR4_SCONTEXT_0 0x180f
#define THR4_SCONTEXT_1 0x1b56
#define THR5_PCONTEXT_0 0x117a
#define THR5_PCONTEXT_1 0x1edc
#define THR5_SCONTEXT_0 0x02f2
#define THR5_SCONTEXT_1 0x10a6
#define THR6_PCONTEXT_0 0x1743
#define THR6_PCONTEXT_1 0x1558
#define THR6_SCONTEXT_0 0x1706
#define THR6_SCONTEXT_1 0x0b68
#define THR7_PCONTEXT_0 0x193a
#define THR7_PCONTEXT_1 0x0be2
#define THR7_SCONTEXT_0 0x11f9
#define THR7_SCONTEXT_1 0x1947
#define THR0_PTRAP_TEXT_VA 0x6000002a0000
#define THR0_PTRAP_TEXT_RA 0x0010fb0000
#define THR0_PTRAP_TEXT_PA 0x0010fb0000
#define THR1_PTRAP_TEXT_VA 0x640000bc0000
#define THR1_PTRAP_TEXT_RA 0x0020a70000
#define THR1_PTRAP_TEXT_PA 0x0020a70000
#define THR2_PTRAP_TEXT_VA 0x680000130000
#define THR2_PTRAP_TEXT_RA 0x0030b40000
#define THR2_PTRAP_TEXT_PA 0x0030b40000
#define THR3_PTRAP_TEXT_VA 0x6c00005f0000
#define THR3_PTRAP_TEXT_RA 0x0040450000
#define THR3_PTRAP_TEXT_PA 0x3840450000
#define THR4_PTRAP_TEXT_VA 0x700000170000
#define THR4_PTRAP_TEXT_RA 0x0050880000
#define THR4_PTRAP_TEXT_PA 0x4850880000
#define THR5_PTRAP_TEXT_VA 0x740000830000
#define THR5_PTRAP_TEXT_RA 0x0060a30000
#define THR5_PTRAP_TEXT_PA 0x5860a30000
#define THR6_PTRAP_TEXT_VA 0x780000ad0000
#define THR6_PTRAP_TEXT_RA 0x0070230000
#define THR6_PTRAP_TEXT_PA 0x0070230000
#define THR7_PTRAP_TEXT_VA 0x7c0000b50000
#define THR7_PTRAP_TEXT_RA 0x0080360000
#define THR7_PTRAP_TEXT_PA 0x0080360000
#include "mmu_hred.s"
/*********************************************************************/
SECTION .Thr0_Priv_Sect TEXT_VA=0x5fa000056000
attr_text {
	Name = .Thr0_Priv_Sect ,
	thr0_nz_ctx_tsb_1
	VA = 0x5fa000056000 ,
	RA = 0x00f01c0000 ,
	PA = 0x0cf01c0000 ,
	TTE_Context = 0x1d1a ,
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
SECTION .Thr1_Priv_Sect TEXT_VA=0x63b0001f2000
attr_text {
	Name = .Thr1_Priv_Sect ,
	thr1_nz_ctx_tsb_1
	VA = 0x63b0001f2000 ,
	RA = 0x01001de000 ,
	PA = 0x01001de000 ,
	TTE_Context = 0x1957 ,
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
SECTION .Thr2_Priv_Sect TEXT_VA=0x67c000186000
attr_text {
	Name = .Thr2_Priv_Sect ,
	thr2_nz_ctx_tsb_3
	VA = 0x67c000186000 ,
	RA = 0x0110190000 ,
	PA = 0x0110190000 ,
	TTE_Context = 0x10b9 ,
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
SECTION .Thr3_Priv_Sect TEXT_VA=0x6bd000074000
attr_text {
	Name = .Thr3_Priv_Sect ,
	thr3_nz_ctx_tsb_0
	VA = 0x6bd000074000 ,
	RA = 0x01200ea000 ,
	PA = 0x01200ea000 ,
	TTE_Context = 0x1f2a ,
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
SECTION .Thr4_Priv_Sect TEXT_VA=0x6fe0001b4000
attr_text {
	Name = .Thr4_Priv_Sect ,
	thr4_nz_ctx_tsb_2
	VA = 0x6fe0001b4000 ,
	RA = 0x01300e4000 ,
	PA = 0x01300e4000 ,
	TTE_Context = 0x0783 ,
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
SECTION .Thr5_Priv_Sect TEXT_VA=0x73f000172000
attr_text {
	Name = .Thr5_Priv_Sect ,
	thr5_nz_ctx_tsb_3
	VA = 0x73f000172000 ,
	RA = 0x0140128000 ,
	PA = 0x0140128000 ,
	TTE_Context = 0x117a ,
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
SECTION .Thr6_Priv_Sect TEXT_VA=0x7710001e6000
attr_text {
	Name = .Thr6_Priv_Sect ,
	thr6_nz_ctx_tsb_1
	VA = 0x7710001e6000 ,
	RA = 0x015018e000 ,
	PA = 0x6d5018e000 ,
	TTE_Context = 0x1743 ,
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
SECTION .Thr7_Priv_Sect TEXT_VA=0x7b20001b2000
attr_text {
	Name = .Thr7_Priv_Sect ,
	thr7_nz_ctx_tsb_2
	VA = 0x7b20001b2000 ,
	RA = 0x01600b0000 ,
	PA = 0x01600b0000 ,
	TTE_Context = 0x193a ,
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
/****************************************************************************************** */
SECTION .HPTRAPS_CUSTOM_SECT   TEXT_VA=0xa0000, DATA_VA=0xa8000
	
attr_text {
	Name=.HPTRAPS_CUSTOM_SECT,
	hypervisor
}

.text
.global custom_trap_0x9_handler
.global custom_trap_0x31_handler
.global custom_trap_0x2a_handler
.global custom_trap_0x2b_handler

custom_trap_0x9_handler:
	! This handler is called because the entry has a valid bit 0. This handler is
	! then responsible for setting RA[40] to be 1.
	! %l1 = VA
	or	%l1, %g0, %g1    ! %g1 = VA
	or	%g0, 0x48, %g2
	ldxa	[%g2] 0x54, %g2  ! %g2 = non-zero context TSB config 3
	setx	function_tsb_ptr_calc, %g3, %g4
	jmpl	%g4, %i6
	nop
	stxa	%i7, [%g0] 0x20	! save tsb pointer for later use
	ldda	[%i7] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6=TTE_TAG, %g7=TTE_DATA
	or	%g0, 1, %g4
	sllx	%g4, 40, %g4	! %g4 has RA[40] set
	or	%g0, 1, %g5
	sllx	%g5, 63, %g5	! %g5 has valid bit set
	or	%g4, %g5, %g4
	or	%g7, %g4, %g7
	stx	%g6, [%i7]
	stx	%g7, [%i7 + 8]
	retry
	
custom_trap_0x2a_handler:
	! %l1 = VA
	or	%l1, %g0, %g1    ! %g1 = VA
	or	%g0, 0x48, %g2
	ldxa	[%g2] 0x54, %g2  ! %g2 = non-zero context TSB config 3
	ldxa	[%g0] 0x20, %i7	! restore tsb pointer in %i7
	ldda	[%i7] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6=TTE_TAG, %g7=TTE_DATA
	sethi	0x0ffff, %g4
	sllx	%g4, 30, %g4	! %g4 has the RA[55:40] mask
	and	%g7, %g4, %g5	! %g5 has RA[55:40]
	andn	%g7, %g4, %g7	! %g7 has RA[55:40] all clear
	sllx	%g5, 1, %g5	! shifting bit 1 from RA[40] to RA[55]
	and	%g5, %g4, %g5	! clear if bit 1 is outside RA[55:40]
	or	%g7, %g5, %g7
	stx	%g7, [%i7 + 8]
	retry
	
custom_trap_0x31_handler:
	! This handler is called because the entry has a valid bit 0. This handler is
	! then responsible for setting RA[40] to be 1.
	! %l1 = VA
	or	%l1, %g0, %g1    ! %g1 = VA
	or	%g0, 0x40, %g2
	ldxa	[%g2] 0x54, %g2  ! %g2 = non-zero context TSB config 2
	setx	function_tsb_ptr_calc, %g3, %g4
	jmpl	%g4, %i6
	nop
	stxa	%i7, [%g0] 0x20	! save tsb pointer for later use
	ldda	[%i7] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6=TTE_TAG, %g7=TTE_DATA
	or	%g0, 1, %g4
	sllx	%g4, 40, %g4	! %g4 has RA[40] set
	or	%g0, 1, %g5
	sllx	%g5, 63, %g5	! %g5 has valid bit set
	or	%g4, %g5, %g4
	or	%g7, %g4, %g7
	stx	%g6, [%i7]
	stx	%g7, [%i7 + 8]
	retry
	
custom_trap_0x2b_handler:
	! %l1 = VA
	or	%l1, %g0, %g1    ! %g1 = VA
	or	%g0, 0x48, %g2
	ldxa	[%g2] 0x54, %g2  ! %g2 = non-zero context TSB config 3
	ldxa	[%g0] 0x20, %i7	! restore tsb pointer in %i7
	ldda	[%i7] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6=TTE_TAG, %g7=TTE_DATA
	sethi	0x0ffff, %g4
	sllx	%g4, 30, %g4	! %g4 has the RA[55:40] mask
	and	%g7, %g4, %g5	! %g5 has RA[55:40]
	andn	%g7, %g4, %g7	! %g7 has RA[55:40] all clear
	sllx	%g5, 1, %g5	! shifting bit 1 from RA[40] to RA[55]
	and	%g5, %g4, %g5	! clear if bit 1 is outside RA[55:40]
	or	%g7, %g5, %g7
	stx	%g7, [%i7 + 8]
	retry
	
attr_data {
	Name=.HPTRAPS_CUSTOM_SECT,
	hypervisor
}

/*********************************************************************/
SECTION .Thr0_User_Text_4v000 TEXT_VA=0x6205a0000000
attr_text {
	Name = .Thr0_User_Text_4v000 ,
	VA = 0x6205a0000000 ,/* 0x6205afffffc0 */
	RA = 0x0170000000 ,
	PA = 0x0170000000 ,
	TTE_Context = 0x1d1a ,/* TEXT_PRIMARY */
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
	end_label   = Thr0_User_Text_4v000_text_end ,
	compressimage ,
	}
.text
.global Thr0_user_code_entry
Thr0_user_code_entry:
	or	%g0, 1, %i1
	sllx	%i1, 25, %i1 ! %i1 = walking 1, VA[47] is bit 25 in TTE tag
.global Thr0_User_Text_4v000_text_begin
Thr0_User_Text_4v000_text_begin:
	setx	Thr0_User_Text_4v001_text_begin, %l0, %l1
	jmp	%l1
	nop
	EXIT_BAD
Thr0_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr0_User_Text_4v001 TEXT_VA=0x610032400000
attr_text {
	Name = .Thr0_User_Text_4v001 ,
	VA = 0x610032400000 ,/* 0x6100327fffc0 */
	RA = 0x024b000000 ,
	PA = 0x0e4b000000 ,
	TTE_Context = 0x1d1a ,/* TEXT_PRIMARY */
	thr0_nz_ctx_tsb_3 ,
	TTE_V       = 0 ,
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
	end_label   = Thr0_User_Text_4v001_text_end ,
	compressimage ,
	}
.text
.global Thr0_User_Text_4v001_text_begin
Thr0_User_Text_4v001_text_begin:
	setx	Thr0_User_Data_4v100_data_begin, %l0, %l1
	ldx	[%l1], %l2
	EXIT_GOOD
Thr0_User_Text_4v001_text_end:
/*********************************************************************/
SECTION .Thr0_User_Data_4v100 DATA_VA=0x600000de0000
attr_data {
	Name = .Thr0_User_Data_4v100 ,
	VA = 0x600000de0000 ,/* 0x600000deffc0 */
	RA = 0x0010020000 ,
	PA = 0x0010020000 ,
	TTE_Context = 0x1d1a ,/* DATA_PRIMARY */
	thr0_nz_ctx_tsb_2 ,
	TTE_V       = 0 ,
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
	end_label   = Thr0_User_Data_4v100_data_end ,
	compressimage ,
	}
.data
.global Thr0_User_Data_4v100_data_begin
Thr0_User_Data_4v100_data_begin:
	.word	0x1234
Thr0_User_Data_4v100_data_end:
/*********************************************************************/
SECTION .Thr1_User_Text_4v000 TEXT_VA=0x63b0001a2000
attr_text {
	Name = .Thr1_User_Text_4v000 ,
	VA = 0x63b0001a2000 ,/* 0x63b0001a3fc0 */
	RA = 0x01001be000 ,
	PA = 0x01001be000 ,
	TTE_Context = 0x1957 ,/* TEXT_PRIMARY */
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
.global Thr1_User_Text_4v000_text_begin
Thr1_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr1_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr2_User_Text_4v000 TEXT_VA=0x690033000000
attr_text {
	Name = .Thr2_User_Text_4v000 ,
	VA = 0x690033000000 ,/* 0x6900333fffc0 */
	RA = 0x0266c00000 ,
	PA = 0x2e66c00000 ,
	TTE_Context = 0x10b9 ,/* TEXT_PRIMARY */
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
SECTION .Thr3_User_Text_4v000 TEXT_VA=0x6c0000e90000
attr_text {
	Name = .Thr3_User_Text_4v000 ,
	VA = 0x6c0000e90000 ,/* 0x6c0000e9ffc0 */
	RA = 0x0040e60000 ,
	PA = 0x3840e60000 ,
	TTE_Context = 0x1f2a ,/* TEXT_PRIMARY */
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
.global Thr3_User_Text_4v000_text_begin
Thr3_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr3_User_Text_4v000_text_end:
/*********************************************************************/
SECTION .Thr4_User_Text_4v000 TEXT_VA=0x6fe00009a000
attr_text {
	Name = .Thr4_User_Text_4v000 ,
	VA = 0x6fe00009a000 ,/* 0x6fe00009bfc0 */
	RA = 0x01300f0000 ,
	PA = 0x01300f0000 ,
	TTE_Context = 0x0783 ,/* TEXT_PRIMARY */
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
SECTION .Thr5_User_Text_4v000 TEXT_VA=0x750017000000
attr_text {
	Name = .Thr5_User_Text_4v000 ,
	VA = 0x750017000000 ,/* 0x7500173fffc0 */
	RA = 0x0293000000 ,
	PA = 0x0293000000 ,
	TTE_Context = 0x117a ,/* TEXT_PRIMARY */
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
SECTION .Thr6_User_Text_4v000 TEXT_VA=0x7a0aa0000000
attr_text {
	Name = .Thr6_User_Text_4v000 ,
	VA = 0x7a0aa0000000 ,/* 0x7a0aafffffc0 */
	RA = 0x01d0000000 ,
	PA = 0x6dd0000000 ,
	TTE_Context = 0x1743 ,/* TEXT_PRIMARY */
	thr6_nz_ctx_tsb_0 ,
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
	TTE_Size    = 5 ,
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
SECTION .Thr7_User_Text_4v000 TEXT_VA=0x7d001ec00000
attr_text {
	Name = .Thr7_User_Text_4v000 ,
	VA = 0x7d001ec00000 ,/* 0x7d001effffc0 */
	RA = 0x02b7c00000 ,
	PA = 0x7eb7c00000 ,
	TTE_Context = 0x193a ,/* TEXT_PRIMARY */
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
.global Thr7_User_Text_4v000_text_begin
Thr7_User_Text_4v000_text_begin:
	EXIT_GOOD
Thr7_User_Text_4v000_text_end:
