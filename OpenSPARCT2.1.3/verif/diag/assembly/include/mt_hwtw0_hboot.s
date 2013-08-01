/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mt_hwtw0_hboot.s
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
#ifndef __HBOOT_S__
#define __HBOOT_S__

#ifdef CONFIG_M4
#include S2MEM_DEFINES
#else
#include "config.m4"
#endif
    
#include "constants.h"
#include "xlate.h"
        
#ifdef S2MEM_DEFINES
#include S2MEM_DEFINES
#else
#include "defines.h"
#endif
    
#ifdef S2MEM_MACROS
#include S2MEM_MACROS
#else
#include "macros.m4"
#include "macros.h" /* macro from SUN legacy diags */
#endif  

    
.global Power_On_Reset

SECTION .RED_SEC TEXT_VA = 0xfffffffff0000000, DATA_VA = 0xfffffffff0010000

#ifndef ALL_PAGE_CUSTOM_MAP
attr_text {
    Name=.RED_SEC,
    hypervisor
}
#endif

#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name=.RED_SEC,
    hypervisor
}
#endif

.text

RESERVED_0: !Should not come here
        nop
        nop
        nop
        nop
    nop
        nop
        nop
        nop

Power_On_Reset:
#ifdef  My_Power_On_Reset
    My_Power_On_Reset
#else
    setx HRedmode_Reset_Handler, %g1, %g2
    jmp %g2
    nop
#endif

.align 32
    
Watchdog_Reset:
#ifdef  My_Watchdog_Reset
    My_Watchdog_Reset
#else
    setx Watchdog_Reset_Handler, %g1, %g2
    jmp %g2
    nop 
#endif
    

.align 32
    
External_Reset:
#ifdef  My_External_Reset
    My_External_Reset
#else
    setx External_Reset_Handler, %g1, %g2
    jmp %g2
    nop 
#endif

.align 32
    
Software_Initiated_Reset:
#ifdef  My_Software_Initiated_Reset
    My_Software_Initiated_Reset
#else
    setx Software_Reset_Handler, %g1, %g2
    jmp %g2
    nop
#endif

.align 32
    
RED_Mode_Other_Reset:
#ifdef  My_RED_Mode_Other_Reset
    My_RED_Mode_Other_Reset
#else
    nop 
    nop 
    nop
#endif


SECTION .RED_EXT_SEC TEXT_VA = HV_RED_TEXT_PA, DATA_VA = HV_RED_DATA_PA

#ifndef ALL_PAGE_CUSTOM_MAP
attr_text {
    Name=.RED_EXT_SEC,
    hypervisor
}
#endif

#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name=.RED_EXT_SEC,
    hypervisor
}
#endif

.text

.global HRedmode_Reset_Handler
! align HRedmode_Reset_Handler to 0x40020 so that
! we can have an option to boot straight from DRAM
! instead of 0xfff0000020
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
HRedmode_Reset_Handler:

#ifdef S2MEM_RED_RESET_HANDLER
#include S2MEM_RED_RESET_HANDLER
#else
#include "trap0x33_hred_reset_handler.s"
#endif  

.global Watchdog_Reset_Handler
Watchdog_Reset_Handler:

#ifdef S2MEM_WATCHDOG_RESET_HANDLER
#include S2MEM_WATCHDOG_RESET_HANDLER
#else
#include "watchdog_reset_handler.s"
#endif  

.global External_Reset_Handler
External_Reset_Handler:

#ifdef S2MEM_EXTERNAL_RESET_HANDLER
#include S2MEM_EXTERNAL_RESET_HANDLER
#else
#include "external_reset_handler.s"
#endif  

.global Software_Reset_Handler
Software_Reset_Handler:

#ifdef S2MEM_SOFTWARE_RESET_HANDLER
#include S2MEM_SOFTWARE_RESET_HANDLER
#else
#include "software_reset_handler.s"
#endif  

