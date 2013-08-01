/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: template_st.s
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
#define USER_START_LABEL c_start
#define MAIN_TEXT_DATA_ALSO
/* 
   Include this before boot.s to use spill/fill traps 
*/      

#include "c/ctraps.h"
#include "hboot.s"


#ifndef CUSTOM_TRAPS_BASE_TEXT_ADDR
#define CUSTOM_TRAPS_BASE_TEXT_ADDR       0x500000
#endif

#ifndef CUSTOM_TRAPS_BASE_TEXT_ADDR_RA
#define CUSTOM_TRAPS_BASE_TEXT_ADDR_RA  0x10500000
#endif

#ifndef CUSTOM_TRAPS_BASE_DATA_ADDR
#define CUSTOM_TRAPS_BASE_DATA_ADDR       0x540000
#endif

#ifndef CUSTOM_TRAPS_BASE_DATA_ADDR_RA
#define CUSTOM_TRAPS_BASE_DATA_ADDR_RA  0x10540000
#endif

#ifndef COMMON_BASE_TEXT_ADDR
#define COMMON_BASE_TEXT_ADDR             0x510000
#endif

#ifndef COMMON_BASE_TEXT_ADDR_RA
#define COMMON_BASE_TEXT_ADDR_RA        0x10510000
#endif

#ifndef COMMON_BASE_DATA_ADDR
#define COMMON_BASE_DATA_ADDR             0x550000
#endif

#ifndef COMMON_BASE_DATA_ADDR_RA
#define COMMON_BASE_DATA_ADDR_RA        0x10550000
#endif


#ifndef LIBC_BASE_TEXT_ADDR
#define LIBC_BASE_TEXT_ADDR               0x570000
#endif

#ifndef LIBC_BASE_TEXT_ADDR_RA
#define LIBC_BASE_TEXT_ADDR_RA          0x10570000
#endif

#ifndef LIBC_BASE_DATA_ADDR
#define LIBC_BASE_DATA_ADDR               0x560000
#endif

#ifndef LIBC_BASE_DATA_ADDR_RA
#define LIBC_BASE_DATA_ADDR_RA          0x10560000
#endif

#ifndef MAIN_RODATA_ADDR
# define MAIN_RODATA_ADDR 0x20020000
#endif

#ifndef MAIN_RODATA_ADDR_RA
# define MAIN_RODATA_ADDR_RA 0x130020000
#endif

#ifndef MAIN_RODATA_ADDR_PA
# define MAIN_RODATA_ADDR_PA 0x1130020000
#endif


/*****************************************************************************
 *      
 *
 * SECTION .CUSTOM_TRAPS
 *
 * Trap handlers that will run in nucleus context
 *
 *
 *****************************************************************************/

SECTION .CUSTOM_TRAPS \
	TEXT_VA=CUSTOM_TRAPS_BASE_TEXT_ADDR, \
	DATA_VA=CUSTOM_TRAPS_BASE_DATA_ADDR

attr_text {
	NAME=.CUSTOM_TRAPS,
	VA=CUSTOM_TRAPS_BASE_TEXT_ADDR,
#ifdef NIAGARA
	RA=CUSTOM_TRAPS_BASE_TEXT_ADDR_RA,
	PA=ra2pa(CUSTOM_TRAPS_BASE_TEXT_ADDR_RA, 0),
#ifndef USE_N1_TSB_NAMES
	part_0_ctx_nzero_tsb_config_1,
#else
	part_0_d_ctx_nzero_ps0_tsb,
#endif
#else
	Code,
	PA=CUSTOM_TRAPS_BASE_TEXT_ADDR_RA,
#endif
	TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}

attr_data {
	NAME=.CUSTOM_TRAPS,
	VA=CUSTOM_TRAPS_BASE_DATA_ADDR,
#ifdef NIAGARA
	RA=CUSTOM_TRAPS_BASE_DATA_ADDR_RA,
	PA=ra2pa(CUSTOM_TRAPS_BASE_DATA_ADDR_RA, 0),
#ifndef USE_N1_TSB_NAMES
	part_0_ctx_zero_tsb_config_1,
#else
	part_0_d_ctx_zero_ps0_tsb,
#endif
#else
	Data,
	PA=CUSTOM_TRAPS_BASE_DATA_ADDR_RA,
#endif
	TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
	}

#include "c/ctraps.s"

/*****************************************************************************
 *
 * SECTION .BSS
 *
 * Set up uninitialized data segment
 *
 *****************************************************************************/


SECTION .STACK0 \
	BSS_VA=COMMON_BASE_DATA_ADDR

attr_bss {
	NAME=.STACK0
	VA=COMMON_BASE_DATA_ADDR,
#ifdef NIAGARA
	RA=COMMON_BASE_DATA_ADDR_RA,
	PA=ra2pa(COMMON_BASE_DATA_ADDR_RA, 0),
#ifndef USE_N1_TSB_NAMES
	part_0_ctx_nonzero_tsb_config_1,
#else
	part_0_d_ctx_nonzero_ps0_tsb,
#endif
#else
	PA=COMMON_BASE_DATA_ADDR_RA,
	Data,
#endif
	TTE_G=1, TTE_Context=PCONTEXT,
	TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
	}

.section .bss

.global stack0
stack0:
	.skip STACKSIZE

/*****************************************************************************
 *
 * SECTION .LIBC
 *
 * Code and data for C library
 *
 *****************************************************************************/



SECTION .LIBC \
	TEXT_VA=LIBC_BASE_TEXT_ADDR, \
	DATA_VA=LIBC_BASE_DATA_ADDR

attr_text {
	NAME=.LIBC
	VA=LIBC_BASE_TEXT_ADDR,
#ifdef NIAGARA
	RA=LIBC_BASE_TEXT_ADDR_RA,
	PA=ra2pa(LIBC_BASE_TEXT_ADDR_RA, 0),
#ifndef USE_N1_TSB_NAMES
	part_0_ctx_nonzero_tsb_config_0,
#else
	part_0_i_ctx_nonzero_ps0_tsb,
#endif
#else
	PA=LIBC_BASE_TEXT_ADDR_RA,
	Code,
#endif
	TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
}       

attr_data {
	NAME=.LIBC,
	VA=LIBC_BASE_DATA_ADDR,
#ifdef NIAGARA
	RA=LIBC_BASE_DATA_ADDR_RA,
	PA=ra2pa(LIBC_BASE_DATA_ADDR_RA, 0),
#ifndef USE_N1_TSB_NAMES
	part_0_ctx_nonzero_tsb_config_1,   
#else
	part_0_d_ctx_nonzero_ps0_tsb,   
#endif
#else
	PA=LIBC_BASE_DATA_ADDR_RA,
	Data,
#endif
	TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1,
	TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}       


#include "c/stackinit_st.s"
#include "c/libc.s"

/*****************************************************************************
 *
 * SECTION .MAIN
 *
 * Put user code back in MAIN
 *
 *****************************************************************************/


SECTION .MAIN
