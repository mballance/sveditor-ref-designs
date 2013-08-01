/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: hpv_calls.s
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
#ident "@(#)  hpv_calls.s  1.1        04/10/11 16:44:05"
#include <sys/asm_linkage.h>

#pragma ident   "@(#) hpv_calls.s  1.1        04/10/11 16:44:05  SMI"

/*
 * Hypervisor calls
 */

#include <sys/asm_linkage.h>
#define HPV_CALL_TRAP   0x90
#define CONS_READ       0x60
#define CONS_WRITE      0x61
#define TOD_GET         0x50
#define MAP_PERM_ADDR   0x25
#define MMU_SET_INFOPTR 0x26

#define DISK_READ       0xf0
#define DISK_WRITE      0xf1
#define CPU_QCONF       0x14
#define HACK_XCALL      0xf6 /* XXX */
#define FAKE_INTR       0xf7 /* XXX */
#define CONS_STATUS     0xf8
#define CONS_SETINTR    0xf9

#if defined(lint) || defined(__lint)

/*ARGSUSED*/
uint64_t
hv_mmu_set_infoptr(uint64_t rmissarea)
{ return (0); }

/*ARGSUSED*/
uint64_t
hv_tod_get(void)
{ return (0); }

uint64_t
hv_ld_scratch0(void)
{ return (0); }

/*ARGSUSED*/
void
hv_st_scratch0(uint64_t v)
{ }

/*ARGSUSED*/
int
hv_mmu_map_perm_addr(void *vaddr, int ctx, uint64_t tte, int flags)
{ return (0); }

/*ARGSUSED*/
int
hv_cpu_qconf(int queue, uint64_t paddr, int size)
{ return (0); }

int
hv_fake_intr(void)
{ return (0); }

#else   /* lint || __lint */

#define ASI_SCRATCHPAD  0x20 /* XXX */
/* XXXQ - sun4v OBP/OS convention: va0x0/ASI_SCRATCHPAD contains miss area */

	/*
	 * XXX These do not belong here
	 */
	ENTRY(hv_ld_scratch0)
	retl
	ldxa    [%g0]ASI_SCRATCHPAD, %o0
	SET_SIZE(hv_ld_scratch0)

	ENTRY(hv_st_scratch0)
	retl
	stxa    %o0, [%g0]ASI_SCRATCHPAD
	SET_SIZE(hv_st_scratch0)

	/*
	 * Returns old infoptr on success, -1 on failure
	 */
	ENTRY(hv_mmu_set_infoptr)
	mov     MMU_SET_INFOPTR, %o5
	ta      HPV_CALL_TRAP
	tst     %o0
	movz    %xcc, %o1, %o0
	retl
	movnz   %xcc, -1, %o0
	SET_SIZE(hv_mmu_set_infoptr)

	ENTRY(hv_debug)
	ta      0x70
	retl
	nop
	SET_SIZE(hv_debug)

	/*
	 * %o0 - disk offset
	 * %o1 - target real address
	 * %o2 - size
	 */     
	ENTRY(hv_disk_read)
	mov     DISK_READ, %o5
	ta      HPV_CALL_TRAP
	tst     %o0
	movz    %xcc, %o1, %o0
	retl
	movnz   %xcc, -1, %o0
	SET_SIZE(hv_disk_read)

	/*
	 * %o0 - disk offset
	 * %o1 - target real address
	 * %o2 - size
	 */     
	ENTRY(hv_disk_write)
	mov     DISK_WRITE, %o5
	ta      HPV_CALL_TRAP
	tst     %o0
	movz    %xcc, %o1, %o0
	retl
	movnz   %xcc, -1, %o0
	SET_SIZE(hv_disk_write)

	/*
	 * %o0 - character
	 */     
	ENTRY(hv_cnputchar)
	ta      T_CHANGE_PRIV
	mov     CONS_WRITE, %o5
	ta      HPV_CALL_TRAP
	ta      T_CHANGE_NONPRIV
	tst     %o0
	movz    %xcc, %o1, %o0
	retl
	movnz   %xcc, -1, %o0
	SET_SIZE(hv_cnputchar)

	/*
	 * %o0 pointer to character buffer
	 * return values:
	 * 0 success
	 * hv_errno failure
	 * (int64_t)-1 BREAK
	 */     
	ENTRY(hv_cngetchar)
	mov     %o0, %o2
	mov     CONS_READ, %o5
	ta      HPV_CALL_TRAP
	brnz,a  %o0, 1f         ! failure, just return error
	mov     1, %o0

	cmp     %o1, -1         ! BREAK, return -1
	be      1f
	mov     %o1, %o0

	stb     %o1, [%o2]      ! success, save character and return 0
	mov     0, %o0
