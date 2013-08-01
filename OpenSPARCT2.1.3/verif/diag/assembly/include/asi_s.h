/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: asi_s.h
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
! ASI defines for Niagara2
! 
! In some cases, there is more than one name for the same ASI.
! This is so that legacy diags will still run on N2.
!

#ifndef __ASI_S_H__
#define __ASI_S_H__

#define ASI_N                                   ASI_NUCLEUS
#define ASI_NUCLEUS                             0x04
#define ASI_NL                                  ASI_NUCLEUS_LITTLE
#define ASI_NUCLEUS_LITTLE                      0x0c
#define ASI_AIUP                                ASI_AS_IF_USER_PRIMARY
#define ASI_AS_IF_USER_PRIMARY                  0x10
#define ASI_AIUS                                ASI_AS_IF_USER_SECONDARY
#define ASI_AS_IF_USER_SECONDARY                0x11
#define ASI_REAL_MEM                            0X14
#define ASI_REAL_IO                             0x15
#define ASI_BLK_AIUP                            ASI_BLOCK_AS_IF_USER_PRIMARY
#define ASI_BLOCK_AS_IF_USER_PRIMARY            0x16
#define ASI_BLK_AIUP                            ASI_BLOCK_AS_IF_USER_PRIMARY
#define ASI_BLK_AIUS                            ASI_BLOCK_AS_IF_USER_SECONDARY
#define ASI_BLOCK_AS_IF_USER_SECONDARY          0x17
#define ASI_AIUPL                               ASI_AS_IF_USER_PRIMARY_LITTLE
#define ASI_AS_IF_USER_PRIMARY_LITTLE           0x18
#define ASI_AIUSL                               ASI_AS_IF_USER_SECONDARY_LITTLE
#define ASI_AS_IF_USER_SECONDARY_LITTLE         0x19
#define ASI_REAL_MEM_LITTLE                     0x1c
#define ASI_REAL_IO_LITTLE                      0x1d
#define ASI_BLK_AIUPL                           ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE
#define ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE     0x1e
#define ASI_BLK_AIUSL                           ASI_BLOCK_AS_IF_USER_SECONDARY_LITTLE
#define ASI_BLOCK_AS_IF_USER_SECONDARY_LITTLE   0x1f

#define ASI_SCRATCHPAD                          0x20
#define ASI_SCRATCHPAD_0                              0x000
#define ASI_SCRATCHPAD_1                              0x008
#define ASI_SCRATCHPAD_2                              0x010
#define ASI_SCRATCHPAD_3                              0x018
#define ASI_SCRATCHPAD_4                              0x020
#define ASI_SCRATCHPAD_5                              0x028
#define ASI_SCRATCHPAD_6                              0x030
#define ASI_SCRATCHPAD_7                              0x038

#define ASI_PRIMARY_CONTEXT_REG                 0x21
#define ASI_PRIMARY_CONTEXT_0_REG_VAL                 0x008
#define ASI_PRIMARY_CONTEXT_1_REG_VAL                 0x108
#define ASI_SECONDARY_CONTEXT_REG               0x21
#define ASI_SECONDARY_CONTEXT_0_REG_VAL               0x010
#define ASI_SECONDARY_CONTEXT_1_REG_VAL               0x110
#define ASI_AS_IF_USER_BLK_INIT_PRIMARY         0x22
#define ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P   ASI_AS_IF_USER_BLK_INIT_PRIMARY
#define ASI_AS_IF_USER_BLK_INIT_SECONDARY       0x23
#define ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_S   ASI_AS_IF_USER_BLK_INIT_SECONDARY
#define ASI_NUCLEUS_QUAD_LDD                    0x24

#define ASI_QUEUE                                     0x25
#define ASI_CPU_MONDO_QUEUE_HEAD                           0x3c0
#define ASI_CPU_MONDO_QUEUE_TAIL                           0x3c8
#define ASI_DEVICE_QUEUE_HEAD                              0x3d0
#define ASI_DEVICE_QUEUE_TAIL                              0x3d8
#define ASI_RES_ERROR_QUEUE_HEAD                           0x3e0
#define ASI_RES_ERROR_QUEUE_TAIL                           0x3e8
#define ASI_NONRES_ERROR_QUEUE_HEAD                        0x3f0
#define ASI_NONRES_ERROR_QUEUE_TAIL                        0x3f8

