/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: asi_direct_01.s
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
#define SCONTEXT PCONTEXT
#define  H_HT0_DAE_invalid_asi_0x14
#define ENABLE_HT0_Interrupt_0x60
#define ENABLE_HT0_Illegal_instruction_0x10
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
        add %r30, 0x1, %r30; \
        done;nop;nop;nop;nop;nop;nop
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
	done;nop;nop;nop;nop;nop;nop;nop
# include "hboot.s"
.text
.global main
main:
main_text_start:
sub %g0, 0x1, %r31
sllx %r31, 0x6, %r31
sub %g0, 0x1, %r29
sllx %r29, 0x3, %r29
setx  SEC_CPPRI0_DATA_START, %r4, %r28
setx  SEC_CPPRI1_DATA_START, %r4, %r27
setx  SEC_CPPRI2_DATA_START, %r4, %r26
setx  SEC_CPPRI3_DATA_START, %r4, %r25
setx  SEC_CPPRI4_DATA_START, %r4, %r24
setx  SEC_CPPRI5_DATA_START, %r4, %r23
setx  SEC_CPPRI6_DATA_START, %r4, %r22
setx  SEC_CPPRI7_DATA_START, %r4, %r21
mov 0x80, %g1
wr %g1, %g0, %asi
     ta      %icc, T_RD_THID
        cmp     %o1, 1
        setx    LOOP_T1, %g2, %g3
        be,a    .+8
        jmp     %g3
        nop
        cmp     %o1, 2
        setx    LOOP_T2, %g2, %g3
        be,a    .+8
        jmp     %g3
        nop
        cmp     %o1, 3
        setx    LOOP_T3, %g2, %g3
        be,a    .+8
        jmp     %g3
        nop
        cmp     %o1, 4
        setx    LOOP_T4, %g2, %g3
        be,a    .+8
        jmp     %g3
        nop
        cmp     %o1, 5
        setx    LOOP_T5, %g2, %g3
        be,a    .+8
        jmp     %g3
        nop
        cmp     %o1, 6
        setx    LOOP_T6, %g2, %g3
        be,a    .+8
        jmp     %g3
        nop
        cmp     %o1, 7
        setx    LOOP_T7, %g2, %g3
        be,a    .+8
        jmp     %g3
        nop
ta T_CHANGE_HPRIV
 add %g0, 0x3, %r19
TH0_LOOP:
CASE_ASI_0x0_th0:
  wr %g0, 0x0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1_th0:
  wr %g0, 0x1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2_th0:
  wr %g0, 0x2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3_th0:
  wr %g0, 0x3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5_th0:
  wr %g0, 0x5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6_th0:
  wr %g0, 0x6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7_th0:
  wr %g0, 0x7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8_th0:
  wr %g0, 0x8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9_th0:
  wr %g0, 0x9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa_th0:
  wr %g0, 0xa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb_th0:
  wr %g0, 0xb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd_th0:
  wr %g0, 0xd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe_th0:
  wr %g0, 0xe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf_th0:
  wr %g0, 0xf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x12_th0:
  wr %g0, 0x12, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x13_th0:
  wr %g0, 0x13, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1a_th0:
  wr %g0, 0x1a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1b_th0:
  wr %g0, 0x1b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x20_th0:
  wr %g0, 0x20, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x21_th0:
  wr %g0, 0x21, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x25_th0:
  wr %g0, 0x25, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x28_th0:
  wr %g0, 0x28, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x29_th0:
  wr %g0, 0x29, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2d_th0:
  wr %g0, 0x2d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x32_th0:
  wr %g0, 0x32, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x33_th0:
  wr %g0, 0x33, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x34_th0:
  wr %g0, 0x34, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x35_th0:
  wr %g0, 0x35, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x37_th0:
  wr %g0, 0x37, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3a_th0:
  wr %g0, 0x3a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3b_th0:
  wr %g0, 0x3b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3c_th0:
  wr %g0, 0x3c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3d_th0:
  wr %g0, 0x3d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3f_th0:
  wr %g0, 0x3f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x40_th0:
  wr %g0, 0x40, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x41_th0:
  wr %g0, 0x41, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x42_th0:
  wr %g0, 0x42, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x43_th0:
  wr %g0, 0x43, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x44_th0:
  wr %g0, 0x44, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x45_th0:
  wr %g0, 0x45, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x48_th0:
  wr %g0, 0x48, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x49_th0:
  wr %g0, 0x49, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4a_th0:
  wr %g0, 0x4a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4b_th0:
  wr %g0, 0x4b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4c_th0:
  wr %g0, 0x4c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4d_th0:
  wr %g0, 0x4d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4e_th0:
  wr %g0, 0x4e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4f_th0:
  wr %g0, 0x4f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x50_th0:
  wr %g0, 0x50, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x51_th0:
  wr %g0, 0x51, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x52_th0:
  wr %g0, 0x52, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x53_th0:
  wr %g0, 0x53, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x56_th0:
  wr %g0, 0x56, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x57_th0:
  wr %g0, 0x57, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x58_th0:
  wr %g0, 0x58, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x59_th0:
  wr %g0, 0x59, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5a_th0:
  wr %g0, 0x5a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5b_th0:
  wr %g0, 0x5b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5e_th0:
  wr %g0, 0x5e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5f_th0:
  wr %g0, 0x5f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x60_th0:
  wr %g0, 0x60, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x61_th0:
  wr %g0, 0x61, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x62_th0:
  wr %g0, 0x62, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x63_th0:
  wr %g0, 0x63, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x64_th0:
  wr %g0, 0x64, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x65_th0:
  wr %g0, 0x65, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x68_th0:
  wr %g0, 0x68, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x69_th0:
  wr %g0, 0x69, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6a_th0:
  wr %g0, 0x6a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6b_th0:
  wr %g0, 0x6b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6c_th0:
  wr %g0, 0x6c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6d_th0:
  wr %g0, 0x6d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6e_th0:
  wr %g0, 0x6e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6f_th0:
  wr %g0, 0x6f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x70_th0:
  wr %g0, 0x70, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x71_th0:
  wr %g0, 0x71, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x72_th0:
  wr %g0, 0x72, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x74_th0:
  wr %g0, 0x74, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x75_th0:
  wr %g0, 0x75, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x76_th0:
  wr %g0, 0x76, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x77_th0:
  wr %g0, 0x77, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x78_th0:
  wr %g0, 0x78, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x79_th0:
  wr %g0, 0x79, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7a_th0:
  wr %g0, 0x7a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7b_th0:
  wr %g0, 0x7b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7c_th0:
  wr %g0, 0x7c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7d_th0:
  wr %g0, 0x7d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7e_th0:
  wr %g0, 0x7e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7f_th0:
  wr %g0, 0x7f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x84_th0:
  wr %g0, 0x84, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x85_th0:
  wr %g0, 0x85, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x86_th0:
  wr %g0, 0x86, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x87_th0:
  wr %g0, 0x87, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8c_th0:
  wr %g0, 0x8c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8d_th0:
  wr %g0, 0x8d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8e_th0:
  wr %g0, 0x8e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8f_th0:
  wr %g0, 0x8f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x90_th0:
  wr %g0, 0x90, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x91_th0:
  wr %g0, 0x91, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x92_th0:
  wr %g0, 0x92, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x93_th0:
  wr %g0, 0x93, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x94_th0:
  wr %g0, 0x94, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x95_th0:
  wr %g0, 0x95, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x96_th0:
  wr %g0, 0x96, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x97_th0:
  wr %g0, 0x97, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x98_th0:
  wr %g0, 0x98, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x99_th0:
  wr %g0, 0x99, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9a_th0:
  wr %g0, 0x9a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9b_th0:
  wr %g0, 0x9b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9c_th0:
  wr %g0, 0x9c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9d_th0:
  wr %g0, 0x9d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9e_th0:
  wr %g0, 0x9e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9f_th0:
  wr %g0, 0x9f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa0_th0:
  wr %g0, 0xa0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa1_th0:
  wr %g0, 0xa1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa2_th0:
  wr %g0, 0xa2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa3_th0:
  wr %g0, 0xa3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa4_th0:
  wr %g0, 0xa4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa5_th0:
  wr %g0, 0xa5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa6_th0:
  wr %g0, 0xa6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa7_th0:
  wr %g0, 0xa7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa8_th0:
  wr %g0, 0xa8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa9_th0:
  wr %g0, 0xa9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaa_th0:
  wr %g0, 0xaa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xab_th0:
  wr %g0, 0xab, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xac_th0:
  wr %g0, 0xac, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xad_th0:
  wr %g0, 0xad, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xae_th0:
  wr %g0, 0xae, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaf_th0:
  wr %g0, 0xaf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb0_th0:
  wr %g0, 0xb0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb1_th0:
  wr %g0, 0xb1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb2_th0:
  wr %g0, 0xb2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb3_th0:
  wr %g0, 0xb3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb4_th0:
  wr %g0, 0xb4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb5_th0:
  wr %g0, 0xb5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb6_th0:
  wr %g0, 0xb6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb7_th0:
  wr %g0, 0xb7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb8_th0:
  wr %g0, 0xb8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb9_th0:
  wr %g0, 0xb9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xba_th0:
  wr %g0, 0xba, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbb_th0:
  wr %g0, 0xbb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbc_th0:
  wr %g0, 0xbc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbd_th0:
  wr %g0, 0xbd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbe_th0:
  wr %g0, 0xbe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbf_th0:
  wr %g0, 0xbf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc6_th0:
  wr %g0, 0xc6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc7_th0:
  wr %g0, 0xc7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xce_th0:
  wr %g0, 0xce, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xcf_th0:
  wr %g0, 0xcf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd4_th0:
  wr %g0, 0xd4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd5_th0:
  wr %g0, 0xd5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd6_th0:
  wr %g0, 0xd6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd7_th0:
  wr %g0, 0xd7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdc_th0:
  wr %g0, 0xdc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdd_th0:
  wr %g0, 0xdd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xde_th0:
  wr %g0, 0xde, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdf_th0:
  wr %g0, 0xdf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe4_th0:
  wr %g0, 0xe4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe5_th0:
  wr %g0, 0xe5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe6_th0:
  wr %g0, 0xe6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe7_th0:
  wr %g0, 0xe7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe8_th0:
  wr %g0, 0xe8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe9_th0:
  wr %g0, 0xe9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xec_th0:
  wr %g0, 0xec, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xed_th0:
  wr %g0, 0xed, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xee_th0:
  wr %g0, 0xee, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xef_th0:
  wr %g0, 0xef, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf2_th0:
  wr %g0, 0xf2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf3_th0:
  wr %g0, 0xf3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf4_th0:
  wr %g0, 0xf4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf5_th0:
  wr %g0, 0xf5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf6_th0:
  wr %g0, 0xf6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf7_th0:
  wr %g0, 0xf7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfa_th0:
  wr %g0, 0xfa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfb_th0:
  wr %g0, 0xfb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfc_th0:
  wr %g0, 0xfc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfd_th0:
  wr %g0, 0xfd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfe_th0:
  wr %g0, 0xfe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xff_th0:
  wr %g0, 0xff, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x46_th0:
  wr %g0, 0x46, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x47_th0:
  wr %g0, 0x47, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x4_th0:
  mov %r22, %r1
        ldx [%r26 + 0x18 & ~0x7], %r2
        ldx [%r27 + 0x93 & ~0x7], %r4
        ldx [%r27 + 0xb1 & ~0x7], %r6
        ldx [%r23 + 0xdf & ~0x7], %r8
        ldx [%r26 + 0x72 & ~0x7], %r10
        ldx [%r23 + 0xbb & ~0x7], %r12
        ldx [%r23 + 0x64 & ~0x7], %r14
        ldx [%r27 + 0xd8 & ~0x7], %r16
        ld [%r25 + 0xb7 & ~0x7], %f0
        ld [%r21 + 0x74 & ~0x7], %f16
        ld [%r21 + 0x8b & ~0x7], %f32
        ld [%r24 + 0x91 & ~0x7], %f48
               ldsba [%r1]4, %r16
               ldsha [%r1]4, %r14
               ldswa [%r1]4, %r4
               lduba [%r1]4, %r6
               lduha [%r1]4, %r6
               ldxa [%r1]4, %r16
               ldda [%r1]4, %r8
               ldstuba [%r1]4, %r14
               swapa [%r1]4, %r4
               lda [%r1]4, %f0
               ldda [%r1]4, %f48
               stba %r0, [%r1]4
               stha %r2, [%r1]4
               stwa %r6, [%r1]4
               sta %f0, [%r1]4
               stda %f32, [%r1]4
casa  [%r1]0x4, %r2, %g0
casxa  [%r1]0x4, %r2, %g0
               prefetcha [%r1]4, 0x1c
CASE_ASI_0xc_th0:
  mov %r24, %r1
        ldx [%r23 + 0x50 & ~0x7], %r2
        ldx [%r27 + 0x1b & ~0x7], %r4
        ldx [%r27 + 0xb4 & ~0x7], %r6
        ldx [%r22 + 0xc3 & ~0x7], %r8
        ldx [%r24 + 0xa6 & ~0x7], %r10
        ldx [%r28 + 0x80 & ~0x7], %r12
        ldx [%r26 + 0x6f & ~0x7], %r14
        ldx [%r25 + 0x93 & ~0x7], %r16
        ld [%r26 + 0x76 & ~0x7], %f0
        ld [%r26 + 0x23 & ~0x7], %f16
        ld [%r28 + 0x24 & ~0x7], %f32
        ld [%r24 + 0x53 & ~0x7], %f48
               ldsba [%r1]12, %r16
               ldsha [%r1]12, %r6
               ldswa [%r1]12, %r8
               lduba [%r1]12, %r2
               lduha [%r1]12, %r16
               ldxa [%r1]12, %r16
               ldda [%r1]12, %r10
               ldstuba [%r1]12, %r14
               swapa [%r1]12, %r4
               lda [%r1]12, %f48
               ldda [%r1]12, %f32
               stba %r0, [%r1]12
               stha %r14, [%r1]12
               stwa %r14, [%r1]12
               sta %f48, [%r1]12
               stda %f48, [%r1]12
casa  [%r1]0xc, %r2, %g0
casxa  [%r1]0xc, %r2, %g0
               prefetcha [%r1]12, 0x12
CASE_ASI_0x10_th0:
  mov %r23, %r1
        ldx [%r28 + 0x94 & ~0x7], %r2
        ldx [%r24 + 0x60 & ~0x7], %r4
        ldx [%r28 + 0x7 & ~0x7], %r6
        ldx [%r27 + 0xb9 & ~0x7], %r8
        ldx [%r25 + 0x6d & ~0x7], %r10
        ldx [%r26 + 0xbf & ~0x7], %r12
        ldx [%r21 + 0xd & ~0x7], %r14
        ldx [%r27 + 0xb4 & ~0x7], %r16
        ld [%r21 + 0x4d & ~0x7], %f0
        ld [%r21 + 0xb0 & ~0x7], %f16
        ld [%r23 + 0xba & ~0x7], %f32
        ld [%r22 + 0x27 & ~0x7], %f48
               ldsba [%r1]16, %r4
               ldsha [%r1]16, %r14
               ldswa [%r1]16, %r10
               lduba [%r1]16, %r6
               lduha [%r1]16, %r10
               ldxa [%r1]16, %r8
               ldda [%r1]16, %r4
               ldstuba [%r1]16, %r12
               swapa [%r1]16, %r2
               lda [%r1]16, %f32
               ldda [%r1]16, %f16
               stba %r14, [%r1]16
               stha %r12, [%r1]16
               stwa %r2, [%r1]16
               sta %f0, [%r1]16
               stda %f16, [%r1]16
casa  [%r1]0x10, %r2, %g0
casxa  [%r1]0x10, %r2, %g0
               prefetcha [%r1]16, 0x1b
CASE_ASI_0x11_th0:
  mov %r27, %r1
        ldx [%r21 + 0xdb & ~0x7], %r2
        ldx [%r27 + 0x94 & ~0x7], %r4
        ldx [%r21 + 0xd4 & ~0x7], %r6
        ldx [%r26 + 0xe8 & ~0x7], %r8
        ldx [%r25 + 0xe2 & ~0x7], %r10
        ldx [%r28 + 0x91 & ~0x7], %r12
        ldx [%r24 + 0x6a & ~0x7], %r14
        ldx [%r26 + 0xe1 & ~0x7], %r16
        ld [%r25 + 0x38 & ~0x7], %f0
        ld [%r28 + 0x28 & ~0x7], %f16
        ld [%r26 + 0xb3 & ~0x7], %f32
        ld [%r28 + 0xa6 & ~0x7], %f48
               ldsba [%r1]17, %r12
               ldsha [%r1]17, %r14
               ldswa [%r1]17, %r12
               lduba [%r1]17, %r16
               lduha [%r1]17, %r6
               ldxa [%r1]17, %r14
               ldda [%r1]17, %r4
               ldstuba [%r1]17, %r14
               swapa [%r1]17, %r10
               lda [%r1]17, %f16
               ldda [%r1]17, %f48
               stba %r12, [%r1]17
               stha %r6, [%r1]17
               stwa %r2, [%r1]17
               sta %f48, [%r1]17
               stda %f48, [%r1]17
casa  [%r1]0x11, %r2, %g0
casxa  [%r1]0x11, %r2, %g0
               prefetcha [%r1]17, 0x17
CASE_ASI_0x18_th0:
  mov %r22, %r1
        ldx [%r24 + 0xc8 & ~0x7], %r2
        ldx [%r24 + 0x91 & ~0x7], %r4
        ldx [%r24 + 0x9 & ~0x7], %r6
        ldx [%r23 + 0x6d & ~0x7], %r8
        ldx [%r25 + 0x16 & ~0x7], %r10
        ldx [%r26 + 0x96 & ~0x7], %r12
        ldx [%r22 + 0xbe & ~0x7], %r14
        ldx [%r28 + 0xdd & ~0x7], %r16
        ld [%r21 + 0x8a & ~0x7], %f0
        ld [%r24 + 0x0 & ~0x7], %f16
        ld [%r26 + 0xd & ~0x7], %f32
        ld [%r21 + 0xc2 & ~0x7], %f48
               ldsba [%r1]24, %r12
               ldsha [%r1]24, %r16
               ldswa [%r1]24, %r10
               lduba [%r1]24, %r8
               lduha [%r1]24, %r8
               ldxa [%r1]24, %r4
               ldda [%r1]24, %r6
               ldstuba [%r1]24, %r4
               swapa [%r1]24, %r10
               lda [%r1]24, %f16
               ldda [%r1]24, %f0
               stba %r6, [%r1]24
               stha %r12, [%r1]24
               stwa %r2, [%r1]24
               sta %f32, [%r1]24
               stda %f16, [%r1]24
casa  [%r1]0x18, %r2, %g0
casxa  [%r1]0x18, %r2, %g0
               prefetcha [%r1]24, 0x4
CASE_ASI_0x19_th0:
  mov %r26, %r1
        ldx [%r22 + 0x1f & ~0x7], %r2
        ldx [%r27 + 0x1a & ~0x7], %r4
        ldx [%r27 + 0x61 & ~0x7], %r6
        ldx [%r25 + 0x14 & ~0x7], %r8
        ldx [%r24 + 0xa0 & ~0x7], %r10
        ldx [%r27 + 0x6b & ~0x7], %r12
        ldx [%r27 + 0x8d & ~0x7], %r14
        ldx [%r26 + 0x7d & ~0x7], %r16
        ld [%r23 + 0x7f & ~0x7], %f0
        ld [%r24 + 0x7d & ~0x7], %f16
        ld [%r27 + 0xeb & ~0x7], %f32
        ld [%r23 + 0x8b & ~0x7], %f48
               ldsba [%r1]25, %r10
               ldsha [%r1]25, %r10
               ldswa [%r1]25, %r8
               lduba [%r1]25, %r12
               lduha [%r1]25, %r4
               ldxa [%r1]25, %r14
               ldda [%r1]25, %r6
               ldstuba [%r1]25, %r14
               swapa [%r1]25, %r2
               lda [%r1]25, %f48
               ldda [%r1]25, %f48
               stba %r14, [%r1]25
               stha %r8, [%r1]25
               stwa %r0, [%r1]25
               sta %f0, [%r1]25
               stda %f32, [%r1]25
casa  [%r1]0x19, %r2, %g0
casxa  [%r1]0x19, %r2, %g0
               prefetcha [%r1]25, 0x2
CASE_ASI_0x80_th0:
  mov %r25, %r1
        ldx [%r22 + 0x9c & ~0x7], %r2
        ldx [%r28 + 0x92 & ~0x7], %r4
        ldx [%r25 + 0x76 & ~0x7], %r6
        ldx [%r21 + 0x3c & ~0x7], %r8
        ldx [%r28 + 0x8e & ~0x7], %r10
        ldx [%r27 + 0x49 & ~0x7], %r12
        ldx [%r26 + 0xd2 & ~0x7], %r14
        ldx [%r24 + 0x97 & ~0x7], %r16
        ld [%r21 + 0x28 & ~0x7], %f0
        ld [%r26 + 0x98 & ~0x7], %f16
        ld [%r28 + 0x6e & ~0x7], %f32
        ld [%r22 + 0x2e & ~0x7], %f48
               ldsba [%r1]128, %r12
               ldsha [%r1]128, %r4
               ldswa [%r1]128, %r6
               lduba [%r1]128, %r4
               lduha [%r1]128, %r8
               ldxa [%r1]128, %r6
               ldda [%r1]128, %r8
               ldstuba [%r1]128, %r4
               swapa [%r1]128, %r6
               lda [%r1]128, %f32
               ldda [%r1]128, %f32
               stba %r10, [%r1]128
               stha %r6, [%r1]128
               stwa %r12, [%r1]128
               sta %f16, [%r1]128
               stda %f16, [%r1]128
casa  [%r1]0x80, %r2, %g0
casxa  [%r1]0x80, %r2, %g0
               prefetcha [%r1]128, 0x14
CASE_ASI_0x81_th0:
  mov %r25, %r1
        ldx [%r28 + 0xa7 & ~0x7], %r2
        ldx [%r28 + 0x2 & ~0x7], %r4
        ldx [%r22 + 0xa4 & ~0x7], %r6
        ldx [%r27 + 0xad & ~0x7], %r8
        ldx [%r27 + 0xc1 & ~0x7], %r10
        ldx [%r28 + 0x37 & ~0x7], %r12
        ldx [%r26 + 0x98 & ~0x7], %r14
        ldx [%r25 + 0x5d & ~0x7], %r16
        ld [%r21 + 0x40 & ~0x7], %f0
        ld [%r23 + 0x7b & ~0x7], %f16
        ld [%r25 + 0x4a & ~0x7], %f32
        ld [%r22 + 0xa9 & ~0x7], %f48
               ldsba [%r1]129, %r16
               ldsha [%r1]129, %r12
               ldswa [%r1]129, %r2
               lduba [%r1]129, %r14
               lduha [%r1]129, %r10
               ldxa [%r1]129, %r4
               ldda [%r1]129, %r2
               ldstuba [%r1]129, %r8
               swapa [%r1]129, %r10
               lda [%r1]129, %f0
               ldda [%r1]129, %f32
               stba %r10, [%r1]129
               stha %r4, [%r1]129
               stwa %r14, [%r1]129
               sta %f48, [%r1]129
               stda %f32, [%r1]129
casa  [%r1]0x81, %r2, %g0
casxa  [%r1]0x81, %r2, %g0
               prefetcha [%r1]129, 0x2
CASE_ASI_0x82_th0:
  mov %r22, %r1
        ldx [%r27 + 0x7a & ~0x7], %r2
        ldx [%r26 + 0x1d & ~0x7], %r4
        ldx [%r26 + 0x65 & ~0x7], %r6
        ldx [%r26 + 0xc8 & ~0x7], %r8
        ldx [%r26 + 0x44 & ~0x7], %r10
        ldx [%r27 + 0x22 & ~0x7], %r12
        ldx [%r23 + 0x14 & ~0x7], %r14
        ldx [%r22 + 0x32 & ~0x7], %r16
        ld [%r25 + 0x9b & ~0x7], %f0
        ld [%r25 + 0x91 & ~0x7], %f16
        ld [%r22 + 0x12 & ~0x7], %f32
        ld [%r28 + 0x27 & ~0x7], %f48
               ldsba [%r1]130, %r10
               ldsha [%r1]130, %r6
               ldswa [%r1]130, %r6
               lduba [%r1]130, %r4
               lduha [%r1]130, %r12
               ldxa [%r1]130, %r2
               ldda [%r1]130, %r2
               ldstuba [%r1]130, %r14
               swapa [%r1]130, %r2
               lda [%r1]130, %f32
               ldda [%r1]130, %f16
               stba %r14, [%r1]130
               stha %r14, [%r1]130
               stwa %r0, [%r1]130
               sta %f16, [%r1]130
               stda %f48, [%r1]130
casa  [%r1]0x82, %r2, %g0
casxa  [%r1]0x82, %r2, %g0
               prefetcha [%r1]130, 0x1f
CASE_ASI_0x83_th0:
  mov %r23, %r1
        ldx [%r28 + 0x6 & ~0x7], %r2
        ldx [%r23 + 0xd8 & ~0x7], %r4
        ldx [%r24 + 0xb4 & ~0x7], %r6
        ldx [%r25 + 0x1a & ~0x7], %r8
        ldx [%r22 + 0x3d & ~0x7], %r10
        ldx [%r26 + 0xfc & ~0x7], %r12
        ldx [%r25 + 0xe6 & ~0x7], %r14
        ldx [%r24 + 0x79 & ~0x7], %r16
        ld [%r24 + 0xc2 & ~0x7], %f0
        ld [%r21 + 0x25 & ~0x7], %f16
        ld [%r26 + 0x42 & ~0x7], %f32
        ld [%r25 + 0x10 & ~0x7], %f48
               ldsba [%r1]131, %r4
               ldsha [%r1]131, %r8
               ldswa [%r1]131, %r2
               lduba [%r1]131, %r12
               lduha [%r1]131, %r2
               ldxa [%r1]131, %r4
               ldda [%r1]131, %r10
               ldstuba [%r1]131, %r4
               swapa [%r1]131, %r6
               lda [%r1]131, %f0
               ldda [%r1]131, %f0
               stba %r0, [%r1]131
               stha %r2, [%r1]131
               stwa %r6, [%r1]131
               sta %f32, [%r1]131
               stda %f16, [%r1]131
casa  [%r1]0x83, %r2, %g0
casxa  [%r1]0x83, %r2, %g0
               prefetcha [%r1]131, 0x11
CASE_ASI_0x88_th0:
  mov %r24, %r1
        ldx [%r21 + 0x4b & ~0x7], %r2
        ldx [%r23 + 0x54 & ~0x7], %r4
        ldx [%r21 + 0x19 & ~0x7], %r6
        ldx [%r22 + 0x1b & ~0x7], %r8
        ldx [%r22 + 0xd5 & ~0x7], %r10
        ldx [%r27 + 0xec & ~0x7], %r12
        ldx [%r25 + 0x78 & ~0x7], %r14
        ldx [%r26 + 0x82 & ~0x7], %r16
        ld [%r27 + 0xfb & ~0x7], %f0
        ld [%r24 + 0xab & ~0x7], %f16
        ld [%r28 + 0xda & ~0x7], %f32
        ld [%r27 + 0xb7 & ~0x7], %f48
               ldsba [%r1]136, %r2
               ldsha [%r1]136, %r14
               ldswa [%r1]136, %r6
               lduba [%r1]136, %r8
               lduha [%r1]136, %r6
               ldxa [%r1]136, %r14
               ldda [%r1]136, %r10
               ldstuba [%r1]136, %r2
               swapa [%r1]136, %r2
               lda [%r1]136, %f32
               ldda [%r1]136, %f32
               stba %r0, [%r1]136
               stha %r8, [%r1]136
               stwa %r12, [%r1]136
               sta %f0, [%r1]136
               stda %f0, [%r1]136
casa  [%r1]0x88, %r2, %g0
casxa  [%r1]0x88, %r2, %g0
               prefetcha [%r1]136, 0x1c
CASE_ASI_0x89_th0:
  mov %r22, %r1
        ldx [%r22 + 0xf7 & ~0x7], %r2
        ldx [%r27 + 0xb5 & ~0x7], %r4
        ldx [%r25 + 0xae & ~0x7], %r6
        ldx [%r27 + 0x3b & ~0x7], %r8
        ldx [%r22 + 0x5f & ~0x7], %r10
        ldx [%r27 + 0x29 & ~0x7], %r12
        ldx [%r25 + 0x1f & ~0x7], %r14
        ldx [%r24 + 0x0 & ~0x7], %r16
        ld [%r25 + 0x76 & ~0x7], %f0
        ld [%r26 + 0x8 & ~0x7], %f16
        ld [%r24 + 0x80 & ~0x7], %f32
        ld [%r23 + 0xff & ~0x7], %f48
               ldsba [%r1]137, %r6
               ldsha [%r1]137, %r6
               ldswa [%r1]137, %r16
               lduba [%r1]137, %r2
               lduha [%r1]137, %r10
               ldxa [%r1]137, %r14
               ldda [%r1]137, %r6
               ldstuba [%r1]137, %r16
               swapa [%r1]137, %r4
               lda [%r1]137, %f16
               ldda [%r1]137, %f48
               stba %r0, [%r1]137
               stha %r8, [%r1]137
               stwa %r2, [%r1]137
               sta %f32, [%r1]137
               stda %f48, [%r1]137
casa  [%r1]0x89, %r2, %g0
casxa  [%r1]0x89, %r2, %g0
               prefetcha [%r1]137, 0x5
CASE_ASI_0x8a_th0:
  mov %r24, %r1
        ldx [%r28 + 0x50 & ~0x7], %r2
        ldx [%r23 + 0x19 & ~0x7], %r4
        ldx [%r23 + 0xe3 & ~0x7], %r6
        ldx [%r28 + 0xfc & ~0x7], %r8
        ldx [%r21 + 0x26 & ~0x7], %r10
        ldx [%r28 + 0xc8 & ~0x7], %r12
        ldx [%r28 + 0x43 & ~0x7], %r14
        ldx [%r22 + 0x89 & ~0x7], %r16
        ld [%r23 + 0x62 & ~0x7], %f0
        ld [%r23 + 0x79 & ~0x7], %f16
        ld [%r26 + 0xee & ~0x7], %f32
        ld [%r24 + 0x79 & ~0x7], %f48
               ldsba [%r1]138, %r16
               ldsha [%r1]138, %r6
               ldswa [%r1]138, %r8
               lduba [%r1]138, %r14
               lduha [%r1]138, %r8
               ldxa [%r1]138, %r12
               ldda [%r1]138, %r6
               ldstuba [%r1]138, %r12
               swapa [%r1]138, %r14
               lda [%r1]138, %f32
               ldda [%r1]138, %f48
               stba %r14, [%r1]138
               stha %r4, [%r1]138
               stwa %r6, [%r1]138
               sta %f32, [%r1]138
               stda %f16, [%r1]138
casa  [%r1]0x8a, %r2, %g0
casxa  [%r1]0x8a, %r2, %g0
               prefetcha [%r1]138, 0x1e
CASE_ASI_0x8b_th0:
  mov %r21, %r1
        ldx [%r24 + 0x4f & ~0x7], %r2
        ldx [%r26 + 0x5a & ~0x7], %r4
        ldx [%r25 + 0x1d & ~0x7], %r6
        ldx [%r26 + 0xed & ~0x7], %r8
        ldx [%r22 + 0xf1 & ~0x7], %r10
        ldx [%r21 + 0x66 & ~0x7], %r12
        ldx [%r22 + 0x1a & ~0x7], %r14
        ldx [%r21 + 0x68 & ~0x7], %r16
        ld [%r24 + 0xae & ~0x7], %f0
        ld [%r23 + 0xcf & ~0x7], %f16
        ld [%r21 + 0xa5 & ~0x7], %f32
        ld [%r25 + 0x7f & ~0x7], %f48
               ldsba [%r1]139, %r4
               ldsha [%r1]139, %r12
               ldswa [%r1]139, %r2
               lduba [%r1]139, %r4
               lduha [%r1]139, %r16
               ldxa [%r1]139, %r16
               ldda [%r1]139, %r2
               ldstuba [%r1]139, %r14
               swapa [%r1]139, %r2
               lda [%r1]139, %f0
               ldda [%r1]139, %f32
               stba %r2, [%r1]139
               stha %r12, [%r1]139
               stwa %r8, [%r1]139
               sta %f16, [%r1]139
               stda %f16, [%r1]139
