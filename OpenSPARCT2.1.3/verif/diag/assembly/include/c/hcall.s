/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: hcall.s
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
#define HCALL_TRAP_BASE_PA 0x2000
#define HCALL_TRAP_DATA_PA 0x4000
#define ASI_PRIMARY_LITTLE                      0x88
SECTION .HCALL_TRAPS            TEXT_VA=HCALL_TRAP_BASE_PA, DATA_VA=HCALL_TRAP_DATA_PA

attr_text {
    Name = .HCALL_TRAPS,
    hypervisor,
    }
attr_data {
    Name = .HCALL_TRAPS,
    hypervisor,
    }

.text

	.ident  "@(#)hcall.s    1.72    05/04/29 SMI"

	.file   "hcall.s"

/*
 * Niagara API calls
 */
#include <hypervisor.h>
#define T_BAD_TRAP 1
#if 0
#include <sys/asm_linkage.h>
#include <sparcv9/misc.h>
#include <niagara/asi.h>
#include <niagara/mmu.h>
#include <niagara/jbi_regs.h>
#include <niagara/dram.h>
#include <sun4v/traps.h>
#include <sun4v/asi.h>
#include <sun4v/mmu.h>
#include <sun4v/queue.h>
#include <devices/pc16550.h>
#include <sparcv9/asi.h>
#include <mmustat.h>

#include "config.h"
#include "cpu.h"
#include "guest.h"
#ifdef  N2
#include "offsets-n2.h"
#else   /* N2 */
#include "offsets-n1.h"
#endif  /* N2 */
#include "traptrace.h"
#include "svc.h"
#include "util.h"
#include "vdev_ops.h"
#include "vdev_intr.h"
#include "debug.h"

#ifdef CONFIG_BRINGUP
#define VDEV_GENINTR    0x280   /* for testing */
#endif /* CONFIG_BRINGUP */


/*
 * hcall_core - entry point for the core hcalls: versioning plus
 * aliases for standard APIs that need to be called when there
 * exists a version mismatch.
 */
	ENTRY_NP(hcall_core)
	HCALL_RET(EBADTRAP)
	SET_SIZE(hcall_core)
#endif


/*
 * hcall - entry point for FAST_TRAP hcalls
 */
.global my_hcall_code
my_hcall_code:
#if 0
	ENTRY_NP(hcall)
	cmp     %o5, MMU_DEMAP_PAGE
	be,pn   %xcc, hcall_mmu_demap_page
	cmp     %o5, MMU_DEMAP_CTX
	be,pn   %xcc, hcall_mmu_demap_ctx
	cmp     %o5, MMU_DEMAP_ALL
	be,pn   %xcc, hcall_mmu_demap_all
	cmp     %o5, CPU_MONDO_SEND
	be,pn   %xcc, hcall_cpu_mondo_send
	cmp     %o5, IO_PEEK                    ! io peek, suppress errors
	be,pn   %xcc, hcall_io_peek
	cmp     %o5, IO_POKE                    ! io poke, suppress errors
	be,pn   %xcc, hcall_io_poke

#endif
	cmp     %o5, CONS_PUTCHAR
	be,pn   %xcc, hcall_cons_putchar
#if 0
	cmp     %o5, CONS_GETCHAR
	be,pn   %xcc, hcall_cons_getchar
	cmp     %o5, TOD_GET
	be,pn   %xcc, hcall_tod_get
	cmp     %o5, TOD_SET
	be,pn   %xcc, hcall_tod_set
	cmp     %o5, MMU_TSB_CTX0
	be,pn   %xcc, hcall_mmu_tsb_ctx0
	cmp     %o5, MMU_TSB_CTXNON0
	be,pn   %xcc, hcall_mmu_tsb_ctxnon0
	cmp     %o5, MMU_MAP_PERM_ADDR
	be,pn   %xcc, hcall_mmu_map_perm_addr
	cmp     %o5, MMU_UNMAP_PERM_ADDR
	be,pn   %xcc, hcall_mmu_unmap_perm_addr
	cmp     %o5, MMU_FAULT_AREA_CONF
	be,pn   %xcc, hcall_mmu_fault_area_conf
	cmp     %o5, MEM_SCRUB
	be,pn   %xcc, hcall_mem_scrub
	cmp     %o5, MEM_SYNC
	be,pn   %xcc, hcall_mem_sync
#if defined(NVRAM_READ) && defined(NVRAM_WRITE)
	cmp     %o5, NVRAM_READ
	be,pn   %xcc, hcall_nvram_read
	cmp     %o5, NVRAM_WRITE
	be,pn   %xcc, hcall_nvram_write
#endif
#ifdef CONFIG_SVC
	cmp     %o5, SVC_SEND
	be,pn   %xcc, hcall_svc_send
	cmp     %o5, SVC_RECV
	be,pn   %xcc, hcall_svc_recv
	cmp     %o5, SVC_GETSTATUS
	be,pn   %xcc, hcall_svc_getstatus
	cmp     %o5, SVC_SETSTATUS
	be,pn   %xcc, hcall_svc_setstatus
	cmp     %o5, SVC_CLRSTATUS
	be,pn   %xcc, hcall_svc_clrstatus
#endif
	cmp     %o5, CPU_QINFO
	be,pn   %xcc, hcall_qinfo
	cmp     %o5, CPU_QCONF
	be,pn   %xcc, hcall_qconf
	cmp     %o5, CPU_START
	be,pn   %xcc, hcall_cpu_start
	cmp     %o5, CPU_STOP
	be,pn   %xcc, hcall_cpu_stop
	cmp     %o5, CPU_STATE
	be,pn   %xcc, hcall_cpu_state
	cmp     %o5, CPU_YIELD
	be,pn   %xcc, hcall_cpu_yield
	cmp     %o5, MACH_SIR
	be,pn   %xcc, hcall_mach_sir
	cmp     %o5, MACH_EXIT
	be,pn   %xcc, hcall_mach_exit
	cmp     %o5, CPU_MYID
	be,pn   %xcc, hcall_cpu_myid
	cmp     %o5, MMU_ENABLE
	be,pn   %xcc, hcall_mmu_enable
	cmp     %o5, MMU_TSB_CTX0_INFO
	be,pn   %xcc, hcall_mmu_tsb_ctx0_info
	cmp     %o5, MMU_TSB_CTXNON0_INFO
	be,pn   %xcc, hcall_mmu_tsb_ctxnon0_info
	cmp     %o5, NIAGARA_GET_PERFREG
	be,pn   %xcc, hcall_niagara_getperf
	cmp     %o5, NIAGARA_SET_PERFREG
	be,pn   %xcc, hcall_niagara_setperf
	cmp     %o5, DIAG_RA2PA
	be,pn   %xcc, hcall_ra2pa
	cmp     %o5, DIAG_HEXEC
	be,pn   %xcc, hcall_hexec
	cmp     %o5, MACH_DESC
	be,pn   %xcc, hcall_mach_desc
	cmp     %o5, DUMP_BUF_INFO
	be,pn   %xcc, hcall_dump_buf_info
	cmp     %o5, DUMP_BUF_UPDATE
	be,pn   %xcc, hcall_dump_buf_update
	cmp     %o5, INTR_DEVINO2SYSINO
	be,pn   %xcc, hcall_intr_devino2sysino
	cmp     %o5, INTR_GETENABLED
	be,pn   %xcc, hcall_intr_getenabled
	cmp     %o5, INTR_SETENABLED
	be,pn   %xcc, hcall_intr_setenabled
	cmp     %o5, INTR_GETSTATE
	be,pn   %xcc, hcall_intr_getstate
	cmp     %o5, INTR_SETSTATE
	be,pn   %xcc, hcall_intr_setstate
	cmp     %o5, INTR_GETTARGET
	be,pn   %xcc, hcall_intr_gettarget
	cmp     %o5, INTR_SETTARGET
	be,pn   %xcc, hcall_intr_settarget
#ifndef N2
	cmp     %o5, VPCI_IOMMU_MAP
	be,pn   %xcc, hcall_vpci_iommu_map
	cmp     %o5, VPCI_IOMMU_UNMAP
	be,pn   %xcc, hcall_vpci_iommu_unmap
	cmp     %o5, VPCI_IOMMU_GETMAP
	be,pn   %xcc, hcall_vpci_iommu_getmap
	cmp     %o5, VPCI_IOMMU_GETBYPASS
	be,pn   %xcc, hcall_vpci_iommu_getbypass
	cmp     %o5, VPCI_CONFIG_GET
	be,pn   %xcc, hcall_vpci_config_get
	cmp     %o5, VPCI_CONFIG_PUT
	be,pn   %xcc, hcall_vpci_config_put
#endif
#endif
	cmp     %o5, VPCI_IO_PEEK
	be,pn   %xcc, hcall_vpci_io_peek
	cmp     %o5, VPCI_IO_POKE
	be,pn   %xcc, hcall_vpci_io_poke
#if 0
#ifndef N2
	cmp     %o5, VPCI_DMA_SYNC
	be,pn   %xcc, hcall_vpci_dma_sync
	cmp     %o5, MSIQ_CONF
	be,pn   %xcc, hcall_msiq_conf
	cmp     %o5, MSIQ_INFO
	be,pn   %xcc, hcall_msiq_info
	cmp     %o5, MSIQ_GETVALID
	be,pn   %xcc, hcall_msiq_getvalid
	cmp     %o5, MSIQ_SETVALID
	be,pn   %xcc, hcall_msiq_setvalid
	cmp     %o5, MSIQ_GETSTATE
	be,pn   %xcc, hcall_msiq_getstate
	cmp     %o5, MSIQ_SETSTATE
	be,pn   %xcc, hcall_msiq_setstate
	cmp     %o5, MSIQ_GETHEAD
	be,pn   %xcc, hcall_msiq_gethead
	cmp     %o5, MSIQ_SETHEAD
	be,pn   %xcc, hcall_msiq_sethead
	cmp     %o5, MSIQ_GETTAIL
	be,pn   %xcc, hcall_msiq_gettail
	cmp     %o5, MSI_GETVALID
	be,pn   %xcc, hcall_msi_getvalid
	cmp     %o5, MSI_SETVALID
	be,pn   %xcc, hcall_msi_setvalid
	cmp     %o5, MSI_GETSTATE
	be,pn   %xcc, hcall_msi_getstate
	cmp     %o5, MSI_SETSTATE
	be,pn   %xcc, hcall_msi_setstate
	cmp     %o5, MSI_GETMSIQ
	be,pn   %xcc, hcall_msi_getmsiq
	cmp     %o5, MSI_SETMSIQ
	be,pn   %xcc, hcall_msi_setmsiq
	cmp     %o5, MSI_MSG_GETVALID
	be,pn   %xcc, hcall_msi_msg_getvalid
	cmp     %o5, MSI_MSG_SETVALID
	be,pn   %xcc, hcall_msi_msg_setvalid
	cmp     %o5, MSI_MSG_GETMSIQ
	be,pn   %xcc, hcall_msi_msg_getmsiq
	cmp     %o5, MSI_MSG_SETMSIQ
	be,pn   %xcc, hcall_msi_msg_setmsiq
#endif  /* !N2 */
#ifdef CONFIG_DISK
	cmp     %o5, DISK_READ
	be,pn   %xcc, hcall_disk_read
	cmp     %o5, DISK_WRITE
	be,pn   %xcc, hcall_disk_write
#endif
#ifndef N2
	cmp     %o5, NCS_REQUEST
	be,pn   %xcc, hcall_ncs_request
#endif  /* !N2 */
#ifdef MMU_STATS
	cmp     %o5, MMU_STAT_AREA
	be,pn   %xcc, hcall_mmu_stat_area
#endif /* MMU_STATS */
	cmp     %o5, TTRACE_BUF_CONF
	be,pn   %xcc, hcall_ttrace_buf_conf
	cmp     %o5, TTRACE_BUF_INFO
	be,pn   %xcc, hcall_ttrace_buf_info
	cmp     %o5, TTRACE_ENABLE
	be,pn   %xcc, hcall_ttrace_enable
	cmp     %o5, TTRACE_FREEZE
	be,pn   %xcc, hcall_ttrace_freeze
	cmp     %o5, MMU_FAULT_AREA_INFO
	be,pn   %xcc, hcall_mmu_fault_area_info
	cmp     %o5, CPU_GET_RTBA
	be,pn   %xcc, hcall_get_rtba
	cmp     %o5, CPU_SET_RTBA
	be,pn   %xcc, hcall_set_rtba
#ifdef CONFIG_BRINGUP
	cmp     %o5, VDEV_GENINTR
	be,pn   %xcc, hcall_vdev_genintr
#endif
	nop
	HCALL_RET(EBADTRAP)
#endif
	nop
	ta T_BAD_TRAP
	nop

#if 0
	SET_SIZE(hcall)


/*
 * Common error escapes so errors can be implemented by
 * cmp, branch.
 */
	ENTRY(hret_ok)
	HCALL_RET(EOK)
	SET_SIZE(hret_ok)

	ENTRY(herr_nocpu)
	HCALL_RET(ENOCPU)
	SET_SIZE(herr_nocpu)

	ENTRY(herr_noraddr)
	HCALL_RET(ENORADDR)
	SET_SIZE(herr_noraddr)

	ENTRY(herr_nointr)
	HCALL_RET(ENOINTR)
	SET_SIZE(herr_nointr)

	ENTRY(herr_badpgsz)
	HCALL_RET(EBADPGSZ)
	SET_SIZE(herr_badpgsz)

	ENTRY(herr_badtsb)
	HCALL_RET(EBADTSB)
	SET_SIZE(herr_badtsb)

	ENTRY(herr_inval)
	HCALL_RET(EINVAL)
	SET_SIZE(herr_inval)

	ENTRY(herr_badtrap)
	HCALL_RET(EBADTRAP)
	SET_SIZE(herr_badtrap)

	ENTRY(herr_badalign)
	HCALL_RET(EBADALIGN)
	SET_SIZE(herr_badalign)

	ENTRY(herr_wouldblock)
	HCALL_RET(EWOULDBLOCK)
	SET_SIZE(herr_wouldblock)

	ENTRY(herr_noaccess)
	HCALL_RET(ENOACCESS)
	SET_SIZE(herr_noaccess)

	ENTRY(herr_ioerror)
	HCALL_RET(EIO)
	SET_SIZE(herr_ioerror)

	ENTRY(herr_toomany)
	HCALL_RET(ETOOMANY)
	SET_SIZE(herr_toomany)

	ENTRY(herr_nomap)
	HCALL_RET(ENOMAP)
	SET_SIZE(herr_nomap)

	ENTRY(herr_notsupported)
	HCALL_RET(ENOTSUPPORTED)
	SET_SIZE(herr_notsupported)


