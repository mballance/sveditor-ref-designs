/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mcu_trap.s
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
My_H_HT0_Hw_Corrected_Error_0x63:
    inc %o7 !keep count of traps taken

read_core_desr_0x63:
    clr %g5 !use as intermediate register for setx
    ldxa [%g0] 0x4c, %g1 !read DESR
    srlx %g1, 61, %g2 !check if SWR or HWC
    and %g2, 1, %g2
    cmp %g2, 1
     be %xcc, test_fail
    nop
    srlx %g1, 56, %g2
    and %g2, 0x1f, %g2
    cmp %g2, 4
     ble %xcc, 1f ! branch to I$
    nop
    cmp %g2, 8
     ble %xcc, 2f ! branch to D$
    nop
    cmp %g2, 9
     bne %xcc, test_fail
    nop
    ba 3f ! branch normal, first check L2 esr, then check MCU esr
    nop
1:
    and %g1, 0x7ff, %g2
    sllx %g2, 6, %g2 !index is in bits 11:6 of load_addr
    ldxa [%g2] 0x67, %g3 !ASI_ICACHE_TAG
    mov 8, %g7
1:
    ldxa [%g2] 0x66, %g3 !ASI_ICACHE_INSTR
    add %g2, 8, %g2
    dec %g7
    brnz %g7, 1b
    nop
    ba 3f
    nop
2:
    and %g1, 0x7ff, %g2
    sllx %g2, 4, %g2 !index is in bits 10:4 of load_addr
    ldxa [%g2] 0x47, %g3 !ASI_DCACHE_TAG
    mov 1, %g4
    sllx %g4, 13, %g4
    ldxa [%g2+%g4] 0x46, %g3 !ASI_DCACHE_DATA
    add %g4, 8, %g4
    ldxa [%g2+%g4] 0x46, %g3 !ASI_DCACHE_DATA


! find which L2 bank logged error
3:
find_l2_bank_0x63:
    !need to find bank
    setx L2_ERROR_STATUS_REGISTER, %g5, %g4
    mov %g4, %o0 !copy to be used later
    setx L2_LAST_ERROR_STATUS_REGISTER, %g5, %g6
    mov 8, %o1
1:
read_l2_bank_esr_0x63:
    ldx [%g4], %g7

#ifdef ECC_CE
    mov 1, %g2
    sllx %g2, 42, %g2 !DAC
    and %g2, %g7, %g3
    cmp %g2, %g3
     be %xcc, 1f
    nop
#endif
#ifdef CRC_RE
    mov 1, %g2
    sllx %g2, 38, %g2 !DSC
    and %g2, %g7, %g3
    cmp %g2, %g3
     be %xcc, 1f
    nop
#endif
#ifdef SCRUB_CE
    mov 1, %g2
    sllx %g2, 38, %g2 !DSC
    and %g2, %g7, %g3
    cmp %g2, %g3
     be %xcc, 1f
    nop
#endif

    add %g4, 0x40, %g4
    dec %o1
    brnz %o1,1b
    nop
    ba test_fail
    nop

! find which MCU logged error
1:
find_mcu_0x63:
    sub %g4, %o0, %o1
    and %o1, 0x180, %g2 !which MCU it is coming from
    mov %g0, %g3
1:
    cmp %g2, %g3
     be %xcc, 1f
    nop
    add %g3, 0x80, %g3
    ba 1b
    nop
1:
    udivx %g3, 0x80, %g3
    setx 0x1000, %g5, %g1
    mulx %g3, %g1, %g3
    setx DRAM_ERROR_STATUS_REGISTER, %g5, %g6
    add %g3, %g6, %g6

read_mcu_esr_0x63:
    ldx [%g6], %g7

#ifdef ECC_CE
    mov 1, %g2
    sllx %g2, 61, %g2 !DAC
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
    setx 0xffff, %g5, %g2 !check MCU ECC synd
    and %g2, %g7, %g1
    cmp %g0, %g1                ! MSA 11/30/06: confirm that MCU SYND is non Zero
     be %xcc, test_fail
    nop
    setx DRAM_ERROR_RETRY_REGISTER, %g5, %g2
    add %g3, %g2, %g2
    ldx [%g2], %g1
    !and %g1, 0x3, %g1
    !cmp %g1, 2
     !bne test_fail             ! MSA 11/30/06 DRAM_ERROR_RETRY_REGISTER check is disabled
    !nop
    setx VALID_BIT, %g5, %g1
    stx %g1, [%g2]
#endif
#ifdef CRC_RE
    mov 1, %g2
    sllx %g2, 54, %g2 !FBR
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop

check_fbd_synd_reg_0x63:        ! MSA 11/30/06; added label
    setx DRAM_FBD_ERROR_SYNDROME_REGISTER, %g5, %g2
    add %g3, %g2, %g2
    ldx [%g2], %g1
#ifdef CRC_NB
    and %g1, 0x1, %g1
#endif
#ifdef CRC_SB
    and %g1, 0x2, %g1
#endif
    cmp %g0, %g1
     be test_fail
    nop
!11/30/06    setx VALID_BIT, %g5, %g1
!11/30/06    stx %g1, [%g2]

#ifdef CRC_SB
clear_amb_reg_0x63:
	!First AMB Error Reg
	!channel 0
	setx	0x8400000900, %g5, %g3
	set	0x190, %g4
	stx	%g4, [%g3]

	setx    0x8400000908, %g5, %g3
	set	0xff, %g4
        stx     %g4, [%g3]

        !channel 1
	setx    0x8400000900, %g5, %g3
	set	0x8190, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !Second AMB Error Reg
        !channel 0
	setx    0x8400000900, %g5, %g3
	set	0x194, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !channel 1
        setx    0x8400000900, %g5, %g3
        set     0x8194, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]
#endif
#ifndef CRC_SB
clear_fbd_Synd_reg_0x63:		! MSA 11/30/06
        setx DRAM_FBD_ERROR_SYNDROME_REGISTER, %g5, %g2
        stx %g0, [%g2]
        stx %g0, [%g2]
	ldx	[%g2], %g5	
#endif
#endif
#ifdef SCRUB_CE
    mov 1, %g2
    sllx %g2, 59, %g2 !DSC
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
    setx 0xffff, %g5, %g2
    and %g2, %g7, %g1
    cmp %g0, %g1
     be %xcc, test_fail
    nop
    setx DRAM_ERROR_ADDRESS_REGISTER, %g5, %g2
    add %g3, %g2, %g2
    ldx [%g2], %g1
#endif

2:
clear_l2_bank_esr_0x63:
    mov 8, %o1
    setx L2_ESR_WRITE_1_TO_CLEAR, %g5, %g3
    setx L2_ERROR_STATUS_REGISTER, %g5, %g4
1:
    stx %g3, [%g4]
    add %g4, 0x40, %g4
    dec %o1
    brnz %o1,1b
    nop
clear_mcu_esr_0x63:
    mov 4, %o1
    setx DRAM_ESR_WRITE_1_TO_CLEAR, %g5, %g3
    setx DRAM_ERROR_STATUS_REGISTER, %g5, %g6
    set 0x1000, %g2
1:
    stx %g3, [%g6]
    ldx	[%g6], %g5	! MSA 
    add %g6, %g2, %g6
    dec %o1
    brnz %o1,1b
    nop

    retry
    nop


!       ***************************************************************************


!         ###           #    #    ###
!        #   #   #    # #    #   #   #
!       #     #   #  #  #    #  #     #
!       #     #    ##   #    #  #     #
!       #     #    ##   ####### #     #
!        #   #    #  #       #   #   #
!         ###    #    #      #    ###



My_H_HT0_Sw_Recoverable_Error_0x40:
    inc %o7 !keep count of traps taken
    mov %g0,%o5

read_core_desr_0x40:
    clr %g5 !use as intermediate register for setx
    ldxa [%g0] 0x4c, %g1 !DESR
    mov %g1, %o0 !copy to be used later
    srlx %g1, 61, %g2
    and %g2, 1, %g2
    cmp %g2, 1
     bne %xcc, test_fail
    nop
    srlx %g1, 56, %g2
    and %g2, 0x1f, %g2
#ifdef ECC_UE
    cmp %g2, 17
     be %xcc, 4f ! branch if you see notdata in DESR, clear L2 notdata register
    nop
    cmp %g2, 16
     bne %xcc, test_fail
    nop
#else
    cmp %g2, 4
     ble %xcc, 2f ! branch normal, check which L2 esr logged, which MCU esr logged
    nop
    cmp %g2, 20
     be %xcc, 2f ! branch normal, check which L2 esr logged, which MCU esr logged
    nop
#endif

#ifdef ECC_UE
4:
clear_l2_notdata_error_register_0x40:
    mov 1,%o5
    mov 8, %o1
    setx L2_NOTDATA_REGISTER_WRITE_1_TO_CLEAR, %g5, %g3
    setx L2_NOTDATA_REGISTER, %g5, %g4
1:
    stx %g3, [%g4]
    add %g4, 0x40, %g4
    dec %o1
    brnz %o1,1b
    nop
    ba 2f		! MSA: 12/04/06; it was bypassing all check to almost end of the handler with "ba 3f"
    nop 
#endif

