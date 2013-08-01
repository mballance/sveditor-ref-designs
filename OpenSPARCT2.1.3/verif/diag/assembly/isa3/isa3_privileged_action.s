/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_privileged_action.s
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
#define	    RETURN_POINTER	%l7
#define	    TRAP_COUNTER	%o0
#define	    COUNTER		%o1	
		
#define PRIVILEGED_ACTION_ENABLE  
				

#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
	add	TRAP_COUNTER, 0x1, TRAP_COUNTER	; \
	wrpr	RETURN_POINTER, 0, %tnpc ; \
	done			; \
	nop			; 

			
#include "hboot.s"	
	
.text
.global main

main:		/* test begin */
	clr	TRAP_COUNTER
	set	0x1, COUNTER	
	setx	asi_inst_mask_reg, %i0, RETURN_POINTER
	ldxa	[%g0]ASI_LSU_CONTROL, %g1    
	ba	abnormal_end
asi_inst_mask_reg:
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end	
	add	COUNTER, 0x1, COUNTER 
	setx	asi_icache_instr, %i0, RETURN_POINTER	
	ldxa	[%g0]ASI_INST_MASK, %g1
	ba	abnormal_end
asi_icache_instr:
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 		
	setx	asi_icache_tag, %i0, RETURN_POINTER	
	ldxa	[%g0]ASI_ICACHE_INSTR, %g1
	ba	abnormal_end
asi_icache_tag:	
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_lsu_diag_reg, %i0, RETURN_POINTER	
	ldxa	[%g0]ASI_ICACHE_TAG, %g1
	ba	abnormal_end
asi_lsu_diag_reg:
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_dcache_data, %i0, RETURN_POINTER	
	ldxa	[%g0]ASI_LSU_DIAG, %g1
	ba	abnormal_end
asi_dcache_data:
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_dcache_tag, %i0, RETURN_POINTER	
	ldxa	[%g0]ASI_DCACHE_DATA, %g1
	ba	abnormal_end
asi_dcache_tag:		
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_sparc_bist_control, %i0, RETURN_POINTER	
	ldxa	[%g0]ASI_DCACHE_TAG, %g1
	ba	abnormal_end		
asi_sparc_bist_control:
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_itlb_probe, %i0, RETURN_POINTER	 
	ldxa	[%g0]ASI_SPARC_BIST_CONTROL, %g1
	ba	abnormal_end
asi_itlb_probe:	
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_itlb_data_in_0, %i0, RETURN_POINTER	 
	ldxa	[%g0]ASI_ITLB_PROBE, %g1
	ba	abnormal_end
asi_itlb_data_in_0:		
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_itlb_data_in_1, %i0, RETURN_POINTER	 
	ldxa	[%g0]ASI_ITLB_DATA_IN, %g1
	ba	abnormal_end
asi_itlb_data_in_1:		
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_itlb_data_in_2, %i0, RETURN_POINTER
	mov	0x400, %g2	 
	ldxa	[%g2]ASI_ITLB_DATA_IN, %g1
	ba	abnormal_end	
asi_itlb_data_in_2:		
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_itlb_data_in_3, %i0, RETURN_POINTER
	mov	0x800, %g2	 
	ldxa	[%g2]ASI_ITLB_DATA_IN, %g1
	ba	abnormal_end
asi_itlb_data_in_3:		
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_itlb_data_access_reg, %i0, RETURN_POINTER
	mov	0xc00, %g2	 
	ldxa	[%g2]ASI_ITLB_DATA_IN, %g1
	ba	abnormal_end
asi_itlb_data_access_reg:		
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_itlb_tag_read_reg, %i0, RETURN_POINTER	 
	ldxa	[%g0]ASI_ITLB_DATA_ACCESS_REG, %g1
	ba	abnormal_end
asi_itlb_tag_read_reg:		
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_ifu_control, %i0, RETURN_POINTER	 
	ldxa	[%g0]ASI_ITLB_TAG_READ_REG, %g1
	ba	abnormal_end
asi_ifu_control:			
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	asi_ifu_control_value, %i0, RETURN_POINTER	 
	ldxa	[%g0]ASI_IFU_CONTROL, %g1
	ba	abnormal_end
asi_ifu_control_value:			
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	add	COUNTER, 0x1, COUNTER 
	setx	normal_end, %i0, RETURN_POINTER
	set	0x90, %g2
	ldxa	[%g2]ASI_IFU_CONTROL, %g1
	ba	abnormal_end		
normal_end:
	cmp	TRAP_COUNTER, COUNTER
	bne	abnormal_end
	nop			
	EXIT_GOOD

abnormal_end:
	EXIT_BAD
	






