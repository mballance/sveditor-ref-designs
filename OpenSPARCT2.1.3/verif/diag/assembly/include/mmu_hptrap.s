/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_hptrap.s
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
SECTION .HTRAPS  TEXT_VA=HPTRAP_TEXT_PA

attr_text {
    Name = .HTRAPS,
    hypervisor,
    }

	ta      HP_BAD_TRAP
.align	32	/* 1 */
	ta      HP_BAD_TRAP
.align	32	/* 2 */
	ta      HP_BAD_TRAP
.align	32	/* 3 */
	ta      HP_BAD_TRAP
.align	32	/* 4 */
	ta      HP_BAD_TRAP
.align	32	/* 5 */
	ta      HP_BAD_TRAP
.align	32	/* 6 */
	ta      HP_BAD_TRAP
.align	32	/* 7 */
	ta      HP_BAD_TRAP
.align	32	/* 8 */
#ifdef MMU247
        setx    ext_trap_0x8_begin, %g1, %g2
        jmp     %g2
        nop
#else
	ta      HP_BAD_TRAP
#endif
.align	32	/* 9 */
#ifdef CUSTOM_TRAP_0X9
        setx    custom_trap_0x9_handler, %g1, %g2
        jmp     %g2
        nop
#else
#ifdef MMU247
        setx    ext_trap_0x9_begin, %g1, %g2
        jmp     %g2
        nop
#else
	ta      HP_BAD_TRAP
#endif
#endif
.align	32	/* a */
	ta      HP_BAD_TRAP
.align	32	/* b */
#ifdef MMU247
        setx    ext_trap_0x8_begin, %g1, %g2
        jmp     %g2
        nop
#else
	ta      HP_BAD_TRAP
#endif
.align	32	/* c */
IAE_NFO_page:	
#ifdef CUSTOM_TRAP_0XC
        setx    custom_trap_0xc_handler, %g1, %g2
        jmp     %g2
        nop
#else
	ta      HP_BAD_TRAP
#endif
.align	32	/* d */
Instruction_address_range:
#ifdef MMU247
        setx    ext_trap_0x8_begin, %g1, %g2
        jmp     %g2
        nop
#else
	ta      HP_BAD_TRAP
#endif
.align	32	/* e */
Instruction_real_range:	
#ifdef CUSTOM_TRAP_0XE
        setx    custom_trap_0xe_handler, %g1, %g2
        jmp     %g2
        nop
#else
	ta      HP_BAD_TRAP
#endif
.align	32	/* f */
	ta      HP_BAD_TRAP
.align	32	/* 10 */
Illegal_instruction:
#ifdef MMU247
        setx    ext_trap_0x8_begin, %g1, %g2
        jmp     %g2
        nop
#else
	ta      HP_BAD_TRAP
#endif
.align	32	/* 11 */
	ta      HP_BAD_TRAP
.align	32	/* 12 */
	ta      HP_BAD_TRAP
.align	32	/* 13 */
	ta      HP_BAD_TRAP
.align	32	/* 14 */
DAE_Invalid_ASI:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 15 */
DAE_privilege_violation:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 16 */
DAE_nc_page:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 17 */
DAE_NFO_page:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 18 */
	ta      HP_BAD_TRAP
.align	32	/* 19 */
	ta      HP_BAD_TRAP
.align	32	/* 1a */
	ta      HP_BAD_TRAP
.align	32	/* 1b */
#ifdef MMU247
        setx    ext_trap_0x1b_begin, %g1, %g2
        jmp     %g2
        nop
#else
	ta      HP_BAD_TRAP
#endif
.align	32	/* 1c */
	ta      HP_BAD_TRAP
.align	32	/* 1d */
	ta      HP_BAD_TRAP
.align	32	/* 1e */
	ta      HP_BAD_TRAP
.align	32	/* 1f */
	ta      HP_BAD_TRAP
.align	32	/* 20 */
	ta      HP_BAD_TRAP
.align	32	/* 21 */
	ta      HP_BAD_TRAP
.align	32	/* 22 */
	ta      HP_BAD_TRAP
.align	32	/* 23 */
	ta      HP_BAD_TRAP
.align	32	/* 24 */
	ta      HP_BAD_TRAP
.align	32	/* 25 */
	ta      HP_BAD_TRAP
.align	32	/* 26 */
	ta      HP_BAD_TRAP
.align	32	/* 27 */
	ta      HP_BAD_TRAP
.align	32	/* 28 */
	ta      HP_BAD_TRAP
.align	32	/* 29 */
	ta      HP_BAD_TRAP
.align	32	/* 2a */
#ifdef CUSTOM_TRAP_0X2A
        setx    custom_trap_0x2a_handler, %g1, %g2
        jmp     %g2
        nop
#else
        setx    ext_trap_0x2a_begin, %g1, %g2
        jmp     %g2
        nop
#endif
.align	32	/* 2b */
#ifdef CUSTOM_TRAP_0X2B
        setx    custom_trap_0x2b_handler, %g1, %g2
        jmp     %g2
        nop
#else
        setx    ext_trap_0x2b_begin, %g1, %g2
        jmp     %g2
        nop
#endif
.align	32	/* 2c */
	ta      HP_BAD_TRAP
.align	32	/* 2d */
mem_real_range:	
#ifdef CUSTOM_TRAP_0X2D
        setx    custom_trap_0x2d_handler, %g1, %g2
        jmp     %g2
        nop
#else
#ifdef MMU247
	done
#else
	ta      HP_BAD_TRAP
#endif
#endif
.align	32	/* 2e */
#ifdef MMU247
	done
#else
	ta      HP_BAD_TRAP
#endif
.align	32	/* 2f */
	ta      HP_BAD_TRAP
.align	32	/* 30 */
DAE_so_page:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 31 */
#ifdef CUSTOM_TRAP_0X31
        setx    custom_trap_0x31_handler, %g1, %g2
        jmp     %g2
        nop
#else
#ifdef MMU247
        setx    ext_trap_0x31_begin, %g1, %g2
        jmp     %g2
        nop
#else
	ta      HP_BAD_TRAP
#endif
#endif
.align	32	/* 32 */
	ta      HP_BAD_TRAP
.align	32	/* 33 */
	ta      HP_BAD_TRAP
.align	32	/* 34 */
mem_address_not_aligned:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 35 */
LDDF_mem_address_not_aligned:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 36 */
STDF_mem_address_not_aligned:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 37 */
privileged_action:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 38 */
LDQF_mem_address_not_aligned:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 39 */
STQF_mem_address_not_aligned:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 3a */
	ta      HP_BAD_TRAP
.align	32	/* 3b */
unsupported_page_size:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 3c */
	ta      HP_BAD_TRAP
.align	32	/* 3d */
	ta      HP_BAD_TRAP
.align	32	/* 3e */
instruction_real_miss:	
#ifdef CUSTOM_TRAP_0X3E
	ta      HP_BAD_TRAP
#else
        setx    ext_trap_0x3e_begin, %g1, %g2
        jmp     %g2
        nop
#endif
.align	32	/* 3f */
data_real_miss:	
#ifdef CUSTOM_TRAP_0X3F
	ta      HP_BAD_TRAP
#else
        setx    ext_trap_0x3f_begin, %g1, %g2
        jmp     %g2
        nop
#endif
.align	32	/* 40 */
	ta      HP_BAD_TRAP
.align	32	/* 41 */
	ta      HP_BAD_TRAP
.align	32	/* 42 */
	ta      HP_BAD_TRAP
.align	32	/* 43 */
	ta      HP_BAD_TRAP
.align	32	/* 44 */
	ta      HP_BAD_TRAP
.align	32	/* 45 */
	ta      HP_BAD_TRAP
.align	32	/* 46 */
	ta      HP_BAD_TRAP
.align	32	/* 47 */
	ta      HP_BAD_TRAP
.align	32	/* 48 */
	ta      HP_BAD_TRAP
.align	32	/* 49 */
	ta      HP_BAD_TRAP
.align	32	/* 4a */
	ta      HP_BAD_TRAP
.align	32	/* 4b */
	ta      HP_BAD_TRAP
.align	32	/* 4c */
	ta      HP_BAD_TRAP
.align	32	/* 4d */
	ta      HP_BAD_TRAP
.align	32	/* 4e */
	ta      HP_BAD_TRAP
.align	32	/* 4f */
	ta      HP_BAD_TRAP
.align	32	/* 50 */
	ta      HP_BAD_TRAP
.align	32	/* 51 */
	ta      HP_BAD_TRAP
.align	32	/* 52 */
	ta      HP_BAD_TRAP
.align	32	/* 53 */
	ta      HP_BAD_TRAP
.align	32	/* 54 */
	ta      HP_BAD_TRAP
.align	32	/* 55 */
	ta      HP_BAD_TRAP
.align	32	/* 56 */
	ta      HP_BAD_TRAP
.align	32	/* 57 */
	ta      HP_BAD_TRAP
.align	32	/* 58 */
	ta      HP_BAD_TRAP
.align	32	/* 59 */
	ta      HP_BAD_TRAP
.align	32	/* 5a */
	ta      HP_BAD_TRAP
.align	32	/* 5b */
	ta      HP_BAD_TRAP
.align	32	/* 5c */
	ta      HP_BAD_TRAP
.align	32	/* 5d */
	ta      HP_BAD_TRAP
.align	32	/* 5e */
	ta      HP_BAD_TRAP
.align	32	/* 5f */
	ta      HP_BAD_TRAP
.align	32	/* 60 */
	ta      HP_BAD_TRAP
.align	32	/* 61 */
PA_watchpoint:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 62 */
VA_watchpoint:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 63 */
	ta      HP_BAD_TRAP
.align	32	/* 64 */
#ifdef CUSTOM_TRAP_0X64
        setx    custom_trap_0x64_handler, %g1, %g2
        jmp     %g2
	nop
#else
	setx	ext_trap_0x64_begin, %g1, %g2
	jmp	%g2
	nop
#endif
.align	32	/* 65 */
	ta      HP_BAD_TRAP
.align	32	/* 66 */
	ta      HP_BAD_TRAP
.align	32	/* 67 */
	ta      HP_BAD_TRAP
.align	32	/* 68 */
#ifdef CUSTOM_TRAP_0X68
        setx    custom_trap_0x68_handler, %g1, %g2
        jmp     %g2
	nop
#else
        setx    ext_trap_0x68_begin, %g1, %g2
        jmp     %g2
	nop
#endif
.align	32	/* 69 */
	ta      HP_BAD_TRAP
.align	32	/* 6a */
	ta      HP_BAD_TRAP
.align	32	/* 6b */
	ta      HP_BAD_TRAP
.align	32	/* 6c */
fast_data_access_protection:
#ifdef MMU247
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
#else
	ta      HP_BAD_TRAP
#endif
.align	32	/* 6d */
	ta      HP_BAD_TRAP
.align	32	/* 6e */
	ta      HP_BAD_TRAP
.align	32	/* 6f */
	ta      HP_BAD_TRAP
.align	32	/* 70 */
	ta      HP_BAD_TRAP
.align	32	/* 71 */
itlb_multiple_hit:	
#ifdef CUSTOM_TRAP_0X71
        setx    custom_trap_0x71_handler, %g1, %g2
        jmp     %g2
        nop
#else
	ta      HP_BAD_TRAP
#endif
.align	32	/* 72 */
dtlb_multiple_hit:	
#ifdef CUSTOM_TRAP_0X72
        setx    custom_trap_0x72_handler, %g1, %g2
        jmp     %g2
        nop
#else
	ta      HP_BAD_TRAP
#endif
.align	32	/* 73 */
	ta      HP_BAD_TRAP
.align	32	/* 74 */
	ta      HP_BAD_TRAP
.align	32	/* 75 */
instruction_VA_watchpoint:	
	or	%g0, 0x20, %g1
	ldxa	[%g1] 0x54, %g2     ! DSFAR
	done
.align	32	/* 76 */
	ta      HP_BAD_TRAP
.align	32	/* 77 */
	ta      HP_BAD_TRAP
.align	32	/* 78 */
	ta      HP_BAD_TRAP
.align	32	/* 79 */
	ta      HP_BAD_TRAP
.align	32	/* 7a */
	ta      HP_BAD_TRAP
.align	32	/* 7b */
	ta      HP_BAD_TRAP
