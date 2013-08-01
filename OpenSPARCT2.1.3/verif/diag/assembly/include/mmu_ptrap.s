/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mmu_ptrap.s
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
	ta	HP_BAD_TRAP	/* 0x0 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa */
.align 32
	ta	HP_BAD_TRAP	/* 0xb */
.align 32
	ta	HP_BAD_TRAP	/* 0xc */
.align 32
	ta	HP_BAD_TRAP	/* 0xd */
.align 32
	ta	HP_BAD_TRAP	/* 0xe */
.align 32
	ta	HP_BAD_TRAP	/* 0xf */
.align 32
	ta	HP_BAD_TRAP	/* 0x10 */
.align 32
privilege_opcode_trap:
#ifdef MMU247
	rdpr	%pstate, %i6
	rdpr	%tpc, %i7
	ta	HPTRAP_PRIV_OPCODE
#else	
	ta	HP_BAD_TRAP	/* 0x11 */
#endif
.align 32
	ta	HP_BAD_TRAP	/* 0x12 */
.align 32
	ta	HP_BAD_TRAP	/* 0x13 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17 */
.align 32
	ta	HP_BAD_TRAP	/* 0x18 */
.align 32
	ta	HP_BAD_TRAP	/* 0x19 */
.align 32
	ta	HP_BAD_TRAP	/* 0x1a */
.align 32
	ta	HP_BAD_TRAP	/* 0x1b */
.align 32
	ta	HP_BAD_TRAP	/* 0x1c */
.align 32
	ta	HP_BAD_TRAP	/* 0x1d */
.align 32
	ta	HP_BAD_TRAP	/* 0x1e */
.align 32
	ta	HP_BAD_TRAP	/* 0x1f */
.align 32
	ta	HP_BAD_TRAP	/* 0x20 */
.align 32
	ta	HP_BAD_TRAP	/* 0x21 */
.align 32
	ta	HP_BAD_TRAP	/* 0x22 */
.align 32
	ta	HP_BAD_TRAP	/* 0x23 */
.align 32
	ta	HP_BAD_TRAP	/* 0x24 */
.align 32
	ta	HP_BAD_TRAP	/* 0x25 */
.align 32
	ta	HP_BAD_TRAP	/* 0x26 */
.align 32
	ta	HP_BAD_TRAP	/* 0x27 */
.align 32
	ta	HP_BAD_TRAP	/* 0x28 */
.align 32
	ta	HP_BAD_TRAP	/* 0x29 */
.align 32
	ta	HP_BAD_TRAP	/* 0x2a */
.align 32
	ta	HP_BAD_TRAP	/* 0x2b */
.align 32
	ta	HP_BAD_TRAP	/* 0x2c */
.align 32
	ta	HP_BAD_TRAP	/* 0x2d */
.align 32
	ta	HP_BAD_TRAP	/* 0x2e */
.align 32
	ta	HP_BAD_TRAP	/* 0x2f */
.align 32
	ta	HP_BAD_TRAP	/* 0x30 */
.align 32
	ta	HP_BAD_TRAP	/* 0x31 */
.align 32
	ta	HP_BAD_TRAP	/* 0x32 */
.align 32
	ta	HP_BAD_TRAP	/* 0x33 */
.align 32
	ta	HP_BAD_TRAP	/* 0x34 */
.align 32
	ta	HP_BAD_TRAP	/* 0x35 */
.align 32
	ta	HP_BAD_TRAP	/* 0x36 */
.align 32
	ta	HP_BAD_TRAP	/* 0x37 */
.align 32
	ta	HP_BAD_TRAP	/* 0x38 */
.align 32
	ta	HP_BAD_TRAP	/* 0x39 */
.align 32
	ta	HP_BAD_TRAP	/* 0x3a */
.align 32
	ta	HP_BAD_TRAP	/* 0x3b */
.align 32
	ta	HP_BAD_TRAP	/* 0x3c */
.align 32
	ta	HP_BAD_TRAP	/* 0x3d */
.align 32
	ta	HP_BAD_TRAP	/* 0x3e */
.align 32
	ta	HP_BAD_TRAP	/* 0x3f */