#define ASI_QUAD_LDD_REAL                       0x26
#define ASI_NUCLEUS_BLK_INIT_ST_QUAD_LDD        0x27
#define ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE 0x2a
#define ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_S_LITTLE 0x2b
#define ASI_NUCLEUS_QUAD_LDD_LITTLE             0x2c
#define ASI_QUAD_LDD_REAL_LITTLE                0x2e
#define ASI_NUCLEUS_BLK_INIT_ST_QUAD_LDD_LITTLE 0x2f
#define ASI_QUAD_LDD_PHYS                       0x34
#define ASI_QUAD_LDD_PHYS_L                     ASI_QUAD_LDD_PHYS_LITTLE
#define ASI_QUAD_LDD_PHYS_LITTLE                0x3c

#define ASI_SPU                                 0x40
#define ASI_SPU_CWQ_HEAD                              0x000
#define ASI_SPU_CWQ_TAIL                              0x008
#define ASI_SPU_CWQ_FIRST                             0x010
#define ASI_SPU_CWQ_LAST                              0x018
#define ASI_SPU_CWQ_CSR                               0x020
#define ASI_SPU_CWQ_CSR_TE                            0x028
#define ASI_SPU_CWQ_SYNC                              0x030
#define ASI_SPU_MA_CTL                                0x080
#define ASI_SPU_MA_PA                                 0x088
#define ASI_SPU_MA_ADDR                               0x090
#define ASI_SPU_MA_NP                                 0x098
#define ASI_SPU_MA_SYNC                               0x0A0
#define ASI_SPU_CR0                                   0x100
#define ASI_SPU_CR1                                   0x108
#define ASI_SPU_SD0                                   0x110
#define ASI_SPU_SD1                                   0x118
#define ASI_SPU_SD2                                   0x120
#define ASI_SPU_SD3                                   0x128
#define ASI_SPU_SD4                                   0x130
#define ASI_SPU_SD5                                   0x138
#define ASI_SPU_SD6                                   0x140
#define ASI_SPU_SD7                                   0x148
#define ASI_SPU_K0                                    0x150
#define ASI_SPU_K1                                    0x158
#define ASI_SPU_K2                                    0x160
#define ASI_SPU_K3                                    0x168
#define ASI_SPU_IV0                                   0x170
#define ASI_SPU_IV1                                   0x178
#define ASI_SPU_AK0                                   0x180
#define ASI_SPU_AK1                                   0x188
#define ASI_SPU_AK2                                   0x190
#define ASI_SPU_AK3                                   0x198
#define ASI_SPU_CD0                                   0x1a0
#define ASI_SPU_CD1                                   0x1a8
#define ASI_SPU_CD2                                   0x1b0
#define ASI_SPU_CD3                                   0x1b8
#define ASI_SPU_CD4                                   0x1c0
#define ASI_SPU_CD5                                   0x1c8
#define ASI_SPU_CD6                                   0x1d0
#define ASI_SPU_CD7                                   0x1d8
#define ASI_SPU_HD0                                   0x1e0
#define ASI_SPU_HD1                                   0x1e8
#define ASI_SPU_HD2                                   0x1f0
#define ASI_SPU_HD3                                   0x1f8
#define ASI_SPU_SYNC                                  0x208
#define ASI_SPU_RC4_0                                 0x300
#define ASI_SPU_RC4_1                                 0x308
#define ASI_SPU_RC4_2                                 0x310
#define ASI_SPU_RC4_3                                 0x318
#define ASI_SPU_RC4_4                                 0x320
#define ASI_SPU_RC4_5                                 0x328
#define ASI_SPU_RC4_6                                 0x330
#define ASI_SPU_RC4_7                                 0x338
#define ASI_SPU_RC4_8                                 0x340
#define ASI_SPU_RC4_9                                 0x348
#define ASI_SPU_RC4_10                                0x350
#define ASI_SPU_RC4_11                                0x358
#define ASI_SPU_RC4_12                                0x360
#define ASI_SPU_RC4_13                                0x368
#define ASI_SPU_RC4_14                                0x370
#define ASI_SPU_RC4_15                                0x378
#define ASI_SPU_RC4_16                                0x380
#define ASI_SPU_RC4_17                                0x388
#define ASI_SPU_RC4_18                                0x390
#define ASI_SPU_RC4_19                                0x398
#define ASI_SPU_RC4_20                                0x3a0
#define ASI_SPU_RC4_21                                0x3a8
#define ASI_SPU_RC4_22                                0x3b0
#define ASI_SPU_RC4_23                                0x3b8
#define ASI_SPU_RC4_24                                0x3c0
#define ASI_SPU_RC4_25                                0x3c8
#define ASI_SPU_RC4_26                                0x3d0
#define ASI_SPU_RC4_27                                0x3d8
#define ASI_SPU_RC4_28                                0x3e0
#define ASI_SPU_RC4_29                                0x3e8
#define ASI_SPU_RC4_30                                0x3f0
#define ASI_SPU_RC4_31                                0x3f8
#define ASI_SPU_RC4_XY                                0x400

