/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_defines.h
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
#define MBIST_MODE_REG			0x8500000000
#define	MBIST_BYPASS_REG		0x8500000008
#define	MBIST_START_REG			0x8500000010
#define MBIST_ABORT_REG			0X8500000018
#define MBIST_RESULT_REG		0x8500000020
#define	MBIST_DONE_REG			0x8500000028
#define	MBIST_FAIL_REG			0x8500000030
#define	MBIST_START_WMR_REG		0x8500000038
#define LBIST_MODE_REG			0x8500000040
#define	LBIST_BYPASS_REG		0x8500000048
#define LBIST_START_REG			0x8500000050
#define	LBIST_DONE_REG			0x8500000058
#define	TCU_DEBUG_EVENT_COUNTER_REG	0x85000000F8
#define	TCU_CYCLE_COUNTER_REG		0x8500000100
#define	TCU_DEBUG_CONTROL_REG		0x8500000108
#define	TCU_TRIGOUT_REG			0x8500000110
#define	CLKSTOP_DELAY_REG		0x8500000118
#define	PEUTESTCONFIG_ENABLE_REG	0x8500000180
