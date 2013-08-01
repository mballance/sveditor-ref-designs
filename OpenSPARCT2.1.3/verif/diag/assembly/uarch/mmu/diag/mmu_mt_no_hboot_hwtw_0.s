/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_mt_no_hboot_hwtw_0.s
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

#define HV_RED_TEXT_PA			0x10000
#define HV_RED_DATA_PA			0x20000
#define	HPTRAP_TEXT_PA			0x80000
#define HPTRAPS_EXT_TEXT_PA		0x90000
#define HPTRAPS_EXT_DATA_PA		0x98000
#define	P_GOOD_TRAP			0x0
#define	P_BAD_TRAP			0x1
#define HP_GOOD_TRAP			0xa0
#define HP_BAD_TRAP			0xa1
#define EXIT_GOOD			ta P_GOOD_TRAP; nop
#define EXIT_BAD			ta P_BAD_TRAP; nop

#define NUCLEUS         0x00000
#define THR0_PCONTEXT_0 0x00000
#define THR0_PCONTEXT_1 0x01100
#define THR0_SCONTEXT_0 0x01200
#define THR0_SCONTEXT_1 0x01300
#define THR1_PCONTEXT_0 0x00001
#define THR1_PCONTEXT_1 0x01101
#define THR1_SCONTEXT_0 0x01201
#define THR1_SCONTEXT_1 0x01301
#define THR2_PCONTEXT_0 0x00002
#define THR2_PCONTEXT_1 0x01102
#define THR2_SCONTEXT_0 0x01202
#define THR2_SCONTEXT_1 0x01302
#define THR3_PCONTEXT_0 0x00003
#define THR3_PCONTEXT_1 0x01103
#define THR3_SCONTEXT_0 0x01203
#define THR3_SCONTEXT_1 0x01303
#define THR4_PCONTEXT_0 0x00004
#define THR4_PCONTEXT_1 0x01104
#define THR4_SCONTEXT_0 0x01204
#define THR4_SCONTEXT_1 0x01304
#define THR5_PCONTEXT_0 0x00005
#define THR5_PCONTEXT_1 0x01105
#define THR5_SCONTEXT_0 0x01205
#define THR5_SCONTEXT_1 0x01305
#define THR6_PCONTEXT_0 0x00006
#define THR6_PCONTEXT_1 0x01106
#define THR6_SCONTEXT_0 0x01206
#define THR6_SCONTEXT_1 0x01306
#define THR7_PCONTEXT_0 0x00007
#define THR7_PCONTEXT_1 0x01107
#define THR7_SCONTEXT_0 0x01207
#define THR7_SCONTEXT_1 0x01307
	
#define THR0_PTRAP_TEXT_VA	0x0100000000
#define THR0_PTRAP_TEXT_RA	0x0000300000
#define THR0_PTRAP_TEXT_PA	0x4000300000
#define THR1_PTRAP_TEXT_VA	0x0101000000
#define THR1_PTRAP_TEXT_RA	0x0000310000
#define THR1_PTRAP_TEXT_PA	0x4400310000
#define THR2_PTRAP_TEXT_VA	0x0102000000
#define THR2_PTRAP_TEXT_RA	0x0000320000
#define THR2_PTRAP_TEXT_PA	0x4800320000
#define THR3_PTRAP_TEXT_VA	0x0103000000
#define THR3_PTRAP_TEXT_RA	0x0000330000
#define THR3_PTRAP_TEXT_PA	0x4C00330000
#define THR4_PTRAP_TEXT_VA	0x0104000000
#define THR4_PTRAP_TEXT_RA	0x0000340000
#define THR4_PTRAP_TEXT_PA	0x5000340000
#define THR5_PTRAP_TEXT_VA	0x0105000000
#define THR5_PTRAP_TEXT_RA	0x0000350000
#define THR5_PTRAP_TEXT_PA	0x5400350000
#define THR6_PTRAP_TEXT_VA	0x0106000000
#define THR6_PTRAP_TEXT_RA	0x0000360000
#define THR6_PTRAP_TEXT_PA	0x5800360000
#define THR7_PTRAP_TEXT_VA	0x0107000000
#define THR7_PTRAP_TEXT_RA	0x0000370000
#define THR7_PTRAP_TEXT_PA	0x5C00370000

#define THR0_PRIV_TEXT_VA	0x000200000000
#define THR0_PRIV_TEXT_RA	0x0300000000
#define THR0_PRIV_TEXT_PA	0x4300000000
#define THR1_PRIV_TEXT_VA	0x000201000000
#define THR1_PRIV_TEXT_RA	0x0301000000
#define THR1_PRIV_TEXT_PA	0x4701000000
#define THR2_PRIV_TEXT_VA	0x000202000000
#define THR2_PRIV_TEXT_RA	0x0302000000
#define THR2_PRIV_TEXT_PA	0x4B02000000
#define THR3_PRIV_TEXT_VA	0x000203000000
#define THR3_PRIV_TEXT_RA	0x0303000000
#define THR3_PRIV_TEXT_PA	0x4F03000000
#define THR4_PRIV_TEXT_VA	0x000204000000
#define THR4_PRIV_TEXT_RA	0x0304000000
#define THR4_PRIV_TEXT_PA	0x5304000000
#define THR5_PRIV_TEXT_VA	0x000205000000
#define THR5_PRIV_TEXT_RA	0x0305000000
#define THR5_PRIV_TEXT_PA	0x5705000000
#define THR6_PRIV_TEXT_VA	0x000206000000
#define THR6_PRIV_TEXT_RA	0x0306000000
#define THR6_PRIV_TEXT_PA	0x5B06000000
#define THR7_PRIV_TEXT_VA	0x000207000000
#define THR7_PRIV_TEXT_RA	0x0307000000
#define THR7_PRIV_TEXT_PA	0x5F07000000
	
#define THR0_USER_TEXT_4V_VA000      0x1000000000
#define THR0_USER_TEXT_4V_RA000      0x0200000000
#define THR0_USER_TEXT_4V_PA000      0x4200000000
#define THR0_USER_DATA_4V_VA008      0x1000080000
#define THR0_USER_DATA_4V_RA008      0x0200080000
#define THR0_USER_DATA_4V_PA008      0x4200080000
#define THR1_USER_TEXT_4V_VA000      0x1100000000
#define THR1_USER_TEXT_4V_RA000      0x0300000000
#define THR1_USER_TEXT_4V_PA000      0x4700000000
#define THR1_USER_DATA_4V_VA008      0x1100080000
#define THR1_USER_DATA_4V_RA008      0x0300080000
#define THR1_USER_DATA_4V_PA008      0x4700080000
#define THR2_USER_TEXT_4V_VA000      0x1200000000
#define THR2_USER_TEXT_4V_RA000      0x0400000000
#define THR2_USER_TEXT_4V_PA000      0x4C00000000
#define THR2_USER_DATA_4V_VA008      0x1200080000
#define THR2_USER_DATA_4V_RA008      0x0400080000
#define THR2_USER_DATA_4V_PA008      0x4C00080000
#define THR3_USER_TEXT_4V_VA000      0x1300000000
#define THR3_USER_TEXT_4V_RA000      0x0500000000
#define THR3_USER_TEXT_4V_PA000      0x5100000000
#define THR3_USER_DATA_4V_VA008      0x1300080000
#define THR3_USER_DATA_4V_RA008      0x0500080000
#define THR3_USER_DATA_4V_PA008      0x5100080000
#define THR4_USER_TEXT_4V_VA000      0x1400000000
#define THR4_USER_TEXT_4V_RA000      0x0600000000
#define THR4_USER_TEXT_4V_PA000      0x5600000000
#define THR4_USER_DATA_4V_VA008      0x1400080000
#define THR4_USER_DATA_4V_RA008      0x0600080000
#define THR4_USER_DATA_4V_PA008      0x5600080000
#define THR5_USER_TEXT_4V_VA000      0x1500000000
#define THR5_USER_TEXT_4V_RA000      0x0700000000
#define THR5_USER_TEXT_4V_PA000      0x5B00000000
#define THR5_USER_DATA_4V_VA008      0x1500080000
#define THR5_USER_DATA_4V_RA008      0x0700080000
#define THR5_USER_DATA_4V_PA008      0x5B00080000
#define THR6_USER_TEXT_4V_VA000      0x1600000000
#define THR6_USER_TEXT_4V_RA000      0x0800000000
#define THR6_USER_TEXT_4V_PA000      0x6000000000
#define THR6_USER_DATA_4V_VA008      0x1600080000
#define THR6_USER_DATA_4V_RA008      0x0800080000
#define THR6_USER_DATA_4V_PA008      0x6000080000
#define THR7_USER_TEXT_4V_VA000      0x1700000000
#define THR7_USER_TEXT_4V_RA000      0x0900000000
#define THR7_USER_TEXT_4V_PA000      0x6500000000
#define THR7_USER_DATA_4V_VA008      0x1700080000
#define THR7_USER_DATA_4V_RA008      0x0900080000
#define THR7_USER_DATA_4V_PA008      0x6500080000