#ifdef CONFIG_IO_PEEK_POKE
/*
 * Function: hcall_io_peek(void *ioaddr, int bw)
 *      Input:
 *              %o5 - hcall function number
 *              %o0 - i/o addr
 *              %o1 - read byte width
 *                    (1 = byte, 2 = halfword, 4 = word, 8 = double
 *      Output:
 *              %o0 - EOK (for success), EINVAL or EIO (for failure)
 *              %o1 - i/o data on successful read
 */
	ENTRY_NP(hcall_io_peek)
	CPU_STRUCT(%g1)

	! set io_prot flag
	set     1, %g2
	set     CPU_IO_PROT, %g3
	stx     %g2, [%g1 + %g3]                ! cpu.io_prot = 1

	! check for valid args
	cmp     %o1, 1
	bz      .byte_read
	cmp     %o1, 2
	bz      .halfword_read
	cmp     %o1, 4
	bz      .word_read
	cmp     %o1, 8
	bz      .extword_read
	nop
	! clear io_prot, return EINVAL
	ba      herr_inval
	stx     %g0, [%g1 + %g3]                ! cpu.io_prot = 0

	! %g1 has the cpu pointer
.byte_read:
	ldub    [%o0], %g2
	ba,a    1f
.halfword_read:
	lduh    [%o0], %g2
	ba,a    1f
.word_read:
	ld      [%o0], %g2
	ba,a    1f
.extword_read:
	ldx     [%o0], %g2
	/*
	 * check io_error flag which will be nonzero if a UE occurred
	 * %g1 has this_cpu, %g2 has read return data
	 * %g3 is cpu.io_prot offset
	 */
1:
	set     CPU_IO_ERROR, %g4
	ldx     [%g1 + %g4], %g5                ! cpu.io_error
	brnz    %g5, 2f                         ! i/o error
	stx     %g0, [%g1 + %g3]                ! cpu.io_prot = 0
	! no i/o error
	mov     %g2, %o1                        ! return data in %o1
	HCALL_RET(EOK)

	! i/o error, clear io_error flag
2:
	ba      herr_ioerror
	stx     %g0, [%g1 + %g4]                ! cpu.io_error = 0
	SET_SIZE(hcall_io_peek)

/*
 * Function: hcall_io_poke(void *addr, uint64_t data, int size)
 * Arguments:
 *      Input:
 *              %o5 - hcall function number
 *              %o0 - i/o address
 *              %o1 - write data
 *              %o2 - write byte width
 *                   (1 = byte, 2 = halfword, 4 = word, 8 = extword)
 *      Output:
 *              %o0 - EOK (on success), EINVAL or EIO (on failure)
 */
	ENTRY_NP(hcall_io_poke)
	CPU_STRUCT(%g1)

	! set io_prot flag
	set     1, %g2
	set     CPU_IO_PROT, %g3
	stx     %g2, [%g1 + %g3]                ! cpu.io_prot = 1

	! check for valid args
	cmp     %o2, 1
	bz      .byte_write
	cmp     %o2, 2
	bz      .halfword_write
	cmp     %o2, 4
	bz      .word_write
	cmp     %o2, 8
	bz      .extword_write
	nop
	! clear io_prot, return EINVAL
	ba      herr_inval
	stx     %g0, [%g1 + %g3]                ! cpu.io_prot = 0

	! %g1 has the cpu pointer
.byte_write:
	stb     %o1, [%o0]
	ba,a    1f
.halfword_write:
	sth     %o1, [%o0]
	ba,a    1f
.word_write:
	st      %o1, [%o0]
	ba,a    1f
.extword_write:
	stx     %o1, [%o0]
	/*
	 * check io_error flag which will be nonzero if a UE occurred
	 * %g1 has this_cpu, %g2 has read return data
	 * %g3 is cpu.io_prot offset
	 */
1:
	set     CPU_IO_ERROR, %g4
	ldx     [%g1 + %g4], %g5
	brnz    %g5, 2f                         ! i/o error
	stx     %g0, [%g1 + %g3]                ! cpu.io_prot = 0
	HCALL_RET(EOK)

	! i/o error, clear io_error flag
2:
	ba      herr_ioerror
	stx     %g0, [%g1 + %g4]                ! cpu.io_error = 0
	SET_SIZE(hcall_io_poke)
#endif


/*
 * mach_exit
 *
 * arg0 exit code (%o0)
 * --
 * does not return
 */
	ENTRY_NP(hcall_mach_exit)
	/*
	 * - quiesce all other cpus in guest
	 * - re-initialize guest
	 * - go back to start so boot cpu (maybe not this cpu)
	 *   can reboot the guest or wait for further instructions
	 *   from the Higher One
	 */
#ifdef CONFIG_VBSC_SVC
	ba,pt   %xcc, vbsc_guest_exit
	nop
#else
	LEGION_EXIT(%o0)
#endif
	HCALL_RET(EBADTRAP)
	SET_SIZE(hcall_mach_exit)


/*
 * mach_sir
 *
 * --
 * does not return
 */
	ENTRY_NP(hcall_mach_sir)
	/*
	 * - quiesce all other cpus in guest
	 * - re-initialize guest
	 * - go back to start so boot cpu (maybe not this cpu)
	 *   can reboot the guest or wait for further instructions
	 *   from the Higher One
	 */
#ifdef CONFIG_VBSC_SVC
	ba,pt   %xcc, vbsc_guest_sir
	nop
#else
	LEGION_EXIT(0)
#endif
	HCALL_RET(EBADTRAP)
	SET_SIZE(hcall_mach_sir)


/*
 * mach_desc
 *
 * arg0 buffer (%o0)
 * arg1 len (%o1)
 * --
 * ret0 status (%o0)
 * ret1 actual len (%o1) (for EOK or EINVAL)
 *
 * guest uses this sequence to get the machine description:
 *      mach_desc(0, 0)
 *      if %o0 != EINVAL, failed
 *      len = %o1
 *      buf = allocate(len)
 *      mach_desc(buf, len)
 *      if %o0 != EOK, failed
 * so the EINVAL case is the first error check
 */
	ENTRY_NP(hcall_mach_desc)
	CPU_GUEST_STRUCT(%g1, %g6)
	set     GUEST_PD_SIZE, %g7
	ldx     [%g6 + %g7], %g3
	! paranoia for xcopy - should already be 16byte multiple
	add     %g3, MACH_DESC_ALIGNMENT - 1, %g3
	andn    %g3, MACH_DESC_ALIGNMENT - 1, %g3
	cmp     %g3, %o1
	bgu,pn  %xcc, herr_inval
	mov     %g3, %o1        ! return PD size for success or EINVAL

	btst    MACH_DESC_ALIGNMENT - 1, %o0
	bnz,pn  %xcc, herr_badalign
	.empty  /* RANGE_CHECK may start in a delay slot */

	RANGE_CHECK(%g6, %o0, %g3, herr_noraddr, %g4)
	REAL_OFFSET(%g6, %o0, %g4, %g5)
	! %g3 = size of pd
	! %g4 = pa of guest buffer
	/* xcopy(pd, buf[%o0], size[%g3]) */
	set     GUEST_PD_PA, %g7
	ldx     [%g6 + %g7], %g1
	mov     %g4, %g2
	ba      xcopy
	rd      %pc, %g7

	! %o1 was set above to the guest's PD size
	HCALL_RET(EOK)
	SET_SIZE(hcall_mach_desc)


/*
 * tod_get - Time-of-day get
 *
 * no arguments
 * --
 * ret0 status (%o0)
 * ret1 tod (%o1)
 */
	ENTRY_NP(hcall_tod_get)
	CPU_STRUCT(%g1)
	CPU2ROOT_STRUCT(%g1, %g2)
	CPU2GUEST_STRUCT(%g1, %g1)
	!! %g1 guestp
	!! %g2 configp
	ldx     [%g1 + GUEST_TOD_OFFSET], %g3
	ldx     [%g2 + CONFIG_TOD], %g4
	ldx     [%g2 + CONFIG_TODFREQUENCY], %g5
	!! %g3 guest's tod offset
	!! %g4 tod
	!! %g5 tod frequency
#ifdef CONFIG_STATICTOD
	! If the PD says no TOD then start with 0
	brz,pn  %g4, hret_ok
	  clr   %o1
#else
	brz,pn  %g4, herr_notsupported
	  clr   %o1             ! In case error status not checked
#endif

	ldx     [%g4], %o1
	udivx   %o1, %g5, %o1   ! Convert to seconds
	add     %o1, %g3, %o1   ! Add partition's tod offset
	HCALL_RET(EOK)
	SET_SIZE(hcall_tod_get)

/*
 * tod_set - Time-of-day set
 *
 * arg0 tod (%o0)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_tod_set)
	CPU_STRUCT(%g1)
	CPU2ROOT_STRUCT(%g1, %g2)
	CPU2GUEST_STRUCT(%g1, %g1)
	!! %g1 guestp
	!! %g2 configp
	ldx     [%g1 + GUEST_TOD_OFFSET], %g3
	ldx     [%g2 + CONFIG_TOD], %g4
	ldx     [%g2 + CONFIG_TODFREQUENCY], %g5
	!! %g3 guest's tod offset
	!! %g4 tod
	!! %g5 tod frequency

#ifdef CONFIG_STATICTOD
	/*
	 * If no hardware TOD then tod-get returned 0 the first time
	 * and will continue to do so.
	 */
	brz,pn  %g4, hret_ok
	  nop
#else
	brz,pn  %g4, herr_notsupported
	  nop
#endif

	ldx     [%g4], %g6      ! %g6 = system tod
	udivx   %g6, %g5, %g6   ! Convert to seconds
	sub     %o0, %g6, %g6   ! %g4 = new delta
	stx     %g6, [%g1 + GUEST_TOD_OFFSET]
	HCALL_RET(EOK)
	SET_SIZE(hcall_tod_set)


/*
 * mmu_enable
 *
 * arg0 enable (%o0)
 * arg1 return address (%o1)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_mmu_enable)
	/*
	 * Check requested return address for instruction
	 * alignment
	 */
	btst    (INSTRUCTION_ALIGNMENT - 1), %o1
	bnz,pn  %xcc, herr_badalign
	nop

	ldxa    [%g0]ASI_LSUCR, %g1
	set     (LSUCR_DM | LSUCR_IM), %g2
	!! %g1 = current lsucr value
	!! %g2 = mmu enable mask

	brz,pn  %o0, 1f         ! enable or disable?
	btst    %g1, %g2        ! ccr indicates current status

	/*
	 * Trying to enable
	 *
	 * The return address will be virtual and we cannot
	 * check its range, the alignment has already been
	 * checked.
	 */
	bnz,pn  %xcc, herr_inval ! it's already enabled
	or      %g1, %g2, %g1   ! enable MMU

	ba,pt   %xcc, 2f
	nop

1:
	/*
	 * Trying to disable
	 *
	 * The return address is a real address so we check
	 * its range, the alignment has already been checked.
	 */
	bz,pn   %xcc, herr_inval ! it's already disabled
	andn    %g1, %g2, %g1   ! disable MMU

	/* Check RA range */
	GUEST_STRUCT(%g3)
	RANGE_CHECK(%g3, %o1, INSTRUCTION_SIZE, herr_noraddr, %g4)

2:
	wrpr    %o1, %tnpc
	stxa    %g1, [%g0]ASI_LSUCR
	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_enable)


/*
 * mmu_fault_area_conf
 *
 * arg0 raddr (%o0)
 * --
 * ret0 status (%o0)
 * ret1 oldraddr (%o1)
 */
	ENTRY_NP(hcall_mmu_fault_area_conf)
	btst    (MMU_FAULT_AREA_ALIGNMENT - 1), %o0     ! check alignment
	bnz,pn  %xcc, herr_badalign
	CPU_GUEST_STRUCT(%g1, %g4)
	brz,a,pn %o0, 1f
	  mov   0, %g2
	RANGE_CHECK(%g4, %o0, MMU_FAULT_AREA_SIZE, herr_noraddr, %g3)
	REAL_OFFSET(%g4, %o0, %g2, %g3)
1:
	ldx     [%g1 + CPU_MMU_AREA_RA], %o1
	stx     %o0, [%g1 + CPU_MMU_AREA_RA]
	stx     %g2, [%g1 + CPU_MMU_AREA]

	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_fault_area_conf)

/*
 * mmu_fault_area_info
 *
 * --
 * ret0 status (%o0)
 * ret1 fault area raddr (%o1)
 */
	ENTRY_NP(hcall_mmu_fault_area_info)
	CPU_STRUCT(%g1)
	ldx     [%g1 + CPU_MMU_AREA_RA], %o1
	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_fault_area_info)

