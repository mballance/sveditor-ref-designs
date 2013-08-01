/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: pstate.h
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
!! WARNING:
!! For bit set/reset masks, use "X * 2**Y" instead of "X * 2^Y".
!! "^" means "exponentiation" under SunOS:/bin/m4, but
!!     means "bitwise xor" under Solaris:/usr/ccs/bin/m4.
!! "**" is acceptable notation for exponentiation with either.

!		         PSTATE
!	.--+--+---+---.-----+---+---.--+----+--+--+
!	|IG|MG|CLE|TLE|  MM |RED|PEF|AM|PRIV|IE|AG|
!	+--+--+---+---+-----+---+---+--+----+--+--+
!	 11 10  9   8  7   6  5   4   3   2   1  0

#define PSTATE_IG_MASK		0x800
#define PSTATE_MG_MASK		0x400
#define PSTATE_CLE_MASK		0x200
#define PSTATE_TLE_MASK		0x100
#define PSTATE_MM_MASK		0x0C0
#define	PSTATE_RED_MASK		0x020
#define	PSTATE_PEF_MASK		0x010
#define	PSTATE_AM_MASK		0x008
#define	PSTATE_PRIV_MASK	0x004
#define	PSTATE_IE_MASK		0x002
#define	PSTATE_AG_MASK		0x001

#define PSTATE_IG_SHIFT		11
#define PSTATE_MG_SHIFT		10
#define PSTATE_CLE_SHIFT	9
#define PSTATE_TLE_SHIFT	8
#define PSTATE_MM_SHIFT		6
#define	PSTATE_RED_SHIFT	5
#define	PSTATE_PEF_SHIFT	4
#define	PSTATE_AM_SHIFT		3
#define	PSTATE_PRIV_SHIFT	2
#define	PSTATE_IE_SHIFT		1
#define	PSTATE_AG_SHIFT		0

#define PSTATE_MM_TSO		0
#define	PSTATE_MM_PSO		1
#define	PSTATE_MM_RMO		2

#define	MM_TSO			PSTATE_MM_TSO
#define	MM_PSO			PSTATE_MM_PSO
#define	MM_RMO			PSTATE_MM_RMO

#define	PSTATE_RD(REG) rdpr %pstate,REG
#define	PSTATE_WR(REG) wrpr REG,%pstate
