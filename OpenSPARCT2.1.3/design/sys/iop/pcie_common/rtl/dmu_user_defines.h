/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: dmu_user_defines.h
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
`define FIRE_TB_PATH `ROOT.

// ASIC_PATH is for setting the path to the ASIC.
// Leave this blank if doing module or ASIC test.
`define FIRE_PATH dut.

// ASIC_INST_PATH is for setting the path to the instance within ASIC.
`define FIRE_JLC_CSR_JCS_JCS_PATH jbc.lt.core.csr.jcs
`define FIRE_DLC_IMU_EQS_A_PATH dmca.lt.core.dmu.imu.eqs
`define FIRE_DLC_IMU_ISS_A_PATH dmca.lt.core.dmu.imu.iss
`define FIRE_DLC_IMU_RDS_INTX_A_PATH dmca.lt.core.dmu.imu.rds.intx
`define FIRE_DLC_IMU_RDS_MSI_A_PATH dmca.lt.core.dmu.imu.rds.msi
`define FIRE_DLC_IMU_RDS_MESS_A_PATH dmca.lt.core.dmu.imu.rds.mess
`define FIRE_DLC_IMU_ICS_A_PATH dmca.lt.core.dmu.imu.ics
`define FIRE_DLC_MMU_CSR_A_PATH dmca.lt.core.dmu.mmu.csr
`define FIRE_DLC_ILU_CIB_A_PATH dmca.lt.core.ilu.cib
`define FIRE_DLC_CRU_A_PATH dmca.lt.core.dmu.cru
`define FIRE_DLC_PSB_A_PATH dmca.lt.core.dmu.psb
`define FIRE_DLC_TSB_A_PATH dmca.lt.core.dmu.tsb
`define FIRE_PLC_TLU_CTB_TLR_A_PATH peca.lt.core.tlu.ctb.tlr
`define FIRE_PLC_TLU_CTB_LPR_A_PATH peca.lt.core.tlu.ctb.lpr
`define FIRE_DLC_IMU_EQS_B_PATH dmcb.lt.core.dmu.imu.eqs
`define FIRE_DLC_IMU_ISS_B_PATH dmcb.lt.core.dmu.imu.iss
`define FIRE_DLC_IMU_RDS_INTX_B_PATH dmcb.lt.core.dmu.imu.rds.intx
`define FIRE_DLC_IMU_RDS_MSI_B_PATH dmcb.lt.core.dmu.imu.rds.msi
`define FIRE_DLC_IMU_RDS_MESS_B_PATH dmcb.lt.core.dmu.imu.rds.mess
`define FIRE_DLC_IMU_ICS_B_PATH dmcb.lt.core.dmu.imu.ics
`define FIRE_DLC_MMU_CSR_B_PATH dmcb.lt.core.dmu.mmu.csr
`define FIRE_DLC_ILU_CIB_B_PATH dmcb.lt.core.ilu.cib
`define FIRE_DLC_CRU_B_PATH dmcb.lt.core.dmu.cru
`define FIRE_DLC_PSB_B_PATH dmcb.lt.core.dmu.psb
`define FIRE_DLC_TSB_B_PATH dmcb.lt.core.dmu.tsb
`define FIRE_PLC_TLU_CTB_TLR_B_PATH pecb.lt.core.tlu.ctb.tlr
`define FIRE_PLC_TLU_CTB_LPR_B_PATH pecb.lt.core.tlu.ctb.lpr