! find which L2 bank esr is logged
2:
find_l2_bank_0x40:
    !need to find bank
    setx L2_ERROR_STATUS_REGISTER, %g5, %g4
    mov %g4, %o1 !copy to be used later
    setx L2_LAST_ERROR_STATUS_REGISTER, %g5, %g6
    mov 8, %o2
1:
read_l2_bank_esr_0x40:
    ldx [%g4], %g7

#ifdef ECC_CE
    mov 1, %g2
    sllx %g2, 42, %g2 !DAC
    and %g2, %g7, %g3
    cmp %g2, %g3
     be %xcc, 1f
    nop
#endif
#ifdef ECC_UE
    mov 1, %g2
    sllx %g2, 41, %g2 !DAU
    and %g2, %g7, %g3
    cmp %g2, %g3
     be %xcc, 1f
    nop
#endif
#ifdef CRC_RE
    mov 1, %g2
    sllx %g2, 38, %g2 !DSC
    and %g2, %g7, %g3
    cmp %g2, %g3
     be %xcc, 1f
    nop
#endif
#ifdef CRC_UE
#ifdef CRC_SB
    mov 1, %g2
    sllx %g2, 37, %g2 !DSU
    and %g2, %g7, %g3
    cmp %g2, %g3
     be %xcc, 1f
    nop
#endif
#ifdef CRC_NB
    mov 1, %g2
    sllx %g2, 41, %g2 !DAU
    and %g2, %g7, %g3
    cmp %g2, %g3
     be %xcc, 1f
    nop
#endif
#endif
#ifdef SCRUB_UE
    mov 1, %g2
    sllx %g2, 37, %g2 !DSU
    and %g2, %g7, %g3
    cmp %g2, %g3
     be %xcc, 1f
    nop
#endif

    add %g4, 0x40, %g4
    dec %o2
    brnz %o2,1b
    nop
    ba test_fail
    nop
1:
! find which MCU esr is logged
find_mcu_0x40:
    sub %g4, %o1, %o2
    and %o2, 0x180, %g2 !which MCU it is coming from
    mov %g0, %g3
1:
    cmp %g2, %g3
     be %xcc, 1f
    nop
    add %g3, 0x80, %g3
    ba 1b
    nop
1:
    udivx %g3, 0x80, %g3
    setx 0x1000, %g5, %g1
    mulx %g3, %g1, %g3
    setx DRAM_ERROR_STATUS_REGISTER, %g5, %g6
    add %g3, %g6, %g6

read_mcu_esr_0x40:
    ldx [%g6], %g7


! if L2 writes data to MCU with UE in it, MCU marks it by inverting bits at 8221 for ECC,
! so when MCU reads the data back from that address on future read requests, it will know 
! it already has UE error in it, known as poison syndrome. once L2 encounters the 0x8221 syndrome
! it will continuously treat it as notdata, so we do a block store of all zeros
! to the L2 line and a subsequent write/read to that address will then evict the zeros to memory
! and the poison ECC bit will be wiped out

check_mcu_esr_for_poison_syndrome_8221_0x40:
    set 0xffff, %g2
    and %g2, %g7, %g1
    set 0x8221, %g2
    cmp %g1, %g2
    be %xcc, 4f
    nop 

#ifdef ECC_CE
    mov 1, %g2
    sllx %g2, 61, %g2 !DAC
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
    setx 0xffff, %g5, %g2
    and %g2, %g7, %g1
    cmp %g0, %g1
     be %xcc, test_fail
    nop
    setx DRAM_ERROR_RETRY_REGISTER, %g5, %g2
    add %g3, %g2, %g2
    ldx [%g2], %g1
    !and %g1, 0x3, %g1
    !cmp %g1, 2
     !bne test_fail
    !nop
    setx VALID_BIT, %g5, %g1
    stx %g1, [%g2]
#endif
#ifdef ECC_UE
    mov 1, %g2
    sllx %g2, 60, %g2 !DAU
    and %g2, %g7, %g1
    cmp %g2, %g1
     be %xcc, 1f
    nop
    mov 1, %g2
    sllx %g2, 57, %g2 !DBU
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
1:
    setx 0xffff, %g5, %g2
    and %g2, %g7, %g1
    cmp %g0, %g1
     be %xcc, test_fail
    nop
    mov 0x1f, %g2
    sllx %g2, 56, %g2
    and %g2, %o0, %g2
    mov 16, %g1 !L2U
    sllx %g1, 56, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
    setx DRAM_ERROR_RETRY_REGISTER, %g5, %g2
    add %g3, %g2, %g2
    ldx [%g2], %g1
    !and %g1, 0x3, %g1
    !cmp %g1, 3
     !bne test_fail
    !nop
    setx VALID_BIT, %g5, %g1
    stx %g1, [%g2]
