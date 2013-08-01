/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: old_boot.s
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
#ifndef __BOOT_S__
#define __BOOT_S__

#include "defines.h"
#include "nmacros.h"
#include "asi_s.h"

SECTION .RED TEXT_VA = 0xfffffffff0000000
attr_text {
    Name=.RED,
    hypervisor
}

.global good_trap
.global bad_trap

	
.text
! Nothing appears in position 0
.skip 32 

Power_on_Reset:
    ! Clean out %g1 and reset CCR
    andcc %g0, %g0, %g1
    ! Making room for boot sequence longer than 7 instructions
    ba POR_Annex
    nop
    nop
	
.align 32
Watchdog_Reset:
    done  !ba bad_trap
    nop
    nop
    nop

.align 32
Externally_Initiated_Reset:
    ba bad_trap
    nop
    nop
    nop

.align 32
Software_Initiated_Reset:
    wrhpr %g0, 0x4, %hpstate
    ! Turn on caches
    ldxa [%g0] ASI_LSU_CONTROL, %g6
    or %g6, 0x3, %g6
    ! Turn on speculation
#ifndef NOSPEC_EN
    or %g6, 0x10, %g6
#endif
#ifdef ACTIVATE_ITLB
    ! Set lsu_control_reg.im (bit 2 in ASI 0x45, VA 0x0)
    or %g6, 0x4, %g6
#endif /* ACTIVATE_ITLB */
    stxa %g6, [%g0] ASI_LSU_CONTROL
    done
    nop

.align 32
RED_State_Exception:
    ba bad_trap
    nop
    nop
    nop
END_OF_RED:

	
.align 32
bad_trap:
    ba bad_trap
    nop
    nop
    nop


.align 32
good_trap:
    ba good_trap
    nop
    nop
    nop

.align	32
POR_Annex:			
    ! Reset trap level to not be MAXTL
    wrpr %g0, 0, %tl
    ! Reset Global level to 0
    wrpr %g0, 0, %gl
    ! Turn off RED state
    wrhpr %g0, 0x4, %hpstate
    ! Write HTBA
    setx HTBA, %g1, %g2
    wrhpr %g2, 0, %htba
#ifdef TBA
    ! Write TBA
    setx TBA, %g1, %g2
    wrpr %g2, 0, %tba
#endif /* TBA */
	
    ! Set up Partition IDs for each thread
    ! For MT MMU diags to work. Set partition ID
    ! to be its thread ID
    wr      %g0, ASI_CORE_ID, %asi
    ldxa    [ASI_CORE_ID_VA] %asi, %g1
    
	mov	ASI_PARTITION_ID_VAL, %g2
	stxa	%g1, [%g2] ASI_PARTITION_ID

    ! Turn on Icache/dcache 
    mov 3, %g2
#ifndef NOSPEC_EN
    or %g2, 0x10, %g2
#endif
    stxa %g2, [%g0] ASI_LSU_CONTROL

#ifndef NOPWRMGMT
    ! Power Management - set full power throttle mode ..
pwr_mgmt:
    setx    0x3fff, %g1, %g2
    stxa    %g2, [%g0] ASI_SPARC_PWR_MGMT