#define ASI_CMP_CORE                                  0x41
#define ASI_CMP_CORE_AVAIL                                 0x000
#define ASI_CMP_CORE_ENABLED                               0x010
#define ASI_CMP_CORE_ENABLE                                0x020
#define ASI_CMP_XIR_STEERING                               0x030
#define ASI_CMP_TICK_ENABLE                                0x038
#define ASI_CMP_CORE_RUNNING_RW                            0x050
#define ASI_CMP_CORE_RUNNING_STATUS                        0x058
#define ASI_CMP_CORE_RUNNING_W1S                           0x060
#define ASI_CMP_CORE_RUNNING_W1C                           0x068

#define ASI_DIAG                                      0x42
#define ASI_SPARC_BIST_CONTROL                             0x000
#define ASI_INST_MASK                                      0x008
#define ASI_LSU_DIAG                                       0x010

#define ASI_ERROR_INJECT                              0x43
#define ASI_SELF_TIMED_MARGIN                         0x44
#define ASI_IFU_CONTROL                               0x44
#define ASI_IFU_CONTROL_VAL                                0x090
#define ASI_LSU_CONTROL                               0x45
#define ASI_DC_DATA                                   ASI_DCACHE_DATA
#define ASI_DCACHE_DATA                               0x46         
#define ASI_DC_TAG                                    ASI_DCACHE_TAG
#define ASI_DCACHE_TAG                                0x47          

#define ASI_IRF_ECC_REG                               0x48
#define ASI_FRF_ECC_REG                               0x49
#define ASI_STB_ACCESS                                0x4a

#define ASI_SPARC_ERROR_EN_REG                        0x4b
#define ASI_ESTATE_ERROR_EN_REG                      ASI_SPARC_ERROR_EN_REG
#define ASI_SPARC_ERROR_STATUS_REG                    0x4c
#define ASI_AFSR                                     ASI_SPARC_ERROR_STATUS_REG
#define ASI_ASYNC_FAULT_STATUS                       ASI_SPARC_ERROR_STATUS_REG 
#define ASI_SPARC_ERROR_ADDRESS_REG                   0x4d
#define ASI_AFAR                                     ASI_SPARC_ERROR_ADDRESS_REG
#define ASI_ASYNC_FAULT_ADDR                         ASI_SPARC_ERROR_ADDRESS_REG

#define ASI_SPARC_PWR_MGMT                            0x4e
#define ASI_HYP_SCRATCHPAD                            0x4f
#define ASI_HYP_SCRATCHPAD_0                               0x000
#define ASI_HYP_SCRATCHPAD_1                               0x008
#define ASI_HYP_SCRATCHPAD_2                               0x010
#define ASI_HYP_SCRATCHPAD_3                               0x018
#define ASI_HYP_SCRATCHPAD_4                               0x020
#define ASI_HYP_SCRATCHPAD_5                               0x028
#define ASI_HYP_SCRATCHPAD_6                               0x030
#define ASI_HYP_SCRATCHPAD_7                               0x038

