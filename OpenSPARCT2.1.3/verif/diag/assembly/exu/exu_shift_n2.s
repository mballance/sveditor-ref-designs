/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: exu_shift_n2.s
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
#define NUM_REG_CASES   2
#define NUM_IMMED_CASES 3    
   

/*******************************************************/    
#include "hboot.s"

.global main
main:
th_fork(th_main,%l0)		! start up to four threads.
	! All threads do the same thing. No need to run more than one core,
	! and no need to differentiate the threads because nobody stores
	! anything.
th_main_0:    
th_main_1:    
th_main_2:    
th_main_3:    
	!**************************
	! Operand2 as a register 
	!**************************
	set	rs1_data,%g1
	add	%g0,NUM_REG_CASES,%l0		
	wr	%g0,0xff,%ccr	    ! ccr set to ff. Should remain unchanged.

rs1_loop:
	ldx	[%g1],%l1
	add	%g0,65,%l2	    ! rs2 starts as 65
rs2_loop:   				    
	sll	%l1,%l2,%l3	    
	srl	%l1,%l2,%l3	    
	sra	%l1,%l2,%l3	    
	sllx	%l1,%l2,%l3	    
	srlx	%l1,%l2,%l3	    
	srax	%l1,%l2,%l3	    

	sub	%l2,0x1,%l2
	brgez,pt %l2,rs2_loop	    ! loop rs2 down to 0, inclusive
	nop
    
	! use rs1 value as the shift value just to put interesting things in
	! the upper bits of rs2.
	ldx	[%g1],%l2
	sll	%l1,%l2,%l3	    
	srl	%l1,%l2,%l3	    
	sra	%l1,%l2,%l3	    
	sllx	%l1,%l2,%l3	    
	srlx	%l1,%l2,%l3	    
	srax	%l1,%l2,%l3
    			    
	sub	%l0,1,%l0	    ! next rs1 value
	brnz,pt %l0,rs1_loop
	add	%g1,8,%g1	    ! move operand pointer

	!**************************
	! Operand2 as immediate 
	!**************************    
       
	set	immed_data,%g1
	add	%g0,NUM_IMMED_CASES,%l0
immed_loop:
	ldx	[%g1],%l1		
				   
	sll	%l1,0,%l3	    
	srl	%l1,0,%l3	    
	sra	%l1,0,%l3	    
	sllx	%l1,0,%l3	    
	srlx	%l1,0,%l3	    
	srax	%l1,0,%l3

    	sll	%l1,1,%l3	    
	srl	%l1,1,%l3	    
	sra	%l1,1,%l3	    
	sllx	%l1,1,%l3	    
	srlx	%l1,1,%l3	    
	srax	%l1,1,%l3

    	sll	%l1,2,%l3	    
	srl	%l1,2,%l3	    
	sra	%l1,2,%l3	    
	sllx	%l1,2,%l3	    
	srlx	%l1,2,%l3	    
	srax	%l1,2,%l3

    	sll	%l1,31,%l3	    
	srl	%l1,31,%l3	    
	sra	%l1,31,%l3	    
	sllx	%l1,31,%l3	    
	srlx	%l1,31,%l3	    
	srax	%l1,31,%l3     
    
	sllx	%l1,32,%l3	    
	srlx	%l1,32,%l3	    
	srax	%l1,32,%l3
    
	sllx	%l1,63,%l3	    
	srlx	%l1,63,%l3	    
	srax	%l1,63,%l3
    
    	sub	%l0,0x1,%l0
	brnz,pt	%l0,immed_loop
	add	%g1,8,%g1	    ! move operand pointer   

good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    


!==========================    
.data
.align 0x1fff+1

.global tsdata
rs1_data:                   
        .word 0x80000001, 0x80000001
	.word 0x55555555, 0x55555555
 

.global immed_data
immed_data: 
        .word 0x00000000, 0x00000001
	.word 0x33333333, 0x70000000
	.word 0xaaaaaaaa, 0xaaaaaaaa    

.end