/*
 * mmu_tsb_ctx0
 *
 * arg0 ntsb (%o0)
 * arg1 tsbs (%o1)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_mmu_tsb_ctx0)
	CPU_GUEST_STRUCT(%g5, %g6)
	INC_MMU_STAT(%g5, MMUSTAT_SET0, %g2, %g3)
	/* set cpu->ntsbs to zero now in case we error exit */
	stx     %g0, [%g5 + CPU_NTSBS_CTX0]
	/* Also zero out H/W bases */
	ba      set_dummytsb_ctx0
	rd      %pc, %g7
	brz,pn  %o0, setntsbs0
	cmp     %o0, MAX_NTSB
	bgu,pn  %xcc, herr_inval
	btst    TSBD_ALIGNMENT - 1, %o1
	bnz,pn  %xcc, herr_badalign
	sllx    %o0, TSBD_SHIFT, %g3
	RANGE_CHECK(%g6, %o1, %g3, herr_noraddr, %g2)
	/* xcopy(tsbs, cpu->tsbds, ntsbs*TSBD_BYTES) */
	REAL_OFFSET(%g6, %o1, %g1, %g2)
	add     %g5, CPU_TSBDS_CTX0, %g2
	! xcopy trashes g1-4
	ba      xcopy
	rd      %pc, %g7
	/* loop over each TSBD and validate */
	mov     %o0, %g1
	add     %g5, CPU_TSBDS_CTX0, %g2
1:
	/* check pagesize - accept any size encoding? XXX */
	/* XXX pageszidx is lowest-order bit of pageszmask */
	lduh    [%g2 + TSBD_IDXPGSZ_OFF], %g3
	cmp     %g3, NPGSZ
	bgeu,pn %xcc, herr_badpgsz
	nop
	/* check associativity - only support 1-way */
	lduh    [%g2 + TSBD_ASSOC_OFF], %g3
	cmp     %g3, 1
	bne,pn  %icc, herr_badtsb
	nop
	/* check TSB size */
	ld      [%g2 + TSBD_SIZE_OFF], %g3
	sub     %g3, 1, %g4
	btst    %g3, %g4
	bnz,pn  %icc, herr_badtsb
	mov     TSB_SZ0_ENTRIES, %g4
	cmp     %g3, %g4
	blt,pn  %icc, herr_badtsb
	sll     %g4, TSB_MAX_SZCODE, %g4
	cmp     %g3, %g4
	bgt,pn  %icc, herr_badtsb
	nop
	/* check context index field - must be -1 (shared) or zero */
	ld      [%g2 + TSBD_CTX_INDEX], %g3
	cmp     %g3, TSBD_CTX_IDX_SHARE
	be      %icc, 2f        ! -1 is OK
	nop
	brnz,pn %g3, herr_inval ! only one set of context regs
	nop
2:
	/* check reserved field - must be zero for now */
	ldx     [%g2 + TSBD_RSVD_OFF], %g3
	brnz,pn %g3, herr_inval
	nop
	/* check TSB base real address */
	ldx     [%g2 + TSBD_BASE_OFF], %g3
	ld      [%g2 + TSBD_SIZE_OFF], %g4
	sllx    %g4, TSBE_SHIFT, %g4
	RANGE_CHECK(%g6, %g3, %g4, herr_noraddr, %g7)
	/* range OK, check alignment */
	sub     %g4, 1, %g4
	btst    %g3, %g4
	bnz,pn  %xcc, herr_badalign
	sub     %g1, 1, %g1
	brnz,pt %g1, 1b
	add     %g2, TSBD_BYTES, %g2

#ifdef  N2
	/* now setup HWTW regs */
	/* XXX - only look at first two TSBDs for now */
	/* XXX - setup use_context if TSBD context not shared or zero */

	/* process first TSBD */
	add     %g5, CPU_TSBDS_CTX0, %g2
	ldx     [%g2 + TSBD_BASE_OFF], %g1
	REAL_OFFSET(%g6, %g1, %g1, %g4)         ! start with TSB base PA

	ld      [%g2 + TSBD_SIZE_OFF], %g4
	srl     %g4, TSB_SZ0_SHIFT, %g4
1:
	btst    1, %g4
	srl     %g4, 1, %g4
	bz,a,pt %icc, 1b
	  add   %g1, 1, %g1                     ! increment TSB size field

	lduh    [%g2 + TSBD_IDXPGSZ_OFF], %g4
	sll     %g4, TSB_CFG_PGSZ_SHIFT, %g4
	or      %g1, %g4, %g1                   ! add page size field
	or      %g1, TSB_CFG_RA_NOT_PA, %g1     ! add RA not PA bit
	mov     1, %g4
	sllx    %g4, 63, %g4
	or      %g1, %g4, %g1                   ! add valid bit

	mov     TSB_CFG_CTX0_0, %g4
	stxa    %g1, [%g4]ASI_MMU_TSB

	/* process second TSBD, if available */
	cmp     %o0, 1
	be,pt   %xcc, 2f
	add     %g2, TSBD_BYTES, %g2            ! move to next TSBD
	ldx     [%g2 + TSBD_BASE_OFF], %g1
	REAL_OFFSET(%g6, %g1, %g1, %g4)         ! start with TSB base PA
	ld      [%g2 + TSBD_SIZE_OFF], %g4
	srl     %g4, TSB_SZ0_SHIFT, %g4
1:
	btst    1, %g4
	srl     %g4, 1, %g4
	bz,a,pt %icc, 1b
	  add   %g1, 1, %g1                     ! increment TSB size field

	lduh    [%g2 + TSBD_IDXPGSZ_OFF], %g4
	sll     %g4, TSB_CFG_PGSZ_SHIFT, %g4
	or      %g1, %g4, %g1                   ! add page size field
	or      %g1, TSB_CFG_RA_NOT_PA, %g1     ! add RA not PA bit
	mov     1, %g4
	sllx    %g4, 63, %g4
	or      %g1, %g4, %g1                   ! add valid bit

	mov     TSB_CFG_CTX0_1, %g4
	stxa    %g1, [%g4]ASI_MMU_TSB
2:
	stx     %o0, [%g5 + CPU_NTSBS_CTX0]
#else   /* N2 */
	/* now setup H/W TSB regs */
	/* only look at first two TSBDs for now */
	add     %g5, CPU_TSBDS_CTX0, %g2
	ldx     [%g2 + TSBD_BASE_OFF], %g1
	REAL_OFFSET(%g6, %g1, %g1, %g4)
	ld      [%g2 + TSBD_SIZE_OFF], %g4
	srl     %g4, TSB_SZ0_SHIFT, %g4
1:
	btst    1, %g4
	srl     %g4, 1, %g4
	bz,a,pt %icc, 1b
	  add   %g1, 1, %g1     ! increment TSB size field

	stxa    %g1, [%g0]ASI_DTSBBASE_CTX0_PS0
	stxa    %g1, [%g0]ASI_ITSBBASE_CTX0_PS0

	lduh    [%g2 + TSBD_IDXPGSZ_OFF], %g3
	stxa    %g3, [%g0]ASI_DTSB_CONFIG_CTX0 ! (PS0 only)
	stxa    %g3, [%g0]ASI_ITSB_CONFIG_CTX0 ! (PS0 only)

	/* process second TSBD, if available */
	cmp     %o0, 1
	be,pt   %xcc, 2f
	add     %g2, TSBD_BYTES, %g2    ! move to next TSBD
	ldx     [%g2 + TSBD_BASE_OFF], %g1
	REAL_OFFSET(%g6, %g1, %g1, %g4)
	ld      [%g2 + TSBD_SIZE_OFF], %g4
	srl     %g4, TSB_SZ0_SHIFT, %g4
1:
	btst    1, %g4
	srl     %g4, 1, %g4
	bz,a,pt %icc, 1b
	  add   %g1, 1, %g1     ! increment TSB size field

	stxa    %g1, [%g0]ASI_DTSBBASE_CTX0_PS1
	stxa    %g1, [%g0]ASI_ITSBBASE_CTX0_PS1

	/* %g3 still has old CONFIG value. */
	lduh    [%g2 + TSBD_IDXPGSZ_OFF], %g7
	sllx    %g7, ASI_TSB_CONFIG_PS1_SHIFT, %g7
	or      %g3, %g7, %g3
	stxa    %g3, [%g0]ASI_DTSB_CONFIG_CTX0 ! (PS0 + PS1)
	stxa    %g3, [%g0]ASI_ITSB_CONFIG_CTX0 ! (PS0 + PS1)

2:
	stx     %o0, [%g5 + CPU_NTSBS_CTX0]
#endif  /* N2 */
setntsbs0:
	clr     %o1     ! no return value
	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_tsb_ctx0)


/*
 * mmu_tsb_ctxnon0
 *
 * arg0 ntsb (%o0)
 * arg1 tsbs (%o1)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_mmu_tsb_ctxnon0)
	CPU_GUEST_STRUCT(%g5, %g6)
	INC_MMU_STAT(%g5, MMUSTAT_SETN0, %g2, %g3)
	/* set cpu->ntsbs to zero now in case we error exit */
	stx     %g0, [%g5 + CPU_NTSBS_CTXN]
	/* Also zero out H/W bases */
	ba      set_dummytsb_ctxN
	rd      %pc, %g7
	brz,pn  %o0, setntsbsN
	cmp     %o0, MAX_NTSB
	bgu,pn  %xcc, herr_inval
	btst    TSBD_ALIGNMENT - 1, %o1
	bnz,pn  %xcc, herr_badalign
	sllx    %o0, TSBD_SHIFT, %g3
	RANGE_CHECK(%g6, %o1, %g3, herr_noraddr, %g2)
	/* xcopy(tsbs, cpu->tsbds, ntsbs*TSBD_BYTES) */
	REAL_OFFSET(%g6, %o1, %g1, %g2)
	add     %g5, CPU_TSBDS_CTXN, %g2
	! xcopy trashes g1-4
	ba      xcopy
	rd      %pc, %g7
	/* loop over each TSBD and validate */
	mov     %o0, %g1
	add     %g5, CPU_TSBDS_CTXN, %g2
1:
	/* check pagesize - accept any size encoding? XXX */
	/* XXX pageszidx is lowest-order bit of pageszmask */
	lduh    [%g2 + TSBD_IDXPGSZ_OFF], %g3
	cmp     %g3, NPGSZ
	bgeu,pn %xcc, herr_badpgsz
	nop
	/* check associativity - only support 1-way */
	lduh    [%g2 + TSBD_ASSOC_OFF], %g3
	cmp     %g3, 1
	bne,pn  %icc, herr_badtsb
	nop
	/* check TSB size */
	ld      [%g2 + TSBD_SIZE_OFF], %g3
	sub     %g3, 1, %g4
	btst    %g3, %g4
	bnz,pn  %icc, herr_badtsb
	mov     TSB_SZ0_ENTRIES, %g4
	cmp     %g3, %g4
	blt,pn  %icc, herr_badtsb
	sll     %g4, TSB_MAX_SZCODE, %g4
	cmp     %g3, %g4
	bgt,pn  %icc, herr_badtsb
	nop
	/* check context index field - must be -1 (shared) or zero */
	ld      [%g2 + TSBD_CTX_INDEX], %g3
	cmp     %g3, TSBD_CTX_IDX_SHARE
	be      %icc, 2f        ! -1 is OK
	nop
	brnz,pn %g3, herr_inval ! only one set of context regs
	nop
2:
	/* check reserved field - must be zero for now */
	ldx     [%g2 + TSBD_RSVD_OFF], %g3
	brnz,pn %g3, herr_inval
	nop
	/* check TSB base real address */
	ldx     [%g2 + TSBD_BASE_OFF], %g3
	ld      [%g2 + TSBD_SIZE_OFF], %g4
	sllx    %g4, TSBE_SHIFT, %g4
	RANGE_CHECK(%g6, %g3, %g4, herr_noraddr, %g7)
	/* range OK, check alignment */
	sub     %g4, 1, %g4
	btst    %g3, %g4
	bnz,pn  %xcc, herr_badalign
	sub     %g1, 1, %g1
	brnz,pt %g1, 1b
	add     %g2, TSBD_BYTES, %g2

#ifdef  N2
	/* now setup HWTW regs */
	/* XXX - only look at first two TSBDs for now */
	/* XXX - setup use_context if TSBD context not shared or zero */

	/* process first TSBD */
	add     %g5, CPU_TSBDS_CTXN, %g2
	ldx     [%g2 + TSBD_BASE_OFF], %g1
	REAL_OFFSET(%g6, %g1, %g1, %g4)         ! start with TSB base PA

	ld      [%g2 + TSBD_SIZE_OFF], %g4
	srl     %g4, TSB_SZ0_SHIFT, %g4
1:
	btst    1, %g4
	srl     %g4, 1, %g4
	bz,a,pt %icc, 1b
	  add   %g1, 1, %g1                     ! increment TSB size field

	lduh    [%g2 + TSBD_IDXPGSZ_OFF], %g4
	sll     %g4, TSB_CFG_PGSZ_SHIFT, %g4
	or      %g1, %g4, %g1                   ! add page size field
	or      %g1, TSB_CFG_RA_NOT_PA, %g1     ! add RA not PA bit
	mov     1, %g4
	sllx    %g4, 63, %g4
	or      %g1, %g4, %g1                   ! add valid bit

	mov     TSB_CFG_CTXN_0, %g4
	stxa    %g1, [%g4]ASI_MMU_TSB

	/* process second TSBD, if available */
	cmp     %o0, 1
	be,pt   %xcc, 2f
	add     %g2, TSBD_BYTES, %g2            ! move to next TSBD
	ldx     [%g2 + TSBD_BASE_OFF], %g1
	REAL_OFFSET(%g6, %g1, %g1, %g4)         ! start with TSB base PA
	ld      [%g2 + TSBD_SIZE_OFF], %g4
	srl     %g4, TSB_SZ0_SHIFT, %g4
1:
	btst    1, %g4
	srl     %g4, 1, %g4
	bz,a,pt %icc, 1b
	  add   %g1, 1, %g1                     ! increment TSB size field

	lduh    [%g2 + TSBD_IDXPGSZ_OFF], %g4
	sll     %g4, TSB_CFG_PGSZ_SHIFT, %g4
	or      %g1, %g4, %g1                   ! add page size field
	or      %g1, TSB_CFG_RA_NOT_PA, %g1     ! add RA not PA bit
	mov     1, %g4
	sllx    %g4, 63, %g4
	or      %g1, %g4, %g1                   ! add valid bit

	mov     TSB_CFG_CTXN_1, %g4
	stxa    %g1, [%g4]ASI_MMU_TSB
