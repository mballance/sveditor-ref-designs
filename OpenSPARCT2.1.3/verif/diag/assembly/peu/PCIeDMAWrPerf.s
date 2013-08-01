/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeDMAWrPerf.s
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
#define ENABLE_PCIE_LINK_TRAINING
#define ENABLE_PCIE_MPS_512
!!#define SET_PCIE_ACK_FREQ	16
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "peu_defines.h"

#define DMA_DATA_ADDR		   0x0000000123456000
#define	DMA_DATA_BYP_ADDR	   mpeval(IOMMU_BYP_SADDR + DMA_DATA_ADDR)
	
#define DMA_ADDR_0           	   mpeval(DMA_DATA_BYP_ADDR +  0*1024, 16, 16)
#define DMA_ADDR_1           	   mpeval(DMA_DATA_BYP_ADDR +  1*1024, 16, 16)
#define DMA_ADDR_2           	   mpeval(DMA_DATA_BYP_ADDR +  2*1024, 16, 16)
#define DMA_ADDR_3           	   mpeval(DMA_DATA_BYP_ADDR +  3*1024, 16, 16)
#define DMA_ADDR_4           	   mpeval(DMA_DATA_BYP_ADDR +  4*1024, 16, 16)
#define DMA_ADDR_5           	   mpeval(DMA_DATA_BYP_ADDR +  5*1024, 16, 16)
#define DMA_ADDR_6           	   mpeval(DMA_DATA_BYP_ADDR +  6*1024, 16, 16)
#define DMA_ADDR_7           	   mpeval(DMA_DATA_BYP_ADDR +  7*1024, 16, 16)
#define DMA_ADDR_8           	   mpeval(DMA_DATA_BYP_ADDR +  8*1024, 16, 16)
#define DMA_ADDR_9           	   mpeval(DMA_DATA_BYP_ADDR +  9*1024, 16, 16)
#define DMA_ADDR_10          	   mpeval(DMA_DATA_BYP_ADDR + 10*1024, 16, 16)
#define DMA_ADDR_11          	   mpeval(DMA_DATA_BYP_ADDR + 11*1024, 16, 16)
#define DMA_ADDR_12          	   mpeval(DMA_DATA_BYP_ADDR + 12*1024, 16, 16)
#define DMA_ADDR_13          	   mpeval(DMA_DATA_BYP_ADDR + 13*1024, 16, 16)
#define DMA_ADDR_14          	   mpeval(DMA_DATA_BYP_ADDR + 14*1024, 16, 16)
#define DMA_ADDR_15          	   mpeval(DMA_DATA_BYP_ADDR + 15*1024, 16, 16)
#define DMA_ADDR_16          	   mpeval(DMA_DATA_BYP_ADDR + 16*1024, 16, 16)
#define DMA_ADDR_17          	   mpeval(DMA_DATA_BYP_ADDR + 17*1024, 16, 16)
#define DMA_ADDR_18          	   mpeval(DMA_DATA_BYP_ADDR + 18*1024, 16, 16)
#define DMA_ADDR_19          	   mpeval(DMA_DATA_BYP_ADDR + 19*1024, 16, 16)
#define DMA_ADDR_20          	   mpeval(DMA_DATA_BYP_ADDR + 20*1024, 16, 16)
#define DMA_ADDR_21          	   mpeval(DMA_DATA_BYP_ADDR + 21*1024, 16, 16)
#define DMA_ADDR_22          	   mpeval(DMA_DATA_BYP_ADDR + 22*1024, 16, 16)
#define DMA_ADDR_23          	   mpeval(DMA_DATA_BYP_ADDR + 23*1024, 16, 16)
#define DMA_ADDR_24          	   mpeval(DMA_DATA_BYP_ADDR + 24*1024, 16, 16)
#define DMA_ADDR_25          	   mpeval(DMA_DATA_BYP_ADDR + 25*1024, 16, 16)
#define DMA_ADDR_26          	   mpeval(DMA_DATA_BYP_ADDR + 26*1024, 16, 16)
#define DMA_ADDR_27          	   mpeval(DMA_DATA_BYP_ADDR + 27*1024, 16, 16)
#define DMA_ADDR_28          	   mpeval(DMA_DATA_BYP_ADDR + 28*1024, 16, 16)
#define DMA_ADDR_29          	   mpeval(DMA_DATA_BYP_ADDR + 29*1024, 16, 16)
#define DMA_ADDR_30          	   mpeval(DMA_DATA_BYP_ADDR + 30*1024, 16, 16)
#define DMA_ADDR_31          	   mpeval(DMA_DATA_BYP_ADDR + 31*1024, 16, 16)
#define DMA_ADDR_32          	   mpeval(DMA_DATA_BYP_ADDR + 32*1024, 16, 16)
#define DMA_ADDR_33          	   mpeval(DMA_DATA_BYP_ADDR + 33*1024, 16, 16)
#define DMA_ADDR_34          	   mpeval(DMA_DATA_BYP_ADDR + 34*1024, 16, 16)
#define DMA_ADDR_35          	   mpeval(DMA_DATA_BYP_ADDR + 35*1024, 16, 16)
#define DMA_ADDR_36          	   mpeval(DMA_DATA_BYP_ADDR + 36*1024, 16, 16)
#define DMA_ADDR_37          	   mpeval(DMA_DATA_BYP_ADDR + 37*1024, 16, 16)
#define DMA_ADDR_38          	   mpeval(DMA_DATA_BYP_ADDR + 38*1024, 16, 16)
#define DMA_ADDR_39          	   mpeval(DMA_DATA_BYP_ADDR + 39*1024, 16, 16)
#define DMA_ADDR_40          	   mpeval(DMA_DATA_BYP_ADDR + 40*1024, 16, 16)
#define DMA_ADDR_41          	   mpeval(DMA_DATA_BYP_ADDR + 41*1024, 16, 16)
#define DMA_ADDR_42          	   mpeval(DMA_DATA_BYP_ADDR + 42*1024, 16, 16)
#define DMA_ADDR_43          	   mpeval(DMA_DATA_BYP_ADDR + 43*1024, 16, 16)
#define DMA_ADDR_44          	   mpeval(DMA_DATA_BYP_ADDR + 44*1024, 16, 16)
#define DMA_ADDR_45          	   mpeval(DMA_DATA_BYP_ADDR + 45*1024, 16, 16)
#define DMA_ADDR_46          	   mpeval(DMA_DATA_BYP_ADDR + 46*1024, 16, 16)
#define DMA_ADDR_47          	   mpeval(DMA_DATA_BYP_ADDR + 47*1024, 16, 16)
#define DMA_ADDR_48          	   mpeval(DMA_DATA_BYP_ADDR + 48*1024, 16, 16)
#define DMA_ADDR_49          	   mpeval(DMA_DATA_BYP_ADDR + 49*1024, 16, 16)
#define DMA_ADDR_50          	   mpeval(DMA_DATA_BYP_ADDR + 50*1024, 16, 16)
#define DMA_ADDR_51          	   mpeval(DMA_DATA_BYP_ADDR + 51*1024, 16, 16)
#define DMA_ADDR_52          	   mpeval(DMA_DATA_BYP_ADDR + 52*1024, 16, 16)
#define DMA_ADDR_53          	   mpeval(DMA_DATA_BYP_ADDR + 53*1024, 16, 16)
#define DMA_ADDR_54          	   mpeval(DMA_DATA_BYP_ADDR + 54*1024, 16, 16)
#define DMA_ADDR_55          	   mpeval(DMA_DATA_BYP_ADDR + 55*1024, 16, 16)
#define DMA_ADDR_56          	   mpeval(DMA_DATA_BYP_ADDR + 56*1024, 16, 16)
#define DMA_ADDR_57          	   mpeval(DMA_DATA_BYP_ADDR + 57*1024, 16, 16)
#define DMA_ADDR_58          	   mpeval(DMA_DATA_BYP_ADDR + 58*1024, 16, 16)
#define DMA_ADDR_59          	   mpeval(DMA_DATA_BYP_ADDR + 59*1024, 16, 16)
#define DMA_ADDR_60          	   mpeval(DMA_DATA_BYP_ADDR + 60*1024, 16, 16)
#define DMA_ADDR_61          	   mpeval(DMA_DATA_BYP_ADDR + 61*1024, 16, 16)
#define DMA_ADDR_62          	   mpeval(DMA_DATA_BYP_ADDR + 62*1024, 16, 16)
#define DMA_ADDR_63          	   mpeval(DMA_DATA_BYP_ADDR + 63*1024, 16, 16)


