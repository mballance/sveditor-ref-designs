/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: exu_sub_n2.s
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
#define NUM_REG_CASES  17
#define NUM_IMMED_CASES 5    

! for tsubcctv cases
#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow \
rdpr	%tstate, %i1; \
rdpr	%tt, %i1; \
rdpr	%tpc, %i0; \
rdpr	%tnpc, %i1; \
done; \
nop;    

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
	set	rs2_data,%g1
	add	%g0,NUM_REG_CASES,%l3		
rs2_loop:
	ldx	[%g1],%l1
	ldx	[%g1+8],%l2

				    ! ccr clear
	wr	%g0,%g0,%ccr	  
	sub	%l1,%l2,%l4

    	wr	%g0,%g0,%ccr	    
	subc	%l1,%l2,%l5	    
    				    
    	wr	%g0,%g0,%ccr	    
	subcc	%l1,%l2,%l6	    
				    
    	wr	%g0,%g0,%ccr	    
	subccc	%l1,%l2,%l7	    
    				    
    	wr	%g0,%g0,%ccr	    
	tsubcc	%l1,%l2,%l0
    				    
    	wr	%g0,%g0,%ccr	    
	tsubcctv %l1,%l2,%l4    	    
				    
				    ! icc.c set		    
	wr	%g0,0x1,%ccr	    
	sub	%l1,%l2,%l6	    
				    
       	wr	%g0,0x1,%ccr	    
	subc	%l1,%l2,%l7	    
				    
	wr	%g0,0x1,%ccr	    
	subcc	%l1,%l2,%l0	    
				    
	wr	%g0,0x1,%ccr	    
	subccc	%l1,%l2,%l4	    
				    
	wr	%g0,0x1,%ccr	    
	tsubcc	%l1,%l2,%l5
    				    
	wr	%g0,0x1,%ccr	    
	tsubcctv %l1,%l2,%l6

				    ! icc.c clear, xcc.c set		    
	wr	%g0,0x10,%ccr	    
	sub	%l1,%l2,%l0	    
				    
       	wr	%g0,0x10,%ccr	    
	subc	%l1,%l2,%l7	    
				    
	wr	%g0,0x10,%ccr	    
	subcc	%l1,%l2,%l6	    
				    
	wr	%g0,0x10,%ccr	    
	subccc	%l1,%l2,%l5	    
				    
	wr	%g0,0x10,%ccr	    
	tsubcc	%l1,%l2,%l4
    				    
	wr	%g0,0x10,%ccr	    
	tsubcctv %l1,%l2,%l0
    
				    ! icc.c set, xcc.c set		    
	wr	%g0,0x11,%ccr	    
	sub	%l1,%l2,%l4	    
				    
       	wr	%g0,0x11,%ccr	    
	subc	%l1,%l2,%l6	    
				    
	wr	%g0,0x11,%ccr	    
	subcc	%l1,%l2,%l0	    
				    
	wr	%g0,0x11,%ccr	    
	subccc	%l1,%l2,%l5	    
				    
	wr	%g0,0x11,%ccr	    
	tsubcc	%l1,%l2,%l7
				    
	wr	%g0,0x11,%ccr	    
	tsubcctv %l1,%l2,%l6                

	sub	%l3,0x1,%l3
	brnz,pt	%l3,rs2_loop
	add	%g1,0x10,%g1	    ! move operand pointer

	!**************************
	! Operand2 as immediate 
	!**************************    
				    ! hit a all cases of tsubcc bits 1:0
	set	tsub_data,%g1
	add	%g0,4,%l3
tsub_loop:
	ldx	[%g1],%l1
	
	tsubcc	%l1,0x0,%l2
	tsubcc	%l1,0x1,%l2
	tsubcc	%l1,0x2,%l2
	tsubcc	%l1,0x3,%l2
    
	tsubcctv %l1,0x0,%l2
	tsubcctv %l1,0x1,%l2
	tsubcctv %l1,0x2,%l2
	tsubcctv %l1,0x3,%l2        
    
	sub	%l3,0x1,%l3
	brnz,pt	%l3,tsub_loop
	add	%g1,8,%g1	    ! move operand pointer   
    
       
	set	immed_data,%g1
	add	%g0,NUM_IMMED_CASES,%l3
