/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: hypervisor.h
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
#ifndef _HYPERVISOR_H
#define _HYPERVISOR_H

#pragma ident   "@(#)hypervisor.h       1.13    04/05/12 SMI"

/*
 * Common HyperVisor definitions
 */

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Hypervisor software trap numbers
 */
#define FAST_TRAP       0x80
#define CPU_TICK_NPT    0x81
#define CPU_STICK_NPT   0x82
#define MMU_MAP_ADDR    0x83
#define MMU_UNMAP_ADDR  0x84

/*
 * Hypervisor function numbers for FAST_TRAP
 */
#define PART_EXIT       0x00
#define CPU_START       0x10
#define CPU_STOP        0x11
#define CPU_YIELD       0x12
#define CPU_UPDATE_SIGNATURE 0x13
#define CPU_QCONF       0x14
#define CPU_QINFO       0x15
#define CPU_MYID        0x16
#define MMU_TSB_CTX0    0x20
#define MMU_TSB_CTXNON0 0x21
#define MMU_DEMAP_PAGE  0x22
#define MMU_DEMAP_CTX   0x23
#define MMU_DEMAP_ALL   0x24
#define MMU_MAP_PERM_ADDR 0x25
#define MMU_FAULT_AREA  0x26
#define MMU_ENABLE      0x27
#define CACHE_FLUSH_VPAGE 0x30
#define MEM_SCRUB       0x31
#define INTR_MAP        0x40
#define INTR_UNMAP      0x41
#define INTR_SEND       0x42
#define TOD_GET         0x50
#define TOD_SET         0x51
#define CONS_GETCHAR    0x60
#define CONS_PUTCHAR    0x61
#define NVRAM_READ      0x70
#define NVRAM_WRITE     0x71

#define VPCI_IO_PEEK    0xb6
#define VPCI_IO_POKE    0xb7
#define VPCI_DMA_SYNC   0xb8
#define IO_PEEK    0xb9
#define IO_POKE    0xba

#ifdef CONFIG_DISK              /* Simulation hack */
#define DISK_READ       0xf0
#define DISK_WRITE      0xf1
#endif

#ifdef CONFIG_FREEZETHAW
#define GUEST_FREEZE    0xf2
#define GUEST_THAW      0xf3
#endif

#define OLD_CPU_MYID    0xf4    /* replaced by CPU_MYID */
#define CPU_MONDO       0xf6    /* XXX temporary hack */
#define FAKE_INTR       0xf7    /* XXX temporary hack */
#define CONS_STATUS     0xf8
#define CONS_SETINTR    0xf9

#define RA_TO_PA        0x200
#define HPRIVCALL       0x201

/*
 * flags
 */
#define MAP_DTLB        0x1
#define MAP_ITLB        0x2

/*
 * Limits
 */
#define NPERMMAPPINGS   8       /* XXX i&d, should be {n} of each */

#define MMU_FAULT_AREA_SIZE     0x80

/*
 * Error codes
 */
#define EOK             0       /* No error */
#define ENOCPU          1       /* Invalid CPU id */
#define ENORADDR        2       /* Invalid real address */
#define ENOINTR         3       /* Invalid interrupt id */
#define EBADPGSZ        4       /* Invalid page size encoding */
#define EBADTSB         5       /* Invalid TSB description */
#define EINVAL          6       /* Invalid argument */
#define EBADTRAP        7       /* Invalid function number */
#define EBADALIGN       8       /* Invalid address alignment */
#define EWOULDBLOCK     9       /* Call would block */
#define ENOACCESS       10      /* No access to resource */


/*
 * Return values
 */

/* cons_getchar special character values (64-bit) */
#define CONS_BREAK      -1
#define CONS_HUP        -2


#ifdef __cplusplus
}
#endif

#endif /* _HYPERVISOR_H */