/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	! enable bypass in IOMMU
	setx	FIRE_DLC_MMU_CSR_A_CTL_ADDR, %g1, %g2
	setx	FIRE_DLC_MMU_CSR_A_CTL__BYPASS_EN, %g1, %g3
	stx	%g3, [%g2]

	! start the PEU performance counters for DWs read, and clock cycles
	! counter 0:	 count clock cycles
	! counter 1:	 count completions (not really necessary for this diag)
	! counter 2:	 count Received data words
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRFC_ADDR, %g1, %g2
	setx	0x00030201, %g1, %g3
	stx	%g3, [%g2]
	ldx	[%g2], %g3
	
	
! Trigger 64 DMA Writes of 512 bytes each
	
Xmt0:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt0)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_0, DMA_ADDR_0, 64'h200, 1 )
Xmt1:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt1)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_1, DMA_ADDR_1, 64'h200, 1 )
Xmt2:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt2)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_2, DMA_ADDR_2, 64'h200, 1 )
Xmt3:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt3)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_3, DMA_ADDR_3, 64'h200, 1 )
Xmt4:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt4)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_4, DMA_ADDR_4, 64'h200, 1 )
Xmt5:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt5)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_5, DMA_ADDR_5, 64'h200, 1 )
Xmt6:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt6)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_6, DMA_ADDR_6, 64'h200, 1 )
Xmt7:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt7)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_7, DMA_ADDR_7, 64'h200, 1 )
Xmt8:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt8)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_8, DMA_ADDR_8, 64'h200, 1 )
Xmt9:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt9)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_9, DMA_ADDR_9, 64'h200, 1 )
Xmt10:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt10)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_10, DMA_ADDR_10, 64'h200, 1)
Xmt11:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt11)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_11, DMA_ADDR_11, 64'h200, 1)
Xmt12:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt12)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_12, DMA_ADDR_12, 64'h200, 1)
Xmt13:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt13)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_13, DMA_ADDR_13, 64'h200, 1)
Xmt14:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt14)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_14, DMA_ADDR_14, 64'h200, 1)
Xmt15:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt15)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_15, DMA_ADDR_15, 64'h200, 1)
Xmt16:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt16)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_16, DMA_ADDR_16, 64'h200, 1)
Xmt17:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt17)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_17, DMA_ADDR_17, 64'h200, 1)
Xmt18:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt18)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_18, DMA_ADDR_18, 64'h200, 1)
Xmt19:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt19)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_19, DMA_ADDR_19, 64'h200, 1)
Xmt20:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt20)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_20, DMA_ADDR_20, 64'h200, 1)
Xmt21:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt21)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_21, DMA_ADDR_21, 64'h200, 1)
Xmt22:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt22)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_22, DMA_ADDR_22, 64'h200, 1)
Xmt23:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt23)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_23, DMA_ADDR_23, 64'h200, 1)
Xmt24:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt24)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_24, DMA_ADDR_24, 64'h200, 1)
Xmt25:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt25)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_25, DMA_ADDR_25, 64'h200, 1)
Xmt26:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt26)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_26, DMA_ADDR_26, 64'h200, 1)
Xmt27:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt27)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_27, DMA_ADDR_27, 64'h200, 1)
Xmt28:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt28)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_28, DMA_ADDR_28, 64'h200, 1)
Xmt29:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt29)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_29, DMA_ADDR_29, 64'h200, 1)
Xmt30:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt30)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_30, DMA_ADDR_30, 64'h200, 1)
Xmt31:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt31)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_31, DMA_ADDR_31, 64'h200, 1)
Xmt32:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt32)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_32, DMA_ADDR_32, 64'h200, 1)
Xmt33:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt33)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_33, DMA_ADDR_33, 64'h200, 1)
Xmt34:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt34)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_34, DMA_ADDR_34, 64'h200, 1)
Xmt35:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt35)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_35, DMA_ADDR_35, 64'h200, 1)
Xmt36:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt36)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_36, DMA_ADDR_36, 64'h200, 1)
Xmt37:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt37)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_37, DMA_ADDR_37, 64'h200, 1)
Xmt38:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt38)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_38, DMA_ADDR_38, 64'h200, 1)
Xmt39:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt39)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_39, DMA_ADDR_39, 64'h200, 1)
Xmt40:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt40)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_40, DMA_ADDR_40, 64'h200, 1)
Xmt41:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt41)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_41, DMA_ADDR_41, 64'h200, 1)
Xmt42:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt42)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_42, DMA_ADDR_42, 64'h200, 1)
Xmt43:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt43)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_43, DMA_ADDR_43, 64'h200, 1)
Xmt44:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt44)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_44, DMA_ADDR_44, 64'h200, 1)
Xmt45:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt45)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_45, DMA_ADDR_45, 64'h200, 1)
Xmt46:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt46)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_46, DMA_ADDR_46, 64'h200, 1)
Xmt47:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt47)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_47, DMA_ADDR_47, 64'h200, 1)
Xmt48:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt48)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_48, DMA_ADDR_48, 64'h200, 1)
Xmt49:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt49)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_49, DMA_ADDR_49, 64'h200, 1)
Xmt50:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt50)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_50, DMA_ADDR_50, 64'h200, 1)
Xmt51:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt51)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_51, DMA_ADDR_51, 64'h200, 1)
Xmt52:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt52)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_52, DMA_ADDR_52, 64'h200, 1)
Xmt53:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt53)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_53, DMA_ADDR_53, 64'h200, 1)
Xmt54:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt54)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_54, DMA_ADDR_54, 64'h200, 1)
Xmt55:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt55)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_55, DMA_ADDR_55, 64'h200, 1)
Xmt56:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt56)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_56, DMA_ADDR_56, 64'h200, 1)
Xmt57:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt57)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_57, DMA_ADDR_57, 64'h200, 1)
Xmt58:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt58)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_58, DMA_ADDR_58, 64'h200, 1)
Xmt59:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt59)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_59, DMA_ADDR_59, 64'h200, 1)
Xmt60:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt60)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_60, DMA_ADDR_60, 64'h200, 1)
Xmt61:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt61)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_61, DMA_ADDR_61, 64'h200, 1)
Xmt62:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt62)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_62, DMA_ADDR_62, 64'h200, 1)
Xmt63:	nop ! $EV trig_pc_d(1, @VA(.MAIN.Xmt63)) -> EnablePCIeIgCmd ("DMAWR", DMA_ADDR_63, DMA_ADDR_63, 64'h200, 1)

	! read the performance counter for # DWs read, until the
	! expected # of DWs is reached.
	
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRFC_ADDR, %g1, %g2
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF0_ADDR, %g1, %g3
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF1_ADDR, %g1, %g4
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TLU_PRF2_ADDR, %g1, %g5
	mov	0x40, %g6		! loop 64 times
	!setx	0x1fff, %g1, %g7	! number of (4 byte) DWs expected - 1
	setx	0xffffffffffffe000, %g1, %g7	! complement

delay_loop:
	ldx	[%g3], %l1		! PIU Perf Cntr 0 read - clock cycles
	!ldx	[%g4], %l2		! PIU Perf Cntr 1 read
	ldx	[%g5], %l3		! PIU Perf Cntr 2 read - transmitted data words

	! check if all DWs or Words have been transmitted
	andcc	%l3, %g7, %l4
	bne	done			! done if %l2 is greater than %g7
	nop
	
	dec	%g6			! decrement counter
	brnz	%g6, delay_loop		! loop if not zero
	nop

done:
	stx	%g0, [%g2]		! turn off performance counters
	
	nop				! divide # DWs by clocks or vise versa?  TBD
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
************************************************************************/

!SECTION       .DATA DATA_VA=DMA_DATA_ADDR
!attr_data {     
!      Name = .DATA,
!      hypervisor,
!      compressimage
!}
!.data
!	init_mem(0x0101010201030104, 1024*8, 8, +, 0, +, 0x0001000100010001)

/************************************************************************/
