/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: my_console.s
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
uart_init:
	/*
	 * Supports only 16550 UART
	 *
	 * %g1 is UART base address
	 * %g2,%g3 clobbered
	 * %g7 return address
	 */
	ldub    [%g1 + LSR_ADDR], %g2   ! read LSR
	stb     %g0, [%g1 + IER_ADDR]   ! clear IER
	stb     %g0, [%g1 + FCR_ADDR]   ! clear FCR, disable FIFO
	mov     (FCR_XMIT_RESET | FCR_RCVR_RESET),  %g3
	stb     %g3, [%g1 + FCR_ADDR]   ! reset FIFOs in FCR
	mov     FCR_FIFO_ENABLE,  %g3
	stb     %g3, [%g1 + FCR_ADDR]   ! FCR enable FIFO
	mov     (LCR_DLAB | LCR_8N1), %g3
	stb     %g3, [%g1 + LCR_ADDR]   ! set LCR for 8-n-1, set DLAB
	! DLAB = 1
	mov     DLL_9600, %g3
	stb     %g3, [%g1 + DLL_ADDR]   ! set baud rate = 9600
	stb     %g0, [%g1 + DLM_ADDR]   ! set MS = 0
	! disable DLAB
	mov     LCR_8N1, %g3            ! set LCR for 8-n-1, unset DLAB
	stb     %g3, [%g1 + LCR_ADDR]   ! set LCR for 8-n-1, unset DLAB
	jmp     %g7 + 4
	nop


puts:
	setx    HV_UART, %g3, %g2
1:
	ldub    [%g2 + LSR_ADDR], %g3
	btst    LSR_THRE, %g3
	bz      1b
	nop

1:
	ldub    [%g1], %g3
	cmp     %g3, 0
	inc     %g1
	bne,a,pt %icc, 2f
	stb     %g3, [%g2]
	jmp     %g7 + 4
	nop

2:
	ldub    [%g2 + LSR_ADDR], %g3
	btst    LSR_TEMT, %g3
	bz      2b
	nop
	ba,a    1b

