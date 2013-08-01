/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ncu_tcu_nack.s
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
#define H_HT0_Data_access_error_0x32  My_Precise_data_access_error_trap

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO


#define FFLP_CONFIG             0x00100
#define FZC_FFLP_BASE_OFFSET    0x020000
#define FZC_FFLP_BASE_ADDRESS   0x380000

#include "hboot.s"
!#include "asi_s.h"
!#include "err_defines.h"

.text
.global	 main
.global  My_Precise_data_access_error_trap



main:
    ta   T_CHANGE_HPRIV

get_th_id:
    ta   %icc, T_RD_THID


	cmp     %o1, 0
	be 	thread_0
	nop 	

	cmp     %o1, 1
	be 	thread_1
	nop

	 cmp     %o1, 2
	 be      thread_2
	 nop

	 cmp     %o1, 3
	 be      thread_3
	 nop

	 cmp     %o1, 4
	 be      thread_4
	 nop

	 cmp     %o1, 5
	 be      thread_5
	 nop

	 cmp     %o1, 6
	 be      thread_6
	 nop

	 cmp     %o1, 7
	 be      thread_7
	 nop

	 cmp     %o1, 8
	 be      thread_8
	 nop

	 cmp     %o1, 9
	 be      thread_9
	 nop

	 cmp     %o1, 10
	 be      thread_10
	 nop

	 cmp     %o1, 11
	 be      thread_11
	 nop

	 cmp     %o1, 12
	 be      thread_12
	 nop

	 cmp     %o1, 13
	 be      thread_13
	 nop

	 cmp     %o1, 14
	 be      thread_14
	 nop

	 cmp     %o1, 15
	 be      thread_15
	 nop

	 cmp     %o1, 16
	 be      thread_16
	 nop

	 cmp     %o1, 17
	 be      thread_17
	 nop

	 cmp     %o1, 18
	 be      thread_18
	 nop

	 cmp     %o1, 19
	 be      thread_19
	 nop

	 cmp     %o1, 20
	 be      thread_20
	 nop

	 cmp     %o1, 21
	 be      thread_21
	 nop

	 cmp     %o1, 22
	 be      thread_22
	 nop

	 cmp     %o1, 23
	 be      thread_23
	 nop

	 cmp     %o1, 24
	 be      thread_24
	 nop

	 cmp     %o1, 25
	 be      thread_25
	 nop

	 cmp     %o1, 26
	 be      thread_26
	 nop

	 cmp     %o1, 27
	 be      thread_27
	 nop

	 cmp     %o1, 28
	 be      thread_28
	 nop

	 cmp     %o1, 29
	 be      thread_29
	 nop

	 cmp     %o1, 30
	 be      thread_30
	 nop

	 cmp     %o1, 31
	 be      thread_31
	 nop

	 cmp     %o1, 32
	 be      thread_32
	 nop

	 cmp     %o1, 33
	 be      thread_33
	 nop

	 cmp     %o1, 34
	 be      thread_34
	 nop

	 cmp     %o1, 35
	 be      thread_35
	 nop

	 cmp     %o1, 36
	 be      thread_36
	 nop

	 cmp     %o1, 37
	 be      thread_37
	 nop

	 cmp     %o1, 38
	 be      thread_38
	 nop

	 cmp     %o1, 39
	 be      thread_39
	 nop

	 cmp     %o1, 40
	 be      thread_40
	 nop

	 cmp     %o1, 41
	 be      thread_41
	 nop

	 cmp     %o1, 42
	 be      thread_42
	 nop

	 cmp     %o1, 43
	 be      thread_43
	 nop

	 cmp     %o1, 44
	 be      thread_44
	 nop

	 cmp     %o1, 45
	 be      thread_45
	 nop

	 cmp     %o1, 46
	 be      thread_46
	 nop

	 cmp     %o1, 47
	 be      thread_47
	 nop

	 cmp     %o1, 48
	 be      thread_48
	 nop

	 cmp     %o1, 49
	 be      thread_49
	 nop

	 cmp     %o1, 50
	 be      thread_50
	 nop

	 cmp     %o1, 51
	 be      thread_51
	 nop

	 cmp     %o1, 52
	 be      thread_52
	 nop

	 cmp     %o1, 53
	 be      thread_53
	 nop

	 cmp     %o1, 54
	 be      thread_54
	 nop

	 cmp     %o1, 55
	 be      thread_55
	 nop

	 cmp     %o1, 56
	 be      thread_56
	 nop

	 cmp     %o1, 57
	 be      thread_57
	 nop

	 cmp     %o1, 58
	 be      thread_58
	 nop

	 cmp     %o1, 59
	 be      thread_59
	 nop

	 cmp     %o1, 60
	 be      thread_60
	 nop

	 cmp     %o1, 61
	 be      thread_61
	 nop

	 cmp     %o1, 62
	 be      thread_62
	 nop

	 cmp     %o1, 63
	 be      thread_63
	 nop