casa  [%r1]0x8b, %r2, %g0
casxa  [%r1]0x8b, %r2, %g0
               prefetcha [%r1]139, 0xd
        nop
        nop
        nop
subcc	%r19, 1, %r19
cmp %r19, 2
bz,a TH0_LOOP
ta T_CHANGE_NONHPRIV
cmp %r19, 1
bz,a TH0_LOOP
ta T_CHANGE_PRIV
        nop
	ba main_text_end
	nop
        nop
        nop
        nop
        nop
	LOOP_T1:
ta T_CHANGE_PRIV
 add %g0, 0x3, %r19
TH1_LOOP:
CASE_ASI_0x0_th1:
  wr %g0, 0x0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1_th1:
  wr %g0, 0x1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2_th1:
  wr %g0, 0x2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3_th1:
  wr %g0, 0x3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5_th1:
  wr %g0, 0x5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6_th1:
  wr %g0, 0x6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7_th1:
  wr %g0, 0x7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8_th1:
  wr %g0, 0x8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9_th1:
  wr %g0, 0x9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa_th1:
  wr %g0, 0xa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb_th1:
  wr %g0, 0xb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd_th1:
  wr %g0, 0xd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe_th1:
  wr %g0, 0xe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf_th1:
  wr %g0, 0xf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x12_th1:
  wr %g0, 0x12, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x13_th1:
  wr %g0, 0x13, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1a_th1:
  wr %g0, 0x1a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1b_th1:
  wr %g0, 0x1b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x20_th1:
  wr %g0, 0x20, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x21_th1:
  wr %g0, 0x21, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x25_th1:
  wr %g0, 0x25, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x28_th1:
  wr %g0, 0x28, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x29_th1:
  wr %g0, 0x29, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2d_th1:
  wr %g0, 0x2d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x32_th1:
  wr %g0, 0x32, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x33_th1:
  wr %g0, 0x33, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x34_th1:
  wr %g0, 0x34, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x35_th1:
  wr %g0, 0x35, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x37_th1:
  wr %g0, 0x37, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3a_th1:
  wr %g0, 0x3a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3b_th1:
  wr %g0, 0x3b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3c_th1:
  wr %g0, 0x3c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3d_th1:
  wr %g0, 0x3d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3f_th1:
  wr %g0, 0x3f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x40_th1:
  wr %g0, 0x40, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x41_th1:
  wr %g0, 0x41, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x42_th1:
  wr %g0, 0x42, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x43_th1:
  wr %g0, 0x43, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x44_th1:
  wr %g0, 0x44, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x45_th1:
  wr %g0, 0x45, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x48_th1:
  wr %g0, 0x48, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x49_th1:
  wr %g0, 0x49, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4a_th1:
  wr %g0, 0x4a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4b_th1:
  wr %g0, 0x4b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4c_th1:
  wr %g0, 0x4c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4d_th1:
  wr %g0, 0x4d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4e_th1:
  wr %g0, 0x4e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4f_th1:
  wr %g0, 0x4f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x50_th1:
  wr %g0, 0x50, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x51_th1:
  wr %g0, 0x51, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x52_th1:
  wr %g0, 0x52, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x53_th1:
  wr %g0, 0x53, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x56_th1:
  wr %g0, 0x56, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x57_th1:
  wr %g0, 0x57, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x58_th1:
  wr %g0, 0x58, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x59_th1:
  wr %g0, 0x59, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5a_th1:
  wr %g0, 0x5a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5b_th1:
  wr %g0, 0x5b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5e_th1:
  wr %g0, 0x5e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5f_th1:
  wr %g0, 0x5f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x60_th1:
  wr %g0, 0x60, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x61_th1:
  wr %g0, 0x61, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x62_th1:
  wr %g0, 0x62, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x63_th1:
  wr %g0, 0x63, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x64_th1:
  wr %g0, 0x64, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x65_th1:
  wr %g0, 0x65, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x68_th1:
  wr %g0, 0x68, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x69_th1:
  wr %g0, 0x69, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6a_th1:
  wr %g0, 0x6a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6b_th1:
  wr %g0, 0x6b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6c_th1:
  wr %g0, 0x6c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6d_th1:
  wr %g0, 0x6d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6e_th1:
  wr %g0, 0x6e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6f_th1:
  wr %g0, 0x6f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x70_th1:
  wr %g0, 0x70, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x71_th1:
  wr %g0, 0x71, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x72_th1:
  wr %g0, 0x72, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x74_th1:
  wr %g0, 0x74, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x75_th1:
  wr %g0, 0x75, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x76_th1:
  wr %g0, 0x76, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x77_th1:
  wr %g0, 0x77, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x78_th1:
  wr %g0, 0x78, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x79_th1:
  wr %g0, 0x79, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7a_th1:
  wr %g0, 0x7a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7b_th1:
  wr %g0, 0x7b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7c_th1:
  wr %g0, 0x7c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7d_th1:
  wr %g0, 0x7d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7e_th1:
  wr %g0, 0x7e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7f_th1:
  wr %g0, 0x7f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x84_th1:
  wr %g0, 0x84, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x85_th1:
  wr %g0, 0x85, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x86_th1:
  wr %g0, 0x86, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x87_th1:
  wr %g0, 0x87, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8c_th1:
  wr %g0, 0x8c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8d_th1:
  wr %g0, 0x8d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8e_th1:
  wr %g0, 0x8e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8f_th1:
  wr %g0, 0x8f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x90_th1:
  wr %g0, 0x90, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x91_th1:
  wr %g0, 0x91, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x92_th1:
  wr %g0, 0x92, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x93_th1:
  wr %g0, 0x93, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x94_th1:
  wr %g0, 0x94, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x95_th1:
  wr %g0, 0x95, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x96_th1:
  wr %g0, 0x96, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x97_th1:
  wr %g0, 0x97, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x98_th1:
  wr %g0, 0x98, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x99_th1:
  wr %g0, 0x99, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9a_th1:
  wr %g0, 0x9a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9b_th1:
  wr %g0, 0x9b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9c_th1:
  wr %g0, 0x9c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9d_th1:
  wr %g0, 0x9d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9e_th1:
  wr %g0, 0x9e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9f_th1:
  wr %g0, 0x9f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa0_th1:
  wr %g0, 0xa0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa1_th1:
  wr %g0, 0xa1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa2_th1:
  wr %g0, 0xa2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa3_th1:
  wr %g0, 0xa3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa4_th1:
  wr %g0, 0xa4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa5_th1:
  wr %g0, 0xa5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa6_th1:
  wr %g0, 0xa6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa7_th1:
  wr %g0, 0xa7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa8_th1:
  wr %g0, 0xa8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa9_th1:
  wr %g0, 0xa9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaa_th1:
  wr %g0, 0xaa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xab_th1:
  wr %g0, 0xab, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xac_th1:
  wr %g0, 0xac, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xad_th1:
  wr %g0, 0xad, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xae_th1:
  wr %g0, 0xae, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaf_th1:
  wr %g0, 0xaf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb0_th1:
  wr %g0, 0xb0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb1_th1:
  wr %g0, 0xb1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb2_th1:
  wr %g0, 0xb2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb3_th1:
  wr %g0, 0xb3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb4_th1:
  wr %g0, 0xb4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb5_th1:
  wr %g0, 0xb5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb6_th1:
  wr %g0, 0xb6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb7_th1:
  wr %g0, 0xb7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb8_th1:
  wr %g0, 0xb8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb9_th1:
  wr %g0, 0xb9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xba_th1:
  wr %g0, 0xba, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbb_th1:
  wr %g0, 0xbb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbc_th1:
  wr %g0, 0xbc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbd_th1:
  wr %g0, 0xbd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbe_th1:
  wr %g0, 0xbe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbf_th1:
  wr %g0, 0xbf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc6_th1:
  wr %g0, 0xc6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc7_th1:
  wr %g0, 0xc7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xce_th1:
  wr %g0, 0xce, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xcf_th1:
  wr %g0, 0xcf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd4_th1:
  wr %g0, 0xd4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd5_th1:
  wr %g0, 0xd5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd6_th1:
  wr %g0, 0xd6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd7_th1:
  wr %g0, 0xd7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdc_th1:
  wr %g0, 0xdc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdd_th1:
  wr %g0, 0xdd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xde_th1:
  wr %g0, 0xde, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdf_th1:
  wr %g0, 0xdf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe4_th1:
  wr %g0, 0xe4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe5_th1:
  wr %g0, 0xe5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe6_th1:
  wr %g0, 0xe6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe7_th1:
  wr %g0, 0xe7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe8_th1:
  wr %g0, 0xe8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe9_th1:
  wr %g0, 0xe9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xec_th1:
  wr %g0, 0xec, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xed_th1:
  wr %g0, 0xed, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xee_th1:
  wr %g0, 0xee, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xef_th1:
  wr %g0, 0xef, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf2_th1:
  wr %g0, 0xf2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf3_th1:
  wr %g0, 0xf3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf4_th1:
  wr %g0, 0xf4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf5_th1:
  wr %g0, 0xf5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf6_th1:
  wr %g0, 0xf6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf7_th1:
  wr %g0, 0xf7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfa_th1:
  wr %g0, 0xfa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfb_th1:
  wr %g0, 0xfb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfc_th1:
  wr %g0, 0xfc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfd_th1:
  wr %g0, 0xfd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfe_th1:
  wr %g0, 0xfe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xff_th1:
  wr %g0, 0xff, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x46_th1:
  wr %g0, 0x46, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x47_th1:
  wr %g0, 0x47, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x4_th1:
  mov %r28, %r1
        ldx [%r27 + 0xb8 & ~0x7], %r2
        ldx [%r27 + 0xee & ~0x7], %r4
        ldx [%r21 + 0x77 & ~0x7], %r6
        ldx [%r24 + 0x61 & ~0x7], %r8
        ldx [%r23 + 0x22 & ~0x7], %r10
        ldx [%r25 + 0x9e & ~0x7], %r12
        ldx [%r24 + 0x84 & ~0x7], %r14
        ldx [%r27 + 0x47 & ~0x7], %r16
        ld [%r24 + 0x1b & ~0x7], %f0
        ld [%r22 + 0xe6 & ~0x7], %f16
        ld [%r25 + 0xd0 & ~0x7], %f32
        ld [%r27 + 0xb5 & ~0x7], %f48
               ldsba [%r1]4, %r6
               ldsha [%r1]4, %r16
               ldswa [%r1]4, %r4
               lduba [%r1]4, %r12
               lduha [%r1]4, %r14
               ldxa [%r1]4, %r6
               ldda [%r1]4, %r6
               ldstuba [%r1]4, %r6
               swapa [%r1]4, %r10
               lda [%r1]4, %f32
               ldda [%r1]4, %f0
               stba %r6, [%r1]4
               stha %r6, [%r1]4
               stwa %r4, [%r1]4
               sta %f32, [%r1]4
               stda %f0, [%r1]4
casa  [%r1]0x4, %r2, %g0
casxa  [%r1]0x4, %r2, %g0
               prefetcha [%r1]4, 0x13
CASE_ASI_0xc_th1:
  mov %r23, %r1
        ldx [%r28 + 0x91 & ~0x7], %r2
        ldx [%r23 + 0x7c & ~0x7], %r4
        ldx [%r22 + 0xa4 & ~0x7], %r6
        ldx [%r22 + 0xd3 & ~0x7], %r8
        ldx [%r25 + 0x67 & ~0x7], %r10
        ldx [%r22 + 0xb7 & ~0x7], %r12
        ldx [%r24 + 0xb8 & ~0x7], %r14
        ldx [%r27 + 0xd6 & ~0x7], %r16
        ld [%r24 + 0xe9 & ~0x7], %f0
        ld [%r21 + 0x2a & ~0x7], %f16
        ld [%r26 + 0xc4 & ~0x7], %f32
        ld [%r28 + 0x6d & ~0x7], %f48
               ldsba [%r1]12, %r14
               ldsha [%r1]12, %r6
               ldswa [%r1]12, %r12
               lduba [%r1]12, %r4
               lduha [%r1]12, %r8
               ldxa [%r1]12, %r4
               ldda [%r1]12, %r8
               ldstuba [%r1]12, %r8
               swapa [%r1]12, %r14
               lda [%r1]12, %f16
               ldda [%r1]12, %f48
               stba %r8, [%r1]12
               stha %r6, [%r1]12
               stwa %r14, [%r1]12
               sta %f48, [%r1]12
               stda %f16, [%r1]12
casa  [%r1]0xc, %r2, %g0
casxa  [%r1]0xc, %r2, %g0
               prefetcha [%r1]12, 0x1b
CASE_ASI_0x10_th1:
  mov %r28, %r1
        ldx [%r27 + 0x29 & ~0x7], %r2
        ldx [%r22 + 0x84 & ~0x7], %r4
        ldx [%r23 + 0xfb & ~0x7], %r6
        ldx [%r26 + 0x94 & ~0x7], %r8
        ldx [%r24 + 0x6a & ~0x7], %r10
        ldx [%r22 + 0xf4 & ~0x7], %r12
        ldx [%r28 + 0x1 & ~0x7], %r14
        ldx [%r21 + 0x4b & ~0x7], %r16
        ld [%r27 + 0xf9 & ~0x7], %f0
        ld [%r26 + 0x6b & ~0x7], %f16
        ld [%r27 + 0x50 & ~0x7], %f32
        ld [%r28 + 0x13 & ~0x7], %f48
               ldsba [%r1]16, %r6
               ldsha [%r1]16, %r14
               ldswa [%r1]16, %r2
               lduba [%r1]16, %r14
               lduha [%r1]16, %r8
               ldxa [%r1]16, %r4
               ldda [%r1]16, %r2
               ldstuba [%r1]16, %r6
               swapa [%r1]16, %r16
               lda [%r1]16, %f32
               ldda [%r1]16, %f32
               stba %r8, [%r1]16
               stha %r8, [%r1]16
               stwa %r8, [%r1]16
               sta %f16, [%r1]16
               stda %f32, [%r1]16
casa  [%r1]0x10, %r2, %g0
casxa  [%r1]0x10, %r2, %g0
               prefetcha [%r1]16, 0xc
CASE_ASI_0x11_th1:
  mov %r26, %r1
        ldx [%r21 + 0x63 & ~0x7], %r2
        ldx [%r25 + 0x99 & ~0x7], %r4
        ldx [%r28 + 0xc9 & ~0x7], %r6
        ldx [%r27 + 0xd2 & ~0x7], %r8
        ldx [%r25 + 0x4f & ~0x7], %r10
        ldx [%r27 + 0xb & ~0x7], %r12
        ldx [%r22 + 0x95 & ~0x7], %r14
        ldx [%r22 + 0x70 & ~0x7], %r16
        ld [%r25 + 0x82 & ~0x7], %f0
        ld [%r24 + 0x50 & ~0x7], %f16
        ld [%r22 + 0xc0 & ~0x7], %f32
        ld [%r24 + 0x92 & ~0x7], %f48
               ldsba [%r1]17, %r14
               ldsha [%r1]17, %r14
               ldswa [%r1]17, %r2
               lduba [%r1]17, %r16
               lduha [%r1]17, %r10
               ldxa [%r1]17, %r8
               ldda [%r1]17, %r12
               ldstuba [%r1]17, %r4
               swapa [%r1]17, %r2
               lda [%r1]17, %f16
               ldda [%r1]17, %f0
               stba %r6, [%r1]17
               stha %r10, [%r1]17
               stwa %r8, [%r1]17
               sta %f0, [%r1]17
               stda %f48, [%r1]17
casa  [%r1]0x11, %r2, %g0
casxa  [%r1]0x11, %r2, %g0
               prefetcha [%r1]17, 0x3
CASE_ASI_0x18_th1:
  mov %r23, %r1
        ldx [%r28 + 0x25 & ~0x7], %r2
        ldx [%r22 + 0xd7 & ~0x7], %r4
        ldx [%r21 + 0xfe & ~0x7], %r6
        ldx [%r25 + 0x96 & ~0x7], %r8
        ldx [%r23 + 0x21 & ~0x7], %r10
        ldx [%r28 + 0x19 & ~0x7], %r12
        ldx [%r22 + 0x89 & ~0x7], %r14
        ldx [%r24 + 0x37 & ~0x7], %r16
        ld [%r24 + 0x32 & ~0x7], %f0
        ld [%r28 + 0x8a & ~0x7], %f16
        ld [%r26 + 0x55 & ~0x7], %f32
        ld [%r27 + 0x8a & ~0x7], %f48
               ldsba [%r1]24, %r14
               ldsha [%r1]24, %r2
               ldswa [%r1]24, %r16
               lduba [%r1]24, %r14
               lduha [%r1]24, %r8
               ldxa [%r1]24, %r16
               ldda [%r1]24, %r4
               ldstuba [%r1]24, %r2
               swapa [%r1]24, %r16
               lda [%r1]24, %f16
               ldda [%r1]24, %f48
               stba %r6, [%r1]24
               stha %r0, [%r1]24
               stwa %r8, [%r1]24
               sta %f32, [%r1]24
               stda %f0, [%r1]24
casa  [%r1]0x18, %r2, %g0
casxa  [%r1]0x18, %r2, %g0
               prefetcha [%r1]24, 0xe
CASE_ASI_0x19_th1:
  mov %r27, %r1
        ldx [%r24 + 0x25 & ~0x7], %r2
        ldx [%r22 + 0xea & ~0x7], %r4
        ldx [%r26 + 0x40 & ~0x7], %r6
        ldx [%r23 + 0x27 & ~0x7], %r8
        ldx [%r28 + 0xd8 & ~0x7], %r10
        ldx [%r22 + 0xad & ~0x7], %r12
        ldx [%r23 + 0x2a & ~0x7], %r14
        ldx [%r27 + 0xad & ~0x7], %r16
        ld [%r26 + 0x3f & ~0x7], %f0
        ld [%r22 + 0xae & ~0x7], %f16
        ld [%r23 + 0x5d & ~0x7], %f32
        ld [%r27 + 0xdd & ~0x7], %f48
               ldsba [%r1]25, %r14
               ldsha [%r1]25, %r2
               ldswa [%r1]25, %r4
               lduba [%r1]25, %r16
               lduha [%r1]25, %r2
               ldxa [%r1]25, %r10
               ldda [%r1]25, %r10
               ldstuba [%r1]25, %r8
               swapa [%r1]25, %r4
               lda [%r1]25, %f32
               ldda [%r1]25, %f32
               stba %r12, [%r1]25
               stha %r6, [%r1]25
               stwa %r4, [%r1]25
               sta %f0, [%r1]25
               stda %f32, [%r1]25
casa  [%r1]0x19, %r2, %g0
casxa  [%r1]0x19, %r2, %g0
               prefetcha [%r1]25, 0x13
CASE_ASI_0x80_th1:
  mov %r25, %r1
        ldx [%r21 + 0x40 & ~0x7], %r2
        ldx [%r21 + 0x60 & ~0x7], %r4
        ldx [%r23 + 0x9b & ~0x7], %r6
        ldx [%r21 + 0x6 & ~0x7], %r8
        ldx [%r23 + 0xf1 & ~0x7], %r10
        ldx [%r26 + 0x83 & ~0x7], %r12
        ldx [%r23 + 0xf9 & ~0x7], %r14
        ldx [%r26 + 0xd5 & ~0x7], %r16
        ld [%r21 + 0x89 & ~0x7], %f0
        ld [%r23 + 0x5a & ~0x7], %f16
        ld [%r21 + 0x2d & ~0x7], %f32
        ld [%r28 + 0xd4 & ~0x7], %f48
               ldsba [%r1]128, %r10
               ldsha [%r1]128, %r12
               ldswa [%r1]128, %r2
               lduba [%r1]128, %r16
               lduha [%r1]128, %r4
               ldxa [%r1]128, %r2
               ldda [%r1]128, %r8
               ldstuba [%r1]128, %r12
               swapa [%r1]128, %r14
               lda [%r1]128, %f32
               ldda [%r1]128, %f0
               stba %r2, [%r1]128
               stha %r0, [%r1]128
               stwa %r6, [%r1]128
               sta %f32, [%r1]128
               stda %f48, [%r1]128
casa  [%r1]0x80, %r2, %g0
casxa  [%r1]0x80, %r2, %g0
               prefetcha [%r1]128, 0x1e
CASE_ASI_0x81_th1:
  mov %r22, %r1
        ldx [%r27 + 0x69 & ~0x7], %r2
        ldx [%r21 + 0x26 & ~0x7], %r4
        ldx [%r28 + 0xb2 & ~0x7], %r6
        ldx [%r24 + 0x41 & ~0x7], %r8
        ldx [%r22 + 0x57 & ~0x7], %r10
        ldx [%r26 + 0x59 & ~0x7], %r12
        ldx [%r27 + 0x43 & ~0x7], %r14
        ldx [%r25 + 0x1d & ~0x7], %r16
        ld [%r26 + 0x2c & ~0x7], %f0
        ld [%r21 + 0x84 & ~0x7], %f16
        ld [%r22 + 0xa8 & ~0x7], %f32
        ld [%r23 + 0x79 & ~0x7], %f48
               ldsba [%r1]129, %r10
               ldsha [%r1]129, %r16
               ldswa [%r1]129, %r16
               lduba [%r1]129, %r6
               lduha [%r1]129, %r14
               ldxa [%r1]129, %r6
               ldda [%r1]129, %r4
               ldstuba [%r1]129, %r12
               swapa [%r1]129, %r12
               lda [%r1]129, %f0
               ldda [%r1]129, %f32
               stba %r6, [%r1]129
               stha %r14, [%r1]129
               stwa %r8, [%r1]129
               sta %f16, [%r1]129
               stda %f32, [%r1]129
casa  [%r1]0x81, %r2, %g0
casxa  [%r1]0x81, %r2, %g0
               prefetcha [%r1]129, 0xf
CASE_ASI_0x82_th1:
  mov %r27, %r1
        ldx [%r27 + 0xba & ~0x7], %r2
        ldx [%r27 + 0x85 & ~0x7], %r4
        ldx [%r24 + 0x63 & ~0x7], %r6
        ldx [%r27 + 0x75 & ~0x7], %r8
        ldx [%r27 + 0x32 & ~0x7], %r10
        ldx [%r28 + 0x74 & ~0x7], %r12
        ldx [%r23 + 0x2d & ~0x7], %r14
        ldx [%r22 + 0x3c & ~0x7], %r16
        ld [%r25 + 0x7e & ~0x7], %f0
        ld [%r27 + 0x5e & ~0x7], %f16
        ld [%r27 + 0xbc & ~0x7], %f32
        ld [%r26 + 0xe9 & ~0x7], %f48
               ldsba [%r1]130, %r4
               ldsha [%r1]130, %r8
               ldswa [%r1]130, %r2
               lduba [%r1]130, %r2
               lduha [%r1]130, %r4
               ldxa [%r1]130, %r16
               ldda [%r1]130, %r4
               ldstuba [%r1]130, %r14
               swapa [%r1]130, %r16
               lda [%r1]130, %f0
               ldda [%r1]130, %f48
               stba %r2, [%r1]130
               stha %r0, [%r1]130
               stwa %r2, [%r1]130
               sta %f0, [%r1]130
               stda %f32, [%r1]130
casa  [%r1]0x82, %r2, %g0
casxa  [%r1]0x82, %r2, %g0
               prefetcha [%r1]130, 0x1c
CASE_ASI_0x83_th1:
  mov %r21, %r1
        ldx [%r22 + 0xbb & ~0x7], %r2
        ldx [%r27 + 0xab & ~0x7], %r4
        ldx [%r27 + 0x9 & ~0x7], %r6
        ldx [%r26 + 0x7b & ~0x7], %r8
        ldx [%r27 + 0xc0 & ~0x7], %r10
        ldx [%r27 + 0x3e & ~0x7], %r12
        ldx [%r23 + 0x62 & ~0x7], %r14
        ldx [%r26 + 0xaa & ~0x7], %r16
        ld [%r27 + 0x53 & ~0x7], %f0
        ld [%r26 + 0x16 & ~0x7], %f16
        ld [%r22 + 0x60 & ~0x7], %f32
        ld [%r25 + 0x8d & ~0x7], %f48
               ldsba [%r1]131, %r12
               ldsha [%r1]131, %r8
               ldswa [%r1]131, %r10
               lduba [%r1]131, %r6
               lduha [%r1]131, %r16
               ldxa [%r1]131, %r10
               ldda [%r1]131, %r14
               ldstuba [%r1]131, %r2
               swapa [%r1]131, %r2
               lda [%r1]131, %f32
               ldda [%r1]131, %f0
               stba %r4, [%r1]131
               stha %r4, [%r1]131
               stwa %r10, [%r1]131
               sta %f48, [%r1]131
               stda %f0, [%r1]131
casa  [%r1]0x83, %r2, %g0
casxa  [%r1]0x83, %r2, %g0
               prefetcha [%r1]131, 0x1f
CASE_ASI_0x88_th1:
  mov %r27, %r1
        ldx [%r21 + 0x61 & ~0x7], %r2
        ldx [%r28 + 0x78 & ~0x7], %r4
        ldx [%r25 + 0x4 & ~0x7], %r6
        ldx [%r28 + 0x26 & ~0x7], %r8
        ldx [%r21 + 0x25 & ~0x7], %r10
        ldx [%r28 + 0x35 & ~0x7], %r12
        ldx [%r26 + 0xba & ~0x7], %r14
        ldx [%r23 + 0x13 & ~0x7], %r16
        ld [%r22 + 0xe2 & ~0x7], %f0
        ld [%r21 + 0x9b & ~0x7], %f16
        ld [%r23 + 0x53 & ~0x7], %f32
        ld [%r23 + 0x1b & ~0x7], %f48
               ldsba [%r1]136, %r2
               ldsha [%r1]136, %r8
               ldswa [%r1]136, %r14
               lduba [%r1]136, %r16
               lduha [%r1]136, %r10
               ldxa [%r1]136, %r10
               ldda [%r1]136, %r2
               ldstuba [%r1]136, %r2
               swapa [%r1]136, %r8
               lda [%r1]136, %f0
               ldda [%r1]136, %f0
               stba %r6, [%r1]136
               stha %r4, [%r1]136
               stwa %r14, [%r1]136
               sta %f16, [%r1]136
               stda %f32, [%r1]136
casa  [%r1]0x88, %r2, %g0
casxa  [%r1]0x88, %r2, %g0
               prefetcha [%r1]136, 0x12
CASE_ASI_0x89_th1:
  mov %r23, %r1
        ldx [%r23 + 0x27 & ~0x7], %r2
        ldx [%r21 + 0xfe & ~0x7], %r4
        ldx [%r22 + 0x1e & ~0x7], %r6
        ldx [%r26 + 0x96 & ~0x7], %r8
        ldx [%r26 + 0x51 & ~0x7], %r10
        ldx [%r23 + 0x73 & ~0x7], %r12
        ldx [%r24 + 0x4e & ~0x7], %r14
        ldx [%r24 + 0xe5 & ~0x7], %r16
        ld [%r21 + 0xdb & ~0x7], %f0
        ld [%r21 + 0x3f & ~0x7], %f16
        ld [%r22 + 0x9e & ~0x7], %f32
        ld [%r25 + 0x36 & ~0x7], %f48
               ldsba [%r1]137, %r8
               ldsha [%r1]137, %r10
               ldswa [%r1]137, %r16
               lduba [%r1]137, %r2
               lduha [%r1]137, %r8
               ldxa [%r1]137, %r8
               ldda [%r1]137, %r8
               ldstuba [%r1]137, %r12
               swapa [%r1]137, %r16
               lda [%r1]137, %f32
               ldda [%r1]137, %f0
               stba %r8, [%r1]137
               stha %r8, [%r1]137
               stwa %r0, [%r1]137
               sta %f48, [%r1]137
               stda %f0, [%r1]137
casa  [%r1]0x89, %r2, %g0
casxa  [%r1]0x89, %r2, %g0
               prefetcha [%r1]137, 0x9
CASE_ASI_0x8a_th1:
  mov %r28, %r1
        ldx [%r27 + 0x5f & ~0x7], %r2
        ldx [%r21 + 0xb3 & ~0x7], %r4
        ldx [%r21 + 0x95 & ~0x7], %r6
        ldx [%r28 + 0xda & ~0x7], %r8
        ldx [%r24 + 0x91 & ~0x7], %r10
        ldx [%r27 + 0x9e & ~0x7], %r12
        ldx [%r23 + 0x88 & ~0x7], %r14
        ldx [%r27 + 0x14 & ~0x7], %r16
        ld [%r27 + 0x3f & ~0x7], %f0
        ld [%r27 + 0x57 & ~0x7], %f16
        ld [%r21 + 0x2e & ~0x7], %f32
        ld [%r24 + 0x96 & ~0x7], %f48
               ldsba [%r1]138, %r14
               ldsha [%r1]138, %r6
               ldswa [%r1]138, %r4
               lduba [%r1]138, %r6
               lduha [%r1]138, %r10
               ldxa [%r1]138, %r16
               ldda [%r1]138, %r12
               ldstuba [%r1]138, %r6
               swapa [%r1]138, %r2
               lda [%r1]138, %f48
               ldda [%r1]138, %f32
               stba %r4, [%r1]138
               stha %r6, [%r1]138
               stwa %r4, [%r1]138
               sta %f48, [%r1]138
               stda %f0, [%r1]138
casa  [%r1]0x8a, %r2, %g0
casxa  [%r1]0x8a, %r2, %g0
               prefetcha [%r1]138, 0x14
CASE_ASI_0x8b_th1:
  mov %r22, %r1
        ldx [%r24 + 0x63 & ~0x7], %r2
        ldx [%r23 + 0x8f & ~0x7], %r4
        ldx [%r26 + 0xc3 & ~0x7], %r6
        ldx [%r22 + 0x2 & ~0x7], %r8
        ldx [%r26 + 0xc3 & ~0x7], %r10
        ldx [%r23 + 0x23 & ~0x7], %r12
        ldx [%r23 + 0xc5 & ~0x7], %r14
        ldx [%r22 + 0xe5 & ~0x7], %r16
        ld [%r26 + 0x92 & ~0x7], %f0
        ld [%r23 + 0x5d & ~0x7], %f16
        ld [%r26 + 0x13 & ~0x7], %f32
        ld [%r23 + 0x26 & ~0x7], %f48
               ldsba [%r1]139, %r2
               ldsha [%r1]139, %r6
               ldswa [%r1]139, %r8
               lduba [%r1]139, %r6
               lduha [%r1]139, %r14
               ldxa [%r1]139, %r6
               ldda [%r1]139, %r2
               ldstuba [%r1]139, %r10
               swapa [%r1]139, %r2
               lda [%r1]139, %f48
               ldda [%r1]139, %f32
               stba %r2, [%r1]139
               stha %r14, [%r1]139
               stwa %r6, [%r1]139
               sta %f48, [%r1]139
               stda %f32, [%r1]139
casa  [%r1]0x8b, %r2, %g0
casxa  [%r1]0x8b, %r2, %g0
               prefetcha [%r1]139, 0x1b
        nop
        nop
        nop
subcc	%r19, 1, %r19
cmp %r19, 2
bz,a TH1_LOOP
ta T_CHANGE_NONPRIV
cmp %r19, 1
bz,a TH1_LOOP
ta T_CHANGE_HPRIV
        nop
        nop
	ba main_text_end
	nop
        nop
        nop
        nop
        nop
	LOOP_T2:
 add %g0, 0x3, %r19
