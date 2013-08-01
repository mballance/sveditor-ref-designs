/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: my_console.h
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
#ifndef __MY_CONSOLE_H
#define __MY_CONSOLE_H

#define PRINT(s)                        \
	ba      1f                      ;\
	rd      %pc, %g1                ;\
2:      .asciz  s                       ;\
	.align  4                       ;\
1:      add     %g1, 4, %g1             ;\
	ba      puts                    ;\
	rd      %pc, %g7                ;\



/*
 * Hypervisor UART console definitions
 */

#define HV_UART            0xfff0c2c000

#define RBR_ADDR        0x0
#define THR_ADDR        0x0
#define IER_ADDR        0x1
#define IIR_ADDR        0x2
#define FCR_ADDR        0x2
#define LCR_ADDR        0x3
#define MCR_ADDR        0x4
#define LSR_ADDR        0x5
#define MSR_ADDR        0x6
#define SCR_ADDR        0x7
#define DLL_ADDR        0x0
#define DLM_ADDR        0x1

/*
 * Some Line Status Register (FCR) bits
 */
#define LSR_DRDY        0x1
#define LSR_BINT        0x10
#define LSR_THRE        0x20
#define LSR_TEMT        0x40

/*
 * Some FIFO Control Register (FCR) bits
 */
#define FCR_FIFO_ENABLE 0x1
#define FCR_RCVR_RESET  0x2
#define FCR_XMIT_RESET  0x4

/*
 * Line Control Register settings
 */
#define LCR_DLAB        0x80
#define LCR_8N1         0x3

/*
 * Baud rate settings for Divisor Latch Low (DLL) and Most (DLM)
 */
#define DLL_9600        96
#define DLM_9600        0x0

#endif 