thread_63:
	 call sleep
	 nop

thread_62:
	 call sleep
	 nop

thread_61:
	 call sleep
	 nop

thread_60:
	 call sleep
	 nop

thread_59:
	 call sleep
	 nop

thread_58:
	 call sleep
	 nop

thread_57:
	 call sleep
	 nop

thread_56:
	 call sleep
	 nop

thread_55:
	 call sleep
	 nop

thread_54:
	 call sleep
	 nop

thread_53:
	 call sleep
	 nop

thread_52:
	 call sleep
	 nop

thread_51:
	 call sleep
	 nop

thread_50:
	 call sleep
	 nop

thread_49:
	 call sleep
	 nop

thread_48:
	 call sleep
	 nop

thread_47:
	 call sleep
	 nop

thread_46:
	 call sleep
	 nop

thread_45:
	 call sleep
	 nop

thread_44:
	 call sleep
	 nop

thread_43:
	 call sleep
	 nop

thread_42:
	 call sleep
	 nop

thread_41:
	 call sleep
	 nop

thread_40:
	 call sleep
	 nop

thread_39:
	 call sleep
	 nop

thread_38:
	 call sleep
	 nop

thread_37:
	 call sleep
	 nop

thread_36:
	 call sleep
	 nop

thread_35:
	 call sleep
	 nop

thread_34:
	 call sleep
	 nop

thread_33:
	 call sleep
	 nop

thread_32:
	 call sleep
	 nop

thread_31:
	 call sleep
	 nop

thread_30:
	 call sleep
	 nop

thread_29:
	 call sleep
	 nop

thread_28:
	 call sleep
	 nop

thread_27:
	 call sleep
	 nop

thread_26:
	 call sleep
	 nop

thread_25:
	 call sleep
	 nop

thread_24:
	 call sleep
	 nop

thread_23:
	 call sleep
	 nop

thread_22:
	 call sleep
	 nop

thread_21:
	 call sleep
	 nop

thread_20:
	 call sleep
	 nop

thread_19:
	 call sleep
	 nop

thread_18:
	 call sleep
	 nop

thread_17:
	 call sleep
	 nop

thread_16:
	 call sleep
	 nop

thread_15:
	 call sleep
	 nop

thread_14:
	 call sleep
	 nop

thread_13:
	 call sleep
	 nop

thread_12:
	 call sleep
	 nop

thread_11:
	 call sleep
	 nop

thread_10:
	 call sleep
	 nop

thread_9:
	 call sleep
	 nop

thread_8:
	 call sleep
	 nop

thread_7:
	 call sleep
	 nop

thread_6:
   call sleep
   nop

thread_5:
   call sleep
   nop


thread_4:
   call sleep
   nop

thread_3:
   call sleep
   nop

thread_2:
   call sleep
   nop

thread_1:
   call sleep
   nop


thread_0:
tcu_ack:
 setx 0x8500000000, %g7,%g1
    setx debug_cnt_en,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5
    cmp %g4, %g5

    bne %xcc, test_fail
    nop

   call sleep
   nop
tcu_nack:
!Write then read data of  DEBUG counter enbalbe REG of TCU block
 setx 0x85f0000000, %g7,%g1
    setx 0,%g7,%o5
    ldx  [%g1],%g4
    cmp %g0, %o5
    be %xcc, test_fail
    nop

   call sleep
   nop

tcu_ack1:
 setx 0x8500000000, %g7,%g1
    setx debug_cnt_en,%g7,%g2

    ldx  [%g2],%g4
    stx  %g4,[%g1]

    ldx [%g1], %g5
    cmp %g4, %g5

    bne %xcc, test_fail
    nop

    ba test_pass
    nop

My_Precise_data_access_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o5
  ! save trap type value
  rdpr  %tt, %o1
  done
  nop


sleep:
    setx 0x0000008000000a00,%l1,%l2
    set	 1,%l3
    set  0, %l0	


sleep_loop:
    ldx	 [%l2],%l4
    sub	 %l3,1,%l3
    cmp	 %l3,%l0
    bne	 sleep_loop 
    nop
    retl
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