.align 32
	ta	HP_BAD_TRAP	/* 0x40 */
.align 32
	ta	HP_BAD_TRAP	/* 0x41 */
.align 32
	ta	HP_BAD_TRAP	/* 0x42 */
.align 32
	ta	HP_BAD_TRAP	/* 0x43 */
.align 32
	ta	HP_BAD_TRAP	/* 0x44 */
.align 32
	ta	HP_BAD_TRAP	/* 0x45 */
.align 32
	ta	HP_BAD_TRAP	/* 0x46 */
.align 32
	ta	HP_BAD_TRAP	/* 0x47 */
.align 32
	ta	HP_BAD_TRAP	/* 0x48 */
.align 32
	ta	HP_BAD_TRAP	/* 0x49 */
.align 32
	ta	HP_BAD_TRAP	/* 0x4a */
.align 32
	ta	HP_BAD_TRAP	/* 0x4b */
.align 32
	ta	HP_BAD_TRAP	/* 0x4c */
.align 32
	ta	HP_BAD_TRAP	/* 0x4d */
.align 32
	ta	HP_BAD_TRAP	/* 0x4e */
.align 32
	ta	HP_BAD_TRAP	/* 0x4f */
.align 32
	ta	HP_BAD_TRAP	/* 0x50 */
.align 32
	ta	HP_BAD_TRAP	/* 0x51 */
.align 32
	ta	HP_BAD_TRAP	/* 0x52 */
.align 32
	ta	HP_BAD_TRAP	/* 0x53 */
.align 32
	ta	HP_BAD_TRAP	/* 0x54 */
.align 32
	ta	HP_BAD_TRAP	/* 0x55 */
.align 32
	ta	HP_BAD_TRAP	/* 0x56 */
.align 32
	ta	HP_BAD_TRAP	/* 0x57 */
.align 32
	ta	HP_BAD_TRAP	/* 0x58 */
.align 32
	ta	HP_BAD_TRAP	/* 0x59 */
.align 32
	ta	HP_BAD_TRAP	/* 0x5a */
.align 32
	ta	HP_BAD_TRAP	/* 0x5b */
.align 32
	ta	HP_BAD_TRAP	/* 0x5c */
.align 32
	ta	HP_BAD_TRAP	/* 0x5d */
.align 32
	ta	HP_BAD_TRAP	/* 0x5e */
.align 32
	ta	HP_BAD_TRAP	/* 0x5f */
.align 32
	ta	HP_BAD_TRAP	/* 0x60 */
.align 32
	ta	HP_BAD_TRAP	/* 0x61 */
.align 32
	ta	HP_BAD_TRAP	/* 0x62 */
.align 32
	ta	HP_BAD_TRAP	/* 0x63 */
.align 32
	ta	HP_BAD_TRAP	/* 0x64 */
.align 32
	ta	HP_BAD_TRAP	/* 0x65 */
.align 32
	ta	HP_BAD_TRAP	/* 0x66 */
.align 32
	ta	HP_BAD_TRAP	/* 0x67 */
.align 32
	ta	HP_BAD_TRAP	/* 0x68 */
.align 32
	ta	HP_BAD_TRAP	/* 0x69 */
.align 32
	ta	HP_BAD_TRAP	/* 0x6a */
.align 32
	ta	HP_BAD_TRAP	/* 0x6b */
.align 32
	ta	HP_BAD_TRAP	/* 0x6c */
.align 32
	ta	HP_BAD_TRAP	/* 0x6d */
.align 32
	ta	HP_BAD_TRAP	/* 0x6e */
.align 32
	ta	HP_BAD_TRAP	/* 0x6f */
.align 32
	ta	HP_BAD_TRAP	/* 0x70 */
.align 32
	ta	HP_BAD_TRAP	/* 0x71 */
.align 32
	ta	HP_BAD_TRAP	/* 0x72 */
.align 32
	ta	HP_BAD_TRAP	/* 0x73 */
.align 32
	ta	HP_BAD_TRAP	/* 0x74 */
.align 32
	ta	HP_BAD_TRAP	/* 0x75 */
.align 32
	ta	HP_BAD_TRAP	/* 0x76 */