TH2_LOOP:
CASE_ASI_0x0_th2:
  wr %g0, 0x0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1_th2:
  wr %g0, 0x1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2_th2:
  wr %g0, 0x2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3_th2:
  wr %g0, 0x3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5_th2:
  wr %g0, 0x5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6_th2:
  wr %g0, 0x6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7_th2:
  wr %g0, 0x7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8_th2:
  wr %g0, 0x8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9_th2:
  wr %g0, 0x9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa_th2:
  wr %g0, 0xa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb_th2:
  wr %g0, 0xb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd_th2:
  wr %g0, 0xd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe_th2:
  wr %g0, 0xe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf_th2:
  wr %g0, 0xf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x12_th2:
  wr %g0, 0x12, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x13_th2:
  wr %g0, 0x13, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1a_th2:
  wr %g0, 0x1a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1b_th2:
  wr %g0, 0x1b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x20_th2:
  wr %g0, 0x20, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x21_th2:
  wr %g0, 0x21, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x25_th2:
  wr %g0, 0x25, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x28_th2:
  wr %g0, 0x28, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x29_th2:
  wr %g0, 0x29, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2d_th2:
  wr %g0, 0x2d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x32_th2:
  wr %g0, 0x32, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x33_th2:
  wr %g0, 0x33, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x34_th2:
  wr %g0, 0x34, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x35_th2:
  wr %g0, 0x35, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x37_th2:
  wr %g0, 0x37, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3a_th2:
  wr %g0, 0x3a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3b_th2:
  wr %g0, 0x3b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3c_th2:
  wr %g0, 0x3c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3d_th2:
  wr %g0, 0x3d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3f_th2:
  wr %g0, 0x3f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x40_th2:
  wr %g0, 0x40, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x41_th2:
  wr %g0, 0x41, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x42_th2:
  wr %g0, 0x42, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x43_th2:
  wr %g0, 0x43, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x44_th2:
  wr %g0, 0x44, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x45_th2:
  wr %g0, 0x45, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x48_th2:
  wr %g0, 0x48, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x49_th2:
  wr %g0, 0x49, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4a_th2:
  wr %g0, 0x4a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4b_th2:
  wr %g0, 0x4b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4c_th2:
  wr %g0, 0x4c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4d_th2:
  wr %g0, 0x4d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4e_th2:
  wr %g0, 0x4e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4f_th2:
  wr %g0, 0x4f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x50_th2:
  wr %g0, 0x50, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x51_th2:
  wr %g0, 0x51, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x52_th2:
  wr %g0, 0x52, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x53_th2:
  wr %g0, 0x53, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x56_th2:
  wr %g0, 0x56, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x57_th2:
  wr %g0, 0x57, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x58_th2:
  wr %g0, 0x58, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x59_th2:
  wr %g0, 0x59, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5a_th2:
  wr %g0, 0x5a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5b_th2:
  wr %g0, 0x5b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5e_th2:
  wr %g0, 0x5e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5f_th2:
  wr %g0, 0x5f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x60_th2:
  wr %g0, 0x60, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x61_th2:
  wr %g0, 0x61, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x62_th2:
  wr %g0, 0x62, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x63_th2:
  wr %g0, 0x63, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x64_th2:
  wr %g0, 0x64, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x65_th2:
  wr %g0, 0x65, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x68_th2:
  wr %g0, 0x68, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x69_th2:
  wr %g0, 0x69, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6a_th2:
  wr %g0, 0x6a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6b_th2:
  wr %g0, 0x6b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6c_th2:
  wr %g0, 0x6c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6d_th2:
  wr %g0, 0x6d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6e_th2:
  wr %g0, 0x6e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6f_th2:
  wr %g0, 0x6f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x70_th2:
  wr %g0, 0x70, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x71_th2:
  wr %g0, 0x71, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x72_th2:
  wr %g0, 0x72, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x74_th2:
  wr %g0, 0x74, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x75_th2:
  wr %g0, 0x75, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x76_th2:
  wr %g0, 0x76, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x77_th2:
  wr %g0, 0x77, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x78_th2:
  wr %g0, 0x78, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x79_th2:
  wr %g0, 0x79, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7a_th2:
  wr %g0, 0x7a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7b_th2:
  wr %g0, 0x7b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7c_th2:
  wr %g0, 0x7c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7d_th2:
  wr %g0, 0x7d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7e_th2:
  wr %g0, 0x7e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7f_th2:
  wr %g0, 0x7f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x84_th2:
  wr %g0, 0x84, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x85_th2:
  wr %g0, 0x85, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x86_th2:
  wr %g0, 0x86, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x87_th2:
  wr %g0, 0x87, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8c_th2:
  wr %g0, 0x8c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8d_th2:
  wr %g0, 0x8d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8e_th2:
  wr %g0, 0x8e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8f_th2:
  wr %g0, 0x8f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x90_th2:
  wr %g0, 0x90, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x91_th2:
  wr %g0, 0x91, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x92_th2:
  wr %g0, 0x92, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x93_th2:
  wr %g0, 0x93, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x94_th2:
  wr %g0, 0x94, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x95_th2:
  wr %g0, 0x95, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x96_th2:
  wr %g0, 0x96, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x97_th2:
  wr %g0, 0x97, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x98_th2:
  wr %g0, 0x98, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x99_th2:
  wr %g0, 0x99, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9a_th2:
  wr %g0, 0x9a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9b_th2:
  wr %g0, 0x9b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9c_th2:
  wr %g0, 0x9c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9d_th2:
  wr %g0, 0x9d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9e_th2:
  wr %g0, 0x9e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9f_th2:
  wr %g0, 0x9f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa0_th2:
  wr %g0, 0xa0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa1_th2:
  wr %g0, 0xa1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa2_th2:
  wr %g0, 0xa2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa3_th2:
  wr %g0, 0xa3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa4_th2:
  wr %g0, 0xa4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa5_th2:
  wr %g0, 0xa5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa6_th2:
  wr %g0, 0xa6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa7_th2:
  wr %g0, 0xa7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa8_th2:
  wr %g0, 0xa8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa9_th2:
  wr %g0, 0xa9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaa_th2:
  wr %g0, 0xaa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xab_th2:
  wr %g0, 0xab, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xac_th2:
  wr %g0, 0xac, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xad_th2:
  wr %g0, 0xad, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xae_th2:
  wr %g0, 0xae, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaf_th2:
  wr %g0, 0xaf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb0_th2:
  wr %g0, 0xb0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb1_th2:
  wr %g0, 0xb1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb2_th2:
  wr %g0, 0xb2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb3_th2:
  wr %g0, 0xb3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb4_th2:
  wr %g0, 0xb4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb5_th2:
  wr %g0, 0xb5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb6_th2:
  wr %g0, 0xb6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb7_th2:
  wr %g0, 0xb7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb8_th2:
  wr %g0, 0xb8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb9_th2:
  wr %g0, 0xb9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xba_th2:
  wr %g0, 0xba, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbb_th2:
  wr %g0, 0xbb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbc_th2:
  wr %g0, 0xbc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbd_th2:
  wr %g0, 0xbd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbe_th2:
  wr %g0, 0xbe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbf_th2:
  wr %g0, 0xbf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc6_th2:
  wr %g0, 0xc6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc7_th2:
  wr %g0, 0xc7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xce_th2:
  wr %g0, 0xce, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xcf_th2:
  wr %g0, 0xcf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd4_th2:
  wr %g0, 0xd4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd5_th2:
  wr %g0, 0xd5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd6_th2:
  wr %g0, 0xd6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd7_th2:
  wr %g0, 0xd7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdc_th2:
  wr %g0, 0xdc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdd_th2:
  wr %g0, 0xdd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xde_th2:
  wr %g0, 0xde, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdf_th2:
  wr %g0, 0xdf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe4_th2:
  wr %g0, 0xe4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe5_th2:
  wr %g0, 0xe5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe6_th2:
  wr %g0, 0xe6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe7_th2:
  wr %g0, 0xe7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe8_th2:
  wr %g0, 0xe8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe9_th2:
  wr %g0, 0xe9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xec_th2:
  wr %g0, 0xec, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xed_th2:
  wr %g0, 0xed, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xee_th2:
  wr %g0, 0xee, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xef_th2:
  wr %g0, 0xef, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf2_th2:
  wr %g0, 0xf2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf3_th2:
  wr %g0, 0xf3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf4_th2:
  wr %g0, 0xf4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf5_th2:
  wr %g0, 0xf5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf6_th2:
  wr %g0, 0xf6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf7_th2:
  wr %g0, 0xf7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfa_th2:
  wr %g0, 0xfa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfb_th2:
  wr %g0, 0xfb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfc_th2:
  wr %g0, 0xfc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfd_th2:
  wr %g0, 0xfd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfe_th2:
  wr %g0, 0xfe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xff_th2:
  wr %g0, 0xff, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x46_th2:
  wr %g0, 0x46, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x47_th2:
  wr %g0, 0x47, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x4_th2:
  mov %r21, %r1
        ldx [%r27 + 0xa0 & ~0x7], %r2
        ldx [%r21 + 0x74 & ~0x7], %r4
        ldx [%r24 + 0x3e & ~0x7], %r6
        ldx [%r27 + 0x51 & ~0x7], %r8
        ldx [%r26 + 0xa1 & ~0x7], %r10
        ldx [%r28 + 0xa5 & ~0x7], %r12
        ldx [%r25 + 0xed & ~0x7], %r14
        ldx [%r26 + 0x8c & ~0x7], %r16
        ld [%r25 + 0x79 & ~0x7], %f0
        ld [%r24 + 0x2b & ~0x7], %f16
        ld [%r24 + 0x19 & ~0x7], %f32
        ld [%r24 + 0x6c & ~0x7], %f48
               ldsba [%r1]4, %r10
               ldsha [%r1]4, %r4
               ldswa [%r1]4, %r8
               lduba [%r1]4, %r10
               lduha [%r1]4, %r8
               ldxa [%r1]4, %r16
               ldda [%r1]4, %r4
               ldstuba [%r1]4, %r12
               swapa [%r1]4, %r14
               lda [%r1]4, %f32
               ldda [%r1]4, %f48
               stba %r8, [%r1]4
               stha %r12, [%r1]4
               stwa %r8, [%r1]4
               sta %f32, [%r1]4
               stda %f0, [%r1]4
casa  [%r1]0x4, %r2, %g0
casxa  [%r1]0x4, %r2, %g0
               prefetcha [%r1]4, 0x14
CASE_ASI_0xc_th2:
  mov %r28, %r1
        ldx [%r23 + 0xa6 & ~0x7], %r2
        ldx [%r25 + 0x46 & ~0x7], %r4
        ldx [%r21 + 0xec & ~0x7], %r6
        ldx [%r23 + 0x8c & ~0x7], %r8
        ldx [%r24 + 0x1a & ~0x7], %r10
        ldx [%r24 + 0x80 & ~0x7], %r12
        ldx [%r26 + 0xb6 & ~0x7], %r14
        ldx [%r24 + 0x2f & ~0x7], %r16
        ld [%r28 + 0xe9 & ~0x7], %f0
        ld [%r22 + 0xe0 & ~0x7], %f16
        ld [%r21 + 0x5c & ~0x7], %f32
        ld [%r21 + 0xe2 & ~0x7], %f48
               ldsba [%r1]12, %r12
               ldsha [%r1]12, %r14
               ldswa [%r1]12, %r6
               lduba [%r1]12, %r12
               lduha [%r1]12, %r16
               ldxa [%r1]12, %r8
               ldda [%r1]12, %r8
               ldstuba [%r1]12, %r16
               swapa [%r1]12, %r10
               lda [%r1]12, %f32
               ldda [%r1]12, %f0
               stba %r14, [%r1]12
               stha %r4, [%r1]12
               stwa %r2, [%r1]12
               sta %f16, [%r1]12
               stda %f48, [%r1]12
casa  [%r1]0xc, %r2, %g0
casxa  [%r1]0xc, %r2, %g0
               prefetcha [%r1]12, 0x1f
CASE_ASI_0x10_th2:
  mov %r25, %r1
        ldx [%r24 + 0xaf & ~0x7], %r2
        ldx [%r25 + 0xa2 & ~0x7], %r4
        ldx [%r27 + 0xdb & ~0x7], %r6
        ldx [%r28 + 0x58 & ~0x7], %r8
        ldx [%r27 + 0x96 & ~0x7], %r10
        ldx [%r22 + 0x87 & ~0x7], %r12
        ldx [%r22 + 0x79 & ~0x7], %r14
        ldx [%r21 + 0x52 & ~0x7], %r16
        ld [%r23 + 0x7f & ~0x7], %f0
        ld [%r24 + 0x94 & ~0x7], %f16
        ld [%r27 + 0x51 & ~0x7], %f32
        ld [%r23 + 0x14 & ~0x7], %f48
               ldsba [%r1]16, %r8
               ldsha [%r1]16, %r4
               ldswa [%r1]16, %r10
               lduba [%r1]16, %r16
               lduha [%r1]16, %r12
               ldxa [%r1]16, %r14
               ldda [%r1]16, %r4
               ldstuba [%r1]16, %r12
               swapa [%r1]16, %r16
               lda [%r1]16, %f0
               ldda [%r1]16, %f48
               stba %r6, [%r1]16
               stha %r4, [%r1]16
               stwa %r12, [%r1]16
               sta %f0, [%r1]16
               stda %f16, [%r1]16
casa  [%r1]0x10, %r2, %g0
casxa  [%r1]0x10, %r2, %g0
               prefetcha [%r1]16, 0x7
CASE_ASI_0x11_th2:
  mov %r25, %r1
        ldx [%r26 + 0x2a & ~0x7], %r2
        ldx [%r27 + 0x3f & ~0x7], %r4
        ldx [%r26 + 0x7c & ~0x7], %r6
        ldx [%r25 + 0x93 & ~0x7], %r8
        ldx [%r28 + 0xbd & ~0x7], %r10
        ldx [%r27 + 0xef & ~0x7], %r12
        ldx [%r24 + 0x4f & ~0x7], %r14
        ldx [%r27 + 0xf5 & ~0x7], %r16
        ld [%r24 + 0x7b & ~0x7], %f0
        ld [%r26 + 0x61 & ~0x7], %f16
        ld [%r21 + 0x29 & ~0x7], %f32
        ld [%r25 + 0x39 & ~0x7], %f48
               ldsba [%r1]17, %r2
               ldsha [%r1]17, %r10
               ldswa [%r1]17, %r12
               lduba [%r1]17, %r16
               lduha [%r1]17, %r14
               ldxa [%r1]17, %r16
               ldda [%r1]17, %r10
               ldstuba [%r1]17, %r8
               swapa [%r1]17, %r14
               lda [%r1]17, %f48
               ldda [%r1]17, %f48
               stba %r0, [%r1]17
               stha %r10, [%r1]17
               stwa %r14, [%r1]17
               sta %f32, [%r1]17
               stda %f16, [%r1]17
casa  [%r1]0x11, %r2, %g0
casxa  [%r1]0x11, %r2, %g0
               prefetcha [%r1]17, 0x1d
CASE_ASI_0x18_th2:
  mov %r22, %r1
        ldx [%r21 + 0x75 & ~0x7], %r2
        ldx [%r21 + 0xc8 & ~0x7], %r4
        ldx [%r21 + 0x8f & ~0x7], %r6
        ldx [%r26 + 0xc1 & ~0x7], %r8
        ldx [%r28 + 0x3a & ~0x7], %r10
        ldx [%r23 + 0x46 & ~0x7], %r12
        ldx [%r25 + 0xd9 & ~0x7], %r14
        ldx [%r28 + 0x78 & ~0x7], %r16
        ld [%r27 + 0x48 & ~0x7], %f0
        ld [%r23 + 0xc6 & ~0x7], %f16
        ld [%r25 + 0x6a & ~0x7], %f32
        ld [%r25 + 0x1 & ~0x7], %f48
               ldsba [%r1]24, %r4
               ldsha [%r1]24, %r8
               ldswa [%r1]24, %r6
               lduba [%r1]24, %r6
               lduha [%r1]24, %r10
               ldxa [%r1]24, %r10
               ldda [%r1]24, %r6
               ldstuba [%r1]24, %r2
               swapa [%r1]24, %r10
               lda [%r1]24, %f0
               ldda [%r1]24, %f16
               stba %r2, [%r1]24
               stha %r14, [%r1]24
               stwa %r12, [%r1]24
               sta %f48, [%r1]24
               stda %f16, [%r1]24
casa  [%r1]0x18, %r2, %g0
casxa  [%r1]0x18, %r2, %g0
               prefetcha [%r1]24, 0xf
CASE_ASI_0x19_th2:
  mov %r22, %r1
        ldx [%r24 + 0xc7 & ~0x7], %r2
        ldx [%r25 + 0x19 & ~0x7], %r4
        ldx [%r28 + 0xbd & ~0x7], %r6
        ldx [%r23 + 0xaf & ~0x7], %r8
        ldx [%r24 + 0x6e & ~0x7], %r10
        ldx [%r24 + 0x14 & ~0x7], %r12
        ldx [%r23 + 0xcc & ~0x7], %r14
        ldx [%r25 + 0x50 & ~0x7], %r16
        ld [%r23 + 0x3e & ~0x7], %f0
        ld [%r23 + 0xdd & ~0x7], %f16
        ld [%r26 + 0x9b & ~0x7], %f32
        ld [%r21 + 0xe8 & ~0x7], %f48
               ldsba [%r1]25, %r6
               ldsha [%r1]25, %r8
               ldswa [%r1]25, %r4
               lduba [%r1]25, %r16
               lduha [%r1]25, %r6
               ldxa [%r1]25, %r6
               ldda [%r1]25, %r2
               ldstuba [%r1]25, %r8
               swapa [%r1]25, %r16
               lda [%r1]25, %f16
               ldda [%r1]25, %f16
               stba %r2, [%r1]25
               stha %r12, [%r1]25
               stwa %r2, [%r1]25
               sta %f32, [%r1]25
               stda %f16, [%r1]25
casa  [%r1]0x19, %r2, %g0
casxa  [%r1]0x19, %r2, %g0
               prefetcha [%r1]25, 0x11
CASE_ASI_0x80_th2:
  mov %r28, %r1
        ldx [%r21 + 0x23 & ~0x7], %r2
        ldx [%r27 + 0xa6 & ~0x7], %r4
        ldx [%r25 + 0xee & ~0x7], %r6
        ldx [%r22 + 0x1 & ~0x7], %r8
        ldx [%r26 + 0x30 & ~0x7], %r10
        ldx [%r25 + 0x2d & ~0x7], %r12
        ldx [%r25 + 0x58 & ~0x7], %r14
        ldx [%r24 + 0x9d & ~0x7], %r16
        ld [%r25 + 0xdc & ~0x7], %f0
        ld [%r25 + 0x7a & ~0x7], %f16
        ld [%r22 + 0xe & ~0x7], %f32
        ld [%r28 + 0x14 & ~0x7], %f48
               ldsba [%r1]128, %r4
               ldsha [%r1]128, %r8
               ldswa [%r1]128, %r8
               lduba [%r1]128, %r4
               lduha [%r1]128, %r8
               ldxa [%r1]128, %r2
               ldda [%r1]128, %r8
               ldstuba [%r1]128, %r16
               swapa [%r1]128, %r6
               lda [%r1]128, %f16
               ldda [%r1]128, %f32
               stba %r6, [%r1]128
               stha %r10, [%r1]128
               stwa %r2, [%r1]128
               sta %f48, [%r1]128
               stda %f16, [%r1]128
casa  [%r1]0x80, %r2, %g0
casxa  [%r1]0x80, %r2, %g0
               prefetcha [%r1]128, 0x0
CASE_ASI_0x81_th2:
  mov %r26, %r1
        ldx [%r21 + 0x7d & ~0x7], %r2
        ldx [%r25 + 0xbb & ~0x7], %r4
        ldx [%r23 + 0xbb & ~0x7], %r6
        ldx [%r27 + 0xa5 & ~0x7], %r8
        ldx [%r26 + 0x59 & ~0x7], %r10
        ldx [%r21 + 0x8e & ~0x7], %r12
        ldx [%r24 + 0x74 & ~0x7], %r14
        ldx [%r22 + 0xc6 & ~0x7], %r16
        ld [%r23 + 0x95 & ~0x7], %f0
        ld [%r25 + 0xca & ~0x7], %f16
        ld [%r22 + 0x87 & ~0x7], %f32
        ld [%r22 + 0x13 & ~0x7], %f48
               ldsba [%r1]129, %r6
               ldsha [%r1]129, %r16
               ldswa [%r1]129, %r16
               lduba [%r1]129, %r4
               lduha [%r1]129, %r16
               ldxa [%r1]129, %r10
               ldda [%r1]129, %r6
               ldstuba [%r1]129, %r10
               swapa [%r1]129, %r4
               lda [%r1]129, %f16
               ldda [%r1]129, %f0
               stba %r14, [%r1]129
               stha %r14, [%r1]129
               stwa %r12, [%r1]129
               sta %f0, [%r1]129
               stda %f16, [%r1]129
casa  [%r1]0x81, %r2, %g0
casxa  [%r1]0x81, %r2, %g0
               prefetcha [%r1]129, 0x7
CASE_ASI_0x82_th2:
  mov %r27, %r1
        ldx [%r25 + 0xa7 & ~0x7], %r2
        ldx [%r23 + 0x1b & ~0x7], %r4
        ldx [%r28 + 0x39 & ~0x7], %r6
        ldx [%r26 + 0x20 & ~0x7], %r8
        ldx [%r28 + 0xdd & ~0x7], %r10
        ldx [%r28 + 0xd0 & ~0x7], %r12
        ldx [%r28 + 0x52 & ~0x7], %r14
        ldx [%r25 + 0x2c & ~0x7], %r16
        ld [%r23 + 0xe4 & ~0x7], %f0
        ld [%r28 + 0x72 & ~0x7], %f16
        ld [%r28 + 0xab & ~0x7], %f32
        ld [%r28 + 0xc1 & ~0x7], %f48
               ldsba [%r1]130, %r6
               ldsha [%r1]130, %r14
               ldswa [%r1]130, %r12
               lduba [%r1]130, %r14
               lduha [%r1]130, %r4
               ldxa [%r1]130, %r16
               ldda [%r1]130, %r16
               ldstuba [%r1]130, %r12
               swapa [%r1]130, %r2
               lda [%r1]130, %f16
               ldda [%r1]130, %f0
               stba %r0, [%r1]130
               stha %r6, [%r1]130
               stwa %r8, [%r1]130
               sta %f16, [%r1]130
               stda %f48, [%r1]130
casa  [%r1]0x82, %r2, %g0
casxa  [%r1]0x82, %r2, %g0
               prefetcha [%r1]130, 0x1e
CASE_ASI_0x83_th2:
  mov %r22, %r1
        ldx [%r24 + 0x69 & ~0x7], %r2
        ldx [%r24 + 0x27 & ~0x7], %r4
        ldx [%r27 + 0xc4 & ~0x7], %r6
        ldx [%r27 + 0x3e & ~0x7], %r8
        ldx [%r25 + 0x23 & ~0x7], %r10
        ldx [%r26 + 0xa & ~0x7], %r12
        ldx [%r21 + 0x7f & ~0x7], %r14
        ldx [%r27 + 0x4e & ~0x7], %r16
        ld [%r26 + 0xbb & ~0x7], %f0
        ld [%r24 + 0x96 & ~0x7], %f16
        ld [%r27 + 0xdf & ~0x7], %f32
        ld [%r26 + 0x14 & ~0x7], %f48
               ldsba [%r1]131, %r16
               ldsha [%r1]131, %r14
               ldswa [%r1]131, %r16
               lduba [%r1]131, %r2
               lduha [%r1]131, %r16
               ldxa [%r1]131, %r8
               ldda [%r1]131, %r14
               ldstuba [%r1]131, %r12
               swapa [%r1]131, %r4
               lda [%r1]131, %f0
               ldda [%r1]131, %f16
               stba %r8, [%r1]131
               stha %r0, [%r1]131
               stwa %r14, [%r1]131
               sta %f16, [%r1]131
               stda %f32, [%r1]131
casa  [%r1]0x83, %r2, %g0
casxa  [%r1]0x83, %r2, %g0
               prefetcha [%r1]131, 0x18
CASE_ASI_0x88_th2:
  mov %r24, %r1
        ldx [%r25 + 0xf5 & ~0x7], %r2
        ldx [%r28 + 0xe6 & ~0x7], %r4
        ldx [%r26 + 0x97 & ~0x7], %r6
        ldx [%r21 + 0xdf & ~0x7], %r8
        ldx [%r22 + 0x3e & ~0x7], %r10
        ldx [%r27 + 0x8d & ~0x7], %r12
        ldx [%r21 + 0xe1 & ~0x7], %r14
        ldx [%r27 + 0xc1 & ~0x7], %r16
        ld [%r28 + 0xaf & ~0x7], %f0
        ld [%r24 + 0xe6 & ~0x7], %f16
        ld [%r23 + 0xaf & ~0x7], %f32
        ld [%r23 + 0x6d & ~0x7], %f48
               ldsba [%r1]136, %r2
               ldsha [%r1]136, %r2
               ldswa [%r1]136, %r16
               lduba [%r1]136, %r12
               lduha [%r1]136, %r16
               ldxa [%r1]136, %r4
               ldda [%r1]136, %r14
               ldstuba [%r1]136, %r12
               swapa [%r1]136, %r14
               lda [%r1]136, %f48
               ldda [%r1]136, %f0
               stba %r0, [%r1]136
               stha %r12, [%r1]136
               stwa %r6, [%r1]136
               sta %f0, [%r1]136
               stda %f32, [%r1]136
casa  [%r1]0x88, %r2, %g0
casxa  [%r1]0x88, %r2, %g0
               prefetcha [%r1]136, 0x1c
CASE_ASI_0x89_th2:
  mov %r28, %r1
        ldx [%r28 + 0xa0 & ~0x7], %r2
        ldx [%r27 + 0x12 & ~0x7], %r4
        ldx [%r21 + 0x8 & ~0x7], %r6
        ldx [%r22 + 0x9 & ~0x7], %r8
        ldx [%r21 + 0x5a & ~0x7], %r10
        ldx [%r22 + 0xca & ~0x7], %r12
        ldx [%r23 + 0x49 & ~0x7], %r14
        ldx [%r23 + 0x55 & ~0x7], %r16
        ld [%r23 + 0x6a & ~0x7], %f0
        ld [%r24 + 0xad & ~0x7], %f16
        ld [%r23 + 0xbd & ~0x7], %f32
        ld [%r21 + 0x92 & ~0x7], %f48
               ldsba [%r1]137, %r12
               ldsha [%r1]137, %r12
               ldswa [%r1]137, %r14
               lduba [%r1]137, %r10
               lduha [%r1]137, %r6
               ldxa [%r1]137, %r16
               ldda [%r1]137, %r8
               ldstuba [%r1]137, %r4
               swapa [%r1]137, %r16
               lda [%r1]137, %f32
               ldda [%r1]137, %f32
               stba %r14, [%r1]137
               stha %r12, [%r1]137
               stwa %r0, [%r1]137
               sta %f16, [%r1]137
               stda %f16, [%r1]137
casa  [%r1]0x89, %r2, %g0
casxa  [%r1]0x89, %r2, %g0
               prefetcha [%r1]137, 0x1
CASE_ASI_0x8a_th2:
  mov %r27, %r1
        ldx [%r23 + 0x0 & ~0x7], %r2
        ldx [%r27 + 0xe4 & ~0x7], %r4
        ldx [%r22 + 0xd4 & ~0x7], %r6
        ldx [%r27 + 0x24 & ~0x7], %r8
        ldx [%r22 + 0xc3 & ~0x7], %r10
        ldx [%r26 + 0xc6 & ~0x7], %r12
        ldx [%r21 + 0x7b & ~0x7], %r14
        ldx [%r24 + 0x88 & ~0x7], %r16
        ld [%r21 + 0xff & ~0x7], %f0
        ld [%r23 + 0x15 & ~0x7], %f16
        ld [%r26 + 0x62 & ~0x7], %f32
        ld [%r21 + 0xe1 & ~0x7], %f48
               ldsba [%r1]138, %r10
               ldsha [%r1]138, %r6
               ldswa [%r1]138, %r12
               lduba [%r1]138, %r8
               lduha [%r1]138, %r6
               ldxa [%r1]138, %r4
               ldda [%r1]138, %r16
               ldstuba [%r1]138, %r12
               swapa [%r1]138, %r14
               lda [%r1]138, %f32
               ldda [%r1]138, %f32
               stba %r12, [%r1]138
               stha %r6, [%r1]138
               stwa %r12, [%r1]138
               sta %f32, [%r1]138
               stda %f48, [%r1]138
casa  [%r1]0x8a, %r2, %g0
casxa  [%r1]0x8a, %r2, %g0
               prefetcha [%r1]138, 0x18
CASE_ASI_0x8b_th2:
  mov %r21, %r1
        ldx [%r22 + 0xa7 & ~0x7], %r2
        ldx [%r23 + 0xc9 & ~0x7], %r4
        ldx [%r26 + 0xc0 & ~0x7], %r6
        ldx [%r28 + 0xa1 & ~0x7], %r8
        ldx [%r26 + 0xf5 & ~0x7], %r10
        ldx [%r24 + 0x7 & ~0x7], %r12
        ldx [%r26 + 0xd0 & ~0x7], %r14
        ldx [%r24 + 0x25 & ~0x7], %r16
        ld [%r26 + 0xb1 & ~0x7], %f0
        ld [%r21 + 0xe6 & ~0x7], %f16
        ld [%r24 + 0x54 & ~0x7], %f32
        ld [%r24 + 0x24 & ~0x7], %f48
               ldsba [%r1]139, %r2
               ldsha [%r1]139, %r10
               ldswa [%r1]139, %r2
               lduba [%r1]139, %r6
               lduha [%r1]139, %r8
               ldxa [%r1]139, %r12
               ldda [%r1]139, %r16
               ldstuba [%r1]139, %r16
               swapa [%r1]139, %r14
               lda [%r1]139, %f48
               ldda [%r1]139, %f48
               stba %r10, [%r1]139
               stha %r0, [%r1]139
               stwa %r2, [%r1]139
               sta %f16, [%r1]139
               stda %f16, [%r1]139
casa  [%r1]0x8b, %r2, %g0
casxa  [%r1]0x8b, %r2, %g0
               prefetcha [%r1]139, 0x16
        nop
        nop
        nop
subcc	%r19, 1, %r19
cmp %r19, 2
bz,a TH2_LOOP
ta T_CHANGE_PRIV
cmp %r19, 1
bz,a TH2_LOOP
ta T_CHANGE_HPRIV
        nop
	ba main_text_end
	nop
        nop
        nop
        nop
        nop
	LOOP_T3:
ta T_CHANGE_HPRIV
 add %g0, 0x3, %r19
