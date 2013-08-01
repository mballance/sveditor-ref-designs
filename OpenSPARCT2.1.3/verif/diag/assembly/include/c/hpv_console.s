/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: hpv_console.s
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
#ident "@(#)  hpv_console.s  1.2        04/10/12 12:12:01"
#include <sys/asm_linkage.h>

/*
 * Hypervisor calls
 */

#include <sys/asm_linkage.h>
#include "mon_macros.h"

#define EWOULDBLOCK     9

	.data
	.align          8
	.global         hv_getch_mutex
	.type           hv_getch_mutex, #object
	.size           hv_getch_mutex, 8
hv_getch_mutex:
	.xword          0

	.global         hv_putch_mutex
	.type           hv_putch_mutex, #object
	.size           hv_putch_mutex, 8
hv_putch_mutex:
	.xword          0


#if defined(lint) || defined(__lint)

/*ARGSUSED*/
int hv_writechars( char * buf, int len )
{
    return 0;
}

#else
/* 
 * This will need a mutex to prevent the output from
 * differing cpus coliding and interleaving.
 *
 * There is still a printf mutex that should protect
 * nearly all of the time. So that means the penalty
 * for acquiring a mutex here should be miniscule.
 */
	ENTRY2( hv_writechars, writechars )
	/*
	 * %i0 buffer pointer
	 * %i1 count
	 *
	 */
	save            %sp, -SA(MINFRAME), %sp

	brz             %i1, 3f
	mov             %g0, %l0

	subcc           %i1, 1, %l1
	bneg            %xcc, 4f
	nop

	GET_MUTEX( hv_putch_mutex, %l6, %l7 )

1:
	call            hv_cnputchar
	ldub            [%i0 + %l0], %o0
	cmp             %l0, %l1
	blt             %xcc, 1b
	add             %l0, 1, %l0

2:
	FREE_MUTEX( hv_putch_mutex, %l6, %l7 )
3:
	mov             %l0, %i0
	ret
	restore
	SET_SIZE( hv_writechars )
4:
	mov             %l0, %i0        ! return count of how many read
	ret
	restore

#endif

#if defined(lint) || defined(__lint)

/*ARGSUSED*/
int hv_readchars( char * buf, int len )
{
    return 0;
}

#else
/* 
 * This will need a mutex to prevent the output from 
 * differing cpus coliding and interleaving.
 *
 * There is still a printf mutex that should protect
 * nearly all of the time. So that means the penalty
 * for acquiring a mutex here should be miniscule.
 */
	.data   

	.global         console_master
	.type           console_master, #object

	.align          8
	.global         hv_read_result
	.type           hv_read_result, #object
hv_read_result:
	.xword          0
#if 0
	ENTRY2( hv_readchars, readchars )
	/*
	 * %i0 buffer pointer
	 * %i1 count
	 *
	 * returns count of characters read
	 */
	save            %sp, -SA(MINFRAME), %sp
	brz             %i1, 4f
	mov             %g0, %l0

	subcc           %i1, 1, %l1
	bneg            %xcc, 4f
	nop

	/*
	 * See if we are running on the console master - if not do not
	 * issue the console read
	 */

	call            getlogicalcpuid
	nop

	setx            console_master, %l5, %l6
	ld              [%l6], %l5
	cmp             %o0, %l5
	bne             %icc, 4f        ! j.if not console master
	nop


	GET_MUTEX( hv_getch_mutex, %l6, %l7 )

	/* while less than buffer and result is 0 */

1:
	call            hv_cngetchar
	add             %i0, %l0, %o0

	cmp             %o0, EWOULDBLOCK
	be              2f
	nop

	brnz            %o0, 3f         ! non zero return
	nop
	cmp             %l0, %l1
	blt             %xcc, 1b
	add             %l0, 1, %l0
2:
	FREE_MUTEX( hv_getch_mutex, %l6, %l7 )

4:
	mov             %l0, %i0        ! return count of how many read
	ret
	restore

3:
	setx            hv_read_result, %l3, %l2
	ba              2b
	stx             %o0,[%l2]
#endif

	SET_SIZE( hv_readchars )


#endif