#define ASI_IMMU                                      0x50   /* Legacy name */
#define ASI_IMMU_TAG_REG                              0x50
#define ASI_IMMU_TAG_TARGET_VAL                            0x000
#define ASI_IMMU_SFSR_VAL                                  0x018
#define ASI_IMMU_TAG_ACCESS_VAL                            0x030
#define ASI_MMU_REAL_RANGE                            0x52
#define ASI_MMU_REAL_RANGE_0                               0x108
#define ASI_MMU_REAL_RANGE_1                               0x110
#define ASI_MMU_REAL_RANGE_2                               0x118
#define ASI_MMU_REAL_RANGE_3                               0x120
#define ASI_MMU_PHYSICAL_OFFSET                       0x52
#define ASI_MMU_PHYSICAL_OFFSET_0                          0x208
#define ASI_MMU_PHYSICAL_OFFSET_1                          0x210
#define ASI_MMU_PHYSICAL_OFFSET_2                          0x218
#define ASI_MMU_PHYSICAL_OFFSET_3                          0x220
#define ASI_ITLB_PROBE                                0x53
#define ASI_ITLB_DATA_IN                              0x54
#define ASI_ITLB_DATA_IN_0                                 0x000
#define ASI_ITLB_DATA_IN_1                                 0x400
#define ASI_ITLB_DATA_IN_2                                 0x800
#define ASI_ITLB_DATA_IN_3                                 0xc00
#define ASI_MMU_ZERO_CONTEXT_TSB_CONFIG               0x54
#define ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0                  0x010
#define ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1                  0x018
#define ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2                  0x020
#define ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3                  0x028
#define ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG            0x54
#define ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0               0x030
#define ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1               0x038
#define ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2               0x040
#define ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3               0x048
#define ASI_ITSB_PTR                                  0x54
#define ASI_ITSB_PTR_0                                     0x050
#define ASI_ITSB_PTR_1                                     0x058
#define ASI_ITSB_PTR_2                                     0x060
#define ASI_ITSB_PTR_3                                     0x068
#define ASI_DTSB_PTR                                  0x54
#define ASI_DTSB_PTR_0                                     0x070
#define ASI_DTSB_PTR_1                                     0x078
#define ASI_DTSB_PTR_2                                     0x080
#define ASI_DTSB_PTR_3                                     0x088

#define ASI_ITLB_DATA_ACCESS_REG                 0x55
#define ASI_ITLB_TAG_READ_REG                    0x56
#define ASI_IMMU_DEMAP                           0x57      
#define ASI_IMMU_DEMAP_VAL                            0x000

#define ASI_TSB_SEARCH_MODE_REG                  0X58
#define ASI_TSB_SEARCH_MODE_ADDR                      0X40

#define ASI_DMMU                                 0x58
#define ASI_DMMU_TAG_TARGET                           0x000
#define ASI_DMMU_SFSR                                 0x018
#define ASI_DMMU_SFAR                                 0x020
#define ASI_DMMU_TAG_REG                         0x58
#define ASI_DMMU_TAG_ACCESS_VAL                       0x030
#define ASI_DMMU_VA_WATCHPOINT                   0x58
#define ASI_DMMU_VA_WATCHPOINT_VAL                    0x038
#define ASI_DMMU_PA_WATCHPOINT                   0x58
#define ASI_DMMU_PA_WATCHPOINT_VAL                    0x038
#define ASI_PARTITION_ID                         0x58
#define ASI_PARTITION_ID_VAL                          0x080

#define ASI_DTLB_DATA_IN                         0x5c
#define ASI_DTLB_DATA_IN_0                            0x000
#define ASI_DTLB_DATA_IN_1                            0x400
#define ASI_DTLB_DATA_IN_2                            0x800
#define ASI_DTLB_DATA_IN_3                            0xc00
#define ASI_DTLB_DATA_ACCESS_REG                 0x5d
#define ASI_DTLB_TAG_READ_REG                    0x5e
#define ASI_DMMU_DEMAP                           0x5f
#define ASI_DMMU_DEMAP_VAL                            0x000