#define	THR_0_PARTID	0
#define	THR_1_PARTID	1
#define	THR_2_PARTID	2
#define	THR_3_PARTID	3
#define	THR_4_PARTID	4
#define	THR_5_PARTID	5
#define	THR_6_PARTID	6
#define	THR_7_PARTID	7
		
#define THR0_PHY_OFF_0	0x4000001000
#define THR0_PHY_OFF_1	0x4100001000
#define THR0_PHY_OFF_2	0x4200001000
#define THR0_PHY_OFF_3	0x4300001000
#define THR1_PHY_OFF_0	0x4400001000
#define THR1_PHY_OFF_1	0x4500001000
#define THR1_PHY_OFF_2	0x4600001000
#define THR1_PHY_OFF_3	0x4700001000
#define THR2_PHY_OFF_0	0x4800001000
#define THR2_PHY_OFF_1	0x4900001000
#define THR2_PHY_OFF_2	0x4a00001000
#define THR2_PHY_OFF_3	0x4b00001000
#define THR3_PHY_OFF_0	0x4c00001000
#define THR3_PHY_OFF_1	0x4d00001000
#define THR3_PHY_OFF_2	0x4e00001000
#define THR3_PHY_OFF_3	0x4f00001000
#define THR4_PHY_OFF_0	0x5000001000
#define THR4_PHY_OFF_1	0x5100001000
#define THR4_PHY_OFF_2	0x5200001000
#define THR4_PHY_OFF_3	0x5300001000
#define THR5_PHY_OFF_0	0x5400001000
#define THR5_PHY_OFF_1	0x5500001000
#define THR5_PHY_OFF_2	0x5600001000
#define THR5_PHY_OFF_3	0x5700001000
#define THR6_PHY_OFF_0	0x5800001000
#define THR6_PHY_OFF_1	0x5900001000
#define THR6_PHY_OFF_2	0x5a00001000
#define THR6_PHY_OFF_3	0x5b00001000
#define THR7_PHY_OFF_0	0x5c00001000
#define THR7_PHY_OFF_1	0x5d00001000
#define THR7_PHY_OFF_2	0x5e00001000
#define THR7_PHY_OFF_3	0x5f00001000

#define THR0_REAL_RANGE_0	0x8004000000000000
#define THR0_REAL_RANGE_1	0x8008000000000000
#define THR0_REAL_RANGE_2	0x8010000000000000
#define THR0_REAL_RANGE_3	0x8020000000000000
#define THR1_REAL_RANGE_0	0x8004000000000000
#define THR1_REAL_RANGE_1	0x8008000000000000
#define THR1_REAL_RANGE_2	0x8010000000000000
#define THR1_REAL_RANGE_3	0x8020000000000000
#define THR2_REAL_RANGE_0	0x8004000000000000
#define THR2_REAL_RANGE_1	0x8008000000000000
#define THR2_REAL_RANGE_2	0x8010000000000000
#define THR2_REAL_RANGE_3	0x8020000000000000
#define THR3_REAL_RANGE_0	0x8004000000000000
#define THR3_REAL_RANGE_1	0x8008000000000000
#define THR3_REAL_RANGE_2	0x8010000000000000
#define THR3_REAL_RANGE_3	0x8020000000000000
#define THR4_REAL_RANGE_0	0x8004000000000000
#define THR4_REAL_RANGE_1	0x8008000000000000
#define THR4_REAL_RANGE_2	0x8010000000000000
#define THR4_REAL_RANGE_3	0x8020000000000000
#define THR5_REAL_RANGE_0	0x8004000000000000
#define THR5_REAL_RANGE_1	0x8008000000000000
#define THR5_REAL_RANGE_2	0x8010000000000000
#define THR5_REAL_RANGE_3	0x8020000000000000
#define THR6_REAL_RANGE_0	0x8004000000000000
#define THR6_REAL_RANGE_1	0x8008000000000000
#define THR6_REAL_RANGE_2	0x8010000000000000
#define THR6_REAL_RANGE_3	0x8020000000000000
#define THR7_REAL_RANGE_0	0x8004000000000000
#define THR7_REAL_RANGE_1	0x8008000000000000
#define THR7_REAL_RANGE_2	0x8010000000000000
#define THR7_REAL_RANGE_3	0x8020000000000000
	
#ifdef NOHWTW
	
#define THR0_Z_CTX_TSB_CONFIG_0 	0x0000000100000114
#define THR0_Z_CTX_TSB_CONFIG_1 	0x0000000101000103
#define THR0_Z_CTX_TSB_CONFIG_2 	0x0000000102000102
#define THR0_Z_CTX_TSB_CONFIG_3 	0x0000000103000111
#define THR0_NZ_CTX_TSB_CONFIG_0	0x0000000104000104
#define THR0_NZ_CTX_TSB_CONFIG_1	0x0000000105000113
#define THR0_NZ_CTX_TSB_CONFIG_2	0x0000000106000132
#define THR0_NZ_CTX_TSB_CONFIG_3	0x0000000107000151

#define THR1_Z_CTX_TSB_CONFIG_0 	0x0000000108000114
#define THR1_Z_CTX_TSB_CONFIG_1 	0x0000000109000103
#define THR1_Z_CTX_TSB_CONFIG_2 	0x000000010a000132
#define THR1_Z_CTX_TSB_CONFIG_3 	0x000000010b000151
#define THR1_NZ_CTX_TSB_CONFIG_0	0x000000010c000104
#define THR1_NZ_CTX_TSB_CONFIG_1	0x000000010d000103
#define THR1_NZ_CTX_TSB_CONFIG_2	0x000000010e000102
#define THR1_NZ_CTX_TSB_CONFIG_3	0x000000010f000111

#define THR2_Z_CTX_TSB_CONFIG_0 	0x0000000110000114
#define THR2_Z_CTX_TSB_CONFIG_1 	0x0000000111000103
#define THR2_Z_CTX_TSB_CONFIG_2 	0x0000000112000132
#define THR2_Z_CTX_TSB_CONFIG_3 	0x0000000113000151
#define THR2_NZ_CTX_TSB_CONFIG_0	0x0000000114000104
#define THR2_NZ_CTX_TSB_CONFIG_1	0x0000000115000103
#define THR2_NZ_CTX_TSB_CONFIG_2	0x0000000116000102
#define THR2_NZ_CTX_TSB_CONFIG_3	0x0000000117000111