.align	32	/* 7c */
	ta      HP_BAD_TRAP
.align	32	/* 7d */
	ta      HP_BAD_TRAP
.align	32	/* 7e */
	ta      HP_BAD_TRAP
.align	32	/* 7f */
	ta      HP_BAD_TRAP
.align	32	/* 80 */
Spill_n_normal:
#ifdef MMU247	wrpr	1, %tl  !Comment out for now..because handler is too big.
!   Why do we need it????/
        setx    ext_trap_0x8_begin, %g1, %g2
        jmp     %g2
        nop
        ta HP_BAD_TRAP ! This is for trap 81, since this one is 1 instruction too long
#else
	ta      HP_BAD_TRAP
.align 32
    ta      HP_BAD_TRAP
#endif
! Comment out 1 align since the previous trap handler is one instruction too long
!.align	32	/* 81 */
!	ta      HP_BAD_TRAP
.align	32	/* 82 */
	ta      HP_BAD_TRAP
.align	32	/* 83 */
	ta      HP_BAD_TRAP
.align	32	/* 84 */
	ta      HP_BAD_TRAP
.align	32	/* 85 */
	ta      HP_BAD_TRAP
.align	32	/* 86 */
	ta      HP_BAD_TRAP
.align	32	/* 87 */
	ta      HP_BAD_TRAP
.align	32	/* 88 */
	ta      HP_BAD_TRAP
.align	32	/* 89 */
	ta      HP_BAD_TRAP
.align	32	/* 8a */
	ta      HP_BAD_TRAP
.align	32	/* 8b */
	ta      HP_BAD_TRAP
.align	32	/* 8c */
	ta      HP_BAD_TRAP
.align	32	/* 8d */
	ta      HP_BAD_TRAP
.align	32	/* 8e */
	ta      HP_BAD_TRAP
.align	32	/* 8f */
	ta      HP_BAD_TRAP
.align	32	/* 90 */
	ta      HP_BAD_TRAP
.align	32	/* 91 */
	ta      HP_BAD_TRAP
.align	32	/* 92 */
	ta      HP_BAD_TRAP
.align	32	/* 93 */
	ta      HP_BAD_TRAP
.align	32	/* 94 */
	ta      HP_BAD_TRAP
.align	32	/* 95 */
	ta      HP_BAD_TRAP
.align	32	/* 96 */
	ta      HP_BAD_TRAP
.align	32	/* 97 */
	ta      HP_BAD_TRAP
.align	32	/* 98 */
	ta      HP_BAD_TRAP
.align	32	/* 99 */
	ta      HP_BAD_TRAP
.align	32	/* 9a */
	ta      HP_BAD_TRAP
.align	32	/* 9b */
	ta      HP_BAD_TRAP
.align	32	/* 9c */
	ta      HP_BAD_TRAP
.align	32	/* 9d */
	ta      HP_BAD_TRAP
.align	32	/* 9e */
	ta      HP_BAD_TRAP
.align	32	/* 9f */
	ta      HP_BAD_TRAP
.align	32	/* a0 */
	ta      HP_BAD_TRAP
.align	32	/* a1 */
	ta      HP_BAD_TRAP
.align	32	/* a2 */
	ta      HP_BAD_TRAP
.align	32	/* a3 */
	ta      HP_BAD_TRAP
.align	32	/* a4 */
	ta      HP_BAD_TRAP
.align	32	/* a5 */
	ta      HP_BAD_TRAP
.align	32	/* a6 */
	ta      HP_BAD_TRAP
.align	32	/* a7 */
	ta      HP_BAD_TRAP
.align	32	/* a8 */
	ta      HP_BAD_TRAP
.align	32	/* a9 */
	ta      HP_BAD_TRAP
.align	32	/* aa */
	ta      HP_BAD_TRAP
.align	32	/* ab */
	ta      HP_BAD_TRAP
.align	32	/* ac */
	ta      HP_BAD_TRAP
.align	32	/* ad */
	ta      HP_BAD_TRAP
.align	32	/* ae */
	ta      HP_BAD_TRAP
.align	32	/* af */
	ta      HP_BAD_TRAP
.align	32	/* b0 */
	ta      HP_BAD_TRAP
.align	32	/* b1 */
	ta      HP_BAD_TRAP
.align	32	/* b2 */
	ta      HP_BAD_TRAP
.align	32	/* b3 */
	ta      HP_BAD_TRAP
.align	32	/* b4 */
	ta      HP_BAD_TRAP
.align	32	/* b5 */
	ta      HP_BAD_TRAP
.align	32	/* b6 */
	ta      HP_BAD_TRAP
.align	32	/* b7 */
	ta      HP_BAD_TRAP
.align	32	/* b8 */
	ta      HP_BAD_TRAP
.align	32	/* b9 */
	ta      HP_BAD_TRAP
.align	32	/* ba */
	ta      HP_BAD_TRAP
.align	32	/* bb */
	ta      HP_BAD_TRAP
.align	32	/* bc */
	ta      HP_BAD_TRAP
.align	32	/* bd */
	ta      HP_BAD_TRAP
.align	32	/* be */
	ta      HP_BAD_TRAP
.align	32	/* bf */
	ta      HP_BAD_TRAP
.align	32	/* c0 */
	ta      HP_BAD_TRAP
.align	32	/* c1 */
	ta      HP_BAD_TRAP
.align	32	/* c2 */
	ta      HP_BAD_TRAP
.align	32	/* c3 */
	ta      HP_BAD_TRAP
.align	32	/* c4 */
	ta      HP_BAD_TRAP
.align	32	/* c5 */
	ta      HP_BAD_TRAP
.align	32	/* c6 */
	ta      HP_BAD_TRAP
.align	32	/* c7 */
	ta      HP_BAD_TRAP
.align	32	/* c8 */
	ta      HP_BAD_TRAP
.align	32	/* c9 */
	ta      HP_BAD_TRAP
.align	32	/* ca */
	ta      HP_BAD_TRAP
.align	32	/* cb */
	ta      HP_BAD_TRAP
.align	32	/* cc */
	ta      HP_BAD_TRAP
.align	32	/* cd */
	ta      HP_BAD_TRAP
.align	32	/* ce */
	ta      HP_BAD_TRAP
.align	32	/* cf */
	ta      HP_BAD_TRAP
.align	32	/* d0 */
	ta      HP_BAD_TRAP
.align	32	/* d1 */
	ta      HP_BAD_TRAP
.align	32	/* d2 */
	ta      HP_BAD_TRAP
.align	32	/* d3 */
	ta      HP_BAD_TRAP
.align	32	/* d4 */
	ta      HP_BAD_TRAP
.align	32	/* d5 */
	ta      HP_BAD_TRAP
.align	32	/* d6 */
	ta      HP_BAD_TRAP
.align	32	/* d7 */
	ta      HP_BAD_TRAP
.align	32	/* d8 */
	ta      HP_BAD_TRAP
.align	32	/* d9 */
	ta      HP_BAD_TRAP
.align	32	/* da */
	ta      HP_BAD_TRAP
.align	32	/* db */
	ta      HP_BAD_TRAP
.align	32	/* dc */
	ta      HP_BAD_TRAP
.align	32	/* dd */
	ta      HP_BAD_TRAP
.align	32	/* de */
	ta      HP_BAD_TRAP
.align	32	/* df */
	ta      HP_BAD_TRAP
.align	32	/* e0 */
	ta      HP_BAD_TRAP
.align	32	/* e1 */
	ta      HP_BAD_TRAP
.align	32	/* e2 */
	ta      HP_BAD_TRAP
.align	32	/* e3 */
	ta      HP_BAD_TRAP
.align	32	/* e4 */
	ta      HP_BAD_TRAP
.align	32	/* e5 */
	ta      HP_BAD_TRAP
.align	32	/* e6 */
	ta      HP_BAD_TRAP
.align	32	/* e7 */
	ta      HP_BAD_TRAP
.align	32	/* e8 */
	ta      HP_BAD_TRAP
.align	32	/* e9 */
	ta      HP_BAD_TRAP
.align	32	/* ea */
	ta      HP_BAD_TRAP
.align	32	/* eb */
	ta      HP_BAD_TRAP
.align	32	/* ec */
	ta      HP_BAD_TRAP
.align	32	/* ed */
	ta      HP_BAD_TRAP
.align	32	/* ee */
	ta      HP_BAD_TRAP
.align	32	/* ef */
	ta      HP_BAD_TRAP
.align	32	/* f0 */
	ta      HP_BAD_TRAP
.align	32	/* f1 */
	ta      HP_BAD_TRAP
.align	32	/* f2 */
	ta      HP_BAD_TRAP
.align	32	/* f3 */
	ta      HP_BAD_TRAP
.align	32	/* f4 */
	ta      HP_BAD_TRAP
.align	32	/* f5 */
	ta      HP_BAD_TRAP
.align	32	/* f6 */
	ta      HP_BAD_TRAP
.align	32	/* f7 */
	ta      HP_BAD_TRAP
.align	32	/* f8 */
	ta      HP_BAD_TRAP
.align	32	/* f9 */
	ta      HP_BAD_TRAP
.align	32	/* fa */
	ta      HP_BAD_TRAP
.align	32	/* fb */
	ta      HP_BAD_TRAP
.align	32	/* fc */
	ta      HP_BAD_TRAP
.align	32	/* fd */
	ta      HP_BAD_TRAP
.align	32	/* fe */
	ta      HP_BAD_TRAP
.align	32	/* ff */
	ta      HP_BAD_TRAP
.align	32	/* 100 */
	wrpr	0, %tl
	ta	HP_GOOD_TRAP
.align	32	/* 101 */
	wrpr	0, %tl
	ta	HP_BAD_TRAP
.align	32	/* 102 */
	ta      HP_BAD_TRAP
.align	32	/* 103 */
	ta      HP_BAD_TRAP
.align	32	/* 104 */
	ta      HP_BAD_TRAP
.align	32	/* 105 */
	ta      HP_BAD_TRAP
.align	32	/* 106 */
	ta      HP_BAD_TRAP
.align	32	/* 107 */
	ta      HP_BAD_TRAP
.align	32	/* 108 */
	ta      HP_BAD_TRAP
.align	32	/* 109 */
	ta      HP_BAD_TRAP
.align	32	/* 10a */
	ta      HP_BAD_TRAP
.align	32	/* 10b */
	ta      HP_BAD_TRAP
.align	32	/* 10c */
	ta      HP_BAD_TRAP
.align	32	/* 10d */
	ta      HP_BAD_TRAP
.align	32	/* 10e */
	ta      HP_BAD_TRAP
.align	32	/* 10f */
	ta      HP_BAD_TRAP
.align	32	/* 110 */
	ta      HP_BAD_TRAP
.align	32	/* 111 */
	ta      HP_BAD_TRAP
.align	32	/* 112 */
	ta      HP_BAD_TRAP
.align	32	/* 113 */
	ta      HP_BAD_TRAP
.align	32	/* 114 */
	ta      HP_BAD_TRAP
.align	32	/* 115 */
	ta      HP_BAD_TRAP
.align	32	/* 116 */
	ta      HP_BAD_TRAP
.align	32	/* 117 */
	ta      HP_BAD_TRAP
.align	32	/* 118 */
	ta      HP_BAD_TRAP
.align	32	/* 119 */
	ta      HP_BAD_TRAP
.align	32	/* 11a */
	ta      HP_BAD_TRAP
.align	32	/* 11b */
	ta      HP_BAD_TRAP
.align	32	/* 11c */
	ta      HP_BAD_TRAP
.align	32	/* 11d */
	ta      HP_BAD_TRAP
.align	32	/* 11e */
	ta      HP_BAD_TRAP
.align	32	/* 11f */
	ta      HP_BAD_TRAP
.align	32	/* 120 */
	ta      HP_BAD_TRAP
.align	32	/* 121 */
	ta      HP_BAD_TRAP
.align	32	/* 122 */
	ta      HP_BAD_TRAP
.align	32	/* 123 */
	ta      HP_BAD_TRAP
.align	32	/* 124 */
	ta      HP_BAD_TRAP
.align	32	/* 125 */
	ta      HP_BAD_TRAP
.align	32	/* 126 */
	ta      HP_BAD_TRAP
.align	32	/* 127 */
	ta      HP_BAD_TRAP
