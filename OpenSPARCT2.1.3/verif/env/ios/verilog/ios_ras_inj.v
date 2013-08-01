// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ios_ras_inj.v
// Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
// 4150 Network Circle, Santa Clara, California 95054, U.S.A.
//
// * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// 
// For the avoidance of doubt, and except that if any non-GPL license 
// choice is available it will apply instead, Sun elects to use only 
// the General Public License version 2 (GPLv2) at this time for any 
// software where a choice of GPL license versions is made 
// available with the language indicating that GPLv2 or any later version 
// may be used, or where a choice of which version of the GPL is applied is 
// otherwise unspecified. 
//
// Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
// CA 95054 USA or visit www.sun.com if you need additional information or 
// have any questions. 
// 
// ========== Copyright Header End ============================================
task SetNiuSiiData15;
input value;
reg  value;
begin
    force `CPU.niu_sii_data[15] = value;
end
endtask

task RelNiuSiiData15;
begin
    release `CPU.niu_sii_data[15];
end
endtask

task SetNiuSiiDP0;
input value;
reg  value;
begin
    force `CPU.niu_sii_parity[0] = value;
end
endtask

task RelNiuSiiDP0;
begin
    release `CPU.niu_sii_parity[0];
end
endtask

task SetDmuSiiDP0;
input value;
reg  value;
begin
    force `CPU.dmu_sii_parity[0] = value;
end
endtask

task RelDmuSiiDP0;
begin
    release `CPU.dmu_sii_parity[0];
end
endtask

task SetDmuSiiBEP;
input value;
reg  value;
begin
    force `CPU.dmu_sii_be_parity = value;
end
endtask

task RelDmuSiiBEP;
begin
    release `CPU.dmu_sii_be_parity;
end
endtask

task SetNiuSiiAP0;
input value;
reg  value;
begin
    force `CPU.niu_sii_data[83] = value;
end
endtask

task RelNiuSiiAP0;
begin
    release `CPU.niu_sii_data[83];
end
endtask

task SetNiuSiiCMDP;
input value;
reg  value;
begin
    force `CPU.niu_sii_data[62] = value;
end
endtask

task RelNiuSiiCMDP;
begin
    release `CPU.niu_sii_data[62];
end
endtask

task SetNiuSiiIOAE;
begin
    force `CPU.niu_sii_data[81] = 1'b1;
end
endtask

task RelNiuSiiIOAE;
begin
    release `CPU.niu_sii_data[81];
end
endtask

task SetNiuSiiIOUE;
begin
    force `CPU.niu_sii_data[80] = 1'b1;
end
endtask

task RelNiuSiiIOUE;
begin
    release `CPU.niu_sii_data[80];
end
endtask

task SetDmuSiiIOAE;
begin
    force `CPU.dmu_sii_data[81] = 1'b1;
end
endtask

task RelDmuSiiIOAE;
begin
    release `CPU.dmu_sii_data[81];
end
endtask

task SetDmuSiiIOUE;
begin
    force `CPU.dmu_sii_data[80] = 1'b1;
end
endtask

task RelDmuSiiIOUE;
begin
    release `CPU.dmu_sii_data[80];
end
endtask

task SetDmuSiiTOUT;
begin
    force `CPU.dmu_sii_data[82] = 1'b1;
end
endtask

task RelDmuSiiTOUT;
begin
    release `CPU.dmu_sii_data[82];
end
endtask

task SetDmuSiiAP0;
input value;
reg  value;
begin
    force `CPU.dmu_sii_data[83] = value;
end
endtask

task RelDmuSiiAP0;
begin
    release `CPU.dmu_sii_data[83];
end
endtask

task SetDmuSiiCMDP;
input value;
reg  value;
begin
    force `CPU.dmu_sii_data[62] = value;
end
endtask

task RelDmuSiiCMDP;
begin
    release `CPU.dmu_sii_data[62];
end
endtask

task SetNiuSiiCECC0;
input value;
reg  value;
begin
    force `CPU.niu_sii_data[56] = value;
end
endtask

task RelNiuSiiCECC0;
begin
    release `CPU.niu_sii_data[56];
end
endtask

task SetDmuSiiCECC0;
input value;
reg  value;
begin
    force `CPU.dmu_sii_data[56] = value;
end
endtask

task RelDmuSiiCECC0;
begin
    release `CPU.dmu_sii_data[56];
