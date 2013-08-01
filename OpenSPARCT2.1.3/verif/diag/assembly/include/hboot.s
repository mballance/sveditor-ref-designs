/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: hboot.s
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

#ifndef __HBOOT_S_DONE__
#define __HBOOT_S_DONE__
    
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

! $EV trig_pc_d(1,expr(@VA(.RED_SEC.Power_On_Reset)&0x0000ffffffffffff,16,16)) -> marker(bootStart, * , 1)
/*SV 04/25/06 */
#ifdef SLAM_VECTORS


#endif

Power_On_Reset:
#ifdef LOADNGO
#include "loadngo_l2_init.s"
#endif
#ifdef  My_Power_On_Reset
    My_Power_On_Reset
#else
#ifdef BOOTPROM_INIT
    ba bootprom_init
    wrpr   0, %g0, %gl
#else
    setx HRedmode_Reset_Handler, %g1, %g2
    jmp %g2
    wrpr   0, %g0, %gl
#endif
    
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
    setx External_Reset_Handler, %g6, %g7
    jmp %g7
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

.align 32

#include  "bootprom_init.s"

#ifdef FAST_BOOT
SECTION .ALT_RED TEXT_VA = 0x0000000000000000

#ifndef ALL_PAGE_CUSTOM_MAP
attr_text {
    Name=.ALT_RED,
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

! $EV trig_pc_d(1,@VA(.ALT_RED.Alt_Power_On_Reset)) -> marker(bootStart, *, 1)
Alt_Power_On_Reset:
#ifdef  My_Power_On_Reset
    My_Power_On_Reset
#else
    setx HRedmode_Reset_Handler, %g1, %g2
    jmp %g2
    wrpr   0, %g0, %gl
#endif

.align 32
    
Alt_Watchdog_Reset:
#ifdef  My_Watchdog_Reset
    My_Watchdog_Reset
#else
    setx Watchdog_Reset_Handler, %g1, %g2
    jmp %g2
    nop 
#endif
    

.align 32
    
Alt_External_Reset:
#ifdef  My_External_Reset
    My_External_Reset
#else
    setx External_Reset_Handler, %g6, %g7
    jmp %g7
    nop 
#endif

.align 32
    
Alt_Software_Initiated_Reset:
#ifdef  My_Software_Initiated_Reset
    My_Software_Initiated_Reset
#else
    setx Software_Reset_Handler, %g1, %g2
    jmp %g2
    nop
#endif

.align 32
    
Alt_RED_Mode_Other_Reset:
#ifdef  My_RED_Mode_Other_Reset
    My_RED_Mode_Other_Reset
#else
    nop 
    nop 
    nop
#endif

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
#include "hred_reset_handler.s"
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

partition_phys_offset_list:
    .xword  PART0_PHY_OFF_0, PART0_PHY_OFF_1, PART0_PHY_OFF_2, PART0_PHY_OFF_3
    .xword  PART1_PHY_OFF_0, PART1_PHY_OFF_1, PART1_PHY_OFF_2, PART1_PHY_OFF_3
    .xword  PART2_PHY_OFF_0, PART2_PHY_OFF_1, PART2_PHY_OFF_2, PART2_PHY_OFF_3
    .xword  PART3_PHY_OFF_0, PART3_PHY_OFF_1, PART3_PHY_OFF_2, PART3_PHY_OFF_3
    .xword  PART4_PHY_OFF_0, PART4_PHY_OFF_1, PART4_PHY_OFF_2, PART4_PHY_OFF_3
    .xword  PART5_PHY_OFF_0, PART5_PHY_OFF_1, PART5_PHY_OFF_2, PART5_PHY_OFF_3
    .xword  PART6_PHY_OFF_0, PART6_PHY_OFF_1, PART6_PHY_OFF_2, PART6_PHY_OFF_3
    .xword  PART7_PHY_OFF_0, PART7_PHY_OFF_1, PART7_PHY_OFF_2, PART7_PHY_OFF_3

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

.global sync_thr_counter
sync_thr_counter:
    .xword  0x0
.global sync_thr_counter1
sync_thr_counter1:
    .xword  0x0
.global sync_thr_counter2
sync_thr_counter2:
    .xword  0x0
.global sync_thr_counter3
sync_thr_counter3:
    .xword  0x0
.global sync_thr_counter4
sync_thr_counter4:
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
.global sync_thr_counter5
sync_thr_counter5:
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
.global sync_thr_counter6
sync_thr_counter6:
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0
    .xword  0x0

.global exit_sync_thr_counter
exit_sync_thr_counter:
    .xword  0x0

#ifndef HBOOT_HV_ONLY

SECTION .HPRIV_RESET        TEXT_VA=PRIV_RESET_VA
#ifndef ALL_PAGE_CUSTOM_MAP
changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[
attr_text {
    Name = .HPRIV_RESET,
    RA = PRIV_RESET_RA,
    PA = ra2pa2(PRIV_RESET_RA,i),
#ifndef USE_N1_TSB_NAMES
#ifndef NO_NZ_TSB_IN_PRIV
    [part_]i[_ctx_nonzero_tsb_config_0],
#endif
    [part_]i[_ctx_zero_tsb_config_0],
#else
#ifndef NO_NZ_TSB_IN_PRIV
    [part_]i[_i_ctx_nonzero_ps0_tsb],
#endif
    [part_]i[_i_ctx_zero_ps0_tsb],
#endif
    TTE_G=1,       TTE_Context=0, TTE_V=1,    
    TTE_Size=PART0_Z_PAGE_SIZE_0, TTE_NFO=0, TTE_IE=0, 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
    TTE_E=0,      TTE_P=1,        TTE_W=1, TTE_X=1
    }
])dnl
])dnl
changequote(`,')dnl'
#endif
! DO NOT ADD ANY CODE BEFORE HPriv_Reset_Handler
.global HPriv_Reset_Handler
    
HPriv_Reset_Handler:

#ifdef S2MEM_PRIV_RESET_HANDLER
#include S2MEM_PRIV_RESET_HANDLER
#else
#include "hpriv_reset_handler.s"
#endif  

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
    
            
#ifndef HBOOT_HV_ONLY
SECTION .TRAPS         TEXT_VA=TRAP_BASE_VA, DATA_VA=TRAP_DATA_VA
#ifndef ALL_PAGE_CUSTOM_MAP
changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[ 
attr_text {
    Name = .TRAPS,
    RA = TRAP_BASE_RA,
    PA = ra2pa2(TRAP_BASE_RA,i),
#ifndef USE_N1_TSB_NAMES
    [part_]i[_ctx_zero_tsb_config_0],
#else
    [part_]i[_i_ctx_zero_ps0_tsb],
#endif
    TTE_G=1,       TTE_Context=0, TTE_V=1,    
    TTE_Size=PART0_Z_PAGE_SIZE_0, TTE_NFO=0, TTE_IE=0, 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
    TTE_E=0,      TTE_P=1,        TTE_W=1, TTE_X=1
    }
attr_data {
    Name = .TRAPS,  
    RA = TRAP_DATA_RA,
    PA = ra2pa2(TRAP_DATA_RA,i),
#ifndef USE_N1_TSB_NAMES
    [part_]i[_ctx_zero_tsb_config_0],
#else
    [part_]i[_d_ctx_zero_ps0_tsb],
#endif
    TTE_G=1,       TTE_Context=0, TTE_V=1,    
    TTE_Size=PART0_Z_PAGE_SIZE_0, TTE_NFO=0, TTE_IE=0, 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
    TTE_E=0,      TTE_P=1,        TTE_W=1
    }
#ifdef TRAP_SECT_HV_ALSO
attr_text {
	Name	 = .TRAPS,
	hypervisor
}
attr_data {
	Name	 = .TRAPS,
	hypervisor
}
#endif

])dnl
])dnl
changequote(`,')dnl'

#endif
                
#include "traps.s"

#endif
    
SECTION .KERNEL      TEXT_VA =  KERNEL_BASE_TEXT_VA, DATA_VA=KERNEL_BASE_DATA_VA
#ifndef ALL_PAGE_CUSTOM_MAP
#ifndef HBOOT_HV_ONLY
changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[ 
attr_text {
    Name = .KERNEL,
    RA = KERNEL_BASE_TEXT_RA,
    PA = ra2pa2(KERNEL_BASE_TEXT_RA,i),
#ifndef USE_N1_TSB_NAMES
#ifndef NO_NZ_TSB_IN_PRIV
    [part_]i[_ctx_nonzero_tsb_config_0],
#endif
    [part_]i[_ctx_zero_tsb_config_0],
#else
#ifndef NO_NZ_TSB_IN_PRIV
    [part_]i[_i_ctx_nonzero_ps0_tsb],
#endif
    [part_]i[_i_ctx_zero_ps0_tsb],
#endif
    TTE_G=1,       TTE_Context=0, TTE_V=1,    
    TTE_Size=PART0_Z_PAGE_SIZE_0, TTE_NFO=0, TTE_IE=0, 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
    TTE_E=0,      TTE_P=1,        TTE_W=1, TTE_X=1
    }
    
attr_data {
    Name = .KERNEL,
    RA=KERNEL_BASE_DATA_RA,
    PA=ra2pa2(KERNEL_BASE_DATA_RA,i),
#ifndef USE_N1_TSB_NAMES
#ifndef NO_NZ_TSB_IN_PRIV
    [part_]i[_ctx_nonzero_tsb_config_0],
#endif
    [part_]i[_ctx_zero_tsb_config_0],
#else
#ifndef NO_NZ_TSB_IN_PRIV
    [part_]i[_d_ctx_nonzero_ps0_tsb],
#endif
    [part_]i[_d_ctx_zero_ps0_tsb],
#endif
    TTE_G=1, TTE_Context=0, TTE_V=1, 
    TTE_Size=PART0_Z_PAGE_SIZE_0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
    }

])dnl
])dnl
changequote(`,')dnl'
#else
attr_text {
    Name = .KERNEL,
    hypervisor
}
attr_data {
    Name = .KERNEL,
    hypervisor
}
#endif
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

#ifndef USER_PAGE_CUSTOM_MAP
    ! setup user heap pointer
    setx    heapptr, %g1, %g2
    setx    user_heap_start, %g1, %g3
    stx     %g3, [%g2]
#endif
        
    ! init context regs
#ifndef MAIN_PAGE_NUCLEUS_ONLY
    mov    PCONTEXT,  %o1
    mov    SCONTEXT,  %o2
    mov    PCONTEXT1,  %o6
    mov    SCONTEXT1,  %o7
#else 
    mov 0, %o1
    mov 0, %o2
    mov 0, %o3
    mov 0, %o4
#endif

#if !defined(USER_PAGE_CUSTOM_MAP) && defined(USER_TEXT_MT_MAP)
    add %o1, %o5, %o1   ! add thread id to contexts
    add %o2, %o5, %o2
#endif
#if !defined(USER_PAGE_CUSTOM_MAP) && !defined(MAIN_PAGE_NUCLEUS_ONLY)
    mov 0x0, %o3    ! go to non-priv code
#else   
    mov 0x1, %o3    ! go to priv code
#endif
    mov 0x0, %o4    ! set hpriv to zero
    setx    start_label_list, %g1, %g2
    sllx    %o5, 3, %o5             ! offset - start_label_list
    ldx     [%g2 + %o5], %o5        ! %o5 contains start_label
	
end_of_boot:        
    ta  T_CHANGE_CTX
    nop

#include "kernel_handler.s"
    
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! This bit of magic figures out which TSB config to be 
!! use for the main page. Boot/Traps use config_0, so if
!! you want to do anything special like change page size
!! etc, use TSB config other than 0 by defining MAIN_PAGE_USE_CONFIG
!! in your diag.
!! 
!! Only works for partition 0 page sizes
!!
#ifdef MAIN_PAGE_USE_CONFIG
#if !(MAIN_PAGE_USE_CONFIG ^ 3)
#define _TSB_CONFIG_0 _tsb_config_3
#define MAIN_PAGE_NZ_PAGE_SIZE PART0_NZ_PAGE_SIZE_3
#define MAIN_PAGE_Z_PAGE_SIZE PART0_Z_PAGE_SIZE_3
#elif !(MAIN_PAGE_USE_CONFIG ^ 2)
#define _TSB_CONFIG_0 _tsb_config_2
#define MAIN_PAGE_NZ_PAGE_SIZE PART0_NZ_PAGE_SIZE_2
#define MAIN_PAGE_Z_PAGE_SIZE PART0_Z_PAGE_SIZE_2
#elif !(MAIN_PAGE_USE_CONFIG ^ 1)
#define _TSB_CONFIG_0 _tsb_config_1
#define MAIN_PAGE_NZ_PAGE_SIZE PART0_NZ_PAGE_SIZE_1
#define MAIN_PAGE_Z_PAGE_SIZE PART0_Z_PAGE_SIZE_1
#endif
#else 
#define _TSB_CONFIG_0 _tsb_config_0
#define MAIN_PAGE_NZ_PAGE_SIZE PART0_NZ_PAGE_SIZE_0
#define MAIN_PAGE_Z_PAGE_SIZE PART0_Z_PAGE_SIZE_0
#endif

#ifndef USER_PAGE_CUSTOM_MAP
#ifndef ALL_PAGE_CUSTOM_MAP

changequote([, ])dnl

#ifndef HBOOT_HV_ONLY
    
! dnl M4_user_text_idx is max thread number if USER_TEXT_MT_MAP else 0.
foreachbit([i], 64, M4_user_text_mask, [
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
#ifndef MAIN_PAGE_VA_IS_RA_ALSO
    RA= [0x]mpeval(MAIN_BASE_TEXT_RA + i * USER_PAGE_INCR, 16),
    PA= ra2pa2([0x]mpeval(MAIN_BASE_TEXT_RA + i * USER_PAGE_INCR, 16),tid2pid(i)),
#else
    RA= [0x]mpeval(MAIN_BASE_TEXT_VA + i * USER_PAGE_INCR, 16),
    PA= ra2pa2([0x]mpeval(MAIN_BASE_TEXT_VA + i * USER_PAGE_INCR, 16),tid2pid(i)),
#endif
#ifndef MAIN_PAGE_NUCLEUS_ONLY
#ifndef USE_N1_TSB_NAMES
    [part_]tid2pid(i)[_ctx_nonzero]_TSB_CONFIG_0,
#else
    [part_]tid2pid(i)[_i_ctx_nonzero_ps0_tsb],
#endif
#else
#ifndef USE_N1_TSB_NAMES
    [part_]tid2pid(i)[_ctx_zero]_TSB_CONFIG_0,
#else
    [part_]tid2pid(i)[_i_ctx_zero_ps0_tsb],
#endif
#endif
#ifdef MAIN_PAGE_NUCLEUS_ALSO
#ifndef USE_N1_TSB_NAMES
    [part_]tid2pid(i)[_ctx_zero]_TSB_CONFIG_0,
#else
    [part_]tid2pid(i)[_i_ctx_zero_ps0_tsb],
#endif
#endif
#ifdef MAIN_TEXT_PAGE_NUCLEUS_DATA_ALSO
#ifndef USE_N1_TSB_NAMES
    [part_]tid2pid(i)[_ctx_zero]_TSB_CONFIG_0,
#else
    [part_]tid2pid(i)[_d_ctx_zero_ps0_tsb],
#endif
#endif
    TTE_G=1, TTE_Context=[0x]eval(PCONTEXT + i, 16), TTE_V=1, 
#ifndef MAIN_PAGE_NUCLEUS_ONLY
    TTE_Size=MAIN_PAGE_NZ_PAGE_SIZE, 
#else
    TTE_Size=MAIN_PAGE_Z_PAGE_SIZE, 
#endif
    TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_X=1,
#ifdef MAIN_TEXT_DATA_ALSO
    TTE_W=1
#else 
    TTE_W=0
#endif
    }

#ifdef THREAD_0_DIAG
define(M4_midasdefs, esyscmd(grep "midas: midas" ../midas.log | perl -ane 'print join(" ", grep(/-D/, @F))'))
!Defines for second pass cpp are M4_midasdefs
#else
#define M4_midasdefs 
#endif

#define SYSCMD_0 cat $DV_ROOT/verif/diag/assembly
#define SYSCMD_1 sed -e 's/.global.*main//'| bw_cpp -traditional-cpp -B -P M4_midasdefs -D__HBOOT_S_DONE__ -DNO_DECLARE_TSB -DMT_TEMPLATE -I$DV_ROOT/verif/diag/assembly/include
#define SYSCMD_2 bw_m4 -I $DV_ROOT/verif/diag/assembly/include  | sed -e 's/\.MAIN\./\.MAIN}}i{{\./'

dnl  Diag has code for more than one thread. Make a main for each thread.
#ifdef USER_TEXT_MT_MAP
    
[.global main]i
[main]i:

dnl  This is how N1 is doing multi thread diags. Each thread can run a
dnl  separate stand alone diag that is named using pound define 
dnl  THREAD_X_DIAG lines.  This is done in a separate file, a 
dnl  mt template file. Need example... Need 64 threads
#ifdef THREAD_0_DIAG
! Will execute SYSCMD_0/THREAD_0_DIAG | SYSCMD_1 | SYSCMD_2 ..
changequote({{, }})
ifelse(
i, 0, {{esyscmd(SYSCMD_0/THREAD_0_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 1, {{esyscmd(SYSCMD_0/THREAD_1_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 2, {{esyscmd(SYSCMD_0/THREAD_2_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 3, {{esyscmd(SYSCMD_0/THREAD_3_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 4, {{esyscmd(SYSCMD_0/THREAD_4_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 5, {{esyscmd(SYSCMD_0/THREAD_5_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 6, {{esyscmd(SYSCMD_0/THREAD_6_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 7, {{esyscmd(SYSCMD_0/THREAD_7_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 8, {{esyscmd(SYSCMD_0/THREAD_8_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 9, {{esyscmd(SYSCMD_0/THREAD_9_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 10, {{esyscmd(SYSCMD_0/THREAD_10_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 11, {{esyscmd(SYSCMD_0/THREAD_11_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 12, {{esyscmd(SYSCMD_0/THREAD_12_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 13, {{esyscmd(SYSCMD_0/THREAD_13_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 14, {{esyscmd(SYSCMD_0/THREAD_14_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 15, {{esyscmd(SYSCMD_0/THREAD_15_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 16, {{esyscmd(SYSCMD_0/THREAD_16_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 17, {{esyscmd(SYSCMD_0/THREAD_17_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 18, {{esyscmd(SYSCMD_0/THREAD_18_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 19, {{esyscmd(SYSCMD_0/THREAD_19_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 20, {{esyscmd(SYSCMD_0/THREAD_20_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 21, {{esyscmd(SYSCMD_0/THREAD_21_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 22, {{esyscmd(SYSCMD_0/THREAD_22_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 23, {{esyscmd(SYSCMD_0/THREAD_23_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 24, {{esyscmd(SYSCMD_0/THREAD_24_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 25, {{esyscmd(SYSCMD_0/THREAD_25_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 26, {{esyscmd(SYSCMD_0/THREAD_26_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 27, {{esyscmd(SYSCMD_0/THREAD_27_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 28, {{esyscmd(SYSCMD_0/THREAD_28_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 29, {{esyscmd(SYSCMD_0/THREAD_29_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 30, {{esyscmd(SYSCMD_0/THREAD_30_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 31, {{esyscmd(SYSCMD_0/THREAD_31_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 32, {{esyscmd(SYSCMD_0/THREAD_32_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 33, {{esyscmd(SYSCMD_0/THREAD_33_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 34, {{esyscmd(SYSCMD_0/THREAD_34_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 35, {{esyscmd(SYSCMD_0/THREAD_35_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 36, {{esyscmd(SYSCMD_0/THREAD_36_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 37, {{esyscmd(SYSCMD_0/THREAD_37_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 38, {{esyscmd(SYSCMD_0/THREAD_38_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 39, {{esyscmd(SYSCMD_0/THREAD_39_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 40, {{esyscmd(SYSCMD_0/THREAD_40_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 41, {{esyscmd(SYSCMD_0/THREAD_41_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 42, {{esyscmd(SYSCMD_0/THREAD_42_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 43, {{esyscmd(SYSCMD_0/THREAD_43_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 44, {{esyscmd(SYSCMD_0/THREAD_44_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 45, {{esyscmd(SYSCMD_0/THREAD_45_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 46, {{esyscmd(SYSCMD_0/THREAD_46_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 47, {{esyscmd(SYSCMD_0/THREAD_47_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 48, {{esyscmd(SYSCMD_0/THREAD_48_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 49, {{esyscmd(SYSCMD_0/THREAD_49_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 50, {{esyscmd(SYSCMD_0/THREAD_50_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 51, {{esyscmd(SYSCMD_0/THREAD_51_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 52, {{esyscmd(SYSCMD_0/THREAD_52_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 53, {{esyscmd(SYSCMD_0/THREAD_53_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 54, {{esyscmd(SYSCMD_0/THREAD_54_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 55, {{esyscmd(SYSCMD_0/THREAD_55_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 56, {{esyscmd(SYSCMD_0/THREAD_56_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 57, {{esyscmd(SYSCMD_0/THREAD_57_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 58, {{esyscmd(SYSCMD_0/THREAD_58_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 59, {{esyscmd(SYSCMD_0/THREAD_59_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 60, {{esyscmd(SYSCMD_0/THREAD_60_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 61, {{esyscmd(SYSCMD_0/THREAD_61_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 62, {{esyscmd(SYSCMD_0/THREAD_62_DIAG | SYSCMD_1 | SYSCMD_2)}},
{{esyscmd(SYSCMD_0/THREAD_63_DIAG | SYSCMD_1 | SYSCMD_2)}})
changequote([, ])dnl     
#else
    

#ifdef USER_TEXT_MT_MAP_ALL
dnl  If the diag file has unique code for each/all threads then split up
dnl  the file by thread as if we had each threads code in a separate 
dnl  file as in THREAD_n_DIAG above.	Will split up focus diags that use
dnl  ! Thread 0 Start
dnl  comments.
changequote(`,')dnl'
syscmd(cat diag.s | awk "/^.define|^.include/`,'/th.fork/" > diag.tmp)
syscmd(cat diag.s | awk "/^.global `thread_'i/`,'/EXIT_GOOD/" >> diag.tmp)
syscmd(cat diag.s | awk "/^.data/`,'/^.end/" >> diag.tmp)
esyscmd(cat diag.tmp | SYSCMD_1 | SYSCMD_2)    
#else
dnl  If the diag has code for one thread that is going to be 
dnl  duplicated for, and run on, each thread.
changequote(`,')dnl'
esyscmd(cat diag.s | SYSCMD_1 | SYSCMD_2)
#endif
    
changequote([, ])dnl     
#endif
#endif

    
])dnl forloop

#else
SECTION .MAIN  TEXT_VA=MAIN_BASE_TEXT_VA, DATA_VA=MAIN_BASE_DATA_VA, BSS_VA=MAIN_BASE_BSS_VA
#endif

#if (defined MAIN_PAGE_HV_ALSO || defined HBOOT_HV_ONLY)        
foreachbit([i], 64, M4_user_text_mask, [
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


#ifndef HBOOT_HV_ONLY

foreachbit([i], 64, M4_user_data_mask, [
attr_data {
#ifndef USER_TEXT_MT_MAP
    Name = .MAIN,
#else
    Name = [.MAIN]i,
#endif
    VA= [0x]mpeval(MAIN_BASE_DATA_VA + i * USER_PAGE_INCR, 16),
#ifndef MAIN_PAGE_VA_IS_RA_ALSO
    RA= [0x]mpeval(MAIN_BASE_DATA_RA + i * USER_PAGE_INCR, 16),
    PA= ra2pa2([0x]mpeval(MAIN_BASE_DATA_RA + i * USER_PAGE_INCR, 16),tid2pid(i)),
#else
    RA= [0x]mpeval(MAIN_BASE_DATA_VA + i * USER_PAGE_INCR, 16),
    PA= ra2pa2([0x]mpeval(MAIN_BASE_DATA_VA + i * USER_PAGE_INCR, 16),tid2pid(i)),
#endif
#ifndef MAIN_PAGE_NUCLEUS_ONLY
#ifndef USE_N1_TSB_NAMES
    [part_]tid2pid(i)[_ctx_nonzero]_TSB_CONFIG_0,
#else
    [part_]tid2pid(i)[_d_ctx_nonzero_ps0_tsb],
#endif
#else
#ifndef USE_N1_TSB_NAMES
    [part_]tid2pid(i)[_ctx_zero]_TSB_CONFIG_0
#else
    [part_]tid2pid(i)[_d_ctx_zero_ps0_tsb],
#endif
#endif
#ifdef MAIN_PAGE_NUCLEUS_ALSO
#ifndef USE_N1_TSB_NAMES
    [part_]tid2pid(i)[_ctx_zero]_TSB_CONFIG_0
#else
    [part_]tid2pid(i)[_d_ctx_zero_ps0_tsb],
#endif
#endif  
#ifdef MAIN_DATA_TEXT_ALSO
#ifndef USE_N1_TSB_NAMES
    [part_]tid2pid(i)[_ctx_nonzero]_TSB_CONFIG_0,
#else
    [part_]tid2pid(i)[_d_ctx_nonzero_ps0_tsb],
#endif
#endif
        TTE_G=1, TTE_Context=[0x]eval(PCONTEXT + i, 16), TTE_V=1, 
#ifndef MAIN_PAGE_NUCLEUS_ONLY
        TTE_Size=MAIN_PAGE_NZ_PAGE_SIZE, 
#else
        TTE_Size=MAIN_PAGE_Z_PAGE_SIZE, 
#endif
        TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=1
        }

])dnl

#endif

#if (defined MAIN_PAGE_HV_ALSO || defined HBOOT_HV_ONLY)        
foreachbit([i], 64, M4_user_data_mask, [
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


foreachbit([i], 64, M4_user_data_mask, [
attr_bss {
#ifndef USER_TEXT_MT_MAP
    Name = .MAIN,
#else
    Name = [.MAIN]i,
#endif
        VA= [0x]mpeval(MAIN_BASE_BSS_VA + i * USER_PAGE_INCR, 16),
    RA= [0x]mpeval(MAIN_BASE_BSS_RA + i * USER_PAGE_INCR, 16),
    PA= ra2pa2([0x]mpeval(MAIN_BASE_BSS_RA + i * USER_PAGE_INCR, 16),tid2pid(i)),
#ifndef USE_N1_TSB_NAMES
    [part_]tid2pid(i)[_ctx_nonzero]_TSB_CONFIG_0,
#else
    [part_]tid2pid(i)[_d_ctx_nonzero_ps0_tsb],
#endif
        TTE_G=0, TTE_Context=[0x]eval(PCONTEXT + i, 16), TTE_V=1, 
#ifndef MAIN_PAGE_NUCLEUS_ONLY
        TTE_Size=MAIN_PAGE_NZ_PAGE_SIZE, 
#else
        TTE_Size=MAIN_PAGE_Z_PAGE_SIZE, 
#endif
        TTE_NFO=0, TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
])dnl

changequote(`,')dnl'

#endif
#endif


#ifdef USE_STACK
changequote([, ])dnl
foreachbit([i], 64, THREAD_MASK, [
SECTION [.STACK]eval(i) BSS_VA= [0x]mpeval(STACK_BASE_VA + i  * USER_PAGE_INCR, 16)

attr_bss {
        NAME=[.STACK]eval(i),
        VA=[0x]mpeval(STACK_BASE_VA + i * USER_PAGE_INCR, 16),
        RA=[0x]mpeval(STACK_BASE_RA + i * USER_PAGE_INCR, 16),
        PA=ra2pa2([0x]mpeval(STACK_BASE_RA + i * USER_PAGE_INCR, 16), tid2pid(eval(i))),
#ifndef USE_N1_TSB_NAMES
    [part_]tid2pid(eval(i))[_ctx_nonzero]_TSB_CONFIG_0,
#else
    [part_]tid2pid(eval(i))[_d_ctx_nonzero_ps0_tsb],
#endif
        TTE_G=1, TTE_Context=[0x]eval(PCONTEXT,16), TTE_V=1, 
#ifndef MAIN_PAGE_NUCLEUS_ONLY
        TTE_Size=MAIN_PAGE_NZ_PAGE_SIZE, 
#else
        TTE_Size=MAIN_PAGE_Z_PAGE_SIZE, 
#endif
        TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
.section .bss
.global [stack]eval(i)
[stack]eval(i):
        .skip STACKSIZE

])dnl
changequote(`,')dnl'
#endif /* ifdef USE_STACK */
#if (defined USER_TEXT_MT_MAP && !(defined THREAD_0_DIAG || defined USER_PAGE_CUSTOM_MAP))
m4exit(0)   dnl stop reading diag.s we have already read it for each thread
#endif
#endif /* __HBOOT_S_DONE__ */
#endif /* __HBOOT_S__ */
