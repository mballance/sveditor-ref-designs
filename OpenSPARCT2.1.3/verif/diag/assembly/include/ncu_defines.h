/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_defines.h
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
#ifndef NCU_DEFINES_H
#define NCU_DEFINES_H 1

#define INT_VEC_DIS		0x73

#define NCU_BASE_ADDRESS	0x8000000000
#define NCU_ASI_BASE_ADDRESS	0x9000000000

#define INT_MAN			mpeval(NCU_BASE_ADDRESS+0x0)
#define INT_MAN_STEP		8
#define INT_MAN_COUNT		128

#define MONDO_INT_VEC		mpeval(NCU_BASE_ADDRESS+0xa00)

#define MONDO_INT_DATA0		mpeval(NCU_BASE_ADDRESS+0x40000)
#define MONDO_INT_DATA0_STEP	8
#define MONDO_INT_DATA0_COUNT	64

#define MONDO_INT_DATA1		mpeval(NCU_BASE_ADDRESS+0x40200)
#define MONDO_INT_DATA1_STEP	8
#define MONDO_INT_DATA1_COUNT	64

#define MONDO_INT_ADATA0	mpeval(NCU_BASE_ADDRESS+0x40400)
#define MONDO_INT_ADATA1	mpeval(NCU_BASE_ADDRESS+0x40600)

#define MONDO_INT_BUSY		mpeval(NCU_BASE_ADDRESS+0x40800)
#define MONDO_INT_BUSY_STEP	8
#define MONDO_INT_BUSY_COUNT	64

#define MONDO_INT_ABUSY		mpeval(NCU_BASE_ADDRESS+0x40a00)

#define L2_IDX_HASH_EN_ADDR	mpeval(NCU_BASE_ADDRESS+0x1030)
#define L2_IDX_HASH_EN_STATUS_ADDR	mpeval(NCU_BASE_ADDRESS+0x1038)

#define NCU_SCKSEL		mpeval(NCU_BASE_ADDRESS+0x3040)

#endif /* NCU_DEFINES_H */
