/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_ncu_ucb_csrs.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO


#define DRAM0_ERROR_COUNTER_REG		0x8400000298
#define DRAM1_ERROR_COUNTER_REG         0x8400001298
#define DRAM2_ERROR_COUNTER_REG         0x8400002298
#define DRAM3_ERROR_COUNTER_REG         0x8400003298

#define L2_BANK_ENABLE_REG		0x8000001020
#define NCU_CREG_DBGTRIG_EN		0x8000004000

#include "hboot.s"
#include "asi_s.h"
#include "err_defines.h"
#include "tcu_defines.h"


.text
.global	 main


main:
  ta	  T_CHANGE_HPRIV

/********************************
*  Write-Read DRAM ERROR COUNT REG
*********************************/
mcu0_wr_rd:
	setx	DRAM0_ERROR_COUNTER_REG, %g7, %g1
	set	0xffff, %g2
	stx	%g2, [%g1]
        ldx	[%g1], %g3
	cmp	%g3, %g2
	bne	%xcc, test_failed
	nop

        stx     %g0, [%g1]
        ldx     [%g1], %g3
        cmp     %g3, %g0        
        bne     %xcc, test_failed      
        nop

	set	0xaaaa, %g2
	stx	%g2, [%g1]

mcu1_wr_rd:
        setx	DRAM1_ERROR_COUNTER_REG, %g7, %g1
        set     0xffff, %g2
        stx     %g2, [%g1]
        ldx     [%g1], %g3
        cmp     %g3, %g2        
        bne     %xcc, test_failed      
        nop
	
        stx     %g0, [%g1]
        ldx     [%g1], %g3
        cmp     %g3, %g0        
        bne     %xcc, test_failed      
        nop

        set     0xaaaa, %g2
        stx     %g2, [%g1]


mcu2_wr_rd:
        setx	DRAM2_ERROR_COUNTER_REG, %g7, %g1
        set     0xffff, %g2
        stx     %g2, [%g1]
        ldx     [%g1], %g3
        cmp     %g3, %g2        
        bne     %xcc, test_failed      
        nop
	
        stx     %g0, [%g1]
        ldx     [%g1], %g3
        cmp     %g3, %g0        
        bne     %xcc, test_failed      
        nop

        set     0xaaaa, %g2
        stx     %g2, [%g1]


mcu3_wr_rd:
        setx	DRAM3_ERROR_COUNTER_REG, %g7, %g1
        set     0xffff, %g2
        stx     %g2, [%g1]
        ldx     [%g1], %g3
        cmp     %g3, %g2        
        bne     %xcc, test_failed      
        nop
	
        stx     %g0, [%g1]
        ldx     [%g1], %g3
        cmp     %g3, %g0        
        bne     %xcc, test_failed      
        nop

        set     0xaaaa, %g2
        stx     %g2, [%g1]


mcu0_rd:
        setx	DRAM0_ERROR_COUNTER_REG, %g7, %g1
        call	loop_rd
	nop
        nop
        nop

mcu1_rd:
        setx    DRAM1_ERROR_COUNTER_REG, %g7, %g1
	call	loop_rd
	nop
        nop
        nop

mcu2_rd:
        setx    DRAM2_ERROR_COUNTER_REG, %g7, %g1
	call	loop_rd
	nop
        nop
        nop

mcu3_rd:
        setx    DRAM3_ERROR_COUNTER_REG, %g7, %g1
	call	loop_rd
	nop
	nop
	nop


tcu_mbist_mode_reg:
	setx	MBIST_MODE_REG, %g7, %g1
	set	0xf, %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	cmp	%g3, %g2
	bne	%xcc, test_failed
	nop

	stx	%g0, [%g1]
	ldx	[%g1], %g3
	cmp	%g3, %g0
	bne	%xcc, test_failed
	nop


tcu_cyc_cntr_reg:
	setx	TCU_CYCLE_COUNTER_REG, %g7, %g1
	setx	0xffffffffffffffff, %g7, %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	cmp	%g3, %g2
	bne	%xcc, test_failed
	nop

	stx	%g0, [%g1]
	ldx	[%g1], %g3
	cmp	%g3, %g0
	bne	%xcc, test_failed
	nop

	set	0xaaaa, %g2
	stx	%g2, [%g1]

tcu_rd:
        call	loop_rd
	nop
	nop
	nop



ncu_creg_dbgtrig_en_Reg:
	setx	NCU_CREG_DBGTRIG_EN, %g7, %g1
	set	0x1, %g2
	stx	%g2, [%g1]
	ldx	[%g1], %g3
	nop


test_passesd:


test_passed:
EXIT_GOOD

test_failed:
EXIT_BAD



loop_rd:
	ldx	[%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
        ldx     [%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2
	ldx	[%g1], %g2

        set     0xaaaa, %g3
	cmp	%g3, %g2
	bne	%xcc, test_failed

	jmpl %o7+8, %g0
	nop