#endif

    ! Set translation for HTBA trap table
    !
    setx HTBA, %l1, %i4
    ! Zero out lower 13 bits
    srlx %i4, 13, %i0
    sllx %i0, 13, %i0
    ! Write it to itlb_tag_access register
    ! ASI 0x50, addr 0x30
    setx 0x30, %l1, %i1
    stxa	%i0,	[%i1 + %g0] 0x50
    ! Create tte_data in %i2
    ! sun4v format
    ! Field  V   NFO  L   PA     IE  E CP P W Size
    ! Bit    63  62   61  39:13  12 11 10 8 6 2:0
    !
    ! First set valid and locked bits
    setx 0xA000000000000000, %l1, %i2
    ! Now set up PA
    setx 0x000000FFFFFFE000, %l1, %i5
    and %i4, %i5, %i5
    ! Now merge them
    or %i2, %i5, %i2
    ! Write it to itlb_data_in register
    setx 0x000, %l1, %i3
    stxa    %i2,    [%i3 + %g0] 0x54

	

    ! Set translation for tl>0 portion of HTBA trap table
    !
    setx 0x4000, %l1, %i6
    add %i4, %i6, %i4
    ! Zero out lower 13 bits
    srlx %i4, 13, %i0
    sllx %i0, 13, %i0
    ! Write it to itlb_tag_access register
    ! ASI 0x50, addr 0x30
    setx 0x30, %l1, %i1
    stxa	%i0,	[%i1 + %g0] 0x50
    ! Create tte_data in %i2
    ! sun4v format
    ! Field  V   NFO  L   PA     IE  E CP P W Size
    ! Bit    63  62   61  39:13  12 11 10 8 6 2:0
    !
    ! First set valid and locked bits
    ! Also set page size large enough to cover whole table (bits 14 to 0)
    ! Need page size of 64 KB (2**16)
    setx 0xA000000000000000, %l1, %i2
    !setx 0xA000000000000001, %l1, %i2
    ! Now set up PA
    setx 0x000000FFFFFFE000, %l1, %i5
    and %i4, %i5, %i5
    ! Now merge them
    or %i2, %i5, %i2
    ! Write it to itlb_data_in register
    setx 0x000, %l1, %i3
    stxa    %i2,    [%i3 + %g0] 0x54

	

#ifdef ENABLE_ITLB
    ! Use "-midas_args=-DENABLE_ITLB" on the command line to activate ITLB
    ! Now activate translation
    ! Reset HPSTATE.ENB (bit 11)
    ! rdhpr %hpstate, %i7
    ! and %i7, 0x17FF, %i7
    ! wrhpr %i7, %hpstate
    ! Set lsu_control_reg.im (bit 2 in ASI 0x45, VA 0x0)
    ldxa [%g0] ASI_LSU_CONTROL, %i6
    or %i6, 0x4, %i6
    stxa %i6, [%g0] ASI_LSU_CONTROL
    ! Clean out %i6 - %i7
    andcc %g0, %g0, %i6
    andcc %g0, %g0, %i7
#endif /* ENABLE_ITLB */


#ifdef ENABLE_DTLB	
    ! Use "-midas_args=-DENABLE_DTLB" on the command line to activate DTLB
    ! Now activate translation
    ! Reset HPSTATE.ENB (bit 11)
    ! rdhpr %hpstate, %i7
    ! and %i7, 0x17FF, %i7
    ! wrhpr %i7, %hpstate
    ! Set lsu_control_reg.dm (bit 3 in ASI 0x45, VA 0x0)
    ldxa [%g0] ASI_LSU_CONTROL, %i6
    or %i6, 0x8, %i6
    stxa %i6, [%g0] ASI_LSU_CONTROL
    ! Clean out %i6 - %i7
    andcc %g0, %g0, %i6
    andcc %g0, %g0, %i7
#endif /* ENABLE_DTLB */
	
    ! Clean out %g2
    andcc %g0, %g0, %g2
    ! Clean out %l1
    andcc %g0, %g0, %l1
    ! Clean out %i0 - %i5
    andcc %g0, %g0, %i0
    andcc %g0, %g0, %i1
    andcc %g0, %g0, %i2
    andcc %g0, %g0, %i3
    andcc %g0, %g0, %i4
    andcc %g0, %g0, %i5
	
! $ NO EV trig_pc_d(1,@VA(.RED.end_of_boot)) -> marker(bootEnd, *, 1)
end_of_boot:    
    ! Go to main
    setx DIAG_TEXT_AREA, %g1, %g2
    jmp %g2
    nop
	
	
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Hypervisor trap table	
SECTION .HTRAPTABLE TEXT_VA = HTBA
attr_text {
    Name=.HTRAPTABLE,
    hypervisor
}

.text
htrap_table:		
HTT_000:
	nop
	.align 32
hpower_on_reset:	
HTT_001:
	nop
	.align 32
hwatchdog_reset:	
HTT_002:	
	nop
	.align 32
hexternally_initiated_reset:	
HTT_003:	
	nop
	.align 32
hsoftware_initiatied_reset:	
HTT_004:
	nop
	.align 32
hRED_state_exception:	
HTT_005:		
	nop
	.align 32
HTT_006:	
	nop
	.align 32
HTT_007:		
	nop
	.align 32
hinstruction_access_exception:	
HTT_008:	
	nop
	.align 32