#define THR3_Z_CTX_TSB_CONFIG_0 	0x0000000118000114
#define THR3_Z_CTX_TSB_CONFIG_1 	0x0000000119000103
#define THR3_Z_CTX_TSB_CONFIG_2 	0x000000011a000132
#define THR3_Z_CTX_TSB_CONFIG_3 	0x000000011b000151
#define THR3_NZ_CTX_TSB_CONFIG_0	0x000000011c000104
#define THR3_NZ_CTX_TSB_CONFIG_1	0x000000011d000103
#define THR3_NZ_CTX_TSB_CONFIG_2	0x000000011e000102
#define THR3_NZ_CTX_TSB_CONFIG_3	0x000000011f000111

#define THR4_Z_CTX_TSB_CONFIG_0 	0x0000000120000114
#define THR4_Z_CTX_TSB_CONFIG_1 	0x0000000121000103
#define THR4_Z_CTX_TSB_CONFIG_2 	0x0000000122000132
#define THR4_Z_CTX_TSB_CONFIG_3 	0x0000000123000151
#define THR4_NZ_CTX_TSB_CONFIG_0	0x0000000124000104
#define THR4_NZ_CTX_TSB_CONFIG_1	0x0000000125000103
#define THR4_NZ_CTX_TSB_CONFIG_2	0x0000000126000102
#define THR4_NZ_CTX_TSB_CONFIG_3	0x0000000127000111

#define THR5_Z_CTX_TSB_CONFIG_0 	0x0000000128000114
#define THR5_Z_CTX_TSB_CONFIG_1 	0x0000000129000103
#define THR5_Z_CTX_TSB_CONFIG_2 	0x000000012a000132
#define THR5_Z_CTX_TSB_CONFIG_3 	0x000000012b000151
#define THR5_NZ_CTX_TSB_CONFIG_0	0x000000012c000104
#define THR5_NZ_CTX_TSB_CONFIG_1	0x000000012d000103
#define THR5_NZ_CTX_TSB_CONFIG_2	0x000000012e000102
#define THR5_NZ_CTX_TSB_CONFIG_3	0x000000012f000111

#define THR6_Z_CTX_TSB_CONFIG_0 	0x0000000130000114
#define THR6_Z_CTX_TSB_CONFIG_1 	0x0000000131000103
#define THR6_Z_CTX_TSB_CONFIG_2 	0x0000000132000132
#define THR6_Z_CTX_TSB_CONFIG_3 	0x0000000133000151
#define THR6_NZ_CTX_TSB_CONFIG_0	0x0000000134000104
#define THR6_NZ_CTX_TSB_CONFIG_1	0x0000000135000103
#define THR6_NZ_CTX_TSB_CONFIG_2	0x0000000136000102
#define THR6_NZ_CTX_TSB_CONFIG_3	0x0000000137000111

#define THR7_Z_CTX_TSB_CONFIG_0 	0x0000000138000114
#define THR7_Z_CTX_TSB_CONFIG_1 	0x0000000139000103
#define THR7_Z_CTX_TSB_CONFIG_2 	0x000000013a000132
#define THR7_Z_CTX_TSB_CONFIG_3 	0x000000013b000151
#define THR7_NZ_CTX_TSB_CONFIG_0	0x000000013c000104
#define THR7_NZ_CTX_TSB_CONFIG_1	0x000000013d000103
#define THR7_NZ_CTX_TSB_CONFIG_2	0x000000013e000102
#define THR7_NZ_CTX_TSB_CONFIG_3	0x000000013f000111

#else
	
#define THR0_Z_CTX_TSB_CONFIG_0 	0x8000000100000114
#define THR0_Z_CTX_TSB_CONFIG_1 	0x8000000101000103
#define THR0_Z_CTX_TSB_CONFIG_2 	0x8000000102000102
#define THR0_Z_CTX_TSB_CONFIG_3 	0x8000000103000111
#define THR0_NZ_CTX_TSB_CONFIG_0	0x8000000104000104
#define THR0_NZ_CTX_TSB_CONFIG_1	0x8000000105000113
#define THR0_NZ_CTX_TSB_CONFIG_2	0x8000000106000132
#define THR0_NZ_CTX_TSB_CONFIG_3	0x8000000107000111

#define THR1_Z_CTX_TSB_CONFIG_0 	0x8000000108000114
#define THR1_Z_CTX_TSB_CONFIG_1 	0x8000000109000103
#define THR1_Z_CTX_TSB_CONFIG_2 	0x800000010a000132
#define THR1_Z_CTX_TSB_CONFIG_3 	0x800000010b000111
#define THR1_NZ_CTX_TSB_CONFIG_0	0x800000010c000104
#define THR1_NZ_CTX_TSB_CONFIG_1	0x800000010d000103
#define THR1_NZ_CTX_TSB_CONFIG_2	0x800000010e000102
#define THR1_NZ_CTX_TSB_CONFIG_3	0x800000010f000111

#define THR2_Z_CTX_TSB_CONFIG_0 	0x8000000110000114
#define THR2_Z_CTX_TSB_CONFIG_1 	0x8000000111000103
#define THR2_Z_CTX_TSB_CONFIG_2 	0x8000000112000132
#define THR2_Z_CTX_TSB_CONFIG_3 	0x8000000113000151
#define THR2_NZ_CTX_TSB_CONFIG_0	0x8000000114000104
#define THR2_NZ_CTX_TSB_CONFIG_1	0x8000000115000103
#define THR2_NZ_CTX_TSB_CONFIG_2	0x8000000116000102
#define THR2_NZ_CTX_TSB_CONFIG_3	0x8000000117000111

#define THR3_Z_CTX_TSB_CONFIG_0 	0x8000000118000114
#define THR3_Z_CTX_TSB_CONFIG_1 	0x8000000119000103
#define THR3_Z_CTX_TSB_CONFIG_2 	0x800000011a000132
#define THR3_Z_CTX_TSB_CONFIG_3 	0x800000011b000151
#define THR3_NZ_CTX_TSB_CONFIG_0	0x800000011c000104
#define THR3_NZ_CTX_TSB_CONFIG_1	0x800000011d000103
#define THR3_NZ_CTX_TSB_CONFIG_2	0x800000011e000102
#define THR3_NZ_CTX_TSB_CONFIG_3	0x800000011f000111

#define THR4_Z_CTX_TSB_CONFIG_0 	0x8000000120000114
#define THR4_Z_CTX_TSB_CONFIG_1 	0x8000000121000103
#define THR4_Z_CTX_TSB_CONFIG_2 	0x8000000122000132
#define THR4_Z_CTX_TSB_CONFIG_3 	0x8000000123000151
#define THR4_NZ_CTX_TSB_CONFIG_0	0x8000000124000104
#define THR4_NZ_CTX_TSB_CONFIG_1	0x8000000125000103
#define THR4_NZ_CTX_TSB_CONFIG_2	0x8000000126000102
#define THR4_NZ_CTX_TSB_CONFIG_3	0x8000000127000111

#define THR5_Z_CTX_TSB_CONFIG_0 	0x8000000128000114
#define THR5_Z_CTX_TSB_CONFIG_1 	0x8000000129000103
#define THR5_Z_CTX_TSB_CONFIG_2 	0x800000012a000132
#define THR5_Z_CTX_TSB_CONFIG_3 	0x800000012b000151
#define THR5_NZ_CTX_TSB_CONFIG_0	0x800000012c000104
#define THR5_NZ_CTX_TSB_CONFIG_1	0x800000012d000103
#define THR5_NZ_CTX_TSB_CONFIG_2	0x800000012e000102
#define THR5_NZ_CTX_TSB_CONFIG_3	0x800000012f000111