.align 32
	ta	HP_BAD_TRAP	/* 0x77 */
.align 32
	ta	HP_BAD_TRAP	/* 0x78 */
.align 32
	ta	HP_BAD_TRAP	/* 0x79 */
.align 32
	ta	HP_BAD_TRAP	/* 0x7a */
.align 32
	ta	HP_BAD_TRAP	/* 0x7b */
.align 32
	ta	HP_BAD_TRAP	/* 0x7c */
.align 32
	ta	HP_BAD_TRAP	/* 0x7d */
.align 32
	ta	HP_BAD_TRAP	/* 0x7e */
.align 32
	ta	HP_BAD_TRAP	/* 0x7f */
.align 32
	ta	HP_BAD_TRAP	/* 0x80 */
.align 32
	ta	HP_BAD_TRAP	/* 0x81 */
.align 32
	ta	HP_BAD_TRAP	/* 0x82 */
.align 32
	ta	HP_BAD_TRAP	/* 0x83 */
.align 32
	ta	HP_BAD_TRAP	/* 0x84 */
.align 32
	ta	HP_BAD_TRAP	/* 0x85 */
.align 32
	ta	HP_BAD_TRAP	/* 0x86 */
.align 32
	ta	HP_BAD_TRAP	/* 0x87 */
.align 32
	ta	HP_BAD_TRAP	/* 0x88 */
.align 32
	ta	HP_BAD_TRAP	/* 0x89 */
.align 32
	ta	HP_BAD_TRAP	/* 0x8a */
.align 32
	ta	HP_BAD_TRAP	/* 0x8b */
.align 32
	ta	HP_BAD_TRAP	/* 0x8c */
.align 32
	ta	HP_BAD_TRAP	/* 0x8d */
.align 32
	ta	HP_BAD_TRAP	/* 0x8e */
.align 32
	ta	HP_BAD_TRAP	/* 0x8f */
.align 32
	ta	HP_BAD_TRAP	/* 0x90 */
.align 32
	ta	HP_BAD_TRAP	/* 0x91 */
.align 32
	ta	HP_BAD_TRAP	/* 0x92 */
.align 32
	ta	HP_BAD_TRAP	/* 0x93 */
.align 32
	ta	HP_BAD_TRAP	/* 0x94 */
.align 32
	ta	HP_BAD_TRAP	/* 0x95 */
.align 32
	ta	HP_BAD_TRAP	/* 0x96 */
.align 32
	ta	HP_BAD_TRAP	/* 0x97 */
.align 32
	ta	HP_BAD_TRAP	/* 0x98 */
.align 32
	ta	HP_BAD_TRAP	/* 0x99 */
.align 32
	ta	HP_BAD_TRAP	/* 0x9a */
.align 32
	ta	HP_BAD_TRAP	/* 0x9b */
.align 32
	ta	HP_BAD_TRAP	/* 0x9c */
.align 32
	ta	HP_BAD_TRAP	/* 0x9d */
.align 32
	ta	HP_BAD_TRAP	/* 0x9e */
.align 32
	ta	HP_BAD_TRAP	/* 0x9f */
.align 32
	ta	HP_BAD_TRAP	/* 0xa0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xa9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xaa */
.align 32
	ta	HP_BAD_TRAP	/* 0xab */
.align 32
	ta	HP_BAD_TRAP	/* 0xac */
.align 32
	ta	HP_BAD_TRAP	/* 0xad */
.align 32
	ta	HP_BAD_TRAP	/* 0xae */
.align 32
	ta	HP_BAD_TRAP	/* 0xaf */
.align 32
	ta	HP_BAD_TRAP	/* 0xb0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xb9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xba */
.align 32
	ta	HP_BAD_TRAP	/* 0xbb */
.align 32
	ta	HP_BAD_TRAP	/* 0xbc */
.align 32
	ta	HP_BAD_TRAP	/* 0xbd */
.align 32
	ta	HP_BAD_TRAP	/* 0xbe */
.align 32
	ta	HP_BAD_TRAP	/* 0xbf */
.align 32
	ta	HP_BAD_TRAP	/* 0xc0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xc9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xca */
.align 32
	ta	HP_BAD_TRAP	/* 0xcb */