.data
part_id_list:
    .xword  THR_0_PARTID, THR_1_PARTID, THR_2_PARTID, THR_3_PARTID
    .xword  THR_4_PARTID, THR_5_PARTID, THR_6_PARTID, THR_7_PARTID
    .xword  THR_8_PARTID, THR_9_PARTID, THR_10_PARTID, THR_11_PARTID
    .xword  THR_12_PARTID, THR_13_PARTID, THR_14_PARTID, THR_15_PARTID
    .xword  THR_16_PARTID, THR_17_PARTID, THR_18_PARTID, THR_19_PARTID
    .xword  THR_20_PARTID, THR_21_PARTID, THR_22_PARTID, THR_23_PARTID
    .xword  THR_24_PARTID, THR_25_PARTID, THR_26_PARTID, THR_27_PARTID
    .xword  THR_28_PARTID, THR_29_PARTID, THR_30_PARTID, THR_31_PARTID
    .xword  THR_32_PARTID, THR_33_PARTID, THR_34_PARTID, THR_35_PARTID
    .xword  THR_36_PARTID, THR_37_PARTID, THR_38_PARTID, THR_39_PARTID
    .xword  THR_40_PARTID, THR_41_PARTID, THR_42_PARTID, THR_43_PARTID
    .xword  THR_44_PARTID, THR_45_PARTID, THR_46_PARTID, THR_47_PARTID
    .xword  THR_48_PARTID, THR_49_PARTID, THR_50_PARTID, THR_51_PARTID
    .xword  THR_52_PARTID, THR_53_PARTID, THR_54_PARTID, THR_55_PARTID
    .xword  THR_56_PARTID, THR_57_PARTID, THR_58_PARTID, THR_59_PARTID
    .xword  THR_60_PARTID, THR_61_PARTID, THR_62_PARTID, THR_63_PARTID

.global partition_base_list
partition_base_list:
    .xword  PART_0_BASE, PART_1_BASE, PART_2_BASE, PART_3_BASE
    .xword  PART_4_BASE, PART_5_BASE, PART_6_BASE, PART_7_BASE

tsb_config_base_list:
    .xword  part_0_z_tsb_config_0, part_0_nz_tsb_config_0
    .xword  part_0_z_tsb_config_1, part_0_nz_tsb_config_1
    .xword  part_0_z_tsb_config_2, part_0_nz_tsb_config_2
    .xword  part_0_z_tsb_config_3, part_0_nz_tsb_config_3
    .xword  0x0, 0x0
    .xword  part_1_z_tsb_config_0, part_1_nz_tsb_config_0
    .xword  part_1_z_tsb_config_1, part_1_nz_tsb_config_1
    .xword  part_1_z_tsb_config_2, part_1_nz_tsb_config_2
    .xword  part_1_z_tsb_config_3, part_1_nz_tsb_config_3
    .xword  0x0, 0x0
    .xword  part_2_z_tsb_config_0, part_2_nz_tsb_config_0
    .xword  part_2_z_tsb_config_1, part_2_nz_tsb_config_1
    .xword  part_2_z_tsb_config_2, part_2_nz_tsb_config_2
    .xword  part_2_z_tsb_config_3, part_2_nz_tsb_config_3
    .xword  0x0, 0x0
    .xword  part_3_z_tsb_config_0, part_3_nz_tsb_config_0
    .xword  part_3_z_tsb_config_1, part_3_nz_tsb_config_1
    .xword  part_3_z_tsb_config_2, part_3_nz_tsb_config_2
    .xword  part_3_z_tsb_config_3, part_3_nz_tsb_config_3
    .xword  0x0, 0x0
    .xword  part_4_z_tsb_config_0, part_4_nz_tsb_config_0
    .xword  part_4_z_tsb_config_1, part_4_nz_tsb_config_1
    .xword  part_4_z_tsb_config_2, part_4_nz_tsb_config_2
    .xword  part_4_z_tsb_config_3, part_4_nz_tsb_config_3
    .xword  0x0, 0x0
    .xword  part_5_z_tsb_config_0, part_5_nz_tsb_config_0
    .xword  part_5_z_tsb_config_1, part_5_nz_tsb_config_1
    .xword  part_5_z_tsb_config_2, part_5_nz_tsb_config_2
    .xword  part_5_z_tsb_config_3, part_5_nz_tsb_config_3
    .xword  0x0, 0x0
    .xword  part_6_z_tsb_config_0, part_6_nz_tsb_config_0
    .xword  part_6_z_tsb_config_1, part_6_nz_tsb_config_1
    .xword  part_6_z_tsb_config_2, part_6_nz_tsb_config_2
    .xword  part_6_z_tsb_config_3, part_6_nz_tsb_config_3
    .xword  0x0, 0x0
    .xword  part_7_z_tsb_config_0, part_7_nz_tsb_config_0
    .xword  part_7_z_tsb_config_1, part_7_nz_tsb_config_1
    .xword  part_7_z_tsb_config_2, part_7_nz_tsb_config_2
    .xword  part_7_z_tsb_config_3, part_7_nz_tsb_config_3
    .xword  0x0, 0x0