#endif
#ifdef CRC_RE
    mov 1, %g2
    sllx %g2, 54, %g2 !FBR
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
    setx DRAM_FBD_ERROR_SYNDROME_REGISTER, %g5, %g2
    add %g3, %g2, %g2
    ldx [%g2], %g1
#ifdef CRC_NB
    and %g1, 0x1, %g1
#endif
#ifdef CRC_SB
    and %g1, 0x2, %g1
#endif
    cmp %g0, %g1
     be test_fail
    nop
! MSA 12/04/06    setx VALID_BIT, %g5, %g1
! Avoid SYND Clear in SB
#ifndef CRC_SB
!    stx %g0, [%g2]  ! MSA 12/04/06; SYND Reg is Write 0 to clear; 12/08/06: move it after AMB Reg Clear
#endif

#ifdef CRC_SB
clear_amb_reg_0x40:
        !First AMB Error Reg
        !channel 0
	setx    0x8400000900, %g5, %g3
	set	0x190, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !channel 1
        setx    0x8400000900, %g5, %g3
        set     0x8190, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !Second AMB Error Reg
        !channel 0
        setx    0x8400000900, %g5, %g3
        set     0x194, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !channel 1
        setx    0x8400000900, %g5, %g3
        set     0x8194, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]
#endif

! MSA 12/08/06
#ifndef CRC_SB
clear_fbd_Synd_reg_0x40_FBR:		! MSA 11/30/06
	setx DRAM_FBD_ERROR_SYNDROME_REGISTER, %g5, %g2
	stx %g0, [%g2]
	stx %g0, [%g2]
	ldx	[%g2], %g5
#endif
#endif
#ifdef CRC_UE
    mov 1, %g2
    sllx %g2, 55, %g2 !FBU
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
    setx DRAM_FBD_ERROR_SYNDROME_REGISTER, %g5, %g2
    add %g3, %g2, %g2
    ldx [%g2], %g1
#ifdef CRC_NB
    and %g1, 0x1, %g1
#endif
#ifdef CRC_SB
    and %g1, 0x2, %g1
#endif
    cmp %g0, %g1
     be test_fail
    nop
    setx VALID_BIT, %g5, %g1
#ifndef CRC_SB
!    stx %g0, [%g2]				! MSA 12/08/06 : move it after AMB Reg Clear 
#endif

#ifdef CRC_SB
clear_amb_reg_0x40:
        !First AMB Error Reg
        !channel 0
	setx    0x8400000900, %g5, %g3
	set	0x190, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !channel 1
        setx    0x8400000900, %g5, %g3
        set     0x8190, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !Second AMB Error Reg
        !channel 0
        setx    0x8400000900, %g5, %g3
        set     0x194, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !channel 1
        setx    0x8400000900, %g5, %g3
        set     0x8194, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]
#endif
! MSA 12/08/06
#ifndef CRC_SB
clear_fbd_Synd_reg_0x40_FBU:		! MSA 11/30/06
	setx DRAM_FBD_ERROR_SYNDROME_REGISTER, %g5, %g2
	stx %g0, [%g2]
	stx %g0, [%g2]
	ldx	[%g2], %g5
#endif
#endif
#ifdef SCRUB_UE
    mov 1, %g2
    sllx %g2, 58, %g2 !DSU
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
    setx 0xffff, %g5, %g2
    and %g2, %g7, %g1
    cmp %g0, %g1
     be %xcc, test_fail
    nop
    setx DRAM_ERROR_ADDRESS_REGISTER, %g5, %g2
    add %g3, %g2, %g2
    ldx [%g2], %g1
#endif


! we need to prefetch ICE (invalidate cache entry) for instruction that had uncorrectable error.
! eventually we need to re-fetch/retrieve the orig. instruction with no errors because we need it
! as it is part of program code. prefetch ice will require doing prefetch of L2 line with prefetch_fcn
! of 0x18 (which is N2 implementation dependent).
! doing prefetch ICE means we will wipe out the entry in L2 cacheline with the dirty bit unset
! so we can then re-fetch the instruction after core issues a retry specified at the end of this trap 
! handler routine. also note that bits [39:37] has to be 011 and way,index,bank will be 
! inside bits [21:18],[17:9],[8:6]
! as such, after we clear out all of the L2 and MCU error status registers, we will issue a retry
! which means we will fetch the instruction once again, assuming that this time verilog injector
! did not inject an uncorrectable error. that is being decided within the injector where we do NOT inject on
! every read (or write) transaction that comes to MCU