hinstruction_access_MMU_miss:	
HTT_009:	
	nop
	.align 32
hinstruction_access_error:	
HTT_00A:	
	nop
	.align 32
HTT_00B:		
	nop
	.align 32
HTT_00C:		
	nop
	.align 32
HTT_00D:		
	nop
	.align 32
HTT_00E:		
	nop
	.align 32
HTT_00F:		
	nop
	.align 32
hillegal_instruction:
HTT_010:		
	done	
	.align 32
hprivileged_opcode:
HTT_011:		
	nop
	.align 32
HTT_012:		
	nop
	.align 32
HTT_013:		
	nop
	.align 32
HTT_014:		
	nop
	.align 32
HTT_015:		
	nop
	.align 32
HTT_016:		
	nop
	.align 32
HTT_017:		
	nop
	.align 32
HTT_018:		
	nop
	.align 32
HTT_019:		
	nop
	.align 32
HTT_01A:		
	nop
	.align 32
HTT_01B:		
	nop
	.align 32
HTT_01C:		
	nop
	.align 32
HTT_01D:		
	nop
	.align 32
HTT_01E:		
	nop
	.align 32
HTT_01F:		
	nop
	.align 32
	
hfp_disabled:
HTT_020:		
	nop
	.align 32

hfp_exception_ieee_754:	
HTT_021:		
	nop
	.align 32

hfp_exception_other:	
HTT_022:		
	nop
	.align 32

htag_overflow:	
HTT_023:		
	done
	.align 32

hclean_window:	
HTT_024:		
	done
	.align 32
	
.align 128	
hdivision_by_zero:	
HTT_028:
	nop
	.align 32
	
hinternal_processor_error:
HTT_029:
	nop
	.align 32
		
.align 256
hdata_access_exception:
HTT_030:
	done
	.align 32
	
hdata_access_MMU_miss:
HTT_031:
	nop
	.align 32
	
hdata_access_error:
HTT_032:
	nop
	.align 32

hdata_access_protection:
HTT_033:
	nop
	.align 32

mem_address_not_aligned:
HTT_034:
	nop
	.align 32

lddf_mem_address_not_aligned:
HTT_035:
	nop
	.align 32

stdf_mem_address_not_aligned:
HTT_036:
	nop
	.align 32

HTT_037:
	nop
	.align 32

HTT_038:
	nop
	.align 32

HTT_039:
	nop
	.align 32

HTT_03a:
	nop
	.align 32

HTT_03b:
	nop
	.align 32

HTT_03c:
	nop
	.align 32

HTT_03d:
	nop
	.align 32

HTT_03e:
	nop
	.align 32

HTT_03f:
	nop
    done
    nop
	.align 32


.align 2048
HTT_040:
	nop
	
.align 1024	
hinterrupt_vector_trap:	
HTT_060:
	nop
	.align 32

hRA_watchpoint:	
HTT_061:
	nop
	.align 32

hVA_watchpoint:	
HTT_062:
	nop
	.align 32

hECC_error:
HTT_063:
	nop
	.align 32

hfast_instruction_access_MMU_miss:
HTT_064:
	! PA == VA mapping
	! Create tte_tag in %i0
	! Field  Context   VA
	!         60:48   41:0
	! Assume context of 0 for now
	!
	! First get missing VA from itlb_tag_access
	! ASI 0x50, addr 0x30
	mov  0x30, %g1
	ldxa [%g1 + %g0] 0x50, %g4
	
	! Create tte_data in %g2
	! sun4v format
	! Field  V   NFO  L   PA     IE  E CP P W Size
	! Bit    63  62   61  39:13  12 11 10 8 6 2:0
	!
	! First set valid bit
	add  %g0,  1, %g2
	sllx %g2, 63, %g2
	! Now set up PA [39:13] only
	srlx %g4, 13, %g5
	sllx %g5, 37, %g5
	srlx %g5, 24, %g5
	! Now merge them
	or %g2, %g5, %g2
	
	! Write it to itlb_data_in register
	mov  0x000, %g3
	stxa %g2, [%g3 + %g0] 0x54
	retry
	nop	