#define THR6_Z_CTX_TSB_CONFIG_0 	0x8000000130000114
#define THR6_Z_CTX_TSB_CONFIG_1 	0x8000000131000103
#define THR6_Z_CTX_TSB_CONFIG_2 	0x8000000132000132
#define THR6_Z_CTX_TSB_CONFIG_3 	0x8000000133000151
#define THR6_NZ_CTX_TSB_CONFIG_0	0x8000000134000104
#define THR6_NZ_CTX_TSB_CONFIG_1	0x8000000135000103
#define THR6_NZ_CTX_TSB_CONFIG_2	0x8000000136000102
#define THR6_NZ_CTX_TSB_CONFIG_3	0x8000000137000111

#define THR7_Z_CTX_TSB_CONFIG_0 	0x8000000138000114
#define THR7_Z_CTX_TSB_CONFIG_1 	0x8000000139000103
#define THR7_Z_CTX_TSB_CONFIG_2 	0x800000013a000132
#define THR7_Z_CTX_TSB_CONFIG_3 	0x800000013b000151
#define THR7_NZ_CTX_TSB_CONFIG_0	0x800000013c000104
#define THR7_NZ_CTX_TSB_CONFIG_1	0x800000013d000103
#define THR7_NZ_CTX_TSB_CONFIG_2	0x800000013e000102
#define THR7_NZ_CTX_TSB_CONFIG_3	0x800000013f000111

#endif
	
MIDAS_TSB	thr0_z_ctx_tsb_0	THR0_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr0_z_ctx_tsb_1	THR0_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr0_z_ctx_tsb_2	THR0_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr0_z_ctx_tsb_3	THR0_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB	thr0_nz_ctx_tsb_0	THR0_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr0_nz_ctx_tsb_1	THR0_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr0_nz_ctx_tsb_2	THR0_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr0_nz_ctx_tsb_3	THR0_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB	thr1_z_ctx_tsb_0	THR1_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr1_z_ctx_tsb_1	THR1_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr1_z_ctx_tsb_2	THR1_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr1_z_ctx_tsb_3	THR1_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB	thr1_nz_ctx_tsb_0	THR1_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr1_nz_ctx_tsb_1	THR1_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr1_nz_ctx_tsb_2	THR1_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr1_nz_ctx_tsb_3	THR1_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB	thr2_z_ctx_tsb_0	THR2_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr2_z_ctx_tsb_1	THR2_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr2_z_ctx_tsb_2	THR2_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr2_z_ctx_tsb_3	THR2_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB	thr2_nz_ctx_tsb_0	THR2_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr2_nz_ctx_tsb_1	THR2_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr2_nz_ctx_tsb_2	THR2_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr2_nz_ctx_tsb_3	THR2_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB	thr3_z_ctx_tsb_0	THR3_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr3_z_ctx_tsb_1	THR3_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr3_z_ctx_tsb_2	THR3_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr3_z_ctx_tsb_3	THR3_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB	thr3_nz_ctx_tsb_0	THR3_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr3_nz_ctx_tsb_1	THR3_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr3_nz_ctx_tsb_2	THR3_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr3_nz_ctx_tsb_3	THR3_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB	thr4_z_ctx_tsb_0	THR4_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr4_z_ctx_tsb_1	THR4_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr4_z_ctx_tsb_2	THR4_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr4_z_ctx_tsb_3	THR4_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB	thr4_nz_ctx_tsb_0	THR4_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr4_nz_ctx_tsb_1	THR4_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr4_nz_ctx_tsb_2	THR4_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr4_nz_ctx_tsb_3	THR4_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB	thr5_z_ctx_tsb_0	THR5_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr5_z_ctx_tsb_1	THR5_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr5_z_ctx_tsb_2	THR5_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr5_z_ctx_tsb_3	THR5_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB	thr5_nz_ctx_tsb_0	THR5_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr5_nz_ctx_tsb_1	THR5_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr5_nz_ctx_tsb_2	THR5_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr5_nz_ctx_tsb_3	THR5_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB	thr6_z_ctx_tsb_0	THR6_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr6_z_ctx_tsb_1	THR6_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr6_z_ctx_tsb_2	THR6_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr6_z_ctx_tsb_3	THR6_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB	thr6_nz_ctx_tsb_0	THR6_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr6_nz_ctx_tsb_1	THR6_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr6_nz_ctx_tsb_2	THR6_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr6_nz_ctx_tsb_3	THR6_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

MIDAS_TSB	thr7_z_ctx_tsb_0	THR7_Z_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr7_z_ctx_tsb_1	THR7_Z_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr7_z_ctx_tsb_2	THR7_Z_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr7_z_ctx_tsb_3	THR7_Z_CTX_TSB_CONFIG_3   ttefmt=sun4v
MIDAS_TSB	thr7_nz_ctx_tsb_0	THR7_NZ_CTX_TSB_CONFIG_0   ttefmt=sun4v
MIDAS_TSB	thr7_nz_ctx_tsb_1	THR7_NZ_CTX_TSB_CONFIG_1   ttefmt=sun4v
MIDAS_TSB	thr7_nz_ctx_tsb_2	THR7_NZ_CTX_TSB_CONFIG_2   ttefmt=sun4v
MIDAS_TSB	thr7_nz_ctx_tsb_3	THR7_NZ_CTX_TSB_CONFIG_3   ttefmt=sun4v

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
	setx	thr0_priv_code_begin, %g1, %g2
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
	setx	thr1_priv_code_begin, %g1, %g2
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
	setx	thr2_priv_code_begin, %g1, %g2
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
	setx	thr3_priv_code_begin, %g1, %g2
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
	setx	thr4_priv_code_begin, %g1, %g2
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
	setx	thr5_priv_code_begin, %g1, %g2
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
	setx	thr6_priv_code_begin, %g1, %g2
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
	setx	thr7_priv_code_begin, %g1, %g2
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


!#*****************************************************************************************
SECTION .HPTRAPS_EXT_SECT   TEXT_VA=HPTRAPS_EXT_TEXT_PA, DATA_VA=HPTRAPS_EXT_DATA_PA
	
attr_text {
	Name=.HPTRAPS_EXT_SECT,
	hypervisor
}

.text
.global ext_trap_0x64_begin
.global ext_trap_0x68_begin
	
ext_trap_0x64_begin:
	save
	setx	ASI_IMMU_TAG_ACCESS_VAL, %l0, %l1
	ldxa	[%l1] ASI_IMMU_TAG_REG, %g2	!# %g2 = VA + CTX
	setx	0x01fff, %l0, %l1
	and	%g2, %l1, %g3			!# %g3 = context
	or	%g0, 0x1fff, %l0
	xor	%l1, %l0, %l1
	and	%g2, %l1, %g1			!# %g1 = VA
	brnz	%g3, trap_0x64_walk_nonzero_tsb
	nop
	
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2	!# %g2 = TSB config
	call	trap_0x64_function_tsb_ptr_calc
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	trap_0x64_function_tsb_ptr_calc
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	trap_0x64_function_tsb_ptr_calc
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	trap_0x64_function_tsb_ptr_calc
	nop

	EXIT_BAD
	
trap_0x64_walk_nonzero_tsb:	
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	trap_0x64_function_tsb_ptr_calc
	nop
	
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	trap_0x64_function_tsb_ptr_calc
	nop
	
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	trap_0x64_function_tsb_ptr_calc
	nop
	
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	trap_0x64_function_tsb_ptr_calc
	nop
	
	EXIT_BAD