2:
prefetch_0x40:
    setx L2_ERROR_ADDRESS_REGISTER, %g5, %o3
    ldx [%o3+%o2], %o4
    setx 0x3ffc0, %g5, %g2
    and %o4, %g2, %g2
    setx PREFETCH_ICE_BASE_ADDRESS, %g5, %g3
    add %g2, %g3, %g3
    mov 1, %g1
    sllx %g1, 18, %g1
    mov 16, %g2
1:
    prefetch [%g3], 0x18
    add %g3, %g1, %g3
    dec %g2
    brnz %g2,1b
    nop
    ba 3f
    nop

! do 8 block stores to clear out data in L2 cacheline, we will issue a retry at the end
! of trap handler because we have wiped out the orig. "uncorrectable" data with all zeros.
! at least, all zeros means it has no more UE associated with it, we will be
! fine the next time around when a write/read comes to that address

4:
do_8_block_stores_0x40:
    setx L2_ERROR_ADDRESS_REGISTER, %g5, %g2
    ldx [%g2+%o2], %g1
    setx 0xffffffffc0, %g5, %g2
    and %g2, %g1, %g1
    mov 8, %o1
1:
    stx %g0, [%g1]
    add %g1, 8, %g1
    dec %o1
    brnz %o1,1b
    nop

3:
clear_l2_bank_esr_0x40:
    mov 8, %o1
    setx L2_ESR_WRITE_1_TO_CLEAR, %g5, %g3
    setx L2_ERROR_STATUS_REGISTER, %g5, %g4
1:
    stx %g3, [%g4]
    add %g4, 0x40, %g4
    dec %o1
    brnz %o1,1b
    nop
clear_mcu_esr_0x40:
    mov 4, %o1
    setx DRAM_ESR_WRITE_1_TO_CLEAR, %g5, %g3
    setx DRAM_ERROR_STATUS_REGISTER, %g5, %g6
    set 0x1000, %g2
1:
    stx %g3, [%g6]
    add %g6, %g2, %g6
    dec %o1
    brnz %o1,1b
    nop

    cmp %o5,1
    be 1f
    nop
    retry
    nop
1:
    done
    nop

!       ***************************************************************************


!My_H_HT0_Instruction_Access_MMU_Error_0x71:
!    inc %o7 !keep count of traps taken

!read_core_isfsr_0x71:
!    clr %g5 !use as intermediate register for setx
!    mov 0x18, %g2
!    ldxa [%g2] 0x50, %g1 !ISFSR
!    mov 0x7, %g3
!    and %g1, %g3, %g3
!    cmp %g3, 6
!	ble %xcc, 1f
!    nop
!    ba test_fail
!    nop


!       ***************************************************************************


!         ###             ###   
!        #   #   #    #  #   # 
!       #     #   #  #  #     #  #####
!       #     #    ##   #     #       #
!       #     #    ##   #     #  ######
!        #   #    #  #   #   #  #     #
!         ###    #    #   ###    ######


My_H_HT0_Instruction_access_error_0x0a:
    inc %o7 !keep count of traps taken
    mov %g0,%o5

read_core_isfsr_0x0a:
    clr %g5 !use as intermediate register for setx
    mov 0x18, %g2
    ldxa [%g2] 0x50, %g1 !ISFSR
    ldxa [%g0] 0x4c, %g4 !DESR
    mov 0x7, %g3
    and %g1, %g3, %g3
    cmp %g3, 1
     be %xcc, 2f  ! branch normal, first check MCU esr, then check L2 esr
    nop
    cmp %g3, 2
     be %xcc, 3f ! branch if you see notdata in DESR, clear L2 notdata register
    nop
    ba test_fail
    nop
    
3:
clear_l2_notdata_error_register_0x0a:
    mov 1,%o5
    mov 8, %o1
    setx L2_NOTDATA_REGISTER_WRITE_1_TO_CLEAR, %g5, %g3
    setx L2_NOTDATA_REGISTER, %g5, %g4
1:
    stx %g3, [%g4]
    add %g4, 0x40, %g4
    dec %o1
    brnz %o1,1b
    nop
    
    ba 2f	! MSA: 12/04/06; it was bypassing all check to almost end of the handler with "ba 3f"
    nop

2:
    stxa %g0, [%g2] 0x50
! find which MCU logged error
find_mcu_0x0a:
    rdpr %tpc, %g1
    mov %g1,%o2 !save a copy
    and %g1, 0x180, %g2 !which MCU it is coming from
    mov %g0, %g3
1:
    cmp %g2, %g3
     be %xcc, 1f
    nop
    add %g3, 0x80, %g3
    ba 1b
    nop
1:
    udivx %g3, 0x80, %g3
    setx 0x1000, %g5, %g1
    mulx %g3, %g1, %g3
    setx DRAM_ERROR_STATUS_REGISTER, %g5, %g6
    add %g3, %g6, %g6