2:
	stx     %o0, [%g5 + CPU_NTSBS_CTXN]
#else   /* N2 */
	/* now setup H/W TSB regs */
	/* only look at first two TSBDs for now */
	add     %g5, CPU_TSBDS_CTXN, %g2
	ldx     [%g2 + TSBD_BASE_OFF], %g1
	REAL_OFFSET(%g6, %g1, %g1, %g4)
	ld      [%g2 + TSBD_SIZE_OFF], %g4
	srl     %g4, TSB_SZ0_SHIFT, %g4
1:
	btst    1, %g4
	srl     %g4, 1, %g4
	bz,a,pt %icc, 1b
	  add   %g1, 1, %g1     ! increment TSB size field

	stxa    %g1, [%g0]ASI_DTSBBASE_CTXN_PS0
	stxa    %g1, [%g0]ASI_ITSBBASE_CTXN_PS0

	lduh    [%g2 + TSBD_IDXPGSZ_OFF], %g3
	stxa    %g3, [%g0]ASI_DTSB_CONFIG_CTXN ! (PS0 only)
	stxa    %g3, [%g0]ASI_ITSB_CONFIG_CTXN ! (PS0 only)

	/* process second TSBD, if available */
	cmp     %o0, 1
	be,pt   %xcc, 2f
	add     %g2, TSBD_BYTES, %g2    ! move to next TSBD
	ldx     [%g2 + TSBD_BASE_OFF], %g1
	REAL_OFFSET(%g6, %g1, %g1, %g4)
	ld      [%g2 + TSBD_SIZE_OFF], %g4
	srl     %g4, TSB_SZ0_SHIFT, %g4
1:
	btst    1, %g4
	srl     %g4, 1, %g4
	bz,a,pt %icc, 1b
	  add   %g1, 1, %g1     ! increment TSB size field

	stxa    %g1, [%g0]ASI_DTSBBASE_CTXN_PS1
	stxa    %g1, [%g0]ASI_ITSBBASE_CTXN_PS1

	/* %g3 still has old CONFIG value. */
	lduh    [%g2 + TSBD_IDXPGSZ_OFF], %g7
	sllx    %g7, ASI_TSB_CONFIG_PS1_SHIFT, %g7
	or      %g3, %g7, %g3
	stxa    %g3, [%g0]ASI_DTSB_CONFIG_CTXN ! (PS0 + PS1)
	stxa    %g3, [%g0]ASI_ITSB_CONFIG_CTXN ! (PS0 + PS1)

2:
	stx     %o0, [%g5 + CPU_NTSBS_CTXN]
#endif  /* N2 */
setntsbsN:
	clr     %o1     ! no return value
	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_tsb_ctxnon0)


/*
 * mmu_tsb_ctx0_info
 *
 * arg0 maxtsbs (%o0)
 * arg1 tsbs (%o1)
 * --
 * ret0 status (%o0)
 * ret1 ntsbs (%o1)
 */
	ENTRY_NP(hcall_mmu_tsb_ctx0_info)
	CPU_GUEST_STRUCT(%g5, %g6)
	!! %g5 cpup
	!! %g6 guestp

	! actual ntsbs always returned in %o1, so save tsbs now
	mov     %o1, %g4
	! Check to see if ntsbs fits into the supplied buffer
	ldx     [%g5 + CPU_NTSBS_CTX0], %o1
	brz,pn  %o1, hret_ok
	cmp     %o1, %o0
	bgu,pn  %xcc, herr_inval
	nop

	btst    TSBD_ALIGNMENT - 1, %g4
	bnz,pn  %xcc, herr_badalign
	sllx    %o1, TSBD_SHIFT, %g3
	!! %g3 size of tsbd in bytes
	RANGE_CHECK(%g6, %g4, %g3, herr_noraddr, %g2)
	REAL_OFFSET(%g6, %g4, %g2, %g1)
	!! %g2 pa of buffer
	!! xcopy(cpu->tsbds, buffer, ntsbs*TSBD_BYTES)
	add     %g5, CPU_TSBDS_CTX0, %g1
	!! clobbers %g1-%g4
	ba      xcopy
	rd      %pc, %g7

	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_tsb_ctx0_info)


/*
 * mmu_tsb_ctxnon0_info
 *
 * arg0 maxtsbs (%o0)
 * arg1 tsbs (%o1)
 * --
 * ret0 status (%o0)
 * ret1 ntsbs (%o1)
 */
	ENTRY_NP(hcall_mmu_tsb_ctxnon0_info)
	CPU_GUEST_STRUCT(%g5, %g6)
	!! %g5 cpup
	!! %g6 guestp

	! actual ntsbs always returned in %o1, so save tsbs now
	mov     %o1, %g4
	! Check to see if ntsbs fits into the supplied buffer
	ldx     [%g5 + CPU_NTSBS_CTXN], %o1
	brz,pn  %o1, hret_ok
	cmp     %o1, %o0
	bgu,pn  %xcc, herr_inval
	nop

	btst    TSBD_ALIGNMENT - 1, %g4
	bnz,pn  %xcc, herr_badalign
	sllx    %o1, TSBD_SHIFT, %g3
	!! %g3 size of tsbd in bytes
	RANGE_CHECK(%g6, %g4, %g3, herr_noraddr, %g2)
	REAL_OFFSET(%g6, %g4, %g2, %g1)
	!! %g2 pa of buffer
	!! xcopy(cpu->tsbds, buffer, ntsbs*TSBD_BYTES)
	add     %g5, CPU_TSBDS_CTXN, %g1
	!! clobbers %g1-%g4
	ba      xcopy
	rd      %pc, %g7

	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_tsb_ctxnon0_info)


#ifdef MMU_STATS
/*
 * mmu_stat_area
 *
 * arg0 raddr (%o0)
 * arg1 size (%o1) (bytes)
 * --
 * ret0 status (%o0)
 * ret1 oldraddr (%o1)
 */
	ENTRY_NP(hcall_mmu_stat_area)
	btst    (MMU_STAT_ALIGNMENT - 1), %o0   ! check alignment
	bnz,pn  %xcc, herr_badalign
	cmp     %o1, MMU_STAT_SIZE
	blu,pn  %xcc, herr_inval
	CPU_GUEST_STRUCT(%g1, %g4)
	brz,a,pn %o0, 1f
	  clr   %g2
	RANGE_CHECK(%g4, %o0, %o1, herr_noraddr, %g3)
	REAL_OFFSET(%g4, %o0, %g2, %g3)
1:
	ldx     [%g1 + CPU_MMU_STATS_RA], %o1
	stx     %o0, [%g1 + CPU_MMU_STATS_RA]
	stx     %g2, [%g1 + CPU_MMU_STATS]

	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_stat_area)
#endif /* MMU_STATS */

/*
 * mmu_map_addr - stuff ttes directly into the tlbs
 *
 * arg0 vaddr (%o0)
 * arg1 ctx (%o1)
 * arg2 tte (%o2)
 * arg3 flags (%o3)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_mmu_map_addr)
	CPU_GUEST_STRUCT(%g1, %g6)

#ifdef STRICT_API
	CHECK_VA_CTX(%o0, %o1, herr_inval, %g2)
	CHECK_MMU_FLAGS(%o3, herr_inval)
#endif /* STRICT_API */

	! extract sz from tte
	TTE_SIZE(%o2, %g4, %g2, herr_badpgsz)
	sub     %g4, 1, %g5     ! %g5 page mask

	! extract ra from tte
	sllx    %o2, 64 - 40, %g2
	srlx    %g2, 64 - 40 + 13, %g2
	sllx    %g2, 13, %g2    ! %g2 real address
	xor     %o2, %g2, %g3   ! %g3 orig tte with ra field zeroed
	andn    %g2, %g5, %g2
	RANGE_CHECK(%g6, %g2, %g4, 3f, %g5)
	REAL_OFFSET(%g6, %g2, %g2, %g4)
4:      or      %g3, %g2, %g1   ! %g1 new tte with pa

#ifndef STRICT_API
#endif  /* umm, N2HACK? */
	set     (NCTXS - 1), %g3
	and     %o1, %g3, %o1
	andn    %o0, %g3, %o0
#ifdef  N2HACKS /* umm, N2HACK? */
#endif /* STRICT_API */
	or      %o0, %o1, %g2   ! %g2 tag
	mov     MMU_TAG_ACCESS, %g3 ! %g3 tag_access
#ifndef N2
	mov     1, %g4
	sllx    %g4, NI_TTE4V_L_SHIFT, %g4
	andn    %g1, %g4, %g1   ! %g1 tte (force clear lock bit)
#endif  /* N2 */
#ifdef MMU_STATS
	CPU_STRUCT(%g5)
	and     %o2, TTE_SZ_MASK, %g7
	sllx    %g7, 3, %g7             ! * _MMUSONE_MAPx_INCR
	brnz,a  %o1, 9f
	  add   %g7, MMUSTAT_I+_MMUSONE_MAPN0, %g7
	add     %g7, MMUSTAT_I+_MMUSONE_MAP0, %g7
9:
	INC_MMU_STAT(%g5, %g7, %g4, %g6)
	! XXXQ need to do MMUSTAT_D, check %o3
#endif /* MMU_STATS */
#ifndef N2
	set     TLB_IN_4V_FORMAT, %g5   ! %g5 sun4v-style tte selection
#endif  /* N2 */

	btst    MAP_DTLB, %o3
	bz      2f
	btst    MAP_ITLB, %o3

	stxa    %g2, [%g3]ASI_DMMU
	membar  #Sync
#ifdef  N2
	stxa    %g1, [%g0]ASI_DTLB_DATA_IN
#else   /* N2 */
	stxa    %g1, [%g5]ASI_DTLB_DATA_IN
#endif  /* N2 */
	! condition codes still set
2:      bz      1f
	nop

	stxa    %g2, [%g3]ASI_IMMU
	membar  #Sync
#ifdef  N2
	stxa    %g1, [%g0]ASI_ITLB_DATA_IN
#else   /* N2 */
	stxa    %g1, [%g5]ASI_ITLB_DATA_IN
#endif  /* N2 */

1:      HCALL_RET(EOK)

	! Check for I/O
3:
#ifdef CONFIG_IOBYPASS
	RANGE_CHECK_IO(%g6, %g2, %g4, 4b, 1f, %g1, %g5)
	ba,a    4b
#else
1:
	IN_RANGE(%g1, %g2, %g4, FIRE_A_BASE0, FIRE_A_OFFSET0, FIRE_A_SIZE0,
		1f, %g5, %g6)
	ba,pt   %xcc, 4b
	mov     %g4, %g2
1:
	IN_RANGE(%g1, %g2, %g4, FIRE_B_BASE0, FIRE_B_OFFSET0, FIRE_B_SIZE0,
		1f, %g5, %g6)
	ba,pt   %xcc, 4b
	mov     %g4, %g2
1:
	IN_RANGE(%g1, %g2, %g4, FIRE_A_BASE1, FIRE_A_OFFSET1, FIRE_A_SIZE1,
		1f, %g5, %g6)
	ba,pt   %xcc, 4b
	mov     %g4, %g2
1:
	IN_RANGE(%g1, %g2, %g4, FIRE_B_BASE1, FIRE_B_OFFSET1, FIRE_B_SIZE1,
		1f, %g5, %g6)
	ba,pt   %xcc, 4b
	mov     %g4, %g2
#endif /* CONFIG_IOBYPASS */
1:
	ba,a    herr_noraddr
	SET_SIZE(hcall_mmu_map_addr)


/*
 * mmu_unmap_addr
 *
 * arg0 vaddr (%o0)
 * arg1 ctx (%o1)
 * arg2 flags (%o2)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_mmu_unmap_addr)
#ifdef STRICT_API
	CHECK_VA_CTX(%o0, %o1, herr_inval, %g2)
	CHECK_MMU_FLAGS(%o2, herr_inval)
#endif /* STRICT_API */
	mov     MMU_PCONTEXT, %g1
	set     (NCTXS - 1), %g2        ! 8K page mask
	andn    %o0, %g2, %g2
	ldxa    [%g1]ASI_MMU, %g3 ! save current primary ctx
	stxa    %o1, [%g1]ASI_MMU ! switch to new ctx
	btst    MAP_ITLB, %o2
	bz,pn   %xcc, 1f
	  btst  MAP_DTLB, %o2
	stxa    %g0, [%g2]ASI_IMMU_DEMAP
1:      bz,pn   %xcc, 2f
	  nop
	stxa    %g0, [%g2]ASI_DMMU_DEMAP
2:      stxa    %g3, [%g1]ASI_MMU !  restore original primary ctx
	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_unmap_addr)


/*
 * mmu_demap_page
 *
 * arg0/1 cpulist (%o0/%o1)
 * arg2 vaddr (%o2)
 * arg3 ctx (%o3)
 * arg4 flags (%o4)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_mmu_demap_page)
	orcc    %o0, %o1, %g0
	bnz,pn  %xcc, herr_notsupported ! cpulist not yet supported
#ifdef STRICT_API
	nop
	CHECK_VA_CTX(%o2, %o3, herr_inval, %g2)
	CHECK_MMU_FLAGS(%o4, herr_inval)
#endif /* STRICT_API */
	mov     MMU_PCONTEXT, %g1
	set     (NCTXS - 1), %g2
	andn    %o2, %g2, %g2
	ldxa    [%g1]ASI_MMU, %g3
	stxa    %o3, [%g1]ASI_MMU
	btst    MAP_ITLB, %o4
	bz,pn   %xcc, 1f
	  btst  MAP_DTLB, %o4
	stxa    %g0, [%g2]ASI_IMMU_DEMAP
