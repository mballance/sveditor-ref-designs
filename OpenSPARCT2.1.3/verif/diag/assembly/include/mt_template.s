/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mt_template.s
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
#define USER_TEXT_MT_MAP
#define USER_DATA_MT_MAP

!! Change THREAD_COUNT to the number of threads to run
#ifndef THREAD_COUNT
#define THREAD_COUNT 2
#endif

!! For each thread, specify the path/diag name
!! Path should be relative to $DV_ROOT/verif/diag/assembly/

#ifndef THREAD_0_DIAG
#define THREAD_0_DIAG spc/spc2_hboot_test.s
#endif
#ifndef THREAD_1_DIAG
#define THREAD_1_DIAG uarch/tlu/diag/tlu_rand01_ind_01.s
#endif

#include "hboot.s"