.align 32
	ta	HP_BAD_TRAP	/* 0xcc */
.align 32
	ta	HP_BAD_TRAP	/* 0xcd */
.align 32
	ta	HP_BAD_TRAP	/* 0xce */
.align 32
	ta	HP_BAD_TRAP	/* 0xcf */
.align 32
	ta	HP_BAD_TRAP	/* 0xd0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xd9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xda */
.align 32
	ta	HP_BAD_TRAP	/* 0xdb */
.align 32
	ta	HP_BAD_TRAP	/* 0xdc */
.align 32
	ta	HP_BAD_TRAP	/* 0xdd */
.align 32
	ta	HP_BAD_TRAP	/* 0xde */
.align 32
	ta	HP_BAD_TRAP	/* 0xdf */
.align 32
	ta	HP_BAD_TRAP	/* 0xe0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xe9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xea */
.align 32
	ta	HP_BAD_TRAP	/* 0xeb */
.align 32
	ta	HP_BAD_TRAP	/* 0xec */
.align 32
	ta	HP_BAD_TRAP	/* 0xed */
.align 32
	ta	HP_BAD_TRAP	/* 0xee */
.align 32
	ta	HP_BAD_TRAP	/* 0xef */
.align 32
	ta	HP_BAD_TRAP	/* 0xf0 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf1 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf2 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf3 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf4 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf5 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf6 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf7 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf8 */
.align 32
	ta	HP_BAD_TRAP	/* 0xf9 */
.align 32
	ta	HP_BAD_TRAP	/* 0xfa */
.align 32
	ta	HP_BAD_TRAP	/* 0xfb */
.align 32
	ta	HP_BAD_TRAP	/* 0xfc */
.align 32
	ta	HP_BAD_TRAP	/* 0xfd */
.align 32
	ta	HP_BAD_TRAP	/* 0xfe */
.align 32
	ta	HP_BAD_TRAP	/* 0xff */
.align 32
	ta	HP_GOOD_TRAP		/* 0x100 */
.align 32
	ta	HP_BAD_TRAP	/* 0x101 */
.align 32
	ta	HP_BAD_TRAP	/* 0x102 */
.align 32
	ta	HP_BAD_TRAP	/* 0x103 */
.align 32
	ta	HP_BAD_TRAP	/* 0x104 */
.align 32
	ta	HP_BAD_TRAP	/* 0x105 */
.align 32
	ta	HP_BAD_TRAP	/* 0x106 */
.align 32
	ta	HP_BAD_TRAP	/* 0x107 */
.align 32
	ta	HP_BAD_TRAP	/* 0x108 */
.align 32
	ta	HP_BAD_TRAP	/* 0x109 */
.align 32
	ta	HP_BAD_TRAP	/* 0x10a */
.align 32
	ta	HP_BAD_TRAP	/* 0x10b */
.align 32
	ta	HP_BAD_TRAP	/* 0x10c */
.align 32
	ta	HP_BAD_TRAP	/* 0x10d */
.align 32
	ta	HP_BAD_TRAP	/* 0x10e */
.align 32
	ta	HP_BAD_TRAP	/* 0x10f */
.align 32
	ta	HPTRAP_I_DEMAP_ALL	/* 0x110 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PCTX	/* 0x111 */
	done
.align 32
	ta	HP_BAD_TRAP		/* 0x112 */
.align 32
	ta	HPTRAP_I_DEMAP_NCTX	/* 0x113 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_PAGE	/* 0x114 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_RPAGE	/* 0x115 */
	done
.align 32
	ta	HP_BAD_TRAP		/* 0x116 */
.align 32
	ta	HPTRAP_D_DEMAP_ALL	/* 0x117 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PCTX	/* 0x118 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_SCTX	/* 0x119 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_NCTX	/* 0x11a */
	done
.align 32
	ta	HPTRAP_D_DEMAP_PAGE	/* 0x11b */
	done
.align 32
	ta	HPTRAP_D_DEMAP_RPAGE	/* 0x11c */
	done
.align 32
	ta	HP_BAD_TRAP		/* 0x11d */
.align 32
	ta	HP_BAD_TRAP	/* 0x11e */