.align 128
hfast_data_access_MMU_miss:
HTT_068:
	! PA == VA mapping
	! Create tte_tag in %i0
	! Field  Context   VA
	!         60:48   41:0
	! Assume context of 0 for now
	!
	! First get missing VA from dtlb_tag_access
	! ASI 0x58, addr 0x30
	mov  0x30, %g1
	ldxa [%g1 + %g0] 0x58, %g4
	
	! Create tte_data in %g2
	! sun4v format
	! Field  V   NFO  L   PA     IE  E CP P W Size
	! Bit    63  62   61  39:13  12 11 10 8 6 2:0
	!
	! First set valid bit
	add  %g0,  1, %g2
	sllx %g2, 63, %g2
	! Set cacheable in physical and writable bit
	or %g2, 0x440, %g2
	! Now set up PA [39:13] only
	srlx %g4, 13, %g5
	sllx %g5, 37, %g5
	srlx %g5, 24, %g5
	! Now merge them
	or %g2, %g5, %g2
	
	! Write it to dtlb_data_in register
	mov  0x000, %g3
	stxa %g2, [%g3 + %g0] 0x5C
	retry
	nop	

	


.align 4096
HTT_080:
hspill_0_normal:		
	done
	.align 128
HTT_084:			
hspill_1_normal:		
	done
	.align 128
HTT_088:			
hspill_2_normal:		
	done
	.align 128
HTT_08C:			
hspill_3_normal:		
	done
	.align 128
HTT_090:
hspill_4_normal:		
	done
	.align 128
HTT_094:			
hspill_5_normal:		
	done
	.align 128
HTT_098:			
hspill_6_normal:		
	done
	.align 128
HTT_09C:			
hspill_7_normal:		
	done
	.align 128

HTT_0A0:
hspill_0_other:		
	done
	.align 128
HTT_0A4:			
hspill_1_other:		
	done
	.align 128
HTT_0A8:			
hspill_2_other:		
	done
	.align 128
HTT_0AC:			
hspill_3_other:		
	done
	.align 128
HTT_0B0:
hspill_4_other:		
	done
	.align 128
HTT_0B4:			
hspill_5_other:		
	done
	.align 128
HTT_0B8:			
hspill_6_other:		
	done
	.align 128
HTT_0BC:			
hspill_7_other:		
	done
	.align 128

HTT_0C0:
hfill_0_normal:		
	done
	.align 128
HTT_0C4:			
hfill_1_normal:		
	done
	.align 128
HTT_0C8:			
hfill_2_normal:		
	done
	.align 128
HTT_0CC:			
hfill_3_normal:		
	done
	.align 128
HTT_0D0:
hfill_4_normal:		
	done
	.align 128
HTT_0D4:			
hfill_5_normal:		
	done
	.align 128
HTT_0D8:			
hfill_6_normal:		
	done
	.align 128
HTT_0DC:			
hfill_7_normal:		
	done
	.align 128

HTT_0E0:
hfill_0_other:		
	done
	.align 128
HTT_0E4:			
hfill_1_other:		
	done
	.align 128
HTT_0E8:			
hfill_2_other:		
	done
	.align 128
HTT_0EC:			
hfill_3_other:		
	done
	.align 128
HTT_0F0:
hfill_4_other:		
	done
	.align 128
HTT_0F4:			
hfill_5_other:		
	done
	.align 128
HTT_0F8:			
hfill_6_other:		
	done
	.align 128
HTT_0FC:			
hfill_7_other:		
	done
	.align 128


HTT_100:
htcc_000:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_101:
htcc_001:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_102:
htcc_002:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_103:
htcc_003:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_104:
htcc_004:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_105:
htcc_005:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_106:
htcc_006:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_107:
htcc_007:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_108:
htcc_008:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_109:
htcc_009:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_10A:
htcc_010:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_10B:
htcc_011:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_10C:
htcc_012:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_10D:
htcc_013:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_10E:
htcc_014:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_10F:
htcc_015:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_110:
htcc_016:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_111:
htcc_017:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_112:
htcc_018:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_113:
htcc_019:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_114:
htcc_020:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_115:
htcc_021:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_116:
htcc_022:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_117:
htcc_023:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_118:
htcc_024:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_119:
htcc_025:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_11A:
htcc_026:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_11B:
htcc_027:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_11C:
htcc_028:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_11D:
htcc_029:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_11E:
htcc_030:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_11F:
htcc_031:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_120:
htcc_032:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_121:
htcc_033:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_122:
htcc_034:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_123:
htcc_035:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_124:
htcc_036:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_125:
htcc_037:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_126:
htcc_038:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_127:
htcc_039:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_128:
htcc_040:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_129:
htcc_041:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_12A:
htcc_042:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_12B:
htcc_043:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_12C:
htcc_044:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_12D:
htcc_045:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_12E:
htcc_046:
! Function to read thread ID from the
! Thread Status register.
! Value is returned in %o1.
    rd      %asi,   %g1          ! save %asi
    wr      %g0, ASI_CORE_ID, %asi
    ldxa    [ASI_CORE_ID_VA] %asi, %o1
    wr      %g0,    %g1,   %asi  ! restore %asi
