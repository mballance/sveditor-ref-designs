/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ctraps.s
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
.text

#define ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_S 0x22
	
#ifdef SPILL_RMO
.align 4
.global spill_trap
spill_trap:
	wr	%g0, ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_S, %asi
        stxa    %l0, [%sp + STACK_BIAS + 0x00] %asi
        stxa    %l1, [%sp + STACK_BIAS + 0x08] %asi
        stxa    %l2, [%sp + STACK_BIAS + 0x10] %asi
        stxa    %l3, [%sp + STACK_BIAS + 0x18] %asi
        stxa    %l4, [%sp + STACK_BIAS + 0x20] %asi
        stxa    %l5, [%sp + STACK_BIAS + 0x28] %asi
        stxa    %l6, [%sp + STACK_BIAS + 0x30] %asi
        stxa    %l7, [%sp + STACK_BIAS + 0x38] %asi
        stxa    %i0, [%sp + STACK_BIAS + 0x40] %asi
	wr	%g0, ASI_AS_IF_USER_PRIMARY, %asi
        stxa    %i1, [%sp + STACK_BIAS + 0x48] %asi
        stxa    %i2, [%sp + STACK_BIAS + 0x50] %asi
        stxa    %i3, [%sp + STACK_BIAS + 0x58] %asi
        stxa    %i4, [%sp + STACK_BIAS + 0x60] %asi
        stxa    %i5, [%sp + STACK_BIAS + 0x68] %asi
        stxa    %i6, [%sp + STACK_BIAS + 0x70] %asi
        stxa    %i7, [%sp + STACK_BIAS + 0x78] %asi
        saved
	membar #Sync
	retry
	nop

	
#else
.align 4
.global spill_trap
spill_trap:
	wr	%g0, ASI_AS_IF_USER_PRIMARY, %asi
        stxa    %l0, [%sp + STACK_BIAS + 0x00] %asi
        stxa    %l1, [%sp + STACK_BIAS + 0x08] %asi
        stxa    %l2, [%sp + STACK_BIAS + 0x10] %asi
        stxa    %l3, [%sp + STACK_BIAS + 0x18] %asi
        stxa    %l4, [%sp + STACK_BIAS + 0x20] %asi
        stxa    %l5, [%sp + STACK_BIAS + 0x28] %asi
        stxa    %l6, [%sp + STACK_BIAS + 0x30] %asi
        stxa    %l7, [%sp + STACK_BIAS + 0x38] %asi
        stxa    %i0, [%sp + STACK_BIAS + 0x40] %asi
        stxa    %i1, [%sp + STACK_BIAS + 0x48] %asi
        stxa    %i2, [%sp + STACK_BIAS + 0x50] %asi
        stxa    %i3, [%sp + STACK_BIAS + 0x58] %asi
        stxa    %i4, [%sp + STACK_BIAS + 0x60] %asi
        stxa    %i5, [%sp + STACK_BIAS + 0x68] %asi
        stxa    %i6, [%sp + STACK_BIAS + 0x70] %asi
        stxa    %i7, [%sp + STACK_BIAS + 0x78] %asi
        saved
	retry
	nop
#endif

.align 4
.global fill_trap

fill_trap:
	wr	%g0, ASI_AS_IF_USER_PRIMARY, %asi	
        ldxa    [%sp + STACK_BIAS + 0x00] %asi, %l0
        ldxa    [%sp + STACK_BIAS + 0x08] %asi, %l1
        ldxa    [%sp + STACK_BIAS + 0x10] %asi, %l2
        ldxa    [%sp + STACK_BIAS + 0x18] %asi, %l3
        ldxa    [%sp + STACK_BIAS + 0x20] %asi, %l4
        ldxa    [%sp + STACK_BIAS + 0x28] %asi, %l5
        ldxa    [%sp + STACK_BIAS + 0x30] %asi, %l6
        ldxa    [%sp + STACK_BIAS + 0x38] %asi, %l7
        ldxa    [%sp + STACK_BIAS + 0x40] %asi, %i0
        ldxa    [%sp + STACK_BIAS + 0x48] %asi, %i1
        ldxa    [%sp + STACK_BIAS + 0x50] %asi, %i2
        ldxa    [%sp + STACK_BIAS + 0x58] %asi, %i3
        ldxa    [%sp + STACK_BIAS + 0x60] %asi, %i4
        ldxa    [%sp + STACK_BIAS + 0x68] %asi, %i5
        ldxa    [%sp + STACK_BIAS + 0x70] %asi, %i6
        ldxa    [%sp + STACK_BIAS + 0x78] %asi, %i7
        restored
	retry
	nop

.data
	.word 0        
