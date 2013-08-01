/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_ipp_regs.s
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




#define FZC_IPP_BASE_ADDRESS   0x280000
#define NIU_BASE_ADDRESS       0x8100000000
#define IPP_ADDRESS_RANGE      mpeval(NIU_BASE_ADDRESS + FZC_IPP_BASE_ADDRESS)

#define IPP_CFIG    		0x00000
#define IPP_CFIG1    		0x00000
#define IPP_CFIG2    		0x08000
#define CFIG              	mpeval(IPP_ADDRESS_RANGE + IPP_CFIG)
#define CFIG1              	mpeval(IPP_ADDRESS_RANGE + IPP_CFIG1)
#define CFIG2              	mpeval(IPP_ADDRESS_RANGE + IPP_CFIG2)

#define IPP_PKT_DIS1   		0x00020
#define IPP_PKT_DIS2   		0x08020
#define PKT_DIS1              	mpeval(IPP_ADDRESS_RANGE + IPP_PKT_DIS1)
#define PKT_DIS2              	mpeval(IPP_ADDRESS_RANGE + IPP_PKT_DIS2)

#define IPP_MSK1   		0x00048
#define IPP_MSK2   		0x08048
#define MSK1              	mpeval(IPP_ADDRESS_RANGE + IPP_MSK1)
#define MSK2              	mpeval(IPP_ADDRESS_RANGE + IPP_MSK2)

#define DATA_EN_32BITS    	0x00000000ffffffff
#define DATA_EN_25BITS          0x0000000001ffffff
#define DATA_EN_20BITS    	0x00000000000fffff
#define DATA_EN_14BITS    	0x0000000000003fff
#define DATA_EN_8BITS    	0x00000000000000ff
#define DATA_EN_7BITS    	0x000000000000007f
#define DATA_EN_6BITS    	0x000000000000003f

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID

//    cmp  %o1,0x0
//    bne  test_pass
    nop

!Write then read data of IPP_CFIG count 2 step x8000 
 setx CFIG,%g7,%g1
    setx wdata,%g7,%g2
    set  2,%g8

loop12:
    set  0x05,%g3
loop13:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_25BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop13
    nop
    add  %g1,2048,%g1
    sub  %g8,1, %g8	
    cmp  %g8,%g0
    bne  loop12	 
    nop

!Write then read data of  IPP_CFIG1  
 setx CFIG1,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop1:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_25BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop1
    nop



!Write then read data of  IPP_CFIG2  
 setx CFIG2,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop2:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_25BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop2
    nop



!Write then read data of  IPP_PKT_DIS1  
 setx PKT_DIS1,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop3:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_14BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop3
    nop



!Write then read data of  IPP_PKT_DIS2  
 setx PKT_DIS2,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop4:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_14BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop4
    nop



!Write then read data of  IPP_MSK1  
 setx MSK1,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop5:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_8BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop5
    nop


!Write then read data of  IPP_SMX_MSK2  
 setx MSK2,%g7,%g1
    setx wdata,%g7,%g2

    set  0x05,%g3
loop6:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_8BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop6
    nop


/*

!Write then read data of  IPP_SMX_CTL  count 64 step 8 
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




!Write then read data of  IPP_SMX_CFIG_DAT  count 64 step 8 
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


!Write then read data of  IPP_LDGITMRES  count 64 step 8 
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



!Write then read data of  IPP_DMA_BIND  count 64 step 8 
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
    cmp  %g8,%g0
    bne  loop10	 
    nop



!Write then read data of IPP_LDG_NUM count 69 step 8 
 setx LDG_NUM,%g7,%g1
    setx wdata,%g7,%g2
    set  64,%g8

loop12:
    set  0x05,%g3
loop13:
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
    bne  loop13
    nop
    add  %g1,8,%g1
    cmp  %g8,%g0
    bne  loop12	 
    nop


!Write then read data of IPP_SID count 69 step 8 
 setx SID,%g7,%g1
    setx wdata,%g7,%g2
    set  64,%g8

loop14:
    set  0x05,%g3
loop15:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_7BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop15
    nop
    add  %g1,8,%g1
    cmp  %g8,%g0
    bne  loop14	 
    nop

*/




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
