/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_NcuCtagUe.s
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
#define ENABLE_PCIE_LINK_TRAINING
#define MAIN_PAGE_HV_ALSO

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"


#define IO_RD_ADDR mpeval((N2_PCIE_BASE_ADDR + (IOCFG_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff)) | IO_ACCESS_PA)

#define MEM_LOC1 	0x42400000

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop


get_th_id_o0:
        ta      T_RD_THID

        cmp     %o1, 0x0
        be      main_t0
        nop

        cmp     %o1, 0x1
        be      main_t1
        nop


        /**************************************
                THREAD 0
        **************************************/
main_t0:
	nop
        setx    MEM_LOC1, %g1, %g3
        st      %g0, [%g3]

set_eie:
        setx    SOC_EIE_REG, %l7, %i3

        setx    0x7ffffffffff,%l1,%i2
        stx     %i2, [%i3]
        membar  #Sync


L2_err_enable:
        set     0x3, %l1
        mov     0xaa, %g2
        sllx    %g2, 32, %g2
        stx     %l1, [%g2]
        stx     %l1, [%g2 + 0x40]
        stx     %l1, [%g2 + 0x80]
        stx     %l1, [%g2 + 0xc0]
        stx     %l1, [%g2 + 0x100]
        stx     %l1, [%g2 + 0x140]
        stx     %l1, [%g2 + 0x180]
        stx     %l1, [%g2 + 0x1c0]

clear_esr_first:
        setx    SOC_ESR_REG, %l7, %i0
        stx     %g0, [%i0]



set_ejr:
        set     0x1, %i1
        sllx    %i1, ERR_FIELD, %i2
        setx    SOC_EJR_REG, %l7, %i3
        stx     %i2, [%i3]

pio_addr:
        ! select an IO address in PCI address range and transmit the command to NCU
        setx IO_RD_ADDR, %g1, %g2

st_mem1:
        set     0x1, %g4
        st      %g4, [%g3]

pio:
        ! load byte - all byte offsets within an octlet
        ldub [%g2 + 1*8 + 0], %l0
	nop 				! ld hangs and not completes

	ba 	test_failed
	nop



        /**************************************
                THREAD 1
        **************************************/
main_t1:
        nop

read_mem_loc:
        setx    MEM_LOC1, %l7, %i3
	ldx	[%i3], %o0
	cmp	%o0, %g0
	be   	%xcc, read_mem_loc
	nop

delay:
	ld	[%i3+0x8], %o0
        ld     	[%i3+0x10], %o0
        ld     	[%i3+0x18], %o0
        ld     	[%i3+0x20], %o0
        ld      [%i3+0x28], %o0
        ld      [%i3+0x30], %o0
        ld      [%i3+0x40], %o0
	
	set     0x20,%g1
read_esr:
	cmp     %g1,%g0
	be      test_failed
	nop
	dec     %g1
	nop
        setx    SOC_ESR_REG, %l7, %i0
        ldx     [%i0], %i1
        nop
        setx    SOC_PER_REG, %l7, %g2
        ldx     [%g2], %g3
        nop


        setx    0x8000000000000000, %l7, %o3    !valid bit
        set     0x1, %i2
        sllx    %i2, ERR_FIELD, %i3
        or      %i3, %o3, %i4
        sub     %i1, %i4, %i5
        cmp     %i4, %g3
        be      check_ncu_synd_reg
        nop
        brnz    %i5, read_esr
        nop

check_ncu_synd_reg:
	setx    SOC_NCU_SYN_REG,%l1,%l2
	ldx     [%l2], %l3
	setx    0xc0b0000000000000,%l1,%l4
	andcc   %l3, %l4, %l5
	cmp     %l5, %l4
	bne     test_failed
	nop

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

/************************************************************************
   Test case data start
************************************************************************/

SECTION       .DATA DATA_VA=IO_RD_ADDR
attr_data {
      Name = .DATA,
      hypervisor,
      compressimage
}

.data
        .xword 0xdeadbeefdeadbeef

        .xword 0x1101010101010101
        .xword 0x0122010101010101
        .xword 0x0101330101010101
        .xword 0x0101014401010101
        .xword 0x0101010155010101
        .xword 0x0101010101660101
        .xword 0x0101010101017701
        .xword 0x0101010101010188

        .xword 0x1122010101010101
        .xword 0x0101334401010101
        .xword 0x0101010155660101
        .xword 0x0101010101017788

        .xword 0x1122334401010101
        .xword 0x0101010155667788

        .xword 0xdeadbeefdeadbeef

/************************************************************************/

