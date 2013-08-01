/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_ios.s
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


#define FFLP_CONFIG             0x00100
#define FZC_FFLP_BASE_OFFSET    0x020000
#define FZC_FFLP_BASE_ADDRESS   0x380000

#include "hboot.s"
!#include "asi_s.h"

.text
.global	 main


main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   %icc, T_RD_THID

//    cmp  %o1,0x0
//    bne  test_pass
    nop

acc_ssi_timeout:
!Write then read data of  INT_VEC_REG of NCU
    setx 0x000000ff00010088,%g7,%g1
    setx ssi_timeout, %g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5
    cmp %g4, %g5
    
    bne %xcc, test_fail

    nop


acc_debug_cnt_in_tcu:
!Write then read data of  DEBUG counter enbalbe REG of TCU block
 setx 0x00850000f8, %g7,%g1
    setx debug_cnt_en,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5
 !   cmp %g4, %g5

 !   bne %xcc, test_fail

    nop



acc_int_vec_in_ncu:
!Write then read data of  INT_VEC_REG of NCU
    setx 0x0000008000000a00,%g7,%g1
    setx int_vec_data,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5
    cmp %g4, %g5
    
    bne %xcc, test_fail

    nop

acc_reset_fee_in_rst:
!Write then read data of  RESET_FEE of RST block
 setx 0x0000008900000820,%g7,%g1
    setx reset_fee,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5

    bne %xcc, test_fail

    nop

acc_serdes_test_cfg_in_mcu0:
!Write then read data of  SERDES Test Configuration Bus Register of MCU0 block
 setx 0x00000084000008e0,%g7,%g1
    setx mcu_cfg_data,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5

    bne %xcc, test_fail

    nop
acc_serdes_test_cfg_in_mcu1:
!Write then read data of  SERDES Test Configuration Bus Register of MCU1 block
 setx 0x00000084000018e0,%g7,%g1
    setx mcu_cfg_data,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5

    cmp %g4, %g5

    bne %xcc, test_fail

    nop
acc_serdes_test_cfg_in_mcu2:
!Write then read data of  SERDES Test Configuration Bus Register of MCU2 block
 setx 0x00000084000028e0,%g7,%g1
    setx mcu_cfg_data,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5
    cmp %g4, %g5

    bne %xcc, test_fail


    nop
acc_serdes_test_cfg_in_mcu3:
!Write then read data of  SERDES Test Configuration Bus Register of MCU3 block
 setx 0x00000084000038e0,%g7,%g1
    setx mcu_cfg_data,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5
    cmp %g4, %g5

    bne %xcc, test_fail

    nop
acc_pll_ctl_in_ccu:
!Write then read data of  PLL_CTL Register of CCU block
 setx 0x0000008300000000,%g7,%g1
    setx pll_ctl_data,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5
    cmp %g4, %g5

    bne %xcc, test_fail

    nop

#ifndef VECTOR
acc_config_in_niu:
!Write then read data of  PLL_CTL Register of NIU block
 setx config,%g7,%g1
    setx config_data,%g7,%g2

    ldx  [%g2],%g4
    stxa  %g4,[%g1]ASI_PRIMARY_LITTLE
    nop
    nop

    ldxa [%g1]ASI_PRIMARY_LITTLE, %g5
    cmp %g4, %g5

    bne %xcc, test_fail

    nop
#endif

acc_int_en_in_dmu:
!Write then read data of  INT_EN Register of DMUCSR block
 setx 0x8800631008, %g7,%g1
    setx int_en_data,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5
    cmp %g4, %g5

    bne %xcc, test_fail

    nop



acc_debug_port_cfg_in_dbug1:
!Write then read data of  DEBUG_PORT_CONFIG of DBG1 block
 setx 0x8600000000, %g7,%g1
    setx dbg1_cfg,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5
#ifndef VECTOR
    cmp %g4, %g5

    bne %xcc, test_fail
#endif
    nop



******************************************************
 * Exit code
 *******************************************************/

test_pass:
EXIT_GOOD

test_fail:
EXIT_BAD


.data
.align 0x100
int_vec_data:
    .xword 0x000000000000002a
    .xword 0x000000000000003f
    .xword 0x0000000000000015
    .xword 0x0000000000000001
    .xword 0x0000000000000002
    .xword 0x0000000000000004
    .xword 0x0000000000000008
    .xword 0x0000000000000010
    .xword 0x0000000000000020


.align 0x100
reset_fee:
    .xword 0x000000000000ff00
    .xword 0x000000000000aa00
    .xword 0x0000000000005500
    .xword 0x0000000000000000
    .xword 0x0000000000008800
    .xword 0x0000000000002200

.align 0x100
mcu_cfg_data:
    .xword 0x000000000000ff00
    .xword 0x000000000000aa00
    .xword 0x0000000000005500
    .xword 0x0000000000000000
    .xword 0x0000000000000000
    .xword 0x0000000000000000

.align 0x100
ssi_timeout:
    .xword 0x0000000000ffffff
    .xword 0x0000000000aaaaaa
    .xword 0x0000000000555555
    .xword 0x000000000056789a
    .xword 0x0000000000df0123
    .xword 0x0000000000789abc

.align 0x100
pll_ctl_data:
    .xword 0x0000001fffffffff
    .xword 0x0000001aaaaaaaaa
    .xword 0x0000000555555555
    .xword 0x000000123456789a
    .xword 0x0000000bcedf0123
    .xword 0x0000001456789abc

.align 0x100
int_en_data:
    .xword 0x0000000000000fff
    .xword 0x0000000000000aaa
    .xword 0x0000000000000555
    .xword 0x000000000000089a
    .xword 0x0000000000000123
    .xword 0x0000000000000abc

.align 0x100
config_data:
    .xword 0x0000000000ffffff
    .xword 0x0000000000aaaaaa
    .xword 0x0000000000555555
    .xword 0x000000000056789a
    .xword 0x0000000000df0123
    .xword 0x0000000000789abc


.align 0x100
wdata:
    .xword 0xffffffffffffffff
    .xword 0xaaaaaaaaaaaaaaaa
    .xword 0x0000000000000000
    .xword 0x5555555555555555
    .xword 0x0123456789abcdef

.align 0x100
dbg1_cfg:
    .xword 0x00000000000000ff
    .xword 0x00000000000000aa
    .xword 0x0000000000000000
    .xword 0x0000000000000055

.align 0x100
debug_cnt_en:
    .xword 0x000000000000000f
    .xword 0x0000000000000000
    .xword 0x000000000000000a
    .xword 0x0000000000000005
    .xword 0x0000000000000002
    .xword 0x0000000000000004
.align 0x100
bit_1_data:
    .xword 0x0000000000000001
    .xword 0x0000000000000000
    .xword 0x0000000000000001
    .xword 0x0000000000000000

busy_data:
    .xword 0x0000000000000040
    .xword 0x0000000000000000
    .xword 0x0000000000000040
    .xword 0x0000000000000000

.align 0x100
data_xword:
    .xword 0x000000faaa000000
    .xword 0x000000fcad000000
    .xword 0x000000f555000000
    .xword 0x000000fabc000000

.end

