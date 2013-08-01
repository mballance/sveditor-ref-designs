/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_err_mcu_int.s
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

#define CMP_FBD_SYND 0x0

#include "hboot.s"
#include "asi_s.h"

#define L20 0x0000134000
#define L21 0x0000134040

#define L22 0x0000134080
#define L23 0x00001340c0

#define L24 0x0000134100
#define L25 0x0000134140

#define L26 0x0000134180
#define L27 0x00001341c0

#ifdef MCU0
#define	DRAM_FBR_CNT_REG_PA		DRAM_FBR_CNT_REG_PA_0
#define DRAM_ERR_CNT_REG_PA     	DRAM_ERR_CNT_REG_PA_0

#define DRAM_FBD_ERR_SYND_REG_PA        DRAM_FBD_ERR_SYND_REG_PA_0
#define DRAM_FBD_INJ_ERR_SRC_REG_PA     DRAM_FBD_INJ_ERR_SRC_REG_PA_0

#define  DRAM_ERR_INJ_REG   		0x8400000290
#define  DRAM_ERR_STAT_REG  		0x8400000280
#define  L2_ERR_STAT_REG    		0xAB00000000
#define  L2_ERR_ADDR_REG    		0xAC00000000
#endif

#ifdef MCU1
#define DRAM_FBR_CNT_REG_PA     	DRAM_FBR_CNT_REG_PA_1
#define DRAM_ERR_CNT_REG_PA     	DRAM_ERR_CNT_REG_PA_1

#define DRAM_FBD_ERR_SYND_REG_PA        DRAM_FBD_ERR_SYND_REG_PA_1
#define DRAM_FBD_INJ_ERR_SRC_REG_PA     DRAM_FBD_INJ_ERR_SRC_REG_PA_1

#define  DRAM_ERR_INJ_REG   		0x8400001290
#define  DRAM_ERR_STAT_REG  		0x8400001280
#define  L2_ERR_STAT_REG    		0xAB00000080
#define  L2_ERR_ADDR_REG    		0xAC00000080
#endif

#ifdef MCU2
#define DRAM_FBR_CNT_REG_PA     	DRAM_FBR_CNT_REG_PA_2
#define DRAM_ERR_CNT_REG_PA     	DRAM_ERR_CNT_REG_PA_2

#define DRAM_FBD_ERR_SYND_REG_PA        DRAM_FBD_ERR_SYND_REG_PA_2
#define DRAM_FBD_INJ_ERR_SRC_REG_PA     DRAM_FBD_INJ_ERR_SRC_REG_PA_2

#define  DRAM_ERR_INJ_REG   		0x8400002290
#define  DRAM_ERR_STAT_REG  		0x8400002280
#define  L2_ERR_STAT_REG    		0xAB00000100
#define  L2_ERR_ADDR_REG    		0xAC00000100
#endif

#ifdef MCU3
#define DRAM_FBR_CNT_REG_PA     	DRAM_FBR_CNT_REG_PA_3
#define	DRAM_ERR_CNT_REG_PA		DRAM_ERR_CNT_REG_PA_3

#define DRAM_FBD_ERR_SYND_REG_PA	DRAM_FBD_ERR_SYND_REG_PA_3
#define DRAM_FBD_INJ_ERR_SRC_REG_PA 	DRAM_FBD_INJ_ERR_SRC_REG_PA_3


#define  DRAM_ERR_INJ_REG   		0x8400003290
#define  DRAM_ERR_STAT_REG  		0x8400003280
#define  L2_ERR_STAT_REG    		0xAB00000180
#define  L2_ERR_ADDR_REG    		0xAC00000180
#endif

#ifdef ECC 
#define CMP_ECC_CNT	0x0
#else
#define CMP_ECC_CNT     0x1
#endif

#ifdef L2_OFF
#define L2_ON_OFF_DM	0x1
#else
#define L2_ON_OFF_DM    0x0
#endif
 
.text
.global	 main

main:
  ta	  T_CHANGE_HPRIV


L2_on_off_dm:
        setx  L2CS_PA0, %l6, %g1
	ldx   [%g1], %o1

	setx  0xfffffffffffffffc, %l6, %i1	! <1:0>=00
	and   %i1, %o1, %o2
	
        mov   L2_ON_OFF_DM, %l0
	or    %o2, %l0, %l1

        stx   %l1, [%g1]

	nop
	membar #Sync

