/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ver.h
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


/*
		                VER
	+-.-.-.-.-.-.-.-.---.---.---.---.---.---.----+-.----+
	| MANUF |  IMPL |  MASK |  RSVD | MAXTL |RSVD|MAXWIN|
	+-------+-------+-------+-------+-------+----+------+
	 63   48 47   32 31   24 23   16 15    8 7  5 4    0

	6/23/93 lyoungs
*/

#define VER_MANUF_MASK		0xFFFF000000000000
#define VER_IMPL_MASK		0x0000FFFF00000000
#define VER_MASK_MASK		0x00000000FF000000
#define VER_MAXTL_MASK		0x000000000000FF00
#define VER_MAXWIN_MASK		0x000000000000001F

#define VER_MANUF_SHIFT		48
#define VER_IMPL_SHIFT		32
#define VER_MASK_SHIFT		24
#define VER_MAXTL_SHIFT		8
#define VER_MAXWIN_SHIFT	0

#define	VER_RD(REG) rdpr %ver,REG
#define	VER_WR(REG) wrpr REG,%ver
