/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: niu_fflp_regs.s
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

#define FFLP_L2_CLS_2           0x00000
#define FFLP_L2_CLS_3           0x00008
#define FFLP_L2_CLS_4           0x00010
#define FFLP_L3_CLS_5           0x00018
#define FFLP_L3_CLS_6           0x00020
#define FFLP_L3_CLS_7           0x00028
#define FFLP_CAM_KEY_REG0                20'h0_0090
#define FFLP_CAM_KEY_REG1                20'h0_0098
#define FFLP_CAM_KEY_REG2                20'h0_00a0
#define FFLP_CAM_KEY_REG3                20'h0_00a8
#define FFLP_CAM_KEY_MASK_REG0           20'h0_00b0
#define FFLP_CAM_KEY_MASK_REG1           20'h0_00b8
#define FFLP_CAM_KEY_MASK_REG2           20'h0_00c0
#define FFLP_CAM_KEY_MASK_REG3           20'h0_00c8
#define FFLP_CAM_CONTROL                 20'h0_00d0


#define FFLP_CONFIG             0x00100
#define FFLP_TCP_CFLAG_MASK     0x00108
#define FFLP_FCRAM_REF_TMR      0x00110
#define FZC_FFLP_BASE_OFFSET    0x020000
#define FZC_FFLP_BASE_ADDRESS   0x380000
#define NIU_BASE_ADDRESS        0x8100000000
#define FFLP_ADDRESS_RANGE      mpeval(NIU_BASE_ADDRESS + FZC_FFLP_BASE_ADDRESS + FZC_FFLP_BASE_OFFSET)
#define config                	mpeval(FFLP_ADDRESS_RANGE + FFLP_CONFIG)
#define tcp_cflag_mask          mpeval(FFLP_ADDRESS_RANGE + FFLP_TCP_CFLAG_MASK)
#define fcram_ref_tmr           mpeval(FFLP_ADDRESS_RANGE + FFLP_FCRAM_REF_TMR)
#define l2_cls_2                mpeval(FFLP_ADDRESS_RANGE + FFLP_L2_CLS_2)
#define l2_cls_3                mpeval(FFLP_ADDRESS_RANGE + FFLP_L2_CLS_3)
#define l2_cls_4                mpeval(FFLP_ADDRESS_RANGE + FFLP_L2_CLS_4)
#define cam_key_reg0            mpeval(FFLP_ADDRESS_RANGE + FFLP_CAM_KEY_REG0)
#define cam_key_reg1            mpeval(FFLP_ADDRESS_RANGE + FFLP_CAM_KEY_REG1)
#define cam_key_mask_reg0            mpeval(FFLP_ADDRESS_RANGE + FFLP_CAM_KEY_MASK_REG0)
#define cam_key_mask_reg1            mpeval(FFLP_ADDRESS_RANGE + FFLP_CAM_KEY_MASK_REG1)

#define FFLP_CONFIG_DATA_MASK   	0x0000000007ffffff
#define FFLP_TCP_CFLAG_MASK_DATA_MASK   0x0000000000000fff
#define FFLP_FCRAM_REF_TMR_DATA_MASK 	0x00000000ffffffff
#define FFLP_L2_CLS_2_DATA_MASK	  	0x000000000001ffff
#define FFLP_L2_CLS_4_DATA_MASK	  	0x0000000003ffffff
#define FFLP_CAM_KEY_REG0_DATA_MASK  	0x00000000000000ff
#define FFLP_CAM_KEY_REG1_DATA_MASK  	0xffffffffffffffff

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   T_RD_THID

//    cmp  %o1,0x0
//    bne  test_pass
    nop
/*

!Write then read data of  FFLP_CONFIG   
 setx config,%g7,%g1
    setx wdata,%g7,%g2
    set  0x05,%g3


loop1:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5

    setx FFLP_CONFIG_DATA_MASK, %g7, %g6 
    and %g4, %g6, %g4	
    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop1
    nop



!Write then read data of  FFLP_TCP_CFLAG_MASK   
 setx tcp_cflag_mask,%g7,%g1
    setx wdata,%g7,%g2
    set  0x05,%g3

loop2:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5

    setx FFLP_TCP_CFLAG_MASK_DATA_MASK, %g7, %g6 
    and %g4, %g6, %g4	
    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop2
    nop


!Write then read data of  FFLP_FCRAM_REF_TMR   
 setx fcram_ref_tmr,%g7,%g1
    setx wdata,%g7,%g2
    set  0x05,%g3

loop3:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx FFLP_FCRAM_REF_TMR_DATA_MASK, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop3
    nop


!Write then read data of  FFLP_L2_CLS_2   
 setx l2_cls_2,%g7,%g1
    setx wdata,%g7,%g2
    set  0x05,%g3

loop4:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx FFLP_L2_CLS_2_DATA_MASK, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop4
    nop


!Write then read data of  FFLP_L2_CLS_3   
 setx l2_cls_3,%g7,%g1
    setx wdata,%g7,%g2
    set  0x05,%g3

loop5:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx FFLP_L2_CLS_2_DATA_MASK, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop5
    nop


!Write then read data of  FFLP_L2_CLS_4   ~ FFLP_L2_CLS_7
    setx l2_cls_4,%g7,%g1
    setx wdata,%g7,%g2
    set  0x04,%g8

loop6:
    set  0x05,%g3
loop7:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx FFLP_L2_CLS_4_DATA_MASK, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop7
    nop
    add  %g1,8,%g1
    sub  %g8,1,%g8
    cmp  %g8,%g0
    bne  loop6	 
    nop
*/

!Write then read data of  FFLP_CAM_KEY_REG0~ FFLP_CAM_KEY_REG3,
 setx cam_key_reg0,%g7,%g1
    setx wdata,%g7,%g2
    set  0x04,%g8

loop8:
    set  0x05,%g3
loop9:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx FFLP_CAM_KEY_REG1_DATA_MASK, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop9
    nop
    add  %g1,8,%g1
    sub  %g8,1,%g8
    cmp  %g8,%g0
    bne  loop8	 
    nop




!Write then read data of   FFLP_CAM_KEY_MASK_REG1~FFLP_CAM_KEY_MASK_REG3 
 setx cam_key_mask_reg1,%g7,%g1
    setx wdata,%g7,%g2
    set  0x04,%g8

loop11:
    set  0x05,%g3
loop12:
    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    setx FFLP_CAM_KEY_REG1_DATA_MASK, %g7, %g6 
    and %g4, %g6, %g4	

    cmp %g4, %g5
  
    bne %xcc, test_fail


    add  %g2,8,%g2
    sub  %g3,1,%g3
    cmp  %g3,%g0
    bne  loop12
    nop
    add  %g1,8,%g1
    sub  %g8,1,%g8
    cmp  %g8,%g0
    bne  loop11	 
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