#ifdef PORTABLE_CORE
    set     0x07, %g1
#else
    set     0x3f, %g1
#endif
    and     %o1, %g1, %o1
	done
	nop
HTT_12F:
htcc_047:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_130:
htcc_048:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_131:
htcc_049:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_132:
htcc_050:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_133:
htcc_051:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_134:
htcc_052:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_135:
htcc_053:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_136:
htcc_054:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_137:
htcc_055:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_138:
htcc_056:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_139:
htcc_057:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_13A:
htcc_058:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_13B:
htcc_059:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_13C:
htcc_060:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_13D:
htcc_061:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_13E:
htcc_062:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_13F:
htcc_063:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_140:
htcc_064:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_141:
htcc_065:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_142:
htcc_066:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_143:
htcc_067:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_144:
htcc_068:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_145:
htcc_069:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_146:
htcc_070:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_147:
htcc_071:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_148:
htcc_072:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_149:
htcc_073:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_14A:
htcc_074:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_14B:
htcc_075:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_14C:
htcc_076:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_14D:
htcc_077:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_14E:
htcc_078:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_14F:
htcc_079:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_150:
htcc_080:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_151:
htcc_081:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_152:
htcc_082:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_153:
htcc_083:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_154:
htcc_084:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_155:
htcc_085:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_156:
htcc_086:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_157:
htcc_087:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_158:
htcc_088:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_159:
htcc_089:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_15A:
htcc_090:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_15B:
htcc_091:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_15C:
htcc_092:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_15D:
htcc_093:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_15E:
htcc_094:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_15F:
htcc_095:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_160:
htcc_096:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_161:
htcc_097:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_162:
htcc_098:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_163:
htcc_099:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_164:
htcc_100:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_165:
htcc_101:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_166:
htcc_102:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_167:
htcc_103:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_168:
htcc_104:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_169:
htcc_105:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_16A:
htcc_106:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_16B:
htcc_107:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_16C:
htcc_108:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_16D:
htcc_109:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_16E:
htcc_110:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_16F:
htcc_111:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_170:
htcc_112:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_171:
htcc_113:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_172:
htcc_114:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_173:
htcc_115:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_174:
htcc_116:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_175:
htcc_117:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_176:
htcc_118:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_177:
htcc_119:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_178:
htcc_120:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_179:
htcc_121:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_17A:
htcc_122:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_17B:
htcc_123:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_17C:
htcc_124:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_17D:
htcc_125:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_17E:
htcc_126:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
HTT_17F:
htcc_127:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	
TT_180:	
tcc_128:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_181:
tcc_129:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_182:
tcc_130:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_183:
tcc_131:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_184:
tcc_132:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_185:
tcc_133:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_186:
tcc_134:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_187:
tcc_135:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_188:
tcc_136:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_189:
tcc_137:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_18A:
tcc_138:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_18B:
tcc_139:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_18C:
tcc_140:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_18D:
tcc_141:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_18E:
tcc_142:
! Function to read thread ID from the
! Thread Status register.
! Value is returned in %o1.
    rd      %asi,   %g1          ! save %asi
    wr      %g0, ASI_CORE_ID, %asi
    ldxa    [ASI_CORE_ID_VA] %asi, %o1
    wr      %g0,    %g1,   %asi  ! restore %asi
#ifdef PORTABLE_CORE
    set     0x07, %g1
#else
    set     0x3f, %g1
#endif
    and     %o1, %g1, %o1
	done
	nop