1:
	retl
	nop
	SET_SIZE(hv_cngetchar)

	/*
	 * %o0 pointer to character buffer
	 * return values:
	 * 0 success
	 * hv_errno failure
	 * (int64_t)-1 BREAK
	 */     
	ENTRY(hv_cngetstatus)
	mov     %o0, %o2
	mov     CONS_STATUS, %o5
	ta      HPV_CALL_TRAP
	brnz,a  %o0, 1f         ! failure, just return error
	mov     1, %o0

	stb     %o1, [%o2]      ! success, save character and return 0
	mov     0, %o0
1:
	retl
	nop
	SET_SIZE(hv_cngetstatus)

	/*
	 * %o0 - character
	 */     
	ENTRY(hv_cnsetintr)
	mov     CONS_SETINTR, %o5
	ta      HPV_CALL_TRAP
	tst     %o0
	movz    %xcc, %o1, %o0
	retl
	movnz   %xcc, -1, %o0
	SET_SIZE(hv_cnsetintr)

	ENTRY(hv_tod_get)
	mov     TOD_GET, %o5
	ta      HPV_CALL_TRAP
	tst     %o0
	movz    %xcc, %o1, %o0
	retl
	movnz   %xcc, -1, %o0
	SET_SIZE(hv_tod_get)


	/*
	 * Map permanent address
	 * arg0 vaddr (%o0)
	 * arg1 context (%o1)
	 * arg2 tte (%o2)
	 * arg3 flags (%o3)  0x1=d 0x2=i
	 */
	ENTRY(hv_mmu_map_perm_addr)
	mov     MAP_PERM_ADDR, %o5
	ta      HPV_CALL_TRAP
	tst     %o0
	movz    %xcc, %o1, %o0
	retl
	movnz   %xcc, -1, %o0
	SET_SIZE(hv_mmu_map_perm_addr)


	/*
	 * CPU Q Configure
	 * arg0 queue (%o0)
	 * arg1 Base address RA (%o1)
	 * arg2 Size (%o2)      
	 */
	ENTRY(hv_cpu_qconf)
	mov CPU_QCONF, %o5
	ta  HPV_CALL_TRAP
	retl
	nop
	SET_SIZE(hv_cpu_qconf)

 /*
  * XXXQ temporary
  */
	ENTRY(hv_fake_intr)
	mov     FAKE_INTR, %o5
	ta      HPV_CALL_TRAP
	retl
	nop
	SET_SIZE(hv_fake_intr)

	ENTRY(hv_hack_xcall)
	mov     HACK_XCALL, %o5
	ta      HPV_CALL_TRAP
	retl
	nop
	SET_SIZE(hv_hack_xcall)


	/*
	 * %o0 - addr, %o1 data
	 */     
	ENTRY(hv_poke_little)
	ta      T_CHANGE_PRIV
	mov     VPCI_IO_POKE, %o5
	ta      HPV_CALL_TRAP
	ta      T_CHANGE_NONPRIV
	retl
	SET_SIZE(hv_poke_little)

	/*
	 * %o0 - addr, %o0 returned w/ data
	 */     
	ENTRY(hv_peek_little)
	ta      T_CHANGE_PRIV
	mov     VPCI_IO_PEEK, %o5
	ta      HPV_CALL_TRAP
	ta      T_CHANGE_NONPRIV
	retl
	SET_SIZE(hv_peek_little)

	/*
	 * %o0 - addr, %o1 data
	 */     
	ENTRY(hv_poke)
	ta      T_CHANGE_PRIV
	mov     IO_POKE, %o5
	ta      HPV_CALL_TRAP
	ta      T_CHANGE_NONPRIV
	retl
	SET_SIZE(hv_poke)

	/*
	 * %o0 - addr, %o0 returned w/ data
	 */     
	ENTRY(hv_peek)
	ta      T_CHANGE_PRIV
	mov     IO_PEEK, %o5
	ta      HPV_CALL_TRAP
	ta      T_CHANGE_NONPRIV
	retl
	SET_SIZE(hv_peek)

#endif  /* lint || __lint */