TH3_LOOP:
CASE_ASI_0x0_th3:
  wr %g0, 0x0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1_th3:
  wr %g0, 0x1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2_th3:
  wr %g0, 0x2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3_th3:
  wr %g0, 0x3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5_th3:
  wr %g0, 0x5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6_th3:
  wr %g0, 0x6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7_th3:
  wr %g0, 0x7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8_th3:
  wr %g0, 0x8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9_th3:
  wr %g0, 0x9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa_th3:
  wr %g0, 0xa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb_th3:
  wr %g0, 0xb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd_th3:
  wr %g0, 0xd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe_th3:
  wr %g0, 0xe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf_th3:
  wr %g0, 0xf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x12_th3:
  wr %g0, 0x12, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x13_th3:
  wr %g0, 0x13, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1a_th3:
  wr %g0, 0x1a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1b_th3:
  wr %g0, 0x1b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x20_th3:
  wr %g0, 0x20, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x21_th3:
  wr %g0, 0x21, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x25_th3:
  wr %g0, 0x25, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x28_th3:
  wr %g0, 0x28, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x29_th3:
  wr %g0, 0x29, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2d_th3:
  wr %g0, 0x2d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x32_th3:
  wr %g0, 0x32, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x33_th3:
  wr %g0, 0x33, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x34_th3:
  wr %g0, 0x34, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x35_th3:
  wr %g0, 0x35, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x37_th3:
  wr %g0, 0x37, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3a_th3:
  wr %g0, 0x3a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3b_th3:
  wr %g0, 0x3b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3c_th3:
  wr %g0, 0x3c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3d_th3:
  wr %g0, 0x3d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3f_th3:
  wr %g0, 0x3f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x40_th3:
  wr %g0, 0x40, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x41_th3:
  wr %g0, 0x41, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x42_th3:
  wr %g0, 0x42, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x43_th3:
  wr %g0, 0x43, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x44_th3:
  wr %g0, 0x44, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x45_th3:
  wr %g0, 0x45, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x48_th3:
  wr %g0, 0x48, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x49_th3:
  wr %g0, 0x49, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4a_th3:
  wr %g0, 0x4a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4b_th3:
  wr %g0, 0x4b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4c_th3:
  wr %g0, 0x4c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4d_th3:
  wr %g0, 0x4d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4e_th3:
  wr %g0, 0x4e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4f_th3:
  wr %g0, 0x4f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x50_th3:
  wr %g0, 0x50, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x51_th3:
  wr %g0, 0x51, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x52_th3:
  wr %g0, 0x52, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x53_th3:
  wr %g0, 0x53, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x56_th3:
  wr %g0, 0x56, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x57_th3:
  wr %g0, 0x57, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x58_th3:
  wr %g0, 0x58, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x59_th3:
  wr %g0, 0x59, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5a_th3:
  wr %g0, 0x5a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5b_th3:
  wr %g0, 0x5b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5e_th3:
  wr %g0, 0x5e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5f_th3:
  wr %g0, 0x5f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x60_th3:
  wr %g0, 0x60, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x61_th3:
  wr %g0, 0x61, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x62_th3:
  wr %g0, 0x62, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x63_th3:
  wr %g0, 0x63, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x64_th3:
  wr %g0, 0x64, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x65_th3:
  wr %g0, 0x65, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x68_th3:
  wr %g0, 0x68, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x69_th3:
  wr %g0, 0x69, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6a_th3:
  wr %g0, 0x6a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6b_th3:
  wr %g0, 0x6b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6c_th3:
  wr %g0, 0x6c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6d_th3:
  wr %g0, 0x6d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6e_th3:
  wr %g0, 0x6e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6f_th3:
  wr %g0, 0x6f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x70_th3:
  wr %g0, 0x70, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x71_th3:
  wr %g0, 0x71, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x72_th3:
  wr %g0, 0x72, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x74_th3:
  wr %g0, 0x74, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x75_th3:
  wr %g0, 0x75, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x76_th3:
  wr %g0, 0x76, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x77_th3:
  wr %g0, 0x77, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x78_th3:
  wr %g0, 0x78, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x79_th3:
  wr %g0, 0x79, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7a_th3:
  wr %g0, 0x7a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7b_th3:
  wr %g0, 0x7b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7c_th3:
  wr %g0, 0x7c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7d_th3:
  wr %g0, 0x7d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7e_th3:
  wr %g0, 0x7e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7f_th3:
  wr %g0, 0x7f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x84_th3:
  wr %g0, 0x84, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x85_th3:
  wr %g0, 0x85, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x86_th3:
  wr %g0, 0x86, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x87_th3:
  wr %g0, 0x87, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8c_th3:
  wr %g0, 0x8c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8d_th3:
  wr %g0, 0x8d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8e_th3:
  wr %g0, 0x8e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8f_th3:
  wr %g0, 0x8f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x90_th3:
  wr %g0, 0x90, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x91_th3:
  wr %g0, 0x91, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x92_th3:
  wr %g0, 0x92, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x93_th3:
  wr %g0, 0x93, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x94_th3:
  wr %g0, 0x94, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x95_th3:
  wr %g0, 0x95, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x96_th3:
  wr %g0, 0x96, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x97_th3:
  wr %g0, 0x97, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x98_th3:
  wr %g0, 0x98, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x99_th3:
  wr %g0, 0x99, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9a_th3:
  wr %g0, 0x9a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9b_th3:
  wr %g0, 0x9b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9c_th3:
  wr %g0, 0x9c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9d_th3:
  wr %g0, 0x9d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9e_th3:
  wr %g0, 0x9e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9f_th3:
  wr %g0, 0x9f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa0_th3:
  wr %g0, 0xa0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa1_th3:
  wr %g0, 0xa1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa2_th3:
  wr %g0, 0xa2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa3_th3:
  wr %g0, 0xa3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa4_th3:
  wr %g0, 0xa4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa5_th3:
  wr %g0, 0xa5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa6_th3:
  wr %g0, 0xa6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa7_th3:
  wr %g0, 0xa7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa8_th3:
  wr %g0, 0xa8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa9_th3:
  wr %g0, 0xa9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaa_th3:
  wr %g0, 0xaa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xab_th3:
  wr %g0, 0xab, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xac_th3:
  wr %g0, 0xac, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xad_th3:
  wr %g0, 0xad, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xae_th3:
  wr %g0, 0xae, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaf_th3:
  wr %g0, 0xaf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb0_th3:
  wr %g0, 0xb0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb1_th3:
  wr %g0, 0xb1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb2_th3:
  wr %g0, 0xb2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb3_th3:
  wr %g0, 0xb3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb4_th3:
  wr %g0, 0xb4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb5_th3:
  wr %g0, 0xb5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb6_th3:
  wr %g0, 0xb6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb7_th3:
  wr %g0, 0xb7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb8_th3:
  wr %g0, 0xb8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb9_th3:
  wr %g0, 0xb9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xba_th3:
  wr %g0, 0xba, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbb_th3:
  wr %g0, 0xbb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbc_th3:
  wr %g0, 0xbc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbd_th3:
  wr %g0, 0xbd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbe_th3:
  wr %g0, 0xbe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbf_th3:
  wr %g0, 0xbf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc6_th3:
  wr %g0, 0xc6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc7_th3:
  wr %g0, 0xc7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xce_th3:
  wr %g0, 0xce, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xcf_th3:
  wr %g0, 0xcf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd4_th3:
  wr %g0, 0xd4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd5_th3:
  wr %g0, 0xd5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd6_th3:
  wr %g0, 0xd6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd7_th3:
  wr %g0, 0xd7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdc_th3:
  wr %g0, 0xdc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdd_th3:
  wr %g0, 0xdd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xde_th3:
  wr %g0, 0xde, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdf_th3:
  wr %g0, 0xdf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe4_th3:
  wr %g0, 0xe4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe5_th3:
  wr %g0, 0xe5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe6_th3:
  wr %g0, 0xe6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe7_th3:
  wr %g0, 0xe7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe8_th3:
  wr %g0, 0xe8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe9_th3:
  wr %g0, 0xe9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xec_th3:
  wr %g0, 0xec, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xed_th3:
  wr %g0, 0xed, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xee_th3:
  wr %g0, 0xee, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xef_th3:
  wr %g0, 0xef, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf2_th3:
  wr %g0, 0xf2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf3_th3:
  wr %g0, 0xf3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf4_th3:
  wr %g0, 0xf4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf5_th3:
  wr %g0, 0xf5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf6_th3:
  wr %g0, 0xf6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf7_th3:
  wr %g0, 0xf7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfa_th3:
  wr %g0, 0xfa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfb_th3:
  wr %g0, 0xfb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfc_th3:
  wr %g0, 0xfc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfd_th3:
  wr %g0, 0xfd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfe_th3:
  wr %g0, 0xfe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xff_th3:
  wr %g0, 0xff, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x46_th3:
  wr %g0, 0x46, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x47_th3:
  wr %g0, 0x47, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x4_th3:
  mov %r27, %r1
        ldx [%r27 + 0x7 & ~0x7], %r2
        ldx [%r24 + 0x3b & ~0x7], %r4
        ldx [%r27 + 0x1b & ~0x7], %r6
        ldx [%r27 + 0xd7 & ~0x7], %r8
        ldx [%r22 + 0x56 & ~0x7], %r10
        ldx [%r23 + 0x6 & ~0x7], %r12
        ldx [%r28 + 0x92 & ~0x7], %r14
        ldx [%r28 + 0x3 & ~0x7], %r16
        ld [%r25 + 0xf3 & ~0x7], %f0
        ld [%r27 + 0x5b & ~0x7], %f16
        ld [%r26 + 0x87 & ~0x7], %f32
        ld [%r22 + 0x42 & ~0x7], %f48
               ldsba [%r1]4, %r8
               ldsha [%r1]4, %r16
               ldswa [%r1]4, %r8
               lduba [%r1]4, %r4
               lduha [%r1]4, %r10
               ldxa [%r1]4, %r6
               ldda [%r1]4, %r10
               ldstuba [%r1]4, %r4
               swapa [%r1]4, %r16
               lda [%r1]4, %f0
               ldda [%r1]4, %f48
               stba %r10, [%r1]4
               stha %r10, [%r1]4
               stwa %r6, [%r1]4
               sta %f48, [%r1]4
               stda %f48, [%r1]4
casa  [%r1]0x4, %r2, %g0
casxa  [%r1]0x4, %r2, %g0
               prefetcha [%r1]4, 0xc
CASE_ASI_0xc_th3:
  mov %r27, %r1
        ldx [%r25 + 0xd8 & ~0x7], %r2
        ldx [%r25 + 0x95 & ~0x7], %r4
        ldx [%r24 + 0x7d & ~0x7], %r6
        ldx [%r24 + 0x61 & ~0x7], %r8
        ldx [%r28 + 0xb4 & ~0x7], %r10
        ldx [%r21 + 0x3f & ~0x7], %r12
        ldx [%r27 + 0xf9 & ~0x7], %r14
        ldx [%r22 + 0xf1 & ~0x7], %r16
        ld [%r22 + 0x2 & ~0x7], %f0
        ld [%r23 + 0x86 & ~0x7], %f16
        ld [%r28 + 0xc5 & ~0x7], %f32
        ld [%r22 + 0x73 & ~0x7], %f48
               ldsba [%r1]12, %r14
               ldsha [%r1]12, %r10
               ldswa [%r1]12, %r4
               lduba [%r1]12, %r2
               lduha [%r1]12, %r14
               ldxa [%r1]12, %r4
               ldda [%r1]12, %r4
               ldstuba [%r1]12, %r10
               swapa [%r1]12, %r14
               lda [%r1]12, %f16
               ldda [%r1]12, %f16
               stba %r0, [%r1]12
               stha %r14, [%r1]12
               stwa %r14, [%r1]12
               sta %f32, [%r1]12
               stda %f32, [%r1]12
casa  [%r1]0xc, %r2, %g0
casxa  [%r1]0xc, %r2, %g0
               prefetcha [%r1]12, 0x18
CASE_ASI_0x10_th3:
  mov %r24, %r1
        ldx [%r28 + 0xd6 & ~0x7], %r2
        ldx [%r26 + 0x34 & ~0x7], %r4
        ldx [%r22 + 0x33 & ~0x7], %r6
        ldx [%r25 + 0xb5 & ~0x7], %r8
        ldx [%r23 + 0x62 & ~0x7], %r10
        ldx [%r24 + 0x7f & ~0x7], %r12
        ldx [%r25 + 0x49 & ~0x7], %r14
        ldx [%r28 + 0x17 & ~0x7], %r16
        ld [%r27 + 0x4 & ~0x7], %f0
        ld [%r21 + 0xa0 & ~0x7], %f16
        ld [%r22 + 0x4b & ~0x7], %f32
        ld [%r21 + 0xc2 & ~0x7], %f48
               ldsba [%r1]16, %r10
               ldsha [%r1]16, %r12
               ldswa [%r1]16, %r2
               lduba [%r1]16, %r16
               lduha [%r1]16, %r8
               ldxa [%r1]16, %r16
               ldda [%r1]16, %r8
               ldstuba [%r1]16, %r2
               swapa [%r1]16, %r14
               lda [%r1]16, %f32
               ldda [%r1]16, %f0
               stba %r2, [%r1]16
               stha %r2, [%r1]16
               stwa %r8, [%r1]16
               sta %f16, [%r1]16
               stda %f48, [%r1]16
casa  [%r1]0x10, %r2, %g0
casxa  [%r1]0x10, %r2, %g0
               prefetcha [%r1]16, 0x17
CASE_ASI_0x11_th3:
  mov %r27, %r1
        ldx [%r23 + 0x2d & ~0x7], %r2
        ldx [%r28 + 0x7f & ~0x7], %r4
        ldx [%r21 + 0x65 & ~0x7], %r6
        ldx [%r22 + 0x7d & ~0x7], %r8
        ldx [%r25 + 0x1 & ~0x7], %r10
        ldx [%r28 + 0x67 & ~0x7], %r12
        ldx [%r22 + 0xb1 & ~0x7], %r14
        ldx [%r24 + 0x34 & ~0x7], %r16
        ld [%r25 + 0xf8 & ~0x7], %f0
        ld [%r21 + 0x80 & ~0x7], %f16
        ld [%r21 + 0xcd & ~0x7], %f32
        ld [%r25 + 0xd7 & ~0x7], %f48
               ldsba [%r1]17, %r4
               ldsha [%r1]17, %r16
               ldswa [%r1]17, %r6
               lduba [%r1]17, %r6
               lduha [%r1]17, %r12
               ldxa [%r1]17, %r16
               ldda [%r1]17, %r2
               ldstuba [%r1]17, %r8
               swapa [%r1]17, %r12
               lda [%r1]17, %f32
               ldda [%r1]17, %f16
               stba %r2, [%r1]17
               stha %r2, [%r1]17
               stwa %r8, [%r1]17
               sta %f0, [%r1]17
               stda %f32, [%r1]17
casa  [%r1]0x11, %r2, %g0
casxa  [%r1]0x11, %r2, %g0
               prefetcha [%r1]17, 0x6
CASE_ASI_0x18_th3:
  mov %r27, %r1
        ldx [%r21 + 0xf8 & ~0x7], %r2
        ldx [%r24 + 0x8f & ~0x7], %r4
        ldx [%r23 + 0x2a & ~0x7], %r6
        ldx [%r21 + 0xb1 & ~0x7], %r8
        ldx [%r25 + 0xac & ~0x7], %r10
        ldx [%r26 + 0x96 & ~0x7], %r12
        ldx [%r26 + 0xcb & ~0x7], %r14
        ldx [%r27 + 0x63 & ~0x7], %r16
        ld [%r28 + 0x91 & ~0x7], %f0
        ld [%r27 + 0x6e & ~0x7], %f16
        ld [%r22 + 0xb & ~0x7], %f32
        ld [%r25 + 0xf6 & ~0x7], %f48
               ldsba [%r1]24, %r4
               ldsha [%r1]24, %r10
               ldswa [%r1]24, %r4
               lduba [%r1]24, %r8
               lduha [%r1]24, %r8
               ldxa [%r1]24, %r6
               ldda [%r1]24, %r16
               ldstuba [%r1]24, %r10
               swapa [%r1]24, %r14
               lda [%r1]24, %f16
               ldda [%r1]24, %f0
               stba %r8, [%r1]24
               stha %r10, [%r1]24
               stwa %r14, [%r1]24
               sta %f16, [%r1]24
               stda %f32, [%r1]24
casa  [%r1]0x18, %r2, %g0
casxa  [%r1]0x18, %r2, %g0
               prefetcha [%r1]24, 0x1a
CASE_ASI_0x19_th3:
  mov %r26, %r1
        ldx [%r22 + 0x9b & ~0x7], %r2
        ldx [%r21 + 0x96 & ~0x7], %r4
        ldx [%r21 + 0xe0 & ~0x7], %r6
        ldx [%r22 + 0x5a & ~0x7], %r8
        ldx [%r21 + 0xb9 & ~0x7], %r10
        ldx [%r28 + 0x7b & ~0x7], %r12
        ldx [%r22 + 0x2f & ~0x7], %r14
        ldx [%r27 + 0x92 & ~0x7], %r16
        ld [%r27 + 0xc3 & ~0x7], %f0
        ld [%r24 + 0xe & ~0x7], %f16
        ld [%r23 + 0x22 & ~0x7], %f32
        ld [%r22 + 0xf5 & ~0x7], %f48
               ldsba [%r1]25, %r14
               ldsha [%r1]25, %r16
               ldswa [%r1]25, %r16
               lduba [%r1]25, %r4
               lduha [%r1]25, %r4
               ldxa [%r1]25, %r12
               ldda [%r1]25, %r16
               ldstuba [%r1]25, %r6
               swapa [%r1]25, %r12
               lda [%r1]25, %f48
               ldda [%r1]25, %f48
               stba %r10, [%r1]25
               stha %r14, [%r1]25
               stwa %r2, [%r1]25
               sta %f48, [%r1]25
               stda %f16, [%r1]25
casa  [%r1]0x19, %r2, %g0
casxa  [%r1]0x19, %r2, %g0
               prefetcha [%r1]25, 0x1f
CASE_ASI_0x80_th3:
  mov %r28, %r1
        ldx [%r26 + 0xa5 & ~0x7], %r2
        ldx [%r28 + 0xbd & ~0x7], %r4
        ldx [%r28 + 0x40 & ~0x7], %r6
        ldx [%r27 + 0xfd & ~0x7], %r8
        ldx [%r25 + 0x1f & ~0x7], %r10
        ldx [%r26 + 0x91 & ~0x7], %r12
        ldx [%r23 + 0xa5 & ~0x7], %r14
        ldx [%r27 + 0xc4 & ~0x7], %r16
        ld [%r27 + 0xb7 & ~0x7], %f0
        ld [%r27 + 0x54 & ~0x7], %f16
        ld [%r26 + 0x75 & ~0x7], %f32
        ld [%r28 + 0x71 & ~0x7], %f48
               ldsba [%r1]128, %r2
               ldsha [%r1]128, %r12
               ldswa [%r1]128, %r4
               lduba [%r1]128, %r10
               lduha [%r1]128, %r12
               ldxa [%r1]128, %r4
               ldda [%r1]128, %r14
               ldstuba [%r1]128, %r4
               swapa [%r1]128, %r12
               lda [%r1]128, %f32
               ldda [%r1]128, %f48
               stba %r6, [%r1]128
               stha %r12, [%r1]128
               stwa %r2, [%r1]128
               sta %f32, [%r1]128
               stda %f32, [%r1]128
casa  [%r1]0x80, %r2, %g0
casxa  [%r1]0x80, %r2, %g0
               prefetcha [%r1]128, 0xa
CASE_ASI_0x81_th3:
  mov %r26, %r1
        ldx [%r26 + 0x84 & ~0x7], %r2
        ldx [%r24 + 0x1c & ~0x7], %r4
        ldx [%r27 + 0x59 & ~0x7], %r6
        ldx [%r27 + 0x8c & ~0x7], %r8
        ldx [%r28 + 0xca & ~0x7], %r10
        ldx [%r27 + 0xdf & ~0x7], %r12
        ldx [%r26 + 0x5 & ~0x7], %r14
        ldx [%r28 + 0xfc & ~0x7], %r16
        ld [%r24 + 0xa5 & ~0x7], %f0
        ld [%r24 + 0xe2 & ~0x7], %f16
        ld [%r25 + 0x1 & ~0x7], %f32
        ld [%r23 + 0xee & ~0x7], %f48
               ldsba [%r1]129, %r4
               ldsha [%r1]129, %r6
               ldswa [%r1]129, %r14
               lduba [%r1]129, %r14
               lduha [%r1]129, %r16
               ldxa [%r1]129, %r16
               ldda [%r1]129, %r6
               ldstuba [%r1]129, %r12
               swapa [%r1]129, %r14
               lda [%r1]129, %f0
               ldda [%r1]129, %f32
               stba %r14, [%r1]129
               stha %r2, [%r1]129
               stwa %r6, [%r1]129
               sta %f48, [%r1]129
               stda %f16, [%r1]129
casa  [%r1]0x81, %r2, %g0
casxa  [%r1]0x81, %r2, %g0
               prefetcha [%r1]129, 0x8
CASE_ASI_0x82_th3:
  mov %r22, %r1
        ldx [%r26 + 0xeb & ~0x7], %r2
        ldx [%r27 + 0x5a & ~0x7], %r4
        ldx [%r28 + 0x34 & ~0x7], %r6
        ldx [%r21 + 0x43 & ~0x7], %r8
        ldx [%r25 + 0x2d & ~0x7], %r10
        ldx [%r21 + 0xe7 & ~0x7], %r12
        ldx [%r23 + 0xd2 & ~0x7], %r14
        ldx [%r21 + 0x49 & ~0x7], %r16
        ld [%r27 + 0x5f & ~0x7], %f0
        ld [%r28 + 0x85 & ~0x7], %f16
        ld [%r21 + 0xe1 & ~0x7], %f32
        ld [%r23 + 0x71 & ~0x7], %f48
               ldsba [%r1]130, %r8
               ldsha [%r1]130, %r14
               ldswa [%r1]130, %r2
               lduba [%r1]130, %r8
               lduha [%r1]130, %r8
               ldxa [%r1]130, %r10
               ldda [%r1]130, %r6
               ldstuba [%r1]130, %r10
               swapa [%r1]130, %r6
               lda [%r1]130, %f0
               ldda [%r1]130, %f0
               stba %r0, [%r1]130
               stha %r2, [%r1]130
               stwa %r2, [%r1]130
               sta %f48, [%r1]130
               stda %f0, [%r1]130
casa  [%r1]0x82, %r2, %g0
casxa  [%r1]0x82, %r2, %g0
               prefetcha [%r1]130, 0x3
CASE_ASI_0x83_th3:
  mov %r23, %r1
        ldx [%r25 + 0x22 & ~0x7], %r2
        ldx [%r22 + 0x24 & ~0x7], %r4
        ldx [%r22 + 0x58 & ~0x7], %r6
        ldx [%r27 + 0xba & ~0x7], %r8
        ldx [%r25 + 0xef & ~0x7], %r10
        ldx [%r24 + 0x40 & ~0x7], %r12
        ldx [%r21 + 0x92 & ~0x7], %r14
        ldx [%r21 + 0x41 & ~0x7], %r16
        ld [%r25 + 0x69 & ~0x7], %f0
        ld [%r26 + 0x52 & ~0x7], %f16
        ld [%r25 + 0xdf & ~0x7], %f32
        ld [%r25 + 0x15 & ~0x7], %f48
               ldsba [%r1]131, %r6
               ldsha [%r1]131, %r12
               ldswa [%r1]131, %r6
               lduba [%r1]131, %r4
               lduha [%r1]131, %r4
               ldxa [%r1]131, %r16
               ldda [%r1]131, %r8
               ldstuba [%r1]131, %r2
               swapa [%r1]131, %r8
               lda [%r1]131, %f32
               ldda [%r1]131, %f16
               stba %r4, [%r1]131
               stha %r8, [%r1]131
               stwa %r8, [%r1]131
               sta %f0, [%r1]131
               stda %f16, [%r1]131
casa  [%r1]0x83, %r2, %g0
casxa  [%r1]0x83, %r2, %g0
               prefetcha [%r1]131, 0x13
CASE_ASI_0x88_th3:
  mov %r27, %r1
        ldx [%r22 + 0x89 & ~0x7], %r2
        ldx [%r22 + 0x71 & ~0x7], %r4
        ldx [%r21 + 0x51 & ~0x7], %r6
        ldx [%r22 + 0x5e & ~0x7], %r8
        ldx [%r25 + 0x47 & ~0x7], %r10
        ldx [%r22 + 0x46 & ~0x7], %r12
        ldx [%r24 + 0x1d & ~0x7], %r14
        ldx [%r21 + 0x41 & ~0x7], %r16
        ld [%r21 + 0xc & ~0x7], %f0
        ld [%r28 + 0xc5 & ~0x7], %f16
        ld [%r25 + 0x72 & ~0x7], %f32
        ld [%r24 + 0x88 & ~0x7], %f48
               ldsba [%r1]136, %r10
               ldsha [%r1]136, %r16
               ldswa [%r1]136, %r14
               lduba [%r1]136, %r6
               lduha [%r1]136, %r10
               ldxa [%r1]136, %r6
               ldda [%r1]136, %r4
               ldstuba [%r1]136, %r14
               swapa [%r1]136, %r6
               lda [%r1]136, %f48
               ldda [%r1]136, %f0
               stba %r4, [%r1]136
               stha %r2, [%r1]136
               stwa %r10, [%r1]136
               sta %f48, [%r1]136
               stda %f32, [%r1]136
casa  [%r1]0x88, %r2, %g0
casxa  [%r1]0x88, %r2, %g0
               prefetcha [%r1]136, 0x13
CASE_ASI_0x89_th3:
  mov %r27, %r1
        ldx [%r21 + 0xe4 & ~0x7], %r2
        ldx [%r22 + 0xcc & ~0x7], %r4
        ldx [%r24 + 0x94 & ~0x7], %r6
        ldx [%r28 + 0x3 & ~0x7], %r8
        ldx [%r22 + 0x37 & ~0x7], %r10
        ldx [%r21 + 0x10 & ~0x7], %r12
        ldx [%r26 + 0x70 & ~0x7], %r14
        ldx [%r26 + 0xb6 & ~0x7], %r16
        ld [%r22 + 0x13 & ~0x7], %f0
        ld [%r21 + 0xc2 & ~0x7], %f16
        ld [%r25 + 0x4a & ~0x7], %f32
        ld [%r27 + 0x4e & ~0x7], %f48
               ldsba [%r1]137, %r12
               ldsha [%r1]137, %r14
               ldswa [%r1]137, %r6
               lduba [%r1]137, %r10
               lduha [%r1]137, %r6
               ldxa [%r1]137, %r10
               ldda [%r1]137, %r12
               ldstuba [%r1]137, %r2
               swapa [%r1]137, %r2
               lda [%r1]137, %f32
               ldda [%r1]137, %f16
               stba %r4, [%r1]137
               stha %r4, [%r1]137
               stwa %r12, [%r1]137
               sta %f48, [%r1]137
               stda %f32, [%r1]137
casa  [%r1]0x89, %r2, %g0
casxa  [%r1]0x89, %r2, %g0
               prefetcha [%r1]137, 0x2
CASE_ASI_0x8a_th3:
  mov %r21, %r1
        ldx [%r21 + 0x1 & ~0x7], %r2
        ldx [%r28 + 0x51 & ~0x7], %r4
        ldx [%r21 + 0x13 & ~0x7], %r6
        ldx [%r23 + 0xe0 & ~0x7], %r8
        ldx [%r22 + 0x9e & ~0x7], %r10
        ldx [%r22 + 0x19 & ~0x7], %r12
        ldx [%r25 + 0x9b & ~0x7], %r14
        ldx [%r22 + 0x74 & ~0x7], %r16
        ld [%r21 + 0xde & ~0x7], %f0
        ld [%r22 + 0x76 & ~0x7], %f16
        ld [%r27 + 0x95 & ~0x7], %f32
        ld [%r24 + 0x67 & ~0x7], %f48
               ldsba [%r1]138, %r10
               ldsha [%r1]138, %r2
               ldswa [%r1]138, %r2
               lduba [%r1]138, %r14
               lduha [%r1]138, %r2
               ldxa [%r1]138, %r2
               ldda [%r1]138, %r8
               ldstuba [%r1]138, %r8
               swapa [%r1]138, %r12
               lda [%r1]138, %f0
               ldda [%r1]138, %f0
               stba %r2, [%r1]138
               stha %r6, [%r1]138
               stwa %r0, [%r1]138
               sta %f32, [%r1]138
               stda %f48, [%r1]138
casa  [%r1]0x8a, %r2, %g0
casxa  [%r1]0x8a, %r2, %g0
               prefetcha [%r1]138, 0x1e
CASE_ASI_0x8b_th3:
  mov %r28, %r1
        ldx [%r26 + 0x5d & ~0x7], %r2
        ldx [%r26 + 0xae & ~0x7], %r4
        ldx [%r27 + 0xa6 & ~0x7], %r6
        ldx [%r28 + 0xfb & ~0x7], %r8
        ldx [%r21 + 0x6a & ~0x7], %r10
        ldx [%r26 + 0xc8 & ~0x7], %r12
        ldx [%r27 + 0x45 & ~0x7], %r14
        ldx [%r27 + 0x24 & ~0x7], %r16
        ld [%r28 + 0x74 & ~0x7], %f0
        ld [%r23 + 0x4 & ~0x7], %f16
        ld [%r28 + 0x95 & ~0x7], %f32
        ld [%r24 + 0x81 & ~0x7], %f48
               ldsba [%r1]139, %r4
               ldsha [%r1]139, %r6
               ldswa [%r1]139, %r4
               lduba [%r1]139, %r6
               lduha [%r1]139, %r6
               ldxa [%r1]139, %r16
               ldda [%r1]139, %r4
               ldstuba [%r1]139, %r6
               swapa [%r1]139, %r16
               lda [%r1]139, %f0
               ldda [%r1]139, %f16
               stba %r4, [%r1]139
               stha %r8, [%r1]139
               stwa %r6, [%r1]139
               sta %f32, [%r1]139
               stda %f32, [%r1]139
casa  [%r1]0x8b, %r2, %g0
casxa  [%r1]0x8b, %r2, %g0
               prefetcha [%r1]139, 0x19
        nop
        nop
        nop
subcc	%r19, 1, %r19
cmp %r19, 2
bz,a TH3_LOOP
ta T_CHANGE_NONHPRIV
cmp %r19, 1
bz,a TH3_LOOP
ta T_CHANGE_PRIV
        nop
	ba main_text_end
	nop
        nop
        nop
        nop
        nop
       LOOP_T4:
ta T_CHANGE_PRIV
 add %g0, 0x3, %r19