#define ASI_INSTR                                0x60       
#define ASI_INSTRUCTION_BREAKPOINT                    0x000
#define ASI_INSTRUCTION_BREAKPOINT_CONTROL            0x008
#define ASI_INSTR_VA_WATCHPOINT                  0x58
#define ASI_INSTR_VA_WATCHPOINT_VAL                    0x038

#define ASI_CMP_CORE_ID_BASE                     0x63
#define ASI_CMP_CORE_INTR_ID                          0x000
#define ASI_CMP_CORE_ID                               0x010
#define ASI_CORE_ID                              0x63
#define ASI_CORE_ID_VA                                0x10
#define ASI_INTR_ID                              0x63
#define ASI_INTR_ID_VA                                0x00


#define ASI_IC_INSTR                            ASI_ICACHE_INSTR
#define ASI_ICACHE_INSTR                        0x66
#define ASI_IC_TAG                              ASI_ICACHE_TAG
#define ASI_ICACHE_TAG                          0x67

#define ASI_INTR_RECEIVE                        0x72
#define ASI_INTR_W                              0x73
#define ASI_INTR_R                              0x74
#define ASI_SWVR_INTR_RECEIVE                   ASI_INTR_RECEIVE
#define ASI_SWVR_UDB_INTR_W                     ASI_INTR_W
#define ASI_SWVR_UDB_INTR_R                     ASI_INTR_R
#define ASI_SWVR_INTR_W                         ASI_INTR_W
#define ASI_SWVR_INTR_R                         ASI_INTR_R

#define ASI_P                                   ASI_PRIMARY
#define ASI_PRIMARY                             0x80
#define ASI_S                                   ASI_SECONDARY
#define ASI_SECONDARY                           0x81
#define ASI_PNF                                 ASI_PRIMARY_NO_FAULT
#define ASI_PRIMARY_NO_FAULT                    0x82
#define ASI_SNF                                 ASI_SECONDARY_NO_FAULT
#define ASI_SECONDARY_NO_FAULT                  0x83
#define ASI_PL                                  ASI_PRIMARY_LITTLE
#define ASI_PRIMARY_LITTLE                      0x88
#define ASI_SL                                  ASI_SECONDARY_LITTLE
#define ASI_SECONDARY_LITTLE                    0x89
#define ASI_PNFL                                ASI_PRIMARY_NO_FAULT_LITTLE
#define ASI_PRIMARY_NO_FAULT_LITTLE             0x8a
#define ASI_SNFL                                ASI_SECONDARY_NO_FAULT_LITTLE
#define ASI_SECONDARY_NO_FAULT_LITTLE           0x8b

#define ASI_PST8_P                              ASI_PST8_PRIMARY
#define ASI_PST8_PRIMARY                        0xc0
#define ASI_PST8_S                              ASI_PST8_SECONDARY
#define ASI_PST8_SECONDARY                      0xc1
#define ASI_PST16_P                             ASI_PST16_PRIMARY
#define ASI_PST16_PRIMARY                       0xc2
#define ASI_PST16_S                             ASI_PST16_SECONDARY
#define ASI_PST16_SECONDARY                     0xc3
#define ASI_PST32_P                             ASI_PST32_PRIMARY
#define ASI_PST32_PRIMARY                       0xc4
#define ASI_PST32_S                             ASI_PST32_SECONDARY
#define ASI_PST32_SECONDARY                     0xc5
#define ASI_PST8_PL                             ASI_PST8_PRIMARY_LITTLE
#define ASI_PST8_PRIMARY_LITTLE                 0xc8
#define ASI_PST8_SL                             ASI_PST8_SECONDARY_LITTLE
#define ASI_PST8_SECONDARY_LITTLE               0xc9
#define ASI_PST16_PL                            ASI_PST16_PRIMARY_LITTLE
#define ASI_PST16_PRIMARY_LITTLE                0xca
#define ASI_PST16_SL                            ASI_PST16_SECONDARY_LITTLE
#define ASI_PST16_SECONDARY_LITTLE              0xcb
#define ASI_PST32_PL                            ASI_PST32_PRIMARY_LITTLE
#define ASI_PST32_PRIMARY_LITTLE                0xcc
#define ASI_PST32_SL                            ASI_PST32_SECONDARY_LITTLE
#define ASI_PST32_SECONDARY_LITTLE              0xcd
#define ASI_FL8_P                               ASI_FL8_PRIMARY
#define ASI_FL8_PRIMARY                         0xd0
#define ASI_FL8_S                               ASI_FL8_SECONDARY 
#define ASI_FL8_SECONDARY                       0xd1
#define ASI_FL16_P                              ASI_FL16_PRIMARY
#define ASI_FL16_PRIMARY                        0xd2
#define ASI_FL16_S                              ASI_FL16_SECONDARY
#define ASI_FL16_SECONDARY                      0xd3
#define ASI_FL8_PL                              ASI_FL8_PRIMARY_LITTLE
#define ASI_FL8_PRIMARY_LITTLE                  0xd8
#define ASI_FL8_SL                              ASI_FL8_SECONDARY_LITTLE
#define ASI_FL8_SECONDARY_LITTLE                0xd9
#define ASI_FL16_PL                             ASI_FL16_PRIMARY_LITTLE
#define ASI_FL16_PRIMARY_LITTLE                 0xda
#define ASI_FL16_SL                             ASI_FL16_SECONDARY_LITTLE
#define ASI_FL16_SECONDARY_LITTLE               0xdb

