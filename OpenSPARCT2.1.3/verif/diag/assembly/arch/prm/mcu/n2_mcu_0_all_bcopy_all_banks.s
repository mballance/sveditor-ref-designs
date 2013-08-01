/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_mcu_0_all_bcopy_all_banks.s
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
#define         srcaddr         %i0
#define         dstaddr         %i1
#define         count           %i2
#define         thread_offset   %i3
#define         ASI_BLK_P       0xf0

! Define number of 64 byte subblocks to copy
#define SBLKS 128

! How far ahead is the prefetch stream (in subblocks)
#define FETCH_AHEAD 8

#include "hboot.s"

.global main

.text
main:
	wr      %g0, 0x4, %fprs         /* make sure fef is 1 */
	ta       %icc, T_RD_THID
	!thread in within core become fbd dimm addr bits
	and %o1, 7, %g2
	sllx %g2, 34, thread_offset
	!core id bits become 16MB offset with fbd dimm
	and %o1, 0x38, %g2
	sllx %g2, 22, %g2
	or %g2, thread_offset, thread_offset
setup_addresses:
	setx in_stream, %g2, srcaddr
	!setx out_stream, %g2, dstaddr
	setx 0x100000000, %g2, dstaddr
	add  dstaddr, thread_offset, dstaddr
	alignaddr       srcaddr, %g0, srcaddr

! COUNT bytes to copy
!--------------------
	set SBLKS, count
      !  mulx count, 8*8, count
	setx do_bcopy, %g2, %g3
	jmpl %g3, %g0
	rd %pc, %g7

	/*{{{  4->5*/
	setx 0x100000000, %g2, srcaddr
	add  srcaddr, thread_offset, srcaddr
	alignaddr       srcaddr, %g0, srcaddr

	setx 0x100500000, %g2, dstaddr
	add  dstaddr, thread_offset, dstaddr

	set SBLKS, count
	!  mulx count, 8*8, count

	setx do_bcopy, %g2, %g3
	jmpl %g3, %g0
	rd %pc, %g7
	/*}}}  */
	/*{{{  5->5.8*/
	setx 0x100500000, %g2, srcaddr
	add  srcaddr, thread_offset, srcaddr
	alignaddr       srcaddr, %g0, srcaddr

	setx 0x100580000, %g2, dstaddr
	add  dstaddr, thread_offset, dstaddr

	set SBLKS, count
	!  mulx count, 8*8, count

	setx do_bcopy, %g2, %g3
	jmpl %g3, %g0
	rd %pc, %g7
	/*}}}  */
	/*{{{  5.8->6*/
	setx 0x100580000, %g2, srcaddr
	add  srcaddr, thread_offset, srcaddr
	alignaddr       srcaddr, %g0, srcaddr

	setx 0x100600000, %g2, dstaddr
	add  dstaddr, thread_offset, dstaddr

	set SBLKS, count
	!  mulx count, 8*8, count

	setx do_bcopy, %g2, %g3
	jmpl %g3, %g0
	rd %pc, %g7
	/*}}}  */
	/*{{{  6->6.8*/
	setx 0x100600000, %g2, srcaddr
	add  srcaddr, thread_offset, srcaddr
	alignaddr       srcaddr, %g0, srcaddr

	setx 0x100680000, %g2, dstaddr
	add  dstaddr, thread_offset, dstaddr

	set SBLKS, count
	!  mulx count, 8*8, count

	setx do_bcopy, %g2, %g3
	jmpl %g3, %g0
	rd %pc, %g7
	/*}}}  */
	/*{{{  6.8>7*/
	setx 0x100680000, %g2, srcaddr
	add  srcaddr, thread_offset, srcaddr
	alignaddr       srcaddr, %g0, srcaddr

	setx 0x100700000, %g2, dstaddr
	add  dstaddr, thread_offset, dstaddr

	set SBLKS, count
	!  mulx count, 8*8, count

	setx do_bcopy, %g2, %g3
	jmpl %g3, %g0
	rd %pc, %g7
	/*}}}  */