end
endtask

task SetNiuSiiCECC1;
input value;
reg  value;
begin
    force `CPU.niu_sii_data[57] = value;
end
endtask

task RelNiuSiiCECC1;
begin
    release `CPU.niu_sii_data[57];
end
endtask

task SetDmuSiiCECC1;
input value;
reg  value;
begin
    force `CPU.dmu_sii_data[57] = value;
end
endtask

task RelDmuSiiCECC1;
begin
    release `CPU.dmu_sii_data[57];
end
endtask

task SetSioNiuDP0;
input value;
reg  value;
begin
    $dispmon ("IOS-RAS", 20, " force sio_niu_parity[0] = %1d", value);
    force `CPU.sio_niu_parity[0] = value;
end
endtask

task RelSioNiuDP0;
begin
    $dispmon ("IOS-RAS", 20, " release sio_niu_parity[0]");
    release `CPU.sio_niu_parity[0];
end
endtask

task SetSioDmuDP0;
input value;
reg  value;
begin
    force `CPU.sio_dmu_parity[0] = value;
end
endtask

task RelSioDmuDP0;
begin
    release `CPU.sio_dmu_parity[0];
end
endtask

task SetSioNiuCECC0;
input value;
reg  value;
begin
    force `CPU.sio_niu_data[56] = value;
end
endtask

task RelSioNiuCECC0;
begin
    release `CPU.sio_niu_data[56];
end
endtask

task SetSioDmuCECC0;
input value;
reg  value;
begin
    force `CPU.sio_dmu_data[56] = value;
end
endtask

task RelSioDmuCECC0;
begin
    release `CPU.sio_dmu_data[56];
end
endtask

task SetSioNiuCECC1;
input value;
reg  value;
begin
    force `CPU.sio_niu_data[57] = value;
end
endtask

task RelSioNiuCECC1;
begin
    release `CPU.sio_niu_data[57];
end
endtask

task SetSioDmuCECC1;
input value;
reg  value;
begin
    force `CPU.sio_dmu_data[57] = value;
end
endtask

task RelSioDmuCECC1;
begin
    release `CPU.sio_dmu_data[57];
end
endtask

task SetL2SioDP0;
input value;
input bank;
reg value;
integer bank;
begin
  case (bank)
	0: force `SIO.l2b0_sio_parity[0] = value;
	1: force `SIO.l2b1_sio_parity[0] = value;
	2: force `SIO.l2b2_sio_parity[0] = value;
	3: force `SIO.l2b3_sio_parity[0] = value;
	4: force `SIO.l2b4_sio_parity[0] = value;
	5: force `SIO.l2b5_sio_parity[0] = value;
	6: force `SIO.l2b6_sio_parity[0] = value;
	7: force `SIO.l2b7_sio_parity[0] = value;
  endcase
end
endtask

task RelL2SioDP0;
input bank;
integer bank;
begin
  case (bank)
	0: release `SIO.l2b0_sio_parity[0];
	1: release `SIO.l2b1_sio_parity[0];
	2: release `SIO.l2b2_sio_parity[0];
	3: release `SIO.l2b3_sio_parity[0];
	4: release `SIO.l2b4_sio_parity[0];
	5: release `SIO.l2b5_sio_parity[0];
	6: release `SIO.l2b6_sio_parity[0];
	7: release `SIO.l2b7_sio_parity[0];
  endcase
end
endtask

task SetL2SioEBIT;
input value;
input bank;
reg value;
integer bank;
begin
  case (bank)
	0: force `SIO.l2b0_sio_data[21] = value;
	1: force `SIO.l2b1_sio_data[21] = value;
	2: force `SIO.l2b2_sio_data[21] = value;
	3: force `SIO.l2b3_sio_data[21] = value;
	4: force `SIO.l2b4_sio_data[21] = value;
	5: force `SIO.l2b5_sio_data[21] = value;
	6: force `SIO.l2b6_sio_data[21] = value;
	7: force `SIO.l2b7_sio_data[21] = value;
  endcase
end
endtask