.align 32
	ta	HP_BAD_TRAP	/* 0x11f */
.align 32			/* 0x120 */
ptrap_redirect:
	sllx	%i7, 63, %g1
	brz	%g1, 1f
	nop
	rdpr	%tnpc, %g2
	add	%g2, 4, %g2
	wrpr	%g2, %tnpc
1:	
	done
.align 32
	ta	HPTRAP_CHANGE_PID	/* 0x121 */
	done
.align 32
	ta	HPTRAP_INCR_TSB_SIZE	/* 0x122 */
	done
.align 32				/* 0x123 */
	ldxa	[%l1] 0x14, %l2
	done
.align 32				/* 0x124 */
	ldxa	[%l1] 0x1c, %l2
	done
.align 32				/* 0x125 */
	ldda	[%l1] 0x26, %l2
	done
.align 32				/* 0x126 */
	ldda	[%l1] 0x2e, %l2
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_IMMU	/* 0x127 */
	done
.align 32
	ta	HPTRAP_CLEAR_LSU_DMMU	/* 0x128 */
	done
.align 32
	ta	HPTRAP_DELAY_LOOP	/* 0x129 */
	done
.align 32
	ta	HPTRAP_SEM_LOCK		/* 0x12a */
	done
.align 32
	ta	HPTRAP_SEM_RELEASE	/* 0x12b */
	done
.align 32
	ta	HPTRAP_SEM_GET         	/* 0x12c */
	done
.align 32
	ta	HPTRAP_SEM_SET		/* 0x12d */
	done
.align 32
	ta	HPTRAP_GOTO_SUPERVISOR0	/* 0x12e */
.align 32
	ta	HPTRAP_GOTO_SUPERVISOR1	/* 0x12f */
.align 32
	ta	HPTRAP_I_DEMAP_ALL_PAGES /* 0x130 */
	done
.align 32
	ta	HPTRAP_I_DEMAP_ALL_RPAGES /* 0x131 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_ALL_PAGES /* 0x132 */
	done
.align 32
	ta	HPTRAP_D_DEMAP_ALL_RPAGES /* 0x133 */
	done
.align 32
	ta	HPTRAP_ACCESS_ITSB_PTR	  /* 0x134 */
	done
.align 32
	ta	HPTRAP_ACCESS_DTSB_PTR	  /* 0x135 */
	done
.align 32
	ta	HPTRAP_TOGGLE_LSU_IM	  /* 0x136 */
	done
.align 32
	ta	HPTRAP_TOGGLE_LSU_DM	  /* 0x137 */
	done
.align 32
	ta	HPTRAP_LOAD_IDATA_IN	  /* 0x138 */
	done
.align 32
	ta	HPTRAP_LOAD_DDATA_IN	  /* 0x139 */
	done
.align 32
	ta	HPTRAP_READ_IDATA_ACCESS  /* 0x13a */
	done
.align 32
	ta	HPTRAP_READ_DDATA_ACCESS  /* 0x13b */
	done
.align 32
	ta	HPTRAP_USER_TRAP	  /* 0x13c */
	done
.align 32
	ta	HPTRAP_LOAD_IDATA_ACCESS  /* 0x13d */
	done
.align 32
	ta	HPTRAP_LOAD_DDATA_ACCESS  /* 0x13e */
	done
.align 32
	ta	HPTRAP_ITLB_PROBE	  /* 0x13f */
	done
.align 32
	ta	HPTRAP_TOGGLE_HWTW_DEMAP  /* 0x140 */
	done
.align 32
	ta	HPTRAP_ITLB_TAG_READ      /* 0x141 */
	done
.align 32
	ta	HPTRAP_DTLB_TAG_READ      /* 0x142 */
	done
.align 32
	ta	HP_BAD_TRAP	/* 0x143 */
.align 32
	ta	HP_BAD_TRAP	/* 0x144 */
.align 32
	ta	HP_BAD_TRAP	/* 0x145 */
.align 32
	ta	HP_BAD_TRAP	/* 0x146 */
.align 32
	ta	HP_BAD_TRAP	/* 0x147 */
.align 32
	ta	HP_BAD_TRAP	/* 0x148 */
