/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_init_rx.h
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
NIU_TX_INIT:
	setx	0x8100180000, %g1, %g2 
	setx	0x3, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180008, %g1, %g2 
	setx	0x3, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180000, %g1, %g2 
	setx	0x1, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180000, %g1, %g2 
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g3
	nop

	setx	0x8100180008, %g1, %g2 
	setx	0x1, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180008, %g1, %g2 
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g3
	nop

	setx	0x8100180060, %g1, %g2 
	setx	0x1000f01, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180000, %g1, %g2 
	setx	0x1, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180000, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g3
	nop

	setx	0x8100180008, %g1, %g2 
	setx	0x1, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180008, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g3
	nop

	setx	0x8100180060, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g3
	nop

	setx	0x8100180060, %g1, %g2 
	setx	0x1000f01, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180000, %g1, %g2 
	setx	0x1, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180000, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g3
	nop

	setx	0x8100180000, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g3
	nop

	setx	0x8100180008, %g1, %g2 
	setx	0x1, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180008, %g1, %g2
	ldxa	[%g2]ASI_PRIMARY_LITTLE, %g3
	nop

	setx	0x8100182000, %g1, %g2 
	setx	0x8000, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100280000, %g1, %g2 
	setx	0x10101, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100720000, %g1, %g2 
	setx	0x1f, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100590000, %g1, %g2 
	setx	0x0, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x81006a0000, %g1, %g2 
	setx	0x3, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100600010, %g1, %g2 
	setx	0x0fff000000000200, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100600018, %g1, %g2 
	setx	0x80, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100600040, %g1, %g2 
	setx	0x4fff000000020000, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100600000, %g1, %g2 
	setx	0x80000000, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100600020, %g1, %g2 
	setx	0x512, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180060, %g1, %g2
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g3
	nop
	
	setx	0x8100180060, %g1, %g2 
	setx	0x1000901, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180060, %g1, %g2
	ldxa    [%g2]ASI_PRIMARY_LITTLE, %g3
	nop

	setx	0x8100180060, %g1, %g2 
	setx	0x1010901, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180208, %g1, %g2 
	setx	0xffffffff, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180900, %g1, %g2 
	setx	0x0, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180908, %g1, %g2 
	setx	0x0, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180910, %g1, %g2 
	setx	0x0, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180918, %g1, %g2 
	setx	0x0, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180218, %g1, %g2 
	setx	0x1, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180220, %g1, %g2 
	setx	0xffff, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100180228, %g1, %g2 
	setx	0x100, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

#ifdef  MAC_RX_FRAME_INTR

	! Enable the interrupt in MAC0

	setx	0x8100180048, %g1, %g2
	stxa	%g0, [%g2]ASI_PRIMARY_LITTLE
	nop

	! Enable the interrupt in the NIU

	setx	0x8100b00000, %g1, %g2		! LD_IM1
	stxa	%g0, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100800018, %g1, %g2		! LDGIMGN
	setx	0x80000001, %g1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100080008, %g1, %g2		! LDGITMRES
	set	1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

	setx	0x8100810200, %g1, %g2		! SID
	set	1, %g3
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE
	nop

#endif