trap:

	ta GOOD_TRAP

do_bcopy:
#ifdef FPU_COPY
/*{{{  */
! the initial part (preamble) of bcopy.
!--------------------------------------
	prefetch        [srcaddr + 0*64], 1
	prefetch        [srcaddr + 1*64], 1
	prefetch        [srcaddr + 2*64], 1
	prefetch        [srcaddr + 3*64], 1
	ldd             [srcaddr + 0*8], %f0
	prefetch        [srcaddr + 4*64], 1
#if FETCH_AHEAD>=4
	prefetch        [srcaddr + (4+1)*64], 1
#endif
#if FETCH_AHEAD>=5
	prefetch        [srcaddr + (5+1)*64], 1
#endif
#if FETCH_AHEAD>=6
	prefetch        [srcaddr + (6+1)*64], 1
#endif
#if FETCH_AHEAD>=7
	prefetch        [srcaddr + (7+1)*64], 1
#endif
	ldd             [srcaddr + 1*8], %f2
	ldd             [srcaddr + 2*8], %f4
	faligndata      %f0, %f2, %f32
	ldd             [srcaddr + 3*8], %f6
	faligndata      %f2, %f4, %f34
	ldd             [srcaddr + 4*8], %f8
	faligndata      %f4, %f6, %f36
	ldd             [srcaddr + 5*8], %f10
	faligndata      %f6, %f8, %f38
	ldd             [srcaddr + 6*8], %f12
	faligndata      %f8, %f10, %f40
	ldd             [srcaddr + 7*8], %f14
	faligndata      %f10, %f12, %f42
	ldd             [srcaddr + 8*8], %f16
#if FETCH_AHEAD>=8
	prefetch        [srcaddr + (8+1)*64], 1
#endif
	subcc           count, 64, count
	be,pn   %xcc,tidy_up
	 add            srcaddr, 64, srcaddr

! the loop (the essence of bcopy)
!--------------------------------
timing_loop:
	fmovd           %f16, %f0
	ldd             [srcaddr + 1*8], %f2
	faligndata      %f12, %f14, %f44
	ldd             [srcaddr + 2*8], %f4
	faligndata      %f14, %f0, %f46
	stda            %f32, [dstaddr]ASI_BLK_P
	ldd             [srcaddr + 3*8], %f6
	faligndata      %f0, %f2, %f32
	ldd             [srcaddr + 4*8], %f8
	faligndata      %f2, %f4, %f34
	ldd             [srcaddr + 5*8], %f10
	faligndata      %f4, %f6, %f36
	ldd             [srcaddr + 6*8], %f12
	faligndata      %f6, %f8, %f38
	ldd             [srcaddr + 7*8], %f14
	faligndata      %f8, %f10, %f40
	ldd             [srcaddr + 8*8], %f16
	prefetch        [srcaddr + (FETCH_AHEAD+1)*64], 1
	faligndata      %f10, %f12, %f42
	subcc           count, 64, count
	add             dstaddr, 64, dstaddr
	bg,pt %xcc,timing_loop
	 add            srcaddr, 64, srcaddr

! the last part of bcopy
! should handle the remaining partial block here
!-----------------------------------------------
tidy_up:
	fmovd           %f16, %f0
	faligndata      %f12, %f14, %f44
	faligndata      %f14, %f0, %f46
	stda            %f32, [dstaddr]ASI_BLK_P
	membar #Sync
