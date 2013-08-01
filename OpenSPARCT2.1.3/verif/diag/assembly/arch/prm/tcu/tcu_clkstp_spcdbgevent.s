/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_clkstp_spcdbgevent.s
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
#define H_HT0_Control_Transfer_Instr_0x74  My_Control_Transfer_Instr_trap_hdler
		   
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_NUCLEUS_ALSO

	
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main
.global My_Control_Transfer_Instr_trap_hdler

main:		/* test begin */

	ta	T_CHANGE_HPRIV

!------- delay loop for vera program ------
#ifdef VERA_PROG_DEL
   setx VERA_PROG_DEL, %g6, %g7
1:
   dec %g7
   brnz %g7, 1b
   nop
#endif

!--- set the pstate.tct bit ---
    rdpr %pstate, %g1      ! pstate: Processor State Reg (see 3.2.2 of PRM)
    or   %g1, 0x1000, %g1  ! bit 12 or Trap on Control Transfer (ie. branching) bit of pstate Reg
    wrpr %g1, %pstate

!--- program core DECR (Debug Event Control Reg). core DECR is one per core-----
#ifdef SPC_HARDSTOP
write_DECR_to_enable_hardstop:
    setx 0xaaaa800000000000, %g1, %g3 ! hard stop: 2'b10. Core DECR: [63:46]: debug event enable, [45:0]: reserved
    setx 0x8, %g1, %g2                ! core DECR: VA address is 0x8
    stxa %g3, [%g2]0x45               ! core DECR: ASI is 0x45
    nop
    membar #Sync
    nop
    ba jump1  !!! branch will generate a spc debug event
    nop
#endif

#ifdef SPC_SOFTSTOP
write_DECR_to_enable_softstop:
    setx 0x5555400000000000, %g1, %g3 ! soft stop: 2'b01. Core DECR: [63:46]: debug event enable, [45:0]: reserved
    setx 0x8, %g1, %g2                ! core DECR: VA address is 0x8
    stxa %g3, [%g2]0x45               ! core DECR: ASI is 0x45
    nop
    membar #Sync
    nop	
    ba jump1  !!! branch will generate a spc debug event
    nop	
#endif

#ifdef SPC_TRIGOUT
write_DECR_to_enable_trigout:
    setx 0xffffc00000000000, %g1, %g3 ! trigout: 2'b11. Core DECR: [63:46]: debug event enable, [45:0]:	reserved
    setx 0x8, %g1, %g2                ! core DECR: VA address is 0x8
    stxa %g3, [%g2]0x45               ! core DECR: ASI is 0x45
    nop
    membar #Sync
    nop
    ba jump1  !!! branch will generate a spc debug event
    nop
#endif		

jump1:
    nop
    nop
    nop
    !--- clear the pstate.tct bit ---
    rdpr %pstate, %g1      ! pstate: Processor State Reg (see 3.2.2 of PRM)
    and  %g1, 0xffffffffffffefff, %g1  ! clear bit 12 or Trap on Control Transfer (ie. branching) bit of pstate Reg
    wrpr %g1, %pstate
    nop
    nop

jump2:
    nop
    nop
    nop
    nop

!------- delay loop for vera program ------
#ifdef VERA_PROG_DEL2
   setx VERA_PROG_DEL2, %g6, %g7
1:
   dec %g7
   brnz %g7, 1b
   nop
#endif	
		
diag_pass:  
    EXIT_GOOD
        
diag_fail:
    EXIT_BAD

/************************************************************************
 * Trap handlers	
 ************************************************************************/

My_Control_Transfer_Instr_trap_hdler:
	nop
	done
	nop
	
  
/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.xword 0xFFFFFFFFFFFFFFFF
.end