!#
!# Input:
!#	%g1 = va
!#	%g2 = tsb config
!#	%g3 = context
!#
trap_0x64_function_tsb_ptr_calc:	
	set	0x00f, %l0
	and	%g2, %l0, %l3	!# %l3 = tsb size
	setx	tsb_base_mask, %l0, %l2
	umul	%l3, 8, %l4
	add	%l2, %l4, %l2
	ldx	[%l2], %l4	!# %l4 = TSB_base_upper mask
	and	%g2, %l4, %l4	!# %l4 = TSB_base_upper
	
	set	0x070, %l0
	and	%g2, %l0, %l2	
	srlx	%l2, 4, %l1	!# %l1 = page size
	brnz	%l1, trap_0x64_test_page_1
	setx	tsb_va_8k_mask, %l0, %l5
	set	9, %l6
	ba	trap_0x64_compute_tsb_ptr
	nop
trap_0x64_test_page_1:
	sub	%l1, 1, %l2
	brnz	%l2, trap_0x64_test_page_3
	setx	tsb_va_64k_mask, %l0, %l5
	set	12, %l6
	ba	trap_0x64_compute_tsb_ptr
	nop
trap_0x64_test_page_3:
	sub	%l1, 3, %l2
	brnz	%l2, trap_0x64_test_page_5
	setx	tsb_va_4m_mask, %l0, %l5
	set	18, %l6
	ba	trap_0x64_compute_tsb_ptr
	nop
trap_0x64_test_page_5:
	setx	tsb_va_256m_mask, %l0, %l5
	set	24, %l6
trap_0x64_compute_tsb_ptr:	
	umul	%l3, 8, %l0
	add	%l5, %l0, %l5
	ldx	[%l5], %l0	!# %l0 = va mask
	and	%g1, %l0, %l0	
	srlx	%l0, %l6, %l0	!# %l0 = TSB_base_lower
	add	%l4, %l0, %l0	!# %l0 = TSB pointer

	ldx	[%l0], %l2	!# %l2 = tte_tag
	ldx	[%l0+8], %l6	!# %l6 = tte_data

	srlx	%g1, 22, %l0	!# %l0 = shifted VA
	!setx	ASI_PRIMARY_CONTEXT_0_REG_VAL, %l0, %l1
	!ldxa	[%l1] ASI_PRIMARY_CONTEXT_REG, %l1
	sllx	%g3, 48, %l1	!# %l1 = shifted context
	or	%l1, %l0, %l1
	sub	%l1, %l2, %l0
	brz	%l0, trap_0x64_found_matched_tte
	nop
	jmp	%o7 + 8
	nop
trap_0x64_found_matched_tte:
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %l7
	and     %l7, 7, %l7	!# %l7 = TID
	setx	phy_offset_list, %l0, %l2
	umul	%l7, 8, %l3
	add	%l2, %l3, %l2
	ldx	[%l2], %l2	!# %l2 = Phy Offset
	add	%l6, %l2, %l6
	setx	0x000, %l0, %l1
	stxa	%l6, [%l1] ASI_ITLB_DATA_IN
	restore
	retry
	nop
	EXIT_BAD
	
ext_trap_0x68_begin:
	save
	setx	ASI_IMMU_TAG_ACCESS_VAL, %l0, %l1
	ldxa	[%l1] ASI_IMMU_TAG_REG, %g2	!# %g2 = VA + CTX
	setx	0x01fff, %l0, %l1
	and	%g2, %l1, %g3			!# %g3 = context
	or	%g0, 0x1fff, %l0
	xor	%l1, %l0, %l1
	and	%g2, %l1, %g1			!# %g1 = VA
	brnz	%g3, walk_nonzero_tsb
	nop
	
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2	!# %g2 = TSB config
	call	function_tsb_ptr_calc
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	function_tsb_ptr_calc
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	function_tsb_ptr_calc
	nop
	setx	ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	function_tsb_ptr_calc
	nop

	EXIT_BAD
	
walk_nonzero_tsb:	
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	function_tsb_ptr_calc
	nop
	
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	function_tsb_ptr_calc
	nop
	
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	function_tsb_ptr_calc
	nop
	
	setx	ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3, %l0, %l1
	ldxa	[%l1] ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %g2
	call	function_tsb_ptr_calc
	nop
	
	EXIT_BAD

!#
!# Input:
!#	%g1 = va
!#	%g2 = tsb config
!#	%g3 = context
!#
function_tsb_ptr_calc:	
	set	0x00f, %l0
	and	%g2, %l0, %l3	!# %l3 = tsb size
	setx	tsb_base_mask, %l0, %l2
	umul	%l3, 8, %l4
	add	%l2, %l4, %l2
	ldx	[%l2], %l4	!# %l4 = TSB_base_upper mask
	and	%g2, %l4, %l4	!# %l4 = TSB_base_upper
	
	set	0x070, %l0
	and	%g2, %l0, %l2	
	srlx	%l2, 4, %l1	!# %l1 = page size
	brnz	%l1, test_page_1
	setx	tsb_va_8k_mask, %l0, %l5
	set	9, %l6
	ba	compute_tsb_ptr
	nop
test_page_1:
	sub	%l1, 1, %l2
	brnz	%l2, test_page_3
	setx	tsb_va_64k_mask, %l0, %l5
	set	12, %l6
	ba	compute_tsb_ptr
	nop
test_page_3:
	sub	%l1, 3, %l2
	brnz	%l2, test_page_5
	setx	tsb_va_4m_mask, %l0, %l5
	set	18, %l6
	ba	compute_tsb_ptr
	nop
test_page_5:
	setx	tsb_va_256m_mask, %l0, %l5
	set	24, %l6
compute_tsb_ptr:	
	umul	%l3, 8, %l0
	add	%l5, %l0, %l5
	ldx	[%l5], %l0	!# %l0 = va mask
	and	%g1, %l0, %l0	
	srlx	%l0, %l6, %l0	!# %l0 = TSB_base_lower
	add	%l4, %l0, %l0	!# %l0 = TSB pointer

	ldx	[%l0], %l2	!# %l2 = tte_tag
	ldx	[%l0+8], %l6	!# %l6 = tte_data

	srlx	%g1, 22, %l0	!# %l0 = shifted VA
	!setx	ASI_PRIMARY_CONTEXT_0_REG_VAL, %l0, %l1
	!ldxa	[%l1] ASI_PRIMARY_CONTEXT_REG, %l1
	sllx	%g3, 48, %l1	!# %l1 = shifted context
	or	%l1, %l0, %l1
	sub	%l1, %l2, %l0
	brz	%l0, found_matched_tte
	nop
	jmp	%o7 + 8
	nop
found_matched_tte:
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %l7
	and     %l7, 7, %l7	!# %l7 = TID
	setx	phy_offset_list, %l0, %l2
	umul	%l7, 8, %l3
	add	%l2, %l3, %l2
	ldx	[%l2], %l2	!# %l2 = Phy Offset
	add	%l6, %l2, %l6
	setx	0x000, %l0, %l1
	stxa	%l6, [%l1] ASI_DTLB_DATA_IN
	restore
	retry
	nop
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
	
!#*****************************************************************************************
SECTION .THR0_PRIV_SECT   TEXT_VA=THR0_PRIV_TEXT_VA

attr_text {
	Name = .THR0_PRIV_SECT,
	thr0_z_ctx_tsb_1,
	VA = THR0_PRIV_TEXT_VA,
	RA = THR0_PRIV_TEXT_RA,
	PA = THR0_PRIV_TEXT_PA,
	TTE_Context = THR0_PCONTEXT_0,
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
	TTE_Size    = 0,
	}

.text
.global thr0_priv_code_begin
thr0_priv_code_begin:
	setx	THR0_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	
	!# Jump to user code
	rdpr	%pstate, %l2
	setx	thr0_user_code_begin_4v000, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
		
	EXIT_BAD
	nop
	
!#*****************************************************************************************
SECTION .THR1_PRIV_SECT   TEXT_VA=THR1_PRIV_TEXT_VA

