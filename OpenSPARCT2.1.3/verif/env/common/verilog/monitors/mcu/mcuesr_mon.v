// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcuesr_mon.v
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
module mcuesr_mon();

reg MCUesr_mon_debugon;

initial
begin
MCUesr_mon_debugon = 1 ;//Enabled by default
if($test$plusargs("mcuesr_mon_disable"))
        MCUesr_mon_debugon = 0;
end

wire [25:0]  esr_mcu0 = tb_top.cpu.mcu0.rdpctl.rdpctl_err_sts_reg[25:0];
wire [25:0]  esr_mcu1 = tb_top.cpu.mcu1.rdpctl.rdpctl_err_sts_reg[25:0];
wire [25:0]  esr_mcu2 = tb_top.cpu.mcu2.rdpctl.rdpctl_err_sts_reg[25:0];
wire [25:0]  esr_mcu3 = tb_top.cpu.mcu3.rdpctl.rdpctl_err_sts_reg[25:0];

wire [30:0]  mcu0_fbd_synd = tb_top.cpu.mcu0.fbdic.fbdic_mcu_syndrome[30:0];
wire [30:0]  mcu1_fbd_synd = tb_top.cpu.mcu1.fbdic.fbdic_mcu_syndrome[30:0];
wire [30:0]  mcu2_fbd_synd = tb_top.cpu.mcu2.fbdic.fbdic_mcu_syndrome[30:0];
wire [30:0]  mcu3_fbd_synd = tb_top.cpu.mcu3.fbdic.fbdic_mcu_syndrome[30:0];

 /** Error Status Register***/

always @(esr_mcu0 or MCUesr_mon_debugon)    
begin
	if(MCUesr_mon_debugon  && esr_mcu0)
	begin
		`PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU0)\tError Status Register; Detected");
		`PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU0)\tMCUESR.MEU = %b,MCUESR.MEC = %b",esr_mcu0[25],esr_mcu0[24]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU0)\tMCUESR.DAC = %b,MCUESR.DAU = %b",esr_mcu0[23],esr_mcu0[22]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU0)\tMCUESR.DSC = %b,MCUESR.DSU = %b",esr_mcu0[21],esr_mcu0[20]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU0)\tMCUESR.DBU = %b,MCUESR.MEB = %b",esr_mcu0[19],esr_mcu0[18]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU0)\tMCUESR.FBU = %b,MCUESR.FBR = %b",esr_mcu0[17],esr_mcu0[16]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU0)\tMCUESR.ECC.SYND[15:0] = %h",esr_mcu0[15:0]);
            `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU0)\tMCUESR.FBD.SYND[29:0] = %h", mcu0_fbd_synd[29:0]);
	end
end

always @(esr_mcu1 or MCUesr_mon_debugon)    
begin
	if(MCUesr_mon_debugon  && esr_mcu1)
	begin
		`PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU1)\tError Status Register; Detected");
		`PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU1)\tMCUESR.MEU = %b,MCUESR.MEC = %b",esr_mcu1[25],esr_mcu1[24]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU1)\tMCUESR.DAC = %b,MCUESR.DAU = %b",esr_mcu1[23],esr_mcu1[22]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU1)\tMCUESR.DSC = %b,MCUESR.DSU = %b",esr_mcu1[21],esr_mcu1[20]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU1)\tMCUESR.DBU = %b,MCUESR.MEB = %b",esr_mcu1[19],esr_mcu1[18]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU1)\tMCUESR.FBU = %b,MCUESR.FBR = %b",esr_mcu1[17],esr_mcu1[16]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU1)\tMCUESR.ECC.SYND[15:0] = %h",esr_mcu1[15:0]);
            `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU1)\tMCUESR.FBD.SYND[29:0] = %h", mcu1_fbd_synd[29:0]);
	end
end

