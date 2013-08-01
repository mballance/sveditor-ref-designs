/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: rst_defines.h
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
#define RST_BASE_ADDRESS	0x8900000000

#define RST_RESET_GEN           mpeval(RST_BASE_ADDRESS + 0x0808)
#define RST_RESET_GEN__DBR_GEN  mpeval(1 << 3)
#define RST_RESET_GEN__XIR_GEN  mpeval(1 << 1)
#define RST_RESET_GEN__WMR_GEN  mpeval(1 << 0)

#define RST_RSET_STAT           mpeval(RST_BASE_ADDRESS + 0x0810)

#define RST_RESET_SOURCE        mpeval(RST_BASE_ADDRESS + 0x0818)

#define RST_RESET_FEE           mpeval(RST_BASE_ADDRESS + 0x0820)

#define RST_SSYS_RESET          mpeval(RST_BASE_ADDRESS + 0x0838)
#define RST_SSYS_RESET__MAC_PROTECT mpeval(1 << 6)
#define RST_SSYS_RESET__MCU_SELFRSH mpeval(1 << 5)
#define RST_SSYS_RESET__DMU_PEU     mpeval(1 << 1)

#ifndef FC_NO_NIU_T2
#define RST_SSYS_RESET__NIU         mpeval(1 << 0)
#endif

#define RST_LOCK_TIME           mpeval(RST_BASE_ADDRESS + 0x0870)

#define RST_PROP_TIME           mpeval(RST_BASE_ADDRESS + 0x0880)

#ifndef FC_NO_NIU_T2
#define RST_NIU_TIME            mpeval(RST_BASE_ADDRESS + 0x0890)
#endif