write_mcu_fbr_count_reg:
	set	0x10000, %g6		!<16>=countone=1
	setx	DRAM_FBR_CNT_REG_PA, %l7, %o2
	stx     %g6, [%o2]
	ldx     [%o2], %i1


set_error_count_reg:
        set     0x1, %g6            !<16>=countone=1
        setx    DRAM_ERR_CNT_REG_PA, %l7, %o2
        stx     %g6, [%o2]

clear_soc_esr:
        setx    SOC_ESR_REG, %l7, %g5
        stx     %g0, [%g5]

clear_l2_esr:
        setx    L2_ERR_STAT_REG, %l7, %g5
        stx     %g0, [%g5]

clear_mcu_esr:
        setx    DRAM_ERR_STAT_REG, %l7, %g5
        stx     %g0, [%g5]

clear_l2_ear_0:
        setx    L2_ERR_ADDR_REG, %l7, %g5
        stx     %g0, [%g5]

clear_fbd_err_synd:
        setx    DRAM_FBD_ERR_SYND_REG_PA, %l7, %g5
        stx     %g0, [%g5]


#ifdef FBR
set_inj_err_src_reg:
	set	INJ_ERR_SRC, %g1
	setx	DRAM_FBD_INJ_ERR_SRC_REG_PA, %l7, %g3
	stx	%g1, [%g3]
	nop; nop; nop; nop
        nop; nop; nop; nop
	nop; nop; nop; nop
	nop; nop; nop; nop
	nop; nop; nop; nop
	nop; nop; nop; nop
	nop; nop; nop; nop
	nop; nop; nop; nop
	nop; nop; nop; nop
	ldx	[%g3], %g7
	nop; nop; nop; nop
        nop; nop; nop; nop
        nop; nop; nop; nop
        nop; nop; nop; nop
        nop; nop; nop; nop
        nop; nop; nop; nop
        nop; nop; nop; nop
        nop; nop; nop; nop
        nop; nop; nop; nop
        nop; nop; nop; nop
        nop; nop; nop; nop
        nop; nop; nop; nop
        nop; nop; nop; nop
	membar 0x40
#endif

set_ejr:
        set     0x1, %g1
        sllx    %g1, ERR_FIELD, %g2
        setx    SOC_EJR_REG, %l7, %g3
        stx     %g2, [%g3]
        membar 0x40

L2_Init:
        setx	0x1111111111111110, %g7, %o0
	setx	0x2222222222222220, %g7, %o1
	setx	0x3333333333333330, %g7, %o2
	setx	0x4444444444444440, %g7, %o3
	setx	0x5555555555555550, %g7, %o4
	setx	0x6666666666666660, %g7, %o5
	setx	0x8888888888888880, %g7, %o6
	setx	0x9999999999999990, %g7, %o7

	setx	L20, %g7, %l0
	setx	L21, %g7, %l1

	setx	L22, %g7, %l2
	setx	L23, %g7, %l3

	setx	L24, %g7, %l4
	setx	L25, %g7, %l5

	setx	L26, %g7, %l6
	setx	L27, %g7, %l7

L2_0:
     	stx	%o0, [%l0]
	ldx	[%l0], %g1

L2_1:
     	stx	%o1, [%l1]
	ldx	[%l1], %g1

L2_2:
     	stx	%o2, [%l2]
	ldx	[%l2], %g1

L2_3:
     	stx	%o3, [%l3]
	ldx	[%l3], %g1

L2_4:
     	stx	%o4, [%l4]
	ldx	[%l4], %g1

L2_5:
     	stx	%o5, [%l5]
	ldx	[%l5], %g1

L2_6:
     	stx	%o6, [%l6]
	ldx	[%l6], %g1

L2_7:
     	stx	%o7, [%l7]
	ldx	[%l7], %g1

	membar 0x40

next_line:
	add	%l0, 0x40, %l0
        add     %l1, 0x40, %l1
        add     %l2, 0x40, %l2
        add     %l3, 0x40, %l3
        add     %l4, 0x40, %l4
        add     %l5, 0x40, %l5
        add     %l6, 0x40, %l6
        add     %l7, 0x40, %l7

L2_4_again:
                stx     %o4, [%l4]
        ldx     [%l4], %g1

L2_5_again:
                stx     %o5, [%l5]
        ldx     [%l5], %g1

