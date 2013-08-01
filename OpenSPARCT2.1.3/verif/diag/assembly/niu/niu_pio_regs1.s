/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_pio_regs1.s
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

#include "hboot.s"
!#include "asi_s.h"




#define FZC_PIO_BASE_ADDRESS   0x080000
#define NIU_BASE_ADDRESS       0x8100000000
#define PIO_ADDRESS_RANGE      mpeval(NIU_BASE_ADDRESS + FZC_PIO_BASE_ADDRESS)

#define PIO_DMA_BIND		0x10000
#define PIO_LDG_NUM 		0x20000
#define PIO_LDGITMRES 		0x00008
#define PIO_SID 		0x10200
#define PIO_SMX_CFIG_DAT 	0x00040
#define PIO_SMX_CTL      	0x00050
#define PIO_SMX_DBG_VEC      	0x00058
#define PIO_DBG_SEL      	0x00060
#define PIO_TRAIN_VEC      	0x00068
#define PIO_ARB_CTL      	0x00070
#define PIO_ARB_DBG_VEC      	0x00078

#define DMA_BIND           	mpeval(PIO_ADDRESS_RANGE + PIO_DMA_BIND)
#define LDG_NUM           	mpeval(PIO_ADDRESS_RANGE + PIO_LDG_NUM)
#define LDGITMRES            	mpeval(PIO_ADDRESS_RANGE + PIO_LDGITMRES)
#define SID                  	mpeval(PIO_ADDRESS_RANGE + PIO_SID)
#define ARB_CTL         	mpeval(PIO_ADDRESS_RANGE + PIO_ARB_CTL)
#define ARB_DBG_VEC         	mpeval(PIO_ADDRESS_RANGE + PIO_ARB_DBG_VEC)
#define SMX_CTL         	mpeval(PIO_ADDRESS_RANGE + PIO_SMX_CTL)
#define SMX_DBG_VEC         	mpeval(PIO_ADDRESS_RANGE + PIO_SMX_DBG_VEC)
#define DBG_SEL         	mpeval(PIO_ADDRESS_RANGE + PIO_DBG_SEL)
#define TRAIN_VEC         	mpeval(PIO_ADDRESS_RANGE + PIO_TRAIN_VEC)
#define SMX_CFIG_DAT         	mpeval(PIO_ADDRESS_RANGE + PIO_SMX_CFIG_DAT)

#define DMA_BIND_DATA_MASK   	0x0000000000003f3f
#define DATA_EN_32BITS    	0x00000000ffffffff
#define DATA_EN_20BITS    	0x00000000000fffff
#define DATA_EN_6BITS    	0x000000000000003f
#define DATA_EN_7BITS    	0x000000000000007f
#define SMX_CFIG_DAT_DATA_MASK 	0x00000000cfffffff

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID

//    cmp  %o1,0x0
//    bne  test_pass
    nop

!Write then read data of  PIO_ARB_DBG_VEC  
 setx ARB_DBG_VEC,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop1:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_32BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop1
    nop



!Write then read data of  PIO_ARB_CTL  
 setx ARB_CTL,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop2:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_32BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop2
    nop


!Write then read data of  PIO_TRAIN_VEC  
 setx TRAIN_VEC,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop3:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_32BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop3
    nop



!Write then read data of  PIO_SMX_DBG_VEC  
 setx SMX_DBG_VEC,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop4:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_32BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop4
    nop




!Write then read data of  PIO_DBG_SEL  
 setx DBG_SEL,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop5:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_6BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop5
    nop


!Write then read data of  PIO_SMX_DBG_VEC  
 setx SMX_DBG_VEC,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop6:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_32BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop6
    nop



!Write then read data of  PIO_SMX_CTL  count 64 step 8 
 setx SMX_CTL,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop7:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_32BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop7
    nop




!Write then read data of  PIO_SMX_CFIG_DAT  count 64 step 8 
 setx SMX_CFIG_DAT,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop8:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx SMX_CFIG_DAT_DATA_MASK, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop8
    nop


!Write then read data of  PIO_LDGITMRES  count 64 step 8 
 setx LDGITMRES,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop9:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_20BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop9
    nop


!Write then read data of  PIO_DMA_BIND  count 64 step 8 
 setx DMA_BIND,%g7,%g1
    setx wdata,%g7,%g2
    set  64,%g8

loop10:
    set  0x05,%g3
loop11:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DMA_BIND_DATA_MASK, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop11
    nop
    add  %g1,8,%g1
    sub  %g8,1,%g8
    cmp  %g8,%g0
    bne  loop10	 
    nop







/******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD


.data
.align 0x100
wdata:
    .xword 0xffffffffffffffff
    .xword 0xaaaaaaaaaaaaaaaa
    .xword 0x0000000000000000
    .xword 0x5555555555555555
    .xword 0x0123456789abcdef

.end