attr_text {
	Name = .THR1_PRIV_SECT,
	thr1_nz_ctx_tsb_1,
	VA = THR1_PRIV_TEXT_VA,
	RA = THR1_PRIV_TEXT_RA,
	PA = THR1_PRIV_TEXT_PA,
	TTE_Context = THR1_PCONTEXT_0,
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
	TTE_Size    = 0,
	}

.text
.global thr1_priv_code_begin
thr1_priv_code_begin:
	setx	THR1_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	
	!# Jump to user code
	rdpr	%pstate, %l2
	setx	thr1_user_code_begin_4v000, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
		
	EXIT_BAD
	nop
	
!#*****************************************************************************************
SECTION .THR2_PRIV_SECT   TEXT_VA=THR2_PRIV_TEXT_VA

attr_text {
	Name = .THR2_PRIV_SECT,
	thr2_nz_ctx_tsb_1,
	VA = THR2_PRIV_TEXT_VA,
	RA = THR2_PRIV_TEXT_RA,
	PA = THR2_PRIV_TEXT_PA,
	TTE_Context = THR2_PCONTEXT_0,
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
	TTE_Size    = 0,
	}

.text
.global thr2_priv_code_begin
thr2_priv_code_begin:
	setx	THR2_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	
	!# Jump to user code
	rdpr	%pstate, %l2
	setx	thr2_user_code_begin_4v000, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
		
	EXIT_BAD
	nop
	
!#*****************************************************************************************
SECTION .THR3_PRIV_SECT   TEXT_VA=THR3_PRIV_TEXT_VA

attr_text {
	Name = .THR3_PRIV_SECT,
	thr3_nz_ctx_tsb_1,
	VA = THR3_PRIV_TEXT_VA,
	RA = THR3_PRIV_TEXT_RA,
	PA = THR3_PRIV_TEXT_PA,
	TTE_Context = THR3_PCONTEXT_0,
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
	TTE_Size    = 0,
	}

.text
.global thr3_priv_code_begin
thr3_priv_code_begin:
	setx	THR3_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	
	!# Jump to user code
	rdpr	%pstate, %l2
	setx	thr3_user_code_begin_4v000, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
		
	EXIT_BAD
	nop
	
!#*****************************************************************************************
SECTION .THR4_PRIV_SECT   TEXT_VA=THR4_PRIV_TEXT_VA

attr_text {
	Name = .THR4_PRIV_SECT,
	thr4_nz_ctx_tsb_1,
	VA = THR4_PRIV_TEXT_VA,
	RA = THR4_PRIV_TEXT_RA,
	PA = THR4_PRIV_TEXT_PA,
	TTE_Context = THR4_PCONTEXT_0,
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
	TTE_Size    = 0,
	}

.text
.global thr4_priv_code_begin
thr4_priv_code_begin:
	setx	THR4_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	
	!# Jump to user code
	rdpr	%pstate, %l2
	setx	thr4_user_code_begin_4v000, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
		
	EXIT_BAD
	nop
	
!#*****************************************************************************************
SECTION .THR5_PRIV_SECT   TEXT_VA=THR5_PRIV_TEXT_VA

attr_text {
	Name = .THR5_PRIV_SECT,
	thr5_nz_ctx_tsb_1,
	VA = THR5_PRIV_TEXT_VA,
	RA = THR5_PRIV_TEXT_RA,
	PA = THR5_PRIV_TEXT_PA,
	TTE_Context = THR5_PCONTEXT_0,
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
	TTE_Size    = 0,
	}

.text
.global thr5_priv_code_begin
thr5_priv_code_begin:
	setx	THR5_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	
	!# Jump to user code
	rdpr	%pstate, %l2
	setx	thr5_user_code_begin_4v000, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
		
	EXIT_BAD
	nop
	
!#*****************************************************************************************
SECTION .THR6_PRIV_SECT   TEXT_VA=THR6_PRIV_TEXT_VA

attr_text {
	Name = .THR6_PRIV_SECT,
	thr6_nz_ctx_tsb_1,
	VA = THR6_PRIV_TEXT_VA,
	RA = THR6_PRIV_TEXT_RA,
	PA = THR6_PRIV_TEXT_PA,
	TTE_Context = THR6_PCONTEXT_0,
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
	TTE_Size    = 0,
	}

.text
.global thr6_priv_code_begin
thr6_priv_code_begin:
	setx	THR6_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	
	!# Jump to user code
	rdpr	%pstate, %l2
	setx	thr6_user_code_begin_4v000, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
		
	EXIT_BAD
	nop
	
!#*****************************************************************************************
SECTION .THR7_PRIV_SECT   TEXT_VA=THR7_PRIV_TEXT_VA

attr_text {
	Name = .THR7_PRIV_SECT,
	thr7_nz_ctx_tsb_1,
	VA = THR7_PRIV_TEXT_VA,
	RA = THR7_PRIV_TEXT_RA,
	PA = THR7_PRIV_TEXT_PA,
	TTE_Context = THR7_PCONTEXT_0,
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
	TTE_Size    = 0,
	}

.text
.global thr7_priv_code_begin
thr7_priv_code_begin:
	setx	THR7_PTRAP_TEXT_VA, %l0, %l1
	wrpr	%l1, %g0, %tba
	
	!# Jump to user code
	rdpr	%pstate, %l2
	setx	thr7_user_code_begin_4v000, %l0, %l1
	jmp	%l1
	wrpr	%l2, 4, %pstate
		
	EXIT_BAD
	nop
	
!#*****************************************************************************************
SECTION .THR0_TRAPS   TEXT_VA=THR0_PTRAP_TEXT_VA