.align	32	/* 128 */
	ta      HP_BAD_TRAP
.align	32	/* 129 */
	ta      HP_BAD_TRAP
.align	32	/* 12a */
	ta      HP_BAD_TRAP
.align	32	/* 12b */
	ta      HP_BAD_TRAP
.align	32	/* 12c */
	ta      HP_BAD_TRAP
.align	32	/* 12d */
	ta      HP_BAD_TRAP
.align	32	/* 12e */
	ta      HP_BAD_TRAP
.align	32	/* 12f */
	ta      HP_BAD_TRAP
.align	32	/* 130 */
	ta      HP_BAD_TRAP
.align	32	/* 131 */
	ta      HP_BAD_TRAP
.align	32	/* 132 */
	ta      HP_BAD_TRAP
.align	32	/* 133 */
	ta      HP_BAD_TRAP
.align	32	/* 134 */
	ta      HP_BAD_TRAP
.align	32	/* 135 */
	ta      HP_BAD_TRAP
.align	32	/* 136 */
	ta      HP_BAD_TRAP
.align	32	/* 137 */
	ta      HP_BAD_TRAP
.align	32	/* 138 */
	ta      HP_BAD_TRAP
.align	32	/* 139 */
	ta      HP_BAD_TRAP
.align	32	/* 13a */
	ta      HP_BAD_TRAP
.align	32	/* 13b */
	ta      HP_BAD_TRAP
.align	32	/* 13c */
	ta      HP_BAD_TRAP
.align	32	/* 13d */
	ta      HP_BAD_TRAP
.align	32	/* 13e */
	ta      HP_BAD_TRAP
.align	32	/* 13f */
	ta      HP_BAD_TRAP
.align	32	/* 140 */
	ta      HP_BAD_TRAP
.align	32	/* 141 */
	ta      HP_BAD_TRAP
.align	32	/* 142 */
	ta      HP_BAD_TRAP
.align	32	/* 143 */
	ta      HP_BAD_TRAP
.align	32	/* 144 */
	ta      HP_BAD_TRAP
.align	32	/* 145 */
	ta      HP_BAD_TRAP
.align	32	/* 146 */
	ta      HP_BAD_TRAP
.align	32	/* 147 */
	ta      HP_BAD_TRAP
.align	32	/* 148 */
	ta      HP_BAD_TRAP
.align	32	/* 149 */
	ta      HP_BAD_TRAP
.align	32	/* 14a */
	ta      HP_BAD_TRAP
.align	32	/* 14b */
	ta      HP_BAD_TRAP
.align	32	/* 14c */
	ta      HP_BAD_TRAP
.align	32	/* 14d */
	ta      HP_BAD_TRAP
.align	32	/* 14e */
	ta      HP_BAD_TRAP
.align	32	/* 14f */
	ta      HP_BAD_TRAP
.align	32	/* 150 */
	ta      HP_BAD_TRAP
.align	32	/* 151 */
	ta      HP_BAD_TRAP
.align	32	/* 152 */
	ta      HP_BAD_TRAP
.align	32	/* 153 */
	ta      HP_BAD_TRAP
.align	32	/* 154 */
	ta      HP_BAD_TRAP
.align	32	/* 155 */
	ta      HP_BAD_TRAP
.align	32	/* 156 */
	ta      HP_BAD_TRAP
.align	32	/* 157 */
	ta      HP_BAD_TRAP
.align	32	/* 158 */
	ta      HP_BAD_TRAP
.align	32	/* 159 */
	ta      HP_BAD_TRAP
.align	32	/* 15a */
	ta      HP_BAD_TRAP
.align	32	/* 15b */
	ta      HP_BAD_TRAP
.align	32	/* 15c */
	ta      HP_BAD_TRAP
.align	32	/* 15d */
	ta      HP_BAD_TRAP
.align	32	/* 15e */
	ta      HP_BAD_TRAP
.align	32	/* 15f */
	ta      HP_BAD_TRAP
.align	32	/* 160 */
	ta      HP_BAD_TRAP
.align	32	/* 161 */
	ta      HP_BAD_TRAP
.align	32	/* 162 */
	ta      HP_BAD_TRAP
.align	32	/* 163 */
	ta      HP_BAD_TRAP
.align	32	/* 164 */
	ta      HP_BAD_TRAP
.align	32	/* 165 */
	ta      HP_BAD_TRAP
.align	32	/* 166 */
	ta      HP_BAD_TRAP
.align	32	/* 167 */
	ta      HP_BAD_TRAP
.align	32	/* 168 */
	ta      HP_BAD_TRAP
.align	32	/* 169 */
	ta      HP_BAD_TRAP
.align	32	/* 16a */
	ta      HP_BAD_TRAP
.align	32	/* 16b */
	ta      HP_BAD_TRAP
.align	32	/* 16c */
	ta      HP_BAD_TRAP
.align	32	/* 16d */
	ta      HP_BAD_TRAP
.align	32	/* 16e */
	ta      HP_BAD_TRAP
.align	32	/* 16f */
	ta      HP_BAD_TRAP
.align	32	/* 170 */
	ta      HP_BAD_TRAP
.align	32	/* 171 */
	ta      HP_BAD_TRAP
.align	32	/* 172 */
	ta      HP_BAD_TRAP
.align	32	/* 173 */
	ta      HP_BAD_TRAP
.align	32	/* 174 */
	ta      HP_BAD_TRAP
.align	32	/* 175 */
	ta      HP_BAD_TRAP
.align	32	/* 176 */
	ta      HP_BAD_TRAP
.align	32	/* 177 */
	ta      HP_BAD_TRAP
.align	32	/* 178 */
	ta      HP_BAD_TRAP
.align	32	/* 179 */
	ta      HP_BAD_TRAP
.align	32	/* 17a */
	ta      HP_BAD_TRAP
.align	32	/* 17b */
	ta      HP_BAD_TRAP
.align	32	/* 17c */
	ta      HP_BAD_TRAP
.align	32	/* 17d */
	ta      HP_BAD_TRAP
.align	32	/* 17e */
	ta      HP_BAD_TRAP
.align	32	/* 17f */
	ta      HP_BAD_TRAP