immed_loop:
	ldx	[%g1],%l1		
				    ! ccr clear, immed = 0
	wr	%g0,%g0,%ccr	  
	sub	%l1,0,%l4

    	wr	%g0,%g0,%ccr	    
	subc	%l1,0,%l5	    
    				    
    	wr	%g0,%g0,%ccr	    
	subcc	%l1,0,%l6	    
				    
    	wr	%g0,%g0,%ccr	    
	subccc	%l1,0,%l7	    
    				    
    	wr	%g0,%g0,%ccr	    
	tsubcc	%l1,0,%l0
    				    
    	wr	%g0,%g0,%ccr	    
	tsubcctv %l1,0,%l4

    				    ! ccr clear, immed = fff (max positive)
	wr	%g0,%g0,%ccr	  
	sub	%l1,0xfff,%l4

    	wr	%g0,%g0,%ccr	    
	subc	%l1,0xfff,%l5	    
    				    
    	wr	%g0,%g0,%ccr	    
	subcc	%l1,0xfff,%l6	    
				    
    	wr	%g0,%g0,%ccr	    
	subccc	%l1,0xfff,%l7	    
    				    
    	wr	%g0,%g0,%ccr	    
	tsubcc	%l1,0xfff,%l0
    				    
    	wr	%g0,%g0,%ccr	    
	tsubcctv %l1,0xfff,%l4

    				    ! ccr clear, immed = 1fff (-1)
	wr	%g0,%g0,%ccr	  
	sub	%l1,0x1fff,%l4

    	wr	%g0,%g0,%ccr	    
	subc	%l1,0x1fff,%l5	    
    				    
    	wr	%g0,%g0,%ccr	    
	subcc	%l1,0x1fff,%l6	    
				    
    	wr	%g0,%g0,%ccr	    
	subccc	%l1,0x1fff,%l7	    
    				    
    	wr	%g0,%g0,%ccr	    
	tsubcc	%l1,0x1fff,%l0
    				    
    	wr	%g0,%g0,%ccr	    
	tsubcctv %l1,0x1fff,%l4

        				    ! ccr set, immed = assorted
	wr	%g0,0x11,%ccr	  
	sub	%l1,0x1000,%l4

    	wr	%g0,0x11,%ccr	    
	subc	%l1,0x01ff,%l5	    
    				    
    	wr	%g0,0x11,%ccr	    
	subcc	%l1,0x1234,%l6	    
				    
    	wr	%g0,0x11,%ccr	    
	subccc	%l1,0x1fff,%l7	    
    				    
    	wr	%g0,0x11,%ccr	    
	tsubcc	%l1,0x11,%l0
    				    
    	wr	%g0,0x11,%ccr	    
	tsubcctv %l1,0x1ffc,%l4    
    
    	sub	%l3,0x1,%l3
	brnz,pt	%l3,immed_loop
	add	%g1,8,%g1	    ! move operand pointer   

good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    


!==========================    
.data
.align 0x1fff+1

.global tsdata
rs2_data:                   
        .word 0x00000000, 0x00000000	! xcc.z, icc.z (0-0)
        .word 0x00000000, 0x00000000
    
        .word 0x80000000, 0x80000000	! xcc.n, icc.n (x-0)
        .word 0x00000000, 0x00000000
    
        .word 0x00000000, 0x80000000	! xcc.z, icc.z (x-x)
	.word 0x00000000, 0x80000000	  
     					  
	.word 0x80000000, 0x00000000	! xcc.z, icc.z (x-x)
	.word 0x80000000, 0x00000000	  
					  
	.word 0xaaaaaaaa, 0x22222222	! xcc.n (x-0)
	.word 0x00000000, 0x00000000	  
					  
	.word 0x00000000, 0x00000000	! xcc.c, icc.c (0-x)
	.word 0xffffffff, 0xffffffbe	  
       					  
        .word 0x00000000, 0x7fffffff	! xcc.nc, icc.nvc
        .word 0x00000000, 0xffffffff	  
    					  
	.word 0xffffffff, 0xffffffff	! xcc.n, icc.z
	.word 0x00000000, 0xffffffff	  
					  
	.word 0x00000000, 0x80000000	! icc.v
	.word 0x00000000, 0x00000001	  
        				  
        .word 0x00000000, 0x00000000	! xcc.nc, icc.c
        .word 0x00000000, 0xffffffff	  
    					  
        .word 0xffffffff, 0xffffffff	! xcc.n, icc.z
        .word 0x7fffffff, 0xffffffff	  
    					  
	.word 0xffffffff, 0xffffffff	! xcc.z, icc.z
	.word 0xffffffff, 0xffffffff	  
    					  
	.word 0xffffffff, 0xffffffff	! xcc.n, icc.n
	.word 0x00000000, 0x00000001	  
    					  
	.word 0x80000000, 0x00000000	! xcc.v, icc.nvc
	.word 0x00000000, 0x00000001	  
        				  
	.word 0x00000000, 0x00000000	! xcc.c, icc.c
	.word 0xffffffff, 0xffffffff	  
					  
	.word 0x87654321, 0x56789abd	! 64:-x - -y, xcc.nc, icc.nc
	.word 0x96312468, 0x7abcdef1	! 32:+x - +y
					  
	.word 0x56789abc, 0x87654320	! 64:+x - -y, xcc.nvc, icc.v
	.word 0x9abcdef1, 0x4631246a	! 32:-x - +y

.global tsub_data
tsub_data:  
	.word 0x0, 0xc			! <1:0> = 00
	.word 0x0, 0x1
        .word 0x0, 0xe			! <1:0> = 01
	.word 0x0, 0x3

.global immed_data
immed_data: 
	.word 0x00000000, 0x00000000
	.word 0x00000000, 0x7fffffff
	.word 0x00000000, 0x00000001
	.word 0x7fffffff, 0xffffffff
	.word 0xffffffff, 0xffffffff    
            

.end
