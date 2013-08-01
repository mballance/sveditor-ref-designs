/*
! $id: tpccsyn4.s 1.7 2003/08/15 17:52:25 ms144771 Exp $
!
!  Copyright (C) 2005 by Sun Microsystems, Inc.
!
!  All rights reserved. No part of this design may be reproduced,
!  stored in a retrieval system, or transmitted, in any form or by
!  any means, electronic, mechanical, photocopying, recording, or
!  otherwise, without prior written permission of Sun Microsystems,
!  Inc.
!
!  Sun Proprietary/Confidential
!
!  Created:            09/02/03
!  Author:             Manish Shah (manish.shah@sun.com)
!		       Heavily modified by Greg Grohoski from highfp1.s
!  Description:        Power virus diag
!                     
!  Primary Contact:    Greg Grohoski
*/

/* Initialization  */
#define MAIN_PAGE_HV_ALSO
#include "hboot.s"
#define PORTABLE_CORE
 
!SIMS+ARGS: -midas_args=-allow_tsb_conflicts

#include "asi_s.h"
#define N_TIMES 0x1
!#define N_SPU_TIMES 0x1fffff
!#define N_SPU_TIMES 0x4ff
!#define EXIT_GOOD rdpr %cwp,%g1;sub %g1,1,%g1;wrpr %g1,0,%cwp;done;nop;
!#define EXIT_BAD  rdpr %cwp,%g1;sub %g1,1,%g1;wrpr %g1,0,%cwp;done;nop;
/*#define TEST add %g0,0x5a5,%g1;stx %g0,[%g0];done;nop;*/
!#define TEST rdpr %cwp,%g1;add %g1,1,%g1;wrpr %g1,0,%cwp;wr %g0,0x4,%fprs
#define TEST 

!#define loop_cnt 0x2ffff
!#define loop_cnt_2 0x4ffff
!#define loop_cnt_3 0x3fff

!SIMS+ARGS: -midas_args=-allow_tsb_conflicts
		
/************************************************************************
   Test case code start
 ************************************************************************/


.global main

main:           /* test begin */

!#      setx  0x9a00000000, %g1, %g2
!#    lduw [%g2], %l6
!#    umul      %l6, 2048, %l7
!#      setx    DIAG_DATA_AREA, %g1, %g3
!#      setx    user_data_start, %g1, %g3

!#      add     %l7, %g3, %l7

        !# Switch to hpriv mode
        ta T_CHANGE_HPRIV

        !# Turn off power management! (set by boot code)
        wr %g0, 0x4e, %asi
        stxa %g0, [%g0] %asi
        
/*	setx 0xffffffffffffffff,%g1,%g2;
	setx 	t0_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t1_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t2_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t3_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t3_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t4_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t5_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t6_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t7_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t8_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t9_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t10_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t11_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t12_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t13_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t14_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t15_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t16_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t17_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t18_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t19_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t20_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t21_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t22_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t23_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t24_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t25_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t26_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t27_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t28_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t29_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t30_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t31_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t32_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t33_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t33_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t34_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t35_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t36_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t37_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t38_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t39_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t40_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t41_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t42_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t43_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t44_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t45_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t46_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t47_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t48_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t49_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t50_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t51_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t52_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t53_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t54_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t55_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t56_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t57_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t58_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t59_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t60_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t61_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
	setx 	t62_blk_area,%g1,%g3;
	stxa	%g2,[%g3] 0xe2
	setx 	t63_blk_area,%g1,%g3;
	stxa	%g0,[%g3] 0xe2
*/

	th_fork(main_th,%l0);
#include "n0_c0_test4_noSpu.s"
#include "n0_c1_test4_noSpu.s"
#include "n0_c2_test4_noSpu.s"
#include "n0_c3_test4_noSpu.s"
#include "n0_c4_test4_noSpu.s"
#include "n0_c5_test4_noSpu.s"
#include "n0_c6_test4_noSpu.s"
#include "n0_c7_test4_noSpu.s"