1:      bz,pn   %xcc, 2f
	  nop
	stxa    %g0, [%g2]ASI_DMMU_DEMAP
2:      stxa    %g3, [%g1]ASI_MMU ! restore primary ctx
	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_demap_page)


/*
 * hcall_mmu_demap_ctx
 *
 * arg0/1 cpulist (%o0/%o1)
 * arg2 ctx (%o2)
 * arg3 flags (%o3)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_mmu_demap_ctx)
	orcc    %o0, %o1, %g0
	bnz,pn  %xcc, herr_notsupported ! cpulist not yet supported
#ifdef STRICT_API
	nop
	CHECK_CTX(%o2, herr_inval, %g2)
	CHECK_MMU_FLAGS(%o3, herr_inval)
#endif /* STRICT_API */
	set     TLB_DEMAP_CTX_TYPE, %g3
	mov     MMU_PCONTEXT, %g2
	ldxa    [%g2]ASI_MMU, %g7
	stxa    %o2, [%g2]ASI_MMU
	btst    MAP_ITLB, %o3
	bz,pn   %xcc, 1f
	  btst  MAP_DTLB, %o3
	stxa    %g0, [%g3]ASI_IMMU_DEMAP
1:      bz,pn   %xcc, 2f
	  nop
	stxa    %g0, [%g3]ASI_DMMU_DEMAP
2:      stxa    %g7, [%g2]ASI_MMU ! restore primary ctx
	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_demap_ctx)


/*
 * hcall_mmu_demap_all
 *
 * arg0/1 cpulist (%o0/%o1)
 * arg2 flags (%o2)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_mmu_demap_all)
	orcc    %o0, %o1, %g0
	bnz,pn  %xcc, herr_notsupported ! cpulist not yet supported
#ifdef STRICT_API
	nop
	CHECK_MMU_FLAGS(%o2, herr_inval)
#endif /* STRICT_API */
	set     TLB_DEMAP_ALL_TYPE, %g3
	btst    MAP_ITLB, %o2
	bz,pn   %xcc, 1f
	  btst  MAP_DTLB, %o2
	stxa    %g0, [%g3]ASI_IMMU_DEMAP
1:      bz,pn   %xcc, 2f
	  nop
	stxa    %g0, [%g3]ASI_DMMU_DEMAP
2:      HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_demap_all)


#ifdef  N2
/*
 * mappings: pointer to current mappings, not modified
 * vaddr: not modified
 * tte: not modified
 * scr1, scr2 scr3, scr4: scratch
 */
#define UPDATE_PERM_MAPPINGS(mappings, vaddr, tte, scr1, scr2, scr3, scr4)      \
	.pushlocals                                                     ;\
	/* first, try searching for an existing entry */                ;\
	TTE_SHIFT_NOCHECK(tte, scr1, scr3)                              ;\
	srlx    vaddr, scr3, scr4       /* scr4 is current tag */       ;\
	mov     ((NPERMMAPPINGS - 1) * MAPPING_SIZE), scr1              ;\
1:                                                                      ;\
	add     mappings, scr1, scr2                                    ;\
	MUTEX_ENTER(scr2 + MAPPING_LOCK, scr3)                          ;\
	ldx     [scr2 + MAPPING_TTE], scr3                              ;\
	brgez,pn        scr3, 2f                                        ;\
	  ldx   [scr2 + MAPPING_TAG], scr3                              ;\
	cmp     scr4, scr3                                              ;\
	be,pn   %xcc, 3f                                                ;\
	  nop                                                           ;\
2:                                                                      ;\
	MUTEX_EXIT(scr2 + MAPPING_LOCK)                                 ;\
	subcc   scr1, MAPPING_SIZE, scr1                                ;\
	bgeu,pt %xcc, 1b                                                ;\
	  nop                                                           ;\
3:                                                                      ;\
	brlz,pn scr1, 4f                /* ? matching entry found */    ;\
	  nop                                                           ;\
	/* found a valid matching entry, update its refcnt */           ;\
	ld      [scr2 + MAPPING_REFCNT], scr3                           ;\
	inc     scr3                                                    ;\
	st      scr3, [scr2 + MAPPING_REFCNT]                           ;\
	MUTEX_EXIT(scr2 + MAPPING_LOCK)                                 ;\
	ba,a    9f                                                      ;\
4:                                                                      ;\
	/* second, try searching for a free entry */                    ;\
	mov     ((NPERMMAPPINGS - 1) * MAPPING_SIZE), scr1              ;\
5:                                                                      ;\
	add     mappings, scr1, scr2                                    ;\
	MUTEX_ENTER(scr2 + MAPPING_LOCK, scr3)                          ;\
	ldx     [scr2 + MAPPING_TTE], scr3                              ;\
	brgez,pn        scr3, 6f                                        ;\
	  nop                                                           ;\
	/* check tag, in case of parellel insert just update refcnt */  ;\
	ldx     [scr2 + MAPPING_TAG], scr3                              ;\
	cmp     scr4, scr3                                              ;\
	be,pn   %xcc, 3b                                                ;\
	  nop                                                           ;\
	MUTEX_EXIT(scr2 + MAPPING_LOCK)                                 ;\
	subcc   scr1, MAPPING_SIZE, scr1                                ;\
	bgeu,pt %xcc, 5b                                                ;\
	  nop                                                           ;\
6:                                                                      ;\
	brlz,pn scr1, herr_inval        /* ? free entry found */        ;\
	  nop                                                           ;\
	/* found a free entry, update its contents */                   ;\
	TTE_SHIFT_NOCHECK(tte, scr3, scr4)                              ;\
	srlx    vaddr, scr3, scr3                                       ;\
	stx     scr3, [scr2 + MAPPING_TAG]                              ;\
	stx     tte, [scr2 + MAPPING_TTE]                               ;\
	mov     1, scr3                                                 ;\
	st      scr3, [scr2 + MAPPING_REFCNT]                           ;\
	MUTEX_EXIT(scr2 + MAPPING_LOCK)                                 ;\
9:                                                                      ;\
	.poplocals                                                      ;

#endif  /* N2 */

/*
 * mmu_map_perm_addr
 *
 * arg0 vaddr (%o0)
 * arg1 context (%o1)  must be zero
 * arg2 tte (%o2)
 * arg3 flags (%o3)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_mmu_map_perm_addr)
	brnz,pn %o1, herr_inval
	CPU_GUEST_STRUCT(%g1, %g6)

	CHECK_VA_CTX(%o0, %o1, herr_inval, %g2)
	CHECK_MMU_FLAGS(%o3, herr_inval)

	! extract sz from tte
	TTE_SIZE(%o2, %g4, %g2, herr_badpgsz)
	sub     %g4, 1, %g5     ! %g5 page mask

	! extract ra from tte
	sllx    %o2, 64 - 40, %g2
	srlx    %g2, 64 - 40 + 13, %g2
	sllx    %g2, 13, %g2    ! %g2 real address
	xor     %o2, %g2, %g3   ! %g3 orig tte with ra field zeroed
	andn    %g2, %g5, %g2
	RANGE_CHECK(%g6, %g2, %g4, herr_noraddr, %g5)
	REAL_OFFSET(%g6, %g2, %g2, %g4)
	or      %g3, %g2, %g2   ! %g2 new tte with pa XXXshould be %g1

#ifndef N2HACKS
#if 1 /* XXX */
	/*
	 * need to track the mappings, keep track of which cpus have
	 * the same mapping, demap on each core when all strands on
	 * that core have unmapped it
	 */

	/* Search for existing perm mapping */
	add     %g6, GUEST_PERM_MAPPINGS, %g1
	mov     ((NPERMMAPPINGS - 1) * MAPPING_SIZE), %g3
	mov     %g0, %g6
	add     %g1, %g3, %g4
5:
	ldx     [%g4 + MAPPING_TTE], %g5
	brlz,pn %g5, 6f
	nop
	mov     %g4, %g6        ! %g6 = last free offset
7:      subcc   %g3, MAPPING_SIZE, %g3
	bgeu,pt %xcc, 5b
	add     %g1, %g3, %g4

	/* End-of-loop */
	brz,pn  %g6, herr_toomany       ! No free entry found
	nop

	stx     %o0, [%g6 + MAPPING_VA]
	stx     %o2, [%g6 + MAPPING_TTE]
	ba,pt   %xcc, 8f
	stx     %o3, [%g6 + MAPPING_FLAGS]

6:      /* found a valid mapping, check tag */
	ldx     [%g4 + MAPPING_VA], %g5
	cmp     %g5, %o0
	bne,pt  %xcc, 7b
	nop

	/* i-and/or-d? */
	ldx     [%g4 + MAPPING_FLAGS], %g5
	or      %g5, %o3, %g5
	stx     %g5, [%g4 + MAPPING_FLAGS]
8:
#endif /* XXX */
#endif  /* N2HACKS */

#ifdef  N2
	btst    MAP_ITLB, %o3
	bz,pn   %xcc, 1f
	  nop
	CPU2CORE_STRUCT(%g1, %g6)
	add     %g6, CORE_PERM_I_MAPPINGS, %g6
	UPDATE_PERM_MAPPINGS(%g6, %o0, %g2, %g3, %g4, %g5, %g7)
1:
	btst    MAP_DTLB, %o3
	bz,pn   %xcc, 2f
	  nop
	CPU2CORE_STRUCT(%g1, %g6)
	add     %g6, CORE_PERM_D_MAPPINGS, %g6
	UPDATE_PERM_MAPPINGS(%g6, %o0, %g2, %g3, %g4, %g5, %g7)
2:
#endif  /* N2 */

	mov     %g2, %g1        ! XXX
	set     (NCTXS - 1), %g2
	andn    %o0, %g2, %g2
	mov     MMU_TAG_ACCESS, %g3
#ifndef N2
	mov     1, %g4
	sllx    %g4, NI_TTE4V_L_SHIFT, %g4
	or      %g1, %g4, %g1   ! add lock bit
#endif  /* N2 */
#ifdef MMU_STATS
	CPU_STRUCT(%g5)
	and     %o2, TTE_SZ_MASK, %g7
	sllx    %g7, 3, %g7             ! * _MMUSONE_MAPx_INCR
	brnz,a  %o1, 9f
	  add   %g7, MMUSTAT_I+_MMUSONE_MAPN0, %g7
	add     %g7, MMUSTAT_I+_MMUSONE_MAP0, %g7
9:
	INC_MMU_STAT(%g5, %g7, %g4, %g6)
	! XXXQ need to do MMUSTAT_D, check %o3
	! XXXQ separate counts for perm?
#endif /* MMU_STATS */
#ifndef N2
	set     TLB_IN_4V_FORMAT, %g5   ! sun4v-style tte selection
#endif  /* N2 */

	btst    MAP_ITLB, %o3
	bz,pn   %xcc, 1f
	  btst  MAP_DTLB, %o3
	stxa    %g2, [%g3]ASI_IMMU
	membar  #Sync
#ifdef  N2
	stxa    %g1, [%g0]ASI_ITLB_DATA_IN
#else   /* N2 */
	stxa    %g1, [%g5]ASI_ITLB_DATA_IN
#endif  /* N2 */
	membar  #Sync
	! condition codes still set
1:      bz,pn   %xcc, 2f
	  nop
	stxa    %g2, [%g3]ASI_DMMU
	membar  #Sync
#ifdef  N2
	stxa    %g1, [%g0]ASI_DTLB_DATA_IN
#else   /* N2 */
	stxa    %g1, [%g5]ASI_DTLB_DATA_IN
#endif  /* N2 */
	membar  #Sync
2:
	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_map_perm_addr)


#ifdef  N2
/*
 * mappings: pointer to current mappings, not modified
 * vaddr: not modified
 * scr1, scr2, scr3, scr4: scratch
 */
#define UNMAP_PERM_MAPPINGS(mappings, vaddr, scr1, scr2, scr3, scr4)            \
	/* XXX - ignore context */                                      ;\
	.pushlocals                                                     ;\
	mov     ((NPERMMAPPINGS - 1) * MAPPING_SIZE), scr1              ;\
1:                                                                      ;\
	add     mappings, scr1, scr2                                    ;\
	MUTEX_ENTER(scr2 + MAPPING_LOCK, scr3)                          ;\
	ldx     [scr2 + MAPPING_TTE], scr3                              ;\
	brgez,pn        scr3, 2f                                        ;\
	  nop                                                           ;\
	TTE_SHIFT_NOCHECK(scr3, scr2, scr4)                             ;\
	srlx    vaddr, scr2, scr4                                       ;\
	add     mappings, scr1, scr2                                    ;\
	ldx     [scr2 + MAPPING_TAG], scr3                              ;\
	cmp     scr4, scr3                                              ;\
	be,pn   %xcc, 3f                                                ;\
	  nop                                                           ;\
2:                                                                      ;\
	MUTEX_EXIT(scr2 + MAPPING_LOCK)                                 ;\
	subcc   scr1, MAPPING_SIZE, scr1                                ;\
	bgeu,pt %xcc, 1b                                                ;\
	  nop                                                           ;\
3:                                                                      ;\
	brlz,pn scr1, herr_nomap        /* ? matching entry found */    ;\
	  nop                                                           ;\
	ld      [scr2 + MAPPING_REFCNT], scr3                           ;\
	deccc   scr3                                                    ;\
	bnz     %icc, 4f                                                ;\
	  st    scr3, [scr2 + MAPPING_REFCNT]                           ;\
	stx     %g0, [scr2 + MAPPING_TTE]                               ;\
4:                                                                      ;\
	MUTEX_EXIT(scr2 + MAPPING_LOCK)                                 ;\
	.poplocals                                                      ;

#endif  /* N2 */

/*
 * mmu_unmap_perm_addr
 *
 * arg0 vaddr (%o0)
 * arg1 ctx (%o1)
 * arg2 flags (%o2)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_mmu_unmap_perm_addr)
	CHECK_VA_CTX(%o0, %o1, herr_inval, %g2)
	CHECK_MMU_FLAGS(%o2, herr_inval)
#if 0 /* XXX Need to update the list of perm mappings */
	! if no mapping found, return ENOMAP
