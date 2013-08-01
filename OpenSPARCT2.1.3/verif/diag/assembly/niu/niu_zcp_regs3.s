/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_zcp_regs3.s
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




#define FZC_ZCP_BASE_ADDRESS   	0x580000
#define NIU_BASE_ADDRESS       	0x8100000000
#define ZCP_ADDRESS_RANGE      	mpeval(NIU_BASE_ADDRESS + FZC_ZCP_BASE_ADDRESS)

#define ZCP_RDC_TBL    		0x10040
#define RDC_TBL              	mpeval(ZCP_ADDRESS_RANGE + ZCP_RDC_TBL)

#define ZCP_CFIG    		0x00000
#define CFIG              	mpeval(ZCP_ADDRESS_RANGE + ZCP_CFIG)

#define ZCP_INT_STAT_TEST    	0x00108
#define INT_STAT_TEST           mpeval(ZCP_ADDRESS_RANGE + ZCP_INT_STAT_TEST)

#define ZCP_INT_MASK    	0x00010
#define INT_MASK           	mpeval(ZCP_ADDRESS_RANGE + ZCP_INT_MASK)

#define ZCP_BAM4BUF    		0x00018
#define ZCP_BAM8BUF    		0x00020
#define ZCP_BAM16BUF   		0x00028
#define ZCP_BAM32BUF   		0x00030
#define BAM4BUF           	mpeval(ZCP_ADDRESS_RANGE + ZCP_BAM4BUF)


#define ZCP_DST4BUF    		0x00038
#define ZCP_DST8BUF    		0x00040
#define ZCP_DST16BUF   		0x00048
#define ZCP_DST32BUF   		0x00050
#define DST4BUF           	mpeval(ZCP_ADDRESS_RANGE + ZCP_DST4BUF)

#define ZCP_RAM_DATA0   	0x00058
#define ZCP_RAM_DATA1    	0x00060
#define ZCP_RAM_DATA2   	0x00068
#define ZCP_RAM_DATA3   	0x00070
#define ZCP_RAM_DATA4   	0x00078
#define RAM_DATA0           	mpeval(ZCP_ADDRESS_RANGE + ZCP_RAM_DATA0)

#define ZCP_RAM_BE0    		0x00080
#define RAM_BE0           	mpeval(ZCP_ADDRESS_RANGE + ZCP_RAM_BE0)

#define ZCP_RAM_ACC    		0x00088
#define RAM_ACC           	mpeval(ZCP_ADDRESS_RANGE + ZCP_RAM_ACC)

#define ZCP_BIT_DATA    	0x00090
#define BIT_DATA           	mpeval(ZCP_ADDRESS_RANGE + ZCP_BIT_DATA)

#define ZCP_RESET_CFIFO    	0x00098
#define RESET_CFIFO           	mpeval(ZCP_ADDRESS_RANGE + ZCP_RESET_CFIFO)

#define ZCP_TRAINING_VECTOR    	0x000c0
#define TRAINING_VECTOR        	mpeval(ZCP_ADDRESS_RANGE + ZCP_TRAINING_VECTOR)

/*
#define ZCP_CFIFO_ECC_PORT2    	0x000b0
#define CFIFO_ECC_PORT2        	mpeval(ZCP_ADDRESS_RANGE + ZCP_CFIFO_ECC_PORT2)
*/

#define DATA_EN_32BITS    	0x00000000ffffffff
#define DATA_EN_31BITS    	0x00000000ffffffff
#define DATA_EN_25BITS    	0x0000000001ffffff
#define DATA_EN_20BITS    	0x00000000000fffff
#define DATA_EN_17BITS    	0x00000000000fffff
#define DATA_EN_16BITS    	0x00000000000fffff
#define DATA_EN_14BITS    	0x0000000000003fff
#define DATA_EN_10BITS    	0x00000000000000ff
#define DATA_EN_8BITS    	0x00000000000000ff
#define DATA_EN_7BITS    	0x000000000000007f
#define DATA_EN_6BITS    	0x000000000000003f
#define DATA_EN_4BITS    	0x000000000000000f

#define INT_STAT_TEST_DATA_MASK 0x000000000000cfff

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID

    cmp  %o1,0x0
    bne  test_pass
    nop



!Write then read data of ZCP_RDC_TBL count 64 step x8 
 setx RDC_TBL,%g7,%g1
    setx wdata,%g7,%g2
    set  64,%g8

loop16:
    set  0x05,%g3
loop17:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx DATA_EN_4BITS, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop17
    nop
    add  %g1,8,%g1
    sub  %g8,1, %g8	
      %g8,%g0
    bne  loop16	 
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