always @(esr_mcu2 or MCUesr_mon_debugon)    
begin
	if(MCUesr_mon_debugon  && esr_mcu2)
	begin
		`PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU2)\tError Status Register; Detected");
		`PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU2)\tMCUESR.MEU = %b,MCUESR.MEC = %b",esr_mcu2[25],esr_mcu2[24]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU2)\tMCUESR.DAC = %b,MCUESR.DAU = %b",esr_mcu2[23],esr_mcu2[22]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU2)\tMCUESR.DSC = %b,MCUESR.DSU = %b",esr_mcu2[21],esr_mcu2[20]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU2)\tMCUESR.DBU = %b,MCUESR.MEB = %b",esr_mcu2[19],esr_mcu2[18]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU2)\tMCUESR.FBU = %b,MCUESR.FBR = %b",esr_mcu2[17],esr_mcu2[16]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU2)\tMCUESR.ECC.SYND[15:0] = %h",esr_mcu2[15:0]);
            `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU2)\tMCUESR.FBD.SYND[29:0] = %h", mcu2_fbd_synd[29:0]);
	end
end

always @(esr_mcu3 or MCUesr_mon_debugon)    
begin
	if(MCUesr_mon_debugon  && esr_mcu3)
	begin
		`PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU3)\tError Status Register; Detected");
		`PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU3)\tMCUESR.MEU = %b,MCUESR.MEC = %b",esr_mcu3[25],esr_mcu3[24]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU3)\tMCUESR.DAC = %b,MCUESR.DAU = %b",esr_mcu3[23],esr_mcu3[22]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU3)\tMCUESR.DSC = %b,MCUESR.DSU = %b",esr_mcu3[21],esr_mcu3[20]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU3)\tMCUESR.DBU = %b,MCUESR.MEB = %b",esr_mcu3[19],esr_mcu3[18]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU3)\tMCUESR.FBU = %b,MCUESR.FBR = %b",esr_mcu3[17],esr_mcu3[16]);
	    `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU3)\tMCUESR.ECC.SYND[15:0] = %h",esr_mcu3[15:0]);
            `PR_ALWAYS("MCUesr_mon",`ALWAYS," (MCU3)\tMCUESR.FBD.SYND[29:0] = %h", mcu3_fbd_synd[29:0]);
	end
end

 /** Error Address Register***/

wire [39:0] mcu0_error_addr = { tb_top.cpu.mcu0.rdpctl_err_addr_reg[35:0], { 4{1'b0} } };
wire [39:0] mcu1_error_addr = { tb_top.cpu.mcu1.rdpctl_err_addr_reg[35:0], { 4{1'b0} } };
wire [39:0] mcu2_error_addr = { tb_top.cpu.mcu2.rdpctl_err_addr_reg[35:0], { 4{1'b0} } };
wire [39:0] mcu3_error_addr = { tb_top.cpu.mcu3.rdpctl_err_addr_reg[35:0], { 4{1'b0} } };

always @( mcu0_error_addr )
begin
	if (MCUesr_mon_debugon==1 && (|mcu0_error_addr) )
		`PR_ALWAYS("MCUesr_mon",`ALWAYS,"  (MCU0)\t MCU Error Address Register[39:0] = 0x%h", mcu0_error_addr);
end

always @( mcu1_error_addr )
begin
	if (MCUesr_mon_debugon==1 && (|mcu1_error_addr) )
		`PR_ALWAYS("MCUesr_mon",`ALWAYS,"  (MCU1)\t MCU Error Address Register[39:0] = 0x%h", mcu1_error_addr);
end

always @( mcu2_error_addr )
begin
	if (MCUesr_mon_debugon==1 && (|mcu2_error_addr) )
		`PR_ALWAYS("MCUesr_mon",`ALWAYS,"  (MCU2)\t MCU Error Address Register[39:0] = 0x%h", mcu2_error_addr);
end

always @( mcu3_error_addr )
begin
	if (MCUesr_mon_debugon==1 && (|mcu3_error_addr) )
		`PR_ALWAYS("MCUesr_mon",`ALWAYS,"  (MCU3)\t MCU Error Address Register[39:0] = 0x%h", mcu3_error_addr);
end


endmodule
