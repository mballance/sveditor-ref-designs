/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: checkp_offsets.h
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
#ifndef CHECKP_OFFSETS_H
#define CHECKP_OFFSETS_H

#define CHECKP_GLOBALS 0x0
#define CHECKP_GLOBALS_INCR 0x8
#define CHECKP_OUTS 0x40
#define CHECKP_OUTS_INCR 0x8
#define CHECKP_LOCALS 0x80
#define CHECKP_LOCALS_INCR 0x8
#define CHECKP_INS 0xc0
#define CHECKP_INS_INCR 0x8
#define CHECKP_FLOATS 0x100
#define CHECKP_FLOATS_INCR 0x8
#define CHECKP_Y 0x200
#define CHECKP_FPRS 0x208
#define CHECKP_FSR 0x210
#define CHECKP_TSTATE 0x218
#define CHECKP_PSTATE 0x220
#define CHECKP_ASI 0x228
#define CHECKP_PIL 0x230
#define CHECKP_TL 0x238
#define CHECKP_TPC 0x240
#define CHECKP_TNPC 0x248
#define CHECKP_TT 0x250
#define CHECKP_CWP 0x258
#define CHECKP_CANSAVE 0x260
#define CHECKP_CANRESTORE 0x268
#define CHECKP_OTHERWIN 0x270
#define CHECKP_CLEANWIN 0x278
#define CHECKP_ENTRY_SIZE 0x280


#endif /* CHECKP_OFFSETS_H */