/*}}}  */
#else
/*{{{  */
timing_loop0:
ldda    [srcaddr] 0xe2,  %l0
add     srcaddr, 0x10, srcaddr
ldda    [srcaddr] 0xe2,  %l2
add     srcaddr, 0x10, srcaddr
ldda    [srcaddr] 0xe2,  %l4
add     srcaddr, 0x10, srcaddr
ldda    [srcaddr] 0xe2,  %l6
add     srcaddr, 0x10, srcaddr
stxa    %l0,    [dstaddr] 0xe2
add     dstaddr, 0x8, dstaddr
stxa    %l1,    [dstaddr] 0xe2
add     dstaddr, 0x8, dstaddr
stxa    %l2,    [dstaddr] 0xe2
add     dstaddr, 0x8, dstaddr
stxa    %l3,    [dstaddr] 0xe2
add     dstaddr, 0x8, dstaddr
stxa    %l4,    [dstaddr] 0xe2
add     dstaddr, 0x8, dstaddr
stxa    %l5,    [dstaddr] 0xe2
add     dstaddr, 0x8, dstaddr
stxa    %l6,    [dstaddr] 0xe2
add     dstaddr, 0x8, dstaddr
stxa    %l7,    [dstaddr] 0xe2
add     dstaddr, 0x8, dstaddr

subcc count, 64, count
bg,pt %xcc,timing_loop0
nop
/*}}}  */
#endif

	jmp %g7
	nop

user_text_end:

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.global in_stream
.global out_stream

.data
.align  0x40
user_data_start:

.skip   0x40
in_stream:
	init_mem(0x20100000, SBLKS*16, 4, +, 0, +, 0x01010001)

! offset the out_stream block
.align 0x1000
.skip 1024      
.skip 192
out_stream:
	init_mem(0x11111111, SBLKS*16, 4, +, 0, +, 0)

user_data_end:



/*{{{  0*/
SECTION data_page0 DATA_VA=0x100000000
attr_data {
	Name = data_page0,
	VA=0x100000000,
	RA=0x100000000,
	PA=ra2pa(0x100000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=5,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}
.data
.skip 1024
.word 0x0
.skip 1024
/*}}}  */
/*{{{  1*/
SECTION data_page1 DATA_VA=0x500000000
attr_data {
	Name = data_page1,
	VA=0x500000000,
	RA=0x500000000,
	PA=ra2pa(0x500000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=5,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}
.data
.skip 1024
.word 0x0
.skip 1024
/*}}}  */
/*{{{  2*/
SECTION data_page2 DATA_VA=0x900000000
attr_data {
	Name = data_page2,
	VA=0x900000000,
	RA=0x900000000,
	PA=ra2pa(0x900000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=5,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}
.data
.skip 1024
.word 0x0
.skip 1024
/*}}}  */
/*{{{  3*/
SECTION data_page3 DATA_VA=0xd00000000
attr_data {
	Name = data_page3,
	VA=0xd00000000,
	RA=0xd00000000,
	PA=ra2pa(0xd00000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=5,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}
.data
.skip 1024
.word 0x0
.skip 1024
/*}}}  */
/*{{{  4*/
SECTION data_page4 DATA_VA=0x1100000000
attr_data {
	Name = data_page4,
	VA=0x1100000000,
	RA=0x1100000000,
	PA=ra2pa(0x1100000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=5,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}
.data
.skip 1024
.word 0x0
.skip 1024
/*}}}  */
/*{{{  5*/
SECTION data_page5 DATA_VA=0x1500000000
attr_data {
	Name = data_page5,
	VA=0x1500000000,
	RA=0x1500000000,
	PA=ra2pa(0x1500000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=5,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}
.data
.skip 1024
.word 0x0
.skip 1024
/*}}}  */
/*{{{  6*/
SECTION data_page6 DATA_VA=0x1900000000
attr_data {
	Name = data_page6,
	VA=0x1900000000,
	RA=0x1900000000,
	PA=ra2pa(0x1900000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=5,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}
.data
.skip 1024
.word 0x0
.skip 1024
/*}}}  */
/*{{{  7*/
SECTION data_page7 DATA_VA=0x1d00000000
attr_data {
	Name = data_page7,
	VA=0x1d00000000,
	RA=0x1d00000000,
	PA=ra2pa(0x1d00000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=5,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}
.data
.skip 1024
.word 0x0
.skip 1024
/*}}}  */