#endif
#ifdef  N2
	btst    MAP_ITLB, %o2
	bz,pn   %xcc, 1f
	  nop
	CORE_STRUCT(%g6)
	add     %g6, CORE_PERM_I_MAPPINGS, %g6
	UNMAP_PERM_MAPPINGS(%g6, %o0, %g1, %g3, %g4, %g5)
1:      btst    MAP_DTLB, %o2
	bz,pn   %xcc, 2f
	  nop
	CORE_STRUCT(%g6)
	add     %g6, CORE_PERM_D_MAPPINGS, %g6
	UNMAP_PERM_MAPPINGS(%g6, %o0, %g1, %g3, %g4, %g5)
2:
#endif  /* N2 */
	mov     MMU_PCONTEXT, %g1
	set     (NCTXS - 1), %g2        ! 8K page mask
	andn    %o0, %g2, %g2
	ldxa    [%g1]ASI_MMU, %g3 ! save current primary ctx
	stxa    %o1, [%g1]ASI_MMU ! switch to new ctx
	btst    MAP_ITLB, %o2
	bz,pn   %xcc, 1f
	  btst  MAP_DTLB, %o2
	stxa    %g0, [%g2]ASI_IMMU_DEMAP
1:      bz,pn   %xcc, 2f
	  nop
	stxa    %g0, [%g2]ASI_DMMU_DEMAP
2:      stxa    %g3, [%g1]ASI_MMU !  restore original primary ctx
	HCALL_RET(EOK)
	SET_SIZE(hcall_mmu_unmap_perm_addr)


/*
 * qconf
 *
 * arg0 queue (%o0)
 * arg1 base raddr (%o1)
 * arg2 size (#entries, not #bytes) (%o2)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_qconf)
	sllx    %o2, Q_EL_SIZE_SHIFT, %g4       ! convert #entries to bytes
	CPU_STRUCT(%g1)

	! size of 0 unconfigures queue
	brnz,pt %o2, 1f
	nop

	/*
	 * Set the stored configuration to relatively safe values
	 * when un-initializing the queue
	 */
	mov     -1, %g2
	mov     -1, %o1
	ba,pt   %xcc, 2f
	mov     0, %g4