read_mcu_esr_0x0a:
    ldx [%g6], %g7

#ifdef ECC_UE
    mov 1, %g2
    sllx %g2, 60, %g2 !DAU
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
    setx 0xffff, %g5, %g2
    and %g2, %g7, %g1
    cmp %g0, %g1
     be %xcc, test_fail
    nop
    setx DRAM_ERROR_RETRY_REGISTER, %g5, %g2
    add %g3, %g2, %g2
    ldx [%g2], %g1
    !and %g1, 0x3, %g1
    !cmp %g1, 3
     !bne test_fail
    !nop
    setx VALID_BIT, %g5, %g1
    stx %g1, [%g2]
#endif
#ifdef CRC_UE
    mov 1, %g2
    sllx %g2, 55, %g2 !FBU
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
    setx DRAM_FBD_ERROR_SYNDROME_REGISTER, %g5, %g2
    add %g3, %g2, %g2
    ldx [%g2], %g1
#ifdef CRC_NB
    and %g1, 0x1, %g1
#endif
#ifdef CRC_SB
    and %g1, 0x2, %g1
#endif
    cmp %g0, %g1
     be test_fail
    nop
    setx VALID_BIT, %g5, %g1
#ifndef CRC_SB
!    stx %g0, [%g2]   				! MSA 12/08/06: moving at after AMB Reg Clear
#endif

#ifdef CRC_SB
clear_amb_reg_0x0a:
        !First AMB Error Reg
        !channel 0
	setx    0x8400000900, %g5, %g3
	set	0x190, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !channel 1
        setx    0x8400000900, %g5, %g3
        set     0x8190, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !Second AMB Error Reg
        !channel 0
        setx    0x8400000900, %g5, %g3
        set     0x194, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !channel 1
        setx    0x8400000900, %g5, %g3
        set     0x8194, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]
#endif
! MSA 12/08/06
#ifndef CRC_SB
clear_fbd_Synd_reg_0x0a:		! MSA 11/30/06
	setx DRAM_FBD_ERROR_SYNDROME_REGISTER, %g5, %g2
	stx %g0, [%g2]
	stx %g0, [%g2]
	ldx	[%g2], %g5
#endif
#endif
    
! now find which L2 bank logged error
4:
find_l2_bank_0x0a:
    and %o2, 0x1c0, %g2 !which L2 bank it is coming from
    mov %g0, %g3
1:
    cmp %g2, %g3
     be %xcc, 1f
    nop
    add %g3, 0x40, %g3
    ba 1b
    nop
1:
    setx L2_ERROR_STATUS_REGISTER, %g5, %g4
    add %g3, %g4, %g4

read_l2_bank_esr_0x0a:
    ldx [%g4], %g7

#ifdef ECC_UE
    mov 1, %g2
    sllx %g2, 41, %g2 !DAU
    and %g2, %g7, %g3
    cmp %g2, %g3
     bne %xcc, test_fail
    nop
#endif
#ifdef CRC_UE
! CRC unrecoverable error gives DSU if on SB, but DAU if on NB
#ifdef CRC_SB
    mov 1, %g2
    sllx %g2, 37, %g2 !DSU
    and %g2, %g7, %g3
    cmp %g2, %g3
     bne %xcc, test_fail
    nop
#endif
#ifdef CRC_NB
    mov 1, %g2
    sllx %g2, 41, %g2 !DAU
    and %g2, %g7, %g3
    cmp %g2, %g3
     bne %xcc, test_fail
    nop
#endif
#endif

! we need to prefetch ICE (invalidate cache entry) for instruction that had uncorrectable error.
! eventually we need to re-fetch/retrieve the orig. instruction with no errors because we need it
! as it is part of program code. prefetch ice will require doing prefetch of L2 line with prefetch_fcn
! of 0x18 (which is N2 implementation dependent).
! doing prefetch ICE means we will wipe out the entry in L2 cacheline with the dirty bit unset
! so we can then re-fetch the instruction after core issues a retry specified at the end of this trap 
! handler routine. also note that bits [39:37] has to be 011 and way,index,bank will be 
! inside bits [21:18],[17:9],[8:6]
! as such, after we clear out all of the L2 and MCU error status registers, we will issue a retry
! which means we will fetch the instruction once again, assuming that this time verilog injector
! did not inject an uncorrectable error. that is being decided within the injector where we do NOT inject on
! every read (or write) transaction that comes to MCU

prefetch_0x0a:
    setx PREFETCH_ICE_BASE_ADDRESS, %g5, %g3
    setx 0x3ffc0, %g5, %g2
    and %o2, %g2, %g2
    add %g2, %g3, %g3
    mov 1, %g1
    sllx %g1, 18, %g1
    mov 16, %g2