L2_6_again:
                stx     %o6, [%l6]
        ldx     [%l6], %g1

L2_7_again:
        stx     %o7, [%l7]
        ldx     [%l7], %g1

L2_0_again:
     	stx	%o0, [%l0]
	ldx	[%l0], %g1

L2_1_again:
        stx	%o1, [%l1]
	ldx	[%l1], %g1

L2_2_again:
     	stx	%o2, [%l2]
	ldx	[%l2], %g1

L2_3_again:
	stx	%o3, [%l3]
	ldx	[%l3], %g1


	membar 0x40

read_ncu_esr:
        setx    SOC_ESR_REG, %l7, %g5
        ldx     [%g5], %i1
	nop
        setx    0x8000000000000000, %l7, %g7    !valid bit
        set     0x1, %g1
        sllx    %g1, ERR_FIELD, %g2     
        or      %g7, %g2, %i3      
        sub     %i1, %i3, %i4
        brnz    %i4, test_fail
        nop

#ifdef ECC 
check_mcu_esr:
	mov   	0x1, %l1
	sllx  	%l1, DRAM_ES_DAC, %g2

/*
	mov	0x1, %l1
	sllx	%l1, DRAM_ES_MEC, %l2

	or	%l0, %l2, %l6
*/	
!	set   	0x2000, %l3      ! 16-bit Syndrome - for SECC, it's the mask nibble-reversed
!	or    	%l0, %l3, %l0            ! %l0 has expected value

	setx  	DRAM_ERR_STAT_REG, %l3, %g5  
	ldx   	[%g5], %l1

        setx  	0xbfffffffffff0000, %l3, %l0
        andcc 	%l0, %l1, %l5                   ! Donot check L2ESR SYND bits and MEC

        subcc	%l5, %g2, %i4
        brnz    %i4, test_fail
        nop

check_L2_ESR_0:
	setx  	L2_ERR_STAT_REG, %l3, %g5  
	ldx   	[%g5], %l6

	setx  	0xbffffffff0000000, %l3, %l0
	andcc 	%l0, %l6, %l5                   ! Donot check L2ESR SYND and MEC bits

	mov   	0x1, %l1
	sllx  	%l1, L2ES_DAC, %l0

	mov   	0x1, %l1
	sllx  	%l1, L2ES_VEC, %l2

        or    	%l0, %l2, %i4

/*
        mov   	0x1, %l1
        sllx  	%l1, L2ES_MEC, %i3

	or    	%i3, %i4, %i5
*/
	subcc	%l5, %i4, %o5
	brnz	%o5, test_fail
	nop


ch_L2_addr:
	setx  	L2_ERR_ADDR_REG, %l3, %g5  
	ldx   	[%g5], %l1
	membar 	0x40

#endif

#ifdef FBR 
check_mcu_esr:
        mov     0x1, %l1
        sllx    %l1, DRAM_ES_FBR, %l6

        setx    DRAM_ERR_STAT_REG, %l3, %g5  
        ldx     [%g5], %l1

        setx    0xbfffffffffff0000, %l3, %l0
        andcc   %l0, %l1, %l5                   ! Donot check SYND bits and MEC

        subcc   %l5, %l6, %i4
        brnz    %i4, test_fail
        nop

read_fbd_err_synd_reg:
        setx    DRAM_FBD_ERR_SYND_REG_PA, %l7, %o2
        ldx     [%o2], %g1

        setx    0x8000000000000000, %l7, %o3
        set     0x1, %o4
        sll     %o4, FBSYND, %o5
        or      %o3, %o5, %g2

        and     %g1, %g2, %g3
        subcc   %g2, %g3, %g4
        brnz    %g4, test_fail
        nop

#endif


check_fbr_cnt_reg:
        setx    DRAM_FBR_CNT_REG_PA, %l7, %o2
	ldx	[%o2], %g1
        set     0x10000, %g6            !<16>=countone=1
	subcc   %g1, %g6, %i4
        brnz    %i4, test_fail
        nop


check_err_cnt_reg:
        setx    DRAM_ERR_CNT_REG_PA, %l7, %o2
        ldx     [%o2], %g1
	set	CMP_ECC_CNT, %i1
        subcc   %g1, %i1, %i4
        brnz    %i4, test_fail
        nop



	nop

/******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP


test_fail:
ta  T_BAD_TRAP



