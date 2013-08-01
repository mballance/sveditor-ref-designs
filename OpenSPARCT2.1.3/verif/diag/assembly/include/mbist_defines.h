/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mbist_defines.h
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
! MBIST_REG     0x8500000000
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#ifndef MBIST_MODE
#define MBIST_MODE   0x8500000000
#endif

#ifndef RESET_GEN
#define RESET_GEN 0x8900000808
#endif

#ifndef RESET_STAT
#define RESET_STAT 0x8900000810
#endif

#ifndef MBIST_BYPASS
#define MBIST_BYPASS   0x8500000008
#endif

#ifndef MBIST_START_WMR
#define MBIST_START_WMR   0x8500000038
#endif

#ifdef BIST_PAR
#define MBIST_MODE_REG 	  0x1
#endif

#ifdef BIST_SER
#define MBIST_MODE_REG 	  0x0
#endif

#ifndef MBIST_MODE_REG
#define MBIST_MODE_REG   0x1
#endif

#ifndef MBIST_BYPASS_REG
#define MBIST_BYPASS_REG   0xFFFFFFFFFEFF
#endif

#ifdef  CHANGE
#define WARM_RESET_INIT  1
#define CCU_REG_PROG     1
#endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! MBIST_MODE     0x8500000000
! RSVD0              63:4
! LOOP_MODE          3
! DIAGNOSTIC         2
! BISI               1
! PARALLEL           0
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!#ifndef CREGS_MBIST_MODE_REG_R64
!#define CREGS_MBIST_MODE_REG_R64 (MBIST_MODE_REG) 
!#endif

!define(cregs_mbist_mode_reg_r64,  `0x'dnl
!mpeval(CREGS_MBIST_MODE_REG_R64, 16, 8))