attr_text {
	Name = .THR0_TRAPS,
	thr0_z_ctx_tsb_0,
	VA = THR0_PTRAP_TEXT_VA,
	RA = THR0_PTRAP_TEXT_RA,
	PA = THR0_PTRAP_TEXT_PA,
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
	nop
.align	32	!# 9
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
	nop
.align	32	!# 2b
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
	nop
.align	32	!# 65
	nop
.align	32	!# 66
	nop
.align	32	!# 67
	nop
.align	32	!# 68
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
	ta	HP_GOOD_TRAP
	nop
.align	32	!# 101
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

!#*****************************************************************************************
SECTION .THR1_TRAPS   TEXT_VA=THR1_PTRAP_TEXT_VA

attr_text {
	Name = .THR1_TRAPS,
	thr1_z_ctx_tsb_0,
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
	nop
.align	32	!# 9
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
	nop
.align	32	!# 2b
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
	nop
.align	32	!# 65
	nop
.align	32	!# 66
	nop
.align	32	!# 67
	nop
.align	32	!# 68
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
	ta	HP_GOOD_TRAP
	nop
.align	32	!# 101
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

!#*****************************************************************************************
SECTION .THR2_TRAPS   TEXT_VA=THR2_PTRAP_TEXT_VA

attr_text {
	Name = .THR2_TRAPS,
	thr2_z_ctx_tsb_0,
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
	nop
.align	32	!# 9
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
	nop
.align	32	!# 2b
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
	nop
.align	32	!# 65
	nop
.align	32	!# 66
	nop
.align	32	!# 67
	nop
.align	32	!# 68
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
	ta	HP_GOOD_TRAP
	nop
.align	32	!# 101
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

!#*****************************************************************************************
SECTION .THR3_TRAPS   TEXT_VA=THR3_PTRAP_TEXT_VA

attr_text {
	Name = .THR3_TRAPS,
	thr3_z_ctx_tsb_0,
	VA = THR3_PTRAP_TEXT_VA,
	RA = THR3_PTRAP_TEXT_RA,
	PA = THR3_PTRAP_TEXT_PA,
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
	nop
.align	32	!# 9
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
	nop
.align	32	!# 2b
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
	nop
.align	32	!# 65
	nop
.align	32	!# 66
	nop
.align	32	!# 67
	nop
.align	32	!# 68
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
	ta	HP_GOOD_TRAP
	nop
.align	32	!# 101
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

!#*****************************************************************************************
SECTION .THR4_TRAPS   TEXT_VA=THR4_PTRAP_TEXT_VA

attr_text {
	Name = .THR4_TRAPS,
	thr4_z_ctx_tsb_0,
	VA = THR4_PTRAP_TEXT_VA,
	RA = THR4_PTRAP_TEXT_RA,
	PA = THR4_PTRAP_TEXT_PA,
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
	nop
.align	32	!# 9
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
	nop
.align	32	!# 2b
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
	nop
.align	32	!# 65
	nop
.align	32	!# 66
	nop
.align	32	!# 67
	nop
.align	32	!# 68
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
	ta	HP_GOOD_TRAP
	nop
.align	32	!# 101
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

!#*****************************************************************************************
SECTION .THR5_TRAPS   TEXT_VA=THR5_PTRAP_TEXT_VA

attr_text {
	Name = .THR5_TRAPS,
	thr5_z_ctx_tsb_0,
	VA = THR5_PTRAP_TEXT_VA,
	RA = THR5_PTRAP_TEXT_RA,
	PA = THR5_PTRAP_TEXT_PA,
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
	nop
.align	32	!# 9
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
	nop
.align	32	!# 2b
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
	nop
.align	32	!# 65
	nop
.align	32	!# 66
	nop
.align	32	!# 67
	nop
.align	32	!# 68
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
	ta	HP_GOOD_TRAP
	nop
.align	32	!# 101
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

!#*****************************************************************************************
SECTION .THR6_TRAPS   TEXT_VA=THR6_PTRAP_TEXT_VA

attr_text {
	Name = .THR6_TRAPS,
	thr6_z_ctx_tsb_0,
	VA = THR6_PTRAP_TEXT_VA,
	RA = THR6_PTRAP_TEXT_RA,
	PA = THR6_PTRAP_TEXT_PA,
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
	nop
.align	32	!# 9
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
	nop
.align	32	!# 2b
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
	nop
.align	32	!# 65
	nop
.align	32	!# 66
	nop
.align	32	!# 67
	nop
.align	32	!# 68
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
	ta	HP_GOOD_TRAP
	nop
.align	32	!# 101
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

!#*****************************************************************************************
SECTION .THR7_TRAPS   TEXT_VA=THR7_PTRAP_TEXT_VA

attr_text {
	Name = .THR7_TRAPS,
	thr7_z_ctx_tsb_0,
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
	nop
.align	32	!# 9
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
	nop
.align	32	!# 2b
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
	nop
.align	32	!# 65
	nop
.align	32	!# 66
	nop
.align	32	!# 67
	nop
.align	32	!# 68
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
	ta	HP_GOOD_TRAP
	nop
.align	32	!# 101
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
	EXIT_BAD
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
	nop
.align	32	!# 2b
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
HP_trap_0x64:	
	setx	ext_trap_0x64_begin, %l0, %l1
	jmp	%l1
	nop
.align	32	!# 65
	nop
.align	32	!# 66
	nop
.align	32	!# 67
	nop
.align	32	!# 68
HP_trap_0x68:	
	setx	ext_trap_0x68_begin, %l0, %l1
	jmp	%l1
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
SECTION .Thr0_User_Text_4v000 TEXT_VA=THR0_USER_TEXT_4V_VA000
attr_text {
	Name = .Thr0_User_Text_4v000,
	thr0_z_ctx_tsb_2,
	VA = THR0_USER_TEXT_4V_VA000,
	RA = THR0_USER_TEXT_4V_RA000,
	PA = THR0_USER_TEXT_4V_PA000,
	TTE_Context = THR0_PCONTEXT_0,
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
	}
.text
.global thr0_user_code_begin_4v000
thr0_user_code_begin_4v000:
	nop
	setx	thr0_user_data_begin_4v008, %l0, %l5
	ldx	[%l5], %l5
	nop
	EXIT_GOOD

SECTION .Thr0_User_Data_4v008 DATA_VA=THR0_USER_DATA_4V_VA008
attr_data {
        Name = .Thr0_User_Data_4v008,
        thr0_z_ctx_tsb_3,
        VA = THR0_USER_DATA_4V_VA008,
        RA = THR0_USER_DATA_4V_RA008,
        PA = THR0_USER_DATA_4V_PA008,
        TTE_Context = THR0_PCONTEXT_0,
        TTE_V       = 1,
        TTE_NFO     = 0,
        TTE_L       = 0,
        TTE_Soft    = 0,
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
        }
.data
.global thr0_user_data_begin_4v008
thr0_user_data_begin_4v008:
        .word 0x757B
        .word 0xD11E
        .word 0x1178
        .word 0x7320
	
!#*****************************************************************************************
SECTION .Thr1_User_Text_4v000 TEXT_VA=THR1_USER_TEXT_4V_VA000
attr_text {
	Name = .Thr1_User_Text_4v000,
	thr1_nz_ctx_tsb_2,
	VA = THR1_USER_TEXT_4V_VA000,
	RA = THR1_USER_TEXT_4V_RA000,
	PA = THR1_USER_TEXT_4V_PA000,
	TTE_Context = THR1_PCONTEXT_0,
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
	}
.text
.global thr1_user_code_begin_4v000
thr1_user_code_begin_4v000:
	nop
	setx	thr1_user_data_begin_4v008, %l0, %l5
	ldx	[%l5], %l5
	nop
	EXIT_GOOD

SECTION .Thr1_User_Data_4v008 DATA_VA=THR1_USER_DATA_4V_VA008
attr_data {
        Name = .Thr1_User_Data_4v008,
        thr1_nz_ctx_tsb_3,
        VA = THR1_USER_DATA_4V_VA008,
        RA = THR1_USER_DATA_4V_RA008,
        PA = THR1_USER_DATA_4V_PA008,
        TTE_Context = THR1_PCONTEXT_0,
        TTE_V       = 1,
        TTE_NFO     = 0,
        TTE_L       = 0,
        TTE_Soft    = 0,
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
        }
.data
.global thr1_user_data_begin_4v008
thr1_user_data_begin_4v008:
        .word 0x1E25
        .word 0x11E59
        .word 0x91DF
        .word 0x5E6C
	
!#*****************************************************************************************
SECTION .Thr2_User_Text_4v000 TEXT_VA=THR2_USER_TEXT_4V_VA000
attr_text {
	Name = .Thr2_User_Text_4v000,
	thr2_nz_ctx_tsb_2,
	VA = THR2_USER_TEXT_4V_VA000,
	RA = THR2_USER_TEXT_4V_RA000,
	PA = THR2_USER_TEXT_4V_PA000,
	TTE_Context = THR2_PCONTEXT_0,
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
	}
.text
.global thr2_user_code_begin_4v000
thr2_user_code_begin_4v000:
	nop
	setx	thr2_user_data_begin_4v008, %l0, %l5
	ldx	[%l5], %l5
	nop
	EXIT_GOOD

SECTION .Thr2_User_Data_4v008 DATA_VA=THR2_USER_DATA_4V_VA008
attr_data {
        Name = .Thr2_User_Data_4v008,
        thr2_nz_ctx_tsb_3,
        VA = THR2_USER_DATA_4V_VA008,
        RA = THR2_USER_DATA_4V_RA008,
        PA = THR2_USER_DATA_4V_PA008,
        TTE_Context = THR2_PCONTEXT_0,
        TTE_V       = 1,
        TTE_NFO     = 0,
        TTE_L       = 0,
        TTE_Soft    = 0,
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
        }
.data
.global thr2_user_data_begin_4v008
thr2_user_data_begin_4v008:
        .word 0x14040
        .word 0xB8DB
        .word 0x112C0
        .word 0x6738
	
!#*****************************************************************************************
SECTION .Thr3_User_Text_4v000 TEXT_VA=THR3_USER_TEXT_4V_VA000
attr_text {
	Name = .Thr3_User_Text_4v000,
	thr3_nz_ctx_tsb_2,
	VA = THR3_USER_TEXT_4V_VA000,
	RA = THR3_USER_TEXT_4V_RA000,
	PA = THR3_USER_TEXT_4V_PA000,
	TTE_Context = THR3_PCONTEXT_0,
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
	}
.text
.global thr3_user_code_begin_4v000
thr3_user_code_begin_4v000:
	nop
	setx	thr3_user_data_begin_4v008, %l0, %l5
	ldx	[%l5], %l5
	nop
	EXIT_GOOD

SECTION .Thr3_User_Data_4v008 DATA_VA=THR3_USER_DATA_4V_VA008
attr_data {
        Name = .Thr3_User_Data_4v008,
        thr3_nz_ctx_tsb_3,
        VA = THR3_USER_DATA_4V_VA008,
        RA = THR3_USER_DATA_4V_RA008,
        PA = THR3_USER_DATA_4V_PA008,
        TTE_Context = THR3_PCONTEXT_0,
        TTE_V       = 1,
        TTE_NFO     = 0,
        TTE_L       = 0,
        TTE_Soft    = 0,
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
        }
.data
.global thr3_user_data_begin_4v008
thr3_user_data_begin_4v008:
        .word 0xD07C
        .word 0x1F3
        .word 0x1DA0
        .word 0x977D
	
!#*****************************************************************************************
SECTION .Thr4_User_Text_4v000 TEXT_VA=THR4_USER_TEXT_4V_VA000
attr_text {
	Name = .Thr4_User_Text_4v000,
	thr4_nz_ctx_tsb_2,
	VA = THR4_USER_TEXT_4V_VA000,
	RA = THR4_USER_TEXT_4V_RA000,
	PA = THR4_USER_TEXT_4V_PA000,
	TTE_Context = THR4_PCONTEXT_0,
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
	}
.text
.global thr4_user_code_begin_4v000
thr4_user_code_begin_4v000:
	nop
	setx	thr4_user_data_begin_4v008, %l0, %l5
	ldx	[%l5], %l5
	nop
	EXIT_GOOD

SECTION .Thr4_User_Data_4v008 DATA_VA=THR4_USER_DATA_4V_VA008
attr_data {
        Name = .Thr4_User_Data_4v008,
        thr4_nz_ctx_tsb_3,
        VA = THR4_USER_DATA_4V_VA008,
        RA = THR4_USER_DATA_4V_RA008,
        PA = THR4_USER_DATA_4V_PA008,
        TTE_Context = THR4_PCONTEXT_0,
        TTE_V       = 1,
        TTE_NFO     = 0,
        TTE_L       = 0,
        TTE_Soft    = 0,
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
        }
.data
.global thr4_user_data_begin_4v008
thr4_user_data_begin_4v008:
        .word 0xF23F
        .word 0x82F8
        .word 0x3704
        .word 0x6109
	
!#*****************************************************************************************
SECTION .Thr5_User_Text_4v000 TEXT_VA=THR5_USER_TEXT_4V_VA000
attr_text {
	Name = .Thr5_User_Text_4v000,
	thr5_nz_ctx_tsb_2,
	VA = THR5_USER_TEXT_4V_VA000,
	RA = THR5_USER_TEXT_4V_RA000,
	PA = THR5_USER_TEXT_4V_PA000,
	TTE_Context = THR5_PCONTEXT_0,
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
	}
.text
.global thr5_user_code_begin_4v000
thr5_user_code_begin_4v000:
	nop
	setx	thr5_user_data_begin_4v008, %l0, %l5
	ldx	[%l5], %l5
	nop
	EXIT_GOOD

SECTION .Thr5_User_Data_4v008 DATA_VA=THR5_USER_DATA_4V_VA008
attr_data {
        Name = .Thr5_User_Data_4v008,
        thr5_nz_ctx_tsb_3,
        VA = THR5_USER_DATA_4V_VA008,
        RA = THR5_USER_DATA_4V_RA008,
        PA = THR5_USER_DATA_4V_PA008,
        TTE_Context = THR5_PCONTEXT_0,
        TTE_V       = 1,
        TTE_NFO     = 0,
        TTE_L       = 0,
        TTE_Soft    = 0,
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
        }
.data
.global thr5_user_data_begin_4v008
thr5_user_data_begin_4v008:
        .word 0x10BC4
        .word 0x1575F
        .word 0x52FF
        .word 0x10CD1
	
!#*****************************************************************************************
SECTION .Thr6_User_Text_4v000 TEXT_VA=THR6_USER_TEXT_4V_VA000
attr_text {
	Name = .Thr6_User_Text_4v000,
	thr6_nz_ctx_tsb_2,
	VA = THR6_USER_TEXT_4V_VA000,
	RA = THR6_USER_TEXT_4V_RA000,
	PA = THR6_USER_TEXT_4V_PA000,
	TTE_Context = THR6_PCONTEXT_0,
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
	}
.text
.global thr6_user_code_begin_4v000
thr6_user_code_begin_4v000:
	nop
	setx	thr6_user_data_begin_4v008, %l0, %l5
	ldx	[%l5], %l5
	nop
	EXIT_GOOD

SECTION .Thr6_User_Data_4v008 DATA_VA=THR6_USER_DATA_4V_VA008
attr_data {
        Name = .Thr6_User_Data_4v008,
        thr6_nz_ctx_tsb_3,
        VA = THR6_USER_DATA_4V_VA008,
        RA = THR6_USER_DATA_4V_RA008,
        PA = THR6_USER_DATA_4V_PA008,
        TTE_Context = THR6_PCONTEXT_0,
        TTE_V       = 1,
        TTE_NFO     = 0,
        TTE_L       = 0,
        TTE_Soft    = 0,
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
        }
.data
.global thr6_user_data_begin_4v008
thr6_user_data_begin_4v008:
        .word 0x11C98
        .word 0x2DC7
        .word 0x3D3
        .word 0x41BD
	
!#*****************************************************************************************
SECTION .Thr7_User_Text_4v000 TEXT_VA=THR7_USER_TEXT_4V_VA000
attr_text {
	Name = .Thr7_User_Text_4v000,
	thr7_nz_ctx_tsb_2,
	VA = THR7_USER_TEXT_4V_VA000,
	RA = THR7_USER_TEXT_4V_RA000,
	PA = THR7_USER_TEXT_4V_PA000,
	TTE_Context = THR7_PCONTEXT_0,
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
	}
.text
.global thr7_user_code_begin_4v000
thr7_user_code_begin_4v000:
	nop
	setx	thr7_user_data_begin_4v008, %l0, %l5
	ldx	[%l5], %l5
	nop
	EXIT_GOOD

SECTION .Thr7_User_Data_4v008 DATA_VA=THR7_USER_DATA_4V_VA008
attr_data {
        Name = .Thr7_User_Data_4v008,
        thr7_nz_ctx_tsb_3,
        VA = THR7_USER_DATA_4V_VA008,
        RA = THR7_USER_DATA_4V_RA008,
        PA = THR7_USER_DATA_4V_PA008,
        TTE_Context = THR7_PCONTEXT_0,
        TTE_V       = 1,
        TTE_NFO     = 0,
        TTE_L       = 0,
        TTE_Soft    = 0,
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
        }
.data
.global thr7_user_data_begin_4v008
thr7_user_data_begin_4v008:
        .word 0xC8AB
        .word 0x7EAF
        .word 0xC81A
        .word 0xC6C7
	
.end