TH4_LOOP:
CASE_ASI_0x0_th4:
  wr %g0, 0x0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1_th4:
  wr %g0, 0x1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2_th4:
  wr %g0, 0x2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3_th4:
  wr %g0, 0x3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5_th4:
  wr %g0, 0x5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6_th4:
  wr %g0, 0x6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7_th4:
  wr %g0, 0x7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8_th4:
  wr %g0, 0x8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9_th4:
  wr %g0, 0x9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa_th4:
  wr %g0, 0xa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb_th4:
  wr %g0, 0xb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd_th4:
  wr %g0, 0xd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe_th4:
  wr %g0, 0xe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf_th4:
  wr %g0, 0xf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x12_th4:
  wr %g0, 0x12, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x13_th4:
  wr %g0, 0x13, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1a_th4:
  wr %g0, 0x1a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1b_th4:
  wr %g0, 0x1b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x20_th4:
  wr %g0, 0x20, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x21_th4:
  wr %g0, 0x21, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x25_th4:
  wr %g0, 0x25, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x28_th4:
  wr %g0, 0x28, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x29_th4:
  wr %g0, 0x29, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2d_th4:
  wr %g0, 0x2d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x32_th4:
  wr %g0, 0x32, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x33_th4:
  wr %g0, 0x33, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x34_th4:
  wr %g0, 0x34, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x35_th4:
  wr %g0, 0x35, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x37_th4:
  wr %g0, 0x37, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3a_th4:
  wr %g0, 0x3a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3b_th4:
  wr %g0, 0x3b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3c_th4:
  wr %g0, 0x3c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3d_th4:
  wr %g0, 0x3d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3f_th4:
  wr %g0, 0x3f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x40_th4:
  wr %g0, 0x40, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x41_th4:
  wr %g0, 0x41, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x42_th4:
  wr %g0, 0x42, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x43_th4:
  wr %g0, 0x43, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x44_th4:
  wr %g0, 0x44, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x45_th4:
  wr %g0, 0x45, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x48_th4:
  wr %g0, 0x48, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x49_th4:
  wr %g0, 0x49, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4a_th4:
  wr %g0, 0x4a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4b_th4:
  wr %g0, 0x4b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4c_th4:
  wr %g0, 0x4c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4d_th4:
  wr %g0, 0x4d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4e_th4:
  wr %g0, 0x4e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4f_th4:
  wr %g0, 0x4f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x50_th4:
  wr %g0, 0x50, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x51_th4:
  wr %g0, 0x51, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x52_th4:
  wr %g0, 0x52, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x53_th4:
  wr %g0, 0x53, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x56_th4:
  wr %g0, 0x56, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x57_th4:
  wr %g0, 0x57, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x58_th4:
  wr %g0, 0x58, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x59_th4:
  wr %g0, 0x59, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5a_th4:
  wr %g0, 0x5a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5b_th4:
  wr %g0, 0x5b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5e_th4:
  wr %g0, 0x5e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5f_th4:
  wr %g0, 0x5f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x60_th4:
  wr %g0, 0x60, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x61_th4:
  wr %g0, 0x61, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x62_th4:
  wr %g0, 0x62, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x63_th4:
  wr %g0, 0x63, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x64_th4:
  wr %g0, 0x64, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x65_th4:
  wr %g0, 0x65, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x68_th4:
  wr %g0, 0x68, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x69_th4:
  wr %g0, 0x69, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6a_th4:
  wr %g0, 0x6a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6b_th4:
  wr %g0, 0x6b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6c_th4:
  wr %g0, 0x6c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6d_th4:
  wr %g0, 0x6d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6e_th4:
  wr %g0, 0x6e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6f_th4:
  wr %g0, 0x6f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x70_th4:
  wr %g0, 0x70, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x71_th4:
  wr %g0, 0x71, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x72_th4:
  wr %g0, 0x72, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x74_th4:
  wr %g0, 0x74, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x75_th4:
  wr %g0, 0x75, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x76_th4:
  wr %g0, 0x76, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x77_th4:
  wr %g0, 0x77, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x78_th4:
  wr %g0, 0x78, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x79_th4:
  wr %g0, 0x79, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7a_th4:
  wr %g0, 0x7a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7b_th4:
  wr %g0, 0x7b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7c_th4:
  wr %g0, 0x7c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7d_th4:
  wr %g0, 0x7d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7e_th4:
  wr %g0, 0x7e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7f_th4:
  wr %g0, 0x7f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x84_th4:
  wr %g0, 0x84, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x85_th4:
  wr %g0, 0x85, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x86_th4:
  wr %g0, 0x86, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x87_th4:
  wr %g0, 0x87, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8c_th4:
  wr %g0, 0x8c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8d_th4:
  wr %g0, 0x8d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8e_th4:
  wr %g0, 0x8e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8f_th4:
  wr %g0, 0x8f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x90_th4:
  wr %g0, 0x90, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x91_th4:
  wr %g0, 0x91, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x92_th4:
  wr %g0, 0x92, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x93_th4:
  wr %g0, 0x93, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x94_th4:
  wr %g0, 0x94, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x95_th4:
  wr %g0, 0x95, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x96_th4:
  wr %g0, 0x96, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x97_th4:
  wr %g0, 0x97, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x98_th4:
  wr %g0, 0x98, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x99_th4:
  wr %g0, 0x99, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9a_th4:
  wr %g0, 0x9a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9b_th4:
  wr %g0, 0x9b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9c_th4:
  wr %g0, 0x9c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9d_th4:
  wr %g0, 0x9d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9e_th4:
  wr %g0, 0x9e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9f_th4:
  wr %g0, 0x9f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa0_th4:
  wr %g0, 0xa0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa1_th4:
  wr %g0, 0xa1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa2_th4:
  wr %g0, 0xa2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa3_th4:
  wr %g0, 0xa3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa4_th4:
  wr %g0, 0xa4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa5_th4:
  wr %g0, 0xa5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa6_th4:
  wr %g0, 0xa6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa7_th4:
  wr %g0, 0xa7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa8_th4:
  wr %g0, 0xa8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa9_th4:
  wr %g0, 0xa9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaa_th4:
  wr %g0, 0xaa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xab_th4:
  wr %g0, 0xab, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xac_th4:
  wr %g0, 0xac, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xad_th4:
  wr %g0, 0xad, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xae_th4:
  wr %g0, 0xae, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaf_th4:
  wr %g0, 0xaf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb0_th4:
  wr %g0, 0xb0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb1_th4:
  wr %g0, 0xb1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb2_th4:
  wr %g0, 0xb2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb3_th4:
  wr %g0, 0xb3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb4_th4:
  wr %g0, 0xb4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb5_th4:
  wr %g0, 0xb5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb6_th4:
  wr %g0, 0xb6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb7_th4:
  wr %g0, 0xb7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb8_th4:
  wr %g0, 0xb8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb9_th4:
  wr %g0, 0xb9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xba_th4:
  wr %g0, 0xba, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbb_th4:
  wr %g0, 0xbb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbc_th4:
  wr %g0, 0xbc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbd_th4:
  wr %g0, 0xbd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbe_th4:
  wr %g0, 0xbe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbf_th4:
  wr %g0, 0xbf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc6_th4:
  wr %g0, 0xc6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc7_th4:
  wr %g0, 0xc7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xce_th4:
  wr %g0, 0xce, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xcf_th4:
  wr %g0, 0xcf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd4_th4:
  wr %g0, 0xd4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd5_th4:
  wr %g0, 0xd5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd6_th4:
  wr %g0, 0xd6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd7_th4:
  wr %g0, 0xd7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdc_th4:
  wr %g0, 0xdc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdd_th4:
  wr %g0, 0xdd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xde_th4:
  wr %g0, 0xde, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdf_th4:
  wr %g0, 0xdf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe4_th4:
  wr %g0, 0xe4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe5_th4:
  wr %g0, 0xe5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe6_th4:
  wr %g0, 0xe6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe7_th4:
  wr %g0, 0xe7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe8_th4:
  wr %g0, 0xe8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe9_th4:
  wr %g0, 0xe9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xec_th4:
  wr %g0, 0xec, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xed_th4:
  wr %g0, 0xed, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xee_th4:
  wr %g0, 0xee, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xef_th4:
  wr %g0, 0xef, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf2_th4:
  wr %g0, 0xf2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf3_th4:
  wr %g0, 0xf3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf4_th4:
  wr %g0, 0xf4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf5_th4:
  wr %g0, 0xf5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf6_th4:
  wr %g0, 0xf6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf7_th4:
  wr %g0, 0xf7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfa_th4:
  wr %g0, 0xfa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfb_th4:
  wr %g0, 0xfb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfc_th4:
  wr %g0, 0xfc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfd_th4:
  wr %g0, 0xfd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfe_th4:
  wr %g0, 0xfe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xff_th4:
  wr %g0, 0xff, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x46_th4:
  wr %g0, 0x46, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x47_th4:
  wr %g0, 0x47, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x4_th4:
  mov %r26, %r1
        ldx [%r26 + 0x1a & ~0x7], %r2
        ldx [%r22 + 0x4c & ~0x7], %r4
        ldx [%r21 + 0xce & ~0x7], %r6
        ldx [%r23 + 0x62 & ~0x7], %r8
        ldx [%r22 + 0xec & ~0x7], %r10
        ldx [%r23 + 0x38 & ~0x7], %r12
        ldx [%r26 + 0x82 & ~0x7], %r14
        ldx [%r22 + 0x80 & ~0x7], %r16
        ld [%r23 + 0x7 & ~0x7], %f0
        ld [%r25 + 0x32 & ~0x7], %f16
        ld [%r26 + 0x7 & ~0x7], %f32
        ld [%r24 + 0x21 & ~0x7], %f48
               ldsba [%r1]4, %r16
               ldsha [%r1]4, %r10
               ldswa [%r1]4, %r6
               lduba [%r1]4, %r16
               lduha [%r1]4, %r6
               ldxa [%r1]4, %r10
               ldda [%r1]4, %r14
               ldstuba [%r1]4, %r2
               swapa [%r1]4, %r16
               lda [%r1]4, %f0
               ldda [%r1]4, %f16
               stba %r4, [%r1]4
               stha %r0, [%r1]4
               stwa %r2, [%r1]4
               sta %f16, [%r1]4
               stda %f0, [%r1]4
casa  [%r1]0x4, %r2, %g0
casxa  [%r1]0x4, %r2, %g0
               prefetcha [%r1]4, 0x9
CASE_ASI_0xc_th4:
  mov %r28, %r1
        ldx [%r27 + 0xe0 & ~0x7], %r2
        ldx [%r22 + 0x27 & ~0x7], %r4
        ldx [%r23 + 0x16 & ~0x7], %r6
        ldx [%r27 + 0xcc & ~0x7], %r8
        ldx [%r28 + 0xb6 & ~0x7], %r10
        ldx [%r28 + 0x84 & ~0x7], %r12
        ldx [%r23 + 0x37 & ~0x7], %r14
        ldx [%r21 + 0x94 & ~0x7], %r16
        ld [%r22 + 0x74 & ~0x7], %f0
        ld [%r28 + 0x3c & ~0x7], %f16
        ld [%r28 + 0x55 & ~0x7], %f32
        ld [%r28 + 0x94 & ~0x7], %f48
               ldsba [%r1]12, %r10
               ldsha [%r1]12, %r4
               ldswa [%r1]12, %r10
               lduba [%r1]12, %r6
               lduha [%r1]12, %r14
               ldxa [%r1]12, %r10
               ldda [%r1]12, %r6
               ldstuba [%r1]12, %r10
               swapa [%r1]12, %r4
               lda [%r1]12, %f48
               ldda [%r1]12, %f16
               stba %r0, [%r1]12
               stha %r10, [%r1]12
               stwa %r2, [%r1]12
               sta %f48, [%r1]12
               stda %f48, [%r1]12
casa  [%r1]0xc, %r2, %g0
casxa  [%r1]0xc, %r2, %g0
               prefetcha [%r1]12, 0x1b
CASE_ASI_0x10_th4:
  mov %r26, %r1
        ldx [%r28 + 0x61 & ~0x7], %r2
        ldx [%r21 + 0x95 & ~0x7], %r4
        ldx [%r21 + 0xb1 & ~0x7], %r6
        ldx [%r25 + 0x5e & ~0x7], %r8
        ldx [%r21 + 0x80 & ~0x7], %r10
        ldx [%r27 + 0xd8 & ~0x7], %r12
        ldx [%r23 + 0x87 & ~0x7], %r14
        ldx [%r26 + 0xeb & ~0x7], %r16
        ld [%r28 + 0xfb & ~0x7], %f0
        ld [%r22 + 0x9c & ~0x7], %f16
        ld [%r24 + 0xe2 & ~0x7], %f32
        ld [%r24 + 0x1e & ~0x7], %f48
               ldsba [%r1]16, %r8
               ldsha [%r1]16, %r12
               ldswa [%r1]16, %r4
               lduba [%r1]16, %r2
               lduha [%r1]16, %r6
               ldxa [%r1]16, %r4
               ldda [%r1]16, %r4
               ldstuba [%r1]16, %r10
               swapa [%r1]16, %r2
               lda [%r1]16, %f48
               ldda [%r1]16, %f48
               stba %r8, [%r1]16
               stha %r6, [%r1]16
               stwa %r0, [%r1]16
               sta %f48, [%r1]16
               stda %f16, [%r1]16
casa  [%r1]0x10, %r2, %g0
casxa  [%r1]0x10, %r2, %g0
               prefetcha [%r1]16, 0x18
CASE_ASI_0x11_th4:
  mov %r28, %r1
        ldx [%r28 + 0x87 & ~0x7], %r2
        ldx [%r27 + 0x47 & ~0x7], %r4
        ldx [%r23 + 0x6f & ~0x7], %r6
        ldx [%r23 + 0xd1 & ~0x7], %r8
        ldx [%r21 + 0xec & ~0x7], %r10
        ldx [%r23 + 0x9a & ~0x7], %r12
        ldx [%r23 + 0xd3 & ~0x7], %r14
        ldx [%r22 + 0xc3 & ~0x7], %r16
        ld [%r26 + 0x28 & ~0x7], %f0
        ld [%r24 + 0x61 & ~0x7], %f16
        ld [%r22 + 0x1e & ~0x7], %f32
        ld [%r25 + 0x63 & ~0x7], %f48
               ldsba [%r1]17, %r10
               ldsha [%r1]17, %r4
               ldswa [%r1]17, %r8
               lduba [%r1]17, %r4
               lduha [%r1]17, %r14
               ldxa [%r1]17, %r10
               ldda [%r1]17, %r8
               ldstuba [%r1]17, %r10
               swapa [%r1]17, %r10
               lda [%r1]17, %f0
               ldda [%r1]17, %f48
               stba %r6, [%r1]17
               stha %r2, [%r1]17
               stwa %r10, [%r1]17
               sta %f32, [%r1]17
               stda %f16, [%r1]17
casa  [%r1]0x11, %r2, %g0
casxa  [%r1]0x11, %r2, %g0
               prefetcha [%r1]17, 0xa
CASE_ASI_0x18_th4:
  mov %r27, %r1
        ldx [%r25 + 0x7a & ~0x7], %r2
        ldx [%r26 + 0x33 & ~0x7], %r4
        ldx [%r22 + 0x56 & ~0x7], %r6
        ldx [%r28 + 0x55 & ~0x7], %r8
        ldx [%r24 + 0x6f & ~0x7], %r10
        ldx [%r25 + 0x23 & ~0x7], %r12
        ldx [%r23 + 0x93 & ~0x7], %r14
        ldx [%r25 + 0xc9 & ~0x7], %r16
        ld [%r23 + 0x5d & ~0x7], %f0
        ld [%r25 + 0x6 & ~0x7], %f16
        ld [%r26 + 0xd7 & ~0x7], %f32
        ld [%r22 + 0xe8 & ~0x7], %f48
               ldsba [%r1]24, %r8
               ldsha [%r1]24, %r2
               ldswa [%r1]24, %r16
               lduba [%r1]24, %r4
               lduha [%r1]24, %r10
               ldxa [%r1]24, %r8
               ldda [%r1]24, %r8
               ldstuba [%r1]24, %r4
               swapa [%r1]24, %r8
               lda [%r1]24, %f16
               ldda [%r1]24, %f16
               stba %r0, [%r1]24
               stha %r8, [%r1]24
               stwa %r10, [%r1]24
               sta %f48, [%r1]24
               stda %f16, [%r1]24
casa  [%r1]0x18, %r2, %g0
casxa  [%r1]0x18, %r2, %g0
               prefetcha [%r1]24, 0x7
CASE_ASI_0x19_th4:
  mov %r24, %r1
        ldx [%r24 + 0x2c & ~0x7], %r2
        ldx [%r22 + 0xb2 & ~0x7], %r4
        ldx [%r25 + 0x70 & ~0x7], %r6
        ldx [%r26 + 0x34 & ~0x7], %r8
        ldx [%r27 + 0x60 & ~0x7], %r10
        ldx [%r21 + 0xf1 & ~0x7], %r12
        ldx [%r26 + 0x75 & ~0x7], %r14
        ldx [%r24 + 0x2f & ~0x7], %r16
        ld [%r27 + 0xc9 & ~0x7], %f0
        ld [%r27 + 0x96 & ~0x7], %f16
        ld [%r26 + 0x74 & ~0x7], %f32
        ld [%r21 + 0xc0 & ~0x7], %f48
               ldsba [%r1]25, %r12
               ldsha [%r1]25, %r2
               ldswa [%r1]25, %r12
               lduba [%r1]25, %r8
               lduha [%r1]25, %r14
               ldxa [%r1]25, %r16
               ldda [%r1]25, %r4
               ldstuba [%r1]25, %r2
               swapa [%r1]25, %r14
               lda [%r1]25, %f48
               ldda [%r1]25, %f48
               stba %r8, [%r1]25
               stha %r0, [%r1]25
               stwa %r12, [%r1]25
               sta %f48, [%r1]25
               stda %f16, [%r1]25
casa  [%r1]0x19, %r2, %g0
casxa  [%r1]0x19, %r2, %g0
               prefetcha [%r1]25, 0xe
CASE_ASI_0x80_th4:
  mov %r28, %r1
        ldx [%r28 + 0xc6 & ~0x7], %r2
        ldx [%r25 + 0x5d & ~0x7], %r4
        ldx [%r22 + 0xf4 & ~0x7], %r6
        ldx [%r22 + 0x6a & ~0x7], %r8
        ldx [%r23 + 0xd1 & ~0x7], %r10
        ldx [%r22 + 0x4d & ~0x7], %r12
        ldx [%r24 + 0x9d & ~0x7], %r14
        ldx [%r26 + 0xd & ~0x7], %r16
        ld [%r21 + 0x7e & ~0x7], %f0
        ld [%r22 + 0x43 & ~0x7], %f16
        ld [%r28 + 0x3e & ~0x7], %f32
        ld [%r25 + 0x7e & ~0x7], %f48
               ldsba [%r1]128, %r14
               ldsha [%r1]128, %r10
               ldswa [%r1]128, %r2
               lduba [%r1]128, %r6
               lduha [%r1]128, %r2
               ldxa [%r1]128, %r12
               ldda [%r1]128, %r10
               ldstuba [%r1]128, %r6
               swapa [%r1]128, %r8
               lda [%r1]128, %f32
               ldda [%r1]128, %f16
               stba %r12, [%r1]128
               stha %r2, [%r1]128
               stwa %r10, [%r1]128
               sta %f0, [%r1]128
               stda %f32, [%r1]128
casa  [%r1]0x80, %r2, %g0
casxa  [%r1]0x80, %r2, %g0
               prefetcha [%r1]128, 0x1d
CASE_ASI_0x81_th4:
  mov %r25, %r1
        ldx [%r23 + 0x3d & ~0x7], %r2
        ldx [%r24 + 0x55 & ~0x7], %r4
        ldx [%r24 + 0xff & ~0x7], %r6
        ldx [%r26 + 0x7 & ~0x7], %r8
        ldx [%r28 + 0x3a & ~0x7], %r10
        ldx [%r28 + 0x9 & ~0x7], %r12
        ldx [%r24 + 0xbf & ~0x7], %r14
        ldx [%r23 + 0x29 & ~0x7], %r16
        ld [%r25 + 0xfb & ~0x7], %f0
        ld [%r22 + 0x1c & ~0x7], %f16
        ld [%r21 + 0x39 & ~0x7], %f32
        ld [%r27 + 0x9a & ~0x7], %f48
               ldsba [%r1]129, %r8
               ldsha [%r1]129, %r8
               ldswa [%r1]129, %r8
               lduba [%r1]129, %r8
               lduha [%r1]129, %r14
               ldxa [%r1]129, %r12
               ldda [%r1]129, %r10
               ldstuba [%r1]129, %r6
               swapa [%r1]129, %r12
               lda [%r1]129, %f16
               ldda [%r1]129, %f0
               stba %r0, [%r1]129
               stha %r6, [%r1]129
               stwa %r6, [%r1]129
               sta %f16, [%r1]129
               stda %f16, [%r1]129
casa  [%r1]0x81, %r2, %g0
casxa  [%r1]0x81, %r2, %g0
               prefetcha [%r1]129, 0x11
CASE_ASI_0x82_th4:
  mov %r26, %r1
        ldx [%r28 + 0x7d & ~0x7], %r2
        ldx [%r27 + 0x8 & ~0x7], %r4
        ldx [%r26 + 0xa3 & ~0x7], %r6
        ldx [%r21 + 0x4c & ~0x7], %r8
        ldx [%r23 + 0x1b & ~0x7], %r10
        ldx [%r26 + 0x6d & ~0x7], %r12
        ldx [%r25 + 0xb3 & ~0x7], %r14
        ldx [%r27 + 0x6d & ~0x7], %r16
        ld [%r25 + 0xc6 & ~0x7], %f0
        ld [%r25 + 0x48 & ~0x7], %f16
        ld [%r24 + 0x7f & ~0x7], %f32
        ld [%r21 + 0x57 & ~0x7], %f48
               ldsba [%r1]130, %r4
               ldsha [%r1]130, %r2
               ldswa [%r1]130, %r14
               lduba [%r1]130, %r16
               lduha [%r1]130, %r2
               ldxa [%r1]130, %r6
               ldda [%r1]130, %r14
               ldstuba [%r1]130, %r2
               swapa [%r1]130, %r2
               lda [%r1]130, %f0
               ldda [%r1]130, %f32
               stba %r0, [%r1]130
               stha %r4, [%r1]130
               stwa %r10, [%r1]130
               sta %f48, [%r1]130
               stda %f32, [%r1]130
casa  [%r1]0x82, %r2, %g0
casxa  [%r1]0x82, %r2, %g0
               prefetcha [%r1]130, 0x1c
CASE_ASI_0x83_th4:
  mov %r21, %r1
        ldx [%r22 + 0x6b & ~0x7], %r2
        ldx [%r23 + 0x8 & ~0x7], %r4
        ldx [%r21 + 0xef & ~0x7], %r6
        ldx [%r26 + 0xa1 & ~0x7], %r8
        ldx [%r21 + 0xcc & ~0x7], %r10
        ldx [%r21 + 0x86 & ~0x7], %r12
        ldx [%r27 + 0x7f & ~0x7], %r14
        ldx [%r22 + 0x94 & ~0x7], %r16
        ld [%r26 + 0xc6 & ~0x7], %f0
        ld [%r24 + 0x72 & ~0x7], %f16
        ld [%r24 + 0x62 & ~0x7], %f32
        ld [%r26 + 0x27 & ~0x7], %f48
               ldsba [%r1]131, %r12
               ldsha [%r1]131, %r10
               ldswa [%r1]131, %r10
               lduba [%r1]131, %r10
               lduha [%r1]131, %r4
               ldxa [%r1]131, %r12
               ldda [%r1]131, %r16
               ldstuba [%r1]131, %r6
               swapa [%r1]131, %r12
               lda [%r1]131, %f32
               ldda [%r1]131, %f0
               stba %r12, [%r1]131
               stha %r4, [%r1]131
               stwa %r0, [%r1]131
               sta %f16, [%r1]131
               stda %f16, [%r1]131
casa  [%r1]0x83, %r2, %g0
casxa  [%r1]0x83, %r2, %g0
               prefetcha [%r1]131, 0x17
CASE_ASI_0x88_th4:
  mov %r23, %r1
        ldx [%r28 + 0xe0 & ~0x7], %r2
        ldx [%r28 + 0x50 & ~0x7], %r4
        ldx [%r21 + 0x79 & ~0x7], %r6
        ldx [%r22 + 0xf6 & ~0x7], %r8
        ldx [%r23 + 0x2f & ~0x7], %r10
        ldx [%r24 + 0x1e & ~0x7], %r12
        ldx [%r24 + 0xb7 & ~0x7], %r14
        ldx [%r23 + 0xd8 & ~0x7], %r16
        ld [%r25 + 0x85 & ~0x7], %f0
        ld [%r21 + 0x8f & ~0x7], %f16
        ld [%r25 + 0x19 & ~0x7], %f32
        ld [%r22 + 0x25 & ~0x7], %f48
               ldsba [%r1]136, %r16
               ldsha [%r1]136, %r8
               ldswa [%r1]136, %r2
               lduba [%r1]136, %r10
               lduha [%r1]136, %r6
               ldxa [%r1]136, %r8
               ldda [%r1]136, %r14
               ldstuba [%r1]136, %r12
               swapa [%r1]136, %r12
               lda [%r1]136, %f0
               ldda [%r1]136, %f16
               stba %r14, [%r1]136
               stha %r14, [%r1]136
               stwa %r6, [%r1]136
               sta %f16, [%r1]136
               stda %f32, [%r1]136
casa  [%r1]0x88, %r2, %g0
casxa  [%r1]0x88, %r2, %g0
               prefetcha [%r1]136, 0xd
CASE_ASI_0x89_th4:
  mov %r21, %r1
        ldx [%r21 + 0x3b & ~0x7], %r2
        ldx [%r25 + 0xf0 & ~0x7], %r4
        ldx [%r23 + 0xc1 & ~0x7], %r6
        ldx [%r23 + 0x85 & ~0x7], %r8
        ldx [%r24 + 0xd1 & ~0x7], %r10
        ldx [%r23 + 0xb3 & ~0x7], %r12
        ldx [%r21 + 0xa5 & ~0x7], %r14
        ldx [%r25 + 0x28 & ~0x7], %r16
        ld [%r24 + 0x30 & ~0x7], %f0
        ld [%r21 + 0xd5 & ~0x7], %f16
        ld [%r21 + 0xd & ~0x7], %f32
        ld [%r21 + 0x7f & ~0x7], %f48
               ldsba [%r1]137, %r4
               ldsha [%r1]137, %r4
               ldswa [%r1]137, %r8
               lduba [%r1]137, %r8
               lduha [%r1]137, %r2
               ldxa [%r1]137, %r16
               ldda [%r1]137, %r14
               ldstuba [%r1]137, %r10
               swapa [%r1]137, %r4
               lda [%r1]137, %f48
               ldda [%r1]137, %f16
               stba %r0, [%r1]137
               stha %r12, [%r1]137
               stwa %r2, [%r1]137
               sta %f48, [%r1]137
               stda %f32, [%r1]137
casa  [%r1]0x89, %r2, %g0
casxa  [%r1]0x89, %r2, %g0
               prefetcha [%r1]137, 0x17
CASE_ASI_0x8a_th4:
  mov %r21, %r1
        ldx [%r23 + 0xc2 & ~0x7], %r2
        ldx [%r25 + 0x93 & ~0x7], %r4
        ldx [%r28 + 0x56 & ~0x7], %r6
        ldx [%r22 + 0x29 & ~0x7], %r8
        ldx [%r21 + 0xe1 & ~0x7], %r10
        ldx [%r28 + 0xfa & ~0x7], %r12
        ldx [%r26 + 0x13 & ~0x7], %r14
        ldx [%r23 + 0x43 & ~0x7], %r16
        ld [%r24 + 0x59 & ~0x7], %f0
        ld [%r26 + 0x27 & ~0x7], %f16
        ld [%r25 + 0x18 & ~0x7], %f32
        ld [%r25 + 0xb0 & ~0x7], %f48
               ldsba [%r1]138, %r4
               ldsha [%r1]138, %r14
               ldswa [%r1]138, %r6
               lduba [%r1]138, %r14
               lduha [%r1]138, %r2
               ldxa [%r1]138, %r4
               ldda [%r1]138, %r6
               ldstuba [%r1]138, %r14
               swapa [%r1]138, %r8
               lda [%r1]138, %f0
               ldda [%r1]138, %f32
               stba %r8, [%r1]138
               stha %r4, [%r1]138
               stwa %r0, [%r1]138
               sta %f32, [%r1]138
               stda %f0, [%r1]138
casa  [%r1]0x8a, %r2, %g0
casxa  [%r1]0x8a, %r2, %g0
               prefetcha [%r1]138, 0x14
CASE_ASI_0x8b_th4:
  mov %r28, %r1
        ldx [%r22 + 0x3 & ~0x7], %r2
        ldx [%r24 + 0x94 & ~0x7], %r4
        ldx [%r25 + 0xc7 & ~0x7], %r6
        ldx [%r27 + 0xd8 & ~0x7], %r8
        ldx [%r23 + 0xeb & ~0x7], %r10
        ldx [%r22 + 0xe7 & ~0x7], %r12
        ldx [%r27 + 0x6f & ~0x7], %r14
        ldx [%r26 + 0xd5 & ~0x7], %r16
        ld [%r27 + 0xdd & ~0x7], %f0
        ld [%r22 + 0x69 & ~0x7], %f16
        ld [%r24 + 0xc1 & ~0x7], %f32
        ld [%r23 + 0xe1 & ~0x7], %f48
               ldsba [%r1]139, %r2
               ldsha [%r1]139, %r6
               ldswa [%r1]139, %r6
               lduba [%r1]139, %r4
               lduha [%r1]139, %r6
               ldxa [%r1]139, %r16
               ldda [%r1]139, %r12
               ldstuba [%r1]139, %r10
               swapa [%r1]139, %r12
               lda [%r1]139, %f0
               ldda [%r1]139, %f48
               stba %r10, [%r1]139
               stha %r8, [%r1]139
               stwa %r6, [%r1]139
               sta %f32, [%r1]139
               stda %f48, [%r1]139
casa  [%r1]0x8b, %r2, %g0
casxa  [%r1]0x8b, %r2, %g0
               prefetcha [%r1]139, 0x1f
        nop
        nop
        nop 
subcc	%r19, 1, %r19
cmp %r19, 2
bz,a TH4_LOOP
ta T_CHANGE_NONPRIV
cmp %r19, 1
bz,a TH4_LOOP
ta T_CHANGE_HPRIV
        nop
       ba main_text_end
       nop
        nop
        nop
        nop
        nop
       LOOP_T5:
 add %g0, 0x3, %r19