1:
	cmp     %o2, MIN_QUEUE_ENTRIES
	blu,pn  %xcc, herr_inval
	.empty

	cmp     %o2, MAX_QUEUE_ENTRIES
	bgu,pn  %xcc, herr_inval
	.empty

	! check that size is a power of two
	sub     %o2, 1, %g2
	andcc   %o2, %g2, %g0
	bnz,pn  %xcc, herr_inval
	.empty

	! Check base raddr alignment
	sub     %g4, 1, %g2     ! size in bytes to mask
	btst    %o1, %g2
	bnz,pn  %xcc, herr_badalign
	.empty

	ldx     [%g1 + CPU_GUEST], %g6
	RANGE_CHECK(%g6, %o1, %g4, herr_noraddr, %g2)
	REAL_OFFSET(%g6, %o1, %g2, %g3)

	! %g2 - queue paddr
	! %g4 - queue size (#bytes)
	dec     %g4
	! %g4 - queue mask

2:
	cmp     %o0, CPU_MONDO_QUEUE
	be,pn   %xcc, qconf_cpuq
	cmp     %o0, DEV_MONDO_QUEUE
	be,pn   %xcc, qconf_devq
	cmp     %o0, ERROR_RESUMABLE_QUEUE
	be,pn   %xcc, qconf_errrq
	cmp     %o0, ERROR_NONRESUMABLE_QUEUE
	bne,pn  %xcc, herr_inval
	nop

qconf_errnrq:
	stx     %g2, [%g1 + CPU_ERRQNR_BASE]
	stx     %o1, [%g1 + CPU_ERRQNR_BASE_RA]
	stx     %o2, [%g1 + CPU_ERRQNR_SIZE]
	stx     %g4, [%g1 + CPU_ERRQNR_MASK]
	mov     ERROR_NONRESUMABLE_QUEUE_HEAD, %g3
	stxa    %g0, [%g3]ASI_QUEUE
	mov     ERROR_NONRESUMABLE_QUEUE_TAIL, %g3
	ba,pt   %xcc, 4f
	stxa    %g0, [%g3]ASI_QUEUE

qconf_errrq:
	stx     %g2, [%g1 + CPU_ERRQR_BASE]
	stx     %o1, [%g1 + CPU_ERRQR_BASE_RA]
	stx     %o2, [%g1 + CPU_ERRQR_SIZE]
	stx     %g4, [%g1 + CPU_ERRQR_MASK]
	mov     ERROR_RESUMABLE_QUEUE_HEAD, %g3
	stxa    %g0, [%g3]ASI_QUEUE
	mov     ERROR_RESUMABLE_QUEUE_TAIL, %g3
	ba,pt   %xcc, 4f
	stxa    %g0, [%g3]ASI_QUEUE

qconf_devq:
	stx     %g2, [%g1 + CPU_DEVQ_BASE]
	stx     %o1, [%g1 + CPU_DEVQ_BASE_RA]
	stx     %o2, [%g1 + CPU_DEVQ_SIZE]
	stx     %g4, [%g1 + CPU_DEVQ_MASK]
	mov     DEV_MONDO_QUEUE_HEAD, %g3
	stxa    %g0, [%g3]ASI_QUEUE
	mov     DEV_MONDO_QUEUE_TAIL, %g3
	ba,pt   %xcc, 4f
	stxa    %g0, [%g3]ASI_QUEUE

qconf_cpuq:
	stx     %g2, [%g1 + CPU_CPUQ_BASE]
	stx     %o1, [%g1 + CPU_CPUQ_BASE_RA]
	stx     %o2, [%g1 + CPU_CPUQ_SIZE]
	stx     %g4, [%g1 + CPU_CPUQ_MASK]
	mov     CPU_MONDO_QUEUE_HEAD, %g3
	stxa    %g0, [%g3]ASI_QUEUE
	mov     CPU_MONDO_QUEUE_TAIL, %g3
	stxa    %g0, [%g3]ASI_QUEUE

4:
	HCALL_RET(EOK)
	SET_SIZE(hcall_qconf)


/*
 * qinfo
 *
 * arg0 queue (%o0)
 * --
 * ret0 status (%o0)
 * ret1 base raddr (%o1)
 * ret2 size (#entries) (%o2)
 */
	ENTRY_NP(hcall_qinfo)
	CPU_STRUCT(%g1)

	cmp     %o0, CPU_MONDO_QUEUE
	be,pn   %xcc, qinfo_cpuq
	cmp     %o0, DEV_MONDO_QUEUE
	be,pn   %xcc, qinfo_devq
	cmp     %o0, ERROR_RESUMABLE_QUEUE
	be,pn   %xcc, qinfo_errrq
	cmp     %o0, ERROR_NONRESUMABLE_QUEUE
	bne,pn  %xcc, herr_inval
	nop
qinfo_errnrq:
	ldx     [%g1 + CPU_ERRQNR_BASE_RA], %o1
	ba,pt   %xcc, 1f
	ldx     [%g1 + CPU_ERRQNR_SIZE], %o2

qinfo_errrq:
	ldx     [%g1 + CPU_ERRQR_BASE_RA], %o1
	ba,pt   %xcc, 1f
	ldx     [%g1 + CPU_ERRQR_SIZE], %o2

qinfo_devq:
	ldx     [%g1 + CPU_DEVQ_BASE_RA], %o1
	ba,pt   %xcc, 1f
	ldx     [%g1 + CPU_DEVQ_SIZE], %o2

qinfo_cpuq:
	ldx     [%g1 + CPU_CPUQ_BASE_RA], %o1
	ldx     [%g1 + CPU_CPUQ_SIZE], %o2

1:
	HCALL_RET(EOK)
	SET_SIZE(hcall_qinfo)


/*
 * cpu_start
 *
 * arg0 cpu (%o0)
 * arg1 pc (%o1)
 * arg2 rtba (%o2)
 * arg3 arg (%o3)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_cpu_start)
	CPU_GUEST_STRUCT(%g6, %g7)
	!! %g6 = CPU
	!! %g7 = guest

	cmp     %o0, NCPUS
	bgeu,pn %xcc, herr_nocpu
	nop

	! Check pc (real) and tba (real) for validity
	RANGE_CHECK(%g7, %o1, INSTRUCTION_SIZE, herr_noraddr, %g1)
	RANGE_CHECK(%g7, %o2, REAL_TRAPTABLE_SIZE, herr_noraddr, %g1)
	btst    (INSTRUCTION_ALIGNMENT - 1), %o1        ! Check pc alignment
	bnz,pn  %xcc, herr_badalign
	set     REAL_TRAPTABLE_SIZE - 1, %g1
	btst    %o2, %g1
	bnz,pn  %xcc, herr_badalign
	nop

	! Check current state of requested cpu
	sllx    %o0, 3, %g1
	mov     GUEST_VCPUS, %g2
	add     %g1, %g2, %g1   ! %g1 = vcpus[n] offset
	ldx     [%g7 + %g1], %g1 ! %g1 = guest.vcpus[n]
	brz,pn  %g1, herr_nocpu
	nop
	!! %g1 requested CPU cpu struct

	ldx     [%g1 + CPU_STATUS], %g2
	cmp     %g2, CPU_STATE_STOPPED
	bne,pn  %xcc, herr_inval
	nop

	/* Check to see if the mailbox is available */
	add     %g1, CPU_COMMAND, %g2
	mov     CPU_CMD_BUSY, %g4
	casxa   [%g2]ASI_P, %g0, %g4
	brnz,pn %g4, herr_wouldblock
	nop

	stx     %o1, [%g1 + CPU_CMD_ARG0]
	stx     %o2, [%g1 + CPU_CMD_ARG1]
	stx     %o3, [%g1 + CPU_CMD_ARG2]
#ifdef RESETCONFIG_BROKENTICK
	rdpr    %tick, %g2
	stx     %g2, [%g1 + CPU_CMD_ARG3]
#endif

	membar  #StoreStore
	mov     CPU_CMD_STARTGUEST, %g2
	stx     %g2, [%g1 + CPU_COMMAND]

	HCALL_RET(EOK)
	SET_SIZE(hcall_cpu_start)


/*
 * cpu_stop
 *
 * arg0 cpu (%o0)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_cpu_stop)
	HCALL_RET(EBADTRAP)     /* XXX */
	SET_SIZE(hcall_cpu_stop)

/*
 * cpu_state
 *
 * arg0 cpu (%o0)
 * --
 * ret0 status (%o0)
 * ret1 state (%o1)
 */
	ENTRY_NP(hcall_cpu_state)
	GUEST_STRUCT(%g1)
	VCPUID2CPUP(%g1, %o0, %g2, herr_nocpu, %g3)
	!! %g2 = target cpup

	ldx     [%g2 + CPU_STATUS], %o1
	! ASSERT(%o1 != CPU_STATE_INVALID)
	cmp     %o1, CPU_STATE_LAST_PUBLIC
	movgu   %xcc, CPU_STATE_ERROR, %o1      ! Any non-API state is ERROR
	HCALL_RET(EOK)
	SET_SIZE(hcall_cpu_state)


/*
 * hcall_mem_scrub
 *
 * arg0 real address (%o0)
 * arg1 length       (%o1)
 * --
 * ret0 status (%o0)
 *   EOK       : success or partial success
 *   ENORADDR  : invalid (bad) address
 *   EBADALIGN : bad alignment
 * ret1 length scrubbed (%o1)
 */
	ENTRY_NP(hcall_mem_scrub)
	brz,pn  %o1, herr_inval                 ! length 0 invalid
	or      %o0, %o1, %g1                   ! address and length
	btst    L2_LINE_SIZE - 1, %g1           !    aligned?
	bnz,pn  %xcc, herr_badalign             ! no: error
	  nop

	CPU_GUEST_STRUCT(%g6, %g5)

	/* Check input arguments with guest map: error ret: r0=ENORADDR */
	RANGE_CHECK(%g5, %o0, %o1, herr_noraddr, %g1)
	REAL_OFFSET(%g5, %o0, %o0, %g1) /* real => physical address */

	/* Get Max length: */
	ldx     [%g6 + CPU_ROOT], %g2           ! root (config) struct
	ldx     [%g2 + CONFIG_MEMSCRUB_MAX], %g5 ! limit (# cache lines)

	/* Compute max # lines: */
	srlx    %o1, L2_LINE_SHIFT, %g2         ! # input cache lines
	cmp     %g5, %g2                        ! g2 = min(inp, max)
	movlu   %xcc, %g5, %g2                  !       ..
	sllx    %g2, L2_LINE_SHIFT, %o1         ! ret1 = count scrubbed

	/*
	 * This is the core of this function.
	 * All of the code before and after has been optimized to make this
	 *   and the most common path the fastest.
	 */
	wr      %g0, ASI_BLK_INIT_P, %asi
.ms_clear_mem:
	stxa    %g0, [%o0 + (0 * 8)]%asi
	stxa    %g0, [%o0 + (1 * 8)]%asi
	stxa    %g0, [%o0 + (2 * 8)]%asi
	stxa    %g0, [%o0 + (3 * 8)]%asi
	stxa    %g0, [%o0 + (4 * 8)]%asi
	stxa    %g0, [%o0 + (5 * 8)]%asi
	stxa    %g0, [%o0 + (6 * 8)]%asi
	stxa    %g0, [%o0 + (7 * 8)]%asi
	deccc   1, %g2
	bnz,pt  %xcc, .ms_clear_mem
	  inc   64, %o0
	HCALL_RET(EOK)                          ! ret0=status, ret1=count
	SET_SIZE(hcall_mem_scrub)


/*
 * hcall_mem_sync
 *
 * arg0 real address (%o0)
 * arg1 length       (%o1)
 * --
 * ret0 (%o0):
 *   EOK       : success, partial success
 *   ENORADDR  : bad address
 *   EBADALIGN : bad alignment
 * ret1 (%o1):
 *   length synced
 */
	ENTRY_NP(hcall_mem_sync)
	brz,pn  %o1, herr_inval         ! len 0 not valid
	or      %o0, %o1, %g2
	set     MEMSYNC_ALIGNMENT - 1, %g3
	btst    %g3, %g2        ! check for alignment of addr/len
	bnz,pn  %xcc, herr_badalign
	.empty

	CPU_STRUCT(%g5)
	RANGE_CHECK(%g5, %o0, %o1, herr_noraddr, %g1)
	REAL_OFFSET(%g5, %o0, %o0, %g1) /* real => physical address ? */
	!! %o0 pa
	!! %o1 length

	/*
	 * Clamp requested length at MEMSCRUB_MAX
	 */
	ldx     [%g5 + CPU_ROOT], %g2
	ldx     [%g2 + CONFIG_MEMSCRUB_MAX], %g3
	sllx    %g3, L2_LINE_SHIFT, %g3
	cmp     %o1, %g3
	movgu   %xcc, %g3, %o1
	!! %o1 MIN(requested length, max length)

	/*
	 * Push cache lines to memory
	 */
	sub     %o1, L2_LINE_SIZE, %o5
	!! %o5 loop counter
	add     %o0, %o5, %g1   ! hoisted delay slot (see below)
1:
	ba      l2_flush_line
	  rd    %pc, %g7
	deccc   L2_LINE_SIZE, %o5 ! get to next line
	bgeu,pt %xcc, 1b
	  add   %o0, %o5, %g1   ! %g1 is pa to flush

	HCALL_RET(EOK)
	SET_SIZE(hcall_mem_sync)


/*
 * intr_devino2sysino
 *
 * arg0 dev handle [dev config pa] (%o0)
 * arg1 devino (%o1)
 * --
 * ret0 status (%o0)
 * ret1 sysino (%o1)
 *
 */
	ENTRY_NP(hcall_intr_devino2sysino)
	JMPL_DEVHANDLE2DEVOP(%o0, DEVOPSVEC_DEVINO2VINO, %g1, %g2, %g3, \
	    herr_inval)
	SET_SIZE(hcall_intr_devino2sysino)

/*
 * intr_getenabled
 *
 * arg0 sysino (%o0)
 * --
 * ret0 status (%o0)
 * ret1 intr valid state (%o1)
 */
	ENTRY_NP(hcall_intr_getenabled)
	JMPL_VINO2DEVOP(%o0, DEVOPSVEC_GETVALID, %g1, %g2, herr_inval)
	SET_SIZE(hcall_intr_getenabled)

/*
 * intr_setenabled
 *
 * arg0 sysino (%o0)
 * arg1 intr valid state (%o1) 1: Valid 0: Invalid
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_intr_setenabled)
	cmp     %o1, INTR_ENABLED_MAX_VALUE
	bgu,pn  %xcc, herr_inval
	nop
	JMPL_VINO2DEVOP(%o0, DEVOPSVEC_SETVALID, %g1, %g2, herr_inval)
	SET_SIZE(hcall_intr_setenabled)

/*
 * intr_getstate
 *
 * arg0 sysino (%o0)
 * --
 * ret0 status (%o0)
 * ret1 (%o1) 0: idle 1: received 2: delivered
 */
	ENTRY_NP(hcall_intr_getstate)
	JMPL_VINO2DEVOP(%o0, DEVOPSVEC_GETSTATE, %g1, %g2, herr_inval)
	SET_SIZE(hcall_intr_getstate)

/*
 * intr_setstate
 *
 * arg0 sysino (%o0)
 * arg1 (%o1) 0: idle 1: received 2: delivered
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_intr_setstate)
	JMPL_VINO2DEVOP(%o0, DEVOPSVEC_SETSTATE, %g1, %g2, herr_inval)
	SET_SIZE(hcall_intr_setstate)

/*
 * intr_gettarget
 *
 * arg0 sysino (%o0)
 * --
 * ret0 status (%o0)
 * ret1 cpuid (%o1)
 */
	ENTRY_NP(hcall_intr_gettarget)
	JMPL_VINO2DEVOP(%o0, DEVOPSVEC_GETTARGET, %g1, %g2, herr_inval)
	SET_SIZE(hcall_intr_gettarget)

/*
 * intr_settarget
 *
 * arg0 sysino (%o0)
 * arg1 cpuid (%o1)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_intr_settarget)
	JMPL_VINO2DEVOP(%o0, DEVOPSVEC_SETTARGET, %g1, %g2, herr_inval)
	SET_SIZE(hcall_intr_settarget)


/*
 * cpu_yield
 *
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_cpu_yield)
#ifdef NIAGARA_ERRATUM_39
	rdhpr   %hver, %g1
	srlx    %g1, VER_MASK_MAJOR_SHIFT, %g1
	and     %g1, VER_MASK_MAJOR_MASK, %g1
	cmp     %g1, 1          ! Check for Niagara 1.x
	bleu,pt %xcc, hret_ok
	nop
#endif
#ifndef N2HACKS
	rd      STR_STATUS_REG, %g1
	! xor ACTIVE to clear it on current strand
	wr      %g1, STR_STATUS_STRAND_ACTIVE, STR_STATUS_REG
#endif  /* !N2HACKS */
	! skid
	nop
	nop
	nop
	nop
	HCALL_RET(EOK)
	SET_SIZE(hcall_cpu_yield)


/*
 * cpu_myid
 *
 * --
 * ret0 status (%o0)
 * ret1 mycpuid (%o1)
 */
	ENTRY_NP(hcall_cpu_myid)
	CPU_STRUCT(%g1)
	ldub    [%g1 + CPU_VID], %o1
	HCALL_RET(EOK)
	SET_SIZE(hcall_cpu_myid)


/*
 * hcall_niagara_getperf
 *
 * arg0 JBUS/DRAM performance register ID (%o0)
 * --
 * ret0 status (%o0)
 * ret1 Perf register value (%o1)
 */
	ENTRY_NP(hcall_niagara_getperf)
	! check if JBUS/DRAM perf registers are accessible
	GUEST_STRUCT(%g1)
	set     GUEST_PERFREG_ACCESSIBLE, %g2
	ldx     [%g1 + %g2], %g2
	brz,pn  %g2, herr_noaccess
	.empty

	! check if perfreg within range
	cmp     %o0, NIAGARA_PERFREG_MAX
	bgeu,pn %xcc, herr_inval
	.empty

	set     niagara_perf_paddr_table - niagara_getperf_1, %g2
niagara_getperf_1:
	rd      %pc, %g3
	add     %g2, %g3, %g2
	sllx    %o0, 4, %o0                     ! table entry offset
	add     %o0, %g2, %g2
	ldx     [%g2], %g3                      ! get perf reg paddr
	ldx     [%g3], %o1                      ! read perf reg
	HCALL_RET(EOK)
	SET_SIZE(hcall_niagara_getperf)

/*
 * hcall_niagara_setperf
 *
 * arg0 JBUS/DRAM performance register ID (%o0)
 * arg1 perf register value (%o1)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_niagara_setperf)
	! check if JBUS/DRAM perf registers are accessible
	GUEST_STRUCT(%g1)
	set     GUEST_PERFREG_ACCESSIBLE, %g2
	ldx     [%g1 + %g2], %g2
	brz,pn  %g2, herr_noaccess
	.empty

	! check if perfreg within range
	cmp     %o0, NIAGARA_PERFREG_MAX
	bgeu,pn %xcc, herr_inval
	.empty

	set     niagara_perf_paddr_table - niagara_setperf_1, %g2
niagara_setperf_1:
	rd      %pc, %g3
	add     %g2, %g3, %g2
	sllx    %o0, 4, %o0                     ! table entry offset
	add     %o0, %g2, %g2
	ldx     [%g2], %g3                      ! get perf reg paddr
	ldx     [%g2+8], %g1                    ! get perf reg write mask
	and     %g1, %o1, %g1
	stx     %g1, [%g3]                      ! write perf reg
	HCALL_RET(EOK)
	SET_SIZE(hcall_niagara_setperf)

/*
 * Niagara JBUS/DRAM performance register physical address/mask table
 * (order must match performance register ID assignment)
 */
	.section ".text"
	.align  8
niagara_perf_paddr_table:
	.xword  JBI_PERF_CTL, 0xff
	.xword  JBI_PERF_COUNT, 0xffffffffffffffff
	.xword  DRAM_PERF_CTL0, 0xff
	.xword  DRAM_PERF_COUNT0, 0xffffffffffffffff
	.xword  DRAM_PERF_CTL1, 0xff
	.xword  DRAM_PERF_COUNT1, 0xffffffffffffffff
	.xword  DRAM_PERF_CTL2, 0xff
	.xword  DRAM_PERF_COUNT2, 0xffffffffffffffff
	.xword  DRAM_PERF_CTL3, 0xff
	.xword  DRAM_PERF_COUNT3, 0xffffffffffffffff



/*
 * hcall_ra2pa
 *
 * arg0 ra (%o0)
 * --
 * ret0 status (%o0)
 * ret1 pa (%o1)
 */
	ENTRY_NP(hcall_ra2pa)
	GUEST_STRUCT(%g1)
	set     GUEST_DIAGPRIV, %g2
	ldx     [%g1 + %g2], %g2
	brz,pn  %g2, herr_noaccess
	nop

	RANGE_CHECK(%g1, %o0, 1, herr_noraddr, %g2)
	REAL_OFFSET(%g1, %o0, %o1, %g2)

	HCALL_RET(EOK)
	SET_SIZE(hcall_ra2pa)


/*
 * hcall_hexec
 *
 * arg0 physical address of routine to execute (%o0)
 * --
 * ret0 status if noaccess, other SEP (somebody else's problem) (%o0)
 */
	ENTRY_NP(hcall_hexec)
	GUEST_STRUCT(%g1)
	set     GUEST_DIAGPRIV, %g2
	ldx     [%g1 + %g2], %g2
	brz,pn  %g2, herr_noaccess
	nop

	jmp     %o0
	nop
	/* caller executes "done" */
	SET_SIZE(hcall_hexec)


/*
 * dump_buf_update
 *
 * arg0 ra of dump buffer (%o0)
 * arg1 size of dump buffer (%o1)
 * --
 * ret0 status (%o0)
 * ret1 size on success (%o1), min size on EINVAL
 */
	ENTRY_NP(hcall_dump_buf_update)
	GUEST_STRUCT(%g1)

	/*
	 * XXX What locking is required between multiple strands
	 * XXX making simultaneous conf calls?
	 */

	/*
	 * Any error unconfigures any currently configured dump buf
	 * so set to unconfigured now to avoid special error exit code.
	 */
	set     GUEST_DUMPBUF_SIZE, %g4
	stx     %g0, [%g1 + %g4]
	set     GUEST_DUMPBUF_RA, %g4
	stx     %g0, [%g1 + %g4]
	set     GUEST_DUMPBUF_PA, %g4
	stx     %g0, [%g1 + %g4]

	! Size of 0 unconfigures the dump
	brz,pn  %o1, hret_ok
	nop

	set     DUMPBUF_MINSIZE, %g2
	cmp     %o1, %g2
	blu,a,pn %xcc, herr_inval
	  mov   %g2, %o1        ! return min size on EINVAL

	! Check alignment
	btst    (DUMPBUF_ALIGNMENT - 1), %o0
	bnz,pn  %xcc, herr_badalign
	  nop

	RANGE_CHECK(%g1, %o0, %o1, herr_noraddr, %g2)
	REAL_OFFSET(%g1, %o0, %g2, %g3)
	!! %g2 pa of dump buffer
	set     GUEST_DUMPBUF_SIZE, %g4
	stx     %o1, [%g1 + %g4]
	set     GUEST_DUMPBUF_RA, %g4
	stx     %o0, [%g1 + %g4]
	set     GUEST_DUMPBUF_PA, %g4
	stx     %g2, [%g1 + %g4]

	! XXX Need to put something in the buffer
#if 0
	CPU_STRUCT(%g5)
	ldx     [%g5 + CPU_ROOT], %g5
	ldx     [%g5 + CONFIG_VERSION], %g1
	! mov   %g2, %g2
	ldx     [%g5 + CONFIG_VERSIONLEN], %g3
	! ASSERT(%g3 <= [GUEST_DUMPBUF_SIZE])
	ba      xcopy
	rd      %pc, %g7
#endif

	HCALL_RET(EOK)
	SET_SIZE(hcall_dump_buf_update)


/*
 * dump_buf_info
 *
 * --
 * ret0 status (%o0)
 * ret1 current dumpbuf ra (%o1)
 * ret2 current dumpbuf size (%o2)
 */
	ENTRY_NP(hcall_dump_buf_info)
	GUEST_STRUCT(%g1)
	set     GUEST_DUMPBUF_SIZE, %g4
	ldx     [%g1 + %g4], %o2
	set     GUEST_DUMPBUF_RA, %g4
	ldx     [%g1 + %g4], %o1
	HCALL_RET(EOK)
	SET_SIZE(hcall_dump_buf_info)


/*
 * cpu_mondo_send
 *
 * arg0/1 cpulist (%o0/%o1)
 * arg2 ptr to 64-byte-aligned data to send (%o2)
 * --
 * ret0 status (%o0)
 */
	ENTRY(hcall_cpu_mondo_send)
	btst    CPULIST_ALIGNMENT - 1, %o1
	bnz,pn  %xcc, herr_badalign
	btst    MONDO_DATA_ALIGNMENT - 1, %o2
	bnz,pn  %xcc, herr_badalign
	nop

	CPU_GUEST_STRUCT(%g3, %g6)
	!! %g3 cpup
	!! %g6 guestp

	sllx    %o0, CPULIST_ENTRYSIZE_SHIFT, %g5

	RANGE_CHECK(%g6, %o1, %g5, herr_noraddr, %g7)
	REAL_OFFSET(%g6, %o1, %g1, %g7)
	!! %g1 cpulistpa
	RANGE_CHECK(%g6, %o2, MONDO_DATA_SIZE, herr_noraddr, %g7)
	REAL_OFFSET(%g6, %o2, %g2, %g5)
	!! %g2 mondopa

	clr     %g4
	!! %g4 true for EWOULDBLOCK
another_cpu:
	deccc   %o0
	blu,pn  %xcc, 1f
	nop      !! nop
	ldsh    [%g1], %g6
	!! %g6 tcpuid
	cmp     %g6, CPULIST_ENTRYDONE
	be,a,pn %xcc, another_cpu
	  inc   CPULIST_ENTRYSIZE, %g1
	cmp     %g6, NCPUS
	bgeu,pn %xcc, herr_nocpu
	nop
#if GUEST_VCPUS_INCR == 8
	sllx    %g6, 3, %g6
#else
	mulx    %g6, GUEST_VCPUS_INCR, %g6
#endif
	ldx     [%g3 + CPU_GUEST], %g5
	add     %g5, GUEST_VCPUS, %g5
	ldx     [%g5 + %g6], %g6
	!! %g6 tcpup
	brz,pn  %g6, herr_nocpu
	.empty

	cmp     %g3, %g6
	be,pn   %xcc, herr_inval ! Sending to self is illegal
	nop

	/* Check to see if the mailbox is available */
	add     %g6, CPU_COMMAND, %g5
	mov     CPU_CMD_BUSY, %g7
	casxa   [%g5]ASI_P, %g0, %g7
	brnz,a,pn %g7, another_cpu ! target is busy, try another
	  inc   %g4

	/* Copy the mondo data into the target cpu's incoming buffer */
	ldx     [%g2 + 0x00], %g7
	stx     %g7, [%g6 + CPU_CMD_ARG0]
	ldx     [%g2 + 0x08], %g7
	stx     %g7, [%g6 + CPU_CMD_ARG1]
	ldx     [%g2 + 0x10], %g7
	stx     %g7, [%g6 + CPU_CMD_ARG2]
	ldx     [%g2 + 0x18], %g7
	stx     %g7, [%g6 + CPU_CMD_ARG3]
	ldx     [%g2 + 0x20], %g7
	stx     %g7, [%g6 + CPU_CMD_ARG4]
	ldx     [%g2 + 0x28], %g7
	stx     %g7, [%g6 + CPU_CMD_ARG5]
	ldx     [%g2 + 0x30], %g7
	stx     %g7, [%g6 + CPU_CMD_ARG6]
	ldx     [%g2 + 0x38], %g7
	stx     %g7, [%g6 + CPU_CMD_ARG7]
	membar  #Sync
	mov     CPU_CMD_GUESTMONDO_READY, %g7
	stx     %g7, [%g6 + CPU_COMMAND]

	/* Send a xcall vector interrupt to the target cpu */
	ldub    [%g6 + CPU_PID], %g7
	sllx    %g7, INT_VEC_DIS_VCID_SHIFT, %g5
	or      %g5, VECINTR_XCALL, %g5
	stxa    %g5, [%g0]ASI_INTR_UDB_W

	mov     CPULIST_ENTRYDONE, %g7
	sth     %g7, [%g1]

	ba      another_cpu
	nop
1:
	brnz,pn %g4, herr_wouldblock    ! If remaining then EAGAIN
	nop
	HCALL_RET(EOK)
	SET_SIZE(hcall_cpu_mondo_send)


#define TTRACE_RELOC_ADDR(addr, scr0, scr1)      \
	setx    .+8, scr0, scr1                 ;\
	rd      %pc, scr0                       ;\
	sub     scr1, scr0, scr0                ;\
	sub     addr, scr0, addr

/*
 * hcal_ttrace_buf_conf
 *
 * arg0 ra of traptrace buffer (%o0)
 * arg1 size of traptrace buffer in entries (%o1)
 * --
 * ret0 status (%o0)
 * ret1 minimum #entries on EINVAL, #entries on success (%o1)
 */
	ENTRY_NP(hcall_ttrace_buf_conf)
	CPU_GUEST_STRUCT(%g1, %g2)

	/*
	 * Disable traptrace by restoring %htba to original traptable
	 * always do this first to make error returns easier.
	 */
	setx    htraptable, %g3, %g4
	TTRACE_RELOC_ADDR(%g4, %g3, %g5)
	wrhpr   %g4, %htba

	! Clear buffer description
	stx     %g0, [%g1 + CPU_TTRACEBUF_SIZE] ! size must be first
	stx     %g0, [%g1 + CPU_TTRACEBUF_PA]
	stx     %g0, [%g1 + CPU_TTRACEBUF_RA]

	/*
	 * nentries (arg1) > 0 configures the buffer
	 * nentries ==  0 disables traptrace and cleans up buffer config
	 */
	brz,pn  %o1, hret_ok
	nop

	! Check alignment
	btst    TTRACE_ALIGNMENT - 1, %o0
	bnz,pn  %xcc, herr_badalign
	nop

	! Check that #entries is >= TTRACE_MINIMUM_ENTRIES
	cmp     %o1, TTRACE_MINIMUM_ENTRIES
	blu,a,pn %xcc, herr_inval
	  mov   TTRACE_MINIMUM_ENTRIES, %o1

	sllx    %o1, TTRACE_RECORD_SZ_SHIFT, %g6 ! convert #entries to bytes

	RANGE_CHECK(%g2, %o0, %g6, herr_noraddr, %g4)
	REAL_OFFSET(%g2, %o0, %g3, %g4)
	!! %g3 pa of traptrace buffer
	stx     %o0, [%g1 + CPU_TTRACEBUF_RA]
	stx     %g3, [%g1 + CPU_TTRACEBUF_PA]
	stx     %g6, [%g1 + CPU_TTRACEBUF_SIZE] ! size must be last

	!! Initialize traptrace buffer header
	mov     TTRACE_RECORD_SIZE, %g2
	stx     %g2, [%g1 + CPU_TTRACE_OFFSET]
	stx     %g2, [%g3 + TTRACE_HEADER_OFFSET]
	stx     %g2, [%g3 + TTRACE_HEADER_LAST_OFF]
	! %o1 return is the same as that passed in
	HCALL_RET(EOK)
	SET_SIZE(hcall_ttrace_buf_conf)


/*
 * hcall_ttrace_buf_info
 *
 * --
 * ret0 status (%o0)
 * ret1 current traptrace buf ra (%o1)
 * ret2 current traptrace buf size (%o2)
 */
	ENTRY_NP(hcall_ttrace_buf_info)
	CPU_STRUCT(%g1)

	ldx     [%g1 + CPU_TTRACEBUF_RA], %o1
	ldx     [%g1 + CPU_TTRACEBUF_SIZE], %o2
	srlx    %o2, TTRACE_RECORD_SZ_SHIFT, %o2 ! convert bytes to #entries
	movrz   %o2, %g0, %o1   ! ensure RA zero if size is zero

	HCALL_RET(EOK)
	SET_SIZE(hcall_ttrace_buf_info)


/*
 * hcall_ttrace_enable
 *
 * arg0 boolean: 0 = disable, non-zero = enable (%o0)
 * --
 * ret0 status (%o0)
 * ret1 previous enable state (0=disabled, 1=enabled) (%o1)
 */
	ENTRY_NP(hcall_ttrace_enable)
	setx    htraptracetable, %g1, %g2       ! %g2 = reloc'd &htraptracetable
	TTRACE_RELOC_ADDR(%g2, %g1, %g3)

	setx    htraptable, %g1, %g3            ! %g3 = reloc'd &htraptable
	TTRACE_RELOC_ADDR(%g3, %g1, %g4)

	mov     %g3, %g1                        ! %g1 = (%o0 ? %g3 : %g2)
	movrnz  %o0, %g2, %g1

	rdhpr   %htba, %g4                      ! %o1 = (%htba == %g2)
	mov     %g0, %o1
	cmp     %g4, %g2
	move    %xcc, 1, %o1

	/*
	 * Check that the guest has previously provided a buf for this cpu
	 * Check here since by now %o1 will be properly set
	 */
	CPU_STRUCT(%g2)
	TTRACE_CHK_BUF(%g2, %g3, herr_inval)

	wrhpr   %g1, %htba

	HCALL_RET(EOK)
	SET_SIZE(hcall_ttrace_enable)


/*
 * hcall_ttrace_freeze
 *
 * arg0 boolean: 0 = disable, non-zero = enable (%o0)
 * --
 * ret0 status (%o0)
 * ret1 previous freeze state (0=disabled, 1=enabled) (%o1)
 */
	ENTRY_NP(hcall_ttrace_freeze)
	GUEST_STRUCT(%g1)

	movrnz  %o0, 1, %o0                     ! normalize to formal bool

	! race conditions for two CPUs updating this not harmful
	ldx     [%g1 + GUEST_TTRACE_FRZ], %o1   ! current val for ret1
	stx     %o0, [%g1 + GUEST_TTRACE_FRZ]

	HCALL_RET(EOK)
	SET_SIZE(hcall_ttrace_freeze)


/*
 * hcall_ttrace_addentry
 *
 * arg0 lower 16 bits stored in TTRACE_ENTRY_TAG (%o0)
 * arg1 stored in TTRACE_ENTRY_F1 (%o1)
 * arg2 stored in TTRACE_ENTRY_F2 (%o2)
 * arg3 stored in TTRACE_ENTRY_F3 (%o3)
 * arg4 stored in TTRACE_ENTRY_F4 (%o4)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_ttrace_addentry)
	/*
	 * Check that the guest has perviously provided a buf for this cpu
	 * return EINVAL if not configured, ignore (EOK) if frozen
	 */
	TTRACE_PTR(%g3, %g2, herr_inval, hret_ok)

	rdpr    %tl, %g4                        ! %g4 holds current tl
	sub     %g4, 1, %g3                     ! %g3 holds tl of caller
	mov     %g3, %g1                        ! save for TL field fixup
	movrz   %g3, 1, %g3                     ! minimum is TL=1
	wrpr    %g3, %tl

	TTRACE_STATE(%g2, TTRACE_TYPE_GUEST, %g3, %g5)
	stb     %g1, [%g2 + TTRACE_ENTRY_TL]    ! overwrite with calc'd TL

	wrpr    %g4, %tl                        ! restore trap level

	sth     %o0, [%g2 + TTRACE_ENTRY_TAG]
	stx     %o1, [%g2 + TTRACE_ENTRY_F1]
	stx     %o2, [%g2 + TTRACE_ENTRY_F2]
	stx     %o3, [%g2 + TTRACE_ENTRY_F3]
	stx     %o4, [%g2 + TTRACE_ENTRY_F4]

	TTRACE_NEXT(%g2, %g3, %g4, %g5)

	HCALL_RET(EOK)
	SET_SIZE(hcall_ttrace_addentry)


/*
 * hcall_set_rtba - set the current cpu's rtba
 *
 * arg0 rtba (%o0)
 * --
 * ret0 status (%o0)
 * ret1 previous rtba (%o1)
 */
	ENTRY_NP(hcall_set_rtba)
	CPU_GUEST_STRUCT(%g1, %g2)
	!! %g1 = cpup
	!! %g2 = guestp

	! Return prior rtba value
	ldx     [%g1 + CPU_RTBA], %o1

	! Check rtba for validity
	RANGE_CHECK(%g2, %o0, REAL_TRAPTABLE_SIZE, herr_noraddr, %g7)
	set     REAL_TRAPTABLE_SIZE - 1, %g3
	btst    %o0, %g3
	bnz,pn  %xcc, herr_badalign
	nop
	stx     %o0, [%g1 + CPU_RTBA]
	HCALL_RET(EOK)
	SET_SIZE(hcall_set_rtba)


/*
 * hcall_get_rtba - return the current cpu's rtba
 *
 * --
 * ret0 status (%o0)
 * ret1 rtba (%o1)
 */
	ENTRY_NP(hcall_get_rtba)
	CPU_STRUCT(%g1)
	ldx     [%g1 + CPU_RTBA], %o1
	HCALL_RET(EOK)
	SET_SIZE(hcall_get_rtba)


#ifdef CONFIG_BRINGUP

/*
 * vdev_genintr - generate a virtual interrupt
 *
 * arg0 sysino (%o0)
 * --
 * ret0 status (%o0)
 */
	ENTRY_NP(hcall_vdev_genintr)
	GUEST_STRUCT(%g1)
	!! %g1 = guestp
	VINO2DEVINST(%g1, %o0, %g2, herr_inval)
	cmp     %g2, DEVOPS_VDEV
	bne,pn  %xcc, herr_inval
	nop
	add     %g1, GUEST_VDEV_STATE, %g2
	add     %g2, VDEV_STATE_MAPREG, %g2
	!! %g2 = mapreg array
	and     %o0, VINTR_INO_MASK, %o0        ! get INO bits
	mulx    %o0, MAPREG_SIZE, %g1
	add     %g2, %g1, %g1
	!! %g1 = mapreg
	HVCALL(vdev_intr_generate)
	HCALL_RET(EOK)
	SET_SIZE(hcall_vdev_genintr)

#endif /* CONFIG_BRINGUP */
#endif


hcall_cons_putchar:
	setx 0xfff0c2c000, %g1, %g2
	stb  %o0, [%g2]
	done
hcall_io_peek:
	ldx [%o0],%o0
	done
hcall_io_poke:
	stx %o1, [%o0]
	done

hcall_vpci_io_peek:
	ldxa [%o0]ASI_PRIMARY_LITTLE,%o0
	done
hcall_vpci_io_poke:
	stxa %o1, [%o0]ASI_PRIMARY_LITTLE
	done