TT_18F:
tcc_143:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_190:
tcc_144:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_191:
tcc_145:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_192:
tcc_146:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_193:
tcc_147:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_194:
tcc_148:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_195:
tcc_149:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_196:
tcc_150:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_197:
tcc_151:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_198:
tcc_152:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_199:
tcc_153:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_19A:
tcc_154:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_19B:
tcc_155:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_19C:
tcc_156:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_19D:
tcc_157:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_19E:
tcc_158:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_19F:
tcc_159:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1A0:
tcc_160:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1A1:
tcc_161:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1A2:
tcc_162:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1A3:
tcc_163:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1A4:
tcc_164:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1A5:
tcc_165:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1A6:
tcc_166:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1A7:
tcc_167:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1A8:
tcc_168:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1A9:
tcc_169:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1AA:
tcc_170:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1AB:
tcc_171:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1AC:
tcc_172:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1AD:
tcc_173:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1AE:
tcc_174:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1AF:
tcc_175:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1B0:
tcc_176:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1B1:
tcc_177:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1B2:
tcc_178:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1B3:
tcc_179:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1B4:
tcc_180:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1B5:
tcc_181:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1B6:
tcc_182:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1B7:
tcc_183:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1B8:
tcc_184:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1B9:
tcc_185:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1BA:
tcc_186:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1BB:
tcc_187:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1BC:
tcc_188:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1BD:
tcc_189:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1BE:
tcc_190:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1BF:
tcc_191:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1C0:
tcc_192:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1C1:
tcc_193:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1C2:
tcc_194:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1C3:
tcc_195:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1C4:
tcc_196:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1C5:
tcc_197:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1C6:
tcc_198:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1C7:
tcc_199:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1C8:
tcc_200:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1C9:
tcc_201:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1CA:
tcc_202:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1CB:
tcc_203:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1CC:
tcc_204:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1CD:
tcc_205:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1CE:
tcc_206:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1CF:
tcc_207:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1D0:
tcc_208:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1D1:
tcc_209:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1D2:
tcc_210:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1D3:
tcc_211:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1D4:
tcc_212:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1D5:
tcc_213:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1D6:
tcc_214:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1D7:
tcc_215:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1D8:
tcc_216:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1D9:
tcc_217:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1DA:
tcc_218:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1DB:
tcc_219:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1DC:
tcc_220:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1DD:
tcc_221:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1DE:
tcc_222:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1DF:
tcc_223:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1E0:
tcc_224:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1E1:
tcc_225:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1E2:
tcc_226:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1E3:
tcc_227:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1E4:
tcc_228:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1E5:
tcc_229:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1E6:
tcc_230:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1E7:
tcc_231:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1E8:
tcc_232:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1E9:
tcc_233:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1EA:
tcc_234:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1EB:
tcc_235:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1EC:
tcc_236:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1ED:
tcc_237:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1EE:
tcc_238:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1EF:
tcc_239:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1F0:
tcc_240:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1F1:
tcc_241:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1F2:
tcc_242:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1F3:
tcc_243:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1F4:
tcc_244:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1F5:
tcc_245:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1F6:
tcc_246:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1F7:
tcc_247:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1F8:
tcc_248:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1F9:
tcc_249:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1FA:
tcc_250:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1FB:
tcc_251:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1FC:
tcc_252:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1FD:
tcc_253:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1FE:
tcc_254:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
TT_1FF:
tcc_255:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	
TT_200:
	nop
	.align 32
	
.align 2048
HTT_240:
	nop
	
.align 1024	
hinterrupt_vector_trap_tl_gt_0:	
HTT_260:
	nop
	.align 32

hRA_watchpoint_tl_gt_0:	
HTT_261:
	nop
	.align 32

hVA_watchpoint_tl_gt_0:	
HTT_262:
	nop
	.align 32

hECC_error_tl_gt_0:
HTT_263:
	nop
	.align 32

hfast_instruction_access_MMU_miss_tl_gt_0:
HTT_264:
	ba hfast_instruction_access_MMU_miss
	nop
	.align 32
	
END_OF_HTRAPTABLE:	
	

	
SECTION .MAIN TEXT_VA = DIAG_TEXT_AREA, DATA_VA=DIAG_DATA_AREA
attr_text {
    Name=.MAIN,
    hypervisor
}
attr_data {
    Name=.MAIN,
    hypervisor
}

.text
.global main

#endif /* __BOOT_S__ */

