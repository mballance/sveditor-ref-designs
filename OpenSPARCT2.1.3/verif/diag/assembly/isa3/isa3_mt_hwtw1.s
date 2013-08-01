/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_mt_hwtw1.s
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
#define PORTABLE_CORE
		
#define THREAD_COUNT	8
#define THREAD_STRIDE	1

!!! Turn on HWTW
#define PART0_Z_HWTEN_0 1
#define PART0_NZ_HWTEN_0 1
#define PART0_Z_HWTEN_1 1
#define PART0_NZ_HWTEN_1 1
#define PART0_Z_HWTEN_2 1
#define PART0_NZ_HWTEN_2 1
#define PART0_Z_HWTEN_3 1
#define PART0_NZ_HWTEN_3 1
	
#define PART0_Z_RANOTPA_0 1
#define PART0_Z_RANOTPA_1 1
#define PART0_Z_RANOTPA_2 1
#define PART0_Z_RANOTPA_3 1
#define PART0_NZ_RANOTPA_0 1
#define PART0_NZ_RANOTPA_1 1
#define PART0_NZ_RANOTPA_2 1
#define PART0_NZ_RANOTPA_3 1

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	th_fork(begin_thread)

	EXIT_BAD

begin_thread_0:
	EXIT_GOOD

begin_thread_1:
	EXIT_GOOD

begin_thread_2:
	EXIT_GOOD

begin_thread_3:
	EXIT_GOOD

begin_thread_4:
	EXIT_GOOD

begin_thread_5:
	EXIT_GOOD

begin_thread_6:
	EXIT_GOOD

begin_thread_7:
	EXIT_GOOD

/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.word 0xD6B3479D
.word 0xDB28926C