TH5_LOOP:
CASE_ASI_0x0_th5:
  wr %g0, 0x0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1_th5:
  wr %g0, 0x1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2_th5:
  wr %g0, 0x2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3_th5:
  wr %g0, 0x3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5_th5:
  wr %g0, 0x5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6_th5:
  wr %g0, 0x6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7_th5:
  wr %g0, 0x7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8_th5:
  wr %g0, 0x8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9_th5:
  wr %g0, 0x9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa_th5:
  wr %g0, 0xa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb_th5:
  wr %g0, 0xb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd_th5:
  wr %g0, 0xd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe_th5:
  wr %g0, 0xe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf_th5:
  wr %g0, 0xf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x12_th5:
  wr %g0, 0x12, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x13_th5:
  wr %g0, 0x13, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1a_th5:
  wr %g0, 0x1a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1b_th5:
  wr %g0, 0x1b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x20_th5:
  wr %g0, 0x20, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x21_th5:
  wr %g0, 0x21, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x25_th5:
  wr %g0, 0x25, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x28_th5:
  wr %g0, 0x28, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x29_th5:
  wr %g0, 0x29, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2d_th5:
  wr %g0, 0x2d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x32_th5:
  wr %g0, 0x32, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x33_th5:
  wr %g0, 0x33, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x34_th5:
  wr %g0, 0x34, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x35_th5:
  wr %g0, 0x35, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x37_th5:
  wr %g0, 0x37, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3a_th5:
  wr %g0, 0x3a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3b_th5:
  wr %g0, 0x3b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3c_th5:
  wr %g0, 0x3c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3d_th5:
  wr %g0, 0x3d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3f_th5:
  wr %g0, 0x3f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x40_th5:
  wr %g0, 0x40, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x41_th5:
  wr %g0, 0x41, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x42_th5:
  wr %g0, 0x42, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x43_th5:
  wr %g0, 0x43, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x44_th5:
  wr %g0, 0x44, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x45_th5:
  wr %g0, 0x45, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x48_th5:
  wr %g0, 0x48, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x49_th5:
  wr %g0, 0x49, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4a_th5:
  wr %g0, 0x4a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4b_th5:
  wr %g0, 0x4b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4c_th5:
  wr %g0, 0x4c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4d_th5:
  wr %g0, 0x4d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4e_th5:
  wr %g0, 0x4e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4f_th5:
  wr %g0, 0x4f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x50_th5:
  wr %g0, 0x50, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x51_th5:
  wr %g0, 0x51, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x52_th5:
  wr %g0, 0x52, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x53_th5:
  wr %g0, 0x53, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x56_th5:
  wr %g0, 0x56, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x57_th5:
  wr %g0, 0x57, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x58_th5:
  wr %g0, 0x58, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x59_th5:
  wr %g0, 0x59, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5a_th5:
  wr %g0, 0x5a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5b_th5:
  wr %g0, 0x5b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5e_th5:
  wr %g0, 0x5e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5f_th5:
  wr %g0, 0x5f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x60_th5:
  wr %g0, 0x60, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x61_th5:
  wr %g0, 0x61, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x62_th5:
  wr %g0, 0x62, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x63_th5:
  wr %g0, 0x63, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x64_th5:
  wr %g0, 0x64, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x65_th5:
  wr %g0, 0x65, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x68_th5:
  wr %g0, 0x68, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x69_th5:
  wr %g0, 0x69, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6a_th5:
  wr %g0, 0x6a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6b_th5:
  wr %g0, 0x6b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6c_th5:
  wr %g0, 0x6c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6d_th5:
  wr %g0, 0x6d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6e_th5:
  wr %g0, 0x6e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6f_th5:
  wr %g0, 0x6f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x70_th5:
  wr %g0, 0x70, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x71_th5:
  wr %g0, 0x71, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x72_th5:
  wr %g0, 0x72, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x74_th5:
  wr %g0, 0x74, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x75_th5:
  wr %g0, 0x75, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x76_th5:
  wr %g0, 0x76, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x77_th5:
  wr %g0, 0x77, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x78_th5:
  wr %g0, 0x78, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x79_th5:
  wr %g0, 0x79, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7a_th5:
  wr %g0, 0x7a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7b_th5:
  wr %g0, 0x7b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7c_th5:
  wr %g0, 0x7c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7d_th5:
  wr %g0, 0x7d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7e_th5:
  wr %g0, 0x7e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7f_th5:
  wr %g0, 0x7f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x84_th5:
  wr %g0, 0x84, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x85_th5:
  wr %g0, 0x85, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x86_th5:
  wr %g0, 0x86, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x87_th5:
  wr %g0, 0x87, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8c_th5:
  wr %g0, 0x8c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8d_th5:
  wr %g0, 0x8d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8e_th5:
  wr %g0, 0x8e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8f_th5:
  wr %g0, 0x8f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x90_th5:
  wr %g0, 0x90, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x91_th5:
  wr %g0, 0x91, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x92_th5:
  wr %g0, 0x92, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x93_th5:
  wr %g0, 0x93, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x94_th5:
  wr %g0, 0x94, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x95_th5:
  wr %g0, 0x95, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x96_th5:
  wr %g0, 0x96, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x97_th5:
  wr %g0, 0x97, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x98_th5:
  wr %g0, 0x98, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x99_th5:
  wr %g0, 0x99, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9a_th5:
  wr %g0, 0x9a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9b_th5:
  wr %g0, 0x9b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9c_th5:
  wr %g0, 0x9c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9d_th5:
  wr %g0, 0x9d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9e_th5:
  wr %g0, 0x9e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9f_th5:
  wr %g0, 0x9f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa0_th5:
  wr %g0, 0xa0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa1_th5:
  wr %g0, 0xa1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa2_th5:
  wr %g0, 0xa2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa3_th5:
  wr %g0, 0xa3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa4_th5:
  wr %g0, 0xa4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa5_th5:
  wr %g0, 0xa5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa6_th5:
  wr %g0, 0xa6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa7_th5:
  wr %g0, 0xa7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa8_th5:
  wr %g0, 0xa8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa9_th5:
  wr %g0, 0xa9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaa_th5:
  wr %g0, 0xaa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xab_th5:
  wr %g0, 0xab, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xac_th5:
  wr %g0, 0xac, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xad_th5:
  wr %g0, 0xad, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xae_th5:
  wr %g0, 0xae, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaf_th5:
  wr %g0, 0xaf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb0_th5:
  wr %g0, 0xb0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb1_th5:
  wr %g0, 0xb1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb2_th5:
  wr %g0, 0xb2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb3_th5:
  wr %g0, 0xb3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb4_th5:
  wr %g0, 0xb4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb5_th5:
  wr %g0, 0xb5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb6_th5:
  wr %g0, 0xb6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb7_th5:
  wr %g0, 0xb7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb8_th5:
  wr %g0, 0xb8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb9_th5:
  wr %g0, 0xb9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xba_th5:
  wr %g0, 0xba, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbb_th5:
  wr %g0, 0xbb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbc_th5:
  wr %g0, 0xbc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbd_th5:
  wr %g0, 0xbd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbe_th5:
  wr %g0, 0xbe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbf_th5:
  wr %g0, 0xbf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc6_th5:
  wr %g0, 0xc6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc7_th5:
  wr %g0, 0xc7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xce_th5:
  wr %g0, 0xce, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xcf_th5:
  wr %g0, 0xcf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd4_th5:
  wr %g0, 0xd4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd5_th5:
  wr %g0, 0xd5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd6_th5:
  wr %g0, 0xd6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd7_th5:
  wr %g0, 0xd7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdc_th5:
  wr %g0, 0xdc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdd_th5:
  wr %g0, 0xdd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xde_th5:
  wr %g0, 0xde, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdf_th5:
  wr %g0, 0xdf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe4_th5:
  wr %g0, 0xe4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe5_th5:
  wr %g0, 0xe5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe6_th5:
  wr %g0, 0xe6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe7_th5:
  wr %g0, 0xe7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe8_th5:
  wr %g0, 0xe8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe9_th5:
  wr %g0, 0xe9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xec_th5:
  wr %g0, 0xec, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xed_th5:
  wr %g0, 0xed, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xee_th5:
  wr %g0, 0xee, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xef_th5:
  wr %g0, 0xef, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf2_th5:
  wr %g0, 0xf2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf3_th5:
  wr %g0, 0xf3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf4_th5:
  wr %g0, 0xf4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf5_th5:
  wr %g0, 0xf5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf6_th5:
  wr %g0, 0xf6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf7_th5:
  wr %g0, 0xf7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfa_th5:
  wr %g0, 0xfa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfb_th5:
  wr %g0, 0xfb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfc_th5:
  wr %g0, 0xfc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfd_th5:
  wr %g0, 0xfd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfe_th5:
  wr %g0, 0xfe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xff_th5:
  wr %g0, 0xff, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x46_th5:
  wr %g0, 0x46, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x47_th5:
  wr %g0, 0x47, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x4_th5:
  mov %r27, %r1
        ldx [%r25 + 0xa3 & ~0x7], %r2
        ldx [%r27 + 0x5c & ~0x7], %r4
        ldx [%r23 + 0xe1 & ~0x7], %r6
        ldx [%r24 + 0xc & ~0x7], %r8
        ldx [%r21 + 0xd9 & ~0x7], %r10
        ldx [%r22 + 0xe0 & ~0x7], %r12
        ldx [%r25 + 0xd8 & ~0x7], %r14
        ldx [%r24 + 0xf0 & ~0x7], %r16
        ld [%r27 + 0x55 & ~0x7], %f0
        ld [%r27 + 0x5b & ~0x7], %f16
        ld [%r21 + 0x91 & ~0x7], %f32
        ld [%r26 + 0x66 & ~0x7], %f48
               ldsba [%r1]4, %r14
               ldsha [%r1]4, %r6
               ldswa [%r1]4, %r10
               lduba [%r1]4, %r6
               lduha [%r1]4, %r16
               ldxa [%r1]4, %r8
               ldda [%r1]4, %r4
               ldstuba [%r1]4, %r16
               swapa [%r1]4, %r10
               lda [%r1]4, %f48
               ldda [%r1]4, %f16
               stba %r12, [%r1]4
               stha %r12, [%r1]4
               stwa %r2, [%r1]4
               sta %f0, [%r1]4
               stda %f32, [%r1]4
casa  [%r1]0x4, %r2, %g0
casxa  [%r1]0x4, %r2, %g0
               prefetcha [%r1]4, 0xe
CASE_ASI_0xc_th5:
  mov %r25, %r1
        ldx [%r25 + 0xb3 & ~0x7], %r2
        ldx [%r24 + 0xae & ~0x7], %r4
        ldx [%r21 + 0x73 & ~0x7], %r6
        ldx [%r28 + 0xdd & ~0x7], %r8
        ldx [%r26 + 0x21 & ~0x7], %r10
        ldx [%r24 + 0x77 & ~0x7], %r12
        ldx [%r25 + 0x9a & ~0x7], %r14
        ldx [%r24 + 0xaa & ~0x7], %r16
        ld [%r24 + 0x4 & ~0x7], %f0
        ld [%r26 + 0x21 & ~0x7], %f16
        ld [%r25 + 0x8 & ~0x7], %f32
        ld [%r27 + 0x4b & ~0x7], %f48
               ldsba [%r1]12, %r4
               ldsha [%r1]12, %r14
               ldswa [%r1]12, %r12
               lduba [%r1]12, %r6
               lduha [%r1]12, %r4
               ldxa [%r1]12, %r12
               ldda [%r1]12, %r16
               ldstuba [%r1]12, %r14
               swapa [%r1]12, %r2
               lda [%r1]12, %f48
               ldda [%r1]12, %f48
               stba %r6, [%r1]12
               stha %r14, [%r1]12
               stwa %r10, [%r1]12
               sta %f48, [%r1]12
               stda %f48, [%r1]12
casa  [%r1]0xc, %r2, %g0
casxa  [%r1]0xc, %r2, %g0
               prefetcha [%r1]12, 0x2
CASE_ASI_0x10_th5:
  mov %r24, %r1
        ldx [%r26 + 0x40 & ~0x7], %r2
        ldx [%r27 + 0x13 & ~0x7], %r4
        ldx [%r21 + 0x4f & ~0x7], %r6
        ldx [%r23 + 0x4e & ~0x7], %r8
        ldx [%r28 + 0x91 & ~0x7], %r10
        ldx [%r28 + 0x38 & ~0x7], %r12
        ldx [%r26 + 0x17 & ~0x7], %r14
        ldx [%r24 + 0x9b & ~0x7], %r16
        ld [%r23 + 0x22 & ~0x7], %f0
        ld [%r23 + 0xc2 & ~0x7], %f16
        ld [%r24 + 0xcc & ~0x7], %f32
        ld [%r26 + 0x32 & ~0x7], %f48
               ldsba [%r1]16, %r14
               ldsha [%r1]16, %r8
               ldswa [%r1]16, %r2
               lduba [%r1]16, %r2
               lduha [%r1]16, %r16
               ldxa [%r1]16, %r16
               ldda [%r1]16, %r12
               ldstuba [%r1]16, %r10
               swapa [%r1]16, %r12
               lda [%r1]16, %f48
               ldda [%r1]16, %f16
               stba %r6, [%r1]16
               stha %r14, [%r1]16
               stwa %r4, [%r1]16
               sta %f16, [%r1]16
               stda %f48, [%r1]16
casa  [%r1]0x10, %r2, %g0
casxa  [%r1]0x10, %r2, %g0
               prefetcha [%r1]16, 0x9
CASE_ASI_0x11_th5:
  mov %r26, %r1
        ldx [%r28 + 0xbb & ~0x7], %r2
        ldx [%r24 + 0xfd & ~0x7], %r4
        ldx [%r24 + 0xfc & ~0x7], %r6
        ldx [%r27 + 0xe0 & ~0x7], %r8
        ldx [%r25 + 0x40 & ~0x7], %r10
        ldx [%r27 + 0xf8 & ~0x7], %r12
        ldx [%r21 + 0x78 & ~0x7], %r14
        ldx [%r25 + 0x1f & ~0x7], %r16
        ld [%r22 + 0x63 & ~0x7], %f0
        ld [%r24 + 0x8b & ~0x7], %f16
        ld [%r28 + 0xa0 & ~0x7], %f32
        ld [%r26 + 0x0 & ~0x7], %f48
               ldsba [%r1]17, %r10
               ldsha [%r1]17, %r12
               ldswa [%r1]17, %r12
               lduba [%r1]17, %r2
               lduha [%r1]17, %r2
               ldxa [%r1]17, %r10
               ldda [%r1]17, %r8
               ldstuba [%r1]17, %r4
               swapa [%r1]17, %r16
               lda [%r1]17, %f0
               ldda [%r1]17, %f32
               stba %r8, [%r1]17
               stha %r6, [%r1]17
               stwa %r4, [%r1]17
               sta %f48, [%r1]17
               stda %f16, [%r1]17
casa  [%r1]0x11, %r2, %g0
casxa  [%r1]0x11, %r2, %g0
               prefetcha [%r1]17, 0x4
CASE_ASI_0x18_th5:
  mov %r24, %r1
        ldx [%r26 + 0x56 & ~0x7], %r2
        ldx [%r26 + 0x60 & ~0x7], %r4
        ldx [%r21 + 0x43 & ~0x7], %r6
        ldx [%r26 + 0x96 & ~0x7], %r8
        ldx [%r23 + 0x4 & ~0x7], %r10
        ldx [%r22 + 0xf9 & ~0x7], %r12
        ldx [%r25 + 0x86 & ~0x7], %r14
        ldx [%r24 + 0xfb & ~0x7], %r16
        ld [%r22 + 0x37 & ~0x7], %f0
        ld [%r22 + 0xc3 & ~0x7], %f16
        ld [%r23 + 0xad & ~0x7], %f32
        ld [%r24 + 0x55 & ~0x7], %f48
               ldsba [%r1]24, %r4
               ldsha [%r1]24, %r16
               ldswa [%r1]24, %r6
               lduba [%r1]24, %r2
               lduha [%r1]24, %r14
               ldxa [%r1]24, %r6
               ldda [%r1]24, %r16
               ldstuba [%r1]24, %r16
               swapa [%r1]24, %r10
               lda [%r1]24, %f48
               ldda [%r1]24, %f48
               stba %r2, [%r1]24
               stha %r2, [%r1]24
               stwa %r14, [%r1]24
               sta %f48, [%r1]24
               stda %f0, [%r1]24
casa  [%r1]0x18, %r2, %g0
casxa  [%r1]0x18, %r2, %g0
               prefetcha [%r1]24, 0x7
CASE_ASI_0x19_th5:
  mov %r21, %r1
        ldx [%r22 + 0x71 & ~0x7], %r2
        ldx [%r24 + 0xc8 & ~0x7], %r4
        ldx [%r23 + 0x3 & ~0x7], %r6
        ldx [%r22 + 0x94 & ~0x7], %r8
        ldx [%r22 + 0x62 & ~0x7], %r10
        ldx [%r24 + 0x12 & ~0x7], %r12
        ldx [%r28 + 0x2a & ~0x7], %r14
        ldx [%r25 + 0x19 & ~0x7], %r16
        ld [%r21 + 0xf4 & ~0x7], %f0
        ld [%r26 + 0xea & ~0x7], %f16
        ld [%r28 + 0x6c & ~0x7], %f32
        ld [%r26 + 0x76 & ~0x7], %f48
               ldsba [%r1]25, %r8
               ldsha [%r1]25, %r14
               ldswa [%r1]25, %r6
               lduba [%r1]25, %r6
               lduha [%r1]25, %r10
               ldxa [%r1]25, %r16
               ldda [%r1]25, %r8
               ldstuba [%r1]25, %r10
               swapa [%r1]25, %r14
               lda [%r1]25, %f0
               ldda [%r1]25, %f16
               stba %r8, [%r1]25
               stha %r4, [%r1]25
               stwa %r14, [%r1]25
               sta %f32, [%r1]25
               stda %f0, [%r1]25
casa  [%r1]0x19, %r2, %g0
casxa  [%r1]0x19, %r2, %g0
               prefetcha [%r1]25, 0x3
CASE_ASI_0x80_th5:
  mov %r28, %r1
        ldx [%r28 + 0x44 & ~0x7], %r2
        ldx [%r21 + 0xe2 & ~0x7], %r4
        ldx [%r26 + 0xe7 & ~0x7], %r6
        ldx [%r21 + 0x66 & ~0x7], %r8
        ldx [%r28 + 0x11 & ~0x7], %r10
        ldx [%r22 + 0xbd & ~0x7], %r12
        ldx [%r28 + 0xbe & ~0x7], %r14
        ldx [%r24 + 0x9d & ~0x7], %r16
        ld [%r27 + 0xff & ~0x7], %f0
        ld [%r23 + 0xaf & ~0x7], %f16
        ld [%r24 + 0xd & ~0x7], %f32
        ld [%r23 + 0xad & ~0x7], %f48
               ldsba [%r1]128, %r8
               ldsha [%r1]128, %r4
               ldswa [%r1]128, %r4
               lduba [%r1]128, %r12
               lduha [%r1]128, %r16
               ldxa [%r1]128, %r6
               ldda [%r1]128, %r8
               ldstuba [%r1]128, %r12
               swapa [%r1]128, %r8
               lda [%r1]128, %f32
               ldda [%r1]128, %f0
               stba %r4, [%r1]128
               stha %r10, [%r1]128
               stwa %r12, [%r1]128
               sta %f16, [%r1]128
               stda %f32, [%r1]128
casa  [%r1]0x80, %r2, %g0
casxa  [%r1]0x80, %r2, %g0
               prefetcha [%r1]128, 0x1a
CASE_ASI_0x81_th5:
  mov %r28, %r1
        ldx [%r25 + 0xe7 & ~0x7], %r2
        ldx [%r28 + 0xfa & ~0x7], %r4
        ldx [%r25 + 0x75 & ~0x7], %r6
        ldx [%r25 + 0xe & ~0x7], %r8
        ldx [%r26 + 0x78 & ~0x7], %r10
        ldx [%r27 + 0xf & ~0x7], %r12
        ldx [%r22 + 0xcc & ~0x7], %r14
        ldx [%r26 + 0xb5 & ~0x7], %r16
        ld [%r21 + 0x7c & ~0x7], %f0
        ld [%r24 + 0x5 & ~0x7], %f16
        ld [%r23 + 0x2 & ~0x7], %f32
        ld [%r25 + 0x68 & ~0x7], %f48
               ldsba [%r1]129, %r16
               ldsha [%r1]129, %r8
               ldswa [%r1]129, %r14
               lduba [%r1]129, %r12
               lduha [%r1]129, %r16
               ldxa [%r1]129, %r10
               ldda [%r1]129, %r4
               ldstuba [%r1]129, %r14
               swapa [%r1]129, %r12
               lda [%r1]129, %f16
               ldda [%r1]129, %f0
               stba %r12, [%r1]129
               stha %r4, [%r1]129
               stwa %r10, [%r1]129
               sta %f16, [%r1]129
               stda %f32, [%r1]129
casa  [%r1]0x81, %r2, %g0
casxa  [%r1]0x81, %r2, %g0
               prefetcha [%r1]129, 0x6
CASE_ASI_0x82_th5:
  mov %r22, %r1
        ldx [%r21 + 0xbd & ~0x7], %r2
        ldx [%r26 + 0x88 & ~0x7], %r4
        ldx [%r27 + 0x11 & ~0x7], %r6
        ldx [%r26 + 0x7 & ~0x7], %r8
        ldx [%r28 + 0x71 & ~0x7], %r10
        ldx [%r26 + 0x35 & ~0x7], %r12
        ldx [%r28 + 0x44 & ~0x7], %r14
        ldx [%r22 + 0x63 & ~0x7], %r16
        ld [%r24 + 0x66 & ~0x7], %f0
        ld [%r23 + 0x9a & ~0x7], %f16
        ld [%r28 + 0x2c & ~0x7], %f32
        ld [%r27 + 0x16 & ~0x7], %f48
               ldsba [%r1]130, %r2
               ldsha [%r1]130, %r12
               ldswa [%r1]130, %r12
               lduba [%r1]130, %r12
               lduha [%r1]130, %r12
               ldxa [%r1]130, %r14
               ldda [%r1]130, %r8
               ldstuba [%r1]130, %r6
               swapa [%r1]130, %r10
               lda [%r1]130, %f0
               ldda [%r1]130, %f16
               stba %r10, [%r1]130
               stha %r8, [%r1]130
               stwa %r10, [%r1]130
               sta %f0, [%r1]130
               stda %f0, [%r1]130
casa  [%r1]0x82, %r2, %g0
casxa  [%r1]0x82, %r2, %g0
               prefetcha [%r1]130, 0x13
CASE_ASI_0x83_th5:
  mov %r23, %r1
        ldx [%r22 + 0xd7 & ~0x7], %r2
        ldx [%r23 + 0x6a & ~0x7], %r4
        ldx [%r26 + 0xf8 & ~0x7], %r6
        ldx [%r27 + 0xb2 & ~0x7], %r8
        ldx [%r26 + 0x28 & ~0x7], %r10
        ldx [%r27 + 0x56 & ~0x7], %r12
        ldx [%r27 + 0x54 & ~0x7], %r14
        ldx [%r22 + 0x2f & ~0x7], %r16
        ld [%r21 + 0x43 & ~0x7], %f0
        ld [%r27 + 0xf4 & ~0x7], %f16
        ld [%r28 + 0x80 & ~0x7], %f32
        ld [%r28 + 0xbb & ~0x7], %f48
               ldsba [%r1]131, %r8
               ldsha [%r1]131, %r2
               ldswa [%r1]131, %r14
               lduba [%r1]131, %r4
               lduha [%r1]131, %r14
               ldxa [%r1]131, %r4
               ldda [%r1]131, %r10
               ldstuba [%r1]131, %r6
               swapa [%r1]131, %r6
               lda [%r1]131, %f48
               ldda [%r1]131, %f32
               stba %r12, [%r1]131
               stha %r2, [%r1]131
               stwa %r4, [%r1]131
               sta %f16, [%r1]131
               stda %f0, [%r1]131
casa  [%r1]0x83, %r2, %g0
casxa  [%r1]0x83, %r2, %g0
               prefetcha [%r1]131, 0x4
CASE_ASI_0x88_th5:
  mov %r26, %r1
        ldx [%r25 + 0x1b & ~0x7], %r2
        ldx [%r23 + 0xeb & ~0x7], %r4
        ldx [%r28 + 0x3b & ~0x7], %r6
        ldx [%r22 + 0x6 & ~0x7], %r8
        ldx [%r23 + 0xeb & ~0x7], %r10
        ldx [%r24 + 0xf0 & ~0x7], %r12
        ldx [%r21 + 0xc6 & ~0x7], %r14
        ldx [%r27 + 0x92 & ~0x7], %r16
        ld [%r24 + 0x57 & ~0x7], %f0
        ld [%r26 + 0xf2 & ~0x7], %f16
        ld [%r28 + 0x65 & ~0x7], %f32
        ld [%r26 + 0xa3 & ~0x7], %f48
               ldsba [%r1]136, %r6
               ldsha [%r1]136, %r10
               ldswa [%r1]136, %r2
               lduba [%r1]136, %r14
               lduha [%r1]136, %r10
               ldxa [%r1]136, %r6
               ldda [%r1]136, %r16
               ldstuba [%r1]136, %r4
               swapa [%r1]136, %r10
               lda [%r1]136, %f0
               ldda [%r1]136, %f16
               stba %r2, [%r1]136
               stha %r0, [%r1]136
               stwa %r6, [%r1]136
               sta %f0, [%r1]136
               stda %f16, [%r1]136
casa  [%r1]0x88, %r2, %g0
casxa  [%r1]0x88, %r2, %g0
               prefetcha [%r1]136, 0x3
CASE_ASI_0x89_th5:
  mov %r24, %r1
        ldx [%r28 + 0xe0 & ~0x7], %r2
        ldx [%r25 + 0xc2 & ~0x7], %r4
        ldx [%r27 + 0xf2 & ~0x7], %r6
        ldx [%r24 + 0xe0 & ~0x7], %r8
        ldx [%r21 + 0x62 & ~0x7], %r10
        ldx [%r28 + 0x25 & ~0x7], %r12
        ldx [%r26 + 0x98 & ~0x7], %r14
        ldx [%r23 + 0xaf & ~0x7], %r16
        ld [%r25 + 0x4a & ~0x7], %f0
        ld [%r24 + 0x39 & ~0x7], %f16
        ld [%r24 + 0x63 & ~0x7], %f32
        ld [%r25 + 0xc2 & ~0x7], %f48
               ldsba [%r1]137, %r12
               ldsha [%r1]137, %r12
               ldswa [%r1]137, %r8
               lduba [%r1]137, %r16
               lduha [%r1]137, %r10
               ldxa [%r1]137, %r4
               ldda [%r1]137, %r12
               ldstuba [%r1]137, %r6
               swapa [%r1]137, %r14
               lda [%r1]137, %f16
               ldda [%r1]137, %f48
               stba %r10, [%r1]137
               stha %r2, [%r1]137
               stwa %r10, [%r1]137
               sta %f48, [%r1]137
               stda %f0, [%r1]137
casa  [%r1]0x89, %r2, %g0
casxa  [%r1]0x89, %r2, %g0
               prefetcha [%r1]137, 0x1d
CASE_ASI_0x8a_th5:
  mov %r22, %r1
        ldx [%r26 + 0xee & ~0x7], %r2
        ldx [%r23 + 0xba & ~0x7], %r4
        ldx [%r25 + 0x35 & ~0x7], %r6
        ldx [%r26 + 0x4b & ~0x7], %r8
        ldx [%r26 + 0xdc & ~0x7], %r10
        ldx [%r23 + 0x3 & ~0x7], %r12
        ldx [%r22 + 0x77 & ~0x7], %r14
        ldx [%r22 + 0xaf & ~0x7], %r16
        ld [%r24 + 0x20 & ~0x7], %f0
        ld [%r24 + 0x34 & ~0x7], %f16
        ld [%r27 + 0xad & ~0x7], %f32
        ld [%r26 + 0xee & ~0x7], %f48
               ldsba [%r1]138, %r12
               ldsha [%r1]138, %r12
               ldswa [%r1]138, %r4
               lduba [%r1]138, %r4
               lduha [%r1]138, %r12
               ldxa [%r1]138, %r8
               ldda [%r1]138, %r4
               ldstuba [%r1]138, %r16
               swapa [%r1]138, %r16
               lda [%r1]138, %f48
               ldda [%r1]138, %f48
               stba %r10, [%r1]138
               stha %r6, [%r1]138
               stwa %r2, [%r1]138
               sta %f48, [%r1]138
               stda %f16, [%r1]138
casa  [%r1]0x8a, %r2, %g0
casxa  [%r1]0x8a, %r2, %g0
               prefetcha [%r1]138, 0x1c
CASE_ASI_0x8b_th5:
  mov %r26, %r1
        ldx [%r27 + 0x24 & ~0x7], %r2
        ldx [%r22 + 0xd9 & ~0x7], %r4
        ldx [%r21 + 0x2d & ~0x7], %r6
        ldx [%r26 + 0x5b & ~0x7], %r8
        ldx [%r28 + 0xb7 & ~0x7], %r10
        ldx [%r25 + 0x35 & ~0x7], %r12
        ldx [%r26 + 0x95 & ~0x7], %r14
        ldx [%r23 + 0x21 & ~0x7], %r16
        ld [%r26 + 0xb & ~0x7], %f0
        ld [%r26 + 0x95 & ~0x7], %f16
        ld [%r24 + 0x13 & ~0x7], %f32
        ld [%r27 + 0x5d & ~0x7], %f48
               ldsba [%r1]139, %r16
               ldsha [%r1]139, %r14
               ldswa [%r1]139, %r14
               lduba [%r1]139, %r10
               lduha [%r1]139, %r8
               ldxa [%r1]139, %r16
               ldda [%r1]139, %r16
               ldstuba [%r1]139, %r2
               swapa [%r1]139, %r12
               lda [%r1]139, %f48
               ldda [%r1]139, %f16
               stba %r2, [%r1]139
               stha %r2, [%r1]139
               stwa %r0, [%r1]139
               sta %f32, [%r1]139
               stda %f48, [%r1]139
casa  [%r1]0x8b, %r2, %g0
casxa  [%r1]0x8b, %r2, %g0
               prefetcha [%r1]139, 0xb
        nop
        nop
        nop
subcc	%r19, 1, %r19
cmp %r19, 2
bz,a TH5_LOOP
ta T_CHANGE_PRIV
cmp %r19, 1
bz,a TH5_LOOP
ta T_CHANGE_HPRIV
        nop
       ba main_text_end
       nop
        nop
        nop
        nop
        nop
       LOOP_T6:
ta T_CHANGE_HPRIV
 add %g0, 0x3, %r19
TH6_LOOP:
CASE_ASI_0x0_th6:
  wr %g0, 0x0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1_th6:
  wr %g0, 0x1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2_th6:
  wr %g0, 0x2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3_th6:
  wr %g0, 0x3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5_th6:
  wr %g0, 0x5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6_th6:
  wr %g0, 0x6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7_th6:
  wr %g0, 0x7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8_th6:
  wr %g0, 0x8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9_th6:
  wr %g0, 0x9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa_th6:
  wr %g0, 0xa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb_th6:
  wr %g0, 0xb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd_th6:
  wr %g0, 0xd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe_th6:
  wr %g0, 0xe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf_th6:
  wr %g0, 0xf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x12_th6:
  wr %g0, 0x12, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x13_th6:
  wr %g0, 0x13, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1a_th6:
  wr %g0, 0x1a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1b_th6:
  wr %g0, 0x1b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x20_th6:
  wr %g0, 0x20, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x21_th6:
  wr %g0, 0x21, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x25_th6:
  wr %g0, 0x25, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x28_th6:
  wr %g0, 0x28, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x29_th6:
  wr %g0, 0x29, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2d_th6:
  wr %g0, 0x2d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x32_th6:
  wr %g0, 0x32, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x33_th6:
  wr %g0, 0x33, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x34_th6:
  wr %g0, 0x34, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x35_th6:
  wr %g0, 0x35, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x37_th6:
  wr %g0, 0x37, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3a_th6:
  wr %g0, 0x3a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3b_th6:
  wr %g0, 0x3b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3c_th6:
  wr %g0, 0x3c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3d_th6:
  wr %g0, 0x3d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3f_th6:
  wr %g0, 0x3f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x40_th6:
  wr %g0, 0x40, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x41_th6:
  wr %g0, 0x41, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x42_th6:
  wr %g0, 0x42, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x43_th6:
  wr %g0, 0x43, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x44_th6:
  wr %g0, 0x44, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x45_th6:
  wr %g0, 0x45, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x48_th6:
  wr %g0, 0x48, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x49_th6:
  wr %g0, 0x49, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4a_th6:
  wr %g0, 0x4a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4b_th6:
  wr %g0, 0x4b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4c_th6:
  wr %g0, 0x4c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4d_th6:
  wr %g0, 0x4d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4e_th6:
  wr %g0, 0x4e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4f_th6:
  wr %g0, 0x4f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x50_th6:
  wr %g0, 0x50, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x51_th6:
  wr %g0, 0x51, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x52_th6:
  wr %g0, 0x52, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x53_th6:
  wr %g0, 0x53, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x56_th6:
  wr %g0, 0x56, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x57_th6:
  wr %g0, 0x57, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x58_th6:
  wr %g0, 0x58, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x59_th6:
  wr %g0, 0x59, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5a_th6:
  wr %g0, 0x5a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5b_th6:
  wr %g0, 0x5b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5e_th6:
  wr %g0, 0x5e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5f_th6:
  wr %g0, 0x5f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x60_th6:
  wr %g0, 0x60, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x61_th6:
  wr %g0, 0x61, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x62_th6:
  wr %g0, 0x62, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x63_th6:
  wr %g0, 0x63, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x64_th6:
  wr %g0, 0x64, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x65_th6:
  wr %g0, 0x65, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x68_th6:
  wr %g0, 0x68, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x69_th6:
  wr %g0, 0x69, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6a_th6:
  wr %g0, 0x6a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6b_th6:
  wr %g0, 0x6b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6c_th6:
  wr %g0, 0x6c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6d_th6:
  wr %g0, 0x6d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6e_th6:
  wr %g0, 0x6e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6f_th6:
  wr %g0, 0x6f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x70_th6:
  wr %g0, 0x70, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x71_th6:
  wr %g0, 0x71, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x72_th6:
  wr %g0, 0x72, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x74_th6:
  wr %g0, 0x74, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x75_th6:
  wr %g0, 0x75, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x76_th6:
  wr %g0, 0x76, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x77_th6:
  wr %g0, 0x77, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x78_th6:
  wr %g0, 0x78, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x79_th6:
  wr %g0, 0x79, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7a_th6:
  wr %g0, 0x7a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7b_th6:
  wr %g0, 0x7b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7c_th6:
  wr %g0, 0x7c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7d_th6:
  wr %g0, 0x7d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7e_th6:
  wr %g0, 0x7e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7f_th6:
  wr %g0, 0x7f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x84_th6:
  wr %g0, 0x84, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x85_th6:
  wr %g0, 0x85, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x86_th6:
  wr %g0, 0x86, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x87_th6:
  wr %g0, 0x87, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8c_th6:
  wr %g0, 0x8c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8d_th6:
  wr %g0, 0x8d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8e_th6:
  wr %g0, 0x8e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8f_th6:
  wr %g0, 0x8f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x90_th6:
  wr %g0, 0x90, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x91_th6:
  wr %g0, 0x91, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x92_th6:
  wr %g0, 0x92, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x93_th6:
  wr %g0, 0x93, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x94_th6:
  wr %g0, 0x94, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x95_th6:
  wr %g0, 0x95, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x96_th6:
  wr %g0, 0x96, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x97_th6:
  wr %g0, 0x97, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x98_th6:
  wr %g0, 0x98, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x99_th6:
  wr %g0, 0x99, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9a_th6:
  wr %g0, 0x9a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9b_th6:
  wr %g0, 0x9b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9c_th6:
  wr %g0, 0x9c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9d_th6:
  wr %g0, 0x9d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9e_th6:
  wr %g0, 0x9e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9f_th6:
  wr %g0, 0x9f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa0_th6:
  wr %g0, 0xa0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa1_th6:
  wr %g0, 0xa1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa2_th6:
  wr %g0, 0xa2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa3_th6:
  wr %g0, 0xa3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa4_th6:
  wr %g0, 0xa4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa5_th6:
  wr %g0, 0xa5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa6_th6:
  wr %g0, 0xa6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa7_th6:
  wr %g0, 0xa7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa8_th6:
  wr %g0, 0xa8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa9_th6:
  wr %g0, 0xa9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaa_th6:
  wr %g0, 0xaa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xab_th6:
  wr %g0, 0xab, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xac_th6:
  wr %g0, 0xac, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xad_th6:
  wr %g0, 0xad, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xae_th6:
  wr %g0, 0xae, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaf_th6:
  wr %g0, 0xaf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb0_th6:
  wr %g0, 0xb0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb1_th6:
  wr %g0, 0xb1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb2_th6:
  wr %g0, 0xb2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb3_th6:
  wr %g0, 0xb3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb4_th6:
  wr %g0, 0xb4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb5_th6:
  wr %g0, 0xb5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb6_th6:
  wr %g0, 0xb6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb7_th6:
  wr %g0, 0xb7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb8_th6:
  wr %g0, 0xb8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb9_th6:
  wr %g0, 0xb9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xba_th6:
  wr %g0, 0xba, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbb_th6:
  wr %g0, 0xbb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbc_th6:
  wr %g0, 0xbc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbd_th6:
  wr %g0, 0xbd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbe_th6:
  wr %g0, 0xbe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbf_th6:
  wr %g0, 0xbf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc6_th6:
  wr %g0, 0xc6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc7_th6:
  wr %g0, 0xc7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xce_th6:
  wr %g0, 0xce, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xcf_th6:
  wr %g0, 0xcf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd4_th6:
  wr %g0, 0xd4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd5_th6:
  wr %g0, 0xd5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd6_th6:
  wr %g0, 0xd6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd7_th6:
  wr %g0, 0xd7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdc_th6:
  wr %g0, 0xdc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdd_th6:
  wr %g0, 0xdd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xde_th6:
  wr %g0, 0xde, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdf_th6:
  wr %g0, 0xdf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe4_th6:
  wr %g0, 0xe4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe5_th6:
  wr %g0, 0xe5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe6_th6:
  wr %g0, 0xe6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe7_th6:
  wr %g0, 0xe7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe8_th6:
  wr %g0, 0xe8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe9_th6:
  wr %g0, 0xe9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xec_th6:
  wr %g0, 0xec, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xed_th6:
  wr %g0, 0xed, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xee_th6:
  wr %g0, 0xee, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xef_th6:
  wr %g0, 0xef, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf2_th6:
  wr %g0, 0xf2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf3_th6:
  wr %g0, 0xf3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf4_th6:
  wr %g0, 0xf4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf5_th6:
  wr %g0, 0xf5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf6_th6:
  wr %g0, 0xf6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf7_th6:
  wr %g0, 0xf7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfa_th6:
  wr %g0, 0xfa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfb_th6:
  wr %g0, 0xfb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfc_th6:
  wr %g0, 0xfc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfd_th6:
  wr %g0, 0xfd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfe_th6:
  wr %g0, 0xfe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xff_th6:
  wr %g0, 0xff, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x46_th6:
  wr %g0, 0x46, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x47_th6:
  wr %g0, 0x47, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x4_th6:
  mov %r21, %r1
        ldx [%r26 + 0xa0 & ~0x7], %r2
        ldx [%r28 + 0x23 & ~0x7], %r4
        ldx [%r23 + 0x8 & ~0x7], %r6
        ldx [%r25 + 0xae & ~0x7], %r8
        ldx [%r26 + 0x5a & ~0x7], %r10
        ldx [%r28 + 0xd4 & ~0x7], %r12
        ldx [%r28 + 0xca & ~0x7], %r14
        ldx [%r23 + 0xe6 & ~0x7], %r16
        ld [%r25 + 0xa7 & ~0x7], %f0
        ld [%r28 + 0x6c & ~0x7], %f16
        ld [%r25 + 0x3d & ~0x7], %f32
        ld [%r24 + 0xc5 & ~0x7], %f48
               ldsba [%r1]4, %r2
               ldsha [%r1]4, %r10
               ldswa [%r1]4, %r8
               lduba [%r1]4, %r8
               lduha [%r1]4, %r14
               ldxa [%r1]4, %r8
               ldda [%r1]4, %r6
               ldstuba [%r1]4, %r10
               swapa [%r1]4, %r14
               lda [%r1]4, %f48
               ldda [%r1]4, %f0
               stba %r12, [%r1]4
               stha %r14, [%r1]4
               stwa %r8, [%r1]4
               sta %f16, [%r1]4
               stda %f32, [%r1]4
