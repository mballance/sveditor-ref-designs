/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: nmacros.h
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
#ifndef __NMACROS_H__
#define __NMACROS_H__
/******************  STRCAT(str1, str2, ...., str9) ***************************

 This is a support macro used to concatenate upto 9 strings (arguments)
 
******************************************************************************/

define(STRCAT, $1$2$3$4$5$6$7$8$9)

/***************************** INIT_DW_REG(val, reg) **************************

 This macro expands incrementally, depending on the size of the 'val' argument,
 to initialize the integer register 'reg'. No temporary register is required.
 
******************************************************************************/

define(INIT_DW_REG,
	`define(`hi_val', substr($1, 0, 10)) dnl
	 define(`lo_val2', STRCAT(0x, substr($1, 10, 2))) dnl
	 define(`lo_val1', STRCAT(0x, substr($1, 12, 3))) dnl
	 define(`lo_val0', STRCAT(0x, substr($1, 15))) 
	 set	hi_val, $2
	 sllx	$2, eval(len(lo_val2)*4-8), $2
	 or	$2, lo_val2, $2
	 ifelse(lo_val1,0x,,
	        `sllx	$2, eval(len(lo_val1)*4-8), $2
	 or	$2, lo_val1, $2')
	 ifelse(lo_val0,0x,,
	        `sllx   $2, eval(len(lo_val0)*4-8), $2
	 or     $2, lo_val0, $2')')

/************************** INIT_INT_REG(reg, val) ****************************

 This is a general purpose macro to initialize any 64 bit integer register 
 without having to use a temporary register. It uses `INIT_DW_REG' defined
 above. This macro forms the basis of all initialization/comparison macros 
 defined below.

******************************************************************************/

define(INIT_INT_REG, 
	`ifelse(substr($2,0,1),%,`mov	$2, $1',
	`ifelse(eval(len($2)>10),1,`INIT_DW_REG($2, $1)',`	set	$2, $1')')')

/*************************** CMP_INT_REG(reg, val) ****************************

 This macro compares 'val' with the contents of the integer register 'reg'. It
 uses %g4 as scratch register. Only one scratch register is required 
 irrespective of the size of 'val'. Note that the macro can replace ALL
 existing (integer) result checking macros with potentially fewer instructions
 for values > 32 bits and uses only ONE scratch register in all cases.

******************************************************************************/

define(CMP_INT_REG,
	`INIT_INT_REG(%g4, $2)
	 sub	$1, %g4, %g4
	 brz,pt	%g4, 1f
	 nop
	 ta	BAD_TRAP
1:')



/****************** MEM_STORE(val, dest_addr, offset) *************************

 This is a support macro used by the FP macros defined below. As evident from
 it's syntax, it stores 'val' at optional offset 'offset' from a base address 
 'dest_addr'. %g4 and %g5 are used as scratch registers. 

******************************************************************************/

define(MEM_STORE,
	`INIT_INT_REG(%g4, $1)
	 set	$2, %g5
	 ifelse(eval(len($3)>0),1,`add	%g5, $3, %g5')
	 ifelse(eval(len($1)>10),1,`stx	%g4, [%g5]',`st	%g4, [%g5]')')


/************************* INIT_FP_REG(freg, val1, val2) *********************

 This macro initializes the FP register 'freg' with a SP/DP/QP number. 'val2'
 is optional and should only be supplied for QP numbers. Note that the syntax
 is similar to the macro `INIT_INT_REG' defined above for initializing an
 integer register. 

 The macro uses %g4 and %g5 as scratch registers and a predefined area in 
 memory labeled 'scratch_area' for temporary storage.

******************************************************************************/

define(INIT_FP_REG,
	`MEM_STORE($2, scratch_area)					
	 ifelse(eval(len($3)>0),1,`MEM_STORE($3, scratch_area, 8)')	
	 set	scratch_area, %g5					
	 ifelse(eval(len($3)>0),1,`ldq	[%g5], $1',
		eval(len($2)>10),1,`ldd	[%g5], $1',`ld	[%g5], $1')')


/****************** INIT_TH_FP_REG(memptr, freg, val) ************************

 This macro initializes the FP register 'freg' with a SP/DP/QP number. 'val2'
 is optional and should only be supplied for QP numbers. Note that the syntax
 is similar to the macro `INIT_INT_REG' defined above for initializing an
 integer register. 

 The macro uses %g4 and %g5 as scratch registers and a predefined area in 
 memory pointed by memptr for temporary storage.

******************************************************************************/

define(INIT_TH_FP_REG,
	`setx $3, %g4, %g5
	stx %g5, [$1]
	ldd    [$1], $2')



/************************ COPY_REG(reg, copy_inst) **************************

 This macro copies register 'reg' to/from memory. The caller supplies the
 the instruction type for the desired data transfer. %g4 is assumed to contain 
 the memory address for the source/destination for the copy operation.

*****************************************************************************/

define(COPY_REG,
	`ifelse(substr($2, 0, 2),ld,`$2	[%g4], $1',`$2	$1, [%g4]')')


/************************* CMP_FP_REG(freg, val1, val2) **********************

 This macro compares a SP/DP/QP number in 'val1, val2' with the contents of 
 the FP register 'freg'. 'val2' is optional and should only be specified for 
 comparing QP values. Note the similarity in synatx with this macro's integer
 counterpart defined above in `CMP_INT_REG'. Also note that it can replace ALL
 result checking macros for FP values with potentially fewer instructions for
 DP and QP numbers.

 The macro uses %g4 and %g5 as scratch registers and a predefined area in 
 memory labeled 'scratch_area' for temporary storage.


*****************************************************************************/

define(CMP_FP_REG,
`	 set	scratch_area, %g4
	 ifelse(eval(len($3)>0),1,`COPY_REG($1, stq)',
                eval(len($2)>10),1,`COPY_REG($1, std)',`COPY_REG($1, st)')
	 ifelse(eval(len($2)>10),1,`COPY_REG(%g5, ldx)',`COPY_REG(%g5, ld)')
	 INIT_INT_REG(%g4, $2)
	 sub	%g4, %g5, %g4
	 brz,pt	%g4, 1f
	 nop
	 ta	BAD_TRAP
1:
	 ifelse(eval(len($3)>0),1,
`set	scratch_area+8, %g4
	 COPY_REG(%g5, ldx)
	 INIT_INT_REG(%g4, $3)
	 sub	%g4, %g5
	 brz,pt	%g4, 2f
	 nop
	 ta	BAD_TRAP
2:')
	 nop')	
	

/************************ INIT_REG(any_reg, val1, val2) *************************

 This is a truly generic macro for initializing any integer or FP register 
 without having to use separate macros. 'val2' is optional ans should only
 be supplied for QP (FP) numbers. The macro calls one of the two initialization
 macros defined above based on the register 'any_reg'. 

 For initializing a FP register, the macro uses %g4 and %g5 as scratch registers 
 and a predefined area in memory called 'scratch_area' for temporary storage.


*******************************************************************************/
define(INIT_REG,
	`ifelse(eval(len($3)>0),1,`define(`argc', 3)',`define(`argc', 3)')
	 define(`reg_id', substr($1, 0, 2))
	 ifelse(reg_id,%f,`define(`reg_id', FPR)',
		reg_id,%d,`define(`reg_id', FPR)',
		reg_id,%q,`define(`reg_id', FPR)',`define(`reg_id', IR)')
	 ifelse(reg_id,FPR,`ifelse(argc,2,`INIT_FP_REG($1, $2)',`INIT_FP_REG($1, $2, $3)')',`INIT_INT_REG($1, $2)')')


/************************ CMP_REG(any_reg, val1, val2) *************************

 This is a truly generic macro for comparing any integer or FP register with a
 value without having to use separate macros. 'val2' is optional and should only
 be supplied for QP (FP) numbers. The macro calls one of the two comparison
 macros defined above based on the register 'any_reg'. 

 For initializing a FP register, the macro uses %f16, %g4 and %g5 as scratch 
 registers and a predefined area in memory called 'scratch_area' for temporary 
 storage. Only %g4 is used as a scratch register for comparing an integer register.

*******************************************************************************/
define(CMP_REG,
	`ifelse(eval(len($3)>0),1,`define(`argc', 3)',`define(`argc', 3)')
	 define(`reg_id', substr($1, 0, 2))
	 ifelse(reg_id,%f,`define(`reg_id', FPR)',
		reg_id,%d,`define(`reg_id', FPR)',
		reg_id,%q,`define(`reg_id', FPR)',`define(`reg_id', IR)')
	 ifelse(reg_id,FPR,`ifelse(argc,2,`CMP_FP_REG($1, $2)',`CMP_FP_REG($1, $2, $3)')',`CMP_INT_REG($1, $2)')')


define(CLR_GLOBALS,
	`clr	%g1
	 clr	%g2
	 clr	%g3
	 clr	%g4
	 clr	%g5
	 clr	%g6
	 clr	%g7')	 

define(CLR_LOCALS,
	`clr	%l0
	 clr	%l1
	 clr	%l2
	 clr	%l3
	 clr	%l4
	 clr	%l5
	 clr	%l6
	 clr	%l7')	 

define(CLR_OUTS,
	`clr	%o0
	 clr	%o1
	 clr	%o2
	 clr	%o3
	 clr	%o4
	 clr	%o5
	 clr	%o6
	 clr	%o7')

define(CLR_INS,
	`clr	%i0
	 clr	%i1
	 clr	%i2
	 clr	%i3
	 clr	%i4
	 clr	%i5
	 clr	%i6
	 clr	%i7')

define(CLR_FPRF,
	`INIT_REG(%d0, 0x0000000000000000)
	 fmovd	%d0, %d2
	 fmovd	%d0, %d4
	 fmovd	%d0, %d6
	 fmovd	%d0, %d8
	 fmovd	%d0, %d10
	 fmovd	%d0, %d12
	 fmovd	%d0, %d14
	 fmovd	%d0, %d16
	 fmovd	%d0, %d18
	 fmovd	%d0, %d20
	 fmovd	%d0, %d22
	 fmovd	%d0, %d24
	 fmovd	%d0, %d26
	 fmovd	%d0, %d28
	 fmovd	%d0, %d30')


define(CLR_DIAG_REGS,	 
	`CLR_GLOBALS
	 CLR_LOCALS
	 CLR_OUTS
	 CLR_INS
	 CLR_FPRF')

define(CLR_1WIN1_LOCALS,
        `rdpr	%cwp, %g1
         inc	%g1
         wrpr   %g1, %cwp
         CLR_LOCALS
         dec	%g1
	 dec	%g1
	 wrpr	%g1, %cwp
	 CLR_LOCALS
	 inc	%g1
	 wrpr	%g1, %cwp')



define(LDST_OP,
	`ifelse(substr($1, 0, 2),ca,`$1	$2, $3, $4',`ifelse(substr($1, 0, 2),st,`$1	$3, $2',`$1	$2, $3')')') 



define(MAKE_DATA_PA,
	`INIT_REG(%g4, $1)
	mov	$2, $3
	sllx	$3, 51, $3
	srlx	$3, 51, $3		
	add	%g4, $3, $3		
	srlx	$3, 3, $3
	sllx	$3, 3, $3
	mov	1, %g4
	sllx	%g4, 39, %g4
	or	%g4, $3, $3')		

define(MAKE_TAG_PA,
	`INIT_REG(%g4, $1)
	mov	$2, $3
	sllx	$3, 51, $3
	srlx	$3, 51, $3		
	add	%g4, $3, $3
	srlx	$3, 6, $3
	sllx	$3, 6, $3
	mov	2, %g4
	sllx	%g4, 39, %g4
	or	%g4, $3, $3')		


define(UPSHIFT_INST,
	`ld	[$1], %g4
	 swap	[$1-4], %g4
	 st	%g4, [$1]
	 sub	$1, 4, $1		! New inst addr 
	 srlx	$1, 3, %g4
	 sllx	%g4, 3, %g4		! DW flush addr at/before inst after move 
	 flush	%g4
	 add	%g4, 8, %g5		! Next dW addr
	 flush	%g5')			! Needed in case inst was moved to word addr


define(ZERO_MEM,
	`mov	$1, %g4			! Starting MEM addr
	 set	$2, %g5			! ST count
1:
	 $3	%g0, [%g4]		! Zero fill
	 add	%g4, $4, %g4		! Next addr
	 dec	%g5			! Done?
	 brnz,a	%g5, 1b			! No: Continue
	 nop')				
	 


define(NOPS,
	`define( `NOP_COUNT', eval($1))	
	 define( `IT_COUNT', 1)		
	 GEN_INSTS')

define(GEN_INSTS,
	`nop dnl
         define(`IT_COUNT', incr(IT_COUNT))
         ifelse(eval(IT_COUNT>NOP_COUNT),1,,`GEN_INSTS')') 


define(BREAK_GROUP,
	`mov	%y, %g0')


#endif                           