sync_thr_counter:
    .xword  0x0

SECTION .HPRIV_RESET        TEXT_VA=PRIV_RESET_VA
#ifndef ALL_PAGE_CUSTOM_MAP
changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[
attr_text {
    Name = .HPRIV_RESET,
    RA = PRIV_RESET_RA,
    PA = ra2pa2(PRIV_RESET_RA,i),
    [part_]i[_ctx_nonzero_tsb_config_0],
    [part_]i[_ctx_zero_tsb_config_0],
    TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
    TTE_E=0,      TTE_P=1,        TTE_W=1
    }
])dnl
])dnl
changequote(`,')dnl'
#endif

.global HPriv_Reset_Handler
    
HPriv_Reset_Handler:

#ifdef S2MEM_PRIV_RESET_HANDLER
#include S2MEM_PRIV_RESET_HANDLER
#else
#include "hpriv_reset_handler.s"
#endif  

SECTION .HTRAPS            TEXT_VA=HV_TRAP_BASE_PA, DATA_VA=HV_TRAP_DATA_PA
#ifndef ALL_PAGE_CUSTOM_MAP
attr_text {
    Name = .HTRAPS,
    hypervisor,
    }
attr_data {
    Name = .HTRAPS,
    hypervisor,
    }
#endif

#include "htraps.s"

#ifndef NO_DECLARE_TSB  
#ifndef GOLDFINGER
    
#ifdef PART_0_USED
SECTION .PART_0_CTX_ZERO_TSB_0   DATA_VA=PART0_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_0_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_0_CTX_NONZERO_TSB__0    DATA_VA=PART0_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_0_CTX_NONZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_0_CTX_ZERO_TSB_0    DATA_VA=PART0_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_0_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_0_CTX_NONZERO_TSB_0   DATA_VA=PART0_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_0_CTX_NONZERO_TSB_0,   
    hypervisor
    }
#endif

SECTION .PART_0_CTX_ZERO_TSB_1   DATA_VA=PART0_Z_ADDR_1
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_0_CTX_ZERO_TSB_1,
    hypervisor
    }
#endif
SECTION .PART_0_CTX_NONZERO_TSB_1    DATA_VA=PART0_NZ_ADDR_1
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_0_CTX_NONZERO_TSB_1,
    hypervisor
    }
#endif
SECTION .PART_0_CTX_ZERO_TSB_1    DATA_VA=PART0_Z_ADDR_1
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_0_CTX_ZERO_TSB_1,
    hypervisor
    }
#endif
SECTION .PART_0_CTX_NONZERO_TSB_1   DATA_VA=PART0_NZ_ADDR_1
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_0_CTX_NONZERO_TSB_1,   
    hypervisor
    }
#endif
SECTION .PART_0_TSB_LINK   DATA_VA=PART_0_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_0_TSB_LINK,    
    hypervisor
    }
#endif
#endif

#ifdef PART_1_USED
SECTION .PART_1_CTX_ZERO_TSB_0   DATA_VA=PART1_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_1_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_1_CTX_NONZERO_TSB_0    DATA_VA=PART1_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_1_CTX_NONZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_1_CTX_ZERO_TSB_0    DATA_VA=PART1_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_1_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_1_CTX_NONZERO_TSB_0   DATA_VA=PART1_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_1_CTX_NONZERO_TSB_0,   
    hypervisor
    }
#endif
SECTION .PART_1_TSB_LINK   DATA_VA=PART_1_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_1_TSB_LINK,    
    hypervisor
    }
#endif
#endif

#ifdef PART_2_USED
SECTION .PART_2_CTX_ZERO_TSB_0   DATA_VA=PART2_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_2_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_2_CTX_NONZERO_TSB_0    DATA_VA=PART2_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_2_CTX_NONZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_2_CTX_ZERO_TSB_0    DATA_VA=PART2_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_2_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_2_CTX_NONZERO_TSB_0   DATA_VA=PART2_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_2_CTX_NONZERO_TSB_0,   
    hypervisor
    }
#endif
SECTION .PART_2_TSB_LINK   DATA_VA=PART_2_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_2_TSB_LINK,    
    hypervisor
    }
#endif
#endif

#ifdef PART_3_USED
SECTION .PART_3_CTX_ZERO_TSB_0   DATA_VA=PART3_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_3_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_3_CTX_NONZERO_TSB_0    DATA_VA=PART3_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_3_CTX_NONZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_3_CTX_ZERO_TSB_0    DATA_VA=PART3_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_3_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_3_CTX_NONZERO_TSB_0   DATA_VA=PART3_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_3_CTX_NONZERO_TSB_0,   
    hypervisor
    }
#endif
SECTION .PART_3_TSB_LINK   DATA_VA=PART_3_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_3_TSB_LINK,    
    hypervisor
    }
#endif
#endif

#ifdef PART_4_USED
SECTION .PART_4_CTX_ZERO_TSB_0   DATA_VA=PART4_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_4_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_4_CTX_NONZERO_TSB_0    DATA_VA=PART4_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_4_CTX_NONZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_4_CTX_ZERO_TSB_0    DATA_VA=PART4_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_4_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_4_CTX_NONZERO_TSB_0   DATA_VA=PART4_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_4_CTX_NONZERO_TSB_0,   
    hypervisor
    }
#endif
SECTION .PART_4_TSB_LINK   DATA_VA=PART_4_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_4_TSB_LINK,    
    hypervisor
    }
#endif
#endif

#ifdef PART_5_USED
SECTION .PART_5_CTX_ZERO_TSB_0   DATA_VA=PART5_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_5_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_5_CTX_NONZERO_TSB_0    DATA_VA=PART5_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_5_CTX_NONZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_5_CTX_ZERO_TSB_0    DATA_VA=PART5_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_5_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_5_CTX_NONZERO_TSB_0   DATA_VA=PART5_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_5_CTX_NONZERO_TSB_0,   
    hypervisor
    }
#endif
SECTION .PART_5_TSB_LINK   DATA_VA=PART_5_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_5_TSB_LINK,    
    hypervisor
    }
#endif
#endif

#ifdef PART_6_USED
SECTION .PART_6_CTX_ZERO_TSB_0   DATA_VA=PART6_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_6_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_6_CTX_NONZERO_TSB_0    DATA_VA=PART6_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_6_CTX_NONZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_6_CTX_ZERO_TSB_0    DATA_VA=PART6_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_6_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_6_CTX_NONZERO_TSB_0   DATA_VA=PART6_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_6_CTX_NONZERO_TSB_0,   
    hypervisor
    }
#endif
SECTION .PART_6_TSB_LINK   DATA_VA=PART_6_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_6_TSB_LINK,    
    hypervisor
    }
#endif
#endif

#ifdef PART_7_USED
SECTION .PART_7_CTX_ZERO_TSB_0   DATA_VA=PART7_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_7_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_7_CTX_NONZERO_TSB_0    DATA_VA=PART7_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_7_CTX_NONZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_7_CTX_ZERO_TSB_0    DATA_VA=PART7_Z_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_7_CTX_ZERO_TSB_0,
    hypervisor
    }
#endif
SECTION .PART_7_CTX_NONZERO_TSB_0   DATA_VA=PART7_NZ_ADDR_0
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_7_CTX_NONZERO_TSB_0,   
    hypervisor
    }
#endif
SECTION .PART_7_TSB_LINK   DATA_VA=PART_7_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
    Name = .PART_7_TSB_LINK,    
    hypervisor
    }
#endif
#endif
#endif
#endif
    
            
SECTION .TRAPS         TEXT_VA=TRAP_BASE_VA, DATA_VA=TRAP_DATA_VA
#ifndef ALL_PAGE_CUSTOM_MAP
changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[ 
attr_text {
    Name = .TRAPS,
    RA = TRAP_BASE_RA,
    PA = ra2pa2(TRAP_BASE_RA,i),
    [part_]i[_ctx_zero_tsb_config_0],
    TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
    TTE_E=0,      TTE_P=1,        TTE_W=1
    }
attr_data {
    Name = .TRAPS,  
    RA = TRAP_DATA_RA,
    PA = ra2pa2(TRAP_DATA_RA,i),
    [part_]i[_ctx_zero_tsb_config_0],
    TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
    TTE_E=0,      TTE_P=1,        TTE_W=1
    }
])dnl
])dnl
changequote(`,')dnl'
#endif
                
#include "traps.s"


    
SECTION .KERNEL      TEXT_VA =  KERNEL_BASE_TEXT_VA, DATA_VA=KERNEL_BASE_DATA_VA
#ifndef ALL_PAGE_CUSTOM_MAP
changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[ 
attr_text {
    Name = .KERNEL,
    RA = KERNEL_BASE_TEXT_RA,
    PA = ra2pa2(KERNEL_BASE_TEXT_RA,i),
    [part_]i[_ctx_nonzero_tsb_config_0],
    [part_]i[_ctx_zero_tsb_config_0],
    TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
    TTE_E=0,      TTE_P=1,        TTE_W=1
    }
    
attr_data {
    Name = .KERNEL,
    RA=KERNEL_BASE_DATA_RA,
    PA=ra2pa2(KERNEL_BASE_DATA_RA,i),
    [part_]i[_ctx_nonzero_tsb_config_0],
    [part_]i[_ctx_zero_tsb_config_0],
    TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
    }
])dnl
])dnl
changequote(`,')dnl'
#endif

.text

kernel: 
    ! set trap base addr
    setx    TRAP_BASE_VA, %l0, %l7
    wrpr    %l7, %g0, %tba

    ! setup %g7 to point to per thread user data scratchpad
    rdth_id_p       ! get thread ID in %o1
    mov %o1, %o5    ! save in %o5 to be used later
    sllx    %o1, 7, %o1
    setx    user_globals, %g1, %g7
    add %g7, %o1, %g7

    ! setup user heap pointer
    setx    heapptr, %g1, %g2
    setx    user_heap_start, %g1, %g3
    stx     %g3, [%g2]
        
    ! init context regs
    setx    PCONTEXT, %l0, %o1
    setx    SCONTEXT, %l0, %o2
#if !defined(USER_PAGE_CUSTOM_MAP) && defined(USER_TEXT_MT_MAP)
    add %o1, %o5, %o1   ! add thread id to contexts
    add %o2, %o5, %o2
#endif
#ifndef USER_PAGE_CUSTOM_MAP
    mov 0x0, %o3    ! go to non-priv code
#else   
    mov 0x1, %o3    ! go to priv code
#endif
    mov 0x0, %o4    ! set hpriv to zero
    setx    start_label_list, %g1, %g2
    sllx    %o5, 3, %o5             ! offset - start_label_list
    ldx     [%g2 + %o5], %o5        ! %o5 contains start_label
    ta  T_CHANGE_CTX
    nop

#include "kernel_handler.s"
    
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
#ifndef USER_PAGE_CUSTOM_MAP
#ifndef ALL_PAGE_CUSTOM_MAP
changequote([, ])dnl
forloop([i], 0, M4_user_text_idx, [
#ifndef USER_TEXT_MT_MAP
SECTION .MAIN  TEXT_VA=MAIN_BASE_TEXT_VA, DATA_VA=MAIN_BASE_DATA_VA, BSS_VA=MAIN_BASE_BSS_VA
#else
SECTION [.MAIN]i  TEXT_VA=[0x]mpeval(MAIN_BASE_TEXT_VA + i * USER_PAGE_INCR, 16), DATA_VA=[0x]mpeval(MAIN_BASE_DATA_VA + i * USER_PAGE_INCR, 16), BSS_VA=[0x]mpeval(MAIN_BASE_BSS_VA + i * USER_PAGE_INCR, 16)
#endif
attr_text {
#ifndef USER_TEXT_MT_MAP
    Name = .MAIN,
#else
    Name = [.MAIN]i,
#endif
    VA= [0x]mpeval(MAIN_BASE_TEXT_VA + i * USER_PAGE_INCR, 16),
    RA= [0x]mpeval(MAIN_BASE_TEXT_RA + i * USER_PAGE_INCR, 16),
        PA= ra2pa2([0x]mpeval(MAIN_BASE_TEXT_RA + i * USER_PAGE_INCR, 16),tid2pid(i)),
    [part_]tid2pid(i)[_ctx_nonzero_tsb_config_0],
#ifdef MAIN_PAGE_NUCLEUS_ALSO
    [part_]tid2pid(i)[_ctx_zero_tsb_config_0],
#endif
#ifdef MAIN_TEXT_DATA_ALSO
    [part_]tid2pid(i)[_ctx_nonzero_tsb_config_0],
#endif
#ifdef MAIN_TEXT_PAGE_NUCLEUS_DATA_ALSO
    [part_]tid2pid(i)[_ctx_zero_tsb_config_0],
#endif
    TTE_G=1, TTE_Context=[0x]eval(PCONTEXT + i, 16), TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
    }
])dnl
#ifdef MAIN_PAGE_HV_ALSO        
forloop([i], 0, M4_user_text_idx, [
attr_text {
#ifndef USER_TEXT_MT_MAP
    Name = .MAIN,
#else
    Name = [.MAIN]i,
#endif
    VA= [0x]mpeval(MAIN_BASE_TEXT_VA + i * USER_PAGE_INCR, 16),
    hypervisor
    }
])dnl   
#endif  
forloop([i], 0, M4_user_data_idx, [
attr_data {
#ifndef USER_TEXT_MT_MAP
    Name = .MAIN,
#else
    Name = [.MAIN]i,
#endif
        VA= [0x]mpeval(MAIN_BASE_DATA_VA + i * USER_PAGE_INCR, 16),
    RA= [0x]mpeval(MAIN_BASE_DATA_RA + i * USER_PAGE_INCR, 16),
    PA= ra2pa2([0x]mpeval(MAIN_BASE_DATA_RA + i * USER_PAGE_INCR, 16),tid2pid(i)),
    [part_]tid2pid(i)[_ctx_nonzero_tsb_config_0],
#ifdef MAIN_PAGE_NUCLEUS_ALSO
    [part_]tid2pid(i)[_ctx_zero_tsb_config_0],
#endif  
#ifdef MAIN_DATA_TEXT_ALSO
    [part_]tid2pid(i)[_ctx_nonzero_tsb_config_0],
#endif
        TTE_G=1, TTE_Context=[0x]eval(PCONTEXT + i, 16), TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
])dnl
#ifdef MAIN_PAGE_HV_ALSO        
forloop([i], 0, M4_user_data_idx, [
attr_data {
#ifndef USER_TEXT_MT_MAP
    Name = .MAIN,
#else
    Name = [.MAIN]i,
#endif
        VA= [0x]mpeval(MAIN_BASE_DATA_VA + i * USER_PAGE_INCR, 16),
    hypervisor
    }
])dnl
#endif  
forloop([i], 0, M4_user_data_idx, [
attr_bss {
#ifndef USER_TEXT_MT_MAP
    Name = .MAIN,
#else
    Name = [.MAIN]i,
#endif
        VA= [0x]mpeval(MAIN_BASE_BSS_VA + i * USER_PAGE_INCR, 16),
    RA= [0x]mpeval(MAIN_BASE_BSS_RA + i * USER_PAGE_INCR, 16),
    PA= ra2pa2([0x]mpeval(MAIN_BASE_BSS_RA + i * USER_PAGE_INCR, 16),tid2pid(i)),
    [part_]tid2pid(i)[_ctx_nonzero_tsb_config_0],
        TTE_G=0, TTE_Context=[0x]eval(PCONTEXT + i, 16), TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
])dnl

changequote(`,')dnl'
#endif
#endif

#ifdef USE_STACK
changequote([, ])dnl
forloop([i], 0, eval(THREAD_COUNT-1), [
SECTION [.STACK]eval(i*THREAD_STRIDE) BSS_VA= [0x]mpeval(STACK_BASE_VA + i * THREAD_STRIDE * USER_PAGE_INCR, 16)

attr_bss {
        NAME=[.STACK]eval(i*THREAD_STRIDE),
        VA=[0x]mpeval(STACK_BASE_VA + i * THREAD_STRIDE * USER_PAGE_INCR, 16),
        RA=[0x]mpeval(STACK_BASE_RA + i * THREAD_STRIDE * USER_PAGE_INCR, 16),
        PA=ra2pa2([0x]mpeval(STACK_BASE_RA + i * THREAD_STRIDE * USER_PAGE_INCR, 16), tid2pid(eval(i*THREAD_STRIDE))),
    [part_]tid2pid(eval(i*THREAD_STRIDE))[_ctx_nonzero_tsb_config_0],
        TTE_G=1, TTE_Context=PCONTEXT,
        TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
.section .bss
.global [stack]eval(i*THREAD_STRIDE)
[stack]eval(i*THREAD_STRIDE):
        .skip STACKSIZE

])dnl
changequote(`,')dnl'
#endif ! ifdef USE_STACK
#endif /* __HBOOT_S__ */