1:
    prefetch [%g3], 0x18
    add %g3, %g1, %g3
    dec %g2
    brnz %g2,1b
    nop
    
3:
clear_l2_bank_esr_0x0a:
    mov 8, %o1
    setx L2_ESR_WRITE_1_TO_CLEAR, %g5, %g3
    setx L2_ERROR_STATUS_REGISTER, %g5, %g4
1:
    stx %g3, [%g4]
    add %g4, 0x40, %g4
    dec %o1
    brnz %o1,1b
    nop
clear_mcu_esr_0x0a:
    mov 4, %o1
    setx DRAM_ESR_WRITE_1_TO_CLEAR, %g5, %g3
    setx DRAM_ERROR_STATUS_REGISTER, %g5, %g6
    set 0x1000, %g2
1:
    stx %g3, [%g6]
    add %g6, %g2, %g6
    dec %o1
    brnz %o1,1b
    nop

    cmp %o5,1
    be 1f
    nop
    retry
    nop
1:
    done
    nop

!       ***************************************************************************


!My_H_HT0_Data_Access_MMU_Error_0x72:
!    inc %o7 !keep count of traps taken

!read_core_dsfsr_0x72:
!    clr %g5 !use as intermediate register for setx
!    mov 0x18, %g2
!    ldxa [%g2] 0x58, %g1 !DSFSR
!    mov 0xf, %g3
!    and %g1, %g3, %g3
!    cmp %g3, 6
!	ble %xcc, 1f
!    nop
!    ba test_fail
!    nop


!       ***************************************************************************


!         ###            #####   #####
!        #   #   #    #       #       #
!       #     #   #  #        #       #
!       #     #    ##    #####   #####
!       #     #    ##         # #
!        #   #    #  #        # #
!         ###    #    #  #####  ######



My_H_HT0_Data_access_error_0x32:
    inc %o7 !keep count of traps taken
    mov %g0,%o5

read_core_dsfsr_0x32:
    clr %g5 !use as intermediate register for setx
    mov 0x18, %g2
    ldxa [%g2] 0x58, %g1 !DSFSR
    ldxa [%g0] 0x4c, %g4 !DESR
    mov 0xf, %g3
    and %g1, %g3, %g3
    cmp %g3, 1
     be %xcc, 2f ! branch normal, first check L2 esr, then check MCU esr
    nop
    cmp %g3, 2
     be %xcc, 4f ! branch if you see notdata in DESR, clear L2 notdata register
    nop
    ba test_fail
    nop

4:
clear_l2_notdata_error_register_0x32:
    mov 1,%o5
    mov 8, %o1
    setx L2_NOTDATA_REGISTER_WRITE_1_TO_CLEAR, %g5, %g3
    setx L2_NOTDATA_REGISTER, %g5, %g4
1:
    stx %g3, [%g4]
    add %g4, 0x40, %g4
    dec %o1
    brnz %o1,1b
    nop

    ba 2f		! MSA: 12/04/06; it was bypassing all check to almost end of the handler with "ba 3f"
    nop

2:
    stxa %g0, [%g2] 0x58
! find which L2 bank logged error
find_l2_bank_0x32:
    setx L2_ERROR_STATUS_REGISTER, %g5, %g4
    mov %g4, %o0 !copy to be used later
    setx L2_LAST_ERROR_STATUS_REGISTER, %g5, %g6
    mov 8, %o1
1:
read_l2_bank_esr_0x32:
    ldx [%g4], %g7

#ifdef ECC_UE
    mov 1, %g2
    sllx %g2, 41, %g2 !DAU
    and %g2, %g7, %g3
    cmp %g2, %g3
     be %xcc, 1f
    nop
#endif
#ifdef CRC_UE
! CRC unrecoverable error gives DSU if on SB, but DAU if on NB
#ifdef CRC_SB
    mov 1, %g2
    sllx %g2, 37, %g2 !DSU
    and %g2, %g7, %g3
    cmp %g2, %g3
	 be %xcc, 1f
    nop
#endif
#ifdef CRC_NB
    mov 1, %g2
    sllx %g2, 41, %g2 !DAU
    and %g2, %g7, %g3
    cmp %g2, %g3
	 be %xcc, 1f
    nop
#endif
#endif

    add %g4, 0x40, %g4
    dec %o1
    brnz %o1,1b
    nop
    ba test_fail
    nop
! now find which MCU logged error
1:
find_mcu_0x32:
    sub %g4, %o0, %o1
    and %o1, 0x180, %g2 !which MCU it is coming from
    mov %g0, %g3
1:
    cmp %g2, %g3
     be %xcc, 1f
    nop
    add %g3, 0x80, %g3
    ba 1b
    nop