casa  [%r1]0x4, %r2, %g0
casxa  [%r1]0x4, %r2, %g0
               prefetcha [%r1]4, 0x17
CASE_ASI_0xc_th6:
  mov %r22, %r1
        ldx [%r22 + 0x86 & ~0x7], %r2
        ldx [%r23 + 0x8b & ~0x7], %r4
        ldx [%r24 + 0x90 & ~0x7], %r6
        ldx [%r22 + 0x5a & ~0x7], %r8
        ldx [%r22 + 0x2a & ~0x7], %r10
        ldx [%r27 + 0xbe & ~0x7], %r12
        ldx [%r27 + 0xcf & ~0x7], %r14
        ldx [%r25 + 0x4b & ~0x7], %r16
        ld [%r21 + 0xbb & ~0x7], %f0
        ld [%r26 + 0xe0 & ~0x7], %f16
        ld [%r23 + 0xf7 & ~0x7], %f32
        ld [%r23 + 0x32 & ~0x7], %f48
               ldsba [%r1]12, %r4
               ldsha [%r1]12, %r14
               ldswa [%r1]12, %r8
               lduba [%r1]12, %r2
               lduha [%r1]12, %r16
               ldxa [%r1]12, %r4
               ldda [%r1]12, %r8
               ldstuba [%r1]12, %r16
               swapa [%r1]12, %r14
               lda [%r1]12, %f48
               ldda [%r1]12, %f48
               stba %r2, [%r1]12
               stha %r14, [%r1]12
               stwa %r14, [%r1]12
               sta %f16, [%r1]12
               stda %f16, [%r1]12
casa  [%r1]0xc, %r2, %g0
casxa  [%r1]0xc, %r2, %g0
               prefetcha [%r1]12, 0x15
CASE_ASI_0x10_th6:
  mov %r25, %r1
        ldx [%r27 + 0x70 & ~0x7], %r2
        ldx [%r28 + 0x40 & ~0x7], %r4
        ldx [%r26 + 0x68 & ~0x7], %r6
        ldx [%r25 + 0xca & ~0x7], %r8
        ldx [%r23 + 0xc3 & ~0x7], %r10
        ldx [%r25 + 0xa3 & ~0x7], %r12
        ldx [%r24 + 0xe7 & ~0x7], %r14
        ldx [%r28 + 0x29 & ~0x7], %r16
        ld [%r25 + 0xec & ~0x7], %f0
        ld [%r26 + 0xa6 & ~0x7], %f16
        ld [%r28 + 0x96 & ~0x7], %f32
        ld [%r23 + 0xdf & ~0x7], %f48
               ldsba [%r1]16, %r16
               ldsha [%r1]16, %r6
               ldswa [%r1]16, %r16
               lduba [%r1]16, %r2
               lduha [%r1]16, %r6
               ldxa [%r1]16, %r10
               ldda [%r1]16, %r16
               ldstuba [%r1]16, %r4
               swapa [%r1]16, %r2
               lda [%r1]16, %f16
               ldda [%r1]16, %f16
               stba %r0, [%r1]16
               stha %r10, [%r1]16
               stwa %r2, [%r1]16
               sta %f16, [%r1]16
               stda %f0, [%r1]16
casa  [%r1]0x10, %r2, %g0
casxa  [%r1]0x10, %r2, %g0
               prefetcha [%r1]16, 0x1b
CASE_ASI_0x11_th6:
  mov %r25, %r1
        ldx [%r26 + 0x51 & ~0x7], %r2
        ldx [%r22 + 0x96 & ~0x7], %r4
        ldx [%r24 + 0x97 & ~0x7], %r6
        ldx [%r22 + 0x32 & ~0x7], %r8
        ldx [%r24 + 0x61 & ~0x7], %r10
        ldx [%r22 + 0x29 & ~0x7], %r12
        ldx [%r24 + 0xfe & ~0x7], %r14
        ldx [%r25 + 0xfb & ~0x7], %r16
        ld [%r21 + 0xe7 & ~0x7], %f0
        ld [%r24 + 0x70 & ~0x7], %f16
        ld [%r23 + 0xe5 & ~0x7], %f32
        ld [%r26 + 0x2f & ~0x7], %f48
               ldsba [%r1]17, %r2
               ldsha [%r1]17, %r12
               ldswa [%r1]17, %r4
               lduba [%r1]17, %r10
               lduha [%r1]17, %r14
               ldxa [%r1]17, %r2
               ldda [%r1]17, %r6
               ldstuba [%r1]17, %r2
               swapa [%r1]17, %r10
               lda [%r1]17, %f48
               ldda [%r1]17, %f0
               stba %r14, [%r1]17
               stha %r10, [%r1]17
               stwa %r4, [%r1]17
               sta %f32, [%r1]17
               stda %f16, [%r1]17
casa  [%r1]0x11, %r2, %g0
casxa  [%r1]0x11, %r2, %g0
               prefetcha [%r1]17, 0x7
CASE_ASI_0x18_th6:
  mov %r22, %r1
        ldx [%r21 + 0xd3 & ~0x7], %r2
        ldx [%r27 + 0xe2 & ~0x7], %r4
        ldx [%r27 + 0x1d & ~0x7], %r6
        ldx [%r27 + 0xf2 & ~0x7], %r8
        ldx [%r25 + 0x48 & ~0x7], %r10
        ldx [%r23 + 0x4f & ~0x7], %r12
        ldx [%r24 + 0x2d & ~0x7], %r14
        ldx [%r26 + 0x62 & ~0x7], %r16
        ld [%r27 + 0xde & ~0x7], %f0
        ld [%r27 + 0xa & ~0x7], %f16
        ld [%r23 + 0xe0 & ~0x7], %f32
        ld [%r25 + 0xba & ~0x7], %f48
               ldsba [%r1]24, %r10
               ldsha [%r1]24, %r2
               ldswa [%r1]24, %r16
               lduba [%r1]24, %r8
               lduha [%r1]24, %r12
               ldxa [%r1]24, %r8
               ldda [%r1]24, %r6
               ldstuba [%r1]24, %r12
               swapa [%r1]24, %r2
               lda [%r1]24, %f48
               ldda [%r1]24, %f0
               stba %r6, [%r1]24
               stha %r4, [%r1]24
               stwa %r14, [%r1]24
               sta %f48, [%r1]24
               stda %f48, [%r1]24
casa  [%r1]0x18, %r2, %g0
casxa  [%r1]0x18, %r2, %g0
               prefetcha [%r1]24, 0x1f
CASE_ASI_0x19_th6:
  mov %r23, %r1
        ldx [%r23 + 0x8c & ~0x7], %r2
        ldx [%r24 + 0xaf & ~0x7], %r4
        ldx [%r21 + 0xb4 & ~0x7], %r6
        ldx [%r22 + 0x38 & ~0x7], %r8
        ldx [%r22 + 0xa1 & ~0x7], %r10
        ldx [%r24 + 0xa6 & ~0x7], %r12
        ldx [%r24 + 0x47 & ~0x7], %r14
        ldx [%r23 + 0xc6 & ~0x7], %r16
        ld [%r27 + 0x0 & ~0x7], %f0
        ld [%r24 + 0x71 & ~0x7], %f16
        ld [%r22 + 0x67 & ~0x7], %f32
        ld [%r27 + 0xa3 & ~0x7], %f48
               ldsba [%r1]25, %r8
               ldsha [%r1]25, %r2
               ldswa [%r1]25, %r14
               lduba [%r1]25, %r8
               lduha [%r1]25, %r8
               ldxa [%r1]25, %r12
               ldda [%r1]25, %r8
               ldstuba [%r1]25, %r10
               swapa [%r1]25, %r10
               lda [%r1]25, %f0
               ldda [%r1]25, %f16
               stba %r0, [%r1]25
               stha %r4, [%r1]25
               stwa %r12, [%r1]25
               sta %f32, [%r1]25
               stda %f32, [%r1]25
casa  [%r1]0x19, %r2, %g0
casxa  [%r1]0x19, %r2, %g0
               prefetcha [%r1]25, 0xf
CASE_ASI_0x80_th6:
  mov %r27, %r1
        ldx [%r25 + 0x1a & ~0x7], %r2
        ldx [%r25 + 0x41 & ~0x7], %r4
        ldx [%r21 + 0xce & ~0x7], %r6
        ldx [%r23 + 0xbd & ~0x7], %r8
        ldx [%r24 + 0x4c & ~0x7], %r10
        ldx [%r25 + 0x44 & ~0x7], %r12
        ldx [%r26 + 0xa8 & ~0x7], %r14
        ldx [%r25 + 0xca & ~0x7], %r16
        ld [%r23 + 0x7f & ~0x7], %f0
        ld [%r22 + 0xbb & ~0x7], %f16
        ld [%r24 + 0x69 & ~0x7], %f32
        ld [%r24 + 0xcd & ~0x7], %f48
               ldsba [%r1]128, %r2
               ldsha [%r1]128, %r10
               ldswa [%r1]128, %r2
               lduba [%r1]128, %r12
               lduha [%r1]128, %r2
               ldxa [%r1]128, %r4
               ldda [%r1]128, %r6
               ldstuba [%r1]128, %r16
               swapa [%r1]128, %r4
               lda [%r1]128, %f16
               ldda [%r1]128, %f48
               stba %r0, [%r1]128
               stha %r10, [%r1]128
               stwa %r10, [%r1]128
               sta %f32, [%r1]128
               stda %f48, [%r1]128
casa  [%r1]0x80, %r2, %g0
casxa  [%r1]0x80, %r2, %g0
               prefetcha [%r1]128, 0x19
CASE_ASI_0x81_th6:
  mov %r24, %r1
        ldx [%r23 + 0x3e & ~0x7], %r2
        ldx [%r28 + 0xe2 & ~0x7], %r4
        ldx [%r23 + 0xf0 & ~0x7], %r6
        ldx [%r22 + 0x0 & ~0x7], %r8
        ldx [%r21 + 0xa & ~0x7], %r10
        ldx [%r24 + 0x51 & ~0x7], %r12
        ldx [%r21 + 0x48 & ~0x7], %r14
        ldx [%r28 + 0x25 & ~0x7], %r16
        ld [%r26 + 0x7e & ~0x7], %f0
        ld [%r27 + 0x99 & ~0x7], %f16
        ld [%r23 + 0x43 & ~0x7], %f32
        ld [%r23 + 0x57 & ~0x7], %f48
               ldsba [%r1]129, %r4
               ldsha [%r1]129, %r4
               ldswa [%r1]129, %r10
               lduba [%r1]129, %r8
               lduha [%r1]129, %r10
               ldxa [%r1]129, %r6
               ldda [%r1]129, %r2
               ldstuba [%r1]129, %r12
               swapa [%r1]129, %r4
               lda [%r1]129, %f48
               ldda [%r1]129, %f0
               stba %r0, [%r1]129
               stha %r8, [%r1]129
               stwa %r14, [%r1]129
               sta %f0, [%r1]129
               stda %f32, [%r1]129
casa  [%r1]0x81, %r2, %g0
casxa  [%r1]0x81, %r2, %g0
               prefetcha [%r1]129, 0x6
CASE_ASI_0x82_th6:
  mov %r23, %r1
        ldx [%r21 + 0xb & ~0x7], %r2
        ldx [%r26 + 0x4c & ~0x7], %r4
        ldx [%r26 + 0x1f & ~0x7], %r6
        ldx [%r27 + 0x98 & ~0x7], %r8
        ldx [%r22 + 0x21 & ~0x7], %r10
        ldx [%r27 + 0xbc & ~0x7], %r12
        ldx [%r24 + 0xa7 & ~0x7], %r14
        ldx [%r25 + 0x66 & ~0x7], %r16
        ld [%r21 + 0x8a & ~0x7], %f0
        ld [%r22 + 0x65 & ~0x7], %f16
        ld [%r22 + 0x21 & ~0x7], %f32
        ld [%r24 + 0xd4 & ~0x7], %f48
               ldsba [%r1]130, %r16
               ldsha [%r1]130, %r6
               ldswa [%r1]130, %r12
               lduba [%r1]130, %r6
               lduha [%r1]130, %r8
               ldxa [%r1]130, %r2
               ldda [%r1]130, %r10
               ldstuba [%r1]130, %r8
               swapa [%r1]130, %r4
               lda [%r1]130, %f32
               ldda [%r1]130, %f0
               stba %r8, [%r1]130
               stha %r0, [%r1]130
               stwa %r4, [%r1]130
               sta %f32, [%r1]130
               stda %f48, [%r1]130
casa  [%r1]0x82, %r2, %g0
casxa  [%r1]0x82, %r2, %g0
               prefetcha [%r1]130, 0x7
CASE_ASI_0x83_th6:
  mov %r23, %r1
        ldx [%r23 + 0x6b & ~0x7], %r2
        ldx [%r22 + 0xb1 & ~0x7], %r4
        ldx [%r25 + 0x4c & ~0x7], %r6
        ldx [%r26 + 0xfd & ~0x7], %r8
        ldx [%r27 + 0x68 & ~0x7], %r10
        ldx [%r23 + 0x72 & ~0x7], %r12
        ldx [%r25 + 0x5 & ~0x7], %r14
        ldx [%r26 + 0x9 & ~0x7], %r16
        ld [%r28 + 0xd6 & ~0x7], %f0
        ld [%r24 + 0xee & ~0x7], %f16
        ld [%r28 + 0xc1 & ~0x7], %f32
        ld [%r25 + 0x31 & ~0x7], %f48
               ldsba [%r1]131, %r8
               ldsha [%r1]131, %r10
               ldswa [%r1]131, %r10
               lduba [%r1]131, %r4
               lduha [%r1]131, %r14
               ldxa [%r1]131, %r6
               ldda [%r1]131, %r12
               ldstuba [%r1]131, %r6
               swapa [%r1]131, %r16
               lda [%r1]131, %f16
               ldda [%r1]131, %f0
               stba %r2, [%r1]131
               stha %r8, [%r1]131
               stwa %r2, [%r1]131
               sta %f32, [%r1]131
               stda %f0, [%r1]131
casa  [%r1]0x83, %r2, %g0
casxa  [%r1]0x83, %r2, %g0
               prefetcha [%r1]131, 0x1b
CASE_ASI_0x88_th6:
  mov %r27, %r1
        ldx [%r24 + 0xc3 & ~0x7], %r2
        ldx [%r23 + 0x96 & ~0x7], %r4
        ldx [%r26 + 0xa9 & ~0x7], %r6
        ldx [%r23 + 0xab & ~0x7], %r8
        ldx [%r22 + 0x8a & ~0x7], %r10
        ldx [%r28 + 0x7b & ~0x7], %r12
        ldx [%r25 + 0xd5 & ~0x7], %r14
        ldx [%r27 + 0xdb & ~0x7], %r16
        ld [%r21 + 0x71 & ~0x7], %f0
        ld [%r24 + 0xb0 & ~0x7], %f16
        ld [%r26 + 0x6e & ~0x7], %f32
        ld [%r24 + 0x85 & ~0x7], %f48
               ldsba [%r1]136, %r6
               ldsha [%r1]136, %r16
               ldswa [%r1]136, %r4
               lduba [%r1]136, %r12
               lduha [%r1]136, %r4
               ldxa [%r1]136, %r6
               ldda [%r1]136, %r10
               ldstuba [%r1]136, %r6
               swapa [%r1]136, %r16
               lda [%r1]136, %f32
               ldda [%r1]136, %f0
               stba %r6, [%r1]136
               stha %r0, [%r1]136
               stwa %r2, [%r1]136
               sta %f16, [%r1]136
               stda %f32, [%r1]136
casa  [%r1]0x88, %r2, %g0
casxa  [%r1]0x88, %r2, %g0
               prefetcha [%r1]136, 0x1a
CASE_ASI_0x89_th6:
  mov %r25, %r1
        ldx [%r25 + 0xf0 & ~0x7], %r2
        ldx [%r24 + 0x43 & ~0x7], %r4
        ldx [%r23 + 0x2 & ~0x7], %r6
        ldx [%r21 + 0xb2 & ~0x7], %r8
        ldx [%r28 + 0x49 & ~0x7], %r10
        ldx [%r26 + 0x8b & ~0x7], %r12
        ldx [%r25 + 0xb8 & ~0x7], %r14
        ldx [%r28 + 0x8a & ~0x7], %r16
        ld [%r21 + 0xf7 & ~0x7], %f0
        ld [%r25 + 0x6 & ~0x7], %f16
        ld [%r28 + 0x7 & ~0x7], %f32
        ld [%r22 + 0x39 & ~0x7], %f48
               ldsba [%r1]137, %r14
               ldsha [%r1]137, %r14
               ldswa [%r1]137, %r10
               lduba [%r1]137, %r12
               lduha [%r1]137, %r4
               ldxa [%r1]137, %r16
               ldda [%r1]137, %r6
               ldstuba [%r1]137, %r4
               swapa [%r1]137, %r2
               lda [%r1]137, %f32
               ldda [%r1]137, %f0
               stba %r8, [%r1]137
               stha %r8, [%r1]137
               stwa %r8, [%r1]137
               sta %f16, [%r1]137
               stda %f32, [%r1]137
casa  [%r1]0x89, %r2, %g0
casxa  [%r1]0x89, %r2, %g0
               prefetcha [%r1]137, 0x1a
CASE_ASI_0x8a_th6:
  mov %r25, %r1
        ldx [%r28 + 0xd5 & ~0x7], %r2
        ldx [%r21 + 0xb2 & ~0x7], %r4
        ldx [%r27 + 0x7d & ~0x7], %r6
        ldx [%r28 + 0xb4 & ~0x7], %r8
        ldx [%r24 + 0x3a & ~0x7], %r10
        ldx [%r24 + 0x27 & ~0x7], %r12
        ldx [%r26 + 0x77 & ~0x7], %r14
        ldx [%r28 + 0xb6 & ~0x7], %r16
        ld [%r27 + 0x7a & ~0x7], %f0
        ld [%r28 + 0xd7 & ~0x7], %f16
        ld [%r27 + 0x59 & ~0x7], %f32
        ld [%r26 + 0x81 & ~0x7], %f48
               ldsba [%r1]138, %r14
               ldsha [%r1]138, %r14
               ldswa [%r1]138, %r8
               lduba [%r1]138, %r10
               lduha [%r1]138, %r14
               ldxa [%r1]138, %r2
               ldda [%r1]138, %r12
               ldstuba [%r1]138, %r10
               swapa [%r1]138, %r16
               lda [%r1]138, %f16
               ldda [%r1]138, %f0
               stba %r2, [%r1]138
               stha %r12, [%r1]138
               stwa %r6, [%r1]138
               sta %f48, [%r1]138
               stda %f16, [%r1]138
casa  [%r1]0x8a, %r2, %g0
casxa  [%r1]0x8a, %r2, %g0
               prefetcha [%r1]138, 0x19
CASE_ASI_0x8b_th6:
  mov %r25, %r1
        ldx [%r26 + 0xeb & ~0x7], %r2
        ldx [%r23 + 0x3a & ~0x7], %r4
        ldx [%r24 + 0x9a & ~0x7], %r6
        ldx [%r22 + 0x1 & ~0x7], %r8
        ldx [%r24 + 0xc1 & ~0x7], %r10
        ldx [%r21 + 0xb6 & ~0x7], %r12
        ldx [%r21 + 0x4a & ~0x7], %r14
        ldx [%r24 + 0x63 & ~0x7], %r16
        ld [%r28 + 0x74 & ~0x7], %f0
        ld [%r24 + 0x51 & ~0x7], %f16
        ld [%r26 + 0x3f & ~0x7], %f32
        ld [%r21 + 0xf9 & ~0x7], %f48
               ldsba [%r1]139, %r12
               ldsha [%r1]139, %r14
               ldswa [%r1]139, %r4
               lduba [%r1]139, %r8
               lduha [%r1]139, %r16
               ldxa [%r1]139, %r10
               ldda [%r1]139, %r2
               ldstuba [%r1]139, %r10
               swapa [%r1]139, %r6
               lda [%r1]139, %f32
               ldda [%r1]139, %f32
               stba %r6, [%r1]139
               stha %r12, [%r1]139
               stwa %r4, [%r1]139
               sta %f0, [%r1]139
               stda %f32, [%r1]139
casa  [%r1]0x8b, %r2, %g0
casxa  [%r1]0x8b, %r2, %g0
               prefetcha [%r1]139, 0x9
        nop
        nop
subcc	%r19, 1, %r19
cmp %r19, 2
bz,a TH6_LOOP
ta T_CHANGE_NONHPRIV
cmp %r19, 1
bz,a TH6_LOOP
ta T_CHANGE_PRIV
        nop 
        nop
       ba main_text_end
       nop
        nop
        nop
        nop
       LOOP_T7:
ta T_CHANGE_PRIV
 add %g0, 0x3, %r19
TH7_LOOP:
CASE_ASI_0x0_th7:
  wr %g0, 0x0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1_th7:
  wr %g0, 0x1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2_th7:
  wr %g0, 0x2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3_th7:
  wr %g0, 0x3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5_th7:
  wr %g0, 0x5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6_th7:
  wr %g0, 0x6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7_th7:
  wr %g0, 0x7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8_th7:
  wr %g0, 0x8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9_th7:
  wr %g0, 0x9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa_th7:
  wr %g0, 0xa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb_th7:
  wr %g0, 0xb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd_th7:
  wr %g0, 0xd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe_th7:
  wr %g0, 0xe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf_th7:
  wr %g0, 0xf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x12_th7:
  wr %g0, 0x12, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x13_th7:
  wr %g0, 0x13, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1a_th7:
  wr %g0, 0x1a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x1b_th7:
  wr %g0, 0x1b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x20_th7:
  wr %g0, 0x20, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x21_th7:
  wr %g0, 0x21, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x25_th7:
  wr %g0, 0x25, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x28_th7:
  wr %g0, 0x28, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x29_th7:
  wr %g0, 0x29, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x2d_th7:
  wr %g0, 0x2d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x32_th7:
  wr %g0, 0x32, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x33_th7:
  wr %g0, 0x33, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x34_th7:
  wr %g0, 0x34, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x35_th7:
  wr %g0, 0x35, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x37_th7:
  wr %g0, 0x37, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3a_th7:
  wr %g0, 0x3a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3b_th7:
  wr %g0, 0x3b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3c_th7:
  wr %g0, 0x3c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3d_th7:
  wr %g0, 0x3d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x3f_th7:
  wr %g0, 0x3f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x40_th7:
  wr %g0, 0x40, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x41_th7:
  wr %g0, 0x41, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x42_th7:
  wr %g0, 0x42, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x43_th7:
  wr %g0, 0x43, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x44_th7:
  wr %g0, 0x44, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x45_th7:
  wr %g0, 0x45, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x48_th7:
  wr %g0, 0x48, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x49_th7:
  wr %g0, 0x49, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4a_th7:
  wr %g0, 0x4a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4b_th7:
  wr %g0, 0x4b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4c_th7:
  wr %g0, 0x4c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4d_th7:
  wr %g0, 0x4d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4e_th7:
  wr %g0, 0x4e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x4f_th7:
  wr %g0, 0x4f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x50_th7:
  wr %g0, 0x50, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x51_th7:
  wr %g0, 0x51, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x52_th7:
  wr %g0, 0x52, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x53_th7:
  wr %g0, 0x53, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x56_th7:
  wr %g0, 0x56, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x57_th7:
  wr %g0, 0x57, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x58_th7:
  wr %g0, 0x58, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x59_th7:
  wr %g0, 0x59, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5a_th7:
  wr %g0, 0x5a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5b_th7:
  wr %g0, 0x5b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5e_th7:
  wr %g0, 0x5e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x5f_th7:
  wr %g0, 0x5f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x60_th7:
  wr %g0, 0x60, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x61_th7:
  wr %g0, 0x61, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x62_th7:
  wr %g0, 0x62, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x63_th7:
  wr %g0, 0x63, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x64_th7:
  wr %g0, 0x64, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x65_th7:
  wr %g0, 0x65, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x68_th7:
  wr %g0, 0x68, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x69_th7:
  wr %g0, 0x69, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6a_th7:
  wr %g0, 0x6a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6b_th7:
  wr %g0, 0x6b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6c_th7:
  wr %g0, 0x6c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6d_th7:
  wr %g0, 0x6d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6e_th7:
  wr %g0, 0x6e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x6f_th7:
  wr %g0, 0x6f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x70_th7:
  wr %g0, 0x70, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x71_th7:
  wr %g0, 0x71, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x72_th7:
  wr %g0, 0x72, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x74_th7:
  wr %g0, 0x74, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x75_th7:
  wr %g0, 0x75, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x76_th7:
  wr %g0, 0x76, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x77_th7:
  wr %g0, 0x77, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x78_th7:
  wr %g0, 0x78, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x79_th7:
  wr %g0, 0x79, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7a_th7:
  wr %g0, 0x7a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7b_th7:
  wr %g0, 0x7b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7c_th7:
  wr %g0, 0x7c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7d_th7:
  wr %g0, 0x7d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7e_th7:
  wr %g0, 0x7e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x7f_th7:
  wr %g0, 0x7f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x84_th7:
  wr %g0, 0x84, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x85_th7:
  wr %g0, 0x85, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x86_th7:
  wr %g0, 0x86, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x87_th7:
  wr %g0, 0x87, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8c_th7:
  wr %g0, 0x8c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8d_th7:
  wr %g0, 0x8d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8e_th7:
  wr %g0, 0x8e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x8f_th7:
  wr %g0, 0x8f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x90_th7:
  wr %g0, 0x90, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x91_th7:
  wr %g0, 0x91, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x92_th7:
  wr %g0, 0x92, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x93_th7:
  wr %g0, 0x93, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x94_th7:
  wr %g0, 0x94, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x95_th7:
  wr %g0, 0x95, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x96_th7:
  wr %g0, 0x96, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x97_th7:
  wr %g0, 0x97, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x98_th7:
  wr %g0, 0x98, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x99_th7:
  wr %g0, 0x99, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9a_th7:
  wr %g0, 0x9a, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9b_th7:
  wr %g0, 0x9b, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9c_th7:
  wr %g0, 0x9c, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9d_th7:
  wr %g0, 0x9d, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9e_th7:
  wr %g0, 0x9e, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x9f_th7:
  wr %g0, 0x9f, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa0_th7:
  wr %g0, 0xa0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa1_th7:
  wr %g0, 0xa1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa2_th7:
  wr %g0, 0xa2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa3_th7:
  wr %g0, 0xa3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa4_th7:
  wr %g0, 0xa4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa5_th7:
  wr %g0, 0xa5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa6_th7:
  wr %g0, 0xa6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa7_th7:
  wr %g0, 0xa7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa8_th7:
  wr %g0, 0xa8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xa9_th7:
  wr %g0, 0xa9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaa_th7:
  wr %g0, 0xaa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xab_th7:
  wr %g0, 0xab, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xac_th7:
  wr %g0, 0xac, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xad_th7:
  wr %g0, 0xad, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xae_th7:
  wr %g0, 0xae, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xaf_th7:
  wr %g0, 0xaf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb0_th7:
  wr %g0, 0xb0, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb1_th7:
  wr %g0, 0xb1, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb2_th7:
  wr %g0, 0xb2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb3_th7:
  wr %g0, 0xb3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb4_th7:
  wr %g0, 0xb4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb5_th7:
  wr %g0, 0xb5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb6_th7:
  wr %g0, 0xb6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb7_th7:
  wr %g0, 0xb7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb8_th7:
  wr %g0, 0xb8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xb9_th7:
  wr %g0, 0xb9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xba_th7:
  wr %g0, 0xba, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbb_th7:
  wr %g0, 0xbb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbc_th7:
  wr %g0, 0xbc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbd_th7:
  wr %g0, 0xbd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbe_th7:
  wr %g0, 0xbe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xbf_th7:
  wr %g0, 0xbf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc6_th7:
  wr %g0, 0xc6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xc7_th7:
  wr %g0, 0xc7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xce_th7:
  wr %g0, 0xce, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xcf_th7:
  wr %g0, 0xcf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd4_th7:
  wr %g0, 0xd4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd5_th7:
  wr %g0, 0xd5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd6_th7:
  wr %g0, 0xd6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xd7_th7:
  wr %g0, 0xd7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdc_th7:
  wr %g0, 0xdc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdd_th7:
  wr %g0, 0xdd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xde_th7:
  wr %g0, 0xde, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xdf_th7:
  wr %g0, 0xdf, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe4_th7:
  wr %g0, 0xe4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe5_th7:
  wr %g0, 0xe5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe6_th7:
  wr %g0, 0xe6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe7_th7:
  wr %g0, 0xe7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe8_th7:
  wr %g0, 0xe8, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xe9_th7:
  wr %g0, 0xe9, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xec_th7:
  wr %g0, 0xec, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xed_th7:
  wr %g0, 0xed, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xee_th7:
  wr %g0, 0xee, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xef_th7:
  wr %g0, 0xef, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf2_th7:
  wr %g0, 0xf2, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf3_th7:
  wr %g0, 0xf3, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf4_th7:
  wr %g0, 0xf4, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf5_th7:
  wr %g0, 0xf5, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf6_th7:
  wr %g0, 0xf6, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xf7_th7:
  wr %g0, 0xf7, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfa_th7:
  wr %g0, 0xfa, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfb_th7:
  wr %g0, 0xfb, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfc_th7:
  wr %g0, 0xfc, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfd_th7:
  wr %g0, 0xfd, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xfe_th7:
  wr %g0, 0xfe, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0xff_th7:
  wr %g0, 0xff, %asi
  ldxa [0x0] %asi, %l0
  stxa %l0, [0x0] %asi
