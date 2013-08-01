/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: Debug_Event_Soc.s
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
#define H_HT0_Sw_Recoverable_Error_0x40	 My_Recoverable_Sw_error_trap

#define ENABLE_PCIE_LINK_TRAINING
#define MAIN_PAGE_HV_ALSO
#define SOC_EST_REG	0x9001041000

#include "err_defines.h"
#include "hboot.s"
#include "peu_defines.h"


#define IO_RD_ADDR mpeval((N2_PCIE_BASE_ADDR + (IOCFG_OFFSET_BASE_REG_DATA & 0x7fffffffffffffff)) | IO_ACCESS_PA)

#define MEM_LOC1 	0x42400000
#define DBG_ERR_PA  0x8000004000
#define DBG_ERR_VAL 0x1
/***following will enable the NCU related errors to trigger a pulse to MIO***/

#define  Soc_Decr_Pa         0x8600000010
#define  Soc_Decr_Val        0x0000300000

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main
.global	 My_Recoverable_Sw_error_trap


main:
        ta T_CHANGE_HPRIV
        nop

/**following will enable the NCU Debug Trigger Enable Register****/
   setx Soc_Decr_Pa,%l1,%g4
   setx Soc_Decr_Val,%l7,%g5
   stx %g5,[%g4]
   nop
   nop
   membar #Sync

   setx DBG_ERR_PA,%l5,%g3
   setx DBG_ERR_VAL,%l1,%g1
   stx %g1,[%g3]
   nop
   nop
   membar #Sync

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


        setx    0x8000000000000000, %g7, %g3    !valid bit
        set     0x1, %g2
        sllx    %g2, ERR_FIELD, %g4
        or      %g3, %g4, %g5

	set	0x100, %g1
read_esr:
	cmp	%g1, %g0
        be      %xcc, test_failed	! Timeout check
	nop	 

        setx    SOC_ESR_REG, %g7, %g3
        ldx     [%g3], %g6

	dec	%g1

        cmp     %g6, %g5
        bne      %xcc, read_esr 
        nop


est_reg:
        setx    SOC_EST_REG, %g3, %g2
        set     0x1, %g1
        stx     %g1, [%g2]
        membar  0x40


eie_reg_ones:
	setx	SOC_EIE_REG, %g3, %g2
        set	0x1, %i1
	sllx	%i1, ERR_FIELD, %g1
	stx	%g1, [%g2]
	membar	0x40

	setx	0x40, %g7, %g6
	 set	0x1, %g1			! 1 Trap
err_trap_loop:
	cmp	    %g6, %g0
	 be	%xcc, test_failed
        nop

	cmp	%g1, %i7
	 be	%xcc, check_tt
        nop

	ba	err_trap_loop
        nop

check_tt:
	mov	0x40, %l0
	cmp	%o7,  %l0
	 bne	%xcc, test_failed
        nop

        /********************************/
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD



/************************************************************************
	RAS
	Trap Handlers
 ************************************************************************/
My_Recoverable_Sw_error_trap:
	! Signal trap taken
	setx	EXECUTED, %l0, %o6
	! save trap type value
	rdpr	%tt, %o7

	inc	%i7

check_desr_tt40:
	ldxa  [%g0]0x4c, %g2
	nop
  	setx	0xb300000000000000, %l0, %g3
	subcc	%g2, %g3, %g4
	brnz	%g4, test_failed 
	nop

check_DSFSR_tt32:
	set	0x18, %g1
	ldxa	[%g1]0x58, %g2
/*
	nop
	set	0x4, %g3
	subcc	%g2, %g3, %g4
	brnz	%g4, test_failed
	nop
*/

check_per_tt40:
	setx	SOC_PER_REG, %l7, %g1
	ldx	[%g1], %g2
	setx	0x8000000000000000, %g7, %g1
	set	0x1, %g3
	sllx	%g3, ERR_FIELD, %g4
	or	%g1, %g4, %g3
	sub	%g2, %g3, %g5
	brnz	%g5, test_failed
	nop

clear_per_tt40:
	setx	SOC_PER_REG, %l7, %g1
	stx	%g0, [%g1]
	nop

clear_ejr_tt40:
	setx	SOC_EJR_REG, %l7, %g1
	stx	%g0, [%g1]
	nop

clear_eie_tt40:
	setx	SOC_EIE_REG, %l7, %g1
	stx	%g0, [%g1]
	nop

trap_done_tt40:
 	done
	nop


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