task RelL2SioEBIT;
input bank;
integer bank;
begin
  case (bank)
	0: release `SIO.l2b0_sio_data[21];
	1: release `SIO.l2b1_sio_data[21];
	2: release `SIO.l2b2_sio_data[21];
	3: release `SIO.l2b3_sio_data[21];
	4: release `SIO.l2b4_sio_data[21];
	5: release `SIO.l2b5_sio_data[21];
	6: release `SIO.l2b6_sio_data[21];
	7: release `SIO.l2b7_sio_data[21];
  endcase
end
endtask

task SetL2SioCECC0;
input value;
input bank;
reg value;
integer bank;
begin
  case (bank)
	0: force `SIO.l2b0_sio_data[25] = value;
	1: force `SIO.l2b1_sio_data[25] = value;
	2: force `SIO.l2b2_sio_data[25] = value;
	3: force `SIO.l2b3_sio_data[25] = value;
	4: force `SIO.l2b4_sio_data[25] = value;
	5: force `SIO.l2b5_sio_data[25] = value;
	6: force `SIO.l2b6_sio_data[25] = value;
	7: force `SIO.l2b7_sio_data[25] = value;
  endcase
end
endtask

task SetL2SioCECC1;
input value;
input bank;
reg value;
integer bank;
begin
  case (bank)
	0: force `SIO.l2b0_sio_data[26] = value;
	1: force `SIO.l2b1_sio_data[26] = value;
	2: force `SIO.l2b2_sio_data[26] = value;
	3: force `SIO.l2b3_sio_data[26] = value;
	4: force `SIO.l2b4_sio_data[26] = value;
	5: force `SIO.l2b5_sio_data[26] = value;
	6: force `SIO.l2b6_sio_data[26] = value;
	7: force `SIO.l2b7_sio_data[26] = value;
  endcase
end
endtask

task RelL2SioCECC0;
input bank;
integer bank;
begin
  case (bank)
	0: release `SIO.l2b0_sio_data[25];
	1: release `SIO.l2b1_sio_data[25];
	2: release `SIO.l2b2_sio_data[25];
	3: release `SIO.l2b3_sio_data[25];
	4: release `SIO.l2b4_sio_data[25];
	5: release `SIO.l2b5_sio_data[25];
	6: release `SIO.l2b6_sio_data[25];
	7: release `SIO.l2b7_sio_data[25];
  endcase
end
endtask

task RelL2SioCECC1;
input bank;
integer bank;
begin
  case (bank)
	0: release `SIO.l2b0_sio_data[26];
	1: release `SIO.l2b1_sio_data[26];
	2: release `SIO.l2b2_sio_data[26];
	3: release `SIO.l2b3_sio_data[26];
	4: release `SIO.l2b4_sio_data[26];
	5: release `SIO.l2b5_sio_data[26];
	6: release `SIO.l2b6_sio_data[26];
	7: release `SIO.l2b7_sio_data[26];
  endcase
end
endtask

task SetSiiNcuDP0;
input value;
reg value;
begin
	force `CPU.sii_ncu_dparity[0] = value;
end
endtask

task RelSiiNcuDP0;
begin
	release `CPU.sii_ncu_dparity[0];
end
endtask

task SetSiiNcuCECC0;
input value;
reg value;
begin
	force `CPU.sii_ncu_data[16] = value;
end
endtask

task RelSiiNcuCECC0;
begin
	release `CPU.sii_ncu_data[16];
end
endtask

task SetSiiNcuCECC1;
input value;
reg value;
begin
	force `CPU.sii_ncu_data[17] = value;
end
endtask

task RelSiiNcuCECC1;
begin
	release `CPU.sii_ncu_data[17];
end
endtask

task SetDmuNcuWRACKPAR;
input value;
reg value;
begin
	force `CPU.dmu_ncu_wrack_par = value;
end
endtask

task RelDmuNcuWRACKPAR;
begin
	release `CPU.dmu_ncu_wrack_par;
end
endtask

task SetNcuDmuMONDOPAR;
input value;
reg value;
begin
	force `CPU.ncu_dmu_mondo_id_par = value;
end
endtask

task RelNcuDmuMONDOPAR;
begin
	release `CPU.ncu_dmu_mondo_id_par;
end
endtask

task SetSiiDmuWRACKPAR;
input value;
reg value;
begin
	force `CPU.sii_dmu_wrack_parity = value;
end
endtask

task RelSiiDmuWRACKPAR;
begin
	release `CPU.sii_dmu_wrack_parity;
end
endtask