.align 32
	ta	HP_BAD_TRAP	/* 0x149 */
.align 32
	ta	HP_BAD_TRAP	/* 0x14a */
.align 32
	ta	HP_BAD_TRAP	/* 0x14b */
.align 32
	ta	HP_BAD_TRAP	/* 0x14c */
.align 32
	ta	HP_BAD_TRAP	/* 0x14d */
.align 32
	ta	HP_BAD_TRAP	/* 0x14e */
.align 32
	ta	HP_BAD_TRAP	/* 0x14f */
.align 32
	ta	HP_BAD_TRAP	/* 0x150 */
.align 32
	ta	HP_BAD_TRAP	/* 0x151 */
.align 32
	ta	HP_BAD_TRAP	/* 0x152 */
.align 32
	ta	HP_BAD_TRAP	/* 0x153 */
.align 32
	ta	HP_BAD_TRAP	/* 0x154 */
.align 32
	ta	HP_BAD_TRAP	/* 0x155 */
.align 32
	ta	HP_BAD_TRAP	/* 0x156 */
.align 32
	ta	HP_BAD_TRAP	/* 0x157 */
.align 32
	ta	HP_BAD_TRAP	/* 0x158 */
.align 32
	ta	HP_BAD_TRAP	/* 0x159 */
.align 32
	ta	HP_BAD_TRAP	/* 0x15a */
.align 32
	ta	HP_BAD_TRAP	/* 0x15b */
.align 32
	ta	HP_BAD_TRAP	/* 0x15c */
.align 32
	ta	HP_BAD_TRAP	/* 0x15d */
.align 32
	ta	HP_BAD_TRAP	/* 0x15e */
.align 32
	ta	HP_BAD_TRAP	/* 0x15f */
.align 32
	ta	HP_BAD_TRAP	/* 0x160 */
.align 32
	ta	HP_BAD_TRAP	/* 0x161 */
.align 32
	ta	HP_BAD_TRAP	/* 0x162 */
.align 32
	ta	HP_BAD_TRAP	/* 0x163 */
.align 32
	ta	HP_BAD_TRAP	/* 0x164 */
.align 32
	ta	HP_BAD_TRAP	/* 0x165 */
.align 32
	ta	HP_BAD_TRAP	/* 0x166 */
.align 32
	ta	HP_BAD_TRAP	/* 0x167 */
.align 32
	ta	HP_BAD_TRAP	/* 0x168 */
.align 32
	ta	HP_BAD_TRAP	/* 0x169 */
.align 32
	ta	HP_BAD_TRAP	/* 0x16a */
.align 32
	ta	HP_BAD_TRAP	/* 0x16b */
.align 32
	ta	HP_BAD_TRAP	/* 0x16c */
.align 32
	ta	HP_BAD_TRAP	/* 0x16d */
.align 32
	ta	HP_BAD_TRAP	/* 0x16e */
.align 32
	ta	HP_BAD_TRAP	/* 0x16f */
.align 32
	ta	HP_BAD_TRAP	/* 0x170 */
.align 32
	ta	HP_BAD_TRAP	/* 0x171 */
.align 32
	ta	HP_BAD_TRAP	/* 0x172 */
.align 32
	ta	HP_BAD_TRAP	/* 0x173 */
.align 32
	ta	HP_BAD_TRAP	/* 0x174 */
.align 32
	ta	HP_BAD_TRAP	/* 0x175 */
.align 32
	ta	HP_BAD_TRAP	/* 0x176 */
.align 32
	ta	HP_BAD_TRAP	/* 0x177 */
.align 32
	ta	HP_BAD_TRAP	/* 0x178 */
.align 32
	ta	HP_BAD_TRAP	/* 0x179 */
.align 32
	ta	HP_BAD_TRAP	/* 0x17a */
.align 32
	ta	HP_BAD_TRAP	/* 0x17b */
.align 32
	ta	HP_BAD_TRAP	/* 0x17c */
.align 32
	ta	HP_BAD_TRAP	/* 0x17d */
.align 32
	ta	HP_BAD_TRAP	/* 0x17e */
.align 32
	ta	HP_BAD_TRAP	/* 0x17f */
.align 32
