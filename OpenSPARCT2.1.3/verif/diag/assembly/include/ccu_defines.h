/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ccu_defines.h
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
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! PLL_CTL     0x8300000000
! RSVD0              63:34
! PLL_CHAR_IN        33
! CHANGE             32
! ALIGN_SHIFT        31:30
! SERDES_DTM2        29
! SERDES_DTM1        28
! ST_DELAY_A         27:26
! ST_PHASE_HI        25
! PLL_DIV4           24:18
! PLL_DIV3           17:12
! PLL_DIV2           11:6
! PLL_DIV1           5:0
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#ifndef PLL_CTL
#define PLL_CTL   0x8300000000
#endif

#ifndef RESET_GEN
#define RESET_GEN 0x8900000808
#endif

#ifndef RESET_STAT
#define RESET_STAT 0x8900000810
#endif

#ifdef CMPDR_RATIO_2_00
#define PLL_DIV1 	  0x1
#define PLL_DIV2 	  0x7
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0x8
#define CHANGE            0x1
#endif

#ifdef CMPDR_RATIO_2_25
#define PLL_DIV1 	  0x1
#define PLL_DIV2 	  0x8
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0x9
#define CHANGE            0x1
#endif

#ifdef  CMPDR_RATIO_2_50
#define PLL_DIV1 	  0x1
#define PLL_DIV2 	  0x9
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0xa
#define CHANGE            0x1
#endif

#ifdef  CMPDR_RATIO_2_75
#define PLL_DIV1 	  0x1
#define PLL_DIV2 	  0xa
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0xb
#define CHANGE            0x1
#endif

#ifdef  CMPDR_RATIO_3_00
#define PLL_DIV1 	  0x1
#define PLL_DIV2 	  0xb
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0xc
#define CHANGE            0x1
#endif

#ifdef  CMPDR_RATIO_3_25
#define PLL_DIV1 	  0x1
#define PLL_DIV2 	  0xc
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0xd
#define CHANGE            0x1
#endif

#ifdef  CMPDR_RATIO_3_50
#define PLL_DIV1 	  0x1
#define PLL_DIV2 	  0xd
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0xe
#define CHANGE            0x1
#endif

#ifdef  CMPDR_RATIO_3_75
#define PLL_DIV1 	  0x1
#define PLL_DIV2 	  0xe
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0xf
#define CHANGE            0x1
#endif

#ifdef  CMPDR_RATIO_4_00
#define PLL_DIV1 	  0x1
#define PLL_DIV2 	  0xf
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0x10
#define CHANGE            0x1
#endif

#ifdef  CMPDR_RATIO_4_25
#define PLL_DIV1 	  0x1
#define PLL_DIV2 	  0x10
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0x11
#define CHANGE            0x1
#endif

#ifdef  CMPDR_RATIO_4_50
#define PLL_DIV1 	  0x1
#define PLL_DIV2 	  0x11
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0x12
#define CHANGE            0x1
#endif

! AT 04/12/06: DTM Clock Ratios	

#ifdef  CMPDR_RATIO_15
#define PLL_DIV1 	  0x0
#define PLL_DIV2 	  0xE
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0x0
#define CHANGE            0x1
#endif

#ifdef  CMPDR_RATIO_11
#define PLL_DIV1 	  0x0
#define PLL_DIV2 	  0xA
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0x0
#define CHANGE            0x1
#endif

#ifdef  CMPDR_RATIO_8
#define PLL_DIV1 	  0x0
#define PLL_DIV2 	  0x7
#define PLL_DIV3 	  0x1
#define PLL_DIV4 	  0x0
#define CHANGE            0x1
#endif
! END AT 04/12/06

#ifdef  CHANGE
#define WARM_RESET_INIT  1
#define CCU_REG_PROG     1
#endif

#ifndef PLL_DIV1
#define PLL_DIV1 	  1
#endif

#ifndef PLL_DIV2
#define PLL_DIV2 7
#endif

#ifndef PLL_DIV3
#define PLL_DIV3 1
#endif

#ifndef PLL_DIV4
#define PLL_DIV4 8
#endif

#ifndef ST_PHASE_HI
#define ST_PHASE_HI 0
#endif

#ifndef ST_DELAY_A
#define ST_DELAY_A 0
#endif

#ifndef SERDES_DTM1
! AT 04/12/06
#ifndef DTM_ENABLED 		
#define SERDES_DTM1 0		
#else				
#define SERDES_DTM1 1		
#endif				
#endif

#ifndef SERDES_DTM2
! AT 04/12/06
#ifndef DTM_ENABLED 		
#define SERDES_DTM2 0		
#else				
#define SERDES_DTM2 1		
#endif				
#endif

#ifndef ALIGN_SHIFT
#define ALIGN_SHIFT 0
#endif

#ifndef CHANGE
#define CHANGE 1
#endif

#ifndef PLL_CHAR_IN
#define PLL_CHAR_IN 0
#endif
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! PLL_CTL     0x8300000000
! RSVD0              63:34
! PLL_CHAR_IN        33
! CHANGE             32
! ALIGN_SHIFT        31:30
! SERDES_DTM2        29
! SERDES_DTM1        28
! ST_DELAY_A         27:26
! ST_PHASE_HI        25
! PLL_DIV4           24:18
! PLL_DIV3           17:12
! PLL_DIV2           11:6
! PLL_DIV1           5:0
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#ifndef CREGS_CCU_CTL_REG_R64
#define CREGS_CCU_CTL_REG_R64 (\
        (PLL_DIV1) | (PLL_DIV2 << 6) | (PLL_DIV3 << 12) | (PLL_DIV4 << 18) |\
        (ST_PHASE_HI << 25) | (ST_DELAY_A << 26) | (SERDES_DTM1 << 28) |\
        (SERDES_DTM2 << 29) | (ALIGN_SHIFT << 30) | (CHANGE << 32) |\
        (PLL_CHAR_IN << 33)) 
#endif

define(cregs_ccu_ctl_reg_r64,  `0x'dnl
mpeval(CREGS_CCU_CTL_REG_R64, 16, 8))