CASE_ASI_0x46_th7:
  wr %g0, 0x46, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x47_th7:
  wr %g0, 0x47, %asi
  stxa %g0, [0x0] %asi
  ldxa [0x0] %asi, %l0
CASE_ASI_0x4_th7:
  mov %r25, %r1
        ldx [%r23 + 0x2d & ~0x7], %r2
        ldx [%r27 + 0xde & ~0x7], %r4
        ldx [%r28 + 0x9c & ~0x7], %r6
        ldx [%r24 + 0x59 & ~0x7], %r8
        ldx [%r23 + 0x39 & ~0x7], %r10
        ldx [%r22 + 0x5a & ~0x7], %r12
        ldx [%r27 + 0x95 & ~0x7], %r14
        ldx [%r25 + 0x2d & ~0x7], %r16
        ld [%r27 + 0xd1 & ~0x7], %f0
        ld [%r22 + 0x5 & ~0x7], %f16
        ld [%r23 + 0x50 & ~0x7], %f32
        ld [%r21 + 0x5e & ~0x7], %f48
               ldsba [%r1]4, %r14
               ldsha [%r1]4, %r8
               ldswa [%r1]4, %r8
               lduba [%r1]4, %r12
               lduha [%r1]4, %r12
               ldxa [%r1]4, %r8
               ldda [%r1]4, %r16
               ldstuba [%r1]4, %r4
               swapa [%r1]4, %r10
               lda [%r1]4, %f16
               ldda [%r1]4, %f16
               stba %r10, [%r1]4
               stha %r4, [%r1]4
               stwa %r0, [%r1]4
               sta %f0, [%r1]4
               stda %f16, [%r1]4
casa  [%r1]0x4, %r2, %g0
casxa  [%r1]0x4, %r2, %g0
               prefetcha [%r1]4, 0x18
CASE_ASI_0xc_th7:
  mov %r28, %r1
        ldx [%r24 + 0xfb & ~0x7], %r2
        ldx [%r23 + 0x6d & ~0x7], %r4
        ldx [%r27 + 0x76 & ~0x7], %r6
        ldx [%r23 + 0x10 & ~0x7], %r8
        ldx [%r23 + 0x93 & ~0x7], %r10
        ldx [%r25 + 0x27 & ~0x7], %r12
        ldx [%r27 + 0xad & ~0x7], %r14
        ldx [%r27 + 0x8f & ~0x7], %r16
        ld [%r21 + 0xb1 & ~0x7], %f0
        ld [%r27 + 0x54 & ~0x7], %f16
        ld [%r27 + 0x8 & ~0x7], %f32
        ld [%r23 + 0xf7 & ~0x7], %f48
               ldsba [%r1]12, %r10
               ldsha [%r1]12, %r10
               ldswa [%r1]12, %r8
               lduba [%r1]12, %r16
               lduha [%r1]12, %r12
               ldxa [%r1]12, %r2
               ldda [%r1]12, %r16
               ldstuba [%r1]12, %r12
               swapa [%r1]12, %r14
               lda [%r1]12, %f48
               ldda [%r1]12, %f16
               stba %r12, [%r1]12
               stha %r12, [%r1]12
               stwa %r2, [%r1]12
               sta %f16, [%r1]12
               stda %f16, [%r1]12
casa  [%r1]0xc, %r2, %g0
casxa  [%r1]0xc, %r2, %g0
               prefetcha [%r1]12, 0x12
CASE_ASI_0x10_th7:
  mov %r26, %r1
        ldx [%r25 + 0xb5 & ~0x7], %r2
        ldx [%r21 + 0x5f & ~0x7], %r4
        ldx [%r24 + 0xd7 & ~0x7], %r6
        ldx [%r22 + 0xe0 & ~0x7], %r8
        ldx [%r27 + 0x70 & ~0x7], %r10
        ldx [%r25 + 0xfa & ~0x7], %r12
        ldx [%r22 + 0xcd & ~0x7], %r14
        ldx [%r27 + 0xc6 & ~0x7], %r16
        ld [%r26 + 0xea & ~0x7], %f0
        ld [%r27 + 0x85 & ~0x7], %f16
        ld [%r25 + 0x28 & ~0x7], %f32
        ld [%r28 + 0x14 & ~0x7], %f48
               ldsba [%r1]16, %r6
               ldsha [%r1]16, %r12
               ldswa [%r1]16, %r8
               lduba [%r1]16, %r8
               lduha [%r1]16, %r12
               ldxa [%r1]16, %r6
               ldda [%r1]16, %r16
               ldstuba [%r1]16, %r16
               swapa [%r1]16, %r2
               lda [%r1]16, %f32
               ldda [%r1]16, %f16
               stba %r6, [%r1]16
               stha %r14, [%r1]16
               stwa %r12, [%r1]16
               sta %f32, [%r1]16
               stda %f32, [%r1]16
casa  [%r1]0x10, %r2, %g0
casxa  [%r1]0x10, %r2, %g0
               prefetcha [%r1]16, 0x1
CASE_ASI_0x11_th7:
  mov %r28, %r1
        ldx [%r23 + 0x4f & ~0x7], %r2
        ldx [%r21 + 0x3b & ~0x7], %r4
        ldx [%r23 + 0xd4 & ~0x7], %r6
        ldx [%r22 + 0xe7 & ~0x7], %r8
        ldx [%r21 + 0xe0 & ~0x7], %r10
        ldx [%r24 + 0xe & ~0x7], %r12
        ldx [%r25 + 0x76 & ~0x7], %r14
        ldx [%r28 + 0x3f & ~0x7], %r16
        ld [%r28 + 0x16 & ~0x7], %f0
        ld [%r27 + 0x6c & ~0x7], %f16
        ld [%r24 + 0x9e & ~0x7], %f32
        ld [%r26 + 0xe6 & ~0x7], %f48
               ldsba [%r1]17, %r4
               ldsha [%r1]17, %r2
               ldswa [%r1]17, %r10
               lduba [%r1]17, %r10
               lduha [%r1]17, %r2
               ldxa [%r1]17, %r12
               ldda [%r1]17, %r6
               ldstuba [%r1]17, %r16
               swapa [%r1]17, %r2
               lda [%r1]17, %f32
               ldda [%r1]17, %f16
               stba %r4, [%r1]17
               stha %r14, [%r1]17
               stwa %r8, [%r1]17
               sta %f32, [%r1]17
               stda %f32, [%r1]17
casa  [%r1]0x11, %r2, %g0
casxa  [%r1]0x11, %r2, %g0
               prefetcha [%r1]17, 0xd
CASE_ASI_0x18_th7:
  mov %r28, %r1
        ldx [%r25 + 0xd0 & ~0x7], %r2
        ldx [%r27 + 0xd4 & ~0x7], %r4
        ldx [%r25 + 0x46 & ~0x7], %r6
        ldx [%r24 + 0xa & ~0x7], %r8
        ldx [%r21 + 0xe & ~0x7], %r10
        ldx [%r27 + 0xba & ~0x7], %r12
        ldx [%r23 + 0x1f & ~0x7], %r14
        ldx [%r23 + 0x37 & ~0x7], %r16
        ld [%r27 + 0xf4 & ~0x7], %f0
        ld [%r25 + 0x81 & ~0x7], %f16
        ld [%r27 + 0x3d & ~0x7], %f32
        ld [%r27 + 0x8c & ~0x7], %f48
               ldsba [%r1]24, %r2
               ldsha [%r1]24, %r14
               ldswa [%r1]24, %r16
               lduba [%r1]24, %r8
               lduha [%r1]24, %r6
               ldxa [%r1]24, %r12
               ldda [%r1]24, %r14
               ldstuba [%r1]24, %r4
               swapa [%r1]24, %r14
               lda [%r1]24, %f0
               ldda [%r1]24, %f32
               stba %r14, [%r1]24
               stha %r10, [%r1]24
               stwa %r8, [%r1]24
               sta %f48, [%r1]24
               stda %f0, [%r1]24
casa  [%r1]0x18, %r2, %g0
casxa  [%r1]0x18, %r2, %g0
               prefetcha [%r1]24, 0x17
CASE_ASI_0x19_th7:
  mov %r27, %r1
        ldx [%r26 + 0x64 & ~0x7], %r2
        ldx [%r27 + 0x98 & ~0x7], %r4
        ldx [%r23 + 0x28 & ~0x7], %r6
        ldx [%r24 + 0x98 & ~0x7], %r8
        ldx [%r25 + 0x2c & ~0x7], %r10
        ldx [%r27 + 0x55 & ~0x7], %r12
        ldx [%r23 + 0xa6 & ~0x7], %r14
        ldx [%r27 + 0x9 & ~0x7], %r16
        ld [%r26 + 0x6d & ~0x7], %f0
        ld [%r28 + 0xd9 & ~0x7], %f16
        ld [%r23 + 0xf7 & ~0x7], %f32
        ld [%r21 + 0x1b & ~0x7], %f48
               ldsba [%r1]25, %r2
               ldsha [%r1]25, %r10
               ldswa [%r1]25, %r14
               lduba [%r1]25, %r2
               lduha [%r1]25, %r2
               ldxa [%r1]25, %r6
               ldda [%r1]25, %r2
               ldstuba [%r1]25, %r12
               swapa [%r1]25, %r4
               lda [%r1]25, %f32
               ldda [%r1]25, %f16
               stba %r6, [%r1]25
               stha %r4, [%r1]25
               stwa %r12, [%r1]25
               sta %f48, [%r1]25
               stda %f48, [%r1]25
casa  [%r1]0x19, %r2, %g0
casxa  [%r1]0x19, %r2, %g0
               prefetcha [%r1]25, 0x16
CASE_ASI_0x80_th7:
  mov %r21, %r1
        ldx [%r22 + 0xd9 & ~0x7], %r2
        ldx [%r28 + 0xdf & ~0x7], %r4
        ldx [%r21 + 0x9a & ~0x7], %r6
        ldx [%r26 + 0xf4 & ~0x7], %r8
        ldx [%r24 + 0x43 & ~0x7], %r10
        ldx [%r24 + 0x73 & ~0x7], %r12
        ldx [%r26 + 0xbc & ~0x7], %r14
        ldx [%r25 + 0x49 & ~0x7], %r16
        ld [%r26 + 0x91 & ~0x7], %f0
        ld [%r28 + 0x3a & ~0x7], %f16
        ld [%r21 + 0x5e & ~0x7], %f32
        ld [%r21 + 0xb8 & ~0x7], %f48
               ldsba [%r1]128, %r4
               ldsha [%r1]128, %r14
               ldswa [%r1]128, %r10
               lduba [%r1]128, %r8
               lduha [%r1]128, %r6
               ldxa [%r1]128, %r4
               ldda [%r1]128, %r4
               ldstuba [%r1]128, %r10
               swapa [%r1]128, %r16
               lda [%r1]128, %f32
               ldda [%r1]128, %f48
               stba %r2, [%r1]128
               stha %r8, [%r1]128
               stwa %r6, [%r1]128
               sta %f0, [%r1]128
               stda %f0, [%r1]128
casa  [%r1]0x80, %r2, %g0
casxa  [%r1]0x80, %r2, %g0
               prefetcha [%r1]128, 0x6
CASE_ASI_0x81_th7:
  mov %r27, %r1
        ldx [%r27 + 0x6a & ~0x7], %r2
        ldx [%r27 + 0xde & ~0x7], %r4
        ldx [%r28 + 0x43 & ~0x7], %r6
        ldx [%r22 + 0xa1 & ~0x7], %r8
        ldx [%r27 + 0xa8 & ~0x7], %r10
        ldx [%r26 + 0xd7 & ~0x7], %r12
        ldx [%r21 + 0x9c & ~0x7], %r14
        ldx [%r26 + 0x56 & ~0x7], %r16
        ld [%r26 + 0xf7 & ~0x7], %f0
        ld [%r22 + 0x91 & ~0x7], %f16
        ld [%r23 + 0xc8 & ~0x7], %f32
        ld [%r27 + 0x50 & ~0x7], %f48
               ldsba [%r1]129, %r10
               ldsha [%r1]129, %r14
               ldswa [%r1]129, %r4
               lduba [%r1]129, %r4
               lduha [%r1]129, %r6
               ldxa [%r1]129, %r12
               ldda [%r1]129, %r16
               ldstuba [%r1]129, %r10
               swapa [%r1]129, %r6
               lda [%r1]129, %f0
               ldda [%r1]129, %f48
               stba %r8, [%r1]129
               stha %r14, [%r1]129
               stwa %r4, [%r1]129
               sta %f48, [%r1]129
               stda %f16, [%r1]129
casa  [%r1]0x81, %r2, %g0
casxa  [%r1]0x81, %r2, %g0
               prefetcha [%r1]129, 0x1f
CASE_ASI_0x82_th7:
  mov %r23, %r1
        ldx [%r22 + 0x19 & ~0x7], %r2
        ldx [%r27 + 0x63 & ~0x7], %r4
        ldx [%r24 + 0x36 & ~0x7], %r6
        ldx [%r25 + 0x9e & ~0x7], %r8
        ldx [%r28 + 0x17 & ~0x7], %r10
        ldx [%r25 + 0x54 & ~0x7], %r12
        ldx [%r22 + 0x12 & ~0x7], %r14
        ldx [%r27 + 0xfd & ~0x7], %r16
        ld [%r27 + 0x42 & ~0x7], %f0
        ld [%r28 + 0xd8 & ~0x7], %f16
        ld [%r24 + 0x4c & ~0x7], %f32
        ld [%r22 + 0x8b & ~0x7], %f48
               ldsba [%r1]130, %r4
               ldsha [%r1]130, %r14
               ldswa [%r1]130, %r16
               lduba [%r1]130, %r12
               lduha [%r1]130, %r6
               ldxa [%r1]130, %r10
               ldda [%r1]130, %r10
               ldstuba [%r1]130, %r10
               swapa [%r1]130, %r2
               lda [%r1]130, %f0
               ldda [%r1]130, %f32
               stba %r10, [%r1]130
               stha %r2, [%r1]130
               stwa %r0, [%r1]130
               sta %f48, [%r1]130
               stda %f32, [%r1]130
casa  [%r1]0x82, %r2, %g0
casxa  [%r1]0x82, %r2, %g0
               prefetcha [%r1]130, 0x8
CASE_ASI_0x83_th7:
  mov %r26, %r1
        ldx [%r22 + 0xa7 & ~0x7], %r2
        ldx [%r22 + 0xde & ~0x7], %r4
        ldx [%r27 + 0x11 & ~0x7], %r6
        ldx [%r24 + 0xf3 & ~0x7], %r8
        ldx [%r27 + 0xaf & ~0x7], %r10
        ldx [%r27 + 0x47 & ~0x7], %r12
        ldx [%r23 + 0xa3 & ~0x7], %r14
        ldx [%r26 + 0xa7 & ~0x7], %r16
        ld [%r23 + 0x6b & ~0x7], %f0
        ld [%r26 + 0xc3 & ~0x7], %f16
        ld [%r23 + 0x91 & ~0x7], %f32
        ld [%r26 + 0x64 & ~0x7], %f48
               ldsba [%r1]131, %r16
               ldsha [%r1]131, %r2
               ldswa [%r1]131, %r14
               lduba [%r1]131, %r16
               lduha [%r1]131, %r2
               ldxa [%r1]131, %r12
               ldda [%r1]131, %r6
               ldstuba [%r1]131, %r6
               swapa [%r1]131, %r14
               lda [%r1]131, %f48
               ldda [%r1]131, %f32
               stba %r14, [%r1]131
               stha %r12, [%r1]131
               stwa %r6, [%r1]131
               sta %f16, [%r1]131
               stda %f32, [%r1]131
casa  [%r1]0x83, %r2, %g0
casxa  [%r1]0x83, %r2, %g0
               prefetcha [%r1]131, 0x19
CASE_ASI_0x88_th7:
  mov %r22, %r1
        ldx [%r22 + 0x9c & ~0x7], %r2
        ldx [%r21 + 0x8e & ~0x7], %r4
        ldx [%r27 + 0xb7 & ~0x7], %r6
        ldx [%r28 + 0xd6 & ~0x7], %r8
        ldx [%r23 + 0xf8 & ~0x7], %r10
        ldx [%r25 + 0xd7 & ~0x7], %r12
        ldx [%r27 + 0x33 & ~0x7], %r14
        ldx [%r23 + 0x39 & ~0x7], %r16
        ld [%r25 + 0x5 & ~0x7], %f0
        ld [%r25 + 0x7a & ~0x7], %f16
        ld [%r27 + 0xa7 & ~0x7], %f32
        ld [%r27 + 0x2c & ~0x7], %f48
               ldsba [%r1]136, %r2
               ldsha [%r1]136, %r6
               ldswa [%r1]136, %r4
               lduba [%r1]136, %r2
               lduha [%r1]136, %r16
               ldxa [%r1]136, %r14
               ldda [%r1]136, %r4
               ldstuba [%r1]136, %r8
               swapa [%r1]136, %r16
               lda [%r1]136, %f32
               ldda [%r1]136, %f16
               stba %r14, [%r1]136
               stha %r14, [%r1]136
               stwa %r6, [%r1]136
               sta %f16, [%r1]136
               stda %f32, [%r1]136
casa  [%r1]0x88, %r2, %g0
casxa  [%r1]0x88, %r2, %g0
               prefetcha [%r1]136, 0x14
CASE_ASI_0x89_th7:
  mov %r24, %r1
        ldx [%r25 + 0xf8 & ~0x7], %r2
        ldx [%r21 + 0x91 & ~0x7], %r4
        ldx [%r27 + 0xa2 & ~0x7], %r6
        ldx [%r21 + 0xe8 & ~0x7], %r8
        ldx [%r24 + 0xce & ~0x7], %r10
        ldx [%r21 + 0x2e & ~0x7], %r12
        ldx [%r23 + 0x28 & ~0x7], %r14
        ldx [%r25 + 0x31 & ~0x7], %r16
        ld [%r28 + 0x8f & ~0x7], %f0
        ld [%r28 + 0x95 & ~0x7], %f16
        ld [%r21 + 0xa3 & ~0x7], %f32
        ld [%r23 + 0x33 & ~0x7], %f48
               ldsba [%r1]137, %r16
               ldsha [%r1]137, %r6
               ldswa [%r1]137, %r4
               lduba [%r1]137, %r14
               lduha [%r1]137, %r10
               ldxa [%r1]137, %r10
               ldda [%r1]137, %r4
               ldstuba [%r1]137, %r4
               swapa [%r1]137, %r16
               lda [%r1]137, %f32
               ldda [%r1]137, %f32
               stba %r14, [%r1]137
               stha %r8, [%r1]137
               stwa %r6, [%r1]137
               sta %f16, [%r1]137
               stda %f48, [%r1]137
casa  [%r1]0x89, %r2, %g0
casxa  [%r1]0x89, %r2, %g0
               prefetcha [%r1]137, 0x15
CASE_ASI_0x8a_th7:
  mov %r23, %r1
        ldx [%r23 + 0x53 & ~0x7], %r2
        ldx [%r22 + 0xec & ~0x7], %r4
        ldx [%r24 + 0xf & ~0x7], %r6
        ldx [%r22 + 0x97 & ~0x7], %r8
        ldx [%r28 + 0x5c & ~0x7], %r10
        ldx [%r28 + 0xb4 & ~0x7], %r12
        ldx [%r27 + 0x24 & ~0x7], %r14
        ldx [%r23 + 0x1d & ~0x7], %r16
        ld [%r26 + 0xb3 & ~0x7], %f0
        ld [%r27 + 0x44 & ~0x7], %f16
        ld [%r24 + 0x63 & ~0x7], %f32
        ld [%r22 + 0xb1 & ~0x7], %f48
               ldsba [%r1]138, %r12
               ldsha [%r1]138, %r12
               ldswa [%r1]138, %r12
               lduba [%r1]138, %r4
               lduha [%r1]138, %r6
               ldxa [%r1]138, %r16
               ldda [%r1]138, %r2
               ldstuba [%r1]138, %r8
               swapa [%r1]138, %r4
               lda [%r1]138, %f0
               ldda [%r1]138, %f32
               stba %r0, [%r1]138
               stha %r2, [%r1]138
               stwa %r6, [%r1]138
               sta %f16, [%r1]138
               stda %f0, [%r1]138
casa  [%r1]0x8a, %r2, %g0
casxa  [%r1]0x8a, %r2, %g0
               prefetcha [%r1]138, 0x13
CASE_ASI_0x8b_th7:
  mov %r28, %r1
        ldx [%r22 + 0xcf & ~0x7], %r2
        ldx [%r27 + 0x39 & ~0x7], %r4
        ldx [%r23 + 0x5 & ~0x7], %r6
        ldx [%r23 + 0xf2 & ~0x7], %r8
        ldx [%r26 + 0x66 & ~0x7], %r10
        ldx [%r21 + 0x26 & ~0x7], %r12
        ldx [%r24 + 0xd1 & ~0x7], %r14
        ldx [%r27 + 0xf5 & ~0x7], %r16
        ld [%r22 + 0x1 & ~0x7], %f0
        ld [%r25 + 0x92 & ~0x7], %f16
        ld [%r21 + 0x10 & ~0x7], %f32
        ld [%r23 + 0x79 & ~0x7], %f48
               ldsba [%r1]139, %r8
               ldsha [%r1]139, %r4
               ldswa [%r1]139, %r14
               lduba [%r1]139, %r12
               lduha [%r1]139, %r6
               ldxa [%r1]139, %r12
               ldda [%r1]139, %r4
               ldstuba [%r1]139, %r16
               swapa [%r1]139, %r8
               lda [%r1]139, %f16
               ldda [%r1]139, %f16
               stba %r4, [%r1]139
               stha %r12, [%r1]139
               stwa %r2, [%r1]139
               sta %f16, [%r1]139
               stda %f48, [%r1]139
casa  [%r1]0x8b, %r2, %g0
casxa  [%r1]0x8b, %r2, %g0
               prefetcha [%r1]139, 0x15
        nop
        nop
        nop 
subcc	%r19, 1, %r19
cmp %r19, 2
bz,a TH7_LOOP
ta T_CHANGE_NONPRIV
cmp %r19, 1
bz,a TH7_LOOP
ta T_CHANGE_HPRIV
        nop
        nop
main_text_end:
        ta %icc, T_GOOD_TRAP
        nop
        nop
        nop
main_data_start:
	.xword  0x1594076459a469bf
	.xword  0x142d72f7783a5811
	.xword  0x66a60b0b4154ec66
	.xword  0x245062772a7f5c85
	.xword  0x2a1575e62857f9a8
	.xword  0x3ef5aa8f1bbe9015
	.xword  0x6fea8d2a352394e8
	.xword  0x506988355109f46f
SECTION .CPPRI_SEG0 DATA_VA = 0x0000005abcc00000
 attr_data {
        Name = .CPPRI_SEG0,
	VA	= 0x0000005abcc00000,
	RA	= 0x0000005123400000,
	PA	= ra2pa(0x0000005123400000,0),
  part_0_ctx_zero_tsb_config_1,
  part_0_ctx_nonzero_tsb_config_1,
  TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
  TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
  TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
 }
attr_data {
 NAME = .CPPRI_SEG0,
 hypervisor
}
.data
.global SEC_CPPRI0_DATA_START
SEC_CPPRI0_DATA_START:
       .xword  0x2e85976131c20d77
       .xword  0x4699fd7f1a09fd30
       .xword  0x53301aef6b119b55
       .xword  0x04dadc424ef46f6e
       .xword  0x27af3b403e81c617
       .xword  0x3c51a04c56006872
       .xword  0x6ac67e9109ad17e4
       .xword  0x49127339732edd83
       .xword  0x5d04e6574f53be99
       .xword  0x24f353f6122206dd
SECTION .CPPRI_SEG1 DATA_VA = 0x0000005abcc10000
 attr_data {
        Name = .CPPRI_SEG1,
	VA	= 0x0000005abcc10000,
	RA	= 0x0000005123410000,
	PA	= ra2pa(0x0000005123410000,0),
  part_0_ctx_zero_tsb_config_1,
  part_0_ctx_nonzero_tsb_config_1,
  TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
  TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
  TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
 }
attr_data {
 NAME = .CPPRI_SEG1,
 hypervisor
}
.data
.global SEC_CPPRI1_DATA_START
SEC_CPPRI1_DATA_START:
       .xword  0x2eaae44f2da3dd0d
       .xword  0x622ffbd07db347c1
       .xword  0x6596562334866e6e
       .xword  0x18c8bb38731e45a6
       .xword  0x7b8a51b64bf3bdca
       .xword  0x43b028152011008d
       .xword  0x087b2c0d504093aa
       .xword  0x31ff17c646dbde72
       .xword  0x3e63c4d93d055bd9
       .xword  0x0223feb36f79bbde
SECTION .CPPRI_SEG2 DATA_VA = 0x0000005abcc20000
 attr_data {
        Name = .CPPRI_SEG2,
	VA	= 0x0000005abcc20000,
	RA	= 0x0000005123420000,
	PA	= ra2pa(0x0000005123420000,0),
  part_0_ctx_zero_tsb_config_1,
  part_0_ctx_nonzero_tsb_config_1,
  TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
  TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
  TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
 }
attr_data {
 NAME = .CPPRI_SEG2,
 hypervisor
}
.data
.global SEC_CPPRI2_DATA_START
SEC_CPPRI2_DATA_START:
       .xword  0x6b2fc0a578d2a542
       .xword  0x68fa6f8e5e573399
       .xword  0x0a16fb98607a7df7
       .xword  0x7689142c7bc16f7d
       .xword  0x7b011ee87e6c4d4e
       .xword  0x417019fa53d7f467
       .xword  0x18cce2dc1998ee26
       .xword  0x1e77ac1d5be1fb46
       .xword  0x2545277b09aeeb47
       .xword  0x42cdb52a661f0955
SECTION .CPPRI_SEG3 DATA_VA = 0x0000005abcc30000
 attr_data {
        Name = .CPPRI_SEG3,
	VA	= 0x0000005abcc30000,
	RA	= 0x0000005123430000,
	PA	= ra2pa(0x0000005123430000,0),
  part_0_ctx_zero_tsb_config_1,
  part_0_ctx_nonzero_tsb_config_1,
  TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
  TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
  TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
 }
attr_data {
 NAME = .CPPRI_SEG3,
 hypervisor
}
.data
.global SEC_CPPRI3_DATA_START
SEC_CPPRI3_DATA_START:
       .xword  0x2bc6add6185adfe7
       .xword  0x36fbc27f21b39965
       .xword  0x4cbbdbef5eb61e49
       .xword  0x2211833c244dc853
       .xword  0x20c095457b4dde80
       .xword  0x158dfce14bab169a
       .xword  0x7916d1fd0a4f5752
       .xword  0x42d92f867d677101
       .xword  0x6cb53eae52894338
       .xword  0x5c4183b1748ed275
SECTION .CPPRI_SEG4 DATA_VA = 0x0000005abcc40000
 attr_data {
        Name = .CPPRI_SEG4,
	VA	= 0x0000005abcc40000,
	RA	= 0x0000005123440000,
	PA	= ra2pa(0x0000005123440000,0),
  part_0_ctx_zero_tsb_config_1,
  part_0_ctx_nonzero_tsb_config_1,
  TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
  TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
  TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
 }
attr_data {
 NAME = .CPPRI_SEG4,
 hypervisor
}
.data
.global SEC_CPPRI4_DATA_START
SEC_CPPRI4_DATA_START:
       .xword  0x0043cec91d397381
       .xword  0x490bfbd7616df0f1
       .xword  0x786ecba46c253395
       .xword  0x53dbc3722e338799
       .xword  0x5fb78a215b655e57
       .xword  0x5c2555bb013aefe7
       .xword  0x1bf290ff16bb27a4
       .xword  0x782b16052571dbfc
       .xword  0x269599bd2b50bbf9
       .xword  0x78c4d3b65d562418
SECTION .CPPRI_SEG5 DATA_VA = 0x0000005abcc50000
 attr_data {
        Name = .CPPRI_SEG5,
	VA	= 0x0000005abcc50000,
	RA	= 0x0000005123450000,
	PA	= ra2pa(0x0000005123450000,0),
  part_0_ctx_zero_tsb_config_1,
  part_0_ctx_nonzero_tsb_config_1,
  TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
  TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
  TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
 }
attr_data {
 NAME = .CPPRI_SEG5,
 hypervisor
}
.data
.global SEC_CPPRI5_DATA_START
SEC_CPPRI5_DATA_START:
       .xword  0x2a7476262e98f831
       .xword  0x189153e262a5b925
       .xword  0x3032847e1bb39b6b
       .xword  0x3cc89a853b29ee6e
       .xword  0x291efc47566f750a
       .xword  0x58574d5d33286c6d
       .xword  0x010cfdb003da30d6
       .xword  0x7dd72a6243173ec1
       .xword  0x679ced9b2c65833f
       .xword  0x57fe2be305568f3e
SECTION .CPPRI_SEG6 DATA_VA = 0x0000005abcc60000
 attr_data {
        Name = .CPPRI_SEG6,
	VA	= 0x0000005abcc60000,
	RA	= 0x0000005123460000,
	PA	= ra2pa(0x0000005123460000,0),
  part_0_ctx_zero_tsb_config_1,
  part_0_ctx_nonzero_tsb_config_1,
  TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
  TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
  TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
 }
attr_data {
 NAME = .CPPRI_SEG6,
 hypervisor
}
.data
.global SEC_CPPRI6_DATA_START
SEC_CPPRI6_DATA_START:
       .xword  0x5efb484a152397c2
       .xword  0x31dd943f7909c01f
       .xword  0x41f1b4a52098c365
       .xword  0x6263bb3c41d2b756
       .xword  0x37e9c22a2a3e9d5c
       .xword  0x3ca71707744d4d04
       .xword  0x57cd5b714a34bfce
       .xword  0x1e2e9ac871d5ef05
       .xword  0x1927975b3add92b1
       .xword  0x155324e13285aba2
SECTION .CPPRI_SEG7 DATA_VA = 0x0000005abcc70000
 attr_data {
        Name = .CPPRI_SEG7,
	VA	= 0x0000005abcc70000,
	RA	= 0x0000005123470000,
	PA	= ra2pa(0x0000005123470000,0),
  part_0_ctx_zero_tsb_config_1,
  part_0_ctx_nonzero_tsb_config_1,
  TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
  TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
  TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
 }
attr_data {
 NAME = .CPPRI_SEG7,
 hypervisor
}
.data
.global SEC_CPPRI7_DATA_START
SEC_CPPRI7_DATA_START:
       .xword  0x7e2932d73469a2d1
       .xword  0x7d9756c44b7ef56a
       .xword  0x5bde9d5018ba26f0
       .xword  0x6a0ed06e1cc9921a
       .xword  0x1c9a21b61cab7508
       .xword  0x744369840a3146b9
       .xword  0x41f356287ce249ac
       .xword  0x7016a2085501f2c1
       .xword  0x08659c3b7fc2e38c
       .xword  0x5c8724b84a34ec77