1:
    udivx %g3, 0x80, %g3
    setx 0x1000, %g5, %g1
    mulx %g3, %g1, %g3
    setx DRAM_ERROR_STATUS_REGISTER, %g5, %g6
    add %g3, %g6, %g6

read_mcu_esr_0x32:
    ldx [%g6], %g7

#ifdef ECC_UE
    mov 1, %g2
    sllx %g2, 60, %g2 !DAU
    and %g2, %g7, %g1
    cmp %g2, %g1
     be %xcc, 1f
    nop
    mov 1, %g2
    sllx %g2, 57, %g2 !DBU
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
1:
    setx 0xffff, %g5, %g2
    and %g2, %g7, %g1
    cmp %g0, %g1
     be %xcc, test_fail
    nop
    setx DRAM_ERROR_RETRY_REGISTER, %g5, %g2
    add %g3, %g2, %g2
    ldx [%g2], %g1
    !and %g1, 0x3, %g1
    !cmp %g1, 3
     !bne test_fail
    !nop
    setx VALID_BIT, %g5, %g1
    stx %g1, [%g2]
#endif
#ifdef CRC_UE
    mov 1, %g2
    sllx %g2, 55, %g2 !FBU
    and %g2, %g7, %g1
    cmp %g2, %g1
     bne %xcc, test_fail
    nop
    setx DRAM_FBD_ERROR_SYNDROME_REGISTER, %g5, %g2 !clear valid bit for FBD
    add %g3, %g2, %g2
    ldx [%g2], %g1
#ifdef CRC_NB
    and %g1, 0x1, %g1
#endif
#ifdef CRC_SB
    and %g1, 0x2, %g1
#endif
    cmp %g0, %g1
     be test_fail
    nop
    setx VALID_BIT, %g5, %g1
#ifndef CRC_SB
!    stx %g0, [%g2]			! MSA 12/08/06: moving it after AMB Reg clearing
#endif

#ifdef CRC_SB
clear_amb_reg_0x32:
        !First AMB Error Reg
        !channel 0
	setx    0x8400000900, %g5, %g3
	set	0x190, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !channel 1
        setx    0x8400000900, %g5, %g3
        set     0x8190, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !Second AMB Error Reg
        !channel 0
        setx    0x8400000900, %g5, %g3
        set     0x194, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]

        !channel 1
        setx    0x8400000900, %g5, %g3
        set     0x8194, %g4
        stx     %g4, [%g3]

        setx    0x8400000908, %g5, %g3
        set     0xff, %g4
        stx     %g4, [%g3]
#endif
! MSA 12/08/06
#ifndef CRC_SB
clear_fbd_Synd_reg_0x32:		! MSA 11/30/06
	setx DRAM_FBD_ERROR_SYNDROME_REGISTER, %g5, %g2
	stx %g0, [%g2]
	stx %g0, [%g2]
	ldx	[%g2], %g5
#endif
#endif


! do 8 block stores to clear out data in L2 cacheline, we will issue a retry at the end
! of trap handler because we have wiped out the orig. "uncorrectable" data with all zeros.
! at least, all zeros means it has no more UE associated with it, so we will be
! fine the next time around when a write/read comes to that address

2:
do_8_block_stores_0x32:
    setx L2_ERROR_ADDRESS_REGISTER, %g5, %g2
    ldx [%g2+%o1], %g1
    setx 0xffffffffc0, %g5, %g2
    and %g2, %g1, %g1
    mov 8, %o1
1:
    stx %g0, [%g1]
    add %g1, 8, %g1
    dec %o1
    brnz %o1,1b
    nop

3:
clear_l2_bank_esr_0x32:
    mov 8, %o1
    setx L2_ESR_WRITE_1_TO_CLEAR, %g5, %g3
    setx L2_ERROR_STATUS_REGISTER, %g5, %g4
1:
    stx %g3, [%g4]
    add %g4, 0x40, %g4
    dec %o1
    brnz %o1,1b
    nop
clear_mcu_esr_0x32:
    mov 4, %o1
    setx DRAM_ESR_WRITE_1_TO_CLEAR, %g5, %g3
    setx DRAM_ERROR_STATUS_REGISTER, %g5, %g6
    set 0x1000, %g2
1:
    stx %g3, [%g6]
    add %g6, %g2, %g6
    dec %o1
    brnz %o1,1b
    nop

    cmp %o5,1
    be 1f
    nop
    retry
    nop
1:
    done
    nop

!       ***************************************************************************

!       ####### #     # ######
!       #       ##    # #     #
!       #       # #   # #     #
!       #####   #  #  # #     #
!       #       #   # # #     #
!       #       #    ## #     #
!       ####### #     # ######

!       ***************************************************************************