.align	32	/* 180 */
	! For all demaps, assume register %i7 = {VA[63:13],13'h0}
hptrap_I_demap_all:
        or      0x80, %g0, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 181 */
hptrap_I_demap_pctx:
        or      0x40, %g0, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 182 */
	ta      HP_BAD_TRAP
.align	32	/* 183 */
hptrap_I_demap_nctx:
        or      0x60, %g0, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 184 */
hptrap_I_demap_page:
        andn    %i7, 0x0c7, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 185 */
hptrap_I_demap_rpage:
        or      0x400, %i7, %g1
	andn	%g1, 0x0c7, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 186 */
	ta      HP_BAD_TRAP
.align	32	/* 187 */
hptrap_D_demap_all:
        or      0x80, %g0, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 188 */
hptrap_D_demap_pctx:
        or      0x40, %g0, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 189 */
hptrap_D_demap_sctx:
        or      0x50, %g0, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 18a */
hptrap_D_demap_nctx:
        or      0x60, %g0, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 18b */
hptrap_D_demap_page:
        andn    %i7, 0x0c7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 18c */
hptrap_D_demap_rpage:
        or      0x400, %i7, %g1
	andn	%g1, 0x0c7, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 18d */
	ta      HP_BAD_TRAP
.align	32	/* 18e */
	ta      HP_BAD_TRAP
.align	32	/* 18f */
	ta      HP_BAD_TRAP
.align	32	/* 190 */
	ta      HP_BAD_TRAP
.align	32	/* 191 */
hptrap_change_pid:	
	mov	ASI_PARTITION_ID_VAL, %g1
	ldxa	[%g1] ASI_PARTITION_ID, %g2
	add	%g2, 1, %g2
	and	%g2, 7, %g2
	stxa	%g2, [%g1] ASI_PARTITION_ID
	done
.align	32	/* 192 */
hptrap_incr_tsb_size:	
	ta      HP_BAD_TRAP
        !setx    ext_trap_0x192_begin, %g1, %g2
        !jmp     %g2
        !nop
.align	32	/* 193 */
clear_lsu_immu:	
	or	%g0, 0x4, %g1
	ldxa	[%g0] 0x45, %g2
	xor	%g2, %g1, %g3
	stxa	%g3, [%g0] 0x45
	done
.align	32	/* 194 */
clear_lsu_dmmu:	
	or	%g0, 0x8, %g1
	ldxa	[%g0] 0x45, %g2
	xor	%g2, %g1, %g3
	stxa	%g3, [%g0] 0x45
	done
.align	32	/* 195 */
delay_loop:	/* %i7 = loop count */
	brnz,a	%i7, delay_loop
	sub	%i7, 1, %i7
	done
.align	32	/* 196 */
	setx	ext_trap_sem_lock_begin, %g1, %g2
	jmp	%g2
	nop
.align	32	/* 197 */
	setx	ext_trap_sem_release_begin, %g1, %g2
	jmp	%g2
	nop
.align	32	/* 198 */
	setx	sem_data, %g5, %g4	! %g4 = sem_data
	ldx	[%g4+8], %i7
	done
.align	32	/* 199 */
	setx	sem_data, %g5, %g4	! %g4 = sem_data
	stx	%i7, [%g4+8]
	done
.align	32	/* 19a */
goto_supervisor0:	
	! %i7 = target address for supervisor code
	rdhpr	%hpstate, %i6
	rdpr	%pstate, %g2
	wrpr	%g2, 4, %pstate
	wrpr	0, %tl
	wrpr	0, %gl
	jmp	%i7
	wrhpr	%i6, 4, %hpstate
.align	32	/* 19b */
goto_supervisor1:	
	! %i7 = target address for supervisor code
	rdhpr	%hpstate, %i6
	rdpr	%pstate, %g2
	wrpr	%g2, 4, %pstate
	wrpr	1, %tl
	wrpr	0, %gl
	jmp	%i7
	wrhpr	%i6, 4, %hpstate
.align	32	/* 19c */
hptrap_I_demap_all_pages:
        or      0x0c0, %g0, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 19d */
hptrap_I_demap_all_rpages:
        or      0x4c0, %g0, %g1
        stxa    %g0, [%g1] ASI_IMMU_DEMAP
        done
.align	32	/* 19e */
hptrap_D_demap_all_pages:
        or      0xc0, %g0, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 19f */
hptrap_D_demap_all_rpages:
        or      0x8c0, %g0, %g1
        stxa    %g0, [%g1] ASI_DMMU_DEMAP
        done
.align	32	/* 1a0 */

trap_handler_1a0:
.global	good_trap
good_trap:
	ba	good_trap
	nop
	nop
	nop

.align 32
trap_handler_1a1:
.global	bad_trap
bad_trap:
	ba	bad_trap
	nop
	nop
	nop
	
.align	32	/* 1a2 */
hptrap_access_itsb_ptr:
	setx	ext_trap_access_itsb_ptr, %g1, %g2
	jmp	%g2
	nop
.align	32	/* 1a3 */
hptrap_access_dtsb_ptr:
	setx	ext_trap_access_dtsb_ptr, %g1, %g2
	jmp	%g2
	nop
.align	32	/* 1a4 */
hptrap_toggle_lsu_im:
	ldxa	[%g0] 0x45, %g1
	xor	%g1, 4, %g1
	stxa	%g1, [%g0] 0x45
	done
.align	32	/* 1a5 */
hptrap_toggle_lsu_dm:
	ldxa	[%g0] 0x45, %g1
	xor	%g1, 8, %g1
	stxa	%g1, [%g0] 0x45
	done
.align	32	/* 1a6 */
hptrap_load_idata_in:
#ifdef CUSTOM_TRAP_0XA6
	setx	custom_trap_load_idata_in, %g1, %g2
	jmp	%g2
	nop
#else
#ifdef MMU247
	setx	ext_trap_load_idata_in, %g1, %g2
	jmp	%g2
	nop
#else
	ta      HP_BAD_TRAP
#endif
#endif
.align	32	/* 1a7 */
hptrap_load_ddata_in:
#ifdef CUSTOM_TRAP_0XA7
	setx	custom_trap_load_ddata_in, %g1, %g2
	jmp	%g2
	nop
#else
#ifdef MMU247
	setx	ext_trap_load_ddata_in, %g1, %g2
	jmp	%g2
	nop
#else
	ta      HP_BAD_TRAP
#endif
#endif
	
.align	32	/* 1a8 */
hptrap_read_idata_access:
#ifdef CUSTOM_TRAP_0XA8
	setx	custom_trap_read_idata_access, %g1, %g2
	jmp	%g2
	nop
#else
#ifdef MMU247
	! We assume the index is in %i7
	ldxa	[%i7] 0x55, %g1
	done
#else
	ta      HP_BAD_TRAP
#endif
#endif
	
.align	32	/* 1a9 */
hptrap_read_ddata_access:
#ifdef CUSTOM_TRAP_0XA9
	setx	custom_trap_read_ddata_access, %g1, %g2
	jmp	%g2
	nop
#else
#ifdef MMU247
	! We assume the index is in %i7
	ldxa	[%i7] 0x5d, %g1
	done
#else
	ta      HP_BAD_TRAP
#endif
#endif
	
.align	32	/* 1aa */
hptrap_user_trap:
#ifdef CUSTOM_TRAP_0XAA
	setx	custom_user_trap, %g1, %g2
	jmp	%g2
	nop
#else
#ifdef MMU247
	ta      HP_BAD_TRAP
#else
	ta      HP_BAD_TRAP
#endif
#endif
	
.align	32	/* 1ab */
hptrap_load_idata_access:
#ifdef CUSTOM_TRAP_0XAB
	setx	custom_trap_load_idata_access, %g1, %g2
	jmp	%g2
	nop
#else
#ifdef MMU247
	! We assume the index is in %i7
	setx	ext_trap_load_idata_access, %g1, %g2
	jmp	%g2
	nop
#else
	ta      HP_BAD_TRAP
#endif
#endif
	
.align	32	/* 1ac */
hptrap_load_ddata_access:
#ifdef CUSTOM_TRAP_0XAC
	setx	custom_trap_load_ddata_access, %g1, %g2
	jmp	%g2
	nop
#else
#ifdef MMU247
	! We assume the index is in %i7
	setx	ext_trap_load_ddata_access, %g1, %g2
	jmp	%g2
	nop
#else
	ta      HP_BAD_TRAP
#endif
#endif
	
.align	32	/* 1ad */
hptrap_itlb_probe:
	! We assume the VA is in %i7
	ldxa	[%i7] 0x53, %i7
	done

.align	32	/* 1ae */
toggle_hwtw_demap:	
	setx	ext_trap_toggle_hwtw_demap, %g1, %g2
	jmp	%g2
	nop
	
.align	32	/* 1af */
hptrap_itlb_tag_read:
#ifdef MMU247
	! We assume the index is in %i7
	ldxa	[%i7] MMU_ASI_I_TAG_READ_REG, %g1
	done
#else
	ta      HP_BAD_TRAP
#endif
	
.align	32	/* 1b0 */
hptrap_dtlb_tag_read:
#ifdef MMU247
	! We assume the index is in %i7
	ldxa	[%i7] MMU_ASI_D_TAG_READ_REG, %g1
	done
#else
	ta      HP_BAD_TRAP
#endif
	
.align	32	/* 1b1 */
#ifdef MMU247
	wrpr	%g0, %tl
	wrpr	%g0, %gl
	wrpr	%i6, %pstate
	rdhpr	%hpstate, %i6
	jmp	%i7
	wrhpr	%i6, 4, %hpstate
#else
	ta      HP_BAD_TRAP
#endif
	
!******************************************************************************************
SECTION .HPTRAPS_EXT_SECT   TEXT_VA=HPTRAPS_EXT_TEXT_PA, DATA_VA=HPTRAPS_EXT_DATA_PA
	
attr_text {
	Name=.HPTRAPS_EXT_SECT,
	hypervisor
}

.text
.global ext_trap_0x2a_begin
.global ext_trap_0x2b_begin
.global ext_trap_0x3e_begin
.global ext_trap_0x3f_begin
.global ext_trap_0x64_begin
.global ext_trap_0x68_begin
.global ext_trap_0x192_begin
.global ext_trap_sem_lock_begin
.global ext_trap_sem_release_begin
.global ext_trap_access_itsb_ptr
.global ext_trap_access_dtsb_ptr
.global ext_trap_0x8_begin
.global ext_trap_0x9_begin
.global ext_trap_0x1b_begin
.global ext_trap_0x31_begin
.global function_tsb_ptr_calc
.global ext_trap_load_idata_in
.global ext_trap_load_ddata_in
.global ext_trap_load_idata_access
.global ext_trap_load_ddata_access
.global ext_trap_toggle_hwtw_demap
	
ext_trap_toggle_hwtw_demap:
	or	%g0, MMU_ASI_TSB_CONFIG_REG, %g1
	wr	%g1, 0x0, %asi
	or	%g0, 1, %g1
	sllx	%g1, 63, %g1
	ldxa	[MMU_ASI_Z_CTX_TSB_CONFIG_0_ADDR] %asi, %g2
	xor	%g2, %g1, %g2
	stxa	%g2, [MMU_ASI_Z_CTX_TSB_CONFIG_0_ADDR] %asi
	ldxa	[MMU_ASI_Z_CTX_TSB_CONFIG_1_ADDR] %asi, %g2
	xor	%g2, %g1, %g2
	stxa	%g2, [MMU_ASI_Z_CTX_TSB_CONFIG_1_ADDR] %asi
	ldxa	[MMU_ASI_Z_CTX_TSB_CONFIG_2_ADDR] %asi, %g2
	xor	%g2, %g1, %g2
	stxa	%g2, [MMU_ASI_Z_CTX_TSB_CONFIG_2_ADDR] %asi
	ldxa	[MMU_ASI_Z_CTX_TSB_CONFIG_3_ADDR] %asi, %g2
	xor	%g2, %g1, %g2
	stxa	%g2, [MMU_ASI_Z_CTX_TSB_CONFIG_3_ADDR] %asi
	ldxa	[MMU_ASI_NZ_CTX_TSB_CONFIG_0_ADDR] %asi, %g2
	xor	%g2, %g1, %g2
	stxa	%g2, [MMU_ASI_NZ_CTX_TSB_CONFIG_0_ADDR] %asi
	ldxa	[MMU_ASI_NZ_CTX_TSB_CONFIG_1_ADDR] %asi, %g2
	xor	%g2, %g1, %g2
	stxa	%g2, [MMU_ASI_NZ_CTX_TSB_CONFIG_1_ADDR] %asi
	ldxa	[MMU_ASI_NZ_CTX_TSB_CONFIG_2_ADDR] %asi, %g2
	xor	%g2, %g1, %g2
	stxa	%g2, [MMU_ASI_NZ_CTX_TSB_CONFIG_2_ADDR] %asi
	ldxa	[MMU_ASI_NZ_CTX_TSB_CONFIG_3_ADDR] %asi, %g2
	xor	%g2, %g1, %g2
	stxa	%g2, [MMU_ASI_NZ_CTX_TSB_CONFIG_3_ADDR] %asi
	andcc	%g2, 0x70, %g0
	be,a	%xcc, ext_trap_toggle_hwtw_no_demap
	nop
	! Demap all
	or	%g0, 0x0c0, %g3
	stxa	%g0, [%g3] MMU_ASI_I_DEMAP
	stxa	%g0, [%g3] MMU_ASI_D_DEMAP
ext_trap_toggle_hwtw_no_demap:	
	done

!****************************************************************************************
ext_trap_access_itsb_ptr:	
	! we use %l1 to determine which register to access
	srlx	%l1, 40, %g7
	and	%g7, 0x78, %g1
	cmp	%g1, 0x50
	bne,a	%xcc, ext_trap_access_itsb_ptr_58
	cmp	%g1, 0x58
	ldxa	[%g1] 0x54, %g2
	done
ext_trap_access_itsb_ptr_58:		
	bne,a	%xcc, ext_trap_access_itsb_ptr_60
	cmp	%g1, 0x60
	ldxa	[%g1] 0x54, %g2
	done
ext_trap_access_itsb_ptr_60:		
	bne,a	%xcc, ext_trap_access_itsb_ptr_68
	cmp	%g1, 0x68
	ldxa	[%g1] 0x54, %g2
	done
ext_trap_access_itsb_ptr_68:		
	bne,a	%xcc, ext_trap_access_itsb_ptr_all
	or	%g0, 0x50, %g1
	ldxa	[%g1] 0x54, %g2
	done
ext_trap_access_itsb_ptr_all:	
	ldxa	[%g1] 0x54, %g2
	or	%g0, 0x58, %g1
	ldxa	[%g1] 0x54, %g2
	or	%g0, 0x60, %g1
	ldxa	[%g1] 0x54, %g2
	or	%g0, 0x68, %g1
	ldxa	[%g1] 0x54, %g2
	done
		
!****************************************************************************************
ext_trap_access_dtsb_ptr:	
	! we use %l1 to determine which register to access
	srlx	%l1, 40, %g7
	and	%g7, 0x78, %g1
	cmp	%g1, 0x70
	bne,a	%xcc, ext_trap_access_dtsb_ptr_78
	cmp	%g1, 0x78
	ldxa	[%g1] 0x54, %g2
	done
ext_trap_access_dtsb_ptr_78:		
	bne,a	%xcc, ext_trap_access_dtsb_ptr_80
	cmp	%g1, 0x80
	ldxa	[%g1] 0x54, %g2
	done
ext_trap_access_dtsb_ptr_80:		
	bne,a	%xcc, ext_trap_access_dtsb_ptr_88
	cmp	%g1, 0x88
	ldxa	[%g1] 0x54, %g2
	done
ext_trap_access_dtsb_ptr_88:		
	bne,a	%xcc, ext_trap_access_dtsb_ptr_all
	or	%g0, 0x70, %g1
	ldxa	[%g1] 0x54, %g2
	done
ext_trap_access_dtsb_ptr_all:	
	ldxa	[%g1] 0x54, %g2
	or	%g0, 0x78, %g1
	ldxa	[%g1] 0x54, %g2
	or	%g0, 0x80, %g1
	ldxa	[%g1] 0x54, %g2
	or	%g0, 0x88, %g1
	ldxa	[%g1] 0x54, %g2
	done
		
!****************************************************************************************
ext_trap_sem_lock_begin:
	or	%i7, %g0, %g7		! save %i7
        wr      %g0, ASI_CORE_ID, %asi
        ldxa    [ASI_CORE_ID_VA] %asi, %g1	! %g1 = core id + tid
ext_trap_sem_lock_loop:
	or	%g0, 0x100, %i7
	or	%g0, %g1, %g2
        or	%g0, 0x0fff, %g3	! %g3 = compare value
	setx	sem_data, %g5, %g4	! %g4 = sem_data
	casxa	[%g4] 0x80, %g3, %g2
	cmp	%g2, 0x0fff
	bne,a	%xcc, ext_trap_sem_lock_loop
	ta	HPTRAP_DELAY_LOOP
	or	%g7, %g0, %i7		! restore %i7
	done

ext_trap_sem_release_begin:
        wr      %g0, ASI_CORE_ID, %asi
        ldxa    [ASI_CORE_ID_VA] %asi, %g1	! %g1 = core id + tid
        or	%g0, 0x0fff, %g3	! %g3 = compare value
	setx	sem_data, %g5, %g4	! %g4 = sem_data
	casxa	[%g4] 0x80, %g1, %g3
	done


!****************************************************************************************
ext_trap_0x2a_begin:	
	ta	HP_BAD_TRAP

!****************************************************************************************
ext_trap_0x2b_begin:
	ta	HP_BAD_TRAP
	
!****************************************************************************************
ext_trap_0x3e_begin:
	save	! Save %l2 and %l4 to be used in code below

	ldxa	[%g0] 0x50, %g1		! %g1 = immu tag target
	! Mask out context before comparing tags
	sethi	0x1fff, %g3
	sllx	%g3, 38, %g3
	andn	%g1, %g3, %g1		! %g1 = masked tag target
	!
	! Randomly pick zero or non-zero ctx to start with. We use context[0] as random seed
	! context[0] = 0 ==> zero ctx is picked first
	! context[0] = 1 ==> non-zero ctx is picked first
	!
	! The other consideration is we need to write the correct context (zero or non-zero)
	! to the tag access register in order to get the correct tsb pointer. If we pick the
	! zero context first, then we need to program the tag access register with a zero
	! context. Otherwise, we will program the tag access register with a non-zero context.
	!
	! Case 1: zero context is picked first
	!	We read tsb pointers for the four zero context tsb config regs.
	!	If no entry was found, we invert the context in tag access reg
	!	Now we read the four non-zero context tsb config regs
	! Case 2: non-zero context is picked first
	!	We invert the context in tag access reg
	!	Read tsb pointers for the four non-zero context tsb config regs
	!	If no entry was found, clear the context in tag access reg
	!	Read tsb pointers for the four zero context tsb config regs
	!
	setx	tsb_addresses_zero, %g2, %l4
	or	%g0, 0x30, %g5
	ldxa	[%g5] 0x50, %l2		! %l2 = tag access
	or	%g0, 0x1fff, %g4
	sllx	%g4, 13, %g4
	and	%l2, %g4, %l2		! %l2 = tag access with zero context
	! We use bit VA[28] as random selection between zero and non-zero context
	srlx	%l2, 28, %g4
	and	%g4, 1, %g3
	brz,a	%g3, trap_0x3e_zero_ctx
	nop
	add	%l4, 72, %l4		! %l4 = tsb_addresses_non_zero
	or	%l2, 1, %l2		! %l2 = tag access with non-zero context
	! %g1 = masked tag
trap_0x3e_zero_ctx:
	stxa	%l2, [%g5] 0x50		! update tag access with proper context
	ldx	[%l4], %g4		! %g4 = va to tsb config reg
	or	%g0, 0x50, %g2		! %g2 = va to tsb pointer 0
trap_0x3e_next_tte:	
	! %g1=masked tag, %g2=va to tsb ptr, %g4=va to tsb config
	ldxa	[%g2] 0x54, %g3		! %g3 = dtsb pointer
	ldda	[%g3] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6 = TTE_TAG, %g7 = TTE_DATA
	sethi	0x1fff, %g3
	sllx	%g3, 38, %g3
	andn	%g6, %g3, %g3		! %g3 has the masked tag
	! Need to mask out va[27:22] if page size is 5
	ldxa	[%g4] 0x54, %g5		! %g5 = TSB_CONFIG
	and	%g5, 0x70, %g4		! %g4 = PSIZE
	cmp	%g4, 0x50
	be,a	trap_0x3e_256m_page
	or	%g0, 0x3f, %l1
	or	%g0, 0, %l1
trap_0x3e_256m_page:
	! %g1=tag target, %g2=va to tsb ptr, %g3=masked tte tag
	! %g4=page size, %g5=tsb config reg	
	andn	%g1, %l1, %l1
	cmp	%g3, %l1
	bne,a	%xcc, trap_0x3e_next_tsb_ptr
	add	%g2, 8, %g2
	srlx	%g7, 63, %g3
	brz,a	%g3, trap_0x3e_next_tsb_ptr
	add	%g2, 8, %g2
	
	! check the ranotpa bit
	andcc	%g5, 0x100, %g0
	be,a	%xcc, trap_0x3e_skip_ra
	nop

	! look up realrange registers
	setx	trap_ra_mask, %g3, %g6
	cmp	%g4, 0x00
	be,a	trap_0x3e_get_rr_limits
	add	%g6, 48, %g6
	cmp	%g4, 0x10
	be,a	trap_0x3e_get_rr_limits
	add	%g6, 32, %g6
	cmp	%g4, 0x30
	be,a	trap_0x3e_get_rr_limits
	add	%g6, 16, %g6
trap_0x3e_get_rr_limits:
	ldda	[%g6] 0x24, %g2		! %g2 = RA_max mask, %g3 = RA_min mask
	sllx	%g7, 24, %g5
	srlx	%g5, 37, %g5
	sllx	%g5, 13, %g5		! %g5 = RA
	or	%g5, %g2, %g2		! %g2 = RA_max
	and	%g5, %g3, %g3		! %g3 = RA_min
		
	or	%g0, 0x108, %g1		! %g1 points to REAL_RANGE_REG
trap_0x3e_next_rr:
	cmp	%g1, 0x128
	bl,a	%xcc, trap_0x3e_get_rr
	ldxa	[%g1] 0x52, %g5		! %g5 = REAL_RANGE
	done				! Error
trap_0x3e_get_rr:	
	srlx	%g5, 63, %g6		! Check for the enable bit
	brz,a	%g6, trap_0x3e_next_rr
	add	%g1, 8, %g1
	
	sllx	%g5, 10, %g6		! %g6 = RR left shift by 10
	srlx	%g6, 37, %g6
	sllx	%g6, 13, %g6		! %g6 = RA_max
	cmp	%g6, %g2
	bl,a	%xcc, trap_0x3e_next_rr
	add	%g1, 8, %g1
	sllx	%g5, 37, %g6
	srlx	%g6, 24, %g6		! %g6 = RA_min
	cmp	%g6, %g3
	bg,a	%xcc, trap_0x3e_next_rr
	add	%g1, 8, %g1
	add	%g1, 0x100, %g1
	ldxa	[%g1] 0x52, %g1		! %g1 = physical offset
	add	%g7, %g1, %g7
		
trap_0x3e_skip_ra:
	or	%g0, 0x30, %g4
	or	%l2, 0x0ff, %l2	
	stxa	%l2, [%g4] 0x50		! write non-zero context to tag access
	or	%g0, 0x0400, %g5
	stxa	%g7, [%g5] 0x54		! write to data in
	! Set im bit
	ldxa	[%g0] 0x45, %g1
	or	%g1, 4, %g1
	stxa	%g1, [%g0] 0x45
	restore
	retry
	
trap_0x3e_next_tsb_ptr:
	cmp	%g2, 0x70
	bne,a	%xcc, trap_0x3e_next_tsb_va
	nop
	or	%g0, 0x50, %g2		! Need to wrap it back to 0x50 (itsb ptr 0)
	xor	%l2, 1, %l2
	or	%g0, 0x30, %g5
	stxa	%l2, [%g5] 0x50		! write inverted context to tag access
trap_0x3e_next_tsb_va:	
	add	%l4, 8, %l4		! go to next VA for tsb config reg
	ldx	[%l4], %g4
	cmp	%g4, 0x0ff		! we have exhausted all 8 regs if value is 0xff
	bne,a	%xcc, trap_0x3e_next_tte
	nop
	restore
	ta	HP_BAD_TRAP
		
!****************************************************************************************
ext_trap_0x3f_begin:
	save	! Save %l2 and %l4 to be used in code below

	ldxa	[%g0] 0x58, %g1		! %g1 = dmmu tag target
	! Mask out context before comparing tags
	sethi	0x1fff, %g3
	sllx	%g3, 38, %g3
	andn	%g1, %g3, %g1		! %g1 = masked tag target
	!
	! Randomly pick zero or non-zero ctx to start with. We use context[0] as random seed
	! context[0] = 0 ==> zero ctx is picked first
	! context[0] = 1 ==> non-zero ctx is picked first
	!
	! The other consideration is we need to write the correct context (zero or non-zero)
	! to the tag access register in order to get the correct tsb pointer. For a real miss
	! the context is zero in the tag access register.
	!
	! Case 1: zero context is picked first
	!	We read tsb pointers for the four zero context tsb config regs.
	!	If no entry was found, we invert the context in tag access reg
	!	Now we read the four non-zero context tsb config regs
	! Case 2: non-zero context is picked first
	!	We invert the context in tag access reg
	!	Read tsb pointers for the four non-zero context tsb config regs
	!	If no entry was found, clear the context in tag access reg
	!	Read tsb pointers for the four zero context tsb config regs
	!
	setx	tsb_addresses_zero, %g2, %l4
	or	%g0, 0x30, %g5
	ldxa	[%g5] 0x58, %l2		! %l2 = tag access
	or	%g0, 0x1fff, %g4
	sllx	%g4, 13, %g4
	and	%l2, %g4, %l2		! %l2 = tag access with zero context
	! We use bit VA[28] as random selection between zero and non-zero context
	srlx	%l2, 28, %g4
	and	%g4, 1, %g3
	brz,a	%g3, trap_0x3f_zero_ctx
	nop
	add	%l4, 72, %l4		! %l4 = tsb_addresses_non_zero
	or	%l2, 1, %l2
	! %g1 = masked tag
trap_0x3f_zero_ctx:
	stxa	%l2, [%g5] 0x58		! update tag access with proper context
	ldx	[%l4], %g4		! %g4 = va to tsb config reg
	or	%g0, 0x70, %g2		! %g2 = va to tsb pointer 0
trap_0x3f_next_tte:	
	! %g1=masked tag, %g2=va to tsb ptr, %g4=va to tsb config
	ldxa	[%g2] 0x54, %g3		! %g3 = dtsb pointer
	ldda	[%g3] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6 = TTE_TAG, %g7 = TTE_DATA
	sethi	0x1fff, %g3
	sllx	%g3, 38, %g3
	andn	%g6, %g3, %g3		! %g3 has the tte tag with zero context
	! Need to mask out va[27:22] if page size is 5
	ldxa	[%g4] 0x54, %g5		! %g5 = TSB_CONFIG
	and	%g5, 0x70, %g4		! %g4 = PSIZE
	cmp	%g4, 0x50
	be,a	trap_0x3f_256m_page
	or	%g0, 0x3f, %l1
	or	%g0, 0, %l1
trap_0x3f_256m_page:
	! %g1=tag target, %g2=va to tsb ptr, %g3=masked tte tag
	! %g4=page size, %g5=tsb config reg	
	andn	%g1, %l1, %l1
	cmp	%g3, %l1
	bne,a	%xcc, trap_0x3f_next_tsb_ptr
	add	%g2, 8, %g2
	srlx	%g7, 63, %g3
	brz,a	%g3, trap_0x3f_next_tsb_ptr
	add	%g2, 8, %g2
	
	! check the ranotpa bit
	andcc	%g5, 0x100, %g0
	be,a	%xcc, trap_0x3f_skip_ra
	nop

	! look up realrange registers
	setx	trap_ra_mask, %g3, %g6
	cmp	%g4, 0x00
	be,a	trap_0x3f_get_rr_limits
	add	%g6, 48, %g6
	cmp	%g4, 0x10
	be,a	trap_0x3f_get_rr_limits
	add	%g6, 32, %g6
	cmp	%g4, 0x30
	be,a	trap_0x3f_get_rr_limits
	add	%g6, 16, %g6
trap_0x3f_get_rr_limits:
	ldda	[%g6] 0x24, %g2		! %g2 = RA_max mask, %g3 = RA_min mask
	sllx	%g7, 24, %g5
	srlx	%g5, 37, %g5
	sllx	%g5, 13, %g5		! %g5 = RA
	or	%g5, %g2, %g2		! %g2 = RA_max
	and	%g5, %g3, %g3		! %g3 = RA_min
		
	or	%g0, 0x108, %g1		! %g1 points to REAL_RANGE_REG
trap_0x3f_next_rr:
	cmp	%g1, 0x128
	bl,a	%xcc, trap_0x3f_get_rr
	ldxa	[%g1] 0x52, %g5		! %g5 = REAL_RANGE
	done				! Error
trap_0x3f_get_rr:	
	srlx	%g5, 63, %g6		! Check for the enable bit
	brz,a	%g6, trap_0x3f_next_rr
	add	%g1, 8, %g1
	
	sllx	%g5, 10, %g6		! %g6 = RR left shift by 10
	srlx	%g6, 37, %g6
	sllx	%g6, 13, %g6		! %g6 = RA_max
	cmp	%g6, %g2
	bl,a	%xcc, trap_0x3f_next_rr
	add	%g1, 8, %g1
	sllx	%g5, 37, %g6
	srlx	%g6, 24, %g6		! %g6 = RA_min
	cmp	%g6, %g3
	bg,a	%xcc, trap_0x3f_next_rr
	add	%g1, 8, %g1
	add	%g1, 0x100, %g1
	ldxa	[%g1] 0x52, %g1		! %g1 = physical offset
	add	%g7, %g1, %g7
		
trap_0x3f_skip_ra:
	or	%g0, 0x30, %g4
	or	%l2, 0x0ff, %l2	
	stxa	%l2, [%g4] 0x58		! write non-zero context to tag access
	or	%g0, 0x0400, %g5
	stxa	%g7, [%g5] 0x5c		! write to data in
	! Set dm bit
	ldxa	[%g0] 0x45, %g1
	or	%g1, 8, %g1
	stxa	%g1, [%g0] 0x45
	restore
	retry
	
trap_0x3f_next_tsb_ptr:
	cmp	%g2, 0x90
	bne,a	%xcc, trap_0x3f_next_tsb_va
	nop
	or	%g0, 0x70, %g2		! Need to wrap it back to 0x70 (dtsb ptr 0)
	xor	%l2, 1, %l2
	or	%g0, 0x30, %g5
	stxa	%l2, [%g5] 0x58		! write inverted context to tag access
trap_0x3f_next_tsb_va:	
	add	%l4, 8, %l4		! go to next VA for tsb config reg
	ldx	[%l4], %g4
	cmp	%g4, 0x0ff		! we have exhausted all 8 regs if value is 0xff
	bne,a	%xcc, trap_0x3f_next_tte
	nop
	restore
	! Instead of going to bad trap, we just go ahead and skip this ld/st instruction
	!ta	HP_BAD_TRAP
	done
	
!****************************************************************************************
ext_trap_0x64_begin:
	save
	ldxa	[%g0] MMU_ASI_ITSB_TAG_TARGET_REG, %g1	! %g1 = tag target     
	or	%g0, MMU_ASI_ITSB_PTR_0_ADDR, %g2	! %g2 = tsb ptr addr
	srlx	%g1, 48, %g3				! %g3 = req_ctx
	brz,a	%g3, trap_0x64_load_tsb_config
	or	%g0, MMU_ASI_Z_CTX_TSB_CONFIG_0_ADDR, %g3
	or	%g0, MMU_ASI_NZ_CTX_TSB_CONFIG_0_ADDR, %g3
trap_0x64_load_tsb_config:	
	ldxa	[%g3] MMU_ASI_TSB_CONFIG_REG, %g4	! %g4 = tsb config
	stxa	%g4, [%g0] MMU_ASI_HYP_SCRATCHPAD_REG
	ldxa	[%g2] MMU_ASI_TSB_PTR_REG, %g5		! %g5 = tsb ptr 
trap_0x64_load_tte:	
	ldda	[%g5] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6=TTE_TAG, %g7=TTE_DATA
	! If page size is 256m, mask out va[27:22]
	ldxa	[%g3] MMU_ASI_TSB_CONFIG_REG, %g4	! %g4 = tsb config
	and	%g4, 0x70, %g4
	cmp	%g4, 0x50
	bne,a	%xcc, trap_0x64_not_256m_page
	or	%g0, %g1, %o1
	and	%g1, 0x1fc0, %o1
	and	%g6, 0x1fc0, %g6
trap_0x64_not_256m_page:	
	cmp	%g6, %o1		! Compare TAG
	bne,a	%xcc, trap_0x64_next_ptr
	add	%g2, 8, %g2
	srlx	%g7, 63, %g5		! Check Valid bit
	brz,a	%g5, trap_0x64_next_ptr
	add	%g2, 8, %g2
	! At this point, we have got the TTE to be loaded into the TLB.
	! We just need to figure out what physical offset to use.
	! Register %g4 and %g7 are restricted.
	setx	trap_ra_mask, %g5, %g6
	ldxa	[%g0] 0x4f, %g5		! %g5 = TSB_CONFIG
	and	%g5, 0x100, %g3		! %g3 has the ranotpa bit
	brz,a	%g3, trap_0x64_skip_ra
	nop
	and	%g5, 0x70, %g3		! %g3 = PSIZE
	cmp	%g3, 0x00
	be,a	trap_0x64_get_rr_limits
	add	%g6, 48, %g6
	cmp	%g3, 0x10
	be,a	trap_0x64_get_rr_limits
	add	%g6, 32, %g6
	cmp	%g3, 0x30
	be,a	trap_0x64_get_rr_limits
	add	%g6, 16, %g6
trap_0x64_get_rr_limits:
	ldda	[%g6] 0x24, %g2		! %g2 = RA_max mask, %g3 = RA_min mask
	sllx	%g7, 24, %g5
	srlx	%g5, 37, %g5
	sllx	%g5, 13, %g5		! %g5 = RA
	or	%g5, %g2, %g2		! %g2 = RA_max
	and	%g5, %g3, %g3		! %g3 = RA_min
		
	or	%g0, 0x108, %g1		! %g1 points to REAL_RANGE_REG
trap_0x64_next_rr:
	cmp	%g1, 0x128
	bl,a	%xcc, trap_0x64_get_rr
	ldxa	[%g1] 0x52, %g5		! %g5 = REAL_RANGE
	done				! Error
trap_0x64_get_rr:	
	srlx	%g5, 63, %g6		! Check for the enable bit
	brz,a	%g6, trap_0x64_next_rr
	add	%g1, 8, %g1
	
	sllx	%g5, 10, %g6		! %g6 = RR left shift by 10
	srlx	%g6, 37, %g6
	sllx	%g6, 13, %g6		! %g6 = RA_max
	cmp	%g6, %g2
	bl,a	%xcc, trap_0x64_next_rr
	add	%g1, 8, %g1
	sllx	%g5, 37, %g6
	srlx	%g6, 24, %g6		! %g6 = RA_min
	cmp	%g6, %g3
	bg,a	%xcc, trap_0x64_next_rr
	add	%g1, 8, %g1
	add	%g1, 0x100, %g1
	ldxa	[%g1] 0x52, %g1		! %g1 = physical offset
	add	%g7, %g1, %g7
trap_0x64_skip_ra:
	!
	! To prevent multiple hits as a result of loading the itlb with entries with
	! different contexts, we need to look at the use_context bits in the TSB config.
	! The pseudo algorithm is
	!
	! We are assuming the context in the tte is the primary context 0
	!
	! if (not nucleus context) {
	!	if (use_ctx_1 == 1) {
	!		get pctx_1
	!		store pctx_1 in tag_access reg
	!	}
	! }
	!
	ldxa	[%g0] 0x50, %l1		! %l1 = itlb tag target
	srlx	%l1, 48, %l1		! %l1 = req_ctx
	brz,a	%l1, trap_0x64_not_ctx_1
	nop
	ldxa	[%g0] 0x4f, %g5		! %g5 = TSB_CONFIG
	srlx	%g5, 61, %g5
	and	%g5, 3, %g5
	cmp	%g5, 1
	bne,a	%xcc, trap_0x64_not_ctx_1
	nop
	or	%g0, 0x30, %l1
	ldxa	[%l1] 0x50, %l1		! %l1 = itlb tag access
	sub	%g0, 1, %l0
	srlx	%l0, 51, %l0		! %l0 = context mask
	andn	%l1, %l0, %l1		! %l1 = tag access with zero context
	or	%g0, 0x108, %l2
	ldxa	[%l2] 0x21, %l2		! %l2 = pctx_1
	or	%l1, %l2, %l1		! %l1 = tag access with pctx_1
	or	%g0, 0x30, %l3
	stxa	%l1, [%l3] 0x50		! update tag access with pctx_1
trap_0x64_not_ctx_1:	
	stxa	%g7, [%g0] MMU_ASI_I_DATA_IN_REG
	restore
	retry

trap_0x64_next_ptr:
	cmp	%g2, 0x70
	bl,a	%xcc, trap_0x64_load_tsb_config
	add	%g3, 8, %g3
#ifdef MMU247
	setx	ext_trap_0x8_begin, %g2, %g1
	jmp	%g1
	nop
#else
	ta	HP_BAD_TRAP
#endif
			
!****************************************************************************************
ext_trap_0x68_begin:
	save
	ldxa	[%g0] MMU_ASI_DTSB_TAG_TARGET_REG, %g1	! %g1 = dmmu_tag_target
	or	%g0, MMU_ASI_DTSB_PTR_0_ADDR, %g2	! %g2 points to dtsb_ptr_0
	srlx	%g1, 48, %g3				! %g3 = incoming ctx
	brz,a	%g3, trap_0x68_load_tsb_config
	or	%g0, MMU_ASI_Z_CTX_TSB_CONFIG_0_ADDR, %g3
	or	%g0, MMU_ASI_NZ_CTX_TSB_CONFIG_0_ADDR, %g3
trap_0x68_load_tsb_config:	
	ldxa	[%g3] MMU_ASI_TSB_CONFIG_REG, %g4	! %g4 = tsb_config
	stxa	%g4, [%g0] MMU_ASI_HYP_SCRATCHPAD_REG	! save tsb_config in scratch pad
	ldxa	[%g2] MMU_ASI_TSB_PTR_REG, %g5		! %g5 = dtsb_ptr
trap_0x68_load_tte:	
	ldda	[%g5] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6=TTE_TAG, %g7=TTE_DATA
	srlx	%g7, 63, %g5				! Check Valid bit
	brz,a	%g5, trap_0x68_next_ptr
	add	%g2, 8, %g2
	!
	! Need to check for context right here
	! if (! nucleus) {
	!	case (req_ctx == pctx0 && use_ctx_0 == 1):	
	!		update_tag_access_with_pctx0
	!	case (req_ctx == pctx0 && use_ctx_0 == 0 && use_ctx_1 == 1):	
	!		update_tag_access_with_pctx1
	!	case (req_ctx == sctx0 && use_ctx_0 == 1):	
	!		update_tag_access_with_sctx0
	!	case (req_ctx == sctx0 && use_ctx_0 == 0 && use_ctx_1 == 1):	
	!		update_tag_access_with_sctx1
	! }
	!
	ldxa	[%g0] MMU_ASI_DTSB_TAG_TARGET_REG, %i0	! %i0 = dtlb tag target
	srlx	%i0, 48, %i1		! %i1 = req_ctx
	brz,a	%i1, trap_0x68_bypass_update_tag_access
	nop
	!
	! the req_ctx is non-zero, we need to look at the use_context bits next
	!
	ldxa	[%g0] MMU_ASI_HYP_SCRATCHPAD_REG, %i2		! %i2 = tsb config
	srlx	%i2, 61, %i2
	andcc	%i2, 3, %i2
	be,a	%xcc, trap_0x68_bypass_update_tag_access
	nop
	andcc	%i2, 2, %g0
	be,a	%xcc, trap_0x68_not_use_ctx_0
	nop
	!
	! use_context_0 = 1
	!
	or	%g0, MMU_ASI_PRIMARY_CONTEXT_0_ADDR, %i0
	ldxa	[%i0] MMU_ASI_CONTEXT_REG, %i3
	cmp	%i3, %i1
	be,a	%xcc, trap_0x68_update_tag_access
	nop
	or	%g0, MMU_ASI_SECONDARY_CONTEXT_0_ADDR, %i0
	ldxa	[%i0] MMU_ASI_CONTEXT_REG, %i3
	ba	trap_0x68_update_tag_access
	nop	
trap_0x68_not_use_ctx_0:
	!
	! use_context_0 = 0 && use_context_1 = 1
	!
	or	%g0, MMU_ASI_PRIMARY_CONTEXT_0_ADDR, %i0
	ldxa	[%i0] MMU_ASI_CONTEXT_REG, %i3
	cmp	%i3, %i1
	bne,a	%xcc, trap_0x68_secondary_ctx
	nop
	or	%g0, MMU_ASI_PRIMARY_CONTEXT_1_ADDR, %i0
	ldxa	[%i0] MMU_ASI_CONTEXT_REG, %i3
	ba	trap_0x68_update_tag_access
	nop	
trap_0x68_secondary_ctx:		
	or	%g0, MMU_ASI_SECONDARY_CONTEXT_1_ADDR, %i0
	ldxa	[%i0] MMU_ASI_CONTEXT_REG, %i3
trap_0x68_update_tag_access:
	!
	! %i3 has the new context
	! we also need to mask out the context in the tte_tag (%g6)
	!
	sllx	%g1, 16, %g1
	srlx	%g1, 16, %g1		! %g1 = expected tag target with masked context
	sllx	%g6, 16, %g6
	srlx	%g6, 16, %g6		! %g6 = actual tag target with masked context
	or	%g0, MMU_ASI_D_TAG_ACCESS_ADDR, %i0
	ldxa	[%i0] MMU_ASI_D_TAG_ACCESS_REG, %i0
	srlx	%i0, 13, %i0
	sllx	%i0, 13, %i0
	or	%i0, %i3, %i3		! %i3 = tag access with updated context
	or	%g0, MMU_ASI_D_TAG_ACCESS_ADDR, %i0
	stxa	%i3, [%i0] MMU_ASI_D_TAG_ACCESS_REG
trap_0x68_bypass_update_tag_access:
	!
	! If page size is 256m, mask out va[27:22]
	!
	ldxa	[%g0] MMU_ASI_HYP_SCRATCHPAD_REG, %g4		! %g4 = TSB_CONFIG
	and	%g4, 0x70, %g4
	cmp	%g4, 0x50
	bne,a	%xcc, trap_0x68_not_256m_page
	or	%g0, %g1, %o1
	and	%g1, 0x1fc0, %o1
	and	%g6, 0x1fc0, %g6
trap_0x68_not_256m_page:	
	cmp	%g6, %o1		! Compare TAG
	bne,a	%xcc, trap_0x68_next_ptr
	add	%g2, 8, %g2
	!
	! At this point, we have got the TTE to be loaded into the TLB.
	! We just need to figure out what physical offset to use.
	! Register %g4 and %g7 are restricted.
	!
	setx	trap_ra_mask, %g5, %g6
	ldxa	[%g0] MMU_ASI_HYP_SCRATCHPAD_REG, %g5		! %g5 = TSB_CONFIG
	and	%g5, 0x100, %g3					! %g3 has the ranotpa bit
	brz,a	%g3, trap_0x68_skip_ra
	nop
	and	%g5, 0x70, %g3					! %g3 = PSIZE
	cmp	%g3, 0x00
	be,a	trap_0x68_get_rr_limits
	add	%g6, 48, %g6
	cmp	%g3, 0x10
	be,a	trap_0x68_get_rr_limits
	add	%g6, 32, %g6
	cmp	%g3, 0x30
	be,a	trap_0x68_get_rr_limits
	add	%g6, 16, %g6
trap_0x68_get_rr_limits:
	ldda	[%g6] 0x24, %g2		! %g2 = RA_max mask, %g3 = RA_min mask
	sllx	%g7, 24, %g5
	srlx	%g5, 37, %g5
	sllx	%g5, 13, %g5		! %g5 = RA
	or	%g5, %g2, %g2		! %g2 = RA_max
	and	%g5, %g3, %g3		! %g3 = RA_min
		
	or	%g0, MMU_ASI_REAL_RANGE_0_ADDR, %g1	! %g1 points to REAL_RANGE_REG
trap_0x68_next_rr:
	cmp	%g1, 0x128
	bl,a	%xcc, trap_0x68_get_rr
	ldxa	[%g1] MMU_ASI_REAL_RANGE_REG, %g5	! %g5 = REAL_RANGE
	done
trap_0x68_get_rr:	
	srlx	%g5, 63, %g6
	brz,a	%g6, trap_0x68_next_rr
	add	%g1, 8, %g1
	
	sllx	%g5, 10, %g6		! %g6 = RR left shift by 10
	srlx	%g6, 37, %g6
	sllx	%g6, 13, %g6		! %g6 = RA_hi
	cmp	%g6, %g2
	bl,a	%xcc, trap_0x68_next_rr
	add	%g1, 8, %g1
	sllx	%g5, 37, %g6
	srlx	%g6, 24, %g6		! %g6 = RA_lo
	cmp	%g6, %g3
	bg,a	%xcc, trap_0x68_next_rr
	add	%g1, 8, %g1
	add	%g1, 0x100, %g1
	ldxa	[%g1] MMU_ASI_PHY_OFFSET_REG, %g1		! %g1 = physical offset
	add	%g7, %g1, %g7
trap_0x68_skip_ra:	
	stxa	%g7, [%g0] MMU_ASI_D_DATA_IN_REG
	restore
	retry

trap_0x68_next_ptr:
	cmp	%g2, 0x90
	bl,a	%xcc, trap_0x68_load_tsb_config
	add	%g3, 8, %g3
#ifdef MMU247
	done
#else
	ta	HP_BAD_TRAP
#endif
	
#ifdef MMU247	
/*************************************************************************/
ext_trap_load_idata_in:
	!
	! %i1[43:40] = count, %i7[11:0] = random offset
	!
	setx	hptrap_itte_end, %g1, %g2	! %g2 = pointer to count
	ldx	[%g2], %g3		! %g3 = max count
	umul	%g3, 16, %g1		! %g1 = length
	sub	%g2, %g1, %g1		! %g1 = pointer to first entry
	srlx	%i1, 40, %g3
	and	%g3, 0xf, %g3		! %g3 = count
	brz,a	%g3, load_idata_set_count
	or	%g0, 1, %g3
load_idata_set_count:	
	and	%i7, 0x0fff, %i7	! %i7 = random offset
	umul	%i7, 16, %i7
	add	%g1, %i7, %i7		! %i7 = pointer to random entry
	!
	! %g1 = begin marker
	! %g2 = end marker
	! %g3 = number of entries to preload
	! %i7 = pointer to random entry
	!
load_idata_in_next:	
	ldda	[%i7] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6 = tag access, %g7 = data
	or	%g0, 0x30, %g4
	stxa	%g6, [%g4] MMU_ASI_I_TAG_ACCESS_REG	! write to tag access
	stxa	%g7, [%g0] MMU_ASI_I_DATA_IN_REG	! write to data in
	add	%i7, 112, %i7		! skip 7 entries
	cmp	%i7, %g2
	bcs,a	%xcc, load_idata_in_no_wrap
	nop
	sub	%i7, %g2, %i7
	add	%g1, %i7, %i7		! wrap %i7
load_idata_in_no_wrap:
	sub	%g3, 1, %g3
	brnz,a	%g3, load_idata_in_next
	nop
	done
	
/*************************************************************************/
ext_trap_load_ddata_in:
	!
	! %i1[43:40] = count, %i7[11:0] = random offset
	!
	setx	hptrap_dtte_end, %g1, %g2	! %g2 = pointer to count
	ldx	[%g2], %g3		! %g3 = max count
	umul	%g3, 16, %g1		! %g1 = length
	sub	%g2, %g1, %g1		! %g1 = pointer to first entry
	srlx	%i1, 40, %g3
	and	%g3, 0xf, %g3		! %g3 = count
	brz,a	%g3, load_ddata_set_count
	or	%g0, 1, %g3
load_ddata_set_count:	
	and	%i7, 0x0fff, %i7	! %i7 = random offset
	umul	%i7, 16, %i7
	add	%g1, %i7, %i7		! %i7 = pointer to random entry
	!
	! %g1 = begin marker
	! %g2 = end marker
	! %g3 = number of entries to preload
	! %i7 = pointer to random entry
	!
load_ddata_in_next:	
	ldda	[%i7] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6 = tag access, %g7 = data
	or	%g0, 0x30, %g4
	stxa	%g6, [%g4] MMU_ASI_D_TAG_ACCESS_REG	! write to tag access
	stxa	%g7, [%g0] MMU_ASI_D_DATA_IN_REG	! write to data in
	add	%i7, 112, %i7		! skip 7 entries
	cmp	%i7, %g2
	bcs,a	%xcc, load_ddata_in_no_wrap
	nop
	sub	%i7, %g2, %i7
	add	%g1, %i7, %i7		! wrap %i7
load_ddata_in_no_wrap:
	sub	%g3, 1, %g3
	brnz,a	%g3, load_ddata_in_next
	nop
	done
	
/*************************************************************************/
ext_trap_load_idata_access:
	!
	! %i7[9:3] = index , %i7[2:0] = count, %i7[11:0] = random offset
	!
	setx	hptrap_itte_end, %g1, %g2	! %g2 = pointer to count
	ldx	[%g2], %g3		! %g3 = max count
	umul	%g3, 16, %g1		! %g1 = length
	sub	%g2, %g1, %g1		! %g1 = pointer to first entry
	and	%i7, 0x7, %g3		! %g3 = count
	brz,a	%g3, load_idata_access_set_count
	or	%g0, 1, %g3
load_idata_access_set_count:	
	and	%i7, 0x05f8, %g5	! %g5 = Real + index
	umul	%i7, 16, %i7
	add	%g1, %i7, %i7		! %i7 = pointer to random entry
	!
	! %g1 = begin marker
	! %g2 = end marker
	! %g3 = number of entries to preload
	! %g5 = index
	! %i7 = pointer to random entry
	!
load_idata_access_next:	
	ldda	[%i7] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6 = tag access, %g7 = data
	or	%g0, 0x30, %g4
	stxa	%g6, [%g4] MMU_ASI_I_TAG_ACCESS_REG	! write to tag access
	stxa	%g7, [%g5] MMU_ASI_I_DATA_ACCESS_REG	! write to data access
	add	%i7, 112, %i7		! skip 7 entries
	cmp	%i7, %g2
	bcs,a	%xcc, load_idata_access_no_wrap
	nop
	sub	%i7, %g2, %i7
	add	%g1, %i7, %i7		! wrap %i7
load_idata_access_no_wrap:
	add	%g5, 0x18, %g5		! increment index by 3
	and	%g5, 0x5f8, %g5
	sub	%g3, 1, %g3
	brnz,a	%g3, load_idata_access_next
	nop
	done
	
/*************************************************************************/
ext_trap_load_ddata_access:
	!
	! %i7[9:3] = index , %i7[2:0] = count, %i7[11:0] = random offset
	!
	setx	hptrap_itte_end, %g1, %g2	! %g2 = pointer to count
	ldx	[%g2], %g3		! %g3 = max count
	umul	%g3, 16, %g1		! %g1 = length
	sub	%g2, %g1, %g1		! %g1 = pointer to first entry
	and	%i7, 0x7, %g3		! %g3 = count
	brz,a	%g3, load_ddata_access_set_count
	or	%g0, 1, %g3
load_ddata_access_set_count:	
	and	%i7, 0x07f8, %g5	! %g5 = Real + index
	umul	%i7, 16, %i7
	add	%g1, %i7, %i7		! %i7 = pointer to random entry
	!
	! %g1 = begin marker
	! %g2 = end marker
	! %g3 = number of entries to preload
	! %g5 = index
	! %i7 = pointer to random entry
	!
load_ddata_access_next:	
	ldda	[%i7] ASI_NUCLEUS_QUAD_LDD, %g6	! %g6 = tag access, %g7 = data
	or	%g0, 0x30, %g4
	stxa	%g6, [%g4] MMU_ASI_D_TAG_ACCESS_REG	! write to tag access
	stxa	%g7, [%g5] MMU_ASI_D_DATA_ACCESS_REG	! write to data access
	add	%i7, 112, %i7		! skip 7 entries
	cmp	%i7, %g2
	bcs,a	%xcc, load_ddata_access_no_wrap
	nop
	sub	%i7, %g2, %i7
	add	%g1, %i7, %i7		! wrap %i7
load_ddata_access_no_wrap:
	add	%g5, 0x18, %g5		! increment index by 3
	and	%g5, 0x7f8, %g5
	sub	%g3, 1, %g3
	brnz,a	%g3, load_ddata_access_next
	nop
	done

!****************************************************************************************
! This handler processes the exception based on tid. For each thread, a pointer to a new
! code page is used to provide the target of the return address from the done.
ext_trap_0x8_begin:
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %g1
	and     %g1, 7, %g1         ! %g1 = tid
	cmp	%g1, 0
	bne,a	%xcc, ext_trap_0x8_check_tid1
	cmp	%g1, 1
	setx	hptrap_user_code_ptrs_0_begin, %g3, %g2
	ba	ext_trap_0x8_get_ucptr
	nop
ext_trap_0x8_check_tid1:
	bne,a	%xcc, ext_trap_0x8_check_tid2
	cmp	%g1, 2
	setx	hptrap_user_code_ptrs_1_begin, %g3, %g2
	ba	ext_trap_0x8_get_ucptr
	nop
ext_trap_0x8_check_tid2:
	bne,a	%xcc, ext_trap_0x8_check_tid3
	cmp	%g1, 3
	setx	hptrap_user_code_ptrs_2_begin, %g3, %g2
	ba	ext_trap_0x8_get_ucptr
	nop
ext_trap_0x8_check_tid3:
	bne,a	%xcc, ext_trap_0x8_check_tid4
	cmp	%g1, 4
	setx	hptrap_user_code_ptrs_3_begin, %g3, %g2
	ba	ext_trap_0x8_get_ucptr
	nop
ext_trap_0x8_check_tid4:
	bne,a	%xcc, ext_trap_0x8_check_tid5
	cmp	%g1, 5
	setx	hptrap_user_code_ptrs_4_begin, %g3, %g2
	ba	ext_trap_0x8_get_ucptr
	nop
ext_trap_0x8_check_tid5:
	bne,a	%xcc, ext_trap_0x8_check_tid6
	cmp	%g1, 6
	setx	hptrap_user_code_ptrs_5_begin, %g3, %g2
	ba	ext_trap_0x8_get_ucptr
	nop
ext_trap_0x8_check_tid6:
	bne,a	%xcc, ext_trap_0x8_check_tid7
	nop
	setx	hptrap_user_code_ptrs_6_begin, %g3, %g2
	ba	ext_trap_0x8_get_ucptr
	nop
ext_trap_0x8_check_tid7:
	setx	hptrap_user_code_ptrs_7_begin, %g3, %g2
ext_trap_0x8_get_ucptr:
	ldx	[%g2], %g3	! %g3 = offset to new pointer set
	add	%g2, %g3, %g3	! %g3 = pointer to next pointer set
	ldx	[%g3], %g4	! %g4 = pointer to new code
	cmp	%g4, 8
	bne,a	%xcc, ext_trap_0x8_no_wrap_around
	nop
	add	%g2, 8, %g3
	ldx	[%g3], %g4	! %g4 = pointer to new code	
ext_trap_0x8_no_wrap_around:	
	ldx	[%g3 + 8], %g5	! %g5 = new offset
	stx	%g5, [%g2]	! save next offset
	! We are returning to the top of the page except for the first code section
	! This prevents re-initializing loop counter
	!add	%g4, 32, %g4
	wrpr	%g4, %tnpc
	done

/*************************************************************************/
.align	32
ext_trap_0x9_begin:
	setx	ext_trap_0x9_cnt, %g1, %g2
	ldx	[%g2], %g1
	addcc	%g1, 1, %g1
	cmp	%g1, MAX_TRAP_COUNT
	bl,a	%xcc, ext_trap_0x9_continue
	stx	%g1, [%g2]
	ta	HP_BAD_TRAP
ext_trap_0x9_cnt:
	.xword	0
ext_trap_0x9_continue:
	setx	ext_trap_0x8_begin, %g2, %g1
	jmp	%g1
	nop
	ta	HP_BAD_TRAP

/*************************************************************************/
ext_trap_0x1b_begin:
	/* Get TID */
	wr      %g0, ASI_CORE_ID, %asi
	ldxa    [ASI_CORE_ID_VA] %asi, %l7
	set     0x7, %g1
	and     %l7, %g1, %l7         ! %l7 has TID
	setx	Thr0_trap_occurence_cnt_begin, %g2, %g1
	or	%g0, NUM_IMPL_TRAPS, %g3
	umul	%g3, 4, %g2
	umul	%l7, %g2, %g2	! %g2 points to thread offset
	add	%g1, %g2, %g1	! %g1 points to thread
	add	%g1, TRAP_0x1B_OFFSET, %g1	! %g1 points to trap 0x1b occurence count
	lduw	[%g1], %g2
	add	%g2, 1, %g2
	or	%g0, MAX_OCCURENCE_CNT, %g4
	cmp	%g2, %g4
	bge	%xcc, clear_occurence_cnt
	nop
	stw	%g2, [%g1]
	done

/*************************************************************************/
.align	32
ext_trap_0x31_begin:
	setx	ext_trap_0x31_cnt, %g1, %g2
	ldx	[%g2], %g1
	addcc	%g1, 1, %g1
	cmp	%g1, MAX_TRAP_COUNT
	bl,a	%xcc, ext_trap_0x31_continue
	stx	%g1, [%g2]
	ta	HP_BAD_TRAP
ext_trap_0x31_cnt:
	.xword	0
ext_trap_0x31_continue:
	done

/*************************************************************************/
clear_occurence_cnt:
	stw	%g0, [%g1]
	add	%g1, 4, %g1
	sub	%g3, 1, %g3
	brnz	%g3, clear_occurence_cnt
	nop
	/* %l7 has TID */
	setx	Thr0_register_initial_values, %i6, %i7
	umul	%l7, 240, %i6
	add	%i7, %i6, %i7	! %i7 points to register values
restore_registers:
	wrpr	0, %g0, %gl     
	ldx	[%i7 + 0x10], %g2
	ldx	[%i7 + 0x00], %g3
	ldx	[%i7 + 0x08], %g4
	ldx	[%i7 + 0x10], %g5
	ldx	[%i7 + 0x18], %g6
	ldx	[%i7 + 0x20], %g7
	ldx	[%i7 + 0x28], %o0
	ldx	[%i7 + 0x30], %o1
	ldx	[%i7 + 0x38], %o2
	ldx	[%i7 + 0x40], %o3
	ldx	[%i7 + 0x48], %o4
	ldx	[%i7 + 0x50], %o5
	ldx	[%i7 + 0x58], %o6
	ldx	[%i7 + 0x60], %o7
	ldx	[%i7 + 0x68], %l0
	ldx	[%i7 + 0x70], %l1
	ldx	[%i7 + 0x78], %l2
	ldx	[%i7 + 0x80], %l3
	ldx	[%i7 + 0x88], %l4
	ldx	[%i7 + 0x90], %l5
	ldx	[%i7 + 0x98], %l6
	ldx	[%i7 + 0xa0], %l7
	ldx	[%i7 + 0xa8], %i0
	ldx	[%i7 + 0xb0], %i1
	ldx	[%i7 + 0xb8], %i2
	ldx	[%i7 + 0xc0], %i3
	ldx	[%i7 + 0xc8], %i4
	ldx	[%i7 + 0xd0], %i5
	ldx	[%i7 + 0xd8], %i6
	ldx	[%i7 + 0xe0], %i7
	done

#endif

function_tsb_ptr_calc:	
	! %g1 = VA
	! %g2 = TSB CONFIG REG
	! %i6 + 8 = return address
	! %i7 = TSB pointer
	and	%g2, 0x0f, %g3	! %g3 = TSB size
	umul	%g3, 8, %g3
	setx	tsb_base_mask, %g4, %g5
	ldx	[%g5+%g3], %g4  ! %g4 = tsb mask
	and	%g2, %g4, %i7   ! %i7 = TSB base
	and	%g2, 0x70, %g4
	srlx	%g4, 4, %g4     ! %g4 = page size
	setx	tsb_va_8k_mask, %g5, %g6
	brnz,a	%g4, test_page_1
	add	%g6, 0x80, %g6
	ldx	[%g6 + %g3], %g5  ! %g5 = VA mask
	and	%g1, %g5, %g7
	srlx	%g7, 9, %g7
	or	%i7, %g7, %i7
	add	%i6, 8, %i6
	jmp	%i6
	nop
test_page_1:
	sub	%g4, 1, %g7
	brnz,a	%g7, test_page_3
	add	%g6, 0x80, %g6
	ldx	[%g6 + %g3], %g5  ! %g5 = VA mask
	and	%g1, %g5, %g7
	srlx	%g7, 12, %g7
	or	%i7, %g7, %i7
	add	%i6, 8, %i6
	jmp	%i6
	nop
test_page_3:
	sub	%g4, 3, %g7
	brnz,a	%g7, test_page_5
	add	%g6, 0x80, %g6
	ldx	[%g6 + %g3], %g5  ! %g5 = VA mask
	and	%g1, %g5, %g7
	srlx	%g7, 18, %g7
	or	%i7, %g7, %i7
	add	%i6, 8, %i6
	jmp	%i6
	nop
test_page_5:
	ldx	[%g6 + %g3], %g5  ! %g5 = VA mask
	and	%g1, %g5, %g7
	srlx	%g7, 24, %g7
	or	%i7, %g7, %i7
	add	%i6, 8, %i6
	jmp	%i6
	nop
	
/*************************************************************************/

attr_data {
	Name=.HPTRAPS_EXT_SECT,
	hypervisor
}

.data
trap_ra_mask:
	.xword	0x00000fffe000
	.xword	0x000000000000
	.xword	0x0000003fe000
	.xword	0x000000000000
	.xword	0x00000000e000
	.xword	0x000000000000
	.xword	0x000000000000
	.xword	0x000000000000
	
.global sem_data	
sem_data:
	.xword	0x0fff
	.xword	0x0
	
! TSB mask
.global tsb_base_mask
.global tsb_va_8k_mask
.global tsb_va_64k_mask
.global tsb_va_4m_mask
.global tsb_va_256m_mask
.global tsb_addresses_zero
.global tsb_addresses_non_zero
		
tsb_base_mask:	
.xword	0x000000ffffffe000
.xword	0x000000ffffffc000
.xword	0x000000ffffff8000
.xword	0x000000ffffff0000
.xword	0x000000fffffe0000
.xword	0x000000fffffc0000
.xword	0x000000fffff80000
.xword	0x000000fffff00000
.xword	0x000000ffffe00000
.xword	0x000000ffffc00000
.xword	0x000000ffff800000
.xword	0x000000ffff000000
.xword	0x000000fffe000000
.xword	0x000000fffc000000
.xword	0x000000fff8000000
.xword	0x000000fff0000000
tsb_va_8k_mask:
.xword	0x00000000003fe000
.xword	0x00000000007fe000
.xword	0x0000000000ffe000
.xword	0x0000000001ffe000
.xword	0x0000000003ffe000
.xword	0x0000000007ffe000
.xword	0x000000000fffe000
.xword	0x000000001fffe000
.xword	0x000000003fffe000
.xword	0x000000007fffe000
.xword	0x00000000ffffe000
.xword	0x00000001ffffe000
.xword	0x00000003ffffe000
.xword	0x00000007ffffe000
.xword	0x0000000fffffe000
.xword	0x0000001fffffe000
tsb_va_64k_mask:
.xword	0x0000000001ff0000
.xword	0x0000000003ff0000
.xword	0x0000000007ff0000
.xword	0x000000000fff0000
.xword	0x000000001fff0000
.xword	0x000000003fff0000
.xword	0x000000007fff0000
.xword	0x00000000ffff0000
.xword	0x00000001ffff0000
.xword	0x00000003ffff0000
.xword	0x00000007ffff0000
.xword	0x0000000fffff0000
.xword	0x0000001fffff0000
.xword	0x0000003fffff0000
.xword	0x0000007fffff0000
.xword	0x000000ffffff0000
tsb_va_4m_mask:
.xword	0x000000007fc00000
.xword	0x00000000ffc00000
.xword	0x00000001ffc00000
.xword	0x00000003ffc00000
.xword	0x00000007ffc00000
.xword	0x0000000fffc00000
.xword	0x0000001fffc00000
.xword	0x0000003fffc00000
.xword	0x0000007fffc00000
.xword	0x000000ffffc00000
.xword	0x000001ffffc00000
.xword	0x000003ffffc00000
.xword	0x000007ffffc00000
.xword	0x00000fffffc00000
.xword	0x00001fffffc00000
.xword	0x00003fffffc00000
tsb_va_256m_mask:
.xword	0x0000001fe0000000
.xword	0x0000003fe0000000
.xword	0x0000007fe0000000
.xword	0x000000ffe0000000
.xword	0x000001ffe0000000
.xword	0x000003ffe0000000
.xword	0x000007ffe0000000
.xword	0x00000fffe0000000
.xword	0x00001fffe0000000
.xword	0x00003fffe0000000
.xword	0x00007fffe0000000
.xword	0x0000ffffe0000000
.xword	0x0001ffffe0000000
.xword	0x0003ffffe0000000
.xword	0x0007ffffe0000000
.xword	0x000fffffe0000000

tsb_addresses_zero:
.xword	0x10
.xword	0x18
.xword	0x20
.xword	0x28
.xword	0x30
.xword	0x38
.xword	0x40
.xword	0x48
.xword	0x0ff
	
tsb_addresses_non_zero:
.xword	0x30
.xword	0x38
.xword	0x40
.xword	0x48
.xword	0x10
.xword	0x18
.xword	0x20
.xword	0x28
.xword	0x0ff
	
