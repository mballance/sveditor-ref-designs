/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mon_macros.h
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
#ifndef _MON_MACROS_H
#define _MON_MACROS_H

#ident "@(#)  mon_macros.h  1.13        05/04/11 10:05:17"

#define		R_IMPL_CHEETAH		0x14
#define		R_IMPL_CHEETAHPLUS	0x15
#define		R_IMPL_JALAPENO		0x16
#define		R_IMPL_GEMINI		0x17
#define		R_IMPL_JAGUAR		0x18
#define		R_IMPL_PANTHER		0x19
#define		R_IMPL_MILLENNIUM	0x20
#define		R_IMPL_SERRANO		0x22
#define		R_IMPL_NIAGRA		0x23

#ifdef CHTAH_CPU

#define PHCPUID_MASK 0x3ff
#define PHCPUID_SHIFT 17
#define MAXPHCPU (PHCPUID_MASK+1)
#define LOG2MAXCPU 8

#elif defined(BW_CPU)

#define PHCPUID_MASK 0xff
#define PHCPUID_SHIFT 17
#define MAXPHCPU 32
#define LOG2MAXCPU 5

#else

#define MAXPHCPU 1

#endif

#ifdef _ASM

#define		SAVE_OREGS( memptr, offset )\
	stx	%o0, [memptr + offset + 0x00]			;\
	stx	%o1, [memptr + offset + 0x08]			;\
	stx	%o2, [memptr + offset + 0x10]			;\
	stx	%o3, [memptr + offset + 0x18]			;\
	stx	%o4, [memptr + offset + 0x20]			;\
	stx	%o5, [memptr + offset + 0x28]			;\
	stx	%o6, [memptr + offset + 0x30]			;\
	stx	%o7, [memptr + offset + 0x38]

#define		RESTORE_OREGS( memptr, offset )\
	ldx	[memptr + offset + 0x00], %o0			;\
	ldx	[memptr + offset + 0x08], %o1			;\
	ldx	[memptr + offset + 0x10], %o2			;\
	ldx	[memptr + offset + 0x18], %o3			;\
	ldx	[memptr + offset + 0x20], %o4			;\
	ldx	[memptr + offset + 0x28], %o5			;\
	ldx	[memptr + offset + 0x30], %o6			;\
	ldx	[memptr + offset + 0x38], %o7


#define	GET_MUTEX(mutexname, mutexreg, scr1 )		\
	setx		mutexname, scr1, mutexreg	;\
7:;\
	ldstub		[mutexreg], scr1		;\
	brz		scr1, 9f			;\
	nop						;\
8:;\
	ldub		[mutexreg], scr1		;\
	brnz,pn		scr1, 8b			;\
	membar		#LoadLoad			;\
	ba		7b				;\
	nop						;\
9:;\
	rd		%pc, scr1			;\
	st		scr1, [mutexreg + 4]


#define	FREE_MUTEX( mutexname, mutexreg, scr1 )		\
	setx		mutexname, scr1, mutexreg	;\
	stub		%g0, [mutexreg]			;\
	membar		#LoadStore|#StoreStore

/*
 * VERS_TO_IMPL()
 *
 * The scratch register must be different from the output but 
 * can be the same as the input_ver_reg.
 *
 * The input and output can be the same provided the scratch
 * register is different.
 *
 * VERS_TO_IMPL( %g1, %g2, %g3 )	OK Vers is preserved
 * VERS_TO_IMPL( %g1, %g2, %g1 )	OK Vers on input is impl on o/p
 * VERS_TO_IMPL( %g1, %g1, %g2 )	OK Vers is corrupted
 * VERS_TO_IMPL( %g1, %g1, %g1 )	***BAD Will not work ***
 */

#define VERS_TO_IMPL( input_vers_reg, output_impl_reg )		\
	sllx		input_vers_reg, 16, output_impl_reg	;\
	srlx		output_impl_reg, 48, output_impl_reg

#ifdef CHTAH_CPU

#define	GET_VERS( scratch, output_ver )	\
	rdpr		%ver, output_ver

#define GET_IMPL(scratch,impl) \
        rdpr            %ver, impl; \
        VERS_TO_IMPL(impl,impl)

#define GET_PHCPUID(scratch,reg)\
	ldxa		[%g0]ASI_UPA_CONFIG,reg; \
	srlx		reg,PHCPUID_SHIFT,reg; \
	and		reg,PHCPUID_MASK,reg

#endif

#ifdef HPV

#include "rust_hpv_macros.h"

#define GET_VERS( scratch, output_ver )	\
	mov	%o0, scratch;\
	set   hcall_rust_rd_ver_reg, %o0;\
	DO_HPRIVCALL(%o0)	;\
	mov  	%o0, output_ver;\
	mov  	scratch, %o0

#define GET_IMPL( scratch, output_impl )\
	GET_VERS( scratch, output_impl );\
      VERS_TO_IMPL(impl,impl)

#define GET_PHCPUID(scratch,reg) \
        mov		%o0,scratch; \
	  GET_CPU_ID(reg);          \
        mov             scratch,%o0
#endif

#endif

#endif /* _MON_MACROS_H */
