/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_init_tx.h
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

	setx	0x0000008100180000, %g1, %g2 
	setx	0x0000000000000003 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100180008, %g1, %g2 
	setx	0x0000000000000003 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100180000, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop

! niu_gen_pio::pio_rd addr = 8100180000 read_data = 0 ,
        call    delay_10
        nop
        setx    Time_out, %l1, %l3
loop_r0:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %l4
        nop
        brz     %l4, ok_0
        nop
        dec     %l3
        brnz    %l3, loop_r0
        nop
        call    Timeout
        nop

ok_0:
	setx	0x0000008100180008, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	

!niu_gen_pio::pio_rd addr = 8100180008 read_data = 0 ,
	nop
        call    delay_10
        nop
        setx    Time_out, %l1, %l3
loop_r1:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %l4
        nop
        brz     %l4, ok_1
        nop
        dec     %l3
        brnz    %l3, loop_r1
        nop
        call    Timeout
        nop
ok_1:
	setx	0x0000008100180060, %g1, %g2 
	setx	0x0000000001000f01 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100180000, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop

!niu_gen_pio::pio_rd addr = 8100180000 read_data = 0 , 
        call    delay_10
        nop
        setx    Time_out, %l1, %l3
loop_r2:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %l4
        nop
        brz     %l4, ok_2
        nop
        dec     %l3
        brnz    %l3, loop_r2
        nop
        call    Timeout
        nop
ok_2:
	setx	0x0000008100180008, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop

!niu_gen_pio::pio_rd addr = 8100180008 read_data = 0 , 
        call    delay_10
        nop
        setx    Time_out, %l1, %l3
loop_r3:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %l4
        nop
        brz     %l4, ok_3
        nop
        dec     %l3
        brnz    %l3, loop_r3
        nop
        call    Timeout
        nop
ok_3:

!niu_gen_pio::pio_rd addr = 8100180060 read_data = 1000f01 , 
        setx    0x8100180060, %g1, %g2
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %l4
        nop

	setx	0x0000008100180060, %g1, %g2 
	setx	0x0000000001000f01 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100180000, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
!niu_gen_pio::pio_rd addr = 8100180000 read_data = 1 , 
!niu_gen_pio::pio_rd addr = 8100180000 read_data = 0 ,
        call    delay_10
        nop
        setx    Time_out, %l1, %l3
loop_r4:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %l4
        nop
        brz     %l4, ok_4
        nop
        dec     %l3
        brnz    %l3, loop_r4
        nop
        call    Timeout
        nop
ok_4:

	setx	0x0000008100180008, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
!niu_gen_pio::pio_rd addr = 8100180008 read_data = 0 ,
        call    delay_10
        nop
        setx    Time_out, %l1, %l3 
loop_r5:
        ldxa     [%g2]ASI_PRIMARY_LITTLE, %l4
        nop
        brz     %l4, ok_5
        nop
        dec     %l3
        brnz    %l3, loop_r5
        nop
        call    Timeout
        nop
ok_5:

	setx	0x0000008100182000, %g1, %g2 
	setx	0x0000000000008000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100280000, %g1, %g2 
	setx	0x0000000000010101 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100720000, %g1, %g2 
	setx	0x000000000000001f , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100720028, %g1, %g2 
	setx	0x3d18ca7000000003 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0000, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0008, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100700000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0200, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0208, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100701000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0400, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0408, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100702000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0600, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0608, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100703000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0800, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0808, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100704000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0a00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0a08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100705000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0c00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0c08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100706000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0e00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c0e08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100707000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1000, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1008, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100708000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1200, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1208, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100709000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1400, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1408, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810070a000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1600, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1608, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810070b000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1800, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1808, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810070c000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1a00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1a08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810070d000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1c00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1c08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810070e000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1e00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c1e08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810070f000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2000, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2008, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100710000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2200, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2208, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100711000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2400, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2408, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100712000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2600, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2608, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100713000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2800, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2808, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100714000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2a00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2a08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100715000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2c00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2c08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100716000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2e00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c2e08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100717000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3000, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3008, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100718000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3200, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3208, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x0000008100719000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3400, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3408, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810071a000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3600, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3608, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810071b000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3800, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3808, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810071c000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3a00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3a08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810071d000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3c00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3c08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810071e000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3e00, %g1, %g2 
	setx	0x0000000000000001 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x00000081006c3e08, %g1, %g2 
	setx	0x0000000000000000 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop
	setx	0x000000810071f000, %g1, %g2 
	setx	0x00000000000001f4 , %g1, %g3	
	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
	nop

        ba      thread_0
        nop

!	setx	0x0000008100640000, %g1, %g2 
!	setx	0x0ffff0000000003d , %g1, %g3	
!	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
!	nop
!	setx	0x0000008100640018, %g1, %g2 
!	setx	0x0010e7a52980007b , %g1, %g3	
!	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
!	nop
!	setx	0x0000008100640028, %g1, %g2 
!	setx	0x0000000000000000 , %g1, %g3	
!	stxa	%g3, [%g2]ASI_PRIMARY_LITTLE	
!	nop

delay_10:
        save
        setx    delay_10_count, %l1, %l5
        setx    TX_CS, %l1, %l2
loop_delay:
        ldxa    [%l2]ASI_PRIMARY_LITTLE, %l1
        nop
        dec     %l5
        brnz    %l5, loop_delay
        nop
        ret
        restore

Timeout:
        call test_failed
        nop