#define ASI_BLK_COMMIT_PRIMARY                  0xe0
#define ASI_BLK_COMMIT_P                        ASI_BLK_COMMIT_PRIMARY
#define ASI_COMMIT_P                            ASI_BLK_COMMIT_PRIMARY
#define ASI_COMMIT_PRIMARY                      ASI_BLK_COMMIT_PRIMARY
#define ASI_BLK_COMMIT_SECONDARY                0xe1
#define ASI_BLK_COMMIT_S                        ASI_BLK_COMMIT_SECONDARY
#define ASI_COMMIT_S                            ASI_BLK_COMMIT_SECONDARY
#define ASI_COMMIT_SECONDARY                    ASI_BLK_COMMIT_SECONDARY
#define ASI_BLK_INIT_ST_QUAD_LDD_P              0xe2
#define ASI_BLK_INIT_ST_QUAD_LDD_S              0xe3
#define ASI_BLK_INIT_ST_QUAD_LDD_P_LITTLE       0xea
#define ASI_BLK_INIT_ST_QUAD_LDD_S_LITTLE       0xeb
#define ASI_BLK_P                               ASI_BLOCK_PRIMARY
#define ASI_BLOCK_PRIMARY                       0xf0
#define ASI_BLK_P                               ASI_BLOCK_PRIMARY
#define ASI_BLK_S                               ASI_BLOCK_SECONDARY
#define ASI_BLOCK_SECONDARY                     0xf1
#define ASI_BLK_PL                              ASI_BLOCK_PRIMARY_LITTLE
#define ASI_BLOCK_PRIMARY_LITTLE                0xf8
#define ASI_BLK_SL                              ASI_BLOCK_SECONDARY_LITTLE
#define ASI_BLOCK_SECONDARY_LITTLE              0xf9
#define ASI_STB_ACCESS              		0x4a	

#define  ASI_DESR               0x4c
#define  ASI_DFESR              0x4c
#define  ASI_DSFSR              0x58
#define  ASI_ISFSR              0x50
#define  ASI_SFAR               0x58
#define  ASI_CETER              0x4C
#define  ASI_CERER              0x4C
#define  ASI_ERR_INJ            0x43
#define  ASI_TICK_ACCESS        0x5A
#define  ASI_SCRATCHPAD_ACCESS  0x59
#define  ASI_TSA_ACCESS         0x5B
#define  ASI_IRF_ECC_REG        0x48
#define  ASI_FRF_ECC_REG        0x49
#define  DFESR_VA               0x8
#define  SFSR_VA                0x18
#define  SFAR_VA                0x20
#define  CETER_VA               0x18
#define  CERER_VA               0x10

#endif /* __ASI_S_H__ */
